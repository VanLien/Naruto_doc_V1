-file("data/dungeon_data.erl", 1).

-module(dungeon_data).

-export([get_const/1, list_chapter/1, list/1, get/1,
	 fast_combat_num/1, list_ext_reward/0, ext_reward/1]).

-file("../server/inc/common.hrl", 1).

-file("../server/inc/lib_log.hrl", 1).

-file("../server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("data/dungeon_data.erl", 16).

-file("../server/inc/dungeon.hrl", 1).

-record(m_dungeon,
	{ver = 6, mode = 1, chapter_id = 0, dun_id = 0,
	 max_dun_id = 0, last_hook_time = 0, list = [],
	 drop_idx = 0, ext_reward = [], buff_list = [],
	 fast_combat_add_time = 0, auto_combat_id = 0,
	 auto_combat_num = 0, auto_combat_items = [],
	 chapter_awrads = [], is_first = 1, acc_hook_time = 0,
	 acc_hook_items = []}).

-record(dun_chapter, {id = 0, status = 0, list = []}).

-record(dungeon,
	{id = 0, status = 0, cool_time = 0, auto_num = 0}).

-record(dungeon_data,
	{id = 0, name = <<>>, chapter_id = 0, mode = 1,
	 next_id = 0, unit_id = 0, items = [], drop_ids = [],
	 hook_unit_id = 0, hook_items = [], hook_drop_ids = [],
	 hook_lev_add = [], time = 0, is_big = 0, energy_max = 0,
	 auto_items = [], power = 0, lev_limit = 0, floor = 0}).

-record(dungeon_replay_log,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(dungeon_replay,
	{dun_id = 0  :: non_neg_integer(),
	 replays = []  :: [#dungeon_replay_log{}]}).

-file("data/dungeon_data.erl", 17).

get_const(swap_times_max) -> 5;
get_const(profit_time_max) -> 43200;
get_const(swap_item) -> 10003;
get_const(quick_swap_reward) -> 120;
get_const(quick_swap_item) -> 10004;
get_const(quick_swap_free_times) -> 1;
get_const(energy_max) -> 10000;
get_const(advanture_item) ->
    {{10446, 1}, {1, 1}, {10447, 1}, {10448, 1}, {10499, 1},
     {10102, 1}};
get_const(vip_quick_swap) -> 126;
get_const(help_tips) -> 6;
get_const(swap_item_cost) -> 100;
get_const(swap_time) -> 10;
get_const(free_swap) -> 3;
get_const(open_limit) -> 10070;
get_const(fast_combat_first) -> 10020;
get_const(buff_up) -> 1;
get_const(quick_buff) -> 3200;
get_const(quick_tips) -> 1;
get_const(fast_combat_add_time) -> 0;
get_const(fast_combat_add_max_time) -> 0;
get_const(auto_combat_dun_id) -> 10100;
get_const(auto_combat_lev) -> 15;
get_const(auto_combat_num) -> 999;
get_const(income_receipt_time) -> 38880;
get_const(hangup_revenue) -> 60;
get_const(hangup_revenue_small) -> 300;
get_const(hangup_revenue_big) -> 3600;
get_const(hallows_unlock) -> 10120;
get_const(game_rule) -> 1;
get_const(vip_reward) -> [1, 5, 22];
get_const(hd_fast_combat_free_time) -> 1;
get_const(hd_fast_combat_buy_time) -> 4;
get_const(hd_fast_combat_lose) -> [{3, 200}];
get_const(_) -> undefined.

list_chapter(1) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
list_chapter(_) -> [].

list({1, 16}) ->
    [160010, 160020, 160030, 160040, 160050, 160060, 160070,
     160080, 160090, 160100, 160110, 160120, 160130, 160140,
     160150, 160160, 160170, 160180, 160190, 160200, 160210,
     160220, 160230, 160240, 160250, 160260, 160270, 160280,
     160290, 160300, 160310, 160320, 160330, 160340, 160350,
     160360, 160370, 160380, 160390, 160400];
list({1, 15}) ->
    [150010, 150020, 150030, 150040, 150050, 150060, 150070,
     150080, 150090, 150100, 150110, 150120, 150130, 150140,
     150150, 150160, 150170, 150180, 150190, 150200, 150210,
     150220, 150230, 150240, 150250, 150260, 150270, 150280,
     150290, 150300, 150310, 150320, 150330, 150340, 150350,
     150360, 150370, 150380, 150390, 150400];
list({1, 14}) ->
    [140010, 140020, 140030, 140040, 140050, 140060, 140070,
     140080, 140090, 140100, 140110, 140120, 140130, 140140,
     140150, 140160, 140170, 140180, 140190, 140200, 140210,
     140220, 140230, 140240, 140250, 140260, 140270, 140280,
     140290, 140300, 140310, 140320, 140330, 140340, 140350,
     140360, 140370, 140380, 140390, 140400];
list({1, 13}) ->
    [130010, 130020, 130030, 130040, 130050, 130060, 130070,
     130080, 130090, 130100, 130110, 130120, 130130, 130140,
     130150, 130160, 130170, 130180, 130190, 130200, 130210,
     130220, 130230, 130240, 130250, 130260, 130270, 130280,
     130290, 130300, 130310, 130320, 130330, 130340, 130350,
     130360, 130370, 130380, 130390, 130400];
list({1, 12}) ->
    [120010, 120020, 120030, 120040, 120050, 120060, 120070,
     120080, 120090, 120100, 120110, 120120, 120130, 120140,
     120150, 120160, 120170, 120180, 120190, 120200, 120210,
     120220, 120230, 120240, 120250, 120260, 120270, 120280,
     120290, 120300, 120310, 120320, 120330, 120340, 120350,
     120360, 120370, 120380, 120390, 120400];
list({1, 11}) ->
    [110010, 110020, 110030, 110040, 110050, 110060, 110070,
     110080, 110090, 110100, 110110, 110120, 110130, 110140,
     110150, 110160, 110170, 110180, 110190, 110200, 110210,
     110220, 110230, 110240, 110250, 110260, 110270, 110280,
     110290, 110300, 110310, 110320, 110330, 110340, 110350,
     110360, 110370, 110380, 110390, 110400];
list({1, 10}) ->
    [100010, 100020, 100030, 100040, 100050, 100060, 100070,
     100080, 100090, 100100, 100110, 100120, 100130, 100140,
     100150, 100160, 100170, 100180, 100190, 100200, 100210,
     100220, 100230, 100240, 100250, 100260, 100270, 100280,
     100290, 100300, 100310, 100320, 100330, 100340, 100350,
     100360, 100370, 100380, 100390, 100400];
list({1, 9}) ->
    [90010, 90020, 90030, 90040, 90050, 90060, 90070, 90080,
     90090, 90100, 90110, 90120, 90130, 90140, 90150, 90160,
     90170, 90180, 90190, 90200, 90210, 90220, 90230, 90240,
     90250, 90260, 90270, 90280, 90290, 90300, 90310, 90320,
     90330, 90340, 90350, 90360, 90370, 90380, 90390, 90400];
list({1, 8}) ->
    [80010, 80020, 80030, 80040, 80050, 80060, 80070, 80080,
     80090, 80100, 80110, 80120, 80130, 80140, 80150, 80160,
     80170, 80180, 80190, 80200, 80210, 80220, 80230, 80240,
     80250, 80260, 80270, 80280, 80290, 80300, 80310, 80320,
     80330, 80340, 80350, 80360, 80370, 80380, 80390, 80400];
list({1, 7}) ->
    [70010, 70020, 70030, 70040, 70050, 70060, 70070, 70080,
     70090, 70100, 70110, 70120, 70130, 70140, 70150, 70160,
     70170, 70180, 70190, 70200, 70210, 70220, 70230, 70240,
     70250, 70260, 70270, 70280, 70290, 70300, 70310, 70320,
     70330, 70340, 70350, 70360, 70370, 70380, 70390, 70400];
list({1, 6}) ->
    [60010, 60020, 60030, 60040, 60050, 60060, 60070, 60080,
     60090, 60100, 60110, 60120, 60130, 60140, 60150, 60160,
     60170, 60180, 60190, 60200, 60210, 60220, 60230, 60240,
     60250, 60260, 60270, 60280, 60290, 60300, 60310, 60320,
     60330, 60340, 60350, 60360, 60370, 60380, 60390, 60400];
list({1, 5}) ->
    [50010, 50020, 50030, 50040, 50050, 50060, 50070, 50080,
     50090, 50100, 50110, 50120, 50130, 50140, 50150, 50160,
     50170, 50180, 50190, 50200, 50210, 50220, 50230, 50240,
     50250, 50260, 50270, 50280, 50290, 50300, 50310, 50320,
     50330, 50340, 50350, 50360, 50370, 50380, 50390, 50400];
list({1, 4}) ->
    [40010, 40020, 40030, 40040, 40050, 40060, 40070, 40080,
     40090, 40100, 40110, 40120, 40130, 40140, 40150, 40160,
     40170, 40180, 40190, 40200, 40210, 40220, 40230, 40240,
     40250, 40260, 40270, 40280, 40290, 40300, 40310, 40320,
     40330, 40340, 40350, 40360, 40370, 40380, 40390, 40400];
list({1, 3}) ->
    [30010, 30020, 30030, 30040, 30050, 30060, 30070, 30080,
     30090, 30100, 30110, 30120, 30130, 30140, 30150, 30160,
     30170, 30180, 30190, 30200, 30210, 30220, 30230, 30240,
     30250, 30260, 30270, 30280, 30290, 30300, 30310, 30320,
     30330, 30340, 30350, 30360, 30370, 30380, 30390, 30400];
list({1, 2}) ->
    [20010, 20020, 20030, 20040, 20050, 20060, 20070, 20080,
     20090, 20100, 20110, 20120, 20130, 20140, 20150, 20160,
     20170, 20180, 20190, 20200, 20210, 20220, 20230, 20240,
     20250, 20260, 20270, 20280, 20290, 20300, 20310, 20320,
     20330, 20340, 20350, 20360, 20370, 20380, 20390, 20400];
list({1, 1}) ->
    [10010, 10020, 10030, 10040, 10050, 10060, 10070, 10080,
     10090, 10100, 10110, 10120, 10130, 10140, 10150, 10160,
     10170, 10180, 10190, 10200, 10210, 10220, 10230, 10240,
     10250, 10260, 10270, 10280, 10290, 10300, 10310, 10320,
     10330, 10340, 10350, 10360, 10370, 10380, 10390, 10400];
list(_) -> [].

get(10010) ->
    #dungeon_data{id = 10010,
		  name = lang:get(<<"卡达尔森林1"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10020, unit_id = 20101,
		  items =
		      [{5, 200000000}, {3, 99000000}, {22, 500}, {1, 4000},
		       {7, 100}, {24802, 30}],
		  drop_ids = [30100, 20001], hook_unit_id = 20101,
		  hook_items = [{5, 10}, {22, 25}, {1, 200}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 0, power = 327,
		  energy_max = 10000, lev_limit = 1, floor = 1};
get(10020) ->
    #dungeon_data{id = 10020,
		  name = lang:get(<<"卡达尔森林2"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10030, unit_id = 20102,
		  items =
		      [{5, 200}, {22, 500}, {1, 4000}, {7, 100}, {3, 150}],
		  drop_ids = [30100, 20001], hook_unit_id = 20102,
		  hook_items = [{5, 10}, {22, 25}, {1, 200}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 2, power = 410,
		  energy_max = 10000, lev_limit = 1, floor = 2};
get(10030) ->
    #dungeon_data{id = 10030,
		  name = lang:get(<<"卡达尔森林3"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10040, unit_id = 20103,
		  items =
		      [{5, 200}, {22, 700}, {1, 4200}, {7, 100}, {37001, 1}],
		  drop_ids = [30100, 20001], hook_unit_id = 20103,
		  hook_items = [{5, 10}, {22, 35}, {1, 210}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 2, power = 980,
		  energy_max = 10000, lev_limit = 1, floor = 3};
get(10040) ->
    #dungeon_data{id = 10040,
		  name = lang:get(<<"卡达尔森林4"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10050, unit_id = 20104,
		  items = [{5, 400}, {22, 700}, {1, 4200}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20104,
		  hook_items = [{5, 20}, {22, 35}, {1, 210}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 2, power = 1148,
		  energy_max = 10000, lev_limit = 1, floor = 4};
get(10050) ->
    #dungeon_data{id = 10050,
		  name = lang:get(<<"卡达尔森林5"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10060, unit_id = 20105,
		  items = [{5, 1400}, {22, 2450}, {1, 14700}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20105,
		  hook_items = [{5, 20}, {22, 35}, {1, 210}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 2, is_big = 1,
		  power = 1327, energy_max = 10000, lev_limit = 1,
		  floor = 5};
get(10060) ->
    #dungeon_data{id = 10060,
		  name = lang:get(<<"卡达尔森林6"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10070, unit_id = 20106,
		  items = [{5, 400}, {22, 900}, {1, 4300}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20106,
		  hook_items = [{5, 20}, {22, 45}, {1, 220}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 2, power = 1432,
		  energy_max = 10000, lev_limit = 1, floor = 6};
get(10070) ->
    #dungeon_data{id = 10070,
		  name = lang:get(<<"卡达尔森林7"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10080, unit_id = 20107,
		  items = [{5, 600}, {22, 900}, {1, 4300}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20107,
		  hook_items = [{5, 30}, {22, 45}, {1, 220}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 2, power = 2242,
		  energy_max = 10000, lev_limit = 1, floor = 7};
get(10080) ->
    #dungeon_data{id = 10080,
		  name = lang:get(<<"卡达尔森林8"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10090, unit_id = 20108,
		  items = [{5, 600}, {22, 900}, {1, 4300}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20108,
		  hook_items = [{5, 30}, {22, 45}, {1, 220}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 2, power = 2400,
		  energy_max = 10000, lev_limit = 1, floor = 8};
get(10090) ->
    #dungeon_data{id = 10090,
		  name = lang:get(<<"卡达尔森林9"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10100, unit_id = 20109,
		  items = [{5, 600}, {22, 1100}, {1, 4400}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20109,
		  hook_items = [{5, 30}, {22, 55}, {1, 230}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 2, power = 2557,
		  energy_max = 10000, lev_limit = 1, floor = 9};
get(10100) ->
    #dungeon_data{id = 10100,
		  name = lang:get(<<"卡达尔森林10"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10110, unit_id = 20110,
		  items = [{5, 2800}, {22, 3850}, {1, 15400}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20110,
		  hook_items = [{5, 40}, {22, 55}, {1, 230}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 2, is_big = 1,
		  power = 2715, energy_max = 10000, lev_limit = 1,
		  floor = 10};
get(10110) ->
    #dungeon_data{id = 10110,
		  name = lang:get(<<"卡达尔森林11"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10120, unit_id = 20111,
		  items = [{5, 800}, {22, 1100}, {1, 4400}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20111,
		  hook_items = [{5, 40}, {22, 55}, {1, 230}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, power = 2872,
		  energy_max = 10000, lev_limit = 1, floor = 11};
get(10120) ->
    #dungeon_data{id = 10120,
		  name = lang:get(<<"卡达尔森林12"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10130, unit_id = 20112,
		  items = [{5, 800}, {22, 1300}, {1, 4500}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20112,
		  hook_items = [{5, 40}, {22, 65}, {1, 240}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, power = 3030,
		  energy_max = 10000, lev_limit = 1, floor = 12};
get(10130) ->
    #dungeon_data{id = 10130,
		  name = lang:get(<<"卡达尔森林13"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10140, unit_id = 20113,
		  items = [{5, 1000}, {22, 1300}, {1, 4500}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20113,
		  hook_items = [{5, 50}, {22, 65}, {1, 240}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, power = 3187,
		  energy_max = 10000, lev_limit = 1, floor = 13};
get(10140) ->
    #dungeon_data{id = 10140,
		  name = lang:get(<<"卡达尔森林14"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10150, unit_id = 20114,
		  items = [{5, 1000}, {22, 1300}, {1, 4500}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20114,
		  hook_items = [{5, 50}, {22, 65}, {1, 240}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, power = 3345,
		  energy_max = 10000, lev_limit = 1, floor = 14};
get(10150) ->
    #dungeon_data{id = 10150,
		  name = lang:get(<<"卡达尔森林15"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10160, unit_id = 20115,
		  items = [{5, 3500}, {22, 5250}, {1, 16100}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20115,
		  hook_items = [{5, 50}, {22, 75}, {1, 250}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, is_big = 1,
		  power = 4280, energy_max = 10000, lev_limit = 1,
		  floor = 15};
get(10160) ->
    #dungeon_data{id = 10160,
		  name = lang:get(<<"卡达尔森林16"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10170, unit_id = 20116,
		  items = [{5, 1200}, {22, 1500}, {1, 4600}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20116,
		  hook_items = [{5, 60}, {22, 75}, {1, 250}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, power = 5707,
		  energy_max = 10000, lev_limit = 1, floor = 16};
get(10170) ->
    #dungeon_data{id = 10170,
		  name = lang:get(<<"卡达尔森林17"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10180, unit_id = 20117,
		  items = [{5, 1200}, {22, 1500}, {1, 4600}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20117,
		  hook_items = [{5, 60}, {22, 75}, {1, 250}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, power = 6459,
		  energy_max = 10000, lev_limit = 1, floor = 17};
get(10180) ->
    #dungeon_data{id = 10180,
		  name = lang:get(<<"卡达尔森林18"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10190, unit_id = 20118,
		  items = [{5, 1200}, {22, 1700}, {1, 4700}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20118,
		  hook_items = [{5, 60}, {22, 85}, {1, 260}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, power = 6669,
		  energy_max = 10000, lev_limit = 1, floor = 18};
get(10190) ->
    #dungeon_data{id = 10190,
		  name = lang:get(<<"卡达尔森林19"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10200, unit_id = 20119,
		  items = [{5, 1400}, {22, 1700}, {1, 4700}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20119,
		  hook_items = [{5, 70}, {22, 85}, {1, 260}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, power = 7207,
		  energy_max = 10000, lev_limit = 1, floor = 19};
get(10200) ->
    #dungeon_data{id = 10200,
		  name = lang:get(<<"卡达尔森林20"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10210, unit_id = 20120,
		  items =
		      [{5, 4900}, {22, 5950}, {1, 16450}, {7, 100},
		       {40101, 3}],
		  drop_ids = [30100, 20001], hook_unit_id = 20120,
		  hook_items = [{5, 70}, {22, 85}, {1, 260}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 3, is_big = 1,
		  power = 7417, energy_max = 10500, lev_limit = 1,
		  floor = 20};
get(10210) ->
    #dungeon_data{id = 10210,
		  name = lang:get(<<"卡达尔森林21"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10220, unit_id = 20121,
		  items = [{5, 1400}, {22, 1900}, {1, 4800}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20121,
		  hook_items = [{5, 70}, {22, 95}, {1, 270}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 4, power = 8013,
		  energy_max = 11000, lev_limit = 1, floor = 21};
get(10220) ->
    #dungeon_data{id = 10220,
		  name = lang:get(<<"卡达尔森林22"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10230, unit_id = 20122,
		  items = [{5, 1600}, {22, 1900}, {1, 4800}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20122,
		  hook_items = [{5, 80}, {22, 95}, {1, 270}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 4, power = 8223,
		  energy_max = 11500, lev_limit = 1, floor = 22};
get(10230) ->
    #dungeon_data{id = 10230,
		  name = lang:get(<<"卡达尔森林23"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10240, unit_id = 20123,
		  items = [{5, 1600}, {22, 1900}, {1, 4800}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20123,
		  hook_items = [{5, 80}, {22, 95}, {1, 270}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 4, power = 8849,
		  energy_max = 12000, lev_limit = 1, floor = 23};
get(10240) ->
    #dungeon_data{id = 10240,
		  name = lang:get(<<"卡达尔森林24"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10250, unit_id = 20124,
		  items = [{5, 1600}, {22, 2100}, {1, 4900}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20124,
		  hook_items = [{5, 80}, {22, 105}, {1, 280}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 4, power = 9059,
		  energy_max = 12500, lev_limit = 1, floor = 24};
get(10250) ->
    #dungeon_data{id = 10250,
		  name = lang:get(<<"卡达尔森林25"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10260, unit_id = 20125,
		  items = [{5, 6300}, {22, 7350}, {1, 17150}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20125,
		  hook_items = [{5, 90}, {22, 105}, {1, 280}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 4, is_big = 1,
		  power = 9718, energy_max = 13000, lev_limit = 1,
		  floor = 25};
get(10260) ->
    #dungeon_data{id = 10260,
		  name = lang:get(<<"卡达尔森林26"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10270, unit_id = 20126,
		  items = [{5, 1800}, {22, 2100}, {1, 4900}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20126,
		  hook_items = [{5, 90}, {22, 105}, {1, 280}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 4, power = 9928,
		  energy_max = 13500, lev_limit = 1, floor = 26};
get(10270) ->
    #dungeon_data{id = 10270,
		  name = lang:get(<<"卡达尔森林27"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10280, unit_id = 20127,
		  items = [{5, 1800}, {22, 2300}, {1, 5000}, {7, 100}],
		  drop_ids = [30100, 20001], hook_unit_id = 20127,
		  hook_items = [{5, 90}, {22, 115}, {1, 290}, {7, 10}],
		  hook_drop_ids = [20100, 20001], time = 4, power = 10722,
		  energy_max = 14000, lev_limit = 1, floor = 27};
get(10280) ->
    #dungeon_data{id = 10280,
		  name = lang:get(<<"卡达尔森林28"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10290, unit_id = 20128,
		  items = [{5, 2000}, {22, 2300}, {1, 5000}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20128,
		  hook_items = [{5, 100}, {22, 115}, {1, 290}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 4, power = 10932,
		  energy_max = 14500, lev_limit = 1, floor = 28};
get(10290) ->
    #dungeon_data{id = 10290,
		  name = lang:get(<<"卡达尔森林29"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10300, unit_id = 20129,
		  items = [{5, 2000}, {22, 2300}, {1, 5000}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20129,
		  hook_items = [{5, 100}, {22, 115}, {1, 290}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 4, power = 11789,
		  energy_max = 15000, lev_limit = 1, floor = 29};
get(10300) ->
    #dungeon_data{id = 10300,
		  name = lang:get(<<"卡达尔森林30"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10310, unit_id = 20130,
		  items = [{5, 7000}, {22, 8750}, {1, 17850}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20130,
		  hook_items = [{5, 100}, {22, 125}, {1, 300}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 4, is_big = 1,
		  power = 11999, energy_max = 15500, lev_limit = 1,
		  floor = 30};
get(10310) ->
    #dungeon_data{id = 10310,
		  name = lang:get(<<"卡达尔森林31"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10320, unit_id = 20131,
		  items = [{5, 2200}, {22, 2500}, {1, 5100}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20131,
		  hook_items = [{5, 110}, {22, 125}, {1, 300}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, power = 16086,
		  energy_max = 16000, lev_limit = 1, floor = 31};
get(10320) ->
    #dungeon_data{id = 10320,
		  name = lang:get(<<"卡达尔森林32"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10330, unit_id = 20132,
		  items = [{5, 2200}, {22, 2500}, {1, 5100}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20132,
		  hook_items = [{5, 110}, {22, 125}, {1, 300}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, power = 16348,
		  energy_max = 16500, lev_limit = 1, floor = 32};
get(10330) ->
    #dungeon_data{id = 10330,
		  name = lang:get(<<"卡达尔森林33"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10340, unit_id = 20133,
		  items = [{5, 2200}, {22, 2700}, {1, 5200}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20133,
		  hook_items = [{5, 110}, {22, 135}, {1, 310}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, power = 17487,
		  energy_max = 17000, lev_limit = 1, floor = 33};
get(10340) ->
    #dungeon_data{id = 10340,
		  name = lang:get(<<"卡达尔森林34"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10350, unit_id = 20134,
		  items = [{5, 2400}, {22, 2700}, {1, 5200}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20134,
		  hook_items = [{5, 120}, {22, 135}, {1, 310}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, power = 17750,
		  energy_max = 17500, lev_limit = 1, floor = 34};
get(10350) ->
    #dungeon_data{id = 10350,
		  name = lang:get(<<"卡达尔森林35"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10360, unit_id = 20135,
		  items = [{5, 8400}, {22, 9450}, {1, 18200}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20135,
		  hook_items = [{5, 120}, {22, 135}, {1, 310}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, is_big = 1,
		  power = 19871, energy_max = 18000, lev_limit = 1,
		  floor = 35};
get(10360) ->
    #dungeon_data{id = 10360,
		  name = lang:get(<<"卡达尔森林36"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10370, unit_id = 20136,
		  items = [{5, 2400}, {22, 2900}, {1, 5300}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20136,
		  hook_items = [{5, 120}, {22, 145}, {1, 320}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, power = 20133,
		  energy_max = 18500, lev_limit = 1, floor = 36};
get(10370) ->
    #dungeon_data{id = 10370,
		  name = lang:get(<<"卡达尔森林37"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10380, unit_id = 20137,
		  items = [{5, 2600}, {22, 2900}, {1, 5300}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20137,
		  hook_items = [{5, 130}, {22, 145}, {1, 320}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, power = 21509,
		  energy_max = 19000, lev_limit = 1, floor = 37};
get(10380) ->
    #dungeon_data{id = 10380,
		  name = lang:get(<<"卡达尔森林38"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10390, unit_id = 20138,
		  items = [{5, 2600}, {22, 2900}, {1, 5300}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20138,
		  hook_items = [{5, 130}, {22, 145}, {1, 320}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, power = 21771,
		  energy_max = 19500, lev_limit = 1, floor = 38};
get(10390) ->
    #dungeon_data{id = 10390,
		  name = lang:get(<<"卡达尔森林39"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 10400, unit_id = 20139,
		  items = [{5, 2600}, {22, 3100}, {1, 5400}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20139,
		  hook_items = [{5, 130}, {22, 155}, {1, 330}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, power = 23194,
		  energy_max = 20000, lev_limit = 1, floor = 39};
get(10400) ->
    #dungeon_data{id = 10400,
		  name = lang:get(<<"卡达尔森林40"/utf8>>), chapter_id = 1,
		  mode = 1, next_id = 20010, unit_id = 20140,
		  items = [{5, 9800}, {22, 10850}, {1, 18900}, {7, 100}],
		  drop_ids = [30110, 20001], hook_unit_id = 20140,
		  hook_items = [{5, 140}, {22, 155}, {1, 330}, {7, 10}],
		  hook_drop_ids = [20110, 20001], time = 5, is_big = 1,
		  power = 23457, energy_max = 20500, lev_limit = 1,
		  floor = 40};
get(20010) ->
    #dungeon_data{id = 20010,
		  name = lang:get(<<"维瑟斯山城41"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20020, unit_id = 20141,
		  items = [{5, 2800}, {22, 3100}, {1, 5400}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20141,
		  hook_items = [{5, 140}, {22, 155}, {1, 330}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 24932, energy_max = 21000, lev_limit = 1,
		  floor = 41};
get(20020) ->
    #dungeon_data{id = 20020,
		  name = lang:get(<<"维瑟斯山城42"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20030, unit_id = 20142,
		  items = [{5, 2800}, {22, 3300}, {1, 5500}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20142,
		  hook_items = [{5, 140}, {22, 165}, {1, 340}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 25194, energy_max = 21500, lev_limit = 1,
		  floor = 42};
get(20030) ->
    #dungeon_data{id = 20030,
		  name = lang:get(<<"维瑟斯山城43"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20040, unit_id = 20201,
		  items = [{5, 3000}, {22, 3300}, {1, 5500}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20201,
		  hook_items = [{5, 150}, {22, 165}, {1, 340}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 26706, energy_max = 22000, lev_limit = 1,
		  floor = 43};
get(20040) ->
    #dungeon_data{id = 20040,
		  name = lang:get(<<"维瑟斯山城44"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20050, unit_id = 20202,
		  items = [{5, 3000}, {22, 3300}, {1, 5500}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20202,
		  hook_items = [{5, 150}, {22, 165}, {1, 340}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 26969, energy_max = 22000, lev_limit = 1,
		  floor = 44};
get(20050) ->
    #dungeon_data{id = 20050,
		  name = lang:get(<<"维瑟斯山城45"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20060, unit_id = 20203,
		  items = [{5, 10500}, {22, 12250}, {1, 19600}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20203,
		  hook_items = [{5, 150}, {22, 175}, {1, 350}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  is_big = 1, power = 28565, energy_max = 22000,
		  lev_limit = 1, floor = 45};
get(20060) ->
    #dungeon_data{id = 20060,
		  name = lang:get(<<"维瑟斯山城46"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20070, unit_id = 20204,
		  items = [{5, 3200}, {22, 3500}, {1, 5600}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20204,
		  hook_items = [{5, 160}, {22, 175}, {1, 350}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 28827, energy_max = 22000, lev_limit = 1,
		  floor = 46};
get(20070) ->
    #dungeon_data{id = 20070,
		  name = lang:get(<<"维瑟斯山城47"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20080, unit_id = 20205,
		  items = [{5, 3200}, {22, 3500}, {1, 5600}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20205,
		  hook_items = [{5, 160}, {22, 175}, {1, 350}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 30429, energy_max = 22000, lev_limit = 1,
		  floor = 47};
get(20080) ->
    #dungeon_data{id = 20080,
		  name = lang:get(<<"维瑟斯山城48"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20090, unit_id = 20206,
		  items = [{5, 3200}, {22, 3700}, {1, 5700}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20206,
		  hook_items = [{5, 160}, {22, 185}, {1, 360}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 30691, energy_max = 22000, lev_limit = 1,
		  floor = 48};
get(20090) ->
    #dungeon_data{id = 20090,
		  name = lang:get(<<"维瑟斯山城49"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20100, unit_id = 20207,
		  items = [{5, 3400}, {22, 3700}, {1, 5700}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20207,
		  hook_items = [{5, 170}, {22, 185}, {1, 360}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 30954, energy_max = 22000, lev_limit = 1,
		  floor = 49};
get(20100) ->
    #dungeon_data{id = 20100,
		  name = lang:get(<<"维瑟斯山城50"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20110, unit_id = 20208,
		  items = [{5, 11900}, {22, 12950}, {1, 19950}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20208,
		  hook_items = [{5, 170}, {22, 185}, {1, 360}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  is_big = 1, power = 32371, energy_max = 22000,
		  lev_limit = 1, floor = 50};
get(20110) ->
    #dungeon_data{id = 20110,
		  name = lang:get(<<"维瑟斯山城51"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20120, unit_id = 20209,
		  items = [{5, 3400}, {22, 3900}, {1, 5800}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20209,
		  hook_items = [{5, 170}, {22, 195}, {1, 370}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 32634, energy_max = 22000, lev_limit = 1,
		  floor = 51};
get(20120) ->
    #dungeon_data{id = 20120,
		  name = lang:get(<<"维瑟斯山城52"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20130, unit_id = 20210,
		  items = [{5, 3600}, {22, 3900}, {1, 5800}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20210,
		  hook_items = [{5, 180}, {22, 195}, {1, 370}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 32896, energy_max = 22000, lev_limit = 1,
		  floor = 52};
get(20130) ->
    #dungeon_data{id = 20130,
		  name = lang:get(<<"维瑟斯山城53"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20140, unit_id = 20211,
		  items = [{5, 3600}, {22, 3900}, {1, 5800}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20211,
		  hook_items = [{5, 180}, {22, 195}, {1, 370}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 34345, energy_max = 22000, lev_limit = 1,
		  floor = 53};
get(20140) ->
    #dungeon_data{id = 20140,
		  name = lang:get(<<"维瑟斯山城54"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20150, unit_id = 20212,
		  items = [{5, 3600}, {22, 4100}, {1, 5900}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20212,
		  hook_items = [{5, 180}, {22, 205}, {1, 380}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 34608, energy_max = 22000, lev_limit = 1,
		  floor = 54};
get(20150) ->
    #dungeon_data{id = 20150,
		  name = lang:get(<<"维瑟斯山城55"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20160, unit_id = 20213,
		  items = [{5, 13300}, {22, 14350}, {1, 20650}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20213,
		  hook_items = [{5, 190}, {22, 205}, {1, 380}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  is_big = 1, power = 36345, energy_max = 22000,
		  lev_limit = 1, floor = 55};
get(20160) ->
    #dungeon_data{id = 20160,
		  name = lang:get(<<"维瑟斯山城56"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20170, unit_id = 20214,
		  items = [{5, 3800}, {22, 4100}, {1, 5900}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20214,
		  hook_items = [{5, 190}, {22, 205}, {1, 380}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 36608, energy_max = 22000, lev_limit = 1,
		  floor = 56};
get(20170) ->
    #dungeon_data{id = 20170,
		  name = lang:get(<<"维瑟斯山城57"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20180, unit_id = 20215,
		  items = [{5, 3800}, {22, 4300}, {1, 6000}, {7, 100}],
		  drop_ids = [30110, 20001, 20000], hook_unit_id = 20215,
		  hook_items = [{5, 190}, {22, 215}, {1, 390}, {7, 10}],
		  hook_drop_ids = [20110, 20001, 20000], time = 5,
		  power = 39779, energy_max = 22000, lev_limit = 1,
		  floor = 57};
get(20180) ->
    #dungeon_data{id = 20180,
		  name = lang:get(<<"维瑟斯山城58"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20190, unit_id = 20216,
		  items = [{5, 4000}, {22, 4300}, {1, 6000}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20216,
		  hook_items = [{5, 200}, {22, 215}, {1, 390}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 40041, energy_max = 22000, lev_limit = 1,
		  floor = 58};
get(20190) ->
    #dungeon_data{id = 20190,
		  name = lang:get(<<"维瑟斯山城59"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20200, unit_id = 20217,
		  items = [{5, 4000}, {22, 4300}, {1, 6000}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20217,
		  hook_items = [{5, 200}, {22, 215}, {1, 390}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 42362, energy_max = 22000, lev_limit = 1,
		  floor = 59};
get(20200) ->
    #dungeon_data{id = 20200,
		  name = lang:get(<<"维瑟斯山城60"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20210, unit_id = 20218,
		  items = [{5, 14000}, {22, 15750}, {1, 21350}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20218,
		  hook_items = [{5, 200}, {22, 225}, {1, 400}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  is_big = 1, power = 42624, energy_max = 22000,
		  lev_limit = 1, floor = 60};
get(20210) ->
    #dungeon_data{id = 20210,
		  name = lang:get(<<"维瑟斯山城61"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20220, unit_id = 20219,
		  items = [{5, 4200}, {22, 4500}, {1, 6100}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20219,
		  hook_items = [{5, 210}, {22, 225}, {1, 400}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 45024, energy_max = 22000, lev_limit = 1,
		  floor = 61};
get(20220) ->
    #dungeon_data{id = 20220,
		  name = lang:get(<<"维瑟斯山城62"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20230, unit_id = 20220,
		  items = [{5, 4200}, {22, 4500}, {1, 6100}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20220,
		  hook_items = [{5, 210}, {22, 225}, {1, 400}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 45286, energy_max = 22000, lev_limit = 1,
		  floor = 62};
get(20230) ->
    #dungeon_data{id = 20230,
		  name = lang:get(<<"维瑟斯山城63"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20240, unit_id = 20221,
		  items = [{5, 4200}, {22, 4700}, {1, 6200}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20221,
		  hook_items = [{5, 210}, {22, 235}, {1, 410}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 47706, energy_max = 22000, lev_limit = 1,
		  floor = 63};
get(20240) ->
    #dungeon_data{id = 20240,
		  name = lang:get(<<"维瑟斯山城64"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20250, unit_id = 20222,
		  items = [{5, 4400}, {22, 4700}, {1, 6200}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20222,
		  hook_items = [{5, 220}, {22, 235}, {1, 410}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 47969, energy_max = 22000, lev_limit = 1,
		  floor = 64};
get(20250) ->
    #dungeon_data{id = 20250,
		  name = lang:get(<<"维瑟斯山城65"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20260, unit_id = 20223,
		  items = [{5, 15400}, {22, 16450}, {1, 21700}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20223,
		  hook_items = [{5, 220}, {22, 235}, {1, 410}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  is_big = 1, power = 48231, energy_max = 22000,
		  lev_limit = 1, floor = 65};
get(20260) ->
    #dungeon_data{id = 20260,
		  name = lang:get(<<"维瑟斯山城66"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20270, unit_id = 20224,
		  items = [{5, 4400}, {22, 4900}, {1, 6300}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20224,
		  hook_items = [{5, 220}, {22, 245}, {1, 420}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 50478, energy_max = 22000, lev_limit = 1,
		  floor = 66};
get(20270) ->
    #dungeon_data{id = 20270,
		  name = lang:get(<<"维瑟斯山城67"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20280, unit_id = 20225,
		  items = [{5, 4600}, {22, 4900}, {1, 6300}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20225,
		  hook_items = [{5, 230}, {22, 245}, {1, 420}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 50741, energy_max = 22000, lev_limit = 1,
		  floor = 67};
get(20280) ->
    #dungeon_data{id = 20280,
		  name = lang:get(<<"维瑟斯山城68"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20290, unit_id = 20226,
		  items = [{5, 4600}, {22, 4900}, {1, 6300}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20226,
		  hook_items = [{5, 230}, {22, 245}, {1, 420}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 51003, energy_max = 22000, lev_limit = 1,
		  floor = 68};
get(20290) ->
    #dungeon_data{id = 20290,
		  name = lang:get(<<"维瑟斯山城69"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20300, unit_id = 20227,
		  items = [{5, 4600}, {22, 5100}, {1, 6400}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20227,
		  hook_items = [{5, 230}, {22, 255}, {1, 430}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 53250, energy_max = 22000, lev_limit = 1,
		  floor = 69};
get(20300) ->
    #dungeon_data{id = 20300,
		  name = lang:get(<<"维瑟斯山城70"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20310, unit_id = 20228,
		  items = [{5, 16800}, {22, 17850}, {1, 22400}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20228,
		  hook_items = [{5, 240}, {22, 255}, {1, 430}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  is_big = 1, power = 53513, energy_max = 22000,
		  lev_limit = 1, floor = 70};
get(20310) ->
    #dungeon_data{id = 20310,
		  name = lang:get(<<"维瑟斯山城71"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20320, unit_id = 20229,
		  items = [{5, 4800}, {22, 5100}, {1, 6400}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20229,
		  hook_items = [{5, 240}, {22, 255}, {1, 430}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 53775, energy_max = 22000, lev_limit = 1,
		  floor = 71};
get(20320) ->
    #dungeon_data{id = 20320,
		  name = lang:get(<<"维瑟斯山城72"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20330, unit_id = 20230,
		  items = [{5, 4800}, {22, 5300}, {1, 6500}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20230,
		  hook_items = [{5, 240}, {22, 265}, {1, 440}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 56112, energy_max = 22000, lev_limit = 1,
		  floor = 72};
get(20330) ->
    #dungeon_data{id = 20330,
		  name = lang:get(<<"维瑟斯山城73"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20340, unit_id = 20231,
		  items = [{5, 5000}, {22, 5300}, {1, 6500}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20231,
		  hook_items = [{5, 250}, {22, 265}, {1, 440}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 56374, energy_max = 22000, lev_limit = 1,
		  floor = 73};
get(20340) ->
    #dungeon_data{id = 20340,
		  name = lang:get(<<"维瑟斯山城74"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20350, unit_id = 20232,
		  items = [{5, 5000}, {22, 5300}, {1, 6500}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20232,
		  hook_items = [{5, 250}, {22, 265}, {1, 440}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 56637, energy_max = 22000, lev_limit = 1,
		  floor = 74};
get(20350) ->
    #dungeon_data{id = 20350,
		  name = lang:get(<<"维瑟斯山城75"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20360, unit_id = 20233,
		  items = [{5, 17500}, {22, 19250}, {1, 23100}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20233,
		  hook_items = [{5, 250}, {22, 275}, {1, 450}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  is_big = 1, power = 59031, energy_max = 22000,
		  lev_limit = 1, floor = 75};
get(20360) ->
    #dungeon_data{id = 20360,
		  name = lang:get(<<"维瑟斯山城76"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20370, unit_id = 20234,
		  items = [{5, 5200}, {22, 5500}, {1, 6600}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20234,
		  hook_items = [{5, 260}, {22, 275}, {1, 450}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 59293, energy_max = 22000, lev_limit = 23,
		  floor = 76};
get(20370) ->
    #dungeon_data{id = 20370,
		  name = lang:get(<<"维瑟斯山城77"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20380, unit_id = 20235,
		  items = [{5, 5200}, {22, 5500}, {1, 6600}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20235,
		  hook_items = [{5, 260}, {22, 275}, {1, 450}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 59556, energy_max = 22000, lev_limit = 23,
		  floor = 77};
get(20380) ->
    #dungeon_data{id = 20380,
		  name = lang:get(<<"维瑟斯山城78"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20390, unit_id = 20236,
		  items = [{5, 5200}, {22, 5700}, {1, 6700}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20236,
		  hook_items = [{5, 260}, {22, 285}, {1, 460}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 61992, energy_max = 22000, lev_limit = 23,
		  floor = 78};
get(20390) ->
    #dungeon_data{id = 20390,
		  name = lang:get(<<"维瑟斯山城79"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 20400, unit_id = 20237,
		  items = [{5, 5400}, {22, 5700}, {1, 6700}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20237,
		  hook_items = [{5, 270}, {22, 285}, {1, 460}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 62254, energy_max = 22000, lev_limit = 23,
		  floor = 79};
get(20400) ->
    #dungeon_data{id = 20400,
		  name = lang:get(<<"维瑟斯山城80"/utf8>>), chapter_id = 2,
		  mode = 1, next_id = 30010, unit_id = 20238,
		  items = [{5, 18900}, {22, 19950}, {1, 23450}, {7, 100}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20238,
		  hook_items = [{5, 270}, {22, 285}, {1, 460}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  is_big = 1, power = 62517, energy_max = 22000,
		  lev_limit = 23, floor = 80};
get(30010) ->
    #dungeon_data{id = 30010,
		  name = lang:get(<<"达齐尔雪地81"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30020, unit_id = 20239,
		  items = [{5, 5400}, {22, 5900}, {1, 6800}, {7, 200}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20239,
		  hook_items = [{5, 270}, {22, 295}, {1, 470}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 65010, energy_max = 22000, lev_limit = 23,
		  floor = 81};
get(30020) ->
    #dungeon_data{id = 30020,
		  name = lang:get(<<"达齐尔雪地82"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30030, unit_id = 20240,
		  items = [{5, 5600}, {22, 5900}, {1, 6800}, {7, 200}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20240,
		  hook_items = [{5, 280}, {22, 295}, {1, 470}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 65273, energy_max = 22000, lev_limit = 25,
		  floor = 82};
get(30030) ->
    #dungeon_data{id = 30030,
		  name = lang:get(<<"达齐尔雪地83"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30040, unit_id = 20241,
		  items = [{5, 5600}, {22, 5900}, {1, 6800}, {7, 200}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20241,
		  hook_items = [{5, 280}, {22, 295}, {1, 470}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 65535, energy_max = 22000, lev_limit = 25,
		  floor = 83};
get(30040) ->
    #dungeon_data{id = 30040,
		  name = lang:get(<<"达齐尔雪地84"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30050, unit_id = 20242,
		  items = [{5, 5600}, {22, 6100}, {1, 6900}, {7, 200}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20242,
		  hook_items = [{5, 280}, {22, 305}, {1, 480}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 65798, energy_max = 22000, lev_limit = 25,
		  floor = 84};
get(30050) ->
    #dungeon_data{id = 30050,
		  name = lang:get(<<"达齐尔雪地85"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30060, unit_id = 20301,
		  items = [{5, 20300}, {22, 21350}, {1, 24150}, {7, 200}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20301,
		  hook_items = [{5, 290}, {22, 305}, {1, 480}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  is_big = 1, power = 69982, energy_max = 22000,
		  lev_limit = 25, floor = 85};
get(30060) ->
    #dungeon_data{id = 30060,
		  name = lang:get(<<"达齐尔雪地86"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30070, unit_id = 20302,
		  items = [{5, 5800}, {22, 6100}, {1, 6900}, {7, 200}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20302,
		  hook_items = [{5, 290}, {22, 305}, {1, 480}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 70245, energy_max = 22000, lev_limit = 25,
		  floor = 86};
get(30070) ->
    #dungeon_data{id = 30070,
		  name = lang:get(<<"达齐尔雪地87"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30080, unit_id = 20303,
		  items = [{5, 5800}, {22, 6300}, {1, 7000}, {7, 200}],
		  drop_ids = [30120, 20001, 20000], hook_unit_id = 20303,
		  hook_items = [{5, 290}, {22, 315}, {1, 490}, {7, 10}],
		  hook_drop_ids = [20120, 20001, 20000], time = 5,
		  power = 70507, energy_max = 22000, lev_limit = 25,
		  floor = 87};
get(30080) ->
    #dungeon_data{id = 30080,
		  name = lang:get(<<"达齐尔雪地88"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30090, unit_id = 20304,
		  items = [{5, 6000}, {22, 6300}, {1, 7000}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20304,
		  hook_items = [{5, 300}, {22, 315}, {1, 490}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 70770, energy_max = 22000, lev_limit = 27,
		  floor = 88};
get(30090) ->
    #dungeon_data{id = 30090,
		  name = lang:get(<<"达齐尔雪地89"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30100, unit_id = 20305,
		  items = [{5, 6000}, {22, 6300}, {1, 7000}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20305,
		  hook_items = [{5, 300}, {22, 315}, {1, 490}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 73326, energy_max = 22000, lev_limit = 27,
		  floor = 89};
get(30100) ->
    #dungeon_data{id = 30100,
		  name = lang:get(<<"达齐尔雪地90"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30110, unit_id = 20306,
		  items = [{5, 21000}, {22, 22750}, {1, 24850}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20306,
		  hook_items = [{5, 300}, {22, 325}, {1, 500}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  is_big = 1, power = 73589, energy_max = 22000,
		  lev_limit = 27, floor = 90};
get(30110) ->
    #dungeon_data{id = 30110,
		  name = lang:get(<<"达齐尔雪地91"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30120, unit_id = 20307,
		  items = [{5, 6200}, {22, 6500}, {1, 7100}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20307,
		  hook_items = [{5, 310}, {22, 325}, {1, 500}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 73851, energy_max = 22000, lev_limit = 27,
		  floor = 91};
get(30120) ->
    #dungeon_data{id = 30120,
		  name = lang:get(<<"达齐尔雪地92"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30130, unit_id = 20308,
		  items = [{5, 6200}, {22, 6500}, {1, 7100}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20308,
		  hook_items = [{5, 310}, {22, 325}, {1, 500}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 74114, energy_max = 22000, lev_limit = 27,
		  floor = 92};
get(30130) ->
    #dungeon_data{id = 30130,
		  name = lang:get(<<"达齐尔雪地93"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30140, unit_id = 20309,
		  items = [{5, 6200}, {22, 6700}, {1, 7200}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20309,
		  hook_items = [{5, 310}, {22, 335}, {1, 510}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 76770, energy_max = 22000, lev_limit = 27,
		  floor = 93};
get(30140) ->
    #dungeon_data{id = 30140,
		  name = lang:get(<<"达齐尔雪地94"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30150, unit_id = 20310,
		  items = [{5, 6400}, {22, 6700}, {1, 7200}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20310,
		  hook_items = [{5, 320}, {22, 335}, {1, 510}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 77033, energy_max = 22000, lev_limit = 29,
		  floor = 94};
get(30150) ->
    #dungeon_data{id = 30150,
		  name = lang:get(<<"达齐尔雪地95"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30160, unit_id = 20311,
		  items = [{5, 22400}, {22, 23450}, {1, 25200}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20311,
		  hook_items = [{5, 320}, {22, 335}, {1, 510}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  is_big = 1, power = 77295, energy_max = 22000,
		  lev_limit = 29, floor = 95};
get(30160) ->
    #dungeon_data{id = 30160,
		  name = lang:get(<<"达齐尔雪地96"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30170, unit_id = 20312,
		  items = [{5, 6400}, {22, 6900}, {1, 7300}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20312,
		  hook_items = [{5, 320}, {22, 345}, {1, 520}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 77558, energy_max = 22000, lev_limit = 29,
		  floor = 96};
get(30170) ->
    #dungeon_data{id = 30170,
		  name = lang:get(<<"达齐尔雪地97"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30180, unit_id = 20313,
		  items = [{5, 6600}, {22, 6900}, {1, 7300}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20313,
		  hook_items = [{5, 330}, {22, 345}, {1, 520}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 80267, energy_max = 22000, lev_limit = 29,
		  floor = 97};
get(30180) ->
    #dungeon_data{id = 30180,
		  name = lang:get(<<"达齐尔雪地98"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30190, unit_id = 20314,
		  items = [{5, 6600}, {22, 6900}, {1, 7300}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20314,
		  hook_items = [{5, 330}, {22, 345}, {1, 520}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 80529, energy_max = 22000, lev_limit = 29,
		  floor = 98};
get(30190) ->
    #dungeon_data{id = 30190,
		  name = lang:get(<<"达齐尔雪地99"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30200, unit_id = 20315,
		  items = [{5, 6600}, {22, 7100}, {1, 7400}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20315,
		  hook_items = [{5, 330}, {22, 355}, {1, 530}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 80792, energy_max = 22000, lev_limit = 29,
		  floor = 99};
get(30200) ->
    #dungeon_data{id = 30200,
		  name = lang:get(<<"达齐尔雪地100"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30210, unit_id = 20316,
		  items = [{5, 23800}, {22, 24850}, {1, 25900}, {7, 200}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20316,
		  hook_items = [{5, 340}, {22, 355}, {1, 530}, {7, 10}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  is_big = 1, power = 81054, energy_max = 22000,
		  lev_limit = 31, floor = 100};
get(30210) ->
    #dungeon_data{id = 30210,
		  name = lang:get(<<"达齐尔雪地101"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30220, unit_id = 20317,
		  items = [{5, 6800}, {22, 7100}, {1, 7400}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20317,
		  hook_items = [{5, 340}, {22, 355}, {1, 530}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 83811, energy_max = 22000, lev_limit = 31,
		  floor = 101};
get(30220) ->
    #dungeon_data{id = 30220,
		  name = lang:get(<<"达齐尔雪地102"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30230, unit_id = 20318,
		  items = [{5, 6800}, {22, 7300}, {1, 7500}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20318,
		  hook_items = [{5, 340}, {22, 365}, {1, 540}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 84073, energy_max = 22000, lev_limit = 31,
		  floor = 102};
get(30230) ->
    #dungeon_data{id = 30230,
		  name = lang:get(<<"达齐尔雪地103"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30240, unit_id = 20319,
		  items = [{5, 7000}, {22, 7300}, {1, 7500}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20319,
		  hook_items = [{5, 350}, {22, 365}, {1, 540}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 84336, energy_max = 22000, lev_limit = 31,
		  floor = 103};
get(30240) ->
    #dungeon_data{id = 30240,
		  name = lang:get(<<"达齐尔雪地104"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30250, unit_id = 20320,
		  items = [{5, 7000}, {22, 7300}, {1, 7500}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20320,
		  hook_items = [{5, 350}, {22, 365}, {1, 540}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 84598, energy_max = 22000, lev_limit = 31,
		  floor = 104};
get(30250) ->
    #dungeon_data{id = 30250,
		  name = lang:get(<<"达齐尔雪地105"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30260, unit_id = 20321,
		  items = [{5, 24500}, {22, 26250}, {1, 26600}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20321,
		  hook_items = [{5, 350}, {22, 375}, {1, 550}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  is_big = 1, power = 93192, energy_max = 22000,
		  lev_limit = 31, floor = 105};
get(30260) ->
    #dungeon_data{id = 30260,
		  name = lang:get(<<"达齐尔雪地106"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30270, unit_id = 20322,
		  items = [{5, 7200}, {22, 7500}, {1, 7600}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20322,
		  hook_items = [{5, 360}, {22, 375}, {1, 550}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 93455, energy_max = 22000, lev_limit = 33,
		  floor = 106};
get(30270) ->
    #dungeon_data{id = 30270,
		  name = lang:get(<<"达齐尔雪地107"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30280, unit_id = 20323,
		  items = [{5, 7200}, {22, 7500}, {1, 7600}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20323,
		  hook_items = [{5, 360}, {22, 375}, {1, 550}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 93717, energy_max = 22000, lev_limit = 33,
		  floor = 107};
get(30280) ->
    #dungeon_data{id = 30280,
		  name = lang:get(<<"达齐尔雪地108"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30290, unit_id = 20324,
		  items = [{5, 7200}, {22, 7700}, {1, 7700}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20324,
		  hook_items = [{5, 360}, {22, 385}, {1, 560}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 93980, energy_max = 22000, lev_limit = 33,
		  floor = 108};
get(30290) ->
    #dungeon_data{id = 30290,
		  name = lang:get(<<"达齐尔雪地109"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30300, unit_id = 20325,
		  items = [{5, 7400}, {22, 7700}, {1, 7700}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20325,
		  hook_items = [{5, 370}, {22, 385}, {1, 560}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 96615, energy_max = 22000, lev_limit = 33,
		  floor = 109};
get(30300) ->
    #dungeon_data{id = 30300,
		  name = lang:get(<<"达齐尔雪地110"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30310, unit_id = 20326,
		  items = [{5, 25900}, {22, 26950}, {1, 26950}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20326,
		  hook_items = [{5, 370}, {22, 385}, {1, 560}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  is_big = 1, power = 96878, energy_max = 22000,
		  lev_limit = 33, floor = 110};
get(30310) ->
    #dungeon_data{id = 30310,
		  name = lang:get(<<"达齐尔雪地111"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30320, unit_id = 20327,
		  items = [{5, 7400}, {22, 7900}, {1, 7800}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20327,
		  hook_items = [{5, 370}, {22, 395}, {1, 570}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 97140, energy_max = 22000, lev_limit = 33,
		  floor = 111};
get(30320) ->
    #dungeon_data{id = 30320,
		  name = lang:get(<<"达齐尔雪地112"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30330, unit_id = 20328,
		  items = [{5, 7600}, {22, 7900}, {1, 7800}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20328,
		  hook_items = [{5, 380}, {22, 395}, {1, 570}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 97403, energy_max = 22000, lev_limit = 35,
		  floor = 112};
get(30330) ->
    #dungeon_data{id = 30330,
		  name = lang:get(<<"达齐尔雪地113"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30340, unit_id = 20329,
		  items = [{5, 7600}, {22, 7900}, {1, 7800}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20329,
		  hook_items = [{5, 380}, {22, 395}, {1, 570}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 100075, energy_max = 22000, lev_limit = 35,
		  floor = 113};
get(30340) ->
    #dungeon_data{id = 30340,
		  name = lang:get(<<"达齐尔雪地114"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30350, unit_id = 20330,
		  items = [{5, 7600}, {22, 8100}, {1, 7900}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20330,
		  hook_items = [{5, 380}, {22, 405}, {1, 580}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 100338, energy_max = 22000, lev_limit = 35,
		  floor = 114};
get(30350) ->
    #dungeon_data{id = 30350,
		  name = lang:get(<<"达齐尔雪地115"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30360, unit_id = 20331,
		  items = [{5, 27300}, {22, 28350}, {1, 27650}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20331,
		  hook_items = [{5, 390}, {22, 405}, {1, 580}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  is_big = 1, power = 100600, energy_max = 22000,
		  lev_limit = 35, floor = 115};
get(30360) ->
    #dungeon_data{id = 30360,
		  name = lang:get(<<"达齐尔雪地116"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30370, unit_id = 20332,
		  items = [{5, 7800}, {22, 8100}, {1, 7900}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20332,
		  hook_items = [{5, 390}, {22, 405}, {1, 580}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 100863, energy_max = 22000, lev_limit = 35,
		  floor = 116};
get(30370) ->
    #dungeon_data{id = 30370,
		  name = lang:get(<<"达齐尔雪地117"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30380, unit_id = 20333,
		  items = [{5, 7800}, {22, 8300}, {1, 8000}, {7, 220}],
		  drop_ids = [30130, 20001, 20000], hook_unit_id = 20333,
		  hook_items = [{5, 390}, {22, 415}, {1, 590}, {7, 11}],
		  hook_drop_ids = [20130, 20001, 20000], time = 5,
		  power = 103556, energy_max = 22000, lev_limit = 35,
		  floor = 117};
get(30380) ->
    #dungeon_data{id = 30380,
		  name = lang:get(<<"达齐尔雪地118"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30390, unit_id = 20334,
		  items = [{5, 8000}, {22, 8300}, {1, 8000}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20334,
		  hook_items = [{5, 400}, {22, 415}, {1, 590}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 103818, energy_max = 22000, lev_limit = 37,
		  floor = 118};
get(30390) ->
    #dungeon_data{id = 30390,
		  name = lang:get(<<"达齐尔雪地119"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 30400, unit_id = 20335,
		  items = [{5, 8000}, {22, 8300}, {1, 8000}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20335,
		  hook_items = [{5, 400}, {22, 415}, {1, 590}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 104081, energy_max = 22000, lev_limit = 37,
		  floor = 119};
get(30400) ->
    #dungeon_data{id = 30400,
		  name = lang:get(<<"达齐尔雪地120"/utf8>>), chapter_id = 3,
		  mode = 1, next_id = 40010, unit_id = 20336,
		  items = [{5, 28000}, {22, 29750}, {1, 28350}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20336,
		  hook_items = [{5, 400}, {22, 425}, {1, 600}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  is_big = 1, power = 104343, energy_max = 22000,
		  lev_limit = 37, floor = 120};
get(40010) ->
    #dungeon_data{id = 40010,
		  name = lang:get(<<"安格拉玛山121"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40020, unit_id = 20337,
		  items = [{5, 8200}, {22, 8500}, {1, 8100}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20337,
		  hook_items = [{5, 410}, {22, 425}, {1, 600}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 107126, energy_max = 22000, lev_limit = 37,
		  floor = 121};
get(40020) ->
    #dungeon_data{id = 40020,
		  name = lang:get(<<"安格拉玛山122"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40030, unit_id = 20338,
		  items = [{5, 8200}, {22, 8500}, {1, 8100}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20338,
		  hook_items = [{5, 410}, {22, 425}, {1, 600}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 107388, energy_max = 22000, lev_limit = 37,
		  floor = 122};
get(40030) ->
    #dungeon_data{id = 40030,
		  name = lang:get(<<"安格拉玛山123"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40040, unit_id = 20339,
		  items = [{5, 8200}, {22, 8700}, {1, 8200}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20339,
		  hook_items = [{5, 410}, {22, 435}, {1, 610}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 107651, energy_max = 22000, lev_limit = 37,
		  floor = 123};
get(40040) ->
    #dungeon_data{id = 40040,
		  name = lang:get(<<"安格拉玛山124"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40050, unit_id = 20340,
		  items = [{5, 8400}, {22, 8700}, {1, 8200}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20340,
		  hook_items = [{5, 420}, {22, 435}, {1, 610}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 107913, energy_max = 22000, lev_limit = 39,
		  floor = 124};
get(40050) ->
    #dungeon_data{id = 40050,
		  name = lang:get(<<"安格拉玛山125"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40060, unit_id = 20341,
		  items = [{5, 29400}, {22, 30450}, {1, 28700}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20341,
		  hook_items = [{5, 420}, {22, 435}, {1, 610}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  is_big = 1, power = 117684, energy_max = 22000,
		  lev_limit = 39, floor = 125};
get(40060) ->
    #dungeon_data{id = 40060,
		  name = lang:get(<<"安格拉玛山126"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40070, unit_id = 20342,
		  items = [{5, 8400}, {22, 8900}, {1, 8300}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20342,
		  hook_items = [{5, 420}, {22, 445}, {1, 620}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 117946, energy_max = 22000, lev_limit = 39,
		  floor = 126};
get(40070) ->
    #dungeon_data{id = 40070,
		  name = lang:get(<<"安格拉玛山127"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40080, unit_id = 20401,
		  items = [{5, 8600}, {22, 8900}, {1, 8300}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20401,
		  hook_items = [{5, 430}, {22, 445}, {1, 620}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 118209, energy_max = 22000, lev_limit = 39,
		  floor = 127};
get(40080) ->
    #dungeon_data{id = 40080,
		  name = lang:get(<<"安格拉玛山128"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40090, unit_id = 20402,
		  items = [{5, 8600}, {22, 8900}, {1, 8300}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20402,
		  hook_items = [{5, 430}, {22, 445}, {1, 620}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 118471, energy_max = 22000, lev_limit = 39,
		  floor = 128};
get(40090) ->
    #dungeon_data{id = 40090,
		  name = lang:get(<<"安格拉玛山129"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40100, unit_id = 20403,
		  items = [{5, 8600}, {22, 9100}, {1, 8400}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20403,
		  hook_items = [{5, 430}, {22, 455}, {1, 630}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 121910, energy_max = 22000, lev_limit = 39,
		  floor = 129};
get(40100) ->
    #dungeon_data{id = 40100,
		  name = lang:get(<<"安格拉玛山130"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40110, unit_id = 20404,
		  items = [{5, 30800}, {22, 31850}, {1, 29400}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20404,
		  hook_items = [{5, 440}, {22, 455}, {1, 630}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  is_big = 1, power = 122172, energy_max = 22000,
		  lev_limit = 41, floor = 130};
get(40110) ->
    #dungeon_data{id = 40110,
		  name = lang:get(<<"安格拉玛山131"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40120, unit_id = 20405,
		  items = [{5, 8800}, {22, 9100}, {1, 8400}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20405,
		  hook_items = [{5, 440}, {22, 455}, {1, 630}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 122435, energy_max = 22000, lev_limit = 41,
		  floor = 131};
get(40120) ->
    #dungeon_data{id = 40120,
		  name = lang:get(<<"安格拉玛山132"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40130, unit_id = 20406,
		  items = [{5, 8800}, {22, 9300}, {1, 8500}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20406,
		  hook_items = [{5, 440}, {22, 465}, {1, 640}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 122697, energy_max = 22000, lev_limit = 41,
		  floor = 132};
get(40130) ->
    #dungeon_data{id = 40130,
		  name = lang:get(<<"安格拉玛山133"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40140, unit_id = 20407,
		  items = [{5, 9000}, {22, 9300}, {1, 8500}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20407,
		  hook_items = [{5, 450}, {22, 465}, {1, 640}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 126136, energy_max = 22000, lev_limit = 41,
		  floor = 133};
get(40140) ->
    #dungeon_data{id = 40140,
		  name = lang:get(<<"安格拉玛山134"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40150, unit_id = 20408,
		  items = [{5, 9000}, {22, 9300}, {1, 8500}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20408,
		  hook_items = [{5, 450}, {22, 465}, {1, 640}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 126399, energy_max = 22000, lev_limit = 41,
		  floor = 134};
get(40150) ->
    #dungeon_data{id = 40150,
		  name = lang:get(<<"安格拉玛山135"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40160, unit_id = 20409,
		  items = [{5, 31500}, {22, 33250}, {1, 30100}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20409,
		  hook_items = [{5, 450}, {22, 475}, {1, 650}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  is_big = 1, power = 126661, energy_max = 22000,
		  lev_limit = 41, floor = 135};
get(40160) ->
    #dungeon_data{id = 40160,
		  name = lang:get(<<"安格拉玛山136"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40170, unit_id = 20410,
		  items = [{5, 9200}, {22, 9500}, {1, 8600}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20410,
		  hook_items = [{5, 460}, {22, 475}, {1, 650}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 126924, energy_max = 22000, lev_limit = 43,
		  floor = 136};
get(40170) ->
    #dungeon_data{id = 40170,
		  name = lang:get(<<"安格拉玛山137"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40180, unit_id = 20411,
		  items = [{5, 9200}, {22, 9500}, {1, 8600}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20411,
		  hook_items = [{5, 460}, {22, 475}, {1, 650}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 130446, energy_max = 22000, lev_limit = 43,
		  floor = 137};
get(40180) ->
    #dungeon_data{id = 40180,
		  name = lang:get(<<"安格拉玛山138"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40190, unit_id = 20412,
		  items = [{5, 9200}, {22, 9700}, {1, 8700}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20412,
		  hook_items = [{5, 460}, {22, 485}, {1, 660}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 130709, energy_max = 22000, lev_limit = 43,
		  floor = 138};
get(40190) ->
    #dungeon_data{id = 40190,
		  name = lang:get(<<"安格拉玛山139"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40200, unit_id = 20413,
		  items = [{5, 9400}, {22, 9700}, {1, 8700}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20413,
		  hook_items = [{5, 470}, {22, 485}, {1, 660}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 130971, energy_max = 22000, lev_limit = 43,
		  floor = 139};
get(40200) ->
    #dungeon_data{id = 40200,
		  name = lang:get(<<"安格拉玛山140"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40210, unit_id = 20414,
		  items = [{5, 32900}, {22, 33950}, {1, 30450}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20414,
		  hook_items = [{5, 470}, {22, 485}, {1, 660}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  is_big = 1, power = 131234, energy_max = 22000,
		  lev_limit = 43, floor = 140};
get(40210) ->
    #dungeon_data{id = 40210,
		  name = lang:get(<<"安格拉玛山141"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40220, unit_id = 20415,
		  items = [{5, 9400}, {22, 9900}, {1, 8800}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20415,
		  hook_items = [{5, 470}, {22, 495}, {1, 670}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 134788, energy_max = 22000, lev_limit = 43,
		  floor = 141};
get(40220) ->
    #dungeon_data{id = 40220,
		  name = lang:get(<<"安格拉玛山142"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40230, unit_id = 20416,
		  items = [{5, 9600}, {22, 9900}, {1, 8800}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20416,
		  hook_items = [{5, 480}, {22, 495}, {1, 670}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 135051, energy_max = 22000, lev_limit = 45,
		  floor = 142};
get(40230) ->
    #dungeon_data{id = 40230,
		  name = lang:get(<<"安格拉玛山143"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40240, unit_id = 20417,
		  items = [{5, 9600}, {22, 9900}, {1, 8800}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20417,
		  hook_items = [{5, 480}, {22, 495}, {1, 670}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 135313, energy_max = 22000, lev_limit = 45,
		  floor = 143};
get(40240) ->
    #dungeon_data{id = 40240,
		  name = lang:get(<<"安格拉玛山144"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40250, unit_id = 20418,
		  items = [{5, 9600}, {22, 10100}, {1, 8900}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20418,
		  hook_items = [{5, 480}, {22, 505}, {1, 680}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 135576, energy_max = 22000, lev_limit = 45,
		  floor = 144};
get(40250) ->
    #dungeon_data{id = 40250,
		  name = lang:get(<<"安格拉玛山145"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40260, unit_id = 20419,
		  items = [{5, 34300}, {22, 35350}, {1, 31150}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20419,
		  hook_items = [{5, 490}, {22, 505}, {1, 680}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  is_big = 1, power = 139203, energy_max = 22000,
		  lev_limit = 45, floor = 145};
get(40260) ->
    #dungeon_data{id = 40260,
		  name = lang:get(<<"安格拉玛山146"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40270, unit_id = 20420,
		  items = [{5, 9800}, {22, 10100}, {1, 8900}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20420,
		  hook_items = [{5, 490}, {22, 505}, {1, 680}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 139466, energy_max = 22000, lev_limit = 45,
		  floor = 146};
get(40270) ->
    #dungeon_data{id = 40270,
		  name = lang:get(<<"安格拉玛山147"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40280, unit_id = 20421,
		  items = [{5, 9800}, {22, 10300}, {1, 9000}, {7, 220}],
		  drop_ids = [30140, 20001, 20000], hook_unit_id = 20421,
		  hook_items = [{5, 490}, {22, 515}, {1, 690}, {7, 11}],
		  hook_drop_ids = [20140, 20001, 20000], time = 5,
		  power = 139728, energy_max = 22000, lev_limit = 45,
		  floor = 147};
get(40280) ->
    #dungeon_data{id = 40280,
		  name = lang:get(<<"安格拉玛山148"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40290, unit_id = 20422,
		  items = [{5, 10000}, {22, 10300}, {1, 9000}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20422,
		  hook_items = [{5, 500}, {22, 515}, {1, 690}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 139991, energy_max = 22000, lev_limit = 47,
		  floor = 148};
get(40290) ->
    #dungeon_data{id = 40290,
		  name = lang:get(<<"安格拉玛山149"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40300, unit_id = 20423,
		  items = [{5, 10000}, {22, 10300}, {1, 9000}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20423,
		  hook_items = [{5, 500}, {22, 515}, {1, 690}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 143676, energy_max = 22000, lev_limit = 47,
		  floor = 149};
get(40300) ->
    #dungeon_data{id = 40300,
		  name = lang:get(<<"安格拉玛山150"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40310, unit_id = 20424,
		  items = [{5, 35000}, {22, 36750}, {1, 31850}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20424,
		  hook_items = [{5, 500}, {22, 525}, {1, 700}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  is_big = 1, power = 143939, energy_max = 22000,
		  lev_limit = 47, floor = 150};
get(40310) ->
    #dungeon_data{id = 40310,
		  name = lang:get(<<"安格拉玛山151"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40320, unit_id = 20425,
		  items = [{5, 10200}, {22, 10500}, {1, 9100}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20425,
		  hook_items = [{5, 510}, {22, 525}, {1, 700}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 144201, energy_max = 22000, lev_limit = 47,
		  floor = 151};
get(40320) ->
    #dungeon_data{id = 40320,
		  name = lang:get(<<"安格拉玛山152"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40330, unit_id = 20426,
		  items = [{5, 10200}, {22, 10500}, {1, 9100}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20426,
		  hook_items = [{5, 510}, {22, 525}, {1, 700}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 144464, energy_max = 22000, lev_limit = 47,
		  floor = 152};
get(40330) ->
    #dungeon_data{id = 40330,
		  name = lang:get(<<"安格拉玛山153"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40340, unit_id = 20427,
		  items = [{5, 10200}, {22, 10700}, {1, 9200}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20427,
		  hook_items = [{5, 510}, {22, 535}, {1, 710}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 144726, energy_max = 22000, lev_limit = 47,
		  floor = 153};
get(40340) ->
    #dungeon_data{id = 40340,
		  name = lang:get(<<"安格拉玛山154"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40350, unit_id = 20428,
		  items = [{5, 10400}, {22, 10700}, {1, 9200}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20428,
		  hook_items = [{5, 520}, {22, 535}, {1, 710}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 148181, energy_max = 22000, lev_limit = 49,
		  floor = 154};
get(40350) ->
    #dungeon_data{id = 40350,
		  name = lang:get(<<"安格拉玛山155"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40360, unit_id = 20429,
		  items = [{5, 36400}, {22, 37450}, {1, 32200}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20429,
		  hook_items = [{5, 520}, {22, 535}, {1, 710}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  is_big = 1, power = 148443, energy_max = 22000,
		  lev_limit = 49, floor = 155};
get(40360) ->
    #dungeon_data{id = 40360,
		  name = lang:get(<<"安格拉玛山156"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40370, unit_id = 20430,
		  items = [{5, 10400}, {22, 10900}, {1, 9300}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20430,
		  hook_items = [{5, 520}, {22, 545}, {1, 720}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 148706, energy_max = 22000, lev_limit = 49,
		  floor = 156};
get(40370) ->
    #dungeon_data{id = 40370,
		  name = lang:get(<<"安格拉玛山157"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40380, unit_id = 20431,
		  items = [{5, 10600}, {22, 10900}, {1, 9300}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20431,
		  hook_items = [{5, 530}, {22, 545}, {1, 720}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 148968, energy_max = 22000, lev_limit = 49,
		  floor = 157};
get(40380) ->
    #dungeon_data{id = 40380,
		  name = lang:get(<<"安格拉玛山158"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40390, unit_id = 20432,
		  items = [{5, 10600}, {22, 10900}, {1, 9300}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20432,
		  hook_items = [{5, 530}, {22, 545}, {1, 720}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 149231, energy_max = 22000, lev_limit = 49,
		  floor = 158};
get(40390) ->
    #dungeon_data{id = 40390,
		  name = lang:get(<<"安格拉玛山159"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 40400, unit_id = 20433,
		  items = [{5, 10600}, {22, 11100}, {1, 9400}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20433,
		  hook_items = [{5, 530}, {22, 555}, {1, 730}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 152754, energy_max = 22000, lev_limit = 49,
		  floor = 159};
get(40400) ->
    #dungeon_data{id = 40400,
		  name = lang:get(<<"安格拉玛山160"/utf8>>), chapter_id = 4,
		  mode = 1, next_id = 50010, unit_id = 20434,
		  items = [{5, 37800}, {22, 38850}, {1, 32900}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20434,
		  hook_items = [{5, 540}, {22, 555}, {1, 730}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  is_big = 1, power = 153016, energy_max = 22000,
		  lev_limit = 51, floor = 160};
get(50010) ->
    #dungeon_data{id = 50010,
		  name = lang:get(<<"波克利雪山161"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50020, unit_id = 20435,
		  items = [{5, 10800}, {22, 11100}, {1, 9400}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20435,
		  hook_items = [{5, 540}, {22, 555}, {1, 730}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 153279, energy_max = 22000, lev_limit = 51,
		  floor = 161};
get(50020) ->
    #dungeon_data{id = 50020,
		  name = lang:get(<<"波克利雪山162"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50030, unit_id = 20436,
		  items = [{5, 10800}, {22, 11300}, {1, 9500}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20436,
		  hook_items = [{5, 540}, {22, 565}, {1, 740}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 153541, energy_max = 22000, lev_limit = 51,
		  floor = 162};
get(50030) ->
    #dungeon_data{id = 50030,
		  name = lang:get(<<"波克利雪山163"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50040, unit_id = 20437,
		  items = [{5, 11000}, {22, 11300}, {1, 9500}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20437,
		  hook_items = [{5, 550}, {22, 565}, {1, 740}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 153804, energy_max = 22000, lev_limit = 51,
		  floor = 163};
get(50040) ->
    #dungeon_data{id = 50040,
		  name = lang:get(<<"波克利雪山164"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50050, unit_id = 20438,
		  items = [{5, 11000}, {22, 11300}, {1, 9500}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20438,
		  hook_items = [{5, 550}, {22, 565}, {1, 740}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 157368, energy_max = 22000, lev_limit = 51,
		  floor = 164};
get(50050) ->
    #dungeon_data{id = 50050,
		  name = lang:get(<<"波克利雪山165"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50060, unit_id = 20439,
		  items = [{5, 38500}, {22, 40250}, {1, 33600}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20439,
		  hook_items = [{5, 550}, {22, 575}, {1, 750}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  is_big = 1, power = 157631, energy_max = 22000,
		  lev_limit = 51, floor = 165};
get(50060) ->
    #dungeon_data{id = 50060,
		  name = lang:get(<<"波克利雪山166"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50070, unit_id = 20440,
		  items = [{5, 11200}, {22, 11500}, {1, 9600}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20440,
		  hook_items = [{5, 560}, {22, 575}, {1, 750}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 157893, energy_max = 22000, lev_limit = 53,
		  floor = 166};
get(50070) ->
    #dungeon_data{id = 50070,
		  name = lang:get(<<"波克利雪山167"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50080, unit_id = 20441,
		  items = [{5, 11200}, {22, 11500}, {1, 9600}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20441,
		  hook_items = [{5, 560}, {22, 575}, {1, 750}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 158156, energy_max = 22000, lev_limit = 53,
		  floor = 167};
get(50080) ->
    #dungeon_data{id = 50080,
		  name = lang:get(<<"波克利雪山168"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50090, unit_id = 20442,
		  items = [{5, 11200}, {22, 11700}, {1, 9700}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20442,
		  hook_items = [{5, 560}, {22, 585}, {1, 760}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 158418, energy_max = 22000, lev_limit = 53,
		  floor = 168};
get(50090) ->
    #dungeon_data{id = 50090,
		  name = lang:get(<<"波克利雪山169"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50100, unit_id = 20501,
		  items = [{5, 11400}, {22, 11700}, {1, 9700}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20501,
		  hook_items = [{5, 570}, {22, 585}, {1, 760}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 165275, energy_max = 22000, lev_limit = 53,
		  floor = 169};
get(50100) ->
    #dungeon_data{id = 50100,
		  name = lang:get(<<"波克利雪山170"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50110, unit_id = 20502,
		  items = [{5, 39900}, {22, 40950}, {1, 33950}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20502,
		  hook_items = [{5, 570}, {22, 585}, {1, 760}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  is_big = 1, power = 165537, energy_max = 22000,
		  lev_limit = 53, floor = 170};
get(50110) ->
    #dungeon_data{id = 50110,
		  name = lang:get(<<"波克利雪山171"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50120, unit_id = 20503,
		  items = [{5, 11400}, {22, 11900}, {1, 9800}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20503,
		  hook_items = [{5, 570}, {22, 595}, {1, 770}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 165800, energy_max = 22000, lev_limit = 53,
		  floor = 171};
get(50120) ->
    #dungeon_data{id = 50120,
		  name = lang:get(<<"波克利雪山172"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50130, unit_id = 20504,
		  items = [{5, 11600}, {22, 11900}, {1, 9800}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20504,
		  hook_items = [{5, 580}, {22, 595}, {1, 770}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 166062, energy_max = 22000, lev_limit = 55,
		  floor = 172};
get(50130) ->
    #dungeon_data{id = 50130,
		  name = lang:get(<<"波克利雪山173"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50140, unit_id = 20505,
		  items = [{5, 11600}, {22, 11900}, {1, 9800}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20505,
		  hook_items = [{5, 580}, {22, 595}, {1, 770}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 166325, energy_max = 22000, lev_limit = 55,
		  floor = 173};
get(50140) ->
    #dungeon_data{id = 50140,
		  name = lang:get(<<"波克利雪山174"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50150, unit_id = 20506,
		  items = [{5, 11600}, {22, 12100}, {1, 9900}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20506,
		  hook_items = [{5, 580}, {22, 605}, {1, 780}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 170304, energy_max = 22000, lev_limit = 55,
		  floor = 174};
get(50150) ->
    #dungeon_data{id = 50150,
		  name = lang:get(<<"波克利雪山175"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50160, unit_id = 20507,
		  items = [{5, 41300}, {22, 42350}, {1, 34650}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20507,
		  hook_items = [{5, 590}, {22, 605}, {1, 780}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  is_big = 1, power = 170567, energy_max = 22000,
		  lev_limit = 55, floor = 175};
get(50160) ->
    #dungeon_data{id = 50160,
		  name = lang:get(<<"波克利雪山176"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50170, unit_id = 20508,
		  items = [{5, 11800}, {22, 12100}, {1, 9900}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20508,
		  hook_items = [{5, 590}, {22, 605}, {1, 780}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 170829, energy_max = 22000, lev_limit = 55,
		  floor = 176};
get(50170) ->
    #dungeon_data{id = 50170,
		  name = lang:get(<<"波克利雪山177"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50180, unit_id = 20509,
		  items = [{5, 11800}, {22, 12300}, {1, 10000}, {7, 220}],
		  drop_ids = [30150, 20001, 20000], hook_unit_id = 20509,
		  hook_items = [{5, 590}, {22, 615}, {1, 790}, {7, 11}],
		  hook_drop_ids = [20150, 20001, 20000], time = 5,
		  power = 171092, energy_max = 22000, lev_limit = 55,
		  floor = 177};
get(50180) ->
    #dungeon_data{id = 50180,
		  name = lang:get(<<"波克利雪山178"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50190, unit_id = 20510,
		  items = [{5, 12000}, {22, 12300}, {1, 10000}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20510,
		  hook_items = [{5, 600}, {22, 615}, {1, 790}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 171354, energy_max = 22000, lev_limit = 57,
		  floor = 178};
get(50190) ->
    #dungeon_data{id = 50190,
		  name = lang:get(<<"波克利雪山179"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50200, unit_id = 20511,
		  items = [{5, 12000}, {22, 12300}, {1, 10000}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20511,
		  hook_items = [{5, 600}, {22, 615}, {1, 790}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 175418, energy_max = 22000, lev_limit = 57,
		  floor = 179};
get(50200) ->
    #dungeon_data{id = 50200,
		  name = lang:get(<<"波克利雪山180"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50210, unit_id = 20512,
		  items = [{5, 42000}, {22, 43750}, {1, 35350}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20512,
		  hook_items = [{5, 600}, {22, 625}, {1, 800}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  is_big = 1, power = 175680, energy_max = 22000,
		  lev_limit = 57, floor = 180};
get(50210) ->
    #dungeon_data{id = 50210,
		  name = lang:get(<<"波克利雪山181"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50220, unit_id = 20513,
		  items = [{5, 12200}, {22, 12500}, {1, 10100}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20513,
		  hook_items = [{5, 610}, {22, 625}, {1, 800}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 175943, energy_max = 22000, lev_limit = 57,
		  floor = 181};
get(50220) ->
    #dungeon_data{id = 50220,
		  name = lang:get(<<"波克利雪山182"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50230, unit_id = 20514,
		  items = [{5, 12200}, {22, 12500}, {1, 10100}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20514,
		  hook_items = [{5, 610}, {22, 625}, {1, 800}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 176205, energy_max = 22000, lev_limit = 57,
		  floor = 182};
get(50230) ->
    #dungeon_data{id = 50230,
		  name = lang:get(<<"波克利雪山183"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50240, unit_id = 20515,
		  items = [{5, 12200}, {22, 12700}, {1, 10200}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20515,
		  hook_items = [{5, 610}, {22, 635}, {1, 810}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 176468, energy_max = 22000, lev_limit = 57,
		  floor = 183};
get(50240) ->
    #dungeon_data{id = 50240,
		  name = lang:get(<<"波克利雪山184"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50250, unit_id = 20516,
		  items = [{5, 12400}, {22, 12700}, {1, 10200}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20516,
		  hook_items = [{5, 620}, {22, 635}, {1, 810}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 180552, energy_max = 22000, lev_limit = 59,
		  floor = 184};
get(50250) ->
    #dungeon_data{id = 50250,
		  name = lang:get(<<"波克利雪山185"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50260, unit_id = 20517,
		  items = [{5, 43400}, {22, 44450}, {1, 35700}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20517,
		  hook_items = [{5, 620}, {22, 635}, {1, 810}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  is_big = 1, power = 180815, energy_max = 22000,
		  lev_limit = 59, floor = 185};
get(50260) ->
    #dungeon_data{id = 50260,
		  name = lang:get(<<"波克利雪山186"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50270, unit_id = 20518,
		  items = [{5, 12400}, {22, 12900}, {1, 10300}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20518,
		  hook_items = [{5, 620}, {22, 645}, {1, 820}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 181077, energy_max = 22000, lev_limit = 59,
		  floor = 186};
get(50270) ->
    #dungeon_data{id = 50270,
		  name = lang:get(<<"波克利雪山187"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50280, unit_id = 20519,
		  items = [{5, 12600}, {22, 12900}, {1, 10300}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20519,
		  hook_items = [{5, 630}, {22, 645}, {1, 820}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 181340, energy_max = 22000, lev_limit = 59,
		  floor = 187};
get(50280) ->
    #dungeon_data{id = 50280,
		  name = lang:get(<<"波克利雪山188"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50290, unit_id = 20520,
		  items = [{5, 12600}, {22, 12900}, {1, 10300}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20520,
		  hook_items = [{5, 630}, {22, 645}, {1, 820}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 181602, energy_max = 22000, lev_limit = 59,
		  floor = 188};
get(50290) ->
    #dungeon_data{id = 50290,
		  name = lang:get(<<"波克利雪山189"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50300, unit_id = 20521,
		  items = [{5, 12600}, {22, 13100}, {1, 10400}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20521,
		  hook_items = [{5, 630}, {22, 655}, {1, 830}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 185776, energy_max = 22000, lev_limit = 59,
		  floor = 189};
get(50300) ->
    #dungeon_data{id = 50300,
		  name = lang:get(<<"波克利雪山190"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50310, unit_id = 20522,
		  items = [{5, 44800}, {22, 45850}, {1, 36400}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20522,
		  hook_items = [{5, 640}, {22, 655}, {1, 830}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  is_big = 1, power = 186039, energy_max = 22000,
		  lev_limit = 61, floor = 190};
get(50310) ->
    #dungeon_data{id = 50310,
		  name = lang:get(<<"波克利雪山191"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50320, unit_id = 20523,
		  items = [{5, 12800}, {22, 13100}, {1, 10400}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20523,
		  hook_items = [{5, 640}, {22, 655}, {1, 830}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 186301, energy_max = 22000, lev_limit = 61,
		  floor = 191};
get(50320) ->
    #dungeon_data{id = 50320,
		  name = lang:get(<<"波克利雪山192"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50330, unit_id = 20524,
		  items = [{5, 12800}, {22, 13300}, {1, 10500}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20524,
		  hook_items = [{5, 640}, {22, 665}, {1, 840}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 186564, energy_max = 22000, lev_limit = 61,
		  floor = 192};
get(50330) ->
    #dungeon_data{id = 50330,
		  name = lang:get(<<"波克利雪山193"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50340, unit_id = 20525,
		  items = [{5, 13000}, {22, 13300}, {1, 10500}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20525,
		  hook_items = [{5, 650}, {22, 665}, {1, 840}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 186826, energy_max = 22000, lev_limit = 61,
		  floor = 193};
get(50340) ->
    #dungeon_data{id = 50340,
		  name = lang:get(<<"波克利雪山194"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50350, unit_id = 20526,
		  items = [{5, 13000}, {22, 13300}, {1, 10500}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20526,
		  hook_items = [{5, 650}, {22, 665}, {1, 840}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 198639, energy_max = 22000, lev_limit = 61,
		  floor = 194};
get(50350) ->
    #dungeon_data{id = 50350,
		  name = lang:get(<<"波克利雪山195"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50360, unit_id = 20527,
		  items = [{5, 45500}, {22, 47250}, {1, 37100}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20527,
		  hook_items = [{5, 650}, {22, 675}, {1, 850}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  is_big = 1, power = 198901, energy_max = 22000,
		  lev_limit = 61, floor = 195};
get(50360) ->
    #dungeon_data{id = 50360,
		  name = lang:get(<<"波克利雪山196"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50370, unit_id = 20528,
		  items = [{5, 13200}, {22, 13500}, {1, 10600}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20528,
		  hook_items = [{5, 660}, {22, 675}, {1, 850}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 199164, energy_max = 22000, lev_limit = 63,
		  floor = 196};
get(50370) ->
    #dungeon_data{id = 50370,
		  name = lang:get(<<"波克利雪山197"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50380, unit_id = 20529,
		  items = [{5, 13200}, {22, 13500}, {1, 10600}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20529,
		  hook_items = [{5, 660}, {22, 675}, {1, 850}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 199426, energy_max = 22000, lev_limit = 63,
		  floor = 197};
get(50380) ->
    #dungeon_data{id = 50380,
		  name = lang:get(<<"波克利雪山198"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50390, unit_id = 20530,
		  items = [{5, 13200}, {22, 13700}, {1, 10700}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20530,
		  hook_items = [{5, 660}, {22, 685}, {1, 860}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 199689, energy_max = 22000, lev_limit = 63,
		  floor = 198};
get(50390) ->
    #dungeon_data{id = 50390,
		  name = lang:get(<<"波克利雪山199"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 50400, unit_id = 20531,
		  items = [{5, 13400}, {22, 13700}, {1, 10700}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20531,
		  hook_items = [{5, 670}, {22, 685}, {1, 860}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 204429, energy_max = 22000, lev_limit = 63,
		  floor = 199};
get(50400) ->
    #dungeon_data{id = 50400,
		  name = lang:get(<<"波克利雪山200"/utf8>>), chapter_id = 5,
		  mode = 1, next_id = 60010, unit_id = 20532,
		  items = [{5, 46900}, {22, 47950}, {1, 37450}, {7, 220}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20532,
		  hook_items = [{5, 670}, {22, 685}, {1, 860}, {7, 11}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  is_big = 1, power = 204692, energy_max = 22000,
		  lev_limit = 63, floor = 200};
get(60010) ->
    #dungeon_data{id = 60010,
		  name = lang:get(<<"乌尔黎森林201"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60020, unit_id = 20533,
		  items = [{5, 13400}, {22, 13900}, {1, 10800}, {7, 240}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20533,
		  hook_items = [{5, 670}, {22, 695}, {1, 870}, {7, 12}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 204954, energy_max = 22000, lev_limit = 63,
		  floor = 201};
get(60020) ->
    #dungeon_data{id = 60020,
		  name = lang:get(<<"乌尔黎森林202"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60030, unit_id = 20534,
		  items = [{5, 13600}, {22, 13900}, {1, 10800}, {7, 240}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20534,
		  hook_items = [{5, 680}, {22, 695}, {1, 870}, {7, 12}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 205217, energy_max = 22000, lev_limit = 65,
		  floor = 202};
get(60030) ->
    #dungeon_data{id = 60030,
		  name = lang:get(<<"乌尔黎森林203"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60040, unit_id = 20535,
		  items = [{5, 13600}, {22, 13900}, {1, 10800}, {7, 240}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20535,
		  hook_items = [{5, 680}, {22, 695}, {1, 870}, {7, 12}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 205479, energy_max = 22000, lev_limit = 65,
		  floor = 203};
get(60040) ->
    #dungeon_data{id = 60040,
		  name = lang:get(<<"乌尔黎森林204"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60050, unit_id = 20536,
		  items = [{5, 13600}, {22, 14100}, {1, 10900}, {7, 240}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20536,
		  hook_items = [{5, 680}, {22, 705}, {1, 880}, {7, 12}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 210283, energy_max = 22000, lev_limit = 65,
		  floor = 204};
get(60050) ->
    #dungeon_data{id = 60050,
		  name = lang:get(<<"乌尔黎森林205"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60060, unit_id = 20537,
		  items = [{5, 48300}, {22, 49350}, {1, 38150}, {7, 240}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20537,
		  hook_items = [{5, 690}, {22, 705}, {1, 880}, {7, 12}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  is_big = 1, power = 210546, energy_max = 22000,
		  lev_limit = 65, floor = 205};
get(60060) ->
    #dungeon_data{id = 60060,
		  name = lang:get(<<"乌尔黎森林206"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60070, unit_id = 20538,
		  items = [{5, 13800}, {22, 14100}, {1, 10900}, {7, 240}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20538,
		  hook_items = [{5, 690}, {22, 705}, {1, 880}, {7, 12}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 210808, energy_max = 22000, lev_limit = 65,
		  floor = 206};
get(60070) ->
    #dungeon_data{id = 60070,
		  name = lang:get(<<"乌尔黎森林207"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60080, unit_id = 20539,
		  items = [{5, 13800}, {22, 14300}, {1, 11000}, {7, 240}],
		  drop_ids = [30160, 20001, 20000], hook_unit_id = 20539,
		  hook_items = [{5, 690}, {22, 715}, {1, 890}, {7, 12}],
		  hook_drop_ids = [20160, 20001, 20000], time = 5,
		  power = 211071, energy_max = 22000, lev_limit = 65,
		  floor = 207};
get(60080) ->
    #dungeon_data{id = 60080,
		  name = lang:get(<<"乌尔黎森林208"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60090, unit_id = 20540,
		  items = [{5, 14000}, {22, 14300}, {1, 11000}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20540,
		  hook_items = [{5, 700}, {22, 715}, {1, 890}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 211333, energy_max = 22000, lev_limit = 67,
		  floor = 208};
get(60090) ->
    #dungeon_data{id = 60090,
		  name = lang:get(<<"乌尔黎森林209"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60100, unit_id = 20541,
		  items = [{5, 14000}, {22, 14300}, {1, 11000}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20541,
		  hook_items = [{5, 700}, {22, 715}, {1, 890}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 211596, energy_max = 22000, lev_limit = 67,
		  floor = 209};
get(60100) ->
    #dungeon_data{id = 60100,
		  name = lang:get(<<"乌尔黎森林210"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60110, unit_id = 20542,
		  items = [{5, 49000}, {22, 50750}, {1, 38850}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20542,
		  hook_items = [{5, 700}, {22, 725}, {1, 900}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  is_big = 1, power = 216200, energy_max = 22000,
		  lev_limit = 67, floor = 210};
get(60110) ->
    #dungeon_data{id = 60110,
		  name = lang:get(<<"乌尔黎森林211"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60120, unit_id = 20601,
		  items = [{5, 14200}, {22, 14500}, {1, 11100}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20601,
		  hook_items = [{5, 710}, {22, 725}, {1, 900}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 216462, energy_max = 22000, lev_limit = 67,
		  floor = 211};
get(60120) ->
    #dungeon_data{id = 60120,
		  name = lang:get(<<"乌尔黎森林212"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60130, unit_id = 20602,
		  items = [{5, 14200}, {22, 14500}, {1, 11100}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20602,
		  hook_items = [{5, 710}, {22, 725}, {1, 900}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 216725, energy_max = 22000, lev_limit = 67,
		  floor = 212};
get(60130) ->
    #dungeon_data{id = 60130,
		  name = lang:get(<<"乌尔黎森林213"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60140, unit_id = 20603,
		  items = [{5, 14200}, {22, 14700}, {1, 11200}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20603,
		  hook_items = [{5, 710}, {22, 735}, {1, 910}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 216987, energy_max = 22000, lev_limit = 67,
		  floor = 213};
get(60140) ->
    #dungeon_data{id = 60140,
		  name = lang:get(<<"乌尔黎森林214"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60150, unit_id = 20604,
		  items = [{5, 14400}, {22, 14700}, {1, 11200}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20604,
		  hook_items = [{5, 720}, {22, 735}, {1, 910}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 217250, energy_max = 22000, lev_limit = 69,
		  floor = 214};
get(60150) ->
    #dungeon_data{id = 60150,
		  name = lang:get(<<"乌尔黎森林215"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60160, unit_id = 20605,
		  items = [{5, 50400}, {22, 51450}, {1, 39200}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20605,
		  hook_items = [{5, 720}, {22, 735}, {1, 910}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  is_big = 1, power = 217512, energy_max = 22000,
		  lev_limit = 69, floor = 215};
get(60160) ->
    #dungeon_data{id = 60160,
		  name = lang:get(<<"乌尔黎森林216"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60170, unit_id = 20606,
		  items = [{5, 14400}, {22, 14900}, {1, 11300}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20606,
		  hook_items = [{5, 720}, {22, 745}, {1, 920}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 222190, energy_max = 22000, lev_limit = 69,
		  floor = 216};
get(60170) ->
    #dungeon_data{id = 60170,
		  name = lang:get(<<"乌尔黎森林217"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60180, unit_id = 20607,
		  items = [{5, 14600}, {22, 14900}, {1, 11300}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20607,
		  hook_items = [{5, 730}, {22, 745}, {1, 920}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 222453, energy_max = 22000, lev_limit = 69,
		  floor = 217};
get(60180) ->
    #dungeon_data{id = 60180,
		  name = lang:get(<<"乌尔黎森林218"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60190, unit_id = 20608,
		  items = [{5, 14600}, {22, 14900}, {1, 11300}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20608,
		  hook_items = [{5, 730}, {22, 745}, {1, 920}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 222715, energy_max = 22000, lev_limit = 69,
		  floor = 218};
get(60190) ->
    #dungeon_data{id = 60190,
		  name = lang:get(<<"乌尔黎森林219"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60200, unit_id = 20609,
		  items = [{5, 14600}, {22, 15100}, {1, 11400}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20609,
		  hook_items = [{5, 730}, {22, 755}, {1, 930}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 222978, energy_max = 22000, lev_limit = 69,
		  floor = 219};
get(60200) ->
    #dungeon_data{id = 60200,
		  name = lang:get(<<"乌尔黎森林220"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60210, unit_id = 20610,
		  items = [{5, 51800}, {22, 52850}, {1, 39900}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20610,
		  hook_items = [{5, 740}, {22, 755}, {1, 930}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  is_big = 1, power = 223240, energy_max = 22000,
		  lev_limit = 71, floor = 220};
get(60210) ->
    #dungeon_data{id = 60210,
		  name = lang:get(<<"乌尔黎森林221"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60220, unit_id = 20611,
		  items = [{5, 14800}, {22, 15100}, {1, 11400}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20611,
		  hook_items = [{5, 740}, {22, 755}, {1, 930}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 223503, energy_max = 22000, lev_limit = 71,
		  floor = 221};
get(60220) ->
    #dungeon_data{id = 60220,
		  name = lang:get(<<"乌尔黎森林222"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60230, unit_id = 20612,
		  items = [{5, 14800}, {22, 15300}, {1, 11500}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20612,
		  hook_items = [{5, 740}, {22, 765}, {1, 940}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 232365, energy_max = 22000, lev_limit = 71,
		  floor = 222};
get(60230) ->
    #dungeon_data{id = 60230,
		  name = lang:get(<<"乌尔黎森林223"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60240, unit_id = 20613,
		  items = [{5, 15000}, {22, 15300}, {1, 11500}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20613,
		  hook_items = [{5, 750}, {22, 765}, {1, 940}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 232627, energy_max = 22000, lev_limit = 71,
		  floor = 223};
get(60240) ->
    #dungeon_data{id = 60240,
		  name = lang:get(<<"乌尔黎森林224"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60250, unit_id = 20614,
		  items = [{5, 15000}, {22, 15300}, {1, 11500}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20614,
		  hook_items = [{5, 750}, {22, 765}, {1, 940}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 232890, energy_max = 22000, lev_limit = 71,
		  floor = 224};
get(60250) ->
    #dungeon_data{id = 60250,
		  name = lang:get(<<"乌尔黎森林225"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60260, unit_id = 20615,
		  items = [{5, 52500}, {22, 54250}, {1, 40600}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20615,
		  hook_items = [{5, 750}, {22, 775}, {1, 950}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  is_big = 1, power = 233152, energy_max = 22000,
		  lev_limit = 71, floor = 225};
get(60260) ->
    #dungeon_data{id = 60260,
		  name = lang:get(<<"乌尔黎森林226"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60270, unit_id = 20616,
		  items = [{5, 15200}, {22, 15500}, {1, 11600}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20616,
		  hook_items = [{5, 760}, {22, 775}, {1, 950}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 233415, energy_max = 22000, lev_limit = 73,
		  floor = 226};
get(60270) ->
    #dungeon_data{id = 60270,
		  name = lang:get(<<"乌尔黎森林227"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60280, unit_id = 20617,
		  items = [{5, 15200}, {22, 15500}, {1, 11600}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20617,
		  hook_items = [{5, 760}, {22, 775}, {1, 950}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 233677, energy_max = 22000, lev_limit = 73,
		  floor = 227};
get(60280) ->
    #dungeon_data{id = 60280,
		  name = lang:get(<<"乌尔黎森林228"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60290, unit_id = 20618,
		  items = [{5, 15200}, {22, 15700}, {1, 11700}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20618,
		  hook_items = [{5, 760}, {22, 785}, {1, 960}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 238896, energy_max = 22000, lev_limit = 73,
		  floor = 228};
get(60290) ->
    #dungeon_data{id = 60290,
		  name = lang:get(<<"乌尔黎森林229"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60300, unit_id = 20619,
		  items = [{5, 15400}, {22, 15700}, {1, 11700}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20619,
		  hook_items = [{5, 770}, {22, 785}, {1, 960}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 239158, energy_max = 22000, lev_limit = 73,
		  floor = 229};
get(60300) ->
    #dungeon_data{id = 60300,
		  name = lang:get(<<"乌尔黎森林230"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60310, unit_id = 20620,
		  items = [{5, 53900}, {22, 54950}, {1, 40950}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20620,
		  hook_items = [{5, 770}, {22, 785}, {1, 960}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  is_big = 1, power = 239421, energy_max = 22000,
		  lev_limit = 73, floor = 230};
get(60310) ->
    #dungeon_data{id = 60310,
		  name = lang:get(<<"乌尔黎森林231"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60320, unit_id = 20621,
		  items = [{5, 15400}, {22, 15900}, {1, 11800}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20621,
		  hook_items = [{5, 770}, {22, 795}, {1, 970}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 239683, energy_max = 22000, lev_limit = 73,
		  floor = 231};
get(60320) ->
    #dungeon_data{id = 60320,
		  name = lang:get(<<"乌尔黎森林232"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60330, unit_id = 20622,
		  items = [{5, 15600}, {22, 15900}, {1, 11800}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20622,
		  hook_items = [{5, 780}, {22, 795}, {1, 970}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 239946, energy_max = 22000, lev_limit = 75,
		  floor = 232};
get(60330) ->
    #dungeon_data{id = 60330,
		  name = lang:get(<<"乌尔黎森林233"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60340, unit_id = 20623,
		  items = [{5, 15600}, {22, 15900}, {1, 11800}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20623,
		  hook_items = [{5, 780}, {22, 795}, {1, 970}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 240208, energy_max = 22000, lev_limit = 75,
		  floor = 233};
get(60340) ->
    #dungeon_data{id = 60340,
		  name = lang:get(<<"乌尔黎森林234"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60350, unit_id = 20624,
		  items = [{5, 15600}, {22, 16100}, {1, 11900}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20624,
		  hook_items = [{5, 780}, {22, 805}, {1, 980}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 245484, energy_max = 22000, lev_limit = 75,
		  floor = 234};
get(60350) ->
    #dungeon_data{id = 60350,
		  name = lang:get(<<"乌尔黎森林235"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60360, unit_id = 20625,
		  items = [{5, 55300}, {22, 56350}, {1, 41650}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20625,
		  hook_items = [{5, 790}, {22, 805}, {1, 980}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  is_big = 1, power = 245747, energy_max = 22000,
		  lev_limit = 75, floor = 235};
get(60360) ->
    #dungeon_data{id = 60360,
		  name = lang:get(<<"乌尔黎森林236"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60370, unit_id = 20626,
		  items = [{5, 15800}, {22, 16100}, {1, 11900}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20626,
		  hook_items = [{5, 790}, {22, 805}, {1, 980}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 246009, energy_max = 22000, lev_limit = 75,
		  floor = 236};
get(60370) ->
    #dungeon_data{id = 60370,
		  name = lang:get(<<"乌尔黎森林237"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60380, unit_id = 20627,
		  items = [{5, 15800}, {22, 16300}, {1, 12000}, {7, 240}],
		  drop_ids = [30170, 20001, 20000], hook_unit_id = 20627,
		  hook_items = [{5, 790}, {22, 815}, {1, 990}, {7, 12}],
		  hook_drop_ids = [20170, 20001, 20000], time = 5,
		  power = 246272, energy_max = 22000, lev_limit = 75,
		  floor = 237};
get(60380) ->
    #dungeon_data{id = 60380,
		  name = lang:get(<<"乌尔黎森林238"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60390, unit_id = 20628,
		  items = [{5, 16000}, {22, 16300}, {1, 12000}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20628,
		  hook_items = [{5, 800}, {22, 815}, {1, 990}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 246534, energy_max = 22000, lev_limit = 77,
		  floor = 238};
get(60390) ->
    #dungeon_data{id = 60390,
		  name = lang:get(<<"乌尔黎森林239"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 60400, unit_id = 20629,
		  items = [{5, 16000}, {22, 16300}, {1, 12000}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20629,
		  hook_items = [{5, 800}, {22, 815}, {1, 990}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 246797, energy_max = 22000, lev_limit = 77,
		  floor = 239};
get(60400) ->
    #dungeon_data{id = 60400,
		  name = lang:get(<<"乌尔黎森林240"/utf8>>), chapter_id = 6,
		  mode = 1, next_id = 70010, unit_id = 20630,
		  items = [{5, 56000}, {22, 57750}, {1, 42350}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20630,
		  hook_items = [{5, 800}, {22, 825}, {1, 1000}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  is_big = 1, power = 252126, energy_max = 22000,
		  lev_limit = 77, floor = 240};
get(70010) ->
    #dungeon_data{id = 70010,
		  name = lang:get(<<"冰冠冰川241"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70020, unit_id = 20631,
		  items = [{5, 16200}, {22, 16500}, {1, 12100}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20631,
		  hook_items = [{5, 810}, {22, 825}, {1, 1000}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 252388, energy_max = 22000, lev_limit = 77,
		  floor = 241};
get(70020) ->
    #dungeon_data{id = 70020,
		  name = lang:get(<<"冰冠冰川242"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70030, unit_id = 20632,
		  items = [{5, 16200}, {22, 16500}, {1, 12100}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20632,
		  hook_items = [{5, 810}, {22, 825}, {1, 1000}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 252651, energy_max = 22000, lev_limit = 77,
		  floor = 242};
get(70030) ->
    #dungeon_data{id = 70030,
		  name = lang:get(<<"冰冠冰川243"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70040, unit_id = 20633,
		  items = [{5, 16200}, {22, 16700}, {1, 12200}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20633,
		  hook_items = [{5, 810}, {22, 835}, {1, 1010}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 252913, energy_max = 22000, lev_limit = 77,
		  floor = 243};
get(70040) ->
    #dungeon_data{id = 70040,
		  name = lang:get(<<"冰冠冰川244"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70050, unit_id = 20634,
		  items = [{5, 16400}, {22, 16700}, {1, 12200}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20634,
		  hook_items = [{5, 820}, {22, 835}, {1, 1010}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 253176, energy_max = 22000, lev_limit = 79,
		  floor = 244};
get(70050) ->
    #dungeon_data{id = 70050,
		  name = lang:get(<<"冰冠冰川245"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70060, unit_id = 20635,
		  items = [{5, 57400}, {22, 58450}, {1, 42700}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20635,
		  hook_items = [{5, 820}, {22, 835}, {1, 1010}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  is_big = 1, power = 253438, energy_max = 22000,
		  lev_limit = 79, floor = 245};
get(70060) ->
    #dungeon_data{id = 70060,
		  name = lang:get(<<"冰冠冰川246"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70070, unit_id = 20636,
		  items = [{5, 16400}, {22, 16900}, {1, 12300}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20636,
		  hook_items = [{5, 820}, {22, 845}, {1, 1020}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 258867, energy_max = 22000, lev_limit = 79,
		  floor = 246};
get(70070) ->
    #dungeon_data{id = 70070,
		  name = lang:get(<<"冰冠冰川247"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70080, unit_id = 20637,
		  items = [{5, 16600}, {22, 16900}, {1, 12300}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20637,
		  hook_items = [{5, 830}, {22, 845}, {1, 1020}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 259129, energy_max = 22000, lev_limit = 79,
		  floor = 247};
get(70080) ->
    #dungeon_data{id = 70080,
		  name = lang:get(<<"冰冠冰川248"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70090, unit_id = 20638,
		  items = [{5, 16600}, {22, 16900}, {1, 12300}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20638,
		  hook_items = [{5, 830}, {22, 845}, {1, 1020}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 259392, energy_max = 22000, lev_limit = 79,
		  floor = 248};
get(70090) ->
    #dungeon_data{id = 70090,
		  name = lang:get(<<"冰冠冰川249"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70100, unit_id = 20639,
		  items = [{5, 16600}, {22, 17100}, {1, 12400}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20639,
		  hook_items = [{5, 830}, {22, 855}, {1, 1030}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000], time = 5,
		  power = 259654, energy_max = 22000, lev_limit = 79,
		  floor = 249};
get(70100) ->
    #dungeon_data{id = 70100,
		  name = lang:get(<<"冰冠冰川250"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70110, unit_id = 20640,
		  items = [{5, 58800}, {22, 59850}, {1, 43400}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20640,
		  hook_items = [{5, 840}, {22, 855}, {1, 1030}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  is_big = 1, power = 259917, energy_max = 22000,
		  lev_limit = 81, floor = 250};
get(70110) ->
    #dungeon_data{id = 70110,
		  name = lang:get(<<"冰冠冰川251"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70120, unit_id = 20641,
		  items = [{5, 16800}, {22, 17100}, {1, 12400}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20641,
		  hook_items = [{5, 840}, {22, 855}, {1, 1030}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 260179, energy_max = 22000, lev_limit = 81,
		  floor = 251};
get(70120) ->
    #dungeon_data{id = 70120,
		  name = lang:get(<<"冰冠冰川252"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70130, unit_id = 20642,
		  items = [{5, 16800}, {22, 17300}, {1, 12500}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20642,
		  hook_items = [{5, 840}, {22, 865}, {1, 1040}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 265713, energy_max = 22000, lev_limit = 81,
		  floor = 252};
get(70130) ->
    #dungeon_data{id = 70130,
		  name = lang:get(<<"冰冠冰川253"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70140, unit_id = 20701,
		  items = [{5, 17000}, {22, 17300}, {1, 12500}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20701,
		  hook_items = [{5, 850}, {22, 865}, {1, 1040}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 265975, energy_max = 22000, lev_limit = 81,
		  floor = 253};
get(70140) ->
    #dungeon_data{id = 70140,
		  name = lang:get(<<"冰冠冰川254"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70150, unit_id = 20702,
		  items = [{5, 17000}, {22, 17300}, {1, 12500}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20702,
		  hook_items = [{5, 850}, {22, 865}, {1, 1040}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 266238, energy_max = 22000, lev_limit = 81,
		  floor = 254};
get(70150) ->
    #dungeon_data{id = 70150,
		  name = lang:get(<<"冰冠冰川255"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70160, unit_id = 20703,
		  items = [{5, 59500}, {22, 61250}, {1, 44100}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20703,
		  hook_items = [{5, 850}, {22, 875}, {1, 1050}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  is_big = 1, power = 266500, energy_max = 22000,
		  lev_limit = 81, floor = 255};
get(70160) ->
    #dungeon_data{id = 70160,
		  name = lang:get(<<"冰冠冰川256"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70170, unit_id = 20704,
		  items = [{5, 17200}, {22, 17500}, {1, 12600}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20704,
		  hook_items = [{5, 860}, {22, 875}, {1, 1050}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 266763, energy_max = 22000, lev_limit = 83,
		  floor = 256};
get(70170) ->
    #dungeon_data{id = 70170,
		  name = lang:get(<<"冰冠冰川257"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70180, unit_id = 20705,
		  items = [{5, 17200}, {22, 17500}, {1, 12600}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20705,
		  hook_items = [{5, 860}, {22, 875}, {1, 1050}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 267025, energy_max = 22000, lev_limit = 83,
		  floor = 257};
get(70180) ->
    #dungeon_data{id = 70180,
		  name = lang:get(<<"冰冠冰川258"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70190, unit_id = 20706,
		  items = [{5, 17200}, {22, 17700}, {1, 12700}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20706,
		  hook_items = [{5, 860}, {22, 885}, {1, 1060}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 272606, energy_max = 22000, lev_limit = 83,
		  floor = 258};
get(70190) ->
    #dungeon_data{id = 70190,
		  name = lang:get(<<"冰冠冰川259"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70200, unit_id = 20707,
		  items = [{5, 17400}, {22, 17700}, {1, 12700}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20707,
		  hook_items = [{5, 870}, {22, 885}, {1, 1060}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 272868, energy_max = 22000, lev_limit = 83,
		  floor = 259};
get(70200) ->
    #dungeon_data{id = 70200,
		  name = lang:get(<<"冰冠冰川260"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70210, unit_id = 20708,
		  items = [{5, 60900}, {22, 61950}, {1, 44450}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20708,
		  hook_items = [{5, 870}, {22, 885}, {1, 1060}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  is_big = 1, power = 273131, energy_max = 22000,
		  lev_limit = 83, floor = 260};
get(70210) ->
    #dungeon_data{id = 70210,
		  name = lang:get(<<"冰冠冰川261"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70220, unit_id = 20709,
		  items = [{5, 17400}, {22, 17900}, {1, 12800}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20709,
		  hook_items = [{5, 870}, {22, 895}, {1, 1070}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 273393, energy_max = 22000, lev_limit = 83,
		  floor = 261};
get(70220) ->
    #dungeon_data{id = 70220,
		  name = lang:get(<<"冰冠冰川262"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70230, unit_id = 20710,
		  items = [{5, 17600}, {22, 17900}, {1, 12800}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20710,
		  hook_items = [{5, 880}, {22, 895}, {1, 1070}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 273656, energy_max = 22000, lev_limit = 85,
		  floor = 262};
get(70230) ->
    #dungeon_data{id = 70230,
		  name = lang:get(<<"冰冠冰川263"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70240, unit_id = 20711,
		  items = [{5, 17600}, {22, 17900}, {1, 12800}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20711,
		  hook_items = [{5, 880}, {22, 895}, {1, 1070}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 273918, energy_max = 22000, lev_limit = 85,
		  floor = 263};
get(70240) ->
    #dungeon_data{id = 70240,
		  name = lang:get(<<"冰冠冰川264"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70250, unit_id = 20712,
		  items = [{5, 17600}, {22, 18100}, {1, 12900}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20712,
		  hook_items = [{5, 880}, {22, 905}, {1, 1080}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 279546, energy_max = 22000, lev_limit = 85,
		  floor = 264};
get(70250) ->
    #dungeon_data{id = 70250,
		  name = lang:get(<<"冰冠冰川265"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70260, unit_id = 20713,
		  items = [{5, 62300}, {22, 63350}, {1, 45150}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20713,
		  hook_items = [{5, 890}, {22, 905}, {1, 1080}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  is_big = 1, power = 279809, energy_max = 22000,
		  lev_limit = 85, floor = 265};
get(70260) ->
    #dungeon_data{id = 70260,
		  name = lang:get(<<"冰冠冰川266"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70270, unit_id = 20714,
		  items = [{5, 17800}, {22, 18100}, {1, 12900}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20714,
		  hook_items = [{5, 890}, {22, 905}, {1, 1080}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 280071, energy_max = 22000, lev_limit = 85,
		  floor = 266};
get(70270) ->
    #dungeon_data{id = 70270,
		  name = lang:get(<<"冰冠冰川267"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70280, unit_id = 20715,
		  items = [{5, 17800}, {22, 18300}, {1, 13000}, {7, 240}],
		  drop_ids = [30180, 20001, 20000], hook_unit_id = 20715,
		  hook_items = [{5, 890}, {22, 915}, {1, 1090}, {7, 12}],
		  hook_drop_ids = [20180, 20001, 20000, 20004], time = 5,
		  power = 280334, energy_max = 22000, lev_limit = 85,
		  floor = 267};
get(70280) ->
    #dungeon_data{id = 70280,
		  name = lang:get(<<"冰冠冰川268"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70290, unit_id = 20716,
		  items = [{5, 18000}, {22, 18300}, {1, 13000}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20716,
		  hook_items = [{5, 900}, {22, 915}, {1, 1090}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 280596, energy_max = 22000, lev_limit = 87,
		  floor = 268};
get(70290) ->
    #dungeon_data{id = 70290,
		  name = lang:get(<<"冰冠冰川269"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70300, unit_id = 20717,
		  items = [{5, 18000}, {22, 18300}, {1, 13000}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20717,
		  hook_items = [{5, 900}, {22, 915}, {1, 1090}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 280859, energy_max = 22000, lev_limit = 87,
		  floor = 269};
get(70300) ->
    #dungeon_data{id = 70300,
		  name = lang:get(<<"冰冠冰川270"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70310, unit_id = 20718,
		  items = [{5, 63000}, {22, 64750}, {1, 45850}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20718,
		  hook_items = [{5, 900}, {22, 925}, {1, 1100}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  is_big = 1, power = 286623, energy_max = 22000,
		  lev_limit = 87, floor = 270};
get(70310) ->
    #dungeon_data{id = 70310,
		  name = lang:get(<<"冰冠冰川271"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70320, unit_id = 20719,
		  items = [{5, 18200}, {22, 18500}, {1, 13100}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20719,
		  hook_items = [{5, 910}, {22, 925}, {1, 1100}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 286886, energy_max = 22000, lev_limit = 87,
		  floor = 271};
get(70320) ->
    #dungeon_data{id = 70320,
		  name = lang:get(<<"冰冠冰川272"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70330, unit_id = 20720,
		  items = [{5, 18200}, {22, 18500}, {1, 13100}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20720,
		  hook_items = [{5, 910}, {22, 925}, {1, 1100}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 287148, energy_max = 22000, lev_limit = 87,
		  floor = 272};
get(70330) ->
    #dungeon_data{id = 70330,
		  name = lang:get(<<"冰冠冰川273"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70340, unit_id = 20721,
		  items = [{5, 18200}, {22, 18700}, {1, 13200}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20721,
		  hook_items = [{5, 910}, {22, 935}, {1, 1110}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 287411, energy_max = 22000, lev_limit = 87,
		  floor = 273};
get(70340) ->
    #dungeon_data{id = 70340,
		  name = lang:get(<<"冰冠冰川274"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70350, unit_id = 20722,
		  items = [{5, 18400}, {22, 18700}, {1, 13200}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20722,
		  hook_items = [{5, 920}, {22, 935}, {1, 1110}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 287673, energy_max = 22000, lev_limit = 89,
		  floor = 274};
get(70350) ->
    #dungeon_data{id = 70350,
		  name = lang:get(<<"冰冠冰川275"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70360, unit_id = 20723,
		  items = [{5, 64400}, {22, 65450}, {1, 46200}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20723,
		  hook_items = [{5, 920}, {22, 935}, {1, 1110}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  is_big = 1, power = 287936, energy_max = 22000,
		  lev_limit = 89, floor = 275};
get(70360) ->
    #dungeon_data{id = 70360,
		  name = lang:get(<<"冰冠冰川276"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70370, unit_id = 20724,
		  items = [{5, 18400}, {22, 18900}, {1, 13300}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20724,
		  hook_items = [{5, 920}, {22, 945}, {1, 1120}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 293763, energy_max = 22000, lev_limit = 89,
		  floor = 276};
get(70370) ->
    #dungeon_data{id = 70370,
		  name = lang:get(<<"冰冠冰川277"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70380, unit_id = 20725,
		  items = [{5, 18600}, {22, 18900}, {1, 13300}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20725,
		  hook_items = [{5, 930}, {22, 945}, {1, 1120}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 294026, energy_max = 22000, lev_limit = 89,
		  floor = 277};
get(70380) ->
    #dungeon_data{id = 70380,
		  name = lang:get(<<"冰冠冰川278"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70390, unit_id = 20726,
		  items = [{5, 18600}, {22, 18900}, {1, 13300}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20726,
		  hook_items = [{5, 930}, {22, 945}, {1, 1120}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 294288, energy_max = 22000, lev_limit = 89,
		  floor = 278};
get(70390) ->
    #dungeon_data{id = 70390,
		  name = lang:get(<<"冰冠冰川279"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 70400, unit_id = 20727,
		  items = [{5, 18600}, {22, 19100}, {1, 13400}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20727,
		  hook_items = [{5, 930}, {22, 955}, {1, 1130}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  power = 294551, energy_max = 22000, lev_limit = 89,
		  floor = 279};
get(70400) ->
    #dungeon_data{id = 70400,
		  name = lang:get(<<"冰冠冰川280"/utf8>>), chapter_id = 7,
		  mode = 1, next_id = 80010, unit_id = 20728,
		  items = [{5, 65800}, {22, 66850}, {1, 46900}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20728,
		  hook_items = [{5, 940}, {22, 955}, {1, 1130}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004], time = 5,
		  is_big = 1, power = 294813, energy_max = 22000,
		  lev_limit = 91, floor = 280};
get(80010) ->
    #dungeon_data{id = 80010,
		  name = lang:get(<<"斐尼雪山281"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80020, unit_id = 20729,
		  items = [{5, 18800}, {22, 19100}, {1, 13400}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20729,
		  hook_items = [{5, 940}, {22, 955}, {1, 1130}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 295076, energy_max = 22000,
		  lev_limit = 91, floor = 281};
get(80020) ->
    #dungeon_data{id = 80020,
		  name = lang:get(<<"斐尼雪山282"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80030, unit_id = 20730,
		  items = [{5, 18800}, {22, 19300}, {1, 13500}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20730,
		  hook_items = [{5, 940}, {22, 965}, {1, 1140}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 305781, energy_max = 22000,
		  lev_limit = 91, floor = 282};
get(80030) ->
    #dungeon_data{id = 80030,
		  name = lang:get(<<"斐尼雪山283"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80040, unit_id = 20731,
		  items = [{5, 19000}, {22, 19300}, {1, 13500}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20731,
		  hook_items = [{5, 950}, {22, 965}, {1, 1140}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 306043, energy_max = 22000,
		  lev_limit = 91, floor = 283};
get(80040) ->
    #dungeon_data{id = 80040,
		  name = lang:get(<<"斐尼雪山284"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80050, unit_id = 20732,
		  items = [{5, 19000}, {22, 19300}, {1, 13500}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20732,
		  hook_items = [{5, 950}, {22, 965}, {1, 1140}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 306306, energy_max = 22000,
		  lev_limit = 91, floor = 284};
get(80050) ->
    #dungeon_data{id = 80050,
		  name = lang:get(<<"斐尼雪山285"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80060, unit_id = 20733,
		  items = [{5, 66500}, {22, 68250}, {1, 47600}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20733,
		  hook_items = [{5, 950}, {22, 975}, {1, 1150}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 306568,
		  energy_max = 22000, lev_limit = 91, floor = 285};
get(80060) ->
    #dungeon_data{id = 80060,
		  name = lang:get(<<"斐尼雪山286"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80070, unit_id = 20734,
		  items = [{5, 19200}, {22, 19500}, {1, 13600}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20734,
		  hook_items = [{5, 960}, {22, 975}, {1, 1150}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 306831, energy_max = 22000,
		  lev_limit = 93, floor = 286};
get(80070) ->
    #dungeon_data{id = 80070,
		  name = lang:get(<<"斐尼雪山287"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80080, unit_id = 20735,
		  items = [{5, 19200}, {22, 19500}, {1, 13600}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20735,
		  hook_items = [{5, 960}, {22, 975}, {1, 1150}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 307093, energy_max = 22000,
		  lev_limit = 93, floor = 287};
get(80080) ->
    #dungeon_data{id = 80080,
		  name = lang:get(<<"斐尼雪山288"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80090, unit_id = 20736,
		  items = [{5, 19200}, {22, 19700}, {1, 13700}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20736,
		  hook_items = [{5, 960}, {22, 985}, {1, 1160}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 313451, energy_max = 22000,
		  lev_limit = 93, floor = 288};
get(80090) ->
    #dungeon_data{id = 80090,
		  name = lang:get(<<"斐尼雪山289"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80100, unit_id = 20737,
		  items = [{5, 19400}, {22, 19700}, {1, 13700}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20737,
		  hook_items = [{5, 970}, {22, 985}, {1, 1160}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 313713, energy_max = 22000,
		  lev_limit = 93, floor = 289};
get(80100) ->
    #dungeon_data{id = 80100,
		  name = lang:get(<<"斐尼雪山290"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80110, unit_id = 20738,
		  items = [{5, 67900}, {22, 68950}, {1, 47950}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20738,
		  hook_items = [{5, 970}, {22, 985}, {1, 1160}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 313976,
		  energy_max = 22000, lev_limit = 93, floor = 290};
get(80110) ->
    #dungeon_data{id = 80110,
		  name = lang:get(<<"斐尼雪山291"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80120, unit_id = 20739,
		  items = [{5, 19400}, {22, 19900}, {1, 13800}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20739,
		  hook_items = [{5, 970}, {22, 995}, {1, 1170}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 314238, energy_max = 22000,
		  lev_limit = 93, floor = 291};
get(80120) ->
    #dungeon_data{id = 80120,
		  name = lang:get(<<"斐尼雪山292"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80130, unit_id = 20740,
		  items = [{5, 19600}, {22, 19900}, {1, 13800}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20740,
		  hook_items = [{5, 980}, {22, 995}, {1, 1170}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 314501, energy_max = 22000,
		  lev_limit = 95, floor = 292};
get(80130) ->
    #dungeon_data{id = 80130,
		  name = lang:get(<<"斐尼雪山293"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80140, unit_id = 20741,
		  items = [{5, 19600}, {22, 19900}, {1, 13800}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20741,
		  hook_items = [{5, 980}, {22, 995}, {1, 1170}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 314763, energy_max = 22000,
		  lev_limit = 95, floor = 293};
get(80140) ->
    #dungeon_data{id = 80140,
		  name = lang:get(<<"斐尼雪山294"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80150, unit_id = 20742,
		  items = [{5, 19600}, {22, 20100}, {1, 13900}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20742,
		  hook_items = [{5, 980}, {22, 1005}, {1, 1180}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 321195, energy_max = 22000,
		  lev_limit = 95, floor = 294};
get(80150) ->
    #dungeon_data{id = 80150,
		  name = lang:get(<<"斐尼雪山295"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80160, unit_id = 20801,
		  items = [{5, 69300}, {22, 70350}, {1, 48650}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20801,
		  hook_items = [{5, 990}, {22, 1005}, {1, 1180}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 321457,
		  energy_max = 22000, lev_limit = 95, floor = 295};
get(80160) ->
    #dungeon_data{id = 80160,
		  name = lang:get(<<"斐尼雪山296"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80170, unit_id = 20802,
		  items = [{5, 19800}, {22, 20100}, {1, 13900}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20802,
		  hook_items = [{5, 990}, {22, 1005}, {1, 1180}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 321720, energy_max = 22000,
		  lev_limit = 95, floor = 296};
get(80170) ->
    #dungeon_data{id = 80170,
		  name = lang:get(<<"斐尼雪山297"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80180, unit_id = 20803,
		  items = [{5, 19800}, {22, 20300}, {1, 14000}, {7, 240}],
		  drop_ids = [30190, 20001, 20000], hook_unit_id = 20803,
		  hook_items = [{5, 990}, {22, 1015}, {1, 1190}, {7, 12}],
		  hook_drop_ids = [20190, 20001, 20000, 20004, 20005],
		  time = 5, power = 321982, energy_max = 22000,
		  lev_limit = 95, floor = 297};
get(80180) ->
    #dungeon_data{id = 80180,
		  name = lang:get(<<"斐尼雪山298"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80190, unit_id = 20804,
		  items = [{5, 20000}, {22, 20300}, {1, 14000}, {7, 240}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20804,
		  hook_items =
		      [{5, 1000}, {22, 1015}, {1, 1190}, {7, 12}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 322245, energy_max = 22000,
		  lev_limit = 97, floor = 298};
get(80190) ->
    #dungeon_data{id = 80190,
		  name = lang:get(<<"斐尼雪山299"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80200, unit_id = 20805,
		  items = [{5, 20000}, {22, 20300}, {1, 14000}, {7, 240}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20805,
		  hook_items =
		      [{5, 1000}, {22, 1015}, {1, 1190}, {7, 12}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 322507, energy_max = 22000,
		  lev_limit = 97, floor = 299};
get(80200) ->
    #dungeon_data{id = 80200,
		  name = lang:get(<<"斐尼雪山300"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80210, unit_id = 20806,
		  items = [{5, 70000}, {22, 71750}, {1, 49350}, {7, 240}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20806,
		  hook_items =
		      [{5, 1000}, {22, 1025}, {1, 1200}, {7, 12}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 329038,
		  energy_max = 22000, lev_limit = 97, floor = 300};
get(80210) ->
    #dungeon_data{id = 80210,
		  name = lang:get(<<"斐尼雪山301"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80220, unit_id = 20807,
		  items = [{5, 20200}, {22, 20500}, {1, 14100}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20807,
		  hook_items =
		      [{5, 1010}, {22, 1025}, {1, 1200}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 329301, energy_max = 22000,
		  lev_limit = 97, floor = 301};
get(80220) ->
    #dungeon_data{id = 80220,
		  name = lang:get(<<"斐尼雪山302"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80230, unit_id = 20808,
		  items = [{5, 20200}, {22, 20500}, {1, 14100}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20808,
		  hook_items =
		      [{5, 1010}, {22, 1025}, {1, 1200}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 329563, energy_max = 22000,
		  lev_limit = 97, floor = 302};
get(80230) ->
    #dungeon_data{id = 80230,
		  name = lang:get(<<"斐尼雪山303"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80240, unit_id = 20809,
		  items = [{5, 20200}, {22, 20700}, {1, 14200}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20809,
		  hook_items =
		      [{5, 1010}, {22, 1035}, {1, 1210}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 329826, energy_max = 22000,
		  lev_limit = 97, floor = 303};
get(80240) ->
    #dungeon_data{id = 80240,
		  name = lang:get(<<"斐尼雪山304"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80250, unit_id = 20810,
		  items = [{5, 20400}, {22, 20700}, {1, 14200}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20810,
		  hook_items =
		      [{5, 1020}, {22, 1035}, {1, 1210}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 330088, energy_max = 22000,
		  lev_limit = 99, floor = 304};
get(80250) ->
    #dungeon_data{id = 80250,
		  name = lang:get(<<"斐尼雪山305"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80260, unit_id = 20811,
		  items = [{5, 71400}, {22, 72450}, {1, 49700}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20811,
		  hook_items =
		      [{5, 1020}, {22, 1035}, {1, 1210}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 330351,
		  energy_max = 22000, lev_limit = 99, floor = 305};
get(80260) ->
    #dungeon_data{id = 80260,
		  name = lang:get(<<"斐尼雪山306"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80270, unit_id = 20812,
		  items = [{5, 20400}, {22, 20900}, {1, 14300}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20812,
		  hook_items =
		      [{5, 1020}, {22, 1045}, {1, 1220}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 336971, energy_max = 22000,
		  lev_limit = 99, floor = 306};
get(80270) ->
    #dungeon_data{id = 80270,
		  name = lang:get(<<"斐尼雪山307"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80280, unit_id = 20813,
		  items = [{5, 20600}, {22, 20900}, {1, 14300}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20813,
		  hook_items =
		      [{5, 1030}, {22, 1045}, {1, 1220}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 337233, energy_max = 22000,
		  lev_limit = 99, floor = 307};
get(80280) ->
    #dungeon_data{id = 80280,
		  name = lang:get(<<"斐尼雪山308"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80290, unit_id = 20814,
		  items = [{5, 20600}, {22, 20900}, {1, 14300}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20814,
		  hook_items =
		      [{5, 1030}, {22, 1045}, {1, 1220}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 337496, energy_max = 22000,
		  lev_limit = 99, floor = 308};
get(80290) ->
    #dungeon_data{id = 80290,
		  name = lang:get(<<"斐尼雪山309"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80300, unit_id = 20815,
		  items = [{5, 20600}, {22, 21100}, {1, 14400}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20815,
		  hook_items =
		      [{5, 1030}, {22, 1055}, {1, 1230}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 337758, energy_max = 22000,
		  lev_limit = 99, floor = 309};
get(80300) ->
    #dungeon_data{id = 80300,
		  name = lang:get(<<"斐尼雪山310"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80310, unit_id = 20816,
		  items = [{5, 72800}, {22, 73850}, {1, 50400}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20816,
		  hook_items =
		      [{5, 1040}, {22, 1055}, {1, 1230}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 344961,
		  energy_max = 22000, lev_limit = 101, floor = 310};
get(80310) ->
    #dungeon_data{id = 80310,
		  name = lang:get(<<"斐尼雪山311"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80320, unit_id = 20817,
		  items = [{5, 20800}, {22, 21100}, {1, 14400}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20817,
		  hook_items =
		      [{5, 1040}, {22, 1055}, {1, 1230}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 345224, energy_max = 22000,
		  lev_limit = 101, floor = 311};
get(80320) ->
    #dungeon_data{id = 80320,
		  name = lang:get(<<"斐尼雪山312"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80330, unit_id = 20818,
		  items = [{5, 20800}, {22, 21300}, {1, 14500}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20818,
		  hook_items =
		      [{5, 1040}, {22, 1065}, {1, 1240}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 345486, energy_max = 22000,
		  lev_limit = 101, floor = 312};
get(80330) ->
    #dungeon_data{id = 80330,
		  name = lang:get(<<"斐尼雪山313"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80340, unit_id = 20819,
		  items = [{5, 21000}, {22, 21300}, {1, 14500}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20819,
		  hook_items =
		      [{5, 1050}, {22, 1065}, {1, 1240}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 345749, energy_max = 22000,
		  lev_limit = 101, floor = 313};
get(80340) ->
    #dungeon_data{id = 80340,
		  name = lang:get(<<"斐尼雪山314"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80350, unit_id = 20820,
		  items = [{5, 21000}, {22, 21300}, {1, 14500}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20820,
		  hook_items =
		      [{5, 1050}, {22, 1065}, {1, 1240}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 346011, energy_max = 22000,
		  lev_limit = 101, floor = 314};
get(80350) ->
    #dungeon_data{id = 80350,
		  name = lang:get(<<"斐尼雪山315"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80360, unit_id = 20821,
		  items = [{5, 73500}, {22, 75250}, {1, 51100}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20821,
		  hook_items =
		      [{5, 1050}, {22, 1075}, {1, 1250}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 353598,
		  energy_max = 22000, lev_limit = 101, floor = 315};
get(80360) ->
    #dungeon_data{id = 80360,
		  name = lang:get(<<"斐尼雪山316"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80370, unit_id = 20822,
		  items = [{5, 21200}, {22, 21500}, {1, 14600}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20822,
		  hook_items =
		      [{5, 1060}, {22, 1075}, {1, 1250}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 353860, energy_max = 22000,
		  lev_limit = 103, floor = 316};
get(80370) ->
    #dungeon_data{id = 80370,
		  name = lang:get(<<"斐尼雪山317"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80380, unit_id = 20823,
		  items = [{5, 21200}, {22, 21500}, {1, 14600}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20823,
		  hook_items =
		      [{5, 1060}, {22, 1075}, {1, 1250}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 354123, energy_max = 22000,
		  lev_limit = 103, floor = 317};
get(80380) ->
    #dungeon_data{id = 80380,
		  name = lang:get(<<"斐尼雪山318"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80390, unit_id = 20824,
		  items = [{5, 21200}, {22, 21700}, {1, 14700}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20824,
		  hook_items =
		      [{5, 1060}, {22, 1085}, {1, 1260}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 354385, energy_max = 22000,
		  lev_limit = 103, floor = 318};
get(80390) ->
    #dungeon_data{id = 80390,
		  name = lang:get(<<"斐尼雪山319"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 80400, unit_id = 20825,
		  items = [{5, 21400}, {22, 21700}, {1, 14700}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20825,
		  hook_items =
		      [{5, 1070}, {22, 1085}, {1, 1260}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 354648, energy_max = 22000,
		  lev_limit = 103, floor = 319};
get(80400) ->
    #dungeon_data{id = 80400,
		  name = lang:get(<<"斐尼雪山320"/utf8>>), chapter_id = 8,
		  mode = 1, next_id = 90010, unit_id = 20826,
		  items = [{5, 74900}, {22, 75950}, {1, 51450}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20826,
		  hook_items =
		      [{5, 1070}, {22, 1085}, {1, 1260}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 362318,
		  energy_max = 22000, lev_limit = 103, floor = 320};
get(90010) ->
    #dungeon_data{id = 90010,
		  name = lang:get(<<"旭日平原321"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90020, unit_id = 20827,
		  items = [{5, 21400}, {22, 21900}, {1, 14800}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20827,
		  hook_items =
		      [{5, 1070}, {22, 1095}, {1, 1270}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 362580, energy_max = 22000,
		  lev_limit = 103, floor = 321};
get(90020) ->
    #dungeon_data{id = 90020,
		  name = lang:get(<<"旭日平原322"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90030, unit_id = 20828,
		  items = [{5, 21600}, {22, 21900}, {1, 14800}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20828,
		  hook_items =
		      [{5, 1080}, {22, 1095}, {1, 1270}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 362843, energy_max = 22000,
		  lev_limit = 105, floor = 322};
get(90030) ->
    #dungeon_data{id = 90030,
		  name = lang:get(<<"旭日平原323"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90040, unit_id = 20829,
		  items = [{5, 21600}, {22, 21900}, {1, 14800}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20829,
		  hook_items =
		      [{5, 1080}, {22, 1095}, {1, 1270}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 363105, energy_max = 22000,
		  lev_limit = 105, floor = 323};
get(90040) ->
    #dungeon_data{id = 90040,
		  name = lang:get(<<"旭日平原324"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90050, unit_id = 20830,
		  items = [{5, 21600}, {22, 22100}, {1, 14900}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20830,
		  hook_items =
		      [{5, 1080}, {22, 1105}, {1, 1280}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 363368, energy_max = 22000,
		  lev_limit = 105, floor = 324};
get(90050) ->
    #dungeon_data{id = 90050,
		  name = lang:get(<<"旭日平原325"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90060, unit_id = 20831,
		  items = [{5, 76300}, {22, 77350}, {1, 52150}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20831,
		  hook_items =
		      [{5, 1090}, {22, 1105}, {1, 1280}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 371143,
		  energy_max = 22000, lev_limit = 105, floor = 325};
get(90060) ->
    #dungeon_data{id = 90060,
		  name = lang:get(<<"旭日平原326"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90070, unit_id = 20832,
		  items = [{5, 21800}, {22, 22100}, {1, 14900}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20832,
		  hook_items =
		      [{5, 1090}, {22, 1105}, {1, 1280}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 371406, energy_max = 22000,
		  lev_limit = 105, floor = 326};
get(90070) ->
    #dungeon_data{id = 90070,
		  name = lang:get(<<"旭日平原327"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90080, unit_id = 20833,
		  items = [{5, 21800}, {22, 22300}, {1, 15000}, {7, 260}],
		  drop_ids = [30200, 20001, 20000], hook_unit_id = 20833,
		  hook_items =
		      [{5, 1090}, {22, 1115}, {1, 1290}, {7, 13}],
		  hook_drop_ids = [20200, 20001, 20000, 20004, 20005],
		  time = 5, power = 371668, energy_max = 22000,
		  lev_limit = 105, floor = 327};
get(90080) ->
    #dungeon_data{id = 90080,
		  name = lang:get(<<"旭日平原328"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90090, unit_id = 20834,
		  items = [{5, 22000}, {22, 22300}, {1, 15000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20834,
		  hook_items =
		      [{5, 1100}, {22, 1115}, {1, 1290}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 371931, energy_max = 22000,
		  lev_limit = 107, floor = 328};
get(90090) ->
    #dungeon_data{id = 90090,
		  name = lang:get(<<"旭日平原329"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90100, unit_id = 20835,
		  items = [{5, 22000}, {22, 22300}, {1, 15000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20835,
		  hook_items =
		      [{5, 1100}, {22, 1115}, {1, 1290}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 372193, energy_max = 22000,
		  lev_limit = 107, floor = 329};
get(90100) ->
    #dungeon_data{id = 90100,
		  name = lang:get(<<"旭日平原330"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90110, unit_id = 20836,
		  items = [{5, 77000}, {22, 78750}, {1, 52850}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20836,
		  hook_items =
		      [{5, 1100}, {22, 1125}, {1, 1300}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 380052,
		  energy_max = 22000, lev_limit = 107, floor = 330};
get(90110) ->
    #dungeon_data{id = 90110,
		  name = lang:get(<<"旭日平原331"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90120, unit_id = 20837,
		  items = [{5, 22200}, {22, 22500}, {1, 15100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20837,
		  hook_items =
		      [{5, 1110}, {22, 1125}, {1, 1300}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 380315, energy_max = 22000,
		  lev_limit = 107, floor = 331};
get(90120) ->
    #dungeon_data{id = 90120,
		  name = lang:get(<<"旭日平原332"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90130, unit_id = 20838,
		  items = [{5, 22200}, {22, 22500}, {1, 15100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20838,
		  hook_items =
		      [{5, 1110}, {22, 1125}, {1, 1300}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 380577, energy_max = 22000,
		  lev_limit = 107, floor = 332};
get(90130) ->
    #dungeon_data{id = 90130,
		  name = lang:get(<<"旭日平原333"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90140, unit_id = 20839,
		  items = [{5, 22200}, {22, 22700}, {1, 15200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20839,
		  hook_items =
		      [{5, 1110}, {22, 1135}, {1, 1310}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 380840, energy_max = 22000,
		  lev_limit = 107, floor = 333};
get(90140) ->
    #dungeon_data{id = 90140,
		  name = lang:get(<<"旭日平原334"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90150, unit_id = 20840,
		  items = [{5, 22400}, {22, 22700}, {1, 15200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20840,
		  hook_items =
		      [{5, 1120}, {22, 1135}, {1, 1310}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 381102, energy_max = 22000,
		  lev_limit = 109, floor = 334};
get(90150) ->
    #dungeon_data{id = 90150,
		  name = lang:get(<<"旭日平原335"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90160, unit_id = 20841,
		  items = [{5, 78400}, {22, 79450}, {1, 53200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20841,
		  hook_items =
		      [{5, 1120}, {22, 1135}, {1, 1310}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 394920,
		  energy_max = 22000, lev_limit = 109, floor = 335};
get(90160) ->
    #dungeon_data{id = 90160,
		  name = lang:get(<<"旭日平原336"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90170, unit_id = 20842,
		  items = [{5, 22400}, {22, 22900}, {1, 15300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20842,
		  hook_items =
		      [{5, 1120}, {22, 1145}, {1, 1320}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 395183, energy_max = 22000,
		  lev_limit = 109, floor = 336};
get(90170) ->
    #dungeon_data{id = 90170,
		  name = lang:get(<<"旭日平原337"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90180, unit_id = 20901,
		  items = [{5, 22600}, {22, 22900}, {1, 15300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20901,
		  hook_items =
		      [{5, 1130}, {22, 1145}, {1, 1320}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 395445, energy_max = 22000,
		  lev_limit = 109, floor = 337};
get(90180) ->
    #dungeon_data{id = 90180,
		  name = lang:get(<<"旭日平原338"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90190, unit_id = 20902,
		  items = [{5, 22600}, {22, 22900}, {1, 15300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20902,
		  hook_items =
		      [{5, 1130}, {22, 1145}, {1, 1320}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 395708, energy_max = 22000,
		  lev_limit = 109, floor = 338};
get(90190) ->
    #dungeon_data{id = 90190,
		  name = lang:get(<<"旭日平原339"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90200, unit_id = 20903,
		  items = [{5, 22600}, {22, 23100}, {1, 15400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20903,
		  hook_items =
		      [{5, 1130}, {22, 1155}, {1, 1330}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 395970, energy_max = 22000,
		  lev_limit = 109, floor = 339};
get(90200) ->
    #dungeon_data{id = 90200,
		  name = lang:get(<<"旭日平原340"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90210, unit_id = 20904,
		  items = [{5, 79800}, {22, 80850}, {1, 53900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20904,
		  hook_items =
		      [{5, 1140}, {22, 1155}, {1, 1330}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 396233,
		  energy_max = 22000, lev_limit = 111, floor = 340};
get(90210) ->
    #dungeon_data{id = 90210,
		  name = lang:get(<<"旭日平原341"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90220, unit_id = 20905,
		  items = [{5, 22800}, {22, 23100}, {1, 15400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20905,
		  hook_items =
		      [{5, 1140}, {22, 1155}, {1, 1330}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 396495, energy_max = 22000,
		  lev_limit = 111, floor = 341};
get(90220) ->
    #dungeon_data{id = 90220,
		  name = lang:get(<<"旭日平原342"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90230, unit_id = 20906,
		  items = [{5, 22800}, {22, 23300}, {1, 15500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20906,
		  hook_items =
		      [{5, 1140}, {22, 1165}, {1, 1340}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 396758, energy_max = 22000,
		  lev_limit = 111, floor = 342};
get(90230) ->
    #dungeon_data{id = 90230,
		  name = lang:get(<<"旭日平原343"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90240, unit_id = 20907,
		  items = [{5, 23000}, {22, 23300}, {1, 15500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20907,
		  hook_items =
		      [{5, 1150}, {22, 1165}, {1, 1340}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 404512, energy_max = 22000,
		  lev_limit = 111, floor = 343};
get(90240) ->
    #dungeon_data{id = 90240,
		  name = lang:get(<<"旭日平原344"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90250, unit_id = 20908,
		  items = [{5, 23000}, {22, 23300}, {1, 15500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20908,
		  hook_items =
		      [{5, 1150}, {22, 1165}, {1, 1340}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 404775, energy_max = 22000,
		  lev_limit = 111, floor = 344};
get(90250) ->
    #dungeon_data{id = 90250,
		  name = lang:get(<<"旭日平原345"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90260, unit_id = 20909,
		  items = [{5, 80500}, {22, 82250}, {1, 54600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20909,
		  hook_items =
		      [{5, 1150}, {22, 1175}, {1, 1350}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 405037,
		  energy_max = 22000, lev_limit = 111, floor = 345};
get(90260) ->
    #dungeon_data{id = 90260,
		  name = lang:get(<<"旭日平原346"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90270, unit_id = 20910,
		  items = [{5, 23200}, {22, 23500}, {1, 15600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20910,
		  hook_items =
		      [{5, 1160}, {22, 1175}, {1, 1350}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 405300, energy_max = 22000,
		  lev_limit = 113, floor = 346};
get(90270) ->
    #dungeon_data{id = 90270,
		  name = lang:get(<<"旭日平原347"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90280, unit_id = 20911,
		  items = [{5, 23200}, {22, 23500}, {1, 15600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20911,
		  hook_items =
		      [{5, 1160}, {22, 1175}, {1, 1350}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 405562, energy_max = 22000,
		  lev_limit = 113, floor = 347};
get(90280) ->
    #dungeon_data{id = 90280,
		  name = lang:get(<<"旭日平原348"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90290, unit_id = 20912,
		  items = [{5, 23200}, {22, 23700}, {1, 15700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20912,
		  hook_items =
		      [{5, 1160}, {22, 1185}, {1, 1360}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 405825, energy_max = 22000,
		  lev_limit = 113, floor = 348};
get(90290) ->
    #dungeon_data{id = 90290,
		  name = lang:get(<<"旭日平原349"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90300, unit_id = 20913,
		  items = [{5, 23400}, {22, 23700}, {1, 15700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20913,
		  hook_items =
		      [{5, 1170}, {22, 1185}, {1, 1360}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 406087, energy_max = 22000,
		  lev_limit = 113, floor = 349};
get(90300) ->
    #dungeon_data{id = 90300,
		  name = lang:get(<<"旭日平原350"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90310, unit_id = 20914,
		  items = [{5, 81900}, {22, 82950}, {1, 54950}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20914,
		  hook_items =
		      [{5, 1170}, {22, 1185}, {1, 1360}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 406350,
		  energy_max = 22000, lev_limit = 113, floor = 350};
get(90310) ->
    #dungeon_data{id = 90310,
		  name = lang:get(<<"旭日平原351"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90320, unit_id = 20915,
		  items = [{5, 23400}, {22, 23900}, {1, 15800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20915,
		  hook_items =
		      [{5, 1170}, {22, 1195}, {1, 1370}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 414177, energy_max = 22000,
		  lev_limit = 113, floor = 351};
get(90320) ->
    #dungeon_data{id = 90320,
		  name = lang:get(<<"旭日平原352"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90330, unit_id = 20916,
		  items = [{5, 23600}, {22, 23900}, {1, 15800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20916,
		  hook_items =
		      [{5, 1180}, {22, 1195}, {1, 1370}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 414440, energy_max = 22000,
		  lev_limit = 115, floor = 352};
get(90330) ->
    #dungeon_data{id = 90330,
		  name = lang:get(<<"旭日平原353"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90340, unit_id = 20917,
		  items = [{5, 23600}, {22, 23900}, {1, 15800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20917,
		  hook_items =
		      [{5, 1180}, {22, 1195}, {1, 1370}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 414702, energy_max = 22000,
		  lev_limit = 115, floor = 353};
get(90340) ->
    #dungeon_data{id = 90340,
		  name = lang:get(<<"旭日平原354"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90350, unit_id = 20918,
		  items = [{5, 23600}, {22, 24100}, {1, 15900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20918,
		  hook_items =
		      [{5, 1180}, {22, 1205}, {1, 1380}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 414965, energy_max = 22000,
		  lev_limit = 115, floor = 354};
get(90350) ->
    #dungeon_data{id = 90350,
		  name = lang:get(<<"旭日平原355"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90360, unit_id = 20919,
		  items = [{5, 83300}, {22, 84350}, {1, 55650}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20919,
		  hook_items =
		      [{5, 1190}, {22, 1205}, {1, 1380}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 415227,
		  energy_max = 22000, lev_limit = 115, floor = 355};
get(90360) ->
    #dungeon_data{id = 90360,
		  name = lang:get(<<"旭日平原356"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90370, unit_id = 20920,
		  items = [{5, 23800}, {22, 24100}, {1, 15900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20920,
		  hook_items =
		      [{5, 1190}, {22, 1205}, {1, 1380}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 415490, energy_max = 22000,
		  lev_limit = 115, floor = 356};
get(90370) ->
    #dungeon_data{id = 90370,
		  name = lang:get(<<"旭日平原357"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90380, unit_id = 20921,
		  items = [{5, 23800}, {22, 24300}, {1, 16000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20921,
		  hook_items =
		      [{5, 1190}, {22, 1215}, {1, 1390}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 415752, energy_max = 22000,
		  lev_limit = 115, floor = 357};
get(90380) ->
    #dungeon_data{id = 90380,
		  name = lang:get(<<"旭日平原358"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90390, unit_id = 20922,
		  items = [{5, 24000}, {22, 24300}, {1, 16000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20922,
		  hook_items =
		      [{5, 1200}, {22, 1215}, {1, 1390}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 416015, energy_max = 22000,
		  lev_limit = 117, floor = 358};
get(90390) ->
    #dungeon_data{id = 90390,
		  name = lang:get(<<"旭日平原359"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 90400, unit_id = 20923,
		  items = [{5, 24000}, {22, 24300}, {1, 16000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20923,
		  hook_items =
		      [{5, 1200}, {22, 1215}, {1, 1390}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 423963, energy_max = 22000,
		  lev_limit = 117, floor = 359};
get(90400) ->
    #dungeon_data{id = 90400,
		  name = lang:get(<<"旭日平原360"/utf8>>), chapter_id = 9,
		  mode = 1, next_id = 100010, unit_id = 20924,
		  items = [{5, 84000}, {22, 85750}, {1, 56350}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20924,
		  hook_items =
		      [{5, 1200}, {22, 1225}, {1, 1400}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 424226,
		  energy_max = 22000, lev_limit = 117, floor = 360};
get(100010) ->
    #dungeon_data{id = 100010,
		  name = lang:get(<<"乌塔塔神庙361"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100020, unit_id = 20925,
		  items = [{5, 24200}, {22, 24500}, {1, 16100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20925,
		  hook_items =
		      [{5, 1210}, {22, 1225}, {1, 1400}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 424488, energy_max = 22000,
		  lev_limit = 117, floor = 361};
get(100020) ->
    #dungeon_data{id = 100020,
		  name = lang:get(<<"乌塔塔神庙362"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100030, unit_id = 20926,
		  items = [{5, 24200}, {22, 24500}, {1, 16100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20926,
		  hook_items =
		      [{5, 1210}, {22, 1225}, {1, 1400}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 424751, energy_max = 22000,
		  lev_limit = 117, floor = 362};
get(100030) ->
    #dungeon_data{id = 100030,
		  name = lang:get(<<"乌塔塔神庙363"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100040, unit_id = 20927,
		  items = [{5, 24200}, {22, 24700}, {1, 16200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20927,
		  hook_items =
		      [{5, 1210}, {22, 1235}, {1, 1410}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 425013, energy_max = 22000,
		  lev_limit = 117, floor = 363};
get(100040) ->
    #dungeon_data{id = 100040,
		  name = lang:get(<<"乌塔塔神庙364"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100050, unit_id = 20928,
		  items = [{5, 24400}, {22, 24700}, {1, 16200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20928,
		  hook_items =
		      [{5, 1220}, {22, 1235}, {1, 1410}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 425276, energy_max = 22000,
		  lev_limit = 119, floor = 364};
get(100050) ->
    #dungeon_data{id = 100050,
		  name = lang:get(<<"乌塔塔神庙365"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100060, unit_id = 20929,
		  items = [{5, 85400}, {22, 86450}, {1, 56700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20929,
		  hook_items =
		      [{5, 1220}, {22, 1235}, {1, 1410}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 425538,
		  energy_max = 22000, lev_limit = 119, floor = 365};
get(100060) ->
    #dungeon_data{id = 100060,
		  name = lang:get(<<"乌塔塔神庙366"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100070, unit_id = 20930,
		  items = [{5, 24400}, {22, 24900}, {1, 16300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20930,
		  hook_items =
		      [{5, 1220}, {22, 1245}, {1, 1420}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 425801, energy_max = 22000,
		  lev_limit = 119, floor = 366};
get(100070) ->
    #dungeon_data{id = 100070,
		  name = lang:get(<<"乌塔塔神庙367"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100080, unit_id = 20931,
		  items = [{5, 24600}, {22, 24900}, {1, 16300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20931,
		  hook_items =
		      [{5, 1230}, {22, 1245}, {1, 1420}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 433865, energy_max = 22000,
		  lev_limit = 119, floor = 367};
get(100080) ->
    #dungeon_data{id = 100080,
		  name = lang:get(<<"乌塔塔神庙368"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100090, unit_id = 20932,
		  items = [{5, 24600}, {22, 24900}, {1, 16300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20932,
		  hook_items =
		      [{5, 1230}, {22, 1245}, {1, 1420}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 434127, energy_max = 22000,
		  lev_limit = 119, floor = 368};
get(100090) ->
    #dungeon_data{id = 100090,
		  name = lang:get(<<"乌塔塔神庙369"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100100, unit_id = 20933,
		  items = [{5, 24600}, {22, 25100}, {1, 16400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20933,
		  hook_items =
		      [{5, 1230}, {22, 1255}, {1, 1430}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 434390, energy_max = 22000,
		  lev_limit = 119, floor = 369};
get(100100) ->
    #dungeon_data{id = 100100,
		  name = lang:get(<<"乌塔塔神庙370"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100110, unit_id = 20934,
		  items = [{5, 86800}, {22, 87850}, {1, 57400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20934,
		  hook_items =
		      [{5, 1240}, {22, 1255}, {1, 1430}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 434652,
		  energy_max = 22000, lev_limit = 121, floor = 370};
get(100110) ->
    #dungeon_data{id = 100110,
		  name = lang:get(<<"乌塔塔神庙371"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100120, unit_id = 20935,
		  items = [{5, 24800}, {22, 25100}, {1, 16400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20935,
		  hook_items =
		      [{5, 1240}, {22, 1255}, {1, 1430}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 434915, energy_max = 22000,
		  lev_limit = 121, floor = 371};
get(100120) ->
    #dungeon_data{id = 100120,
		  name = lang:get(<<"乌塔塔神庙372"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100130, unit_id = 20936,
		  items = [{5, 24800}, {22, 25300}, {1, 16500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20936,
		  hook_items =
		      [{5, 1240}, {22, 1265}, {1, 1440}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 435177, energy_max = 22000,
		  lev_limit = 121, floor = 372};
get(100130) ->
    #dungeon_data{id = 100130,
		  name = lang:get(<<"乌塔塔神庙373"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100140, unit_id = 20937,
		  items = [{5, 25000}, {22, 25300}, {1, 16500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20937,
		  hook_items =
		      [{5, 1250}, {22, 1265}, {1, 1440}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 435440, energy_max = 22000,
		  lev_limit = 121, floor = 373};
get(100140) ->
    #dungeon_data{id = 100140,
		  name = lang:get(<<"乌塔塔神庙374"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100150, unit_id = 20938,
		  items = [{5, 25000}, {22, 25300}, {1, 16500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20938,
		  hook_items =
		      [{5, 1250}, {22, 1265}, {1, 1440}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 435702, energy_max = 22000,
		  lev_limit = 121, floor = 374};
get(100150) ->
    #dungeon_data{id = 100150,
		  name = lang:get(<<"乌塔塔神庙375"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100160, unit_id = 20939,
		  items = [{5, 87500}, {22, 89250}, {1, 58100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20939,
		  hook_items =
		      [{5, 1250}, {22, 1275}, {1, 1450}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 443892,
		  energy_max = 22000, lev_limit = 121, floor = 375};
get(100160) ->
    #dungeon_data{id = 100160,
		  name = lang:get(<<"乌塔塔神庙376"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100170, unit_id = 20940,
		  items = [{5, 25200}, {22, 25500}, {1, 16600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20940,
		  hook_items =
		      [{5, 1260}, {22, 1275}, {1, 1450}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 444155, energy_max = 22000,
		  lev_limit = 123, floor = 376};
get(100170) ->
    #dungeon_data{id = 100170,
		  name = lang:get(<<"乌塔塔神庙377"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100180, unit_id = 20941,
		  items = [{5, 25200}, {22, 25500}, {1, 16600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20941,
		  hook_items =
		      [{5, 1260}, {22, 1275}, {1, 1450}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 444417, energy_max = 22000,
		  lev_limit = 123, floor = 377};
get(100180) ->
    #dungeon_data{id = 100180,
		  name = lang:get(<<"乌塔塔神庙378"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100190, unit_id = 20942,
		  items = [{5, 25200}, {22, 25700}, {1, 16700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 20942,
		  hook_items =
		      [{5, 1260}, {22, 1285}, {1, 1460}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 444680, energy_max = 22000,
		  lev_limit = 123, floor = 378};
get(100190) ->
    #dungeon_data{id = 100190,
		  name = lang:get(<<"乌塔塔神庙379"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100200, unit_id = 21001,
		  items = [{5, 25400}, {22, 25700}, {1, 16700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21001,
		  hook_items =
		      [{5, 1270}, {22, 1285}, {1, 1460}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 444942, energy_max = 22000,
		  lev_limit = 123, floor = 379};
get(100200) ->
    #dungeon_data{id = 100200,
		  name = lang:get(<<"乌塔塔神庙380"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100210, unit_id = 21002,
		  items = [{5, 88900}, {22, 89950}, {1, 58450}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21002,
		  hook_items =
		      [{5, 1270}, {22, 1285}, {1, 1460}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 445205,
		  energy_max = 22000, lev_limit = 123, floor = 380};
get(100210) ->
    #dungeon_data{id = 100210,
		  name = lang:get(<<"乌塔塔神庙381"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100220, unit_id = 21003,
		  items = [{5, 25400}, {22, 25900}, {1, 16800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21003,
		  hook_items =
		      [{5, 1270}, {22, 1295}, {1, 1470}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 445467, energy_max = 22000,
		  lev_limit = 123, floor = 381};
get(100220) ->
    #dungeon_data{id = 100220,
		  name = lang:get(<<"乌塔塔神庙382"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100230, unit_id = 21004,
		  items = [{5, 25600}, {22, 25900}, {1, 16800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21004,
		  hook_items =
		      [{5, 1280}, {22, 1295}, {1, 1470}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 445730, energy_max = 22000,
		  lev_limit = 125, floor = 382};
get(100230) ->
    #dungeon_data{id = 100230,
		  name = lang:get(<<"乌塔塔神庙383"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100240, unit_id = 21005,
		  items = [{5, 25600}, {22, 25900}, {1, 16800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21005,
		  hook_items =
		      [{5, 1280}, {22, 1295}, {1, 1470}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 453983, energy_max = 22000,
		  lev_limit = 125, floor = 383};
get(100240) ->
    #dungeon_data{id = 100240,
		  name = lang:get(<<"乌塔塔神庙384"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100250, unit_id = 21006,
		  items = [{5, 25600}, {22, 26100}, {1, 16900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21006,
		  hook_items =
		      [{5, 1280}, {22, 1305}, {1, 1480}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 454245, energy_max = 22000,
		  lev_limit = 125, floor = 384};
get(100250) ->
    #dungeon_data{id = 100250,
		  name = lang:get(<<"乌塔塔神庙385"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100260, unit_id = 21007,
		  items = [{5, 90300}, {22, 91350}, {1, 59150}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21007,
		  hook_items =
		      [{5, 1290}, {22, 1305}, {1, 1480}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 454508,
		  energy_max = 22000, lev_limit = 125, floor = 385};
get(100260) ->
    #dungeon_data{id = 100260,
		  name = lang:get(<<"乌塔塔神庙386"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100270, unit_id = 21008,
		  items = [{5, 25800}, {22, 26100}, {1, 16900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21008,
		  hook_items =
		      [{5, 1290}, {22, 1305}, {1, 1480}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 454770, energy_max = 22000,
		  lev_limit = 125, floor = 386};
get(100270) ->
    #dungeon_data{id = 100270,
		  name = lang:get(<<"乌塔塔神庙387"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100280, unit_id = 21009,
		  items = [{5, 25800}, {22, 26300}, {1, 17000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21009,
		  hook_items =
		      [{5, 1290}, {22, 1315}, {1, 1490}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 455033, energy_max = 22000,
		  lev_limit = 125, floor = 387};
get(100280) ->
    #dungeon_data{id = 100280,
		  name = lang:get(<<"乌塔塔神庙388"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100290, unit_id = 21010,
		  items = [{5, 26000}, {22, 26300}, {1, 17000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21010,
		  hook_items =
		      [{5, 1300}, {22, 1315}, {1, 1490}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 455295, energy_max = 22000,
		  lev_limit = 127, floor = 388};
get(100290) ->
    #dungeon_data{id = 100290,
		  name = lang:get(<<"乌塔塔神庙389"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100300, unit_id = 21011,
		  items = [{5, 26000}, {22, 26300}, {1, 17000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21011,
		  hook_items =
		      [{5, 1300}, {22, 1315}, {1, 1490}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 455558, energy_max = 22000,
		  lev_limit = 127, floor = 389};
get(100300) ->
    #dungeon_data{id = 100300,
		  name = lang:get(<<"乌塔塔神庙390"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100310, unit_id = 21012,
		  items = [{5, 91000}, {22, 92750}, {1, 59850}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21012,
		  hook_items =
		      [{5, 1300}, {22, 1325}, {1, 1500}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 455820,
		  energy_max = 22000, lev_limit = 127, floor = 390};
get(100310) ->
    #dungeon_data{id = 100310,
		  name = lang:get(<<"乌塔塔神庙391"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100320, unit_id = 21013,
		  items = [{5, 26200}, {22, 26500}, {1, 17100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21013,
		  hook_items =
		      [{5, 1310}, {22, 1325}, {1, 1500}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 464189, energy_max = 22000,
		  lev_limit = 127, floor = 391};
get(100320) ->
    #dungeon_data{id = 100320,
		  name = lang:get(<<"乌塔塔神庙392"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100330, unit_id = 21014,
		  items = [{5, 26200}, {22, 26500}, {1, 17100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21014,
		  hook_items =
		      [{5, 1310}, {22, 1325}, {1, 1500}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 464451, energy_max = 22000,
		  lev_limit = 127, floor = 392};
get(100330) ->
    #dungeon_data{id = 100330,
		  name = lang:get(<<"乌塔塔神庙393"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100340, unit_id = 21015,
		  items = [{5, 26200}, {22, 26700}, {1, 17200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21015,
		  hook_items =
		      [{5, 1310}, {22, 1335}, {1, 1510}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 464714, energy_max = 22000,
		  lev_limit = 127, floor = 393};
get(100340) ->
    #dungeon_data{id = 100340,
		  name = lang:get(<<"乌塔塔神庙394"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100350, unit_id = 21016,
		  items = [{5, 26400}, {22, 26700}, {1, 17200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21016,
		  hook_items =
		      [{5, 1320}, {22, 1335}, {1, 1510}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 464976, energy_max = 22000,
		  lev_limit = 129, floor = 394};
get(100350) ->
    #dungeon_data{id = 100350,
		  name = lang:get(<<"乌塔塔神庙395"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100360, unit_id = 21017,
		  items = [{5, 92400}, {22, 93450}, {1, 60200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21017,
		  hook_items =
		      [{5, 1320}, {22, 1335}, {1, 1510}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 465239,
		  energy_max = 22000, lev_limit = 129, floor = 395};
get(100360) ->
    #dungeon_data{id = 100360,
		  name = lang:get(<<"乌塔塔神庙396"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100370, unit_id = 21018,
		  items = [{5, 26400}, {22, 26900}, {1, 17300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21018,
		  hook_items =
		      [{5, 1320}, {22, 1345}, {1, 1520}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 465501, energy_max = 22000,
		  lev_limit = 129, floor = 396};
get(100370) ->
    #dungeon_data{id = 100370,
		  name = lang:get(<<"乌塔塔神庙397"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100380, unit_id = 21019,
		  items = [{5, 26600}, {22, 26900}, {1, 17300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21019,
		  hook_items =
		      [{5, 1330}, {22, 1345}, {1, 1520}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 465764, energy_max = 22000,
		  lev_limit = 129, floor = 397};
get(100380) ->
    #dungeon_data{id = 100380,
		  name = lang:get(<<"乌塔塔神庙398"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100390, unit_id = 21020,
		  items = [{5, 26600}, {22, 26900}, {1, 17300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21020,
		  hook_items =
		      [{5, 1330}, {22, 1345}, {1, 1520}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 466026, energy_max = 22000,
		  lev_limit = 129, floor = 398};
get(100390) ->
    #dungeon_data{id = 100390,
		  name = lang:get(<<"乌塔塔神庙399"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 100400, unit_id = 21021,
		  items = [{5, 26600}, {22, 27100}, {1, 17400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21021,
		  hook_items =
		      [{5, 1330}, {22, 1355}, {1, 1530}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 474521, energy_max = 22000,
		  lev_limit = 129, floor = 399};
get(100400) ->
    #dungeon_data{id = 100400,
		  name = lang:get(<<"乌塔塔神庙400"/utf8>>), chapter_id = 10,
		  mode = 1, next_id = 110010, unit_id = 21022,
		  items = [{5, 93800}, {22, 94850}, {1, 60900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21022,
		  hook_items =
		      [{5, 1340}, {22, 1355}, {1, 1530}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 474783,
		  energy_max = 22000, lev_limit = 131, floor = 400};
get(110010) ->
    #dungeon_data{id = 110010,
		  name = lang:get(<<"彩虹岛401"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110020, unit_id = 21023,
		  items = [{5, 26800}, {22, 27100}, {1, 17400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21023,
		  hook_items =
		      [{5, 1340}, {22, 1355}, {1, 1530}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 475046, energy_max = 22000,
		  lev_limit = 131, floor = 401};
get(110020) ->
    #dungeon_data{id = 110020,
		  name = lang:get(<<"彩虹岛402"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110030, unit_id = 21024,
		  items = [{5, 26800}, {22, 27300}, {1, 17500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21024,
		  hook_items =
		      [{5, 1340}, {22, 1365}, {1, 1540}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 475308, energy_max = 22000,
		  lev_limit = 131, floor = 402};
get(110030) ->
    #dungeon_data{id = 110030,
		  name = lang:get(<<"彩虹岛403"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110040, unit_id = 21025,
		  items = [{5, 27000}, {22, 27300}, {1, 17500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21025,
		  hook_items =
		      [{5, 1350}, {22, 1365}, {1, 1540}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 475571, energy_max = 22000,
		  lev_limit = 131, floor = 403};
get(110040) ->
    #dungeon_data{id = 110040,
		  name = lang:get(<<"彩虹岛404"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110050, unit_id = 21026,
		  items = [{5, 27000}, {22, 27300}, {1, 17500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21026,
		  hook_items =
		      [{5, 1350}, {22, 1365}, {1, 1540}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 475833, energy_max = 22000,
		  lev_limit = 131, floor = 404};
get(110050) ->
    #dungeon_data{id = 110050,
		  name = lang:get(<<"彩虹岛405"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110060, unit_id = 21027,
		  items = [{5, 94500}, {22, 96250}, {1, 61600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21027,
		  hook_items =
		      [{5, 1350}, {22, 1375}, {1, 1550}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 476096,
		  energy_max = 22000, lev_limit = 131, floor = 405};
get(110060) ->
    #dungeon_data{id = 110060,
		  name = lang:get(<<"彩虹岛406"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110070, unit_id = 21028,
		  items = [{5, 27200}, {22, 27500}, {1, 17600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21028,
		  hook_items =
		      [{5, 1360}, {22, 1375}, {1, 1550}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 476358, energy_max = 22000,
		  lev_limit = 133, floor = 406};
get(110070) ->
    #dungeon_data{id = 110070,
		  name = lang:get(<<"彩虹岛407"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110080, unit_id = 21029,
		  items = [{5, 27200}, {22, 27500}, {1, 17600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21029,
		  hook_items =
		      [{5, 1360}, {22, 1375}, {1, 1550}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 484958, energy_max = 22000,
		  lev_limit = 133, floor = 407};
get(110080) ->
    #dungeon_data{id = 110080,
		  name = lang:get(<<"彩虹岛408"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110090, unit_id = 21030,
		  items = [{5, 27200}, {22, 27700}, {1, 17700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21030,
		  hook_items =
		      [{5, 1360}, {22, 1385}, {1, 1560}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 485220, energy_max = 22000,
		  lev_limit = 133, floor = 408};
get(110090) ->
    #dungeon_data{id = 110090,
		  name = lang:get(<<"彩虹岛409"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110100, unit_id = 21031,
		  items = [{5, 27400}, {22, 27700}, {1, 17700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21031,
		  hook_items =
		      [{5, 1370}, {22, 1385}, {1, 1560}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 485483, energy_max = 22000,
		  lev_limit = 133, floor = 409};
get(110100) ->
    #dungeon_data{id = 110100,
		  name = lang:get(<<"彩虹岛410"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110110, unit_id = 21032,
		  items = [{5, 95900}, {22, 96950}, {1, 61950}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21032,
		  hook_items =
		      [{5, 1370}, {22, 1385}, {1, 1560}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 485745,
		  energy_max = 22000, lev_limit = 133, floor = 410};
get(110110) ->
    #dungeon_data{id = 110110,
		  name = lang:get(<<"彩虹岛411"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110120, unit_id = 21033,
		  items = [{5, 27400}, {22, 27900}, {1, 17800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21033,
		  hook_items =
		      [{5, 1370}, {22, 1395}, {1, 1570}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 486008, energy_max = 22000,
		  lev_limit = 133, floor = 411};
get(110120) ->
    #dungeon_data{id = 110120,
		  name = lang:get(<<"彩虹岛412"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110130, unit_id = 21034,
		  items = [{5, 27600}, {22, 27900}, {1, 17800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21034,
		  hook_items =
		      [{5, 1380}, {22, 1395}, {1, 1570}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 486270, energy_max = 22000,
		  lev_limit = 135, floor = 412};
get(110130) ->
    #dungeon_data{id = 110130,
		  name = lang:get(<<"彩虹岛413"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110140, unit_id = 21035,
		  items = [{5, 27600}, {22, 27900}, {1, 17800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21035,
		  hook_items =
		      [{5, 1380}, {22, 1395}, {1, 1570}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 486533, energy_max = 22000,
		  lev_limit = 135, floor = 413};
get(110140) ->
    #dungeon_data{id = 110140,
		  name = lang:get(<<"彩虹岛414"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110150, unit_id = 21036,
		  items = [{5, 27600}, {22, 28100}, {1, 17900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21036,
		  hook_items =
		      [{5, 1380}, {22, 1405}, {1, 1580}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 486795, energy_max = 22000,
		  lev_limit = 135, floor = 414};
get(110150) ->
    #dungeon_data{id = 110150,
		  name = lang:get(<<"彩虹岛415"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110160, unit_id = 21037,
		  items = [{5, 97300}, {22, 98350}, {1, 62650}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21037,
		  hook_items =
		      [{5, 1390}, {22, 1405}, {1, 1580}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 502341,
		  energy_max = 22000, lev_limit = 135, floor = 415};
get(110160) ->
    #dungeon_data{id = 110160,
		  name = lang:get(<<"彩虹岛416"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110170, unit_id = 21038,
		  items = [{5, 27800}, {22, 28100}, {1, 17900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21038,
		  hook_items =
		      [{5, 1390}, {22, 1405}, {1, 1580}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 502603, energy_max = 22000,
		  lev_limit = 135, floor = 416};
get(110170) ->
    #dungeon_data{id = 110170,
		  name = lang:get(<<"彩虹岛417"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110180, unit_id = 21039,
		  items = [{5, 27800}, {22, 28300}, {1, 18000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21039,
		  hook_items =
		      [{5, 1390}, {22, 1415}, {1, 1590}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 502866, energy_max = 22000,
		  lev_limit = 135, floor = 417};
get(110180) ->
    #dungeon_data{id = 110180,
		  name = lang:get(<<"彩虹岛418"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110190, unit_id = 21040,
		  items = [{5, 28000}, {22, 28300}, {1, 18000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21040,
		  hook_items =
		      [{5, 1400}, {22, 1415}, {1, 1590}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 503128, energy_max = 22000,
		  lev_limit = 137, floor = 418};
get(110190) ->
    #dungeon_data{id = 110190,
		  name = lang:get(<<"彩虹岛419"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110200, unit_id = 21041,
		  items = [{5, 28000}, {22, 28300}, {1, 18000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21041,
		  hook_items =
		      [{5, 1400}, {22, 1415}, {1, 1590}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 503391, energy_max = 22000,
		  lev_limit = 137, floor = 419};
get(110200) ->
    #dungeon_data{id = 110200,
		  name = lang:get(<<"彩虹岛420"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110210, unit_id = 21042,
		  items = [{5, 98000}, {22, 99750}, {1, 63350}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21042,
		  hook_items =
		      [{5, 1400}, {22, 1425}, {1, 1600}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 503653,
		  energy_max = 22000, lev_limit = 137, floor = 420};
get(110210) ->
    #dungeon_data{id = 110210,
		  name = lang:get(<<"彩虹岛421"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110220, unit_id = 21101,
		  items = [{5, 28200}, {22, 28500}, {1, 18100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21101,
		  hook_items =
		      [{5, 1410}, {22, 1425}, {1, 1600}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 503916, energy_max = 22000,
		  lev_limit = 137, floor = 421};
get(110220) ->
    #dungeon_data{id = 110220,
		  name = lang:get(<<"彩虹岛422"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110230, unit_id = 21102,
		  items = [{5, 28200}, {22, 28500}, {1, 18100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21102,
		  hook_items =
		      [{5, 1410}, {22, 1425}, {1, 1600}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 504178, energy_max = 22000,
		  lev_limit = 137, floor = 422};
get(110230) ->
    #dungeon_data{id = 110230,
		  name = lang:get(<<"彩虹岛423"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110240, unit_id = 21103,
		  items = [{5, 28200}, {22, 28700}, {1, 18200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21103,
		  hook_items =
		      [{5, 1410}, {22, 1435}, {1, 1610}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 513476, energy_max = 22000,
		  lev_limit = 137, floor = 423};
get(110240) ->
    #dungeon_data{id = 110240,
		  name = lang:get(<<"彩虹岛424"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110250, unit_id = 21104,
		  items = [{5, 28400}, {22, 28700}, {1, 18200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21104,
		  hook_items =
		      [{5, 1420}, {22, 1435}, {1, 1610}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 513738, energy_max = 22000,
		  lev_limit = 139, floor = 424};
get(110250) ->
    #dungeon_data{id = 110250,
		  name = lang:get(<<"彩虹岛425"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110260, unit_id = 21105,
		  items =
		      [{5, 99400}, {22, 100450}, {1, 63700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21105,
		  hook_items =
		      [{5, 1420}, {22, 1435}, {1, 1610}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 514001,
		  energy_max = 22000, lev_limit = 139, floor = 425};
get(110260) ->
    #dungeon_data{id = 110260,
		  name = lang:get(<<"彩虹岛426"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110270, unit_id = 21106,
		  items = [{5, 28400}, {22, 28900}, {1, 18300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21106,
		  hook_items =
		      [{5, 1420}, {22, 1445}, {1, 1620}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 514263, energy_max = 22000,
		  lev_limit = 139, floor = 426};
get(110270) ->
    #dungeon_data{id = 110270,
		  name = lang:get(<<"彩虹岛427"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110280, unit_id = 21107,
		  items = [{5, 28600}, {22, 28900}, {1, 18300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21107,
		  hook_items =
		      [{5, 1430}, {22, 1445}, {1, 1620}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 514526, energy_max = 22000,
		  lev_limit = 139, floor = 427};
get(110280) ->
    #dungeon_data{id = 110280,
		  name = lang:get(<<"彩虹岛428"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110290, unit_id = 21108,
		  items = [{5, 28600}, {22, 28900}, {1, 18300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21108,
		  hook_items =
		      [{5, 1430}, {22, 1445}, {1, 1620}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 514788, energy_max = 22000,
		  lev_limit = 139, floor = 428};
get(110290) ->
    #dungeon_data{id = 110290,
		  name = lang:get(<<"彩虹岛429"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110300, unit_id = 21109,
		  items = [{5, 28600}, {22, 29100}, {1, 18400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21109,
		  hook_items =
		      [{5, 1430}, {22, 1455}, {1, 1630}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 515051, energy_max = 22000,
		  lev_limit = 139, floor = 429};
get(110300) ->
    #dungeon_data{id = 110300,
		  name = lang:get(<<"彩虹岛430"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110310, unit_id = 21110,
		  items =
		      [{5, 100800}, {22, 101850}, {1, 64400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21110,
		  hook_items =
		      [{5, 1440}, {22, 1455}, {1, 1630}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 515313,
		  energy_max = 22000, lev_limit = 141, floor = 430};
get(110310) ->
    #dungeon_data{id = 110310,
		  name = lang:get(<<"彩虹岛431"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110320, unit_id = 21111,
		  items = [{5, 28800}, {22, 29100}, {1, 18400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21111,
		  hook_items =
		      [{5, 1440}, {22, 1455}, {1, 1630}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 524727, energy_max = 22000,
		  lev_limit = 141, floor = 431};
get(110320) ->
    #dungeon_data{id = 110320,
		  name = lang:get(<<"彩虹岛432"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110330, unit_id = 21112,
		  items = [{5, 28800}, {22, 29300}, {1, 18500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21112,
		  hook_items =
		      [{5, 1440}, {22, 1465}, {1, 1640}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 524989, energy_max = 22000,
		  lev_limit = 141, floor = 432};
get(110330) ->
    #dungeon_data{id = 110330,
		  name = lang:get(<<"彩虹岛433"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110340, unit_id = 21113,
		  items = [{5, 29000}, {22, 29300}, {1, 18500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21113,
		  hook_items =
		      [{5, 1450}, {22, 1465}, {1, 1640}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 525252, energy_max = 22000,
		  lev_limit = 141, floor = 433};
get(110340) ->
    #dungeon_data{id = 110340,
		  name = lang:get(<<"彩虹岛434"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110350, unit_id = 21114,
		  items = [{5, 29000}, {22, 29300}, {1, 18500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21114,
		  hook_items =
		      [{5, 1450}, {22, 1465}, {1, 1640}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 525514, energy_max = 22000,
		  lev_limit = 141, floor = 434};
get(110350) ->
    #dungeon_data{id = 110350,
		  name = lang:get(<<"彩虹岛435"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110360, unit_id = 21115,
		  items =
		      [{5, 101500}, {22, 103250}, {1, 65100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21115,
		  hook_items =
		      [{5, 1450}, {22, 1475}, {1, 1650}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 525777,
		  energy_max = 22000, lev_limit = 141, floor = 435};
get(110360) ->
    #dungeon_data{id = 110360,
		  name = lang:get(<<"彩虹岛436"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110370, unit_id = 21116,
		  items = [{5, 29200}, {22, 29500}, {1, 18600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21116,
		  hook_items =
		      [{5, 1460}, {22, 1475}, {1, 1650}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 526039, energy_max = 22000,
		  lev_limit = 143, floor = 436};
get(110370) ->
    #dungeon_data{id = 110370,
		  name = lang:get(<<"彩虹岛437"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110380, unit_id = 21117,
		  items = [{5, 29200}, {22, 29500}, {1, 18600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21117,
		  hook_items =
		      [{5, 1460}, {22, 1475}, {1, 1650}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 526302, energy_max = 22000,
		  lev_limit = 143, floor = 437};
get(110380) ->
    #dungeon_data{id = 110380,
		  name = lang:get(<<"彩虹岛438"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110390, unit_id = 21118,
		  items = [{5, 29200}, {22, 29700}, {1, 18700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21118,
		  hook_items =
		      [{5, 1460}, {22, 1485}, {1, 1660}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 526564, energy_max = 22000,
		  lev_limit = 143, floor = 438};
get(110390) ->
    #dungeon_data{id = 110390,
		  name = lang:get(<<"彩虹岛439"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 110400, unit_id = 21119,
		  items = [{5, 29400}, {22, 29700}, {1, 18700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21119,
		  hook_items =
		      [{5, 1470}, {22, 1485}, {1, 1660}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 536114, energy_max = 22000,
		  lev_limit = 143, floor = 439};
get(110400) ->
    #dungeon_data{id = 110400,
		  name = lang:get(<<"彩虹岛440"/utf8>>), chapter_id = 11,
		  mode = 1, next_id = 120010, unit_id = 21120,
		  items =
		      [{5, 102900}, {22, 103950}, {1, 65450}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21120,
		  hook_items =
		      [{5, 1470}, {22, 1485}, {1, 1660}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 536376,
		  energy_max = 22000, lev_limit = 143, floor = 440};
get(120010) ->
    #dungeon_data{id = 120010,
		  name = lang:get(<<"龙晶之谷441"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120020, unit_id = 21121,
		  items = [{5, 29400}, {22, 29900}, {1, 18800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21121,
		  hook_items =
		      [{5, 1470}, {22, 1495}, {1, 1670}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 536639, energy_max = 22000,
		  lev_limit = 143, floor = 441};
get(120020) ->
    #dungeon_data{id = 120020,
		  name = lang:get(<<"龙晶之谷442"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120030, unit_id = 21122,
		  items = [{5, 29600}, {22, 29900}, {1, 18800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21122,
		  hook_items =
		      [{5, 1480}, {22, 1495}, {1, 1670}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 536901, energy_max = 22000,
		  lev_limit = 145, floor = 442};
get(120030) ->
    #dungeon_data{id = 120030,
		  name = lang:get(<<"龙晶之谷443"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120040, unit_id = 21123,
		  items = [{5, 29600}, {22, 29900}, {1, 18800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21123,
		  hook_items =
		      [{5, 1480}, {22, 1495}, {1, 1670}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 537164, energy_max = 22000,
		  lev_limit = 145, floor = 443};
get(120040) ->
    #dungeon_data{id = 120040,
		  name = lang:get(<<"龙晶之谷444"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120050, unit_id = 21124,
		  items = [{5, 29600}, {22, 30100}, {1, 18900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21124,
		  hook_items =
		      [{5, 1480}, {22, 1505}, {1, 1680}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 537426, energy_max = 22000,
		  lev_limit = 145, floor = 444};
get(120050) ->
    #dungeon_data{id = 120050,
		  name = lang:get(<<"龙晶之谷445"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120060, unit_id = 21125,
		  items =
		      [{5, 104300}, {22, 105350}, {1, 66150}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21125,
		  hook_items =
		      [{5, 1490}, {22, 1505}, {1, 1680}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 537689,
		  energy_max = 22000, lev_limit = 145, floor = 445};
get(120060) ->
    #dungeon_data{id = 120060,
		  name = lang:get(<<"龙晶之谷446"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120070, unit_id = 21126,
		  items = [{5, 29800}, {22, 30100}, {1, 18900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21126,
		  hook_items =
		      [{5, 1490}, {22, 1505}, {1, 1680}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 537951, energy_max = 22000,
		  lev_limit = 145, floor = 446};
get(120070) ->
    #dungeon_data{id = 120070,
		  name = lang:get(<<"龙晶之谷447"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120080, unit_id = 21127,
		  items = [{5, 29800}, {22, 30300}, {1, 19000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21127,
		  hook_items =
		      [{5, 1490}, {22, 1515}, {1, 1690}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 547575, energy_max = 22000,
		  lev_limit = 145, floor = 447};
get(120080) ->
    #dungeon_data{id = 120080,
		  name = lang:get(<<"龙晶之谷448"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120090, unit_id = 21128,
		  items = [{5, 30000}, {22, 30300}, {1, 19000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21128,
		  hook_items =
		      [{5, 1500}, {22, 1515}, {1, 1690}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 547837, energy_max = 22000,
		  lev_limit = 147, floor = 448};
get(120090) ->
    #dungeon_data{id = 120090,
		  name = lang:get(<<"龙晶之谷449"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120100, unit_id = 21129,
		  items = [{5, 30000}, {22, 30300}, {1, 19000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21129,
		  hook_items =
		      [{5, 1500}, {22, 1515}, {1, 1690}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 548100, energy_max = 22000,
		  lev_limit = 147, floor = 449};
get(120100) ->
    #dungeon_data{id = 120100,
		  name = lang:get(<<"龙晶之谷450"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120110, unit_id = 21130,
		  items =
		      [{5, 105000}, {22, 106750}, {1, 66850}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21130,
		  hook_items =
		      [{5, 1500}, {22, 1525}, {1, 1700}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 548362,
		  energy_max = 22000, lev_limit = 147, floor = 450};
get(120110) ->
    #dungeon_data{id = 120110,
		  name = lang:get(<<"龙晶之谷451"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120120, unit_id = 21131,
		  items = [{5, 30200}, {22, 30500}, {1, 19100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21131,
		  hook_items =
		      [{5, 1510}, {22, 1525}, {1, 1700}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 548625, energy_max = 22000,
		  lev_limit = 147, floor = 451};
get(120120) ->
    #dungeon_data{id = 120120,
		  name = lang:get(<<"龙晶之谷452"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120130, unit_id = 21132,
		  items = [{5, 30200}, {22, 30500}, {1, 19100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21132,
		  hook_items =
		      [{5, 1510}, {22, 1525}, {1, 1700}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 548887, energy_max = 22000,
		  lev_limit = 147, floor = 452};
get(120130) ->
    #dungeon_data{id = 120130,
		  name = lang:get(<<"龙晶之谷453"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120140, unit_id = 21133,
		  items = [{5, 30200}, {22, 30700}, {1, 19200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21133,
		  hook_items =
		      [{5, 1510}, {22, 1535}, {1, 1710}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 549150, energy_max = 22000,
		  lev_limit = 147, floor = 453};
get(120140) ->
    #dungeon_data{id = 120140,
		  name = lang:get(<<"龙晶之谷454"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120150, unit_id = 21134,
		  items = [{5, 30400}, {22, 30700}, {1, 19200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21134,
		  hook_items =
		      [{5, 1520}, {22, 1535}, {1, 1710}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 549412, energy_max = 22000,
		  lev_limit = 149, floor = 454};
get(120150) ->
    #dungeon_data{id = 120150,
		  name = lang:get(<<"龙晶之谷455"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120160, unit_id = 21135,
		  items =
		      [{5, 106400}, {22, 107450}, {1, 67200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21135,
		  hook_items =
		      [{5, 1520}, {22, 1535}, {1, 1710}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 559177,
		  energy_max = 22000, lev_limit = 149, floor = 455};
get(120160) ->
    #dungeon_data{id = 120160,
		  name = lang:get(<<"龙晶之谷456"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120170, unit_id = 21136,
		  items = [{5, 30400}, {22, 30900}, {1, 19300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21136,
		  hook_items =
		      [{5, 1520}, {22, 1545}, {1, 1720}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 559440, energy_max = 22000,
		  lev_limit = 149, floor = 456};
get(120170) ->
    #dungeon_data{id = 120170,
		  name = lang:get(<<"龙晶之谷457"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120180, unit_id = 21137,
		  items = [{5, 30600}, {22, 30900}, {1, 19300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21137,
		  hook_items =
		      [{5, 1530}, {22, 1545}, {1, 1720}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 559702, energy_max = 22000,
		  lev_limit = 149, floor = 457};
get(120180) ->
    #dungeon_data{id = 120180,
		  name = lang:get(<<"龙晶之谷458"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120190, unit_id = 21138,
		  items = [{5, 30600}, {22, 30900}, {1, 19300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21138,
		  hook_items =
		      [{5, 1530}, {22, 1545}, {1, 1720}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 559965, energy_max = 22000,
		  lev_limit = 149, floor = 458};
get(120190) ->
    #dungeon_data{id = 120190,
		  name = lang:get(<<"龙晶之谷459"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120200, unit_id = 21139,
		  items = [{5, 30600}, {22, 31100}, {1, 19400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21139,
		  hook_items =
		      [{5, 1530}, {22, 1555}, {1, 1730}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 560227, energy_max = 22000,
		  lev_limit = 149, floor = 459};
get(120200) ->
    #dungeon_data{id = 120200,
		  name = lang:get(<<"龙晶之谷460"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120210, unit_id = 21140,
		  items =
		      [{5, 107800}, {22, 108850}, {1, 67900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21140,
		  hook_items =
		      [{5, 1540}, {22, 1555}, {1, 1730}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 560490,
		  energy_max = 22000, lev_limit = 151, floor = 460};
get(120210) ->
    #dungeon_data{id = 120210,
		  name = lang:get(<<"龙晶之谷461"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120220, unit_id = 21141,
		  items = [{5, 30800}, {22, 31100}, {1, 19400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21141,
		  hook_items =
		      [{5, 1540}, {22, 1555}, {1, 1730}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 560752, energy_max = 22000,
		  lev_limit = 151, floor = 461};
get(120220) ->
    #dungeon_data{id = 120220,
		  name = lang:get(<<"龙晶之谷462"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120230, unit_id = 21142,
		  items = [{5, 30800}, {22, 31300}, {1, 19500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21142,
		  hook_items =
		      [{5, 1540}, {22, 1565}, {1, 1740}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 561015, energy_max = 22000,
		  lev_limit = 151, floor = 462};
get(120230) ->
    #dungeon_data{id = 120230,
		  name = lang:get(<<"龙晶之谷463"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120240, unit_id = 21201,
		  items = [{5, 31000}, {22, 31300}, {1, 19500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21201,
		  hook_items =
		      [{5, 1550}, {22, 1565}, {1, 1740}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 566469, energy_max = 22000,
		  lev_limit = 151, floor = 463};
get(120240) ->
    #dungeon_data{id = 120240,
		  name = lang:get(<<"龙晶之谷464"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120250, unit_id = 21202,
		  items = [{5, 31000}, {22, 31300}, {1, 19500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21202,
		  hook_items =
		      [{5, 1550}, {22, 1565}, {1, 1740}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 566732, energy_max = 22000,
		  lev_limit = 151, floor = 464};
get(120250) ->
    #dungeon_data{id = 120250,
		  name = lang:get(<<"龙晶之谷465"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120260, unit_id = 21203,
		  items =
		      [{5, 108500}, {22, 110250}, {1, 68600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21203,
		  hook_items =
		      [{5, 1550}, {22, 1575}, {1, 1750}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 566994,
		  energy_max = 22000, lev_limit = 151, floor = 465};
get(120260) ->
    #dungeon_data{id = 120260,
		  name = lang:get(<<"龙晶之谷466"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120270, unit_id = 21204,
		  items = [{5, 31200}, {22, 31500}, {1, 19600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21204,
		  hook_items =
		      [{5, 1560}, {22, 1575}, {1, 1750}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 567257, energy_max = 22000,
		  lev_limit = 153, floor = 466};
get(120270) ->
    #dungeon_data{id = 120270,
		  name = lang:get(<<"龙晶之谷467"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120280, unit_id = 21205,
		  items = [{5, 31200}, {22, 31500}, {1, 19600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21205,
		  hook_items =
		      [{5, 1560}, {22, 1575}, {1, 1750}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 567519, energy_max = 22000,
		  lev_limit = 153, floor = 467};
get(120280) ->
    #dungeon_data{id = 120280,
		  name = lang:get(<<"龙晶之谷468"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120290, unit_id = 21206,
		  items = [{5, 31200}, {22, 31700}, {1, 19700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21206,
		  hook_items =
		      [{5, 1560}, {22, 1585}, {1, 1760}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 567782, energy_max = 22000,
		  lev_limit = 153, floor = 468};
get(120290) ->
    #dungeon_data{id = 120290,
		  name = lang:get(<<"龙晶之谷469"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120300, unit_id = 21207,
		  items = [{5, 31400}, {22, 31700}, {1, 19700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21207,
		  hook_items =
		      [{5, 1570}, {22, 1585}, {1, 1760}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 568044, energy_max = 22000,
		  lev_limit = 153, floor = 469};
get(120300) ->
    #dungeon_data{id = 120300,
		  name = lang:get(<<"龙晶之谷470"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120310, unit_id = 21208,
		  items =
		      [{5, 109900}, {22, 110950}, {1, 68950}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21208,
		  hook_items =
		      [{5, 1570}, {22, 1585}, {1, 1760}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 568307,
		  energy_max = 22000, lev_limit = 153, floor = 470};
get(120310) ->
    #dungeon_data{id = 120310,
		  name = lang:get(<<"龙晶之谷471"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120320, unit_id = 21209,
		  items = [{5, 31400}, {22, 31900}, {1, 19800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21209,
		  hook_items =
		      [{5, 1570}, {22, 1595}, {1, 1770}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 573720, energy_max = 22000,
		  lev_limit = 153, floor = 471};
get(120320) ->
    #dungeon_data{id = 120320,
		  name = lang:get(<<"龙晶之谷472"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120330, unit_id = 21210,
		  items = [{5, 31600}, {22, 31900}, {1, 19800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21210,
		  hook_items =
		      [{5, 1580}, {22, 1595}, {1, 1770}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 573982, energy_max = 22000,
		  lev_limit = 155, floor = 472};
get(120330) ->
    #dungeon_data{id = 120330,
		  name = lang:get(<<"龙晶之谷473"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120340, unit_id = 21211,
		  items = [{5, 31600}, {22, 31900}, {1, 19800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21211,
		  hook_items =
		      [{5, 1580}, {22, 1595}, {1, 1770}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 574245, energy_max = 22000,
		  lev_limit = 155, floor = 473};
get(120340) ->
    #dungeon_data{id = 120340,
		  name = lang:get(<<"龙晶之谷474"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120350, unit_id = 21212,
		  items = [{5, 31600}, {22, 32100}, {1, 19900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21212,
		  hook_items =
		      [{5, 1580}, {22, 1605}, {1, 1780}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 574507, energy_max = 22000,
		  lev_limit = 155, floor = 474};
get(120350) ->
    #dungeon_data{id = 120350,
		  name = lang:get(<<"龙晶之谷475"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120360, unit_id = 21213,
		  items =
		      [{5, 111300}, {22, 112350}, {1, 69650}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21213,
		  hook_items =
		      [{5, 1590}, {22, 1605}, {1, 1780}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 574770,
		  energy_max = 22000, lev_limit = 155, floor = 475};
get(120360) ->
    #dungeon_data{id = 120360,
		  name = lang:get(<<"龙晶之谷476"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120370, unit_id = 21214,
		  items = [{5, 31800}, {22, 32100}, {1, 19900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21214,
		  hook_items =
		      [{5, 1590}, {22, 1605}, {1, 1780}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 575032, energy_max = 22000,
		  lev_limit = 155, floor = 476};
get(120370) ->
    #dungeon_data{id = 120370,
		  name = lang:get(<<"龙晶之谷477"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120380, unit_id = 21215,
		  items = [{5, 31800}, {22, 32300}, {1, 20000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21215,
		  hook_items =
		      [{5, 1590}, {22, 1615}, {1, 1790}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 575295, energy_max = 22000,
		  lev_limit = 155, floor = 477};
get(120380) ->
    #dungeon_data{id = 120380,
		  name = lang:get(<<"龙晶之谷478"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120390, unit_id = 21216,
		  items = [{5, 32000}, {22, 32300}, {1, 20000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21216,
		  hook_items =
		      [{5, 1600}, {22, 1615}, {1, 1790}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 575557, energy_max = 22000,
		  lev_limit = 157, floor = 478};
get(120390) ->
    #dungeon_data{id = 120390,
		  name = lang:get(<<"龙晶之谷479"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 120400, unit_id = 21217,
		  items = [{5, 32000}, {22, 32300}, {1, 20000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21217,
		  hook_items =
		      [{5, 1600}, {22, 1615}, {1, 1790}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 581001, energy_max = 22000,
		  lev_limit = 157, floor = 479};
get(120400) ->
    #dungeon_data{id = 120400,
		  name = lang:get(<<"龙晶之谷480"/utf8>>), chapter_id = 12,
		  mode = 1, next_id = 130010, unit_id = 21218,
		  items =
		      [{5, 112000}, {22, 113750}, {1, 70350}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21218,
		  hook_items =
		      [{5, 1600}, {22, 1625}, {1, 1800}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 581264,
		  energy_max = 22000, lev_limit = 157, floor = 480};
get(130010) ->
    #dungeon_data{id = 130010,
		  name = lang:get(<<"断弦山脉481"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130020, unit_id = 21219,
		  items = [{5, 32200}, {22, 32500}, {1, 20100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21219,
		  hook_items =
		      [{5, 1610}, {22, 1625}, {1, 1800}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 581526, energy_max = 22000,
		  lev_limit = 157, floor = 481};
get(130020) ->
    #dungeon_data{id = 130020,
		  name = lang:get(<<"断弦山脉482"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130030, unit_id = 21220,
		  items = [{5, 32200}, {22, 32500}, {1, 20100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21220,
		  hook_items =
		      [{5, 1610}, {22, 1625}, {1, 1800}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 581789, energy_max = 22000,
		  lev_limit = 157, floor = 482};
get(130030) ->
    #dungeon_data{id = 130030,
		  name = lang:get(<<"断弦山脉483"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130040, unit_id = 21221,
		  items = [{5, 32200}, {22, 32700}, {1, 20200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21221,
		  hook_items =
		      [{5, 1610}, {22, 1635}, {1, 1810}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 582051, energy_max = 22000,
		  lev_limit = 157, floor = 483};
get(130040) ->
    #dungeon_data{id = 130040,
		  name = lang:get(<<"断弦山脉484"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130050, unit_id = 21222,
		  items = [{5, 32400}, {22, 32700}, {1, 20200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21222,
		  hook_items =
		      [{5, 1620}, {22, 1635}, {1, 1810}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 582314, energy_max = 22000,
		  lev_limit = 159, floor = 484};
get(130050) ->
    #dungeon_data{id = 130050,
		  name = lang:get(<<"断弦山脉485"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130060, unit_id = 21223,
		  items =
		      [{5, 113400}, {22, 114450}, {1, 70700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21223,
		  hook_items =
		      [{5, 1620}, {22, 1635}, {1, 1810}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 582576,
		  energy_max = 22000, lev_limit = 159, floor = 485};
get(130060) ->
    #dungeon_data{id = 130060,
		  name = lang:get(<<"断弦山脉486"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130070, unit_id = 21224,
		  items = [{5, 32400}, {22, 32900}, {1, 20300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21224,
		  hook_items =
		      [{5, 1620}, {22, 1645}, {1, 1820}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 582839, energy_max = 22000,
		  lev_limit = 159, floor = 486};
get(130070) ->
    #dungeon_data{id = 130070,
		  name = lang:get(<<"断弦山脉487"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130080, unit_id = 21225,
		  items = [{5, 32600}, {22, 32900}, {1, 20300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21225,
		  hook_items =
		      [{5, 1630}, {22, 1645}, {1, 1820}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 588288, energy_max = 22000,
		  lev_limit = 159, floor = 487};
get(130080) ->
    #dungeon_data{id = 130080,
		  name = lang:get(<<"断弦山脉488"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130090, unit_id = 21226,
		  items = [{5, 32600}, {22, 32900}, {1, 20300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21226,
		  hook_items =
		      [{5, 1630}, {22, 1645}, {1, 1820}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 588551, energy_max = 22000,
		  lev_limit = 159, floor = 488};
get(130090) ->
    #dungeon_data{id = 130090,
		  name = lang:get(<<"断弦山脉489"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130100, unit_id = 21227,
		  items = [{5, 32600}, {22, 33100}, {1, 20400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21227,
		  hook_items =
		      [{5, 1630}, {22, 1655}, {1, 1830}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 588813, energy_max = 22000,
		  lev_limit = 159, floor = 489};
get(130100) ->
    #dungeon_data{id = 130100,
		  name = lang:get(<<"断弦山脉490"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130110, unit_id = 21228,
		  items =
		      [{5, 114800}, {22, 115850}, {1, 71400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21228,
		  hook_items =
		      [{5, 1640}, {22, 1655}, {1, 1830}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 589076,
		  energy_max = 22000, lev_limit = 161, floor = 490};
get(130110) ->
    #dungeon_data{id = 130110,
		  name = lang:get(<<"断弦山脉491"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130120, unit_id = 21229,
		  items = [{5, 32800}, {22, 33100}, {1, 20400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21229,
		  hook_items =
		      [{5, 1640}, {22, 1655}, {1, 1830}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 589338, energy_max = 22000,
		  lev_limit = 161, floor = 491};
get(130120) ->
    #dungeon_data{id = 130120,
		  name = lang:get(<<"断弦山脉492"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130130, unit_id = 21230,
		  items = [{5, 32800}, {22, 33300}, {1, 20500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21230,
		  hook_items =
		      [{5, 1640}, {22, 1665}, {1, 1840}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 589601, energy_max = 22000,
		  lev_limit = 161, floor = 492};
get(130130) ->
    #dungeon_data{id = 130130,
		  name = lang:get(<<"断弦山脉493"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130140, unit_id = 21231,
		  items = [{5, 33000}, {22, 33300}, {1, 20500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21231,
		  hook_items =
		      [{5, 1650}, {22, 1665}, {1, 1840}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 589863, energy_max = 22000,
		  lev_limit = 161, floor = 493};
get(130140) ->
    #dungeon_data{id = 130140,
		  name = lang:get(<<"断弦山脉494"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130150, unit_id = 21232,
		  items = [{5, 33000}, {22, 33300}, {1, 20500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21232,
		  hook_items =
		      [{5, 1650}, {22, 1665}, {1, 1840}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 590126, energy_max = 22000,
		  lev_limit = 161, floor = 494};
get(130150) ->
    #dungeon_data{id = 130150,
		  name = lang:get(<<"断弦山脉495"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130160, unit_id = 21233,
		  items =
		      [{5, 115500}, {22, 117250}, {1, 72100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21233,
		  hook_items =
		      [{5, 1650}, {22, 1675}, {1, 1850}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 603151,
		  energy_max = 22000, lev_limit = 161, floor = 495};
get(130160) ->
    #dungeon_data{id = 130160,
		  name = lang:get(<<"断弦山脉496"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130170, unit_id = 21234,
		  items = [{5, 33200}, {22, 33500}, {1, 20600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21234,
		  hook_items =
		      [{5, 1660}, {22, 1675}, {1, 1850}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 603414, energy_max = 22000,
		  lev_limit = 163, floor = 496};
get(130170) ->
    #dungeon_data{id = 130170,
		  name = lang:get(<<"断弦山脉497"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130180, unit_id = 21235,
		  items = [{5, 33200}, {22, 33500}, {1, 20600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21235,
		  hook_items =
		      [{5, 1660}, {22, 1675}, {1, 1850}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 603676, energy_max = 22000,
		  lev_limit = 163, floor = 497};
get(130180) ->
    #dungeon_data{id = 130180,
		  name = lang:get(<<"断弦山脉498"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130190, unit_id = 21236,
		  items = [{5, 33200}, {22, 33700}, {1, 20700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21236,
		  hook_items =
		      [{5, 1660}, {22, 1685}, {1, 1860}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 603939, energy_max = 22000,
		  lev_limit = 163, floor = 498};
get(130190) ->
    #dungeon_data{id = 130190,
		  name = lang:get(<<"断弦山脉499"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130200, unit_id = 21237,
		  items = [{5, 33400}, {22, 33700}, {1, 20700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21237,
		  hook_items =
		      [{5, 1670}, {22, 1685}, {1, 1860}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 604201, energy_max = 22000,
		  lev_limit = 163, floor = 499};
get(130200) ->
    #dungeon_data{id = 130200,
		  name = lang:get(<<"断弦山脉500"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130210, unit_id = 21238,
		  items =
		      [{5, 116900}, {22, 117950}, {1, 72450}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21238,
		  hook_items =
		      [{5, 1670}, {22, 1685}, {1, 1860}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 604464,
		  energy_max = 22000, lev_limit = 163, floor = 500};
get(130210) ->
    #dungeon_data{id = 130210,
		  name = lang:get(<<"断弦山脉501"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130220, unit_id = 21239,
		  items = [{5, 33400}, {22, 33900}, {1, 20800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21239,
		  hook_items =
		      [{5, 1670}, {22, 1695}, {1, 1870}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 604726, energy_max = 22000,
		  lev_limit = 163, floor = 501};
get(130220) ->
    #dungeon_data{id = 130220,
		  name = lang:get(<<"断弦山脉502"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130230, unit_id = 21240,
		  items = [{5, 33600}, {22, 33900}, {1, 20800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21240,
		  hook_items =
		      [{5, 1680}, {22, 1695}, {1, 1870}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 604989, energy_max = 22000,
		  lev_limit = 165, floor = 502};
get(130230) ->
    #dungeon_data{id = 130230,
		  name = lang:get(<<"断弦山脉503"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130240, unit_id = 21241,
		  items = [{5, 33600}, {22, 33900}, {1, 20800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21241,
		  hook_items =
		      [{5, 1680}, {22, 1695}, {1, 1870}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 610890, energy_max = 22000,
		  lev_limit = 165, floor = 503};
get(130240) ->
    #dungeon_data{id = 130240,
		  name = lang:get(<<"断弦山脉504"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130250, unit_id = 21242,
		  items = [{5, 33600}, {22, 34100}, {1, 20900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21242,
		  hook_items =
		      [{5, 1680}, {22, 1705}, {1, 1880}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 611152, energy_max = 22000,
		  lev_limit = 165, floor = 504};
get(130250) ->
    #dungeon_data{id = 130250,
		  name = lang:get(<<"断弦山脉505"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130260, unit_id = 21301,
		  items =
		      [{5, 118300}, {22, 119350}, {1, 73150}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21301,
		  hook_items =
		      [{5, 1690}, {22, 1705}, {1, 1880}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 611415,
		  energy_max = 22000, lev_limit = 165, floor = 505};
get(130260) ->
    #dungeon_data{id = 130260,
		  name = lang:get(<<"断弦山脉506"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130270, unit_id = 21302,
		  items = [{5, 33800}, {22, 34100}, {1, 20900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21302,
		  hook_items =
		      [{5, 1690}, {22, 1705}, {1, 1880}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 611677, energy_max = 22000,
		  lev_limit = 165, floor = 506};
get(130270) ->
    #dungeon_data{id = 130270,
		  name = lang:get(<<"断弦山脉507"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130280, unit_id = 21303,
		  items = [{5, 33800}, {22, 34300}, {1, 21000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21303,
		  hook_items =
		      [{5, 1690}, {22, 1715}, {1, 1890}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 611940, energy_max = 22000,
		  lev_limit = 165, floor = 507};
get(130280) ->
    #dungeon_data{id = 130280,
		  name = lang:get(<<"断弦山脉508"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130290, unit_id = 21304,
		  items = [{5, 34000}, {22, 34300}, {1, 21000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21304,
		  hook_items =
		      [{5, 1700}, {22, 1715}, {1, 1890}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 612202, energy_max = 22000,
		  lev_limit = 167, floor = 508};
get(130290) ->
    #dungeon_data{id = 130290,
		  name = lang:get(<<"断弦山脉509"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130300, unit_id = 21305,
		  items = [{5, 34000}, {22, 34300}, {1, 21000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21305,
		  hook_items =
		      [{5, 1700}, {22, 1715}, {1, 1890}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 612465, energy_max = 22000,
		  lev_limit = 167, floor = 509};
get(130300) ->
    #dungeon_data{id = 130300,
		  name = lang:get(<<"断弦山脉510"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130310, unit_id = 21306,
		  items =
		      [{5, 119000}, {22, 120750}, {1, 73850}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21306,
		  hook_items =
		      [{5, 1700}, {22, 1725}, {1, 1900}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 612727,
		  energy_max = 22000, lev_limit = 167, floor = 510};
get(130310) ->
    #dungeon_data{id = 130310,
		  name = lang:get(<<"断弦山脉511"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130320, unit_id = 21307,
		  items = [{5, 34200}, {22, 34500}, {1, 21100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21307,
		  hook_items =
		      [{5, 1710}, {22, 1725}, {1, 1900}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 618586, energy_max = 22000,
		  lev_limit = 167, floor = 511};
get(130320) ->
    #dungeon_data{id = 130320,
		  name = lang:get(<<"断弦山脉512"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130330, unit_id = 21308,
		  items = [{5, 34200}, {22, 34500}, {1, 21100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21308,
		  hook_items =
		      [{5, 1710}, {22, 1725}, {1, 1900}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 618849, energy_max = 22000,
		  lev_limit = 167, floor = 512};
get(130330) ->
    #dungeon_data{id = 130330,
		  name = lang:get(<<"断弦山脉513"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130340, unit_id = 21309,
		  items = [{5, 34200}, {22, 34700}, {1, 21200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21309,
		  hook_items =
		      [{5, 1710}, {22, 1735}, {1, 1910}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 619111, energy_max = 22000,
		  lev_limit = 167, floor = 513};
get(130340) ->
    #dungeon_data{id = 130340,
		  name = lang:get(<<"断弦山脉514"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130350, unit_id = 21310,
		  items = [{5, 34400}, {22, 34700}, {1, 21200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21310,
		  hook_items =
		      [{5, 1720}, {22, 1735}, {1, 1910}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 619374, energy_max = 22000,
		  lev_limit = 169, floor = 514};
get(130350) ->
    #dungeon_data{id = 130350,
		  name = lang:get(<<"断弦山脉515"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130360, unit_id = 21311,
		  items =
		      [{5, 120400}, {22, 121450}, {1, 74200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21311,
		  hook_items =
		      [{5, 1720}, {22, 1735}, {1, 1910}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 619636,
		  energy_max = 22000, lev_limit = 169, floor = 515};
get(130360) ->
    #dungeon_data{id = 130360,
		  name = lang:get(<<"断弦山脉516"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130370, unit_id = 21312,
		  items = [{5, 34400}, {22, 34900}, {1, 21300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21312,
		  hook_items =
		      [{5, 1720}, {22, 1745}, {1, 1920}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 619899, energy_max = 22000,
		  lev_limit = 169, floor = 516};
get(130370) ->
    #dungeon_data{id = 130370,
		  name = lang:get(<<"断弦山脉517"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130380, unit_id = 21313,
		  items = [{5, 34600}, {22, 34900}, {1, 21300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21313,
		  hook_items =
		      [{5, 1730}, {22, 1745}, {1, 1920}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 620161, energy_max = 22000,
		  lev_limit = 169, floor = 517};
get(130380) ->
    #dungeon_data{id = 130380,
		  name = lang:get(<<"断弦山脉518"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130390, unit_id = 21314,
		  items = [{5, 34600}, {22, 34900}, {1, 21300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21314,
		  hook_items =
		      [{5, 1730}, {22, 1745}, {1, 1920}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 620424, energy_max = 22000,
		  lev_limit = 169, floor = 518};
get(130390) ->
    #dungeon_data{id = 130390,
		  name = lang:get(<<"断弦山脉519"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 130400, unit_id = 21315,
		  items = [{5, 34600}, {22, 35100}, {1, 21400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21315,
		  hook_items =
		      [{5, 1730}, {22, 1755}, {1, 1930}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 626335, energy_max = 22000,
		  lev_limit = 169, floor = 519};
get(130400) ->
    #dungeon_data{id = 130400,
		  name = lang:get(<<"断弦山脉520"/utf8>>), chapter_id = 13,
		  mode = 1, next_id = 140010, unit_id = 21316,
		  items =
		      [{5, 121800}, {22, 122850}, {1, 74900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21316,
		  hook_items =
		      [{5, 1740}, {22, 1755}, {1, 1930}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 626598,
		  energy_max = 22000, lev_limit = 171, floor = 520};
get(140010) ->
    #dungeon_data{id = 140010,
		  name = lang:get(<<"勇者之巅521"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140020, unit_id = 21317,
		  items = [{5, 34800}, {22, 35100}, {1, 21400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21317,
		  hook_items =
		      [{5, 1740}, {22, 1755}, {1, 1930}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 626860, energy_max = 22000,
		  lev_limit = 171, floor = 521};
get(140020) ->
    #dungeon_data{id = 140020,
		  name = lang:get(<<"勇者之巅522"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140030, unit_id = 21318,
		  items = [{5, 34800}, {22, 35300}, {1, 21500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21318,
		  hook_items =
		      [{5, 1740}, {22, 1765}, {1, 1940}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 627123, energy_max = 22000,
		  lev_limit = 171, floor = 522};
get(140030) ->
    #dungeon_data{id = 140030,
		  name = lang:get(<<"勇者之巅523"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140040, unit_id = 21319,
		  items = [{5, 35000}, {22, 35300}, {1, 21500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21319,
		  hook_items =
		      [{5, 1750}, {22, 1765}, {1, 1940}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 627385, energy_max = 22000,
		  lev_limit = 171, floor = 523};
get(140040) ->
    #dungeon_data{id = 140040,
		  name = lang:get(<<"勇者之巅524"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140050, unit_id = 21320,
		  items = [{5, 35000}, {22, 35300}, {1, 21500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21320,
		  hook_items =
		      [{5, 1750}, {22, 1765}, {1, 1940}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 627648, energy_max = 22000,
		  lev_limit = 171, floor = 524};
get(140050) ->
    #dungeon_data{id = 140050,
		  name = lang:get(<<"勇者之巅525"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140060, unit_id = 21321,
		  items =
		      [{5, 122500}, {22, 124250}, {1, 75600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21321,
		  hook_items =
		      [{5, 1750}, {22, 1775}, {1, 1950}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 627910,
		  energy_max = 22000, lev_limit = 171, floor = 525};
get(140060) ->
    #dungeon_data{id = 140060,
		  name = lang:get(<<"勇者之巅526"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140070, unit_id = 21322,
		  items = [{5, 35200}, {22, 35500}, {1, 21600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21322,
		  hook_items =
		      [{5, 1760}, {22, 1775}, {1, 1950}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 628173, energy_max = 22000,
		  lev_limit = 173, floor = 526};
get(140070) ->
    #dungeon_data{id = 140070,
		  name = lang:get(<<"勇者之巅527"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140080, unit_id = 21323,
		  items = [{5, 35200}, {22, 35500}, {1, 21600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21323,
		  hook_items =
		      [{5, 1760}, {22, 1775}, {1, 1950}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 634074, energy_max = 22000,
		  lev_limit = 173, floor = 527};
get(140080) ->
    #dungeon_data{id = 140080,
		  name = lang:get(<<"勇者之巅528"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140090, unit_id = 21324,
		  items = [{5, 35200}, {22, 35700}, {1, 21700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21324,
		  hook_items =
		      [{5, 1760}, {22, 1785}, {1, 1960}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 634336, energy_max = 22000,
		  lev_limit = 173, floor = 528};
get(140090) ->
    #dungeon_data{id = 140090,
		  name = lang:get(<<"勇者之巅529"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140100, unit_id = 21325,
		  items = [{5, 35400}, {22, 35700}, {1, 21700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21325,
		  hook_items =
		      [{5, 1770}, {22, 1785}, {1, 1960}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 634599, energy_max = 22000,
		  lev_limit = 173, floor = 529};
get(140100) ->
    #dungeon_data{id = 140100,
		  name = lang:get(<<"勇者之巅530"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140110, unit_id = 21326,
		  items =
		      [{5, 123900}, {22, 124950}, {1, 75950}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21326,
		  hook_items =
		      [{5, 1770}, {22, 1785}, {1, 1960}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 634861,
		  energy_max = 22000, lev_limit = 173, floor = 530};
get(140110) ->
    #dungeon_data{id = 140110,
		  name = lang:get(<<"勇者之巅531"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140120, unit_id = 21327,
		  items = [{5, 35400}, {22, 35900}, {1, 21800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21327,
		  hook_items =
		      [{5, 1770}, {22, 1795}, {1, 1970}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 635124, energy_max = 22000,
		  lev_limit = 173, floor = 531};
get(140120) ->
    #dungeon_data{id = 140120,
		  name = lang:get(<<"勇者之巅532"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140130, unit_id = 21328,
		  items = [{5, 35600}, {22, 35900}, {1, 21800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21328,
		  hook_items =
		      [{5, 1780}, {22, 1795}, {1, 1970}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 635386, energy_max = 22000,
		  lev_limit = 175, floor = 532};
get(140130) ->
    #dungeon_data{id = 140130,
		  name = lang:get(<<"勇者之巅533"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140140, unit_id = 21329,
		  items = [{5, 35600}, {22, 35900}, {1, 21800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21329,
		  hook_items =
		      [{5, 1780}, {22, 1795}, {1, 1970}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 635649, energy_max = 22000,
		  lev_limit = 175, floor = 533};
get(140140) ->
    #dungeon_data{id = 140140,
		  name = lang:get(<<"勇者之巅534"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140150, unit_id = 21330,
		  items = [{5, 35600}, {22, 36100}, {1, 21900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21330,
		  hook_items =
		      [{5, 1780}, {22, 1805}, {1, 1980}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 635911, energy_max = 22000,
		  lev_limit = 175, floor = 534};
get(140150) ->
    #dungeon_data{id = 140150,
		  name = lang:get(<<"勇者之巅535"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140160, unit_id = 21331,
		  items =
		      [{5, 125300}, {22, 126350}, {1, 76650}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21331,
		  hook_items =
		      [{5, 1790}, {22, 1805}, {1, 1980}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 641786,
		  energy_max = 22000, lev_limit = 175, floor = 535};
get(140160) ->
    #dungeon_data{id = 140160,
		  name = lang:get(<<"勇者之巅536"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140170, unit_id = 21332,
		  items = [{5, 35800}, {22, 36100}, {1, 21900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21332,
		  hook_items =
		      [{5, 1790}, {22, 1805}, {1, 1980}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 642048, energy_max = 22000,
		  lev_limit = 175, floor = 536};
get(140170) ->
    #dungeon_data{id = 140170,
		  name = lang:get(<<"勇者之巅537"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140180, unit_id = 21333,
		  items = [{5, 35800}, {22, 36300}, {1, 22000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21333,
		  hook_items =
		      [{5, 1790}, {22, 1815}, {1, 1990}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 642311, energy_max = 22000,
		  lev_limit = 175, floor = 537};
get(140180) ->
    #dungeon_data{id = 140180,
		  name = lang:get(<<"勇者之巅538"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140190, unit_id = 21334,
		  items = [{5, 36000}, {22, 36300}, {1, 22000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21334,
		  hook_items =
		      [{5, 1800}, {22, 1815}, {1, 1990}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 642573, energy_max = 22000,
		  lev_limit = 177, floor = 538};
get(140190) ->
    #dungeon_data{id = 140190,
		  name = lang:get(<<"勇者之巅539"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140200, unit_id = 21335,
		  items = [{5, 36000}, {22, 36300}, {1, 22000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21335,
		  hook_items =
		      [{5, 1800}, {22, 1815}, {1, 1990}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 642836, energy_max = 22000,
		  lev_limit = 177, floor = 539};
get(140200) ->
    #dungeon_data{id = 140200,
		  name = lang:get(<<"勇者之巅540"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140210, unit_id = 21336,
		  items =
		      [{5, 126000}, {22, 127750}, {1, 77350}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21336,
		  hook_items =
		      [{5, 1800}, {22, 1825}, {1, 2000}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 643098,
		  energy_max = 22000, lev_limit = 177, floor = 540};
get(140210) ->
    #dungeon_data{id = 140210,
		  name = lang:get(<<"勇者之巅541"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140220, unit_id = 21337,
		  items = [{5, 36200}, {22, 36500}, {1, 22100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21337,
		  hook_items =
		      [{5, 1810}, {22, 1825}, {1, 2000}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 643361, energy_max = 22000,
		  lev_limit = 177, floor = 541};
get(140220) ->
    #dungeon_data{id = 140220,
		  name = lang:get(<<"勇者之巅542"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140230, unit_id = 21338,
		  items = [{5, 36200}, {22, 36500}, {1, 22100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21338,
		  hook_items =
		      [{5, 1810}, {22, 1825}, {1, 2000}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 643623, energy_max = 22000,
		  lev_limit = 177, floor = 542};
get(140230) ->
    #dungeon_data{id = 140230,
		  name = lang:get(<<"勇者之巅543"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140240, unit_id = 21339,
		  items = [{5, 36200}, {22, 36700}, {1, 22200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21339,
		  hook_items =
		      [{5, 1810}, {22, 1835}, {1, 2010}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 649514, energy_max = 22000,
		  lev_limit = 177, floor = 543};
get(140240) ->
    #dungeon_data{id = 140240,
		  name = lang:get(<<"勇者之巅544"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140250, unit_id = 21340,
		  items = [{5, 36400}, {22, 36700}, {1, 22200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21340,
		  hook_items =
		      [{5, 1820}, {22, 1835}, {1, 2010}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 649776, energy_max = 22000,
		  lev_limit = 179, floor = 544};
get(140250) ->
    #dungeon_data{id = 140250,
		  name = lang:get(<<"勇者之巅545"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140260, unit_id = 21341,
		  items =
		      [{5, 127400}, {22, 128450}, {1, 77700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21341,
		  hook_items =
		      [{5, 1820}, {22, 1835}, {1, 2010}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 650039,
		  energy_max = 22000, lev_limit = 179, floor = 545};
get(140260) ->
    #dungeon_data{id = 140260,
		  name = lang:get(<<"勇者之巅546"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140270, unit_id = 21342,
		  items = [{5, 36400}, {22, 36900}, {1, 22300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21342,
		  hook_items =
		      [{5, 1820}, {22, 1845}, {1, 2020}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 650301, energy_max = 22000,
		  lev_limit = 179, floor = 546};
get(140270) ->
    #dungeon_data{id = 140270,
		  name = lang:get(<<"勇者之巅547"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140280, unit_id = 21401,
		  items = [{5, 36600}, {22, 36900}, {1, 22300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21401,
		  hook_items =
		      [{5, 1830}, {22, 1845}, {1, 2020}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 650564, energy_max = 22000,
		  lev_limit = 179, floor = 547};
get(140280) ->
    #dungeon_data{id = 140280,
		  name = lang:get(<<"勇者之巅548"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140290, unit_id = 21402,
		  items = [{5, 36600}, {22, 36900}, {1, 22300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21402,
		  hook_items =
		      [{5, 1830}, {22, 1845}, {1, 2020}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 650826, energy_max = 22000,
		  lev_limit = 179, floor = 548};
get(140290) ->
    #dungeon_data{id = 140290,
		  name = lang:get(<<"勇者之巅549"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140300, unit_id = 21403,
		  items = [{5, 36600}, {22, 37100}, {1, 22400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21403,
		  hook_items =
		      [{5, 1830}, {22, 1855}, {1, 2030}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 651089, energy_max = 22000,
		  lev_limit = 179, floor = 549};
get(140300) ->
    #dungeon_data{id = 140300,
		  name = lang:get(<<"勇者之巅550"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140310, unit_id = 21404,
		  items =
		      [{5, 128800}, {22, 129850}, {1, 78400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21404,
		  hook_items =
		      [{5, 1840}, {22, 1855}, {1, 2030}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 651351,
		  energy_max = 22000, lev_limit = 181, floor = 550};
get(140310) ->
    #dungeon_data{id = 140310,
		  name = lang:get(<<"勇者之巅551"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140320, unit_id = 21405,
		  items = [{5, 36800}, {22, 37100}, {1, 22400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21405,
		  hook_items =
		      [{5, 1840}, {22, 1855}, {1, 2030}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 657226, energy_max = 22000,
		  lev_limit = 181, floor = 551};
get(140320) ->
    #dungeon_data{id = 140320,
		  name = lang:get(<<"勇者之巅552"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140330, unit_id = 21406,
		  items = [{5, 36800}, {22, 37300}, {1, 22500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21406,
		  hook_items =
		      [{5, 1840}, {22, 1865}, {1, 2040}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 657489, energy_max = 22000,
		  lev_limit = 181, floor = 552};
get(140330) ->
    #dungeon_data{id = 140330,
		  name = lang:get(<<"勇者之巅553"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140340, unit_id = 21407,
		  items = [{5, 37000}, {22, 37300}, {1, 22500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21407,
		  hook_items =
		      [{5, 1850}, {22, 1865}, {1, 2040}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 657751, energy_max = 22000,
		  lev_limit = 181, floor = 553};
get(140340) ->
    #dungeon_data{id = 140340,
		  name = lang:get(<<"勇者之巅554"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140350, unit_id = 21408,
		  items = [{5, 37000}, {22, 37300}, {1, 22500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21408,
		  hook_items =
		      [{5, 1850}, {22, 1865}, {1, 2040}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 658014, energy_max = 22000,
		  lev_limit = 181, floor = 554};
get(140350) ->
    #dungeon_data{id = 140350,
		  name = lang:get(<<"勇者之巅555"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140360, unit_id = 21409,
		  items =
		      [{5, 129500}, {22, 131250}, {1, 79100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21409,
		  hook_items =
		      [{5, 1850}, {22, 1875}, {1, 2050}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 658276,
		  energy_max = 22000, lev_limit = 181, floor = 555};
get(140360) ->
    #dungeon_data{id = 140360,
		  name = lang:get(<<"勇者之巅556"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140370, unit_id = 21410,
		  items = [{5, 37200}, {22, 37500}, {1, 22600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21410,
		  hook_items =
		      [{5, 1860}, {22, 1875}, {1, 2050}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 658539, energy_max = 22000,
		  lev_limit = 183, floor = 556};
get(140370) ->
    #dungeon_data{id = 140370,
		  name = lang:get(<<"勇者之巅557"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140380, unit_id = 21411,
		  items = [{5, 37200}, {22, 37500}, {1, 22600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21411,
		  hook_items =
		      [{5, 1860}, {22, 1875}, {1, 2050}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 658801, energy_max = 22000,
		  lev_limit = 183, floor = 557};
get(140380) ->
    #dungeon_data{id = 140380,
		  name = lang:get(<<"勇者之巅558"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140390, unit_id = 21412,
		  items = [{5, 37200}, {22, 37700}, {1, 22700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21412,
		  hook_items =
		      [{5, 1860}, {22, 1885}, {1, 2060}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 659064, energy_max = 22000,
		  lev_limit = 183, floor = 558};
get(140390) ->
    #dungeon_data{id = 140390,
		  name = lang:get(<<"勇者之巅559"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 140400, unit_id = 21413,
		  items = [{5, 37400}, {22, 37700}, {1, 22700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21413,
		  hook_items =
		      [{5, 1870}, {22, 1885}, {1, 2060}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 664965, energy_max = 22000,
		  lev_limit = 183, floor = 559};
get(140400) ->
    #dungeon_data{id = 140400,
		  name = lang:get(<<"勇者之巅560"/utf8>>), chapter_id = 14,
		  mode = 1, next_id = 150010, unit_id = 21414,
		  items =
		      [{5, 130900}, {22, 131950}, {1, 79450}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21414,
		  hook_items =
		      [{5, 1870}, {22, 1885}, {1, 2060}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 665227,
		  energy_max = 22000, lev_limit = 183, floor = 560};
get(150010) ->
    #dungeon_data{id = 150010,
		  name = lang:get(<<"雾黎之都561"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150020, unit_id = 21415,
		  items = [{5, 37400}, {22, 37900}, {1, 22800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21415,
		  hook_items =
		      [{5, 1870}, {22, 1895}, {1, 2070}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 665490, energy_max = 22000,
		  lev_limit = 183, floor = 561};
get(150020) ->
    #dungeon_data{id = 150020,
		  name = lang:get(<<"雾黎之都562"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150030, unit_id = 21416,
		  items = [{5, 37600}, {22, 37900}, {1, 22800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21416,
		  hook_items =
		      [{5, 1880}, {22, 1895}, {1, 2070}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 665752, energy_max = 22000,
		  lev_limit = 185, floor = 562};
get(150030) ->
    #dungeon_data{id = 150030,
		  name = lang:get(<<"雾黎之都563"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150040, unit_id = 21417,
		  items = [{5, 37600}, {22, 37900}, {1, 22800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21417,
		  hook_items =
		      [{5, 1880}, {22, 1895}, {1, 2070}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 666015, energy_max = 22000,
		  lev_limit = 185, floor = 563};
get(150040) ->
    #dungeon_data{id = 150040,
		  name = lang:get(<<"雾黎之都564"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150050, unit_id = 21418,
		  items = [{5, 37600}, {22, 38100}, {1, 22900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21418,
		  hook_items =
		      [{5, 1880}, {22, 1905}, {1, 2080}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 666277, energy_max = 22000,
		  lev_limit = 185, floor = 564};
get(150050) ->
    #dungeon_data{id = 150050,
		  name = lang:get(<<"雾黎之都565"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150060, unit_id = 21419,
		  items =
		      [{5, 132300}, {22, 133350}, {1, 80150}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21419,
		  hook_items =
		      [{5, 1890}, {22, 1905}, {1, 2080}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 666540,
		  energy_max = 22000, lev_limit = 185, floor = 565};
get(150060) ->
    #dungeon_data{id = 150060,
		  name = lang:get(<<"雾黎之都566"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150070, unit_id = 21420,
		  items = [{5, 37800}, {22, 38100}, {1, 22900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21420,
		  hook_items =
		      [{5, 1890}, {22, 1905}, {1, 2080}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 666802, energy_max = 22000,
		  lev_limit = 185, floor = 566};
get(150070) ->
    #dungeon_data{id = 150070,
		  name = lang:get(<<"雾黎之都567"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150080, unit_id = 21421,
		  items = [{5, 37800}, {22, 38300}, {1, 23000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21421,
		  hook_items =
		      [{5, 1890}, {22, 1915}, {1, 2090}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 672703, energy_max = 22000,
		  lev_limit = 185, floor = 567};
get(150080) ->
    #dungeon_data{id = 150080,
		  name = lang:get(<<"雾黎之都568"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150090, unit_id = 21422,
		  items = [{5, 38000}, {22, 38300}, {1, 23000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21422,
		  hook_items =
		      [{5, 1900}, {22, 1915}, {1, 2090}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 672966, energy_max = 22000,
		  lev_limit = 187, floor = 568};
get(150090) ->
    #dungeon_data{id = 150090,
		  name = lang:get(<<"雾黎之都569"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150100, unit_id = 21423,
		  items = [{5, 38000}, {22, 38300}, {1, 23000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21423,
		  hook_items =
		      [{5, 1900}, {22, 1915}, {1, 2090}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 673228, energy_max = 22000,
		  lev_limit = 187, floor = 569};
get(150100) ->
    #dungeon_data{id = 150100,
		  name = lang:get(<<"雾黎之都570"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150110, unit_id = 21424,
		  items =
		      [{5, 133000}, {22, 134750}, {1, 80850}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21424,
		  hook_items =
		      [{5, 1900}, {22, 1925}, {1, 2100}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 673491,
		  energy_max = 22000, lev_limit = 187, floor = 570};
get(150110) ->
    #dungeon_data{id = 150110,
		  name = lang:get(<<"雾黎之都571"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150120, unit_id = 21425,
		  items = [{5, 38200}, {22, 38500}, {1, 23100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21425,
		  hook_items =
		      [{5, 1910}, {22, 1925}, {1, 2100}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 673753, energy_max = 22000,
		  lev_limit = 187, floor = 571};
get(150120) ->
    #dungeon_data{id = 150120,
		  name = lang:get(<<"雾黎之都572"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150130, unit_id = 21426,
		  items = [{5, 38200}, {22, 38500}, {1, 23100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21426,
		  hook_items =
		      [{5, 1910}, {22, 1925}, {1, 2100}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 674016, energy_max = 22000,
		  lev_limit = 187, floor = 572};
get(150130) ->
    #dungeon_data{id = 150130,
		  name = lang:get(<<"雾黎之都573"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150140, unit_id = 21427,
		  items = [{5, 38200}, {22, 38700}, {1, 23200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21427,
		  hook_items =
		      [{5, 1910}, {22, 1935}, {1, 2110}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 674278, energy_max = 22000,
		  lev_limit = 187, floor = 573};
get(150140) ->
    #dungeon_data{id = 150140,
		  name = lang:get(<<"雾黎之都574"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150150, unit_id = 21428,
		  items = [{5, 38400}, {22, 38700}, {1, 23200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21428,
		  hook_items =
		      [{5, 1920}, {22, 1935}, {1, 2110}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 674541, energy_max = 22000,
		  lev_limit = 189, floor = 574};
get(150150) ->
    #dungeon_data{id = 150150,
		  name = lang:get(<<"雾黎之都575"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150160, unit_id = 21429,
		  items =
		      [{5, 134400}, {22, 135450}, {1, 81200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21429,
		  hook_items =
		      [{5, 1920}, {22, 1935}, {1, 2110}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 688453,
		  energy_max = 22000, lev_limit = 189, floor = 575};
get(150160) ->
    #dungeon_data{id = 150160,
		  name = lang:get(<<"雾黎之都576"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150170, unit_id = 21430,
		  items = [{5, 38400}, {22, 38900}, {1, 23300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21430,
		  hook_items =
		      [{5, 1920}, {22, 1945}, {1, 2120}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 688716, energy_max = 22000,
		  lev_limit = 189, floor = 576};
get(150170) ->
    #dungeon_data{id = 150170,
		  name = lang:get(<<"雾黎之都577"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150180, unit_id = 21431,
		  items = [{5, 38600}, {22, 38900}, {1, 23300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21431,
		  hook_items =
		      [{5, 1930}, {22, 1945}, {1, 2120}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 688978, energy_max = 22000,
		  lev_limit = 189, floor = 577};
get(150180) ->
    #dungeon_data{id = 150180,
		  name = lang:get(<<"雾黎之都578"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150190, unit_id = 21432,
		  items = [{5, 38600}, {22, 38900}, {1, 23300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21432,
		  hook_items =
		      [{5, 1930}, {22, 1945}, {1, 2120}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 689241, energy_max = 22000,
		  lev_limit = 189, floor = 578};
get(150190) ->
    #dungeon_data{id = 150190,
		  name = lang:get(<<"雾黎之都579"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150200, unit_id = 21433,
		  items = [{5, 38600}, {22, 39100}, {1, 23400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21433,
		  hook_items =
		      [{5, 1930}, {22, 1955}, {1, 2130}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 689503, energy_max = 22000,
		  lev_limit = 189, floor = 579};
get(150200) ->
    #dungeon_data{id = 150200,
		  name = lang:get(<<"雾黎之都580"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150210, unit_id = 21434,
		  items =
		      [{5, 135800}, {22, 136850}, {1, 81900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21434,
		  hook_items =
		      [{5, 1940}, {22, 1955}, {1, 2130}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 689766,
		  energy_max = 22000, lev_limit = 191, floor = 580};
get(150210) ->
    #dungeon_data{id = 150210,
		  name = lang:get(<<"雾黎之都581"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150220, unit_id = 21435,
		  items = [{5, 38800}, {22, 39100}, {1, 23400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21435,
		  hook_items =
		      [{5, 1940}, {22, 1955}, {1, 2130}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 690028, energy_max = 22000,
		  lev_limit = 191, floor = 581};
get(150220) ->
    #dungeon_data{id = 150220,
		  name = lang:get(<<"雾黎之都582"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150230, unit_id = 21436,
		  items = [{5, 38800}, {22, 39300}, {1, 23500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21436,
		  hook_items =
		      [{5, 1940}, {22, 1965}, {1, 2140}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 690291, energy_max = 22000,
		  lev_limit = 191, floor = 582};
get(150230) ->
    #dungeon_data{id = 150230,
		  name = lang:get(<<"雾黎之都583"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150240, unit_id = 21437,
		  items = [{5, 39000}, {22, 39300}, {1, 23500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21437,
		  hook_items =
		      [{5, 1950}, {22, 1965}, {1, 2140}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 696648, energy_max = 22000,
		  lev_limit = 191, floor = 583};
get(150240) ->
    #dungeon_data{id = 150240,
		  name = lang:get(<<"雾黎之都584"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150250, unit_id = 21438,
		  items = [{5, 39000}, {22, 39300}, {1, 23500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21438,
		  hook_items =
		      [{5, 1950}, {22, 1965}, {1, 2140}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 696911, energy_max = 22000,
		  lev_limit = 191, floor = 584};
get(150250) ->
    #dungeon_data{id = 150250,
		  name = lang:get(<<"雾黎之都585"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150260, unit_id = 21439,
		  items =
		      [{5, 136500}, {22, 138250}, {1, 82600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21439,
		  hook_items =
		      [{5, 1950}, {22, 1975}, {1, 2150}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 697173,
		  energy_max = 22000, lev_limit = 191, floor = 585};
get(150260) ->
    #dungeon_data{id = 150260,
		  name = lang:get(<<"雾黎之都586"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150270, unit_id = 21440,
		  items = [{5, 39200}, {22, 39500}, {1, 23600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21440,
		  hook_items =
		      [{5, 1960}, {22, 1975}, {1, 2150}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 697436, energy_max = 22000,
		  lev_limit = 193, floor = 586};
get(150270) ->
    #dungeon_data{id = 150270,
		  name = lang:get(<<"雾黎之都587"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150280, unit_id = 21441,
		  items = [{5, 39200}, {22, 39500}, {1, 23600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21441,
		  hook_items =
		      [{5, 1960}, {22, 1975}, {1, 2150}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 697698, energy_max = 22000,
		  lev_limit = 193, floor = 587};
get(150280) ->
    #dungeon_data{id = 150280,
		  name = lang:get(<<"雾黎之都588"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150290, unit_id = 21442,
		  items = [{5, 39200}, {22, 39700}, {1, 23700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21442,
		  hook_items =
		      [{5, 1960}, {22, 1985}, {1, 2160}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 697961, energy_max = 22000,
		  lev_limit = 193, floor = 588};
get(150290) ->
    #dungeon_data{id = 150290,
		  name = lang:get(<<"雾黎之都589"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150300, unit_id = 21501,
		  items = [{5, 39400}, {22, 39700}, {1, 23700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21501,
		  hook_items =
		      [{5, 1970}, {22, 1985}, {1, 2160}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 698223, energy_max = 22000,
		  lev_limit = 193, floor = 589};
get(150300) ->
    #dungeon_data{id = 150300,
		  name = lang:get(<<"雾黎之都590"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150310, unit_id = 21502,
		  items =
		      [{5, 137900}, {22, 138950}, {1, 82950}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21502,
		  hook_items =
		      [{5, 1970}, {22, 1985}, {1, 2160}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 698486,
		  energy_max = 22000, lev_limit = 193, floor = 590};
get(150310) ->
    #dungeon_data{id = 150310,
		  name = lang:get(<<"雾黎之都591"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150320, unit_id = 21503,
		  items = [{5, 39400}, {22, 39900}, {1, 23800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21503,
		  hook_items =
		      [{5, 1970}, {22, 1995}, {1, 2170}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 704796, energy_max = 22000,
		  lev_limit = 193, floor = 591};
get(150320) ->
    #dungeon_data{id = 150320,
		  name = lang:get(<<"雾黎之都592"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150330, unit_id = 21504,
		  items = [{5, 39600}, {22, 39900}, {1, 23800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21504,
		  hook_items =
		      [{5, 1980}, {22, 1995}, {1, 2170}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 705059, energy_max = 22000,
		  lev_limit = 195, floor = 592};
get(150330) ->
    #dungeon_data{id = 150330,
		  name = lang:get(<<"雾黎之都593"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150340, unit_id = 21505,
		  items = [{5, 39600}, {22, 39900}, {1, 23800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21505,
		  hook_items =
		      [{5, 1980}, {22, 1995}, {1, 2170}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 705321, energy_max = 22000,
		  lev_limit = 195, floor = 593};
get(150340) ->
    #dungeon_data{id = 150340,
		  name = lang:get(<<"雾黎之都594"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150350, unit_id = 21506,
		  items = [{5, 39600}, {22, 40100}, {1, 23900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21506,
		  hook_items =
		      [{5, 1980}, {22, 2005}, {1, 2180}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 705584, energy_max = 22000,
		  lev_limit = 195, floor = 594};
get(150350) ->
    #dungeon_data{id = 150350,
		  name = lang:get(<<"雾黎之都595"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150360, unit_id = 21507,
		  items =
		      [{5, 139300}, {22, 140350}, {1, 83650}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21507,
		  hook_items =
		      [{5, 1990}, {22, 2005}, {1, 2180}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 705846,
		  energy_max = 22000, lev_limit = 195, floor = 595};
get(150360) ->
    #dungeon_data{id = 150360,
		  name = lang:get(<<"雾黎之都596"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150370, unit_id = 21508,
		  items = [{5, 39800}, {22, 40100}, {1, 23900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21508,
		  hook_items =
		      [{5, 1990}, {22, 2005}, {1, 2180}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 706109, energy_max = 22000,
		  lev_limit = 195, floor = 596};
get(150370) ->
    #dungeon_data{id = 150370,
		  name = lang:get(<<"雾黎之都597"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150380, unit_id = 21509,
		  items = [{5, 39800}, {22, 40300}, {1, 24000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21509,
		  hook_items =
		      [{5, 1990}, {22, 2015}, {1, 2190}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 706371, energy_max = 22000,
		  lev_limit = 195, floor = 597};
get(150380) ->
    #dungeon_data{id = 150380,
		  name = lang:get(<<"雾黎之都598"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150390, unit_id = 21510,
		  items = [{5, 40000}, {22, 40300}, {1, 24000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21510,
		  hook_items =
		      [{5, 2000}, {22, 2015}, {1, 2190}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 706634, energy_max = 22000,
		  lev_limit = 197, floor = 598};
get(150390) ->
    #dungeon_data{id = 150390,
		  name = lang:get(<<"雾黎之都599"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 150400, unit_id = 21511,
		  items = [{5, 40000}, {22, 40300}, {1, 24000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21511,
		  hook_items =
		      [{5, 2000}, {22, 2015}, {1, 2190}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 712992, energy_max = 22000,
		  lev_limit = 197, floor = 599};
get(150400) ->
    #dungeon_data{id = 150400,
		  name = lang:get(<<"雾黎之都600"/utf8>>), chapter_id = 15,
		  mode = 1, next_id = 160010, unit_id = 21512,
		  items =
		      [{5, 140000}, {22, 141750}, {1, 84350}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21512,
		  hook_items =
		      [{5, 2000}, {22, 2025}, {1, 2200}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 713254,
		  energy_max = 22000, lev_limit = 197, floor = 600};
get(160010) ->
    #dungeon_data{id = 160010,
		  name = lang:get(<<"地心熔炉601"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160020, unit_id = 21513,
		  items = [{5, 40200}, {22, 40500}, {1, 24100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21513,
		  hook_items =
		      [{5, 2010}, {22, 2025}, {1, 2200}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 713517, energy_max = 22000,
		  lev_limit = 197, floor = 601};
get(160020) ->
    #dungeon_data{id = 160020,
		  name = lang:get(<<"地心熔炉602"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160030, unit_id = 21514,
		  items = [{5, 40200}, {22, 40500}, {1, 24100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21514,
		  hook_items =
		      [{5, 2010}, {22, 2025}, {1, 2200}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 713779, energy_max = 22000,
		  lev_limit = 197, floor = 602};
get(160030) ->
    #dungeon_data{id = 160030,
		  name = lang:get(<<"地心熔炉603"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160040, unit_id = 21515,
		  items = [{5, 40200}, {22, 40700}, {1, 24200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21515,
		  hook_items =
		      [{5, 2010}, {22, 2035}, {1, 2210}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 714042, energy_max = 22000,
		  lev_limit = 197, floor = 603};
get(160040) ->
    #dungeon_data{id = 160040,
		  name = lang:get(<<"地心熔炉604"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160050, unit_id = 21516,
		  items = [{5, 40400}, {22, 40700}, {1, 24200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21516,
		  hook_items =
		      [{5, 2020}, {22, 2035}, {1, 2210}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 714304, energy_max = 22000,
		  lev_limit = 199, floor = 604};
get(160050) ->
    #dungeon_data{id = 160050,
		  name = lang:get(<<"地心熔炉605"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160060, unit_id = 21517,
		  items =
		      [{5, 141400}, {22, 142450}, {1, 84700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21517,
		  hook_items =
		      [{5, 2020}, {22, 2035}, {1, 2210}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 714567,
		  energy_max = 22000, lev_limit = 199, floor = 605};
get(160060) ->
    #dungeon_data{id = 160060,
		  name = lang:get(<<"地心熔炉606"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160070, unit_id = 21518,
		  items = [{5, 40400}, {22, 40900}, {1, 24300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21518,
		  hook_items =
		      [{5, 2020}, {22, 2045}, {1, 2220}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 714829, energy_max = 22000,
		  lev_limit = 199, floor = 606};
get(160070) ->
    #dungeon_data{id = 160070,
		  name = lang:get(<<"地心熔炉607"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160080, unit_id = 21519,
		  items = [{5, 40600}, {22, 40900}, {1, 24300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21519,
		  hook_items =
		      [{5, 2030}, {22, 2045}, {1, 2220}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 721187, energy_max = 22000,
		  lev_limit = 199, floor = 607};
get(160080) ->
    #dungeon_data{id = 160080,
		  name = lang:get(<<"地心熔炉608"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160090, unit_id = 21520,
		  items = [{5, 40600}, {22, 40900}, {1, 24300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21520,
		  hook_items =
		      [{5, 2030}, {22, 2045}, {1, 2220}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 721449, energy_max = 22000,
		  lev_limit = 199, floor = 608};
get(160090) ->
    #dungeon_data{id = 160090,
		  name = lang:get(<<"地心熔炉609"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160100, unit_id = 21521,
		  items = [{5, 40600}, {22, 41100}, {1, 24400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21521,
		  hook_items =
		      [{5, 2030}, {22, 2055}, {1, 2230}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 721712, energy_max = 22000,
		  lev_limit = 199, floor = 609};
get(160100) ->
    #dungeon_data{id = 160100,
		  name = lang:get(<<"地心熔炉610"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160110, unit_id = 21522,
		  items =
		      [{5, 142800}, {22, 143850}, {1, 85400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21522,
		  hook_items =
		      [{5, 2040}, {22, 2055}, {1, 2230}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 721974,
		  energy_max = 22000, lev_limit = 201, floor = 610};
get(160110) ->
    #dungeon_data{id = 160110,
		  name = lang:get(<<"地心熔炉611"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160120, unit_id = 21523,
		  items = [{5, 40800}, {22, 41100}, {1, 24400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21523,
		  hook_items =
		      [{5, 2040}, {22, 2055}, {1, 2230}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 722237, energy_max = 22000,
		  lev_limit = 201, floor = 611};
get(160120) ->
    #dungeon_data{id = 160120,
		  name = lang:get(<<"地心熔炉612"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160130, unit_id = 21524,
		  items = [{5, 40800}, {22, 41300}, {1, 24500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21524,
		  hook_items =
		      [{5, 2040}, {22, 2065}, {1, 2240}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 722499, energy_max = 22000,
		  lev_limit = 201, floor = 612};
get(160130) ->
    #dungeon_data{id = 160130,
		  name = lang:get(<<"地心熔炉613"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160140, unit_id = 21525,
		  items = [{5, 41000}, {22, 41300}, {1, 24500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21525,
		  hook_items =
		      [{5, 2050}, {22, 2065}, {1, 2240}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 722762, energy_max = 22000,
		  lev_limit = 201, floor = 613};
get(160140) ->
    #dungeon_data{id = 160140,
		  name = lang:get(<<"地心熔炉614"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160150, unit_id = 21526,
		  items = [{5, 41000}, {22, 41300}, {1, 24500}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21526,
		  hook_items =
		      [{5, 2050}, {22, 2065}, {1, 2240}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 723024, energy_max = 22000,
		  lev_limit = 201, floor = 614};
get(160150) ->
    #dungeon_data{id = 160150,
		  name = lang:get(<<"地心熔炉615"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160160, unit_id = 21527,
		  items =
		      [{5, 143500}, {22, 145250}, {1, 86100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21527,
		  hook_items =
		      [{5, 2050}, {22, 2075}, {1, 2250}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 729351,
		  energy_max = 22000, lev_limit = 201, floor = 615};
get(160160) ->
    #dungeon_data{id = 160160,
		  name = lang:get(<<"地心熔炉616"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160170, unit_id = 21528,
		  items = [{5, 41200}, {22, 41500}, {1, 24600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21528,
		  hook_items =
		      [{5, 2060}, {22, 2075}, {1, 2250}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 729613, energy_max = 22000,
		  lev_limit = 203, floor = 616};
get(160170) ->
    #dungeon_data{id = 160170,
		  name = lang:get(<<"地心熔炉617"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160180, unit_id = 21529,
		  items = [{5, 41200}, {22, 41500}, {1, 24600}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21529,
		  hook_items =
		      [{5, 2060}, {22, 2075}, {1, 2250}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 729876, energy_max = 22000,
		  lev_limit = 203, floor = 617};
get(160180) ->
    #dungeon_data{id = 160180,
		  name = lang:get(<<"地心熔炉618"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160190, unit_id = 21530,
		  items = [{5, 41200}, {22, 41700}, {1, 24700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21530,
		  hook_items =
		      [{5, 2060}, {22, 2085}, {1, 2260}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 730138, energy_max = 22000,
		  lev_limit = 203, floor = 618};
get(160190) ->
    #dungeon_data{id = 160190,
		  name = lang:get(<<"地心熔炉619"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160200, unit_id = 21531,
		  items = [{5, 41400}, {22, 41700}, {1, 24700}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21531,
		  hook_items =
		      [{5, 2070}, {22, 2085}, {1, 2260}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 730401, energy_max = 22000,
		  lev_limit = 203, floor = 619};
get(160200) ->
    #dungeon_data{id = 160200,
		  name = lang:get(<<"地心熔炉620"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160210, unit_id = 21532,
		  items =
		      [{5, 144900}, {22, 145950}, {1, 86450}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21532,
		  hook_items =
		      [{5, 2070}, {22, 2085}, {1, 2260}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 730663,
		  energy_max = 22000, lev_limit = 203, floor = 620};
get(160210) ->
    #dungeon_data{id = 160210,
		  name = lang:get(<<"地心熔炉621"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160220, unit_id = 21533,
		  items = [{5, 41400}, {22, 41900}, {1, 24800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21533,
		  hook_items =
		      [{5, 2070}, {22, 2095}, {1, 2270}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 730926, energy_max = 22000,
		  lev_limit = 203, floor = 621};
get(160220) ->
    #dungeon_data{id = 160220,
		  name = lang:get(<<"地心熔炉622"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160230, unit_id = 21534,
		  items = [{5, 41600}, {22, 41900}, {1, 24800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21534,
		  hook_items =
		      [{5, 2080}, {22, 2095}, {1, 2270}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 731188, energy_max = 22000,
		  lev_limit = 205, floor = 622};
get(160230) ->
    #dungeon_data{id = 160230,
		  name = lang:get(<<"地心熔炉623"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160240, unit_id = 21535,
		  items = [{5, 41600}, {22, 41900}, {1, 24800}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21535,
		  hook_items =
		      [{5, 2080}, {22, 2095}, {1, 2270}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 737535, energy_max = 22000,
		  lev_limit = 205, floor = 623};
get(160240) ->
    #dungeon_data{id = 160240,
		  name = lang:get(<<"地心熔炉624"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160250, unit_id = 21536,
		  items = [{5, 41600}, {22, 42100}, {1, 24900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21536,
		  hook_items =
		      [{5, 2080}, {22, 2105}, {1, 2280}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 737798, energy_max = 22000,
		  lev_limit = 205, floor = 624};
get(160250) ->
    #dungeon_data{id = 160250,
		  name = lang:get(<<"地心熔炉625"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160260, unit_id = 21537,
		  items =
		      [{5, 146300}, {22, 147350}, {1, 87150}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21537,
		  hook_items =
		      [{5, 2090}, {22, 2105}, {1, 2280}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 738060,
		  energy_max = 22000, lev_limit = 205, floor = 625};
get(160260) ->
    #dungeon_data{id = 160260,
		  name = lang:get(<<"地心熔炉626"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160270, unit_id = 21538,
		  items = [{5, 41800}, {22, 42100}, {1, 24900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21538,
		  hook_items =
		      [{5, 2090}, {22, 2105}, {1, 2280}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 738323, energy_max = 22000,
		  lev_limit = 205, floor = 626};
get(160270) ->
    #dungeon_data{id = 160270,
		  name = lang:get(<<"地心熔炉627"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160280, unit_id = 21539,
		  items = [{5, 41800}, {22, 42300}, {1, 25000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21539,
		  hook_items =
		      [{5, 2090}, {22, 2115}, {1, 2290}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 738585, energy_max = 22000,
		  lev_limit = 205, floor = 627};
get(160280) ->
    #dungeon_data{id = 160280,
		  name = lang:get(<<"地心熔炉628"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160290, unit_id = 21540,
		  items = [{5, 42000}, {22, 42300}, {1, 25000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21540,
		  hook_items =
		      [{5, 2100}, {22, 2115}, {1, 2290}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 738848, energy_max = 22000,
		  lev_limit = 207, floor = 628};
get(160290) ->
    #dungeon_data{id = 160290,
		  name = lang:get(<<"地心熔炉629"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160300, unit_id = 21541,
		  items = [{5, 42000}, {22, 42300}, {1, 25000}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21541,
		  hook_items =
		      [{5, 2100}, {22, 2115}, {1, 2290}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 739110, energy_max = 22000,
		  lev_limit = 207, floor = 629};
get(160300) ->
    #dungeon_data{id = 160300,
		  name = lang:get(<<"地心熔炉630"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160310, unit_id = 21542,
		  items =
		      [{5, 147000}, {22, 148750}, {1, 87850}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21542,
		  hook_items =
		      [{5, 2100}, {22, 2125}, {1, 2300}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 739373,
		  energy_max = 22000, lev_limit = 207, floor = 630};
get(160310) ->
    #dungeon_data{id = 160310,
		  name = lang:get(<<"地心熔炉631"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160320, unit_id = 21601,
		  items = [{5, 42200}, {22, 42500}, {1, 25100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21601,
		  hook_items =
		      [{5, 2110}, {22, 2125}, {1, 2300}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 745694, energy_max = 22000,
		  lev_limit = 207, floor = 631};
get(160320) ->
    #dungeon_data{id = 160320,
		  name = lang:get(<<"地心熔炉632"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160330, unit_id = 21602,
		  items = [{5, 42200}, {22, 42500}, {1, 25100}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21602,
		  hook_items =
		      [{5, 2110}, {22, 2125}, {1, 2300}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 745956, energy_max = 22000,
		  lev_limit = 207, floor = 632};
get(160330) ->
    #dungeon_data{id = 160330,
		  name = lang:get(<<"地心熔炉633"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160340, unit_id = 21603,
		  items = [{5, 42200}, {22, 42700}, {1, 25200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21603,
		  hook_items =
		      [{5, 2110}, {22, 2135}, {1, 2310}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 746219, energy_max = 22000,
		  lev_limit = 207, floor = 633};
get(160340) ->
    #dungeon_data{id = 160340,
		  name = lang:get(<<"地心熔炉634"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160350, unit_id = 21604,
		  items = [{5, 42400}, {22, 42700}, {1, 25200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21604,
		  hook_items =
		      [{5, 2120}, {22, 2135}, {1, 2310}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 746481, energy_max = 22000,
		  lev_limit = 209, floor = 634};
get(160350) ->
    #dungeon_data{id = 160350,
		  name = lang:get(<<"地心熔炉635"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160360, unit_id = 21605,
		  items =
		      [{5, 148400}, {22, 149450}, {1, 88200}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21605,
		  hook_items =
		      [{5, 2120}, {22, 2135}, {1, 2310}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 746744,
		  energy_max = 22000, lev_limit = 209, floor = 635};
get(160360) ->
    #dungeon_data{id = 160360,
		  name = lang:get(<<"地心熔炉636"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160370, unit_id = 21606,
		  items = [{5, 42400}, {22, 42900}, {1, 25300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21606,
		  hook_items =
		      [{5, 2120}, {22, 2145}, {1, 2320}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 747006, energy_max = 22000,
		  lev_limit = 209, floor = 636};
get(160370) ->
    #dungeon_data{id = 160370,
		  name = lang:get(<<"地心熔炉637"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160380, unit_id = 21607,
		  items = [{5, 42600}, {22, 42900}, {1, 25300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21607,
		  hook_items =
		      [{5, 2130}, {22, 2145}, {1, 2320}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 747269, energy_max = 22000,
		  lev_limit = 209, floor = 637};
get(160380) ->
    #dungeon_data{id = 160380,
		  name = lang:get(<<"地心熔炉638"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160390, unit_id = 21608,
		  items = [{5, 42600}, {22, 42900}, {1, 25300}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21608,
		  hook_items =
		      [{5, 2130}, {22, 2145}, {1, 2320}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 747531, energy_max = 22000,
		  lev_limit = 209, floor = 638};
get(160390) ->
    #dungeon_data{id = 160390,
		  name = lang:get(<<"地心熔炉639"/utf8>>), chapter_id = 16,
		  mode = 1, next_id = 160400, unit_id = 21609,
		  items = [{5, 42600}, {22, 43100}, {1, 25400}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21609,
		  hook_items =
		      [{5, 2130}, {22, 2155}, {1, 2330}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, power = 753884, energy_max = 22000,
		  lev_limit = 209, floor = 639};
get(160400) ->
    #dungeon_data{id = 160400,
		  name = lang:get(<<"地心熔炉640"/utf8>>), chapter_id = 16,
		  mode = 1, unit_id = 21610,
		  items =
		      [{5, 149800}, {22, 150850}, {1, 88900}, {7, 260}],
		  drop_ids = [30210, 20001, 20000], hook_unit_id = 21610,
		  hook_items =
		      [{5, 2140}, {22, 2155}, {1, 2330}, {7, 13}],
		  hook_drop_ids = [20210, 20001, 20000, 20004, 20005],
		  time = 5, is_big = 1, power = 754146,
		  energy_max = 22000, lev_limit = 211, floor = 640};
get(_Info) ->
    lager:error(io_lib:format("get_data_not_exist===>~w",
			      [_Info])),
    undefined.

fast_combat_num(1) -> {0, 50};
fast_combat_num(2) -> {0, 100};
fast_combat_num(3) -> {0, 200};
fast_combat_num(_) -> undefined.

list_ext_reward() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
     17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
     31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44,
     45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
     59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72,
     73, 74, 75].

ext_reward(1) ->
    #{id => 1, limit_id => 10010,
      items =>
	  [{39039, 30}, {13100, 30000}, {10090, 1000},
	   {10091, 500}, {10091, 500}, {14001, 1000},
	   {10403, 1000}, {39052, 4000}, {39053, 4000}, {90514, 3},
	   {90515, 3}]};
ext_reward(2) ->
    #{id => 2, limit_id => 10050,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {26704, 20}]};
ext_reward(3) ->
    #{id => 3, limit_id => 10100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40401, 1}, {40201, 1}]};
ext_reward(4) ->
    #{id => 4, limit_id => 10150,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {26802, 30}]};
ext_reward(5) ->
    #{id => 5, limit_id => 10200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40102, 1}, {40302, 1}]};
ext_reward(6) ->
    #{id => 6, limit_id => 10250,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {26800, 30}]};
ext_reward(7) ->
    #{id => 7, limit_id => 10300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40402, 1}, {40202, 1}]};
ext_reward(8) ->
    #{id => 8, limit_id => 10400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40103, 1}, {40303, 1}, {25804, 30}]};
ext_reward(9) ->
    #{id => 9, limit_id => 20100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {26801, 30}]};
ext_reward(10) ->
    #{id => 10, limit_id => 20200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40403, 1}, {40203, 1}]};
ext_reward(11) ->
    #{id => 11, limit_id => 20300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40104, 1}, {40304, 1}]};
ext_reward(12) ->
    #{id => 12, limit_id => 20350,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>维瑟斯山城75</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(13) ->
    #{id => 13, limit_id => 20400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40404, 1}, {40204, 1}]};
ext_reward(14) ->
    #{id => 14, limit_id => 30100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40105, 1}, {40305, 1}]};
ext_reward(15) ->
    #{id => 15, limit_id => 30200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>达齐尔雪地100</div>，获得<d"
		     "iv fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(16) ->
    #{id => 16, limit_id => 30300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40405, 1}, {40205, 1}]};
ext_reward(17) ->
    #{id => 17, limit_id => 30400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40106, 1}, {40306, 1}]};
ext_reward(18) ->
    #{id => 18, limit_id => 40050,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>安格拉玛山125</div>，获得<d"
		     "iv fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(19) ->
    #{id => 19, limit_id => 40100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40406, 1}, {40206, 1}]};
ext_reward(20) ->
    #{id => 20, limit_id => 40200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40107, 1}, {40307, 1}]};
ext_reward(21) ->
    #{id => 21, limit_id => 40300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>安格拉玛山150</div>，获得<d"
		     "iv fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(22) ->
    #{id => 22, limit_id => 40400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40407, 1}, {40207, 1}]};
ext_reward(23) ->
    #{id => 23, limit_id => 50100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40107, 1}, {40307, 1}]};
ext_reward(24) ->
    #{id => 24, limit_id => 50150,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>波克利雪山175</div>，获得<d"
		     "iv fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(25) ->
    #{id => 25, limit_id => 50200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40408, 1}, {40208, 1}]};
ext_reward(26) ->
    #{id => 26, limit_id => 50300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40108, 1}, {40308, 1}]};
ext_reward(27) ->
    #{id => 27, limit_id => 50400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>波克利雪山200</div>，获得<d"
		     "iv fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(28) ->
    #{id => 28, limit_id => 60100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40408, 1}, {40208, 1}]};
ext_reward(29) ->
    #{id => 29, limit_id => 60200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40108, 1}, {40308, 1}]};
ext_reward(30) ->
    #{id => 30, limit_id => 60250,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>乌尔黎森林225</div>，获得<d"
		     "iv fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(31) ->
    #{id => 31, limit_id => 60300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40409, 1}, {40209, 1}]};
ext_reward(32) ->
    #{id => 32, limit_id => 60400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40109, 1}, {40309, 1}]};
ext_reward(33) ->
    #{id => 33, limit_id => 70100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>冰冠冰川250</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(34) ->
    #{id => 34, limit_id => 70200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40409, 1}, {40209, 1}]};
ext_reward(35) ->
    #{id => 35, limit_id => 70300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40109, 1}, {40309, 1}]};
ext_reward(36) ->
    #{id => 36, limit_id => 70350,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>冰冠冰川275</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(37) ->
    #{id => 37, limit_id => 70400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40410, 1}, {40210, 1}]};
ext_reward(38) ->
    #{id => 38, limit_id => 80100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40110, 1}, {40310, 1}]};
ext_reward(39) ->
    #{id => 39, limit_id => 80200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>斐尼雪山300</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(40) ->
    #{id => 40, limit_id => 80300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40410, 1}, {40210, 1}]};
ext_reward(41) ->
    #{id => 41, limit_id => 80400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40110, 1}, {40310, 1}]};
ext_reward(42) ->
    #{id => 42, limit_id => 90050,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>旭日平原325</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(43) ->
    #{id => 43, limit_id => 90100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40411, 1}, {40211, 1}]};
ext_reward(44) ->
    #{id => 44, limit_id => 90200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40111, 1}, {40311, 1}]};
ext_reward(45) ->
    #{id => 45, limit_id => 90300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>旭日平原350</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(46) ->
    #{id => 46, limit_id => 90400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40411, 1}, {40211, 1}]};
ext_reward(47) ->
    #{id => 47, limit_id => 100100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40111, 1}, {40311, 1}]};
ext_reward(48) ->
    #{id => 48, limit_id => 100150,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>乌塔塔神庙375</div>，获得<d"
		     "iv fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(49) ->
    #{id => 49, limit_id => 100200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40412, 1}, {40212, 1}]};
ext_reward(50) ->
    #{id => 50, limit_id => 100300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40112, 1}, {40312, 1}]};
ext_reward(51) ->
    #{id => 51, limit_id => 100400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>乌塔塔神庙400</div>，获得<d"
		     "iv fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(52) ->
    #{id => 52, limit_id => 110100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40412, 1}, {40212, 1}]};
ext_reward(53) ->
    #{id => 53, limit_id => 110200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40112, 1}, {40312, 1}]};
ext_reward(54) ->
    #{id => 54, limit_id => 110250,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>彩虹岛425</div>，获得<div "
		     "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(55) ->
    #{id => 55, limit_id => 110300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40412, 1}, {40212, 1}]};
ext_reward(56) ->
    #{id => 56, limit_id => 110400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40112, 1}, {40312, 1}]};
ext_reward(57) ->
    #{id => 57, limit_id => 120100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>龙晶之谷450</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(58) ->
    #{id => 58, limit_id => 120200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40412, 1}, {40212, 1}]};
ext_reward(59) ->
    #{id => 59, limit_id => 120300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40112, 1}, {40312, 1}]};
ext_reward(60) ->
    #{id => 60, limit_id => 120350,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>龙晶之谷475</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(61) ->
    #{id => 61, limit_id => 120400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40412, 1}, {40212, 1}]};
ext_reward(62) ->
    #{id => 62, limit_id => 130100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40112, 1}, {40312, 1}]};
ext_reward(63) ->
    #{id => 63, limit_id => 130200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>断弦山脉500</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(64) ->
    #{id => 64, limit_id => 130300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40413, 1}, {40213, 1}]};
ext_reward(65) ->
    #{id => 65, limit_id => 130400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40113, 1}, {40313, 1}]};
ext_reward(66) ->
    #{id => 66, limit_id => 140050,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>勇者之巅525</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(67) ->
    #{id => 67, limit_id => 140100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40413, 1}, {40213, 1}]};
ext_reward(68) ->
    #{id => 68, limit_id => 140200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40113, 1}, {40313, 1}]};
ext_reward(69) ->
    #{id => 69, limit_id => 140300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>勇者之巅550</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(70) ->
    #{id => 70, limit_id => 140400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40413, 1}, {40213, 1}]};
ext_reward(71) ->
    #{id => 71, limit_id => 150100,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40113, 1}, {40313, 1}]};
ext_reward(72) ->
    #{id => 72, limit_id => 150150,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>雾黎之都575</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(73) ->
    #{id => 73, limit_id => 150200,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40413, 1}, {40213, 1}]};
ext_reward(74) ->
    #{id => 74, limit_id => 150300,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {40113, 1}, {40313, 1}]};
ext_reward(75) ->
    #{id => 75, limit_id => 150400,
      items =>
	  [{3, 500000}, {10090, 20}, {10091, 10}, {39052, 100},
	   {39053, 100}, {29905, 50}],
      notice =>
	  lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>勇往直前，顺利通关剧"
		     "情关卡<div fontcolor=#c26706>雾黎之都600</div>，获得<di"
		     "v fontcolor=#c26706>强力5星英雄</div>！"/utf8>>)};
ext_reward(_Info) ->
    lager:error(io_lib:format("ext_reward_data_not_exist===>~w",
			      [_Info])),
    undefined.


