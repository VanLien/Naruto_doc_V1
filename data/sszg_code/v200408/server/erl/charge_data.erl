-file("data/charge_data.erl", 1).

-file("src/mod/data/charge_data.erl", 1).

-module(charge_data).

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

-export([list/0, list2/0, get_award/1,
	 get_limit_charge/1, get/1, get_lose_gold/1, get_const/1,
	 list_triple_rebate/0, get_triple_rebate/1,
	 get_limit_triple/1, first_gift_list/0,
	 first_gift_award/1, first_gift_list_id/0,
	 get_first_gift_gold/1, day_first_gift_list/0,
	 day_first_gift_award/1, get_need_exp/1,
	 gte_first_gift_fid/1, day_first_gift_list2/0,
	 day_first_gift_award2/1, get_need_exp2/1,
	 gte_first_gift_fid2/1, day_first_gift_list4/0,
	 day_first_gift_award4/1, get_need_exp4/1,
	 gte_first_gift_fid4/1, day_first_gift_list_new/0,
	 day_first_gift_award_new/1, get_need_exp_new/1,
	 gte_first_gift_fid_new/1, day_gift/1,
	 day_gift_open_id/1, day_gift_reward/1, get_vip_ext/1,
	 day_charge_reward/1]).

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

-file("src/mod/data/charge_data.erl", 44).

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

-file("src/mod/data/charge_data.erl", 45).

list() ->
    [3, 4, 5, 6, 7, 8, 20, 21, 31, 32, 33, 34, 101, 102,
     103, 104, 105, 106, 107, 108, 109, 110, 111, 201, 202,
     203, 204, 205, 206, 207, 208, 209, 211, 212, 213, 214,
     215, 216, 217, 218, 219, 220, 221, 301, 302, 303, 304,
     305, 306, 307, 308, 309, 310, 311, 313, 400, 401, 402,
     403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413,
     414, 415, 416, 417, 418, 419, 420, 421, 422, 501, 502,
     503, 601, 602, 603, 604, 605, 606, 607, 608, 609, 700,
     701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711,
     712, 713, 714, 715, 716, 717, 718, 719, 721, 722, 725,
     726, 727, 728, 729, 730, 731, 732, 733, 738, 739, 740,
     741, 742, 743, 744, 801, 802, 803, 804, 805, 806, 807,
     808, 901, 902, 903, 904, 907, 908, 909, 910, 911, 912,
     1001, 1002, 1003, 1004, 1101, 1102, 1103, 1104, 1105,
     1106, 1107, 1201, 1202, 1203, 1204, 1205, 1206, 1301,
     1302, 1303, 1304, 1305, 1306, 1401, 1402, 1403, 1404,
     1405, 1406, 1407, 1408, 1409, 1410, 1411, 1412, 1501,
     1502, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510,
     1511, 1512, 1513, 1514, 1515, 1521, 1531, 1532, 1533,
     1534, 1535, 1536, 1537, 1538, 1539, 1540, 1561, 1562,
     1563, 1571, 1572, 1573, 1581, 1582, 1583, 1591, 1592,
     1593, 1594, 1595, 1596, 1597, 1600, 1601, 1602, 1603,
     1604, 1605, 1606, 1607, 1701, 1702, 1705, 1706, 1801,
     1802, 1803, 1804, 1805, 1806, 1900, 1901, 1902, 1903,
     1904, 1905, 1906, 8101, 8102, 8103, 8104, 8105, 8106,
     8201, 8202, 8203, 8204, 8205, 8206, 8301, 8302, 8303,
     8304, 8305, 8306, 8401, 8402, 8403, 8404, 8405, 8406,
     8501, 8502, 8503, 8504, 8505, 8506, 8601, 8602, 8603,
     8604, 8605, 8606, 8701, 8702, 8703, 8704, 8705, 8706,
     8801, 8802, 8803, 8804, 8805, 8806, 8901, 8902, 8903,
     8904, 8905, 8906, 8907, 8908, 8909, 9001, 9002, 9003,
     9004, 9011, 9012, 9013, 9014, 9015, 9021, 9022, 9023,
     9024, 9025, 9026, 9027, 9028, 9029, 9040, 9041, 9042,
     9043, 9101, 9102, 9103, 9104, 9105, 9106, 9107, 9108,
     9201, 9202, 9203, 9204, 9205, 9206, 9207, 9208, 9301,
     9302, 9303, 9304, 9305, 9306, 9307, 9308, 9401, 9402,
     9403, 9404, 9405, 9406, 9407, 9408, 9900, 9901, 9902,
     9903, 9904, 9905, 9906, 9907, 10700, 10701, 10702,
     10703, 10704, 10705, 10706, 10707, 10708, 19001, 19002,
     19003, 19004, 20101, 20102, 20103, 20104, 20105, 20106,
     20107, 20108, 20109, 21101, 21102, 21103, 21104, 21105,
     21106, 21107, 21108, 21109, 22101, 22102, 22103, 22104,
     22105, 22106, 22107, 22108, 22109, 23101, 23102, 23103,
     23104, 23105, 23106, 23107, 23108, 23109, 24101, 24102,
     24103, 24104, 24105, 24106, 24107, 24108, 24109, 25101,
     25102, 25103, 25104, 25105, 25106, 25107, 25108, 25109,
     25201, 25202, 25203, 25204, 25205, 26101, 26102, 26103,
     26104, 26105, 26106, 26107, 26108, 26109, 27101, 27102,
     27103, 27104, 27105, 27106, 27107, 27108, 27109, 30001,
     30002, 30003, 30004, 30005, 30006, 30007, 30101, 30102,
     30103, 30104, 30105, 30106, 30107, 30108, 30109, 31101,
     31102, 31103, 31104, 31105, 31106, 31107, 31108, 31109,
     32101, 32102, 32103, 32104, 32105, 32106, 32107, 32108,
     32109, 33101, 33102, 33103, 33104, 33105, 33106, 33107,
     33108, 33109, 34101, 34102, 34103, 34104, 34105, 34106,
     34107, 34108, 34109, 35101, 35102, 35103, 35104, 35105,
     35106, 35107, 35108, 35109, 36101, 36102, 36103, 36104,
     36105, 36106, 36107, 36108, 36109, 37101, 37102, 37103,
     37104, 37105, 37106, 37107, 37108, 37109].

list2() -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].

get_award(1) -> [{10007, 100}, {10102, 200}, {1, 1000}];
get_award(2) -> [{44102, 1}, {10102, 300}, {1, 2000}];
get_award(3) ->
    [{10030, 5}, {10151, 1}, {11, 500}, {1, 3000}];
get_award(4) ->
    [{10420, 1}, {10102, 500}, {11, 800}, {1, 5000}];
get_award(5) ->
    [{10430, 5}, {10151, 2}, {11, 1000}, {1, 8000}];
get_award(6) ->
    [{10421, 1}, {10102, 800}, {11, 1500}, {1, 10000}];
get_award(7) ->
    [{10431, 5}, {10152, 1}, {11, 2000}, {1, 12000}];
get_award(8) ->
    [{30015, 1}, {10102, 1000}, {11, 2500}, {1, 15000}];
get_award(9) ->
    [{44107, 1}, {10152, 2}, {11, 3000}, {1, 18000}];
get_award(10) ->
    [{30019, 1}, {10102, 2000}, {11, 4000}, {1, 20000}];
get_award(_Info) ->
    logger:data_error("get_award_data_not_exist===>~w",
		      [_Info], charge_data, 60),
    undefined.

get_limit_charge(1) -> 20000;
get_limit_charge(2) -> 100000;
get_limit_charge(3) -> 200000;
get_limit_charge(4) -> 500000;
get_limit_charge(5) -> 1000000;
get_limit_charge(6) -> 1500000;
get_limit_charge(7) -> 2000000;
get_limit_charge(8) -> 3000000;
get_limit_charge(9) -> 5000000;
get_limit_charge(10) -> 10000000;
get_limit_charge(_Info) ->
    logger:data_error("get_limit_charge_data_not_exist===>~w",
		      [_Info], charge_data, 72),
    undefined.

get(3) ->
    #charge_data{id = 3, name = lang:get(<<"普通充值6"/utf8>>),
		 val = 10000, gold = 1000000, first_add = 0, add = 0,
		 vip_exp = 1000000, pic = 1, is_show = 1, type = 0,
		 items = [], is_iosverify = 1};
get(4) ->
    #charge_data{id = 4, name = lang:get(<<"普通充值30"/utf8>>),
		 val = 20000, gold = 2000000, first_add = 0, add = 0,
		 vip_exp = 2000000, pic = 2, is_show = 1, type = 0,
		 items = [], is_iosverify = 1};
get(5) ->
    #charge_data{id = 5, name = lang:get(<<"普通充值98"/utf8>>),
		 val = 50000, gold = 5000000, first_add = 0, add = 0,
		 vip_exp = 5000000, pic = 3, is_show = 1, type = 0,
		 items = [], is_iosverify = 1};
get(6) ->
    #charge_data{id = 6,
		 name = lang:get(<<"普通充值198"/utf8>>), val = 100000,
		 gold = 10000000, first_add = 0, add = 0,
		 vip_exp = 10000000, pic = 4, is_show = 1, type = 0,
		 items = [], is_iosverify = 1};
get(7) ->
    #charge_data{id = 7,
		 name = lang:get(<<"普通充值328"/utf8>>), val = 200000,
		 gold = 20000000, first_add = 0, add = 0,
		 vip_exp = 20000000, pic = 5, is_show = 1, type = 0,
		 items = [], is_iosverify = 1};
get(8) ->
    #charge_data{id = 8,
		 name = lang:get(<<"普通充值648"/utf8>>), val = 500000,
		 gold = 50000000, first_add = 0, add = 0,
		 vip_exp = 50000000, pic = 6, is_show = 1, type = 0,
		 items = [], is_iosverify = 1};
get(20) ->
    #charge_data{id = 20,
		 name = lang:get(<<"普通充值68"/utf8>>), val = 1000000,
		 gold = 100000000, first_add = 0, add = 0,
		 vip_exp = 100000000, pic = 3, is_show = 1, type = 0,
		 items = [], is_iosverify = 1};
get(21) ->
    #charge_data{id = 21,
		 name = lang:get(<<"普通充值128"/utf8>>), val = 2000000,
		 gold = 200000000, first_add = 0, add = 0,
		 vip_exp = 200000000, pic = 4, is_show = 1, type = 0,
		 items = [], is_iosverify = 1};
get(31) ->
    #charge_data{id = 31,
		 name = lang:get(<<"语言_cha_01_2"/utf8>>), val = 20000,
		 gold = 6000, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 2, is_show = 0, type = 0, items = [],
		 is_iosverify = 1};
get(32) ->
    #charge_data{id = 32,
		 name = lang:get(<<"语言_cha_01_2"/utf8>>), val = 50000,
		 gold = 15000, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 2, is_show = 0, type = 0, items = [],
		 is_iosverify = 1};
get(33) ->
    #charge_data{id = 33,
		 name = lang:get(<<"语言_cha_01_2"/utf8>>), val = 200000,
		 gold = 60000, first_add = 0, add = 0,
		 vip_exp = 20000000, pic = 2, is_show = 0, type = 0,
		 items = [], is_iosverify = 1};
get(34) ->
    #charge_data{id = 34,
		 name = lang:get(<<"语言_cha_01_2"/utf8>>), val = 500000,
		 gold = 150000, first_add = 0, add = 0,
		 vip_exp = 50000000, pic = 2, is_show = 0, type = 0,
		 items = [], is_iosverify = 1};
get(101) ->
    #charge_data{id = 101, name = lang:get(<<"成长基金"/utf8>>),
		 val = 200000, gold = 0, first_add = 0, add = 0,
		 vip_exp = 20000000, pic = 9, is_show = 0, type = 2,
		 items = [], is_iosverify = 0};
get(102) ->
    #charge_data{id = 102,
		 name = lang:get(<<"128基金"/utf8>>), val = 100000,
		 gold = 1280, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(103) ->
    #charge_data{id = 103,
		 name = lang:get(<<"328基金"/utf8>>), val = 250000,
		 gold = 3280, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(104) ->
    #charge_data{id = 104,
		 name = lang:get(<<"328开服皮肤礼包"/utf8>>), val = 1000000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(105) ->
    #charge_data{id = 105, name = lang:get(<<"超值首充"/utf8>>),
		 val = 20000, gold = 0, first_add = 0, add = 0,
		 vip_exp = 2000000, pic = 9, is_show = 0, type = 2,
		 items = [], is_iosverify = 0};
get(106) ->
    #charge_data{id = 106, name = lang:get(<<"豪华首充"/utf8>>),
		 val = 100000, gold = 0, first_add = 0, add = 0,
		 vip_exp = 10000000, pic = 9, is_show = 0, type = 2,
		 items = [], is_iosverify = 0};
get(107) ->
    #charge_data{id = 107, name = lang:get(<<"至尊首充"/utf8>>),
		 val = 200000, gold = 0, first_add = 0, add = 0,
		 vip_exp = 20000000, pic = 9, is_show = 0, type = 2,
		 items = [], is_iosverify = 0};
get(108) ->
    #charge_data{id = 108, name = lang:get(<<"每日首充"/utf8>>),
		 val = 20000, gold = 0, first_add = 0, add = 0,
		 vip_exp = 2000000, pic = 9, is_show = 0, type = 2,
		 items = [], is_iosverify = 0};
get(109) ->
    #charge_data{id = 109,
		 name = lang:get(<<"语言_cha_01_5"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(110) ->
    #charge_data{id = 110,
		 name = lang:get(<<"语言_cha_01_5"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(111) ->
    #charge_data{id = 111,
		 name = lang:get(<<"语言_cha_01_5"/utf8>>), val = 60000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 6000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(201) ->
    #charge_data{id = 201,
		 name = lang:get(<<"5星级养成"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(202) ->
    #charge_data{id = 202,
		 name = lang:get(<<"6星级养成"/utf8>>), val = 220000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 22000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(203) ->
    #charge_data{id = 203,
		 name = lang:get(<<"7星级养成"/utf8>>), val = 420000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 42000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(204) ->
    #charge_data{id = 204,
		 name = lang:get(<<"8星级养成"/utf8>>), val = 1000000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(205) ->
    #charge_data{id = 205,
		 name = lang:get(<<"9星级养成"/utf8>>), val = 1000000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(206) ->
    #charge_data{id = 206,
		 name = lang:get(<<"10星级养成"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(207) ->
    #charge_data{id = 207,
		 name = lang:get(<<"11星级养成"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(208) ->
    #charge_data{id = 208,
		 name = lang:get(<<"12星级养成"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(209) ->
    #charge_data{id = 209,
		 name = lang:get(<<"13星级养成"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(211) ->
    #charge_data{id = 211,
		 name = lang:get(<<"18等级礼包"/utf8>>), val = 299, gold = 0,
		 first_add = 0, add = 0, vip_exp = 29900, pic = 9,
		 is_show = 0, type = 2, items = [{3, 180}],
		 is_iosverify = 1};
get(212) ->
    #charge_data{id = 212,
		 name = lang:get(<<"48等级礼包"/utf8>>), val = 999, gold = 0,
		 first_add = 0, add = 0, vip_exp = 99900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(213) ->
    #charge_data{id = 213,
		 name = lang:get(<<"68等级礼包"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(214) ->
    #charge_data{id = 214,
		 name = lang:get(<<"78等级礼包"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(215) ->
    #charge_data{id = 215,
		 name = lang:get(<<"88等级礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(216) ->
    #charge_data{id = 216,
		 name = lang:get(<<"98等级礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(217) ->
    #charge_data{id = 217,
		 name = lang:get(<<"108等级礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(218) ->
    #charge_data{id = 218,
		 name = lang:get(<<"118等级礼包"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(219) ->
    #charge_data{id = 219,
		 name = lang:get(<<"128等级礼包"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(220) ->
    #charge_data{id = 220,
		 name = lang:get(<<"138等级礼包"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(221) ->
    #charge_data{id = 221,
		 name = lang:get(<<"150等级礼包"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(301) ->
    #charge_data{id = 301, name = lang:get(<<"1元礼包"/utf8>>),
		 val = 10000, gold = 0, first_add = 0, add = 0,
		 vip_exp = 1000000, pic = 9, is_show = 0, type = 2,
		 items = [], is_iosverify = 1};
get(302) ->
    #charge_data{id = 302,
		 name = lang:get(<<"6元V1礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(303) ->
    #charge_data{id = 303,
		 name = lang:get(<<"12元V2礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 1};
get(304) ->
    #charge_data{id = 304,
		 name = lang:get(<<"30六道招募卷礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(305) ->
    #charge_data{id = 305,
		 name = lang:get(<<"68快速修行礼包"/utf8>>), val = 220000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 22000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(306) ->
    #charge_data{id = 306,
		 name = lang:get(<<"3元礼包（备用"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [{3, 30}],
		 is_iosverify = 1};
get(307) ->
    #charge_data{id = 307,
		 name = lang:get(<<"试炼之地礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(308) ->
    #charge_data{id = 308,
		 name = lang:get(<<"68元每日礼包"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(309) ->
    #charge_data{id = 309,
		 name = lang:get(<<"128元每日礼包"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(310) ->
    #charge_data{id = 310,
		 name = lang:get(<<"30元通灵兽特权礼包"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(311) ->
    #charge_data{id = 311,
		 name = lang:get(<<"30元每日礼包"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(313) ->
    #charge_data{id = 313,
		 name = lang:get(<<"语言_cha_01_26"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(400) ->
    #charge_data{id = 400,
		 name = lang:get(<<"6每周常驻礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(401) ->
    #charge_data{id = 401,
		 name = lang:get(<<"30每周常驻礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(402) ->
    #charge_data{id = 402,
		 name = lang:get(<<"68每周常驻礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(403) ->
    #charge_data{id = 403,
		 name = lang:get(<<"128每周常驻礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(404) ->
    #charge_data{id = 404,
		 name = lang:get(<<"328每周常驻礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(405) ->
    #charge_data{id = 405,
		 name = lang:get(<<"448每周常驻礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(406) ->
    #charge_data{id = 406,
		 name = lang:get(<<"648每周常驻礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(407) ->
    #charge_data{id = 407,
		 name = lang:get(<<"648周通灵兽礼包"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(408) ->
    #charge_data{id = 408,
		 name = lang:get(<<"648周通灵兽礼包2"/utf8>>), val = 400000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 40000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(409) ->
    #charge_data{id = 409,
		 name = lang:get(<<"648周通灵兽礼包3"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(410) ->
    #charge_data{id = 410,
		 name = lang:get(<<"6月度常驻礼包"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(411) ->
    #charge_data{id = 411,
		 name = lang:get(<<"30月度常驻礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(412) ->
    #charge_data{id = 412,
		 name = lang:get(<<"68月度常驻礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(413) ->
    #charge_data{id = 413,
		 name = lang:get(<<"128月度常驻礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(414) ->
    #charge_data{id = 414,
		 name = lang:get(<<"328月度常驻礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(415) ->
    #charge_data{id = 415,
		 name = lang:get(<<"448月度常驻礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(416) ->
    #charge_data{id = 416,
		 name = lang:get(<<"648月度常驻礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(417) ->
    #charge_data{id = 417,
		 name = lang:get(<<"648月度常驻礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(418) ->
    #charge_data{id = 418,
		 name = lang:get(<<"648月度常驻礼包2"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(419) ->
    #charge_data{id = 419,
		 name = lang:get(<<"648月度常驻礼包3"/utf8>>), val = 350000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 35000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(420) ->
    #charge_data{id = 420,
		 name = lang:get(<<"648月度常驻礼包4"/utf8>>), val = 400000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 40000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(421) ->
    #charge_data{id = 421,
		 name = lang:get(<<"648月度常驻礼包4"/utf8>>), val = 450000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 45000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(422) ->
    #charge_data{id = 422,
		 name = lang:get(<<"648月度常驻礼包4"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(501) ->
    #charge_data{id = 501, name = lang:get(<<"低档红包"/utf8>>),
		 val = 50000, gold = 0, first_add = 0, add = 0,
		 vip_exp = 5000000, pic = 9, is_show = 0, type = 2,
		 items = [], is_iosverify = 0};
get(502) ->
    #charge_data{id = 502, name = lang:get(<<"中档红包"/utf8>>),
		 val = 150000, gold = 0, first_add = 0, add = 0,
		 vip_exp = 15000000, pic = 9, is_show = 0, type = 2,
		 items = [{3, 500}], is_iosverify = 1};
get(503) ->
    #charge_data{id = 503, name = lang:get(<<"高档红包"/utf8>>),
		 val = 300000, gold = 0, first_add = 0, add = 0,
		 vip_exp = 30000000, pic = 9, is_show = 0, type = 2,
		 items = [], is_iosverify = 0};
get(601) ->
    #charge_data{id = 601,
		 name = lang:get(<<"30元限时礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(602) ->
    #charge_data{id = 602,
		 name = lang:get(<<"68元限时礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(603) ->
    #charge_data{id = 603,
		 name = lang:get(<<"198元限时礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(604) ->
    #charge_data{id = 604,
		 name = lang:get(<<"328元限时礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(605) ->
    #charge_data{id = 605,
		 name = lang:get(<<"448元限时礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(606) ->
    #charge_data{id = 606,
		 name = lang:get(<<"648元限时礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(607) ->
    #charge_data{id = 607,
		 name = lang:get(<<"648元阴阳限时礼包"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(608) ->
    #charge_data{id = 608,
		 name = lang:get(<<"328元复生限时礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(609) ->
    #charge_data{id = 609,
		 name = lang:get(<<"198通灵兽抢购礼包"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(700) ->
    #charge_data{id = 700,
		 name = lang:get(<<"68元活动礼包"/utf8>>), val = 220000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 22000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(701) ->
    #charge_data{id = 701,
		 name = lang:get(<<"128元活动礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(702) ->
    #charge_data{id = 702,
		 name = lang:get(<<"328元活动礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(703) ->
    #charge_data{id = 703,
		 name = lang:get(<<"30元活动礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(704) ->
    #charge_data{id = 704,
		 name = lang:get(<<"198元活动礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(705) ->
    #charge_data{id = 705,
		 name = lang:get(<<"448元活动礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(706) ->
    #charge_data{id = 706,
		 name = lang:get(<<"648元活动礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(707) ->
    #charge_data{id = 707,
		 name = lang:get(<<"12元活动礼包"/utf8>>), val = 1000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(708) ->
    #charge_data{id = 708,
		 name = lang:get(<<"6元活动礼包"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(709) ->
    #charge_data{id = 709,
		 name = lang:get(<<"6节日活动礼包"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(710) ->
    #charge_data{id = 710,
		 name = lang:get(<<"18节日活动礼包"/utf8>>), val = 60000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 6000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(711) ->
    #charge_data{id = 711,
		 name = lang:get(<<"50节日活动礼包"/utf8>>), val = 799,
		 gold = 0, first_add = 0, add = 0, vip_exp = 79900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(712) ->
    #charge_data{id = 712,
		 name = lang:get(<<"328置换商城礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(713) ->
    #charge_data{id = 713,
		 name = lang:get(<<"648置换商城礼包"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(714) ->
    #charge_data{id = 714,
		 name = lang:get(<<"68周卡礼包"/utf8>>), val = 999, gold = 0,
		 first_add = 0, add = 0, vip_exp = 99900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(715) ->
    #charge_data{id = 715,
		 name = lang:get(<<"128节日活动礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(716) ->
    #charge_data{id = 716,
		 name = lang:get(<<"328节日活动礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(717) ->
    #charge_data{id = 717,
		 name = lang:get(<<"198节日活动礼包"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(718) ->
    #charge_data{id = 718,
		 name = lang:get(<<"98节日活动礼包"/utf8>>), val = 1499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 149900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(719) ->
    #charge_data{id = 719,
		 name = lang:get(<<"648节日活动礼包"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(721) ->
    #charge_data{id = 721,
		 name = lang:get(<<"128元饰品限购礼包"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(722) ->
    #charge_data{id = 722,
		 name = lang:get(<<"328元饰品限购礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(725) ->
    #charge_data{id = 725,
		 name = lang:get(<<"128元饰品超值礼包"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(726) ->
    #charge_data{id = 726,
		 name = lang:get(<<"198元饰品超值礼包"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(727) ->
    #charge_data{id = 727,
		 name = lang:get(<<"328元饰品超值礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(728) ->
    #charge_data{id = 728,
		 name = lang:get(<<"448元饰品超值礼包"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(729) ->
    #charge_data{id = 729,
		 name = lang:get(<<"神话礼包5"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(730) ->
    #charge_data{id = 730,
		 name = lang:get(<<"神话礼包4"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(731) ->
    #charge_data{id = 731,
		 name = lang:get(<<"神话礼包3"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(732) ->
    #charge_data{id = 732,
		 name = lang:get(<<"神话礼包2"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(733) ->
    #charge_data{id = 733,
		 name = lang:get(<<"神话礼包1"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(738) ->
    #charge_data{id = 738,
		 name = lang:get(<<"神话礼包5"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(739) ->
    #charge_data{id = 739,
		 name = lang:get(<<"神话之路2"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(740) ->
    #charge_data{id = 740,
		 name = lang:get(<<"神话之路3"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(741) ->
    #charge_data{id = 741,
		 name = lang:get(<<"神话之路4"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(742) ->
    #charge_data{id = 742,
		 name = lang:get(<<"神话之路5"/utf8>>), val = 400000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 40000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(743) ->
    #charge_data{id = 743,
		 name = lang:get(<<"神话之路6"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(744) ->
    #charge_data{id = 744,
		 name = lang:get(<<"神话之路6"/utf8>>), val = 600000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 60000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(801) ->
    #charge_data{id = 801,
		 name = lang:get(<<"3元限购礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(802) ->
    #charge_data{id = 802,
		 name = lang:get(<<"6元限购礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(803) ->
    #charge_data{id = 803,
		 name = lang:get(<<"18元限购礼包"/utf8>>), val = 60000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 6000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(804) ->
    #charge_data{id = 804,
		 name = lang:get(<<"50元限购礼包"/utf8>>), val = 160000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 16000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(805) ->
    #charge_data{id = 805,
		 name = lang:get(<<"68元限购礼包"/utf8>>), val = 220000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 22000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(806) ->
    #charge_data{id = 806,
		 name = lang:get(<<"98元限购礼包"/utf8>>), val = 1100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 110000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(807) ->
    #charge_data{id = 807,
		 name = lang:get(<<"198元限购礼包"/utf8>>), val = 600000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 60000000,
		 pic = 4, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(808) ->
    #charge_data{id = 808,
		 name = lang:get(<<"328元限购礼包"/utf8>>), val = 1000000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(901) ->
    #charge_data{id = 901,
		 name = lang:get(<<"198元进阶卡"/utf8>>), val = 600000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 60000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(902) ->
    #charge_data{id = 902,
		 name = lang:get(<<"328皮肤礼包"/utf8>>), val = 1000000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(903) ->
    #charge_data{id = 903,
		 name = lang:get(<<"198皮肤礼包"/utf8>>), val = 600000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 60000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(904) ->
    #charge_data{id = 904,
		 name = lang:get(<<"1元节日小额礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(907) ->
    #charge_data{id = 907,
		 name = lang:get(<<"6元节日小额礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(908) ->
    #charge_data{id = 908,
		 name = lang:get(<<"30元节日小额礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(909) ->
    #charge_data{id = 909,
		 name = lang:get(<<"98元超影之证进阶卡"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(910) ->
    #charge_data{id = 910,
		 name = lang:get(<<"198段位赛进阶卡"/utf8>>), val = 600000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 60000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(911) ->
    #charge_data{id = 911,
		 name = lang:get(<<"198火之意志进阶卡"/utf8>>), val = 420000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 42000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(912) ->
    #charge_data{id = 912,
		 name = lang:get(<<"68元黑金周卡"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1001) ->
    #charge_data{id = 1001,
		 name = lang:get(<<"30元极品饰品礼"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1002) ->
    #charge_data{id = 1002,
		 name = lang:get(<<"68元极品饰品礼"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1003) ->
    #charge_data{id = 1003,
		 name = lang:get(<<"128元极品饰品礼"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1004) ->
    #charge_data{id = 1004,
		 name = lang:get(<<"328元极品饰品礼"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1101) ->
    #charge_data{id = 1101,
		 name = lang:get(<<"6元回归礼包"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(1102) ->
    #charge_data{id = 1102,
		 name = lang:get(<<"30元回归礼包"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1103) ->
    #charge_data{id = 1103,
		 name = lang:get(<<"68元回归礼包"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1104) ->
    #charge_data{id = 1104,
		 name = lang:get(<<"128元回归礼包"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1105) ->
    #charge_data{id = 1105,
		 name = lang:get(<<"328元回归礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1106) ->
    #charge_data{id = 1106,
		 name = lang:get(<<"448元回归礼包"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1107) ->
    #charge_data{id = 1107,
		 name = lang:get(<<"648元回归礼包"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1201) ->
    #charge_data{id = 1201,
		 name = lang:get(<<"6元限时钜惠"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(1202) ->
    #charge_data{id = 1202,
		 name = lang:get(<<"30元限时钜惠"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1203) ->
    #charge_data{id = 1203,
		 name = lang:get(<<"68元限时钜惠"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1204) ->
    #charge_data{id = 1204,
		 name = lang:get(<<"128元限时钜惠"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1205) ->
    #charge_data{id = 1205,
		 name = lang:get(<<"328元限时钜惠"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1206) ->
    #charge_data{id = 1206,
		 name = lang:get(<<"648元限时钜惠"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1301) ->
    #charge_data{id = 1301,
		 name = lang:get(<<"六道招募卷合服礼包"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1302) ->
    #charge_data{id = 1302,
		 name = lang:get(<<"通灵契约合服礼包"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1303) ->
    #charge_data{id = 1303,
		 name = lang:get(<<"密卷洗脸石合服礼包"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1304) ->
    #charge_data{id = 1304,
		 name = lang:get(<<"饰品碎片合服礼包"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1305) ->
    #charge_data{id = 1305,
		 name = lang:get(<<"全系之魂合服礼包"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1306) ->
    #charge_data{id = 1306,
		 name = lang:get(<<"99V2礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 1};
get(1401) ->
    #charge_data{id = 1401,
		 name = lang:get(<<"语言_cha_01_61"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1402) ->
    #charge_data{id = 1402,
		 name = lang:get(<<"语言_cha_01_62"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1403) ->
    #charge_data{id = 1403,
		 name = lang:get(<<"语言_cha_01_63"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1404) ->
    #charge_data{id = 1404,
		 name = lang:get(<<"语言_cha_01_64"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1405) ->
    #charge_data{id = 1405,
		 name = lang:get(<<"语言_cha_01_65"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1406) ->
    #charge_data{id = 1406,
		 name = lang:get(<<"语言_cha_01_66"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1407) ->
    #charge_data{id = 1407,
		 name = lang:get(<<"语言_cha_01_67"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1408) ->
    #charge_data{id = 1408,
		 name = lang:get(<<"语言_cha_01_68"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1409) ->
    #charge_data{id = 1409,
		 name = lang:get(<<"语言_cha_01_69"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1410) ->
    #charge_data{id = 1410,
		 name = lang:get(<<"语言_cha_01_70"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1411) ->
    #charge_data{id = 1411,
		 name = lang:get(<<"语言_cha_01_71"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1412) ->
    #charge_data{id = 1412,
		 name = lang:get(<<"语言_cha_01_72"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1501) ->
    #charge_data{id = 1501,
		 name = lang:get(<<"128元饰品超值礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1502) ->
    #charge_data{id = 1502,
		 name = lang:get(<<"128元饰品限购礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1503) ->
    #charge_data{id = 1503,
		 name = lang:get(<<"328元饰品限购礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1504) ->
    #charge_data{id = 1504,
		 name = lang:get(<<"198元饰品超值礼包"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1505) ->
    #charge_data{id = 1505,
		 name = lang:get(<<"128元饰品限购礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1506) ->
    #charge_data{id = 1506,
		 name = lang:get(<<"328元饰品限购礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1507) ->
    #charge_data{id = 1507,
		 name = lang:get(<<"328元饰品超值礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1508) ->
    #charge_data{id = 1508,
		 name = lang:get(<<"128元饰品限购礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1509) ->
    #charge_data{id = 1509,
		 name = lang:get(<<"328元饰品限购礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1510) ->
    #charge_data{id = 1510,
		 name = lang:get(<<"448元饰品超值礼包"/utf8>>), val = 160000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 16000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1511) ->
    #charge_data{id = 1511,
		 name = lang:get(<<"128元饰品限购礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1512) ->
    #charge_data{id = 1512,
		 name = lang:get(<<"328元饰品限购礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1513) ->
    #charge_data{id = 1513,
		 name = lang:get(<<"448元饰品超值礼包"/utf8>>), val = 160000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 16000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1514) ->
    #charge_data{id = 1514,
		 name = lang:get(<<"128元饰品限购礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1515) ->
    #charge_data{id = 1515,
		 name = lang:get(<<"328元饰品限购礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1521) ->
    #charge_data{id = 1521,
		 name = lang:get(<<"198通灵兽抢购礼包"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1531) ->
    #charge_data{id = 1531,
		 name = lang:get(<<"328置换商城礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1532) ->
    #charge_data{id = 1532,
		 name = lang:get(<<"648置换商城礼包"/utf8>>), val = 230000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 23000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1533) ->
    #charge_data{id = 1533,
		 name = lang:get(<<"328元天启限时礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1534) ->
    #charge_data{id = 1534,
		 name = lang:get(<<"128通灵兽召唤礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1535) ->
    #charge_data{id = 1535,
		 name = lang:get(<<"328通灵兽召唤礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1536) ->
    #charge_data{id = 1536,
		 name = lang:get(<<"128元普通饰品礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1537) ->
    #charge_data{id = 1537,
		 name = lang:get(<<"328元普通饰品礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1538) ->
    #charge_data{id = 1538,
		 name = lang:get(<<"128元高级饰品礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1539) ->
    #charge_data{id = 1539,
		 name = lang:get(<<"328元高级饰品礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1540) ->
    #charge_data{id = 1540,
		 name = lang:get(<<"328元13星觉醒礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1561) ->
    #charge_data{id = 1561,
		 name = lang:get(<<"6元钜惠A"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(1562) ->
    #charge_data{id = 1562,
		 name = lang:get(<<"68元钜惠A"/utf8>>), val = 999, gold = 0,
		 first_add = 0, add = 0, vip_exp = 99900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(1563) ->
    #charge_data{id = 1563,
		 name = lang:get(<<"198元钜惠A"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1571) ->
    #charge_data{id = 1571,
		 name = lang:get(<<"6元钜惠B"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(1572) ->
    #charge_data{id = 1572,
		 name = lang:get(<<"68元钜惠B"/utf8>>), val = 999, gold = 0,
		 first_add = 0, add = 0, vip_exp = 99900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(1573) ->
    #charge_data{id = 1573,
		 name = lang:get(<<"198元钜惠B"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1581) ->
    #charge_data{id = 1581,
		 name = lang:get(<<"6元钜惠C"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(1582) ->
    #charge_data{id = 1582,
		 name = lang:get(<<"68元钜惠C"/utf8>>), val = 999, gold = 0,
		 first_add = 0, add = 0, vip_exp = 99900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(1583) ->
    #charge_data{id = 1583,
		 name = lang:get(<<"328元钜惠C"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1591) ->
    #charge_data{id = 1591,
		 name = lang:get(<<"30元钜惠饰品"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1592) ->
    #charge_data{id = 1592,
		 name = lang:get(<<"68元钜惠饰品"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1593) ->
    #charge_data{id = 1593,
		 name = lang:get(<<"198元钜惠饰品"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1594) ->
    #charge_data{id = 1594,
		 name = lang:get(<<"328元组织秘典礼A"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1595) ->
    #charge_data{id = 1595,
		 name = lang:get(<<"328元组织秘典礼B"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1596) ->
    #charge_data{id = 1596,
		 name = lang:get(<<"328元组织秘典礼C"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1597) ->
    #charge_data{id = 1597,
		 name = lang:get(<<"328元组织秘典礼D"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1600) ->
    #charge_data{id = 1600,
		 name = lang:get(<<"6元活动礼包"/utf8>>), val = 1000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1601) ->
    #charge_data{id = 1601,
		 name = lang:get(<<"6元活动礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1602) ->
    #charge_data{id = 1602,
		 name = lang:get(<<"30元活动礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1603) ->
    #charge_data{id = 1603,
		 name = lang:get(<<"68元活动礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1604) ->
    #charge_data{id = 1604,
		 name = lang:get(<<"198元活动礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1605) ->
    #charge_data{id = 1605,
		 name = lang:get(<<"128元活动礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1606) ->
    #charge_data{id = 1606,
		 name = lang:get(<<"328元活动礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1607) ->
    #charge_data{id = 1607,
		 name = lang:get(<<"648元活动礼包"/utf8>>), val = 2000000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 200000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1701) ->
    #charge_data{id = 1701,
		 name = lang:get(<<"30元月度特权"/utf8>>), val = 25000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2500000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1702) ->
    #charge_data{id = 1702,
		 name = lang:get(<<"68元季度特权"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1705) ->
    #charge_data{id = 1705,
		 name = lang:get(<<"语言_cha_01_87"/utf8>>), val = 1000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1706) ->
    #charge_data{id = 1706,
		 name = lang:get(<<"一元礼包"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(1801) ->
    #charge_data{id = 1801,
		 name = lang:get(<<"6元萌新提升礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1802) ->
    #charge_data{id = 1802,
		 name = lang:get(<<"30元战力直升礼包"/utf8>>), val = 30000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 3000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1803) ->
    #charge_data{id = 1803,
		 name = lang:get(<<"68元忍界召唤礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1804) ->
    #charge_data{id = 1804,
		 name = lang:get(<<"128元超值召唤礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1805) ->
    #charge_data{id = 1805,
		 name = lang:get(<<"328元强力忍者礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1806) ->
    #charge_data{id = 1806,
		 name = lang:get(<<"648元实力碾压礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1900) ->
    #charge_data{id = 1900,
		 name = lang:get(<<"6元活动礼包"/utf8>>), val = 1000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1901) ->
    #charge_data{id = 1901,
		 name = lang:get(<<"6元活动礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1902) ->
    #charge_data{id = 1902,
		 name = lang:get(<<"30元活动礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1903) ->
    #charge_data{id = 1903,
		 name = lang:get(<<"68元活动礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1904) ->
    #charge_data{id = 1904,
		 name = lang:get(<<"198元活动礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1905) ->
    #charge_data{id = 1905,
		 name = lang:get(<<"128元活动礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(1906) ->
    #charge_data{id = 1906,
		 name = lang:get(<<"328元活动礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8101) ->
    #charge_data{id = 8101,
		 name = lang:get(<<"触发礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8102) ->
    #charge_data{id = 8102,
		 name = lang:get(<<"触发礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8103) ->
    #charge_data{id = 8103,
		 name = lang:get(<<"触发礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8104) ->
    #charge_data{id = 8104,
		 name = lang:get(<<"触发礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8105) ->
    #charge_data{id = 8105,
		 name = lang:get(<<"触发礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8106) ->
    #charge_data{id = 8106,
		 name = lang:get(<<"触发礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8201) ->
    #charge_data{id = 8201,
		 name = lang:get(<<"密卷礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8202) ->
    #charge_data{id = 8202,
		 name = lang:get(<<"密卷礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8203) ->
    #charge_data{id = 8203,
		 name = lang:get(<<"密卷礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8204) ->
    #charge_data{id = 8204,
		 name = lang:get(<<"密卷礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8205) ->
    #charge_data{id = 8205,
		 name = lang:get(<<"密卷礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8206) ->
    #charge_data{id = 8206,
		 name = lang:get(<<"密卷礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8301) ->
    #charge_data{id = 8301,
		 name = lang:get(<<"等级礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8302) ->
    #charge_data{id = 8302,
		 name = lang:get(<<"等级礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8303) ->
    #charge_data{id = 8303,
		 name = lang:get(<<"等级礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8304) ->
    #charge_data{id = 8304,
		 name = lang:get(<<"等级礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8305) ->
    #charge_data{id = 8305,
		 name = lang:get(<<"等级礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8306) ->
    #charge_data{id = 8306,
		 name = lang:get(<<"等级礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8401) ->
    #charge_data{id = 8401,
		 name = lang:get(<<"星级礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8402) ->
    #charge_data{id = 8402,
		 name = lang:get(<<"星级礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8403) ->
    #charge_data{id = 8403,
		 name = lang:get(<<"星级礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8404) ->
    #charge_data{id = 8404,
		 name = lang:get(<<"星级礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8405) ->
    #charge_data{id = 8405,
		 name = lang:get(<<"星级礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8406) ->
    #charge_data{id = 8406,
		 name = lang:get(<<"星级礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8501) ->
    #charge_data{id = 8501,
		 name = lang:get(<<"13星星级礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8502) ->
    #charge_data{id = 8502,
		 name = lang:get(<<"13星星级礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8503) ->
    #charge_data{id = 8503,
		 name = lang:get(<<"13星星级礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8504) ->
    #charge_data{id = 8504,
		 name = lang:get(<<"13星星级礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8505) ->
    #charge_data{id = 8505,
		 name = lang:get(<<"13星星级礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8506) ->
    #charge_data{id = 8506,
		 name = lang:get(<<"13星星级礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8601) ->
    #charge_data{id = 8601,
		 name = lang:get(<<"饰品触发礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8602) ->
    #charge_data{id = 8602,
		 name = lang:get(<<"饰品触发礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8603) ->
    #charge_data{id = 8603,
		 name = lang:get(<<"饰品触发礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8604) ->
    #charge_data{id = 8604,
		 name = lang:get(<<"饰品触发礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8605) ->
    #charge_data{id = 8605,
		 name = lang:get(<<"饰品触发礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8606) ->
    #charge_data{id = 8606,
		 name = lang:get(<<"饰品触发礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8701) ->
    #charge_data{id = 8701,
		 name = lang:get(<<"试炼之地礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8702) ->
    #charge_data{id = 8702,
		 name = lang:get(<<"试炼之地礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8703) ->
    #charge_data{id = 8703,
		 name = lang:get(<<"试炼之地礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8704) ->
    #charge_data{id = 8704,
		 name = lang:get(<<"试炼之地礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8705) ->
    #charge_data{id = 8705,
		 name = lang:get(<<"试炼之地礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8706) ->
    #charge_data{id = 8706,
		 name = lang:get(<<"试炼之地礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8801) ->
    #charge_data{id = 8801,
		 name = lang:get(<<"忍界奇袭礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8802) ->
    #charge_data{id = 8802,
		 name = lang:get(<<"忍界奇袭礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8803) ->
    #charge_data{id = 8803,
		 name = lang:get(<<"忍界奇袭礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8804) ->
    #charge_data{id = 8804,
		 name = lang:get(<<"忍界奇袭礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8805) ->
    #charge_data{id = 8805,
		 name = lang:get(<<"忍界奇袭礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8806) ->
    #charge_data{id = 8806,
		 name = lang:get(<<"忍界奇袭礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8901) ->
    #charge_data{id = 8901,
		 name = lang:get(<<"转生定制30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8902) ->
    #charge_data{id = 8902,
		 name = lang:get(<<"转生定制68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8903) ->
    #charge_data{id = 8903,
		 name = lang:get(<<"转生定制128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8904) ->
    #charge_data{id = 8904,
		 name = lang:get(<<"转生定制328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8905) ->
    #charge_data{id = 8905,
		 name = lang:get(<<"转生定制648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8906) ->
    #charge_data{id = 8906,
		 name = lang:get(<<"荣耀月卡激活30元"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8907) ->
    #charge_data{id = 8907,
		 name = lang:get(<<"至尊月卡激活98元"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8908) ->
    #charge_data{id = 8908,
		 name = lang:get(<<"一键激活双月卡128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(8909) ->
    #charge_data{id = 8909,
		 name = lang:get(<<"每日礼包一键充值"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9001) ->
    #charge_data{id = 9001,
		 name = lang:get(<<"限时商城68元礼包"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9002) ->
    #charge_data{id = 9002,
		 name = lang:get(<<"限时商城198元礼包"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9003) ->
    #charge_data{id = 9003,
		 name = lang:get(<<"限时商城448元礼包"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9004) ->
    #charge_data{id = 9004,
		 name = lang:get(<<"限时商城648元礼包"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9011) ->
    #charge_data{id = 9011,
		 name = lang:get(<<"限时商城6元礼包"/utf8>>), val = 99,
		 gold = 0, first_add = 0, add = 0, vip_exp = 9900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9012) ->
    #charge_data{id = 9012,
		 name = lang:get(<<"限时商城128元礼包"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9013) ->
    #charge_data{id = 9013,
		 name = lang:get(<<"限时商城328元礼包"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9014) ->
    #charge_data{id = 9014,
		 name = lang:get(<<"限时商城648元礼包"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9015) ->
    #charge_data{id = 9015,
		 name = lang:get(<<"新忍特惠648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9021) ->
    #charge_data{id = 9021,
		 name = lang:get(<<"限时礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9022) ->
    #charge_data{id = 9022,
		 name = lang:get(<<"今日特惠198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9023) ->
    #charge_data{id = 9023,
		 name = lang:get(<<"今日特惠198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9024) ->
    #charge_data{id = 9024,
		 name = lang:get(<<"今日特惠198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9025) ->
    #charge_data{id = 9025,
		 name = lang:get(<<"今日特惠198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9026) ->
    #charge_data{id = 9026,
		 name = lang:get(<<"今日特惠198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9027) ->
    #charge_data{id = 9027,
		 name = lang:get(<<"今日特惠198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9028) ->
    #charge_data{id = 9028,
		 name = lang:get(<<"今日特惠198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9029) ->
    #charge_data{id = 9029,
		 name = lang:get(<<"今日特惠198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9040) ->
    #charge_data{id = 9040,
		 name = lang:get(<<"新忍礼包448元"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9041) ->
    #charge_data{id = 9041,
		 name = lang:get(<<"新忍礼包448元"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9042) ->
    #charge_data{id = 9042,
		 name = lang:get(<<"新忍礼包448元"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9043) ->
    #charge_data{id = 9043,
		 name = lang:get(<<"新忍礼包448元"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9101) ->
    #charge_data{id = 9101,
		 name = lang:get(<<"活动升级经验礼包6元"/utf8>>), val = 99,
		 gold = 0, first_add = 0, add = 0, vip_exp = 9900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9102) ->
    #charge_data{id = 9102,
		 name = lang:get(<<"活动升级经验礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9103) ->
    #charge_data{id = 9103,
		 name = lang:get(<<"活动升级经验礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9104) ->
    #charge_data{id = 9104,
		 name = lang:get(<<"活动升级经验礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9105) ->
    #charge_data{id = 9105,
		 name = lang:get(<<"活动升级经验礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9106) ->
    #charge_data{id = 9106,
		 name = lang:get(<<"活动升级经验礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9107) ->
    #charge_data{id = 9107,
		 name = lang:get(<<"活动升级经验礼包448元"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9108) ->
    #charge_data{id = 9108,
		 name = lang:get(<<"活动升级经验礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9201) ->
    #charge_data{id = 9201,
		 name = lang:get(<<"活动饰品礼包6元"/utf8>>), val = 99,
		 gold = 0, first_add = 0, add = 0, vip_exp = 9900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9202) ->
    #charge_data{id = 9202,
		 name = lang:get(<<"活动饰品礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9203) ->
    #charge_data{id = 9203,
		 name = lang:get(<<"活动饰品礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9204) ->
    #charge_data{id = 9204,
		 name = lang:get(<<"活动饰品礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9205) ->
    #charge_data{id = 9205,
		 name = lang:get(<<"活动饰品礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9206) ->
    #charge_data{id = 9206,
		 name = lang:get(<<"活动饰品礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9207) ->
    #charge_data{id = 9207,
		 name = lang:get(<<"活动饰品礼包448元"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9208) ->
    #charge_data{id = 9208,
		 name = lang:get(<<"活动饰品礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9301) ->
    #charge_data{id = 9301,
		 name = lang:get(<<"活动密卷材料礼包6元"/utf8>>), val = 99,
		 gold = 0, first_add = 0, add = 0, vip_exp = 9900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9302) ->
    #charge_data{id = 9302,
		 name = lang:get(<<"活动密卷材料礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9303) ->
    #charge_data{id = 9303,
		 name = lang:get(<<"活动密卷材料礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9304) ->
    #charge_data{id = 9304,
		 name = lang:get(<<"活动密卷材料礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9305) ->
    #charge_data{id = 9305,
		 name = lang:get(<<"活动密卷材料礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9306) ->
    #charge_data{id = 9306,
		 name = lang:get(<<"活动密卷材料礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9307) ->
    #charge_data{id = 9307,
		 name = lang:get(<<"活动密卷材料礼包448元"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9308) ->
    #charge_data{id = 9308,
		 name = lang:get(<<"活动密卷材料礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9401) ->
    #charge_data{id = 9401,
		 name = lang:get(<<"金蛋礼包6元"/utf8>>), val = 99, gold = 0,
		 first_add = 0, add = 0, vip_exp = 9900, pic = 9,
		 is_show = 0, type = 2, items = [], is_iosverify = 0};
get(9402) ->
    #charge_data{id = 9402,
		 name = lang:get(<<"金蛋礼包30元"/utf8>>), val = 499,
		 gold = 0, first_add = 0, add = 0, vip_exp = 49900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9403) ->
    #charge_data{id = 9403,
		 name = lang:get(<<"金蛋礼包68元"/utf8>>), val = 999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 99900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9404) ->
    #charge_data{id = 9404,
		 name = lang:get(<<"金蛋礼包128元"/utf8>>), val = 1999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 199900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9405) ->
    #charge_data{id = 9405,
		 name = lang:get(<<"金蛋礼包198元"/utf8>>), val = 2999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 299900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9406) ->
    #charge_data{id = 9406,
		 name = lang:get(<<"金蛋礼包328元"/utf8>>), val = 4999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 499900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9407) ->
    #charge_data{id = 9407,
		 name = lang:get(<<"金蛋礼包448元"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9408) ->
    #charge_data{id = 9408,
		 name = lang:get(<<"金蛋礼包648元"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9900) ->
    #charge_data{id = 9900,
		 name = lang:get(<<"6元活动礼包"/utf8>>), val = 1000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9901) ->
    #charge_data{id = 9901,
		 name = lang:get(<<"6元活动礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9902) ->
    #charge_data{id = 9902,
		 name = lang:get(<<"30元活动礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9903) ->
    #charge_data{id = 9903,
		 name = lang:get(<<"68元活动礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9904) ->
    #charge_data{id = 9904,
		 name = lang:get(<<"198元活动礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9905) ->
    #charge_data{id = 9905,
		 name = lang:get(<<"128元活动礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9906) ->
    #charge_data{id = 9906,
		 name = lang:get(<<"328元活动礼包"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(9907) ->
    #charge_data{id = 9907,
		 name = lang:get(<<"328元活动礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(10700) ->
    #charge_data{id = 10700,
		 name = lang:get(<<"新忍商城68元活动礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(10701) ->
    #charge_data{id = 10701,
		 name = lang:get(<<"新忍商城128元活动礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(10702) ->
    #charge_data{id = 10702,
		 name = lang:get(<<"新忍商城328元活动礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(10703) ->
    #charge_data{id = 10703,
		 name = lang:get(<<"新忍商城30元活动礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(10704) ->
    #charge_data{id = 10704,
		 name = lang:get(<<"新忍商城198元活动礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(10705) ->
    #charge_data{id = 10705,
		 name = lang:get(<<"新忍商城448元活动礼包"/utf8>>), val = 6999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 699900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(10706) ->
    #charge_data{id = 10706,
		 name = lang:get(<<"新忍商城648元活动礼包"/utf8>>), val = 9999,
		 gold = 0, first_add = 0, add = 0, vip_exp = 999900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(10707) ->
    #charge_data{id = 10707,
		 name = lang:get(<<"新忍商城12元活动礼包"/utf8>>), val = 199,
		 gold = 0, first_add = 0, add = 0, vip_exp = 19900,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(10708) ->
    #charge_data{id = 10708,
		 name = lang:get(<<"新忍商城6元活动礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(19001) ->
    #charge_data{id = 19001,
		 name = lang:get(<<"新忍商城68元礼包"/utf8>>), val = 240000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 24000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(19002) ->
    #charge_data{id = 19002,
		 name = lang:get(<<"新忍商城198元礼包"/utf8>>), val = 700000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 70000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(19003) ->
    #charge_data{id = 19003,
		 name = lang:get(<<"新忍商城448元礼包"/utf8>>), val = 1000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 100000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(19004) ->
    #charge_data{id = 19004,
		 name = lang:get(<<"新忍商城648元礼包"/utf8>>), val = 2000000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 200000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(20101) ->
    #charge_data{id = 20101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(20102) ->
    #charge_data{id = 20102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(20103) ->
    #charge_data{id = 20103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(20104) ->
    #charge_data{id = 20104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(20105) ->
    #charge_data{id = 20105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(20106) ->
    #charge_data{id = 20106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(20107) ->
    #charge_data{id = 20107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(20108) ->
    #charge_data{id = 20108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(20109) ->
    #charge_data{id = 20109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(21101) ->
    #charge_data{id = 21101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(21102) ->
    #charge_data{id = 21102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(21103) ->
    #charge_data{id = 21103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(21104) ->
    #charge_data{id = 21104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(21105) ->
    #charge_data{id = 21105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(21106) ->
    #charge_data{id = 21106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(21107) ->
    #charge_data{id = 21107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(21108) ->
    #charge_data{id = 21108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(21109) ->
    #charge_data{id = 21109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(22101) ->
    #charge_data{id = 22101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(22102) ->
    #charge_data{id = 22102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(22103) ->
    #charge_data{id = 22103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(22104) ->
    #charge_data{id = 22104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(22105) ->
    #charge_data{id = 22105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(22106) ->
    #charge_data{id = 22106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(22107) ->
    #charge_data{id = 22107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(22108) ->
    #charge_data{id = 22108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(22109) ->
    #charge_data{id = 22109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(23101) ->
    #charge_data{id = 23101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(23102) ->
    #charge_data{id = 23102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(23103) ->
    #charge_data{id = 23103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(23104) ->
    #charge_data{id = 23104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(23105) ->
    #charge_data{id = 23105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(23106) ->
    #charge_data{id = 23106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(23107) ->
    #charge_data{id = 23107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(23108) ->
    #charge_data{id = 23108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(23109) ->
    #charge_data{id = 23109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(24101) ->
    #charge_data{id = 24101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(24102) ->
    #charge_data{id = 24102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(24103) ->
    #charge_data{id = 24103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(24104) ->
    #charge_data{id = 24104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(24105) ->
    #charge_data{id = 24105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(24106) ->
    #charge_data{id = 24106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(24107) ->
    #charge_data{id = 24107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(24108) ->
    #charge_data{id = 24108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(24109) ->
    #charge_data{id = 24109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25101) ->
    #charge_data{id = 25101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25102) ->
    #charge_data{id = 25102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25103) ->
    #charge_data{id = 25103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25104) ->
    #charge_data{id = 25104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25105) ->
    #charge_data{id = 25105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25106) ->
    #charge_data{id = 25106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25107) ->
    #charge_data{id = 25107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25108) ->
    #charge_data{id = 25108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25109) ->
    #charge_data{id = 25109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25201) ->
    #charge_data{id = 25201,
		 name = lang:get(<<"新服商城30元活动礼包"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25202) ->
    #charge_data{id = 25202,
		 name = lang:get(<<"新服商城68元活动礼包"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25203) ->
    #charge_data{id = 25203,
		 name = lang:get(<<"新服商城128元活动礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25204) ->
    #charge_data{id = 25204,
		 name = lang:get(<<"新服商城328元活动礼包"/utf8>>), val = 1200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 120000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(25205) ->
    #charge_data{id = 25205,
		 name = lang:get(<<"新服商城648元活动礼包"/utf8>>), val = 2400000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 240000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(26101) ->
    #charge_data{id = 26101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(26102) ->
    #charge_data{id = 26102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(26103) ->
    #charge_data{id = 26103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(26104) ->
    #charge_data{id = 26104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(26105) ->
    #charge_data{id = 26105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(26106) ->
    #charge_data{id = 26106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(26107) ->
    #charge_data{id = 26107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(26108) ->
    #charge_data{id = 26108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(26109) ->
    #charge_data{id = 26109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(27101) ->
    #charge_data{id = 27101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(27102) ->
    #charge_data{id = 27102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(27103) ->
    #charge_data{id = 27103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(27104) ->
    #charge_data{id = 27104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(27105) ->
    #charge_data{id = 27105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(27106) ->
    #charge_data{id = 27106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(27107) ->
    #charge_data{id = 27107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(27108) ->
    #charge_data{id = 27108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(27109) ->
    #charge_data{id = 27109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30001) ->
    #charge_data{id = 30001,
		 name = lang:get(<<"时光商城6元活动礼包"/utf8>>), val = 10000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 1000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30002) ->
    #charge_data{id = 30002,
		 name = lang:get(<<"时光商城30元活动礼包"/utf8>>), val = 20000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 2000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30003) ->
    #charge_data{id = 30003,
		 name = lang:get(<<"时光商城68元活动礼包"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30004) ->
    #charge_data{id = 30004,
		 name = lang:get(<<"时光商城128元活动礼包"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30005) ->
    #charge_data{id = 30005,
		 name = lang:get(<<"时光商城198元活动礼包"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30006) ->
    #charge_data{id = 30006,
		 name = lang:get(<<"时光商城328元活动礼包"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30007) ->
    #charge_data{id = 30007,
		 name = lang:get(<<"时光商城648元活动礼包"/utf8>>), val = 2400000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 240000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30101) ->
    #charge_data{id = 30101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30102) ->
    #charge_data{id = 30102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30103) ->
    #charge_data{id = 30103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30104) ->
    #charge_data{id = 30104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30105) ->
    #charge_data{id = 30105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30106) ->
    #charge_data{id = 30106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30107) ->
    #charge_data{id = 30107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30108) ->
    #charge_data{id = 30108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(30109) ->
    #charge_data{id = 30109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(31101) ->
    #charge_data{id = 31101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(31102) ->
    #charge_data{id = 31102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(31103) ->
    #charge_data{id = 31103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(31104) ->
    #charge_data{id = 31104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(31105) ->
    #charge_data{id = 31105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(31106) ->
    #charge_data{id = 31106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(31107) ->
    #charge_data{id = 31107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(31108) ->
    #charge_data{id = 31108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(31109) ->
    #charge_data{id = 31109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(32101) ->
    #charge_data{id = 32101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(32102) ->
    #charge_data{id = 32102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(32103) ->
    #charge_data{id = 32103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(32104) ->
    #charge_data{id = 32104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(32105) ->
    #charge_data{id = 32105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(32106) ->
    #charge_data{id = 32106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(32107) ->
    #charge_data{id = 32107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(32108) ->
    #charge_data{id = 32108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(32109) ->
    #charge_data{id = 32109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(33101) ->
    #charge_data{id = 33101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(33102) ->
    #charge_data{id = 33102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(33103) ->
    #charge_data{id = 33103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(33104) ->
    #charge_data{id = 33104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(33105) ->
    #charge_data{id = 33105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(33106) ->
    #charge_data{id = 33106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(33107) ->
    #charge_data{id = 33107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(33108) ->
    #charge_data{id = 33108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(33109) ->
    #charge_data{id = 33109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(34101) ->
    #charge_data{id = 34101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(34102) ->
    #charge_data{id = 34102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(34103) ->
    #charge_data{id = 34103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(34104) ->
    #charge_data{id = 34104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(34105) ->
    #charge_data{id = 34105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(34106) ->
    #charge_data{id = 34106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(34107) ->
    #charge_data{id = 34107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(34108) ->
    #charge_data{id = 34108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(34109) ->
    #charge_data{id = 34109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(35101) ->
    #charge_data{id = 35101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(35102) ->
    #charge_data{id = 35102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(35103) ->
    #charge_data{id = 35103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(35104) ->
    #charge_data{id = 35104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(35105) ->
    #charge_data{id = 35105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(35106) ->
    #charge_data{id = 35106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(35107) ->
    #charge_data{id = 35107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(35108) ->
    #charge_data{id = 35108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(35109) ->
    #charge_data{id = 35109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(36101) ->
    #charge_data{id = 36101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(36102) ->
    #charge_data{id = 36102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(36103) ->
    #charge_data{id = 36103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(36104) ->
    #charge_data{id = 36104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(36105) ->
    #charge_data{id = 36105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(36106) ->
    #charge_data{id = 36106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(36107) ->
    #charge_data{id = 36107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(36108) ->
    #charge_data{id = 36108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(36109) ->
    #charge_data{id = 36109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(37101) ->
    #charge_data{id = 37101,
		 name = lang:get(<<"星级5礼包-30"/utf8>>), val = 50000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 5000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(37102) ->
    #charge_data{id = 37102,
		 name = lang:get(<<"星级6礼包-68"/utf8>>), val = 80000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 8000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(37103) ->
    #charge_data{id = 37103,
		 name = lang:get(<<"星级7礼包-98"/utf8>>), val = 100000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 10000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(37104) ->
    #charge_data{id = 37104,
		 name = lang:get(<<"星级8礼包-328"/utf8>>), val = 120000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 12000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(37105) ->
    #charge_data{id = 37105,
		 name = lang:get(<<"星级9礼包-648"/utf8>>), val = 150000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 15000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(37106) ->
    #charge_data{id = 37106,
		 name = lang:get(<<"星级10礼包-328"/utf8>>), val = 200000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 20000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(37107) ->
    #charge_data{id = 37107,
		 name = lang:get(<<"星级11礼包-328"/utf8>>), val = 250000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 25000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(37108) ->
    #charge_data{id = 37108,
		 name = lang:get(<<"星级12礼包-648"/utf8>>), val = 300000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 30000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(37109) ->
    #charge_data{id = 37109,
		 name = lang:get(<<"星级13礼包-328"/utf8>>), val = 500000,
		 gold = 0, first_add = 0, add = 0, vip_exp = 50000000,
		 pic = 9, is_show = 0, type = 2, items = [],
		 is_iosverify = 0};
get(_) -> undefined.

get_lose_gold(3) -> 0;
get_lose_gold(4) -> 0;
get_lose_gold(5) -> 0;
get_lose_gold(6) -> 0;
get_lose_gold(7) -> 0;
get_lose_gold(8) -> 0;
get_lose_gold(20) -> 0;
get_lose_gold(21) -> 0;
get_lose_gold(31) -> 0;
get_lose_gold(32) -> 0;
get_lose_gold(33) -> 0;
get_lose_gold(34) -> 0;
get_lose_gold(101) -> 0;
get_lose_gold(102) -> 0;
get_lose_gold(103) -> 0;
get_lose_gold(104) -> 0;
get_lose_gold(105) -> 0;
get_lose_gold(106) -> 0;
get_lose_gold(107) -> 0;
get_lose_gold(108) -> 0;
get_lose_gold(109) -> 0;
get_lose_gold(110) -> 0;
get_lose_gold(111) -> 0;
get_lose_gold(201) -> 0;
get_lose_gold(202) -> 0;
get_lose_gold(203) -> 0;
get_lose_gold(204) -> 0;
get_lose_gold(205) -> 0;
get_lose_gold(206) -> 0;
get_lose_gold(207) -> 0;
get_lose_gold(208) -> 0;
get_lose_gold(209) -> 0;
get_lose_gold(211) -> 0;
get_lose_gold(212) -> 0;
get_lose_gold(213) -> 0;
get_lose_gold(214) -> 0;
get_lose_gold(215) -> 0;
get_lose_gold(216) -> 0;
get_lose_gold(217) -> 0;
get_lose_gold(218) -> 0;
get_lose_gold(219) -> 0;
get_lose_gold(220) -> 0;
get_lose_gold(221) -> 0;
get_lose_gold(301) -> 0;
get_lose_gold(302) -> 0;
get_lose_gold(303) -> 0;
get_lose_gold(304) -> 0;
get_lose_gold(305) -> 0;
get_lose_gold(306) -> 0;
get_lose_gold(307) -> 0;
get_lose_gold(308) -> 0;
get_lose_gold(309) -> 0;
get_lose_gold(310) -> 0;
get_lose_gold(311) -> 0;
get_lose_gold(313) -> 0;
get_lose_gold(400) -> 0;
get_lose_gold(401) -> 0;
get_lose_gold(402) -> 0;
get_lose_gold(403) -> 0;
get_lose_gold(404) -> 0;
get_lose_gold(405) -> 0;
get_lose_gold(406) -> 0;
get_lose_gold(407) -> 0;
get_lose_gold(408) -> 0;
get_lose_gold(409) -> 0;
get_lose_gold(410) -> 0;
get_lose_gold(411) -> 0;
get_lose_gold(412) -> 0;
get_lose_gold(413) -> 0;
get_lose_gold(414) -> 0;
get_lose_gold(415) -> 0;
get_lose_gold(416) -> 0;
get_lose_gold(417) -> 0;
get_lose_gold(418) -> 0;
get_lose_gold(419) -> 0;
get_lose_gold(420) -> 0;
get_lose_gold(421) -> 0;
get_lose_gold(422) -> 0;
get_lose_gold(501) -> 0;
get_lose_gold(502) -> 0;
get_lose_gold(503) -> 0;
get_lose_gold(601) -> 0;
get_lose_gold(602) -> 0;
get_lose_gold(603) -> 0;
get_lose_gold(604) -> 0;
get_lose_gold(605) -> 0;
get_lose_gold(606) -> 0;
get_lose_gold(607) -> 0;
get_lose_gold(608) -> 0;
get_lose_gold(609) -> 0;
get_lose_gold(700) -> 0;
get_lose_gold(701) -> 0;
get_lose_gold(702) -> 0;
get_lose_gold(703) -> 0;
get_lose_gold(704) -> 0;
get_lose_gold(705) -> 0;
get_lose_gold(706) -> 0;
get_lose_gold(707) -> 0;
get_lose_gold(708) -> 0;
get_lose_gold(709) -> 0;
get_lose_gold(710) -> 0;
get_lose_gold(711) -> 0;
get_lose_gold(712) -> 0;
get_lose_gold(713) -> 0;
get_lose_gold(714) -> 0;
get_lose_gold(715) -> 0;
get_lose_gold(716) -> 0;
get_lose_gold(717) -> 0;
get_lose_gold(718) -> 0;
get_lose_gold(719) -> 0;
get_lose_gold(721) -> 0;
get_lose_gold(722) -> 0;
get_lose_gold(725) -> 0;
get_lose_gold(726) -> 0;
get_lose_gold(727) -> 0;
get_lose_gold(728) -> 0;
get_lose_gold(729) -> 0;
get_lose_gold(730) -> 0;
get_lose_gold(731) -> 0;
get_lose_gold(732) -> 0;
get_lose_gold(733) -> 0;
get_lose_gold(738) -> 0;
get_lose_gold(739) -> 0;
get_lose_gold(740) -> 0;
get_lose_gold(741) -> 0;
get_lose_gold(742) -> 0;
get_lose_gold(743) -> 0;
get_lose_gold(744) -> 0;
get_lose_gold(801) -> 0;
get_lose_gold(802) -> 0;
get_lose_gold(803) -> 0;
get_lose_gold(804) -> 0;
get_lose_gold(805) -> 0;
get_lose_gold(806) -> 0;
get_lose_gold(807) -> 0;
get_lose_gold(808) -> 0;
get_lose_gold(901) -> 0;
get_lose_gold(902) -> 0;
get_lose_gold(903) -> 0;
get_lose_gold(904) -> 0;
get_lose_gold(907) -> 0;
get_lose_gold(908) -> 0;
get_lose_gold(909) -> 0;
get_lose_gold(910) -> 0;
get_lose_gold(911) -> 0;
get_lose_gold(912) -> 0;
get_lose_gold(1001) -> 0;
get_lose_gold(1002) -> 0;
get_lose_gold(1003) -> 0;
get_lose_gold(1004) -> 0;
get_lose_gold(1101) -> 0;
get_lose_gold(1102) -> 0;
get_lose_gold(1103) -> 0;
get_lose_gold(1104) -> 0;
get_lose_gold(1105) -> 0;
get_lose_gold(1106) -> 0;
get_lose_gold(1107) -> 0;
get_lose_gold(1201) -> 0;
get_lose_gold(1202) -> 0;
get_lose_gold(1203) -> 0;
get_lose_gold(1204) -> 0;
get_lose_gold(1205) -> 0;
get_lose_gold(1206) -> 0;
get_lose_gold(1301) -> 0;
get_lose_gold(1302) -> 0;
get_lose_gold(1303) -> 0;
get_lose_gold(1304) -> 0;
get_lose_gold(1305) -> 0;
get_lose_gold(1306) -> 0;
get_lose_gold(1401) -> 0;
get_lose_gold(1402) -> 0;
get_lose_gold(1403) -> 0;
get_lose_gold(1404) -> 0;
get_lose_gold(1405) -> 0;
get_lose_gold(1406) -> 0;
get_lose_gold(1407) -> 0;
get_lose_gold(1408) -> 0;
get_lose_gold(1409) -> 0;
get_lose_gold(1410) -> 0;
get_lose_gold(1411) -> 0;
get_lose_gold(1412) -> 0;
get_lose_gold(1501) -> 0;
get_lose_gold(1502) -> 0;
get_lose_gold(1503) -> 0;
get_lose_gold(1504) -> 0;
get_lose_gold(1505) -> 0;
get_lose_gold(1506) -> 0;
get_lose_gold(1507) -> 0;
get_lose_gold(1508) -> 0;
get_lose_gold(1509) -> 0;
get_lose_gold(1510) -> 0;
get_lose_gold(1511) -> 0;
get_lose_gold(1512) -> 0;
get_lose_gold(1513) -> 0;
get_lose_gold(1514) -> 0;
get_lose_gold(1515) -> 0;
get_lose_gold(1521) -> 0;
get_lose_gold(1531) -> 0;
get_lose_gold(1532) -> 0;
get_lose_gold(1533) -> 0;
get_lose_gold(1534) -> 0;
get_lose_gold(1535) -> 0;
get_lose_gold(1536) -> 0;
get_lose_gold(1537) -> 0;
get_lose_gold(1538) -> 0;
get_lose_gold(1539) -> 0;
get_lose_gold(1540) -> 0;
get_lose_gold(1561) -> 0;
get_lose_gold(1562) -> 0;
get_lose_gold(1563) -> 0;
get_lose_gold(1571) -> 0;
get_lose_gold(1572) -> 0;
get_lose_gold(1573) -> 0;
get_lose_gold(1581) -> 0;
get_lose_gold(1582) -> 0;
get_lose_gold(1583) -> 0;
get_lose_gold(1591) -> 0;
get_lose_gold(1592) -> 0;
get_lose_gold(1593) -> 0;
get_lose_gold(1594) -> 0;
get_lose_gold(1595) -> 0;
get_lose_gold(1596) -> 0;
get_lose_gold(1597) -> 0;
get_lose_gold(1600) -> 0;
get_lose_gold(1601) -> 0;
get_lose_gold(1602) -> 0;
get_lose_gold(1603) -> 0;
get_lose_gold(1604) -> 0;
get_lose_gold(1605) -> 0;
get_lose_gold(1606) -> 0;
get_lose_gold(1607) -> 0;
get_lose_gold(1701) -> 0;
get_lose_gold(1702) -> 0;
get_lose_gold(1705) -> 0;
get_lose_gold(1706) -> 0;
get_lose_gold(1801) -> 0;
get_lose_gold(1802) -> 0;
get_lose_gold(1803) -> 0;
get_lose_gold(1804) -> 0;
get_lose_gold(1805) -> 0;
get_lose_gold(1806) -> 0;
get_lose_gold(1900) -> 0;
get_lose_gold(1901) -> 0;
get_lose_gold(1902) -> 0;
get_lose_gold(1903) -> 0;
get_lose_gold(1904) -> 0;
get_lose_gold(1905) -> 0;
get_lose_gold(1906) -> 0;
get_lose_gold(8101) -> 0;
get_lose_gold(8102) -> 0;
get_lose_gold(8103) -> 0;
get_lose_gold(8104) -> 0;
get_lose_gold(8105) -> 0;
get_lose_gold(8106) -> 0;
get_lose_gold(8201) -> 0;
get_lose_gold(8202) -> 0;
get_lose_gold(8203) -> 0;
get_lose_gold(8204) -> 0;
get_lose_gold(8205) -> 0;
get_lose_gold(8206) -> 0;
get_lose_gold(8301) -> 0;
get_lose_gold(8302) -> 0;
get_lose_gold(8303) -> 0;
get_lose_gold(8304) -> 0;
get_lose_gold(8305) -> 0;
get_lose_gold(8306) -> 0;
get_lose_gold(8401) -> 0;
get_lose_gold(8402) -> 0;
get_lose_gold(8403) -> 0;
get_lose_gold(8404) -> 0;
get_lose_gold(8405) -> 0;
get_lose_gold(8406) -> 0;
get_lose_gold(8501) -> 0;
get_lose_gold(8502) -> 0;
get_lose_gold(8503) -> 0;
get_lose_gold(8504) -> 0;
get_lose_gold(8505) -> 0;
get_lose_gold(8506) -> 0;
get_lose_gold(8601) -> 0;
get_lose_gold(8602) -> 0;
get_lose_gold(8603) -> 0;
get_lose_gold(8604) -> 0;
get_lose_gold(8605) -> 0;
get_lose_gold(8606) -> 0;
get_lose_gold(8701) -> 0;
get_lose_gold(8702) -> 0;
get_lose_gold(8703) -> 0;
get_lose_gold(8704) -> 0;
get_lose_gold(8705) -> 0;
get_lose_gold(8706) -> 0;
get_lose_gold(8801) -> 0;
get_lose_gold(8802) -> 0;
get_lose_gold(8803) -> 0;
get_lose_gold(8804) -> 0;
get_lose_gold(8805) -> 0;
get_lose_gold(8806) -> 0;
get_lose_gold(8901) -> 0;
get_lose_gold(8902) -> 0;
get_lose_gold(8903) -> 0;
get_lose_gold(8904) -> 0;
get_lose_gold(8905) -> 0;
get_lose_gold(8906) -> 0;
get_lose_gold(8907) -> 0;
get_lose_gold(8908) -> 0;
get_lose_gold(8909) -> 0;
get_lose_gold(9001) -> 0;
get_lose_gold(9002) -> 0;
get_lose_gold(9003) -> 0;
get_lose_gold(9004) -> 0;
get_lose_gold(9011) -> 0;
get_lose_gold(9012) -> 0;
get_lose_gold(9013) -> 0;
get_lose_gold(9014) -> 0;
get_lose_gold(9015) -> 0;
get_lose_gold(9021) -> 0;
get_lose_gold(9022) -> 0;
get_lose_gold(9023) -> 0;
get_lose_gold(9024) -> 0;
get_lose_gold(9025) -> 0;
get_lose_gold(9026) -> 0;
get_lose_gold(9027) -> 0;
get_lose_gold(9028) -> 0;
get_lose_gold(9029) -> 0;
get_lose_gold(9040) -> 0;
get_lose_gold(9041) -> 0;
get_lose_gold(9042) -> 0;
get_lose_gold(9043) -> 0;
get_lose_gold(9101) -> 0;
get_lose_gold(9102) -> 0;
get_lose_gold(9103) -> 0;
get_lose_gold(9104) -> 0;
get_lose_gold(9105) -> 0;
get_lose_gold(9106) -> 0;
get_lose_gold(9107) -> 0;
get_lose_gold(9108) -> 0;
get_lose_gold(9201) -> 0;
get_lose_gold(9202) -> 0;
get_lose_gold(9203) -> 0;
get_lose_gold(9204) -> 0;
get_lose_gold(9205) -> 0;
get_lose_gold(9206) -> 0;
get_lose_gold(9207) -> 0;
get_lose_gold(9208) -> 0;
get_lose_gold(9301) -> 0;
get_lose_gold(9302) -> 0;
get_lose_gold(9303) -> 0;
get_lose_gold(9304) -> 0;
get_lose_gold(9305) -> 0;
get_lose_gold(9306) -> 0;
get_lose_gold(9307) -> 0;
get_lose_gold(9308) -> 0;
get_lose_gold(9401) -> 0;
get_lose_gold(9402) -> 0;
get_lose_gold(9403) -> 0;
get_lose_gold(9404) -> 0;
get_lose_gold(9405) -> 0;
get_lose_gold(9406) -> 0;
get_lose_gold(9407) -> 0;
get_lose_gold(9408) -> 0;
get_lose_gold(9900) -> 0;
get_lose_gold(9901) -> 0;
get_lose_gold(9902) -> 0;
get_lose_gold(9903) -> 0;
get_lose_gold(9904) -> 0;
get_lose_gold(9905) -> 0;
get_lose_gold(9906) -> 0;
get_lose_gold(9907) -> 0;
get_lose_gold(10700) -> 0;
get_lose_gold(10701) -> 0;
get_lose_gold(10702) -> 0;
get_lose_gold(10703) -> 0;
get_lose_gold(10704) -> 0;
get_lose_gold(10705) -> 0;
get_lose_gold(10706) -> 0;
get_lose_gold(10707) -> 0;
get_lose_gold(10708) -> 0;
get_lose_gold(19001) -> 0;
get_lose_gold(19002) -> 0;
get_lose_gold(19003) -> 0;
get_lose_gold(19004) -> 0;
get_lose_gold(20101) -> 0;
get_lose_gold(20102) -> 0;
get_lose_gold(20103) -> 0;
get_lose_gold(20104) -> 0;
get_lose_gold(20105) -> 0;
get_lose_gold(20106) -> 0;
get_lose_gold(20107) -> 0;
get_lose_gold(20108) -> 0;
get_lose_gold(20109) -> 0;
get_lose_gold(21101) -> 0;
get_lose_gold(21102) -> 0;
get_lose_gold(21103) -> 0;
get_lose_gold(21104) -> 0;
get_lose_gold(21105) -> 0;
get_lose_gold(21106) -> 0;
get_lose_gold(21107) -> 0;
get_lose_gold(21108) -> 0;
get_lose_gold(21109) -> 0;
get_lose_gold(22101) -> 0;
get_lose_gold(22102) -> 0;
get_lose_gold(22103) -> 0;
get_lose_gold(22104) -> 0;
get_lose_gold(22105) -> 0;
get_lose_gold(22106) -> 0;
get_lose_gold(22107) -> 0;
get_lose_gold(22108) -> 0;
get_lose_gold(22109) -> 0;
get_lose_gold(23101) -> 0;
get_lose_gold(23102) -> 0;
get_lose_gold(23103) -> 0;
get_lose_gold(23104) -> 0;
get_lose_gold(23105) -> 0;
get_lose_gold(23106) -> 0;
get_lose_gold(23107) -> 0;
get_lose_gold(23108) -> 0;
get_lose_gold(23109) -> 0;
get_lose_gold(24101) -> 0;
get_lose_gold(24102) -> 0;
get_lose_gold(24103) -> 0;
get_lose_gold(24104) -> 0;
get_lose_gold(24105) -> 0;
get_lose_gold(24106) -> 0;
get_lose_gold(24107) -> 0;
get_lose_gold(24108) -> 0;
get_lose_gold(24109) -> 0;
get_lose_gold(25101) -> 0;
get_lose_gold(25102) -> 0;
get_lose_gold(25103) -> 0;
get_lose_gold(25104) -> 0;
get_lose_gold(25105) -> 0;
get_lose_gold(25106) -> 0;
get_lose_gold(25107) -> 0;
get_lose_gold(25108) -> 0;
get_lose_gold(25109) -> 0;
get_lose_gold(25201) -> 0;
get_lose_gold(25202) -> 0;
get_lose_gold(25203) -> 0;
get_lose_gold(25204) -> 0;
get_lose_gold(25205) -> 0;
get_lose_gold(26101) -> 0;
get_lose_gold(26102) -> 0;
get_lose_gold(26103) -> 0;
get_lose_gold(26104) -> 0;
get_lose_gold(26105) -> 0;
get_lose_gold(26106) -> 0;
get_lose_gold(26107) -> 0;
get_lose_gold(26108) -> 0;
get_lose_gold(26109) -> 0;
get_lose_gold(27101) -> 0;
get_lose_gold(27102) -> 0;
get_lose_gold(27103) -> 0;
get_lose_gold(27104) -> 0;
get_lose_gold(27105) -> 0;
get_lose_gold(27106) -> 0;
get_lose_gold(27107) -> 0;
get_lose_gold(27108) -> 0;
get_lose_gold(27109) -> 0;
get_lose_gold(30001) -> 0;
get_lose_gold(30002) -> 0;
get_lose_gold(30003) -> 0;
get_lose_gold(30004) -> 0;
get_lose_gold(30005) -> 0;
get_lose_gold(30006) -> 0;
get_lose_gold(30007) -> 0;
get_lose_gold(30101) -> 0;
get_lose_gold(30102) -> 0;
get_lose_gold(30103) -> 0;
get_lose_gold(30104) -> 0;
get_lose_gold(30105) -> 0;
get_lose_gold(30106) -> 0;
get_lose_gold(30107) -> 0;
get_lose_gold(30108) -> 0;
get_lose_gold(30109) -> 0;
get_lose_gold(31101) -> 0;
get_lose_gold(31102) -> 0;
get_lose_gold(31103) -> 0;
get_lose_gold(31104) -> 0;
get_lose_gold(31105) -> 0;
get_lose_gold(31106) -> 0;
get_lose_gold(31107) -> 0;
get_lose_gold(31108) -> 0;
get_lose_gold(31109) -> 0;
get_lose_gold(32101) -> 0;
get_lose_gold(32102) -> 0;
get_lose_gold(32103) -> 0;
get_lose_gold(32104) -> 0;
get_lose_gold(32105) -> 0;
get_lose_gold(32106) -> 0;
get_lose_gold(32107) -> 0;
get_lose_gold(32108) -> 0;
get_lose_gold(32109) -> 0;
get_lose_gold(33101) -> 0;
get_lose_gold(33102) -> 0;
get_lose_gold(33103) -> 0;
get_lose_gold(33104) -> 0;
get_lose_gold(33105) -> 0;
get_lose_gold(33106) -> 0;
get_lose_gold(33107) -> 0;
get_lose_gold(33108) -> 0;
get_lose_gold(33109) -> 0;
get_lose_gold(34101) -> 0;
get_lose_gold(34102) -> 0;
get_lose_gold(34103) -> 0;
get_lose_gold(34104) -> 0;
get_lose_gold(34105) -> 0;
get_lose_gold(34106) -> 0;
get_lose_gold(34107) -> 0;
get_lose_gold(34108) -> 0;
get_lose_gold(34109) -> 0;
get_lose_gold(35101) -> 0;
get_lose_gold(35102) -> 0;
get_lose_gold(35103) -> 0;
get_lose_gold(35104) -> 0;
get_lose_gold(35105) -> 0;
get_lose_gold(35106) -> 0;
get_lose_gold(35107) -> 0;
get_lose_gold(35108) -> 0;
get_lose_gold(35109) -> 0;
get_lose_gold(36101) -> 0;
get_lose_gold(36102) -> 0;
get_lose_gold(36103) -> 0;
get_lose_gold(36104) -> 0;
get_lose_gold(36105) -> 0;
get_lose_gold(36106) -> 0;
get_lose_gold(36107) -> 0;
get_lose_gold(36108) -> 0;
get_lose_gold(36109) -> 0;
get_lose_gold(37101) -> 0;
get_lose_gold(37102) -> 0;
get_lose_gold(37103) -> 0;
get_lose_gold(37104) -> 0;
get_lose_gold(37105) -> 0;
get_lose_gold(37106) -> 0;
get_lose_gold(37107) -> 0;
get_lose_gold(37108) -> 0;
get_lose_gold(37109) -> 0;
get_lose_gold(_Info) ->
    logger:data_error("get_lose_gold_data_not_exist===>~w",
		      [_Info], charge_data, 3784),
    undefined.

get_const(month_card1_items) -> [{3, 10000000}];
get_const(month_card2_items) -> [{3, 5000000}];
get_const(first_charge) ->
    [{26059, 1, 1}, {44201, 1, 1}, {44401, 1, 1},
     {10801, 1}, {10102, 1, 100}, {2, 1, 100000}];
get_const(chapter_first_charge) -> 10204;
get_const(ally_id) -> 50015;
get_const(enemy_id) -> 50016;
get_const(triple_charge_rule) -> 0;
get_const(month_card1_text) -> 0;
get_const(month_card2_text) -> 0;
get_const(month_card1_bag_num) -> 40;
get_const(month_card2_bag_num) -> 80;
get_const(month_card1_return) -> [{3, 6000}];
get_const(month_card1_cont_day) -> 30;
get_const(month_card1_sun) -> 200000;
get_const(month_card2_return) -> [{3, 3600}];
get_const(month_card2_cont_day) -> 30;
get_const(month_card2_sun) -> 100000;
get_const(open_lv) -> 6;
get_const(day_gift_gift) -> [{37001, 1}];
get_const(day_charge_goal) -> 180;
get_const(first_charge_new) ->
    [{1, 25400}, {2, 26405}, {3, 24404}];
get_const(week_gift_charge_sum) -> 100;
get_const(first_charge_invade_id) -> 99938;
get_const(first_charge_defend_id) -> 99939;
get_const(charge_time_newchange) ->
    {{2020, 3, 12}, {10, 30, 0}};
get_const(first_charge_invade_new_id) -> 99918;
get_const(first_charge_defend_new_id) -> 99919;
get_const(first_charge_ver4_time) ->
    {{2020, 4, 2}, {9, 59, 0}};
get_const(_) -> undefined.

list_triple_rebate() -> [1, 2, 3, 4].

get_triple_rebate(1) ->
    #triple_rebate_data{id = 1, charge_sum = 1,
			reward_times = 2,
			mail_title = lang:get(<<"充值三倍返利"/utf8>>),
			mail_content =
			    lang:get(<<"首充福利！恭喜您获得<div fontsize=24 fontcolor=#289b14>"
				       "一</div>次充值三倍返利的机会！每次三倍返利机会可让你在下次充值时，额外获得充值钻石数"
				       "目2倍的红钻；例如充值<div fontsize=24 fontcolor=#289b14"
				       ">￥648</div>，可额外获得<div fontsize=24 fontcolor=#"
				       "289b14>6480*2=12960红钻</div>。合理利用返利机会可获海量钻石\n下"
				       "次充值<div fontsize=24 fontcolor=#289b14>3倍返利机会<"
				       "/div>：累计充值10000蓝钻\n<div fontsize=24 "
				       "fontcolor=#289b14 href='charge'> 点击前往充值</div>"
				       ""/utf8>>)};
get_triple_rebate(2) ->
    #triple_rebate_data{id = 2, charge_sum = 10000,
			reward_times = 2,
			mail_title = lang:get(<<"充值三倍返利"/utf8>>),
			mail_content =
			    lang:get(<<"恭喜您获得<div fontsize=24 fontcolor=#289b14>一</di"
				       "v>次充值三倍返利的机会！每次三倍返利机会可让你在下次充值时，额外获得充值蓝钻数目2倍的红"
				       "钻；例如充值<div fontsize=24 fontcolor=#289b14>￥648"
				       "</div>，可额外获得<div fontsize=24 fontcolor=#289b1"
				       "4>6480*2=12960红钻</div>。合理利用返利机会可获海量钻石\n下次充值<d"
				       "iv fontsize=24 fontcolor=#289b14>3倍返利机会</div>"
				       "：累计充值20000蓝钻\n<div fontsize=24 fontcolor=#289"
				       "b14 href='charge'> 点击前往充值</div>"/utf8>>)};
get_triple_rebate(3) ->
    #triple_rebate_data{id = 3, charge_sum = 20000,
			reward_times = 2,
			mail_title = lang:get(<<"充值三倍返利"/utf8>>),
			mail_content =
			    lang:get(<<"恭喜您获得<div fontsize=24 fontcolor=#289b14>一</di"
				       "v>次充值三倍返利的机会！每次三倍返利机会可让你在下次充值时，额外获得充值钻石数目2倍的红"
				       "钻；例如充值<div fontsize=24 fontcolor=#289b14>￥648"
				       "</div>，可额外获得<div fontsize=24 fontcolor=#289b1"
				       "4>6480*2=12960红钻</div>。合理利用返利机会可获海量钻石\n下次充值<d"
				       "iv fontsize=24 fontcolor=#289b14>3倍返利机会</div>"
				       "：累计充值50000蓝钻\n<div fontsize=24 fontcolor=#289"
				       "b14 href='charge'> 点击前往充值</div>"/utf8>>)};
get_triple_rebate(4) ->
    #triple_rebate_data{id = 4, charge_sum = 50000,
			reward_times = 2,
			mail_title = lang:get(<<"充值三倍返利"/utf8>>),
			mail_content =
			    lang:get(<<"恭喜您获得<div fontsize=24 fontcolor=#289b14>一</di"
				       "v>次充值三倍返利的机会！每次三倍返利机会可让你在下次充值时，额外获得充值钻石数目2倍的红"
				       "钻；例如充值<div fontsize=24 fontcolor=#289b14>￥648"
				       "</div>，可额外获得<div fontsize=24 fontcolor=#289b1"
				       "4>6480*2=12960红钻</div>。合理利用返利机会可获海量钻石\n<div "
				       "fontsize=24 fontcolor=#289b14 href='charge'> "
				       "点击前往充值</div>"/utf8>>)};
get_triple_rebate(_Info) ->
    logger:data_error("get_triple_rebate_data_not_exist===>~w",
		      [_Info], charge_data, 3850),
    undefined.

get_limit_triple(1) -> 1;
get_limit_triple(2) -> 10000;
get_limit_triple(3) -> 20000;
get_limit_triple(4) -> 50000;
get_limit_triple(_Info) ->
    logger:data_error("get_limit_triple_data_not_exist===>~w",
		      [_Info], charge_data, 3856),
    undefined.

first_gift_list() -> [{3, 88}, {2, 10}, {1, 6}].

first_gift_award(_) -> [].

first_gift_list_id() -> [5, 20, 4, 3].

get_first_gift_gold(3) -> 240;
get_first_gift_gold(4) -> 1200;
get_first_gift_gold(20) -> 2800;
get_first_gift_gold(5) -> 4000;
get_first_gift_gold(_Info) ->
    logger:data_error("get_first_gift_gold_data_not_exist===>~w",
		      [_Info], charge_data, 3869),
    undefined.

day_first_gift_list() -> [1, 2, 3, 4, 5, 6].

day_first_gift_award(1) -> [{24409, 1}, {10403, 1}];
day_first_gift_award(2) -> [{40108, 1}, {40208, 1}];
day_first_gift_award(3) -> [{40308, 1}, {40408, 1}];
day_first_gift_award(4) -> [{40111, 1}, {40211, 1}];
day_first_gift_award(5) -> [{40311, 1}, {14001, 1}];
day_first_gift_award(6) -> [{40411, 1}, {14001, 2}];
day_first_gift_award(_) -> [].

get_need_exp(1) -> 60;
get_need_exp(2) -> 60;
get_need_exp(3) -> 60;
get_need_exp(4) -> 1000;
get_need_exp(5) -> 1000;
get_need_exp(6) -> 1000;
get_need_exp(_Info) ->
    logger:data_error("get_need_exp_data_not_exist===>~w",
		      [_Info], charge_data, 3887),
    undefined.

gte_first_gift_fid(1) -> 1;
gte_first_gift_fid(2) -> 1;
gte_first_gift_fid(3) -> 1;
gte_first_gift_fid(4) -> 2;
gte_first_gift_fid(5) -> 2;
gte_first_gift_fid(6) -> 2;
gte_first_gift_fid(_Info) ->
    logger:data_error("gte_first_gift_fid_data_not_exist===>~w",
		      [_Info], charge_data, 3895),
    undefined.

day_first_gift_list2() -> [1, 2, 3, 4, 5, 6].

day_first_gift_award2(1) ->
    [{39039, 10}, {10001, 300000}];
day_first_gift_award2(2) ->
    [{40117, 1}, {40217, 1}, {40317, 1}, {40417, 1}];
day_first_gift_award2(3) ->
    [{59040, 5}, {90514, 1}, {10090, 10}, {10091, 10}];
day_first_gift_award2(4) -> [{59040, 5}, {10455, 1}];
day_first_gift_award2(5) ->
    [{40117, 1}, {40217, 1}, {40317, 1}, {40417, 1}];
day_first_gift_award2(6) ->
    [{59041, 1}, {90515, 1}, {10090, 10}, {10091, 10}];
day_first_gift_award2(_) -> [].

get_need_exp2(1) -> 10000;
get_need_exp2(2) -> 10000;
get_need_exp2(3) -> 10000;
get_need_exp2(4) -> 10000;
get_need_exp2(5) -> 10000;
get_need_exp2(6) -> 10000;
get_need_exp2(_Info) ->
    logger:data_error("get_need_exp2_data_not_exist===>~w",
		      [_Info], charge_data, 3913),
    undefined.

gte_first_gift_fid2(1) -> 1;
gte_first_gift_fid2(2) -> 1;
gte_first_gift_fid2(3) -> 1;
gte_first_gift_fid2(4) -> 2;
gte_first_gift_fid2(5) -> 2;
gte_first_gift_fid2(6) -> 2;
gte_first_gift_fid2(_Info) ->
    logger:data_error("gte_first_gift_fid2_data_not_exist===>~w",
		      [_Info], charge_data, 3921),
    undefined.

day_first_gift_list4() -> [1, 2, 3, 4, 5, 6].

day_first_gift_award4(1) ->
    [{39039, 10}, {10001, 300000}];
day_first_gift_award4(2) ->
    [{40117, 1}, {40217, 1}, {40317, 1}, {40417, 1}];
day_first_gift_award4(3) ->
    [{59040, 5}, {90514, 1}, {10090, 10}, {10091, 10}];
day_first_gift_award4(4) -> [{59040, 5}, {10455, 1}];
day_first_gift_award4(5) ->
    [{40117, 1}, {40217, 1}, {40317, 1}, {40417, 1}];
day_first_gift_award4(6) ->
    [{59041, 1}, {90515, 1}, {10090, 10}, {10091, 10}];
day_first_gift_award4(_) -> [].

get_need_exp4(1) -> 10000;
get_need_exp4(2) -> 10000;
get_need_exp4(3) -> 10000;
get_need_exp4(4) -> 10000;
get_need_exp4(5) -> 10000;
get_need_exp4(6) -> 10000;
get_need_exp4(_Info) ->
    logger:data_error("get_need_exp4_data_not_exist===>~w",
		      [_Info], charge_data, 3939),
    undefined.

gte_first_gift_fid4(1) -> 1;
gte_first_gift_fid4(2) -> 1;
gte_first_gift_fid4(3) -> 1;
gte_first_gift_fid4(4) -> 2;
gte_first_gift_fid4(5) -> 2;
gte_first_gift_fid4(6) -> 2;
gte_first_gift_fid4(_Info) ->
    logger:data_error("gte_first_gift_fid4_data_not_exist===>~w",
		      [_Info], charge_data, 3947),
    undefined.

day_first_gift_list_new() -> [1, 2, 3, 4, 5, 6].

day_first_gift_award_new(1) ->
    [{10403, 1}, {10001, 100}];
day_first_gift_award_new(2) -> [{40108, 1}, {40208, 1}];
day_first_gift_award_new(3) -> [{40308, 1}, {40408, 1}];
day_first_gift_award_new(4) -> [{40111, 1}, {40211, 1}];
day_first_gift_award_new(5) -> [{40311, 1}, {14001, 1}];
day_first_gift_award_new(6) -> [{40411, 1}, {14001, 2}];
day_first_gift_award_new(_) -> [].

get_need_exp_new(1) -> 20000;
get_need_exp_new(2) -> 20000;
get_need_exp_new(3) -> 20000;
get_need_exp_new(4) -> 100000;
get_need_exp_new(5) -> 100000;
get_need_exp_new(6) -> 100000;
get_need_exp_new(_Info) ->
    logger:data_error("get_need_exp_new_data_not_exist===>~w",
		      [_Info], charge_data, 3965),
    undefined.

gte_first_gift_fid_new(1) -> 1;
gte_first_gift_fid_new(2) -> 1;
gte_first_gift_fid_new(3) -> 1;
gte_first_gift_fid_new(4) -> 2;
gte_first_gift_fid_new(5) -> 2;
gte_first_gift_fid_new(6) -> 2;
gte_first_gift_fid_new(_Info) ->
    logger:data_error("gte_first_gift_fid_new_data_not_exist===>~w",
		      [_Info], charge_data, 3973),
    undefined.

day_gift(301) -> {202, 5, 0};
day_gift(302) -> {203, 10, 1};
day_gift(303) -> {204, 20, 2};
day_gift(_) -> undefined.

day_gift_open_id(0) -> [202, 203, 204];
day_gift_open_id(_) -> undefined.

day_gift_reward({204, Lev})
    when Lev >= 1 andalso Lev =< 60 ->
    [{3, 500000}, {10001, 25000}, {10090, 5}, {1, 25000000},
     {22, 25000000}, {10450, 50000}, {10470, 25},
     {10490, 10}, {35, 50}, {37001, 50}, {37002, 25},
     {37004, 25}, {5, 250000}];
day_gift_reward({204, Lev})
    when Lev >= 61 andalso Lev =< 79 ->
    [{3, 500000}, {10001, 25000}, {10090, 5}, {1, 25000000},
     {22, 25000000}, {10450, 50000}, {10470, 25},
     {10490, 10}, {35, 50}, {37001, 50}, {37002, 25},
     {37004, 25}, {5, 250000}];
day_gift_reward({204, Lev})
    when Lev >= 80 andalso Lev =< 89 ->
    [{3, 500000}, {10001, 25000}, {10090, 5}, {1, 25000000},
     {22, 25000000}, {10450, 50000}, {10470, 25},
     {10490, 10}, {35, 50}, {37001, 50}, {37002, 25},
     {37004, 25}, {5, 250000}];
day_gift_reward({204, Lev})
    when Lev >= 90 andalso Lev =< 119 ->
    [{3, 500000}, {10001, 25000}, {10090, 5}, {1, 25000000},
     {22, 25000000}, {10450, 50000}, {10470, 25},
     {10490, 10}, {35, 50}, {37001, 50}, {37002, 25},
     {37004, 25}, {5, 250000}];
day_gift_reward({204, Lev})
    when Lev >= 120 andalso Lev =< 300 ->
    [{3, 500000}, {10001, 25000}, {10090, 5}, {1, 25000000},
     {22, 25000000}, {10450, 50000}, {10470, 25},
     {10490, 10}, {35, 50}, {37001, 50}, {37002, 25},
     {37004, 25}, {5, 250000}];
day_gift_reward({203, Lev})
    when Lev >= 1 andalso Lev =< 60 ->
    [{3, 200000}, {10001, 10000}, {10090, 2}, {1, 10000000},
     {22, 10000000}, {10450, 20000}, {10470, 10}, {10490, 4},
     {35, 20}, {37001, 20}, {37002, 10}, {37004, 10},
     {5, 100000}];
day_gift_reward({203, Lev})
    when Lev >= 61 andalso Lev =< 79 ->
    [{3, 200000}, {10001, 10000}, {10090, 2}, {1, 10000000},
     {22, 10000000}, {10450, 20000}, {10470, 10}, {10490, 4},
     {35, 20}, {37001, 20}, {37002, 10}, {37004, 10},
     {5, 100000}];
day_gift_reward({203, Lev})
    when Lev >= 80 andalso Lev =< 89 ->
    [{3, 200000}, {10001, 10000}, {10090, 2}, {1, 10000000},
     {22, 10000000}, {10450, 20000}, {10470, 10}, {10490, 4},
     {35, 20}, {37001, 20}, {37002, 10}, {37004, 10},
     {5, 100000}];
day_gift_reward({203, Lev})
    when Lev >= 90 andalso Lev =< 119 ->
    [{3, 200000}, {10001, 10000}, {10090, 2}, {1, 10000000},
     {22, 10000000}, {10450, 20000}, {10470, 10}, {10490, 4},
     {35, 20}, {37001, 20}, {37002, 10}, {37004, 10},
     {5, 100000}];
day_gift_reward({203, Lev})
    when Lev >= 120 andalso Lev =< 300 ->
    [{3, 200000}, {10001, 10000}, {10090, 2}, {1, 10000000},
     {22, 10000000}, {10450, 20000}, {10470, 10}, {10490, 4},
     {35, 20}, {37001, 20}, {37002, 10}, {37004, 10},
     {5, 100000}];
day_gift_reward({202, Lev})
    when Lev >= 1 andalso Lev =< 60 ->
    [{3, 100000}, {10001, 5000}, {10090, 1}, {1, 5000000},
     {22, 5000000}, {10450, 10000}, {10470, 5}, {10490, 2},
     {35, 10}, {37001, 10}, {37002, 5}, {37004, 5},
     {5, 50000}];
day_gift_reward({202, Lev})
    when Lev >= 61 andalso Lev =< 79 ->
    [{3, 100000}, {10001, 5000}, {10090, 1}, {1, 5000000},
     {22, 5000000}, {10450, 10000}, {10470, 5}, {10490, 2},
     {35, 10}, {37001, 10}, {37002, 5}, {37004, 5},
     {5, 50000}];
day_gift_reward({202, Lev})
    when Lev >= 80 andalso Lev =< 89 ->
    [{3, 100000}, {10001, 5000}, {10090, 1}, {1, 5000000},
     {22, 5000000}, {10450, 10000}, {10470, 5}, {10490, 2},
     {35, 10}, {37001, 10}, {37002, 5}, {37004, 5},
     {5, 50000}];
day_gift_reward({202, Lev})
    when Lev >= 90 andalso Lev =< 119 ->
    [{3, 100000}, {10001, 5000}, {10090, 1}, {1, 5000000},
     {22, 5000000}, {10450, 10000}, {10470, 5}, {10490, 2},
     {35, 10}, {37001, 10}, {37002, 5}, {37004, 5},
     {5, 50000}];
day_gift_reward({202, Lev})
    when Lev >= 120 andalso Lev =< 300 ->
    [{3, 100000}, {10001, 5000}, {10090, 1}, {1, 5000000},
     {22, 5000000}, {10450, 10000}, {10470, 5}, {10490, 2},
     {35, 10}, {37001, 10}, {37002, 5}, {37004, 5},
     {5, 50000}];
day_gift_reward(_Info) ->
    logger:data_error("day_gift_reward_data_not_exist===>~w",
		      [_Info], charge_data, 3998),
    undefined.

get_vip_ext({1, 0}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 1}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 2}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 3}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 4}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 5}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 6}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 7}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 8}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 9}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 10}) ->
    [{3, 50000}, {37001, 1}, {29905, 100}];
get_vip_ext({1, 11}) ->
    [{3, 100000}, {37001, 2}, {29905, 100}];
get_vip_ext({1, 12}) ->
    [{3, 100000}, {37001, 2}, {29905, 100}];
get_vip_ext({1, 13}) ->
    [{3, 100000}, {37001, 2}, {29905, 100}];
get_vip_ext({1, 14}) ->
    [{3, 100000}, {37001, 2}, {29905, 100}];
get_vip_ext({1, 15}) ->
    [{3, 200000}, {37001, 3}, {29905, 100}];
get_vip_ext({1, 16}) ->
    [{3, 200000}, {37001, 3}, {29905, 100}];
get_vip_ext({1, 17}) ->
    [{3, 200000}, {37001, 3}, {29905, 100}];
get_vip_ext({1, 18}) ->
    [{3, 200000}, {37001, 3}, {29905, 100}];
get_vip_ext({1, 19}) ->
    [{3, 200000}, {37001, 3}, {29905, 100}];
get_vip_ext({1, 20}) ->
    [{3, 200000}, {37001, 3}, {29905, 100}];
get_vip_ext({1, 21}) ->
    [{3, 200000}, {37001, 3}, {29905, 100}];
get_vip_ext({1, 22}) ->
    [{3, 300000}, {37001, 4}, {29905, 100}];
get_vip_ext({1, 23}) ->
    [{3, 300000}, {37001, 4}, {29905, 100}];
get_vip_ext({1, 24}) ->
    [{3, 300000}, {37001, 4}, {29905, 100}];
get_vip_ext({1, 25}) ->
    [{3, 300000}, {37001, 4}, {29905, 100}];
get_vip_ext({1, 26}) ->
    [{3, 300000}, {37001, 4}, {29905, 100}];
get_vip_ext({1, 27}) ->
    [{3, 300000}, {37001, 4}, {29905, 100}];
get_vip_ext({1, 28}) ->
    [{3, 300000}, {37001, 4}, {29905, 100}];
get_vip_ext({1, 29}) ->
    [{3, 300000}, {37001, 4}, {29905, 100}];
get_vip_ext({1, 30}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 31}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 32}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 33}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 34}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 35}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 36}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 37}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 38}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 39}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 40}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 41}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 42}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 43}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 44}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 45}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 46}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 47}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 48}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 49}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 50}) ->
    [{3, 400000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 51}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 52}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 53}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 54}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 55}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 56}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 57}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 58}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 59}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 60}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 61}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 62}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 63}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 64}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 65}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 66}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 67}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 68}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 69}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 70}) ->
    [{3, 500000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 71}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 72}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 73}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 74}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 75}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 76}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 77}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 78}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 79}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 80}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 81}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 82}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 83}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 84}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 85}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 86}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 87}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 88}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 89}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 90}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 91}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 92}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 93}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 94}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 95}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 96}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 97}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 98}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 99}) ->
    [{3, 700000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 100}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 101}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 102}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 103}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 104}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 105}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 106}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 107}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 108}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 109}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 110}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 111}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 112}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 113}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 114}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 115}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 116}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 117}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 118}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 119}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 120}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 121}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 122}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 123}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 124}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 125}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 126}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 127}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 128}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 129}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 130}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 131}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 132}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 133}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 134}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 135}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 136}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 137}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 138}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 139}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 140}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 141}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 142}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 143}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 144}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 145}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 146}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 147}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 148}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 149}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 150}) ->
    [{3, 1000000}, {37001, 5}, {29905, 100}];
get_vip_ext({1, 151}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 152}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 153}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 154}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 155}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 156}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 157}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 158}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 159}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 160}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 161}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 162}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 163}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 164}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 165}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 166}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 167}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 168}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 169}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 170}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 171}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 172}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 173}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 174}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 175}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 176}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 177}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 178}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 179}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 180}) ->
    [{3, 1500000}, {37001, 8}, {29905, 100}];
get_vip_ext({1, 181}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 182}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 183}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 184}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 185}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 186}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 187}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 188}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 189}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 190}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 191}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 192}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 193}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 194}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 195}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 196}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 197}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 198}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 199}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext({1, 200}) ->
    [{3, 2000000}, {37001, 10}, {29905, 100}];
get_vip_ext(_) -> [].

day_charge_reward(OpenDay)
    when OpenDay >= 1 andalso OpenDay =< 7 ->
    [{72003, 1}, {10403, 1}, {3, 10000}, {39083, 1}];
day_charge_reward(OpenDay)
    when OpenDay >= 8 andalso OpenDay =< 15 ->
    [{72003, 1}, {10403, 1}, {3, 10000}, {39084, 1}];
day_charge_reward(OpenDay)
    when OpenDay >= 16 andalso OpenDay =< 30 ->
    [{72003, 1}, {10403, 1}, {3, 10000}, {39085, 1}];
day_charge_reward(OpenDay)
    when OpenDay >= 31 andalso OpenDay =< 60 ->
    [{72003, 1}, {10403, 1}, {3, 10000}, {39086, 1}];
day_charge_reward(OpenDay)
    when OpenDay >= 61 andalso OpenDay =< 120 ->
    [{72003, 1}, {10403, 1}, {3, 10000}, {39087, 1}];
day_charge_reward(OpenDay)
    when OpenDay >= 121 andalso OpenDay =< 150 ->
    [{72003, 1}, {10403, 1}, {3, 10000}, {39088, 1}];
day_charge_reward(OpenDay)
    when OpenDay >= 151 andalso OpenDay =< 9999 ->
    [{72003, 1}, {10403, 1}, {3, 10000}, {39089, 1}];
day_charge_reward(_Info) ->
    logger:data_error("day_charge_reward_data_not_exist===>~w",
		      [_Info], charge_data, 4025),
    undefined.


