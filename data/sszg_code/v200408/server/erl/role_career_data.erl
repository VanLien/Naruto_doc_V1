-file("src/mod/data/role_career_data.erl", 1).

-module(role_career_data).

-lager_records([{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]}]).

-export([get_exp/1, get_exp_total/1, lev_energy/1,
	 vip_lev_energy/1, get_const/1, get_career_list/0,
	 get_career/1, get_career_sex/1, get_lev_award/1,
	 get_city_ids/0, get_city_info/1]).

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

-file("src/mod/data/role_career_data.erl", 20).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("src/mod/data/role_career_data.erl", 21).

get_exp(1) -> 120;
get_exp(2) -> 360;
get_exp(3) -> 720;
get_exp(4) -> 1200;
get_exp(5) -> 1800;
get_exp(6) -> 3020;
get_exp(7) -> 3360;
get_exp(8) -> 4320;
get_exp(9) -> 5400;
get_exp(10) -> 7200;
get_exp(11) -> 9240;
get_exp(12) -> 11520;
get_exp(13) -> 14040;
get_exp(14) -> 16800;
get_exp(15) -> 19800;
get_exp(16) -> 23040;
get_exp(17) -> 26520;
get_exp(18) -> 30240;
get_exp(19) -> 34200;
get_exp(20) -> 39600;
get_exp(21) -> 45360;
get_exp(22) -> 51480;
get_exp(23) -> 57960;
get_exp(24) -> 64800;
get_exp(25) -> 72000;
get_exp(26) -> 79560;
get_exp(27) -> 87480;
get_exp(28) -> 95760;
get_exp(29) -> 104400;
get_exp(30) -> 115200;
get_exp(31) -> 126480;
get_exp(32) -> 138240;
get_exp(33) -> 150480;
get_exp(34) -> 163200;
get_exp(35) -> 176400;
get_exp(36) -> 190080;
get_exp(37) -> 204240;
get_exp(38) -> 218880;
get_exp(39) -> 234000;
get_exp(40) -> 302000;
get_exp(41) -> 270600;
get_exp(42) -> 289800;
get_exp(43) -> 309600;
get_exp(44) -> 330000;
get_exp(45) -> 351000;
get_exp(46) -> 372600;
get_exp(47) -> 394800;
get_exp(48) -> 417600;
get_exp(49) -> 441000;
get_exp(50) -> 468000;
get_exp(51) -> 495720;
get_exp(52) -> 524160;
get_exp(53) -> 553320;
get_exp(54) -> 583200;
get_exp(55) -> 613800;
get_exp(56) -> 645120;
get_exp(57) -> 677160;
get_exp(58) -> 709920;
get_exp(59) -> 743400;
get_exp(60) -> 781200;
get_exp(61) -> 819840;
get_exp(62) -> 859320;
get_exp(63) -> 899640;
get_exp(64) -> 940800;
get_exp(65) -> 982800;
get_exp(66) -> 1030640;
get_exp(67) -> 1069320;
get_exp(68) -> 1113840;
get_exp(69) -> 1159200;
get_exp(70) -> 1209600;
get_exp(71) -> 1260960;
get_exp(72) -> 1313280;
get_exp(73) -> 1366560;
get_exp(74) -> 1420800;
get_exp(75) -> 1476000;
get_exp(76) -> 1532160;
get_exp(77) -> 1589280;
get_exp(78) -> 1647360;
get_exp(79) -> 1706400;
get_exp(80) -> 1771200;
get_exp(81) -> 1837080;
get_exp(82) -> 1904040;
get_exp(83) -> 1972080;
get_exp(84) -> 2041200;
get_exp(85) -> 2111400;
get_exp(86) -> 2182680;
get_exp(87) -> 2305040;
get_exp(88) -> 2328480;
get_exp(89) -> 2403000;
get_exp(90) -> 2484000;
get_exp(91) -> 3066200;
get_exp(92) -> 2649600;
get_exp(93) -> 2734200;
get_exp(94) -> 2820000;
get_exp(95) -> 2907000;
get_exp(96) -> 2995200;
get_exp(97) -> 3084600;
get_exp(98) -> 3175200;
get_exp(99) -> 3267000;
get_exp(100) -> 3366000;
get_exp(101) -> 3466320;
get_exp(102) -> 3567960;
get_exp(103) -> 3670920;
get_exp(104) -> 3775200;
get_exp(105) -> 3880800;
get_exp(106) -> 3987720;
get_exp(107) -> 4095960;
get_exp(108) -> 4205520;
get_exp(109) -> 4316400;
get_exp(110) -> 4435200;
get_exp(111) -> 4555440;
get_exp(112) -> 4677120;
get_exp(113) -> 4800240;
get_exp(114) -> 4924800;
get_exp(115) -> 5050800;
get_exp(116) -> 5178240;
get_exp(117) -> 5307120;
get_exp(118) -> 5437440;
get_exp(119) -> 5569200;
get_exp(120) -> 5709600;
get_exp(121) -> 5851560;
get_exp(122) -> 5995080;
get_exp(123) -> 6140160;
get_exp(124) -> 6286800;
get_exp(125) -> 6435000;
get_exp(126) -> 6584760;
get_exp(127) -> 6736080;
get_exp(128) -> 6888960;
get_exp(129) -> 7043400;
get_exp(130) -> 7207200;
get_exp(131) -> 7372680;
get_exp(132) -> 7539840;
get_exp(133) -> 7708680;
get_exp(134) -> 7879200;
get_exp(135) -> 8051400;
get_exp(136) -> 8230280;
get_exp(137) -> 8400840;
get_exp(138) -> 8578080;
get_exp(139) -> 8757000;
get_exp(140) -> 8946000;
get_exp(141) -> 9136800;
get_exp(142) -> 9329400;
get_exp(143) -> 9523800;
get_exp(144) -> 9720000;
get_exp(145) -> 9918000;
get_exp(146) -> 10117800;
get_exp(147) -> 10319400;
get_exp(148) -> 10522800;
get_exp(149) -> 10728000;
get_exp(150) -> 10944000;
get_exp(151) -> 11161920;
get_exp(152) -> 11381760;
get_exp(153) -> 11603520;
get_exp(154) -> 11827200;
get_exp(155) -> 12052800;
get_exp(156) -> 12280320;
get_exp(157) -> 13009760;
get_exp(158) -> 12741120;
get_exp(159) -> 12974400;
get_exp(160) -> 13219200;
get_exp(161) -> 13466040;
get_exp(162) -> 13714920;
get_exp(163) -> 13965840;
get_exp(164) -> 14218800;
get_exp(165) -> 14473800;
get_exp(166) -> 14730840;
get_exp(167) -> 14989920;
get_exp(168) -> 15301040;
get_exp(169) -> 15514200;
get_exp(170) -> 15789600;
get_exp(171) -> 16067160;
get_exp(172) -> 16346880;
get_exp(173) -> 16628760;
get_exp(174) -> 16912800;
get_exp(175) -> 17199000;
get_exp(176) -> 17487360;
get_exp(177) -> 17777880;
get_exp(178) -> 18070560;
get_exp(179) -> 18365400;
get_exp(180) -> 18673200;
get_exp(181) -> 18983280;
get_exp(182) -> 19295640;
get_exp(183) -> 19610280;
get_exp(184) -> 19927200;
get_exp(185) -> 20246400;
get_exp(186) -> 20567880;
get_exp(187) -> 20891640;
get_exp(188) -> 21217680;
get_exp(189) -> 21546000;
get_exp(190) -> 21888000;
get_exp(191) -> 22232400;
get_exp(192) -> 23079200;
get_exp(193) -> 22928400;
get_exp(194) -> 23280000;
get_exp(195) -> 23634000;
get_exp(196) -> 23990400;
get_exp(197) -> 24349200;
get_exp(198) -> 24710400;
get_exp(199) -> 30074000;
get_exp(200) -> 30452000;
get_exp(201) -> 30852000;
get_exp(202) -> 31252000;
get_exp(203) -> 31452000;
get_exp(204) -> 31852000;
get_exp(205) -> 32252000;
get_exp(206) -> 32852000;
get_exp(207) -> 33252000;
get_exp(208) -> 33852000;
get_exp(209) -> 34252000;
get_exp(210) -> 34852000;
get_exp(211) -> 35252000;
get_exp(212) -> 35852000;
get_exp(213) -> 36252000;
get_exp(214) -> 36852000;
get_exp(215) -> 37252000;
get_exp(216) -> 37852000;
get_exp(217) -> 38252000;
get_exp(218) -> 38852000;
get_exp(219) -> 39252000;
get_exp(220) -> 39852000;
get_exp(221) -> 40252000;
get_exp(222) -> 40852000;
get_exp(223) -> 41252000;
get_exp(224) -> 41852000;
get_exp(225) -> 42252000;
get_exp(226) -> 42852000;
get_exp(227) -> 43323428;
get_exp(228) -> 43828190;
get_exp(229) -> 44332952;
get_exp(230) -> 44837714;
get_exp(231) -> 45342476;
get_exp(232) -> 45847238;
get_exp(233) -> 46352000;
get_exp(234) -> 46856761;
get_exp(235) -> 47361523;
get_exp(236) -> 47866285;
get_exp(237) -> 48371047;
get_exp(238) -> 48875809;
get_exp(239) -> 49380571;
get_exp(240) -> 49885333;
get_exp(241) -> 50390095;
get_exp(242) -> 50894857;
get_exp(243) -> 51399619;
get_exp(244) -> 51904380;
get_exp(245) -> 52409142;
get_exp(246) -> 52913904;
get_exp(247) -> 53418666;
get_exp(248) -> 53923428;
get_exp(249) -> 54428190;
get_exp(250) -> 54932952;
get_exp(251) -> 55437714;
get_exp(252) -> 55942476;
get_exp(253) -> 56447238;
get_exp(254) -> 56952000;
get_exp(255) -> 57456761;
get_exp(256) -> 57961523;
get_exp(257) -> 58466285;
get_exp(258) -> 58971047;
get_exp(259) -> 59475809;
get_exp(260) -> 59980571;
get_exp(261) -> 60485333;
get_exp(262) -> 60990095;
get_exp(263) -> 61494857;
get_exp(264) -> 61999619;
get_exp(265) -> 62504380;
get_exp(266) -> 63009142;
get_exp(267) -> 63513904;
get_exp(268) -> 64018666;
get_exp(269) -> 64523428;
get_exp(270) -> 65028190;
get_exp(271) -> 65532952;
get_exp(272) -> 66037714;
get_exp(273) -> 66542476;
get_exp(274) -> 67047238;
get_exp(275) -> 67552000;
get_exp(276) -> 68056761;
get_exp(277) -> 68561523;
get_exp(278) -> 69066285;
get_exp(279) -> 69571047;
get_exp(280) -> 70075809;
get_exp(281) -> 70580571;
get_exp(282) -> 71085333;
get_exp(283) -> 71590095;
get_exp(284) -> 72094857;
get_exp(285) -> 72599619;
get_exp(286) -> 73104380;
get_exp(287) -> 73609142;
get_exp(288) -> 74113904;
get_exp(289) -> 74618666;
get_exp(290) -> 75123428;
get_exp(291) -> 75628190;
get_exp(292) -> 76132952;
get_exp(293) -> 76637714;
get_exp(294) -> 77142476;
get_exp(295) -> 77647238;
get_exp(296) -> 78152000;
get_exp(297) -> 78656761;
get_exp(298) -> 79161523;
get_exp(299) -> 79666285;
get_exp(300) -> 80171047;
get_exp(_) -> 0.

get_exp_total(1) -> 120;
get_exp_total(2) -> 480;
get_exp_total(3) -> 1200;
get_exp_total(4) -> 2400;
get_exp_total(5) -> 4200;
get_exp_total(6) -> 7220;
get_exp_total(7) -> 10580;
get_exp_total(8) -> 14900;
get_exp_total(9) -> 20300;
get_exp_total(10) -> 27500;
get_exp_total(11) -> 36740;
get_exp_total(12) -> 48260;
get_exp_total(13) -> 62300;
get_exp_total(14) -> 79100;
get_exp_total(15) -> 98900;
get_exp_total(16) -> 121940;
get_exp_total(17) -> 148460;
get_exp_total(18) -> 178700;
get_exp_total(19) -> 212900;
get_exp_total(20) -> 252500;
get_exp_total(21) -> 297860;
get_exp_total(22) -> 349340;
get_exp_total(23) -> 407300;
get_exp_total(24) -> 911300;
get_exp_total(25) -> 544100;
get_exp_total(26) -> 623660;
get_exp_total(27) -> 711140;
get_exp_total(28) -> 806900;
get_exp_total(29) -> 911300;
get_exp_total(30) -> 1026500;
get_exp_total(31) -> 1152980;
get_exp_total(32) -> 1291220;
get_exp_total(33) -> 1441700;
get_exp_total(34) -> 1604900;
get_exp_total(35) -> 1781300;
get_exp_total(36) -> 1971380;
get_exp_total(37) -> 2175620;
get_exp_total(38) -> 2394500;
get_exp_total(39) -> 2628500;
get_exp_total(40) -> 2930500;
get_exp_total(41) -> 3201100;
get_exp_total(42) -> 3490900;
get_exp_total(43) -> 3800500;
get_exp_total(44) -> 4130500;
get_exp_total(45) -> 4481500;
get_exp_total(46) -> 4854100;
get_exp_total(47) -> 5248900;
get_exp_total(48) -> 5666500;
get_exp_total(49) -> 6107500;
get_exp_total(50) -> 6575500;
get_exp_total(51) -> 7071220;
get_exp_total(52) -> 7595380;
get_exp_total(53) -> 8148700;
get_exp_total(54) -> 8731900;
get_exp_total(55) -> 9345700;
get_exp_total(56) -> 9990820;
get_exp_total(57) -> 10667980;
get_exp_total(58) -> 11377900;
get_exp_total(59) -> 12121300;
get_exp_total(60) -> 12902500;
get_exp_total(61) -> 13722340;
get_exp_total(62) -> 14581660;
get_exp_total(63) -> 15481300;
get_exp_total(64) -> 16422100;
get_exp_total(65) -> 17404900;
get_exp_total(66) -> 18435540;
get_exp_total(67) -> 19504860;
get_exp_total(68) -> 20618700;
get_exp_total(69) -> 21777900;
get_exp_total(70) -> 22987500;
get_exp_total(71) -> 24248460;
get_exp_total(72) -> 25561740;
get_exp_total(73) -> 26928300;
get_exp_total(74) -> 28349100;
get_exp_total(75) -> 29825100;
get_exp_total(76) -> 31357260;
get_exp_total(77) -> 32946540;
get_exp_total(78) -> 34593900;
get_exp_total(79) -> 36300300;
get_exp_total(80) -> 38071500;
get_exp_total(81) -> 39908580;
get_exp_total(82) -> 41812620;
get_exp_total(83) -> 43784700;
get_exp_total(84) -> 45825900;
get_exp_total(85) -> 47937300;
get_exp_total(86) -> 50119980;
get_exp_total(87) -> 52425020;
get_exp_total(88) -> 54753500;
get_exp_total(89) -> 57156500;
get_exp_total(90) -> 59640500;
get_exp_total(91) -> 62706700;
get_exp_total(92) -> 65356300;
get_exp_total(93) -> 68090500;
get_exp_total(94) -> 70910500;
get_exp_total(95) -> 73817500;
get_exp_total(96) -> 76812700;
get_exp_total(97) -> 79897300;
get_exp_total(98) -> 83072500;
get_exp_total(99) -> 86339500;
get_exp_total(100) -> 89705500;
get_exp_total(101) -> 93171820;
get_exp_total(102) -> 96739780;
get_exp_total(103) -> 100410700;
get_exp_total(104) -> 104185900;
get_exp_total(105) -> 108066700;
get_exp_total(106) -> 112054420;
get_exp_total(107) -> 116150380;
get_exp_total(108) -> 120355900;
get_exp_total(109) -> 124672300;
get_exp_total(110) -> 129107500;
get_exp_total(111) -> 133662940;
get_exp_total(112) -> 138340060;
get_exp_total(113) -> 143140300;
get_exp_total(114) -> 148065100;
get_exp_total(115) -> 153115900;
get_exp_total(116) -> 158294140;
get_exp_total(117) -> 163601260;
get_exp_total(118) -> 169038700;
get_exp_total(119) -> 174607900;
get_exp_total(120) -> 180317500;
get_exp_total(121) -> 186169060;
get_exp_total(122) -> 192164140;
get_exp_total(123) -> 198304300;
get_exp_total(124) -> 238279300;
get_exp_total(125) -> 211026100;
get_exp_total(126) -> 217610860;
get_exp_total(127) -> 224346940;
get_exp_total(128) -> 231235900;
get_exp_total(129) -> 238279300;
get_exp_total(130) -> 245486500;
get_exp_total(131) -> 252859180;
get_exp_total(132) -> 260399020;
get_exp_total(133) -> 268107700;
get_exp_total(134) -> 275986900;
get_exp_total(135) -> 284038300;
get_exp_total(136) -> 292268580;
get_exp_total(137) -> 300669420;
get_exp_total(138) -> 309247500;
get_exp_total(139) -> 318004500;
get_exp_total(140) -> 326950500;
get_exp_total(141) -> 336087300;
get_exp_total(142) -> 345416700;
get_exp_total(143) -> 354940500;
get_exp_total(144) -> 364660500;
get_exp_total(145) -> 374578500;
get_exp_total(146) -> 384696300;
get_exp_total(147) -> 395015700;
get_exp_total(148) -> 405538500;
get_exp_total(149) -> 416266500;
get_exp_total(150) -> 427210500;
get_exp_total(151) -> 438372420;
get_exp_total(152) -> 449754180;
get_exp_total(153) -> 461357700;
get_exp_total(154) -> 473184900;
get_exp_total(155) -> 485237700;
get_exp_total(156) -> 497518020;
get_exp_total(157) -> 510527780;
get_exp_total(158) -> 523268900;
get_exp_total(159) -> 536243300;
get_exp_total(160) -> 549462500;
get_exp_total(161) -> 562928540;
get_exp_total(162) -> 576643460;
get_exp_total(163) -> 590609300;
get_exp_total(164) -> 604828100;
get_exp_total(165) -> 619301900;
get_exp_total(166) -> 634032740;
get_exp_total(167) -> 649022660;
get_exp_total(168) -> 664323700;
get_exp_total(169) -> 679837900;
get_exp_total(170) -> 695627500;
get_exp_total(171) -> 711694660;
get_exp_total(172) -> 728041540;
get_exp_total(173) -> 744670300;
get_exp_total(174) -> 761583100;
get_exp_total(175) -> 778782100;
get_exp_total(176) -> 796269460;
get_exp_total(177) -> 814047340;
get_exp_total(178) -> 832117900;
get_exp_total(179) -> 850483300;
get_exp_total(180) -> 869156500;
get_exp_total(181) -> 888139780;
get_exp_total(182) -> 907435420;
get_exp_total(183) -> 927045700;
get_exp_total(184) -> 946972900;
get_exp_total(185) -> 967219300;
get_exp_total(186) -> 987787180;
get_exp_total(187) -> 1008678820;
get_exp_total(188) -> 1029896500;
get_exp_total(189) -> 1051442500;
get_exp_total(190) -> 1073330500;
get_exp_total(191) -> 1095562900;
get_exp_total(192) -> 1118642100;
get_exp_total(193) -> 1141570500;
get_exp_total(194) -> 1164850500;
get_exp_total(195) -> 1188484500;
get_exp_total(196) -> 1212474900;
get_exp_total(197) -> 1236824100;
get_exp_total(198) -> 1261534500;
get_exp_total(199) -> 1291608500;
get_exp_total(200) -> 1322060500;
get_exp_total(201) -> 1352912500;
get_exp_total(202) -> 1384164500;
get_exp_total(203) -> 1415616500;
get_exp_total(204) -> 1447468500;
get_exp_total(205) -> 1479720500;
get_exp_total(206) -> 1512572500;
get_exp_total(207) -> 1545824500;
get_exp_total(208) -> 1579676500;
get_exp_total(209) -> 1613928500;
get_exp_total(210) -> 1648780500;
get_exp_total(211) -> 1684032500;
get_exp_total(212) -> 1719884500;
get_exp_total(213) -> 1756136500;
get_exp_total(214) -> 1792988500;
get_exp_total(215) -> 1830240500;
get_exp_total(216) -> 1868092500;
get_exp_total(217) -> 1906344500;
get_exp_total(218) -> 1945196500;
get_exp_total(219) -> 1984448500;
get_exp_total(220) -> 2024300500;
get_exp_total(221) -> 2064552500;
get_exp_total(222) -> 2105404500;
get_exp_total(223) -> 2146656500;
get_exp_total(224) -> 2188508500;
get_exp_total(225) -> 2230760500;
get_exp_total(226) -> 2273612500;
get_exp_total(227) -> 2316935928;
get_exp_total(228) -> 2360764118;
get_exp_total(229) -> 2405097070;
get_exp_total(230) -> 2449934784;
get_exp_total(231) -> 2495277260;
get_exp_total(232) -> 2541124498;
get_exp_total(233) -> 2587476498;
get_exp_total(234) -> 2634333259;
get_exp_total(235) -> 2681694782;
get_exp_total(236) -> 2729561067;
get_exp_total(237) -> 2777932114;
get_exp_total(238) -> 2826807923;
get_exp_total(239) -> 2876188494;
get_exp_total(240) -> 2926073827;
get_exp_total(241) -> 2976463922;
get_exp_total(242) -> 3027358779;
get_exp_total(243) -> 3078758398;
get_exp_total(244) -> 3130662778;
get_exp_total(245) -> 3183071920;
get_exp_total(246) -> 3235985824;
get_exp_total(247) -> 3289404490;
get_exp_total(248) -> 3343327918;
get_exp_total(249) -> 3397756108;
get_exp_total(250) -> 3452689060;
get_exp_total(251) -> 3508126774;
get_exp_total(252) -> 3564069250;
get_exp_total(253) -> 3620516488;
get_exp_total(254) -> 3677468488;
get_exp_total(255) -> 3734925249;
get_exp_total(256) -> 3792886772;
get_exp_total(257) -> 3851353057;
get_exp_total(258) -> 3910324104;
get_exp_total(259) -> 3969799913;
get_exp_total(260) -> 4029780484;
get_exp_total(261) -> 4090265817;
get_exp_total(262) -> 4151255912;
get_exp_total(263) -> 4212750769;
get_exp_total(264) -> 4274750388;
get_exp_total(265) -> 4337254768;
get_exp_total(266) -> 4400263910;
get_exp_total(267) -> 4463777814;
get_exp_total(268) -> 4527796480;
get_exp_total(269) -> 4592319908;
get_exp_total(270) -> 4657348098;
get_exp_total(271) -> 4722881050;
get_exp_total(272) -> 4788918764;
get_exp_total(273) -> 4855461240;
get_exp_total(274) -> 4922508478;
get_exp_total(275) -> 4990060478;
get_exp_total(276) -> 5058117239;
get_exp_total(277) -> 5126678762;
get_exp_total(278) -> 5195745047;
get_exp_total(279) -> 5265316094;
get_exp_total(280) -> 5335391903;
get_exp_total(281) -> 5405972474;
get_exp_total(282) -> 5477057807;
get_exp_total(283) -> 5548647902;
get_exp_total(284) -> 5620742759;
get_exp_total(285) -> 5693342378;
get_exp_total(286) -> 5766446758;
get_exp_total(287) -> 5840055900;
get_exp_total(288) -> 5914169804;
get_exp_total(289) -> 5988788470;
get_exp_total(290) -> 6063911898;
get_exp_total(291) -> 6139540088;
get_exp_total(292) -> 6215673040;
get_exp_total(293) -> 6292310754;
get_exp_total(294) -> 6369453230;
get_exp_total(295) -> 6447100468;
get_exp_total(296) -> 6525252468;
get_exp_total(297) -> 6603909229;
get_exp_total(298) -> 6683070752;
get_exp_total(299) -> 6762737037;
get_exp_total(300) -> 6842908084;
get_exp_total(_) -> 0.

lev_energy(1) -> 200;
lev_energy(2) -> 200;
lev_energy(3) -> 200;
lev_energy(4) -> 200;
lev_energy(5) -> 200;
lev_energy(6) -> 200;
lev_energy(7) -> 200;
lev_energy(8) -> 200;
lev_energy(9) -> 200;
lev_energy(10) -> 200;
lev_energy(11) -> 200;
lev_energy(12) -> 200;
lev_energy(13) -> 200;
lev_energy(14) -> 200;
lev_energy(15) -> 200;
lev_energy(16) -> 200;
lev_energy(17) -> 200;
lev_energy(18) -> 200;
lev_energy(19) -> 200;
lev_energy(20) -> 200;
lev_energy(21) -> 200;
lev_energy(22) -> 200;
lev_energy(23) -> 200;
lev_energy(24) -> 200;
lev_energy(25) -> 200;
lev_energy(26) -> 200;
lev_energy(27) -> 200;
lev_energy(28) -> 200;
lev_energy(29) -> 200;
lev_energy(30) -> 200;
lev_energy(31) -> 200;
lev_energy(32) -> 200;
lev_energy(33) -> 200;
lev_energy(34) -> 200;
lev_energy(35) -> 200;
lev_energy(36) -> 200;
lev_energy(37) -> 200;
lev_energy(38) -> 200;
lev_energy(39) -> 200;
lev_energy(40) -> 200;
lev_energy(41) -> 200;
lev_energy(42) -> 200;
lev_energy(43) -> 200;
lev_energy(44) -> 200;
lev_energy(45) -> 200;
lev_energy(46) -> 200;
lev_energy(47) -> 200;
lev_energy(48) -> 200;
lev_energy(49) -> 200;
lev_energy(50) -> 200;
lev_energy(51) -> 200;
lev_energy(52) -> 200;
lev_energy(53) -> 200;
lev_energy(54) -> 200;
lev_energy(55) -> 200;
lev_energy(56) -> 200;
lev_energy(57) -> 200;
lev_energy(58) -> 200;
lev_energy(59) -> 200;
lev_energy(60) -> 200;
lev_energy(61) -> 200;
lev_energy(62) -> 200;
lev_energy(63) -> 200;
lev_energy(64) -> 200;
lev_energy(65) -> 200;
lev_energy(66) -> 200;
lev_energy(67) -> 200;
lev_energy(68) -> 200;
lev_energy(69) -> 200;
lev_energy(70) -> 200;
lev_energy(71) -> 200;
lev_energy(72) -> 200;
lev_energy(73) -> 200;
lev_energy(74) -> 200;
lev_energy(75) -> 200;
lev_energy(76) -> 200;
lev_energy(77) -> 200;
lev_energy(78) -> 200;
lev_energy(79) -> 200;
lev_energy(80) -> 200;
lev_energy(81) -> 200;
lev_energy(82) -> 200;
lev_energy(83) -> 200;
lev_energy(84) -> 200;
lev_energy(85) -> 200;
lev_energy(86) -> 200;
lev_energy(87) -> 200;
lev_energy(88) -> 200;
lev_energy(89) -> 200;
lev_energy(90) -> 200;
lev_energy(91) -> 200;
lev_energy(92) -> 200;
lev_energy(93) -> 200;
lev_energy(94) -> 200;
lev_energy(95) -> 200;
lev_energy(96) -> 200;
lev_energy(97) -> 200;
lev_energy(98) -> 200;
lev_energy(99) -> 200;
lev_energy(100) -> 200;
lev_energy(101) -> 200;
lev_energy(102) -> 200;
lev_energy(103) -> 200;
lev_energy(104) -> 200;
lev_energy(105) -> 200;
lev_energy(106) -> 200;
lev_energy(107) -> 200;
lev_energy(108) -> 200;
lev_energy(109) -> 200;
lev_energy(110) -> 200;
lev_energy(111) -> 200;
lev_energy(112) -> 200;
lev_energy(113) -> 200;
lev_energy(114) -> 200;
lev_energy(115) -> 200;
lev_energy(116) -> 200;
lev_energy(117) -> 200;
lev_energy(118) -> 200;
lev_energy(119) -> 200;
lev_energy(120) -> 200;
lev_energy(121) -> 200;
lev_energy(122) -> 200;
lev_energy(123) -> 200;
lev_energy(124) -> 200;
lev_energy(125) -> 200;
lev_energy(126) -> 200;
lev_energy(127) -> 200;
lev_energy(128) -> 200;
lev_energy(129) -> 200;
lev_energy(130) -> 200;
lev_energy(131) -> 200;
lev_energy(132) -> 200;
lev_energy(133) -> 200;
lev_energy(134) -> 200;
lev_energy(135) -> 200;
lev_energy(136) -> 200;
lev_energy(137) -> 200;
lev_energy(138) -> 200;
lev_energy(139) -> 200;
lev_energy(140) -> 200;
lev_energy(141) -> 200;
lev_energy(142) -> 200;
lev_energy(143) -> 200;
lev_energy(144) -> 200;
lev_energy(145) -> 200;
lev_energy(146) -> 200;
lev_energy(147) -> 200;
lev_energy(148) -> 200;
lev_energy(149) -> 200;
lev_energy(150) -> 200;
lev_energy(151) -> 200;
lev_energy(152) -> 200;
lev_energy(153) -> 200;
lev_energy(154) -> 200;
lev_energy(155) -> 200;
lev_energy(156) -> 200;
lev_energy(157) -> 200;
lev_energy(158) -> 200;
lev_energy(159) -> 200;
lev_energy(160) -> 200;
lev_energy(161) -> 200;
lev_energy(162) -> 200;
lev_energy(163) -> 200;
lev_energy(164) -> 200;
lev_energy(165) -> 200;
lev_energy(166) -> 200;
lev_energy(167) -> 200;
lev_energy(168) -> 200;
lev_energy(169) -> 200;
lev_energy(170) -> 200;
lev_energy(171) -> 200;
lev_energy(172) -> 200;
lev_energy(173) -> 200;
lev_energy(174) -> 200;
lev_energy(175) -> 200;
lev_energy(176) -> 200;
lev_energy(177) -> 200;
lev_energy(178) -> 200;
lev_energy(179) -> 200;
lev_energy(180) -> 200;
lev_energy(181) -> 200;
lev_energy(182) -> 200;
lev_energy(183) -> 200;
lev_energy(184) -> 200;
lev_energy(185) -> 200;
lev_energy(186) -> 200;
lev_energy(187) -> 200;
lev_energy(188) -> 200;
lev_energy(189) -> 200;
lev_energy(190) -> 200;
lev_energy(191) -> 200;
lev_energy(192) -> 200;
lev_energy(193) -> 200;
lev_energy(194) -> 200;
lev_energy(195) -> 200;
lev_energy(196) -> 200;
lev_energy(197) -> 200;
lev_energy(198) -> 200;
lev_energy(199) -> 200;
lev_energy(200) -> 200;
lev_energy(201) -> 200;
lev_energy(202) -> 200;
lev_energy(203) -> 200;
lev_energy(204) -> 200;
lev_energy(205) -> 200;
lev_energy(206) -> 200;
lev_energy(207) -> 200;
lev_energy(208) -> 200;
lev_energy(209) -> 200;
lev_energy(210) -> 200;
lev_energy(211) -> 200;
lev_energy(212) -> 200;
lev_energy(213) -> 200;
lev_energy(214) -> 200;
lev_energy(215) -> 200;
lev_energy(216) -> 200;
lev_energy(217) -> 200;
lev_energy(218) -> 200;
lev_energy(219) -> 200;
lev_energy(220) -> 200;
lev_energy(221) -> 200;
lev_energy(222) -> 200;
lev_energy(223) -> 200;
lev_energy(224) -> 200;
lev_energy(225) -> 200;
lev_energy(226) -> 200;
lev_energy(227) -> 200;
lev_energy(228) -> 200;
lev_energy(229) -> 200;
lev_energy(230) -> 200;
lev_energy(231) -> 200;
lev_energy(232) -> 200;
lev_energy(233) -> 200;
lev_energy(234) -> 200;
lev_energy(235) -> 200;
lev_energy(236) -> 200;
lev_energy(237) -> 200;
lev_energy(238) -> 200;
lev_energy(239) -> 200;
lev_energy(240) -> 200;
lev_energy(241) -> 200;
lev_energy(242) -> 200;
lev_energy(243) -> 200;
lev_energy(244) -> 200;
lev_energy(245) -> 200;
lev_energy(246) -> 200;
lev_energy(247) -> 200;
lev_energy(248) -> 200;
lev_energy(249) -> 200;
lev_energy(250) -> 200;
lev_energy(251) -> 200;
lev_energy(252) -> 200;
lev_energy(253) -> 200;
lev_energy(254) -> 200;
lev_energy(255) -> 200;
lev_energy(256) -> 200;
lev_energy(257) -> 200;
lev_energy(258) -> 200;
lev_energy(259) -> 200;
lev_energy(260) -> 200;
lev_energy(261) -> 200;
lev_energy(262) -> 200;
lev_energy(263) -> 200;
lev_energy(264) -> 200;
lev_energy(265) -> 200;
lev_energy(266) -> 200;
lev_energy(267) -> 200;
lev_energy(268) -> 200;
lev_energy(269) -> 200;
lev_energy(270) -> 200;
lev_energy(271) -> 200;
lev_energy(272) -> 200;
lev_energy(273) -> 200;
lev_energy(274) -> 200;
lev_energy(275) -> 200;
lev_energy(276) -> 200;
lev_energy(277) -> 200;
lev_energy(278) -> 200;
lev_energy(279) -> 200;
lev_energy(280) -> 200;
lev_energy(281) -> 200;
lev_energy(282) -> 200;
lev_energy(283) -> 200;
lev_energy(284) -> 200;
lev_energy(285) -> 200;
lev_energy(286) -> 200;
lev_energy(287) -> 200;
lev_energy(288) -> 200;
lev_energy(289) -> 200;
lev_energy(290) -> 200;
lev_energy(291) -> 200;
lev_energy(292) -> 200;
lev_energy(293) -> 200;
lev_energy(294) -> 200;
lev_energy(295) -> 200;
lev_energy(296) -> 200;
lev_energy(297) -> 200;
lev_energy(298) -> 200;
lev_energy(299) -> 200;
lev_energy(300) -> 200;
lev_energy(_) -> 0.

vip_lev_energy(1) -> 0;
vip_lev_energy(2) -> 0;
vip_lev_energy(3) -> 0;
vip_lev_energy(4) -> 0;
vip_lev_energy(5) -> 0;
vip_lev_energy(6) -> 0;
vip_lev_energy(7) -> 0;
vip_lev_energy(8) -> 0;
vip_lev_energy(9) -> 0;
vip_lev_energy(10) -> 0;
vip_lev_energy(11) -> 0;
vip_lev_energy(12) -> 0;
vip_lev_energy(13) -> 0;
vip_lev_energy(14) -> 0;
vip_lev_energy(15) -> 0;
vip_lev_energy(_) -> 0.

get_const(max_lev) -> 301;
get_const(energy_time) -> 300;
get_const(role_auth_award) -> [{4, 100}];
get_const(role_reported_lev_limit) -> 20;
get_const(role_reported_limit_count) -> 10;
get_const(role_reported_vip_limit) ->
    [{2, 5}, {5, 10}, {13, 100}];
get_const(game_rule1) -> 1;
get_const(fans_avatar_id) -> 2700;
get_const(fans_tips_text1) -> 1;
get_const(fans_tips_text2) -> 1;
get_const(fan_like_levlimit) -> 35;
get_const(fan_rewardnumber) -> 5;
get_const(fan_rank_reward) -> [{50004, 1}];
get_const(open_lev) -> 28;
get_const(_Info) ->
    logger:data_error("get_const_data_not_exist===>~w",
		      [_Info], role_career_data, 959),
    undefined.

get_career_list() -> [].

get_career(_) -> <<>>.

get_career_sex(_) -> 2.

get_lev_award(2) -> [{3, 10}];
get_lev_award(3) -> [{3, 20}];
get_lev_award(4) -> [{3, 20}];
get_lev_award(5) -> [{3, 20}];
get_lev_award(6) -> [{3, 20}];
get_lev_award(7) -> [{3, 20}];
get_lev_award(8) -> [{3, 20}];
get_lev_award(9) -> [{3, 20}];
get_lev_award(10) -> [{3, 20}];
get_lev_award(11) -> [{3, 20}];
get_lev_award(12) -> [{3, 20}];
get_lev_award(13) -> [{3, 20}];
get_lev_award(14) -> [{3, 20}];
get_lev_award(15) -> [{3, 20}];
get_lev_award(16) -> [{3, 20}];
get_lev_award(17) -> [{3, 20}];
get_lev_award(18) -> [{3, 20}];
get_lev_award(19) -> [{3, 20}];
get_lev_award(20) -> [{3, 20}];
get_lev_award(21) -> [{3, 20}];
get_lev_award(22) -> [{3, 20}];
get_lev_award(23) -> [{3, 20}];
get_lev_award(24) -> [{3, 20}];
get_lev_award(25) -> [{3, 20}];
get_lev_award(26) -> [{3, 20}];
get_lev_award(27) -> [{3, 20}];
get_lev_award(28) -> [{3, 20}];
get_lev_award(29) -> [{3, 20}];
get_lev_award(30) -> [{3, 30}];
get_lev_award(31) -> [{3, 30}];
get_lev_award(32) -> [{3, 30}];
get_lev_award(33) -> [{3, 30}];
get_lev_award(34) -> [{3, 30}];
get_lev_award(35) -> [{3, 30}];
get_lev_award(36) -> [{3, 30}];
get_lev_award(37) -> [{3, 30}];
get_lev_award(38) -> [{3, 30}];
get_lev_award(39) -> [{3, 30}];
get_lev_award(40) -> [{3, 40}];
get_lev_award(41) -> [{3, 40}];
get_lev_award(42) -> [{3, 40}];
get_lev_award(43) -> [{3, 40}];
get_lev_award(44) -> [{3, 40}];
get_lev_award(45) -> [{3, 40}];
get_lev_award(46) -> [{3, 40}];
get_lev_award(47) -> [{3, 40}];
get_lev_award(48) -> [{3, 40}];
get_lev_award(49) -> [{3, 40}];
get_lev_award(50) -> [{3, 50}];
get_lev_award(51) -> [{3, 50}];
get_lev_award(52) -> [{3, 50}];
get_lev_award(53) -> [{3, 50}];
get_lev_award(54) -> [{3, 50}];
get_lev_award(55) -> [{3, 50}];
get_lev_award(56) -> [{3, 50}];
get_lev_award(57) -> [{3, 50}];
get_lev_award(58) -> [{3, 50}];
get_lev_award(59) -> [{3, 50}];
get_lev_award(60) -> [{3, 60}];
get_lev_award(61) -> [{3, 60}];
get_lev_award(62) -> [{3, 60}];
get_lev_award(63) -> [{3, 60}];
get_lev_award(64) -> [{3, 60}];
get_lev_award(65) -> [{3, 60}];
get_lev_award(66) -> [{3, 60}];
get_lev_award(67) -> [{3, 60}];
get_lev_award(68) -> [{3, 60}];
get_lev_award(69) -> [{3, 60}];
get_lev_award(70) -> [{3, 70}];
get_lev_award(71) -> [{3, 70}];
get_lev_award(72) -> [{3, 70}];
get_lev_award(73) -> [{3, 70}];
get_lev_award(74) -> [{3, 70}];
get_lev_award(75) -> [{3, 70}];
get_lev_award(76) -> [{3, 70}];
get_lev_award(77) -> [{3, 70}];
get_lev_award(78) -> [{3, 70}];
get_lev_award(79) -> [{3, 70}];
get_lev_award(80) -> [{10601, 1}, {3, 80}];
get_lev_award(81) -> [{3, 80}];
get_lev_award(82) -> [{3, 80}];
get_lev_award(83) -> [{3, 80}];
get_lev_award(84) -> [{3, 80}];
get_lev_award(85) -> [{3, 80}];
get_lev_award(86) -> [{3, 80}];
get_lev_award(87) -> [{3, 80}];
get_lev_award(88) -> [{3, 80}];
get_lev_award(89) -> [{3, 80}];
get_lev_award(90) -> [{3, 90}];
get_lev_award(91) -> [{3, 90}];
get_lev_award(92) -> [{3, 90}];
get_lev_award(93) -> [{3, 90}];
get_lev_award(94) -> [{3, 90}];
get_lev_award(95) -> [{3, 90}];
get_lev_award(96) -> [{3, 90}];
get_lev_award(97) -> [{3, 90}];
get_lev_award(98) -> [{3, 90}];
get_lev_award(99) -> [{3, 90}];
get_lev_award(100) -> [{3, 100}];
get_lev_award(101) -> [{3, 100}];
get_lev_award(102) -> [{3, 100}];
get_lev_award(103) -> [{3, 100}];
get_lev_award(104) -> [{3, 100}];
get_lev_award(105) -> [{3, 100}];
get_lev_award(106) -> [{3, 100}];
get_lev_award(107) -> [{3, 100}];
get_lev_award(108) -> [{3, 100}];
get_lev_award(109) -> [{3, 100}];
get_lev_award(110) -> [{3, 110}];
get_lev_award(111) -> [{3, 110}];
get_lev_award(112) -> [{3, 110}];
get_lev_award(113) -> [{3, 110}];
get_lev_award(114) -> [{3, 110}];
get_lev_award(115) -> [{3, 110}];
get_lev_award(116) -> [{3, 110}];
get_lev_award(117) -> [{3, 110}];
get_lev_award(118) -> [{3, 110}];
get_lev_award(119) -> [{3, 110}];
get_lev_award(120) -> [{3, 120}];
get_lev_award(121) -> [{3, 120}];
get_lev_award(122) -> [{3, 120}];
get_lev_award(123) -> [{3, 120}];
get_lev_award(124) -> [{3, 120}];
get_lev_award(125) -> [{3, 120}];
get_lev_award(126) -> [{3, 120}];
get_lev_award(127) -> [{3, 120}];
get_lev_award(128) -> [{3, 120}];
get_lev_award(129) -> [{3, 120}];
get_lev_award(130) -> [{3, 130}];
get_lev_award(131) -> [{3, 130}];
get_lev_award(132) -> [{3, 130}];
get_lev_award(133) -> [{3, 130}];
get_lev_award(134) -> [{3, 130}];
get_lev_award(135) -> [{3, 130}];
get_lev_award(136) -> [{3, 130}];
get_lev_award(137) -> [{3, 130}];
get_lev_award(138) -> [{3, 130}];
get_lev_award(139) -> [{3, 130}];
get_lev_award(140) -> [{3, 140}];
get_lev_award(141) -> [{3, 140}];
get_lev_award(142) -> [{3, 140}];
get_lev_award(143) -> [{3, 140}];
get_lev_award(144) -> [{3, 140}];
get_lev_award(145) -> [{3, 140}];
get_lev_award(146) -> [{3, 140}];
get_lev_award(147) -> [{3, 140}];
get_lev_award(148) -> [{3, 140}];
get_lev_award(149) -> [{3, 140}];
get_lev_award(150) -> [{3, 150}];
get_lev_award(151) -> [{3, 150}];
get_lev_award(152) -> [{3, 150}];
get_lev_award(153) -> [{3, 150}];
get_lev_award(154) -> [{3, 150}];
get_lev_award(155) -> [{3, 150}];
get_lev_award(156) -> [{3, 150}];
get_lev_award(157) -> [{3, 150}];
get_lev_award(158) -> [{3, 150}];
get_lev_award(159) -> [{3, 150}];
get_lev_award(160) -> [{3, 160}];
get_lev_award(161) -> [{3, 160}];
get_lev_award(162) -> [{3, 160}];
get_lev_award(163) -> [{3, 160}];
get_lev_award(164) -> [{3, 160}];
get_lev_award(165) -> [{3, 160}];
get_lev_award(166) -> [{3, 160}];
get_lev_award(167) -> [{3, 160}];
get_lev_award(168) -> [{3, 160}];
get_lev_award(169) -> [{3, 160}];
get_lev_award(170) -> [{3, 170}];
get_lev_award(171) -> [{3, 170}];
get_lev_award(172) -> [{3, 170}];
get_lev_award(173) -> [{3, 170}];
get_lev_award(174) -> [{3, 170}];
get_lev_award(175) -> [{3, 170}];
get_lev_award(176) -> [{3, 170}];
get_lev_award(177) -> [{3, 170}];
get_lev_award(178) -> [{3, 170}];
get_lev_award(179) -> [{3, 170}];
get_lev_award(180) -> [{3, 180}];
get_lev_award(181) -> [{3, 180}];
get_lev_award(182) -> [{3, 180}];
get_lev_award(183) -> [{3, 180}];
get_lev_award(184) -> [{3, 180}];
get_lev_award(185) -> [{3, 180}];
get_lev_award(186) -> [{3, 180}];
get_lev_award(187) -> [{3, 180}];
get_lev_award(188) -> [{3, 180}];
get_lev_award(189) -> [{3, 180}];
get_lev_award(190) -> [{3, 190}];
get_lev_award(191) -> [{3, 190}];
get_lev_award(192) -> [{3, 190}];
get_lev_award(193) -> [{3, 190}];
get_lev_award(194) -> [{3, 190}];
get_lev_award(195) -> [{3, 190}];
get_lev_award(196) -> [{3, 190}];
get_lev_award(197) -> [{3, 190}];
get_lev_award(198) -> [{3, 190}];
get_lev_award(199) -> [{3, 190}];
get_lev_award(200) -> [{3, 200}];
get_lev_award(201) -> [{3, 200}];
get_lev_award(202) -> [{3, 200}];
get_lev_award(203) -> [{3, 200}];
get_lev_award(204) -> [{3, 200}];
get_lev_award(205) -> [{3, 200}];
get_lev_award(206) -> [{3, 200}];
get_lev_award(207) -> [{3, 200}];
get_lev_award(208) -> [{3, 200}];
get_lev_award(209) -> [{3, 200}];
get_lev_award(210) -> [{3, 200}];
get_lev_award(211) -> [{3, 200}];
get_lev_award(212) -> [{3, 200}];
get_lev_award(213) -> [{3, 200}];
get_lev_award(214) -> [{3, 200}];
get_lev_award(215) -> [{3, 200}];
get_lev_award(216) -> [{3, 200}];
get_lev_award(217) -> [{3, 200}];
get_lev_award(218) -> [{3, 200}];
get_lev_award(219) -> [{3, 200}];
get_lev_award(220) -> [{3, 200}];
get_lev_award(221) -> [{3, 200}];
get_lev_award(222) -> [{3, 200}];
get_lev_award(223) -> [{3, 200}];
get_lev_award(224) -> [{3, 200}];
get_lev_award(225) -> [{3, 200}];
get_lev_award(226) -> [{3, 200}];
get_lev_award(227) -> [{3, 200}];
get_lev_award(228) -> [{3, 200}];
get_lev_award(229) -> [{3, 200}];
get_lev_award(230) -> [{3, 200}];
get_lev_award(231) -> [{3, 200}];
get_lev_award(232) -> [{3, 200}];
get_lev_award(233) -> [{3, 200}];
get_lev_award(234) -> [{3, 200}];
get_lev_award(235) -> [{3, 200}];
get_lev_award(236) -> [{3, 200}];
get_lev_award(237) -> [{3, 200}];
get_lev_award(238) -> [{3, 200}];
get_lev_award(239) -> [{3, 200}];
get_lev_award(240) -> [{3, 200}];
get_lev_award(241) -> [{3, 200}];
get_lev_award(242) -> [{3, 200}];
get_lev_award(243) -> [{3, 200}];
get_lev_award(244) -> [{3, 200}];
get_lev_award(245) -> [{3, 200}];
get_lev_award(246) -> [{3, 200}];
get_lev_award(247) -> [{3, 200}];
get_lev_award(248) -> [{3, 200}];
get_lev_award(249) -> [{3, 200}];
get_lev_award(250) -> [{3, 200}];
get_lev_award(251) -> [{3, 200}];
get_lev_award(252) -> [{3, 200}];
get_lev_award(253) -> [{3, 200}];
get_lev_award(254) -> [{3, 200}];
get_lev_award(255) -> [{3, 200}];
get_lev_award(256) -> [{3, 200}];
get_lev_award(257) -> [{3, 200}];
get_lev_award(258) -> [{3, 200}];
get_lev_award(259) -> [{3, 200}];
get_lev_award(260) -> [{3, 200}];
get_lev_award(261) -> [{3, 200}];
get_lev_award(262) -> [{3, 200}];
get_lev_award(263) -> [{3, 200}];
get_lev_award(264) -> [{3, 200}];
get_lev_award(265) -> [{3, 200}];
get_lev_award(266) -> [{3, 200}];
get_lev_award(267) -> [{3, 200}];
get_lev_award(268) -> [{3, 200}];
get_lev_award(269) -> [{3, 200}];
get_lev_award(270) -> [{3, 200}];
get_lev_award(271) -> [{3, 200}];
get_lev_award(272) -> [{3, 200}];
get_lev_award(273) -> [{3, 200}];
get_lev_award(274) -> [{3, 200}];
get_lev_award(275) -> [{3, 200}];
get_lev_award(276) -> [{3, 200}];
get_lev_award(277) -> [{3, 200}];
get_lev_award(278) -> [{3, 200}];
get_lev_award(279) -> [{3, 200}];
get_lev_award(280) -> [{3, 200}];
get_lev_award(281) -> [{3, 200}];
get_lev_award(282) -> [{3, 200}];
get_lev_award(283) -> [{3, 200}];
get_lev_award(284) -> [{3, 200}];
get_lev_award(285) -> [{3, 200}];
get_lev_award(286) -> [{3, 200}];
get_lev_award(287) -> [{3, 200}];
get_lev_award(288) -> [{3, 200}];
get_lev_award(289) -> [{3, 200}];
get_lev_award(290) -> [{3, 200}];
get_lev_award(291) -> [{3, 200}];
get_lev_award(292) -> [{3, 200}];
get_lev_award(293) -> [{3, 200}];
get_lev_award(294) -> [{3, 200}];
get_lev_award(295) -> [{3, 200}];
get_lev_award(296) -> [{3, 200}];
get_lev_award(297) -> [{3, 200}];
get_lev_award(298) -> [{3, 200}];
get_lev_award(299) -> [{3, 200}];
get_lev_award(300) -> [{3, 200}];
get_lev_award(_) -> [].

get_city_ids() ->
    [101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
     112, 113, 114, 115, 116, 201, 202, 203, 204, 205, 206,
     207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 301,
     302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 401,
     402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 501,
     502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512,
     601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611,
     612, 613, 614, 701, 702, 703, 704, 705, 706, 707, 708,
     709, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810,
     811, 812, 813, 901, 902, 903, 904, 905, 906, 907, 908,
     909, 910, 911, 912, 913, 914, 915, 916, 917, 918, 1001,
     1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010,
     1011, 1012, 1013, 1101, 1102, 1103, 1104, 1105, 1106,
     1107, 1108, 1109, 1110, 1111, 1201, 1202, 1203, 1204,
     1205, 1206, 1207, 1208, 1209, 1210, 1211, 1212, 1213,
     1214, 1215, 1216, 1301, 1302, 1303, 1304, 1305, 1306,
     1307, 1308, 1309, 1401, 1402, 1403, 1404, 1405, 1406,
     1407, 1408, 1409, 1410, 1411, 1501, 1502, 1503, 1504,
     1505, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513,
     1514, 1515, 1516, 1517, 1601, 1602, 1603, 1604, 1605,
     1606, 1607, 1608, 1609, 1610, 1611, 1612, 1613, 1614,
     1615, 1616, 1617, 1618, 1701, 1702, 1703, 1704, 1705,
     1706, 1707, 1708, 1709, 1710, 1711, 1712, 1713, 1714,
     1715, 1716, 1717, 1801, 1802, 1803, 1804, 1805, 1806,
     1807, 1808, 1809, 1810, 1811, 1812, 1813, 1814, 1901,
     1902, 1903, 1904, 1905, 1906, 1907, 1908, 1909, 1910,
     1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919,
     1920, 1921, 2001, 2002, 2003, 2004, 2005, 2006, 2007,
     2008, 2009, 2010, 2011, 2012, 2013, 2014, 2101, 2102,
     2103, 2104, 2105, 2106, 2107, 2108, 2109, 2110, 2111,
     2112, 2113, 2114, 2115, 2116, 2117, 2118, 2201, 2202,
     2203, 2204, 2205, 2206, 2207, 2208, 2209, 2210, 2211,
     2212, 2213, 2214, 2215, 2216, 2217, 2218, 2219, 2220,
     2221, 2222, 2223, 2224, 2225, 2226, 2227, 2228, 2229,
     2230, 2231, 2232, 2233, 2234, 2235, 2236, 2237, 2238,
     2239, 2240, 2241, 2301, 2302, 2303, 2304, 2305, 2306,
     2307, 2308, 2309, 2310, 2311, 2312, 2313, 2314, 2315,
     2316, 2317, 2318, 2319, 2320, 2321, 2401, 2402, 2403,
     2404, 2405, 2406, 2407, 2408, 2409, 2501, 2502, 2503,
     2504, 2505, 2506, 2507, 2508, 2509, 2510, 2511, 2512,
     2513, 2514, 2515, 2516, 2601, 2602, 2603, 2604, 2605,
     2606, 2607, 2701, 2702, 2703, 2704, 2705, 2706, 2707,
     2708, 2709, 2710, 2801, 2802, 2803, 2804, 2805, 2806,
     2807, 2808, 2809, 2810, 2811, 2812, 2813, 2814, 2901,
     2902, 2903, 2904, 2905, 2906, 2907, 2908, 3001, 3002,
     3003, 3004, 3005, 3101, 3102, 3103, 3104, 3105, 3106,
     3107, 3108, 3109, 3110, 3111, 3112, 3113, 3114, 3115,
     3116, 3117, 3118, 3119, 3201, 3202, 3203, 3204, 3205,
     3206, 3207, 3208, 3209, 3210, 3211, 3212, 3213, 3214,
     3215, 3216, 3217, 3218, 3219, 3220, 3221, 3222, 3223,
     3224, 3225, 3301, 3401].

get_city_info(101) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"东城"/utf8>>)};
get_city_info(102) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"西城"/utf8>>)};
get_city_info(103) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"朝阳"/utf8>>)};
get_city_info(104) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"丰台"/utf8>>)};
get_city_info(105) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"石景山"/utf8>>)};
get_city_info(106) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"海淀"/utf8>>)};
get_city_info(107) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"门头沟"/utf8>>)};
get_city_info(108) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"房山"/utf8>>)};
get_city_info(109) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"通州"/utf8>>)};
get_city_info(110) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"顺义"/utf8>>)};
get_city_info(111) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"昌平"/utf8>>)};
get_city_info(112) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"大兴"/utf8>>)};
get_city_info(113) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"怀柔"/utf8>>)};
get_city_info(114) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"平谷"/utf8>>)};
get_city_info(115) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"密云"/utf8>>)};
get_city_info(116) ->
    {lang:get(<<"北京市"/utf8>>), lang:get(<<"延庆"/utf8>>)};
get_city_info(201) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"河西"/utf8>>)};
get_city_info(202) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"和平"/utf8>>)};
get_city_info(203) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"河东"/utf8>>)};
get_city_info(204) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"南开"/utf8>>)};
get_city_info(205) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"河北"/utf8>>)};
get_city_info(206) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"红桥"/utf8>>)};
get_city_info(207) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"滨海新"/utf8>>)};
get_city_info(208) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"东丽"/utf8>>)};
get_city_info(209) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"西青"/utf8>>)};
get_city_info(210) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"津南"/utf8>>)};
get_city_info(211) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"北辰"/utf8>>)};
get_city_info(212) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"宁河"/utf8>>)};
get_city_info(213) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"武清"/utf8>>)};
get_city_info(214) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"静海"/utf8>>)};
get_city_info(215) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"宝坻"/utf8>>)};
get_city_info(216) ->
    {lang:get(<<"天津市"/utf8>>), lang:get(<<"蓟县"/utf8>>)};
get_city_info(301) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"石家庄市"/utf8>>)};
get_city_info(302) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"唐山市"/utf8>>)};
get_city_info(303) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"秦皇岛市"/utf8>>)};
get_city_info(304) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"邯郸市"/utf8>>)};
get_city_info(305) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"邢台市"/utf8>>)};
get_city_info(306) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"保定市"/utf8>>)};
get_city_info(307) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"张家口市"/utf8>>)};
get_city_info(308) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"承德市"/utf8>>)};
get_city_info(309) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"沧州市"/utf8>>)};
get_city_info(310) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"廊坊市"/utf8>>)};
get_city_info(311) ->
    {lang:get(<<"河北"/utf8>>), lang:get(<<"衡水市"/utf8>>)};
get_city_info(401) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"太原市"/utf8>>)};
get_city_info(402) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"大同市"/utf8>>)};
get_city_info(403) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"阳泉市"/utf8>>)};
get_city_info(404) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"长治市"/utf8>>)};
get_city_info(405) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"晋城市"/utf8>>)};
get_city_info(406) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"朔州市"/utf8>>)};
get_city_info(407) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"晋中市"/utf8>>)};
get_city_info(408) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"运城市"/utf8>>)};
get_city_info(409) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"忻州市"/utf8>>)};
get_city_info(410) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"临汾市"/utf8>>)};
get_city_info(411) ->
    {lang:get(<<"山西"/utf8>>), lang:get(<<"吕梁市"/utf8>>)};
get_city_info(501) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"呼和浩特市"/utf8>>)};
get_city_info(502) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"包头市"/utf8>>)};
get_city_info(503) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"乌海市"/utf8>>)};
get_city_info(504) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"赤峰市"/utf8>>)};
get_city_info(505) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"通辽市"/utf8>>)};
get_city_info(506) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"鄂尔多斯市"/utf8>>)};
get_city_info(507) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"呼伦贝尔市"/utf8>>)};
get_city_info(508) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"巴彦淖尔市"/utf8>>)};
get_city_info(509) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"乌兰察布市"/utf8>>)};
get_city_info(510) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"兴安盟"/utf8>>)};
get_city_info(511) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"锡林郭勒盟"/utf8>>)};
get_city_info(512) ->
    {lang:get(<<"内蒙古"/utf8>>), lang:get(<<"阿拉善盟"/utf8>>)};
get_city_info(601) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"沈阳市"/utf8>>)};
get_city_info(602) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"大连市"/utf8>>)};
get_city_info(603) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"鞍山市"/utf8>>)};
get_city_info(604) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"抚顺市"/utf8>>)};
get_city_info(605) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"本溪市"/utf8>>)};
get_city_info(606) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"丹东市"/utf8>>)};
get_city_info(607) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"锦州市"/utf8>>)};
get_city_info(608) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"营口市"/utf8>>)};
get_city_info(609) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"阜新市"/utf8>>)};
get_city_info(610) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"辽阳市"/utf8>>)};
get_city_info(611) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"盘锦市"/utf8>>)};
get_city_info(612) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"铁岭市"/utf8>>)};
get_city_info(613) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"朝阳市"/utf8>>)};
get_city_info(614) ->
    {lang:get(<<"辽宁"/utf8>>), lang:get(<<"葫芦岛市"/utf8>>)};
get_city_info(701) ->
    {lang:get(<<"吉林"/utf8>>), lang:get(<<"长春市"/utf8>>)};
get_city_info(702) ->
    {lang:get(<<"吉林"/utf8>>), lang:get(<<"吉林市"/utf8>>)};
get_city_info(703) ->
    {lang:get(<<"吉林"/utf8>>), lang:get(<<"四平市"/utf8>>)};
get_city_info(704) ->
    {lang:get(<<"吉林"/utf8>>), lang:get(<<"辽源市"/utf8>>)};
get_city_info(705) ->
    {lang:get(<<"吉林"/utf8>>), lang:get(<<"通化市"/utf8>>)};
get_city_info(706) ->
    {lang:get(<<"吉林"/utf8>>), lang:get(<<"白山市"/utf8>>)};
get_city_info(707) ->
    {lang:get(<<"吉林"/utf8>>), lang:get(<<"松原市"/utf8>>)};
get_city_info(708) ->
    {lang:get(<<"吉林"/utf8>>), lang:get(<<"白城市"/utf8>>)};
get_city_info(709) ->
    {lang:get(<<"吉林"/utf8>>), lang:get(<<"延边"/utf8>>)};
get_city_info(801) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"哈尔滨市"/utf8>>)};
get_city_info(802) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"齐齐哈尔市"/utf8>>)};
get_city_info(803) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"鸡西市"/utf8>>)};
get_city_info(804) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"鹤岗市"/utf8>>)};
get_city_info(805) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"双鸭山市"/utf8>>)};
get_city_info(806) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"大庆市"/utf8>>)};
get_city_info(807) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"伊春市"/utf8>>)};
get_city_info(808) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"佳木斯市"/utf8>>)};
get_city_info(809) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"七台河市"/utf8>>)};
get_city_info(810) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"牡丹江市"/utf8>>)};
get_city_info(811) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"黑河市"/utf8>>)};
get_city_info(812) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"绥化市"/utf8>>)};
get_city_info(813) ->
    {lang:get(<<"黑龙江"/utf8>>), lang:get(<<"大兴安岭"/utf8>>)};
get_city_info(901) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"黄浦"/utf8>>)};
get_city_info(902) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"卢湾"/utf8>>)};
get_city_info(903) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"徐汇"/utf8>>)};
get_city_info(904) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"长宁"/utf8>>)};
get_city_info(905) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"静安"/utf8>>)};
get_city_info(906) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"闸北"/utf8>>)};
get_city_info(907) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"普陀"/utf8>>)};
get_city_info(908) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"虹口"/utf8>>)};
get_city_info(909) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"杨浦"/utf8>>)};
get_city_info(910) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"闵行"/utf8>>)};
get_city_info(911) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"宝山"/utf8>>)};
get_city_info(912) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"嘉定"/utf8>>)};
get_city_info(913) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"浦东新"/utf8>>)};
get_city_info(914) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"金山"/utf8>>)};
get_city_info(915) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"松江"/utf8>>)};
get_city_info(916) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"奉贤"/utf8>>)};
get_city_info(917) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"青浦"/utf8>>)};
get_city_info(918) ->
    {lang:get(<<"上海市"/utf8>>), lang:get(<<"崇明"/utf8>>)};
get_city_info(1001) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"南京市"/utf8>>)};
get_city_info(1002) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"无锡市"/utf8>>)};
get_city_info(1003) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"徐州市"/utf8>>)};
get_city_info(1004) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"常州市"/utf8>>)};
get_city_info(1005) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"苏州市"/utf8>>)};
get_city_info(1006) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"南通市"/utf8>>)};
get_city_info(1007) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"连云港市"/utf8>>)};
get_city_info(1008) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"淮安市"/utf8>>)};
get_city_info(1009) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"盐城市"/utf8>>)};
get_city_info(1010) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"扬州市"/utf8>>)};
get_city_info(1011) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"镇江市"/utf8>>)};
get_city_info(1012) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"泰州市"/utf8>>)};
get_city_info(1013) ->
    {lang:get(<<"江苏"/utf8>>), lang:get(<<"宿迁市"/utf8>>)};
get_city_info(1101) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"杭州市"/utf8>>)};
get_city_info(1102) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"宁波市"/utf8>>)};
get_city_info(1103) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"温州市"/utf8>>)};
get_city_info(1104) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"嘉兴市"/utf8>>)};
get_city_info(1105) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"湖州市"/utf8>>)};
get_city_info(1106) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"绍兴市"/utf8>>)};
get_city_info(1107) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"金华市"/utf8>>)};
get_city_info(1108) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"衢州市"/utf8>>)};
get_city_info(1109) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"舟山市"/utf8>>)};
get_city_info(1110) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"台州市"/utf8>>)};
get_city_info(1111) ->
    {lang:get(<<"浙江"/utf8>>), lang:get(<<"丽水市"/utf8>>)};
get_city_info(1201) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"合肥市"/utf8>>)};
get_city_info(1202) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"芜湖市"/utf8>>)};
get_city_info(1203) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"蚌埠市"/utf8>>)};
get_city_info(1204) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"淮南市"/utf8>>)};
get_city_info(1205) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"马鞍山市"/utf8>>)};
get_city_info(1206) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"淮北市"/utf8>>)};
get_city_info(1207) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"铜陵市"/utf8>>)};
get_city_info(1208) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"安庆市"/utf8>>)};
get_city_info(1209) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"黄山市"/utf8>>)};
get_city_info(1210) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"滁州市"/utf8>>)};
get_city_info(1211) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"阜阳市"/utf8>>)};
get_city_info(1212) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"宿州市"/utf8>>)};
get_city_info(1213) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"六安市"/utf8>>)};
get_city_info(1214) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"亳州市"/utf8>>)};
get_city_info(1215) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"池州市"/utf8>>)};
get_city_info(1216) ->
    {lang:get(<<"安徽"/utf8>>), lang:get(<<"宣城市"/utf8>>)};
get_city_info(1301) ->
    {lang:get(<<"福建"/utf8>>), lang:get(<<"福州市"/utf8>>)};
get_city_info(1302) ->
    {lang:get(<<"福建"/utf8>>), lang:get(<<"厦门市"/utf8>>)};
get_city_info(1303) ->
    {lang:get(<<"福建"/utf8>>), lang:get(<<"莆田市"/utf8>>)};
get_city_info(1304) ->
    {lang:get(<<"福建"/utf8>>), lang:get(<<"三明市"/utf8>>)};
get_city_info(1305) ->
    {lang:get(<<"福建"/utf8>>), lang:get(<<"泉州市"/utf8>>)};
get_city_info(1306) ->
    {lang:get(<<"福建"/utf8>>), lang:get(<<"漳州市"/utf8>>)};
get_city_info(1307) ->
    {lang:get(<<"福建"/utf8>>), lang:get(<<"南平市"/utf8>>)};
get_city_info(1308) ->
    {lang:get(<<"福建"/utf8>>), lang:get(<<"龙岩市"/utf8>>)};
get_city_info(1309) ->
    {lang:get(<<"福建"/utf8>>), lang:get(<<"宁德市"/utf8>>)};
get_city_info(1401) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"南昌市"/utf8>>)};
get_city_info(1402) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"景德镇市"/utf8>>)};
get_city_info(1403) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"萍乡市"/utf8>>)};
get_city_info(1404) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"九江市"/utf8>>)};
get_city_info(1405) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"新余市"/utf8>>)};
get_city_info(1406) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"鹰潭市"/utf8>>)};
get_city_info(1407) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"赣州市"/utf8>>)};
get_city_info(1408) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"吉安市"/utf8>>)};
get_city_info(1409) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"宜春市"/utf8>>)};
get_city_info(1410) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"抚州市"/utf8>>)};
get_city_info(1411) ->
    {lang:get(<<"江西"/utf8>>), lang:get(<<"上饶市"/utf8>>)};
get_city_info(1501) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"济南市"/utf8>>)};
get_city_info(1502) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"青岛市"/utf8>>)};
get_city_info(1503) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"淄博市"/utf8>>)};
get_city_info(1504) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"枣庄市"/utf8>>)};
get_city_info(1505) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"东营市"/utf8>>)};
get_city_info(1506) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"烟台市"/utf8>>)};
get_city_info(1507) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"潍坊市"/utf8>>)};
get_city_info(1508) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"济宁市"/utf8>>)};
get_city_info(1509) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"泰安市"/utf8>>)};
get_city_info(1510) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"威海市"/utf8>>)};
get_city_info(1511) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"日照市"/utf8>>)};
get_city_info(1512) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"莱芜市"/utf8>>)};
get_city_info(1513) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"临沂市"/utf8>>)};
get_city_info(1514) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"德州市"/utf8>>)};
get_city_info(1515) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"聊城市"/utf8>>)};
get_city_info(1516) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"滨州市"/utf8>>)};
get_city_info(1517) ->
    {lang:get(<<"山东"/utf8>>), lang:get(<<"菏泽市"/utf8>>)};
get_city_info(1601) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"郑州市"/utf8>>)};
get_city_info(1602) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"开封市"/utf8>>)};
get_city_info(1603) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"洛阳市"/utf8>>)};
get_city_info(1604) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"平顶山市"/utf8>>)};
get_city_info(1605) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"安阳市"/utf8>>)};
get_city_info(1606) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"鹤壁市"/utf8>>)};
get_city_info(1607) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"新乡市"/utf8>>)};
get_city_info(1608) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"焦作市"/utf8>>)};
get_city_info(1609) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"濮阳市"/utf8>>)};
get_city_info(1610) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"许昌市"/utf8>>)};
get_city_info(1611) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"漯河市"/utf8>>)};
get_city_info(1612) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"三门峡市"/utf8>>)};
get_city_info(1613) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"南阳市"/utf8>>)};
get_city_info(1614) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"商丘市"/utf8>>)};
get_city_info(1615) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"信阳市"/utf8>>)};
get_city_info(1616) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"周口市"/utf8>>)};
get_city_info(1617) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"驻马店市"/utf8>>)};
get_city_info(1618) ->
    {lang:get(<<"河南"/utf8>>), lang:get(<<"济源市"/utf8>>)};
get_city_info(1701) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"武汉市"/utf8>>)};
get_city_info(1702) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"黄石市"/utf8>>)};
get_city_info(1703) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"十堰市"/utf8>>)};
get_city_info(1704) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"宜昌市"/utf8>>)};
get_city_info(1705) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"襄阳市"/utf8>>)};
get_city_info(1706) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"鄂州市"/utf8>>)};
get_city_info(1707) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"荆门市"/utf8>>)};
get_city_info(1708) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"孝感市"/utf8>>)};
get_city_info(1709) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"荆州市"/utf8>>)};
get_city_info(1710) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"黄冈市"/utf8>>)};
get_city_info(1711) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"咸宁市"/utf8>>)};
get_city_info(1712) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"随州市"/utf8>>)};
get_city_info(1713) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"恩施"/utf8>>)};
get_city_info(1714) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"仙桃市"/utf8>>)};
get_city_info(1715) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"潜江市"/utf8>>)};
get_city_info(1716) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"天门市"/utf8>>)};
get_city_info(1717) ->
    {lang:get(<<"湖北"/utf8>>), lang:get(<<"神农架"/utf8>>)};
get_city_info(1801) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"长沙市"/utf8>>)};
get_city_info(1802) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"株洲市"/utf8>>)};
get_city_info(1803) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"湘潭市"/utf8>>)};
get_city_info(1804) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"衡阳市"/utf8>>)};
get_city_info(1805) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"邵阳市"/utf8>>)};
get_city_info(1806) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"岳阳市"/utf8>>)};
get_city_info(1807) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"常德市"/utf8>>)};
get_city_info(1808) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"张家界市"/utf8>>)};
get_city_info(1809) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"益阳市"/utf8>>)};
get_city_info(1810) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"郴州市"/utf8>>)};
get_city_info(1811) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"永州市"/utf8>>)};
get_city_info(1812) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"怀化市"/utf8>>)};
get_city_info(1813) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"娄底市"/utf8>>)};
get_city_info(1814) ->
    {lang:get(<<"湖南"/utf8>>), lang:get(<<"湘西"/utf8>>)};
get_city_info(1901) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"广州市"/utf8>>)};
get_city_info(1902) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"韶关市"/utf8>>)};
get_city_info(1903) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"深圳市"/utf8>>)};
get_city_info(1904) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"珠海市"/utf8>>)};
get_city_info(1905) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"汕头市"/utf8>>)};
get_city_info(1906) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"佛山市"/utf8>>)};
get_city_info(1907) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"江门市"/utf8>>)};
get_city_info(1908) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"湛江市"/utf8>>)};
get_city_info(1909) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"茂名市"/utf8>>)};
get_city_info(1910) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"肇庆市"/utf8>>)};
get_city_info(1911) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"惠州市"/utf8>>)};
get_city_info(1912) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"梅州市"/utf8>>)};
get_city_info(1913) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"汕尾市"/utf8>>)};
get_city_info(1914) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"河源市"/utf8>>)};
get_city_info(1915) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"阳江市"/utf8>>)};
get_city_info(1916) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"清远市"/utf8>>)};
get_city_info(1917) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"东莞市"/utf8>>)};
get_city_info(1918) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"中山市"/utf8>>)};
get_city_info(1919) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"潮州市"/utf8>>)};
get_city_info(1920) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"揭阳市"/utf8>>)};
get_city_info(1921) ->
    {lang:get(<<"广东"/utf8>>), lang:get(<<"云浮市"/utf8>>)};
get_city_info(2001) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"南宁市"/utf8>>)};
get_city_info(2002) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"柳州市"/utf8>>)};
get_city_info(2003) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"桂林市"/utf8>>)};
get_city_info(2004) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"梧州市"/utf8>>)};
get_city_info(2005) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"北海市"/utf8>>)};
get_city_info(2006) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"防城港市"/utf8>>)};
get_city_info(2007) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"钦州市"/utf8>>)};
get_city_info(2008) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"贵港市"/utf8>>)};
get_city_info(2009) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"玉林市"/utf8>>)};
get_city_info(2010) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"百色市"/utf8>>)};
get_city_info(2011) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"贺州市"/utf8>>)};
get_city_info(2012) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"河池市"/utf8>>)};
get_city_info(2013) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"来宾市"/utf8>>)};
get_city_info(2014) ->
    {lang:get(<<"广西"/utf8>>), lang:get(<<"崇左市"/utf8>>)};
get_city_info(2101) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"海口市"/utf8>>)};
get_city_info(2102) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"三亚市"/utf8>>)};
get_city_info(2103) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"三沙市"/utf8>>)};
get_city_info(2104) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"儋州市"/utf8>>)};
get_city_info(2105) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"五指山市"/utf8>>)};
get_city_info(2106) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"琼海市"/utf8>>)};
get_city_info(2107) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"文昌市"/utf8>>)};
get_city_info(2108) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"万宁市"/utf8>>)};
get_city_info(2109) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"东方市"/utf8>>)};
get_city_info(2110) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"屯昌"/utf8>>)};
get_city_info(2111) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"澄迈"/utf8>>)};
get_city_info(2112) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"临高"/utf8>>)};
get_city_info(2113) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"白沙"/utf8>>)};
get_city_info(2114) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"昌江"/utf8>>)};
get_city_info(2115) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"乐东"/utf8>>)};
get_city_info(2116) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"陵水"/utf8>>)};
get_city_info(2117) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"保亭"/utf8>>)};
get_city_info(2118) ->
    {lang:get(<<"海南"/utf8>>), lang:get(<<"琼中"/utf8>>)};
get_city_info(2201) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"万州"/utf8>>)};
get_city_info(2202) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"涪陵"/utf8>>)};
get_city_info(2203) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"渝中"/utf8>>)};
get_city_info(2204) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"大渡口"/utf8>>)};
get_city_info(2205) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"江北"/utf8>>)};
get_city_info(2206) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"沙坪坝"/utf8>>)};
get_city_info(2207) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"九龙坡"/utf8>>)};
get_city_info(2208) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"南岸"/utf8>>)};
get_city_info(2209) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"北碚"/utf8>>)};
get_city_info(2210) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"两江新"/utf8>>)};
get_city_info(2211) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"万盛"/utf8>>)};
get_city_info(2212) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"双桥"/utf8>>)};
get_city_info(2213) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"渝北"/utf8>>)};
get_city_info(2214) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"巴南"/utf8>>)};
get_city_info(2215) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"长寿"/utf8>>)};
get_city_info(2216) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"綦江"/utf8>>)};
get_city_info(2217) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"潼南"/utf8>>)};
get_city_info(2218) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"铜梁"/utf8>>)};
get_city_info(2219) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"大足"/utf8>>)};
get_city_info(2220) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"荣昌"/utf8>>)};
get_city_info(2221) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"璧山"/utf8>>)};
get_city_info(2222) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"梁平"/utf8>>)};
get_city_info(2223) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"城口"/utf8>>)};
get_city_info(2224) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"丰都"/utf8>>)};
get_city_info(2225) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"垫江"/utf8>>)};
get_city_info(2226) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"武隆"/utf8>>)};
get_city_info(2227) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"忠县"/utf8>>)};
get_city_info(2228) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"开县"/utf8>>)};
get_city_info(2229) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"云阳"/utf8>>)};
get_city_info(2230) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"奉节"/utf8>>)};
get_city_info(2231) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"巫山"/utf8>>)};
get_city_info(2232) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"巫溪"/utf8>>)};
get_city_info(2233) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"黔江"/utf8>>)};
get_city_info(2234) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"石柱"/utf8>>)};
get_city_info(2235) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"秀山"/utf8>>)};
get_city_info(2236) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"酉阳"/utf8>>)};
get_city_info(2237) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"彭水"/utf8>>)};
get_city_info(2238) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"江津"/utf8>>)};
get_city_info(2239) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"合川"/utf8>>)};
get_city_info(2240) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"永川"/utf8>>)};
get_city_info(2241) ->
    {lang:get(<<"重庆市"/utf8>>), lang:get(<<"南川"/utf8>>)};
get_city_info(2301) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"成都市"/utf8>>)};
get_city_info(2302) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"自贡市"/utf8>>)};
get_city_info(2303) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"攀枝花市"/utf8>>)};
get_city_info(2304) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"泸州市"/utf8>>)};
get_city_info(2305) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"德阳市"/utf8>>)};
get_city_info(2306) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"绵阳市"/utf8>>)};
get_city_info(2307) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"广元市"/utf8>>)};
get_city_info(2308) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"遂宁市"/utf8>>)};
get_city_info(2309) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"内江市"/utf8>>)};
get_city_info(2310) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"乐山市"/utf8>>)};
get_city_info(2311) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"南充市"/utf8>>)};
get_city_info(2312) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"眉山市"/utf8>>)};
get_city_info(2313) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"宜宾市"/utf8>>)};
get_city_info(2314) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"广安市"/utf8>>)};
get_city_info(2315) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"达州市"/utf8>>)};
get_city_info(2316) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"雅安市"/utf8>>)};
get_city_info(2317) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"巴中市"/utf8>>)};
get_city_info(2318) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"资阳市"/utf8>>)};
get_city_info(2319) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"阿坝"/utf8>>)};
get_city_info(2320) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"甘孜"/utf8>>)};
get_city_info(2321) ->
    {lang:get(<<"四川"/utf8>>), lang:get(<<"凉山"/utf8>>)};
get_city_info(2401) ->
    {lang:get(<<"贵州"/utf8>>), lang:get(<<"贵阳市"/utf8>>)};
get_city_info(2402) ->
    {lang:get(<<"贵州"/utf8>>), lang:get(<<"六盘水市"/utf8>>)};
get_city_info(2403) ->
    {lang:get(<<"贵州"/utf8>>), lang:get(<<"遵义市"/utf8>>)};
get_city_info(2404) ->
    {lang:get(<<"贵州"/utf8>>), lang:get(<<"安顺市"/utf8>>)};
get_city_info(2405) ->
    {lang:get(<<"贵州"/utf8>>), lang:get(<<"铜仁市"/utf8>>)};
get_city_info(2406) ->
    {lang:get(<<"贵州"/utf8>>), lang:get(<<"黔西南"/utf8>>)};
get_city_info(2407) ->
    {lang:get(<<"贵州"/utf8>>), lang:get(<<"毕节市"/utf8>>)};
get_city_info(2408) ->
    {lang:get(<<"贵州"/utf8>>), lang:get(<<"黔东南"/utf8>>)};
get_city_info(2409) ->
    {lang:get(<<"贵州"/utf8>>), lang:get(<<"黔南"/utf8>>)};
get_city_info(2501) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"昆明市"/utf8>>)};
get_city_info(2502) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"曲靖市"/utf8>>)};
get_city_info(2503) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"玉溪市"/utf8>>)};
get_city_info(2504) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"保山市"/utf8>>)};
get_city_info(2505) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"昭通市"/utf8>>)};
get_city_info(2506) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"丽江市"/utf8>>)};
get_city_info(2507) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"普洱市"/utf8>>)};
get_city_info(2508) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"临沧市"/utf8>>)};
get_city_info(2509) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"楚雄"/utf8>>)};
get_city_info(2510) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"红河"/utf8>>)};
get_city_info(2511) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"文山"/utf8>>)};
get_city_info(2512) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"西双版纳"/utf8>>)};
get_city_info(2513) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"大理"/utf8>>)};
get_city_info(2514) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"德宏"/utf8>>)};
get_city_info(2515) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"怒江"/utf8>>)};
get_city_info(2516) ->
    {lang:get(<<"云南"/utf8>>), lang:get(<<"迪庆"/utf8>>)};
get_city_info(2601) ->
    {lang:get(<<"西藏"/utf8>>), lang:get(<<"拉萨市"/utf8>>)};
get_city_info(2602) ->
    {lang:get(<<"西藏"/utf8>>), lang:get(<<"昌都市"/utf8>>)};
get_city_info(2603) ->
    {lang:get(<<"西藏"/utf8>>), lang:get(<<"山南市"/utf8>>)};
get_city_info(2604) ->
    {lang:get(<<"西藏"/utf8>>), lang:get(<<"日喀则市"/utf8>>)};
get_city_info(2605) ->
    {lang:get(<<"西藏"/utf8>>), lang:get(<<"那曲地区"/utf8>>)};
get_city_info(2606) ->
    {lang:get(<<"西藏"/utf8>>), lang:get(<<"阿里地区"/utf8>>)};
get_city_info(2607) ->
    {lang:get(<<"西藏"/utf8>>), lang:get(<<"林芝市"/utf8>>)};
get_city_info(2701) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"西安市"/utf8>>)};
get_city_info(2702) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"铜川市"/utf8>>)};
get_city_info(2703) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"宝鸡市"/utf8>>)};
get_city_info(2704) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"咸阳市"/utf8>>)};
get_city_info(2705) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"渭南市"/utf8>>)};
get_city_info(2706) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"延安市"/utf8>>)};
get_city_info(2707) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"汉中市"/utf8>>)};
get_city_info(2708) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"榆林市"/utf8>>)};
get_city_info(2709) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"安康市"/utf8>>)};
get_city_info(2710) ->
    {lang:get(<<"陕西"/utf8>>), lang:get(<<"商洛市"/utf8>>)};
get_city_info(2801) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"兰州市"/utf8>>)};
get_city_info(2802) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"嘉峪关市"/utf8>>)};
get_city_info(2803) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"金昌市"/utf8>>)};
get_city_info(2804) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"白银市"/utf8>>)};
get_city_info(2805) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"天水市"/utf8>>)};
get_city_info(2806) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"武威市"/utf8>>)};
get_city_info(2807) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"张掖市"/utf8>>)};
get_city_info(2808) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"平凉市"/utf8>>)};
get_city_info(2809) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"酒泉市"/utf8>>)};
get_city_info(2810) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"庆阳市"/utf8>>)};
get_city_info(2811) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"定西市"/utf8>>)};
get_city_info(2812) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"陇南市"/utf8>>)};
get_city_info(2813) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"临夏"/utf8>>)};
get_city_info(2814) ->
    {lang:get(<<"甘肃"/utf8>>), lang:get(<<"甘南"/utf8>>)};
get_city_info(2901) ->
    {lang:get(<<"青海"/utf8>>), lang:get(<<"西宁市"/utf8>>)};
get_city_info(2902) ->
    {lang:get(<<"青海"/utf8>>), lang:get(<<"海东市"/utf8>>)};
get_city_info(2903) ->
    {lang:get(<<"青海"/utf8>>), lang:get(<<"海北"/utf8>>)};
get_city_info(2904) ->
    {lang:get(<<"青海"/utf8>>), lang:get(<<"黄南"/utf8>>)};
get_city_info(2905) ->
    {lang:get(<<"青海"/utf8>>), lang:get(<<"海南"/utf8>>)};
get_city_info(2906) ->
    {lang:get(<<"青海"/utf8>>), lang:get(<<"果洛"/utf8>>)};
get_city_info(2907) ->
    {lang:get(<<"青海"/utf8>>), lang:get(<<"玉树"/utf8>>)};
get_city_info(2908) ->
    {lang:get(<<"青海"/utf8>>), lang:get(<<"海西"/utf8>>)};
get_city_info(3001) ->
    {lang:get(<<"宁夏"/utf8>>), lang:get(<<"银川市"/utf8>>)};
get_city_info(3002) ->
    {lang:get(<<"宁夏"/utf8>>), lang:get(<<"石嘴山市"/utf8>>)};
get_city_info(3003) ->
    {lang:get(<<"宁夏"/utf8>>), lang:get(<<"吴忠市"/utf8>>)};
get_city_info(3004) ->
    {lang:get(<<"宁夏"/utf8>>), lang:get(<<"固原市"/utf8>>)};
get_city_info(3005) ->
    {lang:get(<<"宁夏"/utf8>>), lang:get(<<"中卫市"/utf8>>)};
get_city_info(3101) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"乌鲁木齐市"/utf8>>)};
get_city_info(3102) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"克拉玛依市"/utf8>>)};
get_city_info(3103) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"吐鲁番市"/utf8>>)};
get_city_info(3104) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"哈密市"/utf8>>)};
get_city_info(3105) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"昌吉"/utf8>>)};
get_city_info(3106) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"博尔塔拉"/utf8>>)};
get_city_info(3107) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"巴音郭楞"/utf8>>)};
get_city_info(3108) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"阿克苏"/utf8>>)};
get_city_info(3109) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"克孜勒苏"/utf8>>)};
get_city_info(3110) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"喀什"/utf8>>)};
get_city_info(3111) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"和田"/utf8>>)};
get_city_info(3112) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"伊犁"/utf8>>)};
get_city_info(3113) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"塔城"/utf8>>)};
get_city_info(3114) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"阿勒泰"/utf8>>)};
get_city_info(3115) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"石河子市"/utf8>>)};
get_city_info(3116) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"阿拉尔市"/utf8>>)};
get_city_info(3117) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"图木舒克市"/utf8>>)};
get_city_info(3118) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"五家渠市"/utf8>>)};
get_city_info(3119) ->
    {lang:get(<<"新疆"/utf8>>), lang:get(<<"北屯市"/utf8>>)};
get_city_info(3201) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"台北市"/utf8>>)};
get_city_info(3202) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"高雄市"/utf8>>)};
get_city_info(3203) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"基隆市"/utf8>>)};
get_city_info(3204) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"台中市"/utf8>>)};
get_city_info(3205) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"台南市"/utf8>>)};
get_city_info(3206) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"新北市"/utf8>>)};
get_city_info(3207) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"桃园市"/utf8>>)};
get_city_info(3208) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"新竹市"/utf8>>)};
get_city_info(3209) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"嘉义市"/utf8>>)};
get_city_info(3210) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"新北市"/utf8>>)};
get_city_info(3211) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"宜兰县"/utf8>>)};
get_city_info(3212) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"桃源县"/utf8>>)};
get_city_info(3213) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"新竹县"/utf8>>)};
get_city_info(3214) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"苗栗县"/utf8>>)};
get_city_info(3215) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"台中县"/utf8>>)};
get_city_info(3216) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"彰化县"/utf8>>)};
get_city_info(3217) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"南投县"/utf8>>)};
get_city_info(3218) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"云林县"/utf8>>)};
get_city_info(3219) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"嘉义县"/utf8>>)};
get_city_info(3220) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"台南县"/utf8>>)};
get_city_info(3221) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"高雄县"/utf8>>)};
get_city_info(3222) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"屏东县"/utf8>>)};
get_city_info(3223) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"台东县"/utf8>>)};
get_city_info(3224) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"花莲县"/utf8>>)};
get_city_info(3225) ->
    {lang:get(<<"台湾"/utf8>>), lang:get(<<"澎湖县"/utf8>>)};
get_city_info(3301) ->
    {lang:get(<<"香港"/utf8>>), lang:get(<<"特别行政区"/utf8>>)};
get_city_info(3401) ->
    {lang:get(<<"澳门"/utf8>>), lang:get(<<"特别行政区"/utf8>>)};
get_city_info(_) -> undefined.


