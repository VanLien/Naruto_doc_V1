-file("data/resonate_data.erl", 1).

-file("data/resonate_data.erl", 1).

-file("src/mod/data/resonate_data.erl", 1).

-module(resonate_data).

-lager_records([]).

-export([get_const/1, get_all_pos/0, get_pos_cond/1,
	 get_lev_expend/1, get_lev_attr/1, get_max_lev/0,
	 get_star_rio/1, get_extract_limit_num/1,
	 get_extract_need_time/1, get_star_resonate_loss/1,
	 get_unlock_expend/1, get_cystal_lev_expend/1]).

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

-file("src/mod/data/resonate_data.erl", 21).

get_const(open_lev) -> 32;
get_const(hero_star_condition) -> 3;
get_const(empowerment_day_limit) -> 2;
get_const(rule_tips) -> 1;
get_const(empowerment_rule_tips) -> 1;
get_const(empowerment_condition) -> 30;
get_const(single_refine_consume) -> [{22, 30000}];
get_const(alchemy_goods) -> 10095;
get_const(empowerment_span) -> 1440;
get_const(extract_rule) -> 1;
get_const(cell_init) -> 1;
get_const(cell_max) -> 30;
get_const(cell_cool_time) -> 1440;
get_const(cell_flush_expend) -> [{3, 300}];
get_const(amp_all_start_limit) -> 50;
get_const(cystal_pre_lev_limit) -> 4140;
get_const(star_add_lev_12) -> 50;
get_const(star_add_lev_13) -> 100;
get_const(cystal_max_lev_limit) -> 4140;
get_const(rule_tips2) -> 1;
get_const(_) -> undefined.

get_all_pos() -> [1, 2, 3, 4, 5].

get_pos_cond(1) -> [{lev, 90}];
get_pos_cond(2) -> [{lev, 90}];
get_pos_cond(3) -> [{lev, 90}];
get_pos_cond(4) -> [{lev, 90}];
get_pos_cond(5) -> [{lev, 90}];
get_pos_cond(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidresonate_data51, _,
       {__Levelresonate_data51, __Tracesresonate_data51}}
	  when __Levelresonate_data51 band 8 /= 0 orelse
		 __Tracesresonate_data51 /= [] ->
	  lager:do_log(error,
		       [{module, resonate_data}, {function, get_pos_cond},
			{line, 51}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_pos_cond_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelresonate_data51,
		       __Tracesresonate_data51, lager_event,
		       __Pidresonate_data51);
      _ -> ok
    end,
    undefined.

get_lev_expend(1) -> [{10095, 1}, {1, 3000}];
get_lev_expend(2) -> [{10095, 3}, {1, 9000}];
get_lev_expend(3) -> [{10095, 6}, {1, 18000}];
get_lev_expend(4) -> [{10095, 10}, {1, 30000}];
get_lev_expend(5) -> [{10095, 14}, {1, 42000}];
get_lev_expend(6) -> [{10095, 18}, {1, 54000}];
get_lev_expend(7) -> [{10095, 22}, {1, 66000}];
get_lev_expend(8) -> [{10095, 27}, {1, 81000}];
get_lev_expend(9) -> [{10095, 32}, {1, 96000}];
get_lev_expend(10) -> [{10095, 36}, {1, 108000}];
get_lev_expend(11) -> [{10095, 41}, {1, 123000}];
get_lev_expend(12) -> [{10095, 46}, {1, 138000}];
get_lev_expend(13) -> [{10095, 51}, {1, 153000}];
get_lev_expend(14) -> [{10095, 57}, {1, 171000}];
get_lev_expend(15) -> [{10095, 63}, {1, 189000}];
get_lev_expend(16) -> [{10095, 69}, {1, 207000}];
get_lev_expend(17) -> [{10095, 75}, {1, 225000}];
get_lev_expend(18) -> [{10095, 81}, {1, 243000}];
get_lev_expend(19) -> [{10095, 87}, {1, 261000}];
get_lev_expend(20) -> [{10095, 94}, {1, 282000}];
get_lev_expend(21) -> [{10095, 101}, {1, 303000}];
get_lev_expend(22) -> [{10095, 108}, {1, 324000}];
get_lev_expend(23) -> [{10095, 115}, {1, 345000}];
get_lev_expend(24) -> [{10095, 122}, {1, 366000}];
get_lev_expend(25) -> [{10095, 130}, {1, 390000}];
get_lev_expend(26) -> [{10095, 137}, {1, 411000}];
get_lev_expend(27) -> [{10095, 145}, {1, 435000}];
get_lev_expend(28) -> [{10095, 153}, {1, 459000}];
get_lev_expend(29) -> [{10095, 161}, {1, 483000}];
get_lev_expend(30) -> [{10095, 169}, {1, 507000}];
get_lev_expend(31) -> [{10095, 177}, {1, 531000}];
get_lev_expend(32) -> [{10095, 186}, {1, 558000}];
get_lev_expend(33) -> [{10095, 194}, {1, 582000}];
get_lev_expend(34) -> [{10095, 203}, {1, 609000}];
get_lev_expend(35) -> [{10095, 212}, {1, 636000}];
get_lev_expend(36) -> [{10095, 221}, {1, 663000}];
get_lev_expend(37) -> [{10095, 230}, {1, 690000}];
get_lev_expend(38) -> [{10095, 239}, {1, 717000}];
get_lev_expend(39) -> [{10095, 248}, {1, 744000}];
get_lev_expend(40) -> [{10095, 257}, {1, 771000}];
get_lev_expend(41) -> [{10095, 267}, {1, 801000}];
get_lev_expend(42) -> [{10095, 277}, {1, 831000}];
get_lev_expend(43) -> [{10095, 286}, {1, 858000}];
get_lev_expend(44) -> [{10095, 296}, {1, 888000}];
get_lev_expend(45) -> [{10095, 306}, {1, 918000}];
get_lev_expend(46) -> [{10095, 316}, {1, 948000}];
get_lev_expend(47) -> [{10095, 327}, {1, 981000}];
get_lev_expend(48) -> [{10095, 337}, {1, 1011000}];
get_lev_expend(49) -> [{10095, 348}, {1, 1044000}];
get_lev_expend(50) -> [{10095, 358}, {1, 1074000}];
get_lev_expend(51) -> [{10095, 369}, {1, 1107000}];
get_lev_expend(52) -> [{10095, 379}, {1, 1137000}];
get_lev_expend(53) -> [{10095, 390}, {1, 1170000}];
get_lev_expend(54) -> [{10095, 401}, {1, 1203000}];
get_lev_expend(55) -> [{10095, 412}, {1, 1236000}];
get_lev_expend(56) -> [{10095, 424}, {1, 1272000}];
get_lev_expend(57) -> [{10095, 435}, {1, 1305000}];
get_lev_expend(58) -> [{10095, 446}, {1, 1338000}];
get_lev_expend(59) -> [{10095, 458}, {1, 1374000}];
get_lev_expend(60) -> [{10095, 469}, {1, 1407000}];
get_lev_expend(61) -> [{10095, 481}, {1, 1443000}];
get_lev_expend(62) -> [{10095, 493}, {1, 1479000}];
get_lev_expend(63) -> [{10095, 505}, {1, 1515000}];
get_lev_expend(64) -> [{10095, 517}, {1, 1551000}];
get_lev_expend(65) -> [{10095, 529}, {1, 1587000}];
get_lev_expend(66) -> [{10095, 541}, {1, 1623000}];
get_lev_expend(67) -> [{10095, 553}, {1, 1659000}];
get_lev_expend(68) -> [{10095, 565}, {1, 1695000}];
get_lev_expend(69) -> [{10095, 578}, {1, 1734000}];
get_lev_expend(70) -> [{10095, 590}, {1, 1770000}];
get_lev_expend(71) -> [{10095, 603}, {1, 1809000}];
get_lev_expend(72) -> [{10095, 615}, {1, 1845000}];
get_lev_expend(73) -> [{10095, 628}, {1, 1884000}];
get_lev_expend(74) -> [{10095, 641}, {1, 1923000}];
get_lev_expend(75) -> [{10095, 654}, {1, 1962000}];
get_lev_expend(76) -> [{10095, 667}, {1, 2001000}];
get_lev_expend(77) -> [{10095, 680}, {1, 2040000}];
get_lev_expend(78) -> [{10095, 693}, {1, 2079000}];
get_lev_expend(79) -> [{10095, 707}, {1, 2121000}];
get_lev_expend(80) -> [{10095, 720}, {1, 2160000}];
get_lev_expend(81) -> [{10095, 734}, {1, 2202000}];
get_lev_expend(82) -> [{10095, 747}, {1, 2241000}];
get_lev_expend(83) -> [{10095, 761}, {1, 2283000}];
get_lev_expend(84) -> [{10095, 774}, {1, 2322000}];
get_lev_expend(85) -> [{10095, 788}, {1, 2364000}];
get_lev_expend(86) -> [{10095, 802}, {1, 2406000}];
get_lev_expend(87) -> [{10095, 816}, {1, 2448000}];
get_lev_expend(88) -> [{10095, 830}, {1, 2490000}];
get_lev_expend(89) -> [{10095, 844}, {1, 2532000}];
get_lev_expend(90) -> [{10095, 858}, {1, 2574000}];
get_lev_expend(91) -> [{10095, 873}, {1, 2619000}];
get_lev_expend(92) -> [{10095, 887}, {1, 2661000}];
get_lev_expend(93) -> [{10095, 901}, {1, 2703000}];
get_lev_expend(94) -> [{10095, 916}, {1, 2748000}];
get_lev_expend(95) -> [{10095, 930}, {1, 2790000}];
get_lev_expend(96) -> [{10095, 945}, {1, 2835000}];
get_lev_expend(97) -> [{10095, 960}, {1, 2880000}];
get_lev_expend(98) -> [{10095, 975}, {1, 2925000}];
get_lev_expend(99) -> [{10095, 990}, {1, 2970000}];
get_lev_expend(100) -> [{10095, 1005}, {1, 3015000}];
get_lev_expend(101) -> [{10095, 1020}, {1, 3060000}];
get_lev_expend(102) -> [{10095, 1035}, {1, 3105000}];
get_lev_expend(103) -> [{10095, 1050}, {1, 3150000}];
get_lev_expend(104) -> [{10095, 1065}, {1, 3195000}];
get_lev_expend(105) -> [{10095, 1080}, {1, 3240000}];
get_lev_expend(106) -> [{10095, 1096}, {1, 3288000}];
get_lev_expend(107) -> [{10095, 1111}, {1, 3333000}];
get_lev_expend(108) -> [{10095, 1127}, {1, 3381000}];
get_lev_expend(109) -> [{10095, 1142}, {1, 3426000}];
get_lev_expend(110) -> [{10095, 1158}, {1, 3474000}];
get_lev_expend(111) -> [{10095, 1174}, {1, 3522000}];
get_lev_expend(112) -> [{10095, 1190}, {1, 3570000}];
get_lev_expend(113) -> [{10095, 1206}, {1, 3618000}];
get_lev_expend(114) -> [{10095, 1222}, {1, 3666000}];
get_lev_expend(115) -> [{10095, 1238}, {1, 3714000}];
get_lev_expend(116) -> [{10095, 1254}, {1, 3762000}];
get_lev_expend(117) -> [{10095, 1270}, {1, 3810000}];
get_lev_expend(118) -> [{10095, 1286}, {1, 3858000}];
get_lev_expend(119) -> [{10095, 1303}, {1, 3909000}];
get_lev_expend(120) -> [{10095, 1319}, {1, 3957000}];
get_lev_expend(121) -> [{10095, 1336}, {1, 4008000}];
get_lev_expend(122) -> [{10095, 1352}, {1, 4056000}];
get_lev_expend(123) -> [{10095, 1369}, {1, 4107000}];
get_lev_expend(124) -> [{10095, 1385}, {1, 4155000}];
get_lev_expend(125) -> [{10095, 1402}, {1, 4206000}];
get_lev_expend(126) -> [{10095, 1419}, {1, 4257000}];
get_lev_expend(127) -> [{10095, 1436}, {1, 4308000}];
get_lev_expend(128) -> [{10095, 1453}, {1, 4359000}];
get_lev_expend(129) -> [{10095, 1470}, {1, 4410000}];
get_lev_expend(130) -> [{10095, 1487}, {1, 4461000}];
get_lev_expend(131) -> [{10095, 1504}, {1, 4512000}];
get_lev_expend(132) -> [{10095, 1521}, {1, 4563000}];
get_lev_expend(133) -> [{10095, 1538}, {1, 4614000}];
get_lev_expend(134) -> [{10095, 1556}, {1, 4668000}];
get_lev_expend(135) -> [{10095, 1573}, {1, 4719000}];
get_lev_expend(136) -> [{10095, 1591}, {1, 4773000}];
get_lev_expend(137) -> [{10095, 1608}, {1, 4824000}];
get_lev_expend(138) -> [{10095, 1626}, {1, 4878000}];
get_lev_expend(139) -> [{10095, 1643}, {1, 4929000}];
get_lev_expend(140) -> [{10095, 1661}, {1, 4983000}];
get_lev_expend(141) -> [{10095, 1679}, {1, 5037000}];
get_lev_expend(142) -> [{10095, 1697}, {1, 5091000}];
get_lev_expend(143) -> [{10095, 1715}, {1, 5145000}];
get_lev_expend(144) -> [{10095, 1733}, {1, 5199000}];
get_lev_expend(145) -> [{10095, 1751}, {1, 5253000}];
get_lev_expend(146) -> [{10095, 1769}, {1, 5307000}];
get_lev_expend(147) -> [{10095, 1787}, {1, 5361000}];
get_lev_expend(148) -> [{10095, 1805}, {1, 5415000}];
get_lev_expend(149) -> [{10095, 1823}, {1, 5469000}];
get_lev_expend(150) -> [{10095, 1842}, {1, 5526000}];
get_lev_expend(151) -> [{10095, 1860}, {1, 5580000}];
get_lev_expend(152) -> [{10095, 1878}, {1, 5634000}];
get_lev_expend(153) -> [{10095, 1897}, {1, 5691000}];
get_lev_expend(154) -> [{10095, 1916}, {1, 5748000}];
get_lev_expend(155) -> [{10095, 1934}, {1, 5802000}];
get_lev_expend(156) -> [{10095, 1953}, {1, 5859000}];
get_lev_expend(157) -> [{10095, 1972}, {1, 5916000}];
get_lev_expend(158) -> [{10095, 1991}, {1, 5973000}];
get_lev_expend(159) -> [{10095, 2009}, {1, 6027000}];
get_lev_expend(160) -> [{10095, 2028}, {1, 6084000}];
get_lev_expend(161) -> [{10095, 2047}, {1, 6141000}];
get_lev_expend(162) -> [{10095, 2066}, {1, 6198000}];
get_lev_expend(163) -> [{10095, 2086}, {1, 6258000}];
get_lev_expend(164) -> [{10095, 2105}, {1, 6315000}];
get_lev_expend(165) -> [{10095, 2124}, {1, 6372000}];
get_lev_expend(166) -> [{10095, 2143}, {1, 6429000}];
get_lev_expend(167) -> [{10095, 2163}, {1, 6489000}];
get_lev_expend(168) -> [{10095, 2182}, {1, 6546000}];
get_lev_expend(169) -> [{10095, 2202}, {1, 6606000}];
get_lev_expend(170) -> [{10095, 2221}, {1, 6663000}];
get_lev_expend(171) -> [{10095, 2241}, {1, 6723000}];
get_lev_expend(172) -> [{10095, 2260}, {1, 6780000}];
get_lev_expend(173) -> [{10095, 2280}, {1, 6840000}];
get_lev_expend(174) -> [{10095, 2300}, {1, 6900000}];
get_lev_expend(175) -> [{10095, 2320}, {1, 6960000}];
get_lev_expend(176) -> [{10095, 2339}, {1, 7017000}];
get_lev_expend(177) -> [{10095, 2359}, {1, 7077000}];
get_lev_expend(178) -> [{10095, 2379}, {1, 7137000}];
get_lev_expend(179) -> [{10095, 2399}, {1, 7197000}];
get_lev_expend(180) -> [{10095, 2419}, {1, 7257000}];
get_lev_expend(181) -> [{10095, 2440}, {1, 7320000}];
get_lev_expend(182) -> [{10095, 2460}, {1, 7380000}];
get_lev_expend(183) -> [{10095, 2480}, {1, 7440000}];
get_lev_expend(184) -> [{10095, 2500}, {1, 7500000}];
get_lev_expend(185) -> [{10095, 2521}, {1, 7563000}];
get_lev_expend(186) -> [{10095, 2541}, {1, 7623000}];
get_lev_expend(187) -> [{10095, 2562}, {1, 7686000}];
get_lev_expend(188) -> [{10095, 2582}, {1, 7746000}];
get_lev_expend(189) -> [{10095, 2603}, {1, 7809000}];
get_lev_expend(190) -> [{10095, 2623}, {1, 7869000}];
get_lev_expend(191) -> [{10095, 2644}, {1, 7932000}];
get_lev_expend(192) -> [{10095, 2665}, {1, 7995000}];
get_lev_expend(193) -> [{10095, 2686}, {1, 8058000}];
get_lev_expend(194) -> [{10095, 2707}, {1, 8121000}];
get_lev_expend(195) -> [{10095, 2728}, {1, 8184000}];
get_lev_expend(196) -> [{10095, 2749}, {1, 8247000}];
get_lev_expend(197) -> [{10095, 2770}, {1, 8310000}];
get_lev_expend(198) -> [{10095, 2791}, {1, 8373000}];
get_lev_expend(199) -> [{10095, 2812}, {1, 8436000}];
get_lev_expend(200) -> [{10095, 2833}, {1, 8499000}];
get_lev_expend(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidresonate_data253, _,
       {__Levelresonate_data253, __Tracesresonate_data253}}
	  when __Levelresonate_data253 band 8 /= 0 orelse
		 __Tracesresonate_data253 /= [] ->
	  lager:do_log(error,
		       [{module, resonate_data}, {function, get_lev_expend},
			{line, 253}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_lev_expend_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelresonate_data253,
		       __Tracesresonate_data253, lager_event,
		       __Pidresonate_data253);
      _ -> ok
    end,
    undefined.

get_lev_attr(1) -> [{hp_max, 38}, {atk, 3}, {def, 2}];
get_lev_attr(2) -> [{hp_max, 115}, {atk, 10}, {def, 3}];
get_lev_attr(3) -> [{hp_max, 230}, {atk, 21}, {def, 4}];
get_lev_attr(4) -> [{hp_max, 384}, {atk, 36}, {def, 5}];
get_lev_attr(5) -> [{hp_max, 538}, {atk, 51}, {def, 6}];
get_lev_attr(6) -> [{hp_max, 692}, {atk, 65}, {def, 7}];
get_lev_attr(7) -> [{hp_max, 846}, {atk, 80}, {def, 8}];
get_lev_attr(8) ->
    [{hp_max, 1039}, {atk, 98}, {def, 9}];
get_lev_attr(9) ->
    [{hp_max, 1231}, {atk, 116}, {def, 10}];
get_lev_attr(10) ->
    [{hp_max, 1385}, {atk, 131}, {def, 11}];
get_lev_attr(11) ->
    [{hp_max, 1578}, {atk, 149}, {def, 12}];
get_lev_attr(12) ->
    [{hp_max, 1770}, {atk, 167}, {def, 13}];
get_lev_attr(13) ->
    [{hp_max, 1963}, {atk, 185}, {def, 14}];
get_lev_attr(14) ->
    [{hp_max, 2194}, {atk, 207}, {def, 15}];
get_lev_attr(15) ->
    [{hp_max, 2425}, {atk, 229}, {def, 16}];
get_lev_attr(16) ->
    [{hp_max, 2656}, {atk, 251}, {def, 17}];
get_lev_attr(17) ->
    [{hp_max, 2887}, {atk, 273}, {def, 18}];
get_lev_attr(18) ->
    [{hp_max, 3118}, {atk, 295}, {def, 19}];
get_lev_attr(19) ->
    [{hp_max, 3349}, {atk, 317}, {def, 20}];
get_lev_attr(20) ->
    [{hp_max, 3618}, {atk, 342}, {def, 21}];
get_lev_attr(21) ->
    [{hp_max, 3888}, {atk, 368}, {def, 22}];
get_lev_attr(22) ->
    [{hp_max, 4157}, {atk, 393}, {def, 23}];
get_lev_attr(23) ->
    [{hp_max, 4427}, {atk, 419}, {def, 24}];
get_lev_attr(24) ->
    [{hp_max, 4696}, {atk, 444}, {def, 25}];
get_lev_attr(25) ->
    [{hp_max, 5004}, {atk, 473}, {def, 26}];
get_lev_attr(26) ->
    [{hp_max, 5274}, {atk, 499}, {def, 27}];
get_lev_attr(27) ->
    [{hp_max, 5582}, {atk, 528}, {def, 28}];
get_lev_attr(28) ->
    [{hp_max, 5890}, {atk, 557}, {def, 29}];
get_lev_attr(29) ->
    [{hp_max, 6198}, {atk, 586}, {def, 30}];
get_lev_attr(30) ->
    [{hp_max, 6506}, {atk, 616}, {def, 31}];
get_lev_attr(31) ->
    [{hp_max, 6814}, {atk, 645}, {def, 32}];
get_lev_attr(32) ->
    [{hp_max, 7160}, {atk, 678}, {def, 33}];
get_lev_attr(33) ->
    [{hp_max, 7468}, {atk, 707}, {def, 34}];
get_lev_attr(34) ->
    [{hp_max, 7815}, {atk, 740}, {def, 35}];
get_lev_attr(35) ->
    [{hp_max, 8161}, {atk, 772}, {def, 36}];
get_lev_attr(36) ->
    [{hp_max, 8508}, {atk, 805}, {def, 37}];
get_lev_attr(37) ->
    [{hp_max, 8854}, {atk, 838}, {def, 38}];
get_lev_attr(38) ->
    [{hp_max, 9201}, {atk, 871}, {def, 39}];
get_lev_attr(39) ->
    [{hp_max, 9547}, {atk, 904}, {def, 40}];
get_lev_attr(40) ->
    [{hp_max, 9894}, {atk, 936}, {def, 41}];
get_lev_attr(41) ->
    [{hp_max, 10279}, {atk, 973}, {def, 42}];
get_lev_attr(42) ->
    [{hp_max, 10664}, {atk, 1009}, {def, 43}];
get_lev_attr(43) ->
    [{hp_max, 11010}, {atk, 1042}, {def, 44}];
get_lev_attr(44) ->
    [{hp_max, 11395}, {atk, 1079}, {def, 45}];
get_lev_attr(45) ->
    [{hp_max, 11780}, {atk, 1115}, {def, 46}];
get_lev_attr(46) ->
    [{hp_max, 12165}, {atk, 1152}, {def, 47}];
get_lev_attr(47) ->
    [{hp_max, 12589}, {atk, 1192}, {def, 48}];
get_lev_attr(48) ->
    [{hp_max, 12974}, {atk, 1228}, {def, 49}];
get_lev_attr(49) ->
    [{hp_max, 13397}, {atk, 1268}, {def, 50}];
get_lev_attr(50) ->
    [{hp_max, 13782}, {atk, 1305}, {def, 51}];
get_lev_attr(51) ->
    [{hp_max, 14206}, {atk, 1345}, {def, 52}];
get_lev_attr(52) ->
    [{hp_max, 14591}, {atk, 1381}, {def, 53}];
get_lev_attr(53) ->
    [{hp_max, 15014}, {atk, 1421}, {def, 54}];
get_lev_attr(54) ->
    [{hp_max, 15438}, {atk, 1461}, {def, 55}];
get_lev_attr(55) ->
    [{hp_max, 15861}, {atk, 1501}, {def, 56}];
get_lev_attr(56) ->
    [{hp_max, 16323}, {atk, 1545}, {def, 57}];
get_lev_attr(57) ->
    [{hp_max, 16747}, {atk, 1585}, {def, 58}];
get_lev_attr(58) ->
    [{hp_max, 17170}, {atk, 1625}, {def, 59}];
get_lev_attr(59) ->
    [{hp_max, 17632}, {atk, 1669}, {def, 60}];
get_lev_attr(60) ->
    [{hp_max, 18056}, {atk, 1709}, {def, 61}];
get_lev_attr(61) ->
    [{hp_max, 18518}, {atk, 1753}, {def, 62}];
get_lev_attr(62) ->
    [{hp_max, 18980}, {atk, 1797}, {def, 63}];
get_lev_attr(63) ->
    [{hp_max, 19442}, {atk, 1841}, {def, 64}];
get_lev_attr(64) ->
    [{hp_max, 19904}, {atk, 1884}, {def, 65}];
get_lev_attr(65) ->
    [{hp_max, 20366}, {atk, 1928}, {def, 66}];
get_lev_attr(66) ->
    [{hp_max, 20828}, {atk, 1972}, {def, 67}];
get_lev_attr(67) ->
    [{hp_max, 21290}, {atk, 2016}, {def, 68}];
get_lev_attr(68) ->
    [{hp_max, 21752}, {atk, 2059}, {def, 69}];
get_lev_attr(69) ->
    [{hp_max, 22252}, {atk, 2107}, {def, 70}];
get_lev_attr(70) ->
    [{hp_max, 22714}, {atk, 2150}, {def, 71}];
get_lev_attr(71) ->
    [{hp_max, 23214}, {atk, 2198}, {def, 72}];
get_lev_attr(72) ->
    [{hp_max, 23676}, {atk, 2242}, {def, 73}];
get_lev_attr(73) ->
    [{hp_max, 24177}, {atk, 2289}, {def, 74}];
get_lev_attr(74) ->
    [{hp_max, 24677}, {atk, 2336}, {def, 75}];
get_lev_attr(75) ->
    [{hp_max, 25178}, {atk, 2384}, {def, 76}];
get_lev_attr(76) ->
    [{hp_max, 25678}, {atk, 2431}, {def, 77}];
get_lev_attr(77) ->
    [{hp_max, 26179}, {atk, 2479}, {def, 78}];
get_lev_attr(78) ->
    [{hp_max, 26679}, {atk, 2526}, {def, 79}];
get_lev_attr(79) ->
    [{hp_max, 27218}, {atk, 2577}, {def, 80}];
get_lev_attr(80) ->
    [{hp_max, 27719}, {atk, 2624}, {def, 81}];
get_lev_attr(81) ->
    [{hp_max, 28258}, {atk, 2675}, {def, 82}];
get_lev_attr(82) ->
    [{hp_max, 28758}, {atk, 2723}, {def, 83}];
get_lev_attr(83) ->
    [{hp_max, 29297}, {atk, 2774}, {def, 84}];
get_lev_attr(84) ->
    [{hp_max, 29798}, {atk, 2821}, {def, 85}];
get_lev_attr(85) ->
    [{hp_max, 30337}, {atk, 2872}, {def, 86}];
get_lev_attr(86) ->
    [{hp_max, 30876}, {atk, 2923}, {def, 87}];
get_lev_attr(87) ->
    [{hp_max, 31415}, {atk, 2974}, {def, 88}];
get_lev_attr(88) ->
    [{hp_max, 31954}, {atk, 3025}, {def, 89}];
get_lev_attr(89) ->
    [{hp_max, 32493}, {atk, 3076}, {def, 90}];
get_lev_attr(90) ->
    [{hp_max, 33032}, {atk, 3127}, {def, 91}];
get_lev_attr(91) ->
    [{hp_max, 33609}, {atk, 3182}, {def, 92}];
get_lev_attr(92) ->
    [{hp_max, 34148}, {atk, 3233}, {def, 93}];
get_lev_attr(93) ->
    [{hp_max, 34687}, {atk, 3284}, {def, 94}];
get_lev_attr(94) ->
    [{hp_max, 35265}, {atk, 3339}, {def, 95}];
get_lev_attr(95) ->
    [{hp_max, 35804}, {atk, 3390}, {def, 96}];
get_lev_attr(96) ->
    [{hp_max, 36381}, {atk, 3445}, {def, 97}];
get_lev_attr(97) ->
    [{hp_max, 36959}, {atk, 3499}, {def, 98}];
get_lev_attr(98) ->
    [{hp_max, 37536}, {atk, 3554}, {def, 99}];
get_lev_attr(99) ->
    [{hp_max, 38114}, {atk, 3609}, {def, 100}];
get_lev_attr(100) ->
    [{hp_max, 38691}, {atk, 3663}, {def, 101}];
get_lev_attr(101) ->
    [{hp_max, 39269}, {atk, 3718}, {def, 102}];
get_lev_attr(102) ->
    [{hp_max, 39846}, {atk, 3773}, {def, 103}];
get_lev_attr(103) ->
    [{hp_max, 40424}, {atk, 3827}, {def, 104}];
get_lev_attr(104) ->
    [{hp_max, 41001}, {atk, 3882}, {def, 105}];
get_lev_attr(105) ->
    [{hp_max, 41579}, {atk, 3937}, {def, 106}];
get_lev_attr(106) ->
    [{hp_max, 42195}, {atk, 3995}, {def, 107}];
get_lev_attr(107) ->
    [{hp_max, 42772}, {atk, 4050}, {def, 108}];
get_lev_attr(108) ->
    [{hp_max, 43388}, {atk, 4108}, {def, 109}];
get_lev_attr(109) ->
    [{hp_max, 43965}, {atk, 4163}, {def, 110}];
get_lev_attr(110) ->
    [{hp_max, 44581}, {atk, 4221}, {def, 111}];
get_lev_attr(111) ->
    [{hp_max, 45197}, {atk, 4279}, {def, 112}];
get_lev_attr(112) ->
    [{hp_max, 45813}, {atk, 4338}, {def, 113}];
get_lev_attr(113) ->
    [{hp_max, 46429}, {atk, 4396}, {def, 114}];
get_lev_attr(114) ->
    [{hp_max, 47045}, {atk, 4454}, {def, 115}];
get_lev_attr(115) ->
    [{hp_max, 47661}, {atk, 4513}, {def, 116}];
get_lev_attr(116) ->
    [{hp_max, 48277}, {atk, 4571}, {def, 117}];
get_lev_attr(117) ->
    [{hp_max, 48893}, {atk, 4629}, {def, 118}];
get_lev_attr(118) ->
    [{hp_max, 49509}, {atk, 4688}, {def, 119}];
get_lev_attr(119) ->
    [{hp_max, 50164}, {atk, 4750}, {def, 120}];
get_lev_attr(120) ->
    [{hp_max, 50780}, {atk, 4808}, {def, 121}];
get_lev_attr(121) ->
    [{hp_max, 51434}, {atk, 4870}, {def, 122}];
get_lev_attr(122) ->
    [{hp_max, 52050}, {atk, 4928}, {def, 123}];
get_lev_attr(123) ->
    [{hp_max, 52705}, {atk, 4990}, {def, 124}];
get_lev_attr(124) ->
    [{hp_max, 53321}, {atk, 5049}, {def, 125}];
get_lev_attr(125) ->
    [{hp_max, 53975}, {atk, 5111}, {def, 126}];
get_lev_attr(126) ->
    [{hp_max, 54630}, {atk, 5173}, {def, 127}];
get_lev_attr(127) ->
    [{hp_max, 55284}, {atk, 5235}, {def, 128}];
get_lev_attr(128) ->
    [{hp_max, 55939}, {atk, 5297}, {def, 129}];
get_lev_attr(129) ->
    [{hp_max, 56593}, {atk, 5359}, {def, 130}];
get_lev_attr(130) ->
    [{hp_max, 57248}, {atk, 5421}, {def, 131}];
get_lev_attr(131) ->
    [{hp_max, 57902}, {atk, 5482}, {def, 132}];
get_lev_attr(132) ->
    [{hp_max, 58557}, {atk, 5544}, {def, 134}];
get_lev_attr(133) ->
    [{hp_max, 59211}, {atk, 5606}, {def, 136}];
get_lev_attr(134) ->
    [{hp_max, 59904}, {atk, 5672}, {def, 138}];
get_lev_attr(135) ->
    [{hp_max, 60559}, {atk, 5734}, {def, 140}];
get_lev_attr(136) ->
    [{hp_max, 61252}, {atk, 5800}, {def, 142}];
get_lev_attr(137) ->
    [{hp_max, 61906}, {atk, 5862}, {def, 144}];
get_lev_attr(138) ->
    [{hp_max, 62599}, {atk, 5927}, {def, 146}];
get_lev_attr(139) ->
    [{hp_max, 63254}, {atk, 5989}, {def, 148}];
get_lev_attr(140) ->
    [{hp_max, 63947}, {atk, 6055}, {def, 150}];
get_lev_attr(141) ->
    [{hp_max, 64640}, {atk, 6120}, {def, 152}];
get_lev_attr(142) ->
    [{hp_max, 65333}, {atk, 6186}, {def, 154}];
get_lev_attr(143) ->
    [{hp_max, 66025}, {atk, 6252}, {def, 156}];
get_lev_attr(144) ->
    [{hp_max, 66718}, {atk, 6317}, {def, 158}];
get_lev_attr(145) ->
    [{hp_max, 67411}, {atk, 6383}, {def, 160}];
get_lev_attr(146) ->
    [{hp_max, 68104}, {atk, 6449}, {def, 162}];
get_lev_attr(147) ->
    [{hp_max, 68797}, {atk, 6514}, {def, 164}];
get_lev_attr(148) ->
    [{hp_max, 69490}, {atk, 6580}, {def, 166}];
get_lev_attr(149) ->
    [{hp_max, 70183}, {atk, 6645}, {def, 168}];
get_lev_attr(150) ->
    [{hp_max, 70915}, {atk, 6715}, {def, 170}];
get_lev_attr(151) ->
    [{hp_max, 71608}, {atk, 6780}, {def, 172}];
get_lev_attr(152) ->
    [{hp_max, 72301}, {atk, 6846}, {def, 174}];
get_lev_attr(153) ->
    [{hp_max, 73032}, {atk, 6915}, {def, 176}];
get_lev_attr(154) ->
    [{hp_max, 73764}, {atk, 6984}, {def, 178}];
get_lev_attr(155) ->
    [{hp_max, 74457}, {atk, 7050}, {def, 180}];
get_lev_attr(156) ->
    [{hp_max, 75188}, {atk, 7119}, {def, 182}];
get_lev_attr(157) ->
    [{hp_max, 75920}, {atk, 7189}, {def, 184}];
get_lev_attr(158) ->
    [{hp_max, 76651}, {atk, 7258}, {def, 186}];
get_lev_attr(159) ->
    [{hp_max, 77344}, {atk, 7324}, {def, 188}];
get_lev_attr(160) ->
    [{hp_max, 78076}, {atk, 7393}, {def, 190}];
get_lev_attr(161) ->
    [{hp_max, 78807}, {atk, 7462}, {def, 192}];
get_lev_attr(162) ->
    [{hp_max, 79539}, {atk, 7531}, {def, 194}];
get_lev_attr(163) ->
    [{hp_max, 80309}, {atk, 7604}, {def, 196}];
get_lev_attr(164) ->
    [{hp_max, 81040}, {atk, 7673}, {def, 198}];
get_lev_attr(165) ->
    [{hp_max, 81772}, {atk, 7743}, {def, 200}];
get_lev_attr(166) ->
    [{hp_max, 82503}, {atk, 7812}, {def, 202}];
get_lev_attr(167) ->
    [{hp_max, 83273}, {atk, 7885}, {def, 204}];
get_lev_attr(168) ->
    [{hp_max, 84005}, {atk, 7954}, {def, 206}];
get_lev_attr(169) ->
    [{hp_max, 84775}, {atk, 8027}, {def, 208}];
get_lev_attr(170) ->
    [{hp_max, 85506}, {atk, 8096}, {def, 210}];
get_lev_attr(171) ->
    [{hp_max, 86276}, {atk, 8169}, {def, 212}];
get_lev_attr(172) ->
    [{hp_max, 87008}, {atk, 8239}, {def, 214}];
get_lev_attr(173) ->
    [{hp_max, 87777}, {atk, 8311}, {def, 216}];
get_lev_attr(174) ->
    [{hp_max, 88547}, {atk, 8384}, {def, 218}];
get_lev_attr(175) ->
    [{hp_max, 89317}, {atk, 8457}, {def, 220}];
get_lev_attr(176) ->
    [{hp_max, 90049}, {atk, 8527}, {def, 222}];
get_lev_attr(177) ->
    [{hp_max, 90819}, {atk, 8599}, {def, 224}];
get_lev_attr(178) ->
    [{hp_max, 91589}, {atk, 8672}, {def, 226}];
get_lev_attr(179) ->
    [{hp_max, 92359}, {atk, 8745}, {def, 228}];
get_lev_attr(180) ->
    [{hp_max, 93129}, {atk, 8818}, {def, 230}];
get_lev_attr(181) ->
    [{hp_max, 93937}, {atk, 8895}, {def, 232}];
get_lev_attr(182) ->
    [{hp_max, 94707}, {atk, 8968}, {def, 234}];
get_lev_attr(183) ->
    [{hp_max, 95477}, {atk, 9041}, {def, 236}];
get_lev_attr(184) ->
    [{hp_max, 96247}, {atk, 9114}, {def, 238}];
get_lev_attr(185) ->
    [{hp_max, 97056}, {atk, 9190}, {def, 240}];
get_lev_attr(186) ->
    [{hp_max, 97826}, {atk, 9263}, {def, 242}];
get_lev_attr(187) ->
    [{hp_max, 98634}, {atk, 9340}, {def, 244}];
get_lev_attr(188) ->
    [{hp_max, 99404}, {atk, 9412}, {def, 246}];
get_lev_attr(189) ->
    [{hp_max, 100213}, {atk, 9489}, {def, 248}];
get_lev_attr(190) ->
    [{hp_max, 100983}, {atk, 9562}, {def, 250}];
get_lev_attr(191) ->
    [{hp_max, 101791}, {atk, 9638}, {def, 252}];
get_lev_attr(192) ->
    [{hp_max, 102600}, {atk, 9715}, {def, 254}];
get_lev_attr(193) ->
    [{hp_max, 103408}, {atk, 9792}, {def, 256}];
get_lev_attr(194) ->
    [{hp_max, 104217}, {atk, 9868}, {def, 258}];
get_lev_attr(195) ->
    [{hp_max, 105025}, {atk, 9945}, {def, 260}];
get_lev_attr(196) ->
    [{hp_max, 105834}, {atk, 10021}, {def, 262}];
get_lev_attr(197) ->
    [{hp_max, 106642}, {atk, 10098}, {def, 264}];
get_lev_attr(198) ->
    [{hp_max, 107451}, {atk, 10174}, {def, 266}];
get_lev_attr(199) ->
    [{hp_max, 108259}, {atk, 10251}, {def, 268}];
get_lev_attr(200) ->
    [{hp_max, 109068}, {atk, 10328}, {def, 270}];
get_lev_attr(_) -> [].

get_max_lev() -> 200.

get_star_rio(5) -> 10;
get_star_rio(6) -> 10;
get_star_rio(7) -> 10;
get_star_rio(8) -> 10;
get_star_rio(9) -> 10;
get_star_rio(10) -> 20;
get_star_rio(11) -> 20;
get_star_rio(12) -> 20;
get_star_rio(13) -> 20;
get_star_rio(14) -> 20;
get_star_rio(15) -> 30;
get_star_rio(16) -> 30;
get_star_rio(17) -> 30;
get_star_rio(18) -> 30;
get_star_rio(19) -> 30;
get_star_rio(20) -> 40;
get_star_rio(21) -> 40;
get_star_rio(22) -> 40;
get_star_rio(23) -> 40;
get_star_rio(24) -> 40;
get_star_rio(25) -> 50;
get_star_rio(26) -> 50;
get_star_rio(27) -> 50;
get_star_rio(28) -> 50;
get_star_rio(29) -> 50;
get_star_rio(30) -> 80;
get_star_rio(31) -> 80;
get_star_rio(32) -> 80;
get_star_rio(33) -> 80;
get_star_rio(34) -> 80;
get_star_rio(35) -> 110;
get_star_rio(36) -> 110;
get_star_rio(37) -> 110;
get_star_rio(38) -> 110;
get_star_rio(39) -> 110;
get_star_rio(40) -> 140;
get_star_rio(41) -> 140;
get_star_rio(42) -> 140;
get_star_rio(43) -> 140;
get_star_rio(44) -> 140;
get_star_rio(45) -> 170;
get_star_rio(46) -> 170;
get_star_rio(47) -> 170;
get_star_rio(48) -> 170;
get_star_rio(49) -> 170;
get_star_rio(50) -> 200;
get_star_rio(51) -> 200;
get_star_rio(52) -> 200;
get_star_rio(53) -> 200;
get_star_rio(54) -> 200;
get_star_rio(55) -> 250;
get_star_rio(56) -> 250;
get_star_rio(57) -> 250;
get_star_rio(58) -> 250;
get_star_rio(59) -> 250;
get_star_rio(60) -> 300;
get_star_rio(61) -> 310;
get_star_rio(62) -> 320;
get_star_rio(63) -> 330;
get_star_rio(64) -> 340;
get_star_rio(65) -> 350;
get_star_rio(66) -> 350;
get_star_rio(67) -> 350;
get_star_rio(68) -> 350;
get_star_rio(69) -> 350;
get_star_rio(70) -> 350;
get_star_rio(71) -> 350;
get_star_rio(72) -> 350;
get_star_rio(73) -> 350;
get_star_rio(74) -> 350;
get_star_rio(75) -> 350;
get_star_rio(_) -> 0.

get_extract_limit_num(1) -> 50;
get_extract_limit_num(2) -> 55;
get_extract_limit_num(3) -> 60;
get_extract_limit_num(4) -> 65;
get_extract_limit_num(5) -> 70;
get_extract_limit_num(6) -> 75;
get_extract_limit_num(7) -> 80;
get_extract_limit_num(8) -> 85;
get_extract_limit_num(9) -> 90;
get_extract_limit_num(10) -> 95;
get_extract_limit_num(11) -> 100;
get_extract_limit_num(12) -> 105;
get_extract_limit_num(13) -> 110;
get_extract_limit_num(14) -> 115;
get_extract_limit_num(15) -> 120;
get_extract_limit_num(16) -> 125;
get_extract_limit_num(17) -> 130;
get_extract_limit_num(18) -> 135;
get_extract_limit_num(19) -> 140;
get_extract_limit_num(20) -> 145;
get_extract_limit_num(21) -> 150;
get_extract_limit_num(22) -> 155;
get_extract_limit_num(23) -> 160;
get_extract_limit_num(24) -> 165;
get_extract_limit_num(25) -> 170;
get_extract_limit_num(26) -> 175;
get_extract_limit_num(27) -> 180;
get_extract_limit_num(28) -> 185;
get_extract_limit_num(29) -> 190;
get_extract_limit_num(30) -> 195;
get_extract_limit_num(31) -> 200;
get_extract_limit_num(32) -> 205;
get_extract_limit_num(33) -> 210;
get_extract_limit_num(34) -> 215;
get_extract_limit_num(35) -> 220;
get_extract_limit_num(36) -> 225;
get_extract_limit_num(37) -> 230;
get_extract_limit_num(38) -> 235;
get_extract_limit_num(39) -> 240;
get_extract_limit_num(40) -> 245;
get_extract_limit_num(41) -> 250;
get_extract_limit_num(42) -> 255;
get_extract_limit_num(43) -> 260;
get_extract_limit_num(44) -> 265;
get_extract_limit_num(45) -> 270;
get_extract_limit_num(46) -> 275;
get_extract_limit_num(47) -> 280;
get_extract_limit_num(48) -> 285;
get_extract_limit_num(49) -> 290;
get_extract_limit_num(50) -> 295;
get_extract_limit_num(51) -> 300;
get_extract_limit_num(52) -> 305;
get_extract_limit_num(53) -> 310;
get_extract_limit_num(54) -> 315;
get_extract_limit_num(55) -> 320;
get_extract_limit_num(56) -> 325;
get_extract_limit_num(57) -> 330;
get_extract_limit_num(58) -> 335;
get_extract_limit_num(59) -> 340;
get_extract_limit_num(60) -> 345;
get_extract_limit_num(61) -> 350;
get_extract_limit_num(62) -> 355;
get_extract_limit_num(63) -> 360;
get_extract_limit_num(64) -> 365;
get_extract_limit_num(65) -> 370;
get_extract_limit_num(66) -> 375;
get_extract_limit_num(67) -> 380;
get_extract_limit_num(68) -> 385;
get_extract_limit_num(69) -> 390;
get_extract_limit_num(70) -> 395;
get_extract_limit_num(71) -> 400;
get_extract_limit_num(72) -> 405;
get_extract_limit_num(73) -> 410;
get_extract_limit_num(74) -> 415;
get_extract_limit_num(75) -> 420;
get_extract_limit_num(76) -> 425;
get_extract_limit_num(77) -> 430;
get_extract_limit_num(78) -> 435;
get_extract_limit_num(79) -> 440;
get_extract_limit_num(80) -> 445;
get_extract_limit_num(81) -> 450;
get_extract_limit_num(82) -> 455;
get_extract_limit_num(83) -> 460;
get_extract_limit_num(84) -> 465;
get_extract_limit_num(85) -> 470;
get_extract_limit_num(86) -> 475;
get_extract_limit_num(87) -> 480;
get_extract_limit_num(88) -> 485;
get_extract_limit_num(89) -> 490;
get_extract_limit_num(90) -> 495;
get_extract_limit_num(91) -> 500;
get_extract_limit_num(92) -> 505;
get_extract_limit_num(93) -> 510;
get_extract_limit_num(94) -> 515;
get_extract_limit_num(95) -> 520;
get_extract_limit_num(96) -> 525;
get_extract_limit_num(97) -> 530;
get_extract_limit_num(98) -> 535;
get_extract_limit_num(99) -> 540;
get_extract_limit_num(100) -> 545;
get_extract_limit_num(101) -> 550;
get_extract_limit_num(102) -> 555;
get_extract_limit_num(103) -> 560;
get_extract_limit_num(104) -> 565;
get_extract_limit_num(105) -> 570;
get_extract_limit_num(106) -> 575;
get_extract_limit_num(107) -> 580;
get_extract_limit_num(108) -> 585;
get_extract_limit_num(109) -> 590;
get_extract_limit_num(110) -> 595;
get_extract_limit_num(111) -> 600;
get_extract_limit_num(112) -> 605;
get_extract_limit_num(113) -> 610;
get_extract_limit_num(114) -> 615;
get_extract_limit_num(115) -> 620;
get_extract_limit_num(116) -> 625;
get_extract_limit_num(117) -> 630;
get_extract_limit_num(118) -> 635;
get_extract_limit_num(119) -> 640;
get_extract_limit_num(120) -> 645;
get_extract_limit_num(121) -> 650;
get_extract_limit_num(122) -> 655;
get_extract_limit_num(123) -> 660;
get_extract_limit_num(124) -> 665;
get_extract_limit_num(125) -> 670;
get_extract_limit_num(126) -> 675;
get_extract_limit_num(127) -> 680;
get_extract_limit_num(128) -> 685;
get_extract_limit_num(129) -> 690;
get_extract_limit_num(130) -> 695;
get_extract_limit_num(131) -> 700;
get_extract_limit_num(132) -> 705;
get_extract_limit_num(133) -> 710;
get_extract_limit_num(134) -> 715;
get_extract_limit_num(135) -> 720;
get_extract_limit_num(136) -> 725;
get_extract_limit_num(137) -> 730;
get_extract_limit_num(138) -> 735;
get_extract_limit_num(139) -> 740;
get_extract_limit_num(140) -> 745;
get_extract_limit_num(141) -> 750;
get_extract_limit_num(142) -> 755;
get_extract_limit_num(143) -> 760;
get_extract_limit_num(144) -> 765;
get_extract_limit_num(145) -> 770;
get_extract_limit_num(146) -> 775;
get_extract_limit_num(147) -> 780;
get_extract_limit_num(148) -> 785;
get_extract_limit_num(149) -> 790;
get_extract_limit_num(150) -> 795;
get_extract_limit_num(151) -> 800;
get_extract_limit_num(152) -> 805;
get_extract_limit_num(153) -> 810;
get_extract_limit_num(154) -> 815;
get_extract_limit_num(155) -> 820;
get_extract_limit_num(156) -> 825;
get_extract_limit_num(157) -> 830;
get_extract_limit_num(158) -> 835;
get_extract_limit_num(159) -> 840;
get_extract_limit_num(160) -> 845;
get_extract_limit_num(161) -> 850;
get_extract_limit_num(162) -> 855;
get_extract_limit_num(163) -> 860;
get_extract_limit_num(164) -> 865;
get_extract_limit_num(165) -> 870;
get_extract_limit_num(166) -> 875;
get_extract_limit_num(167) -> 880;
get_extract_limit_num(168) -> 885;
get_extract_limit_num(169) -> 890;
get_extract_limit_num(170) -> 895;
get_extract_limit_num(171) -> 900;
get_extract_limit_num(172) -> 905;
get_extract_limit_num(173) -> 910;
get_extract_limit_num(174) -> 915;
get_extract_limit_num(175) -> 920;
get_extract_limit_num(176) -> 925;
get_extract_limit_num(177) -> 930;
get_extract_limit_num(178) -> 935;
get_extract_limit_num(179) -> 940;
get_extract_limit_num(180) -> 945;
get_extract_limit_num(181) -> 950;
get_extract_limit_num(182) -> 955;
get_extract_limit_num(183) -> 960;
get_extract_limit_num(184) -> 965;
get_extract_limit_num(185) -> 970;
get_extract_limit_num(186) -> 975;
get_extract_limit_num(187) -> 980;
get_extract_limit_num(188) -> 985;
get_extract_limit_num(189) -> 990;
get_extract_limit_num(190) -> 995;
get_extract_limit_num(191) -> 1000;
get_extract_limit_num(192) -> 1005;
get_extract_limit_num(193) -> 1010;
get_extract_limit_num(194) -> 1015;
get_extract_limit_num(195) -> 1020;
get_extract_limit_num(196) -> 1025;
get_extract_limit_num(197) -> 1030;
get_extract_limit_num(198) -> 1035;
get_extract_limit_num(199) -> 1040;
get_extract_limit_num(200) -> 1045;
get_extract_limit_num(_) -> 0.

get_extract_need_time(1) -> 240;
get_extract_need_time(2) -> 240;
get_extract_need_time(3) -> 238;
get_extract_need_time(4) -> 238;
get_extract_need_time(5) -> 236;
get_extract_need_time(6) -> 236;
get_extract_need_time(7) -> 234;
get_extract_need_time(8) -> 234;
get_extract_need_time(9) -> 232;
get_extract_need_time(10) -> 232;
get_extract_need_time(11) -> 230;
get_extract_need_time(12) -> 230;
get_extract_need_time(13) -> 228;
get_extract_need_time(14) -> 228;
get_extract_need_time(15) -> 226;
get_extract_need_time(16) -> 226;
get_extract_need_time(17) -> 224;
get_extract_need_time(18) -> 224;
get_extract_need_time(19) -> 222;
get_extract_need_time(20) -> 222;
get_extract_need_time(21) -> 220;
get_extract_need_time(22) -> 220;
get_extract_need_time(23) -> 218;
get_extract_need_time(24) -> 218;
get_extract_need_time(25) -> 216;
get_extract_need_time(26) -> 216;
get_extract_need_time(27) -> 214;
get_extract_need_time(28) -> 214;
get_extract_need_time(29) -> 212;
get_extract_need_time(30) -> 212;
get_extract_need_time(31) -> 210;
get_extract_need_time(32) -> 210;
get_extract_need_time(33) -> 208;
get_extract_need_time(34) -> 208;
get_extract_need_time(35) -> 206;
get_extract_need_time(36) -> 206;
get_extract_need_time(37) -> 204;
get_extract_need_time(38) -> 204;
get_extract_need_time(39) -> 202;
get_extract_need_time(40) -> 202;
get_extract_need_time(41) -> 200;
get_extract_need_time(42) -> 200;
get_extract_need_time(43) -> 198;
get_extract_need_time(44) -> 198;
get_extract_need_time(45) -> 196;
get_extract_need_time(46) -> 196;
get_extract_need_time(47) -> 194;
get_extract_need_time(48) -> 194;
get_extract_need_time(49) -> 192;
get_extract_need_time(50) -> 192;
get_extract_need_time(51) -> 190;
get_extract_need_time(52) -> 190;
get_extract_need_time(53) -> 188;
get_extract_need_time(54) -> 188;
get_extract_need_time(55) -> 186;
get_extract_need_time(56) -> 186;
get_extract_need_time(57) -> 184;
get_extract_need_time(58) -> 184;
get_extract_need_time(59) -> 182;
get_extract_need_time(60) -> 182;
get_extract_need_time(61) -> 180;
get_extract_need_time(62) -> 180;
get_extract_need_time(63) -> 178;
get_extract_need_time(64) -> 178;
get_extract_need_time(65) -> 176;
get_extract_need_time(66) -> 176;
get_extract_need_time(67) -> 174;
get_extract_need_time(68) -> 174;
get_extract_need_time(69) -> 172;
get_extract_need_time(70) -> 172;
get_extract_need_time(71) -> 170;
get_extract_need_time(72) -> 170;
get_extract_need_time(73) -> 168;
get_extract_need_time(74) -> 168;
get_extract_need_time(75) -> 166;
get_extract_need_time(76) -> 166;
get_extract_need_time(77) -> 164;
get_extract_need_time(78) -> 164;
get_extract_need_time(79) -> 162;
get_extract_need_time(80) -> 162;
get_extract_need_time(81) -> 160;
get_extract_need_time(82) -> 160;
get_extract_need_time(83) -> 158;
get_extract_need_time(84) -> 158;
get_extract_need_time(85) -> 156;
get_extract_need_time(86) -> 156;
get_extract_need_time(87) -> 154;
get_extract_need_time(88) -> 154;
get_extract_need_time(89) -> 152;
get_extract_need_time(90) -> 152;
get_extract_need_time(91) -> 150;
get_extract_need_time(92) -> 150;
get_extract_need_time(93) -> 148;
get_extract_need_time(94) -> 148;
get_extract_need_time(95) -> 146;
get_extract_need_time(96) -> 146;
get_extract_need_time(97) -> 144;
get_extract_need_time(98) -> 144;
get_extract_need_time(99) -> 142;
get_extract_need_time(100) -> 142;
get_extract_need_time(101) -> 140;
get_extract_need_time(102) -> 140;
get_extract_need_time(103) -> 138;
get_extract_need_time(104) -> 138;
get_extract_need_time(105) -> 136;
get_extract_need_time(106) -> 136;
get_extract_need_time(107) -> 134;
get_extract_need_time(108) -> 134;
get_extract_need_time(109) -> 132;
get_extract_need_time(110) -> 132;
get_extract_need_time(111) -> 130;
get_extract_need_time(112) -> 130;
get_extract_need_time(113) -> 128;
get_extract_need_time(114) -> 128;
get_extract_need_time(115) -> 126;
get_extract_need_time(116) -> 126;
get_extract_need_time(117) -> 124;
get_extract_need_time(118) -> 124;
get_extract_need_time(119) -> 122;
get_extract_need_time(120) -> 122;
get_extract_need_time(121) -> 120;
get_extract_need_time(122) -> 120;
get_extract_need_time(123) -> 118;
get_extract_need_time(124) -> 118;
get_extract_need_time(125) -> 116;
get_extract_need_time(126) -> 116;
get_extract_need_time(127) -> 114;
get_extract_need_time(128) -> 114;
get_extract_need_time(129) -> 112;
get_extract_need_time(130) -> 112;
get_extract_need_time(131) -> 110;
get_extract_need_time(132) -> 110;
get_extract_need_time(133) -> 108;
get_extract_need_time(134) -> 108;
get_extract_need_time(135) -> 106;
get_extract_need_time(136) -> 106;
get_extract_need_time(137) -> 104;
get_extract_need_time(138) -> 104;
get_extract_need_time(139) -> 102;
get_extract_need_time(140) -> 102;
get_extract_need_time(141) -> 100;
get_extract_need_time(142) -> 100;
get_extract_need_time(143) -> 98;
get_extract_need_time(144) -> 98;
get_extract_need_time(145) -> 96;
get_extract_need_time(146) -> 96;
get_extract_need_time(147) -> 94;
get_extract_need_time(148) -> 94;
get_extract_need_time(149) -> 92;
get_extract_need_time(150) -> 92;
get_extract_need_time(151) -> 90;
get_extract_need_time(152) -> 90;
get_extract_need_time(153) -> 88;
get_extract_need_time(154) -> 88;
get_extract_need_time(155) -> 86;
get_extract_need_time(156) -> 86;
get_extract_need_time(157) -> 84;
get_extract_need_time(158) -> 84;
get_extract_need_time(159) -> 82;
get_extract_need_time(160) -> 82;
get_extract_need_time(161) -> 80;
get_extract_need_time(162) -> 80;
get_extract_need_time(163) -> 78;
get_extract_need_time(164) -> 78;
get_extract_need_time(165) -> 76;
get_extract_need_time(166) -> 76;
get_extract_need_time(167) -> 74;
get_extract_need_time(168) -> 74;
get_extract_need_time(169) -> 72;
get_extract_need_time(170) -> 72;
get_extract_need_time(171) -> 70;
get_extract_need_time(172) -> 70;
get_extract_need_time(173) -> 68;
get_extract_need_time(174) -> 68;
get_extract_need_time(175) -> 66;
get_extract_need_time(176) -> 66;
get_extract_need_time(177) -> 64;
get_extract_need_time(178) -> 64;
get_extract_need_time(179) -> 62;
get_extract_need_time(180) -> 62;
get_extract_need_time(181) -> 60;
get_extract_need_time(182) -> 60;
get_extract_need_time(183) -> 58;
get_extract_need_time(184) -> 58;
get_extract_need_time(185) -> 56;
get_extract_need_time(186) -> 56;
get_extract_need_time(187) -> 54;
get_extract_need_time(188) -> 54;
get_extract_need_time(189) -> 52;
get_extract_need_time(190) -> 52;
get_extract_need_time(191) -> 50;
get_extract_need_time(192) -> 50;
get_extract_need_time(193) -> 48;
get_extract_need_time(194) -> 48;
get_extract_need_time(195) -> 46;
get_extract_need_time(196) -> 46;
get_extract_need_time(197) -> 44;
get_extract_need_time(198) -> 44;
get_extract_need_time(199) -> 42;
get_extract_need_time(200) -> 42;
get_extract_need_time(_) -> 3600.

get_star_resonate_loss(6) ->
    {[{10096, 1}], [{1, 1000000}]};
get_star_resonate_loss(7) ->
    {[{10096, 1}], [{1, 2000000}]};
get_star_resonate_loss(8) ->
    {[{10096, 1}], [{1, 3000000}]};
get_star_resonate_loss(9) ->
    {[{10096, 1}], [{1, 4000000}]};
get_star_resonate_loss(10) ->
    {[{10096, 1}], [{1, 5000000}]};
get_star_resonate_loss(11) ->
    {[{10096, 1}], [{1, 6000000}]};
get_star_resonate_loss(12) ->
    {[{10096, 1}], [{1, 8000000}]};
get_star_resonate_loss(13) ->
    {[{10096, 1}], [{1, 10000000}]};
get_star_resonate_loss(14) ->
    {[{10096, 1}], [{1, 10000000}]};
get_star_resonate_loss(15) ->
    {[{10096, 1}], [{1, 10000000}]};
get_star_resonate_loss(16) ->
    {[{10096, 1}], [{1, 10000000}]};
get_star_resonate_loss(17) ->
    {[{10096, 1}], [{1, 10000000}]};
get_star_resonate_loss(18) ->
    {[{10096, 1}], [{1, 10000000}]};
get_star_resonate_loss(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidresonate_data949, _,
       {__Levelresonate_data949, __Tracesresonate_data949}}
	  when __Levelresonate_data949 band 8 /= 0 orelse
		 __Tracesresonate_data949 /= [] ->
	  lager:do_log(error,
		       [{module, resonate_data},
			{function, get_star_resonate_loss}, {line, 949},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_star_resonate_loss_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelresonate_data949,
		       __Tracesresonate_data949, lager_event,
		       __Pidresonate_data949);
      _ -> ok
    end,
    undefined.

get_unlock_expend(1) -> {[{10480, 200}], [{3, 500}]};
get_unlock_expend(2) -> {[{10480, 300}], [{3, 600}]};
get_unlock_expend(3) -> {[{10480, 400}], [{3, 700}]};
get_unlock_expend(4) -> {[{10480, 500}], [{3, 800}]};
get_unlock_expend(5) -> {[{10480, 600}], [{3, 900}]};
get_unlock_expend(6) -> {[{10480, 700}], [{3, 1000}]};
get_unlock_expend(7) -> {[{10480, 800}], [{3, 1100}]};
get_unlock_expend(8) -> {[{10480, 900}], [{3, 1200}]};
get_unlock_expend(9) -> {[{10480, 1000}], [{3, 1300}]};
get_unlock_expend(10) -> {[{10480, 1200}], [{3, 1400}]};
get_unlock_expend(11) -> {[{10480, 1400}], [{3, 1500}]};
get_unlock_expend(12) -> {[{10480, 1600}], [{3, 1600}]};
get_unlock_expend(13) -> {[{10480, 1800}], [{3, 1700}]};
get_unlock_expend(14) -> {[{10480, 2000}], [{3, 1800}]};
get_unlock_expend(15) -> {[{10480, 2200}], [{3, 1900}]};
get_unlock_expend(16) -> {[{10480, 2400}], [{3, 2000}]};
get_unlock_expend(17) -> {[{10480, 2600}], [{3, 2100}]};
get_unlock_expend(18) -> {[{10480, 2800}], [{3, 2200}]};
get_unlock_expend(19) -> {[{10480, 3000}], [{3, 2300}]};
get_unlock_expend(20) -> {[{10480, 3200}], [{3, 2400}]};
get_unlock_expend(21) -> {[{10480, 3400}], [{3, 2500}]};
get_unlock_expend(22) -> {[{10480, 3600}], [{3, 2600}]};
get_unlock_expend(23) -> {[{10480, 3800}], [{3, 2700}]};
get_unlock_expend(24) -> {[{10480, 4000}], [{3, 2800}]};
get_unlock_expend(25) -> {[{10480, 4200}], [{3, 2900}]};
get_unlock_expend(26) -> {[{10480, 4400}], [{3, 3000}]};
get_unlock_expend(27) -> {[{10480, 4600}], [{3, 3100}]};
get_unlock_expend(28) -> {[{10480, 4800}], [{3, 3200}]};
get_unlock_expend(29) -> {[{10480, 5000}], [{3, 3300}]};
get_unlock_expend(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidresonate_data980, _,
       {__Levelresonate_data980, __Tracesresonate_data980}}
	  when __Levelresonate_data980 band 8 /= 0 orelse
		 __Tracesresonate_data980 /= [] ->
	  lager:do_log(error,
		       [{module, resonate_data}, {function, get_unlock_expend},
			{line, 980}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_unlock_expend_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelresonate_data980,
		       __Tracesresonate_data980, lager_event,
		       __Pidresonate_data980);
      _ -> ok
    end,
    undefined.

get_cystal_lev_expend(340) ->
    [{10001, 4000}, {1, 31200000}, {22, 16000000}];
get_cystal_lev_expend(341) ->
    [{10001, 4500}, {1, 35100000}, {22, 18000000}];
get_cystal_lev_expend(342) ->
    [{10001, 5000}, {1, 39000000}, {22, 20000000}];
get_cystal_lev_expend(343) ->
    [{10001, 5500}, {1, 42900000}, {22, 22000000}];
get_cystal_lev_expend(344) ->
    [{10001, 6000}, {1, 46800000}, {22, 24000000}];
get_cystal_lev_expend(345) ->
    [{10001, 6500}, {1, 50700000}, {22, 26000000}];
get_cystal_lev_expend(346) ->
    [{10001, 7000}, {1, 54600000}, {22, 28000000}];
get_cystal_lev_expend(347) ->
    [{10001, 7500}, {1, 58500000}, {22, 30000000}];
get_cystal_lev_expend(348) ->
    [{10001, 8000}, {1, 62400000}, {22, 32000000}];
get_cystal_lev_expend(349) ->
    [{10001, 8500}, {1, 66300000}, {22, 34000000}];
get_cystal_lev_expend(350) ->
    [{10001, 9000}, {1, 70200000}, {22, 36000000}];
get_cystal_lev_expend(351) ->
    [{10001, 9500}, {1, 74100000}, {22, 38000000}];
get_cystal_lev_expend(352) ->
    [{10001, 10000}, {1, 78000000}, {22, 40000000}];
get_cystal_lev_expend(353) ->
    [{10001, 10500}, {1, 81900000}, {22, 42000000}];
get_cystal_lev_expend(354) ->
    [{10001, 11000}, {1, 85800000}, {22, 44000000}];
get_cystal_lev_expend(355) ->
    [{10001, 11500}, {1, 89700000}, {22, 46000000}];
get_cystal_lev_expend(356) ->
    [{10001, 12000}, {1, 93600000}, {22, 48000000}];
get_cystal_lev_expend(357) ->
    [{10001, 12500}, {1, 97500000}, {22, 50000000}];
get_cystal_lev_expend(358) ->
    [{10001, 13000}, {1, 101400000}, {22, 52000000}];
get_cystal_lev_expend(359) ->
    [{10001, 13500}, {1, 105300000}, {22, 54000000}];
get_cystal_lev_expend(360) ->
    [{10001, 14000}, {1, 109200000}, {22, 56000000}];
get_cystal_lev_expend(361) ->
    [{10001, 14500}, {1, 113100000}, {22, 58000000}];
get_cystal_lev_expend(362) ->
    [{10001, 15000}, {1, 117000000}, {22, 60000000}];
get_cystal_lev_expend(363) ->
    [{10001, 15500}, {1, 120900000}, {22, 62000000}];
get_cystal_lev_expend(364) ->
    [{10001, 16000}, {1, 124800000}, {22, 64000000}];
get_cystal_lev_expend(365) ->
    [{10001, 16500}, {1, 128700000}, {22, 66000000}];
get_cystal_lev_expend(366) ->
    [{10001, 17000}, {1, 132600000}, {22, 68000000}];
get_cystal_lev_expend(367) ->
    [{10001, 17500}, {1, 136500000}, {22, 70000000}];
get_cystal_lev_expend(368) ->
    [{10001, 18000}, {1, 140400000}, {22, 72000000}];
get_cystal_lev_expend(369) ->
    [{10001, 18500}, {1, 144300000}, {22, 74000000}];
get_cystal_lev_expend(370) ->
    [{10001, 19000}, {1, 148200000}, {22, 76000000}];
get_cystal_lev_expend(371) ->
    [{10001, 19500}, {1, 152100000}, {22, 78000000}];
get_cystal_lev_expend(372) ->
    [{10001, 20000}, {1, 156000000}, {22, 80000000}];
get_cystal_lev_expend(373) ->
    [{10001, 20500}, {1, 159900000}, {22, 82000000}];
get_cystal_lev_expend(374) ->
    [{10001, 21000}, {1, 163800000}, {22, 84000000}];
get_cystal_lev_expend(375) ->
    [{10001, 21500}, {1, 167700000}, {22, 86000000}];
get_cystal_lev_expend(376) ->
    [{10001, 22000}, {1, 171600000}, {22, 88000000}];
get_cystal_lev_expend(377) ->
    [{10001, 22500}, {1, 175500000}, {22, 90000000}];
get_cystal_lev_expend(378) ->
    [{10001, 23000}, {1, 179400000}, {22, 92000000}];
get_cystal_lev_expend(379) ->
    [{10001, 23500}, {1, 183300000}, {22, 94000000}];
get_cystal_lev_expend(380) ->
    [{10001, 24000}, {1, 187200000}, {22, 96000000}];
get_cystal_lev_expend(381) ->
    [{10001, 24500}, {1, 191100000}, {22, 98000000}];
get_cystal_lev_expend(382) ->
    [{10001, 25000}, {1, 195000000}, {22, 100000000}];
get_cystal_lev_expend(383) ->
    [{10001, 25500}, {1, 198900000}, {22, 102000000}];
get_cystal_lev_expend(384) ->
    [{10001, 26000}, {1, 202800000}, {22, 104000000}];
get_cystal_lev_expend(385) ->
    [{10001, 26500}, {1, 206700000}, {22, 106000000}];
get_cystal_lev_expend(386) ->
    [{10001, 27000}, {1, 210600000}, {22, 108000000}];
get_cystal_lev_expend(387) ->
    [{10001, 27500}, {1, 214500000}, {22, 110000000}];
get_cystal_lev_expend(388) ->
    [{10001, 28000}, {1, 218400000}, {22, 112000000}];
get_cystal_lev_expend(389) ->
    [{10001, 28500}, {1, 222300000}, {22, 114000000}];
get_cystal_lev_expend(390) ->
    [{10001, 29000}, {1, 226200000}, {22, 116000000}];
get_cystal_lev_expend(391) ->
    [{10001, 29500}, {1, 230100000}, {22, 118000000}];
get_cystal_lev_expend(392) ->
    [{10001, 30000}, {1, 234000000}, {22, 120000000}];
get_cystal_lev_expend(393) ->
    [{10001, 30500}, {1, 237900000}, {22, 122000000}];
get_cystal_lev_expend(394) ->
    [{10001, 31000}, {1, 241800000}, {22, 124000000}];
get_cystal_lev_expend(395) ->
    [{10001, 31500}, {1, 245700000}, {22, 126000000}];
get_cystal_lev_expend(396) ->
    [{10001, 32000}, {1, 249600000}, {22, 128000000}];
get_cystal_lev_expend(397) ->
    [{10001, 32500}, {1, 253500000}, {22, 130000000}];
get_cystal_lev_expend(398) ->
    [{10001, 33000}, {1, 257400000}, {22, 132000000}];
get_cystal_lev_expend(399) ->
    [{10001, 33500}, {1, 261300000}, {22, 134000000}];
get_cystal_lev_expend(400) ->
    [{10001, 34000}, {1, 265200000}, {22, 136000000}];
get_cystal_lev_expend(401) ->
    [{10001, 34500}, {1, 269100000}, {22, 138000000}];
get_cystal_lev_expend(402) ->
    [{10001, 35000}, {1, 273000000}, {22, 140000000}];
get_cystal_lev_expend(403) ->
    [{10001, 35500}, {1, 276900000}, {22, 142000000}];
get_cystal_lev_expend(404) ->
    [{10001, 36000}, {1, 280800000}, {22, 144000000}];
get_cystal_lev_expend(405) ->
    [{10001, 36500}, {1, 284700000}, {22, 146000000}];
get_cystal_lev_expend(406) ->
    [{10001, 37000}, {1, 288600000}, {22, 148000000}];
get_cystal_lev_expend(407) ->
    [{10001, 37500}, {1, 292500000}, {22, 150000000}];
get_cystal_lev_expend(408) ->
    [{10001, 38000}, {1, 296400000}, {22, 152000000}];
get_cystal_lev_expend(409) ->
    [{10001, 38500}, {1, 300300000}, {22, 154000000}];
get_cystal_lev_expend(410) ->
    [{10001, 39000}, {1, 304200000}, {22, 156000000}];
get_cystal_lev_expend(411) ->
    [{10001, 39500}, {1, 308100000}, {22, 158000000}];
get_cystal_lev_expend(412) ->
    [{10001, 40000}, {1, 312000000}, {22, 160000000}];
get_cystal_lev_expend(413) ->
    [{10001, 40500}, {1, 315900000}, {22, 162000000}];
get_cystal_lev_expend(414) ->
    [{10001, 41000}, {1, 319800000}, {22, 164000000}];
get_cystal_lev_expend(415) ->
    [{10001, 41500}, {1, 323700000}, {22, 166000000}];
get_cystal_lev_expend(416) ->
    [{10001, 42000}, {1, 327600000}, {22, 168000000}];
get_cystal_lev_expend(417) ->
    [{10001, 42500}, {1, 331500000}, {22, 170000000}];
get_cystal_lev_expend(418) ->
    [{10001, 43000}, {1, 335400000}, {22, 172000000}];
get_cystal_lev_expend(419) ->
    [{10001, 43500}, {1, 339300000}, {22, 174000000}];
get_cystal_lev_expend(420) ->
    [{10001, 44000}, {1, 343200000}, {22, 176000000}];
get_cystal_lev_expend(421) ->
    [{10001, 44500}, {1, 347100000}, {22, 178000000}];
get_cystal_lev_expend(422) ->
    [{10001, 45000}, {1, 351000000}, {22, 180000000}];
get_cystal_lev_expend(423) ->
    [{10001, 45500}, {1, 354900000}, {22, 182000000}];
get_cystal_lev_expend(424) ->
    [{10001, 46000}, {1, 358800000}, {22, 184000000}];
get_cystal_lev_expend(425) ->
    [{10001, 46500}, {1, 362700000}, {22, 186000000}];
get_cystal_lev_expend(426) ->
    [{10001, 47000}, {1, 366600000}, {22, 188000000}];
get_cystal_lev_expend(427) ->
    [{10001, 47500}, {1, 370500000}, {22, 190000000}];
get_cystal_lev_expend(428) ->
    [{10001, 48000}, {1, 374400000}, {22, 192000000}];
get_cystal_lev_expend(429) ->
    [{10001, 48500}, {1, 378300000}, {22, 194000000}];
get_cystal_lev_expend(430) ->
    [{10001, 49000}, {1, 382200000}, {22, 196000000}];
get_cystal_lev_expend(431) ->
    [{10001, 49500}, {1, 386100000}, {22, 198000000}];
get_cystal_lev_expend(432) ->
    [{10001, 50000}, {1, 390000000}, {22, 200000000}];
get_cystal_lev_expend(433) ->
    [{10001, 50500}, {1, 393900000}, {22, 202000000}];
get_cystal_lev_expend(434) ->
    [{10001, 51000}, {1, 397800000}, {22, 204000000}];
get_cystal_lev_expend(435) ->
    [{10001, 51500}, {1, 401700000}, {22, 206000000}];
get_cystal_lev_expend(436) ->
    [{10001, 52000}, {1, 405600000}, {22, 208000000}];
get_cystal_lev_expend(437) ->
    [{10001, 52500}, {1, 409500000}, {22, 210000000}];
get_cystal_lev_expend(438) ->
    [{10001, 53000}, {1, 413400000}, {22, 212000000}];
get_cystal_lev_expend(439) ->
    [{10001, 53500}, {1, 417300000}, {22, 214000000}];
get_cystal_lev_expend(440) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(441) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(442) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(443) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(444) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(445) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(446) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(447) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(448) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(449) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(450) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(451) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(452) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(453) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(454) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(455) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(456) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(457) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(458) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(459) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(460) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(461) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(462) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(463) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(464) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(465) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(466) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(467) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(468) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(469) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(470) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(471) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(472) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(473) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(474) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(475) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(476) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(477) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(478) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(479) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(480) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(481) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(482) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(483) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(484) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(485) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(486) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(487) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(488) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(489) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(490) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(491) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(492) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(493) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(494) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(495) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(496) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(497) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(498) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(499) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(500) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(501) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(502) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(503) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(504) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(505) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(506) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(507) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(508) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(509) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(510) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(511) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(512) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(513) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(514) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(515) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(516) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(517) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(518) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(519) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(520) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(521) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(522) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(523) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(524) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(525) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(526) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(527) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(528) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(529) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(530) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(531) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(532) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(533) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(534) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(535) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(536) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(537) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(538) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(539) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(540) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(541) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(542) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(543) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(544) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(545) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(546) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(547) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(548) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(549) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(550) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(551) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(552) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(553) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(554) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(555) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(556) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(557) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(558) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(559) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(560) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(561) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(562) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(563) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(564) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(565) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(566) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(567) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(568) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(569) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(570) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(571) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(572) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(573) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(574) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(575) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(576) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(577) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(578) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(579) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(580) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(581) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(582) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(583) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(584) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(585) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(586) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(587) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(588) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(589) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(590) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(591) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(592) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(593) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(594) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(595) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(596) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(597) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(598) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(599) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(600) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(601) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(602) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(603) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(604) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(605) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(606) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(607) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(608) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(609) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(610) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(611) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(612) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(613) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(614) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(615) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(616) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(617) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(618) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(619) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(620) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(621) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(622) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(623) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(624) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(625) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(626) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(627) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(628) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(629) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(630) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(631) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(632) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(633) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(634) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(635) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(636) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(637) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(638) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(639) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(640) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(641) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(642) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(643) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(644) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(645) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(646) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(647) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(648) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(649) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(650) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(651) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(652) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(653) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(654) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(655) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(656) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(657) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(658) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(659) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(660) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(661) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(662) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(663) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(664) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(665) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(666) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(667) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(668) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(669) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(670) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(671) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(672) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(673) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(674) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(675) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(676) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(677) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(678) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(679) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(680) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(681) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(682) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(683) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(684) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(685) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(686) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(687) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(688) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(689) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(690) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(691) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(692) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(693) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(694) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(695) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(696) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(697) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(698) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(699) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(700) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(701) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(702) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(703) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(704) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(705) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(706) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(707) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(708) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(709) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(710) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(711) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(712) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(713) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(714) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(715) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(716) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(717) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(718) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(719) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(720) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(721) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(722) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(723) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(724) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(725) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(726) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(727) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(728) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(729) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(730) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(731) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(732) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(733) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(734) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(735) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(736) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(737) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(738) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(739) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(740) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(741) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(742) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(743) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(744) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(745) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(746) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(747) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(748) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(749) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(750) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(751) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(752) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(753) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(754) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(755) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(756) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(757) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(758) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(759) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(760) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(761) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(762) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(763) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(764) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(765) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(766) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(767) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(768) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(769) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(770) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(771) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(772) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(773) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(774) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(775) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(776) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(777) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(778) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(779) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(780) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(781) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(782) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(783) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(784) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(785) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(786) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(787) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(788) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(789) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(790) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(791) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(792) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(793) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(794) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(795) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(796) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(797) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(798) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(799) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(800) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(801) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(802) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(803) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(804) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(805) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(806) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(807) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(808) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(809) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(810) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(811) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(812) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(813) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(814) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(815) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(816) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(817) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(818) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(819) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(820) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(821) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(822) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(823) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(824) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(825) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(826) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(827) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(828) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(829) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(830) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(831) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(832) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(833) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(834) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(835) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(836) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(837) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(838) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(839) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(840) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(841) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(842) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(843) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(844) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(845) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(846) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(847) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(848) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(849) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(850) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(851) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(852) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(853) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(854) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(855) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(856) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(857) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(858) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(859) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(860) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(861) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(862) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(863) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(864) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(865) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(866) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(867) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(868) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(869) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(870) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(871) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(872) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(873) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(874) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(875) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(876) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(877) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(878) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(879) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(880) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(881) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(882) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(883) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(884) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(885) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(886) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(887) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(888) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(889) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(890) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(891) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(892) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(893) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(894) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(895) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(896) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(897) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(898) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(899) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(900) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(901) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(902) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(903) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(904) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(905) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(906) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(907) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(908) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(909) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(910) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(911) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(912) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(913) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(914) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(915) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(916) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(917) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(918) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(919) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(920) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(921) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(922) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(923) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(924) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(925) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(926) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(927) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(928) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(929) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(930) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(931) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(932) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(933) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(934) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(935) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(936) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(937) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(938) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(939) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(940) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(941) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(942) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(943) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(944) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(945) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(946) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(947) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(948) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(949) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(950) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(951) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(952) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(953) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(954) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(955) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(956) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(957) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(958) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(959) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(960) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(961) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(962) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(963) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(964) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(965) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(966) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(967) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(968) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(969) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(970) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(971) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(972) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(973) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(974) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(975) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(976) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(977) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(978) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(979) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(980) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(981) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(982) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(983) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(984) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(985) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(986) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(987) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(988) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(989) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(990) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(991) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(992) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(993) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(994) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(995) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(996) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(997) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(998) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(999) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1000) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1001) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1002) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1003) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1004) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1005) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1006) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1007) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1008) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1009) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1010) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1011) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1012) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1013) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1014) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1015) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1016) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1017) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1018) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1019) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1020) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1021) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1022) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1023) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1024) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1025) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1026) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1027) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1028) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1029) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1030) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1031) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1032) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1033) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1034) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1035) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1036) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1037) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1038) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1039) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1040) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1041) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1042) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1043) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1044) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1045) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1046) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1047) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1048) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1049) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1050) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1051) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1052) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1053) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1054) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1055) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1056) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1057) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1058) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1059) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1060) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1061) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1062) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1063) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1064) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1065) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1066) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1067) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1068) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1069) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1070) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1071) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1072) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1073) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1074) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1075) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1076) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1077) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1078) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1079) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1080) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1081) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1082) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1083) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1084) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1085) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1086) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1087) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1088) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1089) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1090) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1091) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1092) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1093) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1094) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1095) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1096) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1097) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1098) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1099) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1100) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1101) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1102) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1103) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1104) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1105) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1106) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1107) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1108) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1109) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1110) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1111) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1112) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1113) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1114) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1115) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1116) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1117) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1118) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1119) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1120) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1121) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1122) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1123) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1124) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1125) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1126) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1127) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1128) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1129) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1130) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1131) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1132) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1133) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1134) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1135) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1136) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1137) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1138) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1139) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1140) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1141) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1142) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1143) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1144) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1145) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1146) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1147) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1148) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1149) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1150) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1151) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1152) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1153) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1154) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1155) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1156) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1157) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1158) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1159) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1160) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1161) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1162) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1163) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1164) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1165) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1166) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1167) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1168) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1169) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1170) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1171) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1172) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1173) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1174) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1175) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1176) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1177) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1178) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1179) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1180) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1181) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1182) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1183) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1184) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1185) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1186) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1187) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1188) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1189) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1190) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1191) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1192) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1193) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1194) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1195) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1196) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1197) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1198) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1199) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1200) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1201) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1202) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1203) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1204) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1205) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1206) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1207) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1208) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1209) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1210) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1211) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1212) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1213) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1214) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1215) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1216) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1217) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1218) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1219) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1220) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1221) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1222) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1223) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1224) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1225) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1226) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1227) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1228) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1229) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1230) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1231) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1232) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1233) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1234) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1235) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1236) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1237) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1238) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1239) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1240) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1241) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1242) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1243) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1244) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1245) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1246) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1247) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1248) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1249) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1250) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1251) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1252) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1253) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1254) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1255) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1256) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1257) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1258) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1259) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1260) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1261) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1262) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1263) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1264) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1265) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1266) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1267) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1268) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1269) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1270) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1271) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1272) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1273) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1274) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1275) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1276) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1277) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1278) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1279) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1280) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1281) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1282) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1283) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1284) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1285) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1286) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1287) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1288) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1289) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1290) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1291) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1292) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1293) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1294) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1295) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1296) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1297) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1298) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1299) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1300) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1301) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1302) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1303) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1304) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1305) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1306) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1307) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1308) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1309) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1310) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1311) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1312) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1313) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1314) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1315) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1316) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1317) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1318) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1319) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1320) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1321) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1322) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1323) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1324) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1325) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1326) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1327) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1328) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1329) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1330) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1331) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1332) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1333) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1334) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1335) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1336) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1337) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1338) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1339) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1340) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1341) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1342) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1343) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1344) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1345) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1346) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1347) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1348) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1349) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1350) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1351) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1352) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1353) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1354) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1355) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1356) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1357) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1358) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1359) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1360) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1361) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1362) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1363) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1364) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1365) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1366) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1367) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1368) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1369) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1370) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1371) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1372) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1373) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1374) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1375) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1376) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1377) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1378) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1379) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1380) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1381) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1382) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1383) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1384) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1385) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1386) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1387) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1388) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1389) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1390) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1391) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1392) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1393) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1394) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1395) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1396) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1397) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1398) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1399) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1400) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1401) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1402) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1403) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1404) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1405) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1406) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1407) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1408) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1409) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1410) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1411) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1412) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1413) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1414) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1415) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1416) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1417) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1418) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1419) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1420) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1421) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1422) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1423) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1424) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1425) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1426) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1427) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1428) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1429) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1430) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1431) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1432) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1433) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1434) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1435) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1436) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1437) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1438) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1439) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1440) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1441) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1442) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1443) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1444) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1445) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1446) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1447) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1448) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1449) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1450) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1451) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1452) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1453) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1454) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1455) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1456) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1457) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1458) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1459) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1460) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1461) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1462) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1463) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1464) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1465) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1466) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1467) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1468) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1469) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1470) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1471) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1472) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1473) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1474) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1475) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1476) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1477) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1478) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1479) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1480) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1481) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1482) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1483) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1484) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1485) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1486) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1487) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1488) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1489) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1490) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1491) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1492) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1493) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1494) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1495) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1496) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1497) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1498) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1499) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1500) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1501) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1502) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1503) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1504) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1505) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1506) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1507) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1508) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1509) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1510) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1511) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1512) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1513) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1514) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1515) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1516) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1517) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1518) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1519) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1520) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1521) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1522) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1523) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1524) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1525) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1526) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1527) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1528) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1529) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1530) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1531) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1532) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1533) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1534) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1535) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1536) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1537) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1538) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1539) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1540) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1541) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1542) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1543) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1544) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1545) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1546) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1547) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1548) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1549) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1550) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1551) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1552) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1553) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1554) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1555) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1556) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1557) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1558) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1559) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1560) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1561) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1562) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1563) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1564) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1565) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1566) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1567) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1568) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1569) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1570) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1571) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1572) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1573) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1574) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1575) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1576) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1577) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1578) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1579) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1580) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1581) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1582) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1583) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1584) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1585) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1586) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1587) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1588) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1589) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1590) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1591) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1592) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1593) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1594) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1595) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1596) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1597) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1598) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1599) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1600) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1601) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1602) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1603) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1604) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1605) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1606) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1607) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1608) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1609) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1610) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1611) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1612) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1613) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1614) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1615) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1616) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1617) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1618) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1619) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1620) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1621) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1622) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1623) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1624) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1625) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1626) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1627) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1628) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1629) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1630) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1631) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1632) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1633) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1634) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1635) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1636) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1637) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1638) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1639) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1640) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1641) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1642) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1643) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1644) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1645) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1646) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1647) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1648) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1649) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1650) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1651) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1652) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1653) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1654) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1655) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1656) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1657) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1658) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1659) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1660) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1661) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1662) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1663) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1664) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1665) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1666) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1667) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1668) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1669) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1670) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1671) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1672) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1673) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1674) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1675) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1676) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1677) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1678) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1679) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1680) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1681) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1682) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1683) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1684) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1685) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1686) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1687) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1688) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1689) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1690) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1691) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1692) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1693) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1694) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1695) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1696) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1697) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1698) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1699) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1700) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1701) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1702) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1703) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1704) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1705) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1706) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1707) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1708) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1709) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1710) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1711) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1712) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1713) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1714) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1715) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1716) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1717) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1718) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1719) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1720) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1721) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1722) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1723) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1724) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1725) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1726) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1727) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1728) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1729) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1730) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1731) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1732) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1733) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1734) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1735) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1736) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1737) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1738) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1739) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1740) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1741) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1742) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1743) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1744) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1745) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1746) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1747) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1748) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1749) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1750) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1751) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1752) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1753) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1754) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1755) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1756) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1757) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1758) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1759) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1760) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1761) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1762) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1763) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1764) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1765) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1766) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1767) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1768) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1769) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1770) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1771) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1772) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1773) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1774) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1775) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1776) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1777) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1778) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1779) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1780) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1781) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1782) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1783) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1784) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1785) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1786) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1787) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1788) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1789) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1790) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1791) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1792) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1793) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1794) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1795) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1796) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1797) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1798) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1799) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1800) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1801) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1802) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1803) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1804) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1805) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1806) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1807) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1808) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1809) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1810) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1811) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1812) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1813) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1814) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1815) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1816) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1817) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1818) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1819) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1820) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1821) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1822) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1823) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1824) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1825) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1826) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1827) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1828) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1829) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1830) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1831) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1832) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1833) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1834) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1835) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1836) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1837) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1838) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1839) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1840) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1841) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1842) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1843) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1844) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1845) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1846) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1847) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1848) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1849) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1850) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1851) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1852) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1853) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1854) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1855) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1856) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1857) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1858) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1859) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1860) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1861) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1862) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1863) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1864) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1865) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1866) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1867) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1868) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1869) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1870) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1871) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1872) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1873) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1874) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1875) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1876) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1877) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1878) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1879) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1880) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1881) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1882) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1883) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1884) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1885) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1886) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1887) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1888) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1889) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1890) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1891) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1892) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1893) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1894) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1895) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1896) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1897) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1898) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1899) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1900) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1901) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1902) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1903) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1904) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1905) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1906) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1907) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1908) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1909) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1910) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1911) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1912) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1913) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1914) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1915) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1916) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1917) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1918) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1919) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1920) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1921) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1922) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1923) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1924) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1925) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1926) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1927) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1928) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1929) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1930) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1931) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1932) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1933) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1934) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1935) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1936) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1937) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1938) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1939) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1940) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1941) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1942) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1943) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1944) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1945) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1946) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1947) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1948) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1949) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1950) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1951) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1952) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1953) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1954) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1955) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1956) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1957) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1958) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1959) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1960) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1961) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1962) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1963) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1964) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1965) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1966) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1967) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1968) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1969) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1970) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1971) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1972) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1973) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1974) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1975) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1976) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1977) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1978) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1979) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1980) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1981) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1982) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1983) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1984) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1985) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1986) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1987) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1988) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1989) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1990) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1991) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1992) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1993) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1994) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1995) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1996) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1997) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1998) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(1999) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2000) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2001) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2002) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2003) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2004) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2005) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2006) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2007) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2008) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2009) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2010) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2011) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2012) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2013) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2014) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2015) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2016) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2017) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2018) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2019) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2020) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2021) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2022) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2023) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2024) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2025) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2026) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2027) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2028) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2029) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2030) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2031) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2032) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2033) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2034) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2035) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2036) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2037) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2038) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2039) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2040) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2041) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2042) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2043) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2044) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2045) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2046) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2047) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2048) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2049) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2050) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2051) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2052) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2053) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2054) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2055) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2056) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2057) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2058) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2059) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2060) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2061) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2062) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2063) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2064) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2065) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2066) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2067) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2068) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2069) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2070) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2071) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2072) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2073) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2074) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2075) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2076) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2077) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2078) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2079) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2080) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2081) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2082) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2083) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2084) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2085) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2086) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2087) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2088) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2089) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2090) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2091) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2092) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2093) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2094) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2095) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2096) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2097) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2098) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2099) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2100) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2101) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2102) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2103) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2104) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2105) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2106) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2107) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2108) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2109) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2110) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2111) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2112) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2113) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2114) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2115) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2116) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2117) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2118) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2119) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2120) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2121) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2122) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2123) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2124) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2125) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2126) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2127) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2128) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2129) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2130) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2131) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2132) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2133) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2134) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2135) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2136) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2137) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2138) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2139) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2140) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2141) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2142) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2143) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2144) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2145) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2146) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2147) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2148) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2149) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2150) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2151) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2152) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2153) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2154) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2155) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2156) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2157) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2158) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2159) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2160) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2161) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2162) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2163) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2164) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2165) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2166) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2167) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2168) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2169) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2170) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2171) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2172) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2173) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2174) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2175) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2176) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2177) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2178) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2179) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2180) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2181) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2182) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2183) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2184) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2185) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2186) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2187) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2188) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2189) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2190) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2191) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2192) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2193) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2194) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2195) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2196) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2197) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2198) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2199) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2200) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2201) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2202) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2203) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2204) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2205) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2206) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2207) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2208) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2209) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2210) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2211) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2212) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2213) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2214) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2215) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2216) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2217) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2218) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2219) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2220) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2221) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2222) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2223) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2224) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2225) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2226) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2227) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2228) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2229) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2230) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2231) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2232) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2233) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2234) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2235) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2236) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2237) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2238) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2239) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2240) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2241) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2242) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2243) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2244) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2245) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2246) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2247) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2248) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2249) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2250) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2251) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2252) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2253) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2254) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2255) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2256) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2257) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2258) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2259) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2260) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2261) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2262) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2263) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2264) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2265) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2266) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2267) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2268) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2269) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2270) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2271) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2272) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2273) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2274) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2275) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2276) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2277) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2278) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2279) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2280) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2281) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2282) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2283) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2284) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2285) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2286) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2287) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2288) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2289) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2290) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2291) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2292) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2293) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2294) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2295) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2296) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2297) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2298) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2299) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2300) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2301) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2302) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2303) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2304) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2305) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2306) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2307) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2308) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2309) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2310) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2311) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2312) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2313) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2314) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2315) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2316) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2317) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2318) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2319) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2320) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2321) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2322) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2323) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2324) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2325) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2326) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2327) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2328) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2329) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2330) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2331) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2332) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2333) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2334) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2335) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2336) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2337) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2338) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2339) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2340) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2341) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2342) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2343) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2344) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2345) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2346) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2347) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2348) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2349) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2350) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2351) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2352) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2353) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2354) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2355) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2356) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2357) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2358) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2359) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2360) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2361) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2362) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2363) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2364) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2365) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2366) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2367) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2368) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2369) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2370) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2371) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2372) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2373) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2374) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2375) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2376) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2377) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2378) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2379) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2380) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2381) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2382) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2383) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2384) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2385) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2386) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2387) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2388) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2389) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2390) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2391) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2392) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2393) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2394) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2395) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2396) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2397) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2398) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2399) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2400) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2401) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2402) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2403) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2404) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2405) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2406) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2407) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2408) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2409) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2410) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2411) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2412) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2413) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2414) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2415) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2416) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2417) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2418) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2419) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2420) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2421) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2422) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2423) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2424) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2425) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2426) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2427) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2428) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2429) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2430) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2431) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2432) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2433) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2434) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2435) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2436) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2437) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2438) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2439) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2440) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2441) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2442) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2443) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2444) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2445) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2446) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2447) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2448) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2449) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2450) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2451) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2452) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2453) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2454) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2455) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2456) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2457) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2458) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2459) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2460) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2461) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2462) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2463) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2464) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2465) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2466) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2467) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2468) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2469) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2470) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2471) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2472) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2473) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2474) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2475) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2476) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2477) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2478) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2479) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2480) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2481) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2482) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2483) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2484) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2485) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2486) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2487) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2488) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2489) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2490) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2491) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2492) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2493) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2494) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2495) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2496) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2497) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2498) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2499) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2500) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2501) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2502) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2503) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2504) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2505) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2506) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2507) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2508) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2509) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2510) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2511) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2512) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2513) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2514) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2515) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2516) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2517) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2518) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2519) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2520) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2521) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2522) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2523) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2524) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2525) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2526) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2527) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2528) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2529) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2530) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2531) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2532) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2533) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2534) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2535) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2536) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2537) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2538) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2539) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2540) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2541) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2542) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2543) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2544) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2545) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2546) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2547) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2548) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2549) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2550) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2551) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2552) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2553) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2554) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2555) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2556) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2557) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2558) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2559) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2560) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2561) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2562) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2563) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2564) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2565) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2566) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2567) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2568) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2569) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2570) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2571) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2572) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2573) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2574) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2575) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2576) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2577) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2578) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2579) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2580) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2581) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2582) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2583) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2584) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2585) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2586) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2587) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2588) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2589) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2590) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2591) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2592) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2593) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2594) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2595) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2596) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2597) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2598) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2599) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2600) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2601) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2602) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2603) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2604) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2605) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2606) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2607) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2608) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2609) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2610) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2611) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2612) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2613) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2614) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2615) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2616) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2617) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2618) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2619) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2620) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2621) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2622) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2623) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2624) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2625) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2626) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2627) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2628) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2629) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2630) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2631) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2632) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2633) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2634) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2635) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2636) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2637) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2638) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2639) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2640) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2641) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2642) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2643) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2644) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2645) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2646) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2647) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2648) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2649) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2650) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2651) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2652) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2653) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2654) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2655) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2656) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2657) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2658) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2659) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2660) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2661) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2662) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2663) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2664) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2665) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2666) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2667) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2668) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2669) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2670) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2671) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2672) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2673) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2674) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2675) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2676) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2677) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2678) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2679) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2680) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2681) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2682) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2683) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2684) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2685) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2686) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2687) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2688) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2689) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2690) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2691) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2692) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2693) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2694) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2695) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2696) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2697) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2698) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2699) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2700) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2701) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2702) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2703) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2704) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2705) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2706) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2707) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2708) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2709) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2710) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2711) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2712) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2713) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2714) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2715) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2716) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2717) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2718) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2719) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2720) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2721) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2722) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2723) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2724) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2725) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2726) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2727) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2728) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2729) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2730) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2731) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2732) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2733) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2734) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2735) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2736) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2737) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2738) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2739) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2740) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2741) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2742) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2743) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2744) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2745) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2746) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2747) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2748) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2749) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2750) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2751) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2752) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2753) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2754) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2755) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2756) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2757) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2758) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2759) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2760) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2761) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2762) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2763) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2764) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2765) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2766) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2767) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2768) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2769) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2770) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2771) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2772) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2773) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2774) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2775) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2776) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2777) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2778) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2779) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2780) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2781) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2782) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2783) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2784) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2785) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2786) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2787) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2788) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2789) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2790) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2791) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2792) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2793) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2794) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2795) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2796) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2797) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2798) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2799) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2800) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2801) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2802) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2803) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2804) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2805) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2806) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2807) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2808) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2809) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2810) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2811) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2812) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2813) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2814) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2815) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2816) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2817) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2818) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2819) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2820) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2821) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2822) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2823) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2824) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2825) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2826) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2827) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2828) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2829) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2830) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2831) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2832) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2833) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2834) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2835) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2836) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2837) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2838) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2839) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2840) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2841) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2842) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2843) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2844) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2845) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2846) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2847) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2848) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2849) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2850) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2851) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2852) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2853) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2854) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2855) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2856) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2857) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2858) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2859) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2860) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2861) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2862) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2863) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2864) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2865) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2866) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2867) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2868) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2869) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2870) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2871) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2872) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2873) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2874) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2875) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2876) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2877) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2878) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2879) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2880) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2881) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2882) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2883) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2884) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2885) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2886) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2887) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2888) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2889) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2890) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2891) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2892) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2893) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2894) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2895) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2896) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2897) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2898) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2899) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2900) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2901) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2902) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2903) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2904) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2905) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2906) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2907) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2908) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2909) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2910) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2911) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2912) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2913) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2914) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2915) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2916) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2917) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2918) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2919) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2920) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2921) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2922) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2923) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2924) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2925) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2926) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2927) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2928) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2929) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2930) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2931) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2932) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2933) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2934) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2935) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2936) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2937) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2938) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2939) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2940) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2941) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2942) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2943) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2944) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2945) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2946) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2947) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2948) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2949) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2950) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2951) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2952) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2953) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2954) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2955) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2956) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2957) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2958) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2959) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2960) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2961) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2962) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2963) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2964) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2965) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2966) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2967) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2968) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2969) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2970) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2971) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2972) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2973) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2974) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2975) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2976) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2977) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2978) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2979) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2980) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2981) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2982) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2983) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2984) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2985) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2986) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2987) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2988) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2989) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2990) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2991) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2992) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2993) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2994) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2995) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2996) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2997) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2998) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(2999) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3000) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3001) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3002) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3003) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3004) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3005) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3006) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3007) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3008) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3009) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3010) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3011) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3012) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3013) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3014) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3015) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3016) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3017) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3018) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3019) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3020) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3021) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3022) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3023) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3024) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3025) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3026) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3027) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3028) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3029) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3030) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3031) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3032) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3033) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3034) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3035) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3036) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3037) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3038) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3039) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3040) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3041) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3042) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3043) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3044) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3045) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3046) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3047) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3048) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3049) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3050) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3051) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3052) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3053) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3054) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3055) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3056) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3057) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3058) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3059) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3060) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3061) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3062) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3063) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3064) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3065) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3066) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3067) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3068) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3069) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3070) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3071) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3072) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3073) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3074) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3075) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3076) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3077) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3078) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3079) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3080) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3081) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3082) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3083) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3084) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3085) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3086) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3087) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3088) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3089) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3090) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3091) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3092) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3093) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3094) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3095) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3096) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3097) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3098) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3099) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3100) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3101) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3102) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3103) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3104) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3105) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3106) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3107) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3108) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3109) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3110) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3111) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3112) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3113) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3114) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3115) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3116) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3117) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3118) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3119) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3120) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3121) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3122) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3123) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3124) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3125) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3126) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3127) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3128) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3129) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3130) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3131) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3132) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3133) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3134) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3135) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3136) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3137) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3138) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3139) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3140) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3141) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3142) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3143) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3144) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3145) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3146) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3147) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3148) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3149) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3150) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3151) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3152) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3153) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3154) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3155) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3156) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3157) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3158) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3159) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3160) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3161) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3162) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3163) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3164) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3165) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3166) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3167) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3168) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3169) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3170) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3171) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3172) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3173) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3174) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3175) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3176) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3177) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3178) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3179) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3180) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3181) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3182) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3183) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3184) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3185) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3186) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3187) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3188) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3189) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3190) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3191) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3192) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3193) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3194) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3195) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3196) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3197) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3198) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3199) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3200) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3201) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3202) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3203) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3204) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3205) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3206) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3207) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3208) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3209) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3210) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3211) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3212) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3213) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3214) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3215) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3216) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3217) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3218) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3219) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3220) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3221) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3222) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3223) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3224) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3225) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3226) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3227) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3228) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3229) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3230) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3231) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3232) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3233) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3234) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3235) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3236) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3237) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3238) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3239) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3240) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3241) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3242) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3243) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3244) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3245) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3246) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3247) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3248) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3249) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3250) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3251) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3252) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3253) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3254) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3255) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3256) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3257) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3258) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3259) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3260) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3261) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3262) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3263) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3264) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3265) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3266) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3267) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3268) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3269) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3270) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3271) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3272) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3273) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3274) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3275) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3276) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3277) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3278) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3279) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3280) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3281) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3282) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3283) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3284) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3285) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3286) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3287) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3288) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3289) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3290) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3291) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3292) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3293) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3294) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3295) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3296) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3297) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3298) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3299) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3300) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3301) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3302) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3303) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3304) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3305) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3306) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3307) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3308) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3309) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3310) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3311) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3312) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3313) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3314) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3315) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3316) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3317) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3318) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3319) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3320) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3321) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3322) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3323) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3324) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3325) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3326) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3327) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3328) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3329) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3330) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3331) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3332) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3333) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3334) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3335) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3336) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3337) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3338) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3339) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3340) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3341) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3342) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3343) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3344) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3345) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3346) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3347) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3348) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3349) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3350) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3351) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3352) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3353) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3354) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3355) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3356) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3357) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3358) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3359) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3360) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3361) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3362) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3363) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3364) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3365) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3366) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3367) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3368) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3369) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3370) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3371) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3372) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3373) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3374) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3375) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3376) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3377) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3378) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3379) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3380) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3381) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3382) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3383) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3384) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3385) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3386) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3387) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3388) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3389) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3390) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3391) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3392) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3393) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3394) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3395) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3396) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3397) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3398) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3399) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3400) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3401) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3402) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3403) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3404) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3405) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3406) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3407) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3408) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3409) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3410) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3411) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3412) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3413) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3414) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3415) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3416) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3417) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3418) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3419) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3420) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3421) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3422) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3423) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3424) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3425) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3426) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3427) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3428) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3429) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3430) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3431) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3432) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3433) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3434) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3435) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3436) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3437) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3438) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3439) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3440) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3441) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3442) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3443) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3444) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3445) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3446) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3447) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3448) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3449) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3450) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3451) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3452) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3453) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3454) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3455) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3456) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3457) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3458) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3459) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3460) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3461) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3462) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3463) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3464) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3465) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3466) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3467) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3468) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3469) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3470) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3471) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3472) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3473) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3474) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3475) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3476) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3477) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3478) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3479) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3480) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3481) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3482) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3483) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3484) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3485) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3486) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3487) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3488) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3489) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3490) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3491) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3492) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3493) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3494) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3495) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3496) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3497) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3498) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3499) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3500) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3501) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3502) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3503) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3504) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3505) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3506) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3507) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3508) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3509) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3510) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3511) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3512) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3513) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3514) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3515) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3516) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3517) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3518) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3519) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3520) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3521) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3522) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3523) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3524) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3525) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3526) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3527) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3528) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3529) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3530) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3531) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3532) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3533) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3534) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3535) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3536) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3537) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3538) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3539) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3540) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3541) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3542) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3543) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3544) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3545) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3546) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3547) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3548) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3549) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3550) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3551) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3552) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3553) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3554) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3555) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3556) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3557) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3558) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3559) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3560) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3561) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3562) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3563) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3564) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3565) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3566) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3567) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3568) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3569) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3570) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3571) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3572) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3573) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3574) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3575) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3576) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3577) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3578) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3579) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3580) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3581) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3582) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3583) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3584) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3585) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3586) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3587) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3588) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3589) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3590) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3591) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3592) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3593) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3594) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3595) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3596) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3597) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3598) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3599) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3600) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3601) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3602) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3603) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3604) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3605) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3606) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3607) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3608) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3609) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3610) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3611) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3612) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3613) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3614) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3615) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3616) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3617) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3618) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3619) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3620) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3621) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3622) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3623) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3624) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3625) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3626) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3627) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3628) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3629) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3630) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3631) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3632) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3633) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3634) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3635) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3636) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3637) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3638) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3639) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3640) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3641) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3642) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3643) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3644) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3645) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3646) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3647) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3648) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3649) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3650) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3651) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3652) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3653) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3654) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3655) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3656) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3657) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3658) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3659) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3660) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3661) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3662) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3663) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3664) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3665) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3666) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3667) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3668) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3669) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3670) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3671) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3672) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3673) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3674) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3675) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3676) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3677) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3678) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3679) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3680) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3681) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3682) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3683) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3684) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3685) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3686) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3687) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3688) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3689) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3690) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3691) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3692) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3693) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3694) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3695) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3696) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3697) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3698) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3699) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3700) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3701) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3702) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3703) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3704) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3705) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3706) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3707) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3708) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3709) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3710) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3711) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3712) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3713) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3714) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3715) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3716) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3717) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3718) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3719) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3720) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3721) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3722) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3723) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3724) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3725) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3726) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3727) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3728) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3729) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3730) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3731) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3732) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3733) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3734) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3735) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3736) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3737) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3738) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3739) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3740) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3741) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3742) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3743) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3744) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3745) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3746) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3747) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3748) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3749) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3750) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3751) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3752) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3753) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3754) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3755) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3756) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3757) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3758) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3759) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3760) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3761) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3762) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3763) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3764) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3765) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3766) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3767) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3768) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3769) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3770) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3771) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3772) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3773) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3774) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3775) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3776) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3777) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3778) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3779) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3780) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3781) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3782) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3783) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3784) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3785) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3786) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3787) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3788) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3789) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3790) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3791) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3792) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3793) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3794) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3795) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3796) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3797) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3798) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3799) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3800) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3801) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3802) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3803) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3804) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3805) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3806) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3807) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3808) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3809) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3810) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3811) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3812) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3813) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3814) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3815) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3816) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3817) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3818) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3819) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3820) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3821) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3822) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3823) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3824) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3825) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3826) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3827) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3828) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3829) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3830) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3831) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3832) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3833) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3834) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3835) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3836) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3837) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3838) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3839) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3840) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3841) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3842) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3843) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3844) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3845) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3846) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3847) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3848) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3849) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3850) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3851) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3852) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3853) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3854) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3855) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3856) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3857) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3858) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3859) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3860) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3861) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3862) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3863) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3864) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3865) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3866) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3867) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3868) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3869) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3870) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3871) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3872) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3873) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3874) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3875) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3876) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3877) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3878) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3879) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3880) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3881) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3882) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3883) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3884) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3885) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3886) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3887) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3888) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3889) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3890) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3891) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3892) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3893) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3894) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3895) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3896) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3897) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3898) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3899) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3900) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3901) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3902) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3903) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3904) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3905) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3906) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3907) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3908) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3909) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3910) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3911) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3912) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3913) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3914) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3915) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3916) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3917) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3918) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3919) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3920) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3921) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3922) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3923) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3924) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3925) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3926) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3927) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3928) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3929) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3930) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3931) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3932) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3933) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3934) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3935) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3936) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3937) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3938) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3939) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3940) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3941) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3942) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3943) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3944) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3945) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3946) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3947) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3948) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3949) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3950) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3951) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3952) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3953) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3954) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3955) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3956) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3957) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3958) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3959) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3960) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3961) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3962) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3963) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3964) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3965) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3966) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3967) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3968) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3969) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3970) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3971) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3972) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3973) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3974) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3975) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3976) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3977) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3978) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3979) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3980) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3981) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3982) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3983) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3984) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3985) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3986) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3987) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3988) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3989) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3990) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3991) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3992) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3993) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3994) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3995) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3996) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3997) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3998) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(3999) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4000) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4001) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4002) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4003) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4004) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4005) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4006) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4007) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4008) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4009) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4010) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4011) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4012) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4013) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4014) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4015) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4016) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4017) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4018) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4019) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4020) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4021) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4022) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4023) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4024) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4025) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4026) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4027) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4028) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4029) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4030) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4031) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4032) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4033) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4034) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4035) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4036) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4037) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4038) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4039) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4040) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4041) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4042) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4043) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4044) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4045) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4046) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4047) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4048) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4049) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4050) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4051) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4052) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4053) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4054) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4055) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4056) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4057) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4058) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4059) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4060) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4061) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4062) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4063) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4064) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4065) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4066) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4067) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4068) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4069) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4070) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4071) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4072) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4073) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4074) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4075) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4076) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4077) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4078) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4079) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4080) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4081) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4082) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4083) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4084) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4085) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4086) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4087) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4088) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4089) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4090) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4091) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4092) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4093) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4094) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4095) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4096) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4097) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4098) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4099) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4100) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4101) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4102) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4103) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4104) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4105) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4106) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4107) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4108) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4109) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4110) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4111) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4112) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4113) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4114) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4115) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4116) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4117) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4118) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4119) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4120) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4121) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4122) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4123) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4124) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4125) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4126) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4127) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4128) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4129) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4130) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4131) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4132) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4133) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4134) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4135) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4136) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4137) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4138) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4139) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(4140) ->
    [{10001, 54000}, {1, 421200000}, {22, 216000000}];
get_cystal_lev_expend(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidresonate_data1643, _,
       {__Levelresonate_data1643, __Tracesresonate_data1643}}
	  when __Levelresonate_data1643 band 8 /= 0 orelse
		 __Tracesresonate_data1643 /= [] ->
	  lager:do_log(error,
		       [{module, resonate_data},
			{function, get_cystal_lev_expend}, {line, 1643},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_cystal_lev_expend_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelresonate_data1643,
		       __Tracesresonate_data1643, lager_event,
		       __Pidresonate_data1643);
      _ -> ok
    end,
    undefined.


