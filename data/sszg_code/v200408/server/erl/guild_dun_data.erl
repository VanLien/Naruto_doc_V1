-file("data/guild_dun_data.erl", 1).

-file("src/mod/data/guild_dun_data.erl", 1).

-module(guild_dun_data).

-lager_records([]).

-export([get_all_fid/0, get_boss_ids/1, get_unit_id/1,
	 get_f_id/1, get_boss_name/1, get_limit_lv/1,
	 get_rep_award/1, get_award/1, get_guild_exp/1,
	 get_box_award/1, get_max_buff_lev/0,
	 get_buff_add_time/1, get_buff_add_attr/1, const/1,
	 get_expend_by_count/1, get_buy_count_by_vip/1,
	 get_buy_count/0, get_award_by_rank/1]).

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

-file("src/mod/data/guild_dun_data.erl", 27).

get_all_fid() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
     17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
     31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44,
     45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
     59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72,
     73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86,
     87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100,
     101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
     112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122,
     123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133,
     134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144,
     145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155,
     156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166,
     167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177,
     178, 179, 180].

get_boss_ids(1) -> [{101, 1000000}];
get_boss_ids(2) -> [{201, 2000000}];
get_boss_ids(3) -> [{301, 3500000}];
get_boss_ids(4) -> [{401, 5500000}];
get_boss_ids(5) -> [{501, 8000000}];
get_boss_ids(6) -> [{601, 11000000}];
get_boss_ids(7) -> [{701, 14500000}];
get_boss_ids(8) -> [{801, 18500000}];
get_boss_ids(9) -> [{901, 23000000}];
get_boss_ids(10) -> [{1001, 28000000}];
get_boss_ids(11) -> [{1101, 33500000}];
get_boss_ids(12) -> [{1201, 39500000}];
get_boss_ids(13) -> [{1301, 46000000}];
get_boss_ids(14) -> [{1401, 53000000}];
get_boss_ids(15) -> [{1501, 60500000}];
get_boss_ids(16) -> [{1601, 68500000}];
get_boss_ids(17) -> [{1701, 77000000}];
get_boss_ids(18) -> [{1801, 86000000}];
get_boss_ids(19) -> [{1901, 95500000}];
get_boss_ids(20) -> [{2001, 105500000}];
get_boss_ids(21) -> [{2101, 116000000}];
get_boss_ids(22) -> [{2201, 127000000}];
get_boss_ids(23) -> [{2301, 138500000}];
get_boss_ids(24) -> [{2401, 150500000}];
get_boss_ids(25) -> [{2501, 163000000}];
get_boss_ids(26) -> [{2601, 176000000}];
get_boss_ids(27) -> [{2701, 189500000}];
get_boss_ids(28) -> [{2801, 203500000}];
get_boss_ids(29) -> [{2901, 218000000}];
get_boss_ids(30) -> [{3001, 233000000}];
get_boss_ids(31) -> [{3101, 248500000}];
get_boss_ids(32) -> [{3201, 264500000}];
get_boss_ids(33) -> [{3301, 281000000}];
get_boss_ids(34) -> [{3401, 298000000}];
get_boss_ids(35) -> [{3501, 315500000}];
get_boss_ids(36) -> [{3601, 333500000}];
get_boss_ids(37) -> [{3701, 352000000}];
get_boss_ids(38) -> [{3801, 371000000}];
get_boss_ids(39) -> [{3901, 390500000}];
get_boss_ids(40) -> [{4001, 410500000}];
get_boss_ids(41) -> [{4101, 431000000}];
get_boss_ids(42) -> [{4201, 452000000}];
get_boss_ids(43) -> [{4301, 473500000}];
get_boss_ids(44) -> [{4401, 495500000}];
get_boss_ids(45) -> [{4501, 518000000}];
get_boss_ids(46) -> [{4601, 541000000}];
get_boss_ids(47) -> [{4701, 564500000}];
get_boss_ids(48) -> [{4801, 588500000}];
get_boss_ids(49) -> [{4901, 613000000}];
get_boss_ids(50) -> [{5001, 638000000}];
get_boss_ids(51) -> [{5101, 663500000}];
get_boss_ids(52) -> [{5201, 689500000}];
get_boss_ids(53) -> [{5301, 716000000}];
get_boss_ids(54) -> [{5401, 743000000}];
get_boss_ids(55) -> [{5501, 770500000}];
get_boss_ids(56) -> [{5601, 798500000}];
get_boss_ids(57) -> [{5701, 827000000}];
get_boss_ids(58) -> [{5801, 856000000}];
get_boss_ids(59) -> [{5901, 885500000}];
get_boss_ids(60) -> [{6001, 915500000}];
get_boss_ids(61) -> [{6101, 946000000}];
get_boss_ids(62) -> [{6201, 977000000}];
get_boss_ids(63) -> [{6301, 1008500000}];
get_boss_ids(64) -> [{6401, 1040500000}];
get_boss_ids(65) -> [{6501, 1073000000}];
get_boss_ids(66) -> [{6601, 1106000000}];
get_boss_ids(67) -> [{6701, 1139500000}];
get_boss_ids(68) -> [{6801, 1173500000}];
get_boss_ids(69) -> [{6901, 1208000000}];
get_boss_ids(70) -> [{7001, 1243000000}];
get_boss_ids(71) -> [{7101, 1279000000}];
get_boss_ids(72) -> [{7201, 1316000000}];
get_boss_ids(73) -> [{7301, 1354000000}];
get_boss_ids(74) -> [{7401, 1393000000}];
get_boss_ids(75) -> [{7501, 1433000000}];
get_boss_ids(76) -> [{7601, 1474500000}];
get_boss_ids(77) -> [{7701, 1517500000}];
get_boss_ids(78) -> [{7801, 1562000000}];
get_boss_ids(79) -> [{7901, 1608000000}];
get_boss_ids(80) -> [{8001, 1655500000}];
get_boss_ids(81) -> [{8101, 1705500000}];
get_boss_ids(82) -> [{8201, 1758000000}];
get_boss_ids(83) -> [{8301, 1813000000}];
get_boss_ids(84) -> [{8401, 1870500000}];
get_boss_ids(85) -> [{8501, 1930500000}];
get_boss_ids(86) -> [{8601, 1993000000}];
get_boss_ids(87) -> [{8701, 2058000000}];
get_boss_ids(88) -> [{8801, 2125500000}];
get_boss_ids(89) -> [{8901, 2195500000}];
get_boss_ids(90) -> [{9001, 2268000000}];
get_boss_ids(91) -> [{9101, 2343000000}];
get_boss_ids(92) -> [{9201, 2420500000}];
get_boss_ids(93) -> [{9301, 2500500000}];
get_boss_ids(94) -> [{9401, 2583000000}];
get_boss_ids(95) -> [{9501, 2668000000}];
get_boss_ids(96) -> [{9601, 2755500000}];
get_boss_ids(97) -> [{9701, 2845500000}];
get_boss_ids(98) -> [{9801, 2938000000}];
get_boss_ids(99) -> [{9901, 3033000000}];
get_boss_ids(100) -> [{10001, 3130500000}];
get_boss_ids(101) -> [{10101, 3230500000}];
get_boss_ids(102) -> [{10201, 3333000000}];
get_boss_ids(103) -> [{10301, 3438000000}];
get_boss_ids(104) -> [{10401, 3545500000}];
get_boss_ids(105) -> [{10501, 3655500000}];
get_boss_ids(106) -> [{10601, 3768000000}];
get_boss_ids(107) -> [{10701, 3883000000}];
get_boss_ids(108) -> [{10801, 4000500000}];
get_boss_ids(109) -> [{10901, 4120500000}];
get_boss_ids(110) -> [{11001, 4243000000}];
get_boss_ids(111) -> [{11101, 4243000000}];
get_boss_ids(112) -> [{11201, 4243000000}];
get_boss_ids(113) -> [{11301, 4243000000}];
get_boss_ids(114) -> [{11401, 4243000000}];
get_boss_ids(115) -> [{11501, 4243000000}];
get_boss_ids(116) -> [{11601, 4243000000}];
get_boss_ids(117) -> [{11701, 4243000000}];
get_boss_ids(118) -> [{11801, 4243000000}];
get_boss_ids(119) -> [{11901, 4243000000}];
get_boss_ids(120) -> [{12001, 4243000000}];
get_boss_ids(121) -> [{12101, 4243000000}];
get_boss_ids(122) -> [{12201, 4243000000}];
get_boss_ids(123) -> [{12301, 4243000000}];
get_boss_ids(124) -> [{12401, 4243000000}];
get_boss_ids(125) -> [{12501, 4243000000}];
get_boss_ids(126) -> [{12601, 4243000000}];
get_boss_ids(127) -> [{12701, 4243000000}];
get_boss_ids(128) -> [{12801, 4243000000}];
get_boss_ids(129) -> [{12901, 4243000000}];
get_boss_ids(130) -> [{13001, 4243000000}];
get_boss_ids(131) -> [{13101, 4243000000}];
get_boss_ids(132) -> [{13201, 4243000000}];
get_boss_ids(133) -> [{13301, 4243000000}];
get_boss_ids(134) -> [{13401, 4243000000}];
get_boss_ids(135) -> [{13501, 4243000000}];
get_boss_ids(136) -> [{13601, 4243000000}];
get_boss_ids(137) -> [{13701, 4243000000}];
get_boss_ids(138) -> [{13801, 4243000000}];
get_boss_ids(139) -> [{13901, 4243000000}];
get_boss_ids(140) -> [{14001, 4243000000}];
get_boss_ids(141) -> [{14101, 4243000000}];
get_boss_ids(142) -> [{14201, 4243000000}];
get_boss_ids(143) -> [{14301, 4243000000}];
get_boss_ids(144) -> [{14401, 4243000000}];
get_boss_ids(145) -> [{14501, 4243000000}];
get_boss_ids(146) -> [{14601, 4243000000}];
get_boss_ids(147) -> [{14701, 4243000000}];
get_boss_ids(148) -> [{14801, 4243000000}];
get_boss_ids(149) -> [{14901, 4243000000}];
get_boss_ids(150) -> [{15001, 4243000000}];
get_boss_ids(151) -> [{15101, 4243000000}];
get_boss_ids(152) -> [{15201, 4243000000}];
get_boss_ids(153) -> [{15301, 4243000000}];
get_boss_ids(154) -> [{15401, 4243000000}];
get_boss_ids(155) -> [{15501, 4243000000}];
get_boss_ids(156) -> [{15601, 4243000000}];
get_boss_ids(157) -> [{15701, 4243000000}];
get_boss_ids(158) -> [{15801, 4243000000}];
get_boss_ids(159) -> [{15901, 4243000000}];
get_boss_ids(160) -> [{16001, 4243000000}];
get_boss_ids(161) -> [{16101, 4243000000}];
get_boss_ids(162) -> [{16201, 4243000000}];
get_boss_ids(163) -> [{16301, 4243000000}];
get_boss_ids(164) -> [{16401, 4243000000}];
get_boss_ids(165) -> [{16501, 4243000000}];
get_boss_ids(166) -> [{16601, 4243000000}];
get_boss_ids(167) -> [{16701, 4243000000}];
get_boss_ids(168) -> [{16801, 4243000000}];
get_boss_ids(169) -> [{16901, 4243000000}];
get_boss_ids(170) -> [{17001, 4243000000}];
get_boss_ids(171) -> [{17101, 4243000000}];
get_boss_ids(172) -> [{17201, 4243000000}];
get_boss_ids(173) -> [{17301, 4243000000}];
get_boss_ids(174) -> [{17401, 4243000000}];
get_boss_ids(175) -> [{17501, 4243000000}];
get_boss_ids(176) -> [{17601, 4243000000}];
get_boss_ids(177) -> [{17701, 4243000000}];
get_boss_ids(178) -> [{17801, 4243000000}];
get_boss_ids(179) -> [{17901, 4243000000}];
get_boss_ids(180) -> [{18001, 4243000000}];
get_boss_ids(_) -> [].

get_unit_id(101) -> 50101;
get_unit_id(201) -> 50102;
get_unit_id(301) -> 50103;
get_unit_id(401) -> 50104;
get_unit_id(501) -> 50105;
get_unit_id(601) -> 50106;
get_unit_id(701) -> 50107;
get_unit_id(801) -> 50108;
get_unit_id(901) -> 50109;
get_unit_id(1001) -> 50110;
get_unit_id(1101) -> 50111;
get_unit_id(1201) -> 50112;
get_unit_id(1301) -> 50113;
get_unit_id(1401) -> 50114;
get_unit_id(1501) -> 50115;
get_unit_id(1601) -> 50116;
get_unit_id(1701) -> 50117;
get_unit_id(1801) -> 50118;
get_unit_id(1901) -> 50119;
get_unit_id(2001) -> 50120;
get_unit_id(2101) -> 50121;
get_unit_id(2201) -> 50122;
get_unit_id(2301) -> 50123;
get_unit_id(2401) -> 50124;
get_unit_id(2501) -> 50125;
get_unit_id(2601) -> 50126;
get_unit_id(2701) -> 50127;
get_unit_id(2801) -> 50128;
get_unit_id(2901) -> 50129;
get_unit_id(3001) -> 50130;
get_unit_id(3101) -> 50131;
get_unit_id(3201) -> 50132;
get_unit_id(3301) -> 50133;
get_unit_id(3401) -> 50134;
get_unit_id(3501) -> 50135;
get_unit_id(3601) -> 50136;
get_unit_id(3701) -> 50137;
get_unit_id(3801) -> 50138;
get_unit_id(3901) -> 50139;
get_unit_id(4001) -> 50140;
get_unit_id(4101) -> 50141;
get_unit_id(4201) -> 50142;
get_unit_id(4301) -> 50143;
get_unit_id(4401) -> 50144;
get_unit_id(4501) -> 50145;
get_unit_id(4601) -> 50146;
get_unit_id(4701) -> 50147;
get_unit_id(4801) -> 50148;
get_unit_id(4901) -> 50149;
get_unit_id(5001) -> 50150;
get_unit_id(5101) -> 50151;
get_unit_id(5201) -> 50152;
get_unit_id(5301) -> 50153;
get_unit_id(5401) -> 50154;
get_unit_id(5501) -> 50155;
get_unit_id(5601) -> 50156;
get_unit_id(5701) -> 50157;
get_unit_id(5801) -> 50158;
get_unit_id(5901) -> 50159;
get_unit_id(6001) -> 50160;
get_unit_id(6101) -> 50161;
get_unit_id(6201) -> 50162;
get_unit_id(6301) -> 50163;
get_unit_id(6401) -> 50164;
get_unit_id(6501) -> 50165;
get_unit_id(6601) -> 50166;
get_unit_id(6701) -> 50167;
get_unit_id(6801) -> 50168;
get_unit_id(6901) -> 50169;
get_unit_id(7001) -> 50170;
get_unit_id(7101) -> 50171;
get_unit_id(7201) -> 50172;
get_unit_id(7301) -> 50173;
get_unit_id(7401) -> 50174;
get_unit_id(7501) -> 50175;
get_unit_id(7601) -> 50176;
get_unit_id(7701) -> 50177;
get_unit_id(7801) -> 50178;
get_unit_id(7901) -> 50179;
get_unit_id(8001) -> 50180;
get_unit_id(8101) -> 50181;
get_unit_id(8201) -> 50182;
get_unit_id(8301) -> 50183;
get_unit_id(8401) -> 50184;
get_unit_id(8501) -> 50185;
get_unit_id(8601) -> 50186;
get_unit_id(8701) -> 50187;
get_unit_id(8801) -> 50188;
get_unit_id(8901) -> 50189;
get_unit_id(9001) -> 50190;
get_unit_id(9101) -> 50191;
get_unit_id(9201) -> 50192;
get_unit_id(9301) -> 50193;
get_unit_id(9401) -> 50194;
get_unit_id(9501) -> 50195;
get_unit_id(9601) -> 50196;
get_unit_id(9701) -> 50197;
get_unit_id(9801) -> 50198;
get_unit_id(9901) -> 50199;
get_unit_id(10001) -> 50200;
get_unit_id(10101) -> 50201;
get_unit_id(10201) -> 50202;
get_unit_id(10301) -> 50203;
get_unit_id(10401) -> 50204;
get_unit_id(10501) -> 50205;
get_unit_id(10601) -> 50206;
get_unit_id(10701) -> 50207;
get_unit_id(10801) -> 50208;
get_unit_id(10901) -> 50209;
get_unit_id(11001) -> 50210;
get_unit_id(11101) -> 50211;
get_unit_id(11201) -> 50212;
get_unit_id(11301) -> 50213;
get_unit_id(11401) -> 50214;
get_unit_id(11501) -> 50215;
get_unit_id(11601) -> 50216;
get_unit_id(11701) -> 50217;
get_unit_id(11801) -> 50218;
get_unit_id(11901) -> 50219;
get_unit_id(12001) -> 50220;
get_unit_id(12101) -> 50221;
get_unit_id(12201) -> 50222;
get_unit_id(12301) -> 50223;
get_unit_id(12401) -> 50224;
get_unit_id(12501) -> 50225;
get_unit_id(12601) -> 50226;
get_unit_id(12701) -> 50227;
get_unit_id(12801) -> 50228;
get_unit_id(12901) -> 50229;
get_unit_id(13001) -> 50230;
get_unit_id(13101) -> 50231;
get_unit_id(13201) -> 50232;
get_unit_id(13301) -> 50233;
get_unit_id(13401) -> 50234;
get_unit_id(13501) -> 50235;
get_unit_id(13601) -> 50236;
get_unit_id(13701) -> 50237;
get_unit_id(13801) -> 50238;
get_unit_id(13901) -> 50239;
get_unit_id(14001) -> 50240;
get_unit_id(14101) -> 50241;
get_unit_id(14201) -> 50242;
get_unit_id(14301) -> 50243;
get_unit_id(14401) -> 50244;
get_unit_id(14501) -> 50245;
get_unit_id(14601) -> 50246;
get_unit_id(14701) -> 50247;
get_unit_id(14801) -> 50248;
get_unit_id(14901) -> 50249;
get_unit_id(15001) -> 50250;
get_unit_id(15101) -> 50251;
get_unit_id(15201) -> 50252;
get_unit_id(15301) -> 50253;
get_unit_id(15401) -> 50254;
get_unit_id(15501) -> 50255;
get_unit_id(15601) -> 50256;
get_unit_id(15701) -> 50257;
get_unit_id(15801) -> 50258;
get_unit_id(15901) -> 50259;
get_unit_id(16001) -> 50260;
get_unit_id(16101) -> 50261;
get_unit_id(16201) -> 50262;
get_unit_id(16301) -> 50263;
get_unit_id(16401) -> 50264;
get_unit_id(16501) -> 50265;
get_unit_id(16601) -> 50266;
get_unit_id(16701) -> 50267;
get_unit_id(16801) -> 50268;
get_unit_id(16901) -> 50269;
get_unit_id(17001) -> 50270;
get_unit_id(17101) -> 50271;
get_unit_id(17201) -> 50272;
get_unit_id(17301) -> 50273;
get_unit_id(17401) -> 50274;
get_unit_id(17501) -> 50275;
get_unit_id(17601) -> 50276;
get_unit_id(17701) -> 50277;
get_unit_id(17801) -> 50278;
get_unit_id(17901) -> 50279;
get_unit_id(18001) -> 50280;
get_unit_id(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_data392, _,
       {__Levelguild_dun_data392, __Tracesguild_dun_data392}}
	  when __Levelguild_dun_data392 band 8 /= 0 orelse
		 __Tracesguild_dun_data392 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_data}, {function, get_unit_id},
			{line, 392}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_unit_id_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelguild_dun_data392,
		       __Tracesguild_dun_data392, lager_event,
		       __Pidguild_dun_data392);
      _ -> ok
    end,
    undefined.

get_f_id(101) -> 1;
get_f_id(201) -> 2;
get_f_id(301) -> 3;
get_f_id(401) -> 4;
get_f_id(501) -> 5;
get_f_id(601) -> 6;
get_f_id(701) -> 7;
get_f_id(801) -> 8;
get_f_id(901) -> 9;
get_f_id(1001) -> 10;
get_f_id(1101) -> 11;
get_f_id(1201) -> 12;
get_f_id(1301) -> 13;
get_f_id(1401) -> 14;
get_f_id(1501) -> 15;
get_f_id(1601) -> 16;
get_f_id(1701) -> 17;
get_f_id(1801) -> 18;
get_f_id(1901) -> 19;
get_f_id(2001) -> 20;
get_f_id(2101) -> 21;
get_f_id(2201) -> 22;
get_f_id(2301) -> 23;
get_f_id(2401) -> 24;
get_f_id(2501) -> 25;
get_f_id(2601) -> 26;
get_f_id(2701) -> 27;
get_f_id(2801) -> 28;
get_f_id(2901) -> 29;
get_f_id(3001) -> 30;
get_f_id(3101) -> 31;
get_f_id(3201) -> 32;
get_f_id(3301) -> 33;
get_f_id(3401) -> 34;
get_f_id(3501) -> 35;
get_f_id(3601) -> 36;
get_f_id(3701) -> 37;
get_f_id(3801) -> 38;
get_f_id(3901) -> 39;
get_f_id(4001) -> 40;
get_f_id(4101) -> 41;
get_f_id(4201) -> 42;
get_f_id(4301) -> 43;
get_f_id(4401) -> 44;
get_f_id(4501) -> 45;
get_f_id(4601) -> 46;
get_f_id(4701) -> 47;
get_f_id(4801) -> 48;
get_f_id(4901) -> 49;
get_f_id(5001) -> 50;
get_f_id(5101) -> 51;
get_f_id(5201) -> 52;
get_f_id(5301) -> 53;
get_f_id(5401) -> 54;
get_f_id(5501) -> 55;
get_f_id(5601) -> 56;
get_f_id(5701) -> 57;
get_f_id(5801) -> 58;
get_f_id(5901) -> 59;
get_f_id(6001) -> 60;
get_f_id(6101) -> 61;
get_f_id(6201) -> 62;
get_f_id(6301) -> 63;
get_f_id(6401) -> 64;
get_f_id(6501) -> 65;
get_f_id(6601) -> 66;
get_f_id(6701) -> 67;
get_f_id(6801) -> 68;
get_f_id(6901) -> 69;
get_f_id(7001) -> 70;
get_f_id(7101) -> 71;
get_f_id(7201) -> 72;
get_f_id(7301) -> 73;
get_f_id(7401) -> 74;
get_f_id(7501) -> 75;
get_f_id(7601) -> 76;
get_f_id(7701) -> 77;
get_f_id(7801) -> 78;
get_f_id(7901) -> 79;
get_f_id(8001) -> 80;
get_f_id(8101) -> 81;
get_f_id(8201) -> 82;
get_f_id(8301) -> 83;
get_f_id(8401) -> 84;
get_f_id(8501) -> 85;
get_f_id(8601) -> 86;
get_f_id(8701) -> 87;
get_f_id(8801) -> 88;
get_f_id(8901) -> 89;
get_f_id(9001) -> 90;
get_f_id(9101) -> 91;
get_f_id(9201) -> 92;
get_f_id(9301) -> 93;
get_f_id(9401) -> 94;
get_f_id(9501) -> 95;
get_f_id(9601) -> 96;
get_f_id(9701) -> 97;
get_f_id(9801) -> 98;
get_f_id(9901) -> 99;
get_f_id(10001) -> 100;
get_f_id(10101) -> 101;
get_f_id(10201) -> 102;
get_f_id(10301) -> 103;
get_f_id(10401) -> 104;
get_f_id(10501) -> 105;
get_f_id(10601) -> 106;
get_f_id(10701) -> 107;
get_f_id(10801) -> 108;
get_f_id(10901) -> 109;
get_f_id(11001) -> 110;
get_f_id(11101) -> 111;
get_f_id(11201) -> 112;
get_f_id(11301) -> 113;
get_f_id(11401) -> 114;
get_f_id(11501) -> 115;
get_f_id(11601) -> 116;
get_f_id(11701) -> 117;
get_f_id(11801) -> 118;
get_f_id(11901) -> 119;
get_f_id(12001) -> 120;
get_f_id(12101) -> 121;
get_f_id(12201) -> 122;
get_f_id(12301) -> 123;
get_f_id(12401) -> 124;
get_f_id(12501) -> 125;
get_f_id(12601) -> 126;
get_f_id(12701) -> 127;
get_f_id(12801) -> 128;
get_f_id(12901) -> 129;
get_f_id(13001) -> 130;
get_f_id(13101) -> 131;
get_f_id(13201) -> 132;
get_f_id(13301) -> 133;
get_f_id(13401) -> 134;
get_f_id(13501) -> 135;
get_f_id(13601) -> 136;
get_f_id(13701) -> 137;
get_f_id(13801) -> 138;
get_f_id(13901) -> 139;
get_f_id(14001) -> 140;
get_f_id(14101) -> 141;
get_f_id(14201) -> 142;
get_f_id(14301) -> 143;
get_f_id(14401) -> 144;
get_f_id(14501) -> 145;
get_f_id(14601) -> 146;
get_f_id(14701) -> 147;
get_f_id(14801) -> 148;
get_f_id(14901) -> 149;
get_f_id(15001) -> 150;
get_f_id(15101) -> 151;
get_f_id(15201) -> 152;
get_f_id(15301) -> 153;
get_f_id(15401) -> 154;
get_f_id(15501) -> 155;
get_f_id(15601) -> 156;
get_f_id(15701) -> 157;
get_f_id(15801) -> 158;
get_f_id(15901) -> 159;
get_f_id(16001) -> 160;
get_f_id(16101) -> 161;
get_f_id(16201) -> 162;
get_f_id(16301) -> 163;
get_f_id(16401) -> 164;
get_f_id(16501) -> 165;
get_f_id(16601) -> 166;
get_f_id(16701) -> 167;
get_f_id(16801) -> 168;
get_f_id(16901) -> 169;
get_f_id(17001) -> 170;
get_f_id(17101) -> 171;
get_f_id(17201) -> 172;
get_f_id(17301) -> 173;
get_f_id(17401) -> 174;
get_f_id(17501) -> 175;
get_f_id(17601) -> 176;
get_f_id(17701) -> 177;
get_f_id(17801) -> 178;
get_f_id(17901) -> 179;
get_f_id(18001) -> 180;
get_f_id(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_data574, _,
       {__Levelguild_dun_data574, __Tracesguild_dun_data574}}
	  when __Levelguild_dun_data574 band 8 /= 0 orelse
		 __Tracesguild_dun_data574 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_data}, {function, get_f_id},
			{line, 574}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_f_id_data_not_exist===>~w", [_Info]),
		       none, 4096, 8, __Levelguild_dun_data574,
		       __Tracesguild_dun_data574, lager_event,
		       __Pidguild_dun_data574);
      _ -> ok
    end,
    undefined.

get_boss_name(101) -> lang:get(<<"莉莉丝"/utf8>>);
get_boss_name(201) -> lang:get(<<"地狱犬"/utf8>>);
get_boss_name(301) -> lang:get(<<"精灵射手"/utf8>>);
get_boss_name(401) -> lang:get(<<"精灵希尔"/utf8>>);
get_boss_name(501) -> lang:get(<<"巫女"/utf8>>);
get_boss_name(601) -> lang:get(<<"光之苏尔"/utf8>>);
get_boss_name(701) -> lang:get(<<"暗影剑士"/utf8>>);
get_boss_name(801) -> lang:get(<<"风暴猎手"/utf8>>);
get_boss_name(901) -> lang:get(<<"地狱火"/utf8>>);
get_boss_name(1001) -> lang:get(<<"水元素"/utf8>>);
get_boss_name(1101) -> lang:get(<<"火枪艾克"/utf8>>);
get_boss_name(1201) -> lang:get(<<"甘道夫"/utf8>>);
get_boss_name(1301) -> lang:get(<<"丘比特"/utf8>>);
get_boss_name(1401) -> lang:get(<<"死亡骑士"/utf8>>);
get_boss_name(1501) -> lang:get(<<"普罗米修斯"/utf8>>);
get_boss_name(1601) -> lang:get(<<"竖琴海妖"/utf8>>);
get_boss_name(1701) -> lang:get(<<"圣锤提尔"/utf8>>);
get_boss_name(1801) -> lang:get(<<"亚瑟"/utf8>>);
get_boss_name(1901) -> lang:get(<<"翼女"/utf8>>);
get_boss_name(2001) -> lang:get(<<"伊西斯"/utf8>>);
get_boss_name(2101) -> lang:get(<<"蛇女墨莎"/utf8>>);
get_boss_name(2201) -> lang:get(<<"冰晶魔法师"/utf8>>);
get_boss_name(2301) -> lang:get(<<"炽天使"/utf8>>);
get_boss_name(2401) -> lang:get(<<"美杜莎"/utf8>>);
get_boss_name(2501) -> lang:get(<<"凯瑟琳"/utf8>>);
get_boss_name(2601) -> lang:get(<<"波塞冬"/utf8>>);
get_boss_name(2701) -> lang:get(<<"路西法"/utf8>>);
get_boss_name(2801) -> lang:get(<<"盖亚"/utf8>>);
get_boss_name(2901) -> lang:get(<<"奥丁"/utf8>>);
get_boss_name(3001) -> lang:get(<<"阿波罗"/utf8>>);
get_boss_name(3101) -> lang:get(<<"阿瑞斯"/utf8>>);
get_boss_name(3201) -> lang:get(<<"吸血伯爵"/utf8>>);
get_boss_name(3301) -> lang:get(<<"亡灵收割者"/utf8>>);
get_boss_name(3401) -> lang:get(<<"阿努比斯"/utf8>>);
get_boss_name(3501) -> lang:get(<<"赫拉"/utf8>>);
get_boss_name(3601) -> lang:get(<<"普罗米修斯"/utf8>>);
get_boss_name(3701) -> lang:get(<<"少年梅林"/utf8>>);
get_boss_name(3801) -> lang:get(<<"魅魔女王"/utf8>>);
get_boss_name(3901) -> lang:get(<<"海宁芙"/utf8>>);
get_boss_name(4001) -> lang:get(<<"剑豪卡赞"/utf8>>);
get_boss_name(4101) -> lang:get(<<"哈迪斯"/utf8>>);
get_boss_name(4201) -> lang:get(<<"艾蕾莉亚"/utf8>>);
get_boss_name(4301) -> lang:get(<<"波塞冬"/utf8>>);
get_boss_name(4401) -> lang:get(<<"炎魔之王"/utf8>>);
get_boss_name(4501) -> lang:get(<<"潘"/utf8>>);
get_boss_name(4601) -> lang:get(<<"宙斯"/utf8>>);
get_boss_name(4701) -> lang:get(<<"黑暗之主"/utf8>>);
get_boss_name(4801) -> lang:get(<<"斯芬克斯"/utf8>>);
get_boss_name(4901) -> lang:get(<<"冰霜巨龙"/utf8>>);
get_boss_name(5001) -> lang:get(<<"瓦尔基里"/utf8>>);
get_boss_name(5101) -> lang:get(<<"奥丁"/utf8>>);
get_boss_name(5201) -> lang:get(<<"阿波罗"/utf8>>);
get_boss_name(5301) -> lang:get(<<"娜迦公主"/utf8>>);
get_boss_name(5401) -> lang:get(<<"雷神"/utf8>>);
get_boss_name(5501) -> lang:get(<<"潘多拉"/utf8>>);
get_boss_name(5601) -> lang:get(<<"雅典娜"/utf8>>);
get_boss_name(5701) -> lang:get(<<"炽天使"/utf8>>);
get_boss_name(5801) -> lang:get(<<"冰雪女王"/utf8>>);
get_boss_name(5901) -> lang:get(<<"艾蕾莉亚"/utf8>>);
get_boss_name(6001) -> lang:get(<<"哈迪斯"/utf8>>);
get_boss_name(6101) -> lang:get(<<"魅魔女王"/utf8>>);
get_boss_name(6201) -> lang:get(<<"阿瑞斯"/utf8>>);
get_boss_name(6301) -> lang:get(<<"神灵大祭司"/utf8>>);
get_boss_name(6401) -> lang:get(<<"阿努比斯"/utf8>>);
get_boss_name(6501) -> lang:get(<<"潘"/utf8>>);
get_boss_name(6601) -> lang:get(<<"宙斯"/utf8>>);
get_boss_name(6701) -> lang:get(<<"黑暗之主"/utf8>>);
get_boss_name(6801) -> lang:get(<<"斯芬克斯"/utf8>>);
get_boss_name(6901) -> lang:get(<<"耶梦加得"/utf8>>);
get_boss_name(7001) -> lang:get(<<"洛基"/utf8>>);
get_boss_name(7101) -> lang:get(<<"拉塔托斯克"/utf8>>);
get_boss_name(7201) -> lang:get(<<"吸血伯爵"/utf8>>);
get_boss_name(7301) -> lang:get(<<"冰霜巨龙"/utf8>>);
get_boss_name(7401) -> lang:get(<<"芬尼尔"/utf8>>);
get_boss_name(7501) -> lang:get(<<"炎魔之王"/utf8>>);
get_boss_name(7601) -> lang:get(<<"阿波罗"/utf8>>);
get_boss_name(7701) -> lang:get(<<"海拉"/utf8>>);
get_boss_name(7801) -> lang:get(<<"少年梅林"/utf8>>);
get_boss_name(7901) -> lang:get(<<"娜迦公主"/utf8>>);
get_boss_name(8001) -> lang:get(<<"普罗米修斯"/utf8>>);
get_boss_name(8101) -> lang:get(<<"哈迪斯"/utf8>>);
get_boss_name(8201) -> lang:get(<<"耶梦加得"/utf8>>);
get_boss_name(8301) -> lang:get(<<"哪吒"/utf8>>);
get_boss_name(8401) -> lang:get(<<"拉塔托斯克"/utf8>>);
get_boss_name(8501) -> lang:get(<<"雷神"/utf8>>);
get_boss_name(8601) -> lang:get(<<"黑暗之主"/utf8>>);
get_boss_name(8701) -> lang:get(<<"维纳斯"/utf8>>);
get_boss_name(8801) -> lang:get(<<"海拉"/utf8>>);
get_boss_name(8901) -> lang:get(<<"酒神"/utf8>>);
get_boss_name(9001) -> lang:get(<<"芬尼尔"/utf8>>);
get_boss_name(9101) -> lang:get(<<"拉塔斯托克"/utf8>>);
get_boss_name(9201) -> lang:get(<<"潘"/utf8>>);
get_boss_name(9301) -> lang:get(<<"拉斐尔"/utf8>>);
get_boss_name(9401) -> lang:get(<<"宙斯"/utf8>>);
get_boss_name(9501) -> lang:get(<<"瓦尔基里"/utf8>>);
get_boss_name(9601) -> lang:get(<<"耶梦加得"/utf8>>);
get_boss_name(9701) -> lang:get(<<"洛基"/utf8>>);
get_boss_name(9801) -> lang:get(<<"黑暗之主"/utf8>>);
get_boss_name(9901) -> lang:get(<<"斯芬克斯"/utf8>>);
get_boss_name(10001) -> lang:get(<<"冰霜巨龙"/utf8>>);
get_boss_name(10101) -> lang:get(<<"潘"/utf8>>);
get_boss_name(10201) -> lang:get(<<"哪吒"/utf8>>);
get_boss_name(10301) -> lang:get(<<"利维坦"/utf8>>);
get_boss_name(10401) -> lang:get(<<"酒神"/utf8>>);
get_boss_name(10501) -> lang:get(<<"拉塔托斯克"/utf8>>);
get_boss_name(10601) -> lang:get(<<"拉斐尔"/utf8>>);
get_boss_name(10701) -> lang:get(<<"黑暗之主"/utf8>>);
get_boss_name(10801) -> lang:get(<<"耶梦加得"/utf8>>);
get_boss_name(10901) -> lang:get(<<"娜迦公主"/utf8>>);
get_boss_name(11001) -> lang:get(<<"哈迪斯"/utf8>>);
get_boss_name(11101) -> lang:get(<<"宙斯"/utf8>>);
get_boss_name(11201) -> lang:get(<<"瓦尔基里"/utf8>>);
get_boss_name(11301) -> lang:get(<<"洛基"/utf8>>);
get_boss_name(11401) -> lang:get(<<"普罗米修斯"/utf8>>);
get_boss_name(11501) -> lang:get(<<"维纳斯"/utf8>>);
get_boss_name(11601) -> lang:get(<<"潘多拉"/utf8>>);
get_boss_name(11701) -> lang:get(<<"芬尼尔"/utf8>>);
get_boss_name(11801) -> lang:get(<<"塞莎特"/utf8>>);
get_boss_name(11901) -> lang:get(<<"利维坦"/utf8>>);
get_boss_name(12001) -> lang:get(<<"阿蒙"/utf8>>);
get_boss_name(12101) -> lang:get(<<"加百列"/utf8>>);
get_boss_name(12201) -> lang:get(<<"人马喀戎"/utf8>>);
get_boss_name(12301) -> lang:get(<<"海拉"/utf8>>);
get_boss_name(12401) -> lang:get(<<"赫拉"/utf8>>);
get_boss_name(12501) -> lang:get(<<"亚巴顿"/utf8>>);
get_boss_name(12601) -> lang:get(<<"雅典娜"/utf8>>);
get_boss_name(12701) -> lang:get(<<"炽天使"/utf8>>);
get_boss_name(12801) -> lang:get(<<"奥丁"/utf8>>);
get_boss_name(12901) -> lang:get(<<"雷神"/utf8>>);
get_boss_name(13001) -> lang:get(<<"泰坦"/utf8>>);
get_boss_name(13101) -> lang:get(<<"哈迪斯"/utf8>>);
get_boss_name(13201) -> lang:get(<<"宙斯"/utf8>>);
get_boss_name(13301) -> lang:get(<<"瓦尔基里"/utf8>>);
get_boss_name(13401) -> lang:get(<<"洛基"/utf8>>);
get_boss_name(13501) -> lang:get(<<"普罗米修斯"/utf8>>);
get_boss_name(13601) -> lang:get(<<"维纳斯"/utf8>>);
get_boss_name(13701) -> lang:get(<<"芬尼尔"/utf8>>);
get_boss_name(13801) -> lang:get(<<"塞莎特"/utf8>>);
get_boss_name(13901) -> lang:get(<<"利维坦"/utf8>>);
get_boss_name(14001) -> lang:get(<<"阿蒙"/utf8>>);
get_boss_name(14101) -> lang:get(<<"加百列"/utf8>>);
get_boss_name(14201) -> lang:get(<<"人马喀戎"/utf8>>);
get_boss_name(14301) -> lang:get(<<"海拉"/utf8>>);
get_boss_name(14401) -> lang:get(<<"赫拉"/utf8>>);
get_boss_name(14501) -> lang:get(<<"亚巴顿"/utf8>>);
get_boss_name(14601) -> lang:get(<<"雅典娜"/utf8>>);
get_boss_name(14701) -> lang:get(<<"萨麦尔"/utf8>>);
get_boss_name(14801) -> lang:get(<<"奥丁"/utf8>>);
get_boss_name(14901) -> lang:get(<<"雷神"/utf8>>);
get_boss_name(15001) -> lang:get(<<"泰坦"/utf8>>);
get_boss_name(15101) -> lang:get(<<"利维坦"/utf8>>);
get_boss_name(15201) -> lang:get(<<"酒神"/utf8>>);
get_boss_name(15301) -> lang:get(<<"萨麦尔"/utf8>>);
get_boss_name(15401) -> lang:get(<<"炎魔之王"/utf8>>);
get_boss_name(15501) -> lang:get(<<"塞莎特"/utf8>>);
get_boss_name(15601) -> lang:get(<<"拉塔托斯克"/utf8>>);
get_boss_name(15701) -> lang:get(<<"特弥斯"/utf8>>);
get_boss_name(15801) -> lang:get(<<"宙斯"/utf8>>);
get_boss_name(15901) -> lang:get(<<"黑暗之主"/utf8>>);
get_boss_name(16001) -> lang:get(<<"哈迪斯"/utf8>>);
get_boss_name(16101) -> lang:get(<<"波塞冬"/utf8>>);
get_boss_name(16201) -> lang:get(<<"哪吒"/utf8>>);
get_boss_name(16301) -> lang:get(<<"瓦尔基里"/utf8>>);
get_boss_name(16401) -> lang:get(<<"雅典娜"/utf8>>);
get_boss_name(16501) -> lang:get(<<"芬尼尔"/utf8>>);
get_boss_name(16601) -> lang:get(<<"人马喀戎"/utf8>>);
get_boss_name(16701) -> lang:get(<<"雷神"/utf8>>);
get_boss_name(16801) -> lang:get(<<"阿蒙"/utf8>>);
get_boss_name(16901) -> lang:get(<<"海拉"/utf8>>);
get_boss_name(17001) -> lang:get(<<"孙悟空"/utf8>>);
get_boss_name(17101) -> lang:get(<<"耶梦加得"/utf8>>);
get_boss_name(17201) -> lang:get(<<"冰霜巨龙"/utf8>>);
get_boss_name(17301) -> lang:get(<<"炽天使"/utf8>>);
get_boss_name(17401) -> lang:get(<<"魅魔女王"/utf8>>);
get_boss_name(17501) -> lang:get(<<"白虎"/utf8>>);
get_boss_name(17601) -> lang:get(<<"加百列"/utf8>>);
get_boss_name(17701) -> lang:get(<<"维纳斯"/utf8>>);
get_boss_name(17801) -> lang:get(<<"伊邪那美"/utf8>>);
get_boss_name(17901) -> lang:get(<<"阿努比斯"/utf8>>);
get_boss_name(18001) -> lang:get(<<"孙悟空"/utf8>>);
get_boss_name(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_data756, _,
       {__Levelguild_dun_data756, __Tracesguild_dun_data756}}
	  when __Levelguild_dun_data756 band 8 /= 0 orelse
		 __Tracesguild_dun_data756 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_data}, {function, get_boss_name},
			{line, 756}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_boss_name_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelguild_dun_data756,
		       __Tracesguild_dun_data756, lager_event,
		       __Pidguild_dun_data756);
      _ -> ok
    end,
    undefined.

get_limit_lv(180) -> [1];
get_limit_lv(179) -> [1];
get_limit_lv(178) -> [1];
get_limit_lv(177) -> [1];
get_limit_lv(176) -> [1];
get_limit_lv(175) -> [1];
get_limit_lv(174) -> [1];
get_limit_lv(173) -> [1];
get_limit_lv(172) -> [1];
get_limit_lv(171) -> [1];
get_limit_lv(170) -> [1];
get_limit_lv(169) -> [1];
get_limit_lv(168) -> [1];
get_limit_lv(167) -> [1];
get_limit_lv(166) -> [1];
get_limit_lv(165) -> [1];
get_limit_lv(164) -> [1];
get_limit_lv(163) -> [1];
get_limit_lv(162) -> [1];
get_limit_lv(161) -> [1];
get_limit_lv(160) -> [1];
get_limit_lv(159) -> [1];
get_limit_lv(158) -> [1];
get_limit_lv(157) -> [1];
get_limit_lv(156) -> [1];
get_limit_lv(155) -> [1];
get_limit_lv(154) -> [1];
get_limit_lv(153) -> [1];
get_limit_lv(152) -> [1];
get_limit_lv(151) -> [1];
get_limit_lv(150) -> [1];
get_limit_lv(149) -> [1];
get_limit_lv(148) -> [1];
get_limit_lv(147) -> [1];
get_limit_lv(146) -> [1];
get_limit_lv(145) -> [1];
get_limit_lv(144) -> [1];
get_limit_lv(143) -> [1];
get_limit_lv(142) -> [1];
get_limit_lv(141) -> [1];
get_limit_lv(140) -> [1];
get_limit_lv(139) -> [1];
get_limit_lv(138) -> [1];
get_limit_lv(137) -> [1];
get_limit_lv(136) -> [1];
get_limit_lv(135) -> [1];
get_limit_lv(134) -> [1];
get_limit_lv(133) -> [1];
get_limit_lv(132) -> [1];
get_limit_lv(131) -> [1];
get_limit_lv(130) -> [1];
get_limit_lv(129) -> [1];
get_limit_lv(128) -> [1];
get_limit_lv(127) -> [1];
get_limit_lv(126) -> [1];
get_limit_lv(125) -> [1];
get_limit_lv(124) -> [1];
get_limit_lv(123) -> [1];
get_limit_lv(122) -> [1];
get_limit_lv(121) -> [1];
get_limit_lv(120) -> [1];
get_limit_lv(119) -> [1];
get_limit_lv(118) -> [1];
get_limit_lv(117) -> [1];
get_limit_lv(116) -> [1];
get_limit_lv(115) -> [1];
get_limit_lv(114) -> [1];
get_limit_lv(113) -> [1];
get_limit_lv(112) -> [1];
get_limit_lv(111) -> [1];
get_limit_lv(110) -> [1];
get_limit_lv(109) -> [1];
get_limit_lv(108) -> [1];
get_limit_lv(107) -> [1];
get_limit_lv(106) -> [1];
get_limit_lv(105) -> [1];
get_limit_lv(104) -> [1];
get_limit_lv(103) -> [1];
get_limit_lv(102) -> [1];
get_limit_lv(101) -> [1];
get_limit_lv(100) -> [1];
get_limit_lv(99) -> [1];
get_limit_lv(98) -> [1];
get_limit_lv(97) -> [1];
get_limit_lv(96) -> [1];
get_limit_lv(95) -> [1];
get_limit_lv(94) -> [1];
get_limit_lv(93) -> [1];
get_limit_lv(92) -> [1];
get_limit_lv(91) -> [1];
get_limit_lv(90) -> [1];
get_limit_lv(89) -> [1];
get_limit_lv(88) -> [1];
get_limit_lv(87) -> [1];
get_limit_lv(86) -> [1];
get_limit_lv(85) -> [1];
get_limit_lv(84) -> [1];
get_limit_lv(83) -> [1];
get_limit_lv(82) -> [1];
get_limit_lv(81) -> [1];
get_limit_lv(80) -> [1];
get_limit_lv(79) -> [1];
get_limit_lv(78) -> [1];
get_limit_lv(77) -> [1];
get_limit_lv(76) -> [1];
get_limit_lv(75) -> [1];
get_limit_lv(74) -> [1];
get_limit_lv(73) -> [1];
get_limit_lv(72) -> [1];
get_limit_lv(71) -> [1];
get_limit_lv(70) -> [1];
get_limit_lv(69) -> [1];
get_limit_lv(68) -> [1];
get_limit_lv(67) -> [1];
get_limit_lv(66) -> [1];
get_limit_lv(65) -> [1];
get_limit_lv(64) -> [1];
get_limit_lv(63) -> [1];
get_limit_lv(62) -> [1];
get_limit_lv(61) -> [1];
get_limit_lv(60) -> [1];
get_limit_lv(59) -> [1];
get_limit_lv(58) -> [1];
get_limit_lv(57) -> [1];
get_limit_lv(56) -> [1];
get_limit_lv(55) -> [1];
get_limit_lv(54) -> [1];
get_limit_lv(53) -> [1];
get_limit_lv(52) -> [1];
get_limit_lv(51) -> [1];
get_limit_lv(50) -> [1];
get_limit_lv(49) -> [1];
get_limit_lv(48) -> [1];
get_limit_lv(47) -> [1];
get_limit_lv(46) -> [1];
get_limit_lv(45) -> [1];
get_limit_lv(44) -> [1];
get_limit_lv(43) -> [1];
get_limit_lv(42) -> [1];
get_limit_lv(41) -> [1];
get_limit_lv(40) -> [1];
get_limit_lv(39) -> [1];
get_limit_lv(38) -> [1];
get_limit_lv(37) -> [1];
get_limit_lv(36) -> [1];
get_limit_lv(35) -> [1];
get_limit_lv(34) -> [1];
get_limit_lv(33) -> [1];
get_limit_lv(32) -> [1];
get_limit_lv(31) -> [1];
get_limit_lv(30) -> [1];
get_limit_lv(29) -> [1];
get_limit_lv(28) -> [1];
get_limit_lv(27) -> [1];
get_limit_lv(26) -> [1];
get_limit_lv(25) -> [1];
get_limit_lv(24) -> [1];
get_limit_lv(23) -> [1];
get_limit_lv(22) -> [1];
get_limit_lv(21) -> [1];
get_limit_lv(20) -> [1];
get_limit_lv(19) -> [1];
get_limit_lv(18) -> [1];
get_limit_lv(17) -> [1];
get_limit_lv(16) -> [1];
get_limit_lv(15) -> [1];
get_limit_lv(14) -> [1];
get_limit_lv(13) -> [1];
get_limit_lv(12) -> [1];
get_limit_lv(11) -> [1];
get_limit_lv(10) -> [1];
get_limit_lv(9) -> [1];
get_limit_lv(8) -> [1];
get_limit_lv(7) -> [1];
get_limit_lv(6) -> [1];
get_limit_lv(5) -> [1];
get_limit_lv(4) -> [1];
get_limit_lv(3) -> [1];
get_limit_lv(2) -> [1];
get_limit_lv(1) -> [1];
get_limit_lv(_) -> [].

get_rep_award(101) -> [{10, 100}, {1, 25000}];
get_rep_award(201) -> [{10, 150}, {1, 30000}];
get_rep_award(301) -> [{10, 300}, {1, 45000}];
get_rep_award(401) -> [{10, 500}, {1, 50000}];
get_rep_award(501) -> [{10, 700}, {1, 63000}];
get_rep_award(601) -> [{10, 1000}, {1, 70000}];
get_rep_award(701) -> [{10, 1250}, {1, 75000}];
get_rep_award(801) -> [{10, 1500}, {1, 82500}];
get_rep_award(901) -> [{10, 1750}, {1, 96250}];
get_rep_award(1001) -> [{10, 2250}, {1, 101250}];
get_rep_award(1101) -> [{10, 2250}, {1, 25000}];
get_rep_award(1201) -> [{10, 2500}, {1, 30000}];
get_rep_award(1301) -> [{10, 2750}, {1, 45000}];
get_rep_award(1401) -> [{10, 2750}, {1, 50000}];
get_rep_award(1501) -> [{10, 2750}, {1, 63000}];
get_rep_award(1601) -> [{10, 2750}, {1, 70000}];
get_rep_award(1701) -> [{10, 2750}, {1, 75000}];
get_rep_award(1801) -> [{10, 2750}, {1, 82500}];
get_rep_award(1901) -> [{10, 2750}, {1, 96250}];
get_rep_award(2001) -> [{10, 2750}, {1, 101250}];
get_rep_award(2101) -> [{10, 3050}, {1, 137250}];
get_rep_award(2201) -> [{10, 3050}, {1, 137250}];
get_rep_award(2301) -> [{10, 3050}, {1, 137250}];
get_rep_award(2401) -> [{10, 3050}, {1, 137250}];
get_rep_award(2501) -> [{10, 3050}, {1, 137250}];
get_rep_award(2601) -> [{10, 3050}, {1, 137250}];
get_rep_award(2701) -> [{10, 3050}, {1, 137250}];
get_rep_award(2801) -> [{10, 3050}, {1, 137250}];
get_rep_award(2901) -> [{10, 3050}, {1, 137250}];
get_rep_award(3001) -> [{10, 3350}, {1, 150750}];
get_rep_award(3101) -> [{10, 3350}, {1, 150750}];
get_rep_award(3201) -> [{10, 3350}, {1, 150750}];
get_rep_award(3301) -> [{10, 3350}, {1, 150750}];
get_rep_award(3401) -> [{10, 3350}, {1, 150750}];
get_rep_award(3501) -> [{10, 3350}, {1, 150750}];
get_rep_award(3601) -> [{10, 3350}, {1, 150750}];
get_rep_award(3701) -> [{10, 3350}, {1, 150750}];
get_rep_award(3801) -> [{10, 3350}, {1, 150750}];
get_rep_award(3901) -> [{10, 3350}, {1, 150750}];
get_rep_award(4001) -> [{10, 3650}, {1, 164250}];
get_rep_award(4101) -> [{10, 3650}, {1, 164250}];
get_rep_award(4201) -> [{10, 3650}, {1, 164250}];
get_rep_award(4301) -> [{10, 3650}, {1, 164250}];
get_rep_award(4401) -> [{10, 3650}, {1, 164250}];
get_rep_award(4501) -> [{10, 3650}, {1, 164250}];
get_rep_award(4601) -> [{10, 3650}, {1, 164250}];
get_rep_award(4701) -> [{10, 3650}, {1, 164250}];
get_rep_award(4801) -> [{10, 3650}, {1, 164250}];
get_rep_award(4901) -> [{10, 3650}, {1, 164250}];
get_rep_award(5001) -> [{10, 3650}, {1, 164250}];
get_rep_award(5101) -> [{10, 3650}, {1, 164250}];
get_rep_award(5201) -> [{10, 3650}, {1, 164250}];
get_rep_award(5301) -> [{10, 3650}, {1, 164250}];
get_rep_award(5401) -> [{10, 3650}, {1, 164250}];
get_rep_award(5501) -> [{10, 3650}, {1, 164250}];
get_rep_award(5601) -> [{10, 3650}, {1, 164250}];
get_rep_award(5701) -> [{10, 3650}, {1, 164250}];
get_rep_award(5801) -> [{10, 3650}, {1, 164250}];
get_rep_award(5901) -> [{10, 3650}, {1, 164250}];
get_rep_award(6001) -> [{10, 3650}, {1, 164250}];
get_rep_award(6101) -> [{10, 3650}, {1, 164250}];
get_rep_award(6201) -> [{10, 3650}, {1, 164250}];
get_rep_award(6301) -> [{10, 3650}, {1, 164250}];
get_rep_award(6401) -> [{10, 3650}, {1, 164250}];
get_rep_award(6501) -> [{10, 3650}, {1, 164250}];
get_rep_award(6601) -> [{10, 3650}, {1, 164250}];
get_rep_award(6701) -> [{10, 3650}, {1, 164250}];
get_rep_award(6801) -> [{10, 3650}, {1, 164250}];
get_rep_award(6901) -> [{10, 3650}, {1, 164250}];
get_rep_award(7001) -> [{10, 3650}, {1, 164250}];
get_rep_award(7101) -> [{10, 3650}, {1, 164250}];
get_rep_award(7201) -> [{10, 3650}, {1, 164250}];
get_rep_award(7301) -> [{10, 3650}, {1, 164250}];
get_rep_award(7401) -> [{10, 3650}, {1, 164250}];
get_rep_award(7501) -> [{10, 3650}, {1, 164250}];
get_rep_award(7601) -> [{10, 3650}, {1, 164250}];
get_rep_award(7701) -> [{10, 3650}, {1, 164250}];
get_rep_award(7801) -> [{10, 3650}, {1, 164250}];
get_rep_award(7901) -> [{10, 3650}, {1, 164250}];
get_rep_award(8001) -> [{10, 3650}, {1, 164250}];
get_rep_award(8101) -> [{10, 3650}, {1, 164250}];
get_rep_award(8201) -> [{10, 3650}, {1, 164250}];
get_rep_award(8301) -> [{10, 3650}, {1, 164250}];
get_rep_award(8401) -> [{10, 3650}, {1, 164250}];
get_rep_award(8501) -> [{10, 3650}, {1, 164250}];
get_rep_award(8601) -> [{10, 3650}, {1, 164250}];
get_rep_award(8701) -> [{10, 3650}, {1, 164250}];
get_rep_award(8801) -> [{10, 3650}, {1, 164250}];
get_rep_award(8901) -> [{10, 3650}, {1, 164250}];
get_rep_award(9001) -> [{10, 3650}, {1, 164250}];
get_rep_award(9101) -> [{10, 3650}, {1, 164250}];
get_rep_award(9201) -> [{10, 3650}, {1, 164250}];
get_rep_award(9301) -> [{10, 3650}, {1, 164250}];
get_rep_award(9401) -> [{10, 3650}, {1, 164250}];
get_rep_award(9501) -> [{10, 3650}, {1, 164250}];
get_rep_award(9601) -> [{10, 3650}, {1, 164250}];
get_rep_award(9701) -> [{10, 3650}, {1, 164250}];
get_rep_award(9801) -> [{10, 3650}, {1, 164250}];
get_rep_award(9901) -> [{10, 3650}, {1, 164250}];
get_rep_award(10001) -> [{10, 3650}, {1, 164250}];
get_rep_award(10101) -> [{10, 3650}, {1, 164250}];
get_rep_award(10201) -> [{10, 3650}, {1, 164250}];
get_rep_award(10301) -> [{10, 3650}, {1, 164250}];
get_rep_award(10401) -> [{10, 3650}, {1, 164250}];
get_rep_award(10501) -> [{10, 3650}, {1, 164250}];
get_rep_award(10601) -> [{10, 3650}, {1, 164250}];
get_rep_award(10701) -> [{10, 3650}, {1, 164250}];
get_rep_award(10801) -> [{10, 3650}, {1, 164250}];
get_rep_award(10901) -> [{10, 3650}, {1, 164250}];
get_rep_award(11001) -> [{10, 3650}, {1, 164250}];
get_rep_award(11101) -> [{10, 3650}, {1, 164250}];
get_rep_award(11201) -> [{10, 3650}, {1, 164250}];
get_rep_award(11301) -> [{10, 3650}, {1, 164250}];
get_rep_award(11401) -> [{10, 3650}, {1, 164250}];
get_rep_award(11501) -> [{10, 3650}, {1, 164250}];
get_rep_award(11601) -> [{10, 3650}, {1, 164250}];
get_rep_award(11701) -> [{10, 3650}, {1, 164250}];
get_rep_award(11801) -> [{10, 3650}, {1, 164250}];
get_rep_award(11901) -> [{10, 3650}, {1, 164250}];
get_rep_award(12001) -> [{10, 3650}, {1, 164250}];
get_rep_award(12101) -> [{10, 3650}, {1, 164250}];
get_rep_award(12201) -> [{10, 3650}, {1, 164250}];
get_rep_award(12301) -> [{10, 3650}, {1, 164250}];
get_rep_award(12401) -> [{10, 3650}, {1, 164250}];
get_rep_award(12501) -> [{10, 3650}, {1, 164250}];
get_rep_award(12601) -> [{10, 3650}, {1, 164250}];
get_rep_award(12701) -> [{10, 3650}, {1, 164250}];
get_rep_award(12801) -> [{10, 3650}, {1, 164250}];
get_rep_award(12901) -> [{10, 3650}, {1, 164250}];
get_rep_award(13001) -> [{10, 3650}, {1, 164250}];
get_rep_award(13101) -> [{10, 3650}, {1, 164250}];
get_rep_award(13201) -> [{10, 3650}, {1, 164250}];
get_rep_award(13301) -> [{10, 3650}, {1, 164250}];
get_rep_award(13401) -> [{10, 3650}, {1, 164250}];
get_rep_award(13501) -> [{10, 3650}, {1, 164250}];
get_rep_award(13601) -> [{10, 3650}, {1, 164250}];
get_rep_award(13701) -> [{10, 3650}, {1, 164250}];
get_rep_award(13801) -> [{10, 3650}, {1, 164250}];
get_rep_award(13901) -> [{10, 3650}, {1, 164250}];
get_rep_award(14001) -> [{10, 3650}, {1, 164250}];
get_rep_award(14101) -> [{10, 3650}, {1, 164250}];
get_rep_award(14201) -> [{10, 3650}, {1, 164250}];
get_rep_award(14301) -> [{10, 3650}, {1, 164250}];
get_rep_award(14401) -> [{10, 3650}, {1, 164250}];
get_rep_award(14501) -> [{10, 3650}, {1, 164250}];
get_rep_award(14601) -> [{10, 3650}, {1, 164250}];
get_rep_award(14701) -> [{10, 3650}, {1, 164250}];
get_rep_award(14801) -> [{10, 3650}, {1, 164250}];
get_rep_award(14901) -> [{10, 3650}, {1, 164250}];
get_rep_award(15001) -> [{10, 3650}, {1, 164250}];
get_rep_award(15101) -> [{10, 3650}, {1, 164250}];
get_rep_award(15201) -> [{10, 3650}, {1, 164250}];
get_rep_award(15301) -> [{10, 3650}, {1, 164250}];
get_rep_award(15401) -> [{10, 3650}, {1, 164250}];
get_rep_award(15501) -> [{10, 3650}, {1, 164250}];
get_rep_award(15601) -> [{10, 3650}, {1, 164250}];
get_rep_award(15701) -> [{10, 3650}, {1, 164250}];
get_rep_award(15801) -> [{10, 3650}, {1, 164250}];
get_rep_award(15901) -> [{10, 3650}, {1, 164250}];
get_rep_award(16001) -> [{10, 3650}, {1, 164250}];
get_rep_award(16101) -> [{10, 3650}, {1, 164250}];
get_rep_award(16201) -> [{10, 3650}, {1, 164250}];
get_rep_award(16301) -> [{10, 3650}, {1, 164250}];
get_rep_award(16401) -> [{10, 3650}, {1, 164250}];
get_rep_award(16501) -> [{10, 3650}, {1, 164250}];
get_rep_award(16601) -> [{10, 3650}, {1, 164250}];
get_rep_award(16701) -> [{10, 3650}, {1, 164250}];
get_rep_award(16801) -> [{10, 3650}, {1, 164250}];
get_rep_award(16901) -> [{10, 3650}, {1, 164250}];
get_rep_award(17001) -> [{10, 3650}, {1, 164250}];
get_rep_award(17101) -> [{10, 3650}, {1, 164250}];
get_rep_award(17201) -> [{10, 3650}, {1, 164250}];
get_rep_award(17301) -> [{10, 3650}, {1, 164250}];
get_rep_award(17401) -> [{10, 3650}, {1, 164250}];
get_rep_award(17501) -> [{10, 3650}, {1, 164250}];
get_rep_award(17601) -> [{10, 3650}, {1, 164250}];
get_rep_award(17701) -> [{10, 3650}, {1, 164250}];
get_rep_award(17801) -> [{10, 3650}, {1, 164250}];
get_rep_award(17901) -> [{10, 3650}, {1, 164250}];
get_rep_award(18001) -> [{10, 3650}, {1, 164250}];
get_rep_award(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_data1120, _,
       {__Levelguild_dun_data1120, __Tracesguild_dun_data1120}}
	  when __Levelguild_dun_data1120 band 8 /= 0 orelse
		 __Tracesguild_dun_data1120 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_data}, {function, get_rep_award},
			{line, 1120}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_rep_award_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelguild_dun_data1120,
		       __Tracesguild_dun_data1120, lager_event,
		       __Pidguild_dun_data1120);
      _ -> ok
    end,
    undefined.

get_award(1) ->
    {val_not_exist,
     [{10, 10, 10, 480, 150}, {1, 20000, 20000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(2) ->
    {val_not_exist,
     [{10, 12, 12, 480, 150}, {1, 22000, 22000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(3) ->
    {val_not_exist,
     [{10, 14, 14, 480, 150}, {1, 24000, 24000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(4) ->
    {val_not_exist,
     [{10, 16, 16, 480, 150}, {1, 26000, 26000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(5) ->
    {val_not_exist,
     [{10, 18, 18, 480, 150}, {1, 28000, 28000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(6) ->
    {val_not_exist,
     [{10, 20, 20, 480, 150}, {1, 30000, 30000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(7) ->
    {val_not_exist,
     [{10, 22, 22, 480, 150}, {1, 32000, 32000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(8) ->
    {val_not_exist,
     [{10, 24, 24, 480, 150}, {1, 34000, 34000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(9) ->
    {val_not_exist,
     [{10, 26, 26, 480, 150}, {1, 36000, 36000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(10) ->
    {val_not_exist,
     [{10, 28, 28, 480, 150}, {1, 38000, 38000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(11) ->
    {val_not_exist,
     [{10, 30, 30, 480, 150}, {1, 40000, 40000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(12) ->
    {val_not_exist,
     [{10, 32, 32, 480, 150}, {1, 42000, 42000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(13) ->
    {val_not_exist,
     [{10, 34, 34, 480, 150}, {1, 44000, 44000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(14) ->
    {val_not_exist,
     [{10, 36, 36, 480, 150}, {1, 46000, 46000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(15) ->
    {val_not_exist,
     [{10, 38, 38, 480, 150}, {1, 48000, 48000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(16) ->
    {val_not_exist,
     [{10, 40, 40, 480, 150}, {1, 50000, 50000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(17) ->
    {val_not_exist,
     [{10, 42, 42, 480, 150}, {1, 52000, 52000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(18) ->
    {val_not_exist,
     [{10, 44, 44, 480, 150}, {1, 54000, 54000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(19) ->
    {val_not_exist,
     [{10, 46, 46, 480, 150}, {1, 56000, 56000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(20) ->
    {val_not_exist,
     [{10, 48, 48, 480, 150}, {1, 58000, 58000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(21) ->
    {val_not_exist,
     [{10, 50, 50, 480, 150}, {1, 60000, 60000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(22) ->
    {val_not_exist,
     [{10, 52, 52, 480, 150}, {1, 62000, 62000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(23) ->
    {val_not_exist,
     [{10, 54, 54, 480, 150}, {1, 64000, 64000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(24) ->
    {val_not_exist,
     [{10, 56, 56, 480, 150}, {1, 66000, 66000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(25) ->
    {val_not_exist,
     [{10, 58, 58, 480, 150}, {1, 68000, 68000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(26) ->
    {val_not_exist,
     [{10, 60, 60, 480, 150}, {1, 70000, 70000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(27) ->
    {val_not_exist,
     [{10, 62, 62, 480, 150}, {1, 72000, 72000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(28) ->
    {val_not_exist,
     [{10, 64, 64, 480, 150}, {1, 74000, 74000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(29) ->
    {val_not_exist,
     [{10, 66, 66, 480, 150}, {1, 76000, 76000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(30) ->
    {val_not_exist,
     [{10, 68, 68, 480, 150}, {1, 78000, 78000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(31) ->
    {val_not_exist,
     [{10, 70, 70, 480, 150}, {1, 80000, 80000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(32) ->
    {val_not_exist,
     [{10, 72, 72, 480, 150}, {1, 82000, 82000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(33) ->
    {val_not_exist,
     [{10, 74, 74, 480, 150}, {1, 84000, 84000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(34) ->
    {val_not_exist,
     [{10, 76, 76, 480, 150}, {1, 86000, 86000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(35) ->
    {val_not_exist,
     [{10, 78, 78, 480, 150}, {1, 88000, 88000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(36) ->
    {val_not_exist,
     [{10, 80, 80, 480, 150}, {1, 90000, 90000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(37) ->
    {val_not_exist,
     [{10, 82, 82, 480, 150}, {1, 92000, 92000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(38) ->
    {val_not_exist,
     [{10, 84, 84, 480, 150}, {1, 94000, 94000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(39) ->
    {val_not_exist,
     [{10, 86, 86, 480, 150}, {1, 96000, 96000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(40) ->
    {val_not_exist,
     [{10, 88, 88, 480, 150}, {1, 98000, 98000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(41) ->
    {val_not_exist,
     [{10, 90, 90, 480, 150}, {1, 100000, 100000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(42) ->
    {val_not_exist,
     [{10, 92, 92, 480, 150}, {1, 102000, 102000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(43) ->
    {val_not_exist,
     [{10, 94, 94, 480, 150}, {1, 104000, 104000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(44) ->
    {val_not_exist,
     [{10, 96, 96, 480, 150}, {1, 106000, 106000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(45) ->
    {val_not_exist,
     [{10, 98, 98, 480, 150}, {1, 108000, 108000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(46) ->
    {val_not_exist,
     [{10, 100, 100, 480, 150},
      {1, 110000, 110000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(47) ->
    {val_not_exist,
     [{10, 102, 102, 480, 150},
      {1, 112000, 112000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(48) ->
    {val_not_exist,
     [{10, 104, 104, 480, 150},
      {1, 114000, 114000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(49) ->
    {val_not_exist,
     [{10, 106, 106, 480, 150},
      {1, 116000, 116000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(50) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(51) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(52) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(53) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(54) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(55) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(56) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(57) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(58) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(59) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(60) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(61) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(62) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(63) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(64) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(65) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(66) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(67) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(68) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(69) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(70) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(71) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(72) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(73) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(74) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(75) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(76) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(77) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(78) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(79) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(80) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(81) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(82) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(83) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(84) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(85) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(86) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(87) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(88) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(89) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(90) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(91) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(92) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(93) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(94) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(95) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(96) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(97) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(98) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(99) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(100) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(101) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(102) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(103) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(104) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(105) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(106) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(107) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(108) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(109) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(110) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(111) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(112) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(113) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(114) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(115) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(116) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(117) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(118) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(119) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(120) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(121) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(122) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(123) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(124) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(125) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(126) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(127) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(128) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(129) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(130) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(131) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(132) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(133) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(134) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(135) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(136) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(137) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(138) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(139) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(140) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(141) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(142) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(143) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(144) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(145) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(146) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(147) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(148) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(149) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(150) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(151) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(152) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(153) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(154) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(155) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(156) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(157) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(158) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(159) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(160) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(161) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(162) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(163) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(164) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(165) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(166) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(167) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(168) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(169) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(170) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(171) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(172) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(173) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(174) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(175) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(176) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(177) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(178) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(179) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(180) ->
    {val_not_exist,
     [{10, 108, 108, 480, 150},
      {1, 118000, 118000, 860, 200}],
     [{10, 200}, {10006, 1}, {39052, 2}], val_not_exist};
get_award(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_data1302, _,
       {__Levelguild_dun_data1302, __Tracesguild_dun_data1302}}
	  when __Levelguild_dun_data1302 band 8 /= 0 orelse
		 __Tracesguild_dun_data1302 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_data}, {function, get_award},
			{line, 1302}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_award_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelguild_dun_data1302,
		       __Tracesguild_dun_data1302, lager_event,
		       __Pidguild_dun_data1302);
      _ -> ok
    end,
    undefined.

get_guild_exp(1) -> 100;
get_guild_exp(2) -> 100;
get_guild_exp(3) -> 100;
get_guild_exp(4) -> 100;
get_guild_exp(5) -> 100;
get_guild_exp(6) -> 100;
get_guild_exp(7) -> 100;
get_guild_exp(8) -> 100;
get_guild_exp(9) -> 100;
get_guild_exp(10) -> 100;
get_guild_exp(11) -> 100;
get_guild_exp(12) -> 100;
get_guild_exp(13) -> 100;
get_guild_exp(14) -> 100;
get_guild_exp(15) -> 100;
get_guild_exp(16) -> 100;
get_guild_exp(17) -> 100;
get_guild_exp(18) -> 100;
get_guild_exp(19) -> 100;
get_guild_exp(20) -> 100;
get_guild_exp(21) -> 100;
get_guild_exp(22) -> 100;
get_guild_exp(23) -> 100;
get_guild_exp(24) -> 100;
get_guild_exp(25) -> 100;
get_guild_exp(26) -> 100;
get_guild_exp(27) -> 100;
get_guild_exp(28) -> 100;
get_guild_exp(29) -> 100;
get_guild_exp(30) -> 100;
get_guild_exp(31) -> 100;
get_guild_exp(32) -> 100;
get_guild_exp(33) -> 100;
get_guild_exp(34) -> 100;
get_guild_exp(35) -> 100;
get_guild_exp(36) -> 100;
get_guild_exp(37) -> 100;
get_guild_exp(38) -> 100;
get_guild_exp(39) -> 100;
get_guild_exp(40) -> 100;
get_guild_exp(41) -> 100;
get_guild_exp(42) -> 100;
get_guild_exp(43) -> 100;
get_guild_exp(44) -> 100;
get_guild_exp(45) -> 100;
get_guild_exp(46) -> 100;
get_guild_exp(47) -> 100;
get_guild_exp(48) -> 100;
get_guild_exp(49) -> 100;
get_guild_exp(50) -> 100;
get_guild_exp(51) -> 100;
get_guild_exp(52) -> 100;
get_guild_exp(53) -> 100;
get_guild_exp(54) -> 100;
get_guild_exp(55) -> 100;
get_guild_exp(56) -> 100;
get_guild_exp(57) -> 100;
get_guild_exp(58) -> 100;
get_guild_exp(59) -> 100;
get_guild_exp(60) -> 100;
get_guild_exp(61) -> 100;
get_guild_exp(62) -> 100;
get_guild_exp(63) -> 100;
get_guild_exp(64) -> 100;
get_guild_exp(65) -> 100;
get_guild_exp(66) -> 100;
get_guild_exp(67) -> 100;
get_guild_exp(68) -> 100;
get_guild_exp(69) -> 100;
get_guild_exp(70) -> 100;
get_guild_exp(71) -> 100;
get_guild_exp(72) -> 100;
get_guild_exp(73) -> 100;
get_guild_exp(74) -> 100;
get_guild_exp(75) -> 100;
get_guild_exp(76) -> 100;
get_guild_exp(77) -> 100;
get_guild_exp(78) -> 100;
get_guild_exp(79) -> 100;
get_guild_exp(80) -> 100;
get_guild_exp(81) -> 100;
get_guild_exp(82) -> 100;
get_guild_exp(83) -> 100;
get_guild_exp(84) -> 100;
get_guild_exp(85) -> 100;
get_guild_exp(86) -> 100;
get_guild_exp(87) -> 100;
get_guild_exp(88) -> 100;
get_guild_exp(89) -> 100;
get_guild_exp(90) -> 100;
get_guild_exp(91) -> 100;
get_guild_exp(92) -> 100;
get_guild_exp(93) -> 100;
get_guild_exp(94) -> 100;
get_guild_exp(95) -> 100;
get_guild_exp(96) -> 100;
get_guild_exp(97) -> 100;
get_guild_exp(98) -> 100;
get_guild_exp(99) -> 100;
get_guild_exp(100) -> 100;
get_guild_exp(101) -> 100;
get_guild_exp(102) -> 100;
get_guild_exp(103) -> 100;
get_guild_exp(104) -> 100;
get_guild_exp(105) -> 100;
get_guild_exp(106) -> 100;
get_guild_exp(107) -> 100;
get_guild_exp(108) -> 100;
get_guild_exp(109) -> 100;
get_guild_exp(110) -> 100;
get_guild_exp(111) -> 100;
get_guild_exp(112) -> 100;
get_guild_exp(113) -> 100;
get_guild_exp(114) -> 100;
get_guild_exp(115) -> 100;
get_guild_exp(116) -> 100;
get_guild_exp(117) -> 100;
get_guild_exp(118) -> 100;
get_guild_exp(119) -> 100;
get_guild_exp(120) -> 100;
get_guild_exp(121) -> 100;
get_guild_exp(122) -> 100;
get_guild_exp(123) -> 100;
get_guild_exp(124) -> 100;
get_guild_exp(125) -> 100;
get_guild_exp(126) -> 100;
get_guild_exp(127) -> 100;
get_guild_exp(128) -> 100;
get_guild_exp(129) -> 100;
get_guild_exp(130) -> 100;
get_guild_exp(131) -> 100;
get_guild_exp(132) -> 100;
get_guild_exp(133) -> 100;
get_guild_exp(134) -> 100;
get_guild_exp(135) -> 100;
get_guild_exp(136) -> 100;
get_guild_exp(137) -> 100;
get_guild_exp(138) -> 100;
get_guild_exp(139) -> 100;
get_guild_exp(140) -> 100;
get_guild_exp(141) -> 100;
get_guild_exp(142) -> 100;
get_guild_exp(143) -> 100;
get_guild_exp(144) -> 100;
get_guild_exp(145) -> 100;
get_guild_exp(146) -> 100;
get_guild_exp(147) -> 100;
get_guild_exp(148) -> 100;
get_guild_exp(149) -> 100;
get_guild_exp(150) -> 100;
get_guild_exp(151) -> 100;
get_guild_exp(152) -> 100;
get_guild_exp(153) -> 100;
get_guild_exp(154) -> 100;
get_guild_exp(155) -> 100;
get_guild_exp(156) -> 100;
get_guild_exp(157) -> 100;
get_guild_exp(158) -> 100;
get_guild_exp(159) -> 100;
get_guild_exp(160) -> 100;
get_guild_exp(161) -> 100;
get_guild_exp(162) -> 100;
get_guild_exp(163) -> 100;
get_guild_exp(164) -> 100;
get_guild_exp(165) -> 100;
get_guild_exp(166) -> 100;
get_guild_exp(167) -> 100;
get_guild_exp(168) -> 100;
get_guild_exp(169) -> 100;
get_guild_exp(170) -> 100;
get_guild_exp(171) -> 100;
get_guild_exp(172) -> 100;
get_guild_exp(173) -> 100;
get_guild_exp(174) -> 100;
get_guild_exp(175) -> 100;
get_guild_exp(176) -> 100;
get_guild_exp(177) -> 100;
get_guild_exp(178) -> 100;
get_guild_exp(179) -> 100;
get_guild_exp(180) -> 100;
get_guild_exp(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_data1484, _,
       {__Levelguild_dun_data1484, __Tracesguild_dun_data1484}}
	  when __Levelguild_dun_data1484 band 8 /= 0 orelse
		 __Tracesguild_dun_data1484 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_data}, {function, get_guild_exp},
			{line, 1484}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_guild_exp_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelguild_dun_data1484,
		       __Tracesguild_dun_data1484, lager_event,
		       __Pidguild_dun_data1484);
      _ -> ok
    end,
    undefined.

get_box_award(1) ->
    [{10401, 1}, {10, 300}, {1, 3000}, {2, 30000},
     {10006, 6}];
get_box_award(2) ->
    [{10401, 1}, {10, 310}, {1, 3100}, {2, 31000},
     {10006, 6}];
get_box_award(3) ->
    [{10401, 1}, {10, 320}, {1, 3200}, {2, 32000},
     {10006, 8}];
get_box_award(4) ->
    [{10401, 1}, {10, 330}, {1, 3300}, {2, 33000},
     {10006, 8}];
get_box_award(5) ->
    [{10401, 1}, {10, 340}, {1, 3400}, {2, 34000},
     {10006, 10}];
get_box_award(6) ->
    [{10401, 1}, {10, 350}, {1, 3500}, {2, 35000},
     {10006, 10}];
get_box_award(7) ->
    [{10401, 1}, {10, 360}, {1, 3600}, {2, 36000},
     {10006, 12}];
get_box_award(8) ->
    [{10401, 1}, {10, 370}, {1, 3700}, {2, 37000},
     {10006, 12}];
get_box_award(9) ->
    [{10401, 1}, {10, 380}, {1, 3800}, {2, 38000},
     {10006, 14}];
get_box_award(10) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(11) ->
    [{10401, 1}, {10, 400}, {1, 4000}, {2, 40000},
     {10006, 16}];
get_box_award(12) ->
    [{10401, 1}, {10, 410}, {1, 4100}, {2, 41000},
     {10006, 16}];
get_box_award(13) ->
    [{10401, 1}, {10, 420}, {1, 4200}, {2, 42000},
     {10006, 18}];
get_box_award(14) ->
    [{10401, 1}, {10, 430}, {1, 4300}, {2, 43000},
     {10006, 18}];
get_box_award(15) ->
    [{10401, 1}, {10, 440}, {1, 4400}, {2, 44000},
     {10006, 20}];
get_box_award(16) ->
    [{10401, 1}, {10, 450}, {1, 4500}, {2, 45000},
     {10006, 20}];
get_box_award(17) ->
    [{10401, 1}, {10, 460}, {1, 4600}, {2, 46000},
     {10006, 22}];
get_box_award(18) ->
    [{10401, 1}, {10, 470}, {1, 4700}, {2, 47000},
     {10006, 22}];
get_box_award(19) ->
    [{10401, 1}, {10, 480}, {1, 4800}, {2, 48000},
     {10006, 24}];
get_box_award(20) ->
    [{10401, 1}, {10, 490}, {1, 4900}, {2, 49000},
     {10006, 24}];
get_box_award(21) ->
    [{10401, 1}, {10, 300}, {1, 3000}, {2, 30000},
     {10006, 6}];
get_box_award(22) ->
    [{10401, 1}, {10, 310}, {1, 3100}, {2, 31000},
     {10006, 6}];
get_box_award(23) ->
    [{10401, 1}, {10, 320}, {1, 3200}, {2, 32000},
     {10006, 8}];
get_box_award(24) ->
    [{10401, 1}, {10, 330}, {1, 3300}, {2, 33000},
     {10006, 8}];
get_box_award(25) ->
    [{10401, 1}, {10, 340}, {1, 3400}, {2, 34000},
     {10006, 10}];
get_box_award(26) ->
    [{10401, 1}, {10, 350}, {1, 3500}, {2, 35000},
     {10006, 10}];
get_box_award(27) ->
    [{10401, 1}, {10, 360}, {1, 3600}, {2, 36000},
     {10006, 12}];
get_box_award(28) ->
    [{10401, 1}, {10, 370}, {1, 3700}, {2, 37000},
     {10006, 12}];
get_box_award(29) ->
    [{10401, 1}, {10, 380}, {1, 3800}, {2, 38000},
     {10006, 14}];
get_box_award(30) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(31) ->
    [{10401, 1}, {10, 400}, {1, 4000}, {2, 40000},
     {10006, 16}];
get_box_award(32) ->
    [{10401, 1}, {10, 410}, {1, 4100}, {2, 41000},
     {10006, 16}];
get_box_award(33) ->
    [{10401, 1}, {10, 420}, {1, 4200}, {2, 42000},
     {10006, 18}];
get_box_award(34) ->
    [{10401, 1}, {10, 430}, {1, 4300}, {2, 43000},
     {10006, 18}];
get_box_award(35) ->
    [{10401, 1}, {10, 440}, {1, 4400}, {2, 44000},
     {10006, 20}];
get_box_award(36) ->
    [{10401, 1}, {10, 450}, {1, 4500}, {2, 45000},
     {10006, 20}];
get_box_award(37) ->
    [{10401, 1}, {10, 460}, {1, 4600}, {2, 46000},
     {10006, 22}];
get_box_award(38) ->
    [{10401, 1}, {10, 470}, {1, 4700}, {2, 47000},
     {10006, 22}];
get_box_award(39) ->
    [{10401, 1}, {10, 480}, {1, 4800}, {2, 48000},
     {10006, 24}];
get_box_award(40) ->
    [{10401, 1}, {10, 490}, {1, 4900}, {2, 49000},
     {10006, 24}];
get_box_award(41) ->
    [{10401, 1}, {10, 300}, {1, 3000}, {2, 30000},
     {10006, 6}];
get_box_award(42) ->
    [{10401, 1}, {10, 310}, {1, 3100}, {2, 31000},
     {10006, 6}];
get_box_award(43) ->
    [{10401, 1}, {10, 320}, {1, 3200}, {2, 32000},
     {10006, 8}];
get_box_award(44) ->
    [{10401, 1}, {10, 330}, {1, 3300}, {2, 33000},
     {10006, 8}];
get_box_award(45) ->
    [{10401, 1}, {10, 340}, {1, 3400}, {2, 34000},
     {10006, 10}];
get_box_award(46) ->
    [{10401, 1}, {10, 350}, {1, 3500}, {2, 35000},
     {10006, 10}];
get_box_award(47) ->
    [{10401, 1}, {10, 360}, {1, 3600}, {2, 36000},
     {10006, 12}];
get_box_award(48) ->
    [{10401, 1}, {10, 370}, {1, 3700}, {2, 37000},
     {10006, 12}];
get_box_award(49) ->
    [{10401, 1}, {10, 380}, {1, 3800}, {2, 38000},
     {10006, 14}];
get_box_award(50) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(51) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(52) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(53) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(54) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(55) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(56) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(57) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(58) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(59) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(60) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(61) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(62) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(63) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(64) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(65) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(66) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(67) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(68) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(69) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(70) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(71) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(72) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(73) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(74) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(75) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(76) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(77) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(78) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(79) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(80) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(81) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(82) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(83) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(84) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(85) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(86) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(87) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(88) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(89) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(90) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(91) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(92) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(93) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(94) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(95) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(96) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(97) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(98) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(99) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(100) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(101) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(102) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(103) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(104) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(105) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(106) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(107) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(108) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(109) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(110) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(111) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(112) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(113) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(114) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(115) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(116) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(117) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(118) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(119) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(120) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(121) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(122) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(123) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(124) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(125) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(126) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(127) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(128) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(129) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(130) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(131) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(132) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(133) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(134) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(135) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(136) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(137) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(138) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(139) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(140) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(141) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(142) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(143) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(144) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(145) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(146) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(147) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(148) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(149) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(150) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(151) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(152) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(153) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(154) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(155) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(156) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(157) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(158) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(159) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(160) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(161) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(162) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(163) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(164) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(165) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(166) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(167) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(168) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(169) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(170) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(171) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(172) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(173) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(174) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(175) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(176) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(177) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(178) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(179) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(180) ->
    [{10401, 1}, {10, 390}, {1, 3900}, {2, 39000},
     {10006, 14}];
get_box_award(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_data1666, _,
       {__Levelguild_dun_data1666, __Tracesguild_dun_data1666}}
	  when __Levelguild_dun_data1666 band 8 /= 0 orelse
		 __Tracesguild_dun_data1666 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_data}, {function, get_box_award},
			{line, 1666}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_box_award_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelguild_dun_data1666,
		       __Tracesguild_dun_data1666, lager_event,
		       __Pidguild_dun_data1666);
      _ -> ok
    end,
    undefined.

get_max_buff_lev() -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].

get_buff_add_time(1) -> 18000;
get_buff_add_time(2) -> 25200;
get_buff_add_time(3) -> 32400;
get_buff_add_time(4) -> 43200;
get_buff_add_time(5) -> 50400;
get_buff_add_time(6) -> 57600;
get_buff_add_time(7) -> 64800;
get_buff_add_time(8) -> 72000;
get_buff_add_time(9) -> 79200;
get_buff_add_time(10) -> 86400;
get_buff_add_time(_) -> 0.

get_buff_add_attr(1) -> [{atk_per, 20}];
get_buff_add_attr(2) -> [{atk_per, 40}];
get_buff_add_attr(3) -> [{atk_per, 60}];
get_buff_add_attr(4) -> [{atk_per, 80}];
get_buff_add_attr(5) -> [{atk_per, 100}];
get_buff_add_attr(6) -> [{atk_per, 120}];
get_buff_add_attr(7) -> [{atk_per, 140}];
get_buff_add_attr(8) -> [{atk_per, 160}];
get_buff_add_attr(9) -> [{atk_per, 180}];
get_buff_add_attr(10) -> [{atk_per, 200}];
get_buff_add_attr(_) -> [].

const(guild_lev) -> 1;
const(join_lev) -> 10;
const(free_time) -> 2;
const(resetting_time) -> {0, 0, 0};
const(action_time) -> 15;
const(gold_box) -> 1;
const(hero_soul_box) -> 8;
const(guild_box) -> 10;
const(coin_box) -> 21;
const(box_max_num) -> 40;
const(rumour_items) -> [10201];
const(rank_dam) -> 2000;
const(reset_desc_0) -> lang:get(<<"正常重置"/utf8>>);
const(reset_desc_1) -> lang:get(<<"章节回退"/utf8>>);
const(buff_cost) -> 20;
const(buff_item) -> 10020;
const(concentrate_cd) -> 3600;
const(praise_reward) -> [{2, 3000}];
const(praise_time) -> 3;
const(game_rule) -> 1;
const(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_data1714, _,
       {__Levelguild_dun_data1714, __Tracesguild_dun_data1714}}
	  when __Levelguild_dun_data1714 band 8 /= 0 orelse
		 __Tracesguild_dun_data1714 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_data}, {function, const},
			{line, 1714}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("const_data_not_exist===>~w", [_Info]),
		       none, 4096, 8, __Levelguild_dun_data1714,
		       __Tracesguild_dun_data1714, lager_event,
		       __Pidguild_dun_data1714);
      _ -> ok
    end,
    undefined.

get_expend_by_count(4) -> [{15, 60}];
get_expend_by_count(3) -> [{15, 40}];
get_expend_by_count(2) -> [{15, 30}];
get_expend_by_count(1) -> [{15, 20}];
get_expend_by_count(_) -> [].

get_buy_count_by_vip(VipLev) when VipLev >= 0 -> 4;
get_buy_count_by_vip(VipLev) when VipLev >= 0 -> 3;
get_buy_count_by_vip(VipLev) when VipLev >= 0 -> 2;
get_buy_count_by_vip(VipLev) when VipLev >= 0 -> 1;
get_buy_count_by_vip(_) -> 0.

get_buy_count() -> [1, 2, 3, 4].

get_award_by_rank({101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({1901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({1901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({1901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({1901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({1901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({1901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({1901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({2901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({2901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({2901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({2901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({2901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({2901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({2901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({3901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({3901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({3901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({3901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({3901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({3901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({3901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({4901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({4901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({4901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({4901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({4901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({4901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({4901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({5901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({5901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({5901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({5901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({5901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({5901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({5901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({6901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({6901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({6901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({6901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({6901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({6901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({6901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({7901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({7901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({7901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({7901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({7901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({7901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({7901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({8901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({8901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({8901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({8901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({8901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({8901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({8901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({9901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({9901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({9901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({9901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({9901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({9901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({9901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({10901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({10901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({10901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({10901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({10901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({10901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({10901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({11001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({11001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({11001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({11001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({11001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({11001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({11001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({11101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({11101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({11101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({11101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({11101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({11101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({11101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({11201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({11201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({11201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({11201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({11201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({11201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({11201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({11301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({11301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({11301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({11301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({11301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({11301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({11301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({11401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({11401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({11401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({11401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({11401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({11401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({11401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({11501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({11501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({11501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({11501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({11501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({11501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({11501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({15101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({15101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({15101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({15101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({15101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({15201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({15201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({15201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({15201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({15201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({15201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({15301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({15301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({15301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({15301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({15301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({15301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({15401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({15401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({15401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({15401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({15401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({15401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({15501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({15501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({15501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({15501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({15501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({15501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({15601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({15601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({15601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({15601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({15601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({15601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({15701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({15701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({15701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({15701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({15701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({15701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({15801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({15801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({15801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({15801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({15801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({15801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({15901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({15901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({15901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({15901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({15901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({15901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({15901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({16901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({16901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({16901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({16901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({16901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({16901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({16901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17101, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17101, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17101, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17101, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17101, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17101, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17101, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17201, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17201, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17201, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17201, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17201, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17201, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17201, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17301, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17301, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17301, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17301, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17301, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17301, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17301, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17401, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17401, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17401, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17401, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17401, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17401, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17401, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17501, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17501, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17501, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17501, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17501, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17501, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17501, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17601, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17601, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17601, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17601, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17601, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17601, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17601, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17701, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17701, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17701, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17701, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17701, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17701, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17701, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17801, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17801, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17801, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17801, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17801, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17801, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17801, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({17901, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({17901, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({17901, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({17901, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({17901, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({17901, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({17901, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank({18001, VipLev})
    when 21 =< VipLev andalso VipLev =< 50 ->
    [{10, 3650}, {1, 164250}];
get_award_by_rank({18001, VipLev})
    when 16 =< VipLev andalso VipLev =< 20 ->
    [{10, 4380}, {1, 197100}];
get_award_by_rank({18001, VipLev})
    when 11 =< VipLev andalso VipLev =< 15 ->
    [{10, 5840}, {1, 262800}];
get_award_by_rank({18001, VipLev})
    when 4 =< VipLev andalso VipLev =< 10 ->
    [{10, 7300}, {1, 328500}];
get_award_by_rank({18001, VipLev})
    when 3 =< VipLev andalso VipLev =< 3 ->
    [{10, 9490}, {1, 427050}];
get_award_by_rank({18001, VipLev})
    when 2 =< VipLev andalso VipLev =< 2 ->
    [{10, 10220}, {1, 459900}];
get_award_by_rank({18001, VipLev})
    when 1 =< VipLev andalso VipLev =< 1 ->
    [{10, 10950}, {1, 492750}];
get_award_by_rank(_) -> [].


