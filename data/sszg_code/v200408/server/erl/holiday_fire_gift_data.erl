-file("data/holiday_fire_gift_data.erl", 1).

-file("src/mod/data/holiday_fire_gift_data.erl", 1).

-module(holiday_fire_gift_data).

-lager_records([]).

-export([get_const/1, gift_list/0, get_gift_info/1,
	 get_gift_info1/1, get_award/1, get_price/1]).

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

-file("src/mod/data/holiday_fire_gift_data.erl", 15).

get_const(_) -> undefined.

gift_list() ->
    [{35, [{lev, 170}, {have_partner_star, 13}]},
     {34, [{lev, 105}, {all_score, 10000, 999999999}]},
     {33, [{lev, 105}, {all_score, 10000, 999999999}]},
     {32, [{lev, 105}, {all_score, 0, 9999}]},
     {31, [{lev, 105}, {all_score, 0, 9999}]},
     {24, [{lev, 80}]}, {23, [{lev, 80}]},
     {22, [{lev, 140}]}, {20, [{lev, 70}]},
     {19, [{lev, 70}]}, {18, [{lev, 80}]},
     {14,
      [{lev, 105}, {dun_id, 10250, 10480},
       {all_score, 10000, 999999999}]},
     {11,
      [{lev, 105}, {dun_id, 10160, 10249},
       {all_score, 10000, 999999999}]},
     {8, [{lev, 105}, {dun_id, 10051, 10159}]},
     {5, [{lev, 105}, {dun_id, 10001, 10050}]},
     {2, [{lev, 999}, {dun_id, 10001, 10049}]},
     {16, [{lev, 999}, {dun_id, 10250, 10480}]},
     {15, [{lev, 999}, {dun_id, 10250, 10480}]},
     {13, [{lev, 999}, {dun_id, 10160, 10249}]},
     {12, [{lev, 999}, {dun_id, 10160, 10249}]},
     {10, [{lev, 999}, {dun_id, 10090, 10159}]},
     {9, [{lev, 999}, {dun_id, 10090, 10159}]},
     {7, [{lev, 999}, {dun_id, 10050, 10089}]},
     {6, [{lev, 999}, {dun_id, 10050, 10089}]},
     {4, [{lev, 999}, {dun_id, 10001, 10049}]},
     {3, [{lev, 999}, {dun_id, 10001, 10049}]}].

get_gift_info(3) -> {1502, 604800, 3, 1, 2};
get_gift_info(4) -> {1503, 604800, 3, 1, 2};
get_gift_info(6) -> {1505, 604800, 3, 1, 2};
get_gift_info(7) -> {1506, 604800, 3, 1, 2};
get_gift_info(9) -> {1508, 604800, 3, 1, 2};
get_gift_info(10) -> {1509, 604800, 3, 1, 2};
get_gift_info(12) -> {1511, 604800, 3, 1, 2};
get_gift_info(13) -> {1512, 604800, 3, 1, 2};
get_gift_info(15) -> {1514, 604800, 3, 1, 2};
get_gift_info(16) -> {1515, 604800, 3, 1, 2};
get_gift_info(2) -> {1501, 604800, 1, 1, 4};
get_gift_info(5) -> {1504, 604800, 1, 1, 4};
get_gift_info(8) -> {1507, 604800, 1, 1, 4};
get_gift_info(11) -> {1510, 604800, 1, 1, 4};
get_gift_info(14) -> {1513, 604800, 1, 1, 4};
get_gift_info(18) -> {1521, 604800, 3, 1, 2};
get_gift_info(19) -> {1531, 604800, 1, 1, 2};
get_gift_info(20) -> {1532, 604800, 1, 1, 2};
get_gift_info(22) -> {1533, 604800, 3, 1, 2};
get_gift_info(23) -> {1534, 604800, 3, 1, 2};
get_gift_info(24) -> {1535, 604800, 3, 1, 2};
get_gift_info(31) -> {1536, 604800, 3, 1, 2};
get_gift_info(32) -> {1537, 604800, 3, 1, 2};
get_gift_info(33) -> {1538, 604800, 3, 1, 2};
get_gift_info(34) -> {1539, 604800, 3, 1, 2};
get_gift_info(35) -> {1540, 604800, 3, 1, 2};
get_gift_info(_Info) ->
    logger:data_error("get_gift_info_data_not_exist===>~w",
		      [_Info], holiday_fire_gift_data, 47),
    undefined.

get_gift_info1(3) ->
    {128, 888, lang:get(<<"Thiên Giới Cầu Nguyện"/utf8>>),
     3, 82,
     [{3, 1280}, {17201, 32}, {28, 120}, {1, 2000000}]};
get_gift_info1(4) ->
    {328, 1980, lang:get(<<"Siêu Giá Trị"/utf8>>), 4, 83,
     [{3, 3280}, {17201, 68}, {28, 300}, {1, 5000000}]};
get_gift_info1(6) ->
    {128, 888, lang:get(<<"Thiên Giới Cầu Nguyện"/utf8>>),
     3, 82,
     [{3, 1280}, {17202, 32}, {28, 120}, {1, 2000000}]};
get_gift_info1(7) ->
    {328, 1980, lang:get(<<"Siêu Giá Trị"/utf8>>), 4, 83,
     [{3, 3280}, {17202, 68}, {28, 300}, {1, 5000000}]};
get_gift_info1(9) ->
    {128, 888, lang:get(<<"Thiên Giới Cầu Nguyện"/utf8>>),
     3, 82,
     [{3, 1280}, {17203, 32}, {28, 120}, {1, 2000000}]};
get_gift_info1(10) ->
    {328, 1980, lang:get(<<"Siêu Giá Trị"/utf8>>), 4, 83,
     [{3, 3280}, {17203, 68}, {28, 300}, {1, 5000000}]};
get_gift_info1(12) ->
    {128, 888, lang:get(<<"Thiên Giới Cầu Nguyện"/utf8>>),
     3, 82,
     [{3, 1280}, {17204, 32}, {28, 120}, {1, 2000000}]};
get_gift_info1(13) ->
    {328, 1980, lang:get(<<"Siêu Giá Trị"/utf8>>), 4, 83,
     [{3, 3280}, {17204, 68}, {28, 300}, {1, 5000000}]};
get_gift_info1(15) ->
    {128, 888, lang:get(<<"Thiên Giới Cầu Nguyện"/utf8>>),
     3, 82,
     [{3, 1280}, {17205, 32}, {28, 120}, {1, 2000000}]};
get_gift_info1(16) ->
    {328, 1980, lang:get(<<"Siêu Giá Trị"/utf8>>), 4, 83,
     [{3, 3280}, {17205, 68}, {28, 300}, {1, 5000000}]};
get_gift_info1(2) ->
    {128, 888, lang:get(<<"Cực Phẩm Trang Bị"/utf8>>), 2,
     81, [{3, 1280}, {39497, 1}, {17210, 14}, {10030, 80}]};
get_gift_info1(5) ->
    {198, 888, lang:get(<<"Cực Phẩm Trang Bị"/utf8>>), 2,
     81, [{3, 1980}, {39501, 1}, {17210, 18}, {10030, 120}]};
get_gift_info1(8) ->
    {328, 1280, lang:get(<<"Cực Phẩm Trang Bị"/utf8>>), 2,
     81, [{3, 3280}, {39505, 1}, {17210, 24}, {10030, 220}]};
get_gift_info1(11) ->
    {448, 2280, lang:get(<<"Cực Phẩm Trang Bị"/utf8>>), 2,
     81, [{3, 4480}, {39509, 1}, {17211, 30}, {10030, 300}]};
get_gift_info1(14) ->
    {448, 2380, lang:get(<<"Cực Phẩm Trang Bị"/utf8>>), 2,
     81, [{3, 4480}, {39509, 1}, {17211, 30}, {10030, 300}]};
get_gift_info1(18) ->
    {198, 1280, lang:get(<<"Vĩ Thú Tranh Mua"/utf8>>), 7,
     60,
     [{3, 1980}, {10040, 250}, {10603, 3}, {1, 3000000}]};
get_gift_info1(19) ->
    {328, 1980, lang:get(<<"Siêu Giá Trị Thời Gian"/utf8>>),
     9, 61,
     [{3, 3280}, {10403, 25}, {37005, 10}, {1, 6000000}]};
get_gift_info1(20) ->
    {648, 3280, lang:get(<<"Cự Huệ"/utf8>>), 10, 62,
     [{3, 6480}, {29906, 50}, {37005, 20}, {38061, 1}]};
get_gift_info1(22) ->
    {328, 1980, lang:get(<<"Thiên Khải Tiến Cấp"/utf8>>), 8,
     44, [{3, 3280}, {10090, 10}, {38051, 1}, {10403, 16}]};
get_gift_info1(23) ->
    {128, 888, lang:get(<<"Vĩ Thú Cầu Nguyện"/utf8>>), 11,
     82,
     [{3, 1280}, {10415, 10}, {10040, 100}, {1, 3000000}]};
get_gift_info1(24) ->
    {328, 1980, lang:get(<<"Vĩ Thú Triệu Hồi"/utf8>>), 12,
     83,
     [{3, 3280}, {10415, 22}, {10040, 250}, {1, 8000000}]};
get_gift_info1(31) ->
    {128, 888, lang:get(<<"Thiên Giới Cầu Nguyện"/utf8>>),
     3, 82,
     [{3, 1280}, {17210, 25}, {28, 120}, {1, 2000000}]};
get_gift_info1(32) ->
    {328, 1980, lang:get(<<"Siêu Giá Trị"/utf8>>), 4, 83,
     [{3, 3280}, {17210, 50}, {28, 300}, {1, 5000000}]};
get_gift_info1(33) ->
    {128, 888, lang:get(<<"Thiên Giới Cầu Nguyện"/utf8>>),
     3, 82,
     [{3, 1280}, {17211, 20}, {28, 120}, {1, 2000000}]};
get_gift_info1(34) ->
    {328, 1980, lang:get(<<"Siêu Giá Trị"/utf8>>), 4, 83,
     [{3, 3280}, {17211, 40}, {28, 300}, {1, 5000000}]};
get_gift_info1(35) ->
    {328, 1980, lang:get(<<"13 Sao Thức Tỉnh"/utf8>>), 1,
     83,
     [{3, 3280}, {16202, 1}, {10460, 10}, {10450, 5000}]};
get_gift_info1(_Info) ->
    logger:data_error("get_gift_info1_data_not_exist===>~w",
		      [_Info], holiday_fire_gift_data, 75),
    undefined.

get_award(1502) ->
    [{3, 1280}, {17201, 32}, {28, 120}, {1, 2000000}];
get_award(1503) ->
    [{3, 3280}, {17201, 68}, {28, 300}, {1, 5000000}];
get_award(1505) ->
    [{3, 1280}, {17202, 32}, {28, 120}, {1, 2000000}];
get_award(1506) ->
    [{3, 3280}, {17202, 68}, {28, 300}, {1, 5000000}];
get_award(1508) ->
    [{3, 1280}, {17203, 32}, {28, 120}, {1, 2000000}];
get_award(1509) ->
    [{3, 3280}, {17203, 68}, {28, 300}, {1, 5000000}];
get_award(1511) ->
    [{3, 1280}, {17204, 32}, {28, 120}, {1, 2000000}];
get_award(1512) ->
    [{3, 3280}, {17204, 68}, {28, 300}, {1, 5000000}];
get_award(1514) ->
    [{3, 1280}, {17205, 32}, {28, 120}, {1, 2000000}];
get_award(1515) ->
    [{3, 3280}, {17205, 68}, {28, 300}, {1, 5000000}];
get_award(1501) ->
    [{3, 1280}, {39497, 1}, {17210, 14}, {10030, 80}];
get_award(1504) ->
    [{3, 1980}, {39501, 1}, {17210, 18}, {10030, 120}];
get_award(1507) ->
    [{3, 3280}, {39505, 1}, {17210, 24}, {10030, 220}];
get_award(1510) ->
    [{3, 4480}, {39509, 1}, {17211, 30}, {10030, 300}];
get_award(1513) ->
    [{3, 4480}, {39509, 1}, {17211, 30}, {10030, 300}];
get_award(1521) ->
    [{3, 1980}, {10040, 250}, {10603, 3}, {1, 3000000}];
get_award(1531) ->
    [{3, 3280}, {10403, 25}, {37005, 10}, {1, 6000000}];
get_award(1532) ->
    [{3, 6480}, {29906, 50}, {37005, 20}, {38061, 1}];
get_award(1533) ->
    [{3, 3280}, {10090, 10}, {38051, 1}, {10403, 16}];
get_award(1534) ->
    [{3, 1280}, {10415, 10}, {10040, 100}, {1, 3000000}];
get_award(1535) ->
    [{3, 3280}, {10415, 22}, {10040, 250}, {1, 8000000}];
get_award(1536) ->
    [{3, 1280}, {17210, 25}, {28, 120}, {1, 2000000}];
get_award(1537) ->
    [{3, 3280}, {17210, 50}, {28, 300}, {1, 5000000}];
get_award(1538) ->
    [{3, 1280}, {17211, 20}, {28, 120}, {1, 2000000}];
get_award(1539) ->
    [{3, 3280}, {17211, 40}, {28, 300}, {1, 5000000}];
get_award(1540) ->
    [{3, 3280}, {16202, 1}, {10460, 10}, {10450, 5000}];
get_award(_Info) ->
    logger:data_error("get_award_data_not_exist===>~w",
		      [_Info], holiday_fire_gift_data, 103),
    undefined.

get_price(1502) -> 128;
get_price(1503) -> 328;
get_price(1505) -> 128;
get_price(1506) -> 328;
get_price(1508) -> 128;
get_price(1509) -> 328;
get_price(1511) -> 128;
get_price(1512) -> 328;
get_price(1514) -> 128;
get_price(1515) -> 328;
get_price(1501) -> 128;
get_price(1504) -> 198;
get_price(1507) -> 328;
get_price(1510) -> 448;
get_price(1513) -> 448;
get_price(1521) -> 198;
get_price(1531) -> 328;
get_price(1532) -> 648;
get_price(1533) -> 328;
get_price(1534) -> 128;
get_price(1535) -> 328;
get_price(1536) -> 128;
get_price(1537) -> 328;
get_price(1538) -> 128;
get_price(1539) -> 328;
get_price(1540) -> 328;
get_price(_Info) ->
    logger:data_error("get_price_data_not_exist===>~w",
		      [_Info], holiday_fire_gift_data, 131),
    undefined.


