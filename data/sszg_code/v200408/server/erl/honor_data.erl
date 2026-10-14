-file("data/honor_data.erl", 1).

-file("data/honor_data.erl", 1).

-file("src/mod/data/honor_data.erl", 1).

-module(honor_data).

-lager_records([{honor_info, [key, list, end_time]},
		{honor_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr, add_exp, dynamic]},
		{honor, [ver, base_id, expire_time]},
		{m_honor, [ver, used, list]}]).

-export([get/1, const/1]).

-file("inc/common.hrl", 1).

-file("inc/lib_log.hrl", 1).

-file("inc/common.hrl", 109).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("src/mod/data/honor_data.erl", 11).

-file("inc/honor.hrl", 1).

-record(m_honor, {ver = 1, used = 0, list = []}).

-record(honor, {ver = 1, base_id = 0, expire_time = 0}).

-record(honor_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = [], add_exp = 0, dynamic = 0}).

-record(honor_info,
	{key  :: atom(), list = []  :: list(),
	 end_time = 0  :: non_neg_integer()}).

-file("src/mod/data/honor_data.erl", 12).

get(90003) ->
    #honor_data{base_id = 90003,
		name = lang:get(<<"最强王者"/utf8>>), group = 1001,
		loss = [{50012, 1}], overlap = 0, expire_type = 1,
		expire_time = 5760, is_panel = 1,
		attr = [{hp_max, 1200}, {atk, 250}]};
get(90004) ->
    #honor_data{base_id = 90004,
		name = lang:get(<<"星辰勇者"/utf8>>), group = 1002,
		loss = [{50013, 1}], overlap = 0, expire_type = 1,
		expire_time = 5760, is_panel = 1,
		attr = [{hp_max, 800}, {atk, 150}]};
get(90005) ->
    #honor_data{base_id = 90005,
		name = lang:get(<<"苍蓝斗士"/utf8>>), group = 1003,
		loss = [{50014, 1}], overlap = 0, expire_type = 1,
		expire_time = 5760, is_panel = 1,
		attr = [{hp_max, 500}, {atk, 100}]};
get(90006) ->
    #honor_data{base_id = 90006,
		name = lang:get(<<"大探险家"/utf8>>), group = 1004,
		loss = [{50101, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90007) ->
    #honor_data{base_id = 90007,
		name = lang:get(<<"爬塔达人"/utf8>>), group = 1005,
		loss = [{50102, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90008) ->
    #honor_data{base_id = 90008,
		name = lang:get(<<"竞技天王"/utf8>>), group = 1006,
		loss = [{50103, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90009) ->
    #honor_data{base_id = 90009,
		name = lang:get(<<"地表最强"/utf8>>), group = 1007,
		loss = [{50104, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90010) ->
    #honor_data{base_id = 90010,
		name = lang:get(<<"星耀之灵"/utf8>>), group = 1008,
		loss = [{50105, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90011) ->
    #honor_data{base_id = 90011,
		name = lang:get(<<"最强英雄"/utf8>>), group = 1009,
		loss = [{50106, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90012) ->
    #honor_data{base_id = 90012,
		name = lang:get(<<"翱游神界"/utf8>>), group = 1010,
		loss = [{50107, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90013) ->
    #honor_data{base_id = 90013,
		name = lang:get(<<"寻宝专家"/utf8>>), group = 1033,
		loss = [{50108, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90100) ->
    #honor_data{base_id = 90100,
		name = lang:get(<<"爬塔新手"/utf8>>), group = 1011,
		loss = [{50200, 1}], overlap = 0, expire_type = 0,
		is_panel = 0, attr = [{hp_max, 100}, {atk, 20}]};
get(90101) ->
    #honor_data{base_id = 90101,
		name = lang:get(<<"节节攀升"/utf8>>), group = 1012,
		loss = [{50200, 1}], overlap = 0, expire_type = 0,
		is_panel = 0,
		attr = [{hp_max, 100}, {atk, 20}, {def, 15}]};
get(90102) ->
    #honor_data{base_id = 90102,
		name = lang:get(<<"爬塔能手"/utf8>>), group = 1013,
		loss = [{50200, 1}], overlap = 0, expire_type = 0,
		is_panel = 0,
		attr = [{hp_max, 100}, {atk, 20}, {def, 15}]};
get(90103) ->
    #honor_data{base_id = 90103,
		name = lang:get(<<"一览无穷"/utf8>>), group = 1014,
		loss = [{50200, 1}], overlap = 0, expire_type = 0,
		is_panel = 0,
		attr = [{hp_max, 200}, {atk, 40}, {def, 30}]};
get(90104) ->
    #honor_data{base_id = 90104,
		name = lang:get(<<"突破天际"/utf8>>), group = 1015,
		loss = [{50200, 1}], overlap = 0, expire_type = 0,
		is_panel = 0,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90105) ->
    #honor_data{base_id = 90105,
		name = lang:get(<<"越战越勇"/utf8>>), group = 1016,
		loss = [{50200, 1}], overlap = 0, expire_type = 0,
		is_panel = 0,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90106) ->
    #honor_data{base_id = 90106,
		name = lang:get(<<"冠军之心"/utf8>>), group = 1017,
		loss = [{50301, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90401) ->
    #honor_data{base_id = 90401,
		name = lang:get(<<"破军之巅"/utf8>>), group = 1018,
		loss = [{50401, 1}], overlap = 0, expire_type = 1,
		expire_time = 1440, is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90402) ->
    #honor_data{base_id = 90402,
		name = lang:get(<<"不屈意志"/utf8>>), group = 1019,
		loss = [{50402, 1}], overlap = 0, expire_type = 1,
		expire_time = 1440, is_panel = 1,
		attr = [{hp_max, 200}, {atk, 40}, {def, 30}]};
get(90403) ->
    #honor_data{base_id = 90403,
		name = lang:get(<<"初露锋芒"/utf8>>), group = 1020,
		loss = [{50403, 1}], overlap = 0, expire_type = 1,
		expire_time = 1440, is_panel = 1,
		attr = [{hp_max, 100}, {atk, 20}, {def, 15}]};
get(90501) ->
    #honor_data{base_id = 90501,
		name = lang:get(<<"冰天雪地"/utf8>>), group = 1021,
		loss = [{50501, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 200}, {atk, 40}, {def, 30}]};
get(90502) ->
    #honor_data{base_id = 90502,
		name = lang:get(<<"黑暗世界"/utf8>>), group = 1022,
		loss = [{50502, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 200}, {atk, 40}, {def, 30}]};
get(90601) ->
    #honor_data{base_id = 90601,
		name = lang:get(<<"战场勇者"/utf8>>), group = 1023,
		loss = [{50601, 1}], overlap = 0, expire_type = 1,
		expire_time = 1440, is_panel = 1,
		attr = [{hp_max, 100}, {atk, 20}, {def, 15}]};
get(90602) ->
    #honor_data{base_id = 90602,
		name = lang:get(<<"战场霸主"/utf8>>), group = 1024,
		loss = [{50602, 1}], overlap = 0, expire_type = 1,
		expire_time = 1440, is_panel = 1,
		attr = [{hp_max, 200}, {atk, 40}, {def, 30}]};
get(90603) ->
    #honor_data{base_id = 90603,
		name = lang:get(<<"不败神话"/utf8>>), group = 1025,
		loss = [{50603, 1}], overlap = 0, expire_type = 1,
		expire_time = 1440, is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90701) ->
    #honor_data{base_id = 90701,
		name = lang:get(<<"耀眼光芒"/utf8>>), group = 1026,
		loss = [{50111, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90702) ->
    #honor_data{base_id = 90702,
		name = lang:get(<<"圣器王者"/utf8>>), group = 1027,
		loss = [{50112, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90703) ->
    #honor_data{base_id = 90703,
		name = lang:get(<<"观星大师"/utf8>>), group = 1028,
		loss = [{50113, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90704) ->
    #honor_data{base_id = 90704,
		name = lang:get(<<"试炼之王"/utf8>>), group = 1029,
		loss = [{50114, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90705) ->
    #honor_data{base_id = 90705,
		name = lang:get(<<"英雄无敌"/utf8>>), group = 1030,
		loss = [{50115, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90706) ->
    #honor_data{base_id = 90706,
		name = lang:get(<<"战力至上"/utf8>>), group = 1031,
		loss = [{50116, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90707) ->
    #honor_data{base_id = 90707,
		name = lang:get(<<"最强土豪"/utf8>>), group = 1032,
		loss = [{50117, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90801) ->
    #honor_data{base_id = 90801,
		name = lang:get(<<"万殿之巅"/utf8>>), group = 1050,
		loss = [{50701, 1}], overlap = 0, expire_type = 0,
		is_panel = 1, attr = [{hp_max_per, 30}, {atk_per, 30}],
		dynamic = 1};
get(90802) ->
    #honor_data{base_id = 90802,
		name = lang:get(<<"泰坦神耀"/utf8>>), group = 1051,
		loss = [{50702, 1}], overlap = 0, expire_type = 0,
		is_panel = 1, attr = [{hp_max_per, 20}, {atk_per, 20}],
		dynamic = 1};
get(90803) ->
    #honor_data{base_id = 90803,
		name = lang:get(<<"瀚海星灵"/utf8>>), group = 1052,
		loss = [{50703, 1}], overlap = 0, expire_type = 0,
		is_panel = 1, attr = [{hp_max_per, 10}, {atk_per, 10}],
		dynamic = 1};
get(90901) ->
    #honor_data{base_id = 90901,
		name = lang:get(<<"寻宝幸运星"/utf8>>), group = 1053,
		loss = [{50302, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90902) ->
    #honor_data{base_id = 90902,
		name = lang:get(<<"最强幸运星"/utf8>>), group = 1054,
		loss = [{50303, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(90903) ->
    #honor_data{base_id = 90903,
		name = lang:get(<<"神之眷顾"/utf8>>), group = 1055,
		loss = [{50304, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}]};
get(91001) ->
    #honor_data{base_id = 91001,
		name = lang:get(<<"登峰造极"/utf8>>), group = 1056,
		loss = [{50801, 1}], overlap = 0, expire_type = 1,
		expire_time = 10080, is_panel = 1,
		attr = [{hp_max, 1200}, {atk, 250}]};
get(91002) ->
    #honor_data{base_id = 91002,
		name = lang:get(<<"名列前茅"/utf8>>), group = 1057,
		loss = [{50802, 1}], overlap = 0, expire_type = 1,
		expire_time = 10080, is_panel = 1,
		attr = [{hp_max, 800}, {atk, 150}]};
get(91003) ->
    #honor_data{base_id = 91003,
		name = lang:get(<<"天梯达人"/utf8>>), group = 1058,
		loss = [{50803, 1}], overlap = 0, expire_type = 1,
		expire_time = 10080, is_panel = 1,
		attr = [{hp_max, 500}, {atk, 100}]};
get(92001) ->
    #honor_data{base_id = 92001,
		name = lang:get(<<"闪烁之光"/utf8>>), group = 1060,
		loss = [{50305, 1}], overlap = 0, expire_type = 0,
		is_panel = 1,
		attr = [{hp_max, 300}, {atk, 60}, {def, 45}],
		add_exp = 100};
get(99003) ->
    #honor_data{base_id = 99003,
		name = lang:get(<<"花灯福愿"/utf8>>), group = 1061,
		loss = [{50901, 1}], overlap = 0, expire_type = 0,
		is_panel = 1, attr = [{hp_max, 10}, {atk, 10}]};
get(99004) ->
    #honor_data{base_id = 99004,
		name = lang:get(<<"心动闪烁"/utf8>>), group = 1062,
		loss = [{50902, 1}], overlap = 0, expire_type = 0,
		is_panel = 1, attr = [{hp_max, 10}, {atk, 10}]};
get(99005) ->
    #honor_data{base_id = 99005,
		name = lang:get(<<"缤纷夏日"/utf8>>), group = 1063,
		loss = [{50903, 1}], overlap = 0, expire_type = 0,
		is_panel = 1, attr = [{hp_max, 10}, {atk, 10}]};
get(99006) ->
    #honor_data{base_id = 99006,
		name = lang:get(<<"英灵勇士"/utf8>>), group = 1064,
		loss = [{50904, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99007) ->
    #honor_data{base_id = 99007,
		name = lang:get(<<"荣耀之光"/utf8>>), group = 1065,
		loss = [{50905, 1}], overlap = 0, expire_type = 0,
		is_panel = 1, attr = [{hp_max, 10}, {atk, 10}]};
get(99008) ->
    #honor_data{base_id = 99008,
		name = lang:get(<<"冒险骑士团"/utf8>>), group = 1066,
		loss = [{50906, 1}], overlap = 0, expire_type = 0,
		is_panel = 1, attr = [{hp_max, 10}, {atk, 10}]};
get(99009) ->
    #honor_data{base_id = 99009,
		name = lang:get(<<"冒险勇士"/utf8>>), group = 1067,
		loss = [{50907, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99010) ->
    #honor_data{base_id = 99010,
		name = lang:get(<<"勇者归来"/utf8>>), group = 1068,
		loss = [{50908, 1}], overlap = 0, expire_type = 0,
		is_panel = 1, attr = [{hp_max, 10}, {atk, 10}]};
get(99011) ->
    #honor_data{base_id = 99011,
		name = lang:get(<<"潮汐猎人"/utf8>>), group = 1069,
		loss = [{50909, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99012) ->
    #honor_data{base_id = 99012,
		name = lang:get(<<"神奏之音"/utf8>>), group = 1070,
		loss = [{50910, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99013) ->
    #honor_data{base_id = 99013,
		name = lang:get(<<"一等学霸"/utf8>>), group = 1171,
		loss = [{50911, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99014) ->
    #honor_data{base_id = 99014,
		name = lang:get(<<"花火映秋"/utf8>>), group = 1172,
		loss = [{50912, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99015) ->
    #honor_data{base_id = 99015,
		name = lang:get(<<"神壕登场"/utf8>>), group = 1173,
		loss = [{50913, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max, 10}, {atk, 10}]};
get(99016) ->
    #honor_data{base_id = 99016,
		name = lang:get(<<"奇妙之夜"/utf8>>), group = 1174,
		loss = [{50914, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99017) ->
    #honor_data{base_id = 99017,
		name = lang:get(<<"雪舞冬季"/utf8>>), group = 1175,
		loss = [{50915, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99018) ->
    #honor_data{base_id = 99018,
		name = lang:get(<<"王者之辉"/utf8>>), group = 1176,
		loss = [{50916, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99019) ->
    #honor_data{base_id = 99019,
		name = lang:get(<<"重逢之旅"/utf8>>), group = 1177,
		loss = [{50917, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99020) ->
    #honor_data{base_id = 99020, name = <<"2020">>,
		group = 1178, loss = [{50918, 1}], overlap = 0,
		expire_type = 1, expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(99021) ->
    #honor_data{base_id = 99021,
		name = lang:get(<<"最强土豪"/utf8>>), group = 1179,
		loss = [{50919, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max, 10}, {atk, 10}]};
get(99022) ->
    #honor_data{base_id = 99022,
		name = lang:get(<<"踏雪花晨"/utf8>>), group = 1180,
		loss = [{50920, 1}], overlap = 0, expire_type = 1,
		expire_time = 43200, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(91101) ->
    #honor_data{base_id = 91101,
		name = lang:get(<<"超凡之巅"/utf8>>), group = 1071,
		loss = [{51001, 1}], overlap = 0, expire_type = 2,
		is_panel = 1, attr = [{hp_max_per, 30}, {atk_per, 30}]};
get(91102) ->
    #honor_data{base_id = 91102,
		name = lang:get(<<"灵耀王者"/utf8>>), group = 1072,
		loss = [{51002, 1}], overlap = 0, expire_type = 2,
		is_panel = 1, attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(91103) ->
    #honor_data{base_id = 91103,
		name = lang:get(<<"洛辉宗师"/utf8>>), group = 1073,
		loss = [{51003, 1}], overlap = 0, expire_type = 2,
		is_panel = 1, attr = [{hp_max_per, 10}, {atk_per, 10}]};
get(91201) ->
    #honor_data{base_id = 91201,
		name = lang:get(<<"天启战神"/utf8>>), group = 1081,
		loss = [{51101, 1}], overlap = 0, expire_type = 1,
		expire_time = 10080, is_panel = 1,
		attr = [{hp_max, 1200}, {atk, 250}]};
get(91202) ->
    #honor_data{base_id = 91202,
		name = lang:get(<<"月耀领主"/utf8>>), group = 1082,
		loss = [{51102, 1}], overlap = 0, expire_type = 1,
		expire_time = 10080, is_panel = 1,
		attr = [{hp_max, 800}, {atk, 150}]};
get(91203) ->
    #honor_data{base_id = 91203,
		name = lang:get(<<"星灵勇者"/utf8>>), group = 1083,
		loss = [{51103, 1}], overlap = 0, expire_type = 1,
		expire_time = 10080, is_panel = 1,
		attr = [{hp_max, 500}, {atk, 100}]};
get(91301) ->
    #honor_data{base_id = 91301,
		name = lang:get(<<"闪耀群星"/utf8>>), group = 1091,
		loss = [{51201, 1}], overlap = 0, expire_type = 1,
		expire_time = 10080, is_panel = 1,
		attr = [{hp_max, 1200}, {atk, 250}]};
get(91302) ->
    #honor_data{base_id = 91302,
		name = lang:get(<<"荣耀军团"/utf8>>), group = 1092,
		loss = [{51202, 1}], overlap = 0, expire_type = 1,
		expire_time = 10080, is_panel = 1,
		attr = [{hp_max, 800}, {atk, 150}]};
get(91303) ->
    #honor_data{base_id = 91303,
		name = lang:get(<<"强强联合"/utf8>>), group = 1093,
		loss = [{51203, 1}], overlap = 0, expire_type = 1,
		expire_time = 10080, is_panel = 1,
		attr = [{hp_max, 500}, {atk, 100}]};
get(91401) ->
    #honor_data{base_id = 91401,
		name = lang:get(<<"巅峰战神"/utf8>>), group = 1201,
		loss = [{51301, 1}], overlap = 0, expire_type = 1,
		expire_time = 20160, is_panel = 1,
		attr = [{hp_max_per, 20}, {atk_per, 20}]};
get(91402) ->
    #honor_data{base_id = 91402,
		name = lang:get(<<"荣耀军团"/utf8>>), group = 1202,
		loss = [{51302, 1}], overlap = 0, expire_type = 1,
		expire_time = 20160, is_panel = 1,
		attr = [{hp_max_per, 10}, {atk_per, 10}]};
get(91403) ->
    #honor_data{base_id = 91403,
		name = lang:get(<<"强强联合"/utf8>>), group = 1203,
		loss = [{51303, 1}], overlap = 0, expire_type = 1,
		expire_time = 20160, is_panel = 1,
		attr = [{hp_max, 500}, {atk, 100}]};
get(91501) ->
    #honor_data{base_id = 91501,
		name = lang:get(<<"传奇公会"/utf8>>), group = 1301,
		loss = [{51401, 1}], overlap = 0, expire_type = 1,
		expire_time = 37440, is_panel = 1,
		attr = [{hp_max, 1200}, {atk, 250}]};
get(91502) ->
    #honor_data{base_id = 91502,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1302,
		loss = [{51402, 1}], overlap = 0, expire_type = 1,
		expire_time = 37440, is_panel = 1,
		attr = [{hp_max, 800}, {atk, 150}]};
get(91503) ->
    #honor_data{base_id = 91503,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1303,
		loss = [{51403, 1}], overlap = 0, expire_type = 1,
		expire_time = 37440, is_panel = 1,
		attr = [{hp_max, 500}, {atk, 100}]};
get(99040) ->
    #honor_data{base_id = 99040,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1195,
		loss = [{51300, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 250}, {hp_max_per, 150}, {atk_per, 150},
		     {crit_rate, 150}, {dodge_magic, 150}]};
get(99951) ->
    #honor_data{base_id = 99951,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1077,
		loss = [{51301, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{atk_per, 150}, {hp_max_per, 150}, {dam_s, 150},
		     {dodge_magic, 150}, {hit_rate, 250}]};
get(99952) ->
    #honor_data{base_id = 99952,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1078,
		loss = [{51302, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 250}, {hp_max_per, 150}, {atk_per, 150},
		     {crit_rate, 150}, {dodge_magic, 150}]};
get(99953) ->
    #honor_data{base_id = 99953,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1094,
		loss = [{51303, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 50}, {hp_max_per, 30}, {atk_per, 30},
		     {crit_rate, 30}, {dodge_magic, 30}, {dam_p, 30},
		     {dam_s, 30}, {res_s, 30}, {res_p, 30},
		     {crit_ratio, 30}]};
get(99954) ->
    #honor_data{base_id = 99954,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1095,
		loss = [{51304, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 50}, {atk_per, 50},
		     {crit_rate, 50}, {dodge_magic, 50}, {dam_p, 50},
		     {dam_s, 50}, {res_s, 50}, {res_p, 50},
		     {crit_ratio, 50}]};
get(99955) ->
    #honor_data{base_id = 99955,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1096,
		loss = [{51305, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 50}, {atk_per, 50},
		     {crit_rate, 50}, {dodge_magic, 50}, {dam_p, 50},
		     {dam_s, 50}, {res_s, 50}, {res_p, 50},
		     {crit_ratio, 50}]};
get(99956) ->
    #honor_data{base_id = 99956,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1097,
		loss = [{51306, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 50}, {atk_per, 50},
		     {crit_rate, 50}, {dodge_magic, 50}, {dam_p, 50},
		     {dam_s, 50}, {res_s, 50}, {res_p, 50},
		     {crit_ratio, 50}]};
get(99957) ->
    #honor_data{base_id = 99957,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1098,
		loss = [{51307, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 300}, {hp_max_per, 300}, {atk_per, 300},
		     {crit_rate, 300}, {dodge_magic, 300}, {dam_p, 300},
		     {dam_s, 300}, {res_s, 300}, {res_p, 300},
		     {crit_ratio, 300}]};
get(99958) ->
    #honor_data{base_id = 99958,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1099,
		loss = [{51308, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 50}, {atk_per, 50},
		     {crit_rate, 50}, {dodge_magic, 50}, {dam_p, 50},
		     {dam_s, 50}, {res_s, 50}, {res_p, 50},
		     {crit_ratio, 50}]};
get(99959) ->
    #honor_data{base_id = 99959,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1100,
		loss = [{51309, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 50}, {atk_per, 50},
		     {crit_rate, 50}, {dodge_magic, 50}, {dam_p, 50},
		     {dam_s, 50}, {res_s, 50}, {res_p, 50},
		     {crit_ratio, 50}]};
get(99960) ->
    #honor_data{base_id = 99960,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1101,
		loss = [{51310, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 50}, {atk_per, 50},
		     {crit_rate, 50}, {dodge_magic, 50}, {dam_p, 50},
		     {dam_s, 50}, {res_s, 50}, {res_p, 50},
		     {crit_ratio, 50}]};
get(99961) ->
    #honor_data{base_id = 99961,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1102,
		loss = [{51311, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 50}, {atk_per, 50},
		     {crit_rate, 50}, {dodge_magic, 50}, {dam_p, 50},
		     {dam_s, 50}, {res_s, 50}, {res_p, 50},
		     {crit_ratio, 50}]};
get(99962) ->
    #honor_data{base_id = 99962,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1103,
		loss = [{51312, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 50}, {atk_per, 50},
		     {crit_rate, 50}, {dodge_magic, 50}, {dam_p, 50},
		     {dam_s, 50}, {res_s, 50}, {res_p, 50},
		     {crit_ratio, 50}]};
get(99963) ->
    #honor_data{base_id = 99963,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1104,
		loss = [{51313, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 50}, {atk_per, 50},
		     {crit_rate, 50}, {dodge_magic, 50}, {dam_p, 50},
		     {dam_s, 50}, {res_s, 50}, {res_p, 50},
		     {crit_ratio, 50}]};
get(40923) ->
    #honor_data{base_id = 40923,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 4092,
		loss = [{40923, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 10}, {hp_max_per, 10}, {atk_per, 10},
		     {crit_rate, 10}, {dodge_magic, 10}, {dam_p, 10},
		     {dam_s, 10}, {res_s, 10}, {res_p, 10},
		     {crit_ratio, 10}]};
get(50524) ->
    #honor_data{base_id = 50524,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 5524,
		loss = [{50524, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 30}, {hp_max_per, 30}, {atk_per, 30},
		     {crit_rate, 30}, {dodge_magic, 30}, {dam_p, 30},
		     {dam_s, 30}, {res_s, 30}, {res_p, 30},
		     {crit_ratio, 30}]};
get(91969) ->
    #honor_data{base_id = 91969,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1249,
		loss = [{51850, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 30}, {atk_per, 30},
		     {crit_rate, 30}, {dodge_magic, 30}, {dam_p, 30},
		     {dam_s, 30}, {res_s, 30}, {res_p, 30},
		     {crit_ratio, 30}]};
get(91967) ->
    #honor_data{base_id = 91967,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1251,
		loss = [{51848, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 20}, {atk_per, 20},
		     {crit_rate, 20}, {dodge_magic, 20}, {dam_p, 20},
		     {dam_s, 20}, {res_s, 20}, {res_p, 20},
		     {crit_ratio, 20}]};
get(91965) ->
    #honor_data{base_id = 91965,
		name = lang:get(<<"荣耀之师"/utf8>>), group = 1253,
		loss = [{51846, 1}], overlap = 1, expire_type = 0,
		expire_time = 0, is_panel = 1,
		attr =
		    [{hit_rate, 100}, {hp_max_per, 10}, {atk_per, 10},
		     {crit_rate, 10}, {dodge_magic, 10}, {dam_p, 10},
		     {dam_s, 10}, {res_s, 10}, {res_p, 10},
		     {crit_ratio, 10}]};
get(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhonor_data913, _,
       {__Levelhonor_data913, __Traceshonor_data913}}
	  when __Levelhonor_data913 band 8 /= 0 orelse
		 __Traceshonor_data913 /= [] ->
	  lager:do_log(error,
		       [{module, honor_data}, {function, get}, {line, 913},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_data_not_exist===>~w", [_Info]),
		       none, 4096, 8, __Levelhonor_data913,
		       __Traceshonor_data913, lager_event, __Pidhonor_data913);
      _ -> ok
    end,
    undefined.

const(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhonor_data916, _,
       {__Levelhonor_data916, __Traceshonor_data916}}
	  when __Levelhonor_data916 band 8 /= 0 orelse
		 __Traceshonor_data916 /= [] ->
	  lager:do_log(error,
		       [{module, honor_data}, {function, const}, {line, 916},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("const_data_not_exist===>~w", [_Info]),
		       none, 4096, 8, __Levelhonor_data916,
		       __Traceshonor_data916, lager_event, __Pidhonor_data916);
      _ -> ok
    end,
    undefined.


