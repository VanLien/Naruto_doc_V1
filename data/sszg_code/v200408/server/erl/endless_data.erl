-file("src/mod/data/endless_data.erl", 1).

-module(endless_data).

-lager_records([{endless_robot_data,
		 [id, bid, rname, group_id, unit_id, lev, star, quality,
		  power]},
		{endless_employ,
		 [id, rid, rname, bid, plev, star, quality, break_lev,
		  power, num, ext]},
		{endless_data,
		 [type, id, name, lev, unit_ids, is_reset, formation]},
		{new_endless,
		 [ver, type, max_id, ext_reward, day_begin, day_pass,
		  ext]},
		{m_endless,
		 [ver, r_id, max_id, ext_reward, day_begin, day_pass,
		  day_reward, employ, appoint, type, select_type,
		  new_endless_list, ext, flag]}]).

-export([get_const/1, get/1, list_ext_reward/0,
	 ext_reward/1, get_buff/1, buff_type/1, day_reward/1,
	 rank_reward/1, robot_group/1, robot_list/1, get_robot/1,
	 get_all_type/0, get_all_day/0,
	 get_limit_partner_list/1]).

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

-file("src/mod/data/endless_data.erl", 23).

-file("inc/endless.hrl", 1).

-record(m_endless,
	{ver = 2  :: pos_integer(), r_id = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(),
	 day_reward = []  :: list(), employ = []  :: list(),
	 appoint = []  :: list(), type = 0  :: pos_integer(),
	 select_type = 0  :: pos_integer(),
	 new_endless_list = []  :: list(), ext = []  :: list(),
	 flag = 0  :: pos_integer()}).

-record(new_endless,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(), ext = []  :: list()}).

-record(endless_data,
	{type = 0, id = 0, name = <<>>, lev = 0, unit_ids = [],
	 is_reset = 0, formation = undefined}).

-record(endless_employ,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, rname = <<>>,
	 bid = 0, plev = 0, star = 0, quality = 0, break_lev = 0,
	 power = 0, num = 0, ext = []}).

-record(endless_robot_data,
	{id = 0, bid = 0, rname = <<>>, group_id = 0,
	 unit_id = 0, lev = 0, star = 0, quality = 0,
	 power = 0}).

-file("src/mod/data/endless_data.erl", 24).

get_const(open_lev) -> [{lev, 25}];
get_const(endless_new_limit) -> 200;
get_const(endless_new_max_pass) -> 35;
get_const(endless_new_limit_lev) -> 90;
get_const(endless_new_show_limit) -> 80;
get_const(backoff_num) -> 10;
get_const(dayreward_roundnum) -> 5;
get_const(buffchoice_interval) -> 5;
get_const(reward_show) -> {10450, 22, 1};
get_const(support_reward_limit) -> 5;
get_const(max_roundnum) -> 900;
get_const(support_reward) -> 10;
get_const(self_support_reward) -> [{1, 50000}];
get_const(new_max_roundnum) -> 500;
get_const(endless_start_date) ->
    {{2021, 8, 13}, {0, 0, 0}};
get_const(clearance_show) -> {22, 10403};
get_const(daily_show) -> {22, 1};
get_const(ranking_show) -> {22, 10450};
get_const(_) -> undefined.

get({5, 1}) ->
    #endless_data{type = 5, id = 1,
		  name = lang:get(<<"第1波"/utf8>>), lev = 25,
		  unit_ids = [60101], is_reset = 0, formation = {1, 1}};
get({5, 2}) ->
    #endless_data{type = 5, id = 2,
		  name = lang:get(<<"第2波"/utf8>>), lev = 25,
		  unit_ids = [60102], is_reset = 0, formation = {1, 1}};
get({5, 3}) ->
    #endless_data{type = 5, id = 3,
		  name = lang:get(<<"第3波"/utf8>>), lev = 26,
		  unit_ids = [60103], is_reset = 0, formation = {1, 1}};
get({5, 4}) ->
    #endless_data{type = 5, id = 4,
		  name = lang:get(<<"第4波"/utf8>>), lev = 27,
		  unit_ids = [60104], is_reset = 0, formation = {1, 1}};
get({5, 5}) ->
    #endless_data{type = 5, id = 5,
		  name = lang:get(<<"第5波"/utf8>>), lev = 27,
		  unit_ids = [60105], is_reset = 0, formation = {1, 1}};
get({5, 6}) ->
    #endless_data{type = 5, id = 6,
		  name = lang:get(<<"第6波"/utf8>>), lev = 28,
		  unit_ids = [60106], is_reset = 0, formation = {1, 1}};
get({5, 7}) ->
    #endless_data{type = 5, id = 7,
		  name = lang:get(<<"第7波"/utf8>>), lev = 29,
		  unit_ids = [60107], is_reset = 0, formation = {1, 1}};
get({5, 8}) ->
    #endless_data{type = 5, id = 8,
		  name = lang:get(<<"第8波"/utf8>>), lev = 29,
		  unit_ids = [60108], is_reset = 0, formation = {1, 1}};
get({5, 9}) ->
    #endless_data{type = 5, id = 9,
		  name = lang:get(<<"第9波"/utf8>>), lev = 30,
		  unit_ids = [60109], is_reset = 0, formation = {1, 1}};
get({5, 10}) ->
    #endless_data{type = 5, id = 10,
		  name = lang:get(<<"第10波"/utf8>>), lev = 31,
		  unit_ids = [60110], is_reset = 0, formation = {1, 1}};
get({5, 11}) ->
    #endless_data{type = 5, id = 11,
		  name = lang:get(<<"第11波"/utf8>>), lev = 32,
		  unit_ids = [60111], is_reset = 0, formation = {1, 1}};
get({5, 12}) ->
    #endless_data{type = 5, id = 12,
		  name = lang:get(<<"第12波"/utf8>>), lev = 32,
		  unit_ids = [60112], is_reset = 0, formation = {1, 1}};
get({5, 13}) ->
    #endless_data{type = 5, id = 13,
		  name = lang:get(<<"第13波"/utf8>>), lev = 33,
		  unit_ids = [60113], is_reset = 0, formation = {1, 1}};
get({5, 14}) ->
    #endless_data{type = 5, id = 14,
		  name = lang:get(<<"第14波"/utf8>>), lev = 34,
		  unit_ids = [60114], is_reset = 0, formation = {1, 1}};
get({5, 15}) ->
    #endless_data{type = 5, id = 15,
		  name = lang:get(<<"第15波"/utf8>>), lev = 34,
		  unit_ids = [60115], is_reset = 0, formation = {1, 1}};
get({5, 16}) ->
    #endless_data{type = 5, id = 16,
		  name = lang:get(<<"第16波"/utf8>>), lev = 35,
		  unit_ids = [60116], is_reset = 0, formation = {1, 1}};
get({5, 17}) ->
    #endless_data{type = 5, id = 17,
		  name = lang:get(<<"第17波"/utf8>>), lev = 36,
		  unit_ids = [60117], is_reset = 0, formation = {1, 1}};
get({5, 18}) ->
    #endless_data{type = 5, id = 18,
		  name = lang:get(<<"第18波"/utf8>>), lev = 36,
		  unit_ids = [60118], is_reset = 0, formation = {1, 1}};
get({5, 19}) ->
    #endless_data{type = 5, id = 19,
		  name = lang:get(<<"第19波"/utf8>>), lev = 37,
		  unit_ids = [60119], is_reset = 0, formation = {1, 1}};
get({5, 20}) ->
    #endless_data{type = 5, id = 20,
		  name = lang:get(<<"第20波"/utf8>>), lev = 38,
		  unit_ids = [60120], is_reset = 0, formation = {1, 1}};
get({5, 21}) ->
    #endless_data{type = 5, id = 21,
		  name = lang:get(<<"第21波"/utf8>>), lev = 39,
		  unit_ids = [60121], is_reset = 0, formation = {1, 1}};
get({5, 22}) ->
    #endless_data{type = 5, id = 22,
		  name = lang:get(<<"第22波"/utf8>>), lev = 39,
		  unit_ids = [60122], is_reset = 0, formation = {1, 1}};
get({5, 23}) ->
    #endless_data{type = 5, id = 23,
		  name = lang:get(<<"第23波"/utf8>>), lev = 40,
		  unit_ids = [60123], is_reset = 0, formation = {1, 1}};
get({5, 24}) ->
    #endless_data{type = 5, id = 24,
		  name = lang:get(<<"第24波"/utf8>>), lev = 41,
		  unit_ids = [60124], is_reset = 0, formation = {1, 1}};
get({5, 25}) ->
    #endless_data{type = 5, id = 25,
		  name = lang:get(<<"第25波"/utf8>>), lev = 41,
		  unit_ids = [60125], is_reset = 0, formation = {1, 1}};
get({5, 26}) ->
    #endless_data{type = 5, id = 26,
		  name = lang:get(<<"第26波"/utf8>>), lev = 42,
		  unit_ids = [60126], is_reset = 0, formation = {1, 1}};
get({5, 27}) ->
    #endless_data{type = 5, id = 27,
		  name = lang:get(<<"第27波"/utf8>>), lev = 43,
		  unit_ids = [60127], is_reset = 0, formation = {1, 1}};
get({5, 28}) ->
    #endless_data{type = 5, id = 28,
		  name = lang:get(<<"第28波"/utf8>>), lev = 43,
		  unit_ids = [60128], is_reset = 0, formation = {1, 1}};
get({5, 29}) ->
    #endless_data{type = 5, id = 29,
		  name = lang:get(<<"第29波"/utf8>>), lev = 44,
		  unit_ids = [60129], is_reset = 0, formation = {1, 1}};
get({5, 30}) ->
    #endless_data{type = 5, id = 30,
		  name = lang:get(<<"第30波"/utf8>>), lev = 45,
		  unit_ids = [60130], is_reset = 0, formation = {1, 1}};
get({5, 31}) ->
    #endless_data{type = 5, id = 31,
		  name = lang:get(<<"第31波"/utf8>>), lev = 46,
		  unit_ids = [60131], is_reset = 0, formation = {1, 1}};
get({5, 32}) ->
    #endless_data{type = 5, id = 32,
		  name = lang:get(<<"第32波"/utf8>>), lev = 46,
		  unit_ids = [60132], is_reset = 0, formation = {1, 1}};
get({5, 33}) ->
    #endless_data{type = 5, id = 33,
		  name = lang:get(<<"第33波"/utf8>>), lev = 47,
		  unit_ids = [60133], is_reset = 0, formation = {1, 1}};
get({5, 34}) ->
    #endless_data{type = 5, id = 34,
		  name = lang:get(<<"第34波"/utf8>>), lev = 48,
		  unit_ids = [60134], is_reset = 0, formation = {1, 1}};
get({5, 35}) ->
    #endless_data{type = 5, id = 35,
		  name = lang:get(<<"第35波"/utf8>>), lev = 48,
		  unit_ids = [60135], is_reset = 0, formation = {1, 1}};
get({5, 36}) ->
    #endless_data{type = 5, id = 36,
		  name = lang:get(<<"第36波"/utf8>>), lev = 49,
		  unit_ids = [60136], is_reset = 0, formation = {1, 1}};
get({5, 37}) ->
    #endless_data{type = 5, id = 37,
		  name = lang:get(<<"第37波"/utf8>>), lev = 50,
		  unit_ids = [60137], is_reset = 0, formation = {1, 1}};
get({5, 38}) ->
    #endless_data{type = 5, id = 38,
		  name = lang:get(<<"第38波"/utf8>>), lev = 50,
		  unit_ids = [60138], is_reset = 0, formation = {1, 1}};
get({5, 39}) ->
    #endless_data{type = 5, id = 39,
		  name = lang:get(<<"第39波"/utf8>>), lev = 51,
		  unit_ids = [60139], is_reset = 0, formation = {1, 1}};
get({5, 40}) ->
    #endless_data{type = 5, id = 40,
		  name = lang:get(<<"第40波"/utf8>>), lev = 52,
		  unit_ids = [60140], is_reset = 0, formation = {1, 1}};
get({5, 41}) ->
    #endless_data{type = 5, id = 41,
		  name = lang:get(<<"第41波"/utf8>>), lev = 53,
		  unit_ids = [60201], is_reset = 0, formation = {1, 1}};
get({5, 42}) ->
    #endless_data{type = 5, id = 42,
		  name = lang:get(<<"第42波"/utf8>>), lev = 53,
		  unit_ids = [60202], is_reset = 0, formation = {1, 1}};
get({5, 43}) ->
    #endless_data{type = 5, id = 43,
		  name = lang:get(<<"第43波"/utf8>>), lev = 54,
		  unit_ids = [60203], is_reset = 0, formation = {1, 1}};
get({5, 44}) ->
    #endless_data{type = 5, id = 44,
		  name = lang:get(<<"第44波"/utf8>>), lev = 55,
		  unit_ids = [60204], is_reset = 0, formation = {1, 1}};
get({5, 45}) ->
    #endless_data{type = 5, id = 45,
		  name = lang:get(<<"第45波"/utf8>>), lev = 55,
		  unit_ids = [60205], is_reset = 0, formation = {1, 1}};
get({5, 46}) ->
    #endless_data{type = 5, id = 46,
		  name = lang:get(<<"第46波"/utf8>>), lev = 56,
		  unit_ids = [60206], is_reset = 0, formation = {1, 1}};
get({5, 47}) ->
    #endless_data{type = 5, id = 47,
		  name = lang:get(<<"第47波"/utf8>>), lev = 57,
		  unit_ids = [60207], is_reset = 0, formation = {1, 1}};
get({5, 48}) ->
    #endless_data{type = 5, id = 48,
		  name = lang:get(<<"第48波"/utf8>>), lev = 57,
		  unit_ids = [60208], is_reset = 0, formation = {1, 1}};
get({5, 49}) ->
    #endless_data{type = 5, id = 49,
		  name = lang:get(<<"第49波"/utf8>>), lev = 58,
		  unit_ids = [60209], is_reset = 0, formation = {1, 1}};
get({5, 50}) ->
    #endless_data{type = 5, id = 50,
		  name = lang:get(<<"第50波"/utf8>>), lev = 59,
		  unit_ids = [60210], is_reset = 0, formation = {1, 1}};
get({5, 51}) ->
    #endless_data{type = 5, id = 51,
		  name = lang:get(<<"第51波"/utf8>>), lev = 60,
		  unit_ids = [60211], is_reset = 0, formation = {1, 1}};
get({5, 52}) ->
    #endless_data{type = 5, id = 52,
		  name = lang:get(<<"第52波"/utf8>>), lev = 60,
		  unit_ids = [60212], is_reset = 0, formation = {1, 1}};
get({5, 53}) ->
    #endless_data{type = 5, id = 53,
		  name = lang:get(<<"第53波"/utf8>>), lev = 61,
		  unit_ids = [60213], is_reset = 0, formation = {1, 1}};
get({5, 54}) ->
    #endless_data{type = 5, id = 54,
		  name = lang:get(<<"第54波"/utf8>>), lev = 62,
		  unit_ids = [60214], is_reset = 0, formation = {1, 1}};
get({5, 55}) ->
    #endless_data{type = 5, id = 55,
		  name = lang:get(<<"第55波"/utf8>>), lev = 62,
		  unit_ids = [60215], is_reset = 0, formation = {1, 1}};
get({5, 56}) ->
    #endless_data{type = 5, id = 56,
		  name = lang:get(<<"第56波"/utf8>>), lev = 63,
		  unit_ids = [60201], is_reset = 0, formation = {1, 1}};
get({5, 57}) ->
    #endless_data{type = 5, id = 57,
		  name = lang:get(<<"第57波"/utf8>>), lev = 64,
		  unit_ids = [60202], is_reset = 0, formation = {1, 1}};
get({5, 58}) ->
    #endless_data{type = 5, id = 58,
		  name = lang:get(<<"第58波"/utf8>>), lev = 64,
		  unit_ids = [60203], is_reset = 0, formation = {1, 1}};
get({5, 59}) ->
    #endless_data{type = 5, id = 59,
		  name = lang:get(<<"第59波"/utf8>>), lev = 65,
		  unit_ids = [60204], is_reset = 0, formation = {1, 1}};
get({5, 60}) ->
    #endless_data{type = 5, id = 60,
		  name = lang:get(<<"第60波"/utf8>>), lev = 66,
		  unit_ids = [60205], is_reset = 0, formation = {1, 1}};
get({5, 61}) ->
    #endless_data{type = 5, id = 61,
		  name = lang:get(<<"第61波"/utf8>>), lev = 67,
		  unit_ids = [60206], is_reset = 0, formation = {1, 1}};
get({5, 62}) ->
    #endless_data{type = 5, id = 62,
		  name = lang:get(<<"第62波"/utf8>>), lev = 67,
		  unit_ids = [60207], is_reset = 0, formation = {1, 1}};
get({5, 63}) ->
    #endless_data{type = 5, id = 63,
		  name = lang:get(<<"第63波"/utf8>>), lev = 68,
		  unit_ids = [60208], is_reset = 0, formation = {1, 1}};
get({5, 64}) ->
    #endless_data{type = 5, id = 64,
		  name = lang:get(<<"第64波"/utf8>>), lev = 69,
		  unit_ids = [60209], is_reset = 0, formation = {1, 1}};
get({5, 65}) ->
    #endless_data{type = 5, id = 65,
		  name = lang:get(<<"第65波"/utf8>>), lev = 69,
		  unit_ids = [60210], is_reset = 0, formation = {1, 1}};
get({5, 66}) ->
    #endless_data{type = 5, id = 66,
		  name = lang:get(<<"第66波"/utf8>>), lev = 70,
		  unit_ids = [60211], is_reset = 0, formation = {1, 1}};
get({5, 67}) ->
    #endless_data{type = 5, id = 67,
		  name = lang:get(<<"第67波"/utf8>>), lev = 71,
		  unit_ids = [60212], is_reset = 0, formation = {1, 1}};
get({5, 68}) ->
    #endless_data{type = 5, id = 68,
		  name = lang:get(<<"第68波"/utf8>>), lev = 71,
		  unit_ids = [60213], is_reset = 0, formation = {1, 1}};
get({5, 69}) ->
    #endless_data{type = 5, id = 69,
		  name = lang:get(<<"第69波"/utf8>>), lev = 72,
		  unit_ids = [60214], is_reset = 0, formation = {1, 1}};
get({5, 70}) ->
    #endless_data{type = 5, id = 70,
		  name = lang:get(<<"第70波"/utf8>>), lev = 73,
		  unit_ids = [60215], is_reset = 0, formation = {1, 1}};
get({5, 71}) ->
    #endless_data{type = 5, id = 71,
		  name = lang:get(<<"第71波"/utf8>>), lev = 74,
		  unit_ids = [60201], is_reset = 0, formation = {1, 1}};
get({5, 72}) ->
    #endless_data{type = 5, id = 72,
		  name = lang:get(<<"第72波"/utf8>>), lev = 74,
		  unit_ids = [60202], is_reset = 0, formation = {1, 1}};
get({5, 73}) ->
    #endless_data{type = 5, id = 73,
		  name = lang:get(<<"第73波"/utf8>>), lev = 75,
		  unit_ids = [60203], is_reset = 0, formation = {1, 1}};
get({5, 74}) ->
    #endless_data{type = 5, id = 74,
		  name = lang:get(<<"第74波"/utf8>>), lev = 76,
		  unit_ids = [60204], is_reset = 0, formation = {1, 1}};
get({5, 75}) ->
    #endless_data{type = 5, id = 75,
		  name = lang:get(<<"第75波"/utf8>>), lev = 76,
		  unit_ids = [60205], is_reset = 0, formation = {1, 1}};
get({5, 76}) ->
    #endless_data{type = 5, id = 76,
		  name = lang:get(<<"第76波"/utf8>>), lev = 77,
		  unit_ids = [60206], is_reset = 0, formation = {1, 1}};
get({5, 77}) ->
    #endless_data{type = 5, id = 77,
		  name = lang:get(<<"第77波"/utf8>>), lev = 78,
		  unit_ids = [60207], is_reset = 0, formation = {1, 1}};
get({5, 78}) ->
    #endless_data{type = 5, id = 78,
		  name = lang:get(<<"第78波"/utf8>>), lev = 78,
		  unit_ids = [60208], is_reset = 0, formation = {1, 1}};
get({5, 79}) ->
    #endless_data{type = 5, id = 79,
		  name = lang:get(<<"第79波"/utf8>>), lev = 79,
		  unit_ids = [60209], is_reset = 0, formation = {1, 1}};
get({5, 80}) ->
    #endless_data{type = 5, id = 80,
		  name = lang:get(<<"第80波"/utf8>>), lev = 80,
		  unit_ids = [60210], is_reset = 0, formation = {1, 1}};
get({5, 81}) ->
    #endless_data{type = 5, id = 81,
		  name = lang:get(<<"第81波"/utf8>>), lev = 81,
		  unit_ids = [60211], is_reset = 0, formation = {1, 1}};
get({5, 82}) ->
    #endless_data{type = 5, id = 82,
		  name = lang:get(<<"第82波"/utf8>>), lev = 81,
		  unit_ids = [60212], is_reset = 0, formation = {1, 1}};
get({5, 83}) ->
    #endless_data{type = 5, id = 83,
		  name = lang:get(<<"第83波"/utf8>>), lev = 82,
		  unit_ids = [60213], is_reset = 0, formation = {1, 1}};
get({5, 84}) ->
    #endless_data{type = 5, id = 84,
		  name = lang:get(<<"第84波"/utf8>>), lev = 83,
		  unit_ids = [60214], is_reset = 0, formation = {1, 1}};
get({5, 85}) ->
    #endless_data{type = 5, id = 85,
		  name = lang:get(<<"第85波"/utf8>>), lev = 83,
		  unit_ids = [60215], is_reset = 0, formation = {1, 1}};
get({5, 86}) ->
    #endless_data{type = 5, id = 86,
		  name = lang:get(<<"第86波"/utf8>>), lev = 84,
		  unit_ids = [60201], is_reset = 0, formation = {1, 1}};
get({5, 87}) ->
    #endless_data{type = 5, id = 87,
		  name = lang:get(<<"第87波"/utf8>>), lev = 85,
		  unit_ids = [60202], is_reset = 0, formation = {1, 1}};
get({5, 88}) ->
    #endless_data{type = 5, id = 88,
		  name = lang:get(<<"第88波"/utf8>>), lev = 85,
		  unit_ids = [60203], is_reset = 0, formation = {1, 1}};
get({5, 89}) ->
    #endless_data{type = 5, id = 89,
		  name = lang:get(<<"第89波"/utf8>>), lev = 86,
		  unit_ids = [60204], is_reset = 0, formation = {1, 1}};
get({5, 90}) ->
    #endless_data{type = 5, id = 90,
		  name = lang:get(<<"第90波"/utf8>>), lev = 87,
		  unit_ids = [60205], is_reset = 0, formation = {1, 1}};
get({5, 91}) ->
    #endless_data{type = 5, id = 91,
		  name = lang:get(<<"第91波"/utf8>>), lev = 88,
		  unit_ids = [60206], is_reset = 0, formation = {1, 1}};
get({5, 92}) ->
    #endless_data{type = 5, id = 92,
		  name = lang:get(<<"第92波"/utf8>>), lev = 88,
		  unit_ids = [60207], is_reset = 0, formation = {1, 1}};
get({5, 93}) ->
    #endless_data{type = 5, id = 93,
		  name = lang:get(<<"第93波"/utf8>>), lev = 89,
		  unit_ids = [60208], is_reset = 0, formation = {1, 1}};
get({5, 94}) ->
    #endless_data{type = 5, id = 94,
		  name = lang:get(<<"第94波"/utf8>>), lev = 90,
		  unit_ids = [60209], is_reset = 0, formation = {1, 1}};
get({5, 95}) ->
    #endless_data{type = 5, id = 95,
		  name = lang:get(<<"第95波"/utf8>>), lev = 90,
		  unit_ids = [60210], is_reset = 0, formation = {1, 1}};
get({5, 96}) ->
    #endless_data{type = 5, id = 96,
		  name = lang:get(<<"第96波"/utf8>>), lev = 91,
		  unit_ids = [60211], is_reset = 0, formation = {1, 1}};
get({5, 97}) ->
    #endless_data{type = 5, id = 97,
		  name = lang:get(<<"第97波"/utf8>>), lev = 92,
		  unit_ids = [60212], is_reset = 0, formation = {1, 1}};
get({5, 98}) ->
    #endless_data{type = 5, id = 98,
		  name = lang:get(<<"第98波"/utf8>>), lev = 92,
		  unit_ids = [60213], is_reset = 0, formation = {1, 1}};
get({5, 99}) ->
    #endless_data{type = 5, id = 99,
		  name = lang:get(<<"第99波"/utf8>>), lev = 93,
		  unit_ids = [60214], is_reset = 0, formation = {1, 1}};
get({5, 100}) ->
    #endless_data{type = 5, id = 100,
		  name = lang:get(<<"第100波"/utf8>>), lev = 94,
		  unit_ids = [60215], is_reset = 0, formation = {1, 1}};
get({5, 101}) ->
    #endless_data{type = 5, id = 101,
		  name = lang:get(<<"第101波"/utf8>>), lev = 95,
		  unit_ids = [60201], is_reset = 0, formation = {1, 1}};
get({5, 102}) ->
    #endless_data{type = 5, id = 102,
		  name = lang:get(<<"第102波"/utf8>>), lev = 95,
		  unit_ids = [60202], is_reset = 0, formation = {1, 1}};
get({5, 103}) ->
    #endless_data{type = 5, id = 103,
		  name = lang:get(<<"第103波"/utf8>>), lev = 96,
		  unit_ids = [60203], is_reset = 0, formation = {1, 1}};
get({5, 104}) ->
    #endless_data{type = 5, id = 104,
		  name = lang:get(<<"第104波"/utf8>>), lev = 97,
		  unit_ids = [60204], is_reset = 0, formation = {1, 1}};
get({5, 105}) ->
    #endless_data{type = 5, id = 105,
		  name = lang:get(<<"第105波"/utf8>>), lev = 97,
		  unit_ids = [60205], is_reset = 0, formation = {1, 1}};
get({5, 106}) ->
    #endless_data{type = 5, id = 106,
		  name = lang:get(<<"第106波"/utf8>>), lev = 98,
		  unit_ids = [60206], is_reset = 0, formation = {1, 1}};
get({5, 107}) ->
    #endless_data{type = 5, id = 107,
		  name = lang:get(<<"第107波"/utf8>>), lev = 99,
		  unit_ids = [60207], is_reset = 0, formation = {1, 1}};
get({5, 108}) ->
    #endless_data{type = 5, id = 108,
		  name = lang:get(<<"第108波"/utf8>>), lev = 99,
		  unit_ids = [60208], is_reset = 0, formation = {1, 1}};
get({5, 109}) ->
    #endless_data{type = 5, id = 109,
		  name = lang:get(<<"第109波"/utf8>>), lev = 100,
		  unit_ids = [60209], is_reset = 0, formation = {1, 1}};
get({5, 110}) ->
    #endless_data{type = 5, id = 110,
		  name = lang:get(<<"第110波"/utf8>>), lev = 101,
		  unit_ids = [60210], is_reset = 0, formation = {1, 1}};
get({5, 111}) ->
    #endless_data{type = 5, id = 111,
		  name = lang:get(<<"第111波"/utf8>>), lev = 102,
		  unit_ids = [60301], is_reset = 0, formation = {1, 1}};
get({5, 112}) ->
    #endless_data{type = 5, id = 112,
		  name = lang:get(<<"第112波"/utf8>>), lev = 102,
		  unit_ids = [60302], is_reset = 0, formation = {1, 1}};
get({5, 113}) ->
    #endless_data{type = 5, id = 113,
		  name = lang:get(<<"第113波"/utf8>>), lev = 103,
		  unit_ids = [60303], is_reset = 0, formation = {1, 1}};
get({5, 114}) ->
    #endless_data{type = 5, id = 114,
		  name = lang:get(<<"第114波"/utf8>>), lev = 104,
		  unit_ids = [60304], is_reset = 0, formation = {1, 1}};
get({5, 115}) ->
    #endless_data{type = 5, id = 115,
		  name = lang:get(<<"第115波"/utf8>>), lev = 104,
		  unit_ids = [60305], is_reset = 0, formation = {1, 1}};
get({5, 116}) ->
    #endless_data{type = 5, id = 116,
		  name = lang:get(<<"第116波"/utf8>>), lev = 105,
		  unit_ids = [60306], is_reset = 0, formation = {1, 1}};
get({5, 117}) ->
    #endless_data{type = 5, id = 117,
		  name = lang:get(<<"第117波"/utf8>>), lev = 106,
		  unit_ids = [60307], is_reset = 0, formation = {1, 1}};
get({5, 118}) ->
    #endless_data{type = 5, id = 118,
		  name = lang:get(<<"第118波"/utf8>>), lev = 106,
		  unit_ids = [60308], is_reset = 0, formation = {1, 1}};
get({5, 119}) ->
    #endless_data{type = 5, id = 119,
		  name = lang:get(<<"第119波"/utf8>>), lev = 107,
		  unit_ids = [60309], is_reset = 0, formation = {1, 1}};
get({5, 120}) ->
    #endless_data{type = 5, id = 120,
		  name = lang:get(<<"第120波"/utf8>>), lev = 108,
		  unit_ids = [60310], is_reset = 0, formation = {1, 1}};
get({5, 121}) ->
    #endless_data{type = 5, id = 121,
		  name = lang:get(<<"第121波"/utf8>>), lev = 109,
		  unit_ids = [60311], is_reset = 0, formation = {1, 1}};
get({5, 122}) ->
    #endless_data{type = 5, id = 122,
		  name = lang:get(<<"第122波"/utf8>>), lev = 109,
		  unit_ids = [60312], is_reset = 0, formation = {1, 1}};
get({5, 123}) ->
    #endless_data{type = 5, id = 123,
		  name = lang:get(<<"第123波"/utf8>>), lev = 110,
		  unit_ids = [60313], is_reset = 0, formation = {1, 1}};
get({5, 124}) ->
    #endless_data{type = 5, id = 124,
		  name = lang:get(<<"第124波"/utf8>>), lev = 111,
		  unit_ids = [60314], is_reset = 0, formation = {1, 1}};
get({5, 125}) ->
    #endless_data{type = 5, id = 125,
		  name = lang:get(<<"第125波"/utf8>>), lev = 111,
		  unit_ids = [60315], is_reset = 0, formation = {1, 1}};
get({5, 126}) ->
    #endless_data{type = 5, id = 126,
		  name = lang:get(<<"第126波"/utf8>>), lev = 112,
		  unit_ids = [60301], is_reset = 0, formation = {1, 1}};
get({5, 127}) ->
    #endless_data{type = 5, id = 127,
		  name = lang:get(<<"第127波"/utf8>>), lev = 113,
		  unit_ids = [60302], is_reset = 0, formation = {1, 1}};
get({5, 128}) ->
    #endless_data{type = 5, id = 128,
		  name = lang:get(<<"第128波"/utf8>>), lev = 113,
		  unit_ids = [60303], is_reset = 0, formation = {1, 1}};
get({5, 129}) ->
    #endless_data{type = 5, id = 129,
		  name = lang:get(<<"第129波"/utf8>>), lev = 114,
		  unit_ids = [60304], is_reset = 0, formation = {1, 1}};
get({5, 130}) ->
    #endless_data{type = 5, id = 130,
		  name = lang:get(<<"第130波"/utf8>>), lev = 115,
		  unit_ids = [60305], is_reset = 0, formation = {1, 1}};
get({5, 131}) ->
    #endless_data{type = 5, id = 131,
		  name = lang:get(<<"第131波"/utf8>>), lev = 116,
		  unit_ids = [60306], is_reset = 0, formation = {1, 1}};
get({5, 132}) ->
    #endless_data{type = 5, id = 132,
		  name = lang:get(<<"第132波"/utf8>>), lev = 116,
		  unit_ids = [60307], is_reset = 0, formation = {1, 1}};
get({5, 133}) ->
    #endless_data{type = 5, id = 133,
		  name = lang:get(<<"第133波"/utf8>>), lev = 117,
		  unit_ids = [60308], is_reset = 0, formation = {1, 1}};
get({5, 134}) ->
    #endless_data{type = 5, id = 134,
		  name = lang:get(<<"第134波"/utf8>>), lev = 118,
		  unit_ids = [60309], is_reset = 0, formation = {1, 1}};
get({5, 135}) ->
    #endless_data{type = 5, id = 135,
		  name = lang:get(<<"第135波"/utf8>>), lev = 118,
		  unit_ids = [60310], is_reset = 0, formation = {1, 1}};
get({5, 136}) ->
    #endless_data{type = 5, id = 136,
		  name = lang:get(<<"第136波"/utf8>>), lev = 119,
		  unit_ids = [60311], is_reset = 0, formation = {1, 1}};
get({5, 137}) ->
    #endless_data{type = 5, id = 137,
		  name = lang:get(<<"第137波"/utf8>>), lev = 120,
		  unit_ids = [60312], is_reset = 0, formation = {1, 1}};
get({5, 138}) ->
    #endless_data{type = 5, id = 138,
		  name = lang:get(<<"第138波"/utf8>>), lev = 120,
		  unit_ids = [60313], is_reset = 0, formation = {1, 1}};
get({5, 139}) ->
    #endless_data{type = 5, id = 139,
		  name = lang:get(<<"第139波"/utf8>>), lev = 121,
		  unit_ids = [60314], is_reset = 0, formation = {1, 1}};
get({5, 140}) ->
    #endless_data{type = 5, id = 140,
		  name = lang:get(<<"第140波"/utf8>>), lev = 122,
		  unit_ids = [60315], is_reset = 0, formation = {1, 1}};
get({5, 141}) ->
    #endless_data{type = 5, id = 141,
		  name = lang:get(<<"第141波"/utf8>>), lev = 123,
		  unit_ids = [60301], is_reset = 0, formation = {1, 1}};
get({5, 142}) ->
    #endless_data{type = 5, id = 142,
		  name = lang:get(<<"第142波"/utf8>>), lev = 123,
		  unit_ids = [60302], is_reset = 0, formation = {1, 1}};
get({5, 143}) ->
    #endless_data{type = 5, id = 143,
		  name = lang:get(<<"第143波"/utf8>>), lev = 124,
		  unit_ids = [60303], is_reset = 0, formation = {1, 1}};
get({5, 144}) ->
    #endless_data{type = 5, id = 144,
		  name = lang:get(<<"第144波"/utf8>>), lev = 125,
		  unit_ids = [60304], is_reset = 0, formation = {1, 1}};
get({5, 145}) ->
    #endless_data{type = 5, id = 145,
		  name = lang:get(<<"第145波"/utf8>>), lev = 125,
		  unit_ids = [60305], is_reset = 0, formation = {1, 1}};
get({5, 146}) ->
    #endless_data{type = 5, id = 146,
		  name = lang:get(<<"第146波"/utf8>>), lev = 126,
		  unit_ids = [60306], is_reset = 0, formation = {1, 1}};
get({5, 147}) ->
    #endless_data{type = 5, id = 147,
		  name = lang:get(<<"第147波"/utf8>>), lev = 127,
		  unit_ids = [60307], is_reset = 0, formation = {1, 1}};
get({5, 148}) ->
    #endless_data{type = 5, id = 148,
		  name = lang:get(<<"第148波"/utf8>>), lev = 127,
		  unit_ids = [60308], is_reset = 0, formation = {1, 1}};
get({5, 149}) ->
    #endless_data{type = 5, id = 149,
		  name = lang:get(<<"第149波"/utf8>>), lev = 128,
		  unit_ids = [60309], is_reset = 0, formation = {1, 1}};
get({5, 150}) ->
    #endless_data{type = 5, id = 150,
		  name = lang:get(<<"第150波"/utf8>>), lev = 129,
		  unit_ids = [60310], is_reset = 0, formation = {1, 1}};
get({5, 151}) ->
    #endless_data{type = 5, id = 151,
		  name = lang:get(<<"第151波"/utf8>>), lev = 130,
		  unit_ids = [60311], is_reset = 0, formation = {1, 1}};
get({5, 152}) ->
    #endless_data{type = 5, id = 152,
		  name = lang:get(<<"第152波"/utf8>>), lev = 130,
		  unit_ids = [60312], is_reset = 0, formation = {1, 1}};
get({5, 153}) ->
    #endless_data{type = 5, id = 153,
		  name = lang:get(<<"第153波"/utf8>>), lev = 131,
		  unit_ids = [60313], is_reset = 0, formation = {1, 1}};
get({5, 154}) ->
    #endless_data{type = 5, id = 154,
		  name = lang:get(<<"第154波"/utf8>>), lev = 132,
		  unit_ids = [60314], is_reset = 0, formation = {1, 1}};
get({5, 155}) ->
    #endless_data{type = 5, id = 155,
		  name = lang:get(<<"第155波"/utf8>>), lev = 132,
		  unit_ids = [60315], is_reset = 0, formation = {1, 1}};
get({5, 156}) ->
    #endless_data{type = 5, id = 156,
		  name = lang:get(<<"第156波"/utf8>>), lev = 133,
		  unit_ids = [60301], is_reset = 0, formation = {1, 1}};
get({5, 157}) ->
    #endless_data{type = 5, id = 157,
		  name = lang:get(<<"第157波"/utf8>>), lev = 134,
		  unit_ids = [60302], is_reset = 0, formation = {1, 1}};
get({5, 158}) ->
    #endless_data{type = 5, id = 158,
		  name = lang:get(<<"第158波"/utf8>>), lev = 134,
		  unit_ids = [60303], is_reset = 0, formation = {1, 1}};
get({5, 159}) ->
    #endless_data{type = 5, id = 159,
		  name = lang:get(<<"第159波"/utf8>>), lev = 135,
		  unit_ids = [60304], is_reset = 0, formation = {1, 1}};
get({5, 160}) ->
    #endless_data{type = 5, id = 160,
		  name = lang:get(<<"第160波"/utf8>>), lev = 136,
		  unit_ids = [60305], is_reset = 0, formation = {1, 1}};
get({5, 161}) ->
    #endless_data{type = 5, id = 161,
		  name = lang:get(<<"第161波"/utf8>>), lev = 137,
		  unit_ids = [60306], is_reset = 0, formation = {1, 1}};
get({5, 162}) ->
    #endless_data{type = 5, id = 162,
		  name = lang:get(<<"第162波"/utf8>>), lev = 137,
		  unit_ids = [60307], is_reset = 0, formation = {1, 1}};
get({5, 163}) ->
    #endless_data{type = 5, id = 163,
		  name = lang:get(<<"第163波"/utf8>>), lev = 138,
		  unit_ids = [60308], is_reset = 0, formation = {1, 1}};
get({5, 164}) ->
    #endless_data{type = 5, id = 164,
		  name = lang:get(<<"第164波"/utf8>>), lev = 139,
		  unit_ids = [60309], is_reset = 0, formation = {1, 1}};
get({5, 165}) ->
    #endless_data{type = 5, id = 165,
		  name = lang:get(<<"第165波"/utf8>>), lev = 139,
		  unit_ids = [60310], is_reset = 0, formation = {1, 1}};
get({5, 166}) ->
    #endless_data{type = 5, id = 166,
		  name = lang:get(<<"第166波"/utf8>>), lev = 140,
		  unit_ids = [60311], is_reset = 0, formation = {1, 1}};
get({5, 167}) ->
    #endless_data{type = 5, id = 167,
		  name = lang:get(<<"第167波"/utf8>>), lev = 141,
		  unit_ids = [60312], is_reset = 0, formation = {1, 1}};
get({5, 168}) ->
    #endless_data{type = 5, id = 168,
		  name = lang:get(<<"第168波"/utf8>>), lev = 141,
		  unit_ids = [60313], is_reset = 0, formation = {1, 1}};
get({5, 169}) ->
    #endless_data{type = 5, id = 169,
		  name = lang:get(<<"第169波"/utf8>>), lev = 142,
		  unit_ids = [60314], is_reset = 0, formation = {1, 1}};
get({5, 170}) ->
    #endless_data{type = 5, id = 170,
		  name = lang:get(<<"第170波"/utf8>>), lev = 143,
		  unit_ids = [60315], is_reset = 0, formation = {1, 1}};
get({5, 171}) ->
    #endless_data{type = 5, id = 171,
		  name = lang:get(<<"第171波"/utf8>>), lev = 144,
		  unit_ids = [60301], is_reset = 0, formation = {1, 1}};
get({5, 172}) ->
    #endless_data{type = 5, id = 172,
		  name = lang:get(<<"第172波"/utf8>>), lev = 144,
		  unit_ids = [60302], is_reset = 0, formation = {1, 1}};
get({5, 173}) ->
    #endless_data{type = 5, id = 173,
		  name = lang:get(<<"第173波"/utf8>>), lev = 145,
		  unit_ids = [60303], is_reset = 0, formation = {1, 1}};
get({5, 174}) ->
    #endless_data{type = 5, id = 174,
		  name = lang:get(<<"第174波"/utf8>>), lev = 146,
		  unit_ids = [60304], is_reset = 0, formation = {1, 1}};
get({5, 175}) ->
    #endless_data{type = 5, id = 175,
		  name = lang:get(<<"第175波"/utf8>>), lev = 146,
		  unit_ids = [60305], is_reset = 0, formation = {1, 1}};
get({5, 176}) ->
    #endless_data{type = 5, id = 176,
		  name = lang:get(<<"第176波"/utf8>>), lev = 147,
		  unit_ids = [60306], is_reset = 0, formation = {1, 1}};
get({5, 177}) ->
    #endless_data{type = 5, id = 177,
		  name = lang:get(<<"第177波"/utf8>>), lev = 148,
		  unit_ids = [60307], is_reset = 0, formation = {1, 1}};
get({5, 178}) ->
    #endless_data{type = 5, id = 178,
		  name = lang:get(<<"第178波"/utf8>>), lev = 148,
		  unit_ids = [60308], is_reset = 0, formation = {1, 1}};
get({5, 179}) ->
    #endless_data{type = 5, id = 179,
		  name = lang:get(<<"第179波"/utf8>>), lev = 149,
		  unit_ids = [60309], is_reset = 0, formation = {1, 1}};
get({5, 180}) ->
    #endless_data{type = 5, id = 180,
		  name = lang:get(<<"第180波"/utf8>>), lev = 150,
		  unit_ids = [60310], is_reset = 0, formation = {1, 1}};
get({5, 181}) ->
    #endless_data{type = 5, id = 181,
		  name = lang:get(<<"第181波"/utf8>>), lev = 169,
		  unit_ids = [60401], is_reset = 0, formation = {1, 1}};
get({5, 182}) ->
    #endless_data{type = 5, id = 182,
		  name = lang:get(<<"第182波"/utf8>>), lev = 169,
		  unit_ids = [60402], is_reset = 0, formation = {1, 1}};
get({5, 183}) ->
    #endless_data{type = 5, id = 183,
		  name = lang:get(<<"第183波"/utf8>>), lev = 170,
		  unit_ids = [60403], is_reset = 0, formation = {1, 1}};
get({5, 184}) ->
    #endless_data{type = 5, id = 184,
		  name = lang:get(<<"第184波"/utf8>>), lev = 171,
		  unit_ids = [60404], is_reset = 0, formation = {1, 1}};
get({5, 185}) ->
    #endless_data{type = 5, id = 185,
		  name = lang:get(<<"第185波"/utf8>>), lev = 172,
		  unit_ids = [60405], is_reset = 0, formation = {1, 1}};
get({5, 186}) ->
    #endless_data{type = 5, id = 186,
		  name = lang:get(<<"第186波"/utf8>>), lev = 173,
		  unit_ids = [60406], is_reset = 0, formation = {1, 1}};
get({5, 187}) ->
    #endless_data{type = 5, id = 187,
		  name = lang:get(<<"第187波"/utf8>>), lev = 173,
		  unit_ids = [60407], is_reset = 0, formation = {1, 1}};
get({5, 188}) ->
    #endless_data{type = 5, id = 188,
		  name = lang:get(<<"第188波"/utf8>>), lev = 174,
		  unit_ids = [60408], is_reset = 0, formation = {1, 1}};
get({5, 189}) ->
    #endless_data{type = 5, id = 189,
		  name = lang:get(<<"第189波"/utf8>>), lev = 175,
		  unit_ids = [60409], is_reset = 0, formation = {1, 1}};
get({5, 190}) ->
    #endless_data{type = 5, id = 190,
		  name = lang:get(<<"第190波"/utf8>>), lev = 176,
		  unit_ids = [60410], is_reset = 0, formation = {1, 1}};
get({5, 191}) ->
    #endless_data{type = 5, id = 191,
		  name = lang:get(<<"第191波"/utf8>>), lev = 177,
		  unit_ids = [60411], is_reset = 0, formation = {1, 1}};
get({5, 192}) ->
    #endless_data{type = 5, id = 192,
		  name = lang:get(<<"第192波"/utf8>>), lev = 177,
		  unit_ids = [60412], is_reset = 0, formation = {1, 1}};
get({5, 193}) ->
    #endless_data{type = 5, id = 193,
		  name = lang:get(<<"第193波"/utf8>>), lev = 178,
		  unit_ids = [60413], is_reset = 0, formation = {1, 1}};
get({5, 194}) ->
    #endless_data{type = 5, id = 194,
		  name = lang:get(<<"第194波"/utf8>>), lev = 179,
		  unit_ids = [60414], is_reset = 0, formation = {1, 1}};
get({5, 195}) ->
    #endless_data{type = 5, id = 195,
		  name = lang:get(<<"第195波"/utf8>>), lev = 180,
		  unit_ids = [60415], is_reset = 0, formation = {1, 1}};
get({5, 196}) ->
    #endless_data{type = 5, id = 196,
		  name = lang:get(<<"第196波"/utf8>>), lev = 181,
		  unit_ids = [60401], is_reset = 0, formation = {1, 1}};
get({5, 197}) ->
    #endless_data{type = 5, id = 197,
		  name = lang:get(<<"第197波"/utf8>>), lev = 181,
		  unit_ids = [60402], is_reset = 0, formation = {1, 1}};
get({5, 198}) ->
    #endless_data{type = 5, id = 198,
		  name = lang:get(<<"第198波"/utf8>>), lev = 182,
		  unit_ids = [60403], is_reset = 0, formation = {1, 1}};
get({5, 199}) ->
    #endless_data{type = 5, id = 199,
		  name = lang:get(<<"第199波"/utf8>>), lev = 183,
		  unit_ids = [60404], is_reset = 0, formation = {1, 1}};
get({5, 200}) ->
    #endless_data{type = 5, id = 200,
		  name = lang:get(<<"第200波"/utf8>>), lev = 184,
		  unit_ids = [60405], is_reset = 0, formation = {1, 1}};
get({5, 201}) ->
    #endless_data{type = 5, id = 201,
		  name = lang:get(<<"第201波"/utf8>>), lev = 185,
		  unit_ids = [60406], is_reset = 0, formation = {1, 1}};
get({5, 202}) ->
    #endless_data{type = 5, id = 202,
		  name = lang:get(<<"第202波"/utf8>>), lev = 185,
		  unit_ids = [60407], is_reset = 0, formation = {1, 1}};
get({5, 203}) ->
    #endless_data{type = 5, id = 203,
		  name = lang:get(<<"第203波"/utf8>>), lev = 186,
		  unit_ids = [60408], is_reset = 0, formation = {1, 1}};
get({5, 204}) ->
    #endless_data{type = 5, id = 204,
		  name = lang:get(<<"第204波"/utf8>>), lev = 187,
		  unit_ids = [60409], is_reset = 0, formation = {1, 1}};
get({5, 205}) ->
    #endless_data{type = 5, id = 205,
		  name = lang:get(<<"第205波"/utf8>>), lev = 188,
		  unit_ids = [60410], is_reset = 0, formation = {1, 1}};
get({5, 206}) ->
    #endless_data{type = 5, id = 206,
		  name = lang:get(<<"第206波"/utf8>>), lev = 189,
		  unit_ids = [60411], is_reset = 0, formation = {1, 1}};
get({5, 207}) ->
    #endless_data{type = 5, id = 207,
		  name = lang:get(<<"第207波"/utf8>>), lev = 189,
		  unit_ids = [60412], is_reset = 0, formation = {1, 1}};
get({5, 208}) ->
    #endless_data{type = 5, id = 208,
		  name = lang:get(<<"第208波"/utf8>>), lev = 190,
		  unit_ids = [60413], is_reset = 0, formation = {1, 1}};
get({5, 209}) ->
    #endless_data{type = 5, id = 209,
		  name = lang:get(<<"第209波"/utf8>>), lev = 191,
		  unit_ids = [60414], is_reset = 0, formation = {1, 1}};
get({5, 210}) ->
    #endless_data{type = 5, id = 210,
		  name = lang:get(<<"第210波"/utf8>>), lev = 192,
		  unit_ids = [60415], is_reset = 0, formation = {1, 1}};
get({5, 211}) ->
    #endless_data{type = 5, id = 211,
		  name = lang:get(<<"第211波"/utf8>>), lev = 193,
		  unit_ids = [60401], is_reset = 0, formation = {1, 1}};
get({5, 212}) ->
    #endless_data{type = 5, id = 212,
		  name = lang:get(<<"第212波"/utf8>>), lev = 193,
		  unit_ids = [60402], is_reset = 0, formation = {1, 1}};
get({5, 213}) ->
    #endless_data{type = 5, id = 213,
		  name = lang:get(<<"第213波"/utf8>>), lev = 194,
		  unit_ids = [60403], is_reset = 0, formation = {1, 1}};
get({5, 214}) ->
    #endless_data{type = 5, id = 214,
		  name = lang:get(<<"第214波"/utf8>>), lev = 195,
		  unit_ids = [60404], is_reset = 0, formation = {1, 1}};
get({5, 215}) ->
    #endless_data{type = 5, id = 215,
		  name = lang:get(<<"第215波"/utf8>>), lev = 196,
		  unit_ids = [60405], is_reset = 0, formation = {1, 1}};
get({5, 216}) ->
    #endless_data{type = 5, id = 216,
		  name = lang:get(<<"第216波"/utf8>>), lev = 197,
		  unit_ids = [60406], is_reset = 0, formation = {1, 1}};
get({5, 217}) ->
    #endless_data{type = 5, id = 217,
		  name = lang:get(<<"第217波"/utf8>>), lev = 197,
		  unit_ids = [60407], is_reset = 0, formation = {1, 1}};
get({5, 218}) ->
    #endless_data{type = 5, id = 218,
		  name = lang:get(<<"第218波"/utf8>>), lev = 198,
		  unit_ids = [60408], is_reset = 0, formation = {1, 1}};
get({5, 219}) ->
    #endless_data{type = 5, id = 219,
		  name = lang:get(<<"第219波"/utf8>>), lev = 199,
		  unit_ids = [60409], is_reset = 0, formation = {1, 1}};
get({5, 220}) ->
    #endless_data{type = 5, id = 220,
		  name = lang:get(<<"第220波"/utf8>>), lev = 200,
		  unit_ids = [60410], is_reset = 0, formation = {1, 1}};
get({5, 221}) ->
    #endless_data{type = 5, id = 221,
		  name = lang:get(<<"第221波"/utf8>>), lev = 201,
		  unit_ids = [60411], is_reset = 0, formation = {1, 1}};
get({5, 222}) ->
    #endless_data{type = 5, id = 222,
		  name = lang:get(<<"第222波"/utf8>>), lev = 201,
		  unit_ids = [60412], is_reset = 0, formation = {1, 1}};
get({5, 223}) ->
    #endless_data{type = 5, id = 223,
		  name = lang:get(<<"第223波"/utf8>>), lev = 202,
		  unit_ids = [60413], is_reset = 0, formation = {1, 1}};
get({5, 224}) ->
    #endless_data{type = 5, id = 224,
		  name = lang:get(<<"第224波"/utf8>>), lev = 203,
		  unit_ids = [60414], is_reset = 0, formation = {1, 1}};
get({5, 225}) ->
    #endless_data{type = 5, id = 225,
		  name = lang:get(<<"第225波"/utf8>>), lev = 204,
		  unit_ids = [60415], is_reset = 0, formation = {1, 1}};
get({5, 226}) ->
    #endless_data{type = 5, id = 226,
		  name = lang:get(<<"第226波"/utf8>>), lev = 205,
		  unit_ids = [60401], is_reset = 0, formation = {1, 1}};
get({5, 227}) ->
    #endless_data{type = 5, id = 227,
		  name = lang:get(<<"第227波"/utf8>>), lev = 205,
		  unit_ids = [60402], is_reset = 0, formation = {1, 1}};
get({5, 228}) ->
    #endless_data{type = 5, id = 228,
		  name = lang:get(<<"第228波"/utf8>>), lev = 206,
		  unit_ids = [60403], is_reset = 0, formation = {1, 1}};
get({5, 229}) ->
    #endless_data{type = 5, id = 229,
		  name = lang:get(<<"第229波"/utf8>>), lev = 207,
		  unit_ids = [60404], is_reset = 0, formation = {1, 1}};
get({5, 230}) ->
    #endless_data{type = 5, id = 230,
		  name = lang:get(<<"第230波"/utf8>>), lev = 208,
		  unit_ids = [60405], is_reset = 0, formation = {1, 1}};
get({5, 231}) ->
    #endless_data{type = 5, id = 231,
		  name = lang:get(<<"第231波"/utf8>>), lev = 209,
		  unit_ids = [60406], is_reset = 0, formation = {1, 1}};
get({5, 232}) ->
    #endless_data{type = 5, id = 232,
		  name = lang:get(<<"第232波"/utf8>>), lev = 209,
		  unit_ids = [60407], is_reset = 0, formation = {1, 1}};
get({5, 233}) ->
    #endless_data{type = 5, id = 233,
		  name = lang:get(<<"第233波"/utf8>>), lev = 210,
		  unit_ids = [60408], is_reset = 0, formation = {1, 1}};
get({5, 234}) ->
    #endless_data{type = 5, id = 234,
		  name = lang:get(<<"第234波"/utf8>>), lev = 211,
		  unit_ids = [60409], is_reset = 0, formation = {1, 1}};
get({5, 235}) ->
    #endless_data{type = 5, id = 235,
		  name = lang:get(<<"第235波"/utf8>>), lev = 212,
		  unit_ids = [60410], is_reset = 0, formation = {1, 1}};
get({5, 236}) ->
    #endless_data{type = 5, id = 236,
		  name = lang:get(<<"第236波"/utf8>>), lev = 213,
		  unit_ids = [60411], is_reset = 0, formation = {1, 1}};
get({5, 237}) ->
    #endless_data{type = 5, id = 237,
		  name = lang:get(<<"第237波"/utf8>>), lev = 213,
		  unit_ids = [60412], is_reset = 0, formation = {1, 1}};
get({5, 238}) ->
    #endless_data{type = 5, id = 238,
		  name = lang:get(<<"第238波"/utf8>>), lev = 214,
		  unit_ids = [60413], is_reset = 0, formation = {1, 1}};
get({5, 239}) ->
    #endless_data{type = 5, id = 239,
		  name = lang:get(<<"第239波"/utf8>>), lev = 215,
		  unit_ids = [60414], is_reset = 0, formation = {1, 1}};
get({5, 240}) ->
    #endless_data{type = 5, id = 240,
		  name = lang:get(<<"第240波"/utf8>>), lev = 216,
		  unit_ids = [60415], is_reset = 0, formation = {1, 1}};
get({5, 241}) ->
    #endless_data{type = 5, id = 241,
		  name = lang:get(<<"第241波"/utf8>>), lev = 217,
		  unit_ids = [60401], is_reset = 0, formation = {1, 1}};
get({5, 242}) ->
    #endless_data{type = 5, id = 242,
		  name = lang:get(<<"第242波"/utf8>>), lev = 217,
		  unit_ids = [60402], is_reset = 0, formation = {1, 1}};
get({5, 243}) ->
    #endless_data{type = 5, id = 243,
		  name = lang:get(<<"第243波"/utf8>>), lev = 218,
		  unit_ids = [60403], is_reset = 0, formation = {1, 1}};
get({5, 244}) ->
    #endless_data{type = 5, id = 244,
		  name = lang:get(<<"第244波"/utf8>>), lev = 219,
		  unit_ids = [60404], is_reset = 0, formation = {1, 1}};
get({5, 245}) ->
    #endless_data{type = 5, id = 245,
		  name = lang:get(<<"第245波"/utf8>>), lev = 220,
		  unit_ids = [60405], is_reset = 0, formation = {1, 1}};
get({5, 246}) ->
    #endless_data{type = 5, id = 246,
		  name = lang:get(<<"第246波"/utf8>>), lev = 221,
		  unit_ids = [60406], is_reset = 0, formation = {1, 1}};
get({5, 247}) ->
    #endless_data{type = 5, id = 247,
		  name = lang:get(<<"第247波"/utf8>>), lev = 221,
		  unit_ids = [60407], is_reset = 0, formation = {1, 1}};
get({5, 248}) ->
    #endless_data{type = 5, id = 248,
		  name = lang:get(<<"第248波"/utf8>>), lev = 222,
		  unit_ids = [60408], is_reset = 0, formation = {1, 1}};
get({5, 249}) ->
    #endless_data{type = 5, id = 249,
		  name = lang:get(<<"第249波"/utf8>>), lev = 223,
		  unit_ids = [60409], is_reset = 0, formation = {1, 1}};
get({5, 250}) ->
    #endless_data{type = 5, id = 250,
		  name = lang:get(<<"第250波"/utf8>>), lev = 224,
		  unit_ids = [60410], is_reset = 0, formation = {1, 1}};
get({5, 251}) ->
    #endless_data{type = 5, id = 251,
		  name = lang:get(<<"第251波"/utf8>>), lev = 225,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 252}) ->
    #endless_data{type = 5, id = 252,
		  name = lang:get(<<"第252波"/utf8>>), lev = 225,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 253}) ->
    #endless_data{type = 5, id = 253,
		  name = lang:get(<<"第253波"/utf8>>), lev = 226,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 254}) ->
    #endless_data{type = 5, id = 254,
		  name = lang:get(<<"第254波"/utf8>>), lev = 227,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 255}) ->
    #endless_data{type = 5, id = 255,
		  name = lang:get(<<"第255波"/utf8>>), lev = 228,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 256}) ->
    #endless_data{type = 5, id = 256,
		  name = lang:get(<<"第256波"/utf8>>), lev = 229,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 257}) ->
    #endless_data{type = 5, id = 257,
		  name = lang:get(<<"第257波"/utf8>>), lev = 229,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 258}) ->
    #endless_data{type = 5, id = 258,
		  name = lang:get(<<"第258波"/utf8>>), lev = 230,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 259}) ->
    #endless_data{type = 5, id = 259,
		  name = lang:get(<<"第259波"/utf8>>), lev = 231,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 260}) ->
    #endless_data{type = 5, id = 260,
		  name = lang:get(<<"第260波"/utf8>>), lev = 232,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 261}) ->
    #endless_data{type = 5, id = 261,
		  name = lang:get(<<"第261波"/utf8>>), lev = 233,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 262}) ->
    #endless_data{type = 5, id = 262,
		  name = lang:get(<<"第262波"/utf8>>), lev = 233,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 263}) ->
    #endless_data{type = 5, id = 263,
		  name = lang:get(<<"第263波"/utf8>>), lev = 234,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 264}) ->
    #endless_data{type = 5, id = 264,
		  name = lang:get(<<"第264波"/utf8>>), lev = 235,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 265}) ->
    #endless_data{type = 5, id = 265,
		  name = lang:get(<<"第265波"/utf8>>), lev = 236,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 266}) ->
    #endless_data{type = 5, id = 266,
		  name = lang:get(<<"第266波"/utf8>>), lev = 237,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 267}) ->
    #endless_data{type = 5, id = 267,
		  name = lang:get(<<"第267波"/utf8>>), lev = 237,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 268}) ->
    #endless_data{type = 5, id = 268,
		  name = lang:get(<<"第268波"/utf8>>), lev = 238,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 269}) ->
    #endless_data{type = 5, id = 269,
		  name = lang:get(<<"第269波"/utf8>>), lev = 239,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 270}) ->
    #endless_data{type = 5, id = 270,
		  name = lang:get(<<"第270波"/utf8>>), lev = 240,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 271}) ->
    #endless_data{type = 5, id = 271,
		  name = lang:get(<<"第271波"/utf8>>), lev = 241,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 272}) ->
    #endless_data{type = 5, id = 272,
		  name = lang:get(<<"第272波"/utf8>>), lev = 241,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 273}) ->
    #endless_data{type = 5, id = 273,
		  name = lang:get(<<"第273波"/utf8>>), lev = 242,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 274}) ->
    #endless_data{type = 5, id = 274,
		  name = lang:get(<<"第274波"/utf8>>), lev = 243,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 275}) ->
    #endless_data{type = 5, id = 275,
		  name = lang:get(<<"第275波"/utf8>>), lev = 244,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 276}) ->
    #endless_data{type = 5, id = 276,
		  name = lang:get(<<"第276波"/utf8>>), lev = 245,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 277}) ->
    #endless_data{type = 5, id = 277,
		  name = lang:get(<<"第277波"/utf8>>), lev = 245,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 278}) ->
    #endless_data{type = 5, id = 278,
		  name = lang:get(<<"第278波"/utf8>>), lev = 246,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 279}) ->
    #endless_data{type = 5, id = 279,
		  name = lang:get(<<"第279波"/utf8>>), lev = 247,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 280}) ->
    #endless_data{type = 5, id = 280,
		  name = lang:get(<<"第280波"/utf8>>), lev = 248,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 281}) ->
    #endless_data{type = 5, id = 281,
		  name = lang:get(<<"第281波"/utf8>>), lev = 249,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 282}) ->
    #endless_data{type = 5, id = 282,
		  name = lang:get(<<"第282波"/utf8>>), lev = 249,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 283}) ->
    #endless_data{type = 5, id = 283,
		  name = lang:get(<<"第283波"/utf8>>), lev = 250,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 284}) ->
    #endless_data{type = 5, id = 284,
		  name = lang:get(<<"第284波"/utf8>>), lev = 251,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 285}) ->
    #endless_data{type = 5, id = 285,
		  name = lang:get(<<"第285波"/utf8>>), lev = 252,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 286}) ->
    #endless_data{type = 5, id = 286,
		  name = lang:get(<<"第286波"/utf8>>), lev = 253,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 287}) ->
    #endless_data{type = 5, id = 287,
		  name = lang:get(<<"第287波"/utf8>>), lev = 253,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 288}) ->
    #endless_data{type = 5, id = 288,
		  name = lang:get(<<"第288波"/utf8>>), lev = 254,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 289}) ->
    #endless_data{type = 5, id = 289,
		  name = lang:get(<<"第289波"/utf8>>), lev = 255,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 290}) ->
    #endless_data{type = 5, id = 290,
		  name = lang:get(<<"第290波"/utf8>>), lev = 256,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 291}) ->
    #endless_data{type = 5, id = 291,
		  name = lang:get(<<"第291波"/utf8>>), lev = 257,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 292}) ->
    #endless_data{type = 5, id = 292,
		  name = lang:get(<<"第292波"/utf8>>), lev = 257,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 293}) ->
    #endless_data{type = 5, id = 293,
		  name = lang:get(<<"第293波"/utf8>>), lev = 258,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 294}) ->
    #endless_data{type = 5, id = 294,
		  name = lang:get(<<"第294波"/utf8>>), lev = 259,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 295}) ->
    #endless_data{type = 5, id = 295,
		  name = lang:get(<<"第295波"/utf8>>), lev = 260,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 296}) ->
    #endless_data{type = 5, id = 296,
		  name = lang:get(<<"第296波"/utf8>>), lev = 261,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 297}) ->
    #endless_data{type = 5, id = 297,
		  name = lang:get(<<"第297波"/utf8>>), lev = 261,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 298}) ->
    #endless_data{type = 5, id = 298,
		  name = lang:get(<<"第298波"/utf8>>), lev = 262,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 299}) ->
    #endless_data{type = 5, id = 299,
		  name = lang:get(<<"第299波"/utf8>>), lev = 263,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 300}) ->
    #endless_data{type = 5, id = 300,
		  name = lang:get(<<"第300波"/utf8>>), lev = 264,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 301}) ->
    #endless_data{type = 5, id = 301,
		  name = lang:get(<<"第301波"/utf8>>), lev = 265,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 302}) ->
    #endless_data{type = 5, id = 302,
		  name = lang:get(<<"第302波"/utf8>>), lev = 265,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 303}) ->
    #endless_data{type = 5, id = 303,
		  name = lang:get(<<"第303波"/utf8>>), lev = 266,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 304}) ->
    #endless_data{type = 5, id = 304,
		  name = lang:get(<<"第304波"/utf8>>), lev = 267,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 305}) ->
    #endless_data{type = 5, id = 305,
		  name = lang:get(<<"第305波"/utf8>>), lev = 268,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 306}) ->
    #endless_data{type = 5, id = 306,
		  name = lang:get(<<"第306波"/utf8>>), lev = 269,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 307}) ->
    #endless_data{type = 5, id = 307,
		  name = lang:get(<<"第307波"/utf8>>), lev = 269,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 308}) ->
    #endless_data{type = 5, id = 308,
		  name = lang:get(<<"第308波"/utf8>>), lev = 270,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 309}) ->
    #endless_data{type = 5, id = 309,
		  name = lang:get(<<"第309波"/utf8>>), lev = 271,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 310}) ->
    #endless_data{type = 5, id = 310,
		  name = lang:get(<<"第310波"/utf8>>), lev = 272,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 311}) ->
    #endless_data{type = 5, id = 311,
		  name = lang:get(<<"第311波"/utf8>>), lev = 273,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 312}) ->
    #endless_data{type = 5, id = 312,
		  name = lang:get(<<"第312波"/utf8>>), lev = 273,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 313}) ->
    #endless_data{type = 5, id = 313,
		  name = lang:get(<<"第313波"/utf8>>), lev = 274,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 314}) ->
    #endless_data{type = 5, id = 314,
		  name = lang:get(<<"第314波"/utf8>>), lev = 275,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 315}) ->
    #endless_data{type = 5, id = 315,
		  name = lang:get(<<"第315波"/utf8>>), lev = 276,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 316}) ->
    #endless_data{type = 5, id = 316,
		  name = lang:get(<<"第316波"/utf8>>), lev = 277,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 317}) ->
    #endless_data{type = 5, id = 317,
		  name = lang:get(<<"第317波"/utf8>>), lev = 277,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 318}) ->
    #endless_data{type = 5, id = 318,
		  name = lang:get(<<"第318波"/utf8>>), lev = 278,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 319}) ->
    #endless_data{type = 5, id = 319,
		  name = lang:get(<<"第319波"/utf8>>), lev = 279,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 320}) ->
    #endless_data{type = 5, id = 320,
		  name = lang:get(<<"第320波"/utf8>>), lev = 280,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 321}) ->
    #endless_data{type = 5, id = 321,
		  name = lang:get(<<"第321波"/utf8>>), lev = 281,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 322}) ->
    #endless_data{type = 5, id = 322,
		  name = lang:get(<<"第322波"/utf8>>), lev = 281,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 323}) ->
    #endless_data{type = 5, id = 323,
		  name = lang:get(<<"第323波"/utf8>>), lev = 282,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 324}) ->
    #endless_data{type = 5, id = 324,
		  name = lang:get(<<"第324波"/utf8>>), lev = 283,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 325}) ->
    #endless_data{type = 5, id = 325,
		  name = lang:get(<<"第325波"/utf8>>), lev = 284,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 326}) ->
    #endless_data{type = 5, id = 326,
		  name = lang:get(<<"第326波"/utf8>>), lev = 285,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 327}) ->
    #endless_data{type = 5, id = 327,
		  name = lang:get(<<"第327波"/utf8>>), lev = 285,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 328}) ->
    #endless_data{type = 5, id = 328,
		  name = lang:get(<<"第328波"/utf8>>), lev = 286,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 329}) ->
    #endless_data{type = 5, id = 329,
		  name = lang:get(<<"第329波"/utf8>>), lev = 287,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 330}) ->
    #endless_data{type = 5, id = 330,
		  name = lang:get(<<"第330波"/utf8>>), lev = 288,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 331}) ->
    #endless_data{type = 5, id = 331,
		  name = lang:get(<<"第331波"/utf8>>), lev = 289,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 332}) ->
    #endless_data{type = 5, id = 332,
		  name = lang:get(<<"第332波"/utf8>>), lev = 289,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 333}) ->
    #endless_data{type = 5, id = 333,
		  name = lang:get(<<"第333波"/utf8>>), lev = 290,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 334}) ->
    #endless_data{type = 5, id = 334,
		  name = lang:get(<<"第334波"/utf8>>), lev = 291,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 335}) ->
    #endless_data{type = 5, id = 335,
		  name = lang:get(<<"第335波"/utf8>>), lev = 292,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 336}) ->
    #endless_data{type = 5, id = 336,
		  name = lang:get(<<"第336波"/utf8>>), lev = 293,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 337}) ->
    #endless_data{type = 5, id = 337,
		  name = lang:get(<<"第337波"/utf8>>), lev = 293,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 338}) ->
    #endless_data{type = 5, id = 338,
		  name = lang:get(<<"第338波"/utf8>>), lev = 294,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 339}) ->
    #endless_data{type = 5, id = 339,
		  name = lang:get(<<"第339波"/utf8>>), lev = 295,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 340}) ->
    #endless_data{type = 5, id = 340,
		  name = lang:get(<<"第340波"/utf8>>), lev = 296,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 341}) ->
    #endless_data{type = 5, id = 341,
		  name = lang:get(<<"第341波"/utf8>>), lev = 297,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 342}) ->
    #endless_data{type = 5, id = 342,
		  name = lang:get(<<"第342波"/utf8>>), lev = 297,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 343}) ->
    #endless_data{type = 5, id = 343,
		  name = lang:get(<<"第343波"/utf8>>), lev = 298,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 344}) ->
    #endless_data{type = 5, id = 344,
		  name = lang:get(<<"第344波"/utf8>>), lev = 299,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 345}) ->
    #endless_data{type = 5, id = 345,
		  name = lang:get(<<"第345波"/utf8>>), lev = 300,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 346}) ->
    #endless_data{type = 5, id = 346,
		  name = lang:get(<<"第346波"/utf8>>), lev = 300,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 347}) ->
    #endless_data{type = 5, id = 347,
		  name = lang:get(<<"第347波"/utf8>>), lev = 300,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 348}) ->
    #endless_data{type = 5, id = 348,
		  name = lang:get(<<"第348波"/utf8>>), lev = 300,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 349}) ->
    #endless_data{type = 5, id = 349,
		  name = lang:get(<<"第349波"/utf8>>), lev = 300,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 350}) ->
    #endless_data{type = 5, id = 350,
		  name = lang:get(<<"第350波"/utf8>>), lev = 300,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 351}) ->
    #endless_data{type = 5, id = 351,
		  name = lang:get(<<"第351波"/utf8>>), lev = 300,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 352}) ->
    #endless_data{type = 5, id = 352,
		  name = lang:get(<<"第352波"/utf8>>), lev = 300,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 353}) ->
    #endless_data{type = 5, id = 353,
		  name = lang:get(<<"第353波"/utf8>>), lev = 300,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 354}) ->
    #endless_data{type = 5, id = 354,
		  name = lang:get(<<"第354波"/utf8>>), lev = 300,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 355}) ->
    #endless_data{type = 5, id = 355,
		  name = lang:get(<<"第355波"/utf8>>), lev = 300,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 356}) ->
    #endless_data{type = 5, id = 356,
		  name = lang:get(<<"第356波"/utf8>>), lev = 300,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 357}) ->
    #endless_data{type = 5, id = 357,
		  name = lang:get(<<"第357波"/utf8>>), lev = 300,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 358}) ->
    #endless_data{type = 5, id = 358,
		  name = lang:get(<<"第358波"/utf8>>), lev = 300,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 359}) ->
    #endless_data{type = 5, id = 359,
		  name = lang:get(<<"第359波"/utf8>>), lev = 300,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 360}) ->
    #endless_data{type = 5, id = 360,
		  name = lang:get(<<"第360波"/utf8>>), lev = 300,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 361}) ->
    #endless_data{type = 5, id = 361,
		  name = lang:get(<<"第361波"/utf8>>), lev = 300,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 362}) ->
    #endless_data{type = 5, id = 362,
		  name = lang:get(<<"第362波"/utf8>>), lev = 300,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 363}) ->
    #endless_data{type = 5, id = 363,
		  name = lang:get(<<"第363波"/utf8>>), lev = 300,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 364}) ->
    #endless_data{type = 5, id = 364,
		  name = lang:get(<<"第364波"/utf8>>), lev = 300,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 365}) ->
    #endless_data{type = 5, id = 365,
		  name = lang:get(<<"第365波"/utf8>>), lev = 300,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 366}) ->
    #endless_data{type = 5, id = 366,
		  name = lang:get(<<"第366波"/utf8>>), lev = 300,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 367}) ->
    #endless_data{type = 5, id = 367,
		  name = lang:get(<<"第367波"/utf8>>), lev = 300,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 368}) ->
    #endless_data{type = 5, id = 368,
		  name = lang:get(<<"第368波"/utf8>>), lev = 300,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 369}) ->
    #endless_data{type = 5, id = 369,
		  name = lang:get(<<"第369波"/utf8>>), lev = 300,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 370}) ->
    #endless_data{type = 5, id = 370,
		  name = lang:get(<<"第370波"/utf8>>), lev = 300,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 371}) ->
    #endless_data{type = 5, id = 371,
		  name = lang:get(<<"第371波"/utf8>>), lev = 300,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 372}) ->
    #endless_data{type = 5, id = 372,
		  name = lang:get(<<"第372波"/utf8>>), lev = 300,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 373}) ->
    #endless_data{type = 5, id = 373,
		  name = lang:get(<<"第373波"/utf8>>), lev = 300,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 374}) ->
    #endless_data{type = 5, id = 374,
		  name = lang:get(<<"第374波"/utf8>>), lev = 300,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 375}) ->
    #endless_data{type = 5, id = 375,
		  name = lang:get(<<"第375波"/utf8>>), lev = 300,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 376}) ->
    #endless_data{type = 5, id = 376,
		  name = lang:get(<<"第376波"/utf8>>), lev = 300,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 377}) ->
    #endless_data{type = 5, id = 377,
		  name = lang:get(<<"第377波"/utf8>>), lev = 300,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 378}) ->
    #endless_data{type = 5, id = 378,
		  name = lang:get(<<"第378波"/utf8>>), lev = 300,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 379}) ->
    #endless_data{type = 5, id = 379,
		  name = lang:get(<<"第379波"/utf8>>), lev = 300,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 380}) ->
    #endless_data{type = 5, id = 380,
		  name = lang:get(<<"第380波"/utf8>>), lev = 300,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 381}) ->
    #endless_data{type = 5, id = 381,
		  name = lang:get(<<"第381波"/utf8>>), lev = 300,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 382}) ->
    #endless_data{type = 5, id = 382,
		  name = lang:get(<<"第382波"/utf8>>), lev = 300,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 383}) ->
    #endless_data{type = 5, id = 383,
		  name = lang:get(<<"第383波"/utf8>>), lev = 300,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 384}) ->
    #endless_data{type = 5, id = 384,
		  name = lang:get(<<"第384波"/utf8>>), lev = 300,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 385}) ->
    #endless_data{type = 5, id = 385,
		  name = lang:get(<<"第385波"/utf8>>), lev = 300,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 386}) ->
    #endless_data{type = 5, id = 386,
		  name = lang:get(<<"第386波"/utf8>>), lev = 300,
		  unit_ids = [60501], is_reset = 0, formation = {1, 1}};
get({5, 387}) ->
    #endless_data{type = 5, id = 387,
		  name = lang:get(<<"第387波"/utf8>>), lev = 300,
		  unit_ids = [60502], is_reset = 0, formation = {1, 1}};
get({5, 388}) ->
    #endless_data{type = 5, id = 388,
		  name = lang:get(<<"第388波"/utf8>>), lev = 300,
		  unit_ids = [60503], is_reset = 0, formation = {1, 1}};
get({5, 389}) ->
    #endless_data{type = 5, id = 389,
		  name = lang:get(<<"第389波"/utf8>>), lev = 300,
		  unit_ids = [60504], is_reset = 0, formation = {1, 1}};
get({5, 390}) ->
    #endless_data{type = 5, id = 390,
		  name = lang:get(<<"第390波"/utf8>>), lev = 300,
		  unit_ids = [60505], is_reset = 0, formation = {1, 1}};
get({5, 391}) ->
    #endless_data{type = 5, id = 391,
		  name = lang:get(<<"第391波"/utf8>>), lev = 300,
		  unit_ids = [60506], is_reset = 0, formation = {1, 1}};
get({5, 392}) ->
    #endless_data{type = 5, id = 392,
		  name = lang:get(<<"第392波"/utf8>>), lev = 300,
		  unit_ids = [60507], is_reset = 0, formation = {1, 1}};
get({5, 393}) ->
    #endless_data{type = 5, id = 393,
		  name = lang:get(<<"第393波"/utf8>>), lev = 300,
		  unit_ids = [60508], is_reset = 0, formation = {1, 1}};
get({5, 394}) ->
    #endless_data{type = 5, id = 394,
		  name = lang:get(<<"第394波"/utf8>>), lev = 300,
		  unit_ids = [60509], is_reset = 0, formation = {1, 1}};
get({5, 395}) ->
    #endless_data{type = 5, id = 395,
		  name = lang:get(<<"第395波"/utf8>>), lev = 300,
		  unit_ids = [60510], is_reset = 0, formation = {1, 1}};
get({5, 396}) ->
    #endless_data{type = 5, id = 396,
		  name = lang:get(<<"第396波"/utf8>>), lev = 300,
		  unit_ids = [60511], is_reset = 0, formation = {1, 1}};
get({5, 397}) ->
    #endless_data{type = 5, id = 397,
		  name = lang:get(<<"第397波"/utf8>>), lev = 300,
		  unit_ids = [60512], is_reset = 0, formation = {1, 1}};
get({5, 398}) ->
    #endless_data{type = 5, id = 398,
		  name = lang:get(<<"第398波"/utf8>>), lev = 300,
		  unit_ids = [60513], is_reset = 0, formation = {1, 1}};
get({5, 399}) ->
    #endless_data{type = 5, id = 399,
		  name = lang:get(<<"第399波"/utf8>>), lev = 300,
		  unit_ids = [60514], is_reset = 0, formation = {1, 1}};
get({5, 400}) ->
    #endless_data{type = 5, id = 400,
		  name = lang:get(<<"第400波"/utf8>>), lev = 300,
		  unit_ids = [60515], is_reset = 0, formation = {1, 1}};
get({5, 401}) ->
    #endless_data{type = 5, id = 401,
		  name = lang:get(<<"第401波"/utf8>>), lev = 301,
		  unit_ids = [60601], is_reset = 0, formation = {1, 1}};
get({5, 402}) ->
    #endless_data{type = 5, id = 402,
		  name = lang:get(<<"第402波"/utf8>>), lev = 301,
		  unit_ids = [60602], is_reset = 0, formation = {1, 1}};
get({5, 403}) ->
    #endless_data{type = 5, id = 403,
		  name = lang:get(<<"第403波"/utf8>>), lev = 302,
		  unit_ids = [60603], is_reset = 0, formation = {2, 1}};
get({5, 404}) ->
    #endless_data{type = 5, id = 404,
		  name = lang:get(<<"第404波"/utf8>>), lev = 302,
		  unit_ids = [60604], is_reset = 0, formation = {2, 1}};
get({5, 405}) ->
    #endless_data{type = 5, id = 405,
		  name = lang:get(<<"第405波"/utf8>>), lev = 303,
		  unit_ids = [60605], is_reset = 0, formation = {3, 1}};
get({5, 406}) ->
    #endless_data{type = 5, id = 406,
		  name = lang:get(<<"第406波"/utf8>>), lev = 303,
		  unit_ids = [60606], is_reset = 0, formation = {3, 1}};
get({5, 407}) ->
    #endless_data{type = 5, id = 407,
		  name = lang:get(<<"第407波"/utf8>>), lev = 304,
		  unit_ids = [60607], is_reset = 0, formation = {4, 1}};
get({5, 408}) ->
    #endless_data{type = 5, id = 408,
		  name = lang:get(<<"第408波"/utf8>>), lev = 304,
		  unit_ids = [60608], is_reset = 0, formation = {4, 1}};
get({5, 409}) ->
    #endless_data{type = 5, id = 409,
		  name = lang:get(<<"第409波"/utf8>>), lev = 305,
		  unit_ids = [60609], is_reset = 0, formation = {5, 1}};
get({5, 410}) ->
    #endless_data{type = 5, id = 410,
		  name = lang:get(<<"第410波"/utf8>>), lev = 305,
		  unit_ids = [60610], is_reset = 0, formation = {5, 1}};
get({5, 411}) ->
    #endless_data{type = 5, id = 411,
		  name = lang:get(<<"第411波"/utf8>>), lev = 306,
		  unit_ids = [60611], is_reset = 0, formation = {6, 1}};
get({5, 412}) ->
    #endless_data{type = 5, id = 412,
		  name = lang:get(<<"第412波"/utf8>>), lev = 306,
		  unit_ids = [60612], is_reset = 0, formation = {6, 1}};
get({5, 413}) ->
    #endless_data{type = 5, id = 413,
		  name = lang:get(<<"第413波"/utf8>>), lev = 307,
		  unit_ids = [60613], is_reset = 0, formation = {1, 1}};
get({5, 414}) ->
    #endless_data{type = 5, id = 414,
		  name = lang:get(<<"第414波"/utf8>>), lev = 307,
		  unit_ids = [60614], is_reset = 0, formation = {1, 1}};
get({5, 415}) ->
    #endless_data{type = 5, id = 415,
		  name = lang:get(<<"第415波"/utf8>>), lev = 308,
		  unit_ids = [60615], is_reset = 0, formation = {2, 1}};
get({5, 416}) ->
    #endless_data{type = 5, id = 416,
		  name = lang:get(<<"第416波"/utf8>>), lev = 308,
		  unit_ids = [60601], is_reset = 0, formation = {2, 1}};
get({5, 417}) ->
    #endless_data{type = 5, id = 417,
		  name = lang:get(<<"第417波"/utf8>>), lev = 309,
		  unit_ids = [60602], is_reset = 0, formation = {3, 1}};
get({5, 418}) ->
    #endless_data{type = 5, id = 418,
		  name = lang:get(<<"第418波"/utf8>>), lev = 309,
		  unit_ids = [60603], is_reset = 0, formation = {3, 1}};
get({5, 419}) ->
    #endless_data{type = 5, id = 419,
		  name = lang:get(<<"第419波"/utf8>>), lev = 310,
		  unit_ids = [60604], is_reset = 0, formation = {4, 1}};
get({5, 420}) ->
    #endless_data{type = 5, id = 420,
		  name = lang:get(<<"第420波"/utf8>>), lev = 310,
		  unit_ids = [60605], is_reset = 0, formation = {4, 1}};
get({5, 421}) ->
    #endless_data{type = 5, id = 421,
		  name = lang:get(<<"第421波"/utf8>>), lev = 311,
		  unit_ids = [60606], is_reset = 0, formation = {5, 1}};
get({5, 422}) ->
    #endless_data{type = 5, id = 422,
		  name = lang:get(<<"第422波"/utf8>>), lev = 311,
		  unit_ids = [60607], is_reset = 0, formation = {5, 1}};
get({5, 423}) ->
    #endless_data{type = 5, id = 423,
		  name = lang:get(<<"第423波"/utf8>>), lev = 312,
		  unit_ids = [60608], is_reset = 0, formation = {6, 1}};
get({5, 424}) ->
    #endless_data{type = 5, id = 424,
		  name = lang:get(<<"第424波"/utf8>>), lev = 312,
		  unit_ids = [60609], is_reset = 0, formation = {6, 1}};
get({5, 425}) ->
    #endless_data{type = 5, id = 425,
		  name = lang:get(<<"第425波"/utf8>>), lev = 313,
		  unit_ids = [60610], is_reset = 0, formation = {1, 1}};
get({5, 426}) ->
    #endless_data{type = 5, id = 426,
		  name = lang:get(<<"第426波"/utf8>>), lev = 313,
		  unit_ids = [60611], is_reset = 0, formation = {1, 1}};
get({5, 427}) ->
    #endless_data{type = 5, id = 427,
		  name = lang:get(<<"第427波"/utf8>>), lev = 314,
		  unit_ids = [60612], is_reset = 0, formation = {2, 1}};
get({5, 428}) ->
    #endless_data{type = 5, id = 428,
		  name = lang:get(<<"第428波"/utf8>>), lev = 314,
		  unit_ids = [60613], is_reset = 0, formation = {2, 1}};
get({5, 429}) ->
    #endless_data{type = 5, id = 429,
		  name = lang:get(<<"第429波"/utf8>>), lev = 315,
		  unit_ids = [60614], is_reset = 0, formation = {3, 1}};
get({5, 430}) ->
    #endless_data{type = 5, id = 430,
		  name = lang:get(<<"第430波"/utf8>>), lev = 315,
		  unit_ids = [60615], is_reset = 0, formation = {3, 1}};
get({5, 431}) ->
    #endless_data{type = 5, id = 431,
		  name = lang:get(<<"第431波"/utf8>>), lev = 316,
		  unit_ids = [60601], is_reset = 0, formation = {4, 1}};
get({5, 432}) ->
    #endless_data{type = 5, id = 432,
		  name = lang:get(<<"第432波"/utf8>>), lev = 316,
		  unit_ids = [60602], is_reset = 0, formation = {4, 1}};
get({5, 433}) ->
    #endless_data{type = 5, id = 433,
		  name = lang:get(<<"第433波"/utf8>>), lev = 317,
		  unit_ids = [60603], is_reset = 0, formation = {5, 1}};
get({5, 434}) ->
    #endless_data{type = 5, id = 434,
		  name = lang:get(<<"第434波"/utf8>>), lev = 317,
		  unit_ids = [60604], is_reset = 0, formation = {5, 1}};
get({5, 435}) ->
    #endless_data{type = 5, id = 435,
		  name = lang:get(<<"第435波"/utf8>>), lev = 318,
		  unit_ids = [60605], is_reset = 0, formation = {6, 1}};
get({5, 436}) ->
    #endless_data{type = 5, id = 436,
		  name = lang:get(<<"第436波"/utf8>>), lev = 318,
		  unit_ids = [60606], is_reset = 0, formation = {6, 1}};
get({5, 437}) ->
    #endless_data{type = 5, id = 437,
		  name = lang:get(<<"第437波"/utf8>>), lev = 319,
		  unit_ids = [60607], is_reset = 0, formation = {1, 1}};
get({5, 438}) ->
    #endless_data{type = 5, id = 438,
		  name = lang:get(<<"第438波"/utf8>>), lev = 319,
		  unit_ids = [60608], is_reset = 0, formation = {1, 1}};
get({5, 439}) ->
    #endless_data{type = 5, id = 439,
		  name = lang:get(<<"第439波"/utf8>>), lev = 320,
		  unit_ids = [60609], is_reset = 0, formation = {2, 1}};
get({5, 440}) ->
    #endless_data{type = 5, id = 440,
		  name = lang:get(<<"第440波"/utf8>>), lev = 320,
		  unit_ids = [60610], is_reset = 0, formation = {2, 1}};
get({5, 441}) ->
    #endless_data{type = 5, id = 441,
		  name = lang:get(<<"第441波"/utf8>>), lev = 321,
		  unit_ids = [60611], is_reset = 0, formation = {3, 1}};
get({5, 442}) ->
    #endless_data{type = 5, id = 442,
		  name = lang:get(<<"第442波"/utf8>>), lev = 321,
		  unit_ids = [60612], is_reset = 0, formation = {3, 1}};
get({5, 443}) ->
    #endless_data{type = 5, id = 443,
		  name = lang:get(<<"第443波"/utf8>>), lev = 322,
		  unit_ids = [60613], is_reset = 0, formation = {4, 1}};
get({5, 444}) ->
    #endless_data{type = 5, id = 444,
		  name = lang:get(<<"第444波"/utf8>>), lev = 322,
		  unit_ids = [60614], is_reset = 0, formation = {4, 1}};
get({5, 445}) ->
    #endless_data{type = 5, id = 445,
		  name = lang:get(<<"第445波"/utf8>>), lev = 323,
		  unit_ids = [60615], is_reset = 0, formation = {5, 1}};
get({5, 446}) ->
    #endless_data{type = 5, id = 446,
		  name = lang:get(<<"第446波"/utf8>>), lev = 323,
		  unit_ids = [60601], is_reset = 0, formation = {5, 1}};
get({5, 447}) ->
    #endless_data{type = 5, id = 447,
		  name = lang:get(<<"第447波"/utf8>>), lev = 324,
		  unit_ids = [60602], is_reset = 0, formation = {6, 1}};
get({5, 448}) ->
    #endless_data{type = 5, id = 448,
		  name = lang:get(<<"第448波"/utf8>>), lev = 324,
		  unit_ids = [60603], is_reset = 0, formation = {6, 1}};
get({5, 449}) ->
    #endless_data{type = 5, id = 449,
		  name = lang:get(<<"第449波"/utf8>>), lev = 325,
		  unit_ids = [60604], is_reset = 0, formation = {1, 1}};
get({5, 450}) ->
    #endless_data{type = 5, id = 450,
		  name = lang:get(<<"第450波"/utf8>>), lev = 325,
		  unit_ids = [60605], is_reset = 0, formation = {1, 1}};
get({5, 451}) ->
    #endless_data{type = 5, id = 451,
		  name = lang:get(<<"第451波"/utf8>>), lev = 326,
		  unit_ids = [60606], is_reset = 0, formation = {2, 1}};
get({5, 452}) ->
    #endless_data{type = 5, id = 452,
		  name = lang:get(<<"第452波"/utf8>>), lev = 326,
		  unit_ids = [60607], is_reset = 0, formation = {2, 1}};
get({5, 453}) ->
    #endless_data{type = 5, id = 453,
		  name = lang:get(<<"第453波"/utf8>>), lev = 327,
		  unit_ids = [60608], is_reset = 0, formation = {3, 1}};
get({5, 454}) ->
    #endless_data{type = 5, id = 454,
		  name = lang:get(<<"第454波"/utf8>>), lev = 327,
		  unit_ids = [60609], is_reset = 0, formation = {3, 1}};
get({5, 455}) ->
    #endless_data{type = 5, id = 455,
		  name = lang:get(<<"第455波"/utf8>>), lev = 328,
		  unit_ids = [60610], is_reset = 0, formation = {4, 1}};
get({5, 456}) ->
    #endless_data{type = 5, id = 456,
		  name = lang:get(<<"第456波"/utf8>>), lev = 328,
		  unit_ids = [60611], is_reset = 0, formation = {4, 1}};
get({5, 457}) ->
    #endless_data{type = 5, id = 457,
		  name = lang:get(<<"第457波"/utf8>>), lev = 329,
		  unit_ids = [60612], is_reset = 0, formation = {5, 1}};
get({5, 458}) ->
    #endless_data{type = 5, id = 458,
		  name = lang:get(<<"第458波"/utf8>>), lev = 329,
		  unit_ids = [60613], is_reset = 0, formation = {5, 1}};
get({5, 459}) ->
    #endless_data{type = 5, id = 459,
		  name = lang:get(<<"第459波"/utf8>>), lev = 330,
		  unit_ids = [60614], is_reset = 0, formation = {6, 1}};
get({5, 460}) ->
    #endless_data{type = 5, id = 460,
		  name = lang:get(<<"第460波"/utf8>>), lev = 330,
		  unit_ids = [60615], is_reset = 0, formation = {6, 1}};
get({5, 461}) ->
    #endless_data{type = 5, id = 461,
		  name = lang:get(<<"第461波"/utf8>>), lev = 331,
		  unit_ids = [60601], is_reset = 0, formation = {1, 1}};
get({5, 462}) ->
    #endless_data{type = 5, id = 462,
		  name = lang:get(<<"第462波"/utf8>>), lev = 331,
		  unit_ids = [60602], is_reset = 0, formation = {1, 1}};
get({5, 463}) ->
    #endless_data{type = 5, id = 463,
		  name = lang:get(<<"第463波"/utf8>>), lev = 332,
		  unit_ids = [60603], is_reset = 0, formation = {2, 1}};
get({5, 464}) ->
    #endless_data{type = 5, id = 464,
		  name = lang:get(<<"第464波"/utf8>>), lev = 332,
		  unit_ids = [60604], is_reset = 0, formation = {2, 1}};
get({5, 465}) ->
    #endless_data{type = 5, id = 465,
		  name = lang:get(<<"第465波"/utf8>>), lev = 333,
		  unit_ids = [60605], is_reset = 0, formation = {3, 1}};
get({5, 466}) ->
    #endless_data{type = 5, id = 466,
		  name = lang:get(<<"第466波"/utf8>>), lev = 333,
		  unit_ids = [60606], is_reset = 0, formation = {3, 1}};
get({5, 467}) ->
    #endless_data{type = 5, id = 467,
		  name = lang:get(<<"第467波"/utf8>>), lev = 334,
		  unit_ids = [60607], is_reset = 0, formation = {4, 1}};
get({5, 468}) ->
    #endless_data{type = 5, id = 468,
		  name = lang:get(<<"第468波"/utf8>>), lev = 334,
		  unit_ids = [60608], is_reset = 0, formation = {4, 1}};
get({5, 469}) ->
    #endless_data{type = 5, id = 469,
		  name = lang:get(<<"第469波"/utf8>>), lev = 335,
		  unit_ids = [60609], is_reset = 0, formation = {5, 1}};
get({5, 470}) ->
    #endless_data{type = 5, id = 470,
		  name = lang:get(<<"第470波"/utf8>>), lev = 335,
		  unit_ids = [60610], is_reset = 0, formation = {5, 1}};
get({5, 471}) ->
    #endless_data{type = 5, id = 471,
		  name = lang:get(<<"第471波"/utf8>>), lev = 336,
		  unit_ids = [60611], is_reset = 0, formation = {6, 1}};
get({5, 472}) ->
    #endless_data{type = 5, id = 472,
		  name = lang:get(<<"第472波"/utf8>>), lev = 336,
		  unit_ids = [60612], is_reset = 0, formation = {6, 1}};
get({5, 473}) ->
    #endless_data{type = 5, id = 473,
		  name = lang:get(<<"第473波"/utf8>>), lev = 337,
		  unit_ids = [60613], is_reset = 0, formation = {1, 1}};
get({5, 474}) ->
    #endless_data{type = 5, id = 474,
		  name = lang:get(<<"第474波"/utf8>>), lev = 337,
		  unit_ids = [60614], is_reset = 0, formation = {1, 1}};
get({5, 475}) ->
    #endless_data{type = 5, id = 475,
		  name = lang:get(<<"第475波"/utf8>>), lev = 338,
		  unit_ids = [60615], is_reset = 0, formation = {2, 1}};
get({5, 476}) ->
    #endless_data{type = 5, id = 476,
		  name = lang:get(<<"第476波"/utf8>>), lev = 338,
		  unit_ids = [60601], is_reset = 0, formation = {2, 1}};
get({5, 477}) ->
    #endless_data{type = 5, id = 477,
		  name = lang:get(<<"第477波"/utf8>>), lev = 339,
		  unit_ids = [60602], is_reset = 0, formation = {3, 1}};
get({5, 478}) ->
    #endless_data{type = 5, id = 478,
		  name = lang:get(<<"第478波"/utf8>>), lev = 339,
		  unit_ids = [60603], is_reset = 0, formation = {3, 1}};
get({5, 479}) ->
    #endless_data{type = 5, id = 479,
		  name = lang:get(<<"第479波"/utf8>>), lev = 340,
		  unit_ids = [60604], is_reset = 0, formation = {4, 1}};
get({5, 480}) ->
    #endless_data{type = 5, id = 480,
		  name = lang:get(<<"第480波"/utf8>>), lev = 340,
		  unit_ids = [60605], is_reset = 0, formation = {4, 1}};
get({5, 481}) ->
    #endless_data{type = 5, id = 481,
		  name = lang:get(<<"第481波"/utf8>>), lev = 341,
		  unit_ids = [60606], is_reset = 0, formation = {5, 1}};
get({5, 482}) ->
    #endless_data{type = 5, id = 482,
		  name = lang:get(<<"第482波"/utf8>>), lev = 341,
		  unit_ids = [60607], is_reset = 0, formation = {5, 1}};
get({5, 483}) ->
    #endless_data{type = 5, id = 483,
		  name = lang:get(<<"第483波"/utf8>>), lev = 342,
		  unit_ids = [60608], is_reset = 0, formation = {6, 1}};
get({5, 484}) ->
    #endless_data{type = 5, id = 484,
		  name = lang:get(<<"第484波"/utf8>>), lev = 342,
		  unit_ids = [60609], is_reset = 0, formation = {6, 1}};
get({5, 485}) ->
    #endless_data{type = 5, id = 485,
		  name = lang:get(<<"第485波"/utf8>>), lev = 343,
		  unit_ids = [60610], is_reset = 0, formation = {1, 1}};
get({5, 486}) ->
    #endless_data{type = 5, id = 486,
		  name = lang:get(<<"第486波"/utf8>>), lev = 343,
		  unit_ids = [60611], is_reset = 0, formation = {1, 1}};
get({5, 487}) ->
    #endless_data{type = 5, id = 487,
		  name = lang:get(<<"第487波"/utf8>>), lev = 344,
		  unit_ids = [60612], is_reset = 0, formation = {2, 1}};
get({5, 488}) ->
    #endless_data{type = 5, id = 488,
		  name = lang:get(<<"第488波"/utf8>>), lev = 344,
		  unit_ids = [60613], is_reset = 0, formation = {2, 1}};
get({5, 489}) ->
    #endless_data{type = 5, id = 489,
		  name = lang:get(<<"第489波"/utf8>>), lev = 345,
		  unit_ids = [60614], is_reset = 0, formation = {3, 1}};
get({5, 490}) ->
    #endless_data{type = 5, id = 490,
		  name = lang:get(<<"第490波"/utf8>>), lev = 345,
		  unit_ids = [60615], is_reset = 0, formation = {3, 1}};
get({5, 491}) ->
    #endless_data{type = 5, id = 491,
		  name = lang:get(<<"第491波"/utf8>>), lev = 346,
		  unit_ids = [60601], is_reset = 0, formation = {4, 1}};
get({5, 492}) ->
    #endless_data{type = 5, id = 492,
		  name = lang:get(<<"第492波"/utf8>>), lev = 346,
		  unit_ids = [60602], is_reset = 0, formation = {4, 1}};
get({5, 493}) ->
    #endless_data{type = 5, id = 493,
		  name = lang:get(<<"第493波"/utf8>>), lev = 347,
		  unit_ids = [60603], is_reset = 0, formation = {5, 1}};
get({5, 494}) ->
    #endless_data{type = 5, id = 494,
		  name = lang:get(<<"第494波"/utf8>>), lev = 347,
		  unit_ids = [60604], is_reset = 0, formation = {5, 1}};
get({5, 495}) ->
    #endless_data{type = 5, id = 495,
		  name = lang:get(<<"第495波"/utf8>>), lev = 348,
		  unit_ids = [60605], is_reset = 0, formation = {6, 1}};
get({5, 496}) ->
    #endless_data{type = 5, id = 496,
		  name = lang:get(<<"第496波"/utf8>>), lev = 348,
		  unit_ids = [60606], is_reset = 0, formation = {6, 1}};
get({5, 497}) ->
    #endless_data{type = 5, id = 497,
		  name = lang:get(<<"第497波"/utf8>>), lev = 349,
		  unit_ids = [60607], is_reset = 0, formation = {1, 1}};
get({5, 498}) ->
    #endless_data{type = 5, id = 498,
		  name = lang:get(<<"第498波"/utf8>>), lev = 349,
		  unit_ids = [60608], is_reset = 0, formation = {1, 1}};
get({5, 499}) ->
    #endless_data{type = 5, id = 499,
		  name = lang:get(<<"第499波"/utf8>>), lev = 350,
		  unit_ids = [60609], is_reset = 0, formation = {2, 1}};
get({5, 500}) ->
    #endless_data{type = 5, id = 500,
		  name = lang:get(<<"第500波"/utf8>>), lev = 350,
		  unit_ids = [60610], is_reset = 0, formation = {2, 1}};
get({5, 501}) ->
    #endless_data{type = 5, id = 501,
		  name = lang:get(<<"第501波"/utf8>>), lev = 351,
		  unit_ids = [60611], is_reset = 0, formation = {3, 1}};
get({5, 502}) ->
    #endless_data{type = 5, id = 502,
		  name = lang:get(<<"第502波"/utf8>>), lev = 351,
		  unit_ids = [60612], is_reset = 0, formation = {3, 1}};
get({5, 503}) ->
    #endless_data{type = 5, id = 503,
		  name = lang:get(<<"第503波"/utf8>>), lev = 352,
		  unit_ids = [60613], is_reset = 0, formation = {4, 1}};
get({5, 504}) ->
    #endless_data{type = 5, id = 504,
		  name = lang:get(<<"第504波"/utf8>>), lev = 352,
		  unit_ids = [60614], is_reset = 0, formation = {4, 1}};
get({5, 505}) ->
    #endless_data{type = 5, id = 505,
		  name = lang:get(<<"第505波"/utf8>>), lev = 353,
		  unit_ids = [60615], is_reset = 0, formation = {5, 1}};
get({5, 506}) ->
    #endless_data{type = 5, id = 506,
		  name = lang:get(<<"第506波"/utf8>>), lev = 353,
		  unit_ids = [60601], is_reset = 0, formation = {5, 1}};
get({5, 507}) ->
    #endless_data{type = 5, id = 507,
		  name = lang:get(<<"第507波"/utf8>>), lev = 354,
		  unit_ids = [60602], is_reset = 0, formation = {6, 1}};
get({5, 508}) ->
    #endless_data{type = 5, id = 508,
		  name = lang:get(<<"第508波"/utf8>>), lev = 354,
		  unit_ids = [60603], is_reset = 0, formation = {6, 1}};
get({5, 509}) ->
    #endless_data{type = 5, id = 509,
		  name = lang:get(<<"第509波"/utf8>>), lev = 355,
		  unit_ids = [60604], is_reset = 0, formation = {1, 1}};
get({5, 510}) ->
    #endless_data{type = 5, id = 510,
		  name = lang:get(<<"第510波"/utf8>>), lev = 355,
		  unit_ids = [60605], is_reset = 0, formation = {1, 1}};
get({5, 511}) ->
    #endless_data{type = 5, id = 511,
		  name = lang:get(<<"第511波"/utf8>>), lev = 356,
		  unit_ids = [60606], is_reset = 0, formation = {2, 1}};
get({5, 512}) ->
    #endless_data{type = 5, id = 512,
		  name = lang:get(<<"第512波"/utf8>>), lev = 356,
		  unit_ids = [60607], is_reset = 0, formation = {2, 1}};
get({5, 513}) ->
    #endless_data{type = 5, id = 513,
		  name = lang:get(<<"第513波"/utf8>>), lev = 357,
		  unit_ids = [60608], is_reset = 0, formation = {3, 1}};
get({5, 514}) ->
    #endless_data{type = 5, id = 514,
		  name = lang:get(<<"第514波"/utf8>>), lev = 357,
		  unit_ids = [60609], is_reset = 0, formation = {3, 1}};
get({5, 515}) ->
    #endless_data{type = 5, id = 515,
		  name = lang:get(<<"第515波"/utf8>>), lev = 358,
		  unit_ids = [60610], is_reset = 0, formation = {4, 1}};
get({5, 516}) ->
    #endless_data{type = 5, id = 516,
		  name = lang:get(<<"第516波"/utf8>>), lev = 358,
		  unit_ids = [60611], is_reset = 0, formation = {4, 1}};
get({5, 517}) ->
    #endless_data{type = 5, id = 517,
		  name = lang:get(<<"第517波"/utf8>>), lev = 359,
		  unit_ids = [60612], is_reset = 0, formation = {5, 1}};
get({5, 518}) ->
    #endless_data{type = 5, id = 518,
		  name = lang:get(<<"第518波"/utf8>>), lev = 359,
		  unit_ids = [60613], is_reset = 0, formation = {5, 1}};
get({5, 519}) ->
    #endless_data{type = 5, id = 519,
		  name = lang:get(<<"第519波"/utf8>>), lev = 360,
		  unit_ids = [60614], is_reset = 0, formation = {6, 1}};
get({5, 520}) ->
    #endless_data{type = 5, id = 520,
		  name = lang:get(<<"第520波"/utf8>>), lev = 360,
		  unit_ids = [60615], is_reset = 0, formation = {6, 1}};
get({5, 521}) ->
    #endless_data{type = 5, id = 521,
		  name = lang:get(<<"第521波"/utf8>>), lev = 361,
		  unit_ids = [60601], is_reset = 0, formation = {1, 1}};
get({5, 522}) ->
    #endless_data{type = 5, id = 522,
		  name = lang:get(<<"第522波"/utf8>>), lev = 361,
		  unit_ids = [60602], is_reset = 0, formation = {1, 1}};
get({5, 523}) ->
    #endless_data{type = 5, id = 523,
		  name = lang:get(<<"第523波"/utf8>>), lev = 362,
		  unit_ids = [60603], is_reset = 0, formation = {2, 1}};
get({5, 524}) ->
    #endless_data{type = 5, id = 524,
		  name = lang:get(<<"第524波"/utf8>>), lev = 362,
		  unit_ids = [60604], is_reset = 0, formation = {2, 1}};
get({5, 525}) ->
    #endless_data{type = 5, id = 525,
		  name = lang:get(<<"第525波"/utf8>>), lev = 363,
		  unit_ids = [60605], is_reset = 0, formation = {3, 1}};
get({5, 526}) ->
    #endless_data{type = 5, id = 526,
		  name = lang:get(<<"第526波"/utf8>>), lev = 363,
		  unit_ids = [60606], is_reset = 0, formation = {3, 1}};
get({5, 527}) ->
    #endless_data{type = 5, id = 527,
		  name = lang:get(<<"第527波"/utf8>>), lev = 364,
		  unit_ids = [60607], is_reset = 0, formation = {4, 1}};
get({5, 528}) ->
    #endless_data{type = 5, id = 528,
		  name = lang:get(<<"第528波"/utf8>>), lev = 364,
		  unit_ids = [60608], is_reset = 0, formation = {4, 1}};
get({5, 529}) ->
    #endless_data{type = 5, id = 529,
		  name = lang:get(<<"第529波"/utf8>>), lev = 365,
		  unit_ids = [60609], is_reset = 0, formation = {5, 1}};
get({5, 530}) ->
    #endless_data{type = 5, id = 530,
		  name = lang:get(<<"第530波"/utf8>>), lev = 365,
		  unit_ids = [60610], is_reset = 0, formation = {5, 1}};
get({5, 531}) ->
    #endless_data{type = 5, id = 531,
		  name = lang:get(<<"第531波"/utf8>>), lev = 366,
		  unit_ids = [60611], is_reset = 0, formation = {6, 1}};
get({5, 532}) ->
    #endless_data{type = 5, id = 532,
		  name = lang:get(<<"第532波"/utf8>>), lev = 366,
		  unit_ids = [60612], is_reset = 0, formation = {6, 1}};
get({5, 533}) ->
    #endless_data{type = 5, id = 533,
		  name = lang:get(<<"第533波"/utf8>>), lev = 367,
		  unit_ids = [60613], is_reset = 0, formation = {1, 1}};
get({5, 534}) ->
    #endless_data{type = 5, id = 534,
		  name = lang:get(<<"第534波"/utf8>>), lev = 367,
		  unit_ids = [60614], is_reset = 0, formation = {1, 1}};
get({5, 535}) ->
    #endless_data{type = 5, id = 535,
		  name = lang:get(<<"第535波"/utf8>>), lev = 368,
		  unit_ids = [60615], is_reset = 0, formation = {2, 1}};
get({5, 536}) ->
    #endless_data{type = 5, id = 536,
		  name = lang:get(<<"第536波"/utf8>>), lev = 368,
		  unit_ids = [60601], is_reset = 0, formation = {2, 1}};
get({5, 537}) ->
    #endless_data{type = 5, id = 537,
		  name = lang:get(<<"第537波"/utf8>>), lev = 369,
		  unit_ids = [60602], is_reset = 0, formation = {3, 1}};
get({5, 538}) ->
    #endless_data{type = 5, id = 538,
		  name = lang:get(<<"第538波"/utf8>>), lev = 369,
		  unit_ids = [60603], is_reset = 0, formation = {3, 1}};
get({5, 539}) ->
    #endless_data{type = 5, id = 539,
		  name = lang:get(<<"第539波"/utf8>>), lev = 370,
		  unit_ids = [60604], is_reset = 0, formation = {4, 1}};
get({5, 540}) ->
    #endless_data{type = 5, id = 540,
		  name = lang:get(<<"第540波"/utf8>>), lev = 370,
		  unit_ids = [60605], is_reset = 0, formation = {4, 1}};
get({5, 541}) ->
    #endless_data{type = 5, id = 541,
		  name = lang:get(<<"第541波"/utf8>>), lev = 371,
		  unit_ids = [60606], is_reset = 0, formation = {5, 1}};
get({5, 542}) ->
    #endless_data{type = 5, id = 542,
		  name = lang:get(<<"第542波"/utf8>>), lev = 371,
		  unit_ids = [60607], is_reset = 0, formation = {5, 1}};
get({5, 543}) ->
    #endless_data{type = 5, id = 543,
		  name = lang:get(<<"第543波"/utf8>>), lev = 372,
		  unit_ids = [60608], is_reset = 0, formation = {6, 1}};
get({5, 544}) ->
    #endless_data{type = 5, id = 544,
		  name = lang:get(<<"第544波"/utf8>>), lev = 372,
		  unit_ids = [60609], is_reset = 0, formation = {6, 1}};
get({5, 545}) ->
    #endless_data{type = 5, id = 545,
		  name = lang:get(<<"第545波"/utf8>>), lev = 373,
		  unit_ids = [60610], is_reset = 0, formation = {1, 1}};
get({5, 546}) ->
    #endless_data{type = 5, id = 546,
		  name = lang:get(<<"第546波"/utf8>>), lev = 373,
		  unit_ids = [60611], is_reset = 0, formation = {1, 1}};
get({5, 547}) ->
    #endless_data{type = 5, id = 547,
		  name = lang:get(<<"第547波"/utf8>>), lev = 374,
		  unit_ids = [60612], is_reset = 0, formation = {2, 1}};
get({5, 548}) ->
    #endless_data{type = 5, id = 548,
		  name = lang:get(<<"第548波"/utf8>>), lev = 374,
		  unit_ids = [60613], is_reset = 0, formation = {2, 1}};
get({5, 549}) ->
    #endless_data{type = 5, id = 549,
		  name = lang:get(<<"第549波"/utf8>>), lev = 375,
		  unit_ids = [60614], is_reset = 0, formation = {3, 1}};
get({5, 550}) ->
    #endless_data{type = 5, id = 550,
		  name = lang:get(<<"第550波"/utf8>>), lev = 375,
		  unit_ids = [60615], is_reset = 0, formation = {3, 1}};
get({5, 551}) ->
    #endless_data{type = 5, id = 551,
		  name = lang:get(<<"第551波"/utf8>>), lev = 376,
		  unit_ids = [60611], is_reset = 0, formation = {4, 1}};
get({5, 552}) ->
    #endless_data{type = 5, id = 552,
		  name = lang:get(<<"第552波"/utf8>>), lev = 376,
		  unit_ids = [60612], is_reset = 0, formation = {4, 1}};
get({5, 553}) ->
    #endless_data{type = 5, id = 553,
		  name = lang:get(<<"第553波"/utf8>>), lev = 377,
		  unit_ids = [60613], is_reset = 0, formation = {5, 1}};
get({5, 554}) ->
    #endless_data{type = 5, id = 554,
		  name = lang:get(<<"第554波"/utf8>>), lev = 377,
		  unit_ids = [60614], is_reset = 0, formation = {5, 1}};
get({5, 555}) ->
    #endless_data{type = 5, id = 555,
		  name = lang:get(<<"第555波"/utf8>>), lev = 378,
		  unit_ids = [60615], is_reset = 0, formation = {6, 1}};
get({5, 556}) ->
    #endless_data{type = 5, id = 556,
		  name = lang:get(<<"第556波"/utf8>>), lev = 378,
		  unit_ids = [60601], is_reset = 0, formation = {6, 1}};
get({5, 557}) ->
    #endless_data{type = 5, id = 557,
		  name = lang:get(<<"第557波"/utf8>>), lev = 379,
		  unit_ids = [60602], is_reset = 0, formation = {1, 1}};
get({5, 558}) ->
    #endless_data{type = 5, id = 558,
		  name = lang:get(<<"第558波"/utf8>>), lev = 379,
		  unit_ids = [60603], is_reset = 0, formation = {1, 1}};
get({5, 559}) ->
    #endless_data{type = 5, id = 559,
		  name = lang:get(<<"第559波"/utf8>>), lev = 380,
		  unit_ids = [60604], is_reset = 0, formation = {2, 1}};
get({5, 560}) ->
    #endless_data{type = 5, id = 560,
		  name = lang:get(<<"第560波"/utf8>>), lev = 380,
		  unit_ids = [60605], is_reset = 0, formation = {2, 1}};
get({5, 561}) ->
    #endless_data{type = 5, id = 561,
		  name = lang:get(<<"第561波"/utf8>>), lev = 381,
		  unit_ids = [60606], is_reset = 0, formation = {3, 1}};
get({5, 562}) ->
    #endless_data{type = 5, id = 562,
		  name = lang:get(<<"第562波"/utf8>>), lev = 381,
		  unit_ids = [60607], is_reset = 0, formation = {3, 1}};
get({5, 563}) ->
    #endless_data{type = 5, id = 563,
		  name = lang:get(<<"第563波"/utf8>>), lev = 382,
		  unit_ids = [60608], is_reset = 0, formation = {4, 1}};
get({5, 564}) ->
    #endless_data{type = 5, id = 564,
		  name = lang:get(<<"第564波"/utf8>>), lev = 382,
		  unit_ids = [60609], is_reset = 0, formation = {4, 1}};
get({5, 565}) ->
    #endless_data{type = 5, id = 565,
		  name = lang:get(<<"第565波"/utf8>>), lev = 383,
		  unit_ids = [60610], is_reset = 0, formation = {5, 1}};
get({5, 566}) ->
    #endless_data{type = 5, id = 566,
		  name = lang:get(<<"第566波"/utf8>>), lev = 383,
		  unit_ids = [60611], is_reset = 0, formation = {5, 1}};
get({5, 567}) ->
    #endless_data{type = 5, id = 567,
		  name = lang:get(<<"第567波"/utf8>>), lev = 384,
		  unit_ids = [60612], is_reset = 0, formation = {6, 1}};
get({5, 568}) ->
    #endless_data{type = 5, id = 568,
		  name = lang:get(<<"第568波"/utf8>>), lev = 384,
		  unit_ids = [60613], is_reset = 0, formation = {6, 1}};
get({5, 569}) ->
    #endless_data{type = 5, id = 569,
		  name = lang:get(<<"第569波"/utf8>>), lev = 385,
		  unit_ids = [60614], is_reset = 0, formation = {1, 1}};
get({5, 570}) ->
    #endless_data{type = 5, id = 570,
		  name = lang:get(<<"第570波"/utf8>>), lev = 385,
		  unit_ids = [60615], is_reset = 0, formation = {1, 1}};
get({5, 571}) ->
    #endless_data{type = 5, id = 571,
		  name = lang:get(<<"第571波"/utf8>>), lev = 386,
		  unit_ids = [60601], is_reset = 0, formation = {2, 1}};
get({5, 572}) ->
    #endless_data{type = 5, id = 572,
		  name = lang:get(<<"第572波"/utf8>>), lev = 386,
		  unit_ids = [60602], is_reset = 0, formation = {2, 1}};
get({5, 573}) ->
    #endless_data{type = 5, id = 573,
		  name = lang:get(<<"第573波"/utf8>>), lev = 387,
		  unit_ids = [60603], is_reset = 0, formation = {3, 1}};
get({5, 574}) ->
    #endless_data{type = 5, id = 574,
		  name = lang:get(<<"第574波"/utf8>>), lev = 387,
		  unit_ids = [60604], is_reset = 0, formation = {3, 1}};
get({5, 575}) ->
    #endless_data{type = 5, id = 575,
		  name = lang:get(<<"第575波"/utf8>>), lev = 388,
		  unit_ids = [60605], is_reset = 0, formation = {4, 1}};
get({5, 576}) ->
    #endless_data{type = 5, id = 576,
		  name = lang:get(<<"第576波"/utf8>>), lev = 388,
		  unit_ids = [60606], is_reset = 0, formation = {4, 1}};
get({5, 577}) ->
    #endless_data{type = 5, id = 577,
		  name = lang:get(<<"第577波"/utf8>>), lev = 389,
		  unit_ids = [60607], is_reset = 0, formation = {5, 1}};
get({5, 578}) ->
    #endless_data{type = 5, id = 578,
		  name = lang:get(<<"第578波"/utf8>>), lev = 389,
		  unit_ids = [60608], is_reset = 0, formation = {5, 1}};
get({5, 579}) ->
    #endless_data{type = 5, id = 579,
		  name = lang:get(<<"第579波"/utf8>>), lev = 390,
		  unit_ids = [60609], is_reset = 0, formation = {6, 1}};
get({5, 580}) ->
    #endless_data{type = 5, id = 580,
		  name = lang:get(<<"第580波"/utf8>>), lev = 390,
		  unit_ids = [60610], is_reset = 0, formation = {6, 1}};
get({5, 581}) ->
    #endless_data{type = 5, id = 581,
		  name = lang:get(<<"第581波"/utf8>>), lev = 391,
		  unit_ids = [60611], is_reset = 0, formation = {1, 1}};
get({5, 582}) ->
    #endless_data{type = 5, id = 582,
		  name = lang:get(<<"第582波"/utf8>>), lev = 391,
		  unit_ids = [60612], is_reset = 0, formation = {1, 1}};
get({5, 583}) ->
    #endless_data{type = 5, id = 583,
		  name = lang:get(<<"第583波"/utf8>>), lev = 392,
		  unit_ids = [60613], is_reset = 0, formation = {2, 1}};
get({5, 584}) ->
    #endless_data{type = 5, id = 584,
		  name = lang:get(<<"第584波"/utf8>>), lev = 392,
		  unit_ids = [60614], is_reset = 0, formation = {2, 1}};
get({5, 585}) ->
    #endless_data{type = 5, id = 585,
		  name = lang:get(<<"第585波"/utf8>>), lev = 393,
		  unit_ids = [60615], is_reset = 0, formation = {3, 1}};
get({5, 586}) ->
    #endless_data{type = 5, id = 586,
		  name = lang:get(<<"第586波"/utf8>>), lev = 393,
		  unit_ids = [60601], is_reset = 0, formation = {3, 1}};
get({5, 587}) ->
    #endless_data{type = 5, id = 587,
		  name = lang:get(<<"第587波"/utf8>>), lev = 394,
		  unit_ids = [60602], is_reset = 0, formation = {4, 1}};
get({5, 588}) ->
    #endless_data{type = 5, id = 588,
		  name = lang:get(<<"第588波"/utf8>>), lev = 394,
		  unit_ids = [60603], is_reset = 0, formation = {4, 1}};
get({5, 589}) ->
    #endless_data{type = 5, id = 589,
		  name = lang:get(<<"第589波"/utf8>>), lev = 395,
		  unit_ids = [60604], is_reset = 0, formation = {5, 1}};
get({5, 590}) ->
    #endless_data{type = 5, id = 590,
		  name = lang:get(<<"第590波"/utf8>>), lev = 395,
		  unit_ids = [60605], is_reset = 0, formation = {5, 1}};
get({5, 591}) ->
    #endless_data{type = 5, id = 591,
		  name = lang:get(<<"第591波"/utf8>>), lev = 396,
		  unit_ids = [60606], is_reset = 0, formation = {6, 1}};
get({5, 592}) ->
    #endless_data{type = 5, id = 592,
		  name = lang:get(<<"第592波"/utf8>>), lev = 396,
		  unit_ids = [60607], is_reset = 0, formation = {6, 1}};
get({5, 593}) ->
    #endless_data{type = 5, id = 593,
		  name = lang:get(<<"第593波"/utf8>>), lev = 397,
		  unit_ids = [60608], is_reset = 0, formation = {1, 1}};
get({5, 594}) ->
    #endless_data{type = 5, id = 594,
		  name = lang:get(<<"第594波"/utf8>>), lev = 397,
		  unit_ids = [60609], is_reset = 0, formation = {1, 1}};
get({5, 595}) ->
    #endless_data{type = 5, id = 595,
		  name = lang:get(<<"第595波"/utf8>>), lev = 398,
		  unit_ids = [60610], is_reset = 0, formation = {2, 1}};
get({5, 596}) ->
    #endless_data{type = 5, id = 596,
		  name = lang:get(<<"第596波"/utf8>>), lev = 398,
		  unit_ids = [60611], is_reset = 0, formation = {2, 1}};
get({5, 597}) ->
    #endless_data{type = 5, id = 597,
		  name = lang:get(<<"第597波"/utf8>>), lev = 399,
		  unit_ids = [60612], is_reset = 0, formation = {3, 1}};
get({5, 598}) ->
    #endless_data{type = 5, id = 598,
		  name = lang:get(<<"第598波"/utf8>>), lev = 399,
		  unit_ids = [60613], is_reset = 0, formation = {3, 1}};
get({5, 599}) ->
    #endless_data{type = 5, id = 599,
		  name = lang:get(<<"第599波"/utf8>>), lev = 400,
		  unit_ids = [60614], is_reset = 0, formation = {4, 1}};
get({5, 600}) ->
    #endless_data{type = 5, id = 600,
		  name = lang:get(<<"第600波"/utf8>>), lev = 400,
		  unit_ids = [60615], is_reset = 0, formation = {4, 1}};
get({5, 601}) ->
    #endless_data{type = 5, id = 601,
		  name = lang:get(<<"第601波"/utf8>>), lev = 401,
		  unit_ids = [60701], is_reset = 0, formation = {1, 1}};
get({5, 602}) ->
    #endless_data{type = 5, id = 602,
		  name = lang:get(<<"第602波"/utf8>>), lev = 401,
		  unit_ids = [60702], is_reset = 0, formation = {1, 1}};
get({5, 603}) ->
    #endless_data{type = 5, id = 603,
		  name = lang:get(<<"第603波"/utf8>>), lev = 402,
		  unit_ids = [60703], is_reset = 0, formation = {2, 1}};
get({5, 604}) ->
    #endless_data{type = 5, id = 604,
		  name = lang:get(<<"第604波"/utf8>>), lev = 402,
		  unit_ids = [60704], is_reset = 0, formation = {2, 1}};
get({5, 605}) ->
    #endless_data{type = 5, id = 605,
		  name = lang:get(<<"第605波"/utf8>>), lev = 403,
		  unit_ids = [60705], is_reset = 0, formation = {3, 1}};
get({5, 606}) ->
    #endless_data{type = 5, id = 606,
		  name = lang:get(<<"第606波"/utf8>>), lev = 403,
		  unit_ids = [60706], is_reset = 0, formation = {3, 1}};
get({5, 607}) ->
    #endless_data{type = 5, id = 607,
		  name = lang:get(<<"第607波"/utf8>>), lev = 404,
		  unit_ids = [60707], is_reset = 0, formation = {4, 1}};
get({5, 608}) ->
    #endless_data{type = 5, id = 608,
		  name = lang:get(<<"第608波"/utf8>>), lev = 404,
		  unit_ids = [60708], is_reset = 0, formation = {4, 1}};
get({5, 609}) ->
    #endless_data{type = 5, id = 609,
		  name = lang:get(<<"第609波"/utf8>>), lev = 405,
		  unit_ids = [60709], is_reset = 0, formation = {5, 1}};
get({5, 610}) ->
    #endless_data{type = 5, id = 610,
		  name = lang:get(<<"第610波"/utf8>>), lev = 405,
		  unit_ids = [60710], is_reset = 0, formation = {5, 1}};
get({5, 611}) ->
    #endless_data{type = 5, id = 611,
		  name = lang:get(<<"第611波"/utf8>>), lev = 406,
		  unit_ids = [60711], is_reset = 0, formation = {6, 1}};
get({5, 612}) ->
    #endless_data{type = 5, id = 612,
		  name = lang:get(<<"第612波"/utf8>>), lev = 406,
		  unit_ids = [60712], is_reset = 0, formation = {6, 1}};
get({5, 613}) ->
    #endless_data{type = 5, id = 613,
		  name = lang:get(<<"第613波"/utf8>>), lev = 407,
		  unit_ids = [60713], is_reset = 0, formation = {1, 1}};
get({5, 614}) ->
    #endless_data{type = 5, id = 614,
		  name = lang:get(<<"第614波"/utf8>>), lev = 407,
		  unit_ids = [60714], is_reset = 0, formation = {1, 1}};
get({5, 615}) ->
    #endless_data{type = 5, id = 615,
		  name = lang:get(<<"第615波"/utf8>>), lev = 408,
		  unit_ids = [60715], is_reset = 0, formation = {2, 1}};
get({5, 616}) ->
    #endless_data{type = 5, id = 616,
		  name = lang:get(<<"第616波"/utf8>>), lev = 408,
		  unit_ids = [60601], is_reset = 0, formation = {2, 1}};
get({5, 617}) ->
    #endless_data{type = 5, id = 617,
		  name = lang:get(<<"第617波"/utf8>>), lev = 409,
		  unit_ids = [60602], is_reset = 0, formation = {3, 1}};
get({5, 618}) ->
    #endless_data{type = 5, id = 618,
		  name = lang:get(<<"第618波"/utf8>>), lev = 409,
		  unit_ids = [60603], is_reset = 0, formation = {3, 1}};
get({5, 619}) ->
    #endless_data{type = 5, id = 619,
		  name = lang:get(<<"第619波"/utf8>>), lev = 410,
		  unit_ids = [60604], is_reset = 0, formation = {4, 1}};
get({5, 620}) ->
    #endless_data{type = 5, id = 620,
		  name = lang:get(<<"第620波"/utf8>>), lev = 410,
		  unit_ids = [60605], is_reset = 0, formation = {4, 1}};
get({5, 621}) ->
    #endless_data{type = 5, id = 621,
		  name = lang:get(<<"第621波"/utf8>>), lev = 411,
		  unit_ids = [60606], is_reset = 0, formation = {5, 1}};
get({5, 622}) ->
    #endless_data{type = 5, id = 622,
		  name = lang:get(<<"第622波"/utf8>>), lev = 411,
		  unit_ids = [60607], is_reset = 0, formation = {5, 1}};
get({5, 623}) ->
    #endless_data{type = 5, id = 623,
		  name = lang:get(<<"第623波"/utf8>>), lev = 412,
		  unit_ids = [60608], is_reset = 0, formation = {6, 1}};
get({5, 624}) ->
    #endless_data{type = 5, id = 624,
		  name = lang:get(<<"第624波"/utf8>>), lev = 412,
		  unit_ids = [60609], is_reset = 0, formation = {6, 1}};
get({5, 625}) ->
    #endless_data{type = 5, id = 625,
		  name = lang:get(<<"第625波"/utf8>>), lev = 413,
		  unit_ids = [60610], is_reset = 0, formation = {1, 1}};
get({5, 626}) ->
    #endless_data{type = 5, id = 626,
		  name = lang:get(<<"第626波"/utf8>>), lev = 413,
		  unit_ids = [60611], is_reset = 0, formation = {1, 1}};
get({5, 627}) ->
    #endless_data{type = 5, id = 627,
		  name = lang:get(<<"第627波"/utf8>>), lev = 414,
		  unit_ids = [60612], is_reset = 0, formation = {2, 1}};
get({5, 628}) ->
    #endless_data{type = 5, id = 628,
		  name = lang:get(<<"第628波"/utf8>>), lev = 414,
		  unit_ids = [60613], is_reset = 0, formation = {2, 1}};
get({5, 629}) ->
    #endless_data{type = 5, id = 629,
		  name = lang:get(<<"第629波"/utf8>>), lev = 415,
		  unit_ids = [60614], is_reset = 0, formation = {3, 1}};
get({5, 630}) ->
    #endless_data{type = 5, id = 630,
		  name = lang:get(<<"第630波"/utf8>>), lev = 415,
		  unit_ids = [60615], is_reset = 0, formation = {3, 1}};
get({5, 631}) ->
    #endless_data{type = 5, id = 631,
		  name = lang:get(<<"第631波"/utf8>>), lev = 416,
		  unit_ids = [60701], is_reset = 0, formation = {4, 1}};
get({5, 632}) ->
    #endless_data{type = 5, id = 632,
		  name = lang:get(<<"第632波"/utf8>>), lev = 416,
		  unit_ids = [60702], is_reset = 0, formation = {4, 1}};
get({5, 633}) ->
    #endless_data{type = 5, id = 633,
		  name = lang:get(<<"第633波"/utf8>>), lev = 417,
		  unit_ids = [60703], is_reset = 0, formation = {5, 1}};
get({5, 634}) ->
    #endless_data{type = 5, id = 634,
		  name = lang:get(<<"第634波"/utf8>>), lev = 417,
		  unit_ids = [60704], is_reset = 0, formation = {5, 1}};
get({5, 635}) ->
    #endless_data{type = 5, id = 635,
		  name = lang:get(<<"第635波"/utf8>>), lev = 418,
		  unit_ids = [60705], is_reset = 0, formation = {6, 1}};
get({5, 636}) ->
    #endless_data{type = 5, id = 636,
		  name = lang:get(<<"第636波"/utf8>>), lev = 418,
		  unit_ids = [60706], is_reset = 0, formation = {6, 1}};
get({5, 637}) ->
    #endless_data{type = 5, id = 637,
		  name = lang:get(<<"第637波"/utf8>>), lev = 419,
		  unit_ids = [60707], is_reset = 0, formation = {1, 1}};
get({5, 638}) ->
    #endless_data{type = 5, id = 638,
		  name = lang:get(<<"第638波"/utf8>>), lev = 419,
		  unit_ids = [60708], is_reset = 0, formation = {1, 1}};
get({5, 639}) ->
    #endless_data{type = 5, id = 639,
		  name = lang:get(<<"第639波"/utf8>>), lev = 420,
		  unit_ids = [60709], is_reset = 0, formation = {2, 1}};
get({5, 640}) ->
    #endless_data{type = 5, id = 640,
		  name = lang:get(<<"第640波"/utf8>>), lev = 420,
		  unit_ids = [60710], is_reset = 0, formation = {2, 1}};
get({5, 641}) ->
    #endless_data{type = 5, id = 641,
		  name = lang:get(<<"第641波"/utf8>>), lev = 421,
		  unit_ids = [60711], is_reset = 0, formation = {3, 1}};
get({5, 642}) ->
    #endless_data{type = 5, id = 642,
		  name = lang:get(<<"第642波"/utf8>>), lev = 421,
		  unit_ids = [60712], is_reset = 0, formation = {3, 1}};
get({5, 643}) ->
    #endless_data{type = 5, id = 643,
		  name = lang:get(<<"第643波"/utf8>>), lev = 422,
		  unit_ids = [60713], is_reset = 0, formation = {4, 1}};
get({5, 644}) ->
    #endless_data{type = 5, id = 644,
		  name = lang:get(<<"第644波"/utf8>>), lev = 422,
		  unit_ids = [60714], is_reset = 0, formation = {4, 1}};
get({5, 645}) ->
    #endless_data{type = 5, id = 645,
		  name = lang:get(<<"第645波"/utf8>>), lev = 423,
		  unit_ids = [60715], is_reset = 0, formation = {5, 1}};
get({5, 646}) ->
    #endless_data{type = 5, id = 646,
		  name = lang:get(<<"第646波"/utf8>>), lev = 423,
		  unit_ids = [60601], is_reset = 0, formation = {5, 1}};
get({5, 647}) ->
    #endless_data{type = 5, id = 647,
		  name = lang:get(<<"第647波"/utf8>>), lev = 424,
		  unit_ids = [60602], is_reset = 0, formation = {6, 1}};
get({5, 648}) ->
    #endless_data{type = 5, id = 648,
		  name = lang:get(<<"第648波"/utf8>>), lev = 424,
		  unit_ids = [60603], is_reset = 0, formation = {6, 1}};
get({5, 649}) ->
    #endless_data{type = 5, id = 649,
		  name = lang:get(<<"第649波"/utf8>>), lev = 425,
		  unit_ids = [60604], is_reset = 0, formation = {1, 1}};
get({5, 650}) ->
    #endless_data{type = 5, id = 650,
		  name = lang:get(<<"第650波"/utf8>>), lev = 425,
		  unit_ids = [60605], is_reset = 0, formation = {1, 1}};
get({5, 651}) ->
    #endless_data{type = 5, id = 651,
		  name = lang:get(<<"第651波"/utf8>>), lev = 426,
		  unit_ids = [60606], is_reset = 0, formation = {2, 1}};
get({5, 652}) ->
    #endless_data{type = 5, id = 652,
		  name = lang:get(<<"第652波"/utf8>>), lev = 426,
		  unit_ids = [60607], is_reset = 0, formation = {2, 1}};
get({5, 653}) ->
    #endless_data{type = 5, id = 653,
		  name = lang:get(<<"第653波"/utf8>>), lev = 427,
		  unit_ids = [60608], is_reset = 0, formation = {3, 1}};
get({5, 654}) ->
    #endless_data{type = 5, id = 654,
		  name = lang:get(<<"第654波"/utf8>>), lev = 427,
		  unit_ids = [60609], is_reset = 0, formation = {3, 1}};
get({5, 655}) ->
    #endless_data{type = 5, id = 655,
		  name = lang:get(<<"第655波"/utf8>>), lev = 428,
		  unit_ids = [60610], is_reset = 0, formation = {4, 1}};
get({5, 656}) ->
    #endless_data{type = 5, id = 656,
		  name = lang:get(<<"第656波"/utf8>>), lev = 428,
		  unit_ids = [60611], is_reset = 0, formation = {4, 1}};
get({5, 657}) ->
    #endless_data{type = 5, id = 657,
		  name = lang:get(<<"第657波"/utf8>>), lev = 429,
		  unit_ids = [60612], is_reset = 0, formation = {5, 1}};
get({5, 658}) ->
    #endless_data{type = 5, id = 658,
		  name = lang:get(<<"第658波"/utf8>>), lev = 429,
		  unit_ids = [60613], is_reset = 0, formation = {5, 1}};
get({5, 659}) ->
    #endless_data{type = 5, id = 659,
		  name = lang:get(<<"第659波"/utf8>>), lev = 430,
		  unit_ids = [60614], is_reset = 0, formation = {6, 1}};
get({5, 660}) ->
    #endless_data{type = 5, id = 660,
		  name = lang:get(<<"第660波"/utf8>>), lev = 430,
		  unit_ids = [60615], is_reset = 0, formation = {6, 1}};
get({5, 661}) ->
    #endless_data{type = 5, id = 661,
		  name = lang:get(<<"第661波"/utf8>>), lev = 431,
		  unit_ids = [60701], is_reset = 0, formation = {1, 1}};
get({5, 662}) ->
    #endless_data{type = 5, id = 662,
		  name = lang:get(<<"第662波"/utf8>>), lev = 431,
		  unit_ids = [60702], is_reset = 0, formation = {1, 1}};
get({5, 663}) ->
    #endless_data{type = 5, id = 663,
		  name = lang:get(<<"第663波"/utf8>>), lev = 432,
		  unit_ids = [60703], is_reset = 0, formation = {2, 1}};
get({5, 664}) ->
    #endless_data{type = 5, id = 664,
		  name = lang:get(<<"第664波"/utf8>>), lev = 432,
		  unit_ids = [60704], is_reset = 0, formation = {2, 1}};
get({5, 665}) ->
    #endless_data{type = 5, id = 665,
		  name = lang:get(<<"第665波"/utf8>>), lev = 433,
		  unit_ids = [60705], is_reset = 0, formation = {3, 1}};
get({5, 666}) ->
    #endless_data{type = 5, id = 666,
		  name = lang:get(<<"第666波"/utf8>>), lev = 433,
		  unit_ids = [60706], is_reset = 0, formation = {3, 1}};
get({5, 667}) ->
    #endless_data{type = 5, id = 667,
		  name = lang:get(<<"第667波"/utf8>>), lev = 434,
		  unit_ids = [60707], is_reset = 0, formation = {4, 1}};
get({5, 668}) ->
    #endless_data{type = 5, id = 668,
		  name = lang:get(<<"第668波"/utf8>>), lev = 434,
		  unit_ids = [60708], is_reset = 0, formation = {4, 1}};
get({5, 669}) ->
    #endless_data{type = 5, id = 669,
		  name = lang:get(<<"第669波"/utf8>>), lev = 435,
		  unit_ids = [60709], is_reset = 0, formation = {5, 1}};
get({5, 670}) ->
    #endless_data{type = 5, id = 670,
		  name = lang:get(<<"第670波"/utf8>>), lev = 435,
		  unit_ids = [60710], is_reset = 0, formation = {5, 1}};
get({5, 671}) ->
    #endless_data{type = 5, id = 671,
		  name = lang:get(<<"第671波"/utf8>>), lev = 436,
		  unit_ids = [60711], is_reset = 0, formation = {6, 1}};
get({5, 672}) ->
    #endless_data{type = 5, id = 672,
		  name = lang:get(<<"第672波"/utf8>>), lev = 436,
		  unit_ids = [60712], is_reset = 0, formation = {6, 1}};
get({5, 673}) ->
    #endless_data{type = 5, id = 673,
		  name = lang:get(<<"第673波"/utf8>>), lev = 437,
		  unit_ids = [60713], is_reset = 0, formation = {1, 1}};
get({5, 674}) ->
    #endless_data{type = 5, id = 674,
		  name = lang:get(<<"第674波"/utf8>>), lev = 437,
		  unit_ids = [60714], is_reset = 0, formation = {1, 1}};
get({5, 675}) ->
    #endless_data{type = 5, id = 675,
		  name = lang:get(<<"第675波"/utf8>>), lev = 438,
		  unit_ids = [60715], is_reset = 0, formation = {2, 1}};
get({5, 676}) ->
    #endless_data{type = 5, id = 676,
		  name = lang:get(<<"第676波"/utf8>>), lev = 438,
		  unit_ids = [60601], is_reset = 0, formation = {2, 1}};
get({5, 677}) ->
    #endless_data{type = 5, id = 677,
		  name = lang:get(<<"第677波"/utf8>>), lev = 439,
		  unit_ids = [60602], is_reset = 0, formation = {3, 1}};
get({5, 678}) ->
    #endless_data{type = 5, id = 678,
		  name = lang:get(<<"第678波"/utf8>>), lev = 439,
		  unit_ids = [60603], is_reset = 0, formation = {3, 1}};
get({5, 679}) ->
    #endless_data{type = 5, id = 679,
		  name = lang:get(<<"第679波"/utf8>>), lev = 440,
		  unit_ids = [60604], is_reset = 0, formation = {4, 1}};
get({5, 680}) ->
    #endless_data{type = 5, id = 680,
		  name = lang:get(<<"第680波"/utf8>>), lev = 440,
		  unit_ids = [60605], is_reset = 0, formation = {4, 1}};
get({5, 681}) ->
    #endless_data{type = 5, id = 681,
		  name = lang:get(<<"第681波"/utf8>>), lev = 441,
		  unit_ids = [60606], is_reset = 0, formation = {5, 1}};
get({5, 682}) ->
    #endless_data{type = 5, id = 682,
		  name = lang:get(<<"第682波"/utf8>>), lev = 441,
		  unit_ids = [60607], is_reset = 0, formation = {5, 1}};
get({5, 683}) ->
    #endless_data{type = 5, id = 683,
		  name = lang:get(<<"第683波"/utf8>>), lev = 442,
		  unit_ids = [60608], is_reset = 0, formation = {6, 1}};
get({5, 684}) ->
    #endless_data{type = 5, id = 684,
		  name = lang:get(<<"第684波"/utf8>>), lev = 442,
		  unit_ids = [60609], is_reset = 0, formation = {6, 1}};
get({5, 685}) ->
    #endless_data{type = 5, id = 685,
		  name = lang:get(<<"第685波"/utf8>>), lev = 443,
		  unit_ids = [60610], is_reset = 0, formation = {1, 1}};
get({5, 686}) ->
    #endless_data{type = 5, id = 686,
		  name = lang:get(<<"第686波"/utf8>>), lev = 443,
		  unit_ids = [60611], is_reset = 0, formation = {1, 1}};
get({5, 687}) ->
    #endless_data{type = 5, id = 687,
		  name = lang:get(<<"第687波"/utf8>>), lev = 444,
		  unit_ids = [60612], is_reset = 0, formation = {2, 1}};
get({5, 688}) ->
    #endless_data{type = 5, id = 688,
		  name = lang:get(<<"第688波"/utf8>>), lev = 444,
		  unit_ids = [60613], is_reset = 0, formation = {2, 1}};
get({5, 689}) ->
    #endless_data{type = 5, id = 689,
		  name = lang:get(<<"第689波"/utf8>>), lev = 445,
		  unit_ids = [60614], is_reset = 0, formation = {3, 1}};
get({5, 690}) ->
    #endless_data{type = 5, id = 690,
		  name = lang:get(<<"第690波"/utf8>>), lev = 445,
		  unit_ids = [60615], is_reset = 0, formation = {3, 1}};
get({5, 691}) ->
    #endless_data{type = 5, id = 691,
		  name = lang:get(<<"第691波"/utf8>>), lev = 446,
		  unit_ids = [60701], is_reset = 0, formation = {4, 1}};
get({5, 692}) ->
    #endless_data{type = 5, id = 692,
		  name = lang:get(<<"第692波"/utf8>>), lev = 446,
		  unit_ids = [60702], is_reset = 0, formation = {4, 1}};
get({5, 693}) ->
    #endless_data{type = 5, id = 693,
		  name = lang:get(<<"第693波"/utf8>>), lev = 447,
		  unit_ids = [60703], is_reset = 0, formation = {5, 1}};
get({5, 694}) ->
    #endless_data{type = 5, id = 694,
		  name = lang:get(<<"第694波"/utf8>>), lev = 447,
		  unit_ids = [60704], is_reset = 0, formation = {5, 1}};
get({5, 695}) ->
    #endless_data{type = 5, id = 695,
		  name = lang:get(<<"第695波"/utf8>>), lev = 448,
		  unit_ids = [60705], is_reset = 0, formation = {6, 1}};
get({5, 696}) ->
    #endless_data{type = 5, id = 696,
		  name = lang:get(<<"第696波"/utf8>>), lev = 448,
		  unit_ids = [60706], is_reset = 0, formation = {6, 1}};
get({5, 697}) ->
    #endless_data{type = 5, id = 697,
		  name = lang:get(<<"第697波"/utf8>>), lev = 449,
		  unit_ids = [60707], is_reset = 0, formation = {1, 1}};
get({5, 698}) ->
    #endless_data{type = 5, id = 698,
		  name = lang:get(<<"第698波"/utf8>>), lev = 449,
		  unit_ids = [60708], is_reset = 0, formation = {1, 1}};
get({5, 699}) ->
    #endless_data{type = 5, id = 699,
		  name = lang:get(<<"第699波"/utf8>>), lev = 450,
		  unit_ids = [60709], is_reset = 0, formation = {2, 1}};
get({5, 700}) ->
    #endless_data{type = 5, id = 700,
		  name = lang:get(<<"第700波"/utf8>>), lev = 450,
		  unit_ids = [60710], is_reset = 0, formation = {2, 1}};
get({5, 701}) ->
    #endless_data{type = 5, id = 701,
		  name = lang:get(<<"第701波"/utf8>>), lev = 451,
		  unit_ids = [60711], is_reset = 0, formation = {3, 1}};
get({5, 702}) ->
    #endless_data{type = 5, id = 702,
		  name = lang:get(<<"第702波"/utf8>>), lev = 451,
		  unit_ids = [60712], is_reset = 0, formation = {3, 1}};
get({5, 703}) ->
    #endless_data{type = 5, id = 703,
		  name = lang:get(<<"第703波"/utf8>>), lev = 452,
		  unit_ids = [60713], is_reset = 0, formation = {4, 1}};
get({5, 704}) ->
    #endless_data{type = 5, id = 704,
		  name = lang:get(<<"第704波"/utf8>>), lev = 452,
		  unit_ids = [60714], is_reset = 0, formation = {4, 1}};
get({5, 705}) ->
    #endless_data{type = 5, id = 705,
		  name = lang:get(<<"第705波"/utf8>>), lev = 453,
		  unit_ids = [60715], is_reset = 0, formation = {5, 1}};
get({5, 706}) ->
    #endless_data{type = 5, id = 706,
		  name = lang:get(<<"第706波"/utf8>>), lev = 453,
		  unit_ids = [60601], is_reset = 0, formation = {5, 1}};
get({5, 707}) ->
    #endless_data{type = 5, id = 707,
		  name = lang:get(<<"第707波"/utf8>>), lev = 454,
		  unit_ids = [60602], is_reset = 0, formation = {6, 1}};
get({5, 708}) ->
    #endless_data{type = 5, id = 708,
		  name = lang:get(<<"第708波"/utf8>>), lev = 454,
		  unit_ids = [60603], is_reset = 0, formation = {6, 1}};
get({5, 709}) ->
    #endless_data{type = 5, id = 709,
		  name = lang:get(<<"第709波"/utf8>>), lev = 455,
		  unit_ids = [60604], is_reset = 0, formation = {1, 1}};
get({5, 710}) ->
    #endless_data{type = 5, id = 710,
		  name = lang:get(<<"第710波"/utf8>>), lev = 455,
		  unit_ids = [60605], is_reset = 0, formation = {1, 1}};
get({5, 711}) ->
    #endless_data{type = 5, id = 711,
		  name = lang:get(<<"第711波"/utf8>>), lev = 456,
		  unit_ids = [60606], is_reset = 0, formation = {2, 1}};
get({5, 712}) ->
    #endless_data{type = 5, id = 712,
		  name = lang:get(<<"第712波"/utf8>>), lev = 456,
		  unit_ids = [60607], is_reset = 0, formation = {2, 1}};
get({5, 713}) ->
    #endless_data{type = 5, id = 713,
		  name = lang:get(<<"第713波"/utf8>>), lev = 457,
		  unit_ids = [60608], is_reset = 0, formation = {3, 1}};
get({5, 714}) ->
    #endless_data{type = 5, id = 714,
		  name = lang:get(<<"第714波"/utf8>>), lev = 457,
		  unit_ids = [60609], is_reset = 0, formation = {3, 1}};
get({5, 715}) ->
    #endless_data{type = 5, id = 715,
		  name = lang:get(<<"第715波"/utf8>>), lev = 458,
		  unit_ids = [60610], is_reset = 0, formation = {4, 1}};
get({5, 716}) ->
    #endless_data{type = 5, id = 716,
		  name = lang:get(<<"第716波"/utf8>>), lev = 458,
		  unit_ids = [60611], is_reset = 0, formation = {4, 1}};
get({5, 717}) ->
    #endless_data{type = 5, id = 717,
		  name = lang:get(<<"第717波"/utf8>>), lev = 459,
		  unit_ids = [60612], is_reset = 0, formation = {5, 1}};
get({5, 718}) ->
    #endless_data{type = 5, id = 718,
		  name = lang:get(<<"第718波"/utf8>>), lev = 459,
		  unit_ids = [60613], is_reset = 0, formation = {5, 1}};
get({5, 719}) ->
    #endless_data{type = 5, id = 719,
		  name = lang:get(<<"第719波"/utf8>>), lev = 460,
		  unit_ids = [60614], is_reset = 0, formation = {6, 1}};
get({5, 720}) ->
    #endless_data{type = 5, id = 720,
		  name = lang:get(<<"第720波"/utf8>>), lev = 460,
		  unit_ids = [60615], is_reset = 0, formation = {6, 1}};
get({5, 721}) ->
    #endless_data{type = 5, id = 721,
		  name = lang:get(<<"第721波"/utf8>>), lev = 461,
		  unit_ids = [60701], is_reset = 0, formation = {1, 1}};
get({5, 722}) ->
    #endless_data{type = 5, id = 722,
		  name = lang:get(<<"第722波"/utf8>>), lev = 461,
		  unit_ids = [60702], is_reset = 0, formation = {1, 1}};
get({5, 723}) ->
    #endless_data{type = 5, id = 723,
		  name = lang:get(<<"第723波"/utf8>>), lev = 462,
		  unit_ids = [60703], is_reset = 0, formation = {2, 1}};
get({5, 724}) ->
    #endless_data{type = 5, id = 724,
		  name = lang:get(<<"第724波"/utf8>>), lev = 462,
		  unit_ids = [60704], is_reset = 0, formation = {2, 1}};
get({5, 725}) ->
    #endless_data{type = 5, id = 725,
		  name = lang:get(<<"第725波"/utf8>>), lev = 463,
		  unit_ids = [60705], is_reset = 0, formation = {3, 1}};
get({5, 726}) ->
    #endless_data{type = 5, id = 726,
		  name = lang:get(<<"第726波"/utf8>>), lev = 463,
		  unit_ids = [60706], is_reset = 0, formation = {3, 1}};
get({5, 727}) ->
    #endless_data{type = 5, id = 727,
		  name = lang:get(<<"第727波"/utf8>>), lev = 464,
		  unit_ids = [60707], is_reset = 0, formation = {4, 1}};
get({5, 728}) ->
    #endless_data{type = 5, id = 728,
		  name = lang:get(<<"第728波"/utf8>>), lev = 464,
		  unit_ids = [60708], is_reset = 0, formation = {4, 1}};
get({5, 729}) ->
    #endless_data{type = 5, id = 729,
		  name = lang:get(<<"第729波"/utf8>>), lev = 465,
		  unit_ids = [60709], is_reset = 0, formation = {5, 1}};
get({5, 730}) ->
    #endless_data{type = 5, id = 730,
		  name = lang:get(<<"第730波"/utf8>>), lev = 465,
		  unit_ids = [60710], is_reset = 0, formation = {5, 1}};
get({5, 731}) ->
    #endless_data{type = 5, id = 731,
		  name = lang:get(<<"第731波"/utf8>>), lev = 466,
		  unit_ids = [60711], is_reset = 0, formation = {6, 1}};
get({5, 732}) ->
    #endless_data{type = 5, id = 732,
		  name = lang:get(<<"第732波"/utf8>>), lev = 466,
		  unit_ids = [60712], is_reset = 0, formation = {6, 1}};
get({5, 733}) ->
    #endless_data{type = 5, id = 733,
		  name = lang:get(<<"第733波"/utf8>>), lev = 467,
		  unit_ids = [60713], is_reset = 0, formation = {1, 1}};
get({5, 734}) ->
    #endless_data{type = 5, id = 734,
		  name = lang:get(<<"第734波"/utf8>>), lev = 467,
		  unit_ids = [60714], is_reset = 0, formation = {1, 1}};
get({5, 735}) ->
    #endless_data{type = 5, id = 735,
		  name = lang:get(<<"第735波"/utf8>>), lev = 468,
		  unit_ids = [60715], is_reset = 0, formation = {2, 1}};
get({5, 736}) ->
    #endless_data{type = 5, id = 736,
		  name = lang:get(<<"第736波"/utf8>>), lev = 468,
		  unit_ids = [60601], is_reset = 0, formation = {2, 1}};
get({5, 737}) ->
    #endless_data{type = 5, id = 737,
		  name = lang:get(<<"第737波"/utf8>>), lev = 469,
		  unit_ids = [60602], is_reset = 0, formation = {3, 1}};
get({5, 738}) ->
    #endless_data{type = 5, id = 738,
		  name = lang:get(<<"第738波"/utf8>>), lev = 469,
		  unit_ids = [60603], is_reset = 0, formation = {3, 1}};
get({5, 739}) ->
    #endless_data{type = 5, id = 739,
		  name = lang:get(<<"第739波"/utf8>>), lev = 470,
		  unit_ids = [60604], is_reset = 0, formation = {4, 1}};
get({5, 740}) ->
    #endless_data{type = 5, id = 740,
		  name = lang:get(<<"第740波"/utf8>>), lev = 470,
		  unit_ids = [60605], is_reset = 0, formation = {4, 1}};
get({5, 741}) ->
    #endless_data{type = 5, id = 741,
		  name = lang:get(<<"第741波"/utf8>>), lev = 471,
		  unit_ids = [60606], is_reset = 0, formation = {5, 1}};
get({5, 742}) ->
    #endless_data{type = 5, id = 742,
		  name = lang:get(<<"第742波"/utf8>>), lev = 471,
		  unit_ids = [60607], is_reset = 0, formation = {5, 1}};
get({5, 743}) ->
    #endless_data{type = 5, id = 743,
		  name = lang:get(<<"第743波"/utf8>>), lev = 472,
		  unit_ids = [60608], is_reset = 0, formation = {6, 1}};
get({5, 744}) ->
    #endless_data{type = 5, id = 744,
		  name = lang:get(<<"第744波"/utf8>>), lev = 472,
		  unit_ids = [60609], is_reset = 0, formation = {6, 1}};
get({5, 745}) ->
    #endless_data{type = 5, id = 745,
		  name = lang:get(<<"第745波"/utf8>>), lev = 473,
		  unit_ids = [60610], is_reset = 0, formation = {1, 1}};
get({5, 746}) ->
    #endless_data{type = 5, id = 746,
		  name = lang:get(<<"第746波"/utf8>>), lev = 473,
		  unit_ids = [60611], is_reset = 0, formation = {1, 1}};
get({5, 747}) ->
    #endless_data{type = 5, id = 747,
		  name = lang:get(<<"第747波"/utf8>>), lev = 474,
		  unit_ids = [60612], is_reset = 0, formation = {2, 1}};
get({5, 748}) ->
    #endless_data{type = 5, id = 748,
		  name = lang:get(<<"第748波"/utf8>>), lev = 474,
		  unit_ids = [60613], is_reset = 0, formation = {2, 1}};
get({5, 749}) ->
    #endless_data{type = 5, id = 749,
		  name = lang:get(<<"第749波"/utf8>>), lev = 475,
		  unit_ids = [60614], is_reset = 0, formation = {3, 1}};
get({5, 750}) ->
    #endless_data{type = 5, id = 750,
		  name = lang:get(<<"第750波"/utf8>>), lev = 475,
		  unit_ids = [60615], is_reset = 0, formation = {3, 1}};
get({5, 751}) ->
    #endless_data{type = 5, id = 751,
		  name = lang:get(<<"第751波"/utf8>>), lev = 476,
		  unit_ids = [60701], is_reset = 0, formation = {4, 1}};
get({5, 752}) ->
    #endless_data{type = 5, id = 752,
		  name = lang:get(<<"第752波"/utf8>>), lev = 476,
		  unit_ids = [60702], is_reset = 0, formation = {4, 1}};
get({5, 753}) ->
    #endless_data{type = 5, id = 753,
		  name = lang:get(<<"第753波"/utf8>>), lev = 477,
		  unit_ids = [60703], is_reset = 0, formation = {5, 1}};
get({5, 754}) ->
    #endless_data{type = 5, id = 754,
		  name = lang:get(<<"第754波"/utf8>>), lev = 477,
		  unit_ids = [60704], is_reset = 0, formation = {5, 1}};
get({5, 755}) ->
    #endless_data{type = 5, id = 755,
		  name = lang:get(<<"第755波"/utf8>>), lev = 478,
		  unit_ids = [60705], is_reset = 0, formation = {6, 1}};
get({5, 756}) ->
    #endless_data{type = 5, id = 756,
		  name = lang:get(<<"第756波"/utf8>>), lev = 478,
		  unit_ids = [60706], is_reset = 0, formation = {6, 1}};
get({5, 757}) ->
    #endless_data{type = 5, id = 757,
		  name = lang:get(<<"第757波"/utf8>>), lev = 479,
		  unit_ids = [60707], is_reset = 0, formation = {1, 1}};
get({5, 758}) ->
    #endless_data{type = 5, id = 758,
		  name = lang:get(<<"第758波"/utf8>>), lev = 479,
		  unit_ids = [60708], is_reset = 0, formation = {1, 1}};
get({5, 759}) ->
    #endless_data{type = 5, id = 759,
		  name = lang:get(<<"第759波"/utf8>>), lev = 480,
		  unit_ids = [60709], is_reset = 0, formation = {2, 1}};
get({5, 760}) ->
    #endless_data{type = 5, id = 760,
		  name = lang:get(<<"第760波"/utf8>>), lev = 480,
		  unit_ids = [60710], is_reset = 0, formation = {2, 1}};
get({5, 761}) ->
    #endless_data{type = 5, id = 761,
		  name = lang:get(<<"第761波"/utf8>>), lev = 481,
		  unit_ids = [60711], is_reset = 0, formation = {3, 1}};
get({5, 762}) ->
    #endless_data{type = 5, id = 762,
		  name = lang:get(<<"第762波"/utf8>>), lev = 481,
		  unit_ids = [60712], is_reset = 0, formation = {3, 1}};
get({5, 763}) ->
    #endless_data{type = 5, id = 763,
		  name = lang:get(<<"第763波"/utf8>>), lev = 482,
		  unit_ids = [60713], is_reset = 0, formation = {4, 1}};
get({5, 764}) ->
    #endless_data{type = 5, id = 764,
		  name = lang:get(<<"第764波"/utf8>>), lev = 482,
		  unit_ids = [60714], is_reset = 0, formation = {4, 1}};
get({5, 765}) ->
    #endless_data{type = 5, id = 765,
		  name = lang:get(<<"第765波"/utf8>>), lev = 483,
		  unit_ids = [60715], is_reset = 0, formation = {5, 1}};
get({5, 766}) ->
    #endless_data{type = 5, id = 766,
		  name = lang:get(<<"第766波"/utf8>>), lev = 483,
		  unit_ids = [60601], is_reset = 0, formation = {5, 1}};
get({5, 767}) ->
    #endless_data{type = 5, id = 767,
		  name = lang:get(<<"第767波"/utf8>>), lev = 484,
		  unit_ids = [60602], is_reset = 0, formation = {6, 1}};
get({5, 768}) ->
    #endless_data{type = 5, id = 768,
		  name = lang:get(<<"第768波"/utf8>>), lev = 484,
		  unit_ids = [60603], is_reset = 0, formation = {6, 1}};
get({5, 769}) ->
    #endless_data{type = 5, id = 769,
		  name = lang:get(<<"第769波"/utf8>>), lev = 485,
		  unit_ids = [60604], is_reset = 0, formation = {1, 1}};
get({5, 770}) ->
    #endless_data{type = 5, id = 770,
		  name = lang:get(<<"第770波"/utf8>>), lev = 485,
		  unit_ids = [60605], is_reset = 0, formation = {1, 1}};
get({5, 771}) ->
    #endless_data{type = 5, id = 771,
		  name = lang:get(<<"第771波"/utf8>>), lev = 486,
		  unit_ids = [60606], is_reset = 0, formation = {2, 1}};
get({5, 772}) ->
    #endless_data{type = 5, id = 772,
		  name = lang:get(<<"第772波"/utf8>>), lev = 486,
		  unit_ids = [60607], is_reset = 0, formation = {2, 1}};
get({5, 773}) ->
    #endless_data{type = 5, id = 773,
		  name = lang:get(<<"第773波"/utf8>>), lev = 487,
		  unit_ids = [60608], is_reset = 0, formation = {3, 1}};
get({5, 774}) ->
    #endless_data{type = 5, id = 774,
		  name = lang:get(<<"第774波"/utf8>>), lev = 487,
		  unit_ids = [60609], is_reset = 0, formation = {3, 1}};
get({5, 775}) ->
    #endless_data{type = 5, id = 775,
		  name = lang:get(<<"第775波"/utf8>>), lev = 488,
		  unit_ids = [60610], is_reset = 0, formation = {4, 1}};
get({5, 776}) ->
    #endless_data{type = 5, id = 776,
		  name = lang:get(<<"第776波"/utf8>>), lev = 488,
		  unit_ids = [60611], is_reset = 0, formation = {4, 1}};
get({5, 777}) ->
    #endless_data{type = 5, id = 777,
		  name = lang:get(<<"第777波"/utf8>>), lev = 489,
		  unit_ids = [60612], is_reset = 0, formation = {5, 1}};
get({5, 778}) ->
    #endless_data{type = 5, id = 778,
		  name = lang:get(<<"第778波"/utf8>>), lev = 489,
		  unit_ids = [60613], is_reset = 0, formation = {5, 1}};
get({5, 779}) ->
    #endless_data{type = 5, id = 779,
		  name = lang:get(<<"第779波"/utf8>>), lev = 490,
		  unit_ids = [60614], is_reset = 0, formation = {6, 1}};
get({5, 780}) ->
    #endless_data{type = 5, id = 780,
		  name = lang:get(<<"第780波"/utf8>>), lev = 490,
		  unit_ids = [60615], is_reset = 0, formation = {6, 1}};
get({5, 781}) ->
    #endless_data{type = 5, id = 781,
		  name = lang:get(<<"第781波"/utf8>>), lev = 491,
		  unit_ids = [60701], is_reset = 0, formation = {1, 1}};
get({5, 782}) ->
    #endless_data{type = 5, id = 782,
		  name = lang:get(<<"第782波"/utf8>>), lev = 491,
		  unit_ids = [60702], is_reset = 0, formation = {1, 1}};
get({5, 783}) ->
    #endless_data{type = 5, id = 783,
		  name = lang:get(<<"第783波"/utf8>>), lev = 492,
		  unit_ids = [60703], is_reset = 0, formation = {2, 1}};
get({5, 784}) ->
    #endless_data{type = 5, id = 784,
		  name = lang:get(<<"第784波"/utf8>>), lev = 492,
		  unit_ids = [60704], is_reset = 0, formation = {2, 1}};
get({5, 785}) ->
    #endless_data{type = 5, id = 785,
		  name = lang:get(<<"第785波"/utf8>>), lev = 493,
		  unit_ids = [60705], is_reset = 0, formation = {3, 1}};
get({5, 786}) ->
    #endless_data{type = 5, id = 786,
		  name = lang:get(<<"第786波"/utf8>>), lev = 493,
		  unit_ids = [60706], is_reset = 0, formation = {3, 1}};
get({5, 787}) ->
    #endless_data{type = 5, id = 787,
		  name = lang:get(<<"第787波"/utf8>>), lev = 494,
		  unit_ids = [60707], is_reset = 0, formation = {4, 1}};
get({5, 788}) ->
    #endless_data{type = 5, id = 788,
		  name = lang:get(<<"第788波"/utf8>>), lev = 494,
		  unit_ids = [60708], is_reset = 0, formation = {4, 1}};
get({5, 789}) ->
    #endless_data{type = 5, id = 789,
		  name = lang:get(<<"第789波"/utf8>>), lev = 495,
		  unit_ids = [60709], is_reset = 0, formation = {5, 1}};
get({5, 790}) ->
    #endless_data{type = 5, id = 790,
		  name = lang:get(<<"第790波"/utf8>>), lev = 495,
		  unit_ids = [60710], is_reset = 0, formation = {5, 1}};
get({5, 791}) ->
    #endless_data{type = 5, id = 791,
		  name = lang:get(<<"第791波"/utf8>>), lev = 496,
		  unit_ids = [60711], is_reset = 0, formation = {6, 1}};
get({5, 792}) ->
    #endless_data{type = 5, id = 792,
		  name = lang:get(<<"第792波"/utf8>>), lev = 496,
		  unit_ids = [60712], is_reset = 0, formation = {6, 1}};
get({5, 793}) ->
    #endless_data{type = 5, id = 793,
		  name = lang:get(<<"第793波"/utf8>>), lev = 497,
		  unit_ids = [60713], is_reset = 0, formation = {1, 1}};
get({5, 794}) ->
    #endless_data{type = 5, id = 794,
		  name = lang:get(<<"第794波"/utf8>>), lev = 497,
		  unit_ids = [60714], is_reset = 0, formation = {1, 1}};
get({5, 795}) ->
    #endless_data{type = 5, id = 795,
		  name = lang:get(<<"第795波"/utf8>>), lev = 498,
		  unit_ids = [60715], is_reset = 0, formation = {2, 1}};
get({5, 796}) ->
    #endless_data{type = 5, id = 796,
		  name = lang:get(<<"第796波"/utf8>>), lev = 498,
		  unit_ids = [60601], is_reset = 0, formation = {2, 1}};
get({5, 797}) ->
    #endless_data{type = 5, id = 797,
		  name = lang:get(<<"第797波"/utf8>>), lev = 499,
		  unit_ids = [60602], is_reset = 0, formation = {3, 1}};
get({5, 798}) ->
    #endless_data{type = 5, id = 798,
		  name = lang:get(<<"第798波"/utf8>>), lev = 499,
		  unit_ids = [60603], is_reset = 0, formation = {3, 1}};
get({5, 799}) ->
    #endless_data{type = 5, id = 799,
		  name = lang:get(<<"第799波"/utf8>>), lev = 500,
		  unit_ids = [60604], is_reset = 0, formation = {4, 1}};
get({5, 800}) ->
    #endless_data{type = 5, id = 800,
		  name = lang:get(<<"第800波"/utf8>>), lev = 500,
		  unit_ids = [60605], is_reset = 0, formation = {4, 1}};
get({5, 801}) ->
    #endless_data{type = 5, id = 801,
		  name = lang:get(<<"第801波"/utf8>>), lev = 501,
		  unit_ids = [60801], is_reset = 0, formation = {1, 1}};
get({5, 802}) ->
    #endless_data{type = 5, id = 802,
		  name = lang:get(<<"第802波"/utf8>>), lev = 501,
		  unit_ids = [60802], is_reset = 0, formation = {1, 1}};
get({5, 803}) ->
    #endless_data{type = 5, id = 803,
		  name = lang:get(<<"第803波"/utf8>>), lev = 502,
		  unit_ids = [60803], is_reset = 0, formation = {2, 1}};
get({5, 804}) ->
    #endless_data{type = 5, id = 804,
		  name = lang:get(<<"第804波"/utf8>>), lev = 502,
		  unit_ids = [60804], is_reset = 0, formation = {2, 1}};
get({5, 805}) ->
    #endless_data{type = 5, id = 805,
		  name = lang:get(<<"第805波"/utf8>>), lev = 503,
		  unit_ids = [60805], is_reset = 0, formation = {3, 1}};
get({5, 806}) ->
    #endless_data{type = 5, id = 806,
		  name = lang:get(<<"第806波"/utf8>>), lev = 503,
		  unit_ids = [60806], is_reset = 0, formation = {3, 1}};
get({5, 807}) ->
    #endless_data{type = 5, id = 807,
		  name = lang:get(<<"第807波"/utf8>>), lev = 504,
		  unit_ids = [60807], is_reset = 0, formation = {4, 1}};
get({5, 808}) ->
    #endless_data{type = 5, id = 808,
		  name = lang:get(<<"第808波"/utf8>>), lev = 504,
		  unit_ids = [60808], is_reset = 0, formation = {4, 1}};
get({5, 809}) ->
    #endless_data{type = 5, id = 809,
		  name = lang:get(<<"第809波"/utf8>>), lev = 505,
		  unit_ids = [60801], is_reset = 0, formation = {5, 1}};
get({5, 810}) ->
    #endless_data{type = 5, id = 810,
		  name = lang:get(<<"第810波"/utf8>>), lev = 505,
		  unit_ids = [60802], is_reset = 0, formation = {5, 1}};
get({5, 811}) ->
    #endless_data{type = 5, id = 811,
		  name = lang:get(<<"第811波"/utf8>>), lev = 506,
		  unit_ids = [60803], is_reset = 0, formation = {6, 1}};
get({5, 812}) ->
    #endless_data{type = 5, id = 812,
		  name = lang:get(<<"第812波"/utf8>>), lev = 506,
		  unit_ids = [60804], is_reset = 0, formation = {6, 1}};
get({5, 813}) ->
    #endless_data{type = 5, id = 813,
		  name = lang:get(<<"第813波"/utf8>>), lev = 507,
		  unit_ids = [60805], is_reset = 0, formation = {1, 1}};
get({5, 814}) ->
    #endless_data{type = 5, id = 814,
		  name = lang:get(<<"第814波"/utf8>>), lev = 507,
		  unit_ids = [60806], is_reset = 0, formation = {1, 1}};
get({5, 815}) ->
    #endless_data{type = 5, id = 815,
		  name = lang:get(<<"第815波"/utf8>>), lev = 508,
		  unit_ids = [60807], is_reset = 0, formation = {2, 1}};
get({5, 816}) ->
    #endless_data{type = 5, id = 816,
		  name = lang:get(<<"第816波"/utf8>>), lev = 508,
		  unit_ids = [60808], is_reset = 0, formation = {2, 1}};
get({5, 817}) ->
    #endless_data{type = 5, id = 817,
		  name = lang:get(<<"第817波"/utf8>>), lev = 509,
		  unit_ids = [60801], is_reset = 0, formation = {3, 1}};
get({5, 818}) ->
    #endless_data{type = 5, id = 818,
		  name = lang:get(<<"第818波"/utf8>>), lev = 509,
		  unit_ids = [60802], is_reset = 0, formation = {3, 1}};
get({5, 819}) ->
    #endless_data{type = 5, id = 819,
		  name = lang:get(<<"第819波"/utf8>>), lev = 510,
		  unit_ids = [60803], is_reset = 0, formation = {4, 1}};
get({5, 820}) ->
    #endless_data{type = 5, id = 820,
		  name = lang:get(<<"第820波"/utf8>>), lev = 510,
		  unit_ids = [60804], is_reset = 0, formation = {4, 1}};
get({5, 821}) ->
    #endless_data{type = 5, id = 821,
		  name = lang:get(<<"第821波"/utf8>>), lev = 511,
		  unit_ids = [60805], is_reset = 0, formation = {1, 1}};
get({5, 822}) ->
    #endless_data{type = 5, id = 822,
		  name = lang:get(<<"第822波"/utf8>>), lev = 511,
		  unit_ids = [60806], is_reset = 0, formation = {1, 1}};
get({5, 823}) ->
    #endless_data{type = 5, id = 823,
		  name = lang:get(<<"第823波"/utf8>>), lev = 512,
		  unit_ids = [60807], is_reset = 0, formation = {2, 1}};
get({5, 824}) ->
    #endless_data{type = 5, id = 824,
		  name = lang:get(<<"第824波"/utf8>>), lev = 512,
		  unit_ids = [60808], is_reset = 0, formation = {2, 1}};
get({5, 825}) ->
    #endless_data{type = 5, id = 825,
		  name = lang:get(<<"第825波"/utf8>>), lev = 513,
		  unit_ids = [60801], is_reset = 0, formation = {3, 1}};
get({5, 826}) ->
    #endless_data{type = 5, id = 826,
		  name = lang:get(<<"第826波"/utf8>>), lev = 513,
		  unit_ids = [60802], is_reset = 0, formation = {3, 1}};
get({5, 827}) ->
    #endless_data{type = 5, id = 827,
		  name = lang:get(<<"第827波"/utf8>>), lev = 514,
		  unit_ids = [60803], is_reset = 0, formation = {4, 1}};
get({5, 828}) ->
    #endless_data{type = 5, id = 828,
		  name = lang:get(<<"第828波"/utf8>>), lev = 514,
		  unit_ids = [60804], is_reset = 0, formation = {4, 1}};
get({5, 829}) ->
    #endless_data{type = 5, id = 829,
		  name = lang:get(<<"第829波"/utf8>>), lev = 515,
		  unit_ids = [60805], is_reset = 0, formation = {5, 1}};
get({5, 830}) ->
    #endless_data{type = 5, id = 830,
		  name = lang:get(<<"第830波"/utf8>>), lev = 515,
		  unit_ids = [60806], is_reset = 0, formation = {5, 1}};
get({5, 831}) ->
    #endless_data{type = 5, id = 831,
		  name = lang:get(<<"第831波"/utf8>>), lev = 516,
		  unit_ids = [60807], is_reset = 0, formation = {6, 1}};
get({5, 832}) ->
    #endless_data{type = 5, id = 832,
		  name = lang:get(<<"第832波"/utf8>>), lev = 516,
		  unit_ids = [60808], is_reset = 0, formation = {6, 1}};
get({5, 833}) ->
    #endless_data{type = 5, id = 833,
		  name = lang:get(<<"第833波"/utf8>>), lev = 517,
		  unit_ids = [60801], is_reset = 0, formation = {1, 1}};
get({5, 834}) ->
    #endless_data{type = 5, id = 834,
		  name = lang:get(<<"第834波"/utf8>>), lev = 517,
		  unit_ids = [60802], is_reset = 0, formation = {1, 1}};
get({5, 835}) ->
    #endless_data{type = 5, id = 835,
		  name = lang:get(<<"第835波"/utf8>>), lev = 518,
		  unit_ids = [60803], is_reset = 0, formation = {2, 1}};
get({5, 836}) ->
    #endless_data{type = 5, id = 836,
		  name = lang:get(<<"第836波"/utf8>>), lev = 518,
		  unit_ids = [60804], is_reset = 0, formation = {2, 1}};
get({5, 837}) ->
    #endless_data{type = 5, id = 837,
		  name = lang:get(<<"第837波"/utf8>>), lev = 519,
		  unit_ids = [60805], is_reset = 0, formation = {3, 1}};
get({5, 838}) ->
    #endless_data{type = 5, id = 838,
		  name = lang:get(<<"第838波"/utf8>>), lev = 519,
		  unit_ids = [60806], is_reset = 0, formation = {3, 1}};
get({5, 839}) ->
    #endless_data{type = 5, id = 839,
		  name = lang:get(<<"第839波"/utf8>>), lev = 520,
		  unit_ids = [60807], is_reset = 0, formation = {4, 1}};
get({5, 840}) ->
    #endless_data{type = 5, id = 840,
		  name = lang:get(<<"第840波"/utf8>>), lev = 520,
		  unit_ids = [60808], is_reset = 0, formation = {4, 1}};
get({5, 841}) ->
    #endless_data{type = 5, id = 841,
		  name = lang:get(<<"第841波"/utf8>>), lev = 521,
		  unit_ids = [60801], is_reset = 0, formation = {1, 1}};
get({5, 842}) ->
    #endless_data{type = 5, id = 842,
		  name = lang:get(<<"第842波"/utf8>>), lev = 521,
		  unit_ids = [60802], is_reset = 0, formation = {1, 1}};
get({5, 843}) ->
    #endless_data{type = 5, id = 843,
		  name = lang:get(<<"第843波"/utf8>>), lev = 522,
		  unit_ids = [60803], is_reset = 0, formation = {2, 1}};
get({5, 844}) ->
    #endless_data{type = 5, id = 844,
		  name = lang:get(<<"第844波"/utf8>>), lev = 522,
		  unit_ids = [60804], is_reset = 0, formation = {2, 1}};
get({5, 845}) ->
    #endless_data{type = 5, id = 845,
		  name = lang:get(<<"第845波"/utf8>>), lev = 523,
		  unit_ids = [60805], is_reset = 0, formation = {3, 1}};
get({5, 846}) ->
    #endless_data{type = 5, id = 846,
		  name = lang:get(<<"第846波"/utf8>>), lev = 523,
		  unit_ids = [60806], is_reset = 0, formation = {3, 1}};
get({5, 847}) ->
    #endless_data{type = 5, id = 847,
		  name = lang:get(<<"第847波"/utf8>>), lev = 524,
		  unit_ids = [60807], is_reset = 0, formation = {4, 1}};
get({5, 848}) ->
    #endless_data{type = 5, id = 848,
		  name = lang:get(<<"第848波"/utf8>>), lev = 524,
		  unit_ids = [60808], is_reset = 0, formation = {4, 1}};
get({5, 849}) ->
    #endless_data{type = 5, id = 849,
		  name = lang:get(<<"第849波"/utf8>>), lev = 525,
		  unit_ids = [60801], is_reset = 0, formation = {5, 1}};
get({5, 850}) ->
    #endless_data{type = 5, id = 850,
		  name = lang:get(<<"第850波"/utf8>>), lev = 525,
		  unit_ids = [60802], is_reset = 0, formation = {5, 1}};
get({5, 851}) ->
    #endless_data{type = 5, id = 851,
		  name = lang:get(<<"第851波"/utf8>>), lev = 526,
		  unit_ids = [60803], is_reset = 0, formation = {6, 1}};
get({5, 852}) ->
    #endless_data{type = 5, id = 852,
		  name = lang:get(<<"第852波"/utf8>>), lev = 526,
		  unit_ids = [60804], is_reset = 0, formation = {6, 1}};
get({5, 853}) ->
    #endless_data{type = 5, id = 853,
		  name = lang:get(<<"第853波"/utf8>>), lev = 527,
		  unit_ids = [60805], is_reset = 0, formation = {1, 1}};
get({5, 854}) ->
    #endless_data{type = 5, id = 854,
		  name = lang:get(<<"第854波"/utf8>>), lev = 527,
		  unit_ids = [60806], is_reset = 0, formation = {1, 1}};
get({5, 855}) ->
    #endless_data{type = 5, id = 855,
		  name = lang:get(<<"第855波"/utf8>>), lev = 528,
		  unit_ids = [60807], is_reset = 0, formation = {2, 1}};
get({5, 856}) ->
    #endless_data{type = 5, id = 856,
		  name = lang:get(<<"第856波"/utf8>>), lev = 528,
		  unit_ids = [60808], is_reset = 0, formation = {2, 1}};
get({5, 857}) ->
    #endless_data{type = 5, id = 857,
		  name = lang:get(<<"第857波"/utf8>>), lev = 529,
		  unit_ids = [60801], is_reset = 0, formation = {3, 1}};
get({5, 858}) ->
    #endless_data{type = 5, id = 858,
		  name = lang:get(<<"第858波"/utf8>>), lev = 529,
		  unit_ids = [60802], is_reset = 0, formation = {3, 1}};
get({5, 859}) ->
    #endless_data{type = 5, id = 859,
		  name = lang:get(<<"第859波"/utf8>>), lev = 530,
		  unit_ids = [60803], is_reset = 0, formation = {4, 1}};
get({5, 860}) ->
    #endless_data{type = 5, id = 860,
		  name = lang:get(<<"第860波"/utf8>>), lev = 530,
		  unit_ids = [60804], is_reset = 0, formation = {4, 1}};
get({5, 861}) ->
    #endless_data{type = 5, id = 861,
		  name = lang:get(<<"第861波"/utf8>>), lev = 531,
		  unit_ids = [60805], is_reset = 0, formation = {1, 1}};
get({5, 862}) ->
    #endless_data{type = 5, id = 862,
		  name = lang:get(<<"第862波"/utf8>>), lev = 531,
		  unit_ids = [60806], is_reset = 0, formation = {1, 1}};
get({5, 863}) ->
    #endless_data{type = 5, id = 863,
		  name = lang:get(<<"第863波"/utf8>>), lev = 532,
		  unit_ids = [60807], is_reset = 0, formation = {2, 1}};
get({5, 864}) ->
    #endless_data{type = 5, id = 864,
		  name = lang:get(<<"第864波"/utf8>>), lev = 532,
		  unit_ids = [60808], is_reset = 0, formation = {2, 1}};
get({5, 865}) ->
    #endless_data{type = 5, id = 865,
		  name = lang:get(<<"第865波"/utf8>>), lev = 533,
		  unit_ids = [60801], is_reset = 0, formation = {3, 1}};
get({5, 866}) ->
    #endless_data{type = 5, id = 866,
		  name = lang:get(<<"第866波"/utf8>>), lev = 533,
		  unit_ids = [60802], is_reset = 0, formation = {3, 1}};
get({5, 867}) ->
    #endless_data{type = 5, id = 867,
		  name = lang:get(<<"第867波"/utf8>>), lev = 534,
		  unit_ids = [60803], is_reset = 0, formation = {4, 1}};
get({5, 868}) ->
    #endless_data{type = 5, id = 868,
		  name = lang:get(<<"第868波"/utf8>>), lev = 534,
		  unit_ids = [60804], is_reset = 0, formation = {4, 1}};
get({5, 869}) ->
    #endless_data{type = 5, id = 869,
		  name = lang:get(<<"第869波"/utf8>>), lev = 535,
		  unit_ids = [60805], is_reset = 0, formation = {5, 1}};
get({5, 870}) ->
    #endless_data{type = 5, id = 870,
		  name = lang:get(<<"第870波"/utf8>>), lev = 535,
		  unit_ids = [60806], is_reset = 0, formation = {5, 1}};
get({5, 871}) ->
    #endless_data{type = 5, id = 871,
		  name = lang:get(<<"第871波"/utf8>>), lev = 536,
		  unit_ids = [60807], is_reset = 0, formation = {6, 1}};
get({5, 872}) ->
    #endless_data{type = 5, id = 872,
		  name = lang:get(<<"第872波"/utf8>>), lev = 536,
		  unit_ids = [60808], is_reset = 0, formation = {6, 1}};
get({5, 873}) ->
    #endless_data{type = 5, id = 873,
		  name = lang:get(<<"第873波"/utf8>>), lev = 537,
		  unit_ids = [60801], is_reset = 0, formation = {1, 1}};
get({5, 874}) ->
    #endless_data{type = 5, id = 874,
		  name = lang:get(<<"第874波"/utf8>>), lev = 537,
		  unit_ids = [60802], is_reset = 0, formation = {1, 1}};
get({5, 875}) ->
    #endless_data{type = 5, id = 875,
		  name = lang:get(<<"第875波"/utf8>>), lev = 538,
		  unit_ids = [60803], is_reset = 0, formation = {2, 1}};
get({5, 876}) ->
    #endless_data{type = 5, id = 876,
		  name = lang:get(<<"第876波"/utf8>>), lev = 538,
		  unit_ids = [60804], is_reset = 0, formation = {2, 1}};
get({5, 877}) ->
    #endless_data{type = 5, id = 877,
		  name = lang:get(<<"第877波"/utf8>>), lev = 539,
		  unit_ids = [60805], is_reset = 0, formation = {3, 1}};
get({5, 878}) ->
    #endless_data{type = 5, id = 878,
		  name = lang:get(<<"第878波"/utf8>>), lev = 539,
		  unit_ids = [60806], is_reset = 0, formation = {3, 1}};
get({5, 879}) ->
    #endless_data{type = 5, id = 879,
		  name = lang:get(<<"第879波"/utf8>>), lev = 540,
		  unit_ids = [60807], is_reset = 0, formation = {4, 1}};
get({5, 880}) ->
    #endless_data{type = 5, id = 880,
		  name = lang:get(<<"第880波"/utf8>>), lev = 540,
		  unit_ids = [60808], is_reset = 0, formation = {4, 1}};
get({5, 881}) ->
    #endless_data{type = 5, id = 881,
		  name = lang:get(<<"第881波"/utf8>>), lev = 541,
		  unit_ids = [60801], is_reset = 0, formation = {1, 1}};
get({5, 882}) ->
    #endless_data{type = 5, id = 882,
		  name = lang:get(<<"第882波"/utf8>>), lev = 541,
		  unit_ids = [60802], is_reset = 0, formation = {1, 1}};
get({5, 883}) ->
    #endless_data{type = 5, id = 883,
		  name = lang:get(<<"第883波"/utf8>>), lev = 542,
		  unit_ids = [60803], is_reset = 0, formation = {2, 1}};
get({5, 884}) ->
    #endless_data{type = 5, id = 884,
		  name = lang:get(<<"第884波"/utf8>>), lev = 542,
		  unit_ids = [60804], is_reset = 0, formation = {2, 1}};
get({5, 885}) ->
    #endless_data{type = 5, id = 885,
		  name = lang:get(<<"第885波"/utf8>>), lev = 543,
		  unit_ids = [60805], is_reset = 0, formation = {3, 1}};
get({5, 886}) ->
    #endless_data{type = 5, id = 886,
		  name = lang:get(<<"第886波"/utf8>>), lev = 543,
		  unit_ids = [60806], is_reset = 0, formation = {3, 1}};
get({5, 887}) ->
    #endless_data{type = 5, id = 887,
		  name = lang:get(<<"第887波"/utf8>>), lev = 544,
		  unit_ids = [60807], is_reset = 0, formation = {4, 1}};
get({5, 888}) ->
    #endless_data{type = 5, id = 888,
		  name = lang:get(<<"第888波"/utf8>>), lev = 544,
		  unit_ids = [60808], is_reset = 0, formation = {4, 1}};
get({5, 889}) ->
    #endless_data{type = 5, id = 889,
		  name = lang:get(<<"第889波"/utf8>>), lev = 545,
		  unit_ids = [60801], is_reset = 0, formation = {5, 1}};
get({5, 890}) ->
    #endless_data{type = 5, id = 890,
		  name = lang:get(<<"第890波"/utf8>>), lev = 545,
		  unit_ids = [60802], is_reset = 0, formation = {5, 1}};
get({5, 891}) ->
    #endless_data{type = 5, id = 891,
		  name = lang:get(<<"第891波"/utf8>>), lev = 546,
		  unit_ids = [60803], is_reset = 0, formation = {6, 1}};
get({5, 892}) ->
    #endless_data{type = 5, id = 892,
		  name = lang:get(<<"第892波"/utf8>>), lev = 546,
		  unit_ids = [60804], is_reset = 0, formation = {6, 1}};
get({5, 893}) ->
    #endless_data{type = 5, id = 893,
		  name = lang:get(<<"第893波"/utf8>>), lev = 547,
		  unit_ids = [60805], is_reset = 0, formation = {1, 1}};
get({5, 894}) ->
    #endless_data{type = 5, id = 894,
		  name = lang:get(<<"第894波"/utf8>>), lev = 547,
		  unit_ids = [60806], is_reset = 0, formation = {1, 1}};
get({5, 895}) ->
    #endless_data{type = 5, id = 895,
		  name = lang:get(<<"第895波"/utf8>>), lev = 548,
		  unit_ids = [60807], is_reset = 0, formation = {2, 1}};
get({5, 896}) ->
    #endless_data{type = 5, id = 896,
		  name = lang:get(<<"第896波"/utf8>>), lev = 548,
		  unit_ids = [60808], is_reset = 0, formation = {2, 1}};
get({5, 897}) ->
    #endless_data{type = 5, id = 897,
		  name = lang:get(<<"第897波"/utf8>>), lev = 549,
		  unit_ids = [60801], is_reset = 0, formation = {3, 1}};
get({5, 898}) ->
    #endless_data{type = 5, id = 898,
		  name = lang:get(<<"第898波"/utf8>>), lev = 549,
		  unit_ids = [60802], is_reset = 0, formation = {3, 1}};
get({5, 899}) ->
    #endless_data{type = 5, id = 899,
		  name = lang:get(<<"第899波"/utf8>>), lev = 550,
		  unit_ids = [60803], is_reset = 0, formation = {4, 1}};
get({5, 900}) ->
    #endless_data{type = 5, id = 900,
		  name = lang:get(<<"第900波"/utf8>>), lev = 550,
		  unit_ids = [60804], is_reset = 0, formation = {4, 1}};
get({1, 1}) ->
    #endless_data{type = 1, id = 1,
		  name = lang:get(<<"第1波"/utf8>>), lev = 185,
		  unit_ids = [61101], is_reset = 0, formation = {1, 1}};
get({1, 2}) ->
    #endless_data{type = 1, id = 2,
		  name = lang:get(<<"第2波"/utf8>>), lev = 185,
		  unit_ids = [61102], is_reset = 0, formation = {1, 1}};
get({1, 3}) ->
    #endless_data{type = 1, id = 3,
		  name = lang:get(<<"第3波"/utf8>>), lev = 185,
		  unit_ids = [61103], is_reset = 0, formation = {2, 1}};
get({1, 4}) ->
    #endless_data{type = 1, id = 4,
		  name = lang:get(<<"第4波"/utf8>>), lev = 186,
		  unit_ids = [61104], is_reset = 0, formation = {2, 1}};
get({1, 5}) ->
    #endless_data{type = 1, id = 5,
		  name = lang:get(<<"第5波"/utf8>>), lev = 186,
		  unit_ids = [61105], is_reset = 0, formation = {3, 1}};
get({1, 6}) ->
    #endless_data{type = 1, id = 6,
		  name = lang:get(<<"第6波"/utf8>>), lev = 186,
		  unit_ids = [61106], is_reset = 0, formation = {3, 1}};
get({1, 7}) ->
    #endless_data{type = 1, id = 7,
		  name = lang:get(<<"第7波"/utf8>>), lev = 187,
		  unit_ids = [61107], is_reset = 0, formation = {4, 1}};
get({1, 8}) ->
    #endless_data{type = 1, id = 8,
		  name = lang:get(<<"第8波"/utf8>>), lev = 187,
		  unit_ids = [61108], is_reset = 0, formation = {4, 1}};
get({1, 9}) ->
    #endless_data{type = 1, id = 9,
		  name = lang:get(<<"第9波"/utf8>>), lev = 187,
		  unit_ids = [61101], is_reset = 0, formation = {5, 1}};
get({1, 10}) ->
    #endless_data{type = 1, id = 10,
		  name = lang:get(<<"第10波"/utf8>>), lev = 188,
		  unit_ids = [61102], is_reset = 0, formation = {5, 1}};
get({1, 11}) ->
    #endless_data{type = 1, id = 11,
		  name = lang:get(<<"第11波"/utf8>>), lev = 188,
		  unit_ids = [61103], is_reset = 0, formation = {6, 1}};
get({1, 12}) ->
    #endless_data{type = 1, id = 12,
		  name = lang:get(<<"第12波"/utf8>>), lev = 188,
		  unit_ids = [61104], is_reset = 0, formation = {6, 1}};
get({1, 13}) ->
    #endless_data{type = 1, id = 13,
		  name = lang:get(<<"第13波"/utf8>>), lev = 189,
		  unit_ids = [61105], is_reset = 0, formation = {1, 1}};
get({1, 14}) ->
    #endless_data{type = 1, id = 14,
		  name = lang:get(<<"第14波"/utf8>>), lev = 189,
		  unit_ids = [61106], is_reset = 0, formation = {1, 1}};
get({1, 15}) ->
    #endless_data{type = 1, id = 15,
		  name = lang:get(<<"第15波"/utf8>>), lev = 189,
		  unit_ids = [61107], is_reset = 0, formation = {2, 1}};
get({1, 16}) ->
    #endless_data{type = 1, id = 16,
		  name = lang:get(<<"第16波"/utf8>>), lev = 190,
		  unit_ids = [61108], is_reset = 0, formation = {2, 1}};
get({1, 17}) ->
    #endless_data{type = 1, id = 17,
		  name = lang:get(<<"第17波"/utf8>>), lev = 190,
		  unit_ids = [61101], is_reset = 0, formation = {3, 1}};
get({1, 18}) ->
    #endless_data{type = 1, id = 18,
		  name = lang:get(<<"第18波"/utf8>>), lev = 190,
		  unit_ids = [61102], is_reset = 0, formation = {3, 1}};
get({1, 19}) ->
    #endless_data{type = 1, id = 19,
		  name = lang:get(<<"第19波"/utf8>>), lev = 191,
		  unit_ids = [61103], is_reset = 0, formation = {4, 1}};
get({1, 20}) ->
    #endless_data{type = 1, id = 20,
		  name = lang:get(<<"第20波"/utf8>>), lev = 191,
		  unit_ids = [61104], is_reset = 0, formation = {4, 1}};
get({1, 21}) ->
    #endless_data{type = 1, id = 21,
		  name = lang:get(<<"第21波"/utf8>>), lev = 191,
		  unit_ids = [61105], is_reset = 0, formation = {5, 1}};
get({1, 22}) ->
    #endless_data{type = 1, id = 22,
		  name = lang:get(<<"第22波"/utf8>>), lev = 192,
		  unit_ids = [61106], is_reset = 0, formation = {5, 1}};
get({1, 23}) ->
    #endless_data{type = 1, id = 23,
		  name = lang:get(<<"第23波"/utf8>>), lev = 192,
		  unit_ids = [61107], is_reset = 0, formation = {6, 1}};
get({1, 24}) ->
    #endless_data{type = 1, id = 24,
		  name = lang:get(<<"第24波"/utf8>>), lev = 192,
		  unit_ids = [61108], is_reset = 0, formation = {6, 1}};
get({1, 25}) ->
    #endless_data{type = 1, id = 25,
		  name = lang:get(<<"第25波"/utf8>>), lev = 193,
		  unit_ids = [61101], is_reset = 0, formation = {1, 1}};
get({1, 26}) ->
    #endless_data{type = 1, id = 26,
		  name = lang:get(<<"第26波"/utf8>>), lev = 193,
		  unit_ids = [61102], is_reset = 0, formation = {1, 1}};
get({1, 27}) ->
    #endless_data{type = 1, id = 27,
		  name = lang:get(<<"第27波"/utf8>>), lev = 193,
		  unit_ids = [61103], is_reset = 0, formation = {2, 1}};
get({1, 28}) ->
    #endless_data{type = 1, id = 28,
		  name = lang:get(<<"第28波"/utf8>>), lev = 194,
		  unit_ids = [61104], is_reset = 0, formation = {2, 1}};
get({1, 29}) ->
    #endless_data{type = 1, id = 29,
		  name = lang:get(<<"第29波"/utf8>>), lev = 194,
		  unit_ids = [61105], is_reset = 0, formation = {3, 1}};
get({1, 30}) ->
    #endless_data{type = 1, id = 30,
		  name = lang:get(<<"第30波"/utf8>>), lev = 194,
		  unit_ids = [61106], is_reset = 0, formation = {3, 1}};
get({1, 31}) ->
    #endless_data{type = 1, id = 31,
		  name = lang:get(<<"第31波"/utf8>>), lev = 195,
		  unit_ids = [61107], is_reset = 0, formation = {4, 1}};
get({1, 32}) ->
    #endless_data{type = 1, id = 32,
		  name = lang:get(<<"第32波"/utf8>>), lev = 195,
		  unit_ids = [61108], is_reset = 0, formation = {4, 1}};
get({1, 33}) ->
    #endless_data{type = 1, id = 33,
		  name = lang:get(<<"第33波"/utf8>>), lev = 195,
		  unit_ids = [61101], is_reset = 0, formation = {5, 1}};
get({1, 34}) ->
    #endless_data{type = 1, id = 34,
		  name = lang:get(<<"第34波"/utf8>>), lev = 196,
		  unit_ids = [61102], is_reset = 0, formation = {5, 1}};
get({1, 35}) ->
    #endless_data{type = 1, id = 35,
		  name = lang:get(<<"第35波"/utf8>>), lev = 196,
		  unit_ids = [61103], is_reset = 0, formation = {6, 1}};
get({1, 36}) ->
    #endless_data{type = 1, id = 36,
		  name = lang:get(<<"第36波"/utf8>>), lev = 196,
		  unit_ids = [61104], is_reset = 0, formation = {6, 1}};
get({1, 37}) ->
    #endless_data{type = 1, id = 37,
		  name = lang:get(<<"第37波"/utf8>>), lev = 197,
		  unit_ids = [61105], is_reset = 0, formation = {1, 1}};
get({1, 38}) ->
    #endless_data{type = 1, id = 38,
		  name = lang:get(<<"第38波"/utf8>>), lev = 197,
		  unit_ids = [61106], is_reset = 0, formation = {1, 1}};
get({1, 39}) ->
    #endless_data{type = 1, id = 39,
		  name = lang:get(<<"第39波"/utf8>>), lev = 197,
		  unit_ids = [61107], is_reset = 0, formation = {2, 1}};
get({1, 40}) ->
    #endless_data{type = 1, id = 40,
		  name = lang:get(<<"第40波"/utf8>>), lev = 198,
		  unit_ids = [61108], is_reset = 0, formation = {2, 1}};
get({1, 41}) ->
    #endless_data{type = 1, id = 41,
		  name = lang:get(<<"第41波"/utf8>>), lev = 198,
		  unit_ids = [61101], is_reset = 0, formation = {3, 1}};
get({1, 42}) ->
    #endless_data{type = 1, id = 42,
		  name = lang:get(<<"第42波"/utf8>>), lev = 198,
		  unit_ids = [61102], is_reset = 0, formation = {3, 1}};
get({1, 43}) ->
    #endless_data{type = 1, id = 43,
		  name = lang:get(<<"第43波"/utf8>>), lev = 199,
		  unit_ids = [61103], is_reset = 0, formation = {4, 1}};
get({1, 44}) ->
    #endless_data{type = 1, id = 44,
		  name = lang:get(<<"第44波"/utf8>>), lev = 199,
		  unit_ids = [61104], is_reset = 0, formation = {4, 1}};
get({1, 45}) ->
    #endless_data{type = 1, id = 45,
		  name = lang:get(<<"第45波"/utf8>>), lev = 199,
		  unit_ids = [61105], is_reset = 0, formation = {5, 1}};
get({1, 46}) ->
    #endless_data{type = 1, id = 46,
		  name = lang:get(<<"第46波"/utf8>>), lev = 200,
		  unit_ids = [61106], is_reset = 0, formation = {5, 1}};
get({1, 47}) ->
    #endless_data{type = 1, id = 47,
		  name = lang:get(<<"第47波"/utf8>>), lev = 200,
		  unit_ids = [61107], is_reset = 0, formation = {6, 1}};
get({1, 48}) ->
    #endless_data{type = 1, id = 48,
		  name = lang:get(<<"第48波"/utf8>>), lev = 200,
		  unit_ids = [61108], is_reset = 0, formation = {6, 1}};
get({1, 49}) ->
    #endless_data{type = 1, id = 49,
		  name = lang:get(<<"第49波"/utf8>>), lev = 201,
		  unit_ids = [61101], is_reset = 0, formation = {1, 1}};
get({1, 50}) ->
    #endless_data{type = 1, id = 50,
		  name = lang:get(<<"第50波"/utf8>>), lev = 201,
		  unit_ids = [61102], is_reset = 0, formation = {1, 1}};
get({1, 51}) ->
    #endless_data{type = 1, id = 51,
		  name = lang:get(<<"第51波"/utf8>>), lev = 201,
		  unit_ids = [61103], is_reset = 0, formation = {2, 1}};
get({1, 52}) ->
    #endless_data{type = 1, id = 52,
		  name = lang:get(<<"第52波"/utf8>>), lev = 202,
		  unit_ids = [61104], is_reset = 0, formation = {2, 1}};
get({1, 53}) ->
    #endless_data{type = 1, id = 53,
		  name = lang:get(<<"第53波"/utf8>>), lev = 202,
		  unit_ids = [61105], is_reset = 0, formation = {3, 1}};
get({1, 54}) ->
    #endless_data{type = 1, id = 54,
		  name = lang:get(<<"第54波"/utf8>>), lev = 202,
		  unit_ids = [61106], is_reset = 0, formation = {3, 1}};
get({1, 55}) ->
    #endless_data{type = 1, id = 55,
		  name = lang:get(<<"第55波"/utf8>>), lev = 203,
		  unit_ids = [61107], is_reset = 0, formation = {4, 1}};
get({1, 56}) ->
    #endless_data{type = 1, id = 56,
		  name = lang:get(<<"第56波"/utf8>>), lev = 203,
		  unit_ids = [61108], is_reset = 0, formation = {4, 1}};
get({1, 57}) ->
    #endless_data{type = 1, id = 57,
		  name = lang:get(<<"第57波"/utf8>>), lev = 203,
		  unit_ids = [61101], is_reset = 0, formation = {5, 1}};
get({1, 58}) ->
    #endless_data{type = 1, id = 58,
		  name = lang:get(<<"第58波"/utf8>>), lev = 204,
		  unit_ids = [61102], is_reset = 0, formation = {5, 1}};
get({1, 59}) ->
    #endless_data{type = 1, id = 59,
		  name = lang:get(<<"第59波"/utf8>>), lev = 204,
		  unit_ids = [61103], is_reset = 0, formation = {6, 1}};
get({1, 60}) ->
    #endless_data{type = 1, id = 60,
		  name = lang:get(<<"第60波"/utf8>>), lev = 204,
		  unit_ids = [61104], is_reset = 0, formation = {6, 1}};
get({1, 61}) ->
    #endless_data{type = 1, id = 61,
		  name = lang:get(<<"第61波"/utf8>>), lev = 205,
		  unit_ids = [61105], is_reset = 0, formation = {1, 1}};
get({1, 62}) ->
    #endless_data{type = 1, id = 62,
		  name = lang:get(<<"第62波"/utf8>>), lev = 205,
		  unit_ids = [61106], is_reset = 0, formation = {1, 1}};
get({1, 63}) ->
    #endless_data{type = 1, id = 63,
		  name = lang:get(<<"第63波"/utf8>>), lev = 205,
		  unit_ids = [61107], is_reset = 0, formation = {2, 1}};
get({1, 64}) ->
    #endless_data{type = 1, id = 64,
		  name = lang:get(<<"第64波"/utf8>>), lev = 206,
		  unit_ids = [61109], is_reset = 0, formation = {2, 1}};
get({1, 65}) ->
    #endless_data{type = 1, id = 65,
		  name = lang:get(<<"第65波"/utf8>>), lev = 206,
		  unit_ids = [61110], is_reset = 0, formation = {3, 1}};
get({1, 66}) ->
    #endless_data{type = 1, id = 66,
		  name = lang:get(<<"第66波"/utf8>>), lev = 206,
		  unit_ids = [61111], is_reset = 0, formation = {3, 1}};
get({1, 67}) ->
    #endless_data{type = 1, id = 67,
		  name = lang:get(<<"第67波"/utf8>>), lev = 207,
		  unit_ids = [61112], is_reset = 0, formation = {4, 1}};
get({1, 68}) ->
    #endless_data{type = 1, id = 68,
		  name = lang:get(<<"第68波"/utf8>>), lev = 207,
		  unit_ids = [61113], is_reset = 0, formation = {4, 1}};
get({1, 69}) ->
    #endless_data{type = 1, id = 69,
		  name = lang:get(<<"第69波"/utf8>>), lev = 207,
		  unit_ids = [61114], is_reset = 0, formation = {5, 1}};
get({1, 70}) ->
    #endless_data{type = 1, id = 70,
		  name = lang:get(<<"第70波"/utf8>>), lev = 208,
		  unit_ids = [61115], is_reset = 0, formation = {5, 1}};
get({1, 71}) ->
    #endless_data{type = 1, id = 71,
		  name = lang:get(<<"第71波"/utf8>>), lev = 208,
		  unit_ids = [61116], is_reset = 0, formation = {6, 1}};
get({1, 72}) ->
    #endless_data{type = 1, id = 72,
		  name = lang:get(<<"第72波"/utf8>>), lev = 208,
		  unit_ids = [61117], is_reset = 0, formation = {6, 1}};
get({1, 73}) ->
    #endless_data{type = 1, id = 73,
		  name = lang:get(<<"第73波"/utf8>>), lev = 209,
		  unit_ids = [61118], is_reset = 0, formation = {1, 1}};
get({1, 74}) ->
    #endless_data{type = 1, id = 74,
		  name = lang:get(<<"第74波"/utf8>>), lev = 209,
		  unit_ids = [61119], is_reset = 0, formation = {1, 1}};
get({1, 75}) ->
    #endless_data{type = 1, id = 75,
		  name = lang:get(<<"第75波"/utf8>>), lev = 209,
		  unit_ids = [61120], is_reset = 0, formation = {2, 1}};
get({1, 76}) ->
    #endless_data{type = 1, id = 76,
		  name = lang:get(<<"第76波"/utf8>>), lev = 210,
		  unit_ids = [61121], is_reset = 0, formation = {2, 1}};
get({1, 77}) ->
    #endless_data{type = 1, id = 77,
		  name = lang:get(<<"第77波"/utf8>>), lev = 210,
		  unit_ids = [61122], is_reset = 0, formation = {3, 1}};
get({1, 78}) ->
    #endless_data{type = 1, id = 78,
		  name = lang:get(<<"第78波"/utf8>>), lev = 210,
		  unit_ids = [61123], is_reset = 0, formation = {3, 1}};
get({1, 79}) ->
    #endless_data{type = 1, id = 79,
		  name = lang:get(<<"第79波"/utf8>>), lev = 211,
		  unit_ids = [61109], is_reset = 0, formation = {4, 1}};
get({1, 80}) ->
    #endless_data{type = 1, id = 80,
		  name = lang:get(<<"第80波"/utf8>>), lev = 211,
		  unit_ids = [61110], is_reset = 0, formation = {4, 1}};
get({1, 81}) ->
    #endless_data{type = 1, id = 81,
		  name = lang:get(<<"第81波"/utf8>>), lev = 211,
		  unit_ids = [61111], is_reset = 0, formation = {5, 1}};
get({1, 82}) ->
    #endless_data{type = 1, id = 82,
		  name = lang:get(<<"第82波"/utf8>>), lev = 212,
		  unit_ids = [61112], is_reset = 0, formation = {5, 1}};
get({1, 83}) ->
    #endless_data{type = 1, id = 83,
		  name = lang:get(<<"第83波"/utf8>>), lev = 212,
		  unit_ids = [61113], is_reset = 0, formation = {6, 1}};
get({1, 84}) ->
    #endless_data{type = 1, id = 84,
		  name = lang:get(<<"第84波"/utf8>>), lev = 212,
		  unit_ids = [61114], is_reset = 0, formation = {6, 1}};
get({1, 85}) ->
    #endless_data{type = 1, id = 85,
		  name = lang:get(<<"第85波"/utf8>>), lev = 213,
		  unit_ids = [61115], is_reset = 0, formation = {1, 1}};
get({1, 86}) ->
    #endless_data{type = 1, id = 86,
		  name = lang:get(<<"第86波"/utf8>>), lev = 213,
		  unit_ids = [61116], is_reset = 0, formation = {1, 1}};
get({1, 87}) ->
    #endless_data{type = 1, id = 87,
		  name = lang:get(<<"第87波"/utf8>>), lev = 213,
		  unit_ids = [61117], is_reset = 0, formation = {2, 1}};
get({1, 88}) ->
    #endless_data{type = 1, id = 88,
		  name = lang:get(<<"第88波"/utf8>>), lev = 214,
		  unit_ids = [61118], is_reset = 0, formation = {2, 1}};
get({1, 89}) ->
    #endless_data{type = 1, id = 89,
		  name = lang:get(<<"第89波"/utf8>>), lev = 214,
		  unit_ids = [61119], is_reset = 0, formation = {3, 1}};
get({1, 90}) ->
    #endless_data{type = 1, id = 90,
		  name = lang:get(<<"第90波"/utf8>>), lev = 214,
		  unit_ids = [61120], is_reset = 0, formation = {3, 1}};
get({1, 91}) ->
    #endless_data{type = 1, id = 91,
		  name = lang:get(<<"第91波"/utf8>>), lev = 215,
		  unit_ids = [61121], is_reset = 0, formation = {4, 1}};
get({1, 92}) ->
    #endless_data{type = 1, id = 92,
		  name = lang:get(<<"第92波"/utf8>>), lev = 215,
		  unit_ids = [61122], is_reset = 0, formation = {4, 1}};
get({1, 93}) ->
    #endless_data{type = 1, id = 93,
		  name = lang:get(<<"第93波"/utf8>>), lev = 215,
		  unit_ids = [61123], is_reset = 0, formation = {5, 1}};
get({1, 94}) ->
    #endless_data{type = 1, id = 94,
		  name = lang:get(<<"第94波"/utf8>>), lev = 216,
		  unit_ids = [61109], is_reset = 0, formation = {5, 1}};
get({1, 95}) ->
    #endless_data{type = 1, id = 95,
		  name = lang:get(<<"第95波"/utf8>>), lev = 216,
		  unit_ids = [61110], is_reset = 0, formation = {6, 1}};
get({1, 96}) ->
    #endless_data{type = 1, id = 96,
		  name = lang:get(<<"第96波"/utf8>>), lev = 216,
		  unit_ids = [61111], is_reset = 0, formation = {6, 1}};
get({1, 97}) ->
    #endless_data{type = 1, id = 97,
		  name = lang:get(<<"第97波"/utf8>>), lev = 217,
		  unit_ids = [61112], is_reset = 0, formation = {1, 1}};
get({1, 98}) ->
    #endless_data{type = 1, id = 98,
		  name = lang:get(<<"第98波"/utf8>>), lev = 217,
		  unit_ids = [61113], is_reset = 0, formation = {1, 1}};
get({1, 99}) ->
    #endless_data{type = 1, id = 99,
		  name = lang:get(<<"第99波"/utf8>>), lev = 217,
		  unit_ids = [61114], is_reset = 0, formation = {2, 1}};
get({1, 100}) ->
    #endless_data{type = 1, id = 100,
		  name = lang:get(<<"第100波"/utf8>>), lev = 218,
		  unit_ids = [61115], is_reset = 0, formation = {2, 1}};
get({1, 101}) ->
    #endless_data{type = 1, id = 101,
		  name = lang:get(<<"第101波"/utf8>>), lev = 218,
		  unit_ids = [61116], is_reset = 0, formation = {3, 1}};
get({1, 102}) ->
    #endless_data{type = 1, id = 102,
		  name = lang:get(<<"第102波"/utf8>>), lev = 218,
		  unit_ids = [61117], is_reset = 0, formation = {3, 1}};
get({1, 103}) ->
    #endless_data{type = 1, id = 103,
		  name = lang:get(<<"第103波"/utf8>>), lev = 219,
		  unit_ids = [61118], is_reset = 0, formation = {4, 1}};
get({1, 104}) ->
    #endless_data{type = 1, id = 104,
		  name = lang:get(<<"第104波"/utf8>>), lev = 219,
		  unit_ids = [61119], is_reset = 0, formation = {4, 1}};
get({1, 105}) ->
    #endless_data{type = 1, id = 105,
		  name = lang:get(<<"第105波"/utf8>>), lev = 219,
		  unit_ids = [61120], is_reset = 0, formation = {5, 1}};
get({1, 106}) ->
    #endless_data{type = 1, id = 106,
		  name = lang:get(<<"第106波"/utf8>>), lev = 220,
		  unit_ids = [61121], is_reset = 0, formation = {5, 1}};
get({1, 107}) ->
    #endless_data{type = 1, id = 107,
		  name = lang:get(<<"第107波"/utf8>>), lev = 220,
		  unit_ids = [61122], is_reset = 0, formation = {6, 1}};
get({1, 108}) ->
    #endless_data{type = 1, id = 108,
		  name = lang:get(<<"第108波"/utf8>>), lev = 220,
		  unit_ids = [61123], is_reset = 0, formation = {6, 1}};
get({1, 109}) ->
    #endless_data{type = 1, id = 109,
		  name = lang:get(<<"第109波"/utf8>>), lev = 221,
		  unit_ids = [61109], is_reset = 0, formation = {1, 1}};
get({1, 110}) ->
    #endless_data{type = 1, id = 110,
		  name = lang:get(<<"第110波"/utf8>>), lev = 221,
		  unit_ids = [61110], is_reset = 0, formation = {1, 1}};
get({1, 111}) ->
    #endless_data{type = 1, id = 111,
		  name = lang:get(<<"第111波"/utf8>>), lev = 221,
		  unit_ids = [61111], is_reset = 0, formation = {2, 1}};
get({1, 112}) ->
    #endless_data{type = 1, id = 112,
		  name = lang:get(<<"第112波"/utf8>>), lev = 222,
		  unit_ids = [61112], is_reset = 0, formation = {2, 1}};
get({1, 113}) ->
    #endless_data{type = 1, id = 113,
		  name = lang:get(<<"第113波"/utf8>>), lev = 222,
		  unit_ids = [61113], is_reset = 0, formation = {3, 1}};
get({1, 114}) ->
    #endless_data{type = 1, id = 114,
		  name = lang:get(<<"第114波"/utf8>>), lev = 222,
		  unit_ids = [61114], is_reset = 0, formation = {3, 1}};
get({1, 115}) ->
    #endless_data{type = 1, id = 115,
		  name = lang:get(<<"第115波"/utf8>>), lev = 223,
		  unit_ids = [61115], is_reset = 0, formation = {4, 1}};
get({1, 116}) ->
    #endless_data{type = 1, id = 116,
		  name = lang:get(<<"第116波"/utf8>>), lev = 223,
		  unit_ids = [61116], is_reset = 0, formation = {4, 1}};
get({1, 117}) ->
    #endless_data{type = 1, id = 117,
		  name = lang:get(<<"第117波"/utf8>>), lev = 223,
		  unit_ids = [61117], is_reset = 0, formation = {5, 1}};
get({1, 118}) ->
    #endless_data{type = 1, id = 118,
		  name = lang:get(<<"第118波"/utf8>>), lev = 224,
		  unit_ids = [61118], is_reset = 0, formation = {5, 1}};
get({1, 119}) ->
    #endless_data{type = 1, id = 119,
		  name = lang:get(<<"第119波"/utf8>>), lev = 224,
		  unit_ids = [61119], is_reset = 0, formation = {6, 1}};
get({1, 120}) ->
    #endless_data{type = 1, id = 120,
		  name = lang:get(<<"第120波"/utf8>>), lev = 224,
		  unit_ids = [61120], is_reset = 0, formation = {6, 1}};
get({1, 121}) ->
    #endless_data{type = 1, id = 121,
		  name = lang:get(<<"第121波"/utf8>>), lev = 225,
		  unit_ids = [61121], is_reset = 0, formation = {1, 1}};
get({1, 122}) ->
    #endless_data{type = 1, id = 122,
		  name = lang:get(<<"第122波"/utf8>>), lev = 225,
		  unit_ids = [61122], is_reset = 0, formation = {1, 1}};
get({1, 123}) ->
    #endless_data{type = 1, id = 123,
		  name = lang:get(<<"第123波"/utf8>>), lev = 225,
		  unit_ids = [61123], is_reset = 0, formation = {2, 1}};
get({1, 124}) ->
    #endless_data{type = 1, id = 124,
		  name = lang:get(<<"第124波"/utf8>>), lev = 226,
		  unit_ids = [61109], is_reset = 0, formation = {2, 1}};
get({1, 125}) ->
    #endless_data{type = 1, id = 125,
		  name = lang:get(<<"第125波"/utf8>>), lev = 226,
		  unit_ids = [61110], is_reset = 0, formation = {3, 1}};
get({1, 126}) ->
    #endless_data{type = 1, id = 126,
		  name = lang:get(<<"第126波"/utf8>>), lev = 226,
		  unit_ids = [61111], is_reset = 0, formation = {3, 1}};
get({1, 127}) ->
    #endless_data{type = 1, id = 127,
		  name = lang:get(<<"第127波"/utf8>>), lev = 227,
		  unit_ids = [61112], is_reset = 0, formation = {4, 1}};
get({1, 128}) ->
    #endless_data{type = 1, id = 128,
		  name = lang:get(<<"第128波"/utf8>>), lev = 227,
		  unit_ids = [61113], is_reset = 0, formation = {4, 1}};
get({1, 129}) ->
    #endless_data{type = 1, id = 129,
		  name = lang:get(<<"第129波"/utf8>>), lev = 227,
		  unit_ids = [61114], is_reset = 0, formation = {5, 1}};
get({1, 130}) ->
    #endless_data{type = 1, id = 130,
		  name = lang:get(<<"第130波"/utf8>>), lev = 228,
		  unit_ids = [61115], is_reset = 0, formation = {5, 1}};
get({1, 131}) ->
    #endless_data{type = 1, id = 131,
		  name = lang:get(<<"第131波"/utf8>>), lev = 228,
		  unit_ids = [61116], is_reset = 0, formation = {6, 1}};
get({1, 132}) ->
    #endless_data{type = 1, id = 132,
		  name = lang:get(<<"第132波"/utf8>>), lev = 228,
		  unit_ids = [61117], is_reset = 0, formation = {6, 1}};
get({1, 133}) ->
    #endless_data{type = 1, id = 133,
		  name = lang:get(<<"第133波"/utf8>>), lev = 229,
		  unit_ids = [61118], is_reset = 0, formation = {1, 1}};
get({1, 134}) ->
    #endless_data{type = 1, id = 134,
		  name = lang:get(<<"第134波"/utf8>>), lev = 229,
		  unit_ids = [61119], is_reset = 0, formation = {1, 1}};
get({1, 135}) ->
    #endless_data{type = 1, id = 135,
		  name = lang:get(<<"第135波"/utf8>>), lev = 229,
		  unit_ids = [61120], is_reset = 0, formation = {2, 1}};
get({1, 136}) ->
    #endless_data{type = 1, id = 136,
		  name = lang:get(<<"第136波"/utf8>>), lev = 230,
		  unit_ids = [61121], is_reset = 0, formation = {2, 1}};
get({1, 137}) ->
    #endless_data{type = 1, id = 137,
		  name = lang:get(<<"第137波"/utf8>>), lev = 230,
		  unit_ids = [61122], is_reset = 0, formation = {3, 1}};
get({1, 138}) ->
    #endless_data{type = 1, id = 138,
		  name = lang:get(<<"第138波"/utf8>>), lev = 230,
		  unit_ids = [61123], is_reset = 0, formation = {3, 1}};
get({1, 139}) ->
    #endless_data{type = 1, id = 139,
		  name = lang:get(<<"第139波"/utf8>>), lev = 231,
		  unit_ids = [61109], is_reset = 0, formation = {4, 1}};
get({1, 140}) ->
    #endless_data{type = 1, id = 140,
		  name = lang:get(<<"第140波"/utf8>>), lev = 231,
		  unit_ids = [61110], is_reset = 0, formation = {4, 1}};
get({1, 141}) ->
    #endless_data{type = 1, id = 141,
		  name = lang:get(<<"第141波"/utf8>>), lev = 231,
		  unit_ids = [61111], is_reset = 0, formation = {5, 1}};
get({1, 142}) ->
    #endless_data{type = 1, id = 142,
		  name = lang:get(<<"第142波"/utf8>>), lev = 232,
		  unit_ids = [61112], is_reset = 0, formation = {5, 1}};
get({1, 143}) ->
    #endless_data{type = 1, id = 143,
		  name = lang:get(<<"第143波"/utf8>>), lev = 232,
		  unit_ids = [61113], is_reset = 0, formation = {6, 1}};
get({1, 144}) ->
    #endless_data{type = 1, id = 144,
		  name = lang:get(<<"第144波"/utf8>>), lev = 232,
		  unit_ids = [61114], is_reset = 0, formation = {6, 1}};
get({1, 145}) ->
    #endless_data{type = 1, id = 145,
		  name = lang:get(<<"第145波"/utf8>>), lev = 233,
		  unit_ids = [61115], is_reset = 0, formation = {1, 1}};
get({1, 146}) ->
    #endless_data{type = 1, id = 146,
		  name = lang:get(<<"第146波"/utf8>>), lev = 233,
		  unit_ids = [61116], is_reset = 0, formation = {1, 1}};
get({1, 147}) ->
    #endless_data{type = 1, id = 147,
		  name = lang:get(<<"第147波"/utf8>>), lev = 233,
		  unit_ids = [61117], is_reset = 0, formation = {2, 1}};
get({1, 148}) ->
    #endless_data{type = 1, id = 148,
		  name = lang:get(<<"第148波"/utf8>>), lev = 234,
		  unit_ids = [61118], is_reset = 0, formation = {2, 1}};
get({1, 149}) ->
    #endless_data{type = 1, id = 149,
		  name = lang:get(<<"第149波"/utf8>>), lev = 234,
		  unit_ids = [61119], is_reset = 0, formation = {3, 1}};
get({1, 150}) ->
    #endless_data{type = 1, id = 150,
		  name = lang:get(<<"第150波"/utf8>>), lev = 234,
		  unit_ids = [61120], is_reset = 0, formation = {3, 1}};
get({1, 151}) ->
    #endless_data{type = 1, id = 151,
		  name = lang:get(<<"第151波"/utf8>>), lev = 240,
		  unit_ids = [61109], is_reset = 0, formation = {1, 1}};
get({1, 152}) ->
    #endless_data{type = 1, id = 152,
		  name = lang:get(<<"第152波"/utf8>>), lev = 240,
		  unit_ids = [61110], is_reset = 0, formation = {1, 1}};
get({1, 153}) ->
    #endless_data{type = 1, id = 153,
		  name = lang:get(<<"第153波"/utf8>>), lev = 241,
		  unit_ids = [61111], is_reset = 0, formation = {2, 1}};
get({1, 154}) ->
    #endless_data{type = 1, id = 154,
		  name = lang:get(<<"第154波"/utf8>>), lev = 242,
		  unit_ids = [61112], is_reset = 0, formation = {2, 1}};
get({1, 155}) ->
    #endless_data{type = 1, id = 155,
		  name = lang:get(<<"第155波"/utf8>>), lev = 242,
		  unit_ids = [61113], is_reset = 0, formation = {3, 1}};
get({1, 156}) ->
    #endless_data{type = 1, id = 156,
		  name = lang:get(<<"第156波"/utf8>>), lev = 243,
		  unit_ids = [61114], is_reset = 0, formation = {3, 1}};
get({1, 157}) ->
    #endless_data{type = 1, id = 157,
		  name = lang:get(<<"第157波"/utf8>>), lev = 244,
		  unit_ids = [61115], is_reset = 0, formation = {4, 1}};
get({1, 158}) ->
    #endless_data{type = 1, id = 158,
		  name = lang:get(<<"第158波"/utf8>>), lev = 244,
		  unit_ids = [61116], is_reset = 0, formation = {4, 1}};
get({1, 159}) ->
    #endless_data{type = 1, id = 159,
		  name = lang:get(<<"第159波"/utf8>>), lev = 245,
		  unit_ids = [61117], is_reset = 0, formation = {5, 1}};
get({1, 160}) ->
    #endless_data{type = 1, id = 160,
		  name = lang:get(<<"第160波"/utf8>>), lev = 246,
		  unit_ids = [61118], is_reset = 0, formation = {5, 1}};
get({1, 161}) ->
    #endless_data{type = 1, id = 161,
		  name = lang:get(<<"第161波"/utf8>>), lev = 246,
		  unit_ids = [61119], is_reset = 0, formation = {6, 1}};
get({1, 162}) ->
    #endless_data{type = 1, id = 162,
		  name = lang:get(<<"第162波"/utf8>>), lev = 247,
		  unit_ids = [61120], is_reset = 0, formation = {6, 1}};
get({1, 163}) ->
    #endless_data{type = 1, id = 163,
		  name = lang:get(<<"第163波"/utf8>>), lev = 248,
		  unit_ids = [61121], is_reset = 0, formation = {1, 1}};
get({1, 164}) ->
    #endless_data{type = 1, id = 164,
		  name = lang:get(<<"第164波"/utf8>>), lev = 248,
		  unit_ids = [61122], is_reset = 0, formation = {1, 1}};
get({1, 165}) ->
    #endless_data{type = 1, id = 165,
		  name = lang:get(<<"第165波"/utf8>>), lev = 249,
		  unit_ids = [61123], is_reset = 0, formation = {2, 1}};
get({1, 166}) ->
    #endless_data{type = 1, id = 166,
		  name = lang:get(<<"第166波"/utf8>>), lev = 250,
		  unit_ids = [61109], is_reset = 0, formation = {2, 1}};
get({1, 167}) ->
    #endless_data{type = 1, id = 167,
		  name = lang:get(<<"第167波"/utf8>>), lev = 250,
		  unit_ids = [61110], is_reset = 0, formation = {3, 1}};
get({1, 168}) ->
    #endless_data{type = 1, id = 168,
		  name = lang:get(<<"第168波"/utf8>>), lev = 251,
		  unit_ids = [61111], is_reset = 0, formation = {3, 1}};
get({1, 169}) ->
    #endless_data{type = 1, id = 169,
		  name = lang:get(<<"第169波"/utf8>>), lev = 252,
		  unit_ids = [61112], is_reset = 0, formation = {4, 1}};
get({1, 170}) ->
    #endless_data{type = 1, id = 170,
		  name = lang:get(<<"第170波"/utf8>>), lev = 252,
		  unit_ids = [61113], is_reset = 0, formation = {4, 1}};
get({1, 171}) ->
    #endless_data{type = 1, id = 171,
		  name = lang:get(<<"第171波"/utf8>>), lev = 253,
		  unit_ids = [61114], is_reset = 0, formation = {5, 1}};
get({1, 172}) ->
    #endless_data{type = 1, id = 172,
		  name = lang:get(<<"第172波"/utf8>>), lev = 254,
		  unit_ids = [61115], is_reset = 0, formation = {5, 1}};
get({1, 173}) ->
    #endless_data{type = 1, id = 173,
		  name = lang:get(<<"第173波"/utf8>>), lev = 254,
		  unit_ids = [61116], is_reset = 0, formation = {6, 1}};
get({1, 174}) ->
    #endless_data{type = 1, id = 174,
		  name = lang:get(<<"第174波"/utf8>>), lev = 255,
		  unit_ids = [61117], is_reset = 0, formation = {6, 1}};
get({1, 175}) ->
    #endless_data{type = 1, id = 175,
		  name = lang:get(<<"第175波"/utf8>>), lev = 256,
		  unit_ids = [61118], is_reset = 0, formation = {1, 1}};
get({1, 176}) ->
    #endless_data{type = 1, id = 176,
		  name = lang:get(<<"第176波"/utf8>>), lev = 256,
		  unit_ids = [61119], is_reset = 0, formation = {1, 1}};
get({1, 177}) ->
    #endless_data{type = 1, id = 177,
		  name = lang:get(<<"第177波"/utf8>>), lev = 257,
		  unit_ids = [61120], is_reset = 0, formation = {2, 1}};
get({1, 178}) ->
    #endless_data{type = 1, id = 178,
		  name = lang:get(<<"第178波"/utf8>>), lev = 258,
		  unit_ids = [61121], is_reset = 0, formation = {2, 1}};
get({1, 179}) ->
    #endless_data{type = 1, id = 179,
		  name = lang:get(<<"第179波"/utf8>>), lev = 258,
		  unit_ids = [61122], is_reset = 0, formation = {3, 1}};
get({1, 180}) ->
    #endless_data{type = 1, id = 180,
		  name = lang:get(<<"第180波"/utf8>>), lev = 259,
		  unit_ids = [61123], is_reset = 0, formation = {3, 1}};
get({1, 181}) ->
    #endless_data{type = 1, id = 181,
		  name = lang:get(<<"第181波"/utf8>>), lev = 260,
		  unit_ids = [61109], is_reset = 0, formation = {4, 1}};
get({1, 182}) ->
    #endless_data{type = 1, id = 182,
		  name = lang:get(<<"第182波"/utf8>>), lev = 260,
		  unit_ids = [61110], is_reset = 0, formation = {4, 1}};
get({1, 183}) ->
    #endless_data{type = 1, id = 183,
		  name = lang:get(<<"第183波"/utf8>>), lev = 261,
		  unit_ids = [61111], is_reset = 0, formation = {5, 1}};
get({1, 184}) ->
    #endless_data{type = 1, id = 184,
		  name = lang:get(<<"第184波"/utf8>>), lev = 262,
		  unit_ids = [61112], is_reset = 0, formation = {5, 1}};
get({1, 185}) ->
    #endless_data{type = 1, id = 185,
		  name = lang:get(<<"第185波"/utf8>>), lev = 262,
		  unit_ids = [61113], is_reset = 0, formation = {6, 1}};
get({1, 186}) ->
    #endless_data{type = 1, id = 186,
		  name = lang:get(<<"第186波"/utf8>>), lev = 263,
		  unit_ids = [61114], is_reset = 0, formation = {6, 1}};
get({1, 187}) ->
    #endless_data{type = 1, id = 187,
		  name = lang:get(<<"第187波"/utf8>>), lev = 264,
		  unit_ids = [61115], is_reset = 0, formation = {1, 1}};
get({1, 188}) ->
    #endless_data{type = 1, id = 188,
		  name = lang:get(<<"第188波"/utf8>>), lev = 264,
		  unit_ids = [61116], is_reset = 0, formation = {1, 1}};
get({1, 189}) ->
    #endless_data{type = 1, id = 189,
		  name = lang:get(<<"第189波"/utf8>>), lev = 265,
		  unit_ids = [61117], is_reset = 0, formation = {2, 1}};
get({1, 190}) ->
    #endless_data{type = 1, id = 190,
		  name = lang:get(<<"第190波"/utf8>>), lev = 266,
		  unit_ids = [61118], is_reset = 0, formation = {2, 1}};
get({1, 191}) ->
    #endless_data{type = 1, id = 191,
		  name = lang:get(<<"第191波"/utf8>>), lev = 266,
		  unit_ids = [61119], is_reset = 0, formation = {3, 1}};
get({1, 192}) ->
    #endless_data{type = 1, id = 192,
		  name = lang:get(<<"第192波"/utf8>>), lev = 267,
		  unit_ids = [61120], is_reset = 0, formation = {3, 1}};
get({1, 193}) ->
    #endless_data{type = 1, id = 193,
		  name = lang:get(<<"第193波"/utf8>>), lev = 268,
		  unit_ids = [61121], is_reset = 0, formation = {4, 1}};
get({1, 194}) ->
    #endless_data{type = 1, id = 194,
		  name = lang:get(<<"第194波"/utf8>>), lev = 268,
		  unit_ids = [61122], is_reset = 0, formation = {4, 1}};
get({1, 195}) ->
    #endless_data{type = 1, id = 195,
		  name = lang:get(<<"第195波"/utf8>>), lev = 269,
		  unit_ids = [61123], is_reset = 0, formation = {5, 1}};
get({1, 196}) ->
    #endless_data{type = 1, id = 196,
		  name = lang:get(<<"第196波"/utf8>>), lev = 270,
		  unit_ids = [61109], is_reset = 0, formation = {5, 1}};
get({1, 197}) ->
    #endless_data{type = 1, id = 197,
		  name = lang:get(<<"第197波"/utf8>>), lev = 270,
		  unit_ids = [61110], is_reset = 0, formation = {6, 1}};
get({1, 198}) ->
    #endless_data{type = 1, id = 198,
		  name = lang:get(<<"第198波"/utf8>>), lev = 271,
		  unit_ids = [61111], is_reset = 0, formation = {6, 1}};
get({1, 199}) ->
    #endless_data{type = 1, id = 199,
		  name = lang:get(<<"第199波"/utf8>>), lev = 272,
		  unit_ids = [61112], is_reset = 0, formation = {1, 1}};
get({1, 200}) ->
    #endless_data{type = 1, id = 200,
		  name = lang:get(<<"第200波"/utf8>>), lev = 272,
		  unit_ids = [61113], is_reset = 0, formation = {1, 1}};
get({1, 201}) ->
    #endless_data{type = 1, id = 201,
		  name = lang:get(<<"第201波"/utf8>>), lev = 273,
		  unit_ids = [61114], is_reset = 0, formation = {2, 1}};
get({1, 202}) ->
    #endless_data{type = 1, id = 202,
		  name = lang:get(<<"第202波"/utf8>>), lev = 274,
		  unit_ids = [61115], is_reset = 0, formation = {2, 1}};
get({1, 203}) ->
    #endless_data{type = 1, id = 203,
		  name = lang:get(<<"第203波"/utf8>>), lev = 274,
		  unit_ids = [61116], is_reset = 0, formation = {3, 1}};
get({1, 204}) ->
    #endless_data{type = 1, id = 204,
		  name = lang:get(<<"第204波"/utf8>>), lev = 275,
		  unit_ids = [61117], is_reset = 0, formation = {3, 1}};
get({1, 205}) ->
    #endless_data{type = 1, id = 205,
		  name = lang:get(<<"第205波"/utf8>>), lev = 276,
		  unit_ids = [61118], is_reset = 0, formation = {4, 1}};
get({1, 206}) ->
    #endless_data{type = 1, id = 206,
		  name = lang:get(<<"第206波"/utf8>>), lev = 276,
		  unit_ids = [61119], is_reset = 0, formation = {4, 1}};
get({1, 207}) ->
    #endless_data{type = 1, id = 207,
		  name = lang:get(<<"第207波"/utf8>>), lev = 277,
		  unit_ids = [61120], is_reset = 0, formation = {5, 1}};
get({1, 208}) ->
    #endless_data{type = 1, id = 208,
		  name = lang:get(<<"第208波"/utf8>>), lev = 278,
		  unit_ids = [61121], is_reset = 0, formation = {5, 1}};
get({1, 209}) ->
    #endless_data{type = 1, id = 209,
		  name = lang:get(<<"第209波"/utf8>>), lev = 278,
		  unit_ids = [61122], is_reset = 0, formation = {6, 1}};
get({1, 210}) ->
    #endless_data{type = 1, id = 210,
		  name = lang:get(<<"第210波"/utf8>>), lev = 279,
		  unit_ids = [61123], is_reset = 0, formation = {6, 1}};
get({1, 211}) ->
    #endless_data{type = 1, id = 211,
		  name = lang:get(<<"第211波"/utf8>>), lev = 280,
		  unit_ids = [61109], is_reset = 0, formation = {1, 1}};
get({1, 212}) ->
    #endless_data{type = 1, id = 212,
		  name = lang:get(<<"第212波"/utf8>>), lev = 280,
		  unit_ids = [61110], is_reset = 0, formation = {1, 1}};
get({1, 213}) ->
    #endless_data{type = 1, id = 213,
		  name = lang:get(<<"第213波"/utf8>>), lev = 281,
		  unit_ids = [61111], is_reset = 0, formation = {2, 1}};
get({1, 214}) ->
    #endless_data{type = 1, id = 214,
		  name = lang:get(<<"第214波"/utf8>>), lev = 282,
		  unit_ids = [61112], is_reset = 0, formation = {2, 1}};
get({1, 215}) ->
    #endless_data{type = 1, id = 215,
		  name = lang:get(<<"第215波"/utf8>>), lev = 282,
		  unit_ids = [61113], is_reset = 0, formation = {3, 1}};
get({1, 216}) ->
    #endless_data{type = 1, id = 216,
		  name = lang:get(<<"第216波"/utf8>>), lev = 283,
		  unit_ids = [61114], is_reset = 0, formation = {3, 1}};
get({1, 217}) ->
    #endless_data{type = 1, id = 217,
		  name = lang:get(<<"第217波"/utf8>>), lev = 284,
		  unit_ids = [61115], is_reset = 0, formation = {4, 1}};
get({1, 218}) ->
    #endless_data{type = 1, id = 218,
		  name = lang:get(<<"第218波"/utf8>>), lev = 284,
		  unit_ids = [61116], is_reset = 0, formation = {4, 1}};
get({1, 219}) ->
    #endless_data{type = 1, id = 219,
		  name = lang:get(<<"第219波"/utf8>>), lev = 285,
		  unit_ids = [61117], is_reset = 0, formation = {5, 1}};
get({1, 220}) ->
    #endless_data{type = 1, id = 220,
		  name = lang:get(<<"第220波"/utf8>>), lev = 286,
		  unit_ids = [61118], is_reset = 0, formation = {5, 1}};
get({1, 221}) ->
    #endless_data{type = 1, id = 221,
		  name = lang:get(<<"第221波"/utf8>>), lev = 286,
		  unit_ids = [61119], is_reset = 0, formation = {6, 1}};
get({1, 222}) ->
    #endless_data{type = 1, id = 222,
		  name = lang:get(<<"第222波"/utf8>>), lev = 287,
		  unit_ids = [61120], is_reset = 0, formation = {6, 1}};
get({1, 223}) ->
    #endless_data{type = 1, id = 223,
		  name = lang:get(<<"第223波"/utf8>>), lev = 288,
		  unit_ids = [61121], is_reset = 0, formation = {1, 1}};
get({1, 224}) ->
    #endless_data{type = 1, id = 224,
		  name = lang:get(<<"第224波"/utf8>>), lev = 288,
		  unit_ids = [61122], is_reset = 0, formation = {1, 1}};
get({1, 225}) ->
    #endless_data{type = 1, id = 225,
		  name = lang:get(<<"第225波"/utf8>>), lev = 289,
		  unit_ids = [61123], is_reset = 0, formation = {2, 1}};
get({1, 226}) ->
    #endless_data{type = 1, id = 226,
		  name = lang:get(<<"第226波"/utf8>>), lev = 290,
		  unit_ids = [61109], is_reset = 0, formation = {2, 1}};
get({1, 227}) ->
    #endless_data{type = 1, id = 227,
		  name = lang:get(<<"第227波"/utf8>>), lev = 290,
		  unit_ids = [61110], is_reset = 0, formation = {3, 1}};
get({1, 228}) ->
    #endless_data{type = 1, id = 228,
		  name = lang:get(<<"第228波"/utf8>>), lev = 291,
		  unit_ids = [61111], is_reset = 0, formation = {3, 1}};
get({1, 229}) ->
    #endless_data{type = 1, id = 229,
		  name = lang:get(<<"第229波"/utf8>>), lev = 292,
		  unit_ids = [61112], is_reset = 0, formation = {4, 1}};
get({1, 230}) ->
    #endless_data{type = 1, id = 230,
		  name = lang:get(<<"第230波"/utf8>>), lev = 292,
		  unit_ids = [61113], is_reset = 0, formation = {4, 1}};
get({1, 231}) ->
    #endless_data{type = 1, id = 231,
		  name = lang:get(<<"第231波"/utf8>>), lev = 293,
		  unit_ids = [61114], is_reset = 0, formation = {5, 1}};
get({1, 232}) ->
    #endless_data{type = 1, id = 232,
		  name = lang:get(<<"第232波"/utf8>>), lev = 294,
		  unit_ids = [61115], is_reset = 0, formation = {5, 1}};
get({1, 233}) ->
    #endless_data{type = 1, id = 233,
		  name = lang:get(<<"第233波"/utf8>>), lev = 294,
		  unit_ids = [61116], is_reset = 0, formation = {6, 1}};
get({1, 234}) ->
    #endless_data{type = 1, id = 234,
		  name = lang:get(<<"第234波"/utf8>>), lev = 295,
		  unit_ids = [61117], is_reset = 0, formation = {6, 1}};
get({1, 235}) ->
    #endless_data{type = 1, id = 235,
		  name = lang:get(<<"第235波"/utf8>>), lev = 296,
		  unit_ids = [61118], is_reset = 0, formation = {1, 1}};
get({1, 236}) ->
    #endless_data{type = 1, id = 236,
		  name = lang:get(<<"第236波"/utf8>>), lev = 296,
		  unit_ids = [61119], is_reset = 0, formation = {1, 1}};
get({1, 237}) ->
    #endless_data{type = 1, id = 237,
		  name = lang:get(<<"第237波"/utf8>>), lev = 297,
		  unit_ids = [61120], is_reset = 0, formation = {2, 1}};
get({1, 238}) ->
    #endless_data{type = 1, id = 238,
		  name = lang:get(<<"第238波"/utf8>>), lev = 298,
		  unit_ids = [61121], is_reset = 0, formation = {2, 1}};
get({1, 239}) ->
    #endless_data{type = 1, id = 239,
		  name = lang:get(<<"第239波"/utf8>>), lev = 298,
		  unit_ids = [61122], is_reset = 0, formation = {3, 1}};
get({1, 240}) ->
    #endless_data{type = 1, id = 240,
		  name = lang:get(<<"第240波"/utf8>>), lev = 299,
		  unit_ids = [61123], is_reset = 0, formation = {3, 1}};
get({1, 241}) ->
    #endless_data{type = 1, id = 241,
		  name = lang:get(<<"第241波"/utf8>>), lev = 300,
		  unit_ids = [61109], is_reset = 0, formation = {4, 1}};
get({1, 242}) ->
    #endless_data{type = 1, id = 242,
		  name = lang:get(<<"第242波"/utf8>>), lev = 300,
		  unit_ids = [61110], is_reset = 0, formation = {4, 1}};
get({1, 243}) ->
    #endless_data{type = 1, id = 243,
		  name = lang:get(<<"第243波"/utf8>>), lev = 301,
		  unit_ids = [61111], is_reset = 0, formation = {5, 1}};
get({1, 244}) ->
    #endless_data{type = 1, id = 244,
		  name = lang:get(<<"第244波"/utf8>>), lev = 302,
		  unit_ids = [61112], is_reset = 0, formation = {5, 1}};
get({1, 245}) ->
    #endless_data{type = 1, id = 245,
		  name = lang:get(<<"第245波"/utf8>>), lev = 302,
		  unit_ids = [61113], is_reset = 0, formation = {6, 1}};
get({1, 246}) ->
    #endless_data{type = 1, id = 246,
		  name = lang:get(<<"第246波"/utf8>>), lev = 303,
		  unit_ids = [61114], is_reset = 0, formation = {6, 1}};
get({1, 247}) ->
    #endless_data{type = 1, id = 247,
		  name = lang:get(<<"第247波"/utf8>>), lev = 304,
		  unit_ids = [61115], is_reset = 0, formation = {1, 1}};
get({1, 248}) ->
    #endless_data{type = 1, id = 248,
		  name = lang:get(<<"第248波"/utf8>>), lev = 304,
		  unit_ids = [61116], is_reset = 0, formation = {1, 1}};
get({1, 249}) ->
    #endless_data{type = 1, id = 249,
		  name = lang:get(<<"第249波"/utf8>>), lev = 305,
		  unit_ids = [61117], is_reset = 0, formation = {2, 1}};
get({1, 250}) ->
    #endless_data{type = 1, id = 250,
		  name = lang:get(<<"第250波"/utf8>>), lev = 306,
		  unit_ids = [61118], is_reset = 0, formation = {2, 1}};
get({1, 251}) ->
    #endless_data{type = 1, id = 251,
		  name = lang:get(<<"第251波"/utf8>>), lev = 306,
		  unit_ids = [61119], is_reset = 0, formation = {3, 1}};
get({1, 252}) ->
    #endless_data{type = 1, id = 252,
		  name = lang:get(<<"第252波"/utf8>>), lev = 307,
		  unit_ids = [61120], is_reset = 0, formation = {3, 1}};
get({1, 253}) ->
    #endless_data{type = 1, id = 253,
		  name = lang:get(<<"第253波"/utf8>>), lev = 308,
		  unit_ids = [61121], is_reset = 0, formation = {4, 1}};
get({1, 254}) ->
    #endless_data{type = 1, id = 254,
		  name = lang:get(<<"第254波"/utf8>>), lev = 308,
		  unit_ids = [61122], is_reset = 0, formation = {4, 1}};
get({1, 255}) ->
    #endless_data{type = 1, id = 255,
		  name = lang:get(<<"第255波"/utf8>>), lev = 309,
		  unit_ids = [61123], is_reset = 0, formation = {5, 1}};
get({1, 256}) ->
    #endless_data{type = 1, id = 256,
		  name = lang:get(<<"第256波"/utf8>>), lev = 310,
		  unit_ids = [61109], is_reset = 0, formation = {5, 1}};
get({1, 257}) ->
    #endless_data{type = 1, id = 257,
		  name = lang:get(<<"第257波"/utf8>>), lev = 310,
		  unit_ids = [61110], is_reset = 0, formation = {6, 1}};
get({1, 258}) ->
    #endless_data{type = 1, id = 258,
		  name = lang:get(<<"第258波"/utf8>>), lev = 311,
		  unit_ids = [61111], is_reset = 0, formation = {6, 1}};
get({1, 259}) ->
    #endless_data{type = 1, id = 259,
		  name = lang:get(<<"第259波"/utf8>>), lev = 312,
		  unit_ids = [61112], is_reset = 0, formation = {1, 1}};
get({1, 260}) ->
    #endless_data{type = 1, id = 260,
		  name = lang:get(<<"第260波"/utf8>>), lev = 312,
		  unit_ids = [61113], is_reset = 0, formation = {1, 1}};
get({1, 261}) ->
    #endless_data{type = 1, id = 261,
		  name = lang:get(<<"第261波"/utf8>>), lev = 313,
		  unit_ids = [61114], is_reset = 0, formation = {2, 1}};
get({1, 262}) ->
    #endless_data{type = 1, id = 262,
		  name = lang:get(<<"第262波"/utf8>>), lev = 314,
		  unit_ids = [61115], is_reset = 0, formation = {2, 1}};
get({1, 263}) ->
    #endless_data{type = 1, id = 263,
		  name = lang:get(<<"第263波"/utf8>>), lev = 314,
		  unit_ids = [61116], is_reset = 0, formation = {3, 1}};
get({1, 264}) ->
    #endless_data{type = 1, id = 264,
		  name = lang:get(<<"第264波"/utf8>>), lev = 315,
		  unit_ids = [61117], is_reset = 0, formation = {3, 1}};
get({1, 265}) ->
    #endless_data{type = 1, id = 265,
		  name = lang:get(<<"第265波"/utf8>>), lev = 316,
		  unit_ids = [61118], is_reset = 0, formation = {4, 1}};
get({1, 266}) ->
    #endless_data{type = 1, id = 266,
		  name = lang:get(<<"第266波"/utf8>>), lev = 316,
		  unit_ids = [61119], is_reset = 0, formation = {4, 1}};
get({1, 267}) ->
    #endless_data{type = 1, id = 267,
		  name = lang:get(<<"第267波"/utf8>>), lev = 317,
		  unit_ids = [61120], is_reset = 0, formation = {5, 1}};
get({1, 268}) ->
    #endless_data{type = 1, id = 268,
		  name = lang:get(<<"第268波"/utf8>>), lev = 318,
		  unit_ids = [61121], is_reset = 0, formation = {5, 1}};
get({1, 269}) ->
    #endless_data{type = 1, id = 269,
		  name = lang:get(<<"第269波"/utf8>>), lev = 318,
		  unit_ids = [61122], is_reset = 0, formation = {6, 1}};
get({1, 270}) ->
    #endless_data{type = 1, id = 270,
		  name = lang:get(<<"第270波"/utf8>>), lev = 319,
		  unit_ids = [61123], is_reset = 0, formation = {6, 1}};
get({1, 271}) ->
    #endless_data{type = 1, id = 271,
		  name = lang:get(<<"第271波"/utf8>>), lev = 320,
		  unit_ids = [61109], is_reset = 0, formation = {1, 1}};
get({1, 272}) ->
    #endless_data{type = 1, id = 272,
		  name = lang:get(<<"第272波"/utf8>>), lev = 320,
		  unit_ids = [61110], is_reset = 0, formation = {1, 1}};
get({1, 273}) ->
    #endless_data{type = 1, id = 273,
		  name = lang:get(<<"第273波"/utf8>>), lev = 321,
		  unit_ids = [61111], is_reset = 0, formation = {2, 1}};
get({1, 274}) ->
    #endless_data{type = 1, id = 274,
		  name = lang:get(<<"第274波"/utf8>>), lev = 322,
		  unit_ids = [61112], is_reset = 0, formation = {2, 1}};
get({1, 275}) ->
    #endless_data{type = 1, id = 275,
		  name = lang:get(<<"第275波"/utf8>>), lev = 322,
		  unit_ids = [61113], is_reset = 0, formation = {3, 1}};
get({1, 276}) ->
    #endless_data{type = 1, id = 276,
		  name = lang:get(<<"第276波"/utf8>>), lev = 323,
		  unit_ids = [61114], is_reset = 0, formation = {3, 1}};
get({1, 277}) ->
    #endless_data{type = 1, id = 277,
		  name = lang:get(<<"第277波"/utf8>>), lev = 324,
		  unit_ids = [61115], is_reset = 0, formation = {4, 1}};
get({1, 278}) ->
    #endless_data{type = 1, id = 278,
		  name = lang:get(<<"第278波"/utf8>>), lev = 324,
		  unit_ids = [61116], is_reset = 0, formation = {4, 1}};
get({1, 279}) ->
    #endless_data{type = 1, id = 279,
		  name = lang:get(<<"第279波"/utf8>>), lev = 325,
		  unit_ids = [61117], is_reset = 0, formation = {5, 1}};
get({1, 280}) ->
    #endless_data{type = 1, id = 280,
		  name = lang:get(<<"第280波"/utf8>>), lev = 326,
		  unit_ids = [61118], is_reset = 0, formation = {5, 1}};
get({1, 281}) ->
    #endless_data{type = 1, id = 281,
		  name = lang:get(<<"第281波"/utf8>>), lev = 326,
		  unit_ids = [61119], is_reset = 0, formation = {6, 1}};
get({1, 282}) ->
    #endless_data{type = 1, id = 282,
		  name = lang:get(<<"第282波"/utf8>>), lev = 327,
		  unit_ids = [61120], is_reset = 0, formation = {6, 1}};
get({1, 283}) ->
    #endless_data{type = 1, id = 283,
		  name = lang:get(<<"第283波"/utf8>>), lev = 328,
		  unit_ids = [61121], is_reset = 0, formation = {1, 1}};
get({1, 284}) ->
    #endless_data{type = 1, id = 284,
		  name = lang:get(<<"第284波"/utf8>>), lev = 328,
		  unit_ids = [61122], is_reset = 0, formation = {1, 1}};
get({1, 285}) ->
    #endless_data{type = 1, id = 285,
		  name = lang:get(<<"第285波"/utf8>>), lev = 329,
		  unit_ids = [61123], is_reset = 0, formation = {2, 1}};
get({1, 286}) ->
    #endless_data{type = 1, id = 286,
		  name = lang:get(<<"第286波"/utf8>>), lev = 330,
		  unit_ids = [61109], is_reset = 0, formation = {2, 1}};
get({1, 287}) ->
    #endless_data{type = 1, id = 287,
		  name = lang:get(<<"第287波"/utf8>>), lev = 330,
		  unit_ids = [61110], is_reset = 0, formation = {3, 1}};
get({1, 288}) ->
    #endless_data{type = 1, id = 288,
		  name = lang:get(<<"第288波"/utf8>>), lev = 331,
		  unit_ids = [61111], is_reset = 0, formation = {3, 1}};
get({1, 289}) ->
    #endless_data{type = 1, id = 289,
		  name = lang:get(<<"第289波"/utf8>>), lev = 332,
		  unit_ids = [61112], is_reset = 0, formation = {4, 1}};
get({1, 290}) ->
    #endless_data{type = 1, id = 290,
		  name = lang:get(<<"第290波"/utf8>>), lev = 332,
		  unit_ids = [61113], is_reset = 0, formation = {4, 1}};
get({1, 291}) ->
    #endless_data{type = 1, id = 291,
		  name = lang:get(<<"第291波"/utf8>>), lev = 333,
		  unit_ids = [61114], is_reset = 0, formation = {5, 1}};
get({1, 292}) ->
    #endless_data{type = 1, id = 292,
		  name = lang:get(<<"第292波"/utf8>>), lev = 334,
		  unit_ids = [61115], is_reset = 0, formation = {5, 1}};
get({1, 293}) ->
    #endless_data{type = 1, id = 293,
		  name = lang:get(<<"第293波"/utf8>>), lev = 334,
		  unit_ids = [61116], is_reset = 0, formation = {6, 1}};
get({1, 294}) ->
    #endless_data{type = 1, id = 294,
		  name = lang:get(<<"第294波"/utf8>>), lev = 335,
		  unit_ids = [61117], is_reset = 0, formation = {6, 1}};
get({1, 295}) ->
    #endless_data{type = 1, id = 295,
		  name = lang:get(<<"第295波"/utf8>>), lev = 336,
		  unit_ids = [61118], is_reset = 0, formation = {1, 1}};
get({1, 296}) ->
    #endless_data{type = 1, id = 296,
		  name = lang:get(<<"第296波"/utf8>>), lev = 336,
		  unit_ids = [61119], is_reset = 0, formation = {1, 1}};
get({1, 297}) ->
    #endless_data{type = 1, id = 297,
		  name = lang:get(<<"第297波"/utf8>>), lev = 337,
		  unit_ids = [61120], is_reset = 0, formation = {2, 1}};
get({1, 298}) ->
    #endless_data{type = 1, id = 298,
		  name = lang:get(<<"第298波"/utf8>>), lev = 338,
		  unit_ids = [61121], is_reset = 0, formation = {2, 1}};
get({1, 299}) ->
    #endless_data{type = 1, id = 299,
		  name = lang:get(<<"第299波"/utf8>>), lev = 338,
		  unit_ids = [61122], is_reset = 0, formation = {3, 1}};
get({1, 300}) ->
    #endless_data{type = 1, id = 300,
		  name = lang:get(<<"第300波"/utf8>>), lev = 339,
		  unit_ids = [61123], is_reset = 0, formation = {3, 1}};
get({1, 301}) ->
    #endless_data{type = 1, id = 301,
		  name = lang:get(<<"第301波"/utf8>>), lev = 340,
		  unit_ids = [61109], is_reset = 0, formation = {4, 1}};
get({1, 302}) ->
    #endless_data{type = 1, id = 302,
		  name = lang:get(<<"第302波"/utf8>>), lev = 340,
		  unit_ids = [61110], is_reset = 0, formation = {4, 1}};
get({1, 303}) ->
    #endless_data{type = 1, id = 303,
		  name = lang:get(<<"第303波"/utf8>>), lev = 341,
		  unit_ids = [61111], is_reset = 0, formation = {5, 1}};
get({1, 304}) ->
    #endless_data{type = 1, id = 304,
		  name = lang:get(<<"第304波"/utf8>>), lev = 342,
		  unit_ids = [61112], is_reset = 0, formation = {5, 1}};
get({1, 305}) ->
    #endless_data{type = 1, id = 305,
		  name = lang:get(<<"第305波"/utf8>>), lev = 342,
		  unit_ids = [61113], is_reset = 0, formation = {6, 1}};
get({1, 306}) ->
    #endless_data{type = 1, id = 306,
		  name = lang:get(<<"第306波"/utf8>>), lev = 343,
		  unit_ids = [61114], is_reset = 0, formation = {6, 1}};
get({1, 307}) ->
    #endless_data{type = 1, id = 307,
		  name = lang:get(<<"第307波"/utf8>>), lev = 344,
		  unit_ids = [61115], is_reset = 0, formation = {1, 1}};
get({1, 308}) ->
    #endless_data{type = 1, id = 308,
		  name = lang:get(<<"第308波"/utf8>>), lev = 344,
		  unit_ids = [61116], is_reset = 0, formation = {1, 1}};
get({1, 309}) ->
    #endless_data{type = 1, id = 309,
		  name = lang:get(<<"第309波"/utf8>>), lev = 345,
		  unit_ids = [61117], is_reset = 0, formation = {2, 1}};
get({1, 310}) ->
    #endless_data{type = 1, id = 310,
		  name = lang:get(<<"第310波"/utf8>>), lev = 346,
		  unit_ids = [61118], is_reset = 0, formation = {2, 1}};
get({1, 311}) ->
    #endless_data{type = 1, id = 311,
		  name = lang:get(<<"第311波"/utf8>>), lev = 346,
		  unit_ids = [61119], is_reset = 0, formation = {3, 1}};
get({1, 312}) ->
    #endless_data{type = 1, id = 312,
		  name = lang:get(<<"第312波"/utf8>>), lev = 347,
		  unit_ids = [61120], is_reset = 0, formation = {3, 1}};
get({1, 313}) ->
    #endless_data{type = 1, id = 313,
		  name = lang:get(<<"第313波"/utf8>>), lev = 348,
		  unit_ids = [61121], is_reset = 0, formation = {4, 1}};
get({1, 314}) ->
    #endless_data{type = 1, id = 314,
		  name = lang:get(<<"第314波"/utf8>>), lev = 348,
		  unit_ids = [61122], is_reset = 0, formation = {4, 1}};
get({1, 315}) ->
    #endless_data{type = 1, id = 315,
		  name = lang:get(<<"第315波"/utf8>>), lev = 349,
		  unit_ids = [61123], is_reset = 0, formation = {5, 1}};
get({1, 316}) ->
    #endless_data{type = 1, id = 316,
		  name = lang:get(<<"第316波"/utf8>>), lev = 350,
		  unit_ids = [61109], is_reset = 0, formation = {5, 1}};
get({1, 317}) ->
    #endless_data{type = 1, id = 317,
		  name = lang:get(<<"第317波"/utf8>>), lev = 350,
		  unit_ids = [61110], is_reset = 0, formation = {6, 1}};
get({1, 318}) ->
    #endless_data{type = 1, id = 318,
		  name = lang:get(<<"第318波"/utf8>>), lev = 351,
		  unit_ids = [61111], is_reset = 0, formation = {6, 1}};
get({1, 319}) ->
    #endless_data{type = 1, id = 319,
		  name = lang:get(<<"第319波"/utf8>>), lev = 352,
		  unit_ids = [61112], is_reset = 0, formation = {1, 1}};
get({1, 320}) ->
    #endless_data{type = 1, id = 320,
		  name = lang:get(<<"第320波"/utf8>>), lev = 352,
		  unit_ids = [61113], is_reset = 0, formation = {1, 1}};
get({1, 321}) ->
    #endless_data{type = 1, id = 321,
		  name = lang:get(<<"第321波"/utf8>>), lev = 353,
		  unit_ids = [61114], is_reset = 0, formation = {2, 1}};
get({1, 322}) ->
    #endless_data{type = 1, id = 322,
		  name = lang:get(<<"第322波"/utf8>>), lev = 354,
		  unit_ids = [61115], is_reset = 0, formation = {2, 1}};
get({1, 323}) ->
    #endless_data{type = 1, id = 323,
		  name = lang:get(<<"第323波"/utf8>>), lev = 354,
		  unit_ids = [61116], is_reset = 0, formation = {3, 1}};
get({1, 324}) ->
    #endless_data{type = 1, id = 324,
		  name = lang:get(<<"第324波"/utf8>>), lev = 355,
		  unit_ids = [61117], is_reset = 0, formation = {3, 1}};
get({1, 325}) ->
    #endless_data{type = 1, id = 325,
		  name = lang:get(<<"第325波"/utf8>>), lev = 356,
		  unit_ids = [61118], is_reset = 0, formation = {4, 1}};
get({1, 326}) ->
    #endless_data{type = 1, id = 326,
		  name = lang:get(<<"第326波"/utf8>>), lev = 356,
		  unit_ids = [61119], is_reset = 0, formation = {4, 1}};
get({1, 327}) ->
    #endless_data{type = 1, id = 327,
		  name = lang:get(<<"第327波"/utf8>>), lev = 357,
		  unit_ids = [61120], is_reset = 0, formation = {5, 1}};
get({1, 328}) ->
    #endless_data{type = 1, id = 328,
		  name = lang:get(<<"第328波"/utf8>>), lev = 358,
		  unit_ids = [61121], is_reset = 0, formation = {5, 1}};
get({1, 329}) ->
    #endless_data{type = 1, id = 329,
		  name = lang:get(<<"第329波"/utf8>>), lev = 358,
		  unit_ids = [61122], is_reset = 0, formation = {6, 1}};
get({1, 330}) ->
    #endless_data{type = 1, id = 330,
		  name = lang:get(<<"第330波"/utf8>>), lev = 359,
		  unit_ids = [61123], is_reset = 0, formation = {6, 1}};
get({1, 331}) ->
    #endless_data{type = 1, id = 331,
		  name = lang:get(<<"第331波"/utf8>>), lev = 360,
		  unit_ids = [61109], is_reset = 0, formation = {1, 1}};
get({1, 332}) ->
    #endless_data{type = 1, id = 332,
		  name = lang:get(<<"第332波"/utf8>>), lev = 360,
		  unit_ids = [61110], is_reset = 0, formation = {1, 1}};
get({1, 333}) ->
    #endless_data{type = 1, id = 333,
		  name = lang:get(<<"第333波"/utf8>>), lev = 361,
		  unit_ids = [61111], is_reset = 0, formation = {2, 1}};
get({1, 334}) ->
    #endless_data{type = 1, id = 334,
		  name = lang:get(<<"第334波"/utf8>>), lev = 362,
		  unit_ids = [61112], is_reset = 0, formation = {2, 1}};
get({1, 335}) ->
    #endless_data{type = 1, id = 335,
		  name = lang:get(<<"第335波"/utf8>>), lev = 362,
		  unit_ids = [61113], is_reset = 0, formation = {3, 1}};
get({1, 336}) ->
    #endless_data{type = 1, id = 336,
		  name = lang:get(<<"第336波"/utf8>>), lev = 363,
		  unit_ids = [61114], is_reset = 0, formation = {3, 1}};
get({1, 337}) ->
    #endless_data{type = 1, id = 337,
		  name = lang:get(<<"第337波"/utf8>>), lev = 364,
		  unit_ids = [61115], is_reset = 0, formation = {4, 1}};
get({1, 338}) ->
    #endless_data{type = 1, id = 338,
		  name = lang:get(<<"第338波"/utf8>>), lev = 364,
		  unit_ids = [61116], is_reset = 0, formation = {4, 1}};
get({1, 339}) ->
    #endless_data{type = 1, id = 339,
		  name = lang:get(<<"第339波"/utf8>>), lev = 365,
		  unit_ids = [61117], is_reset = 0, formation = {5, 1}};
get({1, 340}) ->
    #endless_data{type = 1, id = 340,
		  name = lang:get(<<"第340波"/utf8>>), lev = 366,
		  unit_ids = [61118], is_reset = 0, formation = {5, 1}};
get({1, 341}) ->
    #endless_data{type = 1, id = 341,
		  name = lang:get(<<"第341波"/utf8>>), lev = 366,
		  unit_ids = [61119], is_reset = 0, formation = {6, 1}};
get({1, 342}) ->
    #endless_data{type = 1, id = 342,
		  name = lang:get(<<"第342波"/utf8>>), lev = 367,
		  unit_ids = [61120], is_reset = 0, formation = {6, 1}};
get({1, 343}) ->
    #endless_data{type = 1, id = 343,
		  name = lang:get(<<"第343波"/utf8>>), lev = 368,
		  unit_ids = [61121], is_reset = 0, formation = {1, 1}};
get({1, 344}) ->
    #endless_data{type = 1, id = 344,
		  name = lang:get(<<"第344波"/utf8>>), lev = 368,
		  unit_ids = [61122], is_reset = 0, formation = {1, 1}};
get({1, 345}) ->
    #endless_data{type = 1, id = 345,
		  name = lang:get(<<"第345波"/utf8>>), lev = 369,
		  unit_ids = [61123], is_reset = 0, formation = {2, 1}};
get({1, 346}) ->
    #endless_data{type = 1, id = 346,
		  name = lang:get(<<"第346波"/utf8>>), lev = 370,
		  unit_ids = [61109], is_reset = 0, formation = {2, 1}};
get({1, 347}) ->
    #endless_data{type = 1, id = 347,
		  name = lang:get(<<"第347波"/utf8>>), lev = 370,
		  unit_ids = [61110], is_reset = 0, formation = {3, 1}};
get({1, 348}) ->
    #endless_data{type = 1, id = 348,
		  name = lang:get(<<"第348波"/utf8>>), lev = 371,
		  unit_ids = [61111], is_reset = 0, formation = {3, 1}};
get({1, 349}) ->
    #endless_data{type = 1, id = 349,
		  name = lang:get(<<"第349波"/utf8>>), lev = 372,
		  unit_ids = [61112], is_reset = 0, formation = {4, 1}};
get({1, 350}) ->
    #endless_data{type = 1, id = 350,
		  name = lang:get(<<"第350波"/utf8>>), lev = 372,
		  unit_ids = [61113], is_reset = 0, formation = {4, 1}};
get({1, 351}) ->
    #endless_data{type = 1, id = 351,
		  name = lang:get(<<"第351波"/utf8>>), lev = 373,
		  unit_ids = [61114], is_reset = 0, formation = {5, 1}};
get({1, 352}) ->
    #endless_data{type = 1, id = 352,
		  name = lang:get(<<"第352波"/utf8>>), lev = 374,
		  unit_ids = [61115], is_reset = 0, formation = {5, 1}};
get({1, 353}) ->
    #endless_data{type = 1, id = 353,
		  name = lang:get(<<"第353波"/utf8>>), lev = 374,
		  unit_ids = [61116], is_reset = 0, formation = {6, 1}};
get({1, 354}) ->
    #endless_data{type = 1, id = 354,
		  name = lang:get(<<"第354波"/utf8>>), lev = 375,
		  unit_ids = [61117], is_reset = 0, formation = {6, 1}};
get({1, 355}) ->
    #endless_data{type = 1, id = 355,
		  name = lang:get(<<"第355波"/utf8>>), lev = 376,
		  unit_ids = [61118], is_reset = 0, formation = {1, 1}};
get({1, 356}) ->
    #endless_data{type = 1, id = 356,
		  name = lang:get(<<"第356波"/utf8>>), lev = 376,
		  unit_ids = [61119], is_reset = 0, formation = {1, 1}};
get({1, 357}) ->
    #endless_data{type = 1, id = 357,
		  name = lang:get(<<"第357波"/utf8>>), lev = 377,
		  unit_ids = [61120], is_reset = 0, formation = {2, 1}};
get({1, 358}) ->
    #endless_data{type = 1, id = 358,
		  name = lang:get(<<"第358波"/utf8>>), lev = 378,
		  unit_ids = [61121], is_reset = 0, formation = {2, 1}};
get({1, 359}) ->
    #endless_data{type = 1, id = 359,
		  name = lang:get(<<"第359波"/utf8>>), lev = 378,
		  unit_ids = [61122], is_reset = 0, formation = {3, 1}};
get({1, 360}) ->
    #endless_data{type = 1, id = 360,
		  name = lang:get(<<"第360波"/utf8>>), lev = 379,
		  unit_ids = [61123], is_reset = 0, formation = {3, 1}};
get({1, 361}) ->
    #endless_data{type = 1, id = 361,
		  name = lang:get(<<"第361波"/utf8>>), lev = 380,
		  unit_ids = [61109], is_reset = 0, formation = {4, 1}};
get({1, 362}) ->
    #endless_data{type = 1, id = 362,
		  name = lang:get(<<"第362波"/utf8>>), lev = 380,
		  unit_ids = [61110], is_reset = 0, formation = {4, 1}};
get({1, 363}) ->
    #endless_data{type = 1, id = 363,
		  name = lang:get(<<"第363波"/utf8>>), lev = 381,
		  unit_ids = [61111], is_reset = 0, formation = {5, 1}};
get({1, 364}) ->
    #endless_data{type = 1, id = 364,
		  name = lang:get(<<"第364波"/utf8>>), lev = 382,
		  unit_ids = [61112], is_reset = 0, formation = {5, 1}};
get({1, 365}) ->
    #endless_data{type = 1, id = 365,
		  name = lang:get(<<"第365波"/utf8>>), lev = 382,
		  unit_ids = [61113], is_reset = 0, formation = {6, 1}};
get({1, 366}) ->
    #endless_data{type = 1, id = 366,
		  name = lang:get(<<"第366波"/utf8>>), lev = 383,
		  unit_ids = [61114], is_reset = 0, formation = {6, 1}};
get({1, 367}) ->
    #endless_data{type = 1, id = 367,
		  name = lang:get(<<"第367波"/utf8>>), lev = 384,
		  unit_ids = [61115], is_reset = 0, formation = {1, 1}};
get({1, 368}) ->
    #endless_data{type = 1, id = 368,
		  name = lang:get(<<"第368波"/utf8>>), lev = 384,
		  unit_ids = [61116], is_reset = 0, formation = {1, 1}};
get({1, 369}) ->
    #endless_data{type = 1, id = 369,
		  name = lang:get(<<"第369波"/utf8>>), lev = 385,
		  unit_ids = [61117], is_reset = 0, formation = {2, 1}};
get({1, 370}) ->
    #endless_data{type = 1, id = 370,
		  name = lang:get(<<"第370波"/utf8>>), lev = 386,
		  unit_ids = [61118], is_reset = 0, formation = {2, 1}};
get({1, 371}) ->
    #endless_data{type = 1, id = 371,
		  name = lang:get(<<"第371波"/utf8>>), lev = 386,
		  unit_ids = [61119], is_reset = 0, formation = {3, 1}};
get({1, 372}) ->
    #endless_data{type = 1, id = 372,
		  name = lang:get(<<"第372波"/utf8>>), lev = 387,
		  unit_ids = [61120], is_reset = 0, formation = {3, 1}};
get({1, 373}) ->
    #endless_data{type = 1, id = 373,
		  name = lang:get(<<"第373波"/utf8>>), lev = 388,
		  unit_ids = [61121], is_reset = 0, formation = {4, 1}};
get({1, 374}) ->
    #endless_data{type = 1, id = 374,
		  name = lang:get(<<"第374波"/utf8>>), lev = 388,
		  unit_ids = [61122], is_reset = 0, formation = {4, 1}};
get({1, 375}) ->
    #endless_data{type = 1, id = 375,
		  name = lang:get(<<"第375波"/utf8>>), lev = 389,
		  unit_ids = [61123], is_reset = 0, formation = {5, 1}};
get({1, 376}) ->
    #endless_data{type = 1, id = 376,
		  name = lang:get(<<"第376波"/utf8>>), lev = 390,
		  unit_ids = [61109], is_reset = 0, formation = {5, 1}};
get({1, 377}) ->
    #endless_data{type = 1, id = 377,
		  name = lang:get(<<"第377波"/utf8>>), lev = 390,
		  unit_ids = [61110], is_reset = 0, formation = {6, 1}};
get({1, 378}) ->
    #endless_data{type = 1, id = 378,
		  name = lang:get(<<"第378波"/utf8>>), lev = 391,
		  unit_ids = [61111], is_reset = 0, formation = {6, 1}};
get({1, 379}) ->
    #endless_data{type = 1, id = 379,
		  name = lang:get(<<"第379波"/utf8>>), lev = 392,
		  unit_ids = [61112], is_reset = 0, formation = {1, 1}};
get({1, 380}) ->
    #endless_data{type = 1, id = 380,
		  name = lang:get(<<"第380波"/utf8>>), lev = 392,
		  unit_ids = [61113], is_reset = 0, formation = {1, 1}};
get({1, 381}) ->
    #endless_data{type = 1, id = 381,
		  name = lang:get(<<"第381波"/utf8>>), lev = 393,
		  unit_ids = [61114], is_reset = 0, formation = {2, 1}};
get({1, 382}) ->
    #endless_data{type = 1, id = 382,
		  name = lang:get(<<"第382波"/utf8>>), lev = 394,
		  unit_ids = [61115], is_reset = 0, formation = {2, 1}};
get({1, 383}) ->
    #endless_data{type = 1, id = 383,
		  name = lang:get(<<"第383波"/utf8>>), lev = 394,
		  unit_ids = [61116], is_reset = 0, formation = {3, 1}};
get({1, 384}) ->
    #endless_data{type = 1, id = 384,
		  name = lang:get(<<"第384波"/utf8>>), lev = 395,
		  unit_ids = [61117], is_reset = 0, formation = {3, 1}};
get({1, 385}) ->
    #endless_data{type = 1, id = 385,
		  name = lang:get(<<"第385波"/utf8>>), lev = 396,
		  unit_ids = [61118], is_reset = 0, formation = {4, 1}};
get({1, 386}) ->
    #endless_data{type = 1, id = 386,
		  name = lang:get(<<"第386波"/utf8>>), lev = 396,
		  unit_ids = [61119], is_reset = 0, formation = {4, 1}};
get({1, 387}) ->
    #endless_data{type = 1, id = 387,
		  name = lang:get(<<"第387波"/utf8>>), lev = 397,
		  unit_ids = [61120], is_reset = 0, formation = {5, 1}};
get({1, 388}) ->
    #endless_data{type = 1, id = 388,
		  name = lang:get(<<"第388波"/utf8>>), lev = 398,
		  unit_ids = [61121], is_reset = 0, formation = {5, 1}};
get({1, 389}) ->
    #endless_data{type = 1, id = 389,
		  name = lang:get(<<"第389波"/utf8>>), lev = 398,
		  unit_ids = [61122], is_reset = 0, formation = {6, 1}};
get({1, 390}) ->
    #endless_data{type = 1, id = 390,
		  name = lang:get(<<"第390波"/utf8>>), lev = 399,
		  unit_ids = [61123], is_reset = 0, formation = {6, 1}};
get({1, 391}) ->
    #endless_data{type = 1, id = 391,
		  name = lang:get(<<"第391波"/utf8>>), lev = 400,
		  unit_ids = [61109], is_reset = 0, formation = {1, 1}};
get({1, 392}) ->
    #endless_data{type = 1, id = 392,
		  name = lang:get(<<"第392波"/utf8>>), lev = 400,
		  unit_ids = [61110], is_reset = 0, formation = {1, 1}};
get({1, 393}) ->
    #endless_data{type = 1, id = 393,
		  name = lang:get(<<"第393波"/utf8>>), lev = 401,
		  unit_ids = [61111], is_reset = 0, formation = {2, 1}};
get({1, 394}) ->
    #endless_data{type = 1, id = 394,
		  name = lang:get(<<"第394波"/utf8>>), lev = 402,
		  unit_ids = [61112], is_reset = 0, formation = {2, 1}};
get({1, 395}) ->
    #endless_data{type = 1, id = 395,
		  name = lang:get(<<"第395波"/utf8>>), lev = 402,
		  unit_ids = [61113], is_reset = 0, formation = {3, 1}};
get({1, 396}) ->
    #endless_data{type = 1, id = 396,
		  name = lang:get(<<"第396波"/utf8>>), lev = 403,
		  unit_ids = [61114], is_reset = 0, formation = {3, 1}};
get({1, 397}) ->
    #endless_data{type = 1, id = 397,
		  name = lang:get(<<"第397波"/utf8>>), lev = 404,
		  unit_ids = [61115], is_reset = 0, formation = {4, 1}};
get({1, 398}) ->
    #endless_data{type = 1, id = 398,
		  name = lang:get(<<"第398波"/utf8>>), lev = 404,
		  unit_ids = [61116], is_reset = 0, formation = {4, 1}};
get({1, 399}) ->
    #endless_data{type = 1, id = 399,
		  name = lang:get(<<"第399波"/utf8>>), lev = 405,
		  unit_ids = [61117], is_reset = 0, formation = {5, 1}};
get({1, 400}) ->
    #endless_data{type = 1, id = 400,
		  name = lang:get(<<"第400波"/utf8>>), lev = 406,
		  unit_ids = [61118], is_reset = 0, formation = {5, 1}};
get({1, 401}) ->
    #endless_data{type = 1, id = 401,
		  name = lang:get(<<"第401波"/utf8>>), lev = 406,
		  unit_ids = [61119], is_reset = 0, formation = {6, 1}};
get({1, 402}) ->
    #endless_data{type = 1, id = 402,
		  name = lang:get(<<"第402波"/utf8>>), lev = 407,
		  unit_ids = [61120], is_reset = 0, formation = {6, 1}};
get({1, 403}) ->
    #endless_data{type = 1, id = 403,
		  name = lang:get(<<"第403波"/utf8>>), lev = 408,
		  unit_ids = [61121], is_reset = 0, formation = {1, 1}};
get({1, 404}) ->
    #endless_data{type = 1, id = 404,
		  name = lang:get(<<"第404波"/utf8>>), lev = 408,
		  unit_ids = [61122], is_reset = 0, formation = {1, 1}};
get({1, 405}) ->
    #endless_data{type = 1, id = 405,
		  name = lang:get(<<"第405波"/utf8>>), lev = 409,
		  unit_ids = [61123], is_reset = 0, formation = {2, 1}};
get({1, 406}) ->
    #endless_data{type = 1, id = 406,
		  name = lang:get(<<"第406波"/utf8>>), lev = 410,
		  unit_ids = [61109], is_reset = 0, formation = {2, 1}};
get({1, 407}) ->
    #endless_data{type = 1, id = 407,
		  name = lang:get(<<"第407波"/utf8>>), lev = 410,
		  unit_ids = [61110], is_reset = 0, formation = {3, 1}};
get({1, 408}) ->
    #endless_data{type = 1, id = 408,
		  name = lang:get(<<"第408波"/utf8>>), lev = 411,
		  unit_ids = [61111], is_reset = 0, formation = {3, 1}};
get({1, 409}) ->
    #endless_data{type = 1, id = 409,
		  name = lang:get(<<"第409波"/utf8>>), lev = 412,
		  unit_ids = [61112], is_reset = 0, formation = {4, 1}};
get({1, 410}) ->
    #endless_data{type = 1, id = 410,
		  name = lang:get(<<"第410波"/utf8>>), lev = 412,
		  unit_ids = [61113], is_reset = 0, formation = {4, 1}};
get({1, 411}) ->
    #endless_data{type = 1, id = 411,
		  name = lang:get(<<"第411波"/utf8>>), lev = 413,
		  unit_ids = [61114], is_reset = 0, formation = {5, 1}};
get({1, 412}) ->
    #endless_data{type = 1, id = 412,
		  name = lang:get(<<"第412波"/utf8>>), lev = 414,
		  unit_ids = [61115], is_reset = 0, formation = {5, 1}};
get({1, 413}) ->
    #endless_data{type = 1, id = 413,
		  name = lang:get(<<"第413波"/utf8>>), lev = 414,
		  unit_ids = [61116], is_reset = 0, formation = {6, 1}};
get({1, 414}) ->
    #endless_data{type = 1, id = 414,
		  name = lang:get(<<"第414波"/utf8>>), lev = 415,
		  unit_ids = [61117], is_reset = 0, formation = {6, 1}};
get({1, 415}) ->
    #endless_data{type = 1, id = 415,
		  name = lang:get(<<"第415波"/utf8>>), lev = 416,
		  unit_ids = [61118], is_reset = 0, formation = {1, 1}};
get({1, 416}) ->
    #endless_data{type = 1, id = 416,
		  name = lang:get(<<"第416波"/utf8>>), lev = 416,
		  unit_ids = [61119], is_reset = 0, formation = {1, 1}};
get({1, 417}) ->
    #endless_data{type = 1, id = 417,
		  name = lang:get(<<"第417波"/utf8>>), lev = 417,
		  unit_ids = [61120], is_reset = 0, formation = {2, 1}};
get({1, 418}) ->
    #endless_data{type = 1, id = 418,
		  name = lang:get(<<"第418波"/utf8>>), lev = 418,
		  unit_ids = [61121], is_reset = 0, formation = {2, 1}};
get({1, 419}) ->
    #endless_data{type = 1, id = 419,
		  name = lang:get(<<"第419波"/utf8>>), lev = 418,
		  unit_ids = [61122], is_reset = 0, formation = {3, 1}};
get({1, 420}) ->
    #endless_data{type = 1, id = 420,
		  name = lang:get(<<"第420波"/utf8>>), lev = 419,
		  unit_ids = [61123], is_reset = 0, formation = {3, 1}};
get({1, 421}) ->
    #endless_data{type = 1, id = 421,
		  name = lang:get(<<"第421波"/utf8>>), lev = 420,
		  unit_ids = [61109], is_reset = 0, formation = {4, 1}};
get({1, 422}) ->
    #endless_data{type = 1, id = 422,
		  name = lang:get(<<"第422波"/utf8>>), lev = 420,
		  unit_ids = [61110], is_reset = 0, formation = {4, 1}};
get({1, 423}) ->
    #endless_data{type = 1, id = 423,
		  name = lang:get(<<"第423波"/utf8>>), lev = 421,
		  unit_ids = [61111], is_reset = 0, formation = {5, 1}};
get({1, 424}) ->
    #endless_data{type = 1, id = 424,
		  name = lang:get(<<"第424波"/utf8>>), lev = 422,
		  unit_ids = [61112], is_reset = 0, formation = {5, 1}};
get({1, 425}) ->
    #endless_data{type = 1, id = 425,
		  name = lang:get(<<"第425波"/utf8>>), lev = 422,
		  unit_ids = [61113], is_reset = 0, formation = {6, 1}};
get({1, 426}) ->
    #endless_data{type = 1, id = 426,
		  name = lang:get(<<"第426波"/utf8>>), lev = 423,
		  unit_ids = [61114], is_reset = 0, formation = {6, 1}};
get({1, 427}) ->
    #endless_data{type = 1, id = 427,
		  name = lang:get(<<"第427波"/utf8>>), lev = 424,
		  unit_ids = [61115], is_reset = 0, formation = {1, 1}};
get({1, 428}) ->
    #endless_data{type = 1, id = 428,
		  name = lang:get(<<"第428波"/utf8>>), lev = 424,
		  unit_ids = [61116], is_reset = 0, formation = {1, 1}};
get({1, 429}) ->
    #endless_data{type = 1, id = 429,
		  name = lang:get(<<"第429波"/utf8>>), lev = 425,
		  unit_ids = [61117], is_reset = 0, formation = {2, 1}};
get({1, 430}) ->
    #endless_data{type = 1, id = 430,
		  name = lang:get(<<"第430波"/utf8>>), lev = 426,
		  unit_ids = [61118], is_reset = 0, formation = {2, 1}};
get({1, 431}) ->
    #endless_data{type = 1, id = 431,
		  name = lang:get(<<"第431波"/utf8>>), lev = 426,
		  unit_ids = [61119], is_reset = 0, formation = {3, 1}};
get({1, 432}) ->
    #endless_data{type = 1, id = 432,
		  name = lang:get(<<"第432波"/utf8>>), lev = 427,
		  unit_ids = [61120], is_reset = 0, formation = {3, 1}};
get({1, 433}) ->
    #endless_data{type = 1, id = 433,
		  name = lang:get(<<"第433波"/utf8>>), lev = 428,
		  unit_ids = [61121], is_reset = 0, formation = {4, 1}};
get({1, 434}) ->
    #endless_data{type = 1, id = 434,
		  name = lang:get(<<"第434波"/utf8>>), lev = 428,
		  unit_ids = [61122], is_reset = 0, formation = {4, 1}};
get({1, 435}) ->
    #endless_data{type = 1, id = 435,
		  name = lang:get(<<"第435波"/utf8>>), lev = 429,
		  unit_ids = [61123], is_reset = 0, formation = {5, 1}};
get({1, 436}) ->
    #endless_data{type = 1, id = 436,
		  name = lang:get(<<"第436波"/utf8>>), lev = 430,
		  unit_ids = [61109], is_reset = 0, formation = {5, 1}};
get({1, 437}) ->
    #endless_data{type = 1, id = 437,
		  name = lang:get(<<"第437波"/utf8>>), lev = 430,
		  unit_ids = [61110], is_reset = 0, formation = {6, 1}};
get({1, 438}) ->
    #endless_data{type = 1, id = 438,
		  name = lang:get(<<"第438波"/utf8>>), lev = 431,
		  unit_ids = [61111], is_reset = 0, formation = {6, 1}};
get({1, 439}) ->
    #endless_data{type = 1, id = 439,
		  name = lang:get(<<"第439波"/utf8>>), lev = 432,
		  unit_ids = [61112], is_reset = 0, formation = {1, 1}};
get({1, 440}) ->
    #endless_data{type = 1, id = 440,
		  name = lang:get(<<"第440波"/utf8>>), lev = 432,
		  unit_ids = [61113], is_reset = 0, formation = {1, 1}};
get({1, 441}) ->
    #endless_data{type = 1, id = 441,
		  name = lang:get(<<"第441波"/utf8>>), lev = 433,
		  unit_ids = [61114], is_reset = 0, formation = {2, 1}};
get({1, 442}) ->
    #endless_data{type = 1, id = 442,
		  name = lang:get(<<"第442波"/utf8>>), lev = 434,
		  unit_ids = [61115], is_reset = 0, formation = {2, 1}};
get({1, 443}) ->
    #endless_data{type = 1, id = 443,
		  name = lang:get(<<"第443波"/utf8>>), lev = 434,
		  unit_ids = [61116], is_reset = 0, formation = {3, 1}};
get({1, 444}) ->
    #endless_data{type = 1, id = 444,
		  name = lang:get(<<"第444波"/utf8>>), lev = 435,
		  unit_ids = [61117], is_reset = 0, formation = {3, 1}};
get({1, 445}) ->
    #endless_data{type = 1, id = 445,
		  name = lang:get(<<"第445波"/utf8>>), lev = 436,
		  unit_ids = [61118], is_reset = 0, formation = {4, 1}};
get({1, 446}) ->
    #endless_data{type = 1, id = 446,
		  name = lang:get(<<"第446波"/utf8>>), lev = 436,
		  unit_ids = [61119], is_reset = 0, formation = {4, 1}};
get({1, 447}) ->
    #endless_data{type = 1, id = 447,
		  name = lang:get(<<"第447波"/utf8>>), lev = 437,
		  unit_ids = [61120], is_reset = 0, formation = {5, 1}};
get({1, 448}) ->
    #endless_data{type = 1, id = 448,
		  name = lang:get(<<"第448波"/utf8>>), lev = 438,
		  unit_ids = [61121], is_reset = 0, formation = {5, 1}};
get({1, 449}) ->
    #endless_data{type = 1, id = 449,
		  name = lang:get(<<"第449波"/utf8>>), lev = 438,
		  unit_ids = [61122], is_reset = 0, formation = {6, 1}};
get({1, 450}) ->
    #endless_data{type = 1, id = 450,
		  name = lang:get(<<"第450波"/utf8>>), lev = 439,
		  unit_ids = [61123], is_reset = 0, formation = {6, 1}};
get({1, 451}) ->
    #endless_data{type = 1, id = 451,
		  name = lang:get(<<"第451波"/utf8>>), lev = 440,
		  unit_ids = [61109], is_reset = 0, formation = {1, 1}};
get({1, 452}) ->
    #endless_data{type = 1, id = 452,
		  name = lang:get(<<"第452波"/utf8>>), lev = 440,
		  unit_ids = [61110], is_reset = 0, formation = {1, 1}};
get({1, 453}) ->
    #endless_data{type = 1, id = 453,
		  name = lang:get(<<"第453波"/utf8>>), lev = 441,
		  unit_ids = [61111], is_reset = 0, formation = {2, 1}};
get({1, 454}) ->
    #endless_data{type = 1, id = 454,
		  name = lang:get(<<"第454波"/utf8>>), lev = 442,
		  unit_ids = [61112], is_reset = 0, formation = {2, 1}};
get({1, 455}) ->
    #endless_data{type = 1, id = 455,
		  name = lang:get(<<"第455波"/utf8>>), lev = 442,
		  unit_ids = [61113], is_reset = 0, formation = {3, 1}};
get({1, 456}) ->
    #endless_data{type = 1, id = 456,
		  name = lang:get(<<"第456波"/utf8>>), lev = 443,
		  unit_ids = [61114], is_reset = 0, formation = {3, 1}};
get({1, 457}) ->
    #endless_data{type = 1, id = 457,
		  name = lang:get(<<"第457波"/utf8>>), lev = 444,
		  unit_ids = [61115], is_reset = 0, formation = {4, 1}};
get({1, 458}) ->
    #endless_data{type = 1, id = 458,
		  name = lang:get(<<"第458波"/utf8>>), lev = 444,
		  unit_ids = [61116], is_reset = 0, formation = {4, 1}};
get({1, 459}) ->
    #endless_data{type = 1, id = 459,
		  name = lang:get(<<"第459波"/utf8>>), lev = 445,
		  unit_ids = [61117], is_reset = 0, formation = {5, 1}};
get({1, 460}) ->
    #endless_data{type = 1, id = 460,
		  name = lang:get(<<"第460波"/utf8>>), lev = 446,
		  unit_ids = [61118], is_reset = 0, formation = {5, 1}};
get({1, 461}) ->
    #endless_data{type = 1, id = 461,
		  name = lang:get(<<"第461波"/utf8>>), lev = 446,
		  unit_ids = [61119], is_reset = 0, formation = {6, 1}};
get({1, 462}) ->
    #endless_data{type = 1, id = 462,
		  name = lang:get(<<"第462波"/utf8>>), lev = 447,
		  unit_ids = [61120], is_reset = 0, formation = {6, 1}};
get({1, 463}) ->
    #endless_data{type = 1, id = 463,
		  name = lang:get(<<"第463波"/utf8>>), lev = 448,
		  unit_ids = [61121], is_reset = 0, formation = {1, 1}};
get({1, 464}) ->
    #endless_data{type = 1, id = 464,
		  name = lang:get(<<"第464波"/utf8>>), lev = 448,
		  unit_ids = [61122], is_reset = 0, formation = {1, 1}};
get({1, 465}) ->
    #endless_data{type = 1, id = 465,
		  name = lang:get(<<"第465波"/utf8>>), lev = 449,
		  unit_ids = [61123], is_reset = 0, formation = {2, 1}};
get({1, 466}) ->
    #endless_data{type = 1, id = 466,
		  name = lang:get(<<"第466波"/utf8>>), lev = 450,
		  unit_ids = [61109], is_reset = 0, formation = {2, 1}};
get({1, 467}) ->
    #endless_data{type = 1, id = 467,
		  name = lang:get(<<"第467波"/utf8>>), lev = 450,
		  unit_ids = [61110], is_reset = 0, formation = {3, 1}};
get({1, 468}) ->
    #endless_data{type = 1, id = 468,
		  name = lang:get(<<"第468波"/utf8>>), lev = 451,
		  unit_ids = [61111], is_reset = 0, formation = {3, 1}};
get({1, 469}) ->
    #endless_data{type = 1, id = 469,
		  name = lang:get(<<"第469波"/utf8>>), lev = 452,
		  unit_ids = [61112], is_reset = 0, formation = {4, 1}};
get({1, 470}) ->
    #endless_data{type = 1, id = 470,
		  name = lang:get(<<"第470波"/utf8>>), lev = 452,
		  unit_ids = [61113], is_reset = 0, formation = {4, 1}};
get({1, 471}) ->
    #endless_data{type = 1, id = 471,
		  name = lang:get(<<"第471波"/utf8>>), lev = 453,
		  unit_ids = [61114], is_reset = 0, formation = {5, 1}};
get({1, 472}) ->
    #endless_data{type = 1, id = 472,
		  name = lang:get(<<"第472波"/utf8>>), lev = 454,
		  unit_ids = [61115], is_reset = 0, formation = {5, 1}};
get({1, 473}) ->
    #endless_data{type = 1, id = 473,
		  name = lang:get(<<"第473波"/utf8>>), lev = 454,
		  unit_ids = [61116], is_reset = 0, formation = {6, 1}};
get({1, 474}) ->
    #endless_data{type = 1, id = 474,
		  name = lang:get(<<"第474波"/utf8>>), lev = 455,
		  unit_ids = [61117], is_reset = 0, formation = {6, 1}};
get({1, 475}) ->
    #endless_data{type = 1, id = 475,
		  name = lang:get(<<"第475波"/utf8>>), lev = 456,
		  unit_ids = [61118], is_reset = 0, formation = {1, 1}};
get({1, 476}) ->
    #endless_data{type = 1, id = 476,
		  name = lang:get(<<"第476波"/utf8>>), lev = 456,
		  unit_ids = [61119], is_reset = 0, formation = {1, 1}};
get({1, 477}) ->
    #endless_data{type = 1, id = 477,
		  name = lang:get(<<"第477波"/utf8>>), lev = 457,
		  unit_ids = [61120], is_reset = 0, formation = {2, 1}};
get({1, 478}) ->
    #endless_data{type = 1, id = 478,
		  name = lang:get(<<"第478波"/utf8>>), lev = 458,
		  unit_ids = [61121], is_reset = 0, formation = {2, 1}};
get({1, 479}) ->
    #endless_data{type = 1, id = 479,
		  name = lang:get(<<"第479波"/utf8>>), lev = 458,
		  unit_ids = [61122], is_reset = 0, formation = {3, 1}};
get({1, 480}) ->
    #endless_data{type = 1, id = 480,
		  name = lang:get(<<"第480波"/utf8>>), lev = 459,
		  unit_ids = [61123], is_reset = 0, formation = {3, 1}};
get({1, 481}) ->
    #endless_data{type = 1, id = 481,
		  name = lang:get(<<"第481波"/utf8>>), lev = 460,
		  unit_ids = [61109], is_reset = 0, formation = {4, 1}};
get({1, 482}) ->
    #endless_data{type = 1, id = 482,
		  name = lang:get(<<"第482波"/utf8>>), lev = 460,
		  unit_ids = [61110], is_reset = 0, formation = {4, 1}};
get({1, 483}) ->
    #endless_data{type = 1, id = 483,
		  name = lang:get(<<"第483波"/utf8>>), lev = 461,
		  unit_ids = [61111], is_reset = 0, formation = {5, 1}};
get({1, 484}) ->
    #endless_data{type = 1, id = 484,
		  name = lang:get(<<"第484波"/utf8>>), lev = 462,
		  unit_ids = [61112], is_reset = 0, formation = {5, 1}};
get({1, 485}) ->
    #endless_data{type = 1, id = 485,
		  name = lang:get(<<"第485波"/utf8>>), lev = 462,
		  unit_ids = [61113], is_reset = 0, formation = {6, 1}};
get({1, 486}) ->
    #endless_data{type = 1, id = 486,
		  name = lang:get(<<"第486波"/utf8>>), lev = 463,
		  unit_ids = [61114], is_reset = 0, formation = {6, 1}};
get({1, 487}) ->
    #endless_data{type = 1, id = 487,
		  name = lang:get(<<"第487波"/utf8>>), lev = 464,
		  unit_ids = [61115], is_reset = 0, formation = {1, 1}};
get({1, 488}) ->
    #endless_data{type = 1, id = 488,
		  name = lang:get(<<"第488波"/utf8>>), lev = 464,
		  unit_ids = [61116], is_reset = 0, formation = {1, 1}};
get({1, 489}) ->
    #endless_data{type = 1, id = 489,
		  name = lang:get(<<"第489波"/utf8>>), lev = 465,
		  unit_ids = [61117], is_reset = 0, formation = {2, 1}};
get({1, 490}) ->
    #endless_data{type = 1, id = 490,
		  name = lang:get(<<"第490波"/utf8>>), lev = 466,
		  unit_ids = [61118], is_reset = 0, formation = {2, 1}};
get({1, 491}) ->
    #endless_data{type = 1, id = 491,
		  name = lang:get(<<"第491波"/utf8>>), lev = 466,
		  unit_ids = [61119], is_reset = 0, formation = {3, 1}};
get({1, 492}) ->
    #endless_data{type = 1, id = 492,
		  name = lang:get(<<"第492波"/utf8>>), lev = 467,
		  unit_ids = [61120], is_reset = 0, formation = {3, 1}};
get({1, 493}) ->
    #endless_data{type = 1, id = 493,
		  name = lang:get(<<"第493波"/utf8>>), lev = 468,
		  unit_ids = [61121], is_reset = 0, formation = {4, 1}};
get({1, 494}) ->
    #endless_data{type = 1, id = 494,
		  name = lang:get(<<"第494波"/utf8>>), lev = 468,
		  unit_ids = [61122], is_reset = 0, formation = {4, 1}};
get({1, 495}) ->
    #endless_data{type = 1, id = 495,
		  name = lang:get(<<"第495波"/utf8>>), lev = 469,
		  unit_ids = [61123], is_reset = 0, formation = {5, 1}};
get({1, 496}) ->
    #endless_data{type = 1, id = 496,
		  name = lang:get(<<"第496波"/utf8>>), lev = 470,
		  unit_ids = [61109], is_reset = 0, formation = {5, 1}};
get({1, 497}) ->
    #endless_data{type = 1, id = 497,
		  name = lang:get(<<"第497波"/utf8>>), lev = 470,
		  unit_ids = [61110], is_reset = 0, formation = {6, 1}};
get({1, 498}) ->
    #endless_data{type = 1, id = 498,
		  name = lang:get(<<"第498波"/utf8>>), lev = 471,
		  unit_ids = [61111], is_reset = 0, formation = {6, 1}};
get({1, 499}) ->
    #endless_data{type = 1, id = 499,
		  name = lang:get(<<"第499波"/utf8>>), lev = 472,
		  unit_ids = [61112], is_reset = 0, formation = {1, 1}};
get({1, 500}) ->
    #endless_data{type = 1, id = 500,
		  name = lang:get(<<"第500波"/utf8>>), lev = 472,
		  unit_ids = [61113], is_reset = 0, formation = {1, 1}};
get({2, 1}) ->
    #endless_data{type = 2, id = 1,
		  name = lang:get(<<"第1波"/utf8>>), lev = 185,
		  unit_ids = [62101], is_reset = 0, formation = {1, 1}};
get({2, 2}) ->
    #endless_data{type = 2, id = 2,
		  name = lang:get(<<"第2波"/utf8>>), lev = 185,
		  unit_ids = [62102], is_reset = 0, formation = {1, 1}};
get({2, 3}) ->
    #endless_data{type = 2, id = 3,
		  name = lang:get(<<"第3波"/utf8>>), lev = 185,
		  unit_ids = [62103], is_reset = 0, formation = {2, 1}};
get({2, 4}) ->
    #endless_data{type = 2, id = 4,
		  name = lang:get(<<"第4波"/utf8>>), lev = 186,
		  unit_ids = [62104], is_reset = 0, formation = {2, 1}};
get({2, 5}) ->
    #endless_data{type = 2, id = 5,
		  name = lang:get(<<"第5波"/utf8>>), lev = 186,
		  unit_ids = [62105], is_reset = 0, formation = {3, 1}};
get({2, 6}) ->
    #endless_data{type = 2, id = 6,
		  name = lang:get(<<"第6波"/utf8>>), lev = 186,
		  unit_ids = [62106], is_reset = 0, formation = {3, 1}};
get({2, 7}) ->
    #endless_data{type = 2, id = 7,
		  name = lang:get(<<"第7波"/utf8>>), lev = 187,
		  unit_ids = [62107], is_reset = 0, formation = {4, 1}};
get({2, 8}) ->
    #endless_data{type = 2, id = 8,
		  name = lang:get(<<"第8波"/utf8>>), lev = 187,
		  unit_ids = [62108], is_reset = 0, formation = {4, 1}};
get({2, 9}) ->
    #endless_data{type = 2, id = 9,
		  name = lang:get(<<"第9波"/utf8>>), lev = 187,
		  unit_ids = [62101], is_reset = 0, formation = {5, 1}};
get({2, 10}) ->
    #endless_data{type = 2, id = 10,
		  name = lang:get(<<"第10波"/utf8>>), lev = 188,
		  unit_ids = [62102], is_reset = 0, formation = {5, 1}};
get({2, 11}) ->
    #endless_data{type = 2, id = 11,
		  name = lang:get(<<"第11波"/utf8>>), lev = 188,
		  unit_ids = [62103], is_reset = 0, formation = {6, 1}};
get({2, 12}) ->
    #endless_data{type = 2, id = 12,
		  name = lang:get(<<"第12波"/utf8>>), lev = 188,
		  unit_ids = [62104], is_reset = 0, formation = {6, 1}};
get({2, 13}) ->
    #endless_data{type = 2, id = 13,
		  name = lang:get(<<"第13波"/utf8>>), lev = 189,
		  unit_ids = [62105], is_reset = 0, formation = {1, 1}};
get({2, 14}) ->
    #endless_data{type = 2, id = 14,
		  name = lang:get(<<"第14波"/utf8>>), lev = 189,
		  unit_ids = [62106], is_reset = 0, formation = {1, 1}};
get({2, 15}) ->
    #endless_data{type = 2, id = 15,
		  name = lang:get(<<"第15波"/utf8>>), lev = 189,
		  unit_ids = [62107], is_reset = 0, formation = {2, 1}};
get({2, 16}) ->
    #endless_data{type = 2, id = 16,
		  name = lang:get(<<"第16波"/utf8>>), lev = 190,
		  unit_ids = [62108], is_reset = 0, formation = {2, 1}};
get({2, 17}) ->
    #endless_data{type = 2, id = 17,
		  name = lang:get(<<"第17波"/utf8>>), lev = 190,
		  unit_ids = [62101], is_reset = 0, formation = {3, 1}};
get({2, 18}) ->
    #endless_data{type = 2, id = 18,
		  name = lang:get(<<"第18波"/utf8>>), lev = 190,
		  unit_ids = [62102], is_reset = 0, formation = {3, 1}};
get({2, 19}) ->
    #endless_data{type = 2, id = 19,
		  name = lang:get(<<"第19波"/utf8>>), lev = 191,
		  unit_ids = [62103], is_reset = 0, formation = {4, 1}};
get({2, 20}) ->
    #endless_data{type = 2, id = 20,
		  name = lang:get(<<"第20波"/utf8>>), lev = 191,
		  unit_ids = [62104], is_reset = 0, formation = {4, 1}};
get({2, 21}) ->
    #endless_data{type = 2, id = 21,
		  name = lang:get(<<"第21波"/utf8>>), lev = 191,
		  unit_ids = [62105], is_reset = 0, formation = {5, 1}};
get({2, 22}) ->
    #endless_data{type = 2, id = 22,
		  name = lang:get(<<"第22波"/utf8>>), lev = 192,
		  unit_ids = [62106], is_reset = 0, formation = {5, 1}};
get({2, 23}) ->
    #endless_data{type = 2, id = 23,
		  name = lang:get(<<"第23波"/utf8>>), lev = 192,
		  unit_ids = [62107], is_reset = 0, formation = {6, 1}};
get({2, 24}) ->
    #endless_data{type = 2, id = 24,
		  name = lang:get(<<"第24波"/utf8>>), lev = 192,
		  unit_ids = [62108], is_reset = 0, formation = {6, 1}};
get({2, 25}) ->
    #endless_data{type = 2, id = 25,
		  name = lang:get(<<"第25波"/utf8>>), lev = 193,
		  unit_ids = [62101], is_reset = 0, formation = {1, 1}};
get({2, 26}) ->
    #endless_data{type = 2, id = 26,
		  name = lang:get(<<"第26波"/utf8>>), lev = 193,
		  unit_ids = [62102], is_reset = 0, formation = {1, 1}};
get({2, 27}) ->
    #endless_data{type = 2, id = 27,
		  name = lang:get(<<"第27波"/utf8>>), lev = 193,
		  unit_ids = [62103], is_reset = 0, formation = {2, 1}};
get({2, 28}) ->
    #endless_data{type = 2, id = 28,
		  name = lang:get(<<"第28波"/utf8>>), lev = 194,
		  unit_ids = [62104], is_reset = 0, formation = {2, 1}};
get({2, 29}) ->
    #endless_data{type = 2, id = 29,
		  name = lang:get(<<"第29波"/utf8>>), lev = 194,
		  unit_ids = [62105], is_reset = 0, formation = {3, 1}};
get({2, 30}) ->
    #endless_data{type = 2, id = 30,
		  name = lang:get(<<"第30波"/utf8>>), lev = 194,
		  unit_ids = [62106], is_reset = 0, formation = {3, 1}};
get({2, 31}) ->
    #endless_data{type = 2, id = 31,
		  name = lang:get(<<"第31波"/utf8>>), lev = 195,
		  unit_ids = [62107], is_reset = 0, formation = {4, 1}};
get({2, 32}) ->
    #endless_data{type = 2, id = 32,
		  name = lang:get(<<"第32波"/utf8>>), lev = 195,
		  unit_ids = [62108], is_reset = 0, formation = {4, 1}};
get({2, 33}) ->
    #endless_data{type = 2, id = 33,
		  name = lang:get(<<"第33波"/utf8>>), lev = 195,
		  unit_ids = [62101], is_reset = 0, formation = {5, 1}};
get({2, 34}) ->
    #endless_data{type = 2, id = 34,
		  name = lang:get(<<"第34波"/utf8>>), lev = 196,
		  unit_ids = [62102], is_reset = 0, formation = {5, 1}};
get({2, 35}) ->
    #endless_data{type = 2, id = 35,
		  name = lang:get(<<"第35波"/utf8>>), lev = 196,
		  unit_ids = [62103], is_reset = 0, formation = {6, 1}};
get({2, 36}) ->
    #endless_data{type = 2, id = 36,
		  name = lang:get(<<"第36波"/utf8>>), lev = 196,
		  unit_ids = [62104], is_reset = 0, formation = {6, 1}};
get({2, 37}) ->
    #endless_data{type = 2, id = 37,
		  name = lang:get(<<"第37波"/utf8>>), lev = 197,
		  unit_ids = [62105], is_reset = 0, formation = {1, 1}};
get({2, 38}) ->
    #endless_data{type = 2, id = 38,
		  name = lang:get(<<"第38波"/utf8>>), lev = 197,
		  unit_ids = [62106], is_reset = 0, formation = {1, 1}};
get({2, 39}) ->
    #endless_data{type = 2, id = 39,
		  name = lang:get(<<"第39波"/utf8>>), lev = 197,
		  unit_ids = [62107], is_reset = 0, formation = {2, 1}};
get({2, 40}) ->
    #endless_data{type = 2, id = 40,
		  name = lang:get(<<"第40波"/utf8>>), lev = 198,
		  unit_ids = [62108], is_reset = 0, formation = {2, 1}};
get({2, 41}) ->
    #endless_data{type = 2, id = 41,
		  name = lang:get(<<"第41波"/utf8>>), lev = 198,
		  unit_ids = [62101], is_reset = 0, formation = {3, 1}};
get({2, 42}) ->
    #endless_data{type = 2, id = 42,
		  name = lang:get(<<"第42波"/utf8>>), lev = 198,
		  unit_ids = [62102], is_reset = 0, formation = {3, 1}};
get({2, 43}) ->
    #endless_data{type = 2, id = 43,
		  name = lang:get(<<"第43波"/utf8>>), lev = 199,
		  unit_ids = [62103], is_reset = 0, formation = {4, 1}};
get({2, 44}) ->
    #endless_data{type = 2, id = 44,
		  name = lang:get(<<"第44波"/utf8>>), lev = 199,
		  unit_ids = [62104], is_reset = 0, formation = {4, 1}};
get({2, 45}) ->
    #endless_data{type = 2, id = 45,
		  name = lang:get(<<"第45波"/utf8>>), lev = 199,
		  unit_ids = [62105], is_reset = 0, formation = {5, 1}};
get({2, 46}) ->
    #endless_data{type = 2, id = 46,
		  name = lang:get(<<"第46波"/utf8>>), lev = 200,
		  unit_ids = [62106], is_reset = 0, formation = {5, 1}};
get({2, 47}) ->
    #endless_data{type = 2, id = 47,
		  name = lang:get(<<"第47波"/utf8>>), lev = 200,
		  unit_ids = [62107], is_reset = 0, formation = {6, 1}};
get({2, 48}) ->
    #endless_data{type = 2, id = 48,
		  name = lang:get(<<"第48波"/utf8>>), lev = 200,
		  unit_ids = [62108], is_reset = 0, formation = {6, 1}};
get({2, 49}) ->
    #endless_data{type = 2, id = 49,
		  name = lang:get(<<"第49波"/utf8>>), lev = 201,
		  unit_ids = [62101], is_reset = 0, formation = {1, 1}};
get({2, 50}) ->
    #endless_data{type = 2, id = 50,
		  name = lang:get(<<"第50波"/utf8>>), lev = 201,
		  unit_ids = [62102], is_reset = 0, formation = {1, 1}};
get({2, 51}) ->
    #endless_data{type = 2, id = 51,
		  name = lang:get(<<"第51波"/utf8>>), lev = 201,
		  unit_ids = [62103], is_reset = 0, formation = {2, 1}};
get({2, 52}) ->
    #endless_data{type = 2, id = 52,
		  name = lang:get(<<"第52波"/utf8>>), lev = 202,
		  unit_ids = [62104], is_reset = 0, formation = {2, 1}};
get({2, 53}) ->
    #endless_data{type = 2, id = 53,
		  name = lang:get(<<"第53波"/utf8>>), lev = 202,
		  unit_ids = [62105], is_reset = 0, formation = {3, 1}};
get({2, 54}) ->
    #endless_data{type = 2, id = 54,
		  name = lang:get(<<"第54波"/utf8>>), lev = 202,
		  unit_ids = [62106], is_reset = 0, formation = {3, 1}};
get({2, 55}) ->
    #endless_data{type = 2, id = 55,
		  name = lang:get(<<"第55波"/utf8>>), lev = 203,
		  unit_ids = [62107], is_reset = 0, formation = {4, 1}};
get({2, 56}) ->
    #endless_data{type = 2, id = 56,
		  name = lang:get(<<"第56波"/utf8>>), lev = 203,
		  unit_ids = [62108], is_reset = 0, formation = {4, 1}};
get({2, 57}) ->
    #endless_data{type = 2, id = 57,
		  name = lang:get(<<"第57波"/utf8>>), lev = 203,
		  unit_ids = [62101], is_reset = 0, formation = {5, 1}};
get({2, 58}) ->
    #endless_data{type = 2, id = 58,
		  name = lang:get(<<"第58波"/utf8>>), lev = 204,
		  unit_ids = [62102], is_reset = 0, formation = {5, 1}};
get({2, 59}) ->
    #endless_data{type = 2, id = 59,
		  name = lang:get(<<"第59波"/utf8>>), lev = 204,
		  unit_ids = [62103], is_reset = 0, formation = {6, 1}};
get({2, 60}) ->
    #endless_data{type = 2, id = 60,
		  name = lang:get(<<"第60波"/utf8>>), lev = 204,
		  unit_ids = [62104], is_reset = 0, formation = {6, 1}};
get({2, 61}) ->
    #endless_data{type = 2, id = 61,
		  name = lang:get(<<"第61波"/utf8>>), lev = 205,
		  unit_ids = [62105], is_reset = 0, formation = {1, 1}};
get({2, 62}) ->
    #endless_data{type = 2, id = 62,
		  name = lang:get(<<"第62波"/utf8>>), lev = 205,
		  unit_ids = [62106], is_reset = 0, formation = {1, 1}};
get({2, 63}) ->
    #endless_data{type = 2, id = 63,
		  name = lang:get(<<"第63波"/utf8>>), lev = 205,
		  unit_ids = [62107], is_reset = 0, formation = {2, 1}};
get({2, 64}) ->
    #endless_data{type = 2, id = 64,
		  name = lang:get(<<"第64波"/utf8>>), lev = 206,
		  unit_ids = [62109], is_reset = 0, formation = {2, 1}};
get({2, 65}) ->
    #endless_data{type = 2, id = 65,
		  name = lang:get(<<"第65波"/utf8>>), lev = 206,
		  unit_ids = [62110], is_reset = 0, formation = {3, 1}};
get({2, 66}) ->
    #endless_data{type = 2, id = 66,
		  name = lang:get(<<"第66波"/utf8>>), lev = 206,
		  unit_ids = [62111], is_reset = 0, formation = {3, 1}};
get({2, 67}) ->
    #endless_data{type = 2, id = 67,
		  name = lang:get(<<"第67波"/utf8>>), lev = 207,
		  unit_ids = [62112], is_reset = 0, formation = {4, 1}};
get({2, 68}) ->
    #endless_data{type = 2, id = 68,
		  name = lang:get(<<"第68波"/utf8>>), lev = 207,
		  unit_ids = [62113], is_reset = 0, formation = {4, 1}};
get({2, 69}) ->
    #endless_data{type = 2, id = 69,
		  name = lang:get(<<"第69波"/utf8>>), lev = 207,
		  unit_ids = [62114], is_reset = 0, formation = {5, 1}};
get({2, 70}) ->
    #endless_data{type = 2, id = 70,
		  name = lang:get(<<"第70波"/utf8>>), lev = 208,
		  unit_ids = [62115], is_reset = 0, formation = {5, 1}};
get({2, 71}) ->
    #endless_data{type = 2, id = 71,
		  name = lang:get(<<"第71波"/utf8>>), lev = 208,
		  unit_ids = [62116], is_reset = 0, formation = {6, 1}};
get({2, 72}) ->
    #endless_data{type = 2, id = 72,
		  name = lang:get(<<"第72波"/utf8>>), lev = 208,
		  unit_ids = [62117], is_reset = 0, formation = {6, 1}};
get({2, 73}) ->
    #endless_data{type = 2, id = 73,
		  name = lang:get(<<"第73波"/utf8>>), lev = 209,
		  unit_ids = [62118], is_reset = 0, formation = {1, 1}};
get({2, 74}) ->
    #endless_data{type = 2, id = 74,
		  name = lang:get(<<"第74波"/utf8>>), lev = 209,
		  unit_ids = [62119], is_reset = 0, formation = {1, 1}};
get({2, 75}) ->
    #endless_data{type = 2, id = 75,
		  name = lang:get(<<"第75波"/utf8>>), lev = 209,
		  unit_ids = [62120], is_reset = 0, formation = {2, 1}};
get({2, 76}) ->
    #endless_data{type = 2, id = 76,
		  name = lang:get(<<"第76波"/utf8>>), lev = 210,
		  unit_ids = [62121], is_reset = 0, formation = {2, 1}};
get({2, 77}) ->
    #endless_data{type = 2, id = 77,
		  name = lang:get(<<"第77波"/utf8>>), lev = 210,
		  unit_ids = [62122], is_reset = 0, formation = {3, 1}};
get({2, 78}) ->
    #endless_data{type = 2, id = 78,
		  name = lang:get(<<"第78波"/utf8>>), lev = 210,
		  unit_ids = [62123], is_reset = 0, formation = {3, 1}};
get({2, 79}) ->
    #endless_data{type = 2, id = 79,
		  name = lang:get(<<"第79波"/utf8>>), lev = 211,
		  unit_ids = [62109], is_reset = 0, formation = {4, 1}};
get({2, 80}) ->
    #endless_data{type = 2, id = 80,
		  name = lang:get(<<"第80波"/utf8>>), lev = 211,
		  unit_ids = [62110], is_reset = 0, formation = {4, 1}};
get({2, 81}) ->
    #endless_data{type = 2, id = 81,
		  name = lang:get(<<"第81波"/utf8>>), lev = 211,
		  unit_ids = [62111], is_reset = 0, formation = {5, 1}};
get({2, 82}) ->
    #endless_data{type = 2, id = 82,
		  name = lang:get(<<"第82波"/utf8>>), lev = 212,
		  unit_ids = [62112], is_reset = 0, formation = {5, 1}};
get({2, 83}) ->
    #endless_data{type = 2, id = 83,
		  name = lang:get(<<"第83波"/utf8>>), lev = 212,
		  unit_ids = [62113], is_reset = 0, formation = {6, 1}};
get({2, 84}) ->
    #endless_data{type = 2, id = 84,
		  name = lang:get(<<"第84波"/utf8>>), lev = 212,
		  unit_ids = [62114], is_reset = 0, formation = {6, 1}};
get({2, 85}) ->
    #endless_data{type = 2, id = 85,
		  name = lang:get(<<"第85波"/utf8>>), lev = 213,
		  unit_ids = [62115], is_reset = 0, formation = {1, 1}};
get({2, 86}) ->
    #endless_data{type = 2, id = 86,
		  name = lang:get(<<"第86波"/utf8>>), lev = 213,
		  unit_ids = [62116], is_reset = 0, formation = {1, 1}};
get({2, 87}) ->
    #endless_data{type = 2, id = 87,
		  name = lang:get(<<"第87波"/utf8>>), lev = 213,
		  unit_ids = [62117], is_reset = 0, formation = {2, 1}};
get({2, 88}) ->
    #endless_data{type = 2, id = 88,
		  name = lang:get(<<"第88波"/utf8>>), lev = 214,
		  unit_ids = [62118], is_reset = 0, formation = {2, 1}};
get({2, 89}) ->
    #endless_data{type = 2, id = 89,
		  name = lang:get(<<"第89波"/utf8>>), lev = 214,
		  unit_ids = [62119], is_reset = 0, formation = {3, 1}};
get({2, 90}) ->
    #endless_data{type = 2, id = 90,
		  name = lang:get(<<"第90波"/utf8>>), lev = 214,
		  unit_ids = [62120], is_reset = 0, formation = {3, 1}};
get({2, 91}) ->
    #endless_data{type = 2, id = 91,
		  name = lang:get(<<"第91波"/utf8>>), lev = 215,
		  unit_ids = [62121], is_reset = 0, formation = {4, 1}};
get({2, 92}) ->
    #endless_data{type = 2, id = 92,
		  name = lang:get(<<"第92波"/utf8>>), lev = 215,
		  unit_ids = [62122], is_reset = 0, formation = {4, 1}};
get({2, 93}) ->
    #endless_data{type = 2, id = 93,
		  name = lang:get(<<"第93波"/utf8>>), lev = 215,
		  unit_ids = [62123], is_reset = 0, formation = {5, 1}};
get({2, 94}) ->
    #endless_data{type = 2, id = 94,
		  name = lang:get(<<"第94波"/utf8>>), lev = 216,
		  unit_ids = [62109], is_reset = 0, formation = {5, 1}};
get({2, 95}) ->
    #endless_data{type = 2, id = 95,
		  name = lang:get(<<"第95波"/utf8>>), lev = 216,
		  unit_ids = [62110], is_reset = 0, formation = {6, 1}};
get({2, 96}) ->
    #endless_data{type = 2, id = 96,
		  name = lang:get(<<"第96波"/utf8>>), lev = 216,
		  unit_ids = [62111], is_reset = 0, formation = {6, 1}};
get({2, 97}) ->
    #endless_data{type = 2, id = 97,
		  name = lang:get(<<"第97波"/utf8>>), lev = 217,
		  unit_ids = [62112], is_reset = 0, formation = {1, 1}};
get({2, 98}) ->
    #endless_data{type = 2, id = 98,
		  name = lang:get(<<"第98波"/utf8>>), lev = 217,
		  unit_ids = [62113], is_reset = 0, formation = {1, 1}};
get({2, 99}) ->
    #endless_data{type = 2, id = 99,
		  name = lang:get(<<"第99波"/utf8>>), lev = 217,
		  unit_ids = [62114], is_reset = 0, formation = {2, 1}};
get({2, 100}) ->
    #endless_data{type = 2, id = 100,
		  name = lang:get(<<"第100波"/utf8>>), lev = 218,
		  unit_ids = [62115], is_reset = 0, formation = {2, 1}};
get({2, 101}) ->
    #endless_data{type = 2, id = 101,
		  name = lang:get(<<"第101波"/utf8>>), lev = 218,
		  unit_ids = [62116], is_reset = 0, formation = {3, 1}};
get({2, 102}) ->
    #endless_data{type = 2, id = 102,
		  name = lang:get(<<"第102波"/utf8>>), lev = 218,
		  unit_ids = [62117], is_reset = 0, formation = {3, 1}};
get({2, 103}) ->
    #endless_data{type = 2, id = 103,
		  name = lang:get(<<"第103波"/utf8>>), lev = 219,
		  unit_ids = [62118], is_reset = 0, formation = {4, 1}};
get({2, 104}) ->
    #endless_data{type = 2, id = 104,
		  name = lang:get(<<"第104波"/utf8>>), lev = 219,
		  unit_ids = [62119], is_reset = 0, formation = {4, 1}};
get({2, 105}) ->
    #endless_data{type = 2, id = 105,
		  name = lang:get(<<"第105波"/utf8>>), lev = 219,
		  unit_ids = [62120], is_reset = 0, formation = {5, 1}};
get({2, 106}) ->
    #endless_data{type = 2, id = 106,
		  name = lang:get(<<"第106波"/utf8>>), lev = 220,
		  unit_ids = [62121], is_reset = 0, formation = {5, 1}};
get({2, 107}) ->
    #endless_data{type = 2, id = 107,
		  name = lang:get(<<"第107波"/utf8>>), lev = 220,
		  unit_ids = [62122], is_reset = 0, formation = {6, 1}};
get({2, 108}) ->
    #endless_data{type = 2, id = 108,
		  name = lang:get(<<"第108波"/utf8>>), lev = 220,
		  unit_ids = [62123], is_reset = 0, formation = {6, 1}};
get({2, 109}) ->
    #endless_data{type = 2, id = 109,
		  name = lang:get(<<"第109波"/utf8>>), lev = 221,
		  unit_ids = [62109], is_reset = 0, formation = {1, 1}};
get({2, 110}) ->
    #endless_data{type = 2, id = 110,
		  name = lang:get(<<"第110波"/utf8>>), lev = 221,
		  unit_ids = [62110], is_reset = 0, formation = {1, 1}};
get({2, 111}) ->
    #endless_data{type = 2, id = 111,
		  name = lang:get(<<"第111波"/utf8>>), lev = 221,
		  unit_ids = [62111], is_reset = 0, formation = {2, 1}};
get({2, 112}) ->
    #endless_data{type = 2, id = 112,
		  name = lang:get(<<"第112波"/utf8>>), lev = 222,
		  unit_ids = [62112], is_reset = 0, formation = {2, 1}};
get({2, 113}) ->
    #endless_data{type = 2, id = 113,
		  name = lang:get(<<"第113波"/utf8>>), lev = 222,
		  unit_ids = [62113], is_reset = 0, formation = {3, 1}};
get({2, 114}) ->
    #endless_data{type = 2, id = 114,
		  name = lang:get(<<"第114波"/utf8>>), lev = 222,
		  unit_ids = [62114], is_reset = 0, formation = {3, 1}};
get({2, 115}) ->
    #endless_data{type = 2, id = 115,
		  name = lang:get(<<"第115波"/utf8>>), lev = 223,
		  unit_ids = [62115], is_reset = 0, formation = {4, 1}};
get({2, 116}) ->
    #endless_data{type = 2, id = 116,
		  name = lang:get(<<"第116波"/utf8>>), lev = 223,
		  unit_ids = [62116], is_reset = 0, formation = {4, 1}};
get({2, 117}) ->
    #endless_data{type = 2, id = 117,
		  name = lang:get(<<"第117波"/utf8>>), lev = 223,
		  unit_ids = [62117], is_reset = 0, formation = {5, 1}};
get({2, 118}) ->
    #endless_data{type = 2, id = 118,
		  name = lang:get(<<"第118波"/utf8>>), lev = 224,
		  unit_ids = [62118], is_reset = 0, formation = {5, 1}};
get({2, 119}) ->
    #endless_data{type = 2, id = 119,
		  name = lang:get(<<"第119波"/utf8>>), lev = 224,
		  unit_ids = [62119], is_reset = 0, formation = {6, 1}};
get({2, 120}) ->
    #endless_data{type = 2, id = 120,
		  name = lang:get(<<"第120波"/utf8>>), lev = 224,
		  unit_ids = [62120], is_reset = 0, formation = {6, 1}};
get({2, 121}) ->
    #endless_data{type = 2, id = 121,
		  name = lang:get(<<"第121波"/utf8>>), lev = 225,
		  unit_ids = [62121], is_reset = 0, formation = {1, 1}};
get({2, 122}) ->
    #endless_data{type = 2, id = 122,
		  name = lang:get(<<"第122波"/utf8>>), lev = 225,
		  unit_ids = [62122], is_reset = 0, formation = {1, 1}};
get({2, 123}) ->
    #endless_data{type = 2, id = 123,
		  name = lang:get(<<"第123波"/utf8>>), lev = 225,
		  unit_ids = [62123], is_reset = 0, formation = {2, 1}};
get({2, 124}) ->
    #endless_data{type = 2, id = 124,
		  name = lang:get(<<"第124波"/utf8>>), lev = 226,
		  unit_ids = [62109], is_reset = 0, formation = {2, 1}};
get({2, 125}) ->
    #endless_data{type = 2, id = 125,
		  name = lang:get(<<"第125波"/utf8>>), lev = 226,
		  unit_ids = [62110], is_reset = 0, formation = {3, 1}};
get({2, 126}) ->
    #endless_data{type = 2, id = 126,
		  name = lang:get(<<"第126波"/utf8>>), lev = 226,
		  unit_ids = [62111], is_reset = 0, formation = {3, 1}};
get({2, 127}) ->
    #endless_data{type = 2, id = 127,
		  name = lang:get(<<"第127波"/utf8>>), lev = 227,
		  unit_ids = [62112], is_reset = 0, formation = {4, 1}};
get({2, 128}) ->
    #endless_data{type = 2, id = 128,
		  name = lang:get(<<"第128波"/utf8>>), lev = 227,
		  unit_ids = [62113], is_reset = 0, formation = {4, 1}};
get({2, 129}) ->
    #endless_data{type = 2, id = 129,
		  name = lang:get(<<"第129波"/utf8>>), lev = 227,
		  unit_ids = [62114], is_reset = 0, formation = {5, 1}};
get({2, 130}) ->
    #endless_data{type = 2, id = 130,
		  name = lang:get(<<"第130波"/utf8>>), lev = 228,
		  unit_ids = [62115], is_reset = 0, formation = {5, 1}};
get({2, 131}) ->
    #endless_data{type = 2, id = 131,
		  name = lang:get(<<"第131波"/utf8>>), lev = 228,
		  unit_ids = [62116], is_reset = 0, formation = {6, 1}};
get({2, 132}) ->
    #endless_data{type = 2, id = 132,
		  name = lang:get(<<"第132波"/utf8>>), lev = 228,
		  unit_ids = [62117], is_reset = 0, formation = {6, 1}};
get({2, 133}) ->
    #endless_data{type = 2, id = 133,
		  name = lang:get(<<"第133波"/utf8>>), lev = 229,
		  unit_ids = [62118], is_reset = 0, formation = {1, 1}};
get({2, 134}) ->
    #endless_data{type = 2, id = 134,
		  name = lang:get(<<"第134波"/utf8>>), lev = 229,
		  unit_ids = [62119], is_reset = 0, formation = {1, 1}};
get({2, 135}) ->
    #endless_data{type = 2, id = 135,
		  name = lang:get(<<"第135波"/utf8>>), lev = 229,
		  unit_ids = [62120], is_reset = 0, formation = {2, 1}};
get({2, 136}) ->
    #endless_data{type = 2, id = 136,
		  name = lang:get(<<"第136波"/utf8>>), lev = 230,
		  unit_ids = [62121], is_reset = 0, formation = {2, 1}};
get({2, 137}) ->
    #endless_data{type = 2, id = 137,
		  name = lang:get(<<"第137波"/utf8>>), lev = 230,
		  unit_ids = [62122], is_reset = 0, formation = {3, 1}};
get({2, 138}) ->
    #endless_data{type = 2, id = 138,
		  name = lang:get(<<"第138波"/utf8>>), lev = 230,
		  unit_ids = [62123], is_reset = 0, formation = {3, 1}};
get({2, 139}) ->
    #endless_data{type = 2, id = 139,
		  name = lang:get(<<"第139波"/utf8>>), lev = 231,
		  unit_ids = [62109], is_reset = 0, formation = {4, 1}};
get({2, 140}) ->
    #endless_data{type = 2, id = 140,
		  name = lang:get(<<"第140波"/utf8>>), lev = 231,
		  unit_ids = [62110], is_reset = 0, formation = {4, 1}};
get({2, 141}) ->
    #endless_data{type = 2, id = 141,
		  name = lang:get(<<"第141波"/utf8>>), lev = 231,
		  unit_ids = [62111], is_reset = 0, formation = {5, 1}};
get({2, 142}) ->
    #endless_data{type = 2, id = 142,
		  name = lang:get(<<"第142波"/utf8>>), lev = 232,
		  unit_ids = [62112], is_reset = 0, formation = {5, 1}};
get({2, 143}) ->
    #endless_data{type = 2, id = 143,
		  name = lang:get(<<"第143波"/utf8>>), lev = 232,
		  unit_ids = [62113], is_reset = 0, formation = {6, 1}};
get({2, 144}) ->
    #endless_data{type = 2, id = 144,
		  name = lang:get(<<"第144波"/utf8>>), lev = 232,
		  unit_ids = [62114], is_reset = 0, formation = {6, 1}};
get({2, 145}) ->
    #endless_data{type = 2, id = 145,
		  name = lang:get(<<"第145波"/utf8>>), lev = 233,
		  unit_ids = [62115], is_reset = 0, formation = {1, 1}};
get({2, 146}) ->
    #endless_data{type = 2, id = 146,
		  name = lang:get(<<"第146波"/utf8>>), lev = 233,
		  unit_ids = [62116], is_reset = 0, formation = {1, 1}};
get({2, 147}) ->
    #endless_data{type = 2, id = 147,
		  name = lang:get(<<"第147波"/utf8>>), lev = 233,
		  unit_ids = [62117], is_reset = 0, formation = {2, 1}};
get({2, 148}) ->
    #endless_data{type = 2, id = 148,
		  name = lang:get(<<"第148波"/utf8>>), lev = 234,
		  unit_ids = [62118], is_reset = 0, formation = {2, 1}};
get({2, 149}) ->
    #endless_data{type = 2, id = 149,
		  name = lang:get(<<"第149波"/utf8>>), lev = 234,
		  unit_ids = [62119], is_reset = 0, formation = {3, 1}};
get({2, 150}) ->
    #endless_data{type = 2, id = 150,
		  name = lang:get(<<"第150波"/utf8>>), lev = 234,
		  unit_ids = [62120], is_reset = 0, formation = {3, 1}};
get({2, 151}) ->
    #endless_data{type = 2, id = 151,
		  name = lang:get(<<"第151波"/utf8>>), lev = 240,
		  unit_ids = [62109], is_reset = 0, formation = {1, 1}};
get({2, 152}) ->
    #endless_data{type = 2, id = 152,
		  name = lang:get(<<"第152波"/utf8>>), lev = 240,
		  unit_ids = [62110], is_reset = 0, formation = {1, 1}};
get({2, 153}) ->
    #endless_data{type = 2, id = 153,
		  name = lang:get(<<"第153波"/utf8>>), lev = 241,
		  unit_ids = [62111], is_reset = 0, formation = {2, 1}};
get({2, 154}) ->
    #endless_data{type = 2, id = 154,
		  name = lang:get(<<"第154波"/utf8>>), lev = 242,
		  unit_ids = [62112], is_reset = 0, formation = {2, 1}};
get({2, 155}) ->
    #endless_data{type = 2, id = 155,
		  name = lang:get(<<"第155波"/utf8>>), lev = 242,
		  unit_ids = [62113], is_reset = 0, formation = {3, 1}};
get({2, 156}) ->
    #endless_data{type = 2, id = 156,
		  name = lang:get(<<"第156波"/utf8>>), lev = 243,
		  unit_ids = [62114], is_reset = 0, formation = {3, 1}};
get({2, 157}) ->
    #endless_data{type = 2, id = 157,
		  name = lang:get(<<"第157波"/utf8>>), lev = 244,
		  unit_ids = [62115], is_reset = 0, formation = {4, 1}};
get({2, 158}) ->
    #endless_data{type = 2, id = 158,
		  name = lang:get(<<"第158波"/utf8>>), lev = 244,
		  unit_ids = [62116], is_reset = 0, formation = {4, 1}};
get({2, 159}) ->
    #endless_data{type = 2, id = 159,
		  name = lang:get(<<"第159波"/utf8>>), lev = 245,
		  unit_ids = [62117], is_reset = 0, formation = {5, 1}};
get({2, 160}) ->
    #endless_data{type = 2, id = 160,
		  name = lang:get(<<"第160波"/utf8>>), lev = 246,
		  unit_ids = [62118], is_reset = 0, formation = {5, 1}};
get({2, 161}) ->
    #endless_data{type = 2, id = 161,
		  name = lang:get(<<"第161波"/utf8>>), lev = 246,
		  unit_ids = [62119], is_reset = 0, formation = {6, 1}};
get({2, 162}) ->
    #endless_data{type = 2, id = 162,
		  name = lang:get(<<"第162波"/utf8>>), lev = 247,
		  unit_ids = [62120], is_reset = 0, formation = {6, 1}};
get({2, 163}) ->
    #endless_data{type = 2, id = 163,
		  name = lang:get(<<"第163波"/utf8>>), lev = 248,
		  unit_ids = [62121], is_reset = 0, formation = {1, 1}};
get({2, 164}) ->
    #endless_data{type = 2, id = 164,
		  name = lang:get(<<"第164波"/utf8>>), lev = 248,
		  unit_ids = [62122], is_reset = 0, formation = {1, 1}};
get({2, 165}) ->
    #endless_data{type = 2, id = 165,
		  name = lang:get(<<"第165波"/utf8>>), lev = 249,
		  unit_ids = [62123], is_reset = 0, formation = {2, 1}};
get({2, 166}) ->
    #endless_data{type = 2, id = 166,
		  name = lang:get(<<"第166波"/utf8>>), lev = 250,
		  unit_ids = [62109], is_reset = 0, formation = {2, 1}};
get({2, 167}) ->
    #endless_data{type = 2, id = 167,
		  name = lang:get(<<"第167波"/utf8>>), lev = 250,
		  unit_ids = [62110], is_reset = 0, formation = {3, 1}};
get({2, 168}) ->
    #endless_data{type = 2, id = 168,
		  name = lang:get(<<"第168波"/utf8>>), lev = 251,
		  unit_ids = [62111], is_reset = 0, formation = {3, 1}};
get({2, 169}) ->
    #endless_data{type = 2, id = 169,
		  name = lang:get(<<"第169波"/utf8>>), lev = 252,
		  unit_ids = [62112], is_reset = 0, formation = {4, 1}};
get({2, 170}) ->
    #endless_data{type = 2, id = 170,
		  name = lang:get(<<"第170波"/utf8>>), lev = 252,
		  unit_ids = [62113], is_reset = 0, formation = {4, 1}};
get({2, 171}) ->
    #endless_data{type = 2, id = 171,
		  name = lang:get(<<"第171波"/utf8>>), lev = 253,
		  unit_ids = [62114], is_reset = 0, formation = {5, 1}};
get({2, 172}) ->
    #endless_data{type = 2, id = 172,
		  name = lang:get(<<"第172波"/utf8>>), lev = 254,
		  unit_ids = [62115], is_reset = 0, formation = {5, 1}};
get({2, 173}) ->
    #endless_data{type = 2, id = 173,
		  name = lang:get(<<"第173波"/utf8>>), lev = 254,
		  unit_ids = [62116], is_reset = 0, formation = {6, 1}};
get({2, 174}) ->
    #endless_data{type = 2, id = 174,
		  name = lang:get(<<"第174波"/utf8>>), lev = 255,
		  unit_ids = [62117], is_reset = 0, formation = {6, 1}};
get({2, 175}) ->
    #endless_data{type = 2, id = 175,
		  name = lang:get(<<"第175波"/utf8>>), lev = 256,
		  unit_ids = [62118], is_reset = 0, formation = {1, 1}};
get({2, 176}) ->
    #endless_data{type = 2, id = 176,
		  name = lang:get(<<"第176波"/utf8>>), lev = 256,
		  unit_ids = [62119], is_reset = 0, formation = {1, 1}};
get({2, 177}) ->
    #endless_data{type = 2, id = 177,
		  name = lang:get(<<"第177波"/utf8>>), lev = 257,
		  unit_ids = [62120], is_reset = 0, formation = {2, 1}};
get({2, 178}) ->
    #endless_data{type = 2, id = 178,
		  name = lang:get(<<"第178波"/utf8>>), lev = 258,
		  unit_ids = [62121], is_reset = 0, formation = {2, 1}};
get({2, 179}) ->
    #endless_data{type = 2, id = 179,
		  name = lang:get(<<"第179波"/utf8>>), lev = 258,
		  unit_ids = [62122], is_reset = 0, formation = {3, 1}};
get({2, 180}) ->
    #endless_data{type = 2, id = 180,
		  name = lang:get(<<"第180波"/utf8>>), lev = 259,
		  unit_ids = [62123], is_reset = 0, formation = {3, 1}};
get({2, 181}) ->
    #endless_data{type = 2, id = 181,
		  name = lang:get(<<"第181波"/utf8>>), lev = 260,
		  unit_ids = [62109], is_reset = 0, formation = {4, 1}};
get({2, 182}) ->
    #endless_data{type = 2, id = 182,
		  name = lang:get(<<"第182波"/utf8>>), lev = 260,
		  unit_ids = [62110], is_reset = 0, formation = {4, 1}};
get({2, 183}) ->
    #endless_data{type = 2, id = 183,
		  name = lang:get(<<"第183波"/utf8>>), lev = 261,
		  unit_ids = [62111], is_reset = 0, formation = {5, 1}};
get({2, 184}) ->
    #endless_data{type = 2, id = 184,
		  name = lang:get(<<"第184波"/utf8>>), lev = 262,
		  unit_ids = [62112], is_reset = 0, formation = {5, 1}};
get({2, 185}) ->
    #endless_data{type = 2, id = 185,
		  name = lang:get(<<"第185波"/utf8>>), lev = 262,
		  unit_ids = [62113], is_reset = 0, formation = {6, 1}};
get({2, 186}) ->
    #endless_data{type = 2, id = 186,
		  name = lang:get(<<"第186波"/utf8>>), lev = 263,
		  unit_ids = [62114], is_reset = 0, formation = {6, 1}};
get({2, 187}) ->
    #endless_data{type = 2, id = 187,
		  name = lang:get(<<"第187波"/utf8>>), lev = 264,
		  unit_ids = [62115], is_reset = 0, formation = {1, 1}};
get({2, 188}) ->
    #endless_data{type = 2, id = 188,
		  name = lang:get(<<"第188波"/utf8>>), lev = 264,
		  unit_ids = [62116], is_reset = 0, formation = {1, 1}};
get({2, 189}) ->
    #endless_data{type = 2, id = 189,
		  name = lang:get(<<"第189波"/utf8>>), lev = 265,
		  unit_ids = [62117], is_reset = 0, formation = {2, 1}};
get({2, 190}) ->
    #endless_data{type = 2, id = 190,
		  name = lang:get(<<"第190波"/utf8>>), lev = 266,
		  unit_ids = [62118], is_reset = 0, formation = {2, 1}};
get({2, 191}) ->
    #endless_data{type = 2, id = 191,
		  name = lang:get(<<"第191波"/utf8>>), lev = 266,
		  unit_ids = [62119], is_reset = 0, formation = {3, 1}};
get({2, 192}) ->
    #endless_data{type = 2, id = 192,
		  name = lang:get(<<"第192波"/utf8>>), lev = 267,
		  unit_ids = [62120], is_reset = 0, formation = {3, 1}};
get({2, 193}) ->
    #endless_data{type = 2, id = 193,
		  name = lang:get(<<"第193波"/utf8>>), lev = 268,
		  unit_ids = [62121], is_reset = 0, formation = {4, 1}};
get({2, 194}) ->
    #endless_data{type = 2, id = 194,
		  name = lang:get(<<"第194波"/utf8>>), lev = 268,
		  unit_ids = [62122], is_reset = 0, formation = {4, 1}};
get({2, 195}) ->
    #endless_data{type = 2, id = 195,
		  name = lang:get(<<"第195波"/utf8>>), lev = 269,
		  unit_ids = [62123], is_reset = 0, formation = {5, 1}};
get({2, 196}) ->
    #endless_data{type = 2, id = 196,
		  name = lang:get(<<"第196波"/utf8>>), lev = 270,
		  unit_ids = [62109], is_reset = 0, formation = {5, 1}};
get({2, 197}) ->
    #endless_data{type = 2, id = 197,
		  name = lang:get(<<"第197波"/utf8>>), lev = 270,
		  unit_ids = [62110], is_reset = 0, formation = {6, 1}};
get({2, 198}) ->
    #endless_data{type = 2, id = 198,
		  name = lang:get(<<"第198波"/utf8>>), lev = 271,
		  unit_ids = [62111], is_reset = 0, formation = {6, 1}};
get({2, 199}) ->
    #endless_data{type = 2, id = 199,
		  name = lang:get(<<"第199波"/utf8>>), lev = 272,
		  unit_ids = [62112], is_reset = 0, formation = {1, 1}};
get({2, 200}) ->
    #endless_data{type = 2, id = 200,
		  name = lang:get(<<"第200波"/utf8>>), lev = 272,
		  unit_ids = [62113], is_reset = 0, formation = {1, 1}};
get({2, 201}) ->
    #endless_data{type = 2, id = 201,
		  name = lang:get(<<"第201波"/utf8>>), lev = 273,
		  unit_ids = [62114], is_reset = 0, formation = {2, 1}};
get({2, 202}) ->
    #endless_data{type = 2, id = 202,
		  name = lang:get(<<"第202波"/utf8>>), lev = 274,
		  unit_ids = [62115], is_reset = 0, formation = {2, 1}};
get({2, 203}) ->
    #endless_data{type = 2, id = 203,
		  name = lang:get(<<"第203波"/utf8>>), lev = 274,
		  unit_ids = [62116], is_reset = 0, formation = {3, 1}};
get({2, 204}) ->
    #endless_data{type = 2, id = 204,
		  name = lang:get(<<"第204波"/utf8>>), lev = 275,
		  unit_ids = [62117], is_reset = 0, formation = {3, 1}};
get({2, 205}) ->
    #endless_data{type = 2, id = 205,
		  name = lang:get(<<"第205波"/utf8>>), lev = 276,
		  unit_ids = [62118], is_reset = 0, formation = {4, 1}};
get({2, 206}) ->
    #endless_data{type = 2, id = 206,
		  name = lang:get(<<"第206波"/utf8>>), lev = 276,
		  unit_ids = [62119], is_reset = 0, formation = {4, 1}};
get({2, 207}) ->
    #endless_data{type = 2, id = 207,
		  name = lang:get(<<"第207波"/utf8>>), lev = 277,
		  unit_ids = [62120], is_reset = 0, formation = {5, 1}};
get({2, 208}) ->
    #endless_data{type = 2, id = 208,
		  name = lang:get(<<"第208波"/utf8>>), lev = 278,
		  unit_ids = [62121], is_reset = 0, formation = {5, 1}};
get({2, 209}) ->
    #endless_data{type = 2, id = 209,
		  name = lang:get(<<"第209波"/utf8>>), lev = 278,
		  unit_ids = [62122], is_reset = 0, formation = {6, 1}};
get({2, 210}) ->
    #endless_data{type = 2, id = 210,
		  name = lang:get(<<"第210波"/utf8>>), lev = 279,
		  unit_ids = [62123], is_reset = 0, formation = {6, 1}};
get({2, 211}) ->
    #endless_data{type = 2, id = 211,
		  name = lang:get(<<"第211波"/utf8>>), lev = 280,
		  unit_ids = [62109], is_reset = 0, formation = {1, 1}};
get({2, 212}) ->
    #endless_data{type = 2, id = 212,
		  name = lang:get(<<"第212波"/utf8>>), lev = 280,
		  unit_ids = [62110], is_reset = 0, formation = {1, 1}};
get({2, 213}) ->
    #endless_data{type = 2, id = 213,
		  name = lang:get(<<"第213波"/utf8>>), lev = 281,
		  unit_ids = [62111], is_reset = 0, formation = {2, 1}};
get({2, 214}) ->
    #endless_data{type = 2, id = 214,
		  name = lang:get(<<"第214波"/utf8>>), lev = 282,
		  unit_ids = [62112], is_reset = 0, formation = {2, 1}};
get({2, 215}) ->
    #endless_data{type = 2, id = 215,
		  name = lang:get(<<"第215波"/utf8>>), lev = 282,
		  unit_ids = [62113], is_reset = 0, formation = {3, 1}};
get({2, 216}) ->
    #endless_data{type = 2, id = 216,
		  name = lang:get(<<"第216波"/utf8>>), lev = 283,
		  unit_ids = [62114], is_reset = 0, formation = {3, 1}};
get({2, 217}) ->
    #endless_data{type = 2, id = 217,
		  name = lang:get(<<"第217波"/utf8>>), lev = 284,
		  unit_ids = [62115], is_reset = 0, formation = {4, 1}};
get({2, 218}) ->
    #endless_data{type = 2, id = 218,
		  name = lang:get(<<"第218波"/utf8>>), lev = 284,
		  unit_ids = [62116], is_reset = 0, formation = {4, 1}};
get({2, 219}) ->
    #endless_data{type = 2, id = 219,
		  name = lang:get(<<"第219波"/utf8>>), lev = 285,
		  unit_ids = [62117], is_reset = 0, formation = {5, 1}};
get({2, 220}) ->
    #endless_data{type = 2, id = 220,
		  name = lang:get(<<"第220波"/utf8>>), lev = 286,
		  unit_ids = [62118], is_reset = 0, formation = {5, 1}};
get({2, 221}) ->
    #endless_data{type = 2, id = 221,
		  name = lang:get(<<"第221波"/utf8>>), lev = 286,
		  unit_ids = [62119], is_reset = 0, formation = {6, 1}};
get({2, 222}) ->
    #endless_data{type = 2, id = 222,
		  name = lang:get(<<"第222波"/utf8>>), lev = 287,
		  unit_ids = [62120], is_reset = 0, formation = {6, 1}};
get({2, 223}) ->
    #endless_data{type = 2, id = 223,
		  name = lang:get(<<"第223波"/utf8>>), lev = 288,
		  unit_ids = [62121], is_reset = 0, formation = {1, 1}};
get({2, 224}) ->
    #endless_data{type = 2, id = 224,
		  name = lang:get(<<"第224波"/utf8>>), lev = 288,
		  unit_ids = [62122], is_reset = 0, formation = {1, 1}};
get({2, 225}) ->
    #endless_data{type = 2, id = 225,
		  name = lang:get(<<"第225波"/utf8>>), lev = 289,
		  unit_ids = [62123], is_reset = 0, formation = {2, 1}};
get({2, 226}) ->
    #endless_data{type = 2, id = 226,
		  name = lang:get(<<"第226波"/utf8>>), lev = 290,
		  unit_ids = [62109], is_reset = 0, formation = {2, 1}};
get({2, 227}) ->
    #endless_data{type = 2, id = 227,
		  name = lang:get(<<"第227波"/utf8>>), lev = 290,
		  unit_ids = [62110], is_reset = 0, formation = {3, 1}};
get({2, 228}) ->
    #endless_data{type = 2, id = 228,
		  name = lang:get(<<"第228波"/utf8>>), lev = 291,
		  unit_ids = [62111], is_reset = 0, formation = {3, 1}};
get({2, 229}) ->
    #endless_data{type = 2, id = 229,
		  name = lang:get(<<"第229波"/utf8>>), lev = 292,
		  unit_ids = [62112], is_reset = 0, formation = {4, 1}};
get({2, 230}) ->
    #endless_data{type = 2, id = 230,
		  name = lang:get(<<"第230波"/utf8>>), lev = 292,
		  unit_ids = [62113], is_reset = 0, formation = {4, 1}};
get({2, 231}) ->
    #endless_data{type = 2, id = 231,
		  name = lang:get(<<"第231波"/utf8>>), lev = 293,
		  unit_ids = [62114], is_reset = 0, formation = {5, 1}};
get({2, 232}) ->
    #endless_data{type = 2, id = 232,
		  name = lang:get(<<"第232波"/utf8>>), lev = 294,
		  unit_ids = [62115], is_reset = 0, formation = {5, 1}};
get({2, 233}) ->
    #endless_data{type = 2, id = 233,
		  name = lang:get(<<"第233波"/utf8>>), lev = 294,
		  unit_ids = [62116], is_reset = 0, formation = {6, 1}};
get({2, 234}) ->
    #endless_data{type = 2, id = 234,
		  name = lang:get(<<"第234波"/utf8>>), lev = 295,
		  unit_ids = [62117], is_reset = 0, formation = {6, 1}};
get({2, 235}) ->
    #endless_data{type = 2, id = 235,
		  name = lang:get(<<"第235波"/utf8>>), lev = 296,
		  unit_ids = [62118], is_reset = 0, formation = {1, 1}};
get({2, 236}) ->
    #endless_data{type = 2, id = 236,
		  name = lang:get(<<"第236波"/utf8>>), lev = 296,
		  unit_ids = [62119], is_reset = 0, formation = {1, 1}};
get({2, 237}) ->
    #endless_data{type = 2, id = 237,
		  name = lang:get(<<"第237波"/utf8>>), lev = 297,
		  unit_ids = [62120], is_reset = 0, formation = {2, 1}};
get({2, 238}) ->
    #endless_data{type = 2, id = 238,
		  name = lang:get(<<"第238波"/utf8>>), lev = 298,
		  unit_ids = [62121], is_reset = 0, formation = {2, 1}};
get({2, 239}) ->
    #endless_data{type = 2, id = 239,
		  name = lang:get(<<"第239波"/utf8>>), lev = 298,
		  unit_ids = [62122], is_reset = 0, formation = {3, 1}};
get({2, 240}) ->
    #endless_data{type = 2, id = 240,
		  name = lang:get(<<"第240波"/utf8>>), lev = 299,
		  unit_ids = [62123], is_reset = 0, formation = {3, 1}};
get({2, 241}) ->
    #endless_data{type = 2, id = 241,
		  name = lang:get(<<"第241波"/utf8>>), lev = 300,
		  unit_ids = [62109], is_reset = 0, formation = {4, 1}};
get({2, 242}) ->
    #endless_data{type = 2, id = 242,
		  name = lang:get(<<"第242波"/utf8>>), lev = 300,
		  unit_ids = [62110], is_reset = 0, formation = {4, 1}};
get({2, 243}) ->
    #endless_data{type = 2, id = 243,
		  name = lang:get(<<"第243波"/utf8>>), lev = 301,
		  unit_ids = [62111], is_reset = 0, formation = {5, 1}};
get({2, 244}) ->
    #endless_data{type = 2, id = 244,
		  name = lang:get(<<"第244波"/utf8>>), lev = 302,
		  unit_ids = [62112], is_reset = 0, formation = {5, 1}};
get({2, 245}) ->
    #endless_data{type = 2, id = 245,
		  name = lang:get(<<"第245波"/utf8>>), lev = 302,
		  unit_ids = [62113], is_reset = 0, formation = {6, 1}};
get({2, 246}) ->
    #endless_data{type = 2, id = 246,
		  name = lang:get(<<"第246波"/utf8>>), lev = 303,
		  unit_ids = [62114], is_reset = 0, formation = {6, 1}};
get({2, 247}) ->
    #endless_data{type = 2, id = 247,
		  name = lang:get(<<"第247波"/utf8>>), lev = 304,
		  unit_ids = [62115], is_reset = 0, formation = {1, 1}};
get({2, 248}) ->
    #endless_data{type = 2, id = 248,
		  name = lang:get(<<"第248波"/utf8>>), lev = 304,
		  unit_ids = [62116], is_reset = 0, formation = {1, 1}};
get({2, 249}) ->
    #endless_data{type = 2, id = 249,
		  name = lang:get(<<"第249波"/utf8>>), lev = 305,
		  unit_ids = [62117], is_reset = 0, formation = {2, 1}};
get({2, 250}) ->
    #endless_data{type = 2, id = 250,
		  name = lang:get(<<"第250波"/utf8>>), lev = 306,
		  unit_ids = [62118], is_reset = 0, formation = {2, 1}};
get({2, 251}) ->
    #endless_data{type = 2, id = 251,
		  name = lang:get(<<"第251波"/utf8>>), lev = 306,
		  unit_ids = [62119], is_reset = 0, formation = {3, 1}};
get({2, 252}) ->
    #endless_data{type = 2, id = 252,
		  name = lang:get(<<"第252波"/utf8>>), lev = 307,
		  unit_ids = [62120], is_reset = 0, formation = {3, 1}};
get({2, 253}) ->
    #endless_data{type = 2, id = 253,
		  name = lang:get(<<"第253波"/utf8>>), lev = 308,
		  unit_ids = [62121], is_reset = 0, formation = {4, 1}};
get({2, 254}) ->
    #endless_data{type = 2, id = 254,
		  name = lang:get(<<"第254波"/utf8>>), lev = 308,
		  unit_ids = [62122], is_reset = 0, formation = {4, 1}};
get({2, 255}) ->
    #endless_data{type = 2, id = 255,
		  name = lang:get(<<"第255波"/utf8>>), lev = 309,
		  unit_ids = [62123], is_reset = 0, formation = {5, 1}};
get({2, 256}) ->
    #endless_data{type = 2, id = 256,
		  name = lang:get(<<"第256波"/utf8>>), lev = 310,
		  unit_ids = [62109], is_reset = 0, formation = {5, 1}};
get({2, 257}) ->
    #endless_data{type = 2, id = 257,
		  name = lang:get(<<"第257波"/utf8>>), lev = 310,
		  unit_ids = [62110], is_reset = 0, formation = {6, 1}};
get({2, 258}) ->
    #endless_data{type = 2, id = 258,
		  name = lang:get(<<"第258波"/utf8>>), lev = 311,
		  unit_ids = [62111], is_reset = 0, formation = {6, 1}};
get({2, 259}) ->
    #endless_data{type = 2, id = 259,
		  name = lang:get(<<"第259波"/utf8>>), lev = 312,
		  unit_ids = [62112], is_reset = 0, formation = {1, 1}};
get({2, 260}) ->
    #endless_data{type = 2, id = 260,
		  name = lang:get(<<"第260波"/utf8>>), lev = 312,
		  unit_ids = [62113], is_reset = 0, formation = {1, 1}};
get({2, 261}) ->
    #endless_data{type = 2, id = 261,
		  name = lang:get(<<"第261波"/utf8>>), lev = 313,
		  unit_ids = [62114], is_reset = 0, formation = {2, 1}};
get({2, 262}) ->
    #endless_data{type = 2, id = 262,
		  name = lang:get(<<"第262波"/utf8>>), lev = 314,
		  unit_ids = [62115], is_reset = 0, formation = {2, 1}};
get({2, 263}) ->
    #endless_data{type = 2, id = 263,
		  name = lang:get(<<"第263波"/utf8>>), lev = 314,
		  unit_ids = [62116], is_reset = 0, formation = {3, 1}};
get({2, 264}) ->
    #endless_data{type = 2, id = 264,
		  name = lang:get(<<"第264波"/utf8>>), lev = 315,
		  unit_ids = [62117], is_reset = 0, formation = {3, 1}};
get({2, 265}) ->
    #endless_data{type = 2, id = 265,
		  name = lang:get(<<"第265波"/utf8>>), lev = 316,
		  unit_ids = [62118], is_reset = 0, formation = {4, 1}};
get({2, 266}) ->
    #endless_data{type = 2, id = 266,
		  name = lang:get(<<"第266波"/utf8>>), lev = 316,
		  unit_ids = [62119], is_reset = 0, formation = {4, 1}};
get({2, 267}) ->
    #endless_data{type = 2, id = 267,
		  name = lang:get(<<"第267波"/utf8>>), lev = 317,
		  unit_ids = [62120], is_reset = 0, formation = {5, 1}};
get({2, 268}) ->
    #endless_data{type = 2, id = 268,
		  name = lang:get(<<"第268波"/utf8>>), lev = 318,
		  unit_ids = [62121], is_reset = 0, formation = {5, 1}};
get({2, 269}) ->
    #endless_data{type = 2, id = 269,
		  name = lang:get(<<"第269波"/utf8>>), lev = 318,
		  unit_ids = [62122], is_reset = 0, formation = {6, 1}};
get({2, 270}) ->
    #endless_data{type = 2, id = 270,
		  name = lang:get(<<"第270波"/utf8>>), lev = 319,
		  unit_ids = [62123], is_reset = 0, formation = {6, 1}};
get({2, 271}) ->
    #endless_data{type = 2, id = 271,
		  name = lang:get(<<"第271波"/utf8>>), lev = 320,
		  unit_ids = [62109], is_reset = 0, formation = {1, 1}};
get({2, 272}) ->
    #endless_data{type = 2, id = 272,
		  name = lang:get(<<"第272波"/utf8>>), lev = 320,
		  unit_ids = [62110], is_reset = 0, formation = {1, 1}};
get({2, 273}) ->
    #endless_data{type = 2, id = 273,
		  name = lang:get(<<"第273波"/utf8>>), lev = 321,
		  unit_ids = [62111], is_reset = 0, formation = {2, 1}};
get({2, 274}) ->
    #endless_data{type = 2, id = 274,
		  name = lang:get(<<"第274波"/utf8>>), lev = 322,
		  unit_ids = [62112], is_reset = 0, formation = {2, 1}};
get({2, 275}) ->
    #endless_data{type = 2, id = 275,
		  name = lang:get(<<"第275波"/utf8>>), lev = 322,
		  unit_ids = [62113], is_reset = 0, formation = {3, 1}};
get({2, 276}) ->
    #endless_data{type = 2, id = 276,
		  name = lang:get(<<"第276波"/utf8>>), lev = 323,
		  unit_ids = [62114], is_reset = 0, formation = {3, 1}};
get({2, 277}) ->
    #endless_data{type = 2, id = 277,
		  name = lang:get(<<"第277波"/utf8>>), lev = 324,
		  unit_ids = [62115], is_reset = 0, formation = {4, 1}};
get({2, 278}) ->
    #endless_data{type = 2, id = 278,
		  name = lang:get(<<"第278波"/utf8>>), lev = 324,
		  unit_ids = [62116], is_reset = 0, formation = {4, 1}};
get({2, 279}) ->
    #endless_data{type = 2, id = 279,
		  name = lang:get(<<"第279波"/utf8>>), lev = 325,
		  unit_ids = [62117], is_reset = 0, formation = {5, 1}};
get({2, 280}) ->
    #endless_data{type = 2, id = 280,
		  name = lang:get(<<"第280波"/utf8>>), lev = 326,
		  unit_ids = [62118], is_reset = 0, formation = {5, 1}};
get({2, 281}) ->
    #endless_data{type = 2, id = 281,
		  name = lang:get(<<"第281波"/utf8>>), lev = 326,
		  unit_ids = [62119], is_reset = 0, formation = {6, 1}};
get({2, 282}) ->
    #endless_data{type = 2, id = 282,
		  name = lang:get(<<"第282波"/utf8>>), lev = 327,
		  unit_ids = [62120], is_reset = 0, formation = {6, 1}};
get({2, 283}) ->
    #endless_data{type = 2, id = 283,
		  name = lang:get(<<"第283波"/utf8>>), lev = 328,
		  unit_ids = [62121], is_reset = 0, formation = {1, 1}};
get({2, 284}) ->
    #endless_data{type = 2, id = 284,
		  name = lang:get(<<"第284波"/utf8>>), lev = 328,
		  unit_ids = [62122], is_reset = 0, formation = {1, 1}};
get({2, 285}) ->
    #endless_data{type = 2, id = 285,
		  name = lang:get(<<"第285波"/utf8>>), lev = 329,
		  unit_ids = [62123], is_reset = 0, formation = {2, 1}};
get({2, 286}) ->
    #endless_data{type = 2, id = 286,
		  name = lang:get(<<"第286波"/utf8>>), lev = 330,
		  unit_ids = [62109], is_reset = 0, formation = {2, 1}};
get({2, 287}) ->
    #endless_data{type = 2, id = 287,
		  name = lang:get(<<"第287波"/utf8>>), lev = 330,
		  unit_ids = [62110], is_reset = 0, formation = {3, 1}};
get({2, 288}) ->
    #endless_data{type = 2, id = 288,
		  name = lang:get(<<"第288波"/utf8>>), lev = 331,
		  unit_ids = [62111], is_reset = 0, formation = {3, 1}};
get({2, 289}) ->
    #endless_data{type = 2, id = 289,
		  name = lang:get(<<"第289波"/utf8>>), lev = 332,
		  unit_ids = [62112], is_reset = 0, formation = {4, 1}};
get({2, 290}) ->
    #endless_data{type = 2, id = 290,
		  name = lang:get(<<"第290波"/utf8>>), lev = 332,
		  unit_ids = [62113], is_reset = 0, formation = {4, 1}};
get({2, 291}) ->
    #endless_data{type = 2, id = 291,
		  name = lang:get(<<"第291波"/utf8>>), lev = 333,
		  unit_ids = [62114], is_reset = 0, formation = {5, 1}};
get({2, 292}) ->
    #endless_data{type = 2, id = 292,
		  name = lang:get(<<"第292波"/utf8>>), lev = 334,
		  unit_ids = [62115], is_reset = 0, formation = {5, 1}};
get({2, 293}) ->
    #endless_data{type = 2, id = 293,
		  name = lang:get(<<"第293波"/utf8>>), lev = 334,
		  unit_ids = [62116], is_reset = 0, formation = {6, 1}};
get({2, 294}) ->
    #endless_data{type = 2, id = 294,
		  name = lang:get(<<"第294波"/utf8>>), lev = 335,
		  unit_ids = [62117], is_reset = 0, formation = {6, 1}};
get({2, 295}) ->
    #endless_data{type = 2, id = 295,
		  name = lang:get(<<"第295波"/utf8>>), lev = 336,
		  unit_ids = [62118], is_reset = 0, formation = {1, 1}};
get({2, 296}) ->
    #endless_data{type = 2, id = 296,
		  name = lang:get(<<"第296波"/utf8>>), lev = 336,
		  unit_ids = [62119], is_reset = 0, formation = {1, 1}};
get({2, 297}) ->
    #endless_data{type = 2, id = 297,
		  name = lang:get(<<"第297波"/utf8>>), lev = 337,
		  unit_ids = [62120], is_reset = 0, formation = {2, 1}};
get({2, 298}) ->
    #endless_data{type = 2, id = 298,
		  name = lang:get(<<"第298波"/utf8>>), lev = 338,
		  unit_ids = [62121], is_reset = 0, formation = {2, 1}};
get({2, 299}) ->
    #endless_data{type = 2, id = 299,
		  name = lang:get(<<"第299波"/utf8>>), lev = 338,
		  unit_ids = [62122], is_reset = 0, formation = {3, 1}};
get({2, 300}) ->
    #endless_data{type = 2, id = 300,
		  name = lang:get(<<"第300波"/utf8>>), lev = 339,
		  unit_ids = [62123], is_reset = 0, formation = {3, 1}};
get({2, 301}) ->
    #endless_data{type = 2, id = 301,
		  name = lang:get(<<"第301波"/utf8>>), lev = 340,
		  unit_ids = [62109], is_reset = 0, formation = {4, 1}};
get({2, 302}) ->
    #endless_data{type = 2, id = 302,
		  name = lang:get(<<"第302波"/utf8>>), lev = 340,
		  unit_ids = [62110], is_reset = 0, formation = {4, 1}};
get({2, 303}) ->
    #endless_data{type = 2, id = 303,
		  name = lang:get(<<"第303波"/utf8>>), lev = 341,
		  unit_ids = [62111], is_reset = 0, formation = {5, 1}};
get({2, 304}) ->
    #endless_data{type = 2, id = 304,
		  name = lang:get(<<"第304波"/utf8>>), lev = 342,
		  unit_ids = [62112], is_reset = 0, formation = {5, 1}};
get({2, 305}) ->
    #endless_data{type = 2, id = 305,
		  name = lang:get(<<"第305波"/utf8>>), lev = 342,
		  unit_ids = [62113], is_reset = 0, formation = {6, 1}};
get({2, 306}) ->
    #endless_data{type = 2, id = 306,
		  name = lang:get(<<"第306波"/utf8>>), lev = 343,
		  unit_ids = [62114], is_reset = 0, formation = {6, 1}};
get({2, 307}) ->
    #endless_data{type = 2, id = 307,
		  name = lang:get(<<"第307波"/utf8>>), lev = 344,
		  unit_ids = [62115], is_reset = 0, formation = {1, 1}};
get({2, 308}) ->
    #endless_data{type = 2, id = 308,
		  name = lang:get(<<"第308波"/utf8>>), lev = 344,
		  unit_ids = [62116], is_reset = 0, formation = {1, 1}};
get({2, 309}) ->
    #endless_data{type = 2, id = 309,
		  name = lang:get(<<"第309波"/utf8>>), lev = 345,
		  unit_ids = [62117], is_reset = 0, formation = {2, 1}};
get({2, 310}) ->
    #endless_data{type = 2, id = 310,
		  name = lang:get(<<"第310波"/utf8>>), lev = 346,
		  unit_ids = [62118], is_reset = 0, formation = {2, 1}};
get({2, 311}) ->
    #endless_data{type = 2, id = 311,
		  name = lang:get(<<"第311波"/utf8>>), lev = 346,
		  unit_ids = [62119], is_reset = 0, formation = {3, 1}};
get({2, 312}) ->
    #endless_data{type = 2, id = 312,
		  name = lang:get(<<"第312波"/utf8>>), lev = 347,
		  unit_ids = [62120], is_reset = 0, formation = {3, 1}};
get({2, 313}) ->
    #endless_data{type = 2, id = 313,
		  name = lang:get(<<"第313波"/utf8>>), lev = 348,
		  unit_ids = [62121], is_reset = 0, formation = {4, 1}};
get({2, 314}) ->
    #endless_data{type = 2, id = 314,
		  name = lang:get(<<"第314波"/utf8>>), lev = 348,
		  unit_ids = [62122], is_reset = 0, formation = {4, 1}};
get({2, 315}) ->
    #endless_data{type = 2, id = 315,
		  name = lang:get(<<"第315波"/utf8>>), lev = 349,
		  unit_ids = [62123], is_reset = 0, formation = {5, 1}};
get({2, 316}) ->
    #endless_data{type = 2, id = 316,
		  name = lang:get(<<"第316波"/utf8>>), lev = 350,
		  unit_ids = [62109], is_reset = 0, formation = {5, 1}};
get({2, 317}) ->
    #endless_data{type = 2, id = 317,
		  name = lang:get(<<"第317波"/utf8>>), lev = 350,
		  unit_ids = [62110], is_reset = 0, formation = {6, 1}};
get({2, 318}) ->
    #endless_data{type = 2, id = 318,
		  name = lang:get(<<"第318波"/utf8>>), lev = 351,
		  unit_ids = [62111], is_reset = 0, formation = {6, 1}};
get({2, 319}) ->
    #endless_data{type = 2, id = 319,
		  name = lang:get(<<"第319波"/utf8>>), lev = 352,
		  unit_ids = [62112], is_reset = 0, formation = {1, 1}};
get({2, 320}) ->
    #endless_data{type = 2, id = 320,
		  name = lang:get(<<"第320波"/utf8>>), lev = 352,
		  unit_ids = [62113], is_reset = 0, formation = {1, 1}};
get({2, 321}) ->
    #endless_data{type = 2, id = 321,
		  name = lang:get(<<"第321波"/utf8>>), lev = 353,
		  unit_ids = [62114], is_reset = 0, formation = {2, 1}};
get({2, 322}) ->
    #endless_data{type = 2, id = 322,
		  name = lang:get(<<"第322波"/utf8>>), lev = 354,
		  unit_ids = [62115], is_reset = 0, formation = {2, 1}};
get({2, 323}) ->
    #endless_data{type = 2, id = 323,
		  name = lang:get(<<"第323波"/utf8>>), lev = 354,
		  unit_ids = [62116], is_reset = 0, formation = {3, 1}};
get({2, 324}) ->
    #endless_data{type = 2, id = 324,
		  name = lang:get(<<"第324波"/utf8>>), lev = 355,
		  unit_ids = [62117], is_reset = 0, formation = {3, 1}};
get({2, 325}) ->
    #endless_data{type = 2, id = 325,
		  name = lang:get(<<"第325波"/utf8>>), lev = 356,
		  unit_ids = [62118], is_reset = 0, formation = {4, 1}};
get({2, 326}) ->
    #endless_data{type = 2, id = 326,
		  name = lang:get(<<"第326波"/utf8>>), lev = 356,
		  unit_ids = [62119], is_reset = 0, formation = {4, 1}};
get({2, 327}) ->
    #endless_data{type = 2, id = 327,
		  name = lang:get(<<"第327波"/utf8>>), lev = 357,
		  unit_ids = [62120], is_reset = 0, formation = {5, 1}};
get({2, 328}) ->
    #endless_data{type = 2, id = 328,
		  name = lang:get(<<"第328波"/utf8>>), lev = 358,
		  unit_ids = [62121], is_reset = 0, formation = {5, 1}};
get({2, 329}) ->
    #endless_data{type = 2, id = 329,
		  name = lang:get(<<"第329波"/utf8>>), lev = 358,
		  unit_ids = [62122], is_reset = 0, formation = {6, 1}};
get({2, 330}) ->
    #endless_data{type = 2, id = 330,
		  name = lang:get(<<"第330波"/utf8>>), lev = 359,
		  unit_ids = [62123], is_reset = 0, formation = {6, 1}};
get({2, 331}) ->
    #endless_data{type = 2, id = 331,
		  name = lang:get(<<"第331波"/utf8>>), lev = 360,
		  unit_ids = [62109], is_reset = 0, formation = {1, 1}};
get({2, 332}) ->
    #endless_data{type = 2, id = 332,
		  name = lang:get(<<"第332波"/utf8>>), lev = 360,
		  unit_ids = [62110], is_reset = 0, formation = {1, 1}};
get({2, 333}) ->
    #endless_data{type = 2, id = 333,
		  name = lang:get(<<"第333波"/utf8>>), lev = 361,
		  unit_ids = [62111], is_reset = 0, formation = {2, 1}};
get({2, 334}) ->
    #endless_data{type = 2, id = 334,
		  name = lang:get(<<"第334波"/utf8>>), lev = 362,
		  unit_ids = [62112], is_reset = 0, formation = {2, 1}};
get({2, 335}) ->
    #endless_data{type = 2, id = 335,
		  name = lang:get(<<"第335波"/utf8>>), lev = 362,
		  unit_ids = [62113], is_reset = 0, formation = {3, 1}};
get({2, 336}) ->
    #endless_data{type = 2, id = 336,
		  name = lang:get(<<"第336波"/utf8>>), lev = 363,
		  unit_ids = [62114], is_reset = 0, formation = {3, 1}};
get({2, 337}) ->
    #endless_data{type = 2, id = 337,
		  name = lang:get(<<"第337波"/utf8>>), lev = 364,
		  unit_ids = [62115], is_reset = 0, formation = {4, 1}};
get({2, 338}) ->
    #endless_data{type = 2, id = 338,
		  name = lang:get(<<"第338波"/utf8>>), lev = 364,
		  unit_ids = [62116], is_reset = 0, formation = {4, 1}};
get({2, 339}) ->
    #endless_data{type = 2, id = 339,
		  name = lang:get(<<"第339波"/utf8>>), lev = 365,
		  unit_ids = [62117], is_reset = 0, formation = {5, 1}};
get({2, 340}) ->
    #endless_data{type = 2, id = 340,
		  name = lang:get(<<"第340波"/utf8>>), lev = 366,
		  unit_ids = [62118], is_reset = 0, formation = {5, 1}};
get({2, 341}) ->
    #endless_data{type = 2, id = 341,
		  name = lang:get(<<"第341波"/utf8>>), lev = 366,
		  unit_ids = [62119], is_reset = 0, formation = {6, 1}};
get({2, 342}) ->
    #endless_data{type = 2, id = 342,
		  name = lang:get(<<"第342波"/utf8>>), lev = 367,
		  unit_ids = [62120], is_reset = 0, formation = {6, 1}};
get({2, 343}) ->
    #endless_data{type = 2, id = 343,
		  name = lang:get(<<"第343波"/utf8>>), lev = 368,
		  unit_ids = [62121], is_reset = 0, formation = {1, 1}};
get({2, 344}) ->
    #endless_data{type = 2, id = 344,
		  name = lang:get(<<"第344波"/utf8>>), lev = 368,
		  unit_ids = [62122], is_reset = 0, formation = {1, 1}};
get({2, 345}) ->
    #endless_data{type = 2, id = 345,
		  name = lang:get(<<"第345波"/utf8>>), lev = 369,
		  unit_ids = [62123], is_reset = 0, formation = {2, 1}};
get({2, 346}) ->
    #endless_data{type = 2, id = 346,
		  name = lang:get(<<"第346波"/utf8>>), lev = 370,
		  unit_ids = [62109], is_reset = 0, formation = {2, 1}};
get({2, 347}) ->
    #endless_data{type = 2, id = 347,
		  name = lang:get(<<"第347波"/utf8>>), lev = 370,
		  unit_ids = [62110], is_reset = 0, formation = {3, 1}};
get({2, 348}) ->
    #endless_data{type = 2, id = 348,
		  name = lang:get(<<"第348波"/utf8>>), lev = 371,
		  unit_ids = [62111], is_reset = 0, formation = {3, 1}};
get({2, 349}) ->
    #endless_data{type = 2, id = 349,
		  name = lang:get(<<"第349波"/utf8>>), lev = 372,
		  unit_ids = [62112], is_reset = 0, formation = {4, 1}};
get({2, 350}) ->
    #endless_data{type = 2, id = 350,
		  name = lang:get(<<"第350波"/utf8>>), lev = 372,
		  unit_ids = [62113], is_reset = 0, formation = {4, 1}};
get({2, 351}) ->
    #endless_data{type = 2, id = 351,
		  name = lang:get(<<"第351波"/utf8>>), lev = 373,
		  unit_ids = [62114], is_reset = 0, formation = {5, 1}};
get({2, 352}) ->
    #endless_data{type = 2, id = 352,
		  name = lang:get(<<"第352波"/utf8>>), lev = 374,
		  unit_ids = [62115], is_reset = 0, formation = {5, 1}};
get({2, 353}) ->
    #endless_data{type = 2, id = 353,
		  name = lang:get(<<"第353波"/utf8>>), lev = 374,
		  unit_ids = [62116], is_reset = 0, formation = {6, 1}};
get({2, 354}) ->
    #endless_data{type = 2, id = 354,
		  name = lang:get(<<"第354波"/utf8>>), lev = 375,
		  unit_ids = [62117], is_reset = 0, formation = {6, 1}};
get({2, 355}) ->
    #endless_data{type = 2, id = 355,
		  name = lang:get(<<"第355波"/utf8>>), lev = 376,
		  unit_ids = [62118], is_reset = 0, formation = {1, 1}};
get({2, 356}) ->
    #endless_data{type = 2, id = 356,
		  name = lang:get(<<"第356波"/utf8>>), lev = 376,
		  unit_ids = [62119], is_reset = 0, formation = {1, 1}};
get({2, 357}) ->
    #endless_data{type = 2, id = 357,
		  name = lang:get(<<"第357波"/utf8>>), lev = 377,
		  unit_ids = [62120], is_reset = 0, formation = {2, 1}};
get({2, 358}) ->
    #endless_data{type = 2, id = 358,
		  name = lang:get(<<"第358波"/utf8>>), lev = 378,
		  unit_ids = [62121], is_reset = 0, formation = {2, 1}};
get({2, 359}) ->
    #endless_data{type = 2, id = 359,
		  name = lang:get(<<"第359波"/utf8>>), lev = 378,
		  unit_ids = [62122], is_reset = 0, formation = {3, 1}};
get({2, 360}) ->
    #endless_data{type = 2, id = 360,
		  name = lang:get(<<"第360波"/utf8>>), lev = 379,
		  unit_ids = [62123], is_reset = 0, formation = {3, 1}};
get({2, 361}) ->
    #endless_data{type = 2, id = 361,
		  name = lang:get(<<"第361波"/utf8>>), lev = 380,
		  unit_ids = [62109], is_reset = 0, formation = {4, 1}};
get({2, 362}) ->
    #endless_data{type = 2, id = 362,
		  name = lang:get(<<"第362波"/utf8>>), lev = 380,
		  unit_ids = [62110], is_reset = 0, formation = {4, 1}};
get({2, 363}) ->
    #endless_data{type = 2, id = 363,
		  name = lang:get(<<"第363波"/utf8>>), lev = 381,
		  unit_ids = [62111], is_reset = 0, formation = {5, 1}};
get({2, 364}) ->
    #endless_data{type = 2, id = 364,
		  name = lang:get(<<"第364波"/utf8>>), lev = 382,
		  unit_ids = [62112], is_reset = 0, formation = {5, 1}};
get({2, 365}) ->
    #endless_data{type = 2, id = 365,
		  name = lang:get(<<"第365波"/utf8>>), lev = 382,
		  unit_ids = [62113], is_reset = 0, formation = {6, 1}};
get({2, 366}) ->
    #endless_data{type = 2, id = 366,
		  name = lang:get(<<"第366波"/utf8>>), lev = 383,
		  unit_ids = [62114], is_reset = 0, formation = {6, 1}};
get({2, 367}) ->
    #endless_data{type = 2, id = 367,
		  name = lang:get(<<"第367波"/utf8>>), lev = 384,
		  unit_ids = [62115], is_reset = 0, formation = {1, 1}};
get({2, 368}) ->
    #endless_data{type = 2, id = 368,
		  name = lang:get(<<"第368波"/utf8>>), lev = 384,
		  unit_ids = [62116], is_reset = 0, formation = {1, 1}};
get({2, 369}) ->
    #endless_data{type = 2, id = 369,
		  name = lang:get(<<"第369波"/utf8>>), lev = 385,
		  unit_ids = [62117], is_reset = 0, formation = {2, 1}};
get({2, 370}) ->
    #endless_data{type = 2, id = 370,
		  name = lang:get(<<"第370波"/utf8>>), lev = 386,
		  unit_ids = [62118], is_reset = 0, formation = {2, 1}};
get({2, 371}) ->
    #endless_data{type = 2, id = 371,
		  name = lang:get(<<"第371波"/utf8>>), lev = 386,
		  unit_ids = [62119], is_reset = 0, formation = {3, 1}};
get({2, 372}) ->
    #endless_data{type = 2, id = 372,
		  name = lang:get(<<"第372波"/utf8>>), lev = 387,
		  unit_ids = [62120], is_reset = 0, formation = {3, 1}};
get({2, 373}) ->
    #endless_data{type = 2, id = 373,
		  name = lang:get(<<"第373波"/utf8>>), lev = 388,
		  unit_ids = [62121], is_reset = 0, formation = {4, 1}};
get({2, 374}) ->
    #endless_data{type = 2, id = 374,
		  name = lang:get(<<"第374波"/utf8>>), lev = 388,
		  unit_ids = [62122], is_reset = 0, formation = {4, 1}};
get({2, 375}) ->
    #endless_data{type = 2, id = 375,
		  name = lang:get(<<"第375波"/utf8>>), lev = 389,
		  unit_ids = [62123], is_reset = 0, formation = {5, 1}};
get({2, 376}) ->
    #endless_data{type = 2, id = 376,
		  name = lang:get(<<"第376波"/utf8>>), lev = 390,
		  unit_ids = [62109], is_reset = 0, formation = {5, 1}};
get({2, 377}) ->
    #endless_data{type = 2, id = 377,
		  name = lang:get(<<"第377波"/utf8>>), lev = 390,
		  unit_ids = [62110], is_reset = 0, formation = {6, 1}};
get({2, 378}) ->
    #endless_data{type = 2, id = 378,
		  name = lang:get(<<"第378波"/utf8>>), lev = 391,
		  unit_ids = [62111], is_reset = 0, formation = {6, 1}};
get({2, 379}) ->
    #endless_data{type = 2, id = 379,
		  name = lang:get(<<"第379波"/utf8>>), lev = 392,
		  unit_ids = [62112], is_reset = 0, formation = {1, 1}};
get({2, 380}) ->
    #endless_data{type = 2, id = 380,
		  name = lang:get(<<"第380波"/utf8>>), lev = 392,
		  unit_ids = [62113], is_reset = 0, formation = {1, 1}};
get({2, 381}) ->
    #endless_data{type = 2, id = 381,
		  name = lang:get(<<"第381波"/utf8>>), lev = 393,
		  unit_ids = [62114], is_reset = 0, formation = {2, 1}};
get({2, 382}) ->
    #endless_data{type = 2, id = 382,
		  name = lang:get(<<"第382波"/utf8>>), lev = 394,
		  unit_ids = [62115], is_reset = 0, formation = {2, 1}};
get({2, 383}) ->
    #endless_data{type = 2, id = 383,
		  name = lang:get(<<"第383波"/utf8>>), lev = 394,
		  unit_ids = [62116], is_reset = 0, formation = {3, 1}};
get({2, 384}) ->
    #endless_data{type = 2, id = 384,
		  name = lang:get(<<"第384波"/utf8>>), lev = 395,
		  unit_ids = [62117], is_reset = 0, formation = {3, 1}};
get({2, 385}) ->
    #endless_data{type = 2, id = 385,
		  name = lang:get(<<"第385波"/utf8>>), lev = 396,
		  unit_ids = [62118], is_reset = 0, formation = {4, 1}};
get({2, 386}) ->
    #endless_data{type = 2, id = 386,
		  name = lang:get(<<"第386波"/utf8>>), lev = 396,
		  unit_ids = [62119], is_reset = 0, formation = {4, 1}};
get({2, 387}) ->
    #endless_data{type = 2, id = 387,
		  name = lang:get(<<"第387波"/utf8>>), lev = 397,
		  unit_ids = [62120], is_reset = 0, formation = {5, 1}};
get({2, 388}) ->
    #endless_data{type = 2, id = 388,
		  name = lang:get(<<"第388波"/utf8>>), lev = 398,
		  unit_ids = [62121], is_reset = 0, formation = {5, 1}};
get({2, 389}) ->
    #endless_data{type = 2, id = 389,
		  name = lang:get(<<"第389波"/utf8>>), lev = 398,
		  unit_ids = [62122], is_reset = 0, formation = {6, 1}};
get({2, 390}) ->
    #endless_data{type = 2, id = 390,
		  name = lang:get(<<"第390波"/utf8>>), lev = 399,
		  unit_ids = [62123], is_reset = 0, formation = {6, 1}};
get({2, 391}) ->
    #endless_data{type = 2, id = 391,
		  name = lang:get(<<"第391波"/utf8>>), lev = 400,
		  unit_ids = [62109], is_reset = 0, formation = {1, 1}};
get({2, 392}) ->
    #endless_data{type = 2, id = 392,
		  name = lang:get(<<"第392波"/utf8>>), lev = 400,
		  unit_ids = [62110], is_reset = 0, formation = {1, 1}};
get({2, 393}) ->
    #endless_data{type = 2, id = 393,
		  name = lang:get(<<"第393波"/utf8>>), lev = 401,
		  unit_ids = [62111], is_reset = 0, formation = {2, 1}};
get({2, 394}) ->
    #endless_data{type = 2, id = 394,
		  name = lang:get(<<"第394波"/utf8>>), lev = 402,
		  unit_ids = [62112], is_reset = 0, formation = {2, 1}};
get({2, 395}) ->
    #endless_data{type = 2, id = 395,
		  name = lang:get(<<"第395波"/utf8>>), lev = 402,
		  unit_ids = [62113], is_reset = 0, formation = {3, 1}};
get({2, 396}) ->
    #endless_data{type = 2, id = 396,
		  name = lang:get(<<"第396波"/utf8>>), lev = 403,
		  unit_ids = [62114], is_reset = 0, formation = {3, 1}};
get({2, 397}) ->
    #endless_data{type = 2, id = 397,
		  name = lang:get(<<"第397波"/utf8>>), lev = 404,
		  unit_ids = [62115], is_reset = 0, formation = {4, 1}};
get({2, 398}) ->
    #endless_data{type = 2, id = 398,
		  name = lang:get(<<"第398波"/utf8>>), lev = 404,
		  unit_ids = [62116], is_reset = 0, formation = {4, 1}};
get({2, 399}) ->
    #endless_data{type = 2, id = 399,
		  name = lang:get(<<"第399波"/utf8>>), lev = 405,
		  unit_ids = [62117], is_reset = 0, formation = {5, 1}};
get({2, 400}) ->
    #endless_data{type = 2, id = 400,
		  name = lang:get(<<"第400波"/utf8>>), lev = 406,
		  unit_ids = [62118], is_reset = 0, formation = {5, 1}};
get({2, 401}) ->
    #endless_data{type = 2, id = 401,
		  name = lang:get(<<"第401波"/utf8>>), lev = 406,
		  unit_ids = [62119], is_reset = 0, formation = {6, 1}};
get({2, 402}) ->
    #endless_data{type = 2, id = 402,
		  name = lang:get(<<"第402波"/utf8>>), lev = 407,
		  unit_ids = [62120], is_reset = 0, formation = {6, 1}};
get({2, 403}) ->
    #endless_data{type = 2, id = 403,
		  name = lang:get(<<"第403波"/utf8>>), lev = 408,
		  unit_ids = [62121], is_reset = 0, formation = {1, 1}};
get({2, 404}) ->
    #endless_data{type = 2, id = 404,
		  name = lang:get(<<"第404波"/utf8>>), lev = 408,
		  unit_ids = [62122], is_reset = 0, formation = {1, 1}};
get({2, 405}) ->
    #endless_data{type = 2, id = 405,
		  name = lang:get(<<"第405波"/utf8>>), lev = 409,
		  unit_ids = [62123], is_reset = 0, formation = {2, 1}};
get({2, 406}) ->
    #endless_data{type = 2, id = 406,
		  name = lang:get(<<"第406波"/utf8>>), lev = 410,
		  unit_ids = [62109], is_reset = 0, formation = {2, 1}};
get({2, 407}) ->
    #endless_data{type = 2, id = 407,
		  name = lang:get(<<"第407波"/utf8>>), lev = 410,
		  unit_ids = [62110], is_reset = 0, formation = {3, 1}};
get({2, 408}) ->
    #endless_data{type = 2, id = 408,
		  name = lang:get(<<"第408波"/utf8>>), lev = 411,
		  unit_ids = [62111], is_reset = 0, formation = {3, 1}};
get({2, 409}) ->
    #endless_data{type = 2, id = 409,
		  name = lang:get(<<"第409波"/utf8>>), lev = 412,
		  unit_ids = [62112], is_reset = 0, formation = {4, 1}};
get({2, 410}) ->
    #endless_data{type = 2, id = 410,
		  name = lang:get(<<"第410波"/utf8>>), lev = 412,
		  unit_ids = [62113], is_reset = 0, formation = {4, 1}};
get({2, 411}) ->
    #endless_data{type = 2, id = 411,
		  name = lang:get(<<"第411波"/utf8>>), lev = 413,
		  unit_ids = [62114], is_reset = 0, formation = {5, 1}};
get({2, 412}) ->
    #endless_data{type = 2, id = 412,
		  name = lang:get(<<"第412波"/utf8>>), lev = 414,
		  unit_ids = [62115], is_reset = 0, formation = {5, 1}};
get({2, 413}) ->
    #endless_data{type = 2, id = 413,
		  name = lang:get(<<"第413波"/utf8>>), lev = 414,
		  unit_ids = [62116], is_reset = 0, formation = {6, 1}};
get({2, 414}) ->
    #endless_data{type = 2, id = 414,
		  name = lang:get(<<"第414波"/utf8>>), lev = 415,
		  unit_ids = [62117], is_reset = 0, formation = {6, 1}};
get({2, 415}) ->
    #endless_data{type = 2, id = 415,
		  name = lang:get(<<"第415波"/utf8>>), lev = 416,
		  unit_ids = [62118], is_reset = 0, formation = {1, 1}};
get({2, 416}) ->
    #endless_data{type = 2, id = 416,
		  name = lang:get(<<"第416波"/utf8>>), lev = 416,
		  unit_ids = [62119], is_reset = 0, formation = {1, 1}};
get({2, 417}) ->
    #endless_data{type = 2, id = 417,
		  name = lang:get(<<"第417波"/utf8>>), lev = 417,
		  unit_ids = [62120], is_reset = 0, formation = {2, 1}};
get({2, 418}) ->
    #endless_data{type = 2, id = 418,
		  name = lang:get(<<"第418波"/utf8>>), lev = 418,
		  unit_ids = [62121], is_reset = 0, formation = {2, 1}};
get({2, 419}) ->
    #endless_data{type = 2, id = 419,
		  name = lang:get(<<"第419波"/utf8>>), lev = 418,
		  unit_ids = [62122], is_reset = 0, formation = {3, 1}};
get({2, 420}) ->
    #endless_data{type = 2, id = 420,
		  name = lang:get(<<"第420波"/utf8>>), lev = 419,
		  unit_ids = [62123], is_reset = 0, formation = {3, 1}};
get({2, 421}) ->
    #endless_data{type = 2, id = 421,
		  name = lang:get(<<"第421波"/utf8>>), lev = 420,
		  unit_ids = [62109], is_reset = 0, formation = {4, 1}};
get({2, 422}) ->
    #endless_data{type = 2, id = 422,
		  name = lang:get(<<"第422波"/utf8>>), lev = 420,
		  unit_ids = [62110], is_reset = 0, formation = {4, 1}};
get({2, 423}) ->
    #endless_data{type = 2, id = 423,
		  name = lang:get(<<"第423波"/utf8>>), lev = 421,
		  unit_ids = [62111], is_reset = 0, formation = {5, 1}};
get({2, 424}) ->
    #endless_data{type = 2, id = 424,
		  name = lang:get(<<"第424波"/utf8>>), lev = 422,
		  unit_ids = [62112], is_reset = 0, formation = {5, 1}};
get({2, 425}) ->
    #endless_data{type = 2, id = 425,
		  name = lang:get(<<"第425波"/utf8>>), lev = 422,
		  unit_ids = [62113], is_reset = 0, formation = {6, 1}};
get({2, 426}) ->
    #endless_data{type = 2, id = 426,
		  name = lang:get(<<"第426波"/utf8>>), lev = 423,
		  unit_ids = [62114], is_reset = 0, formation = {6, 1}};
get({2, 427}) ->
    #endless_data{type = 2, id = 427,
		  name = lang:get(<<"第427波"/utf8>>), lev = 424,
		  unit_ids = [62115], is_reset = 0, formation = {1, 1}};
get({2, 428}) ->
    #endless_data{type = 2, id = 428,
		  name = lang:get(<<"第428波"/utf8>>), lev = 424,
		  unit_ids = [62116], is_reset = 0, formation = {1, 1}};
get({2, 429}) ->
    #endless_data{type = 2, id = 429,
		  name = lang:get(<<"第429波"/utf8>>), lev = 425,
		  unit_ids = [62117], is_reset = 0, formation = {2, 1}};
get({2, 430}) ->
    #endless_data{type = 2, id = 430,
		  name = lang:get(<<"第430波"/utf8>>), lev = 426,
		  unit_ids = [62118], is_reset = 0, formation = {2, 1}};
get({2, 431}) ->
    #endless_data{type = 2, id = 431,
		  name = lang:get(<<"第431波"/utf8>>), lev = 426,
		  unit_ids = [62119], is_reset = 0, formation = {3, 1}};
get({2, 432}) ->
    #endless_data{type = 2, id = 432,
		  name = lang:get(<<"第432波"/utf8>>), lev = 427,
		  unit_ids = [62120], is_reset = 0, formation = {3, 1}};
get({2, 433}) ->
    #endless_data{type = 2, id = 433,
		  name = lang:get(<<"第433波"/utf8>>), lev = 428,
		  unit_ids = [62121], is_reset = 0, formation = {4, 1}};
get({2, 434}) ->
    #endless_data{type = 2, id = 434,
		  name = lang:get(<<"第434波"/utf8>>), lev = 428,
		  unit_ids = [62122], is_reset = 0, formation = {4, 1}};
get({2, 435}) ->
    #endless_data{type = 2, id = 435,
		  name = lang:get(<<"第435波"/utf8>>), lev = 429,
		  unit_ids = [62123], is_reset = 0, formation = {5, 1}};
get({2, 436}) ->
    #endless_data{type = 2, id = 436,
		  name = lang:get(<<"第436波"/utf8>>), lev = 430,
		  unit_ids = [62109], is_reset = 0, formation = {5, 1}};
get({2, 437}) ->
    #endless_data{type = 2, id = 437,
		  name = lang:get(<<"第437波"/utf8>>), lev = 430,
		  unit_ids = [62110], is_reset = 0, formation = {6, 1}};
get({2, 438}) ->
    #endless_data{type = 2, id = 438,
		  name = lang:get(<<"第438波"/utf8>>), lev = 431,
		  unit_ids = [62111], is_reset = 0, formation = {6, 1}};
get({2, 439}) ->
    #endless_data{type = 2, id = 439,
		  name = lang:get(<<"第439波"/utf8>>), lev = 432,
		  unit_ids = [62112], is_reset = 0, formation = {1, 1}};
get({2, 440}) ->
    #endless_data{type = 2, id = 440,
		  name = lang:get(<<"第440波"/utf8>>), lev = 432,
		  unit_ids = [62113], is_reset = 0, formation = {1, 1}};
get({2, 441}) ->
    #endless_data{type = 2, id = 441,
		  name = lang:get(<<"第441波"/utf8>>), lev = 433,
		  unit_ids = [62114], is_reset = 0, formation = {2, 1}};
get({2, 442}) ->
    #endless_data{type = 2, id = 442,
		  name = lang:get(<<"第442波"/utf8>>), lev = 434,
		  unit_ids = [62115], is_reset = 0, formation = {2, 1}};
get({2, 443}) ->
    #endless_data{type = 2, id = 443,
		  name = lang:get(<<"第443波"/utf8>>), lev = 434,
		  unit_ids = [62116], is_reset = 0, formation = {3, 1}};
get({2, 444}) ->
    #endless_data{type = 2, id = 444,
		  name = lang:get(<<"第444波"/utf8>>), lev = 435,
		  unit_ids = [62117], is_reset = 0, formation = {3, 1}};
get({2, 445}) ->
    #endless_data{type = 2, id = 445,
		  name = lang:get(<<"第445波"/utf8>>), lev = 436,
		  unit_ids = [62118], is_reset = 0, formation = {4, 1}};
get({2, 446}) ->
    #endless_data{type = 2, id = 446,
		  name = lang:get(<<"第446波"/utf8>>), lev = 436,
		  unit_ids = [62119], is_reset = 0, formation = {4, 1}};
get({2, 447}) ->
    #endless_data{type = 2, id = 447,
		  name = lang:get(<<"第447波"/utf8>>), lev = 437,
		  unit_ids = [62120], is_reset = 0, formation = {5, 1}};
get({2, 448}) ->
    #endless_data{type = 2, id = 448,
		  name = lang:get(<<"第448波"/utf8>>), lev = 438,
		  unit_ids = [62121], is_reset = 0, formation = {5, 1}};
get({2, 449}) ->
    #endless_data{type = 2, id = 449,
		  name = lang:get(<<"第449波"/utf8>>), lev = 438,
		  unit_ids = [62122], is_reset = 0, formation = {6, 1}};
get({2, 450}) ->
    #endless_data{type = 2, id = 450,
		  name = lang:get(<<"第450波"/utf8>>), lev = 439,
		  unit_ids = [62123], is_reset = 0, formation = {6, 1}};
get({2, 451}) ->
    #endless_data{type = 2, id = 451,
		  name = lang:get(<<"第451波"/utf8>>), lev = 440,
		  unit_ids = [62109], is_reset = 0, formation = {1, 1}};
get({2, 452}) ->
    #endless_data{type = 2, id = 452,
		  name = lang:get(<<"第452波"/utf8>>), lev = 440,
		  unit_ids = [62110], is_reset = 0, formation = {1, 1}};
get({2, 453}) ->
    #endless_data{type = 2, id = 453,
		  name = lang:get(<<"第453波"/utf8>>), lev = 441,
		  unit_ids = [62111], is_reset = 0, formation = {2, 1}};
get({2, 454}) ->
    #endless_data{type = 2, id = 454,
		  name = lang:get(<<"第454波"/utf8>>), lev = 442,
		  unit_ids = [62112], is_reset = 0, formation = {2, 1}};
get({2, 455}) ->
    #endless_data{type = 2, id = 455,
		  name = lang:get(<<"第455波"/utf8>>), lev = 442,
		  unit_ids = [62113], is_reset = 0, formation = {3, 1}};
get({2, 456}) ->
    #endless_data{type = 2, id = 456,
		  name = lang:get(<<"第456波"/utf8>>), lev = 443,
		  unit_ids = [62114], is_reset = 0, formation = {3, 1}};
get({2, 457}) ->
    #endless_data{type = 2, id = 457,
		  name = lang:get(<<"第457波"/utf8>>), lev = 444,
		  unit_ids = [62115], is_reset = 0, formation = {4, 1}};
get({2, 458}) ->
    #endless_data{type = 2, id = 458,
		  name = lang:get(<<"第458波"/utf8>>), lev = 444,
		  unit_ids = [62116], is_reset = 0, formation = {4, 1}};
get({2, 459}) ->
    #endless_data{type = 2, id = 459,
		  name = lang:get(<<"第459波"/utf8>>), lev = 445,
		  unit_ids = [62117], is_reset = 0, formation = {5, 1}};
get({2, 460}) ->
    #endless_data{type = 2, id = 460,
		  name = lang:get(<<"第460波"/utf8>>), lev = 446,
		  unit_ids = [62118], is_reset = 0, formation = {5, 1}};
get({2, 461}) ->
    #endless_data{type = 2, id = 461,
		  name = lang:get(<<"第461波"/utf8>>), lev = 446,
		  unit_ids = [62119], is_reset = 0, formation = {6, 1}};
get({2, 462}) ->
    #endless_data{type = 2, id = 462,
		  name = lang:get(<<"第462波"/utf8>>), lev = 447,
		  unit_ids = [62120], is_reset = 0, formation = {6, 1}};
get({2, 463}) ->
    #endless_data{type = 2, id = 463,
		  name = lang:get(<<"第463波"/utf8>>), lev = 448,
		  unit_ids = [62121], is_reset = 0, formation = {1, 1}};
get({2, 464}) ->
    #endless_data{type = 2, id = 464,
		  name = lang:get(<<"第464波"/utf8>>), lev = 448,
		  unit_ids = [62122], is_reset = 0, formation = {1, 1}};
get({2, 465}) ->
    #endless_data{type = 2, id = 465,
		  name = lang:get(<<"第465波"/utf8>>), lev = 449,
		  unit_ids = [62123], is_reset = 0, formation = {2, 1}};
get({2, 466}) ->
    #endless_data{type = 2, id = 466,
		  name = lang:get(<<"第466波"/utf8>>), lev = 450,
		  unit_ids = [62109], is_reset = 0, formation = {2, 1}};
get({2, 467}) ->
    #endless_data{type = 2, id = 467,
		  name = lang:get(<<"第467波"/utf8>>), lev = 450,
		  unit_ids = [62110], is_reset = 0, formation = {3, 1}};
get({2, 468}) ->
    #endless_data{type = 2, id = 468,
		  name = lang:get(<<"第468波"/utf8>>), lev = 451,
		  unit_ids = [62111], is_reset = 0, formation = {3, 1}};
get({2, 469}) ->
    #endless_data{type = 2, id = 469,
		  name = lang:get(<<"第469波"/utf8>>), lev = 452,
		  unit_ids = [62112], is_reset = 0, formation = {4, 1}};
get({2, 470}) ->
    #endless_data{type = 2, id = 470,
		  name = lang:get(<<"第470波"/utf8>>), lev = 452,
		  unit_ids = [62113], is_reset = 0, formation = {4, 1}};
get({2, 471}) ->
    #endless_data{type = 2, id = 471,
		  name = lang:get(<<"第471波"/utf8>>), lev = 453,
		  unit_ids = [62114], is_reset = 0, formation = {5, 1}};
get({2, 472}) ->
    #endless_data{type = 2, id = 472,
		  name = lang:get(<<"第472波"/utf8>>), lev = 454,
		  unit_ids = [62115], is_reset = 0, formation = {5, 1}};
get({2, 473}) ->
    #endless_data{type = 2, id = 473,
		  name = lang:get(<<"第473波"/utf8>>), lev = 454,
		  unit_ids = [62116], is_reset = 0, formation = {6, 1}};
get({2, 474}) ->
    #endless_data{type = 2, id = 474,
		  name = lang:get(<<"第474波"/utf8>>), lev = 455,
		  unit_ids = [62117], is_reset = 0, formation = {6, 1}};
get({2, 475}) ->
    #endless_data{type = 2, id = 475,
		  name = lang:get(<<"第475波"/utf8>>), lev = 456,
		  unit_ids = [62118], is_reset = 0, formation = {1, 1}};
get({2, 476}) ->
    #endless_data{type = 2, id = 476,
		  name = lang:get(<<"第476波"/utf8>>), lev = 456,
		  unit_ids = [62119], is_reset = 0, formation = {1, 1}};
get({2, 477}) ->
    #endless_data{type = 2, id = 477,
		  name = lang:get(<<"第477波"/utf8>>), lev = 457,
		  unit_ids = [62120], is_reset = 0, formation = {2, 1}};
get({2, 478}) ->
    #endless_data{type = 2, id = 478,
		  name = lang:get(<<"第478波"/utf8>>), lev = 458,
		  unit_ids = [62121], is_reset = 0, formation = {2, 1}};
get({2, 479}) ->
    #endless_data{type = 2, id = 479,
		  name = lang:get(<<"第479波"/utf8>>), lev = 458,
		  unit_ids = [62122], is_reset = 0, formation = {3, 1}};
get({2, 480}) ->
    #endless_data{type = 2, id = 480,
		  name = lang:get(<<"第480波"/utf8>>), lev = 459,
		  unit_ids = [62123], is_reset = 0, formation = {3, 1}};
get({2, 481}) ->
    #endless_data{type = 2, id = 481,
		  name = lang:get(<<"第481波"/utf8>>), lev = 460,
		  unit_ids = [62109], is_reset = 0, formation = {4, 1}};
get({2, 482}) ->
    #endless_data{type = 2, id = 482,
		  name = lang:get(<<"第482波"/utf8>>), lev = 460,
		  unit_ids = [62110], is_reset = 0, formation = {4, 1}};
get({2, 483}) ->
    #endless_data{type = 2, id = 483,
		  name = lang:get(<<"第483波"/utf8>>), lev = 461,
		  unit_ids = [62111], is_reset = 0, formation = {5, 1}};
get({2, 484}) ->
    #endless_data{type = 2, id = 484,
		  name = lang:get(<<"第484波"/utf8>>), lev = 462,
		  unit_ids = [62112], is_reset = 0, formation = {5, 1}};
get({2, 485}) ->
    #endless_data{type = 2, id = 485,
		  name = lang:get(<<"第485波"/utf8>>), lev = 462,
		  unit_ids = [62113], is_reset = 0, formation = {6, 1}};
get({2, 486}) ->
    #endless_data{type = 2, id = 486,
		  name = lang:get(<<"第486波"/utf8>>), lev = 463,
		  unit_ids = [62114], is_reset = 0, formation = {6, 1}};
get({2, 487}) ->
    #endless_data{type = 2, id = 487,
		  name = lang:get(<<"第487波"/utf8>>), lev = 464,
		  unit_ids = [62115], is_reset = 0, formation = {1, 1}};
get({2, 488}) ->
    #endless_data{type = 2, id = 488,
		  name = lang:get(<<"第488波"/utf8>>), lev = 464,
		  unit_ids = [62116], is_reset = 0, formation = {1, 1}};
get({2, 489}) ->
    #endless_data{type = 2, id = 489,
		  name = lang:get(<<"第489波"/utf8>>), lev = 465,
		  unit_ids = [62117], is_reset = 0, formation = {2, 1}};
get({2, 490}) ->
    #endless_data{type = 2, id = 490,
		  name = lang:get(<<"第490波"/utf8>>), lev = 466,
		  unit_ids = [62118], is_reset = 0, formation = {2, 1}};
get({2, 491}) ->
    #endless_data{type = 2, id = 491,
		  name = lang:get(<<"第491波"/utf8>>), lev = 466,
		  unit_ids = [62119], is_reset = 0, formation = {3, 1}};
get({2, 492}) ->
    #endless_data{type = 2, id = 492,
		  name = lang:get(<<"第492波"/utf8>>), lev = 467,
		  unit_ids = [62120], is_reset = 0, formation = {3, 1}};
get({2, 493}) ->
    #endless_data{type = 2, id = 493,
		  name = lang:get(<<"第493波"/utf8>>), lev = 468,
		  unit_ids = [62121], is_reset = 0, formation = {4, 1}};
get({2, 494}) ->
    #endless_data{type = 2, id = 494,
		  name = lang:get(<<"第494波"/utf8>>), lev = 468,
		  unit_ids = [62122], is_reset = 0, formation = {4, 1}};
get({2, 495}) ->
    #endless_data{type = 2, id = 495,
		  name = lang:get(<<"第495波"/utf8>>), lev = 469,
		  unit_ids = [62123], is_reset = 0, formation = {5, 1}};
get({2, 496}) ->
    #endless_data{type = 2, id = 496,
		  name = lang:get(<<"第496波"/utf8>>), lev = 470,
		  unit_ids = [62109], is_reset = 0, formation = {5, 1}};
get({2, 497}) ->
    #endless_data{type = 2, id = 497,
		  name = lang:get(<<"第497波"/utf8>>), lev = 470,
		  unit_ids = [62110], is_reset = 0, formation = {6, 1}};
get({2, 498}) ->
    #endless_data{type = 2, id = 498,
		  name = lang:get(<<"第498波"/utf8>>), lev = 471,
		  unit_ids = [62111], is_reset = 0, formation = {6, 1}};
get({2, 499}) ->
    #endless_data{type = 2, id = 499,
		  name = lang:get(<<"第499波"/utf8>>), lev = 472,
		  unit_ids = [62112], is_reset = 0, formation = {1, 1}};
get({2, 500}) ->
    #endless_data{type = 2, id = 500,
		  name = lang:get(<<"第500波"/utf8>>), lev = 472,
		  unit_ids = [62113], is_reset = 0, formation = {1, 1}};
get({3, 1}) ->
    #endless_data{type = 3, id = 1,
		  name = lang:get(<<"第1波"/utf8>>), lev = 185,
		  unit_ids = [63101], is_reset = 0, formation = {1, 1}};
get({3, 2}) ->
    #endless_data{type = 3, id = 2,
		  name = lang:get(<<"第2波"/utf8>>), lev = 185,
		  unit_ids = [63102], is_reset = 0, formation = {1, 1}};
get({3, 3}) ->
    #endless_data{type = 3, id = 3,
		  name = lang:get(<<"第3波"/utf8>>), lev = 185,
		  unit_ids = [63103], is_reset = 0, formation = {2, 1}};
get({3, 4}) ->
    #endless_data{type = 3, id = 4,
		  name = lang:get(<<"第4波"/utf8>>), lev = 186,
		  unit_ids = [63104], is_reset = 0, formation = {2, 1}};
get({3, 5}) ->
    #endless_data{type = 3, id = 5,
		  name = lang:get(<<"第5波"/utf8>>), lev = 186,
		  unit_ids = [63105], is_reset = 0, formation = {3, 1}};
get({3, 6}) ->
    #endless_data{type = 3, id = 6,
		  name = lang:get(<<"第6波"/utf8>>), lev = 186,
		  unit_ids = [63106], is_reset = 0, formation = {3, 1}};
get({3, 7}) ->
    #endless_data{type = 3, id = 7,
		  name = lang:get(<<"第7波"/utf8>>), lev = 187,
		  unit_ids = [63107], is_reset = 0, formation = {4, 1}};
get({3, 8}) ->
    #endless_data{type = 3, id = 8,
		  name = lang:get(<<"第8波"/utf8>>), lev = 187,
		  unit_ids = [63108], is_reset = 0, formation = {4, 1}};
get({3, 9}) ->
    #endless_data{type = 3, id = 9,
		  name = lang:get(<<"第9波"/utf8>>), lev = 187,
		  unit_ids = [63101], is_reset = 0, formation = {5, 1}};
get({3, 10}) ->
    #endless_data{type = 3, id = 10,
		  name = lang:get(<<"第10波"/utf8>>), lev = 188,
		  unit_ids = [63102], is_reset = 0, formation = {5, 1}};
get({3, 11}) ->
    #endless_data{type = 3, id = 11,
		  name = lang:get(<<"第11波"/utf8>>), lev = 188,
		  unit_ids = [63103], is_reset = 0, formation = {6, 1}};
get({3, 12}) ->
    #endless_data{type = 3, id = 12,
		  name = lang:get(<<"第12波"/utf8>>), lev = 188,
		  unit_ids = [63104], is_reset = 0, formation = {6, 1}};
get({3, 13}) ->
    #endless_data{type = 3, id = 13,
		  name = lang:get(<<"第13波"/utf8>>), lev = 189,
		  unit_ids = [63105], is_reset = 0, formation = {1, 1}};
get({3, 14}) ->
    #endless_data{type = 3, id = 14,
		  name = lang:get(<<"第14波"/utf8>>), lev = 189,
		  unit_ids = [63106], is_reset = 0, formation = {1, 1}};
get({3, 15}) ->
    #endless_data{type = 3, id = 15,
		  name = lang:get(<<"第15波"/utf8>>), lev = 189,
		  unit_ids = [63107], is_reset = 0, formation = {2, 1}};
get({3, 16}) ->
    #endless_data{type = 3, id = 16,
		  name = lang:get(<<"第16波"/utf8>>), lev = 190,
		  unit_ids = [63108], is_reset = 0, formation = {2, 1}};
get({3, 17}) ->
    #endless_data{type = 3, id = 17,
		  name = lang:get(<<"第17波"/utf8>>), lev = 190,
		  unit_ids = [63101], is_reset = 0, formation = {3, 1}};
get({3, 18}) ->
    #endless_data{type = 3, id = 18,
		  name = lang:get(<<"第18波"/utf8>>), lev = 190,
		  unit_ids = [63102], is_reset = 0, formation = {3, 1}};
get({3, 19}) ->
    #endless_data{type = 3, id = 19,
		  name = lang:get(<<"第19波"/utf8>>), lev = 191,
		  unit_ids = [63103], is_reset = 0, formation = {4, 1}};
get({3, 20}) ->
    #endless_data{type = 3, id = 20,
		  name = lang:get(<<"第20波"/utf8>>), lev = 191,
		  unit_ids = [63104], is_reset = 0, formation = {4, 1}};
get({3, 21}) ->
    #endless_data{type = 3, id = 21,
		  name = lang:get(<<"第21波"/utf8>>), lev = 191,
		  unit_ids = [63105], is_reset = 0, formation = {5, 1}};
get({3, 22}) ->
    #endless_data{type = 3, id = 22,
		  name = lang:get(<<"第22波"/utf8>>), lev = 192,
		  unit_ids = [63106], is_reset = 0, formation = {5, 1}};
get({3, 23}) ->
    #endless_data{type = 3, id = 23,
		  name = lang:get(<<"第23波"/utf8>>), lev = 192,
		  unit_ids = [63107], is_reset = 0, formation = {6, 1}};
get({3, 24}) ->
    #endless_data{type = 3, id = 24,
		  name = lang:get(<<"第24波"/utf8>>), lev = 192,
		  unit_ids = [63108], is_reset = 0, formation = {6, 1}};
get({3, 25}) ->
    #endless_data{type = 3, id = 25,
		  name = lang:get(<<"第25波"/utf8>>), lev = 193,
		  unit_ids = [63101], is_reset = 0, formation = {1, 1}};
get({3, 26}) ->
    #endless_data{type = 3, id = 26,
		  name = lang:get(<<"第26波"/utf8>>), lev = 193,
		  unit_ids = [63102], is_reset = 0, formation = {1, 1}};
get({3, 27}) ->
    #endless_data{type = 3, id = 27,
		  name = lang:get(<<"第27波"/utf8>>), lev = 193,
		  unit_ids = [63103], is_reset = 0, formation = {2, 1}};
get({3, 28}) ->
    #endless_data{type = 3, id = 28,
		  name = lang:get(<<"第28波"/utf8>>), lev = 194,
		  unit_ids = [63104], is_reset = 0, formation = {2, 1}};
get({3, 29}) ->
    #endless_data{type = 3, id = 29,
		  name = lang:get(<<"第29波"/utf8>>), lev = 194,
		  unit_ids = [63105], is_reset = 0, formation = {3, 1}};
get({3, 30}) ->
    #endless_data{type = 3, id = 30,
		  name = lang:get(<<"第30波"/utf8>>), lev = 194,
		  unit_ids = [63106], is_reset = 0, formation = {3, 1}};
get({3, 31}) ->
    #endless_data{type = 3, id = 31,
		  name = lang:get(<<"第31波"/utf8>>), lev = 195,
		  unit_ids = [63107], is_reset = 0, formation = {4, 1}};
get({3, 32}) ->
    #endless_data{type = 3, id = 32,
		  name = lang:get(<<"第32波"/utf8>>), lev = 195,
		  unit_ids = [63108], is_reset = 0, formation = {4, 1}};
get({3, 33}) ->
    #endless_data{type = 3, id = 33,
		  name = lang:get(<<"第33波"/utf8>>), lev = 195,
		  unit_ids = [63101], is_reset = 0, formation = {5, 1}};
get({3, 34}) ->
    #endless_data{type = 3, id = 34,
		  name = lang:get(<<"第34波"/utf8>>), lev = 196,
		  unit_ids = [63102], is_reset = 0, formation = {5, 1}};
get({3, 35}) ->
    #endless_data{type = 3, id = 35,
		  name = lang:get(<<"第35波"/utf8>>), lev = 196,
		  unit_ids = [63103], is_reset = 0, formation = {6, 1}};
get({3, 36}) ->
    #endless_data{type = 3, id = 36,
		  name = lang:get(<<"第36波"/utf8>>), lev = 196,
		  unit_ids = [63104], is_reset = 0, formation = {6, 1}};
get({3, 37}) ->
    #endless_data{type = 3, id = 37,
		  name = lang:get(<<"第37波"/utf8>>), lev = 197,
		  unit_ids = [63105], is_reset = 0, formation = {1, 1}};
get({3, 38}) ->
    #endless_data{type = 3, id = 38,
		  name = lang:get(<<"第38波"/utf8>>), lev = 197,
		  unit_ids = [63106], is_reset = 0, formation = {1, 1}};
get({3, 39}) ->
    #endless_data{type = 3, id = 39,
		  name = lang:get(<<"第39波"/utf8>>), lev = 197,
		  unit_ids = [63107], is_reset = 0, formation = {2, 1}};
get({3, 40}) ->
    #endless_data{type = 3, id = 40,
		  name = lang:get(<<"第40波"/utf8>>), lev = 198,
		  unit_ids = [63108], is_reset = 0, formation = {2, 1}};
get({3, 41}) ->
    #endless_data{type = 3, id = 41,
		  name = lang:get(<<"第41波"/utf8>>), lev = 198,
		  unit_ids = [63101], is_reset = 0, formation = {3, 1}};
get({3, 42}) ->
    #endless_data{type = 3, id = 42,
		  name = lang:get(<<"第42波"/utf8>>), lev = 198,
		  unit_ids = [63102], is_reset = 0, formation = {3, 1}};
get({3, 43}) ->
    #endless_data{type = 3, id = 43,
		  name = lang:get(<<"第43波"/utf8>>), lev = 199,
		  unit_ids = [63103], is_reset = 0, formation = {4, 1}};
get({3, 44}) ->
    #endless_data{type = 3, id = 44,
		  name = lang:get(<<"第44波"/utf8>>), lev = 199,
		  unit_ids = [63104], is_reset = 0, formation = {4, 1}};
get({3, 45}) ->
    #endless_data{type = 3, id = 45,
		  name = lang:get(<<"第45波"/utf8>>), lev = 199,
		  unit_ids = [63105], is_reset = 0, formation = {5, 1}};
get({3, 46}) ->
    #endless_data{type = 3, id = 46,
		  name = lang:get(<<"第46波"/utf8>>), lev = 200,
		  unit_ids = [63106], is_reset = 0, formation = {5, 1}};
get({3, 47}) ->
    #endless_data{type = 3, id = 47,
		  name = lang:get(<<"第47波"/utf8>>), lev = 200,
		  unit_ids = [63107], is_reset = 0, formation = {6, 1}};
get({3, 48}) ->
    #endless_data{type = 3, id = 48,
		  name = lang:get(<<"第48波"/utf8>>), lev = 200,
		  unit_ids = [63108], is_reset = 0, formation = {6, 1}};
get({3, 49}) ->
    #endless_data{type = 3, id = 49,
		  name = lang:get(<<"第49波"/utf8>>), lev = 201,
		  unit_ids = [63101], is_reset = 0, formation = {1, 1}};
get({3, 50}) ->
    #endless_data{type = 3, id = 50,
		  name = lang:get(<<"第50波"/utf8>>), lev = 201,
		  unit_ids = [63102], is_reset = 0, formation = {1, 1}};
get({3, 51}) ->
    #endless_data{type = 3, id = 51,
		  name = lang:get(<<"第51波"/utf8>>), lev = 201,
		  unit_ids = [63103], is_reset = 0, formation = {2, 1}};
get({3, 52}) ->
    #endless_data{type = 3, id = 52,
		  name = lang:get(<<"第52波"/utf8>>), lev = 202,
		  unit_ids = [63104], is_reset = 0, formation = {2, 1}};
get({3, 53}) ->
    #endless_data{type = 3, id = 53,
		  name = lang:get(<<"第53波"/utf8>>), lev = 202,
		  unit_ids = [63105], is_reset = 0, formation = {3, 1}};
get({3, 54}) ->
    #endless_data{type = 3, id = 54,
		  name = lang:get(<<"第54波"/utf8>>), lev = 202,
		  unit_ids = [63106], is_reset = 0, formation = {3, 1}};
get({3, 55}) ->
    #endless_data{type = 3, id = 55,
		  name = lang:get(<<"第55波"/utf8>>), lev = 203,
		  unit_ids = [63107], is_reset = 0, formation = {4, 1}};
get({3, 56}) ->
    #endless_data{type = 3, id = 56,
		  name = lang:get(<<"第56波"/utf8>>), lev = 203,
		  unit_ids = [63108], is_reset = 0, formation = {4, 1}};
get({3, 57}) ->
    #endless_data{type = 3, id = 57,
		  name = lang:get(<<"第57波"/utf8>>), lev = 203,
		  unit_ids = [63101], is_reset = 0, formation = {5, 1}};
get({3, 58}) ->
    #endless_data{type = 3, id = 58,
		  name = lang:get(<<"第58波"/utf8>>), lev = 204,
		  unit_ids = [63102], is_reset = 0, formation = {5, 1}};
get({3, 59}) ->
    #endless_data{type = 3, id = 59,
		  name = lang:get(<<"第59波"/utf8>>), lev = 204,
		  unit_ids = [63103], is_reset = 0, formation = {6, 1}};
get({3, 60}) ->
    #endless_data{type = 3, id = 60,
		  name = lang:get(<<"第60波"/utf8>>), lev = 204,
		  unit_ids = [63104], is_reset = 0, formation = {6, 1}};
get({3, 61}) ->
    #endless_data{type = 3, id = 61,
		  name = lang:get(<<"第61波"/utf8>>), lev = 205,
		  unit_ids = [63105], is_reset = 0, formation = {1, 1}};
get({3, 62}) ->
    #endless_data{type = 3, id = 62,
		  name = lang:get(<<"第62波"/utf8>>), lev = 205,
		  unit_ids = [63106], is_reset = 0, formation = {1, 1}};
get({3, 63}) ->
    #endless_data{type = 3, id = 63,
		  name = lang:get(<<"第63波"/utf8>>), lev = 205,
		  unit_ids = [63107], is_reset = 0, formation = {2, 1}};
get({3, 64}) ->
    #endless_data{type = 3, id = 64,
		  name = lang:get(<<"第64波"/utf8>>), lev = 206,
		  unit_ids = [63109], is_reset = 0, formation = {2, 1}};
get({3, 65}) ->
    #endless_data{type = 3, id = 65,
		  name = lang:get(<<"第65波"/utf8>>), lev = 206,
		  unit_ids = [63110], is_reset = 0, formation = {3, 1}};
get({3, 66}) ->
    #endless_data{type = 3, id = 66,
		  name = lang:get(<<"第66波"/utf8>>), lev = 206,
		  unit_ids = [63111], is_reset = 0, formation = {3, 1}};
get({3, 67}) ->
    #endless_data{type = 3, id = 67,
		  name = lang:get(<<"第67波"/utf8>>), lev = 207,
		  unit_ids = [63112], is_reset = 0, formation = {4, 1}};
get({3, 68}) ->
    #endless_data{type = 3, id = 68,
		  name = lang:get(<<"第68波"/utf8>>), lev = 207,
		  unit_ids = [63113], is_reset = 0, formation = {4, 1}};
get({3, 69}) ->
    #endless_data{type = 3, id = 69,
		  name = lang:get(<<"第69波"/utf8>>), lev = 207,
		  unit_ids = [63114], is_reset = 0, formation = {5, 1}};
get({3, 70}) ->
    #endless_data{type = 3, id = 70,
		  name = lang:get(<<"第70波"/utf8>>), lev = 208,
		  unit_ids = [63115], is_reset = 0, formation = {5, 1}};
get({3, 71}) ->
    #endless_data{type = 3, id = 71,
		  name = lang:get(<<"第71波"/utf8>>), lev = 208,
		  unit_ids = [63116], is_reset = 0, formation = {6, 1}};
get({3, 72}) ->
    #endless_data{type = 3, id = 72,
		  name = lang:get(<<"第72波"/utf8>>), lev = 208,
		  unit_ids = [63117], is_reset = 0, formation = {6, 1}};
get({3, 73}) ->
    #endless_data{type = 3, id = 73,
		  name = lang:get(<<"第73波"/utf8>>), lev = 209,
		  unit_ids = [63118], is_reset = 0, formation = {1, 1}};
get({3, 74}) ->
    #endless_data{type = 3, id = 74,
		  name = lang:get(<<"第74波"/utf8>>), lev = 209,
		  unit_ids = [63119], is_reset = 0, formation = {1, 1}};
get({3, 75}) ->
    #endless_data{type = 3, id = 75,
		  name = lang:get(<<"第75波"/utf8>>), lev = 209,
		  unit_ids = [63120], is_reset = 0, formation = {2, 1}};
get({3, 76}) ->
    #endless_data{type = 3, id = 76,
		  name = lang:get(<<"第76波"/utf8>>), lev = 210,
		  unit_ids = [63121], is_reset = 0, formation = {2, 1}};
get({3, 77}) ->
    #endless_data{type = 3, id = 77,
		  name = lang:get(<<"第77波"/utf8>>), lev = 210,
		  unit_ids = [63122], is_reset = 0, formation = {3, 1}};
get({3, 78}) ->
    #endless_data{type = 3, id = 78,
		  name = lang:get(<<"第78波"/utf8>>), lev = 210,
		  unit_ids = [63123], is_reset = 0, formation = {3, 1}};
get({3, 79}) ->
    #endless_data{type = 3, id = 79,
		  name = lang:get(<<"第79波"/utf8>>), lev = 211,
		  unit_ids = [63109], is_reset = 0, formation = {4, 1}};
get({3, 80}) ->
    #endless_data{type = 3, id = 80,
		  name = lang:get(<<"第80波"/utf8>>), lev = 211,
		  unit_ids = [63110], is_reset = 0, formation = {4, 1}};
get({3, 81}) ->
    #endless_data{type = 3, id = 81,
		  name = lang:get(<<"第81波"/utf8>>), lev = 211,
		  unit_ids = [63111], is_reset = 0, formation = {5, 1}};
get({3, 82}) ->
    #endless_data{type = 3, id = 82,
		  name = lang:get(<<"第82波"/utf8>>), lev = 212,
		  unit_ids = [63112], is_reset = 0, formation = {5, 1}};
get({3, 83}) ->
    #endless_data{type = 3, id = 83,
		  name = lang:get(<<"第83波"/utf8>>), lev = 212,
		  unit_ids = [63113], is_reset = 0, formation = {6, 1}};
get({3, 84}) ->
    #endless_data{type = 3, id = 84,
		  name = lang:get(<<"第84波"/utf8>>), lev = 212,
		  unit_ids = [63114], is_reset = 0, formation = {6, 1}};
get({3, 85}) ->
    #endless_data{type = 3, id = 85,
		  name = lang:get(<<"第85波"/utf8>>), lev = 213,
		  unit_ids = [63115], is_reset = 0, formation = {1, 1}};
get({3, 86}) ->
    #endless_data{type = 3, id = 86,
		  name = lang:get(<<"第86波"/utf8>>), lev = 213,
		  unit_ids = [63116], is_reset = 0, formation = {1, 1}};
get({3, 87}) ->
    #endless_data{type = 3, id = 87,
		  name = lang:get(<<"第87波"/utf8>>), lev = 213,
		  unit_ids = [63117], is_reset = 0, formation = {2, 1}};
get({3, 88}) ->
    #endless_data{type = 3, id = 88,
		  name = lang:get(<<"第88波"/utf8>>), lev = 214,
		  unit_ids = [63118], is_reset = 0, formation = {2, 1}};
get({3, 89}) ->
    #endless_data{type = 3, id = 89,
		  name = lang:get(<<"第89波"/utf8>>), lev = 214,
		  unit_ids = [63119], is_reset = 0, formation = {3, 1}};
get({3, 90}) ->
    #endless_data{type = 3, id = 90,
		  name = lang:get(<<"第90波"/utf8>>), lev = 214,
		  unit_ids = [63120], is_reset = 0, formation = {3, 1}};
get({3, 91}) ->
    #endless_data{type = 3, id = 91,
		  name = lang:get(<<"第91波"/utf8>>), lev = 215,
		  unit_ids = [63121], is_reset = 0, formation = {4, 1}};
get({3, 92}) ->
    #endless_data{type = 3, id = 92,
		  name = lang:get(<<"第92波"/utf8>>), lev = 215,
		  unit_ids = [63122], is_reset = 0, formation = {4, 1}};
get({3, 93}) ->
    #endless_data{type = 3, id = 93,
		  name = lang:get(<<"第93波"/utf8>>), lev = 215,
		  unit_ids = [63123], is_reset = 0, formation = {5, 1}};
get({3, 94}) ->
    #endless_data{type = 3, id = 94,
		  name = lang:get(<<"第94波"/utf8>>), lev = 216,
		  unit_ids = [63109], is_reset = 0, formation = {5, 1}};
get({3, 95}) ->
    #endless_data{type = 3, id = 95,
		  name = lang:get(<<"第95波"/utf8>>), lev = 216,
		  unit_ids = [63110], is_reset = 0, formation = {6, 1}};
get({3, 96}) ->
    #endless_data{type = 3, id = 96,
		  name = lang:get(<<"第96波"/utf8>>), lev = 216,
		  unit_ids = [63111], is_reset = 0, formation = {6, 1}};
get({3, 97}) ->
    #endless_data{type = 3, id = 97,
		  name = lang:get(<<"第97波"/utf8>>), lev = 217,
		  unit_ids = [63112], is_reset = 0, formation = {1, 1}};
get({3, 98}) ->
    #endless_data{type = 3, id = 98,
		  name = lang:get(<<"第98波"/utf8>>), lev = 217,
		  unit_ids = [63113], is_reset = 0, formation = {1, 1}};
get({3, 99}) ->
    #endless_data{type = 3, id = 99,
		  name = lang:get(<<"第99波"/utf8>>), lev = 217,
		  unit_ids = [63114], is_reset = 0, formation = {2, 1}};
get({3, 100}) ->
    #endless_data{type = 3, id = 100,
		  name = lang:get(<<"第100波"/utf8>>), lev = 218,
		  unit_ids = [63115], is_reset = 0, formation = {2, 1}};
get({3, 101}) ->
    #endless_data{type = 3, id = 101,
		  name = lang:get(<<"第101波"/utf8>>), lev = 218,
		  unit_ids = [63116], is_reset = 0, formation = {3, 1}};
get({3, 102}) ->
    #endless_data{type = 3, id = 102,
		  name = lang:get(<<"第102波"/utf8>>), lev = 218,
		  unit_ids = [63117], is_reset = 0, formation = {3, 1}};
get({3, 103}) ->
    #endless_data{type = 3, id = 103,
		  name = lang:get(<<"第103波"/utf8>>), lev = 219,
		  unit_ids = [63118], is_reset = 0, formation = {4, 1}};
get({3, 104}) ->
    #endless_data{type = 3, id = 104,
		  name = lang:get(<<"第104波"/utf8>>), lev = 219,
		  unit_ids = [63119], is_reset = 0, formation = {4, 1}};
get({3, 105}) ->
    #endless_data{type = 3, id = 105,
		  name = lang:get(<<"第105波"/utf8>>), lev = 219,
		  unit_ids = [63120], is_reset = 0, formation = {5, 1}};
get({3, 106}) ->
    #endless_data{type = 3, id = 106,
		  name = lang:get(<<"第106波"/utf8>>), lev = 220,
		  unit_ids = [63121], is_reset = 0, formation = {5, 1}};
get({3, 107}) ->
    #endless_data{type = 3, id = 107,
		  name = lang:get(<<"第107波"/utf8>>), lev = 220,
		  unit_ids = [63122], is_reset = 0, formation = {6, 1}};
get({3, 108}) ->
    #endless_data{type = 3, id = 108,
		  name = lang:get(<<"第108波"/utf8>>), lev = 220,
		  unit_ids = [63123], is_reset = 0, formation = {6, 1}};
get({3, 109}) ->
    #endless_data{type = 3, id = 109,
		  name = lang:get(<<"第109波"/utf8>>), lev = 221,
		  unit_ids = [63109], is_reset = 0, formation = {1, 1}};
get({3, 110}) ->
    #endless_data{type = 3, id = 110,
		  name = lang:get(<<"第110波"/utf8>>), lev = 221,
		  unit_ids = [63110], is_reset = 0, formation = {1, 1}};
get({3, 111}) ->
    #endless_data{type = 3, id = 111,
		  name = lang:get(<<"第111波"/utf8>>), lev = 221,
		  unit_ids = [63111], is_reset = 0, formation = {2, 1}};
get({3, 112}) ->
    #endless_data{type = 3, id = 112,
		  name = lang:get(<<"第112波"/utf8>>), lev = 222,
		  unit_ids = [63112], is_reset = 0, formation = {2, 1}};
get({3, 113}) ->
    #endless_data{type = 3, id = 113,
		  name = lang:get(<<"第113波"/utf8>>), lev = 222,
		  unit_ids = [63113], is_reset = 0, formation = {3, 1}};
get({3, 114}) ->
    #endless_data{type = 3, id = 114,
		  name = lang:get(<<"第114波"/utf8>>), lev = 222,
		  unit_ids = [63114], is_reset = 0, formation = {3, 1}};
get({3, 115}) ->
    #endless_data{type = 3, id = 115,
		  name = lang:get(<<"第115波"/utf8>>), lev = 223,
		  unit_ids = [63115], is_reset = 0, formation = {4, 1}};
get({3, 116}) ->
    #endless_data{type = 3, id = 116,
		  name = lang:get(<<"第116波"/utf8>>), lev = 223,
		  unit_ids = [63116], is_reset = 0, formation = {4, 1}};
get({3, 117}) ->
    #endless_data{type = 3, id = 117,
		  name = lang:get(<<"第117波"/utf8>>), lev = 223,
		  unit_ids = [63117], is_reset = 0, formation = {5, 1}};
get({3, 118}) ->
    #endless_data{type = 3, id = 118,
		  name = lang:get(<<"第118波"/utf8>>), lev = 224,
		  unit_ids = [63118], is_reset = 0, formation = {5, 1}};
get({3, 119}) ->
    #endless_data{type = 3, id = 119,
		  name = lang:get(<<"第119波"/utf8>>), lev = 224,
		  unit_ids = [63119], is_reset = 0, formation = {6, 1}};
get({3, 120}) ->
    #endless_data{type = 3, id = 120,
		  name = lang:get(<<"第120波"/utf8>>), lev = 224,
		  unit_ids = [63120], is_reset = 0, formation = {6, 1}};
get({3, 121}) ->
    #endless_data{type = 3, id = 121,
		  name = lang:get(<<"第121波"/utf8>>), lev = 225,
		  unit_ids = [63121], is_reset = 0, formation = {1, 1}};
get({3, 122}) ->
    #endless_data{type = 3, id = 122,
		  name = lang:get(<<"第122波"/utf8>>), lev = 225,
		  unit_ids = [63122], is_reset = 0, formation = {1, 1}};
get({3, 123}) ->
    #endless_data{type = 3, id = 123,
		  name = lang:get(<<"第123波"/utf8>>), lev = 225,
		  unit_ids = [63123], is_reset = 0, formation = {2, 1}};
get({3, 124}) ->
    #endless_data{type = 3, id = 124,
		  name = lang:get(<<"第124波"/utf8>>), lev = 226,
		  unit_ids = [63109], is_reset = 0, formation = {2, 1}};
get({3, 125}) ->
    #endless_data{type = 3, id = 125,
		  name = lang:get(<<"第125波"/utf8>>), lev = 226,
		  unit_ids = [63110], is_reset = 0, formation = {3, 1}};
get({3, 126}) ->
    #endless_data{type = 3, id = 126,
		  name = lang:get(<<"第126波"/utf8>>), lev = 226,
		  unit_ids = [63111], is_reset = 0, formation = {3, 1}};
get({3, 127}) ->
    #endless_data{type = 3, id = 127,
		  name = lang:get(<<"第127波"/utf8>>), lev = 227,
		  unit_ids = [63112], is_reset = 0, formation = {4, 1}};
get({3, 128}) ->
    #endless_data{type = 3, id = 128,
		  name = lang:get(<<"第128波"/utf8>>), lev = 227,
		  unit_ids = [63113], is_reset = 0, formation = {4, 1}};
get({3, 129}) ->
    #endless_data{type = 3, id = 129,
		  name = lang:get(<<"第129波"/utf8>>), lev = 227,
		  unit_ids = [63114], is_reset = 0, formation = {5, 1}};
get({3, 130}) ->
    #endless_data{type = 3, id = 130,
		  name = lang:get(<<"第130波"/utf8>>), lev = 228,
		  unit_ids = [63115], is_reset = 0, formation = {5, 1}};
get({3, 131}) ->
    #endless_data{type = 3, id = 131,
		  name = lang:get(<<"第131波"/utf8>>), lev = 228,
		  unit_ids = [63116], is_reset = 0, formation = {6, 1}};
get({3, 132}) ->
    #endless_data{type = 3, id = 132,
		  name = lang:get(<<"第132波"/utf8>>), lev = 228,
		  unit_ids = [63117], is_reset = 0, formation = {6, 1}};
get({3, 133}) ->
    #endless_data{type = 3, id = 133,
		  name = lang:get(<<"第133波"/utf8>>), lev = 229,
		  unit_ids = [63118], is_reset = 0, formation = {1, 1}};
get({3, 134}) ->
    #endless_data{type = 3, id = 134,
		  name = lang:get(<<"第134波"/utf8>>), lev = 229,
		  unit_ids = [63119], is_reset = 0, formation = {1, 1}};
get({3, 135}) ->
    #endless_data{type = 3, id = 135,
		  name = lang:get(<<"第135波"/utf8>>), lev = 229,
		  unit_ids = [63120], is_reset = 0, formation = {2, 1}};
get({3, 136}) ->
    #endless_data{type = 3, id = 136,
		  name = lang:get(<<"第136波"/utf8>>), lev = 230,
		  unit_ids = [63121], is_reset = 0, formation = {2, 1}};
get({3, 137}) ->
    #endless_data{type = 3, id = 137,
		  name = lang:get(<<"第137波"/utf8>>), lev = 230,
		  unit_ids = [63122], is_reset = 0, formation = {3, 1}};
get({3, 138}) ->
    #endless_data{type = 3, id = 138,
		  name = lang:get(<<"第138波"/utf8>>), lev = 230,
		  unit_ids = [63123], is_reset = 0, formation = {3, 1}};
get({3, 139}) ->
    #endless_data{type = 3, id = 139,
		  name = lang:get(<<"第139波"/utf8>>), lev = 231,
		  unit_ids = [63109], is_reset = 0, formation = {4, 1}};
get({3, 140}) ->
    #endless_data{type = 3, id = 140,
		  name = lang:get(<<"第140波"/utf8>>), lev = 231,
		  unit_ids = [63110], is_reset = 0, formation = {4, 1}};
get({3, 141}) ->
    #endless_data{type = 3, id = 141,
		  name = lang:get(<<"第141波"/utf8>>), lev = 231,
		  unit_ids = [63111], is_reset = 0, formation = {5, 1}};
get({3, 142}) ->
    #endless_data{type = 3, id = 142,
		  name = lang:get(<<"第142波"/utf8>>), lev = 232,
		  unit_ids = [63112], is_reset = 0, formation = {5, 1}};
get({3, 143}) ->
    #endless_data{type = 3, id = 143,
		  name = lang:get(<<"第143波"/utf8>>), lev = 232,
		  unit_ids = [63113], is_reset = 0, formation = {6, 1}};
get({3, 144}) ->
    #endless_data{type = 3, id = 144,
		  name = lang:get(<<"第144波"/utf8>>), lev = 232,
		  unit_ids = [63114], is_reset = 0, formation = {6, 1}};
get({3, 145}) ->
    #endless_data{type = 3, id = 145,
		  name = lang:get(<<"第145波"/utf8>>), lev = 233,
		  unit_ids = [63115], is_reset = 0, formation = {1, 1}};
get({3, 146}) ->
    #endless_data{type = 3, id = 146,
		  name = lang:get(<<"第146波"/utf8>>), lev = 233,
		  unit_ids = [63116], is_reset = 0, formation = {1, 1}};
get({3, 147}) ->
    #endless_data{type = 3, id = 147,
		  name = lang:get(<<"第147波"/utf8>>), lev = 233,
		  unit_ids = [63117], is_reset = 0, formation = {2, 1}};
get({3, 148}) ->
    #endless_data{type = 3, id = 148,
		  name = lang:get(<<"第148波"/utf8>>), lev = 234,
		  unit_ids = [63118], is_reset = 0, formation = {2, 1}};
get({3, 149}) ->
    #endless_data{type = 3, id = 149,
		  name = lang:get(<<"第149波"/utf8>>), lev = 234,
		  unit_ids = [63119], is_reset = 0, formation = {3, 1}};
get({3, 150}) ->
    #endless_data{type = 3, id = 150,
		  name = lang:get(<<"第150波"/utf8>>), lev = 234,
		  unit_ids = [63120], is_reset = 0, formation = {3, 1}};
get({3, 151}) ->
    #endless_data{type = 3, id = 151,
		  name = lang:get(<<"第151波"/utf8>>), lev = 240,
		  unit_ids = [63109], is_reset = 0, formation = {1, 1}};
get({3, 152}) ->
    #endless_data{type = 3, id = 152,
		  name = lang:get(<<"第152波"/utf8>>), lev = 240,
		  unit_ids = [63110], is_reset = 0, formation = {1, 1}};
get({3, 153}) ->
    #endless_data{type = 3, id = 153,
		  name = lang:get(<<"第153波"/utf8>>), lev = 241,
		  unit_ids = [63111], is_reset = 0, formation = {2, 1}};
get({3, 154}) ->
    #endless_data{type = 3, id = 154,
		  name = lang:get(<<"第154波"/utf8>>), lev = 242,
		  unit_ids = [63112], is_reset = 0, formation = {2, 1}};
get({3, 155}) ->
    #endless_data{type = 3, id = 155,
		  name = lang:get(<<"第155波"/utf8>>), lev = 242,
		  unit_ids = [63113], is_reset = 0, formation = {3, 1}};
get({3, 156}) ->
    #endless_data{type = 3, id = 156,
		  name = lang:get(<<"第156波"/utf8>>), lev = 243,
		  unit_ids = [63114], is_reset = 0, formation = {3, 1}};
get({3, 157}) ->
    #endless_data{type = 3, id = 157,
		  name = lang:get(<<"第157波"/utf8>>), lev = 244,
		  unit_ids = [63115], is_reset = 0, formation = {4, 1}};
get({3, 158}) ->
    #endless_data{type = 3, id = 158,
		  name = lang:get(<<"第158波"/utf8>>), lev = 244,
		  unit_ids = [63116], is_reset = 0, formation = {4, 1}};
get({3, 159}) ->
    #endless_data{type = 3, id = 159,
		  name = lang:get(<<"第159波"/utf8>>), lev = 245,
		  unit_ids = [63117], is_reset = 0, formation = {5, 1}};
get({3, 160}) ->
    #endless_data{type = 3, id = 160,
		  name = lang:get(<<"第160波"/utf8>>), lev = 246,
		  unit_ids = [63118], is_reset = 0, formation = {5, 1}};
get({3, 161}) ->
    #endless_data{type = 3, id = 161,
		  name = lang:get(<<"第161波"/utf8>>), lev = 246,
		  unit_ids = [63119], is_reset = 0, formation = {6, 1}};
get({3, 162}) ->
    #endless_data{type = 3, id = 162,
		  name = lang:get(<<"第162波"/utf8>>), lev = 247,
		  unit_ids = [63120], is_reset = 0, formation = {6, 1}};
get({3, 163}) ->
    #endless_data{type = 3, id = 163,
		  name = lang:get(<<"第163波"/utf8>>), lev = 248,
		  unit_ids = [63121], is_reset = 0, formation = {1, 1}};
get({3, 164}) ->
    #endless_data{type = 3, id = 164,
		  name = lang:get(<<"第164波"/utf8>>), lev = 248,
		  unit_ids = [63122], is_reset = 0, formation = {1, 1}};
get({3, 165}) ->
    #endless_data{type = 3, id = 165,
		  name = lang:get(<<"第165波"/utf8>>), lev = 249,
		  unit_ids = [63123], is_reset = 0, formation = {2, 1}};
get({3, 166}) ->
    #endless_data{type = 3, id = 166,
		  name = lang:get(<<"第166波"/utf8>>), lev = 250,
		  unit_ids = [63109], is_reset = 0, formation = {2, 1}};
get({3, 167}) ->
    #endless_data{type = 3, id = 167,
		  name = lang:get(<<"第167波"/utf8>>), lev = 250,
		  unit_ids = [63110], is_reset = 0, formation = {3, 1}};
get({3, 168}) ->
    #endless_data{type = 3, id = 168,
		  name = lang:get(<<"第168波"/utf8>>), lev = 251,
		  unit_ids = [63111], is_reset = 0, formation = {3, 1}};
get({3, 169}) ->
    #endless_data{type = 3, id = 169,
		  name = lang:get(<<"第169波"/utf8>>), lev = 252,
		  unit_ids = [63112], is_reset = 0, formation = {4, 1}};
get({3, 170}) ->
    #endless_data{type = 3, id = 170,
		  name = lang:get(<<"第170波"/utf8>>), lev = 252,
		  unit_ids = [63113], is_reset = 0, formation = {4, 1}};
get({3, 171}) ->
    #endless_data{type = 3, id = 171,
		  name = lang:get(<<"第171波"/utf8>>), lev = 253,
		  unit_ids = [63114], is_reset = 0, formation = {5, 1}};
get({3, 172}) ->
    #endless_data{type = 3, id = 172,
		  name = lang:get(<<"第172波"/utf8>>), lev = 254,
		  unit_ids = [63115], is_reset = 0, formation = {5, 1}};
get({3, 173}) ->
    #endless_data{type = 3, id = 173,
		  name = lang:get(<<"第173波"/utf8>>), lev = 254,
		  unit_ids = [63116], is_reset = 0, formation = {6, 1}};
get({3, 174}) ->
    #endless_data{type = 3, id = 174,
		  name = lang:get(<<"第174波"/utf8>>), lev = 255,
		  unit_ids = [63117], is_reset = 0, formation = {6, 1}};
get({3, 175}) ->
    #endless_data{type = 3, id = 175,
		  name = lang:get(<<"第175波"/utf8>>), lev = 256,
		  unit_ids = [63118], is_reset = 0, formation = {1, 1}};
get({3, 176}) ->
    #endless_data{type = 3, id = 176,
		  name = lang:get(<<"第176波"/utf8>>), lev = 256,
		  unit_ids = [63119], is_reset = 0, formation = {1, 1}};
get({3, 177}) ->
    #endless_data{type = 3, id = 177,
		  name = lang:get(<<"第177波"/utf8>>), lev = 257,
		  unit_ids = [63120], is_reset = 0, formation = {2, 1}};
get({3, 178}) ->
    #endless_data{type = 3, id = 178,
		  name = lang:get(<<"第178波"/utf8>>), lev = 258,
		  unit_ids = [63121], is_reset = 0, formation = {2, 1}};
get({3, 179}) ->
    #endless_data{type = 3, id = 179,
		  name = lang:get(<<"第179波"/utf8>>), lev = 258,
		  unit_ids = [63122], is_reset = 0, formation = {3, 1}};
get({3, 180}) ->
    #endless_data{type = 3, id = 180,
		  name = lang:get(<<"第180波"/utf8>>), lev = 259,
		  unit_ids = [63123], is_reset = 0, formation = {3, 1}};
get({3, 181}) ->
    #endless_data{type = 3, id = 181,
		  name = lang:get(<<"第181波"/utf8>>), lev = 260,
		  unit_ids = [63109], is_reset = 0, formation = {4, 1}};
get({3, 182}) ->
    #endless_data{type = 3, id = 182,
		  name = lang:get(<<"第182波"/utf8>>), lev = 260,
		  unit_ids = [63110], is_reset = 0, formation = {4, 1}};
get({3, 183}) ->
    #endless_data{type = 3, id = 183,
		  name = lang:get(<<"第183波"/utf8>>), lev = 261,
		  unit_ids = [63111], is_reset = 0, formation = {5, 1}};
get({3, 184}) ->
    #endless_data{type = 3, id = 184,
		  name = lang:get(<<"第184波"/utf8>>), lev = 262,
		  unit_ids = [63112], is_reset = 0, formation = {5, 1}};
get({3, 185}) ->
    #endless_data{type = 3, id = 185,
		  name = lang:get(<<"第185波"/utf8>>), lev = 262,
		  unit_ids = [63113], is_reset = 0, formation = {6, 1}};
get({3, 186}) ->
    #endless_data{type = 3, id = 186,
		  name = lang:get(<<"第186波"/utf8>>), lev = 263,
		  unit_ids = [63114], is_reset = 0, formation = {6, 1}};
get({3, 187}) ->
    #endless_data{type = 3, id = 187,
		  name = lang:get(<<"第187波"/utf8>>), lev = 264,
		  unit_ids = [63115], is_reset = 0, formation = {1, 1}};
get({3, 188}) ->
    #endless_data{type = 3, id = 188,
		  name = lang:get(<<"第188波"/utf8>>), lev = 264,
		  unit_ids = [63116], is_reset = 0, formation = {1, 1}};
get({3, 189}) ->
    #endless_data{type = 3, id = 189,
		  name = lang:get(<<"第189波"/utf8>>), lev = 265,
		  unit_ids = [63117], is_reset = 0, formation = {2, 1}};
get({3, 190}) ->
    #endless_data{type = 3, id = 190,
		  name = lang:get(<<"第190波"/utf8>>), lev = 266,
		  unit_ids = [63118], is_reset = 0, formation = {2, 1}};
get({3, 191}) ->
    #endless_data{type = 3, id = 191,
		  name = lang:get(<<"第191波"/utf8>>), lev = 266,
		  unit_ids = [63119], is_reset = 0, formation = {3, 1}};
get({3, 192}) ->
    #endless_data{type = 3, id = 192,
		  name = lang:get(<<"第192波"/utf8>>), lev = 267,
		  unit_ids = [63120], is_reset = 0, formation = {3, 1}};
get({3, 193}) ->
    #endless_data{type = 3, id = 193,
		  name = lang:get(<<"第193波"/utf8>>), lev = 268,
		  unit_ids = [63121], is_reset = 0, formation = {4, 1}};
get({3, 194}) ->
    #endless_data{type = 3, id = 194,
		  name = lang:get(<<"第194波"/utf8>>), lev = 268,
		  unit_ids = [63122], is_reset = 0, formation = {4, 1}};
get({3, 195}) ->
    #endless_data{type = 3, id = 195,
		  name = lang:get(<<"第195波"/utf8>>), lev = 269,
		  unit_ids = [63123], is_reset = 0, formation = {5, 1}};
get({3, 196}) ->
    #endless_data{type = 3, id = 196,
		  name = lang:get(<<"第196波"/utf8>>), lev = 270,
		  unit_ids = [63109], is_reset = 0, formation = {5, 1}};
get({3, 197}) ->
    #endless_data{type = 3, id = 197,
		  name = lang:get(<<"第197波"/utf8>>), lev = 270,
		  unit_ids = [63110], is_reset = 0, formation = {6, 1}};
get({3, 198}) ->
    #endless_data{type = 3, id = 198,
		  name = lang:get(<<"第198波"/utf8>>), lev = 271,
		  unit_ids = [63111], is_reset = 0, formation = {6, 1}};
get({3, 199}) ->
    #endless_data{type = 3, id = 199,
		  name = lang:get(<<"第199波"/utf8>>), lev = 272,
		  unit_ids = [63112], is_reset = 0, formation = {1, 1}};
get({3, 200}) ->
    #endless_data{type = 3, id = 200,
		  name = lang:get(<<"第200波"/utf8>>), lev = 272,
		  unit_ids = [63113], is_reset = 0, formation = {1, 1}};
get({3, 201}) ->
    #endless_data{type = 3, id = 201,
		  name = lang:get(<<"第201波"/utf8>>), lev = 273,
		  unit_ids = [63114], is_reset = 0, formation = {2, 1}};
get({3, 202}) ->
    #endless_data{type = 3, id = 202,
		  name = lang:get(<<"第202波"/utf8>>), lev = 274,
		  unit_ids = [63115], is_reset = 0, formation = {2, 1}};
get({3, 203}) ->
    #endless_data{type = 3, id = 203,
		  name = lang:get(<<"第203波"/utf8>>), lev = 274,
		  unit_ids = [63116], is_reset = 0, formation = {3, 1}};
get({3, 204}) ->
    #endless_data{type = 3, id = 204,
		  name = lang:get(<<"第204波"/utf8>>), lev = 275,
		  unit_ids = [63117], is_reset = 0, formation = {3, 1}};
get({3, 205}) ->
    #endless_data{type = 3, id = 205,
		  name = lang:get(<<"第205波"/utf8>>), lev = 276,
		  unit_ids = [63118], is_reset = 0, formation = {4, 1}};
get({3, 206}) ->
    #endless_data{type = 3, id = 206,
		  name = lang:get(<<"第206波"/utf8>>), lev = 276,
		  unit_ids = [63119], is_reset = 0, formation = {4, 1}};
get({3, 207}) ->
    #endless_data{type = 3, id = 207,
		  name = lang:get(<<"第207波"/utf8>>), lev = 277,
		  unit_ids = [63120], is_reset = 0, formation = {5, 1}};
get({3, 208}) ->
    #endless_data{type = 3, id = 208,
		  name = lang:get(<<"第208波"/utf8>>), lev = 278,
		  unit_ids = [63121], is_reset = 0, formation = {5, 1}};
get({3, 209}) ->
    #endless_data{type = 3, id = 209,
		  name = lang:get(<<"第209波"/utf8>>), lev = 278,
		  unit_ids = [63122], is_reset = 0, formation = {6, 1}};
get({3, 210}) ->
    #endless_data{type = 3, id = 210,
		  name = lang:get(<<"第210波"/utf8>>), lev = 279,
		  unit_ids = [63123], is_reset = 0, formation = {6, 1}};
get({3, 211}) ->
    #endless_data{type = 3, id = 211,
		  name = lang:get(<<"第211波"/utf8>>), lev = 280,
		  unit_ids = [63109], is_reset = 0, formation = {1, 1}};
get({3, 212}) ->
    #endless_data{type = 3, id = 212,
		  name = lang:get(<<"第212波"/utf8>>), lev = 280,
		  unit_ids = [63110], is_reset = 0, formation = {1, 1}};
get({3, 213}) ->
    #endless_data{type = 3, id = 213,
		  name = lang:get(<<"第213波"/utf8>>), lev = 281,
		  unit_ids = [63111], is_reset = 0, formation = {2, 1}};
get({3, 214}) ->
    #endless_data{type = 3, id = 214,
		  name = lang:get(<<"第214波"/utf8>>), lev = 282,
		  unit_ids = [63112], is_reset = 0, formation = {2, 1}};
get({3, 215}) ->
    #endless_data{type = 3, id = 215,
		  name = lang:get(<<"第215波"/utf8>>), lev = 282,
		  unit_ids = [63113], is_reset = 0, formation = {3, 1}};
get({3, 216}) ->
    #endless_data{type = 3, id = 216,
		  name = lang:get(<<"第216波"/utf8>>), lev = 283,
		  unit_ids = [63114], is_reset = 0, formation = {3, 1}};
get({3, 217}) ->
    #endless_data{type = 3, id = 217,
		  name = lang:get(<<"第217波"/utf8>>), lev = 284,
		  unit_ids = [63115], is_reset = 0, formation = {4, 1}};
get({3, 218}) ->
    #endless_data{type = 3, id = 218,
		  name = lang:get(<<"第218波"/utf8>>), lev = 284,
		  unit_ids = [63116], is_reset = 0, formation = {4, 1}};
get({3, 219}) ->
    #endless_data{type = 3, id = 219,
		  name = lang:get(<<"第219波"/utf8>>), lev = 285,
		  unit_ids = [63117], is_reset = 0, formation = {5, 1}};
get({3, 220}) ->
    #endless_data{type = 3, id = 220,
		  name = lang:get(<<"第220波"/utf8>>), lev = 286,
		  unit_ids = [63118], is_reset = 0, formation = {5, 1}};
get({3, 221}) ->
    #endless_data{type = 3, id = 221,
		  name = lang:get(<<"第221波"/utf8>>), lev = 286,
		  unit_ids = [63119], is_reset = 0, formation = {6, 1}};
get({3, 222}) ->
    #endless_data{type = 3, id = 222,
		  name = lang:get(<<"第222波"/utf8>>), lev = 287,
		  unit_ids = [63120], is_reset = 0, formation = {6, 1}};
get({3, 223}) ->
    #endless_data{type = 3, id = 223,
		  name = lang:get(<<"第223波"/utf8>>), lev = 288,
		  unit_ids = [63121], is_reset = 0, formation = {1, 1}};
get({3, 224}) ->
    #endless_data{type = 3, id = 224,
		  name = lang:get(<<"第224波"/utf8>>), lev = 288,
		  unit_ids = [63122], is_reset = 0, formation = {1, 1}};
get({3, 225}) ->
    #endless_data{type = 3, id = 225,
		  name = lang:get(<<"第225波"/utf8>>), lev = 289,
		  unit_ids = [63123], is_reset = 0, formation = {2, 1}};
get({3, 226}) ->
    #endless_data{type = 3, id = 226,
		  name = lang:get(<<"第226波"/utf8>>), lev = 290,
		  unit_ids = [63109], is_reset = 0, formation = {2, 1}};
get({3, 227}) ->
    #endless_data{type = 3, id = 227,
		  name = lang:get(<<"第227波"/utf8>>), lev = 290,
		  unit_ids = [63110], is_reset = 0, formation = {3, 1}};
get({3, 228}) ->
    #endless_data{type = 3, id = 228,
		  name = lang:get(<<"第228波"/utf8>>), lev = 291,
		  unit_ids = [63111], is_reset = 0, formation = {3, 1}};
get({3, 229}) ->
    #endless_data{type = 3, id = 229,
		  name = lang:get(<<"第229波"/utf8>>), lev = 292,
		  unit_ids = [63112], is_reset = 0, formation = {4, 1}};
get({3, 230}) ->
    #endless_data{type = 3, id = 230,
		  name = lang:get(<<"第230波"/utf8>>), lev = 292,
		  unit_ids = [63113], is_reset = 0, formation = {4, 1}};
get({3, 231}) ->
    #endless_data{type = 3, id = 231,
		  name = lang:get(<<"第231波"/utf8>>), lev = 293,
		  unit_ids = [63114], is_reset = 0, formation = {5, 1}};
get({3, 232}) ->
    #endless_data{type = 3, id = 232,
		  name = lang:get(<<"第232波"/utf8>>), lev = 294,
		  unit_ids = [63115], is_reset = 0, formation = {5, 1}};
get({3, 233}) ->
    #endless_data{type = 3, id = 233,
		  name = lang:get(<<"第233波"/utf8>>), lev = 294,
		  unit_ids = [63116], is_reset = 0, formation = {6, 1}};
get({3, 234}) ->
    #endless_data{type = 3, id = 234,
		  name = lang:get(<<"第234波"/utf8>>), lev = 295,
		  unit_ids = [63117], is_reset = 0, formation = {6, 1}};
get({3, 235}) ->
    #endless_data{type = 3, id = 235,
		  name = lang:get(<<"第235波"/utf8>>), lev = 296,
		  unit_ids = [63118], is_reset = 0, formation = {1, 1}};
get({3, 236}) ->
    #endless_data{type = 3, id = 236,
		  name = lang:get(<<"第236波"/utf8>>), lev = 296,
		  unit_ids = [63119], is_reset = 0, formation = {1, 1}};
get({3, 237}) ->
    #endless_data{type = 3, id = 237,
		  name = lang:get(<<"第237波"/utf8>>), lev = 297,
		  unit_ids = [63120], is_reset = 0, formation = {2, 1}};
get({3, 238}) ->
    #endless_data{type = 3, id = 238,
		  name = lang:get(<<"第238波"/utf8>>), lev = 298,
		  unit_ids = [63121], is_reset = 0, formation = {2, 1}};
get({3, 239}) ->
    #endless_data{type = 3, id = 239,
		  name = lang:get(<<"第239波"/utf8>>), lev = 298,
		  unit_ids = [63122], is_reset = 0, formation = {3, 1}};
get({3, 240}) ->
    #endless_data{type = 3, id = 240,
		  name = lang:get(<<"第240波"/utf8>>), lev = 299,
		  unit_ids = [63123], is_reset = 0, formation = {3, 1}};
get({3, 241}) ->
    #endless_data{type = 3, id = 241,
		  name = lang:get(<<"第241波"/utf8>>), lev = 300,
		  unit_ids = [63109], is_reset = 0, formation = {4, 1}};
get({3, 242}) ->
    #endless_data{type = 3, id = 242,
		  name = lang:get(<<"第242波"/utf8>>), lev = 300,
		  unit_ids = [63110], is_reset = 0, formation = {4, 1}};
get({3, 243}) ->
    #endless_data{type = 3, id = 243,
		  name = lang:get(<<"第243波"/utf8>>), lev = 301,
		  unit_ids = [63111], is_reset = 0, formation = {5, 1}};
get({3, 244}) ->
    #endless_data{type = 3, id = 244,
		  name = lang:get(<<"第244波"/utf8>>), lev = 302,
		  unit_ids = [63112], is_reset = 0, formation = {5, 1}};
get({3, 245}) ->
    #endless_data{type = 3, id = 245,
		  name = lang:get(<<"第245波"/utf8>>), lev = 302,
		  unit_ids = [63113], is_reset = 0, formation = {6, 1}};
get({3, 246}) ->
    #endless_data{type = 3, id = 246,
		  name = lang:get(<<"第246波"/utf8>>), lev = 303,
		  unit_ids = [63114], is_reset = 0, formation = {6, 1}};
get({3, 247}) ->
    #endless_data{type = 3, id = 247,
		  name = lang:get(<<"第247波"/utf8>>), lev = 304,
		  unit_ids = [63115], is_reset = 0, formation = {1, 1}};
get({3, 248}) ->
    #endless_data{type = 3, id = 248,
		  name = lang:get(<<"第248波"/utf8>>), lev = 304,
		  unit_ids = [63116], is_reset = 0, formation = {1, 1}};
get({3, 249}) ->
    #endless_data{type = 3, id = 249,
		  name = lang:get(<<"第249波"/utf8>>), lev = 305,
		  unit_ids = [63117], is_reset = 0, formation = {2, 1}};
get({3, 250}) ->
    #endless_data{type = 3, id = 250,
		  name = lang:get(<<"第250波"/utf8>>), lev = 306,
		  unit_ids = [63118], is_reset = 0, formation = {2, 1}};
get({3, 251}) ->
    #endless_data{type = 3, id = 251,
		  name = lang:get(<<"第251波"/utf8>>), lev = 306,
		  unit_ids = [63119], is_reset = 0, formation = {3, 1}};
get({3, 252}) ->
    #endless_data{type = 3, id = 252,
		  name = lang:get(<<"第252波"/utf8>>), lev = 307,
		  unit_ids = [63120], is_reset = 0, formation = {3, 1}};
get({3, 253}) ->
    #endless_data{type = 3, id = 253,
		  name = lang:get(<<"第253波"/utf8>>), lev = 308,
		  unit_ids = [63121], is_reset = 0, formation = {4, 1}};
get({3, 254}) ->
    #endless_data{type = 3, id = 254,
		  name = lang:get(<<"第254波"/utf8>>), lev = 308,
		  unit_ids = [63122], is_reset = 0, formation = {4, 1}};
get({3, 255}) ->
    #endless_data{type = 3, id = 255,
		  name = lang:get(<<"第255波"/utf8>>), lev = 309,
		  unit_ids = [63123], is_reset = 0, formation = {5, 1}};
get({3, 256}) ->
    #endless_data{type = 3, id = 256,
		  name = lang:get(<<"第256波"/utf8>>), lev = 310,
		  unit_ids = [63109], is_reset = 0, formation = {5, 1}};
get({3, 257}) ->
    #endless_data{type = 3, id = 257,
		  name = lang:get(<<"第257波"/utf8>>), lev = 310,
		  unit_ids = [63110], is_reset = 0, formation = {6, 1}};
get({3, 258}) ->
    #endless_data{type = 3, id = 258,
		  name = lang:get(<<"第258波"/utf8>>), lev = 311,
		  unit_ids = [63111], is_reset = 0, formation = {6, 1}};
get({3, 259}) ->
    #endless_data{type = 3, id = 259,
		  name = lang:get(<<"第259波"/utf8>>), lev = 312,
		  unit_ids = [63112], is_reset = 0, formation = {1, 1}};
get({3, 260}) ->
    #endless_data{type = 3, id = 260,
		  name = lang:get(<<"第260波"/utf8>>), lev = 312,
		  unit_ids = [63113], is_reset = 0, formation = {1, 1}};
get({3, 261}) ->
    #endless_data{type = 3, id = 261,
		  name = lang:get(<<"第261波"/utf8>>), lev = 313,
		  unit_ids = [63114], is_reset = 0, formation = {2, 1}};
get({3, 262}) ->
    #endless_data{type = 3, id = 262,
		  name = lang:get(<<"第262波"/utf8>>), lev = 314,
		  unit_ids = [63115], is_reset = 0, formation = {2, 1}};
get({3, 263}) ->
    #endless_data{type = 3, id = 263,
		  name = lang:get(<<"第263波"/utf8>>), lev = 314,
		  unit_ids = [63116], is_reset = 0, formation = {3, 1}};
get({3, 264}) ->
    #endless_data{type = 3, id = 264,
		  name = lang:get(<<"第264波"/utf8>>), lev = 315,
		  unit_ids = [63117], is_reset = 0, formation = {3, 1}};
get({3, 265}) ->
    #endless_data{type = 3, id = 265,
		  name = lang:get(<<"第265波"/utf8>>), lev = 316,
		  unit_ids = [63118], is_reset = 0, formation = {4, 1}};
get({3, 266}) ->
    #endless_data{type = 3, id = 266,
		  name = lang:get(<<"第266波"/utf8>>), lev = 316,
		  unit_ids = [63119], is_reset = 0, formation = {4, 1}};
get({3, 267}) ->
    #endless_data{type = 3, id = 267,
		  name = lang:get(<<"第267波"/utf8>>), lev = 317,
		  unit_ids = [63120], is_reset = 0, formation = {5, 1}};
get({3, 268}) ->
    #endless_data{type = 3, id = 268,
		  name = lang:get(<<"第268波"/utf8>>), lev = 318,
		  unit_ids = [63121], is_reset = 0, formation = {5, 1}};
get({3, 269}) ->
    #endless_data{type = 3, id = 269,
		  name = lang:get(<<"第269波"/utf8>>), lev = 318,
		  unit_ids = [63122], is_reset = 0, formation = {6, 1}};
get({3, 270}) ->
    #endless_data{type = 3, id = 270,
		  name = lang:get(<<"第270波"/utf8>>), lev = 319,
		  unit_ids = [63123], is_reset = 0, formation = {6, 1}};
get({3, 271}) ->
    #endless_data{type = 3, id = 271,
		  name = lang:get(<<"第271波"/utf8>>), lev = 320,
		  unit_ids = [63109], is_reset = 0, formation = {1, 1}};
get({3, 272}) ->
    #endless_data{type = 3, id = 272,
		  name = lang:get(<<"第272波"/utf8>>), lev = 320,
		  unit_ids = [63110], is_reset = 0, formation = {1, 1}};
get({3, 273}) ->
    #endless_data{type = 3, id = 273,
		  name = lang:get(<<"第273波"/utf8>>), lev = 321,
		  unit_ids = [63111], is_reset = 0, formation = {2, 1}};
get({3, 274}) ->
    #endless_data{type = 3, id = 274,
		  name = lang:get(<<"第274波"/utf8>>), lev = 322,
		  unit_ids = [63112], is_reset = 0, formation = {2, 1}};
get({3, 275}) ->
    #endless_data{type = 3, id = 275,
		  name = lang:get(<<"第275波"/utf8>>), lev = 322,
		  unit_ids = [63113], is_reset = 0, formation = {3, 1}};
get({3, 276}) ->
    #endless_data{type = 3, id = 276,
		  name = lang:get(<<"第276波"/utf8>>), lev = 323,
		  unit_ids = [63114], is_reset = 0, formation = {3, 1}};
get({3, 277}) ->
    #endless_data{type = 3, id = 277,
		  name = lang:get(<<"第277波"/utf8>>), lev = 324,
		  unit_ids = [63115], is_reset = 0, formation = {4, 1}};
get({3, 278}) ->
    #endless_data{type = 3, id = 278,
		  name = lang:get(<<"第278波"/utf8>>), lev = 324,
		  unit_ids = [63116], is_reset = 0, formation = {4, 1}};
get({3, 279}) ->
    #endless_data{type = 3, id = 279,
		  name = lang:get(<<"第279波"/utf8>>), lev = 325,
		  unit_ids = [63117], is_reset = 0, formation = {5, 1}};
get({3, 280}) ->
    #endless_data{type = 3, id = 280,
		  name = lang:get(<<"第280波"/utf8>>), lev = 326,
		  unit_ids = [63118], is_reset = 0, formation = {5, 1}};
get({3, 281}) ->
    #endless_data{type = 3, id = 281,
		  name = lang:get(<<"第281波"/utf8>>), lev = 326,
		  unit_ids = [63119], is_reset = 0, formation = {6, 1}};
get({3, 282}) ->
    #endless_data{type = 3, id = 282,
		  name = lang:get(<<"第282波"/utf8>>), lev = 327,
		  unit_ids = [63120], is_reset = 0, formation = {6, 1}};
get({3, 283}) ->
    #endless_data{type = 3, id = 283,
		  name = lang:get(<<"第283波"/utf8>>), lev = 328,
		  unit_ids = [63121], is_reset = 0, formation = {1, 1}};
get({3, 284}) ->
    #endless_data{type = 3, id = 284,
		  name = lang:get(<<"第284波"/utf8>>), lev = 328,
		  unit_ids = [63122], is_reset = 0, formation = {1, 1}};
get({3, 285}) ->
    #endless_data{type = 3, id = 285,
		  name = lang:get(<<"第285波"/utf8>>), lev = 329,
		  unit_ids = [63123], is_reset = 0, formation = {2, 1}};
get({3, 286}) ->
    #endless_data{type = 3, id = 286,
		  name = lang:get(<<"第286波"/utf8>>), lev = 330,
		  unit_ids = [63109], is_reset = 0, formation = {2, 1}};
get({3, 287}) ->
    #endless_data{type = 3, id = 287,
		  name = lang:get(<<"第287波"/utf8>>), lev = 330,
		  unit_ids = [63110], is_reset = 0, formation = {3, 1}};
get({3, 288}) ->
    #endless_data{type = 3, id = 288,
		  name = lang:get(<<"第288波"/utf8>>), lev = 331,
		  unit_ids = [63111], is_reset = 0, formation = {3, 1}};
get({3, 289}) ->
    #endless_data{type = 3, id = 289,
		  name = lang:get(<<"第289波"/utf8>>), lev = 332,
		  unit_ids = [63112], is_reset = 0, formation = {4, 1}};
get({3, 290}) ->
    #endless_data{type = 3, id = 290,
		  name = lang:get(<<"第290波"/utf8>>), lev = 332,
		  unit_ids = [63113], is_reset = 0, formation = {4, 1}};
get({3, 291}) ->
    #endless_data{type = 3, id = 291,
		  name = lang:get(<<"第291波"/utf8>>), lev = 333,
		  unit_ids = [63114], is_reset = 0, formation = {5, 1}};
get({3, 292}) ->
    #endless_data{type = 3, id = 292,
		  name = lang:get(<<"第292波"/utf8>>), lev = 334,
		  unit_ids = [63115], is_reset = 0, formation = {5, 1}};
get({3, 293}) ->
    #endless_data{type = 3, id = 293,
		  name = lang:get(<<"第293波"/utf8>>), lev = 334,
		  unit_ids = [63116], is_reset = 0, formation = {6, 1}};
get({3, 294}) ->
    #endless_data{type = 3, id = 294,
		  name = lang:get(<<"第294波"/utf8>>), lev = 335,
		  unit_ids = [63117], is_reset = 0, formation = {6, 1}};
get({3, 295}) ->
    #endless_data{type = 3, id = 295,
		  name = lang:get(<<"第295波"/utf8>>), lev = 336,
		  unit_ids = [63118], is_reset = 0, formation = {1, 1}};
get({3, 296}) ->
    #endless_data{type = 3, id = 296,
		  name = lang:get(<<"第296波"/utf8>>), lev = 336,
		  unit_ids = [63119], is_reset = 0, formation = {1, 1}};
get({3, 297}) ->
    #endless_data{type = 3, id = 297,
		  name = lang:get(<<"第297波"/utf8>>), lev = 337,
		  unit_ids = [63120], is_reset = 0, formation = {2, 1}};
get({3, 298}) ->
    #endless_data{type = 3, id = 298,
		  name = lang:get(<<"第298波"/utf8>>), lev = 338,
		  unit_ids = [63121], is_reset = 0, formation = {2, 1}};
get({3, 299}) ->
    #endless_data{type = 3, id = 299,
		  name = lang:get(<<"第299波"/utf8>>), lev = 338,
		  unit_ids = [63122], is_reset = 0, formation = {3, 1}};
get({3, 300}) ->
    #endless_data{type = 3, id = 300,
		  name = lang:get(<<"第300波"/utf8>>), lev = 339,
		  unit_ids = [63123], is_reset = 0, formation = {3, 1}};
get({3, 301}) ->
    #endless_data{type = 3, id = 301,
		  name = lang:get(<<"第301波"/utf8>>), lev = 340,
		  unit_ids = [63109], is_reset = 0, formation = {4, 1}};
get({3, 302}) ->
    #endless_data{type = 3, id = 302,
		  name = lang:get(<<"第302波"/utf8>>), lev = 340,
		  unit_ids = [63110], is_reset = 0, formation = {4, 1}};
get({3, 303}) ->
    #endless_data{type = 3, id = 303,
		  name = lang:get(<<"第303波"/utf8>>), lev = 341,
		  unit_ids = [63111], is_reset = 0, formation = {5, 1}};
get({3, 304}) ->
    #endless_data{type = 3, id = 304,
		  name = lang:get(<<"第304波"/utf8>>), lev = 342,
		  unit_ids = [63112], is_reset = 0, formation = {5, 1}};
get({3, 305}) ->
    #endless_data{type = 3, id = 305,
		  name = lang:get(<<"第305波"/utf8>>), lev = 342,
		  unit_ids = [63113], is_reset = 0, formation = {6, 1}};
get({3, 306}) ->
    #endless_data{type = 3, id = 306,
		  name = lang:get(<<"第306波"/utf8>>), lev = 343,
		  unit_ids = [63114], is_reset = 0, formation = {6, 1}};
get({3, 307}) ->
    #endless_data{type = 3, id = 307,
		  name = lang:get(<<"第307波"/utf8>>), lev = 344,
		  unit_ids = [63115], is_reset = 0, formation = {1, 1}};
get({3, 308}) ->
    #endless_data{type = 3, id = 308,
		  name = lang:get(<<"第308波"/utf8>>), lev = 344,
		  unit_ids = [63116], is_reset = 0, formation = {1, 1}};
get({3, 309}) ->
    #endless_data{type = 3, id = 309,
		  name = lang:get(<<"第309波"/utf8>>), lev = 345,
		  unit_ids = [63117], is_reset = 0, formation = {2, 1}};
get({3, 310}) ->
    #endless_data{type = 3, id = 310,
		  name = lang:get(<<"第310波"/utf8>>), lev = 346,
		  unit_ids = [63118], is_reset = 0, formation = {2, 1}};
get({3, 311}) ->
    #endless_data{type = 3, id = 311,
		  name = lang:get(<<"第311波"/utf8>>), lev = 346,
		  unit_ids = [63119], is_reset = 0, formation = {3, 1}};
get({3, 312}) ->
    #endless_data{type = 3, id = 312,
		  name = lang:get(<<"第312波"/utf8>>), lev = 347,
		  unit_ids = [63120], is_reset = 0, formation = {3, 1}};
get({3, 313}) ->
    #endless_data{type = 3, id = 313,
		  name = lang:get(<<"第313波"/utf8>>), lev = 348,
		  unit_ids = [63121], is_reset = 0, formation = {4, 1}};
get({3, 314}) ->
    #endless_data{type = 3, id = 314,
		  name = lang:get(<<"第314波"/utf8>>), lev = 348,
		  unit_ids = [63122], is_reset = 0, formation = {4, 1}};
get({3, 315}) ->
    #endless_data{type = 3, id = 315,
		  name = lang:get(<<"第315波"/utf8>>), lev = 349,
		  unit_ids = [63123], is_reset = 0, formation = {5, 1}};
get({3, 316}) ->
    #endless_data{type = 3, id = 316,
		  name = lang:get(<<"第316波"/utf8>>), lev = 350,
		  unit_ids = [63109], is_reset = 0, formation = {5, 1}};
get({3, 317}) ->
    #endless_data{type = 3, id = 317,
		  name = lang:get(<<"第317波"/utf8>>), lev = 350,
		  unit_ids = [63110], is_reset = 0, formation = {6, 1}};
get({3, 318}) ->
    #endless_data{type = 3, id = 318,
		  name = lang:get(<<"第318波"/utf8>>), lev = 351,
		  unit_ids = [63111], is_reset = 0, formation = {6, 1}};
get({3, 319}) ->
    #endless_data{type = 3, id = 319,
		  name = lang:get(<<"第319波"/utf8>>), lev = 352,
		  unit_ids = [63112], is_reset = 0, formation = {1, 1}};
get({3, 320}) ->
    #endless_data{type = 3, id = 320,
		  name = lang:get(<<"第320波"/utf8>>), lev = 352,
		  unit_ids = [63113], is_reset = 0, formation = {1, 1}};
get({3, 321}) ->
    #endless_data{type = 3, id = 321,
		  name = lang:get(<<"第321波"/utf8>>), lev = 353,
		  unit_ids = [63114], is_reset = 0, formation = {2, 1}};
get({3, 322}) ->
    #endless_data{type = 3, id = 322,
		  name = lang:get(<<"第322波"/utf8>>), lev = 354,
		  unit_ids = [63115], is_reset = 0, formation = {2, 1}};
get({3, 323}) ->
    #endless_data{type = 3, id = 323,
		  name = lang:get(<<"第323波"/utf8>>), lev = 354,
		  unit_ids = [63116], is_reset = 0, formation = {3, 1}};
get({3, 324}) ->
    #endless_data{type = 3, id = 324,
		  name = lang:get(<<"第324波"/utf8>>), lev = 355,
		  unit_ids = [63117], is_reset = 0, formation = {3, 1}};
get({3, 325}) ->
    #endless_data{type = 3, id = 325,
		  name = lang:get(<<"第325波"/utf8>>), lev = 356,
		  unit_ids = [63118], is_reset = 0, formation = {4, 1}};
get({3, 326}) ->
    #endless_data{type = 3, id = 326,
		  name = lang:get(<<"第326波"/utf8>>), lev = 356,
		  unit_ids = [63119], is_reset = 0, formation = {4, 1}};
get({3, 327}) ->
    #endless_data{type = 3, id = 327,
		  name = lang:get(<<"第327波"/utf8>>), lev = 357,
		  unit_ids = [63120], is_reset = 0, formation = {5, 1}};
get({3, 328}) ->
    #endless_data{type = 3, id = 328,
		  name = lang:get(<<"第328波"/utf8>>), lev = 358,
		  unit_ids = [63121], is_reset = 0, formation = {5, 1}};
get({3, 329}) ->
    #endless_data{type = 3, id = 329,
		  name = lang:get(<<"第329波"/utf8>>), lev = 358,
		  unit_ids = [63122], is_reset = 0, formation = {6, 1}};
get({3, 330}) ->
    #endless_data{type = 3, id = 330,
		  name = lang:get(<<"第330波"/utf8>>), lev = 359,
		  unit_ids = [63123], is_reset = 0, formation = {6, 1}};
get({3, 331}) ->
    #endless_data{type = 3, id = 331,
		  name = lang:get(<<"第331波"/utf8>>), lev = 360,
		  unit_ids = [63109], is_reset = 0, formation = {1, 1}};
get({3, 332}) ->
    #endless_data{type = 3, id = 332,
		  name = lang:get(<<"第332波"/utf8>>), lev = 360,
		  unit_ids = [63110], is_reset = 0, formation = {1, 1}};
get({3, 333}) ->
    #endless_data{type = 3, id = 333,
		  name = lang:get(<<"第333波"/utf8>>), lev = 361,
		  unit_ids = [63111], is_reset = 0, formation = {2, 1}};
get({3, 334}) ->
    #endless_data{type = 3, id = 334,
		  name = lang:get(<<"第334波"/utf8>>), lev = 362,
		  unit_ids = [63112], is_reset = 0, formation = {2, 1}};
get({3, 335}) ->
    #endless_data{type = 3, id = 335,
		  name = lang:get(<<"第335波"/utf8>>), lev = 362,
		  unit_ids = [63113], is_reset = 0, formation = {3, 1}};
get({3, 336}) ->
    #endless_data{type = 3, id = 336,
		  name = lang:get(<<"第336波"/utf8>>), lev = 363,
		  unit_ids = [63114], is_reset = 0, formation = {3, 1}};
get({3, 337}) ->
    #endless_data{type = 3, id = 337,
		  name = lang:get(<<"第337波"/utf8>>), lev = 364,
		  unit_ids = [63115], is_reset = 0, formation = {4, 1}};
get({3, 338}) ->
    #endless_data{type = 3, id = 338,
		  name = lang:get(<<"第338波"/utf8>>), lev = 364,
		  unit_ids = [63116], is_reset = 0, formation = {4, 1}};
get({3, 339}) ->
    #endless_data{type = 3, id = 339,
		  name = lang:get(<<"第339波"/utf8>>), lev = 365,
		  unit_ids = [63117], is_reset = 0, formation = {5, 1}};
get({3, 340}) ->
    #endless_data{type = 3, id = 340,
		  name = lang:get(<<"第340波"/utf8>>), lev = 366,
		  unit_ids = [63118], is_reset = 0, formation = {5, 1}};
get({3, 341}) ->
    #endless_data{type = 3, id = 341,
		  name = lang:get(<<"第341波"/utf8>>), lev = 366,
		  unit_ids = [63119], is_reset = 0, formation = {6, 1}};
get({3, 342}) ->
    #endless_data{type = 3, id = 342,
		  name = lang:get(<<"第342波"/utf8>>), lev = 367,
		  unit_ids = [63120], is_reset = 0, formation = {6, 1}};
get({3, 343}) ->
    #endless_data{type = 3, id = 343,
		  name = lang:get(<<"第343波"/utf8>>), lev = 368,
		  unit_ids = [63121], is_reset = 0, formation = {1, 1}};
get({3, 344}) ->
    #endless_data{type = 3, id = 344,
		  name = lang:get(<<"第344波"/utf8>>), lev = 368,
		  unit_ids = [63122], is_reset = 0, formation = {1, 1}};
get({3, 345}) ->
    #endless_data{type = 3, id = 345,
		  name = lang:get(<<"第345波"/utf8>>), lev = 369,
		  unit_ids = [63123], is_reset = 0, formation = {2, 1}};
get({3, 346}) ->
    #endless_data{type = 3, id = 346,
		  name = lang:get(<<"第346波"/utf8>>), lev = 370,
		  unit_ids = [63109], is_reset = 0, formation = {2, 1}};
get({3, 347}) ->
    #endless_data{type = 3, id = 347,
		  name = lang:get(<<"第347波"/utf8>>), lev = 370,
		  unit_ids = [63110], is_reset = 0, formation = {3, 1}};
get({3, 348}) ->
    #endless_data{type = 3, id = 348,
		  name = lang:get(<<"第348波"/utf8>>), lev = 371,
		  unit_ids = [63111], is_reset = 0, formation = {3, 1}};
get({3, 349}) ->
    #endless_data{type = 3, id = 349,
		  name = lang:get(<<"第349波"/utf8>>), lev = 372,
		  unit_ids = [63112], is_reset = 0, formation = {4, 1}};
get({3, 350}) ->
    #endless_data{type = 3, id = 350,
		  name = lang:get(<<"第350波"/utf8>>), lev = 372,
		  unit_ids = [63113], is_reset = 0, formation = {4, 1}};
get({3, 351}) ->
    #endless_data{type = 3, id = 351,
		  name = lang:get(<<"第351波"/utf8>>), lev = 373,
		  unit_ids = [63114], is_reset = 0, formation = {5, 1}};
get({3, 352}) ->
    #endless_data{type = 3, id = 352,
		  name = lang:get(<<"第352波"/utf8>>), lev = 374,
		  unit_ids = [63115], is_reset = 0, formation = {5, 1}};
get({3, 353}) ->
    #endless_data{type = 3, id = 353,
		  name = lang:get(<<"第353波"/utf8>>), lev = 374,
		  unit_ids = [63116], is_reset = 0, formation = {6, 1}};
get({3, 354}) ->
    #endless_data{type = 3, id = 354,
		  name = lang:get(<<"第354波"/utf8>>), lev = 375,
		  unit_ids = [63117], is_reset = 0, formation = {6, 1}};
get({3, 355}) ->
    #endless_data{type = 3, id = 355,
		  name = lang:get(<<"第355波"/utf8>>), lev = 376,
		  unit_ids = [63118], is_reset = 0, formation = {1, 1}};
get({3, 356}) ->
    #endless_data{type = 3, id = 356,
		  name = lang:get(<<"第356波"/utf8>>), lev = 376,
		  unit_ids = [63119], is_reset = 0, formation = {1, 1}};
get({3, 357}) ->
    #endless_data{type = 3, id = 357,
		  name = lang:get(<<"第357波"/utf8>>), lev = 377,
		  unit_ids = [63120], is_reset = 0, formation = {2, 1}};
get({3, 358}) ->
    #endless_data{type = 3, id = 358,
		  name = lang:get(<<"第358波"/utf8>>), lev = 378,
		  unit_ids = [63121], is_reset = 0, formation = {2, 1}};
get({3, 359}) ->
    #endless_data{type = 3, id = 359,
		  name = lang:get(<<"第359波"/utf8>>), lev = 378,
		  unit_ids = [63122], is_reset = 0, formation = {3, 1}};
get({3, 360}) ->
    #endless_data{type = 3, id = 360,
		  name = lang:get(<<"第360波"/utf8>>), lev = 379,
		  unit_ids = [63123], is_reset = 0, formation = {3, 1}};
get({3, 361}) ->
    #endless_data{type = 3, id = 361,
		  name = lang:get(<<"第361波"/utf8>>), lev = 380,
		  unit_ids = [63109], is_reset = 0, formation = {4, 1}};
get({3, 362}) ->
    #endless_data{type = 3, id = 362,
		  name = lang:get(<<"第362波"/utf8>>), lev = 380,
		  unit_ids = [63110], is_reset = 0, formation = {4, 1}};
get({3, 363}) ->
    #endless_data{type = 3, id = 363,
		  name = lang:get(<<"第363波"/utf8>>), lev = 381,
		  unit_ids = [63111], is_reset = 0, formation = {5, 1}};
get({3, 364}) ->
    #endless_data{type = 3, id = 364,
		  name = lang:get(<<"第364波"/utf8>>), lev = 382,
		  unit_ids = [63112], is_reset = 0, formation = {5, 1}};
get({3, 365}) ->
    #endless_data{type = 3, id = 365,
		  name = lang:get(<<"第365波"/utf8>>), lev = 382,
		  unit_ids = [63113], is_reset = 0, formation = {6, 1}};
get({3, 366}) ->
    #endless_data{type = 3, id = 366,
		  name = lang:get(<<"第366波"/utf8>>), lev = 383,
		  unit_ids = [63114], is_reset = 0, formation = {6, 1}};
get({3, 367}) ->
    #endless_data{type = 3, id = 367,
		  name = lang:get(<<"第367波"/utf8>>), lev = 384,
		  unit_ids = [63115], is_reset = 0, formation = {1, 1}};
get({3, 368}) ->
    #endless_data{type = 3, id = 368,
		  name = lang:get(<<"第368波"/utf8>>), lev = 384,
		  unit_ids = [63116], is_reset = 0, formation = {1, 1}};
get({3, 369}) ->
    #endless_data{type = 3, id = 369,
		  name = lang:get(<<"第369波"/utf8>>), lev = 385,
		  unit_ids = [63117], is_reset = 0, formation = {2, 1}};
get({3, 370}) ->
    #endless_data{type = 3, id = 370,
		  name = lang:get(<<"第370波"/utf8>>), lev = 386,
		  unit_ids = [63118], is_reset = 0, formation = {2, 1}};
get({3, 371}) ->
    #endless_data{type = 3, id = 371,
		  name = lang:get(<<"第371波"/utf8>>), lev = 386,
		  unit_ids = [63119], is_reset = 0, formation = {3, 1}};
get({3, 372}) ->
    #endless_data{type = 3, id = 372,
		  name = lang:get(<<"第372波"/utf8>>), lev = 387,
		  unit_ids = [63120], is_reset = 0, formation = {3, 1}};
get({3, 373}) ->
    #endless_data{type = 3, id = 373,
		  name = lang:get(<<"第373波"/utf8>>), lev = 388,
		  unit_ids = [63121], is_reset = 0, formation = {4, 1}};
get({3, 374}) ->
    #endless_data{type = 3, id = 374,
		  name = lang:get(<<"第374波"/utf8>>), lev = 388,
		  unit_ids = [63122], is_reset = 0, formation = {4, 1}};
get({3, 375}) ->
    #endless_data{type = 3, id = 375,
		  name = lang:get(<<"第375波"/utf8>>), lev = 389,
		  unit_ids = [63123], is_reset = 0, formation = {5, 1}};
get({3, 376}) ->
    #endless_data{type = 3, id = 376,
		  name = lang:get(<<"第376波"/utf8>>), lev = 390,
		  unit_ids = [63109], is_reset = 0, formation = {5, 1}};
get({3, 377}) ->
    #endless_data{type = 3, id = 377,
		  name = lang:get(<<"第377波"/utf8>>), lev = 390,
		  unit_ids = [63110], is_reset = 0, formation = {6, 1}};
get({3, 378}) ->
    #endless_data{type = 3, id = 378,
		  name = lang:get(<<"第378波"/utf8>>), lev = 391,
		  unit_ids = [63111], is_reset = 0, formation = {6, 1}};
get({3, 379}) ->
    #endless_data{type = 3, id = 379,
		  name = lang:get(<<"第379波"/utf8>>), lev = 392,
		  unit_ids = [63112], is_reset = 0, formation = {1, 1}};
get({3, 380}) ->
    #endless_data{type = 3, id = 380,
		  name = lang:get(<<"第380波"/utf8>>), lev = 392,
		  unit_ids = [63113], is_reset = 0, formation = {1, 1}};
get({3, 381}) ->
    #endless_data{type = 3, id = 381,
		  name = lang:get(<<"第381波"/utf8>>), lev = 393,
		  unit_ids = [63114], is_reset = 0, formation = {2, 1}};
get({3, 382}) ->
    #endless_data{type = 3, id = 382,
		  name = lang:get(<<"第382波"/utf8>>), lev = 394,
		  unit_ids = [63115], is_reset = 0, formation = {2, 1}};
get({3, 383}) ->
    #endless_data{type = 3, id = 383,
		  name = lang:get(<<"第383波"/utf8>>), lev = 394,
		  unit_ids = [63116], is_reset = 0, formation = {3, 1}};
get({3, 384}) ->
    #endless_data{type = 3, id = 384,
		  name = lang:get(<<"第384波"/utf8>>), lev = 395,
		  unit_ids = [63117], is_reset = 0, formation = {3, 1}};
get({3, 385}) ->
    #endless_data{type = 3, id = 385,
		  name = lang:get(<<"第385波"/utf8>>), lev = 396,
		  unit_ids = [63118], is_reset = 0, formation = {4, 1}};
get({3, 386}) ->
    #endless_data{type = 3, id = 386,
		  name = lang:get(<<"第386波"/utf8>>), lev = 396,
		  unit_ids = [63119], is_reset = 0, formation = {4, 1}};
get({3, 387}) ->
    #endless_data{type = 3, id = 387,
		  name = lang:get(<<"第387波"/utf8>>), lev = 397,
		  unit_ids = [63120], is_reset = 0, formation = {5, 1}};
get({3, 388}) ->
    #endless_data{type = 3, id = 388,
		  name = lang:get(<<"第388波"/utf8>>), lev = 398,
		  unit_ids = [63121], is_reset = 0, formation = {5, 1}};
get({3, 389}) ->
    #endless_data{type = 3, id = 389,
		  name = lang:get(<<"第389波"/utf8>>), lev = 398,
		  unit_ids = [63122], is_reset = 0, formation = {6, 1}};
get({3, 390}) ->
    #endless_data{type = 3, id = 390,
		  name = lang:get(<<"第390波"/utf8>>), lev = 399,
		  unit_ids = [63123], is_reset = 0, formation = {6, 1}};
get({3, 391}) ->
    #endless_data{type = 3, id = 391,
		  name = lang:get(<<"第391波"/utf8>>), lev = 400,
		  unit_ids = [63109], is_reset = 0, formation = {1, 1}};
get({3, 392}) ->
    #endless_data{type = 3, id = 392,
		  name = lang:get(<<"第392波"/utf8>>), lev = 400,
		  unit_ids = [63110], is_reset = 0, formation = {1, 1}};
get({3, 393}) ->
    #endless_data{type = 3, id = 393,
		  name = lang:get(<<"第393波"/utf8>>), lev = 401,
		  unit_ids = [63111], is_reset = 0, formation = {2, 1}};
get({3, 394}) ->
    #endless_data{type = 3, id = 394,
		  name = lang:get(<<"第394波"/utf8>>), lev = 402,
		  unit_ids = [63112], is_reset = 0, formation = {2, 1}};
get({3, 395}) ->
    #endless_data{type = 3, id = 395,
		  name = lang:get(<<"第395波"/utf8>>), lev = 402,
		  unit_ids = [63113], is_reset = 0, formation = {3, 1}};
get({3, 396}) ->
    #endless_data{type = 3, id = 396,
		  name = lang:get(<<"第396波"/utf8>>), lev = 403,
		  unit_ids = [63114], is_reset = 0, formation = {3, 1}};
get({3, 397}) ->
    #endless_data{type = 3, id = 397,
		  name = lang:get(<<"第397波"/utf8>>), lev = 404,
		  unit_ids = [63115], is_reset = 0, formation = {4, 1}};
get({3, 398}) ->
    #endless_data{type = 3, id = 398,
		  name = lang:get(<<"第398波"/utf8>>), lev = 404,
		  unit_ids = [63116], is_reset = 0, formation = {4, 1}};
get({3, 399}) ->
    #endless_data{type = 3, id = 399,
		  name = lang:get(<<"第399波"/utf8>>), lev = 405,
		  unit_ids = [63117], is_reset = 0, formation = {5, 1}};
get({3, 400}) ->
    #endless_data{type = 3, id = 400,
		  name = lang:get(<<"第400波"/utf8>>), lev = 406,
		  unit_ids = [63118], is_reset = 0, formation = {5, 1}};
get({3, 401}) ->
    #endless_data{type = 3, id = 401,
		  name = lang:get(<<"第401波"/utf8>>), lev = 406,
		  unit_ids = [63119], is_reset = 0, formation = {6, 1}};
get({3, 402}) ->
    #endless_data{type = 3, id = 402,
		  name = lang:get(<<"第402波"/utf8>>), lev = 407,
		  unit_ids = [63120], is_reset = 0, formation = {6, 1}};
get({3, 403}) ->
    #endless_data{type = 3, id = 403,
		  name = lang:get(<<"第403波"/utf8>>), lev = 408,
		  unit_ids = [63121], is_reset = 0, formation = {1, 1}};
get({3, 404}) ->
    #endless_data{type = 3, id = 404,
		  name = lang:get(<<"第404波"/utf8>>), lev = 408,
		  unit_ids = [63122], is_reset = 0, formation = {1, 1}};
get({3, 405}) ->
    #endless_data{type = 3, id = 405,
		  name = lang:get(<<"第405波"/utf8>>), lev = 409,
		  unit_ids = [63123], is_reset = 0, formation = {2, 1}};
get({3, 406}) ->
    #endless_data{type = 3, id = 406,
		  name = lang:get(<<"第406波"/utf8>>), lev = 410,
		  unit_ids = [63109], is_reset = 0, formation = {2, 1}};
get({3, 407}) ->
    #endless_data{type = 3, id = 407,
		  name = lang:get(<<"第407波"/utf8>>), lev = 410,
		  unit_ids = [63110], is_reset = 0, formation = {3, 1}};
get({3, 408}) ->
    #endless_data{type = 3, id = 408,
		  name = lang:get(<<"第408波"/utf8>>), lev = 411,
		  unit_ids = [63111], is_reset = 0, formation = {3, 1}};
get({3, 409}) ->
    #endless_data{type = 3, id = 409,
		  name = lang:get(<<"第409波"/utf8>>), lev = 412,
		  unit_ids = [63112], is_reset = 0, formation = {4, 1}};
get({3, 410}) ->
    #endless_data{type = 3, id = 410,
		  name = lang:get(<<"第410波"/utf8>>), lev = 412,
		  unit_ids = [63113], is_reset = 0, formation = {4, 1}};
get({3, 411}) ->
    #endless_data{type = 3, id = 411,
		  name = lang:get(<<"第411波"/utf8>>), lev = 413,
		  unit_ids = [63114], is_reset = 0, formation = {5, 1}};
get({3, 412}) ->
    #endless_data{type = 3, id = 412,
		  name = lang:get(<<"第412波"/utf8>>), lev = 414,
		  unit_ids = [63115], is_reset = 0, formation = {5, 1}};
get({3, 413}) ->
    #endless_data{type = 3, id = 413,
		  name = lang:get(<<"第413波"/utf8>>), lev = 414,
		  unit_ids = [63116], is_reset = 0, formation = {6, 1}};
get({3, 414}) ->
    #endless_data{type = 3, id = 414,
		  name = lang:get(<<"第414波"/utf8>>), lev = 415,
		  unit_ids = [63117], is_reset = 0, formation = {6, 1}};
get({3, 415}) ->
    #endless_data{type = 3, id = 415,
		  name = lang:get(<<"第415波"/utf8>>), lev = 416,
		  unit_ids = [63118], is_reset = 0, formation = {1, 1}};
get({3, 416}) ->
    #endless_data{type = 3, id = 416,
		  name = lang:get(<<"第416波"/utf8>>), lev = 416,
		  unit_ids = [63119], is_reset = 0, formation = {1, 1}};
get({3, 417}) ->
    #endless_data{type = 3, id = 417,
		  name = lang:get(<<"第417波"/utf8>>), lev = 417,
		  unit_ids = [63120], is_reset = 0, formation = {2, 1}};
get({3, 418}) ->
    #endless_data{type = 3, id = 418,
		  name = lang:get(<<"第418波"/utf8>>), lev = 418,
		  unit_ids = [63121], is_reset = 0, formation = {2, 1}};
get({3, 419}) ->
    #endless_data{type = 3, id = 419,
		  name = lang:get(<<"第419波"/utf8>>), lev = 418,
		  unit_ids = [63122], is_reset = 0, formation = {3, 1}};
get({3, 420}) ->
    #endless_data{type = 3, id = 420,
		  name = lang:get(<<"第420波"/utf8>>), lev = 419,
		  unit_ids = [63123], is_reset = 0, formation = {3, 1}};
get({3, 421}) ->
    #endless_data{type = 3, id = 421,
		  name = lang:get(<<"第421波"/utf8>>), lev = 420,
		  unit_ids = [63109], is_reset = 0, formation = {4, 1}};
get({3, 422}) ->
    #endless_data{type = 3, id = 422,
		  name = lang:get(<<"第422波"/utf8>>), lev = 420,
		  unit_ids = [63110], is_reset = 0, formation = {4, 1}};
get({3, 423}) ->
    #endless_data{type = 3, id = 423,
		  name = lang:get(<<"第423波"/utf8>>), lev = 421,
		  unit_ids = [63111], is_reset = 0, formation = {5, 1}};
get({3, 424}) ->
    #endless_data{type = 3, id = 424,
		  name = lang:get(<<"第424波"/utf8>>), lev = 422,
		  unit_ids = [63112], is_reset = 0, formation = {5, 1}};
get({3, 425}) ->
    #endless_data{type = 3, id = 425,
		  name = lang:get(<<"第425波"/utf8>>), lev = 422,
		  unit_ids = [63113], is_reset = 0, formation = {6, 1}};
get({3, 426}) ->
    #endless_data{type = 3, id = 426,
		  name = lang:get(<<"第426波"/utf8>>), lev = 423,
		  unit_ids = [63114], is_reset = 0, formation = {6, 1}};
get({3, 427}) ->
    #endless_data{type = 3, id = 427,
		  name = lang:get(<<"第427波"/utf8>>), lev = 424,
		  unit_ids = [63115], is_reset = 0, formation = {1, 1}};
get({3, 428}) ->
    #endless_data{type = 3, id = 428,
		  name = lang:get(<<"第428波"/utf8>>), lev = 424,
		  unit_ids = [63116], is_reset = 0, formation = {1, 1}};
get({3, 429}) ->
    #endless_data{type = 3, id = 429,
		  name = lang:get(<<"第429波"/utf8>>), lev = 425,
		  unit_ids = [63117], is_reset = 0, formation = {2, 1}};
get({3, 430}) ->
    #endless_data{type = 3, id = 430,
		  name = lang:get(<<"第430波"/utf8>>), lev = 426,
		  unit_ids = [63118], is_reset = 0, formation = {2, 1}};
get({3, 431}) ->
    #endless_data{type = 3, id = 431,
		  name = lang:get(<<"第431波"/utf8>>), lev = 426,
		  unit_ids = [63119], is_reset = 0, formation = {3, 1}};
get({3, 432}) ->
    #endless_data{type = 3, id = 432,
		  name = lang:get(<<"第432波"/utf8>>), lev = 427,
		  unit_ids = [63120], is_reset = 0, formation = {3, 1}};
get({3, 433}) ->
    #endless_data{type = 3, id = 433,
		  name = lang:get(<<"第433波"/utf8>>), lev = 428,
		  unit_ids = [63121], is_reset = 0, formation = {4, 1}};
get({3, 434}) ->
    #endless_data{type = 3, id = 434,
		  name = lang:get(<<"第434波"/utf8>>), lev = 428,
		  unit_ids = [63122], is_reset = 0, formation = {4, 1}};
get({3, 435}) ->
    #endless_data{type = 3, id = 435,
		  name = lang:get(<<"第435波"/utf8>>), lev = 429,
		  unit_ids = [63123], is_reset = 0, formation = {5, 1}};
get({3, 436}) ->
    #endless_data{type = 3, id = 436,
		  name = lang:get(<<"第436波"/utf8>>), lev = 430,
		  unit_ids = [63109], is_reset = 0, formation = {5, 1}};
get({3, 437}) ->
    #endless_data{type = 3, id = 437,
		  name = lang:get(<<"第437波"/utf8>>), lev = 430,
		  unit_ids = [63110], is_reset = 0, formation = {6, 1}};
get({3, 438}) ->
    #endless_data{type = 3, id = 438,
		  name = lang:get(<<"第438波"/utf8>>), lev = 431,
		  unit_ids = [63111], is_reset = 0, formation = {6, 1}};
get({3, 439}) ->
    #endless_data{type = 3, id = 439,
		  name = lang:get(<<"第439波"/utf8>>), lev = 432,
		  unit_ids = [63112], is_reset = 0, formation = {1, 1}};
get({3, 440}) ->
    #endless_data{type = 3, id = 440,
		  name = lang:get(<<"第440波"/utf8>>), lev = 432,
		  unit_ids = [63113], is_reset = 0, formation = {1, 1}};
get({3, 441}) ->
    #endless_data{type = 3, id = 441,
		  name = lang:get(<<"第441波"/utf8>>), lev = 433,
		  unit_ids = [63114], is_reset = 0, formation = {2, 1}};
get({3, 442}) ->
    #endless_data{type = 3, id = 442,
		  name = lang:get(<<"第442波"/utf8>>), lev = 434,
		  unit_ids = [63115], is_reset = 0, formation = {2, 1}};
get({3, 443}) ->
    #endless_data{type = 3, id = 443,
		  name = lang:get(<<"第443波"/utf8>>), lev = 434,
		  unit_ids = [63116], is_reset = 0, formation = {3, 1}};
get({3, 444}) ->
    #endless_data{type = 3, id = 444,
		  name = lang:get(<<"第444波"/utf8>>), lev = 435,
		  unit_ids = [63117], is_reset = 0, formation = {3, 1}};
get({3, 445}) ->
    #endless_data{type = 3, id = 445,
		  name = lang:get(<<"第445波"/utf8>>), lev = 436,
		  unit_ids = [63118], is_reset = 0, formation = {4, 1}};
get({3, 446}) ->
    #endless_data{type = 3, id = 446,
		  name = lang:get(<<"第446波"/utf8>>), lev = 436,
		  unit_ids = [63119], is_reset = 0, formation = {4, 1}};
get({3, 447}) ->
    #endless_data{type = 3, id = 447,
		  name = lang:get(<<"第447波"/utf8>>), lev = 437,
		  unit_ids = [63120], is_reset = 0, formation = {5, 1}};
get({3, 448}) ->
    #endless_data{type = 3, id = 448,
		  name = lang:get(<<"第448波"/utf8>>), lev = 438,
		  unit_ids = [63121], is_reset = 0, formation = {5, 1}};
get({3, 449}) ->
    #endless_data{type = 3, id = 449,
		  name = lang:get(<<"第449波"/utf8>>), lev = 438,
		  unit_ids = [63122], is_reset = 0, formation = {6, 1}};
get({3, 450}) ->
    #endless_data{type = 3, id = 450,
		  name = lang:get(<<"第450波"/utf8>>), lev = 439,
		  unit_ids = [63123], is_reset = 0, formation = {6, 1}};
get({3, 451}) ->
    #endless_data{type = 3, id = 451,
		  name = lang:get(<<"第451波"/utf8>>), lev = 440,
		  unit_ids = [63109], is_reset = 0, formation = {1, 1}};
get({3, 452}) ->
    #endless_data{type = 3, id = 452,
		  name = lang:get(<<"第452波"/utf8>>), lev = 440,
		  unit_ids = [63110], is_reset = 0, formation = {1, 1}};
get({3, 453}) ->
    #endless_data{type = 3, id = 453,
		  name = lang:get(<<"第453波"/utf8>>), lev = 441,
		  unit_ids = [63111], is_reset = 0, formation = {2, 1}};
get({3, 454}) ->
    #endless_data{type = 3, id = 454,
		  name = lang:get(<<"第454波"/utf8>>), lev = 442,
		  unit_ids = [63112], is_reset = 0, formation = {2, 1}};
get({3, 455}) ->
    #endless_data{type = 3, id = 455,
		  name = lang:get(<<"第455波"/utf8>>), lev = 442,
		  unit_ids = [63113], is_reset = 0, formation = {3, 1}};
get({3, 456}) ->
    #endless_data{type = 3, id = 456,
		  name = lang:get(<<"第456波"/utf8>>), lev = 443,
		  unit_ids = [63114], is_reset = 0, formation = {3, 1}};
get({3, 457}) ->
    #endless_data{type = 3, id = 457,
		  name = lang:get(<<"第457波"/utf8>>), lev = 444,
		  unit_ids = [63115], is_reset = 0, formation = {4, 1}};
get({3, 458}) ->
    #endless_data{type = 3, id = 458,
		  name = lang:get(<<"第458波"/utf8>>), lev = 444,
		  unit_ids = [63116], is_reset = 0, formation = {4, 1}};
get({3, 459}) ->
    #endless_data{type = 3, id = 459,
		  name = lang:get(<<"第459波"/utf8>>), lev = 445,
		  unit_ids = [63117], is_reset = 0, formation = {5, 1}};
get({3, 460}) ->
    #endless_data{type = 3, id = 460,
		  name = lang:get(<<"第460波"/utf8>>), lev = 446,
		  unit_ids = [63118], is_reset = 0, formation = {5, 1}};
get({3, 461}) ->
    #endless_data{type = 3, id = 461,
		  name = lang:get(<<"第461波"/utf8>>), lev = 446,
		  unit_ids = [63119], is_reset = 0, formation = {6, 1}};
get({3, 462}) ->
    #endless_data{type = 3, id = 462,
		  name = lang:get(<<"第462波"/utf8>>), lev = 447,
		  unit_ids = [63120], is_reset = 0, formation = {6, 1}};
get({3, 463}) ->
    #endless_data{type = 3, id = 463,
		  name = lang:get(<<"第463波"/utf8>>), lev = 448,
		  unit_ids = [63121], is_reset = 0, formation = {1, 1}};
get({3, 464}) ->
    #endless_data{type = 3, id = 464,
		  name = lang:get(<<"第464波"/utf8>>), lev = 448,
		  unit_ids = [63122], is_reset = 0, formation = {1, 1}};
get({3, 465}) ->
    #endless_data{type = 3, id = 465,
		  name = lang:get(<<"第465波"/utf8>>), lev = 449,
		  unit_ids = [63123], is_reset = 0, formation = {2, 1}};
get({3, 466}) ->
    #endless_data{type = 3, id = 466,
		  name = lang:get(<<"第466波"/utf8>>), lev = 450,
		  unit_ids = [63109], is_reset = 0, formation = {2, 1}};
get({3, 467}) ->
    #endless_data{type = 3, id = 467,
		  name = lang:get(<<"第467波"/utf8>>), lev = 450,
		  unit_ids = [63110], is_reset = 0, formation = {3, 1}};
get({3, 468}) ->
    #endless_data{type = 3, id = 468,
		  name = lang:get(<<"第468波"/utf8>>), lev = 451,
		  unit_ids = [63111], is_reset = 0, formation = {3, 1}};
get({3, 469}) ->
    #endless_data{type = 3, id = 469,
		  name = lang:get(<<"第469波"/utf8>>), lev = 452,
		  unit_ids = [63112], is_reset = 0, formation = {4, 1}};
get({3, 470}) ->
    #endless_data{type = 3, id = 470,
		  name = lang:get(<<"第470波"/utf8>>), lev = 452,
		  unit_ids = [63113], is_reset = 0, formation = {4, 1}};
get({3, 471}) ->
    #endless_data{type = 3, id = 471,
		  name = lang:get(<<"第471波"/utf8>>), lev = 453,
		  unit_ids = [63114], is_reset = 0, formation = {5, 1}};
get({3, 472}) ->
    #endless_data{type = 3, id = 472,
		  name = lang:get(<<"第472波"/utf8>>), lev = 454,
		  unit_ids = [63115], is_reset = 0, formation = {5, 1}};
get({3, 473}) ->
    #endless_data{type = 3, id = 473,
		  name = lang:get(<<"第473波"/utf8>>), lev = 454,
		  unit_ids = [63116], is_reset = 0, formation = {6, 1}};
get({3, 474}) ->
    #endless_data{type = 3, id = 474,
		  name = lang:get(<<"第474波"/utf8>>), lev = 455,
		  unit_ids = [63117], is_reset = 0, formation = {6, 1}};
get({3, 475}) ->
    #endless_data{type = 3, id = 475,
		  name = lang:get(<<"第475波"/utf8>>), lev = 456,
		  unit_ids = [63118], is_reset = 0, formation = {1, 1}};
get({3, 476}) ->
    #endless_data{type = 3, id = 476,
		  name = lang:get(<<"第476波"/utf8>>), lev = 456,
		  unit_ids = [63119], is_reset = 0, formation = {1, 1}};
get({3, 477}) ->
    #endless_data{type = 3, id = 477,
		  name = lang:get(<<"第477波"/utf8>>), lev = 457,
		  unit_ids = [63120], is_reset = 0, formation = {2, 1}};
get({3, 478}) ->
    #endless_data{type = 3, id = 478,
		  name = lang:get(<<"第478波"/utf8>>), lev = 458,
		  unit_ids = [63121], is_reset = 0, formation = {2, 1}};
get({3, 479}) ->
    #endless_data{type = 3, id = 479,
		  name = lang:get(<<"第479波"/utf8>>), lev = 458,
		  unit_ids = [63122], is_reset = 0, formation = {3, 1}};
get({3, 480}) ->
    #endless_data{type = 3, id = 480,
		  name = lang:get(<<"第480波"/utf8>>), lev = 459,
		  unit_ids = [63123], is_reset = 0, formation = {3, 1}};
get({3, 481}) ->
    #endless_data{type = 3, id = 481,
		  name = lang:get(<<"第481波"/utf8>>), lev = 460,
		  unit_ids = [63109], is_reset = 0, formation = {4, 1}};
get({3, 482}) ->
    #endless_data{type = 3, id = 482,
		  name = lang:get(<<"第482波"/utf8>>), lev = 460,
		  unit_ids = [63110], is_reset = 0, formation = {4, 1}};
get({3, 483}) ->
    #endless_data{type = 3, id = 483,
		  name = lang:get(<<"第483波"/utf8>>), lev = 461,
		  unit_ids = [63111], is_reset = 0, formation = {5, 1}};
get({3, 484}) ->
    #endless_data{type = 3, id = 484,
		  name = lang:get(<<"第484波"/utf8>>), lev = 462,
		  unit_ids = [63112], is_reset = 0, formation = {5, 1}};
get({3, 485}) ->
    #endless_data{type = 3, id = 485,
		  name = lang:get(<<"第485波"/utf8>>), lev = 462,
		  unit_ids = [63113], is_reset = 0, formation = {6, 1}};
get({3, 486}) ->
    #endless_data{type = 3, id = 486,
		  name = lang:get(<<"第486波"/utf8>>), lev = 463,
		  unit_ids = [63114], is_reset = 0, formation = {6, 1}};
get({3, 487}) ->
    #endless_data{type = 3, id = 487,
		  name = lang:get(<<"第487波"/utf8>>), lev = 464,
		  unit_ids = [63115], is_reset = 0, formation = {1, 1}};
get({3, 488}) ->
    #endless_data{type = 3, id = 488,
		  name = lang:get(<<"第488波"/utf8>>), lev = 464,
		  unit_ids = [63116], is_reset = 0, formation = {1, 1}};
get({3, 489}) ->
    #endless_data{type = 3, id = 489,
		  name = lang:get(<<"第489波"/utf8>>), lev = 465,
		  unit_ids = [63117], is_reset = 0, formation = {2, 1}};
get({3, 490}) ->
    #endless_data{type = 3, id = 490,
		  name = lang:get(<<"第490波"/utf8>>), lev = 466,
		  unit_ids = [63118], is_reset = 0, formation = {2, 1}};
get({3, 491}) ->
    #endless_data{type = 3, id = 491,
		  name = lang:get(<<"第491波"/utf8>>), lev = 466,
		  unit_ids = [63119], is_reset = 0, formation = {3, 1}};
get({3, 492}) ->
    #endless_data{type = 3, id = 492,
		  name = lang:get(<<"第492波"/utf8>>), lev = 467,
		  unit_ids = [63120], is_reset = 0, formation = {3, 1}};
get({3, 493}) ->
    #endless_data{type = 3, id = 493,
		  name = lang:get(<<"第493波"/utf8>>), lev = 468,
		  unit_ids = [63121], is_reset = 0, formation = {4, 1}};
get({3, 494}) ->
    #endless_data{type = 3, id = 494,
		  name = lang:get(<<"第494波"/utf8>>), lev = 468,
		  unit_ids = [63122], is_reset = 0, formation = {4, 1}};
get({3, 495}) ->
    #endless_data{type = 3, id = 495,
		  name = lang:get(<<"第495波"/utf8>>), lev = 469,
		  unit_ids = [63123], is_reset = 0, formation = {5, 1}};
get({3, 496}) ->
    #endless_data{type = 3, id = 496,
		  name = lang:get(<<"第496波"/utf8>>), lev = 470,
		  unit_ids = [63109], is_reset = 0, formation = {5, 1}};
get({3, 497}) ->
    #endless_data{type = 3, id = 497,
		  name = lang:get(<<"第497波"/utf8>>), lev = 470,
		  unit_ids = [63110], is_reset = 0, formation = {6, 1}};
get({3, 498}) ->
    #endless_data{type = 3, id = 498,
		  name = lang:get(<<"第498波"/utf8>>), lev = 471,
		  unit_ids = [63111], is_reset = 0, formation = {6, 1}};
get({3, 499}) ->
    #endless_data{type = 3, id = 499,
		  name = lang:get(<<"第499波"/utf8>>), lev = 472,
		  unit_ids = [63112], is_reset = 0, formation = {1, 1}};
get({3, 500}) ->
    #endless_data{type = 3, id = 500,
		  name = lang:get(<<"第500波"/utf8>>), lev = 472,
		  unit_ids = [63113], is_reset = 0, formation = {1, 1}};
get({4, 1}) ->
    #endless_data{type = 4, id = 1,
		  name = lang:get(<<"第1波"/utf8>>), lev = 185,
		  unit_ids = [64101], is_reset = 0, formation = {1, 1}};
get({4, 2}) ->
    #endless_data{type = 4, id = 2,
		  name = lang:get(<<"第2波"/utf8>>), lev = 185,
		  unit_ids = [64102], is_reset = 0, formation = {1, 1}};
get({4, 3}) ->
    #endless_data{type = 4, id = 3,
		  name = lang:get(<<"第3波"/utf8>>), lev = 185,
		  unit_ids = [64103], is_reset = 0, formation = {2, 1}};
get({4, 4}) ->
    #endless_data{type = 4, id = 4,
		  name = lang:get(<<"第4波"/utf8>>), lev = 186,
		  unit_ids = [64104], is_reset = 0, formation = {2, 1}};
get({4, 5}) ->
    #endless_data{type = 4, id = 5,
		  name = lang:get(<<"第5波"/utf8>>), lev = 186,
		  unit_ids = [64105], is_reset = 0, formation = {3, 1}};
get({4, 6}) ->
    #endless_data{type = 4, id = 6,
		  name = lang:get(<<"第6波"/utf8>>), lev = 186,
		  unit_ids = [64106], is_reset = 0, formation = {3, 1}};
get({4, 7}) ->
    #endless_data{type = 4, id = 7,
		  name = lang:get(<<"第7波"/utf8>>), lev = 187,
		  unit_ids = [64107], is_reset = 0, formation = {4, 1}};
get({4, 8}) ->
    #endless_data{type = 4, id = 8,
		  name = lang:get(<<"第8波"/utf8>>), lev = 187,
		  unit_ids = [64108], is_reset = 0, formation = {4, 1}};
get({4, 9}) ->
    #endless_data{type = 4, id = 9,
		  name = lang:get(<<"第9波"/utf8>>), lev = 187,
		  unit_ids = [64101], is_reset = 0, formation = {5, 1}};
get({4, 10}) ->
    #endless_data{type = 4, id = 10,
		  name = lang:get(<<"第10波"/utf8>>), lev = 188,
		  unit_ids = [64102], is_reset = 0, formation = {5, 1}};
get({4, 11}) ->
    #endless_data{type = 4, id = 11,
		  name = lang:get(<<"第11波"/utf8>>), lev = 188,
		  unit_ids = [64103], is_reset = 0, formation = {6, 1}};
get({4, 12}) ->
    #endless_data{type = 4, id = 12,
		  name = lang:get(<<"第12波"/utf8>>), lev = 188,
		  unit_ids = [64104], is_reset = 0, formation = {6, 1}};
get({4, 13}) ->
    #endless_data{type = 4, id = 13,
		  name = lang:get(<<"第13波"/utf8>>), lev = 189,
		  unit_ids = [64105], is_reset = 0, formation = {1, 1}};
get({4, 14}) ->
    #endless_data{type = 4, id = 14,
		  name = lang:get(<<"第14波"/utf8>>), lev = 189,
		  unit_ids = [64106], is_reset = 0, formation = {1, 1}};
get({4, 15}) ->
    #endless_data{type = 4, id = 15,
		  name = lang:get(<<"第15波"/utf8>>), lev = 189,
		  unit_ids = [64107], is_reset = 0, formation = {2, 1}};
get({4, 16}) ->
    #endless_data{type = 4, id = 16,
		  name = lang:get(<<"第16波"/utf8>>), lev = 190,
		  unit_ids = [64108], is_reset = 0, formation = {2, 1}};
get({4, 17}) ->
    #endless_data{type = 4, id = 17,
		  name = lang:get(<<"第17波"/utf8>>), lev = 190,
		  unit_ids = [64101], is_reset = 0, formation = {3, 1}};
get({4, 18}) ->
    #endless_data{type = 4, id = 18,
		  name = lang:get(<<"第18波"/utf8>>), lev = 190,
		  unit_ids = [64102], is_reset = 0, formation = {3, 1}};
get({4, 19}) ->
    #endless_data{type = 4, id = 19,
		  name = lang:get(<<"第19波"/utf8>>), lev = 191,
		  unit_ids = [64103], is_reset = 0, formation = {4, 1}};
get({4, 20}) ->
    #endless_data{type = 4, id = 20,
		  name = lang:get(<<"第20波"/utf8>>), lev = 191,
		  unit_ids = [64104], is_reset = 0, formation = {4, 1}};
get({4, 21}) ->
    #endless_data{type = 4, id = 21,
		  name = lang:get(<<"第21波"/utf8>>), lev = 191,
		  unit_ids = [64105], is_reset = 0, formation = {5, 1}};
get({4, 22}) ->
    #endless_data{type = 4, id = 22,
		  name = lang:get(<<"第22波"/utf8>>), lev = 192,
		  unit_ids = [64106], is_reset = 0, formation = {5, 1}};
get({4, 23}) ->
    #endless_data{type = 4, id = 23,
		  name = lang:get(<<"第23波"/utf8>>), lev = 192,
		  unit_ids = [64107], is_reset = 0, formation = {6, 1}};
get({4, 24}) ->
    #endless_data{type = 4, id = 24,
		  name = lang:get(<<"第24波"/utf8>>), lev = 192,
		  unit_ids = [64108], is_reset = 0, formation = {6, 1}};
get({4, 25}) ->
    #endless_data{type = 4, id = 25,
		  name = lang:get(<<"第25波"/utf8>>), lev = 193,
		  unit_ids = [64101], is_reset = 0, formation = {1, 1}};
get({4, 26}) ->
    #endless_data{type = 4, id = 26,
		  name = lang:get(<<"第26波"/utf8>>), lev = 193,
		  unit_ids = [64102], is_reset = 0, formation = {1, 1}};
get({4, 27}) ->
    #endless_data{type = 4, id = 27,
		  name = lang:get(<<"第27波"/utf8>>), lev = 193,
		  unit_ids = [64103], is_reset = 0, formation = {2, 1}};
get({4, 28}) ->
    #endless_data{type = 4, id = 28,
		  name = lang:get(<<"第28波"/utf8>>), lev = 194,
		  unit_ids = [64104], is_reset = 0, formation = {2, 1}};
get({4, 29}) ->
    #endless_data{type = 4, id = 29,
		  name = lang:get(<<"第29波"/utf8>>), lev = 194,
		  unit_ids = [64105], is_reset = 0, formation = {3, 1}};
get({4, 30}) ->
    #endless_data{type = 4, id = 30,
		  name = lang:get(<<"第30波"/utf8>>), lev = 194,
		  unit_ids = [64106], is_reset = 0, formation = {3, 1}};
get({4, 31}) ->
    #endless_data{type = 4, id = 31,
		  name = lang:get(<<"第31波"/utf8>>), lev = 195,
		  unit_ids = [64107], is_reset = 0, formation = {4, 1}};
get({4, 32}) ->
    #endless_data{type = 4, id = 32,
		  name = lang:get(<<"第32波"/utf8>>), lev = 195,
		  unit_ids = [64108], is_reset = 0, formation = {4, 1}};
get({4, 33}) ->
    #endless_data{type = 4, id = 33,
		  name = lang:get(<<"第33波"/utf8>>), lev = 195,
		  unit_ids = [64101], is_reset = 0, formation = {5, 1}};
get({4, 34}) ->
    #endless_data{type = 4, id = 34,
		  name = lang:get(<<"第34波"/utf8>>), lev = 196,
		  unit_ids = [64102], is_reset = 0, formation = {5, 1}};
get({4, 35}) ->
    #endless_data{type = 4, id = 35,
		  name = lang:get(<<"第35波"/utf8>>), lev = 196,
		  unit_ids = [64103], is_reset = 0, formation = {6, 1}};
get({4, 36}) ->
    #endless_data{type = 4, id = 36,
		  name = lang:get(<<"第36波"/utf8>>), lev = 196,
		  unit_ids = [64104], is_reset = 0, formation = {6, 1}};
get({4, 37}) ->
    #endless_data{type = 4, id = 37,
		  name = lang:get(<<"第37波"/utf8>>), lev = 197,
		  unit_ids = [64105], is_reset = 0, formation = {1, 1}};
get({4, 38}) ->
    #endless_data{type = 4, id = 38,
		  name = lang:get(<<"第38波"/utf8>>), lev = 197,
		  unit_ids = [64106], is_reset = 0, formation = {1, 1}};
get({4, 39}) ->
    #endless_data{type = 4, id = 39,
		  name = lang:get(<<"第39波"/utf8>>), lev = 197,
		  unit_ids = [64107], is_reset = 0, formation = {2, 1}};
get({4, 40}) ->
    #endless_data{type = 4, id = 40,
		  name = lang:get(<<"第40波"/utf8>>), lev = 198,
		  unit_ids = [64108], is_reset = 0, formation = {2, 1}};
get({4, 41}) ->
    #endless_data{type = 4, id = 41,
		  name = lang:get(<<"第41波"/utf8>>), lev = 198,
		  unit_ids = [64101], is_reset = 0, formation = {3, 1}};
get({4, 42}) ->
    #endless_data{type = 4, id = 42,
		  name = lang:get(<<"第42波"/utf8>>), lev = 198,
		  unit_ids = [64102], is_reset = 0, formation = {3, 1}};
get({4, 43}) ->
    #endless_data{type = 4, id = 43,
		  name = lang:get(<<"第43波"/utf8>>), lev = 199,
		  unit_ids = [64103], is_reset = 0, formation = {4, 1}};
get({4, 44}) ->
    #endless_data{type = 4, id = 44,
		  name = lang:get(<<"第44波"/utf8>>), lev = 199,
		  unit_ids = [64104], is_reset = 0, formation = {4, 1}};
get({4, 45}) ->
    #endless_data{type = 4, id = 45,
		  name = lang:get(<<"第45波"/utf8>>), lev = 199,
		  unit_ids = [64105], is_reset = 0, formation = {5, 1}};
get({4, 46}) ->
    #endless_data{type = 4, id = 46,
		  name = lang:get(<<"第46波"/utf8>>), lev = 200,
		  unit_ids = [64106], is_reset = 0, formation = {5, 1}};
get({4, 47}) ->
    #endless_data{type = 4, id = 47,
		  name = lang:get(<<"第47波"/utf8>>), lev = 200,
		  unit_ids = [64107], is_reset = 0, formation = {6, 1}};
get({4, 48}) ->
    #endless_data{type = 4, id = 48,
		  name = lang:get(<<"第48波"/utf8>>), lev = 200,
		  unit_ids = [64108], is_reset = 0, formation = {6, 1}};
get({4, 49}) ->
    #endless_data{type = 4, id = 49,
		  name = lang:get(<<"第49波"/utf8>>), lev = 201,
		  unit_ids = [64101], is_reset = 0, formation = {1, 1}};
get({4, 50}) ->
    #endless_data{type = 4, id = 50,
		  name = lang:get(<<"第50波"/utf8>>), lev = 201,
		  unit_ids = [64102], is_reset = 0, formation = {1, 1}};
get({4, 51}) ->
    #endless_data{type = 4, id = 51,
		  name = lang:get(<<"第51波"/utf8>>), lev = 201,
		  unit_ids = [64103], is_reset = 0, formation = {2, 1}};
get({4, 52}) ->
    #endless_data{type = 4, id = 52,
		  name = lang:get(<<"第52波"/utf8>>), lev = 202,
		  unit_ids = [64104], is_reset = 0, formation = {2, 1}};
get({4, 53}) ->
    #endless_data{type = 4, id = 53,
		  name = lang:get(<<"第53波"/utf8>>), lev = 202,
		  unit_ids = [64105], is_reset = 0, formation = {3, 1}};
get({4, 54}) ->
    #endless_data{type = 4, id = 54,
		  name = lang:get(<<"第54波"/utf8>>), lev = 202,
		  unit_ids = [64106], is_reset = 0, formation = {3, 1}};
get({4, 55}) ->
    #endless_data{type = 4, id = 55,
		  name = lang:get(<<"第55波"/utf8>>), lev = 203,
		  unit_ids = [64107], is_reset = 0, formation = {4, 1}};
get({4, 56}) ->
    #endless_data{type = 4, id = 56,
		  name = lang:get(<<"第56波"/utf8>>), lev = 203,
		  unit_ids = [64108], is_reset = 0, formation = {4, 1}};
get({4, 57}) ->
    #endless_data{type = 4, id = 57,
		  name = lang:get(<<"第57波"/utf8>>), lev = 203,
		  unit_ids = [64101], is_reset = 0, formation = {5, 1}};
get({4, 58}) ->
    #endless_data{type = 4, id = 58,
		  name = lang:get(<<"第58波"/utf8>>), lev = 204,
		  unit_ids = [64102], is_reset = 0, formation = {5, 1}};
get({4, 59}) ->
    #endless_data{type = 4, id = 59,
		  name = lang:get(<<"第59波"/utf8>>), lev = 204,
		  unit_ids = [64103], is_reset = 0, formation = {6, 1}};
get({4, 60}) ->
    #endless_data{type = 4, id = 60,
		  name = lang:get(<<"第60波"/utf8>>), lev = 204,
		  unit_ids = [64104], is_reset = 0, formation = {6, 1}};
get({4, 61}) ->
    #endless_data{type = 4, id = 61,
		  name = lang:get(<<"第61波"/utf8>>), lev = 205,
		  unit_ids = [64105], is_reset = 0, formation = {1, 1}};
get({4, 62}) ->
    #endless_data{type = 4, id = 62,
		  name = lang:get(<<"第62波"/utf8>>), lev = 205,
		  unit_ids = [64106], is_reset = 0, formation = {1, 1}};
get({4, 63}) ->
    #endless_data{type = 4, id = 63,
		  name = lang:get(<<"第63波"/utf8>>), lev = 205,
		  unit_ids = [64107], is_reset = 0, formation = {2, 1}};
get({4, 64}) ->
    #endless_data{type = 4, id = 64,
		  name = lang:get(<<"第64波"/utf8>>), lev = 206,
		  unit_ids = [64109], is_reset = 0, formation = {2, 1}};
get({4, 65}) ->
    #endless_data{type = 4, id = 65,
		  name = lang:get(<<"第65波"/utf8>>), lev = 206,
		  unit_ids = [64110], is_reset = 0, formation = {3, 1}};
get({4, 66}) ->
    #endless_data{type = 4, id = 66,
		  name = lang:get(<<"第66波"/utf8>>), lev = 206,
		  unit_ids = [64111], is_reset = 0, formation = {3, 1}};
get({4, 67}) ->
    #endless_data{type = 4, id = 67,
		  name = lang:get(<<"第67波"/utf8>>), lev = 207,
		  unit_ids = [64112], is_reset = 0, formation = {4, 1}};
get({4, 68}) ->
    #endless_data{type = 4, id = 68,
		  name = lang:get(<<"第68波"/utf8>>), lev = 207,
		  unit_ids = [64113], is_reset = 0, formation = {4, 1}};
get({4, 69}) ->
    #endless_data{type = 4, id = 69,
		  name = lang:get(<<"第69波"/utf8>>), lev = 207,
		  unit_ids = [64114], is_reset = 0, formation = {5, 1}};
get({4, 70}) ->
    #endless_data{type = 4, id = 70,
		  name = lang:get(<<"第70波"/utf8>>), lev = 208,
		  unit_ids = [64115], is_reset = 0, formation = {5, 1}};
get({4, 71}) ->
    #endless_data{type = 4, id = 71,
		  name = lang:get(<<"第71波"/utf8>>), lev = 208,
		  unit_ids = [64116], is_reset = 0, formation = {6, 1}};
get({4, 72}) ->
    #endless_data{type = 4, id = 72,
		  name = lang:get(<<"第72波"/utf8>>), lev = 208,
		  unit_ids = [64117], is_reset = 0, formation = {6, 1}};
get({4, 73}) ->
    #endless_data{type = 4, id = 73,
		  name = lang:get(<<"第73波"/utf8>>), lev = 209,
		  unit_ids = [64118], is_reset = 0, formation = {1, 1}};
get({4, 74}) ->
    #endless_data{type = 4, id = 74,
		  name = lang:get(<<"第74波"/utf8>>), lev = 209,
		  unit_ids = [64119], is_reset = 0, formation = {1, 1}};
get({4, 75}) ->
    #endless_data{type = 4, id = 75,
		  name = lang:get(<<"第75波"/utf8>>), lev = 209,
		  unit_ids = [64120], is_reset = 0, formation = {2, 1}};
get({4, 76}) ->
    #endless_data{type = 4, id = 76,
		  name = lang:get(<<"第76波"/utf8>>), lev = 210,
		  unit_ids = [64121], is_reset = 0, formation = {2, 1}};
get({4, 77}) ->
    #endless_data{type = 4, id = 77,
		  name = lang:get(<<"第77波"/utf8>>), lev = 210,
		  unit_ids = [64122], is_reset = 0, formation = {3, 1}};
get({4, 78}) ->
    #endless_data{type = 4, id = 78,
		  name = lang:get(<<"第78波"/utf8>>), lev = 210,
		  unit_ids = [64123], is_reset = 0, formation = {3, 1}};
get({4, 79}) ->
    #endless_data{type = 4, id = 79,
		  name = lang:get(<<"第79波"/utf8>>), lev = 211,
		  unit_ids = [64109], is_reset = 0, formation = {4, 1}};
get({4, 80}) ->
    #endless_data{type = 4, id = 80,
		  name = lang:get(<<"第80波"/utf8>>), lev = 211,
		  unit_ids = [64110], is_reset = 0, formation = {4, 1}};
get({4, 81}) ->
    #endless_data{type = 4, id = 81,
		  name = lang:get(<<"第81波"/utf8>>), lev = 211,
		  unit_ids = [64111], is_reset = 0, formation = {5, 1}};
get({4, 82}) ->
    #endless_data{type = 4, id = 82,
		  name = lang:get(<<"第82波"/utf8>>), lev = 212,
		  unit_ids = [64112], is_reset = 0, formation = {5, 1}};
get({4, 83}) ->
    #endless_data{type = 4, id = 83,
		  name = lang:get(<<"第83波"/utf8>>), lev = 212,
		  unit_ids = [64113], is_reset = 0, formation = {6, 1}};
get({4, 84}) ->
    #endless_data{type = 4, id = 84,
		  name = lang:get(<<"第84波"/utf8>>), lev = 212,
		  unit_ids = [64114], is_reset = 0, formation = {6, 1}};
get({4, 85}) ->
    #endless_data{type = 4, id = 85,
		  name = lang:get(<<"第85波"/utf8>>), lev = 213,
		  unit_ids = [64115], is_reset = 0, formation = {1, 1}};
get({4, 86}) ->
    #endless_data{type = 4, id = 86,
		  name = lang:get(<<"第86波"/utf8>>), lev = 213,
		  unit_ids = [64116], is_reset = 0, formation = {1, 1}};
get({4, 87}) ->
    #endless_data{type = 4, id = 87,
		  name = lang:get(<<"第87波"/utf8>>), lev = 213,
		  unit_ids = [64117], is_reset = 0, formation = {2, 1}};
get({4, 88}) ->
    #endless_data{type = 4, id = 88,
		  name = lang:get(<<"第88波"/utf8>>), lev = 214,
		  unit_ids = [64118], is_reset = 0, formation = {2, 1}};
get({4, 89}) ->
    #endless_data{type = 4, id = 89,
		  name = lang:get(<<"第89波"/utf8>>), lev = 214,
		  unit_ids = [64119], is_reset = 0, formation = {3, 1}};
get({4, 90}) ->
    #endless_data{type = 4, id = 90,
		  name = lang:get(<<"第90波"/utf8>>), lev = 214,
		  unit_ids = [64120], is_reset = 0, formation = {3, 1}};
get({4, 91}) ->
    #endless_data{type = 4, id = 91,
		  name = lang:get(<<"第91波"/utf8>>), lev = 215,
		  unit_ids = [64121], is_reset = 0, formation = {4, 1}};
get({4, 92}) ->
    #endless_data{type = 4, id = 92,
		  name = lang:get(<<"第92波"/utf8>>), lev = 215,
		  unit_ids = [64122], is_reset = 0, formation = {4, 1}};
get({4, 93}) ->
    #endless_data{type = 4, id = 93,
		  name = lang:get(<<"第93波"/utf8>>), lev = 215,
		  unit_ids = [64123], is_reset = 0, formation = {5, 1}};
get({4, 94}) ->
    #endless_data{type = 4, id = 94,
		  name = lang:get(<<"第94波"/utf8>>), lev = 216,
		  unit_ids = [64109], is_reset = 0, formation = {5, 1}};
get({4, 95}) ->
    #endless_data{type = 4, id = 95,
		  name = lang:get(<<"第95波"/utf8>>), lev = 216,
		  unit_ids = [64110], is_reset = 0, formation = {6, 1}};
get({4, 96}) ->
    #endless_data{type = 4, id = 96,
		  name = lang:get(<<"第96波"/utf8>>), lev = 216,
		  unit_ids = [64111], is_reset = 0, formation = {6, 1}};
get({4, 97}) ->
    #endless_data{type = 4, id = 97,
		  name = lang:get(<<"第97波"/utf8>>), lev = 217,
		  unit_ids = [64112], is_reset = 0, formation = {1, 1}};
get({4, 98}) ->
    #endless_data{type = 4, id = 98,
		  name = lang:get(<<"第98波"/utf8>>), lev = 217,
		  unit_ids = [64113], is_reset = 0, formation = {1, 1}};
get({4, 99}) ->
    #endless_data{type = 4, id = 99,
		  name = lang:get(<<"第99波"/utf8>>), lev = 217,
		  unit_ids = [64114], is_reset = 0, formation = {2, 1}};
get({4, 100}) ->
    #endless_data{type = 4, id = 100,
		  name = lang:get(<<"第100波"/utf8>>), lev = 218,
		  unit_ids = [64115], is_reset = 0, formation = {2, 1}};
get({4, 101}) ->
    #endless_data{type = 4, id = 101,
		  name = lang:get(<<"第101波"/utf8>>), lev = 218,
		  unit_ids = [64116], is_reset = 0, formation = {3, 1}};
get({4, 102}) ->
    #endless_data{type = 4, id = 102,
		  name = lang:get(<<"第102波"/utf8>>), lev = 218,
		  unit_ids = [64117], is_reset = 0, formation = {3, 1}};
get({4, 103}) ->
    #endless_data{type = 4, id = 103,
		  name = lang:get(<<"第103波"/utf8>>), lev = 219,
		  unit_ids = [64118], is_reset = 0, formation = {4, 1}};
get({4, 104}) ->
    #endless_data{type = 4, id = 104,
		  name = lang:get(<<"第104波"/utf8>>), lev = 219,
		  unit_ids = [64119], is_reset = 0, formation = {4, 1}};
get({4, 105}) ->
    #endless_data{type = 4, id = 105,
		  name = lang:get(<<"第105波"/utf8>>), lev = 219,
		  unit_ids = [64120], is_reset = 0, formation = {5, 1}};
get({4, 106}) ->
    #endless_data{type = 4, id = 106,
		  name = lang:get(<<"第106波"/utf8>>), lev = 220,
		  unit_ids = [64121], is_reset = 0, formation = {5, 1}};
get({4, 107}) ->
    #endless_data{type = 4, id = 107,
		  name = lang:get(<<"第107波"/utf8>>), lev = 220,
		  unit_ids = [64122], is_reset = 0, formation = {6, 1}};
get({4, 108}) ->
    #endless_data{type = 4, id = 108,
		  name = lang:get(<<"第108波"/utf8>>), lev = 220,
		  unit_ids = [64123], is_reset = 0, formation = {6, 1}};
get({4, 109}) ->
    #endless_data{type = 4, id = 109,
		  name = lang:get(<<"第109波"/utf8>>), lev = 221,
		  unit_ids = [64109], is_reset = 0, formation = {1, 1}};
get({4, 110}) ->
    #endless_data{type = 4, id = 110,
		  name = lang:get(<<"第110波"/utf8>>), lev = 221,
		  unit_ids = [64110], is_reset = 0, formation = {1, 1}};
get({4, 111}) ->
    #endless_data{type = 4, id = 111,
		  name = lang:get(<<"第111波"/utf8>>), lev = 221,
		  unit_ids = [64111], is_reset = 0, formation = {2, 1}};
get({4, 112}) ->
    #endless_data{type = 4, id = 112,
		  name = lang:get(<<"第112波"/utf8>>), lev = 222,
		  unit_ids = [64112], is_reset = 0, formation = {2, 1}};
get({4, 113}) ->
    #endless_data{type = 4, id = 113,
		  name = lang:get(<<"第113波"/utf8>>), lev = 222,
		  unit_ids = [64113], is_reset = 0, formation = {3, 1}};
get({4, 114}) ->
    #endless_data{type = 4, id = 114,
		  name = lang:get(<<"第114波"/utf8>>), lev = 222,
		  unit_ids = [64114], is_reset = 0, formation = {3, 1}};
get({4, 115}) ->
    #endless_data{type = 4, id = 115,
		  name = lang:get(<<"第115波"/utf8>>), lev = 223,
		  unit_ids = [64115], is_reset = 0, formation = {4, 1}};
get({4, 116}) ->
    #endless_data{type = 4, id = 116,
		  name = lang:get(<<"第116波"/utf8>>), lev = 223,
		  unit_ids = [64116], is_reset = 0, formation = {4, 1}};
get({4, 117}) ->
    #endless_data{type = 4, id = 117,
		  name = lang:get(<<"第117波"/utf8>>), lev = 223,
		  unit_ids = [64117], is_reset = 0, formation = {5, 1}};
get({4, 118}) ->
    #endless_data{type = 4, id = 118,
		  name = lang:get(<<"第118波"/utf8>>), lev = 224,
		  unit_ids = [64118], is_reset = 0, formation = {5, 1}};
get({4, 119}) ->
    #endless_data{type = 4, id = 119,
		  name = lang:get(<<"第119波"/utf8>>), lev = 224,
		  unit_ids = [64119], is_reset = 0, formation = {6, 1}};
get({4, 120}) ->
    #endless_data{type = 4, id = 120,
		  name = lang:get(<<"第120波"/utf8>>), lev = 224,
		  unit_ids = [64120], is_reset = 0, formation = {6, 1}};
get({4, 121}) ->
    #endless_data{type = 4, id = 121,
		  name = lang:get(<<"第121波"/utf8>>), lev = 225,
		  unit_ids = [64121], is_reset = 0, formation = {1, 1}};
get({4, 122}) ->
    #endless_data{type = 4, id = 122,
		  name = lang:get(<<"第122波"/utf8>>), lev = 225,
		  unit_ids = [64122], is_reset = 0, formation = {1, 1}};
get({4, 123}) ->
    #endless_data{type = 4, id = 123,
		  name = lang:get(<<"第123波"/utf8>>), lev = 225,
		  unit_ids = [64123], is_reset = 0, formation = {2, 1}};
get({4, 124}) ->
    #endless_data{type = 4, id = 124,
		  name = lang:get(<<"第124波"/utf8>>), lev = 226,
		  unit_ids = [64109], is_reset = 0, formation = {2, 1}};
get({4, 125}) ->
    #endless_data{type = 4, id = 125,
		  name = lang:get(<<"第125波"/utf8>>), lev = 226,
		  unit_ids = [64110], is_reset = 0, formation = {3, 1}};
get({4, 126}) ->
    #endless_data{type = 4, id = 126,
		  name = lang:get(<<"第126波"/utf8>>), lev = 226,
		  unit_ids = [64111], is_reset = 0, formation = {3, 1}};
get({4, 127}) ->
    #endless_data{type = 4, id = 127,
		  name = lang:get(<<"第127波"/utf8>>), lev = 227,
		  unit_ids = [64112], is_reset = 0, formation = {4, 1}};
get({4, 128}) ->
    #endless_data{type = 4, id = 128,
		  name = lang:get(<<"第128波"/utf8>>), lev = 227,
		  unit_ids = [64113], is_reset = 0, formation = {4, 1}};
get({4, 129}) ->
    #endless_data{type = 4, id = 129,
		  name = lang:get(<<"第129波"/utf8>>), lev = 227,
		  unit_ids = [64114], is_reset = 0, formation = {5, 1}};
get({4, 130}) ->
    #endless_data{type = 4, id = 130,
		  name = lang:get(<<"第130波"/utf8>>), lev = 228,
		  unit_ids = [64115], is_reset = 0, formation = {5, 1}};
get({4, 131}) ->
    #endless_data{type = 4, id = 131,
		  name = lang:get(<<"第131波"/utf8>>), lev = 228,
		  unit_ids = [64116], is_reset = 0, formation = {6, 1}};
get({4, 132}) ->
    #endless_data{type = 4, id = 132,
		  name = lang:get(<<"第132波"/utf8>>), lev = 228,
		  unit_ids = [64117], is_reset = 0, formation = {6, 1}};
get({4, 133}) ->
    #endless_data{type = 4, id = 133,
		  name = lang:get(<<"第133波"/utf8>>), lev = 229,
		  unit_ids = [64118], is_reset = 0, formation = {1, 1}};
get({4, 134}) ->
    #endless_data{type = 4, id = 134,
		  name = lang:get(<<"第134波"/utf8>>), lev = 229,
		  unit_ids = [64119], is_reset = 0, formation = {1, 1}};
get({4, 135}) ->
    #endless_data{type = 4, id = 135,
		  name = lang:get(<<"第135波"/utf8>>), lev = 229,
		  unit_ids = [64120], is_reset = 0, formation = {2, 1}};
get({4, 136}) ->
    #endless_data{type = 4, id = 136,
		  name = lang:get(<<"第136波"/utf8>>), lev = 230,
		  unit_ids = [64121], is_reset = 0, formation = {2, 1}};
get({4, 137}) ->
    #endless_data{type = 4, id = 137,
		  name = lang:get(<<"第137波"/utf8>>), lev = 230,
		  unit_ids = [64122], is_reset = 0, formation = {3, 1}};
get({4, 138}) ->
    #endless_data{type = 4, id = 138,
		  name = lang:get(<<"第138波"/utf8>>), lev = 230,
		  unit_ids = [64123], is_reset = 0, formation = {3, 1}};
get({4, 139}) ->
    #endless_data{type = 4, id = 139,
		  name = lang:get(<<"第139波"/utf8>>), lev = 231,
		  unit_ids = [64109], is_reset = 0, formation = {4, 1}};
get({4, 140}) ->
    #endless_data{type = 4, id = 140,
		  name = lang:get(<<"第140波"/utf8>>), lev = 231,
		  unit_ids = [64110], is_reset = 0, formation = {4, 1}};
get({4, 141}) ->
    #endless_data{type = 4, id = 141,
		  name = lang:get(<<"第141波"/utf8>>), lev = 231,
		  unit_ids = [64111], is_reset = 0, formation = {5, 1}};
get({4, 142}) ->
    #endless_data{type = 4, id = 142,
		  name = lang:get(<<"第142波"/utf8>>), lev = 232,
		  unit_ids = [64112], is_reset = 0, formation = {5, 1}};
get({4, 143}) ->
    #endless_data{type = 4, id = 143,
		  name = lang:get(<<"第143波"/utf8>>), lev = 232,
		  unit_ids = [64113], is_reset = 0, formation = {6, 1}};
get({4, 144}) ->
    #endless_data{type = 4, id = 144,
		  name = lang:get(<<"第144波"/utf8>>), lev = 232,
		  unit_ids = [64114], is_reset = 0, formation = {6, 1}};
get({4, 145}) ->
    #endless_data{type = 4, id = 145,
		  name = lang:get(<<"第145波"/utf8>>), lev = 233,
		  unit_ids = [64115], is_reset = 0, formation = {1, 1}};
get({4, 146}) ->
    #endless_data{type = 4, id = 146,
		  name = lang:get(<<"第146波"/utf8>>), lev = 233,
		  unit_ids = [64116], is_reset = 0, formation = {1, 1}};
get({4, 147}) ->
    #endless_data{type = 4, id = 147,
		  name = lang:get(<<"第147波"/utf8>>), lev = 233,
		  unit_ids = [64117], is_reset = 0, formation = {2, 1}};
get({4, 148}) ->
    #endless_data{type = 4, id = 148,
		  name = lang:get(<<"第148波"/utf8>>), lev = 234,
		  unit_ids = [64118], is_reset = 0, formation = {2, 1}};
get({4, 149}) ->
    #endless_data{type = 4, id = 149,
		  name = lang:get(<<"第149波"/utf8>>), lev = 234,
		  unit_ids = [64119], is_reset = 0, formation = {3, 1}};
get({4, 150}) ->
    #endless_data{type = 4, id = 150,
		  name = lang:get(<<"第150波"/utf8>>), lev = 234,
		  unit_ids = [64120], is_reset = 0, formation = {3, 1}};
get({4, 151}) ->
    #endless_data{type = 4, id = 151,
		  name = lang:get(<<"第151波"/utf8>>), lev = 240,
		  unit_ids = [64109], is_reset = 0, formation = {1, 1}};
get({4, 152}) ->
    #endless_data{type = 4, id = 152,
		  name = lang:get(<<"第152波"/utf8>>), lev = 240,
		  unit_ids = [64110], is_reset = 0, formation = {1, 1}};
get({4, 153}) ->
    #endless_data{type = 4, id = 153,
		  name = lang:get(<<"第153波"/utf8>>), lev = 241,
		  unit_ids = [64111], is_reset = 0, formation = {2, 1}};
get({4, 154}) ->
    #endless_data{type = 4, id = 154,
		  name = lang:get(<<"第154波"/utf8>>), lev = 242,
		  unit_ids = [64112], is_reset = 0, formation = {2, 1}};
get({4, 155}) ->
    #endless_data{type = 4, id = 155,
		  name = lang:get(<<"第155波"/utf8>>), lev = 242,
		  unit_ids = [64113], is_reset = 0, formation = {3, 1}};
get({4, 156}) ->
    #endless_data{type = 4, id = 156,
		  name = lang:get(<<"第156波"/utf8>>), lev = 243,
		  unit_ids = [64114], is_reset = 0, formation = {3, 1}};
get({4, 157}) ->
    #endless_data{type = 4, id = 157,
		  name = lang:get(<<"第157波"/utf8>>), lev = 244,
		  unit_ids = [64115], is_reset = 0, formation = {4, 1}};
get({4, 158}) ->
    #endless_data{type = 4, id = 158,
		  name = lang:get(<<"第158波"/utf8>>), lev = 244,
		  unit_ids = [64116], is_reset = 0, formation = {4, 1}};
get({4, 159}) ->
    #endless_data{type = 4, id = 159,
		  name = lang:get(<<"第159波"/utf8>>), lev = 245,
		  unit_ids = [64117], is_reset = 0, formation = {5, 1}};
get({4, 160}) ->
    #endless_data{type = 4, id = 160,
		  name = lang:get(<<"第160波"/utf8>>), lev = 246,
		  unit_ids = [64118], is_reset = 0, formation = {5, 1}};
get({4, 161}) ->
    #endless_data{type = 4, id = 161,
		  name = lang:get(<<"第161波"/utf8>>), lev = 246,
		  unit_ids = [64119], is_reset = 0, formation = {6, 1}};
get({4, 162}) ->
    #endless_data{type = 4, id = 162,
		  name = lang:get(<<"第162波"/utf8>>), lev = 247,
		  unit_ids = [64120], is_reset = 0, formation = {6, 1}};
get({4, 163}) ->
    #endless_data{type = 4, id = 163,
		  name = lang:get(<<"第163波"/utf8>>), lev = 248,
		  unit_ids = [64121], is_reset = 0, formation = {1, 1}};
get({4, 164}) ->
    #endless_data{type = 4, id = 164,
		  name = lang:get(<<"第164波"/utf8>>), lev = 248,
		  unit_ids = [64122], is_reset = 0, formation = {1, 1}};
get({4, 165}) ->
    #endless_data{type = 4, id = 165,
		  name = lang:get(<<"第165波"/utf8>>), lev = 249,
		  unit_ids = [64123], is_reset = 0, formation = {2, 1}};
get({4, 166}) ->
    #endless_data{type = 4, id = 166,
		  name = lang:get(<<"第166波"/utf8>>), lev = 250,
		  unit_ids = [64109], is_reset = 0, formation = {2, 1}};
get({4, 167}) ->
    #endless_data{type = 4, id = 167,
		  name = lang:get(<<"第167波"/utf8>>), lev = 250,
		  unit_ids = [64110], is_reset = 0, formation = {3, 1}};
get({4, 168}) ->
    #endless_data{type = 4, id = 168,
		  name = lang:get(<<"第168波"/utf8>>), lev = 251,
		  unit_ids = [64111], is_reset = 0, formation = {3, 1}};
get({4, 169}) ->
    #endless_data{type = 4, id = 169,
		  name = lang:get(<<"第169波"/utf8>>), lev = 252,
		  unit_ids = [64112], is_reset = 0, formation = {4, 1}};
get({4, 170}) ->
    #endless_data{type = 4, id = 170,
		  name = lang:get(<<"第170波"/utf8>>), lev = 252,
		  unit_ids = [64113], is_reset = 0, formation = {4, 1}};
get({4, 171}) ->
    #endless_data{type = 4, id = 171,
		  name = lang:get(<<"第171波"/utf8>>), lev = 253,
		  unit_ids = [64114], is_reset = 0, formation = {5, 1}};
get({4, 172}) ->
    #endless_data{type = 4, id = 172,
		  name = lang:get(<<"第172波"/utf8>>), lev = 254,
		  unit_ids = [64115], is_reset = 0, formation = {5, 1}};
get({4, 173}) ->
    #endless_data{type = 4, id = 173,
		  name = lang:get(<<"第173波"/utf8>>), lev = 254,
		  unit_ids = [64116], is_reset = 0, formation = {6, 1}};
get({4, 174}) ->
    #endless_data{type = 4, id = 174,
		  name = lang:get(<<"第174波"/utf8>>), lev = 255,
		  unit_ids = [64117], is_reset = 0, formation = {6, 1}};
get({4, 175}) ->
    #endless_data{type = 4, id = 175,
		  name = lang:get(<<"第175波"/utf8>>), lev = 256,
		  unit_ids = [64118], is_reset = 0, formation = {1, 1}};
get({4, 176}) ->
    #endless_data{type = 4, id = 176,
		  name = lang:get(<<"第176波"/utf8>>), lev = 256,
		  unit_ids = [64119], is_reset = 0, formation = {1, 1}};
get({4, 177}) ->
    #endless_data{type = 4, id = 177,
		  name = lang:get(<<"第177波"/utf8>>), lev = 257,
		  unit_ids = [64120], is_reset = 0, formation = {2, 1}};
get({4, 178}) ->
    #endless_data{type = 4, id = 178,
		  name = lang:get(<<"第178波"/utf8>>), lev = 258,
		  unit_ids = [64121], is_reset = 0, formation = {2, 1}};
get({4, 179}) ->
    #endless_data{type = 4, id = 179,
		  name = lang:get(<<"第179波"/utf8>>), lev = 258,
		  unit_ids = [64122], is_reset = 0, formation = {3, 1}};
get({4, 180}) ->
    #endless_data{type = 4, id = 180,
		  name = lang:get(<<"第180波"/utf8>>), lev = 259,
		  unit_ids = [64123], is_reset = 0, formation = {3, 1}};
get({4, 181}) ->
    #endless_data{type = 4, id = 181,
		  name = lang:get(<<"第181波"/utf8>>), lev = 260,
		  unit_ids = [64109], is_reset = 0, formation = {4, 1}};
get({4, 182}) ->
    #endless_data{type = 4, id = 182,
		  name = lang:get(<<"第182波"/utf8>>), lev = 260,
		  unit_ids = [64110], is_reset = 0, formation = {4, 1}};
get({4, 183}) ->
    #endless_data{type = 4, id = 183,
		  name = lang:get(<<"第183波"/utf8>>), lev = 261,
		  unit_ids = [64111], is_reset = 0, formation = {5, 1}};
get({4, 184}) ->
    #endless_data{type = 4, id = 184,
		  name = lang:get(<<"第184波"/utf8>>), lev = 262,
		  unit_ids = [64112], is_reset = 0, formation = {5, 1}};
get({4, 185}) ->
    #endless_data{type = 4, id = 185,
		  name = lang:get(<<"第185波"/utf8>>), lev = 262,
		  unit_ids = [64113], is_reset = 0, formation = {6, 1}};
get({4, 186}) ->
    #endless_data{type = 4, id = 186,
		  name = lang:get(<<"第186波"/utf8>>), lev = 263,
		  unit_ids = [64114], is_reset = 0, formation = {6, 1}};
get({4, 187}) ->
    #endless_data{type = 4, id = 187,
		  name = lang:get(<<"第187波"/utf8>>), lev = 264,
		  unit_ids = [64115], is_reset = 0, formation = {1, 1}};
get({4, 188}) ->
    #endless_data{type = 4, id = 188,
		  name = lang:get(<<"第188波"/utf8>>), lev = 264,
		  unit_ids = [64116], is_reset = 0, formation = {1, 1}};
get({4, 189}) ->
    #endless_data{type = 4, id = 189,
		  name = lang:get(<<"第189波"/utf8>>), lev = 265,
		  unit_ids = [64117], is_reset = 0, formation = {2, 1}};
get({4, 190}) ->
    #endless_data{type = 4, id = 190,
		  name = lang:get(<<"第190波"/utf8>>), lev = 266,
		  unit_ids = [64118], is_reset = 0, formation = {2, 1}};
get({4, 191}) ->
    #endless_data{type = 4, id = 191,
		  name = lang:get(<<"第191波"/utf8>>), lev = 266,
		  unit_ids = [64119], is_reset = 0, formation = {3, 1}};
get({4, 192}) ->
    #endless_data{type = 4, id = 192,
		  name = lang:get(<<"第192波"/utf8>>), lev = 267,
		  unit_ids = [64120], is_reset = 0, formation = {3, 1}};
get({4, 193}) ->
    #endless_data{type = 4, id = 193,
		  name = lang:get(<<"第193波"/utf8>>), lev = 268,
		  unit_ids = [64121], is_reset = 0, formation = {4, 1}};
get({4, 194}) ->
    #endless_data{type = 4, id = 194,
		  name = lang:get(<<"第194波"/utf8>>), lev = 268,
		  unit_ids = [64122], is_reset = 0, formation = {4, 1}};
get({4, 195}) ->
    #endless_data{type = 4, id = 195,
		  name = lang:get(<<"第195波"/utf8>>), lev = 269,
		  unit_ids = [64123], is_reset = 0, formation = {5, 1}};
get({4, 196}) ->
    #endless_data{type = 4, id = 196,
		  name = lang:get(<<"第196波"/utf8>>), lev = 270,
		  unit_ids = [64109], is_reset = 0, formation = {5, 1}};
get({4, 197}) ->
    #endless_data{type = 4, id = 197,
		  name = lang:get(<<"第197波"/utf8>>), lev = 270,
		  unit_ids = [64110], is_reset = 0, formation = {6, 1}};
get({4, 198}) ->
    #endless_data{type = 4, id = 198,
		  name = lang:get(<<"第198波"/utf8>>), lev = 271,
		  unit_ids = [64111], is_reset = 0, formation = {6, 1}};
get({4, 199}) ->
    #endless_data{type = 4, id = 199,
		  name = lang:get(<<"第199波"/utf8>>), lev = 272,
		  unit_ids = [64112], is_reset = 0, formation = {1, 1}};
get({4, 200}) ->
    #endless_data{type = 4, id = 200,
		  name = lang:get(<<"第200波"/utf8>>), lev = 272,
		  unit_ids = [64113], is_reset = 0, formation = {1, 1}};
get({4, 201}) ->
    #endless_data{type = 4, id = 201,
		  name = lang:get(<<"第201波"/utf8>>), lev = 273,
		  unit_ids = [64114], is_reset = 0, formation = {2, 1}};
get({4, 202}) ->
    #endless_data{type = 4, id = 202,
		  name = lang:get(<<"第202波"/utf8>>), lev = 274,
		  unit_ids = [64115], is_reset = 0, formation = {2, 1}};
get({4, 203}) ->
    #endless_data{type = 4, id = 203,
		  name = lang:get(<<"第203波"/utf8>>), lev = 274,
		  unit_ids = [64116], is_reset = 0, formation = {3, 1}};
get({4, 204}) ->
    #endless_data{type = 4, id = 204,
		  name = lang:get(<<"第204波"/utf8>>), lev = 275,
		  unit_ids = [64117], is_reset = 0, formation = {3, 1}};
get({4, 205}) ->
    #endless_data{type = 4, id = 205,
		  name = lang:get(<<"第205波"/utf8>>), lev = 276,
		  unit_ids = [64118], is_reset = 0, formation = {4, 1}};
get({4, 206}) ->
    #endless_data{type = 4, id = 206,
		  name = lang:get(<<"第206波"/utf8>>), lev = 276,
		  unit_ids = [64119], is_reset = 0, formation = {4, 1}};
get({4, 207}) ->
    #endless_data{type = 4, id = 207,
		  name = lang:get(<<"第207波"/utf8>>), lev = 277,
		  unit_ids = [64120], is_reset = 0, formation = {5, 1}};
get({4, 208}) ->
    #endless_data{type = 4, id = 208,
		  name = lang:get(<<"第208波"/utf8>>), lev = 278,
		  unit_ids = [64121], is_reset = 0, formation = {5, 1}};
get({4, 209}) ->
    #endless_data{type = 4, id = 209,
		  name = lang:get(<<"第209波"/utf8>>), lev = 278,
		  unit_ids = [64122], is_reset = 0, formation = {6, 1}};
get({4, 210}) ->
    #endless_data{type = 4, id = 210,
		  name = lang:get(<<"第210波"/utf8>>), lev = 279,
		  unit_ids = [64123], is_reset = 0, formation = {6, 1}};
get({4, 211}) ->
    #endless_data{type = 4, id = 211,
		  name = lang:get(<<"第211波"/utf8>>), lev = 280,
		  unit_ids = [64109], is_reset = 0, formation = {1, 1}};
get({4, 212}) ->
    #endless_data{type = 4, id = 212,
		  name = lang:get(<<"第212波"/utf8>>), lev = 280,
		  unit_ids = [64110], is_reset = 0, formation = {1, 1}};
get({4, 213}) ->
    #endless_data{type = 4, id = 213,
		  name = lang:get(<<"第213波"/utf8>>), lev = 281,
		  unit_ids = [64111], is_reset = 0, formation = {2, 1}};
get({4, 214}) ->
    #endless_data{type = 4, id = 214,
		  name = lang:get(<<"第214波"/utf8>>), lev = 282,
		  unit_ids = [64112], is_reset = 0, formation = {2, 1}};
get({4, 215}) ->
    #endless_data{type = 4, id = 215,
		  name = lang:get(<<"第215波"/utf8>>), lev = 282,
		  unit_ids = [64113], is_reset = 0, formation = {3, 1}};
get({4, 216}) ->
    #endless_data{type = 4, id = 216,
		  name = lang:get(<<"第216波"/utf8>>), lev = 283,
		  unit_ids = [64114], is_reset = 0, formation = {3, 1}};
get({4, 217}) ->
    #endless_data{type = 4, id = 217,
		  name = lang:get(<<"第217波"/utf8>>), lev = 284,
		  unit_ids = [64115], is_reset = 0, formation = {4, 1}};
get({4, 218}) ->
    #endless_data{type = 4, id = 218,
		  name = lang:get(<<"第218波"/utf8>>), lev = 284,
		  unit_ids = [64116], is_reset = 0, formation = {4, 1}};
get({4, 219}) ->
    #endless_data{type = 4, id = 219,
		  name = lang:get(<<"第219波"/utf8>>), lev = 285,
		  unit_ids = [64117], is_reset = 0, formation = {5, 1}};
get({4, 220}) ->
    #endless_data{type = 4, id = 220,
		  name = lang:get(<<"第220波"/utf8>>), lev = 286,
		  unit_ids = [64118], is_reset = 0, formation = {5, 1}};
get({4, 221}) ->
    #endless_data{type = 4, id = 221,
		  name = lang:get(<<"第221波"/utf8>>), lev = 286,
		  unit_ids = [64119], is_reset = 0, formation = {6, 1}};
get({4, 222}) ->
    #endless_data{type = 4, id = 222,
		  name = lang:get(<<"第222波"/utf8>>), lev = 287,
		  unit_ids = [64120], is_reset = 0, formation = {6, 1}};
get({4, 223}) ->
    #endless_data{type = 4, id = 223,
		  name = lang:get(<<"第223波"/utf8>>), lev = 288,
		  unit_ids = [64121], is_reset = 0, formation = {1, 1}};
get({4, 224}) ->
    #endless_data{type = 4, id = 224,
		  name = lang:get(<<"第224波"/utf8>>), lev = 288,
		  unit_ids = [64122], is_reset = 0, formation = {1, 1}};
get({4, 225}) ->
    #endless_data{type = 4, id = 225,
		  name = lang:get(<<"第225波"/utf8>>), lev = 289,
		  unit_ids = [64123], is_reset = 0, formation = {2, 1}};
get({4, 226}) ->
    #endless_data{type = 4, id = 226,
		  name = lang:get(<<"第226波"/utf8>>), lev = 290,
		  unit_ids = [64109], is_reset = 0, formation = {2, 1}};
get({4, 227}) ->
    #endless_data{type = 4, id = 227,
		  name = lang:get(<<"第227波"/utf8>>), lev = 290,
		  unit_ids = [64110], is_reset = 0, formation = {3, 1}};
get({4, 228}) ->
    #endless_data{type = 4, id = 228,
		  name = lang:get(<<"第228波"/utf8>>), lev = 291,
		  unit_ids = [64111], is_reset = 0, formation = {3, 1}};
get({4, 229}) ->
    #endless_data{type = 4, id = 229,
		  name = lang:get(<<"第229波"/utf8>>), lev = 292,
		  unit_ids = [64112], is_reset = 0, formation = {4, 1}};
get({4, 230}) ->
    #endless_data{type = 4, id = 230,
		  name = lang:get(<<"第230波"/utf8>>), lev = 292,
		  unit_ids = [64113], is_reset = 0, formation = {4, 1}};
get({4, 231}) ->
    #endless_data{type = 4, id = 231,
		  name = lang:get(<<"第231波"/utf8>>), lev = 293,
		  unit_ids = [64114], is_reset = 0, formation = {5, 1}};
get({4, 232}) ->
    #endless_data{type = 4, id = 232,
		  name = lang:get(<<"第232波"/utf8>>), lev = 294,
		  unit_ids = [64115], is_reset = 0, formation = {5, 1}};
get({4, 233}) ->
    #endless_data{type = 4, id = 233,
		  name = lang:get(<<"第233波"/utf8>>), lev = 294,
		  unit_ids = [64116], is_reset = 0, formation = {6, 1}};
get({4, 234}) ->
    #endless_data{type = 4, id = 234,
		  name = lang:get(<<"第234波"/utf8>>), lev = 295,
		  unit_ids = [64117], is_reset = 0, formation = {6, 1}};
get({4, 235}) ->
    #endless_data{type = 4, id = 235,
		  name = lang:get(<<"第235波"/utf8>>), lev = 296,
		  unit_ids = [64118], is_reset = 0, formation = {1, 1}};
get({4, 236}) ->
    #endless_data{type = 4, id = 236,
		  name = lang:get(<<"第236波"/utf8>>), lev = 296,
		  unit_ids = [64119], is_reset = 0, formation = {1, 1}};
get({4, 237}) ->
    #endless_data{type = 4, id = 237,
		  name = lang:get(<<"第237波"/utf8>>), lev = 297,
		  unit_ids = [64120], is_reset = 0, formation = {2, 1}};
get({4, 238}) ->
    #endless_data{type = 4, id = 238,
		  name = lang:get(<<"第238波"/utf8>>), lev = 298,
		  unit_ids = [64121], is_reset = 0, formation = {2, 1}};
get({4, 239}) ->
    #endless_data{type = 4, id = 239,
		  name = lang:get(<<"第239波"/utf8>>), lev = 298,
		  unit_ids = [64122], is_reset = 0, formation = {3, 1}};
get({4, 240}) ->
    #endless_data{type = 4, id = 240,
		  name = lang:get(<<"第240波"/utf8>>), lev = 299,
		  unit_ids = [64123], is_reset = 0, formation = {3, 1}};
get({4, 241}) ->
    #endless_data{type = 4, id = 241,
		  name = lang:get(<<"第241波"/utf8>>), lev = 300,
		  unit_ids = [64109], is_reset = 0, formation = {4, 1}};
get({4, 242}) ->
    #endless_data{type = 4, id = 242,
		  name = lang:get(<<"第242波"/utf8>>), lev = 300,
		  unit_ids = [64110], is_reset = 0, formation = {4, 1}};
get({4, 243}) ->
    #endless_data{type = 4, id = 243,
		  name = lang:get(<<"第243波"/utf8>>), lev = 301,
		  unit_ids = [64111], is_reset = 0, formation = {5, 1}};
get({4, 244}) ->
    #endless_data{type = 4, id = 244,
		  name = lang:get(<<"第244波"/utf8>>), lev = 302,
		  unit_ids = [64112], is_reset = 0, formation = {5, 1}};
get({4, 245}) ->
    #endless_data{type = 4, id = 245,
		  name = lang:get(<<"第245波"/utf8>>), lev = 302,
		  unit_ids = [64113], is_reset = 0, formation = {6, 1}};
get({4, 246}) ->
    #endless_data{type = 4, id = 246,
		  name = lang:get(<<"第246波"/utf8>>), lev = 303,
		  unit_ids = [64114], is_reset = 0, formation = {6, 1}};
get({4, 247}) ->
    #endless_data{type = 4, id = 247,
		  name = lang:get(<<"第247波"/utf8>>), lev = 304,
		  unit_ids = [64115], is_reset = 0, formation = {1, 1}};
get({4, 248}) ->
    #endless_data{type = 4, id = 248,
		  name = lang:get(<<"第248波"/utf8>>), lev = 304,
		  unit_ids = [64116], is_reset = 0, formation = {1, 1}};
get({4, 249}) ->
    #endless_data{type = 4, id = 249,
		  name = lang:get(<<"第249波"/utf8>>), lev = 305,
		  unit_ids = [64117], is_reset = 0, formation = {2, 1}};
get({4, 250}) ->
    #endless_data{type = 4, id = 250,
		  name = lang:get(<<"第250波"/utf8>>), lev = 306,
		  unit_ids = [64118], is_reset = 0, formation = {2, 1}};
get({4, 251}) ->
    #endless_data{type = 4, id = 251,
		  name = lang:get(<<"第251波"/utf8>>), lev = 306,
		  unit_ids = [64119], is_reset = 0, formation = {3, 1}};
get({4, 252}) ->
    #endless_data{type = 4, id = 252,
		  name = lang:get(<<"第252波"/utf8>>), lev = 307,
		  unit_ids = [64120], is_reset = 0, formation = {3, 1}};
get({4, 253}) ->
    #endless_data{type = 4, id = 253,
		  name = lang:get(<<"第253波"/utf8>>), lev = 308,
		  unit_ids = [64121], is_reset = 0, formation = {4, 1}};
get({4, 254}) ->
    #endless_data{type = 4, id = 254,
		  name = lang:get(<<"第254波"/utf8>>), lev = 308,
		  unit_ids = [64122], is_reset = 0, formation = {4, 1}};
get({4, 255}) ->
    #endless_data{type = 4, id = 255,
		  name = lang:get(<<"第255波"/utf8>>), lev = 309,
		  unit_ids = [64123], is_reset = 0, formation = {5, 1}};
get({4, 256}) ->
    #endless_data{type = 4, id = 256,
		  name = lang:get(<<"第256波"/utf8>>), lev = 310,
		  unit_ids = [64109], is_reset = 0, formation = {5, 1}};
get({4, 257}) ->
    #endless_data{type = 4, id = 257,
		  name = lang:get(<<"第257波"/utf8>>), lev = 310,
		  unit_ids = [64110], is_reset = 0, formation = {6, 1}};
get({4, 258}) ->
    #endless_data{type = 4, id = 258,
		  name = lang:get(<<"第258波"/utf8>>), lev = 311,
		  unit_ids = [64111], is_reset = 0, formation = {6, 1}};
get({4, 259}) ->
    #endless_data{type = 4, id = 259,
		  name = lang:get(<<"第259波"/utf8>>), lev = 312,
		  unit_ids = [64112], is_reset = 0, formation = {1, 1}};
get({4, 260}) ->
    #endless_data{type = 4, id = 260,
		  name = lang:get(<<"第260波"/utf8>>), lev = 312,
		  unit_ids = [64113], is_reset = 0, formation = {1, 1}};
get({4, 261}) ->
    #endless_data{type = 4, id = 261,
		  name = lang:get(<<"第261波"/utf8>>), lev = 313,
		  unit_ids = [64114], is_reset = 0, formation = {2, 1}};
get({4, 262}) ->
    #endless_data{type = 4, id = 262,
		  name = lang:get(<<"第262波"/utf8>>), lev = 314,
		  unit_ids = [64115], is_reset = 0, formation = {2, 1}};
get({4, 263}) ->
    #endless_data{type = 4, id = 263,
		  name = lang:get(<<"第263波"/utf8>>), lev = 314,
		  unit_ids = [64116], is_reset = 0, formation = {3, 1}};
get({4, 264}) ->
    #endless_data{type = 4, id = 264,
		  name = lang:get(<<"第264波"/utf8>>), lev = 315,
		  unit_ids = [64117], is_reset = 0, formation = {3, 1}};
get({4, 265}) ->
    #endless_data{type = 4, id = 265,
		  name = lang:get(<<"第265波"/utf8>>), lev = 316,
		  unit_ids = [64118], is_reset = 0, formation = {4, 1}};
get({4, 266}) ->
    #endless_data{type = 4, id = 266,
		  name = lang:get(<<"第266波"/utf8>>), lev = 316,
		  unit_ids = [64119], is_reset = 0, formation = {4, 1}};
get({4, 267}) ->
    #endless_data{type = 4, id = 267,
		  name = lang:get(<<"第267波"/utf8>>), lev = 317,
		  unit_ids = [64120], is_reset = 0, formation = {5, 1}};
get({4, 268}) ->
    #endless_data{type = 4, id = 268,
		  name = lang:get(<<"第268波"/utf8>>), lev = 318,
		  unit_ids = [64121], is_reset = 0, formation = {5, 1}};
get({4, 269}) ->
    #endless_data{type = 4, id = 269,
		  name = lang:get(<<"第269波"/utf8>>), lev = 318,
		  unit_ids = [64122], is_reset = 0, formation = {6, 1}};
get({4, 270}) ->
    #endless_data{type = 4, id = 270,
		  name = lang:get(<<"第270波"/utf8>>), lev = 319,
		  unit_ids = [64123], is_reset = 0, formation = {6, 1}};
get({4, 271}) ->
    #endless_data{type = 4, id = 271,
		  name = lang:get(<<"第271波"/utf8>>), lev = 320,
		  unit_ids = [64109], is_reset = 0, formation = {1, 1}};
get({4, 272}) ->
    #endless_data{type = 4, id = 272,
		  name = lang:get(<<"第272波"/utf8>>), lev = 320,
		  unit_ids = [64110], is_reset = 0, formation = {1, 1}};
get({4, 273}) ->
    #endless_data{type = 4, id = 273,
		  name = lang:get(<<"第273波"/utf8>>), lev = 321,
		  unit_ids = [64111], is_reset = 0, formation = {2, 1}};
get({4, 274}) ->
    #endless_data{type = 4, id = 274,
		  name = lang:get(<<"第274波"/utf8>>), lev = 322,
		  unit_ids = [64112], is_reset = 0, formation = {2, 1}};
get({4, 275}) ->
    #endless_data{type = 4, id = 275,
		  name = lang:get(<<"第275波"/utf8>>), lev = 322,
		  unit_ids = [64113], is_reset = 0, formation = {3, 1}};
get({4, 276}) ->
    #endless_data{type = 4, id = 276,
		  name = lang:get(<<"第276波"/utf8>>), lev = 323,
		  unit_ids = [64114], is_reset = 0, formation = {3, 1}};
get({4, 277}) ->
    #endless_data{type = 4, id = 277,
		  name = lang:get(<<"第277波"/utf8>>), lev = 324,
		  unit_ids = [64115], is_reset = 0, formation = {4, 1}};
get({4, 278}) ->
    #endless_data{type = 4, id = 278,
		  name = lang:get(<<"第278波"/utf8>>), lev = 324,
		  unit_ids = [64116], is_reset = 0, formation = {4, 1}};
get({4, 279}) ->
    #endless_data{type = 4, id = 279,
		  name = lang:get(<<"第279波"/utf8>>), lev = 325,
		  unit_ids = [64117], is_reset = 0, formation = {5, 1}};
get({4, 280}) ->
    #endless_data{type = 4, id = 280,
		  name = lang:get(<<"第280波"/utf8>>), lev = 326,
		  unit_ids = [64118], is_reset = 0, formation = {5, 1}};
get({4, 281}) ->
    #endless_data{type = 4, id = 281,
		  name = lang:get(<<"第281波"/utf8>>), lev = 326,
		  unit_ids = [64119], is_reset = 0, formation = {6, 1}};
get({4, 282}) ->
    #endless_data{type = 4, id = 282,
		  name = lang:get(<<"第282波"/utf8>>), lev = 327,
		  unit_ids = [64120], is_reset = 0, formation = {6, 1}};
get({4, 283}) ->
    #endless_data{type = 4, id = 283,
		  name = lang:get(<<"第283波"/utf8>>), lev = 328,
		  unit_ids = [64121], is_reset = 0, formation = {1, 1}};
get({4, 284}) ->
    #endless_data{type = 4, id = 284,
		  name = lang:get(<<"第284波"/utf8>>), lev = 328,
		  unit_ids = [64122], is_reset = 0, formation = {1, 1}};
get({4, 285}) ->
    #endless_data{type = 4, id = 285,
		  name = lang:get(<<"第285波"/utf8>>), lev = 329,
		  unit_ids = [64123], is_reset = 0, formation = {2, 1}};
get({4, 286}) ->
    #endless_data{type = 4, id = 286,
		  name = lang:get(<<"第286波"/utf8>>), lev = 330,
		  unit_ids = [64109], is_reset = 0, formation = {2, 1}};
get({4, 287}) ->
    #endless_data{type = 4, id = 287,
		  name = lang:get(<<"第287波"/utf8>>), lev = 330,
		  unit_ids = [64110], is_reset = 0, formation = {3, 1}};
get({4, 288}) ->
    #endless_data{type = 4, id = 288,
		  name = lang:get(<<"第288波"/utf8>>), lev = 331,
		  unit_ids = [64111], is_reset = 0, formation = {3, 1}};
get({4, 289}) ->
    #endless_data{type = 4, id = 289,
		  name = lang:get(<<"第289波"/utf8>>), lev = 332,
		  unit_ids = [64112], is_reset = 0, formation = {4, 1}};
get({4, 290}) ->
    #endless_data{type = 4, id = 290,
		  name = lang:get(<<"第290波"/utf8>>), lev = 332,
		  unit_ids = [64113], is_reset = 0, formation = {4, 1}};
get({4, 291}) ->
    #endless_data{type = 4, id = 291,
		  name = lang:get(<<"第291波"/utf8>>), lev = 333,
		  unit_ids = [64114], is_reset = 0, formation = {5, 1}};
get({4, 292}) ->
    #endless_data{type = 4, id = 292,
		  name = lang:get(<<"第292波"/utf8>>), lev = 334,
		  unit_ids = [64115], is_reset = 0, formation = {5, 1}};
get({4, 293}) ->
    #endless_data{type = 4, id = 293,
		  name = lang:get(<<"第293波"/utf8>>), lev = 334,
		  unit_ids = [64116], is_reset = 0, formation = {6, 1}};
get({4, 294}) ->
    #endless_data{type = 4, id = 294,
		  name = lang:get(<<"第294波"/utf8>>), lev = 335,
		  unit_ids = [64117], is_reset = 0, formation = {6, 1}};
get({4, 295}) ->
    #endless_data{type = 4, id = 295,
		  name = lang:get(<<"第295波"/utf8>>), lev = 336,
		  unit_ids = [64118], is_reset = 0, formation = {1, 1}};
get({4, 296}) ->
    #endless_data{type = 4, id = 296,
		  name = lang:get(<<"第296波"/utf8>>), lev = 336,
		  unit_ids = [64119], is_reset = 0, formation = {1, 1}};
get({4, 297}) ->
    #endless_data{type = 4, id = 297,
		  name = lang:get(<<"第297波"/utf8>>), lev = 337,
		  unit_ids = [64120], is_reset = 0, formation = {2, 1}};
get({4, 298}) ->
    #endless_data{type = 4, id = 298,
		  name = lang:get(<<"第298波"/utf8>>), lev = 338,
		  unit_ids = [64121], is_reset = 0, formation = {2, 1}};
get({4, 299}) ->
    #endless_data{type = 4, id = 299,
		  name = lang:get(<<"第299波"/utf8>>), lev = 338,
		  unit_ids = [64122], is_reset = 0, formation = {3, 1}};
get({4, 300}) ->
    #endless_data{type = 4, id = 300,
		  name = lang:get(<<"第300波"/utf8>>), lev = 339,
		  unit_ids = [64123], is_reset = 0, formation = {3, 1}};
get({4, 301}) ->
    #endless_data{type = 4, id = 301,
		  name = lang:get(<<"第301波"/utf8>>), lev = 340,
		  unit_ids = [64109], is_reset = 0, formation = {4, 1}};
get({4, 302}) ->
    #endless_data{type = 4, id = 302,
		  name = lang:get(<<"第302波"/utf8>>), lev = 340,
		  unit_ids = [64110], is_reset = 0, formation = {4, 1}};
get({4, 303}) ->
    #endless_data{type = 4, id = 303,
		  name = lang:get(<<"第303波"/utf8>>), lev = 341,
		  unit_ids = [64111], is_reset = 0, formation = {5, 1}};
get({4, 304}) ->
    #endless_data{type = 4, id = 304,
		  name = lang:get(<<"第304波"/utf8>>), lev = 342,
		  unit_ids = [64112], is_reset = 0, formation = {5, 1}};
get({4, 305}) ->
    #endless_data{type = 4, id = 305,
		  name = lang:get(<<"第305波"/utf8>>), lev = 342,
		  unit_ids = [64113], is_reset = 0, formation = {6, 1}};
get({4, 306}) ->
    #endless_data{type = 4, id = 306,
		  name = lang:get(<<"第306波"/utf8>>), lev = 343,
		  unit_ids = [64114], is_reset = 0, formation = {6, 1}};
get({4, 307}) ->
    #endless_data{type = 4, id = 307,
		  name = lang:get(<<"第307波"/utf8>>), lev = 344,
		  unit_ids = [64115], is_reset = 0, formation = {1, 1}};
get({4, 308}) ->
    #endless_data{type = 4, id = 308,
		  name = lang:get(<<"第308波"/utf8>>), lev = 344,
		  unit_ids = [64116], is_reset = 0, formation = {1, 1}};
get({4, 309}) ->
    #endless_data{type = 4, id = 309,
		  name = lang:get(<<"第309波"/utf8>>), lev = 345,
		  unit_ids = [64117], is_reset = 0, formation = {2, 1}};
get({4, 310}) ->
    #endless_data{type = 4, id = 310,
		  name = lang:get(<<"第310波"/utf8>>), lev = 346,
		  unit_ids = [64118], is_reset = 0, formation = {2, 1}};
get({4, 311}) ->
    #endless_data{type = 4, id = 311,
		  name = lang:get(<<"第311波"/utf8>>), lev = 346,
		  unit_ids = [64119], is_reset = 0, formation = {3, 1}};
get({4, 312}) ->
    #endless_data{type = 4, id = 312,
		  name = lang:get(<<"第312波"/utf8>>), lev = 347,
		  unit_ids = [64120], is_reset = 0, formation = {3, 1}};
get({4, 313}) ->
    #endless_data{type = 4, id = 313,
		  name = lang:get(<<"第313波"/utf8>>), lev = 348,
		  unit_ids = [64121], is_reset = 0, formation = {4, 1}};
get({4, 314}) ->
    #endless_data{type = 4, id = 314,
		  name = lang:get(<<"第314波"/utf8>>), lev = 348,
		  unit_ids = [64122], is_reset = 0, formation = {4, 1}};
get({4, 315}) ->
    #endless_data{type = 4, id = 315,
		  name = lang:get(<<"第315波"/utf8>>), lev = 349,
		  unit_ids = [64123], is_reset = 0, formation = {5, 1}};
get({4, 316}) ->
    #endless_data{type = 4, id = 316,
		  name = lang:get(<<"第316波"/utf8>>), lev = 350,
		  unit_ids = [64109], is_reset = 0, formation = {5, 1}};
get({4, 317}) ->
    #endless_data{type = 4, id = 317,
		  name = lang:get(<<"第317波"/utf8>>), lev = 350,
		  unit_ids = [64110], is_reset = 0, formation = {6, 1}};
get({4, 318}) ->
    #endless_data{type = 4, id = 318,
		  name = lang:get(<<"第318波"/utf8>>), lev = 351,
		  unit_ids = [64111], is_reset = 0, formation = {6, 1}};
get({4, 319}) ->
    #endless_data{type = 4, id = 319,
		  name = lang:get(<<"第319波"/utf8>>), lev = 352,
		  unit_ids = [64112], is_reset = 0, formation = {1, 1}};
get({4, 320}) ->
    #endless_data{type = 4, id = 320,
		  name = lang:get(<<"第320波"/utf8>>), lev = 352,
		  unit_ids = [64113], is_reset = 0, formation = {1, 1}};
get({4, 321}) ->
    #endless_data{type = 4, id = 321,
		  name = lang:get(<<"第321波"/utf8>>), lev = 353,
		  unit_ids = [64114], is_reset = 0, formation = {2, 1}};
get({4, 322}) ->
    #endless_data{type = 4, id = 322,
		  name = lang:get(<<"第322波"/utf8>>), lev = 354,
		  unit_ids = [64115], is_reset = 0, formation = {2, 1}};
get({4, 323}) ->
    #endless_data{type = 4, id = 323,
		  name = lang:get(<<"第323波"/utf8>>), lev = 354,
		  unit_ids = [64116], is_reset = 0, formation = {3, 1}};
get({4, 324}) ->
    #endless_data{type = 4, id = 324,
		  name = lang:get(<<"第324波"/utf8>>), lev = 355,
		  unit_ids = [64117], is_reset = 0, formation = {3, 1}};
get({4, 325}) ->
    #endless_data{type = 4, id = 325,
		  name = lang:get(<<"第325波"/utf8>>), lev = 356,
		  unit_ids = [64118], is_reset = 0, formation = {4, 1}};
get({4, 326}) ->
    #endless_data{type = 4, id = 326,
		  name = lang:get(<<"第326波"/utf8>>), lev = 356,
		  unit_ids = [64119], is_reset = 0, formation = {4, 1}};
get({4, 327}) ->
    #endless_data{type = 4, id = 327,
		  name = lang:get(<<"第327波"/utf8>>), lev = 357,
		  unit_ids = [64120], is_reset = 0, formation = {5, 1}};
get({4, 328}) ->
    #endless_data{type = 4, id = 328,
		  name = lang:get(<<"第328波"/utf8>>), lev = 358,
		  unit_ids = [64121], is_reset = 0, formation = {5, 1}};
get({4, 329}) ->
    #endless_data{type = 4, id = 329,
		  name = lang:get(<<"第329波"/utf8>>), lev = 358,
		  unit_ids = [64122], is_reset = 0, formation = {6, 1}};
get({4, 330}) ->
    #endless_data{type = 4, id = 330,
		  name = lang:get(<<"第330波"/utf8>>), lev = 359,
		  unit_ids = [64123], is_reset = 0, formation = {6, 1}};
get({4, 331}) ->
    #endless_data{type = 4, id = 331,
		  name = lang:get(<<"第331波"/utf8>>), lev = 360,
		  unit_ids = [64109], is_reset = 0, formation = {1, 1}};
get({4, 332}) ->
    #endless_data{type = 4, id = 332,
		  name = lang:get(<<"第332波"/utf8>>), lev = 360,
		  unit_ids = [64110], is_reset = 0, formation = {1, 1}};
get({4, 333}) ->
    #endless_data{type = 4, id = 333,
		  name = lang:get(<<"第333波"/utf8>>), lev = 361,
		  unit_ids = [64111], is_reset = 0, formation = {2, 1}};
get({4, 334}) ->
    #endless_data{type = 4, id = 334,
		  name = lang:get(<<"第334波"/utf8>>), lev = 362,
		  unit_ids = [64112], is_reset = 0, formation = {2, 1}};
get({4, 335}) ->
    #endless_data{type = 4, id = 335,
		  name = lang:get(<<"第335波"/utf8>>), lev = 362,
		  unit_ids = [64113], is_reset = 0, formation = {3, 1}};
get({4, 336}) ->
    #endless_data{type = 4, id = 336,
		  name = lang:get(<<"第336波"/utf8>>), lev = 363,
		  unit_ids = [64114], is_reset = 0, formation = {3, 1}};
get({4, 337}) ->
    #endless_data{type = 4, id = 337,
		  name = lang:get(<<"第337波"/utf8>>), lev = 364,
		  unit_ids = [64115], is_reset = 0, formation = {4, 1}};
get({4, 338}) ->
    #endless_data{type = 4, id = 338,
		  name = lang:get(<<"第338波"/utf8>>), lev = 364,
		  unit_ids = [64116], is_reset = 0, formation = {4, 1}};
get({4, 339}) ->
    #endless_data{type = 4, id = 339,
		  name = lang:get(<<"第339波"/utf8>>), lev = 365,
		  unit_ids = [64117], is_reset = 0, formation = {5, 1}};
get({4, 340}) ->
    #endless_data{type = 4, id = 340,
		  name = lang:get(<<"第340波"/utf8>>), lev = 366,
		  unit_ids = [64118], is_reset = 0, formation = {5, 1}};
get({4, 341}) ->
    #endless_data{type = 4, id = 341,
		  name = lang:get(<<"第341波"/utf8>>), lev = 366,
		  unit_ids = [64119], is_reset = 0, formation = {6, 1}};
get({4, 342}) ->
    #endless_data{type = 4, id = 342,
		  name = lang:get(<<"第342波"/utf8>>), lev = 367,
		  unit_ids = [64120], is_reset = 0, formation = {6, 1}};
get({4, 343}) ->
    #endless_data{type = 4, id = 343,
		  name = lang:get(<<"第343波"/utf8>>), lev = 368,
		  unit_ids = [64121], is_reset = 0, formation = {1, 1}};
get({4, 344}) ->
    #endless_data{type = 4, id = 344,
		  name = lang:get(<<"第344波"/utf8>>), lev = 368,
		  unit_ids = [64122], is_reset = 0, formation = {1, 1}};
get({4, 345}) ->
    #endless_data{type = 4, id = 345,
		  name = lang:get(<<"第345波"/utf8>>), lev = 369,
		  unit_ids = [64123], is_reset = 0, formation = {2, 1}};
get({4, 346}) ->
    #endless_data{type = 4, id = 346,
		  name = lang:get(<<"第346波"/utf8>>), lev = 370,
		  unit_ids = [64109], is_reset = 0, formation = {2, 1}};
get({4, 347}) ->
    #endless_data{type = 4, id = 347,
		  name = lang:get(<<"第347波"/utf8>>), lev = 370,
		  unit_ids = [64110], is_reset = 0, formation = {3, 1}};
get({4, 348}) ->
    #endless_data{type = 4, id = 348,
		  name = lang:get(<<"第348波"/utf8>>), lev = 371,
		  unit_ids = [64111], is_reset = 0, formation = {3, 1}};
get({4, 349}) ->
    #endless_data{type = 4, id = 349,
		  name = lang:get(<<"第349波"/utf8>>), lev = 372,
		  unit_ids = [64112], is_reset = 0, formation = {4, 1}};
get({4, 350}) ->
    #endless_data{type = 4, id = 350,
		  name = lang:get(<<"第350波"/utf8>>), lev = 372,
		  unit_ids = [64113], is_reset = 0, formation = {4, 1}};
get({4, 351}) ->
    #endless_data{type = 4, id = 351,
		  name = lang:get(<<"第351波"/utf8>>), lev = 373,
		  unit_ids = [64114], is_reset = 0, formation = {5, 1}};
get({4, 352}) ->
    #endless_data{type = 4, id = 352,
		  name = lang:get(<<"第352波"/utf8>>), lev = 374,
		  unit_ids = [64115], is_reset = 0, formation = {5, 1}};
get({4, 353}) ->
    #endless_data{type = 4, id = 353,
		  name = lang:get(<<"第353波"/utf8>>), lev = 374,
		  unit_ids = [64116], is_reset = 0, formation = {6, 1}};
get({4, 354}) ->
    #endless_data{type = 4, id = 354,
		  name = lang:get(<<"第354波"/utf8>>), lev = 375,
		  unit_ids = [64117], is_reset = 0, formation = {6, 1}};
get({4, 355}) ->
    #endless_data{type = 4, id = 355,
		  name = lang:get(<<"第355波"/utf8>>), lev = 376,
		  unit_ids = [64118], is_reset = 0, formation = {1, 1}};
get({4, 356}) ->
    #endless_data{type = 4, id = 356,
		  name = lang:get(<<"第356波"/utf8>>), lev = 376,
		  unit_ids = [64119], is_reset = 0, formation = {1, 1}};
get({4, 357}) ->
    #endless_data{type = 4, id = 357,
		  name = lang:get(<<"第357波"/utf8>>), lev = 377,
		  unit_ids = [64120], is_reset = 0, formation = {2, 1}};
get({4, 358}) ->
    #endless_data{type = 4, id = 358,
		  name = lang:get(<<"第358波"/utf8>>), lev = 378,
		  unit_ids = [64121], is_reset = 0, formation = {2, 1}};
get({4, 359}) ->
    #endless_data{type = 4, id = 359,
		  name = lang:get(<<"第359波"/utf8>>), lev = 378,
		  unit_ids = [64122], is_reset = 0, formation = {3, 1}};
get({4, 360}) ->
    #endless_data{type = 4, id = 360,
		  name = lang:get(<<"第360波"/utf8>>), lev = 379,
		  unit_ids = [64123], is_reset = 0, formation = {3, 1}};
get({4, 361}) ->
    #endless_data{type = 4, id = 361,
		  name = lang:get(<<"第361波"/utf8>>), lev = 380,
		  unit_ids = [64109], is_reset = 0, formation = {4, 1}};
get({4, 362}) ->
    #endless_data{type = 4, id = 362,
		  name = lang:get(<<"第362波"/utf8>>), lev = 380,
		  unit_ids = [64110], is_reset = 0, formation = {4, 1}};
get({4, 363}) ->
    #endless_data{type = 4, id = 363,
		  name = lang:get(<<"第363波"/utf8>>), lev = 381,
		  unit_ids = [64111], is_reset = 0, formation = {5, 1}};
get({4, 364}) ->
    #endless_data{type = 4, id = 364,
		  name = lang:get(<<"第364波"/utf8>>), lev = 382,
		  unit_ids = [64112], is_reset = 0, formation = {5, 1}};
get({4, 365}) ->
    #endless_data{type = 4, id = 365,
		  name = lang:get(<<"第365波"/utf8>>), lev = 382,
		  unit_ids = [64113], is_reset = 0, formation = {6, 1}};
get({4, 366}) ->
    #endless_data{type = 4, id = 366,
		  name = lang:get(<<"第366波"/utf8>>), lev = 383,
		  unit_ids = [64114], is_reset = 0, formation = {6, 1}};
get({4, 367}) ->
    #endless_data{type = 4, id = 367,
		  name = lang:get(<<"第367波"/utf8>>), lev = 384,
		  unit_ids = [64115], is_reset = 0, formation = {1, 1}};
get({4, 368}) ->
    #endless_data{type = 4, id = 368,
		  name = lang:get(<<"第368波"/utf8>>), lev = 384,
		  unit_ids = [64116], is_reset = 0, formation = {1, 1}};
get({4, 369}) ->
    #endless_data{type = 4, id = 369,
		  name = lang:get(<<"第369波"/utf8>>), lev = 385,
		  unit_ids = [64117], is_reset = 0, formation = {2, 1}};
get({4, 370}) ->
    #endless_data{type = 4, id = 370,
		  name = lang:get(<<"第370波"/utf8>>), lev = 386,
		  unit_ids = [64118], is_reset = 0, formation = {2, 1}};
get({4, 371}) ->
    #endless_data{type = 4, id = 371,
		  name = lang:get(<<"第371波"/utf8>>), lev = 386,
		  unit_ids = [64119], is_reset = 0, formation = {3, 1}};
get({4, 372}) ->
    #endless_data{type = 4, id = 372,
		  name = lang:get(<<"第372波"/utf8>>), lev = 387,
		  unit_ids = [64120], is_reset = 0, formation = {3, 1}};
get({4, 373}) ->
    #endless_data{type = 4, id = 373,
		  name = lang:get(<<"第373波"/utf8>>), lev = 388,
		  unit_ids = [64121], is_reset = 0, formation = {4, 1}};
get({4, 374}) ->
    #endless_data{type = 4, id = 374,
		  name = lang:get(<<"第374波"/utf8>>), lev = 388,
		  unit_ids = [64122], is_reset = 0, formation = {4, 1}};
get({4, 375}) ->
    #endless_data{type = 4, id = 375,
		  name = lang:get(<<"第375波"/utf8>>), lev = 389,
		  unit_ids = [64123], is_reset = 0, formation = {5, 1}};
get({4, 376}) ->
    #endless_data{type = 4, id = 376,
		  name = lang:get(<<"第376波"/utf8>>), lev = 390,
		  unit_ids = [64109], is_reset = 0, formation = {5, 1}};
get({4, 377}) ->
    #endless_data{type = 4, id = 377,
		  name = lang:get(<<"第377波"/utf8>>), lev = 390,
		  unit_ids = [64110], is_reset = 0, formation = {6, 1}};
get({4, 378}) ->
    #endless_data{type = 4, id = 378,
		  name = lang:get(<<"第378波"/utf8>>), lev = 391,
		  unit_ids = [64111], is_reset = 0, formation = {6, 1}};
get({4, 379}) ->
    #endless_data{type = 4, id = 379,
		  name = lang:get(<<"第379波"/utf8>>), lev = 392,
		  unit_ids = [64112], is_reset = 0, formation = {1, 1}};
get({4, 380}) ->
    #endless_data{type = 4, id = 380,
		  name = lang:get(<<"第380波"/utf8>>), lev = 392,
		  unit_ids = [64113], is_reset = 0, formation = {1, 1}};
get({4, 381}) ->
    #endless_data{type = 4, id = 381,
		  name = lang:get(<<"第381波"/utf8>>), lev = 393,
		  unit_ids = [64114], is_reset = 0, formation = {2, 1}};
get({4, 382}) ->
    #endless_data{type = 4, id = 382,
		  name = lang:get(<<"第382波"/utf8>>), lev = 394,
		  unit_ids = [64115], is_reset = 0, formation = {2, 1}};
get({4, 383}) ->
    #endless_data{type = 4, id = 383,
		  name = lang:get(<<"第383波"/utf8>>), lev = 394,
		  unit_ids = [64116], is_reset = 0, formation = {3, 1}};
get({4, 384}) ->
    #endless_data{type = 4, id = 384,
		  name = lang:get(<<"第384波"/utf8>>), lev = 395,
		  unit_ids = [64117], is_reset = 0, formation = {3, 1}};
get({4, 385}) ->
    #endless_data{type = 4, id = 385,
		  name = lang:get(<<"第385波"/utf8>>), lev = 396,
		  unit_ids = [64118], is_reset = 0, formation = {4, 1}};
get({4, 386}) ->
    #endless_data{type = 4, id = 386,
		  name = lang:get(<<"第386波"/utf8>>), lev = 396,
		  unit_ids = [64119], is_reset = 0, formation = {4, 1}};
get({4, 387}) ->
    #endless_data{type = 4, id = 387,
		  name = lang:get(<<"第387波"/utf8>>), lev = 397,
		  unit_ids = [64120], is_reset = 0, formation = {5, 1}};
get({4, 388}) ->
    #endless_data{type = 4, id = 388,
		  name = lang:get(<<"第388波"/utf8>>), lev = 398,
		  unit_ids = [64121], is_reset = 0, formation = {5, 1}};
get({4, 389}) ->
    #endless_data{type = 4, id = 389,
		  name = lang:get(<<"第389波"/utf8>>), lev = 398,
		  unit_ids = [64122], is_reset = 0, formation = {6, 1}};
get({4, 390}) ->
    #endless_data{type = 4, id = 390,
		  name = lang:get(<<"第390波"/utf8>>), lev = 399,
		  unit_ids = [64123], is_reset = 0, formation = {6, 1}};
get({4, 391}) ->
    #endless_data{type = 4, id = 391,
		  name = lang:get(<<"第391波"/utf8>>), lev = 400,
		  unit_ids = [64109], is_reset = 0, formation = {1, 1}};
get({4, 392}) ->
    #endless_data{type = 4, id = 392,
		  name = lang:get(<<"第392波"/utf8>>), lev = 400,
		  unit_ids = [64110], is_reset = 0, formation = {1, 1}};
get({4, 393}) ->
    #endless_data{type = 4, id = 393,
		  name = lang:get(<<"第393波"/utf8>>), lev = 401,
		  unit_ids = [64111], is_reset = 0, formation = {2, 1}};
get({4, 394}) ->
    #endless_data{type = 4, id = 394,
		  name = lang:get(<<"第394波"/utf8>>), lev = 402,
		  unit_ids = [64112], is_reset = 0, formation = {2, 1}};
get({4, 395}) ->
    #endless_data{type = 4, id = 395,
		  name = lang:get(<<"第395波"/utf8>>), lev = 402,
		  unit_ids = [64113], is_reset = 0, formation = {3, 1}};
get({4, 396}) ->
    #endless_data{type = 4, id = 396,
		  name = lang:get(<<"第396波"/utf8>>), lev = 403,
		  unit_ids = [64114], is_reset = 0, formation = {3, 1}};
get({4, 397}) ->
    #endless_data{type = 4, id = 397,
		  name = lang:get(<<"第397波"/utf8>>), lev = 404,
		  unit_ids = [64115], is_reset = 0, formation = {4, 1}};
get({4, 398}) ->
    #endless_data{type = 4, id = 398,
		  name = lang:get(<<"第398波"/utf8>>), lev = 404,
		  unit_ids = [64116], is_reset = 0, formation = {4, 1}};
get({4, 399}) ->
    #endless_data{type = 4, id = 399,
		  name = lang:get(<<"第399波"/utf8>>), lev = 405,
		  unit_ids = [64117], is_reset = 0, formation = {5, 1}};
get({4, 400}) ->
    #endless_data{type = 4, id = 400,
		  name = lang:get(<<"第400波"/utf8>>), lev = 406,
		  unit_ids = [64118], is_reset = 0, formation = {5, 1}};
get({4, 401}) ->
    #endless_data{type = 4, id = 401,
		  name = lang:get(<<"第401波"/utf8>>), lev = 406,
		  unit_ids = [64119], is_reset = 0, formation = {6, 1}};
get({4, 402}) ->
    #endless_data{type = 4, id = 402,
		  name = lang:get(<<"第402波"/utf8>>), lev = 407,
		  unit_ids = [64120], is_reset = 0, formation = {6, 1}};
get({4, 403}) ->
    #endless_data{type = 4, id = 403,
		  name = lang:get(<<"第403波"/utf8>>), lev = 408,
		  unit_ids = [64121], is_reset = 0, formation = {1, 1}};
get({4, 404}) ->
    #endless_data{type = 4, id = 404,
		  name = lang:get(<<"第404波"/utf8>>), lev = 408,
		  unit_ids = [64122], is_reset = 0, formation = {1, 1}};
get({4, 405}) ->
    #endless_data{type = 4, id = 405,
		  name = lang:get(<<"第405波"/utf8>>), lev = 409,
		  unit_ids = [64123], is_reset = 0, formation = {2, 1}};
get({4, 406}) ->
    #endless_data{type = 4, id = 406,
		  name = lang:get(<<"第406波"/utf8>>), lev = 410,
		  unit_ids = [64109], is_reset = 0, formation = {2, 1}};
get({4, 407}) ->
    #endless_data{type = 4, id = 407,
		  name = lang:get(<<"第407波"/utf8>>), lev = 410,
		  unit_ids = [64110], is_reset = 0, formation = {3, 1}};
get({4, 408}) ->
    #endless_data{type = 4, id = 408,
		  name = lang:get(<<"第408波"/utf8>>), lev = 411,
		  unit_ids = [64111], is_reset = 0, formation = {3, 1}};
get({4, 409}) ->
    #endless_data{type = 4, id = 409,
		  name = lang:get(<<"第409波"/utf8>>), lev = 412,
		  unit_ids = [64112], is_reset = 0, formation = {4, 1}};
get({4, 410}) ->
    #endless_data{type = 4, id = 410,
		  name = lang:get(<<"第410波"/utf8>>), lev = 412,
		  unit_ids = [64113], is_reset = 0, formation = {4, 1}};
get({4, 411}) ->
    #endless_data{type = 4, id = 411,
		  name = lang:get(<<"第411波"/utf8>>), lev = 413,
		  unit_ids = [64114], is_reset = 0, formation = {5, 1}};
get({4, 412}) ->
    #endless_data{type = 4, id = 412,
		  name = lang:get(<<"第412波"/utf8>>), lev = 414,
		  unit_ids = [64115], is_reset = 0, formation = {5, 1}};
get({4, 413}) ->
    #endless_data{type = 4, id = 413,
		  name = lang:get(<<"第413波"/utf8>>), lev = 414,
		  unit_ids = [64116], is_reset = 0, formation = {6, 1}};
get({4, 414}) ->
    #endless_data{type = 4, id = 414,
		  name = lang:get(<<"第414波"/utf8>>), lev = 415,
		  unit_ids = [64117], is_reset = 0, formation = {6, 1}};
get({4, 415}) ->
    #endless_data{type = 4, id = 415,
		  name = lang:get(<<"第415波"/utf8>>), lev = 416,
		  unit_ids = [64118], is_reset = 0, formation = {1, 1}};
get({4, 416}) ->
    #endless_data{type = 4, id = 416,
		  name = lang:get(<<"第416波"/utf8>>), lev = 416,
		  unit_ids = [64119], is_reset = 0, formation = {1, 1}};
get({4, 417}) ->
    #endless_data{type = 4, id = 417,
		  name = lang:get(<<"第417波"/utf8>>), lev = 417,
		  unit_ids = [64120], is_reset = 0, formation = {2, 1}};
get({4, 418}) ->
    #endless_data{type = 4, id = 418,
		  name = lang:get(<<"第418波"/utf8>>), lev = 418,
		  unit_ids = [64121], is_reset = 0, formation = {2, 1}};
get({4, 419}) ->
    #endless_data{type = 4, id = 419,
		  name = lang:get(<<"第419波"/utf8>>), lev = 418,
		  unit_ids = [64122], is_reset = 0, formation = {3, 1}};
get({4, 420}) ->
    #endless_data{type = 4, id = 420,
		  name = lang:get(<<"第420波"/utf8>>), lev = 419,
		  unit_ids = [64123], is_reset = 0, formation = {3, 1}};
get({4, 421}) ->
    #endless_data{type = 4, id = 421,
		  name = lang:get(<<"第421波"/utf8>>), lev = 420,
		  unit_ids = [64109], is_reset = 0, formation = {4, 1}};
get({4, 422}) ->
    #endless_data{type = 4, id = 422,
		  name = lang:get(<<"第422波"/utf8>>), lev = 420,
		  unit_ids = [64110], is_reset = 0, formation = {4, 1}};
get({4, 423}) ->
    #endless_data{type = 4, id = 423,
		  name = lang:get(<<"第423波"/utf8>>), lev = 421,
		  unit_ids = [64111], is_reset = 0, formation = {5, 1}};
get({4, 424}) ->
    #endless_data{type = 4, id = 424,
		  name = lang:get(<<"第424波"/utf8>>), lev = 422,
		  unit_ids = [64112], is_reset = 0, formation = {5, 1}};
get({4, 425}) ->
    #endless_data{type = 4, id = 425,
		  name = lang:get(<<"第425波"/utf8>>), lev = 422,
		  unit_ids = [64113], is_reset = 0, formation = {6, 1}};
get({4, 426}) ->
    #endless_data{type = 4, id = 426,
		  name = lang:get(<<"第426波"/utf8>>), lev = 423,
		  unit_ids = [64114], is_reset = 0, formation = {6, 1}};
get({4, 427}) ->
    #endless_data{type = 4, id = 427,
		  name = lang:get(<<"第427波"/utf8>>), lev = 424,
		  unit_ids = [64115], is_reset = 0, formation = {1, 1}};
get({4, 428}) ->
    #endless_data{type = 4, id = 428,
		  name = lang:get(<<"第428波"/utf8>>), lev = 424,
		  unit_ids = [64116], is_reset = 0, formation = {1, 1}};
get({4, 429}) ->
    #endless_data{type = 4, id = 429,
		  name = lang:get(<<"第429波"/utf8>>), lev = 425,
		  unit_ids = [64117], is_reset = 0, formation = {2, 1}};
get({4, 430}) ->
    #endless_data{type = 4, id = 430,
		  name = lang:get(<<"第430波"/utf8>>), lev = 426,
		  unit_ids = [64118], is_reset = 0, formation = {2, 1}};
get({4, 431}) ->
    #endless_data{type = 4, id = 431,
		  name = lang:get(<<"第431波"/utf8>>), lev = 426,
		  unit_ids = [64119], is_reset = 0, formation = {3, 1}};
get({4, 432}) ->
    #endless_data{type = 4, id = 432,
		  name = lang:get(<<"第432波"/utf8>>), lev = 427,
		  unit_ids = [64120], is_reset = 0, formation = {3, 1}};
get({4, 433}) ->
    #endless_data{type = 4, id = 433,
		  name = lang:get(<<"第433波"/utf8>>), lev = 428,
		  unit_ids = [64121], is_reset = 0, formation = {4, 1}};
get({4, 434}) ->
    #endless_data{type = 4, id = 434,
		  name = lang:get(<<"第434波"/utf8>>), lev = 428,
		  unit_ids = [64122], is_reset = 0, formation = {4, 1}};
get({4, 435}) ->
    #endless_data{type = 4, id = 435,
		  name = lang:get(<<"第435波"/utf8>>), lev = 429,
		  unit_ids = [64123], is_reset = 0, formation = {5, 1}};
get({4, 436}) ->
    #endless_data{type = 4, id = 436,
		  name = lang:get(<<"第436波"/utf8>>), lev = 430,
		  unit_ids = [64109], is_reset = 0, formation = {5, 1}};
get({4, 437}) ->
    #endless_data{type = 4, id = 437,
		  name = lang:get(<<"第437波"/utf8>>), lev = 430,
		  unit_ids = [64110], is_reset = 0, formation = {6, 1}};
get({4, 438}) ->
    #endless_data{type = 4, id = 438,
		  name = lang:get(<<"第438波"/utf8>>), lev = 431,
		  unit_ids = [64111], is_reset = 0, formation = {6, 1}};
get({4, 439}) ->
    #endless_data{type = 4, id = 439,
		  name = lang:get(<<"第439波"/utf8>>), lev = 432,
		  unit_ids = [64112], is_reset = 0, formation = {1, 1}};
get({4, 440}) ->
    #endless_data{type = 4, id = 440,
		  name = lang:get(<<"第440波"/utf8>>), lev = 432,
		  unit_ids = [64113], is_reset = 0, formation = {1, 1}};
get({4, 441}) ->
    #endless_data{type = 4, id = 441,
		  name = lang:get(<<"第441波"/utf8>>), lev = 433,
		  unit_ids = [64114], is_reset = 0, formation = {2, 1}};
get({4, 442}) ->
    #endless_data{type = 4, id = 442,
		  name = lang:get(<<"第442波"/utf8>>), lev = 434,
		  unit_ids = [64115], is_reset = 0, formation = {2, 1}};
get({4, 443}) ->
    #endless_data{type = 4, id = 443,
		  name = lang:get(<<"第443波"/utf8>>), lev = 434,
		  unit_ids = [64116], is_reset = 0, formation = {3, 1}};
get({4, 444}) ->
    #endless_data{type = 4, id = 444,
		  name = lang:get(<<"第444波"/utf8>>), lev = 435,
		  unit_ids = [64117], is_reset = 0, formation = {3, 1}};
get({4, 445}) ->
    #endless_data{type = 4, id = 445,
		  name = lang:get(<<"第445波"/utf8>>), lev = 436,
		  unit_ids = [64118], is_reset = 0, formation = {4, 1}};
get({4, 446}) ->
    #endless_data{type = 4, id = 446,
		  name = lang:get(<<"第446波"/utf8>>), lev = 436,
		  unit_ids = [64119], is_reset = 0, formation = {4, 1}};
get({4, 447}) ->
    #endless_data{type = 4, id = 447,
		  name = lang:get(<<"第447波"/utf8>>), lev = 437,
		  unit_ids = [64120], is_reset = 0, formation = {5, 1}};
get({4, 448}) ->
    #endless_data{type = 4, id = 448,
		  name = lang:get(<<"第448波"/utf8>>), lev = 438,
		  unit_ids = [64121], is_reset = 0, formation = {5, 1}};
get({4, 449}) ->
    #endless_data{type = 4, id = 449,
		  name = lang:get(<<"第449波"/utf8>>), lev = 438,
		  unit_ids = [64122], is_reset = 0, formation = {6, 1}};
get({4, 450}) ->
    #endless_data{type = 4, id = 450,
		  name = lang:get(<<"第450波"/utf8>>), lev = 439,
		  unit_ids = [64123], is_reset = 0, formation = {6, 1}};
get({4, 451}) ->
    #endless_data{type = 4, id = 451,
		  name = lang:get(<<"第451波"/utf8>>), lev = 440,
		  unit_ids = [64109], is_reset = 0, formation = {1, 1}};
get({4, 452}) ->
    #endless_data{type = 4, id = 452,
		  name = lang:get(<<"第452波"/utf8>>), lev = 440,
		  unit_ids = [64110], is_reset = 0, formation = {1, 1}};
get({4, 453}) ->
    #endless_data{type = 4, id = 453,
		  name = lang:get(<<"第453波"/utf8>>), lev = 441,
		  unit_ids = [64111], is_reset = 0, formation = {2, 1}};
get({4, 454}) ->
    #endless_data{type = 4, id = 454,
		  name = lang:get(<<"第454波"/utf8>>), lev = 442,
		  unit_ids = [64112], is_reset = 0, formation = {2, 1}};
get({4, 455}) ->
    #endless_data{type = 4, id = 455,
		  name = lang:get(<<"第455波"/utf8>>), lev = 442,
		  unit_ids = [64113], is_reset = 0, formation = {3, 1}};
get({4, 456}) ->
    #endless_data{type = 4, id = 456,
		  name = lang:get(<<"第456波"/utf8>>), lev = 443,
		  unit_ids = [64114], is_reset = 0, formation = {3, 1}};
get({4, 457}) ->
    #endless_data{type = 4, id = 457,
		  name = lang:get(<<"第457波"/utf8>>), lev = 444,
		  unit_ids = [64115], is_reset = 0, formation = {4, 1}};
get({4, 458}) ->
    #endless_data{type = 4, id = 458,
		  name = lang:get(<<"第458波"/utf8>>), lev = 444,
		  unit_ids = [64116], is_reset = 0, formation = {4, 1}};
get({4, 459}) ->
    #endless_data{type = 4, id = 459,
		  name = lang:get(<<"第459波"/utf8>>), lev = 445,
		  unit_ids = [64117], is_reset = 0, formation = {5, 1}};
get({4, 460}) ->
    #endless_data{type = 4, id = 460,
		  name = lang:get(<<"第460波"/utf8>>), lev = 446,
		  unit_ids = [64118], is_reset = 0, formation = {5, 1}};
get({4, 461}) ->
    #endless_data{type = 4, id = 461,
		  name = lang:get(<<"第461波"/utf8>>), lev = 446,
		  unit_ids = [64119], is_reset = 0, formation = {6, 1}};
get({4, 462}) ->
    #endless_data{type = 4, id = 462,
		  name = lang:get(<<"第462波"/utf8>>), lev = 447,
		  unit_ids = [64120], is_reset = 0, formation = {6, 1}};
get({4, 463}) ->
    #endless_data{type = 4, id = 463,
		  name = lang:get(<<"第463波"/utf8>>), lev = 448,
		  unit_ids = [64121], is_reset = 0, formation = {1, 1}};
get({4, 464}) ->
    #endless_data{type = 4, id = 464,
		  name = lang:get(<<"第464波"/utf8>>), lev = 448,
		  unit_ids = [64122], is_reset = 0, formation = {1, 1}};
get({4, 465}) ->
    #endless_data{type = 4, id = 465,
		  name = lang:get(<<"第465波"/utf8>>), lev = 449,
		  unit_ids = [64123], is_reset = 0, formation = {2, 1}};
get({4, 466}) ->
    #endless_data{type = 4, id = 466,
		  name = lang:get(<<"第466波"/utf8>>), lev = 450,
		  unit_ids = [64109], is_reset = 0, formation = {2, 1}};
get({4, 467}) ->
    #endless_data{type = 4, id = 467,
		  name = lang:get(<<"第467波"/utf8>>), lev = 450,
		  unit_ids = [64110], is_reset = 0, formation = {3, 1}};
get({4, 468}) ->
    #endless_data{type = 4, id = 468,
		  name = lang:get(<<"第468波"/utf8>>), lev = 451,
		  unit_ids = [64111], is_reset = 0, formation = {3, 1}};
get({4, 469}) ->
    #endless_data{type = 4, id = 469,
		  name = lang:get(<<"第469波"/utf8>>), lev = 452,
		  unit_ids = [64112], is_reset = 0, formation = {4, 1}};
get({4, 470}) ->
    #endless_data{type = 4, id = 470,
		  name = lang:get(<<"第470波"/utf8>>), lev = 452,
		  unit_ids = [64113], is_reset = 0, formation = {4, 1}};
get({4, 471}) ->
    #endless_data{type = 4, id = 471,
		  name = lang:get(<<"第471波"/utf8>>), lev = 453,
		  unit_ids = [64114], is_reset = 0, formation = {5, 1}};
get({4, 472}) ->
    #endless_data{type = 4, id = 472,
		  name = lang:get(<<"第472波"/utf8>>), lev = 454,
		  unit_ids = [64115], is_reset = 0, formation = {5, 1}};
get({4, 473}) ->
    #endless_data{type = 4, id = 473,
		  name = lang:get(<<"第473波"/utf8>>), lev = 454,
		  unit_ids = [64116], is_reset = 0, formation = {6, 1}};
get({4, 474}) ->
    #endless_data{type = 4, id = 474,
		  name = lang:get(<<"第474波"/utf8>>), lev = 455,
		  unit_ids = [64117], is_reset = 0, formation = {6, 1}};
get({4, 475}) ->
    #endless_data{type = 4, id = 475,
		  name = lang:get(<<"第475波"/utf8>>), lev = 456,
		  unit_ids = [64118], is_reset = 0, formation = {1, 1}};
get({4, 476}) ->
    #endless_data{type = 4, id = 476,
		  name = lang:get(<<"第476波"/utf8>>), lev = 456,
		  unit_ids = [64119], is_reset = 0, formation = {1, 1}};
get({4, 477}) ->
    #endless_data{type = 4, id = 477,
		  name = lang:get(<<"第477波"/utf8>>), lev = 457,
		  unit_ids = [64120], is_reset = 0, formation = {2, 1}};
get({4, 478}) ->
    #endless_data{type = 4, id = 478,
		  name = lang:get(<<"第478波"/utf8>>), lev = 458,
		  unit_ids = [64121], is_reset = 0, formation = {2, 1}};
get({4, 479}) ->
    #endless_data{type = 4, id = 479,
		  name = lang:get(<<"第479波"/utf8>>), lev = 458,
		  unit_ids = [64122], is_reset = 0, formation = {3, 1}};
get({4, 480}) ->
    #endless_data{type = 4, id = 480,
		  name = lang:get(<<"第480波"/utf8>>), lev = 459,
		  unit_ids = [64123], is_reset = 0, formation = {3, 1}};
get({4, 481}) ->
    #endless_data{type = 4, id = 481,
		  name = lang:get(<<"第481波"/utf8>>), lev = 460,
		  unit_ids = [64109], is_reset = 0, formation = {4, 1}};
get({4, 482}) ->
    #endless_data{type = 4, id = 482,
		  name = lang:get(<<"第482波"/utf8>>), lev = 460,
		  unit_ids = [64110], is_reset = 0, formation = {4, 1}};
get({4, 483}) ->
    #endless_data{type = 4, id = 483,
		  name = lang:get(<<"第483波"/utf8>>), lev = 461,
		  unit_ids = [64111], is_reset = 0, formation = {5, 1}};
get({4, 484}) ->
    #endless_data{type = 4, id = 484,
		  name = lang:get(<<"第484波"/utf8>>), lev = 462,
		  unit_ids = [64112], is_reset = 0, formation = {5, 1}};
get({4, 485}) ->
    #endless_data{type = 4, id = 485,
		  name = lang:get(<<"第485波"/utf8>>), lev = 462,
		  unit_ids = [64113], is_reset = 0, formation = {6, 1}};
get({4, 486}) ->
    #endless_data{type = 4, id = 486,
		  name = lang:get(<<"第486波"/utf8>>), lev = 463,
		  unit_ids = [64114], is_reset = 0, formation = {6, 1}};
get({4, 487}) ->
    #endless_data{type = 4, id = 487,
		  name = lang:get(<<"第487波"/utf8>>), lev = 464,
		  unit_ids = [64115], is_reset = 0, formation = {1, 1}};
get({4, 488}) ->
    #endless_data{type = 4, id = 488,
		  name = lang:get(<<"第488波"/utf8>>), lev = 464,
		  unit_ids = [64116], is_reset = 0, formation = {1, 1}};
get({4, 489}) ->
    #endless_data{type = 4, id = 489,
		  name = lang:get(<<"第489波"/utf8>>), lev = 465,
		  unit_ids = [64117], is_reset = 0, formation = {2, 1}};
get({4, 490}) ->
    #endless_data{type = 4, id = 490,
		  name = lang:get(<<"第490波"/utf8>>), lev = 466,
		  unit_ids = [64118], is_reset = 0, formation = {2, 1}};
get({4, 491}) ->
    #endless_data{type = 4, id = 491,
		  name = lang:get(<<"第491波"/utf8>>), lev = 466,
		  unit_ids = [64119], is_reset = 0, formation = {3, 1}};
get({4, 492}) ->
    #endless_data{type = 4, id = 492,
		  name = lang:get(<<"第492波"/utf8>>), lev = 467,
		  unit_ids = [64120], is_reset = 0, formation = {3, 1}};
get({4, 493}) ->
    #endless_data{type = 4, id = 493,
		  name = lang:get(<<"第493波"/utf8>>), lev = 468,
		  unit_ids = [64121], is_reset = 0, formation = {4, 1}};
get({4, 494}) ->
    #endless_data{type = 4, id = 494,
		  name = lang:get(<<"第494波"/utf8>>), lev = 468,
		  unit_ids = [64122], is_reset = 0, formation = {4, 1}};
get({4, 495}) ->
    #endless_data{type = 4, id = 495,
		  name = lang:get(<<"第495波"/utf8>>), lev = 469,
		  unit_ids = [64123], is_reset = 0, formation = {5, 1}};
get({4, 496}) ->
    #endless_data{type = 4, id = 496,
		  name = lang:get(<<"第496波"/utf8>>), lev = 470,
		  unit_ids = [64109], is_reset = 0, formation = {5, 1}};
get({4, 497}) ->
    #endless_data{type = 4, id = 497,
		  name = lang:get(<<"第497波"/utf8>>), lev = 470,
		  unit_ids = [64110], is_reset = 0, formation = {6, 1}};
get({4, 498}) ->
    #endless_data{type = 4, id = 498,
		  name = lang:get(<<"第498波"/utf8>>), lev = 471,
		  unit_ids = [64111], is_reset = 0, formation = {6, 1}};
get({4, 499}) ->
    #endless_data{type = 4, id = 499,
		  name = lang:get(<<"第499波"/utf8>>), lev = 472,
		  unit_ids = [64112], is_reset = 0, formation = {1, 1}};
get({4, 500}) ->
    #endless_data{type = 4, id = 500,
		  name = lang:get(<<"第500波"/utf8>>), lev = 472,
		  unit_ids = [64113], is_reset = 0, formation = {1, 1}};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      endless_data, 29045),
    undefined.

list_ext_reward() ->
    [{100, 4}, {99, 4}, {98, 4}, {97, 4}, {96, 4}, {95, 4},
     {94, 4}, {93, 4}, {92, 4}, {91, 4}, {90, 4}, {89, 4},
     {88, 4}, {87, 4}, {86, 4}, {85, 4}, {84, 4}, {83, 4},
     {82, 4}, {81, 4}, {80, 4}, {79, 4}, {78, 4}, {77, 4},
     {76, 4}, {75, 4}, {74, 4}, {73, 4}, {72, 4}, {71, 4},
     {70, 4}, {69, 4}, {68, 4}, {67, 4}, {66, 4}, {65, 4},
     {64, 4}, {63, 4}, {62, 4}, {61, 4}, {60, 4}, {59, 4},
     {58, 4}, {57, 4}, {56, 4}, {55, 4}, {54, 4}, {53, 4},
     {52, 4}, {51, 4}, {50, 4}, {49, 4}, {48, 4}, {47, 4},
     {46, 4}, {45, 4}, {44, 4}, {43, 4}, {42, 4}, {41, 4},
     {40, 4}, {39, 4}, {38, 4}, {37, 4}, {36, 4}, {35, 4},
     {34, 4}, {33, 4}, {32, 4}, {31, 4}, {30, 4}, {29, 4},
     {28, 4}, {27, 4}, {26, 4}, {25, 4}, {24, 4}, {23, 4},
     {22, 4}, {21, 4}, {20, 4}, {19, 4}, {18, 4}, {17, 4},
     {16, 4}, {15, 4}, {14, 4}, {13, 4}, {12, 4}, {11, 4},
     {10, 4}, {9, 4}, {8, 4}, {7, 4}, {6, 4}, {5, 4}, {4, 4},
     {3, 4}, {2, 4}, {1, 4}, {100, 3}, {99, 3}, {98, 3},
     {97, 3}, {96, 3}, {95, 3}, {94, 3}, {93, 3}, {92, 3},
     {91, 3}, {90, 3}, {89, 3}, {88, 3}, {87, 3}, {86, 3},
     {85, 3}, {84, 3}, {83, 3}, {82, 3}, {81, 3}, {80, 3},
     {79, 3}, {78, 3}, {77, 3}, {76, 3}, {75, 3}, {74, 3},
     {73, 3}, {72, 3}, {71, 3}, {70, 3}, {69, 3}, {68, 3},
     {67, 3}, {66, 3}, {65, 3}, {64, 3}, {63, 3}, {62, 3},
     {61, 3}, {60, 3}, {59, 3}, {58, 3}, {57, 3}, {56, 3},
     {55, 3}, {54, 3}, {53, 3}, {52, 3}, {51, 3}, {50, 3},
     {49, 3}, {48, 3}, {47, 3}, {46, 3}, {45, 3}, {44, 3},
     {43, 3}, {42, 3}, {41, 3}, {40, 3}, {39, 3}, {38, 3},
     {37, 3}, {36, 3}, {35, 3}, {34, 3}, {33, 3}, {32, 3},
     {31, 3}, {30, 3}, {29, 3}, {28, 3}, {27, 3}, {26, 3},
     {25, 3}, {24, 3}, {23, 3}, {22, 3}, {21, 3}, {20, 3},
     {19, 3}, {18, 3}, {17, 3}, {16, 3}, {15, 3}, {14, 3},
     {13, 3}, {12, 3}, {11, 3}, {10, 3}, {9, 3}, {8, 3},
     {7, 3}, {6, 3}, {5, 3}, {4, 3}, {3, 3}, {2, 3}, {1, 3},
     {100, 2}, {99, 2}, {98, 2}, {97, 2}, {96, 2}, {95, 2},
     {94, 2}, {93, 2}, {92, 2}, {91, 2}, {90, 2}, {89, 2},
     {88, 2}, {87, 2}, {86, 2}, {85, 2}, {84, 2}, {83, 2},
     {82, 2}, {81, 2}, {80, 2}, {79, 2}, {78, 2}, {77, 2},
     {76, 2}, {75, 2}, {74, 2}, {73, 2}, {72, 2}, {71, 2},
     {70, 2}, {69, 2}, {68, 2}, {67, 2}, {66, 2}, {65, 2},
     {64, 2}, {63, 2}, {62, 2}, {61, 2}, {60, 2}, {59, 2},
     {58, 2}, {57, 2}, {56, 2}, {55, 2}, {54, 2}, {53, 2},
     {52, 2}, {51, 2}, {50, 2}, {49, 2}, {48, 2}, {47, 2},
     {46, 2}, {45, 2}, {44, 2}, {43, 2}, {42, 2}, {41, 2},
     {40, 2}, {39, 2}, {38, 2}, {37, 2}, {36, 2}, {35, 2},
     {34, 2}, {33, 2}, {32, 2}, {31, 2}, {30, 2}, {29, 2},
     {28, 2}, {27, 2}, {26, 2}, {25, 2}, {24, 2}, {23, 2},
     {22, 2}, {21, 2}, {20, 2}, {19, 2}, {18, 2}, {17, 2},
     {16, 2}, {15, 2}, {14, 2}, {13, 2}, {12, 2}, {11, 2},
     {10, 2}, {9, 2}, {8, 2}, {7, 2}, {6, 2}, {5, 2}, {4, 2},
     {3, 2}, {2, 2}, {1, 2}, {100, 1}, {99, 1}, {98, 1},
     {97, 1}, {96, 1}, {95, 1}, {94, 1}, {93, 1}, {92, 1},
     {91, 1}, {90, 1}, {89, 1}, {88, 1}, {87, 1}, {86, 1},
     {85, 1}, {84, 1}, {83, 1}, {82, 1}, {81, 1}, {80, 1},
     {79, 1}, {78, 1}, {77, 1}, {76, 1}, {75, 1}, {74, 1},
     {73, 1}, {72, 1}, {71, 1}, {70, 1}, {69, 1}, {68, 1},
     {67, 1}, {66, 1}, {65, 1}, {64, 1}, {63, 1}, {62, 1},
     {61, 1}, {60, 1}, {59, 1}, {58, 1}, {57, 1}, {56, 1},
     {55, 1}, {54, 1}, {53, 1}, {52, 1}, {51, 1}, {50, 1},
     {49, 1}, {48, 1}, {47, 1}, {46, 1}, {45, 1}, {44, 1},
     {43, 1}, {42, 1}, {41, 1}, {40, 1}, {39, 1}, {38, 1},
     {37, 1}, {36, 1}, {35, 1}, {34, 1}, {33, 1}, {32, 1},
     {31, 1}, {30, 1}, {29, 1}, {28, 1}, {27, 1}, {26, 1},
     {25, 1}, {24, 1}, {23, 1}, {22, 1}, {21, 1}, {20, 1},
     {19, 1}, {18, 1}, {17, 1}, {16, 1}, {15, 1}, {14, 1},
     {13, 1}, {12, 1}, {11, 1}, {10, 1}, {9, 1}, {8, 1},
     {7, 1}, {6, 1}, {5, 1}, {4, 1}, {3, 1}, {2, 1}, {1, 1},
     {180, 5}, {179, 5}, {178, 5}, {177, 5}, {176, 5},
     {175, 5}, {174, 5}, {173, 5}, {172, 5}, {171, 5},
     {170, 5}, {169, 5}, {168, 5}, {167, 5}, {166, 5},
     {165, 5}, {164, 5}, {163, 5}, {162, 5}, {161, 5},
     {160, 5}, {159, 5}, {158, 5}, {157, 5}, {156, 5},
     {155, 5}, {154, 5}, {153, 5}, {152, 5}, {151, 5},
     {150, 5}, {149, 5}, {148, 5}, {147, 5}, {146, 5},
     {145, 5}, {144, 5}, {143, 5}, {142, 5}, {141, 5},
     {140, 5}, {139, 5}, {138, 5}, {137, 5}, {136, 5},
     {135, 5}, {134, 5}, {133, 5}, {132, 5}, {131, 5},
     {130, 5}, {129, 5}, {128, 5}, {127, 5}, {126, 5},
     {125, 5}, {124, 5}, {123, 5}, {122, 5}, {121, 5},
     {120, 5}, {119, 5}, {118, 5}, {117, 5}, {116, 5},
     {115, 5}, {114, 5}, {113, 5}, {112, 5}, {111, 5},
     {110, 5}, {109, 5}, {108, 5}, {107, 5}, {106, 5},
     {105, 5}, {104, 5}, {103, 5}, {102, 5}, {101, 5},
     {100, 5}, {99, 5}, {98, 5}, {97, 5}, {96, 5}, {95, 5},
     {94, 5}, {93, 5}, {92, 5}, {91, 5}, {90, 5}, {89, 5},
     {88, 5}, {87, 5}, {86, 5}, {85, 5}, {84, 5}, {83, 5},
     {82, 5}, {81, 5}, {80, 5}, {79, 5}, {78, 5}, {77, 5},
     {76, 5}, {75, 5}, {74, 5}, {73, 5}, {72, 5}, {71, 5},
     {70, 5}, {69, 5}, {68, 5}, {67, 5}, {66, 5}, {65, 5},
     {64, 5}, {63, 5}, {62, 5}, {61, 5}, {60, 5}, {59, 5},
     {58, 5}, {57, 5}, {56, 5}, {55, 5}, {54, 5}, {53, 5},
     {52, 5}, {51, 5}, {50, 5}, {49, 5}, {48, 5}, {47, 5},
     {46, 5}, {45, 5}, {44, 5}, {43, 5}, {42, 5}, {41, 5},
     {40, 5}, {39, 5}, {38, 5}, {37, 5}, {36, 5}, {35, 5},
     {34, 5}, {33, 5}, {32, 5}, {31, 5}, {30, 5}, {29, 5},
     {28, 5}, {27, 5}, {26, 5}, {25, 5}, {24, 5}, {23, 5},
     {22, 5}, {21, 5}, {20, 5}, {19, 5}, {18, 5}, {17, 5},
     {16, 5}, {15, 5}, {14, 5}, {13, 5}, {12, 5}, {11, 5},
     {10, 5}, {9, 5}, {8, 5}, {7, 5}, {6, 5}, {5, 5}, {4, 5},
     {3, 5}, {2, 5}, {1, 5}].

ext_reward({1, 5}) ->
    #{id => 1, type => 5, limit_id => 5,
      items => [{22, 30000}]};
ext_reward({2, 5}) ->
    #{id => 2, type => 5, limit_id => 10,
      items => [{22, 50000}]};
ext_reward({3, 5}) ->
    #{id => 3, type => 5, limit_id => 15,
      items => [{10403, 1}]};
ext_reward({4, 5}) ->
    #{id => 4, type => 5, limit_id => 20,
      items => [{22, 70000}]};
ext_reward({5, 5}) ->
    #{id => 5, type => 5, limit_id => 25,
      items => [{22, 90000}]};
ext_reward({6, 5}) ->
    #{id => 6, type => 5, limit_id => 30,
      items => [{10403, 1}]};
ext_reward({7, 5}) ->
    #{id => 7, type => 5, limit_id => 35,
      items => [{22, 110000}]};
ext_reward({8, 5}) ->
    #{id => 8, type => 5, limit_id => 40,
      items => [{22, 130000}]};
ext_reward({9, 5}) ->
    #{id => 9, type => 5, limit_id => 45,
      items => [{10403, 1}]};
ext_reward({10, 5}) ->
    #{id => 10, type => 5, limit_id => 50,
      items => [{22, 150000}]};
ext_reward({11, 5}) ->
    #{id => 11, type => 5, limit_id => 55,
      items => [{22, 170000}]};
ext_reward({12, 5}) ->
    #{id => 12, type => 5, limit_id => 60,
      items => [{10403, 1}]};
ext_reward({13, 5}) ->
    #{id => 13, type => 5, limit_id => 65,
      items => [{22, 190000}]};
ext_reward({14, 5}) ->
    #{id => 14, type => 5, limit_id => 70,
      items => [{22, 210000}]};
ext_reward({15, 5}) ->
    #{id => 15, type => 5, limit_id => 75,
      items => [{10403, 1}]};
ext_reward({16, 5}) ->
    #{id => 16, type => 5, limit_id => 80,
      items => [{22, 230000}]};
ext_reward({17, 5}) ->
    #{id => 17, type => 5, limit_id => 85,
      items => [{22, 250000}]};
ext_reward({18, 5}) ->
    #{id => 18, type => 5, limit_id => 90,
      items => [{10403, 1}]};
ext_reward({19, 5}) ->
    #{id => 19, type => 5, limit_id => 95,
      items => [{22, 270000}]};
ext_reward({20, 5}) ->
    #{id => 20, type => 5, limit_id => 100,
      items => [{22, 290000}]};
ext_reward({21, 5}) ->
    #{id => 21, type => 5, limit_id => 105,
      items => [{10403, 1}]};
ext_reward({22, 5}) ->
    #{id => 22, type => 5, limit_id => 110,
      items => [{22, 310000}]};
ext_reward({23, 5}) ->
    #{id => 23, type => 5, limit_id => 115,
      items => [{22, 330000}]};
ext_reward({24, 5}) ->
    #{id => 24, type => 5, limit_id => 120,
      items => [{10403, 1}]};
ext_reward({25, 5}) ->
    #{id => 25, type => 5, limit_id => 125,
      items => [{22, 350000}]};
ext_reward({26, 5}) ->
    #{id => 26, type => 5, limit_id => 130,
      items => [{22, 370000}]};
ext_reward({27, 5}) ->
    #{id => 27, type => 5, limit_id => 135,
      items => [{10403, 1}]};
ext_reward({28, 5}) ->
    #{id => 28, type => 5, limit_id => 140,
      items => [{22, 390000}]};
ext_reward({29, 5}) ->
    #{id => 29, type => 5, limit_id => 145,
      items => [{22, 410000}]};
ext_reward({30, 5}) ->
    #{id => 30, type => 5, limit_id => 150,
      items => [{10403, 1}]};
ext_reward({31, 5}) ->
    #{id => 31, type => 5, limit_id => 155,
      items => [{22, 430000}]};
ext_reward({32, 5}) ->
    #{id => 32, type => 5, limit_id => 160,
      items => [{22, 450000}]};
ext_reward({33, 5}) ->
    #{id => 33, type => 5, limit_id => 165,
      items => [{10403, 1}]};
ext_reward({34, 5}) ->
    #{id => 34, type => 5, limit_id => 170,
      items => [{22, 470000}]};
ext_reward({35, 5}) ->
    #{id => 35, type => 5, limit_id => 175,
      items => [{22, 490000}]};
ext_reward({36, 5}) ->
    #{id => 36, type => 5, limit_id => 180,
      items => [{10403, 1}]};
ext_reward({37, 5}) ->
    #{id => 37, type => 5, limit_id => 185,
      items => [{22, 510000}]};
ext_reward({38, 5}) ->
    #{id => 38, type => 5, limit_id => 190,
      items => [{22, 530000}]};
ext_reward({39, 5}) ->
    #{id => 39, type => 5, limit_id => 195,
      items => [{10403, 1}]};
ext_reward({40, 5}) ->
    #{id => 40, type => 5, limit_id => 200,
      items => [{22, 550000}]};
ext_reward({41, 5}) ->
    #{id => 41, type => 5, limit_id => 205,
      items => [{22, 570000}]};
ext_reward({42, 5}) ->
    #{id => 42, type => 5, limit_id => 210,
      items => [{10403, 1}]};
ext_reward({43, 5}) ->
    #{id => 43, type => 5, limit_id => 215,
      items => [{22, 590000}]};
ext_reward({44, 5}) ->
    #{id => 44, type => 5, limit_id => 220,
      items => [{22, 610000}]};
ext_reward({45, 5}) ->
    #{id => 45, type => 5, limit_id => 225,
      items => [{10403, 1}]};
ext_reward({46, 5}) ->
    #{id => 46, type => 5, limit_id => 230,
      items => [{22, 630000}]};
ext_reward({47, 5}) ->
    #{id => 47, type => 5, limit_id => 235,
      items => [{22, 650000}]};
ext_reward({48, 5}) ->
    #{id => 48, type => 5, limit_id => 240,
      items => [{10403, 1}]};
ext_reward({49, 5}) ->
    #{id => 49, type => 5, limit_id => 245,
      items => [{22, 670000}]};
ext_reward({50, 5}) ->
    #{id => 50, type => 5, limit_id => 250,
      items => [{22, 690000}]};
ext_reward({51, 5}) ->
    #{id => 51, type => 5, limit_id => 255,
      items => [{10403, 1}]};
ext_reward({52, 5}) ->
    #{id => 52, type => 5, limit_id => 260,
      items => [{22, 690000}]};
ext_reward({53, 5}) ->
    #{id => 53, type => 5, limit_id => 265,
      items => [{22, 710000}]};
ext_reward({54, 5}) ->
    #{id => 54, type => 5, limit_id => 270,
      items => [{10403, 1}]};
ext_reward({55, 5}) ->
    #{id => 55, type => 5, limit_id => 275,
      items => [{22, 710000}]};
ext_reward({56, 5}) ->
    #{id => 56, type => 5, limit_id => 280,
      items => [{22, 730000}]};
ext_reward({57, 5}) ->
    #{id => 57, type => 5, limit_id => 285,
      items => [{10403, 1}]};
ext_reward({58, 5}) ->
    #{id => 58, type => 5, limit_id => 290,
      items => [{22, 730000}]};
ext_reward({59, 5}) ->
    #{id => 59, type => 5, limit_id => 295,
      items => [{22, 750000}]};
ext_reward({60, 5}) ->
    #{id => 60, type => 5, limit_id => 300,
      items => [{10403, 1}]};
ext_reward({61, 5}) ->
    #{id => 61, type => 5, limit_id => 305,
      items => [{22, 750000}]};
ext_reward({62, 5}) ->
    #{id => 62, type => 5, limit_id => 310,
      items => [{22, 770000}]};
ext_reward({63, 5}) ->
    #{id => 63, type => 5, limit_id => 315,
      items => [{10403, 1}]};
ext_reward({64, 5}) ->
    #{id => 64, type => 5, limit_id => 320,
      items => [{22, 770000}]};
ext_reward({65, 5}) ->
    #{id => 65, type => 5, limit_id => 325,
      items => [{22, 790000}]};
ext_reward({66, 5}) ->
    #{id => 66, type => 5, limit_id => 330,
      items => [{10403, 1}]};
ext_reward({67, 5}) ->
    #{id => 67, type => 5, limit_id => 335,
      items => [{22, 790000}]};
ext_reward({68, 5}) ->
    #{id => 68, type => 5, limit_id => 340,
      items => [{22, 810000}]};
ext_reward({69, 5}) ->
    #{id => 69, type => 5, limit_id => 345,
      items => [{10403, 1}]};
ext_reward({70, 5}) ->
    #{id => 70, type => 5, limit_id => 350,
      items => [{22, 810000}]};
ext_reward({71, 5}) ->
    #{id => 71, type => 5, limit_id => 355,
      items => [{22, 830000}]};
ext_reward({72, 5}) ->
    #{id => 72, type => 5, limit_id => 360,
      items => [{10403, 1}]};
ext_reward({73, 5}) ->
    #{id => 73, type => 5, limit_id => 365,
      items => [{22, 830000}]};
ext_reward({74, 5}) ->
    #{id => 74, type => 5, limit_id => 370,
      items => [{22, 850000}]};
ext_reward({75, 5}) ->
    #{id => 75, type => 5, limit_id => 375,
      items => [{10403, 1}]};
ext_reward({76, 5}) ->
    #{id => 76, type => 5, limit_id => 380,
      items => [{22, 850000}]};
ext_reward({77, 5}) ->
    #{id => 77, type => 5, limit_id => 385,
      items => [{22, 870000}]};
ext_reward({78, 5}) ->
    #{id => 78, type => 5, limit_id => 390,
      items => [{10403, 1}]};
ext_reward({79, 5}) ->
    #{id => 79, type => 5, limit_id => 395,
      items => [{22, 870000}]};
ext_reward({80, 5}) ->
    #{id => 80, type => 5, limit_id => 400,
      items => [{22, 890000}]};
ext_reward({81, 5}) ->
    #{id => 81, type => 5, limit_id => 405,
      items => [{10403, 1}]};
ext_reward({82, 5}) ->
    #{id => 82, type => 5, limit_id => 410,
      items => [{22, 890000}]};
ext_reward({83, 5}) ->
    #{id => 83, type => 5, limit_id => 415,
      items => [{22, 910000}]};
ext_reward({84, 5}) ->
    #{id => 84, type => 5, limit_id => 420,
      items => [{10403, 1}]};
ext_reward({85, 5}) ->
    #{id => 85, type => 5, limit_id => 425,
      items => [{22, 910000}]};
ext_reward({86, 5}) ->
    #{id => 86, type => 5, limit_id => 430,
      items => [{22, 930000}]};
ext_reward({87, 5}) ->
    #{id => 87, type => 5, limit_id => 435,
      items => [{10403, 1}]};
ext_reward({88, 5}) ->
    #{id => 88, type => 5, limit_id => 440,
      items => [{22, 930000}]};
ext_reward({89, 5}) ->
    #{id => 89, type => 5, limit_id => 445,
      items => [{22, 950000}]};
ext_reward({90, 5}) ->
    #{id => 90, type => 5, limit_id => 450,
      items => [{10403, 1}]};
ext_reward({91, 5}) ->
    #{id => 91, type => 5, limit_id => 455,
      items => [{22, 950000}]};
ext_reward({92, 5}) ->
    #{id => 92, type => 5, limit_id => 460,
      items => [{22, 970000}]};
ext_reward({93, 5}) ->
    #{id => 93, type => 5, limit_id => 465,
      items => [{10403, 1}]};
ext_reward({94, 5}) ->
    #{id => 94, type => 5, limit_id => 470,
      items => [{22, 970000}]};
ext_reward({95, 5}) ->
    #{id => 95, type => 5, limit_id => 475,
      items => [{22, 990000}]};
ext_reward({96, 5}) ->
    #{id => 96, type => 5, limit_id => 480,
      items => [{10403, 1}]};
ext_reward({97, 5}) ->
    #{id => 97, type => 5, limit_id => 485,
      items => [{22, 990000}]};
ext_reward({98, 5}) ->
    #{id => 98, type => 5, limit_id => 490,
      items => [{22, 1010000}]};
ext_reward({99, 5}) ->
    #{id => 99, type => 5, limit_id => 495,
      items => [{10403, 1}]};
ext_reward({100, 5}) ->
    #{id => 100, type => 5, limit_id => 500,
      items => [{22, 1010000}]};
ext_reward({101, 5}) ->
    #{id => 101, type => 5, limit_id => 505,
      items => [{22, 1030000}]};
ext_reward({102, 5}) ->
    #{id => 102, type => 5, limit_id => 510,
      items => [{10403, 1}]};
ext_reward({103, 5}) ->
    #{id => 103, type => 5, limit_id => 515,
      items => [{22, 1030000}]};
ext_reward({104, 5}) ->
    #{id => 104, type => 5, limit_id => 520,
      items => [{22, 1050000}]};
ext_reward({105, 5}) ->
    #{id => 105, type => 5, limit_id => 525,
      items => [{10403, 1}]};
ext_reward({106, 5}) ->
    #{id => 106, type => 5, limit_id => 530,
      items => [{22, 1050000}]};
ext_reward({107, 5}) ->
    #{id => 107, type => 5, limit_id => 535,
      items => [{22, 1070000}]};
ext_reward({108, 5}) ->
    #{id => 108, type => 5, limit_id => 540,
      items => [{10403, 1}]};
ext_reward({109, 5}) ->
    #{id => 109, type => 5, limit_id => 545,
      items => [{22, 1070000}]};
ext_reward({110, 5}) ->
    #{id => 110, type => 5, limit_id => 550,
      items => [{22, 1090000}]};
ext_reward({111, 5}) ->
    #{id => 111, type => 5, limit_id => 555,
      items => [{10403, 1}]};
ext_reward({112, 5}) ->
    #{id => 112, type => 5, limit_id => 560,
      items => [{22, 1090000}]};
ext_reward({113, 5}) ->
    #{id => 113, type => 5, limit_id => 565,
      items => [{22, 1110000}]};
ext_reward({114, 5}) ->
    #{id => 114, type => 5, limit_id => 570,
      items => [{10403, 1}]};
ext_reward({115, 5}) ->
    #{id => 115, type => 5, limit_id => 575,
      items => [{22, 1110000}]};
ext_reward({116, 5}) ->
    #{id => 116, type => 5, limit_id => 580,
      items => [{22, 1130000}]};
ext_reward({117, 5}) ->
    #{id => 117, type => 5, limit_id => 585,
      items => [{10403, 1}]};
ext_reward({118, 5}) ->
    #{id => 118, type => 5, limit_id => 590,
      items => [{22, 1130000}]};
ext_reward({119, 5}) ->
    #{id => 119, type => 5, limit_id => 595,
      items => [{22, 1150000}]};
ext_reward({120, 5}) ->
    #{id => 120, type => 5, limit_id => 600,
      items => [{10403, 1}]};
ext_reward({121, 5}) ->
    #{id => 121, type => 5, limit_id => 605,
      items => [{10403, 1}]};
ext_reward({122, 5}) ->
    #{id => 122, type => 5, limit_id => 610,
      items => [{22, 870000}]};
ext_reward({123, 5}) ->
    #{id => 123, type => 5, limit_id => 615,
      items => [{22, 890000}]};
ext_reward({124, 5}) ->
    #{id => 124, type => 5, limit_id => 620,
      items => [{22, 1170000}]};
ext_reward({125, 5}) ->
    #{id => 125, type => 5, limit_id => 625,
      items => [{22, 1190000}]};
ext_reward({126, 5}) ->
    #{id => 126, type => 5, limit_id => 630,
      items => [{10403, 1}]};
ext_reward({127, 5}) ->
    #{id => 127, type => 5, limit_id => 635,
      items => [{22, 1190000}]};
ext_reward({128, 5}) ->
    #{id => 128, type => 5, limit_id => 640,
      items => [{22, 1210000}]};
ext_reward({129, 5}) ->
    #{id => 129, type => 5, limit_id => 645,
      items => [{10403, 1}]};
ext_reward({130, 5}) ->
    #{id => 130, type => 5, limit_id => 650,
      items => [{22, 1210000}]};
ext_reward({131, 5}) ->
    #{id => 131, type => 5, limit_id => 655,
      items => [{22, 1230000}]};
ext_reward({132, 5}) ->
    #{id => 132, type => 5, limit_id => 660,
      items => [{10403, 1}]};
ext_reward({133, 5}) ->
    #{id => 133, type => 5, limit_id => 665,
      items => [{22, 1230000}]};
ext_reward({134, 5}) ->
    #{id => 134, type => 5, limit_id => 670,
      items => [{22, 1250000}]};
ext_reward({135, 5}) ->
    #{id => 135, type => 5, limit_id => 675,
      items => [{10403, 1}]};
ext_reward({136, 5}) ->
    #{id => 136, type => 5, limit_id => 680,
      items => [{22, 1250000}]};
ext_reward({137, 5}) ->
    #{id => 137, type => 5, limit_id => 685,
      items => [{22, 1270000}]};
ext_reward({138, 5}) ->
    #{id => 138, type => 5, limit_id => 690,
      items => [{10403, 1}]};
ext_reward({139, 5}) ->
    #{id => 139, type => 5, limit_id => 695,
      items => [{22, 1270000}]};
ext_reward({140, 5}) ->
    #{id => 140, type => 5, limit_id => 700,
      items => [{22, 1290000}]};
ext_reward({141, 5}) ->
    #{id => 141, type => 5, limit_id => 705,
      items => [{10403, 1}]};
ext_reward({142, 5}) ->
    #{id => 142, type => 5, limit_id => 710,
      items => [{22, 1290000}]};
ext_reward({143, 5}) ->
    #{id => 143, type => 5, limit_id => 715,
      items => [{22, 1310000}]};
ext_reward({144, 5}) ->
    #{id => 144, type => 5, limit_id => 720,
      items => [{10403, 1}]};
ext_reward({145, 5}) ->
    #{id => 145, type => 5, limit_id => 725,
      items => [{22, 1310000}]};
ext_reward({146, 5}) ->
    #{id => 146, type => 5, limit_id => 730,
      items => [{22, 1330000}]};
ext_reward({147, 5}) ->
    #{id => 147, type => 5, limit_id => 735,
      items => [{10403, 1}]};
ext_reward({148, 5}) ->
    #{id => 148, type => 5, limit_id => 740,
      items => [{22, 1330000}]};
ext_reward({149, 5}) ->
    #{id => 149, type => 5, limit_id => 745,
      items => [{22, 1350000}]};
ext_reward({150, 5}) ->
    #{id => 150, type => 5, limit_id => 750,
      items => [{10403, 1}]};
ext_reward({151, 5}) ->
    #{id => 151, type => 5, limit_id => 755,
      items => [{22, 1350000}]};
ext_reward({152, 5}) ->
    #{id => 152, type => 5, limit_id => 760,
      items => [{22, 1370000}]};
ext_reward({153, 5}) ->
    #{id => 153, type => 5, limit_id => 765,
      items => [{10403, 1}]};
ext_reward({154, 5}) ->
    #{id => 154, type => 5, limit_id => 770,
      items => [{22, 1370000}]};
ext_reward({155, 5}) ->
    #{id => 155, type => 5, limit_id => 775,
      items => [{22, 1390000}]};
ext_reward({156, 5}) ->
    #{id => 156, type => 5, limit_id => 780,
      items => [{10403, 1}]};
ext_reward({157, 5}) ->
    #{id => 157, type => 5, limit_id => 785,
      items => [{22, 1390000}]};
ext_reward({158, 5}) ->
    #{id => 158, type => 5, limit_id => 790,
      items => [{22, 1410000}]};
ext_reward({159, 5}) ->
    #{id => 159, type => 5, limit_id => 795,
      items => [{10403, 1}]};
ext_reward({160, 5}) ->
    #{id => 160, type => 5, limit_id => 800,
      items => [{22, 1410000}]};
ext_reward({161, 5}) ->
    #{id => 161, type => 5, limit_id => 805,
      items => [{22, 1430000}]};
ext_reward({162, 5}) ->
    #{id => 162, type => 5, limit_id => 810,
      items => [{10403, 1}]};
ext_reward({163, 5}) ->
    #{id => 163, type => 5, limit_id => 815,
      items => [{22, 1430000}]};
ext_reward({164, 5}) ->
    #{id => 164, type => 5, limit_id => 820,
      items => [{22, 1450000}]};
ext_reward({165, 5}) ->
    #{id => 165, type => 5, limit_id => 825,
      items => [{10403, 1}]};
ext_reward({166, 5}) ->
    #{id => 166, type => 5, limit_id => 830,
      items => [{22, 1450000}]};
ext_reward({167, 5}) ->
    #{id => 167, type => 5, limit_id => 835,
      items => [{22, 1470000}]};
ext_reward({168, 5}) ->
    #{id => 168, type => 5, limit_id => 840,
      items => [{10403, 1}]};
ext_reward({169, 5}) ->
    #{id => 169, type => 5, limit_id => 845,
      items => [{22, 1470000}]};
ext_reward({170, 5}) ->
    #{id => 170, type => 5, limit_id => 850,
      items => [{22, 1490000}]};
ext_reward({171, 5}) ->
    #{id => 171, type => 5, limit_id => 855,
      items => [{10403, 1}]};
ext_reward({172, 5}) ->
    #{id => 172, type => 5, limit_id => 860,
      items => [{22, 1490000}]};
ext_reward({173, 5}) ->
    #{id => 173, type => 5, limit_id => 865,
      items => [{22, 1510000}]};
ext_reward({174, 5}) ->
    #{id => 174, type => 5, limit_id => 870,
      items => [{10403, 1}]};
ext_reward({175, 5}) ->
    #{id => 175, type => 5, limit_id => 875,
      items => [{22, 1510000}]};
ext_reward({176, 5}) ->
    #{id => 176, type => 5, limit_id => 880,
      items => [{22, 1530000}]};
ext_reward({177, 5}) ->
    #{id => 177, type => 5, limit_id => 885,
      items => [{10403, 1}]};
ext_reward({178, 5}) ->
    #{id => 178, type => 5, limit_id => 890,
      items => [{22, 1530000}]};
ext_reward({179, 5}) ->
    #{id => 179, type => 5, limit_id => 895,
      items => [{22, 1550000}]};
ext_reward({180, 5}) ->
    #{id => 180, type => 5, limit_id => 900,
      items => [{10403, 1}]};
ext_reward({1, 1}) ->
    #{id => 1, type => 1, limit_id => 5,
      items => [{10415, 1}]};
ext_reward({2, 1}) ->
    #{id => 2, type => 1, limit_id => 10,
      items => [{10001, 200}]};
ext_reward({3, 1}) ->
    #{id => 3, type => 1, limit_id => 15,
      items => [{10602, 1}]};
ext_reward({4, 1}) ->
    #{id => 4, type => 1, limit_id => 20,
      items => [{1, 1000000}]};
ext_reward({5, 1}) ->
    #{id => 5, type => 1, limit_id => 25,
      items => [{29105, 25}]};
ext_reward({6, 1}) ->
    #{id => 6, type => 1, limit_id => 30,
      items => [{10001, 250}]};
ext_reward({7, 1}) ->
    #{id => 7, type => 1, limit_id => 35,
      items => [{10415, 1}]};
ext_reward({8, 1}) ->
    #{id => 8, type => 1, limit_id => 40,
      items => [{1, 1200000}]};
ext_reward({9, 1}) ->
    #{id => 9, type => 1, limit_id => 45,
      items => [{29105, 25}]};
ext_reward({10, 1}) ->
    #{id => 10, type => 1, limit_id => 50,
      items => [{10603, 1}]};
ext_reward({11, 1}) ->
    #{id => 11, type => 1, limit_id => 55,
      items => [{10415, 1}]};
ext_reward({12, 1}) ->
    #{id => 12, type => 1, limit_id => 60,
      items => [{10001, 300}]};
ext_reward({13, 1}) ->
    #{id => 13, type => 1, limit_id => 65,
      items => [{10602, 1}]};
ext_reward({14, 1}) ->
    #{id => 14, type => 1, limit_id => 70,
      items => [{1, 1400000}]};
ext_reward({15, 1}) ->
    #{id => 15, type => 1, limit_id => 75,
      items => [{29105, 25}]};
ext_reward({16, 1}) ->
    #{id => 16, type => 1, limit_id => 80,
      items => [{10001, 350}]};
ext_reward({17, 1}) ->
    #{id => 17, type => 1, limit_id => 85,
      items => [{10415, 1}]};
ext_reward({18, 1}) ->
    #{id => 18, type => 1, limit_id => 90,
      items => [{1, 1600000}]};
ext_reward({19, 1}) ->
    #{id => 19, type => 1, limit_id => 95,
      items => [{29105, 25}]};
ext_reward({20, 1}) ->
    #{id => 20, type => 1, limit_id => 100,
      items => [{10453, 1}]};
ext_reward({21, 1}) ->
    #{id => 21, type => 1, limit_id => 105,
      items => [{10415, 1}]};
ext_reward({22, 1}) ->
    #{id => 22, type => 1, limit_id => 110,
      items => [{10001, 400}]};
ext_reward({23, 1}) ->
    #{id => 23, type => 1, limit_id => 115,
      items => [{10041, 1}]};
ext_reward({24, 1}) ->
    #{id => 24, type => 1, limit_id => 120,
      items => [{1, 1800000}]};
ext_reward({25, 1}) ->
    #{id => 25, type => 1, limit_id => 125,
      items => [{29105, 25}]};
ext_reward({26, 1}) ->
    #{id => 26, type => 1, limit_id => 130,
      items => [{10001, 450}]};
ext_reward({27, 1}) ->
    #{id => 27, type => 1, limit_id => 135,
      items => [{10415, 1}]};
ext_reward({28, 1}) ->
    #{id => 28, type => 1, limit_id => 140,
      items => [{1, 2000000}]};
ext_reward({29, 1}) ->
    #{id => 29, type => 1, limit_id => 145,
      items => [{29105, 25}]};
ext_reward({30, 1}) ->
    #{id => 30, type => 1, limit_id => 150,
      items => [{10603, 1}]};
ext_reward({31, 1}) ->
    #{id => 31, type => 1, limit_id => 155,
      items => [{10415, 1}]};
ext_reward({32, 1}) ->
    #{id => 32, type => 1, limit_id => 160,
      items => [{10001, 500}]};
ext_reward({33, 1}) ->
    #{id => 33, type => 1, limit_id => 165,
      items => [{10041, 1}]};
ext_reward({34, 1}) ->
    #{id => 34, type => 1, limit_id => 170,
      items => [{1, 2200000}]};
ext_reward({35, 1}) ->
    #{id => 35, type => 1, limit_id => 175,
      items => [{29105, 25}]};
ext_reward({36, 1}) ->
    #{id => 36, type => 1, limit_id => 180,
      items => [{10001, 550}]};
ext_reward({37, 1}) ->
    #{id => 37, type => 1, limit_id => 185,
      items => [{10415, 1}]};
ext_reward({38, 1}) ->
    #{id => 38, type => 1, limit_id => 190,
      items => [{1, 2400000}]};
ext_reward({39, 1}) ->
    #{id => 39, type => 1, limit_id => 195,
      items => [{29105, 25}]};
ext_reward({40, 1}) ->
    #{id => 40, type => 1, limit_id => 200,
      items => [{10453, 1}]};
ext_reward({41, 1}) ->
    #{id => 41, type => 1, limit_id => 205,
      items => [{17210, 1}]};
ext_reward({42, 1}) ->
    #{id => 42, type => 1, limit_id => 210,
      items => [{10001, 600}]};
ext_reward({43, 1}) ->
    #{id => 43, type => 1, limit_id => 215,
      items => [{10602, 1}]};
ext_reward({44, 1}) ->
    #{id => 44, type => 1, limit_id => 220,
      items => [{1, 2600000}]};
ext_reward({45, 1}) ->
    #{id => 45, type => 1, limit_id => 225,
      items => [{29105, 25}]};
ext_reward({46, 1}) ->
    #{id => 46, type => 1, limit_id => 230,
      items => [{10001, 650}]};
ext_reward({47, 1}) ->
    #{id => 47, type => 1, limit_id => 235,
      items => [{17210, 1}]};
ext_reward({48, 1}) ->
    #{id => 48, type => 1, limit_id => 240,
      items => [{1, 2800000}]};
ext_reward({49, 1}) ->
    #{id => 49, type => 1, limit_id => 245,
      items => [{29105, 25}]};
ext_reward({50, 1}) ->
    #{id => 50, type => 1, limit_id => 250,
      items => [{10603, 1}]};
ext_reward({51, 1}) ->
    #{id => 51, type => 1, limit_id => 255,
      items => [{17210, 1}]};
ext_reward({52, 1}) ->
    #{id => 52, type => 1, limit_id => 260,
      items => [{10001, 700}]};
ext_reward({53, 1}) ->
    #{id => 53, type => 1, limit_id => 265,
      items => [{10602, 1}]};
ext_reward({54, 1}) ->
    #{id => 54, type => 1, limit_id => 270,
      items => [{1, 3000000}]};
ext_reward({55, 1}) ->
    #{id => 55, type => 1, limit_id => 275,
      items => [{29105, 25}]};
ext_reward({56, 1}) ->
    #{id => 56, type => 1, limit_id => 280,
      items => [{10001, 750}]};
ext_reward({57, 1}) ->
    #{id => 57, type => 1, limit_id => 285,
      items => [{17210, 1}]};
ext_reward({58, 1}) ->
    #{id => 58, type => 1, limit_id => 290,
      items => [{1, 3200000}]};
ext_reward({59, 1}) ->
    #{id => 59, type => 1, limit_id => 295,
      items => [{29105, 25}]};
ext_reward({60, 1}) ->
    #{id => 60, type => 1, limit_id => 300,
      items => [{10453, 1}]};
ext_reward({61, 1}) ->
    #{id => 61, type => 1, limit_id => 305,
      items => [{17210, 1}]};
ext_reward({62, 1}) ->
    #{id => 62, type => 1, limit_id => 310,
      items => [{10001, 800}]};
ext_reward({63, 1}) ->
    #{id => 63, type => 1, limit_id => 315,
      items => [{10602, 1}]};
ext_reward({64, 1}) ->
    #{id => 64, type => 1, limit_id => 320,
      items => [{1, 3400000}]};
ext_reward({65, 1}) ->
    #{id => 65, type => 1, limit_id => 325,
      items => [{29105, 25}]};
ext_reward({66, 1}) ->
    #{id => 66, type => 1, limit_id => 330,
      items => [{10001, 850}]};
ext_reward({67, 1}) ->
    #{id => 67, type => 1, limit_id => 335,
      items => [{17210, 1}]};
ext_reward({68, 1}) ->
    #{id => 68, type => 1, limit_id => 340,
      items => [{1, 3600000}]};
ext_reward({69, 1}) ->
    #{id => 69, type => 1, limit_id => 345,
      items => [{29105, 25}]};
ext_reward({70, 1}) ->
    #{id => 70, type => 1, limit_id => 350,
      items => [{10603, 1}]};
ext_reward({71, 1}) ->
    #{id => 71, type => 1, limit_id => 355,
      items => [{17210, 1}]};
ext_reward({72, 1}) ->
    #{id => 72, type => 1, limit_id => 360,
      items => [{10001, 900}]};
ext_reward({73, 1}) ->
    #{id => 73, type => 1, limit_id => 365,
      items => [{10602, 1}]};
ext_reward({74, 1}) ->
    #{id => 74, type => 1, limit_id => 370,
      items => [{1, 3800000}]};
ext_reward({75, 1}) ->
    #{id => 75, type => 1, limit_id => 375,
      items => [{29105, 25}]};
ext_reward({76, 1}) ->
    #{id => 76, type => 1, limit_id => 380,
      items => [{10001, 950}]};
ext_reward({77, 1}) ->
    #{id => 77, type => 1, limit_id => 385,
      items => [{17211, 1}]};
ext_reward({78, 1}) ->
    #{id => 78, type => 1, limit_id => 390,
      items => [{1, 4000000}]};
ext_reward({79, 1}) ->
    #{id => 79, type => 1, limit_id => 395,
      items => [{29105, 25}]};
ext_reward({80, 1}) ->
    #{id => 80, type => 1, limit_id => 400,
      items => [{10453, 1}]};
ext_reward({81, 1}) ->
    #{id => 81, type => 1, limit_id => 405,
      items => [{17211, 1}]};
ext_reward({82, 1}) ->
    #{id => 82, type => 1, limit_id => 410,
      items => [{10001, 1000}]};
ext_reward({83, 1}) ->
    #{id => 83, type => 1, limit_id => 415,
      items => [{10602, 1}]};
ext_reward({84, 1}) ->
    #{id => 84, type => 1, limit_id => 420,
      items => [{1, 4200000}]};
ext_reward({85, 1}) ->
    #{id => 85, type => 1, limit_id => 425,
      items => [{29105, 25}]};
ext_reward({86, 1}) ->
    #{id => 86, type => 1, limit_id => 430,
      items => [{10001, 1050}]};
ext_reward({87, 1}) ->
    #{id => 87, type => 1, limit_id => 435,
      items => [{17211, 1}]};
ext_reward({88, 1}) ->
    #{id => 88, type => 1, limit_id => 440,
      items => [{1, 4400000}]};
ext_reward({89, 1}) ->
    #{id => 89, type => 1, limit_id => 445,
      items => [{29105, 25}]};
ext_reward({90, 1}) ->
    #{id => 90, type => 1, limit_id => 450,
      items => [{10603, 1}]};
ext_reward({91, 1}) ->
    #{id => 91, type => 1, limit_id => 455,
      items => [{17211, 1}]};
ext_reward({92, 1}) ->
    #{id => 92, type => 1, limit_id => 460,
      items => [{10001, 1100}]};
ext_reward({93, 1}) ->
    #{id => 93, type => 1, limit_id => 465,
      items => [{10602, 1}]};
ext_reward({94, 1}) ->
    #{id => 94, type => 1, limit_id => 470,
      items => [{1, 4600000}]};
ext_reward({95, 1}) ->
    #{id => 95, type => 1, limit_id => 475,
      items => [{29105, 25}]};
ext_reward({96, 1}) ->
    #{id => 96, type => 1, limit_id => 480,
      items => [{10001, 1150}]};
ext_reward({97, 1}) ->
    #{id => 97, type => 1, limit_id => 485,
      items => [{17211, 1}]};
ext_reward({98, 1}) ->
    #{id => 98, type => 1, limit_id => 490,
      items => [{1, 4800000}]};
ext_reward({99, 1}) ->
    #{id => 99, type => 1, limit_id => 495,
      items => [{29105, 25}]};
ext_reward({100, 1}) ->
    #{id => 100, type => 1, limit_id => 500,
      items => [{10453, 1}]};
ext_reward({1, 2}) ->
    #{id => 1, type => 2, limit_id => 5,
      items => [{10415, 1}]};
ext_reward({2, 2}) ->
    #{id => 2, type => 2, limit_id => 10,
      items => [{10001, 200}]};
ext_reward({3, 2}) ->
    #{id => 3, type => 2, limit_id => 15,
      items => [{10602, 1}]};
ext_reward({4, 2}) ->
    #{id => 4, type => 2, limit_id => 20,
      items => [{1, 1000000}]};
ext_reward({5, 2}) ->
    #{id => 5, type => 2, limit_id => 25,
      items => [{29205, 25}]};
ext_reward({6, 2}) ->
    #{id => 6, type => 2, limit_id => 30,
      items => [{10001, 250}]};
ext_reward({7, 2}) ->
    #{id => 7, type => 2, limit_id => 35,
      items => [{10415, 1}]};
ext_reward({8, 2}) ->
    #{id => 8, type => 2, limit_id => 40,
      items => [{1, 1200000}]};
ext_reward({9, 2}) ->
    #{id => 9, type => 2, limit_id => 45,
      items => [{29205, 25}]};
ext_reward({10, 2}) ->
    #{id => 10, type => 2, limit_id => 50,
      items => [{10603, 1}]};
ext_reward({11, 2}) ->
    #{id => 11, type => 2, limit_id => 55,
      items => [{10415, 1}]};
ext_reward({12, 2}) ->
    #{id => 12, type => 2, limit_id => 60,
      items => [{10001, 300}]};
ext_reward({13, 2}) ->
    #{id => 13, type => 2, limit_id => 65,
      items => [{10602, 1}]};
ext_reward({14, 2}) ->
    #{id => 14, type => 2, limit_id => 70,
      items => [{1, 1400000}]};
ext_reward({15, 2}) ->
    #{id => 15, type => 2, limit_id => 75,
      items => [{29205, 25}]};
ext_reward({16, 2}) ->
    #{id => 16, type => 2, limit_id => 80,
      items => [{10001, 350}]};
ext_reward({17, 2}) ->
    #{id => 17, type => 2, limit_id => 85,
      items => [{10415, 1}]};
ext_reward({18, 2}) ->
    #{id => 18, type => 2, limit_id => 90,
      items => [{1, 1600000}]};
ext_reward({19, 2}) ->
    #{id => 19, type => 2, limit_id => 95,
      items => [{29205, 25}]};
ext_reward({20, 2}) ->
    #{id => 20, type => 2, limit_id => 100,
      items => [{10453, 1}]};
ext_reward({21, 2}) ->
    #{id => 21, type => 2, limit_id => 105,
      items => [{10415, 1}]};
ext_reward({22, 2}) ->
    #{id => 22, type => 2, limit_id => 110,
      items => [{10001, 400}]};
ext_reward({23, 2}) ->
    #{id => 23, type => 2, limit_id => 115,
      items => [{10041, 1}]};
ext_reward({24, 2}) ->
    #{id => 24, type => 2, limit_id => 120,
      items => [{1, 1800000}]};
ext_reward({25, 2}) ->
    #{id => 25, type => 2, limit_id => 125,
      items => [{29205, 25}]};
ext_reward({26, 2}) ->
    #{id => 26, type => 2, limit_id => 130,
      items => [{10001, 450}]};
ext_reward({27, 2}) ->
    #{id => 27, type => 2, limit_id => 135,
      items => [{10415, 1}]};
ext_reward({28, 2}) ->
    #{id => 28, type => 2, limit_id => 140,
      items => [{1, 2000000}]};
ext_reward({29, 2}) ->
    #{id => 29, type => 2, limit_id => 145,
      items => [{29205, 25}]};
ext_reward({30, 2}) ->
    #{id => 30, type => 2, limit_id => 150,
      items => [{10603, 1}]};
ext_reward({31, 2}) ->
    #{id => 31, type => 2, limit_id => 155,
      items => [{10415, 1}]};
ext_reward({32, 2}) ->
    #{id => 32, type => 2, limit_id => 160,
      items => [{10001, 500}]};
ext_reward({33, 2}) ->
    #{id => 33, type => 2, limit_id => 165,
      items => [{10041, 1}]};
ext_reward({34, 2}) ->
    #{id => 34, type => 2, limit_id => 170,
      items => [{1, 2200000}]};
ext_reward({35, 2}) ->
    #{id => 35, type => 2, limit_id => 175,
      items => [{29205, 25}]};
ext_reward({36, 2}) ->
    #{id => 36, type => 2, limit_id => 180,
      items => [{10001, 550}]};
ext_reward({37, 2}) ->
    #{id => 37, type => 2, limit_id => 185,
      items => [{10415, 1}]};
ext_reward({38, 2}) ->
    #{id => 38, type => 2, limit_id => 190,
      items => [{1, 2400000}]};
ext_reward({39, 2}) ->
    #{id => 39, type => 2, limit_id => 195,
      items => [{29205, 25}]};
ext_reward({40, 2}) ->
    #{id => 40, type => 2, limit_id => 200,
      items => [{10453, 1}]};
ext_reward({41, 2}) ->
    #{id => 41, type => 2, limit_id => 205,
      items => [{17210, 1}]};
ext_reward({42, 2}) ->
    #{id => 42, type => 2, limit_id => 210,
      items => [{10001, 600}]};
ext_reward({43, 2}) ->
    #{id => 43, type => 2, limit_id => 215,
      items => [{10602, 1}]};
ext_reward({44, 2}) ->
    #{id => 44, type => 2, limit_id => 220,
      items => [{1, 2600000}]};
ext_reward({45, 2}) ->
    #{id => 45, type => 2, limit_id => 225,
      items => [{29205, 25}]};
ext_reward({46, 2}) ->
    #{id => 46, type => 2, limit_id => 230,
      items => [{10001, 650}]};
ext_reward({47, 2}) ->
    #{id => 47, type => 2, limit_id => 235,
      items => [{17210, 1}]};
ext_reward({48, 2}) ->
    #{id => 48, type => 2, limit_id => 240,
      items => [{1, 2800000}]};
ext_reward({49, 2}) ->
    #{id => 49, type => 2, limit_id => 245,
      items => [{29205, 25}]};
ext_reward({50, 2}) ->
    #{id => 50, type => 2, limit_id => 250,
      items => [{10603, 1}]};
ext_reward({51, 2}) ->
    #{id => 51, type => 2, limit_id => 255,
      items => [{17210, 1}]};
ext_reward({52, 2}) ->
    #{id => 52, type => 2, limit_id => 260,
      items => [{10001, 700}]};
ext_reward({53, 2}) ->
    #{id => 53, type => 2, limit_id => 265,
      items => [{10602, 1}]};
ext_reward({54, 2}) ->
    #{id => 54, type => 2, limit_id => 270,
      items => [{1, 3000000}]};
ext_reward({55, 2}) ->
    #{id => 55, type => 2, limit_id => 275,
      items => [{29205, 25}]};
ext_reward({56, 2}) ->
    #{id => 56, type => 2, limit_id => 280,
      items => [{10001, 750}]};
ext_reward({57, 2}) ->
    #{id => 57, type => 2, limit_id => 285,
      items => [{17210, 1}]};
ext_reward({58, 2}) ->
    #{id => 58, type => 2, limit_id => 290,
      items => [{1, 3200000}]};
ext_reward({59, 2}) ->
    #{id => 59, type => 2, limit_id => 295,
      items => [{29205, 25}]};
ext_reward({60, 2}) ->
    #{id => 60, type => 2, limit_id => 300,
      items => [{10453, 1}]};
ext_reward({61, 2}) ->
    #{id => 61, type => 2, limit_id => 305,
      items => [{17210, 1}]};
ext_reward({62, 2}) ->
    #{id => 62, type => 2, limit_id => 310,
      items => [{10001, 800}]};
ext_reward({63, 2}) ->
    #{id => 63, type => 2, limit_id => 315,
      items => [{10602, 1}]};
ext_reward({64, 2}) ->
    #{id => 64, type => 2, limit_id => 320,
      items => [{1, 3400000}]};
ext_reward({65, 2}) ->
    #{id => 65, type => 2, limit_id => 325,
      items => [{29205, 25}]};
ext_reward({66, 2}) ->
    #{id => 66, type => 2, limit_id => 330,
      items => [{10001, 850}]};
ext_reward({67, 2}) ->
    #{id => 67, type => 2, limit_id => 335,
      items => [{17210, 1}]};
ext_reward({68, 2}) ->
    #{id => 68, type => 2, limit_id => 340,
      items => [{1, 3600000}]};
ext_reward({69, 2}) ->
    #{id => 69, type => 2, limit_id => 345,
      items => [{29205, 25}]};
ext_reward({70, 2}) ->
    #{id => 70, type => 2, limit_id => 350,
      items => [{10603, 1}]};
ext_reward({71, 2}) ->
    #{id => 71, type => 2, limit_id => 355,
      items => [{17210, 1}]};
ext_reward({72, 2}) ->
    #{id => 72, type => 2, limit_id => 360,
      items => [{10001, 900}]};
ext_reward({73, 2}) ->
    #{id => 73, type => 2, limit_id => 365,
      items => [{10602, 1}]};
ext_reward({74, 2}) ->
    #{id => 74, type => 2, limit_id => 370,
      items => [{1, 3800000}]};
ext_reward({75, 2}) ->
    #{id => 75, type => 2, limit_id => 375,
      items => [{29205, 25}]};
ext_reward({76, 2}) ->
    #{id => 76, type => 2, limit_id => 380,
      items => [{10001, 950}]};
ext_reward({77, 2}) ->
    #{id => 77, type => 2, limit_id => 385,
      items => [{17211, 1}]};
ext_reward({78, 2}) ->
    #{id => 78, type => 2, limit_id => 390,
      items => [{1, 4000000}]};
ext_reward({79, 2}) ->
    #{id => 79, type => 2, limit_id => 395,
      items => [{29205, 25}]};
ext_reward({80, 2}) ->
    #{id => 80, type => 2, limit_id => 400,
      items => [{10453, 1}]};
ext_reward({81, 2}) ->
    #{id => 81, type => 2, limit_id => 405,
      items => [{17211, 1}]};
ext_reward({82, 2}) ->
    #{id => 82, type => 2, limit_id => 410,
      items => [{10001, 1000}]};
ext_reward({83, 2}) ->
    #{id => 83, type => 2, limit_id => 415,
      items => [{10602, 1}]};
ext_reward({84, 2}) ->
    #{id => 84, type => 2, limit_id => 420,
      items => [{1, 4200000}]};
ext_reward({85, 2}) ->
    #{id => 85, type => 2, limit_id => 425,
      items => [{29205, 25}]};
ext_reward({86, 2}) ->
    #{id => 86, type => 2, limit_id => 430,
      items => [{10001, 1050}]};
ext_reward({87, 2}) ->
    #{id => 87, type => 2, limit_id => 435,
      items => [{17211, 1}]};
ext_reward({88, 2}) ->
    #{id => 88, type => 2, limit_id => 440,
      items => [{1, 4400000}]};
ext_reward({89, 2}) ->
    #{id => 89, type => 2, limit_id => 445,
      items => [{29205, 25}]};
ext_reward({90, 2}) ->
    #{id => 90, type => 2, limit_id => 450,
      items => [{10603, 1}]};
ext_reward({91, 2}) ->
    #{id => 91, type => 2, limit_id => 455,
      items => [{17211, 1}]};
ext_reward({92, 2}) ->
    #{id => 92, type => 2, limit_id => 460,
      items => [{10001, 1100}]};
ext_reward({93, 2}) ->
    #{id => 93, type => 2, limit_id => 465,
      items => [{10602, 1}]};
ext_reward({94, 2}) ->
    #{id => 94, type => 2, limit_id => 470,
      items => [{1, 4600000}]};
ext_reward({95, 2}) ->
    #{id => 95, type => 2, limit_id => 475,
      items => [{29205, 25}]};
ext_reward({96, 2}) ->
    #{id => 96, type => 2, limit_id => 480,
      items => [{10001, 1150}]};
ext_reward({97, 2}) ->
    #{id => 97, type => 2, limit_id => 485,
      items => [{17211, 1}]};
ext_reward({98, 2}) ->
    #{id => 98, type => 2, limit_id => 490,
      items => [{1, 4800000}]};
ext_reward({99, 2}) ->
    #{id => 99, type => 2, limit_id => 495,
      items => [{29205, 25}]};
ext_reward({100, 2}) ->
    #{id => 100, type => 2, limit_id => 500,
      items => [{10453, 1}]};
ext_reward({1, 3}) ->
    #{id => 1, type => 3, limit_id => 5,
      items => [{10415, 1}]};
ext_reward({2, 3}) ->
    #{id => 2, type => 3, limit_id => 10,
      items => [{10001, 200}]};
ext_reward({3, 3}) ->
    #{id => 3, type => 3, limit_id => 15,
      items => [{10602, 1}]};
ext_reward({4, 3}) ->
    #{id => 4, type => 3, limit_id => 20,
      items => [{1, 1000000}]};
ext_reward({5, 3}) ->
    #{id => 5, type => 3, limit_id => 25,
      items => [{29305, 25}]};
ext_reward({6, 3}) ->
    #{id => 6, type => 3, limit_id => 30,
      items => [{10001, 250}]};
ext_reward({7, 3}) ->
    #{id => 7, type => 3, limit_id => 35,
      items => [{10415, 1}]};
ext_reward({8, 3}) ->
    #{id => 8, type => 3, limit_id => 40,
      items => [{1, 1200000}]};
ext_reward({9, 3}) ->
    #{id => 9, type => 3, limit_id => 45,
      items => [{29305, 25}]};
ext_reward({10, 3}) ->
    #{id => 10, type => 3, limit_id => 50,
      items => [{10603, 1}]};
ext_reward({11, 3}) ->
    #{id => 11, type => 3, limit_id => 55,
      items => [{10415, 1}]};
ext_reward({12, 3}) ->
    #{id => 12, type => 3, limit_id => 60,
      items => [{10001, 300}]};
ext_reward({13, 3}) ->
    #{id => 13, type => 3, limit_id => 65,
      items => [{10602, 1}]};
ext_reward({14, 3}) ->
    #{id => 14, type => 3, limit_id => 70,
      items => [{1, 1400000}]};
ext_reward({15, 3}) ->
    #{id => 15, type => 3, limit_id => 75,
      items => [{29305, 25}]};
ext_reward({16, 3}) ->
    #{id => 16, type => 3, limit_id => 80,
      items => [{10001, 350}]};
ext_reward({17, 3}) ->
    #{id => 17, type => 3, limit_id => 85,
      items => [{10415, 1}]};
ext_reward({18, 3}) ->
    #{id => 18, type => 3, limit_id => 90,
      items => [{1, 1600000}]};
ext_reward({19, 3}) ->
    #{id => 19, type => 3, limit_id => 95,
      items => [{29305, 25}]};
ext_reward({20, 3}) ->
    #{id => 20, type => 3, limit_id => 100,
      items => [{10453, 1}]};
ext_reward({21, 3}) ->
    #{id => 21, type => 3, limit_id => 105,
      items => [{10415, 1}]};
ext_reward({22, 3}) ->
    #{id => 22, type => 3, limit_id => 110,
      items => [{10001, 400}]};
ext_reward({23, 3}) ->
    #{id => 23, type => 3, limit_id => 115,
      items => [{10041, 1}]};
ext_reward({24, 3}) ->
    #{id => 24, type => 3, limit_id => 120,
      items => [{1, 1800000}]};
ext_reward({25, 3}) ->
    #{id => 25, type => 3, limit_id => 125,
      items => [{29305, 25}]};
ext_reward({26, 3}) ->
    #{id => 26, type => 3, limit_id => 130,
      items => [{10001, 450}]};
ext_reward({27, 3}) ->
    #{id => 27, type => 3, limit_id => 135,
      items => [{10415, 1}]};
ext_reward({28, 3}) ->
    #{id => 28, type => 3, limit_id => 140,
      items => [{1, 2000000}]};
ext_reward({29, 3}) ->
    #{id => 29, type => 3, limit_id => 145,
      items => [{29305, 25}]};
ext_reward({30, 3}) ->
    #{id => 30, type => 3, limit_id => 150,
      items => [{10603, 1}]};
ext_reward({31, 3}) ->
    #{id => 31, type => 3, limit_id => 155,
      items => [{10415, 1}]};
ext_reward({32, 3}) ->
    #{id => 32, type => 3, limit_id => 160,
      items => [{10001, 500}]};
ext_reward({33, 3}) ->
    #{id => 33, type => 3, limit_id => 165,
      items => [{10041, 1}]};
ext_reward({34, 3}) ->
    #{id => 34, type => 3, limit_id => 170,
      items => [{1, 2200000}]};
ext_reward({35, 3}) ->
    #{id => 35, type => 3, limit_id => 175,
      items => [{29305, 25}]};
ext_reward({36, 3}) ->
    #{id => 36, type => 3, limit_id => 180,
      items => [{10001, 550}]};
ext_reward({37, 3}) ->
    #{id => 37, type => 3, limit_id => 185,
      items => [{10415, 1}]};
ext_reward({38, 3}) ->
    #{id => 38, type => 3, limit_id => 190,
      items => [{1, 2400000}]};
ext_reward({39, 3}) ->
    #{id => 39, type => 3, limit_id => 195,
      items => [{29305, 25}]};
ext_reward({40, 3}) ->
    #{id => 40, type => 3, limit_id => 200,
      items => [{10453, 1}]};
ext_reward({41, 3}) ->
    #{id => 41, type => 3, limit_id => 205,
      items => [{17210, 1}]};
ext_reward({42, 3}) ->
    #{id => 42, type => 3, limit_id => 210,
      items => [{10001, 600}]};
ext_reward({43, 3}) ->
    #{id => 43, type => 3, limit_id => 215,
      items => [{10602, 1}]};
ext_reward({44, 3}) ->
    #{id => 44, type => 3, limit_id => 220,
      items => [{1, 2600000}]};
ext_reward({45, 3}) ->
    #{id => 45, type => 3, limit_id => 225,
      items => [{29305, 25}]};
ext_reward({46, 3}) ->
    #{id => 46, type => 3, limit_id => 230,
      items => [{10001, 650}]};
ext_reward({47, 3}) ->
    #{id => 47, type => 3, limit_id => 235,
      items => [{17210, 1}]};
ext_reward({48, 3}) ->
    #{id => 48, type => 3, limit_id => 240,
      items => [{1, 2800000}]};
ext_reward({49, 3}) ->
    #{id => 49, type => 3, limit_id => 245,
      items => [{29305, 25}]};
ext_reward({50, 3}) ->
    #{id => 50, type => 3, limit_id => 250,
      items => [{10603, 1}]};
ext_reward({51, 3}) ->
    #{id => 51, type => 3, limit_id => 255,
      items => [{17210, 1}]};
ext_reward({52, 3}) ->
    #{id => 52, type => 3, limit_id => 260,
      items => [{10001, 700}]};
ext_reward({53, 3}) ->
    #{id => 53, type => 3, limit_id => 265,
      items => [{10602, 1}]};
ext_reward({54, 3}) ->
    #{id => 54, type => 3, limit_id => 270,
      items => [{1, 3000000}]};
ext_reward({55, 3}) ->
    #{id => 55, type => 3, limit_id => 275,
      items => [{29305, 25}]};
ext_reward({56, 3}) ->
    #{id => 56, type => 3, limit_id => 280,
      items => [{10001, 750}]};
ext_reward({57, 3}) ->
    #{id => 57, type => 3, limit_id => 285,
      items => [{17210, 1}]};
ext_reward({58, 3}) ->
    #{id => 58, type => 3, limit_id => 290,
      items => [{1, 3200000}]};
ext_reward({59, 3}) ->
    #{id => 59, type => 3, limit_id => 295,
      items => [{29305, 25}]};
ext_reward({60, 3}) ->
    #{id => 60, type => 3, limit_id => 300,
      items => [{10453, 1}]};
ext_reward({61, 3}) ->
    #{id => 61, type => 3, limit_id => 305,
      items => [{17210, 1}]};
ext_reward({62, 3}) ->
    #{id => 62, type => 3, limit_id => 310,
      items => [{10001, 800}]};
ext_reward({63, 3}) ->
    #{id => 63, type => 3, limit_id => 315,
      items => [{10602, 1}]};
ext_reward({64, 3}) ->
    #{id => 64, type => 3, limit_id => 320,
      items => [{1, 3400000}]};
ext_reward({65, 3}) ->
    #{id => 65, type => 3, limit_id => 325,
      items => [{29305, 25}]};
ext_reward({66, 3}) ->
    #{id => 66, type => 3, limit_id => 330,
      items => [{10001, 850}]};
ext_reward({67, 3}) ->
    #{id => 67, type => 3, limit_id => 335,
      items => [{17210, 1}]};
ext_reward({68, 3}) ->
    #{id => 68, type => 3, limit_id => 340,
      items => [{1, 3600000}]};
ext_reward({69, 3}) ->
    #{id => 69, type => 3, limit_id => 345,
      items => [{29305, 25}]};
ext_reward({70, 3}) ->
    #{id => 70, type => 3, limit_id => 350,
      items => [{10603, 1}]};
ext_reward({71, 3}) ->
    #{id => 71, type => 3, limit_id => 355,
      items => [{17210, 1}]};
ext_reward({72, 3}) ->
    #{id => 72, type => 3, limit_id => 360,
      items => [{10001, 900}]};
ext_reward({73, 3}) ->
    #{id => 73, type => 3, limit_id => 365,
      items => [{10602, 1}]};
ext_reward({74, 3}) ->
    #{id => 74, type => 3, limit_id => 370,
      items => [{1, 3800000}]};
ext_reward({75, 3}) ->
    #{id => 75, type => 3, limit_id => 375,
      items => [{29305, 25}]};
ext_reward({76, 3}) ->
    #{id => 76, type => 3, limit_id => 380,
      items => [{10001, 950}]};
ext_reward({77, 3}) ->
    #{id => 77, type => 3, limit_id => 385,
      items => [{17211, 1}]};
ext_reward({78, 3}) ->
    #{id => 78, type => 3, limit_id => 390,
      items => [{1, 4000000}]};
ext_reward({79, 3}) ->
    #{id => 79, type => 3, limit_id => 395,
      items => [{29305, 25}]};
ext_reward({80, 3}) ->
    #{id => 80, type => 3, limit_id => 400,
      items => [{10453, 1}]};
ext_reward({81, 3}) ->
    #{id => 81, type => 3, limit_id => 405,
      items => [{17211, 1}]};
ext_reward({82, 3}) ->
    #{id => 82, type => 3, limit_id => 410,
      items => [{10001, 1000}]};
ext_reward({83, 3}) ->
    #{id => 83, type => 3, limit_id => 415,
      items => [{10602, 1}]};
ext_reward({84, 3}) ->
    #{id => 84, type => 3, limit_id => 420,
      items => [{1, 4200000}]};
ext_reward({85, 3}) ->
    #{id => 85, type => 3, limit_id => 425,
      items => [{29305, 25}]};
ext_reward({86, 3}) ->
    #{id => 86, type => 3, limit_id => 430,
      items => [{10001, 1050}]};
ext_reward({87, 3}) ->
    #{id => 87, type => 3, limit_id => 435,
      items => [{17211, 1}]};
ext_reward({88, 3}) ->
    #{id => 88, type => 3, limit_id => 440,
      items => [{1, 4400000}]};
ext_reward({89, 3}) ->
    #{id => 89, type => 3, limit_id => 445,
      items => [{29305, 25}]};
ext_reward({90, 3}) ->
    #{id => 90, type => 3, limit_id => 450,
      items => [{10603, 1}]};
ext_reward({91, 3}) ->
    #{id => 91, type => 3, limit_id => 455,
      items => [{17211, 1}]};
ext_reward({92, 3}) ->
    #{id => 92, type => 3, limit_id => 460,
      items => [{10001, 1100}]};
ext_reward({93, 3}) ->
    #{id => 93, type => 3, limit_id => 465,
      items => [{10602, 1}]};
ext_reward({94, 3}) ->
    #{id => 94, type => 3, limit_id => 470,
      items => [{1, 4600000}]};
ext_reward({95, 3}) ->
    #{id => 95, type => 3, limit_id => 475,
      items => [{29305, 25}]};
ext_reward({96, 3}) ->
    #{id => 96, type => 3, limit_id => 480,
      items => [{10001, 1150}]};
ext_reward({97, 3}) ->
    #{id => 97, type => 3, limit_id => 485,
      items => [{17211, 1}]};
ext_reward({98, 3}) ->
    #{id => 98, type => 3, limit_id => 490,
      items => [{1, 4800000}]};
ext_reward({99, 3}) ->
    #{id => 99, type => 3, limit_id => 495,
      items => [{29305, 25}]};
ext_reward({100, 3}) ->
    #{id => 100, type => 3, limit_id => 500,
      items => [{10453, 1}]};
ext_reward({1, 4}) ->
    #{id => 1, type => 4, limit_id => 5,
      items => [{10415, 1}]};
ext_reward({2, 4}) ->
    #{id => 2, type => 4, limit_id => 10,
      items => [{10001, 200}]};
ext_reward({3, 4}) ->
    #{id => 3, type => 4, limit_id => 15,
      items => [{10602, 1}]};
ext_reward({4, 4}) ->
    #{id => 4, type => 4, limit_id => 20,
      items => [{1, 1000000}]};
ext_reward({5, 4}) ->
    #{id => 5, type => 4, limit_id => 25,
      items => [{29906, 25}]};
ext_reward({6, 4}) ->
    #{id => 6, type => 4, limit_id => 30,
      items => [{10001, 250}]};
ext_reward({7, 4}) ->
    #{id => 7, type => 4, limit_id => 35,
      items => [{10415, 1}]};
ext_reward({8, 4}) ->
    #{id => 8, type => 4, limit_id => 40,
      items => [{1, 1200000}]};
ext_reward({9, 4}) ->
    #{id => 9, type => 4, limit_id => 45,
      items => [{29906, 25}]};
ext_reward({10, 4}) ->
    #{id => 10, type => 4, limit_id => 50,
      items => [{10603, 1}]};
ext_reward({11, 4}) ->
    #{id => 11, type => 4, limit_id => 55,
      items => [{10415, 1}]};
ext_reward({12, 4}) ->
    #{id => 12, type => 4, limit_id => 60,
      items => [{10001, 300}]};
ext_reward({13, 4}) ->
    #{id => 13, type => 4, limit_id => 65,
      items => [{10602, 1}]};
ext_reward({14, 4}) ->
    #{id => 14, type => 4, limit_id => 70,
      items => [{1, 1400000}]};
ext_reward({15, 4}) ->
    #{id => 15, type => 4, limit_id => 75,
      items => [{29906, 25}]};
ext_reward({16, 4}) ->
    #{id => 16, type => 4, limit_id => 80,
      items => [{10001, 350}]};
ext_reward({17, 4}) ->
    #{id => 17, type => 4, limit_id => 85,
      items => [{10415, 1}]};
ext_reward({18, 4}) ->
    #{id => 18, type => 4, limit_id => 90,
      items => [{1, 1600000}]};
ext_reward({19, 4}) ->
    #{id => 19, type => 4, limit_id => 95,
      items => [{29906, 25}]};
ext_reward({20, 4}) ->
    #{id => 20, type => 4, limit_id => 100,
      items => [{10453, 1}]};
ext_reward({21, 4}) ->
    #{id => 21, type => 4, limit_id => 105,
      items => [{10415, 1}]};
ext_reward({22, 4}) ->
    #{id => 22, type => 4, limit_id => 110,
      items => [{10001, 400}]};
ext_reward({23, 4}) ->
    #{id => 23, type => 4, limit_id => 115,
      items => [{10041, 1}]};
ext_reward({24, 4}) ->
    #{id => 24, type => 4, limit_id => 120,
      items => [{1, 1800000}]};
ext_reward({25, 4}) ->
    #{id => 25, type => 4, limit_id => 125,
      items => [{29906, 25}]};
ext_reward({26, 4}) ->
    #{id => 26, type => 4, limit_id => 130,
      items => [{10001, 450}]};
ext_reward({27, 4}) ->
    #{id => 27, type => 4, limit_id => 135,
      items => [{10415, 1}]};
ext_reward({28, 4}) ->
    #{id => 28, type => 4, limit_id => 140,
      items => [{1, 2000000}]};
ext_reward({29, 4}) ->
    #{id => 29, type => 4, limit_id => 145,
      items => [{29906, 25}]};
ext_reward({30, 4}) ->
    #{id => 30, type => 4, limit_id => 150,
      items => [{10603, 1}]};
ext_reward({31, 4}) ->
    #{id => 31, type => 4, limit_id => 155,
      items => [{10415, 1}]};
ext_reward({32, 4}) ->
    #{id => 32, type => 4, limit_id => 160,
      items => [{10001, 500}]};
ext_reward({33, 4}) ->
    #{id => 33, type => 4, limit_id => 165,
      items => [{10041, 1}]};
ext_reward({34, 4}) ->
    #{id => 34, type => 4, limit_id => 170,
      items => [{1, 2200000}]};
ext_reward({35, 4}) ->
    #{id => 35, type => 4, limit_id => 175,
      items => [{29906, 25}]};
ext_reward({36, 4}) ->
    #{id => 36, type => 4, limit_id => 180,
      items => [{10001, 550}]};
ext_reward({37, 4}) ->
    #{id => 37, type => 4, limit_id => 185,
      items => [{10415, 1}]};
ext_reward({38, 4}) ->
    #{id => 38, type => 4, limit_id => 190,
      items => [{1, 2400000}]};
ext_reward({39, 4}) ->
    #{id => 39, type => 4, limit_id => 195,
      items => [{29906, 25}]};
ext_reward({40, 4}) ->
    #{id => 40, type => 4, limit_id => 200,
      items => [{10453, 1}]};
ext_reward({41, 4}) ->
    #{id => 41, type => 4, limit_id => 205,
      items => [{17210, 1}]};
ext_reward({42, 4}) ->
    #{id => 42, type => 4, limit_id => 210,
      items => [{10001, 600}]};
ext_reward({43, 4}) ->
    #{id => 43, type => 4, limit_id => 215,
      items => [{10602, 1}]};
ext_reward({44, 4}) ->
    #{id => 44, type => 4, limit_id => 220,
      items => [{1, 2600000}]};
ext_reward({45, 4}) ->
    #{id => 45, type => 4, limit_id => 225,
      items => [{29906, 25}]};
ext_reward({46, 4}) ->
    #{id => 46, type => 4, limit_id => 230,
      items => [{10001, 650}]};
ext_reward({47, 4}) ->
    #{id => 47, type => 4, limit_id => 235,
      items => [{17210, 1}]};
ext_reward({48, 4}) ->
    #{id => 48, type => 4, limit_id => 240,
      items => [{1, 2800000}]};
ext_reward({49, 4}) ->
    #{id => 49, type => 4, limit_id => 245,
      items => [{29906, 25}]};
ext_reward({50, 4}) ->
    #{id => 50, type => 4, limit_id => 250,
      items => [{10603, 1}]};
ext_reward({51, 4}) ->
    #{id => 51, type => 4, limit_id => 255,
      items => [{17210, 1}]};
ext_reward({52, 4}) ->
    #{id => 52, type => 4, limit_id => 260,
      items => [{10001, 700}]};
ext_reward({53, 4}) ->
    #{id => 53, type => 4, limit_id => 265,
      items => [{10602, 1}]};
ext_reward({54, 4}) ->
    #{id => 54, type => 4, limit_id => 270,
      items => [{1, 3000000}]};
ext_reward({55, 4}) ->
    #{id => 55, type => 4, limit_id => 275,
      items => [{29906, 25}]};
ext_reward({56, 4}) ->
    #{id => 56, type => 4, limit_id => 280,
      items => [{10001, 750}]};
ext_reward({57, 4}) ->
    #{id => 57, type => 4, limit_id => 285,
      items => [{17210, 1}]};
ext_reward({58, 4}) ->
    #{id => 58, type => 4, limit_id => 290,
      items => [{1, 3200000}]};
ext_reward({59, 4}) ->
    #{id => 59, type => 4, limit_id => 295,
      items => [{29906, 25}]};
ext_reward({60, 4}) ->
    #{id => 60, type => 4, limit_id => 300,
      items => [{10453, 1}]};
ext_reward({61, 4}) ->
    #{id => 61, type => 4, limit_id => 305,
      items => [{17210, 1}]};
ext_reward({62, 4}) ->
    #{id => 62, type => 4, limit_id => 310,
      items => [{10001, 800}]};
ext_reward({63, 4}) ->
    #{id => 63, type => 4, limit_id => 315,
      items => [{10602, 1}]};
ext_reward({64, 4}) ->
    #{id => 64, type => 4, limit_id => 320,
      items => [{1, 3400000}]};
ext_reward({65, 4}) ->
    #{id => 65, type => 4, limit_id => 325,
      items => [{29906, 25}]};
ext_reward({66, 4}) ->
    #{id => 66, type => 4, limit_id => 330,
      items => [{10001, 850}]};
ext_reward({67, 4}) ->
    #{id => 67, type => 4, limit_id => 335,
      items => [{17210, 1}]};
ext_reward({68, 4}) ->
    #{id => 68, type => 4, limit_id => 340,
      items => [{1, 3600000}]};
ext_reward({69, 4}) ->
    #{id => 69, type => 4, limit_id => 345,
      items => [{29906, 25}]};
ext_reward({70, 4}) ->
    #{id => 70, type => 4, limit_id => 350,
      items => [{10603, 1}]};
ext_reward({71, 4}) ->
    #{id => 71, type => 4, limit_id => 355,
      items => [{17210, 1}]};
ext_reward({72, 4}) ->
    #{id => 72, type => 4, limit_id => 360,
      items => [{10001, 900}]};
ext_reward({73, 4}) ->
    #{id => 73, type => 4, limit_id => 365,
      items => [{10602, 1}]};
ext_reward({74, 4}) ->
    #{id => 74, type => 4, limit_id => 370,
      items => [{1, 3800000}]};
ext_reward({75, 4}) ->
    #{id => 75, type => 4, limit_id => 375,
      items => [{29906, 25}]};
ext_reward({76, 4}) ->
    #{id => 76, type => 4, limit_id => 380,
      items => [{10001, 950}]};
ext_reward({77, 4}) ->
    #{id => 77, type => 4, limit_id => 385,
      items => [{17211, 1}]};
ext_reward({78, 4}) ->
    #{id => 78, type => 4, limit_id => 390,
      items => [{1, 4000000}]};
ext_reward({79, 4}) ->
    #{id => 79, type => 4, limit_id => 395,
      items => [{29906, 25}]};
ext_reward({80, 4}) ->
    #{id => 80, type => 4, limit_id => 400,
      items => [{10453, 1}]};
ext_reward({81, 4}) ->
    #{id => 81, type => 4, limit_id => 405,
      items => [{17211, 1}]};
ext_reward({82, 4}) ->
    #{id => 82, type => 4, limit_id => 410,
      items => [{10001, 1000}]};
ext_reward({83, 4}) ->
    #{id => 83, type => 4, limit_id => 415,
      items => [{10602, 1}]};
ext_reward({84, 4}) ->
    #{id => 84, type => 4, limit_id => 420,
      items => [{1, 4200000}]};
ext_reward({85, 4}) ->
    #{id => 85, type => 4, limit_id => 425,
      items => [{29906, 25}]};
ext_reward({86, 4}) ->
    #{id => 86, type => 4, limit_id => 430,
      items => [{10001, 1050}]};
ext_reward({87, 4}) ->
    #{id => 87, type => 4, limit_id => 435,
      items => [{17211, 1}]};
ext_reward({88, 4}) ->
    #{id => 88, type => 4, limit_id => 440,
      items => [{1, 4400000}]};
ext_reward({89, 4}) ->
    #{id => 89, type => 4, limit_id => 445,
      items => [{29906, 25}]};
ext_reward({90, 4}) ->
    #{id => 90, type => 4, limit_id => 450,
      items => [{10603, 1}]};
ext_reward({91, 4}) ->
    #{id => 91, type => 4, limit_id => 455,
      items => [{17211, 1}]};
ext_reward({92, 4}) ->
    #{id => 92, type => 4, limit_id => 460,
      items => [{10001, 1100}]};
ext_reward({93, 4}) ->
    #{id => 93, type => 4, limit_id => 465,
      items => [{10602, 1}]};
ext_reward({94, 4}) ->
    #{id => 94, type => 4, limit_id => 470,
      items => [{1, 4600000}]};
ext_reward({95, 4}) ->
    #{id => 95, type => 4, limit_id => 475,
      items => [{29906, 25}]};
ext_reward({96, 4}) ->
    #{id => 96, type => 4, limit_id => 480,
      items => [{10001, 1150}]};
ext_reward({97, 4}) ->
    #{id => 97, type => 4, limit_id => 485,
      items => [{17211, 1}]};
ext_reward({98, 4}) ->
    #{id => 98, type => 4, limit_id => 490,
      items => [{1, 4800000}]};
ext_reward({99, 4}) ->
    #{id => 99, type => 4, limit_id => 495,
      items => [{29906, 25}]};
ext_reward({100, 4}) ->
    #{id => 100, type => 4, limit_id => 500,
      items => [{10453, 1}]};
ext_reward(_Info) ->
    logger:data_error("ext_reward_data_not_exist===>~w",
		      [_Info], endless_data, 33109),
    undefined.

get_buff(101) ->
    #{id => 101, group_id => 1, skill_id => 600001,
      round => 5, condition => {undefined}, weight => 300,
      desc => lang:get(<<"全体攻击+10%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体攻击+10%"/utf8>>),
      icon => <<"1">>};
get_buff(102) ->
    #{id => 102, group_id => 1, skill_id => 600011,
      round => 5, condition => {undefined}, weight => 300,
      desc => lang:get(<<"全体暴击率+10%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体暴击率+10%"/utf8>>),
      icon => <<"2">>};
get_buff(103) ->
    #{id => 103, group_id => 1, skill_id => 600021,
      round => 5, condition => {undefined}, weight => 300,
      desc => lang:get(<<"全体暴击伤害+10%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体暴击伤害+10%"/utf8>>),
      icon => <<"3">>};
get_buff(104) ->
    #{id => 104, group_id => 1, skill_id => 600091,
      round => 5, condition => {undefined}, weight => 300,
      desc => lang:get(<<"全体速度+10%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体速度+10%"/utf8>>),
      icon => <<"4">>};
get_buff(201) ->
    #{id => 201, group_id => 2, skill_id => 600031,
      round => 5, condition => {undefined}, weight => 300,
      desc => lang:get(<<"全体防御+10%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体防御+10%"/utf8>>),
      icon => <<"5">>};
get_buff(202) ->
    #{id => 202, group_id => 2, skill_id => 600041,
      round => 5, condition => {undefined}, weight => 300,
      desc => lang:get(<<"全体抗暴+10%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体抗暴+10%"/utf8>>),
      icon => <<"6">>};
get_buff(203) ->
    #{id => 203, group_id => 2, skill_id => 600051,
      round => 5, condition => {undefined}, weight => 300,
      desc => lang:get(<<"全体效果抵抗+10%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体效果抵抗+10%"/utf8>>),
      icon => <<"7">>};
get_buff(204) ->
    #{id => 204, group_id => 2, skill_id => 600101,
      round => 5, condition => {undefined}, weight => 300,
      desc => lang:get(<<"全体闪躲+5%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体闪躲+5%"/utf8>>),
      icon => <<"8">>};
get_buff(301) ->
    #{id => 301, group_id => 3, skill_id => 600061,
      round => 5, condition => {undefined}, weight => 300,
      desc => lang:get(<<"全体治疗效果+10%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体治疗效果+10%"/utf8>>),
      icon => <<"9">>};
get_buff(302) ->
    #{id => 302, group_id => 3, skill_id => 600061,
      round => 5, condition => {undefined}, weight => 0,
      desc => lang:get(<<"全体治疗效果+10%\n效果持续到下次增益项选择"/utf8>>),
      battle_desc => lang:get(<<"全体治疗效果+10%"/utf8>>),
      icon => <<"10">>};
get_buff(303) ->
    #{id => 303, group_id => 3, skill_id => 600081,
      round => 1, condition => {undefined}, weight => 300,
      desc => lang:get(<<"治疗友方全体，恢复最大生命值上限的10%生命值"/utf8>>),
      battle_desc => lang:get(<<"无效果（已回复生命值）"/utf8>>),
      icon => <<"11">>};
get_buff(_Info) ->
    logger:data_error("get_buff_data_not_exist===>~w",
		      [_Info], endless_data, 33243),
    undefined.

buff_type(3) ->
    [#{id => 301, condition => {undefined}, weight => 300},
     #{id => 302, condition => {undefined}, weight => 0},
     #{id => 303, condition => {undefined}, weight => 300}];
buff_type(2) ->
    [#{id => 201, condition => {undefined}, weight => 300},
     #{id => 202, condition => {undefined}, weight => 300},
     #{id => 203, condition => {undefined}, weight => 300},
     #{id => 204, condition => {undefined}, weight => 300}];
buff_type(1) ->
    [#{id => 101, condition => {undefined}, weight => 300},
     #{id => 102, condition => {undefined}, weight => 300},
     #{id => 103, condition => {undefined}, weight => 300},
     #{id => 104, condition => {undefined}, weight => 300}];
buff_type(_) -> [].

day_reward({1, 5}) -> [{22, 30000}, {1, 20000}];
day_reward({2, 5}) -> [{22, 30600}, {1, 20500}];
day_reward({3, 5}) -> [{22, 31200}, {1, 21000}];
day_reward({4, 5}) -> [{22, 31800}, {1, 21500}];
day_reward({5, 5}) -> [{22, 32400}, {1, 22000}];
day_reward({6, 5}) -> [{22, 33000}, {1, 22500}];
day_reward({7, 5}) -> [{22, 33600}, {1, 23000}];
day_reward({8, 5}) -> [{22, 34200}, {1, 23500}];
day_reward({9, 5}) -> [{22, 34800}, {1, 24000}];
day_reward({10, 5}) -> [{22, 35400}, {1, 24500}];
day_reward({11, 5}) -> [{22, 36000}, {1, 25000}];
day_reward({12, 5}) -> [{22, 36600}, {1, 25500}];
day_reward({13, 5}) -> [{22, 37200}, {1, 26000}];
day_reward({14, 5}) -> [{22, 37800}, {1, 26500}];
day_reward({15, 5}) -> [{22, 38400}, {1, 27000}];
day_reward({16, 5}) -> [{22, 39000}, {1, 27500}];
day_reward({17, 5}) -> [{22, 39600}, {1, 28000}];
day_reward({18, 5}) -> [{22, 40200}, {1, 28500}];
day_reward({19, 5}) -> [{22, 40800}, {1, 29000}];
day_reward({20, 5}) -> [{22, 41400}, {1, 29500}];
day_reward({21, 5}) -> [{22, 42000}, {1, 30000}];
day_reward({22, 5}) -> [{22, 42600}, {1, 30500}];
day_reward({23, 5}) -> [{22, 43200}, {1, 31000}];
day_reward({24, 5}) -> [{22, 43800}, {1, 31500}];
day_reward({25, 5}) -> [{22, 44400}, {1, 32000}];
day_reward({26, 5}) -> [{22, 45000}, {1, 32500}];
day_reward({27, 5}) -> [{22, 45600}, {1, 33000}];
day_reward({28, 5}) -> [{22, 46200}, {1, 33500}];
day_reward({29, 5}) -> [{22, 46800}, {1, 34000}];
day_reward({30, 5}) -> [{22, 47400}, {1, 34500}];
day_reward({31, 5}) -> [{22, 48000}, {1, 35000}];
day_reward({32, 5}) -> [{22, 48600}, {1, 35500}];
day_reward({33, 5}) -> [{22, 49200}, {1, 36000}];
day_reward({34, 5}) -> [{22, 49800}, {1, 36500}];
day_reward({35, 5}) -> [{22, 50400}, {1, 37000}];
day_reward({36, 5}) -> [{22, 51000}, {1, 37500}];
day_reward({37, 5}) -> [{22, 51600}, {1, 38000}];
day_reward({38, 5}) -> [{22, 52200}, {1, 38500}];
day_reward({39, 5}) -> [{22, 52800}, {1, 39000}];
day_reward({40, 5}) -> [{22, 53400}, {1, 39500}];
day_reward({41, 5}) -> [{22, 54000}, {1, 40000}];
day_reward({42, 5}) -> [{22, 54600}, {1, 40500}];
day_reward({43, 5}) -> [{22, 55200}, {1, 41000}];
day_reward({44, 5}) -> [{22, 55800}, {1, 41500}];
day_reward({45, 5}) -> [{22, 56400}, {1, 42000}];
day_reward({46, 5}) -> [{22, 57000}, {1, 42500}];
day_reward({47, 5}) -> [{22, 57600}, {1, 43000}];
day_reward({48, 5}) -> [{22, 58200}, {1, 43500}];
day_reward({49, 5}) -> [{22, 58800}, {1, 44000}];
day_reward({50, 5}) -> [{22, 59400}, {1, 44500}];
day_reward({51, 5}) -> [{22, 60000}, {1, 45000}];
day_reward({52, 5}) -> [{22, 60600}, {1, 45500}];
day_reward({53, 5}) -> [{22, 61200}, {1, 46000}];
day_reward({54, 5}) -> [{22, 61800}, {1, 46500}];
day_reward({55, 5}) -> [{22, 62400}, {1, 47000}];
day_reward({56, 5}) -> [{22, 63000}, {1, 47500}];
day_reward({57, 5}) -> [{22, 63600}, {1, 48000}];
day_reward({58, 5}) -> [{22, 64200}, {1, 48500}];
day_reward({59, 5}) -> [{22, 64800}, {1, 49000}];
day_reward({60, 5}) -> [{22, 65400}, {1, 49500}];
day_reward({61, 5}) -> [{22, 66000}, {1, 50000}];
day_reward({62, 5}) -> [{22, 66600}, {1, 50500}];
day_reward({63, 5}) -> [{22, 67200}, {1, 51000}];
day_reward({64, 5}) -> [{22, 67800}, {1, 51500}];
day_reward({65, 5}) -> [{22, 68400}, {1, 52000}];
day_reward({66, 5}) -> [{22, 69000}, {1, 52500}];
day_reward({67, 5}) -> [{22, 69600}, {1, 53000}];
day_reward({68, 5}) -> [{22, 70200}, {1, 53500}];
day_reward({69, 5}) -> [{22, 70800}, {1, 54000}];
day_reward({70, 5}) -> [{22, 71400}, {1, 54500}];
day_reward({71, 5}) -> [{22, 72000}, {1, 55000}];
day_reward({72, 5}) -> [{22, 72600}, {1, 55500}];
day_reward({73, 5}) -> [{22, 73200}, {1, 56000}];
day_reward({74, 5}) -> [{22, 73800}, {1, 56500}];
day_reward({75, 5}) -> [{22, 74400}, {1, 57000}];
day_reward({76, 5}) -> [{22, 75000}, {1, 57500}];
day_reward({77, 5}) -> [{22, 75600}, {1, 58000}];
day_reward({78, 5}) -> [{22, 76200}, {1, 58500}];
day_reward({79, 5}) -> [{22, 76800}, {1, 59000}];
day_reward({80, 5}) -> [{22, 77400}, {1, 59500}];
day_reward({81, 5}) -> [{22, 78000}, {1, 60000}];
day_reward({82, 5}) -> [{22, 78600}, {1, 60500}];
day_reward({83, 5}) -> [{22, 79200}, {1, 61000}];
day_reward({84, 5}) -> [{22, 79800}, {1, 61500}];
day_reward({85, 5}) -> [{22, 80400}, {1, 62000}];
day_reward({86, 5}) -> [{22, 81000}, {1, 62500}];
day_reward({87, 5}) -> [{22, 81600}, {1, 63000}];
day_reward({88, 5}) -> [{22, 82200}, {1, 63500}];
day_reward({89, 5}) -> [{22, 82800}, {1, 64000}];
day_reward({90, 5}) -> [{22, 83400}, {1, 64500}];
day_reward({91, 5}) -> [{22, 84000}, {1, 65000}];
day_reward({92, 5}) -> [{22, 84600}, {1, 65500}];
day_reward({93, 5}) -> [{22, 85200}, {1, 66000}];
day_reward({94, 5}) -> [{22, 85800}, {1, 66500}];
day_reward({95, 5}) -> [{22, 86400}, {1, 67000}];
day_reward({96, 5}) -> [{22, 87000}, {1, 67500}];
day_reward({97, 5}) -> [{22, 87600}, {1, 68000}];
day_reward({98, 5}) -> [{22, 88200}, {1, 68500}];
day_reward({99, 5}) -> [{22, 88800}, {1, 69000}];
day_reward({100, 5}) -> [{22, 89400}, {1, 69500}];
day_reward({101, 5}) -> [{22, 90000}, {1, 70000}];
day_reward({102, 5}) -> [{22, 90600}, {1, 70500}];
day_reward({103, 5}) -> [{22, 91200}, {1, 71000}];
day_reward({104, 5}) -> [{22, 91800}, {1, 71500}];
day_reward({105, 5}) -> [{22, 92400}, {1, 72000}];
day_reward({106, 5}) -> [{22, 93000}, {1, 72500}];
day_reward({107, 5}) -> [{22, 93600}, {1, 73000}];
day_reward({108, 5}) -> [{22, 94200}, {1, 73500}];
day_reward({109, 5}) -> [{22, 94800}, {1, 74000}];
day_reward({110, 5}) -> [{22, 95400}, {1, 74500}];
day_reward({111, 5}) -> [{22, 96000}, {1, 75000}];
day_reward({112, 5}) -> [{22, 96600}, {1, 75500}];
day_reward({113, 5}) -> [{22, 97200}, {1, 76000}];
day_reward({114, 5}) -> [{22, 97800}, {1, 76500}];
day_reward({115, 5}) -> [{22, 98400}, {1, 77000}];
day_reward({116, 5}) -> [{22, 99000}, {1, 77500}];
day_reward({117, 5}) -> [{22, 99600}, {1, 78000}];
day_reward({118, 5}) -> [{22, 100200}, {1, 78500}];
day_reward({119, 5}) -> [{22, 100800}, {1, 79000}];
day_reward({120, 5}) -> [{22, 101400}, {1, 79500}];
day_reward({121, 5}) -> [{22, 102000}, {1, 80000}];
day_reward({122, 5}) -> [{22, 102600}, {1, 80500}];
day_reward({123, 5}) -> [{22, 103200}, {1, 81000}];
day_reward({124, 5}) -> [{22, 103800}, {1, 81500}];
day_reward({125, 5}) -> [{22, 104400}, {1, 82000}];
day_reward({126, 5}) -> [{22, 105000}, {1, 82500}];
day_reward({127, 5}) -> [{22, 105600}, {1, 83000}];
day_reward({128, 5}) -> [{22, 106200}, {1, 83500}];
day_reward({129, 5}) -> [{22, 106800}, {1, 84000}];
day_reward({130, 5}) -> [{22, 107400}, {1, 84500}];
day_reward({131, 5}) -> [{22, 108000}, {1, 85000}];
day_reward({132, 5}) -> [{22, 108600}, {1, 85500}];
day_reward({133, 5}) -> [{22, 109200}, {1, 86000}];
day_reward({134, 5}) -> [{22, 109800}, {1, 86500}];
day_reward({135, 5}) -> [{22, 110400}, {1, 87000}];
day_reward({136, 5}) -> [{22, 111000}, {1, 87500}];
day_reward({137, 5}) -> [{22, 111600}, {1, 88000}];
day_reward({138, 5}) -> [{22, 112200}, {1, 88500}];
day_reward({139, 5}) -> [{22, 112800}, {1, 89000}];
day_reward({140, 5}) -> [{22, 113400}, {1, 89500}];
day_reward({141, 5}) -> [{22, 114000}, {1, 90000}];
day_reward({142, 5}) -> [{22, 114600}, {1, 90500}];
day_reward({143, 5}) -> [{22, 115200}, {1, 91000}];
day_reward({144, 5}) -> [{22, 115800}, {1, 91500}];
day_reward({145, 5}) -> [{22, 116400}, {1, 92000}];
day_reward({146, 5}) -> [{22, 117000}, {1, 92500}];
day_reward({147, 5}) -> [{22, 117600}, {1, 93000}];
day_reward({148, 5}) -> [{22, 118200}, {1, 93500}];
day_reward({149, 5}) -> [{22, 118800}, {1, 94000}];
day_reward({150, 5}) -> [{22, 119400}, {1, 94500}];
day_reward({151, 5}) -> [{22, 120000}, {1, 95000}];
day_reward({152, 5}) -> [{22, 120600}, {1, 95500}];
day_reward({153, 5}) -> [{22, 121200}, {1, 96000}];
day_reward({154, 5}) -> [{22, 121800}, {1, 96500}];
day_reward({155, 5}) -> [{22, 122400}, {1, 97000}];
day_reward({156, 5}) -> [{22, 123000}, {1, 97500}];
day_reward({157, 5}) -> [{22, 123600}, {1, 98000}];
day_reward({158, 5}) -> [{22, 124200}, {1, 98500}];
day_reward({159, 5}) -> [{22, 124800}, {1, 99000}];
day_reward({160, 5}) -> [{22, 125400}, {1, 99500}];
day_reward({161, 5}) -> [{22, 126000}, {1, 100000}];
day_reward({162, 5}) -> [{22, 126600}, {1, 100500}];
day_reward({163, 5}) -> [{22, 127200}, {1, 101000}];
day_reward({164, 5}) -> [{22, 127800}, {1, 101500}];
day_reward({165, 5}) -> [{22, 128400}, {1, 102000}];
day_reward({166, 5}) -> [{22, 129000}, {1, 102500}];
day_reward({167, 5}) -> [{22, 129600}, {1, 103000}];
day_reward({168, 5}) -> [{22, 130200}, {1, 103500}];
day_reward({169, 5}) -> [{22, 130800}, {1, 104000}];
day_reward({170, 5}) -> [{22, 131400}, {1, 104500}];
day_reward({171, 5}) -> [{22, 132000}, {1, 105000}];
day_reward({172, 5}) -> [{22, 132600}, {1, 105500}];
day_reward({173, 5}) -> [{22, 133200}, {1, 106000}];
day_reward({174, 5}) -> [{22, 133800}, {1, 106500}];
day_reward({175, 5}) -> [{22, 134400}, {1, 107000}];
day_reward({176, 5}) -> [{22, 135000}, {1, 107500}];
day_reward({177, 5}) -> [{22, 135600}, {1, 108000}];
day_reward({178, 5}) -> [{22, 136200}, {1, 108500}];
day_reward({179, 5}) -> [{22, 136800}, {1, 109000}];
day_reward({180, 5}) -> [{22, 137400}, {1, 109500}];
day_reward({181, 5}) -> [{22, 138000}, {1, 110000}];
day_reward({182, 5}) -> [{22, 138600}, {1, 110500}];
day_reward({183, 5}) -> [{22, 139200}, {1, 111000}];
day_reward({184, 5}) -> [{22, 139800}, {1, 111500}];
day_reward({185, 5}) -> [{22, 140400}, {1, 112000}];
day_reward({186, 5}) -> [{22, 141000}, {1, 112500}];
day_reward({187, 5}) -> [{22, 141600}, {1, 113000}];
day_reward({188, 5}) -> [{22, 142200}, {1, 113500}];
day_reward({189, 5}) -> [{22, 142800}, {1, 114000}];
day_reward({190, 5}) -> [{22, 143400}, {1, 114500}];
day_reward({191, 5}) -> [{22, 144000}, {1, 115000}];
day_reward({192, 5}) -> [{22, 144600}, {1, 115500}];
day_reward({193, 5}) -> [{22, 145200}, {1, 116000}];
day_reward({194, 5}) -> [{22, 145800}, {1, 116500}];
day_reward({195, 5}) -> [{22, 146400}, {1, 117000}];
day_reward({196, 5}) -> [{22, 147000}, {1, 117500}];
day_reward({197, 5}) -> [{22, 147600}, {1, 118000}];
day_reward({198, 5}) -> [{22, 148200}, {1, 118500}];
day_reward({199, 5}) -> [{22, 148800}, {1, 119000}];
day_reward({200, 5}) -> [{22, 149400}, {1, 119500}];
day_reward({201, 5}) -> [{22, 150000}, {1, 120000}];
day_reward({202, 5}) -> [{22, 150600}, {1, 120500}];
day_reward({203, 5}) -> [{22, 151200}, {1, 121000}];
day_reward({204, 5}) -> [{22, 151800}, {1, 121500}];
day_reward({205, 5}) -> [{22, 152400}, {1, 122000}];
day_reward({206, 5}) -> [{22, 153000}, {1, 122500}];
day_reward({207, 5}) -> [{22, 153600}, {1, 123000}];
day_reward({208, 5}) -> [{22, 154200}, {1, 123500}];
day_reward({209, 5}) -> [{22, 154800}, {1, 124000}];
day_reward({210, 5}) -> [{22, 155400}, {1, 124500}];
day_reward({211, 5}) -> [{22, 156000}, {1, 125000}];
day_reward({212, 5}) -> [{22, 156600}, {1, 125500}];
day_reward({213, 5}) -> [{22, 157200}, {1, 126000}];
day_reward({214, 5}) -> [{22, 157800}, {1, 126500}];
day_reward({215, 5}) -> [{22, 158400}, {1, 127000}];
day_reward({216, 5}) -> [{22, 159000}, {1, 127500}];
day_reward({217, 5}) -> [{22, 159600}, {1, 128000}];
day_reward({218, 5}) -> [{22, 160200}, {1, 128500}];
day_reward({219, 5}) -> [{22, 160800}, {1, 129000}];
day_reward({220, 5}) -> [{22, 161400}, {1, 129500}];
day_reward({221, 5}) -> [{22, 162000}, {1, 130000}];
day_reward({222, 5}) -> [{22, 162600}, {1, 130500}];
day_reward({223, 5}) -> [{22, 163200}, {1, 131000}];
day_reward({224, 5}) -> [{22, 163800}, {1, 131500}];
day_reward({225, 5}) -> [{22, 164400}, {1, 132000}];
day_reward({226, 5}) -> [{22, 165000}, {1, 132500}];
day_reward({227, 5}) -> [{22, 165600}, {1, 133000}];
day_reward({228, 5}) -> [{22, 166200}, {1, 133500}];
day_reward({229, 5}) -> [{22, 166800}, {1, 134000}];
day_reward({230, 5}) -> [{22, 167400}, {1, 134500}];
day_reward({231, 5}) -> [{22, 168000}, {1, 135000}];
day_reward({232, 5}) -> [{22, 168600}, {1, 135500}];
day_reward({233, 5}) -> [{22, 169200}, {1, 136000}];
day_reward({234, 5}) -> [{22, 169800}, {1, 136500}];
day_reward({235, 5}) -> [{22, 170400}, {1, 137000}];
day_reward({236, 5}) -> [{22, 171000}, {1, 137500}];
day_reward({237, 5}) -> [{22, 171600}, {1, 138000}];
day_reward({238, 5}) -> [{22, 172200}, {1, 138500}];
day_reward({239, 5}) -> [{22, 172800}, {1, 139000}];
day_reward({240, 5}) -> [{22, 173400}, {1, 139500}];
day_reward({241, 5}) -> [{22, 174000}, {1, 140000}];
day_reward({242, 5}) -> [{22, 174600}, {1, 140500}];
day_reward({243, 5}) -> [{22, 175200}, {1, 141000}];
day_reward({244, 5}) -> [{22, 175800}, {1, 141500}];
day_reward({245, 5}) -> [{22, 176400}, {1, 142000}];
day_reward({246, 5}) -> [{22, 177000}, {1, 142500}];
day_reward({247, 5}) -> [{22, 177600}, {1, 143000}];
day_reward({248, 5}) -> [{22, 178200}, {1, 143500}];
day_reward({249, 5}) -> [{22, 178800}, {1, 144000}];
day_reward({250, 5}) -> [{22, 179400}, {1, 144500}];
day_reward({251, 5}) -> [{22, 180000}, {1, 145000}];
day_reward({252, 5}) -> [{22, 180600}, {1, 145500}];
day_reward({253, 5}) -> [{22, 181200}, {1, 146000}];
day_reward({254, 5}) -> [{22, 181800}, {1, 146500}];
day_reward({255, 5}) -> [{22, 182400}, {1, 147000}];
day_reward({256, 5}) -> [{22, 183000}, {1, 147500}];
day_reward({257, 5}) -> [{22, 183600}, {1, 148000}];
day_reward({258, 5}) -> [{22, 184200}, {1, 148500}];
day_reward({259, 5}) -> [{22, 184800}, {1, 149000}];
day_reward({260, 5}) -> [{22, 185400}, {1, 149500}];
day_reward({261, 5}) -> [{22, 186000}, {1, 150000}];
day_reward({262, 5}) -> [{22, 186600}, {1, 150500}];
day_reward({263, 5}) -> [{22, 187200}, {1, 151000}];
day_reward({264, 5}) -> [{22, 187800}, {1, 151500}];
day_reward({265, 5}) -> [{22, 188400}, {1, 152000}];
day_reward({266, 5}) -> [{22, 189000}, {1, 152500}];
day_reward({267, 5}) -> [{22, 189600}, {1, 153000}];
day_reward({268, 5}) -> [{22, 190200}, {1, 153500}];
day_reward({269, 5}) -> [{22, 190800}, {1, 154000}];
day_reward({270, 5}) -> [{22, 191400}, {1, 154500}];
day_reward({271, 5}) -> [{22, 192000}, {1, 155000}];
day_reward({272, 5}) -> [{22, 192600}, {1, 155500}];
day_reward({273, 5}) -> [{22, 193200}, {1, 156000}];
day_reward({274, 5}) -> [{22, 193800}, {1, 156500}];
day_reward({275, 5}) -> [{22, 194400}, {1, 157000}];
day_reward({276, 5}) -> [{22, 195000}, {1, 157500}];
day_reward({277, 5}) -> [{22, 195600}, {1, 158000}];
day_reward({278, 5}) -> [{22, 196200}, {1, 158500}];
day_reward({279, 5}) -> [{22, 196800}, {1, 159000}];
day_reward({280, 5}) -> [{22, 197400}, {1, 159500}];
day_reward({281, 5}) -> [{22, 198000}, {1, 160000}];
day_reward({282, 5}) -> [{22, 198600}, {1, 160500}];
day_reward({283, 5}) -> [{22, 199200}, {1, 161000}];
day_reward({284, 5}) -> [{22, 199800}, {1, 161500}];
day_reward({285, 5}) -> [{22, 200400}, {1, 162000}];
day_reward({286, 5}) -> [{22, 201000}, {1, 162500}];
day_reward({287, 5}) -> [{22, 201600}, {1, 163000}];
day_reward({288, 5}) -> [{22, 202200}, {1, 163500}];
day_reward({289, 5}) -> [{22, 202800}, {1, 164000}];
day_reward({290, 5}) -> [{22, 203400}, {1, 164500}];
day_reward({291, 5}) -> [{22, 204000}, {1, 165000}];
day_reward({292, 5}) -> [{22, 204600}, {1, 165500}];
day_reward({293, 5}) -> [{22, 205200}, {1, 166000}];
day_reward({294, 5}) -> [{22, 205800}, {1, 166500}];
day_reward({295, 5}) -> [{22, 206400}, {1, 167000}];
day_reward({296, 5}) -> [{22, 207000}, {1, 167500}];
day_reward({297, 5}) -> [{22, 207600}, {1, 168000}];
day_reward({298, 5}) -> [{22, 208200}, {1, 168500}];
day_reward({299, 5}) -> [{22, 208800}, {1, 169000}];
day_reward({300, 5}) -> [{22, 209400}, {1, 169500}];
day_reward({301, 5}) -> [{22, 210000}, {1, 170000}];
day_reward({302, 5}) -> [{22, 210600}, {1, 170500}];
day_reward({303, 5}) -> [{22, 211200}, {1, 171000}];
day_reward({304, 5}) -> [{22, 211800}, {1, 171500}];
day_reward({305, 5}) -> [{22, 212400}, {1, 172000}];
day_reward({306, 5}) -> [{22, 213000}, {1, 172500}];
day_reward({307, 5}) -> [{22, 213600}, {1, 173000}];
day_reward({308, 5}) -> [{22, 214200}, {1, 173500}];
day_reward({309, 5}) -> [{22, 214800}, {1, 174000}];
day_reward({310, 5}) -> [{22, 215400}, {1, 174500}];
day_reward({311, 5}) -> [{22, 216000}, {1, 175000}];
day_reward({312, 5}) -> [{22, 216600}, {1, 175500}];
day_reward({313, 5}) -> [{22, 217200}, {1, 176000}];
day_reward({314, 5}) -> [{22, 217800}, {1, 176500}];
day_reward({315, 5}) -> [{22, 218400}, {1, 177000}];
day_reward({316, 5}) -> [{22, 219000}, {1, 177500}];
day_reward({317, 5}) -> [{22, 219600}, {1, 178000}];
day_reward({318, 5}) -> [{22, 220200}, {1, 178500}];
day_reward({319, 5}) -> [{22, 220800}, {1, 179000}];
day_reward({320, 5}) -> [{22, 221400}, {1, 179500}];
day_reward({321, 5}) -> [{22, 222000}, {1, 180000}];
day_reward({322, 5}) -> [{22, 222600}, {1, 180500}];
day_reward({323, 5}) -> [{22, 223200}, {1, 181000}];
day_reward({324, 5}) -> [{22, 223800}, {1, 181500}];
day_reward({325, 5}) -> [{22, 224400}, {1, 182000}];
day_reward({326, 5}) -> [{22, 225000}, {1, 182500}];
day_reward({327, 5}) -> [{22, 225600}, {1, 183000}];
day_reward({328, 5}) -> [{22, 226200}, {1, 183500}];
day_reward({329, 5}) -> [{22, 226800}, {1, 184000}];
day_reward({330, 5}) -> [{22, 227400}, {1, 184500}];
day_reward({331, 5}) -> [{22, 228000}, {1, 185000}];
day_reward({332, 5}) -> [{22, 228600}, {1, 185500}];
day_reward({333, 5}) -> [{22, 229200}, {1, 186000}];
day_reward({334, 5}) -> [{22, 229800}, {1, 186500}];
day_reward({335, 5}) -> [{22, 230400}, {1, 187000}];
day_reward({336, 5}) -> [{22, 231000}, {1, 187500}];
day_reward({337, 5}) -> [{22, 231600}, {1, 188000}];
day_reward({338, 5}) -> [{22, 232200}, {1, 188500}];
day_reward({339, 5}) -> [{22, 232800}, {1, 189000}];
day_reward({340, 5}) -> [{22, 233400}, {1, 189500}];
day_reward({341, 5}) -> [{22, 234000}, {1, 190000}];
day_reward({342, 5}) -> [{22, 234600}, {1, 190500}];
day_reward({343, 5}) -> [{22, 235200}, {1, 191000}];
day_reward({344, 5}) -> [{22, 235800}, {1, 191500}];
day_reward({345, 5}) -> [{22, 236400}, {1, 192000}];
day_reward({346, 5}) -> [{22, 237000}, {1, 192500}];
day_reward({347, 5}) -> [{22, 237600}, {1, 193000}];
day_reward({348, 5}) -> [{22, 238200}, {1, 193500}];
day_reward({349, 5}) -> [{22, 238800}, {1, 194000}];
day_reward({350, 5}) -> [{22, 239400}, {1, 194500}];
day_reward({351, 5}) -> [{22, 240000}, {1, 195000}];
day_reward({352, 5}) -> [{22, 240600}, {1, 195500}];
day_reward({353, 5}) -> [{22, 241200}, {1, 196000}];
day_reward({354, 5}) -> [{22, 241800}, {1, 196500}];
day_reward({355, 5}) -> [{22, 242400}, {1, 197000}];
day_reward({356, 5}) -> [{22, 243000}, {1, 197500}];
day_reward({357, 5}) -> [{22, 243600}, {1, 198000}];
day_reward({358, 5}) -> [{22, 244200}, {1, 198500}];
day_reward({359, 5}) -> [{22, 244800}, {1, 199000}];
day_reward({360, 5}) -> [{22, 245400}, {1, 199500}];
day_reward({361, 5}) -> [{22, 246000}, {1, 200000}];
day_reward({362, 5}) -> [{22, 246600}, {1, 200500}];
day_reward({363, 5}) -> [{22, 247200}, {1, 201000}];
day_reward({364, 5}) -> [{22, 247800}, {1, 201500}];
day_reward({365, 5}) -> [{22, 248400}, {1, 202000}];
day_reward({366, 5}) -> [{22, 249000}, {1, 202500}];
day_reward({367, 5}) -> [{22, 249600}, {1, 203000}];
day_reward({368, 5}) -> [{22, 250200}, {1, 203500}];
day_reward({369, 5}) -> [{22, 250800}, {1, 204000}];
day_reward({370, 5}) -> [{22, 251400}, {1, 204500}];
day_reward({371, 5}) -> [{22, 252000}, {1, 205000}];
day_reward({372, 5}) -> [{22, 252600}, {1, 205500}];
day_reward({373, 5}) -> [{22, 253200}, {1, 206000}];
day_reward({374, 5}) -> [{22, 253800}, {1, 206500}];
day_reward({375, 5}) -> [{22, 254400}, {1, 207000}];
day_reward({376, 5}) -> [{22, 255000}, {1, 207500}];
day_reward({377, 5}) -> [{22, 255600}, {1, 208000}];
day_reward({378, 5}) -> [{22, 256200}, {1, 208500}];
day_reward({379, 5}) -> [{22, 256800}, {1, 209000}];
day_reward({380, 5}) -> [{22, 257400}, {1, 209500}];
day_reward({381, 5}) -> [{22, 258000}, {1, 210000}];
day_reward({382, 5}) -> [{22, 258600}, {1, 210500}];
day_reward({383, 5}) -> [{22, 259200}, {1, 211000}];
day_reward({384, 5}) -> [{22, 259800}, {1, 211500}];
day_reward({385, 5}) -> [{22, 260400}, {1, 212000}];
day_reward({386, 5}) -> [{22, 261000}, {1, 212500}];
day_reward({387, 5}) -> [{22, 261600}, {1, 213000}];
day_reward({388, 5}) -> [{22, 262200}, {1, 213500}];
day_reward({389, 5}) -> [{22, 262800}, {1, 214000}];
day_reward({390, 5}) -> [{22, 263400}, {1, 214500}];
day_reward({391, 5}) -> [{22, 264000}, {1, 215000}];
day_reward({392, 5}) -> [{22, 264600}, {1, 215500}];
day_reward({393, 5}) -> [{22, 265200}, {1, 216000}];
day_reward({394, 5}) -> [{22, 265800}, {1, 216500}];
day_reward({395, 5}) -> [{22, 266400}, {1, 217000}];
day_reward({396, 5}) -> [{22, 267000}, {1, 217500}];
day_reward({397, 5}) -> [{22, 267600}, {1, 218000}];
day_reward({398, 5}) -> [{22, 268200}, {1, 218500}];
day_reward({399, 5}) -> [{22, 268800}, {1, 219000}];
day_reward({400, 5}) -> [{22, 269400}, {1, 219500}];
day_reward({401, 5}) -> [{22, 270000}, {1, 220000}];
day_reward({402, 5}) -> [{22, 270600}, {1, 220500}];
day_reward({403, 5}) -> [{22, 271200}, {1, 221000}];
day_reward({404, 5}) -> [{22, 271800}, {1, 221500}];
day_reward({405, 5}) -> [{22, 272400}, {1, 222000}];
day_reward({406, 5}) -> [{22, 273000}, {1, 222500}];
day_reward({407, 5}) -> [{22, 273600}, {1, 223000}];
day_reward({408, 5}) -> [{22, 274200}, {1, 223500}];
day_reward({409, 5}) -> [{22, 274800}, {1, 224000}];
day_reward({410, 5}) -> [{22, 275400}, {1, 224500}];
day_reward({411, 5}) -> [{22, 276000}, {1, 225000}];
day_reward({412, 5}) -> [{22, 276600}, {1, 225500}];
day_reward({413, 5}) -> [{22, 277200}, {1, 226000}];
day_reward({414, 5}) -> [{22, 277800}, {1, 226500}];
day_reward({415, 5}) -> [{22, 278400}, {1, 227000}];
day_reward({416, 5}) -> [{22, 279000}, {1, 227500}];
day_reward({417, 5}) -> [{22, 279600}, {1, 228000}];
day_reward({418, 5}) -> [{22, 280200}, {1, 228500}];
day_reward({419, 5}) -> [{22, 280800}, {1, 229000}];
day_reward({420, 5}) -> [{22, 281400}, {1, 229500}];
day_reward({421, 5}) -> [{22, 282000}, {1, 230000}];
day_reward({422, 5}) -> [{22, 282600}, {1, 230500}];
day_reward({423, 5}) -> [{22, 283200}, {1, 231000}];
day_reward({424, 5}) -> [{22, 283800}, {1, 231500}];
day_reward({425, 5}) -> [{22, 284400}, {1, 232000}];
day_reward({426, 5}) -> [{22, 285000}, {1, 232500}];
day_reward({427, 5}) -> [{22, 285600}, {1, 233000}];
day_reward({428, 5}) -> [{22, 286200}, {1, 233500}];
day_reward({429, 5}) -> [{22, 286800}, {1, 234000}];
day_reward({430, 5}) -> [{22, 287400}, {1, 234500}];
day_reward({431, 5}) -> [{22, 288000}, {1, 235000}];
day_reward({432, 5}) -> [{22, 288600}, {1, 235500}];
day_reward({433, 5}) -> [{22, 289200}, {1, 236000}];
day_reward({434, 5}) -> [{22, 289800}, {1, 236500}];
day_reward({435, 5}) -> [{22, 290400}, {1, 237000}];
day_reward({436, 5}) -> [{22, 291000}, {1, 237500}];
day_reward({437, 5}) -> [{22, 291600}, {1, 238000}];
day_reward({438, 5}) -> [{22, 292200}, {1, 238500}];
day_reward({439, 5}) -> [{22, 292800}, {1, 239000}];
day_reward({440, 5}) -> [{22, 293400}, {1, 239500}];
day_reward({441, 5}) -> [{22, 294000}, {1, 240000}];
day_reward({442, 5}) -> [{22, 294600}, {1, 240500}];
day_reward({443, 5}) -> [{22, 295200}, {1, 241000}];
day_reward({444, 5}) -> [{22, 295800}, {1, 241500}];
day_reward({445, 5}) -> [{22, 296400}, {1, 242000}];
day_reward({446, 5}) -> [{22, 297000}, {1, 242500}];
day_reward({447, 5}) -> [{22, 297600}, {1, 243000}];
day_reward({448, 5}) -> [{22, 298200}, {1, 243500}];
day_reward({449, 5}) -> [{22, 298800}, {1, 244000}];
day_reward({450, 5}) -> [{22, 299400}, {1, 244500}];
day_reward({451, 5}) -> [{22, 300000}, {1, 245000}];
day_reward({452, 5}) -> [{22, 300600}, {1, 245500}];
day_reward({453, 5}) -> [{22, 301200}, {1, 246000}];
day_reward({454, 5}) -> [{22, 301800}, {1, 246500}];
day_reward({455, 5}) -> [{22, 302400}, {1, 247000}];
day_reward({456, 5}) -> [{22, 303000}, {1, 247500}];
day_reward({457, 5}) -> [{22, 303600}, {1, 248000}];
day_reward({458, 5}) -> [{22, 304200}, {1, 248500}];
day_reward({459, 5}) -> [{22, 304800}, {1, 249000}];
day_reward({460, 5}) -> [{22, 305400}, {1, 249500}];
day_reward({461, 5}) -> [{22, 306000}, {1, 250000}];
day_reward({462, 5}) -> [{22, 306600}, {1, 250500}];
day_reward({463, 5}) -> [{22, 307200}, {1, 251000}];
day_reward({464, 5}) -> [{22, 307800}, {1, 251500}];
day_reward({465, 5}) -> [{22, 308400}, {1, 252000}];
day_reward({466, 5}) -> [{22, 309000}, {1, 252500}];
day_reward({467, 5}) -> [{22, 309600}, {1, 253000}];
day_reward({468, 5}) -> [{22, 310200}, {1, 253500}];
day_reward({469, 5}) -> [{22, 310800}, {1, 254000}];
day_reward({470, 5}) -> [{22, 311400}, {1, 254500}];
day_reward({471, 5}) -> [{22, 312000}, {1, 255000}];
day_reward({472, 5}) -> [{22, 312600}, {1, 255500}];
day_reward({473, 5}) -> [{22, 313200}, {1, 256000}];
day_reward({474, 5}) -> [{22, 313800}, {1, 256500}];
day_reward({475, 5}) -> [{22, 314400}, {1, 257000}];
day_reward({476, 5}) -> [{22, 315000}, {1, 257500}];
day_reward({477, 5}) -> [{22, 315600}, {1, 258000}];
day_reward({478, 5}) -> [{22, 316200}, {1, 258500}];
day_reward({479, 5}) -> [{22, 316800}, {1, 259000}];
day_reward({480, 5}) -> [{22, 317400}, {1, 259500}];
day_reward({481, 5}) -> [{22, 318000}, {1, 260000}];
day_reward({482, 5}) -> [{22, 318600}, {1, 260500}];
day_reward({483, 5}) -> [{22, 319200}, {1, 261000}];
day_reward({484, 5}) -> [{22, 319800}, {1, 261500}];
day_reward({485, 5}) -> [{22, 320400}, {1, 262000}];
day_reward({486, 5}) -> [{22, 321000}, {1, 262500}];
day_reward({487, 5}) -> [{22, 321600}, {1, 263000}];
day_reward({488, 5}) -> [{22, 322200}, {1, 263500}];
day_reward({489, 5}) -> [{22, 322800}, {1, 264000}];
day_reward({490, 5}) -> [{22, 323400}, {1, 264500}];
day_reward({491, 5}) -> [{22, 324000}, {1, 265000}];
day_reward({492, 5}) -> [{22, 324600}, {1, 265500}];
day_reward({493, 5}) -> [{22, 325200}, {1, 266000}];
day_reward({494, 5}) -> [{22, 325800}, {1, 266500}];
day_reward({495, 5}) -> [{22, 326400}, {1, 267000}];
day_reward({496, 5}) -> [{22, 327000}, {1, 267500}];
day_reward({497, 5}) -> [{22, 327600}, {1, 268000}];
day_reward({498, 5}) -> [{22, 328200}, {1, 268500}];
day_reward({499, 5}) -> [{22, 328800}, {1, 269000}];
day_reward({500, 5}) -> [{22, 329400}, {1, 269500}];
day_reward({501, 5}) -> [{22, 330000}, {1, 270000}];
day_reward({502, 5}) -> [{22, 330600}, {1, 270500}];
day_reward({503, 5}) -> [{22, 331200}, {1, 271000}];
day_reward({504, 5}) -> [{22, 331800}, {1, 271500}];
day_reward({505, 5}) -> [{22, 332400}, {1, 272000}];
day_reward({506, 5}) -> [{22, 333000}, {1, 272500}];
day_reward({507, 5}) -> [{22, 333600}, {1, 273000}];
day_reward({508, 5}) -> [{22, 334200}, {1, 273500}];
day_reward({509, 5}) -> [{22, 334800}, {1, 274000}];
day_reward({510, 5}) -> [{22, 335400}, {1, 274500}];
day_reward({511, 5}) -> [{22, 336000}, {1, 275000}];
day_reward({512, 5}) -> [{22, 336600}, {1, 275500}];
day_reward({513, 5}) -> [{22, 337200}, {1, 276000}];
day_reward({514, 5}) -> [{22, 337800}, {1, 276500}];
day_reward({515, 5}) -> [{22, 338400}, {1, 277000}];
day_reward({516, 5}) -> [{22, 339000}, {1, 277500}];
day_reward({517, 5}) -> [{22, 339600}, {1, 278000}];
day_reward({518, 5}) -> [{22, 340200}, {1, 278500}];
day_reward({519, 5}) -> [{22, 340800}, {1, 279000}];
day_reward({520, 5}) -> [{22, 341400}, {1, 279500}];
day_reward({521, 5}) -> [{22, 342000}, {1, 280000}];
day_reward({522, 5}) -> [{22, 342600}, {1, 280500}];
day_reward({523, 5}) -> [{22, 343200}, {1, 281000}];
day_reward({524, 5}) -> [{22, 343800}, {1, 281500}];
day_reward({525, 5}) -> [{22, 344400}, {1, 282000}];
day_reward({526, 5}) -> [{22, 345000}, {1, 282500}];
day_reward({527, 5}) -> [{22, 345600}, {1, 283000}];
day_reward({528, 5}) -> [{22, 346200}, {1, 283500}];
day_reward({529, 5}) -> [{22, 346800}, {1, 284000}];
day_reward({530, 5}) -> [{22, 347400}, {1, 284500}];
day_reward({531, 5}) -> [{22, 348000}, {1, 285000}];
day_reward({532, 5}) -> [{22, 348600}, {1, 285500}];
day_reward({533, 5}) -> [{22, 349200}, {1, 286000}];
day_reward({534, 5}) -> [{22, 349800}, {1, 286500}];
day_reward({535, 5}) -> [{22, 350400}, {1, 287000}];
day_reward({536, 5}) -> [{22, 351000}, {1, 287500}];
day_reward({537, 5}) -> [{22, 351600}, {1, 288000}];
day_reward({538, 5}) -> [{22, 352200}, {1, 288500}];
day_reward({539, 5}) -> [{22, 352800}, {1, 289000}];
day_reward({540, 5}) -> [{22, 353400}, {1, 289500}];
day_reward({541, 5}) -> [{22, 354000}, {1, 290000}];
day_reward({542, 5}) -> [{22, 354600}, {1, 290500}];
day_reward({543, 5}) -> [{22, 355200}, {1, 291000}];
day_reward({544, 5}) -> [{22, 355800}, {1, 291500}];
day_reward({545, 5}) -> [{22, 356400}, {1, 292000}];
day_reward({546, 5}) -> [{22, 357000}, {1, 292500}];
day_reward({547, 5}) -> [{22, 357600}, {1, 293000}];
day_reward({548, 5}) -> [{22, 358200}, {1, 293500}];
day_reward({549, 5}) -> [{22, 358800}, {1, 294000}];
day_reward({550, 5}) -> [{22, 359400}, {1, 294500}];
day_reward({551, 5}) -> [{22, 360000}, {1, 295000}];
day_reward({552, 5}) -> [{22, 360600}, {1, 295500}];
day_reward({553, 5}) -> [{22, 361200}, {1, 296000}];
day_reward({554, 5}) -> [{22, 361800}, {1, 296500}];
day_reward({555, 5}) -> [{22, 362400}, {1, 297000}];
day_reward({556, 5}) -> [{22, 363000}, {1, 297500}];
day_reward({557, 5}) -> [{22, 363600}, {1, 298000}];
day_reward({558, 5}) -> [{22, 364200}, {1, 298500}];
day_reward({559, 5}) -> [{22, 364800}, {1, 299000}];
day_reward({560, 5}) -> [{22, 365400}, {1, 299500}];
day_reward({561, 5}) -> [{22, 366000}, {1, 300000}];
day_reward({562, 5}) -> [{22, 366600}, {1, 300500}];
day_reward({563, 5}) -> [{22, 367200}, {1, 301000}];
day_reward({564, 5}) -> [{22, 367800}, {1, 301500}];
day_reward({565, 5}) -> [{22, 368400}, {1, 302000}];
day_reward({566, 5}) -> [{22, 369000}, {1, 302500}];
day_reward({567, 5}) -> [{22, 369600}, {1, 303000}];
day_reward({568, 5}) -> [{22, 370200}, {1, 303500}];
day_reward({569, 5}) -> [{22, 370800}, {1, 304000}];
day_reward({570, 5}) -> [{22, 371400}, {1, 304500}];
day_reward({571, 5}) -> [{22, 372000}, {1, 305000}];
day_reward({572, 5}) -> [{22, 372600}, {1, 305500}];
day_reward({573, 5}) -> [{22, 373200}, {1, 306000}];
day_reward({574, 5}) -> [{22, 373800}, {1, 306500}];
day_reward({575, 5}) -> [{22, 374400}, {1, 307000}];
day_reward({576, 5}) -> [{22, 375000}, {1, 307500}];
day_reward({577, 5}) -> [{22, 375600}, {1, 308000}];
day_reward({578, 5}) -> [{22, 376200}, {1, 308500}];
day_reward({579, 5}) -> [{22, 376800}, {1, 309000}];
day_reward({580, 5}) -> [{22, 377400}, {1, 309500}];
day_reward({581, 5}) -> [{22, 378000}, {1, 310000}];
day_reward({582, 5}) -> [{22, 378600}, {1, 310500}];
day_reward({583, 5}) -> [{22, 379200}, {1, 311000}];
day_reward({584, 5}) -> [{22, 379800}, {1, 311500}];
day_reward({585, 5}) -> [{22, 380400}, {1, 312000}];
day_reward({586, 5}) -> [{22, 381000}, {1, 312500}];
day_reward({587, 5}) -> [{22, 381600}, {1, 313000}];
day_reward({588, 5}) -> [{22, 382200}, {1, 313500}];
day_reward({589, 5}) -> [{22, 382800}, {1, 314000}];
day_reward({590, 5}) -> [{22, 383400}, {1, 314500}];
day_reward({591, 5}) -> [{22, 384000}, {1, 315000}];
day_reward({592, 5}) -> [{22, 384600}, {1, 315500}];
day_reward({593, 5}) -> [{22, 385200}, {1, 316000}];
day_reward({594, 5}) -> [{22, 385800}, {1, 316500}];
day_reward({595, 5}) -> [{22, 386400}, {1, 317000}];
day_reward({596, 5}) -> [{22, 387000}, {1, 317500}];
day_reward({597, 5}) -> [{22, 387600}, {1, 318000}];
day_reward({598, 5}) -> [{22, 388200}, {1, 318500}];
day_reward({599, 5}) -> [{22, 388800}, {1, 319000}];
day_reward({600, 5}) -> [{22, 389400}, {1, 319500}];
day_reward({601, 5}) -> [{22, 390000}, {1, 320000}];
day_reward({602, 5}) -> [{22, 390600}, {1, 320500}];
day_reward({603, 5}) -> [{22, 391200}, {1, 321000}];
day_reward({604, 5}) -> [{22, 391800}, {1, 321500}];
day_reward({605, 5}) -> [{22, 392400}, {1, 322000}];
day_reward({606, 5}) -> [{22, 393000}, {1, 322500}];
day_reward({607, 5}) -> [{22, 393600}, {1, 323000}];
day_reward({608, 5}) -> [{22, 394200}, {1, 323500}];
day_reward({609, 5}) -> [{22, 394800}, {1, 324000}];
day_reward({610, 5}) -> [{22, 395400}, {1, 324500}];
day_reward({611, 5}) -> [{22, 396000}, {1, 325000}];
day_reward({612, 5}) -> [{22, 396600}, {1, 325500}];
day_reward({613, 5}) -> [{22, 397200}, {1, 326000}];
day_reward({614, 5}) -> [{22, 397800}, {1, 326500}];
day_reward({615, 5}) -> [{22, 398400}, {1, 327000}];
day_reward({616, 5}) -> [{22, 399000}, {1, 327500}];
day_reward({617, 5}) -> [{22, 399600}, {1, 328000}];
day_reward({618, 5}) -> [{22, 400200}, {1, 328500}];
day_reward({619, 5}) -> [{22, 400800}, {1, 329000}];
day_reward({620, 5}) -> [{22, 401400}, {1, 329500}];
day_reward({621, 5}) -> [{22, 402000}, {1, 330000}];
day_reward({622, 5}) -> [{22, 402600}, {1, 330500}];
day_reward({623, 5}) -> [{22, 403200}, {1, 331000}];
day_reward({624, 5}) -> [{22, 403800}, {1, 331500}];
day_reward({625, 5}) -> [{22, 404400}, {1, 332000}];
day_reward({626, 5}) -> [{22, 405000}, {1, 332500}];
day_reward({627, 5}) -> [{22, 405600}, {1, 333000}];
day_reward({628, 5}) -> [{22, 406200}, {1, 333500}];
day_reward({629, 5}) -> [{22, 406800}, {1, 334000}];
day_reward({630, 5}) -> [{22, 407400}, {1, 334500}];
day_reward({631, 5}) -> [{22, 408000}, {1, 335000}];
day_reward({632, 5}) -> [{22, 408600}, {1, 335500}];
day_reward({633, 5}) -> [{22, 409200}, {1, 336000}];
day_reward({634, 5}) -> [{22, 409800}, {1, 336500}];
day_reward({635, 5}) -> [{22, 410400}, {1, 337000}];
day_reward({636, 5}) -> [{22, 411000}, {1, 337500}];
day_reward({637, 5}) -> [{22, 411600}, {1, 338000}];
day_reward({638, 5}) -> [{22, 412200}, {1, 338500}];
day_reward({639, 5}) -> [{22, 412800}, {1, 339000}];
day_reward({640, 5}) -> [{22, 413400}, {1, 339500}];
day_reward({641, 5}) -> [{22, 414000}, {1, 340000}];
day_reward({642, 5}) -> [{22, 414600}, {1, 340500}];
day_reward({643, 5}) -> [{22, 415200}, {1, 341000}];
day_reward({644, 5}) -> [{22, 415800}, {1, 341500}];
day_reward({645, 5}) -> [{22, 416400}, {1, 342000}];
day_reward({646, 5}) -> [{22, 417000}, {1, 342500}];
day_reward({647, 5}) -> [{22, 417600}, {1, 343000}];
day_reward({648, 5}) -> [{22, 418200}, {1, 343500}];
day_reward({649, 5}) -> [{22, 418800}, {1, 344000}];
day_reward({650, 5}) -> [{22, 419400}, {1, 344500}];
day_reward({651, 5}) -> [{22, 420000}, {1, 345000}];
day_reward({652, 5}) -> [{22, 420600}, {1, 345500}];
day_reward({653, 5}) -> [{22, 421200}, {1, 346000}];
day_reward({654, 5}) -> [{22, 421800}, {1, 346500}];
day_reward({655, 5}) -> [{22, 422400}, {1, 347000}];
day_reward({656, 5}) -> [{22, 423000}, {1, 347500}];
day_reward({657, 5}) -> [{22, 423600}, {1, 348000}];
day_reward({658, 5}) -> [{22, 424200}, {1, 348500}];
day_reward({659, 5}) -> [{22, 424800}, {1, 349000}];
day_reward({660, 5}) -> [{22, 425400}, {1, 349500}];
day_reward({661, 5}) -> [{22, 426000}, {1, 350000}];
day_reward({662, 5}) -> [{22, 426600}, {1, 350500}];
day_reward({663, 5}) -> [{22, 427200}, {1, 351000}];
day_reward({664, 5}) -> [{22, 427800}, {1, 351500}];
day_reward({665, 5}) -> [{22, 428400}, {1, 352000}];
day_reward({666, 5}) -> [{22, 429000}, {1, 352500}];
day_reward({667, 5}) -> [{22, 429600}, {1, 353000}];
day_reward({668, 5}) -> [{22, 430200}, {1, 353500}];
day_reward({669, 5}) -> [{22, 430800}, {1, 354000}];
day_reward({670, 5}) -> [{22, 431400}, {1, 354500}];
day_reward({671, 5}) -> [{22, 432000}, {1, 355000}];
day_reward({672, 5}) -> [{22, 432600}, {1, 355500}];
day_reward({673, 5}) -> [{22, 433200}, {1, 356000}];
day_reward({674, 5}) -> [{22, 433800}, {1, 356500}];
day_reward({675, 5}) -> [{22, 434400}, {1, 357000}];
day_reward({676, 5}) -> [{22, 435000}, {1, 357500}];
day_reward({677, 5}) -> [{22, 435600}, {1, 358000}];
day_reward({678, 5}) -> [{22, 436200}, {1, 358500}];
day_reward({679, 5}) -> [{22, 436800}, {1, 359000}];
day_reward({680, 5}) -> [{22, 437400}, {1, 359500}];
day_reward({681, 5}) -> [{22, 438000}, {1, 360000}];
day_reward({682, 5}) -> [{22, 438600}, {1, 360500}];
day_reward({683, 5}) -> [{22, 439200}, {1, 361000}];
day_reward({684, 5}) -> [{22, 439800}, {1, 361500}];
day_reward({685, 5}) -> [{22, 440400}, {1, 362000}];
day_reward({686, 5}) -> [{22, 441000}, {1, 362500}];
day_reward({687, 5}) -> [{22, 441600}, {1, 363000}];
day_reward({688, 5}) -> [{22, 442200}, {1, 363500}];
day_reward({689, 5}) -> [{22, 442800}, {1, 364000}];
day_reward({690, 5}) -> [{22, 443400}, {1, 364500}];
day_reward({691, 5}) -> [{22, 444000}, {1, 365000}];
day_reward({692, 5}) -> [{22, 444600}, {1, 365500}];
day_reward({693, 5}) -> [{22, 445200}, {1, 366000}];
day_reward({694, 5}) -> [{22, 445800}, {1, 366500}];
day_reward({695, 5}) -> [{22, 446400}, {1, 367000}];
day_reward({696, 5}) -> [{22, 447000}, {1, 367500}];
day_reward({697, 5}) -> [{22, 447600}, {1, 368000}];
day_reward({698, 5}) -> [{22, 448200}, {1, 368500}];
day_reward({699, 5}) -> [{22, 448800}, {1, 369000}];
day_reward({700, 5}) -> [{22, 449400}, {1, 369500}];
day_reward({701, 5}) -> [{22, 450000}, {1, 370000}];
day_reward({702, 5}) -> [{22, 450600}, {1, 370500}];
day_reward({703, 5}) -> [{22, 451200}, {1, 371000}];
day_reward({704, 5}) -> [{22, 451800}, {1, 371500}];
day_reward({705, 5}) -> [{22, 452400}, {1, 372000}];
day_reward({706, 5}) -> [{22, 453000}, {1, 372500}];
day_reward({707, 5}) -> [{22, 453600}, {1, 373000}];
day_reward({708, 5}) -> [{22, 454200}, {1, 373500}];
day_reward({709, 5}) -> [{22, 454800}, {1, 374000}];
day_reward({710, 5}) -> [{22, 455400}, {1, 374500}];
day_reward({711, 5}) -> [{22, 456000}, {1, 375000}];
day_reward({712, 5}) -> [{22, 456600}, {1, 375500}];
day_reward({713, 5}) -> [{22, 457200}, {1, 376000}];
day_reward({714, 5}) -> [{22, 457800}, {1, 376500}];
day_reward({715, 5}) -> [{22, 458400}, {1, 377000}];
day_reward({716, 5}) -> [{22, 459000}, {1, 377500}];
day_reward({717, 5}) -> [{22, 459600}, {1, 378000}];
day_reward({718, 5}) -> [{22, 460200}, {1, 378500}];
day_reward({719, 5}) -> [{22, 460800}, {1, 379000}];
day_reward({720, 5}) -> [{22, 461400}, {1, 379500}];
day_reward({721, 5}) -> [{22, 462000}, {1, 380000}];
day_reward({722, 5}) -> [{22, 462600}, {1, 380500}];
day_reward({723, 5}) -> [{22, 463200}, {1, 381000}];
day_reward({724, 5}) -> [{22, 463800}, {1, 381500}];
day_reward({725, 5}) -> [{22, 464400}, {1, 382000}];
day_reward({726, 5}) -> [{22, 465000}, {1, 382500}];
day_reward({727, 5}) -> [{22, 465600}, {1, 383000}];
day_reward({728, 5}) -> [{22, 466200}, {1, 383500}];
day_reward({729, 5}) -> [{22, 466800}, {1, 384000}];
day_reward({730, 5}) -> [{22, 467400}, {1, 384500}];
day_reward({731, 5}) -> [{22, 468000}, {1, 385000}];
day_reward({732, 5}) -> [{22, 468600}, {1, 385500}];
day_reward({733, 5}) -> [{22, 469200}, {1, 386000}];
day_reward({734, 5}) -> [{22, 469800}, {1, 386500}];
day_reward({735, 5}) -> [{22, 470400}, {1, 387000}];
day_reward({736, 5}) -> [{22, 471000}, {1, 387500}];
day_reward({737, 5}) -> [{22, 471600}, {1, 388000}];
day_reward({738, 5}) -> [{22, 472200}, {1, 388500}];
day_reward({739, 5}) -> [{22, 472800}, {1, 389000}];
day_reward({740, 5}) -> [{22, 473400}, {1, 389500}];
day_reward({741, 5}) -> [{22, 474000}, {1, 390000}];
day_reward({742, 5}) -> [{22, 474600}, {1, 390500}];
day_reward({743, 5}) -> [{22, 475200}, {1, 391000}];
day_reward({744, 5}) -> [{22, 475800}, {1, 391500}];
day_reward({745, 5}) -> [{22, 476400}, {1, 392000}];
day_reward({746, 5}) -> [{22, 477000}, {1, 392500}];
day_reward({747, 5}) -> [{22, 477600}, {1, 393000}];
day_reward({748, 5}) -> [{22, 478200}, {1, 393500}];
day_reward({749, 5}) -> [{22, 478800}, {1, 394000}];
day_reward({750, 5}) -> [{22, 479400}, {1, 394500}];
day_reward({751, 5}) -> [{22, 480000}, {1, 395000}];
day_reward({752, 5}) -> [{22, 480600}, {1, 395500}];
day_reward({753, 5}) -> [{22, 481200}, {1, 396000}];
day_reward({754, 5}) -> [{22, 481800}, {1, 396500}];
day_reward({755, 5}) -> [{22, 482400}, {1, 397000}];
day_reward({756, 5}) -> [{22, 483000}, {1, 397500}];
day_reward({757, 5}) -> [{22, 483600}, {1, 398000}];
day_reward({758, 5}) -> [{22, 484200}, {1, 398500}];
day_reward({759, 5}) -> [{22, 484800}, {1, 399000}];
day_reward({760, 5}) -> [{22, 485400}, {1, 399500}];
day_reward({761, 5}) -> [{22, 486000}, {1, 400000}];
day_reward({762, 5}) -> [{22, 486600}, {1, 400500}];
day_reward({763, 5}) -> [{22, 487200}, {1, 401000}];
day_reward({764, 5}) -> [{22, 487800}, {1, 401500}];
day_reward({765, 5}) -> [{22, 488400}, {1, 402000}];
day_reward({766, 5}) -> [{22, 489000}, {1, 402500}];
day_reward({767, 5}) -> [{22, 489600}, {1, 403000}];
day_reward({768, 5}) -> [{22, 490200}, {1, 403500}];
day_reward({769, 5}) -> [{22, 490800}, {1, 404000}];
day_reward({770, 5}) -> [{22, 491400}, {1, 404500}];
day_reward({771, 5}) -> [{22, 492000}, {1, 405000}];
day_reward({772, 5}) -> [{22, 492600}, {1, 405500}];
day_reward({773, 5}) -> [{22, 493200}, {1, 406000}];
day_reward({774, 5}) -> [{22, 493800}, {1, 406500}];
day_reward({775, 5}) -> [{22, 494400}, {1, 407000}];
day_reward({776, 5}) -> [{22, 495000}, {1, 407500}];
day_reward({777, 5}) -> [{22, 495600}, {1, 408000}];
day_reward({778, 5}) -> [{22, 496200}, {1, 408500}];
day_reward({779, 5}) -> [{22, 496800}, {1, 409000}];
day_reward({780, 5}) -> [{22, 497400}, {1, 409500}];
day_reward({781, 5}) -> [{22, 498000}, {1, 410000}];
day_reward({782, 5}) -> [{22, 498600}, {1, 410500}];
day_reward({783, 5}) -> [{22, 499200}, {1, 411000}];
day_reward({784, 5}) -> [{22, 499800}, {1, 411500}];
day_reward({785, 5}) -> [{22, 500400}, {1, 412000}];
day_reward({786, 5}) -> [{22, 501000}, {1, 412500}];
day_reward({787, 5}) -> [{22, 501600}, {1, 413000}];
day_reward({788, 5}) -> [{22, 502200}, {1, 413500}];
day_reward({789, 5}) -> [{22, 502800}, {1, 414000}];
day_reward({790, 5}) -> [{22, 503400}, {1, 414500}];
day_reward({791, 5}) -> [{22, 504000}, {1, 415000}];
day_reward({792, 5}) -> [{22, 504600}, {1, 415500}];
day_reward({793, 5}) -> [{22, 505200}, {1, 416000}];
day_reward({794, 5}) -> [{22, 505800}, {1, 416500}];
day_reward({795, 5}) -> [{22, 506400}, {1, 417000}];
day_reward({796, 5}) -> [{22, 507000}, {1, 417500}];
day_reward({797, 5}) -> [{22, 507600}, {1, 418000}];
day_reward({798, 5}) -> [{22, 508200}, {1, 418500}];
day_reward({799, 5}) -> [{22, 508800}, {1, 419000}];
day_reward({800, 5}) -> [{22, 509400}, {1, 419500}];
day_reward({801, 5}) -> [{22, 510000}, {1, 420000}];
day_reward({802, 5}) -> [{22, 510600}, {1, 420500}];
day_reward({803, 5}) -> [{22, 511200}, {1, 421000}];
day_reward({804, 5}) -> [{22, 511800}, {1, 421500}];
day_reward({805, 5}) -> [{22, 512400}, {1, 422000}];
day_reward({806, 5}) -> [{22, 513000}, {1, 422500}];
day_reward({807, 5}) -> [{22, 513600}, {1, 423000}];
day_reward({808, 5}) -> [{22, 514200}, {1, 423500}];
day_reward({809, 5}) -> [{22, 514800}, {1, 424000}];
day_reward({810, 5}) -> [{22, 515400}, {1, 424500}];
day_reward({811, 5}) -> [{22, 516000}, {1, 425000}];
day_reward({812, 5}) -> [{22, 516600}, {1, 425500}];
day_reward({813, 5}) -> [{22, 517200}, {1, 426000}];
day_reward({814, 5}) -> [{22, 517800}, {1, 426500}];
day_reward({815, 5}) -> [{22, 518400}, {1, 427000}];
day_reward({816, 5}) -> [{22, 519000}, {1, 427500}];
day_reward({817, 5}) -> [{22, 519600}, {1, 428000}];
day_reward({818, 5}) -> [{22, 520200}, {1, 428500}];
day_reward({819, 5}) -> [{22, 520800}, {1, 429000}];
day_reward({820, 5}) -> [{22, 521400}, {1, 429500}];
day_reward({821, 5}) -> [{22, 522000}, {1, 430000}];
day_reward({822, 5}) -> [{22, 522600}, {1, 430500}];
day_reward({823, 5}) -> [{22, 523200}, {1, 431000}];
day_reward({824, 5}) -> [{22, 523800}, {1, 431500}];
day_reward({825, 5}) -> [{22, 524400}, {1, 432000}];
day_reward({826, 5}) -> [{22, 525000}, {1, 432500}];
day_reward({827, 5}) -> [{22, 525600}, {1, 433000}];
day_reward({828, 5}) -> [{22, 526200}, {1, 433500}];
day_reward({829, 5}) -> [{22, 526800}, {1, 434000}];
day_reward({830, 5}) -> [{22, 527400}, {1, 434500}];
day_reward({831, 5}) -> [{22, 528000}, {1, 435000}];
day_reward({832, 5}) -> [{22, 528600}, {1, 435500}];
day_reward({833, 5}) -> [{22, 529200}, {1, 436000}];
day_reward({834, 5}) -> [{22, 529800}, {1, 436500}];
day_reward({835, 5}) -> [{22, 530400}, {1, 437000}];
day_reward({836, 5}) -> [{22, 531000}, {1, 437500}];
day_reward({837, 5}) -> [{22, 531600}, {1, 438000}];
day_reward({838, 5}) -> [{22, 532200}, {1, 438500}];
day_reward({839, 5}) -> [{22, 532800}, {1, 439000}];
day_reward({840, 5}) -> [{22, 533400}, {1, 439500}];
day_reward({841, 5}) -> [{22, 534000}, {1, 440000}];
day_reward({842, 5}) -> [{22, 534600}, {1, 440500}];
day_reward({843, 5}) -> [{22, 535200}, {1, 441000}];
day_reward({844, 5}) -> [{22, 535800}, {1, 441500}];
day_reward({845, 5}) -> [{22, 536400}, {1, 442000}];
day_reward({846, 5}) -> [{22, 537000}, {1, 442500}];
day_reward({847, 5}) -> [{22, 537600}, {1, 443000}];
day_reward({848, 5}) -> [{22, 538200}, {1, 443500}];
day_reward({849, 5}) -> [{22, 538800}, {1, 444000}];
day_reward({850, 5}) -> [{22, 539400}, {1, 444500}];
day_reward({851, 5}) -> [{22, 540000}, {1, 445000}];
day_reward({852, 5}) -> [{22, 540600}, {1, 445500}];
day_reward({853, 5}) -> [{22, 541200}, {1, 446000}];
day_reward({854, 5}) -> [{22, 541800}, {1, 446500}];
day_reward({855, 5}) -> [{22, 542400}, {1, 447000}];
day_reward({856, 5}) -> [{22, 543000}, {1, 447500}];
day_reward({857, 5}) -> [{22, 543600}, {1, 448000}];
day_reward({858, 5}) -> [{22, 544200}, {1, 448500}];
day_reward({859, 5}) -> [{22, 544800}, {1, 449000}];
day_reward({860, 5}) -> [{22, 545400}, {1, 449500}];
day_reward({861, 5}) -> [{22, 546000}, {1, 450000}];
day_reward({862, 5}) -> [{22, 546600}, {1, 450500}];
day_reward({863, 5}) -> [{22, 547200}, {1, 451000}];
day_reward({864, 5}) -> [{22, 547800}, {1, 451500}];
day_reward({865, 5}) -> [{22, 548400}, {1, 452000}];
day_reward({866, 5}) -> [{22, 549000}, {1, 452500}];
day_reward({867, 5}) -> [{22, 549600}, {1, 453000}];
day_reward({868, 5}) -> [{22, 550200}, {1, 453500}];
day_reward({869, 5}) -> [{22, 550800}, {1, 454000}];
day_reward({870, 5}) -> [{22, 551400}, {1, 454500}];
day_reward({871, 5}) -> [{22, 552000}, {1, 455000}];
day_reward({872, 5}) -> [{22, 552600}, {1, 455500}];
day_reward({873, 5}) -> [{22, 553200}, {1, 456000}];
day_reward({874, 5}) -> [{22, 553800}, {1, 456500}];
day_reward({875, 5}) -> [{22, 554400}, {1, 457000}];
day_reward({876, 5}) -> [{22, 555000}, {1, 457500}];
day_reward({877, 5}) -> [{22, 555600}, {1, 458000}];
day_reward({878, 5}) -> [{22, 556200}, {1, 458500}];
day_reward({879, 5}) -> [{22, 556800}, {1, 459000}];
day_reward({880, 5}) -> [{22, 557400}, {1, 459500}];
day_reward({881, 5}) -> [{22, 558000}, {1, 460000}];
day_reward({882, 5}) -> [{22, 558600}, {1, 460500}];
day_reward({883, 5}) -> [{22, 559200}, {1, 461000}];
day_reward({884, 5}) -> [{22, 559800}, {1, 461500}];
day_reward({885, 5}) -> [{22, 560400}, {1, 462000}];
day_reward({886, 5}) -> [{22, 561000}, {1, 462500}];
day_reward({887, 5}) -> [{22, 561600}, {1, 463000}];
day_reward({888, 5}) -> [{22, 562200}, {1, 463500}];
day_reward({889, 5}) -> [{22, 562800}, {1, 464000}];
day_reward({890, 5}) -> [{22, 563400}, {1, 464500}];
day_reward({891, 5}) -> [{22, 564000}, {1, 465000}];
day_reward({892, 5}) -> [{22, 564600}, {1, 465500}];
day_reward({893, 5}) -> [{22, 565200}, {1, 466000}];
day_reward({894, 5}) -> [{22, 565800}, {1, 466500}];
day_reward({895, 5}) -> [{22, 566400}, {1, 467000}];
day_reward({896, 5}) -> [{22, 567000}, {1, 467500}];
day_reward({897, 5}) -> [{22, 567600}, {1, 468000}];
day_reward({898, 5}) -> [{22, 568200}, {1, 468500}];
day_reward({899, 5}) -> [{22, 568800}, {1, 469000}];
day_reward({900, 5}) -> [{22, 569400}, {1, 469500}];
day_reward({1, 1}) ->
    [{32, 2500}, {1, 120000}, {22, 150000}];
day_reward({2, 1}) ->
    [{32, 2520}, {1, 120500}, {22, 150600}];
day_reward({3, 1}) ->
    [{32, 2540}, {1, 121000}, {22, 151200}];
day_reward({4, 1}) ->
    [{32, 2560}, {1, 121500}, {22, 151800}];
day_reward({5, 1}) ->
    [{32, 2580}, {1, 122000}, {22, 152400}];
day_reward({6, 1}) ->
    [{32, 2600}, {1, 122500}, {22, 153000}];
day_reward({7, 1}) ->
    [{32, 2620}, {1, 123000}, {22, 153600}];
day_reward({8, 1}) ->
    [{32, 2640}, {1, 123500}, {22, 154200}];
day_reward({9, 1}) ->
    [{32, 2660}, {1, 124000}, {22, 154800}];
day_reward({10, 1}) ->
    [{32, 2680}, {1, 124500}, {22, 155400}];
day_reward({11, 1}) ->
    [{32, 2700}, {1, 125000}, {22, 156000}];
day_reward({12, 1}) ->
    [{32, 2720}, {1, 125500}, {22, 156600}];
day_reward({13, 1}) ->
    [{32, 2740}, {1, 126000}, {22, 157200}];
day_reward({14, 1}) ->
    [{32, 2760}, {1, 126500}, {22, 157800}];
day_reward({15, 1}) ->
    [{32, 2780}, {1, 127000}, {22, 158400}];
day_reward({16, 1}) ->
    [{32, 2800}, {1, 127500}, {22, 159000}];
day_reward({17, 1}) ->
    [{32, 2820}, {1, 128000}, {22, 159600}];
day_reward({18, 1}) ->
    [{32, 2840}, {1, 128500}, {22, 160200}];
day_reward({19, 1}) ->
    [{32, 2860}, {1, 129000}, {22, 160800}];
day_reward({20, 1}) ->
    [{32, 2880}, {1, 129500}, {22, 161400}];
day_reward({21, 1}) ->
    [{32, 2900}, {1, 130000}, {22, 162000}];
day_reward({22, 1}) ->
    [{32, 2920}, {1, 130500}, {22, 162600}];
day_reward({23, 1}) ->
    [{32, 2940}, {1, 131000}, {22, 163200}];
day_reward({24, 1}) ->
    [{32, 2960}, {1, 131500}, {22, 163800}];
day_reward({25, 1}) ->
    [{32, 2980}, {1, 132000}, {22, 164400}];
day_reward({26, 1}) ->
    [{32, 3000}, {1, 132500}, {22, 165000}];
day_reward({27, 1}) ->
    [{32, 3020}, {1, 133000}, {22, 165600}];
day_reward({28, 1}) ->
    [{32, 3040}, {1, 133500}, {22, 166200}];
day_reward({29, 1}) ->
    [{32, 3060}, {1, 134000}, {22, 166800}];
day_reward({30, 1}) ->
    [{32, 3080}, {1, 134500}, {22, 167400}];
day_reward({31, 1}) ->
    [{32, 3100}, {1, 135000}, {22, 168000}];
day_reward({32, 1}) ->
    [{32, 3120}, {1, 135500}, {22, 168600}];
day_reward({33, 1}) ->
    [{32, 3140}, {1, 136000}, {22, 169200}];
day_reward({34, 1}) ->
    [{32, 3160}, {1, 136500}, {22, 169800}];
day_reward({35, 1}) ->
    [{32, 3180}, {1, 137000}, {22, 170400}];
day_reward({36, 1}) ->
    [{32, 3200}, {1, 137500}, {22, 171000}];
day_reward({37, 1}) ->
    [{32, 3220}, {1, 138000}, {22, 171600}];
day_reward({38, 1}) ->
    [{32, 3240}, {1, 138500}, {22, 172200}];
day_reward({39, 1}) ->
    [{32, 3260}, {1, 139000}, {22, 172800}];
day_reward({40, 1}) ->
    [{32, 3280}, {1, 139500}, {22, 173400}];
day_reward({41, 1}) ->
    [{32, 3300}, {1, 140000}, {22, 174000}];
day_reward({42, 1}) ->
    [{32, 3320}, {1, 140500}, {22, 174600}];
day_reward({43, 1}) ->
    [{32, 3340}, {1, 141000}, {22, 175200}];
day_reward({44, 1}) ->
    [{32, 3360}, {1, 141500}, {22, 175800}];
day_reward({45, 1}) ->
    [{32, 3380}, {1, 142000}, {22, 176400}];
day_reward({46, 1}) ->
    [{32, 3400}, {1, 142500}, {22, 177000}];
day_reward({47, 1}) ->
    [{32, 3420}, {1, 143000}, {22, 177600}];
day_reward({48, 1}) ->
    [{32, 3440}, {1, 143500}, {22, 178200}];
day_reward({49, 1}) ->
    [{32, 3460}, {1, 144000}, {22, 178800}];
day_reward({50, 1}) ->
    [{32, 3480}, {1, 144500}, {22, 179400}];
day_reward({51, 1}) ->
    [{32, 3500}, {1, 145000}, {22, 180000}];
day_reward({52, 1}) ->
    [{32, 3520}, {1, 145500}, {22, 180600}];
day_reward({53, 1}) ->
    [{32, 3540}, {1, 146000}, {22, 181200}];
day_reward({54, 1}) ->
    [{32, 3560}, {1, 146500}, {22, 181800}];
day_reward({55, 1}) ->
    [{32, 3580}, {1, 147000}, {22, 182400}];
day_reward({56, 1}) ->
    [{32, 3600}, {1, 147500}, {22, 183000}];
day_reward({57, 1}) ->
    [{32, 3620}, {1, 148000}, {22, 183600}];
day_reward({58, 1}) ->
    [{32, 3640}, {1, 148500}, {22, 184200}];
day_reward({59, 1}) ->
    [{32, 3660}, {1, 149000}, {22, 184800}];
day_reward({60, 1}) ->
    [{32, 3680}, {1, 149500}, {22, 185400}];
day_reward({61, 1}) ->
    [{32, 3700}, {1, 150000}, {22, 186000}];
day_reward({62, 1}) ->
    [{32, 3720}, {1, 150500}, {22, 186600}];
day_reward({63, 1}) ->
    [{32, 3740}, {1, 151000}, {22, 187200}];
day_reward({64, 1}) ->
    [{32, 3760}, {1, 151500}, {22, 187800}];
day_reward({65, 1}) ->
    [{32, 3780}, {1, 152000}, {22, 188400}];
day_reward({66, 1}) ->
    [{32, 3800}, {1, 152500}, {22, 189000}];
day_reward({67, 1}) ->
    [{32, 3820}, {1, 153000}, {22, 189600}];
day_reward({68, 1}) ->
    [{32, 3840}, {1, 153500}, {22, 190200}];
day_reward({69, 1}) ->
    [{32, 3860}, {1, 154000}, {22, 190800}];
day_reward({70, 1}) ->
    [{32, 3880}, {1, 154500}, {22, 191400}];
day_reward({71, 1}) ->
    [{32, 3900}, {1, 155000}, {22, 192000}];
day_reward({72, 1}) ->
    [{32, 3920}, {1, 155500}, {22, 192600}];
day_reward({73, 1}) ->
    [{32, 3940}, {1, 156000}, {22, 193200}];
day_reward({74, 1}) ->
    [{32, 3960}, {1, 156500}, {22, 193800}];
day_reward({75, 1}) ->
    [{32, 3980}, {1, 157000}, {22, 194400}];
day_reward({76, 1}) ->
    [{32, 4000}, {1, 157500}, {22, 195000}];
day_reward({77, 1}) ->
    [{32, 4020}, {1, 158000}, {22, 195600}];
day_reward({78, 1}) ->
    [{32, 4040}, {1, 158500}, {22, 196200}];
day_reward({79, 1}) ->
    [{32, 4060}, {1, 159000}, {22, 196800}];
day_reward({80, 1}) ->
    [{32, 4080}, {1, 159500}, {22, 197400}];
day_reward({81, 1}) ->
    [{32, 4100}, {1, 160000}, {22, 198000}];
day_reward({82, 1}) ->
    [{32, 4120}, {1, 160500}, {22, 198600}];
day_reward({83, 1}) ->
    [{32, 4140}, {1, 161000}, {22, 199200}];
day_reward({84, 1}) ->
    [{32, 4160}, {1, 161500}, {22, 199800}];
day_reward({85, 1}) ->
    [{32, 4180}, {1, 162000}, {22, 200400}];
day_reward({86, 1}) ->
    [{32, 4200}, {1, 162500}, {22, 201000}];
day_reward({87, 1}) ->
    [{32, 4220}, {1, 163000}, {22, 201600}];
day_reward({88, 1}) ->
    [{32, 4240}, {1, 163500}, {22, 202200}];
day_reward({89, 1}) ->
    [{32, 4260}, {1, 164000}, {22, 202800}];
day_reward({90, 1}) ->
    [{32, 4280}, {1, 164500}, {22, 203400}];
day_reward({91, 1}) ->
    [{32, 4300}, {1, 165000}, {22, 204000}];
day_reward({92, 1}) ->
    [{32, 4320}, {1, 165500}, {22, 204600}];
day_reward({93, 1}) ->
    [{32, 4340}, {1, 166000}, {22, 205200}];
day_reward({94, 1}) ->
    [{32, 4360}, {1, 166500}, {22, 205800}];
day_reward({95, 1}) ->
    [{32, 4380}, {1, 167000}, {22, 206400}];
day_reward({96, 1}) ->
    [{32, 4400}, {1, 167500}, {22, 207000}];
day_reward({97, 1}) ->
    [{32, 4420}, {1, 168000}, {22, 207600}];
day_reward({98, 1}) ->
    [{32, 4440}, {1, 168500}, {22, 208200}];
day_reward({99, 1}) ->
    [{32, 4460}, {1, 169000}, {22, 208800}];
day_reward({100, 1}) ->
    [{32, 4480}, {1, 169500}, {22, 209400}];
day_reward({101, 1}) ->
    [{32, 4500}, {1, 170000}, {22, 210000}];
day_reward({102, 1}) ->
    [{32, 4520}, {1, 170500}, {22, 210600}];
day_reward({103, 1}) ->
    [{32, 4540}, {1, 171000}, {22, 211200}];
day_reward({104, 1}) ->
    [{32, 4560}, {1, 171500}, {22, 211800}];
day_reward({105, 1}) ->
    [{32, 4580}, {1, 172000}, {22, 212400}];
day_reward({106, 1}) ->
    [{32, 4600}, {1, 172500}, {22, 213000}];
day_reward({107, 1}) ->
    [{32, 4620}, {1, 173000}, {22, 213600}];
day_reward({108, 1}) ->
    [{32, 4640}, {1, 173500}, {22, 214200}];
day_reward({109, 1}) ->
    [{32, 4660}, {1, 174000}, {22, 214800}];
day_reward({110, 1}) ->
    [{32, 4680}, {1, 174500}, {22, 215400}];
day_reward({111, 1}) ->
    [{32, 4700}, {1, 175000}, {22, 216000}];
day_reward({112, 1}) ->
    [{32, 4720}, {1, 175500}, {22, 216600}];
day_reward({113, 1}) ->
    [{32, 4740}, {1, 176000}, {22, 217200}];
day_reward({114, 1}) ->
    [{32, 4760}, {1, 176500}, {22, 217800}];
day_reward({115, 1}) ->
    [{32, 4780}, {1, 177000}, {22, 218400}];
day_reward({116, 1}) ->
    [{32, 4800}, {1, 177500}, {22, 219000}];
day_reward({117, 1}) ->
    [{32, 4820}, {1, 178000}, {22, 219600}];
day_reward({118, 1}) ->
    [{32, 4840}, {1, 178500}, {22, 220200}];
day_reward({119, 1}) ->
    [{32, 4860}, {1, 179000}, {22, 220800}];
day_reward({120, 1}) ->
    [{32, 4880}, {1, 179500}, {22, 221400}];
day_reward({121, 1}) ->
    [{32, 4900}, {1, 180000}, {22, 222000}];
day_reward({122, 1}) ->
    [{32, 4920}, {1, 180500}, {22, 222600}];
day_reward({123, 1}) ->
    [{32, 4940}, {1, 181000}, {22, 223200}];
day_reward({124, 1}) ->
    [{32, 4960}, {1, 181500}, {22, 223800}];
day_reward({125, 1}) ->
    [{32, 4980}, {1, 182000}, {22, 224400}];
day_reward({126, 1}) ->
    [{32, 5000}, {1, 182500}, {22, 225000}];
day_reward({127, 1}) ->
    [{32, 5020}, {1, 183000}, {22, 225600}];
day_reward({128, 1}) ->
    [{32, 5040}, {1, 183500}, {22, 226200}];
day_reward({129, 1}) ->
    [{32, 5060}, {1, 184000}, {22, 226800}];
day_reward({130, 1}) ->
    [{32, 5080}, {1, 184500}, {22, 227400}];
day_reward({131, 1}) ->
    [{32, 5100}, {1, 185000}, {22, 228000}];
day_reward({132, 1}) ->
    [{32, 5120}, {1, 185500}, {22, 228600}];
day_reward({133, 1}) ->
    [{32, 5140}, {1, 186000}, {22, 229200}];
day_reward({134, 1}) ->
    [{32, 5160}, {1, 186500}, {22, 229800}];
day_reward({135, 1}) ->
    [{32, 5180}, {1, 187000}, {22, 230400}];
day_reward({136, 1}) ->
    [{32, 5200}, {1, 187500}, {22, 231000}];
day_reward({137, 1}) ->
    [{32, 5220}, {1, 188000}, {22, 231600}];
day_reward({138, 1}) ->
    [{32, 5240}, {1, 188500}, {22, 232200}];
day_reward({139, 1}) ->
    [{32, 5260}, {1, 189000}, {22, 232800}];
day_reward({140, 1}) ->
    [{32, 5280}, {1, 189500}, {22, 233400}];
day_reward({141, 1}) ->
    [{32, 5300}, {1, 190000}, {22, 234000}];
day_reward({142, 1}) ->
    [{32, 5320}, {1, 190500}, {22, 234600}];
day_reward({143, 1}) ->
    [{32, 5340}, {1, 191000}, {22, 235200}];
day_reward({144, 1}) ->
    [{32, 5360}, {1, 191500}, {22, 235800}];
day_reward({145, 1}) ->
    [{32, 5380}, {1, 192000}, {22, 236400}];
day_reward({146, 1}) ->
    [{32, 5400}, {1, 192500}, {22, 237000}];
day_reward({147, 1}) ->
    [{32, 5420}, {1, 193000}, {22, 237600}];
day_reward({148, 1}) ->
    [{32, 5440}, {1, 193500}, {22, 238200}];
day_reward({149, 1}) ->
    [{32, 5460}, {1, 194000}, {22, 238800}];
day_reward({150, 1}) ->
    [{32, 5480}, {1, 194500}, {22, 239400}];
day_reward({151, 1}) ->
    [{32, 5500}, {1, 195000}, {22, 240000}];
day_reward({152, 1}) ->
    [{32, 5520}, {1, 195500}, {22, 240600}];
day_reward({153, 1}) ->
    [{32, 5540}, {1, 196000}, {22, 241200}];
day_reward({154, 1}) ->
    [{32, 5560}, {1, 196500}, {22, 241800}];
day_reward({155, 1}) ->
    [{32, 5580}, {1, 197000}, {22, 242400}];
day_reward({156, 1}) ->
    [{32, 5600}, {1, 197500}, {22, 243000}];
day_reward({157, 1}) ->
    [{32, 5620}, {1, 198000}, {22, 243600}];
day_reward({158, 1}) ->
    [{32, 5640}, {1, 198500}, {22, 244200}];
day_reward({159, 1}) ->
    [{32, 5660}, {1, 199000}, {22, 244800}];
day_reward({160, 1}) ->
    [{32, 5680}, {1, 199500}, {22, 245400}];
day_reward({161, 1}) ->
    [{32, 5700}, {1, 200000}, {22, 246000}];
day_reward({162, 1}) ->
    [{32, 5720}, {1, 200500}, {22, 246600}];
day_reward({163, 1}) ->
    [{32, 5740}, {1, 201000}, {22, 247200}];
day_reward({164, 1}) ->
    [{32, 5760}, {1, 201500}, {22, 247800}];
day_reward({165, 1}) ->
    [{32, 5780}, {1, 202000}, {22, 248400}];
day_reward({166, 1}) ->
    [{32, 5800}, {1, 202500}, {22, 249000}];
day_reward({167, 1}) ->
    [{32, 5820}, {1, 203000}, {22, 249600}];
day_reward({168, 1}) ->
    [{32, 5840}, {1, 203500}, {22, 250200}];
day_reward({169, 1}) ->
    [{32, 5860}, {1, 204000}, {22, 250800}];
day_reward({170, 1}) ->
    [{32, 5880}, {1, 204500}, {22, 251400}];
day_reward({171, 1}) ->
    [{32, 5900}, {1, 205000}, {22, 252000}];
day_reward({172, 1}) ->
    [{32, 5920}, {1, 205500}, {22, 252600}];
day_reward({173, 1}) ->
    [{32, 5940}, {1, 206000}, {22, 253200}];
day_reward({174, 1}) ->
    [{32, 5960}, {1, 206500}, {22, 253800}];
day_reward({175, 1}) ->
    [{32, 5980}, {1, 207000}, {22, 254400}];
day_reward({176, 1}) ->
    [{32, 6000}, {1, 207500}, {22, 255000}];
day_reward({177, 1}) ->
    [{32, 6020}, {1, 208000}, {22, 255600}];
day_reward({178, 1}) ->
    [{32, 6040}, {1, 208500}, {22, 256200}];
day_reward({179, 1}) ->
    [{32, 6060}, {1, 209000}, {22, 256800}];
day_reward({180, 1}) ->
    [{32, 6080}, {1, 209500}, {22, 257400}];
day_reward({181, 1}) ->
    [{32, 6100}, {1, 210000}, {22, 258000}];
day_reward({182, 1}) ->
    [{32, 6120}, {1, 210500}, {22, 258600}];
day_reward({183, 1}) ->
    [{32, 6140}, {1, 211000}, {22, 259200}];
day_reward({184, 1}) ->
    [{32, 6160}, {1, 211500}, {22, 259800}];
day_reward({185, 1}) ->
    [{32, 6180}, {1, 212000}, {22, 260400}];
day_reward({186, 1}) ->
    [{32, 6200}, {1, 212500}, {22, 261000}];
day_reward({187, 1}) ->
    [{32, 6220}, {1, 213000}, {22, 261600}];
day_reward({188, 1}) ->
    [{32, 6240}, {1, 213500}, {22, 262200}];
day_reward({189, 1}) ->
    [{32, 6260}, {1, 214000}, {22, 262800}];
day_reward({190, 1}) ->
    [{32, 6280}, {1, 214500}, {22, 263400}];
day_reward({191, 1}) ->
    [{32, 6300}, {1, 215000}, {22, 264000}];
day_reward({192, 1}) ->
    [{32, 6320}, {1, 215500}, {22, 264600}];
day_reward({193, 1}) ->
    [{32, 6340}, {1, 216000}, {22, 265200}];
day_reward({194, 1}) ->
    [{32, 6360}, {1, 216500}, {22, 265800}];
day_reward({195, 1}) ->
    [{32, 6380}, {1, 217000}, {22, 266400}];
day_reward({196, 1}) ->
    [{32, 6400}, {1, 217500}, {22, 267000}];
day_reward({197, 1}) ->
    [{32, 6420}, {1, 218000}, {22, 267600}];
day_reward({198, 1}) ->
    [{32, 6440}, {1, 218500}, {22, 268200}];
day_reward({199, 1}) ->
    [{32, 6460}, {1, 219000}, {22, 268800}];
day_reward({200, 1}) ->
    [{32, 6480}, {1, 219500}, {22, 269400}];
day_reward({201, 1}) ->
    [{32, 6500}, {1, 220000}, {22, 270000}];
day_reward({202, 1}) ->
    [{32, 6520}, {1, 220500}, {22, 270600}];
day_reward({203, 1}) ->
    [{32, 6540}, {1, 221000}, {22, 271200}];
day_reward({204, 1}) ->
    [{32, 6560}, {1, 221500}, {22, 271800}];
day_reward({205, 1}) ->
    [{32, 6580}, {1, 222000}, {22, 272400}];
day_reward({206, 1}) ->
    [{32, 6600}, {1, 222500}, {22, 273000}];
day_reward({207, 1}) ->
    [{32, 6620}, {1, 223000}, {22, 273600}];
day_reward({208, 1}) ->
    [{32, 6640}, {1, 223500}, {22, 274200}];
day_reward({209, 1}) ->
    [{32, 6660}, {1, 224000}, {22, 274800}];
day_reward({210, 1}) ->
    [{32, 6680}, {1, 224500}, {22, 275400}];
day_reward({211, 1}) ->
    [{32, 6700}, {1, 225000}, {22, 276000}];
day_reward({212, 1}) ->
    [{32, 6720}, {1, 225500}, {22, 276600}];
day_reward({213, 1}) ->
    [{32, 6740}, {1, 226000}, {22, 277200}];
day_reward({214, 1}) ->
    [{32, 6760}, {1, 226500}, {22, 277800}];
day_reward({215, 1}) ->
    [{32, 6780}, {1, 227000}, {22, 278400}];
day_reward({216, 1}) ->
    [{32, 6800}, {1, 227500}, {22, 279000}];
day_reward({217, 1}) ->
    [{32, 6820}, {1, 228000}, {22, 279600}];
day_reward({218, 1}) ->
    [{32, 6840}, {1, 228500}, {22, 280200}];
day_reward({219, 1}) ->
    [{32, 6860}, {1, 229000}, {22, 280800}];
day_reward({220, 1}) ->
    [{32, 6880}, {1, 229500}, {22, 281400}];
day_reward({221, 1}) ->
    [{32, 6900}, {1, 230000}, {22, 282000}];
day_reward({222, 1}) ->
    [{32, 6920}, {1, 230500}, {22, 282600}];
day_reward({223, 1}) ->
    [{32, 6940}, {1, 231000}, {22, 283200}];
day_reward({224, 1}) ->
    [{32, 6960}, {1, 231500}, {22, 283800}];
day_reward({225, 1}) ->
    [{32, 6980}, {1, 232000}, {22, 284400}];
day_reward({226, 1}) ->
    [{32, 7000}, {1, 232500}, {22, 285000}];
day_reward({227, 1}) ->
    [{32, 7020}, {1, 233000}, {22, 285600}];
day_reward({228, 1}) ->
    [{32, 7040}, {1, 233500}, {22, 286200}];
day_reward({229, 1}) ->
    [{32, 7060}, {1, 234000}, {22, 286800}];
day_reward({230, 1}) ->
    [{32, 7080}, {1, 234500}, {22, 287400}];
day_reward({231, 1}) ->
    [{32, 7100}, {1, 235000}, {22, 288000}];
day_reward({232, 1}) ->
    [{32, 7120}, {1, 235500}, {22, 288600}];
day_reward({233, 1}) ->
    [{32, 7140}, {1, 236000}, {22, 289200}];
day_reward({234, 1}) ->
    [{32, 7160}, {1, 236500}, {22, 289800}];
day_reward({235, 1}) ->
    [{32, 7180}, {1, 237000}, {22, 290400}];
day_reward({236, 1}) ->
    [{32, 7200}, {1, 237500}, {22, 291000}];
day_reward({237, 1}) ->
    [{32, 7220}, {1, 238000}, {22, 291600}];
day_reward({238, 1}) ->
    [{32, 7240}, {1, 238500}, {22, 292200}];
day_reward({239, 1}) ->
    [{32, 7260}, {1, 239000}, {22, 292800}];
day_reward({240, 1}) ->
    [{32, 7280}, {1, 239500}, {22, 293400}];
day_reward({241, 1}) ->
    [{32, 7300}, {1, 240000}, {22, 294000}];
day_reward({242, 1}) ->
    [{32, 7320}, {1, 240500}, {22, 294600}];
day_reward({243, 1}) ->
    [{32, 7340}, {1, 241000}, {22, 295200}];
day_reward({244, 1}) ->
    [{32, 7360}, {1, 241500}, {22, 295800}];
day_reward({245, 1}) ->
    [{32, 7380}, {1, 242000}, {22, 296400}];
day_reward({246, 1}) ->
    [{32, 7400}, {1, 242500}, {22, 297000}];
day_reward({247, 1}) ->
    [{32, 7420}, {1, 243000}, {22, 297600}];
day_reward({248, 1}) ->
    [{32, 7440}, {1, 243500}, {22, 298200}];
day_reward({249, 1}) ->
    [{32, 7460}, {1, 244000}, {22, 298800}];
day_reward({250, 1}) ->
    [{32, 7480}, {1, 244500}, {22, 299400}];
day_reward({251, 1}) ->
    [{32, 7500}, {1, 245000}, {22, 300000}];
day_reward({252, 1}) ->
    [{32, 7520}, {1, 245500}, {22, 300600}];
day_reward({253, 1}) ->
    [{32, 7540}, {1, 246000}, {22, 301200}];
day_reward({254, 1}) ->
    [{32, 7560}, {1, 246500}, {22, 301800}];
day_reward({255, 1}) ->
    [{32, 7580}, {1, 247000}, {22, 302400}];
day_reward({256, 1}) ->
    [{32, 7600}, {1, 247500}, {22, 303000}];
day_reward({257, 1}) ->
    [{32, 7620}, {1, 248000}, {22, 303600}];
day_reward({258, 1}) ->
    [{32, 7640}, {1, 248500}, {22, 304200}];
day_reward({259, 1}) ->
    [{32, 7660}, {1, 249000}, {22, 304800}];
day_reward({260, 1}) ->
    [{32, 7680}, {1, 249500}, {22, 305400}];
day_reward({261, 1}) ->
    [{32, 7700}, {1, 250000}, {22, 306000}];
day_reward({262, 1}) ->
    [{32, 7720}, {1, 250500}, {22, 306600}];
day_reward({263, 1}) ->
    [{32, 7740}, {1, 251000}, {22, 307200}];
day_reward({264, 1}) ->
    [{32, 7760}, {1, 251500}, {22, 307800}];
day_reward({265, 1}) ->
    [{32, 7780}, {1, 252000}, {22, 308400}];
day_reward({266, 1}) ->
    [{32, 7800}, {1, 252500}, {22, 309000}];
day_reward({267, 1}) ->
    [{32, 7820}, {1, 253000}, {22, 309600}];
day_reward({268, 1}) ->
    [{32, 7840}, {1, 253500}, {22, 310200}];
day_reward({269, 1}) ->
    [{32, 7860}, {1, 254000}, {22, 310800}];
day_reward({270, 1}) ->
    [{32, 7880}, {1, 254500}, {22, 311400}];
day_reward({271, 1}) ->
    [{32, 7900}, {1, 255000}, {22, 312000}];
day_reward({272, 1}) ->
    [{32, 7920}, {1, 255500}, {22, 312600}];
day_reward({273, 1}) ->
    [{32, 7940}, {1, 256000}, {22, 313200}];
day_reward({274, 1}) ->
    [{32, 7960}, {1, 256500}, {22, 313800}];
day_reward({275, 1}) ->
    [{32, 7980}, {1, 257000}, {22, 314400}];
day_reward({276, 1}) ->
    [{32, 8000}, {1, 257500}, {22, 315000}];
day_reward({277, 1}) ->
    [{32, 8020}, {1, 258000}, {22, 315600}];
day_reward({278, 1}) ->
    [{32, 8040}, {1, 258500}, {22, 316200}];
day_reward({279, 1}) ->
    [{32, 8060}, {1, 259000}, {22, 316800}];
day_reward({280, 1}) ->
    [{32, 8080}, {1, 259500}, {22, 317400}];
day_reward({281, 1}) ->
    [{32, 8100}, {1, 260000}, {22, 318000}];
day_reward({282, 1}) ->
    [{32, 8120}, {1, 260500}, {22, 318600}];
day_reward({283, 1}) ->
    [{32, 8140}, {1, 261000}, {22, 319200}];
day_reward({284, 1}) ->
    [{32, 8160}, {1, 261500}, {22, 319800}];
day_reward({285, 1}) ->
    [{32, 8180}, {1, 262000}, {22, 320400}];
day_reward({286, 1}) ->
    [{32, 8200}, {1, 262500}, {22, 321000}];
day_reward({287, 1}) ->
    [{32, 8220}, {1, 263000}, {22, 321600}];
day_reward({288, 1}) ->
    [{32, 8240}, {1, 263500}, {22, 322200}];
day_reward({289, 1}) ->
    [{32, 8260}, {1, 264000}, {22, 322800}];
day_reward({290, 1}) ->
    [{32, 8280}, {1, 264500}, {22, 323400}];
day_reward({291, 1}) ->
    [{32, 8300}, {1, 265000}, {22, 324000}];
day_reward({292, 1}) ->
    [{32, 8320}, {1, 265500}, {22, 324600}];
day_reward({293, 1}) ->
    [{32, 8340}, {1, 266000}, {22, 325200}];
day_reward({294, 1}) ->
    [{32, 8360}, {1, 266500}, {22, 325800}];
day_reward({295, 1}) ->
    [{32, 8380}, {1, 267000}, {22, 326400}];
day_reward({296, 1}) ->
    [{32, 8400}, {1, 267500}, {22, 327000}];
day_reward({297, 1}) ->
    [{32, 8420}, {1, 268000}, {22, 327600}];
day_reward({298, 1}) ->
    [{32, 8440}, {1, 268500}, {22, 328200}];
day_reward({299, 1}) ->
    [{32, 8460}, {1, 269000}, {22, 328800}];
day_reward({300, 1}) ->
    [{32, 8480}, {1, 269500}, {22, 329400}];
day_reward({301, 1}) ->
    [{32, 8500}, {1, 270000}, {22, 330000}];
day_reward({302, 1}) ->
    [{32, 8520}, {1, 270500}, {22, 330600}];
day_reward({303, 1}) ->
    [{32, 8540}, {1, 271000}, {22, 331200}];
day_reward({304, 1}) ->
    [{32, 8560}, {1, 271500}, {22, 331800}];
day_reward({305, 1}) ->
    [{32, 8580}, {1, 272000}, {22, 332400}];
day_reward({306, 1}) ->
    [{32, 8600}, {1, 272500}, {22, 333000}];
day_reward({307, 1}) ->
    [{32, 8620}, {1, 273000}, {22, 333600}];
day_reward({308, 1}) ->
    [{32, 8640}, {1, 273500}, {22, 334200}];
day_reward({309, 1}) ->
    [{32, 8660}, {1, 274000}, {22, 334800}];
day_reward({310, 1}) ->
    [{32, 8680}, {1, 274500}, {22, 335400}];
day_reward({311, 1}) ->
    [{32, 8700}, {1, 275000}, {22, 336000}];
day_reward({312, 1}) ->
    [{32, 8720}, {1, 275500}, {22, 336600}];
day_reward({313, 1}) ->
    [{32, 8740}, {1, 276000}, {22, 337200}];
day_reward({314, 1}) ->
    [{32, 8760}, {1, 276500}, {22, 337800}];
day_reward({315, 1}) ->
    [{32, 8780}, {1, 277000}, {22, 338400}];
day_reward({316, 1}) ->
    [{32, 8800}, {1, 277500}, {22, 339000}];
day_reward({317, 1}) ->
    [{32, 8820}, {1, 278000}, {22, 339600}];
day_reward({318, 1}) ->
    [{32, 8840}, {1, 278500}, {22, 340200}];
day_reward({319, 1}) ->
    [{32, 8860}, {1, 279000}, {22, 340800}];
day_reward({320, 1}) ->
    [{32, 8880}, {1, 279500}, {22, 341400}];
day_reward({321, 1}) ->
    [{32, 8900}, {1, 280000}, {22, 342000}];
day_reward({322, 1}) ->
    [{32, 8920}, {1, 280500}, {22, 342600}];
day_reward({323, 1}) ->
    [{32, 8940}, {1, 281000}, {22, 343200}];
day_reward({324, 1}) ->
    [{32, 8960}, {1, 281500}, {22, 343800}];
day_reward({325, 1}) ->
    [{32, 8980}, {1, 282000}, {22, 344400}];
day_reward({326, 1}) ->
    [{32, 9000}, {1, 282500}, {22, 345000}];
day_reward({327, 1}) ->
    [{32, 9020}, {1, 283000}, {22, 345600}];
day_reward({328, 1}) ->
    [{32, 9040}, {1, 283500}, {22, 346200}];
day_reward({329, 1}) ->
    [{32, 9060}, {1, 284000}, {22, 346800}];
day_reward({330, 1}) ->
    [{32, 9080}, {1, 284500}, {22, 347400}];
day_reward({331, 1}) ->
    [{32, 9100}, {1, 285000}, {22, 348000}];
day_reward({332, 1}) ->
    [{32, 9120}, {1, 285500}, {22, 348600}];
day_reward({333, 1}) ->
    [{32, 9140}, {1, 286000}, {22, 349200}];
day_reward({334, 1}) ->
    [{32, 9160}, {1, 286500}, {22, 349800}];
day_reward({335, 1}) ->
    [{32, 9180}, {1, 287000}, {22, 350400}];
day_reward({336, 1}) ->
    [{32, 9200}, {1, 287500}, {22, 351000}];
day_reward({337, 1}) ->
    [{32, 9220}, {1, 288000}, {22, 351600}];
day_reward({338, 1}) ->
    [{32, 9240}, {1, 288500}, {22, 352200}];
day_reward({339, 1}) ->
    [{32, 9260}, {1, 289000}, {22, 352800}];
day_reward({340, 1}) ->
    [{32, 9280}, {1, 289500}, {22, 353400}];
day_reward({341, 1}) ->
    [{32, 9300}, {1, 290000}, {22, 354000}];
day_reward({342, 1}) ->
    [{32, 9320}, {1, 290500}, {22, 354600}];
day_reward({343, 1}) ->
    [{32, 9340}, {1, 291000}, {22, 355200}];
day_reward({344, 1}) ->
    [{32, 9360}, {1, 291500}, {22, 355800}];
day_reward({345, 1}) ->
    [{32, 9380}, {1, 292000}, {22, 356400}];
day_reward({346, 1}) ->
    [{32, 9400}, {1, 292500}, {22, 357000}];
day_reward({347, 1}) ->
    [{32, 9420}, {1, 293000}, {22, 357600}];
day_reward({348, 1}) ->
    [{32, 9440}, {1, 293500}, {22, 358200}];
day_reward({349, 1}) ->
    [{32, 9460}, {1, 294000}, {22, 358800}];
day_reward({350, 1}) ->
    [{32, 9480}, {1, 294500}, {22, 359400}];
day_reward({351, 1}) ->
    [{32, 9500}, {1, 295000}, {22, 360000}];
day_reward({352, 1}) ->
    [{32, 9520}, {1, 295500}, {22, 360600}];
day_reward({353, 1}) ->
    [{32, 9540}, {1, 296000}, {22, 361200}];
day_reward({354, 1}) ->
    [{32, 9560}, {1, 296500}, {22, 361800}];
day_reward({355, 1}) ->
    [{32, 9580}, {1, 297000}, {22, 362400}];
day_reward({356, 1}) ->
    [{32, 9600}, {1, 297500}, {22, 363000}];
day_reward({357, 1}) ->
    [{32, 9620}, {1, 298000}, {22, 363600}];
day_reward({358, 1}) ->
    [{32, 9640}, {1, 298500}, {22, 364200}];
day_reward({359, 1}) ->
    [{32, 9660}, {1, 299000}, {22, 364800}];
day_reward({360, 1}) ->
    [{32, 9680}, {1, 299500}, {22, 365400}];
day_reward({361, 1}) ->
    [{32, 9700}, {1, 300000}, {22, 366000}];
day_reward({362, 1}) ->
    [{32, 9720}, {1, 300500}, {22, 366600}];
day_reward({363, 1}) ->
    [{32, 9740}, {1, 301000}, {22, 367200}];
day_reward({364, 1}) ->
    [{32, 9760}, {1, 301500}, {22, 367800}];
day_reward({365, 1}) ->
    [{32, 9780}, {1, 302000}, {22, 368400}];
day_reward({366, 1}) ->
    [{32, 9800}, {1, 302500}, {22, 369000}];
day_reward({367, 1}) ->
    [{32, 9820}, {1, 303000}, {22, 369600}];
day_reward({368, 1}) ->
    [{32, 9840}, {1, 303500}, {22, 370200}];
day_reward({369, 1}) ->
    [{32, 9860}, {1, 304000}, {22, 370800}];
day_reward({370, 1}) ->
    [{32, 9880}, {1, 304500}, {22, 371400}];
day_reward({371, 1}) ->
    [{32, 9900}, {1, 305000}, {22, 372000}];
day_reward({372, 1}) ->
    [{32, 9920}, {1, 305500}, {22, 372600}];
day_reward({373, 1}) ->
    [{32, 9940}, {1, 306000}, {22, 373200}];
day_reward({374, 1}) ->
    [{32, 9960}, {1, 306500}, {22, 373800}];
day_reward({375, 1}) ->
    [{32, 9980}, {1, 307000}, {22, 374400}];
day_reward({376, 1}) ->
    [{32, 10000}, {1, 307500}, {22, 375000}];
day_reward({377, 1}) ->
    [{32, 10020}, {1, 308000}, {22, 375600}];
day_reward({378, 1}) ->
    [{32, 10040}, {1, 308500}, {22, 376200}];
day_reward({379, 1}) ->
    [{32, 10060}, {1, 309000}, {22, 376800}];
day_reward({380, 1}) ->
    [{32, 10080}, {1, 309500}, {22, 377400}];
day_reward({381, 1}) ->
    [{32, 10100}, {1, 310000}, {22, 378000}];
day_reward({382, 1}) ->
    [{32, 10120}, {1, 310500}, {22, 378600}];
day_reward({383, 1}) ->
    [{32, 10140}, {1, 311000}, {22, 379200}];
day_reward({384, 1}) ->
    [{32, 10160}, {1, 311500}, {22, 379800}];
day_reward({385, 1}) ->
    [{32, 10180}, {1, 312000}, {22, 380400}];
day_reward({386, 1}) ->
    [{32, 10200}, {1, 312500}, {22, 381000}];
day_reward({387, 1}) ->
    [{32, 10220}, {1, 313000}, {22, 381600}];
day_reward({388, 1}) ->
    [{32, 10240}, {1, 313500}, {22, 382200}];
day_reward({389, 1}) ->
    [{32, 10260}, {1, 314000}, {22, 382800}];
day_reward({390, 1}) ->
    [{32, 10280}, {1, 314500}, {22, 383400}];
day_reward({391, 1}) ->
    [{32, 10300}, {1, 315000}, {22, 384000}];
day_reward({392, 1}) ->
    [{32, 10320}, {1, 315500}, {22, 384600}];
day_reward({393, 1}) ->
    [{32, 10340}, {1, 316000}, {22, 385200}];
day_reward({394, 1}) ->
    [{32, 10360}, {1, 316500}, {22, 385800}];
day_reward({395, 1}) ->
    [{32, 10380}, {1, 317000}, {22, 386400}];
day_reward({396, 1}) ->
    [{32, 10400}, {1, 317500}, {22, 387000}];
day_reward({397, 1}) ->
    [{32, 10420}, {1, 318000}, {22, 387600}];
day_reward({398, 1}) ->
    [{32, 10440}, {1, 318500}, {22, 388200}];
day_reward({399, 1}) ->
    [{32, 10460}, {1, 319000}, {22, 388800}];
day_reward({400, 1}) ->
    [{32, 10480}, {1, 319500}, {22, 389400}];
day_reward({401, 1}) ->
    [{32, 10500}, {1, 320000}, {22, 390000}];
day_reward({402, 1}) ->
    [{32, 10520}, {1, 320500}, {22, 390600}];
day_reward({403, 1}) ->
    [{32, 10540}, {1, 321000}, {22, 391200}];
day_reward({404, 1}) ->
    [{32, 10560}, {1, 321500}, {22, 391800}];
day_reward({405, 1}) ->
    [{32, 10580}, {1, 322000}, {22, 392400}];
day_reward({406, 1}) ->
    [{32, 10600}, {1, 322500}, {22, 393000}];
day_reward({407, 1}) ->
    [{32, 10620}, {1, 323000}, {22, 393600}];
day_reward({408, 1}) ->
    [{32, 10640}, {1, 323500}, {22, 394200}];
day_reward({409, 1}) ->
    [{32, 10660}, {1, 324000}, {22, 394800}];
day_reward({410, 1}) ->
    [{32, 10680}, {1, 324500}, {22, 395400}];
day_reward({411, 1}) ->
    [{32, 10700}, {1, 325000}, {22, 396000}];
day_reward({412, 1}) ->
    [{32, 10720}, {1, 325500}, {22, 396600}];
day_reward({413, 1}) ->
    [{32, 10740}, {1, 326000}, {22, 397200}];
day_reward({414, 1}) ->
    [{32, 10760}, {1, 326500}, {22, 397800}];
day_reward({415, 1}) ->
    [{32, 10780}, {1, 327000}, {22, 398400}];
day_reward({416, 1}) ->
    [{32, 10800}, {1, 327500}, {22, 399000}];
day_reward({417, 1}) ->
    [{32, 10820}, {1, 328000}, {22, 399600}];
day_reward({418, 1}) ->
    [{32, 10840}, {1, 328500}, {22, 400200}];
day_reward({419, 1}) ->
    [{32, 10860}, {1, 329000}, {22, 400800}];
day_reward({420, 1}) ->
    [{32, 10880}, {1, 329500}, {22, 401400}];
day_reward({421, 1}) ->
    [{32, 10900}, {1, 330000}, {22, 402000}];
day_reward({422, 1}) ->
    [{32, 10920}, {1, 330500}, {22, 402600}];
day_reward({423, 1}) ->
    [{32, 10940}, {1, 331000}, {22, 403200}];
day_reward({424, 1}) ->
    [{32, 10960}, {1, 331500}, {22, 403800}];
day_reward({425, 1}) ->
    [{32, 10980}, {1, 332000}, {22, 404400}];
day_reward({426, 1}) ->
    [{32, 11000}, {1, 332500}, {22, 405000}];
day_reward({427, 1}) ->
    [{32, 11020}, {1, 333000}, {22, 405600}];
day_reward({428, 1}) ->
    [{32, 11040}, {1, 333500}, {22, 406200}];
day_reward({429, 1}) ->
    [{32, 11060}, {1, 334000}, {22, 406800}];
day_reward({430, 1}) ->
    [{32, 11080}, {1, 334500}, {22, 407400}];
day_reward({431, 1}) ->
    [{32, 11100}, {1, 335000}, {22, 408000}];
day_reward({432, 1}) ->
    [{32, 11120}, {1, 335500}, {22, 408600}];
day_reward({433, 1}) ->
    [{32, 11140}, {1, 336000}, {22, 409200}];
day_reward({434, 1}) ->
    [{32, 11160}, {1, 336500}, {22, 409800}];
day_reward({435, 1}) ->
    [{32, 11180}, {1, 337000}, {22, 410400}];
day_reward({436, 1}) ->
    [{32, 11200}, {1, 337500}, {22, 411000}];
day_reward({437, 1}) ->
    [{32, 11220}, {1, 338000}, {22, 411600}];
day_reward({438, 1}) ->
    [{32, 11240}, {1, 338500}, {22, 412200}];
day_reward({439, 1}) ->
    [{32, 11260}, {1, 339000}, {22, 412800}];
day_reward({440, 1}) ->
    [{32, 11280}, {1, 339500}, {22, 413400}];
day_reward({441, 1}) ->
    [{32, 11300}, {1, 340000}, {22, 414000}];
day_reward({442, 1}) ->
    [{32, 11320}, {1, 340500}, {22, 414600}];
day_reward({443, 1}) ->
    [{32, 11340}, {1, 341000}, {22, 415200}];
day_reward({444, 1}) ->
    [{32, 11360}, {1, 341500}, {22, 415800}];
day_reward({445, 1}) ->
    [{32, 11380}, {1, 342000}, {22, 416400}];
day_reward({446, 1}) ->
    [{32, 11400}, {1, 342500}, {22, 417000}];
day_reward({447, 1}) ->
    [{32, 11420}, {1, 343000}, {22, 417600}];
day_reward({448, 1}) ->
    [{32, 11440}, {1, 343500}, {22, 418200}];
day_reward({449, 1}) ->
    [{32, 11460}, {1, 344000}, {22, 418800}];
day_reward({450, 1}) ->
    [{32, 11480}, {1, 344500}, {22, 419400}];
day_reward({451, 1}) ->
    [{32, 11500}, {1, 345000}, {22, 420000}];
day_reward({452, 1}) ->
    [{32, 11520}, {1, 345500}, {22, 420600}];
day_reward({453, 1}) ->
    [{32, 11540}, {1, 346000}, {22, 421200}];
day_reward({454, 1}) ->
    [{32, 11560}, {1, 346500}, {22, 421800}];
day_reward({455, 1}) ->
    [{32, 11580}, {1, 347000}, {22, 422400}];
day_reward({456, 1}) ->
    [{32, 11600}, {1, 347500}, {22, 423000}];
day_reward({457, 1}) ->
    [{32, 11620}, {1, 348000}, {22, 423600}];
day_reward({458, 1}) ->
    [{32, 11640}, {1, 348500}, {22, 424200}];
day_reward({459, 1}) ->
    [{32, 11660}, {1, 349000}, {22, 424800}];
day_reward({460, 1}) ->
    [{32, 11680}, {1, 349500}, {22, 425400}];
day_reward({461, 1}) ->
    [{32, 11700}, {1, 350000}, {22, 426000}];
day_reward({462, 1}) ->
    [{32, 11720}, {1, 350500}, {22, 426600}];
day_reward({463, 1}) ->
    [{32, 11740}, {1, 351000}, {22, 427200}];
day_reward({464, 1}) ->
    [{32, 11760}, {1, 351500}, {22, 427800}];
day_reward({465, 1}) ->
    [{32, 11780}, {1, 352000}, {22, 428400}];
day_reward({466, 1}) ->
    [{32, 11800}, {1, 352500}, {22, 429000}];
day_reward({467, 1}) ->
    [{32, 11820}, {1, 353000}, {22, 429600}];
day_reward({468, 1}) ->
    [{32, 11840}, {1, 353500}, {22, 430200}];
day_reward({469, 1}) ->
    [{32, 11860}, {1, 354000}, {22, 430800}];
day_reward({470, 1}) ->
    [{32, 11880}, {1, 354500}, {22, 431400}];
day_reward({471, 1}) ->
    [{32, 11900}, {1, 355000}, {22, 432000}];
day_reward({472, 1}) ->
    [{32, 11920}, {1, 355500}, {22, 432600}];
day_reward({473, 1}) ->
    [{32, 11940}, {1, 356000}, {22, 433200}];
day_reward({474, 1}) ->
    [{32, 11960}, {1, 356500}, {22, 433800}];
day_reward({475, 1}) ->
    [{32, 11980}, {1, 357000}, {22, 434400}];
day_reward({476, 1}) ->
    [{32, 12000}, {1, 357500}, {22, 435000}];
day_reward({477, 1}) ->
    [{32, 12020}, {1, 358000}, {22, 435600}];
day_reward({478, 1}) ->
    [{32, 12040}, {1, 358500}, {22, 436200}];
day_reward({479, 1}) ->
    [{32, 12060}, {1, 359000}, {22, 436800}];
day_reward({480, 1}) ->
    [{32, 12080}, {1, 359500}, {22, 437400}];
day_reward({481, 1}) ->
    [{32, 12100}, {1, 360000}, {22, 438000}];
day_reward({482, 1}) ->
    [{32, 12120}, {1, 360500}, {22, 438600}];
day_reward({483, 1}) ->
    [{32, 12140}, {1, 361000}, {22, 439200}];
day_reward({484, 1}) ->
    [{32, 12160}, {1, 361500}, {22, 439800}];
day_reward({485, 1}) ->
    [{32, 12180}, {1, 362000}, {22, 440400}];
day_reward({486, 1}) ->
    [{32, 12200}, {1, 362500}, {22, 441000}];
day_reward({487, 1}) ->
    [{32, 12220}, {1, 363000}, {22, 441600}];
day_reward({488, 1}) ->
    [{32, 12240}, {1, 363500}, {22, 442200}];
day_reward({489, 1}) ->
    [{32, 12260}, {1, 364000}, {22, 442800}];
day_reward({490, 1}) ->
    [{32, 12280}, {1, 364500}, {22, 443400}];
day_reward({491, 1}) ->
    [{32, 12300}, {1, 365000}, {22, 444000}];
day_reward({492, 1}) ->
    [{32, 12320}, {1, 365500}, {22, 444600}];
day_reward({493, 1}) ->
    [{32, 12340}, {1, 366000}, {22, 445200}];
day_reward({494, 1}) ->
    [{32, 12360}, {1, 366500}, {22, 445800}];
day_reward({495, 1}) ->
    [{32, 12380}, {1, 367000}, {22, 446400}];
day_reward({496, 1}) ->
    [{32, 12400}, {1, 367500}, {22, 447000}];
day_reward({497, 1}) ->
    [{32, 12420}, {1, 368000}, {22, 447600}];
day_reward({498, 1}) ->
    [{32, 12440}, {1, 368500}, {22, 448200}];
day_reward({499, 1}) ->
    [{32, 12460}, {1, 369000}, {22, 448800}];
day_reward({500, 1}) ->
    [{32, 12480}, {1, 369500}, {22, 449400}];
day_reward({1, 2}) ->
    [{32, 2500}, {1, 120000}, {22, 150000}];
day_reward({2, 2}) ->
    [{32, 2520}, {1, 120500}, {22, 150600}];
day_reward({3, 2}) ->
    [{32, 2540}, {1, 121000}, {22, 151200}];
day_reward({4, 2}) ->
    [{32, 2560}, {1, 121500}, {22, 151800}];
day_reward({5, 2}) ->
    [{32, 2580}, {1, 122000}, {22, 152400}];
day_reward({6, 2}) ->
    [{32, 2600}, {1, 122500}, {22, 153000}];
day_reward({7, 2}) ->
    [{32, 2620}, {1, 123000}, {22, 153600}];
day_reward({8, 2}) ->
    [{32, 2640}, {1, 123500}, {22, 154200}];
day_reward({9, 2}) ->
    [{32, 2660}, {1, 124000}, {22, 154800}];
day_reward({10, 2}) ->
    [{32, 2680}, {1, 124500}, {22, 155400}];
day_reward({11, 2}) ->
    [{32, 2700}, {1, 125000}, {22, 156000}];
day_reward({12, 2}) ->
    [{32, 2720}, {1, 125500}, {22, 156600}];
day_reward({13, 2}) ->
    [{32, 2740}, {1, 126000}, {22, 157200}];
day_reward({14, 2}) ->
    [{32, 2760}, {1, 126500}, {22, 157800}];
day_reward({15, 2}) ->
    [{32, 2780}, {1, 127000}, {22, 158400}];
day_reward({16, 2}) ->
    [{32, 2800}, {1, 127500}, {22, 159000}];
day_reward({17, 2}) ->
    [{32, 2820}, {1, 128000}, {22, 159600}];
day_reward({18, 2}) ->
    [{32, 2840}, {1, 128500}, {22, 160200}];
day_reward({19, 2}) ->
    [{32, 2860}, {1, 129000}, {22, 160800}];
day_reward({20, 2}) ->
    [{32, 2880}, {1, 129500}, {22, 161400}];
day_reward({21, 2}) ->
    [{32, 2900}, {1, 130000}, {22, 162000}];
day_reward({22, 2}) ->
    [{32, 2920}, {1, 130500}, {22, 162600}];
day_reward({23, 2}) ->
    [{32, 2940}, {1, 131000}, {22, 163200}];
day_reward({24, 2}) ->
    [{32, 2960}, {1, 131500}, {22, 163800}];
day_reward({25, 2}) ->
    [{32, 2980}, {1, 132000}, {22, 164400}];
day_reward({26, 2}) ->
    [{32, 3000}, {1, 132500}, {22, 165000}];
day_reward({27, 2}) ->
    [{32, 3020}, {1, 133000}, {22, 165600}];
day_reward({28, 2}) ->
    [{32, 3040}, {1, 133500}, {22, 166200}];
day_reward({29, 2}) ->
    [{32, 3060}, {1, 134000}, {22, 166800}];
day_reward({30, 2}) ->
    [{32, 3080}, {1, 134500}, {22, 167400}];
day_reward({31, 2}) ->
    [{32, 3100}, {1, 135000}, {22, 168000}];
day_reward({32, 2}) ->
    [{32, 3120}, {1, 135500}, {22, 168600}];
day_reward({33, 2}) ->
    [{32, 3140}, {1, 136000}, {22, 169200}];
day_reward({34, 2}) ->
    [{32, 3160}, {1, 136500}, {22, 169800}];
day_reward({35, 2}) ->
    [{32, 3180}, {1, 137000}, {22, 170400}];
day_reward({36, 2}) ->
    [{32, 3200}, {1, 137500}, {22, 171000}];
day_reward({37, 2}) ->
    [{32, 3220}, {1, 138000}, {22, 171600}];
day_reward({38, 2}) ->
    [{32, 3240}, {1, 138500}, {22, 172200}];
day_reward({39, 2}) ->
    [{32, 3260}, {1, 139000}, {22, 172800}];
day_reward({40, 2}) ->
    [{32, 3280}, {1, 139500}, {22, 173400}];
day_reward({41, 2}) ->
    [{32, 3300}, {1, 140000}, {22, 174000}];
day_reward({42, 2}) ->
    [{32, 3320}, {1, 140500}, {22, 174600}];
day_reward({43, 2}) ->
    [{32, 3340}, {1, 141000}, {22, 175200}];
day_reward({44, 2}) ->
    [{32, 3360}, {1, 141500}, {22, 175800}];
day_reward({45, 2}) ->
    [{32, 3380}, {1, 142000}, {22, 176400}];
day_reward({46, 2}) ->
    [{32, 3400}, {1, 142500}, {22, 177000}];
day_reward({47, 2}) ->
    [{32, 3420}, {1, 143000}, {22, 177600}];
day_reward({48, 2}) ->
    [{32, 3440}, {1, 143500}, {22, 178200}];
day_reward({49, 2}) ->
    [{32, 3460}, {1, 144000}, {22, 178800}];
day_reward({50, 2}) ->
    [{32, 3480}, {1, 144500}, {22, 179400}];
day_reward({51, 2}) ->
    [{32, 3500}, {1, 145000}, {22, 180000}];
day_reward({52, 2}) ->
    [{32, 3520}, {1, 145500}, {22, 180600}];
day_reward({53, 2}) ->
    [{32, 3540}, {1, 146000}, {22, 181200}];
day_reward({54, 2}) ->
    [{32, 3560}, {1, 146500}, {22, 181800}];
day_reward({55, 2}) ->
    [{32, 3580}, {1, 147000}, {22, 182400}];
day_reward({56, 2}) ->
    [{32, 3600}, {1, 147500}, {22, 183000}];
day_reward({57, 2}) ->
    [{32, 3620}, {1, 148000}, {22, 183600}];
day_reward({58, 2}) ->
    [{32, 3640}, {1, 148500}, {22, 184200}];
day_reward({59, 2}) ->
    [{32, 3660}, {1, 149000}, {22, 184800}];
day_reward({60, 2}) ->
    [{32, 3680}, {1, 149500}, {22, 185400}];
day_reward({61, 2}) ->
    [{32, 3700}, {1, 150000}, {22, 186000}];
day_reward({62, 2}) ->
    [{32, 3720}, {1, 150500}, {22, 186600}];
day_reward({63, 2}) ->
    [{32, 3740}, {1, 151000}, {22, 187200}];
day_reward({64, 2}) ->
    [{32, 3760}, {1, 151500}, {22, 187800}];
day_reward({65, 2}) ->
    [{32, 3780}, {1, 152000}, {22, 188400}];
day_reward({66, 2}) ->
    [{32, 3800}, {1, 152500}, {22, 189000}];
day_reward({67, 2}) ->
    [{32, 3820}, {1, 153000}, {22, 189600}];
day_reward({68, 2}) ->
    [{32, 3840}, {1, 153500}, {22, 190200}];
day_reward({69, 2}) ->
    [{32, 3860}, {1, 154000}, {22, 190800}];
day_reward({70, 2}) ->
    [{32, 3880}, {1, 154500}, {22, 191400}];
day_reward({71, 2}) ->
    [{32, 3900}, {1, 155000}, {22, 192000}];
day_reward({72, 2}) ->
    [{32, 3920}, {1, 155500}, {22, 192600}];
day_reward({73, 2}) ->
    [{32, 3940}, {1, 156000}, {22, 193200}];
day_reward({74, 2}) ->
    [{32, 3960}, {1, 156500}, {22, 193800}];
day_reward({75, 2}) ->
    [{32, 3980}, {1, 157000}, {22, 194400}];
day_reward({76, 2}) ->
    [{32, 4000}, {1, 157500}, {22, 195000}];
day_reward({77, 2}) ->
    [{32, 4020}, {1, 158000}, {22, 195600}];
day_reward({78, 2}) ->
    [{32, 4040}, {1, 158500}, {22, 196200}];
day_reward({79, 2}) ->
    [{32, 4060}, {1, 159000}, {22, 196800}];
day_reward({80, 2}) ->
    [{32, 4080}, {1, 159500}, {22, 197400}];
day_reward({81, 2}) ->
    [{32, 4100}, {1, 160000}, {22, 198000}];
day_reward({82, 2}) ->
    [{32, 4120}, {1, 160500}, {22, 198600}];
day_reward({83, 2}) ->
    [{32, 4140}, {1, 161000}, {22, 199200}];
day_reward({84, 2}) ->
    [{32, 4160}, {1, 161500}, {22, 199800}];
day_reward({85, 2}) ->
    [{32, 4180}, {1, 162000}, {22, 200400}];
day_reward({86, 2}) ->
    [{32, 4200}, {1, 162500}, {22, 201000}];
day_reward({87, 2}) ->
    [{32, 4220}, {1, 163000}, {22, 201600}];
day_reward({88, 2}) ->
    [{32, 4240}, {1, 163500}, {22, 202200}];
day_reward({89, 2}) ->
    [{32, 4260}, {1, 164000}, {22, 202800}];
day_reward({90, 2}) ->
    [{32, 4280}, {1, 164500}, {22, 203400}];
day_reward({91, 2}) ->
    [{32, 4300}, {1, 165000}, {22, 204000}];
day_reward({92, 2}) ->
    [{32, 4320}, {1, 165500}, {22, 204600}];
day_reward({93, 2}) ->
    [{32, 4340}, {1, 166000}, {22, 205200}];
day_reward({94, 2}) ->
    [{32, 4360}, {1, 166500}, {22, 205800}];
day_reward({95, 2}) ->
    [{32, 4380}, {1, 167000}, {22, 206400}];
day_reward({96, 2}) ->
    [{32, 4400}, {1, 167500}, {22, 207000}];
day_reward({97, 2}) ->
    [{32, 4420}, {1, 168000}, {22, 207600}];
day_reward({98, 2}) ->
    [{32, 4440}, {1, 168500}, {22, 208200}];
day_reward({99, 2}) ->
    [{32, 4460}, {1, 169000}, {22, 208800}];
day_reward({100, 2}) ->
    [{32, 4480}, {1, 169500}, {22, 209400}];
day_reward({101, 2}) ->
    [{32, 4500}, {1, 170000}, {22, 210000}];
day_reward({102, 2}) ->
    [{32, 4520}, {1, 170500}, {22, 210600}];
day_reward({103, 2}) ->
    [{32, 4540}, {1, 171000}, {22, 211200}];
day_reward({104, 2}) ->
    [{32, 4560}, {1, 171500}, {22, 211800}];
day_reward({105, 2}) ->
    [{32, 4580}, {1, 172000}, {22, 212400}];
day_reward({106, 2}) ->
    [{32, 4600}, {1, 172500}, {22, 213000}];
day_reward({107, 2}) ->
    [{32, 4620}, {1, 173000}, {22, 213600}];
day_reward({108, 2}) ->
    [{32, 4640}, {1, 173500}, {22, 214200}];
day_reward({109, 2}) ->
    [{32, 4660}, {1, 174000}, {22, 214800}];
day_reward({110, 2}) ->
    [{32, 4680}, {1, 174500}, {22, 215400}];
day_reward({111, 2}) ->
    [{32, 4700}, {1, 175000}, {22, 216000}];
day_reward({112, 2}) ->
    [{32, 4720}, {1, 175500}, {22, 216600}];
day_reward({113, 2}) ->
    [{32, 4740}, {1, 176000}, {22, 217200}];
day_reward({114, 2}) ->
    [{32, 4760}, {1, 176500}, {22, 217800}];
day_reward({115, 2}) ->
    [{32, 4780}, {1, 177000}, {22, 218400}];
day_reward({116, 2}) ->
    [{32, 4800}, {1, 177500}, {22, 219000}];
day_reward({117, 2}) ->
    [{32, 4820}, {1, 178000}, {22, 219600}];
day_reward({118, 2}) ->
    [{32, 4840}, {1, 178500}, {22, 220200}];
day_reward({119, 2}) ->
    [{32, 4860}, {1, 179000}, {22, 220800}];
day_reward({120, 2}) ->
    [{32, 4880}, {1, 179500}, {22, 221400}];
day_reward({121, 2}) ->
    [{32, 4900}, {1, 180000}, {22, 222000}];
day_reward({122, 2}) ->
    [{32, 4920}, {1, 180500}, {22, 222600}];
day_reward({123, 2}) ->
    [{32, 4940}, {1, 181000}, {22, 223200}];
day_reward({124, 2}) ->
    [{32, 4960}, {1, 181500}, {22, 223800}];
day_reward({125, 2}) ->
    [{32, 4980}, {1, 182000}, {22, 224400}];
day_reward({126, 2}) ->
    [{32, 5000}, {1, 182500}, {22, 225000}];
day_reward({127, 2}) ->
    [{32, 5020}, {1, 183000}, {22, 225600}];
day_reward({128, 2}) ->
    [{32, 5040}, {1, 183500}, {22, 226200}];
day_reward({129, 2}) ->
    [{32, 5060}, {1, 184000}, {22, 226800}];
day_reward({130, 2}) ->
    [{32, 5080}, {1, 184500}, {22, 227400}];
day_reward({131, 2}) ->
    [{32, 5100}, {1, 185000}, {22, 228000}];
day_reward({132, 2}) ->
    [{32, 5120}, {1, 185500}, {22, 228600}];
day_reward({133, 2}) ->
    [{32, 5140}, {1, 186000}, {22, 229200}];
day_reward({134, 2}) ->
    [{32, 5160}, {1, 186500}, {22, 229800}];
day_reward({135, 2}) ->
    [{32, 5180}, {1, 187000}, {22, 230400}];
day_reward({136, 2}) ->
    [{32, 5200}, {1, 187500}, {22, 231000}];
day_reward({137, 2}) ->
    [{32, 5220}, {1, 188000}, {22, 231600}];
day_reward({138, 2}) ->
    [{32, 5240}, {1, 188500}, {22, 232200}];
day_reward({139, 2}) ->
    [{32, 5260}, {1, 189000}, {22, 232800}];
day_reward({140, 2}) ->
    [{32, 5280}, {1, 189500}, {22, 233400}];
day_reward({141, 2}) ->
    [{32, 5300}, {1, 190000}, {22, 234000}];
day_reward({142, 2}) ->
    [{32, 5320}, {1, 190500}, {22, 234600}];
day_reward({143, 2}) ->
    [{32, 5340}, {1, 191000}, {22, 235200}];
day_reward({144, 2}) ->
    [{32, 5360}, {1, 191500}, {22, 235800}];
day_reward({145, 2}) ->
    [{32, 5380}, {1, 192000}, {22, 236400}];
day_reward({146, 2}) ->
    [{32, 5400}, {1, 192500}, {22, 237000}];
day_reward({147, 2}) ->
    [{32, 5420}, {1, 193000}, {22, 237600}];
day_reward({148, 2}) ->
    [{32, 5440}, {1, 193500}, {22, 238200}];
day_reward({149, 2}) ->
    [{32, 5460}, {1, 194000}, {22, 238800}];
day_reward({150, 2}) ->
    [{32, 5480}, {1, 194500}, {22, 239400}];
day_reward({151, 2}) ->
    [{32, 5500}, {1, 195000}, {22, 240000}];
day_reward({152, 2}) ->
    [{32, 5520}, {1, 195500}, {22, 240600}];
day_reward({153, 2}) ->
    [{32, 5540}, {1, 196000}, {22, 241200}];
day_reward({154, 2}) ->
    [{32, 5560}, {1, 196500}, {22, 241800}];
day_reward({155, 2}) ->
    [{32, 5580}, {1, 197000}, {22, 242400}];
day_reward({156, 2}) ->
    [{32, 5600}, {1, 197500}, {22, 243000}];
day_reward({157, 2}) ->
    [{32, 5620}, {1, 198000}, {22, 243600}];
day_reward({158, 2}) ->
    [{32, 5640}, {1, 198500}, {22, 244200}];
day_reward({159, 2}) ->
    [{32, 5660}, {1, 199000}, {22, 244800}];
day_reward({160, 2}) ->
    [{32, 5680}, {1, 199500}, {22, 245400}];
day_reward({161, 2}) ->
    [{32, 5700}, {1, 200000}, {22, 246000}];
day_reward({162, 2}) ->
    [{32, 5720}, {1, 200500}, {22, 246600}];
day_reward({163, 2}) ->
    [{32, 5740}, {1, 201000}, {22, 247200}];
day_reward({164, 2}) ->
    [{32, 5760}, {1, 201500}, {22, 247800}];
day_reward({165, 2}) ->
    [{32, 5780}, {1, 202000}, {22, 248400}];
day_reward({166, 2}) ->
    [{32, 5800}, {1, 202500}, {22, 249000}];
day_reward({167, 2}) ->
    [{32, 5820}, {1, 203000}, {22, 249600}];
day_reward({168, 2}) ->
    [{32, 5840}, {1, 203500}, {22, 250200}];
day_reward({169, 2}) ->
    [{32, 5860}, {1, 204000}, {22, 250800}];
day_reward({170, 2}) ->
    [{32, 5880}, {1, 204500}, {22, 251400}];
day_reward({171, 2}) ->
    [{32, 5900}, {1, 205000}, {22, 252000}];
day_reward({172, 2}) ->
    [{32, 5920}, {1, 205500}, {22, 252600}];
day_reward({173, 2}) ->
    [{32, 5940}, {1, 206000}, {22, 253200}];
day_reward({174, 2}) ->
    [{32, 5960}, {1, 206500}, {22, 253800}];
day_reward({175, 2}) ->
    [{32, 5980}, {1, 207000}, {22, 254400}];
day_reward({176, 2}) ->
    [{32, 6000}, {1, 207500}, {22, 255000}];
day_reward({177, 2}) ->
    [{32, 6020}, {1, 208000}, {22, 255600}];
day_reward({178, 2}) ->
    [{32, 6040}, {1, 208500}, {22, 256200}];
day_reward({179, 2}) ->
    [{32, 6060}, {1, 209000}, {22, 256800}];
day_reward({180, 2}) ->
    [{32, 6080}, {1, 209500}, {22, 257400}];
day_reward({181, 2}) ->
    [{32, 6100}, {1, 210000}, {22, 258000}];
day_reward({182, 2}) ->
    [{32, 6120}, {1, 210500}, {22, 258600}];
day_reward({183, 2}) ->
    [{32, 6140}, {1, 211000}, {22, 259200}];
day_reward({184, 2}) ->
    [{32, 6160}, {1, 211500}, {22, 259800}];
day_reward({185, 2}) ->
    [{32, 6180}, {1, 212000}, {22, 260400}];
day_reward({186, 2}) ->
    [{32, 6200}, {1, 212500}, {22, 261000}];
day_reward({187, 2}) ->
    [{32, 6220}, {1, 213000}, {22, 261600}];
day_reward({188, 2}) ->
    [{32, 6240}, {1, 213500}, {22, 262200}];
day_reward({189, 2}) ->
    [{32, 6260}, {1, 214000}, {22, 262800}];
day_reward({190, 2}) ->
    [{32, 6280}, {1, 214500}, {22, 263400}];
day_reward({191, 2}) ->
    [{32, 6300}, {1, 215000}, {22, 264000}];
day_reward({192, 2}) ->
    [{32, 6320}, {1, 215500}, {22, 264600}];
day_reward({193, 2}) ->
    [{32, 6340}, {1, 216000}, {22, 265200}];
day_reward({194, 2}) ->
    [{32, 6360}, {1, 216500}, {22, 265800}];
day_reward({195, 2}) ->
    [{32, 6380}, {1, 217000}, {22, 266400}];
day_reward({196, 2}) ->
    [{32, 6400}, {1, 217500}, {22, 267000}];
day_reward({197, 2}) ->
    [{32, 6420}, {1, 218000}, {22, 267600}];
day_reward({198, 2}) ->
    [{32, 6440}, {1, 218500}, {22, 268200}];
day_reward({199, 2}) ->
    [{32, 6460}, {1, 219000}, {22, 268800}];
day_reward({200, 2}) ->
    [{32, 6480}, {1, 219500}, {22, 269400}];
day_reward({201, 2}) ->
    [{32, 6500}, {1, 220000}, {22, 270000}];
day_reward({202, 2}) ->
    [{32, 6520}, {1, 220500}, {22, 270600}];
day_reward({203, 2}) ->
    [{32, 6540}, {1, 221000}, {22, 271200}];
day_reward({204, 2}) ->
    [{32, 6560}, {1, 221500}, {22, 271800}];
day_reward({205, 2}) ->
    [{32, 6580}, {1, 222000}, {22, 272400}];
day_reward({206, 2}) ->
    [{32, 6600}, {1, 222500}, {22, 273000}];
day_reward({207, 2}) ->
    [{32, 6620}, {1, 223000}, {22, 273600}];
day_reward({208, 2}) ->
    [{32, 6640}, {1, 223500}, {22, 274200}];
day_reward({209, 2}) ->
    [{32, 6660}, {1, 224000}, {22, 274800}];
day_reward({210, 2}) ->
    [{32, 6680}, {1, 224500}, {22, 275400}];
day_reward({211, 2}) ->
    [{32, 6700}, {1, 225000}, {22, 276000}];
day_reward({212, 2}) ->
    [{32, 6720}, {1, 225500}, {22, 276600}];
day_reward({213, 2}) ->
    [{32, 6740}, {1, 226000}, {22, 277200}];
day_reward({214, 2}) ->
    [{32, 6760}, {1, 226500}, {22, 277800}];
day_reward({215, 2}) ->
    [{32, 6780}, {1, 227000}, {22, 278400}];
day_reward({216, 2}) ->
    [{32, 6800}, {1, 227500}, {22, 279000}];
day_reward({217, 2}) ->
    [{32, 6820}, {1, 228000}, {22, 279600}];
day_reward({218, 2}) ->
    [{32, 6840}, {1, 228500}, {22, 280200}];
day_reward({219, 2}) ->
    [{32, 6860}, {1, 229000}, {22, 280800}];
day_reward({220, 2}) ->
    [{32, 6880}, {1, 229500}, {22, 281400}];
day_reward({221, 2}) ->
    [{32, 6900}, {1, 230000}, {22, 282000}];
day_reward({222, 2}) ->
    [{32, 6920}, {1, 230500}, {22, 282600}];
day_reward({223, 2}) ->
    [{32, 6940}, {1, 231000}, {22, 283200}];
day_reward({224, 2}) ->
    [{32, 6960}, {1, 231500}, {22, 283800}];
day_reward({225, 2}) ->
    [{32, 6980}, {1, 232000}, {22, 284400}];
day_reward({226, 2}) ->
    [{32, 7000}, {1, 232500}, {22, 285000}];
day_reward({227, 2}) ->
    [{32, 7020}, {1, 233000}, {22, 285600}];
day_reward({228, 2}) ->
    [{32, 7040}, {1, 233500}, {22, 286200}];
day_reward({229, 2}) ->
    [{32, 7060}, {1, 234000}, {22, 286800}];
day_reward({230, 2}) ->
    [{32, 7080}, {1, 234500}, {22, 287400}];
day_reward({231, 2}) ->
    [{32, 7100}, {1, 235000}, {22, 288000}];
day_reward({232, 2}) ->
    [{32, 7120}, {1, 235500}, {22, 288600}];
day_reward({233, 2}) ->
    [{32, 7140}, {1, 236000}, {22, 289200}];
day_reward({234, 2}) ->
    [{32, 7160}, {1, 236500}, {22, 289800}];
day_reward({235, 2}) ->
    [{32, 7180}, {1, 237000}, {22, 290400}];
day_reward({236, 2}) ->
    [{32, 7200}, {1, 237500}, {22, 291000}];
day_reward({237, 2}) ->
    [{32, 7220}, {1, 238000}, {22, 291600}];
day_reward({238, 2}) ->
    [{32, 7240}, {1, 238500}, {22, 292200}];
day_reward({239, 2}) ->
    [{32, 7260}, {1, 239000}, {22, 292800}];
day_reward({240, 2}) ->
    [{32, 7280}, {1, 239500}, {22, 293400}];
day_reward({241, 2}) ->
    [{32, 7300}, {1, 240000}, {22, 294000}];
day_reward({242, 2}) ->
    [{32, 7320}, {1, 240500}, {22, 294600}];
day_reward({243, 2}) ->
    [{32, 7340}, {1, 241000}, {22, 295200}];
day_reward({244, 2}) ->
    [{32, 7360}, {1, 241500}, {22, 295800}];
day_reward({245, 2}) ->
    [{32, 7380}, {1, 242000}, {22, 296400}];
day_reward({246, 2}) ->
    [{32, 7400}, {1, 242500}, {22, 297000}];
day_reward({247, 2}) ->
    [{32, 7420}, {1, 243000}, {22, 297600}];
day_reward({248, 2}) ->
    [{32, 7440}, {1, 243500}, {22, 298200}];
day_reward({249, 2}) ->
    [{32, 7460}, {1, 244000}, {22, 298800}];
day_reward({250, 2}) ->
    [{32, 7480}, {1, 244500}, {22, 299400}];
day_reward({251, 2}) ->
    [{32, 7500}, {1, 245000}, {22, 300000}];
day_reward({252, 2}) ->
    [{32, 7520}, {1, 245500}, {22, 300600}];
day_reward({253, 2}) ->
    [{32, 7540}, {1, 246000}, {22, 301200}];
day_reward({254, 2}) ->
    [{32, 7560}, {1, 246500}, {22, 301800}];
day_reward({255, 2}) ->
    [{32, 7580}, {1, 247000}, {22, 302400}];
day_reward({256, 2}) ->
    [{32, 7600}, {1, 247500}, {22, 303000}];
day_reward({257, 2}) ->
    [{32, 7620}, {1, 248000}, {22, 303600}];
day_reward({258, 2}) ->
    [{32, 7640}, {1, 248500}, {22, 304200}];
day_reward({259, 2}) ->
    [{32, 7660}, {1, 249000}, {22, 304800}];
day_reward({260, 2}) ->
    [{32, 7680}, {1, 249500}, {22, 305400}];
day_reward({261, 2}) ->
    [{32, 7700}, {1, 250000}, {22, 306000}];
day_reward({262, 2}) ->
    [{32, 7720}, {1, 250500}, {22, 306600}];
day_reward({263, 2}) ->
    [{32, 7740}, {1, 251000}, {22, 307200}];
day_reward({264, 2}) ->
    [{32, 7760}, {1, 251500}, {22, 307800}];
day_reward({265, 2}) ->
    [{32, 7780}, {1, 252000}, {22, 308400}];
day_reward({266, 2}) ->
    [{32, 7800}, {1, 252500}, {22, 309000}];
day_reward({267, 2}) ->
    [{32, 7820}, {1, 253000}, {22, 309600}];
day_reward({268, 2}) ->
    [{32, 7840}, {1, 253500}, {22, 310200}];
day_reward({269, 2}) ->
    [{32, 7860}, {1, 254000}, {22, 310800}];
day_reward({270, 2}) ->
    [{32, 7880}, {1, 254500}, {22, 311400}];
day_reward({271, 2}) ->
    [{32, 7900}, {1, 255000}, {22, 312000}];
day_reward({272, 2}) ->
    [{32, 7920}, {1, 255500}, {22, 312600}];
day_reward({273, 2}) ->
    [{32, 7940}, {1, 256000}, {22, 313200}];
day_reward({274, 2}) ->
    [{32, 7960}, {1, 256500}, {22, 313800}];
day_reward({275, 2}) ->
    [{32, 7980}, {1, 257000}, {22, 314400}];
day_reward({276, 2}) ->
    [{32, 8000}, {1, 257500}, {22, 315000}];
day_reward({277, 2}) ->
    [{32, 8020}, {1, 258000}, {22, 315600}];
day_reward({278, 2}) ->
    [{32, 8040}, {1, 258500}, {22, 316200}];
day_reward({279, 2}) ->
    [{32, 8060}, {1, 259000}, {22, 316800}];
day_reward({280, 2}) ->
    [{32, 8080}, {1, 259500}, {22, 317400}];
day_reward({281, 2}) ->
    [{32, 8100}, {1, 260000}, {22, 318000}];
day_reward({282, 2}) ->
    [{32, 8120}, {1, 260500}, {22, 318600}];
day_reward({283, 2}) ->
    [{32, 8140}, {1, 261000}, {22, 319200}];
day_reward({284, 2}) ->
    [{32, 8160}, {1, 261500}, {22, 319800}];
day_reward({285, 2}) ->
    [{32, 8180}, {1, 262000}, {22, 320400}];
day_reward({286, 2}) ->
    [{32, 8200}, {1, 262500}, {22, 321000}];
day_reward({287, 2}) ->
    [{32, 8220}, {1, 263000}, {22, 321600}];
day_reward({288, 2}) ->
    [{32, 8240}, {1, 263500}, {22, 322200}];
day_reward({289, 2}) ->
    [{32, 8260}, {1, 264000}, {22, 322800}];
day_reward({290, 2}) ->
    [{32, 8280}, {1, 264500}, {22, 323400}];
day_reward({291, 2}) ->
    [{32, 8300}, {1, 265000}, {22, 324000}];
day_reward({292, 2}) ->
    [{32, 8320}, {1, 265500}, {22, 324600}];
day_reward({293, 2}) ->
    [{32, 8340}, {1, 266000}, {22, 325200}];
day_reward({294, 2}) ->
    [{32, 8360}, {1, 266500}, {22, 325800}];
day_reward({295, 2}) ->
    [{32, 8380}, {1, 267000}, {22, 326400}];
day_reward({296, 2}) ->
    [{32, 8400}, {1, 267500}, {22, 327000}];
day_reward({297, 2}) ->
    [{32, 8420}, {1, 268000}, {22, 327600}];
day_reward({298, 2}) ->
    [{32, 8440}, {1, 268500}, {22, 328200}];
day_reward({299, 2}) ->
    [{32, 8460}, {1, 269000}, {22, 328800}];
day_reward({300, 2}) ->
    [{32, 8480}, {1, 269500}, {22, 329400}];
day_reward({301, 2}) ->
    [{32, 8500}, {1, 270000}, {22, 330000}];
day_reward({302, 2}) ->
    [{32, 8520}, {1, 270500}, {22, 330600}];
day_reward({303, 2}) ->
    [{32, 8540}, {1, 271000}, {22, 331200}];
day_reward({304, 2}) ->
    [{32, 8560}, {1, 271500}, {22, 331800}];
day_reward({305, 2}) ->
    [{32, 8580}, {1, 272000}, {22, 332400}];
day_reward({306, 2}) ->
    [{32, 8600}, {1, 272500}, {22, 333000}];
day_reward({307, 2}) ->
    [{32, 8620}, {1, 273000}, {22, 333600}];
day_reward({308, 2}) ->
    [{32, 8640}, {1, 273500}, {22, 334200}];
day_reward({309, 2}) ->
    [{32, 8660}, {1, 274000}, {22, 334800}];
day_reward({310, 2}) ->
    [{32, 8680}, {1, 274500}, {22, 335400}];
day_reward({311, 2}) ->
    [{32, 8700}, {1, 275000}, {22, 336000}];
day_reward({312, 2}) ->
    [{32, 8720}, {1, 275500}, {22, 336600}];
day_reward({313, 2}) ->
    [{32, 8740}, {1, 276000}, {22, 337200}];
day_reward({314, 2}) ->
    [{32, 8760}, {1, 276500}, {22, 337800}];
day_reward({315, 2}) ->
    [{32, 8780}, {1, 277000}, {22, 338400}];
day_reward({316, 2}) ->
    [{32, 8800}, {1, 277500}, {22, 339000}];
day_reward({317, 2}) ->
    [{32, 8820}, {1, 278000}, {22, 339600}];
day_reward({318, 2}) ->
    [{32, 8840}, {1, 278500}, {22, 340200}];
day_reward({319, 2}) ->
    [{32, 8860}, {1, 279000}, {22, 340800}];
day_reward({320, 2}) ->
    [{32, 8880}, {1, 279500}, {22, 341400}];
day_reward({321, 2}) ->
    [{32, 8900}, {1, 280000}, {22, 342000}];
day_reward({322, 2}) ->
    [{32, 8920}, {1, 280500}, {22, 342600}];
day_reward({323, 2}) ->
    [{32, 8940}, {1, 281000}, {22, 343200}];
day_reward({324, 2}) ->
    [{32, 8960}, {1, 281500}, {22, 343800}];
day_reward({325, 2}) ->
    [{32, 8980}, {1, 282000}, {22, 344400}];
day_reward({326, 2}) ->
    [{32, 9000}, {1, 282500}, {22, 345000}];
day_reward({327, 2}) ->
    [{32, 9020}, {1, 283000}, {22, 345600}];
day_reward({328, 2}) ->
    [{32, 9040}, {1, 283500}, {22, 346200}];
day_reward({329, 2}) ->
    [{32, 9060}, {1, 284000}, {22, 346800}];
day_reward({330, 2}) ->
    [{32, 9080}, {1, 284500}, {22, 347400}];
day_reward({331, 2}) ->
    [{32, 9100}, {1, 285000}, {22, 348000}];
day_reward({332, 2}) ->
    [{32, 9120}, {1, 285500}, {22, 348600}];
day_reward({333, 2}) ->
    [{32, 9140}, {1, 286000}, {22, 349200}];
day_reward({334, 2}) ->
    [{32, 9160}, {1, 286500}, {22, 349800}];
day_reward({335, 2}) ->
    [{32, 9180}, {1, 287000}, {22, 350400}];
day_reward({336, 2}) ->
    [{32, 9200}, {1, 287500}, {22, 351000}];
day_reward({337, 2}) ->
    [{32, 9220}, {1, 288000}, {22, 351600}];
day_reward({338, 2}) ->
    [{32, 9240}, {1, 288500}, {22, 352200}];
day_reward({339, 2}) ->
    [{32, 9260}, {1, 289000}, {22, 352800}];
day_reward({340, 2}) ->
    [{32, 9280}, {1, 289500}, {22, 353400}];
day_reward({341, 2}) ->
    [{32, 9300}, {1, 290000}, {22, 354000}];
day_reward({342, 2}) ->
    [{32, 9320}, {1, 290500}, {22, 354600}];
day_reward({343, 2}) ->
    [{32, 9340}, {1, 291000}, {22, 355200}];
day_reward({344, 2}) ->
    [{32, 9360}, {1, 291500}, {22, 355800}];
day_reward({345, 2}) ->
    [{32, 9380}, {1, 292000}, {22, 356400}];
day_reward({346, 2}) ->
    [{32, 9400}, {1, 292500}, {22, 357000}];
day_reward({347, 2}) ->
    [{32, 9420}, {1, 293000}, {22, 357600}];
day_reward({348, 2}) ->
    [{32, 9440}, {1, 293500}, {22, 358200}];
day_reward({349, 2}) ->
    [{32, 9460}, {1, 294000}, {22, 358800}];
day_reward({350, 2}) ->
    [{32, 9480}, {1, 294500}, {22, 359400}];
day_reward({351, 2}) ->
    [{32, 9500}, {1, 295000}, {22, 360000}];
day_reward({352, 2}) ->
    [{32, 9520}, {1, 295500}, {22, 360600}];
day_reward({353, 2}) ->
    [{32, 9540}, {1, 296000}, {22, 361200}];
day_reward({354, 2}) ->
    [{32, 9560}, {1, 296500}, {22, 361800}];
day_reward({355, 2}) ->
    [{32, 9580}, {1, 297000}, {22, 362400}];
day_reward({356, 2}) ->
    [{32, 9600}, {1, 297500}, {22, 363000}];
day_reward({357, 2}) ->
    [{32, 9620}, {1, 298000}, {22, 363600}];
day_reward({358, 2}) ->
    [{32, 9640}, {1, 298500}, {22, 364200}];
day_reward({359, 2}) ->
    [{32, 9660}, {1, 299000}, {22, 364800}];
day_reward({360, 2}) ->
    [{32, 9680}, {1, 299500}, {22, 365400}];
day_reward({361, 2}) ->
    [{32, 9700}, {1, 300000}, {22, 366000}];
day_reward({362, 2}) ->
    [{32, 9720}, {1, 300500}, {22, 366600}];
day_reward({363, 2}) ->
    [{32, 9740}, {1, 301000}, {22, 367200}];
day_reward({364, 2}) ->
    [{32, 9760}, {1, 301500}, {22, 367800}];
day_reward({365, 2}) ->
    [{32, 9780}, {1, 302000}, {22, 368400}];
day_reward({366, 2}) ->
    [{32, 9800}, {1, 302500}, {22, 369000}];
day_reward({367, 2}) ->
    [{32, 9820}, {1, 303000}, {22, 369600}];
day_reward({368, 2}) ->
    [{32, 9840}, {1, 303500}, {22, 370200}];
day_reward({369, 2}) ->
    [{32, 9860}, {1, 304000}, {22, 370800}];
day_reward({370, 2}) ->
    [{32, 9880}, {1, 304500}, {22, 371400}];
day_reward({371, 2}) ->
    [{32, 9900}, {1, 305000}, {22, 372000}];
day_reward({372, 2}) ->
    [{32, 9920}, {1, 305500}, {22, 372600}];
day_reward({373, 2}) ->
    [{32, 9940}, {1, 306000}, {22, 373200}];
day_reward({374, 2}) ->
    [{32, 9960}, {1, 306500}, {22, 373800}];
day_reward({375, 2}) ->
    [{32, 9980}, {1, 307000}, {22, 374400}];
day_reward({376, 2}) ->
    [{32, 10000}, {1, 307500}, {22, 375000}];
day_reward({377, 2}) ->
    [{32, 10020}, {1, 308000}, {22, 375600}];
day_reward({378, 2}) ->
    [{32, 10040}, {1, 308500}, {22, 376200}];
day_reward({379, 2}) ->
    [{32, 10060}, {1, 309000}, {22, 376800}];
day_reward({380, 2}) ->
    [{32, 10080}, {1, 309500}, {22, 377400}];
day_reward({381, 2}) ->
    [{32, 10100}, {1, 310000}, {22, 378000}];
day_reward({382, 2}) ->
    [{32, 10120}, {1, 310500}, {22, 378600}];
day_reward({383, 2}) ->
    [{32, 10140}, {1, 311000}, {22, 379200}];
day_reward({384, 2}) ->
    [{32, 10160}, {1, 311500}, {22, 379800}];
day_reward({385, 2}) ->
    [{32, 10180}, {1, 312000}, {22, 380400}];
day_reward({386, 2}) ->
    [{32, 10200}, {1, 312500}, {22, 381000}];
day_reward({387, 2}) ->
    [{32, 10220}, {1, 313000}, {22, 381600}];
day_reward({388, 2}) ->
    [{32, 10240}, {1, 313500}, {22, 382200}];
day_reward({389, 2}) ->
    [{32, 10260}, {1, 314000}, {22, 382800}];
day_reward({390, 2}) ->
    [{32, 10280}, {1, 314500}, {22, 383400}];
day_reward({391, 2}) ->
    [{32, 10300}, {1, 315000}, {22, 384000}];
day_reward({392, 2}) ->
    [{32, 10320}, {1, 315500}, {22, 384600}];
day_reward({393, 2}) ->
    [{32, 10340}, {1, 316000}, {22, 385200}];
day_reward({394, 2}) ->
    [{32, 10360}, {1, 316500}, {22, 385800}];
day_reward({395, 2}) ->
    [{32, 10380}, {1, 317000}, {22, 386400}];
day_reward({396, 2}) ->
    [{32, 10400}, {1, 317500}, {22, 387000}];
day_reward({397, 2}) ->
    [{32, 10420}, {1, 318000}, {22, 387600}];
day_reward({398, 2}) ->
    [{32, 10440}, {1, 318500}, {22, 388200}];
day_reward({399, 2}) ->
    [{32, 10460}, {1, 319000}, {22, 388800}];
day_reward({400, 2}) ->
    [{32, 10480}, {1, 319500}, {22, 389400}];
day_reward({401, 2}) ->
    [{32, 10500}, {1, 320000}, {22, 390000}];
day_reward({402, 2}) ->
    [{32, 10520}, {1, 320500}, {22, 390600}];
day_reward({403, 2}) ->
    [{32, 10540}, {1, 321000}, {22, 391200}];
day_reward({404, 2}) ->
    [{32, 10560}, {1, 321500}, {22, 391800}];
day_reward({405, 2}) ->
    [{32, 10580}, {1, 322000}, {22, 392400}];
day_reward({406, 2}) ->
    [{32, 10600}, {1, 322500}, {22, 393000}];
day_reward({407, 2}) ->
    [{32, 10620}, {1, 323000}, {22, 393600}];
day_reward({408, 2}) ->
    [{32, 10640}, {1, 323500}, {22, 394200}];
day_reward({409, 2}) ->
    [{32, 10660}, {1, 324000}, {22, 394800}];
day_reward({410, 2}) ->
    [{32, 10680}, {1, 324500}, {22, 395400}];
day_reward({411, 2}) ->
    [{32, 10700}, {1, 325000}, {22, 396000}];
day_reward({412, 2}) ->
    [{32, 10720}, {1, 325500}, {22, 396600}];
day_reward({413, 2}) ->
    [{32, 10740}, {1, 326000}, {22, 397200}];
day_reward({414, 2}) ->
    [{32, 10760}, {1, 326500}, {22, 397800}];
day_reward({415, 2}) ->
    [{32, 10780}, {1, 327000}, {22, 398400}];
day_reward({416, 2}) ->
    [{32, 10800}, {1, 327500}, {22, 399000}];
day_reward({417, 2}) ->
    [{32, 10820}, {1, 328000}, {22, 399600}];
day_reward({418, 2}) ->
    [{32, 10840}, {1, 328500}, {22, 400200}];
day_reward({419, 2}) ->
    [{32, 10860}, {1, 329000}, {22, 400800}];
day_reward({420, 2}) ->
    [{32, 10880}, {1, 329500}, {22, 401400}];
day_reward({421, 2}) ->
    [{32, 10900}, {1, 330000}, {22, 402000}];
day_reward({422, 2}) ->
    [{32, 10920}, {1, 330500}, {22, 402600}];
day_reward({423, 2}) ->
    [{32, 10940}, {1, 331000}, {22, 403200}];
day_reward({424, 2}) ->
    [{32, 10960}, {1, 331500}, {22, 403800}];
day_reward({425, 2}) ->
    [{32, 10980}, {1, 332000}, {22, 404400}];
day_reward({426, 2}) ->
    [{32, 11000}, {1, 332500}, {22, 405000}];
day_reward({427, 2}) ->
    [{32, 11020}, {1, 333000}, {22, 405600}];
day_reward({428, 2}) ->
    [{32, 11040}, {1, 333500}, {22, 406200}];
day_reward({429, 2}) ->
    [{32, 11060}, {1, 334000}, {22, 406800}];
day_reward({430, 2}) ->
    [{32, 11080}, {1, 334500}, {22, 407400}];
day_reward({431, 2}) ->
    [{32, 11100}, {1, 335000}, {22, 408000}];
day_reward({432, 2}) ->
    [{32, 11120}, {1, 335500}, {22, 408600}];
day_reward({433, 2}) ->
    [{32, 11140}, {1, 336000}, {22, 409200}];
day_reward({434, 2}) ->
    [{32, 11160}, {1, 336500}, {22, 409800}];
day_reward({435, 2}) ->
    [{32, 11180}, {1, 337000}, {22, 410400}];
day_reward({436, 2}) ->
    [{32, 11200}, {1, 337500}, {22, 411000}];
day_reward({437, 2}) ->
    [{32, 11220}, {1, 338000}, {22, 411600}];
day_reward({438, 2}) ->
    [{32, 11240}, {1, 338500}, {22, 412200}];
day_reward({439, 2}) ->
    [{32, 11260}, {1, 339000}, {22, 412800}];
day_reward({440, 2}) ->
    [{32, 11280}, {1, 339500}, {22, 413400}];
day_reward({441, 2}) ->
    [{32, 11300}, {1, 340000}, {22, 414000}];
day_reward({442, 2}) ->
    [{32, 11320}, {1, 340500}, {22, 414600}];
day_reward({443, 2}) ->
    [{32, 11340}, {1, 341000}, {22, 415200}];
day_reward({444, 2}) ->
    [{32, 11360}, {1, 341500}, {22, 415800}];
day_reward({445, 2}) ->
    [{32, 11380}, {1, 342000}, {22, 416400}];
day_reward({446, 2}) ->
    [{32, 11400}, {1, 342500}, {22, 417000}];
day_reward({447, 2}) ->
    [{32, 11420}, {1, 343000}, {22, 417600}];
day_reward({448, 2}) ->
    [{32, 11440}, {1, 343500}, {22, 418200}];
day_reward({449, 2}) ->
    [{32, 11460}, {1, 344000}, {22, 418800}];
day_reward({450, 2}) ->
    [{32, 11480}, {1, 344500}, {22, 419400}];
day_reward({451, 2}) ->
    [{32, 11500}, {1, 345000}, {22, 420000}];
day_reward({452, 2}) ->
    [{32, 11520}, {1, 345500}, {22, 420600}];
day_reward({453, 2}) ->
    [{32, 11540}, {1, 346000}, {22, 421200}];
day_reward({454, 2}) ->
    [{32, 11560}, {1, 346500}, {22, 421800}];
day_reward({455, 2}) ->
    [{32, 11580}, {1, 347000}, {22, 422400}];
day_reward({456, 2}) ->
    [{32, 11600}, {1, 347500}, {22, 423000}];
day_reward({457, 2}) ->
    [{32, 11620}, {1, 348000}, {22, 423600}];
day_reward({458, 2}) ->
    [{32, 11640}, {1, 348500}, {22, 424200}];
day_reward({459, 2}) ->
    [{32, 11660}, {1, 349000}, {22, 424800}];
day_reward({460, 2}) ->
    [{32, 11680}, {1, 349500}, {22, 425400}];
day_reward({461, 2}) ->
    [{32, 11700}, {1, 350000}, {22, 426000}];
day_reward({462, 2}) ->
    [{32, 11720}, {1, 350500}, {22, 426600}];
day_reward({463, 2}) ->
    [{32, 11740}, {1, 351000}, {22, 427200}];
day_reward({464, 2}) ->
    [{32, 11760}, {1, 351500}, {22, 427800}];
day_reward({465, 2}) ->
    [{32, 11780}, {1, 352000}, {22, 428400}];
day_reward({466, 2}) ->
    [{32, 11800}, {1, 352500}, {22, 429000}];
day_reward({467, 2}) ->
    [{32, 11820}, {1, 353000}, {22, 429600}];
day_reward({468, 2}) ->
    [{32, 11840}, {1, 353500}, {22, 430200}];
day_reward({469, 2}) ->
    [{32, 11860}, {1, 354000}, {22, 430800}];
day_reward({470, 2}) ->
    [{32, 11880}, {1, 354500}, {22, 431400}];
day_reward({471, 2}) ->
    [{32, 11900}, {1, 355000}, {22, 432000}];
day_reward({472, 2}) ->
    [{32, 11920}, {1, 355500}, {22, 432600}];
day_reward({473, 2}) ->
    [{32, 11940}, {1, 356000}, {22, 433200}];
day_reward({474, 2}) ->
    [{32, 11960}, {1, 356500}, {22, 433800}];
day_reward({475, 2}) ->
    [{32, 11980}, {1, 357000}, {22, 434400}];
day_reward({476, 2}) ->
    [{32, 12000}, {1, 357500}, {22, 435000}];
day_reward({477, 2}) ->
    [{32, 12020}, {1, 358000}, {22, 435600}];
day_reward({478, 2}) ->
    [{32, 12040}, {1, 358500}, {22, 436200}];
day_reward({479, 2}) ->
    [{32, 12060}, {1, 359000}, {22, 436800}];
day_reward({480, 2}) ->
    [{32, 12080}, {1, 359500}, {22, 437400}];
day_reward({481, 2}) ->
    [{32, 12100}, {1, 360000}, {22, 438000}];
day_reward({482, 2}) ->
    [{32, 12120}, {1, 360500}, {22, 438600}];
day_reward({483, 2}) ->
    [{32, 12140}, {1, 361000}, {22, 439200}];
day_reward({484, 2}) ->
    [{32, 12160}, {1, 361500}, {22, 439800}];
day_reward({485, 2}) ->
    [{32, 12180}, {1, 362000}, {22, 440400}];
day_reward({486, 2}) ->
    [{32, 12200}, {1, 362500}, {22, 441000}];
day_reward({487, 2}) ->
    [{32, 12220}, {1, 363000}, {22, 441600}];
day_reward({488, 2}) ->
    [{32, 12240}, {1, 363500}, {22, 442200}];
day_reward({489, 2}) ->
    [{32, 12260}, {1, 364000}, {22, 442800}];
day_reward({490, 2}) ->
    [{32, 12280}, {1, 364500}, {22, 443400}];
day_reward({491, 2}) ->
    [{32, 12300}, {1, 365000}, {22, 444000}];
day_reward({492, 2}) ->
    [{32, 12320}, {1, 365500}, {22, 444600}];
day_reward({493, 2}) ->
    [{32, 12340}, {1, 366000}, {22, 445200}];
day_reward({494, 2}) ->
    [{32, 12360}, {1, 366500}, {22, 445800}];
day_reward({495, 2}) ->
    [{32, 12380}, {1, 367000}, {22, 446400}];
day_reward({496, 2}) ->
    [{32, 12400}, {1, 367500}, {22, 447000}];
day_reward({497, 2}) ->
    [{32, 12420}, {1, 368000}, {22, 447600}];
day_reward({498, 2}) ->
    [{32, 12440}, {1, 368500}, {22, 448200}];
day_reward({499, 2}) ->
    [{32, 12460}, {1, 369000}, {22, 448800}];
day_reward({500, 2}) ->
    [{32, 12480}, {1, 369500}, {22, 449400}];
day_reward({1, 3}) ->
    [{32, 2500}, {1, 120000}, {22, 150000}];
day_reward({2, 3}) ->
    [{32, 2520}, {1, 120500}, {22, 150600}];
day_reward({3, 3}) ->
    [{32, 2540}, {1, 121000}, {22, 151200}];
day_reward({4, 3}) ->
    [{32, 2560}, {1, 121500}, {22, 151800}];
day_reward({5, 3}) ->
    [{32, 2580}, {1, 122000}, {22, 152400}];
day_reward({6, 3}) ->
    [{32, 2600}, {1, 122500}, {22, 153000}];
day_reward({7, 3}) ->
    [{32, 2620}, {1, 123000}, {22, 153600}];
day_reward({8, 3}) ->
    [{32, 2640}, {1, 123500}, {22, 154200}];
day_reward({9, 3}) ->
    [{32, 2660}, {1, 124000}, {22, 154800}];
day_reward({10, 3}) ->
    [{32, 2680}, {1, 124500}, {22, 155400}];
day_reward({11, 3}) ->
    [{32, 2700}, {1, 125000}, {22, 156000}];
day_reward({12, 3}) ->
    [{32, 2720}, {1, 125500}, {22, 156600}];
day_reward({13, 3}) ->
    [{32, 2740}, {1, 126000}, {22, 157200}];
day_reward({14, 3}) ->
    [{32, 2760}, {1, 126500}, {22, 157800}];
day_reward({15, 3}) ->
    [{32, 2780}, {1, 127000}, {22, 158400}];
day_reward({16, 3}) ->
    [{32, 2800}, {1, 127500}, {22, 159000}];
day_reward({17, 3}) ->
    [{32, 2820}, {1, 128000}, {22, 159600}];
day_reward({18, 3}) ->
    [{32, 2840}, {1, 128500}, {22, 160200}];
day_reward({19, 3}) ->
    [{32, 2860}, {1, 129000}, {22, 160800}];
day_reward({20, 3}) ->
    [{32, 2880}, {1, 129500}, {22, 161400}];
day_reward({21, 3}) ->
    [{32, 2900}, {1, 130000}, {22, 162000}];
day_reward({22, 3}) ->
    [{32, 2920}, {1, 130500}, {22, 162600}];
day_reward({23, 3}) ->
    [{32, 2940}, {1, 131000}, {22, 163200}];
day_reward({24, 3}) ->
    [{32, 2960}, {1, 131500}, {22, 163800}];
day_reward({25, 3}) ->
    [{32, 2980}, {1, 132000}, {22, 164400}];
day_reward({26, 3}) ->
    [{32, 3000}, {1, 132500}, {22, 165000}];
day_reward({27, 3}) ->
    [{32, 3020}, {1, 133000}, {22, 165600}];
day_reward({28, 3}) ->
    [{32, 3040}, {1, 133500}, {22, 166200}];
day_reward({29, 3}) ->
    [{32, 3060}, {1, 134000}, {22, 166800}];
day_reward({30, 3}) ->
    [{32, 3080}, {1, 134500}, {22, 167400}];
day_reward({31, 3}) ->
    [{32, 3100}, {1, 135000}, {22, 168000}];
day_reward({32, 3}) ->
    [{32, 3120}, {1, 135500}, {22, 168600}];
day_reward({33, 3}) ->
    [{32, 3140}, {1, 136000}, {22, 169200}];
day_reward({34, 3}) ->
    [{32, 3160}, {1, 136500}, {22, 169800}];
day_reward({35, 3}) ->
    [{32, 3180}, {1, 137000}, {22, 170400}];
day_reward({36, 3}) ->
    [{32, 3200}, {1, 137500}, {22, 171000}];
day_reward({37, 3}) ->
    [{32, 3220}, {1, 138000}, {22, 171600}];
day_reward({38, 3}) ->
    [{32, 3240}, {1, 138500}, {22, 172200}];
day_reward({39, 3}) ->
    [{32, 3260}, {1, 139000}, {22, 172800}];
day_reward({40, 3}) ->
    [{32, 3280}, {1, 139500}, {22, 173400}];
day_reward({41, 3}) ->
    [{32, 3300}, {1, 140000}, {22, 174000}];
day_reward({42, 3}) ->
    [{32, 3320}, {1, 140500}, {22, 174600}];
day_reward({43, 3}) ->
    [{32, 3340}, {1, 141000}, {22, 175200}];
day_reward({44, 3}) ->
    [{32, 3360}, {1, 141500}, {22, 175800}];
day_reward({45, 3}) ->
    [{32, 3380}, {1, 142000}, {22, 176400}];
day_reward({46, 3}) ->
    [{32, 3400}, {1, 142500}, {22, 177000}];
day_reward({47, 3}) ->
    [{32, 3420}, {1, 143000}, {22, 177600}];
day_reward({48, 3}) ->
    [{32, 3440}, {1, 143500}, {22, 178200}];
day_reward({49, 3}) ->
    [{32, 3460}, {1, 144000}, {22, 178800}];
day_reward({50, 3}) ->
    [{32, 3480}, {1, 144500}, {22, 179400}];
day_reward({51, 3}) ->
    [{32, 3500}, {1, 145000}, {22, 180000}];
day_reward({52, 3}) ->
    [{32, 3520}, {1, 145500}, {22, 180600}];
day_reward({53, 3}) ->
    [{32, 3540}, {1, 146000}, {22, 181200}];
day_reward({54, 3}) ->
    [{32, 3560}, {1, 146500}, {22, 181800}];
day_reward({55, 3}) ->
    [{32, 3580}, {1, 147000}, {22, 182400}];
day_reward({56, 3}) ->
    [{32, 3600}, {1, 147500}, {22, 183000}];
day_reward({57, 3}) ->
    [{32, 3620}, {1, 148000}, {22, 183600}];
day_reward({58, 3}) ->
    [{32, 3640}, {1, 148500}, {22, 184200}];
day_reward({59, 3}) ->
    [{32, 3660}, {1, 149000}, {22, 184800}];
day_reward({60, 3}) ->
    [{32, 3680}, {1, 149500}, {22, 185400}];
day_reward({61, 3}) ->
    [{32, 3700}, {1, 150000}, {22, 186000}];
day_reward({62, 3}) ->
    [{32, 3720}, {1, 150500}, {22, 186600}];
day_reward({63, 3}) ->
    [{32, 3740}, {1, 151000}, {22, 187200}];
day_reward({64, 3}) ->
    [{32, 3760}, {1, 151500}, {22, 187800}];
day_reward({65, 3}) ->
    [{32, 3780}, {1, 152000}, {22, 188400}];
day_reward({66, 3}) ->
    [{32, 3800}, {1, 152500}, {22, 189000}];
day_reward({67, 3}) ->
    [{32, 3820}, {1, 153000}, {22, 189600}];
day_reward({68, 3}) ->
    [{32, 3840}, {1, 153500}, {22, 190200}];
day_reward({69, 3}) ->
    [{32, 3860}, {1, 154000}, {22, 190800}];
day_reward({70, 3}) ->
    [{32, 3880}, {1, 154500}, {22, 191400}];
day_reward({71, 3}) ->
    [{32, 3900}, {1, 155000}, {22, 192000}];
day_reward({72, 3}) ->
    [{32, 3920}, {1, 155500}, {22, 192600}];
day_reward({73, 3}) ->
    [{32, 3940}, {1, 156000}, {22, 193200}];
day_reward({74, 3}) ->
    [{32, 3960}, {1, 156500}, {22, 193800}];
day_reward({75, 3}) ->
    [{32, 3980}, {1, 157000}, {22, 194400}];
day_reward({76, 3}) ->
    [{32, 4000}, {1, 157500}, {22, 195000}];
day_reward({77, 3}) ->
    [{32, 4020}, {1, 158000}, {22, 195600}];
day_reward({78, 3}) ->
    [{32, 4040}, {1, 158500}, {22, 196200}];
day_reward({79, 3}) ->
    [{32, 4060}, {1, 159000}, {22, 196800}];
day_reward({80, 3}) ->
    [{32, 4080}, {1, 159500}, {22, 197400}];
day_reward({81, 3}) ->
    [{32, 4100}, {1, 160000}, {22, 198000}];
day_reward({82, 3}) ->
    [{32, 4120}, {1, 160500}, {22, 198600}];
day_reward({83, 3}) ->
    [{32, 4140}, {1, 161000}, {22, 199200}];
day_reward({84, 3}) ->
    [{32, 4160}, {1, 161500}, {22, 199800}];
day_reward({85, 3}) ->
    [{32, 4180}, {1, 162000}, {22, 200400}];
day_reward({86, 3}) ->
    [{32, 4200}, {1, 162500}, {22, 201000}];
day_reward({87, 3}) ->
    [{32, 4220}, {1, 163000}, {22, 201600}];
day_reward({88, 3}) ->
    [{32, 4240}, {1, 163500}, {22, 202200}];
day_reward({89, 3}) ->
    [{32, 4260}, {1, 164000}, {22, 202800}];
day_reward({90, 3}) ->
    [{32, 4280}, {1, 164500}, {22, 203400}];
day_reward({91, 3}) ->
    [{32, 4300}, {1, 165000}, {22, 204000}];
day_reward({92, 3}) ->
    [{32, 4320}, {1, 165500}, {22, 204600}];
day_reward({93, 3}) ->
    [{32, 4340}, {1, 166000}, {22, 205200}];
day_reward({94, 3}) ->
    [{32, 4360}, {1, 166500}, {22, 205800}];
day_reward({95, 3}) ->
    [{32, 4380}, {1, 167000}, {22, 206400}];
day_reward({96, 3}) ->
    [{32, 4400}, {1, 167500}, {22, 207000}];
day_reward({97, 3}) ->
    [{32, 4420}, {1, 168000}, {22, 207600}];
day_reward({98, 3}) ->
    [{32, 4440}, {1, 168500}, {22, 208200}];
day_reward({99, 3}) ->
    [{32, 4460}, {1, 169000}, {22, 208800}];
day_reward({100, 3}) ->
    [{32, 4480}, {1, 169500}, {22, 209400}];
day_reward({101, 3}) ->
    [{32, 4500}, {1, 170000}, {22, 210000}];
day_reward({102, 3}) ->
    [{32, 4520}, {1, 170500}, {22, 210600}];
day_reward({103, 3}) ->
    [{32, 4540}, {1, 171000}, {22, 211200}];
day_reward({104, 3}) ->
    [{32, 4560}, {1, 171500}, {22, 211800}];
day_reward({105, 3}) ->
    [{32, 4580}, {1, 172000}, {22, 212400}];
day_reward({106, 3}) ->
    [{32, 4600}, {1, 172500}, {22, 213000}];
day_reward({107, 3}) ->
    [{32, 4620}, {1, 173000}, {22, 213600}];
day_reward({108, 3}) ->
    [{32, 4640}, {1, 173500}, {22, 214200}];
day_reward({109, 3}) ->
    [{32, 4660}, {1, 174000}, {22, 214800}];
day_reward({110, 3}) ->
    [{32, 4680}, {1, 174500}, {22, 215400}];
day_reward({111, 3}) ->
    [{32, 4700}, {1, 175000}, {22, 216000}];
day_reward({112, 3}) ->
    [{32, 4720}, {1, 175500}, {22, 216600}];
day_reward({113, 3}) ->
    [{32, 4740}, {1, 176000}, {22, 217200}];
day_reward({114, 3}) ->
    [{32, 4760}, {1, 176500}, {22, 217800}];
day_reward({115, 3}) ->
    [{32, 4780}, {1, 177000}, {22, 218400}];
day_reward({116, 3}) ->
    [{32, 4800}, {1, 177500}, {22, 219000}];
day_reward({117, 3}) ->
    [{32, 4820}, {1, 178000}, {22, 219600}];
day_reward({118, 3}) ->
    [{32, 4840}, {1, 178500}, {22, 220200}];
day_reward({119, 3}) ->
    [{32, 4860}, {1, 179000}, {22, 220800}];
day_reward({120, 3}) ->
    [{32, 4880}, {1, 179500}, {22, 221400}];
day_reward({121, 3}) ->
    [{32, 4900}, {1, 180000}, {22, 222000}];
day_reward({122, 3}) ->
    [{32, 4920}, {1, 180500}, {22, 222600}];
day_reward({123, 3}) ->
    [{32, 4940}, {1, 181000}, {22, 223200}];
day_reward({124, 3}) ->
    [{32, 4960}, {1, 181500}, {22, 223800}];
day_reward({125, 3}) ->
    [{32, 4980}, {1, 182000}, {22, 224400}];
day_reward({126, 3}) ->
    [{32, 5000}, {1, 182500}, {22, 225000}];
day_reward({127, 3}) ->
    [{32, 5020}, {1, 183000}, {22, 225600}];
day_reward({128, 3}) ->
    [{32, 5040}, {1, 183500}, {22, 226200}];
day_reward({129, 3}) ->
    [{32, 5060}, {1, 184000}, {22, 226800}];
day_reward({130, 3}) ->
    [{32, 5080}, {1, 184500}, {22, 227400}];
day_reward({131, 3}) ->
    [{32, 5100}, {1, 185000}, {22, 228000}];
day_reward({132, 3}) ->
    [{32, 5120}, {1, 185500}, {22, 228600}];
day_reward({133, 3}) ->
    [{32, 5140}, {1, 186000}, {22, 229200}];
day_reward({134, 3}) ->
    [{32, 5160}, {1, 186500}, {22, 229800}];
day_reward({135, 3}) ->
    [{32, 5180}, {1, 187000}, {22, 230400}];
day_reward({136, 3}) ->
    [{32, 5200}, {1, 187500}, {22, 231000}];
day_reward({137, 3}) ->
    [{32, 5220}, {1, 188000}, {22, 231600}];
day_reward({138, 3}) ->
    [{32, 5240}, {1, 188500}, {22, 232200}];
day_reward({139, 3}) ->
    [{32, 5260}, {1, 189000}, {22, 232800}];
day_reward({140, 3}) ->
    [{32, 5280}, {1, 189500}, {22, 233400}];
day_reward({141, 3}) ->
    [{32, 5300}, {1, 190000}, {22, 234000}];
day_reward({142, 3}) ->
    [{32, 5320}, {1, 190500}, {22, 234600}];
day_reward({143, 3}) ->
    [{32, 5340}, {1, 191000}, {22, 235200}];
day_reward({144, 3}) ->
    [{32, 5360}, {1, 191500}, {22, 235800}];
day_reward({145, 3}) ->
    [{32, 5380}, {1, 192000}, {22, 236400}];
day_reward({146, 3}) ->
    [{32, 5400}, {1, 192500}, {22, 237000}];
day_reward({147, 3}) ->
    [{32, 5420}, {1, 193000}, {22, 237600}];
day_reward({148, 3}) ->
    [{32, 5440}, {1, 193500}, {22, 238200}];
day_reward({149, 3}) ->
    [{32, 5460}, {1, 194000}, {22, 238800}];
day_reward({150, 3}) ->
    [{32, 5480}, {1, 194500}, {22, 239400}];
day_reward({151, 3}) ->
    [{32, 5500}, {1, 195000}, {22, 240000}];
day_reward({152, 3}) ->
    [{32, 5520}, {1, 195500}, {22, 240600}];
day_reward({153, 3}) ->
    [{32, 5540}, {1, 196000}, {22, 241200}];
day_reward({154, 3}) ->
    [{32, 5560}, {1, 196500}, {22, 241800}];
day_reward({155, 3}) ->
    [{32, 5580}, {1, 197000}, {22, 242400}];
day_reward({156, 3}) ->
    [{32, 5600}, {1, 197500}, {22, 243000}];
day_reward({157, 3}) ->
    [{32, 5620}, {1, 198000}, {22, 243600}];
day_reward({158, 3}) ->
    [{32, 5640}, {1, 198500}, {22, 244200}];
day_reward({159, 3}) ->
    [{32, 5660}, {1, 199000}, {22, 244800}];
day_reward({160, 3}) ->
    [{32, 5680}, {1, 199500}, {22, 245400}];
day_reward({161, 3}) ->
    [{32, 5700}, {1, 200000}, {22, 246000}];
day_reward({162, 3}) ->
    [{32, 5720}, {1, 200500}, {22, 246600}];
day_reward({163, 3}) ->
    [{32, 5740}, {1, 201000}, {22, 247200}];
day_reward({164, 3}) ->
    [{32, 5760}, {1, 201500}, {22, 247800}];
day_reward({165, 3}) ->
    [{32, 5780}, {1, 202000}, {22, 248400}];
day_reward({166, 3}) ->
    [{32, 5800}, {1, 202500}, {22, 249000}];
day_reward({167, 3}) ->
    [{32, 5820}, {1, 203000}, {22, 249600}];
day_reward({168, 3}) ->
    [{32, 5840}, {1, 203500}, {22, 250200}];
day_reward({169, 3}) ->
    [{32, 5860}, {1, 204000}, {22, 250800}];
day_reward({170, 3}) ->
    [{32, 5880}, {1, 204500}, {22, 251400}];
day_reward({171, 3}) ->
    [{32, 5900}, {1, 205000}, {22, 252000}];
day_reward({172, 3}) ->
    [{32, 5920}, {1, 205500}, {22, 252600}];
day_reward({173, 3}) ->
    [{32, 5940}, {1, 206000}, {22, 253200}];
day_reward({174, 3}) ->
    [{32, 5960}, {1, 206500}, {22, 253800}];
day_reward({175, 3}) ->
    [{32, 5980}, {1, 207000}, {22, 254400}];
day_reward({176, 3}) ->
    [{32, 6000}, {1, 207500}, {22, 255000}];
day_reward({177, 3}) ->
    [{32, 6020}, {1, 208000}, {22, 255600}];
day_reward({178, 3}) ->
    [{32, 6040}, {1, 208500}, {22, 256200}];
day_reward({179, 3}) ->
    [{32, 6060}, {1, 209000}, {22, 256800}];
day_reward({180, 3}) ->
    [{32, 6080}, {1, 209500}, {22, 257400}];
day_reward({181, 3}) ->
    [{32, 6100}, {1, 210000}, {22, 258000}];
day_reward({182, 3}) ->
    [{32, 6120}, {1, 210500}, {22, 258600}];
day_reward({183, 3}) ->
    [{32, 6140}, {1, 211000}, {22, 259200}];
day_reward({184, 3}) ->
    [{32, 6160}, {1, 211500}, {22, 259800}];
day_reward({185, 3}) ->
    [{32, 6180}, {1, 212000}, {22, 260400}];
day_reward({186, 3}) ->
    [{32, 6200}, {1, 212500}, {22, 261000}];
day_reward({187, 3}) ->
    [{32, 6220}, {1, 213000}, {22, 261600}];
day_reward({188, 3}) ->
    [{32, 6240}, {1, 213500}, {22, 262200}];
day_reward({189, 3}) ->
    [{32, 6260}, {1, 214000}, {22, 262800}];
day_reward({190, 3}) ->
    [{32, 6280}, {1, 214500}, {22, 263400}];
day_reward({191, 3}) ->
    [{32, 6300}, {1, 215000}, {22, 264000}];
day_reward({192, 3}) ->
    [{32, 6320}, {1, 215500}, {22, 264600}];
day_reward({193, 3}) ->
    [{32, 6340}, {1, 216000}, {22, 265200}];
day_reward({194, 3}) ->
    [{32, 6360}, {1, 216500}, {22, 265800}];
day_reward({195, 3}) ->
    [{32, 6380}, {1, 217000}, {22, 266400}];
day_reward({196, 3}) ->
    [{32, 6400}, {1, 217500}, {22, 267000}];
day_reward({197, 3}) ->
    [{32, 6420}, {1, 218000}, {22, 267600}];
day_reward({198, 3}) ->
    [{32, 6440}, {1, 218500}, {22, 268200}];
day_reward({199, 3}) ->
    [{32, 6460}, {1, 219000}, {22, 268800}];
day_reward({200, 3}) ->
    [{32, 6480}, {1, 219500}, {22, 269400}];
day_reward({201, 3}) ->
    [{32, 6500}, {1, 220000}, {22, 270000}];
day_reward({202, 3}) ->
    [{32, 6520}, {1, 220500}, {22, 270600}];
day_reward({203, 3}) ->
    [{32, 6540}, {1, 221000}, {22, 271200}];
day_reward({204, 3}) ->
    [{32, 6560}, {1, 221500}, {22, 271800}];
day_reward({205, 3}) ->
    [{32, 6580}, {1, 222000}, {22, 272400}];
day_reward({206, 3}) ->
    [{32, 6600}, {1, 222500}, {22, 273000}];
day_reward({207, 3}) ->
    [{32, 6620}, {1, 223000}, {22, 273600}];
day_reward({208, 3}) ->
    [{32, 6640}, {1, 223500}, {22, 274200}];
day_reward({209, 3}) ->
    [{32, 6660}, {1, 224000}, {22, 274800}];
day_reward({210, 3}) ->
    [{32, 6680}, {1, 224500}, {22, 275400}];
day_reward({211, 3}) ->
    [{32, 6700}, {1, 225000}, {22, 276000}];
day_reward({212, 3}) ->
    [{32, 6720}, {1, 225500}, {22, 276600}];
day_reward({213, 3}) ->
    [{32, 6740}, {1, 226000}, {22, 277200}];
day_reward({214, 3}) ->
    [{32, 6760}, {1, 226500}, {22, 277800}];
day_reward({215, 3}) ->
    [{32, 6780}, {1, 227000}, {22, 278400}];
day_reward({216, 3}) ->
    [{32, 6800}, {1, 227500}, {22, 279000}];
day_reward({217, 3}) ->
    [{32, 6820}, {1, 228000}, {22, 279600}];
day_reward({218, 3}) ->
    [{32, 6840}, {1, 228500}, {22, 280200}];
day_reward({219, 3}) ->
    [{32, 6860}, {1, 229000}, {22, 280800}];
day_reward({220, 3}) ->
    [{32, 6880}, {1, 229500}, {22, 281400}];
day_reward({221, 3}) ->
    [{32, 6900}, {1, 230000}, {22, 282000}];
day_reward({222, 3}) ->
    [{32, 6920}, {1, 230500}, {22, 282600}];
day_reward({223, 3}) ->
    [{32, 6940}, {1, 231000}, {22, 283200}];
day_reward({224, 3}) ->
    [{32, 6960}, {1, 231500}, {22, 283800}];
day_reward({225, 3}) ->
    [{32, 6980}, {1, 232000}, {22, 284400}];
day_reward({226, 3}) ->
    [{32, 7000}, {1, 232500}, {22, 285000}];
day_reward({227, 3}) ->
    [{32, 7020}, {1, 233000}, {22, 285600}];
day_reward({228, 3}) ->
    [{32, 7040}, {1, 233500}, {22, 286200}];
day_reward({229, 3}) ->
    [{32, 7060}, {1, 234000}, {22, 286800}];
day_reward({230, 3}) ->
    [{32, 7080}, {1, 234500}, {22, 287400}];
day_reward({231, 3}) ->
    [{32, 7100}, {1, 235000}, {22, 288000}];
day_reward({232, 3}) ->
    [{32, 7120}, {1, 235500}, {22, 288600}];
day_reward({233, 3}) ->
    [{32, 7140}, {1, 236000}, {22, 289200}];
day_reward({234, 3}) ->
    [{32, 7160}, {1, 236500}, {22, 289800}];
day_reward({235, 3}) ->
    [{32, 7180}, {1, 237000}, {22, 290400}];
day_reward({236, 3}) ->
    [{32, 7200}, {1, 237500}, {22, 291000}];
day_reward({237, 3}) ->
    [{32, 7220}, {1, 238000}, {22, 291600}];
day_reward({238, 3}) ->
    [{32, 7240}, {1, 238500}, {22, 292200}];
day_reward({239, 3}) ->
    [{32, 7260}, {1, 239000}, {22, 292800}];
day_reward({240, 3}) ->
    [{32, 7280}, {1, 239500}, {22, 293400}];
day_reward({241, 3}) ->
    [{32, 7300}, {1, 240000}, {22, 294000}];
day_reward({242, 3}) ->
    [{32, 7320}, {1, 240500}, {22, 294600}];
day_reward({243, 3}) ->
    [{32, 7340}, {1, 241000}, {22, 295200}];
day_reward({244, 3}) ->
    [{32, 7360}, {1, 241500}, {22, 295800}];
day_reward({245, 3}) ->
    [{32, 7380}, {1, 242000}, {22, 296400}];
day_reward({246, 3}) ->
    [{32, 7400}, {1, 242500}, {22, 297000}];
day_reward({247, 3}) ->
    [{32, 7420}, {1, 243000}, {22, 297600}];
day_reward({248, 3}) ->
    [{32, 7440}, {1, 243500}, {22, 298200}];
day_reward({249, 3}) ->
    [{32, 7460}, {1, 244000}, {22, 298800}];
day_reward({250, 3}) ->
    [{32, 7480}, {1, 244500}, {22, 299400}];
day_reward({251, 3}) ->
    [{32, 7500}, {1, 245000}, {22, 300000}];
day_reward({252, 3}) ->
    [{32, 7520}, {1, 245500}, {22, 300600}];
day_reward({253, 3}) ->
    [{32, 7540}, {1, 246000}, {22, 301200}];
day_reward({254, 3}) ->
    [{32, 7560}, {1, 246500}, {22, 301800}];
day_reward({255, 3}) ->
    [{32, 7580}, {1, 247000}, {22, 302400}];
day_reward({256, 3}) ->
    [{32, 7600}, {1, 247500}, {22, 303000}];
day_reward({257, 3}) ->
    [{32, 7620}, {1, 248000}, {22, 303600}];
day_reward({258, 3}) ->
    [{32, 7640}, {1, 248500}, {22, 304200}];
day_reward({259, 3}) ->
    [{32, 7660}, {1, 249000}, {22, 304800}];
day_reward({260, 3}) ->
    [{32, 7680}, {1, 249500}, {22, 305400}];
day_reward({261, 3}) ->
    [{32, 7700}, {1, 250000}, {22, 306000}];
day_reward({262, 3}) ->
    [{32, 7720}, {1, 250500}, {22, 306600}];
day_reward({263, 3}) ->
    [{32, 7740}, {1, 251000}, {22, 307200}];
day_reward({264, 3}) ->
    [{32, 7760}, {1, 251500}, {22, 307800}];
day_reward({265, 3}) ->
    [{32, 7780}, {1, 252000}, {22, 308400}];
day_reward({266, 3}) ->
    [{32, 7800}, {1, 252500}, {22, 309000}];
day_reward({267, 3}) ->
    [{32, 7820}, {1, 253000}, {22, 309600}];
day_reward({268, 3}) ->
    [{32, 7840}, {1, 253500}, {22, 310200}];
day_reward({269, 3}) ->
    [{32, 7860}, {1, 254000}, {22, 310800}];
day_reward({270, 3}) ->
    [{32, 7880}, {1, 254500}, {22, 311400}];
day_reward({271, 3}) ->
    [{32, 7900}, {1, 255000}, {22, 312000}];
day_reward({272, 3}) ->
    [{32, 7920}, {1, 255500}, {22, 312600}];
day_reward({273, 3}) ->
    [{32, 7940}, {1, 256000}, {22, 313200}];
day_reward({274, 3}) ->
    [{32, 7960}, {1, 256500}, {22, 313800}];
day_reward({275, 3}) ->
    [{32, 7980}, {1, 257000}, {22, 314400}];
day_reward({276, 3}) ->
    [{32, 8000}, {1, 257500}, {22, 315000}];
day_reward({277, 3}) ->
    [{32, 8020}, {1, 258000}, {22, 315600}];
day_reward({278, 3}) ->
    [{32, 8040}, {1, 258500}, {22, 316200}];
day_reward({279, 3}) ->
    [{32, 8060}, {1, 259000}, {22, 316800}];
day_reward({280, 3}) ->
    [{32, 8080}, {1, 259500}, {22, 317400}];
day_reward({281, 3}) ->
    [{32, 8100}, {1, 260000}, {22, 318000}];
day_reward({282, 3}) ->
    [{32, 8120}, {1, 260500}, {22, 318600}];
day_reward({283, 3}) ->
    [{32, 8140}, {1, 261000}, {22, 319200}];
day_reward({284, 3}) ->
    [{32, 8160}, {1, 261500}, {22, 319800}];
day_reward({285, 3}) ->
    [{32, 8180}, {1, 262000}, {22, 320400}];
day_reward({286, 3}) ->
    [{32, 8200}, {1, 262500}, {22, 321000}];
day_reward({287, 3}) ->
    [{32, 8220}, {1, 263000}, {22, 321600}];
day_reward({288, 3}) ->
    [{32, 8240}, {1, 263500}, {22, 322200}];
day_reward({289, 3}) ->
    [{32, 8260}, {1, 264000}, {22, 322800}];
day_reward({290, 3}) ->
    [{32, 8280}, {1, 264500}, {22, 323400}];
day_reward({291, 3}) ->
    [{32, 8300}, {1, 265000}, {22, 324000}];
day_reward({292, 3}) ->
    [{32, 8320}, {1, 265500}, {22, 324600}];
day_reward({293, 3}) ->
    [{32, 8340}, {1, 266000}, {22, 325200}];
day_reward({294, 3}) ->
    [{32, 8360}, {1, 266500}, {22, 325800}];
day_reward({295, 3}) ->
    [{32, 8380}, {1, 267000}, {22, 326400}];
day_reward({296, 3}) ->
    [{32, 8400}, {1, 267500}, {22, 327000}];
day_reward({297, 3}) ->
    [{32, 8420}, {1, 268000}, {22, 327600}];
day_reward({298, 3}) ->
    [{32, 8440}, {1, 268500}, {22, 328200}];
day_reward({299, 3}) ->
    [{32, 8460}, {1, 269000}, {22, 328800}];
day_reward({300, 3}) ->
    [{32, 8480}, {1, 269500}, {22, 329400}];
day_reward({301, 3}) ->
    [{32, 8500}, {1, 270000}, {22, 330000}];
day_reward({302, 3}) ->
    [{32, 8520}, {1, 270500}, {22, 330600}];
day_reward({303, 3}) ->
    [{32, 8540}, {1, 271000}, {22, 331200}];
day_reward({304, 3}) ->
    [{32, 8560}, {1, 271500}, {22, 331800}];
day_reward({305, 3}) ->
    [{32, 8580}, {1, 272000}, {22, 332400}];
day_reward({306, 3}) ->
    [{32, 8600}, {1, 272500}, {22, 333000}];
day_reward({307, 3}) ->
    [{32, 8620}, {1, 273000}, {22, 333600}];
day_reward({308, 3}) ->
    [{32, 8640}, {1, 273500}, {22, 334200}];
day_reward({309, 3}) ->
    [{32, 8660}, {1, 274000}, {22, 334800}];
day_reward({310, 3}) ->
    [{32, 8680}, {1, 274500}, {22, 335400}];
day_reward({311, 3}) ->
    [{32, 8700}, {1, 275000}, {22, 336000}];
day_reward({312, 3}) ->
    [{32, 8720}, {1, 275500}, {22, 336600}];
day_reward({313, 3}) ->
    [{32, 8740}, {1, 276000}, {22, 337200}];
day_reward({314, 3}) ->
    [{32, 8760}, {1, 276500}, {22, 337800}];
day_reward({315, 3}) ->
    [{32, 8780}, {1, 277000}, {22, 338400}];
day_reward({316, 3}) ->
    [{32, 8800}, {1, 277500}, {22, 339000}];
day_reward({317, 3}) ->
    [{32, 8820}, {1, 278000}, {22, 339600}];
day_reward({318, 3}) ->
    [{32, 8840}, {1, 278500}, {22, 340200}];
day_reward({319, 3}) ->
    [{32, 8860}, {1, 279000}, {22, 340800}];
day_reward({320, 3}) ->
    [{32, 8880}, {1, 279500}, {22, 341400}];
day_reward({321, 3}) ->
    [{32, 8900}, {1, 280000}, {22, 342000}];
day_reward({322, 3}) ->
    [{32, 8920}, {1, 280500}, {22, 342600}];
day_reward({323, 3}) ->
    [{32, 8940}, {1, 281000}, {22, 343200}];
day_reward({324, 3}) ->
    [{32, 8960}, {1, 281500}, {22, 343800}];
day_reward({325, 3}) ->
    [{32, 8980}, {1, 282000}, {22, 344400}];
day_reward({326, 3}) ->
    [{32, 9000}, {1, 282500}, {22, 345000}];
day_reward({327, 3}) ->
    [{32, 9020}, {1, 283000}, {22, 345600}];
day_reward({328, 3}) ->
    [{32, 9040}, {1, 283500}, {22, 346200}];
day_reward({329, 3}) ->
    [{32, 9060}, {1, 284000}, {22, 346800}];
day_reward({330, 3}) ->
    [{32, 9080}, {1, 284500}, {22, 347400}];
day_reward({331, 3}) ->
    [{32, 9100}, {1, 285000}, {22, 348000}];
day_reward({332, 3}) ->
    [{32, 9120}, {1, 285500}, {22, 348600}];
day_reward({333, 3}) ->
    [{32, 9140}, {1, 286000}, {22, 349200}];
day_reward({334, 3}) ->
    [{32, 9160}, {1, 286500}, {22, 349800}];
day_reward({335, 3}) ->
    [{32, 9180}, {1, 287000}, {22, 350400}];
day_reward({336, 3}) ->
    [{32, 9200}, {1, 287500}, {22, 351000}];
day_reward({337, 3}) ->
    [{32, 9220}, {1, 288000}, {22, 351600}];
day_reward({338, 3}) ->
    [{32, 9240}, {1, 288500}, {22, 352200}];
day_reward({339, 3}) ->
    [{32, 9260}, {1, 289000}, {22, 352800}];
day_reward({340, 3}) ->
    [{32, 9280}, {1, 289500}, {22, 353400}];
day_reward({341, 3}) ->
    [{32, 9300}, {1, 290000}, {22, 354000}];
day_reward({342, 3}) ->
    [{32, 9320}, {1, 290500}, {22, 354600}];
day_reward({343, 3}) ->
    [{32, 9340}, {1, 291000}, {22, 355200}];
day_reward({344, 3}) ->
    [{32, 9360}, {1, 291500}, {22, 355800}];
day_reward({345, 3}) ->
    [{32, 9380}, {1, 292000}, {22, 356400}];
day_reward({346, 3}) ->
    [{32, 9400}, {1, 292500}, {22, 357000}];
day_reward({347, 3}) ->
    [{32, 9420}, {1, 293000}, {22, 357600}];
day_reward({348, 3}) ->
    [{32, 9440}, {1, 293500}, {22, 358200}];
day_reward({349, 3}) ->
    [{32, 9460}, {1, 294000}, {22, 358800}];
day_reward({350, 3}) ->
    [{32, 9480}, {1, 294500}, {22, 359400}];
day_reward({351, 3}) ->
    [{32, 9500}, {1, 295000}, {22, 360000}];
day_reward({352, 3}) ->
    [{32, 9520}, {1, 295500}, {22, 360600}];
day_reward({353, 3}) ->
    [{32, 9540}, {1, 296000}, {22, 361200}];
day_reward({354, 3}) ->
    [{32, 9560}, {1, 296500}, {22, 361800}];
day_reward({355, 3}) ->
    [{32, 9580}, {1, 297000}, {22, 362400}];
day_reward({356, 3}) ->
    [{32, 9600}, {1, 297500}, {22, 363000}];
day_reward({357, 3}) ->
    [{32, 9620}, {1, 298000}, {22, 363600}];
day_reward({358, 3}) ->
    [{32, 9640}, {1, 298500}, {22, 364200}];
day_reward({359, 3}) ->
    [{32, 9660}, {1, 299000}, {22, 364800}];
day_reward({360, 3}) ->
    [{32, 9680}, {1, 299500}, {22, 365400}];
day_reward({361, 3}) ->
    [{32, 9700}, {1, 300000}, {22, 366000}];
day_reward({362, 3}) ->
    [{32, 9720}, {1, 300500}, {22, 366600}];
day_reward({363, 3}) ->
    [{32, 9740}, {1, 301000}, {22, 367200}];
day_reward({364, 3}) ->
    [{32, 9760}, {1, 301500}, {22, 367800}];
day_reward({365, 3}) ->
    [{32, 9780}, {1, 302000}, {22, 368400}];
day_reward({366, 3}) ->
    [{32, 9800}, {1, 302500}, {22, 369000}];
day_reward({367, 3}) ->
    [{32, 9820}, {1, 303000}, {22, 369600}];
day_reward({368, 3}) ->
    [{32, 9840}, {1, 303500}, {22, 370200}];
day_reward({369, 3}) ->
    [{32, 9860}, {1, 304000}, {22, 370800}];
day_reward({370, 3}) ->
    [{32, 9880}, {1, 304500}, {22, 371400}];
day_reward({371, 3}) ->
    [{32, 9900}, {1, 305000}, {22, 372000}];
day_reward({372, 3}) ->
    [{32, 9920}, {1, 305500}, {22, 372600}];
day_reward({373, 3}) ->
    [{32, 9940}, {1, 306000}, {22, 373200}];
day_reward({374, 3}) ->
    [{32, 9960}, {1, 306500}, {22, 373800}];
day_reward({375, 3}) ->
    [{32, 9980}, {1, 307000}, {22, 374400}];
day_reward({376, 3}) ->
    [{32, 10000}, {1, 307500}, {22, 375000}];
day_reward({377, 3}) ->
    [{32, 10020}, {1, 308000}, {22, 375600}];
day_reward({378, 3}) ->
    [{32, 10040}, {1, 308500}, {22, 376200}];
day_reward({379, 3}) ->
    [{32, 10060}, {1, 309000}, {22, 376800}];
day_reward({380, 3}) ->
    [{32, 10080}, {1, 309500}, {22, 377400}];
day_reward({381, 3}) ->
    [{32, 10100}, {1, 310000}, {22, 378000}];
day_reward({382, 3}) ->
    [{32, 10120}, {1, 310500}, {22, 378600}];
day_reward({383, 3}) ->
    [{32, 10140}, {1, 311000}, {22, 379200}];
day_reward({384, 3}) ->
    [{32, 10160}, {1, 311500}, {22, 379800}];
day_reward({385, 3}) ->
    [{32, 10180}, {1, 312000}, {22, 380400}];
day_reward({386, 3}) ->
    [{32, 10200}, {1, 312500}, {22, 381000}];
day_reward({387, 3}) ->
    [{32, 10220}, {1, 313000}, {22, 381600}];
day_reward({388, 3}) ->
    [{32, 10240}, {1, 313500}, {22, 382200}];
day_reward({389, 3}) ->
    [{32, 10260}, {1, 314000}, {22, 382800}];
day_reward({390, 3}) ->
    [{32, 10280}, {1, 314500}, {22, 383400}];
day_reward({391, 3}) ->
    [{32, 10300}, {1, 315000}, {22, 384000}];
day_reward({392, 3}) ->
    [{32, 10320}, {1, 315500}, {22, 384600}];
day_reward({393, 3}) ->
    [{32, 10340}, {1, 316000}, {22, 385200}];
day_reward({394, 3}) ->
    [{32, 10360}, {1, 316500}, {22, 385800}];
day_reward({395, 3}) ->
    [{32, 10380}, {1, 317000}, {22, 386400}];
day_reward({396, 3}) ->
    [{32, 10400}, {1, 317500}, {22, 387000}];
day_reward({397, 3}) ->
    [{32, 10420}, {1, 318000}, {22, 387600}];
day_reward({398, 3}) ->
    [{32, 10440}, {1, 318500}, {22, 388200}];
day_reward({399, 3}) ->
    [{32, 10460}, {1, 319000}, {22, 388800}];
day_reward({400, 3}) ->
    [{32, 10480}, {1, 319500}, {22, 389400}];
day_reward({401, 3}) ->
    [{32, 10500}, {1, 320000}, {22, 390000}];
day_reward({402, 3}) ->
    [{32, 10520}, {1, 320500}, {22, 390600}];
day_reward({403, 3}) ->
    [{32, 10540}, {1, 321000}, {22, 391200}];
day_reward({404, 3}) ->
    [{32, 10560}, {1, 321500}, {22, 391800}];
day_reward({405, 3}) ->
    [{32, 10580}, {1, 322000}, {22, 392400}];
day_reward({406, 3}) ->
    [{32, 10600}, {1, 322500}, {22, 393000}];
day_reward({407, 3}) ->
    [{32, 10620}, {1, 323000}, {22, 393600}];
day_reward({408, 3}) ->
    [{32, 10640}, {1, 323500}, {22, 394200}];
day_reward({409, 3}) ->
    [{32, 10660}, {1, 324000}, {22, 394800}];
day_reward({410, 3}) ->
    [{32, 10680}, {1, 324500}, {22, 395400}];
day_reward({411, 3}) ->
    [{32, 10700}, {1, 325000}, {22, 396000}];
day_reward({412, 3}) ->
    [{32, 10720}, {1, 325500}, {22, 396600}];
day_reward({413, 3}) ->
    [{32, 10740}, {1, 326000}, {22, 397200}];
day_reward({414, 3}) ->
    [{32, 10760}, {1, 326500}, {22, 397800}];
day_reward({415, 3}) ->
    [{32, 10780}, {1, 327000}, {22, 398400}];
day_reward({416, 3}) ->
    [{32, 10800}, {1, 327500}, {22, 399000}];
day_reward({417, 3}) ->
    [{32, 10820}, {1, 328000}, {22, 399600}];
day_reward({418, 3}) ->
    [{32, 10840}, {1, 328500}, {22, 400200}];
day_reward({419, 3}) ->
    [{32, 10860}, {1, 329000}, {22, 400800}];
day_reward({420, 3}) ->
    [{32, 10880}, {1, 329500}, {22, 401400}];
day_reward({421, 3}) ->
    [{32, 10900}, {1, 330000}, {22, 402000}];
day_reward({422, 3}) ->
    [{32, 10920}, {1, 330500}, {22, 402600}];
day_reward({423, 3}) ->
    [{32, 10940}, {1, 331000}, {22, 403200}];
day_reward({424, 3}) ->
    [{32, 10960}, {1, 331500}, {22, 403800}];
day_reward({425, 3}) ->
    [{32, 10980}, {1, 332000}, {22, 404400}];
day_reward({426, 3}) ->
    [{32, 11000}, {1, 332500}, {22, 405000}];
day_reward({427, 3}) ->
    [{32, 11020}, {1, 333000}, {22, 405600}];
day_reward({428, 3}) ->
    [{32, 11040}, {1, 333500}, {22, 406200}];
day_reward({429, 3}) ->
    [{32, 11060}, {1, 334000}, {22, 406800}];
day_reward({430, 3}) ->
    [{32, 11080}, {1, 334500}, {22, 407400}];
day_reward({431, 3}) ->
    [{32, 11100}, {1, 335000}, {22, 408000}];
day_reward({432, 3}) ->
    [{32, 11120}, {1, 335500}, {22, 408600}];
day_reward({433, 3}) ->
    [{32, 11140}, {1, 336000}, {22, 409200}];
day_reward({434, 3}) ->
    [{32, 11160}, {1, 336500}, {22, 409800}];
day_reward({435, 3}) ->
    [{32, 11180}, {1, 337000}, {22, 410400}];
day_reward({436, 3}) ->
    [{32, 11200}, {1, 337500}, {22, 411000}];
day_reward({437, 3}) ->
    [{32, 11220}, {1, 338000}, {22, 411600}];
day_reward({438, 3}) ->
    [{32, 11240}, {1, 338500}, {22, 412200}];
day_reward({439, 3}) ->
    [{32, 11260}, {1, 339000}, {22, 412800}];
day_reward({440, 3}) ->
    [{32, 11280}, {1, 339500}, {22, 413400}];
day_reward({441, 3}) ->
    [{32, 11300}, {1, 340000}, {22, 414000}];
day_reward({442, 3}) ->
    [{32, 11320}, {1, 340500}, {22, 414600}];
day_reward({443, 3}) ->
    [{32, 11340}, {1, 341000}, {22, 415200}];
day_reward({444, 3}) ->
    [{32, 11360}, {1, 341500}, {22, 415800}];
day_reward({445, 3}) ->
    [{32, 11380}, {1, 342000}, {22, 416400}];
day_reward({446, 3}) ->
    [{32, 11400}, {1, 342500}, {22, 417000}];
day_reward({447, 3}) ->
    [{32, 11420}, {1, 343000}, {22, 417600}];
day_reward({448, 3}) ->
    [{32, 11440}, {1, 343500}, {22, 418200}];
day_reward({449, 3}) ->
    [{32, 11460}, {1, 344000}, {22, 418800}];
day_reward({450, 3}) ->
    [{32, 11480}, {1, 344500}, {22, 419400}];
day_reward({451, 3}) ->
    [{32, 11500}, {1, 345000}, {22, 420000}];
day_reward({452, 3}) ->
    [{32, 11520}, {1, 345500}, {22, 420600}];
day_reward({453, 3}) ->
    [{32, 11540}, {1, 346000}, {22, 421200}];
day_reward({454, 3}) ->
    [{32, 11560}, {1, 346500}, {22, 421800}];
day_reward({455, 3}) ->
    [{32, 11580}, {1, 347000}, {22, 422400}];
day_reward({456, 3}) ->
    [{32, 11600}, {1, 347500}, {22, 423000}];
day_reward({457, 3}) ->
    [{32, 11620}, {1, 348000}, {22, 423600}];
day_reward({458, 3}) ->
    [{32, 11640}, {1, 348500}, {22, 424200}];
day_reward({459, 3}) ->
    [{32, 11660}, {1, 349000}, {22, 424800}];
day_reward({460, 3}) ->
    [{32, 11680}, {1, 349500}, {22, 425400}];
day_reward({461, 3}) ->
    [{32, 11700}, {1, 350000}, {22, 426000}];
day_reward({462, 3}) ->
    [{32, 11720}, {1, 350500}, {22, 426600}];
day_reward({463, 3}) ->
    [{32, 11740}, {1, 351000}, {22, 427200}];
day_reward({464, 3}) ->
    [{32, 11760}, {1, 351500}, {22, 427800}];
day_reward({465, 3}) ->
    [{32, 11780}, {1, 352000}, {22, 428400}];
day_reward({466, 3}) ->
    [{32, 11800}, {1, 352500}, {22, 429000}];
day_reward({467, 3}) ->
    [{32, 11820}, {1, 353000}, {22, 429600}];
day_reward({468, 3}) ->
    [{32, 11840}, {1, 353500}, {22, 430200}];
day_reward({469, 3}) ->
    [{32, 11860}, {1, 354000}, {22, 430800}];
day_reward({470, 3}) ->
    [{32, 11880}, {1, 354500}, {22, 431400}];
day_reward({471, 3}) ->
    [{32, 11900}, {1, 355000}, {22, 432000}];
day_reward({472, 3}) ->
    [{32, 11920}, {1, 355500}, {22, 432600}];
day_reward({473, 3}) ->
    [{32, 11940}, {1, 356000}, {22, 433200}];
day_reward({474, 3}) ->
    [{32, 11960}, {1, 356500}, {22, 433800}];
day_reward({475, 3}) ->
    [{32, 11980}, {1, 357000}, {22, 434400}];
day_reward({476, 3}) ->
    [{32, 12000}, {1, 357500}, {22, 435000}];
day_reward({477, 3}) ->
    [{32, 12020}, {1, 358000}, {22, 435600}];
day_reward({478, 3}) ->
    [{32, 12040}, {1, 358500}, {22, 436200}];
day_reward({479, 3}) ->
    [{32, 12060}, {1, 359000}, {22, 436800}];
day_reward({480, 3}) ->
    [{32, 12080}, {1, 359500}, {22, 437400}];
day_reward({481, 3}) ->
    [{32, 12100}, {1, 360000}, {22, 438000}];
day_reward({482, 3}) ->
    [{32, 12120}, {1, 360500}, {22, 438600}];
day_reward({483, 3}) ->
    [{32, 12140}, {1, 361000}, {22, 439200}];
day_reward({484, 3}) ->
    [{32, 12160}, {1, 361500}, {22, 439800}];
day_reward({485, 3}) ->
    [{32, 12180}, {1, 362000}, {22, 440400}];
day_reward({486, 3}) ->
    [{32, 12200}, {1, 362500}, {22, 441000}];
day_reward({487, 3}) ->
    [{32, 12220}, {1, 363000}, {22, 441600}];
day_reward({488, 3}) ->
    [{32, 12240}, {1, 363500}, {22, 442200}];
day_reward({489, 3}) ->
    [{32, 12260}, {1, 364000}, {22, 442800}];
day_reward({490, 3}) ->
    [{32, 12280}, {1, 364500}, {22, 443400}];
day_reward({491, 3}) ->
    [{32, 12300}, {1, 365000}, {22, 444000}];
day_reward({492, 3}) ->
    [{32, 12320}, {1, 365500}, {22, 444600}];
day_reward({493, 3}) ->
    [{32, 12340}, {1, 366000}, {22, 445200}];
day_reward({494, 3}) ->
    [{32, 12360}, {1, 366500}, {22, 445800}];
day_reward({495, 3}) ->
    [{32, 12380}, {1, 367000}, {22, 446400}];
day_reward({496, 3}) ->
    [{32, 12400}, {1, 367500}, {22, 447000}];
day_reward({497, 3}) ->
    [{32, 12420}, {1, 368000}, {22, 447600}];
day_reward({498, 3}) ->
    [{32, 12440}, {1, 368500}, {22, 448200}];
day_reward({499, 3}) ->
    [{32, 12460}, {1, 369000}, {22, 448800}];
day_reward({500, 3}) ->
    [{32, 12480}, {1, 369500}, {22, 449400}];
day_reward({1, 4}) ->
    [{32, 2500}, {1, 120000}, {22, 150000}];
day_reward({2, 4}) ->
    [{32, 2520}, {1, 120500}, {22, 150600}];
day_reward({3, 4}) ->
    [{32, 2540}, {1, 121000}, {22, 151200}];
day_reward({4, 4}) ->
    [{32, 2560}, {1, 121500}, {22, 151800}];
day_reward({5, 4}) ->
    [{32, 2580}, {1, 122000}, {22, 152400}];
day_reward({6, 4}) ->
    [{32, 2600}, {1, 122500}, {22, 153000}];
day_reward({7, 4}) ->
    [{32, 2620}, {1, 123000}, {22, 153600}];
day_reward({8, 4}) ->
    [{32, 2640}, {1, 123500}, {22, 154200}];
day_reward({9, 4}) ->
    [{32, 2660}, {1, 124000}, {22, 154800}];
day_reward({10, 4}) ->
    [{32, 2680}, {1, 124500}, {22, 155400}];
day_reward({11, 4}) ->
    [{32, 2700}, {1, 125000}, {22, 156000}];
day_reward({12, 4}) ->
    [{32, 2720}, {1, 125500}, {22, 156600}];
day_reward({13, 4}) ->
    [{32, 2740}, {1, 126000}, {22, 157200}];
day_reward({14, 4}) ->
    [{32, 2760}, {1, 126500}, {22, 157800}];
day_reward({15, 4}) ->
    [{32, 2780}, {1, 127000}, {22, 158400}];
day_reward({16, 4}) ->
    [{32, 2800}, {1, 127500}, {22, 159000}];
day_reward({17, 4}) ->
    [{32, 2820}, {1, 128000}, {22, 159600}];
day_reward({18, 4}) ->
    [{32, 2840}, {1, 128500}, {22, 160200}];
day_reward({19, 4}) ->
    [{32, 2860}, {1, 129000}, {22, 160800}];
day_reward({20, 4}) ->
    [{32, 2880}, {1, 129500}, {22, 161400}];
day_reward({21, 4}) ->
    [{32, 2900}, {1, 130000}, {22, 162000}];
day_reward({22, 4}) ->
    [{32, 2920}, {1, 130500}, {22, 162600}];
day_reward({23, 4}) ->
    [{32, 2940}, {1, 131000}, {22, 163200}];
day_reward({24, 4}) ->
    [{32, 2960}, {1, 131500}, {22, 163800}];
day_reward({25, 4}) ->
    [{32, 2980}, {1, 132000}, {22, 164400}];
day_reward({26, 4}) ->
    [{32, 3000}, {1, 132500}, {22, 165000}];
day_reward({27, 4}) ->
    [{32, 3020}, {1, 133000}, {22, 165600}];
day_reward({28, 4}) ->
    [{32, 3040}, {1, 133500}, {22, 166200}];
day_reward({29, 4}) ->
    [{32, 3060}, {1, 134000}, {22, 166800}];
day_reward({30, 4}) ->
    [{32, 3080}, {1, 134500}, {22, 167400}];
day_reward({31, 4}) ->
    [{32, 3100}, {1, 135000}, {22, 168000}];
day_reward({32, 4}) ->
    [{32, 3120}, {1, 135500}, {22, 168600}];
day_reward({33, 4}) ->
    [{32, 3140}, {1, 136000}, {22, 169200}];
day_reward({34, 4}) ->
    [{32, 3160}, {1, 136500}, {22, 169800}];
day_reward({35, 4}) ->
    [{32, 3180}, {1, 137000}, {22, 170400}];
day_reward({36, 4}) ->
    [{32, 3200}, {1, 137500}, {22, 171000}];
day_reward({37, 4}) ->
    [{32, 3220}, {1, 138000}, {22, 171600}];
day_reward({38, 4}) ->
    [{32, 3240}, {1, 138500}, {22, 172200}];
day_reward({39, 4}) ->
    [{32, 3260}, {1, 139000}, {22, 172800}];
day_reward({40, 4}) ->
    [{32, 3280}, {1, 139500}, {22, 173400}];
day_reward({41, 4}) ->
    [{32, 3300}, {1, 140000}, {22, 174000}];
day_reward({42, 4}) ->
    [{32, 3320}, {1, 140500}, {22, 174600}];
day_reward({43, 4}) ->
    [{32, 3340}, {1, 141000}, {22, 175200}];
day_reward({44, 4}) ->
    [{32, 3360}, {1, 141500}, {22, 175800}];
day_reward({45, 4}) ->
    [{32, 3380}, {1, 142000}, {22, 176400}];
day_reward({46, 4}) ->
    [{32, 3400}, {1, 142500}, {22, 177000}];
day_reward({47, 4}) ->
    [{32, 3420}, {1, 143000}, {22, 177600}];
day_reward({48, 4}) ->
    [{32, 3440}, {1, 143500}, {22, 178200}];
day_reward({49, 4}) ->
    [{32, 3460}, {1, 144000}, {22, 178800}];
day_reward({50, 4}) ->
    [{32, 3480}, {1, 144500}, {22, 179400}];
day_reward({51, 4}) ->
    [{32, 3500}, {1, 145000}, {22, 180000}];
day_reward({52, 4}) ->
    [{32, 3520}, {1, 145500}, {22, 180600}];
day_reward({53, 4}) ->
    [{32, 3540}, {1, 146000}, {22, 181200}];
day_reward({54, 4}) ->
    [{32, 3560}, {1, 146500}, {22, 181800}];
day_reward({55, 4}) ->
    [{32, 3580}, {1, 147000}, {22, 182400}];
day_reward({56, 4}) ->
    [{32, 3600}, {1, 147500}, {22, 183000}];
day_reward({57, 4}) ->
    [{32, 3620}, {1, 148000}, {22, 183600}];
day_reward({58, 4}) ->
    [{32, 3640}, {1, 148500}, {22, 184200}];
day_reward({59, 4}) ->
    [{32, 3660}, {1, 149000}, {22, 184800}];
day_reward({60, 4}) ->
    [{32, 3680}, {1, 149500}, {22, 185400}];
day_reward({61, 4}) ->
    [{32, 3700}, {1, 150000}, {22, 186000}];
day_reward({62, 4}) ->
    [{32, 3720}, {1, 150500}, {22, 186600}];
day_reward({63, 4}) ->
    [{32, 3740}, {1, 151000}, {22, 187200}];
day_reward({64, 4}) ->
    [{32, 3760}, {1, 151500}, {22, 187800}];
day_reward({65, 4}) ->
    [{32, 3780}, {1, 152000}, {22, 188400}];
day_reward({66, 4}) ->
    [{32, 3800}, {1, 152500}, {22, 189000}];
day_reward({67, 4}) ->
    [{32, 3820}, {1, 153000}, {22, 189600}];
day_reward({68, 4}) ->
    [{32, 3840}, {1, 153500}, {22, 190200}];
day_reward({69, 4}) ->
    [{32, 3860}, {1, 154000}, {22, 190800}];
day_reward({70, 4}) ->
    [{32, 3880}, {1, 154500}, {22, 191400}];
day_reward({71, 4}) ->
    [{32, 3900}, {1, 155000}, {22, 192000}];
day_reward({72, 4}) ->
    [{32, 3920}, {1, 155500}, {22, 192600}];
day_reward({73, 4}) ->
    [{32, 3940}, {1, 156000}, {22, 193200}];
day_reward({74, 4}) ->
    [{32, 3960}, {1, 156500}, {22, 193800}];
day_reward({75, 4}) ->
    [{32, 3980}, {1, 157000}, {22, 194400}];
day_reward({76, 4}) ->
    [{32, 4000}, {1, 157500}, {22, 195000}];
day_reward({77, 4}) ->
    [{32, 4020}, {1, 158000}, {22, 195600}];
day_reward({78, 4}) ->
    [{32, 4040}, {1, 158500}, {22, 196200}];
day_reward({79, 4}) ->
    [{32, 4060}, {1, 159000}, {22, 196800}];
day_reward({80, 4}) ->
    [{32, 4080}, {1, 159500}, {22, 197400}];
day_reward({81, 4}) ->
    [{32, 4100}, {1, 160000}, {22, 198000}];
day_reward({82, 4}) ->
    [{32, 4120}, {1, 160500}, {22, 198600}];
day_reward({83, 4}) ->
    [{32, 4140}, {1, 161000}, {22, 199200}];
day_reward({84, 4}) ->
    [{32, 4160}, {1, 161500}, {22, 199800}];
day_reward({85, 4}) ->
    [{32, 4180}, {1, 162000}, {22, 200400}];
day_reward({86, 4}) ->
    [{32, 4200}, {1, 162500}, {22, 201000}];
day_reward({87, 4}) ->
    [{32, 4220}, {1, 163000}, {22, 201600}];
day_reward({88, 4}) ->
    [{32, 4240}, {1, 163500}, {22, 202200}];
day_reward({89, 4}) ->
    [{32, 4260}, {1, 164000}, {22, 202800}];
day_reward({90, 4}) ->
    [{32, 4280}, {1, 164500}, {22, 203400}];
day_reward({91, 4}) ->
    [{32, 4300}, {1, 165000}, {22, 204000}];
day_reward({92, 4}) ->
    [{32, 4320}, {1, 165500}, {22, 204600}];
day_reward({93, 4}) ->
    [{32, 4340}, {1, 166000}, {22, 205200}];
day_reward({94, 4}) ->
    [{32, 4360}, {1, 166500}, {22, 205800}];
day_reward({95, 4}) ->
    [{32, 4380}, {1, 167000}, {22, 206400}];
day_reward({96, 4}) ->
    [{32, 4400}, {1, 167500}, {22, 207000}];
day_reward({97, 4}) ->
    [{32, 4420}, {1, 168000}, {22, 207600}];
day_reward({98, 4}) ->
    [{32, 4440}, {1, 168500}, {22, 208200}];
day_reward({99, 4}) ->
    [{32, 4460}, {1, 169000}, {22, 208800}];
day_reward({100, 4}) ->
    [{32, 4480}, {1, 169500}, {22, 209400}];
day_reward({101, 4}) ->
    [{32, 4500}, {1, 170000}, {22, 210000}];
day_reward({102, 4}) ->
    [{32, 4520}, {1, 170500}, {22, 210600}];
day_reward({103, 4}) ->
    [{32, 4540}, {1, 171000}, {22, 211200}];
day_reward({104, 4}) ->
    [{32, 4560}, {1, 171500}, {22, 211800}];
day_reward({105, 4}) ->
    [{32, 4580}, {1, 172000}, {22, 212400}];
day_reward({106, 4}) ->
    [{32, 4600}, {1, 172500}, {22, 213000}];
day_reward({107, 4}) ->
    [{32, 4620}, {1, 173000}, {22, 213600}];
day_reward({108, 4}) ->
    [{32, 4640}, {1, 173500}, {22, 214200}];
day_reward({109, 4}) ->
    [{32, 4660}, {1, 174000}, {22, 214800}];
day_reward({110, 4}) ->
    [{32, 4680}, {1, 174500}, {22, 215400}];
day_reward({111, 4}) ->
    [{32, 4700}, {1, 175000}, {22, 216000}];
day_reward({112, 4}) ->
    [{32, 4720}, {1, 175500}, {22, 216600}];
day_reward({113, 4}) ->
    [{32, 4740}, {1, 176000}, {22, 217200}];
day_reward({114, 4}) ->
    [{32, 4760}, {1, 176500}, {22, 217800}];
day_reward({115, 4}) ->
    [{32, 4780}, {1, 177000}, {22, 218400}];
day_reward({116, 4}) ->
    [{32, 4800}, {1, 177500}, {22, 219000}];
day_reward({117, 4}) ->
    [{32, 4820}, {1, 178000}, {22, 219600}];
day_reward({118, 4}) ->
    [{32, 4840}, {1, 178500}, {22, 220200}];
day_reward({119, 4}) ->
    [{32, 4860}, {1, 179000}, {22, 220800}];
day_reward({120, 4}) ->
    [{32, 4880}, {1, 179500}, {22, 221400}];
day_reward({121, 4}) ->
    [{32, 4900}, {1, 180000}, {22, 222000}];
day_reward({122, 4}) ->
    [{32, 4920}, {1, 180500}, {22, 222600}];
day_reward({123, 4}) ->
    [{32, 4940}, {1, 181000}, {22, 223200}];
day_reward({124, 4}) ->
    [{32, 4960}, {1, 181500}, {22, 223800}];
day_reward({125, 4}) ->
    [{32, 4980}, {1, 182000}, {22, 224400}];
day_reward({126, 4}) ->
    [{32, 5000}, {1, 182500}, {22, 225000}];
day_reward({127, 4}) ->
    [{32, 5020}, {1, 183000}, {22, 225600}];
day_reward({128, 4}) ->
    [{32, 5040}, {1, 183500}, {22, 226200}];
day_reward({129, 4}) ->
    [{32, 5060}, {1, 184000}, {22, 226800}];
day_reward({130, 4}) ->
    [{32, 5080}, {1, 184500}, {22, 227400}];
day_reward({131, 4}) ->
    [{32, 5100}, {1, 185000}, {22, 228000}];
day_reward({132, 4}) ->
    [{32, 5120}, {1, 185500}, {22, 228600}];
day_reward({133, 4}) ->
    [{32, 5140}, {1, 186000}, {22, 229200}];
day_reward({134, 4}) ->
    [{32, 5160}, {1, 186500}, {22, 229800}];
day_reward({135, 4}) ->
    [{32, 5180}, {1, 187000}, {22, 230400}];
day_reward({136, 4}) ->
    [{32, 5200}, {1, 187500}, {22, 231000}];
day_reward({137, 4}) ->
    [{32, 5220}, {1, 188000}, {22, 231600}];
day_reward({138, 4}) ->
    [{32, 5240}, {1, 188500}, {22, 232200}];
day_reward({139, 4}) ->
    [{32, 5260}, {1, 189000}, {22, 232800}];
day_reward({140, 4}) ->
    [{32, 5280}, {1, 189500}, {22, 233400}];
day_reward({141, 4}) ->
    [{32, 5300}, {1, 190000}, {22, 234000}];
day_reward({142, 4}) ->
    [{32, 5320}, {1, 190500}, {22, 234600}];
day_reward({143, 4}) ->
    [{32, 5340}, {1, 191000}, {22, 235200}];
day_reward({144, 4}) ->
    [{32, 5360}, {1, 191500}, {22, 235800}];
day_reward({145, 4}) ->
    [{32, 5380}, {1, 192000}, {22, 236400}];
day_reward({146, 4}) ->
    [{32, 5400}, {1, 192500}, {22, 237000}];
day_reward({147, 4}) ->
    [{32, 5420}, {1, 193000}, {22, 237600}];
day_reward({148, 4}) ->
    [{32, 5440}, {1, 193500}, {22, 238200}];
day_reward({149, 4}) ->
    [{32, 5460}, {1, 194000}, {22, 238800}];
day_reward({150, 4}) ->
    [{32, 5480}, {1, 194500}, {22, 239400}];
day_reward({151, 4}) ->
    [{32, 5500}, {1, 195000}, {22, 240000}];
day_reward({152, 4}) ->
    [{32, 5520}, {1, 195500}, {22, 240600}];
day_reward({153, 4}) ->
    [{32, 5540}, {1, 196000}, {22, 241200}];
day_reward({154, 4}) ->
    [{32, 5560}, {1, 196500}, {22, 241800}];
day_reward({155, 4}) ->
    [{32, 5580}, {1, 197000}, {22, 242400}];
day_reward({156, 4}) ->
    [{32, 5600}, {1, 197500}, {22, 243000}];
day_reward({157, 4}) ->
    [{32, 5620}, {1, 198000}, {22, 243600}];
day_reward({158, 4}) ->
    [{32, 5640}, {1, 198500}, {22, 244200}];
day_reward({159, 4}) ->
    [{32, 5660}, {1, 199000}, {22, 244800}];
day_reward({160, 4}) ->
    [{32, 5680}, {1, 199500}, {22, 245400}];
day_reward({161, 4}) ->
    [{32, 5700}, {1, 200000}, {22, 246000}];
day_reward({162, 4}) ->
    [{32, 5720}, {1, 200500}, {22, 246600}];
day_reward({163, 4}) ->
    [{32, 5740}, {1, 201000}, {22, 247200}];
day_reward({164, 4}) ->
    [{32, 5760}, {1, 201500}, {22, 247800}];
day_reward({165, 4}) ->
    [{32, 5780}, {1, 202000}, {22, 248400}];
day_reward({166, 4}) ->
    [{32, 5800}, {1, 202500}, {22, 249000}];
day_reward({167, 4}) ->
    [{32, 5820}, {1, 203000}, {22, 249600}];
day_reward({168, 4}) ->
    [{32, 5840}, {1, 203500}, {22, 250200}];
day_reward({169, 4}) ->
    [{32, 5860}, {1, 204000}, {22, 250800}];
day_reward({170, 4}) ->
    [{32, 5880}, {1, 204500}, {22, 251400}];
day_reward({171, 4}) ->
    [{32, 5900}, {1, 205000}, {22, 252000}];
day_reward({172, 4}) ->
    [{32, 5920}, {1, 205500}, {22, 252600}];
day_reward({173, 4}) ->
    [{32, 5940}, {1, 206000}, {22, 253200}];
day_reward({174, 4}) ->
    [{32, 5960}, {1, 206500}, {22, 253800}];
day_reward({175, 4}) ->
    [{32, 5980}, {1, 207000}, {22, 254400}];
day_reward({176, 4}) ->
    [{32, 6000}, {1, 207500}, {22, 255000}];
day_reward({177, 4}) ->
    [{32, 6020}, {1, 208000}, {22, 255600}];
day_reward({178, 4}) ->
    [{32, 6040}, {1, 208500}, {22, 256200}];
day_reward({179, 4}) ->
    [{32, 6060}, {1, 209000}, {22, 256800}];
day_reward({180, 4}) ->
    [{32, 6080}, {1, 209500}, {22, 257400}];
day_reward({181, 4}) ->
    [{32, 6100}, {1, 210000}, {22, 258000}];
day_reward({182, 4}) ->
    [{32, 6120}, {1, 210500}, {22, 258600}];
day_reward({183, 4}) ->
    [{32, 6140}, {1, 211000}, {22, 259200}];
day_reward({184, 4}) ->
    [{32, 6160}, {1, 211500}, {22, 259800}];
day_reward({185, 4}) ->
    [{32, 6180}, {1, 212000}, {22, 260400}];
day_reward({186, 4}) ->
    [{32, 6200}, {1, 212500}, {22, 261000}];
day_reward({187, 4}) ->
    [{32, 6220}, {1, 213000}, {22, 261600}];
day_reward({188, 4}) ->
    [{32, 6240}, {1, 213500}, {22, 262200}];
day_reward({189, 4}) ->
    [{32, 6260}, {1, 214000}, {22, 262800}];
day_reward({190, 4}) ->
    [{32, 6280}, {1, 214500}, {22, 263400}];
day_reward({191, 4}) ->
    [{32, 6300}, {1, 215000}, {22, 264000}];
day_reward({192, 4}) ->
    [{32, 6320}, {1, 215500}, {22, 264600}];
day_reward({193, 4}) ->
    [{32, 6340}, {1, 216000}, {22, 265200}];
day_reward({194, 4}) ->
    [{32, 6360}, {1, 216500}, {22, 265800}];
day_reward({195, 4}) ->
    [{32, 6380}, {1, 217000}, {22, 266400}];
day_reward({196, 4}) ->
    [{32, 6400}, {1, 217500}, {22, 267000}];
day_reward({197, 4}) ->
    [{32, 6420}, {1, 218000}, {22, 267600}];
day_reward({198, 4}) ->
    [{32, 6440}, {1, 218500}, {22, 268200}];
day_reward({199, 4}) ->
    [{32, 6460}, {1, 219000}, {22, 268800}];
day_reward({200, 4}) ->
    [{32, 6480}, {1, 219500}, {22, 269400}];
day_reward({201, 4}) ->
    [{32, 6500}, {1, 220000}, {22, 270000}];
day_reward({202, 4}) ->
    [{32, 6520}, {1, 220500}, {22, 270600}];
day_reward({203, 4}) ->
    [{32, 6540}, {1, 221000}, {22, 271200}];
day_reward({204, 4}) ->
    [{32, 6560}, {1, 221500}, {22, 271800}];
day_reward({205, 4}) ->
    [{32, 6580}, {1, 222000}, {22, 272400}];
day_reward({206, 4}) ->
    [{32, 6600}, {1, 222500}, {22, 273000}];
day_reward({207, 4}) ->
    [{32, 6620}, {1, 223000}, {22, 273600}];
day_reward({208, 4}) ->
    [{32, 6640}, {1, 223500}, {22, 274200}];
day_reward({209, 4}) ->
    [{32, 6660}, {1, 224000}, {22, 274800}];
day_reward({210, 4}) ->
    [{32, 6680}, {1, 224500}, {22, 275400}];
day_reward({211, 4}) ->
    [{32, 6700}, {1, 225000}, {22, 276000}];
day_reward({212, 4}) ->
    [{32, 6720}, {1, 225500}, {22, 276600}];
day_reward({213, 4}) ->
    [{32, 6740}, {1, 226000}, {22, 277200}];
day_reward({214, 4}) ->
    [{32, 6760}, {1, 226500}, {22, 277800}];
day_reward({215, 4}) ->
    [{32, 6780}, {1, 227000}, {22, 278400}];
day_reward({216, 4}) ->
    [{32, 6800}, {1, 227500}, {22, 279000}];
day_reward({217, 4}) ->
    [{32, 6820}, {1, 228000}, {22, 279600}];
day_reward({218, 4}) ->
    [{32, 6840}, {1, 228500}, {22, 280200}];
day_reward({219, 4}) ->
    [{32, 6860}, {1, 229000}, {22, 280800}];
day_reward({220, 4}) ->
    [{32, 6880}, {1, 229500}, {22, 281400}];
day_reward({221, 4}) ->
    [{32, 6900}, {1, 230000}, {22, 282000}];
day_reward({222, 4}) ->
    [{32, 6920}, {1, 230500}, {22, 282600}];
day_reward({223, 4}) ->
    [{32, 6940}, {1, 231000}, {22, 283200}];
day_reward({224, 4}) ->
    [{32, 6960}, {1, 231500}, {22, 283800}];
day_reward({225, 4}) ->
    [{32, 6980}, {1, 232000}, {22, 284400}];
day_reward({226, 4}) ->
    [{32, 7000}, {1, 232500}, {22, 285000}];
day_reward({227, 4}) ->
    [{32, 7020}, {1, 233000}, {22, 285600}];
day_reward({228, 4}) ->
    [{32, 7040}, {1, 233500}, {22, 286200}];
day_reward({229, 4}) ->
    [{32, 7060}, {1, 234000}, {22, 286800}];
day_reward({230, 4}) ->
    [{32, 7080}, {1, 234500}, {22, 287400}];
day_reward({231, 4}) ->
    [{32, 7100}, {1, 235000}, {22, 288000}];
day_reward({232, 4}) ->
    [{32, 7120}, {1, 235500}, {22, 288600}];
day_reward({233, 4}) ->
    [{32, 7140}, {1, 236000}, {22, 289200}];
day_reward({234, 4}) ->
    [{32, 7160}, {1, 236500}, {22, 289800}];
day_reward({235, 4}) ->
    [{32, 7180}, {1, 237000}, {22, 290400}];
day_reward({236, 4}) ->
    [{32, 7200}, {1, 237500}, {22, 291000}];
day_reward({237, 4}) ->
    [{32, 7220}, {1, 238000}, {22, 291600}];
day_reward({238, 4}) ->
    [{32, 7240}, {1, 238500}, {22, 292200}];
day_reward({239, 4}) ->
    [{32, 7260}, {1, 239000}, {22, 292800}];
day_reward({240, 4}) ->
    [{32, 7280}, {1, 239500}, {22, 293400}];
day_reward({241, 4}) ->
    [{32, 7300}, {1, 240000}, {22, 294000}];
day_reward({242, 4}) ->
    [{32, 7320}, {1, 240500}, {22, 294600}];
day_reward({243, 4}) ->
    [{32, 7340}, {1, 241000}, {22, 295200}];
day_reward({244, 4}) ->
    [{32, 7360}, {1, 241500}, {22, 295800}];
day_reward({245, 4}) ->
    [{32, 7380}, {1, 242000}, {22, 296400}];
day_reward({246, 4}) ->
    [{32, 7400}, {1, 242500}, {22, 297000}];
day_reward({247, 4}) ->
    [{32, 7420}, {1, 243000}, {22, 297600}];
day_reward({248, 4}) ->
    [{32, 7440}, {1, 243500}, {22, 298200}];
day_reward({249, 4}) ->
    [{32, 7460}, {1, 244000}, {22, 298800}];
day_reward({250, 4}) ->
    [{32, 7480}, {1, 244500}, {22, 299400}];
day_reward({251, 4}) ->
    [{32, 7500}, {1, 245000}, {22, 300000}];
day_reward({252, 4}) ->
    [{32, 7520}, {1, 245500}, {22, 300600}];
day_reward({253, 4}) ->
    [{32, 7540}, {1, 246000}, {22, 301200}];
day_reward({254, 4}) ->
    [{32, 7560}, {1, 246500}, {22, 301800}];
day_reward({255, 4}) ->
    [{32, 7580}, {1, 247000}, {22, 302400}];
day_reward({256, 4}) ->
    [{32, 7600}, {1, 247500}, {22, 303000}];
day_reward({257, 4}) ->
    [{32, 7620}, {1, 248000}, {22, 303600}];
day_reward({258, 4}) ->
    [{32, 7640}, {1, 248500}, {22, 304200}];
day_reward({259, 4}) ->
    [{32, 7660}, {1, 249000}, {22, 304800}];
day_reward({260, 4}) ->
    [{32, 7680}, {1, 249500}, {22, 305400}];
day_reward({261, 4}) ->
    [{32, 7700}, {1, 250000}, {22, 306000}];
day_reward({262, 4}) ->
    [{32, 7720}, {1, 250500}, {22, 306600}];
day_reward({263, 4}) ->
    [{32, 7740}, {1, 251000}, {22, 307200}];
day_reward({264, 4}) ->
    [{32, 7760}, {1, 251500}, {22, 307800}];
day_reward({265, 4}) ->
    [{32, 7780}, {1, 252000}, {22, 308400}];
day_reward({266, 4}) ->
    [{32, 7800}, {1, 252500}, {22, 309000}];
day_reward({267, 4}) ->
    [{32, 7820}, {1, 253000}, {22, 309600}];
day_reward({268, 4}) ->
    [{32, 7840}, {1, 253500}, {22, 310200}];
day_reward({269, 4}) ->
    [{32, 7860}, {1, 254000}, {22, 310800}];
day_reward({270, 4}) ->
    [{32, 7880}, {1, 254500}, {22, 311400}];
day_reward({271, 4}) ->
    [{32, 7900}, {1, 255000}, {22, 312000}];
day_reward({272, 4}) ->
    [{32, 7920}, {1, 255500}, {22, 312600}];
day_reward({273, 4}) ->
    [{32, 7940}, {1, 256000}, {22, 313200}];
day_reward({274, 4}) ->
    [{32, 7960}, {1, 256500}, {22, 313800}];
day_reward({275, 4}) ->
    [{32, 7980}, {1, 257000}, {22, 314400}];
day_reward({276, 4}) ->
    [{32, 8000}, {1, 257500}, {22, 315000}];
day_reward({277, 4}) ->
    [{32, 8020}, {1, 258000}, {22, 315600}];
day_reward({278, 4}) ->
    [{32, 8040}, {1, 258500}, {22, 316200}];
day_reward({279, 4}) ->
    [{32, 8060}, {1, 259000}, {22, 316800}];
day_reward({280, 4}) ->
    [{32, 8080}, {1, 259500}, {22, 317400}];
day_reward({281, 4}) ->
    [{32, 8100}, {1, 260000}, {22, 318000}];
day_reward({282, 4}) ->
    [{32, 8120}, {1, 260500}, {22, 318600}];
day_reward({283, 4}) ->
    [{32, 8140}, {1, 261000}, {22, 319200}];
day_reward({284, 4}) ->
    [{32, 8160}, {1, 261500}, {22, 319800}];
day_reward({285, 4}) ->
    [{32, 8180}, {1, 262000}, {22, 320400}];
day_reward({286, 4}) ->
    [{32, 8200}, {1, 262500}, {22, 321000}];
day_reward({287, 4}) ->
    [{32, 8220}, {1, 263000}, {22, 321600}];
day_reward({288, 4}) ->
    [{32, 8240}, {1, 263500}, {22, 322200}];
day_reward({289, 4}) ->
    [{32, 8260}, {1, 264000}, {22, 322800}];
day_reward({290, 4}) ->
    [{32, 8280}, {1, 264500}, {22, 323400}];
day_reward({291, 4}) ->
    [{32, 8300}, {1, 265000}, {22, 324000}];
day_reward({292, 4}) ->
    [{32, 8320}, {1, 265500}, {22, 324600}];
day_reward({293, 4}) ->
    [{32, 8340}, {1, 266000}, {22, 325200}];
day_reward({294, 4}) ->
    [{32, 8360}, {1, 266500}, {22, 325800}];
day_reward({295, 4}) ->
    [{32, 8380}, {1, 267000}, {22, 326400}];
day_reward({296, 4}) ->
    [{32, 8400}, {1, 267500}, {22, 327000}];
day_reward({297, 4}) ->
    [{32, 8420}, {1, 268000}, {22, 327600}];
day_reward({298, 4}) ->
    [{32, 8440}, {1, 268500}, {22, 328200}];
day_reward({299, 4}) ->
    [{32, 8460}, {1, 269000}, {22, 328800}];
day_reward({300, 4}) ->
    [{32, 8480}, {1, 269500}, {22, 329400}];
day_reward({301, 4}) ->
    [{32, 8500}, {1, 270000}, {22, 330000}];
day_reward({302, 4}) ->
    [{32, 8520}, {1, 270500}, {22, 330600}];
day_reward({303, 4}) ->
    [{32, 8540}, {1, 271000}, {22, 331200}];
day_reward({304, 4}) ->
    [{32, 8560}, {1, 271500}, {22, 331800}];
day_reward({305, 4}) ->
    [{32, 8580}, {1, 272000}, {22, 332400}];
day_reward({306, 4}) ->
    [{32, 8600}, {1, 272500}, {22, 333000}];
day_reward({307, 4}) ->
    [{32, 8620}, {1, 273000}, {22, 333600}];
day_reward({308, 4}) ->
    [{32, 8640}, {1, 273500}, {22, 334200}];
day_reward({309, 4}) ->
    [{32, 8660}, {1, 274000}, {22, 334800}];
day_reward({310, 4}) ->
    [{32, 8680}, {1, 274500}, {22, 335400}];
day_reward({311, 4}) ->
    [{32, 8700}, {1, 275000}, {22, 336000}];
day_reward({312, 4}) ->
    [{32, 8720}, {1, 275500}, {22, 336600}];
day_reward({313, 4}) ->
    [{32, 8740}, {1, 276000}, {22, 337200}];
day_reward({314, 4}) ->
    [{32, 8760}, {1, 276500}, {22, 337800}];
day_reward({315, 4}) ->
    [{32, 8780}, {1, 277000}, {22, 338400}];
day_reward({316, 4}) ->
    [{32, 8800}, {1, 277500}, {22, 339000}];
day_reward({317, 4}) ->
    [{32, 8820}, {1, 278000}, {22, 339600}];
day_reward({318, 4}) ->
    [{32, 8840}, {1, 278500}, {22, 340200}];
day_reward({319, 4}) ->
    [{32, 8860}, {1, 279000}, {22, 340800}];
day_reward({320, 4}) ->
    [{32, 8880}, {1, 279500}, {22, 341400}];
day_reward({321, 4}) ->
    [{32, 8900}, {1, 280000}, {22, 342000}];
day_reward({322, 4}) ->
    [{32, 8920}, {1, 280500}, {22, 342600}];
day_reward({323, 4}) ->
    [{32, 8940}, {1, 281000}, {22, 343200}];
day_reward({324, 4}) ->
    [{32, 8960}, {1, 281500}, {22, 343800}];
day_reward({325, 4}) ->
    [{32, 8980}, {1, 282000}, {22, 344400}];
day_reward({326, 4}) ->
    [{32, 9000}, {1, 282500}, {22, 345000}];
day_reward({327, 4}) ->
    [{32, 9020}, {1, 283000}, {22, 345600}];
day_reward({328, 4}) ->
    [{32, 9040}, {1, 283500}, {22, 346200}];
day_reward({329, 4}) ->
    [{32, 9060}, {1, 284000}, {22, 346800}];
day_reward({330, 4}) ->
    [{32, 9080}, {1, 284500}, {22, 347400}];
day_reward({331, 4}) ->
    [{32, 9100}, {1, 285000}, {22, 348000}];
day_reward({332, 4}) ->
    [{32, 9120}, {1, 285500}, {22, 348600}];
day_reward({333, 4}) ->
    [{32, 9140}, {1, 286000}, {22, 349200}];
day_reward({334, 4}) ->
    [{32, 9160}, {1, 286500}, {22, 349800}];
day_reward({335, 4}) ->
    [{32, 9180}, {1, 287000}, {22, 350400}];
day_reward({336, 4}) ->
    [{32, 9200}, {1, 287500}, {22, 351000}];
day_reward({337, 4}) ->
    [{32, 9220}, {1, 288000}, {22, 351600}];
day_reward({338, 4}) ->
    [{32, 9240}, {1, 288500}, {22, 352200}];
day_reward({339, 4}) ->
    [{32, 9260}, {1, 289000}, {22, 352800}];
day_reward({340, 4}) ->
    [{32, 9280}, {1, 289500}, {22, 353400}];
day_reward({341, 4}) ->
    [{32, 9300}, {1, 290000}, {22, 354000}];
day_reward({342, 4}) ->
    [{32, 9320}, {1, 290500}, {22, 354600}];
day_reward({343, 4}) ->
    [{32, 9340}, {1, 291000}, {22, 355200}];
day_reward({344, 4}) ->
    [{32, 9360}, {1, 291500}, {22, 355800}];
day_reward({345, 4}) ->
    [{32, 9380}, {1, 292000}, {22, 356400}];
day_reward({346, 4}) ->
    [{32, 9400}, {1, 292500}, {22, 357000}];
day_reward({347, 4}) ->
    [{32, 9420}, {1, 293000}, {22, 357600}];
day_reward({348, 4}) ->
    [{32, 9440}, {1, 293500}, {22, 358200}];
day_reward({349, 4}) ->
    [{32, 9460}, {1, 294000}, {22, 358800}];
day_reward({350, 4}) ->
    [{32, 9480}, {1, 294500}, {22, 359400}];
day_reward({351, 4}) ->
    [{32, 9500}, {1, 295000}, {22, 360000}];
day_reward({352, 4}) ->
    [{32, 9520}, {1, 295500}, {22, 360600}];
day_reward({353, 4}) ->
    [{32, 9540}, {1, 296000}, {22, 361200}];
day_reward({354, 4}) ->
    [{32, 9560}, {1, 296500}, {22, 361800}];
day_reward({355, 4}) ->
    [{32, 9580}, {1, 297000}, {22, 362400}];
day_reward({356, 4}) ->
    [{32, 9600}, {1, 297500}, {22, 363000}];
day_reward({357, 4}) ->
    [{32, 9620}, {1, 298000}, {22, 363600}];
day_reward({358, 4}) ->
    [{32, 9640}, {1, 298500}, {22, 364200}];
day_reward({359, 4}) ->
    [{32, 9660}, {1, 299000}, {22, 364800}];
day_reward({360, 4}) ->
    [{32, 9680}, {1, 299500}, {22, 365400}];
day_reward({361, 4}) ->
    [{32, 9700}, {1, 300000}, {22, 366000}];
day_reward({362, 4}) ->
    [{32, 9720}, {1, 300500}, {22, 366600}];
day_reward({363, 4}) ->
    [{32, 9740}, {1, 301000}, {22, 367200}];
day_reward({364, 4}) ->
    [{32, 9760}, {1, 301500}, {22, 367800}];
day_reward({365, 4}) ->
    [{32, 9780}, {1, 302000}, {22, 368400}];
day_reward({366, 4}) ->
    [{32, 9800}, {1, 302500}, {22, 369000}];
day_reward({367, 4}) ->
    [{32, 9820}, {1, 303000}, {22, 369600}];
day_reward({368, 4}) ->
    [{32, 9840}, {1, 303500}, {22, 370200}];
day_reward({369, 4}) ->
    [{32, 9860}, {1, 304000}, {22, 370800}];
day_reward({370, 4}) ->
    [{32, 9880}, {1, 304500}, {22, 371400}];
day_reward({371, 4}) ->
    [{32, 9900}, {1, 305000}, {22, 372000}];
day_reward({372, 4}) ->
    [{32, 9920}, {1, 305500}, {22, 372600}];
day_reward({373, 4}) ->
    [{32, 9940}, {1, 306000}, {22, 373200}];
day_reward({374, 4}) ->
    [{32, 9960}, {1, 306500}, {22, 373800}];
day_reward({375, 4}) ->
    [{32, 9980}, {1, 307000}, {22, 374400}];
day_reward({376, 4}) ->
    [{32, 10000}, {1, 307500}, {22, 375000}];
day_reward({377, 4}) ->
    [{32, 10020}, {1, 308000}, {22, 375600}];
day_reward({378, 4}) ->
    [{32, 10040}, {1, 308500}, {22, 376200}];
day_reward({379, 4}) ->
    [{32, 10060}, {1, 309000}, {22, 376800}];
day_reward({380, 4}) ->
    [{32, 10080}, {1, 309500}, {22, 377400}];
day_reward({381, 4}) ->
    [{32, 10100}, {1, 310000}, {22, 378000}];
day_reward({382, 4}) ->
    [{32, 10120}, {1, 310500}, {22, 378600}];
day_reward({383, 4}) ->
    [{32, 10140}, {1, 311000}, {22, 379200}];
day_reward({384, 4}) ->
    [{32, 10160}, {1, 311500}, {22, 379800}];
day_reward({385, 4}) ->
    [{32, 10180}, {1, 312000}, {22, 380400}];
day_reward({386, 4}) ->
    [{32, 10200}, {1, 312500}, {22, 381000}];
day_reward({387, 4}) ->
    [{32, 10220}, {1, 313000}, {22, 381600}];
day_reward({388, 4}) ->
    [{32, 10240}, {1, 313500}, {22, 382200}];
day_reward({389, 4}) ->
    [{32, 10260}, {1, 314000}, {22, 382800}];
day_reward({390, 4}) ->
    [{32, 10280}, {1, 314500}, {22, 383400}];
day_reward({391, 4}) ->
    [{32, 10300}, {1, 315000}, {22, 384000}];
day_reward({392, 4}) ->
    [{32, 10320}, {1, 315500}, {22, 384600}];
day_reward({393, 4}) ->
    [{32, 10340}, {1, 316000}, {22, 385200}];
day_reward({394, 4}) ->
    [{32, 10360}, {1, 316500}, {22, 385800}];
day_reward({395, 4}) ->
    [{32, 10380}, {1, 317000}, {22, 386400}];
day_reward({396, 4}) ->
    [{32, 10400}, {1, 317500}, {22, 387000}];
day_reward({397, 4}) ->
    [{32, 10420}, {1, 318000}, {22, 387600}];
day_reward({398, 4}) ->
    [{32, 10440}, {1, 318500}, {22, 388200}];
day_reward({399, 4}) ->
    [{32, 10460}, {1, 319000}, {22, 388800}];
day_reward({400, 4}) ->
    [{32, 10480}, {1, 319500}, {22, 389400}];
day_reward({401, 4}) ->
    [{32, 10500}, {1, 320000}, {22, 390000}];
day_reward({402, 4}) ->
    [{32, 10520}, {1, 320500}, {22, 390600}];
day_reward({403, 4}) ->
    [{32, 10540}, {1, 321000}, {22, 391200}];
day_reward({404, 4}) ->
    [{32, 10560}, {1, 321500}, {22, 391800}];
day_reward({405, 4}) ->
    [{32, 10580}, {1, 322000}, {22, 392400}];
day_reward({406, 4}) ->
    [{32, 10600}, {1, 322500}, {22, 393000}];
day_reward({407, 4}) ->
    [{32, 10620}, {1, 323000}, {22, 393600}];
day_reward({408, 4}) ->
    [{32, 10640}, {1, 323500}, {22, 394200}];
day_reward({409, 4}) ->
    [{32, 10660}, {1, 324000}, {22, 394800}];
day_reward({410, 4}) ->
    [{32, 10680}, {1, 324500}, {22, 395400}];
day_reward({411, 4}) ->
    [{32, 10700}, {1, 325000}, {22, 396000}];
day_reward({412, 4}) ->
    [{32, 10720}, {1, 325500}, {22, 396600}];
day_reward({413, 4}) ->
    [{32, 10740}, {1, 326000}, {22, 397200}];
day_reward({414, 4}) ->
    [{32, 10760}, {1, 326500}, {22, 397800}];
day_reward({415, 4}) ->
    [{32, 10780}, {1, 327000}, {22, 398400}];
day_reward({416, 4}) ->
    [{32, 10800}, {1, 327500}, {22, 399000}];
day_reward({417, 4}) ->
    [{32, 10820}, {1, 328000}, {22, 399600}];
day_reward({418, 4}) ->
    [{32, 10840}, {1, 328500}, {22, 400200}];
day_reward({419, 4}) ->
    [{32, 10860}, {1, 329000}, {22, 400800}];
day_reward({420, 4}) ->
    [{32, 10880}, {1, 329500}, {22, 401400}];
day_reward({421, 4}) ->
    [{32, 10900}, {1, 330000}, {22, 402000}];
day_reward({422, 4}) ->
    [{32, 10920}, {1, 330500}, {22, 402600}];
day_reward({423, 4}) ->
    [{32, 10940}, {1, 331000}, {22, 403200}];
day_reward({424, 4}) ->
    [{32, 10960}, {1, 331500}, {22, 403800}];
day_reward({425, 4}) ->
    [{32, 10980}, {1, 332000}, {22, 404400}];
day_reward({426, 4}) ->
    [{32, 11000}, {1, 332500}, {22, 405000}];
day_reward({427, 4}) ->
    [{32, 11020}, {1, 333000}, {22, 405600}];
day_reward({428, 4}) ->
    [{32, 11040}, {1, 333500}, {22, 406200}];
day_reward({429, 4}) ->
    [{32, 11060}, {1, 334000}, {22, 406800}];
day_reward({430, 4}) ->
    [{32, 11080}, {1, 334500}, {22, 407400}];
day_reward({431, 4}) ->
    [{32, 11100}, {1, 335000}, {22, 408000}];
day_reward({432, 4}) ->
    [{32, 11120}, {1, 335500}, {22, 408600}];
day_reward({433, 4}) ->
    [{32, 11140}, {1, 336000}, {22, 409200}];
day_reward({434, 4}) ->
    [{32, 11160}, {1, 336500}, {22, 409800}];
day_reward({435, 4}) ->
    [{32, 11180}, {1, 337000}, {22, 410400}];
day_reward({436, 4}) ->
    [{32, 11200}, {1, 337500}, {22, 411000}];
day_reward({437, 4}) ->
    [{32, 11220}, {1, 338000}, {22, 411600}];
day_reward({438, 4}) ->
    [{32, 11240}, {1, 338500}, {22, 412200}];
day_reward({439, 4}) ->
    [{32, 11260}, {1, 339000}, {22, 412800}];
day_reward({440, 4}) ->
    [{32, 11280}, {1, 339500}, {22, 413400}];
day_reward({441, 4}) ->
    [{32, 11300}, {1, 340000}, {22, 414000}];
day_reward({442, 4}) ->
    [{32, 11320}, {1, 340500}, {22, 414600}];
day_reward({443, 4}) ->
    [{32, 11340}, {1, 341000}, {22, 415200}];
day_reward({444, 4}) ->
    [{32, 11360}, {1, 341500}, {22, 415800}];
day_reward({445, 4}) ->
    [{32, 11380}, {1, 342000}, {22, 416400}];
day_reward({446, 4}) ->
    [{32, 11400}, {1, 342500}, {22, 417000}];
day_reward({447, 4}) ->
    [{32, 11420}, {1, 343000}, {22, 417600}];
day_reward({448, 4}) ->
    [{32, 11440}, {1, 343500}, {22, 418200}];
day_reward({449, 4}) ->
    [{32, 11460}, {1, 344000}, {22, 418800}];
day_reward({450, 4}) ->
    [{32, 11480}, {1, 344500}, {22, 419400}];
day_reward({451, 4}) ->
    [{32, 11500}, {1, 345000}, {22, 420000}];
day_reward({452, 4}) ->
    [{32, 11520}, {1, 345500}, {22, 420600}];
day_reward({453, 4}) ->
    [{32, 11540}, {1, 346000}, {22, 421200}];
day_reward({454, 4}) ->
    [{32, 11560}, {1, 346500}, {22, 421800}];
day_reward({455, 4}) ->
    [{32, 11580}, {1, 347000}, {22, 422400}];
day_reward({456, 4}) ->
    [{32, 11600}, {1, 347500}, {22, 423000}];
day_reward({457, 4}) ->
    [{32, 11620}, {1, 348000}, {22, 423600}];
day_reward({458, 4}) ->
    [{32, 11640}, {1, 348500}, {22, 424200}];
day_reward({459, 4}) ->
    [{32, 11660}, {1, 349000}, {22, 424800}];
day_reward({460, 4}) ->
    [{32, 11680}, {1, 349500}, {22, 425400}];
day_reward({461, 4}) ->
    [{32, 11700}, {1, 350000}, {22, 426000}];
day_reward({462, 4}) ->
    [{32, 11720}, {1, 350500}, {22, 426600}];
day_reward({463, 4}) ->
    [{32, 11740}, {1, 351000}, {22, 427200}];
day_reward({464, 4}) ->
    [{32, 11760}, {1, 351500}, {22, 427800}];
day_reward({465, 4}) ->
    [{32, 11780}, {1, 352000}, {22, 428400}];
day_reward({466, 4}) ->
    [{32, 11800}, {1, 352500}, {22, 429000}];
day_reward({467, 4}) ->
    [{32, 11820}, {1, 353000}, {22, 429600}];
day_reward({468, 4}) ->
    [{32, 11840}, {1, 353500}, {22, 430200}];
day_reward({469, 4}) ->
    [{32, 11860}, {1, 354000}, {22, 430800}];
day_reward({470, 4}) ->
    [{32, 11880}, {1, 354500}, {22, 431400}];
day_reward({471, 4}) ->
    [{32, 11900}, {1, 355000}, {22, 432000}];
day_reward({472, 4}) ->
    [{32, 11920}, {1, 355500}, {22, 432600}];
day_reward({473, 4}) ->
    [{32, 11940}, {1, 356000}, {22, 433200}];
day_reward({474, 4}) ->
    [{32, 11960}, {1, 356500}, {22, 433800}];
day_reward({475, 4}) ->
    [{32, 11980}, {1, 357000}, {22, 434400}];
day_reward({476, 4}) ->
    [{32, 12000}, {1, 357500}, {22, 435000}];
day_reward({477, 4}) ->
    [{32, 12020}, {1, 358000}, {22, 435600}];
day_reward({478, 4}) ->
    [{32, 12040}, {1, 358500}, {22, 436200}];
day_reward({479, 4}) ->
    [{32, 12060}, {1, 359000}, {22, 436800}];
day_reward({480, 4}) ->
    [{32, 12080}, {1, 359500}, {22, 437400}];
day_reward({481, 4}) ->
    [{32, 12100}, {1, 360000}, {22, 438000}];
day_reward({482, 4}) ->
    [{32, 12120}, {1, 360500}, {22, 438600}];
day_reward({483, 4}) ->
    [{32, 12140}, {1, 361000}, {22, 439200}];
day_reward({484, 4}) ->
    [{32, 12160}, {1, 361500}, {22, 439800}];
day_reward({485, 4}) ->
    [{32, 12180}, {1, 362000}, {22, 440400}];
day_reward({486, 4}) ->
    [{32, 12200}, {1, 362500}, {22, 441000}];
day_reward({487, 4}) ->
    [{32, 12220}, {1, 363000}, {22, 441600}];
day_reward({488, 4}) ->
    [{32, 12240}, {1, 363500}, {22, 442200}];
day_reward({489, 4}) ->
    [{32, 12260}, {1, 364000}, {22, 442800}];
day_reward({490, 4}) ->
    [{32, 12280}, {1, 364500}, {22, 443400}];
day_reward({491, 4}) ->
    [{32, 12300}, {1, 365000}, {22, 444000}];
day_reward({492, 4}) ->
    [{32, 12320}, {1, 365500}, {22, 444600}];
day_reward({493, 4}) ->
    [{32, 12340}, {1, 366000}, {22, 445200}];
day_reward({494, 4}) ->
    [{32, 12360}, {1, 366500}, {22, 445800}];
day_reward({495, 4}) ->
    [{32, 12380}, {1, 367000}, {22, 446400}];
day_reward({496, 4}) ->
    [{32, 12400}, {1, 367500}, {22, 447000}];
day_reward({497, 4}) ->
    [{32, 12420}, {1, 368000}, {22, 447600}];
day_reward({498, 4}) ->
    [{32, 12440}, {1, 368500}, {22, 448200}];
day_reward({499, 4}) ->
    [{32, 12460}, {1, 369000}, {22, 448800}];
day_reward({500, 4}) ->
    [{32, 12480}, {1, 369500}, {22, 449400}];
day_reward(_Info) ->
    logger:data_error("day_reward_data_not_exist===>~w",
		      [_Info], endless_data, 36194),
    undefined.

rank_reward({5, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    [{10450, 300}, {22, 500000}];
rank_reward({5, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    [{10450, 250}, {22, 400000}];
rank_reward({5, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    [{10450, 200}, {22, 300000}];
rank_reward({5, Idx}) when Idx >= 4 andalso Idx =< 10 ->
    [{10450, 150}, {22, 250000}];
rank_reward({5, Idx})
    when Idx >= 11 andalso Idx =< 20 ->
    [{10450, 120}, {22, 200000}];
rank_reward({5, Idx})
    when Idx >= 21 andalso Idx =< 50 ->
    [{10450, 100}, {22, 150000}];
rank_reward({5, Idx})
    when Idx >= 51 andalso Idx =< 100 ->
    [{10450, 80}, {22, 100000}];
rank_reward({5, Idx})
    when Idx >= 101 andalso Idx =< 9999 ->
    [{10450, 50}, {22, 50000}];
rank_reward({1, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    [{10450, 300}, {17001, 30}, {1, 1200000}];
rank_reward({1, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    [{10450, 250}, {17001, 25}, {1, 1000000}];
rank_reward({1, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    [{10450, 200}, {17001, 20}, {1, 800000}];
rank_reward({1, Idx}) when Idx >= 4 andalso Idx =< 10 ->
    [{10450, 150}, {17001, 15}, {1, 600000}];
rank_reward({1, Idx})
    when Idx >= 11 andalso Idx =< 20 ->
    [{10450, 120}, {17001, 12}, {1, 480000}];
rank_reward({1, Idx})
    when Idx >= 21 andalso Idx =< 50 ->
    [{10450, 100}, {17001, 10}, {1, 400000}];
rank_reward({1, Idx})
    when Idx >= 51 andalso Idx =< 100 ->
    [{10450, 80}, {17001, 8}, {1, 320000}];
rank_reward({1, Idx})
    when Idx >= 101 andalso Idx =< 9999 ->
    [{10450, 50}, {17001, 5}, {1, 200000}];
rank_reward({2, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    [{10450, 300}, {17002, 30}, {1, 1200000}];
rank_reward({2, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    [{10450, 250}, {17002, 25}, {1, 1000000}];
rank_reward({2, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    [{10450, 200}, {17002, 20}, {1, 800000}];
rank_reward({2, Idx}) when Idx >= 4 andalso Idx =< 10 ->
    [{10450, 150}, {17002, 15}, {1, 600000}];
rank_reward({2, Idx})
    when Idx >= 11 andalso Idx =< 20 ->
    [{10450, 120}, {17002, 12}, {1, 480000}];
rank_reward({2, Idx})
    when Idx >= 21 andalso Idx =< 50 ->
    [{10450, 100}, {17002, 10}, {1, 400000}];
rank_reward({2, Idx})
    when Idx >= 51 andalso Idx =< 100 ->
    [{10450, 80}, {17002, 8}, {1, 320000}];
rank_reward({2, Idx})
    when Idx >= 101 andalso Idx =< 9999 ->
    [{10450, 50}, {17002, 5}, {1, 200000}];
rank_reward({3, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    [{10450, 300}, {17003, 30}, {1, 1200000}];
rank_reward({3, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    [{10450, 250}, {17003, 25}, {1, 1000000}];
rank_reward({3, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    [{10450, 200}, {17003, 20}, {1, 800000}];
rank_reward({3, Idx}) when Idx >= 4 andalso Idx =< 10 ->
    [{10450, 150}, {17003, 15}, {1, 600000}];
rank_reward({3, Idx})
    when Idx >= 11 andalso Idx =< 20 ->
    [{10450, 120}, {17003, 12}, {1, 480000}];
rank_reward({3, Idx})
    when Idx >= 21 andalso Idx =< 50 ->
    [{10450, 100}, {17003, 10}, {1, 400000}];
rank_reward({3, Idx})
    when Idx >= 51 andalso Idx =< 100 ->
    [{10450, 80}, {17003, 8}, {1, 320000}];
rank_reward({3, Idx})
    when Idx >= 101 andalso Idx =< 9999 ->
    [{10450, 50}, {17003, 5}, {1, 200000}];
rank_reward({4, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    [{10450, 300}, {17008, 30}, {1, 1200000}];
rank_reward({4, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    [{10450, 250}, {17008, 25}, {1, 1000000}];
rank_reward({4, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    [{10450, 200}, {17008, 20}, {1, 800000}];
rank_reward({4, Idx}) when Idx >= 4 andalso Idx =< 10 ->
    [{10450, 150}, {17008, 15}, {1, 600000}];
rank_reward({4, Idx})
    when Idx >= 11 andalso Idx =< 20 ->
    [{10450, 120}, {17008, 12}, {1, 480000}];
rank_reward({4, Idx})
    when Idx >= 21 andalso Idx =< 50 ->
    [{10450, 100}, {17008, 10}, {1, 400000}];
rank_reward({4, Idx})
    when Idx >= 51 andalso Idx =< 100 ->
    [{10450, 80}, {17008, 8}, {1, 320000}];
rank_reward({4, Idx})
    when Idx >= 101 andalso Idx =< 9999 ->
    [{10450, 50}, {17008, 5}, {1, 200000}];
rank_reward(_Info) ->
    logger:data_error("rank_reward_data_not_exist===>~w",
		      [_Info], endless_data, 36236),
    undefined.

robot_group(Lev) when Lev >= 1 andalso Lev =< 10 -> 1;
robot_group(Lev) when Lev >= 11 andalso Lev =< 20 -> 2;
robot_group(Lev) when Lev >= 21 andalso Lev =< 30 -> 3;
robot_group(Lev) when Lev >= 31 andalso Lev =< 40 -> 4;
robot_group(Lev) when Lev >= 41 andalso Lev =< 50 -> 5;
robot_group(Lev) when Lev >= 51 andalso Lev =< 60 -> 6;
robot_group(Lev) when Lev >= 61 andalso Lev =< 70 -> 7;
robot_group(Lev) when Lev >= 71 andalso Lev =< 80 -> 8;
robot_group(Lev) when Lev >= 81 andalso Lev =< 90 -> 9;
robot_group(Lev) when Lev >= 91 andalso Lev =< 100 ->
    10;
robot_group(_Info) ->
    logger:data_error("robot_group_data_not_exist===>~w",
		      [_Info], endless_data, 36248),
    undefined.

robot_list(10) ->
    [#endless_robot_data{id = 1001, group_id = 10,
			 bid = 21003, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610010, power = 125214, lev = 100,
			 star = 5}];
robot_list(9) ->
    [#endless_robot_data{id = 901, group_id = 9,
			 bid = 21003, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610009, power = 100364, lev = 90, star = 5}];
robot_list(8) ->
    [#endless_robot_data{id = 801, group_id = 8,
			 bid = 21003, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610008, power = 76398, lev = 80, star = 4}];
robot_list(7) ->
    [#endless_robot_data{id = 701, group_id = 7,
			 bid = 21003, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610007, power = 56129, lev = 70, star = 4}];
robot_list(6) ->
    [#endless_robot_data{id = 601, group_id = 6,
			 bid = 21003, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610006, power = 41105, lev = 60, star = 4}];
robot_list(5) ->
    [#endless_robot_data{id = 501, group_id = 5,
			 bid = 20009, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610005, power = 28726, lev = 50, star = 4}];
robot_list(4) ->
    [#endless_robot_data{id = 401, group_id = 4,
			 bid = 20009, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610004, power = 18426, lev = 40, star = 3}];
robot_list(3) ->
    [#endless_robot_data{id = 301, group_id = 3,
			 bid = 20009, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610003, power = 12212, lev = 30, star = 3}];
robot_list(2) ->
    [#endless_robot_data{id = 201, group_id = 2,
			 bid = 50003, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610002, power = 7326, lev = 20, star = 3}];
robot_list(1) ->
    [#endless_robot_data{id = 101, group_id = 1,
			 bid = 50003, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			 unit_id = 610001, power = 2624, lev = 10, star = 2}];
robot_list(_) -> [].

get_robot(101) ->
    #endless_robot_data{id = 101, group_id = 1, bid = 50003,
			rname = lang:get(<<"凯瑟琳的援助"/utf8>>), unit_id = 610001,
			power = 2624, lev = 10, star = 2};
get_robot(201) ->
    #endless_robot_data{id = 201, group_id = 2, bid = 50003,
			rname = lang:get(<<"凯瑟琳的援助"/utf8>>), unit_id = 610002,
			power = 7326, lev = 20, star = 3};
get_robot(301) ->
    #endless_robot_data{id = 301, group_id = 3, bid = 20009,
			rname = lang:get(<<"凯瑟琳的援助"/utf8>>), unit_id = 610003,
			power = 12212, lev = 30, star = 3};
get_robot(401) ->
    #endless_robot_data{id = 401, group_id = 4, bid = 20009,
			rname = lang:get(<<"凯瑟琳的援助"/utf8>>), unit_id = 610004,
			power = 18426, lev = 40, star = 3};
get_robot(501) ->
    #endless_robot_data{id = 501, group_id = 5, bid = 20009,
			rname = lang:get(<<"凯瑟琳的援助"/utf8>>), unit_id = 610005,
			power = 28726, lev = 50, star = 4};
get_robot(601) ->
    #endless_robot_data{id = 601, group_id = 6, bid = 21003,
			rname = lang:get(<<"凯瑟琳的援助"/utf8>>), unit_id = 610006,
			power = 41105, lev = 60, star = 4};
get_robot(701) ->
    #endless_robot_data{id = 701, group_id = 7, bid = 21003,
			rname = lang:get(<<"凯瑟琳的援助"/utf8>>), unit_id = 610007,
			power = 56129, lev = 70, star = 4};
get_robot(801) ->
    #endless_robot_data{id = 801, group_id = 8, bid = 21003,
			rname = lang:get(<<"凯瑟琳的援助"/utf8>>), unit_id = 610008,
			power = 76398, lev = 80, star = 4};
get_robot(901) ->
    #endless_robot_data{id = 901, group_id = 9, bid = 21003,
			rname = lang:get(<<"凯瑟琳的援助"/utf8>>), unit_id = 610009,
			power = 100364, lev = 90, star = 5};
get_robot(1001) ->
    #endless_robot_data{id = 1001, group_id = 10,
			bid = 21003, rname = lang:get(<<"凯瑟琳的援助"/utf8>>),
			unit_id = 610010, power = 125214, lev = 100, star = 5};
get_robot(_Info) ->
    logger:data_error("get_robot_data_not_exist===>~w",
		      [_Info], endless_data, 36462),
    undefined.

get_all_type() ->
    [{4, 4, 3}, {3, 3, 3}, {2, 2, 3}, {1, 1, 3}].

get_all_day() -> [3, 3, 3, 3].

get_limit_partner_list(1) -> [];
get_limit_partner_list(2) -> [];
get_limit_partner_list(3) -> [];
get_limit_partner_list(4) -> [];
get_limit_partner_list(_) -> undefined.


