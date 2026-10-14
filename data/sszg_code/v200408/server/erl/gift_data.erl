-file("data/gift_data.erl", 1).

-file("data/gift_data.erl", 1).

-file("src/mod/data/gift_data.erl", 1).

-module(gift_data).

-lager_records([{gift_chose_data,
		 [id, name, bid, num, bind, sex, career, min_lev,
		  max_lev, auto_open, sort_id]},
		{gift_rand_data,
		 [id, name, bid, num, bind, sex, career, rand, min_lev,
		  max_lev, can_out, can_out2, must_out, max_out,
		  rand_list]},
		{gift_data,
		 [id, name, loss, items, notice_items, max_open,
		  day_open, rand_num, rand_type, priority_rand_gifts,
		  stat_num]}]).

-export([get/1, rand_list/1, chose_list/1,
	 sort_id_list/1, get_week_reward/1,
	 get_week_mail_reward/1, get_week_mail_day/1]).

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

-file("src/mod/data/gift_data.erl", 16).

-file("inc/gift.hrl", 1).

-record(gift_data,
	{id = 0, name = <<>>, loss = [], items = [],
	 notice_items = [], max_open = 0, day_open = 0,
	 rand_num = 0, rand_type = 0, priority_rand_gifts = [],
	 stat_num = 0}).

-record(gift_rand_data,
	{id = 0, name = <<>>, bid = 0, num = 1, bind = 1,
	 sex = 2, career = 0, rand = 0, min_lev = 0, max_lev = 0,
	 can_out = 0, can_out2 = 0, must_out = 0, max_out = 0,
	 rand_list = []}).

-record(gift_chose_data,
	{id = 0, name = <<>>, bid = 0, num = 1, bind = 1,
	 sex = 2, career = 0, min_lev = 0, max_lev = 0,
	 auto_open = 0, sort_id = 1}).

-file("src/mod/data/gift_data.erl", 17).

get(99999105) ->
    #gift_data{id = 99999105,
	       name = lang:get(<<"RươngTrangbị ★VIPEVENT★"/utf8>>)};
get(99999100) ->
    #gift_data{id = 99999100,
	       name = lang:get(<<"RươngTrangbị100sao"/utf8>>)};
get(9999995) ->
    #gift_data{id = 9999995,
	       name = lang:get(<<"RươngTrangbị95sao"/utf8>>)};
get(9999990) ->
    #gift_data{id = 9999990,
	       name = lang:get(<<"RươngTrangbị90sao"/utf8>>)};
get(9999985) ->
    #gift_data{id = 9999985,
	       name = lang:get(<<"RươngTrangbị85sao"/utf8>>)};
get(9999980) ->
    #gift_data{id = 9999980,
	       name = lang:get(<<"RươngTrangbị80sao"/utf8>>)};
get(9999975) ->
    #gift_data{id = 9999975,
	       name = lang:get(<<"RươngTrangbị75sao"/utf8>>)};
get(9999970) ->
    #gift_data{id = 9999970,
	       name = lang:get(<<"RươngTrangbị70sao"/utf8>>)};
get(9999965) ->
    #gift_data{id = 9999965,
	       name = lang:get(<<"RươngTrangbị65sao"/utf8>>)};
get(9999960) ->
    #gift_data{id = 9999960,
	       name = lang:get(<<"RươngTrangbị60sao"/utf8>>)};
get(9999955) ->
    #gift_data{id = 9999955,
	       name = lang:get(<<"RươngTrangbị55sao"/utf8>>)};
get(9999950) ->
    #gift_data{id = 9999950,
	       name = lang:get(<<"RươngTrangbị50sao"/utf8>>)};
get(9999945) ->
    #gift_data{id = 9999945,
	       name = lang:get(<<"RươngTrangbị45sao"/utf8>>)};
get(9999940) ->
    #gift_data{id = 9999940,
	       name = lang:get(<<"RươngTrangbị40sao"/utf8>>)};
get(9999935) ->
    #gift_data{id = 9999935,
	       name = lang:get(<<"RươngTrangbị35sao"/utf8>>)};
get(9999930) ->
    #gift_data{id = 9999930,
	       name = lang:get(<<"RươngTrangbị30sao"/utf8>>)};
get(9999925) ->
    #gift_data{id = 9999925,
	       name = lang:get(<<"RươngTrangbị25sao"/utf8>>)};
get(8888855) ->
    #gift_data{id = 8888855,
	       name = lang:get(<<"RươngTrangSức★VIPEVENT★"/utf8>>)};
get(8888850) ->
    #gift_data{id = 8888850,
	       name = lang:get(<<"RươngTrangSức50★"/utf8>>)};
get(8888845) ->
    #gift_data{id = 8888845,
	       name = lang:get(<<"RươngTrangSức45★"/utf8>>)};
get(8888840) ->
    #gift_data{id = 8888840,
	       name = lang:get(<<"RươngTrangSức40★"/utf8>>)};
get(8888835) ->
    #gift_data{id = 8888835,
	       name = lang:get(<<"RươngTrangSức35★"/utf8>>)};
get(8888830) ->
    #gift_data{id = 8888830,
	       name = lang:get(<<"RươngTrangSức30★"/utf8>>)};
get(8888825) ->
    #gift_data{id = 8888825,
	       name = lang:get(<<"RươngTrangSức25★"/utf8>>)};
get(10995) ->
    #gift_data{id = 10995,
	       name = lang:get(<<"紫色珍宝礼包"/utf8>>), rand_num = 1};
get(10996) ->
    #gift_data{id = 10996,
	       name = lang:get(<<"橙色珍宝礼包"/utf8>>), rand_num = 1};
get(10200) ->
    #gift_data{id = 10200, name = lang:get(<<"竞技宝箱"/utf8>>),
	       items = [{8, 300}]};
get(10201) ->
    #gift_data{id = 10201, name = lang:get(<<"战神宝箱"/utf8>>),
	       items = [{8, 600}]};
get(908) ->
    #gift_data{id = 908, name = lang:get(<<"普通礼包"/utf8>>),
	       items =
		   [{900, 1}, {901, 1}, {902, 1}, {903, 1}, {904, 1},
		    {10102, 100}],
	       rand_num = 1};
get(10204) ->
    #gift_data{id = 10204, name = lang:get(<<"高级礼包"/utf8>>),
	       rand_num = 1};
get(10301) ->
    #gift_data{id = 10301, name = lang:get(<<"冠军之心"/utf8>>),
	       notice_items = [{29905, 50}, 10453], rand_num = 1};
get(10407) ->
    #gift_data{id = 10407,
	       name = lang:get(<<"限定召唤卷"/utf8>>),
	       items = [{10408, 1}]};
get(10499) ->
    #gift_data{id = 10499,
	       name = lang:get(<<"随机技能书"/utf8>>), rand_num = 1};
get(16201) ->
    #gift_data{id = 16201,
	       name = lang:get(<<"随机觉醒符石"/utf8>>), rand_num = 1};
get(16202) ->
    #gift_data{id = 16202,
	       name = lang:get(<<"自选觉醒符石礼包"/utf8>>)};
get(30000) ->
    #gift_data{id = 30000,
	       name = lang:get(<<"超值经验礼包"/utf8>>),
	       items = [{10007, 100}, {10008, 50}, {10009, 8}]};
get(30001) ->
    #gift_data{id = 30001,
	       name = lang:get(<<"超值精炼礼包"/utf8>>),
	       items = [{10102, 1000}]};
get(30002) ->
    #gift_data{id = 30002,
	       name = lang:get(<<"随机技能书礼包"/utf8>>),
	       notice_items =
		   [10500, 10501, 10504, 10505, 10526, 10527, 10531],
	       rand_num = 1};
get(30003) ->
    #gift_data{id = 30003,
	       name = lang:get(<<"星命提升礼包"/utf8>>),
	       items = [{10301, 5000}], rand_num = 1};
get(30004) ->
    #gift_data{id = 30004,
	       name = lang:get(<<"神器超值礼包"/utf8>>),
	       items = [{10430, 1}], notice_items = [10420, 10421],
	       rand_num = 1};
get(30005) ->
    #gift_data{id = 30005,
	       name = lang:get(<<"随机阵法书礼包"/utf8>>), rand_num = 1};
get(30006) ->
    #gift_data{id = 30006,
	       name = lang:get(<<"圣器精华礼包"/utf8>>),
	       items = [{72001, 30}]};
get(30007) ->
    #gift_data{id = 30007,
	       name = lang:get(<<"橙装碎片宝盒"/utf8>>), items = [{13, 20}]};
get(30008) ->
    #gift_data{id = 30008,
	       name = lang:get(<<"精炼石袋子"/utf8>>),
	       items = [{10102, 100}]};
get(30009) ->
    #gift_data{id = 30009, name = lang:get(<<"精炼宝盒"/utf8>>),
	       items = [{10102, 500}]};
get(30011) ->
    #gift_data{id = 30011,
	       name = lang:get(<<"白羊座红色命格"/utf8>>),
	       items =
		   [{60040, 1}, {60041, 1}, {60042, 1}, {60043, 1}]};
get(30012) ->
    #gift_data{id = 30012,
	       name = lang:get(<<"金牛座红色命格"/utf8>>),
	       items =
		   [{60140, 1}, {60141, 1}, {60142, 1}, {60143, 1}]};
get(30013) ->
    #gift_data{id = 30013,
	       name = lang:get(<<"双子座红色命格"/utf8>>),
	       items =
		   [{60240, 1}, {60241, 1}, {60242, 1}, {60243, 1}]};
get(30014) ->
    #gift_data{id = 30014,
	       name = lang:get(<<"巨蟹座红色命格"/utf8>>),
	       items =
		   [{60340, 1}, {60341, 1}, {60342, 1}, {60343, 1}]};
get(30016) ->
    #gift_data{id = 30016,
	       name = lang:get(<<"白羊座紫色命格"/utf8>>),
	       items =
		   [{60020, 1}, {60021, 1}, {60022, 1}, {60023, 1}]};
get(30017) ->
    #gift_data{id = 30017,
	       name = lang:get(<<"金牛座紫色命格"/utf8>>),
	       items =
		   [{60120, 1}, {60121, 1}, {60122, 1}, {60123, 1}]};
get(30018) ->
    #gift_data{id = 30018,
	       name = lang:get(<<"双子座紫色命格"/utf8>>),
	       items =
		   [{60220, 1}, {60221, 1}, {60222, 1}, {60223, 1}]};
get(30020) ->
    #gift_data{id = 30020,
	       name = lang:get(<<"白羊座红色命格"/utf8>>),
	       items =
		   [{60030, 1}, {60031, 1}, {60032, 1}, {60033, 1}]};
get(30021) ->
    #gift_data{id = 30021,
	       name = lang:get(<<"金牛座红色命格"/utf8>>),
	       items =
		   [{60130, 1}, {60131, 1}, {60132, 1}, {60133, 1}]};
get(30022) ->
    #gift_data{id = 30022,
	       name = lang:get(<<"双子座红色命格"/utf8>>),
	       items =
		   [{60230, 1}, {60231, 1}, {60232, 1}, {60233, 1}]};
get(30023) ->
    #gift_data{id = 30023,
	       name = lang:get(<<"巨蟹座红色命格"/utf8>>),
	       items =
		   [{60330, 1}, {60331, 1}, {60332, 1}, {60333, 1}]};
get(30024) ->
    #gift_data{id = 30024,
	       name = lang:get(<<"四星座紫色随机礼包"/utf8>>), rand_num = 1};
get(30025) ->
    #gift_data{id = 30025,
	       name = lang:get(<<"三星座紫色随机礼包"/utf8>>), rand_num = 1};
get(30026) ->
    #gift_data{id = 30026,
	       name = lang:get(<<"三星座紫色随机礼包"/utf8>>), rand_num = 1};
get(30027) ->
    #gift_data{id = 30027,
	       name = lang:get(<<"随机命格礼包"/utf8>>), rand_num = 1};
get(30028) ->
    #gift_data{id = 30028,
	       name = lang:get(<<"随机2阶橙装礼包"/utf8>>), rand_num = 1};
get(30029) ->
    #gift_data{id = 30029,
	       name = lang:get(<<"随机3阶橙装礼包"/utf8>>), rand_num = 1};
get(30030) ->
    #gift_data{id = 30030,
	       name = lang:get(<<"随机橙色命格礼包"/utf8>>), rand_num = 1};
get(30031) ->
    #gift_data{id = 30031,
	       name = lang:get(<<"随机红色命格礼包"/utf8>>), rand_num = 1};
get(30050) ->
    #gift_data{id = 30050,
	       name = lang:get(<<"英雄升星红钻包"/utf8>>),
	       items = [{4, 280}]};
get(30051) ->
    #gift_data{id = 30051,
	       name = lang:get(<<"绝版头像蓝钻包"/utf8>>),
	       items = [{3, 400}]};
get(30052) ->
    #gift_data{id = 30052,
	       name = lang:get(<<"极品橙武蓝钻包"/utf8>>),
	       items = [{3, 800}]};
get(30053) ->
    #gift_data{id = 30053,
	       name = lang:get(<<"英雄升星红钻包"/utf8>>),
	       items = [{4, 280}]};
get(30054) ->
    #gift_data{id = 30054,
	       name = lang:get(<<"英雄升星红钻包"/utf8>>),
	       items = [{4, 280}]};
get(30100) ->
    #gift_data{id = 30100,
	       name = lang:get(<<"英雄技能符石礼包"/utf8>>),
	       items = [{10030, 1}], rand_num = 1};
get(30110) ->
    #gift_data{id = 30110,
	       name = lang:get(<<"帮会技能晶石礼包"/utf8>>), rand_num = 1};
get(30150) ->
    #gift_data{id = 30150,
	       name = lang:get(<<"S级星灵礼包"/utf8>>), rand_num = 1};
get(30151) ->
    #gift_data{id = 30151,
	       name = lang:get(<<"SS级星灵礼包"/utf8>>), rand_num = 1};
get(30152) ->
    #gift_data{id = 30152,
	       name = lang:get(<<"A级星灵礼包"/utf8>>), rand_num = 1};
get(30153) ->
    #gift_data{id = 30153,
	       name = lang:get(<<"S级月曜礼包"/utf8>>), rand_num = 1};
get(30154) ->
    #gift_data{id = 30154,
	       name = lang:get(<<"SS级月曜礼包"/utf8>>), rand_num = 1};
get(30155) ->
    #gift_data{id = 30155,
	       name = lang:get(<<"S级神圣礼包"/utf8>>), rand_num = 1};
get(30156) ->
    #gift_data{id = 30156,
	       name = lang:get(<<"SS级神圣礼包"/utf8>>), rand_num = 1};
get(30200) ->
    #gift_data{id = 30200,
	       name = lang:get(<<"30级橙装四件套"/utf8>>),
	       items =
		   [{44103, 1}, {44203, 1}, {44303, 1}, {44403, 1}]};
get(30201) ->
    #gift_data{id = 30201,
	       name = lang:get(<<"20级橙装四件套"/utf8>>),
	       items =
		   [{44102, 1}, {44202, 1}, {44302, 1}, {44402, 1}]};
get(30202) ->
    #gift_data{id = 30202,
	       name = lang:get(<<"40级橙装四件套"/utf8>>),
	       items =
		   [{44104, 1}, {44204, 1}, {44304, 1}, {44404, 1}]};
get(30203) ->
    #gift_data{id = 30203,
	       name = lang:get(<<"50级橙装四件套"/utf8>>),
	       items =
		   [{44105, 1}, {44205, 1}, {44305, 1}, {44405, 1}]};
get(30204) ->
    #gift_data{id = 30204,
	       name = lang:get(<<"60级橙装四件套"/utf8>>),
	       items =
		   [{44106, 1}, {44206, 1}, {44306, 1}, {44406, 1}]};
get(30300) ->
    #gift_data{id = 30300, name = lang:get(<<"宝石礼包"/utf8>>),
	       items = [{70003, 5}]};
get(30301) ->
    #gift_data{id = 30301,
	       name = lang:get(<<"特惠金币礼包"/utf8>>),
	       items = [{1, 66666}, {10004, 1}], rand_type = 1,
	       rand_num = 5};
get(38099) ->
    #gift_data{id = 38099, name = <<"Hộp Quà Boss">>,
	       rand_num = 1};
get(30302) ->
    #gift_data{id = 30302, name = lang:get(<<"大袋金币"/utf8>>),
	       items = [{1, 3000}], rand_type = 1, rand_num = 5};
get(30303) ->
    #gift_data{id = 30303, name = lang:get(<<"小袋金币"/utf8>>),
	       items = [{1, 1000}]};
get(30304) ->
    #gift_data{id = 30304,
	       name = lang:get(<<"特大袋金币"/utf8>>), items = [{1, 9000}]};
get(30305) ->
    #gift_data{id = 30305, name = lang:get(<<"大袋银币"/utf8>>),
	       items = [{2, 300000}]};
get(30306) ->
    #gift_data{id = 30306,
	       name = lang:get(<<"特大袋银币"/utf8>>),
	       items = [{2, 900000}]};
get(30307) ->
    #gift_data{id = 30307,
	       name = lang:get(<<"圣器飞升宝盒"/utf8>>),
	       items = [{72001, 5}]};
get(30308) ->
    #gift_data{id = 30308, name = lang:get(<<"冒险笔记"/utf8>>),
	       items = [{7, 1000}]};
get(30309) ->
    #gift_data{id = 30309, name = lang:get(<<"冒险宝典"/utf8>>),
	       items = [{7, 3000}]};
get(30310) ->
    #gift_data{id = 30310,
	       name = lang:get(<<"星命精华袋"/utf8>>),
	       items = [{10301, 500}]};
get(30311) ->
    #gift_data{id = 30311,
	       name = lang:get(<<"星命典藏礼盒"/utf8>>),
	       items = [{10301, 2000}]};
get(30312) ->
    #gift_data{id = 30312, name = lang:get(<<"星灵石"/utf8>>),
	       items = [{18, 1000}]};
get(30350) ->
    #gift_data{id = 30350,
	       name = lang:get(<<"试炼勇者礼包"/utf8>>),
	       notice_items = [30400], rand_num = 1};
get(30351) ->
    #gift_data{id = 30351,
	       name = lang:get(<<"试炼王者礼包"/utf8>>),
	       notice_items =
		   [30400, 10310, 10401, 60020, 60021, 60022, 60023, 60120,
		    60121, 60122, 60123, 60220, 60221, 60222, 60223],
	       rand_num = 1};
get(30400) ->
    #gift_data{id = 30400, name = lang:get(<<"百万银币"/utf8>>),
	       items = [{2, 1000000}]};
get(30401) ->
    #gift_data{id = 30401,
	       name = lang:get(<<"阵法书自选礼包"/utf8>>), rand_num = 1};
get(31000) ->
    #gift_data{id = 31000,
	       name = lang:get(<<"星灵碎片礼包"/utf8>>), rand_num = 1};
get(31001) ->
    #gift_data{id = 31001,
	       name = lang:get(<<"SS星灵碎片礼包"/utf8>>), rand_num = 1};
get(31002) ->
    #gift_data{id = 31002,
	       name = lang:get(<<"月曜碎片礼包"/utf8>>), rand_num = 1};
get(31003) ->
    #gift_data{id = 31003,
	       name = lang:get(<<"SS月曜碎片礼包"/utf8>>), rand_num = 1};
get(31004) ->
    #gift_data{id = 31004,
	       name = lang:get(<<"神圣碎片礼包"/utf8>>), rand_num = 1};
get(31005) ->
    #gift_data{id = 31005,
	       name = lang:get(<<"SS神圣碎片礼包"/utf8>>), rand_num = 1};
get(32000) ->
    #gift_data{id = 32000,
	       name = lang:get(<<"初级宝石碎片礼包"/utf8>>),
	       items = [{70003, 1}], rand_num = 1};
get(32001) ->
    #gift_data{id = 32001,
	       name = lang:get(<<"高级宝石碎片礼包"/utf8>>),
	       items = [{70003, 9}], rand_num = 1};
get(32002) ->
    #gift_data{id = 32002,
	       name = lang:get(<<"中级宝石碎片礼包"/utf8>>),
	       items = [{70003, 3}], rand_num = 1};
get(32050) ->
    #gift_data{id = 32050,
	       name = lang:get(<<"秘宝碎片礼包"/utf8>>), rand_num = 1};
get(33000) ->
    #gift_data{id = 33000,
	       name = lang:get(<<"众神战场胜利礼包"/utf8>>),
	       notice_items = [10420, 10421, 10430, 10431],
	       rand_num = 1};
get(33001) ->
    #gift_data{id = 33001,
	       name = lang:get(<<"众神战场和平礼包"/utf8>>),
	       notice_items = [10420, 10421, 10430, 10431],
	       rand_num = 1};
get(33002) ->
    #gift_data{id = 33002,
	       name = lang:get(<<"众神战场希望礼包"/utf8>>),
	       notice_items = [10430, 10431], rand_num = 1};
get(34001) ->
    #gift_data{id = 34001,
	       name = lang:get(<<"4阶橙装礼盒"/utf8>>), rand_num = 1};
get(34002) ->
    #gift_data{id = 34002,
	       name = lang:get(<<"5阶橙装礼盒"/utf8>>), rand_num = 1};
get(34003) ->
    #gift_data{id = 34003,
	       name = lang:get(<<"6阶橙装礼盒"/utf8>>), rand_num = 1};
get(34004) ->
    #gift_data{id = 34004,
	       name = lang:get(<<"高级宝石碎片礼包"/utf8>>),
	       items = [{70003, 9}]};
get(34005) ->
    #gift_data{id = 34005,
	       name = lang:get(<<"上级宝石碎片礼包"/utf8>>),
	       items = [{70003, 27}]};
get(34006) ->
    #gift_data{id = 34006,
	       name = lang:get(<<"顶级宝石碎片礼包"/utf8>>),
	       items = [{70003, 81}]};
get(34007) ->
    #gift_data{id = 34007,
	       name = lang:get(<<"紫色圣器礼盒"/utf8>>), rand_num = 1};
get(34008) ->
    #gift_data{id = 34008,
	       name = lang:get(<<"橙色圣器礼盒"/utf8>>), rand_num = 1};
get(34009) ->
    #gift_data{id = 34009,
	       name = lang:get(<<"随机神将礼包"/utf8>>),
	       notice_items = [28001, 28002], rand_num = 1};
get(34010) ->
    #gift_data{id = 34010,
	       name = lang:get(<<"8阶橙装礼盒"/utf8>>), rand_num = 1};
get(34011) ->
    #gift_data{id = 34011,
	       name = lang:get(<<"初级突破礼包"/utf8>>), rand_num = 1};
get(34012) ->
    #gift_data{id = 34012,
	       name = lang:get(<<"中级突破礼包"/utf8>>), rand_num = 1};
get(34013) ->
    #gift_data{id = 34013,
	       name = lang:get(<<"7阶橙装礼盒"/utf8>>), rand_num = 1};
get(34014) ->
    #gift_data{id = 34014,
	       name = lang:get(<<"9阶橙装礼盒"/utf8>>), rand_num = 1};
get(35001) ->
    #gift_data{id = 35001,
	       name = lang:get(<<"神将碎片自选礼包"/utf8>>)};
get(35010) ->
    #gift_data{id = 35010,
	       name = lang:get(<<"圣魂之灵宝盒"/utf8>>), rand_num = 1};
get(35011) ->
    #gift_data{id = 35011,
	       name = lang:get(<<"圣魄之灵宝盒"/utf8>>), rand_num = 1};
get(35012) ->
    #gift_data{id = 35012,
	       name = lang:get(<<"圣意之灵宝盒"/utf8>>), rand_num = 1};
get(35013) ->
    #gift_data{id = 35013,
	       name = lang:get(<<"圣念之灵宝盒"/utf8>>), rand_num = 1};
get(35020) ->
    #gift_data{id = 35020,
	       name = lang:get(<<"圣魂之灵神盒"/utf8>>), rand_num = 1};
get(35021) ->
    #gift_data{id = 35021,
	       name = lang:get(<<"圣魄之灵神盒"/utf8>>), rand_num = 1};
get(35022) ->
    #gift_data{id = 35022,
	       name = lang:get(<<"圣意之灵神盒"/utf8>>), rand_num = 1};
get(35023) ->
    #gift_data{id = 35023,
	       name = lang:get(<<"圣念之灵神盒"/utf8>>), rand_num = 1};
get(35100) ->
    #gift_data{id = 35100,
	       name = lang:get(<<"神圣碎片礼包"/utf8>>), rand_num = 1};
get(35111) ->
    #gift_data{id = 35111,
	       name = lang:get(<<"中品宝石矿"/utf8>>),
	       items = [{70003, 10}]};
get(35112) ->
    #gift_data{id = 35112,
	       name = lang:get(<<"上品宝石矿"/utf8>>),
	       items = [{70003, 30}]};
get(35113) ->
    #gift_data{id = 35113,
	       name = lang:get(<<"极品宝石矿"/utf8>>),
	       items = [{70003, 50}]};
get(36001) ->
    #gift_data{id = 36001,
	       name = lang:get(<<"帮会战战绩宝箱"/utf8>>), rand_num = 1};
get(36002) ->
    #gift_data{id = 36002,
	       name = lang:get(<<"帮会战胜利宝箱"/utf8>>),
	       notice_items =
		   [71020, 71021, 71022, 71023, 71030, 71031, 71032,
		    71033],
	       rand_num = 1};
get(36003) ->
    #gift_data{id = 36003,
	       name = lang:get(<<"帮会战安慰宝箱"/utf8>>),
	       notice_items = [71020, 71021, 71022, 71023],
	       rand_num = 1};
get(37006) ->
    #gift_data{id = 37006, name = lang:get(<<"夺宝币"/utf8>>),
	       items = [{3, 10}]};
get(37008) ->
    #gift_data{id = 37008, name = lang:get(<<"松果币"/utf8>>),
	       items = [{3, 10}]};
get(37010) ->
    #gift_data{id = 37010, name = lang:get(<<"中国结"/utf8>>),
	       items = [{1, 20000}]};
get(37011) ->
    #gift_data{id = 37011, name = lang:get(<<"玫瑰之钥"/utf8>>),
	       items = [{1, 200}]};
get(10402) ->
    #gift_data{id = 10402,
	       name = lang:get(<<"五连召唤券"/utf8>>)};
get(99000) ->
    #gift_data{id = 99000, name = lang:get(<<"投资计划"/utf8>>),
	       items = [{3, 888}, {4, 4028}, {1, 270000}]};
get(38010) ->
    #gift_data{id = 38010,
	       name = lang:get(<<"先知水晶礼包"/utf8>>),
	       items = [{14001, 3}, {10001, 1000}, {1, 100000}]};
get(38020) ->
    #gift_data{id = 38020,
	       name = lang:get(<<"快速作战特权礼包"/utf8>>),
	       items = [{30053, 1}, {10403, 10}, {10001, 1000}]};
get(38030) ->
    #gift_data{id = 38030,
	       name = lang:get(<<"远航高级特权礼包"/utf8>>),
	       items = [{30054, 1}, {10403, 5}, {10001, 300}]};
get(38040) ->
    #gift_data{id = 38040,
	       name = lang:get(<<"远航豪华特权礼包"/utf8>>),
	       items = [{30055, 1}, {14001, 1}, {10403, 10}]};
get(38041) ->
    #gift_data{id = 38041,
	       name = lang:get(<<"幸运探宝礼包"/utf8>>), rand_num = 1};
get(38042) ->
    #gift_data{id = 38042,
	       name = lang:get(<<"高级探宝礼包"/utf8>>), rand_num = 1};
get(38101) ->
    #gift_data{id = 38101,
	       name = lang:get(<<"3星橙装礼包"/utf8>>), rand_num = 1};
get(38051) ->
    #gift_data{id = 38051,
	       name = lang:get(<<"随机红装礼包"/utf8>>), rand_num = 1};
get(38061) ->
    #gift_data{id = 38061,
	       name = lang:get(<<"随机2星红装礼包"/utf8>>), rand_num = 1};
get(38071) ->
    #gift_data{id = 38071,
	       name = lang:get(<<"随机3星红装礼包"/utf8>>), rand_num = 1};
get(38080) ->
    #gift_data{id = 38080,
	       name = lang:get(<<"随机橙装礼包"/utf8>>), rand_num = 1};
get(38081) ->
    #gift_data{id = 38081,
	       name = lang:get(<<"随机2星橙装礼包"/utf8>>), rand_num = 1};
get(38091) ->
    #gift_data{id = 38091,
	       name = lang:get(<<"随机3星橙装礼包"/utf8>>), rand_num = 1};
get(38092) ->
    #gift_data{id = 38092,
	       name = lang:get(<<"随机4星橙装礼包"/utf8>>), rand_num = 1};
get(38093) ->
    #gift_data{id = 38093,
	       name = lang:get(<<"珍稀橙装套"/utf8>>),
	       items =
		   [{40108, 1}, {40208, 1}, {40308, 1}, {40408, 1}]};
get(39000) ->
    #gift_data{id = 39000, name = lang:get(<<"幸运宝盒"/utf8>>),
	       rand_num = 1};
get(39001) ->
    #gift_data{id = 39001,
	       name = lang:get(<<"幸运召唤福袋"/utf8>>), rand_num = 1};
get(39002) ->
    #gift_data{id = 39002,
	       name = lang:get(<<"英雄碎片福袋"/utf8>>), rand_num = 1};
get(39003) ->
    #gift_data{id = 39003,
	       name = lang:get(<<"自然英雄碎片福袋"/utf8>>), rand_num = 1};
get(39004) ->
    #gift_data{id = 39004,
	       name = lang:get(<<"水系英雄碎片福袋"/utf8>>), rand_num = 1};
get(39005) ->
    #gift_data{id = 39005,
	       name = lang:get(<<"火系英雄碎片福袋"/utf8>>), rand_num = 1};
get(39006) ->
    #gift_data{id = 39006,
	       name = lang:get(<<"先知召唤福袋"/utf8>>), rand_num = 1};
get(39007) ->
    #gift_data{id = 39007,
	       name = lang:get(<<"寻宝达人福袋"/utf8>>), rand_num = 1};
get(39008) ->
    #gift_data{id = 39008,
	       name = lang:get(<<"豪华自选材料包"/utf8>>)};
get(39009) ->
    #gift_data{id = 39009,
	       name = lang:get(<<"尊享自选材料包"/utf8>>)};
get(39010) ->
    #gift_data{id = 39010,
	       name = lang:get(<<"圣物结晶随机礼包"/utf8>>), rand_num = 1};
get(39011) ->
    #gift_data{id = 39011,
	       name = lang:get(<<"限定召唤福袋"/utf8>>), rand_num = 1};
get(39012) ->
    #gift_data{id = 39012,
	       name = lang:get(<<"星辰钥匙福袋"/utf8>>), rand_num = 1};
get(39013) ->
    #gift_data{id = 39013,
	       name = lang:get(<<"春日钻石福袋"/utf8>>), rand_num = 1};
get(39014) ->
    #gift_data{id = 39014,
	       name = lang:get(<<"春日钻石礼盒"/utf8>>), rand_num = 1};
get(39015) ->
    #gift_data{id = 39015,
	       name = lang:get(<<"春日钻石补给箱"/utf8>>), rand_num = 1};
get(39016) ->
    #gift_data{id = 39016,
	       name = lang:get(<<"春日钻石宝藏"/utf8>>), rand_num = 1};
get(39017) ->
    #gift_data{id = 39017,
	       name = lang:get(<<"春日暖阳礼包"/utf8>>), rand_num = 1};
get(39018) ->
    #gift_data{id = 39018,
	       name = lang:get(<<"春日暖心福利"/utf8>>), rand_num = 1};
get(39019) ->
    #gift_data{id = 39019, name = lang:get(<<"幸运福蛋"/utf8>>),
	       rand_num = 1};
get(39020) ->
    #gift_data{id = 39020,
	       name = lang:get(<<"天使降临福袋"/utf8>>), rand_num = 1};
get(39021) ->
    #gift_data{id = 39021,
	       name = lang:get(<<"先知珍宝福袋"/utf8>>), rand_num = 1};
get(39022) ->
    #gift_data{id = 39022,
	       name = lang:get(<<"2星2阶套装礼盒"/utf8>>), rand_num = 1};
get(39023) ->
    #gift_data{id = 39023,
	       name = lang:get(<<"2星2阶狂怒套"/utf8>>),
	       items =
		   [{2020201, 1}, {2020202, 1}, {2020203, 1},
		    {2020204, 1}]};
get(39024) ->
    #gift_data{id = 39024,
	       name = lang:get(<<"2星2阶斗志套"/utf8>>),
	       items =
		   [{3020201, 1}, {3020202, 1}, {3020203, 1},
		    {3020204, 1}]};
get(39025) ->
    #gift_data{id = 39025,
	       name = lang:get(<<"2星2阶灵域套"/utf8>>),
	       items =
		   [{4020201, 1}, {4020202, 1}, {4020203, 1},
		    {4020204, 1}]};
get(39027) ->
    #gift_data{id = 39027,
	       name = lang:get(<<"精英自选礼"/utf8>>)};
get(39028) ->
    #gift_data{id = 39028,
	       name = lang:get(<<"清凉一夏礼包"/utf8>>), rand_num = 1};
get(39029) ->
    #gift_data{id = 39029,
	       name = lang:get(<<"盛夏之约礼包"/utf8>>), rand_num = 1};
get(39030) ->
    #gift_data{id = 39030, name = lang:get(<<"魔狼宝藏"/utf8>>),
	       rand_num = 1};
get(39031) ->
    #gift_data{id = 39031, name = lang:get(<<"金蛋好礼"/utf8>>),
	       rand_num = 1};
get(39032) ->
    #gift_data{id = 39032, name = lang:get(<<"巨镰之礼"/utf8>>),
	       rand_num = 1};
get(39033) ->
    #gift_data{id = 39033,
	       name = lang:get(<<"夏日皮肤礼包"/utf8>>),
	       items = [{23007, 1}]};
get(39034) ->
    #gift_data{id = 39034, name = lang:get(<<"粽夏之礼"/utf8>>),
	       rand_num = 1};
get(39035) ->
    #gift_data{id = 39035,
	       name = lang:get(<<"5星碎片礼盒"/utf8>>), rand_num = 1};
get(39036) ->
    #gift_data{id = 39036, name = lang:get(<<"松果宝盒"/utf8>>),
	       rand_num = 1};
get(39037) ->
    #gift_data{id = 39037,
	       name = lang:get(<<"幸运精英宝盒"/utf8>>), rand_num = 1};
get(39038) ->
    #gift_data{id = 39038, name = lang:get(<<"庆典礼盒"/utf8>>),
	       rand_num = 1};
get(39039) ->
    #gift_data{id = 39039,
	       name = lang:get(<<"强力英雄自选礼盒"/utf8>>)};
get(39040) ->
    #gift_data{id = 39040,
	       name = lang:get(<<"三系英雄自选礼盒"/utf8>>)};
get(59040) ->
    #gift_data{id = 59040,
	       name = lang:get(<<"三系英雄自选礼盒"/utf8>>)};
get(39041) ->
    #gift_data{id = 39041, name = lang:get(<<"天籁之音"/utf8>>),
	       rand_num = 1};
get(39042) ->
    #gift_data{id = 39042, name = lang:get(<<"七夕臻礼"/utf8>>),
	       items = [{200413, 1}, {200414, 1}]};
get(39043) ->
    #gift_data{id = 39043,
	       name = lang:get(<<"三昧真火礼包"/utf8>>), rand_num = 1};
get(39044) ->
    #gift_data{id = 39044, name = lang:get(<<"玉兔宝盒"/utf8>>),
	       rand_num = 1};
get(39045) ->
    #gift_data{id = 39045,
	       name = lang:get(<<"双蛋黄莲蓉月饼"/utf8>>), rand_num = 1};
get(39046) ->
    #gift_data{id = 39046, name = lang:get(<<"绝黯之礼"/utf8>>),
	       rand_num = 1};
get(39047) ->
    #gift_data{id = 39047,
	       name = lang:get(<<"随机符石礼包"/utf8>>), rand_num = 1};
get(39048) ->
    #gift_data{id = 39048, name = lang:get(<<"月神礼盒"/utf8>>),
	       rand_num = 1};
get(39049) ->
    #gift_data{id = 39049,
	       name = lang:get(<<"幸运钻石福袋"/utf8>>), rand_num = 1};
get(39050) ->
    #gift_data{id = 39050,
	       name = lang:get(<<"小鬼南瓜礼包"/utf8>>), rand_num = 1};
get(39051) ->
    #gift_data{id = 39051,
	       name = lang:get(<<"精灵扭蛋礼包"/utf8>>), rand_num = 1};
get(39052) ->
    #gift_data{id = 39052,
	       name = lang:get(<<"百万金币礼盒"/utf8>>),
	       items = [{1, 1000000}]};
get(39053) ->
    #gift_data{id = 39053,
	       name = lang:get(<<"精英召唤礼包"/utf8>>),
	       items = [{22, 1000000}]};
get(39054) ->
    #gift_data{id = 39054,
	       name = lang:get(<<"高级召唤礼包"/utf8>>), rand_num = 1};
get(39055) ->
    #gift_data{id = 39055, name = lang:get(<<"守护之礼"/utf8>>),
	       rand_num = 1};
get(39056) ->
    #gift_data{id = 39056,
	       name = lang:get(<<"橙色精灵自选礼盒"/utf8>>)};
get(39057) ->
    #gift_data{id = 39057, name = lang:get(<<"感恩宴礼"/utf8>>),
	       rand_num = 1};
get(39058) ->
    #gift_data{id = 39058,
	       name = lang:get(<<"极品五星神装自选礼包"/utf8>>)};
get(39059) ->
    #gift_data{id = 39059, name = lang:get(<<"回归福袋"/utf8>>),
	       rand_num = 1};
get(39060) ->
    #gift_data{id = 39060,
	       name = lang:get(<<"英雄祈愿自选礼盒"/utf8>>)};
get(39061) ->
    #gift_data{id = 39061,
	       name = lang:get(<<"时光漂流分享礼包"/utf8>>), rand_num = 1};
get(39063) ->
    #gift_data{id = 39063, name = lang:get(<<"幸运宝袋"/utf8>>),
	       rand_num = 1};
get(39062) ->
    #gift_data{id = 39062, name = lang:get(<<"欧皇礼盒"/utf8>>),
	       rand_num = 1};
get(39064) ->
    #gift_data{id = 39064, name = lang:get(<<"圣诞礼盒"/utf8>>),
	       rand_num = 1};
get(39065) ->
    #gift_data{id = 39065, name = lang:get(<<"岁初礼盒"/utf8>>),
	       items = [{3, 188}, {10403, 1}]};
get(39066) ->
    #gift_data{id = 39066, name = lang:get(<<"新年礼盒"/utf8>>),
	       rand_num = 1};
get(39068) ->
    #gift_data{id = 39068,
	       name = lang:get(<<"恭贺新禧VIP礼盒"/utf8>>),
	       items = [{10403, 2}, {10450, 1000}, {1, 1880000}]};
get(39069) ->
    #gift_data{id = 39069, name = lang:get(<<"新春利是"/utf8>>),
	       rand_num = 1};
get(39070) ->
    #gift_data{id = 39070, name = lang:get(<<"天使礼盒"/utf8>>),
	       rand_num = 1};
get(39071) ->
    #gift_data{id = 39071, name = lang:get(<<"新春宝箱"/utf8>>),
	       rand_num = 1};
get(39072) ->
    #gift_data{id = 39072, name = lang:get(<<"新春福袋"/utf8>>),
	       rand_num = 1};
get(39073) ->
    #gift_data{id = 39073,
	       name = lang:get(<<"幸运碎片礼盒"/utf8>>), rand_num = 1};
get(39074) ->
    #gift_data{id = 39074,
	       name = lang:get(<<"精英碎片礼盒"/utf8>>), rand_num = 1};
get(39075) ->
    #gift_data{id = 39075, name = lang:get(<<"春节礼包"/utf8>>),
	       items = [{10403, 2}, {10450, 1000}, {1, 1880000}]};
get(39076) ->
    #gift_data{id = 39076,
	       name = lang:get(<<"精英碎片宝盒"/utf8>>), rand_num = 1};
get(39077) ->
    #gift_data{id = 39077, name = lang:get(<<"甜蜜礼盒"/utf8>>),
	       rand_num = 1};
get(39079) ->
    #gift_data{id = 39079,
	       name = lang:get(<<"Túi Vật Liệu Tự Chọn"/utf8>>)};
get(39997) ->
    #gift_data{id = 39997,
	       name = lang:get(<<"Gói Vật Liệu Chakra"/utf8>>),
	       items = [{17009, 200}, {17011, 20}]};
get(39998) ->
    #gift_data{id = 39998,
	       name = lang:get(<<"Gói Vật Liệu Nhẫn Cụ"/utf8>>),
	       items = [{72001, 300}, {72002, 15}]};
get(39999) ->
    #gift_data{id = 39999,
	       name = lang:get(<<"Gói Vật phẩm Nhẫn Thuật"/utf8>>),
	       items = [{10450, 3000}, {39082, 1}]};
get(39080) ->
    #gift_data{id = 39080, name = lang:get(<<"珍稀宝盒"/utf8>>),
	       rand_num = 1};
get(39081) ->
    #gift_data{id = 39081,
	       name = lang:get(<<"材料自选礼包"/utf8>>)};
get(39083) ->
    #gift_data{id = 39083,
	       name = lang:get(<<"每日首充特惠礼包"/utf8>>), rand_num = 1};
get(39084) ->
    #gift_data{id = 39084,
	       name = lang:get(<<"每日首充幸运礼包"/utf8>>), rand_num = 1};
get(39085) ->
    #gift_data{id = 39085,
	       name = lang:get(<<"每日首充精英礼包"/utf8>>), rand_num = 1};
get(39086) ->
    #gift_data{id = 39086,
	       name = lang:get(<<"每日首充高级礼包"/utf8>>), rand_num = 1};
get(39087) ->
    #gift_data{id = 39087,
	       name = lang:get(<<"每日首充特级礼包"/utf8>>), rand_num = 1};
get(39088) ->
    #gift_data{id = 39088,
	       name = lang:get(<<"每日首充专属礼包"/utf8>>), rand_num = 1};
get(39089) ->
    #gift_data{id = 39089,
	       name = lang:get(<<"每日首充尊享礼包"/utf8>>), rand_num = 1};
get(39090) ->
    #gift_data{id = 39090,
	       name = lang:get(<<"精英召唤自选礼盒"/utf8>>)};
get(39091) ->
    #gift_data{id = 39091, name = lang:get(<<"森林宝盒"/utf8>>),
	       rand_num = 1};
get(39092) ->
    #gift_data{id = 39092,
	       name = lang:get(<<"白色情人节礼盒"/utf8>>), rand_num = 1};
get(39094) ->
    #gift_data{id = 39094,
	       name = lang:get(<<"精英自选宝箱"/utf8>>)};
get(39095) ->
    #gift_data{id = 39095,
	       name = lang:get(<<"红色5星装备自选箱"/utf8>>)};
get(39096) ->
    #gift_data{id = 39096,
	       name = lang:get(<<"红色4星装备自选箱"/utf8>>)};
get(39097) ->
    #gift_data{id = 39097,
	       name = lang:get(<<"红色3星装备自选箱"/utf8>>)};
get(39098) ->
    #gift_data{id = 39098,
	       name = lang:get(<<"红色2星装备自选箱"/utf8>>)};
get(39099) ->
    #gift_data{id = 39099,
	       name = lang:get(<<"红色1星装备自选箱"/utf8>>)};
get(39100) ->
    #gift_data{id = 39100,
	       name = lang:get(<<"橙色4星装备自选箱"/utf8>>)};
get(39101) ->
    #gift_data{id = 39101,
	       name = lang:get(<<"【极品】2星勇气自选神装"/utf8>>)};
get(39102) ->
    #gift_data{id = 39102,
	       name = lang:get(<<"【极品】2星狂怒自选神装"/utf8>>)};
get(39103) ->
    #gift_data{id = 39103,
	       name = lang:get(<<"【极品】2星斗志自选神装"/utf8>>)};
get(39104) ->
    #gift_data{id = 39104,
	       name = lang:get(<<"【极品】2星灵咏自选神装"/utf8>>)};
get(39105) ->
    #gift_data{id = 39105,
	       name = lang:get(<<"【极品】2星穿甲自选神装"/utf8>>)};
get(39106) ->
    #gift_data{id = 39106,
	       name = lang:get(<<"【极品】2星破法自选神装"/utf8>>)};
get(39107) ->
    #gift_data{id = 39107,
	       name = lang:get(<<"【极品】2星斗战自选神装"/utf8>>)};
get(39108) ->
    #gift_data{id = 39108,
	       name = lang:get(<<"【极品】2星镇灵自选神装"/utf8>>)};
get(39109) ->
    #gift_data{id = 39109,
	       name = lang:get(<<"【极品】2星魔甲自选神装"/utf8>>)};
get(39110) ->
    #gift_data{id = 39110,
	       name = lang:get(<<"【极品】2星神战自选神装"/utf8>>)};
get(39111) ->
    #gift_data{id = 39111,
	       name = lang:get(<<"【极品】2星龙威自选神装"/utf8>>)};
get(39112) ->
    #gift_data{id = 39112,
	       name = lang:get(<<"【极品】2星神愈自选神装"/utf8>>)};
get(39113) ->
    #gift_data{id = 39113,
	       name = lang:get(<<"【极品】2星极速自选神装"/utf8>>)};
get(39114) ->
    #gift_data{id = 39114,
	       name = lang:get(<<"【极品】2星玄护自选神装"/utf8>>)};
get(39115) ->
    #gift_data{id = 39115,
	       name = lang:get(<<"【极品】3星勇气自选神装"/utf8>>)};
get(39116) ->
    #gift_data{id = 39116,
	       name = lang:get(<<"【极品】3星狂怒自选神装"/utf8>>)};
get(39117) ->
    #gift_data{id = 39117,
	       name = lang:get(<<"【极品】3星斗志自选神装"/utf8>>)};
get(39118) ->
    #gift_data{id = 39118,
	       name = lang:get(<<"【极品】3星灵咏自选神装"/utf8>>)};
get(39119) ->
    #gift_data{id = 39119,
	       name = lang:get(<<"【极品】3星穿甲自选神装"/utf8>>)};
get(39120) ->
    #gift_data{id = 39120,
	       name = lang:get(<<"【极品】3星破法自选神装"/utf8>>)};
get(39121) ->
    #gift_data{id = 39121,
	       name = lang:get(<<"【极品】3星斗战自选神装"/utf8>>)};
get(39122) ->
    #gift_data{id = 39122,
	       name = lang:get(<<"【极品】3星镇灵自选神装"/utf8>>)};
get(39123) ->
    #gift_data{id = 39123,
	       name = lang:get(<<"【极品】3星魔甲自选神装"/utf8>>)};
get(39124) ->
    #gift_data{id = 39124,
	       name = lang:get(<<"【极品】3星神战自选神装"/utf8>>)};
get(39125) ->
    #gift_data{id = 39125,
	       name = lang:get(<<"【极品】3星龙威自选神装"/utf8>>)};
get(39126) ->
    #gift_data{id = 39126,
	       name = lang:get(<<"【极品】3星神愈自选神装"/utf8>>)};
get(39127) ->
    #gift_data{id = 39127,
	       name = lang:get(<<"【极品】3星极速自选神装"/utf8>>)};
get(39128) ->
    #gift_data{id = 39128,
	       name = lang:get(<<"【极品】3星玄护自选神装"/utf8>>)};
get(39129) ->
    #gift_data{id = 39129,
	       name = lang:get(<<"【极品】4星勇气自选神装"/utf8>>)};
get(39130) ->
    #gift_data{id = 39130,
	       name = lang:get(<<"【极品】4星狂怒自选神装"/utf8>>)};
get(39131) ->
    #gift_data{id = 39131,
	       name = lang:get(<<"【极品】4星斗志自选神装"/utf8>>)};
get(39132) ->
    #gift_data{id = 39132,
	       name = lang:get(<<"【极品】4星灵咏自选神装"/utf8>>)};
get(39133) ->
    #gift_data{id = 39133,
	       name = lang:get(<<"【极品】4星穿甲自选神装"/utf8>>)};
get(39134) ->
    #gift_data{id = 39134,
	       name = lang:get(<<"【极品】4星破法自选神装"/utf8>>)};
get(39135) ->
    #gift_data{id = 39135,
	       name = lang:get(<<"【极品】4星斗战自选神装"/utf8>>)};
get(39136) ->
    #gift_data{id = 39136,
	       name = lang:get(<<"【极品】4星镇灵自选神装"/utf8>>)};
get(39137) ->
    #gift_data{id = 39137,
	       name = lang:get(<<"【极品】4星魔甲自选神装"/utf8>>)};
get(39138) ->
    #gift_data{id = 39138,
	       name = lang:get(<<"【极品】4星神战自选神装"/utf8>>)};
get(39139) ->
    #gift_data{id = 39139,
	       name = lang:get(<<"【极品】4星龙威自选神装"/utf8>>)};
get(39140) ->
    #gift_data{id = 39140,
	       name = lang:get(<<"【极品】4星神愈自选神装"/utf8>>)};
get(39141) ->
    #gift_data{id = 39141,
	       name = lang:get(<<"【极品】4星极速自选神装"/utf8>>)};
get(39142) ->
    #gift_data{id = 39142,
	       name = lang:get(<<"【极品】4星玄护自选神装"/utf8>>)};
get(39143) ->
    #gift_data{id = 39143,
	       name = lang:get(<<"【极品】5星勇气自选神装"/utf8>>)};
get(39144) ->
    #gift_data{id = 39144,
	       name = lang:get(<<"【极品】5星狂怒自选神装"/utf8>>)};
get(39145) ->
    #gift_data{id = 39145,
	       name = lang:get(<<"【极品】5星斗志自选神装"/utf8>>)};
get(39146) ->
    #gift_data{id = 39146,
	       name = lang:get(<<"【极品】5星灵咏自选神装"/utf8>>)};
get(39147) ->
    #gift_data{id = 39147,
	       name = lang:get(<<"【极品】5星穿甲自选神装"/utf8>>)};
get(39148) ->
    #gift_data{id = 39148,
	       name = lang:get(<<"【极品】5星破法自选神装"/utf8>>)};
get(39149) ->
    #gift_data{id = 39149,
	       name = lang:get(<<"【极品】5星斗战自选神装"/utf8>>)};
get(39150) ->
    #gift_data{id = 39150,
	       name = lang:get(<<"【极品】5星镇灵自选神装"/utf8>>)};
get(39151) ->
    #gift_data{id = 39151,
	       name = lang:get(<<"【极品】5星魔甲自选神装"/utf8>>)};
get(39152) ->
    #gift_data{id = 39152,
	       name = lang:get(<<"【极品】5星神战自选神装"/utf8>>)};
get(39153) ->
    #gift_data{id = 39153,
	       name = lang:get(<<"【极品】5星龙威自选神装"/utf8>>)};
get(39154) ->
    #gift_data{id = 39154,
	       name = lang:get(<<"【极品】5星神愈自选神装"/utf8>>)};
get(39155) ->
    #gift_data{id = 39155,
	       name = lang:get(<<"【极品】5星极速自选神装"/utf8>>)};
get(39156) ->
    #gift_data{id = 39156,
	       name = lang:get(<<"【极品】5星玄护自选神装"/utf8>>)};
get(39157) ->
    #gift_data{id = 39157,
	       name = lang:get(<<"5系英雄碎片自选宝箱"/utf8>>)};
get(39158) ->
    #gift_data{id = 39158,
	       name = lang:get(<<"自选信物"/utf8>>)};
get(39159) ->
    #gift_data{id = 39159,
	       name = lang:get(<<"【极品】5星精选神装自选箱"/utf8>>)};
get(39160) ->
    #gift_data{id = 39160, name = lang:get(<<"冒险礼盒"/utf8>>),
	       rand_num = 1};
get(39161) ->
    #gift_data{id = 39161,
	       name = lang:get(<<"精英自选卡"/utf8>>)};
get(39162) ->
    #gift_data{id = 39162,
	       name = lang:get(<<"精英召唤自选卡"/utf8>>)};
get(39163) ->
    #gift_data{id = 39163, name = lang:get(<<"欧皇宝箱"/utf8>>),
	       rand_num = 1};
get(39164) ->
    #gift_data{id = 39164,
	       name = lang:get(<<"3系碎片自选宝箱"/utf8>>)};
get(39165) ->
    #gift_data{id = 39165,
	       name = lang:get(<<"限定精英自选卡"/utf8>>)};
get(39166) ->
    #gift_data{id = 39166, name = lang:get(<<"火灵礼盒"/utf8>>),
	       rand_num = 1};
get(39493) ->
    #gift_data{id = 39493,
	       name = lang:get(<<"1星极品套装自选礼盒"/utf8>>)};
get(39494) ->
    #gift_data{id = 39494,
	       name = lang:get(<<"1星极品狂怒套"/utf8>>),
	       items =
		   [{2010201, 1}, {2010202, 1}, {2010203, 1},
		    {2010204, 1}]};
get(39495) ->
    #gift_data{id = 39495,
	       name = lang:get(<<"1星极品斗志套"/utf8>>),
	       items =
		   [{3010201, 1}, {3010202, 1}, {3010203, 1},
		    {3010204, 1}]};
get(39496) ->
    #gift_data{id = 39496,
	       name = lang:get(<<"1星极品灵咏套"/utf8>>),
	       items =
		   [{4010201, 1}, {4010202, 1}, {4010203, 1},
		    {4010204, 1}]};
get(39497) ->
    #gift_data{id = 39497,
	       name = lang:get(<<"2星极品套装自选礼盒"/utf8>>)};
get(39498) ->
    #gift_data{id = 39498,
	       name = lang:get(<<"2星极品狂怒套"/utf8>>),
	       items =
		   [{2020201, 1}, {2020202, 1}, {2020203, 1},
		    {2020204, 1}]};
get(39499) ->
    #gift_data{id = 39499,
	       name = lang:get(<<"2星极品斗志套"/utf8>>),
	       items =
		   [{3020201, 1}, {3020202, 1}, {3020203, 1},
		    {3020204, 1}]};
get(39500) ->
    #gift_data{id = 39500,
	       name = lang:get(<<"2星极品灵咏套"/utf8>>),
	       items =
		   [{4020201, 1}, {4020202, 1}, {4020203, 1},
		    {4020204, 1}]};
get(39501) ->
    #gift_data{id = 39501,
	       name = lang:get(<<"3星极品套装自选礼盒"/utf8>>)};
get(39502) ->
    #gift_data{id = 39502,
	       name = lang:get(<<"3星极品狂怒套"/utf8>>),
	       items =
		   [{2030201, 1}, {2030202, 1}, {2030203, 1},
		    {2030204, 1}]};
get(39503) ->
    #gift_data{id = 39503,
	       name = lang:get(<<"3星极品斗志套"/utf8>>),
	       items =
		   [{3030201, 1}, {3030202, 1}, {3030203, 1},
		    {3030204, 1}]};
get(39504) ->
    #gift_data{id = 39504,
	       name = lang:get(<<"3星极品灵咏套"/utf8>>),
	       items =
		   [{4030201, 1}, {4030202, 1}, {4030203, 1},
		    {4030204, 1}]};
get(39505) ->
    #gift_data{id = 39505,
	       name = lang:get(<<"4星极品套装自选礼盒"/utf8>>)};
get(39506) ->
    #gift_data{id = 39506,
	       name = lang:get(<<"4星极品狂怒套"/utf8>>),
	       items =
		   [{2040201, 1}, {2040202, 1}, {2040203, 1},
		    {2040204, 1}]};
get(39507) ->
    #gift_data{id = 39507,
	       name = lang:get(<<"4星极品斗志套"/utf8>>),
	       items =
		   [{3040201, 1}, {3040202, 1}, {3040203, 1},
		    {3040204, 1}]};
get(39508) ->
    #gift_data{id = 39508,
	       name = lang:get(<<"4星极品灵咏套"/utf8>>),
	       items =
		   [{4040201, 1}, {4040202, 1}, {4040203, 1},
		    {4040204, 1}]};
get(39509) ->
    #gift_data{id = 39509,
	       name = lang:get(<<"5星极品套装自选礼盒"/utf8>>)};
get(39510) ->
    #gift_data{id = 39510,
	       name = lang:get(<<"5星极品狂怒套"/utf8>>),
	       items =
		   [{2050201, 1}, {2050202, 1}, {2050203, 1},
		    {2050204, 1}]};
get(39511) ->
    #gift_data{id = 39511,
	       name = lang:get(<<"5星极品斗志套"/utf8>>),
	       items =
		   [{3050201, 1}, {3050202, 1}, {3050203, 1},
		    {3050204, 1}]};
get(39512) ->
    #gift_data{id = 39512,
	       name = lang:get(<<"5星极品灵咏套"/utf8>>),
	       items =
		   [{4050201, 1}, {4050202, 1}, {4050203, 1},
		    {4050204, 1}]};
get(39513) ->
    #gift_data{id = 39513,
	       name = lang:get(<<"6星极品套装自选礼盒"/utf8>>)};
get(39514) ->
    #gift_data{id = 39514,
	       name = lang:get(<<"6星极品狂怒套"/utf8>>),
	       items =
		   [{2060201, 1}, {2060202, 1}, {2060203, 1},
		    {2060204, 1}]};
get(39515) ->
    #gift_data{id = 39515,
	       name = lang:get(<<"6星极品斗志套"/utf8>>),
	       items =
		   [{3060201, 1}, {3060202, 1}, {3060203, 1},
		    {3060204, 1}]};
get(39516) ->
    #gift_data{id = 39516,
	       name = lang:get(<<"6星极品灵咏套"/utf8>>),
	       items =
		   [{4060201, 1}, {4060202, 1}, {4060203, 1},
		    {4060204, 1}]};
get(39517) ->
    #gift_data{id = 39517,
	       name = lang:get(<<"3星新神装自选礼盒"/utf8>>)};
get(39518) ->
    #gift_data{id = 39518,
	       name = lang:get(<<"3星极品极速套"/utf8>>),
	       items =
		   [{13030201, 1}, {13030202, 1}, {13030203, 1},
		    {13030204, 1}]};
get(39519) ->
    #gift_data{id = 39519,
	       name = lang:get(<<"3星极品玄护套"/utf8>>),
	       items =
		   [{14030201, 1}, {14030202, 1}, {14030203, 1},
		    {14030204, 1}]};
get(60201) ->
    #gift_data{id = 60201,
	       name = lang:get(<<"三系辅助自选礼包"/utf8>>)};
get(60202) ->
    #gift_data{id = 60202,
	       name = lang:get(<<"三系输出自选礼包"/utf8>>)};
get(60203) ->
    #gift_data{id = 60203,
	       name = lang:get(<<"Gói tấn công tùy chọn Nước"/utf8>>)};
get(60204) ->
    #gift_data{id = 60204,
	       name =
		   lang:get(<<"Vật liệu 5 sao tùy chọn Gió/Nước/Lửa"/utf8>>)};
get(60205) ->
    #gift_data{id = 60205,
	       name =
		   lang:get(<<"Thẻ hỗ trợ tùy chọn Gió/Nước/ Lửa"/utf8>>)};
get(60206) ->
    #gift_data{id = 60206,
	       name = lang:get(<<"Thẻ Tấn Công Tự Chọn"/utf8>>)};
get(60207) ->
    #gift_data{id = 60207,
	       name = lang:get(<<"Thẻ Sinh Tồn Tự Chọn"/utf8>>)};
get(60208) ->
    #gift_data{id = 60208,
	       name =
		   lang:get(<<"Âm/Dương Thẻ Tấn Công Tự Chọn"/utf8>>)};
get(60209) ->
    #gift_data{id = 60209,
	       name =
		   lang:get(<<"Thẻ Lõi Ninja Âm/Dương Tự Chọn"/utf8>>)};
get(60210) ->
    #gift_data{id = 60210,
	       name = lang:get(<<"5 sao Hồn-Ninja Tự Chọn"/utf8>>)};
get(60211) ->
    #gift_data{id = 60211,
	       name = lang:get(<<"6 sao Hồn-Ninja Tự Chọn"/utf8>>)};
get(90515) ->
    #gift_data{id = 90515,
	       name = lang:get(<<"Túi chứa hồn 10 sao"/utf8>>)};
get(90514) ->
    #gift_data{id = 90514,
	       name = lang:get(<<"Túi chứa hồn 9 sao"/utf8>>)};
get(60301) ->
    #gift_data{id = 60301,
	       name = lang:get(<<"VIP专属礼包"/utf8>>),
	       items = [{3, 300}, {10403, 1}]};
get(60302) ->
    #gift_data{id = 60302,
	       name = lang:get(<<"VIP国庆专属礼包"/utf8>>),
	       items = [{3, 500}, {10403, 2}, {37001, 10}]};
get(60305) ->
    #gift_data{id = 60305, name = lang:get(<<"英魂礼包"/utf8>>),
	       rand_num = 1};
get(80240) ->
    #gift_data{id = 80240, name = lang:get(<<"合服宝箱"/utf8>>),
	       rand_num = 1};
get(81002) ->
    #gift_data{id = 81002, name = lang:get(<<"奶油"/utf8>>),
	       items = [{1, 10000}]};
get(81003) ->
    #gift_data{id = 81003, name = lang:get(<<"糖果"/utf8>>),
	       items = [{1, 50000}]};
get(81004) ->
    #gift_data{id = 81004, name = lang:get(<<"巧克力"/utf8>>),
	       items = [{1, 100000}]};
get(80266) ->
    #gift_data{id = 80266, name = lang:get(<<"魔法之书"/utf8>>),
	       items = [{3, 5}]};
get(80267) ->
    #gift_data{id = 80267,
	       name = lang:get(<<"竞技作战心得"/utf8>>), items = [{1, 200}]};
get(99001) ->
    #gift_data{id = 99001, name = lang:get(<<"新春红包"/utf8>>),
	       rand_num = 1};
get(80202) ->
    #gift_data{id = 80202, name = lang:get(<<"欢庆元宵"/utf8>>),
	       items = [{10002, 1}, {80201, 5}]};
get(80203) ->
    #gift_data{id = 80203, name = lang:get(<<"纳福元宵"/utf8>>),
	       items = [{37001, 1}, {80201, 5}]};
get(80204) ->
    #gift_data{id = 80204, name = lang:get(<<"丰登元宵"/utf8>>),
	       items = [{10450, 50}, {80201, 5}]};
get(80205) ->
    #gift_data{id = 80205, name = lang:get(<<"八宝元宵"/utf8>>),
	       items = [{80201, 5}], rand_num = 1};
get(80206) ->
    #gift_data{id = 80206,
	       name = lang:get(<<"发光的元宵"/utf8>>),
	       items = [{10403, 1}, {80201, 5}]};
get(80207) ->
    #gift_data{id = 80207,
	       name = lang:get(<<"神秘的元宵"/utf8>>),
	       items = [{14001, 1}, {80201, 5}]};
get(80208) ->
    #gift_data{id = 80208,
	       name = lang:get(<<"不可名状之物"/utf8>>),
	       items = [{1, 88888}, {80201, 5}]};
get(80209) ->
    #gift_data{id = 80209, name = lang:get(<<"特级糖粉"/utf8>>),
	       items = [{1, 666}]};
get(80210) ->
    #gift_data{id = 80210, name = lang:get(<<"黑芝麻"/utf8>>),
	       items = [{1, 666}]};
get(80211) ->
    #gift_data{id = 80211, name = lang:get(<<"糯米粉"/utf8>>),
	       items = [{1, 666}]};
get(80234) ->
    #gift_data{id = 80234,
	       name = lang:get(<<"最强冒险家认定书"/utf8>>), rand_num = 1};
get(17009) ->
    #gift_data{id = 17009,
	       name = lang:get(<<"Tinh Thể Nguyên Thủy"/utf8>>)};
get(17008) ->
    #gift_data{id = 17008, name = lang:get(<<"混沌结晶"/utf8>>),
	       rand_num = 1};
get(99010101) ->
    #gift_data{id = 99010101,
	       name = lang:get(<<"1星勇气耳环"/utf8>>), rand_num = 1};
get(99010201) ->
    #gift_data{id = 99010201,
	       name = lang:get(<<"2星勇气耳环"/utf8>>), rand_num = 1};
get(99010301) ->
    #gift_data{id = 99010301,
	       name = lang:get(<<"3星勇气耳环"/utf8>>), rand_num = 1};
get(99010401) ->
    #gift_data{id = 99010401,
	       name = lang:get(<<"4星勇气耳环"/utf8>>), rand_num = 1};
get(99010501) ->
    #gift_data{id = 99010501,
	       name = lang:get(<<"5星勇气耳环"/utf8>>), rand_num = 1};
get(99010601) ->
    #gift_data{id = 99010601,
	       name = lang:get(<<"6星勇气耳环"/utf8>>), rand_num = 1};
get(99010701) ->
    #gift_data{id = 99010701,
	       name = lang:get(<<"7星勇气耳环"/utf8>>), rand_num = 1};
get(99010801) ->
    #gift_data{id = 99010801,
	       name = lang:get(<<"8星勇气耳环"/utf8>>), rand_num = 1};
get(99010901) ->
    #gift_data{id = 99010901,
	       name = lang:get(<<"9星勇气耳环"/utf8>>), rand_num = 1};
get(99011001) ->
    #gift_data{id = 99011001,
	       name = lang:get(<<"10星勇气耳环"/utf8>>), rand_num = 1};
get(99010102) ->
    #gift_data{id = 99010102,
	       name = lang:get(<<"1星勇气项链"/utf8>>), rand_num = 1};
get(99010202) ->
    #gift_data{id = 99010202,
	       name = lang:get(<<"2星勇气项链"/utf8>>), rand_num = 1};
get(99010302) ->
    #gift_data{id = 99010302,
	       name = lang:get(<<"3星勇气项链"/utf8>>), rand_num = 1};
get(99010402) ->
    #gift_data{id = 99010402,
	       name = lang:get(<<"4星勇气项链"/utf8>>), rand_num = 1};
get(99010502) ->
    #gift_data{id = 99010502,
	       name = lang:get(<<"5星勇气项链"/utf8>>), rand_num = 1};
get(99010602) ->
    #gift_data{id = 99010602,
	       name = lang:get(<<"6星勇气项链"/utf8>>), rand_num = 1};
get(99010702) ->
    #gift_data{id = 99010702,
	       name = lang:get(<<"7星勇气项链"/utf8>>), rand_num = 1};
get(99010802) ->
    #gift_data{id = 99010802,
	       name = lang:get(<<"8星勇气项链"/utf8>>), rand_num = 1};
get(99010902) ->
    #gift_data{id = 99010902,
	       name = lang:get(<<"9星勇气项链"/utf8>>), rand_num = 1};
get(99011002) ->
    #gift_data{id = 99011002,
	       name = lang:get(<<"10星勇气项链"/utf8>>), rand_num = 1};
get(99010103) ->
    #gift_data{id = 99010103,
	       name = lang:get(<<"1星勇气戒指"/utf8>>), rand_num = 1};
get(99010203) ->
    #gift_data{id = 99010203,
	       name = lang:get(<<"2星勇气戒指"/utf8>>), rand_num = 1};
get(99010303) ->
    #gift_data{id = 99010303,
	       name = lang:get(<<"3星勇气戒指"/utf8>>), rand_num = 1};
get(99010403) ->
    #gift_data{id = 99010403,
	       name = lang:get(<<"4星勇气戒指"/utf8>>), rand_num = 1};
get(99010503) ->
    #gift_data{id = 99010503,
	       name = lang:get(<<"5星勇气戒指"/utf8>>), rand_num = 1};
get(99010603) ->
    #gift_data{id = 99010603,
	       name = lang:get(<<"6星勇气戒指"/utf8>>), rand_num = 1};
get(99010703) ->
    #gift_data{id = 99010703,
	       name = lang:get(<<"7星勇气戒指"/utf8>>), rand_num = 1};
get(99010803) ->
    #gift_data{id = 99010803,
	       name = lang:get(<<"8星勇气戒指"/utf8>>), rand_num = 1};
get(99010903) ->
    #gift_data{id = 99010903,
	       name = lang:get(<<"9星勇气戒指"/utf8>>), rand_num = 1};
get(99011003) ->
    #gift_data{id = 99011003,
	       name = lang:get(<<"10星勇气戒指"/utf8>>), rand_num = 1};
get(99010104) ->
    #gift_data{id = 99010104,
	       name = lang:get(<<"1星勇气手镯"/utf8>>), rand_num = 1};
get(99010204) ->
    #gift_data{id = 99010204,
	       name = lang:get(<<"2星勇气手镯"/utf8>>), rand_num = 1};
get(99010304) ->
    #gift_data{id = 99010304,
	       name = lang:get(<<"3星勇气手镯"/utf8>>), rand_num = 1};
get(99010404) ->
    #gift_data{id = 99010404,
	       name = lang:get(<<"4星勇气手镯"/utf8>>), rand_num = 1};
get(99010504) ->
    #gift_data{id = 99010504,
	       name = lang:get(<<"5星勇气手镯"/utf8>>), rand_num = 1};
get(99010604) ->
    #gift_data{id = 99010604,
	       name = lang:get(<<"6星勇气手镯"/utf8>>), rand_num = 1};
get(99010704) ->
    #gift_data{id = 99010704,
	       name = lang:get(<<"7星勇气手镯"/utf8>>), rand_num = 1};
get(99010804) ->
    #gift_data{id = 99010804,
	       name = lang:get(<<"8星勇气手镯"/utf8>>), rand_num = 1};
get(99010904) ->
    #gift_data{id = 99010904,
	       name = lang:get(<<"9星勇气手镯"/utf8>>), rand_num = 1};
get(99011004) ->
    #gift_data{id = 99011004,
	       name = lang:get(<<"10星勇气手镯"/utf8>>), rand_num = 1};
get(99020101) ->
    #gift_data{id = 99020101,
	       name = lang:get(<<"1星狂怒耳环"/utf8>>), rand_num = 1};
get(99020201) ->
    #gift_data{id = 99020201,
	       name = lang:get(<<"2星狂怒耳环"/utf8>>), rand_num = 1};
get(99020301) ->
    #gift_data{id = 99020301,
	       name = lang:get(<<"3星狂怒耳环"/utf8>>), rand_num = 1};
get(99020401) ->
    #gift_data{id = 99020401,
	       name = lang:get(<<"4星狂怒耳环"/utf8>>), rand_num = 1};
get(99020501) ->
    #gift_data{id = 99020501,
	       name = lang:get(<<"5星狂怒耳环"/utf8>>), rand_num = 1};
get(99020601) ->
    #gift_data{id = 99020601,
	       name = lang:get(<<"6星狂怒耳环"/utf8>>), rand_num = 1};
get(99020701) ->
    #gift_data{id = 99020701,
	       name = lang:get(<<"7星狂怒耳环"/utf8>>), rand_num = 1};
get(99020801) ->
    #gift_data{id = 99020801,
	       name = lang:get(<<"8星狂怒耳环"/utf8>>), rand_num = 1};
get(99020901) ->
    #gift_data{id = 99020901,
	       name = lang:get(<<"9星狂怒耳环"/utf8>>), rand_num = 1};
get(99021001) ->
    #gift_data{id = 99021001,
	       name = lang:get(<<"10星狂怒耳环"/utf8>>), rand_num = 1};
get(99020102) ->
    #gift_data{id = 99020102,
	       name = lang:get(<<"1星狂怒项链"/utf8>>), rand_num = 1};
get(99020202) ->
    #gift_data{id = 99020202,
	       name = lang:get(<<"2星狂怒项链"/utf8>>), rand_num = 1};
get(99020302) ->
    #gift_data{id = 99020302,
	       name = lang:get(<<"3星狂怒项链"/utf8>>), rand_num = 1};
get(99020402) ->
    #gift_data{id = 99020402,
	       name = lang:get(<<"4星狂怒项链"/utf8>>), rand_num = 1};
get(99020502) ->
    #gift_data{id = 99020502,
	       name = lang:get(<<"5星狂怒项链"/utf8>>), rand_num = 1};
get(99020602) ->
    #gift_data{id = 99020602,
	       name = lang:get(<<"6星狂怒项链"/utf8>>), rand_num = 1};
get(99020702) ->
    #gift_data{id = 99020702,
	       name = lang:get(<<"7星狂怒项链"/utf8>>), rand_num = 1};
get(99020802) ->
    #gift_data{id = 99020802,
	       name = lang:get(<<"8星狂怒项链"/utf8>>), rand_num = 1};
get(99020902) ->
    #gift_data{id = 99020902,
	       name = lang:get(<<"9星狂怒项链"/utf8>>), rand_num = 1};
get(99021002) ->
    #gift_data{id = 99021002,
	       name = lang:get(<<"10星狂怒项链"/utf8>>), rand_num = 1};
get(99020103) ->
    #gift_data{id = 99020103,
	       name = lang:get(<<"1星狂怒戒指"/utf8>>), rand_num = 1};
get(99020203) ->
    #gift_data{id = 99020203,
	       name = lang:get(<<"2星狂怒戒指"/utf8>>), rand_num = 1};
get(99020303) ->
    #gift_data{id = 99020303,
	       name = lang:get(<<"3星狂怒戒指"/utf8>>), rand_num = 1};
get(99020403) ->
    #gift_data{id = 99020403,
	       name = lang:get(<<"4星狂怒戒指"/utf8>>), rand_num = 1};
get(99020503) ->
    #gift_data{id = 99020503,
	       name = lang:get(<<"5星狂怒戒指"/utf8>>), rand_num = 1};
get(99020603) ->
    #gift_data{id = 99020603,
	       name = lang:get(<<"6星狂怒戒指"/utf8>>), rand_num = 1};
get(99020703) ->
    #gift_data{id = 99020703,
	       name = lang:get(<<"7星狂怒戒指"/utf8>>), rand_num = 1};
get(99020803) ->
    #gift_data{id = 99020803,
	       name = lang:get(<<"8星狂怒戒指"/utf8>>), rand_num = 1};
get(99020903) ->
    #gift_data{id = 99020903,
	       name = lang:get(<<"9星狂怒戒指"/utf8>>), rand_num = 1};
get(99021003) ->
    #gift_data{id = 99021003,
	       name = lang:get(<<"10星狂怒戒指"/utf8>>), rand_num = 1};
get(99020104) ->
    #gift_data{id = 99020104,
	       name = lang:get(<<"1星狂怒手镯"/utf8>>), rand_num = 1};
get(99020204) ->
    #gift_data{id = 99020204,
	       name = lang:get(<<"2星狂怒手镯"/utf8>>), rand_num = 1};
get(99020304) ->
    #gift_data{id = 99020304,
	       name = lang:get(<<"3星狂怒手镯"/utf8>>), rand_num = 1};
get(99020404) ->
    #gift_data{id = 99020404,
	       name = lang:get(<<"4星狂怒手镯"/utf8>>), rand_num = 1};
get(99020504) ->
    #gift_data{id = 99020504,
	       name = lang:get(<<"5星狂怒手镯"/utf8>>), rand_num = 1};
get(99020604) ->
    #gift_data{id = 99020604,
	       name = lang:get(<<"6星狂怒手镯"/utf8>>), rand_num = 1};
get(99020704) ->
    #gift_data{id = 99020704,
	       name = lang:get(<<"7星狂怒手镯"/utf8>>), rand_num = 1};
get(99020804) ->
    #gift_data{id = 99020804,
	       name = lang:get(<<"8星狂怒手镯"/utf8>>), rand_num = 1};
get(99020904) ->
    #gift_data{id = 99020904,
	       name = lang:get(<<"9星狂怒手镯"/utf8>>), rand_num = 1};
get(99021004) ->
    #gift_data{id = 99021004,
	       name = lang:get(<<"10星狂怒手镯"/utf8>>), rand_num = 1};
get(99030101) ->
    #gift_data{id = 99030101,
	       name = lang:get(<<"1星斗志耳环"/utf8>>), rand_num = 1};
get(99030201) ->
    #gift_data{id = 99030201,
	       name = lang:get(<<"2星斗志耳环"/utf8>>), rand_num = 1};
get(99030301) ->
    #gift_data{id = 99030301,
	       name = lang:get(<<"3星斗志耳环"/utf8>>), rand_num = 1};
get(99030401) ->
    #gift_data{id = 99030401,
	       name = lang:get(<<"4星斗志耳环"/utf8>>), rand_num = 1};
get(99030501) ->
    #gift_data{id = 99030501,
	       name = lang:get(<<"5星斗志耳环"/utf8>>), rand_num = 1};
get(99030601) ->
    #gift_data{id = 99030601,
	       name = lang:get(<<"6星斗志耳环"/utf8>>), rand_num = 1};
get(99030701) ->
    #gift_data{id = 99030701,
	       name = lang:get(<<"7星斗志耳环"/utf8>>), rand_num = 1};
get(99030801) ->
    #gift_data{id = 99030801,
	       name = lang:get(<<"8星斗志耳环"/utf8>>), rand_num = 1};
get(99030901) ->
    #gift_data{id = 99030901,
	       name = lang:get(<<"9星斗志耳环"/utf8>>), rand_num = 1};
get(99031001) ->
    #gift_data{id = 99031001,
	       name = lang:get(<<"10星斗志耳环"/utf8>>), rand_num = 1};
get(99030102) ->
    #gift_data{id = 99030102,
	       name = lang:get(<<"1星斗志项链"/utf8>>), rand_num = 1};
get(99030202) ->
    #gift_data{id = 99030202,
	       name = lang:get(<<"2星斗志项链"/utf8>>), rand_num = 1};
get(99030302) ->
    #gift_data{id = 99030302,
	       name = lang:get(<<"3星斗志项链"/utf8>>), rand_num = 1};
get(99030402) ->
    #gift_data{id = 99030402,
	       name = lang:get(<<"4星斗志项链"/utf8>>), rand_num = 1};
get(99030502) ->
    #gift_data{id = 99030502,
	       name = lang:get(<<"5星斗志项链"/utf8>>), rand_num = 1};
get(99030602) ->
    #gift_data{id = 99030602,
	       name = lang:get(<<"6星斗志项链"/utf8>>), rand_num = 1};
get(99030702) ->
    #gift_data{id = 99030702,
	       name = lang:get(<<"7星斗志项链"/utf8>>), rand_num = 1};
get(99030802) ->
    #gift_data{id = 99030802,
	       name = lang:get(<<"8星斗志项链"/utf8>>), rand_num = 1};
get(99030902) ->
    #gift_data{id = 99030902,
	       name = lang:get(<<"9星斗志项链"/utf8>>), rand_num = 1};
get(99031002) ->
    #gift_data{id = 99031002,
	       name = lang:get(<<"10星斗志项链"/utf8>>), rand_num = 1};
get(99030103) ->
    #gift_data{id = 99030103,
	       name = lang:get(<<"1星斗志戒指"/utf8>>), rand_num = 1};
get(99030203) ->
    #gift_data{id = 99030203,
	       name = lang:get(<<"2星斗志戒指"/utf8>>), rand_num = 1};
get(99030303) ->
    #gift_data{id = 99030303,
	       name = lang:get(<<"3星斗志戒指"/utf8>>), rand_num = 1};
get(99030403) ->
    #gift_data{id = 99030403,
	       name = lang:get(<<"4星斗志戒指"/utf8>>), rand_num = 1};
get(99030503) ->
    #gift_data{id = 99030503,
	       name = lang:get(<<"5星斗志戒指"/utf8>>), rand_num = 1};
get(99030603) ->
    #gift_data{id = 99030603,
	       name = lang:get(<<"6星斗志戒指"/utf8>>), rand_num = 1};
get(99030703) ->
    #gift_data{id = 99030703,
	       name = lang:get(<<"7星斗志戒指"/utf8>>), rand_num = 1};
get(99030803) ->
    #gift_data{id = 99030803,
	       name = lang:get(<<"8星斗志戒指"/utf8>>), rand_num = 1};
get(99030903) ->
    #gift_data{id = 99030903,
	       name = lang:get(<<"9星斗志戒指"/utf8>>), rand_num = 1};
get(99031003) ->
    #gift_data{id = 99031003,
	       name = lang:get(<<"10星斗志戒指"/utf8>>), rand_num = 1};
get(99030104) ->
    #gift_data{id = 99030104,
	       name = lang:get(<<"1星斗志手镯"/utf8>>), rand_num = 1};
get(99030204) ->
    #gift_data{id = 99030204,
	       name = lang:get(<<"2星斗志手镯"/utf8>>), rand_num = 1};
get(99030304) ->
    #gift_data{id = 99030304,
	       name = lang:get(<<"3星斗志手镯"/utf8>>), rand_num = 1};
get(99030404) ->
    #gift_data{id = 99030404,
	       name = lang:get(<<"4星斗志手镯"/utf8>>), rand_num = 1};
get(99030504) ->
    #gift_data{id = 99030504,
	       name = lang:get(<<"5星斗志手镯"/utf8>>), rand_num = 1};
get(99030604) ->
    #gift_data{id = 99030604,
	       name = lang:get(<<"6星斗志手镯"/utf8>>), rand_num = 1};
get(99030704) ->
    #gift_data{id = 99030704,
	       name = lang:get(<<"7星斗志手镯"/utf8>>), rand_num = 1};
get(99030804) ->
    #gift_data{id = 99030804,
	       name = lang:get(<<"8星斗志手镯"/utf8>>), rand_num = 1};
get(99030904) ->
    #gift_data{id = 99030904,
	       name = lang:get(<<"9星斗志手镯"/utf8>>), rand_num = 1};
get(99031004) ->
    #gift_data{id = 99031004,
	       name = lang:get(<<"10星斗志手镯"/utf8>>), rand_num = 1};
get(99040101) ->
    #gift_data{id = 99040101,
	       name = lang:get(<<"1星灵咏耳环"/utf8>>), rand_num = 1};
get(99040201) ->
    #gift_data{id = 99040201,
	       name = lang:get(<<"2星灵咏耳环"/utf8>>), rand_num = 1};
get(99040301) ->
    #gift_data{id = 99040301,
	       name = lang:get(<<"3星灵咏耳环"/utf8>>), rand_num = 1};
get(99040401) ->
    #gift_data{id = 99040401,
	       name = lang:get(<<"4星灵咏耳环"/utf8>>), rand_num = 1};
get(99040501) ->
    #gift_data{id = 99040501,
	       name = lang:get(<<"5星灵咏耳环"/utf8>>), rand_num = 1};
get(99040601) ->
    #gift_data{id = 99040601,
	       name = lang:get(<<"6星灵咏耳环"/utf8>>), rand_num = 1};
get(99040701) ->
    #gift_data{id = 99040701,
	       name = lang:get(<<"7星灵咏耳环"/utf8>>), rand_num = 1};
get(99040801) ->
    #gift_data{id = 99040801,
	       name = lang:get(<<"8星灵咏耳环"/utf8>>), rand_num = 1};
get(99040901) ->
    #gift_data{id = 99040901,
	       name = lang:get(<<"9星灵咏耳环"/utf8>>), rand_num = 1};
get(99041001) ->
    #gift_data{id = 99041001,
	       name = lang:get(<<"10星灵咏耳环"/utf8>>), rand_num = 1};
get(99040102) ->
    #gift_data{id = 99040102,
	       name = lang:get(<<"1星灵咏项链"/utf8>>), rand_num = 1};
get(99040202) ->
    #gift_data{id = 99040202,
	       name = lang:get(<<"2星灵咏项链"/utf8>>), rand_num = 1};
get(99040302) ->
    #gift_data{id = 99040302,
	       name = lang:get(<<"3星灵咏项链"/utf8>>), rand_num = 1};
get(99040402) ->
    #gift_data{id = 99040402,
	       name = lang:get(<<"4星灵咏项链"/utf8>>), rand_num = 1};
get(99040502) ->
    #gift_data{id = 99040502,
	       name = lang:get(<<"5星灵咏项链"/utf8>>), rand_num = 1};
get(99040602) ->
    #gift_data{id = 99040602,
	       name = lang:get(<<"6星灵咏项链"/utf8>>), rand_num = 1};
get(99040702) ->
    #gift_data{id = 99040702,
	       name = lang:get(<<"7星灵咏项链"/utf8>>), rand_num = 1};
get(99040802) ->
    #gift_data{id = 99040802,
	       name = lang:get(<<"8星灵咏项链"/utf8>>), rand_num = 1};
get(99040902) ->
    #gift_data{id = 99040902,
	       name = lang:get(<<"9星灵咏项链"/utf8>>), rand_num = 1};
get(99041002) ->
    #gift_data{id = 99041002,
	       name = lang:get(<<"10星灵咏项链"/utf8>>), rand_num = 1};
get(99040103) ->
    #gift_data{id = 99040103,
	       name = lang:get(<<"1星灵咏戒指"/utf8>>), rand_num = 1};
get(99040203) ->
    #gift_data{id = 99040203,
	       name = lang:get(<<"2星灵咏戒指"/utf8>>), rand_num = 1};
get(99040303) ->
    #gift_data{id = 99040303,
	       name = lang:get(<<"3星灵咏戒指"/utf8>>), rand_num = 1};
get(99040403) ->
    #gift_data{id = 99040403,
	       name = lang:get(<<"4星灵咏戒指"/utf8>>), rand_num = 1};
get(99040503) ->
    #gift_data{id = 99040503,
	       name = lang:get(<<"5星灵咏戒指"/utf8>>), rand_num = 1};
get(99040603) ->
    #gift_data{id = 99040603,
	       name = lang:get(<<"6星灵咏戒指"/utf8>>), rand_num = 1};
get(99040703) ->
    #gift_data{id = 99040703,
	       name = lang:get(<<"7星灵咏戒指"/utf8>>), rand_num = 1};
get(99040803) ->
    #gift_data{id = 99040803,
	       name = lang:get(<<"8星灵咏戒指"/utf8>>), rand_num = 1};
get(99040903) ->
    #gift_data{id = 99040903,
	       name = lang:get(<<"9星灵咏戒指"/utf8>>), rand_num = 1};
get(99041003) ->
    #gift_data{id = 99041003,
	       name = lang:get(<<"10星灵咏戒指"/utf8>>), rand_num = 1};
get(99040104) ->
    #gift_data{id = 99040104,
	       name = lang:get(<<"1星灵咏手镯"/utf8>>), rand_num = 1};
get(99040204) ->
    #gift_data{id = 99040204,
	       name = lang:get(<<"2星灵咏手镯"/utf8>>), rand_num = 1};
get(99040304) ->
    #gift_data{id = 99040304,
	       name = lang:get(<<"3星灵咏手镯"/utf8>>), rand_num = 1};
get(99040404) ->
    #gift_data{id = 99040404,
	       name = lang:get(<<"4星灵咏手镯"/utf8>>), rand_num = 1};
get(99040504) ->
    #gift_data{id = 99040504,
	       name = lang:get(<<"5星灵咏手镯"/utf8>>), rand_num = 1};
get(99040604) ->
    #gift_data{id = 99040604,
	       name = lang:get(<<"6星灵咏手镯"/utf8>>), rand_num = 1};
get(99040704) ->
    #gift_data{id = 99040704,
	       name = lang:get(<<"7星灵咏手镯"/utf8>>), rand_num = 1};
get(99040804) ->
    #gift_data{id = 99040804,
	       name = lang:get(<<"8星灵咏手镯"/utf8>>), rand_num = 1};
get(99040904) ->
    #gift_data{id = 99040904,
	       name = lang:get(<<"9星灵咏手镯"/utf8>>), rand_num = 1};
get(99041004) ->
    #gift_data{id = 99041004,
	       name = lang:get(<<"10星灵咏手镯"/utf8>>), rand_num = 1};
get(99050101) ->
    #gift_data{id = 99050101,
	       name = lang:get(<<"1星穿甲耳环"/utf8>>), rand_num = 1};
get(99050201) ->
    #gift_data{id = 99050201,
	       name = lang:get(<<"2星穿甲耳环"/utf8>>), rand_num = 1};
get(99050301) ->
    #gift_data{id = 99050301,
	       name = lang:get(<<"3星穿甲耳环"/utf8>>), rand_num = 1};
get(99050401) ->
    #gift_data{id = 99050401,
	       name = lang:get(<<"4星穿甲耳环"/utf8>>), rand_num = 1};
get(99050501) ->
    #gift_data{id = 99050501,
	       name = lang:get(<<"5星穿甲耳环"/utf8>>), rand_num = 1};
get(99050601) ->
    #gift_data{id = 99050601,
	       name = lang:get(<<"6星穿甲耳环"/utf8>>), rand_num = 1};
get(99050701) ->
    #gift_data{id = 99050701,
	       name = lang:get(<<"7星穿甲耳环"/utf8>>), rand_num = 1};
get(99050801) ->
    #gift_data{id = 99050801,
	       name = lang:get(<<"8星穿甲耳环"/utf8>>), rand_num = 1};
get(99050901) ->
    #gift_data{id = 99050901,
	       name = lang:get(<<"9星穿甲耳环"/utf8>>), rand_num = 1};
get(99051001) ->
    #gift_data{id = 99051001,
	       name = lang:get(<<"10星穿甲耳环"/utf8>>), rand_num = 1};
get(99050102) ->
    #gift_data{id = 99050102,
	       name = lang:get(<<"1星穿甲项链"/utf8>>), rand_num = 1};
get(99050202) ->
    #gift_data{id = 99050202,
	       name = lang:get(<<"2星穿甲项链"/utf8>>), rand_num = 1};
get(99050302) ->
    #gift_data{id = 99050302,
	       name = lang:get(<<"3星穿甲项链"/utf8>>), rand_num = 1};
get(99050402) ->
    #gift_data{id = 99050402,
	       name = lang:get(<<"4星穿甲项链"/utf8>>), rand_num = 1};
get(99050502) ->
    #gift_data{id = 99050502,
	       name = lang:get(<<"5星穿甲项链"/utf8>>), rand_num = 1};
get(99050602) ->
    #gift_data{id = 99050602,
	       name = lang:get(<<"6星穿甲项链"/utf8>>), rand_num = 1};
get(99050702) ->
    #gift_data{id = 99050702,
	       name = lang:get(<<"7星穿甲项链"/utf8>>), rand_num = 1};
get(99050802) ->
    #gift_data{id = 99050802,
	       name = lang:get(<<"8星穿甲项链"/utf8>>), rand_num = 1};
get(99050902) ->
    #gift_data{id = 99050902,
	       name = lang:get(<<"9星穿甲项链"/utf8>>), rand_num = 1};
get(99051002) ->
    #gift_data{id = 99051002,
	       name = lang:get(<<"10星穿甲项链"/utf8>>), rand_num = 1};
get(99050103) ->
    #gift_data{id = 99050103,
	       name = lang:get(<<"1星穿甲戒指"/utf8>>), rand_num = 1};
get(99050203) ->
    #gift_data{id = 99050203,
	       name = lang:get(<<"2星穿甲戒指"/utf8>>), rand_num = 1};
get(99050303) ->
    #gift_data{id = 99050303,
	       name = lang:get(<<"3星穿甲戒指"/utf8>>), rand_num = 1};
get(99050403) ->
    #gift_data{id = 99050403,
	       name = lang:get(<<"4星穿甲戒指"/utf8>>), rand_num = 1};
get(99050503) ->
    #gift_data{id = 99050503,
	       name = lang:get(<<"5星穿甲戒指"/utf8>>), rand_num = 1};
get(99050603) ->
    #gift_data{id = 99050603,
	       name = lang:get(<<"6星穿甲戒指"/utf8>>), rand_num = 1};
get(99050703) ->
    #gift_data{id = 99050703,
	       name = lang:get(<<"7星穿甲戒指"/utf8>>), rand_num = 1};
get(99050803) ->
    #gift_data{id = 99050803,
	       name = lang:get(<<"8星穿甲戒指"/utf8>>), rand_num = 1};
get(99050903) ->
    #gift_data{id = 99050903,
	       name = lang:get(<<"9星穿甲戒指"/utf8>>), rand_num = 1};
get(99051003) ->
    #gift_data{id = 99051003,
	       name = lang:get(<<"10星穿甲戒指"/utf8>>), rand_num = 1};
get(99050104) ->
    #gift_data{id = 99050104,
	       name = lang:get(<<"1星穿甲手镯"/utf8>>), rand_num = 1};
get(99050204) ->
    #gift_data{id = 99050204,
	       name = lang:get(<<"2星穿甲手镯"/utf8>>), rand_num = 1};
get(99050304) ->
    #gift_data{id = 99050304,
	       name = lang:get(<<"3星穿甲手镯"/utf8>>), rand_num = 1};
get(99050404) ->
    #gift_data{id = 99050404,
	       name = lang:get(<<"4星穿甲手镯"/utf8>>), rand_num = 1};
get(99050504) ->
    #gift_data{id = 99050504,
	       name = lang:get(<<"5星穿甲手镯"/utf8>>), rand_num = 1};
get(99050604) ->
    #gift_data{id = 99050604,
	       name = lang:get(<<"6星穿甲手镯"/utf8>>), rand_num = 1};
get(99050704) ->
    #gift_data{id = 99050704,
	       name = lang:get(<<"7星穿甲手镯"/utf8>>), rand_num = 1};
get(99050804) ->
    #gift_data{id = 99050804,
	       name = lang:get(<<"8星穿甲手镯"/utf8>>), rand_num = 1};
get(99050904) ->
    #gift_data{id = 99050904,
	       name = lang:get(<<"9星穿甲手镯"/utf8>>), rand_num = 1};
get(99051004) ->
    #gift_data{id = 99051004,
	       name = lang:get(<<"10星穿甲手镯"/utf8>>), rand_num = 1};
get(99060101) ->
    #gift_data{id = 99060101,
	       name = lang:get(<<"1星破法耳环"/utf8>>), rand_num = 1};
get(99060201) ->
    #gift_data{id = 99060201,
	       name = lang:get(<<"2星破法耳环"/utf8>>), rand_num = 1};
get(99060301) ->
    #gift_data{id = 99060301,
	       name = lang:get(<<"3星破法耳环"/utf8>>), rand_num = 1};
get(99060401) ->
    #gift_data{id = 99060401,
	       name = lang:get(<<"4星破法耳环"/utf8>>), rand_num = 1};
get(99060501) ->
    #gift_data{id = 99060501,
	       name = lang:get(<<"5星破法耳环"/utf8>>), rand_num = 1};
get(99060601) ->
    #gift_data{id = 99060601,
	       name = lang:get(<<"6星破法耳环"/utf8>>), rand_num = 1};
get(99060701) ->
    #gift_data{id = 99060701,
	       name = lang:get(<<"7星破法耳环"/utf8>>), rand_num = 1};
get(99060801) ->
    #gift_data{id = 99060801,
	       name = lang:get(<<"8星破法耳环"/utf8>>), rand_num = 1};
get(99060901) ->
    #gift_data{id = 99060901,
	       name = lang:get(<<"9星破法耳环"/utf8>>), rand_num = 1};
get(99061001) ->
    #gift_data{id = 99061001,
	       name = lang:get(<<"10星破法耳环"/utf8>>), rand_num = 1};
get(99060102) ->
    #gift_data{id = 99060102,
	       name = lang:get(<<"1星破法项链"/utf8>>), rand_num = 1};
get(99060202) ->
    #gift_data{id = 99060202,
	       name = lang:get(<<"2星破法项链"/utf8>>), rand_num = 1};
get(99060302) ->
    #gift_data{id = 99060302,
	       name = lang:get(<<"3星破法项链"/utf8>>), rand_num = 1};
get(99060402) ->
    #gift_data{id = 99060402,
	       name = lang:get(<<"4星破法项链"/utf8>>), rand_num = 1};
get(99060502) ->
    #gift_data{id = 99060502,
	       name = lang:get(<<"5星破法项链"/utf8>>), rand_num = 1};
get(99060602) ->
    #gift_data{id = 99060602,
	       name = lang:get(<<"6星破法项链"/utf8>>), rand_num = 1};
get(99060702) ->
    #gift_data{id = 99060702,
	       name = lang:get(<<"7星破法项链"/utf8>>), rand_num = 1};
get(99060802) ->
    #gift_data{id = 99060802,
	       name = lang:get(<<"8星破法项链"/utf8>>), rand_num = 1};
get(99060902) ->
    #gift_data{id = 99060902,
	       name = lang:get(<<"9星破法项链"/utf8>>), rand_num = 1};
get(99061002) ->
    #gift_data{id = 99061002,
	       name = lang:get(<<"10星破法项链"/utf8>>), rand_num = 1};
get(99060103) ->
    #gift_data{id = 99060103,
	       name = lang:get(<<"1星破法戒指"/utf8>>), rand_num = 1};
get(99060203) ->
    #gift_data{id = 99060203,
	       name = lang:get(<<"2星破法戒指"/utf8>>), rand_num = 1};
get(99060303) ->
    #gift_data{id = 99060303,
	       name = lang:get(<<"3星破法戒指"/utf8>>), rand_num = 1};
get(99060403) ->
    #gift_data{id = 99060403,
	       name = lang:get(<<"4星破法戒指"/utf8>>), rand_num = 1};
get(99060503) ->
    #gift_data{id = 99060503,
	       name = lang:get(<<"5星破法戒指"/utf8>>), rand_num = 1};
get(99060603) ->
    #gift_data{id = 99060603,
	       name = lang:get(<<"6星破法戒指"/utf8>>), rand_num = 1};
get(99060703) ->
    #gift_data{id = 99060703,
	       name = lang:get(<<"7星破法戒指"/utf8>>), rand_num = 1};
get(99060803) ->
    #gift_data{id = 99060803,
	       name = lang:get(<<"8星破法戒指"/utf8>>), rand_num = 1};
get(99060903) ->
    #gift_data{id = 99060903,
	       name = lang:get(<<"9星破法戒指"/utf8>>), rand_num = 1};
get(99061003) ->
    #gift_data{id = 99061003,
	       name = lang:get(<<"10星破法戒指"/utf8>>), rand_num = 1};
get(99060104) ->
    #gift_data{id = 99060104,
	       name = lang:get(<<"1星破法手镯"/utf8>>), rand_num = 1};
get(99060204) ->
    #gift_data{id = 99060204,
	       name = lang:get(<<"2星破法手镯"/utf8>>), rand_num = 1};
get(99060304) ->
    #gift_data{id = 99060304,
	       name = lang:get(<<"3星破法手镯"/utf8>>), rand_num = 1};
get(99060404) ->
    #gift_data{id = 99060404,
	       name = lang:get(<<"4星破法手镯"/utf8>>), rand_num = 1};
get(99060504) ->
    #gift_data{id = 99060504,
	       name = lang:get(<<"5星破法手镯"/utf8>>), rand_num = 1};
get(99060604) ->
    #gift_data{id = 99060604,
	       name = lang:get(<<"6星破法手镯"/utf8>>), rand_num = 1};
get(99060704) ->
    #gift_data{id = 99060704,
	       name = lang:get(<<"7星破法手镯"/utf8>>), rand_num = 1};
get(99060804) ->
    #gift_data{id = 99060804,
	       name = lang:get(<<"8星破法手镯"/utf8>>), rand_num = 1};
get(99060904) ->
    #gift_data{id = 99060904,
	       name = lang:get(<<"9星破法手镯"/utf8>>), rand_num = 1};
get(99061004) ->
    #gift_data{id = 99061004,
	       name = lang:get(<<"10星破法手镯"/utf8>>), rand_num = 1};
get(99070101) ->
    #gift_data{id = 99070101,
	       name = lang:get(<<"1星斗战耳环"/utf8>>), rand_num = 1};
get(99070201) ->
    #gift_data{id = 99070201,
	       name = lang:get(<<"2星斗战耳环"/utf8>>), rand_num = 1};
get(99070301) ->
    #gift_data{id = 99070301,
	       name = lang:get(<<"3星斗战耳环"/utf8>>), rand_num = 1};
get(99070401) ->
    #gift_data{id = 99070401,
	       name = lang:get(<<"4星斗战耳环"/utf8>>), rand_num = 1};
get(99070501) ->
    #gift_data{id = 99070501,
	       name = lang:get(<<"5星斗战耳环"/utf8>>), rand_num = 1};
get(99070601) ->
    #gift_data{id = 99070601,
	       name = lang:get(<<"6星斗战耳环"/utf8>>), rand_num = 1};
get(99070701) ->
    #gift_data{id = 99070701,
	       name = lang:get(<<"7星斗战耳环"/utf8>>), rand_num = 1};
get(99070801) ->
    #gift_data{id = 99070801,
	       name = lang:get(<<"8星斗战耳环"/utf8>>), rand_num = 1};
get(99070901) ->
    #gift_data{id = 99070901,
	       name = lang:get(<<"9星斗战耳环"/utf8>>), rand_num = 1};
get(99071001) ->
    #gift_data{id = 99071001,
	       name = lang:get(<<"10星斗战耳环"/utf8>>), rand_num = 1};
get(99070102) ->
    #gift_data{id = 99070102,
	       name = lang:get(<<"1星斗战项链"/utf8>>), rand_num = 1};
get(99070202) ->
    #gift_data{id = 99070202,
	       name = lang:get(<<"2星斗战项链"/utf8>>), rand_num = 1};
get(99070302) ->
    #gift_data{id = 99070302,
	       name = lang:get(<<"3星斗战项链"/utf8>>), rand_num = 1};
get(99070402) ->
    #gift_data{id = 99070402,
	       name = lang:get(<<"4星斗战项链"/utf8>>), rand_num = 1};
get(99070502) ->
    #gift_data{id = 99070502,
	       name = lang:get(<<"5星斗战项链"/utf8>>), rand_num = 1};
get(99070602) ->
    #gift_data{id = 99070602,
	       name = lang:get(<<"6星斗战项链"/utf8>>), rand_num = 1};
get(99070702) ->
    #gift_data{id = 99070702,
	       name = lang:get(<<"7星斗战项链"/utf8>>), rand_num = 1};
get(99070802) ->
    #gift_data{id = 99070802,
	       name = lang:get(<<"8星斗战项链"/utf8>>), rand_num = 1};
get(99070902) ->
    #gift_data{id = 99070902,
	       name = lang:get(<<"9星斗战项链"/utf8>>), rand_num = 1};
get(99071002) ->
    #gift_data{id = 99071002,
	       name = lang:get(<<"10星斗战项链"/utf8>>), rand_num = 1};
get(99070103) ->
    #gift_data{id = 99070103,
	       name = lang:get(<<"1星斗战戒指"/utf8>>), rand_num = 1};
get(99070203) ->
    #gift_data{id = 99070203,
	       name = lang:get(<<"2星斗战戒指"/utf8>>), rand_num = 1};
get(99070303) ->
    #gift_data{id = 99070303,
	       name = lang:get(<<"3星斗战戒指"/utf8>>), rand_num = 1};
get(99070403) ->
    #gift_data{id = 99070403,
	       name = lang:get(<<"4星斗战戒指"/utf8>>), rand_num = 1};
get(99070503) ->
    #gift_data{id = 99070503,
	       name = lang:get(<<"5星斗战戒指"/utf8>>), rand_num = 1};
get(99070603) ->
    #gift_data{id = 99070603,
	       name = lang:get(<<"6星斗战戒指"/utf8>>), rand_num = 1};
get(99070703) ->
    #gift_data{id = 99070703,
	       name = lang:get(<<"7星斗战戒指"/utf8>>), rand_num = 1};
get(99070803) ->
    #gift_data{id = 99070803,
	       name = lang:get(<<"8星斗战戒指"/utf8>>), rand_num = 1};
get(99070903) ->
    #gift_data{id = 99070903,
	       name = lang:get(<<"9星斗战戒指"/utf8>>), rand_num = 1};
get(99071003) ->
    #gift_data{id = 99071003,
	       name = lang:get(<<"10星斗战戒指"/utf8>>), rand_num = 1};
get(99070104) ->
    #gift_data{id = 99070104,
	       name = lang:get(<<"1星斗战手镯"/utf8>>), rand_num = 1};
get(99070204) ->
    #gift_data{id = 99070204,
	       name = lang:get(<<"2星斗战手镯"/utf8>>), rand_num = 1};
get(99070304) ->
    #gift_data{id = 99070304,
	       name = lang:get(<<"3星斗战手镯"/utf8>>), rand_num = 1};
get(99070404) ->
    #gift_data{id = 99070404,
	       name = lang:get(<<"4星斗战手镯"/utf8>>), rand_num = 1};
get(99070504) ->
    #gift_data{id = 99070504,
	       name = lang:get(<<"5星斗战手镯"/utf8>>), rand_num = 1};
get(99070604) ->
    #gift_data{id = 99070604,
	       name = lang:get(<<"6星斗战手镯"/utf8>>), rand_num = 1};
get(99070704) ->
    #gift_data{id = 99070704,
	       name = lang:get(<<"7星斗战手镯"/utf8>>), rand_num = 1};
get(99070804) ->
    #gift_data{id = 99070804,
	       name = lang:get(<<"8星斗战手镯"/utf8>>), rand_num = 1};
get(99070904) ->
    #gift_data{id = 99070904,
	       name = lang:get(<<"9星斗战手镯"/utf8>>), rand_num = 1};
get(99071004) ->
    #gift_data{id = 99071004,
	       name = lang:get(<<"10星斗战手镯"/utf8>>), rand_num = 1};
get(99080101) ->
    #gift_data{id = 99080101,
	       name = lang:get(<<"1星镇灵耳环"/utf8>>), rand_num = 1};
get(99080201) ->
    #gift_data{id = 99080201,
	       name = lang:get(<<"2星镇灵耳环"/utf8>>), rand_num = 1};
get(99080301) ->
    #gift_data{id = 99080301,
	       name = lang:get(<<"3星镇灵耳环"/utf8>>), rand_num = 1};
get(99080401) ->
    #gift_data{id = 99080401,
	       name = lang:get(<<"4星镇灵耳环"/utf8>>), rand_num = 1};
get(99080501) ->
    #gift_data{id = 99080501,
	       name = lang:get(<<"5星镇灵耳环"/utf8>>), rand_num = 1};
get(99080601) ->
    #gift_data{id = 99080601,
	       name = lang:get(<<"6星镇灵耳环"/utf8>>), rand_num = 1};
get(99080701) ->
    #gift_data{id = 99080701,
	       name = lang:get(<<"7星镇灵耳环"/utf8>>), rand_num = 1};
get(99080801) ->
    #gift_data{id = 99080801,
	       name = lang:get(<<"8星镇灵耳环"/utf8>>), rand_num = 1};
get(99080901) ->
    #gift_data{id = 99080901,
	       name = lang:get(<<"9星镇灵耳环"/utf8>>), rand_num = 1};
get(99081001) ->
    #gift_data{id = 99081001,
	       name = lang:get(<<"10星镇灵耳环"/utf8>>), rand_num = 1};
get(99080102) ->
    #gift_data{id = 99080102,
	       name = lang:get(<<"1星镇灵项链"/utf8>>), rand_num = 1};
get(99080202) ->
    #gift_data{id = 99080202,
	       name = lang:get(<<"2星镇灵项链"/utf8>>), rand_num = 1};
get(99080302) ->
    #gift_data{id = 99080302,
	       name = lang:get(<<"3星镇灵项链"/utf8>>), rand_num = 1};
get(99080402) ->
    #gift_data{id = 99080402,
	       name = lang:get(<<"4星镇灵项链"/utf8>>), rand_num = 1};
get(99080502) ->
    #gift_data{id = 99080502,
	       name = lang:get(<<"5星镇灵项链"/utf8>>), rand_num = 1};
get(99080602) ->
    #gift_data{id = 99080602,
	       name = lang:get(<<"6星镇灵项链"/utf8>>), rand_num = 1};
get(99080702) ->
    #gift_data{id = 99080702,
	       name = lang:get(<<"7星镇灵项链"/utf8>>), rand_num = 1};
get(99080802) ->
    #gift_data{id = 99080802,
	       name = lang:get(<<"8星镇灵项链"/utf8>>), rand_num = 1};
get(99080902) ->
    #gift_data{id = 99080902,
	       name = lang:get(<<"9星镇灵项链"/utf8>>), rand_num = 1};
get(99081002) ->
    #gift_data{id = 99081002,
	       name = lang:get(<<"10星镇灵项链"/utf8>>), rand_num = 1};
get(99080103) ->
    #gift_data{id = 99080103,
	       name = lang:get(<<"1星镇灵戒指"/utf8>>), rand_num = 1};
get(99080203) ->
    #gift_data{id = 99080203,
	       name = lang:get(<<"2星镇灵戒指"/utf8>>), rand_num = 1};
get(99080303) ->
    #gift_data{id = 99080303,
	       name = lang:get(<<"3星镇灵戒指"/utf8>>), rand_num = 1};
get(99080403) ->
    #gift_data{id = 99080403,
	       name = lang:get(<<"4星镇灵戒指"/utf8>>), rand_num = 1};
get(99080503) ->
    #gift_data{id = 99080503,
	       name = lang:get(<<"5星镇灵戒指"/utf8>>), rand_num = 1};
get(99080603) ->
    #gift_data{id = 99080603,
	       name = lang:get(<<"6星镇灵戒指"/utf8>>), rand_num = 1};
get(99080703) ->
    #gift_data{id = 99080703,
	       name = lang:get(<<"7星镇灵戒指"/utf8>>), rand_num = 1};
get(99080803) ->
    #gift_data{id = 99080803,
	       name = lang:get(<<"8星镇灵戒指"/utf8>>), rand_num = 1};
get(99080903) ->
    #gift_data{id = 99080903,
	       name = lang:get(<<"9星镇灵戒指"/utf8>>), rand_num = 1};
get(99081003) ->
    #gift_data{id = 99081003,
	       name = lang:get(<<"10星镇灵戒指"/utf8>>), rand_num = 1};
get(99080104) ->
    #gift_data{id = 99080104,
	       name = lang:get(<<"1星镇灵手镯"/utf8>>), rand_num = 1};
get(99080204) ->
    #gift_data{id = 99080204,
	       name = lang:get(<<"2星镇灵手镯"/utf8>>), rand_num = 1};
get(99080304) ->
    #gift_data{id = 99080304,
	       name = lang:get(<<"3星镇灵手镯"/utf8>>), rand_num = 1};
get(99080404) ->
    #gift_data{id = 99080404,
	       name = lang:get(<<"4星镇灵手镯"/utf8>>), rand_num = 1};
get(99080504) ->
    #gift_data{id = 99080504,
	       name = lang:get(<<"5星镇灵手镯"/utf8>>), rand_num = 1};
get(99080604) ->
    #gift_data{id = 99080604,
	       name = lang:get(<<"6星镇灵手镯"/utf8>>), rand_num = 1};
get(99080704) ->
    #gift_data{id = 99080704,
	       name = lang:get(<<"7星镇灵手镯"/utf8>>), rand_num = 1};
get(99080804) ->
    #gift_data{id = 99080804,
	       name = lang:get(<<"8星镇灵手镯"/utf8>>), rand_num = 1};
get(99080904) ->
    #gift_data{id = 99080904,
	       name = lang:get(<<"9星镇灵手镯"/utf8>>), rand_num = 1};
get(99081004) ->
    #gift_data{id = 99081004,
	       name = lang:get(<<"10星镇灵手镯"/utf8>>), rand_num = 1};
get(99090101) ->
    #gift_data{id = 99090101,
	       name = lang:get(<<"1星魔甲耳环"/utf8>>), rand_num = 1};
get(99090201) ->
    #gift_data{id = 99090201,
	       name = lang:get(<<"2星魔甲耳环"/utf8>>), rand_num = 1};
get(99090301) ->
    #gift_data{id = 99090301,
	       name = lang:get(<<"3星魔甲耳环"/utf8>>), rand_num = 1};
get(99090401) ->
    #gift_data{id = 99090401,
	       name = lang:get(<<"4星魔甲耳环"/utf8>>), rand_num = 1};
get(99090501) ->
    #gift_data{id = 99090501,
	       name = lang:get(<<"5星魔甲耳环"/utf8>>), rand_num = 1};
get(99090601) ->
    #gift_data{id = 99090601,
	       name = lang:get(<<"6星魔甲耳环"/utf8>>), rand_num = 1};
get(99090701) ->
    #gift_data{id = 99090701,
	       name = lang:get(<<"7星魔甲耳环"/utf8>>), rand_num = 1};
get(99090801) ->
    #gift_data{id = 99090801,
	       name = lang:get(<<"8星魔甲耳环"/utf8>>), rand_num = 1};
get(99090901) ->
    #gift_data{id = 99090901,
	       name = lang:get(<<"9星魔甲耳环"/utf8>>), rand_num = 1};
get(99091001) ->
    #gift_data{id = 99091001,
	       name = lang:get(<<"10星魔甲耳环"/utf8>>), rand_num = 1};
get(99090102) ->
    #gift_data{id = 99090102,
	       name = lang:get(<<"1星魔甲项链"/utf8>>), rand_num = 1};
get(99090202) ->
    #gift_data{id = 99090202,
	       name = lang:get(<<"2星魔甲项链"/utf8>>), rand_num = 1};
get(99090302) ->
    #gift_data{id = 99090302,
	       name = lang:get(<<"3星魔甲项链"/utf8>>), rand_num = 1};
get(99090402) ->
    #gift_data{id = 99090402,
	       name = lang:get(<<"4星魔甲项链"/utf8>>), rand_num = 1};
get(99090502) ->
    #gift_data{id = 99090502,
	       name = lang:get(<<"5星魔甲项链"/utf8>>), rand_num = 1};
get(99090602) ->
    #gift_data{id = 99090602,
	       name = lang:get(<<"6星魔甲项链"/utf8>>), rand_num = 1};
get(99090702) ->
    #gift_data{id = 99090702,
	       name = lang:get(<<"7星魔甲项链"/utf8>>), rand_num = 1};
get(99090802) ->
    #gift_data{id = 99090802,
	       name = lang:get(<<"8星魔甲项链"/utf8>>), rand_num = 1};
get(99090902) ->
    #gift_data{id = 99090902,
	       name = lang:get(<<"9星魔甲项链"/utf8>>), rand_num = 1};
get(99091002) ->
    #gift_data{id = 99091002,
	       name = lang:get(<<"10星魔甲项链"/utf8>>), rand_num = 1};
get(99090103) ->
    #gift_data{id = 99090103,
	       name = lang:get(<<"1星魔甲戒指"/utf8>>), rand_num = 1};
get(99090203) ->
    #gift_data{id = 99090203,
	       name = lang:get(<<"2星魔甲戒指"/utf8>>), rand_num = 1};
get(99090303) ->
    #gift_data{id = 99090303,
	       name = lang:get(<<"3星魔甲戒指"/utf8>>), rand_num = 1};
get(99090403) ->
    #gift_data{id = 99090403,
	       name = lang:get(<<"4星魔甲戒指"/utf8>>), rand_num = 1};
get(99090503) ->
    #gift_data{id = 99090503,
	       name = lang:get(<<"5星魔甲戒指"/utf8>>), rand_num = 1};
get(99090603) ->
    #gift_data{id = 99090603,
	       name = lang:get(<<"6星魔甲戒指"/utf8>>), rand_num = 1};
get(99090703) ->
    #gift_data{id = 99090703,
	       name = lang:get(<<"7星魔甲戒指"/utf8>>), rand_num = 1};
get(99090803) ->
    #gift_data{id = 99090803,
	       name = lang:get(<<"8星魔甲戒指"/utf8>>), rand_num = 1};
get(99090903) ->
    #gift_data{id = 99090903,
	       name = lang:get(<<"9星魔甲戒指"/utf8>>), rand_num = 1};
get(99091003) ->
    #gift_data{id = 99091003,
	       name = lang:get(<<"10星魔甲戒指"/utf8>>), rand_num = 1};
get(99090104) ->
    #gift_data{id = 99090104,
	       name = lang:get(<<"1星魔甲手镯"/utf8>>), rand_num = 1};
get(99090204) ->
    #gift_data{id = 99090204,
	       name = lang:get(<<"2星魔甲手镯"/utf8>>), rand_num = 1};
get(99090304) ->
    #gift_data{id = 99090304,
	       name = lang:get(<<"3星魔甲手镯"/utf8>>), rand_num = 1};
get(99090404) ->
    #gift_data{id = 99090404,
	       name = lang:get(<<"4星魔甲手镯"/utf8>>), rand_num = 1};
get(99090504) ->
    #gift_data{id = 99090504,
	       name = lang:get(<<"5星魔甲手镯"/utf8>>), rand_num = 1};
get(99090604) ->
    #gift_data{id = 99090604,
	       name = lang:get(<<"6星魔甲手镯"/utf8>>), rand_num = 1};
get(99090704) ->
    #gift_data{id = 99090704,
	       name = lang:get(<<"7星魔甲手镯"/utf8>>), rand_num = 1};
get(99090804) ->
    #gift_data{id = 99090804,
	       name = lang:get(<<"8星魔甲手镯"/utf8>>), rand_num = 1};
get(99090904) ->
    #gift_data{id = 99090904,
	       name = lang:get(<<"9星魔甲手镯"/utf8>>), rand_num = 1};
get(99091004) ->
    #gift_data{id = 99091004,
	       name = lang:get(<<"10星魔甲手镯"/utf8>>), rand_num = 1};
get(99100101) ->
    #gift_data{id = 99100101,
	       name = lang:get(<<"1星神战耳环"/utf8>>), rand_num = 1};
get(99100201) ->
    #gift_data{id = 99100201,
	       name = lang:get(<<"2星神战耳环"/utf8>>), rand_num = 1};
get(99100301) ->
    #gift_data{id = 99100301,
	       name = lang:get(<<"3星神战耳环"/utf8>>), rand_num = 1};
get(99100401) ->
    #gift_data{id = 99100401,
	       name = lang:get(<<"4星神战耳环"/utf8>>), rand_num = 1};
get(99100501) ->
    #gift_data{id = 99100501,
	       name = lang:get(<<"5星神战耳环"/utf8>>), rand_num = 1};
get(99100601) ->
    #gift_data{id = 99100601,
	       name = lang:get(<<"6星神战耳环"/utf8>>), rand_num = 1};
get(99100701) ->
    #gift_data{id = 99100701,
	       name = lang:get(<<"7星神战耳环"/utf8>>), rand_num = 1};
get(99100801) ->
    #gift_data{id = 99100801,
	       name = lang:get(<<"8星神战耳环"/utf8>>), rand_num = 1};
get(99100901) ->
    #gift_data{id = 99100901,
	       name = lang:get(<<"9星神战耳环"/utf8>>), rand_num = 1};
get(99101001) ->
    #gift_data{id = 99101001,
	       name = lang:get(<<"10星神战耳环"/utf8>>), rand_num = 1};
get(99100102) ->
    #gift_data{id = 99100102,
	       name = lang:get(<<"1星神战项链"/utf8>>), rand_num = 1};
get(99100202) ->
    #gift_data{id = 99100202,
	       name = lang:get(<<"2星神战项链"/utf8>>), rand_num = 1};
get(99100302) ->
    #gift_data{id = 99100302,
	       name = lang:get(<<"3星神战项链"/utf8>>), rand_num = 1};
get(99100402) ->
    #gift_data{id = 99100402,
	       name = lang:get(<<"4星神战项链"/utf8>>), rand_num = 1};
get(99100502) ->
    #gift_data{id = 99100502,
	       name = lang:get(<<"5星神战项链"/utf8>>), rand_num = 1};
get(99100602) ->
    #gift_data{id = 99100602,
	       name = lang:get(<<"6星神战项链"/utf8>>), rand_num = 1};
get(99100702) ->
    #gift_data{id = 99100702,
	       name = lang:get(<<"7星神战项链"/utf8>>), rand_num = 1};
get(99100802) ->
    #gift_data{id = 99100802,
	       name = lang:get(<<"8星神战项链"/utf8>>), rand_num = 1};
get(99100902) ->
    #gift_data{id = 99100902,
	       name = lang:get(<<"9星神战项链"/utf8>>), rand_num = 1};
get(99101002) ->
    #gift_data{id = 99101002,
	       name = lang:get(<<"10星神战项链"/utf8>>), rand_num = 1};
get(99100103) ->
    #gift_data{id = 99100103,
	       name = lang:get(<<"1星神战戒指"/utf8>>), rand_num = 1};
get(99100203) ->
    #gift_data{id = 99100203,
	       name = lang:get(<<"2星神战戒指"/utf8>>), rand_num = 1};
get(99100303) ->
    #gift_data{id = 99100303,
	       name = lang:get(<<"3星神战戒指"/utf8>>), rand_num = 1};
get(99100403) ->
    #gift_data{id = 99100403,
	       name = lang:get(<<"4星神战戒指"/utf8>>), rand_num = 1};
get(99100503) ->
    #gift_data{id = 99100503,
	       name = lang:get(<<"5星神战戒指"/utf8>>), rand_num = 1};
get(99100603) ->
    #gift_data{id = 99100603,
	       name = lang:get(<<"6星神战戒指"/utf8>>), rand_num = 1};
get(99100703) ->
    #gift_data{id = 99100703,
	       name = lang:get(<<"7星神战戒指"/utf8>>), rand_num = 1};
get(99100803) ->
    #gift_data{id = 99100803,
	       name = lang:get(<<"8星神战戒指"/utf8>>), rand_num = 1};
get(99100903) ->
    #gift_data{id = 99100903,
	       name = lang:get(<<"9星神战戒指"/utf8>>), rand_num = 1};
get(99101003) ->
    #gift_data{id = 99101003,
	       name = lang:get(<<"10星神战戒指"/utf8>>), rand_num = 1};
get(99100104) ->
    #gift_data{id = 99100104,
	       name = lang:get(<<"1星神战手镯"/utf8>>), rand_num = 1};
get(99100204) ->
    #gift_data{id = 99100204,
	       name = lang:get(<<"2星神战手镯"/utf8>>), rand_num = 1};
get(99100304) ->
    #gift_data{id = 99100304,
	       name = lang:get(<<"3星神战手镯"/utf8>>), rand_num = 1};
get(99100404) ->
    #gift_data{id = 99100404,
	       name = lang:get(<<"4星神战手镯"/utf8>>), rand_num = 1};
get(99100504) ->
    #gift_data{id = 99100504,
	       name = lang:get(<<"5星神战手镯"/utf8>>), rand_num = 1};
get(99100604) ->
    #gift_data{id = 99100604,
	       name = lang:get(<<"6星神战手镯"/utf8>>), rand_num = 1};
get(99100704) ->
    #gift_data{id = 99100704,
	       name = lang:get(<<"7星神战手镯"/utf8>>), rand_num = 1};
get(99100804) ->
    #gift_data{id = 99100804,
	       name = lang:get(<<"8星神战手镯"/utf8>>), rand_num = 1};
get(99100904) ->
    #gift_data{id = 99100904,
	       name = lang:get(<<"9星神战手镯"/utf8>>), rand_num = 1};
get(99101004) ->
    #gift_data{id = 99101004,
	       name = lang:get(<<"10星神战手镯"/utf8>>), rand_num = 1};
get(99110101) ->
    #gift_data{id = 99110101,
	       name = lang:get(<<"1星龙威耳环"/utf8>>), rand_num = 1};
get(99110201) ->
    #gift_data{id = 99110201,
	       name = lang:get(<<"2星龙威耳环"/utf8>>), rand_num = 1};
get(99110301) ->
    #gift_data{id = 99110301,
	       name = lang:get(<<"3星龙威耳环"/utf8>>), rand_num = 1};
get(99110401) ->
    #gift_data{id = 99110401,
	       name = lang:get(<<"4星龙威耳环"/utf8>>), rand_num = 1};
get(99110501) ->
    #gift_data{id = 99110501,
	       name = lang:get(<<"5星龙威耳环"/utf8>>), rand_num = 1};
get(99110601) ->
    #gift_data{id = 99110601,
	       name = lang:get(<<"6星龙威耳环"/utf8>>), rand_num = 1};
get(99110701) ->
    #gift_data{id = 99110701,
	       name = lang:get(<<"7星龙威耳环"/utf8>>), rand_num = 1};
get(99110801) ->
    #gift_data{id = 99110801,
	       name = lang:get(<<"8星龙威耳环"/utf8>>), rand_num = 1};
get(99110901) ->
    #gift_data{id = 99110901,
	       name = lang:get(<<"9星龙威耳环"/utf8>>), rand_num = 1};
get(99111001) ->
    #gift_data{id = 99111001,
	       name = lang:get(<<"10星龙威耳环"/utf8>>), rand_num = 1};
get(99110102) ->
    #gift_data{id = 99110102,
	       name = lang:get(<<"1星龙威项链"/utf8>>), rand_num = 1};
get(99110202) ->
    #gift_data{id = 99110202,
	       name = lang:get(<<"2星龙威项链"/utf8>>), rand_num = 1};
get(99110302) ->
    #gift_data{id = 99110302,
	       name = lang:get(<<"3星龙威项链"/utf8>>), rand_num = 1};
get(99110402) ->
    #gift_data{id = 99110402,
	       name = lang:get(<<"4星龙威项链"/utf8>>), rand_num = 1};
get(99110502) ->
    #gift_data{id = 99110502,
	       name = lang:get(<<"5星龙威项链"/utf8>>), rand_num = 1};
get(99110602) ->
    #gift_data{id = 99110602,
	       name = lang:get(<<"6星龙威项链"/utf8>>), rand_num = 1};
get(99110702) ->
    #gift_data{id = 99110702,
	       name = lang:get(<<"7星龙威项链"/utf8>>), rand_num = 1};
get(99110802) ->
    #gift_data{id = 99110802,
	       name = lang:get(<<"8星龙威项链"/utf8>>), rand_num = 1};
get(99110902) ->
    #gift_data{id = 99110902,
	       name = lang:get(<<"9星龙威项链"/utf8>>), rand_num = 1};
get(99111002) ->
    #gift_data{id = 99111002,
	       name = lang:get(<<"10星龙威项链"/utf8>>), rand_num = 1};
get(99110103) ->
    #gift_data{id = 99110103,
	       name = lang:get(<<"1星龙威戒指"/utf8>>), rand_num = 1};
get(99110203) ->
    #gift_data{id = 99110203,
	       name = lang:get(<<"2星龙威戒指"/utf8>>), rand_num = 1};
get(99110303) ->
    #gift_data{id = 99110303,
	       name = lang:get(<<"3星龙威戒指"/utf8>>), rand_num = 1};
get(99110403) ->
    #gift_data{id = 99110403,
	       name = lang:get(<<"4星龙威戒指"/utf8>>), rand_num = 1};
get(99110503) ->
    #gift_data{id = 99110503,
	       name = lang:get(<<"5星龙威戒指"/utf8>>), rand_num = 1};
get(99110603) ->
    #gift_data{id = 99110603,
	       name = lang:get(<<"6星龙威戒指"/utf8>>), rand_num = 1};
get(99110703) ->
    #gift_data{id = 99110703,
	       name = lang:get(<<"7星龙威戒指"/utf8>>), rand_num = 1};
get(99110803) ->
    #gift_data{id = 99110803,
	       name = lang:get(<<"8星龙威戒指"/utf8>>), rand_num = 1};
get(99110903) ->
    #gift_data{id = 99110903,
	       name = lang:get(<<"9星龙威戒指"/utf8>>), rand_num = 1};
get(99111003) ->
    #gift_data{id = 99111003,
	       name = lang:get(<<"10星龙威戒指"/utf8>>), rand_num = 1};
get(99110104) ->
    #gift_data{id = 99110104,
	       name = lang:get(<<"1星龙威手镯"/utf8>>), rand_num = 1};
get(99110204) ->
    #gift_data{id = 99110204,
	       name = lang:get(<<"2星龙威手镯"/utf8>>), rand_num = 1};
get(99110304) ->
    #gift_data{id = 99110304,
	       name = lang:get(<<"3星龙威手镯"/utf8>>), rand_num = 1};
get(99110404) ->
    #gift_data{id = 99110404,
	       name = lang:get(<<"4星龙威手镯"/utf8>>), rand_num = 1};
get(99110504) ->
    #gift_data{id = 99110504,
	       name = lang:get(<<"5星龙威手镯"/utf8>>), rand_num = 1};
get(99110604) ->
    #gift_data{id = 99110604,
	       name = lang:get(<<"6星龙威手镯"/utf8>>), rand_num = 1};
get(99110704) ->
    #gift_data{id = 99110704,
	       name = lang:get(<<"7星龙威手镯"/utf8>>), rand_num = 1};
get(99110804) ->
    #gift_data{id = 99110804,
	       name = lang:get(<<"8星龙威手镯"/utf8>>), rand_num = 1};
get(99110904) ->
    #gift_data{id = 99110904,
	       name = lang:get(<<"9星龙威手镯"/utf8>>), rand_num = 1};
get(99111004) ->
    #gift_data{id = 99111004,
	       name = lang:get(<<"10星龙威手镯"/utf8>>), rand_num = 1};
get(99120101) ->
    #gift_data{id = 99120101,
	       name = lang:get(<<"1星神愈耳环"/utf8>>), rand_num = 1};
get(99120201) ->
    #gift_data{id = 99120201,
	       name = lang:get(<<"2星神愈耳环"/utf8>>), rand_num = 1};
get(99120301) ->
    #gift_data{id = 99120301,
	       name = lang:get(<<"3星神愈耳环"/utf8>>), rand_num = 1};
get(99120401) ->
    #gift_data{id = 99120401,
	       name = lang:get(<<"4星神愈耳环"/utf8>>), rand_num = 1};
get(99120501) ->
    #gift_data{id = 99120501,
	       name = lang:get(<<"5星神愈耳环"/utf8>>), rand_num = 1};
get(99120601) ->
    #gift_data{id = 99120601,
	       name = lang:get(<<"6星神愈耳环"/utf8>>), rand_num = 1};
get(99120701) ->
    #gift_data{id = 99120701,
	       name = lang:get(<<"7星神愈耳环"/utf8>>), rand_num = 1};
get(99120801) ->
    #gift_data{id = 99120801,
	       name = lang:get(<<"8星神愈耳环"/utf8>>), rand_num = 1};
get(99120901) ->
    #gift_data{id = 99120901,
	       name = lang:get(<<"9星神愈耳环"/utf8>>), rand_num = 1};
get(99121001) ->
    #gift_data{id = 99121001,
	       name = lang:get(<<"10星神愈耳环"/utf8>>), rand_num = 1};
get(99120102) ->
    #gift_data{id = 99120102,
	       name = lang:get(<<"1星神愈项链"/utf8>>), rand_num = 1};
get(99120202) ->
    #gift_data{id = 99120202,
	       name = lang:get(<<"2星神愈项链"/utf8>>), rand_num = 1};
get(99120302) ->
    #gift_data{id = 99120302,
	       name = lang:get(<<"3星神愈项链"/utf8>>), rand_num = 1};
get(99120402) ->
    #gift_data{id = 99120402,
	       name = lang:get(<<"4星神愈项链"/utf8>>), rand_num = 1};
get(99120502) ->
    #gift_data{id = 99120502,
	       name = lang:get(<<"5星神愈项链"/utf8>>), rand_num = 1};
get(99120602) ->
    #gift_data{id = 99120602,
	       name = lang:get(<<"6星神愈项链"/utf8>>), rand_num = 1};
get(99120702) ->
    #gift_data{id = 99120702,
	       name = lang:get(<<"7星神愈项链"/utf8>>), rand_num = 1};
get(99120802) ->
    #gift_data{id = 99120802,
	       name = lang:get(<<"8星神愈项链"/utf8>>), rand_num = 1};
get(99120902) ->
    #gift_data{id = 99120902,
	       name = lang:get(<<"9星神愈项链"/utf8>>), rand_num = 1};
get(99121002) ->
    #gift_data{id = 99121002,
	       name = lang:get(<<"10星神愈项链"/utf8>>), rand_num = 1};
get(99120103) ->
    #gift_data{id = 99120103,
	       name = lang:get(<<"1星神愈戒指"/utf8>>), rand_num = 1};
get(99120203) ->
    #gift_data{id = 99120203,
	       name = lang:get(<<"2星神愈戒指"/utf8>>), rand_num = 1};
get(99120303) ->
    #gift_data{id = 99120303,
	       name = lang:get(<<"3星神愈戒指"/utf8>>), rand_num = 1};
get(99120403) ->
    #gift_data{id = 99120403,
	       name = lang:get(<<"4星神愈戒指"/utf8>>), rand_num = 1};
get(99120503) ->
    #gift_data{id = 99120503,
	       name = lang:get(<<"5星神愈戒指"/utf8>>), rand_num = 1};
get(99120603) ->
    #gift_data{id = 99120603,
	       name = lang:get(<<"6星神愈戒指"/utf8>>), rand_num = 1};
get(99120703) ->
    #gift_data{id = 99120703,
	       name = lang:get(<<"7星神愈戒指"/utf8>>), rand_num = 1};
get(99120803) ->
    #gift_data{id = 99120803,
	       name = lang:get(<<"8星神愈戒指"/utf8>>), rand_num = 1};
get(99120903) ->
    #gift_data{id = 99120903,
	       name = lang:get(<<"9星神愈戒指"/utf8>>), rand_num = 1};
get(99121003) ->
    #gift_data{id = 99121003,
	       name = lang:get(<<"10星神愈戒指"/utf8>>), rand_num = 1};
get(99120104) ->
    #gift_data{id = 99120104,
	       name = lang:get(<<"1星神愈手镯"/utf8>>), rand_num = 1};
get(99120204) ->
    #gift_data{id = 99120204,
	       name = lang:get(<<"2星神愈手镯"/utf8>>), rand_num = 1};
get(99120304) ->
    #gift_data{id = 99120304,
	       name = lang:get(<<"3星神愈手镯"/utf8>>), rand_num = 1};
get(99120404) ->
    #gift_data{id = 99120404,
	       name = lang:get(<<"4星神愈手镯"/utf8>>), rand_num = 1};
get(99120504) ->
    #gift_data{id = 99120504,
	       name = lang:get(<<"5星神愈手镯"/utf8>>), rand_num = 1};
get(99120604) ->
    #gift_data{id = 99120604,
	       name = lang:get(<<"6星神愈手镯"/utf8>>), rand_num = 1};
get(99120704) ->
    #gift_data{id = 99120704,
	       name = lang:get(<<"7星神愈手镯"/utf8>>), rand_num = 1};
get(99120804) ->
    #gift_data{id = 99120804,
	       name = lang:get(<<"8星神愈手镯"/utf8>>), rand_num = 1};
get(99120904) ->
    #gift_data{id = 99120904,
	       name = lang:get(<<"9星神愈手镯"/utf8>>), rand_num = 1};
get(99121004) ->
    #gift_data{id = 99121004,
	       name = lang:get(<<"10星神愈手镯"/utf8>>), rand_num = 1};
get(99130101) ->
    #gift_data{id = 99130101,
	       name = lang:get(<<"1星极速耳环"/utf8>>), rand_num = 1};
get(99130201) ->
    #gift_data{id = 99130201,
	       name = lang:get(<<"2星极速耳环"/utf8>>), rand_num = 1};
get(99130301) ->
    #gift_data{id = 99130301,
	       name = lang:get(<<"3星极速耳环"/utf8>>), rand_num = 1};
get(99130401) ->
    #gift_data{id = 99130401,
	       name = lang:get(<<"4星极速耳环"/utf8>>), rand_num = 1};
get(99130501) ->
    #gift_data{id = 99130501,
	       name = lang:get(<<"5星极速耳环"/utf8>>), rand_num = 1};
get(99130601) ->
    #gift_data{id = 99130601,
	       name = lang:get(<<"6星极速耳环"/utf8>>), rand_num = 1};
get(99130701) ->
    #gift_data{id = 99130701,
	       name = lang:get(<<"7星极速耳环"/utf8>>), rand_num = 1};
get(99130801) ->
    #gift_data{id = 99130801,
	       name = lang:get(<<"8星极速耳环"/utf8>>), rand_num = 1};
get(99130901) ->
    #gift_data{id = 99130901,
	       name = lang:get(<<"9星极速耳环"/utf8>>), rand_num = 1};
get(99131001) ->
    #gift_data{id = 99131001,
	       name = lang:get(<<"10星极速耳环"/utf8>>), rand_num = 1};
get(99130102) ->
    #gift_data{id = 99130102,
	       name = lang:get(<<"1星极速项链"/utf8>>), rand_num = 1};
get(99130202) ->
    #gift_data{id = 99130202,
	       name = lang:get(<<"2星极速项链"/utf8>>), rand_num = 1};
get(99130302) ->
    #gift_data{id = 99130302,
	       name = lang:get(<<"3星极速项链"/utf8>>), rand_num = 1};
get(99130402) ->
    #gift_data{id = 99130402,
	       name = lang:get(<<"4星极速项链"/utf8>>), rand_num = 1};
get(99130502) ->
    #gift_data{id = 99130502,
	       name = lang:get(<<"5星极速项链"/utf8>>), rand_num = 1};
get(99130602) ->
    #gift_data{id = 99130602,
	       name = lang:get(<<"6星极速项链"/utf8>>), rand_num = 1};
get(99130702) ->
    #gift_data{id = 99130702,
	       name = lang:get(<<"7星极速项链"/utf8>>), rand_num = 1};
get(99130802) ->
    #gift_data{id = 99130802,
	       name = lang:get(<<"8星极速项链"/utf8>>), rand_num = 1};
get(99130902) ->
    #gift_data{id = 99130902,
	       name = lang:get(<<"9星极速项链"/utf8>>), rand_num = 1};
get(99131002) ->
    #gift_data{id = 99131002,
	       name = lang:get(<<"10星极速项链"/utf8>>), rand_num = 1};
get(99130103) ->
    #gift_data{id = 99130103,
	       name = lang:get(<<"1星极速戒指"/utf8>>), rand_num = 1};
get(99130203) ->
    #gift_data{id = 99130203,
	       name = lang:get(<<"2星极速戒指"/utf8>>), rand_num = 1};
get(99130303) ->
    #gift_data{id = 99130303,
	       name = lang:get(<<"3星极速戒指"/utf8>>), rand_num = 1};
get(99130403) ->
    #gift_data{id = 99130403,
	       name = lang:get(<<"4星极速戒指"/utf8>>), rand_num = 1};
get(99130503) ->
    #gift_data{id = 99130503,
	       name = lang:get(<<"5星极速戒指"/utf8>>), rand_num = 1};
get(99130603) ->
    #gift_data{id = 99130603,
	       name = lang:get(<<"6星极速戒指"/utf8>>), rand_num = 1};
get(99130703) ->
    #gift_data{id = 99130703,
	       name = lang:get(<<"7星极速戒指"/utf8>>), rand_num = 1};
get(99130803) ->
    #gift_data{id = 99130803,
	       name = lang:get(<<"8星极速戒指"/utf8>>), rand_num = 1};
get(99130903) ->
    #gift_data{id = 99130903,
	       name = lang:get(<<"9星极速戒指"/utf8>>), rand_num = 1};
get(99131003) ->
    #gift_data{id = 99131003,
	       name = lang:get(<<"10星极速戒指"/utf8>>), rand_num = 1};
get(99130104) ->
    #gift_data{id = 99130104,
	       name = lang:get(<<"1星极速手镯"/utf8>>), rand_num = 1};
get(99130204) ->
    #gift_data{id = 99130204,
	       name = lang:get(<<"2星极速手镯"/utf8>>), rand_num = 1};
get(99130304) ->
    #gift_data{id = 99130304,
	       name = lang:get(<<"3星极速手镯"/utf8>>), rand_num = 1};
get(99130404) ->
    #gift_data{id = 99130404,
	       name = lang:get(<<"4星极速手镯"/utf8>>), rand_num = 1};
get(99130504) ->
    #gift_data{id = 99130504,
	       name = lang:get(<<"5星极速手镯"/utf8>>), rand_num = 1};
get(99130604) ->
    #gift_data{id = 99130604,
	       name = lang:get(<<"6星极速手镯"/utf8>>), rand_num = 1};
get(99130704) ->
    #gift_data{id = 99130704,
	       name = lang:get(<<"7星极速手镯"/utf8>>), rand_num = 1};
get(99130804) ->
    #gift_data{id = 99130804,
	       name = lang:get(<<"8星极速手镯"/utf8>>), rand_num = 1};
get(99130904) ->
    #gift_data{id = 99130904,
	       name = lang:get(<<"9星极速手镯"/utf8>>), rand_num = 1};
get(99131004) ->
    #gift_data{id = 99131004,
	       name = lang:get(<<"10星极速手镯"/utf8>>), rand_num = 1};
get(99140101) ->
    #gift_data{id = 99140101,
	       name = lang:get(<<"1星玄护耳环"/utf8>>), rand_num = 1};
get(99140201) ->
    #gift_data{id = 99140201,
	       name = lang:get(<<"2星玄护耳环"/utf8>>), rand_num = 1};
get(99140301) ->
    #gift_data{id = 99140301,
	       name = lang:get(<<"3星玄护耳环"/utf8>>), rand_num = 1};
get(99140401) ->
    #gift_data{id = 99140401,
	       name = lang:get(<<"4星玄护耳环"/utf8>>), rand_num = 1};
get(99140501) ->
    #gift_data{id = 99140501,
	       name = lang:get(<<"5星玄护耳环"/utf8>>), rand_num = 1};
get(99140601) ->
    #gift_data{id = 99140601,
	       name = lang:get(<<"6星玄护耳环"/utf8>>), rand_num = 1};
get(99140701) ->
    #gift_data{id = 99140701,
	       name = lang:get(<<"7星玄护耳环"/utf8>>), rand_num = 1};
get(99140801) ->
    #gift_data{id = 99140801,
	       name = lang:get(<<"8星玄护耳环"/utf8>>), rand_num = 1};
get(99140901) ->
    #gift_data{id = 99140901,
	       name = lang:get(<<"9星玄护耳环"/utf8>>), rand_num = 1};
get(99141001) ->
    #gift_data{id = 99141001,
	       name = lang:get(<<"10星玄护耳环"/utf8>>), rand_num = 1};
get(99140102) ->
    #gift_data{id = 99140102,
	       name = lang:get(<<"1星玄护项链"/utf8>>), rand_num = 1};
get(99140202) ->
    #gift_data{id = 99140202,
	       name = lang:get(<<"2星玄护项链"/utf8>>), rand_num = 1};
get(99140302) ->
    #gift_data{id = 99140302,
	       name = lang:get(<<"3星玄护项链"/utf8>>), rand_num = 1};
get(99140402) ->
    #gift_data{id = 99140402,
	       name = lang:get(<<"4星玄护项链"/utf8>>), rand_num = 1};
get(99140502) ->
    #gift_data{id = 99140502,
	       name = lang:get(<<"5星玄护项链"/utf8>>), rand_num = 1};
get(99140602) ->
    #gift_data{id = 99140602,
	       name = lang:get(<<"6星玄护项链"/utf8>>), rand_num = 1};
get(99140702) ->
    #gift_data{id = 99140702,
	       name = lang:get(<<"7星玄护项链"/utf8>>), rand_num = 1};
get(99140802) ->
    #gift_data{id = 99140802,
	       name = lang:get(<<"8星玄护项链"/utf8>>), rand_num = 1};
get(99140902) ->
    #gift_data{id = 99140902,
	       name = lang:get(<<"9星玄护项链"/utf8>>), rand_num = 1};
get(99141002) ->
    #gift_data{id = 99141002,
	       name = lang:get(<<"10星玄护项链"/utf8>>), rand_num = 1};
get(99140103) ->
    #gift_data{id = 99140103,
	       name = lang:get(<<"1星玄护戒指"/utf8>>), rand_num = 1};
get(99140203) ->
    #gift_data{id = 99140203,
	       name = lang:get(<<"2星玄护戒指"/utf8>>), rand_num = 1};
get(99140303) ->
    #gift_data{id = 99140303,
	       name = lang:get(<<"3星玄护戒指"/utf8>>), rand_num = 1};
get(99140403) ->
    #gift_data{id = 99140403,
	       name = lang:get(<<"4星玄护戒指"/utf8>>), rand_num = 1};
get(99140503) ->
    #gift_data{id = 99140503,
	       name = lang:get(<<"5星玄护戒指"/utf8>>), rand_num = 1};
get(99140603) ->
    #gift_data{id = 99140603,
	       name = lang:get(<<"6星玄护戒指"/utf8>>), rand_num = 1};
get(99140703) ->
    #gift_data{id = 99140703,
	       name = lang:get(<<"7星玄护戒指"/utf8>>), rand_num = 1};
get(99140803) ->
    #gift_data{id = 99140803,
	       name = lang:get(<<"8星玄护戒指"/utf8>>), rand_num = 1};
get(99140903) ->
    #gift_data{id = 99140903,
	       name = lang:get(<<"9星玄护戒指"/utf8>>), rand_num = 1};
get(99141003) ->
    #gift_data{id = 99141003,
	       name = lang:get(<<"10星玄护戒指"/utf8>>), rand_num = 1};
get(99140104) ->
    #gift_data{id = 99140104,
	       name = lang:get(<<"1星玄护手镯"/utf8>>), rand_num = 1};
get(99140204) ->
    #gift_data{id = 99140204,
	       name = lang:get(<<"2星玄护手镯"/utf8>>), rand_num = 1};
get(99140304) ->
    #gift_data{id = 99140304,
	       name = lang:get(<<"3星玄护手镯"/utf8>>), rand_num = 1};
get(99140404) ->
    #gift_data{id = 99140404,
	       name = lang:get(<<"4星玄护手镯"/utf8>>), rand_num = 1};
get(99140504) ->
    #gift_data{id = 99140504,
	       name = lang:get(<<"5星玄护手镯"/utf8>>), rand_num = 1};
get(99140604) ->
    #gift_data{id = 99140604,
	       name = lang:get(<<"6星玄护手镯"/utf8>>), rand_num = 1};
get(99140704) ->
    #gift_data{id = 99140704,
	       name = lang:get(<<"7星玄护手镯"/utf8>>), rand_num = 1};
get(99140804) ->
    #gift_data{id = 99140804,
	       name = lang:get(<<"8星玄护手镯"/utf8>>), rand_num = 1};
get(99140904) ->
    #gift_data{id = 99140904,
	       name = lang:get(<<"9星玄护手镯"/utf8>>), rand_num = 1};
get(99141004) ->
    #gift_data{id = 99141004,
	       name = lang:get(<<"10星玄护手镯"/utf8>>), rand_num = 1};
get(89010301) ->
    #gift_data{id = 89010301,
	       name = lang:get(<<"3星勇气"/utf8>>), rand_num = 1};
get(89020301) ->
    #gift_data{id = 89020301,
	       name = lang:get(<<"3星狂怒"/utf8>>), rand_num = 1};
get(89030301) ->
    #gift_data{id = 89030301,
	       name = lang:get(<<"3星斗志"/utf8>>), rand_num = 1};
get(89040301) ->
    #gift_data{id = 89040301,
	       name = lang:get(<<"3星灵咏"/utf8>>), rand_num = 1};
get(89050301) ->
    #gift_data{id = 89050301,
	       name = lang:get(<<"3星穿甲"/utf8>>), rand_num = 1};
get(89060301) ->
    #gift_data{id = 89060301,
	       name = lang:get(<<"3星破法"/utf8>>), rand_num = 1};
get(89070301) ->
    #gift_data{id = 89070301,
	       name = lang:get(<<"3星斗战"/utf8>>), rand_num = 1};
get(89080301) ->
    #gift_data{id = 89080301,
	       name = lang:get(<<"3星镇灵"/utf8>>), rand_num = 1};
get(89090301) ->
    #gift_data{id = 89090301,
	       name = lang:get(<<"3星魔甲"/utf8>>), rand_num = 1};
get(89100301) ->
    #gift_data{id = 89100301,
	       name = lang:get(<<"3星神战"/utf8>>), rand_num = 1};
get(89110301) ->
    #gift_data{id = 89110301,
	       name = lang:get(<<"3星龙威"/utf8>>), rand_num = 1};
get(89120301) ->
    #gift_data{id = 89120301,
	       name = lang:get(<<"3星神愈"/utf8>>), rand_num = 1};
get(89130301) ->
    #gift_data{id = 89130301,
	       name = lang:get(<<"3星极速"/utf8>>), rand_num = 1};
get(89140301) ->
    #gift_data{id = 89140301,
	       name = lang:get(<<"3星玄护"/utf8>>), rand_num = 1};
get(89150301) ->
    #gift_data{id = 89150301,
	       name = lang:get(<<"3星芊佑"/utf8>>), rand_num = 1};
get(89010501) ->
    #gift_data{id = 89010501,
	       name = lang:get(<<"5星勇气"/utf8>>), rand_num = 1};
get(89020501) ->
    #gift_data{id = 89020501,
	       name = lang:get(<<"5星狂怒"/utf8>>), rand_num = 1};
get(89030501) ->
    #gift_data{id = 89030501,
	       name = lang:get(<<"5星斗志"/utf8>>), rand_num = 1};
get(89040501) ->
    #gift_data{id = 89040501,
	       name = lang:get(<<"5星灵咏"/utf8>>), rand_num = 1};
get(89050501) ->
    #gift_data{id = 89050501,
	       name = lang:get(<<"5星穿甲"/utf8>>), rand_num = 1};
get(89060501) ->
    #gift_data{id = 89060501,
	       name = lang:get(<<"5星破法"/utf8>>), rand_num = 1};
get(89070501) ->
    #gift_data{id = 89070501,
	       name = lang:get(<<"5星斗战"/utf8>>), rand_num = 1};
get(89080501) ->
    #gift_data{id = 89080501,
	       name = lang:get(<<"5星镇灵"/utf8>>), rand_num = 1};
get(89090501) ->
    #gift_data{id = 89090501,
	       name = lang:get(<<"5星魔甲"/utf8>>), rand_num = 1};
get(89100501) ->
    #gift_data{id = 89100501,
	       name = lang:get(<<"5星神战"/utf8>>), rand_num = 1};
get(89110501) ->
    #gift_data{id = 89110501,
	       name = lang:get(<<"5星龙威"/utf8>>), rand_num = 1};
get(89120501) ->
    #gift_data{id = 89120501,
	       name = lang:get(<<"5星神愈"/utf8>>), rand_num = 1};
get(89130501) ->
    #gift_data{id = 89130501,
	       name = lang:get(<<"5星极速"/utf8>>), rand_num = 1};
get(89140501) ->
    #gift_data{id = 89140501,
	       name = lang:get(<<"5星玄护"/utf8>>), rand_num = 1};
get(89150501) ->
    #gift_data{id = 89150501,
	       name = lang:get(<<"5星芊佑"/utf8>>), rand_num = 1};
get(88888251) ->
    #gift_data{id = 88888251,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{1250201, 1}, {1250202, 1}, {1250203, 1},
		    {1250204, 1}]};
get(88888252) ->
    #gift_data{id = 88888252,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{2250201, 1}, {2250202, 1}, {2250203, 1},
		    {2250204, 1}]};
get(88888253) ->
    #gift_data{id = 88888253,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{3250201, 1}, {3250202, 1}, {3250203, 1},
		    {3250204, 1}]};
get(88888254) ->
    #gift_data{id = 88888254,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{4250201, 1}, {4250202, 1}, {4250203, 1},
		    {4250204, 1}]};
get(88888255) ->
    #gift_data{id = 88888255,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{5250201, 1}, {5250202, 1}, {5250203, 1},
		    {5250204, 1}]};
get(88888256) ->
    #gift_data{id = 88888256,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{6250201, 1}, {6250202, 1}, {6250203, 1},
		    {6250204, 1}]};
get(88888257) ->
    #gift_data{id = 88888257,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{7250201, 1}, {7250202, 1}, {7250203, 1},
		    {7250204, 1}]};
get(88888258) ->
    #gift_data{id = 88888258,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{8250201, 1}, {8250202, 1}, {8250203, 1},
		    {8250204, 1}]};
get(88888259) ->
    #gift_data{id = 88888259,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{9250201, 1}, {9250202, 1}, {9250203, 1},
		    {9250204, 1}]};
get(888882510) ->
    #gift_data{id = 888882510,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{10250201, 1}, {10250202, 1}, {10250203, 1},
		    {10250204, 1}]};
get(888882511) ->
    #gift_data{id = 888882511,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{11250201, 1}, {11250202, 1}, {11250203, 1},
		    {11250204, 1}]};
get(888882512) ->
    #gift_data{id = 888882512,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{12250201, 1}, {12250202, 1}, {12250203, 1},
		    {12250204, 1}]};
get(888882513) ->
    #gift_data{id = 888882513,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{13250201, 1}, {13250202, 1}, {13250203, 1},
		    {13250204, 1}]};
get(888882514) ->
    #gift_data{id = 888882514,
	       name = lang:get(<<"Rương Trang Bị Thần 25*"/utf8>>),
	       items =
		   [{14250201, 1}, {14250202, 1}, {14250203, 1},
		    {14250204, 1}]};
get(88888301) ->
    #gift_data{id = 88888301,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{1300201, 1}, {1300202, 1}, {1300203, 1},
		    {1300204, 1}]};
get(88888302) ->
    #gift_data{id = 88888302,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{2300201, 1}, {2300202, 1}, {2300203, 1},
		    {2300204, 1}]};
get(88888303) ->
    #gift_data{id = 88888303,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{3300201, 1}, {3300202, 1}, {3300203, 1},
		    {3300204, 1}]};
get(88888304) ->
    #gift_data{id = 88888304,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{4300201, 1}, {4300202, 1}, {4300203, 1},
		    {4300204, 1}]};
get(88888305) ->
    #gift_data{id = 88888305,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{5300201, 1}, {5300202, 1}, {5300203, 1},
		    {5300204, 1}]};
get(88888306) ->
    #gift_data{id = 88888306,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{6300201, 1}, {6300202, 1}, {6300203, 1},
		    {6300204, 1}]};
get(88888307) ->
    #gift_data{id = 88888307,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{7300201, 1}, {7300202, 1}, {7300203, 1},
		    {7300204, 1}]};
get(88888308) ->
    #gift_data{id = 88888308,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{8300201, 1}, {8300202, 1}, {8300203, 1},
		    {8300204, 1}]};
get(88888309) ->
    #gift_data{id = 88888309,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{9300201, 1}, {9300202, 1}, {9300203, 1},
		    {9300204, 1}]};
get(888883010) ->
    #gift_data{id = 888883010,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{10300201, 1}, {10300202, 1}, {10300203, 1},
		    {10300204, 1}]};
get(888883011) ->
    #gift_data{id = 888883011,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{11300201, 1}, {11300202, 1}, {11300203, 1},
		    {11300204, 1}]};
get(888883012) ->
    #gift_data{id = 888883012,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{12300201, 1}, {12300202, 1}, {12300203, 1},
		    {12300204, 1}]};
get(888883013) ->
    #gift_data{id = 888883013,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{13300201, 1}, {13300202, 1}, {13300203, 1},
		    {13300204, 1}]};
get(888883014) ->
    #gift_data{id = 888883014,
	       name = lang:get(<<"Rương Trang Bị Thần 30*"/utf8>>),
	       items =
		   [{14300201, 1}, {14300202, 1}, {14300203, 1},
		    {14300204, 1}]};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      gift_data, 5674),
    undefined.

rand_list(89140501) ->
    [#gift_rand_data{id = 89140501,
		     name = lang:get(<<"5星玄护耳环"/utf8>>), bid = 14050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89140501,
		     name = lang:get(<<"5星玄护项链"/utf8>>), bid = 14050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89140501,
		     name = lang:get(<<"5星玄护戒指"/utf8>>), bid = 14050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89140501,
		     name = lang:get(<<"5星玄护手镯"/utf8>>), bid = 14050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89130501) ->
    [#gift_rand_data{id = 89130501,
		     name = lang:get(<<"5星极速耳环"/utf8>>), bid = 13050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89130501,
		     name = lang:get(<<"5星极速项链"/utf8>>), bid = 13050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89130501,
		     name = lang:get(<<"5星极速戒指"/utf8>>), bid = 13050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89130501,
		     name = lang:get(<<"5星极速手镯"/utf8>>), bid = 13050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89120501) ->
    [#gift_rand_data{id = 89120501,
		     name = lang:get(<<"5星神愈耳环"/utf8>>), bid = 12050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89120501,
		     name = lang:get(<<"5星神愈项链"/utf8>>), bid = 12050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89120501,
		     name = lang:get(<<"5星神愈戒指"/utf8>>), bid = 12050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89120501,
		     name = lang:get(<<"5星神愈手镯"/utf8>>), bid = 12050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89110501) ->
    [#gift_rand_data{id = 89110501,
		     name = lang:get(<<"5星龙威耳环"/utf8>>), bid = 11050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89110501,
		     name = lang:get(<<"5星龙威项链"/utf8>>), bid = 11050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89110501,
		     name = lang:get(<<"5星龙威戒指"/utf8>>), bid = 11050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89110501,
		     name = lang:get(<<"5星龙威手镯"/utf8>>), bid = 11050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89100501) ->
    [#gift_rand_data{id = 89100501,
		     name = lang:get(<<"5星神战耳环"/utf8>>), bid = 10050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89100501,
		     name = lang:get(<<"5星神战项链"/utf8>>), bid = 10050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89100501,
		     name = lang:get(<<"5星神战戒指"/utf8>>), bid = 10050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89100501,
		     name = lang:get(<<"5星神战手镯"/utf8>>), bid = 10050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89090501) ->
    [#gift_rand_data{id = 89090501,
		     name = lang:get(<<"5星魔甲耳环"/utf8>>), bid = 9050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89090501,
		     name = lang:get(<<"5星魔甲项链"/utf8>>), bid = 9050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89090501,
		     name = lang:get(<<"5星魔甲戒指"/utf8>>), bid = 9050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89090501,
		     name = lang:get(<<"5星魔甲手镯"/utf8>>), bid = 9050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89080501) ->
    [#gift_rand_data{id = 89080501,
		     name = lang:get(<<"5星镇灵耳环"/utf8>>), bid = 8050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89080501,
		     name = lang:get(<<"5星镇灵项链"/utf8>>), bid = 8050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89080501,
		     name = lang:get(<<"5星镇灵戒指"/utf8>>), bid = 8050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89080501,
		     name = lang:get(<<"5星镇灵手镯"/utf8>>), bid = 8050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89070501) ->
    [#gift_rand_data{id = 89070501,
		     name = lang:get(<<"5星斗战耳环"/utf8>>), bid = 7050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89070501,
		     name = lang:get(<<"5星斗战项链"/utf8>>), bid = 7050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89070501,
		     name = lang:get(<<"5星斗战戒指"/utf8>>), bid = 7050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89070501,
		     name = lang:get(<<"5星斗战手镯"/utf8>>), bid = 7050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89060501) ->
    [#gift_rand_data{id = 89060501,
		     name = lang:get(<<"5星破法耳环"/utf8>>), bid = 6050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89060501,
		     name = lang:get(<<"5星破法项链"/utf8>>), bid = 6050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89060501,
		     name = lang:get(<<"5星破法戒指"/utf8>>), bid = 6050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89060501,
		     name = lang:get(<<"5星破法手镯"/utf8>>), bid = 6050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89050501) ->
    [#gift_rand_data{id = 89050501,
		     name = lang:get(<<"5星穿甲耳环"/utf8>>), bid = 5050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89050501,
		     name = lang:get(<<"5星穿甲项链"/utf8>>), bid = 5050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89050501,
		     name = lang:get(<<"5星穿甲戒指"/utf8>>), bid = 5050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89050501,
		     name = lang:get(<<"5星穿甲手镯"/utf8>>), bid = 5050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89040501) ->
    [#gift_rand_data{id = 89040501,
		     name = lang:get(<<"5星灵咏耳环"/utf8>>), bid = 4050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89040501,
		     name = lang:get(<<"5星灵咏项链"/utf8>>), bid = 4050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89040501,
		     name = lang:get(<<"5星灵咏戒指"/utf8>>), bid = 4050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89040501,
		     name = lang:get(<<"5星灵咏手镯"/utf8>>), bid = 4050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89030501) ->
    [#gift_rand_data{id = 89030501,
		     name = lang:get(<<"5星斗志耳环"/utf8>>), bid = 3050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89030501,
		     name = lang:get(<<"5星斗志项链"/utf8>>), bid = 3050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89030501,
		     name = lang:get(<<"5星斗志戒指"/utf8>>), bid = 3050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89030501,
		     name = lang:get(<<"5星斗志手镯"/utf8>>), bid = 3050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89020501) ->
    [#gift_rand_data{id = 89020501,
		     name = lang:get(<<"5星狂怒耳环"/utf8>>), bid = 2050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89020501,
		     name = lang:get(<<"5星狂怒项链"/utf8>>), bid = 2050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89020501,
		     name = lang:get(<<"5星狂怒戒指"/utf8>>), bid = 2050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89020501,
		     name = lang:get(<<"5星狂怒手镯"/utf8>>), bid = 2050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89010501) ->
    [#gift_rand_data{id = 89010501,
		     name = lang:get(<<"5星勇气耳环"/utf8>>), bid = 1050201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89010501,
		     name = lang:get(<<"5星勇气项链"/utf8>>), bid = 1050202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89010501,
		     name = lang:get(<<"5星勇气戒指"/utf8>>), bid = 1050203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89010501,
		     name = lang:get(<<"5星勇气手镯"/utf8>>), bid = 1050204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89140301) ->
    [#gift_rand_data{id = 89140301,
		     name = lang:get(<<"3星玄护耳环"/utf8>>), bid = 14030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89140301,
		     name = lang:get(<<"3星玄护项链"/utf8>>), bid = 14030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89140301,
		     name = lang:get(<<"3星玄护戒指"/utf8>>), bid = 14030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89140301,
		     name = lang:get(<<"3星玄护手镯"/utf8>>), bid = 14030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89130301) ->
    [#gift_rand_data{id = 89130301,
		     name = lang:get(<<"3星极速耳环"/utf8>>), bid = 13030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89130301,
		     name = lang:get(<<"3星极速项链"/utf8>>), bid = 13030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89130301,
		     name = lang:get(<<"3星极速戒指"/utf8>>), bid = 13030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89130301,
		     name = lang:get(<<"3星极速手镯"/utf8>>), bid = 13030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89120301) ->
    [#gift_rand_data{id = 89120301,
		     name = lang:get(<<"3星神愈耳环"/utf8>>), bid = 12030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89120301,
		     name = lang:get(<<"3星神愈项链"/utf8>>), bid = 12030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89120301,
		     name = lang:get(<<"3星神愈戒指"/utf8>>), bid = 12030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89120301,
		     name = lang:get(<<"3星神愈手镯"/utf8>>), bid = 12030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89110301) ->
    [#gift_rand_data{id = 89110301,
		     name = lang:get(<<"3星龙威耳环"/utf8>>), bid = 11030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89110301,
		     name = lang:get(<<"3星龙威项链"/utf8>>), bid = 11030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89110301,
		     name = lang:get(<<"3星龙威戒指"/utf8>>), bid = 11030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89110301,
		     name = lang:get(<<"3星龙威手镯"/utf8>>), bid = 11030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89100301) ->
    [#gift_rand_data{id = 89100301,
		     name = lang:get(<<"3星神战耳环"/utf8>>), bid = 10030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89100301,
		     name = lang:get(<<"3星神战项链"/utf8>>), bid = 10030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89100301,
		     name = lang:get(<<"3星神战戒指"/utf8>>), bid = 10030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89100301,
		     name = lang:get(<<"3星神战手镯"/utf8>>), bid = 10030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89090301) ->
    [#gift_rand_data{id = 89090301,
		     name = lang:get(<<"3星魔甲耳环"/utf8>>), bid = 9030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89090301,
		     name = lang:get(<<"3星魔甲项链"/utf8>>), bid = 9030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89090301,
		     name = lang:get(<<"3星魔甲戒指"/utf8>>), bid = 9030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89090301,
		     name = lang:get(<<"3星魔甲手镯"/utf8>>), bid = 9030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89080301) ->
    [#gift_rand_data{id = 89080301,
		     name = lang:get(<<"3星镇灵耳环"/utf8>>), bid = 8030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89080301,
		     name = lang:get(<<"3星镇灵项链"/utf8>>), bid = 8030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89080301,
		     name = lang:get(<<"3星镇灵戒指"/utf8>>), bid = 8030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89080301,
		     name = lang:get(<<"3星镇灵手镯"/utf8>>), bid = 8030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89070301) ->
    [#gift_rand_data{id = 89070301,
		     name = lang:get(<<"3星斗战耳环"/utf8>>), bid = 7030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89070301,
		     name = lang:get(<<"3星斗战项链"/utf8>>), bid = 7030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89070301,
		     name = lang:get(<<"3星斗战戒指"/utf8>>), bid = 7030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89070301,
		     name = lang:get(<<"3星斗战手镯"/utf8>>), bid = 7030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89060301) ->
    [#gift_rand_data{id = 89060301,
		     name = lang:get(<<"3星破法耳环"/utf8>>), bid = 6030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89060301,
		     name = lang:get(<<"3星破法项链"/utf8>>), bid = 6030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89060301,
		     name = lang:get(<<"3星破法戒指"/utf8>>), bid = 6030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89060301,
		     name = lang:get(<<"3星破法手镯"/utf8>>), bid = 6030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89050301) ->
    [#gift_rand_data{id = 89050301,
		     name = lang:get(<<"3星穿甲耳环"/utf8>>), bid = 5030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89050301,
		     name = lang:get(<<"3星穿甲项链"/utf8>>), bid = 5030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89050301,
		     name = lang:get(<<"3星穿甲戒指"/utf8>>), bid = 5030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89050301,
		     name = lang:get(<<"3星穿甲手镯"/utf8>>), bid = 5030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89040301) ->
    [#gift_rand_data{id = 89040301,
		     name = lang:get(<<"3星灵咏耳环"/utf8>>), bid = 4030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89040301,
		     name = lang:get(<<"3星灵咏项链"/utf8>>), bid = 4030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89040301,
		     name = lang:get(<<"3星灵咏戒指"/utf8>>), bid = 4030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89040301,
		     name = lang:get(<<"3星灵咏手镯"/utf8>>), bid = 4030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89030301) ->
    [#gift_rand_data{id = 89030301,
		     name = lang:get(<<"3星斗志耳环"/utf8>>), bid = 3030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89030301,
		     name = lang:get(<<"3星斗志项链"/utf8>>), bid = 3030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89030301,
		     name = lang:get(<<"3星斗志戒指"/utf8>>), bid = 3030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89030301,
		     name = lang:get(<<"3星斗志手镯"/utf8>>), bid = 3030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89020301) ->
    [#gift_rand_data{id = 89020301,
		     name = lang:get(<<"3星狂怒耳环"/utf8>>), bid = 2030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89020301,
		     name = lang:get(<<"3星狂怒项链"/utf8>>), bid = 2030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89020301,
		     name = lang:get(<<"3星狂怒戒指"/utf8>>), bid = 2030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89020301,
		     name = lang:get(<<"3星狂怒手镯"/utf8>>), bid = 2030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(89010301) ->
    [#gift_rand_data{id = 89010301,
		     name = lang:get(<<"3星勇气耳环"/utf8>>), bid = 1030201,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89010301,
		     name = lang:get(<<"3星勇气项链"/utf8>>), bid = 1030202,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89010301,
		     name = lang:get(<<"3星勇气戒指"/utf8>>), bid = 1030203,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 89010301,
		     name = lang:get(<<"3星勇气手镯"/utf8>>), bid = 1030204,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99141004) ->
    [#gift_rand_data{id = 99141004,
		     name = lang:get(<<"10星玄护手镯"/utf8>>), bid = 14100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99141004,
		     name = lang:get(<<"10星玄护手镯"/utf8>>), bid = 14100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99141004,
		     name = lang:get(<<"10星玄护手镯"/utf8>>), bid = 14100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140904) ->
    [#gift_rand_data{id = 99140904,
		     name = lang:get(<<"9星玄护手镯"/utf8>>), bid = 14090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140904,
		     name = lang:get(<<"9星玄护手镯"/utf8>>), bid = 14090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140904,
		     name = lang:get(<<"9星玄护手镯"/utf8>>), bid = 14090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140804) ->
    [#gift_rand_data{id = 99140804,
		     name = lang:get(<<"8星玄护手镯"/utf8>>), bid = 14080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140804,
		     name = lang:get(<<"8星玄护手镯"/utf8>>), bid = 14080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140804,
		     name = lang:get(<<"8星玄护手镯"/utf8>>), bid = 14080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140704) ->
    [#gift_rand_data{id = 99140704,
		     name = lang:get(<<"7星玄护手镯"/utf8>>), bid = 14070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140704,
		     name = lang:get(<<"7星玄护手镯"/utf8>>), bid = 14070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140704,
		     name = lang:get(<<"7星玄护手镯"/utf8>>), bid = 14070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140604) ->
    [#gift_rand_data{id = 99140604,
		     name = lang:get(<<"6星玄护手镯"/utf8>>), bid = 14060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140604,
		     name = lang:get(<<"6星玄护手镯"/utf8>>), bid = 14060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140604,
		     name = lang:get(<<"6星玄护手镯"/utf8>>), bid = 14060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140504) ->
    [#gift_rand_data{id = 99140504,
		     name = lang:get(<<"5星玄护手镯"/utf8>>), bid = 14050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140504,
		     name = lang:get(<<"5星玄护手镯"/utf8>>), bid = 14050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140504,
		     name = lang:get(<<"5星玄护手镯"/utf8>>), bid = 14050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140404) ->
    [#gift_rand_data{id = 99140404,
		     name = lang:get(<<"4星玄护手镯"/utf8>>), bid = 14040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140404,
		     name = lang:get(<<"4星玄护手镯"/utf8>>), bid = 14040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140404,
		     name = lang:get(<<"4星玄护手镯"/utf8>>), bid = 14040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140304) ->
    [#gift_rand_data{id = 99140304,
		     name = lang:get(<<"3星玄护手镯"/utf8>>), bid = 14030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140304,
		     name = lang:get(<<"3星玄护手镯"/utf8>>), bid = 14030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140304,
		     name = lang:get(<<"3星玄护手镯"/utf8>>), bid = 14030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140204) ->
    [#gift_rand_data{id = 99140204,
		     name = lang:get(<<"2星玄护手镯"/utf8>>), bid = 14020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140204,
		     name = lang:get(<<"2星玄护手镯"/utf8>>), bid = 14020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140204,
		     name = lang:get(<<"2星玄护手镯"/utf8>>), bid = 14020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140104) ->
    [#gift_rand_data{id = 99140104,
		     name = lang:get(<<"1星玄护手镯"/utf8>>), bid = 14010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140104,
		     name = lang:get(<<"1星玄护手镯"/utf8>>), bid = 14010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140104,
		     name = lang:get(<<"1星玄护手镯"/utf8>>), bid = 14010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99141003) ->
    [#gift_rand_data{id = 99141003,
		     name = lang:get(<<"10星玄护戒指"/utf8>>), bid = 14100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99141003,
		     name = lang:get(<<"10星玄护戒指"/utf8>>), bid = 14100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99141003,
		     name = lang:get(<<"10星玄护戒指"/utf8>>), bid = 14100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140903) ->
    [#gift_rand_data{id = 99140903,
		     name = lang:get(<<"9星玄护戒指"/utf8>>), bid = 14090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140903,
		     name = lang:get(<<"9星玄护戒指"/utf8>>), bid = 14090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140903,
		     name = lang:get(<<"9星玄护戒指"/utf8>>), bid = 14090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140803) ->
    [#gift_rand_data{id = 99140803,
		     name = lang:get(<<"8星玄护戒指"/utf8>>), bid = 14080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140803,
		     name = lang:get(<<"8星玄护戒指"/utf8>>), bid = 14080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140803,
		     name = lang:get(<<"8星玄护戒指"/utf8>>), bid = 14080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140703) ->
    [#gift_rand_data{id = 99140703,
		     name = lang:get(<<"7星玄护戒指"/utf8>>), bid = 14070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140703,
		     name = lang:get(<<"7星玄护戒指"/utf8>>), bid = 14070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140703,
		     name = lang:get(<<"7星玄护戒指"/utf8>>), bid = 14070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140603) ->
    [#gift_rand_data{id = 99140603,
		     name = lang:get(<<"6星玄护戒指"/utf8>>), bid = 14060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140603,
		     name = lang:get(<<"6星玄护戒指"/utf8>>), bid = 14060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140603,
		     name = lang:get(<<"6星玄护戒指"/utf8>>), bid = 14060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140503) ->
    [#gift_rand_data{id = 99140503,
		     name = lang:get(<<"5星玄护戒指"/utf8>>), bid = 14050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140503,
		     name = lang:get(<<"5星玄护戒指"/utf8>>), bid = 14050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140503,
		     name = lang:get(<<"5星玄护戒指"/utf8>>), bid = 14050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140403) ->
    [#gift_rand_data{id = 99140403,
		     name = lang:get(<<"4星玄护戒指"/utf8>>), bid = 14040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140403,
		     name = lang:get(<<"4星玄护戒指"/utf8>>), bid = 14040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140403,
		     name = lang:get(<<"4星玄护戒指"/utf8>>), bid = 14040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140303) ->
    [#gift_rand_data{id = 99140303,
		     name = lang:get(<<"3星玄护戒指"/utf8>>), bid = 14030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140303,
		     name = lang:get(<<"3星玄护戒指"/utf8>>), bid = 14030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140303,
		     name = lang:get(<<"3星玄护戒指"/utf8>>), bid = 14030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140203) ->
    [#gift_rand_data{id = 99140203,
		     name = lang:get(<<"2星玄护戒指"/utf8>>), bid = 14020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140203,
		     name = lang:get(<<"2星玄护戒指"/utf8>>), bid = 14020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140203,
		     name = lang:get(<<"2星玄护戒指"/utf8>>), bid = 14020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140103) ->
    [#gift_rand_data{id = 99140103,
		     name = lang:get(<<"1星玄护戒指"/utf8>>), bid = 14010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140103,
		     name = lang:get(<<"1星玄护戒指"/utf8>>), bid = 14010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140103,
		     name = lang:get(<<"1星玄护戒指"/utf8>>), bid = 14010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99141002) ->
    [#gift_rand_data{id = 99141002,
		     name = lang:get(<<"10星玄护项链"/utf8>>), bid = 14100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99141002,
		     name = lang:get(<<"10星玄护项链"/utf8>>), bid = 14100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99141002,
		     name = lang:get(<<"10星玄护项链"/utf8>>), bid = 14100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140902) ->
    [#gift_rand_data{id = 99140902,
		     name = lang:get(<<"9星玄护项链"/utf8>>), bid = 14090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140902,
		     name = lang:get(<<"9星玄护项链"/utf8>>), bid = 14090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140902,
		     name = lang:get(<<"9星玄护项链"/utf8>>), bid = 14090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140802) ->
    [#gift_rand_data{id = 99140802,
		     name = lang:get(<<"8星玄护项链"/utf8>>), bid = 14080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140802,
		     name = lang:get(<<"8星玄护项链"/utf8>>), bid = 14080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140802,
		     name = lang:get(<<"8星玄护项链"/utf8>>), bid = 14080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140702) ->
    [#gift_rand_data{id = 99140702,
		     name = lang:get(<<"7星玄护项链"/utf8>>), bid = 14070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140702,
		     name = lang:get(<<"7星玄护项链"/utf8>>), bid = 14070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140702,
		     name = lang:get(<<"7星玄护项链"/utf8>>), bid = 14070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140602) ->
    [#gift_rand_data{id = 99140602,
		     name = lang:get(<<"6星玄护项链"/utf8>>), bid = 14060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140602,
		     name = lang:get(<<"6星玄护项链"/utf8>>), bid = 14060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140602,
		     name = lang:get(<<"6星玄护项链"/utf8>>), bid = 14060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140502) ->
    [#gift_rand_data{id = 99140502,
		     name = lang:get(<<"5星玄护项链"/utf8>>), bid = 14050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140502,
		     name = lang:get(<<"5星玄护项链"/utf8>>), bid = 14050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140502,
		     name = lang:get(<<"5星玄护项链"/utf8>>), bid = 14050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140402) ->
    [#gift_rand_data{id = 99140402,
		     name = lang:get(<<"4星玄护项链"/utf8>>), bid = 14040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140402,
		     name = lang:get(<<"4星玄护项链"/utf8>>), bid = 14040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140402,
		     name = lang:get(<<"4星玄护项链"/utf8>>), bid = 14040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140302) ->
    [#gift_rand_data{id = 99140302,
		     name = lang:get(<<"3星玄护项链"/utf8>>), bid = 14030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140302,
		     name = lang:get(<<"3星玄护项链"/utf8>>), bid = 14030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140302,
		     name = lang:get(<<"3星玄护项链"/utf8>>), bid = 14030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140202) ->
    [#gift_rand_data{id = 99140202,
		     name = lang:get(<<"2星玄护项链"/utf8>>), bid = 14020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140202,
		     name = lang:get(<<"2星玄护项链"/utf8>>), bid = 14020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140202,
		     name = lang:get(<<"2星玄护项链"/utf8>>), bid = 14020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140102) ->
    [#gift_rand_data{id = 99140102,
		     name = lang:get(<<"1星玄护项链"/utf8>>), bid = 14010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140102,
		     name = lang:get(<<"1星玄护项链"/utf8>>), bid = 14010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140102,
		     name = lang:get(<<"1星玄护项链"/utf8>>), bid = 14010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99141001) ->
    [#gift_rand_data{id = 99141001,
		     name = lang:get(<<"10星玄护耳环"/utf8>>), bid = 14100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99141001,
		     name = lang:get(<<"10星玄护耳环"/utf8>>), bid = 14100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99141001,
		     name = lang:get(<<"10星玄护耳环"/utf8>>), bid = 14100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140901) ->
    [#gift_rand_data{id = 99140901,
		     name = lang:get(<<"9星玄护耳环"/utf8>>), bid = 14090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140901,
		     name = lang:get(<<"9星玄护耳环"/utf8>>), bid = 14090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140901,
		     name = lang:get(<<"9星玄护耳环"/utf8>>), bid = 14090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140801) ->
    [#gift_rand_data{id = 99140801,
		     name = lang:get(<<"8星玄护耳环"/utf8>>), bid = 14080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140801,
		     name = lang:get(<<"8星玄护耳环"/utf8>>), bid = 14080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140801,
		     name = lang:get(<<"8星玄护耳环"/utf8>>), bid = 14080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140701) ->
    [#gift_rand_data{id = 99140701,
		     name = lang:get(<<"7星玄护耳环"/utf8>>), bid = 14070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140701,
		     name = lang:get(<<"7星玄护耳环"/utf8>>), bid = 14070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140701,
		     name = lang:get(<<"7星玄护耳环"/utf8>>), bid = 14070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140601) ->
    [#gift_rand_data{id = 99140601,
		     name = lang:get(<<"6星玄护耳环"/utf8>>), bid = 14060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140601,
		     name = lang:get(<<"6星玄护耳环"/utf8>>), bid = 14060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140601,
		     name = lang:get(<<"6星玄护耳环"/utf8>>), bid = 14060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140501) ->
    [#gift_rand_data{id = 99140501,
		     name = lang:get(<<"5星玄护耳环"/utf8>>), bid = 14050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140501,
		     name = lang:get(<<"5星玄护耳环"/utf8>>), bid = 14050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140501,
		     name = lang:get(<<"5星玄护耳环"/utf8>>), bid = 14050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140401) ->
    [#gift_rand_data{id = 99140401,
		     name = lang:get(<<"4星玄护耳环"/utf8>>), bid = 14040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140401,
		     name = lang:get(<<"4星玄护耳环"/utf8>>), bid = 14040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140401,
		     name = lang:get(<<"4星玄护耳环"/utf8>>), bid = 14040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140301) ->
    [#gift_rand_data{id = 99140301,
		     name = lang:get(<<"3星玄护耳环"/utf8>>), bid = 14030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140301,
		     name = lang:get(<<"3星玄护耳环"/utf8>>), bid = 14030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140301,
		     name = lang:get(<<"3星玄护耳环"/utf8>>), bid = 14030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140201) ->
    [#gift_rand_data{id = 99140201,
		     name = lang:get(<<"2星玄护耳环"/utf8>>), bid = 14020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140201,
		     name = lang:get(<<"2星玄护耳环"/utf8>>), bid = 14020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140201,
		     name = lang:get(<<"2星玄护耳环"/utf8>>), bid = 14020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99140101) ->
    [#gift_rand_data{id = 99140101,
		     name = lang:get(<<"1星玄护耳环"/utf8>>), bid = 14010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140101,
		     name = lang:get(<<"1星玄护耳环"/utf8>>), bid = 14010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99140101,
		     name = lang:get(<<"1星玄护耳环"/utf8>>), bid = 14010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99131004) ->
    [#gift_rand_data{id = 99131004,
		     name = lang:get(<<"10星极速手镯"/utf8>>), bid = 13100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99131004,
		     name = lang:get(<<"10星极速手镯"/utf8>>), bid = 13100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99131004,
		     name = lang:get(<<"10星极速手镯"/utf8>>), bid = 13100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130904) ->
    [#gift_rand_data{id = 99130904,
		     name = lang:get(<<"9星极速手镯"/utf8>>), bid = 13090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130904,
		     name = lang:get(<<"9星极速手镯"/utf8>>), bid = 13090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130904,
		     name = lang:get(<<"9星极速手镯"/utf8>>), bid = 13090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130804) ->
    [#gift_rand_data{id = 99130804,
		     name = lang:get(<<"8星极速手镯"/utf8>>), bid = 13080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130804,
		     name = lang:get(<<"8星极速手镯"/utf8>>), bid = 13080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130804,
		     name = lang:get(<<"8星极速手镯"/utf8>>), bid = 13080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130704) ->
    [#gift_rand_data{id = 99130704,
		     name = lang:get(<<"7星极速手镯"/utf8>>), bid = 13070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130704,
		     name = lang:get(<<"7星极速手镯"/utf8>>), bid = 13070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130704,
		     name = lang:get(<<"7星极速手镯"/utf8>>), bid = 13070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130604) ->
    [#gift_rand_data{id = 99130604,
		     name = lang:get(<<"6星极速手镯"/utf8>>), bid = 13060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130604,
		     name = lang:get(<<"6星极速手镯"/utf8>>), bid = 13060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130604,
		     name = lang:get(<<"6星极速手镯"/utf8>>), bid = 13060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130504) ->
    [#gift_rand_data{id = 99130504,
		     name = lang:get(<<"5星极速手镯"/utf8>>), bid = 13050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130504,
		     name = lang:get(<<"5星极速手镯"/utf8>>), bid = 13050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130504,
		     name = lang:get(<<"5星极速手镯"/utf8>>), bid = 13050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130404) ->
    [#gift_rand_data{id = 99130404,
		     name = lang:get(<<"4星极速手镯"/utf8>>), bid = 13040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130404,
		     name = lang:get(<<"4星极速手镯"/utf8>>), bid = 13040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130404,
		     name = lang:get(<<"4星极速手镯"/utf8>>), bid = 13040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130304) ->
    [#gift_rand_data{id = 99130304,
		     name = lang:get(<<"3星极速手镯"/utf8>>), bid = 13030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130304,
		     name = lang:get(<<"3星极速手镯"/utf8>>), bid = 13030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130304,
		     name = lang:get(<<"3星极速手镯"/utf8>>), bid = 13030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130204) ->
    [#gift_rand_data{id = 99130204,
		     name = lang:get(<<"2星极速手镯"/utf8>>), bid = 13020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130204,
		     name = lang:get(<<"2星极速手镯"/utf8>>), bid = 13020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130204,
		     name = lang:get(<<"2星极速手镯"/utf8>>), bid = 13020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130104) ->
    [#gift_rand_data{id = 99130104,
		     name = lang:get(<<"1星极速手镯"/utf8>>), bid = 13010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130104,
		     name = lang:get(<<"1星极速手镯"/utf8>>), bid = 13010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130104,
		     name = lang:get(<<"1星极速手镯"/utf8>>), bid = 13010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99131003) ->
    [#gift_rand_data{id = 99131003,
		     name = lang:get(<<"10星极速戒指"/utf8>>), bid = 13100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99131003,
		     name = lang:get(<<"10星极速戒指"/utf8>>), bid = 13100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99131003,
		     name = lang:get(<<"10星极速戒指"/utf8>>), bid = 13100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130903) ->
    [#gift_rand_data{id = 99130903,
		     name = lang:get(<<"9星极速戒指"/utf8>>), bid = 13090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130903,
		     name = lang:get(<<"9星极速戒指"/utf8>>), bid = 13090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130903,
		     name = lang:get(<<"9星极速戒指"/utf8>>), bid = 13090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130803) ->
    [#gift_rand_data{id = 99130803,
		     name = lang:get(<<"8星极速戒指"/utf8>>), bid = 13080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130803,
		     name = lang:get(<<"8星极速戒指"/utf8>>), bid = 13080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130803,
		     name = lang:get(<<"8星极速戒指"/utf8>>), bid = 13080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130703) ->
    [#gift_rand_data{id = 99130703,
		     name = lang:get(<<"7星极速戒指"/utf8>>), bid = 13070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130703,
		     name = lang:get(<<"7星极速戒指"/utf8>>), bid = 13070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130703,
		     name = lang:get(<<"7星极速戒指"/utf8>>), bid = 13070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130603) ->
    [#gift_rand_data{id = 99130603,
		     name = lang:get(<<"6星极速戒指"/utf8>>), bid = 13060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130603,
		     name = lang:get(<<"6星极速戒指"/utf8>>), bid = 13060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130603,
		     name = lang:get(<<"6星极速戒指"/utf8>>), bid = 13060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130503) ->
    [#gift_rand_data{id = 99130503,
		     name = lang:get(<<"5星极速戒指"/utf8>>), bid = 13050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130503,
		     name = lang:get(<<"5星极速戒指"/utf8>>), bid = 13050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130503,
		     name = lang:get(<<"5星极速戒指"/utf8>>), bid = 13050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130403) ->
    [#gift_rand_data{id = 99130403,
		     name = lang:get(<<"4星极速戒指"/utf8>>), bid = 13040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130403,
		     name = lang:get(<<"4星极速戒指"/utf8>>), bid = 13040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130403,
		     name = lang:get(<<"4星极速戒指"/utf8>>), bid = 13040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130303) ->
    [#gift_rand_data{id = 99130303,
		     name = lang:get(<<"3星极速戒指"/utf8>>), bid = 13030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130303,
		     name = lang:get(<<"3星极速戒指"/utf8>>), bid = 13030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130303,
		     name = lang:get(<<"3星极速戒指"/utf8>>), bid = 13030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130203) ->
    [#gift_rand_data{id = 99130203,
		     name = lang:get(<<"2星极速戒指"/utf8>>), bid = 13020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130203,
		     name = lang:get(<<"2星极速戒指"/utf8>>), bid = 13020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130203,
		     name = lang:get(<<"2星极速戒指"/utf8>>), bid = 13020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130103) ->
    [#gift_rand_data{id = 99130103,
		     name = lang:get(<<"1星极速戒指"/utf8>>), bid = 13010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130103,
		     name = lang:get(<<"1星极速戒指"/utf8>>), bid = 13010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130103,
		     name = lang:get(<<"1星极速戒指"/utf8>>), bid = 13010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99131002) ->
    [#gift_rand_data{id = 99131002,
		     name = lang:get(<<"10星极速项链"/utf8>>), bid = 13100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99131002,
		     name = lang:get(<<"10星极速项链"/utf8>>), bid = 13100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99131002,
		     name = lang:get(<<"10星极速项链"/utf8>>), bid = 13100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130902) ->
    [#gift_rand_data{id = 99130902,
		     name = lang:get(<<"9星极速项链"/utf8>>), bid = 13090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130902,
		     name = lang:get(<<"9星极速项链"/utf8>>), bid = 13090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130902,
		     name = lang:get(<<"9星极速项链"/utf8>>), bid = 13090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130802) ->
    [#gift_rand_data{id = 99130802,
		     name = lang:get(<<"8星极速项链"/utf8>>), bid = 13080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130802,
		     name = lang:get(<<"8星极速项链"/utf8>>), bid = 13080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130802,
		     name = lang:get(<<"8星极速项链"/utf8>>), bid = 13080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130702) ->
    [#gift_rand_data{id = 99130702,
		     name = lang:get(<<"7星极速项链"/utf8>>), bid = 13070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130702,
		     name = lang:get(<<"7星极速项链"/utf8>>), bid = 13070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130702,
		     name = lang:get(<<"7星极速项链"/utf8>>), bid = 13070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130602) ->
    [#gift_rand_data{id = 99130602,
		     name = lang:get(<<"6星极速项链"/utf8>>), bid = 13060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130602,
		     name = lang:get(<<"6星极速项链"/utf8>>), bid = 13060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130602,
		     name = lang:get(<<"6星极速项链"/utf8>>), bid = 13060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130502) ->
    [#gift_rand_data{id = 99130502,
		     name = lang:get(<<"5星极速项链"/utf8>>), bid = 13050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130502,
		     name = lang:get(<<"5星极速项链"/utf8>>), bid = 13050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130502,
		     name = lang:get(<<"5星极速项链"/utf8>>), bid = 13050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130402) ->
    [#gift_rand_data{id = 99130402,
		     name = lang:get(<<"4星极速项链"/utf8>>), bid = 13040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130402,
		     name = lang:get(<<"4星极速项链"/utf8>>), bid = 13040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130402,
		     name = lang:get(<<"4星极速项链"/utf8>>), bid = 13040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130302) ->
    [#gift_rand_data{id = 99130302,
		     name = lang:get(<<"3星极速项链"/utf8>>), bid = 13030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130302,
		     name = lang:get(<<"3星极速项链"/utf8>>), bid = 13030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130302,
		     name = lang:get(<<"3星极速项链"/utf8>>), bid = 13030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130202) ->
    [#gift_rand_data{id = 99130202,
		     name = lang:get(<<"2星极速项链"/utf8>>), bid = 13020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130202,
		     name = lang:get(<<"2星极速项链"/utf8>>), bid = 13020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130202,
		     name = lang:get(<<"2星极速项链"/utf8>>), bid = 13020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130102) ->
    [#gift_rand_data{id = 99130102,
		     name = lang:get(<<"1星极速项链"/utf8>>), bid = 13010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130102,
		     name = lang:get(<<"1星极速项链"/utf8>>), bid = 13010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130102,
		     name = lang:get(<<"1星极速项链"/utf8>>), bid = 13010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99131001) ->
    [#gift_rand_data{id = 99131001,
		     name = lang:get(<<"10星极速耳环"/utf8>>), bid = 13100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99131001,
		     name = lang:get(<<"10星极速耳环"/utf8>>), bid = 13100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99131001,
		     name = lang:get(<<"10星极速耳环"/utf8>>), bid = 13100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130901) ->
    [#gift_rand_data{id = 99130901,
		     name = lang:get(<<"9星极速耳环"/utf8>>), bid = 13090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130901,
		     name = lang:get(<<"9星极速耳环"/utf8>>), bid = 13090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130901,
		     name = lang:get(<<"9星极速耳环"/utf8>>), bid = 13090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130801) ->
    [#gift_rand_data{id = 99130801,
		     name = lang:get(<<"8星极速耳环"/utf8>>), bid = 13080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130801,
		     name = lang:get(<<"8星极速耳环"/utf8>>), bid = 13080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130801,
		     name = lang:get(<<"8星极速耳环"/utf8>>), bid = 13080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130701) ->
    [#gift_rand_data{id = 99130701,
		     name = lang:get(<<"7星极速耳环"/utf8>>), bid = 13070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130701,
		     name = lang:get(<<"7星极速耳环"/utf8>>), bid = 13070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130701,
		     name = lang:get(<<"7星极速耳环"/utf8>>), bid = 13070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130601) ->
    [#gift_rand_data{id = 99130601,
		     name = lang:get(<<"6星极速耳环"/utf8>>), bid = 13060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130601,
		     name = lang:get(<<"6星极速耳环"/utf8>>), bid = 13060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130601,
		     name = lang:get(<<"6星极速耳环"/utf8>>), bid = 13060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130501) ->
    [#gift_rand_data{id = 99130501,
		     name = lang:get(<<"5星极速耳环"/utf8>>), bid = 13050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130501,
		     name = lang:get(<<"5星极速耳环"/utf8>>), bid = 13050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130501,
		     name = lang:get(<<"5星极速耳环"/utf8>>), bid = 13050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130401) ->
    [#gift_rand_data{id = 99130401,
		     name = lang:get(<<"4星极速耳环"/utf8>>), bid = 13040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130401,
		     name = lang:get(<<"4星极速耳环"/utf8>>), bid = 13040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130401,
		     name = lang:get(<<"4星极速耳环"/utf8>>), bid = 13040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130301) ->
    [#gift_rand_data{id = 99130301,
		     name = lang:get(<<"3星极速耳环"/utf8>>), bid = 13030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130301,
		     name = lang:get(<<"3星极速耳环"/utf8>>), bid = 13030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130301,
		     name = lang:get(<<"3星极速耳环"/utf8>>), bid = 13030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130201) ->
    [#gift_rand_data{id = 99130201,
		     name = lang:get(<<"2星极速耳环"/utf8>>), bid = 13020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130201,
		     name = lang:get(<<"2星极速耳环"/utf8>>), bid = 13020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130201,
		     name = lang:get(<<"2星极速耳环"/utf8>>), bid = 13020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99130101) ->
    [#gift_rand_data{id = 99130101,
		     name = lang:get(<<"1星极速耳环"/utf8>>), bid = 13010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130101,
		     name = lang:get(<<"1星极速耳环"/utf8>>), bid = 13010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99130101,
		     name = lang:get(<<"1星极速耳环"/utf8>>), bid = 13010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99121004) ->
    [#gift_rand_data{id = 99121004,
		     name = lang:get(<<"10星神愈手镯"/utf8>>), bid = 12100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99121004,
		     name = lang:get(<<"10星神愈手镯"/utf8>>), bid = 12100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99121004,
		     name = lang:get(<<"10星神愈手镯"/utf8>>), bid = 12100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120904) ->
    [#gift_rand_data{id = 99120904,
		     name = lang:get(<<"9星神愈手镯"/utf8>>), bid = 12090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120904,
		     name = lang:get(<<"9星神愈手镯"/utf8>>), bid = 12090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120904,
		     name = lang:get(<<"9星神愈手镯"/utf8>>), bid = 12090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120804) ->
    [#gift_rand_data{id = 99120804,
		     name = lang:get(<<"8星神愈手镯"/utf8>>), bid = 12080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120804,
		     name = lang:get(<<"8星神愈手镯"/utf8>>), bid = 12080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120804,
		     name = lang:get(<<"8星神愈手镯"/utf8>>), bid = 12080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120704) ->
    [#gift_rand_data{id = 99120704,
		     name = lang:get(<<"7星神愈手镯"/utf8>>), bid = 12070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120704,
		     name = lang:get(<<"7星神愈手镯"/utf8>>), bid = 12070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120704,
		     name = lang:get(<<"7星神愈手镯"/utf8>>), bid = 12070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120604) ->
    [#gift_rand_data{id = 99120604,
		     name = lang:get(<<"6星神愈手镯"/utf8>>), bid = 12060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120604,
		     name = lang:get(<<"6星神愈手镯"/utf8>>), bid = 12060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120604,
		     name = lang:get(<<"6星神愈手镯"/utf8>>), bid = 12060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120504) ->
    [#gift_rand_data{id = 99120504,
		     name = lang:get(<<"5星神愈手镯"/utf8>>), bid = 12050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120504,
		     name = lang:get(<<"5星神愈手镯"/utf8>>), bid = 12050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120504,
		     name = lang:get(<<"5星神愈手镯"/utf8>>), bid = 12050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120404) ->
    [#gift_rand_data{id = 99120404,
		     name = lang:get(<<"4星神愈手镯"/utf8>>), bid = 12040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120404,
		     name = lang:get(<<"4星神愈手镯"/utf8>>), bid = 12040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120404,
		     name = lang:get(<<"4星神愈手镯"/utf8>>), bid = 12040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120304) ->
    [#gift_rand_data{id = 99120304,
		     name = lang:get(<<"3星神愈手镯"/utf8>>), bid = 12030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120304,
		     name = lang:get(<<"3星神愈手镯"/utf8>>), bid = 12030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120304,
		     name = lang:get(<<"3星神愈手镯"/utf8>>), bid = 12030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120204) ->
    [#gift_rand_data{id = 99120204,
		     name = lang:get(<<"2星神愈手镯"/utf8>>), bid = 12020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120204,
		     name = lang:get(<<"2星神愈手镯"/utf8>>), bid = 12020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120204,
		     name = lang:get(<<"2星神愈手镯"/utf8>>), bid = 12020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120104) ->
    [#gift_rand_data{id = 99120104,
		     name = lang:get(<<"1星神愈手镯"/utf8>>), bid = 12010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120104,
		     name = lang:get(<<"1星神愈手镯"/utf8>>), bid = 12010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120104,
		     name = lang:get(<<"1星神愈手镯"/utf8>>), bid = 12010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99121003) ->
    [#gift_rand_data{id = 99121003,
		     name = lang:get(<<"10星神愈戒指"/utf8>>), bid = 12100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99121003,
		     name = lang:get(<<"10星神愈戒指"/utf8>>), bid = 12100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99121003,
		     name = lang:get(<<"10星神愈戒指"/utf8>>), bid = 12100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120903) ->
    [#gift_rand_data{id = 99120903,
		     name = lang:get(<<"9星神愈戒指"/utf8>>), bid = 12090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120903,
		     name = lang:get(<<"9星神愈戒指"/utf8>>), bid = 12090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120903,
		     name = lang:get(<<"9星神愈戒指"/utf8>>), bid = 12090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120803) ->
    [#gift_rand_data{id = 99120803,
		     name = lang:get(<<"8星神愈戒指"/utf8>>), bid = 12080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120803,
		     name = lang:get(<<"8星神愈戒指"/utf8>>), bid = 12080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120803,
		     name = lang:get(<<"8星神愈戒指"/utf8>>), bid = 12080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120703) ->
    [#gift_rand_data{id = 99120703,
		     name = lang:get(<<"7星神愈戒指"/utf8>>), bid = 12070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120703,
		     name = lang:get(<<"7星神愈戒指"/utf8>>), bid = 12070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120703,
		     name = lang:get(<<"7星神愈戒指"/utf8>>), bid = 12070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120603) ->
    [#gift_rand_data{id = 99120603,
		     name = lang:get(<<"6星神愈戒指"/utf8>>), bid = 12060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120603,
		     name = lang:get(<<"6星神愈戒指"/utf8>>), bid = 12060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120603,
		     name = lang:get(<<"6星神愈戒指"/utf8>>), bid = 12060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120503) ->
    [#gift_rand_data{id = 99120503,
		     name = lang:get(<<"5星神愈戒指"/utf8>>), bid = 12050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120503,
		     name = lang:get(<<"5星神愈戒指"/utf8>>), bid = 12050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120503,
		     name = lang:get(<<"5星神愈戒指"/utf8>>), bid = 12050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120403) ->
    [#gift_rand_data{id = 99120403,
		     name = lang:get(<<"4星神愈戒指"/utf8>>), bid = 12040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120403,
		     name = lang:get(<<"4星神愈戒指"/utf8>>), bid = 12040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120403,
		     name = lang:get(<<"4星神愈戒指"/utf8>>), bid = 12040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120303) ->
    [#gift_rand_data{id = 99120303,
		     name = lang:get(<<"3星神愈戒指"/utf8>>), bid = 12030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120303,
		     name = lang:get(<<"3星神愈戒指"/utf8>>), bid = 12030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120303,
		     name = lang:get(<<"3星神愈戒指"/utf8>>), bid = 12030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120203) ->
    [#gift_rand_data{id = 99120203,
		     name = lang:get(<<"2星神愈戒指"/utf8>>), bid = 12020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120203,
		     name = lang:get(<<"2星神愈戒指"/utf8>>), bid = 12020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120203,
		     name = lang:get(<<"2星神愈戒指"/utf8>>), bid = 12020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120103) ->
    [#gift_rand_data{id = 99120103,
		     name = lang:get(<<"1星神愈戒指"/utf8>>), bid = 12010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120103,
		     name = lang:get(<<"1星神愈戒指"/utf8>>), bid = 12010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120103,
		     name = lang:get(<<"1星神愈戒指"/utf8>>), bid = 12010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99121002) ->
    [#gift_rand_data{id = 99121002,
		     name = lang:get(<<"10星神愈项链"/utf8>>), bid = 12100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99121002,
		     name = lang:get(<<"10星神愈项链"/utf8>>), bid = 12100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99121002,
		     name = lang:get(<<"10星神愈项链"/utf8>>), bid = 12100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120902) ->
    [#gift_rand_data{id = 99120902,
		     name = lang:get(<<"9星神愈项链"/utf8>>), bid = 12090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120902,
		     name = lang:get(<<"9星神愈项链"/utf8>>), bid = 12090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120902,
		     name = lang:get(<<"9星神愈项链"/utf8>>), bid = 12090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120802) ->
    [#gift_rand_data{id = 99120802,
		     name = lang:get(<<"8星神愈项链"/utf8>>), bid = 12080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120802,
		     name = lang:get(<<"8星神愈项链"/utf8>>), bid = 12080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120802,
		     name = lang:get(<<"8星神愈项链"/utf8>>), bid = 12080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120702) ->
    [#gift_rand_data{id = 99120702,
		     name = lang:get(<<"7星神愈项链"/utf8>>), bid = 12070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120702,
		     name = lang:get(<<"7星神愈项链"/utf8>>), bid = 12070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120702,
		     name = lang:get(<<"7星神愈项链"/utf8>>), bid = 12070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120602) ->
    [#gift_rand_data{id = 99120602,
		     name = lang:get(<<"6星神愈项链"/utf8>>), bid = 12060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120602,
		     name = lang:get(<<"6星神愈项链"/utf8>>), bid = 12060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120602,
		     name = lang:get(<<"6星神愈项链"/utf8>>), bid = 12060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120502) ->
    [#gift_rand_data{id = 99120502,
		     name = lang:get(<<"5星神愈项链"/utf8>>), bid = 12050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120502,
		     name = lang:get(<<"5星神愈项链"/utf8>>), bid = 12050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120502,
		     name = lang:get(<<"5星神愈项链"/utf8>>), bid = 12050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120402) ->
    [#gift_rand_data{id = 99120402,
		     name = lang:get(<<"4星神愈项链"/utf8>>), bid = 12040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120402,
		     name = lang:get(<<"4星神愈项链"/utf8>>), bid = 12040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120402,
		     name = lang:get(<<"4星神愈项链"/utf8>>), bid = 12040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120302) ->
    [#gift_rand_data{id = 99120302,
		     name = lang:get(<<"3星神愈项链"/utf8>>), bid = 12030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120302,
		     name = lang:get(<<"3星神愈项链"/utf8>>), bid = 12030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120302,
		     name = lang:get(<<"3星神愈项链"/utf8>>), bid = 12030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120202) ->
    [#gift_rand_data{id = 99120202,
		     name = lang:get(<<"2星神愈项链"/utf8>>), bid = 12020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120202,
		     name = lang:get(<<"2星神愈项链"/utf8>>), bid = 12020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120202,
		     name = lang:get(<<"2星神愈项链"/utf8>>), bid = 12020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120102) ->
    [#gift_rand_data{id = 99120102,
		     name = lang:get(<<"1星神愈项链"/utf8>>), bid = 12010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120102,
		     name = lang:get(<<"1星神愈项链"/utf8>>), bid = 12010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120102,
		     name = lang:get(<<"1星神愈项链"/utf8>>), bid = 12010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99121001) ->
    [#gift_rand_data{id = 99121001,
		     name = lang:get(<<"10星神愈耳环"/utf8>>), bid = 12100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99121001,
		     name = lang:get(<<"10星神愈耳环"/utf8>>), bid = 12100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99121001,
		     name = lang:get(<<"10星神愈耳环"/utf8>>), bid = 12100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120901) ->
    [#gift_rand_data{id = 99120901,
		     name = lang:get(<<"9星神愈耳环"/utf8>>), bid = 12090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120901,
		     name = lang:get(<<"9星神愈耳环"/utf8>>), bid = 12090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120901,
		     name = lang:get(<<"9星神愈耳环"/utf8>>), bid = 12090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120801) ->
    [#gift_rand_data{id = 99120801,
		     name = lang:get(<<"8星神愈耳环"/utf8>>), bid = 12080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120801,
		     name = lang:get(<<"8星神愈耳环"/utf8>>), bid = 12080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120801,
		     name = lang:get(<<"8星神愈耳环"/utf8>>), bid = 12080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120701) ->
    [#gift_rand_data{id = 99120701,
		     name = lang:get(<<"7星神愈耳环"/utf8>>), bid = 12070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120701,
		     name = lang:get(<<"7星神愈耳环"/utf8>>), bid = 12070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120701,
		     name = lang:get(<<"7星神愈耳环"/utf8>>), bid = 12070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120601) ->
    [#gift_rand_data{id = 99120601,
		     name = lang:get(<<"6星神愈耳环"/utf8>>), bid = 12060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120601,
		     name = lang:get(<<"6星神愈耳环"/utf8>>), bid = 12060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120601,
		     name = lang:get(<<"6星神愈耳环"/utf8>>), bid = 12060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120501) ->
    [#gift_rand_data{id = 99120501,
		     name = lang:get(<<"5星神愈耳环"/utf8>>), bid = 12050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120501,
		     name = lang:get(<<"5星神愈耳环"/utf8>>), bid = 12050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120501,
		     name = lang:get(<<"5星神愈耳环"/utf8>>), bid = 12050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120401) ->
    [#gift_rand_data{id = 99120401,
		     name = lang:get(<<"4星神愈耳环"/utf8>>), bid = 12040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120401,
		     name = lang:get(<<"4星神愈耳环"/utf8>>), bid = 12040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120401,
		     name = lang:get(<<"4星神愈耳环"/utf8>>), bid = 12040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120301) ->
    [#gift_rand_data{id = 99120301,
		     name = lang:get(<<"3星神愈耳环"/utf8>>), bid = 12030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120301,
		     name = lang:get(<<"3星神愈耳环"/utf8>>), bid = 12030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120301,
		     name = lang:get(<<"3星神愈耳环"/utf8>>), bid = 12030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120201) ->
    [#gift_rand_data{id = 99120201,
		     name = lang:get(<<"2星神愈耳环"/utf8>>), bid = 12020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120201,
		     name = lang:get(<<"2星神愈耳环"/utf8>>), bid = 12020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120201,
		     name = lang:get(<<"2星神愈耳环"/utf8>>), bid = 12020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99120101) ->
    [#gift_rand_data{id = 99120101,
		     name = lang:get(<<"1星神愈耳环"/utf8>>), bid = 12010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120101,
		     name = lang:get(<<"1星神愈耳环"/utf8>>), bid = 12010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99120101,
		     name = lang:get(<<"1星神愈耳环"/utf8>>), bid = 12010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99111004) ->
    [#gift_rand_data{id = 99111004,
		     name = lang:get(<<"10星龙威手镯"/utf8>>), bid = 11100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99111004,
		     name = lang:get(<<"10星龙威手镯"/utf8>>), bid = 11100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99111004,
		     name = lang:get(<<"10星龙威手镯"/utf8>>), bid = 11100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110904) ->
    [#gift_rand_data{id = 99110904,
		     name = lang:get(<<"9星龙威手镯"/utf8>>), bid = 11090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110904,
		     name = lang:get(<<"9星龙威手镯"/utf8>>), bid = 11090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110904,
		     name = lang:get(<<"9星龙威手镯"/utf8>>), bid = 11090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110804) ->
    [#gift_rand_data{id = 99110804,
		     name = lang:get(<<"8星龙威手镯"/utf8>>), bid = 11080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110804,
		     name = lang:get(<<"8星龙威手镯"/utf8>>), bid = 11080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110804,
		     name = lang:get(<<"8星龙威手镯"/utf8>>), bid = 11080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110704) ->
    [#gift_rand_data{id = 99110704,
		     name = lang:get(<<"7星龙威手镯"/utf8>>), bid = 11070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110704,
		     name = lang:get(<<"7星龙威手镯"/utf8>>), bid = 11070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110704,
		     name = lang:get(<<"7星龙威手镯"/utf8>>), bid = 11070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110604) ->
    [#gift_rand_data{id = 99110604,
		     name = lang:get(<<"6星龙威手镯"/utf8>>), bid = 11060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110604,
		     name = lang:get(<<"6星龙威手镯"/utf8>>), bid = 11060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110604,
		     name = lang:get(<<"6星龙威手镯"/utf8>>), bid = 11060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110504) ->
    [#gift_rand_data{id = 99110504,
		     name = lang:get(<<"5星龙威手镯"/utf8>>), bid = 11050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110504,
		     name = lang:get(<<"5星龙威手镯"/utf8>>), bid = 11050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110504,
		     name = lang:get(<<"5星龙威手镯"/utf8>>), bid = 11050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110404) ->
    [#gift_rand_data{id = 99110404,
		     name = lang:get(<<"4星龙威手镯"/utf8>>), bid = 11040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110404,
		     name = lang:get(<<"4星龙威手镯"/utf8>>), bid = 11040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110404,
		     name = lang:get(<<"4星龙威手镯"/utf8>>), bid = 11040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110304) ->
    [#gift_rand_data{id = 99110304,
		     name = lang:get(<<"3星龙威手镯"/utf8>>), bid = 11030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110304,
		     name = lang:get(<<"3星龙威手镯"/utf8>>), bid = 11030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110304,
		     name = lang:get(<<"3星龙威手镯"/utf8>>), bid = 11030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110204) ->
    [#gift_rand_data{id = 99110204,
		     name = lang:get(<<"2星龙威手镯"/utf8>>), bid = 11020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110204,
		     name = lang:get(<<"2星龙威手镯"/utf8>>), bid = 11020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110204,
		     name = lang:get(<<"2星龙威手镯"/utf8>>), bid = 11020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110104) ->
    [#gift_rand_data{id = 99110104,
		     name = lang:get(<<"1星龙威手镯"/utf8>>), bid = 11010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110104,
		     name = lang:get(<<"1星龙威手镯"/utf8>>), bid = 11010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110104,
		     name = lang:get(<<"1星龙威手镯"/utf8>>), bid = 11010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99111003) ->
    [#gift_rand_data{id = 99111003,
		     name = lang:get(<<"10星龙威戒指"/utf8>>), bid = 11100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99111003,
		     name = lang:get(<<"10星龙威戒指"/utf8>>), bid = 11100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99111003,
		     name = lang:get(<<"10星龙威戒指"/utf8>>), bid = 11100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110903) ->
    [#gift_rand_data{id = 99110903,
		     name = lang:get(<<"9星龙威戒指"/utf8>>), bid = 11090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110903,
		     name = lang:get(<<"9星龙威戒指"/utf8>>), bid = 11090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110903,
		     name = lang:get(<<"9星龙威戒指"/utf8>>), bid = 11090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110803) ->
    [#gift_rand_data{id = 99110803,
		     name = lang:get(<<"8星龙威戒指"/utf8>>), bid = 11080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110803,
		     name = lang:get(<<"8星龙威戒指"/utf8>>), bid = 11080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110803,
		     name = lang:get(<<"8星龙威戒指"/utf8>>), bid = 11080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110703) ->
    [#gift_rand_data{id = 99110703,
		     name = lang:get(<<"7星龙威戒指"/utf8>>), bid = 11070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110703,
		     name = lang:get(<<"7星龙威戒指"/utf8>>), bid = 11070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110703,
		     name = lang:get(<<"7星龙威戒指"/utf8>>), bid = 11070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110603) ->
    [#gift_rand_data{id = 99110603,
		     name = lang:get(<<"6星龙威戒指"/utf8>>), bid = 11060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110603,
		     name = lang:get(<<"6星龙威戒指"/utf8>>), bid = 11060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110603,
		     name = lang:get(<<"6星龙威戒指"/utf8>>), bid = 11060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110503) ->
    [#gift_rand_data{id = 99110503,
		     name = lang:get(<<"5星龙威戒指"/utf8>>), bid = 11050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110503,
		     name = lang:get(<<"5星龙威戒指"/utf8>>), bid = 11050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110503,
		     name = lang:get(<<"5星龙威戒指"/utf8>>), bid = 11050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110403) ->
    [#gift_rand_data{id = 99110403,
		     name = lang:get(<<"4星龙威戒指"/utf8>>), bid = 11040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110403,
		     name = lang:get(<<"4星龙威戒指"/utf8>>), bid = 11040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110403,
		     name = lang:get(<<"4星龙威戒指"/utf8>>), bid = 11040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110303) ->
    [#gift_rand_data{id = 99110303,
		     name = lang:get(<<"3星龙威戒指"/utf8>>), bid = 11030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110303,
		     name = lang:get(<<"3星龙威戒指"/utf8>>), bid = 11030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110303,
		     name = lang:get(<<"3星龙威戒指"/utf8>>), bid = 11030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110203) ->
    [#gift_rand_data{id = 99110203,
		     name = lang:get(<<"2星龙威戒指"/utf8>>), bid = 11020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110203,
		     name = lang:get(<<"2星龙威戒指"/utf8>>), bid = 11020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110203,
		     name = lang:get(<<"2星龙威戒指"/utf8>>), bid = 11020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110103) ->
    [#gift_rand_data{id = 99110103,
		     name = lang:get(<<"1星龙威戒指"/utf8>>), bid = 11010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110103,
		     name = lang:get(<<"1星龙威戒指"/utf8>>), bid = 11010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110103,
		     name = lang:get(<<"1星龙威戒指"/utf8>>), bid = 11010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99111002) ->
    [#gift_rand_data{id = 99111002,
		     name = lang:get(<<"10星龙威项链"/utf8>>), bid = 11100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99111002,
		     name = lang:get(<<"10星龙威项链"/utf8>>), bid = 11100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99111002,
		     name = lang:get(<<"10星龙威项链"/utf8>>), bid = 11100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110902) ->
    [#gift_rand_data{id = 99110902,
		     name = lang:get(<<"9星龙威项链"/utf8>>), bid = 11090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110902,
		     name = lang:get(<<"9星龙威项链"/utf8>>), bid = 11090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110902,
		     name = lang:get(<<"9星龙威项链"/utf8>>), bid = 11090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110802) ->
    [#gift_rand_data{id = 99110802,
		     name = lang:get(<<"8星龙威项链"/utf8>>), bid = 11080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110802,
		     name = lang:get(<<"8星龙威项链"/utf8>>), bid = 11080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110802,
		     name = lang:get(<<"8星龙威项链"/utf8>>), bid = 11080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110702) ->
    [#gift_rand_data{id = 99110702,
		     name = lang:get(<<"7星龙威项链"/utf8>>), bid = 11070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110702,
		     name = lang:get(<<"7星龙威项链"/utf8>>), bid = 11070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110702,
		     name = lang:get(<<"7星龙威项链"/utf8>>), bid = 11070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110602) ->
    [#gift_rand_data{id = 99110602,
		     name = lang:get(<<"6星龙威项链"/utf8>>), bid = 11060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110602,
		     name = lang:get(<<"6星龙威项链"/utf8>>), bid = 11060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110602,
		     name = lang:get(<<"6星龙威项链"/utf8>>), bid = 11060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110502) ->
    [#gift_rand_data{id = 99110502,
		     name = lang:get(<<"5星龙威项链"/utf8>>), bid = 11050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110502,
		     name = lang:get(<<"5星龙威项链"/utf8>>), bid = 11050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110502,
		     name = lang:get(<<"5星龙威项链"/utf8>>), bid = 11050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110402) ->
    [#gift_rand_data{id = 99110402,
		     name = lang:get(<<"4星龙威项链"/utf8>>), bid = 11040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110402,
		     name = lang:get(<<"4星龙威项链"/utf8>>), bid = 11040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110402,
		     name = lang:get(<<"4星龙威项链"/utf8>>), bid = 11040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110302) ->
    [#gift_rand_data{id = 99110302,
		     name = lang:get(<<"3星龙威项链"/utf8>>), bid = 11030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110302,
		     name = lang:get(<<"3星龙威项链"/utf8>>), bid = 11030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110302,
		     name = lang:get(<<"3星龙威项链"/utf8>>), bid = 11030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110202) ->
    [#gift_rand_data{id = 99110202,
		     name = lang:get(<<"2星龙威项链"/utf8>>), bid = 11020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110202,
		     name = lang:get(<<"2星龙威项链"/utf8>>), bid = 11020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110202,
		     name = lang:get(<<"2星龙威项链"/utf8>>), bid = 11020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110102) ->
    [#gift_rand_data{id = 99110102,
		     name = lang:get(<<"1星龙威项链"/utf8>>), bid = 11010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110102,
		     name = lang:get(<<"1星龙威项链"/utf8>>), bid = 11010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110102,
		     name = lang:get(<<"1星龙威项链"/utf8>>), bid = 11010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99111001) ->
    [#gift_rand_data{id = 99111001,
		     name = lang:get(<<"10星龙威耳环"/utf8>>), bid = 11100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99111001,
		     name = lang:get(<<"10星龙威耳环"/utf8>>), bid = 11100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99111001,
		     name = lang:get(<<"10星龙威耳环"/utf8>>), bid = 11100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110901) ->
    [#gift_rand_data{id = 99110901,
		     name = lang:get(<<"9星龙威耳环"/utf8>>), bid = 11090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110901,
		     name = lang:get(<<"9星龙威耳环"/utf8>>), bid = 11090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110901,
		     name = lang:get(<<"9星龙威耳环"/utf8>>), bid = 11090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110801) ->
    [#gift_rand_data{id = 99110801,
		     name = lang:get(<<"8星龙威耳环"/utf8>>), bid = 11080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110801,
		     name = lang:get(<<"8星龙威耳环"/utf8>>), bid = 11080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110801,
		     name = lang:get(<<"8星龙威耳环"/utf8>>), bid = 11080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110701) ->
    [#gift_rand_data{id = 99110701,
		     name = lang:get(<<"7星龙威耳环"/utf8>>), bid = 11070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110701,
		     name = lang:get(<<"7星龙威耳环"/utf8>>), bid = 11070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110701,
		     name = lang:get(<<"7星龙威耳环"/utf8>>), bid = 11070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110601) ->
    [#gift_rand_data{id = 99110601,
		     name = lang:get(<<"6星龙威耳环"/utf8>>), bid = 11060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110601,
		     name = lang:get(<<"6星龙威耳环"/utf8>>), bid = 11060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110601,
		     name = lang:get(<<"6星龙威耳环"/utf8>>), bid = 11060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110501) ->
    [#gift_rand_data{id = 99110501,
		     name = lang:get(<<"5星龙威耳环"/utf8>>), bid = 11050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110501,
		     name = lang:get(<<"5星龙威耳环"/utf8>>), bid = 11050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110501,
		     name = lang:get(<<"5星龙威耳环"/utf8>>), bid = 11050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110401) ->
    [#gift_rand_data{id = 99110401,
		     name = lang:get(<<"4星龙威耳环"/utf8>>), bid = 11040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110401,
		     name = lang:get(<<"4星龙威耳环"/utf8>>), bid = 11040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110401,
		     name = lang:get(<<"4星龙威耳环"/utf8>>), bid = 11040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110301) ->
    [#gift_rand_data{id = 99110301,
		     name = lang:get(<<"3星龙威耳环"/utf8>>), bid = 11030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110301,
		     name = lang:get(<<"3星龙威耳环"/utf8>>), bid = 11030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110301,
		     name = lang:get(<<"3星龙威耳环"/utf8>>), bid = 11030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110201) ->
    [#gift_rand_data{id = 99110201,
		     name = lang:get(<<"2星龙威耳环"/utf8>>), bid = 11020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110201,
		     name = lang:get(<<"2星龙威耳环"/utf8>>), bid = 11020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110201,
		     name = lang:get(<<"2星龙威耳环"/utf8>>), bid = 11020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99110101) ->
    [#gift_rand_data{id = 99110101,
		     name = lang:get(<<"1星龙威耳环"/utf8>>), bid = 11010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110101,
		     name = lang:get(<<"1星龙威耳环"/utf8>>), bid = 11010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99110101,
		     name = lang:get(<<"1星龙威耳环"/utf8>>), bid = 11010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99101004) ->
    [#gift_rand_data{id = 99101004,
		     name = lang:get(<<"10星神战手镯"/utf8>>), bid = 10100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99101004,
		     name = lang:get(<<"10星神战手镯"/utf8>>), bid = 10100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99101004,
		     name = lang:get(<<"10星神战手镯"/utf8>>), bid = 10100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100904) ->
    [#gift_rand_data{id = 99100904,
		     name = lang:get(<<"9星神战手镯"/utf8>>), bid = 10090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100904,
		     name = lang:get(<<"9星神战手镯"/utf8>>), bid = 10090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100904,
		     name = lang:get(<<"9星神战手镯"/utf8>>), bid = 10090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100804) ->
    [#gift_rand_data{id = 99100804,
		     name = lang:get(<<"8星神战手镯"/utf8>>), bid = 10080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100804,
		     name = lang:get(<<"8星神战手镯"/utf8>>), bid = 10080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100804,
		     name = lang:get(<<"8星神战手镯"/utf8>>), bid = 10080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100704) ->
    [#gift_rand_data{id = 99100704,
		     name = lang:get(<<"7星神战手镯"/utf8>>), bid = 10070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100704,
		     name = lang:get(<<"7星神战手镯"/utf8>>), bid = 10070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100704,
		     name = lang:get(<<"7星神战手镯"/utf8>>), bid = 10070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100604) ->
    [#gift_rand_data{id = 99100604,
		     name = lang:get(<<"6星神战手镯"/utf8>>), bid = 10060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100604,
		     name = lang:get(<<"6星神战手镯"/utf8>>), bid = 10060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100604,
		     name = lang:get(<<"6星神战手镯"/utf8>>), bid = 10060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100504) ->
    [#gift_rand_data{id = 99100504,
		     name = lang:get(<<"5星神战手镯"/utf8>>), bid = 10050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100504,
		     name = lang:get(<<"5星神战手镯"/utf8>>), bid = 10050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100504,
		     name = lang:get(<<"5星神战手镯"/utf8>>), bid = 10050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100404) ->
    [#gift_rand_data{id = 99100404,
		     name = lang:get(<<"4星神战手镯"/utf8>>), bid = 10040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100404,
		     name = lang:get(<<"4星神战手镯"/utf8>>), bid = 10040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100404,
		     name = lang:get(<<"4星神战手镯"/utf8>>), bid = 10040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100304) ->
    [#gift_rand_data{id = 99100304,
		     name = lang:get(<<"3星神战手镯"/utf8>>), bid = 10030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100304,
		     name = lang:get(<<"3星神战手镯"/utf8>>), bid = 10030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100304,
		     name = lang:get(<<"3星神战手镯"/utf8>>), bid = 10030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100204) ->
    [#gift_rand_data{id = 99100204,
		     name = lang:get(<<"2星神战手镯"/utf8>>), bid = 10020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100204,
		     name = lang:get(<<"2星神战手镯"/utf8>>), bid = 10020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100204,
		     name = lang:get(<<"2星神战手镯"/utf8>>), bid = 10020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100104) ->
    [#gift_rand_data{id = 99100104,
		     name = lang:get(<<"1星神战手镯"/utf8>>), bid = 10010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100104,
		     name = lang:get(<<"1星神战手镯"/utf8>>), bid = 10010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100104,
		     name = lang:get(<<"1星神战手镯"/utf8>>), bid = 10010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99101003) ->
    [#gift_rand_data{id = 99101003,
		     name = lang:get(<<"10星神战戒指"/utf8>>), bid = 10100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99101003,
		     name = lang:get(<<"10星神战戒指"/utf8>>), bid = 10100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99101003,
		     name = lang:get(<<"10星神战戒指"/utf8>>), bid = 10100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100903) ->
    [#gift_rand_data{id = 99100903,
		     name = lang:get(<<"9星神战戒指"/utf8>>), bid = 10090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100903,
		     name = lang:get(<<"9星神战戒指"/utf8>>), bid = 10090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100903,
		     name = lang:get(<<"9星神战戒指"/utf8>>), bid = 10090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100803) ->
    [#gift_rand_data{id = 99100803,
		     name = lang:get(<<"8星神战戒指"/utf8>>), bid = 10080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100803,
		     name = lang:get(<<"8星神战戒指"/utf8>>), bid = 10080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100803,
		     name = lang:get(<<"8星神战戒指"/utf8>>), bid = 10080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100703) ->
    [#gift_rand_data{id = 99100703,
		     name = lang:get(<<"7星神战戒指"/utf8>>), bid = 10070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100703,
		     name = lang:get(<<"7星神战戒指"/utf8>>), bid = 10070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100703,
		     name = lang:get(<<"7星神战戒指"/utf8>>), bid = 10070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100603) ->
    [#gift_rand_data{id = 99100603,
		     name = lang:get(<<"6星神战戒指"/utf8>>), bid = 10060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100603,
		     name = lang:get(<<"6星神战戒指"/utf8>>), bid = 10060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100603,
		     name = lang:get(<<"6星神战戒指"/utf8>>), bid = 10060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100503) ->
    [#gift_rand_data{id = 99100503,
		     name = lang:get(<<"5星神战戒指"/utf8>>), bid = 10050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100503,
		     name = lang:get(<<"5星神战戒指"/utf8>>), bid = 10050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100503,
		     name = lang:get(<<"5星神战戒指"/utf8>>), bid = 10050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100403) ->
    [#gift_rand_data{id = 99100403,
		     name = lang:get(<<"4星神战戒指"/utf8>>), bid = 10040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100403,
		     name = lang:get(<<"4星神战戒指"/utf8>>), bid = 10040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100403,
		     name = lang:get(<<"4星神战戒指"/utf8>>), bid = 10040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100303) ->
    [#gift_rand_data{id = 99100303,
		     name = lang:get(<<"3星神战戒指"/utf8>>), bid = 10030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100303,
		     name = lang:get(<<"3星神战戒指"/utf8>>), bid = 10030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100303,
		     name = lang:get(<<"3星神战戒指"/utf8>>), bid = 10030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100203) ->
    [#gift_rand_data{id = 99100203,
		     name = lang:get(<<"2星神战戒指"/utf8>>), bid = 10020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100203,
		     name = lang:get(<<"2星神战戒指"/utf8>>), bid = 10020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100203,
		     name = lang:get(<<"2星神战戒指"/utf8>>), bid = 10020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100103) ->
    [#gift_rand_data{id = 99100103,
		     name = lang:get(<<"1星神战戒指"/utf8>>), bid = 10010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100103,
		     name = lang:get(<<"1星神战戒指"/utf8>>), bid = 10010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100103,
		     name = lang:get(<<"1星神战戒指"/utf8>>), bid = 10010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99101002) ->
    [#gift_rand_data{id = 99101002,
		     name = lang:get(<<"10星神战项链"/utf8>>), bid = 10100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99101002,
		     name = lang:get(<<"10星神战项链"/utf8>>), bid = 10100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99101002,
		     name = lang:get(<<"10星神战项链"/utf8>>), bid = 10100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100902) ->
    [#gift_rand_data{id = 99100902,
		     name = lang:get(<<"9星神战项链"/utf8>>), bid = 10090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100902,
		     name = lang:get(<<"9星神战项链"/utf8>>), bid = 10090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100902,
		     name = lang:get(<<"9星神战项链"/utf8>>), bid = 10090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100802) ->
    [#gift_rand_data{id = 99100802,
		     name = lang:get(<<"8星神战项链"/utf8>>), bid = 10080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100802,
		     name = lang:get(<<"8星神战项链"/utf8>>), bid = 10080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100802,
		     name = lang:get(<<"8星神战项链"/utf8>>), bid = 10080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100702) ->
    [#gift_rand_data{id = 99100702,
		     name = lang:get(<<"7星神战项链"/utf8>>), bid = 10070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100702,
		     name = lang:get(<<"7星神战项链"/utf8>>), bid = 10070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100702,
		     name = lang:get(<<"7星神战项链"/utf8>>), bid = 10070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100602) ->
    [#gift_rand_data{id = 99100602,
		     name = lang:get(<<"6星神战项链"/utf8>>), bid = 10060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100602,
		     name = lang:get(<<"6星神战项链"/utf8>>), bid = 10060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100602,
		     name = lang:get(<<"6星神战项链"/utf8>>), bid = 10060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100502) ->
    [#gift_rand_data{id = 99100502,
		     name = lang:get(<<"5星神战项链"/utf8>>), bid = 10050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100502,
		     name = lang:get(<<"5星神战项链"/utf8>>), bid = 10050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100502,
		     name = lang:get(<<"5星神战项链"/utf8>>), bid = 10050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100402) ->
    [#gift_rand_data{id = 99100402,
		     name = lang:get(<<"4星神战项链"/utf8>>), bid = 10040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100402,
		     name = lang:get(<<"4星神战项链"/utf8>>), bid = 10040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100402,
		     name = lang:get(<<"4星神战项链"/utf8>>), bid = 10040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100302) ->
    [#gift_rand_data{id = 99100302,
		     name = lang:get(<<"3星神战项链"/utf8>>), bid = 10030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100302,
		     name = lang:get(<<"3星神战项链"/utf8>>), bid = 10030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100302,
		     name = lang:get(<<"3星神战项链"/utf8>>), bid = 10030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100202) ->
    [#gift_rand_data{id = 99100202,
		     name = lang:get(<<"2星神战项链"/utf8>>), bid = 10020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100202,
		     name = lang:get(<<"2星神战项链"/utf8>>), bid = 10020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100202,
		     name = lang:get(<<"2星神战项链"/utf8>>), bid = 10020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100102) ->
    [#gift_rand_data{id = 99100102,
		     name = lang:get(<<"1星神战项链"/utf8>>), bid = 10010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100102,
		     name = lang:get(<<"1星神战项链"/utf8>>), bid = 10010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100102,
		     name = lang:get(<<"1星神战项链"/utf8>>), bid = 10010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99101001) ->
    [#gift_rand_data{id = 99101001,
		     name = lang:get(<<"10星神战耳环"/utf8>>), bid = 10100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99101001,
		     name = lang:get(<<"10星神战耳环"/utf8>>), bid = 10100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99101001,
		     name = lang:get(<<"10星神战耳环"/utf8>>), bid = 10100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100901) ->
    [#gift_rand_data{id = 99100901,
		     name = lang:get(<<"9星神战耳环"/utf8>>), bid = 10090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100901,
		     name = lang:get(<<"9星神战耳环"/utf8>>), bid = 10090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100901,
		     name = lang:get(<<"9星神战耳环"/utf8>>), bid = 10090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100801) ->
    [#gift_rand_data{id = 99100801,
		     name = lang:get(<<"8星神战耳环"/utf8>>), bid = 10080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100801,
		     name = lang:get(<<"8星神战耳环"/utf8>>), bid = 10080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100801,
		     name = lang:get(<<"8星神战耳环"/utf8>>), bid = 10080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100701) ->
    [#gift_rand_data{id = 99100701,
		     name = lang:get(<<"7星神战耳环"/utf8>>), bid = 10070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100701,
		     name = lang:get(<<"7星神战耳环"/utf8>>), bid = 10070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100701,
		     name = lang:get(<<"7星神战耳环"/utf8>>), bid = 10070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100601) ->
    [#gift_rand_data{id = 99100601,
		     name = lang:get(<<"6星神战耳环"/utf8>>), bid = 10060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100601,
		     name = lang:get(<<"6星神战耳环"/utf8>>), bid = 10060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100601,
		     name = lang:get(<<"6星神战耳环"/utf8>>), bid = 10060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100501) ->
    [#gift_rand_data{id = 99100501,
		     name = lang:get(<<"5星神战耳环"/utf8>>), bid = 10050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100501,
		     name = lang:get(<<"5星神战耳环"/utf8>>), bid = 10050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100501,
		     name = lang:get(<<"5星神战耳环"/utf8>>), bid = 10050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100401) ->
    [#gift_rand_data{id = 99100401,
		     name = lang:get(<<"4星神战耳环"/utf8>>), bid = 10040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100401,
		     name = lang:get(<<"4星神战耳环"/utf8>>), bid = 10040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100401,
		     name = lang:get(<<"4星神战耳环"/utf8>>), bid = 10040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100301) ->
    [#gift_rand_data{id = 99100301,
		     name = lang:get(<<"3星神战耳环"/utf8>>), bid = 10030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100301,
		     name = lang:get(<<"3星神战耳环"/utf8>>), bid = 10030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100301,
		     name = lang:get(<<"3星神战耳环"/utf8>>), bid = 10030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100201) ->
    [#gift_rand_data{id = 99100201,
		     name = lang:get(<<"2星神战耳环"/utf8>>), bid = 10020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100201,
		     name = lang:get(<<"2星神战耳环"/utf8>>), bid = 10020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100201,
		     name = lang:get(<<"2星神战耳环"/utf8>>), bid = 10020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99100101) ->
    [#gift_rand_data{id = 99100101,
		     name = lang:get(<<"1星神战耳环"/utf8>>), bid = 10010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100101,
		     name = lang:get(<<"1星神战耳环"/utf8>>), bid = 10010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99100101,
		     name = lang:get(<<"1星神战耳环"/utf8>>), bid = 10010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99091004) ->
    [#gift_rand_data{id = 99091004,
		     name = lang:get(<<"10星魔甲手镯"/utf8>>), bid = 9100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99091004,
		     name = lang:get(<<"10星魔甲手镯"/utf8>>), bid = 9100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99091004,
		     name = lang:get(<<"10星魔甲手镯"/utf8>>), bid = 9100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090904) ->
    [#gift_rand_data{id = 99090904,
		     name = lang:get(<<"9星魔甲手镯"/utf8>>), bid = 9090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090904,
		     name = lang:get(<<"9星魔甲手镯"/utf8>>), bid = 9090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090904,
		     name = lang:get(<<"9星魔甲手镯"/utf8>>), bid = 9090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090804) ->
    [#gift_rand_data{id = 99090804,
		     name = lang:get(<<"8星魔甲手镯"/utf8>>), bid = 9080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090804,
		     name = lang:get(<<"8星魔甲手镯"/utf8>>), bid = 9080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090804,
		     name = lang:get(<<"8星魔甲手镯"/utf8>>), bid = 9080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090704) ->
    [#gift_rand_data{id = 99090704,
		     name = lang:get(<<"7星魔甲手镯"/utf8>>), bid = 9070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090704,
		     name = lang:get(<<"7星魔甲手镯"/utf8>>), bid = 9070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090704,
		     name = lang:get(<<"7星魔甲手镯"/utf8>>), bid = 9070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090604) ->
    [#gift_rand_data{id = 99090604,
		     name = lang:get(<<"6星魔甲手镯"/utf8>>), bid = 9060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090604,
		     name = lang:get(<<"6星魔甲手镯"/utf8>>), bid = 9060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090604,
		     name = lang:get(<<"6星魔甲手镯"/utf8>>), bid = 9060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090504) ->
    [#gift_rand_data{id = 99090504,
		     name = lang:get(<<"5星魔甲手镯"/utf8>>), bid = 9050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090504,
		     name = lang:get(<<"5星魔甲手镯"/utf8>>), bid = 9050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090504,
		     name = lang:get(<<"5星魔甲手镯"/utf8>>), bid = 9050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090404) ->
    [#gift_rand_data{id = 99090404,
		     name = lang:get(<<"4星魔甲手镯"/utf8>>), bid = 9040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090404,
		     name = lang:get(<<"4星魔甲手镯"/utf8>>), bid = 9040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090404,
		     name = lang:get(<<"4星魔甲手镯"/utf8>>), bid = 9040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090304) ->
    [#gift_rand_data{id = 99090304,
		     name = lang:get(<<"3星魔甲手镯"/utf8>>), bid = 9030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090304,
		     name = lang:get(<<"3星魔甲手镯"/utf8>>), bid = 9030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090304,
		     name = lang:get(<<"3星魔甲手镯"/utf8>>), bid = 9030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090204) ->
    [#gift_rand_data{id = 99090204,
		     name = lang:get(<<"2星魔甲手镯"/utf8>>), bid = 9020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090204,
		     name = lang:get(<<"2星魔甲手镯"/utf8>>), bid = 9020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090204,
		     name = lang:get(<<"2星魔甲手镯"/utf8>>), bid = 9020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090104) ->
    [#gift_rand_data{id = 99090104,
		     name = lang:get(<<"1星魔甲手镯"/utf8>>), bid = 9010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090104,
		     name = lang:get(<<"1星魔甲手镯"/utf8>>), bid = 9010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090104,
		     name = lang:get(<<"1星魔甲手镯"/utf8>>), bid = 9010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99091003) ->
    [#gift_rand_data{id = 99091003,
		     name = lang:get(<<"10星魔甲戒指"/utf8>>), bid = 9100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99091003,
		     name = lang:get(<<"10星魔甲戒指"/utf8>>), bid = 9100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99091003,
		     name = lang:get(<<"10星魔甲戒指"/utf8>>), bid = 9100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090903) ->
    [#gift_rand_data{id = 99090903,
		     name = lang:get(<<"9星魔甲戒指"/utf8>>), bid = 9090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090903,
		     name = lang:get(<<"9星魔甲戒指"/utf8>>), bid = 9090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090903,
		     name = lang:get(<<"9星魔甲戒指"/utf8>>), bid = 9090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090803) ->
    [#gift_rand_data{id = 99090803,
		     name = lang:get(<<"8星魔甲戒指"/utf8>>), bid = 9080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090803,
		     name = lang:get(<<"8星魔甲戒指"/utf8>>), bid = 9080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090803,
		     name = lang:get(<<"8星魔甲戒指"/utf8>>), bid = 9080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090703) ->
    [#gift_rand_data{id = 99090703,
		     name = lang:get(<<"7星魔甲戒指"/utf8>>), bid = 9070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090703,
		     name = lang:get(<<"7星魔甲戒指"/utf8>>), bid = 9070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090703,
		     name = lang:get(<<"7星魔甲戒指"/utf8>>), bid = 9070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090603) ->
    [#gift_rand_data{id = 99090603,
		     name = lang:get(<<"6星魔甲戒指"/utf8>>), bid = 9060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090603,
		     name = lang:get(<<"6星魔甲戒指"/utf8>>), bid = 9060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090603,
		     name = lang:get(<<"6星魔甲戒指"/utf8>>), bid = 9060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090503) ->
    [#gift_rand_data{id = 99090503,
		     name = lang:get(<<"5星魔甲戒指"/utf8>>), bid = 9050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090503,
		     name = lang:get(<<"5星魔甲戒指"/utf8>>), bid = 9050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090503,
		     name = lang:get(<<"5星魔甲戒指"/utf8>>), bid = 9050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090403) ->
    [#gift_rand_data{id = 99090403,
		     name = lang:get(<<"4星魔甲戒指"/utf8>>), bid = 9040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090403,
		     name = lang:get(<<"4星魔甲戒指"/utf8>>), bid = 9040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090403,
		     name = lang:get(<<"4星魔甲戒指"/utf8>>), bid = 9040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090303) ->
    [#gift_rand_data{id = 99090303,
		     name = lang:get(<<"3星魔甲戒指"/utf8>>), bid = 9030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090303,
		     name = lang:get(<<"3星魔甲戒指"/utf8>>), bid = 9030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090303,
		     name = lang:get(<<"3星魔甲戒指"/utf8>>), bid = 9030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090203) ->
    [#gift_rand_data{id = 99090203,
		     name = lang:get(<<"2星魔甲戒指"/utf8>>), bid = 9020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090203,
		     name = lang:get(<<"2星魔甲戒指"/utf8>>), bid = 9020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090203,
		     name = lang:get(<<"2星魔甲戒指"/utf8>>), bid = 9020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090103) ->
    [#gift_rand_data{id = 99090103,
		     name = lang:get(<<"1星魔甲戒指"/utf8>>), bid = 9010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090103,
		     name = lang:get(<<"1星魔甲戒指"/utf8>>), bid = 9010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090103,
		     name = lang:get(<<"1星魔甲戒指"/utf8>>), bid = 9010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99091002) ->
    [#gift_rand_data{id = 99091002,
		     name = lang:get(<<"10星魔甲项链"/utf8>>), bid = 9100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99091002,
		     name = lang:get(<<"10星魔甲项链"/utf8>>), bid = 9100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99091002,
		     name = lang:get(<<"10星魔甲项链"/utf8>>), bid = 9100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090902) ->
    [#gift_rand_data{id = 99090902,
		     name = lang:get(<<"9星魔甲项链"/utf8>>), bid = 9090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090902,
		     name = lang:get(<<"9星魔甲项链"/utf8>>), bid = 9090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090902,
		     name = lang:get(<<"9星魔甲项链"/utf8>>), bid = 9090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090802) ->
    [#gift_rand_data{id = 99090802,
		     name = lang:get(<<"8星魔甲项链"/utf8>>), bid = 9080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090802,
		     name = lang:get(<<"8星魔甲项链"/utf8>>), bid = 9080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090802,
		     name = lang:get(<<"8星魔甲项链"/utf8>>), bid = 9080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090702) ->
    [#gift_rand_data{id = 99090702,
		     name = lang:get(<<"7星魔甲项链"/utf8>>), bid = 9070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090702,
		     name = lang:get(<<"7星魔甲项链"/utf8>>), bid = 9070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090702,
		     name = lang:get(<<"7星魔甲项链"/utf8>>), bid = 9070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090602) ->
    [#gift_rand_data{id = 99090602,
		     name = lang:get(<<"6星魔甲项链"/utf8>>), bid = 9060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090602,
		     name = lang:get(<<"6星魔甲项链"/utf8>>), bid = 9060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090602,
		     name = lang:get(<<"6星魔甲项链"/utf8>>), bid = 9060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090502) ->
    [#gift_rand_data{id = 99090502,
		     name = lang:get(<<"5星魔甲项链"/utf8>>), bid = 9050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090502,
		     name = lang:get(<<"5星魔甲项链"/utf8>>), bid = 9050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090502,
		     name = lang:get(<<"5星魔甲项链"/utf8>>), bid = 9050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090402) ->
    [#gift_rand_data{id = 99090402,
		     name = lang:get(<<"4星魔甲项链"/utf8>>), bid = 9040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090402,
		     name = lang:get(<<"4星魔甲项链"/utf8>>), bid = 9040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090402,
		     name = lang:get(<<"4星魔甲项链"/utf8>>), bid = 9040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090302) ->
    [#gift_rand_data{id = 99090302,
		     name = lang:get(<<"3星魔甲项链"/utf8>>), bid = 9030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090302,
		     name = lang:get(<<"3星魔甲项链"/utf8>>), bid = 9030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090302,
		     name = lang:get(<<"3星魔甲项链"/utf8>>), bid = 9030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090202) ->
    [#gift_rand_data{id = 99090202,
		     name = lang:get(<<"2星魔甲项链"/utf8>>), bid = 9020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090202,
		     name = lang:get(<<"2星魔甲项链"/utf8>>), bid = 9020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090202,
		     name = lang:get(<<"2星魔甲项链"/utf8>>), bid = 9020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090102) ->
    [#gift_rand_data{id = 99090102,
		     name = lang:get(<<"1星魔甲项链"/utf8>>), bid = 9010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090102,
		     name = lang:get(<<"1星魔甲项链"/utf8>>), bid = 9010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090102,
		     name = lang:get(<<"1星魔甲项链"/utf8>>), bid = 9010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99091001) ->
    [#gift_rand_data{id = 99091001,
		     name = lang:get(<<"10星魔甲耳环"/utf8>>), bid = 9100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99091001,
		     name = lang:get(<<"10星魔甲耳环"/utf8>>), bid = 9100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99091001,
		     name = lang:get(<<"10星魔甲耳环"/utf8>>), bid = 9100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090901) ->
    [#gift_rand_data{id = 99090901,
		     name = lang:get(<<"9星魔甲耳环"/utf8>>), bid = 9090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090901,
		     name = lang:get(<<"9星魔甲耳环"/utf8>>), bid = 9090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090901,
		     name = lang:get(<<"9星魔甲耳环"/utf8>>), bid = 9090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090801) ->
    [#gift_rand_data{id = 99090801,
		     name = lang:get(<<"8星魔甲耳环"/utf8>>), bid = 9080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090801,
		     name = lang:get(<<"8星魔甲耳环"/utf8>>), bid = 9080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090801,
		     name = lang:get(<<"8星魔甲耳环"/utf8>>), bid = 9080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090701) ->
    [#gift_rand_data{id = 99090701,
		     name = lang:get(<<"7星魔甲耳环"/utf8>>), bid = 9070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090701,
		     name = lang:get(<<"7星魔甲耳环"/utf8>>), bid = 9070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090701,
		     name = lang:get(<<"7星魔甲耳环"/utf8>>), bid = 9070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090601) ->
    [#gift_rand_data{id = 99090601,
		     name = lang:get(<<"6星魔甲耳环"/utf8>>), bid = 9060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090601,
		     name = lang:get(<<"6星魔甲耳环"/utf8>>), bid = 9060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090601,
		     name = lang:get(<<"6星魔甲耳环"/utf8>>), bid = 9060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090501) ->
    [#gift_rand_data{id = 99090501,
		     name = lang:get(<<"5星魔甲耳环"/utf8>>), bid = 9050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090501,
		     name = lang:get(<<"5星魔甲耳环"/utf8>>), bid = 9050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090501,
		     name = lang:get(<<"5星魔甲耳环"/utf8>>), bid = 9050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090401) ->
    [#gift_rand_data{id = 99090401,
		     name = lang:get(<<"4星魔甲耳环"/utf8>>), bid = 9040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090401,
		     name = lang:get(<<"4星魔甲耳环"/utf8>>), bid = 9040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090401,
		     name = lang:get(<<"4星魔甲耳环"/utf8>>), bid = 9040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090301) ->
    [#gift_rand_data{id = 99090301,
		     name = lang:get(<<"3星魔甲耳环"/utf8>>), bid = 9030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090301,
		     name = lang:get(<<"3星魔甲耳环"/utf8>>), bid = 9030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090301,
		     name = lang:get(<<"3星魔甲耳环"/utf8>>), bid = 9030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090201) ->
    [#gift_rand_data{id = 99090201,
		     name = lang:get(<<"2星魔甲耳环"/utf8>>), bid = 9020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090201,
		     name = lang:get(<<"2星魔甲耳环"/utf8>>), bid = 9020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090201,
		     name = lang:get(<<"2星魔甲耳环"/utf8>>), bid = 9020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99090101) ->
    [#gift_rand_data{id = 99090101,
		     name = lang:get(<<"1星魔甲耳环"/utf8>>), bid = 9010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090101,
		     name = lang:get(<<"1星魔甲耳环"/utf8>>), bid = 9010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99090101,
		     name = lang:get(<<"1星魔甲耳环"/utf8>>), bid = 9010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99081004) ->
    [#gift_rand_data{id = 99081004,
		     name = lang:get(<<"10星镇灵手镯"/utf8>>), bid = 8100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99081004,
		     name = lang:get(<<"10星镇灵手镯"/utf8>>), bid = 8100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99081004,
		     name = lang:get(<<"10星镇灵手镯"/utf8>>), bid = 8100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080904) ->
    [#gift_rand_data{id = 99080904,
		     name = lang:get(<<"9星镇灵手镯"/utf8>>), bid = 8090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080904,
		     name = lang:get(<<"9星镇灵手镯"/utf8>>), bid = 8090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080904,
		     name = lang:get(<<"9星镇灵手镯"/utf8>>), bid = 8090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080804) ->
    [#gift_rand_data{id = 99080804,
		     name = lang:get(<<"8星镇灵手镯"/utf8>>), bid = 8080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080804,
		     name = lang:get(<<"8星镇灵手镯"/utf8>>), bid = 8080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080804,
		     name = lang:get(<<"8星镇灵手镯"/utf8>>), bid = 8080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080704) ->
    [#gift_rand_data{id = 99080704,
		     name = lang:get(<<"7星镇灵手镯"/utf8>>), bid = 8070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080704,
		     name = lang:get(<<"7星镇灵手镯"/utf8>>), bid = 8070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080704,
		     name = lang:get(<<"7星镇灵手镯"/utf8>>), bid = 8070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080604) ->
    [#gift_rand_data{id = 99080604,
		     name = lang:get(<<"6星镇灵手镯"/utf8>>), bid = 8060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080604,
		     name = lang:get(<<"6星镇灵手镯"/utf8>>), bid = 8060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080604,
		     name = lang:get(<<"6星镇灵手镯"/utf8>>), bid = 8060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080504) ->
    [#gift_rand_data{id = 99080504,
		     name = lang:get(<<"5星镇灵手镯"/utf8>>), bid = 8050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080504,
		     name = lang:get(<<"5星镇灵手镯"/utf8>>), bid = 8050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080504,
		     name = lang:get(<<"5星镇灵手镯"/utf8>>), bid = 8050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080404) ->
    [#gift_rand_data{id = 99080404,
		     name = lang:get(<<"4星镇灵手镯"/utf8>>), bid = 8040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080404,
		     name = lang:get(<<"4星镇灵手镯"/utf8>>), bid = 8040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080404,
		     name = lang:get(<<"4星镇灵手镯"/utf8>>), bid = 8040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080304) ->
    [#gift_rand_data{id = 99080304,
		     name = lang:get(<<"3星镇灵手镯"/utf8>>), bid = 8030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080304,
		     name = lang:get(<<"3星镇灵手镯"/utf8>>), bid = 8030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080304,
		     name = lang:get(<<"3星镇灵手镯"/utf8>>), bid = 8030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080204) ->
    [#gift_rand_data{id = 99080204,
		     name = lang:get(<<"2星镇灵手镯"/utf8>>), bid = 8020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080204,
		     name = lang:get(<<"2星镇灵手镯"/utf8>>), bid = 8020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080204,
		     name = lang:get(<<"2星镇灵手镯"/utf8>>), bid = 8020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080104) ->
    [#gift_rand_data{id = 99080104,
		     name = lang:get(<<"1星镇灵手镯"/utf8>>), bid = 8010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080104,
		     name = lang:get(<<"1星镇灵手镯"/utf8>>), bid = 8010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080104,
		     name = lang:get(<<"1星镇灵手镯"/utf8>>), bid = 8010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99081003) ->
    [#gift_rand_data{id = 99081003,
		     name = lang:get(<<"10星镇灵戒指"/utf8>>), bid = 8100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99081003,
		     name = lang:get(<<"10星镇灵戒指"/utf8>>), bid = 8100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99081003,
		     name = lang:get(<<"10星镇灵戒指"/utf8>>), bid = 8100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080903) ->
    [#gift_rand_data{id = 99080903,
		     name = lang:get(<<"9星镇灵戒指"/utf8>>), bid = 8090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080903,
		     name = lang:get(<<"9星镇灵戒指"/utf8>>), bid = 8090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080903,
		     name = lang:get(<<"9星镇灵戒指"/utf8>>), bid = 8090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080803) ->
    [#gift_rand_data{id = 99080803,
		     name = lang:get(<<"8星镇灵戒指"/utf8>>), bid = 8080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080803,
		     name = lang:get(<<"8星镇灵戒指"/utf8>>), bid = 8080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080803,
		     name = lang:get(<<"8星镇灵戒指"/utf8>>), bid = 8080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080703) ->
    [#gift_rand_data{id = 99080703,
		     name = lang:get(<<"7星镇灵戒指"/utf8>>), bid = 8070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080703,
		     name = lang:get(<<"7星镇灵戒指"/utf8>>), bid = 8070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080703,
		     name = lang:get(<<"7星镇灵戒指"/utf8>>), bid = 8070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080603) ->
    [#gift_rand_data{id = 99080603,
		     name = lang:get(<<"6星镇灵戒指"/utf8>>), bid = 8060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080603,
		     name = lang:get(<<"6星镇灵戒指"/utf8>>), bid = 8060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080603,
		     name = lang:get(<<"6星镇灵戒指"/utf8>>), bid = 8060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080503) ->
    [#gift_rand_data{id = 99080503,
		     name = lang:get(<<"5星镇灵戒指"/utf8>>), bid = 8050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080503,
		     name = lang:get(<<"5星镇灵戒指"/utf8>>), bid = 8050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080503,
		     name = lang:get(<<"5星镇灵戒指"/utf8>>), bid = 8050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080403) ->
    [#gift_rand_data{id = 99080403,
		     name = lang:get(<<"4星镇灵戒指"/utf8>>), bid = 8040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080403,
		     name = lang:get(<<"4星镇灵戒指"/utf8>>), bid = 8040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080403,
		     name = lang:get(<<"4星镇灵戒指"/utf8>>), bid = 8040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080303) ->
    [#gift_rand_data{id = 99080303,
		     name = lang:get(<<"3星镇灵戒指"/utf8>>), bid = 8030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080303,
		     name = lang:get(<<"3星镇灵戒指"/utf8>>), bid = 8030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080303,
		     name = lang:get(<<"3星镇灵戒指"/utf8>>), bid = 8030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080203) ->
    [#gift_rand_data{id = 99080203,
		     name = lang:get(<<"2星镇灵戒指"/utf8>>), bid = 8020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080203,
		     name = lang:get(<<"2星镇灵戒指"/utf8>>), bid = 8020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080203,
		     name = lang:get(<<"2星镇灵戒指"/utf8>>), bid = 8020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080103) ->
    [#gift_rand_data{id = 99080103,
		     name = lang:get(<<"1星镇灵戒指"/utf8>>), bid = 8010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080103,
		     name = lang:get(<<"1星镇灵戒指"/utf8>>), bid = 8010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080103,
		     name = lang:get(<<"1星镇灵戒指"/utf8>>), bid = 8010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99081002) ->
    [#gift_rand_data{id = 99081002,
		     name = lang:get(<<"10星镇灵项链"/utf8>>), bid = 8100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99081002,
		     name = lang:get(<<"10星镇灵项链"/utf8>>), bid = 8100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99081002,
		     name = lang:get(<<"10星镇灵项链"/utf8>>), bid = 8100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080902) ->
    [#gift_rand_data{id = 99080902,
		     name = lang:get(<<"9星镇灵项链"/utf8>>), bid = 8090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080902,
		     name = lang:get(<<"9星镇灵项链"/utf8>>), bid = 8090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080902,
		     name = lang:get(<<"9星镇灵项链"/utf8>>), bid = 8090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080802) ->
    [#gift_rand_data{id = 99080802,
		     name = lang:get(<<"8星镇灵项链"/utf8>>), bid = 8080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080802,
		     name = lang:get(<<"8星镇灵项链"/utf8>>), bid = 8080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080802,
		     name = lang:get(<<"8星镇灵项链"/utf8>>), bid = 8080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080702) ->
    [#gift_rand_data{id = 99080702,
		     name = lang:get(<<"7星镇灵项链"/utf8>>), bid = 8070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080702,
		     name = lang:get(<<"7星镇灵项链"/utf8>>), bid = 8070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080702,
		     name = lang:get(<<"7星镇灵项链"/utf8>>), bid = 8070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080602) ->
    [#gift_rand_data{id = 99080602,
		     name = lang:get(<<"6星镇灵项链"/utf8>>), bid = 8060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080602,
		     name = lang:get(<<"6星镇灵项链"/utf8>>), bid = 8060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080602,
		     name = lang:get(<<"6星镇灵项链"/utf8>>), bid = 8060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080502) ->
    [#gift_rand_data{id = 99080502,
		     name = lang:get(<<"5星镇灵项链"/utf8>>), bid = 8050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080502,
		     name = lang:get(<<"5星镇灵项链"/utf8>>), bid = 8050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080502,
		     name = lang:get(<<"5星镇灵项链"/utf8>>), bid = 8050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080402) ->
    [#gift_rand_data{id = 99080402,
		     name = lang:get(<<"4星镇灵项链"/utf8>>), bid = 8040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080402,
		     name = lang:get(<<"4星镇灵项链"/utf8>>), bid = 8040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080402,
		     name = lang:get(<<"4星镇灵项链"/utf8>>), bid = 8040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080302) ->
    [#gift_rand_data{id = 99080302,
		     name = lang:get(<<"3星镇灵项链"/utf8>>), bid = 8030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080302,
		     name = lang:get(<<"3星镇灵项链"/utf8>>), bid = 8030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080302,
		     name = lang:get(<<"3星镇灵项链"/utf8>>), bid = 8030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080202) ->
    [#gift_rand_data{id = 99080202,
		     name = lang:get(<<"2星镇灵项链"/utf8>>), bid = 8020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080202,
		     name = lang:get(<<"2星镇灵项链"/utf8>>), bid = 8020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080202,
		     name = lang:get(<<"2星镇灵项链"/utf8>>), bid = 8020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080102) ->
    [#gift_rand_data{id = 99080102,
		     name = lang:get(<<"1星镇灵项链"/utf8>>), bid = 8010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080102,
		     name = lang:get(<<"1星镇灵项链"/utf8>>), bid = 8010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080102,
		     name = lang:get(<<"1星镇灵项链"/utf8>>), bid = 8010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99081001) ->
    [#gift_rand_data{id = 99081001,
		     name = lang:get(<<"10星镇灵耳环"/utf8>>), bid = 8100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99081001,
		     name = lang:get(<<"10星镇灵耳环"/utf8>>), bid = 8100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99081001,
		     name = lang:get(<<"10星镇灵耳环"/utf8>>), bid = 8100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080901) ->
    [#gift_rand_data{id = 99080901,
		     name = lang:get(<<"9星镇灵耳环"/utf8>>), bid = 8090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080901,
		     name = lang:get(<<"9星镇灵耳环"/utf8>>), bid = 8090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080901,
		     name = lang:get(<<"9星镇灵耳环"/utf8>>), bid = 8090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080801) ->
    [#gift_rand_data{id = 99080801,
		     name = lang:get(<<"8星镇灵耳环"/utf8>>), bid = 8080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080801,
		     name = lang:get(<<"8星镇灵耳环"/utf8>>), bid = 8080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080801,
		     name = lang:get(<<"8星镇灵耳环"/utf8>>), bid = 8080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080701) ->
    [#gift_rand_data{id = 99080701,
		     name = lang:get(<<"7星镇灵耳环"/utf8>>), bid = 8070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080701,
		     name = lang:get(<<"7星镇灵耳环"/utf8>>), bid = 8070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080701,
		     name = lang:get(<<"7星镇灵耳环"/utf8>>), bid = 8070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080601) ->
    [#gift_rand_data{id = 99080601,
		     name = lang:get(<<"6星镇灵耳环"/utf8>>), bid = 8060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080601,
		     name = lang:get(<<"6星镇灵耳环"/utf8>>), bid = 8060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080601,
		     name = lang:get(<<"6星镇灵耳环"/utf8>>), bid = 8060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080501) ->
    [#gift_rand_data{id = 99080501,
		     name = lang:get(<<"5星镇灵耳环"/utf8>>), bid = 8050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080501,
		     name = lang:get(<<"5星镇灵耳环"/utf8>>), bid = 8050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080501,
		     name = lang:get(<<"5星镇灵耳环"/utf8>>), bid = 8050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080401) ->
    [#gift_rand_data{id = 99080401,
		     name = lang:get(<<"4星镇灵耳环"/utf8>>), bid = 8040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080401,
		     name = lang:get(<<"4星镇灵耳环"/utf8>>), bid = 8040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080401,
		     name = lang:get(<<"4星镇灵耳环"/utf8>>), bid = 8040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080301) ->
    [#gift_rand_data{id = 99080301,
		     name = lang:get(<<"3星镇灵耳环"/utf8>>), bid = 8030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080301,
		     name = lang:get(<<"3星镇灵耳环"/utf8>>), bid = 8030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080301,
		     name = lang:get(<<"3星镇灵耳环"/utf8>>), bid = 8030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080201) ->
    [#gift_rand_data{id = 99080201,
		     name = lang:get(<<"2星镇灵耳环"/utf8>>), bid = 8020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080201,
		     name = lang:get(<<"2星镇灵耳环"/utf8>>), bid = 8020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080201,
		     name = lang:get(<<"2星镇灵耳环"/utf8>>), bid = 8020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99080101) ->
    [#gift_rand_data{id = 99080101,
		     name = lang:get(<<"1星镇灵耳环"/utf8>>), bid = 8010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080101,
		     name = lang:get(<<"1星镇灵耳环"/utf8>>), bid = 8010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99080101,
		     name = lang:get(<<"1星镇灵耳环"/utf8>>), bid = 8010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99071004) ->
    [#gift_rand_data{id = 99071004,
		     name = lang:get(<<"10星斗战手镯"/utf8>>), bid = 7100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99071004,
		     name = lang:get(<<"10星斗战手镯"/utf8>>), bid = 7100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99071004,
		     name = lang:get(<<"10星斗战手镯"/utf8>>), bid = 7100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070904) ->
    [#gift_rand_data{id = 99070904,
		     name = lang:get(<<"9星斗战手镯"/utf8>>), bid = 7090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070904,
		     name = lang:get(<<"9星斗战手镯"/utf8>>), bid = 7090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070904,
		     name = lang:get(<<"9星斗战手镯"/utf8>>), bid = 7090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070804) ->
    [#gift_rand_data{id = 99070804,
		     name = lang:get(<<"8星斗战手镯"/utf8>>), bid = 7080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070804,
		     name = lang:get(<<"8星斗战手镯"/utf8>>), bid = 7080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070804,
		     name = lang:get(<<"8星斗战手镯"/utf8>>), bid = 7080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070704) ->
    [#gift_rand_data{id = 99070704,
		     name = lang:get(<<"7星斗战手镯"/utf8>>), bid = 7070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070704,
		     name = lang:get(<<"7星斗战手镯"/utf8>>), bid = 7070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070704,
		     name = lang:get(<<"7星斗战手镯"/utf8>>), bid = 7070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070604) ->
    [#gift_rand_data{id = 99070604,
		     name = lang:get(<<"6星斗战手镯"/utf8>>), bid = 7060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070604,
		     name = lang:get(<<"6星斗战手镯"/utf8>>), bid = 7060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070604,
		     name = lang:get(<<"6星斗战手镯"/utf8>>), bid = 7060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070504) ->
    [#gift_rand_data{id = 99070504,
		     name = lang:get(<<"5星斗战手镯"/utf8>>), bid = 7050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070504,
		     name = lang:get(<<"5星斗战手镯"/utf8>>), bid = 7050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070504,
		     name = lang:get(<<"5星斗战手镯"/utf8>>), bid = 7050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070404) ->
    [#gift_rand_data{id = 99070404,
		     name = lang:get(<<"4星斗战手镯"/utf8>>), bid = 7040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070404,
		     name = lang:get(<<"4星斗战手镯"/utf8>>), bid = 7040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070404,
		     name = lang:get(<<"4星斗战手镯"/utf8>>), bid = 7040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070304) ->
    [#gift_rand_data{id = 99070304,
		     name = lang:get(<<"3星斗战手镯"/utf8>>), bid = 7030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070304,
		     name = lang:get(<<"3星斗战手镯"/utf8>>), bid = 7030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070304,
		     name = lang:get(<<"3星斗战手镯"/utf8>>), bid = 7030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070204) ->
    [#gift_rand_data{id = 99070204,
		     name = lang:get(<<"2星斗战手镯"/utf8>>), bid = 7020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070204,
		     name = lang:get(<<"2星斗战手镯"/utf8>>), bid = 7020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070204,
		     name = lang:get(<<"2星斗战手镯"/utf8>>), bid = 7020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070104) ->
    [#gift_rand_data{id = 99070104,
		     name = lang:get(<<"1星斗战手镯"/utf8>>), bid = 7010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070104,
		     name = lang:get(<<"1星斗战手镯"/utf8>>), bid = 7010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070104,
		     name = lang:get(<<"1星斗战手镯"/utf8>>), bid = 7010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99071003) ->
    [#gift_rand_data{id = 99071003,
		     name = lang:get(<<"10星斗战戒指"/utf8>>), bid = 7100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99071003,
		     name = lang:get(<<"10星斗战戒指"/utf8>>), bid = 7100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99071003,
		     name = lang:get(<<"10星斗战戒指"/utf8>>), bid = 7100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070903) ->
    [#gift_rand_data{id = 99070903,
		     name = lang:get(<<"9星斗战戒指"/utf8>>), bid = 7090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070903,
		     name = lang:get(<<"9星斗战戒指"/utf8>>), bid = 7090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070903,
		     name = lang:get(<<"9星斗战戒指"/utf8>>), bid = 7090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070803) ->
    [#gift_rand_data{id = 99070803,
		     name = lang:get(<<"8星斗战戒指"/utf8>>), bid = 7080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070803,
		     name = lang:get(<<"8星斗战戒指"/utf8>>), bid = 7080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070803,
		     name = lang:get(<<"8星斗战戒指"/utf8>>), bid = 7080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070703) ->
    [#gift_rand_data{id = 99070703,
		     name = lang:get(<<"7星斗战戒指"/utf8>>), bid = 7070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070703,
		     name = lang:get(<<"7星斗战戒指"/utf8>>), bid = 7070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070703,
		     name = lang:get(<<"7星斗战戒指"/utf8>>), bid = 7070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070603) ->
    [#gift_rand_data{id = 99070603,
		     name = lang:get(<<"6星斗战戒指"/utf8>>), bid = 7060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070603,
		     name = lang:get(<<"6星斗战戒指"/utf8>>), bid = 7060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070603,
		     name = lang:get(<<"6星斗战戒指"/utf8>>), bid = 7060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070503) ->
    [#gift_rand_data{id = 99070503,
		     name = lang:get(<<"5星斗战戒指"/utf8>>), bid = 7050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070503,
		     name = lang:get(<<"5星斗战戒指"/utf8>>), bid = 7050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070503,
		     name = lang:get(<<"5星斗战戒指"/utf8>>), bid = 7050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070403) ->
    [#gift_rand_data{id = 99070403,
		     name = lang:get(<<"4星斗战戒指"/utf8>>), bid = 7040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070403,
		     name = lang:get(<<"4星斗战戒指"/utf8>>), bid = 7040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070403,
		     name = lang:get(<<"4星斗战戒指"/utf8>>), bid = 7040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070303) ->
    [#gift_rand_data{id = 99070303,
		     name = lang:get(<<"3星斗战戒指"/utf8>>), bid = 7030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070303,
		     name = lang:get(<<"3星斗战戒指"/utf8>>), bid = 7030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070303,
		     name = lang:get(<<"3星斗战戒指"/utf8>>), bid = 7030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070203) ->
    [#gift_rand_data{id = 99070203,
		     name = lang:get(<<"2星斗战戒指"/utf8>>), bid = 7020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070203,
		     name = lang:get(<<"2星斗战戒指"/utf8>>), bid = 7020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070203,
		     name = lang:get(<<"2星斗战戒指"/utf8>>), bid = 7020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070103) ->
    [#gift_rand_data{id = 99070103,
		     name = lang:get(<<"1星斗战戒指"/utf8>>), bid = 7010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070103,
		     name = lang:get(<<"1星斗战戒指"/utf8>>), bid = 7010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070103,
		     name = lang:get(<<"1星斗战戒指"/utf8>>), bid = 7010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99071002) ->
    [#gift_rand_data{id = 99071002,
		     name = lang:get(<<"10星斗战项链"/utf8>>), bid = 7100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99071002,
		     name = lang:get(<<"10星斗战项链"/utf8>>), bid = 7100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99071002,
		     name = lang:get(<<"10星斗战项链"/utf8>>), bid = 7100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070902) ->
    [#gift_rand_data{id = 99070902,
		     name = lang:get(<<"9星斗战项链"/utf8>>), bid = 7090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070902,
		     name = lang:get(<<"9星斗战项链"/utf8>>), bid = 7090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070902,
		     name = lang:get(<<"9星斗战项链"/utf8>>), bid = 7090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070802) ->
    [#gift_rand_data{id = 99070802,
		     name = lang:get(<<"8星斗战项链"/utf8>>), bid = 7080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070802,
		     name = lang:get(<<"8星斗战项链"/utf8>>), bid = 7080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070802,
		     name = lang:get(<<"8星斗战项链"/utf8>>), bid = 7080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070702) ->
    [#gift_rand_data{id = 99070702,
		     name = lang:get(<<"7星斗战项链"/utf8>>), bid = 7070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070702,
		     name = lang:get(<<"7星斗战项链"/utf8>>), bid = 7070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070702,
		     name = lang:get(<<"7星斗战项链"/utf8>>), bid = 7070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070602) ->
    [#gift_rand_data{id = 99070602,
		     name = lang:get(<<"6星斗战项链"/utf8>>), bid = 7060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070602,
		     name = lang:get(<<"6星斗战项链"/utf8>>), bid = 7060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070602,
		     name = lang:get(<<"6星斗战项链"/utf8>>), bid = 7060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070502) ->
    [#gift_rand_data{id = 99070502,
		     name = lang:get(<<"5星斗战项链"/utf8>>), bid = 7050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070502,
		     name = lang:get(<<"5星斗战项链"/utf8>>), bid = 7050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070502,
		     name = lang:get(<<"5星斗战项链"/utf8>>), bid = 7050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070402) ->
    [#gift_rand_data{id = 99070402,
		     name = lang:get(<<"4星斗战项链"/utf8>>), bid = 7040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070402,
		     name = lang:get(<<"4星斗战项链"/utf8>>), bid = 7040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070402,
		     name = lang:get(<<"4星斗战项链"/utf8>>), bid = 7040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070302) ->
    [#gift_rand_data{id = 99070302,
		     name = lang:get(<<"3星斗战项链"/utf8>>), bid = 7030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070302,
		     name = lang:get(<<"3星斗战项链"/utf8>>), bid = 7030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070302,
		     name = lang:get(<<"3星斗战项链"/utf8>>), bid = 7030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070202) ->
    [#gift_rand_data{id = 99070202,
		     name = lang:get(<<"2星斗战项链"/utf8>>), bid = 7020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070202,
		     name = lang:get(<<"2星斗战项链"/utf8>>), bid = 7020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070202,
		     name = lang:get(<<"2星斗战项链"/utf8>>), bid = 7020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070102) ->
    [#gift_rand_data{id = 99070102,
		     name = lang:get(<<"1星斗战项链"/utf8>>), bid = 7010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070102,
		     name = lang:get(<<"1星斗战项链"/utf8>>), bid = 7010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070102,
		     name = lang:get(<<"1星斗战项链"/utf8>>), bid = 7010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99071001) ->
    [#gift_rand_data{id = 99071001,
		     name = lang:get(<<"10星斗战耳环"/utf8>>), bid = 7100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99071001,
		     name = lang:get(<<"10星斗战耳环"/utf8>>), bid = 7100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99071001,
		     name = lang:get(<<"10星斗战耳环"/utf8>>), bid = 7100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070901) ->
    [#gift_rand_data{id = 99070901,
		     name = lang:get(<<"9星斗战耳环"/utf8>>), bid = 7090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070901,
		     name = lang:get(<<"9星斗战耳环"/utf8>>), bid = 7090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070901,
		     name = lang:get(<<"9星斗战耳环"/utf8>>), bid = 7090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070801) ->
    [#gift_rand_data{id = 99070801,
		     name = lang:get(<<"8星斗战耳环"/utf8>>), bid = 7080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070801,
		     name = lang:get(<<"8星斗战耳环"/utf8>>), bid = 7080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070801,
		     name = lang:get(<<"8星斗战耳环"/utf8>>), bid = 7080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070701) ->
    [#gift_rand_data{id = 99070701,
		     name = lang:get(<<"7星斗战耳环"/utf8>>), bid = 7070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070701,
		     name = lang:get(<<"7星斗战耳环"/utf8>>), bid = 7070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070701,
		     name = lang:get(<<"7星斗战耳环"/utf8>>), bid = 7070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070601) ->
    [#gift_rand_data{id = 99070601,
		     name = lang:get(<<"6星斗战耳环"/utf8>>), bid = 7060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070601,
		     name = lang:get(<<"6星斗战耳环"/utf8>>), bid = 7060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070601,
		     name = lang:get(<<"6星斗战耳环"/utf8>>), bid = 7060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070501) ->
    [#gift_rand_data{id = 99070501,
		     name = lang:get(<<"5星斗战耳环"/utf8>>), bid = 7050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070501,
		     name = lang:get(<<"5星斗战耳环"/utf8>>), bid = 7050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070501,
		     name = lang:get(<<"5星斗战耳环"/utf8>>), bid = 7050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070401) ->
    [#gift_rand_data{id = 99070401,
		     name = lang:get(<<"4星斗战耳环"/utf8>>), bid = 7040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070401,
		     name = lang:get(<<"4星斗战耳环"/utf8>>), bid = 7040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070401,
		     name = lang:get(<<"4星斗战耳环"/utf8>>), bid = 7040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070301) ->
    [#gift_rand_data{id = 99070301,
		     name = lang:get(<<"3星斗战耳环"/utf8>>), bid = 7030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070301,
		     name = lang:get(<<"3星斗战耳环"/utf8>>), bid = 7030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070301,
		     name = lang:get(<<"3星斗战耳环"/utf8>>), bid = 7030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070201) ->
    [#gift_rand_data{id = 99070201,
		     name = lang:get(<<"2星斗战耳环"/utf8>>), bid = 7020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070201,
		     name = lang:get(<<"2星斗战耳环"/utf8>>), bid = 7020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070201,
		     name = lang:get(<<"2星斗战耳环"/utf8>>), bid = 7020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99070101) ->
    [#gift_rand_data{id = 99070101,
		     name = lang:get(<<"1星斗战耳环"/utf8>>), bid = 7010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070101,
		     name = lang:get(<<"1星斗战耳环"/utf8>>), bid = 7010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99070101,
		     name = lang:get(<<"1星斗战耳环"/utf8>>), bid = 7010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99061004) ->
    [#gift_rand_data{id = 99061004,
		     name = lang:get(<<"10星破法手镯"/utf8>>), bid = 6100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99061004,
		     name = lang:get(<<"10星破法手镯"/utf8>>), bid = 6100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99061004,
		     name = lang:get(<<"10星破法手镯"/utf8>>), bid = 6100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060904) ->
    [#gift_rand_data{id = 99060904,
		     name = lang:get(<<"9星破法手镯"/utf8>>), bid = 6090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060904,
		     name = lang:get(<<"9星破法手镯"/utf8>>), bid = 6090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060904,
		     name = lang:get(<<"9星破法手镯"/utf8>>), bid = 6090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060804) ->
    [#gift_rand_data{id = 99060804,
		     name = lang:get(<<"8星破法手镯"/utf8>>), bid = 6080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060804,
		     name = lang:get(<<"8星破法手镯"/utf8>>), bid = 6080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060804,
		     name = lang:get(<<"8星破法手镯"/utf8>>), bid = 6080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060704) ->
    [#gift_rand_data{id = 99060704,
		     name = lang:get(<<"7星破法手镯"/utf8>>), bid = 6070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060704,
		     name = lang:get(<<"7星破法手镯"/utf8>>), bid = 6070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060704,
		     name = lang:get(<<"7星破法手镯"/utf8>>), bid = 6070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060604) ->
    [#gift_rand_data{id = 99060604,
		     name = lang:get(<<"6星破法手镯"/utf8>>), bid = 6060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060604,
		     name = lang:get(<<"6星破法手镯"/utf8>>), bid = 6060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060604,
		     name = lang:get(<<"6星破法手镯"/utf8>>), bid = 6060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060504) ->
    [#gift_rand_data{id = 99060504,
		     name = lang:get(<<"5星破法手镯"/utf8>>), bid = 6050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060504,
		     name = lang:get(<<"5星破法手镯"/utf8>>), bid = 6050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060504,
		     name = lang:get(<<"5星破法手镯"/utf8>>), bid = 6050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060404) ->
    [#gift_rand_data{id = 99060404,
		     name = lang:get(<<"4星破法手镯"/utf8>>), bid = 6040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060404,
		     name = lang:get(<<"4星破法手镯"/utf8>>), bid = 6040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060404,
		     name = lang:get(<<"4星破法手镯"/utf8>>), bid = 6040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060304) ->
    [#gift_rand_data{id = 99060304,
		     name = lang:get(<<"3星破法手镯"/utf8>>), bid = 6030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060304,
		     name = lang:get(<<"3星破法手镯"/utf8>>), bid = 6030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060304,
		     name = lang:get(<<"3星破法手镯"/utf8>>), bid = 6030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060204) ->
    [#gift_rand_data{id = 99060204,
		     name = lang:get(<<"2星破法手镯"/utf8>>), bid = 6020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060204,
		     name = lang:get(<<"2星破法手镯"/utf8>>), bid = 6020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060204,
		     name = lang:get(<<"2星破法手镯"/utf8>>), bid = 6020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060104) ->
    [#gift_rand_data{id = 99060104,
		     name = lang:get(<<"1星破法手镯"/utf8>>), bid = 6010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060104,
		     name = lang:get(<<"1星破法手镯"/utf8>>), bid = 6010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060104,
		     name = lang:get(<<"1星破法手镯"/utf8>>), bid = 6010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99061003) ->
    [#gift_rand_data{id = 99061003,
		     name = lang:get(<<"10星破法戒指"/utf8>>), bid = 6100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99061003,
		     name = lang:get(<<"10星破法戒指"/utf8>>), bid = 6100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99061003,
		     name = lang:get(<<"10星破法戒指"/utf8>>), bid = 6100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060903) ->
    [#gift_rand_data{id = 99060903,
		     name = lang:get(<<"9星破法戒指"/utf8>>), bid = 6090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060903,
		     name = lang:get(<<"9星破法戒指"/utf8>>), bid = 6090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060903,
		     name = lang:get(<<"9星破法戒指"/utf8>>), bid = 6090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060803) ->
    [#gift_rand_data{id = 99060803,
		     name = lang:get(<<"8星破法戒指"/utf8>>), bid = 6080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060803,
		     name = lang:get(<<"8星破法戒指"/utf8>>), bid = 6080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060803,
		     name = lang:get(<<"8星破法戒指"/utf8>>), bid = 6080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060703) ->
    [#gift_rand_data{id = 99060703,
		     name = lang:get(<<"7星破法戒指"/utf8>>), bid = 6070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060703,
		     name = lang:get(<<"7星破法戒指"/utf8>>), bid = 6070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060703,
		     name = lang:get(<<"7星破法戒指"/utf8>>), bid = 6070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060603) ->
    [#gift_rand_data{id = 99060603,
		     name = lang:get(<<"6星破法戒指"/utf8>>), bid = 6060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060603,
		     name = lang:get(<<"6星破法戒指"/utf8>>), bid = 6060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060603,
		     name = lang:get(<<"6星破法戒指"/utf8>>), bid = 6060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060503) ->
    [#gift_rand_data{id = 99060503,
		     name = lang:get(<<"5星破法戒指"/utf8>>), bid = 6050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060503,
		     name = lang:get(<<"5星破法戒指"/utf8>>), bid = 6050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060503,
		     name = lang:get(<<"5星破法戒指"/utf8>>), bid = 6050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060403) ->
    [#gift_rand_data{id = 99060403,
		     name = lang:get(<<"4星破法戒指"/utf8>>), bid = 6040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060403,
		     name = lang:get(<<"4星破法戒指"/utf8>>), bid = 6040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060403,
		     name = lang:get(<<"4星破法戒指"/utf8>>), bid = 6040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060303) ->
    [#gift_rand_data{id = 99060303,
		     name = lang:get(<<"3星破法戒指"/utf8>>), bid = 6030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060303,
		     name = lang:get(<<"3星破法戒指"/utf8>>), bid = 6030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060303,
		     name = lang:get(<<"3星破法戒指"/utf8>>), bid = 6030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060203) ->
    [#gift_rand_data{id = 99060203,
		     name = lang:get(<<"2星破法戒指"/utf8>>), bid = 6020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060203,
		     name = lang:get(<<"2星破法戒指"/utf8>>), bid = 6020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060203,
		     name = lang:get(<<"2星破法戒指"/utf8>>), bid = 6020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060103) ->
    [#gift_rand_data{id = 99060103,
		     name = lang:get(<<"1星破法戒指"/utf8>>), bid = 6010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060103,
		     name = lang:get(<<"1星破法戒指"/utf8>>), bid = 6010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060103,
		     name = lang:get(<<"1星破法戒指"/utf8>>), bid = 6010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99061002) ->
    [#gift_rand_data{id = 99061002,
		     name = lang:get(<<"10星破法项链"/utf8>>), bid = 6100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99061002,
		     name = lang:get(<<"10星破法项链"/utf8>>), bid = 6100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99061002,
		     name = lang:get(<<"10星破法项链"/utf8>>), bid = 6100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060902) ->
    [#gift_rand_data{id = 99060902,
		     name = lang:get(<<"9星破法项链"/utf8>>), bid = 6090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060902,
		     name = lang:get(<<"9星破法项链"/utf8>>), bid = 6090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060902,
		     name = lang:get(<<"9星破法项链"/utf8>>), bid = 6090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060802) ->
    [#gift_rand_data{id = 99060802,
		     name = lang:get(<<"8星破法项链"/utf8>>), bid = 6080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060802,
		     name = lang:get(<<"8星破法项链"/utf8>>), bid = 6080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060802,
		     name = lang:get(<<"8星破法项链"/utf8>>), bid = 6080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060702) ->
    [#gift_rand_data{id = 99060702,
		     name = lang:get(<<"7星破法项链"/utf8>>), bid = 6070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060702,
		     name = lang:get(<<"7星破法项链"/utf8>>), bid = 6070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060702,
		     name = lang:get(<<"7星破法项链"/utf8>>), bid = 6070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060602) ->
    [#gift_rand_data{id = 99060602,
		     name = lang:get(<<"6星破法项链"/utf8>>), bid = 6060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060602,
		     name = lang:get(<<"6星破法项链"/utf8>>), bid = 6060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060602,
		     name = lang:get(<<"6星破法项链"/utf8>>), bid = 6060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060502) ->
    [#gift_rand_data{id = 99060502,
		     name = lang:get(<<"5星破法项链"/utf8>>), bid = 6050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060502,
		     name = lang:get(<<"5星破法项链"/utf8>>), bid = 6050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060502,
		     name = lang:get(<<"5星破法项链"/utf8>>), bid = 6050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060402) ->
    [#gift_rand_data{id = 99060402,
		     name = lang:get(<<"4星破法项链"/utf8>>), bid = 6040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060402,
		     name = lang:get(<<"4星破法项链"/utf8>>), bid = 6040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060402,
		     name = lang:get(<<"4星破法项链"/utf8>>), bid = 6040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060302) ->
    [#gift_rand_data{id = 99060302,
		     name = lang:get(<<"3星破法项链"/utf8>>), bid = 6030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060302,
		     name = lang:get(<<"3星破法项链"/utf8>>), bid = 6030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060302,
		     name = lang:get(<<"3星破法项链"/utf8>>), bid = 6030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060202) ->
    [#gift_rand_data{id = 99060202,
		     name = lang:get(<<"2星破法项链"/utf8>>), bid = 6020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060202,
		     name = lang:get(<<"2星破法项链"/utf8>>), bid = 6020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060202,
		     name = lang:get(<<"2星破法项链"/utf8>>), bid = 6020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060102) ->
    [#gift_rand_data{id = 99060102,
		     name = lang:get(<<"1星破法项链"/utf8>>), bid = 6010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060102,
		     name = lang:get(<<"1星破法项链"/utf8>>), bid = 6010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060102,
		     name = lang:get(<<"1星破法项链"/utf8>>), bid = 6010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99061001) ->
    [#gift_rand_data{id = 99061001,
		     name = lang:get(<<"10星破法耳环"/utf8>>), bid = 6100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99061001,
		     name = lang:get(<<"10星破法耳环"/utf8>>), bid = 6100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99061001,
		     name = lang:get(<<"10星破法耳环"/utf8>>), bid = 6100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060901) ->
    [#gift_rand_data{id = 99060901,
		     name = lang:get(<<"9星破法耳环"/utf8>>), bid = 6090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060901,
		     name = lang:get(<<"9星破法耳环"/utf8>>), bid = 6090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060901,
		     name = lang:get(<<"9星破法耳环"/utf8>>), bid = 6090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060801) ->
    [#gift_rand_data{id = 99060801,
		     name = lang:get(<<"8星破法耳环"/utf8>>), bid = 6080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060801,
		     name = lang:get(<<"8星破法耳环"/utf8>>), bid = 6080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060801,
		     name = lang:get(<<"8星破法耳环"/utf8>>), bid = 6080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060701) ->
    [#gift_rand_data{id = 99060701,
		     name = lang:get(<<"7星破法耳环"/utf8>>), bid = 6070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060701,
		     name = lang:get(<<"7星破法耳环"/utf8>>), bid = 6070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060701,
		     name = lang:get(<<"7星破法耳环"/utf8>>), bid = 6070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060601) ->
    [#gift_rand_data{id = 99060601,
		     name = lang:get(<<"6星破法耳环"/utf8>>), bid = 6060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060601,
		     name = lang:get(<<"6星破法耳环"/utf8>>), bid = 6060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060601,
		     name = lang:get(<<"6星破法耳环"/utf8>>), bid = 6060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060501) ->
    [#gift_rand_data{id = 99060501,
		     name = lang:get(<<"5星破法耳环"/utf8>>), bid = 6050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060501,
		     name = lang:get(<<"5星破法耳环"/utf8>>), bid = 6050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060501,
		     name = lang:get(<<"5星破法耳环"/utf8>>), bid = 6050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060401) ->
    [#gift_rand_data{id = 99060401,
		     name = lang:get(<<"4星破法耳环"/utf8>>), bid = 6040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060401,
		     name = lang:get(<<"4星破法耳环"/utf8>>), bid = 6040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060401,
		     name = lang:get(<<"4星破法耳环"/utf8>>), bid = 6040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060301) ->
    [#gift_rand_data{id = 99060301,
		     name = lang:get(<<"3星破法耳环"/utf8>>), bid = 6030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060301,
		     name = lang:get(<<"3星破法耳环"/utf8>>), bid = 6030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060301,
		     name = lang:get(<<"3星破法耳环"/utf8>>), bid = 6030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060201) ->
    [#gift_rand_data{id = 99060201,
		     name = lang:get(<<"2星破法耳环"/utf8>>), bid = 6020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060201,
		     name = lang:get(<<"2星破法耳环"/utf8>>), bid = 6020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060201,
		     name = lang:get(<<"2星破法耳环"/utf8>>), bid = 6020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99060101) ->
    [#gift_rand_data{id = 99060101,
		     name = lang:get(<<"1星破法耳环"/utf8>>), bid = 6010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060101,
		     name = lang:get(<<"1星破法耳环"/utf8>>), bid = 6010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99060101,
		     name = lang:get(<<"1星破法耳环"/utf8>>), bid = 6010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99051004) ->
    [#gift_rand_data{id = 99051004,
		     name = lang:get(<<"10星穿甲手镯"/utf8>>), bid = 5100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99051004,
		     name = lang:get(<<"10星穿甲手镯"/utf8>>), bid = 5100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99051004,
		     name = lang:get(<<"10星穿甲手镯"/utf8>>), bid = 5100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050904) ->
    [#gift_rand_data{id = 99050904,
		     name = lang:get(<<"9星穿甲手镯"/utf8>>), bid = 5090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050904,
		     name = lang:get(<<"9星穿甲手镯"/utf8>>), bid = 5090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050904,
		     name = lang:get(<<"9星穿甲手镯"/utf8>>), bid = 5090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050804) ->
    [#gift_rand_data{id = 99050804,
		     name = lang:get(<<"8星穿甲手镯"/utf8>>), bid = 5080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050804,
		     name = lang:get(<<"8星穿甲手镯"/utf8>>), bid = 5080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050804,
		     name = lang:get(<<"8星穿甲手镯"/utf8>>), bid = 5080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050704) ->
    [#gift_rand_data{id = 99050704,
		     name = lang:get(<<"7星穿甲手镯"/utf8>>), bid = 5070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050704,
		     name = lang:get(<<"7星穿甲手镯"/utf8>>), bid = 5070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050704,
		     name = lang:get(<<"7星穿甲手镯"/utf8>>), bid = 5070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050604) ->
    [#gift_rand_data{id = 99050604,
		     name = lang:get(<<"6星穿甲手镯"/utf8>>), bid = 5060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050604,
		     name = lang:get(<<"6星穿甲手镯"/utf8>>), bid = 5060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050604,
		     name = lang:get(<<"6星穿甲手镯"/utf8>>), bid = 5060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050504) ->
    [#gift_rand_data{id = 99050504,
		     name = lang:get(<<"5星穿甲手镯"/utf8>>), bid = 5050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050504,
		     name = lang:get(<<"5星穿甲手镯"/utf8>>), bid = 5050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050504,
		     name = lang:get(<<"5星穿甲手镯"/utf8>>), bid = 5050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050404) ->
    [#gift_rand_data{id = 99050404,
		     name = lang:get(<<"4星穿甲手镯"/utf8>>), bid = 5040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050404,
		     name = lang:get(<<"4星穿甲手镯"/utf8>>), bid = 5040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050404,
		     name = lang:get(<<"4星穿甲手镯"/utf8>>), bid = 5040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050304) ->
    [#gift_rand_data{id = 99050304,
		     name = lang:get(<<"3星穿甲手镯"/utf8>>), bid = 5030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050304,
		     name = lang:get(<<"3星穿甲手镯"/utf8>>), bid = 5030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050304,
		     name = lang:get(<<"3星穿甲手镯"/utf8>>), bid = 5030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050204) ->
    [#gift_rand_data{id = 99050204,
		     name = lang:get(<<"2星穿甲手镯"/utf8>>), bid = 5020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050204,
		     name = lang:get(<<"2星穿甲手镯"/utf8>>), bid = 5020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050204,
		     name = lang:get(<<"2星穿甲手镯"/utf8>>), bid = 5020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050104) ->
    [#gift_rand_data{id = 99050104,
		     name = lang:get(<<"1星穿甲手镯"/utf8>>), bid = 5010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050104,
		     name = lang:get(<<"1星穿甲手镯"/utf8>>), bid = 5010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050104,
		     name = lang:get(<<"1星穿甲手镯"/utf8>>), bid = 5010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99051003) ->
    [#gift_rand_data{id = 99051003,
		     name = lang:get(<<"10星穿甲戒指"/utf8>>), bid = 5100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99051003,
		     name = lang:get(<<"10星穿甲戒指"/utf8>>), bid = 5100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99051003,
		     name = lang:get(<<"10星穿甲戒指"/utf8>>), bid = 5100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050903) ->
    [#gift_rand_data{id = 99050903,
		     name = lang:get(<<"9星穿甲戒指"/utf8>>), bid = 5090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050903,
		     name = lang:get(<<"9星穿甲戒指"/utf8>>), bid = 5090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050903,
		     name = lang:get(<<"9星穿甲戒指"/utf8>>), bid = 5090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050803) ->
    [#gift_rand_data{id = 99050803,
		     name = lang:get(<<"8星穿甲戒指"/utf8>>), bid = 5080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050803,
		     name = lang:get(<<"8星穿甲戒指"/utf8>>), bid = 5080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050803,
		     name = lang:get(<<"8星穿甲戒指"/utf8>>), bid = 5080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050703) ->
    [#gift_rand_data{id = 99050703,
		     name = lang:get(<<"7星穿甲戒指"/utf8>>), bid = 5070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050703,
		     name = lang:get(<<"7星穿甲戒指"/utf8>>), bid = 5070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050703,
		     name = lang:get(<<"7星穿甲戒指"/utf8>>), bid = 5070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050603) ->
    [#gift_rand_data{id = 99050603,
		     name = lang:get(<<"6星穿甲戒指"/utf8>>), bid = 5060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050603,
		     name = lang:get(<<"6星穿甲戒指"/utf8>>), bid = 5060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050603,
		     name = lang:get(<<"6星穿甲戒指"/utf8>>), bid = 5060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050503) ->
    [#gift_rand_data{id = 99050503,
		     name = lang:get(<<"5星穿甲戒指"/utf8>>), bid = 5050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050503,
		     name = lang:get(<<"5星穿甲戒指"/utf8>>), bid = 5050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050503,
		     name = lang:get(<<"5星穿甲戒指"/utf8>>), bid = 5050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050403) ->
    [#gift_rand_data{id = 99050403,
		     name = lang:get(<<"4星穿甲戒指"/utf8>>), bid = 5040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050403,
		     name = lang:get(<<"4星穿甲戒指"/utf8>>), bid = 5040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050403,
		     name = lang:get(<<"4星穿甲戒指"/utf8>>), bid = 5040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050303) ->
    [#gift_rand_data{id = 99050303,
		     name = lang:get(<<"3星穿甲戒指"/utf8>>), bid = 5030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050303,
		     name = lang:get(<<"3星穿甲戒指"/utf8>>), bid = 5030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050303,
		     name = lang:get(<<"3星穿甲戒指"/utf8>>), bid = 5030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050203) ->
    [#gift_rand_data{id = 99050203,
		     name = lang:get(<<"2星穿甲戒指"/utf8>>), bid = 5020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050203,
		     name = lang:get(<<"2星穿甲戒指"/utf8>>), bid = 5020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050203,
		     name = lang:get(<<"2星穿甲戒指"/utf8>>), bid = 5020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050103) ->
    [#gift_rand_data{id = 99050103,
		     name = lang:get(<<"1星穿甲戒指"/utf8>>), bid = 5010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050103,
		     name = lang:get(<<"1星穿甲戒指"/utf8>>), bid = 5010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050103,
		     name = lang:get(<<"1星穿甲戒指"/utf8>>), bid = 5010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99051002) ->
    [#gift_rand_data{id = 99051002,
		     name = lang:get(<<"10星穿甲项链"/utf8>>), bid = 5100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99051002,
		     name = lang:get(<<"10星穿甲项链"/utf8>>), bid = 5100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99051002,
		     name = lang:get(<<"10星穿甲项链"/utf8>>), bid = 5100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050902) ->
    [#gift_rand_data{id = 99050902,
		     name = lang:get(<<"9星穿甲项链"/utf8>>), bid = 5090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050902,
		     name = lang:get(<<"9星穿甲项链"/utf8>>), bid = 5090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050902,
		     name = lang:get(<<"9星穿甲项链"/utf8>>), bid = 5090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050802) ->
    [#gift_rand_data{id = 99050802,
		     name = lang:get(<<"8星穿甲项链"/utf8>>), bid = 5080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050802,
		     name = lang:get(<<"8星穿甲项链"/utf8>>), bid = 5080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050802,
		     name = lang:get(<<"8星穿甲项链"/utf8>>), bid = 5080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050702) ->
    [#gift_rand_data{id = 99050702,
		     name = lang:get(<<"7星穿甲项链"/utf8>>), bid = 5070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050702,
		     name = lang:get(<<"7星穿甲项链"/utf8>>), bid = 5070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050702,
		     name = lang:get(<<"7星穿甲项链"/utf8>>), bid = 5070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050602) ->
    [#gift_rand_data{id = 99050602,
		     name = lang:get(<<"6星穿甲项链"/utf8>>), bid = 5060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050602,
		     name = lang:get(<<"6星穿甲项链"/utf8>>), bid = 5060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050602,
		     name = lang:get(<<"6星穿甲项链"/utf8>>), bid = 5060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050502) ->
    [#gift_rand_data{id = 99050502,
		     name = lang:get(<<"5星穿甲项链"/utf8>>), bid = 5050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050502,
		     name = lang:get(<<"5星穿甲项链"/utf8>>), bid = 5050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050502,
		     name = lang:get(<<"5星穿甲项链"/utf8>>), bid = 5050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050402) ->
    [#gift_rand_data{id = 99050402,
		     name = lang:get(<<"4星穿甲项链"/utf8>>), bid = 5040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050402,
		     name = lang:get(<<"4星穿甲项链"/utf8>>), bid = 5040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050402,
		     name = lang:get(<<"4星穿甲项链"/utf8>>), bid = 5040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050302) ->
    [#gift_rand_data{id = 99050302,
		     name = lang:get(<<"3星穿甲项链"/utf8>>), bid = 5030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050302,
		     name = lang:get(<<"3星穿甲项链"/utf8>>), bid = 5030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050302,
		     name = lang:get(<<"3星穿甲项链"/utf8>>), bid = 5030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050202) ->
    [#gift_rand_data{id = 99050202,
		     name = lang:get(<<"2星穿甲项链"/utf8>>), bid = 5020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050202,
		     name = lang:get(<<"2星穿甲项链"/utf8>>), bid = 5020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050202,
		     name = lang:get(<<"2星穿甲项链"/utf8>>), bid = 5020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050102) ->
    [#gift_rand_data{id = 99050102,
		     name = lang:get(<<"1星穿甲项链"/utf8>>), bid = 5010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050102,
		     name = lang:get(<<"1星穿甲项链"/utf8>>), bid = 5010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050102,
		     name = lang:get(<<"1星穿甲项链"/utf8>>), bid = 5010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99051001) ->
    [#gift_rand_data{id = 99051001,
		     name = lang:get(<<"10星穿甲耳环"/utf8>>), bid = 5100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99051001,
		     name = lang:get(<<"10星穿甲耳环"/utf8>>), bid = 5100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99051001,
		     name = lang:get(<<"10星穿甲耳环"/utf8>>), bid = 5100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050901) ->
    [#gift_rand_data{id = 99050901,
		     name = lang:get(<<"9星穿甲耳环"/utf8>>), bid = 5090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050901,
		     name = lang:get(<<"9星穿甲耳环"/utf8>>), bid = 5090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050901,
		     name = lang:get(<<"9星穿甲耳环"/utf8>>), bid = 5090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050801) ->
    [#gift_rand_data{id = 99050801,
		     name = lang:get(<<"8星穿甲耳环"/utf8>>), bid = 5080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050801,
		     name = lang:get(<<"8星穿甲耳环"/utf8>>), bid = 5080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050801,
		     name = lang:get(<<"8星穿甲耳环"/utf8>>), bid = 5080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050701) ->
    [#gift_rand_data{id = 99050701,
		     name = lang:get(<<"7星穿甲耳环"/utf8>>), bid = 5070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050701,
		     name = lang:get(<<"7星穿甲耳环"/utf8>>), bid = 5070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050701,
		     name = lang:get(<<"7星穿甲耳环"/utf8>>), bid = 5070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050601) ->
    [#gift_rand_data{id = 99050601,
		     name = lang:get(<<"6星穿甲耳环"/utf8>>), bid = 5060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050601,
		     name = lang:get(<<"6星穿甲耳环"/utf8>>), bid = 5060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050601,
		     name = lang:get(<<"6星穿甲耳环"/utf8>>), bid = 5060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050501) ->
    [#gift_rand_data{id = 99050501,
		     name = lang:get(<<"5星穿甲耳环"/utf8>>), bid = 5050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050501,
		     name = lang:get(<<"5星穿甲耳环"/utf8>>), bid = 5050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050501,
		     name = lang:get(<<"5星穿甲耳环"/utf8>>), bid = 5050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050401) ->
    [#gift_rand_data{id = 99050401,
		     name = lang:get(<<"4星穿甲耳环"/utf8>>), bid = 5040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050401,
		     name = lang:get(<<"4星穿甲耳环"/utf8>>), bid = 5040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050401,
		     name = lang:get(<<"4星穿甲耳环"/utf8>>), bid = 5040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050301) ->
    [#gift_rand_data{id = 99050301,
		     name = lang:get(<<"3星穿甲耳环"/utf8>>), bid = 5030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050301,
		     name = lang:get(<<"3星穿甲耳环"/utf8>>), bid = 5030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050301,
		     name = lang:get(<<"3星穿甲耳环"/utf8>>), bid = 5030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050201) ->
    [#gift_rand_data{id = 99050201,
		     name = lang:get(<<"2星穿甲耳环"/utf8>>), bid = 5020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050201,
		     name = lang:get(<<"2星穿甲耳环"/utf8>>), bid = 5020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050201,
		     name = lang:get(<<"2星穿甲耳环"/utf8>>), bid = 5020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99050101) ->
    [#gift_rand_data{id = 99050101,
		     name = lang:get(<<"1星穿甲耳环"/utf8>>), bid = 5010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050101,
		     name = lang:get(<<"1星穿甲耳环"/utf8>>), bid = 5010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99050101,
		     name = lang:get(<<"1星穿甲耳环"/utf8>>), bid = 5010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99041004) ->
    [#gift_rand_data{id = 99041004,
		     name = lang:get(<<"10星灵咏手镯"/utf8>>), bid = 4100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99041004,
		     name = lang:get(<<"10星灵咏手镯"/utf8>>), bid = 4100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99041004,
		     name = lang:get(<<"10星灵咏手镯"/utf8>>), bid = 4100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040904) ->
    [#gift_rand_data{id = 99040904,
		     name = lang:get(<<"9星灵咏手镯"/utf8>>), bid = 4090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040904,
		     name = lang:get(<<"9星灵咏手镯"/utf8>>), bid = 4090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040904,
		     name = lang:get(<<"9星灵咏手镯"/utf8>>), bid = 4090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040804) ->
    [#gift_rand_data{id = 99040804,
		     name = lang:get(<<"8星灵咏手镯"/utf8>>), bid = 4080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040804,
		     name = lang:get(<<"8星灵咏手镯"/utf8>>), bid = 4080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040804,
		     name = lang:get(<<"8星灵咏手镯"/utf8>>), bid = 4080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040704) ->
    [#gift_rand_data{id = 99040704,
		     name = lang:get(<<"7星灵咏手镯"/utf8>>), bid = 4070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040704,
		     name = lang:get(<<"7星灵咏手镯"/utf8>>), bid = 4070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040704,
		     name = lang:get(<<"7星灵咏手镯"/utf8>>), bid = 4070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040604) ->
    [#gift_rand_data{id = 99040604,
		     name = lang:get(<<"6星灵咏手镯"/utf8>>), bid = 4060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040604,
		     name = lang:get(<<"6星灵咏手镯"/utf8>>), bid = 4060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040604,
		     name = lang:get(<<"6星灵咏手镯"/utf8>>), bid = 4060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040504) ->
    [#gift_rand_data{id = 99040504,
		     name = lang:get(<<"5星灵咏手镯"/utf8>>), bid = 4050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040504,
		     name = lang:get(<<"5星灵咏手镯"/utf8>>), bid = 4050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040504,
		     name = lang:get(<<"5星灵咏手镯"/utf8>>), bid = 4050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040404) ->
    [#gift_rand_data{id = 99040404,
		     name = lang:get(<<"4星灵咏手镯"/utf8>>), bid = 4040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040404,
		     name = lang:get(<<"4星灵咏手镯"/utf8>>), bid = 4040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040404,
		     name = lang:get(<<"4星灵咏手镯"/utf8>>), bid = 4040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040304) ->
    [#gift_rand_data{id = 99040304,
		     name = lang:get(<<"3星灵咏手镯"/utf8>>), bid = 4030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040304,
		     name = lang:get(<<"3星灵咏手镯"/utf8>>), bid = 4030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040304,
		     name = lang:get(<<"3星灵咏手镯"/utf8>>), bid = 4030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040204) ->
    [#gift_rand_data{id = 99040204,
		     name = lang:get(<<"2星灵咏手镯"/utf8>>), bid = 4020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040204,
		     name = lang:get(<<"2星灵咏手镯"/utf8>>), bid = 4020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040204,
		     name = lang:get(<<"2星灵咏手镯"/utf8>>), bid = 4020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040104) ->
    [#gift_rand_data{id = 99040104,
		     name = lang:get(<<"1星灵咏手镯"/utf8>>), bid = 4010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040104,
		     name = lang:get(<<"1星灵咏手镯"/utf8>>), bid = 4010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040104,
		     name = lang:get(<<"1星灵咏手镯"/utf8>>), bid = 4010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99041003) ->
    [#gift_rand_data{id = 99041003,
		     name = lang:get(<<"10星灵咏戒指"/utf8>>), bid = 4100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99041003,
		     name = lang:get(<<"10星灵咏戒指"/utf8>>), bid = 4100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99041003,
		     name = lang:get(<<"10星灵咏戒指"/utf8>>), bid = 4100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040903) ->
    [#gift_rand_data{id = 99040903,
		     name = lang:get(<<"9星灵咏戒指"/utf8>>), bid = 4090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040903,
		     name = lang:get(<<"9星灵咏戒指"/utf8>>), bid = 4090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040903,
		     name = lang:get(<<"9星灵咏戒指"/utf8>>), bid = 4090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040803) ->
    [#gift_rand_data{id = 99040803,
		     name = lang:get(<<"8星灵咏戒指"/utf8>>), bid = 4080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040803,
		     name = lang:get(<<"8星灵咏戒指"/utf8>>), bid = 4080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040803,
		     name = lang:get(<<"8星灵咏戒指"/utf8>>), bid = 4080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040703) ->
    [#gift_rand_data{id = 99040703,
		     name = lang:get(<<"7星灵咏戒指"/utf8>>), bid = 4070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040703,
		     name = lang:get(<<"7星灵咏戒指"/utf8>>), bid = 4070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040703,
		     name = lang:get(<<"7星灵咏戒指"/utf8>>), bid = 4070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040603) ->
    [#gift_rand_data{id = 99040603,
		     name = lang:get(<<"6星灵咏戒指"/utf8>>), bid = 4060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040603,
		     name = lang:get(<<"6星灵咏戒指"/utf8>>), bid = 4060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040603,
		     name = lang:get(<<"6星灵咏戒指"/utf8>>), bid = 4060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040503) ->
    [#gift_rand_data{id = 99040503,
		     name = lang:get(<<"5星灵咏戒指"/utf8>>), bid = 4050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040503,
		     name = lang:get(<<"5星灵咏戒指"/utf8>>), bid = 4050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040503,
		     name = lang:get(<<"5星灵咏戒指"/utf8>>), bid = 4050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040403) ->
    [#gift_rand_data{id = 99040403,
		     name = lang:get(<<"4星灵咏戒指"/utf8>>), bid = 4040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040403,
		     name = lang:get(<<"4星灵咏戒指"/utf8>>), bid = 4040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040403,
		     name = lang:get(<<"4星灵咏戒指"/utf8>>), bid = 4040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040303) ->
    [#gift_rand_data{id = 99040303,
		     name = lang:get(<<"3星灵咏戒指"/utf8>>), bid = 4030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040303,
		     name = lang:get(<<"3星灵咏戒指"/utf8>>), bid = 4030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040303,
		     name = lang:get(<<"3星灵咏戒指"/utf8>>), bid = 4030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040203) ->
    [#gift_rand_data{id = 99040203,
		     name = lang:get(<<"2星灵咏戒指"/utf8>>), bid = 4020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040203,
		     name = lang:get(<<"2星灵咏戒指"/utf8>>), bid = 4020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040203,
		     name = lang:get(<<"2星灵咏戒指"/utf8>>), bid = 4020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040103) ->
    [#gift_rand_data{id = 99040103,
		     name = lang:get(<<"1星灵咏戒指"/utf8>>), bid = 4010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040103,
		     name = lang:get(<<"1星灵咏戒指"/utf8>>), bid = 4010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040103,
		     name = lang:get(<<"1星灵咏戒指"/utf8>>), bid = 4010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99041002) ->
    [#gift_rand_data{id = 99041002,
		     name = lang:get(<<"10星灵咏项链"/utf8>>), bid = 4100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99041002,
		     name = lang:get(<<"10星灵咏项链"/utf8>>), bid = 4100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99041002,
		     name = lang:get(<<"10星灵咏项链"/utf8>>), bid = 4100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040902) ->
    [#gift_rand_data{id = 99040902,
		     name = lang:get(<<"9星灵咏项链"/utf8>>), bid = 4090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040902,
		     name = lang:get(<<"9星灵咏项链"/utf8>>), bid = 4090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040902,
		     name = lang:get(<<"9星灵咏项链"/utf8>>), bid = 4090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040802) ->
    [#gift_rand_data{id = 99040802,
		     name = lang:get(<<"8星灵咏项链"/utf8>>), bid = 4080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040802,
		     name = lang:get(<<"8星灵咏项链"/utf8>>), bid = 4080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040802,
		     name = lang:get(<<"8星灵咏项链"/utf8>>), bid = 4080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040702) ->
    [#gift_rand_data{id = 99040702,
		     name = lang:get(<<"7星灵咏项链"/utf8>>), bid = 4070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040702,
		     name = lang:get(<<"7星灵咏项链"/utf8>>), bid = 4070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040702,
		     name = lang:get(<<"7星灵咏项链"/utf8>>), bid = 4070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040602) ->
    [#gift_rand_data{id = 99040602,
		     name = lang:get(<<"6星灵咏项链"/utf8>>), bid = 4060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040602,
		     name = lang:get(<<"6星灵咏项链"/utf8>>), bid = 4060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040602,
		     name = lang:get(<<"6星灵咏项链"/utf8>>), bid = 4060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040502) ->
    [#gift_rand_data{id = 99040502,
		     name = lang:get(<<"5星灵咏项链"/utf8>>), bid = 4050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040502,
		     name = lang:get(<<"5星灵咏项链"/utf8>>), bid = 4050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040502,
		     name = lang:get(<<"5星灵咏项链"/utf8>>), bid = 4050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040402) ->
    [#gift_rand_data{id = 99040402,
		     name = lang:get(<<"4星灵咏项链"/utf8>>), bid = 4040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040402,
		     name = lang:get(<<"4星灵咏项链"/utf8>>), bid = 4040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040402,
		     name = lang:get(<<"4星灵咏项链"/utf8>>), bid = 4040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040302) ->
    [#gift_rand_data{id = 99040302,
		     name = lang:get(<<"3星灵咏项链"/utf8>>), bid = 4030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040302,
		     name = lang:get(<<"3星灵咏项链"/utf8>>), bid = 4030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040302,
		     name = lang:get(<<"3星灵咏项链"/utf8>>), bid = 4030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040202) ->
    [#gift_rand_data{id = 99040202,
		     name = lang:get(<<"2星灵咏项链"/utf8>>), bid = 4020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040202,
		     name = lang:get(<<"2星灵咏项链"/utf8>>), bid = 4020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040202,
		     name = lang:get(<<"2星灵咏项链"/utf8>>), bid = 4020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040102) ->
    [#gift_rand_data{id = 99040102,
		     name = lang:get(<<"1星灵咏项链"/utf8>>), bid = 4010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040102,
		     name = lang:get(<<"1星灵咏项链"/utf8>>), bid = 4010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040102,
		     name = lang:get(<<"1星灵咏项链"/utf8>>), bid = 4010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99041001) ->
    [#gift_rand_data{id = 99041001,
		     name = lang:get(<<"10星灵咏耳环"/utf8>>), bid = 4100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99041001,
		     name = lang:get(<<"10星灵咏耳环"/utf8>>), bid = 4100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99041001,
		     name = lang:get(<<"10星灵咏耳环"/utf8>>), bid = 4100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040901) ->
    [#gift_rand_data{id = 99040901,
		     name = lang:get(<<"9星灵咏耳环"/utf8>>), bid = 4090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040901,
		     name = lang:get(<<"9星灵咏耳环"/utf8>>), bid = 4090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040901,
		     name = lang:get(<<"9星灵咏耳环"/utf8>>), bid = 4090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040801) ->
    [#gift_rand_data{id = 99040801,
		     name = lang:get(<<"8星灵咏耳环"/utf8>>), bid = 4080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040801,
		     name = lang:get(<<"8星灵咏耳环"/utf8>>), bid = 4080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040801,
		     name = lang:get(<<"8星灵咏耳环"/utf8>>), bid = 4080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040701) ->
    [#gift_rand_data{id = 99040701,
		     name = lang:get(<<"7星灵咏耳环"/utf8>>), bid = 4070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040701,
		     name = lang:get(<<"7星灵咏耳环"/utf8>>), bid = 4070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040701,
		     name = lang:get(<<"7星灵咏耳环"/utf8>>), bid = 4070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040601) ->
    [#gift_rand_data{id = 99040601,
		     name = lang:get(<<"6星灵咏耳环"/utf8>>), bid = 4060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040601,
		     name = lang:get(<<"6星灵咏耳环"/utf8>>), bid = 4060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040601,
		     name = lang:get(<<"6星灵咏耳环"/utf8>>), bid = 4060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040501) ->
    [#gift_rand_data{id = 99040501,
		     name = lang:get(<<"5星灵咏耳环"/utf8>>), bid = 4050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040501,
		     name = lang:get(<<"5星灵咏耳环"/utf8>>), bid = 4050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040501,
		     name = lang:get(<<"5星灵咏耳环"/utf8>>), bid = 4050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040401) ->
    [#gift_rand_data{id = 99040401,
		     name = lang:get(<<"4星灵咏耳环"/utf8>>), bid = 4040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040401,
		     name = lang:get(<<"4星灵咏耳环"/utf8>>), bid = 4040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040401,
		     name = lang:get(<<"4星灵咏耳环"/utf8>>), bid = 4040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040301) ->
    [#gift_rand_data{id = 99040301,
		     name = lang:get(<<"3星灵咏耳环"/utf8>>), bid = 4030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040301,
		     name = lang:get(<<"3星灵咏耳环"/utf8>>), bid = 4030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040301,
		     name = lang:get(<<"3星灵咏耳环"/utf8>>), bid = 4030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040201) ->
    [#gift_rand_data{id = 99040201,
		     name = lang:get(<<"2星灵咏耳环"/utf8>>), bid = 4020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040201,
		     name = lang:get(<<"2星灵咏耳环"/utf8>>), bid = 4020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040201,
		     name = lang:get(<<"2星灵咏耳环"/utf8>>), bid = 4020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99040101) ->
    [#gift_rand_data{id = 99040101,
		     name = lang:get(<<"1星灵咏耳环"/utf8>>), bid = 4010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040101,
		     name = lang:get(<<"1星灵咏耳环"/utf8>>), bid = 4010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99040101,
		     name = lang:get(<<"1星灵咏耳环"/utf8>>), bid = 4010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99031004) ->
    [#gift_rand_data{id = 99031004,
		     name = lang:get(<<"10星斗志手镯"/utf8>>), bid = 3100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99031004,
		     name = lang:get(<<"10星斗志手镯"/utf8>>), bid = 3100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99031004,
		     name = lang:get(<<"10星斗志手镯"/utf8>>), bid = 3100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030904) ->
    [#gift_rand_data{id = 99030904,
		     name = lang:get(<<"9星斗志手镯"/utf8>>), bid = 3090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030904,
		     name = lang:get(<<"9星斗志手镯"/utf8>>), bid = 3090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030904,
		     name = lang:get(<<"9星斗志手镯"/utf8>>), bid = 3090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030804) ->
    [#gift_rand_data{id = 99030804,
		     name = lang:get(<<"8星斗志手镯"/utf8>>), bid = 3080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030804,
		     name = lang:get(<<"8星斗志手镯"/utf8>>), bid = 3080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030804,
		     name = lang:get(<<"8星斗志手镯"/utf8>>), bid = 3080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030704) ->
    [#gift_rand_data{id = 99030704,
		     name = lang:get(<<"7星斗志手镯"/utf8>>), bid = 3070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030704,
		     name = lang:get(<<"7星斗志手镯"/utf8>>), bid = 3070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030704,
		     name = lang:get(<<"7星斗志手镯"/utf8>>), bid = 3070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030604) ->
    [#gift_rand_data{id = 99030604,
		     name = lang:get(<<"6星斗志手镯"/utf8>>), bid = 3060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030604,
		     name = lang:get(<<"6星斗志手镯"/utf8>>), bid = 3060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030604,
		     name = lang:get(<<"6星斗志手镯"/utf8>>), bid = 3060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030504) ->
    [#gift_rand_data{id = 99030504,
		     name = lang:get(<<"5星斗志手镯"/utf8>>), bid = 3050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030504,
		     name = lang:get(<<"5星斗志手镯"/utf8>>), bid = 3050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030504,
		     name = lang:get(<<"5星斗志手镯"/utf8>>), bid = 3050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030404) ->
    [#gift_rand_data{id = 99030404,
		     name = lang:get(<<"4星斗志手镯"/utf8>>), bid = 3040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030404,
		     name = lang:get(<<"4星斗志手镯"/utf8>>), bid = 3040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030404,
		     name = lang:get(<<"4星斗志手镯"/utf8>>), bid = 3040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030304) ->
    [#gift_rand_data{id = 99030304,
		     name = lang:get(<<"3星斗志手镯"/utf8>>), bid = 3030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030304,
		     name = lang:get(<<"3星斗志手镯"/utf8>>), bid = 3030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030304,
		     name = lang:get(<<"3星斗志手镯"/utf8>>), bid = 3030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030204) ->
    [#gift_rand_data{id = 99030204,
		     name = lang:get(<<"2星斗志手镯"/utf8>>), bid = 3020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030204,
		     name = lang:get(<<"2星斗志手镯"/utf8>>), bid = 3020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030204,
		     name = lang:get(<<"2星斗志手镯"/utf8>>), bid = 3020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030104) ->
    [#gift_rand_data{id = 99030104,
		     name = lang:get(<<"1星斗志手镯"/utf8>>), bid = 3010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030104,
		     name = lang:get(<<"1星斗志手镯"/utf8>>), bid = 3010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030104,
		     name = lang:get(<<"1星斗志手镯"/utf8>>), bid = 3010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99031003) ->
    [#gift_rand_data{id = 99031003,
		     name = lang:get(<<"10星斗志戒指"/utf8>>), bid = 3100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99031003,
		     name = lang:get(<<"10星斗志戒指"/utf8>>), bid = 3100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99031003,
		     name = lang:get(<<"10星斗志戒指"/utf8>>), bid = 3100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030903) ->
    [#gift_rand_data{id = 99030903,
		     name = lang:get(<<"9星斗志戒指"/utf8>>), bid = 3090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030903,
		     name = lang:get(<<"9星斗志戒指"/utf8>>), bid = 3090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030903,
		     name = lang:get(<<"9星斗志戒指"/utf8>>), bid = 3090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030803) ->
    [#gift_rand_data{id = 99030803,
		     name = lang:get(<<"8星斗志戒指"/utf8>>), bid = 3080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030803,
		     name = lang:get(<<"8星斗志戒指"/utf8>>), bid = 3080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030803,
		     name = lang:get(<<"8星斗志戒指"/utf8>>), bid = 3080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030703) ->
    [#gift_rand_data{id = 99030703,
		     name = lang:get(<<"7星斗志戒指"/utf8>>), bid = 3070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030703,
		     name = lang:get(<<"7星斗志戒指"/utf8>>), bid = 3070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030703,
		     name = lang:get(<<"7星斗志戒指"/utf8>>), bid = 3070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030603) ->
    [#gift_rand_data{id = 99030603,
		     name = lang:get(<<"6星斗志戒指"/utf8>>), bid = 3060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030603,
		     name = lang:get(<<"6星斗志戒指"/utf8>>), bid = 3060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030603,
		     name = lang:get(<<"6星斗志戒指"/utf8>>), bid = 3060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030503) ->
    [#gift_rand_data{id = 99030503,
		     name = lang:get(<<"5星斗志戒指"/utf8>>), bid = 3050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030503,
		     name = lang:get(<<"5星斗志戒指"/utf8>>), bid = 3050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030503,
		     name = lang:get(<<"5星斗志戒指"/utf8>>), bid = 3050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030403) ->
    [#gift_rand_data{id = 99030403,
		     name = lang:get(<<"4星斗志戒指"/utf8>>), bid = 3040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030403,
		     name = lang:get(<<"4星斗志戒指"/utf8>>), bid = 3040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030403,
		     name = lang:get(<<"4星斗志戒指"/utf8>>), bid = 3040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030303) ->
    [#gift_rand_data{id = 99030303,
		     name = lang:get(<<"3星斗志戒指"/utf8>>), bid = 3030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030303,
		     name = lang:get(<<"3星斗志戒指"/utf8>>), bid = 3030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030303,
		     name = lang:get(<<"3星斗志戒指"/utf8>>), bid = 3030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030203) ->
    [#gift_rand_data{id = 99030203,
		     name = lang:get(<<"2星斗志戒指"/utf8>>), bid = 3020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030203,
		     name = lang:get(<<"2星斗志戒指"/utf8>>), bid = 3020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030203,
		     name = lang:get(<<"2星斗志戒指"/utf8>>), bid = 3020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030103) ->
    [#gift_rand_data{id = 99030103,
		     name = lang:get(<<"1星斗志戒指"/utf8>>), bid = 3010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030103,
		     name = lang:get(<<"1星斗志戒指"/utf8>>), bid = 3010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030103,
		     name = lang:get(<<"1星斗志戒指"/utf8>>), bid = 3010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99031002) ->
    [#gift_rand_data{id = 99031002,
		     name = lang:get(<<"10星斗志项链"/utf8>>), bid = 3100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99031002,
		     name = lang:get(<<"10星斗志项链"/utf8>>), bid = 3100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99031002,
		     name = lang:get(<<"10星斗志项链"/utf8>>), bid = 3100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030902) ->
    [#gift_rand_data{id = 99030902,
		     name = lang:get(<<"9星斗志项链"/utf8>>), bid = 3090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030902,
		     name = lang:get(<<"9星斗志项链"/utf8>>), bid = 3090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030902,
		     name = lang:get(<<"9星斗志项链"/utf8>>), bid = 3090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030802) ->
    [#gift_rand_data{id = 99030802,
		     name = lang:get(<<"8星斗志项链"/utf8>>), bid = 3080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030802,
		     name = lang:get(<<"8星斗志项链"/utf8>>), bid = 3080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030802,
		     name = lang:get(<<"8星斗志项链"/utf8>>), bid = 3080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030702) ->
    [#gift_rand_data{id = 99030702,
		     name = lang:get(<<"7星斗志项链"/utf8>>), bid = 3070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030702,
		     name = lang:get(<<"7星斗志项链"/utf8>>), bid = 3070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030702,
		     name = lang:get(<<"7星斗志项链"/utf8>>), bid = 3070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030602) ->
    [#gift_rand_data{id = 99030602,
		     name = lang:get(<<"6星斗志项链"/utf8>>), bid = 3060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030602,
		     name = lang:get(<<"6星斗志项链"/utf8>>), bid = 3060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030602,
		     name = lang:get(<<"6星斗志项链"/utf8>>), bid = 3060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030502) ->
    [#gift_rand_data{id = 99030502,
		     name = lang:get(<<"5星斗志项链"/utf8>>), bid = 3050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030502,
		     name = lang:get(<<"5星斗志项链"/utf8>>), bid = 3050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030502,
		     name = lang:get(<<"5星斗志项链"/utf8>>), bid = 3050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030402) ->
    [#gift_rand_data{id = 99030402,
		     name = lang:get(<<"4星斗志项链"/utf8>>), bid = 3040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030402,
		     name = lang:get(<<"4星斗志项链"/utf8>>), bid = 3040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030402,
		     name = lang:get(<<"4星斗志项链"/utf8>>), bid = 3040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030302) ->
    [#gift_rand_data{id = 99030302,
		     name = lang:get(<<"3星斗志项链"/utf8>>), bid = 3030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030302,
		     name = lang:get(<<"3星斗志项链"/utf8>>), bid = 3030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030302,
		     name = lang:get(<<"3星斗志项链"/utf8>>), bid = 3030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030202) ->
    [#gift_rand_data{id = 99030202,
		     name = lang:get(<<"2星斗志项链"/utf8>>), bid = 3020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030202,
		     name = lang:get(<<"2星斗志项链"/utf8>>), bid = 3020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030202,
		     name = lang:get(<<"2星斗志项链"/utf8>>), bid = 3020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030102) ->
    [#gift_rand_data{id = 99030102,
		     name = lang:get(<<"1星斗志项链"/utf8>>), bid = 3010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030102,
		     name = lang:get(<<"1星斗志项链"/utf8>>), bid = 3010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030102,
		     name = lang:get(<<"1星斗志项链"/utf8>>), bid = 3010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99031001) ->
    [#gift_rand_data{id = 99031001,
		     name = lang:get(<<"10星斗志耳环"/utf8>>), bid = 3100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99031001,
		     name = lang:get(<<"10星斗志耳环"/utf8>>), bid = 3100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99031001,
		     name = lang:get(<<"10星斗志耳环"/utf8>>), bid = 3100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030901) ->
    [#gift_rand_data{id = 99030901,
		     name = lang:get(<<"9星斗志耳环"/utf8>>), bid = 3090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030901,
		     name = lang:get(<<"9星斗志耳环"/utf8>>), bid = 3090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030901,
		     name = lang:get(<<"9星斗志耳环"/utf8>>), bid = 3090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030801) ->
    [#gift_rand_data{id = 99030801,
		     name = lang:get(<<"8星斗志耳环"/utf8>>), bid = 3080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030801,
		     name = lang:get(<<"8星斗志耳环"/utf8>>), bid = 3080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030801,
		     name = lang:get(<<"8星斗志耳环"/utf8>>), bid = 3080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030701) ->
    [#gift_rand_data{id = 99030701,
		     name = lang:get(<<"7星斗志耳环"/utf8>>), bid = 3070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030701,
		     name = lang:get(<<"7星斗志耳环"/utf8>>), bid = 3070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030701,
		     name = lang:get(<<"7星斗志耳环"/utf8>>), bid = 3070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030601) ->
    [#gift_rand_data{id = 99030601,
		     name = lang:get(<<"6星斗志耳环"/utf8>>), bid = 3060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030601,
		     name = lang:get(<<"6星斗志耳环"/utf8>>), bid = 3060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030601,
		     name = lang:get(<<"6星斗志耳环"/utf8>>), bid = 3060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030501) ->
    [#gift_rand_data{id = 99030501,
		     name = lang:get(<<"5星斗志耳环"/utf8>>), bid = 3050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030501,
		     name = lang:get(<<"5星斗志耳环"/utf8>>), bid = 3050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030501,
		     name = lang:get(<<"5星斗志耳环"/utf8>>), bid = 3050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030401) ->
    [#gift_rand_data{id = 99030401,
		     name = lang:get(<<"4星斗志耳环"/utf8>>), bid = 3040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030401,
		     name = lang:get(<<"4星斗志耳环"/utf8>>), bid = 3040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030401,
		     name = lang:get(<<"4星斗志耳环"/utf8>>), bid = 3040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030301) ->
    [#gift_rand_data{id = 99030301,
		     name = lang:get(<<"3星斗志耳环"/utf8>>), bid = 3030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030301,
		     name = lang:get(<<"3星斗志耳环"/utf8>>), bid = 3030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030301,
		     name = lang:get(<<"3星斗志耳环"/utf8>>), bid = 3030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030201) ->
    [#gift_rand_data{id = 99030201,
		     name = lang:get(<<"2星斗志耳环"/utf8>>), bid = 3020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030201,
		     name = lang:get(<<"2星斗志耳环"/utf8>>), bid = 3020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030201,
		     name = lang:get(<<"2星斗志耳环"/utf8>>), bid = 3020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99030101) ->
    [#gift_rand_data{id = 99030101,
		     name = lang:get(<<"1星斗志耳环"/utf8>>), bid = 3010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030101,
		     name = lang:get(<<"1星斗志耳环"/utf8>>), bid = 3010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99030101,
		     name = lang:get(<<"1星斗志耳环"/utf8>>), bid = 3010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99021004) ->
    [#gift_rand_data{id = 99021004,
		     name = lang:get(<<"10星狂怒手镯"/utf8>>), bid = 2100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99021004,
		     name = lang:get(<<"10星狂怒手镯"/utf8>>), bid = 2100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99021004,
		     name = lang:get(<<"10星狂怒手镯"/utf8>>), bid = 2100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020904) ->
    [#gift_rand_data{id = 99020904,
		     name = lang:get(<<"9星狂怒手镯"/utf8>>), bid = 2090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020904,
		     name = lang:get(<<"9星狂怒手镯"/utf8>>), bid = 2090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020904,
		     name = lang:get(<<"9星狂怒手镯"/utf8>>), bid = 2090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020804) ->
    [#gift_rand_data{id = 99020804,
		     name = lang:get(<<"8星狂怒手镯"/utf8>>), bid = 2080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020804,
		     name = lang:get(<<"8星狂怒手镯"/utf8>>), bid = 2080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020804,
		     name = lang:get(<<"8星狂怒手镯"/utf8>>), bid = 2080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020704) ->
    [#gift_rand_data{id = 99020704,
		     name = lang:get(<<"7星狂怒手镯"/utf8>>), bid = 2070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020704,
		     name = lang:get(<<"7星狂怒手镯"/utf8>>), bid = 2070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020704,
		     name = lang:get(<<"7星狂怒手镯"/utf8>>), bid = 2070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020604) ->
    [#gift_rand_data{id = 99020604,
		     name = lang:get(<<"6星狂怒手镯"/utf8>>), bid = 2060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020604,
		     name = lang:get(<<"6星狂怒手镯"/utf8>>), bid = 2060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020604,
		     name = lang:get(<<"6星狂怒手镯"/utf8>>), bid = 2060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020504) ->
    [#gift_rand_data{id = 99020504,
		     name = lang:get(<<"5星狂怒手镯"/utf8>>), bid = 2050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020504,
		     name = lang:get(<<"5星狂怒手镯"/utf8>>), bid = 2050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020504,
		     name = lang:get(<<"5星狂怒手镯"/utf8>>), bid = 2050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020404) ->
    [#gift_rand_data{id = 99020404,
		     name = lang:get(<<"4星狂怒手镯"/utf8>>), bid = 2040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020404,
		     name = lang:get(<<"4星狂怒手镯"/utf8>>), bid = 2040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020404,
		     name = lang:get(<<"4星狂怒手镯"/utf8>>), bid = 2040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020304) ->
    [#gift_rand_data{id = 99020304,
		     name = lang:get(<<"3星狂怒手镯"/utf8>>), bid = 2030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020304,
		     name = lang:get(<<"3星狂怒手镯"/utf8>>), bid = 2030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020304,
		     name = lang:get(<<"3星狂怒手镯"/utf8>>), bid = 2030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020204) ->
    [#gift_rand_data{id = 99020204,
		     name = lang:get(<<"2星狂怒手镯"/utf8>>), bid = 2020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020204,
		     name = lang:get(<<"2星狂怒手镯"/utf8>>), bid = 2020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020204,
		     name = lang:get(<<"2星狂怒手镯"/utf8>>), bid = 2020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020104) ->
    [#gift_rand_data{id = 99020104,
		     name = lang:get(<<"1星狂怒手镯"/utf8>>), bid = 2010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020104,
		     name = lang:get(<<"1星狂怒手镯"/utf8>>), bid = 2010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020104,
		     name = lang:get(<<"1星狂怒手镯"/utf8>>), bid = 2010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99021003) ->
    [#gift_rand_data{id = 99021003,
		     name = lang:get(<<"10星狂怒戒指"/utf8>>), bid = 2100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99021003,
		     name = lang:get(<<"10星狂怒戒指"/utf8>>), bid = 2100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99021003,
		     name = lang:get(<<"10星狂怒戒指"/utf8>>), bid = 2100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020903) ->
    [#gift_rand_data{id = 99020903,
		     name = lang:get(<<"9星狂怒戒指"/utf8>>), bid = 2090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020903,
		     name = lang:get(<<"9星狂怒戒指"/utf8>>), bid = 2090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020903,
		     name = lang:get(<<"9星狂怒戒指"/utf8>>), bid = 2090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020803) ->
    [#gift_rand_data{id = 99020803,
		     name = lang:get(<<"8星狂怒戒指"/utf8>>), bid = 2080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020803,
		     name = lang:get(<<"8星狂怒戒指"/utf8>>), bid = 2080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020803,
		     name = lang:get(<<"8星狂怒戒指"/utf8>>), bid = 2080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020703) ->
    [#gift_rand_data{id = 99020703,
		     name = lang:get(<<"7星狂怒戒指"/utf8>>), bid = 2070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020703,
		     name = lang:get(<<"7星狂怒戒指"/utf8>>), bid = 2070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020703,
		     name = lang:get(<<"7星狂怒戒指"/utf8>>), bid = 2070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020603) ->
    [#gift_rand_data{id = 99020603,
		     name = lang:get(<<"6星狂怒戒指"/utf8>>), bid = 2060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020603,
		     name = lang:get(<<"6星狂怒戒指"/utf8>>), bid = 2060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020603,
		     name = lang:get(<<"6星狂怒戒指"/utf8>>), bid = 2060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020503) ->
    [#gift_rand_data{id = 99020503,
		     name = lang:get(<<"5星狂怒戒指"/utf8>>), bid = 2050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020503,
		     name = lang:get(<<"5星狂怒戒指"/utf8>>), bid = 2050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020503,
		     name = lang:get(<<"5星狂怒戒指"/utf8>>), bid = 2050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020403) ->
    [#gift_rand_data{id = 99020403,
		     name = lang:get(<<"4星狂怒戒指"/utf8>>), bid = 2040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020403,
		     name = lang:get(<<"4星狂怒戒指"/utf8>>), bid = 2040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020403,
		     name = lang:get(<<"4星狂怒戒指"/utf8>>), bid = 2040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020303) ->
    [#gift_rand_data{id = 99020303,
		     name = lang:get(<<"3星狂怒戒指"/utf8>>), bid = 2030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020303,
		     name = lang:get(<<"3星狂怒戒指"/utf8>>), bid = 2030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020303,
		     name = lang:get(<<"3星狂怒戒指"/utf8>>), bid = 2030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020203) ->
    [#gift_rand_data{id = 99020203,
		     name = lang:get(<<"2星狂怒戒指"/utf8>>), bid = 2020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020203,
		     name = lang:get(<<"2星狂怒戒指"/utf8>>), bid = 2020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020203,
		     name = lang:get(<<"2星狂怒戒指"/utf8>>), bid = 2020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020103) ->
    [#gift_rand_data{id = 99020103,
		     name = lang:get(<<"1星狂怒戒指"/utf8>>), bid = 2010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020103,
		     name = lang:get(<<"1星狂怒戒指"/utf8>>), bid = 2010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020103,
		     name = lang:get(<<"1星狂怒戒指"/utf8>>), bid = 2010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99021002) ->
    [#gift_rand_data{id = 99021002,
		     name = lang:get(<<"10星狂怒项链"/utf8>>), bid = 2100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99021002,
		     name = lang:get(<<"10星狂怒项链"/utf8>>), bid = 2100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99021002,
		     name = lang:get(<<"10星狂怒项链"/utf8>>), bid = 2100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020902) ->
    [#gift_rand_data{id = 99020902,
		     name = lang:get(<<"9星狂怒项链"/utf8>>), bid = 2090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020902,
		     name = lang:get(<<"9星狂怒项链"/utf8>>), bid = 2090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020902,
		     name = lang:get(<<"9星狂怒项链"/utf8>>), bid = 2090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020802) ->
    [#gift_rand_data{id = 99020802,
		     name = lang:get(<<"8星狂怒项链"/utf8>>), bid = 2080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020802,
		     name = lang:get(<<"8星狂怒项链"/utf8>>), bid = 2080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020802,
		     name = lang:get(<<"8星狂怒项链"/utf8>>), bid = 2080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020702) ->
    [#gift_rand_data{id = 99020702,
		     name = lang:get(<<"7星狂怒项链"/utf8>>), bid = 2070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020702,
		     name = lang:get(<<"7星狂怒项链"/utf8>>), bid = 2070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020702,
		     name = lang:get(<<"7星狂怒项链"/utf8>>), bid = 2070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020602) ->
    [#gift_rand_data{id = 99020602,
		     name = lang:get(<<"6星狂怒项链"/utf8>>), bid = 2060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020602,
		     name = lang:get(<<"6星狂怒项链"/utf8>>), bid = 2060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020602,
		     name = lang:get(<<"6星狂怒项链"/utf8>>), bid = 2060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020502) ->
    [#gift_rand_data{id = 99020502,
		     name = lang:get(<<"5星狂怒项链"/utf8>>), bid = 2050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020502,
		     name = lang:get(<<"5星狂怒项链"/utf8>>), bid = 2050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020502,
		     name = lang:get(<<"5星狂怒项链"/utf8>>), bid = 2050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020402) ->
    [#gift_rand_data{id = 99020402,
		     name = lang:get(<<"4星狂怒项链"/utf8>>), bid = 2040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020402,
		     name = lang:get(<<"4星狂怒项链"/utf8>>), bid = 2040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020402,
		     name = lang:get(<<"4星狂怒项链"/utf8>>), bid = 2040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020302) ->
    [#gift_rand_data{id = 99020302,
		     name = lang:get(<<"3星狂怒项链"/utf8>>), bid = 2030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020302,
		     name = lang:get(<<"3星狂怒项链"/utf8>>), bid = 2030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020302,
		     name = lang:get(<<"3星狂怒项链"/utf8>>), bid = 2030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020202) ->
    [#gift_rand_data{id = 99020202,
		     name = lang:get(<<"2星狂怒项链"/utf8>>), bid = 2020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020202,
		     name = lang:get(<<"2星狂怒项链"/utf8>>), bid = 2020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020202,
		     name = lang:get(<<"2星狂怒项链"/utf8>>), bid = 2020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020102) ->
    [#gift_rand_data{id = 99020102,
		     name = lang:get(<<"1星狂怒项链"/utf8>>), bid = 2010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020102,
		     name = lang:get(<<"1星狂怒项链"/utf8>>), bid = 2010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020102,
		     name = lang:get(<<"1星狂怒项链"/utf8>>), bid = 2010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99021001) ->
    [#gift_rand_data{id = 99021001,
		     name = lang:get(<<"10星狂怒耳环"/utf8>>), bid = 2100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99021001,
		     name = lang:get(<<"10星狂怒耳环"/utf8>>), bid = 2100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99021001,
		     name = lang:get(<<"10星狂怒耳环"/utf8>>), bid = 2100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020901) ->
    [#gift_rand_data{id = 99020901,
		     name = lang:get(<<"9星狂怒耳环"/utf8>>), bid = 2090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020901,
		     name = lang:get(<<"9星狂怒耳环"/utf8>>), bid = 2090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020901,
		     name = lang:get(<<"9星狂怒耳环"/utf8>>), bid = 2090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020801) ->
    [#gift_rand_data{id = 99020801,
		     name = lang:get(<<"8星狂怒耳环"/utf8>>), bid = 2080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020801,
		     name = lang:get(<<"8星狂怒耳环"/utf8>>), bid = 2080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020801,
		     name = lang:get(<<"8星狂怒耳环"/utf8>>), bid = 2080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020701) ->
    [#gift_rand_data{id = 99020701,
		     name = lang:get(<<"7星狂怒耳环"/utf8>>), bid = 2070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020701,
		     name = lang:get(<<"7星狂怒耳环"/utf8>>), bid = 2070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020701,
		     name = lang:get(<<"7星狂怒耳环"/utf8>>), bid = 2070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020601) ->
    [#gift_rand_data{id = 99020601,
		     name = lang:get(<<"6星狂怒耳环"/utf8>>), bid = 2060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020601,
		     name = lang:get(<<"6星狂怒耳环"/utf8>>), bid = 2060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020601,
		     name = lang:get(<<"6星狂怒耳环"/utf8>>), bid = 2060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020501) ->
    [#gift_rand_data{id = 99020501,
		     name = lang:get(<<"5星狂怒耳环"/utf8>>), bid = 2050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020501,
		     name = lang:get(<<"5星狂怒耳环"/utf8>>), bid = 2050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020501,
		     name = lang:get(<<"5星狂怒耳环"/utf8>>), bid = 2050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020401) ->
    [#gift_rand_data{id = 99020401,
		     name = lang:get(<<"4星狂怒耳环"/utf8>>), bid = 2040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020401,
		     name = lang:get(<<"4星狂怒耳环"/utf8>>), bid = 2040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020401,
		     name = lang:get(<<"4星狂怒耳环"/utf8>>), bid = 2040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020301) ->
    [#gift_rand_data{id = 99020301,
		     name = lang:get(<<"3星狂怒耳环"/utf8>>), bid = 2030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020301,
		     name = lang:get(<<"3星狂怒耳环"/utf8>>), bid = 2030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020301,
		     name = lang:get(<<"3星狂怒耳环"/utf8>>), bid = 2030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020201) ->
    [#gift_rand_data{id = 99020201,
		     name = lang:get(<<"2星狂怒耳环"/utf8>>), bid = 2020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020201,
		     name = lang:get(<<"2星狂怒耳环"/utf8>>), bid = 2020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020201,
		     name = lang:get(<<"2星狂怒耳环"/utf8>>), bid = 2020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99020101) ->
    [#gift_rand_data{id = 99020101,
		     name = lang:get(<<"1星狂怒耳环"/utf8>>), bid = 2010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020101,
		     name = lang:get(<<"1星狂怒耳环"/utf8>>), bid = 2010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99020101,
		     name = lang:get(<<"1星狂怒耳环"/utf8>>), bid = 2010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99011004) ->
    [#gift_rand_data{id = 99011004,
		     name = lang:get(<<"10星勇气手镯"/utf8>>), bid = 1100004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99011004,
		     name = lang:get(<<"10星勇气手镯"/utf8>>), bid = 1100104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99011004,
		     name = lang:get(<<"10星勇气手镯"/utf8>>), bid = 1100204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010904) ->
    [#gift_rand_data{id = 99010904,
		     name = lang:get(<<"9星勇气手镯"/utf8>>), bid = 1090004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010904,
		     name = lang:get(<<"9星勇气手镯"/utf8>>), bid = 1090104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010904,
		     name = lang:get(<<"9星勇气手镯"/utf8>>), bid = 1090204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010804) ->
    [#gift_rand_data{id = 99010804,
		     name = lang:get(<<"8星勇气手镯"/utf8>>), bid = 1080004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010804,
		     name = lang:get(<<"8星勇气手镯"/utf8>>), bid = 1080104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010804,
		     name = lang:get(<<"8星勇气手镯"/utf8>>), bid = 1080204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010704) ->
    [#gift_rand_data{id = 99010704,
		     name = lang:get(<<"7星勇气手镯"/utf8>>), bid = 1070004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010704,
		     name = lang:get(<<"7星勇气手镯"/utf8>>), bid = 1070104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010704,
		     name = lang:get(<<"7星勇气手镯"/utf8>>), bid = 1070204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010604) ->
    [#gift_rand_data{id = 99010604,
		     name = lang:get(<<"6星勇气手镯"/utf8>>), bid = 1060004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010604,
		     name = lang:get(<<"6星勇气手镯"/utf8>>), bid = 1060104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010604,
		     name = lang:get(<<"6星勇气手镯"/utf8>>), bid = 1060204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010504) ->
    [#gift_rand_data{id = 99010504,
		     name = lang:get(<<"5星勇气手镯"/utf8>>), bid = 1050004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010504,
		     name = lang:get(<<"5星勇气手镯"/utf8>>), bid = 1050104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010504,
		     name = lang:get(<<"5星勇气手镯"/utf8>>), bid = 1050204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010404) ->
    [#gift_rand_data{id = 99010404,
		     name = lang:get(<<"4星勇气手镯"/utf8>>), bid = 1040004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010404,
		     name = lang:get(<<"4星勇气手镯"/utf8>>), bid = 1040104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010404,
		     name = lang:get(<<"4星勇气手镯"/utf8>>), bid = 1040204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010304) ->
    [#gift_rand_data{id = 99010304,
		     name = lang:get(<<"3星勇气手镯"/utf8>>), bid = 1030004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010304,
		     name = lang:get(<<"3星勇气手镯"/utf8>>), bid = 1030104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010304,
		     name = lang:get(<<"3星勇气手镯"/utf8>>), bid = 1030204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010204) ->
    [#gift_rand_data{id = 99010204,
		     name = lang:get(<<"2星勇气手镯"/utf8>>), bid = 1020004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010204,
		     name = lang:get(<<"2星勇气手镯"/utf8>>), bid = 1020104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010204,
		     name = lang:get(<<"2星勇气手镯"/utf8>>), bid = 1020204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010104) ->
    [#gift_rand_data{id = 99010104,
		     name = lang:get(<<"1星勇气手镯"/utf8>>), bid = 1010004,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010104,
		     name = lang:get(<<"1星勇气手镯"/utf8>>), bid = 1010104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010104,
		     name = lang:get(<<"1星勇气手镯"/utf8>>), bid = 1010204,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99011003) ->
    [#gift_rand_data{id = 99011003,
		     name = lang:get(<<"10星勇气戒指"/utf8>>), bid = 1100003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99011003,
		     name = lang:get(<<"10星勇气戒指"/utf8>>), bid = 1100103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99011003,
		     name = lang:get(<<"10星勇气戒指"/utf8>>), bid = 1100203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010903) ->
    [#gift_rand_data{id = 99010903,
		     name = lang:get(<<"9星勇气戒指"/utf8>>), bid = 1090003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010903,
		     name = lang:get(<<"9星勇气戒指"/utf8>>), bid = 1090103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010903,
		     name = lang:get(<<"9星勇气戒指"/utf8>>), bid = 1090203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010803) ->
    [#gift_rand_data{id = 99010803,
		     name = lang:get(<<"8星勇气戒指"/utf8>>), bid = 1080003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010803,
		     name = lang:get(<<"8星勇气戒指"/utf8>>), bid = 1080103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010803,
		     name = lang:get(<<"8星勇气戒指"/utf8>>), bid = 1080203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010703) ->
    [#gift_rand_data{id = 99010703,
		     name = lang:get(<<"7星勇气戒指"/utf8>>), bid = 1070003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010703,
		     name = lang:get(<<"7星勇气戒指"/utf8>>), bid = 1070103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010703,
		     name = lang:get(<<"7星勇气戒指"/utf8>>), bid = 1070203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010603) ->
    [#gift_rand_data{id = 99010603,
		     name = lang:get(<<"6星勇气戒指"/utf8>>), bid = 1060003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010603,
		     name = lang:get(<<"6星勇气戒指"/utf8>>), bid = 1060103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010603,
		     name = lang:get(<<"6星勇气戒指"/utf8>>), bid = 1060203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010503) ->
    [#gift_rand_data{id = 99010503,
		     name = lang:get(<<"5星勇气戒指"/utf8>>), bid = 1050003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010503,
		     name = lang:get(<<"5星勇气戒指"/utf8>>), bid = 1050103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010503,
		     name = lang:get(<<"5星勇气戒指"/utf8>>), bid = 1050203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010403) ->
    [#gift_rand_data{id = 99010403,
		     name = lang:get(<<"4星勇气戒指"/utf8>>), bid = 1040003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010403,
		     name = lang:get(<<"4星勇气戒指"/utf8>>), bid = 1040103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010403,
		     name = lang:get(<<"4星勇气戒指"/utf8>>), bid = 1040203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010303) ->
    [#gift_rand_data{id = 99010303,
		     name = lang:get(<<"3星勇气戒指"/utf8>>), bid = 1030003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010303,
		     name = lang:get(<<"3星勇气戒指"/utf8>>), bid = 1030103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010303,
		     name = lang:get(<<"3星勇气戒指"/utf8>>), bid = 1030203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010203) ->
    [#gift_rand_data{id = 99010203,
		     name = lang:get(<<"2星勇气戒指"/utf8>>), bid = 1020003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010203,
		     name = lang:get(<<"2星勇气戒指"/utf8>>), bid = 1020103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010203,
		     name = lang:get(<<"2星勇气戒指"/utf8>>), bid = 1020203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010103) ->
    [#gift_rand_data{id = 99010103,
		     name = lang:get(<<"1星勇气戒指"/utf8>>), bid = 1010003,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010103,
		     name = lang:get(<<"1星勇气戒指"/utf8>>), bid = 1010103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010103,
		     name = lang:get(<<"1星勇气戒指"/utf8>>), bid = 1010203,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99011002) ->
    [#gift_rand_data{id = 99011002,
		     name = lang:get(<<"10星勇气项链"/utf8>>), bid = 1100002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99011002,
		     name = lang:get(<<"10星勇气项链"/utf8>>), bid = 1100102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99011002,
		     name = lang:get(<<"10星勇气项链"/utf8>>), bid = 1100202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010902) ->
    [#gift_rand_data{id = 99010902,
		     name = lang:get(<<"9星勇气项链"/utf8>>), bid = 1090002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010902,
		     name = lang:get(<<"9星勇气项链"/utf8>>), bid = 1090102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010902,
		     name = lang:get(<<"9星勇气项链"/utf8>>), bid = 1090202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010802) ->
    [#gift_rand_data{id = 99010802,
		     name = lang:get(<<"8星勇气项链"/utf8>>), bid = 1080002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010802,
		     name = lang:get(<<"8星勇气项链"/utf8>>), bid = 1080102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010802,
		     name = lang:get(<<"8星勇气项链"/utf8>>), bid = 1080202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010702) ->
    [#gift_rand_data{id = 99010702,
		     name = lang:get(<<"7星勇气项链"/utf8>>), bid = 1070002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010702,
		     name = lang:get(<<"7星勇气项链"/utf8>>), bid = 1070102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010702,
		     name = lang:get(<<"7星勇气项链"/utf8>>), bid = 1070202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010602) ->
    [#gift_rand_data{id = 99010602,
		     name = lang:get(<<"6星勇气项链"/utf8>>), bid = 1060002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010602,
		     name = lang:get(<<"6星勇气项链"/utf8>>), bid = 1060102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010602,
		     name = lang:get(<<"6星勇气项链"/utf8>>), bid = 1060202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010502) ->
    [#gift_rand_data{id = 99010502,
		     name = lang:get(<<"5星勇气项链"/utf8>>), bid = 1050002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010502,
		     name = lang:get(<<"5星勇气项链"/utf8>>), bid = 1050102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010502,
		     name = lang:get(<<"5星勇气项链"/utf8>>), bid = 1050202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010402) ->
    [#gift_rand_data{id = 99010402,
		     name = lang:get(<<"4星勇气项链"/utf8>>), bid = 1040002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010402,
		     name = lang:get(<<"4星勇气项链"/utf8>>), bid = 1040102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010402,
		     name = lang:get(<<"4星勇气项链"/utf8>>), bid = 1040202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010302) ->
    [#gift_rand_data{id = 99010302,
		     name = lang:get(<<"3星勇气项链"/utf8>>), bid = 1030002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010302,
		     name = lang:get(<<"3星勇气项链"/utf8>>), bid = 1030102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010302,
		     name = lang:get(<<"3星勇气项链"/utf8>>), bid = 1030202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010202) ->
    [#gift_rand_data{id = 99010202,
		     name = lang:get(<<"2星勇气项链"/utf8>>), bid = 1020002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010202,
		     name = lang:get(<<"2星勇气项链"/utf8>>), bid = 1020102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010202,
		     name = lang:get(<<"2星勇气项链"/utf8>>), bid = 1020202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010102) ->
    [#gift_rand_data{id = 99010102,
		     name = lang:get(<<"1星勇气项链"/utf8>>), bid = 1010002,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010102,
		     name = lang:get(<<"1星勇气项链"/utf8>>), bid = 1010102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010102,
		     name = lang:get(<<"1星勇气项链"/utf8>>), bid = 1010202,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99011001) ->
    [#gift_rand_data{id = 99011001,
		     name = lang:get(<<"10星勇气耳环"/utf8>>), bid = 1100001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99011001,
		     name = lang:get(<<"10星勇气耳环"/utf8>>), bid = 1100101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99011001,
		     name = lang:get(<<"10星勇气耳环"/utf8>>), bid = 1100201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010901) ->
    [#gift_rand_data{id = 99010901,
		     name = lang:get(<<"9星勇气耳环"/utf8>>), bid = 1090001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010901,
		     name = lang:get(<<"9星勇气耳环"/utf8>>), bid = 1090101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010901,
		     name = lang:get(<<"9星勇气耳环"/utf8>>), bid = 1090201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010801) ->
    [#gift_rand_data{id = 99010801,
		     name = lang:get(<<"8星勇气耳环"/utf8>>), bid = 1080001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010801,
		     name = lang:get(<<"8星勇气耳环"/utf8>>), bid = 1080101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010801,
		     name = lang:get(<<"8星勇气耳环"/utf8>>), bid = 1080201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010701) ->
    [#gift_rand_data{id = 99010701,
		     name = lang:get(<<"7星勇气耳环"/utf8>>), bid = 1070001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010701,
		     name = lang:get(<<"7星勇气耳环"/utf8>>), bid = 1070101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010701,
		     name = lang:get(<<"7星勇气耳环"/utf8>>), bid = 1070201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010601) ->
    [#gift_rand_data{id = 99010601,
		     name = lang:get(<<"6星勇气耳环"/utf8>>), bid = 1060001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010601,
		     name = lang:get(<<"6星勇气耳环"/utf8>>), bid = 1060101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010601,
		     name = lang:get(<<"6星勇气耳环"/utf8>>), bid = 1060201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010501) ->
    [#gift_rand_data{id = 99010501,
		     name = lang:get(<<"5星勇气耳环"/utf8>>), bid = 1050001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010501,
		     name = lang:get(<<"5星勇气耳环"/utf8>>), bid = 1050101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010501,
		     name = lang:get(<<"5星勇气耳环"/utf8>>), bid = 1050201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010401) ->
    [#gift_rand_data{id = 99010401,
		     name = lang:get(<<"4星勇气耳环"/utf8>>), bid = 1040001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010401,
		     name = lang:get(<<"4星勇气耳环"/utf8>>), bid = 1040101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010401,
		     name = lang:get(<<"4星勇气耳环"/utf8>>), bid = 1040201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010301) ->
    [#gift_rand_data{id = 99010301,
		     name = lang:get(<<"3星勇气耳环"/utf8>>), bid = 1030001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010301,
		     name = lang:get(<<"3星勇气耳环"/utf8>>), bid = 1030101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010301,
		     name = lang:get(<<"3星勇气耳环"/utf8>>), bid = 1030201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010201) ->
    [#gift_rand_data{id = 99010201,
		     name = lang:get(<<"2星勇气耳环"/utf8>>), bid = 1020001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010201,
		     name = lang:get(<<"2星勇气耳环"/utf8>>), bid = 1020101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010201,
		     name = lang:get(<<"2星勇气耳环"/utf8>>), bid = 1020201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99010101) ->
    [#gift_rand_data{id = 99010101,
		     name = lang:get(<<"1星勇气耳环"/utf8>>), bid = 1010001,
		     num = 1, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010101,
		     name = lang:get(<<"1星勇气耳环"/utf8>>), bid = 1010101,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 99010101,
		     name = lang:get(<<"1星勇气耳环"/utf8>>), bid = 1010201,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(17008) ->
    [#gift_rand_data{id = 17008,
		     name = lang:get(<<"混沌结晶"/utf8>>), bid = 17004, num = 1,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 17008,
		     name = lang:get(<<"混沌结晶"/utf8>>), bid = 17005, num = 1,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(38099) ->
    [#gift_rand_data{id = 38099, name = <<"Đá Quý Kaguya">>,
		     bid = 10090, num = 5, bind = 1, rand = 20, career = 0,
		     sex = 2, min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38099,
		     name = <<"Đá Quý Otsutsuki">>, bid = 10091, num = 3,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 38099, name = <<"Chìa Khóa Sao">>,
		     bid = 37003, num = 1, bind = 1, rand = 15, career = 0,
		     sex = 2, min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38099, name = <<"Bình Tinh Hoa">>,
		     bid = 10450, num = 20000, bind = 1, rand = 30,
		     career = 0, sex = 2, min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38099, name = <<"Vé Ra Men">>,
		     bid = 35, num = 5, bind = 1, rand = 15, career = 0,
		     sex = 2, min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38099,
		     name = <<"Ngọc Trai Vận Mệnh Cao Cấp">>, bid = 10490,
		     num = 3, bind = 1, rand = 35, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38099, name = <<"Túi Bạc">>,
		     bid = 39052, num = 50, bind = 1, rand = 60, career = 0,
		     sex = 2, min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38099, name = <<"Túi EXP">>,
		     bid = 39053, num = 50, bind = 1, rand = 60, career = 0,
		     sex = 2, min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38099, name = <<"Vàng">>, bid = 3,
		     num = 100000, bind = 1, rand = 60, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38099,
		     name = <<"Exp Nhân Vật Chính">>, bid = 5, num = 100000,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(60305) ->
    [#gift_rand_data{id = 60305,
		     name = lang:get(<<"英魂礼包"/utf8>>), bid = 10005, num = 1,
		     bind = 1, rand = 850, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 60305,
		     name = lang:get(<<"英魂礼包"/utf8>>), bid = 10005, num = 2,
		     bind = 1, rand = 45, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 60305,
		     name = lang:get(<<"英魂礼包"/utf8>>), bid = 10005, num = 3,
		     bind = 1, rand = 20, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 60305,
		     name = lang:get(<<"英魂礼包"/utf8>>), bid = 29905, num = 5,
		     bind = 1, rand = 85, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(80234) ->
    [#gift_rand_data{id = 80234,
		     name = lang:get(<<"最强冒险家认定书"/utf8>>), bid = 10403,
		     num = 1, bind = 1, rand = 600, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 80234,
		     name = lang:get(<<"最强冒险家认定书"/utf8>>), bid = 29905,
		     num = 3, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 80234,
		     name = lang:get(<<"最强冒险家认定书"/utf8>>), bid = 14001,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 3, can_out2 = 8}];
rand_list(39513) ->
    [#gift_rand_data{id = 39513,
		     name = lang:get(<<"6星极品套装礼盒"/utf8>>), bid = 39514,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39513,
		     name = lang:get(<<"6星极品套装礼盒"/utf8>>), bid = 39515,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39513,
		     name = lang:get(<<"6星极品套装礼盒"/utf8>>), bid = 39516,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39509) ->
    [#gift_rand_data{id = 39509,
		     name = lang:get(<<"5星极品套装礼盒"/utf8>>), bid = 39510,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39509,
		     name = lang:get(<<"5星极品套装礼盒"/utf8>>), bid = 39511,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39509,
		     name = lang:get(<<"5星极品套装礼盒"/utf8>>), bid = 39512,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39505) ->
    [#gift_rand_data{id = 39505,
		     name = lang:get(<<"4星极品套装礼盒"/utf8>>), bid = 39506,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39505,
		     name = lang:get(<<"4星极品套装礼盒"/utf8>>), bid = 39507,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39505,
		     name = lang:get(<<"4星极品套装礼盒"/utf8>>), bid = 39508,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39501) ->
    [#gift_rand_data{id = 39501,
		     name = lang:get(<<"3星极品套装礼盒"/utf8>>), bid = 39502,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39501,
		     name = lang:get(<<"3星极品套装礼盒"/utf8>>), bid = 39503,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39501,
		     name = lang:get(<<"3星极品套装礼盒"/utf8>>), bid = 39504,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39047) ->
    [#gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16001,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16002,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16003,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16004,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16005,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16006,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16007,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16008,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16009,
		     num = 1, bind = 1, rand = 40, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16010,
		     num = 1, bind = 1, rand = 40, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16011,
		     num = 1, bind = 1, rand = 40, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16012,
		     num = 1, bind = 1, rand = 40, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16013,
		     num = 1, bind = 1, rand = 40, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16014,
		     num = 1, bind = 1, rand = 40, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16015,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16016,
		     num = 1, bind = 1, rand = 40, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16017,
		     num = 1, bind = 1, rand = 40, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16018,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16019,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16020,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16021,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16022,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16023,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16024,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16025,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16026,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16027,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16028,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16029,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16030,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16031,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16032,
		     num = 1, bind = 1, rand = 40, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16033,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16034,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16035,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16036,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16037,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16038,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16039,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16040,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16041,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16042,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16043,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16044,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16045,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39047,
		     name = lang:get(<<"随机符石礼包"/utf8>>), bid = 16046,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39166) ->
    [#gift_rand_data{id = 39166,
		     name = lang:get(<<"火灵礼盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 494, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39166,
		     name = lang:get(<<"火灵礼盒"/utf8>>), bid = 80268, num = 20,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39166,
		     name = lang:get(<<"火灵礼盒"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39166,
		     name = lang:get(<<"火灵礼盒"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out = 1, max_out = 1}];
rand_list(39163) ->
    [#gift_rand_data{id = 39163,
		     name = lang:get(<<"欧皇宝箱"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 494, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39163,
		     name = lang:get(<<"欧皇宝箱"/utf8>>), bid = 37012,
		     num = 100, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39163,
		     name = lang:get(<<"欧皇宝箱"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39163,
		     name = lang:get(<<"欧皇宝箱"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out = 1, max_out = 1}];
rand_list(39160) ->
    [#gift_rand_data{id = 39160,
		     name = lang:get(<<"冒险礼盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 494, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39160,
		     name = lang:get(<<"冒险礼盒"/utf8>>), bid = 80267,
		     num = 500, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39160,
		     name = lang:get(<<"冒险礼盒"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39160,
		     name = lang:get(<<"冒险礼盒"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, max_out = 1}];
rand_list(39092) ->
    [#gift_rand_data{id = 39092,
		     name = lang:get(<<"白色情人节礼盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 494, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39092,
		     name = lang:get(<<"白色情人节礼盒"/utf8>>), bid = 37011,
		     num = 200, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39092,
		     name = lang:get(<<"白色情人节礼盒"/utf8>>), bid = 37002,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39092,
		     name = lang:get(<<"白色情人节礼盒"/utf8>>), bid = 29905,
		     num = 50, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 1, max_out = 1}];
rand_list(39091) ->
    [#gift_rand_data{id = 39091,
		     name = lang:get(<<"森林宝盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 494, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39091,
		     name = lang:get(<<"森林宝盒"/utf8>>), bid = 80266, num = 20,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39091,
		     name = lang:get(<<"森林宝盒"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39091,
		     name = lang:get(<<"森林宝盒"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, max_out = 1}];
rand_list(39089) ->
    [#gift_rand_data{id = 39089,
		     name = lang:get(<<"每日首充尊享礼包"/utf8>>), bid = 29905,
		     num = 2, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39089,
		     name = lang:get(<<"每日首充尊享礼包"/utf8>>), bid = 28,
		     num = 25, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39089,
		     name = lang:get(<<"每日首充尊享礼包"/utf8>>), bid = 10034,
		     num = 1, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39088) ->
    [#gift_rand_data{id = 39088,
		     name = lang:get(<<"每日首充专属礼包"/utf8>>), bid = 29905,
		     num = 2, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39088,
		     name = lang:get(<<"每日首充专属礼包"/utf8>>), bid = 28,
		     num = 20, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39088,
		     name = lang:get(<<"每日首充专属礼包"/utf8>>), bid = 10034,
		     num = 1, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39087) ->
    [#gift_rand_data{id = 39087,
		     name = lang:get(<<"每日首充特级礼包"/utf8>>), bid = 29905,
		     num = 2, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39087,
		     name = lang:get(<<"每日首充特级礼包"/utf8>>), bid = 28,
		     num = 15, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39087,
		     name = lang:get(<<"每日首充特级礼包"/utf8>>), bid = 10034,
		     num = 1, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39086) ->
    [#gift_rand_data{id = 39086,
		     name = lang:get(<<"每日首充高级礼包"/utf8>>), bid = 29905,
		     num = 1, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39086,
		     name = lang:get(<<"每日首充高级礼包"/utf8>>), bid = 17009,
		     num = 10, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39086,
		     name = lang:get(<<"每日首充高级礼包"/utf8>>), bid = 10034,
		     num = 1, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39085) ->
    [#gift_rand_data{id = 39085,
		     name = lang:get(<<"每日首充精英礼包"/utf8>>), bid = 29905,
		     num = 1, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39085,
		     name = lang:get(<<"每日首充精英礼包"/utf8>>), bid = 10450,
		     num = 150, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39085,
		     name = lang:get(<<"每日首充精英礼包"/utf8>>), bid = 10034,
		     num = 1, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39084) ->
    [#gift_rand_data{id = 39084,
		     name = lang:get(<<"每日首充幸运礼包"/utf8>>), bid = 29905,
		     num = 1, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39084,
		     name = lang:get(<<"每日首充幸运礼包"/utf8>>), bid = 10450,
		     num = 100, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39084,
		     name = lang:get(<<"每日首充幸运礼包"/utf8>>), bid = 10034,
		     num = 1, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39083) ->
    [#gift_rand_data{id = 39083,
		     name = lang:get(<<"每日首充特惠礼包"/utf8>>), bid = 29905,
		     num = 1, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39083,
		     name = lang:get(<<"每日首充特惠礼包"/utf8>>), bid = 10001,
		     num = 100, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39083,
		     name = lang:get(<<"每日首充特惠礼包"/utf8>>), bid = 10034,
		     num = 1, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39080) ->
    [#gift_rand_data{id = 39080,
		     name = lang:get(<<"珍稀宝盒"/utf8>>), bid = 24911, num = 50,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, max_out = 1},
     #gift_rand_data{id = 39080,
		     name = lang:get(<<"珍稀宝盒"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 5000, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39080,
		     name = lang:get(<<"珍稀宝盒"/utf8>>), bid = 29905, num = 5,
		     bind = 1, rand = 3000, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39080,
		     name = lang:get(<<"珍稀宝盒"/utf8>>), bid = 29905, num = 10,
		     bind = 1, rand = 1950, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39077) ->
    [#gift_rand_data{id = 39077,
		     name = lang:get(<<"甜蜜礼盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 494, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39077,
		     name = lang:get(<<"甜蜜礼盒"/utf8>>), bid = 81004, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39077,
		     name = lang:get(<<"甜蜜礼盒"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39077,
		     name = lang:get(<<"甜蜜礼盒"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out = 1, max_out = 1}];
rand_list(39076) ->
    [#gift_rand_data{id = 39076,
		     name = lang:get(<<"精英碎片宝盒"/utf8>>), bid = 28908,
		     num = 50, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, max_out = 1},
     #gift_rand_data{id = 39076,
		     name = lang:get(<<"精英碎片宝盒"/utf8>>), bid = 29905,
		     num = 2, bind = 1, rand = 195, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39076,
		     name = lang:get(<<"精英碎片宝盒"/utf8>>), bid = 29905,
		     num = 5, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39076,
		     name = lang:get(<<"精英碎片宝盒"/utf8>>), bid = 29905,
		     num = 10, bind = 1, rand = 250, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39076,
		     name = lang:get(<<"精英碎片宝盒"/utf8>>), bid = 29905,
		     num = 25, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, max_out = 1}];
rand_list(39073) ->
    [#gift_rand_data{id = 39073,
		     name = lang:get(<<"幸运碎片礼盒"/utf8>>), bid = 29905,
		     num = 2, bind = 1, rand = 900, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39073,
		     name = lang:get(<<"幸运碎片礼盒"/utf8>>), bid = 29905,
		     num = 5, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39073,
		     name = lang:get(<<"幸运碎片礼盒"/utf8>>), bid = 29905,
		     num = 10, bind = 1, rand = 45, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39073,
		     name = lang:get(<<"幸运碎片礼盒"/utf8>>), bid = 29905,
		     num = 50, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, max_out = 1}];
rand_list(39074) ->
    [#gift_rand_data{id = 39074,
		     name = lang:get(<<"精英碎片礼盒"/utf8>>), bid = 28909,
		     num = 50, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, max_out = 1},
     #gift_rand_data{id = 39074,
		     name = lang:get(<<"精英碎片礼盒"/utf8>>), bid = 29905,
		     num = 2, bind = 1, rand = 195, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39074,
		     name = lang:get(<<"精英碎片礼盒"/utf8>>), bid = 29905,
		     num = 5, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39074,
		     name = lang:get(<<"精英碎片礼盒"/utf8>>), bid = 29905,
		     num = 10, bind = 1, rand = 250, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39074,
		     name = lang:get(<<"精英碎片礼盒"/utf8>>), bid = 29905,
		     num = 25, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, max_out = 1}];
rand_list(39072) ->
    [#gift_rand_data{id = 39072,
		     name = lang:get(<<"新春福袋"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 494, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39072,
		     name = lang:get(<<"新春福袋"/utf8>>), bid = 37010, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39072,
		     name = lang:get(<<"新春福袋"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39072,
		     name = lang:get(<<"新春福袋"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out = 1, max_out = 1}];
rand_list(39071) ->
    [#gift_rand_data{id = 39071,
		     name = lang:get(<<"新春宝箱"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 494, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39071,
		     name = lang:get(<<"新春宝箱"/utf8>>), bid = 10408, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39071,
		     name = lang:get(<<"新春宝箱"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39071,
		     name = lang:get(<<"新春宝箱"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out = 1, max_out = 1}];
rand_list(39070) ->
    [#gift_rand_data{id = 39070,
		     name = lang:get(<<"天使礼盒"/utf8>>), bid = 27909, num = 50,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, max_out = 1},
     #gift_rand_data{id = 39070,
		     name = lang:get(<<"天使礼盒"/utf8>>), bid = 29905, num = 2,
		     bind = 1, rand = 195, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39070,
		     name = lang:get(<<"天使礼盒"/utf8>>), bid = 29905, num = 5,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39070,
		     name = lang:get(<<"天使礼盒"/utf8>>), bid = 29905, num = 10,
		     bind = 1, rand = 250, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39070,
		     name = lang:get(<<"天使礼盒"/utf8>>), bid = 29905, num = 25,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, max_out = 1}];
rand_list(39069) ->
    [#gift_rand_data{id = 39069,
		     name = lang:get(<<"新春利是"/utf8>>), bid = 3, num = 88,
		     bind = 1, rand = 250, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39069,
		     name = lang:get(<<"新春利是"/utf8>>), bid = 3, num = 128,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39069,
		     name = lang:get(<<"新春利是"/utf8>>), bid = 3, num = 288,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39069,
		     name = lang:get(<<"新春利是"/utf8>>), bid = 3, num = 328,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39069,
		     name = lang:get(<<"新春利是"/utf8>>), bid = 3, num = 448,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39069,
		     name = lang:get(<<"新春利是"/utf8>>), bid = 3, num = 666,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39066) ->
    [#gift_rand_data{id = 39066,
		     name = lang:get(<<"新年礼盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39066,
		     name = lang:get(<<"新年礼盒"/utf8>>), bid = 10403, num = 1,
		     bind = 1, rand = 549, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39066,
		     name = lang:get(<<"新年礼盒"/utf8>>), bid = 14001, num = 1,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39064) ->
    [#gift_rand_data{id = 39064,
		     name = lang:get(<<"圣诞礼盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 489, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39064,
		     name = lang:get(<<"圣诞礼盒"/utf8>>), bid = 10408, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39064,
		     name = lang:get(<<"圣诞礼盒"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39064,
		     name = lang:get(<<"圣诞礼盒"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39062) ->
    [#gift_rand_data{id = 39062,
		     name = lang:get(<<"欧皇礼盒"/utf8>>), bid = 28909, num = 50,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, max_out = 1},
     #gift_rand_data{id = 39062,
		     name = lang:get(<<"欧皇礼盒"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 5000, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39062,
		     name = lang:get(<<"欧皇礼盒"/utf8>>), bid = 29905, num = 5,
		     bind = 1, rand = 3000, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39062,
		     name = lang:get(<<"欧皇礼盒"/utf8>>), bid = 29905, num = 10,
		     bind = 1, rand = 1950, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39063) ->
    [#gift_rand_data{id = 39063,
		     name = lang:get(<<"幸运宝袋"/utf8>>), bid = 14001, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, max_out = 1},
     #gift_rand_data{id = 39063,
		     name = lang:get(<<"幸运宝袋"/utf8>>), bid = 10407, num = 1,
		     bind = 1, rand = 6000, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39063,
		     name = lang:get(<<"幸运宝袋"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 3000, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39063,
		     name = lang:get(<<"幸运宝袋"/utf8>>), bid = 10407, num = 3,
		     bind = 1, rand = 950, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39061) ->
    [#gift_rand_data{id = 39061,
		     name = lang:get(<<"时光漂流分享礼包"/utf8>>), bid = 3, num = 48,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39061,
		     name = lang:get(<<"时光漂流分享礼包"/utf8>>), bid = 3, num = 68,
		     bind = 1, rand = 450, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39061,
		     name = lang:get(<<"时光漂流分享礼包"/utf8>>), bid = 3, num = 88,
		     bind = 1, rand = 150, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, must_out = 1},
     #gift_rand_data{id = 39061,
		     name = lang:get(<<"时光漂流分享礼包"/utf8>>), bid = 3,
		     num = 188, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, max_out = 1}];
rand_list(39059) ->
    [#gift_rand_data{id = 39059,
		     name = lang:get(<<"回归福袋"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 235, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39059,
		     name = lang:get(<<"回归福袋"/utf8>>), bid = 10403, num = 2,
		     bind = 1, rand = 700, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39059,
		     name = lang:get(<<"回归福袋"/utf8>>), bid = 14001, num = 1,
		     bind = 1, rand = 15, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39059,
		     name = lang:get(<<"回归福袋"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39057) ->
    [#gift_rand_data{id = 39057,
		     name = lang:get(<<"感恩宴礼"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 489, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39057,
		     name = lang:get(<<"感恩宴礼"/utf8>>), bid = 10408, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39057,
		     name = lang:get(<<"感恩宴礼"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39057,
		     name = lang:get(<<"感恩宴礼"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39055) ->
    [#gift_rand_data{id = 39055,
		     name = lang:get(<<"守护之礼"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 489, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39055,
		     name = lang:get(<<"守护之礼"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39055,
		     name = lang:get(<<"守护之礼"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39055,
		     name = lang:get(<<"守护之礼"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39054) ->
    [#gift_rand_data{id = 39054,
		     name = lang:get(<<"高级召唤礼包"/utf8>>), bid = 10403,
		     num = 1, bind = 1, rand = 9000, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39054,
		     name = lang:get(<<"高级召唤礼包"/utf8>>), bid = 10403,
		     num = 2, bind = 1, rand = 700, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39054,
		     name = lang:get(<<"高级召唤礼包"/utf8>>), bid = 10403,
		     num = 5, bind = 1, rand = 290, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39054,
		     name = lang:get(<<"高级召唤礼包"/utf8>>), bid = 14001,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, max_out = 1}];
rand_list(39051) ->
    [#gift_rand_data{id = 39051,
		     name = lang:get(<<"精灵扭蛋礼包"/utf8>>), bid = 10415,
		     num = 1, bind = 1, rand = 9000, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39051,
		     name = lang:get(<<"精灵扭蛋礼包"/utf8>>), bid = 10415,
		     num = 2, bind = 1, rand = 700, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39051,
		     name = lang:get(<<"精灵扭蛋礼包"/utf8>>), bid = 10415,
		     num = 5, bind = 1, rand = 295, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39051,
		     name = lang:get(<<"精灵扭蛋礼包"/utf8>>), bid = 113001,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, max_out = 1}];
rand_list(39050) ->
    [#gift_rand_data{id = 39050,
		     name = lang:get(<<"小鬼南瓜礼包"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 489, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39050,
		     name = lang:get(<<"小鬼南瓜礼包"/utf8>>), bid = 10408,
		     num = 2, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39050,
		     name = lang:get(<<"小鬼南瓜礼包"/utf8>>), bid = 37002,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39050,
		     name = lang:get(<<"小鬼南瓜礼包"/utf8>>), bid = 29905,
		     num = 50, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39049) ->
    [#gift_rand_data{id = 39049,
		     name = lang:get(<<"幸运钻石福袋"/utf8>>), bid = 3, num = 188,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39049,
		     name = lang:get(<<"幸运钻石福袋"/utf8>>), bid = 3, num = 288,
		     bind = 1, rand = 400, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39049,
		     name = lang:get(<<"幸运钻石福袋"/utf8>>), bid = 3, num = 388,
		     bind = 1, rand = 200, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39049,
		     name = lang:get(<<"幸运钻石福袋"/utf8>>), bid = 3, num = 688,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(80240) ->
    [#gift_rand_data{id = 80240,
		     name = lang:get(<<"合服宝箱"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 489, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 80240,
		     name = lang:get(<<"合服宝箱"/utf8>>), bid = 10408, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 80240,
		     name = lang:get(<<"合服宝箱"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 80240,
		     name = lang:get(<<"合服宝箱"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39048) ->
    [#gift_rand_data{id = 39048,
		     name = lang:get(<<"月神礼盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 489, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39048,
		     name = lang:get(<<"月神礼盒"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39048,
		     name = lang:get(<<"月神礼盒"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39048,
		     name = lang:get(<<"月神礼盒"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39046) ->
    [#gift_rand_data{id = 39046,
		     name = lang:get(<<"绝黯之礼"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 489, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39046,
		     name = lang:get(<<"绝黯之礼"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39046,
		     name = lang:get(<<"绝黯之礼"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39046,
		     name = lang:get(<<"绝黯之礼"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, max_out = 1}];
rand_list(39045) ->
    [#gift_rand_data{id = 39045,
		     name = lang:get(<<"双蛋黄莲蓉月饼"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39045,
		     name = lang:get(<<"双蛋黄莲蓉月饼"/utf8>>), bid = 10403,
		     num = 1, bind = 1, rand = 549, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39045,
		     name = lang:get(<<"双蛋黄莲蓉月饼"/utf8>>), bid = 14001,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39044) ->
    [#gift_rand_data{id = 39044,
		     name = lang:get(<<"玉兔宝盒"/utf8>>), bid = 3, num = 388,
		     bind = 1, rand = 410, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39044,
		     name = lang:get(<<"玉兔宝盒"/utf8>>), bid = 3, num = 688,
		     bind = 1, rand = 120, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39044,
		     name = lang:get(<<"玉兔宝盒"/utf8>>), bid = 10408, num = 2,
		     bind = 1, rand = 440, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39044,
		     name = lang:get(<<"玉兔宝盒"/utf8>>), bid = 14001, num = 1,
		     bind = 1, rand = 30, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39043) ->
    [#gift_rand_data{id = 39043,
		     name = lang:get(<<"三昧真火礼包"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39043,
		     name = lang:get(<<"三昧真火礼包"/utf8>>), bid = 10407,
		     num = 2, bind = 1, rand = 505, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39043,
		     name = lang:get(<<"三昧真火礼包"/utf8>>), bid = 37002,
		     num = 1, bind = 1, rand = 150, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39043,
		     name = lang:get(<<"三昧真火礼包"/utf8>>), bid = 29905,
		     num = 50, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39041) ->
    [#gift_rand_data{id = 39041,
		     name = lang:get(<<"天籁之音"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39041,
		     name = lang:get(<<"天籁之音"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 505, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39041,
		     name = lang:get(<<"天籁之音"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 150, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39041,
		     name = lang:get(<<"天籁之音"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, max_out = 1}];
rand_list(39038) ->
    [#gift_rand_data{id = 39038,
		     name = lang:get(<<"庆典礼盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39038,
		     name = lang:get(<<"庆典礼盒"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 505, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39038,
		     name = lang:get(<<"庆典礼盒"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 150, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39038,
		     name = lang:get(<<"庆典礼盒"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39037) ->
    [#gift_rand_data{id = 39037,
		     name = lang:get(<<"幸运精英宝盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 490, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39037,
		     name = lang:get(<<"幸运精英宝盒"/utf8>>), bid = 10408,
		     num = 2, bind = 1, rand = 509, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39037,
		     name = lang:get(<<"幸运精英宝盒"/utf8>>), bid = 14001,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39036) ->
    [#gift_rand_data{id = 39036,
		     name = lang:get(<<"松果宝盒"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39036,
		     name = lang:get(<<"松果宝盒"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 505, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39036,
		     name = lang:get(<<"松果宝盒"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 150, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39036,
		     name = lang:get(<<"松果宝盒"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39035) ->
    [#gift_rand_data{id = 39035,
		     name = lang:get(<<"5星碎片礼盒"/utf8>>), bid = 29905,
		     num = 3, bind = 1, rand = 750, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39035,
		     name = lang:get(<<"5星碎片礼盒"/utf8>>), bid = 29905,
		     num = 5, bind = 1, rand = 240, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39035,
		     name = lang:get(<<"5星碎片礼盒"/utf8>>), bid = 29905,
		     num = 10, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39034) ->
    [#gift_rand_data{id = 39034,
		     name = lang:get(<<"粽夏之礼"/utf8>>), bid = 10403, num = 2,
		     bind = 1, rand = 600, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39034,
		     name = lang:get(<<"粽夏之礼"/utf8>>), bid = 10403, num = 3,
		     bind = 1, rand = 300, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39034,
		     name = lang:get(<<"粽夏之礼"/utf8>>), bid = 10403, num = 5,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39029) ->
    [#gift_rand_data{id = 39029,
		     name = lang:get(<<"盛夏之约礼包"/utf8>>), bid = 37003,
		     num = 8, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39029,
		     name = lang:get(<<"盛夏之约礼包"/utf8>>), bid = 37003,
		     num = 12, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39029,
		     name = lang:get(<<"盛夏之约礼包"/utf8>>), bid = 37003,
		     num = 20, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39028) ->
    [#gift_rand_data{id = 39028,
		     name = lang:get(<<"清凉一夏礼包"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 490, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39028,
		     name = lang:get(<<"清凉一夏礼包"/utf8>>), bid = 10403,
		     num = 2, bind = 1, rand = 450, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39028,
		     name = lang:get(<<"清凉一夏礼包"/utf8>>), bid = 14001,
		     num = 1, bind = 1, rand = 55, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39028,
		     name = lang:get(<<"清凉一夏礼包"/utf8>>), bid = 29905,
		     num = 50, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39022) ->
    [#gift_rand_data{id = 39022,
		     name = lang:get(<<"2星极品套装礼盒"/utf8>>), bid = 39023,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39022,
		     name = lang:get(<<"2星极品套装礼盒"/utf8>>), bid = 39024,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39022,
		     name = lang:get(<<"2星极品套装礼盒"/utf8>>), bid = 39025,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(80205) ->
    [#gift_rand_data{id = 80205,
		     name = lang:get(<<"八宝元宵"/utf8>>), bid = 3, num = 66,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out = 1},
     #gift_rand_data{id = 80205,
		     name = lang:get(<<"八宝元宵"/utf8>>), bid = 3, num = 68,
		     bind = 1, rand = 300, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out = 1},
     #gift_rand_data{id = 80205,
		     name = lang:get(<<"八宝元宵"/utf8>>), bid = 3, num = 88,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 80205,
		     name = lang:get(<<"八宝元宵"/utf8>>), bid = 3, num = 128,
		     bind = 1, rand = 200, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 80205,
		     name = lang:get(<<"八宝元宵"/utf8>>), bid = 3, num = 168,
		     bind = 1, rand = 75, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out2 = 5},
     #gift_rand_data{id = 80205,
		     name = lang:get(<<"八宝元宵"/utf8>>), bid = 3, num = 188,
		     bind = 1, rand = 25, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out2 = 10}];
rand_list(38092) ->
    [#gift_rand_data{id = 38092,
		     name = lang:get(<<"随机4星橙装礼包"/utf8>>), bid = 40111,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38092,
		     name = lang:get(<<"随机4星橙装礼包"/utf8>>), bid = 40211,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38092,
		     name = lang:get(<<"随机4星橙装礼包"/utf8>>), bid = 40311,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38092,
		     name = lang:get(<<"随机4星橙装礼包"/utf8>>), bid = 40411,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(38080) ->
    [#gift_rand_data{id = 38080,
		     name = lang:get(<<"随机橙装礼包"/utf8>>), bid = 40108,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38080,
		     name = lang:get(<<"随机橙装礼包"/utf8>>), bid = 40208,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38080,
		     name = lang:get(<<"随机橙装礼包"/utf8>>), bid = 40308,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38080,
		     name = lang:get(<<"随机橙装礼包"/utf8>>), bid = 40408,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(99001) ->
    [#gift_rand_data{id = 99001,
		     name = lang:get(<<"新春红包"/utf8>>), bid = 3, num = 128,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 99001,
		     name = lang:get(<<"新春红包"/utf8>>), bid = 3, num = 168,
		     bind = 1, rand = 200, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 99001,
		     name = lang:get(<<"新春红包"/utf8>>), bid = 3, num = 188,
		     bind = 1, rand = 300, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 99001,
		     name = lang:get(<<"新春红包"/utf8>>), bid = 3, num = 228,
		     bind = 1, rand = 250, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 99001,
		     name = lang:get(<<"新春红包"/utf8>>), bid = 3, num = 268,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 99001,
		     name = lang:get(<<"新春红包"/utf8>>), bid = 3, num = 298,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39032) ->
    [#gift_rand_data{id = 39032,
		     name = lang:get(<<"巨镰之礼"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39032,
		     name = lang:get(<<"巨镰之礼"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39032,
		     name = lang:get(<<"巨镰之礼"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 150, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39032,
		     name = lang:get(<<"巨镰之礼"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39031) ->
    [#gift_rand_data{id = 39031,
		     name = lang:get(<<"金蛋好礼"/utf8>>), bid = 10403, num = 1,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39031,
		     name = lang:get(<<"金蛋好礼"/utf8>>), bid = 10403, num = 2,
		     bind = 1, rand = 490, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39031,
		     name = lang:get(<<"金蛋好礼"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 150, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39031,
		     name = lang:get(<<"金蛋好礼"/utf8>>), bid = 14001, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39030) ->
    [#gift_rand_data{id = 39030,
		     name = lang:get(<<"魔狼宝藏"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39030,
		     name = lang:get(<<"魔狼宝藏"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 505, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39030,
		     name = lang:get(<<"魔狼宝藏"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 150, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39030,
		     name = lang:get(<<"魔狼宝藏"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 5, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39021) ->
    [#gift_rand_data{id = 39021,
		     name = lang:get(<<"先知珍宝福袋"/utf8>>), bid = 10403,
		     num = 1, bind = 1, rand = 580, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39021,
		     name = lang:get(<<"先知珍宝福袋"/utf8>>), bid = 14002,
		     num = 100, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39021,
		     name = lang:get(<<"先知珍宝福袋"/utf8>>), bid = 14001,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39020) ->
    [#gift_rand_data{id = 39020,
		     name = lang:get(<<"圣光之心"/utf8>>), bid = 3, num = 200,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39020,
		     name = lang:get(<<"圣光之心"/utf8>>), bid = 10407, num = 2,
		     bind = 1, rand = 500, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39020,
		     name = lang:get(<<"圣光之心"/utf8>>), bid = 37002, num = 1,
		     bind = 1, rand = 150, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39020,
		     name = lang:get(<<"圣光之心"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39019) ->
    [#gift_rand_data{id = 39019,
		     name = lang:get(<<"幸运福蛋"/utf8>>), bid = 37004, num = 1,
		     bind = 1, rand = 600, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39019,
		     name = lang:get(<<"幸运福蛋"/utf8>>), bid = 37004, num = 2,
		     bind = 1, rand = 300, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39019,
		     name = lang:get(<<"幸运福蛋"/utf8>>), bid = 37004, num = 5,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39018) ->
    [#gift_rand_data{id = 39018,
		     name = lang:get(<<"春日暖心福利"/utf8>>), bid = 10002,
		     num = 1, bind = 1, rand = 600, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39018,
		     name = lang:get(<<"春日暖心福利"/utf8>>), bid = 37001,
		     num = 1, bind = 1, rand = 360, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39018,
		     name = lang:get(<<"春日暖心福利"/utf8>>), bid = 29905,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39018,
		     name = lang:get(<<"春日暖心福利"/utf8>>), bid = 10403,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39017) ->
    [#gift_rand_data{id = 39017,
		     name = lang:get(<<"春日暖阳礼包"/utf8>>), bid = 3, num = 388,
		     bind = 1, rand = 400, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39017,
		     name = lang:get(<<"春日暖阳礼包"/utf8>>), bid = 10403,
		     num = 2, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39017,
		     name = lang:get(<<"春日暖阳礼包"/utf8>>), bid = 14001,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39017,
		     name = lang:get(<<"春日暖阳礼包"/utf8>>), bid = 37002,
		     num = 1, bind = 1, rand = 150, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39016) ->
    [#gift_rand_data{id = 39016,
		     name = lang:get(<<"春日钻石宝藏"/utf8>>), bid = 3, num = 2188,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39016,
		     name = lang:get(<<"春日钻石宝藏"/utf8>>), bid = 3, num = 2888,
		     bind = 1, rand = 400, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39016,
		     name = lang:get(<<"春日钻石宝藏"/utf8>>), bid = 3, num = 3888,
		     bind = 1, rand = 200, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39016,
		     name = lang:get(<<"春日钻石宝藏"/utf8>>), bid = 3, num = 8888,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39015) ->
    [#gift_rand_data{id = 39015,
		     name = lang:get(<<"春日钻石补给箱"/utf8>>), bid = 3,
		     num = 1288, bind = 1, rand = 350, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39015,
		     name = lang:get(<<"春日钻石补给箱"/utf8>>), bid = 3,
		     num = 1488, bind = 1, rand = 400, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39015,
		     name = lang:get(<<"春日钻石补给箱"/utf8>>), bid = 3,
		     num = 1888, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39015,
		     name = lang:get(<<"春日钻石补给箱"/utf8>>), bid = 3,
		     num = 2888, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39014) ->
    [#gift_rand_data{id = 39014,
		     name = lang:get(<<"春日钻石礼盒"/utf8>>), bid = 3, num = 488,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39014,
		     name = lang:get(<<"春日钻石礼盒"/utf8>>), bid = 3, num = 588,
		     bind = 1, rand = 400, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39014,
		     name = lang:get(<<"春日钻石礼盒"/utf8>>), bid = 3, num = 688,
		     bind = 1, rand = 200, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39014,
		     name = lang:get(<<"春日钻石礼盒"/utf8>>), bid = 3, num = 1288,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39013) ->
    [#gift_rand_data{id = 39013,
		     name = lang:get(<<"春日钻石福袋"/utf8>>), bid = 3, num = 188,
		     bind = 1, rand = 350, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39013,
		     name = lang:get(<<"春日钻石福袋"/utf8>>), bid = 3, num = 288,
		     bind = 1, rand = 400, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39013,
		     name = lang:get(<<"春日钻石福袋"/utf8>>), bid = 3, num = 388,
		     bind = 1, rand = 200, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39013,
		     name = lang:get(<<"春日钻石福袋"/utf8>>), bid = 3, num = 688,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(39012) ->
    [#gift_rand_data{id = 39012,
		     name = lang:get(<<"星辰钥匙福袋"/utf8>>), bid = 37003,
		     num = 5, bind = 1, rand = 600, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 1},
     #gift_rand_data{id = 39012,
		     name = lang:get(<<"星辰钥匙福袋"/utf8>>), bid = 37003,
		     num = 10, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39012,
		     name = lang:get(<<"星辰钥匙福袋"/utf8>>), bid = 37003,
		     num = 20, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 3}];
rand_list(39011) ->
    [#gift_rand_data{id = 39011,
		     name = lang:get(<<"限定召唤福袋"/utf8>>), bid = 10407,
		     num = 2, bind = 1, rand = 600, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 1},
     #gift_rand_data{id = 39011,
		     name = lang:get(<<"限定召唤福袋"/utf8>>), bid = 10407,
		     num = 3, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39011,
		     name = lang:get(<<"限定召唤福袋"/utf8>>), bid = 10407,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 3}];
rand_list(39010) ->
    [#gift_rand_data{id = 39010,
		     name = lang:get(<<"圣物结晶随机礼包"/utf8>>), bid = 17001,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39010,
		     name = lang:get(<<"圣物结晶随机礼包"/utf8>>), bid = 17002,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39010,
		     name = lang:get(<<"圣物结晶随机礼包"/utf8>>), bid = 17003,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39010,
		     name = lang:get(<<"圣物结晶随机礼包"/utf8>>), bid = 17004,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39010,
		     name = lang:get(<<"圣物结晶随机礼包"/utf8>>), bid = 17005,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39007) ->
    [#gift_rand_data{id = 39007,
		     name = lang:get(<<"寻宝达人福袋"/utf8>>), bid = 37001,
		     num = 3, bind = 1, rand = 600, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39007,
		     name = lang:get(<<"寻宝达人福袋"/utf8>>), bid = 37001,
		     num = 5, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39007,
		     name = lang:get(<<"寻宝达人福袋"/utf8>>), bid = 37002,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 3}];
rand_list(39006) ->
    [#gift_rand_data{id = 39006,
		     name = lang:get(<<"先知召唤福袋"/utf8>>), bid = 10403,
		     num = 2, bind = 1, rand = 600, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 1},
     #gift_rand_data{id = 39006,
		     name = lang:get(<<"先知召唤福袋"/utf8>>), bid = 10403,
		     num = 5, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39006,
		     name = lang:get(<<"先知召唤福袋"/utf8>>), bid = 14001,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 3}];
rand_list(39005) ->
    [#gift_rand_data{id = 39005,
		     name = lang:get(<<"火系英雄碎片福袋"/utf8>>), bid = 29205,
		     num = 10, bind = 1, rand = 350, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 3},
     #gift_rand_data{id = 39005,
		     name = lang:get(<<"火系英雄碎片福袋"/utf8>>), bid = 29205,
		     num = 15, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39005,
		     name = lang:get(<<"火系英雄碎片福袋"/utf8>>), bid = 29205,
		     num = 20, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39005,
		     name = lang:get(<<"火系英雄碎片福袋"/utf8>>), bid = 29205,
		     num = 30, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 4},
     #gift_rand_data{id = 39005,
		     name = lang:get(<<"火系英雄碎片福袋"/utf8>>), bid = 29205,
		     num = 50, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 7}];
rand_list(39004) ->
    [#gift_rand_data{id = 39004,
		     name = lang:get(<<"水系英雄碎片福袋"/utf8>>), bid = 29105,
		     num = 10, bind = 1, rand = 350, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 3},
     #gift_rand_data{id = 39004,
		     name = lang:get(<<"水系英雄碎片福袋"/utf8>>), bid = 29105,
		     num = 15, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39004,
		     name = lang:get(<<"水系英雄碎片福袋"/utf8>>), bid = 29105,
		     num = 20, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39004,
		     name = lang:get(<<"水系英雄碎片福袋"/utf8>>), bid = 29105,
		     num = 30, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 4},
     #gift_rand_data{id = 39004,
		     name = lang:get(<<"水系英雄碎片福袋"/utf8>>), bid = 29105,
		     num = 50, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 7}];
rand_list(39003) ->
    [#gift_rand_data{id = 39003,
		     name = lang:get(<<"自然英雄碎片福袋"/utf8>>), bid = 29305,
		     num = 10, bind = 1, rand = 350, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 3},
     #gift_rand_data{id = 39003,
		     name = lang:get(<<"自然英雄碎片福袋"/utf8>>), bid = 29305,
		     num = 15, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39003,
		     name = lang:get(<<"自然英雄碎片福袋"/utf8>>), bid = 29305,
		     num = 20, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39003,
		     name = lang:get(<<"自然英雄碎片福袋"/utf8>>), bid = 29305,
		     num = 30, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 4},
     #gift_rand_data{id = 39003,
		     name = lang:get(<<"自然英雄碎片福袋"/utf8>>), bid = 29305,
		     num = 50, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 7}];
rand_list(39002) ->
    [#gift_rand_data{id = 39002,
		     name = lang:get(<<"英雄碎片福袋"/utf8>>), bid = 29905,
		     num = 10, bind = 1, rand = 600, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 1},
     #gift_rand_data{id = 39002,
		     name = lang:get(<<"英雄碎片福袋"/utf8>>), bid = 29905,
		     num = 20, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39002,
		     name = lang:get(<<"英雄碎片福袋"/utf8>>), bid = 29905,
		     num = 50, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out2 = 3}];
rand_list(39001) ->
    [#gift_rand_data{id = 39001,
		     name = lang:get(<<"幸运召唤福袋"/utf8>>), bid = 10403,
		     num = 2, bind = 1, rand = 600, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999, can_out = 1},
     #gift_rand_data{id = 39001,
		     name = lang:get(<<"幸运召唤福袋"/utf8>>), bid = 10403,
		     num = 3, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 39001,
		     name = lang:get(<<"幸运召唤福袋"/utf8>>), bid = 10403,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(39000) ->
    [#gift_rand_data{id = 39000,
		     name = lang:get(<<"幸运宝盒"/utf8>>), bid = 10403, num = 1,
		     bind = 1, rand = 600, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999, can_out = 1},
     #gift_rand_data{id = 39000,
		     name = lang:get(<<"幸运宝盒"/utf8>>), bid = 10403, num = 2,
		     bind = 1, rand = 399, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 39000,
		     name = lang:get(<<"幸运宝盒"/utf8>>), bid = 10403, num = 10,
		     bind = 1, rand = 1, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(38091) ->
    [#gift_rand_data{id = 38091,
		     name = lang:get(<<"随机3星橙装礼包"/utf8>>), bid = 40110,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38091,
		     name = lang:get(<<"随机3星橙装礼包"/utf8>>), bid = 40210,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38091,
		     name = lang:get(<<"随机3星橙装礼包"/utf8>>), bid = 40310,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38091,
		     name = lang:get(<<"随机3星橙装礼包"/utf8>>), bid = 40410,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(38081) ->
    [#gift_rand_data{id = 38081,
		     name = lang:get(<<"随机2星橙装礼包"/utf8>>), bid = 40109,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38081,
		     name = lang:get(<<"随机2星橙装礼包"/utf8>>), bid = 40209,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38081,
		     name = lang:get(<<"随机2星橙装礼包"/utf8>>), bid = 40309,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38081,
		     name = lang:get(<<"随机2星橙装礼包"/utf8>>), bid = 40409,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(38071) ->
    [#gift_rand_data{id = 38071,
		     name = lang:get(<<"随机3星红装礼包"/utf8>>), bid = 40114,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38071,
		     name = lang:get(<<"随机3星红装礼包"/utf8>>), bid = 40214,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38071,
		     name = lang:get(<<"随机3星红装礼包"/utf8>>), bid = 40314,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38071,
		     name = lang:get(<<"随机3星红装礼包"/utf8>>), bid = 40414,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(38061) ->
    [#gift_rand_data{id = 38061,
		     name = lang:get(<<"随机2星红装礼包"/utf8>>), bid = 40113,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38061,
		     name = lang:get(<<"随机2星红装礼包"/utf8>>), bid = 40213,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38061,
		     name = lang:get(<<"随机2星红装礼包"/utf8>>), bid = 40313,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38061,
		     name = lang:get(<<"随机2星红装礼包"/utf8>>), bid = 40413,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(38101) ->
    [#gift_rand_data{id = 38101,
		     name = lang:get(<<"3星橙装礼包"/utf8>>), bid = 40110,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38101,
		     name = lang:get(<<"3星橙装礼包"/utf8>>), bid = 40210,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38101,
		     name = lang:get(<<"3星橙装礼包"/utf8>>), bid = 40310,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38101,
		     name = lang:get(<<"3星橙装礼包"/utf8>>), bid = 40410,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(38051) ->
    [#gift_rand_data{id = 38051,
		     name = lang:get(<<"随机红装礼包"/utf8>>), bid = 40112,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38051,
		     name = lang:get(<<"随机红装礼包"/utf8>>), bid = 40212,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38051,
		     name = lang:get(<<"随机红装礼包"/utf8>>), bid = 40312,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38051,
		     name = lang:get(<<"随机红装礼包"/utf8>>), bid = 40412,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(38042) ->
    [#gift_rand_data{id = 38042,
		     name = lang:get(<<"高级探宝礼包"/utf8>>), bid = 24907,
		     num = 25, bind = 1, rand = 700, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38042,
		     name = lang:get(<<"高级探宝礼包"/utf8>>), bid = 24907,
		     num = 50, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38042,
		     name = lang:get(<<"高级探宝礼包"/utf8>>), bid = 28905,
		     num = 25, bind = 1, rand = 700, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38042,
		     name = lang:get(<<"高级探宝礼包"/utf8>>), bid = 28905,
		     num = 50, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(38041) ->
    [#gift_rand_data{id = 38041,
		     name = lang:get(<<"幸运探宝礼包"/utf8>>), bid = 1,
		     num = 800000, bind = 1, rand = 700, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38041,
		     name = lang:get(<<"幸运探宝礼包"/utf8>>), bid = 1,
		     num = 1000000, bind = 1, rand = 300, career = 0,
		     sex = 2, min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38041,
		     name = lang:get(<<"幸运探宝礼包"/utf8>>), bid = 22,
		     num = 500000, bind = 1, rand = 700, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 38041,
		     name = lang:get(<<"幸运探宝礼包"/utf8>>), bid = 22,
		     num = 800000, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(36003) ->
    [#gift_rand_data{id = 36003,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 10021,
		     num = 1, bind = 1, rand = 228, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36003,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 10022,
		     num = 1, bind = 1, rand = 228, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36003,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 10023,
		     num = 1, bind = 1, rand = 228, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36003,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 10024,
		     num = 1, bind = 1, rand = 228, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36003,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71020,
		     num = 1, bind = 1, rand = 22, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36003,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71021,
		     num = 1, bind = 1, rand = 22, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36003,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71022,
		     num = 1, bind = 1, rand = 22, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36003,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71023,
		     num = 1, bind = 1, rand = 22, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(36002) ->
    [#gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 10021,
		     num = 1, bind = 1, rand = 212, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 10022,
		     num = 1, bind = 1, rand = 212, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 10023,
		     num = 1, bind = 1, rand = 212, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 10024,
		     num = 1, bind = 1, rand = 212, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71020,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71021,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71022,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71023,
		     num = 1, bind = 1, rand = 25, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71030,
		     num = 1, bind = 1, rand = 12, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71031,
		     num = 1, bind = 1, rand = 12, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71032,
		     num = 1, bind = 1, rand = 12, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36002,
		     name = lang:get(<<"帮会战胜利宝箱"/utf8>>), bid = 71033,
		     num = 1, bind = 1, rand = 12, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(36001) ->
    [#gift_rand_data{id = 36001,
		     name = lang:get(<<"帮会战战绩宝箱"/utf8>>), bid = 10021,
		     num = 1, bind = 1, rand = 83, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36001,
		     name = lang:get(<<"帮会战战绩宝箱"/utf8>>), bid = 10022,
		     num = 1, bind = 1, rand = 83, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36001,
		     name = lang:get(<<"帮会战战绩宝箱"/utf8>>), bid = 10023,
		     num = 1, bind = 1, rand = 83, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36001,
		     name = lang:get(<<"帮会战战绩宝箱"/utf8>>), bid = 10024,
		     num = 1, bind = 1, rand = 83, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36001,
		     name = lang:get(<<"帮会战战绩宝箱"/utf8>>), bid = 10420,
		     num = 1, bind = 1, rand = 80, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36001,
		     name = lang:get(<<"帮会战战绩宝箱"/utf8>>), bid = 10421,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36001,
		     name = lang:get(<<"帮会战战绩宝箱"/utf8>>), bid = 72001,
		     num = 3, bind = 1, rand = 220, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 36001,
		     name = lang:get(<<"帮会战战绩宝箱"/utf8>>), bid = 70003,
		     num = 2, bind = 1, rand = 350, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(35100) ->
    [#gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20062,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20048,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20025,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20041,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20032,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20039,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20044,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20033,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20054,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35100,
		     name = lang:get(<<"神圣碎片礼包"/utf8>>), bid = 20028,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(35023) ->
    [#gift_rand_data{id = 35023,
		     name = lang:get(<<"圣念之灵神盒"/utf8>>), bid = 71023,
		     num = 2, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35023,
		     name = lang:get(<<"圣念之灵神盒"/utf8>>), bid = 71033,
		     num = 1, bind = 1, rand = 150, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(35022) ->
    [#gift_rand_data{id = 35022,
		     name = lang:get(<<"圣意之灵神盒"/utf8>>), bid = 71022,
		     num = 2, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35022,
		     name = lang:get(<<"圣意之灵神盒"/utf8>>), bid = 71032,
		     num = 1, bind = 1, rand = 150, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(35021) ->
    [#gift_rand_data{id = 35021,
		     name = lang:get(<<"圣魄之灵神盒"/utf8>>), bid = 71021,
		     num = 2, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35021,
		     name = lang:get(<<"圣魄之灵神盒"/utf8>>), bid = 71031,
		     num = 1, bind = 1, rand = 150, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(35020) ->
    [#gift_rand_data{id = 35020,
		     name = lang:get(<<"圣魂之灵神盒"/utf8>>), bid = 71020,
		     num = 2, bind = 1, rand = 850, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35020,
		     name = lang:get(<<"圣魂之灵神盒"/utf8>>), bid = 71030,
		     num = 1, bind = 1, rand = 150, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(35013) ->
    [#gift_rand_data{id = 35013,
		     name = lang:get(<<"圣念之灵宝盒"/utf8>>), bid = 72001,
		     num = 20, bind = 1, rand = 950, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35013,
		     name = lang:get(<<"圣念之灵宝盒"/utf8>>), bid = 71033,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(35012) ->
    [#gift_rand_data{id = 35012,
		     name = lang:get(<<"圣意之灵宝盒"/utf8>>), bid = 72001,
		     num = 20, bind = 1, rand = 950, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35012,
		     name = lang:get(<<"圣意之灵宝盒"/utf8>>), bid = 71032,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(35011) ->
    [#gift_rand_data{id = 35011,
		     name = lang:get(<<"圣魄之灵宝盒"/utf8>>), bid = 72001,
		     num = 20, bind = 1, rand = 950, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35011,
		     name = lang:get(<<"圣魄之灵宝盒"/utf8>>), bid = 71031,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(35010) ->
    [#gift_rand_data{id = 35010,
		     name = lang:get(<<"圣魂之灵宝盒"/utf8>>), bid = 72001,
		     num = 20, bind = 1, rand = 950, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 35010,
		     name = lang:get(<<"圣魂之灵宝盒"/utf8>>), bid = 71030,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34014) ->
    [#gift_rand_data{id = 34014,
		     name = lang:get(<<"9阶橙装礼盒"/utf8>>), bid = 44109,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34014,
		     name = lang:get(<<"9阶橙装礼盒"/utf8>>), bid = 44209,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34014,
		     name = lang:get(<<"9阶橙装礼盒"/utf8>>), bid = 44309,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34014,
		     name = lang:get(<<"9阶橙装礼盒"/utf8>>), bid = 44409,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34013) ->
    [#gift_rand_data{id = 34013,
		     name = lang:get(<<"7阶橙装礼盒"/utf8>>), bid = 44107,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34013,
		     name = lang:get(<<"7阶橙装礼盒"/utf8>>), bid = 44207,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34013,
		     name = lang:get(<<"7阶橙装礼盒"/utf8>>), bid = 44307,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34013,
		     name = lang:get(<<"7阶橙装礼盒"/utf8>>), bid = 44407,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34012) ->
    [#gift_rand_data{id = 34012,
		     name = lang:get(<<"中级突破礼包"/utf8>>), bid = 10041,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34012,
		     name = lang:get(<<"中级突破礼包"/utf8>>), bid = 10051,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34012,
		     name = lang:get(<<"中级突破礼包"/utf8>>), bid = 10061,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34012,
		     name = lang:get(<<"中级突破礼包"/utf8>>), bid = 10071,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34011) ->
    [#gift_rand_data{id = 34011,
		     name = lang:get(<<"初级突破礼包"/utf8>>), bid = 10040,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34011,
		     name = lang:get(<<"初级突破礼包"/utf8>>), bid = 10050,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34011,
		     name = lang:get(<<"初级突破礼包"/utf8>>), bid = 10060,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34011,
		     name = lang:get(<<"初级突破礼包"/utf8>>), bid = 10070,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34010) ->
    [#gift_rand_data{id = 34010,
		     name = lang:get(<<"8阶橙装礼盒"/utf8>>), bid = 44108,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34010,
		     name = lang:get(<<"8阶橙装礼盒"/utf8>>), bid = 44208,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34010,
		     name = lang:get(<<"8阶橙装礼盒"/utf8>>), bid = 44308,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34010,
		     name = lang:get(<<"8阶橙装礼盒"/utf8>>), bid = 44408,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34009) ->
    [#gift_rand_data{id = 34009,
		     name = lang:get(<<"随机神将礼包"/utf8>>), bid = 28001,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34009,
		     name = lang:get(<<"随机神将礼包"/utf8>>), bid = 28002,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34008) ->
    [#gift_rand_data{id = 34008,
		     name = lang:get(<<"橙色圣器礼盒"/utf8>>), bid = 71030,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34008,
		     name = lang:get(<<"橙色圣器礼盒"/utf8>>), bid = 71031,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34008,
		     name = lang:get(<<"橙色圣器礼盒"/utf8>>), bid = 71032,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34008,
		     name = lang:get(<<"橙色圣器礼盒"/utf8>>), bid = 71033,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34007) ->
    [#gift_rand_data{id = 34007,
		     name = lang:get(<<"紫色圣器礼盒"/utf8>>), bid = 71020,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34007,
		     name = lang:get(<<"紫色圣器礼盒"/utf8>>), bid = 71021,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34007,
		     name = lang:get(<<"紫色圣器礼盒"/utf8>>), bid = 71022,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34007,
		     name = lang:get(<<"紫色圣器礼盒"/utf8>>), bid = 71023,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34003) ->
    [#gift_rand_data{id = 34003,
		     name = lang:get(<<"6阶橙装礼盒"/utf8>>), bid = 44106,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34003,
		     name = lang:get(<<"6阶橙装礼盒"/utf8>>), bid = 44206,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34003,
		     name = lang:get(<<"6阶橙装礼盒"/utf8>>), bid = 44306,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34003,
		     name = lang:get(<<"6阶橙装礼盒"/utf8>>), bid = 44406,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34002) ->
    [#gift_rand_data{id = 34002,
		     name = lang:get(<<"5阶橙装礼盒"/utf8>>), bid = 44105,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34002,
		     name = lang:get(<<"5阶橙装礼盒"/utf8>>), bid = 44205,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34002,
		     name = lang:get(<<"5阶橙装礼盒"/utf8>>), bid = 44305,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34002,
		     name = lang:get(<<"5阶橙装礼盒"/utf8>>), bid = 44405,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(34001) ->
    [#gift_rand_data{id = 34001,
		     name = lang:get(<<"4阶橙装礼盒"/utf8>>), bid = 44104,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34001,
		     name = lang:get(<<"4阶橙装礼盒"/utf8>>), bid = 44204,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34001,
		     name = lang:get(<<"4阶橙装礼盒"/utf8>>), bid = 44304,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 34001,
		     name = lang:get(<<"4阶橙装礼盒"/utf8>>), bid = 44404,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(33002) ->
    [#gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10430,
		     num = 1, bind = 1, rand = 22, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10431,
		     num = 1, bind = 1, rand = 33, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10030,
		     num = 1, bind = 1, rand = 220, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10500,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10501,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10502,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10503,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10504,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10505,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10506,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10507,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10508,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10509,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10510,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10511,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10512,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10513,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10514,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10515,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10516,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10517,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10518,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10519,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10520,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10521,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10522,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10523,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10524,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10525,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10526,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10527,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10528,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10529,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10530,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10531,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10532,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 10102,
		     num = 100, bind = 1, rand = 330, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33002,
		     name = lang:get(<<"众神战场希望礼包"/utf8>>), bid = 2,
		     num = 50000, bind = 1, rand = 330, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(33001) ->
    [#gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10421,
		     num = 1, bind = 1, rand = 11, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10420,
		     num = 1, bind = 1, rand = 22, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10430,
		     num = 1, bind = 1, rand = 44, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10431,
		     num = 1, bind = 1, rand = 66, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10030,
		     num = 1, bind = 1, rand = 440, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10500,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10501,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10502,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10503,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10504,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10505,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10506,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10507,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10508,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10509,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10510,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10511,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10512,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10513,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10514,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10515,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10516,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10517,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10518,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10519,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10520,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10521,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10522,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10523,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10524,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10525,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10526,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10527,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10528,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10529,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10530,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10531,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10532,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 10102,
		     num = 100, bind = 1, rand = 660, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33001,
		     name = lang:get(<<"众神战场和平礼包"/utf8>>), bid = 2,
		     num = 50000, bind = 1, rand = 627, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(33000) ->
    [#gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10421,
		     num = 1, bind = 1, rand = 11, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10420,
		     num = 1, bind = 1, rand = 22, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10430,
		     num = 1, bind = 1, rand = 33, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10431,
		     num = 1, bind = 1, rand = 44, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10030,
		     num = 1, bind = 1, rand = 220, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10500,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10501,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10502,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10503,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10504,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10505,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10506,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10507,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10508,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10509,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10510,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10511,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10512,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10513,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10514,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10515,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10516,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10517,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10518,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10519,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10520,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10521,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10522,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10523,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10524,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10525,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10526,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10527,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10528,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10529,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10530,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10531,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10532,
		     num = 1, bind = 1, rand = 5, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 10102,
		     num = 100, bind = 1, rand = 330, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 33000,
		     name = lang:get(<<"众神战场胜利礼包"/utf8>>), bid = 2,
		     num = 50000, bind = 1, rand = 275, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(32050) ->
    [#gift_rand_data{id = 32050,
		     name = lang:get(<<"秘宝碎片礼包"/utf8>>), bid = 10153,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 32050,
		     name = lang:get(<<"秘宝碎片礼包"/utf8>>), bid = 10154,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 32050,
		     name = lang:get(<<"秘宝碎片礼包"/utf8>>), bid = 10155,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 32050,
		     name = lang:get(<<"秘宝碎片礼包"/utf8>>), bid = 10156,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(31005) ->
    [#gift_rand_data{id = 31005,
		     name = lang:get(<<"SS神圣英雄碎片礼包"/utf8>>), bid = 20025,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31005,
		     name = lang:get(<<"SS神圣英雄碎片礼包"/utf8>>), bid = 20032,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31005,
		     name = lang:get(<<"SS神圣英雄碎片礼包"/utf8>>), bid = 20039,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31005,
		     name = lang:get(<<"SS神圣英雄碎片礼包"/utf8>>), bid = 20033,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31005,
		     name = lang:get(<<"SS神圣英雄碎片礼包"/utf8>>), bid = 20028,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(31004) ->
    [#gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20062,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20048,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20025,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20041,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20032,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20039,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20044,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20033,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20054,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31004,
		     name = lang:get(<<"神圣英雄碎片礼包"/utf8>>), bid = 20028,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(31003) ->
    [#gift_rand_data{id = 31003,
		     name = lang:get(<<"SS月曜英雄碎片礼包"/utf8>>), bid = 20021,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31003,
		     name = lang:get(<<"SS月曜英雄碎片礼包"/utf8>>), bid = 20031,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31003,
		     name = lang:get(<<"SS月曜英雄碎片礼包"/utf8>>), bid = 20038,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31003,
		     name = lang:get(<<"SS月曜英雄碎片礼包"/utf8>>), bid = 20037,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31003,
		     name = lang:get(<<"SS月曜英雄碎片礼包"/utf8>>), bid = 20052,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(31002) ->
    [#gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20057,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20021,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20031,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20063,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20050,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20056,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20038,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20037,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20059,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31002,
		     name = lang:get(<<"月曜英雄碎片礼包"/utf8>>), bid = 20052,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(31001) ->
    [#gift_rand_data{id = 31001,
		     name = lang:get(<<"SS星灵英雄碎片礼包"/utf8>>), bid = 20024,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31001,
		     name = lang:get(<<"SS星灵英雄碎片礼包"/utf8>>), bid = 20036,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31001,
		     name = lang:get(<<"SS星灵英雄碎片礼包"/utf8>>), bid = 20022,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31001,
		     name = lang:get(<<"SS星灵英雄碎片礼包"/utf8>>), bid = 20085,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31001,
		     name = lang:get(<<"SS星灵英雄碎片礼包"/utf8>>), bid = 20035,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(31000) ->
    [#gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20066,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20024,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20036,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20022,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20034,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20061,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20055,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20085,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20078,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 31000,
		     name = lang:get(<<"星灵英雄碎片礼包"/utf8>>), bid = 20035,
		     num = 5, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30351) ->
    [#gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 10301,
		     num = 500, bind = 1, rand = 200, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 30400,
		     num = 1, bind = 1, rand = 300, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 11, num = 200,
		     bind = 1, rand = 250, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 13, num = 10,
		     bind = 1, rand = 160, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 10310,
		     num = 1, bind = 1, rand = 30, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 10401,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60020,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60021,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60022,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60023,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60120,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60121,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60122,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60123,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60220,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60221,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60222,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30351,
		     name = lang:get(<<"试炼王者礼包"/utf8>>), bid = 60223,
		     num = 1, bind = 1, rand = 1, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30350) ->
    [#gift_rand_data{id = 30350,
		     name = lang:get(<<"试炼勇者礼包"/utf8>>), bid = 2,
		     num = 100000, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30350,
		     name = lang:get(<<"试炼勇者礼包"/utf8>>), bid = 2,
		     num = 188888, bind = 1, rand = 180, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30350,
		     name = lang:get(<<"试炼勇者礼包"/utf8>>), bid = 2,
		     num = 288888, bind = 1, rand = 210, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30350,
		     name = lang:get(<<"试炼勇者礼包"/utf8>>), bid = 2,
		     num = 488888, bind = 1, rand = 280, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30350,
		     name = lang:get(<<"试炼勇者礼包"/utf8>>), bid = 2,
		     num = 688888, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30350,
		     name = lang:get(<<"试炼勇者礼包"/utf8>>), bid = 2,
		     num = 888888, bind = 1, rand = 80, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30350,
		     name = lang:get(<<"试炼勇者礼包"/utf8>>), bid = 30400,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30156) ->
    [#gift_rand_data{id = 30156,
		     name = lang:get(<<"SS级神圣礼包"/utf8>>), bid = 20025,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30156,
		     name = lang:get(<<"SS级神圣礼包"/utf8>>), bid = 20032,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30156,
		     name = lang:get(<<"SS级神圣礼包"/utf8>>), bid = 20039,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30156,
		     name = lang:get(<<"SS级神圣礼包"/utf8>>), bid = 20033,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30156,
		     name = lang:get(<<"SS级神圣礼包"/utf8>>), bid = 20028,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30155) ->
    [#gift_rand_data{id = 30155,
		     name = lang:get(<<"S级神圣礼包"/utf8>>), bid = 20062,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30155,
		     name = lang:get(<<"S级神圣礼包"/utf8>>), bid = 20048,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30155,
		     name = lang:get(<<"S级神圣礼包"/utf8>>), bid = 20041,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30155,
		     name = lang:get(<<"S级神圣礼包"/utf8>>), bid = 20044,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30155,
		     name = lang:get(<<"S级神圣礼包"/utf8>>), bid = 20054,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30154) ->
    [#gift_rand_data{id = 30154,
		     name = lang:get(<<"SS级月曜礼包"/utf8>>), bid = 20021,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30154,
		     name = lang:get(<<"SS级月曜礼包"/utf8>>), bid = 20031,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30154,
		     name = lang:get(<<"SS级月曜礼包"/utf8>>), bid = 20038,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30154,
		     name = lang:get(<<"SS级月曜礼包"/utf8>>), bid = 20037,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30154,
		     name = lang:get(<<"SS级月曜礼包"/utf8>>), bid = 20052,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30153) ->
    [#gift_rand_data{id = 30153,
		     name = lang:get(<<"S级月曜礼包"/utf8>>), bid = 20057,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30153,
		     name = lang:get(<<"S级月曜礼包"/utf8>>), bid = 20063,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30153,
		     name = lang:get(<<"S级月曜礼包"/utf8>>), bid = 20050,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30153,
		     name = lang:get(<<"S级月曜礼包"/utf8>>), bid = 20056,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30153,
		     name = lang:get(<<"S级月曜礼包"/utf8>>), bid = 20059,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30152) ->
    [#gift_rand_data{id = 30152,
		     name = lang:get(<<"A级星灵礼包"/utf8>>), bid = 20071,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30152,
		     name = lang:get(<<"A级星灵礼包"/utf8>>), bid = 20072,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30152,
		     name = lang:get(<<"A级星灵礼包"/utf8>>), bid = 20045,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30151) ->
    [#gift_rand_data{id = 30151,
		     name = lang:get(<<"SS级星灵礼包"/utf8>>), bid = 20024,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30151,
		     name = lang:get(<<"SS级星灵礼包"/utf8>>), bid = 20035,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30151,
		     name = lang:get(<<"SS级星灵礼包"/utf8>>), bid = 20036,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30151,
		     name = lang:get(<<"SS级星灵礼包"/utf8>>), bid = 20022,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30151,
		     name = lang:get(<<"SS级星灵礼包"/utf8>>), bid = 20085,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30150) ->
    [#gift_rand_data{id = 30150,
		     name = lang:get(<<"S级星灵礼包"/utf8>>), bid = 20066,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30150,
		     name = lang:get(<<"S级星灵礼包"/utf8>>), bid = 20034,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30150,
		     name = lang:get(<<"S级星灵礼包"/utf8>>), bid = 20055,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30150,
		     name = lang:get(<<"S级星灵礼包"/utf8>>), bid = 20078,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30150,
		     name = lang:get(<<"S级星灵礼包"/utf8>>), bid = 20061,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30110) ->
    [#gift_rand_data{id = 30110,
		     name = lang:get(<<"帮会技能晶石礼包"/utf8>>), bid = 10021,
		     num = 1, bind = 1, rand = 250, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30110,
		     name = lang:get(<<"帮会技能晶石礼包"/utf8>>), bid = 10022,
		     num = 1, bind = 1, rand = 250, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30110,
		     name = lang:get(<<"帮会技能晶石礼包"/utf8>>), bid = 10023,
		     num = 1, bind = 1, rand = 250, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30110,
		     name = lang:get(<<"帮会技能晶石礼包"/utf8>>), bid = 10024,
		     num = 1, bind = 1, rand = 250, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(10996) ->
    [#gift_rand_data{id = 10996,
		     name = lang:get(<<"橙色珍宝礼包"/utf8>>), bid = 11000,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 10996,
		     name = lang:get(<<"橙色珍宝礼包"/utf8>>), bid = 11001,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(10995) ->
    [#gift_rand_data{id = 10995,
		     name = lang:get(<<"紫色珍宝礼包"/utf8>>), bid = 11002,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 10995,
		     name = lang:get(<<"紫色珍宝礼包"/utf8>>), bid = 11003,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 10995,
		     name = lang:get(<<"紫色珍宝礼包"/utf8>>), bid = 11004,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 10995,
		     name = lang:get(<<"紫色珍宝礼包"/utf8>>), bid = 11005,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30031) ->
    [#gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60040,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60041,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60042,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60043,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60140,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60141,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60142,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60143,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60240,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60241,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60242,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60243,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60340,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60341,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60342,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30031,
		     name = lang:get(<<"随机红色命格礼包"/utf8>>), bid = 60343,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30030) ->
    [#gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60030,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60031,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60032,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60033,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60130,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60131,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60132,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60133,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60230,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60231,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60232,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60233,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60330,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60331,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60332,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30030,
		     name = lang:get(<<"随机橙色命格礼包"/utf8>>), bid = 60333,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30029) ->
    [#gift_rand_data{id = 30029,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 44103,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30029,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 44203,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30029,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 44303,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30029,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 44403,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30028) ->
    [#gift_rand_data{id = 30028,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 44102,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30028,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 44202,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30028,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 44302,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30028,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 44402,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30027) ->
    [#gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60020,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60021,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60022,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60023,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60120,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60121,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60122,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60123,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60220,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60221,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60222,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60223,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60320,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60321,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60322,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60323,
		     num = 1, bind = 1, rand = 425, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60030,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60031,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60032,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60033,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60130,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60131,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60132,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60133,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60230,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60231,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60232,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60233,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60330,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60331,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60332,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30027,
		     name = lang:get(<<"随机命格礼包"/utf8>>), bid = 60333,
		     num = 1, bind = 1, rand = 75, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30026) ->
    [#gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60020,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60021,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60022,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60023,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60120,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60121,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60122,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60123,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60220,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60221,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60222,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30026,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60223,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30025) ->
    [#gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60020,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60021,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60022,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60023,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60120,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60121,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60122,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60123,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60220,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60221,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60222,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30025,
		     name = lang:get(<<"三星座紫色随机礼包"/utf8>>), bid = 60223,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30024) ->
    [#gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60020,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60021,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60022,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60023,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60120,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60121,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60122,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60123,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60220,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60221,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60222,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60223,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60320,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60321,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60322,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30024,
		     name = lang:get(<<"四星座紫色随机礼包"/utf8>>), bid = 60323,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30005) ->
    [#gift_rand_data{id = 30005,
		     name = lang:get(<<"随机阵法书礼包"/utf8>>), bid = 10110,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30005,
		     name = lang:get(<<"随机阵法书礼包"/utf8>>), bid = 10111,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30005,
		     name = lang:get(<<"随机阵法书礼包"/utf8>>), bid = 10112,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30005,
		     name = lang:get(<<"随机阵法书礼包"/utf8>>), bid = 10113,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30005,
		     name = lang:get(<<"随机阵法书礼包"/utf8>>), bid = 10114,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30005,
		     name = lang:get(<<"随机阵法书礼包"/utf8>>), bid = 10115,
		     num = 1, bind = 1, rand = 100, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30004) ->
    [#gift_rand_data{id = 30004,
		     name = lang:get(<<"神器超值礼包"/utf8>>), bid = 10420,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30004,
		     name = lang:get(<<"神器超值礼包"/utf8>>), bid = 10421,
		     num = 1, bind = 1, rand = 500, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(30002) ->
    [#gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10500,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10501,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10502,
		     num = 1, bind = 1, rand = 55, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10503,
		     num = 1, bind = 1, rand = 55, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10504,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10505,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10506,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10507,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10508,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10509,
		     num = 1, bind = 1, rand = 60, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10510,
		     num = 1, bind = 1, rand = 60, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10511,
		     num = 1, bind = 1, rand = 60, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10512,
		     num = 1, bind = 1, rand = 55, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10513,
		     num = 1, bind = 1, rand = 55, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10514,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10515,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10516,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10517,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10518,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10519,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10520,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10521,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10522,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10523,
		     num = 1, bind = 1, rand = 20, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10524,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10525,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10526,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10527,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10528,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10529,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10530,
		     num = 1, bind = 1, rand = 10, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999},
     #gift_rand_data{id = 30002,
		     name = lang:get(<<"随机技能书礼包"/utf8>>), bid = 10531,
		     num = 1, bind = 1, rand = 50, career = 0, sex = 2,
		     min_lev = 1, max_lev = 999}];
rand_list(16201) ->
    [#gift_rand_data{id = 16201,
		     name = lang:get(<<"破裂符石"/utf8>>), bid = 16101, num = 1,
		     bind = 1, rand = 125, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 16201,
		     name = lang:get(<<"蓄力符石"/utf8>>), bid = 16102, num = 1,
		     bind = 1, rand = 125, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 16201,
		     name = lang:get(<<"灵巧符石"/utf8>>), bid = 16103, num = 1,
		     bind = 1, rand = 125, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 16201,
		     name = lang:get(<<"制裁符石"/utf8>>), bid = 16104, num = 1,
		     bind = 1, rand = 125, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 16201,
		     name = lang:get(<<"信仰符石"/utf8>>), bid = 16105, num = 1,
		     bind = 1, rand = 125, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 16201,
		     name = lang:get(<<"庇护符石"/utf8>>), bid = 16106, num = 1,
		     bind = 1, rand = 125, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 16201,
		     name = lang:get(<<"灵感符石"/utf8>>), bid = 16107, num = 1,
		     bind = 1, rand = 125, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 16201,
		     name = lang:get(<<"救急符石"/utf8>>), bid = 16108, num = 1,
		     bind = 1, rand = 125, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(10499) ->
    [#gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10500, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10501, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10502, num = 1,
		     bind = 1, rand = 55, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10503, num = 1,
		     bind = 1, rand = 55, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10504, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10505, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10506, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10507, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10508, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10509, num = 1,
		     bind = 1, rand = 60, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10510, num = 1,
		     bind = 1, rand = 60, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10511, num = 1,
		     bind = 1, rand = 60, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10512, num = 1,
		     bind = 1, rand = 55, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10513, num = 1,
		     bind = 1, rand = 55, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10514, num = 1,
		     bind = 1, rand = 20, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10515, num = 1,
		     bind = 1, rand = 20, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10516, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10517, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10518, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10519, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10520, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10521, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10522, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10523, num = 1,
		     bind = 1, rand = 20, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10524, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10525, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10526, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10527, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10528, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10529, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10530, num = 1,
		     bind = 1, rand = 10, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10499,
		     name = lang:get(<<"随机技能书"/utf8>>), bid = 10531, num = 1,
		     bind = 1, rand = 50, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(10301) ->
    [#gift_rand_data{id = 10301,
		     name = lang:get(<<"冠军之心"/utf8>>), bid = 10452, num = 1,
		     bind = 1, rand = 98, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10301,
		     name = lang:get(<<"冠军之心"/utf8>>), bid = 10453, num = 1,
		     bind = 1, rand = 42, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10301,
		     name = lang:get(<<"冠军之心"/utf8>>), bid = 32, num = 20000,
		     bind = 1, rand = 280, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10301,
		     name = lang:get(<<"冠军之心"/utf8>>), bid = 29905, num = 5,
		     bind = 1, rand = 220, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10301,
		     name = lang:get(<<"冠军之心"/utf8>>), bid = 29905, num = 10,
		     bind = 1, rand = 180, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10301,
		     name = lang:get(<<"冠军之心"/utf8>>), bid = 29905, num = 50,
		     bind = 1, rand = 30, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10301,
		     name = lang:get(<<"冠军之心"/utf8>>), bid = 10603, num = 1,
		     bind = 1, rand = 150, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(10204) ->
    [#gift_rand_data{id = 10204,
		     name = lang:get(<<"高级礼包"/utf8>>), bid = 10110, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10204,
		     name = lang:get(<<"高级礼包"/utf8>>), bid = 10111, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10204,
		     name = lang:get(<<"高级礼包"/utf8>>), bid = 10112, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10204,
		     name = lang:get(<<"高级礼包"/utf8>>), bid = 10113, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10204,
		     name = lang:get(<<"高级礼包"/utf8>>), bid = 10114, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(10203) ->
    [#gift_rand_data{id = 10203,
		     name = lang:get(<<"普通礼包"/utf8>>), bid = 10110, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10203,
		     name = lang:get(<<"普通礼包"/utf8>>), bid = 10111, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10203,
		     name = lang:get(<<"普通礼包"/utf8>>), bid = 10112, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10203,
		     name = lang:get(<<"普通礼包"/utf8>>), bid = 10113, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999},
     #gift_rand_data{id = 10203,
		     name = lang:get(<<"普通礼包"/utf8>>), bid = 10114, num = 1,
		     bind = 1, rand = 100, career = 0, sex = 2, min_lev = 1,
		     max_lev = 999}];
rand_list(_) -> [].

chose_list(8888825) ->
    [#gift_chose_data{id = 8888825, bid = 88888251, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 8888825, bid = 88888252, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 8888825, bid = 88888253, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 8888825, bid = 88888254, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 8888825, bid = 88888255, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 8888825, bid = 88888256, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 8888825, bid = 88888257, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 8888825, bid = 88888258, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 8888825, bid = 88888259, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 8888825, bid = 888882510, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 8888825, bid = 888882511, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 8888825, bid = 888882512, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 8888825, bid = 888882513, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 8888825, bid = 888882514, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 14}];
chose_list(8888830) ->
    [#gift_chose_data{id = 8888830, bid = 88888301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 8888830, bid = 88888302, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 8888830, bid = 88888303, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 8888830, bid = 88888304, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 8888830, bid = 88888305, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 8888830, bid = 88888306, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 8888830, bid = 88888307, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 8888830, bid = 88888308, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 8888830, bid = 88888309, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 8888830, bid = 888883010, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 8888830, bid = 888883011, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 8888830, bid = 888883012, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 8888830, bid = 888883013, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 8888830, bid = 888883014, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 9999, auto_open = 1, sort_id = 14}];
chose_list(39523) ->
    [#gift_chose_data{id = 39523, bid = 89010501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39523, bid = 89020501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39523, bid = 89030501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39523, bid = 89040501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39523, bid = 89050501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39523, bid = 89060501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39523, bid = 89070501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39523, bid = 89080501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 39523, bid = 89090501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 39523, bid = 89100501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 39523, bid = 89110501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 39523, bid = 89120501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 39523, bid = 89130501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 39523, bid = 89140501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 14}];
chose_list(39522) ->
    [#gift_chose_data{id = 39522, bid = 89010301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39522, bid = 89020301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39522, bid = 89030301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39522, bid = 89040301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39522, bid = 89050301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39522, bid = 89060301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39522, bid = 89070301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39522, bid = 89080301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 39522, bid = 89090301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 39522, bid = 89100301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 39522, bid = 89110301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 39522, bid = 89120301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 39522, bid = 89130301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 39522, bid = 89140301, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 14}];
chose_list(39082) ->
    [#gift_chose_data{id = 39082, bid = 16008, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39082, bid = 16033, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39082, bid = 16035, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39082, bid = 16001, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39082, bid = 16002, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39082, bid = 16005, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39082, bid = 16006, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39082, bid = 16018, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 39082, bid = 16021, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 39082, bid = 16024, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 39082, bid = 16025, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 39082, bid = 16027, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 39082, bid = 16028, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 39082, bid = 16031, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 14},
     #gift_chose_data{id = 39082, bid = 16032, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 15},
     #gift_chose_data{id = 39082, bid = 16034, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 16},
     #gift_chose_data{id = 39082, bid = 16036, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 17},
     #gift_chose_data{id = 39082, bid = 16037, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 18},
     #gift_chose_data{id = 39082, bid = 16038, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 19},
     #gift_chose_data{id = 39082, bid = 16041, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 20},
     #gift_chose_data{id = 39082, bid = 16042, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 21},
     #gift_chose_data{id = 39082, bid = 16043, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 22},
     #gift_chose_data{id = 39082, bid = 16044, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 23},
     #gift_chose_data{id = 39082, bid = 16047, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 24}];
chose_list(39159) ->
    [#gift_chose_data{id = 39159, bid = 2050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39159, bid = 2050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39159, bid = 2050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39159, bid = 2050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39159, bid = 3050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39159, bid = 3050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39159, bid = 3050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39159, bid = 3050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 39159, bid = 13050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 39159, bid = 13050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 39159, bid = 13050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 39159, bid = 13050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12}];
chose_list(39158) ->
    [#gift_chose_data{id = 39158, bid = 17210, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39158, bid = 17211, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2}];
chose_list(39157) ->
    [#gift_chose_data{id = 39157, bid = 29105, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39157, bid = 29205, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39157, bid = 29305, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39157, bid = 29405, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39157, bid = 29505, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(39156) ->
    [#gift_chose_data{id = 39156, bid = 14050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39156, bid = 14050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39156, bid = 14050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39156, bid = 14050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39155) ->
    [#gift_chose_data{id = 39155, bid = 13050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39155, bid = 13050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39155, bid = 13050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39155, bid = 13050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39154) ->
    [#gift_chose_data{id = 39154, bid = 12050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39154, bid = 12050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39154, bid = 12050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39154, bid = 12050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39153) ->
    [#gift_chose_data{id = 39153, bid = 11050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39153, bid = 11050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39153, bid = 11050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39153, bid = 11050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39152) ->
    [#gift_chose_data{id = 39152, bid = 10050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39152, bid = 10050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39152, bid = 10050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39152, bid = 10050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39151) ->
    [#gift_chose_data{id = 39151, bid = 9050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39151, bid = 9050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39151, bid = 9050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39151, bid = 9050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39150) ->
    [#gift_chose_data{id = 39150, bid = 8050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39150, bid = 8050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39150, bid = 8050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39150, bid = 8050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39149) ->
    [#gift_chose_data{id = 39149, bid = 7050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39149, bid = 7050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39149, bid = 7050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39149, bid = 7050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39148) ->
    [#gift_chose_data{id = 39148, bid = 6050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39148, bid = 6050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39148, bid = 6050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39148, bid = 6050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39147) ->
    [#gift_chose_data{id = 39147, bid = 5050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39147, bid = 5050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39147, bid = 5050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39147, bid = 5050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39146) ->
    [#gift_chose_data{id = 39146, bid = 4050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39146, bid = 4050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39146, bid = 4050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39146, bid = 4050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39145) ->
    [#gift_chose_data{id = 39145, bid = 3050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39145, bid = 3050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39145, bid = 3050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39145, bid = 3050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39144) ->
    [#gift_chose_data{id = 39144, bid = 2050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39144, bid = 2050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39144, bid = 2050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39144, bid = 2050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39143) ->
    [#gift_chose_data{id = 39143, bid = 1050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39143, bid = 1050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39143, bid = 1050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39143, bid = 1050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39142) ->
    [#gift_chose_data{id = 39142, bid = 14040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39142, bid = 14040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39142, bid = 14040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39142, bid = 14040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39141) ->
    [#gift_chose_data{id = 39141, bid = 13040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39141, bid = 13040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39141, bid = 13040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39141, bid = 13040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39140) ->
    [#gift_chose_data{id = 39140, bid = 12040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39140, bid = 12040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39140, bid = 12040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39140, bid = 12040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39139) ->
    [#gift_chose_data{id = 39139, bid = 11040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39139, bid = 11040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39139, bid = 11040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39139, bid = 11040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39138) ->
    [#gift_chose_data{id = 39138, bid = 10040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39138, bid = 10040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39138, bid = 10040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39138, bid = 10040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39137) ->
    [#gift_chose_data{id = 39137, bid = 9040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39137, bid = 9040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39137, bid = 9040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39137, bid = 9040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39136) ->
    [#gift_chose_data{id = 39136, bid = 8040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39136, bid = 8040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39136, bid = 8040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39136, bid = 8040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39135) ->
    [#gift_chose_data{id = 39135, bid = 7040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39135, bid = 7040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39135, bid = 7040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39135, bid = 7040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39134) ->
    [#gift_chose_data{id = 39134, bid = 6040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39134, bid = 6040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39134, bid = 6040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39134, bid = 6040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39133) ->
    [#gift_chose_data{id = 39133, bid = 5040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39133, bid = 5040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39133, bid = 5040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39133, bid = 5040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39132) ->
    [#gift_chose_data{id = 39132, bid = 4040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39132, bid = 4040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39132, bid = 4040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39132, bid = 4040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39131) ->
    [#gift_chose_data{id = 39131, bid = 3040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39131, bid = 3040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39131, bid = 3040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39131, bid = 3040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39130) ->
    [#gift_chose_data{id = 39130, bid = 2040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39130, bid = 2040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39130, bid = 2040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39130, bid = 2040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39129) ->
    [#gift_chose_data{id = 39129, bid = 1040201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39129, bid = 1040202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39129, bid = 1040203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39129, bid = 1040204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39128) ->
    [#gift_chose_data{id = 39128, bid = 14030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39128, bid = 14030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39128, bid = 14030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39128, bid = 14030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39127) ->
    [#gift_chose_data{id = 39127, bid = 13030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39127, bid = 13030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39127, bid = 13030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39127, bid = 13030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39126) ->
    [#gift_chose_data{id = 39126, bid = 12030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39126, bid = 12030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39126, bid = 12030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39126, bid = 12030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39125) ->
    [#gift_chose_data{id = 39125, bid = 11030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39125, bid = 11030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39125, bid = 11030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39125, bid = 11030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39124) ->
    [#gift_chose_data{id = 39124, bid = 10030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39124, bid = 10030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39124, bid = 10030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39124, bid = 10030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39123) ->
    [#gift_chose_data{id = 39123, bid = 9030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39123, bid = 9030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39123, bid = 9030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39123, bid = 9030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39122) ->
    [#gift_chose_data{id = 39122, bid = 8030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39122, bid = 8030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39122, bid = 8030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39122, bid = 8030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39121) ->
    [#gift_chose_data{id = 39121, bid = 7030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39121, bid = 7030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39121, bid = 7030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39121, bid = 7030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39120) ->
    [#gift_chose_data{id = 39120, bid = 6030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39120, bid = 6030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39120, bid = 6030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39120, bid = 6030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39119) ->
    [#gift_chose_data{id = 39119, bid = 5030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39119, bid = 5030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39119, bid = 5030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39119, bid = 5030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39118) ->
    [#gift_chose_data{id = 39118, bid = 4030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39118, bid = 4030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39118, bid = 4030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39118, bid = 4030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39117) ->
    [#gift_chose_data{id = 39117, bid = 3030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39117, bid = 3030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39117, bid = 3030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39117, bid = 3030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39116) ->
    [#gift_chose_data{id = 39116, bid = 2030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39116, bid = 2030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39116, bid = 2030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39116, bid = 2030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39115) ->
    [#gift_chose_data{id = 39115, bid = 1030201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39115, bid = 1030202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39115, bid = 1030203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39115, bid = 1030204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39114) ->
    [#gift_chose_data{id = 39114, bid = 14020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39114, bid = 14020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39114, bid = 14020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39114, bid = 14020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39113) ->
    [#gift_chose_data{id = 39113, bid = 13020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39113, bid = 13020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39113, bid = 13020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39113, bid = 13020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39112) ->
    [#gift_chose_data{id = 39112, bid = 12020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39112, bid = 12020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39112, bid = 12020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39112, bid = 12020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39111) ->
    [#gift_chose_data{id = 39111, bid = 11020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39111, bid = 11020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39111, bid = 11020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39111, bid = 11020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39110) ->
    [#gift_chose_data{id = 39110, bid = 10020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39110, bid = 10020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39110, bid = 10020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39110, bid = 10020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39109) ->
    [#gift_chose_data{id = 39109, bid = 9020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39109, bid = 9020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39109, bid = 9020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39109, bid = 9020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39108) ->
    [#gift_chose_data{id = 39108, bid = 8020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39108, bid = 8020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39108, bid = 8020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39108, bid = 8020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39107) ->
    [#gift_chose_data{id = 39107, bid = 7020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39107, bid = 7020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39107, bid = 7020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39107, bid = 7020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39106) ->
    [#gift_chose_data{id = 39106, bid = 6020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39106, bid = 6020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39106, bid = 6020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39106, bid = 6020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39105) ->
    [#gift_chose_data{id = 39105, bid = 5020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39105, bid = 5020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39105, bid = 5020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39105, bid = 5020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39104) ->
    [#gift_chose_data{id = 39104, bid = 4020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39104, bid = 4020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39104, bid = 4020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39104, bid = 4020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39103) ->
    [#gift_chose_data{id = 39103, bid = 3020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39103, bid = 3020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39103, bid = 3020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39103, bid = 3020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39102) ->
    [#gift_chose_data{id = 39102, bid = 2020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39102, bid = 2020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39102, bid = 2020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39102, bid = 2020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39101) ->
    [#gift_chose_data{id = 39101, bid = 1020201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39101, bid = 1020202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39101, bid = 1020203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39101, bid = 1020204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39100) ->
    [#gift_chose_data{id = 39100, bid = 40111, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39100, bid = 40211, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39100, bid = 40311, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39100, bid = 40411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39099) ->
    [#gift_chose_data{id = 39099, bid = 40112, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39099, bid = 40212, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39099, bid = 40312, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39099, bid = 40412, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39098) ->
    [#gift_chose_data{id = 39098, bid = 40113, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39098, bid = 40213, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39098, bid = 40313, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39098, bid = 40413, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39097) ->
    [#gift_chose_data{id = 39097, bid = 40114, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39097, bid = 40214, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39097, bid = 40314, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39097, bid = 40414, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39096) ->
    [#gift_chose_data{id = 39096, bid = 40115, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39096, bid = 40215, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39096, bid = 40315, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39096, bid = 40415, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39095) ->
    [#gift_chose_data{id = 39095, bid = 40116, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39095, bid = 40216, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39095, bid = 40316, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39095, bid = 40416, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39164) ->
    [#gift_chose_data{id = 39164, bid = 29105, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39164, bid = 29205, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39164, bid = 29305, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3}];
chose_list(39165) ->
    [#gift_chose_data{id = 39165, bid = 25411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39165, bid = 28409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39165, bid = 27408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39165, bid = 26411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39165, bid = 24401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(39162) ->
    [#gift_chose_data{id = 39162, bid = 28407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39162, bid = 24409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39162, bid = 25406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39162, bid = 26407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39162, bid = 27409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39162, bid = 28402, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3}];
chose_list(39161) ->
    [#gift_chose_data{id = 39161, bid = 24411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39161, bid = 25407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39161, bid = 26406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39161, bid = 27407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39161, bid = 28403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(39027) ->
    [#gift_chose_data{id = 39027, bid = 27405, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39027, bid = 28408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39027, bid = 24410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39027, bid = 25409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39027, bid = 26408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(39094) ->
    [#gift_chose_data{id = 39094, bid = 26411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39094, bid = 27406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39094, bid = 28409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39094, bid = 24404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39094, bid = 25408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(39081) ->
    [#gift_chose_data{id = 39081, bid = 32, num = 300000,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39081, bid = 10001, num = 6000,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 0, sort_id = 2},
     #gift_chose_data{id = 39081, bid = 10450, num = 3000,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39081, bid = 17009, num = 200,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39081, bid = 17011, num = 20,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 0, sort_id = 5},
     #gift_chose_data{id = 39081, bid = 39082, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39081, bid = 72001, num = 7,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39081, bid = 72002, num = 15,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 39081, bid = 17001, num = 200,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 39081, bid = 17002, num = 200,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 39081, bid = 17003, num = 200,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 39081, bid = 17004, num = 200,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 39081, bid = 17005, num = 200,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13}];
chose_list(39079) ->
    [#gift_chose_data{id = 39079, bid = 39999, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39079, bid = 39998, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39079, bid = 32, num = 300000,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39079, bid = 10001, num = 6000,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39078) ->
    [#gift_chose_data{id = 39078, bid = 23001, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39078, bid = 23004, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39078, bid = 23013, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39078, bid = 23016, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39078, bid = 23019, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39078, bid = 23031, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39078, bid = 23007, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39078, bid = 23034, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 39078, bid = 23028, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 39078, bid = 23010, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 39078, bid = 24001, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 39078, bid = 24050, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 39078, bid = 24060, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 39078, bid = 24070, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 14}];
chose_list(39067) ->
    [#gift_chose_data{id = 39067, bid = 113001, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39067, bid = 113002, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39067, bid = 113003, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39067, bid = 113005, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39067, bid = 113006, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(39056) ->
    [#gift_chose_data{id = 39056, bid = 113001, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39056, bid = 113002, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39056, bid = 113003, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39056, bid = 113004, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39056, bid = 113005, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39056, bid = 113006, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39056, bid = 113007, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39056, bid = 113008, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8}];
chose_list(39058) ->
    [#gift_chose_data{id = 39058, bid = 9050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39058, bid = 9050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39058, bid = 9050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39058, bid = 9050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39058, bid = 10050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39058, bid = 10050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39058, bid = 10050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39058, bid = 10050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 39058, bid = 11050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 39058, bid = 11050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 39058, bid = 11050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 39058, bid = 11050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 39058, bid = 12050201, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 39058, bid = 12050202, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 14},
     #gift_chose_data{id = 39058, bid = 12050203, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 15},
     #gift_chose_data{id = 39058, bid = 12050204, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 16}];
chose_list(16202) ->
    [#gift_chose_data{id = 16202, bid = 16101, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 16202, bid = 16102, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 16202, bid = 16103, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 16202, bid = 16104, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 16202, bid = 16105, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 16202, bid = 16106, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 16202, bid = 16107, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 16202, bid = 16108, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8}];
chose_list(39090) ->
    [#gift_chose_data{id = 39090, bid = 28407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39090, bid = 27408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39090, bid = 26410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39090, bid = 24401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39090, bid = 25410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(39060) ->
    [#gift_chose_data{id = 39060, bid = 25409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39060, bid = 27408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39060, bid = 28408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3}];
chose_list(39040) ->
    [#gift_chose_data{id = 39040, bid = 24401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39040, bid = 24404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39040, bid = 24409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39040, bid = 25406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39040, bid = 25407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39040, bid = 25408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39040, bid = 25409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39040, bid = 26406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 39040, bid = 26407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 39040, bid = 26408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10}];
chose_list(59040) ->
    [#gift_chose_data{id = 59040, bid = 28920, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 59040, bid = 28919, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 59040, bid = 28918, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 59040, bid = 28917, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 59040, bid = 27920, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 59040, bid = 27919, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 59040, bid = 27918, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 59040, bid = 27917, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 59040, bid = 26917, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 59040, bid = 26915, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 59040, bid = 25917, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 59040, bid = 25916, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 59040, bid = 24917, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13}];
chose_list(59041) ->
    [#gift_chose_data{id = 59041, bid = 28923, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 59041, bid = 28922, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 59041, bid = 28921, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 59041, bid = 27923, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 59041, bid = 27922, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 59041, bid = 27921, num = 50,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6}];
chose_list(89903) ->
    [#gift_chose_data{id = 89903, bid = 23020, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 89903, bid = 23017, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 89903, bid = 23014, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 89903, bid = 23011, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 89903, bid = 23008, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 89903, bid = 23005, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 89903, bid = 23002, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 89903, bid = 24002, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 89903, bid = 23029, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 89903, bid = 23035, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 89903, bid = 23032, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 89903, bid = 24061, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 89903, bid = 24051, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 89903, bid = 24071, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 14},
     #gift_chose_data{id = 89903, bid = 23151, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 15},
     #gift_chose_data{id = 89903, bid = 23141, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 16},
     #gift_chose_data{id = 89903, bid = 23121, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 17},
     #gift_chose_data{id = 89903, bid = 23101, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 18},
     #gift_chose_data{id = 89903, bid = 24091, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 19},
     #gift_chose_data{id = 89903, bid = 24081, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 20},
     #gift_chose_data{id = 89903, bid = 23171, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 21},
     #gift_chose_data{id = 89903, bid = 23161, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 22}];
chose_list(89904) ->
    [#gift_chose_data{id = 89904, bid = 23170, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 89904, bid = 23160, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 89904, bid = 24080, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 89904, bid = 24090, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 89904, bid = 23100, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 89904, bid = 23110, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 89904, bid = 23120, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 89904, bid = 23140, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 89904, bid = 23150, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 89904, bid = 24070, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 89904, bid = 24050, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 89904, bid = 24060, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 89904, bid = 23031, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 89904, bid = 23007, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 14},
     #gift_chose_data{id = 89904, bid = 23034, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 15},
     #gift_chose_data{id = 89904, bid = 23028, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 16},
     #gift_chose_data{id = 89904, bid = 24001, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 17},
     #gift_chose_data{id = 89904, bid = 23001, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 18},
     #gift_chose_data{id = 89904, bid = 23004, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 19},
     #gift_chose_data{id = 89904, bid = 23007, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 20},
     #gift_chose_data{id = 89904, bid = 23010, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 21},
     #gift_chose_data{id = 89904, bid = 23013, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 22},
     #gift_chose_data{id = 89904, bid = 23016, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 23},
     #gift_chose_data{id = 89904, bid = 23019, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 24}];
chose_list(39039) ->
    [#gift_chose_data{id = 39039, bid = 24402, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39039, bid = 24403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39039, bid = 24406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39039, bid = 24400, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 39039, bid = 24404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 39039, bid = 24409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 39039, bid = 24410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 39039, bid = 24401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 39039, bid = 24411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 39039, bid = 24413, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 39039, bid = 24414, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 39039, bid = 24415, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 39039, bid = 25400, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 39039, bid = 25401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 14},
     #gift_chose_data{id = 39039, bid = 25404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 15},
     #gift_chose_data{id = 39039, bid = 25406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 16},
     #gift_chose_data{id = 39039, bid = 25403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 17},
     #gift_chose_data{id = 39039, bid = 25408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 18},
     #gift_chose_data{id = 39039, bid = 25410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 19},
     #gift_chose_data{id = 39039, bid = 25411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 20},
     #gift_chose_data{id = 39039, bid = 25407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 21},
     #gift_chose_data{id = 39039, bid = 25409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 22},
     #gift_chose_data{id = 39039, bid = 25412, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 23},
     #gift_chose_data{id = 39039, bid = 25413, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 24},
     #gift_chose_data{id = 39039, bid = 25414, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 25},
     #gift_chose_data{id = 39039, bid = 26400, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 26},
     #gift_chose_data{id = 39039, bid = 26403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 27},
     #gift_chose_data{id = 39039, bid = 26405, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 28},
     #gift_chose_data{id = 39039, bid = 26401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 29},
     #gift_chose_data{id = 39039, bid = 26406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 30},
     #gift_chose_data{id = 39039, bid = 26407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 31},
     #gift_chose_data{id = 39039, bid = 26408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 32},
     #gift_chose_data{id = 39039, bid = 26409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 33},
     #gift_chose_data{id = 39039, bid = 26410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 34},
     #gift_chose_data{id = 39039, bid = 26411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 35},
     #gift_chose_data{id = 39039, bid = 26412, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 36},
     #gift_chose_data{id = 39039, bid = 26413, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 37},
     #gift_chose_data{id = 39039, bid = 27401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 38},
     #gift_chose_data{id = 39039, bid = 27402, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 39},
     #gift_chose_data{id = 39039, bid = 27403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 40},
     #gift_chose_data{id = 39039, bid = 27405, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 41},
     #gift_chose_data{id = 39039, bid = 27406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 42},
     #gift_chose_data{id = 39039, bid = 27407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 43},
     #gift_chose_data{id = 39039, bid = 27408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 44},
     #gift_chose_data{id = 39039, bid = 27409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 45},
     #gift_chose_data{id = 39039, bid = 27410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 46},
     #gift_chose_data{id = 39039, bid = 27411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 47},
     #gift_chose_data{id = 39039, bid = 27412, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 48},
     #gift_chose_data{id = 39039, bid = 27413, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 49},
     #gift_chose_data{id = 39039, bid = 27414, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 50},
     #gift_chose_data{id = 39039, bid = 27421, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 51},
     #gift_chose_data{id = 39039, bid = 27422, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 52},
     #gift_chose_data{id = 39039, bid = 28401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 53},
     #gift_chose_data{id = 39039, bid = 28402, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 54},
     #gift_chose_data{id = 39039, bid = 28403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 55},
     #gift_chose_data{id = 39039, bid = 28404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 56},
     #gift_chose_data{id = 39039, bid = 28406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 57},
     #gift_chose_data{id = 39039, bid = 28407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 58},
     #gift_chose_data{id = 39039, bid = 28408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 59},
     #gift_chose_data{id = 39039, bid = 28409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 60},
     #gift_chose_data{id = 39039, bid = 28410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 61},
     #gift_chose_data{id = 39039, bid = 28411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 62},
     #gift_chose_data{id = 39039, bid = 28412, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 63},
     #gift_chose_data{id = 39039, bid = 28414, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 64},
     #gift_chose_data{id = 39039, bid = 28415, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 65},
     #gift_chose_data{id = 39039, bid = 28416, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 66},
     #gift_chose_data{id = 39039, bid = 24412, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 67}];
chose_list(39517) ->
    [#gift_chose_data{id = 39517, bid = 39518, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39517, bid = 39519, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2}];
chose_list(39513) ->
    [#gift_chose_data{id = 39513, bid = 39514, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39513, bid = 39515, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39513, bid = 39516, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(39509) ->
    [#gift_chose_data{id = 39509, bid = 39510, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39509, bid = 39511, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39509, bid = 39512, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(39505) ->
    [#gift_chose_data{id = 39505, bid = 39506, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39505, bid = 39507, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39505, bid = 39508, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(39501) ->
    [#gift_chose_data{id = 39501, bid = 39502, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39501, bid = 39503, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39501, bid = 39504, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(39497) ->
    [#gift_chose_data{id = 39497, bid = 39498, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39497, bid = 39499, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39497, bid = 39500, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(39493) ->
    [#gift_chose_data{id = 39493, bid = 39494, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39493, bid = 39495, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39493, bid = 39496, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(60211) ->
    [#gift_chose_data{id = 60211, bid = 90506, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 60211, bid = 90507, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60211, bid = 90508, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 60211, bid = 90509, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 60211, bid = 90510, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(90515) ->
    [#gift_chose_data{id = 90515, bid = 91000, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(90514) ->
    [#gift_chose_data{id = 90514, bid = 90900, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(60210) ->
    [#gift_chose_data{id = 60210, bid = 90501, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 60210, bid = 90502, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60210, bid = 90503, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 60210, bid = 90504, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 60210, bid = 90505, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(60209) ->
    [#gift_chose_data{id = 60209, bid = 27408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 60209, bid = 27409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60209, bid = 28406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 60209, bid = 28402, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(60208) ->
    [#gift_chose_data{id = 60208, bid = 27401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 60208, bid = 27403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60208, bid = 28401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 60208, bid = 28403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(60207) ->
    [#gift_chose_data{id = 60207, bid = 25408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 60207, bid = 24410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60207, bid = 26408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 60207, bid = 27405, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 60207, bid = 28403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(60206) ->
    [#gift_chose_data{id = 60206, bid = 25404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 60206, bid = 25408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 60206, bid = 26407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 60206, bid = 26408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 60206, bid = 24411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 60206, bid = 24409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 60206, bid = 28405, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60206, bid = 27400, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(60205) ->
    [#gift_chose_data{id = 60205, bid = 25411, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 60205, bid = 25406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60205, bid = 26406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 60205, bid = 26402, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 60205, bid = 24410, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 60205, bid = 24400, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6}];
chose_list(60204) ->
    [#gift_chose_data{id = 60204, bid = 24402, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60204, bid = 24405, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 60204, bid = 24406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 60204, bid = 24407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 60204, bid = 24408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 60204, bid = 25400, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7},
     #gift_chose_data{id = 60204, bid = 25401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 8},
     #gift_chose_data{id = 60204, bid = 25402, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 9},
     #gift_chose_data{id = 60204, bid = 25404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 10},
     #gift_chose_data{id = 60204, bid = 25405, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 11},
     #gift_chose_data{id = 60204, bid = 26400, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 12},
     #gift_chose_data{id = 60204, bid = 26402, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 13},
     #gift_chose_data{id = 60204, bid = 26403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 14},
     #gift_chose_data{id = 60204, bid = 26404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 15},
     #gift_chose_data{id = 60204, bid = 26405, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 16}];
chose_list(60203) ->
    [#gift_chose_data{id = 60203, bid = 24401, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 60203, bid = 24404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60203, bid = 24409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1}];
chose_list(60202) ->
    [#gift_chose_data{id = 60202, bid = 24409, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 60202, bid = 25408, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60202, bid = 26407, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3}];
chose_list(60201) ->
    [#gift_chose_data{id = 60201, bid = 24400, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 60201, bid = 25406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 60201, bid = 26406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3}];
chose_list(17009) ->
    [#gift_chose_data{id = 17009, bid = 17001, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 17009, bid = 17002, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 17009, bid = 17003, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 17009, bid = 17004, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 17009, bid = 17005, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5}];
chose_list(39009) ->
    [#gift_chose_data{id = 39009, bid = 10450, num = 4000,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39009, bid = 72001, num = 265,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39009, bid = 10001, num = 4000,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39009, bid = 14002, num = 400,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(39008) ->
    [#gift_chose_data{id = 39008, bid = 10450, num = 2000,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 39008, bid = 72001, num = 130,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 39008, bid = 10001, num = 2000,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 39008, bid = 14002, num = 200,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(10402) ->
    [#gift_chose_data{id = 10402, bid = 10403, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 10402, bid = 10404, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 10402, bid = 10405, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 10402, bid = 10406, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(35001) ->
    [#gift_chose_data{id = 35001, bid = 20027, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 35001, bid = 20030, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2}];
chose_list(30401) ->
    [#gift_chose_data{id = 30401, bid = 10110, num = 5,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 30401, bid = 10111, num = 5,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 30401, bid = 10112, num = 5,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 30401, bid = 10113, num = 5,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4},
     #gift_chose_data{id = 30401, bid = 10114, num = 5,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 5},
     #gift_chose_data{id = 30401, bid = 10115, num = 5,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 6},
     #gift_chose_data{id = 30401, bid = 10116, num = 5,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 7}];
chose_list(30019) ->
    [#gift_chose_data{id = 30019, bid = 30020, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 30019, bid = 30021, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 30019, bid = 30022, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 30019, bid = 30023, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(30015) ->
    [#gift_chose_data{id = 30015, bid = 30016, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 30015, bid = 30017, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 30015, bid = 30018, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3}];
chose_list(30010) ->
    [#gift_chose_data{id = 30010, bid = 30011, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 1},
     #gift_chose_data{id = 30010, bid = 30012, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 2},
     #gift_chose_data{id = 30010, bid = 30013, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 3},
     #gift_chose_data{id = 30010, bid = 30014, num = 1,
		      bind = 1, career = 0, sex = 2, min_lev = 1,
		      max_lev = 999, auto_open = 1, sort_id = 4}];
chose_list(_) -> [].

sort_id_list({39523, 14}) -> [89140501];
sort_id_list({39523, 13}) -> [89130501];
sort_id_list({39523, 12}) -> [89120501];
sort_id_list({39523, 11}) -> [89110501];
sort_id_list({39523, 10}) -> [89100501];
sort_id_list({39523, 9}) -> [89090501];
sort_id_list({39523, 8}) -> [89080501];
sort_id_list({39523, 7}) -> [89070501];
sort_id_list({39523, 6}) -> [89060501];
sort_id_list({39523, 5}) -> [89050501];
sort_id_list({39523, 4}) -> [89040501];
sort_id_list({39523, 3}) -> [89030501];
sort_id_list({39523, 2}) -> [89020501];
sort_id_list({39523, 1}) -> [89010501];
sort_id_list({39522, 14}) -> [89140301];
sort_id_list({39522, 13}) -> [89130301];
sort_id_list({39522, 12}) -> [89120301];
sort_id_list({39522, 11}) -> [89110301];
sort_id_list({39522, 10}) -> [89100301];
sort_id_list({39522, 9}) -> [89090301];
sort_id_list({39522, 8}) -> [89080301];
sort_id_list({39522, 7}) -> [89070301];
sort_id_list({39522, 6}) -> [89060301];
sort_id_list({39522, 5}) -> [89050301];
sort_id_list({39522, 4}) -> [89040301];
sort_id_list({39522, 3}) -> [89030301];
sort_id_list({39522, 2}) -> [89020301];
sort_id_list({39522, 1}) -> [89010301];
sort_id_list({39082, 24}) -> [16047];
sort_id_list({39082, 23}) -> [16044];
sort_id_list({39082, 22}) -> [16043];
sort_id_list({39082, 21}) -> [16042];
sort_id_list({39082, 20}) -> [16041];
sort_id_list({39082, 19}) -> [16038];
sort_id_list({39082, 18}) -> [16037];
sort_id_list({39082, 17}) -> [16036];
sort_id_list({39082, 16}) -> [16034];
sort_id_list({39082, 15}) -> [16032];
sort_id_list({39082, 14}) -> [16031];
sort_id_list({39082, 13}) -> [16028];
sort_id_list({39082, 12}) -> [16027];
sort_id_list({39082, 11}) -> [16025];
sort_id_list({39082, 10}) -> [16024];
sort_id_list({39082, 9}) -> [16021];
sort_id_list({39082, 8}) -> [16018];
sort_id_list({39082, 7}) -> [16006];
sort_id_list({39082, 6}) -> [16005];
sort_id_list({39082, 5}) -> [16002];
sort_id_list({39082, 4}) -> [16001];
sort_id_list({39082, 3}) -> [16035];
sort_id_list({39082, 2}) -> [16033];
sort_id_list({39082, 1}) -> [16008];
sort_id_list({39159, 12}) -> [13050204];
sort_id_list({39159, 11}) -> [13050203];
sort_id_list({39159, 10}) -> [13050202];
sort_id_list({39159, 9}) -> [13050201];
sort_id_list({39159, 8}) -> [3050204];
sort_id_list({39159, 7}) -> [3050203];
sort_id_list({39159, 6}) -> [3050202];
sort_id_list({39159, 5}) -> [3050201];
sort_id_list({39159, 4}) -> [2050204];
sort_id_list({39159, 3}) -> [2050203];
sort_id_list({39159, 2}) -> [2050202];
sort_id_list({39159, 1}) -> [2050201];
sort_id_list({39158, 2}) -> [17211];
sort_id_list({39158, 1}) -> [17210];
sort_id_list({39157, 5}) -> [29505];
sort_id_list({39157, 4}) -> [29405];
sort_id_list({39157, 3}) -> [29305];
sort_id_list({39157, 2}) -> [29205];
sort_id_list({39157, 1}) -> [29105];
sort_id_list({39156, 4}) -> [14050204];
sort_id_list({39156, 3}) -> [14050203];
sort_id_list({39156, 2}) -> [14050202];
sort_id_list({39156, 1}) -> [14050201];
sort_id_list({39155, 4}) -> [13050204];
sort_id_list({39155, 3}) -> [13050203];
sort_id_list({39155, 2}) -> [13050202];
sort_id_list({39155, 1}) -> [13050201];
sort_id_list({39154, 4}) -> [12050204];
sort_id_list({39154, 3}) -> [12050203];
sort_id_list({39154, 2}) -> [12050202];
sort_id_list({39154, 1}) -> [12050201];
sort_id_list({39153, 4}) -> [11050204];
sort_id_list({39153, 3}) -> [11050203];
sort_id_list({39153, 2}) -> [11050202];
sort_id_list({39153, 1}) -> [11050201];
sort_id_list({39152, 4}) -> [10050204];
sort_id_list({39152, 3}) -> [10050203];
sort_id_list({39152, 2}) -> [10050202];
sort_id_list({39152, 1}) -> [10050201];
sort_id_list({39151, 4}) -> [9050204];
sort_id_list({39151, 3}) -> [9050203];
sort_id_list({39151, 2}) -> [9050202];
sort_id_list({39151, 1}) -> [9050201];
sort_id_list({39150, 4}) -> [8050204];
sort_id_list({39150, 3}) -> [8050203];
sort_id_list({39150, 2}) -> [8050202];
sort_id_list({39150, 1}) -> [8050201];
sort_id_list({39149, 4}) -> [7050204];
sort_id_list({39149, 3}) -> [7050203];
sort_id_list({39149, 2}) -> [7050202];
sort_id_list({39149, 1}) -> [7050201];
sort_id_list({39148, 4}) -> [6050204];
sort_id_list({39148, 3}) -> [6050203];
sort_id_list({39148, 2}) -> [6050202];
sort_id_list({39148, 1}) -> [6050201];
sort_id_list({39147, 4}) -> [5050204];
sort_id_list({39147, 3}) -> [5050203];
sort_id_list({39147, 2}) -> [5050202];
sort_id_list({39147, 1}) -> [5050201];
sort_id_list({39146, 4}) -> [4050204];
sort_id_list({39146, 3}) -> [4050203];
sort_id_list({39146, 2}) -> [4050202];
sort_id_list({39146, 1}) -> [4050201];
sort_id_list({39145, 4}) -> [3050204];
sort_id_list({39145, 3}) -> [3050203];
sort_id_list({39145, 2}) -> [3050202];
sort_id_list({39145, 1}) -> [3050201];
sort_id_list({39144, 4}) -> [2050204];
sort_id_list({39144, 3}) -> [2050203];
sort_id_list({39144, 2}) -> [2050202];
sort_id_list({39144, 1}) -> [2050201];
sort_id_list({39143, 4}) -> [1050204];
sort_id_list({39143, 3}) -> [1050203];
sort_id_list({39143, 2}) -> [1050202];
sort_id_list({39143, 1}) -> [1050201];
sort_id_list({39142, 4}) -> [14040204];
sort_id_list({39142, 3}) -> [14040203];
sort_id_list({39142, 2}) -> [14040202];
sort_id_list({39142, 1}) -> [14040201];
sort_id_list({39141, 4}) -> [13040204];
sort_id_list({39141, 3}) -> [13040203];
sort_id_list({39141, 2}) -> [13040202];
sort_id_list({39141, 1}) -> [13040201];
sort_id_list({39140, 4}) -> [12040204];
sort_id_list({39140, 3}) -> [12040203];
sort_id_list({39140, 2}) -> [12040202];
sort_id_list({39140, 1}) -> [12040201];
sort_id_list({39139, 4}) -> [11040204];
sort_id_list({39139, 3}) -> [11040203];
sort_id_list({39139, 2}) -> [11040202];
sort_id_list({39139, 1}) -> [11040201];
sort_id_list({39138, 4}) -> [10040204];
sort_id_list({39138, 3}) -> [10040203];
sort_id_list({39138, 2}) -> [10040202];
sort_id_list({39138, 1}) -> [10040201];
sort_id_list({39137, 4}) -> [9040204];
sort_id_list({39137, 3}) -> [9040203];
sort_id_list({39137, 2}) -> [9040202];
sort_id_list({39137, 1}) -> [9040201];
sort_id_list({39136, 4}) -> [8040204];
sort_id_list({39136, 3}) -> [8040203];
sort_id_list({39136, 2}) -> [8040202];
sort_id_list({39136, 1}) -> [8040201];
sort_id_list({39135, 4}) -> [7040204];
sort_id_list({39135, 3}) -> [7040203];
sort_id_list({39135, 2}) -> [7040202];
sort_id_list({39135, 1}) -> [7040201];
sort_id_list({39134, 4}) -> [6040204];
sort_id_list({39134, 3}) -> [6040203];
sort_id_list({39134, 2}) -> [6040202];
sort_id_list({39134, 1}) -> [6040201];
sort_id_list({39133, 4}) -> [5040204];
sort_id_list({39133, 3}) -> [5040203];
sort_id_list({39133, 2}) -> [5040202];
sort_id_list({39133, 1}) -> [5040201];
sort_id_list({39132, 4}) -> [4040204];
sort_id_list({39132, 3}) -> [4040203];
sort_id_list({39132, 2}) -> [4040202];
sort_id_list({39132, 1}) -> [4040201];
sort_id_list({39131, 4}) -> [3040204];
sort_id_list({39131, 3}) -> [3040203];
sort_id_list({39131, 2}) -> [3040202];
sort_id_list({39131, 1}) -> [3040201];
sort_id_list({39130, 4}) -> [2040204];
sort_id_list({39130, 3}) -> [2040203];
sort_id_list({39130, 2}) -> [2040202];
sort_id_list({39130, 1}) -> [2040201];
sort_id_list({39129, 4}) -> [1040204];
sort_id_list({39129, 3}) -> [1040203];
sort_id_list({39129, 2}) -> [1040202];
sort_id_list({39129, 1}) -> [1040201];
sort_id_list({39128, 4}) -> [14030204];
sort_id_list({39128, 3}) -> [14030203];
sort_id_list({39128, 2}) -> [14030202];
sort_id_list({39128, 1}) -> [14030201];
sort_id_list({39127, 4}) -> [13030204];
sort_id_list({39127, 3}) -> [13030203];
sort_id_list({39127, 2}) -> [13030202];
sort_id_list({39127, 1}) -> [13030201];
sort_id_list({39126, 4}) -> [12030204];
sort_id_list({39126, 3}) -> [12030203];
sort_id_list({39126, 2}) -> [12030202];
sort_id_list({39126, 1}) -> [12030201];
sort_id_list({39125, 4}) -> [11030204];
sort_id_list({39125, 3}) -> [11030203];
sort_id_list({39125, 2}) -> [11030202];
sort_id_list({39125, 1}) -> [11030201];
sort_id_list({39124, 4}) -> [10030204];
sort_id_list({39124, 3}) -> [10030203];
sort_id_list({39124, 2}) -> [10030202];
sort_id_list({39124, 1}) -> [10030201];
sort_id_list({39123, 4}) -> [9030204];
sort_id_list({39123, 3}) -> [9030203];
sort_id_list({39123, 2}) -> [9030202];
sort_id_list({39123, 1}) -> [9030201];
sort_id_list({39122, 4}) -> [8030204];
sort_id_list({39122, 3}) -> [8030203];
sort_id_list({39122, 2}) -> [8030202];
sort_id_list({39122, 1}) -> [8030201];
sort_id_list({39121, 4}) -> [7030204];
sort_id_list({39121, 3}) -> [7030203];
sort_id_list({39121, 2}) -> [7030202];
sort_id_list({39121, 1}) -> [7030201];
sort_id_list({39120, 4}) -> [6030204];
sort_id_list({39120, 3}) -> [6030203];
sort_id_list({39120, 2}) -> [6030202];
sort_id_list({39120, 1}) -> [6030201];
sort_id_list({39119, 4}) -> [5030204];
sort_id_list({39119, 3}) -> [5030203];
sort_id_list({39119, 2}) -> [5030202];
sort_id_list({39119, 1}) -> [5030201];
sort_id_list({39118, 4}) -> [4030204];
sort_id_list({39118, 3}) -> [4030203];
sort_id_list({39118, 2}) -> [4030202];
sort_id_list({39118, 1}) -> [4030201];
sort_id_list({39117, 4}) -> [3030204];
sort_id_list({39117, 3}) -> [3030203];
sort_id_list({39117, 2}) -> [3030202];
sort_id_list({39117, 1}) -> [3030201];
sort_id_list({39116, 4}) -> [2030204];
sort_id_list({39116, 3}) -> [2030203];
sort_id_list({39116, 2}) -> [2030202];
sort_id_list({39116, 1}) -> [2030201];
sort_id_list({39115, 4}) -> [1030204];
sort_id_list({39115, 3}) -> [1030203];
sort_id_list({39115, 2}) -> [1030202];
sort_id_list({39115, 1}) -> [1030201];
sort_id_list({39114, 4}) -> [14020204];
sort_id_list({39114, 3}) -> [14020203];
sort_id_list({39114, 2}) -> [14020202];
sort_id_list({39114, 1}) -> [14020201];
sort_id_list({39113, 4}) -> [13020204];
sort_id_list({39113, 3}) -> [13020203];
sort_id_list({39113, 2}) -> [13020202];
sort_id_list({39113, 1}) -> [13020201];
sort_id_list({39112, 4}) -> [12020204];
sort_id_list({39112, 3}) -> [12020203];
sort_id_list({39112, 2}) -> [12020202];
sort_id_list({39112, 1}) -> [12020201];
sort_id_list({39111, 4}) -> [11020204];
sort_id_list({39111, 3}) -> [11020203];
sort_id_list({39111, 2}) -> [11020202];
sort_id_list({39111, 1}) -> [11020201];
sort_id_list({39110, 4}) -> [10020204];
sort_id_list({39110, 3}) -> [10020203];
sort_id_list({39110, 2}) -> [10020202];
sort_id_list({39110, 1}) -> [10020201];
sort_id_list({39109, 4}) -> [9020204];
sort_id_list({39109, 3}) -> [9020203];
sort_id_list({39109, 2}) -> [9020202];
sort_id_list({39109, 1}) -> [9020201];
sort_id_list({39108, 4}) -> [8020204];
sort_id_list({39108, 3}) -> [8020203];
sort_id_list({39108, 2}) -> [8020202];
sort_id_list({39108, 1}) -> [8020201];
sort_id_list({39107, 4}) -> [7020204];
sort_id_list({39107, 3}) -> [7020203];
sort_id_list({39107, 2}) -> [7020202];
sort_id_list({39107, 1}) -> [7020201];
sort_id_list({39106, 4}) -> [6020204];
sort_id_list({39106, 3}) -> [6020203];
sort_id_list({39106, 2}) -> [6020202];
sort_id_list({39106, 1}) -> [6020201];
sort_id_list({39105, 4}) -> [5020204];
sort_id_list({39105, 3}) -> [5020203];
sort_id_list({39105, 2}) -> [5020202];
sort_id_list({39105, 1}) -> [5020201];
sort_id_list({39104, 4}) -> [4020204];
sort_id_list({39104, 3}) -> [4020203];
sort_id_list({39104, 2}) -> [4020202];
sort_id_list({39104, 1}) -> [4020201];
sort_id_list({39103, 4}) -> [3020204];
sort_id_list({39103, 3}) -> [3020203];
sort_id_list({39103, 2}) -> [3020202];
sort_id_list({39103, 1}) -> [3020201];
sort_id_list({39102, 4}) -> [2020204];
sort_id_list({39102, 3}) -> [2020203];
sort_id_list({39102, 2}) -> [2020202];
sort_id_list({39102, 1}) -> [2020201];
sort_id_list({39101, 4}) -> [1020204];
sort_id_list({39101, 3}) -> [1020203];
sort_id_list({39101, 2}) -> [1020202];
sort_id_list({39101, 1}) -> [1020201];
sort_id_list({39100, 4}) -> [40411];
sort_id_list({39100, 3}) -> [40311];
sort_id_list({39100, 2}) -> [40211];
sort_id_list({39100, 1}) -> [40111];
sort_id_list({39099, 4}) -> [40412];
sort_id_list({39099, 3}) -> [40312];
sort_id_list({39099, 2}) -> [40212];
sort_id_list({39099, 1}) -> [40112];
sort_id_list({39098, 4}) -> [40413];
sort_id_list({39098, 3}) -> [40313];
sort_id_list({39098, 2}) -> [40213];
sort_id_list({39098, 1}) -> [40113];
sort_id_list({39097, 4}) -> [40414];
sort_id_list({39097, 3}) -> [40314];
sort_id_list({39097, 2}) -> [40214];
sort_id_list({39097, 1}) -> [40114];
sort_id_list({39096, 4}) -> [40415];
sort_id_list({39096, 3}) -> [40315];
sort_id_list({39096, 2}) -> [40215];
sort_id_list({39096, 1}) -> [40115];
sort_id_list({39095, 4}) -> [40416];
sort_id_list({39095, 3}) -> [40316];
sort_id_list({39095, 2}) -> [40216];
sort_id_list({39095, 1}) -> [40116];
sort_id_list({39164, 3}) -> [29305];
sort_id_list({39164, 2}) -> [29205];
sort_id_list({39164, 1}) -> [29105];
sort_id_list({39165, 5}) -> [24401];
sort_id_list({39165, 4}) -> [26411];
sort_id_list({39165, 3}) -> [27408];
sort_id_list({39165, 2}) -> [28409];
sort_id_list({39165, 1}) -> [25411];
sort_id_list({39162, 3}) -> [28402];
sort_id_list({39162, 2}) -> [27409];
sort_id_list({39162, 6}) -> [26407];
sort_id_list({39162, 5}) -> [25406];
sort_id_list({39162, 4}) -> [24409];
sort_id_list({39162, 1}) -> [28407];
sort_id_list({39161, 5}) -> [28403];
sort_id_list({39161, 4}) -> [27407];
sort_id_list({39161, 3}) -> [26406];
sort_id_list({39161, 2}) -> [25407];
sort_id_list({39161, 1}) -> [24411];
sort_id_list({39027, 5}) -> [26408];
sort_id_list({39027, 4}) -> [25409];
sort_id_list({39027, 3}) -> [24410];
sort_id_list({39027, 2}) -> [28408];
sort_id_list({39027, 1}) -> [27405];
sort_id_list({39094, 5}) -> [25408];
sort_id_list({39094, 4}) -> [24404];
sort_id_list({39094, 3}) -> [28409];
sort_id_list({39094, 2}) -> [27406];
sort_id_list({39094, 1}) -> [26411];
sort_id_list({39081, 1}) -> [32];
sort_id_list({39081, 2}) -> [10001];
sort_id_list({39081, 3}) -> [10450];
sort_id_list({39081, 4}) -> [17009];
sort_id_list({39081, 5}) -> [17011];
sort_id_list({39081, 6}) -> [39082];
sort_id_list({39081, 7}) -> [72001];
sort_id_list({39081, 8}) -> [72002];
sort_id_list({39081, 9}) -> [17001];
sort_id_list({39081, 10}) -> [17002];
sort_id_list({39081, 11}) -> [17003];
sort_id_list({39081, 12}) -> [17004];
sort_id_list({39081, 13}) -> [17005];
sort_id_list({39079, 4}) -> [17009];
sort_id_list({39079, 3}) -> [32];
sort_id_list({39079, 2}) -> [39998];
sort_id_list({39079, 1}) -> [39999];
sort_id_list({39078, 14}) -> [24070];
sort_id_list({39078, 13}) -> [24060];
sort_id_list({39078, 12}) -> [24050];
sort_id_list({39078, 11}) -> [24001];
sort_id_list({39078, 10}) -> [23010];
sort_id_list({39078, 9}) -> [23028];
sort_id_list({39078, 8}) -> [23034];
sort_id_list({39078, 7}) -> [23007];
sort_id_list({39078, 6}) -> [23031];
sort_id_list({39078, 5}) -> [23019];
sort_id_list({39078, 4}) -> [23016];
sort_id_list({39078, 3}) -> [23013];
sort_id_list({39078, 2}) -> [23004];
sort_id_list({39078, 1}) -> [23001];
sort_id_list({39067, 5}) -> [113006];
sort_id_list({39067, 4}) -> [113005];
sort_id_list({39067, 3}) -> [113003];
sort_id_list({39067, 2}) -> [113002];
sort_id_list({39067, 1}) -> [113001];
sort_id_list({39056, 8}) -> [113008];
sort_id_list({39056, 7}) -> [113007];
sort_id_list({39056, 6}) -> [113006];
sort_id_list({39056, 5}) -> [113005];
sort_id_list({39056, 4}) -> [113004];
sort_id_list({39056, 3}) -> [113003];
sort_id_list({39056, 2}) -> [113002];
sort_id_list({39056, 1}) -> [113001];
sort_id_list({39058, 16}) -> [12050204];
sort_id_list({39058, 15}) -> [12050203];
sort_id_list({39058, 14}) -> [12050202];
sort_id_list({39058, 13}) -> [12050201];
sort_id_list({39058, 12}) -> [11050204];
sort_id_list({39058, 11}) -> [11050203];
sort_id_list({39058, 10}) -> [11050202];
sort_id_list({39058, 9}) -> [11050201];
sort_id_list({39058, 8}) -> [10050204];
sort_id_list({39058, 7}) -> [10050203];
sort_id_list({39058, 6}) -> [10050202];
sort_id_list({39058, 5}) -> [10050201];
sort_id_list({39058, 4}) -> [9050204];
sort_id_list({39058, 3}) -> [9050203];
sort_id_list({39058, 2}) -> [9050202];
sort_id_list({39058, 1}) -> [9050201];
sort_id_list({16202, 8}) -> [16108];
sort_id_list({16202, 7}) -> [16107];
sort_id_list({16202, 6}) -> [16106];
sort_id_list({16202, 5}) -> [16105];
sort_id_list({16202, 4}) -> [16104];
sort_id_list({16202, 3}) -> [16103];
sort_id_list({16202, 2}) -> [16102];
sort_id_list({16202, 1}) -> [16101];
sort_id_list({39090, 5}) -> [25410];
sort_id_list({39090, 4}) -> [24401];
sort_id_list({39090, 3}) -> [26410];
sort_id_list({39090, 2}) -> [27408];
sort_id_list({39090, 1}) -> [28407];
sort_id_list({39060, 3}) -> [28408];
sort_id_list({39060, 2}) -> [27408];
sort_id_list({39060, 1}) -> [25409];
sort_id_list({39040, 10}) -> [26408];
sort_id_list({39040, 9}) -> [26407];
sort_id_list({39040, 8}) -> [26406];
sort_id_list({39040, 7}) -> [25409];
sort_id_list({39040, 6}) -> [25408];
sort_id_list({39040, 5}) -> [25407];
sort_id_list({39040, 4}) -> [25406];
sort_id_list({39040, 3}) -> [24409];
sort_id_list({39040, 2}) -> [24404];
sort_id_list({39040, 1}) -> [24401];
sort_id_list({89904, 1}) -> [23170];
sort_id_list({89904, 2}) -> [23160];
sort_id_list({89904, 3}) -> [24080];
sort_id_list({89904, 4}) -> [24090];
sort_id_list({89904, 5}) -> [23100];
sort_id_list({89904, 6}) -> [23110];
sort_id_list({89904, 7}) -> [23120];
sort_id_list({89904, 8}) -> [23140];
sort_id_list({89904, 9}) -> [23150];
sort_id_list({89904, 10}) -> [24070];
sort_id_list({89904, 11}) -> [24050];
sort_id_list({89904, 12}) -> [24060];
sort_id_list({89904, 13}) -> [23031];
sort_id_list({89904, 14}) -> [23007];
sort_id_list({89904, 15}) -> [23034];
sort_id_list({89904, 16}) -> [23028];
sort_id_list({89904, 17}) -> [24001];
sort_id_list({89904, 18}) -> [23001];
sort_id_list({89904, 19}) -> [23004];
sort_id_list({89904, 20}) -> [23007];
sort_id_list({89904, 21}) -> [23010];
sort_id_list({89904, 22}) -> [23013];
sort_id_list({89904, 23}) -> [23016];
sort_id_list({89904, 24}) -> [23019];
sort_id_list({89903, 1}) -> [23020];
sort_id_list({89903, 2}) -> [23017];
sort_id_list({89903, 3}) -> [23014];
sort_id_list({89903, 4}) -> [23011];
sort_id_list({89903, 5}) -> [23008];
sort_id_list({89903, 6}) -> [23005];
sort_id_list({89903, 7}) -> [23002];
sort_id_list({89903, 8}) -> [24002];
sort_id_list({89903, 9}) -> [23029];
sort_id_list({89903, 10}) -> [23035];
sort_id_list({89903, 11}) -> [23032];
sort_id_list({89903, 12}) -> [24061];
sort_id_list({89903, 13}) -> [24051];
sort_id_list({89903, 14}) -> [24071];
sort_id_list({89903, 15}) -> [23151];
sort_id_list({89903, 16}) -> [23141];
sort_id_list({89903, 17}) -> [23121];
sort_id_list({89903, 18}) -> [23101];
sort_id_list({89903, 19}) -> [24091];
sort_id_list({89903, 20}) -> [24081];
sort_id_list({89903, 21}) -> [23171];
sort_id_list({89903, 22}) -> [23161];
sort_id_list({59041, 1}) -> [28923];
sort_id_list({59041, 2}) -> [28922];
sort_id_list({59041, 3}) -> [28921];
sort_id_list({59041, 4}) -> [27923];
sort_id_list({59041, 5}) -> [27922];
sort_id_list({59041, 6}) -> [27921];
sort_id_list({59040, 1}) -> [28920];
sort_id_list({59040, 2}) -> [28919];
sort_id_list({59040, 3}) -> [28918];
sort_id_list({59040, 4}) -> [28917];
sort_id_list({59040, 5}) -> [27920];
sort_id_list({59040, 6}) -> [27919];
sort_id_list({59040, 7}) -> [27918];
sort_id_list({59040, 8}) -> [27917];
sort_id_list({59040, 9}) -> [26917];
sort_id_list({59040, 10}) -> [26915];
sort_id_list({59040, 11}) -> [25917];
sort_id_list({59040, 12}) -> [25916];
sort_id_list({59040, 13}) -> [24917];
sort_id_list({39039, 1}) -> [24402];
sort_id_list({39039, 2}) -> [24403];
sort_id_list({39039, 3}) -> [24406];
sort_id_list({39039, 4}) -> [24400];
sort_id_list({39039, 5}) -> [24404];
sort_id_list({39039, 6}) -> [24409];
sort_id_list({39039, 7}) -> [24410];
sort_id_list({39039, 8}) -> [24401];
sort_id_list({39039, 9}) -> [24411];
sort_id_list({39039, 10}) -> [24413];
sort_id_list({39039, 11}) -> [24414];
sort_id_list({39039, 12}) -> [24415];
sort_id_list({39039, 13}) -> [25400];
sort_id_list({39039, 14}) -> [25401];
sort_id_list({39039, 15}) -> [25404];
sort_id_list({39039, 16}) -> [25406];
sort_id_list({39039, 17}) -> [25403];
sort_id_list({39039, 18}) -> [25408];
sort_id_list({39039, 19}) -> [25410];
sort_id_list({39039, 20}) -> [25411];
sort_id_list({39039, 21}) -> [25407];
sort_id_list({39039, 22}) -> [25409];
sort_id_list({39039, 23}) -> [25412];
sort_id_list({39039, 24}) -> [25413];
sort_id_list({39039, 25}) -> [25414];
sort_id_list({39039, 26}) -> [26400];
sort_id_list({39039, 27}) -> [26403];
sort_id_list({39039, 28}) -> [26405];
sort_id_list({39039, 29}) -> [26401];
sort_id_list({39039, 30}) -> [26406];
sort_id_list({39039, 31}) -> [26407];
sort_id_list({39039, 32}) -> [26408];
sort_id_list({39039, 33}) -> [26409];
sort_id_list({39039, 34}) -> [26410];
sort_id_list({39039, 35}) -> [26411];
sort_id_list({39039, 36}) -> [26412];
sort_id_list({39039, 37}) -> [26413];
sort_id_list({39039, 38}) -> [27401];
sort_id_list({39039, 39}) -> [27402];
sort_id_list({39039, 40}) -> [27403];
sort_id_list({39039, 41}) -> [27405];
sort_id_list({39039, 42}) -> [27406];
sort_id_list({39039, 43}) -> [27407];
sort_id_list({39039, 44}) -> [27408];
sort_id_list({39039, 45}) -> [27409];
sort_id_list({39039, 46}) -> [27410];
sort_id_list({39039, 47}) -> [27411];
sort_id_list({39039, 48}) -> [27412];
sort_id_list({39039, 49}) -> [27413];
sort_id_list({39039, 50}) -> [27414];
sort_id_list({39039, 51}) -> [27421];
sort_id_list({39039, 52}) -> [27422];
sort_id_list({39039, 53}) -> [28401];
sort_id_list({39039, 54}) -> [28402];
sort_id_list({39039, 55}) -> [28403];
sort_id_list({39039, 56}) -> [28404];
sort_id_list({39039, 57}) -> [28406];
sort_id_list({39039, 58}) -> [28407];
sort_id_list({39039, 59}) -> [28408];
sort_id_list({39039, 60}) -> [28409];
sort_id_list({39039, 61}) -> [28410];
sort_id_list({39039, 62}) -> [28411];
sort_id_list({39039, 63}) -> [28412];
sort_id_list({39039, 64}) -> [28414];
sort_id_list({39039, 65}) -> [28415];
sort_id_list({39039, 66}) -> [28416];
sort_id_list({39039, 67}) -> [24412];
sort_id_list({39517, 2}) -> [39519];
sort_id_list({39517, 1}) -> [39518];
sort_id_list({39513, 1}) -> [39516];
sort_id_list({39513, 2}) -> [39515];
sort_id_list({39513, 3}) -> [39514];
sort_id_list({39509, 1}) -> [39512];
sort_id_list({39509, 2}) -> [39511];
sort_id_list({39509, 3}) -> [39510];
sort_id_list({39505, 1}) -> [39508];
sort_id_list({39505, 2}) -> [39507];
sort_id_list({39505, 3}) -> [39506];
sort_id_list({39501, 1}) -> [39504];
sort_id_list({39501, 2}) -> [39503];
sort_id_list({39501, 3}) -> [39502];
sort_id_list({39497, 1}) -> [39500];
sort_id_list({39497, 2}) -> [39499];
sort_id_list({39497, 3}) -> [39498];
sort_id_list({39493, 1}) -> [39496];
sort_id_list({39493, 2}) -> [39495];
sort_id_list({39493, 3}) -> [39494];
sort_id_list({60211, 5}) -> [90510];
sort_id_list({60211, 4}) -> [90509];
sort_id_list({60211, 3}) -> [90508];
sort_id_list({60211, 2}) -> [90507];
sort_id_list({60211, 1}) -> [90506];
sort_id_list({90515, 1}) -> [91000];
sort_id_list({90514, 1}) -> [90900];
sort_id_list({60210, 5}) -> [90505];
sort_id_list({60210, 4}) -> [90504];
sort_id_list({60210, 3}) -> [90503];
sort_id_list({60210, 2}) -> [90502];
sort_id_list({60210, 1}) -> [90501];
sort_id_list({60209, 4}) -> [28402];
sort_id_list({60209, 3}) -> [28406];
sort_id_list({60209, 2}) -> [27409];
sort_id_list({60209, 1}) -> [27408];
sort_id_list({60208, 4}) -> [28403];
sort_id_list({60208, 3}) -> [28401];
sort_id_list({60208, 2}) -> [27403];
sort_id_list({60208, 1}) -> [27401];
sort_id_list({60207, 5}) -> [28403];
sort_id_list({60207, 4}) -> [27405];
sort_id_list({60207, 3}) -> [26408];
sort_id_list({60207, 2}) -> [24410];
sort_id_list({60207, 1}) -> [25408];
sort_id_list({60206, 8}) -> [25404];
sort_id_list({60206, 7}) -> [25408];
sort_id_list({60206, 6}) -> [26407];
sort_id_list({60206, 5}) -> [26408];
sort_id_list({60206, 4}) -> [24411];
sort_id_list({60206, 3}) -> [24409];
sort_id_list({60206, 2}) -> [28405];
sort_id_list({60206, 1}) -> [27400];
sort_id_list({60205, 6}) -> [24400];
sort_id_list({60205, 5}) -> [24410];
sort_id_list({60205, 4}) -> [26402];
sort_id_list({60205, 3}) -> [26406];
sort_id_list({60205, 2}) -> [25406];
sort_id_list({60205, 1}) -> [25411];
sort_id_list({60204, 16}) -> [26405];
sort_id_list({60204, 15}) -> [26404];
sort_id_list({60204, 14}) -> [26403];
sort_id_list({60204, 13}) -> [26402];
sort_id_list({60204, 12}) -> [26400];
sort_id_list({60204, 11}) -> [25405];
sort_id_list({60204, 10}) -> [25404];
sort_id_list({60204, 9}) -> [25402];
sort_id_list({60204, 8}) -> [25401];
sort_id_list({60204, 7}) -> [25400];
sort_id_list({60204, 6}) -> [24408];
sort_id_list({60204, 5}) -> [24407];
sort_id_list({60204, 4}) -> [24406];
sort_id_list({60204, 3}) -> [24405];
sort_id_list({60204, 2}) -> [24402];
sort_id_list({60203, 1}) -> [24409];
sort_id_list({60203, 2}) -> [24404];
sort_id_list({60203, 3}) -> [24401];
sort_id_list({60202, 3}) -> [26407];
sort_id_list({60202, 2}) -> [25408];
sort_id_list({60202, 1}) -> [24409];
sort_id_list({60201, 3}) -> [26406];
sort_id_list({60201, 2}) -> [25406];
sort_id_list({60201, 1}) -> [24400];
sort_id_list({17009, 5}) -> [17005];
sort_id_list({17009, 4}) -> [17004];
sort_id_list({17009, 3}) -> [17003];
sort_id_list({17009, 2}) -> [17002];
sort_id_list({17009, 1}) -> [17001];
sort_id_list({39009, 4}) -> [14002];
sort_id_list({39009, 3}) -> [10001];
sort_id_list({39009, 2}) -> [72001];
sort_id_list({39009, 1}) -> [10450];
sort_id_list({39008, 4}) -> [14002];
sort_id_list({39008, 3}) -> [10001];
sort_id_list({39008, 2}) -> [72001];
sort_id_list({39008, 1}) -> [10450];
sort_id_list({10402, 4}) -> [10406];
sort_id_list({10402, 3}) -> [10405];
sort_id_list({10402, 2}) -> [10404];
sort_id_list({10402, 1}) -> [10403];
sort_id_list({35001, 2}) -> [20030];
sort_id_list({35001, 1}) -> [20027];
sort_id_list({30401, 7}) -> [10116];
sort_id_list({30401, 6}) -> [10115];
sort_id_list({30401, 5}) -> [10114];
sort_id_list({30401, 4}) -> [10113];
sort_id_list({30401, 3}) -> [10112];
sort_id_list({30401, 2}) -> [10111];
sort_id_list({30401, 1}) -> [10110];
sort_id_list({30019, 4}) -> [30023];
sort_id_list({30019, 3}) -> [30022];
sort_id_list({30019, 2}) -> [30021];
sort_id_list({30019, 1}) -> [30020];
sort_id_list({30015, 3}) -> [30018];
sort_id_list({30015, 2}) -> [30017];
sort_id_list({30015, 1}) -> [30016];
sort_id_list({30010, 4}) -> [30014];
sort_id_list({30010, 3}) -> [30013];
sort_id_list({30010, 2}) -> [30012];
sort_id_list({30010, 1}) -> [30011];
sort_id_list({8888825, 14}) -> [888882514];
sort_id_list({8888825, 13}) -> [888882513];
sort_id_list({8888825, 12}) -> [888882512];
sort_id_list({8888825, 11}) -> [888882511];
sort_id_list({8888825, 10}) -> [888882510];
sort_id_list({8888825, 9}) -> [88888259];
sort_id_list({8888825, 8}) -> [88888258];
sort_id_list({8888825, 7}) -> [88888257];
sort_id_list({8888825, 6}) -> [88888256];
sort_id_list({8888825, 5}) -> [88888255];
sort_id_list({8888825, 4}) -> [88888254];
sort_id_list({8888825, 3}) -> [88888253];
sort_id_list({8888825, 2}) -> [88888252];
sort_id_list({8888825, 1}) -> [88888251];
sort_id_list({8888830, 14}) -> [888883014];
sort_id_list({8888830, 13}) -> [888883013];
sort_id_list({8888830, 12}) -> [888883012];
sort_id_list({8888830, 11}) -> [888883011];
sort_id_list({8888830, 10}) -> [888883010];
sort_id_list({8888830, 9}) -> [88888309];
sort_id_list({8888830, 8}) -> [88888308];
sort_id_list({8888830, 7}) -> [88888307];
sort_id_list({8888830, 6}) -> [88888306];
sort_id_list({8888830, 5}) -> [88888305];
sort_id_list({8888830, 4}) -> [88888304];
sort_id_list({8888830, 3}) -> [88888303];
sort_id_list({8888830, 2}) -> [88888302];
sort_id_list({8888830, 1}) -> [88888301];
sort_id_list({8888835, 14}) -> [888883514];
sort_id_list({8888835, 13}) -> [888883513];
sort_id_list({8888835, 12}) -> [888883512];
sort_id_list({8888835, 11}) -> [888883511];
sort_id_list({8888835, 10}) -> [888883510];
sort_id_list({8888835, 9}) -> [88888359];
sort_id_list({8888835, 8}) -> [88888358];
sort_id_list({8888835, 7}) -> [88888357];
sort_id_list({8888835, 6}) -> [88888356];
sort_id_list({8888835, 5}) -> [88888355];
sort_id_list({8888835, 4}) -> [88888354];
sort_id_list({8888835, 3}) -> [88888353];
sort_id_list({8888835, 2}) -> [88888352];
sort_id_list({8888835, 1}) -> [88888351];
sort_id_list({8888840, 14}) -> [888884014];
sort_id_list({8888840, 13}) -> [888884013];
sort_id_list({8888840, 12}) -> [888884012];
sort_id_list({8888840, 11}) -> [888884011];
sort_id_list({8888840, 10}) -> [888884010];
sort_id_list({8888840, 9}) -> [88888409];
sort_id_list({8888840, 8}) -> [88888408];
sort_id_list({8888840, 7}) -> [88888407];
sort_id_list({8888840, 6}) -> [88888406];
sort_id_list({8888840, 5}) -> [88888405];
sort_id_list({8888840, 4}) -> [88888404];
sort_id_list({8888840, 3}) -> [88888403];
sort_id_list({8888840, 2}) -> [88888402];
sort_id_list({8888840, 1}) -> [88888401];
sort_id_list({8888845, 14}) -> [888884514];
sort_id_list({8888845, 13}) -> [888884513];
sort_id_list({8888845, 12}) -> [888884512];
sort_id_list({8888845, 11}) -> [888884511];
sort_id_list({8888845, 10}) -> [888884510];
sort_id_list({8888845, 9}) -> [88888459];
sort_id_list({8888845, 8}) -> [88888458];
sort_id_list({8888845, 7}) -> [88888457];
sort_id_list({8888845, 6}) -> [88888456];
sort_id_list({8888845, 5}) -> [88888455];
sort_id_list({8888845, 4}) -> [88888454];
sort_id_list({8888845, 3}) -> [88888453];
sort_id_list({8888845, 2}) -> [88888452];
sort_id_list({8888845, 1}) -> [88888451];
sort_id_list({8888850, 14}) -> [888885014];
sort_id_list({8888850, 13}) -> [888885013];
sort_id_list({8888850, 12}) -> [888885012];
sort_id_list({8888850, 11}) -> [888885011];
sort_id_list({8888850, 10}) -> [888885010];
sort_id_list({8888850, 9}) -> [88888509];
sort_id_list({8888850, 8}) -> [88888508];
sort_id_list({8888850, 7}) -> [88888507];
sort_id_list({8888850, 6}) -> [88888506];
sort_id_list({8888850, 5}) -> [88888505];
sort_id_list({8888850, 4}) -> [88888504];
sort_id_list({8888850, 3}) -> [88888503];
sort_id_list({8888850, 2}) -> [88888502];
sort_id_list({8888850, 1}) -> [88888501];
sort_id_list({8888855, 14}) -> [888885514];
sort_id_list({8888855, 13}) -> [888885513];
sort_id_list({8888855, 12}) -> [888885512];
sort_id_list({8888855, 11}) -> [888885511];
sort_id_list({8888855, 10}) -> [888885510];
sort_id_list({8888855, 9}) -> [88888559];
sort_id_list({8888855, 8}) -> [88888558];
sort_id_list({8888855, 7}) -> [88888557];
sort_id_list({8888855, 6}) -> [88888556];
sort_id_list({8888855, 5}) -> [88888555];
sort_id_list({8888855, 4}) -> [88888554];
sort_id_list({8888855, 3}) -> [88888553];
sort_id_list({8888855, 2}) -> [88888552];
sort_id_list({8888855, 1}) -> [88888551];
sort_id_list({99999105, 8}) -> [40848];
sort_id_list({99999105, 7}) -> [40748];
sort_id_list({99999105, 6}) -> [40648];
sort_id_list({99999105, 5}) -> [40548];
sort_id_list({99999105, 4}) -> [40448];
sort_id_list({99999105, 3}) -> [40348];
sort_id_list({99999105, 2}) -> [40248];
sort_id_list({99999105, 1}) -> [40148];
sort_id_list({99999100, 8}) -> [40847];
sort_id_list({99999100, 7}) -> [40747];
sort_id_list({99999100, 6}) -> [40647];
sort_id_list({99999100, 5}) -> [40547];
sort_id_list({99999100, 4}) -> [40447];
sort_id_list({99999100, 3}) -> [40347];
sort_id_list({99999100, 2}) -> [40247];
sort_id_list({99999100, 1}) -> [40147];
sort_id_list({9999995, 8}) -> [40846];
sort_id_list({9999995, 7}) -> [40746];
sort_id_list({9999995, 6}) -> [40646];
sort_id_list({9999995, 5}) -> [40546];
sort_id_list({9999995, 4}) -> [40446];
sort_id_list({9999995, 3}) -> [40346];
sort_id_list({9999995, 2}) -> [40246];
sort_id_list({9999995, 1}) -> [40146];
sort_id_list({9999990, 8}) -> [40845];
sort_id_list({9999990, 7}) -> [40745];
sort_id_list({9999990, 6}) -> [40645];
sort_id_list({9999990, 5}) -> [40545];
sort_id_list({9999990, 4}) -> [40445];
sort_id_list({9999990, 3}) -> [40345];
sort_id_list({9999990, 2}) -> [40245];
sort_id_list({9999990, 1}) -> [40145];
sort_id_list({9999985, 8}) -> [40844];
sort_id_list({9999985, 7}) -> [40744];
sort_id_list({9999985, 6}) -> [40644];
sort_id_list({9999985, 5}) -> [40544];
sort_id_list({9999985, 4}) -> [40444];
sort_id_list({9999985, 3}) -> [40344];
sort_id_list({9999985, 2}) -> [40244];
sort_id_list({9999985, 1}) -> [40144];
sort_id_list({9999980, 8}) -> [40843];
sort_id_list({9999980, 7}) -> [40743];
sort_id_list({9999980, 6}) -> [40643];
sort_id_list({9999980, 5}) -> [40543];
sort_id_list({9999980, 4}) -> [40443];
sort_id_list({9999980, 3}) -> [40343];
sort_id_list({9999980, 2}) -> [40243];
sort_id_list({9999980, 1}) -> [40143];
sort_id_list({9999975, 8}) -> [40842];
sort_id_list({9999975, 7}) -> [40742];
sort_id_list({9999975, 6}) -> [40642];
sort_id_list({9999975, 5}) -> [40542];
sort_id_list({9999975, 4}) -> [40442];
sort_id_list({9999975, 3}) -> [40342];
sort_id_list({9999975, 2}) -> [40242];
sort_id_list({9999975, 1}) -> [40142];
sort_id_list({9999970, 8}) -> [40841];
sort_id_list({9999970, 7}) -> [40741];
sort_id_list({9999970, 6}) -> [40641];
sort_id_list({9999970, 5}) -> [40541];
sort_id_list({9999970, 4}) -> [40441];
sort_id_list({9999970, 3}) -> [40341];
sort_id_list({9999970, 2}) -> [40241];
sort_id_list({9999970, 1}) -> [40141];
sort_id_list({9999965, 8}) -> [40840];
sort_id_list({9999965, 7}) -> [40740];
sort_id_list({9999965, 6}) -> [40640];
sort_id_list({9999965, 5}) -> [40540];
sort_id_list({9999965, 4}) -> [40440];
sort_id_list({9999965, 3}) -> [40340];
sort_id_list({9999965, 2}) -> [40240];
sort_id_list({9999965, 1}) -> [40140];
sort_id_list({9999960, 8}) -> [40839];
sort_id_list({9999960, 7}) -> [40739];
sort_id_list({9999960, 6}) -> [40639];
sort_id_list({9999960, 5}) -> [40539];
sort_id_list({9999960, 4}) -> [40439];
sort_id_list({9999960, 3}) -> [40339];
sort_id_list({9999960, 2}) -> [40239];
sort_id_list({9999960, 1}) -> [40139];
sort_id_list({9999955, 8}) -> [40838];
sort_id_list({9999955, 7}) -> [40738];
sort_id_list({9999955, 6}) -> [40638];
sort_id_list({9999955, 5}) -> [40538];
sort_id_list({9999955, 4}) -> [40438];
sort_id_list({9999955, 3}) -> [40338];
sort_id_list({9999955, 2}) -> [40238];
sort_id_list({9999955, 1}) -> [40138];
sort_id_list({9999950, 8}) -> [40837];
sort_id_list({9999950, 7}) -> [40737];
sort_id_list({9999950, 6}) -> [40637];
sort_id_list({9999950, 5}) -> [40537];
sort_id_list({9999950, 4}) -> [40437];
sort_id_list({9999950, 3}) -> [40337];
sort_id_list({9999950, 2}) -> [40237];
sort_id_list({9999950, 1}) -> [40137];
sort_id_list({9999945, 8}) -> [40836];
sort_id_list({9999945, 7}) -> [40736];
sort_id_list({9999945, 6}) -> [40636];
sort_id_list({9999945, 5}) -> [40536];
sort_id_list({9999945, 4}) -> [40436];
sort_id_list({9999945, 3}) -> [40336];
sort_id_list({9999945, 2}) -> [40236];
sort_id_list({9999945, 1}) -> [40136];
sort_id_list({9999940, 8}) -> [40835];
sort_id_list({9999940, 7}) -> [40735];
sort_id_list({9999940, 6}) -> [40635];
sort_id_list({9999940, 5}) -> [40535];
sort_id_list({9999940, 4}) -> [40435];
sort_id_list({9999940, 3}) -> [40335];
sort_id_list({9999940, 2}) -> [40235];
sort_id_list({9999940, 1}) -> [40135];
sort_id_list({9999935, 8}) -> [40834];
sort_id_list({9999935, 7}) -> [40734];
sort_id_list({9999935, 6}) -> [40634];
sort_id_list({9999935, 5}) -> [40534];
sort_id_list({9999935, 4}) -> [40434];
sort_id_list({9999935, 3}) -> [40334];
sort_id_list({9999935, 2}) -> [40234];
sort_id_list({9999935, 1}) -> [40134];
sort_id_list({9999930, 8}) -> [40833];
sort_id_list({9999930, 7}) -> [40733];
sort_id_list({9999930, 6}) -> [40633];
sort_id_list({9999930, 5}) -> [40533];
sort_id_list({9999930, 4}) -> [40433];
sort_id_list({9999930, 3}) -> [40333];
sort_id_list({9999930, 2}) -> [40233];
sort_id_list({9999930, 1}) -> [40133];
sort_id_list({9999925, 8}) -> [40832];
sort_id_list({9999925, 7}) -> [40732];
sort_id_list({9999925, 6}) -> [40632];
sort_id_list({9999925, 5}) -> [40532];
sort_id_list({9999925, 4}) -> [40432];
sort_id_list({9999925, 3}) -> [40332];
sort_id_list({9999925, 2}) -> [40232];
sort_id_list({9999925, 1}) -> [40132];
sort_id_list(_) -> [].

get_week_reward(85001) -> [{3, 400}];
get_week_reward(85002) -> [{10450, 1500}];
get_week_reward(_) -> [].

get_week_mail_reward(85001) -> [{3, 300}];
get_week_mail_reward(85002) -> [{10450, 500}];
get_week_mail_reward(_) -> [].

get_week_mail_day(85001) -> 7;
get_week_mail_day(85002) -> 7;
get_week_mail_day(_) -> 0.


