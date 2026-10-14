-file("data/exchange_data.erl", 1).

-file("data/exchange_data.erl", 1).

-file("src/mod/data/exchange_data.erl", 1).

-module(exchange_data).

-lager_records([{exchange_data_other,
		 [lv, type, pos, item_id, itemname, item_num, pro, price,
		  pay_type, limit_lev, limit_day]},
		{exchange_expire_gift,
		 [ver, eid, base_id, bind, num, timeout, reward_time]},
		{exchange_other,
		 [ver, type, pos, item_id, itemname, item_num, price,
		  pay_type, status]},
		{m_shop,
		 [ver, ref_time_list, items, expire_list, extra]},
		{exchange_data,
		 [type, type2, id, item_bid, day, item_name, item_num,
		  bind, pay_type, price, limit_vip, limit_day, limit_week,
		  limit_month, glev, lev, is_partner, goods_type,
		  limit_count, label, discount, limit_rank, buy_condit,
		  limit_soft, buy_stage, open_srv_timestamp,
		  arena_elite_lev]},
		{exchange_ref,
		 [type_type, lev, type, order, item_bid, item_name,
		  item_num, pro, price, pay_type, has_buy, item_type,
		  label, discount, limit_count, assets_range, pay_type2,
		  flag, item, id, limit_day, limit_week, limit_month,
		  item_desc]}]).

-export([list_by_type/1, get_by_eid/1, get_cost_list/1,
	 get_exchange_name/1, get_limit_open/1, get_const/1,
	 get_rand1/1, get_rand2/1, get_itemname/1,
	 first_rand/0]).

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

-file("src/mod/data/exchange_data.erl", 19).

-file("inc/exchange.hrl", 1).

-record(exchange_ref,
	{type_type = 0, lev = {0, 0}, type = 0, order = 0,
	 item_bid = 0, item_name = <<>>, item_num = 0, pro = 0,
	 price = 0, pay_type = 0, has_buy = 0, item_type = 0,
	 label = 0, discount = 0, limit_count = 0,
	 assets_range = {-1, 0}, pay_type2 = {0, 0}, flag = 1,
	 item = [], id = 0, limit_day = 0, limit_week = 0,
	 limit_month = 0, item_desc = <<>>}).

-record(exchange_data,
	{type = 0, type2 = 0, id = 0, item_bid = 0, day = 0,
	 item_name = <<>>, item_num = 0, bind = 1, pay_type = 0,
	 price = 0, limit_vip = 0, limit_day = 0, limit_week = 0,
	 limit_month = 0, glev = 0, lev = 0, is_partner = 0,
	 goods_type = 0, limit_count = 0, label = 0,
	 discount = 0, limit_rank = 0, buy_condit = 0,
	 limit_soft = 0, buy_stage = 0, open_srv_timestamp = 0,
	 arena_elite_lev = 0}).

-record(m_shop,
	{ver = 3, ref_time_list = [], items = [],
	 expire_list = [], extra = []}).

-record(exchange_other,
	{ver = 1, type = 0, pos = 0, item_id, itemname,
	 item_num, price, pay_type, status = 0}).

-record(exchange_expire_gift,
	{ver = 1, eid = 0, base_id = 0, bind = 0, num = 0,
	 timeout = 0, reward_time = 0}).

-record(exchange_data_other,
	{lv = {1, 999}, type, pos, item_id, itemname, item_num,
	 pro, price, pay_type, limit_lev = 0, limit_day = 1}).

-file("src/mod/data/exchange_data.erl", 20).

list_by_type(80) ->
    [#exchange_data{type = 80, id = 80001, item_bid = 50022,
		    item_name = lang:get(<<"魔王之息"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 800, buy_stage = 1,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80002, item_bid = 29905,
		    item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 50,
		    pay_type = 80244, price = 500, buy_stage = 1,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80003, item_bid = 14001,
		    item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 200, buy_stage = 1,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80004, item_bid = 10603,
		    item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 300, buy_stage = 1,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80005, item_bid = 200505,
		    item_name = lang:get(<<"邪灵南瓜"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 250, buy_stage = 1,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80006, item_bid = 10408,
		    item_name = lang:get(<<"精英召唤券"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 50, buy_stage = 1,
		    limit_count = 3},
     #exchange_data{type = 80, id = 80007, item_bid = 35,
		    item_name = lang:get(<<"圣羽"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 100, buy_stage = 1,
		    limit_count = 5},
     #exchange_data{type = 80, id = 80008, item_bid = 80246,
		    item_name = lang:get(<<"南瓜机"/utf8>>), item_num = 1,
		    pay_type = gold, price = 30, buy_stage = 1,
		    limit_day = 99},
     #exchange_data{type = 80, id = 80009, item_bid = 29905,
		    item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 50,
		    pay_type = 80244, price = 500, buy_stage = 2,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80010, item_bid = 14001,
		    item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 200, buy_stage = 2,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80011, item_bid = 10603,
		    item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 300, buy_stage = 2,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80012, item_bid = 200502,
		    item_name = lang:get(<<"术士炼金炉"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 150, buy_stage = 2,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80013, item_bid = 10408,
		    item_name = lang:get(<<"精英召唤券"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 50, buy_stage = 2,
		    limit_count = 3},
     #exchange_data{type = 80, id = 80014, item_bid = 35,
		    item_name = lang:get(<<"圣羽"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 100, buy_stage = 2,
		    limit_count = 5},
     #exchange_data{type = 80, id = 80015, item_bid = 29905,
		    item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 50,
		    pay_type = 80244, price = 500, buy_stage = 3,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80016, item_bid = 14001,
		    item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 200, buy_stage = 3,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80017, item_bid = 10603,
		    item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 300, buy_stage = 3,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80018, item_bid = 200506,
		    item_name = lang:get(<<"幽森喷泉"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 150, buy_stage = 3,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80019, item_bid = 10408,
		    item_name = lang:get(<<"精英召唤券"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 50, buy_stage = 3,
		    limit_count = 3},
     #exchange_data{type = 80, id = 80020, item_bid = 35,
		    item_name = lang:get(<<"圣羽"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 100, buy_stage = 3,
		    limit_count = 5},
     #exchange_data{type = 80, id = 80021, item_bid = 29905,
		    item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 50,
		    pay_type = 80244, price = 500, buy_stage = 4,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80022, item_bid = 14001,
		    item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 200, buy_stage = 4,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80023, item_bid = 10603,
		    item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 300, buy_stage = 4,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80024, item_bid = 200511,
		    item_name = lang:get(<<"不亡者之棺"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 250, buy_stage = 4,
		    limit_count = 1},
     #exchange_data{type = 80, id = 80025, item_bid = 10408,
		    item_name = lang:get(<<"精英召唤券"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 50, buy_stage = 4,
		    limit_count = 3},
     #exchange_data{type = 80, id = 80026, item_bid = 35,
		    item_name = lang:get(<<"圣羽"/utf8>>), item_num = 1,
		    pay_type = 80244, price = 100, buy_stage = 4,
		    limit_count = 5},
     #exchange_data{type = 80, id = 80027, item_bid = 10040,
		    item_name = lang:get(<<"奥术之尘"/utf8>>), item_num = 5,
		    pay_type = 80244, price = 30, buy_stage = 1,
		    limit_week = 10},
     #exchange_data{type = 80, id = 80028, item_bid = 10450,
		    item_name = lang:get(<<"符文精华"/utf8>>), item_num = 100,
		    pay_type = 80244, price = 20, buy_stage = 1,
		    limit_week = 20},
     #exchange_data{type = 80, id = 80029, item_bid = 10001,
		    item_name = lang:get(<<"进阶石"/utf8>>), item_num = 100,
		    pay_type = 80244, price = 50, buy_stage = 1,
		    limit_week = 50},
     #exchange_data{type = 80, id = 80030, item_bid = 1,
		    item_name = lang:get(<<"金币"/utf8>>), item_num = 50000,
		    pay_type = 80244, price = 1, buy_stage = 1,
		    limit_day = 99},
     #exchange_data{type = 80, id = 80031, item_bid = 22,
		    item_name = lang:get(<<"英雄经验"/utf8>>), item_num = 10000,
		    pay_type = 80244, price = 1, buy_stage = 1,
		    limit_day = 99}];
list_by_type(52) ->
    [#exchange_data{type = 52, id = 52001,
		    item_bid = 5030201,
		    item_name = lang:get(<<"[极品]3星穿甲耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52002,
		    item_bid = 5030202,
		    item_name = lang:get(<<"[极品]3星穿甲项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52003,
		    item_bid = 5030203,
		    item_name = lang:get(<<"[极品]3星穿甲戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52004,
		    item_bid = 5030204,
		    item_name = lang:get(<<"[极品]3星穿甲手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52005,
		    item_bid = 6030201,
		    item_name = lang:get(<<"[极品]3星破法耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52006,
		    item_bid = 6030202,
		    item_name = lang:get(<<"[极品]3星破法项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52007,
		    item_bid = 6030203,
		    item_name = lang:get(<<"[极品]3星破法戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52008,
		    item_bid = 6030204,
		    item_name = lang:get(<<"[极品]3星破法手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52009,
		    item_bid = 7030201,
		    item_name = lang:get(<<"[极品]3星斗战耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52010,
		    item_bid = 7030202,
		    item_name = lang:get(<<"[极品]3星斗战项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52011,
		    item_bid = 7030203,
		    item_name = lang:get(<<"[极品]3星斗战戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52012,
		    item_bid = 7030204,
		    item_name = lang:get(<<"[极品]3星斗战手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52013,
		    item_bid = 8030201,
		    item_name = lang:get(<<"[极品]3星镇灵耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52014,
		    item_bid = 8030202,
		    item_name = lang:get(<<"[极品]3星镇灵项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52015,
		    item_bid = 8030203,
		    item_name = lang:get(<<"[极品]3星镇灵戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52016,
		    item_bid = 8030204,
		    item_name = lang:get(<<"[极品]3星镇灵手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 25},
     #exchange_data{type = 52, id = 52017,
		    item_bid = 9030201,
		    item_name = lang:get(<<"[极品]3星魔甲耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52018,
		    item_bid = 9030202,
		    item_name = lang:get(<<"[极品]3星魔甲项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52019,
		    item_bid = 9030203,
		    item_name = lang:get(<<"[极品]3星魔甲戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52020,
		    item_bid = 9030204,
		    item_name = lang:get(<<"[极品]3星魔甲手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52021,
		    item_bid = 10030201,
		    item_name = lang:get(<<"[极品]3星神战耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52022,
		    item_bid = 10030202,
		    item_name = lang:get(<<"[极品]3星神战项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52023,
		    item_bid = 10030203,
		    item_name = lang:get(<<"[极品]3星神战戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52024,
		    item_bid = 10030204,
		    item_name = lang:get(<<"[极品]3星神战手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52025,
		    item_bid = 11030201,
		    item_name = lang:get(<<"[极品]3星龙威耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52026,
		    item_bid = 11030202,
		    item_name = lang:get(<<"[极品]3星龙威项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52027,
		    item_bid = 11030203,
		    item_name = lang:get(<<"[极品]3星龙威戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52028,
		    item_bid = 11030204,
		    item_name = lang:get(<<"[极品]3星龙威手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52029,
		    item_bid = 12030201,
		    item_name = lang:get(<<"[极品]3星神愈耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52030,
		    item_bid = 12030202,
		    item_name = lang:get(<<"[极品]3星神愈项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52031,
		    item_bid = 12030203,
		    item_name = lang:get(<<"[极品]3星神愈戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52032,
		    item_bid = 12030204,
		    item_name = lang:get(<<"[极品]3星神愈手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52097,
		    item_bid = 13030201,
		    item_name = lang:get(<<"[极品]3星极速耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52098,
		    item_bid = 13030202,
		    item_name = lang:get(<<"[极品]3星极速项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52099,
		    item_bid = 13030203,
		    item_name = lang:get(<<"[极品]3星极速戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52100,
		    item_bid = 13030204,
		    item_name = lang:get(<<"[极品]3星极速手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52101,
		    item_bid = 14030201,
		    item_name = lang:get(<<"[极品]3星玄护耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52102,
		    item_bid = 14030202,
		    item_name = lang:get(<<"[极品]3星玄护项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52103,
		    item_bid = 14030203,
		    item_name = lang:get(<<"[极品]3星玄护戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52104,
		    item_bid = 14030204,
		    item_name = lang:get(<<"[极品]3星玄护手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 30},
     #exchange_data{type = 52, id = 52033,
		    item_bid = 5040201,
		    item_name = lang:get(<<"[极品]4星穿甲耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52034,
		    item_bid = 5040202,
		    item_name = lang:get(<<"[极品]4星穿甲项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52035,
		    item_bid = 5040203,
		    item_name = lang:get(<<"[极品]4星穿甲戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52036,
		    item_bid = 5040204,
		    item_name = lang:get(<<"[极品]4星穿甲手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52037,
		    item_bid = 6040201,
		    item_name = lang:get(<<"[极品]4星破法耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52038,
		    item_bid = 6040202,
		    item_name = lang:get(<<"[极品]4星破法项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52039,
		    item_bid = 6040203,
		    item_name = lang:get(<<"[极品]4星破法戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52040,
		    item_bid = 6040204,
		    item_name = lang:get(<<"[极品]4星破法手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52041,
		    item_bid = 7040201,
		    item_name = lang:get(<<"[极品]4星斗战耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52042,
		    item_bid = 7040202,
		    item_name = lang:get(<<"[极品]4星斗战项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52043,
		    item_bid = 7040203,
		    item_name = lang:get(<<"[极品]4星斗战戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52044,
		    item_bid = 7040204,
		    item_name = lang:get(<<"[极品]4星斗战手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52045,
		    item_bid = 8040201,
		    item_name = lang:get(<<"[极品]4星镇灵耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52046,
		    item_bid = 8040202,
		    item_name = lang:get(<<"[极品]4星镇灵项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52047,
		    item_bid = 8040203,
		    item_name = lang:get(<<"[极品]4星镇灵戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52048,
		    item_bid = 8040204,
		    item_name = lang:get(<<"[极品]4星镇灵手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 40,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52049,
		    item_bid = 9040201,
		    item_name = lang:get(<<"[极品]4星魔甲耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52050,
		    item_bid = 9040202,
		    item_name = lang:get(<<"[极品]4星魔甲项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52051,
		    item_bid = 9040203,
		    item_name = lang:get(<<"[极品]4星魔甲戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52052,
		    item_bid = 9040204,
		    item_name = lang:get(<<"[极品]4星魔甲手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52053,
		    item_bid = 10040201,
		    item_name = lang:get(<<"[极品]4星神战耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52054,
		    item_bid = 10040202,
		    item_name = lang:get(<<"[极品]4星神战项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52055,
		    item_bid = 10040203,
		    item_name = lang:get(<<"[极品]4星神战戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52056,
		    item_bid = 10040204,
		    item_name = lang:get(<<"[极品]4星神战手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52057,
		    item_bid = 11040201,
		    item_name = lang:get(<<"[极品]4星龙威耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52058,
		    item_bid = 11040202,
		    item_name = lang:get(<<"[极品]4星龙威项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52059,
		    item_bid = 11040203,
		    item_name = lang:get(<<"[极品]4星龙威戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52060,
		    item_bid = 11040204,
		    item_name = lang:get(<<"[极品]4星龙威手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52061,
		    item_bid = 12040201,
		    item_name = lang:get(<<"[极品]4星神愈耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52062,
		    item_bid = 12040202,
		    item_name = lang:get(<<"[极品]4星神愈项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52063,
		    item_bid = 12040203,
		    item_name = lang:get(<<"[极品]4星神愈戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52064,
		    item_bid = 12040204,
		    item_name = lang:get(<<"[极品]4星神愈手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52105,
		    item_bid = 13040201,
		    item_name = lang:get(<<"[极品]4星极速耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52106,
		    item_bid = 13040202,
		    item_name = lang:get(<<"[极品]4星极速项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52107,
		    item_bid = 13040203,
		    item_name = lang:get(<<"[极品]4星极速戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52108,
		    item_bid = 13040204,
		    item_name = lang:get(<<"[极品]4星极速手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52109,
		    item_bid = 14040201,
		    item_name = lang:get(<<"[极品]4星玄护耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52110,
		    item_bid = 14040202,
		    item_name = lang:get(<<"[极品]4星玄护项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52111,
		    item_bid = 14040203,
		    item_name = lang:get(<<"[极品]4星玄护戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52112,
		    item_bid = 14040204,
		    item_name = lang:get(<<"[极品]4星玄护手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 50,
		    buy_condit = 15000},
     #exchange_data{type = 52, id = 52065,
		    item_bid = 5050201,
		    item_name = lang:get(<<"[极品]5星穿甲耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52066,
		    item_bid = 5050202,
		    item_name = lang:get(<<"[极品]5星穿甲项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52067,
		    item_bid = 5050203,
		    item_name = lang:get(<<"[极品]5星穿甲戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52068,
		    item_bid = 5050204,
		    item_name = lang:get(<<"[极品]5星穿甲手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52069,
		    item_bid = 6050201,
		    item_name = lang:get(<<"[极品]5星破法耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52070,
		    item_bid = 6050202,
		    item_name = lang:get(<<"[极品]5星破法项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52071,
		    item_bid = 6050203,
		    item_name = lang:get(<<"[极品]5星破法戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52072,
		    item_bid = 6050204,
		    item_name = lang:get(<<"[极品]5星破法手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52073,
		    item_bid = 7050201,
		    item_name = lang:get(<<"[极品]5星斗战耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52074,
		    item_bid = 7050202,
		    item_name = lang:get(<<"[极品]5星斗战项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52075,
		    item_bid = 7050203,
		    item_name = lang:get(<<"[极品]5星斗战戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52076,
		    item_bid = 7050204,
		    item_name = lang:get(<<"[极品]5星斗战手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52077,
		    item_bid = 8050201,
		    item_name = lang:get(<<"[极品]5星镇灵耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52078,
		    item_bid = 8050202,
		    item_name = lang:get(<<"[极品]5星镇灵项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52079,
		    item_bid = 8050203,
		    item_name = lang:get(<<"[极品]5星镇灵戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52080,
		    item_bid = 8050204,
		    item_name = lang:get(<<"[极品]5星镇灵手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 60,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52081,
		    item_bid = 9050201,
		    item_name = lang:get(<<"[极品]5星魔甲耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52082,
		    item_bid = 9050202,
		    item_name = lang:get(<<"[极品]5星魔甲项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52083,
		    item_bid = 9050203,
		    item_name = lang:get(<<"[极品]5星魔甲戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52084,
		    item_bid = 9050204,
		    item_name = lang:get(<<"[极品]5星魔甲手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52085,
		    item_bid = 10050201,
		    item_name = lang:get(<<"[极品]5星神战耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52086,
		    item_bid = 10050202,
		    item_name = lang:get(<<"[极品]5星神战项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52087,
		    item_bid = 10050203,
		    item_name = lang:get(<<"[极品]5星神战戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52088,
		    item_bid = 10050204,
		    item_name = lang:get(<<"[极品]5星神战手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52089,
		    item_bid = 11050201,
		    item_name = lang:get(<<"[极品]5星龙威耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52090,
		    item_bid = 11050202,
		    item_name = lang:get(<<"[极品]5星龙威项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52091,
		    item_bid = 11050203,
		    item_name = lang:get(<<"[极品]5星龙威戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52092,
		    item_bid = 11050204,
		    item_name = lang:get(<<"[极品]5星龙威手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52093,
		    item_bid = 12050201,
		    item_name = lang:get(<<"[极品]5星神愈耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52094,
		    item_bid = 12050202,
		    item_name = lang:get(<<"[极品]5星神愈项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52095,
		    item_bid = 12050203,
		    item_name = lang:get(<<"[极品]5星神愈戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52096,
		    item_bid = 12050204,
		    item_name = lang:get(<<"[极品]5星神愈手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52113,
		    item_bid = 13050201,
		    item_name = lang:get(<<"[极品]5星极速耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52114,
		    item_bid = 13050202,
		    item_name = lang:get(<<"[极品]5星极速项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52115,
		    item_bid = 13050203,
		    item_name = lang:get(<<"[极品]5星极速戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52116,
		    item_bid = 13050204,
		    item_name = lang:get(<<"[极品]5星极速手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52117,
		    item_bid = 14050201,
		    item_name = lang:get(<<"[极品]5星玄护耳环"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52118,
		    item_bid = 14050202,
		    item_name = lang:get(<<"[极品]5星玄护项链"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52119,
		    item_bid = 14050203,
		    item_name = lang:get(<<"[极品]5星玄护戒指"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000},
     #exchange_data{type = 52, id = 52120,
		    item_bid = 14050204,
		    item_name = lang:get(<<"[极品]5星玄护手镯"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 100,
		    buy_condit = 24000}];
list_by_type(51) ->
    [#exchange_data{type = 51, id = 51092, item_bid = 39039,
		    item_name = lang:get(<<"Rương Ninja Tự Chọn"/utf8>>),
		    item_num = 1, pay_type = feather_exchange, price = 150,
		    limit_day = 0},
     #exchange_data{type = 51, id = 51093, item_bid = 28923,
		    item_name = lang:get(<<"Mảnh Madara&Hashirama"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 300,
		    limit_day = 5},
     #exchange_data{type = 51, id = 51094, item_bid = 28922,
		    item_name =
			lang:get(<<"Mảnh Kaguya: Amenominaka"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 300,
		    limit_day = 5},
     #exchange_data{type = 51, id = 51095, item_bid = 28921,
		    item_name =
			lang:get(<<"Mảnh Sasuke: Supporting Kage"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 300,
		    limit_day = 5},
     #exchange_data{type = 51, id = 51096, item_bid = 27923,
		    item_name = lang:get(<<"Mảnh Hashirama&Madara"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 300,
		    limit_day = 5},
     #exchange_data{type = 51, id = 51097, item_bid = 27922,
		    item_name =
			lang:get(<<"Mảnh Minato: Flame Hashira"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 300,
		    limit_day = 5},
     #exchange_data{type = 51, id = 51098, item_bid = 27921,
		    item_name =
			lang:get(<<"Mảnh Jiraiya: Sage Mode"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 300,
		    limit_day = 5},
     #exchange_data{type = 51, id = 51099, item_bid = 28920,
		    item_name = lang:get(<<"Mảnh Obito&Kakashi"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51100, item_bid = 28919,
		    item_name = lang:get(<<"Mảnh Madara: Six Paths"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51101, item_bid = 28918,
		    item_name =
			lang:get(<<"Mảnh Isshiki: Kāma Reincarnated"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51102, item_bid = 28917,
		    item_name = lang:get(<<"Mảnh Itachi: Susanoo"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51103, item_bid = 27920,
		    item_name = lang:get(<<"Mảnh Minato: Sage Mode"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51104, item_bid = 27919,
		    item_name = lang:get(<<"Mảnh Naruto: Asura"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51105, item_bid = 27918,
		    item_name =
			lang:get(<<"Mảnh Sakura: Road to Ninja"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51106, item_bid = 27917,
		    item_name = lang:get(<<"Mảnh Naruto: Tiên Hồ"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51107, item_bid = 26917,
		    item_name = lang:get(<<"Mảnh Hinata: The Last"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51108, item_bid = 26915,
		    item_name =
			lang:get(<<"Mảnh Boruto: Momoshiki Ego"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51109, item_bid = 25917,
		    item_name = lang:get(<<"Mảnh Sasuke: The Last"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51110, item_bid = 25916,
		    item_name = lang:get(<<"Mảnh A&Killer B"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7},
     #exchange_data{type = 51, id = 51111, item_bid = 24917,
		    item_name =
			lang:get(<<"Mảnh Kushina: Kurama Possessed"/utf8>>),
		    item_num = 50, pay_type = feather_exchange, price = 250,
		    limit_day = 7}];
list_by_type(28) ->
    [#exchange_data{type = 28, id = 10030, item_bid = 10030,
		    item_name = lang:get(<<"天界神石"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 5,
		    limit_day = 100, lev = 105},
     #exchange_data{type = 28, id = 99010101,
		    item_bid = 99010101,
		    item_name = lang:get(<<"1星勇气耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010201,
		    item_bid = 99010201,
		    item_name = lang:get(<<"2星勇气耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010301,
		    item_bid = 99010301,
		    item_name = lang:get(<<"3星勇气耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010401,
		    item_bid = 99010401,
		    item_name = lang:get(<<"4星勇气耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99010501,
		    item_bid = 99010501,
		    item_name = lang:get(<<"5星勇气耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99010102,
		    item_bid = 99010102,
		    item_name = lang:get(<<"1星勇气项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010202,
		    item_bid = 99010202,
		    item_name = lang:get(<<"2星勇气项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010302,
		    item_bid = 99010302,
		    item_name = lang:get(<<"3星勇气项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010402,
		    item_bid = 99010402,
		    item_name = lang:get(<<"4星勇气项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99010502,
		    item_bid = 99010502,
		    item_name = lang:get(<<"5星勇气项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99010103,
		    item_bid = 99010103,
		    item_name = lang:get(<<"1星勇气戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010203,
		    item_bid = 99010203,
		    item_name = lang:get(<<"2星勇气戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010303,
		    item_bid = 99010303,
		    item_name = lang:get(<<"3星勇气戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010403,
		    item_bid = 99010403,
		    item_name = lang:get(<<"4星勇气戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99010503,
		    item_bid = 99010503,
		    item_name = lang:get(<<"5星勇气戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99010104,
		    item_bid = 99010104,
		    item_name = lang:get(<<"1星勇气手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010204,
		    item_bid = 99010204,
		    item_name = lang:get(<<"2星勇气手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010304,
		    item_bid = 99010304,
		    item_name = lang:get(<<"3星勇气手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99010404,
		    item_bid = 99010404,
		    item_name = lang:get(<<"4星勇气手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99010504,
		    item_bid = 99010504,
		    item_name = lang:get(<<"5星勇气手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99020101,
		    item_bid = 99020101,
		    item_name = lang:get(<<"1星狂怒耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020201,
		    item_bid = 99020201,
		    item_name = lang:get(<<"2星狂怒耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020301,
		    item_bid = 99020301,
		    item_name = lang:get(<<"3星狂怒耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020401,
		    item_bid = 99020401,
		    item_name = lang:get(<<"4星狂怒耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99020501,
		    item_bid = 99020501,
		    item_name = lang:get(<<"5星狂怒耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99020102,
		    item_bid = 99020102,
		    item_name = lang:get(<<"1星狂怒项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020202,
		    item_bid = 99020202,
		    item_name = lang:get(<<"2星狂怒项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020302,
		    item_bid = 99020302,
		    item_name = lang:get(<<"3星狂怒项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020402,
		    item_bid = 99020402,
		    item_name = lang:get(<<"4星狂怒项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99020502,
		    item_bid = 99020502,
		    item_name = lang:get(<<"5星狂怒项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99020103,
		    item_bid = 99020103,
		    item_name = lang:get(<<"1星狂怒戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020203,
		    item_bid = 99020203,
		    item_name = lang:get(<<"2星狂怒戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020303,
		    item_bid = 99020303,
		    item_name = lang:get(<<"3星狂怒戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020403,
		    item_bid = 99020403,
		    item_name = lang:get(<<"4星狂怒戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99020503,
		    item_bid = 99020503,
		    item_name = lang:get(<<"5星狂怒戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99020104,
		    item_bid = 99020104,
		    item_name = lang:get(<<"1星狂怒手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020204,
		    item_bid = 99020204,
		    item_name = lang:get(<<"2星狂怒手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020304,
		    item_bid = 99020304,
		    item_name = lang:get(<<"3星狂怒手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99020404,
		    item_bid = 99020404,
		    item_name = lang:get(<<"4星狂怒手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99020504,
		    item_bid = 99020504,
		    item_name = lang:get(<<"5星狂怒手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99030101,
		    item_bid = 99030101,
		    item_name = lang:get(<<"1星斗志耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030201,
		    item_bid = 99030201,
		    item_name = lang:get(<<"2星斗志耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030301,
		    item_bid = 99030301,
		    item_name = lang:get(<<"3星斗志耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030401,
		    item_bid = 99030401,
		    item_name = lang:get(<<"4星斗志耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99030501,
		    item_bid = 99030501,
		    item_name = lang:get(<<"5星斗志耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99030102,
		    item_bid = 99030102,
		    item_name = lang:get(<<"1星斗志项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030202,
		    item_bid = 99030202,
		    item_name = lang:get(<<"2星斗志项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030302,
		    item_bid = 99030302,
		    item_name = lang:get(<<"3星斗志项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030402,
		    item_bid = 99030402,
		    item_name = lang:get(<<"4星斗志项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99030502,
		    item_bid = 99030502,
		    item_name = lang:get(<<"5星斗志项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99030103,
		    item_bid = 99030103,
		    item_name = lang:get(<<"1星斗志戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030203,
		    item_bid = 99030203,
		    item_name = lang:get(<<"2星斗志戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030303,
		    item_bid = 99030303,
		    item_name = lang:get(<<"3星斗志戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030403,
		    item_bid = 99030403,
		    item_name = lang:get(<<"4星斗志戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99030503,
		    item_bid = 99030503,
		    item_name = lang:get(<<"5星斗志戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99030104,
		    item_bid = 99030104,
		    item_name = lang:get(<<"1星斗志手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030204,
		    item_bid = 99030204,
		    item_name = lang:get(<<"2星斗志手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030304,
		    item_bid = 99030304,
		    item_name = lang:get(<<"3星斗志手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99030404,
		    item_bid = 99030404,
		    item_name = lang:get(<<"4星斗志手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99030504,
		    item_bid = 99030504,
		    item_name = lang:get(<<"5星斗志手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99040101,
		    item_bid = 99040101,
		    item_name = lang:get(<<"1星灵咏耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040201,
		    item_bid = 99040201,
		    item_name = lang:get(<<"2星灵咏耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040301,
		    item_bid = 99040301,
		    item_name = lang:get(<<"3星灵咏耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040401,
		    item_bid = 99040401,
		    item_name = lang:get(<<"4星灵咏耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99040501,
		    item_bid = 99040501,
		    item_name = lang:get(<<"5星灵咏耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99040102,
		    item_bid = 99040102,
		    item_name = lang:get(<<"1星灵咏项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040202,
		    item_bid = 99040202,
		    item_name = lang:get(<<"2星灵咏项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040302,
		    item_bid = 99040302,
		    item_name = lang:get(<<"3星灵咏项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040402,
		    item_bid = 99040402,
		    item_name = lang:get(<<"4星灵咏项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99040502,
		    item_bid = 99040502,
		    item_name = lang:get(<<"5星灵咏项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99040103,
		    item_bid = 99040103,
		    item_name = lang:get(<<"1星灵咏戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040203,
		    item_bid = 99040203,
		    item_name = lang:get(<<"2星灵咏戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040303,
		    item_bid = 99040303,
		    item_name = lang:get(<<"3星灵咏戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040403,
		    item_bid = 99040403,
		    item_name = lang:get(<<"4星灵咏戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99040503,
		    item_bid = 99040503,
		    item_name = lang:get(<<"5星灵咏戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99040104,
		    item_bid = 99040104,
		    item_name = lang:get(<<"1星灵咏手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 40,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040204,
		    item_bid = 99040204,
		    item_name = lang:get(<<"2星灵咏手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 70,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040304,
		    item_bid = 99040304,
		    item_name = lang:get(<<"3星灵咏手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 0},
     #exchange_data{type = 28, id = 99040404,
		    item_bid = 99040404,
		    item_name = lang:get(<<"4星灵咏手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 160,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99040504,
		    item_bid = 99040504,
		    item_name = lang:get(<<"5星灵咏手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 24000},
     #exchange_data{type = 28, id = 99050101,
		    item_bid = 99050101,
		    item_name = lang:get(<<"1星穿甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050201,
		    item_bid = 99050201,
		    item_name = lang:get(<<"2星穿甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050301,
		    item_bid = 99050301,
		    item_name = lang:get(<<"3星穿甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050401,
		    item_bid = 99050401,
		    item_name = lang:get(<<"4星穿甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99050501,
		    item_bid = 99050501,
		    item_name = lang:get(<<"5星穿甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99050102,
		    item_bid = 99050102,
		    item_name = lang:get(<<"1星穿甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050202,
		    item_bid = 99050202,
		    item_name = lang:get(<<"2星穿甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050302,
		    item_bid = 99050302,
		    item_name = lang:get(<<"3星穿甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050402,
		    item_bid = 99050402,
		    item_name = lang:get(<<"4星穿甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99050502,
		    item_bid = 99050502,
		    item_name = lang:get(<<"5星穿甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99050103,
		    item_bid = 99050103,
		    item_name = lang:get(<<"1星穿甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050203,
		    item_bid = 99050203,
		    item_name = lang:get(<<"2星穿甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050303,
		    item_bid = 99050303,
		    item_name = lang:get(<<"3星穿甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050403,
		    item_bid = 99050403,
		    item_name = lang:get(<<"4星穿甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99050503,
		    item_bid = 99050503,
		    item_name = lang:get(<<"5星穿甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99050104,
		    item_bid = 99050104,
		    item_name = lang:get(<<"1星穿甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050204,
		    item_bid = 99050204,
		    item_name = lang:get(<<"2星穿甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050304,
		    item_bid = 99050304,
		    item_name = lang:get(<<"3星穿甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99050404,
		    item_bid = 99050404,
		    item_name = lang:get(<<"4星穿甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99050504,
		    item_bid = 99050504,
		    item_name = lang:get(<<"5星穿甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99060101,
		    item_bid = 99060101,
		    item_name = lang:get(<<"1星破法耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060201,
		    item_bid = 99060201,
		    item_name = lang:get(<<"2星破法耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060301,
		    item_bid = 99060301,
		    item_name = lang:get(<<"3星破法耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060401,
		    item_bid = 99060401,
		    item_name = lang:get(<<"4星破法耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99060501,
		    item_bid = 99060501,
		    item_name = lang:get(<<"5星破法耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99060102,
		    item_bid = 99060102,
		    item_name = lang:get(<<"1星破法项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060202,
		    item_bid = 99060202,
		    item_name = lang:get(<<"2星破法项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060302,
		    item_bid = 99060302,
		    item_name = lang:get(<<"3星破法项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060402,
		    item_bid = 99060402,
		    item_name = lang:get(<<"4星破法项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99060502,
		    item_bid = 99060502,
		    item_name = lang:get(<<"5星破法项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99060103,
		    item_bid = 99060103,
		    item_name = lang:get(<<"1星破法戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060203,
		    item_bid = 99060203,
		    item_name = lang:get(<<"2星破法戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060303,
		    item_bid = 99060303,
		    item_name = lang:get(<<"3星破法戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060403,
		    item_bid = 99060403,
		    item_name = lang:get(<<"4星破法戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99060503,
		    item_bid = 99060503,
		    item_name = lang:get(<<"5星破法戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99060104,
		    item_bid = 99060104,
		    item_name = lang:get(<<"1星破法手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060204,
		    item_bid = 99060204,
		    item_name = lang:get(<<"2星破法手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060304,
		    item_bid = 99060304,
		    item_name = lang:get(<<"3星破法手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99060404,
		    item_bid = 99060404,
		    item_name = lang:get(<<"4星破法手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99060504,
		    item_bid = 99060504,
		    item_name = lang:get(<<"5星破法手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99070101,
		    item_bid = 99070101,
		    item_name = lang:get(<<"1星斗战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070201,
		    item_bid = 99070201,
		    item_name = lang:get(<<"2星斗战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070301,
		    item_bid = 99070301,
		    item_name = lang:get(<<"3星斗战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070401,
		    item_bid = 99070401,
		    item_name = lang:get(<<"4星斗战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99070501,
		    item_bid = 99070501,
		    item_name = lang:get(<<"5星斗战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99070102,
		    item_bid = 99070102,
		    item_name = lang:get(<<"1星斗战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070202,
		    item_bid = 99070202,
		    item_name = lang:get(<<"2星斗战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070302,
		    item_bid = 99070302,
		    item_name = lang:get(<<"3星斗战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070402,
		    item_bid = 99070402,
		    item_name = lang:get(<<"4星斗战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99070502,
		    item_bid = 99070502,
		    item_name = lang:get(<<"5星斗战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99070103,
		    item_bid = 99070103,
		    item_name = lang:get(<<"1星斗战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070203,
		    item_bid = 99070203,
		    item_name = lang:get(<<"2星斗战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070303,
		    item_bid = 99070303,
		    item_name = lang:get(<<"3星斗战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070403,
		    item_bid = 99070403,
		    item_name = lang:get(<<"4星斗战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99070503,
		    item_bid = 99070503,
		    item_name = lang:get(<<"5星斗战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99070104,
		    item_bid = 99070104,
		    item_name = lang:get(<<"1星斗战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070204,
		    item_bid = 99070204,
		    item_name = lang:get(<<"2星斗战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070304,
		    item_bid = 99070304,
		    item_name = lang:get(<<"3星斗战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99070404,
		    item_bid = 99070404,
		    item_name = lang:get(<<"4星斗战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99070504,
		    item_bid = 99070504,
		    item_name = lang:get(<<"5星斗战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99080101,
		    item_bid = 99080101,
		    item_name = lang:get(<<"1星镇灵耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080201,
		    item_bid = 99080201,
		    item_name = lang:get(<<"2星镇灵耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080301,
		    item_bid = 99080301,
		    item_name = lang:get(<<"3星镇灵耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080401,
		    item_bid = 99080401,
		    item_name = lang:get(<<"4星镇灵耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99080501,
		    item_bid = 99080501,
		    item_name = lang:get(<<"5星镇灵耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99080102,
		    item_bid = 99080102,
		    item_name = lang:get(<<"1星镇灵项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080202,
		    item_bid = 99080202,
		    item_name = lang:get(<<"2星镇灵项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080302,
		    item_bid = 99080302,
		    item_name = lang:get(<<"3星镇灵项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080402,
		    item_bid = 99080402,
		    item_name = lang:get(<<"4星镇灵项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99080502,
		    item_bid = 99080502,
		    item_name = lang:get(<<"5星镇灵项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99080103,
		    item_bid = 99080103,
		    item_name = lang:get(<<"1星镇灵戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080203,
		    item_bid = 99080203,
		    item_name = lang:get(<<"2星镇灵戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080303,
		    item_bid = 99080303,
		    item_name = lang:get(<<"3星镇灵戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080403,
		    item_bid = 99080403,
		    item_name = lang:get(<<"4星镇灵戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99080503,
		    item_bid = 99080503,
		    item_name = lang:get(<<"5星镇灵戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99080104,
		    item_bid = 99080104,
		    item_name = lang:get(<<"1星镇灵手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 50,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080204,
		    item_bid = 99080204,
		    item_name = lang:get(<<"2星镇灵手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 90,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080304,
		    item_bid = 99080304,
		    item_name = lang:get(<<"3星镇灵手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 130,
		    lev = 105, buy_condit = 15000},
     #exchange_data{type = 28, id = 99080404,
		    item_bid = 99080404,
		    item_name = lang:get(<<"4星镇灵手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 200,
		    lev = 105, buy_condit = 18000},
     #exchange_data{type = 28, id = 99080504,
		    item_bid = 99080504,
		    item_name = lang:get(<<"5星镇灵手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 290,
		    lev = 105, buy_condit = 27000},
     #exchange_data{type = 28, id = 99090101,
		    item_bid = 99090101,
		    item_name = lang:get(<<"1星魔甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090201,
		    item_bid = 99090201,
		    item_name = lang:get(<<"2星魔甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090301,
		    item_bid = 99090301,
		    item_name = lang:get(<<"3星魔甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090401,
		    item_bid = 99090401,
		    item_name = lang:get(<<"4星魔甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090501,
		    item_bid = 99090501,
		    item_name = lang:get(<<"5星魔甲耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99090102,
		    item_bid = 99090102,
		    item_name = lang:get(<<"1星魔甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090202,
		    item_bid = 99090202,
		    item_name = lang:get(<<"2星魔甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090302,
		    item_bid = 99090302,
		    item_name = lang:get(<<"3星魔甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090402,
		    item_bid = 99090402,
		    item_name = lang:get(<<"4星魔甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090502,
		    item_bid = 99090502,
		    item_name = lang:get(<<"5星魔甲项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99090103,
		    item_bid = 99090103,
		    item_name = lang:get(<<"1星魔甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090203,
		    item_bid = 99090203,
		    item_name = lang:get(<<"2星魔甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090303,
		    item_bid = 99090303,
		    item_name = lang:get(<<"3星魔甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090403,
		    item_bid = 99090403,
		    item_name = lang:get(<<"4星魔甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090503,
		    item_bid = 99090503,
		    item_name = lang:get(<<"5星魔甲戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99090104,
		    item_bid = 99090104,
		    item_name = lang:get(<<"1星魔甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090204,
		    item_bid = 99090204,
		    item_name = lang:get(<<"2星魔甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090304,
		    item_bid = 99090304,
		    item_name = lang:get(<<"3星魔甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090404,
		    item_bid = 99090404,
		    item_name = lang:get(<<"4星魔甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99090504,
		    item_bid = 99090504,
		    item_name = lang:get(<<"5星魔甲手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99100101,
		    item_bid = 99100101,
		    item_name = lang:get(<<"1星神战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100201,
		    item_bid = 99100201,
		    item_name = lang:get(<<"2星神战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100301,
		    item_bid = 99100301,
		    item_name = lang:get(<<"3星神战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100401,
		    item_bid = 99100401,
		    item_name = lang:get(<<"4星神战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100501,
		    item_bid = 99100501,
		    item_name = lang:get(<<"5星神战耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99100102,
		    item_bid = 99100102,
		    item_name = lang:get(<<"1星神战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100202,
		    item_bid = 99100202,
		    item_name = lang:get(<<"2星神战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100302,
		    item_bid = 99100302,
		    item_name = lang:get(<<"3星神战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100402,
		    item_bid = 99100402,
		    item_name = lang:get(<<"4星神战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100502,
		    item_bid = 99100502,
		    item_name = lang:get(<<"5星神战项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99100103,
		    item_bid = 99100103,
		    item_name = lang:get(<<"1星神战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100203,
		    item_bid = 99100203,
		    item_name = lang:get(<<"2星神战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100303,
		    item_bid = 99100303,
		    item_name = lang:get(<<"3星神战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100403,
		    item_bid = 99100403,
		    item_name = lang:get(<<"4星神战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100503,
		    item_bid = 99100503,
		    item_name = lang:get(<<"5星神战戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99100104,
		    item_bid = 99100104,
		    item_name = lang:get(<<"1星神战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100204,
		    item_bid = 99100204,
		    item_name = lang:get(<<"2星神战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100304,
		    item_bid = 99100304,
		    item_name = lang:get(<<"3星神战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100404,
		    item_bid = 99100404,
		    item_name = lang:get(<<"4星神战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99100504,
		    item_bid = 99100504,
		    item_name = lang:get(<<"5星神战手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99110101,
		    item_bid = 99110101,
		    item_name = lang:get(<<"1星龙威耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110201,
		    item_bid = 99110201,
		    item_name = lang:get(<<"2星龙威耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110301,
		    item_bid = 99110301,
		    item_name = lang:get(<<"3星龙威耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110401,
		    item_bid = 99110401,
		    item_name = lang:get(<<"4星龙威耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110501,
		    item_bid = 99110501,
		    item_name = lang:get(<<"5星龙威耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99110102,
		    item_bid = 99110102,
		    item_name = lang:get(<<"1星龙威项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110202,
		    item_bid = 99110202,
		    item_name = lang:get(<<"2星龙威项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110302,
		    item_bid = 99110302,
		    item_name = lang:get(<<"3星龙威项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110402,
		    item_bid = 99110402,
		    item_name = lang:get(<<"4星龙威项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110502,
		    item_bid = 99110502,
		    item_name = lang:get(<<"5星龙威项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99110103,
		    item_bid = 99110103,
		    item_name = lang:get(<<"1星龙威戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110203,
		    item_bid = 99110203,
		    item_name = lang:get(<<"2星龙威戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110303,
		    item_bid = 99110303,
		    item_name = lang:get(<<"3星龙威戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110403,
		    item_bid = 99110403,
		    item_name = lang:get(<<"4星龙威戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110503,
		    item_bid = 99110503,
		    item_name = lang:get(<<"5星龙威戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99110104,
		    item_bid = 99110104,
		    item_name = lang:get(<<"1星龙威手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110204,
		    item_bid = 99110204,
		    item_name = lang:get(<<"2星龙威手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110304,
		    item_bid = 99110304,
		    item_name = lang:get(<<"3星龙威手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110404,
		    item_bid = 99110404,
		    item_name = lang:get(<<"4星龙威手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99110504,
		    item_bid = 99110504,
		    item_name = lang:get(<<"5星龙威手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99120101,
		    item_bid = 99120101,
		    item_name = lang:get(<<"1星神愈耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120201,
		    item_bid = 99120201,
		    item_name = lang:get(<<"2星神愈耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120301,
		    item_bid = 99120301,
		    item_name = lang:get(<<"3星神愈耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120401,
		    item_bid = 99120401,
		    item_name = lang:get(<<"4星神愈耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120501,
		    item_bid = 99120501,
		    item_name = lang:get(<<"5星神愈耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99120102,
		    item_bid = 99120102,
		    item_name = lang:get(<<"1星神愈项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120202,
		    item_bid = 99120202,
		    item_name = lang:get(<<"2星神愈项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120302,
		    item_bid = 99120302,
		    item_name = lang:get(<<"3星神愈项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120402,
		    item_bid = 99120402,
		    item_name = lang:get(<<"4星神愈项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120502,
		    item_bid = 99120502,
		    item_name = lang:get(<<"5星神愈项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99120103,
		    item_bid = 99120103,
		    item_name = lang:get(<<"1星神愈戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120203,
		    item_bid = 99120203,
		    item_name = lang:get(<<"2星神愈戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120303,
		    item_bid = 99120303,
		    item_name = lang:get(<<"3星神愈戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120403,
		    item_bid = 99120403,
		    item_name = lang:get(<<"4星神愈戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120503,
		    item_bid = 99120503,
		    item_name = lang:get(<<"5星神愈戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99120104,
		    item_bid = 99120104,
		    item_name = lang:get(<<"1星神愈手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120204,
		    item_bid = 99120204,
		    item_name = lang:get(<<"2星神愈手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120304,
		    item_bid = 99120304,
		    item_name = lang:get(<<"3星神愈手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120404,
		    item_bid = 99120404,
		    item_name = lang:get(<<"4星神愈手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99120504,
		    item_bid = 99120504,
		    item_name = lang:get(<<"5星神愈手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99130101,
		    item_bid = 99130101,
		    item_name = lang:get(<<"1星极速耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130201,
		    item_bid = 99130201,
		    item_name = lang:get(<<"2星极速耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130301,
		    item_bid = 99130301,
		    item_name = lang:get(<<"3星极速耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130401,
		    item_bid = 99130401,
		    item_name = lang:get(<<"4星极速耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130501,
		    item_bid = 99130501,
		    item_name = lang:get(<<"5星极速耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99130102,
		    item_bid = 99130102,
		    item_name = lang:get(<<"1星极速项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130202,
		    item_bid = 99130202,
		    item_name = lang:get(<<"2星极速项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130302,
		    item_bid = 99130302,
		    item_name = lang:get(<<"3星极速项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130402,
		    item_bid = 99130402,
		    item_name = lang:get(<<"4星极速项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130502,
		    item_bid = 99130502,
		    item_name = lang:get(<<"5星极速项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99130103,
		    item_bid = 99130103,
		    item_name = lang:get(<<"1星极速戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130203,
		    item_bid = 99130203,
		    item_name = lang:get(<<"2星极速戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130303,
		    item_bid = 99130303,
		    item_name = lang:get(<<"3星极速戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130403,
		    item_bid = 99130403,
		    item_name = lang:get(<<"4星极速戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130503,
		    item_bid = 99130503,
		    item_name = lang:get(<<"5星极速戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99130104,
		    item_bid = 99130104,
		    item_name = lang:get(<<"1星极速手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130204,
		    item_bid = 99130204,
		    item_name = lang:get(<<"2星极速手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130304,
		    item_bid = 99130304,
		    item_name = lang:get(<<"3星极速手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130404,
		    item_bid = 99130404,
		    item_name = lang:get(<<"4星极速手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99130504,
		    item_bid = 99130504,
		    item_name = lang:get(<<"5星极速手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99140101,
		    item_bid = 99140101,
		    item_name = lang:get(<<"1星玄护耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140201,
		    item_bid = 99140201,
		    item_name = lang:get(<<"2星玄护耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140301,
		    item_bid = 99140301,
		    item_name = lang:get(<<"3星玄护耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140401,
		    item_bid = 99140401,
		    item_name = lang:get(<<"4星玄护耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140501,
		    item_bid = 99140501,
		    item_name = lang:get(<<"5星玄护耳环"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99140102,
		    item_bid = 99140102,
		    item_name = lang:get(<<"1星玄护项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140202,
		    item_bid = 99140202,
		    item_name = lang:get(<<"2星玄护项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140302,
		    item_bid = 99140302,
		    item_name = lang:get(<<"3星玄护项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140402,
		    item_bid = 99140402,
		    item_name = lang:get(<<"4星玄护项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140502,
		    item_bid = 99140502,
		    item_name = lang:get(<<"5星玄护项链"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99140103,
		    item_bid = 99140103,
		    item_name = lang:get(<<"1星玄护戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140203,
		    item_bid = 99140203,
		    item_name = lang:get(<<"2星玄护戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140303,
		    item_bid = 99140303,
		    item_name = lang:get(<<"3星玄护戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140403,
		    item_bid = 99140403,
		    item_name = lang:get(<<"4星玄护戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140503,
		    item_bid = 99140503,
		    item_name = lang:get(<<"5星玄护戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000},
     #exchange_data{type = 28, id = 99140104,
		    item_bid = 99140104,
		    item_name = lang:get(<<"1星玄护手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 60,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140204,
		    item_bid = 99140204,
		    item_name = lang:get(<<"2星玄护手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 110,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140304,
		    item_bid = 99140304,
		    item_name = lang:get(<<"3星玄护手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 170,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140404,
		    item_bid = 99140404,
		    item_name = lang:get(<<"4星玄护手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 240,
		    lev = 105, buy_condit = 20000},
     #exchange_data{type = 28, id = 99140504,
		    item_bid = 99140504,
		    item_name = lang:get(<<"5星玄护手镯"/utf8>>), item_num = 1,
		    bind = 1, pay_type = holy_eqm_coin, price = 360,
		    lev = 105, buy_condit = 30000}];
list_by_type(31) ->
    [#exchange_data{type = 31, id = 31001, item_bid = 24900,
		    item_name = lang:get(<<"5星娜迦公主碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 20, lev = {1, 999}},
     #exchange_data{type = 31, id = 31002, item_bid = 24902,
		    item_name = lang:get(<<"5星冰霜巨龙碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 20, lev = {1, 999}},
     #exchange_data{type = 31, id = 31003, item_bid = 24903,
		    item_name = lang:get(<<"5星泰坦碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31004, item_bid = 24904,
		    item_name = lang:get(<<"5星波塞冬碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31005, item_bid = 24905,
		    item_name = lang:get(<<"5星派西斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 20,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31006, item_bid = 24906,
		    item_name = lang:get(<<"5星少年梅林碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 20, lev = {1, 999}},
     #exchange_data{type = 31, id = 31007, item_bid = 24907,
		    item_name = lang:get(<<"5星海宁芙碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 20,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31008, item_bid = 24908,
		    item_name = lang:get(<<"5星阿瑞斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 20,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31009, item_bid = 24901,
		    item_name = lang:get(<<"5星冰雪女王碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 35, lev = {1, 999}},
     #exchange_data{type = 31, id = 31064, item_bid = 24909,
		    item_name = lang:get(<<"5星耶梦加得碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 35, lev = {1, 999}},
     #exchange_data{type = 31, id = 31069, item_bid = 24910,
		    item_name = lang:get(<<"5星酒神碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31077, item_bid = 24911,
		    item_name = lang:get(<<"5星利维坦碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31010, item_bid = 25900,
		    item_name = lang:get(<<"5星炽天使碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 20,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31011, item_bid = 25901,
		    item_name = lang:get(<<"5星炎魔之王碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 20, lev = {1, 999}},
     #exchange_data{type = 31, id = 31012, item_bid = 25902,
		    item_name = lang:get(<<"5星剑豪卡赞碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 20, lev = {1, 999}},
     #exchange_data{type = 31, id = 31013, item_bid = 25903,
		    item_name = lang:get(<<"5星菲尼克斯碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 20, lev = {1, 999}},
     #exchange_data{type = 31, id = 31014, item_bid = 25904,
		    item_name = lang:get(<<"5星阿波罗碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 20,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31015, item_bid = 25905,
		    item_name = lang:get(<<"5星吸血伯爵碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 20, lev = {1, 999}},
     #exchange_data{type = 31, id = 31063, item_bid = 25908,
		    item_name = lang:get(<<"5星洛基碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31016, item_bid = 25906,
		    item_name = lang:get(<<"5星普罗米修斯碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 35, lev = {1, 999}},
     #exchange_data{type = 31, id = 31017, item_bid = 25907,
		    item_name = lang:get(<<"瓦尔基里碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31071, item_bid = 25909,
		    item_name = lang:get(<<"哪吒碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31074, item_bid = 25910,
		    item_name = lang:get(<<"海姆达尔碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31078, item_bid = 25911,
		    item_name = lang:get(<<"阿奇丽碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 45,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31018, item_bid = 26900,
		    item_name = lang:get(<<"5星奥丁碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 20,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31019, item_bid = 26901,
		    item_name = lang:get(<<"5星影刹碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31020, item_bid = 26902,
		    item_name = lang:get(<<"5星凯兰崔尔碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 20, lev = {1, 999}},
     #exchange_data{type = 31, id = 31021, item_bid = 26903,
		    item_name = lang:get(<<"5星魅魔女王碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 20, lev = {1, 999}},
     #exchange_data{type = 31, id = 31022, item_bid = 26904,
		    item_name = lang:get(<<"5星美杜莎碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 20,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31023, item_bid = 26905,
		    item_name = lang:get(<<"5星雅典娜碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 20,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31024, item_bid = 26906,
		    item_name = lang:get(<<"5星潘碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31025, item_bid = 26907,
		    item_name = lang:get(<<"斯芬克斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31066, item_bid = 26908,
		    item_name = lang:get(<<"芬尼尔碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31068, item_bid = 26909,
		    item_name = lang:get(<<"拉塔托斯克碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31073, item_bid = 26910,
		    item_name = lang:get(<<"辛西娅碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31079, item_bid = 26911,
		    item_name = lang:get(<<"塞莎特碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31026, item_bid = 27900,
		    item_name = lang:get(<<"4星伊西斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 25,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31028, item_bid = 27903,
		    item_name = lang:get(<<"5星赫拉碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31029, item_bid = 27904,
		    item_name = lang:get(<<"5星雷神碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 25,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31030, item_bid = 27905,
		    item_name = lang:get(<<"5星盖亚碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31031, item_bid = 27906,
		    item_name = lang:get(<<"5星艾蕾莉亚碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 45, lev = {1, 999}},
     #exchange_data{type = 31, id = 31032, item_bid = 27901,
		    item_name = lang:get(<<"5星神灵大祭司碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 45, lev = {1, 999}},
     #exchange_data{type = 31, id = 31065, item_bid = 27907,
		    item_name = lang:get(<<"宙斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 45,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31070, item_bid = 27908,
		    item_name = lang:get(<<"拉斐尔碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 45,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31076, item_bid = 27909,
		    item_name = lang:get(<<"维纳斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 45,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31033, item_bid = 28900,
		    item_name = lang:get(<<"加百列碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 25,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31034, item_bid = 28901,
		    item_name = lang:get(<<"4星蛇女墨莎碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 45, lev = {1, 999}},
     #exchange_data{type = 31, id = 31035, item_bid = 28902,
		    item_name = lang:get(<<"5星哈迪斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31036, item_bid = 28904,
		    item_name = lang:get(<<"5星亚巴顿碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 35,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31037, item_bid = 28905,
		    item_name = lang:get(<<"5星阿努比斯碎片"/utf8>>),
		    item_num = 50, bind = 1, pay_type = recruithigh_hero,
		    price = 25, lev = {1, 999}},
     #exchange_data{type = 31, id = 31038, item_bid = 28906,
		    item_name = lang:get(<<"5星路西法碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 45,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31039, item_bid = 28903,
		    item_name = lang:get(<<"5星潘多拉碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 45,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31067, item_bid = 28907,
		    item_name = lang:get(<<"黑暗之主碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 45,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31072, item_bid = 28908,
		    item_name = lang:get(<<"海拉碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 45,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31075, item_bid = 28909,
		    item_name = lang:get(<<"尼德霍格碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 45,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31040, item_bid = 24800,
		    item_name = lang:get(<<"阿蒙碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31041, item_bid = 24801,
		    item_name = lang:get(<<"亚瑟碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31042, item_bid = 24802,
		    item_name = lang:get(<<"竖琴海妖碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31043, item_bid = 24803,
		    item_name = lang:get(<<"水元素碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31044, item_bid = 24804,
		    item_name = lang:get(<<"冰晶女巫碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31045, item_bid = 25800,
		    item_name = lang:get(<<"娜迦侍女碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31046, item_bid = 25801,
		    item_name = lang:get(<<"火枪艾克碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31047, item_bid = 25802,
		    item_name = lang:get(<<"凯瑟琳碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31048, item_bid = 25803,
		    item_name = lang:get(<<"阿伽门农碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31049, item_bid = 25804,
		    item_name = lang:get(<<"雷诺蛮锤碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31050, item_bid = 26800,
		    item_name = lang:get(<<"翼女碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31051, item_bid = 26801,
		    item_name = lang:get(<<"吟游诗人碎片"/utf8>>), item_num = 30,
		    bind = 1, pay_type = recruithigh_hero, price = 3,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40001, item_bid = 28910,
		    item_name = lang:get(<<"亡灵收割者碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40002, item_bid = 25912,
		    item_name = lang:get(<<"圣锤提尔碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40003, item_bid = 26912,
		    item_name = lang:get(<<"甘道夫碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 31080, item_bid = 28911,
		    item_name = lang:get(<<"德鲁伊碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40004, item_bid = 24413,
		    item_name = lang:get(<<"光明牧师碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40005, item_bid = 27410,
		    item_name = lang:get(<<"月之祭司碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40006, item_bid = 28412,
		    item_name = lang:get(<<"精灵王子碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40007, item_bid = 27414,
		    item_name = lang:get(<<"丘比特碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40008, item_bid = 26413,
		    item_name = lang:get(<<"毒咒女巫碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40011, item_bid = 27411,
		    item_name = lang:get(<<"阿喀琉斯碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40014, item_bid = 27413,
		    item_name = lang:get(<<"阿喀琉斯碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}},
     #exchange_data{type = 31, id = 40016, item_bid = 25413,
		    item_name = lang:get(<<"阿喀琉斯碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = recruithigh_hero, price = 200,
		    lev = {1, 999}}];
list_by_type(53) ->
    [#exchange_data{type = 53, id = 53002, item_bid = 28905,
		    item_name = lang:get(<<"冰雪女王碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 30, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53003, item_bid = 27900,
		    item_name = lang:get(<<"菲尼克斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 30, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53004, item_bid = 25903,
		    item_name = lang:get(<<"影刹碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 30, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53005, item_bid = 26901,
		    item_name = lang:get(<<"冰霜巨龙碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 30, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53006, item_bid = 24902,
		    item_name = lang:get(<<"派西斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53007, item_bid = 24905,
		    item_name = lang:get(<<"少年梅林碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53008, item_bid = 24906,
		    item_name = lang:get(<<"海宁芙碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53009, item_bid = 24907,
		    item_name = lang:get(<<"阿瑞斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53010, item_bid = 24908,
		    item_name = lang:get(<<"炽天使碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53011, item_bid = 25900,
		    item_name = lang:get(<<"炎魔之王碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53012, item_bid = 25901,
		    item_name = lang:get(<<"剑豪卡赞碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53013, item_bid = 25902,
		    item_name = lang:get(<<"阿波罗碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53014, item_bid = 25904,
		    item_name = lang:get(<<"吸血伯爵碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53015, item_bid = 25905,
		    item_name = lang:get(<<"奥丁碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53016, item_bid = 26900,
		    item_name = lang:get(<<"凯兰崔尔碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53017, item_bid = 26902,
		    item_name = lang:get(<<"魅魔女王碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53018, item_bid = 26903,
		    item_name = lang:get(<<"美杜莎碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53019, item_bid = 26904,
		    item_name = lang:get(<<"雅典娜碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53020, item_bid = 26905,
		    item_name = lang:get(<<"雅典娜碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53021, item_bid = 10403,
		    item_name = lang:get(<<"雅典娜碎片"/utf8>>), item_num = 10,
		    bind = 1, pay_type = 10005, price = 15, limit_month = 0,
		    lev = {1, 999}},
     #exchange_data{type = 53, id = 53022, item_bid = 10510,
		    item_name = lang:get(<<"高级召唤卷"/utf8>>), item_num = 1,
		    bind = 1, pay_type = 10005, price = 1, limit_month = 0,
		    lev = {1, 999}}];
list_by_type(37) ->
    [#exchange_data{type = 37, id = 37001, item_bid = 32,
		    item_name = lang:get(<<"烈阳晶石"/utf8>>), item_num = 10000,
		    bind = 1, pay_type = peak_guess_cent, price = 1000,
		    lev = {55, 999}},
     #exchange_data{type = 37, id = 37002, item_bid = 10040,
		    item_name = lang:get(<<"奥术之尘"/utf8>>), item_num = 100,
		    bind = 1, pay_type = peak_guess_cent, price = 7500,
		    limit_week = 1, lev = {55, 999}},
     #exchange_data{type = 37, id = 37003, item_bid = 10603,
		    item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		    bind = 1, pay_type = peak_guess_cent, price = 3600,
		    limit_month = 2, lev = {55, 999}},
     #exchange_data{type = 37, id = 37004, item_bid = 27901,
		    item_name = lang:get(<<"拉斐尔碎片"/utf8>>), item_num = 5,
		    bind = 1, pay_type = peak_guess_cent, price = 5000,
		    limit_month = 10, lev = {55, 999}},
     #exchange_data{type = 37, id = 37005, item_bid = 28901,
		    item_name = lang:get(<<"哈迪斯碎片"/utf8>>), item_num = 5,
		    bind = 1, pay_type = peak_guess_cent, price = 5000,
		    limit_month = 10, lev = {55, 999}},
     #exchange_data{type = 37, id = 37006, item_bid = 24910,
		    item_name = lang:get(<<"酒神碎片"/utf8>>), item_num = 5,
		    bind = 1, pay_type = peak_guess_cent, price = 3750,
		    limit_month = 10, lev = {55, 999}},
     #exchange_data{type = 37, id = 37007, item_bid = 25910,
		    item_name = lang:get(<<"海姆达尔碎片"/utf8>>), item_num = 5,
		    bind = 1, pay_type = peak_guess_cent, price = 3750,
		    limit_month = 10, lev = {55, 999}},
     #exchange_data{type = 37, id = 37008, item_bid = 26906,
		    item_name = lang:get(<<"辛西娅碎片"/utf8>>), item_num = 5,
		    bind = 1, pay_type = peak_guess_cent, price = 3750,
		    limit_month = 10, lev = {55, 999}},
     #exchange_data{type = 37, id = 37009, item_bid = 14001,
		    item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		    bind = 1, pay_type = peak_guess_cent, price = 5000,
		    limit_week = 1, lev = {55, 999}},
     #exchange_data{type = 37, id = 37010, item_bid = 16201,
		    item_name = lang:get(<<"随机觉醒符石"/utf8>>), item_num = 1,
		    bind = 1, pay_type = peak_guess_cent, price = 10000,
		    limit_week = 1, lev = {160, 999}},
     #exchange_data{type = 37, id = 37011, item_bid = 10460,
		    item_name = lang:get(<<"觉醒石"/utf8>>), item_num = 5,
		    bind = 1, pay_type = peak_guess_cent, price = 12500,
		    limit_week = 2, lev = {160, 999}},
     #exchange_data{type = 37, id = 37012, item_bid = 10470,
		    item_name = lang:get(<<"好运宝珠"/utf8>>), item_num = 1,
		    bind = 1, pay_type = peak_guess_cent, price = 15000,
		    limit_month = 2, lev = {55, 999}}];
list_by_type(36) ->
    [#exchange_data{type = 36, id = 36001, item_bid = 40113,
		    item_name = lang:get(<<"圣光之刃"/utf8>>), item_num = 1,
		    bind = 1, pay_type = cluster_guess_cent, price = 14500,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 36, id = 36002, item_bid = 40213,
		    item_name = lang:get(<<"圣光护甲"/utf8>>), item_num = 1,
		    bind = 1, pay_type = cluster_guess_cent, price = 14500,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 36, id = 36003, item_bid = 40313,
		    item_name = lang:get(<<"圣光头盔"/utf8>>), item_num = 1,
		    bind = 1, pay_type = cluster_guess_cent, price = 14500,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 36, id = 36004, item_bid = 40413,
		    item_name = lang:get(<<"圣光戒指"/utf8>>), item_num = 1,
		    bind = 1, pay_type = cluster_guess_cent, price = 14500,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 36, id = 36005, item_bid = 10450,
		    item_name = lang:get(<<"符文精华"/utf8>>), item_num = 1000,
		    bind = 1, pay_type = cluster_guess_cent, price = 1250,
		    limit_week = 5, lev = {1, 999}},
     #exchange_data{type = 36, id = 36006, item_bid = 10301,
		    item_name = lang:get(<<"冠军之心"/utf8>>), item_num = 1,
		    bind = 1, pay_type = cluster_guess_cent, price = 2500,
		    lev = {1, 999}},
     #exchange_data{type = 36, id = 36007, item_bid = 10095,
		    item_name = lang:get(<<"天晶魔液"/utf8>>), item_num = 200,
		    bind = 1, pay_type = cluster_guess_cent, price = 5000,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 36, id = 36008, item_bid = 10602,
		    item_name = lang:get(<<"符文精华"/utf8>>), item_num = 1,
		    bind = 1, pay_type = cluster_guess_cent, price = 750,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 36, id = 36009, item_bid = 24911,
		    item_name = lang:get(<<"冠军之心"/utf8>>), item_num = 50,
		    bind = 1, pay_type = cluster_guess_cent, price = 37500,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 36, id = 36010, item_bid = 25911,
		    item_name = lang:get(<<"天晶魔液"/utf8>>), item_num = 50,
		    bind = 1, pay_type = cluster_guess_cent, price = 37500,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 36, id = 36011, item_bid = 26909,
		    item_name = lang:get(<<"玄魔蛋"/utf8>>), item_num = 50,
		    bind = 1, pay_type = cluster_guess_cent, price = 37500,
		    limit_week = 1, lev = {1, 999}}];
list_by_type(30) ->
    [#exchange_data{type = 30, id = 30001, item_bid = 40134,
		    item_name = lang:get(<<"神灵大祭司碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = sky_coin, price = 30000,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 30, id = 30002, item_bid = 40234,
		    item_name = lang:get(<<"潘多拉碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = sky_coin, price = 30000,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 30, id = 30003, item_bid = 40334,
		    item_name = lang:get(<<"斯芬克斯碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = sky_coin, price = 30000,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 30, id = 30004, item_bid = 40434,
		    item_name = lang:get(<<"瓦尔基里碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = sky_coin, price = 30000,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 30, id = 30005, item_bid = 39081,
		    item_name = lang:get(<<"冰雪女王碎片"/utf8>>), item_num = 5,
		    bind = 1, pay_type = sky_coin, price = 100,
		    limit_week = 2, lev = {1, 999}},
     #exchange_data{type = 30, id = 30006, item_bid = 37004,
		    item_name = lang:get(<<"圣光之刃"/utf8>>), item_num = 1,
		    bind = 1, pay_type = sky_coin, price = 7000,
		    limit_week = 5, lev = {1, 999}},
     #exchange_data{type = 30, id = 30007, item_bid = 37003,
		    item_name = lang:get(<<"圣光护甲"/utf8>>), item_num = 1,
		    bind = 1, pay_type = sky_coin, price = 5000,
		    limit_week = 10, lev = {1, 999}},
     #exchange_data{type = 30, id = 30008, item_bid = 3,
		    item_name = lang:get(<<"圣光头盔"/utf8>>),
		    item_num = 1000000, bind = 1, pay_type = sky_coin,
		    price = 15000, limit_week = 5, lev = {1, 999}},
     #exchange_data{type = 30, id = 30009, item_bid = 39039,
		    item_name = lang:get(<<"圣光戒指"/utf8>>), item_num = 10,
		    bind = 1, pay_type = sky_coin, price = 30000,
		    limit_week = 1, lev = {1, 999}},
     #exchange_data{type = 30, id = 30010, item_bid = 10450,
		    item_name = lang:get(<<"符文精华"/utf8>>), item_num = 5000,
		    bind = 1, pay_type = sky_coin, price = 999,
		    limit_week = 2, lev = {1, 999}},
     #exchange_data{type = 30, id = 30011, item_bid = 10001,
		    item_name = lang:get(<<"皮肤碎片"/utf8>>), item_num = 10000,
		    bind = 1, pay_type = sky_coin, price = 250,
		    limit_week = 10, lev = {1, 999}},
     #exchange_data{type = 30, id = 30012, item_bid = 39052,
		    item_name = lang:get(<<"语言_ite_1_56_1"/utf8>>),
		    item_num = 50, bind = 1, pay_type = sky_coin,
		    price = 1000, limit_week = 10, lev = {1, 999}}];
list_by_type(42) ->
    [#exchange_data{type = 42, id = 42101,
		    item_bid = 100101,
		    item_name = lang:get(<<"压缩饼干"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 200, limit_soft = 200},
     #exchange_data{type = 42, id = 42102, item_bid = 100102,
		    item_name = lang:get(<<"饭团"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 280, limit_soft = 600},
     #exchange_data{type = 42, id = 42103, item_bid = 100103,
		    item_name = lang:get(<<"蛋糕"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 360, limit_soft = 1000},
     #exchange_data{type = 42, id = 42104, item_bid = 100104,
		    item_name = lang:get(<<"法式面包"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 480, limit_soft = 1400},
     #exchange_data{type = 42, id = 42105, item_bid = 100105,
		    item_name = lang:get(<<"三明治"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 600, limit_soft = 1800},
     #exchange_data{type = 42, id = 42106, item_bid = 100106,
		    item_name = lang:get(<<"汉堡"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 680, limit_soft = 2300},
     #exchange_data{type = 42, id = 42107, item_bid = 100107,
		    item_name = lang:get(<<"披萨"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 760, limit_soft = 2900},
     #exchange_data{type = 42, id = 42108, item_bid = 100108,
		    item_name = lang:get(<<"豪华寿司组"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 880, limit_soft = 3500},
     #exchange_data{type = 42, id = 42201, item_bid = 100201,
		    item_name = lang:get(<<"小礼盒"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 80, limit_day = 2},
     #exchange_data{type = 42, id = 42202, item_bid = 100202,
		    item_name = lang:get(<<"玻璃瓶"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 80, limit_day = 2},
     #exchange_data{type = 42, id = 42203, item_bid = 100203,
		    item_name = lang:get(<<"毛笔"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 80, limit_day = 2},
     #exchange_data{type = 42, id = 42204, item_bid = 100204,
		    item_name = lang:get(<<"傻瓜机"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 80, limit_day = 2},
     #exchange_data{type = 42, id = 42205, item_bid = 100205,
		    item_name = lang:get(<<"手持式探测器"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 80, limit_day = 2},
     #exchange_data{type = 42, id = 42241, item_bid = 100241,
		    item_name = lang:get(<<"宝箱"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 160, limit_day = 2},
     #exchange_data{type = 42, id = 42242, item_bid = 100242,
		    item_name = lang:get(<<"水晶瓶"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 160, limit_day = 2},
     #exchange_data{type = 42, id = 42243, item_bid = 100243,
		    item_name = lang:get(<<"贵重的钢笔"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 160, limit_day = 2},
     #exchange_data{type = 42, id = 42244, item_bid = 100244,
		    item_name = lang:get(<<"智能相机"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 160, limit_day = 2},
     #exchange_data{type = 42, id = 42245, item_bid = 100245,
		    item_name = lang:get(<<"精密的探测仪"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 160, limit_day = 2}];
list_by_type(41) ->
    [#exchange_data{type = 41, id = 41001,
		    item_bid = 200102,
		    item_name = lang:get(<<"芬芳花瓶"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 1500},
     #exchange_data{type = 41, id = 41002, item_bid = 200103,
		    item_name = lang:get(<<"舒适木凳"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 1500},
     #exchange_data{type = 41, id = 41003, item_bid = 200104,
		    item_name = lang:get(<<"花布小圆桌"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 1500},
     #exchange_data{type = 41, id = 41004, item_bid = 200151,
		    item_name = lang:get(<<"温馨小屋地板"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41005, item_bid = 200152,
		    item_name = lang:get(<<"温馨小屋墙壁"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41006, item_bid = 200101,
		    item_name = lang:get(<<"小挂画"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41007, item_bid = 200105,
		    item_name = lang:get(<<"舒适单人沙发"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41008, item_bid = 200106,
		    item_name = lang:get(<<"木制书架"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41009, item_bid = 200107,
		    item_name = lang:get(<<"木制床头柜"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41010, item_bid = 200108,
		    item_name = lang:get(<<"木制挂钟"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41011, item_bid = 200204,
		    item_name = lang:get(<<"皇室钢琴椅"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 1500},
     #exchange_data{type = 41, id = 41012, item_bid = 200208,
		    item_name = lang:get(<<"皇室壁灯"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41013, item_bid = 200209,
		    item_name = lang:get(<<"黄金圆镜"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41014, item_bid = 200201,
		    item_name = lang:get(<<"皇室茶桌"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41015, item_bid = 200202,
		    item_name = lang:get(<<"皇室挂画"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41016, item_bid = 200203,
		    item_name = lang:get(<<"红酒小圆桌"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41017, item_bid = 200205,
		    item_name = lang:get(<<"皇室尊贵沙发"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41018, item_bid = 200251,
		    item_name = lang:get(<<"皇室贵族地板"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 5000},
     #exchange_data{type = 41, id = 41019, item_bid = 200252,
		    item_name = lang:get(<<"皇室贵族墙壁"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 5000},
     #exchange_data{type = 41, id = 41020, item_bid = 200301,
		    item_name = lang:get(<<"翠绿星座骰子"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 1500},
     #exchange_data{type = 41, id = 41021, item_bid = 200302,
		    item_name = lang:get(<<"深紫星座骰子"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 1500},
     #exchange_data{type = 41, id = 41022, item_bid = 200303,
		    item_name = lang:get(<<"湛蓝星座骰子"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 1500},
     #exchange_data{type = 41, id = 41023, item_bid = 200309,
		    item_name = lang:get(<<"星月屏风"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41024, item_bid = 200304,
		    item_name = lang:get(<<"占星师靠椅"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41025, item_bid = 200305,
		    item_name = lang:get(<<"占星师小圆桌"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41026, item_bid = 200351,
		    item_name = lang:get(<<"占星密室地板"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 5000},
     #exchange_data{type = 41, id = 41027, item_bid = 200352,
		    item_name = lang:get(<<"占星密室墙壁"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 5000},
     #exchange_data{type = 41, id = 41028, item_bid = 200110,
		    item_name = lang:get(<<"绒毛圆毯"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 8000},
     #exchange_data{type = 41, id = 41029, item_bid = 200410,
		    item_name = lang:get(<<"心意绵绵纸鹤"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41030, item_bid = 200412,
		    item_name = lang:get(<<"浓情七夕圆凳"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41031, item_bid = 200503,
		    item_name = lang:get(<<"逝者墓碑"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000},
     #exchange_data{type = 41, id = 41032, item_bid = 200504,
		    item_name = lang:get(<<"鬼面树干"/utf8>>), item_num = 1,
		    pay_type = home_coin, price = 3000}];
list_by_type(17) ->
    [#exchange_data{type = 17, id = 17001, item_bid = 40132,
		    item_name = lang:get(<<"洛基碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = elite_coin, price = 5000,
		    limit_week = 5},
     #exchange_data{type = 17, id = 17002, item_bid = 40133,
		    item_name = lang:get(<<"影刹碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = elite_coin, price = 12000,
		    limit_week = 5},
     #exchange_data{type = 17, id = 17003, item_bid = 40232,
		    item_name = lang:get(<<"泰坦碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = elite_coin, price = 5000,
		    limit_week = 5},
     #exchange_data{type = 17, id = 17004, item_bid = 40233,
		    item_name = lang:get(<<"艾蕾莉亚碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = elite_coin, price = 12000,
		    limit_week = 5},
     #exchange_data{type = 17, id = 17005, item_bid = 40332,
		    item_name = lang:get(<<"亚巴顿碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = elite_coin, price = 5000,
		    limit_week = 5},
     #exchange_data{type = 17, id = 17006, item_bid = 40333,
		    item_name = lang:get(<<"炼神石"/utf8>>), item_num = 1,
		    bind = 1, pay_type = elite_coin, price = 12000,
		    limit_week = 5},
     #exchange_data{type = 17, id = 17007, item_bid = 40432,
		    item_name = lang:get(<<"符文精华"/utf8>>), item_num = 1,
		    bind = 1, pay_type = elite_coin, price = 5000,
		    limit_week = 5},
     #exchange_data{type = 17, id = 17008, item_bid = 40433,
		    item_name = lang:get(<<"赋能遗物"/utf8>>), item_num = 1,
		    bind = 1, pay_type = elite_coin, price = 12000,
		    limit_week = 5},
     #exchange_data{type = 17, id = 17009, item_bid = 10460,
		    item_name = lang:get(<<"觉醒石"/utf8>>), item_num = 5,
		    bind = 1, pay_type = elite_coin, price = 12500,
		    limit_week = 5, lev = {160, 999}},
     #exchange_data{type = 17, id = 17010, item_bid = 10006,
		    item_name = lang:get(<<"天赋秘典"/utf8>>), item_num = 10,
		    bind = 1, pay_type = elite_coin, price = 5000,
		    limit_week = 5, arena_elite_lev = 7}];
list_by_type(5) ->
    [#exchange_data{type = 5, id = 5001, item_bid = 39039,
		    item_name = lang:get(<<"亡灵收割者碎片"/utf8>>), item_num = 5,
		    bind = 1, pay_type = guild, price = 12000,
		    limit_week = 2},
     #exchange_data{type = 5, id = 5002, item_bid = 10450,
		    item_name = lang:get(<<"水元素碎片"/utf8>>),
		    item_num = 100000, bind = 1, pay_type = guild,
		    price = 5000, limit_week = 2},
     #exchange_data{type = 5, id = 5003, item_bid = 90515,
		    item_name = lang:get(<<"翼女碎片"/utf8>>), item_num = 2,
		    bind = 1, pay_type = guild, price = 10000,
		    limit_week = 2},
     #exchange_data{type = 5, id = 5004, item_bid = 90514,
		    item_name = lang:get(<<"光明牧师碎片"/utf8>>), item_num = 2,
		    bind = 1, pay_type = guild, price = 10000,
		    limit_week = 2},
     #exchange_data{type = 5, id = 5005, item_bid = 10001,
		    item_name = lang:get(<<"死亡骑士碎片"/utf8>>),
		    item_num = 100000, bind = 1, pay_type = guild,
		    price = 5000, limit_week = 2},
     #exchange_data{type = 5, id = 5006, item_bid = 59040,
		    item_name = lang:get(<<"波塞冬碎片"/utf8>>), item_num = 5,
		    bind = 1, pay_type = guild, price = 16000,
		    limit_week = 1},
     #exchange_data{type = 5, id = 5007, item_bid = 40121,
		    item_name = lang:get(<<"阿波罗碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = guild, price = 32000,
		    limit_week = 1},
     #exchange_data{type = 5, id = 5008, item_bid = 40221,
		    item_name = lang:get(<<"美杜莎碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = guild, price = 32000,
		    limit_week = 1},
     #exchange_data{type = 5, id = 5009, item_bid = 40321,
		    item_name = lang:get(<<"5星随机英雄碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = guild, price = 32000,
		    limit_week = 1},
     #exchange_data{type = 5, id = 5010, item_bid = 40421,
		    item_name = lang:get(<<"普通召唤卷"/utf8>>), item_num = 1,
		    bind = 1, pay_type = guild, price = 32000,
		    limit_week = 1}];
list_by_type(18) ->
    [#exchange_data{type = 18, id = 18001, item_bid = 23002,
		    item_name = lang:get(<<"水色悠梦(7天)"/utf8>>), item_num = 1,
		    bind = 1, pay_type = skin_debris, price = 40,
		    limit_vip = 0},
     #exchange_data{type = 18, id = 18002, item_bid = 23005,
		    item_name = lang:get(<<"如梦令(7天)"/utf8>>), item_num = 1,
		    bind = 1, pay_type = skin_debris, price = 40,
		    limit_vip = 0},
     #exchange_data{type = 18, id = 18003, item_bid = 23008,
		    item_name = lang:get(<<"赤羽火舞(7天)"/utf8>>), item_num = 1,
		    bind = 1, pay_type = skin_debris, price = 40,
		    limit_vip = 0},
     #exchange_data{type = 18, id = 18004, item_bid = 23014,
		    item_name = lang:get(<<"御龙金甲(7天)"/utf8>>), item_num = 1,
		    bind = 1, pay_type = skin_debris, price = 40,
		    limit_vip = 0},
     #exchange_data{type = 18, id = 18005, item_bid = 23017,
		    item_name = lang:get(<<"赤魅海盗(7天)"/utf8>>), item_num = 1,
		    bind = 1, pay_type = skin_debris, price = 40,
		    limit_vip = 0}];
list_by_type(8) ->
    [#exchange_data{type = 8, id = 8012, item_bid = 10040,
		    item_name = lang:get(<<"奥术之尘"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 3750,
		    limit_vip = 0, limit_week = 1, limit_month = 0},
     #exchange_data{type = 8, id = 8001, item_bid = 72002,
		    item_name = lang:get(<<"神器符石"/utf8>>), item_num = 5,
		    bind = 1, pay_type = expedition_medal, price = 2500,
		    limit_vip = 0, limit_month = 5},
     #exchange_data{type = 8, id = 8002, item_bid = 72001,
		    item_name = lang:get(<<"炼神石"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 1875,
		    limit_vip = 0, limit_month = 0},
     #exchange_data{type = 8, id = 8013, item_bid = 32,
		    item_name = lang:get(<<"烈阳晶石"/utf8>>), item_num = 10000,
		    bind = 1, pay_type = expedition_medal, price = 1000,
		    limit_vip = 0, limit_week = 5, limit_month = 0},
     #exchange_data{type = 8, id = 8003, item_bid = 29905,
		    item_name = lang:get(<<"5星英雄碎片"/utf8>>), item_num = 10,
		    bind = 1, pay_type = expedition_medal, price = 5000,
		    limit_vip = 0, limit_month = 0},
     #exchange_data{type = 8, id = 8004, item_bid = 29104,
		    item_name = lang:get(<<"4星水系碎片"/utf8>>), item_num = 10,
		    bind = 1, pay_type = expedition_medal, price = 1000,
		    limit_vip = 0, limit_month = 0},
     #exchange_data{type = 8, id = 8005, item_bid = 29204,
		    item_name = lang:get(<<"4星火系碎片"/utf8>>), item_num = 10,
		    bind = 1, pay_type = expedition_medal, price = 1000,
		    limit_vip = 0, limit_week = 1, limit_month = 0},
     #exchange_data{type = 8, id = 8006, item_bid = 29304,
		    item_name = lang:get(<<"4星自然碎片"/utf8>>), item_num = 10,
		    bind = 1, pay_type = expedition_medal, price = 1000,
		    limit_vip = 0, limit_month = 0},
     #exchange_data{type = 8, id = 8007, item_bid = 26907,
		    item_name = lang:get(<<"斯芬克斯碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 45000,
		    limit_vip = 0, limit_month = 0},
     #exchange_data{type = 8, id = 8008, item_bid = 25907,
		    item_name = lang:get(<<"瓦尔基里碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 45000,
		    limit_vip = 0, limit_month = 0},
     #exchange_data{type = 8, id = 8014, item_bid = 25909,
		    item_name = lang:get(<<"哪吒碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 55000,
		    limit_vip = 0, limit_month = 1},
     #exchange_data{type = 8, id = 8011, item_bid = 24909,
		    item_name = lang:get(<<"耶梦加得碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 45000,
		    limit_vip = 0, limit_month = 1},
     #exchange_data{type = 8, id = 8009, item_bid = 27903,
		    item_name = lang:get(<<"雷神碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 55000,
		    limit_vip = 0, limit_month = 1},
     #exchange_data{type = 8, id = 8010, item_bid = 28905,
		    item_name = lang:get(<<"瓦尔基里碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 50000,
		    limit_vip = 0, limit_month = 1},
     #exchange_data{type = 8, id = 8009, item_bid = 27903,
		    item_name = lang:get(<<"哪吒碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 60500,
		    limit_vip = 0, limit_month = 1},
     #exchange_data{type = 8, id = 8010, item_bid = 28905,
		    item_name = lang:get(<<"耶梦加得碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 55000,
		    limit_vip = 0, limit_month = 1},
     #exchange_data{type = 8, id = 8017, item_bid = 27904,
		    item_name = lang:get(<<"雷神碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 55000,
		    limit_vip = 0, limit_month = 1},
     #exchange_data{type = 8, id = 8018, item_bid = 28903,
		    item_name = lang:get(<<"路西法碎片"/utf8>>), item_num = 50,
		    bind = 1, pay_type = expedition_medal, price = 71500,
		    limit_vip = 0, limit_month = 1}];
list_by_type(6) ->
    [#exchange_data{type = 6, id = 6001, item_bid = 40131,
		    item_name = lang:get(<<"4星光明英雄碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = arena_cent, price = 30000,
		    limit_week = 2, lev = {1, 999}},
     #exchange_data{type = 6, id = 6002, item_bid = 40231,
		    item_name = lang:get(<<"4星黑暗英雄碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = arena_cent, price = 30000,
		    limit_week = 2, lev = {1, 999}},
     #exchange_data{type = 6, id = 6003, item_bid = 40331,
		    item_name = lang:get(<<"5星水系英雄碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = arena_cent, price = 30000,
		    limit_week = 2, lev = {1, 999}},
     #exchange_data{type = 6, id = 6004, item_bid = 40431,
		    item_name = lang:get(<<"5星火系英雄碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = arena_cent, price = 30000,
		    limit_week = 2, lev = {1, 999}},
     #exchange_data{type = 6, id = 6005, item_bid = 10456,
		    item_name = lang:get(<<"5星自然英雄碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = arena_cent, price = 35000,
		    limit_week = 5, lev = {1, 999}},
     #exchange_data{type = 6, id = 6006, item_bid = 10457,
		    item_name = lang:get(<<"5星随机英雄碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = arena_cent, price = 50000,
		    limit_week = 5, lev = {1, 999}},
     #exchange_data{type = 6, id = 6007, item_bid = 14001,
		    item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 50,
		    bind = 1, pay_type = arena_cent, price = 8000,
		    limit_week = 5, lev = {1, 999}},
     #exchange_data{type = 6, id = 6011, item_bid = 10091,
		    item_name = lang:get(<<"永恒晶石"/utf8>>), item_num = 100,
		    bind = 1, pay_type = arena_cent, price = 15000,
		    limit_week = 5, lev = {1, 999},
		    open_srv_timestamp = 1519003689},
     #exchange_data{type = 6, id = 6008, item_bid = 10090,
		    item_name = lang:get(<<"先知精华"/utf8>>), item_num = 100,
		    bind = 1, pay_type = arena_cent, price = 10000,
		    limit_week = 5, lev = {1, 999}},
     #exchange_data{type = 6, id = 6009, item_bid = 10450,
		    item_name = lang:get(<<"雷神碎片"/utf8>>),
		    item_num = 100000, bind = 1, pay_type = arena_cent,
		    price = 20000, limit_week = 5, lev = {1, 999}},
     #exchange_data{type = 6, id = 6010, item_bid = 10455,
		    item_name = lang:get(<<"潘多拉碎片"/utf8>>), item_num = 1,
		    bind = 1, pay_type = arena_cent, price = 20000,
		    limit_week = 10, lev = {1, 999}}];
list_by_type(1) ->
    [#exchange_data{type = 1, id = 1001, item_bid = 10415,
		    item_name = lang:get(<<"竞技挑战券"/utf8>>), item_num = 5000,
		    bind = 1, pay_type = gold, price = 500000,
		    limit_vip = 0, limit_day = 0, label = 7,
		    discount = 500000},
     #exchange_data{type = 1, id = 1002, item_bid = 10450,
		    item_name = lang:get(<<"先知精华"/utf8>>),
		    item_num = 100000, bind = 1, pay_type = gold,
		    price = 2000000, limit_vip = 0, limit_day = 0,
		    label = 7, discount = 2000000},
     #exchange_data{type = 1, id = 1003, item_bid = 10103,
		    item_name = lang:get(<<"先知精华"/utf8>>), item_num = 10000,
		    bind = 1, pay_type = gold, price = 10000000,
		    limit_vip = 0, limit_day = 0, label = 8,
		    discount = 10000000},
     #exchange_data{type = 1, id = 1004, item_bid = 14001,
		    item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 100,
		    bind = 1, pay_type = gold, price = 2000000,
		    limit_vip = 0, limit_day = 0, label = 6,
		    discount = 2000000},
     #exchange_data{type = 1, id = 1005, item_bid = 37002,
		    item_name = lang:get(<<"高级召唤卷"/utf8>>), item_num = 1,
		    bind = 1, pay_type = gold, price = 10000, limit_vip = 0,
		    limit_day = 50, label = 1, discount = 10000},
     #exchange_data{type = 1, id = 1006, item_bid = 39052,
		    item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		    bind = 1, pay_type = gold, price = 5000, limit_vip = 0,
		    limit_day = 2000, label = 4, discount = 5000},
     #exchange_data{type = 1, id = 1007, item_bid = 39053,
		    item_name = lang:get(<<"符文精华"/utf8>>), item_num = 1,
		    bind = 1, pay_type = gold, price = 5000, limit_vip = 0,
		    limit_day = 2000, label = 8, discount = 5000},
     #exchange_data{type = 1, id = 1008, item_bid = 37005,
		    item_name = lang:get(<<"高级寻宝券"/utf8>>), item_num = 1,
		    bind = 1, pay_type = gold, price = 2000000,
		    limit_vip = 0, limit_day = 2, label = 6,
		    discount = 2000000},
     #exchange_data{type = 1, id = 1009, item_bid = 10460,
		    item_name = lang:get(<<"圣露"/utf8>>), item_num = 10,
		    bind = 1, pay_type = gold, price = 5000000,
		    limit_vip = 0, limit_day = 2, label = 5,
		    discount = 5000000},
     #exchange_data{type = 1, id = 1010, item_bid = 16202,
		    item_name = lang:get(<<"先知精华"/utf8>>), item_num = 1,
		    bind = 1, pay_type = gold, price = 5000000,
		    limit_vip = 0, limit_day = 2, label = 6,
		    discount = 5000000},
     #exchange_data{type = 1, id = 1011, item_bid = 10403,
		    item_name = lang:get(<<"先知精华"/utf8>>), item_num = 100,
		    bind = 1, pay_type = gold, price = 200000,
		    limit_vip = 0, limit_day = 0, label = 6,
		    discount = 200000},
     #exchange_data{type = 1, id = 1012, item_bid = 90514,
		    item_name = lang:get(<<"先知精华"/utf8>>), item_num = 1,
		    bind = 1, pay_type = gold, price = 2000000,
		    limit_vip = 0, limit_day = 2, label = 6,
		    discount = 2000000}];
list_by_type(_) -> [].

get_by_eid(1001) ->
    #exchange_data{type = 1, id = 1001, item_bid = 10415,
		   item_name = lang:get(<<"竞技挑战券"/utf8>>), item_num = 5000,
		   bind = 1, pay_type = gold, price = 500000,
		   limit_vip = 0, limit_day = 0, label = 7,
		   discount = 500000};
get_by_eid(1002) ->
    #exchange_data{type = 1, id = 1002, item_bid = 10450,
		   item_name = lang:get(<<"先知精华"/utf8>>),
		   item_num = 100000, bind = 1, pay_type = gold,
		   price = 2000000, limit_vip = 0, limit_day = 0,
		   label = 7, discount = 2000000};
get_by_eid(1003) ->
    #exchange_data{type = 1, id = 1003, item_bid = 10103,
		   item_name = lang:get(<<"先知精华"/utf8>>), item_num = 10000,
		   bind = 1, pay_type = gold, price = 10000000,
		   limit_vip = 0, limit_day = 0, label = 8,
		   discount = 10000000};
get_by_eid(1004) ->
    #exchange_data{type = 1, id = 1004, item_bid = 14001,
		   item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 100,
		   bind = 1, pay_type = gold, price = 2000000,
		   limit_vip = 0, limit_day = 0, label = 6,
		   discount = 2000000};
get_by_eid(1005) ->
    #exchange_data{type = 1, id = 1005, item_bid = 37002,
		   item_name = lang:get(<<"高级召唤卷"/utf8>>), item_num = 1,
		   bind = 1, pay_type = gold, price = 10000, limit_vip = 0,
		   limit_day = 50, label = 1, discount = 10000};
get_by_eid(1006) ->
    #exchange_data{type = 1, id = 1006, item_bid = 39052,
		   item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		   bind = 1, pay_type = gold, price = 5000, limit_vip = 0,
		   limit_day = 2000, label = 4, discount = 5000};
get_by_eid(1007) ->
    #exchange_data{type = 1, id = 1007, item_bid = 39053,
		   item_name = lang:get(<<"符文精华"/utf8>>), item_num = 1,
		   bind = 1, pay_type = gold, price = 5000, limit_vip = 0,
		   limit_day = 2000, label = 8, discount = 5000};
get_by_eid(1008) ->
    #exchange_data{type = 1, id = 1008, item_bid = 37005,
		   item_name = lang:get(<<"高级寻宝券"/utf8>>), item_num = 1,
		   bind = 1, pay_type = gold, price = 2000000,
		   limit_vip = 0, limit_day = 2, label = 6,
		   discount = 2000000};
get_by_eid(1009) ->
    #exchange_data{type = 1, id = 1009, item_bid = 10460,
		   item_name = lang:get(<<"圣露"/utf8>>), item_num = 10,
		   bind = 1, pay_type = gold, price = 5000000,
		   limit_vip = 0, limit_day = 2, label = 5,
		   discount = 5000000};
get_by_eid(1010) ->
    #exchange_data{type = 1, id = 1010, item_bid = 16202,
		   item_name = lang:get(<<"永恒晶石"/utf8>>), item_num = 1,
		   bind = 1, pay_type = gold, price = 5000000,
		   limit_vip = 0, limit_day = 2, label = 6,
		   discount = 5000000};
get_by_eid(1011) ->
    #exchange_data{type = 1, id = 1011, item_bid = 10403,
		   item_name = lang:get(<<"永恒晶石"/utf8>>), item_num = 100,
		   bind = 1, pay_type = gold, price = 200000,
		   limit_vip = 0, limit_day = 0, label = 6,
		   discount = 200000};
get_by_eid(1012) ->
    #exchange_data{type = 1, id = 1012, item_bid = 90514,
		   item_name = lang:get(<<"永恒晶石"/utf8>>), item_num = 1,
		   bind = 1, pay_type = gold, price = 2000000,
		   limit_vip = 0, limit_day = 2, label = 6,
		   discount = 2000000};
get_by_eid(6001) ->
    #exchange_data{type = 6, id = 6001, item_bid = 40131,
		   item_name = lang:get(<<"4星光明英雄碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = arena_cent, price = 30000,
		   limit_week = 2, lev = {1, 999}};
get_by_eid(6002) ->
    #exchange_data{type = 6, id = 6002, item_bid = 40231,
		   item_name = lang:get(<<"4星黑暗英雄碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = arena_cent, price = 30000,
		   limit_week = 2, lev = {1, 999}};
get_by_eid(6003) ->
    #exchange_data{type = 6, id = 6003, item_bid = 40331,
		   item_name = lang:get(<<"5星水系英雄碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = arena_cent, price = 30000,
		   limit_week = 2, lev = {1, 999}};
get_by_eid(6004) ->
    #exchange_data{type = 6, id = 6004, item_bid = 40431,
		   item_name = lang:get(<<"5星火系英雄碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = arena_cent, price = 30000,
		   limit_week = 2, lev = {1, 999}};
get_by_eid(6005) ->
    #exchange_data{type = 6, id = 6005, item_bid = 10456,
		   item_name = lang:get(<<"5星自然英雄碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = arena_cent, price = 35000,
		   limit_week = 5, lev = {1, 999}};
get_by_eid(6006) ->
    #exchange_data{type = 6, id = 6006, item_bid = 10457,
		   item_name = lang:get(<<"5星随机英雄碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = arena_cent, price = 50000,
		   limit_week = 5, lev = {1, 999}};
get_by_eid(6007) ->
    #exchange_data{type = 6, id = 6007, item_bid = 14001,
		   item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 50,
		   bind = 1, pay_type = arena_cent, price = 8000,
		   limit_week = 5, lev = {1, 999}};
get_by_eid(6011) ->
    #exchange_data{type = 6, id = 6011, item_bid = 10091,
		   item_name = lang:get(<<"永恒晶石"/utf8>>), item_num = 100,
		   bind = 1, pay_type = arena_cent, price = 15000,
		   limit_week = 5, lev = {1, 999},
		   open_srv_timestamp = 1519003689};
get_by_eid(6008) ->
    #exchange_data{type = 6, id = 6008, item_bid = 10090,
		   item_name = lang:get(<<"先知精华"/utf8>>), item_num = 100,
		   bind = 1, pay_type = arena_cent, price = 10000,
		   limit_week = 5, lev = {1, 999}};
get_by_eid(6009) ->
    #exchange_data{type = 6, id = 6009, item_bid = 10450,
		   item_name = lang:get(<<"雷神碎片"/utf8>>),
		   item_num = 100000, bind = 1, pay_type = arena_cent,
		   price = 20000, limit_week = 5, lev = {1, 999}};
get_by_eid(6010) ->
    #exchange_data{type = 6, id = 6010, item_bid = 10455,
		   item_name = lang:get(<<"潘多拉碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = arena_cent, price = 20000,
		   limit_week = 10, lev = {1, 999}};
get_by_eid(8012) ->
    #exchange_data{type = 8, id = 8012, item_bid = 10040,
		   item_name = lang:get(<<"奥术之尘"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 3750,
		   limit_vip = 0, limit_week = 1, limit_month = 0};
get_by_eid(8001) ->
    #exchange_data{type = 8, id = 8001, item_bid = 72002,
		   item_name = lang:get(<<"神器符石"/utf8>>), item_num = 5,
		   bind = 1, pay_type = expedition_medal, price = 2500,
		   limit_vip = 0, limit_month = 5};
get_by_eid(8002) ->
    #exchange_data{type = 8, id = 8002, item_bid = 72001,
		   item_name = lang:get(<<"炼神石"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 1875,
		   limit_vip = 0, limit_month = 0};
get_by_eid(8013) ->
    #exchange_data{type = 8, id = 8013, item_bid = 32,
		   item_name = lang:get(<<"烈阳晶石"/utf8>>), item_num = 10000,
		   bind = 1, pay_type = expedition_medal, price = 1000,
		   limit_vip = 0, limit_week = 5, limit_month = 0};
get_by_eid(8003) ->
    #exchange_data{type = 8, id = 8003, item_bid = 29905,
		   item_name = lang:get(<<"5星英雄碎片"/utf8>>), item_num = 10,
		   bind = 1, pay_type = expedition_medal, price = 5000,
		   limit_vip = 0, limit_month = 0};
get_by_eid(8004) ->
    #exchange_data{type = 8, id = 8004, item_bid = 29104,
		   item_name = lang:get(<<"4星水系碎片"/utf8>>), item_num = 10,
		   bind = 1, pay_type = expedition_medal, price = 1000,
		   limit_vip = 0, limit_month = 0};
get_by_eid(8005) ->
    #exchange_data{type = 8, id = 8005, item_bid = 29204,
		   item_name = lang:get(<<"4星火系碎片"/utf8>>), item_num = 10,
		   bind = 1, pay_type = expedition_medal, price = 1000,
		   limit_vip = 0, limit_week = 1, limit_month = 0};
get_by_eid(8006) ->
    #exchange_data{type = 8, id = 8006, item_bid = 29304,
		   item_name = lang:get(<<"4星自然碎片"/utf8>>), item_num = 10,
		   bind = 1, pay_type = expedition_medal, price = 1000,
		   limit_vip = 0, limit_month = 0};
get_by_eid(8007) ->
    #exchange_data{type = 8, id = 8007, item_bid = 26907,
		   item_name = lang:get(<<"斯芬克斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 45000,
		   limit_vip = 0, limit_month = 0};
get_by_eid(8008) ->
    #exchange_data{type = 8, id = 8008, item_bid = 25907,
		   item_name = lang:get(<<"瓦尔基里碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 45000,
		   limit_vip = 0, limit_month = 0};
get_by_eid(8014) ->
    #exchange_data{type = 8, id = 8014, item_bid = 25909,
		   item_name = lang:get(<<"哪吒碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 55000,
		   limit_vip = 0, limit_month = 1};
get_by_eid(8011) ->
    #exchange_data{type = 8, id = 8011, item_bid = 24909,
		   item_name = lang:get(<<"耶梦加得碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 45000,
		   limit_vip = 0, limit_month = 1};
get_by_eid(8009) ->
    #exchange_data{type = 8, id = 8009, item_bid = 27903,
		   item_name = lang:get(<<"雷神碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 55000,
		   limit_vip = 0, limit_month = 1};
get_by_eid(8010) ->
    #exchange_data{type = 8, id = 8010, item_bid = 28905,
		   item_name = lang:get(<<"路西法碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 50000,
		   limit_vip = 0, limit_month = 1};
get_by_eid(8014) ->
    #exchange_data{type = 8, id = 8009, item_bid = 27903,
		   item_name = lang:get(<<"哪吒碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 60500,
		   limit_vip = 0, limit_month = 1};
get_by_eid(8011) ->
    #exchange_data{type = 8, id = 8010, item_bid = 28905,
		   item_name = lang:get(<<"耶梦加得碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 55000,
		   limit_vip = 0, limit_month = 1};
get_by_eid(8009) ->
    #exchange_data{type = 8, id = 8017, item_bid = 27904,
		   item_name = lang:get(<<"雷神碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 55000,
		   limit_vip = 0, limit_month = 1};
get_by_eid(8010) ->
    #exchange_data{type = 8, id = 8018, item_bid = 28903,
		   item_name = lang:get(<<"路西法碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = expedition_medal, price = 71500,
		   limit_vip = 0, limit_month = 1};
get_by_eid(18001) ->
    #exchange_data{type = 18, id = 18001, item_bid = 23002,
		   item_name = lang:get(<<"水色悠梦(7天)"/utf8>>), item_num = 1,
		   bind = 1, pay_type = skin_debris, price = 40,
		   limit_vip = 0};
get_by_eid(18002) ->
    #exchange_data{type = 18, id = 18002, item_bid = 23005,
		   item_name = lang:get(<<"如梦令(7天)"/utf8>>), item_num = 1,
		   bind = 1, pay_type = skin_debris, price = 40,
		   limit_vip = 0};
get_by_eid(18003) ->
    #exchange_data{type = 18, id = 18003, item_bid = 23008,
		   item_name = lang:get(<<"赤羽火舞(7天)"/utf8>>), item_num = 1,
		   bind = 1, pay_type = skin_debris, price = 40,
		   limit_vip = 0};
get_by_eid(18004) ->
    #exchange_data{type = 18, id = 18004, item_bid = 23014,
		   item_name = lang:get(<<"御龙金甲(7天)"/utf8>>), item_num = 1,
		   bind = 1, pay_type = skin_debris, price = 40,
		   limit_vip = 0};
get_by_eid(18005) ->
    #exchange_data{type = 18, id = 18005, item_bid = 23017,
		   item_name = lang:get(<<"赤魅海盗(7天)"/utf8>>), item_num = 1,
		   bind = 1, pay_type = skin_debris, price = 40,
		   limit_vip = 0};
get_by_eid(5001) ->
    #exchange_data{type = 5, id = 5001, item_bid = 39039,
		   item_name = lang:get(<<"亡灵收割者碎片"/utf8>>), item_num = 5,
		   bind = 1, pay_type = guild, price = 12000,
		   limit_week = 2};
get_by_eid(5002) ->
    #exchange_data{type = 5, id = 5002, item_bid = 10450,
		   item_name = lang:get(<<"水元素碎片"/utf8>>),
		   item_num = 100000, bind = 1, pay_type = guild,
		   price = 5000, limit_week = 2};
get_by_eid(5003) ->
    #exchange_data{type = 5, id = 5003, item_bid = 90515,
		   item_name = lang:get(<<"翼女碎片"/utf8>>), item_num = 2,
		   bind = 1, pay_type = guild, price = 10000,
		   limit_week = 2};
get_by_eid(5004) ->
    #exchange_data{type = 5, id = 5004, item_bid = 90514,
		   item_name = lang:get(<<"光明牧师碎片"/utf8>>), item_num = 2,
		   bind = 1, pay_type = guild, price = 10000,
		   limit_week = 2};
get_by_eid(5005) ->
    #exchange_data{type = 5, id = 5005, item_bid = 10001,
		   item_name = lang:get(<<"死亡骑士碎片"/utf8>>),
		   item_num = 100000, bind = 1, pay_type = guild,
		   price = 5000, limit_week = 2};
get_by_eid(5006) ->
    #exchange_data{type = 5, id = 5006, item_bid = 59040,
		   item_name = lang:get(<<"波塞冬碎片"/utf8>>), item_num = 5,
		   bind = 1, pay_type = guild, price = 16000,
		   limit_week = 1};
get_by_eid(5007) ->
    #exchange_data{type = 5, id = 5007, item_bid = 40121,
		   item_name = lang:get(<<"阿波罗碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = guild, price = 32000,
		   limit_week = 1};
get_by_eid(5008) ->
    #exchange_data{type = 5, id = 5008, item_bid = 40221,
		   item_name = lang:get(<<"美杜莎碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = guild, price = 32000,
		   limit_week = 1};
get_by_eid(5009) ->
    #exchange_data{type = 5, id = 5009, item_bid = 40321,
		   item_name = lang:get(<<"5星随机英雄碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = guild, price = 32000,
		   limit_week = 1};
get_by_eid(5010) ->
    #exchange_data{type = 5, id = 5010, item_bid = 40421,
		   item_name = lang:get(<<"灵犀短刃"/utf8>>), item_num = 1,
		   bind = 1, pay_type = guild, price = 32000,
		   limit_week = 1};
get_by_eid(17001) ->
    #exchange_data{type = 17, id = 17001, item_bid = 40132,
		   item_name = lang:get(<<"洛基碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = elite_coin, price = 5000,
		   limit_week = 5};
get_by_eid(17002) ->
    #exchange_data{type = 17, id = 17002, item_bid = 40133,
		   item_name = lang:get(<<"影刹碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = elite_coin, price = 12000,
		   limit_week = 5};
get_by_eid(17003) ->
    #exchange_data{type = 17, id = 17003, item_bid = 40232,
		   item_name = lang:get(<<"泰坦碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = elite_coin, price = 5000,
		   limit_week = 5};
get_by_eid(17004) ->
    #exchange_data{type = 17, id = 17004, item_bid = 40233,
		   item_name = lang:get(<<"艾蕾莉亚碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = elite_coin, price = 12000,
		   limit_week = 5};
get_by_eid(17005) ->
    #exchange_data{type = 17, id = 17005, item_bid = 40332,
		   item_name = lang:get(<<"亚巴顿碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = elite_coin, price = 5000,
		   limit_week = 5};
get_by_eid(17006) ->
    #exchange_data{type = 17, id = 17006, item_bid = 40333,
		   item_name = lang:get(<<"炼神石"/utf8>>), item_num = 1,
		   bind = 1, pay_type = elite_coin, price = 12000,
		   limit_week = 5};
get_by_eid(17007) ->
    #exchange_data{type = 17, id = 17007, item_bid = 40432,
		   item_name = lang:get(<<"符文精华"/utf8>>), item_num = 1,
		   bind = 1, pay_type = elite_coin, price = 5000,
		   limit_week = 5};
get_by_eid(17008) ->
    #exchange_data{type = 17, id = 17008, item_bid = 40433,
		   item_name = lang:get(<<"赋能遗物"/utf8>>), item_num = 1,
		   bind = 1, pay_type = elite_coin, price = 12000,
		   limit_week = 5};
get_by_eid(17009) ->
    #exchange_data{type = 17, id = 17009, item_bid = 10460,
		   item_name = lang:get(<<"觉醒石"/utf8>>), item_num = 5,
		   bind = 1, pay_type = elite_coin, price = 12500,
		   limit_week = 5, lev = {160, 999}};
get_by_eid(17010) ->
    #exchange_data{type = 17, id = 17010, item_bid = 10006,
		   item_name = lang:get(<<"天赋秘典"/utf8>>), item_num = 10,
		   bind = 1, pay_type = elite_coin, price = 5000,
		   limit_week = 5, arena_elite_lev = 7};
get_by_eid(41001) ->
    #exchange_data{type = 41, id = 41001, item_bid = 200102,
		   item_name = lang:get(<<"芬芳花瓶"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 1500};
get_by_eid(41002) ->
    #exchange_data{type = 41, id = 41002, item_bid = 200103,
		   item_name = lang:get(<<"舒适木凳"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 1500};
get_by_eid(41003) ->
    #exchange_data{type = 41, id = 41003, item_bid = 200104,
		   item_name = lang:get(<<"花布小圆桌"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 1500};
get_by_eid(41004) ->
    #exchange_data{type = 41, id = 41004, item_bid = 200151,
		   item_name = lang:get(<<"温馨小屋地板"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41005) ->
    #exchange_data{type = 41, id = 41005, item_bid = 200152,
		   item_name = lang:get(<<"温馨小屋墙壁"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41006) ->
    #exchange_data{type = 41, id = 41006, item_bid = 200101,
		   item_name = lang:get(<<"小挂画"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41007) ->
    #exchange_data{type = 41, id = 41007, item_bid = 200105,
		   item_name = lang:get(<<"舒适单人沙发"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41008) ->
    #exchange_data{type = 41, id = 41008, item_bid = 200106,
		   item_name = lang:get(<<"木制书架"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41009) ->
    #exchange_data{type = 41, id = 41009, item_bid = 200107,
		   item_name = lang:get(<<"木制床头柜"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41010) ->
    #exchange_data{type = 41, id = 41010, item_bid = 200108,
		   item_name = lang:get(<<"木制挂钟"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41011) ->
    #exchange_data{type = 41, id = 41011, item_bid = 200204,
		   item_name = lang:get(<<"皇室钢琴椅"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 1500};
get_by_eid(41012) ->
    #exchange_data{type = 41, id = 41012, item_bid = 200208,
		   item_name = lang:get(<<"皇室壁灯"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41013) ->
    #exchange_data{type = 41, id = 41013, item_bid = 200209,
		   item_name = lang:get(<<"黄金圆镜"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41014) ->
    #exchange_data{type = 41, id = 41014, item_bid = 200201,
		   item_name = lang:get(<<"皇室茶桌"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41015) ->
    #exchange_data{type = 41, id = 41015, item_bid = 200202,
		   item_name = lang:get(<<"皇室挂画"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41016) ->
    #exchange_data{type = 41, id = 41016, item_bid = 200203,
		   item_name = lang:get(<<"红酒小圆桌"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41017) ->
    #exchange_data{type = 41, id = 41017, item_bid = 200205,
		   item_name = lang:get(<<"皇室尊贵沙发"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41018) ->
    #exchange_data{type = 41, id = 41018, item_bid = 200251,
		   item_name = lang:get(<<"皇室贵族地板"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 5000};
get_by_eid(41019) ->
    #exchange_data{type = 41, id = 41019, item_bid = 200252,
		   item_name = lang:get(<<"皇室贵族墙壁"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 5000};
get_by_eid(41020) ->
    #exchange_data{type = 41, id = 41020, item_bid = 200301,
		   item_name = lang:get(<<"翠绿星座骰子"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 1500};
get_by_eid(41021) ->
    #exchange_data{type = 41, id = 41021, item_bid = 200302,
		   item_name = lang:get(<<"深紫星座骰子"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 1500};
get_by_eid(41022) ->
    #exchange_data{type = 41, id = 41022, item_bid = 200303,
		   item_name = lang:get(<<"湛蓝星座骰子"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 1500};
get_by_eid(41023) ->
    #exchange_data{type = 41, id = 41023, item_bid = 200309,
		   item_name = lang:get(<<"星月屏风"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41024) ->
    #exchange_data{type = 41, id = 41024, item_bid = 200304,
		   item_name = lang:get(<<"占星师靠椅"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41025) ->
    #exchange_data{type = 41, id = 41025, item_bid = 200305,
		   item_name = lang:get(<<"占星师小圆桌"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41026) ->
    #exchange_data{type = 41, id = 41026, item_bid = 200351,
		   item_name = lang:get(<<"占星密室地板"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 5000};
get_by_eid(41027) ->
    #exchange_data{type = 41, id = 41027, item_bid = 200352,
		   item_name = lang:get(<<"占星密室墙壁"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 5000};
get_by_eid(41028) ->
    #exchange_data{type = 41, id = 41028, item_bid = 200110,
		   item_name = lang:get(<<"绒毛圆毯"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 8000};
get_by_eid(41029) ->
    #exchange_data{type = 41, id = 41029, item_bid = 200410,
		   item_name = lang:get(<<"心意绵绵纸鹤"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41030) ->
    #exchange_data{type = 41, id = 41030, item_bid = 200412,
		   item_name = lang:get(<<"浓情七夕圆凳"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41031) ->
    #exchange_data{type = 41, id = 41031, item_bid = 200503,
		   item_name = lang:get(<<"逝者墓碑"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(41032) ->
    #exchange_data{type = 41, id = 41032, item_bid = 200504,
		   item_name = lang:get(<<"鬼面树干"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 3000};
get_by_eid(42101) ->
    #exchange_data{type = 42, id = 42101, item_bid = 100101,
		   item_name = lang:get(<<"压缩饼干"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 200, limit_soft = 200};
get_by_eid(42102) ->
    #exchange_data{type = 42, id = 42102, item_bid = 100102,
		   item_name = lang:get(<<"饭团"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 280, limit_soft = 600};
get_by_eid(42103) ->
    #exchange_data{type = 42, id = 42103, item_bid = 100103,
		   item_name = lang:get(<<"蛋糕"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 360, limit_soft = 1000};
get_by_eid(42104) ->
    #exchange_data{type = 42, id = 42104, item_bid = 100104,
		   item_name = lang:get(<<"法式面包"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 480, limit_soft = 1400};
get_by_eid(42105) ->
    #exchange_data{type = 42, id = 42105, item_bid = 100105,
		   item_name = lang:get(<<"三明治"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 600, limit_soft = 1800};
get_by_eid(42106) ->
    #exchange_data{type = 42, id = 42106, item_bid = 100106,
		   item_name = lang:get(<<"汉堡"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 680, limit_soft = 2300};
get_by_eid(42107) ->
    #exchange_data{type = 42, id = 42107, item_bid = 100107,
		   item_name = lang:get(<<"披萨"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 760, limit_soft = 2900};
get_by_eid(42108) ->
    #exchange_data{type = 42, id = 42108, item_bid = 100108,
		   item_name = lang:get(<<"豪华寿司组"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 880, limit_soft = 3500};
get_by_eid(42201) ->
    #exchange_data{type = 42, id = 42201, item_bid = 100201,
		   item_name = lang:get(<<"小礼盒"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 80, limit_day = 2};
get_by_eid(42202) ->
    #exchange_data{type = 42, id = 42202, item_bid = 100202,
		   item_name = lang:get(<<"玻璃瓶"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 80, limit_day = 2};
get_by_eid(42203) ->
    #exchange_data{type = 42, id = 42203, item_bid = 100203,
		   item_name = lang:get(<<"毛笔"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 80, limit_day = 2};
get_by_eid(42204) ->
    #exchange_data{type = 42, id = 42204, item_bid = 100204,
		   item_name = lang:get(<<"傻瓜机"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 80, limit_day = 2};
get_by_eid(42205) ->
    #exchange_data{type = 42, id = 42205, item_bid = 100205,
		   item_name = lang:get(<<"手持式探测器"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 80, limit_day = 2};
get_by_eid(42241) ->
    #exchange_data{type = 42, id = 42241, item_bid = 100241,
		   item_name = lang:get(<<"宝箱"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 160, limit_day = 2};
get_by_eid(42242) ->
    #exchange_data{type = 42, id = 42242, item_bid = 100242,
		   item_name = lang:get(<<"水晶瓶"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 160, limit_day = 2};
get_by_eid(42243) ->
    #exchange_data{type = 42, id = 42243, item_bid = 100243,
		   item_name = lang:get(<<"贵重的钢笔"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 160, limit_day = 2};
get_by_eid(42244) ->
    #exchange_data{type = 42, id = 42244, item_bid = 100244,
		   item_name = lang:get(<<"智能相机"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 160, limit_day = 2};
get_by_eid(42245) ->
    #exchange_data{type = 42, id = 42245, item_bid = 100245,
		   item_name = lang:get(<<"精密的探测仪"/utf8>>), item_num = 1,
		   pay_type = home_coin, price = 160, limit_day = 2};
get_by_eid(30001) ->
    #exchange_data{type = 30, id = 30001, item_bid = 40134,
		   item_name = lang:get(<<"神灵大祭司碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = sky_coin, price = 30000,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(30002) ->
    #exchange_data{type = 30, id = 30002, item_bid = 40234,
		   item_name = lang:get(<<"潘多拉碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = sky_coin, price = 30000,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(30003) ->
    #exchange_data{type = 30, id = 30003, item_bid = 40334,
		   item_name = lang:get(<<"斯芬克斯碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = sky_coin, price = 30000,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(30004) ->
    #exchange_data{type = 30, id = 30004, item_bid = 40434,
		   item_name = lang:get(<<"瓦尔基里碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = sky_coin, price = 30000,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(30005) ->
    #exchange_data{type = 30, id = 30005, item_bid = 39081,
		   item_name = lang:get(<<"冰雪女王碎片"/utf8>>), item_num = 5,
		   bind = 1, pay_type = sky_coin, price = 100,
		   limit_week = 2, lev = {1, 999}};
get_by_eid(30006) ->
    #exchange_data{type = 30, id = 30006, item_bid = 37004,
		   item_name = lang:get(<<"圣光之刃"/utf8>>), item_num = 1,
		   bind = 1, pay_type = sky_coin, price = 7000,
		   limit_week = 5, lev = {1, 999}};
get_by_eid(30007) ->
    #exchange_data{type = 30, id = 30007, item_bid = 37003,
		   item_name = lang:get(<<"圣光护甲"/utf8>>), item_num = 1,
		   bind = 1, pay_type = sky_coin, price = 5000,
		   limit_week = 10, lev = {1, 999}};
get_by_eid(30008) ->
    #exchange_data{type = 30, id = 30008, item_bid = 3,
		   item_name = lang:get(<<"圣光头盔"/utf8>>),
		   item_num = 1000000, bind = 1, pay_type = sky_coin,
		   price = 15000, limit_week = 5, lev = {1, 999}};
get_by_eid(30009) ->
    #exchange_data{type = 30, id = 30009, item_bid = 39039,
		   item_name = lang:get(<<"圣光戒指"/utf8>>), item_num = 10,
		   bind = 1, pay_type = sky_coin, price = 30000,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(30010) ->
    #exchange_data{type = 30, id = 30010, item_bid = 10450,
		   item_name = lang:get(<<"符文精华"/utf8>>), item_num = 5000,
		   bind = 1, pay_type = sky_coin, price = 999,
		   limit_week = 2, lev = {1, 999}};
get_by_eid(30011) ->
    #exchange_data{type = 30, id = 30011, item_bid = 10001,
		   item_name = lang:get(<<"皮肤碎片"/utf8>>), item_num = 10000,
		   bind = 1, pay_type = sky_coin, price = 250,
		   limit_week = 10, lev = {1, 999}};
get_by_eid(30012) ->
    #exchange_data{type = 30, id = 30012, item_bid = 39052,
		   item_name = lang:get(<<"皮肤碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = sky_coin, price = 1000,
		   limit_week = 10, lev = {1, 999}};
get_by_eid(36001) ->
    #exchange_data{type = 36, id = 36001, item_bid = 40113,
		   item_name = lang:get(<<"圣光之刃"/utf8>>), item_num = 1,
		   bind = 1, pay_type = cluster_guess_cent, price = 14500,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(36002) ->
    #exchange_data{type = 36, id = 36002, item_bid = 40213,
		   item_name = lang:get(<<"圣光护甲"/utf8>>), item_num = 1,
		   bind = 1, pay_type = cluster_guess_cent, price = 14500,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(36003) ->
    #exchange_data{type = 36, id = 36003, item_bid = 40313,
		   item_name = lang:get(<<"圣光头盔"/utf8>>), item_num = 1,
		   bind = 1, pay_type = cluster_guess_cent, price = 14500,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(36004) ->
    #exchange_data{type = 36, id = 36004, item_bid = 40413,
		   item_name = lang:get(<<"圣光戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = cluster_guess_cent, price = 14500,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(36005) ->
    #exchange_data{type = 36, id = 36005, item_bid = 10450,
		   item_name = lang:get(<<"符文精华"/utf8>>), item_num = 1000,
		   bind = 1, pay_type = cluster_guess_cent, price = 1250,
		   limit_week = 5, lev = {1, 999}};
get_by_eid(36006) ->
    #exchange_data{type = 36, id = 36006, item_bid = 10301,
		   item_name = lang:get(<<"冠军之心"/utf8>>), item_num = 1,
		   bind = 1, pay_type = cluster_guess_cent, price = 2500,
		   lev = {1, 999}};
get_by_eid(36007) ->
    #exchange_data{type = 36, id = 36007, item_bid = 10095,
		   item_name = lang:get(<<"天晶魔液"/utf8>>), item_num = 200,
		   bind = 1, pay_type = cluster_guess_cent, price = 5000,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(36008) ->
    #exchange_data{type = 36, id = 36008, item_bid = 10602,
		   item_name = lang:get(<<"玄魔蛋"/utf8>>), item_num = 1,
		   bind = 1, pay_type = cluster_guess_cent, price = 750,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(36009) ->
    #exchange_data{type = 36, id = 36009, item_bid = 24911,
		   item_name = lang:get(<<"天晶魔液"/utf8>>), item_num = 200,
		   bind = 1, pay_type = cluster_guess_cent, price = 37500,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(36010) ->
    #exchange_data{type = 36, id = 36010, item_bid = 25911,
		   item_name = lang:get(<<"玄魔蛋"/utf8>>), item_num = 1,
		   bind = 1, pay_type = cluster_guess_cent, price = 37500,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(36011) ->
    #exchange_data{type = 36, id = 36011, item_bid = 26909,
		   item_name = lang:get(<<"玄魔蛋"/utf8>>), item_num = 1,
		   bind = 1, pay_type = cluster_guess_cent, price = 37500,
		   limit_week = 1, lev = {1, 999}};
get_by_eid(37001) ->
    #exchange_data{type = 37, id = 37001, item_bid = 32,
		   item_name = lang:get(<<"烈阳晶石"/utf8>>), item_num = 10000,
		   bind = 1, pay_type = peak_guess_cent, price = 1000,
		   lev = {55, 999}};
get_by_eid(37002) ->
    #exchange_data{type = 37, id = 37002, item_bid = 10040,
		   item_name = lang:get(<<"奥术之尘"/utf8>>), item_num = 100,
		   bind = 1, pay_type = peak_guess_cent, price = 7500,
		   limit_week = 1, lev = {55, 999}};
get_by_eid(37003) ->
    #exchange_data{type = 37, id = 37003, item_bid = 10603,
		   item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		   bind = 1, pay_type = peak_guess_cent, price = 3600,
		   limit_month = 2, lev = {55, 999}};
get_by_eid(37004) ->
    #exchange_data{type = 37, id = 37004, item_bid = 27901,
		   item_name = lang:get(<<"拉斐尔碎片"/utf8>>), item_num = 5,
		   bind = 1, pay_type = peak_guess_cent, price = 5000,
		   limit_month = 10, lev = {55, 999}};
get_by_eid(37005) ->
    #exchange_data{type = 37, id = 37005, item_bid = 28901,
		   item_name = lang:get(<<"哈迪斯碎片"/utf8>>), item_num = 5,
		   bind = 1, pay_type = peak_guess_cent, price = 5000,
		   limit_month = 10, lev = {55, 999}};
get_by_eid(37006) ->
    #exchange_data{type = 37, id = 37006, item_bid = 24910,
		   item_name = lang:get(<<"酒神碎片"/utf8>>), item_num = 5,
		   bind = 1, pay_type = peak_guess_cent, price = 3750,
		   limit_month = 10, lev = {55, 999}};
get_by_eid(37007) ->
    #exchange_data{type = 37, id = 37007, item_bid = 25910,
		   item_name = lang:get(<<"海姆达尔碎片"/utf8>>), item_num = 5,
		   bind = 1, pay_type = peak_guess_cent, price = 3750,
		   limit_month = 10, lev = {55, 999}};
get_by_eid(37008) ->
    #exchange_data{type = 37, id = 37008, item_bid = 26906,
		   item_name = lang:get(<<"辛西娅碎片"/utf8>>), item_num = 5,
		   bind = 1, pay_type = peak_guess_cent, price = 3750,
		   limit_month = 10, lev = {55, 999}};
get_by_eid(37009) ->
    #exchange_data{type = 37, id = 37009, item_bid = 14001,
		   item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		   bind = 1, pay_type = peak_guess_cent, price = 5000,
		   limit_week = 1, lev = {55, 999}};
get_by_eid(37010) ->
    #exchange_data{type = 37, id = 37010, item_bid = 16201,
		   item_name = lang:get(<<"随机觉醒符石"/utf8>>), item_num = 1,
		   bind = 1, pay_type = peak_guess_cent, price = 10000,
		   limit_week = 1, lev = {160, 999}};
get_by_eid(37011) ->
    #exchange_data{type = 37, id = 37011, item_bid = 10460,
		   item_name = lang:get(<<"觉醒石"/utf8>>), item_num = 5,
		   bind = 1, pay_type = peak_guess_cent, price = 12500,
		   limit_week = 2, lev = {160, 999}};
get_by_eid(37012) ->
    #exchange_data{type = 37, id = 37012, item_bid = 10470,
		   item_name = lang:get(<<"好运宝珠"/utf8>>), item_num = 1,
		   bind = 1, pay_type = peak_guess_cent, price = 15000,
		   limit_month = 2, lev = {55, 999}};
get_by_eid(53002) ->
    #exchange_data{type = 53, id = 53002, item_bid = 28905,
		   item_name = lang:get(<<"冰雪女王碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 30, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53003) ->
    #exchange_data{type = 53, id = 53003, item_bid = 27900,
		   item_name = lang:get(<<"菲尼克斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 30, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53004) ->
    #exchange_data{type = 53, id = 53004, item_bid = 25903,
		   item_name = lang:get(<<"影刹碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 30, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53005) ->
    #exchange_data{type = 53, id = 53005, item_bid = 26901,
		   item_name = lang:get(<<"冰霜巨龙碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 30, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53006) ->
    #exchange_data{type = 53, id = 53006, item_bid = 24902,
		   item_name = lang:get(<<"派西斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53007) ->
    #exchange_data{type = 53, id = 53007, item_bid = 24905,
		   item_name = lang:get(<<"少年梅林碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53008) ->
    #exchange_data{type = 53, id = 53008, item_bid = 24906,
		   item_name = lang:get(<<"海宁芙碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53009) ->
    #exchange_data{type = 53, id = 53009, item_bid = 24907,
		   item_name = lang:get(<<"阿瑞斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53010) ->
    #exchange_data{type = 53, id = 53010, item_bid = 24908,
		   item_name = lang:get(<<"炽天使碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53011) ->
    #exchange_data{type = 53, id = 53011, item_bid = 25900,
		   item_name = lang:get(<<"炎魔之王碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53012) ->
    #exchange_data{type = 53, id = 53012, item_bid = 25901,
		   item_name = lang:get(<<"剑豪卡赞碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53013) ->
    #exchange_data{type = 53, id = 53013, item_bid = 25902,
		   item_name = lang:get(<<"阿波罗碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53014) ->
    #exchange_data{type = 53, id = 53014, item_bid = 25904,
		   item_name = lang:get(<<"吸血伯爵碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53015) ->
    #exchange_data{type = 53, id = 53015, item_bid = 25905,
		   item_name = lang:get(<<"奥丁碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53016) ->
    #exchange_data{type = 53, id = 53016, item_bid = 26900,
		   item_name = lang:get(<<"凯兰崔尔碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53017) ->
    #exchange_data{type = 53, id = 53017, item_bid = 26902,
		   item_name = lang:get(<<"魅魔女王碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53018) ->
    #exchange_data{type = 53, id = 53018, item_bid = 26903,
		   item_name = lang:get(<<"美杜莎碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53019) ->
    #exchange_data{type = 53, id = 53019, item_bid = 26904,
		   item_name = lang:get(<<"雅典娜碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53020) ->
    #exchange_data{type = 53, id = 53020, item_bid = 26905,
		   item_name = lang:get(<<"高级召唤卷"/utf8>>), item_num = 50,
		   bind = 1, pay_type = 10005, price = 20, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53021) ->
    #exchange_data{type = 53, id = 53021, item_bid = 10403,
		   item_name = lang:get(<<"雅典娜碎片"/utf8>>), item_num = 10,
		   bind = 1, pay_type = 10005, price = 15, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(53022) ->
    #exchange_data{type = 53, id = 53022, item_bid = 10510,
		   item_name = lang:get(<<"高级召唤卷"/utf8>>), item_num = 1,
		   bind = 1, pay_type = 10005, price = 1, limit_month = 0,
		   lev = {1, 999}};
get_by_eid(31001) ->
    #exchange_data{type = 31, id = 31001, item_bid = 24900,
		   item_name = lang:get(<<"5星娜迦公主碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 20, lev = {1, 999}};
get_by_eid(31002) ->
    #exchange_data{type = 31, id = 31002, item_bid = 24902,
		   item_name = lang:get(<<"5星冰霜巨龙碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 20, lev = {1, 999}};
get_by_eid(31003) ->
    #exchange_data{type = 31, id = 31003, item_bid = 24903,
		   item_name = lang:get(<<"5星泰坦碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31004) ->
    #exchange_data{type = 31, id = 31004, item_bid = 24904,
		   item_name = lang:get(<<"5星波塞冬碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31005) ->
    #exchange_data{type = 31, id = 31005, item_bid = 24905,
		   item_name = lang:get(<<"5星派西斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 20,
		   lev = {1, 999}};
get_by_eid(31006) ->
    #exchange_data{type = 31, id = 31006, item_bid = 24906,
		   item_name = lang:get(<<"5星少年梅林碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 20, lev = {1, 999}};
get_by_eid(31007) ->
    #exchange_data{type = 31, id = 31007, item_bid = 24907,
		   item_name = lang:get(<<"5星海宁芙碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 20,
		   lev = {1, 999}};
get_by_eid(31008) ->
    #exchange_data{type = 31, id = 31008, item_bid = 24908,
		   item_name = lang:get(<<"5星阿瑞斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 20,
		   lev = {1, 999}};
get_by_eid(31009) ->
    #exchange_data{type = 31, id = 31009, item_bid = 24901,
		   item_name = lang:get(<<"5星冰雪女王碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 35, lev = {1, 999}};
get_by_eid(31064) ->
    #exchange_data{type = 31, id = 31064, item_bid = 24909,
		   item_name = lang:get(<<"5星耶梦加得碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 35, lev = {1, 999}};
get_by_eid(31069) ->
    #exchange_data{type = 31, id = 31069, item_bid = 24910,
		   item_name = lang:get(<<"5星酒神碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31077) ->
    #exchange_data{type = 31, id = 31077, item_bid = 24911,
		   item_name = lang:get(<<"5星利维坦碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31010) ->
    #exchange_data{type = 31, id = 31010, item_bid = 25900,
		   item_name = lang:get(<<"5星炽天使碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 20,
		   lev = {1, 999}};
get_by_eid(31011) ->
    #exchange_data{type = 31, id = 31011, item_bid = 25901,
		   item_name = lang:get(<<"5星炎魔之王碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 20, lev = {1, 999}};
get_by_eid(31012) ->
    #exchange_data{type = 31, id = 31012, item_bid = 25902,
		   item_name = lang:get(<<"5星剑豪卡赞碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 20, lev = {1, 999}};
get_by_eid(31013) ->
    #exchange_data{type = 31, id = 31013, item_bid = 25903,
		   item_name = lang:get(<<"5星菲尼克斯碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 20, lev = {1, 999}};
get_by_eid(31014) ->
    #exchange_data{type = 31, id = 31014, item_bid = 25904,
		   item_name = lang:get(<<"5星阿波罗碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 20,
		   lev = {1, 999}};
get_by_eid(31015) ->
    #exchange_data{type = 31, id = 31015, item_bid = 25905,
		   item_name = lang:get(<<"5星吸血伯爵碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 20, lev = {1, 999}};
get_by_eid(31063) ->
    #exchange_data{type = 31, id = 31063, item_bid = 25908,
		   item_name = lang:get(<<"5星洛基碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31016) ->
    #exchange_data{type = 31, id = 31016, item_bid = 25906,
		   item_name = lang:get(<<"5星普罗米修斯碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 35, lev = {1, 999}};
get_by_eid(31017) ->
    #exchange_data{type = 31, id = 31017, item_bid = 25907,
		   item_name = lang:get(<<"瓦尔基里碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31071) ->
    #exchange_data{type = 31, id = 31071, item_bid = 25909,
		   item_name = lang:get(<<"哪吒碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31074) ->
    #exchange_data{type = 31, id = 31074, item_bid = 25910,
		   item_name = lang:get(<<"海姆达尔碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31078) ->
    #exchange_data{type = 31, id = 31078, item_bid = 25911,
		   item_name = lang:get(<<"阿奇丽碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 45,
		   lev = {1, 999}};
get_by_eid(31018) ->
    #exchange_data{type = 31, id = 31018, item_bid = 26900,
		   item_name = lang:get(<<"5星奥丁碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 20,
		   lev = {1, 999}};
get_by_eid(31019) ->
    #exchange_data{type = 31, id = 31019, item_bid = 26901,
		   item_name = lang:get(<<"5星影刹碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31020) ->
    #exchange_data{type = 31, id = 31020, item_bid = 26902,
		   item_name = lang:get(<<"5星凯兰崔尔碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 20, lev = {1, 999}};
get_by_eid(31021) ->
    #exchange_data{type = 31, id = 31021, item_bid = 26903,
		   item_name = lang:get(<<"5星魅魔女王碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 20, lev = {1, 999}};
get_by_eid(31022) ->
    #exchange_data{type = 31, id = 31022, item_bid = 26904,
		   item_name = lang:get(<<"5星美杜莎碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 20,
		   lev = {1, 999}};
get_by_eid(31023) ->
    #exchange_data{type = 31, id = 31023, item_bid = 26905,
		   item_name = lang:get(<<"5星雅典娜碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 20,
		   lev = {1, 999}};
get_by_eid(31024) ->
    #exchange_data{type = 31, id = 31024, item_bid = 26906,
		   item_name = lang:get(<<"5星潘碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31025) ->
    #exchange_data{type = 31, id = 31025, item_bid = 26907,
		   item_name = lang:get(<<"斯芬克斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31066) ->
    #exchange_data{type = 31, id = 31066, item_bid = 26908,
		   item_name = lang:get(<<"芬尼尔碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31068) ->
    #exchange_data{type = 31, id = 31068, item_bid = 26909,
		   item_name = lang:get(<<"拉塔托斯克碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31073) ->
    #exchange_data{type = 31, id = 31073, item_bid = 26910,
		   item_name = lang:get(<<"辛西娅碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31079) ->
    #exchange_data{type = 31, id = 31079, item_bid = 26911,
		   item_name = lang:get(<<"塞莎特碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31026) ->
    #exchange_data{type = 31, id = 31026, item_bid = 27900,
		   item_name = lang:get(<<"4星伊西斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 25,
		   lev = {1, 999}};
get_by_eid(31028) ->
    #exchange_data{type = 31, id = 31028, item_bid = 27903,
		   item_name = lang:get(<<"5星赫拉碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31029) ->
    #exchange_data{type = 31, id = 31029, item_bid = 27904,
		   item_name = lang:get(<<"5星雷神碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 25,
		   lev = {1, 999}};
get_by_eid(31030) ->
    #exchange_data{type = 31, id = 31030, item_bid = 27905,
		   item_name = lang:get(<<"5星盖亚碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31031) ->
    #exchange_data{type = 31, id = 31031, item_bid = 27906,
		   item_name = lang:get(<<"5星艾蕾莉亚碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 45, lev = {1, 999}};
get_by_eid(31032) ->
    #exchange_data{type = 31, id = 31032, item_bid = 27901,
		   item_name = lang:get(<<"5星神灵大祭司碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 45, lev = {1, 999}};
get_by_eid(31065) ->
    #exchange_data{type = 31, id = 31065, item_bid = 27907,
		   item_name = lang:get(<<"宙斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 45,
		   lev = {1, 999}};
get_by_eid(31070) ->
    #exchange_data{type = 31, id = 31070, item_bid = 27908,
		   item_name = lang:get(<<"拉斐尔碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 45,
		   lev = {1, 999}};
get_by_eid(31076) ->
    #exchange_data{type = 31, id = 31076, item_bid = 27909,
		   item_name = lang:get(<<"维纳斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 45,
		   lev = {1, 999}};
get_by_eid(31033) ->
    #exchange_data{type = 31, id = 31033, item_bid = 28900,
		   item_name = lang:get(<<"加百列碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 25,
		   lev = {1, 999}};
get_by_eid(31034) ->
    #exchange_data{type = 31, id = 31034, item_bid = 28901,
		   item_name = lang:get(<<"4星蛇女墨莎碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 45, lev = {1, 999}};
get_by_eid(31035) ->
    #exchange_data{type = 31, id = 31035, item_bid = 28902,
		   item_name = lang:get(<<"5星哈迪斯碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31036) ->
    #exchange_data{type = 31, id = 31036, item_bid = 28904,
		   item_name = lang:get(<<"5星亚巴顿碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 35,
		   lev = {1, 999}};
get_by_eid(31037) ->
    #exchange_data{type = 31, id = 31037, item_bid = 28905,
		   item_name = lang:get(<<"5星阿努比斯碎片"/utf8>>),
		   item_num = 50, bind = 1, pay_type = recruithigh_hero,
		   price = 25, lev = {1, 999}};
get_by_eid(31038) ->
    #exchange_data{type = 31, id = 31038, item_bid = 28906,
		   item_name = lang:get(<<"5星路西法碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 45,
		   lev = {1, 999}};
get_by_eid(31039) ->
    #exchange_data{type = 31, id = 31039, item_bid = 28903,
		   item_name = lang:get(<<"5星潘多拉碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 45,
		   lev = {1, 999}};
get_by_eid(31067) ->
    #exchange_data{type = 31, id = 31067, item_bid = 28907,
		   item_name = lang:get(<<"黑暗之主碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 45,
		   lev = {1, 999}};
get_by_eid(31072) ->
    #exchange_data{type = 31, id = 31072, item_bid = 28908,
		   item_name = lang:get(<<"海拉碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 45,
		   lev = {1, 999}};
get_by_eid(31075) ->
    #exchange_data{type = 31, id = 31075, item_bid = 28909,
		   item_name = lang:get(<<"尼德霍格碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 45,
		   lev = {1, 999}};
get_by_eid(31040) ->
    #exchange_data{type = 31, id = 31040, item_bid = 24800,
		   item_name = lang:get(<<"阿蒙碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31041) ->
    #exchange_data{type = 31, id = 31041, item_bid = 24801,
		   item_name = lang:get(<<"亚瑟碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31042) ->
    #exchange_data{type = 31, id = 31042, item_bid = 24802,
		   item_name = lang:get(<<"竖琴海妖碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31043) ->
    #exchange_data{type = 31, id = 31043, item_bid = 24803,
		   item_name = lang:get(<<"水元素碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31044) ->
    #exchange_data{type = 31, id = 31044, item_bid = 24804,
		   item_name = lang:get(<<"冰晶女巫碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31045) ->
    #exchange_data{type = 31, id = 31045, item_bid = 25800,
		   item_name = lang:get(<<"娜迦侍女碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31046) ->
    #exchange_data{type = 31, id = 31046, item_bid = 25801,
		   item_name = lang:get(<<"火枪艾克碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31047) ->
    #exchange_data{type = 31, id = 31047, item_bid = 25802,
		   item_name = lang:get(<<"凯瑟琳碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31048) ->
    #exchange_data{type = 31, id = 31048, item_bid = 25803,
		   item_name = lang:get(<<"阿伽门农碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31049) ->
    #exchange_data{type = 31, id = 31049, item_bid = 25804,
		   item_name = lang:get(<<"雷诺蛮锤碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31050) ->
    #exchange_data{type = 31, id = 31050, item_bid = 26800,
		   item_name = lang:get(<<"翼女碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(31051) ->
    #exchange_data{type = 31, id = 31051, item_bid = 26801,
		   item_name = lang:get(<<"吟游诗人碎片"/utf8>>), item_num = 30,
		   bind = 1, pay_type = recruithigh_hero, price = 3,
		   lev = {1, 999}};
get_by_eid(40001) ->
    #exchange_data{type = 31, id = 40001, item_bid = 28910,
		   item_name = lang:get(<<"亡灵收割者碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40002) ->
    #exchange_data{type = 31, id = 40002, item_bid = 25912,
		   item_name = lang:get(<<"圣锤提尔碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40003) ->
    #exchange_data{type = 31, id = 40003, item_bid = 26912,
		   item_name = lang:get(<<"甘道夫碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(31080) ->
    #exchange_data{type = 31, id = 31080, item_bid = 28911,
		   item_name = lang:get(<<"德鲁伊碎片"/utf8>>), item_num = 50,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40004) ->
    #exchange_data{type = 31, id = 40004, item_bid = 24413,
		   item_name = lang:get(<<"光明牧师碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40005) ->
    #exchange_data{type = 31, id = 40005, item_bid = 27410,
		   item_name = lang:get(<<"月之祭司碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40006) ->
    #exchange_data{type = 31, id = 40006, item_bid = 28412,
		   item_name = lang:get(<<"精灵王子碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40007) ->
    #exchange_data{type = 31, id = 40007, item_bid = 27414,
		   item_name = lang:get(<<"丘比特碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40008) ->
    #exchange_data{type = 31, id = 40008, item_bid = 26413,
		   item_name = lang:get(<<"毒咒女巫碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40011) ->
    #exchange_data{type = 31, id = 40011, item_bid = 27411,
		   item_name = lang:get(<<"黑精灵密言碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40014) ->
    #exchange_data{type = 31, id = 40014, item_bid = 27413,
		   item_name = lang:get(<<"精灵王子碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(40016) ->
    #exchange_data{type = 31, id = 40016, item_bid = 25413,
		   item_name = lang:get(<<"毒咒女巫碎片"/utf8>>), item_num = 1,
		   bind = 1, pay_type = recruithigh_hero, price = 200,
		   lev = {1, 999}};
get_by_eid(10030) ->
    #exchange_data{type = 28, id = 10030, item_bid = 10030,
		   item_name = lang:get(<<"天界神石"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 5,
		   limit_day = 100, lev = 105};
get_by_eid(99010101) ->
    #exchange_data{type = 28, id = 99010101,
		   item_bid = 99010101,
		   item_name = lang:get(<<"1星勇气耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99010201) ->
    #exchange_data{type = 28, id = 99010201,
		   item_bid = 99010201,
		   item_name = lang:get(<<"2星勇气耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99010301) ->
    #exchange_data{type = 28, id = 99010301,
		   item_bid = 99010301,
		   item_name = lang:get(<<"3星勇气耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99010401) ->
    #exchange_data{type = 28, id = 99010401,
		   item_bid = 99010401,
		   item_name = lang:get(<<"4星勇气耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99010501) ->
    #exchange_data{type = 28, id = 99010501,
		   item_bid = 99010501,
		   item_name = lang:get(<<"5星勇气耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99010102) ->
    #exchange_data{type = 28, id = 99010102,
		   item_bid = 99010102,
		   item_name = lang:get(<<"1星勇气项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99010202) ->
    #exchange_data{type = 28, id = 99010202,
		   item_bid = 99010202,
		   item_name = lang:get(<<"2星勇气项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99010302) ->
    #exchange_data{type = 28, id = 99010302,
		   item_bid = 99010302,
		   item_name = lang:get(<<"3星勇气项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99010402) ->
    #exchange_data{type = 28, id = 99010402,
		   item_bid = 99010402,
		   item_name = lang:get(<<"4星勇气项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99010502) ->
    #exchange_data{type = 28, id = 99010502,
		   item_bid = 99010502,
		   item_name = lang:get(<<"5星勇气项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99010103) ->
    #exchange_data{type = 28, id = 99010103,
		   item_bid = 99010103,
		   item_name = lang:get(<<"1星勇气戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99010203) ->
    #exchange_data{type = 28, id = 99010203,
		   item_bid = 99010203,
		   item_name = lang:get(<<"2星勇气戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99010303) ->
    #exchange_data{type = 28, id = 99010303,
		   item_bid = 99010303,
		   item_name = lang:get(<<"3星勇气戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99010403) ->
    #exchange_data{type = 28, id = 99010403,
		   item_bid = 99010403,
		   item_name = lang:get(<<"4星勇气戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99010503) ->
    #exchange_data{type = 28, id = 99010503,
		   item_bid = 99010503,
		   item_name = lang:get(<<"5星勇气戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99010104) ->
    #exchange_data{type = 28, id = 99010104,
		   item_bid = 99010104,
		   item_name = lang:get(<<"1星勇气手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99010204) ->
    #exchange_data{type = 28, id = 99010204,
		   item_bid = 99010204,
		   item_name = lang:get(<<"2星勇气手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99010304) ->
    #exchange_data{type = 28, id = 99010304,
		   item_bid = 99010304,
		   item_name = lang:get(<<"3星勇气手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99010404) ->
    #exchange_data{type = 28, id = 99010404,
		   item_bid = 99010404,
		   item_name = lang:get(<<"4星勇气手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99010504) ->
    #exchange_data{type = 28, id = 99010504,
		   item_bid = 99010504,
		   item_name = lang:get(<<"5星勇气手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99020101) ->
    #exchange_data{type = 28, id = 99020101,
		   item_bid = 99020101,
		   item_name = lang:get(<<"1星狂怒耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99020201) ->
    #exchange_data{type = 28, id = 99020201,
		   item_bid = 99020201,
		   item_name = lang:get(<<"2星狂怒耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99020301) ->
    #exchange_data{type = 28, id = 99020301,
		   item_bid = 99020301,
		   item_name = lang:get(<<"3星狂怒耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99020401) ->
    #exchange_data{type = 28, id = 99020401,
		   item_bid = 99020401,
		   item_name = lang:get(<<"4星狂怒耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99020501) ->
    #exchange_data{type = 28, id = 99020501,
		   item_bid = 99020501,
		   item_name = lang:get(<<"5星狂怒耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99020102) ->
    #exchange_data{type = 28, id = 99020102,
		   item_bid = 99020102,
		   item_name = lang:get(<<"1星狂怒项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99020202) ->
    #exchange_data{type = 28, id = 99020202,
		   item_bid = 99020202,
		   item_name = lang:get(<<"2星狂怒项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99020302) ->
    #exchange_data{type = 28, id = 99020302,
		   item_bid = 99020302,
		   item_name = lang:get(<<"3星狂怒项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99020402) ->
    #exchange_data{type = 28, id = 99020402,
		   item_bid = 99020402,
		   item_name = lang:get(<<"4星狂怒项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99020502) ->
    #exchange_data{type = 28, id = 99020502,
		   item_bid = 99020502,
		   item_name = lang:get(<<"5星狂怒项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99020103) ->
    #exchange_data{type = 28, id = 99020103,
		   item_bid = 99020103,
		   item_name = lang:get(<<"1星狂怒戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99020203) ->
    #exchange_data{type = 28, id = 99020203,
		   item_bid = 99020203,
		   item_name = lang:get(<<"2星狂怒戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99020303) ->
    #exchange_data{type = 28, id = 99020303,
		   item_bid = 99020303,
		   item_name = lang:get(<<"3星狂怒戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99020403) ->
    #exchange_data{type = 28, id = 99020403,
		   item_bid = 99020403,
		   item_name = lang:get(<<"4星狂怒戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99020503) ->
    #exchange_data{type = 28, id = 99020503,
		   item_bid = 99020503,
		   item_name = lang:get(<<"5星狂怒戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99020104) ->
    #exchange_data{type = 28, id = 99020104,
		   item_bid = 99020104,
		   item_name = lang:get(<<"1星狂怒手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99020204) ->
    #exchange_data{type = 28, id = 99020204,
		   item_bid = 99020204,
		   item_name = lang:get(<<"2星狂怒手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99020304) ->
    #exchange_data{type = 28, id = 99020304,
		   item_bid = 99020304,
		   item_name = lang:get(<<"3星狂怒手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99020404) ->
    #exchange_data{type = 28, id = 99020404,
		   item_bid = 99020404,
		   item_name = lang:get(<<"4星狂怒手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99020504) ->
    #exchange_data{type = 28, id = 99020504,
		   item_bid = 99020504,
		   item_name = lang:get(<<"5星狂怒手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99030101) ->
    #exchange_data{type = 28, id = 99030101,
		   item_bid = 99030101,
		   item_name = lang:get(<<"1星斗志耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99030201) ->
    #exchange_data{type = 28, id = 99030201,
		   item_bid = 99030201,
		   item_name = lang:get(<<"2星斗志耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99030301) ->
    #exchange_data{type = 28, id = 99030301,
		   item_bid = 99030301,
		   item_name = lang:get(<<"3星斗志耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99030401) ->
    #exchange_data{type = 28, id = 99030401,
		   item_bid = 99030401,
		   item_name = lang:get(<<"4星斗志耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99030501) ->
    #exchange_data{type = 28, id = 99030501,
		   item_bid = 99030501,
		   item_name = lang:get(<<"5星斗志耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99030102) ->
    #exchange_data{type = 28, id = 99030102,
		   item_bid = 99030102,
		   item_name = lang:get(<<"1星斗志项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99030202) ->
    #exchange_data{type = 28, id = 99030202,
		   item_bid = 99030202,
		   item_name = lang:get(<<"2星斗志项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99030302) ->
    #exchange_data{type = 28, id = 99030302,
		   item_bid = 99030302,
		   item_name = lang:get(<<"3星斗志项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99030402) ->
    #exchange_data{type = 28, id = 99030402,
		   item_bid = 99030402,
		   item_name = lang:get(<<"4星斗志项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99030502) ->
    #exchange_data{type = 28, id = 99030502,
		   item_bid = 99030502,
		   item_name = lang:get(<<"5星斗志项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99030103) ->
    #exchange_data{type = 28, id = 99030103,
		   item_bid = 99030103,
		   item_name = lang:get(<<"1星斗志戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99030203) ->
    #exchange_data{type = 28, id = 99030203,
		   item_bid = 99030203,
		   item_name = lang:get(<<"2星斗志戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99030303) ->
    #exchange_data{type = 28, id = 99030303,
		   item_bid = 99030303,
		   item_name = lang:get(<<"3星斗志戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99030403) ->
    #exchange_data{type = 28, id = 99030403,
		   item_bid = 99030403,
		   item_name = lang:get(<<"4星斗志戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99030503) ->
    #exchange_data{type = 28, id = 99030503,
		   item_bid = 99030503,
		   item_name = lang:get(<<"5星斗志戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99030104) ->
    #exchange_data{type = 28, id = 99030104,
		   item_bid = 99030104,
		   item_name = lang:get(<<"1星斗志手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99030204) ->
    #exchange_data{type = 28, id = 99030204,
		   item_bid = 99030204,
		   item_name = lang:get(<<"2星斗志手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99030304) ->
    #exchange_data{type = 28, id = 99030304,
		   item_bid = 99030304,
		   item_name = lang:get(<<"3星斗志手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99030404) ->
    #exchange_data{type = 28, id = 99030404,
		   item_bid = 99030404,
		   item_name = lang:get(<<"4星斗志手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99030504) ->
    #exchange_data{type = 28, id = 99030504,
		   item_bid = 99030504,
		   item_name = lang:get(<<"5星斗志手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99040101) ->
    #exchange_data{type = 28, id = 99040101,
		   item_bid = 99040101,
		   item_name = lang:get(<<"1星灵咏耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99040201) ->
    #exchange_data{type = 28, id = 99040201,
		   item_bid = 99040201,
		   item_name = lang:get(<<"2星灵咏耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99040301) ->
    #exchange_data{type = 28, id = 99040301,
		   item_bid = 99040301,
		   item_name = lang:get(<<"3星灵咏耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99040401) ->
    #exchange_data{type = 28, id = 99040401,
		   item_bid = 99040401,
		   item_name = lang:get(<<"4星灵咏耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99040501) ->
    #exchange_data{type = 28, id = 99040501,
		   item_bid = 99040501,
		   item_name = lang:get(<<"5星灵咏耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99040102) ->
    #exchange_data{type = 28, id = 99040102,
		   item_bid = 99040102,
		   item_name = lang:get(<<"1星灵咏项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99040202) ->
    #exchange_data{type = 28, id = 99040202,
		   item_bid = 99040202,
		   item_name = lang:get(<<"2星灵咏项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99040302) ->
    #exchange_data{type = 28, id = 99040302,
		   item_bid = 99040302,
		   item_name = lang:get(<<"3星灵咏项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99040402) ->
    #exchange_data{type = 28, id = 99040402,
		   item_bid = 99040402,
		   item_name = lang:get(<<"4星灵咏项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99040502) ->
    #exchange_data{type = 28, id = 99040502,
		   item_bid = 99040502,
		   item_name = lang:get(<<"5星灵咏项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99040103) ->
    #exchange_data{type = 28, id = 99040103,
		   item_bid = 99040103,
		   item_name = lang:get(<<"1星灵咏戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99040203) ->
    #exchange_data{type = 28, id = 99040203,
		   item_bid = 99040203,
		   item_name = lang:get(<<"2星灵咏戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99040303) ->
    #exchange_data{type = 28, id = 99040303,
		   item_bid = 99040303,
		   item_name = lang:get(<<"3星灵咏戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99040403) ->
    #exchange_data{type = 28, id = 99040403,
		   item_bid = 99040403,
		   item_name = lang:get(<<"4星灵咏戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99040503) ->
    #exchange_data{type = 28, id = 99040503,
		   item_bid = 99040503,
		   item_name = lang:get(<<"5星灵咏戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99040104) ->
    #exchange_data{type = 28, id = 99040104,
		   item_bid = 99040104,
		   item_name = lang:get(<<"1星灵咏手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 40,
		   lev = 105, buy_condit = 0};
get_by_eid(99040204) ->
    #exchange_data{type = 28, id = 99040204,
		   item_bid = 99040204,
		   item_name = lang:get(<<"2星灵咏手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 70,
		   lev = 105, buy_condit = 0};
get_by_eid(99040304) ->
    #exchange_data{type = 28, id = 99040304,
		   item_bid = 99040304,
		   item_name = lang:get(<<"3星灵咏手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 0};
get_by_eid(99040404) ->
    #exchange_data{type = 28, id = 99040404,
		   item_bid = 99040404,
		   item_name = lang:get(<<"4星灵咏手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 160,
		   lev = 105, buy_condit = 15000};
get_by_eid(99040504) ->
    #exchange_data{type = 28, id = 99040504,
		   item_bid = 99040504,
		   item_name = lang:get(<<"5星灵咏手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 24000};
get_by_eid(99050101) ->
    #exchange_data{type = 28, id = 99050101,
		   item_bid = 99050101,
		   item_name = lang:get(<<"1星穿甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050201) ->
    #exchange_data{type = 28, id = 99050201,
		   item_bid = 99050201,
		   item_name = lang:get(<<"2星穿甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050301) ->
    #exchange_data{type = 28, id = 99050301,
		   item_bid = 99050301,
		   item_name = lang:get(<<"3星穿甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050401) ->
    #exchange_data{type = 28, id = 99050401,
		   item_bid = 99050401,
		   item_name = lang:get(<<"4星穿甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99050501) ->
    #exchange_data{type = 28, id = 99050501,
		   item_bid = 99050501,
		   item_name = lang:get(<<"5星穿甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99050102) ->
    #exchange_data{type = 28, id = 99050102,
		   item_bid = 99050102,
		   item_name = lang:get(<<"1星穿甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050202) ->
    #exchange_data{type = 28, id = 99050202,
		   item_bid = 99050202,
		   item_name = lang:get(<<"2星穿甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050302) ->
    #exchange_data{type = 28, id = 99050302,
		   item_bid = 99050302,
		   item_name = lang:get(<<"3星穿甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050402) ->
    #exchange_data{type = 28, id = 99050402,
		   item_bid = 99050402,
		   item_name = lang:get(<<"4星穿甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99050502) ->
    #exchange_data{type = 28, id = 99050502,
		   item_bid = 99050502,
		   item_name = lang:get(<<"5星穿甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99050103) ->
    #exchange_data{type = 28, id = 99050103,
		   item_bid = 99050103,
		   item_name = lang:get(<<"1星穿甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050203) ->
    #exchange_data{type = 28, id = 99050203,
		   item_bid = 99050203,
		   item_name = lang:get(<<"2星穿甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050303) ->
    #exchange_data{type = 28, id = 99050303,
		   item_bid = 99050303,
		   item_name = lang:get(<<"3星穿甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050403) ->
    #exchange_data{type = 28, id = 99050403,
		   item_bid = 99050403,
		   item_name = lang:get(<<"4星穿甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99050503) ->
    #exchange_data{type = 28, id = 99050503,
		   item_bid = 99050503,
		   item_name = lang:get(<<"5星穿甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99050104) ->
    #exchange_data{type = 28, id = 99050104,
		   item_bid = 99050104,
		   item_name = lang:get(<<"1星穿甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050204) ->
    #exchange_data{type = 28, id = 99050204,
		   item_bid = 99050204,
		   item_name = lang:get(<<"2星穿甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050304) ->
    #exchange_data{type = 28, id = 99050304,
		   item_bid = 99050304,
		   item_name = lang:get(<<"3星穿甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99050404) ->
    #exchange_data{type = 28, id = 99050404,
		   item_bid = 99050404,
		   item_name = lang:get(<<"4星穿甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99050504) ->
    #exchange_data{type = 28, id = 99050504,
		   item_bid = 99050504,
		   item_name = lang:get(<<"5星穿甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99060101) ->
    #exchange_data{type = 28, id = 99060101,
		   item_bid = 99060101,
		   item_name = lang:get(<<"1星破法耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060201) ->
    #exchange_data{type = 28, id = 99060201,
		   item_bid = 99060201,
		   item_name = lang:get(<<"2星破法耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060301) ->
    #exchange_data{type = 28, id = 99060301,
		   item_bid = 99060301,
		   item_name = lang:get(<<"3星破法耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060401) ->
    #exchange_data{type = 28, id = 99060401,
		   item_bid = 99060401,
		   item_name = lang:get(<<"4星破法耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99060501) ->
    #exchange_data{type = 28, id = 99060501,
		   item_bid = 99060501,
		   item_name = lang:get(<<"5星破法耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99060102) ->
    #exchange_data{type = 28, id = 99060102,
		   item_bid = 99060102,
		   item_name = lang:get(<<"1星破法项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060202) ->
    #exchange_data{type = 28, id = 99060202,
		   item_bid = 99060202,
		   item_name = lang:get(<<"2星破法项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060302) ->
    #exchange_data{type = 28, id = 99060302,
		   item_bid = 99060302,
		   item_name = lang:get(<<"3星破法项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060402) ->
    #exchange_data{type = 28, id = 99060402,
		   item_bid = 99060402,
		   item_name = lang:get(<<"4星破法项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99060502) ->
    #exchange_data{type = 28, id = 99060502,
		   item_bid = 99060502,
		   item_name = lang:get(<<"5星破法项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99060103) ->
    #exchange_data{type = 28, id = 99060103,
		   item_bid = 99060103,
		   item_name = lang:get(<<"1星破法戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060203) ->
    #exchange_data{type = 28, id = 99060203,
		   item_bid = 99060203,
		   item_name = lang:get(<<"2星破法戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060303) ->
    #exchange_data{type = 28, id = 99060303,
		   item_bid = 99060303,
		   item_name = lang:get(<<"3星破法戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060403) ->
    #exchange_data{type = 28, id = 99060403,
		   item_bid = 99060403,
		   item_name = lang:get(<<"4星破法戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99060503) ->
    #exchange_data{type = 28, id = 99060503,
		   item_bid = 99060503,
		   item_name = lang:get(<<"5星破法戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99060104) ->
    #exchange_data{type = 28, id = 99060104,
		   item_bid = 99060104,
		   item_name = lang:get(<<"1星破法手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060204) ->
    #exchange_data{type = 28, id = 99060204,
		   item_bid = 99060204,
		   item_name = lang:get(<<"2星破法手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060304) ->
    #exchange_data{type = 28, id = 99060304,
		   item_bid = 99060304,
		   item_name = lang:get(<<"3星破法手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99060404) ->
    #exchange_data{type = 28, id = 99060404,
		   item_bid = 99060404,
		   item_name = lang:get(<<"4星破法手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99060504) ->
    #exchange_data{type = 28, id = 99060504,
		   item_bid = 99060504,
		   item_name = lang:get(<<"5星破法手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99070101) ->
    #exchange_data{type = 28, id = 99070101,
		   item_bid = 99070101,
		   item_name = lang:get(<<"1星斗战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070201) ->
    #exchange_data{type = 28, id = 99070201,
		   item_bid = 99070201,
		   item_name = lang:get(<<"2星斗战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070301) ->
    #exchange_data{type = 28, id = 99070301,
		   item_bid = 99070301,
		   item_name = lang:get(<<"3星斗战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070401) ->
    #exchange_data{type = 28, id = 99070401,
		   item_bid = 99070401,
		   item_name = lang:get(<<"4星斗战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99070501) ->
    #exchange_data{type = 28, id = 99070501,
		   item_bid = 99070501,
		   item_name = lang:get(<<"5星斗战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99070102) ->
    #exchange_data{type = 28, id = 99070102,
		   item_bid = 99070102,
		   item_name = lang:get(<<"1星斗战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070202) ->
    #exchange_data{type = 28, id = 99070202,
		   item_bid = 99070202,
		   item_name = lang:get(<<"2星斗战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070302) ->
    #exchange_data{type = 28, id = 99070302,
		   item_bid = 99070302,
		   item_name = lang:get(<<"3星斗战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070402) ->
    #exchange_data{type = 28, id = 99070402,
		   item_bid = 99070402,
		   item_name = lang:get(<<"4星斗战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99070502) ->
    #exchange_data{type = 28, id = 99070502,
		   item_bid = 99070502,
		   item_name = lang:get(<<"5星斗战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99070103) ->
    #exchange_data{type = 28, id = 99070103,
		   item_bid = 99070103,
		   item_name = lang:get(<<"1星斗战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070203) ->
    #exchange_data{type = 28, id = 99070203,
		   item_bid = 99070203,
		   item_name = lang:get(<<"2星斗战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070303) ->
    #exchange_data{type = 28, id = 99070303,
		   item_bid = 99070303,
		   item_name = lang:get(<<"3星斗战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070403) ->
    #exchange_data{type = 28, id = 99070403,
		   item_bid = 99070403,
		   item_name = lang:get(<<"4星斗战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99070503) ->
    #exchange_data{type = 28, id = 99070503,
		   item_bid = 99070503,
		   item_name = lang:get(<<"5星斗战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99070104) ->
    #exchange_data{type = 28, id = 99070104,
		   item_bid = 99070104,
		   item_name = lang:get(<<"1星斗战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070204) ->
    #exchange_data{type = 28, id = 99070204,
		   item_bid = 99070204,
		   item_name = lang:get(<<"2星斗战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070304) ->
    #exchange_data{type = 28, id = 99070304,
		   item_bid = 99070304,
		   item_name = lang:get(<<"3星斗战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99070404) ->
    #exchange_data{type = 28, id = 99070404,
		   item_bid = 99070404,
		   item_name = lang:get(<<"4星斗战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99070504) ->
    #exchange_data{type = 28, id = 99070504,
		   item_bid = 99070504,
		   item_name = lang:get(<<"5星斗战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99080101) ->
    #exchange_data{type = 28, id = 99080101,
		   item_bid = 99080101,
		   item_name = lang:get(<<"1星镇灵耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080201) ->
    #exchange_data{type = 28, id = 99080201,
		   item_bid = 99080201,
		   item_name = lang:get(<<"2星镇灵耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080301) ->
    #exchange_data{type = 28, id = 99080301,
		   item_bid = 99080301,
		   item_name = lang:get(<<"3星镇灵耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080401) ->
    #exchange_data{type = 28, id = 99080401,
		   item_bid = 99080401,
		   item_name = lang:get(<<"4星镇灵耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99080501) ->
    #exchange_data{type = 28, id = 99080501,
		   item_bid = 99080501,
		   item_name = lang:get(<<"5星镇灵耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99080102) ->
    #exchange_data{type = 28, id = 99080102,
		   item_bid = 99080102,
		   item_name = lang:get(<<"1星镇灵项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080202) ->
    #exchange_data{type = 28, id = 99080202,
		   item_bid = 99080202,
		   item_name = lang:get(<<"2星镇灵项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080302) ->
    #exchange_data{type = 28, id = 99080302,
		   item_bid = 99080302,
		   item_name = lang:get(<<"3星镇灵项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080402) ->
    #exchange_data{type = 28, id = 99080402,
		   item_bid = 99080402,
		   item_name = lang:get(<<"4星镇灵项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99080502) ->
    #exchange_data{type = 28, id = 99080502,
		   item_bid = 99080502,
		   item_name = lang:get(<<"5星镇灵项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99080103) ->
    #exchange_data{type = 28, id = 99080103,
		   item_bid = 99080103,
		   item_name = lang:get(<<"1星镇灵戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080203) ->
    #exchange_data{type = 28, id = 99080203,
		   item_bid = 99080203,
		   item_name = lang:get(<<"2星镇灵戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080303) ->
    #exchange_data{type = 28, id = 99080303,
		   item_bid = 99080303,
		   item_name = lang:get(<<"3星镇灵戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080403) ->
    #exchange_data{type = 28, id = 99080403,
		   item_bid = 99080403,
		   item_name = lang:get(<<"4星镇灵戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99080503) ->
    #exchange_data{type = 28, id = 99080503,
		   item_bid = 99080503,
		   item_name = lang:get(<<"5星镇灵戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99080104) ->
    #exchange_data{type = 28, id = 99080104,
		   item_bid = 99080104,
		   item_name = lang:get(<<"1星镇灵手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 50,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080204) ->
    #exchange_data{type = 28, id = 99080204,
		   item_bid = 99080204,
		   item_name = lang:get(<<"2星镇灵手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 90,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080304) ->
    #exchange_data{type = 28, id = 99080304,
		   item_bid = 99080304,
		   item_name = lang:get(<<"3星镇灵手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 130,
		   lev = 105, buy_condit = 15000};
get_by_eid(99080404) ->
    #exchange_data{type = 28, id = 99080404,
		   item_bid = 99080404,
		   item_name = lang:get(<<"4星镇灵手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 200,
		   lev = 105, buy_condit = 18000};
get_by_eid(99080504) ->
    #exchange_data{type = 28, id = 99080504,
		   item_bid = 99080504,
		   item_name = lang:get(<<"5星镇灵手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 290,
		   lev = 105, buy_condit = 27000};
get_by_eid(99090101) ->
    #exchange_data{type = 28, id = 99090101,
		   item_bid = 99090101,
		   item_name = lang:get(<<"1星魔甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090201) ->
    #exchange_data{type = 28, id = 99090201,
		   item_bid = 99090201,
		   item_name = lang:get(<<"2星魔甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090301) ->
    #exchange_data{type = 28, id = 99090301,
		   item_bid = 99090301,
		   item_name = lang:get(<<"3星魔甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090401) ->
    #exchange_data{type = 28, id = 99090401,
		   item_bid = 99090401,
		   item_name = lang:get(<<"4星魔甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090501) ->
    #exchange_data{type = 28, id = 99090501,
		   item_bid = 99090501,
		   item_name = lang:get(<<"5星魔甲耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99090102) ->
    #exchange_data{type = 28, id = 99090102,
		   item_bid = 99090102,
		   item_name = lang:get(<<"1星魔甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090202) ->
    #exchange_data{type = 28, id = 99090202,
		   item_bid = 99090202,
		   item_name = lang:get(<<"2星魔甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090302) ->
    #exchange_data{type = 28, id = 99090302,
		   item_bid = 99090302,
		   item_name = lang:get(<<"3星魔甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090402) ->
    #exchange_data{type = 28, id = 99090402,
		   item_bid = 99090402,
		   item_name = lang:get(<<"4星魔甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090502) ->
    #exchange_data{type = 28, id = 99090502,
		   item_bid = 99090502,
		   item_name = lang:get(<<"5星魔甲项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99090103) ->
    #exchange_data{type = 28, id = 99090103,
		   item_bid = 99090103,
		   item_name = lang:get(<<"1星魔甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090203) ->
    #exchange_data{type = 28, id = 99090203,
		   item_bid = 99090203,
		   item_name = lang:get(<<"2星魔甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090303) ->
    #exchange_data{type = 28, id = 99090303,
		   item_bid = 99090303,
		   item_name = lang:get(<<"3星魔甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090403) ->
    #exchange_data{type = 28, id = 99090403,
		   item_bid = 99090403,
		   item_name = lang:get(<<"4星魔甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090503) ->
    #exchange_data{type = 28, id = 99090503,
		   item_bid = 99090503,
		   item_name = lang:get(<<"5星魔甲戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99090104) ->
    #exchange_data{type = 28, id = 99090104,
		   item_bid = 99090104,
		   item_name = lang:get(<<"1星魔甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090204) ->
    #exchange_data{type = 28, id = 99090204,
		   item_bid = 99090204,
		   item_name = lang:get(<<"2星魔甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090304) ->
    #exchange_data{type = 28, id = 99090304,
		   item_bid = 99090304,
		   item_name = lang:get(<<"3星魔甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090404) ->
    #exchange_data{type = 28, id = 99090404,
		   item_bid = 99090404,
		   item_name = lang:get(<<"4星魔甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99090504) ->
    #exchange_data{type = 28, id = 99090504,
		   item_bid = 99090504,
		   item_name = lang:get(<<"5星魔甲手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99100101) ->
    #exchange_data{type = 28, id = 99100101,
		   item_bid = 99100101,
		   item_name = lang:get(<<"1星神战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100201) ->
    #exchange_data{type = 28, id = 99100201,
		   item_bid = 99100201,
		   item_name = lang:get(<<"2星神战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100301) ->
    #exchange_data{type = 28, id = 99100301,
		   item_bid = 99100301,
		   item_name = lang:get(<<"3星神战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100401) ->
    #exchange_data{type = 28, id = 99100401,
		   item_bid = 99100401,
		   item_name = lang:get(<<"4星神战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100501) ->
    #exchange_data{type = 28, id = 99100501,
		   item_bid = 99100501,
		   item_name = lang:get(<<"5星神战耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99100102) ->
    #exchange_data{type = 28, id = 99100102,
		   item_bid = 99100102,
		   item_name = lang:get(<<"1星神战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100202) ->
    #exchange_data{type = 28, id = 99100202,
		   item_bid = 99100202,
		   item_name = lang:get(<<"2星神战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100302) ->
    #exchange_data{type = 28, id = 99100302,
		   item_bid = 99100302,
		   item_name = lang:get(<<"3星神战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100402) ->
    #exchange_data{type = 28, id = 99100402,
		   item_bid = 99100402,
		   item_name = lang:get(<<"4星神战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100502) ->
    #exchange_data{type = 28, id = 99100502,
		   item_bid = 99100502,
		   item_name = lang:get(<<"5星神战项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99100103) ->
    #exchange_data{type = 28, id = 99100103,
		   item_bid = 99100103,
		   item_name = lang:get(<<"1星神战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100203) ->
    #exchange_data{type = 28, id = 99100203,
		   item_bid = 99100203,
		   item_name = lang:get(<<"2星神战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100303) ->
    #exchange_data{type = 28, id = 99100303,
		   item_bid = 99100303,
		   item_name = lang:get(<<"3星神战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100403) ->
    #exchange_data{type = 28, id = 99100403,
		   item_bid = 99100403,
		   item_name = lang:get(<<"4星神战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100503) ->
    #exchange_data{type = 28, id = 99100503,
		   item_bid = 99100503,
		   item_name = lang:get(<<"5星神战戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99100104) ->
    #exchange_data{type = 28, id = 99100104,
		   item_bid = 99100104,
		   item_name = lang:get(<<"1星神战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100204) ->
    #exchange_data{type = 28, id = 99100204,
		   item_bid = 99100204,
		   item_name = lang:get(<<"2星神战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100304) ->
    #exchange_data{type = 28, id = 99100304,
		   item_bid = 99100304,
		   item_name = lang:get(<<"3星神战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100404) ->
    #exchange_data{type = 28, id = 99100404,
		   item_bid = 99100404,
		   item_name = lang:get(<<"4星神战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99100504) ->
    #exchange_data{type = 28, id = 99100504,
		   item_bid = 99100504,
		   item_name = lang:get(<<"5星神战手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99110101) ->
    #exchange_data{type = 28, id = 99110101,
		   item_bid = 99110101,
		   item_name = lang:get(<<"1星龙威耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110201) ->
    #exchange_data{type = 28, id = 99110201,
		   item_bid = 99110201,
		   item_name = lang:get(<<"2星龙威耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110301) ->
    #exchange_data{type = 28, id = 99110301,
		   item_bid = 99110301,
		   item_name = lang:get(<<"3星龙威耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110401) ->
    #exchange_data{type = 28, id = 99110401,
		   item_bid = 99110401,
		   item_name = lang:get(<<"4星龙威耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110501) ->
    #exchange_data{type = 28, id = 99110501,
		   item_bid = 99110501,
		   item_name = lang:get(<<"5星龙威耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99110102) ->
    #exchange_data{type = 28, id = 99110102,
		   item_bid = 99110102,
		   item_name = lang:get(<<"1星龙威项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110202) ->
    #exchange_data{type = 28, id = 99110202,
		   item_bid = 99110202,
		   item_name = lang:get(<<"2星龙威项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110302) ->
    #exchange_data{type = 28, id = 99110302,
		   item_bid = 99110302,
		   item_name = lang:get(<<"3星龙威项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110402) ->
    #exchange_data{type = 28, id = 99110402,
		   item_bid = 99110402,
		   item_name = lang:get(<<"4星龙威项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110502) ->
    #exchange_data{type = 28, id = 99110502,
		   item_bid = 99110502,
		   item_name = lang:get(<<"5星龙威项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99110103) ->
    #exchange_data{type = 28, id = 99110103,
		   item_bid = 99110103,
		   item_name = lang:get(<<"1星龙威戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110203) ->
    #exchange_data{type = 28, id = 99110203,
		   item_bid = 99110203,
		   item_name = lang:get(<<"2星龙威戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110303) ->
    #exchange_data{type = 28, id = 99110303,
		   item_bid = 99110303,
		   item_name = lang:get(<<"3星龙威戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110403) ->
    #exchange_data{type = 28, id = 99110403,
		   item_bid = 99110403,
		   item_name = lang:get(<<"4星龙威戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110503) ->
    #exchange_data{type = 28, id = 99110503,
		   item_bid = 99110503,
		   item_name = lang:get(<<"5星龙威戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99110104) ->
    #exchange_data{type = 28, id = 99110104,
		   item_bid = 99110104,
		   item_name = lang:get(<<"1星龙威手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110204) ->
    #exchange_data{type = 28, id = 99110204,
		   item_bid = 99110204,
		   item_name = lang:get(<<"2星龙威手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110304) ->
    #exchange_data{type = 28, id = 99110304,
		   item_bid = 99110304,
		   item_name = lang:get(<<"3星龙威手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110404) ->
    #exchange_data{type = 28, id = 99110404,
		   item_bid = 99110404,
		   item_name = lang:get(<<"4星龙威手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99110504) ->
    #exchange_data{type = 28, id = 99110504,
		   item_bid = 99110504,
		   item_name = lang:get(<<"5星龙威手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99120101) ->
    #exchange_data{type = 28, id = 99120101,
		   item_bid = 99120101,
		   item_name = lang:get(<<"1星神愈耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120201) ->
    #exchange_data{type = 28, id = 99120201,
		   item_bid = 99120201,
		   item_name = lang:get(<<"2星神愈耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120301) ->
    #exchange_data{type = 28, id = 99120301,
		   item_bid = 99120301,
		   item_name = lang:get(<<"3星神愈耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120401) ->
    #exchange_data{type = 28, id = 99120401,
		   item_bid = 99120401,
		   item_name = lang:get(<<"4星神愈耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120501) ->
    #exchange_data{type = 28, id = 99120501,
		   item_bid = 99120501,
		   item_name = lang:get(<<"5星神愈耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99120102) ->
    #exchange_data{type = 28, id = 99120102,
		   item_bid = 99120102,
		   item_name = lang:get(<<"1星神愈项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120202) ->
    #exchange_data{type = 28, id = 99120202,
		   item_bid = 99120202,
		   item_name = lang:get(<<"2星神愈项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120302) ->
    #exchange_data{type = 28, id = 99120302,
		   item_bid = 99120302,
		   item_name = lang:get(<<"3星神愈项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120402) ->
    #exchange_data{type = 28, id = 99120402,
		   item_bid = 99120402,
		   item_name = lang:get(<<"4星神愈项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120502) ->
    #exchange_data{type = 28, id = 99120502,
		   item_bid = 99120502,
		   item_name = lang:get(<<"5星神愈项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99120103) ->
    #exchange_data{type = 28, id = 99120103,
		   item_bid = 99120103,
		   item_name = lang:get(<<"1星神愈戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120203) ->
    #exchange_data{type = 28, id = 99120203,
		   item_bid = 99120203,
		   item_name = lang:get(<<"2星神愈戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120303) ->
    #exchange_data{type = 28, id = 99120303,
		   item_bid = 99120303,
		   item_name = lang:get(<<"3星神愈戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120403) ->
    #exchange_data{type = 28, id = 99120403,
		   item_bid = 99120403,
		   item_name = lang:get(<<"4星神愈戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120503) ->
    #exchange_data{type = 28, id = 99120503,
		   item_bid = 99120503,
		   item_name = lang:get(<<"5星神愈戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99120104) ->
    #exchange_data{type = 28, id = 99120104,
		   item_bid = 99120104,
		   item_name = lang:get(<<"1星神愈手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120204) ->
    #exchange_data{type = 28, id = 99120204,
		   item_bid = 99120204,
		   item_name = lang:get(<<"2星神愈手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120304) ->
    #exchange_data{type = 28, id = 99120304,
		   item_bid = 99120304,
		   item_name = lang:get(<<"3星神愈手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120404) ->
    #exchange_data{type = 28, id = 99120404,
		   item_bid = 99120404,
		   item_name = lang:get(<<"4星神愈手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99120504) ->
    #exchange_data{type = 28, id = 99120504,
		   item_bid = 99120504,
		   item_name = lang:get(<<"5星神愈手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99130101) ->
    #exchange_data{type = 28, id = 99130101,
		   item_bid = 99130101,
		   item_name = lang:get(<<"1星极速耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130201) ->
    #exchange_data{type = 28, id = 99130201,
		   item_bid = 99130201,
		   item_name = lang:get(<<"2星极速耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130301) ->
    #exchange_data{type = 28, id = 99130301,
		   item_bid = 99130301,
		   item_name = lang:get(<<"3星极速耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130401) ->
    #exchange_data{type = 28, id = 99130401,
		   item_bid = 99130401,
		   item_name = lang:get(<<"4星极速耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130501) ->
    #exchange_data{type = 28, id = 99130501,
		   item_bid = 99130501,
		   item_name = lang:get(<<"5星极速耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99130102) ->
    #exchange_data{type = 28, id = 99130102,
		   item_bid = 99130102,
		   item_name = lang:get(<<"1星极速项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130202) ->
    #exchange_data{type = 28, id = 99130202,
		   item_bid = 99130202,
		   item_name = lang:get(<<"2星极速项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130302) ->
    #exchange_data{type = 28, id = 99130302,
		   item_bid = 99130302,
		   item_name = lang:get(<<"3星极速项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130402) ->
    #exchange_data{type = 28, id = 99130402,
		   item_bid = 99130402,
		   item_name = lang:get(<<"4星极速项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130502) ->
    #exchange_data{type = 28, id = 99130502,
		   item_bid = 99130502,
		   item_name = lang:get(<<"5星极速项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99130103) ->
    #exchange_data{type = 28, id = 99130103,
		   item_bid = 99130103,
		   item_name = lang:get(<<"1星极速戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130203) ->
    #exchange_data{type = 28, id = 99130203,
		   item_bid = 99130203,
		   item_name = lang:get(<<"2星极速戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130303) ->
    #exchange_data{type = 28, id = 99130303,
		   item_bid = 99130303,
		   item_name = lang:get(<<"3星极速戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130403) ->
    #exchange_data{type = 28, id = 99130403,
		   item_bid = 99130403,
		   item_name = lang:get(<<"4星极速戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130503) ->
    #exchange_data{type = 28, id = 99130503,
		   item_bid = 99130503,
		   item_name = lang:get(<<"5星极速戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99130104) ->
    #exchange_data{type = 28, id = 99130104,
		   item_bid = 99130104,
		   item_name = lang:get(<<"1星极速手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130204) ->
    #exchange_data{type = 28, id = 99130204,
		   item_bid = 99130204,
		   item_name = lang:get(<<"2星极速手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130304) ->
    #exchange_data{type = 28, id = 99130304,
		   item_bid = 99130304,
		   item_name = lang:get(<<"3星极速手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130404) ->
    #exchange_data{type = 28, id = 99130404,
		   item_bid = 99130404,
		   item_name = lang:get(<<"4星极速手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99130504) ->
    #exchange_data{type = 28, id = 99130504,
		   item_bid = 99130504,
		   item_name = lang:get(<<"5星极速手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99140101) ->
    #exchange_data{type = 28, id = 99140101,
		   item_bid = 99140101,
		   item_name = lang:get(<<"1星玄护耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140201) ->
    #exchange_data{type = 28, id = 99140201,
		   item_bid = 99140201,
		   item_name = lang:get(<<"2星玄护耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140301) ->
    #exchange_data{type = 28, id = 99140301,
		   item_bid = 99140301,
		   item_name = lang:get(<<"3星玄护耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140401) ->
    #exchange_data{type = 28, id = 99140401,
		   item_bid = 99140401,
		   item_name = lang:get(<<"4星玄护耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140501) ->
    #exchange_data{type = 28, id = 99140501,
		   item_bid = 99140501,
		   item_name = lang:get(<<"5星玄护耳环"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99140102) ->
    #exchange_data{type = 28, id = 99140102,
		   item_bid = 99140102,
		   item_name = lang:get(<<"1星玄护项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140202) ->
    #exchange_data{type = 28, id = 99140202,
		   item_bid = 99140202,
		   item_name = lang:get(<<"2星玄护项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140302) ->
    #exchange_data{type = 28, id = 99140302,
		   item_bid = 99140302,
		   item_name = lang:get(<<"3星玄护项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140402) ->
    #exchange_data{type = 28, id = 99140402,
		   item_bid = 99140402,
		   item_name = lang:get(<<"4星玄护项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140502) ->
    #exchange_data{type = 28, id = 99140502,
		   item_bid = 99140502,
		   item_name = lang:get(<<"5星玄护项链"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99140103) ->
    #exchange_data{type = 28, id = 99140103,
		   item_bid = 99140103,
		   item_name = lang:get(<<"1星玄护戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140203) ->
    #exchange_data{type = 28, id = 99140203,
		   item_bid = 99140203,
		   item_name = lang:get(<<"2星玄护戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140303) ->
    #exchange_data{type = 28, id = 99140303,
		   item_bid = 99140303,
		   item_name = lang:get(<<"3星玄护戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140403) ->
    #exchange_data{type = 28, id = 99140403,
		   item_bid = 99140403,
		   item_name = lang:get(<<"4星玄护戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140503) ->
    #exchange_data{type = 28, id = 99140503,
		   item_bid = 99140503,
		   item_name = lang:get(<<"5星玄护戒指"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(99140104) ->
    #exchange_data{type = 28, id = 99140104,
		   item_bid = 99140104,
		   item_name = lang:get(<<"1星玄护手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 60,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140204) ->
    #exchange_data{type = 28, id = 99140204,
		   item_bid = 99140204,
		   item_name = lang:get(<<"2星玄护手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 110,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140304) ->
    #exchange_data{type = 28, id = 99140304,
		   item_bid = 99140304,
		   item_name = lang:get(<<"3星玄护手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 170,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140404) ->
    #exchange_data{type = 28, id = 99140404,
		   item_bid = 99140404,
		   item_name = lang:get(<<"4星玄护手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 240,
		   lev = 105, buy_condit = 20000};
get_by_eid(99140504) ->
    #exchange_data{type = 28, id = 99140504,
		   item_bid = 99140504,
		   item_name = lang:get(<<"5星玄护手镯"/utf8>>), item_num = 1,
		   bind = 1, pay_type = holy_eqm_coin, price = 360,
		   lev = 105, buy_condit = 30000};
get_by_eid(51092) ->
    #exchange_data{type = 51, id = 51092, item_bid = 39039,
		   item_name = lang:get(<<"Rương Ninja Tự Chọn"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 150,
		   limit_day = 0};
get_by_eid(51093) ->
    #exchange_data{type = 51, id = 51093, item_bid = 28923,
		   item_name = lang:get(<<"Mảnh Madara&Hashirama"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 300,
		   limit_day = 5};
get_by_eid(51094) ->
    #exchange_data{type = 51, id = 51094, item_bid = 28922,
		   item_name =
		       lang:get(<<"Mảnh Kaguya: Amenominaka"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 300,
		   limit_day = 5};
get_by_eid(51095) ->
    #exchange_data{type = 51, id = 51095, item_bid = 28921,
		   item_name =
		       lang:get(<<"Mảnh Sasuke: Supporting Kage"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 300,
		   limit_day = 5};
get_by_eid(51096) ->
    #exchange_data{type = 51, id = 51096, item_bid = 27923,
		   item_name = lang:get(<<"Mảnh Hashirama&Madara"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 300,
		   limit_day = 5};
get_by_eid(51097) ->
    #exchange_data{type = 51, id = 51097, item_bid = 27922,
		   item_name =
		       lang:get(<<"Mảnh Minato: Flame Hashira"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 300,
		   limit_day = 5};
get_by_eid(51098) ->
    #exchange_data{type = 51, id = 51098, item_bid = 27921,
		   item_name =
		       lang:get(<<"Mảnh Jiraiya: Sage Mode"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 300,
		   limit_day = 5};
get_by_eid(51099) ->
    #exchange_data{type = 51, id = 51099, item_bid = 28920,
		   item_name = lang:get(<<"Mảnh Obito&Kakashi"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51100) ->
    #exchange_data{type = 51, id = 51100, item_bid = 28919,
		   item_name = lang:get(<<"Mảnh Madara: Six Paths"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51101) ->
    #exchange_data{type = 51, id = 51101, item_bid = 28918,
		   item_name =
		       lang:get(<<"Mảnh Isshiki: Kāma Reincarnated"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51102) ->
    #exchange_data{type = 51, id = 51102, item_bid = 28917,
		   item_name = lang:get(<<"Mảnh Itachi: Susanoo"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51103) ->
    #exchange_data{type = 51, id = 51103, item_bid = 27920,
		   item_name = lang:get(<<"Mảnh Minato: Sage Mode"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51104) ->
    #exchange_data{type = 51, id = 51104, item_bid = 27919,
		   item_name = lang:get(<<"Mảnh Naruto: Asura"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51105) ->
    #exchange_data{type = 51, id = 51105, item_bid = 27918,
		   item_name =
		       lang:get(<<"Mảnh Sakura: Road to Ninja"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51106) ->
    #exchange_data{type = 51, id = 51106, item_bid = 27917,
		   item_name = lang:get(<<"Mảnh Naruto: Tiên Hồ"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51107) ->
    #exchange_data{type = 51, id = 51107, item_bid = 26917,
		   item_name = lang:get(<<"Mảnh Hinata: The Last"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51108) ->
    #exchange_data{type = 51, id = 51108, item_bid = 26915,
		   item_name =
		       lang:get(<<"Mảnh Boruto: Momoshiki Ego"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51109) ->
    #exchange_data{type = 51, id = 51109, item_bid = 25917,
		   item_name = lang:get(<<"Mảnh Sasuke: The Last"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51110) ->
    #exchange_data{type = 51, id = 51110, item_bid = 25916,
		   item_name = lang:get(<<"Mảnh A&Killer B"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(51111) ->
    #exchange_data{type = 51, id = 51111, item_bid = 24917,
		   item_name =
		       lang:get(<<"Mảnh Kushina: Kurama Possessed"/utf8>>),
		   item_num = 50, pay_type = feather_exchange, price = 250,
		   limit_day = 7};
get_by_eid(52001) ->
    #exchange_data{type = 52, id = 52001,
		   item_bid = 5030201,
		   item_name = lang:get(<<"[极品]3星穿甲耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52002) ->
    #exchange_data{type = 52, id = 52002,
		   item_bid = 5030202,
		   item_name = lang:get(<<"[极品]3星穿甲项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52003) ->
    #exchange_data{type = 52, id = 52003,
		   item_bid = 5030203,
		   item_name = lang:get(<<"[极品]3星穿甲戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52004) ->
    #exchange_data{type = 52, id = 52004,
		   item_bid = 5030204,
		   item_name = lang:get(<<"[极品]3星穿甲手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52005) ->
    #exchange_data{type = 52, id = 52005,
		   item_bid = 6030201,
		   item_name = lang:get(<<"[极品]3星破法耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52006) ->
    #exchange_data{type = 52, id = 52006,
		   item_bid = 6030202,
		   item_name = lang:get(<<"[极品]3星破法项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52007) ->
    #exchange_data{type = 52, id = 52007,
		   item_bid = 6030203,
		   item_name = lang:get(<<"[极品]3星破法戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52008) ->
    #exchange_data{type = 52, id = 52008,
		   item_bid = 6030204,
		   item_name = lang:get(<<"[极品]3星破法手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52009) ->
    #exchange_data{type = 52, id = 52009,
		   item_bid = 7030201,
		   item_name = lang:get(<<"[极品]3星斗战耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52010) ->
    #exchange_data{type = 52, id = 52010,
		   item_bid = 7030202,
		   item_name = lang:get(<<"[极品]3星斗战项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52011) ->
    #exchange_data{type = 52, id = 52011,
		   item_bid = 7030203,
		   item_name = lang:get(<<"[极品]3星斗战戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52012) ->
    #exchange_data{type = 52, id = 52012,
		   item_bid = 7030204,
		   item_name = lang:get(<<"[极品]3星斗战手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52013) ->
    #exchange_data{type = 52, id = 52013,
		   item_bid = 8030201,
		   item_name = lang:get(<<"[极品]3星镇灵耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52014) ->
    #exchange_data{type = 52, id = 52014,
		   item_bid = 8030202,
		   item_name = lang:get(<<"[极品]3星镇灵项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52015) ->
    #exchange_data{type = 52, id = 52015,
		   item_bid = 8030203,
		   item_name = lang:get(<<"[极品]3星镇灵戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52016) ->
    #exchange_data{type = 52, id = 52016,
		   item_bid = 8030204,
		   item_name = lang:get(<<"[极品]3星镇灵手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 25};
get_by_eid(52017) ->
    #exchange_data{type = 52, id = 52017,
		   item_bid = 9030201,
		   item_name = lang:get(<<"[极品]3星魔甲耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52018) ->
    #exchange_data{type = 52, id = 52018,
		   item_bid = 9030202,
		   item_name = lang:get(<<"[极品]3星魔甲项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52019) ->
    #exchange_data{type = 52, id = 52019,
		   item_bid = 9030203,
		   item_name = lang:get(<<"[极品]3星魔甲戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52020) ->
    #exchange_data{type = 52, id = 52020,
		   item_bid = 9030204,
		   item_name = lang:get(<<"[极品]3星魔甲手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52021) ->
    #exchange_data{type = 52, id = 52021,
		   item_bid = 10030201,
		   item_name = lang:get(<<"[极品]3星神战耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52022) ->
    #exchange_data{type = 52, id = 52022,
		   item_bid = 10030202,
		   item_name = lang:get(<<"[极品]3星神战项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52023) ->
    #exchange_data{type = 52, id = 52023,
		   item_bid = 10030203,
		   item_name = lang:get(<<"[极品]3星神战戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52024) ->
    #exchange_data{type = 52, id = 52024,
		   item_bid = 10030204,
		   item_name = lang:get(<<"[极品]3星神战手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52025) ->
    #exchange_data{type = 52, id = 52025,
		   item_bid = 11030201,
		   item_name = lang:get(<<"[极品]3星龙威耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52026) ->
    #exchange_data{type = 52, id = 52026,
		   item_bid = 11030202,
		   item_name = lang:get(<<"[极品]3星龙威项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52027) ->
    #exchange_data{type = 52, id = 52027,
		   item_bid = 11030203,
		   item_name = lang:get(<<"[极品]3星龙威戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52028) ->
    #exchange_data{type = 52, id = 52028,
		   item_bid = 11030204,
		   item_name = lang:get(<<"[极品]3星龙威手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52029) ->
    #exchange_data{type = 52, id = 52029,
		   item_bid = 12030201,
		   item_name = lang:get(<<"[极品]3星神愈耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52030) ->
    #exchange_data{type = 52, id = 52030,
		   item_bid = 12030202,
		   item_name = lang:get(<<"[极品]3星神愈项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52031) ->
    #exchange_data{type = 52, id = 52031,
		   item_bid = 12030203,
		   item_name = lang:get(<<"[极品]3星神愈戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52032) ->
    #exchange_data{type = 52, id = 52032,
		   item_bid = 12030204,
		   item_name = lang:get(<<"[极品]3星神愈手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52097) ->
    #exchange_data{type = 52, id = 52097,
		   item_bid = 13030201,
		   item_name = lang:get(<<"[极品]3星极速耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52098) ->
    #exchange_data{type = 52, id = 52098,
		   item_bid = 13030202,
		   item_name = lang:get(<<"[极品]3星极速项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52099) ->
    #exchange_data{type = 52, id = 52099,
		   item_bid = 13030203,
		   item_name = lang:get(<<"[极品]3星极速戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52100) ->
    #exchange_data{type = 52, id = 52100,
		   item_bid = 13030204,
		   item_name = lang:get(<<"[极品]3星极速手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52101) ->
    #exchange_data{type = 52, id = 52101,
		   item_bid = 14030201,
		   item_name = lang:get(<<"[极品]3星玄护耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52102) ->
    #exchange_data{type = 52, id = 52102,
		   item_bid = 14030202,
		   item_name = lang:get(<<"[极品]3星玄护项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52103) ->
    #exchange_data{type = 52, id = 52103,
		   item_bid = 14030203,
		   item_name = lang:get(<<"[极品]3星玄护戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52104) ->
    #exchange_data{type = 52, id = 52104,
		   item_bid = 14030204,
		   item_name = lang:get(<<"[极品]3星玄护手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 30};
get_by_eid(52033) ->
    #exchange_data{type = 52, id = 52033,
		   item_bid = 5040201,
		   item_name = lang:get(<<"[极品]4星穿甲耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52034) ->
    #exchange_data{type = 52, id = 52034,
		   item_bid = 5040202,
		   item_name = lang:get(<<"[极品]4星穿甲项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52035) ->
    #exchange_data{type = 52, id = 52035,
		   item_bid = 5040203,
		   item_name = lang:get(<<"[极品]4星穿甲戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52036) ->
    #exchange_data{type = 52, id = 52036,
		   item_bid = 5040204,
		   item_name = lang:get(<<"[极品]4星穿甲手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52037) ->
    #exchange_data{type = 52, id = 52037,
		   item_bid = 6040201,
		   item_name = lang:get(<<"[极品]4星破法耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52038) ->
    #exchange_data{type = 52, id = 52038,
		   item_bid = 6040202,
		   item_name = lang:get(<<"[极品]4星破法项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52039) ->
    #exchange_data{type = 52, id = 52039,
		   item_bid = 6040203,
		   item_name = lang:get(<<"[极品]4星破法戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52040) ->
    #exchange_data{type = 52, id = 52040,
		   item_bid = 6040204,
		   item_name = lang:get(<<"[极品]4星破法手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52041) ->
    #exchange_data{type = 52, id = 52041,
		   item_bid = 7040201,
		   item_name = lang:get(<<"[极品]4星斗战耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52042) ->
    #exchange_data{type = 52, id = 52042,
		   item_bid = 7040202,
		   item_name = lang:get(<<"[极品]4星斗战项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52043) ->
    #exchange_data{type = 52, id = 52043,
		   item_bid = 7040203,
		   item_name = lang:get(<<"[极品]4星斗战戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52044) ->
    #exchange_data{type = 52, id = 52044,
		   item_bid = 7040204,
		   item_name = lang:get(<<"[极品]4星斗战手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52045) ->
    #exchange_data{type = 52, id = 52045,
		   item_bid = 8040201,
		   item_name = lang:get(<<"[极品]4星镇灵耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52046) ->
    #exchange_data{type = 52, id = 52046,
		   item_bid = 8040202,
		   item_name = lang:get(<<"[极品]4星镇灵项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52047) ->
    #exchange_data{type = 52, id = 52047,
		   item_bid = 8040203,
		   item_name = lang:get(<<"[极品]4星镇灵戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52048) ->
    #exchange_data{type = 52, id = 52048,
		   item_bid = 8040204,
		   item_name = lang:get(<<"[极品]4星镇灵手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 40,
		   buy_condit = 15000};
get_by_eid(52049) ->
    #exchange_data{type = 52, id = 52049,
		   item_bid = 9040201,
		   item_name = lang:get(<<"[极品]4星魔甲耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52050) ->
    #exchange_data{type = 52, id = 52050,
		   item_bid = 9040202,
		   item_name = lang:get(<<"[极品]4星魔甲项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52051) ->
    #exchange_data{type = 52, id = 52051,
		   item_bid = 9040203,
		   item_name = lang:get(<<"[极品]4星魔甲戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52052) ->
    #exchange_data{type = 52, id = 52052,
		   item_bid = 9040204,
		   item_name = lang:get(<<"[极品]4星魔甲手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52053) ->
    #exchange_data{type = 52, id = 52053,
		   item_bid = 10040201,
		   item_name = lang:get(<<"[极品]4星神战耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52054) ->
    #exchange_data{type = 52, id = 52054,
		   item_bid = 10040202,
		   item_name = lang:get(<<"[极品]4星神战项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52055) ->
    #exchange_data{type = 52, id = 52055,
		   item_bid = 10040203,
		   item_name = lang:get(<<"[极品]4星神战戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52056) ->
    #exchange_data{type = 52, id = 52056,
		   item_bid = 10040204,
		   item_name = lang:get(<<"[极品]4星神战手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52057) ->
    #exchange_data{type = 52, id = 52057,
		   item_bid = 11040201,
		   item_name = lang:get(<<"[极品]4星龙威耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52058) ->
    #exchange_data{type = 52, id = 52058,
		   item_bid = 11040202,
		   item_name = lang:get(<<"[极品]4星龙威项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52059) ->
    #exchange_data{type = 52, id = 52059,
		   item_bid = 11040203,
		   item_name = lang:get(<<"[极品]4星龙威戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52060) ->
    #exchange_data{type = 52, id = 52060,
		   item_bid = 11040204,
		   item_name = lang:get(<<"[极品]4星龙威手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52061) ->
    #exchange_data{type = 52, id = 52061,
		   item_bid = 12040201,
		   item_name = lang:get(<<"[极品]4星神愈耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52062) ->
    #exchange_data{type = 52, id = 52062,
		   item_bid = 12040202,
		   item_name = lang:get(<<"[极品]4星神愈项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52063) ->
    #exchange_data{type = 52, id = 52063,
		   item_bid = 12040203,
		   item_name = lang:get(<<"[极品]4星神愈戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52064) ->
    #exchange_data{type = 52, id = 52064,
		   item_bid = 12040204,
		   item_name = lang:get(<<"[极品]4星神愈手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52105) ->
    #exchange_data{type = 52, id = 52105,
		   item_bid = 13040201,
		   item_name = lang:get(<<"[极品]4星极速耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52106) ->
    #exchange_data{type = 52, id = 52106,
		   item_bid = 13040202,
		   item_name = lang:get(<<"[极品]4星极速项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52107) ->
    #exchange_data{type = 52, id = 52107,
		   item_bid = 13040203,
		   item_name = lang:get(<<"[极品]4星极速戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52108) ->
    #exchange_data{type = 52, id = 52108,
		   item_bid = 13040204,
		   item_name = lang:get(<<"[极品]4星极速手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52109) ->
    #exchange_data{type = 52, id = 52109,
		   item_bid = 14040201,
		   item_name = lang:get(<<"[极品]4星玄护耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52110) ->
    #exchange_data{type = 52, id = 52110,
		   item_bid = 14040202,
		   item_name = lang:get(<<"[极品]4星玄护项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52111) ->
    #exchange_data{type = 52, id = 52111,
		   item_bid = 14040203,
		   item_name = lang:get(<<"[极品]4星玄护戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52112) ->
    #exchange_data{type = 52, id = 52112,
		   item_bid = 14040204,
		   item_name = lang:get(<<"[极品]4星玄护手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 50,
		   buy_condit = 15000};
get_by_eid(52065) ->
    #exchange_data{type = 52, id = 52065,
		   item_bid = 5050201,
		   item_name = lang:get(<<"[极品]5星穿甲耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52066) ->
    #exchange_data{type = 52, id = 52066,
		   item_bid = 5050202,
		   item_name = lang:get(<<"[极品]5星穿甲项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52067) ->
    #exchange_data{type = 52, id = 52067,
		   item_bid = 5050203,
		   item_name = lang:get(<<"[极品]5星穿甲戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52068) ->
    #exchange_data{type = 52, id = 52068,
		   item_bid = 5050204,
		   item_name = lang:get(<<"[极品]5星穿甲手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52069) ->
    #exchange_data{type = 52, id = 52069,
		   item_bid = 6050201,
		   item_name = lang:get(<<"[极品]5星破法耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52070) ->
    #exchange_data{type = 52, id = 52070,
		   item_bid = 6050202,
		   item_name = lang:get(<<"[极品]5星破法项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52071) ->
    #exchange_data{type = 52, id = 52071,
		   item_bid = 6050203,
		   item_name = lang:get(<<"[极品]5星破法戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52072) ->
    #exchange_data{type = 52, id = 52072,
		   item_bid = 6050204,
		   item_name = lang:get(<<"[极品]5星破法手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52073) ->
    #exchange_data{type = 52, id = 52073,
		   item_bid = 7050201,
		   item_name = lang:get(<<"[极品]5星斗战耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52074) ->
    #exchange_data{type = 52, id = 52074,
		   item_bid = 7050202,
		   item_name = lang:get(<<"[极品]5星斗战项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52075) ->
    #exchange_data{type = 52, id = 52075,
		   item_bid = 7050203,
		   item_name = lang:get(<<"[极品]5星斗战戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52076) ->
    #exchange_data{type = 52, id = 52076,
		   item_bid = 7050204,
		   item_name = lang:get(<<"[极品]5星斗战手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52077) ->
    #exchange_data{type = 52, id = 52077,
		   item_bid = 8050201,
		   item_name = lang:get(<<"[极品]5星镇灵耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52078) ->
    #exchange_data{type = 52, id = 52078,
		   item_bid = 8050202,
		   item_name = lang:get(<<"[极品]5星镇灵项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52079) ->
    #exchange_data{type = 52, id = 52079,
		   item_bid = 8050203,
		   item_name = lang:get(<<"[极品]5星镇灵戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52080) ->
    #exchange_data{type = 52, id = 52080,
		   item_bid = 8050204,
		   item_name = lang:get(<<"[极品]5星镇灵手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 60,
		   buy_condit = 24000};
get_by_eid(52081) ->
    #exchange_data{type = 52, id = 52081,
		   item_bid = 9050201,
		   item_name = lang:get(<<"[极品]5星魔甲耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52082) ->
    #exchange_data{type = 52, id = 52082,
		   item_bid = 9050202,
		   item_name = lang:get(<<"[极品]5星魔甲项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52083) ->
    #exchange_data{type = 52, id = 52083,
		   item_bid = 9050203,
		   item_name = lang:get(<<"[极品]5星魔甲戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52084) ->
    #exchange_data{type = 52, id = 52084,
		   item_bid = 9050204,
		   item_name = lang:get(<<"[极品]5星魔甲手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52085) ->
    #exchange_data{type = 52, id = 52085,
		   item_bid = 10050201,
		   item_name = lang:get(<<"[极品]5星神战耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52086) ->
    #exchange_data{type = 52, id = 52086,
		   item_bid = 10050202,
		   item_name = lang:get(<<"[极品]5星神战项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52087) ->
    #exchange_data{type = 52, id = 52087,
		   item_bid = 10050203,
		   item_name = lang:get(<<"[极品]5星神战戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52088) ->
    #exchange_data{type = 52, id = 52088,
		   item_bid = 10050204,
		   item_name = lang:get(<<"[极品]5星神战手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52089) ->
    #exchange_data{type = 52, id = 52089,
		   item_bid = 11050201,
		   item_name = lang:get(<<"[极品]5星龙威耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52090) ->
    #exchange_data{type = 52, id = 52090,
		   item_bid = 11050202,
		   item_name = lang:get(<<"[极品]5星龙威项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52091) ->
    #exchange_data{type = 52, id = 52091,
		   item_bid = 11050203,
		   item_name = lang:get(<<"[极品]5星龙威戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52092) ->
    #exchange_data{type = 52, id = 52092,
		   item_bid = 11050204,
		   item_name = lang:get(<<"[极品]5星龙威手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52093) ->
    #exchange_data{type = 52, id = 52093,
		   item_bid = 12050201,
		   item_name = lang:get(<<"[极品]5星神愈耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52094) ->
    #exchange_data{type = 52, id = 52094,
		   item_bid = 12050202,
		   item_name = lang:get(<<"[极品]5星神愈项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52095) ->
    #exchange_data{type = 52, id = 52095,
		   item_bid = 12050203,
		   item_name = lang:get(<<"[极品]5星神愈戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52096) ->
    #exchange_data{type = 52, id = 52096,
		   item_bid = 12050204,
		   item_name = lang:get(<<"[极品]5星神愈手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52113) ->
    #exchange_data{type = 52, id = 52113,
		   item_bid = 13050201,
		   item_name = lang:get(<<"[极品]5星极速耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52114) ->
    #exchange_data{type = 52, id = 52114,
		   item_bid = 13050202,
		   item_name = lang:get(<<"[极品]5星极速项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52115) ->
    #exchange_data{type = 52, id = 52115,
		   item_bid = 13050203,
		   item_name = lang:get(<<"[极品]5星极速戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52116) ->
    #exchange_data{type = 52, id = 52116,
		   item_bid = 13050204,
		   item_name = lang:get(<<"[极品]5星极速手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52117) ->
    #exchange_data{type = 52, id = 52117,
		   item_bid = 14050201,
		   item_name = lang:get(<<"[极品]5星玄护耳环"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52118) ->
    #exchange_data{type = 52, id = 52118,
		   item_bid = 14050202,
		   item_name = lang:get(<<"[极品]5星玄护项链"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52119) ->
    #exchange_data{type = 52, id = 52119,
		   item_bid = 14050203,
		   item_name = lang:get(<<"[极品]5星玄护戒指"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(52120) ->
    #exchange_data{type = 52, id = 52120,
		   item_bid = 14050204,
		   item_name = lang:get(<<"[极品]5星玄护手镯"/utf8>>),
		   item_num = 1, pay_type = feather_exchange, price = 100,
		   buy_condit = 24000};
get_by_eid(80001) ->
    #exchange_data{type = 80, id = 80001, item_bid = 50022,
		   item_name = lang:get(<<"魔王之息"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 800, buy_stage = 1,
		   limit_count = 1};
get_by_eid(80002) ->
    #exchange_data{type = 80, id = 80002, item_bid = 29905,
		   item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 50,
		   pay_type = 80244, price = 500, buy_stage = 1,
		   limit_count = 1};
get_by_eid(80003) ->
    #exchange_data{type = 80, id = 80003, item_bid = 14001,
		   item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 200, buy_stage = 1,
		   limit_count = 1};
get_by_eid(80004) ->
    #exchange_data{type = 80, id = 80004, item_bid = 10603,
		   item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 300, buy_stage = 1,
		   limit_count = 1};
get_by_eid(80005) ->
    #exchange_data{type = 80, id = 80005, item_bid = 200505,
		   item_name = lang:get(<<"邪灵南瓜"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 250, buy_stage = 1,
		   limit_count = 1};
get_by_eid(80006) ->
    #exchange_data{type = 80, id = 80006, item_bid = 10408,
		   item_name = lang:get(<<"精英召唤券"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 50, buy_stage = 1,
		   limit_count = 3};
get_by_eid(80007) ->
    #exchange_data{type = 80, id = 80007, item_bid = 35,
		   item_name = lang:get(<<"圣羽"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 100, buy_stage = 1,
		   limit_count = 5};
get_by_eid(80008) ->
    #exchange_data{type = 80, id = 80008, item_bid = 80246,
		   item_name = lang:get(<<"南瓜机"/utf8>>), item_num = 1,
		   pay_type = gold, price = 30, buy_stage = 1,
		   limit_day = 99};
get_by_eid(80009) ->
    #exchange_data{type = 80, id = 80009, item_bid = 29905,
		   item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 50,
		   pay_type = 80244, price = 500, buy_stage = 2,
		   limit_count = 1};
get_by_eid(80010) ->
    #exchange_data{type = 80, id = 80010, item_bid = 14001,
		   item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 200, buy_stage = 2,
		   limit_count = 1};
get_by_eid(80011) ->
    #exchange_data{type = 80, id = 80011, item_bid = 10603,
		   item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 300, buy_stage = 2,
		   limit_count = 1};
get_by_eid(80012) ->
    #exchange_data{type = 80, id = 80012, item_bid = 200502,
		   item_name = lang:get(<<"术士炼金炉"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 150, buy_stage = 2,
		   limit_count = 1};
get_by_eid(80013) ->
    #exchange_data{type = 80, id = 80013, item_bid = 10408,
		   item_name = lang:get(<<"精英召唤券"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 50, buy_stage = 2,
		   limit_count = 3};
get_by_eid(80014) ->
    #exchange_data{type = 80, id = 80014, item_bid = 35,
		   item_name = lang:get(<<"圣羽"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 100, buy_stage = 2,
		   limit_count = 5};
get_by_eid(80015) ->
    #exchange_data{type = 80, id = 80015, item_bid = 29905,
		   item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 50,
		   pay_type = 80244, price = 500, buy_stage = 3,
		   limit_count = 1};
get_by_eid(80016) ->
    #exchange_data{type = 80, id = 80016, item_bid = 14001,
		   item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 200, buy_stage = 3,
		   limit_count = 1};
get_by_eid(80017) ->
    #exchange_data{type = 80, id = 80017, item_bid = 10603,
		   item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 300, buy_stage = 3,
		   limit_count = 1};
get_by_eid(80018) ->
    #exchange_data{type = 80, id = 80018, item_bid = 200506,
		   item_name = lang:get(<<"幽森喷泉"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 150, buy_stage = 3,
		   limit_count = 1};
get_by_eid(80019) ->
    #exchange_data{type = 80, id = 80019, item_bid = 10408,
		   item_name = lang:get(<<"精英召唤券"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 50, buy_stage = 3,
		   limit_count = 3};
get_by_eid(80020) ->
    #exchange_data{type = 80, id = 80020, item_bid = 35,
		   item_name = lang:get(<<"圣羽"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 100, buy_stage = 3,
		   limit_count = 5};
get_by_eid(80021) ->
    #exchange_data{type = 80, id = 80021, item_bid = 29905,
		   item_name = lang:get(<<"5星随机碎片"/utf8>>), item_num = 50,
		   pay_type = 80244, price = 500, buy_stage = 4,
		   limit_count = 1};
get_by_eid(80022) ->
    #exchange_data{type = 80, id = 80022, item_bid = 14001,
		   item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 200, buy_stage = 4,
		   limit_count = 1};
get_by_eid(80023) ->
    #exchange_data{type = 80, id = 80023, item_bid = 10603,
		   item_name = lang:get(<<"圣灵蛋"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 300, buy_stage = 4,
		   limit_count = 1};
get_by_eid(80024) ->
    #exchange_data{type = 80, id = 80024, item_bid = 200511,
		   item_name = lang:get(<<"不亡者之棺"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 250, buy_stage = 4,
		   limit_count = 1};
get_by_eid(80025) ->
    #exchange_data{type = 80, id = 80025, item_bid = 10408,
		   item_name = lang:get(<<"精英召唤券"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 50, buy_stage = 4,
		   limit_count = 3};
get_by_eid(80026) ->
    #exchange_data{type = 80, id = 80026, item_bid = 35,
		   item_name = lang:get(<<"圣羽"/utf8>>), item_num = 1,
		   pay_type = 80244, price = 100, buy_stage = 4,
		   limit_count = 5};
get_by_eid(80027) ->
    #exchange_data{type = 80, id = 80027, item_bid = 10040,
		   item_name = lang:get(<<"奥术之尘"/utf8>>), item_num = 5,
		   pay_type = 80244, price = 30, buy_stage = 1,
		   limit_week = 10};
get_by_eid(80028) ->
    #exchange_data{type = 80, id = 80028, item_bid = 10450,
		   item_name = lang:get(<<"符文精华"/utf8>>), item_num = 100,
		   pay_type = 80244, price = 20, buy_stage = 1,
		   limit_week = 20};
get_by_eid(80029) ->
    #exchange_data{type = 80, id = 80029, item_bid = 10001,
		   item_name = lang:get(<<"进阶石"/utf8>>), item_num = 100,
		   pay_type = 80244, price = 50, buy_stage = 1,
		   limit_week = 50};
get_by_eid(80030) ->
    #exchange_data{type = 80, id = 80030, item_bid = 1,
		   item_name = lang:get(<<"金币"/utf8>>), item_num = 50000,
		   pay_type = 80244, price = 1, buy_stage = 1,
		   limit_day = 99};
get_by_eid(80031) ->
    #exchange_data{type = 80, id = 80031, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>), item_num = 10000,
		   pay_type = 80244, price = 1, buy_stage = 1,
		   limit_day = 99};
get_by_eid(_Info) ->
    logger:data_error("get_by_eid_data_not_exist===>~w",
		      [_Info], exchange_data, 15702),
    undefined.

get_cost_list(2) -> [{11, 5000}];
get_cost_list(4) -> [{3, 20}];
get_cost_list(9) -> [{10450, 200}];
get_cost_list(16) -> [{18, 50}];
get_cost_list(34) -> [{30, 100}];
get_cost_list(43) -> [{31, 300}];
get_cost_list(_) -> undefined.

get_exchange_name(1) -> lang:get(<<"道具"/utf8>>);
get_exchange_name(2) -> lang:get(<<"英雄"/utf8>>);
get_exchange_name(3) -> lang:get(<<"积分"/utf8>>);
get_exchange_name(4) -> lang:get(<<"杂货店"/utf8>>);
get_exchange_name(5) -> lang:get(<<"公会"/utf8>>);
get_exchange_name(6) -> lang:get(<<"竞技"/utf8>>);
get_exchange_name(8) -> lang:get(<<"征战"/utf8>>);
get_exchange_name(9) -> lang:get(<<"技能"/utf8>>);
get_exchange_name(16) -> lang:get(<<"探宝"/utf8>>);
get_exchange_name(17) -> lang:get(<<"段位"/utf8>>);
get_exchange_name(18) -> lang:get(<<"皮肤"/utf8>>);
get_exchange_name(30) -> lang:get(<<"跨服天梯"/utf8>>);
get_exchange_name(31) -> lang:get(<<"先知商店"/utf8>>);
get_exchange_name(28) -> lang:get(<<"神装商店"/utf8>>);
get_exchange_name(34) -> lang:get(<<"跨服竞技"/utf8>>);
get_exchange_name(36) -> lang:get(<<"冠军商店"/utf8>>);
get_exchange_name(37) -> lang:get(<<"巅峰商店"/utf8>>);
get_exchange_name(40) -> lang:get(<<"宅室"/utf8>>);
get_exchange_name(41) -> lang:get(<<"家具"/utf8>>);
get_exchange_name(42) -> lang:get(<<"出行"/utf8>>);
get_exchange_name(43) -> lang:get(<<"随机商店"/utf8>>);
get_exchange_name(50) -> lang:get(<<"圣羽"/utf8>>);
get_exchange_name(51) -> lang:get(<<"英雄"/utf8>>);
get_exchange_name(52) -> lang:get(<<"神装"/utf8>>);
get_exchange_name(53) -> lang:get(<<"英魂商店"/utf8>>);
get_exchange_name(80) -> lang:get(<<"圣夜奇境商店"/utf8>>);
get_exchange_name(_) -> <<>>.

get_limit_open(1) -> [];
get_limit_open(2) -> [];
get_limit_open(3) -> [];
get_limit_open(4) -> [];
get_limit_open(5) -> [];
get_limit_open(6) -> [];
get_limit_open(8) -> [{lev, 30}];
get_limit_open(9) -> [];
get_limit_open(16) -> [{lev, 10}];
get_limit_open(17) -> [{lev, 100}];
get_limit_open(18) -> [{lev, 35}];
get_limit_open(30) -> [{lev, 55}];
get_limit_open(31) -> [];
get_limit_open(28) -> [];
get_limit_open(34) -> [{lev, 70}];
get_limit_open(36) -> [{lev, 55}];
get_limit_open(37) -> [{lev, 55}];
get_limit_open(40) -> [];
get_limit_open(41) -> [];
get_limit_open(42) -> [];
get_limit_open(43) -> [];
get_limit_open(50) -> [{lev, 10}, {open_day, 7}];
get_limit_open(51) -> [{lev, 10}, {open_day, 7}];
get_limit_open(52) -> [{lev, 120}, {open_day, 7}];
get_limit_open(53) -> [{lev, 6}];
get_limit_open(80) -> [{lev, 10}, {open_day, 7}];
get_limit_open(_Info) ->
    logger:data_error("get_limit_open_data_not_exist===>~w",
		      [_Info], exchange_data, 15766),
    undefined.

get_const(open_gold_lev) -> 1;
get_const(open_guild_lev) -> 1;
get_const(open_point_lev) -> 1;
get_const(open_secret_lev) -> 1;
get_const(open_arena_cent_lev) -> 1;
get_const(open_god_point_lev) -> 1;
get_const(open_hero_soul_lev) -> 1;
get_const(open_guess_point_lev) -> 1;
get_const(mall_def) -> 6;
get_const(cost_item) -> 10101;
get_const(exchange_limit_lev) -> 1;
get_const(soul_def) -> 11;
get_const(treasure_time) -> [{0, 0, 0}];
get_const(hero_soul_instruction) -> val_not_exist;
get_const(star_instruction) -> val_not_exist;
get_const(secret_instruction) -> val_not_exist;
get_const(guess_instruction) -> val_not_exist;
get_const(soul_reset_cost) -> [{11, 5000}];
get_const(max_free_times) -> 5;
get_const(number_recovery) -> 7200;
get_const(maximum_number) -> 100;
get_const(treasure_plaid) -> 8;
get_const(skill_refresh_number) -> 20;
get_const(skill_refresh_time) -> [{0, 0, 0}];
get_const(skill_refresh_free) -> 3;
get_const(open_skill_lev) -> 1;
get_const(skill_recovery) -> 28800;
get_const(cluster_refresh_free) -> 1;
get_const(cluster_recovery) -> 86400;
get_const(cluster_refresh_number) -> 20;
get_const(cluster_refresh_time) -> [{0, 0, 0}];
get_const(cluster_commodity_num) -> 9;
get_const(furniture_refresh_free) -> 3;
get_const(furniture_refresh_number) -> 10;
get_const(furniture_refresh_time) -> [{0, 0, 0}];
get_const(furniture_recovery) -> 28800;
get_const(open_furniture_lev) -> 70;
get_const(furniture_spend) -> 300;
get_const(_Info) ->
    logger:data_error("get_const_data_not_exist===>~w",
		      [_Info], exchange_data, 15806),
    undefined.

get_rand1({6, 43}) -> [{pets1, 1000, {70, 999}}];
get_rand1({5, 43}) -> [{pets1, 1000, {70, 999}}];
get_rand1({4, 43}) ->
    [{furniture1, 200, {70, 999}},
     {furniture2, 800, {70, 999}}];
get_rand1({3, 43}) ->
    [{furniture1, 200, {70, 999}},
     {furniture2, 800, {70, 999}}];
get_rand1({2, 43}) ->
    [{furniture1, 200, {70, 999}},
     {furniture2, 800, {70, 999}}];
get_rand1({1, 43}) ->
    [{furniture1, 200, {70, 999}},
     {furniture2, 800, {70, 999}}];
get_rand1({10, 34}) -> [{cluster20, 100, {1, 999}}];
get_rand1({9, 34}) -> [{cluster18, 1000, {1, 999}}];
get_rand1({8, 34}) ->
    [{cluster13, 125, {1, 999}}, {cluster14, 125, {1, 999}},
     {cluster15, 250, {1, 999}}, {cluster16, 250, {1, 999}},
     {cluster17, 250, {1, 999}}];
get_rand1({7, 34}) ->
    [{cluster13, 125, {1, 999}}, {cluster14, 125, {1, 999}},
     {cluster15, 250, {1, 999}}, {cluster16, 250, {1, 999}},
     {cluster17, 250, {1, 999}}];
get_rand1({6, 34}) ->
    [{cluster13, 125, {1, 999}}, {cluster14, 125, {1, 999}},
     {cluster15, 250, {1, 999}}, {cluster16, 250, {1, 999}},
     {cluster17, 250, {1, 999}}];
get_rand1({5, 34}) ->
    [{cluster13, 125, {1, 999}}, {cluster14, 125, {1, 999}},
     {cluster15, 250, {1, 999}}, {cluster16, 250, {1, 999}},
     {cluster17, 250, {1, 999}}];
get_rand1({4, 34}) -> [{cluster19, 100, {1, 999}}];
get_rand1({3, 34}) -> [{cluster10, 100, {1, 999}}];
get_rand1({2, 34}) -> [{cluster12, 100, {1, 999}}];
get_rand1({1, 34}) -> [{cluster11, 100, {1, 999}}];
get_rand1({6, 9}) ->
    [{skill11, 30, {1, 999}}, {skill12, 300, {1, 999}},
     {skill13, 374, {1, 999}}, {skill14, 280, {1, 999}},
     {skill15, 16, {160, 999}}];
get_rand1({5, 9}) ->
    [{skill11, 30, {1, 999}}, {skill12, 300, {1, 999}},
     {skill13, 374, {1, 999}}, {skill14, 280, {1, 999}},
     {skill15, 16, {160, 999}}];
get_rand1({4, 9}) ->
    [{skill11, 30, {1, 999}}, {skill12, 300, {1, 999}},
     {skill13, 374, {1, 999}}, {skill14, 280, {1, 999}},
     {skill15, 16, {160, 999}}];
get_rand1({3, 9}) ->
    [{skill11, 30, {1, 999}}, {skill12, 300, {1, 999}},
     {skill13, 374, {1, 999}}, {skill14, 280, {1, 999}},
     {skill15, 16, {160, 999}}];
get_rand1({2, 9}) ->
    [{skill11, 30, {1, 999}}, {skill12, 300, {1, 999}},
     {skill13, 374, {1, 999}}, {skill14, 280, {1, 999}},
     {skill15, 16, {160, 999}}];
get_rand1({1, 9}) ->
    [{skill11, 30, {1, 999}}, {skill12, 300, {1, 999}},
     {skill13, 374, {1, 999}}, {skill14, 280, {1, 999}},
     {skill15, 16, {160, 999}}];
get_rand1({8, 16}) -> [{trea18, 1000, {1, 999}}];
get_rand1({7, 16}) -> [{trea17, 1000, {1, 999}}];
get_rand1({6, 16}) -> [{trea16, 1000, {1, 999}}];
get_rand1({5, 16}) -> [{trea15, 1000, {1, 999}}];
get_rand1({4, 16}) ->
    [{trea14, 750, {1, 999}}, {trea19, 250, {1, 999}}];
get_rand1({3, 16}) ->
    [{trea13, 750, {1, 999}}, {trea19, 250, {1, 999}}];
get_rand1({2, 16}) ->
    [{trea11, 600, {1, 999}}, {trea12, 400, {1, 999}}];
get_rand1({1, 16}) -> [{trea11, 1000, {1, 999}}];
get_rand1({11, 2}) -> [{soul21, 1000, {1, 999}}];
get_rand1({10, 2}) -> [{soul18, 1000, {1, 999}}];
get_rand1({9, 2}) -> [{soul17, 1000, {1, 999}}];
get_rand1({8, 2}) -> [{soul16, 1000, {1, 999}}];
get_rand1({7, 2}) -> [{soul15, 1000, {1, 999}}];
get_rand1({6, 2}) -> [{soul14, 1000, {1, 999}}];
get_rand1({5, 2}) -> [{soul13, 1000, {1, 999}}];
get_rand1({4, 2}) -> [{soul12, 1000, {1, 999}}];
get_rand1({3, 2}) -> [{soul11, 1000, {1, 999}}];
get_rand1({2, 2}) -> [{soul20, 1000, {1, 999}}];
get_rand1({1, 2}) -> [{soul19, 1000, {1, 999}}];
get_rand1({6, 4}) ->
    [{item1, 135, {1, 999}}, {item2, 60, {1, 999}},
     {item3, 50, {1, 999}}, {item4, 30, {1, 999}},
     {item5, 60, {1, 999}}, {item6, 50, {1, 999}},
     {item7, 50, {1, 999}}, {item8, 133, {1, 999}},
     {item9, 20, {1, 999}}, {item10, 52, {1, 999}},
     {item11, 40, {1, 999}}, {item12, 36, {1, 999}},
     {item13, 36, {1, 999}}, {item14, 40, {1, 999}},
     {item15, 40, {1, 999}}, {item16, 48, {1, 999}},
     {item17, 100, {1, 999}}, {item18, 8, {1, 999}},
     {item19, 12, {1, 999}}];
get_rand1({5, 4}) ->
    [{item1, 135, {1, 999}}, {item2, 60, {1, 999}},
     {item3, 50, {1, 999}}, {item4, 30, {1, 999}},
     {item5, 60, {1, 999}}, {item6, 50, {1, 999}},
     {item7, 50, {1, 999}}, {item8, 133, {1, 999}},
     {item9, 20, {1, 999}}, {item10, 52, {1, 999}},
     {item11, 40, {1, 999}}, {item12, 36, {1, 999}},
     {item13, 36, {1, 999}}, {item14, 40, {1, 999}},
     {item15, 40, {1, 999}}, {item16, 48, {1, 999}},
     {item17, 100, {1, 999}}, {item18, 8, {1, 999}},
     {item19, 12, {1, 999}}];
get_rand1({4, 4}) ->
    [{item1, 135, {1, 999}}, {item2, 60, {1, 999}},
     {item3, 50, {1, 999}}, {item4, 30, {1, 999}},
     {item5, 60, {1, 999}}, {item6, 50, {1, 999}},
     {item7, 50, {1, 999}}, {item8, 133, {1, 999}},
     {item9, 20, {1, 999}}, {item10, 52, {1, 999}},
     {item11, 40, {1, 999}}, {item12, 36, {1, 999}},
     {item13, 36, {1, 999}}, {item14, 40, {1, 999}},
     {item15, 40, {1, 999}}, {item16, 48, {1, 999}},
     {item17, 100, {1, 999}}, {item18, 8, {1, 999}},
     {item19, 12, {1, 999}}];
get_rand1({3, 4}) ->
    [{item1, 135, {1, 999}}, {item2, 60, {1, 999}},
     {item3, 50, {1, 999}}, {item4, 30, {1, 999}},
     {item5, 60, {1, 999}}, {item6, 50, {1, 999}},
     {item7, 50, {1, 999}}, {item8, 133, {1, 999}},
     {item9, 20, {1, 999}}, {item10, 52, {1, 999}},
     {item11, 40, {1, 999}}, {item12, 36, {1, 999}},
     {item13, 36, {1, 999}}, {item14, 40, {1, 999}},
     {item15, 40, {1, 999}}, {item16, 48, {1, 999}},
     {item17, 100, {1, 999}}, {item18, 8, {1, 999}},
     {item19, 12, {1, 999}}];
get_rand1({2, 4}) ->
    [{item1, 135, {1, 999}}, {item2, 60, {1, 999}},
     {item3, 50, {1, 999}}, {item4, 30, {1, 999}},
     {item5, 60, {1, 999}}, {item6, 50, {1, 999}},
     {item7, 50, {1, 999}}, {item8, 133, {1, 999}},
     {item9, 20, {1, 999}}, {item10, 52, {1, 999}},
     {item11, 40, {1, 999}}, {item12, 36, {1, 999}},
     {item13, 36, {1, 999}}, {item14, 40, {1, 999}},
     {item15, 40, {1, 999}}, {item16, 48, {1, 999}},
     {item17, 100, {1, 999}}, {item18, 8, {1, 999}},
     {item19, 12, {1, 999}}];
get_rand1({1, 4}) ->
    [{item1, 135, {1, 999}}, {item2, 60, {1, 999}},
     {item3, 50, {1, 999}}, {item4, 30, {1, 999}},
     {item5, 60, {1, 999}}, {item6, 50, {1, 999}},
     {item7, 50, {1, 999}}, {item8, 133, {1, 999}},
     {item9, 20, {1, 999}}, {item10, 52, {1, 999}},
     {item11, 40, {1, 999}}, {item12, 36, {1, 999}},
     {item13, 36, {1, 999}}, {item14, 40, {1, 999}},
     {item15, 40, {1, 999}}, {item16, 48, {1, 999}},
     {item17, 100, {1, 999}}, {item18, 8, {1, 999}},
     {item19, 12, {1, 999}}];
get_rand1(_) -> [].

get_rand2({cluster18, 34}) ->
    [#exchange_ref{type_type = 34, id = 34061,
		   lev = {1, 999}, type = cluster18, item_bid = 32,
		   item_name = lang:get(<<"烈阳晶石"/utf8>>), item_num = 10000,
		   pro = 100, price = 1000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_week = 5,
		   flag = 1}];
get_rand2({cluster17, 34}) ->
    [#exchange_ref{type_type = 34, id = 34051,
		   lev = {1, 999}, type = cluster17, item_bid = 26901,
		   item_name = lang:get(<<"影刹碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34052,
		   lev = {1, 999}, type = cluster17, item_bid = 26906,
		   item_name = lang:get(<<"潘碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34053,
		   lev = {1, 999}, type = cluster17, item_bid = 26907,
		   item_name = lang:get(<<"斯芬克斯碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34054,
		   lev = {1, 999}, type = cluster17, item_bid = 26908,
		   item_name = lang:get(<<"芬尼尔碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34055,
		   lev = {1, 999}, type = cluster17, item_bid = 26909,
		   item_name = lang:get(<<"拉塔托斯克碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({cluster16, 34}) ->
    [#exchange_ref{type_type = 34, id = 34041,
		   lev = {1, 999}, type = cluster16, item_bid = 25906,
		   item_name = lang:get(<<"普罗米修斯碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34042,
		   lev = {1, 999}, type = cluster16, item_bid = 25907,
		   item_name = lang:get(<<"瓦尔基里碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34043,
		   lev = {1, 999}, type = cluster16, item_bid = 25908,
		   item_name = lang:get(<<"洛基碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34044,
		   lev = {1, 999}, type = cluster16, item_bid = 25910,
		   item_name = lang:get(<<"海姆达尔碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({cluster15, 34}) ->
    [#exchange_ref{type_type = 34, id = 34031,
		   lev = {1, 999}, type = cluster15, item_bid = 24901,
		   item_name = lang:get(<<"冰雪女王碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34032,
		   lev = {1, 999}, type = cluster15, item_bid = 24903,
		   item_name = lang:get(<<"泰坦碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34033,
		   lev = {1, 999}, type = cluster15, item_bid = 24904,
		   item_name = lang:get(<<"波塞冬碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34034,
		   lev = {1, 999}, type = cluster15, item_bid = 24909,
		   item_name = lang:get(<<"耶梦加得碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34035,
		   lev = {1, 999}, type = cluster15, item_bid = 24910,
		   item_name = lang:get(<<"酒神碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 3500, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({cluster14, 34}) ->
    [#exchange_ref{type_type = 34, id = 34021,
		   lev = {1, 999}, type = cluster14, item_bid = 28901,
		   item_name = lang:get(<<"哈迪斯碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34022,
		   lev = {1, 999}, type = cluster14, item_bid = 28902,
		   item_name = lang:get(<<"亚巴顿碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34023,
		   lev = {1, 999}, type = cluster14, item_bid = 28903,
		   item_name = lang:get(<<"黑暗之主碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34024,
		   lev = {1, 999}, type = cluster14, item_bid = 28906,
		   item_name = lang:get(<<"潘多拉碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34025,
		   lev = {1, 999}, type = cluster14, item_bid = 28907,
		   item_name = lang:get(<<"海拉碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({cluster13, 34}) ->
    [#exchange_ref{type_type = 34, id = 34011,
		   lev = {1, 999}, type = cluster13, item_bid = 27901,
		   item_name = lang:get(<<"宙斯碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34012,
		   lev = {1, 999}, type = cluster13, item_bid = 27903,
		   item_name = lang:get(<<"雷神碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34013,
		   lev = {1, 999}, type = cluster13, item_bid = 27906,
		   item_name = lang:get(<<"神灵大祭司碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 34, id = 34014,
		   lev = {1, 999}, type = cluster13, item_bid = 27907,
		   item_name = lang:get(<<"拉斐尔碎片"/utf8>>), item_num = 5,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({cluster19, 34}) ->
    [#exchange_ref{type_type = 34, id = 34004,
		   lev = {1, 999}, type = cluster19, item_bid = 10006,
		   item_name = lang:get(<<"天赋秘典"/utf8>>), item_num = 10,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_week = 2,
		   flag = 1}];
get_rand2({cluster10, 34}) ->
    [#exchange_ref{type_type = 34, id = 34003,
		   lev = {1, 999}, type = cluster10, item_bid = 10090,
		   item_name = lang:get(<<"天启星纹石"/utf8>>), item_num = 10,
		   pro = 100, price = 2000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_week = 5,
		   flag = 1}];
get_rand2({cluster20, 34}) ->
    [#exchange_ref{type_type = 34, id = 34005,
		   lev = {1, 999}, type = cluster20, item_bid = 10091,
		   item_name = lang:get(<<"天启星纹石"/utf8>>), item_num = 1,
		   pro = 100, price = 5000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_week = 5,
		   flag = 1}];
get_rand2({cluster12, 34}) ->
    [#exchange_ref{type_type = 34, id = 34002,
		   lev = {1, 999}, type = cluster12, item_bid = 37005,
		   item_name = lang:get(<<"置换精华"/utf8>>), item_num = 1,
		   pro = 100, price = 4000, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_week = 3,
		   flag = 1}];
get_rand2({cluster11, 34}) ->
    [#exchange_ref{type_type = 34, id = 34001,
		   lev = {1, 999}, type = cluster11, item_bid = 29,
		   item_name = lang:get(<<"皮肤碎片"/utf8>>), item_num = 1,
		   pro = 100, price = 250, pay_type = cluster_coin,
		   item_type = 3, label = 0, discount = 0, limit_week = 10,
		   flag = 1}];
get_rand2({pets1, 43}) ->
    [#exchange_ref{type_type = 43, id = 43064,
		   lev = {70, 999}, type = pets1, item_bid = 100201,
		   item_name = lang:get(<<"小礼盒"/utf8>>),
		   item_desc = lang:get(<<"英雄碎片概率+5%"/utf8>>),
		   item_num = 1, pro = 85, price = 80000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43065,
		   lev = {70, 999}, type = pets1, item_bid = 100202,
		   item_name = lang:get(<<"玻璃瓶"/utf8>>),
		   item_desc = lang:get(<<"符文精华概率+5%"/utf8>>),
		   item_num = 1, pro = 85, price = 80000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43066,
		   lev = {70, 999}, type = pets1, item_bid = 100203,
		   item_name = lang:get(<<"毛笔"/utf8>>),
		   item_desc = lang:get(<<"日记概率+2%"/utf8>>), item_num = 1,
		   pro = 85, price = 80000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43067,
		   lev = {70, 999}, type = pets1, item_bid = 100204,
		   item_name = lang:get(<<"傻瓜机"/utf8>>),
		   item_desc = lang:get(<<"明信片概率+2%"/utf8>>), item_num = 1,
		   pro = 85, price = 80000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43068,
		   lev = {70, 999}, type = pets1, item_bid = 100205,
		   item_name = lang:get(<<"手持式探测器"/utf8>>),
		   item_desc = lang:get(<<"金币、钻石概率+5%"/utf8>>),
		   item_num = 1, pro = 85, price = 80000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43069,
		   lev = {70, 999}, type = pets1, item_bid = 100241,
		   item_name = lang:get(<<"宝箱"/utf8>>),
		   item_desc = lang:get(<<"英雄碎片概率+10%"/utf8>>),
		   item_num = 1, pro = 85, price = 160000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43070,
		   lev = {70, 999}, type = pets1, item_bid = 100242,
		   item_name = lang:get(<<"水晶瓶"/utf8>>),
		   item_desc = lang:get(<<"符文精华概率+10%"/utf8>>),
		   item_num = 1, pro = 85, price = 160000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43071,
		   lev = {70, 999}, type = pets1, item_bid = 100243,
		   item_name = lang:get(<<"贵重的钢笔"/utf8>>),
		   item_desc = lang:get(<<"日记概率+5%"/utf8>>), item_num = 1,
		   pro = 85, price = 160000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43072,
		   lev = {70, 999}, type = pets1, item_bid = 100244,
		   item_name = lang:get(<<"智能相机"/utf8>>),
		   item_desc = lang:get(<<"明信片概率+5%"/utf8>>), item_num = 1,
		   pro = 85, price = 160000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43073,
		   lev = {70, 999}, type = pets1, item_bid = 100245,
		   item_name = lang:get(<<"精密的探测仪"/utf8>>),
		   item_desc = lang:get(<<"金币钻石概率+10%"/utf8>>),
		   item_num = 1, pro = 85, price = 160000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43074,
		   lev = {70, 999}, type = pets1, item_bid = 100281,
		   item_name = lang:get(<<"黄色机票"/utf8>>),
		   item_desc = lang:get(<<"概率前往贵族皇室"/utf8>>), item_num = 1,
		   pro = 25, price = 500000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43075,
		   lev = {70, 999}, type = pets1, item_bid = 100282,
		   item_name = lang:get(<<"蓝色机票"/utf8>>),
		   item_desc = lang:get(<<"概率前往星空之境"/utf8>>), item_num = 1,
		   pro = 25, price = 500000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43076,
		   lev = {70, 999}, type = pets1, item_bid = 100283,
		   item_name = lang:get(<<"车票"/utf8>>),
		   item_desc = lang:get(<<"概率前往温馨小区"/utf8>>), item_num = 1,
		   pro = 18, price = 250000, pay_type = coin,
		   item_type = 42, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43077,
		   lev = {70, 999}, type = pets1, item_bid = 10701,
		   item_name = lang:get(<<"小木槌"/utf8>>),
		   item_desc = lang:get(<<"加速孵化精灵"/utf8>>), item_num = 1,
		   pro = 0, price = 300000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43078,
		   lev = {70, 999}, type = pets1, item_bid = 10702,
		   item_name = lang:get(<<"星辰锤"/utf8>>),
		   item_desc = lang:get(<<"加速孵化精灵"/utf8>>), item_num = 1,
		   pro = 0, price = 1500000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43079,
		   lev = {70, 999}, type = pets1, item_bid = 10703,
		   item_name = lang:get(<<"奥术法杖"/utf8>>),
		   item_desc = lang:get(<<"加速孵化精灵"/utf8>>), item_num = 1,
		   pro = 0, price = 3000000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43080,
		   lev = {70, 999}, type = pets1, item_bid = 10602,
		   item_name = lang:get(<<"玄魔蛋"/utf8>>),
		   item_desc = lang:get(<<"孵化出精灵"/utf8>>), item_num = 1,
		   pro = 26, price = 6000, pay_type = home_coin,
		   item_type = 3, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43081,
		   lev = {70, 999}, type = pets1, item_bid = 10603,
		   item_name = lang:get(<<"圣灵蛋"/utf8>>),
		   item_desc = lang:get(<<"孵化出精灵"/utf8>>), item_num = 1,
		   pro = 6, price = 14400, pay_type = home_coin,
		   item_type = 3, label = 0, discount = 0,
		   limit_count = 1}];
get_rand2({furniture2, 43}) ->
    [#exchange_ref{type_type = 43, id = 43045,
		   lev = {70, 999}, type = furniture2, item_bid = 200111,
		   item_name = lang:get(<<"木制落地镜"/utf8>>),
		   item_desc = lang:get(<<"舒适度+140"/utf8>>), item_num = 1,
		   pro = 100, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43046,
		   lev = {70, 999}, type = furniture2, item_bid = 200112,
		   item_name = lang:get(<<"舒适双人沙发"/utf8>>),
		   item_desc = lang:get(<<"舒适度+140"/utf8>>), item_num = 1,
		   pro = 100, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43047,
		   lev = {70, 999}, type = furniture2, item_bid = 200114,
		   item_name = lang:get(<<"可爱布偶熊"/utf8>>),
		   item_desc = lang:get(<<"舒适度+140"/utf8>>), item_num = 1,
		   pro = 100, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43048,
		   lev = {70, 999}, type = furniture2, item_bid = 200212,
		   item_name = lang:get(<<"休憩的英短猫"/utf8>>),
		   item_desc = lang:get(<<"舒适度+40"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43049,
		   lev = {70, 999}, type = furniture2, item_bid = 200251,
		   item_name = lang:get(<<"皇室贵族地板"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43050,
		   lev = {70, 999}, type = furniture2, item_bid = 200252,
		   item_name = lang:get(<<"皇室贵族墙壁"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43051,
		   lev = {70, 999}, type = furniture2, item_bid = 200210,
		   item_name = lang:get(<<"皇室壁炉"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43052,
		   lev = {70, 999}, type = furniture2, item_bid = 200211,
		   item_name = lang:get(<<"典雅玻璃柜"/utf8>>),
		   item_desc = lang:get(<<"舒适度+100"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43053,
		   lev = {70, 999}, type = furniture2, item_bid = 200351,
		   item_name = lang:get(<<"占星密室地板"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43054,
		   lev = {70, 999}, type = furniture2, item_bid = 200352,
		   item_name = lang:get(<<"占星密室墙壁"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43055,
		   lev = {70, 999}, type = furniture2, item_bid = 200310,
		   item_name = lang:get(<<"星象水晶球"/utf8>>),
		   item_desc = lang:get(<<"舒适度+80"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43056,
		   lev = {70, 999}, type = furniture2, item_bid = 200306,
		   item_name = lang:get(<<"星月挂饰"/utf8>>),
		   item_desc = lang:get(<<"舒适度+160"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43057,
		   lev = {70, 999}, type = furniture2, item_bid = 200311,
		   item_name = lang:get(<<"星座魔镜"/utf8>>),
		   item_desc = lang:get(<<"舒适度+140"/utf8>>), item_num = 1,
		   pro = 65, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43058,
		   lev = {70, 999}, type = furniture2, item_bid = 200404,
		   item_name = lang:get(<<"浓情依偎兔"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 6, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43059,
		   lev = {70, 999}, type = furniture2, item_bid = 200405,
		   item_name = lang:get(<<"七夕情缘伞"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 6, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43060,
		   lev = {70, 999}, type = furniture2, item_bid = 200406,
		   item_name = lang:get(<<"浓情七夕屏风"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 6, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43061,
		   lev = {70, 999}, type = furniture2, item_bid = 200411,
		   item_name = lang:get(<<"柔情蜜意圆桌"/utf8>>),
		   item_desc = lang:get(<<"舒适度+150"/utf8>>), item_num = 1,
		   pro = 6, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43062,
		   lev = {70, 999}, type = furniture2, item_bid = 200451,
		   item_name = lang:get(<<"浓情七夕地板"/utf8>>),
		   item_desc = lang:get(<<"舒适度+160"/utf8>>), item_num = 1,
		   pro = 5, price = 8000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43063,
		   lev = {70, 999}, type = furniture2, item_bid = 200452,
		   item_name = lang:get(<<"浓情七夕墙壁"/utf8>>),
		   item_desc = lang:get(<<"舒适度+160"/utf8>>), item_num = 1,
		   pro = 5, price = 8000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43501,
		   lev = {70, 999}, type = furniture2, item_bid = 200508,
		   item_name = lang:get(<<"黑石花柱"/utf8>>),
		   item_desc = lang:get(<<"舒适度+150"/utf8>>), item_num = 1,
		   pro = 4, price = 5000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43502,
		   lev = {70, 999}, type = furniture2, item_bid = 200501,
		   item_name = lang:get(<<"幽森盏灯"/utf8>>),
		   item_desc = lang:get(<<"舒适度+50"/utf8>>), item_num = 1,
		   pro = 6, price = 3000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1},
     #exchange_ref{type_type = 43, id = 43503,
		   lev = {70, 999}, type = furniture2, item_bid = 200509,
		   item_name = lang:get(<<"幽冥雕像"/utf8>>),
		   item_desc = lang:get(<<"舒适度+50"/utf8>>), item_num = 1,
		   pro = 6, price = 3000, pay_type = home_coin,
		   item_type = 41, label = 0, discount = 0,
		   limit_count = 1}];
get_rand2({furniture1, 43}) ->
    [#exchange_ref{type_type = 43, id = 43001,
		   lev = {70, 999}, type = furniture1, item_bid = 200111,
		   item_name = lang:get(<<"木制落地镜"/utf8>>),
		   item_desc = lang:get(<<"舒适度+140"/utf8>>), item_num = 1,
		   pro = 60, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43002,
		   lev = {70, 999}, type = furniture1, item_bid = 200112,
		   item_name = lang:get(<<"舒适双人沙发"/utf8>>),
		   item_desc = lang:get(<<"舒适度+140"/utf8>>), item_num = 1,
		   pro = 60, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43003,
		   lev = {70, 999}, type = furniture1, item_bid = 200114,
		   item_name = lang:get(<<"可爱布偶熊"/utf8>>),
		   item_desc = lang:get(<<"舒适度+140"/utf8>>), item_num = 1,
		   pro = 60, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43004,
		   lev = {70, 999}, type = furniture1, item_bid = 200113,
		   item_name = lang:get(<<"舒适木床"/utf8>>),
		   item_desc = lang:get(<<"舒适度+320"/utf8>>), item_num = 1,
		   pro = 20, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43005,
		   lev = {70, 999}, type = furniture1, item_bid = 200109,
		   item_name = lang:get(<<"温馨小屋窗户"/utf8>>),
		   item_desc = lang:get(<<"舒适度+360"/utf8>>), item_num = 1,
		   pro = 20, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43006,
		   lev = {70, 999}, type = furniture1, item_bid = 200110,
		   item_name = lang:get(<<"绒毛圆毯"/utf8>>),
		   item_desc = lang:get(<<"舒适度+340"/utf8>>), item_num = 1,
		   pro = 20, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43011,
		   lev = {70, 999}, type = furniture1, item_bid = 200212,
		   item_name = lang:get(<<"休憩的英短猫"/utf8>>),
		   item_desc = lang:get(<<"舒适度+40"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43012,
		   lev = {70, 999}, type = furniture1, item_bid = 200251,
		   item_name = lang:get(<<"皇室贵族地板"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43013,
		   lev = {70, 999}, type = furniture1, item_bid = 200252,
		   item_name = lang:get(<<"皇室贵族墙壁"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43014,
		   lev = {70, 999}, type = furniture1, item_bid = 200210,
		   item_name = lang:get(<<"皇室壁炉"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43015,
		   lev = {70, 999}, type = furniture1, item_bid = 200211,
		   item_name = lang:get(<<"典雅玻璃柜"/utf8>>),
		   item_desc = lang:get(<<"舒适度+100"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43016,
		   lev = {70, 999}, type = furniture1, item_bid = 200206,
		   item_name = lang:get(<<"贵族纹章地毯"/utf8>>),
		   item_desc = lang:get(<<"舒适度+350"/utf8>>), item_num = 1,
		   pro = 20, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43017,
		   lev = {70, 999}, type = furniture1, item_bid = 200207,
		   item_name = lang:get(<<"典雅落地窗"/utf8>>),
		   item_desc = lang:get(<<"舒适度+375"/utf8>>), item_num = 1,
		   pro = 20, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43018,
		   lev = {70, 999}, type = furniture1, item_bid = 200213,
		   item_name = lang:get(<<"皇室钢琴"/utf8>>),
		   item_desc = lang:get(<<"舒适度+380"/utf8>>), item_num = 1,
		   pro = 10, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43019,
		   lev = {70, 999}, type = furniture1, item_bid = 200214,
		   item_name = lang:get(<<"贵族黄金马车"/utf8>>),
		   item_desc = lang:get(<<"舒适度+420"/utf8>>), item_num = 1,
		   pro = 10, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43021,
		   lev = {70, 999}, type = furniture1, item_bid = 200351,
		   item_name = lang:get(<<"占星密室地板"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43022,
		   lev = {70, 999}, type = furniture1, item_bid = 200352,
		   item_name = lang:get(<<"占星密室墙壁"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43023,
		   lev = {70, 999}, type = furniture1, item_bid = 200310,
		   item_name = lang:get(<<"星象水晶球"/utf8>>),
		   item_desc = lang:get(<<"舒适度+80"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43024,
		   lev = {70, 999}, type = furniture1, item_bid = 200306,
		   item_name = lang:get(<<"星月挂饰"/utf8>>),
		   item_desc = lang:get(<<"舒适度+160"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43025,
		   lev = {70, 999}, type = furniture1, item_bid = 200311,
		   item_name = lang:get(<<"星座魔镜"/utf8>>),
		   item_desc = lang:get(<<"舒适度+140"/utf8>>), item_num = 1,
		   pro = 48, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43026,
		   lev = {70, 999}, type = furniture1, item_bid = 200308,
		   item_name = lang:get(<<"占星挂毯"/utf8>>),
		   item_desc = lang:get(<<"舒适度+350"/utf8>>), item_num = 1,
		   pro = 20, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43027,
		   lev = {70, 999}, type = furniture1, item_bid = 200307,
		   item_name = lang:get(<<"占星密室地毯"/utf8>>),
		   item_desc = lang:get(<<"舒适度+350"/utf8>>), item_num = 1,
		   pro = 20, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43028,
		   lev = {70, 999}, type = furniture1, item_bid = 200312,
		   item_name = lang:get(<<"占星窗帘"/utf8>>),
		   item_desc = lang:get(<<"舒适度+365"/utf8>>), item_num = 1,
		   pro = 20, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43029,
		   lev = {70, 999}, type = furniture1, item_bid = 200313,
		   item_name = lang:get(<<"神秘占星仪"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 10, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43030,
		   lev = {70, 999}, type = furniture1, item_bid = 200314,
		   item_name = lang:get(<<"优雅星月小床"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 10, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43031,
		   lev = {70, 999}, type = furniture1, item_bid = 200404,
		   item_name = lang:get(<<"浓情依偎兔"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 10, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43032,
		   lev = {70, 999}, type = furniture1, item_bid = 200405,
		   item_name = lang:get(<<"七夕情缘伞"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 10, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43033,
		   lev = {70, 999}, type = furniture1, item_bid = 200406,
		   item_name = lang:get(<<"浓情七夕屏风"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 10, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43034,
		   lev = {70, 999}, type = furniture1, item_bid = 200411,
		   item_name = lang:get(<<"柔情蜜意圆桌"/utf8>>),
		   item_desc = lang:get(<<"舒适度+150"/utf8>>), item_num = 1,
		   pro = 10, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43035,
		   lev = {70, 999}, type = furniture1, item_bid = 200451,
		   item_name = lang:get(<<"浓情七夕地板"/utf8>>),
		   item_desc = lang:get(<<"舒适度+160"/utf8>>), item_num = 1,
		   pro = 6, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43036,
		   lev = {70, 999}, type = furniture1, item_bid = 200452,
		   item_name = lang:get(<<"浓情七夕墙壁"/utf8>>),
		   item_desc = lang:get(<<"舒适度+160"/utf8>>), item_num = 1,
		   pro = 6, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43037,
		   lev = {70, 999}, type = furniture1, item_bid = 200409,
		   item_name = lang:get(<<"七夕蜜意靠椅"/utf8>>),
		   item_desc = lang:get(<<"舒适度+350"/utf8>>), item_num = 1,
		   pro = 6, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43038,
		   lev = {70, 999}, type = furniture1, item_bid = 200403,
		   item_name = lang:get(<<"七夕姻缘树"/utf8>>),
		   item_desc = lang:get(<<"舒适度+350"/utf8>>), item_num = 1,
		   pro = 6, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43039,
		   lev = {70, 999}, type = furniture1, item_bid = 200401,
		   item_name = lang:get(<<"七夕同心结"/utf8>>),
		   item_desc = lang:get(<<"舒适度+350"/utf8>>), item_num = 1,
		   pro = 6, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43040,
		   lev = {70, 999}, type = furniture1, item_bid = 200407,
		   item_name = lang:get(<<"两情相悦地毯"/utf8>>),
		   item_desc = lang:get(<<"舒适度+350"/utf8>>), item_num = 1,
		   pro = 6, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43041,
		   lev = {70, 999}, type = furniture1, item_bid = 200413,
		   item_name = lang:get(<<"牛郎"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 2, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43042,
		   lev = {70, 999}, type = furniture1, item_bid = 200414,
		   item_name = lang:get(<<"织女"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 2, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43043,
		   lev = {70, 999}, type = furniture1, item_bid = 200402,
		   item_name = lang:get(<<"七夕心型窗"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 2, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43044,
		   lev = {70, 999}, type = furniture1, item_bid = 200408,
		   item_name = lang:get(<<"浓情爱心圆床"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 2, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43101,
		   lev = {70, 999}, type = furniture1, item_bid = 200502,
		   item_name = lang:get(<<"术士炼金炉"/utf8>>),
		   item_desc = lang:get(<<"舒适度+350"/utf8>>), item_num = 1,
		   pro = 4, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43102,
		   lev = {70, 999}, type = furniture1, item_bid = 200507,
		   item_name = lang:get(<<"南瓜长椅"/utf8>>),
		   item_desc = lang:get(<<"舒适度+300"/utf8>>), item_num = 1,
		   pro = 4, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43103,
		   lev = {70, 999}, type = furniture1, item_bid = 200506,
		   item_name = lang:get(<<"幽森喷泉"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 2, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43104,
		   lev = {70, 999}, type = furniture1, item_bid = 200505,
		   item_name = lang:get(<<"邪魅南瓜"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 2, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43105,
		   lev = {70, 999}, type = furniture1, item_bid = 200511,
		   item_name = lang:get(<<"沉睡者之棺"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 2, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43106,
		   lev = {70, 999}, type = furniture1, item_bid = 200510,
		   item_name = lang:get(<<"幽森石门"/utf8>>),
		   item_desc = lang:get(<<"舒适度+160"/utf8>>), item_num = 1,
		   pro = 9, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43107,
		   lev = {70, 999}, type = furniture1, item_bid = 200513,
		   item_name = lang:get(<<"虚幻王座"/utf8>>),
		   item_desc = lang:get(<<"舒适度+400"/utf8>>), item_num = 1,
		   pro = 2, price = 1200, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43108,
		   lev = {70, 999}, type = furniture1, item_bid = 200551,
		   item_name = lang:get(<<"幽森之下地板"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 9, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43109,
		   lev = {70, 999}, type = furniture1, item_bid = 200552,
		   item_name = lang:get(<<"幽森囚笼墙壁"/utf8>>),
		   item_desc = lang:get(<<"舒适度+120"/utf8>>), item_num = 1,
		   pro = 9, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43110,
		   lev = {70, 999}, type = furniture1, item_bid = 200514,
		   item_name = lang:get(<<"不灭者灯笼"/utf8>>),
		   item_desc = lang:get(<<"舒适度+150"/utf8>>), item_num = 1,
		   pro = 9, price = 500, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{type_type = 43, id = 43111,
		   lev = {70, 999}, type = furniture1, item_bid = 200512,
		   item_name = lang:get(<<"幽森夜幕地毯"/utf8>>),
		   item_desc = lang:get(<<"舒适度+330"/utf8>>), item_num = 1,
		   pro = 4, price = 800, pay_type = gold, item_type = 41,
		   label = 0, discount = 0, limit_count = 1}];
get_rand2({skill15, 9}) ->
    [#exchange_ref{type_type = 9, lev = {160, 999},
		   type = skill15, item_bid = 16101,
		   item_name = lang:get(<<"破裂符石"/utf8>>), item_num = 1,
		   pro = 125, price = 4, pay_type = 10460, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {160, 999},
		   type = skill15, item_bid = 16102,
		   item_name = lang:get(<<"蓄力符石"/utf8>>), item_num = 1,
		   pro = 125, price = 4, pay_type = 10460, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {160, 999},
		   type = skill15, item_bid = 16103,
		   item_name = lang:get(<<"灵巧符石"/utf8>>), item_num = 1,
		   pro = 125, price = 4, pay_type = 10460, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {160, 999},
		   type = skill15, item_bid = 16104,
		   item_name = lang:get(<<"制裁符石"/utf8>>), item_num = 1,
		   pro = 125, price = 4, pay_type = 10460, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {160, 999},
		   type = skill15, item_bid = 16105,
		   item_name = lang:get(<<"信仰符石"/utf8>>), item_num = 1,
		   pro = 125, price = 4, pay_type = 10460, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {160, 999},
		   type = skill15, item_bid = 16106,
		   item_name = lang:get(<<"庇护符石"/utf8>>), item_num = 1,
		   pro = 125, price = 4, pay_type = 10460, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {160, 999},
		   type = skill15, item_bid = 16107,
		   item_name = lang:get(<<"灵感符石"/utf8>>), item_num = 1,
		   pro = 125, price = 4, pay_type = 10460, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {160, 999},
		   type = skill15, item_bid = 16108,
		   item_name = lang:get(<<"救急符石"/utf8>>), item_num = 1,
		   pro = 125, price = 4, pay_type = 10460, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1}];
get_rand2({skill14, 9}) ->
    [#exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16009,
		   item_name = lang:get(<<"回音符石"/utf8>>), item_num = 1,
		   pro = 113, price = 2000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16010,
		   item_name = lang:get(<<"降临符石"/utf8>>), item_num = 1,
		   pro = 113, price = 2000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16011,
		   item_name = lang:get(<<"禁疗符石"/utf8>>), item_num = 1,
		   pro = 113, price = 2000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16012,
		   item_name = lang:get(<<"灭魂符石"/utf8>>), item_num = 1,
		   pro = 113, price = 2000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16013,
		   item_name = lang:get(<<"驱散符石"/utf8>>), item_num = 1,
		   pro = 113, price = 2000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16014,
		   item_name = lang:get(<<"冲击符石"/utf8>>), item_num = 1,
		   pro = 113, price = 2000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16016,
		   item_name = lang:get(<<"减速符石"/utf8>>), item_num = 1,
		   pro = 113, price = 2000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16017,
		   item_name = lang:get(<<"荣光符石"/utf8>>), item_num = 1,
		   pro = 113, price = 2000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16030,
		   item_name = lang:get(<<"迟缓符石"/utf8>>), item_num = 1,
		   pro = 113, price = 2000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16009,
		   item_name = lang:get(<<"回音符石"/utf8>>), item_num = 1,
		   pro = 12, price = 2000, pay_type = gold, item_type = 3,
		   label = 8, discount = 1600, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16010,
		   item_name = lang:get(<<"降临符石"/utf8>>), item_num = 1,
		   pro = 12, price = 2000, pay_type = gold, item_type = 3,
		   label = 8, discount = 1600, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16011,
		   item_name = lang:get(<<"禁疗符石"/utf8>>), item_num = 1,
		   pro = 12, price = 2000, pay_type = gold, item_type = 3,
		   label = 8, discount = 1600, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16012,
		   item_name = lang:get(<<"灭魂符石"/utf8>>), item_num = 1,
		   pro = 12, price = 2000, pay_type = gold, item_type = 3,
		   label = 8, discount = 1600, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16013,
		   item_name = lang:get(<<"驱散符石"/utf8>>), item_num = 1,
		   pro = 12, price = 2000, pay_type = gold, item_type = 3,
		   label = 8, discount = 1600, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16014,
		   item_name = lang:get(<<"冲击符石"/utf8>>), item_num = 1,
		   pro = 12, price = 2000, pay_type = gold, item_type = 3,
		   label = 8, discount = 1600, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16016,
		   item_name = lang:get(<<"减速符石"/utf8>>), item_num = 1,
		   pro = 12, price = 2000, pay_type = gold, item_type = 3,
		   label = 8, discount = 1600, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16017,
		   item_name = lang:get(<<"荣光符石"/utf8>>), item_num = 1,
		   pro = 12, price = 2000, pay_type = gold, item_type = 3,
		   label = 8, discount = 1600, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill14, item_bid = 16030,
		   item_name = lang:get(<<"迟缓符石"/utf8>>), item_num = 1,
		   pro = 12, price = 2000, pay_type = gold, item_type = 3,
		   label = 8, discount = 1600, limit_count = 1, flag = 1}];
get_rand2({skill13, 9}) ->
    [#exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16003,
		   item_name = lang:get(<<"追击符石"/utf8>>), item_num = 1,
		   pro = 64, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16004,
		   item_name = lang:get(<<"暴追符石"/utf8>>), item_num = 1,
		   pro = 64, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16007,
		   item_name = lang:get(<<"战意符石"/utf8>>), item_num = 1,
		   pro = 64, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16015,
		   item_name = lang:get(<<"挑衅符石"/utf8>>), item_num = 1,
		   pro = 64, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16019,
		   item_name = lang:get(<<"镇压符石"/utf8>>), item_num = 1,
		   pro = 64, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16020,
		   item_name = lang:get(<<"精准符石"/utf8>>), item_num = 1,
		   pro = 64, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16022,
		   item_name = lang:get(<<"抗控符石"/utf8>>), item_num = 1,
		   pro = 64, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16023,
		   item_name = lang:get(<<"再生符石"/utf8>>), item_num = 1,
		   pro = 64, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16026,
		   item_name = lang:get(<<"抗暴符石"/utf8>>), item_num = 1,
		   pro = 65, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16029,
		   item_name = lang:get(<<"生机符石"/utf8>>), item_num = 1,
		   pro = 65, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16039,
		   item_name = lang:get(<<"清心符石"/utf8>>), item_num = 1,
		   pro = 65, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16040,
		   item_name = lang:get(<<"反伤符石"/utf8>>), item_num = 1,
		   pro = 65, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16045,
		   item_name = lang:get(<<"圣灵符石"/utf8>>), item_num = 1,
		   pro = 65, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16046,
		   item_name = lang:get(<<"驱灵符石"/utf8>>), item_num = 1,
		   pro = 65, price = 2500, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16003,
		   item_name = lang:get(<<"追击符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16004,
		   item_name = lang:get(<<"暴追符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16007,
		   item_name = lang:get(<<"战意符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16015,
		   item_name = lang:get(<<"挑衅符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16019,
		   item_name = lang:get(<<"镇压符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16020,
		   item_name = lang:get(<<"精准符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16022,
		   item_name = lang:get(<<"抗控符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16023,
		   item_name = lang:get(<<"再生符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16026,
		   item_name = lang:get(<<"抗暴符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16029,
		   item_name = lang:get(<<"生机符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16039,
		   item_name = lang:get(<<"清心符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16040,
		   item_name = lang:get(<<"反伤符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16045,
		   item_name = lang:get(<<"圣灵符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill13, item_bid = 16046,
		   item_name = lang:get(<<"驱灵符石"/utf8>>), item_num = 1,
		   pro = 7, price = 2500, pay_type = gold, item_type = 3,
		   label = 8, discount = 2000, limit_count = 1, flag = 1}];
get_rand2({skill12, 9}) ->
    [#exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16001,
		   item_name = lang:get(<<"魔力符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16002,
		   item_name = lang:get(<<"神力符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16005,
		   item_name = lang:get(<<"暴躁符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16006,
		   item_name = lang:get(<<"狂暴符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16018,
		   item_name = lang:get(<<"闪避符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16021,
		   item_name = lang:get(<<"净化符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16024,
		   item_name = lang:get(<<"不屈符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16025,
		   item_name = lang:get(<<"复生符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16027,
		   item_name = lang:get(<<"魔免符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16028,
		   item_name = lang:get(<<"铁甲符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16031,
		   item_name = lang:get(<<"穿透符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16032,
		   item_name = lang:get(<<"命中符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16034,
		   item_name = lang:get(<<"免伤符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16036,
		   item_name = lang:get(<<"吸取符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16037,
		   item_name = lang:get(<<"神体符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16038,
		   item_name = lang:get(<<"护盾符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16041,
		   item_name = lang:get(<<"英勇符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16042,
		   item_name = lang:get(<<"专注符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16043,
		   item_name = lang:get(<<"波动符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16044,
		   item_name = lang:get(<<"神赦符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16047,
		   item_name = lang:get(<<"贪婪符石"/utf8>>), item_num = 1,
		   pro = 95, price = 2750, pay_type = 10450, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16001,
		   item_name = lang:get(<<"魔力符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16002,
		   item_name = lang:get(<<"神力符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16005,
		   item_name = lang:get(<<"暴躁符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16006,
		   item_name = lang:get(<<"狂暴符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16018,
		   item_name = lang:get(<<"闪避符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16021,
		   item_name = lang:get(<<"净化符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16024,
		   item_name = lang:get(<<"不屈符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16025,
		   item_name = lang:get(<<"复生符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16027,
		   item_name = lang:get(<<"魔免符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16028,
		   item_name = lang:get(<<"铁甲符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16031,
		   item_name = lang:get(<<"穿透符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16032,
		   item_name = lang:get(<<"命中符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16034,
		   item_name = lang:get(<<"免伤符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16036,
		   item_name = lang:get(<<"吸取符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16037,
		   item_name = lang:get(<<"神体符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16038,
		   item_name = lang:get(<<"护盾符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16041,
		   item_name = lang:get(<<"英勇符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16042,
		   item_name = lang:get(<<"专注符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16043,
		   item_name = lang:get(<<"波动符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16044,
		   item_name = lang:get(<<"神赦符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill12, item_bid = 16047,
		   item_name = lang:get(<<"贪婪符石"/utf8>>), item_num = 1,
		   pro = 5, price = 2750, pay_type = gold, item_type = 3,
		   label = 8, discount = 2200, limit_count = 1, flag = 1}];
get_rand2({skill11, 9}) ->
    [#exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill11, item_bid = 16008,
		   item_name = lang:get(<<"迅捷符石"/utf8>>), item_num = 1,
		   pro = 250, price = 3000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill11, item_bid = 16033,
		   item_name = lang:get(<<"法连符石"/utf8>>), item_num = 1,
		   pro = 350, price = 3000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill11, item_bid = 16035,
		   item_name = lang:get(<<"物连符石"/utf8>>), item_num = 1,
		   pro = 350, price = 3000, pay_type = 10450,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill11, item_bid = 16008,
		   item_name = lang:get(<<"迅捷符石"/utf8>>), item_num = 1,
		   pro = 10, price = 3000, pay_type = gold, item_type = 3,
		   label = 8, discount = 2400, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill11, item_bid = 16033,
		   item_name = lang:get(<<"法连符石"/utf8>>), item_num = 1,
		   pro = 20, price = 3000, pay_type = gold, item_type = 3,
		   label = 8, discount = 2400, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 9, lev = {1, 999},
		   type = skill11, item_bid = 16035,
		   item_name = lang:get(<<"物连符石"/utf8>>), item_num = 1,
		   pro = 20, price = 3000, pay_type = gold, item_type = 3,
		   label = 8, discount = 2400, limit_count = 1, flag = 1}];
get_rand2({trea19, 16}) ->
    [#exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea19, item_bid = 28700,
		   item_name = lang:get(<<"巨魔巫医碎片"/utf8>>), item_num = 20,
		   pro = 500, price = 300, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea19, item_bid = 27700,
		   item_name = lang:get(<<"光之苏尔碎片"/utf8>>), item_num = 20,
		   pro = 500, price = 300, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({trea18, 16}) ->
    [#exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea18, item_bid = 40108,
		   item_name = lang:get(<<"雷霆战刃"/utf8>>), item_num = 1,
		   pro = 300, price = 1075, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea18, item_bid = 40208,
		   item_name = lang:get(<<"雷霆护甲"/utf8>>), item_num = 1,
		   pro = 300, price = 1075, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea18, item_bid = 40307,
		   item_name = lang:get(<<"荣耀头盔"/utf8>>), item_num = 1,
		   pro = 200, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea18, item_bid = 40407,
		   item_name = lang:get(<<"荣耀战靴"/utf8>>), item_num = 1,
		   pro = 200, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({trea17, 16}) ->
    [#exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea17, item_bid = 40109,
		   item_name = lang:get(<<"魔灵战刃"/utf8>>), item_num = 1,
		   pro = 300, price = 1825, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea17, item_bid = 40209,
		   item_name = lang:get(<<"魔灵护甲"/utf8>>), item_num = 1,
		   pro = 300, price = 1825, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea17, item_bid = 40307,
		   item_name = lang:get(<<"荣耀头盔"/utf8>>), item_num = 1,
		   pro = 200, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea17, item_bid = 40407,
		   item_name = lang:get(<<"荣耀战靴"/utf8>>), item_num = 1,
		   pro = 200, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({trea16, 16}) ->
    [#exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea16, item_bid = 40107,
		   item_name = lang:get(<<"荣耀之刃"/utf8>>), item_num = 1,
		   pro = 100, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea16, item_bid = 40207,
		   item_name = lang:get(<<"荣耀护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea16, item_bid = 40307,
		   item_name = lang:get(<<"荣耀头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea16, item_bid = 40407,
		   item_name = lang:get(<<"荣耀战靴"/utf8>>), item_num = 1,
		   pro = 100, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({trea15, 16}) ->
    [#exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea15, item_bid = 40308,
		   item_name = lang:get(<<"雷霆头盔"/utf8>>), item_num = 1,
		   pro = 300, price = 1075, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea15, item_bid = 40408,
		   item_name = lang:get(<<"雷霆战靴"/utf8>>), item_num = 1,
		   pro = 300, price = 1075, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea15, item_bid = 40107,
		   item_name = lang:get(<<"荣耀之刃"/utf8>>), item_num = 1,
		   pro = 200, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea15, item_bid = 40207,
		   item_name = lang:get(<<"荣耀护甲"/utf8>>), item_num = 1,
		   pro = 200, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({trea14, 16}) ->
    [#exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea14, item_bid = 40309,
		   item_name = lang:get(<<"魔灵头盔"/utf8>>), item_num = 1,
		   pro = 300, price = 1825, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea14, item_bid = 40409,
		   item_name = lang:get(<<"魔灵战靴"/utf8>>), item_num = 1,
		   pro = 300, price = 1825, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea14, item_bid = 40107,
		   item_name = lang:get(<<"荣耀之刃"/utf8>>), item_num = 1,
		   pro = 200, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea14, item_bid = 40207,
		   item_name = lang:get(<<"荣耀护甲"/utf8>>), item_num = 1,
		   pro = 200, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({trea13, 16}) ->
    [#exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea13, item_bid = 40310,
		   item_name = lang:get(<<"光辉头盔"/utf8>>), item_num = 1,
		   pro = 150, price = 3125, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea13, item_bid = 40410,
		   item_name = lang:get(<<"光辉战靴"/utf8>>), item_num = 1,
		   pro = 150, price = 3125, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea13, item_bid = 40110,
		   item_name = lang:get(<<"光辉巨剑"/utf8>>), item_num = 1,
		   pro = 150, price = 3125, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea13, item_bid = 40210,
		   item_name = lang:get(<<"光辉护甲"/utf8>>), item_num = 1,
		   pro = 150, price = 3125, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea13, item_bid = 40307,
		   item_name = lang:get(<<"荣耀头盔"/utf8>>), item_num = 1,
		   pro = 125, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea13, item_bid = 40407,
		   item_name = lang:get(<<"荣耀战靴"/utf8>>), item_num = 1,
		   pro = 150, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({trea12, 16}) ->
    [#exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea12, item_bid = 40307,
		   item_name = lang:get(<<"荣耀头盔"/utf8>>), item_num = 1,
		   pro = 150, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea12, item_bid = 40107,
		   item_name = lang:get(<<"荣耀之刃"/utf8>>), item_num = 1,
		   pro = 150, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea12, item_bid = 40110,
		   item_name = lang:get(<<"光辉巨剑"/utf8>>), item_num = 1,
		   pro = 275, price = 3125, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea12, item_bid = 40210,
		   item_name = lang:get(<<"光辉护甲"/utf8>>), item_num = 1,
		   pro = 275, price = 3125, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea12, item_bid = 40407,
		   item_name = lang:get(<<"荣耀战靴"/utf8>>), item_num = 1,
		   pro = 150, price = 625, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({trea11, 16}) ->
    [#exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea11, item_bid = 24907,
		   item_name = lang:get(<<"海宁芙碎片"/utf8>>), item_num = 50,
		   pro = 175, price = 8000, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea11, item_bid = 26900,
		   item_name = lang:get(<<"奥丁碎片"/utf8>>), item_num = 50,
		   pro = 175, price = 9000, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea11, item_bid = 25900,
		   item_name = lang:get(<<"炽天使碎片"/utf8>>), item_num = 50,
		   pro = 170, price = 9000, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea11, item_bid = 25902,
		   item_name = lang:get(<<"剑豪卡赞碎片"/utf8>>), item_num = 50,
		   pro = 110, price = 8000, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea11, item_bid = 24908,
		   item_name = lang:get(<<"阿瑞斯碎片"/utf8>>), item_num = 50,
		   pro = 110, price = 8000, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea11, item_bid = 26903,
		   item_name = lang:get(<<"魅魔女王碎片"/utf8>>), item_num = 50,
		   pro = 110, price = 9000, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea11, item_bid = 25903,
		   item_name = lang:get(<<"菲尼克斯碎片"/utf8>>), item_num = 50,
		   pro = 50, price = 12000, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea11, item_bid = 26906,
		   item_name = lang:get(<<"潘碎片"/utf8>>), item_num = 50,
		   pro = 50, price = 12000, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 16, lev = {1, 999},
		   type = trea11, item_bid = 24902,
		   item_name = lang:get(<<"冰霜巨龙碎片"/utf8>>), item_num = 50,
		   pro = 50, price = 12000, pay_type = star_point,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul21, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul21, item_bid = 26902,
		   item_name = lang:get(<<"凯兰崔尔碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 2500, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul20, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul20, item_bid = 28903,
		   item_name = lang:get(<<"黑暗之主碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 5000, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul19, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul19, item_bid = 27901,
		   item_name = lang:get(<<"宙斯碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 5000, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul18, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul18, item_bid = 25902,
		   item_name = lang:get(<<"剑豪卡赞碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 2500, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul17, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul17, item_bid = 24908,
		   item_name = lang:get(<<"阿瑞斯碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 2500, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul16, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul16, item_bid = 26907,
		   item_name = lang:get(<<"斯芬克斯碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 4000, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul15, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul15, item_bid = 26901,
		   item_name = lang:get(<<"影刹碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 4000, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul14, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul14, item_bid = 25907,
		   item_name = lang:get(<<"瓦尔基里碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 4000, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul13, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul13, item_bid = 25901,
		   item_name = lang:get(<<"炎魔之王碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 4000, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul12, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul12, item_bid = 24904,
		   item_name = lang:get(<<"波塞冬碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 4000, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({soul11, 2}) ->
    [#exchange_ref{type_type = 2, lev = {1, 999},
		   type = soul11, item_bid = 24902,
		   item_name = lang:get(<<"冰霜巨龙碎片"/utf8>>), item_num = 50,
		   pro = 100, price = 4000, pay_type = hero_soul,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({item19, 4}) ->
    [#exchange_ref{type_type = 4, lev = {100, 999},
		   type = item19, item_bid = 1,
		   item_name = lang:get(<<"金币"/utf8>>), item_num = 100000,
		   pro = 500, price = 100000, pay_type = hero_exp,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {100, 999},
		   type = item19, item_bid = 1,
		   item_name = lang:get(<<"金币"/utf8>>), item_num = 500000,
		   pro = 700, price = 500000, pay_type = hero_exp,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item19, item_bid = 24500,
		   item_name = lang:get(<<"莉莉丝碎片"/utf8>>), item_num = 5,
		   pro = 150, price = 5000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item19, item_bid = 24600,
		   item_name = lang:get(<<"巫女碎片"/utf8>>), item_num = 10,
		   pro = 80, price = 10000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item19, item_bid = 24601,
		   item_name = lang:get(<<"兽族步兵碎片"/utf8>>), item_num = 10,
		   pro = 80, price = 10000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item19, item_bid = 25500,
		   item_name = lang:get(<<"地狱犬碎片"/utf8>>), item_num = 5,
		   pro = 150, price = 5000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item19, item_bid = 25600,
		   item_name = lang:get(<<"死灵巫师碎片"/utf8>>), item_num = 10,
		   pro = 80, price = 10000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item19, item_bid = 25601,
		   item_name = lang:get(<<"精灵希尔碎片"/utf8>>), item_num = 10,
		   pro = 80, price = 10000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item19, item_bid = 26500,
		   item_name = lang:get(<<"树精灵碎片"/utf8>>), item_num = 5,
		   pro = 150, price = 5000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item19, item_bid = 26600,
		   item_name = lang:get(<<"花精灵碎片"/utf8>>), item_num = 10,
		   pro = 80, price = 10000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item19, item_bid = 26601,
		   item_name = lang:get(<<"精灵射手碎片"/utf8>>), item_num = 10,
		   pro = 80, price = 10000, pay_type = coin, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1}];
get_rand2({item18, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item18, item_bid = 10451,
		   item_name = lang:get(<<"星辰符文"/utf8>>), item_num = 1,
		   pro = 300, price = 1000000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {35, 999},
		   type = item18, item_bid = 10452,
		   item_name = lang:get(<<"月亮符文"/utf8>>), item_num = 1,
		   pro = 200, price = 5000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 3000000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 999},
		   type = item18, item_bid = 10601,
		   item_name = lang:get(<<"元气蛋"/utf8>>), item_num = 1,
		   pro = 250, price = 1200000, pay_type = coin,
		   item_type = 3, label = 9, discount = 1080000, flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 999},
		   type = item18, item_bid = 10602,
		   item_name = lang:get(<<"玄魔蛋"/utf8>>), item_num = 1,
		   pro = 150, price = 5000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 3000000,
		   flag = 1}];
get_rand2({item17, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 20},
		   type = item17, item_bid = 40103,
		   item_name = lang:get(<<"精钢巨剑"/utf8>>), item_num = 1,
		   pro = 100, price = 100000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {20, 30},
		   type = item17, item_bid = 40104,
		   item_name = lang:get(<<"秘银长剑"/utf8>>), item_num = 1,
		   pro = 100, price = 200000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 40},
		   type = item17, item_bid = 40105,
		   item_name = lang:get(<<"冒险之刃"/utf8>>), item_num = 1,
		   pro = 100, price = 450000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {40, 50},
		   type = item17, item_bid = 40106,
		   item_name = lang:get(<<"胜利战刃"/utf8>>), item_num = 1,
		   pro = 100, price = 750000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 60},
		   type = item17, item_bid = 40107,
		   item_name = lang:get(<<"荣耀之刃"/utf8>>), item_num = 1,
		   pro = 100, price = 1250000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {60, 70},
		   type = item17, item_bid = 40108,
		   item_name = lang:get(<<"雷霆战刃"/utf8>>), item_num = 1,
		   pro = 100, price = 2150000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {70, 80},
		   type = item17, item_bid = 40109,
		   item_name = lang:get(<<"魔灵战刃"/utf8>>), item_num = 1,
		   pro = 100, price = 3650000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 90},
		   type = item17, item_bid = 40110,
		   item_name = lang:get(<<"光辉巨剑"/utf8>>), item_num = 1,
		   pro = 100, price = 6250000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {90, 999},
		   type = item17, item_bid = 40111,
		   item_name = lang:get(<<"光辉巨剑"/utf8>>), item_num = 1,
		   pro = 100, price = 18750000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 20},
		   type = item17, item_bid = 40203,
		   item_name = lang:get(<<"精钢护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 100000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {20, 30},
		   type = item17, item_bid = 40204,
		   item_name = lang:get(<<"秘银护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 200000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 40},
		   type = item17, item_bid = 40205,
		   item_name = lang:get(<<"冒险护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 450000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {40, 50},
		   type = item17, item_bid = 40206,
		   item_name = lang:get(<<"胜利护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 750000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 60},
		   type = item17, item_bid = 40207,
		   item_name = lang:get(<<"荣耀护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 1250000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {60, 70},
		   type = item17, item_bid = 40208,
		   item_name = lang:get(<<"雷霆护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 2150000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {70, 80},
		   type = item17, item_bid = 40209,
		   item_name = lang:get(<<"魔灵护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 3650000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 90},
		   type = item17, item_bid = 40210,
		   item_name = lang:get(<<"光辉护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 6250000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {90, 999},
		   type = item17, item_bid = 40211,
		   item_name = lang:get(<<"光辉护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 18750000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 20},
		   type = item17, item_bid = 40303,
		   item_name = lang:get(<<"精钢头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 100000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {20, 30},
		   type = item17, item_bid = 40304,
		   item_name = lang:get(<<"秘银头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 200000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 40},
		   type = item17, item_bid = 40305,
		   item_name = lang:get(<<"冒险头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 450000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {40, 50},
		   type = item17, item_bid = 40306,
		   item_name = lang:get(<<"胜利头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 750000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 60},
		   type = item17, item_bid = 40307,
		   item_name = lang:get(<<"荣耀头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 1250000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {60, 70},
		   type = item17, item_bid = 40308,
		   item_name = lang:get(<<"雷霆头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 2150000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {70, 80},
		   type = item17, item_bid = 40309,
		   item_name = lang:get(<<"魔灵头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 3650000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 90},
		   type = item17, item_bid = 40310,
		   item_name = lang:get(<<"光辉头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 6250000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {90, 999},
		   type = item17, item_bid = 40311,
		   item_name = lang:get(<<"光辉头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 18750000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 20},
		   type = item17, item_bid = 40403,
		   item_name = lang:get(<<"精钢戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 100000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {20, 30},
		   type = item17, item_bid = 40404,
		   item_name = lang:get(<<"秘银戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 200000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 40},
		   type = item17, item_bid = 40405,
		   item_name = lang:get(<<"冒险戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 450000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {40, 50},
		   type = item17, item_bid = 40406,
		   item_name = lang:get(<<"胜利戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 750000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 60},
		   type = item17, item_bid = 40407,
		   item_name = lang:get(<<"荣耀戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 1250000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {60, 70},
		   type = item17, item_bid = 40408,
		   item_name = lang:get(<<"雷霆戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 2150000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {70, 80},
		   type = item17, item_bid = 40409,
		   item_name = lang:get(<<"魔灵戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 3650000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 90},
		   type = item17, item_bid = 40410,
		   item_name = lang:get(<<"光辉戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 6250000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {90, 999},
		   type = item17, item_bid = 40411,
		   item_name = lang:get(<<"光辉戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 18750000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({item16, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item16, item_bid = 10401,
		   item_name = lang:get(<<"普通召唤书"/utf8>>), item_num = 1,
		   pro = 1000, price = 200000, pay_type = coin,
		   item_type = 3, label = 1, discount = 20000,
		   limit_count = 1, flag = 1}];
get_rand2({item15, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 24800,
		   item_name = lang:get(<<"亚瑟碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 24801,
		   item_name = lang:get(<<"竖琴海妖碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 24802,
		   item_name = lang:get(<<"水元素碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 24803,
		   item_name = lang:get(<<"冰晶女巫碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 24804,
		   item_name = lang:get(<<"娜迦侍女碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 25800,
		   item_name = lang:get(<<"火枪艾克碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 25801,
		   item_name = lang:get(<<"凯瑟琳碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 25802,
		   item_name = lang:get(<<"阿伽门农碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 25803,
		   item_name = lang:get(<<"雷诺蛮锤碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 25804,
		   item_name = lang:get(<<"翼女碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 26800,
		   item_name = lang:get(<<"吟游诗人碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 26801,
		   item_name = lang:get(<<"亡灵收割者碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 26802,
		   item_name = lang:get(<<"圣锤提尔碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 26803,
		   item_name = lang:get(<<"甘道夫碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 26804,
		   item_name = lang:get(<<"德鲁伊碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 3000000, pay_type = coin,
		   item_type = 3, label = 6, discount = 1800000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item15, item_bid = 29904,
		   item_name = lang:get(<<"4星随机英雄碎片"/utf8>>),
		   item_num = 30, pro = 100, price = 3000000,
		   pay_type = coin, item_type = 3, label = 6,
		   discount = 1800000, limit_count = 1, flag = 1}];
get_rand2({item14, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 24700,
		   item_name = lang:get(<<"魔法女学徒碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 24701,
		   item_name = lang:get(<<"美狄亚碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 24702,
		   item_name = lang:get(<<"破坏者碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 24703,
		   item_name = lang:get(<<"咒法师碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 24704,
		   item_name = lang:get(<<"月之骑士碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 25700,
		   item_name = lang:get(<<"邪狼·加鲁鲁碎片"/utf8>>),
		   item_num = 20, pro = 50, price = 500000,
		   pay_type = coin, item_type = 3, label = 7,
		   discount = 350000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 25701,
		   item_name = lang:get(<<"末日守卫碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 25702,
		   item_name = lang:get(<<"吉尔伽美什碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 25703,
		   item_name = lang:get(<<"地狱火碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 25704,
		   item_name = lang:get(<<"奥杜尔·铜须碎片"/utf8>>),
		   item_num = 20, pro = 50, price = 500000,
		   pay_type = coin, item_type = 3, label = 7,
		   discount = 350000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 26700,
		   item_name = lang:get(<<"树人碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 26701,
		   item_name = lang:get(<<"风暴猎手碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 26702,
		   item_name = lang:get(<<"雷霆狮鹫碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 26703,
		   item_name = lang:get(<<"岩灵碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 26704,
		   item_name = lang:get(<<"游侠射手碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 500000, pay_type = coin,
		   item_type = 3, label = 7, discount = 350000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 29903,
		   item_name = lang:get(<<"3星随机英雄碎片"/utf8>>),
		   item_num = 20, pro = 50, price = 500000,
		   pay_type = coin, item_type = 3, label = 7,
		   discount = 350000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 28700,
		   item_name = lang:get(<<"巨魔巫医碎片"/utf8>>), item_num = 20,
		   pro = 100, price = 1000000, pay_type = coin,
		   item_type = 3, label = 7, discount = 700000,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item14, item_bid = 27700,
		   item_name = lang:get(<<"光之苏尔碎片"/utf8>>), item_num = 20,
		   pro = 100, price = 1000000, pay_type = coin,
		   item_type = 3, label = 7, discount = 700000,
		   limit_count = 1, flag = 1}];
get_rand2({item13, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item13, item_bid = 37001,
		   item_name = lang:get(<<"寻宝券"/utf8>>), item_num = 1,
		   pro = 100, price = 200000, pay_type = coin,
		   item_type = 3, label = 1, discount = 20000,
		   limit_count = 1, flag = 1}];
get_rand2({item12, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item12, item_bid = 10103,
		   item_name = lang:get(<<"竞技挑战券"/utf8>>), item_num = 1,
		   pro = 100, price = 100000, pay_type = coin,
		   item_type = 3, label = 1, discount = 10000,
		   limit_count = 1, flag = 1}];
get_rand2({item11, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 30},
		   type = item11, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>), item_num = 20000,
		   pro = 30, price = 100000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 50},
		   type = item11, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>), item_num = 50000,
		   pro = 80, price = 250000, pay_type = coin,
		   item_type = 3, label = 0, discount = 0, flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 80},
		   type = item11, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>),
		   item_num = 100000, pro = 100, price = 500000,
		   pay_type = coin, item_type = 3, label = 0, discount = 0,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 120},
		   type = item11, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>),
		   item_num = 200000, pro = 100, price = 1000000,
		   pay_type = coin, item_type = 3, label = 0, discount = 0,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {120, 999},
		   type = item11, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>),
		   item_num = 300000, pro = 100, price = 1500000,
		   pay_type = coin, item_type = 3, label = 0, discount = 0,
		   flag = 1}];
get_rand2({item10, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item10, item_bid = 10001,
		   item_name = lang:get(<<"进阶石"/utf8>>), item_num = 100,
		   pro = 1000, price = 500000, pay_type = coin,
		   item_type = 3, label = 2, discount = 100000,
		   limit_count = 1, flag = 1}];
get_rand2({item9, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item9, item_bid = 10451,
		   item_name = lang:get(<<"星辰符文"/utf8>>), item_num = 1,
		   pro = 300, price = 200, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {35, 999},
		   type = item9, item_bid = 10452,
		   item_name = lang:get(<<"月亮符文"/utf8>>), item_num = 1,
		   pro = 200, price = 1000, pay_type = gold, item_type = 3,
		   label = 6, discount = 600, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 999},
		   type = item9, item_bid = 10453,
		   item_name = lang:get(<<"太阳符文"/utf8>>), item_num = 1,
		   pro = 100, price = 5000, pay_type = gold, item_type = 3,
		   label = 6, discount = 3000, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 999},
		   type = item9, item_bid = 10601,
		   item_name = lang:get(<<"元气蛋"/utf8>>), item_num = 1,
		   pro = 250, price = 120, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 999},
		   type = item9, item_bid = 10602,
		   item_name = lang:get(<<"玄魔蛋"/utf8>>), item_num = 1,
		   pro = 150, price = 300, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, flag = 1}];
get_rand2({item8, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 20},
		   type = item8, item_bid = 40103,
		   item_name = lang:get(<<"精钢巨剑"/utf8>>), item_num = 1,
		   pro = 100, price = 20, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {20, 30},
		   type = item8, item_bid = 40104,
		   item_name = lang:get(<<"秘银长剑"/utf8>>), item_num = 1,
		   pro = 100, price = 40, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 40},
		   type = item8, item_bid = 40105,
		   item_name = lang:get(<<"冒险之刃"/utf8>>), item_num = 1,
		   pro = 100, price = 90, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {40, 50},
		   type = item8, item_bid = 40106,
		   item_name = lang:get(<<"胜利战刃"/utf8>>), item_num = 1,
		   pro = 100, price = 150, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 60},
		   type = item8, item_bid = 40107,
		   item_name = lang:get(<<"荣耀之刃"/utf8>>), item_num = 1,
		   pro = 100, price = 250, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {60, 70},
		   type = item8, item_bid = 40108,
		   item_name = lang:get(<<"雷霆战刃"/utf8>>), item_num = 1,
		   pro = 100, price = 430, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {70, 80},
		   type = item8, item_bid = 40109,
		   item_name = lang:get(<<"魔灵战刃"/utf8>>), item_num = 1,
		   pro = 100, price = 730, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 90},
		   type = item8, item_bid = 40110,
		   item_name = lang:get(<<"光辉巨剑"/utf8>>), item_num = 1,
		   pro = 100, price = 1250, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {90, 999},
		   type = item8, item_bid = 40111,
		   item_name = lang:get(<<"光明神长剑"/utf8>>), item_num = 1,
		   pro = 100, price = 2085, pay_type = gold, item_type = 3,
		   label = 9, discount = 1875, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 20},
		   type = item8, item_bid = 40203,
		   item_name = lang:get(<<"精钢护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 20, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {20, 30},
		   type = item8, item_bid = 40204,
		   item_name = lang:get(<<"秘银护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 40, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 40},
		   type = item8, item_bid = 40205,
		   item_name = lang:get(<<"冒险护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 90, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {40, 50},
		   type = item8, item_bid = 40206,
		   item_name = lang:get(<<"胜利护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 150, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 60},
		   type = item8, item_bid = 40207,
		   item_name = lang:get(<<"荣耀护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 250, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {60, 70},
		   type = item8, item_bid = 40208,
		   item_name = lang:get(<<"雷霆护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 430, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {70, 80},
		   type = item8, item_bid = 40209,
		   item_name = lang:get(<<"魔灵护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 730, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 90},
		   type = item8, item_bid = 40210,
		   item_name = lang:get(<<"光辉护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 1250, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {90, 999},
		   type = item8, item_bid = 40211,
		   item_name = lang:get(<<"光辉护甲"/utf8>>), item_num = 1,
		   pro = 100, price = 2085, pay_type = gold, item_type = 3,
		   label = 9, discount = 1875, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 20},
		   type = item8, item_bid = 40303,
		   item_name = lang:get(<<"精钢头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 20, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {20, 30},
		   type = item8, item_bid = 40304,
		   item_name = lang:get(<<"秘银头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 40, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 40},
		   type = item8, item_bid = 40305,
		   item_name = lang:get(<<"冒险头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 90, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {40, 50},
		   type = item8, item_bid = 40306,
		   item_name = lang:get(<<"胜利头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 150, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 60},
		   type = item8, item_bid = 40307,
		   item_name = lang:get(<<"荣耀头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 250, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {60, 70},
		   type = item8, item_bid = 40308,
		   item_name = lang:get(<<"雷霆头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 430, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {70, 80},
		   type = item8, item_bid = 40309,
		   item_name = lang:get(<<"魔灵头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 730, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 90},
		   type = item8, item_bid = 40310,
		   item_name = lang:get(<<"光辉头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 1250, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {90, 999},
		   type = item8, item_bid = 40311,
		   item_name = lang:get(<<"光辉头盔"/utf8>>), item_num = 1,
		   pro = 100, price = 2085, pay_type = gold, item_type = 3,
		   label = 9, discount = 1875, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 20},
		   type = item8, item_bid = 40403,
		   item_name = lang:get(<<"精钢戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 20, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {20, 30},
		   type = item8, item_bid = 40404,
		   item_name = lang:get(<<"秘银戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 40, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 40},
		   type = item8, item_bid = 40405,
		   item_name = lang:get(<<"冒险戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 90, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {40, 50},
		   type = item8, item_bid = 40406,
		   item_name = lang:get(<<"胜利戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 150, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 60},
		   type = item8, item_bid = 40407,
		   item_name = lang:get(<<"荣耀戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 250, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {60, 70},
		   type = item8, item_bid = 40408,
		   item_name = lang:get(<<"雷霆戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 430, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {70, 80},
		   type = item8, item_bid = 40409,
		   item_name = lang:get(<<"魔灵戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 730, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 90},
		   type = item8, item_bid = 40410,
		   item_name = lang:get(<<"光辉戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 1250, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {90, 999},
		   type = item8, item_bid = 40411,
		   item_name = lang:get(<<"光辉戒指"/utf8>>), item_num = 1,
		   pro = 100, price = 2085, pay_type = gold, item_type = 3,
		   label = 9, discount = 1875, limit_count = 1, flag = 1}];
get_rand2({item7, 4}) ->
    [#exchange_ref{type_type = 4, lev = {20, 999},
		   type = item7, item_bid = 14001,
		   item_name = lang:get(<<"先知水晶"/utf8>>), item_num = 1,
		   pro = 40, price = 2500, pay_type = gold, item_type = 3,
		   label = 2, discount = 500, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item7, item_bid = 14002,
		   item_name = lang:get(<<"先知精华"/utf8>>), item_num = 100,
		   pro = 60, price = 1000, pay_type = gold, item_type = 3,
		   label = 5, discount = 500, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item7, item_bid = 10403,
		   item_name = lang:get(<<"高级召唤书"/utf8>>), item_num = 1,
		   pro = 500, price = 250, pay_type = gold, item_type = 3,
		   label = 6, discount = 150, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item7, item_bid = 10401,
		   item_name = lang:get(<<"普通召唤书"/utf8>>), item_num = 1,
		   pro = 400, price = 20, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1}];
get_rand2({item6, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 24800,
		   item_name = lang:get(<<"亚瑟碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 24801,
		   item_name = lang:get(<<"竖琴海妖碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 24802,
		   item_name = lang:get(<<"水元素碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 24803,
		   item_name = lang:get(<<"冰晶女巫碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 24804,
		   item_name = lang:get(<<"娜迦侍女碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 25800,
		   item_name = lang:get(<<"火枪艾克碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 25801,
		   item_name = lang:get(<<"凯瑟琳碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 25802,
		   item_name = lang:get(<<"阿伽门农碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 25803,
		   item_name = lang:get(<<"雷诺蛮锤碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 25804,
		   item_name = lang:get(<<"翼女碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 26800,
		   item_name = lang:get(<<"吟游诗人碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 26801,
		   item_name = lang:get(<<"亡灵收割者碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 26802,
		   item_name = lang:get(<<"圣锤提尔碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 26803,
		   item_name = lang:get(<<"甘道夫碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 26804,
		   item_name = lang:get(<<"德鲁伊碎片"/utf8>>), item_num = 30,
		   pro = 60, price = 600, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item6, item_bid = 29904,
		   item_name = lang:get(<<"4星随机英雄碎片"/utf8>>),
		   item_num = 30, pro = 100, price = 600, pay_type = gold,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1}];
get_rand2({item5, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 24700,
		   item_name = lang:get(<<"魔法女学徒碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 24701,
		   item_name = lang:get(<<"美狄亚碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 24702,
		   item_name = lang:get(<<"破坏者碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 24703,
		   item_name = lang:get(<<"咒法师碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 24704,
		   item_name = lang:get(<<"月之骑士碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 25700,
		   item_name = lang:get(<<"邪狼·加鲁鲁碎片"/utf8>>),
		   item_num = 20, pro = 50, price = 100, pay_type = gold,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 25701,
		   item_name = lang:get(<<"末日守卫碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 25702,
		   item_name = lang:get(<<"吉尔伽美什碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 25703,
		   item_name = lang:get(<<"地狱火碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 25704,
		   item_name = lang:get(<<"奥杜尔·铜须碎片"/utf8>>),
		   item_num = 20, pro = 50, price = 100, pay_type = gold,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 26700,
		   item_name = lang:get(<<"树人碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 26701,
		   item_name = lang:get(<<"风暴猎手碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 26702,
		   item_name = lang:get(<<"雷霆狮鹫碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 26703,
		   item_name = lang:get(<<"岩灵碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 26704,
		   item_name = lang:get(<<"游侠射手碎片"/utf8>>), item_num = 20,
		   pro = 50, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 29903,
		   item_name = lang:get(<<"3星随机英雄碎片"/utf8>>),
		   item_num = 20, pro = 50, price = 100, pay_type = gold,
		   item_type = 3, label = 0, discount = 0, limit_count = 1,
		   flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 28700,
		   item_name = lang:get(<<"巨魔巫医碎片"/utf8>>), item_num = 20,
		   pro = 100, price = 200, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item5, item_bid = 27700,
		   item_name = lang:get(<<"光之苏尔碎片"/utf8>>), item_num = 20,
		   pro = 100, price = 200, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1}];
get_rand2({item4, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item4, item_bid = 37001,
		   item_name = lang:get(<<"寻宝券"/utf8>>), item_num = 10,
		   pro = 100, price = 500, pay_type = gold, item_type = 3,
		   label = 6, discount = 300, limit_count = 1, flag = 1}];
get_rand2({item3, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item3, item_bid = 10103,
		   item_name = lang:get(<<"竞技挑战券"/utf8>>), item_num = 1,
		   pro = 100, price = 20, pay_type = gold, item_type = 3,
		   label = 7, discount = 14, limit_count = 1, flag = 1}];
get_rand2({item2, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 30},
		   type = item2, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>), item_num = 20000,
		   pro = 30, price = 20, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {30, 50},
		   type = item2, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>), item_num = 50000,
		   pro = 80, price = 50, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {50, 80},
		   type = item2, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>),
		   item_num = 100000, pro = 100, price = 100,
		   pay_type = gold, item_type = 3, label = 0, discount = 0,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {80, 120},
		   type = item2, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>),
		   item_num = 200000, pro = 100, price = 200,
		   pay_type = gold, item_type = 3, label = 0, discount = 0,
		   limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {120, 999},
		   type = item2, item_bid = 22,
		   item_name = lang:get(<<"英雄经验"/utf8>>),
		   item_num = 300000, pro = 100, price = 300,
		   pay_type = gold, item_type = 3, label = 0, discount = 0,
		   limit_count = 1, flag = 1}];
get_rand2({item1, 4}) ->
    [#exchange_ref{type_type = 4, lev = {1, 999},
		   type = item1, item_bid = 10001,
		   item_name = lang:get(<<"进阶石"/utf8>>), item_num = 1000,
		   pro = 300, price = 1000, pay_type = gold, item_type = 3,
		   label = 5, discount = 500, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item1, item_bid = 10001,
		   item_name = lang:get(<<"进阶石"/utf8>>), item_num = 300,
		   pro = 400, price = 300, pay_type = gold, item_type = 3,
		   label = 7, discount = 210, limit_count = 1, flag = 1},
     #exchange_ref{type_type = 4, lev = {1, 999},
		   type = item1, item_bid = 10001,
		   item_name = lang:get(<<"进阶石"/utf8>>), item_num = 100,
		   pro = 300, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1, flag = 1}];
get_rand2(_) -> [].

get_itemname(32) -> [lang:get(<<"烈阳晶石"/utf8>>)];
get_itemname(26909) ->
    [lang:get(<<"Mảnh Tobirama Senju"/utf8>>)];
get_itemname(26908) ->
    [lang:get(<<"Minato Namikaze"/utf8>>)];
get_itemname(25910) ->
    [lang:get(<<"Madara Uchiha"/utf8>>)];
get_itemname(25908) ->
    [lang:get(<<"Mảnh Obito: Mặt nạ"/utf8>>)];
get_itemname(25906) ->
    [lang:get(<<"Mảnh Hiruzen Sarutobi"/utf8>>)];
get_itemname(24910) ->
    [lang:get(<<"Mảnh Sakura Haruno"/utf8>>)];
get_itemname(24909) ->
    [lang:get(<<"Mảnh Hashirama Senju"/utf8>>)];
get_itemname(24903) ->
    [lang:get(<<"Mảnh Zabuza Momochi"/utf8>>)];
get_itemname(24901) -> [lang:get(<<"冰雪女王碎片"/utf8>>)];
get_itemname(28907) -> [lang:get(<<"海拉碎片"/utf8>>)];
get_itemname(28906) -> [lang:get(<<"潘多拉碎片"/utf8>>)];
get_itemname(28902) -> [lang:get(<<"亚巴顿碎片"/utf8>>)];
get_itemname(28901) -> [lang:get(<<"哈迪斯碎片"/utf8>>)];
get_itemname(27907) -> [lang:get(<<"拉斐尔碎片"/utf8>>)];
get_itemname(27906) -> [lang:get(<<"神灵大祭司碎片"/utf8>>)];
get_itemname(27903) -> [lang:get(<<"雷神碎片"/utf8>>)];
get_itemname(10006) -> [lang:get(<<"天赋秘典"/utf8>>)];
get_itemname(10090) -> [lang:get(<<"天启星纹石"/utf8>>)];
get_itemname(10091) -> [lang:get(<<"Kay"/utf8>>)];
get_itemname(37005) -> [lang:get(<<"置换精华"/utf8>>)];
get_itemname(29) -> [lang:get(<<"皮肤碎片"/utf8>>)];
get_itemname(10603) -> [lang:get(<<"圣灵蛋"/utf8>>)];
get_itemname(10703) -> [lang:get(<<"奥术法杖"/utf8>>)];
get_itemname(10702) -> [lang:get(<<"星辰锤"/utf8>>)];
get_itemname(10701) -> [lang:get(<<"小木槌"/utf8>>)];
get_itemname(100283) -> [lang:get(<<"车票"/utf8>>)];
get_itemname(100282) -> [lang:get(<<"蓝色机票"/utf8>>)];
get_itemname(100281) -> [lang:get(<<"黄色机票"/utf8>>)];
get_itemname(100245) -> [lang:get(<<"精密的探测仪"/utf8>>)];
get_itemname(100244) -> [lang:get(<<"智能相机"/utf8>>)];
get_itemname(100243) -> [lang:get(<<"贵重的钢笔"/utf8>>)];
get_itemname(100242) -> [lang:get(<<"水晶瓶"/utf8>>)];
get_itemname(100241) -> [lang:get(<<"宝箱"/utf8>>)];
get_itemname(100205) -> [lang:get(<<"手持式探测器"/utf8>>)];
get_itemname(100204) -> [lang:get(<<"傻瓜机"/utf8>>)];
get_itemname(100203) -> [lang:get(<<"毛笔"/utf8>>)];
get_itemname(100202) -> [lang:get(<<"玻璃瓶"/utf8>>)];
get_itemname(100201) -> [lang:get(<<"小礼盒"/utf8>>)];
get_itemname(200509) -> [lang:get(<<"幽冥雕像"/utf8>>)];
get_itemname(200501) -> [lang:get(<<"幽森盏灯"/utf8>>)];
get_itemname(200508) -> [lang:get(<<"黑石花柱"/utf8>>)];
get_itemname(200512) -> [lang:get(<<"幽森夜幕地毯"/utf8>>)];
get_itemname(200514) -> [lang:get(<<"不灭者灯笼"/utf8>>)];
get_itemname(200552) -> [lang:get(<<"幽森囚笼墙壁"/utf8>>)];
get_itemname(200551) -> [lang:get(<<"幽森之下地板"/utf8>>)];
get_itemname(200513) -> [lang:get(<<"虚幻王座"/utf8>>)];
get_itemname(200510) -> [lang:get(<<"幽森石门"/utf8>>)];
get_itemname(200511) -> [lang:get(<<"沉睡者之棺"/utf8>>)];
get_itemname(200505) -> [lang:get(<<"邪魅南瓜"/utf8>>)];
get_itemname(200506) -> [lang:get(<<"幽森喷泉"/utf8>>)];
get_itemname(200507) -> [lang:get(<<"南瓜长椅"/utf8>>)];
get_itemname(200502) -> [lang:get(<<"术士炼金炉"/utf8>>)];
get_itemname(200408) -> [lang:get(<<"浓情爱心圆床"/utf8>>)];
get_itemname(200402) -> [lang:get(<<"七夕心型窗"/utf8>>)];
get_itemname(200414) -> [lang:get(<<"织女"/utf8>>)];
get_itemname(200413) -> [lang:get(<<"牛郎"/utf8>>)];
get_itemname(200407) -> [lang:get(<<"两情相悦地毯"/utf8>>)];
get_itemname(200401) -> [lang:get(<<"七夕同心结"/utf8>>)];
get_itemname(200403) -> [lang:get(<<"七夕姻缘树"/utf8>>)];
get_itemname(200409) -> [lang:get(<<"七夕蜜意靠椅"/utf8>>)];
get_itemname(200452) -> [lang:get(<<"浓情七夕墙壁"/utf8>>)];
get_itemname(200451) -> [lang:get(<<"浓情七夕地板"/utf8>>)];
get_itemname(200411) -> [lang:get(<<"柔情蜜意圆桌"/utf8>>)];
get_itemname(200406) -> [lang:get(<<"浓情七夕屏风"/utf8>>)];
get_itemname(200405) -> [lang:get(<<"七夕情缘伞"/utf8>>)];
get_itemname(200404) -> [lang:get(<<"浓情依偎兔"/utf8>>)];
get_itemname(200314) -> [lang:get(<<"优雅星月小床"/utf8>>)];
get_itemname(200313) -> [lang:get(<<"神秘占星仪"/utf8>>)];
get_itemname(200312) -> [lang:get(<<"占星窗帘"/utf8>>)];
get_itemname(200307) -> [lang:get(<<"占星密室地毯"/utf8>>)];
get_itemname(200308) -> [lang:get(<<"占星挂毯"/utf8>>)];
get_itemname(200311) -> [lang:get(<<"星座魔镜"/utf8>>)];
get_itemname(200306) -> [lang:get(<<"星月挂饰"/utf8>>)];
get_itemname(200310) -> [lang:get(<<"星象水晶球"/utf8>>)];
get_itemname(200352) -> [lang:get(<<"占星密室墙壁"/utf8>>)];
get_itemname(200351) -> [lang:get(<<"占星密室地板"/utf8>>)];
get_itemname(200214) -> [lang:get(<<"贵族黄金马车"/utf8>>)];
get_itemname(200213) -> [lang:get(<<"皇室钢琴"/utf8>>)];
get_itemname(200207) -> [lang:get(<<"典雅落地窗"/utf8>>)];
get_itemname(200206) -> [lang:get(<<"贵族纹章地毯"/utf8>>)];
get_itemname(200211) -> [lang:get(<<"典雅玻璃柜"/utf8>>)];
get_itemname(200210) -> [lang:get(<<"皇室壁炉"/utf8>>)];
get_itemname(200252) -> [lang:get(<<"皇室贵族墙壁"/utf8>>)];
get_itemname(200251) -> [lang:get(<<"皇室贵族地板"/utf8>>)];
get_itemname(200212) -> [lang:get(<<"休憩的英短猫"/utf8>>)];
get_itemname(200110) -> [lang:get(<<"绒毛圆毯"/utf8>>)];
get_itemname(200109) -> [lang:get(<<"温馨小屋窗户"/utf8>>)];
get_itemname(200113) -> [lang:get(<<"舒适木床"/utf8>>)];
get_itemname(200114) -> [lang:get(<<"可爱布偶熊"/utf8>>)];
get_itemname(200112) -> [lang:get(<<"舒适双人沙发"/utf8>>)];
get_itemname(200111) -> [lang:get(<<"木制落地镜"/utf8>>)];
get_itemname(16108) -> [lang:get(<<"救急符石"/utf8>>)];
get_itemname(16107) -> [lang:get(<<"灵感符石"/utf8>>)];
get_itemname(16106) -> [lang:get(<<"庇护符石"/utf8>>)];
get_itemname(16105) -> [lang:get(<<"信仰符石"/utf8>>)];
get_itemname(16104) -> [lang:get(<<"制裁符石"/utf8>>)];
get_itemname(16103) -> [lang:get(<<"灵巧符石"/utf8>>)];
get_itemname(16102) -> [lang:get(<<"蓄力符石"/utf8>>)];
get_itemname(16101) -> [lang:get(<<"破裂符石"/utf8>>)];
get_itemname(16030) -> [lang:get(<<"迟缓符石"/utf8>>)];
get_itemname(16017) -> [lang:get(<<"荣光符石"/utf8>>)];
get_itemname(16016) -> [lang:get(<<"减速符石"/utf8>>)];
get_itemname(16014) -> [lang:get(<<"冲击符石"/utf8>>)];
get_itemname(16013) -> [lang:get(<<"驱散符石"/utf8>>)];
get_itemname(16012) -> [lang:get(<<"灭魂符石"/utf8>>)];
get_itemname(16011) -> [lang:get(<<"禁疗符石"/utf8>>)];
get_itemname(16010) -> [lang:get(<<"降临符石"/utf8>>)];
get_itemname(16009) -> [lang:get(<<"回音符石"/utf8>>)];
get_itemname(16046) -> [lang:get(<<"驱灵符石"/utf8>>)];
get_itemname(16045) -> [lang:get(<<"圣灵符石"/utf8>>)];
get_itemname(16040) -> [lang:get(<<"反伤符石"/utf8>>)];
get_itemname(16039) -> [lang:get(<<"清心符石"/utf8>>)];
get_itemname(16029) -> [lang:get(<<"生机符石"/utf8>>)];
get_itemname(16026) -> [lang:get(<<"抗暴符石"/utf8>>)];
get_itemname(16023) -> [lang:get(<<"再生符石"/utf8>>)];
get_itemname(16022) -> [lang:get(<<"抗控符石"/utf8>>)];
get_itemname(16020) -> [lang:get(<<"精准符石"/utf8>>)];
get_itemname(16019) -> [lang:get(<<"镇压符石"/utf8>>)];
get_itemname(16015) -> [lang:get(<<"挑衅符石"/utf8>>)];
get_itemname(16007) -> [lang:get(<<"战意符石"/utf8>>)];
get_itemname(16004) -> [lang:get(<<"暴追符石"/utf8>>)];
get_itemname(16003) -> [lang:get(<<"追击符石"/utf8>>)];
get_itemname(16047) -> [lang:get(<<"贪婪符石"/utf8>>)];
get_itemname(16044) -> [lang:get(<<"神赦符石"/utf8>>)];
get_itemname(16043) -> [lang:get(<<"波动符石"/utf8>>)];
get_itemname(16042) -> [lang:get(<<"专注符石"/utf8>>)];
get_itemname(16041) -> [lang:get(<<"英勇符石"/utf8>>)];
get_itemname(16038) -> [lang:get(<<"护盾符石"/utf8>>)];
get_itemname(16037) -> [lang:get(<<"神体符石"/utf8>>)];
get_itemname(16036) -> [lang:get(<<"吸取符石"/utf8>>)];
get_itemname(16034) -> [lang:get(<<"免伤符石"/utf8>>)];
get_itemname(16032) -> [lang:get(<<"命中符石"/utf8>>)];
get_itemname(16031) -> [lang:get(<<"穿透符石"/utf8>>)];
get_itemname(16028) -> [lang:get(<<"铁甲符石"/utf8>>)];
get_itemname(16027) -> [lang:get(<<"魔免符石"/utf8>>)];
get_itemname(16025) -> [lang:get(<<"复生符石"/utf8>>)];
get_itemname(16024) -> [lang:get(<<"不屈符石"/utf8>>)];
get_itemname(16021) -> [lang:get(<<"净化符石"/utf8>>)];
get_itemname(16018) -> [lang:get(<<"闪避符石"/utf8>>)];
get_itemname(16006) -> [lang:get(<<"狂暴符石"/utf8>>)];
get_itemname(16005) -> [lang:get(<<"暴躁符石"/utf8>>)];
get_itemname(16002) -> [lang:get(<<"神力符石"/utf8>>)];
get_itemname(16001) -> [lang:get(<<"魔力符石"/utf8>>)];
get_itemname(16035) -> [lang:get(<<"物连符石"/utf8>>)];
get_itemname(16033) -> [lang:get(<<"法连符石"/utf8>>)];
get_itemname(16008) -> [lang:get(<<"迅捷符石"/utf8>>)];
get_itemname(26906) -> [lang:get(<<"潘碎片"/utf8>>)];
get_itemname(25903) -> [lang:get(<<"菲尼克斯碎片"/utf8>>)];
get_itemname(26903) -> [lang:get(<<"魅魔女王碎片"/utf8>>)];
get_itemname(25900) -> [lang:get(<<"炽天使碎片"/utf8>>)];
get_itemname(26900) -> [lang:get(<<"奥丁碎片"/utf8>>)];
get_itemname(24907) -> [lang:get(<<"海宁芙碎片"/utf8>>)];
get_itemname(26902) -> [lang:get(<<"凯兰崔尔碎片"/utf8>>)];
get_itemname(28903) -> [lang:get(<<"黑暗之主碎片"/utf8>>)];
get_itemname(27901) -> [lang:get(<<"宙斯碎片"/utf8>>)];
get_itemname(25902) -> [lang:get(<<"剑豪卡赞碎片"/utf8>>)];
get_itemname(24908) -> [lang:get(<<"阿瑞斯碎片"/utf8>>)];
get_itemname(26907) -> [lang:get(<<"斯芬克斯碎片"/utf8>>)];
get_itemname(26901) -> [lang:get(<<"影刹碎片"/utf8>>)];
get_itemname(25907) -> [lang:get(<<"瓦尔基里碎片"/utf8>>)];
get_itemname(25901) -> [lang:get(<<"炎魔之王碎片"/utf8>>)];
get_itemname(24904) -> [lang:get(<<"波塞冬碎片"/utf8>>)];
get_itemname(24902) -> [lang:get(<<"冰霜巨龙碎片"/utf8>>)];
get_itemname(26601) -> [lang:get(<<"精灵射手碎片"/utf8>>)];
get_itemname(26600) -> [lang:get(<<"花精灵碎片"/utf8>>)];
get_itemname(26500) -> [lang:get(<<"树精灵碎片"/utf8>>)];
get_itemname(25601) -> [lang:get(<<"精灵希尔碎片"/utf8>>)];
get_itemname(25600) -> [lang:get(<<"死灵巫师碎片"/utf8>>)];
get_itemname(25500) -> [lang:get(<<"地狱犬碎片"/utf8>>)];
get_itemname(24601) -> [lang:get(<<"兽族步兵碎片"/utf8>>)];
get_itemname(24600) -> [lang:get(<<"巫女碎片"/utf8>>)];
get_itemname(24500) -> [lang:get(<<"莉莉丝碎片"/utf8>>)];
get_itemname(1) -> [lang:get(<<"金币"/utf8>>)];
get_itemname(10602) -> [lang:get(<<"玄魔蛋"/utf8>>)];
get_itemname(10601) -> [lang:get(<<"元气蛋"/utf8>>)];
get_itemname(10453) -> [lang:get(<<"太阳符文"/utf8>>)];
get_itemname(10452) -> [lang:get(<<"月亮符文"/utf8>>)];
get_itemname(10451) -> [lang:get(<<"星辰符文"/utf8>>)];
get_itemname(40411) -> [lang:get(<<"光辉戒指"/utf8>>)];
get_itemname(40410) ->
    [lang:get(<<"光辉戒指"/utf8>>), lang:get(<<"光辉战靴"/utf8>>)];
get_itemname(40409) ->
    [lang:get(<<"魔灵戒指"/utf8>>), lang:get(<<"魔灵战靴"/utf8>>)];
get_itemname(40408) ->
    [lang:get(<<"雷霆戒指"/utf8>>), lang:get(<<"雷霆战靴"/utf8>>)];
get_itemname(40407) ->
    [lang:get(<<"荣耀戒指"/utf8>>), lang:get(<<"荣耀战靴"/utf8>>)];
get_itemname(40406) -> [lang:get(<<"胜利戒指"/utf8>>)];
get_itemname(40405) -> [lang:get(<<"冒险戒指"/utf8>>)];
get_itemname(40404) -> [lang:get(<<"秘银戒指"/utf8>>)];
get_itemname(40403) -> [lang:get(<<"精钢戒指"/utf8>>)];
get_itemname(40311) -> [lang:get(<<"光辉头盔"/utf8>>)];
get_itemname(40310) -> [lang:get(<<"光辉头盔"/utf8>>)];
get_itemname(40309) -> [lang:get(<<"魔灵头盔"/utf8>>)];
get_itemname(40308) -> [lang:get(<<"雷霆头盔"/utf8>>)];
get_itemname(40307) -> [lang:get(<<"荣耀头盔"/utf8>>)];
get_itemname(40306) -> [lang:get(<<"胜利头盔"/utf8>>)];
get_itemname(40305) -> [lang:get(<<"冒险头盔"/utf8>>)];
get_itemname(40304) -> [lang:get(<<"秘银头盔"/utf8>>)];
get_itemname(40303) -> [lang:get(<<"精钢头盔"/utf8>>)];
get_itemname(40211) -> [lang:get(<<"光辉护甲"/utf8>>)];
get_itemname(40210) -> [lang:get(<<"光辉护甲"/utf8>>)];
get_itemname(40209) -> [lang:get(<<"魔灵护甲"/utf8>>)];
get_itemname(40208) -> [lang:get(<<"雷霆护甲"/utf8>>)];
get_itemname(40207) -> [lang:get(<<"荣耀护甲"/utf8>>)];
get_itemname(40206) -> [lang:get(<<"胜利护甲"/utf8>>)];
get_itemname(40205) -> [lang:get(<<"冒险护甲"/utf8>>)];
get_itemname(40204) -> [lang:get(<<"秘银护甲"/utf8>>)];
get_itemname(40203) -> [lang:get(<<"精钢护甲"/utf8>>)];
get_itemname(40111) ->
    [lang:get(<<"光明神长剑"/utf8>>), lang:get(<<"光辉巨剑"/utf8>>)];
get_itemname(40110) -> [lang:get(<<"光辉巨剑"/utf8>>)];
get_itemname(40109) -> [lang:get(<<"魔灵战刃"/utf8>>)];
get_itemname(40108) -> [lang:get(<<"雷霆战刃"/utf8>>)];
get_itemname(40107) -> [lang:get(<<"荣耀之刃"/utf8>>)];
get_itemname(40106) -> [lang:get(<<"胜利战刃"/utf8>>)];
get_itemname(40105) -> [lang:get(<<"冒险之刃"/utf8>>)];
get_itemname(40104) -> [lang:get(<<"秘银长剑"/utf8>>)];
get_itemname(40103) -> [lang:get(<<"精钢巨剑"/utf8>>)];
get_itemname(10401) -> [lang:get(<<"普通召唤书"/utf8>>)];
get_itemname(10403) -> [lang:get(<<"高级召唤书"/utf8>>)];
get_itemname(14002) -> [lang:get(<<"先知精华"/utf8>>)];
get_itemname(14001) -> [lang:get(<<"先知水晶"/utf8>>)];
get_itemname(29904) -> [lang:get(<<"4星随机英雄碎片"/utf8>>)];
get_itemname(26804) -> [lang:get(<<"德鲁伊碎片"/utf8>>)];
get_itemname(26803) -> [lang:get(<<"甘道夫碎片"/utf8>>)];
get_itemname(26802) -> [lang:get(<<"圣锤提尔碎片"/utf8>>)];
get_itemname(26801) -> [lang:get(<<"亡灵收割者碎片"/utf8>>)];
get_itemname(26800) -> [lang:get(<<"吟游诗人碎片"/utf8>>)];
get_itemname(25804) -> [lang:get(<<"翼女碎片"/utf8>>)];
get_itemname(25803) -> [lang:get(<<"雷诺蛮锤碎片"/utf8>>)];
get_itemname(25802) -> [lang:get(<<"阿伽门农碎片"/utf8>>)];
get_itemname(25801) -> [lang:get(<<"凯瑟琳碎片"/utf8>>)];
get_itemname(25800) -> [lang:get(<<"火枪艾克碎片"/utf8>>)];
get_itemname(24804) -> [lang:get(<<"娜迦侍女碎片"/utf8>>)];
get_itemname(24803) -> [lang:get(<<"冰晶女巫碎片"/utf8>>)];
get_itemname(24802) -> [lang:get(<<"水元素碎片"/utf8>>)];
get_itemname(24801) -> [lang:get(<<"竖琴海妖碎片"/utf8>>)];
get_itemname(24800) -> [lang:get(<<"亚瑟碎片"/utf8>>)];
get_itemname(27700) -> [lang:get(<<"光之苏尔碎片"/utf8>>)];
get_itemname(28700) -> [lang:get(<<"巨魔巫医碎片"/utf8>>)];
get_itemname(29903) -> [lang:get(<<"3星随机英雄碎片"/utf8>>)];
get_itemname(26704) -> [lang:get(<<"游侠射手碎片"/utf8>>)];
get_itemname(26703) -> [lang:get(<<"岩灵碎片"/utf8>>)];
get_itemname(26702) -> [lang:get(<<"雷霆狮鹫碎片"/utf8>>)];
get_itemname(26701) -> [lang:get(<<"风暴猎手碎片"/utf8>>)];
get_itemname(26700) -> [lang:get(<<"树人碎片"/utf8>>)];
get_itemname(25704) -> [lang:get(<<"奥杜尔·铜须碎片"/utf8>>)];
get_itemname(25703) -> [lang:get(<<"地狱火碎片"/utf8>>)];
get_itemname(25702) -> [lang:get(<<"吉尔伽美什碎片"/utf8>>)];
get_itemname(25701) -> [lang:get(<<"末日守卫碎片"/utf8>>)];
get_itemname(25700) -> [lang:get(<<"邪狼·加鲁鲁碎片"/utf8>>)];
get_itemname(24704) -> [lang:get(<<"月之骑士碎片"/utf8>>)];
get_itemname(24703) -> [lang:get(<<"咒法师碎片"/utf8>>)];
get_itemname(24702) -> [lang:get(<<"破坏者碎片"/utf8>>)];
get_itemname(24701) -> [lang:get(<<"美狄亚碎片"/utf8>>)];
get_itemname(24700) -> [lang:get(<<"魔法女学徒碎片"/utf8>>)];
get_itemname(37001) -> [lang:get(<<"寻宝券"/utf8>>)];
get_itemname(10103) -> [lang:get(<<"竞技挑战券"/utf8>>)];
get_itemname(22) -> [lang:get(<<"英雄经验"/utf8>>)];
get_itemname(10001) -> [lang:get(<<"进阶石"/utf8>>)];
get_itemname(_) -> [].

first_rand() ->
    [#exchange_ref{order = 6, item_bid = 10451,
		   item_name = lang:get(<<"星辰符文"/utf8>>), item_num = 1,
		   pro = 30, price = 200, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{order = 5, item_bid = 10103,
		   item_name = lang:get(<<"竞技挑战券"/utf8>>), item_num = 1,
		   pro = 50, price = 100000, pay_type = coin,
		   item_type = 3, label = 1, discount = 10000,
		   limit_count = 1},
     #exchange_ref{order = 4, item_bid = 10403,
		   item_name = lang:get(<<"高级召唤书"/utf8>>), item_num = 1,
		   pro = 70, price = 250, pay_type = gold, item_type = 3,
		   label = 6, discount = 150, limit_count = 1},
     #exchange_ref{order = 3, item_bid = 10001,
		   item_name = lang:get(<<"进阶石"/utf8>>), item_num = 100,
		   pro = 150, price = 100, pay_type = gold, item_type = 3,
		   label = 0, discount = 0, limit_count = 1},
     #exchange_ref{order = 2, item_bid = 10001,
		   item_name = lang:get(<<"进阶石"/utf8>>), item_num = 300,
		   pro = 100, price = 300, pay_type = gold, item_type = 3,
		   label = 7, discount = 210, limit_count = 1},
     #exchange_ref{order = 1, item_bid = 10001,
		   item_name = lang:get(<<"进阶石"/utf8>>), item_num = 1000,
		   pro = 50, price = 1000, pay_type = gold, item_type = 3,
		   label = 5, discount = 500, limit_count = 1}].


