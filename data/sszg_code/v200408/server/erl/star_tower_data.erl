-file("data/star_tower_data.erl", 1).

-file("data/star_tower_data.erl", 1).

-file("src/mod/data/star_tower_data.erl", 1).

-module(star_tower_data).

-lager_records([{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]}]).

-export([get_constant/1, get_list/0, get_unit_id/1,
	 get_power/1, get_award/1, get_limit_dun_id/1,
	 get_buy_count/1, get_buy_count_expend/1, max_tower/0,
	 get_all_first_award/0, get_first_award/1,
	 get_first_award_tower/1, get_first_award_id/1,
	 get_first_notice/1, reward_role/1]).

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

-file("src/mod/data/star_tower_data.erl", 24).

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

-file("src/mod/data/star_tower_data.erl", 25).

get_constant(open_floor) -> [{lev, 16}];
get_constant(use_times) -> 1;
get_constant(free_times) -> 2;
get_constant(reset) -> 5;
get_constant(rule_desc) -> 0;
get_constant(quick_challenge) -> 90;
get_constant(monster_run_battlenum_condition) -> 1300;
get_constant(monster_run_probability) -> 300;
get_constant(monster_run_floor_condition) -> 100;
get_constant(_) -> undefined.

get_list() ->
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
     178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188,
     189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
     200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210,
     211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221,
     222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232,
     233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243,
     244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254,
     255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265,
     266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276,
     277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287,
     288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298,
     299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309,
     310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320,
     321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331,
     332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342,
     343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353,
     354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364,
     365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375,
     376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386,
     387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397,
     398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408,
     409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419,
     420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430,
     431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441,
     442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452,
     453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463,
     464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474,
     475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485,
     486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496,
     497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507,
     508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518,
     519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529,
     530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540,
     541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551,
     552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562,
     563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573,
     574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584,
     585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595,
     596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606,
     607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617,
     618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628,
     629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639,
     640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650,
     651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661,
     662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672,
     673, 674, 675, 676, 677, 678, 679, 680, 681, 682, 683,
     684, 685, 686, 687, 688, 689, 690, 691, 692, 693, 694,
     695, 696, 697, 698, 699, 700, 701, 702, 703, 704, 705,
     706, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716,
     717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727,
     728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738,
     739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749,
     750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760,
     761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771,
     772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782,
     783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793,
     794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804,
     805, 806, 807, 808, 809, 810, 811, 812, 813, 814, 815,
     816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826,
     827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837,
     838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848,
     849, 850, 851, 852, 853, 854, 855, 856, 857, 858, 859,
     860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870,
     871, 872, 873, 874, 875, 876, 877, 878, 879, 880, 881,
     882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892,
     893, 894, 895, 896, 897, 898, 899, 900, 901, 902, 903,
     904, 905, 906, 907, 908, 909, 910, 911, 912, 913, 914,
     915, 916, 917, 918, 919, 920, 921, 922, 923, 924, 925,
     926, 927, 928, 929, 930, 931, 932, 933, 934, 935, 936,
     937, 938, 939, 940, 941, 942, 943, 944, 945, 946, 947,
     948, 949, 950, 951, 952, 953, 954, 955, 956, 957, 958,
     959, 960, 961, 962, 963, 964, 965, 966, 967, 968, 969,
     970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 980,
     981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991,
     992, 993, 994, 995, 996, 997, 998, 999, 1000].

get_unit_id(1) -> 30001;
get_unit_id(2) -> 30002;
get_unit_id(3) -> 30003;
get_unit_id(4) -> 30004;
get_unit_id(5) -> 30005;
get_unit_id(6) -> 30006;
get_unit_id(7) -> 30007;
get_unit_id(8) -> 30008;
get_unit_id(9) -> 30009;
get_unit_id(10) -> 30010;
get_unit_id(11) -> 30011;
get_unit_id(12) -> 30012;
get_unit_id(13) -> 30013;
get_unit_id(14) -> 30014;
get_unit_id(15) -> 30015;
get_unit_id(16) -> 30016;
get_unit_id(17) -> 30017;
get_unit_id(18) -> 30018;
get_unit_id(19) -> 30019;
get_unit_id(20) -> 30020;
get_unit_id(21) -> 30021;
get_unit_id(22) -> 30022;
get_unit_id(23) -> 30023;
get_unit_id(24) -> 30024;
get_unit_id(25) -> 30025;
get_unit_id(26) -> 30026;
get_unit_id(27) -> 30027;
get_unit_id(28) -> 30028;
get_unit_id(29) -> 30029;
get_unit_id(30) -> 30030;
get_unit_id(31) -> 30031;
get_unit_id(32) -> 30032;
get_unit_id(33) -> 30033;
get_unit_id(34) -> 30034;
get_unit_id(35) -> 30035;
get_unit_id(36) -> 30036;
get_unit_id(37) -> 30037;
get_unit_id(38) -> 30038;
get_unit_id(39) -> 30039;
get_unit_id(40) -> 30040;
get_unit_id(41) -> 30041;
get_unit_id(42) -> 30042;
get_unit_id(43) -> 30043;
get_unit_id(44) -> 30044;
get_unit_id(45) -> 30045;
get_unit_id(46) -> 30046;
get_unit_id(47) -> 30047;
get_unit_id(48) -> 30048;
get_unit_id(49) -> 30049;
get_unit_id(50) -> 30050;
get_unit_id(51) -> 30051;
get_unit_id(52) -> 30052;
get_unit_id(53) -> 30053;
get_unit_id(54) -> 30054;
get_unit_id(55) -> 30055;
get_unit_id(56) -> 30056;
get_unit_id(57) -> 30057;
get_unit_id(58) -> 30058;
get_unit_id(59) -> 30059;
get_unit_id(60) -> 30060;
get_unit_id(61) -> 30061;
get_unit_id(62) -> 30062;
get_unit_id(63) -> 30063;
get_unit_id(64) -> 30064;
get_unit_id(65) -> 30065;
get_unit_id(66) -> 30066;
get_unit_id(67) -> 30067;
get_unit_id(68) -> 30068;
get_unit_id(69) -> 30069;
get_unit_id(70) -> 30070;
get_unit_id(71) -> 30071;
get_unit_id(72) -> 30072;
get_unit_id(73) -> 30073;
get_unit_id(74) -> 30074;
get_unit_id(75) -> 30075;
get_unit_id(76) -> 30076;
get_unit_id(77) -> 30077;
get_unit_id(78) -> 30078;
get_unit_id(79) -> 30079;
get_unit_id(80) -> 30080;
get_unit_id(81) -> 30081;
get_unit_id(82) -> 30082;
get_unit_id(83) -> 30083;
get_unit_id(84) -> 30084;
get_unit_id(85) -> 30085;
get_unit_id(86) -> 30086;
get_unit_id(87) -> 30087;
get_unit_id(88) -> 30088;
get_unit_id(89) -> 30089;
get_unit_id(90) -> 30090;
get_unit_id(91) -> 30091;
get_unit_id(92) -> 30092;
get_unit_id(93) -> 30093;
get_unit_id(94) -> 30094;
get_unit_id(95) -> 30095;
get_unit_id(96) -> 30096;
get_unit_id(97) -> 30097;
get_unit_id(98) -> 30098;
get_unit_id(99) -> 30099;
get_unit_id(100) -> 30100;
get_unit_id(101) -> 30101;
get_unit_id(102) -> 30102;
get_unit_id(103) -> 30103;
get_unit_id(104) -> 30104;
get_unit_id(105) -> 30105;
get_unit_id(106) -> 30106;
get_unit_id(107) -> 30107;
get_unit_id(108) -> 30108;
get_unit_id(109) -> 30109;
get_unit_id(110) -> 30110;
get_unit_id(111) -> 30111;
get_unit_id(112) -> 30112;
get_unit_id(113) -> 30113;
get_unit_id(114) -> 30114;
get_unit_id(115) -> 30115;
get_unit_id(116) -> 30116;
get_unit_id(117) -> 30117;
get_unit_id(118) -> 30118;
get_unit_id(119) -> 30119;
get_unit_id(120) -> 30120;
get_unit_id(121) -> 30121;
get_unit_id(122) -> 30122;
get_unit_id(123) -> 30123;
get_unit_id(124) -> 30124;
get_unit_id(125) -> 30125;
get_unit_id(126) -> 30126;
get_unit_id(127) -> 30127;
get_unit_id(128) -> 30128;
get_unit_id(129) -> 30129;
get_unit_id(130) -> 30130;
get_unit_id(131) -> 30131;
get_unit_id(132) -> 30132;
get_unit_id(133) -> 30133;
get_unit_id(134) -> 30134;
get_unit_id(135) -> 30135;
get_unit_id(136) -> 30136;
get_unit_id(137) -> 30137;
get_unit_id(138) -> 30138;
get_unit_id(139) -> 30139;
get_unit_id(140) -> 30140;
get_unit_id(141) -> 30141;
get_unit_id(142) -> 30142;
get_unit_id(143) -> 30143;
get_unit_id(144) -> 30144;
get_unit_id(145) -> 30145;
get_unit_id(146) -> 30146;
get_unit_id(147) -> 30147;
get_unit_id(148) -> 30148;
get_unit_id(149) -> 30149;
get_unit_id(150) -> 30150;
get_unit_id(151) -> 30151;
get_unit_id(152) -> 30152;
get_unit_id(153) -> 30153;
get_unit_id(154) -> 30154;
get_unit_id(155) -> 30155;
get_unit_id(156) -> 30156;
get_unit_id(157) -> 30157;
get_unit_id(158) -> 30158;
get_unit_id(159) -> 30159;
get_unit_id(160) -> 30160;
get_unit_id(161) -> 30161;
get_unit_id(162) -> 30162;
get_unit_id(163) -> 30163;
get_unit_id(164) -> 30164;
get_unit_id(165) -> 30165;
get_unit_id(166) -> 30166;
get_unit_id(167) -> 30167;
get_unit_id(168) -> 30168;
get_unit_id(169) -> 30169;
get_unit_id(170) -> 30170;
get_unit_id(171) -> 30171;
get_unit_id(172) -> 30172;
get_unit_id(173) -> 30173;
get_unit_id(174) -> 30174;
get_unit_id(175) -> 30175;
get_unit_id(176) -> 30176;
get_unit_id(177) -> 30177;
get_unit_id(178) -> 30178;
get_unit_id(179) -> 30179;
get_unit_id(180) -> 30180;
get_unit_id(181) -> 30181;
get_unit_id(182) -> 30182;
get_unit_id(183) -> 30183;
get_unit_id(184) -> 30184;
get_unit_id(185) -> 30185;
get_unit_id(186) -> 30186;
get_unit_id(187) -> 30187;
get_unit_id(188) -> 30188;
get_unit_id(189) -> 30189;
get_unit_id(190) -> 30190;
get_unit_id(191) -> 30191;
get_unit_id(192) -> 30192;
get_unit_id(193) -> 30193;
get_unit_id(194) -> 30194;
get_unit_id(195) -> 30195;
get_unit_id(196) -> 30196;
get_unit_id(197) -> 30197;
get_unit_id(198) -> 30198;
get_unit_id(199) -> 30199;
get_unit_id(200) -> 30200;
get_unit_id(201) -> 30201;
get_unit_id(202) -> 30202;
get_unit_id(203) -> 30203;
get_unit_id(204) -> 30204;
get_unit_id(205) -> 30205;
get_unit_id(206) -> 30206;
get_unit_id(207) -> 30207;
get_unit_id(208) -> 30208;
get_unit_id(209) -> 30209;
get_unit_id(210) -> 30210;
get_unit_id(211) -> 30211;
get_unit_id(212) -> 30212;
get_unit_id(213) -> 30213;
get_unit_id(214) -> 30214;
get_unit_id(215) -> 30215;
get_unit_id(216) -> 30216;
get_unit_id(217) -> 30217;
get_unit_id(218) -> 30218;
get_unit_id(219) -> 30219;
get_unit_id(220) -> 30220;
get_unit_id(221) -> 30221;
get_unit_id(222) -> 30222;
get_unit_id(223) -> 30223;
get_unit_id(224) -> 30224;
get_unit_id(225) -> 30225;
get_unit_id(226) -> 30226;
get_unit_id(227) -> 30227;
get_unit_id(228) -> 30228;
get_unit_id(229) -> 30229;
get_unit_id(230) -> 30230;
get_unit_id(231) -> 30231;
get_unit_id(232) -> 30232;
get_unit_id(233) -> 30233;
get_unit_id(234) -> 30234;
get_unit_id(235) -> 30235;
get_unit_id(236) -> 30236;
get_unit_id(237) -> 30237;
get_unit_id(238) -> 30238;
get_unit_id(239) -> 30239;
get_unit_id(240) -> 30240;
get_unit_id(241) -> 30241;
get_unit_id(242) -> 30242;
get_unit_id(243) -> 30243;
get_unit_id(244) -> 30244;
get_unit_id(245) -> 30245;
get_unit_id(246) -> 30246;
get_unit_id(247) -> 30247;
get_unit_id(248) -> 30248;
get_unit_id(249) -> 30249;
get_unit_id(250) -> 30250;
get_unit_id(251) -> 30251;
get_unit_id(252) -> 30252;
get_unit_id(253) -> 30253;
get_unit_id(254) -> 30254;
get_unit_id(255) -> 30255;
get_unit_id(256) -> 30256;
get_unit_id(257) -> 30257;
get_unit_id(258) -> 30258;
get_unit_id(259) -> 30259;
get_unit_id(260) -> 30260;
get_unit_id(261) -> 30261;
get_unit_id(262) -> 30262;
get_unit_id(263) -> 30263;
get_unit_id(264) -> 30264;
get_unit_id(265) -> 30265;
get_unit_id(266) -> 30266;
get_unit_id(267) -> 30267;
get_unit_id(268) -> 30268;
get_unit_id(269) -> 30269;
get_unit_id(270) -> 30270;
get_unit_id(271) -> 30271;
get_unit_id(272) -> 30272;
get_unit_id(273) -> 30273;
get_unit_id(274) -> 30274;
get_unit_id(275) -> 30275;
get_unit_id(276) -> 30276;
get_unit_id(277) -> 30277;
get_unit_id(278) -> 30278;
get_unit_id(279) -> 30279;
get_unit_id(280) -> 30280;
get_unit_id(281) -> 30281;
get_unit_id(282) -> 30282;
get_unit_id(283) -> 30283;
get_unit_id(284) -> 30284;
get_unit_id(285) -> 30285;
get_unit_id(286) -> 30286;
get_unit_id(287) -> 30287;
get_unit_id(288) -> 30288;
get_unit_id(289) -> 30289;
get_unit_id(290) -> 30290;
get_unit_id(291) -> 30291;
get_unit_id(292) -> 30292;
get_unit_id(293) -> 30293;
get_unit_id(294) -> 30294;
get_unit_id(295) -> 30295;
get_unit_id(296) -> 30296;
get_unit_id(297) -> 30297;
get_unit_id(298) -> 30298;
get_unit_id(299) -> 30299;
get_unit_id(300) -> 30300;
get_unit_id(301) -> 30301;
get_unit_id(302) -> 30302;
get_unit_id(303) -> 30303;
get_unit_id(304) -> 30304;
get_unit_id(305) -> 30305;
get_unit_id(306) -> 30306;
get_unit_id(307) -> 30307;
get_unit_id(308) -> 30308;
get_unit_id(309) -> 30309;
get_unit_id(310) -> 30310;
get_unit_id(311) -> 30311;
get_unit_id(312) -> 30312;
get_unit_id(313) -> 30313;
get_unit_id(314) -> 30314;
get_unit_id(315) -> 30315;
get_unit_id(316) -> 30316;
get_unit_id(317) -> 30317;
get_unit_id(318) -> 30318;
get_unit_id(319) -> 30319;
get_unit_id(320) -> 30320;
get_unit_id(321) -> 30321;
get_unit_id(322) -> 30322;
get_unit_id(323) -> 30323;
get_unit_id(324) -> 30324;
get_unit_id(325) -> 30325;
get_unit_id(326) -> 30326;
get_unit_id(327) -> 30327;
get_unit_id(328) -> 30328;
get_unit_id(329) -> 30329;
get_unit_id(330) -> 30330;
get_unit_id(331) -> 30331;
get_unit_id(332) -> 30332;
get_unit_id(333) -> 30333;
get_unit_id(334) -> 30334;
get_unit_id(335) -> 30335;
get_unit_id(336) -> 30336;
get_unit_id(337) -> 30337;
get_unit_id(338) -> 30338;
get_unit_id(339) -> 30339;
get_unit_id(340) -> 30340;
get_unit_id(341) -> 30341;
get_unit_id(342) -> 30342;
get_unit_id(343) -> 30343;
get_unit_id(344) -> 30344;
get_unit_id(345) -> 30345;
get_unit_id(346) -> 30346;
get_unit_id(347) -> 30347;
get_unit_id(348) -> 30348;
get_unit_id(349) -> 30349;
get_unit_id(350) -> 30350;
get_unit_id(351) -> 30351;
get_unit_id(352) -> 30352;
get_unit_id(353) -> 30353;
get_unit_id(354) -> 30354;
get_unit_id(355) -> 30355;
get_unit_id(356) -> 30356;
get_unit_id(357) -> 30357;
get_unit_id(358) -> 30358;
get_unit_id(359) -> 30359;
get_unit_id(360) -> 30360;
get_unit_id(361) -> 30361;
get_unit_id(362) -> 30362;
get_unit_id(363) -> 30363;
get_unit_id(364) -> 30364;
get_unit_id(365) -> 30365;
get_unit_id(366) -> 30366;
get_unit_id(367) -> 30367;
get_unit_id(368) -> 30368;
get_unit_id(369) -> 30369;
get_unit_id(370) -> 30370;
get_unit_id(371) -> 30371;
get_unit_id(372) -> 30372;
get_unit_id(373) -> 30373;
get_unit_id(374) -> 30374;
get_unit_id(375) -> 30375;
get_unit_id(376) -> 30376;
get_unit_id(377) -> 30377;
get_unit_id(378) -> 30378;
get_unit_id(379) -> 30379;
get_unit_id(380) -> 30380;
get_unit_id(381) -> 30381;
get_unit_id(382) -> 30382;
get_unit_id(383) -> 30383;
get_unit_id(384) -> 30384;
get_unit_id(385) -> 30385;
get_unit_id(386) -> 30386;
get_unit_id(387) -> 30387;
get_unit_id(388) -> 30388;
get_unit_id(389) -> 30389;
get_unit_id(390) -> 30390;
get_unit_id(391) -> 30391;
get_unit_id(392) -> 30392;
get_unit_id(393) -> 30393;
get_unit_id(394) -> 30394;
get_unit_id(395) -> 30395;
get_unit_id(396) -> 30396;
get_unit_id(397) -> 30397;
get_unit_id(398) -> 30398;
get_unit_id(399) -> 30399;
get_unit_id(400) -> 30400;
get_unit_id(401) -> 30401;
get_unit_id(402) -> 30402;
get_unit_id(403) -> 30403;
get_unit_id(404) -> 30404;
get_unit_id(405) -> 30405;
get_unit_id(406) -> 30406;
get_unit_id(407) -> 30407;
get_unit_id(408) -> 30408;
get_unit_id(409) -> 30409;
get_unit_id(410) -> 30410;
get_unit_id(411) -> 30411;
get_unit_id(412) -> 30412;
get_unit_id(413) -> 30413;
get_unit_id(414) -> 30414;
get_unit_id(415) -> 30415;
get_unit_id(416) -> 30416;
get_unit_id(417) -> 30417;
get_unit_id(418) -> 30418;
get_unit_id(419) -> 30419;
get_unit_id(420) -> 30420;
get_unit_id(421) -> 30421;
get_unit_id(422) -> 30422;
get_unit_id(423) -> 30423;
get_unit_id(424) -> 30424;
get_unit_id(425) -> 30425;
get_unit_id(426) -> 30426;
get_unit_id(427) -> 30427;
get_unit_id(428) -> 30428;
get_unit_id(429) -> 30429;
get_unit_id(430) -> 30430;
get_unit_id(431) -> 30431;
get_unit_id(432) -> 30432;
get_unit_id(433) -> 30433;
get_unit_id(434) -> 30434;
get_unit_id(435) -> 30435;
get_unit_id(436) -> 30436;
get_unit_id(437) -> 30437;
get_unit_id(438) -> 30438;
get_unit_id(439) -> 30439;
get_unit_id(440) -> 30440;
get_unit_id(441) -> 30441;
get_unit_id(442) -> 30442;
get_unit_id(443) -> 30443;
get_unit_id(444) -> 30444;
get_unit_id(445) -> 30445;
get_unit_id(446) -> 30446;
get_unit_id(447) -> 30447;
get_unit_id(448) -> 30448;
get_unit_id(449) -> 30449;
get_unit_id(450) -> 30450;
get_unit_id(451) -> 30451;
get_unit_id(452) -> 30452;
get_unit_id(453) -> 30453;
get_unit_id(454) -> 30454;
get_unit_id(455) -> 30455;
get_unit_id(456) -> 30456;
get_unit_id(457) -> 30457;
get_unit_id(458) -> 30458;
get_unit_id(459) -> 30459;
get_unit_id(460) -> 30460;
get_unit_id(461) -> 30461;
get_unit_id(462) -> 30462;
get_unit_id(463) -> 30463;
get_unit_id(464) -> 30464;
get_unit_id(465) -> 30465;
get_unit_id(466) -> 30466;
get_unit_id(467) -> 30467;
get_unit_id(468) -> 30468;
get_unit_id(469) -> 30469;
get_unit_id(470) -> 30470;
get_unit_id(471) -> 30471;
get_unit_id(472) -> 30472;
get_unit_id(473) -> 30473;
get_unit_id(474) -> 30474;
get_unit_id(475) -> 30475;
get_unit_id(476) -> 30476;
get_unit_id(477) -> 30477;
get_unit_id(478) -> 30478;
get_unit_id(479) -> 30479;
get_unit_id(480) -> 30480;
get_unit_id(481) -> 30481;
get_unit_id(482) -> 30482;
get_unit_id(483) -> 30483;
get_unit_id(484) -> 30484;
get_unit_id(485) -> 30485;
get_unit_id(486) -> 30486;
get_unit_id(487) -> 30487;
get_unit_id(488) -> 30488;
get_unit_id(489) -> 30489;
get_unit_id(490) -> 30490;
get_unit_id(491) -> 30491;
get_unit_id(492) -> 30492;
get_unit_id(493) -> 30493;
get_unit_id(494) -> 30494;
get_unit_id(495) -> 30495;
get_unit_id(496) -> 30496;
get_unit_id(497) -> 30497;
get_unit_id(498) -> 30498;
get_unit_id(499) -> 30499;
get_unit_id(500) -> 30500;
get_unit_id(501) -> 30501;
get_unit_id(502) -> 30502;
get_unit_id(503) -> 30503;
get_unit_id(504) -> 30504;
get_unit_id(505) -> 30505;
get_unit_id(506) -> 30506;
get_unit_id(507) -> 30507;
get_unit_id(508) -> 30508;
get_unit_id(509) -> 30509;
get_unit_id(510) -> 30510;
get_unit_id(511) -> 30511;
get_unit_id(512) -> 30512;
get_unit_id(513) -> 30513;
get_unit_id(514) -> 30514;
get_unit_id(515) -> 30515;
get_unit_id(516) -> 30516;
get_unit_id(517) -> 30517;
get_unit_id(518) -> 30518;
get_unit_id(519) -> 30519;
get_unit_id(520) -> 30520;
get_unit_id(521) -> 30521;
get_unit_id(522) -> 30522;
get_unit_id(523) -> 30523;
get_unit_id(524) -> 30524;
get_unit_id(525) -> 30525;
get_unit_id(526) -> 30526;
get_unit_id(527) -> 30527;
get_unit_id(528) -> 30528;
get_unit_id(529) -> 30529;
get_unit_id(530) -> 30530;
get_unit_id(531) -> 30531;
get_unit_id(532) -> 30532;
get_unit_id(533) -> 30533;
get_unit_id(534) -> 30534;
get_unit_id(535) -> 30535;
get_unit_id(536) -> 30536;
get_unit_id(537) -> 30537;
get_unit_id(538) -> 30538;
get_unit_id(539) -> 30539;
get_unit_id(540) -> 30540;
get_unit_id(541) -> 30541;
get_unit_id(542) -> 30542;
get_unit_id(543) -> 30543;
get_unit_id(544) -> 30544;
get_unit_id(545) -> 30545;
get_unit_id(546) -> 30546;
get_unit_id(547) -> 30547;
get_unit_id(548) -> 30548;
get_unit_id(549) -> 30549;
get_unit_id(550) -> 30550;
get_unit_id(551) -> 30551;
get_unit_id(552) -> 30552;
get_unit_id(553) -> 30553;
get_unit_id(554) -> 30554;
get_unit_id(555) -> 30555;
get_unit_id(556) -> 30556;
get_unit_id(557) -> 30557;
get_unit_id(558) -> 30558;
get_unit_id(559) -> 30559;
get_unit_id(560) -> 30560;
get_unit_id(561) -> 30561;
get_unit_id(562) -> 30562;
get_unit_id(563) -> 30563;
get_unit_id(564) -> 30564;
get_unit_id(565) -> 30565;
get_unit_id(566) -> 30566;
get_unit_id(567) -> 30567;
get_unit_id(568) -> 30568;
get_unit_id(569) -> 30569;
get_unit_id(570) -> 30570;
get_unit_id(571) -> 30571;
get_unit_id(572) -> 30572;
get_unit_id(573) -> 30573;
get_unit_id(574) -> 30574;
get_unit_id(575) -> 30575;
get_unit_id(576) -> 30576;
get_unit_id(577) -> 30577;
get_unit_id(578) -> 30578;
get_unit_id(579) -> 30579;
get_unit_id(580) -> 30580;
get_unit_id(581) -> 30581;
get_unit_id(582) -> 30582;
get_unit_id(583) -> 30583;
get_unit_id(584) -> 30584;
get_unit_id(585) -> 30585;
get_unit_id(586) -> 30586;
get_unit_id(587) -> 30587;
get_unit_id(588) -> 30588;
get_unit_id(589) -> 30589;
get_unit_id(590) -> 30590;
get_unit_id(591) -> 30591;
get_unit_id(592) -> 30592;
get_unit_id(593) -> 30593;
get_unit_id(594) -> 30594;
get_unit_id(595) -> 30595;
get_unit_id(596) -> 30596;
get_unit_id(597) -> 30597;
get_unit_id(598) -> 30598;
get_unit_id(599) -> 30599;
get_unit_id(600) -> 30600;
get_unit_id(601) -> 30601;
get_unit_id(602) -> 30602;
get_unit_id(603) -> 30603;
get_unit_id(604) -> 30604;
get_unit_id(605) -> 30605;
get_unit_id(606) -> 30606;
get_unit_id(607) -> 30607;
get_unit_id(608) -> 30608;
get_unit_id(609) -> 30609;
get_unit_id(610) -> 30610;
get_unit_id(611) -> 30611;
get_unit_id(612) -> 30612;
get_unit_id(613) -> 30613;
get_unit_id(614) -> 30614;
get_unit_id(615) -> 30615;
get_unit_id(616) -> 30616;
get_unit_id(617) -> 30617;
get_unit_id(618) -> 30618;
get_unit_id(619) -> 30619;
get_unit_id(620) -> 30620;
get_unit_id(621) -> 30621;
get_unit_id(622) -> 30622;
get_unit_id(623) -> 30623;
get_unit_id(624) -> 30624;
get_unit_id(625) -> 30625;
get_unit_id(626) -> 30626;
get_unit_id(627) -> 30627;
get_unit_id(628) -> 30628;
get_unit_id(629) -> 30629;
get_unit_id(630) -> 30630;
get_unit_id(631) -> 30631;
get_unit_id(632) -> 30632;
get_unit_id(633) -> 30633;
get_unit_id(634) -> 30634;
get_unit_id(635) -> 30635;
get_unit_id(636) -> 30636;
get_unit_id(637) -> 30637;
get_unit_id(638) -> 30638;
get_unit_id(639) -> 30639;
get_unit_id(640) -> 30640;
get_unit_id(641) -> 30641;
get_unit_id(642) -> 30642;
get_unit_id(643) -> 30643;
get_unit_id(644) -> 30644;
get_unit_id(645) -> 30645;
get_unit_id(646) -> 30646;
get_unit_id(647) -> 30647;
get_unit_id(648) -> 30648;
get_unit_id(649) -> 30649;
get_unit_id(650) -> 30650;
get_unit_id(651) -> 30651;
get_unit_id(652) -> 30652;
get_unit_id(653) -> 30653;
get_unit_id(654) -> 30654;
get_unit_id(655) -> 30655;
get_unit_id(656) -> 30656;
get_unit_id(657) -> 30657;
get_unit_id(658) -> 30658;
get_unit_id(659) -> 30659;
get_unit_id(660) -> 30660;
get_unit_id(661) -> 30661;
get_unit_id(662) -> 30662;
get_unit_id(663) -> 30663;
get_unit_id(664) -> 30664;
get_unit_id(665) -> 30665;
get_unit_id(666) -> 30666;
get_unit_id(667) -> 30667;
get_unit_id(668) -> 30668;
get_unit_id(669) -> 30669;
get_unit_id(670) -> 30670;
get_unit_id(671) -> 30671;
get_unit_id(672) -> 30672;
get_unit_id(673) -> 30673;
get_unit_id(674) -> 30674;
get_unit_id(675) -> 30675;
get_unit_id(676) -> 30676;
get_unit_id(677) -> 30677;
get_unit_id(678) -> 30678;
get_unit_id(679) -> 30679;
get_unit_id(680) -> 30680;
get_unit_id(681) -> 30681;
get_unit_id(682) -> 30682;
get_unit_id(683) -> 30683;
get_unit_id(684) -> 30684;
get_unit_id(685) -> 30685;
get_unit_id(686) -> 30686;
get_unit_id(687) -> 30687;
get_unit_id(688) -> 30688;
get_unit_id(689) -> 30689;
get_unit_id(690) -> 30690;
get_unit_id(691) -> 30691;
get_unit_id(692) -> 30692;
get_unit_id(693) -> 30693;
get_unit_id(694) -> 30694;
get_unit_id(695) -> 30695;
get_unit_id(696) -> 30696;
get_unit_id(697) -> 30697;
get_unit_id(698) -> 30698;
get_unit_id(699) -> 30699;
get_unit_id(700) -> 30700;
get_unit_id(701) -> 30701;
get_unit_id(702) -> 30702;
get_unit_id(703) -> 30703;
get_unit_id(704) -> 30704;
get_unit_id(705) -> 30705;
get_unit_id(706) -> 30706;
get_unit_id(707) -> 30707;
get_unit_id(708) -> 30708;
get_unit_id(709) -> 30709;
get_unit_id(710) -> 30710;
get_unit_id(711) -> 30711;
get_unit_id(712) -> 30712;
get_unit_id(713) -> 30713;
get_unit_id(714) -> 30714;
get_unit_id(715) -> 30715;
get_unit_id(716) -> 30716;
get_unit_id(717) -> 30717;
get_unit_id(718) -> 30718;
get_unit_id(719) -> 30719;
get_unit_id(720) -> 30720;
get_unit_id(721) -> 30721;
get_unit_id(722) -> 30722;
get_unit_id(723) -> 30723;
get_unit_id(724) -> 30724;
get_unit_id(725) -> 30725;
get_unit_id(726) -> 30726;
get_unit_id(727) -> 30727;
get_unit_id(728) -> 30728;
get_unit_id(729) -> 30729;
get_unit_id(730) -> 30730;
get_unit_id(731) -> 30731;
get_unit_id(732) -> 30732;
get_unit_id(733) -> 30733;
get_unit_id(734) -> 30734;
get_unit_id(735) -> 30735;
get_unit_id(736) -> 30736;
get_unit_id(737) -> 30737;
get_unit_id(738) -> 30738;
get_unit_id(739) -> 30739;
get_unit_id(740) -> 30740;
get_unit_id(741) -> 30741;
get_unit_id(742) -> 30742;
get_unit_id(743) -> 30743;
get_unit_id(744) -> 30744;
get_unit_id(745) -> 30745;
get_unit_id(746) -> 30746;
get_unit_id(747) -> 30747;
get_unit_id(748) -> 30748;
get_unit_id(749) -> 30749;
get_unit_id(750) -> 30750;
get_unit_id(751) -> 30751;
get_unit_id(752) -> 30752;
get_unit_id(753) -> 30753;
get_unit_id(754) -> 30754;
get_unit_id(755) -> 30755;
get_unit_id(756) -> 30756;
get_unit_id(757) -> 30757;
get_unit_id(758) -> 30758;
get_unit_id(759) -> 30759;
get_unit_id(760) -> 30760;
get_unit_id(761) -> 30761;
get_unit_id(762) -> 30762;
get_unit_id(763) -> 30763;
get_unit_id(764) -> 30764;
get_unit_id(765) -> 30765;
get_unit_id(766) -> 30766;
get_unit_id(767) -> 30767;
get_unit_id(768) -> 30768;
get_unit_id(769) -> 30769;
get_unit_id(770) -> 30770;
get_unit_id(771) -> 30771;
get_unit_id(772) -> 30772;
get_unit_id(773) -> 30773;
get_unit_id(774) -> 30774;
get_unit_id(775) -> 30775;
get_unit_id(776) -> 30776;
get_unit_id(777) -> 30777;
get_unit_id(778) -> 30778;
get_unit_id(779) -> 30779;
get_unit_id(780) -> 30780;
get_unit_id(781) -> 30781;
get_unit_id(782) -> 30782;
get_unit_id(783) -> 30783;
get_unit_id(784) -> 30784;
get_unit_id(785) -> 30785;
get_unit_id(786) -> 30786;
get_unit_id(787) -> 30787;
get_unit_id(788) -> 30788;
get_unit_id(789) -> 30789;
get_unit_id(790) -> 30790;
get_unit_id(791) -> 30791;
get_unit_id(792) -> 30792;
get_unit_id(793) -> 30793;
get_unit_id(794) -> 30794;
get_unit_id(795) -> 30795;
get_unit_id(796) -> 30796;
get_unit_id(797) -> 30797;
get_unit_id(798) -> 30798;
get_unit_id(799) -> 30799;
get_unit_id(800) -> 30800;
get_unit_id(801) -> 30801;
get_unit_id(802) -> 30802;
get_unit_id(803) -> 30803;
get_unit_id(804) -> 30804;
get_unit_id(805) -> 30805;
get_unit_id(806) -> 30806;
get_unit_id(807) -> 30807;
get_unit_id(808) -> 30808;
get_unit_id(809) -> 30809;
get_unit_id(810) -> 30810;
get_unit_id(811) -> 30811;
get_unit_id(812) -> 30812;
get_unit_id(813) -> 30813;
get_unit_id(814) -> 30814;
get_unit_id(815) -> 30815;
get_unit_id(816) -> 30816;
get_unit_id(817) -> 30817;
get_unit_id(818) -> 30818;
get_unit_id(819) -> 30819;
get_unit_id(820) -> 30820;
get_unit_id(821) -> 30821;
get_unit_id(822) -> 30822;
get_unit_id(823) -> 30823;
get_unit_id(824) -> 30824;
get_unit_id(825) -> 30825;
get_unit_id(826) -> 30826;
get_unit_id(827) -> 30827;
get_unit_id(828) -> 30828;
get_unit_id(829) -> 30829;
get_unit_id(830) -> 30830;
get_unit_id(831) -> 30831;
get_unit_id(832) -> 30832;
get_unit_id(833) -> 30833;
get_unit_id(834) -> 30834;
get_unit_id(835) -> 30835;
get_unit_id(836) -> 30836;
get_unit_id(837) -> 30837;
get_unit_id(838) -> 30838;
get_unit_id(839) -> 30839;
get_unit_id(840) -> 30840;
get_unit_id(841) -> 30841;
get_unit_id(842) -> 30842;
get_unit_id(843) -> 30843;
get_unit_id(844) -> 30844;
get_unit_id(845) -> 30845;
get_unit_id(846) -> 30846;
get_unit_id(847) -> 30847;
get_unit_id(848) -> 30848;
get_unit_id(849) -> 30849;
get_unit_id(850) -> 30850;
get_unit_id(851) -> 30851;
get_unit_id(852) -> 30852;
get_unit_id(853) -> 30853;
get_unit_id(854) -> 30854;
get_unit_id(855) -> 30855;
get_unit_id(856) -> 30856;
get_unit_id(857) -> 30857;
get_unit_id(858) -> 30858;
get_unit_id(859) -> 30859;
get_unit_id(860) -> 30860;
get_unit_id(861) -> 30861;
get_unit_id(862) -> 30862;
get_unit_id(863) -> 30863;
get_unit_id(864) -> 30864;
get_unit_id(865) -> 30865;
get_unit_id(866) -> 30866;
get_unit_id(867) -> 30867;
get_unit_id(868) -> 30868;
get_unit_id(869) -> 30869;
get_unit_id(870) -> 30870;
get_unit_id(871) -> 30871;
get_unit_id(872) -> 30872;
get_unit_id(873) -> 30873;
get_unit_id(874) -> 30874;
get_unit_id(875) -> 30875;
get_unit_id(876) -> 30876;
get_unit_id(877) -> 30877;
get_unit_id(878) -> 30878;
get_unit_id(879) -> 30879;
get_unit_id(880) -> 30880;
get_unit_id(881) -> 30881;
get_unit_id(882) -> 30882;
get_unit_id(883) -> 30883;
get_unit_id(884) -> 30884;
get_unit_id(885) -> 30885;
get_unit_id(886) -> 30886;
get_unit_id(887) -> 30887;
get_unit_id(888) -> 30888;
get_unit_id(889) -> 30889;
get_unit_id(890) -> 30890;
get_unit_id(891) -> 30891;
get_unit_id(892) -> 30892;
get_unit_id(893) -> 30893;
get_unit_id(894) -> 30894;
get_unit_id(895) -> 30895;
get_unit_id(896) -> 30896;
get_unit_id(897) -> 30897;
get_unit_id(898) -> 30898;
get_unit_id(899) -> 30899;
get_unit_id(900) -> 30900;
get_unit_id(901) -> 30901;
get_unit_id(902) -> 30902;
get_unit_id(903) -> 30903;
get_unit_id(904) -> 30904;
get_unit_id(905) -> 30905;
get_unit_id(906) -> 30906;
get_unit_id(907) -> 30907;
get_unit_id(908) -> 30908;
get_unit_id(909) -> 30909;
get_unit_id(910) -> 30910;
get_unit_id(911) -> 30911;
get_unit_id(912) -> 30912;
get_unit_id(913) -> 30913;
get_unit_id(914) -> 30914;
get_unit_id(915) -> 30915;
get_unit_id(916) -> 30916;
get_unit_id(917) -> 30917;
get_unit_id(918) -> 30918;
get_unit_id(919) -> 30919;
get_unit_id(920) -> 30920;
get_unit_id(921) -> 30921;
get_unit_id(922) -> 30922;
get_unit_id(923) -> 30923;
get_unit_id(924) -> 30924;
get_unit_id(925) -> 30925;
get_unit_id(926) -> 30926;
get_unit_id(927) -> 30927;
get_unit_id(928) -> 30928;
get_unit_id(929) -> 30929;
get_unit_id(930) -> 30930;
get_unit_id(931) -> 30931;
get_unit_id(932) -> 30932;
get_unit_id(933) -> 30933;
get_unit_id(934) -> 30934;
get_unit_id(935) -> 30935;
get_unit_id(936) -> 30936;
get_unit_id(937) -> 30937;
get_unit_id(938) -> 30938;
get_unit_id(939) -> 30939;
get_unit_id(940) -> 30940;
get_unit_id(941) -> 30941;
get_unit_id(942) -> 30942;
get_unit_id(943) -> 30943;
get_unit_id(944) -> 30944;
get_unit_id(945) -> 30945;
get_unit_id(946) -> 30946;
get_unit_id(947) -> 30947;
get_unit_id(948) -> 30948;
get_unit_id(949) -> 30949;
get_unit_id(950) -> 30950;
get_unit_id(951) -> 30951;
get_unit_id(952) -> 30952;
get_unit_id(953) -> 30953;
get_unit_id(954) -> 30954;
get_unit_id(955) -> 30955;
get_unit_id(956) -> 30956;
get_unit_id(957) -> 30957;
get_unit_id(958) -> 30958;
get_unit_id(959) -> 30959;
get_unit_id(960) -> 30960;
get_unit_id(961) -> 30961;
get_unit_id(962) -> 30962;
get_unit_id(963) -> 30963;
get_unit_id(964) -> 30964;
get_unit_id(965) -> 30965;
get_unit_id(966) -> 30966;
get_unit_id(967) -> 30967;
get_unit_id(968) -> 30968;
get_unit_id(969) -> 30969;
get_unit_id(970) -> 30970;
get_unit_id(971) -> 30971;
get_unit_id(972) -> 30972;
get_unit_id(973) -> 30973;
get_unit_id(974) -> 30974;
get_unit_id(975) -> 30975;
get_unit_id(976) -> 30976;
get_unit_id(977) -> 30977;
get_unit_id(978) -> 30978;
get_unit_id(979) -> 30979;
get_unit_id(980) -> 30980;
get_unit_id(981) -> 30981;
get_unit_id(982) -> 30982;
get_unit_id(983) -> 30983;
get_unit_id(984) -> 30984;
get_unit_id(985) -> 30985;
get_unit_id(986) -> 30986;
get_unit_id(987) -> 30987;
get_unit_id(988) -> 30988;
get_unit_id(989) -> 30989;
get_unit_id(990) -> 30990;
get_unit_id(991) -> 30991;
get_unit_id(992) -> 30992;
get_unit_id(993) -> 30993;
get_unit_id(994) -> 30994;
get_unit_id(995) -> 30995;
get_unit_id(996) -> 30996;
get_unit_id(997) -> 30997;
get_unit_id(998) -> 30998;
get_unit_id(999) -> 30999;
get_unit_id(1000) -> 31000;
get_unit_id(_Info) ->
    logger:data_error("get_unit_id_data_not_exist===>~w",
		      [_Info], star_tower_data, 939),
    undefined.

get_power(1) -> 11815;
get_power(2) -> 12018;
get_power(3) -> 12221;
get_power(4) -> 12424;
get_power(5) -> 12627;
get_power(6) -> 12830;
get_power(7) -> 13033;
get_power(8) -> 13236;
get_power(9) -> 13439;
get_power(10) -> 13642;
get_power(11) -> 14275;
get_power(12) -> 14975;
get_power(13) -> 15675;
get_power(14) -> 16425;
get_power(15) -> 17190;
get_power(16) -> 17965;
get_power(17) -> 18760;
get_power(18) -> 19545;
get_power(19) -> 20380;
get_power(20) -> 21255;
get_power(21) -> 25070;
get_power(22) -> 26010;
get_power(23) -> 26960;
get_power(24) -> 27905;
get_power(25) -> 29965;
get_power(26) -> 35795;
get_power(27) -> 36810;
get_power(28) -> 37830;
get_power(29) -> 38845;
get_power(30) -> 39865;
get_power(31) -> 44070;
get_power(32) -> 44620;
get_power(33) -> 45175;
get_power(34) -> 45720;
get_power(35) -> 46275;
get_power(36) -> 46830;
get_power(37) -> 47375;
get_power(38) -> 47930;
get_power(39) -> 48480;
get_power(40) -> 50705;
get_power(41) -> 57585;
get_power(42) -> 58785;
get_power(43) -> 59985;
get_power(44) -> 61200;
get_power(45) -> 62400;
get_power(46) -> 63600;
get_power(47) -> 64800;
get_power(48) -> 66005;
get_power(49) -> 67205;
get_power(50) -> 70645;
get_power(51) -> 83590;
get_power(52) -> 84910;
get_power(53) -> 86230;
get_power(54) -> 87550;
get_power(55) -> 88870;
get_power(56) -> 90190;
get_power(57) -> 91505;
get_power(58) -> 92825;
get_power(59) -> 94145;
get_power(60) -> 105138;
get_power(61) -> 115094;
get_power(62) -> 118856;
get_power(63) -> 122618;
get_power(64) -> 124499;
get_power(65) -> 130142;
get_power(66) -> 133904;
get_power(67) -> 137666;
get_power(68) -> 141428;
get_power(69) -> 145190;
get_power(70) -> 145390;
get_power(71) -> 146200;
get_power(72) -> 147270;
get_power(73) -> 148295;
get_power(74) -> 149335;
get_power(75) -> 150370;
get_power(76) -> 151415;
get_power(77) -> 152000;
get_power(78) -> 152515;
get_power(79) -> 153055;
get_power(80) -> 154065;
get_power(81) -> 154365;
get_power(82) -> 155135;
get_power(83) -> 155535;
get_power(84) -> 156145;
get_power(85) -> 156545;
get_power(86) -> 157210;
get_power(87) -> 157510;
get_power(88) -> 158245;
get_power(89) -> 158645;
get_power(90) -> 159290;
get_power(91) -> 159690;
get_power(92) -> 160325;
get_power(93) -> 160725;
get_power(94) -> 161365;
get_power(95) -> 161665;
get_power(96) -> 162400;
get_power(97) -> 162700;
get_power(98) -> 163460;
get_power(99) -> 163860;
get_power(100) -> 167810;
get_power(101) -> 167910;
get_power(102) -> 176060;
get_power(103) -> 176560;
get_power(104) -> 177100;
get_power(105) -> 177600;
get_power(106) -> 178180;
get_power(107) -> 178780;
get_power(108) -> 179235;
get_power(109) -> 179635;
get_power(110) -> 180300;
get_power(111) -> 180700;
get_power(112) -> 181360;
get_power(113) -> 181760;
get_power(114) -> 182420;
get_power(115) -> 182620;
get_power(116) -> 183480;
get_power(117) -> 183780;
get_power(118) -> 184555;
get_power(119) -> 184855;
get_power(120) -> 185600;
get_power(121) -> 185900;
get_power(122) -> 186690;
get_power(123) -> 186990;
get_power(124) -> 187735;
get_power(125) -> 187935;
get_power(126) -> 188810;
get_power(127) -> 188910;
get_power(128) -> 189870;
get_power(129) -> 190470;
get_power(130) -> 190935;
get_power(131) -> 191535;
get_power(132) -> 191990;
get_power(133) -> 192590;
get_power(134) -> 193065;
get_power(135) -> 193565;
get_power(136) -> 194115;
get_power(137) -> 194415;
get_power(138) -> 195200;
get_power(139) -> 195600;
get_power(140) -> 200145;
get_power(141) -> 200645;
get_power(142) -> 215775;
get_power(143) -> 215975;
get_power(144) -> 216840;
get_power(145) -> 216940;
get_power(146) -> 217940;
get_power(147) -> 218540;
get_power(148) -> 219010;
get_power(149) -> 220510;
get_power(150) -> 231975;
get_power(151) -> 232575;
get_power(152) -> 233575;
get_power(153) -> 242925;
get_power(154) -> 243325;
get_power(155) -> 243525;
get_power(156) -> 253875;
get_power(157) -> 254275;
get_power(158) -> 264825;
get_power(159) -> 265325;
get_power(160) -> 275775;
get_power(161) -> 276575;
get_power(162) -> 277235;
get_power(163) -> 279235;
get_power(164) -> 278665;
get_power(165) -> 278965;
get_power(166) -> 280150;
get_power(167) -> 280650;
get_power(168) -> 281580;
get_power(169) -> 281980;
get_power(170) -> 294230;
get_power(171) -> 294230;
get_power(172) -> 294230;
get_power(173) -> 295740;
get_power(174) -> 295740;
get_power(175) -> 295740;
get_power(176) -> 295740;
get_power(177) -> 297275;
get_power(178) -> 297275;
get_power(179) -> 297275;
get_power(180) -> 298775;
get_power(181) -> 298775;
get_power(182) -> 298775;
get_power(183) -> 300295;
get_power(184) -> 300295;
get_power(185) -> 300295;
get_power(186) -> 300295;
get_power(187) -> 301830;
get_power(188) -> 301830;
get_power(189) -> 301830;
get_power(190) -> 303360;
get_power(191) -> 303360;
get_power(192) -> 303360;
get_power(193) -> 304850;
get_power(194) -> 304850;
get_power(195) -> 304850;
get_power(196) -> 304850;
get_power(197) -> 306380;
get_power(198) -> 306380;
get_power(199) -> 306380;
get_power(200) -> 312360;
get_power(201) -> 312360;
get_power(202) -> 312360;
get_power(203) -> 327035;
get_power(204) -> 327035;
get_power(205) -> 327035;
get_power(206) -> 327035;
get_power(207) -> 328560;
get_power(208) -> 328560;
get_power(209) -> 328560;
get_power(210) -> 330125;
get_power(211) -> 330125;
get_power(212) -> 330125;
get_power(213) -> 331675;
get_power(214) -> 331675;
get_power(215) -> 331675;
get_power(216) -> 331675;
get_power(217) -> 333235;
get_power(218) -> 352607;
get_power(219) -> 371979;
get_power(220) -> 410723;
get_power(221) -> 430095;
get_power(222) -> 430095;
get_power(223) -> 432240;
get_power(224) -> 432240;
get_power(225) -> 432240;
get_power(226) -> 432240;
get_power(227) -> 434375;
get_power(228) -> 434375;
get_power(229) -> 434375;
get_power(230) -> 436520;
get_power(231) -> 436520;
get_power(232) -> 436520;
get_power(233) -> 438600;
get_power(234) -> 438600;
get_power(235) -> 438600;
get_power(236) -> 438600;
get_power(237) -> 440730;
get_power(238) -> 440730;
get_power(239) -> 440730;
get_power(240) -> 442875;
get_power(241) -> 442875;
get_power(242) -> 442875;
get_power(243) -> 445010;
get_power(244) -> 445010;
get_power(245) -> 445010;
get_power(246) -> 445010;
get_power(247) -> 447105;
get_power(248) -> 447105;
get_power(249) -> 447105;
get_power(250) -> 449250;
get_power(251) -> 449250;
get_power(252) -> 449250;
get_power(253) -> 451385;
get_power(254) -> 451385;
get_power(255) -> 451385;
get_power(256) -> 451385;
get_power(257) -> 453530;
get_power(258) -> 453530;
get_power(259) -> 453530;
get_power(260) -> 455620;
get_power(261) -> 455620;
get_power(262) -> 455620;
get_power(263) -> 457755;
get_power(264) -> 457755;
get_power(265) -> 457755;
get_power(266) -> 457755;
get_power(267) -> 464905;
get_power(268) -> 464905;
get_power(269) -> 464905;
get_power(270) -> 481595;
get_power(271) -> 481595;
get_power(272) -> 481595;
get_power(273) -> 483725;
get_power(274) -> 483725;
get_power(275) -> 483725;
get_power(276) -> 483725;
get_power(277) -> 485900;
get_power(278) -> 485900;
get_power(279) -> 485900;
get_power(280) -> 488070;
get_power(281) -> 488070;
get_power(282) -> 488070;
get_power(283) -> 490245;
get_power(284) -> 490245;
get_power(285) -> 490245;
get_power(286) -> 522435;
get_power(287) -> 554625;
get_power(288) -> 586815;
get_power(289) -> 651195;
get_power(290) -> 654230;
get_power(291) -> 654230;
get_power(292) -> 654230;
get_power(293) -> 657250;
get_power(294) -> 657250;
get_power(295) -> 657250;
get_power(296) -> 657250;
get_power(297) -> 660275;
get_power(298) -> 660275;
get_power(299) -> 660275;
get_power(300) -> 663265;
get_power(301) -> 663265;
get_power(302) -> 663265;
get_power(303) -> 666285;
get_power(304) -> 666285;
get_power(305) -> 666285;
get_power(306) -> 666285;
get_power(307) -> 669325;
get_power(308) -> 669325;
get_power(309) -> 669325;
get_power(310) -> 672350;
get_power(311) -> 672350;
get_power(312) -> 672350;
get_power(313) -> 675355;
get_power(314) -> 675355;
get_power(315) -> 675355;
get_power(316) -> 675355;
get_power(317) -> 678370;
get_power(318) -> 678370;
get_power(319) -> 678370;
get_power(320) -> 681410;
get_power(321) -> 681410;
get_power(322) -> 681410;
get_power(323) -> 684435;
get_power(324) -> 684435;
get_power(325) -> 684435;
get_power(326) -> 684435;
get_power(327) -> 687430;
get_power(328) -> 687430;
get_power(329) -> 687430;
get_power(330) -> 690455;
get_power(331) -> 690455;
get_power(332) -> 690455;
get_power(333) -> 699040;
get_power(334) -> 699040;
get_power(335) -> 699040;
get_power(336) -> 699040;
get_power(337) -> 750340;
get_power(338) -> 750340;
get_power(339) -> 750340;
get_power(340) -> 753535;
get_power(341) -> 753535;
get_power(342) -> 753535;
get_power(343) -> 756740;
get_power(344) -> 756740;
get_power(345) -> 756740;
get_power(346) -> 756740;
get_power(347) -> 759950;
get_power(348) -> 759950;
get_power(349) -> 759950;
get_power(350) -> 818440;
get_power(351) -> 873725;
get_power(352) -> 929010;
get_power(353) -> 984295;
get_power(354) -> 1039580;
get_power(355) -> 1039580;
get_power(356) -> 1039580;
get_power(357) -> 1044105;
get_power(358) -> 1044105;
get_power(359) -> 1044105;
get_power(360) -> 1048635;
get_power(361) -> 1048635;
get_power(362) -> 1048635;
get_power(363) -> 1053180;
get_power(364) -> 1053180;
get_power(365) -> 1053180;
get_power(366) -> 1053180;
get_power(367) -> 1057710;
get_power(368) -> 1057710;
get_power(369) -> 1057710;
get_power(370) -> 1062250;
get_power(371) -> 1062250;
get_power(372) -> 1062250;
get_power(373) -> 1066780;
get_power(374) -> 1066780;
get_power(375) -> 1066780;
get_power(376) -> 1066780;
get_power(377) -> 1071320;
get_power(378) -> 1071320;
get_power(379) -> 1071320;
get_power(380) -> 1075865;
get_power(381) -> 1075865;
get_power(382) -> 1075865;
get_power(383) -> 1080385;
get_power(384) -> 1080385;
get_power(385) -> 1080385;
get_power(386) -> 1080385;
get_power(387) -> 1084925;
get_power(388) -> 1084925;
get_power(389) -> 1084925;
get_power(390) -> 1089455;
get_power(391) -> 1089455;
get_power(392) -> 1089455;
get_power(393) -> 1093995;
get_power(394) -> 1093995;
get_power(395) -> 1093995;
get_power(396) -> 1093995;
get_power(397) -> 1098535;
get_power(398) -> 1098535;
get_power(399) -> 1098535;
get_power(400) -> 1109215;
get_power(401) -> 1109215;
get_power(402) -> 1109215;
get_power(403) -> 1152815;
get_power(404) -> 1152815;
get_power(405) -> 1152815;
get_power(406) -> 1152815;
get_power(407) -> 1157430;
get_power(408) -> 1157430;
get_power(409) -> 1157430;
get_power(410) -> 1162030;
get_power(411) -> 1162030;
get_power(412) -> 1162030;
get_power(413) -> 1166660;
get_power(414) -> 1166660;
get_power(415) -> 1166660;
get_power(416) -> 1166660;
get_power(417) -> 1171275;
get_power(418) -> 1171275;
get_power(419) -> 1171275;
get_power(420) -> 1175870;
get_power(421) -> 1175870;
get_power(422) -> 1175870;
get_power(423) -> 1180485;
get_power(424) -> 1180485;
get_power(425) -> 1180485;
get_power(426) -> 1180485;
get_power(427) -> 1185090;
get_power(428) -> 1185090;
get_power(429) -> 1185090;
get_power(430) -> 1189715;
get_power(431) -> 1189715;
get_power(432) -> 1189715;
get_power(433) -> 1194330;
get_power(434) -> 1194330;
get_power(435) -> 1194330;
get_power(436) -> 1194330;
get_power(437) -> 1198935;
get_power(438) -> 1198935;
get_power(439) -> 1198935;
get_power(440) -> 1203525;
get_power(441) -> 1203525;
get_power(442) -> 1203525;
get_power(443) -> 1208140;
get_power(444) -> 1208140;
get_power(445) -> 1208140;
get_power(446) -> 1208140;
get_power(447) -> 1212770;
get_power(448) -> 1212770;
get_power(449) -> 1212770;
get_power(450) -> 1217375;
get_power(451) -> 1217375;
get_power(452) -> 1217375;
get_power(453) -> 1221990;
get_power(454) -> 1221990;
get_power(455) -> 1221990;
get_power(456) -> 1221990;
get_power(457) -> 1226585;
get_power(458) -> 1226585;
get_power(459) -> 1226585;
get_power(460) -> 1231200;
get_power(461) -> 1231200;
get_power(462) -> 1231200;
get_power(463) -> 1235825;
get_power(464) -> 1235825;
get_power(465) -> 1235825;
get_power(466) -> 1235825;
get_power(467) -> 1247120;
get_power(468) -> 1247120;
get_power(469) -> 1247120;
get_power(470) -> 1290235;
get_power(471) -> 1290235;
get_power(472) -> 1290235;
get_power(473) -> 1294920;
get_power(474) -> 1294920;
get_power(475) -> 1294920;
get_power(476) -> 1294920;
get_power(477) -> 1299600;
get_power(478) -> 1299600;
get_power(479) -> 1299600;
get_power(480) -> 1304295;
get_power(481) -> 1304295;
get_power(482) -> 1304295;
get_power(483) -> 1308985;
get_power(484) -> 1308985;
get_power(485) -> 1308985;
get_power(486) -> 1308985;
get_power(487) -> 1313670;
get_power(488) -> 1313670;
get_power(489) -> 1313670;
get_power(490) -> 1318360;
get_power(491) -> 1318360;
get_power(492) -> 1318360;
get_power(493) -> 1323050;
get_power(494) -> 1323050;
get_power(495) -> 1323050;
get_power(496) -> 1323050;
get_power(497) -> 1327730;
get_power(498) -> 1327730;
get_power(499) -> 1327730;
get_power(500) -> 1332420;
get_power(501) -> 1448502;
get_power(502) -> 1453650;
get_power(503) -> 1458809;
get_power(504) -> 1463968;
get_power(505) -> 1469116;
get_power(506) -> 1474275;
get_power(507) -> 1479428;
get_power(508) -> 1484587;
get_power(509) -> 1494894;
get_power(510) -> 1500048;
get_power(511) -> 1505201;
get_power(512) -> 1510355;
get_power(513) -> 1515508;
get_power(514) -> 1520662;
get_power(515) -> 1525815;
get_power(516) -> 1530969;
get_power(517) -> 1536122;
get_power(518) -> 1541276;
get_power(519) -> 1546429;
get_power(520) -> 1551583;
get_power(521) -> 1556736;
get_power(522) -> 1561890;
get_power(523) -> 1567043;
get_power(524) -> 1572197;
get_power(525) -> 1577350;
get_power(526) -> 1582504;
get_power(527) -> 1587657;
get_power(528) -> 1592811;
get_power(529) -> 1597964;
get_power(530) -> 1603118;
get_power(531) -> 1608271;
get_power(532) -> 1613425;
get_power(533) -> 1618578;
get_power(534) -> 1623732;
get_power(535) -> 1628885;
get_power(536) -> 1634039;
get_power(537) -> 1639192;
get_power(538) -> 1644346;
get_power(539) -> 1649499;
get_power(540) -> 1675267;
get_power(541) -> 1680420;
get_power(542) -> 1685574;
get_power(543) -> 1690727;
get_power(544) -> 1695881;
get_power(545) -> 1701034;
get_power(546) -> 1706188;
get_power(547) -> 1711341;
get_power(548) -> 1716495;
get_power(549) -> 1726802;
get_power(550) -> 1737109;
get_power(551) -> 1747416;
get_power(552) -> 1757723;
get_power(553) -> 1768030;
get_power(554) -> 1778337;
get_power(555) -> 1788644;
get_power(556) -> 1798951;
get_power(557) -> 1809258;
get_power(558) -> 1829872;
get_power(559) -> 1840179;
get_power(560) -> 1855639;
get_power(561) -> 1871100;
get_power(562) -> 1886560;
get_power(563) -> 1902021;
get_power(564) -> 1917481;
get_power(565) -> 1932942;
get_power(566) -> 1948402;
get_power(567) -> 1963863;
get_power(568) -> 1979323;
get_power(569) -> 1984477;
get_power(570) -> 1989630;
get_power(571) -> 1994784;
get_power(572) -> 1999937;
get_power(573) -> 2005091;
get_power(574) -> 2010244;
get_power(575) -> 2015398;
get_power(576) -> 2020551;
get_power(577) -> 2025705;
get_power(578) -> 2030858;
get_power(579) -> 2036012;
get_power(580) -> 2046319;
get_power(581) -> 2056626;
get_power(582) -> 2066933;
get_power(583) -> 2077240;
get_power(584) -> 2087547;
get_power(585) -> 2097854;
get_power(586) -> 2108161;
get_power(587) -> 2118468;
get_power(588) -> 2128775;
get_power(589) -> 2139082;
get_power(590) -> 2149389;
get_power(591) -> 2159696;
get_power(592) -> 2170003;
get_power(593) -> 2180310;
get_power(594) -> 2190617;
get_power(595) -> 2200924;
get_power(596) -> 2211231;
get_power(597) -> 2221538;
get_power(598) -> 2231845;
get_power(599) -> 2242152;
get_power(600) -> 2242152;
get_power(601) -> 2451606;
get_power(602) -> 2457228;
get_power(603) -> 2462850;
get_power(604) -> 2468472;
get_power(605) -> 2474094;
get_power(606) -> 2479716;
get_power(607) -> 2485338;
get_power(608) -> 2490960;
get_power(609) -> 2496582;
get_power(610) -> 2502204;
get_power(611) -> 2507826;
get_power(612) -> 2513448;
get_power(613) -> 2519070;
get_power(614) -> 2524692;
get_power(615) -> 2530314;
get_power(616) -> 2535936;
get_power(617) -> 2541558;
get_power(618) -> 2547180;
get_power(619) -> 2552802;
get_power(620) -> 2558424;
get_power(621) -> 2564046;
get_power(622) -> 2569668;
get_power(623) -> 2575290;
get_power(624) -> 2580912;
get_power(625) -> 2586534;
get_power(626) -> 2592156;
get_power(627) -> 2597778;
get_power(628) -> 2603400;
get_power(629) -> 2609022;
get_power(630) -> 2614644;
get_power(631) -> 2620266;
get_power(632) -> 2625888;
get_power(633) -> 2631510;
get_power(634) -> 2637132;
get_power(635) -> 2642754;
get_power(636) -> 2648376;
get_power(637) -> 2653998;
get_power(638) -> 2659620;
get_power(639) -> 2665242;
get_power(640) -> 2670864;
get_power(641) -> 2676486;
get_power(642) -> 2682108;
get_power(643) -> 2687730;
get_power(644) -> 2693352;
get_power(645) -> 2698974;
get_power(646) -> 2704596;
get_power(647) -> 2710218;
get_power(648) -> 2715840;
get_power(649) -> 2721462;
get_power(650) -> 2727084;
get_power(651) -> 2732706;
get_power(652) -> 2738328;
get_power(653) -> 2743950;
get_power(654) -> 2749572;
get_power(655) -> 2755194;
get_power(656) -> 2760816;
get_power(657) -> 2766438;
get_power(658) -> 2772060;
get_power(659) -> 2777682;
get_power(660) -> 2783304;
get_power(661) -> 2788926;
get_power(662) -> 2794548;
get_power(663) -> 2800170;
get_power(664) -> 2805792;
get_power(665) -> 2811414;
get_power(666) -> 2817036;
get_power(667) -> 2822658;
get_power(668) -> 2828280;
get_power(669) -> 2833902;
get_power(670) -> 2839524;
get_power(671) -> 2845146;
get_power(672) -> 2850768;
get_power(673) -> 2856390;
get_power(674) -> 2862012;
get_power(675) -> 2867634;
get_power(676) -> 2873256;
get_power(677) -> 2878878;
get_power(678) -> 2884500;
get_power(679) -> 2890122;
get_power(680) -> 2895744;
get_power(681) -> 2901366;
get_power(682) -> 2906988;
get_power(683) -> 2912610;
get_power(684) -> 2918232;
get_power(685) -> 2923854;
get_power(686) -> 2929476;
get_power(687) -> 2935098;
get_power(688) -> 2940720;
get_power(689) -> 2946342;
get_power(690) -> 2951964;
get_power(691) -> 2957586;
get_power(692) -> 2963208;
get_power(693) -> 2968830;
get_power(694) -> 2974452;
get_power(695) -> 2980074;
get_power(696) -> 2985696;
get_power(697) -> 2991318;
get_power(698) -> 2996940;
get_power(699) -> 3002562;
get_power(700) -> 3008184;
get_power(701) -> 3040757;
get_power(702) -> 3068946;
get_power(703) -> 3098873;
get_power(704) -> 3127648;
get_power(705) -> 3158231;
get_power(706) -> 3187731;
get_power(707) -> 3216465;
get_power(708) -> 3245726;
get_power(709) -> 3275014;
get_power(710) -> 3304156;
get_power(711) -> 3333936;
get_power(712) -> 3362522;
get_power(713) -> 3392507;
get_power(714) -> 3421899;
get_power(715) -> 3451602;
get_power(716) -> 3480065;
get_power(717) -> 3509010;
get_power(718) -> 3539009;
get_power(719) -> 3568679;
get_power(720) -> 3597228;
get_power(721) -> 3627067;
get_power(722) -> 3656456;
get_power(723) -> 3697621;
get_power(724) -> 3715899;
get_power(725) -> 3743621;
get_power(726) -> 3773289;
get_power(727) -> 3800731;
get_power(728) -> 3829967;
get_power(729) -> 3859530;
get_power(730) -> 3891361;
get_power(731) -> 3920085;
get_power(732) -> 3962425;
get_power(733) -> 3976366;
get_power(734) -> 4009165;
get_power(735) -> 4037270;
get_power(736) -> 4065362;
get_power(737) -> 4095421;
get_power(738) -> 4140740;
get_power(739) -> 4153992;
get_power(740) -> 4197141;
get_power(741) -> 4214691;
get_power(742) -> 4244083;
get_power(743) -> 4268465;
get_power(744) -> 4298131;
get_power(745) -> 4329318;
get_power(746) -> 4359047;
get_power(747) -> 4402878;
get_power(748) -> 4432246;
get_power(749) -> 4444166;
get_power(750) -> 4475776;
get_power(751) -> 4505454;
get_power(752) -> 4548697;
get_power(753) -> 4567037;
get_power(754) -> 4596430;
get_power(755) -> 4622628;
get_power(756) -> 4652391;
get_power(757) -> 4684497;
get_power(758) -> 4707108;
get_power(759) -> 4739766;
get_power(760) -> 4768656;
get_power(761) -> 4802449;
get_power(762) -> 4843056;
get_power(763) -> 4860217;
get_power(764) -> 4885797;
get_power(765) -> 4915583;
get_power(766) -> 4940937;
get_power(767) -> 4978175;
get_power(768) -> 5023775;
get_power(769) -> 5052172;
get_power(770) -> 5077426;
get_power(771) -> 5091348;
get_power(772) -> 5121191;
get_power(773) -> 5169862;
get_power(774) -> 5179265;
get_power(775) -> 5208047;
get_power(776) -> 5248325;
get_power(777) -> 5272910;
get_power(778) -> 5306880;
get_power(779) -> 5325732;
get_power(780) -> 5350166;
get_power(781) -> 5384332;
get_power(782) -> 5413123;
get_power(783) -> 5442388;
get_power(784) -> 5477461;
get_power(785) -> 5517663;
get_power(786) -> 5530311;
get_power(787) -> 5559006;
get_power(788) -> 5599666;
get_power(789) -> 5618717;
get_power(790) -> 5647016;
get_power(791) -> 5700755;
get_power(792) -> 5706923;
get_power(793) -> 5753033;
get_power(794) -> 5781984;
get_power(795) -> 5794546;
get_power(796) -> 5841008;
get_power(797) -> 5859631;
get_power(798) -> 5877016;
get_power(799) -> 5905788;
get_power(800) -> 5965461;
get_power(801) -> 5985461;
get_power(802) -> 6005461;
get_power(803) -> 6025461;
get_power(804) -> 6045461;
get_power(805) -> 6065461;
get_power(806) -> 6085461;
get_power(807) -> 6105461;
get_power(808) -> 6125461;
get_power(809) -> 6145461;
get_power(810) -> 6165461;
get_power(811) -> 6185461;
get_power(812) -> 6205461;
get_power(813) -> 6225461;
get_power(814) -> 6245461;
get_power(815) -> 6265461;
get_power(816) -> 6285461;
get_power(817) -> 6305461;
get_power(818) -> 6325461;
get_power(819) -> 6345461;
get_power(820) -> 6365461;
get_power(821) -> 6385461;
get_power(822) -> 6405461;
get_power(823) -> 6425461;
get_power(824) -> 6445461;
get_power(825) -> 6465461;
get_power(826) -> 6485461;
get_power(827) -> 6505461;
get_power(828) -> 6525461;
get_power(829) -> 6545461;
get_power(830) -> 6565461;
get_power(831) -> 6585461;
get_power(832) -> 6605461;
get_power(833) -> 6625461;
get_power(834) -> 6645461;
get_power(835) -> 6665461;
get_power(836) -> 6685461;
get_power(837) -> 6705461;
get_power(838) -> 6725461;
get_power(839) -> 6745461;
get_power(840) -> 6765461;
get_power(841) -> 6785461;
get_power(842) -> 6805461;
get_power(843) -> 6825461;
get_power(844) -> 6845461;
get_power(845) -> 6865461;
get_power(846) -> 6885461;
get_power(847) -> 6905461;
get_power(848) -> 6925461;
get_power(849) -> 6945461;
get_power(850) -> 6965461;
get_power(851) -> 6985461;
get_power(852) -> 7005461;
get_power(853) -> 7025461;
get_power(854) -> 7045461;
get_power(855) -> 7065461;
get_power(856) -> 7085461;
get_power(857) -> 7105461;
get_power(858) -> 7125461;
get_power(859) -> 7145461;
get_power(860) -> 7165461;
get_power(861) -> 7185461;
get_power(862) -> 7205461;
get_power(863) -> 7225461;
get_power(864) -> 7245461;
get_power(865) -> 7265461;
get_power(866) -> 7285461;
get_power(867) -> 7305461;
get_power(868) -> 7325461;
get_power(869) -> 7345461;
get_power(870) -> 7365461;
get_power(871) -> 7385461;
get_power(872) -> 7405461;
get_power(873) -> 7425461;
get_power(874) -> 7445461;
get_power(875) -> 7465461;
get_power(876) -> 7485461;
get_power(877) -> 7505461;
get_power(878) -> 7525461;
get_power(879) -> 7545461;
get_power(880) -> 7565461;
get_power(881) -> 7585461;
get_power(882) -> 7605461;
get_power(883) -> 7625461;
get_power(884) -> 7645461;
get_power(885) -> 7665461;
get_power(886) -> 7685461;
get_power(887) -> 7705461;
get_power(888) -> 7725461;
get_power(889) -> 7745461;
get_power(890) -> 7765461;
get_power(891) -> 7785461;
get_power(892) -> 7805461;
get_power(893) -> 7825461;
get_power(894) -> 7845461;
get_power(895) -> 7865461;
get_power(896) -> 7885461;
get_power(897) -> 7905461;
get_power(898) -> 7925461;
get_power(899) -> 7945461;
get_power(900) -> 7965461;
get_power(901) -> 8985461;
get_power(902) -> 9005461;
get_power(903) -> 9025461;
get_power(904) -> 9045461;
get_power(905) -> 9065461;
get_power(906) -> 9085461;
get_power(907) -> 9105461;
get_power(908) -> 9125461;
get_power(909) -> 9145461;
get_power(910) -> 9165461;
get_power(911) -> 9185461;
get_power(912) -> 9205461;
get_power(913) -> 9225461;
get_power(914) -> 9245461;
get_power(915) -> 9265461;
get_power(916) -> 9285461;
get_power(917) -> 9305461;
get_power(918) -> 9325461;
get_power(919) -> 9345461;
get_power(920) -> 9365461;
get_power(921) -> 9385461;
get_power(922) -> 9405461;
get_power(923) -> 9425461;
get_power(924) -> 9445461;
get_power(925) -> 9465461;
get_power(926) -> 9485461;
get_power(927) -> 9505461;
get_power(928) -> 9525461;
get_power(929) -> 9545461;
get_power(930) -> 9565461;
get_power(931) -> 9585461;
get_power(932) -> 9605461;
get_power(933) -> 9625461;
get_power(934) -> 9645461;
get_power(935) -> 9665461;
get_power(936) -> 9685461;
get_power(937) -> 9705461;
get_power(938) -> 9725461;
get_power(939) -> 9745461;
get_power(940) -> 9765461;
get_power(941) -> 9785461;
get_power(942) -> 9805461;
get_power(943) -> 9825461;
get_power(944) -> 9845461;
get_power(945) -> 9865461;
get_power(946) -> 9885461;
get_power(947) -> 9905461;
get_power(948) -> 9925461;
get_power(949) -> 9945461;
get_power(950) -> 9965461;
get_power(951) -> 9985461;
get_power(952) -> 10005461;
get_power(953) -> 10025461;
get_power(954) -> 10045461;
get_power(955) -> 10065461;
get_power(956) -> 10085461;
get_power(957) -> 10105461;
get_power(958) -> 10125461;
get_power(959) -> 10145461;
get_power(960) -> 10165461;
get_power(961) -> 10185461;
get_power(962) -> 10205461;
get_power(963) -> 10225461;
get_power(964) -> 10245461;
get_power(965) -> 10265461;
get_power(966) -> 10285461;
get_power(967) -> 10305461;
get_power(968) -> 10325461;
get_power(969) -> 10345461;
get_power(970) -> 10365461;
get_power(971) -> 10385461;
get_power(972) -> 10405461;
get_power(973) -> 10425461;
get_power(974) -> 10445461;
get_power(975) -> 10465461;
get_power(976) -> 10485461;
get_power(977) -> 10505461;
get_power(978) -> 10525461;
get_power(979) -> 10545461;
get_power(980) -> 10565461;
get_power(981) -> 10585461;
get_power(982) -> 10605461;
get_power(983) -> 10625461;
get_power(984) -> 10645461;
get_power(985) -> 10665461;
get_power(986) -> 10685461;
get_power(987) -> 10705461;
get_power(988) -> 10725461;
get_power(989) -> 10745461;
get_power(990) -> 10765461;
get_power(991) -> 10785461;
get_power(992) -> 10805461;
get_power(993) -> 10825461;
get_power(994) -> 10845461;
get_power(995) -> 10865461;
get_power(996) -> 10885461;
get_power(997) -> 10905461;
get_power(998) -> 10925461;
get_power(999) -> 10945461;
get_power(1000) -> 10965461;
get_power(_) -> 0.

get_award(1) ->
    {[], [{10001, 10000}], 0,
     [{1, 5000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2000}]};
get_award(2) ->
    {[], [{10001, 10000}], 0,
     [{1, 2500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 1000}]};
get_award(3) ->
    {[], [{10001, 10000}], 0,
     [{1, 3000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 1200}]};
get_award(4) ->
    {[], [{10001, 10000}], 0,
     [{1, 3000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 1200}]};
get_award(5) ->
    {[], [{10001, 10000}], 0,
     [{1, 3500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 1400}]};
get_award(6) ->
    {[], [{10001, 10000}], 0,
     [{1, 3500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 1400}]};
get_award(7) ->
    {[], [{10001, 10000}], 0,
     [{1, 4000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 1600}]};
get_award(8) ->
    {[], [{10001, 10000}], 0,
     [{1, 4000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 1600}]};
get_award(9) ->
    {[], [{10001, 10000}], 0,
     [{1, 4500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 1800}]};
get_award(10) ->
    {[], [{10001, 10000}], 0,
     [{1, 4500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 1800}]};
get_award(11) ->
    {[], [{10001, 10000}], 0,
     [{1, 5000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2000}]};
get_award(12) ->
    {[], [{10001, 10000}], 0,
     [{1, 5000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2000}]};
get_award(13) ->
    {[], [{10001, 10000}], 0,
     [{1, 5500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2200}]};
get_award(14) ->
    {[], [{10001, 10000}], 0,
     [{1, 5500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2200}]};
get_award(15) ->
    {[], [{10001, 10000}], 0,
     [{1, 6000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2400}]};
get_award(16) ->
    {[], [{10001, 10000}], 0,
     [{1, 6000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2400}]};
get_award(17) ->
    {[], [{10001, 10000}], 0,
     [{1, 6500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2600}]};
get_award(18) ->
    {[], [{10001, 10000}], 0,
     [{1, 6500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2600}]};
get_award(19) ->
    {[], [{10001, 10000}], 0,
     [{1, 7000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2800}]};
get_award(20) ->
    {[], [{10001, 10000}], 0,
     [{1, 7000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 2800}]};
get_award(21) ->
    {[], [{10001, 10000}], 0,
     [{1, 7500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3000}]};
get_award(22) ->
    {[], [{10001, 10000}], 0,
     [{1, 7500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3000}]};
get_award(23) ->
    {[], [{10001, 10000}], 0,
     [{1, 8000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3200}]};
get_award(24) ->
    {[], [{10001, 10000}], 0,
     [{1, 8000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3200}]};
get_award(25) ->
    {[], [{10001, 10000}], 0,
     [{1, 8500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3400}]};
get_award(26) ->
    {[], [{10001, 10000}], 0,
     [{1, 8500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3400}]};
get_award(27) ->
    {[], [{10001, 10000}], 0,
     [{1, 9000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3600}]};
get_award(28) ->
    {[], [{10001, 10000}], 0,
     [{1, 9000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3600}]};
get_award(29) ->
    {[], [{10001, 10000}], 0,
     [{1, 9500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3800}]};
get_award(30) ->
    {[], [{10001, 10000}], 0,
     [{1, 9500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 3800}]};
get_award(31) ->
    {[], [{10001, 10000}], 0,
     [{1, 10000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4000}]};
get_award(32) ->
    {[], [{10001, 10000}], 0,
     [{1, 10000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4000}]};
get_award(33) ->
    {[], [{10001, 10000}], 0,
     [{1, 10500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4200}]};
get_award(34) ->
    {[], [{10001, 10000}], 0,
     [{1, 10500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4200}]};
get_award(35) ->
    {[], [{10001, 10000}], 0,
     [{1, 11000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4400}]};
get_award(36) ->
    {[], [{10001, 10000}], 0,
     [{1, 11000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4400}]};
get_award(37) ->
    {[], [{10001, 10000}], 0,
     [{1, 11500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4600}]};
get_award(38) ->
    {[], [{10001, 10000}], 0,
     [{1, 11500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4600}]};
get_award(39) ->
    {[], [{10001, 10000}], 0,
     [{1, 12000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4800}]};
get_award(40) ->
    {[], [{10001, 10000}], 0,
     [{1, 12000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 4800}]};
get_award(41) ->
    {[], [{10001, 10000}], 0,
     [{1, 12500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5000}]};
get_award(42) ->
    {[], [{10001, 10000}], 0,
     [{1, 12500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5000}]};
get_award(43) ->
    {[], [{10001, 10000}], 0,
     [{1, 13000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5200}]};
get_award(44) ->
    {[], [{10001, 10000}], 0,
     [{1, 13000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5200}]};
get_award(45) ->
    {[], [{10001, 10000}], 0,
     [{1, 13500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5400}]};
get_award(46) ->
    {[], [{10001, 10000}], 0,
     [{1, 13500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5400}]};
get_award(47) ->
    {[], [{10001, 10000}], 0,
     [{1, 14000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5600}]};
get_award(48) ->
    {[], [{10001, 10000}], 0,
     [{1, 14000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5600}]};
get_award(49) ->
    {[], [{10001, 10000}], 0,
     [{1, 14500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5800}]};
get_award(50) ->
    {[], [{10001, 10000}], 0,
     [{1, 14500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 5800}]};
get_award(51) ->
    {[], [{10001, 10000}], 0,
     [{1, 15000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6000}]};
get_award(52) ->
    {[], [{10001, 10000}], 0,
     [{1, 15000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6000}]};
get_award(53) ->
    {[], [{10001, 10000}], 0,
     [{1, 15500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6200}]};
get_award(54) ->
    {[], [{10001, 10000}], 0,
     [{1, 15500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6200}]};
get_award(55) ->
    {[], [{10001, 10000}], 0,
     [{1, 16000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6400}]};
get_award(56) ->
    {[], [{10001, 10000}], 0,
     [{1, 16000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6400}]};
get_award(57) ->
    {[], [{10001, 10000}], 0,
     [{1, 16500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6600}]};
get_award(58) ->
    {[], [{10001, 10000}], 0,
     [{1, 16500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6600}]};
get_award(59) ->
    {[], [{10001, 10000}], 0,
     [{1, 17000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6800}]};
get_award(60) ->
    {[], [{10001, 10000}], 0,
     [{1, 17000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 6800}]};
get_award(61) ->
    {[], [{10001, 10000}], 0,
     [{1, 17500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7000}]};
get_award(62) ->
    {[], [{10001, 10000}], 0,
     [{1, 17500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7000}]};
get_award(63) ->
    {[], [{10001, 10000}], 0,
     [{1, 18000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7200}]};
get_award(64) ->
    {[], [{10001, 10000}], 0,
     [{1, 18000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7200}]};
get_award(65) ->
    {[], [{10001, 10000}], 0,
     [{1, 18500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7400}]};
get_award(66) ->
    {[], [{10001, 10000}], 0,
     [{1, 18500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7400}]};
get_award(67) ->
    {[], [{10001, 10000}], 0,
     [{1, 19000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7600}]};
get_award(68) ->
    {[], [{10001, 10000}], 0,
     [{1, 19000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7600}]};
get_award(69) ->
    {[], [{10001, 10000}], 0,
     [{1, 19500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7800}]};
get_award(70) ->
    {[], [{10001, 10000}], 0,
     [{1, 19500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 7800}]};
get_award(71) ->
    {[], [{10001, 10000}], 0,
     [{1, 20000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8000}]};
get_award(72) ->
    {[], [{10001, 10000}], 0,
     [{1, 20000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8000}]};
get_award(73) ->
    {[], [{10001, 10000}], 0,
     [{1, 20500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8200}]};
get_award(74) ->
    {[], [{10001, 10000}], 0,
     [{1, 20500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8200}]};
get_award(75) ->
    {[], [{10001, 10000}], 0,
     [{1, 21000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8400}]};
get_award(76) ->
    {[], [{10001, 10000}], 0,
     [{1, 21000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8400}]};
get_award(77) ->
    {[], [{10001, 10000}], 0,
     [{1, 21500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8600}]};
get_award(78) ->
    {[], [{10001, 10000}], 0,
     [{1, 21500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8600}]};
get_award(79) ->
    {[], [{10001, 10000}], 0,
     [{1, 22000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8800}]};
get_award(80) ->
    {[], [{10001, 10000}], 0,
     [{1, 22000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 8800}]};
get_award(81) ->
    {[], [{10001, 10000}], 0,
     [{1, 22500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9000}]};
get_award(82) ->
    {[], [{10001, 10000}], 0,
     [{1, 22500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9000}]};
get_award(83) ->
    {[], [{10001, 10000}], 0,
     [{1, 23000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9200}]};
get_award(84) ->
    {[], [{10001, 10000}], 0,
     [{1, 23000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9200}]};
get_award(85) ->
    {[], [{10001, 10000}], 0,
     [{1, 23500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9400}]};
get_award(86) ->
    {[], [{10001, 10000}], 0,
     [{1, 23500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9400}]};
get_award(87) ->
    {[], [{10001, 10000}], 0,
     [{1, 24000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9600}]};
get_award(88) ->
    {[], [{10001, 10000}], 0,
     [{1, 24000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9600}]};
get_award(89) ->
    {[], [{10001, 10000}], 0,
     [{1, 24500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9800}]};
get_award(90) ->
    {[], [{10001, 10000}], 0,
     [{1, 24500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 9800}]};
get_award(91) ->
    {[], [{10001, 10000}], 0,
     [{1, 25000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10000}]};
get_award(92) ->
    {[], [{10001, 10000}], 0,
     [{1, 25000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10000}]};
get_award(93) ->
    {[], [{10001, 10000}], 0,
     [{1, 25500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10200}]};
get_award(94) ->
    {[], [{10001, 10000}], 0,
     [{1, 25500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10200}]};
get_award(95) ->
    {[], [{10001, 10000}], 0,
     [{1, 26000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10400}]};
get_award(96) ->
    {[], [{10001, 10000}], 0,
     [{1, 26000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10400}]};
get_award(97) ->
    {[], [{10001, 10000}], 0,
     [{1, 26500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10600}]};
get_award(98) ->
    {[], [{10001, 10000}], 0,
     [{1, 26500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10600}]};
get_award(99) ->
    {[], [{10001, 10000}], 0,
     [{1, 27000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10800}]};
get_award(100) ->
    {[], [{10001, 10000}], 0,
     [{1, 27000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 10800}]};
get_award(101) ->
    {[], [{10001, 10000}], 0,
     [{1, 27500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11000}]};
get_award(102) ->
    {[], [{10001, 10000}], 0,
     [{1, 27500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11000}]};
get_award(103) ->
    {[], [{10001, 10000}], 0,
     [{1, 28000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11200}]};
get_award(104) ->
    {[], [{10001, 10000}], 0,
     [{1, 28000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11200}]};
get_award(105) ->
    {[], [{10001, 10000}], 0,
     [{1, 28500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11400}]};
get_award(106) ->
    {[], [{10001, 10000}], 0,
     [{1, 28500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11400}]};
get_award(107) ->
    {[], [{10001, 10000}], 0,
     [{1, 29000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11600}]};
get_award(108) ->
    {[], [{10001, 10000}], 0,
     [{1, 29000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11600}]};
get_award(109) ->
    {[], [{10001, 10000}], 0,
     [{1, 29500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11800}]};
get_award(110) ->
    {[], [{10001, 10000}], 0,
     [{1, 29500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 11800}]};
get_award(111) ->
    {[], [{10001, 10000}], 0,
     [{1, 30000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12000}]};
get_award(112) ->
    {[], [{10001, 10000}], 0,
     [{1, 30000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12000}]};
get_award(113) ->
    {[], [{10001, 10000}], 0,
     [{1, 30500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12200}]};
get_award(114) ->
    {[], [{10001, 10000}], 0,
     [{1, 30500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12200}]};
get_award(115) ->
    {[], [{10001, 10000}], 0,
     [{1, 31000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12400}]};
get_award(116) ->
    {[], [{10001, 10000}], 0,
     [{1, 31000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12400}]};
get_award(117) ->
    {[], [{10001, 10000}], 0,
     [{1, 31500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12600}]};
get_award(118) ->
    {[], [{10001, 10000}], 0,
     [{1, 31500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12600}]};
get_award(119) ->
    {[], [{10001, 10000}], 0,
     [{1, 32000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12800}]};
get_award(120) ->
    {[], [{10001, 10000}], 0,
     [{1, 32000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 12800}]};
get_award(121) ->
    {[], [{10001, 10000}], 0,
     [{1, 32500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13000}]};
get_award(122) ->
    {[], [{10001, 10000}], 0,
     [{1, 32500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13000}]};
get_award(123) ->
    {[], [{10001, 10000}], 0,
     [{1, 33000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13200}]};
get_award(124) ->
    {[], [{10001, 10000}], 0,
     [{1, 33000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13200}]};
get_award(125) ->
    {[], [{10001, 10000}], 0,
     [{1, 33500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13400}]};
get_award(126) ->
    {[], [{10001, 10000}], 0,
     [{1, 33500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13400}]};
get_award(127) ->
    {[], [{10001, 10000}], 0,
     [{1, 34000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13600}]};
get_award(128) ->
    {[], [{10001, 10000}], 0,
     [{1, 34000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13600}]};
get_award(129) ->
    {[], [{10001, 10000}], 0,
     [{1, 34500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13800}]};
get_award(130) ->
    {[], [{10001, 10000}], 0,
     [{1, 34500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 13800}]};
get_award(131) ->
    {[], [{10001, 10000}], 0,
     [{1, 35000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14000}]};
get_award(132) ->
    {[], [{10001, 10000}], 0,
     [{1, 35000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14000}]};
get_award(133) ->
    {[], [{10001, 10000}], 0,
     [{1, 35500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14200}]};
get_award(134) ->
    {[], [{10001, 10000}], 0,
     [{1, 35500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14200}]};
get_award(135) ->
    {[], [{10001, 10000}], 0,
     [{1, 36000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14400}]};
get_award(136) ->
    {[], [{10001, 10000}], 0,
     [{1, 36000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14400}]};
get_award(137) ->
    {[], [{10001, 10000}], 0,
     [{1, 36500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14600}]};
get_award(138) ->
    {[], [{10001, 10000}], 0,
     [{1, 36500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14600}]};
get_award(139) ->
    {[], [{10001, 10000}], 0,
     [{1, 37000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14800}]};
get_award(140) ->
    {[], [{10001, 10000}], 0,
     [{1, 37000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 14800}]};
get_award(141) ->
    {[], [{10001, 10000}], 0,
     [{1, 37500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15000}]};
get_award(142) ->
    {[], [{10001, 10000}], 0,
     [{1, 37500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15000}]};
get_award(143) ->
    {[], [{10001, 10000}], 0,
     [{1, 38000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15200}]};
get_award(144) ->
    {[], [{10001, 10000}], 0,
     [{1, 38000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15200}]};
get_award(145) ->
    {[], [{10001, 10000}], 0,
     [{1, 38500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15400}]};
get_award(146) ->
    {[], [{10001, 10000}], 0,
     [{1, 38500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15400}]};
get_award(147) ->
    {[], [{10001, 10000}], 0,
     [{1, 39000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15600}]};
get_award(148) ->
    {[], [{10001, 10000}], 0,
     [{1, 39000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15600}]};
get_award(149) ->
    {[], [{10001, 10000}], 0,
     [{1, 39500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15800}]};
get_award(150) ->
    {[], [{10001, 10000}], 0,
     [{1, 39500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 15800}]};
get_award(151) ->
    {[], [{10001, 10000}], 0,
     [{1, 40000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16000}]};
get_award(152) ->
    {[], [{10001, 10000}], 0,
     [{1, 40000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16000}]};
get_award(153) ->
    {[], [{10001, 10000}], 0,
     [{1, 40500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16200}]};
get_award(154) ->
    {[], [{10001, 10000}], 0,
     [{1, 40500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16200}]};
get_award(155) ->
    {[], [{10001, 10000}], 0,
     [{1, 41000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16400}]};
get_award(156) ->
    {[], [{10001, 10000}], 0,
     [{1, 41000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16400}]};
get_award(157) ->
    {[], [{10001, 10000}], 0,
     [{1, 41500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16600}]};
get_award(158) ->
    {[], [{10001, 10000}], 0,
     [{1, 41500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16600}]};
get_award(159) ->
    {[], [{10001, 10000}], 0,
     [{1, 42000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16800}]};
get_award(160) ->
    {[], [{10001, 10000}], 0,
     [{1, 42000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 16800}]};
get_award(161) ->
    {[], [{10001, 10000}], 0,
     [{1, 42500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17000}]};
get_award(162) ->
    {[], [{10001, 10000}], 0,
     [{1, 42500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17000}]};
get_award(163) ->
    {[], [{10001, 10000}], 0,
     [{1, 43000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17200}]};
get_award(164) ->
    {[], [{10001, 10000}], 0,
     [{1, 43000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17200}]};
get_award(165) ->
    {[], [{10001, 10000}], 0,
     [{1, 43500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17400}]};
get_award(166) ->
    {[], [{10001, 10000}], 0,
     [{1, 43500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17400}]};
get_award(167) ->
    {[], [{10001, 10000}], 0,
     [{1, 44000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17600}]};
get_award(168) ->
    {[], [{10001, 10000}], 0,
     [{1, 44000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17600}]};
get_award(169) ->
    {[], [{10001, 10000}], 0,
     [{1, 44500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17800}]};
get_award(170) ->
    {[], [{10001, 10000}], 0,
     [{1, 44500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 17800}]};
get_award(171) ->
    {[], [{10001, 10000}], 0,
     [{1, 45000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18000}]};
get_award(172) ->
    {[], [{10001, 10000}], 0,
     [{1, 45000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18000}]};
get_award(173) ->
    {[], [{10001, 10000}], 0,
     [{1, 45500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18200}]};
get_award(174) ->
    {[], [{10001, 10000}], 0,
     [{1, 45500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18200}]};
get_award(175) ->
    {[], [{10001, 10000}], 0,
     [{1, 46000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18400}]};
get_award(176) ->
    {[], [{10001, 10000}], 0,
     [{1, 46000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18400}]};
get_award(177) ->
    {[], [{10001, 10000}], 0,
     [{1, 46500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18600}]};
get_award(178) ->
    {[], [{10001, 10000}], 0,
     [{1, 46500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18600}]};
get_award(179) ->
    {[], [{10001, 10000}], 0,
     [{1, 47000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18800}]};
get_award(180) ->
    {[], [{10001, 10000}], 0,
     [{1, 47000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 18800}]};
get_award(181) ->
    {[], [{10001, 10000}], 0,
     [{1, 47500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19000}]};
get_award(182) ->
    {[], [{10001, 10000}], 0,
     [{1, 47500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19000}]};
get_award(183) ->
    {[], [{10001, 10000}], 0,
     [{1, 48000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19200}]};
get_award(184) ->
    {[], [{10001, 10000}], 0,
     [{1, 48000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19200}]};
get_award(185) ->
    {[], [{10001, 10000}], 0,
     [{1, 48500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19400}]};
get_award(186) ->
    {[], [{10001, 10000}], 0,
     [{1, 48500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19400}]};
get_award(187) ->
    {[], [{10001, 10000}], 0,
     [{1, 49000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19600}]};
get_award(188) ->
    {[], [{10001, 10000}], 0,
     [{1, 49000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19600}]};
get_award(189) ->
    {[], [{10001, 10000}], 0,
     [{1, 49500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19800}]};
get_award(190) ->
    {[], [{10001, 10000}], 0,
     [{1, 49500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 19800}]};
get_award(191) ->
    {[], [{10001, 10000}], 0,
     [{1, 50000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20000}]};
get_award(192) ->
    {[], [{10001, 10000}], 0,
     [{1, 50000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20000}]};
get_award(193) ->
    {[], [{10001, 10000}], 0,
     [{1, 50500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20200}]};
get_award(194) ->
    {[], [{10001, 10000}], 0,
     [{1, 50500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20200}]};
get_award(195) ->
    {[], [{10001, 10000}], 0,
     [{1, 51000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20400}]};
get_award(196) ->
    {[], [{10001, 10000}], 0,
     [{1, 51000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20400}]};
get_award(197) ->
    {[], [{10001, 10000}], 0,
     [{1, 51500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20600}]};
get_award(198) ->
    {[], [{10001, 10000}], 0,
     [{1, 51500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20600}]};
get_award(199) ->
    {[], [{10001, 10000}], 0,
     [{1, 52000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20800}]};
get_award(200) ->
    {[], [{10001, 10000}], 0,
     [{1, 52000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 20800}]};
get_award(201) ->
    {[], [{10001, 10000}], 0,
     [{1, 52500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21000}]};
get_award(202) ->
    {[], [{10001, 10000}], 0,
     [{1, 52500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21000}]};
get_award(203) ->
    {[], [{10001, 10000}], 0,
     [{1, 53000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21200}]};
get_award(204) ->
    {[], [{10001, 10000}], 0,
     [{1, 53000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21200}]};
get_award(205) ->
    {[], [{10001, 10000}], 0,
     [{1, 53500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21400}]};
get_award(206) ->
    {[], [{10001, 10000}], 0,
     [{1, 53500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21400}]};
get_award(207) ->
    {[], [{10001, 10000}], 0,
     [{1, 54000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21600}]};
get_award(208) ->
    {[], [{10001, 10000}], 0,
     [{1, 54000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21600}]};
get_award(209) ->
    {[], [{10001, 10000}], 0,
     [{1, 54500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21800}]};
get_award(210) ->
    {[], [{10001, 10000}], 0,
     [{1, 54500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 21800}]};
get_award(211) ->
    {[], [{10001, 10000}], 0,
     [{1, 55000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22000}]};
get_award(212) ->
    {[], [{10001, 10000}], 0,
     [{1, 55000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22000}]};
get_award(213) ->
    {[], [{10001, 10000}], 0,
     [{1, 55500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22200}]};
get_award(214) ->
    {[], [{10001, 10000}], 0,
     [{1, 55500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22200}]};
get_award(215) ->
    {[], [{10001, 10000}], 0,
     [{1, 56000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22400}]};
get_award(216) ->
    {[], [{10001, 10000}], 0,
     [{1, 56000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22400}]};
get_award(217) ->
    {[], [{10001, 10000}], 0,
     [{1, 56500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22600}]};
get_award(218) ->
    {[], [{10001, 10000}], 0,
     [{1, 56500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22600}]};
get_award(219) ->
    {[], [{10001, 10000}], 0,
     [{1, 57000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22800}]};
get_award(220) ->
    {[], [{10001, 10000}], 0,
     [{1, 57000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 22800}]};
get_award(221) ->
    {[], [{10001, 10000}], 0,
     [{1, 57500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23000}]};
get_award(222) ->
    {[], [{10001, 10000}], 0,
     [{1, 57500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23000}]};
get_award(223) ->
    {[], [{10001, 10000}], 0,
     [{1, 58000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23200}]};
get_award(224) ->
    {[], [{10001, 10000}], 0,
     [{1, 58000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23200}]};
get_award(225) ->
    {[], [{10001, 10000}], 0,
     [{1, 58500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23400}]};
get_award(226) ->
    {[], [{10001, 10000}], 0,
     [{1, 58500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23400}]};
get_award(227) ->
    {[], [{10001, 10000}], 0,
     [{1, 59000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23600}]};
get_award(228) ->
    {[], [{10001, 10000}], 0,
     [{1, 59000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23600}]};
get_award(229) ->
    {[], [{10001, 10000}], 0,
     [{1, 59500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23800}]};
get_award(230) ->
    {[], [{10001, 10000}], 0,
     [{1, 59500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 23800}]};
get_award(231) ->
    {[], [{10001, 10000}], 0,
     [{1, 60000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24000}]};
get_award(232) ->
    {[], [{10001, 10000}], 0,
     [{1, 60000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24000}]};
get_award(233) ->
    {[], [{10001, 10000}], 0,
     [{1, 60500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24200}]};
get_award(234) ->
    {[], [{10001, 10000}], 0,
     [{1, 60500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24200}]};
get_award(235) ->
    {[], [{10001, 10000}], 0,
     [{1, 61000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24400}]};
get_award(236) ->
    {[], [{10001, 10000}], 0,
     [{1, 61000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24400}]};
get_award(237) ->
    {[], [{10001, 10000}], 0,
     [{1, 61500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24600}]};
get_award(238) ->
    {[], [{10001, 10000}], 0,
     [{1, 61500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24600}]};
get_award(239) ->
    {[], [{10001, 10000}], 0,
     [{1, 62000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24800}]};
get_award(240) ->
    {[], [{10001, 10000}], 0,
     [{1, 62000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 24800}]};
get_award(241) ->
    {[], [{10001, 10000}], 0,
     [{1, 62500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25000}]};
get_award(242) ->
    {[], [{10001, 10000}], 0,
     [{1, 62500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25000}]};
get_award(243) ->
    {[], [{10001, 10000}], 0,
     [{1, 63000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25200}]};
get_award(244) ->
    {[], [{10001, 10000}], 0,
     [{1, 63000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25200}]};
get_award(245) ->
    {[], [{10001, 10000}], 0,
     [{1, 63500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25400}]};
get_award(246) ->
    {[], [{10001, 10000}], 0,
     [{1, 63500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25400}]};
get_award(247) ->
    {[], [{10001, 10000}], 0,
     [{1, 64000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25600}]};
get_award(248) ->
    {[], [{10001, 10000}], 0,
     [{1, 64000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25600}]};
get_award(249) ->
    {[], [{10001, 10000}], 0,
     [{1, 64500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25800}]};
get_award(250) ->
    {[], [{10001, 10000}], 0,
     [{1, 64500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 25800}]};
get_award(251) ->
    {[], [{10001, 10000}], 0,
     [{1, 65000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26000}]};
get_award(252) ->
    {[], [{10001, 10000}], 0,
     [{1, 65000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26000}]};
get_award(253) ->
    {[], [{10001, 10000}], 0,
     [{1, 65500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26200}]};
get_award(254) ->
    {[], [{10001, 10000}], 0,
     [{1, 65500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26200}]};
get_award(255) ->
    {[], [{10001, 10000}], 0,
     [{1, 66000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26400}]};
get_award(256) ->
    {[], [{10001, 10000}], 0,
     [{1, 66000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26400}]};
get_award(257) ->
    {[], [{10001, 10000}], 0,
     [{1, 66500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26600}]};
get_award(258) ->
    {[], [{10001, 10000}], 0,
     [{1, 66500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26600}]};
get_award(259) ->
    {[], [{10001, 10000}], 0,
     [{1, 67000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26800}]};
get_award(260) ->
    {[], [{10001, 10000}], 0,
     [{1, 67000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 26800}]};
get_award(261) ->
    {[], [{10001, 10000}], 0,
     [{1, 67500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27000}]};
get_award(262) ->
    {[], [{10001, 10000}], 0,
     [{1, 67500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27000}]};
get_award(263) ->
    {[], [{10001, 10000}], 0,
     [{1, 68000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27200}]};
get_award(264) ->
    {[], [{10001, 10000}], 0,
     [{1, 68000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27200}]};
get_award(265) ->
    {[], [{10001, 10000}], 0,
     [{1, 68500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27400}]};
get_award(266) ->
    {[], [{10001, 10000}], 0,
     [{1, 68500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27400}]};
get_award(267) ->
    {[], [{10001, 10000}], 0,
     [{1, 69000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27600}]};
get_award(268) ->
    {[], [{10001, 10000}], 0,
     [{1, 69000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27600}]};
get_award(269) ->
    {[], [{10001, 10000}], 0,
     [{1, 69500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27800}]};
get_award(270) ->
    {[], [{10001, 10000}], 0,
     [{1, 69500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 27800}]};
get_award(271) ->
    {[], [{10001, 10000}], 0,
     [{1, 70000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28000}]};
get_award(272) ->
    {[], [{10001, 10000}], 0,
     [{1, 70000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28000}]};
get_award(273) ->
    {[], [{10001, 10000}], 0,
     [{1, 70500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28200}]};
get_award(274) ->
    {[], [{10001, 10000}], 0,
     [{1, 70500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28200}]};
get_award(275) ->
    {[], [{10001, 10000}], 0,
     [{1, 71000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28400}]};
get_award(276) ->
    {[], [{10001, 10000}], 0,
     [{1, 71000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28400}]};
get_award(277) ->
    {[], [{10001, 10000}], 0,
     [{1, 71500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28600}]};
get_award(278) ->
    {[], [{10001, 10000}], 0,
     [{1, 71500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28600}]};
get_award(279) ->
    {[], [{10001, 10000}], 0,
     [{1, 72000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28800}]};
get_award(280) ->
    {[], [{10001, 10000}], 0,
     [{1, 72000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 28800}]};
get_award(281) ->
    {[], [{10001, 10000}], 0,
     [{1, 72500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29000}]};
get_award(282) ->
    {[], [{10001, 10000}], 0,
     [{1, 72500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29000}]};
get_award(283) ->
    {[], [{10001, 10000}], 0,
     [{1, 73000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29200}]};
get_award(284) ->
    {[], [{10001, 10000}], 0,
     [{1, 73000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29200}]};
get_award(285) ->
    {[], [{10001, 10000}], 0,
     [{1, 73500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29400}]};
get_award(286) ->
    {[], [{10001, 10000}], 0,
     [{1, 73500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29400}]};
get_award(287) ->
    {[], [{10001, 10000}], 0,
     [{1, 74000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29600}]};
get_award(288) ->
    {[], [{10001, 10000}], 0,
     [{1, 74000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29600}]};
get_award(289) ->
    {[], [{10001, 10000}], 0,
     [{1, 74500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29800}]};
get_award(290) ->
    {[], [{10001, 10000}], 0,
     [{1, 74500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 29800}]};
get_award(291) ->
    {[], [{10001, 10000}], 0,
     [{1, 75000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30000}]};
get_award(292) ->
    {[], [{10001, 10000}], 0,
     [{1, 75000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30000}]};
get_award(293) ->
    {[], [{10001, 10000}], 0,
     [{1, 75500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30200}]};
get_award(294) ->
    {[], [{10001, 10000}], 0,
     [{1, 75500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30200}]};
get_award(295) ->
    {[], [{10001, 10000}], 0,
     [{1, 76000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30400}]};
get_award(296) ->
    {[], [{10001, 10000}], 0,
     [{1, 76000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30400}]};
get_award(297) ->
    {[], [{10001, 10000}], 0,
     [{1, 76500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30600}]};
get_award(298) ->
    {[], [{10001, 10000}], 0,
     [{1, 76500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30600}]};
get_award(299) ->
    {[], [{10001, 10000}], 0,
     [{1, 77000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30800}]};
get_award(300) ->
    {[], [{10001, 10000}], 0,
     [{1, 77000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 30800}]};
get_award(301) ->
    {[], [{10001, 10000}], 0,
     [{1, 77500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31000}]};
get_award(302) ->
    {[], [{10001, 10000}], 0,
     [{1, 77500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31000}]};
get_award(303) ->
    {[], [{10001, 10000}], 0,
     [{1, 78000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31200}]};
get_award(304) ->
    {[], [{10001, 10000}], 0,
     [{1, 78000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31200}]};
get_award(305) ->
    {[], [{10001, 10000}], 0,
     [{1, 78500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31400}]};
get_award(306) ->
    {[], [{10001, 10000}], 0,
     [{1, 78500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31400}]};
get_award(307) ->
    {[], [{10001, 10000}], 0,
     [{1, 79000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31600}]};
get_award(308) ->
    {[], [{10001, 10000}], 0,
     [{1, 79000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31600}]};
get_award(309) ->
    {[], [{10001, 10000}], 0,
     [{1, 79500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31800}]};
get_award(310) ->
    {[], [{10001, 10000}], 0,
     [{1, 79500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 31800}]};
get_award(311) ->
    {[], [{10001, 10000}], 0,
     [{1, 80000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32000}]};
get_award(312) ->
    {[], [{10001, 10000}], 0,
     [{1, 80000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32000}]};
get_award(313) ->
    {[], [{10001, 10000}], 0,
     [{1, 80500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32200}]};
get_award(314) ->
    {[], [{10001, 10000}], 0,
     [{1, 80500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32200}]};
get_award(315) ->
    {[], [{10001, 10000}], 0,
     [{1, 81000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32400}]};
get_award(316) ->
    {[], [{10001, 10000}], 0,
     [{1, 81000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32400}]};
get_award(317) ->
    {[], [{10001, 10000}], 0,
     [{1, 81500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32600}]};
get_award(318) ->
    {[], [{10001, 10000}], 0,
     [{1, 81500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32600}]};
get_award(319) ->
    {[], [{10001, 10000}], 0,
     [{1, 82000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32800}]};
get_award(320) ->
    {[], [{10001, 10000}], 0,
     [{1, 82000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 32800}]};
get_award(321) ->
    {[], [{10001, 10000}], 0,
     [{1, 82500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33000}]};
get_award(322) ->
    {[], [{10001, 10000}], 0,
     [{1, 82500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33000}]};
get_award(323) ->
    {[], [{10001, 10000}], 0,
     [{1, 83000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33200}]};
get_award(324) ->
    {[], [{10001, 10000}], 0,
     [{1, 83000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33200}]};
get_award(325) ->
    {[], [{10001, 10000}], 0,
     [{1, 83500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33400}]};
get_award(326) ->
    {[], [{10001, 10000}], 0,
     [{1, 83500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33400}]};
get_award(327) ->
    {[], [{10001, 10000}], 0,
     [{1, 84000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33600}]};
get_award(328) ->
    {[], [{10001, 10000}], 0,
     [{1, 84000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33600}]};
get_award(329) ->
    {[], [{10001, 10000}], 0,
     [{1, 84500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33800}]};
get_award(330) ->
    {[], [{10001, 10000}], 0,
     [{1, 84500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 33800}]};
get_award(331) ->
    {[], [{10001, 10000}], 0,
     [{1, 85000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34000}]};
get_award(332) ->
    {[], [{10001, 10000}], 0,
     [{1, 85000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34000}]};
get_award(333) ->
    {[], [{10001, 10000}], 0,
     [{1, 85500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34200}]};
get_award(334) ->
    {[], [{10001, 10000}], 0,
     [{1, 85500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34200}]};
get_award(335) ->
    {[], [{10001, 10000}], 0,
     [{1, 86000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34400}]};
get_award(336) ->
    {[], [{10001, 10000}], 0,
     [{1, 86000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34400}]};
get_award(337) ->
    {[], [{10001, 10000}], 0,
     [{1, 86500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34600}]};
get_award(338) ->
    {[], [{10001, 10000}], 0,
     [{1, 86500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34600}]};
get_award(339) ->
    {[], [{10001, 10000}], 0,
     [{1, 87000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34800}]};
get_award(340) ->
    {[], [{10001, 10000}], 0,
     [{1, 87000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 34800}]};
get_award(341) ->
    {[], [{10001, 10000}], 0,
     [{1, 87500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35000}]};
get_award(342) ->
    {[], [{10001, 10000}], 0,
     [{1, 87500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35000}]};
get_award(343) ->
    {[], [{10001, 10000}], 0,
     [{1, 88000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35200}]};
get_award(344) ->
    {[], [{10001, 10000}], 0,
     [{1, 88000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35200}]};
get_award(345) ->
    {[], [{10001, 10000}], 0,
     [{1, 88500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35400}]};
get_award(346) ->
    {[], [{10001, 10000}], 0,
     [{1, 88500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35400}]};
get_award(347) ->
    {[], [{10001, 10000}], 0,
     [{1, 89000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35600}]};
get_award(348) ->
    {[], [{10001, 10000}], 0,
     [{1, 89000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35600}]};
get_award(349) ->
    {[], [{10001, 10000}], 0,
     [{1, 89500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35800}]};
get_award(350) ->
    {[], [{10001, 10000}], 0,
     [{1, 89500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 35800}]};
get_award(351) ->
    {[], [{10001, 10000}], 0,
     [{1, 90000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36000}]};
get_award(352) ->
    {[], [{10001, 10000}], 0,
     [{1, 90000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36000}]};
get_award(353) ->
    {[], [{10001, 10000}], 0,
     [{1, 90500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36200}]};
get_award(354) ->
    {[], [{10001, 10000}], 0,
     [{1, 90500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36200}]};
get_award(355) ->
    {[], [{10001, 10000}], 0,
     [{1, 91000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36400}]};
get_award(356) ->
    {[], [{10001, 10000}], 0,
     [{1, 91000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36400}]};
get_award(357) ->
    {[], [{10001, 10000}], 0,
     [{1, 91500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36600}]};
get_award(358) ->
    {[], [{10001, 10000}], 0,
     [{1, 91500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36600}]};
get_award(359) ->
    {[], [{10001, 10000}], 0,
     [{1, 92000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36800}]};
get_award(360) ->
    {[], [{10001, 10000}], 0,
     [{1, 92000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 36800}]};
get_award(361) ->
    {[], [{10001, 10000}], 0,
     [{1, 92500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37000}]};
get_award(362) ->
    {[], [{10001, 10000}], 0,
     [{1, 92500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37000}]};
get_award(363) ->
    {[], [{10001, 10000}], 0,
     [{1, 93000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37200}]};
get_award(364) ->
    {[], [{10001, 10000}], 0,
     [{1, 93000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37200}]};
get_award(365) ->
    {[], [{10001, 10000}], 0,
     [{1, 93500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37400}]};
get_award(366) ->
    {[], [{10001, 10000}], 0,
     [{1, 93500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37400}]};
get_award(367) ->
    {[], [{10001, 10000}], 0,
     [{1, 94000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37600}]};
get_award(368) ->
    {[], [{10001, 10000}], 0,
     [{1, 94000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37600}]};
get_award(369) ->
    {[], [{10001, 10000}], 0,
     [{1, 94500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37800}]};
get_award(370) ->
    {[], [{10001, 10000}], 0,
     [{1, 94500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 37800}]};
get_award(371) ->
    {[], [{10001, 10000}], 0,
     [{1, 95000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38000}]};
get_award(372) ->
    {[], [{10001, 10000}], 0,
     [{1, 95000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38000}]};
get_award(373) ->
    {[], [{10001, 10000}], 0,
     [{1, 95500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38200}]};
get_award(374) ->
    {[], [{10001, 10000}], 0,
     [{1, 95500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38200}]};
get_award(375) ->
    {[], [{10001, 10000}], 0,
     [{1, 96000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38400}]};
get_award(376) ->
    {[], [{10001, 10000}], 0,
     [{1, 96000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38400}]};
get_award(377) ->
    {[], [{10001, 10000}], 0,
     [{1, 96500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38600}]};
get_award(378) ->
    {[], [{10001, 10000}], 0,
     [{1, 96500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38600}]};
get_award(379) ->
    {[], [{10001, 10000}], 0,
     [{1, 97000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38800}]};
get_award(380) ->
    {[], [{10001, 10000}], 0,
     [{1, 97000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 38800}]};
get_award(381) ->
    {[], [{10001, 10000}], 0,
     [{1, 97500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39000}]};
get_award(382) ->
    {[], [{10001, 10000}], 0,
     [{1, 97500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39000}]};
get_award(383) ->
    {[], [{10001, 10000}], 0,
     [{1, 98000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39200}]};
get_award(384) ->
    {[], [{10001, 10000}], 0,
     [{1, 98000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39200}]};
get_award(385) ->
    {[], [{10001, 10000}], 0,
     [{1, 98500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39400}]};
get_award(386) ->
    {[], [{10001, 10000}], 0,
     [{1, 98500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39400}]};
get_award(387) ->
    {[], [{10001, 10000}], 0,
     [{1, 99000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39600}]};
get_award(388) ->
    {[], [{10001, 10000}], 0,
     [{1, 99000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39600}]};
get_award(389) ->
    {[], [{10001, 10000}], 0,
     [{1, 99500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39800}]};
get_award(390) ->
    {[], [{10001, 10000}], 0,
     [{1, 99500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 39800}]};
get_award(391) ->
    {[], [{10001, 10000}], 0,
     [{1, 100000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40000}]};
get_award(392) ->
    {[], [{10001, 10000}], 0,
     [{1, 100000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40000}]};
get_award(393) ->
    {[], [{10001, 10000}], 0,
     [{1, 100500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40200}]};
get_award(394) ->
    {[], [{10001, 10000}], 0,
     [{1, 100500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40200}]};
get_award(395) ->
    {[], [{10001, 10000}], 0,
     [{1, 101000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40400}]};
get_award(396) ->
    {[], [{10001, 10000}], 0,
     [{1, 101000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40400}]};
get_award(397) ->
    {[], [{10001, 10000}], 0,
     [{1, 101500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40600}]};
get_award(398) ->
    {[], [{10001, 10000}], 0,
     [{1, 101500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40600}]};
get_award(399) ->
    {[], [{10001, 10000}], 0,
     [{1, 102000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40800}]};
get_award(400) ->
    {[], [{10001, 10000}], 0,
     [{1, 102000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 40800}]};
get_award(401) ->
    {[], [{10001, 10000}], 0,
     [{1, 102500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41000}]};
get_award(402) ->
    {[], [{10001, 10000}], 0,
     [{1, 102500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41000}]};
get_award(403) ->
    {[], [{10001, 10000}], 0,
     [{1, 103000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41200}]};
get_award(404) ->
    {[], [{10001, 10000}], 0,
     [{1, 103000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41200}]};
get_award(405) ->
    {[], [{10001, 10000}], 0,
     [{1, 103500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41400}]};
get_award(406) ->
    {[], [{10001, 10000}], 0,
     [{1, 103500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41400}]};
get_award(407) ->
    {[], [{10001, 10000}], 0,
     [{1, 104000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41600}]};
get_award(408) ->
    {[], [{10001, 10000}], 0,
     [{1, 104000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41600}]};
get_award(409) ->
    {[], [{10001, 10000}], 0,
     [{1, 104500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41800}]};
get_award(410) ->
    {[], [{10001, 10000}], 0,
     [{1, 104500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 41800}]};
get_award(411) ->
    {[], [{10001, 10000}], 0,
     [{1, 105000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42000}]};
get_award(412) ->
    {[], [{10001, 10000}], 0,
     [{1, 105000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42000}]};
get_award(413) ->
    {[], [{10001, 10000}], 0,
     [{1, 105500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42200}]};
get_award(414) ->
    {[], [{10001, 10000}], 0,
     [{1, 105500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42200}]};
get_award(415) ->
    {[], [{10001, 10000}], 0,
     [{1, 106000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42400}]};
get_award(416) ->
    {[], [{10001, 10000}], 0,
     [{1, 106000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42400}]};
get_award(417) ->
    {[], [{10001, 10000}], 0,
     [{1, 106500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42600}]};
get_award(418) ->
    {[], [{10001, 10000}], 0,
     [{1, 106500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42600}]};
get_award(419) ->
    {[], [{10001, 10000}], 0,
     [{1, 107000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42800}]};
get_award(420) ->
    {[], [{10001, 10000}], 0,
     [{1, 107000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 42800}]};
get_award(421) ->
    {[], [{10001, 10000}], 0,
     [{1, 107500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43000}]};
get_award(422) ->
    {[], [{10001, 10000}], 0,
     [{1, 107500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43000}]};
get_award(423) ->
    {[], [{10001, 10000}], 0,
     [{1, 108000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43200}]};
get_award(424) ->
    {[], [{10001, 10000}], 0,
     [{1, 108000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43200}]};
get_award(425) ->
    {[], [{10001, 10000}], 0,
     [{1, 108500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43400}]};
get_award(426) ->
    {[], [{10001, 10000}], 0,
     [{1, 108500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43400}]};
get_award(427) ->
    {[], [{10001, 10000}], 0,
     [{1, 109000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43600}]};
get_award(428) ->
    {[], [{10001, 10000}], 0,
     [{1, 109000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43600}]};
get_award(429) ->
    {[], [{10001, 10000}], 0,
     [{1, 109500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43800}]};
get_award(430) ->
    {[], [{10001, 10000}], 0,
     [{1, 109500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 43800}]};
get_award(431) ->
    {[], [{10001, 10000}], 0,
     [{1, 110000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44000}]};
get_award(432) ->
    {[], [{10001, 10000}], 0,
     [{1, 110000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44000}]};
get_award(433) ->
    {[], [{10001, 10000}], 0,
     [{1, 110500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44200}]};
get_award(434) ->
    {[], [{10001, 10000}], 0,
     [{1, 110500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44200}]};
get_award(435) ->
    {[], [{10001, 10000}], 0,
     [{1, 111000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44400}]};
get_award(436) ->
    {[], [{10001, 10000}], 0,
     [{1, 111000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44400}]};
get_award(437) ->
    {[], [{10001, 10000}], 0,
     [{1, 111500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44600}]};
get_award(438) ->
    {[], [{10001, 10000}], 0,
     [{1, 111500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44600}]};
get_award(439) ->
    {[], [{10001, 10000}], 0,
     [{1, 112000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44800}]};
get_award(440) ->
    {[], [{10001, 10000}], 0,
     [{1, 112000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 44800}]};
get_award(441) ->
    {[], [{10001, 10000}], 0,
     [{1, 112500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45000}]};
get_award(442) ->
    {[], [{10001, 10000}], 0,
     [{1, 112500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45000}]};
get_award(443) ->
    {[], [{10001, 10000}], 0,
     [{1, 113000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45200}]};
get_award(444) ->
    {[], [{10001, 10000}], 0,
     [{1, 113000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45200}]};
get_award(445) ->
    {[], [{10001, 10000}], 0,
     [{1, 113500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45400}]};
get_award(446) ->
    {[], [{10001, 10000}], 0,
     [{1, 113500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45400}]};
get_award(447) ->
    {[], [{10001, 10000}], 0,
     [{1, 114000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45600}]};
get_award(448) ->
    {[], [{10001, 10000}], 0,
     [{1, 114000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45600}]};
get_award(449) ->
    {[], [{10001, 10000}], 0,
     [{1, 114500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45800}]};
get_award(450) ->
    {[], [{10001, 10000}], 0,
     [{1, 114500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 45800}]};
get_award(451) ->
    {[], [{10001, 10000}], 0,
     [{1, 115000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46000}]};
get_award(452) ->
    {[], [{10001, 10000}], 0,
     [{1, 115000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46000}]};
get_award(453) ->
    {[], [{10001, 10000}], 0,
     [{1, 115500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46200}]};
get_award(454) ->
    {[], [{10001, 10000}], 0,
     [{1, 115500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46200}]};
get_award(455) ->
    {[], [{10001, 10000}], 0,
     [{1, 116000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46400}]};
get_award(456) ->
    {[], [{10001, 10000}], 0,
     [{1, 116000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46400}]};
get_award(457) ->
    {[], [{10001, 10000}], 0,
     [{1, 116500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46600}]};
get_award(458) ->
    {[], [{10001, 10000}], 0,
     [{1, 116500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46600}]};
get_award(459) ->
    {[], [{10001, 10000}], 0,
     [{1, 117000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46800}]};
get_award(460) ->
    {[], [{10001, 10000}], 0,
     [{1, 117000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 46800}]};
get_award(461) ->
    {[], [{10001, 10000}], 0,
     [{1, 117500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47000}]};
get_award(462) ->
    {[], [{10001, 10000}], 0,
     [{1, 117500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47000}]};
get_award(463) ->
    {[], [{10001, 10000}], 0,
     [{1, 118000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47200}]};
get_award(464) ->
    {[], [{10001, 10000}], 0,
     [{1, 118000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47200}]};
get_award(465) ->
    {[], [{10001, 10000}], 0,
     [{1, 118500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47400}]};
get_award(466) ->
    {[], [{10001, 10000}], 0,
     [{1, 118500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47400}]};
get_award(467) ->
    {[], [{10001, 10000}], 0,
     [{1, 119000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47600}]};
get_award(468) ->
    {[], [{10001, 10000}], 0,
     [{1, 119000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47600}]};
get_award(469) ->
    {[], [{10001, 10000}], 0,
     [{1, 119500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47800}]};
get_award(470) ->
    {[], [{10001, 10000}], 0,
     [{1, 119500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 47800}]};
get_award(471) ->
    {[], [{10001, 10000}], 0,
     [{1, 120000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48000}]};
get_award(472) ->
    {[], [{10001, 10000}], 0,
     [{1, 120000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48000}]};
get_award(473) ->
    {[], [{10001, 10000}], 0,
     [{1, 120500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48200}]};
get_award(474) ->
    {[], [{10001, 10000}], 0,
     [{1, 120500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48200}]};
get_award(475) ->
    {[], [{10001, 10000}], 0,
     [{1, 121000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48400}]};
get_award(476) ->
    {[], [{10001, 10000}], 0,
     [{1, 121000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48400}]};
get_award(477) ->
    {[], [{10001, 10000}], 0,
     [{1, 121500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48600}]};
get_award(478) ->
    {[], [{10001, 10000}], 0,
     [{1, 121500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48600}]};
get_award(479) ->
    {[], [{10001, 10000}], 0,
     [{1, 122000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48800}]};
get_award(480) ->
    {[], [{10001, 10000}], 0,
     [{1, 122000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 48800}]};
get_award(481) ->
    {[], [{10001, 10000}], 0,
     [{1, 122500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49000}]};
get_award(482) ->
    {[], [{10001, 10000}], 0,
     [{1, 122500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49000}]};
get_award(483) ->
    {[], [{10001, 10000}], 0,
     [{1, 123000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49200}]};
get_award(484) ->
    {[], [{10001, 10000}], 0,
     [{1, 123000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49200}]};
get_award(485) ->
    {[], [{10001, 10000}], 0,
     [{1, 123500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49400}]};
get_award(486) ->
    {[], [{10001, 10000}], 0,
     [{1, 123500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49400}]};
get_award(487) ->
    {[], [{10001, 10000}], 0,
     [{1, 124000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49600}]};
get_award(488) ->
    {[], [{10001, 10000}], 0,
     [{1, 124000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49600}]};
get_award(489) ->
    {[], [{10001, 10000}], 0,
     [{1, 124500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49800}]};
get_award(490) ->
    {[], [{10001, 10000}], 0,
     [{1, 124500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 49800}]};
get_award(491) ->
    {[], [{10001, 10000}], 0,
     [{1, 125000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50000}]};
get_award(492) ->
    {[], [{10001, 10000}], 0,
     [{1, 125000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50000}]};
get_award(493) ->
    {[], [{10001, 10000}], 0,
     [{1, 125500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50200}]};
get_award(494) ->
    {[], [{10001, 10000}], 0,
     [{1, 125500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50200}]};
get_award(495) ->
    {[], [{10001, 10000}], 0,
     [{1, 126000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50400}]};
get_award(496) ->
    {[], [{10001, 10000}], 0,
     [{1, 126000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50400}]};
get_award(497) ->
    {[], [{10001, 10000}], 0,
     [{1, 126500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50600}]};
get_award(498) ->
    {[], [{10001, 10000}], 0,
     [{1, 126500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50600}]};
get_award(499) ->
    {[], [{10001, 10000}], 0,
     [{1, 127000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50800}]};
get_award(500) ->
    {[], [{10001, 10000}], 0,
     [{1, 127000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50800}]};
get_award(501) ->
    {[], [{10001, 10000}], 0,
     [{1, 127000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50800}]};
get_award(502) ->
    {[], [{10001, 10000}], 0,
     [{1, 127000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 50800}]};
get_award(503) ->
    {[], [{10001, 10000}], 0,
     [{1, 127500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51000}]};
get_award(504) ->
    {[], [{10001, 10000}], 0,
     [{1, 127500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51000}]};
get_award(505) ->
    {[], [{10001, 10000}], 0,
     [{1, 128000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51200}]};
get_award(506) ->
    {[], [{10001, 10000}], 0,
     [{1, 128000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51200}]};
get_award(507) ->
    {[], [{10001, 10000}], 0,
     [{1, 128500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51400}]};
get_award(508) ->
    {[], [{10001, 10000}], 0,
     [{1, 128500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51400}]};
get_award(509) ->
    {[], [{10001, 10000}], 0,
     [{1, 129000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51600}]};
get_award(510) ->
    {[], [{10001, 10000}], 0,
     [{1, 129000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51600}]};
get_award(511) ->
    {[], [{10001, 10000}], 0,
     [{1, 129500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51800}]};
get_award(512) ->
    {[], [{10001, 10000}], 0,
     [{1, 129500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 51800}]};
get_award(513) ->
    {[], [{10001, 10000}], 0,
     [{1, 130000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52000}]};
get_award(514) ->
    {[], [{10001, 10000}], 0,
     [{1, 130000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52000}]};
get_award(515) ->
    {[], [{10001, 10000}], 0,
     [{1, 130500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52200}]};
get_award(516) ->
    {[], [{10001, 10000}], 0,
     [{1, 130500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52200}]};
get_award(517) ->
    {[], [{10001, 10000}], 0,
     [{1, 131000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52400}]};
get_award(518) ->
    {[], [{10001, 10000}], 0,
     [{1, 131000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52400}]};
get_award(519) ->
    {[], [{10001, 10000}], 0,
     [{1, 131500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52600}]};
get_award(520) ->
    {[], [{10001, 10000}], 0,
     [{1, 131500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52600}]};
get_award(521) ->
    {[], [{10001, 10000}], 0,
     [{1, 132000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52800}]};
get_award(522) ->
    {[], [{10001, 10000}], 0,
     [{1, 132000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 52800}]};
get_award(523) ->
    {[], [{10001, 10000}], 0,
     [{1, 132500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53000}]};
get_award(524) ->
    {[], [{10001, 10000}], 0,
     [{1, 132500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53000}]};
get_award(525) ->
    {[], [{10001, 10000}], 0,
     [{1, 133000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53200}]};
get_award(526) ->
    {[], [{10001, 10000}], 0,
     [{1, 133000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53200}]};
get_award(527) ->
    {[], [{10001, 10000}], 0,
     [{1, 133500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53400}]};
get_award(528) ->
    {[], [{10001, 10000}], 0,
     [{1, 133500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53400}]};
get_award(529) ->
    {[], [{10001, 10000}], 0,
     [{1, 134000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53600}]};
get_award(530) ->
    {[], [{10001, 10000}], 0,
     [{1, 134000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53600}]};
get_award(531) ->
    {[], [{10001, 10000}], 0,
     [{1, 134500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53800}]};
get_award(532) ->
    {[], [{10001, 10000}], 0,
     [{1, 134500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 53800}]};
get_award(533) ->
    {[], [{10001, 10000}], 0,
     [{1, 135000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54000}]};
get_award(534) ->
    {[], [{10001, 10000}], 0,
     [{1, 135000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54000}]};
get_award(535) ->
    {[], [{10001, 10000}], 0,
     [{1, 135500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54200}]};
get_award(536) ->
    {[], [{10001, 10000}], 0,
     [{1, 135500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54200}]};
get_award(537) ->
    {[], [{10001, 10000}], 0,
     [{1, 136000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54400}]};
get_award(538) ->
    {[], [{10001, 10000}], 0,
     [{1, 136000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54400}]};
get_award(539) ->
    {[], [{10001, 10000}], 0,
     [{1, 136500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54600}]};
get_award(540) ->
    {[], [{10001, 10000}], 0,
     [{1, 136500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54600}]};
get_award(541) ->
    {[], [{10001, 10000}], 0,
     [{1, 137000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54800}]};
get_award(542) ->
    {[], [{10001, 10000}], 0,
     [{1, 137000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 54800}]};
get_award(543) ->
    {[], [{10001, 10000}], 0,
     [{1, 137500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55000}]};
get_award(544) ->
    {[], [{10001, 10000}], 0,
     [{1, 137500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55000}]};
get_award(545) ->
    {[], [{10001, 10000}], 0,
     [{1, 138000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55200}]};
get_award(546) ->
    {[], [{10001, 10000}], 0,
     [{1, 138000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55200}]};
get_award(547) ->
    {[], [{10001, 10000}], 0,
     [{1, 138500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55400}]};
get_award(548) ->
    {[], [{10001, 10000}], 0,
     [{1, 138500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55400}]};
get_award(549) ->
    {[], [{10001, 10000}], 0,
     [{1, 139000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55600}]};
get_award(550) ->
    {[], [{10001, 10000}], 0,
     [{1, 139000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55600}]};
get_award(551) ->
    {[], [{10001, 10000}], 0,
     [{1, 139500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55800}]};
get_award(552) ->
    {[], [{10001, 10000}], 0,
     [{1, 139500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 55800}]};
get_award(553) ->
    {[], [{10001, 10000}], 0,
     [{1, 140000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56000}]};
get_award(554) ->
    {[], [{10001, 10000}], 0,
     [{1, 140000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56000}]};
get_award(555) ->
    {[], [{10001, 10000}], 0,
     [{1, 140500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56200}]};
get_award(556) ->
    {[], [{10001, 10000}], 0,
     [{1, 140500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56200}]};
get_award(557) ->
    {[], [{10001, 10000}], 0,
     [{1, 141000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56400}]};
get_award(558) ->
    {[], [{10001, 10000}], 0,
     [{1, 141000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56400}]};
get_award(559) ->
    {[], [{10001, 10000}], 0,
     [{1, 141500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56600}]};
get_award(560) ->
    {[], [{10001, 10000}], 0,
     [{1, 141500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56600}]};
get_award(561) ->
    {[], [{10001, 10000}], 0,
     [{1, 142000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56800}]};
get_award(562) ->
    {[], [{10001, 10000}], 0,
     [{1, 142000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 56800}]};
get_award(563) ->
    {[], [{10001, 10000}], 0,
     [{1, 142500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57000}]};
get_award(564) ->
    {[], [{10001, 10000}], 0,
     [{1, 142500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57000}]};
get_award(565) ->
    {[], [{10001, 10000}], 0,
     [{1, 143000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57200}]};
get_award(566) ->
    {[], [{10001, 10000}], 0,
     [{1, 143000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57200}]};
get_award(567) ->
    {[], [{10001, 10000}], 0,
     [{1, 143500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57400}]};
get_award(568) ->
    {[], [{10001, 10000}], 0,
     [{1, 143500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57400}]};
get_award(569) ->
    {[], [{10001, 10000}], 0,
     [{1, 144000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57600}]};
get_award(570) ->
    {[], [{10001, 10000}], 0,
     [{1, 144000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57600}]};
get_award(571) ->
    {[], [{10001, 10000}], 0,
     [{1, 144500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57800}]};
get_award(572) ->
    {[], [{10001, 10000}], 0,
     [{1, 144500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 57800}]};
get_award(573) ->
    {[], [{10001, 10000}], 0,
     [{1, 145000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58000}]};
get_award(574) ->
    {[], [{10001, 10000}], 0,
     [{1, 145000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58000}]};
get_award(575) ->
    {[], [{10001, 10000}], 0,
     [{1, 145500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58200}]};
get_award(576) ->
    {[], [{10001, 10000}], 0,
     [{1, 145500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58200}]};
get_award(577) ->
    {[], [{10001, 10000}], 0,
     [{1, 146000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58400}]};
get_award(578) ->
    {[], [{10001, 10000}], 0,
     [{1, 146000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58400}]};
get_award(579) ->
    {[], [{10001, 10000}], 0,
     [{1, 146500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58600}]};
get_award(580) ->
    {[], [{10001, 10000}], 0,
     [{1, 146500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58600}]};
get_award(581) ->
    {[], [{10001, 10000}], 0,
     [{1, 147000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58800}]};
get_award(582) ->
    {[], [{10001, 10000}], 0,
     [{1, 147000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 58800}]};
get_award(583) ->
    {[], [{10001, 10000}], 0,
     [{1, 147500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59000}]};
get_award(584) ->
    {[], [{10001, 10000}], 0,
     [{1, 147500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59000}]};
get_award(585) ->
    {[], [{10001, 10000}], 0,
     [{1, 148000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59200}]};
get_award(586) ->
    {[], [{10001, 10000}], 0,
     [{1, 148000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59200}]};
get_award(587) ->
    {[], [{10001, 10000}], 0,
     [{1, 148500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59400}]};
get_award(588) ->
    {[], [{10001, 10000}], 0,
     [{1, 148500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59400}]};
get_award(589) ->
    {[], [{10001, 10000}], 0,
     [{1, 149000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59600}]};
get_award(590) ->
    {[], [{10001, 10000}], 0,
     [{1, 149000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59600}]};
get_award(591) ->
    {[], [{10001, 10000}], 0,
     [{1, 149500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59800}]};
get_award(592) ->
    {[], [{10001, 10000}], 0,
     [{1, 149500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 59800}]};
get_award(593) ->
    {[], [{10001, 10000}], 0,
     [{1, 150000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60000}]};
get_award(594) ->
    {[], [{10001, 10000}], 0,
     [{1, 150000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60000}]};
get_award(595) ->
    {[], [{10001, 10000}], 0,
     [{1, 150500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60200}]};
get_award(596) ->
    {[], [{10001, 10000}], 0,
     [{1, 150500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60200}]};
get_award(597) ->
    {[], [{10001, 10000}], 0,
     [{1, 151000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60400}]};
get_award(598) ->
    {[], [{10001, 10000}], 0,
     [{1, 151000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60400}]};
get_award(599) ->
    {[], [{10001, 10000}], 0,
     [{1, 151500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60600}]};
get_award(600) ->
    {[], [{10001, 10000}], 0,
     [{1, 151500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60600}]};
get_award(601) ->
    {[], [{10001, 10000}], 0,
     [{1, 152000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60800}]};
get_award(602) ->
    {[], [{10001, 10000}], 0,
     [{1, 152000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 60800}]};
get_award(603) ->
    {[], [{10001, 10000}], 0,
     [{1, 152500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61000}]};
get_award(604) ->
    {[], [{10001, 10000}], 0,
     [{1, 152500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61000}]};
get_award(605) ->
    {[], [{10001, 10000}], 0,
     [{1, 153000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61200}]};
get_award(606) ->
    {[], [{10001, 10000}], 0,
     [{1, 153000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61200}]};
get_award(607) ->
    {[], [{10001, 10000}], 0,
     [{1, 153500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61400}]};
get_award(608) ->
    {[], [{10001, 10000}], 0,
     [{1, 153500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61400}]};
get_award(609) ->
    {[], [{10001, 10000}], 0,
     [{1, 154000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61600}]};
get_award(610) ->
    {[], [{10001, 10000}], 0,
     [{1, 154000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61600}]};
get_award(611) ->
    {[], [{10001, 10000}], 0,
     [{1, 154500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61800}]};
get_award(612) ->
    {[], [{10001, 10000}], 0,
     [{1, 154500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 61800}]};
get_award(613) ->
    {[], [{10001, 10000}], 0,
     [{1, 155000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62000}]};
get_award(614) ->
    {[], [{10001, 10000}], 0,
     [{1, 155000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62000}]};
get_award(615) ->
    {[], [{10001, 10000}], 0,
     [{1, 155500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62200}]};
get_award(616) ->
    {[], [{10001, 10000}], 0,
     [{1, 155500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62200}]};
get_award(617) ->
    {[], [{10001, 10000}], 0,
     [{1, 156000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62400}]};
get_award(618) ->
    {[], [{10001, 10000}], 0,
     [{1, 156000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62400}]};
get_award(619) ->
    {[], [{10001, 10000}], 0,
     [{1, 156500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62600}]};
get_award(620) ->
    {[], [{10001, 10000}], 0,
     [{1, 156500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62600}]};
get_award(621) ->
    {[], [{10001, 10000}], 0,
     [{1, 157000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62800}]};
get_award(622) ->
    {[], [{10001, 10000}], 0,
     [{1, 157000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 62800}]};
get_award(623) ->
    {[], [{10001, 10000}], 0,
     [{1, 157500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63000}]};
get_award(624) ->
    {[], [{10001, 10000}], 0,
     [{1, 157500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63000}]};
get_award(625) ->
    {[], [{10001, 10000}], 0,
     [{1, 158000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63200}]};
get_award(626) ->
    {[], [{10001, 10000}], 0,
     [{1, 158000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63200}]};
get_award(627) ->
    {[], [{10001, 10000}], 0,
     [{1, 158500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63400}]};
get_award(628) ->
    {[], [{10001, 10000}], 0,
     [{1, 158500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63400}]};
get_award(629) ->
    {[], [{10001, 10000}], 0,
     [{1, 159000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63600}]};
get_award(630) ->
    {[], [{10001, 10000}], 0,
     [{1, 159000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63600}]};
get_award(631) ->
    {[], [{10001, 10000}], 0,
     [{1, 159500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63800}]};
get_award(632) ->
    {[], [{10001, 10000}], 0,
     [{1, 159500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 63800}]};
get_award(633) ->
    {[], [{10001, 10000}], 0,
     [{1, 160000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64000}]};
get_award(634) ->
    {[], [{10001, 10000}], 0,
     [{1, 160000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64000}]};
get_award(635) ->
    {[], [{10001, 10000}], 0,
     [{1, 160500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64200}]};
get_award(636) ->
    {[], [{10001, 10000}], 0,
     [{1, 160500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64200}]};
get_award(637) ->
    {[], [{10001, 10000}], 0,
     [{1, 161000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64400}]};
get_award(638) ->
    {[], [{10001, 10000}], 0,
     [{1, 161000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64400}]};
get_award(639) ->
    {[], [{10001, 10000}], 0,
     [{1, 161500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64600}]};
get_award(640) ->
    {[], [{10001, 10000}], 0,
     [{1, 161500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64600}]};
get_award(641) ->
    {[], [{10001, 10000}], 0,
     [{1, 162000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64800}]};
get_award(642) ->
    {[], [{10001, 10000}], 0,
     [{1, 162000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 64800}]};
get_award(643) ->
    {[], [{10001, 10000}], 0,
     [{1, 162500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65000}]};
get_award(644) ->
    {[], [{10001, 10000}], 0,
     [{1, 162500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65000}]};
get_award(645) ->
    {[], [{10001, 10000}], 0,
     [{1, 163000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65200}]};
get_award(646) ->
    {[], [{10001, 10000}], 0,
     [{1, 163000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65200}]};
get_award(647) ->
    {[], [{10001, 10000}], 0,
     [{1, 163500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65400}]};
get_award(648) ->
    {[], [{10001, 10000}], 0,
     [{1, 163500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65400}]};
get_award(649) ->
    {[], [{10001, 10000}], 0,
     [{1, 164000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65600}]};
get_award(650) ->
    {[], [{10001, 10000}], 0,
     [{1, 164000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65600}]};
get_award(651) ->
    {[], [{10001, 10000}], 0,
     [{1, 164500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65800}]};
get_award(652) ->
    {[], [{10001, 10000}], 0,
     [{1, 164500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 65800}]};
get_award(653) ->
    {[], [{10001, 10000}], 0,
     [{1, 165000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66000}]};
get_award(654) ->
    {[], [{10001, 10000}], 0,
     [{1, 165000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66000}]};
get_award(655) ->
    {[], [{10001, 10000}], 0,
     [{1, 165500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66200}]};
get_award(656) ->
    {[], [{10001, 10000}], 0,
     [{1, 165500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66200}]};
get_award(657) ->
    {[], [{10001, 10000}], 0,
     [{1, 166000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66400}]};
get_award(658) ->
    {[], [{10001, 10000}], 0,
     [{1, 166000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66400}]};
get_award(659) ->
    {[], [{10001, 10000}], 0,
     [{1, 166500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66600}]};
get_award(660) ->
    {[], [{10001, 10000}], 0,
     [{1, 166500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66600}]};
get_award(661) ->
    {[], [{10001, 10000}], 0,
     [{1, 167000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66800}]};
get_award(662) ->
    {[], [{10001, 10000}], 0,
     [{1, 167000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 66800}]};
get_award(663) ->
    {[], [{10001, 10000}], 0,
     [{1, 167500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67000}]};
get_award(664) ->
    {[], [{10001, 10000}], 0,
     [{1, 167500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67000}]};
get_award(665) ->
    {[], [{10001, 10000}], 0,
     [{1, 168000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67200}]};
get_award(666) ->
    {[], [{10001, 10000}], 0,
     [{1, 168000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67200}]};
get_award(667) ->
    {[], [{10001, 10000}], 0,
     [{1, 168500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67400}]};
get_award(668) ->
    {[], [{10001, 10000}], 0,
     [{1, 168500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67400}]};
get_award(669) ->
    {[], [{10001, 10000}], 0,
     [{1, 169000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67600}]};
get_award(670) ->
    {[], [{10001, 10000}], 0,
     [{1, 169000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67600}]};
get_award(671) ->
    {[], [{10001, 10000}], 0,
     [{1, 169500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67800}]};
get_award(672) ->
    {[], [{10001, 10000}], 0,
     [{1, 169500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 67800}]};
get_award(673) ->
    {[], [{10001, 10000}], 0,
     [{1, 170000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68000}]};
get_award(674) ->
    {[], [{10001, 10000}], 0,
     [{1, 170000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68000}]};
get_award(675) ->
    {[], [{10001, 10000}], 0,
     [{1, 170500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68200}]};
get_award(676) ->
    {[], [{10001, 10000}], 0,
     [{1, 170500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68200}]};
get_award(677) ->
    {[], [{10001, 10000}], 0,
     [{1, 171000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68400}]};
get_award(678) ->
    {[], [{10001, 10000}], 0,
     [{1, 171000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68400}]};
get_award(679) ->
    {[], [{10001, 10000}], 0,
     [{1, 171500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68600}]};
get_award(680) ->
    {[], [{10001, 10000}], 0,
     [{1, 171500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68600}]};
get_award(681) ->
    {[], [{10001, 10000}], 0,
     [{1, 172000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68800}]};
get_award(682) ->
    {[], [{10001, 10000}], 0,
     [{1, 172000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 68800}]};
get_award(683) ->
    {[], [{10001, 10000}], 0,
     [{1, 172500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69000}]};
get_award(684) ->
    {[], [{10001, 10000}], 0,
     [{1, 172500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69000}]};
get_award(685) ->
    {[], [{10001, 10000}], 0,
     [{1, 173000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69200}]};
get_award(686) ->
    {[], [{10001, 10000}], 0,
     [{1, 173000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69200}]};
get_award(687) ->
    {[], [{10001, 10000}], 0,
     [{1, 173500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69400}]};
get_award(688) ->
    {[], [{10001, 10000}], 0,
     [{1, 173500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69400}]};
get_award(689) ->
    {[], [{10001, 10000}], 0,
     [{1, 174000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69600}]};
get_award(690) ->
    {[], [{10001, 10000}], 0,
     [{1, 174000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69600}]};
get_award(691) ->
    {[], [{10001, 10000}], 0,
     [{1, 174500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69800}]};
get_award(692) ->
    {[], [{10001, 10000}], 0,
     [{1, 174500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 69800}]};
get_award(693) ->
    {[], [{10001, 10000}], 0,
     [{1, 175000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70000}]};
get_award(694) ->
    {[], [{10001, 10000}], 0,
     [{1, 175000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70000}]};
get_award(695) ->
    {[], [{10001, 10000}], 0,
     [{1, 175500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70200}]};
get_award(696) ->
    {[], [{10001, 10000}], 0,
     [{1, 175500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70200}]};
get_award(697) ->
    {[], [{10001, 10000}], 0,
     [{1, 176000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70400}]};
get_award(698) ->
    {[], [{10001, 10000}], 0,
     [{1, 176000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70400}]};
get_award(699) ->
    {[], [{10001, 10000}], 0,
     [{1, 176500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70600}]};
get_award(700) ->
    {[], [{10001, 10000}], 0,
     [{1, 176500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70600}]};
get_award(701) ->
    {[], [{10001, 10000}], 0,
     [{1, 177000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70800}]};
get_award(702) ->
    {[], [{10001, 10000}], 0,
     [{1, 177000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 70800}]};
get_award(703) ->
    {[], [{10001, 10000}], 0,
     [{1, 177500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71000}]};
get_award(704) ->
    {[], [{10001, 10000}], 0,
     [{1, 177500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71000}]};
get_award(705) ->
    {[], [{10001, 10000}], 0,
     [{1, 178000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71200}]};
get_award(706) ->
    {[], [{10001, 10000}], 0,
     [{1, 178000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71200}]};
get_award(707) ->
    {[], [{10001, 10000}], 0,
     [{1, 178500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71400}]};
get_award(708) ->
    {[], [{10001, 10000}], 0,
     [{1, 178500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71400}]};
get_award(709) ->
    {[], [{10001, 10000}], 0,
     [{1, 179000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71600}]};
get_award(710) ->
    {[], [{10001, 10000}], 0,
     [{1, 179000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71600}]};
get_award(711) ->
    {[], [{10001, 10000}], 0,
     [{1, 179500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71800}]};
get_award(712) ->
    {[], [{10001, 10000}], 0,
     [{1, 179500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 71800}]};
get_award(713) ->
    {[], [{10001, 10000}], 0,
     [{1, 180000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72000}]};
get_award(714) ->
    {[], [{10001, 10000}], 0,
     [{1, 180000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72000}]};
get_award(715) ->
    {[], [{10001, 10000}], 0,
     [{1, 180500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72200}]};
get_award(716) ->
    {[], [{10001, 10000}], 0,
     [{1, 180500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72200}]};
get_award(717) ->
    {[], [{10001, 10000}], 0,
     [{1, 181000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72400}]};
get_award(718) ->
    {[], [{10001, 10000}], 0,
     [{1, 181000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72400}]};
get_award(719) ->
    {[], [{10001, 10000}], 0,
     [{1, 181500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72600}]};
get_award(720) ->
    {[], [{10001, 10000}], 0,
     [{1, 181500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72600}]};
get_award(721) ->
    {[], [{10001, 10000}], 0,
     [{1, 182000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72800}]};
get_award(722) ->
    {[], [{10001, 10000}], 0,
     [{1, 182000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 72800}]};
get_award(723) ->
    {[], [{10001, 10000}], 0,
     [{1, 182500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73000}]};
get_award(724) ->
    {[], [{10001, 10000}], 0,
     [{1, 182500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73000}]};
get_award(725) ->
    {[], [{10001, 10000}], 0,
     [{1, 183000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73200}]};
get_award(726) ->
    {[], [{10001, 10000}], 0,
     [{1, 183000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73200}]};
get_award(727) ->
    {[], [{10001, 10000}], 0,
     [{1, 183500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73400}]};
get_award(728) ->
    {[], [{10001, 10000}], 0,
     [{1, 183500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73400}]};
get_award(729) ->
    {[], [{10001, 10000}], 0,
     [{1, 184000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73600}]};
get_award(730) ->
    {[], [{10001, 10000}], 0,
     [{1, 184000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73600}]};
get_award(731) ->
    {[], [{10001, 10000}], 0,
     [{1, 184500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73800}]};
get_award(732) ->
    {[], [{10001, 10000}], 0,
     [{1, 184500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 73800}]};
get_award(733) ->
    {[], [{10001, 10000}], 0,
     [{1, 185000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74000}]};
get_award(734) ->
    {[], [{10001, 10000}], 0,
     [{1, 185000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74000}]};
get_award(735) ->
    {[], [{10001, 10000}], 0,
     [{1, 185500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74200}]};
get_award(736) ->
    {[], [{10001, 10000}], 0,
     [{1, 185500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74200}]};
get_award(737) ->
    {[], [{10001, 10000}], 0,
     [{1, 186000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74400}]};
get_award(738) ->
    {[], [{10001, 10000}], 0,
     [{1, 186000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74400}]};
get_award(739) ->
    {[], [{10001, 10000}], 0,
     [{1, 186500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74600}]};
get_award(740) ->
    {[], [{10001, 10000}], 0,
     [{1, 186500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74600}]};
get_award(741) ->
    {[], [{10001, 10000}], 0,
     [{1, 187000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74800}]};
get_award(742) ->
    {[], [{10001, 10000}], 0,
     [{1, 187000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 74800}]};
get_award(743) ->
    {[], [{10001, 10000}], 0,
     [{1, 187500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75000}]};
get_award(744) ->
    {[], [{10001, 10000}], 0,
     [{1, 187500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75000}]};
get_award(745) ->
    {[], [{10001, 10000}], 0,
     [{1, 188000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75200}]};
get_award(746) ->
    {[], [{10001, 10000}], 0,
     [{1, 188000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75200}]};
get_award(747) ->
    {[], [{10001, 10000}], 0,
     [{1, 188500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75400}]};
get_award(748) ->
    {[], [{10001, 10000}], 0,
     [{1, 188500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75400}]};
get_award(749) ->
    {[], [{10001, 10000}], 0,
     [{1, 189000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75600}]};
get_award(750) ->
    {[], [{10001, 10000}], 0,
     [{1, 189000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75600}]};
get_award(751) ->
    {[], [{10001, 10000}], 0,
     [{1, 189500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75800}]};
get_award(752) ->
    {[], [{10001, 10000}], 0,
     [{1, 189500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 75800}]};
get_award(753) ->
    {[], [{10001, 10000}], 0,
     [{1, 190000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76000}]};
get_award(754) ->
    {[], [{10001, 10000}], 0,
     [{1, 190000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76000}]};
get_award(755) ->
    {[], [{10001, 10000}], 0,
     [{1, 190500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76200}]};
get_award(756) ->
    {[], [{10001, 10000}], 0,
     [{1, 190500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76200}]};
get_award(757) ->
    {[], [{10001, 10000}], 0,
     [{1, 191000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76400}]};
get_award(758) ->
    {[], [{10001, 10000}], 0,
     [{1, 191000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76400}]};
get_award(759) ->
    {[], [{10001, 10000}], 0,
     [{1, 191500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76600}]};
get_award(760) ->
    {[], [{10001, 10000}], 0,
     [{1, 191500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76600}]};
get_award(761) ->
    {[], [{10001, 10000}], 0,
     [{1, 192000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76800}]};
get_award(762) ->
    {[], [{10001, 10000}], 0,
     [{1, 192000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 76800}]};
get_award(763) ->
    {[], [{10001, 10000}], 0,
     [{1, 192500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77000}]};
get_award(764) ->
    {[], [{10001, 10000}], 0,
     [{1, 192500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77000}]};
get_award(765) ->
    {[], [{10001, 10000}], 0,
     [{1, 193000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77200}]};
get_award(766) ->
    {[], [{10001, 10000}], 0,
     [{1, 193000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77200}]};
get_award(767) ->
    {[], [{10001, 10000}], 0,
     [{1, 193500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77400}]};
get_award(768) ->
    {[], [{10001, 10000}], 0,
     [{1, 193500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77400}]};
get_award(769) ->
    {[], [{10001, 10000}], 0,
     [{1, 194000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77600}]};
get_award(770) ->
    {[], [{10001, 10000}], 0,
     [{1, 194000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77600}]};
get_award(771) ->
    {[], [{10001, 10000}], 0,
     [{1, 194500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77800}]};
get_award(772) ->
    {[], [{10001, 10000}], 0,
     [{1, 194500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 77800}]};
get_award(773) ->
    {[], [{10001, 10000}], 0,
     [{1, 195000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78000}]};
get_award(774) ->
    {[], [{10001, 10000}], 0,
     [{1, 195000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78000}]};
get_award(775) ->
    {[], [{10001, 10000}], 0,
     [{1, 195500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78200}]};
get_award(776) ->
    {[], [{10001, 10000}], 0,
     [{1, 195500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78200}]};
get_award(777) ->
    {[], [{10001, 10000}], 0,
     [{1, 196000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78400}]};
get_award(778) ->
    {[], [{10001, 10000}], 0,
     [{1, 196000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78400}]};
get_award(779) ->
    {[], [{10001, 10000}], 0,
     [{1, 196500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78600}]};
get_award(780) ->
    {[], [{10001, 10000}], 0,
     [{1, 196500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78600}]};
get_award(781) ->
    {[], [{10001, 10000}], 0,
     [{1, 197000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78800}]};
get_award(782) ->
    {[], [{10001, 10000}], 0,
     [{1, 197000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 78800}]};
get_award(783) ->
    {[], [{10001, 10000}], 0,
     [{1, 197500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79000}]};
get_award(784) ->
    {[], [{10001, 10000}], 0,
     [{1, 197500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79000}]};
get_award(785) ->
    {[], [{10001, 10000}], 0,
     [{1, 198000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79200}]};
get_award(786) ->
    {[], [{10001, 10000}], 0,
     [{1, 198000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79200}]};
get_award(787) ->
    {[], [{10001, 10000}], 0,
     [{1, 198500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79400}]};
get_award(788) ->
    {[], [{10001, 10000}], 0,
     [{1, 198500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79400}]};
get_award(789) ->
    {[], [{10001, 10000}], 0,
     [{1, 199000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79600}]};
get_award(790) ->
    {[], [{10001, 10000}], 0,
     [{1, 199000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79600}]};
get_award(791) ->
    {[], [{10001, 10000}], 0,
     [{1, 199500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79800}]};
get_award(792) ->
    {[], [{10001, 10000}], 0,
     [{1, 199500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 79800}]};
get_award(793) ->
    {[], [{10001, 10000}], 0,
     [{1, 200000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80000}]};
get_award(794) ->
    {[], [{10001, 10000}], 0,
     [{1, 200000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80000}]};
get_award(795) ->
    {[], [{10001, 10000}], 0,
     [{1, 200500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80200}]};
get_award(796) ->
    {[], [{10001, 10000}], 0,
     [{1, 200500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80200}]};
get_award(797) ->
    {[], [{10001, 10000}], 0,
     [{1, 201000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80400}]};
get_award(798) ->
    {[], [{10001, 10000}], 0,
     [{1, 201000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80400}]};
get_award(799) ->
    {[], [{10001, 10000}], 0,
     [{1, 201500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80600}]};
get_award(800) ->
    {[], [{10001, 10000}], 0,
     [{1, 201500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80600}]};
get_award(801) ->
    {[], [{10001, 10000}], 0,
     [{1, 202000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80800}]};
get_award(802) ->
    {[], [{10001, 10000}], 0,
     [{1, 202000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80800}]};
get_award(803) ->
    {[], [{10001, 10000}], 0,
     [{1, 202500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81000}]};
get_award(804) ->
    {[], [{10001, 10000}], 0,
     [{1, 202500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81000}]};
get_award(805) ->
    {[], [{10001, 10000}], 0,
     [{1, 203000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81200}]};
get_award(806) ->
    {[], [{10001, 10000}], 0,
     [{1, 203000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81200}]};
get_award(807) ->
    {[], [{10001, 10000}], 0,
     [{1, 203500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81400}]};
get_award(808) ->
    {[], [{10001, 10000}], 0,
     [{1, 203500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81400}]};
get_award(809) ->
    {[], [{10001, 10000}], 0,
     [{1, 204000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81600}]};
get_award(810) ->
    {[], [{10001, 10000}], 0,
     [{1, 204000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81600}]};
get_award(811) ->
    {[], [{10001, 10000}], 0,
     [{1, 204500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81800}]};
get_award(812) ->
    {[], [{10001, 10000}], 0,
     [{1, 204500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81800}]};
get_award(813) ->
    {[], [{10001, 10000}], 0,
     [{1, 205000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82000}]};
get_award(814) ->
    {[], [{10001, 10000}], 0,
     [{1, 205000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82000}]};
get_award(815) ->
    {[], [{10001, 10000}], 0,
     [{1, 205500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82200}]};
get_award(816) ->
    {[], [{10001, 10000}], 0,
     [{1, 205500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82200}]};
get_award(817) ->
    {[], [{10001, 10000}], 0,
     [{1, 206000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82400}]};
get_award(818) ->
    {[], [{10001, 10000}], 0,
     [{1, 206000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82400}]};
get_award(819) ->
    {[], [{10001, 10000}], 0,
     [{1, 206500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82600}]};
get_award(820) ->
    {[], [{10001, 10000}], 0,
     [{1, 206500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82600}]};
get_award(821) ->
    {[], [{10001, 10000}], 0,
     [{1, 207000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82800}]};
get_award(822) ->
    {[], [{10001, 10000}], 0,
     [{1, 207000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82800}]};
get_award(823) ->
    {[], [{10001, 10000}], 0,
     [{1, 207500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83000}]};
get_award(824) ->
    {[], [{10001, 10000}], 0,
     [{1, 207500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83000}]};
get_award(825) ->
    {[], [{10001, 10000}], 0,
     [{1, 208000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83200}]};
get_award(826) ->
    {[], [{10001, 10000}], 0,
     [{1, 208000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83200}]};
get_award(827) ->
    {[], [{10001, 10000}], 0,
     [{1, 208500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83400}]};
get_award(828) ->
    {[], [{10001, 10000}], 0,
     [{1, 208500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83400}]};
get_award(829) ->
    {[], [{10001, 10000}], 0,
     [{1, 209000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83600}]};
get_award(830) ->
    {[], [{10001, 10000}], 0,
     [{1, 209000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83600}]};
get_award(831) ->
    {[], [{10001, 10000}], 0,
     [{1, 209500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83800}]};
get_award(832) ->
    {[], [{10001, 10000}], 0,
     [{1, 209500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83800}]};
get_award(833) ->
    {[], [{10001, 10000}], 0,
     [{1, 210000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84000}]};
get_award(834) ->
    {[], [{10001, 10000}], 0,
     [{1, 210000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84000}]};
get_award(835) ->
    {[], [{10001, 10000}], 0,
     [{1, 210500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84200}]};
get_award(836) ->
    {[], [{10001, 10000}], 0,
     [{1, 210500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84200}]};
get_award(837) ->
    {[], [{10001, 10000}], 0,
     [{1, 211000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84400}]};
get_award(838) ->
    {[], [{10001, 10000}], 0,
     [{1, 211000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84400}]};
get_award(839) ->
    {[], [{10001, 10000}], 0,
     [{1, 211500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84600}]};
get_award(840) ->
    {[], [{10001, 10000}], 0,
     [{1, 211500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84600}]};
get_award(841) ->
    {[], [{10001, 10000}], 0,
     [{1, 212000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84800}]};
get_award(842) ->
    {[], [{10001, 10000}], 0,
     [{1, 212000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84800}]};
get_award(843) ->
    {[], [{10001, 10000}], 0,
     [{1, 212500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85000}]};
get_award(844) ->
    {[], [{10001, 10000}], 0,
     [{1, 212500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85000}]};
get_award(845) ->
    {[], [{10001, 10000}], 0,
     [{1, 213000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85200}]};
get_award(846) ->
    {[], [{10001, 10000}], 0,
     [{1, 213000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85200}]};
get_award(847) ->
    {[], [{10001, 10000}], 0,
     [{1, 213500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85400}]};
get_award(848) ->
    {[], [{10001, 10000}], 0,
     [{1, 213500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85400}]};
get_award(849) ->
    {[], [{10001, 10000}], 0,
     [{1, 214000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85600}]};
get_award(850) ->
    {[], [{10001, 10000}], 0,
     [{1, 214000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85600}]};
get_award(851) ->
    {[], [{10001, 10000}], 0,
     [{1, 214500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85800}]};
get_award(852) ->
    {[], [{10001, 10000}], 0,
     [{1, 214500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85800}]};
get_award(853) ->
    {[], [{10001, 10000}], 0,
     [{1, 215000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86000}]};
get_award(854) ->
    {[], [{10001, 10000}], 0,
     [{1, 215000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86000}]};
get_award(855) ->
    {[], [{10001, 10000}], 0,
     [{1, 215500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86200}]};
get_award(856) ->
    {[], [{10001, 10000}], 0,
     [{1, 215500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86200}]};
get_award(857) ->
    {[], [{10001, 10000}], 0,
     [{1, 216000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86400}]};
get_award(858) ->
    {[], [{10001, 10000}], 0,
     [{1, 216000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86400}]};
get_award(859) ->
    {[], [{10001, 10000}], 0,
     [{1, 216500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86600}]};
get_award(860) ->
    {[], [{10001, 10000}], 0,
     [{1, 216500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86600}]};
get_award(861) ->
    {[], [{10001, 10000}], 0,
     [{1, 217000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86800}]};
get_award(862) ->
    {[], [{10001, 10000}], 0,
     [{1, 217000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86800}]};
get_award(863) ->
    {[], [{10001, 10000}], 0,
     [{1, 217500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87000}]};
get_award(864) ->
    {[], [{10001, 10000}], 0,
     [{1, 217500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87000}]};
get_award(865) ->
    {[], [{10001, 10000}], 0,
     [{1, 218000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87200}]};
get_award(866) ->
    {[], [{10001, 10000}], 0,
     [{1, 218000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87200}]};
get_award(867) ->
    {[], [{10001, 10000}], 0,
     [{1, 218500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87400}]};
get_award(868) ->
    {[], [{10001, 10000}], 0,
     [{1, 218500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87400}]};
get_award(869) ->
    {[], [{10001, 10000}], 0,
     [{1, 219000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87600}]};
get_award(870) ->
    {[], [{10001, 10000}], 0,
     [{1, 219000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87600}]};
get_award(871) ->
    {[], [{10001, 10000}], 0,
     [{1, 219500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87800}]};
get_award(872) ->
    {[], [{10001, 10000}], 0,
     [{1, 219500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87800}]};
get_award(873) ->
    {[], [{10001, 10000}], 0,
     [{1, 220000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88000}]};
get_award(874) ->
    {[], [{10001, 10000}], 0,
     [{1, 220000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88000}]};
get_award(875) ->
    {[], [{10001, 10000}], 0,
     [{1, 220500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88200}]};
get_award(876) ->
    {[], [{10001, 10000}], 0,
     [{1, 220500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88200}]};
get_award(877) ->
    {[], [{10001, 10000}], 0,
     [{1, 221000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88400}]};
get_award(878) ->
    {[], [{10001, 10000}], 0,
     [{1, 221000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88400}]};
get_award(879) ->
    {[], [{10001, 10000}], 0,
     [{1, 221500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88600}]};
get_award(880) ->
    {[], [{10001, 10000}], 0,
     [{1, 221500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88600}]};
get_award(881) ->
    {[], [{10001, 10000}], 0,
     [{1, 222000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88800}]};
get_award(882) ->
    {[], [{10001, 10000}], 0,
     [{1, 222000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88800}]};
get_award(883) ->
    {[], [{10001, 10000}], 0,
     [{1, 222500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89000}]};
get_award(884) ->
    {[], [{10001, 10000}], 0,
     [{1, 222500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89000}]};
get_award(885) ->
    {[], [{10001, 10000}], 0,
     [{1, 223000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89200}]};
get_award(886) ->
    {[], [{10001, 10000}], 0,
     [{1, 223000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89200}]};
get_award(887) ->
    {[], [{10001, 10000}], 0,
     [{1, 223500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89400}]};
get_award(888) ->
    {[], [{10001, 10000}], 0,
     [{1, 223500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89400}]};
get_award(889) ->
    {[], [{10001, 10000}], 0,
     [{1, 224000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89600}]};
get_award(890) ->
    {[], [{10001, 10000}], 0,
     [{1, 224000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89600}]};
get_award(891) ->
    {[], [{10001, 10000}], 0,
     [{1, 224500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89800}]};
get_award(892) ->
    {[], [{10001, 10000}], 0,
     [{1, 224500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89800}]};
get_award(893) ->
    {[], [{10001, 10000}], 0,
     [{1, 225000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90000}]};
get_award(894) ->
    {[], [{10001, 10000}], 0,
     [{1, 225000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90000}]};
get_award(895) ->
    {[], [{10001, 10000}], 0,
     [{1, 225500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90200}]};
get_award(896) ->
    {[], [{10001, 10000}], 0,
     [{1, 225500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90200}]};
get_award(897) ->
    {[], [{10001, 10000}], 0,
     [{1, 226000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90400}]};
get_award(898) ->
    {[], [{10001, 10000}], 0,
     [{1, 226000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90400}]};
get_award(899) ->
    {[], [{10001, 10000}], 0,
     [{1, 226500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90600}]};
get_award(900) ->
    {[], [{10001, 10000}], 0,
     [{1, 226500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90600}]};
get_award(901) ->
    {[], [{10001, 10000}], 0,
     [{1, 202000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80800}]};
get_award(902) ->
    {[], [{10001, 10000}], 0,
     [{1, 202000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 80800}]};
get_award(903) ->
    {[], [{10001, 10000}], 0,
     [{1, 202500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81000}]};
get_award(904) ->
    {[], [{10001, 10000}], 0,
     [{1, 202500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81000}]};
get_award(905) ->
    {[], [{10001, 10000}], 0,
     [{1, 203000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81200}]};
get_award(906) ->
    {[], [{10001, 10000}], 0,
     [{1, 203000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81200}]};
get_award(907) ->
    {[], [{10001, 10000}], 0,
     [{1, 203500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81400}]};
get_award(908) ->
    {[], [{10001, 10000}], 0,
     [{1, 203500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81400}]};
get_award(909) ->
    {[], [{10001, 10000}], 0,
     [{1, 204000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81600}]};
get_award(910) ->
    {[], [{10001, 10000}], 0,
     [{1, 204000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81600}]};
get_award(911) ->
    {[], [{10001, 10000}], 0,
     [{1, 204500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81800}]};
get_award(912) ->
    {[], [{10001, 10000}], 0,
     [{1, 204500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 81800}]};
get_award(913) ->
    {[], [{10001, 10000}], 0,
     [{1, 205000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82000}]};
get_award(914) ->
    {[], [{10001, 10000}], 0,
     [{1, 205000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82000}]};
get_award(915) ->
    {[], [{10001, 10000}], 0,
     [{1, 205500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82200}]};
get_award(916) ->
    {[], [{10001, 10000}], 0,
     [{1, 205500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82200}]};
get_award(917) ->
    {[], [{10001, 10000}], 0,
     [{1, 206000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82400}]};
get_award(918) ->
    {[], [{10001, 10000}], 0,
     [{1, 206000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82400}]};
get_award(919) ->
    {[], [{10001, 10000}], 0,
     [{1, 206500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82600}]};
get_award(920) ->
    {[], [{10001, 10000}], 0,
     [{1, 206500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82600}]};
get_award(921) ->
    {[], [{10001, 10000}], 0,
     [{1, 207000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82800}]};
get_award(922) ->
    {[], [{10001, 10000}], 0,
     [{1, 207000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 82800}]};
get_award(923) ->
    {[], [{10001, 10000}], 0,
     [{1, 207500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83000}]};
get_award(924) ->
    {[], [{10001, 10000}], 0,
     [{1, 207500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83000}]};
get_award(925) ->
    {[], [{10001, 10000}], 0,
     [{1, 208000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83200}]};
get_award(926) ->
    {[], [{10001, 10000}], 0,
     [{1, 208000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83200}]};
get_award(927) ->
    {[], [{10001, 10000}], 0,
     [{1, 208500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83400}]};
get_award(928) ->
    {[], [{10001, 10000}], 0,
     [{1, 208500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83400}]};
get_award(929) ->
    {[], [{10001, 10000}], 0,
     [{1, 209000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83600}]};
get_award(930) ->
    {[], [{10001, 10000}], 0,
     [{1, 209000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83600}]};
get_award(931) ->
    {[], [{10001, 10000}], 0,
     [{1, 209500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83800}]};
get_award(932) ->
    {[], [{10001, 10000}], 0,
     [{1, 209500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 83800}]};
get_award(933) ->
    {[], [{10001, 10000}], 0,
     [{1, 210000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84000}]};
get_award(934) ->
    {[], [{10001, 10000}], 0,
     [{1, 210000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84000}]};
get_award(935) ->
    {[], [{10001, 10000}], 0,
     [{1, 210500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84200}]};
get_award(936) ->
    {[], [{10001, 10000}], 0,
     [{1, 210500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84200}]};
get_award(937) ->
    {[], [{10001, 10000}], 0,
     [{1, 211000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84400}]};
get_award(938) ->
    {[], [{10001, 10000}], 0,
     [{1, 211000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84400}]};
get_award(939) ->
    {[], [{10001, 10000}], 0,
     [{1, 211500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84600}]};
get_award(940) ->
    {[], [{10001, 10000}], 0,
     [{1, 211500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84600}]};
get_award(941) ->
    {[], [{10001, 10000}], 0,
     [{1, 212000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84800}]};
get_award(942) ->
    {[], [{10001, 10000}], 0,
     [{1, 212000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 84800}]};
get_award(943) ->
    {[], [{10001, 10000}], 0,
     [{1, 212500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85000}]};
get_award(944) ->
    {[], [{10001, 10000}], 0,
     [{1, 212500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85000}]};
get_award(945) ->
    {[], [{10001, 10000}], 0,
     [{1, 213000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85200}]};
get_award(946) ->
    {[], [{10001, 10000}], 0,
     [{1, 213000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85200}]};
get_award(947) ->
    {[], [{10001, 10000}], 0,
     [{1, 213500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85400}]};
get_award(948) ->
    {[], [{10001, 10000}], 0,
     [{1, 213500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85400}]};
get_award(949) ->
    {[], [{10001, 10000}], 0,
     [{1, 214000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85600}]};
get_award(950) ->
    {[], [{10001, 10000}], 0,
     [{1, 214000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85600}]};
get_award(951) ->
    {[], [{10001, 10000}], 0,
     [{1, 214500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85800}]};
get_award(952) ->
    {[], [{10001, 10000}], 0,
     [{1, 214500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 85800}]};
get_award(953) ->
    {[], [{10001, 10000}], 0,
     [{1, 215000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86000}]};
get_award(954) ->
    {[], [{10001, 10000}], 0,
     [{1, 215000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86000}]};
get_award(955) ->
    {[], [{10001, 10000}], 0,
     [{1, 215500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86200}]};
get_award(956) ->
    {[], [{10001, 10000}], 0,
     [{1, 215500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86200}]};
get_award(957) ->
    {[], [{10001, 10000}], 0,
     [{1, 216000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86400}]};
get_award(958) ->
    {[], [{10001, 10000}], 0,
     [{1, 216000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86400}]};
get_award(959) ->
    {[], [{10001, 10000}], 0,
     [{1, 216500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86600}]};
get_award(960) ->
    {[], [{10001, 10000}], 0,
     [{1, 216500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86600}]};
get_award(961) ->
    {[], [{10001, 10000}], 0,
     [{1, 217000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86800}]};
get_award(962) ->
    {[], [{10001, 10000}], 0,
     [{1, 217000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 86800}]};
get_award(963) ->
    {[], [{10001, 10000}], 0,
     [{1, 217500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87000}]};
get_award(964) ->
    {[], [{10001, 10000}], 0,
     [{1, 217500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87000}]};
get_award(965) ->
    {[], [{10001, 10000}], 0,
     [{1, 218000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87200}]};
get_award(966) ->
    {[], [{10001, 10000}], 0,
     [{1, 218000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87200}]};
get_award(967) ->
    {[], [{10001, 10000}], 0,
     [{1, 218500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87400}]};
get_award(968) ->
    {[], [{10001, 10000}], 0,
     [{1, 218500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87400}]};
get_award(969) ->
    {[], [{10001, 10000}], 0,
     [{1, 219000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87600}]};
get_award(970) ->
    {[], [{10001, 10000}], 0,
     [{1, 219000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87600}]};
get_award(971) ->
    {[], [{10001, 10000}], 0,
     [{1, 219500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87800}]};
get_award(972) ->
    {[], [{10001, 10000}], 0,
     [{1, 219500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 87800}]};
get_award(973) ->
    {[], [{10001, 10000}], 0,
     [{1, 220000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88000}]};
get_award(974) ->
    {[], [{10001, 10000}], 0,
     [{1, 220000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88000}]};
get_award(975) ->
    {[], [{10001, 10000}], 0,
     [{1, 220500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88200}]};
get_award(976) ->
    {[], [{10001, 10000}], 0,
     [{1, 220500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88200}]};
get_award(977) ->
    {[], [{10001, 10000}], 0,
     [{1, 221000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88400}]};
get_award(978) ->
    {[], [{10001, 10000}], 0,
     [{1, 221000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88400}]};
get_award(979) ->
    {[], [{10001, 10000}], 0,
     [{1, 221500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88600}]};
get_award(980) ->
    {[], [{10001, 10000}], 0,
     [{1, 221500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88600}]};
get_award(981) ->
    {[], [{10001, 10000}], 0,
     [{1, 222000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88800}]};
get_award(982) ->
    {[], [{10001, 10000}], 0,
     [{1, 222000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 88800}]};
get_award(983) ->
    {[], [{10001, 10000}], 0,
     [{1, 222500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89000}]};
get_award(984) ->
    {[], [{10001, 10000}], 0,
     [{1, 222500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89000}]};
get_award(985) ->
    {[], [{10001, 10000}], 0,
     [{1, 223000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89200}]};
get_award(986) ->
    {[], [{10001, 10000}], 0,
     [{1, 223000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89200}]};
get_award(987) ->
    {[], [{10001, 10000}], 0,
     [{1, 223500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89400}]};
get_award(988) ->
    {[], [{10001, 10000}], 0,
     [{1, 223500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89400}]};
get_award(989) ->
    {[], [{10001, 10000}], 0,
     [{1, 224000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89600}]};
get_award(990) ->
    {[], [{10001, 10000}], 0,
     [{1, 224000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89600}]};
get_award(991) ->
    {[], [{10001, 10000}], 0,
     [{1, 224500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89800}]};
get_award(992) ->
    {[], [{10001, 10000}], 0,
     [{1, 224500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 89800}]};
get_award(993) ->
    {[], [{10001, 10000}], 0,
     [{1, 225000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90000}]};
get_award(994) ->
    {[], [{10001, 10000}], 0,
     [{1, 225000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90000}]};
get_award(995) ->
    {[], [{10001, 10000}], 0,
     [{1, 225500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90200}]};
get_award(996) ->
    {[], [{10001, 10000}], 0,
     [{1, 225500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90200}]};
get_award(997) ->
    {[], [{10001, 10000}], 0,
     [{1, 226000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90400}]};
get_award(998) ->
    {[], [{10001, 10000}], 0,
     [{1, 226000}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90400}]};
get_award(999) ->
    {[], [{10001, 10000}], 0,
     [{1, 226500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90600}]};
get_award(1000) ->
    {[], [{10001, 10000}], 0,
     [{1, 226500}, {10090, 3}, {10091, 3}, {40414, 1},
      {40314, 1}, {40214, 1}, {40114, 1}, {39052, 5},
      {39053, 5}, {22, 90600}]};
get_award(_Info) ->
    logger:data_error("get_award_data_not_exist===>~w",
		      [_Info], star_tower_data, 2743),
    undefined.

get_limit_dun_id(1) -> 0;
get_limit_dun_id(2) -> 0;
get_limit_dun_id(3) -> 0;
get_limit_dun_id(4) -> 0;
get_limit_dun_id(5) -> 0;
get_limit_dun_id(6) -> 0;
get_limit_dun_id(7) -> 0;
get_limit_dun_id(8) -> 0;
get_limit_dun_id(9) -> 0;
get_limit_dun_id(10) -> 0;
get_limit_dun_id(11) -> 0;
get_limit_dun_id(12) -> 0;
get_limit_dun_id(13) -> 0;
get_limit_dun_id(14) -> 0;
get_limit_dun_id(15) -> 0;
get_limit_dun_id(16) -> 0;
get_limit_dun_id(17) -> 0;
get_limit_dun_id(18) -> 0;
get_limit_dun_id(19) -> 0;
get_limit_dun_id(20) -> 0;
get_limit_dun_id(21) -> 0;
get_limit_dun_id(22) -> 0;
get_limit_dun_id(23) -> 0;
get_limit_dun_id(24) -> 0;
get_limit_dun_id(25) -> 0;
get_limit_dun_id(26) -> 0;
get_limit_dun_id(27) -> 0;
get_limit_dun_id(28) -> 0;
get_limit_dun_id(29) -> 0;
get_limit_dun_id(30) -> 0;
get_limit_dun_id(31) -> 0;
get_limit_dun_id(32) -> 0;
get_limit_dun_id(33) -> 0;
get_limit_dun_id(34) -> 0;
get_limit_dun_id(35) -> 0;
get_limit_dun_id(36) -> 0;
get_limit_dun_id(37) -> 0;
get_limit_dun_id(38) -> 0;
get_limit_dun_id(39) -> 0;
get_limit_dun_id(40) -> 0;
get_limit_dun_id(41) -> 0;
get_limit_dun_id(42) -> 0;
get_limit_dun_id(43) -> 0;
get_limit_dun_id(44) -> 0;
get_limit_dun_id(45) -> 0;
get_limit_dun_id(46) -> 0;
get_limit_dun_id(47) -> 0;
get_limit_dun_id(48) -> 0;
get_limit_dun_id(49) -> 0;
get_limit_dun_id(50) -> 0;
get_limit_dun_id(51) -> 0;
get_limit_dun_id(52) -> 0;
get_limit_dun_id(53) -> 0;
get_limit_dun_id(54) -> 0;
get_limit_dun_id(55) -> 0;
get_limit_dun_id(56) -> 0;
get_limit_dun_id(57) -> 0;
get_limit_dun_id(58) -> 0;
get_limit_dun_id(59) -> 0;
get_limit_dun_id(60) -> 0;
get_limit_dun_id(61) -> 0;
get_limit_dun_id(62) -> 0;
get_limit_dun_id(63) -> 0;
get_limit_dun_id(64) -> 0;
get_limit_dun_id(65) -> 0;
get_limit_dun_id(66) -> 0;
get_limit_dun_id(67) -> 0;
get_limit_dun_id(68) -> 0;
get_limit_dun_id(69) -> 0;
get_limit_dun_id(70) -> 0;
get_limit_dun_id(71) -> 0;
get_limit_dun_id(72) -> 0;
get_limit_dun_id(73) -> 0;
get_limit_dun_id(74) -> 0;
get_limit_dun_id(75) -> 0;
get_limit_dun_id(76) -> 0;
get_limit_dun_id(77) -> 0;
get_limit_dun_id(78) -> 0;
get_limit_dun_id(79) -> 0;
get_limit_dun_id(80) -> 0;
get_limit_dun_id(81) -> 0;
get_limit_dun_id(82) -> 0;
get_limit_dun_id(83) -> 0;
get_limit_dun_id(84) -> 0;
get_limit_dun_id(85) -> 0;
get_limit_dun_id(86) -> 0;
get_limit_dun_id(87) -> 0;
get_limit_dun_id(88) -> 0;
get_limit_dun_id(89) -> 0;
get_limit_dun_id(90) -> 0;
get_limit_dun_id(91) -> 0;
get_limit_dun_id(92) -> 0;
get_limit_dun_id(93) -> 0;
get_limit_dun_id(94) -> 0;
get_limit_dun_id(95) -> 0;
get_limit_dun_id(96) -> 0;
get_limit_dun_id(97) -> 0;
get_limit_dun_id(98) -> 0;
get_limit_dun_id(99) -> 0;
get_limit_dun_id(100) -> 0;
get_limit_dun_id(101) -> 0;
get_limit_dun_id(102) -> 0;
get_limit_dun_id(103) -> 0;
get_limit_dun_id(104) -> 0;
get_limit_dun_id(105) -> 0;
get_limit_dun_id(106) -> 0;
get_limit_dun_id(107) -> 0;
get_limit_dun_id(108) -> 0;
get_limit_dun_id(109) -> 0;
get_limit_dun_id(110) -> 0;
get_limit_dun_id(111) -> 0;
get_limit_dun_id(112) -> 0;
get_limit_dun_id(113) -> 0;
get_limit_dun_id(114) -> 0;
get_limit_dun_id(115) -> 0;
get_limit_dun_id(116) -> 0;
get_limit_dun_id(117) -> 0;
get_limit_dun_id(118) -> 0;
get_limit_dun_id(119) -> 0;
get_limit_dun_id(120) -> 0;
get_limit_dun_id(121) -> 0;
get_limit_dun_id(122) -> 0;
get_limit_dun_id(123) -> 0;
get_limit_dun_id(124) -> 0;
get_limit_dun_id(125) -> 0;
get_limit_dun_id(126) -> 0;
get_limit_dun_id(127) -> 0;
get_limit_dun_id(128) -> 0;
get_limit_dun_id(129) -> 0;
get_limit_dun_id(130) -> 0;
get_limit_dun_id(131) -> 0;
get_limit_dun_id(132) -> 0;
get_limit_dun_id(133) -> 0;
get_limit_dun_id(134) -> 0;
get_limit_dun_id(135) -> 0;
get_limit_dun_id(136) -> 0;
get_limit_dun_id(137) -> 0;
get_limit_dun_id(138) -> 0;
get_limit_dun_id(139) -> 0;
get_limit_dun_id(140) -> 0;
get_limit_dun_id(141) -> 0;
get_limit_dun_id(142) -> 0;
get_limit_dun_id(143) -> 0;
get_limit_dun_id(144) -> 0;
get_limit_dun_id(145) -> 0;
get_limit_dun_id(146) -> 0;
get_limit_dun_id(147) -> 0;
get_limit_dun_id(148) -> 0;
get_limit_dun_id(149) -> 0;
get_limit_dun_id(150) -> 0;
get_limit_dun_id(151) -> 0;
get_limit_dun_id(152) -> 0;
get_limit_dun_id(153) -> 0;
get_limit_dun_id(154) -> 0;
get_limit_dun_id(155) -> 0;
get_limit_dun_id(156) -> 0;
get_limit_dun_id(157) -> 0;
get_limit_dun_id(158) -> 0;
get_limit_dun_id(159) -> 0;
get_limit_dun_id(160) -> 0;
get_limit_dun_id(161) -> 0;
get_limit_dun_id(162) -> 0;
get_limit_dun_id(163) -> 0;
get_limit_dun_id(164) -> 0;
get_limit_dun_id(165) -> 0;
get_limit_dun_id(166) -> 0;
get_limit_dun_id(167) -> 0;
get_limit_dun_id(168) -> 0;
get_limit_dun_id(169) -> 0;
get_limit_dun_id(170) -> 0;
get_limit_dun_id(171) -> 0;
get_limit_dun_id(172) -> 0;
get_limit_dun_id(173) -> 0;
get_limit_dun_id(174) -> 0;
get_limit_dun_id(175) -> 0;
get_limit_dun_id(176) -> 0;
get_limit_dun_id(177) -> 0;
get_limit_dun_id(178) -> 0;
get_limit_dun_id(179) -> 0;
get_limit_dun_id(180) -> 0;
get_limit_dun_id(181) -> 0;
get_limit_dun_id(182) -> 0;
get_limit_dun_id(183) -> 0;
get_limit_dun_id(184) -> 0;
get_limit_dun_id(185) -> 0;
get_limit_dun_id(186) -> 0;
get_limit_dun_id(187) -> 0;
get_limit_dun_id(188) -> 0;
get_limit_dun_id(189) -> 0;
get_limit_dun_id(190) -> 0;
get_limit_dun_id(191) -> 0;
get_limit_dun_id(192) -> 0;
get_limit_dun_id(193) -> 0;
get_limit_dun_id(194) -> 0;
get_limit_dun_id(195) -> 0;
get_limit_dun_id(196) -> 0;
get_limit_dun_id(197) -> 0;
get_limit_dun_id(198) -> 0;
get_limit_dun_id(199) -> 0;
get_limit_dun_id(200) -> 0;
get_limit_dun_id(201) -> 0;
get_limit_dun_id(202) -> 0;
get_limit_dun_id(203) -> 0;
get_limit_dun_id(204) -> 0;
get_limit_dun_id(205) -> 0;
get_limit_dun_id(206) -> 0;
get_limit_dun_id(207) -> 0;
get_limit_dun_id(208) -> 0;
get_limit_dun_id(209) -> 0;
get_limit_dun_id(210) -> 0;
get_limit_dun_id(211) -> 0;
get_limit_dun_id(212) -> 0;
get_limit_dun_id(213) -> 0;
get_limit_dun_id(214) -> 0;
get_limit_dun_id(215) -> 0;
get_limit_dun_id(216) -> 0;
get_limit_dun_id(217) -> 0;
get_limit_dun_id(218) -> 0;
get_limit_dun_id(219) -> 0;
get_limit_dun_id(220) -> 0;
get_limit_dun_id(221) -> 0;
get_limit_dun_id(222) -> 0;
get_limit_dun_id(223) -> 0;
get_limit_dun_id(224) -> 0;
get_limit_dun_id(225) -> 0;
get_limit_dun_id(226) -> 0;
get_limit_dun_id(227) -> 0;
get_limit_dun_id(228) -> 0;
get_limit_dun_id(229) -> 0;
get_limit_dun_id(230) -> 0;
get_limit_dun_id(231) -> 0;
get_limit_dun_id(232) -> 0;
get_limit_dun_id(233) -> 0;
get_limit_dun_id(234) -> 0;
get_limit_dun_id(235) -> 0;
get_limit_dun_id(236) -> 0;
get_limit_dun_id(237) -> 0;
get_limit_dun_id(238) -> 0;
get_limit_dun_id(239) -> 0;
get_limit_dun_id(240) -> 0;
get_limit_dun_id(241) -> 0;
get_limit_dun_id(242) -> 0;
get_limit_dun_id(243) -> 0;
get_limit_dun_id(244) -> 0;
get_limit_dun_id(245) -> 0;
get_limit_dun_id(246) -> 0;
get_limit_dun_id(247) -> 0;
get_limit_dun_id(248) -> 0;
get_limit_dun_id(249) -> 0;
get_limit_dun_id(250) -> 0;
get_limit_dun_id(251) -> 0;
get_limit_dun_id(252) -> 0;
get_limit_dun_id(253) -> 0;
get_limit_dun_id(254) -> 0;
get_limit_dun_id(255) -> 0;
get_limit_dun_id(256) -> 0;
get_limit_dun_id(257) -> 0;
get_limit_dun_id(258) -> 0;
get_limit_dun_id(259) -> 0;
get_limit_dun_id(260) -> 0;
get_limit_dun_id(261) -> 0;
get_limit_dun_id(262) -> 0;
get_limit_dun_id(263) -> 0;
get_limit_dun_id(264) -> 0;
get_limit_dun_id(265) -> 0;
get_limit_dun_id(266) -> 0;
get_limit_dun_id(267) -> 0;
get_limit_dun_id(268) -> 0;
get_limit_dun_id(269) -> 0;
get_limit_dun_id(270) -> 0;
get_limit_dun_id(271) -> 0;
get_limit_dun_id(272) -> 0;
get_limit_dun_id(273) -> 0;
get_limit_dun_id(274) -> 0;
get_limit_dun_id(275) -> 0;
get_limit_dun_id(276) -> 0;
get_limit_dun_id(277) -> 0;
get_limit_dun_id(278) -> 0;
get_limit_dun_id(279) -> 0;
get_limit_dun_id(280) -> 0;
get_limit_dun_id(281) -> 0;
get_limit_dun_id(282) -> 0;
get_limit_dun_id(283) -> 0;
get_limit_dun_id(284) -> 0;
get_limit_dun_id(285) -> 0;
get_limit_dun_id(286) -> 0;
get_limit_dun_id(287) -> 0;
get_limit_dun_id(288) -> 0;
get_limit_dun_id(289) -> 0;
get_limit_dun_id(290) -> 0;
get_limit_dun_id(291) -> 0;
get_limit_dun_id(292) -> 0;
get_limit_dun_id(293) -> 0;
get_limit_dun_id(294) -> 0;
get_limit_dun_id(295) -> 0;
get_limit_dun_id(296) -> 0;
get_limit_dun_id(297) -> 0;
get_limit_dun_id(298) -> 0;
get_limit_dun_id(299) -> 0;
get_limit_dun_id(300) -> 0;
get_limit_dun_id(301) -> 0;
get_limit_dun_id(302) -> 0;
get_limit_dun_id(303) -> 0;
get_limit_dun_id(304) -> 0;
get_limit_dun_id(305) -> 0;
get_limit_dun_id(306) -> 0;
get_limit_dun_id(307) -> 0;
get_limit_dun_id(308) -> 0;
get_limit_dun_id(309) -> 0;
get_limit_dun_id(310) -> 0;
get_limit_dun_id(311) -> 0;
get_limit_dun_id(312) -> 0;
get_limit_dun_id(313) -> 0;
get_limit_dun_id(314) -> 0;
get_limit_dun_id(315) -> 0;
get_limit_dun_id(316) -> 0;
get_limit_dun_id(317) -> 0;
get_limit_dun_id(318) -> 0;
get_limit_dun_id(319) -> 0;
get_limit_dun_id(320) -> 0;
get_limit_dun_id(321) -> 0;
get_limit_dun_id(322) -> 0;
get_limit_dun_id(323) -> 0;
get_limit_dun_id(324) -> 0;
get_limit_dun_id(325) -> 0;
get_limit_dun_id(326) -> 0;
get_limit_dun_id(327) -> 0;
get_limit_dun_id(328) -> 0;
get_limit_dun_id(329) -> 0;
get_limit_dun_id(330) -> 0;
get_limit_dun_id(331) -> 0;
get_limit_dun_id(332) -> 0;
get_limit_dun_id(333) -> 0;
get_limit_dun_id(334) -> 0;
get_limit_dun_id(335) -> 0;
get_limit_dun_id(336) -> 0;
get_limit_dun_id(337) -> 0;
get_limit_dun_id(338) -> 0;
get_limit_dun_id(339) -> 0;
get_limit_dun_id(340) -> 0;
get_limit_dun_id(341) -> 0;
get_limit_dun_id(342) -> 0;
get_limit_dun_id(343) -> 0;
get_limit_dun_id(344) -> 0;
get_limit_dun_id(345) -> 0;
get_limit_dun_id(346) -> 0;
get_limit_dun_id(347) -> 0;
get_limit_dun_id(348) -> 0;
get_limit_dun_id(349) -> 0;
get_limit_dun_id(350) -> 0;
get_limit_dun_id(351) -> 0;
get_limit_dun_id(352) -> 0;
get_limit_dun_id(353) -> 0;
get_limit_dun_id(354) -> 0;
get_limit_dun_id(355) -> 0;
get_limit_dun_id(356) -> 0;
get_limit_dun_id(357) -> 0;
get_limit_dun_id(358) -> 0;
get_limit_dun_id(359) -> 0;
get_limit_dun_id(360) -> 0;
get_limit_dun_id(361) -> 0;
get_limit_dun_id(362) -> 0;
get_limit_dun_id(363) -> 0;
get_limit_dun_id(364) -> 0;
get_limit_dun_id(365) -> 0;
get_limit_dun_id(366) -> 0;
get_limit_dun_id(367) -> 0;
get_limit_dun_id(368) -> 0;
get_limit_dun_id(369) -> 0;
get_limit_dun_id(370) -> 0;
get_limit_dun_id(371) -> 0;
get_limit_dun_id(372) -> 0;
get_limit_dun_id(373) -> 0;
get_limit_dun_id(374) -> 0;
get_limit_dun_id(375) -> 0;
get_limit_dun_id(376) -> 0;
get_limit_dun_id(377) -> 0;
get_limit_dun_id(378) -> 0;
get_limit_dun_id(379) -> 0;
get_limit_dun_id(380) -> 0;
get_limit_dun_id(381) -> 0;
get_limit_dun_id(382) -> 0;
get_limit_dun_id(383) -> 0;
get_limit_dun_id(384) -> 0;
get_limit_dun_id(385) -> 0;
get_limit_dun_id(386) -> 0;
get_limit_dun_id(387) -> 0;
get_limit_dun_id(388) -> 0;
get_limit_dun_id(389) -> 0;
get_limit_dun_id(390) -> 0;
get_limit_dun_id(391) -> 0;
get_limit_dun_id(392) -> 0;
get_limit_dun_id(393) -> 0;
get_limit_dun_id(394) -> 0;
get_limit_dun_id(395) -> 0;
get_limit_dun_id(396) -> 0;
get_limit_dun_id(397) -> 0;
get_limit_dun_id(398) -> 0;
get_limit_dun_id(399) -> 0;
get_limit_dun_id(400) -> 0;
get_limit_dun_id(401) -> 0;
get_limit_dun_id(402) -> 0;
get_limit_dun_id(403) -> 0;
get_limit_dun_id(404) -> 0;
get_limit_dun_id(405) -> 0;
get_limit_dun_id(406) -> 0;
get_limit_dun_id(407) -> 0;
get_limit_dun_id(408) -> 0;
get_limit_dun_id(409) -> 0;
get_limit_dun_id(410) -> 0;
get_limit_dun_id(411) -> 0;
get_limit_dun_id(412) -> 0;
get_limit_dun_id(413) -> 0;
get_limit_dun_id(414) -> 0;
get_limit_dun_id(415) -> 0;
get_limit_dun_id(416) -> 0;
get_limit_dun_id(417) -> 0;
get_limit_dun_id(418) -> 0;
get_limit_dun_id(419) -> 0;
get_limit_dun_id(420) -> 0;
get_limit_dun_id(421) -> 0;
get_limit_dun_id(422) -> 0;
get_limit_dun_id(423) -> 0;
get_limit_dun_id(424) -> 0;
get_limit_dun_id(425) -> 0;
get_limit_dun_id(426) -> 0;
get_limit_dun_id(427) -> 0;
get_limit_dun_id(428) -> 0;
get_limit_dun_id(429) -> 0;
get_limit_dun_id(430) -> 0;
get_limit_dun_id(431) -> 0;
get_limit_dun_id(432) -> 0;
get_limit_dun_id(433) -> 0;
get_limit_dun_id(434) -> 0;
get_limit_dun_id(435) -> 0;
get_limit_dun_id(436) -> 0;
get_limit_dun_id(437) -> 0;
get_limit_dun_id(438) -> 0;
get_limit_dun_id(439) -> 0;
get_limit_dun_id(440) -> 0;
get_limit_dun_id(441) -> 0;
get_limit_dun_id(442) -> 0;
get_limit_dun_id(443) -> 0;
get_limit_dun_id(444) -> 0;
get_limit_dun_id(445) -> 0;
get_limit_dun_id(446) -> 0;
get_limit_dun_id(447) -> 0;
get_limit_dun_id(448) -> 0;
get_limit_dun_id(449) -> 0;
get_limit_dun_id(450) -> 0;
get_limit_dun_id(451) -> 0;
get_limit_dun_id(452) -> 0;
get_limit_dun_id(453) -> 0;
get_limit_dun_id(454) -> 0;
get_limit_dun_id(455) -> 0;
get_limit_dun_id(456) -> 0;
get_limit_dun_id(457) -> 0;
get_limit_dun_id(458) -> 0;
get_limit_dun_id(459) -> 0;
get_limit_dun_id(460) -> 0;
get_limit_dun_id(461) -> 0;
get_limit_dun_id(462) -> 0;
get_limit_dun_id(463) -> 0;
get_limit_dun_id(464) -> 0;
get_limit_dun_id(465) -> 0;
get_limit_dun_id(466) -> 0;
get_limit_dun_id(467) -> 0;
get_limit_dun_id(468) -> 0;
get_limit_dun_id(469) -> 0;
get_limit_dun_id(470) -> 0;
get_limit_dun_id(471) -> 0;
get_limit_dun_id(472) -> 0;
get_limit_dun_id(473) -> 0;
get_limit_dun_id(474) -> 0;
get_limit_dun_id(475) -> 0;
get_limit_dun_id(476) -> 0;
get_limit_dun_id(477) -> 0;
get_limit_dun_id(478) -> 0;
get_limit_dun_id(479) -> 0;
get_limit_dun_id(480) -> 0;
get_limit_dun_id(481) -> 0;
get_limit_dun_id(482) -> 0;
get_limit_dun_id(483) -> 0;
get_limit_dun_id(484) -> 0;
get_limit_dun_id(485) -> 0;
get_limit_dun_id(486) -> 0;
get_limit_dun_id(487) -> 0;
get_limit_dun_id(488) -> 0;
get_limit_dun_id(489) -> 0;
get_limit_dun_id(490) -> 0;
get_limit_dun_id(491) -> 0;
get_limit_dun_id(492) -> 0;
get_limit_dun_id(493) -> 0;
get_limit_dun_id(494) -> 0;
get_limit_dun_id(495) -> 0;
get_limit_dun_id(496) -> 0;
get_limit_dun_id(497) -> 0;
get_limit_dun_id(498) -> 0;
get_limit_dun_id(499) -> 0;
get_limit_dun_id(500) -> 0;
get_limit_dun_id(501) -> 0;
get_limit_dun_id(502) -> 0;
get_limit_dun_id(503) -> 0;
get_limit_dun_id(504) -> 0;
get_limit_dun_id(505) -> 0;
get_limit_dun_id(506) -> 0;
get_limit_dun_id(507) -> 0;
get_limit_dun_id(508) -> 0;
get_limit_dun_id(509) -> 0;
get_limit_dun_id(510) -> 0;
get_limit_dun_id(511) -> 0;
get_limit_dun_id(512) -> 0;
get_limit_dun_id(513) -> 0;
get_limit_dun_id(514) -> 0;
get_limit_dun_id(515) -> 0;
get_limit_dun_id(516) -> 0;
get_limit_dun_id(517) -> 0;
get_limit_dun_id(518) -> 0;
get_limit_dun_id(519) -> 0;
get_limit_dun_id(520) -> 0;
get_limit_dun_id(521) -> 0;
get_limit_dun_id(522) -> 0;
get_limit_dun_id(523) -> 0;
get_limit_dun_id(524) -> 0;
get_limit_dun_id(525) -> 0;
get_limit_dun_id(526) -> 0;
get_limit_dun_id(527) -> 0;
get_limit_dun_id(528) -> 0;
get_limit_dun_id(529) -> 0;
get_limit_dun_id(530) -> 0;
get_limit_dun_id(531) -> 0;
get_limit_dun_id(532) -> 0;
get_limit_dun_id(533) -> 0;
get_limit_dun_id(534) -> 0;
get_limit_dun_id(535) -> 0;
get_limit_dun_id(536) -> 0;
get_limit_dun_id(537) -> 0;
get_limit_dun_id(538) -> 0;
get_limit_dun_id(539) -> 0;
get_limit_dun_id(540) -> 0;
get_limit_dun_id(541) -> 0;
get_limit_dun_id(542) -> 0;
get_limit_dun_id(543) -> 0;
get_limit_dun_id(544) -> 0;
get_limit_dun_id(545) -> 0;
get_limit_dun_id(546) -> 0;
get_limit_dun_id(547) -> 0;
get_limit_dun_id(548) -> 0;
get_limit_dun_id(549) -> 0;
get_limit_dun_id(550) -> 0;
get_limit_dun_id(551) -> 0;
get_limit_dun_id(552) -> 0;
get_limit_dun_id(553) -> 0;
get_limit_dun_id(554) -> 0;
get_limit_dun_id(555) -> 0;
get_limit_dun_id(556) -> 0;
get_limit_dun_id(557) -> 0;
get_limit_dun_id(558) -> 0;
get_limit_dun_id(559) -> 0;
get_limit_dun_id(560) -> 0;
get_limit_dun_id(561) -> 0;
get_limit_dun_id(562) -> 0;
get_limit_dun_id(563) -> 0;
get_limit_dun_id(564) -> 0;
get_limit_dun_id(565) -> 0;
get_limit_dun_id(566) -> 0;
get_limit_dun_id(567) -> 0;
get_limit_dun_id(568) -> 0;
get_limit_dun_id(569) -> 0;
get_limit_dun_id(570) -> 0;
get_limit_dun_id(571) -> 0;
get_limit_dun_id(572) -> 0;
get_limit_dun_id(573) -> 0;
get_limit_dun_id(574) -> 0;
get_limit_dun_id(575) -> 0;
get_limit_dun_id(576) -> 0;
get_limit_dun_id(577) -> 0;
get_limit_dun_id(578) -> 0;
get_limit_dun_id(579) -> 0;
get_limit_dun_id(580) -> 0;
get_limit_dun_id(581) -> 0;
get_limit_dun_id(582) -> 0;
get_limit_dun_id(583) -> 0;
get_limit_dun_id(584) -> 0;
get_limit_dun_id(585) -> 0;
get_limit_dun_id(586) -> 0;
get_limit_dun_id(587) -> 0;
get_limit_dun_id(588) -> 0;
get_limit_dun_id(589) -> 0;
get_limit_dun_id(590) -> 0;
get_limit_dun_id(591) -> 0;
get_limit_dun_id(592) -> 0;
get_limit_dun_id(593) -> 0;
get_limit_dun_id(594) -> 0;
get_limit_dun_id(595) -> 0;
get_limit_dun_id(596) -> 0;
get_limit_dun_id(597) -> 0;
get_limit_dun_id(598) -> 0;
get_limit_dun_id(599) -> 0;
get_limit_dun_id(600) -> 0;
get_limit_dun_id(601) -> 0;
get_limit_dun_id(602) -> 0;
get_limit_dun_id(603) -> 0;
get_limit_dun_id(604) -> 0;
get_limit_dun_id(605) -> 0;
get_limit_dun_id(606) -> 0;
get_limit_dun_id(607) -> 0;
get_limit_dun_id(608) -> 0;
get_limit_dun_id(609) -> 0;
get_limit_dun_id(610) -> 0;
get_limit_dun_id(611) -> 0;
get_limit_dun_id(612) -> 0;
get_limit_dun_id(613) -> 0;
get_limit_dun_id(614) -> 0;
get_limit_dun_id(615) -> 0;
get_limit_dun_id(616) -> 0;
get_limit_dun_id(617) -> 0;
get_limit_dun_id(618) -> 0;
get_limit_dun_id(619) -> 0;
get_limit_dun_id(620) -> 0;
get_limit_dun_id(621) -> 0;
get_limit_dun_id(622) -> 0;
get_limit_dun_id(623) -> 0;
get_limit_dun_id(624) -> 0;
get_limit_dun_id(625) -> 0;
get_limit_dun_id(626) -> 0;
get_limit_dun_id(627) -> 0;
get_limit_dun_id(628) -> 0;
get_limit_dun_id(629) -> 0;
get_limit_dun_id(630) -> 0;
get_limit_dun_id(631) -> 0;
get_limit_dun_id(632) -> 0;
get_limit_dun_id(633) -> 0;
get_limit_dun_id(634) -> 0;
get_limit_dun_id(635) -> 0;
get_limit_dun_id(636) -> 0;
get_limit_dun_id(637) -> 0;
get_limit_dun_id(638) -> 0;
get_limit_dun_id(639) -> 0;
get_limit_dun_id(640) -> 0;
get_limit_dun_id(641) -> 0;
get_limit_dun_id(642) -> 0;
get_limit_dun_id(643) -> 0;
get_limit_dun_id(644) -> 0;
get_limit_dun_id(645) -> 0;
get_limit_dun_id(646) -> 0;
get_limit_dun_id(647) -> 0;
get_limit_dun_id(648) -> 0;
get_limit_dun_id(649) -> 0;
get_limit_dun_id(650) -> 0;
get_limit_dun_id(651) -> 0;
get_limit_dun_id(652) -> 0;
get_limit_dun_id(653) -> 0;
get_limit_dun_id(654) -> 0;
get_limit_dun_id(655) -> 0;
get_limit_dun_id(656) -> 0;
get_limit_dun_id(657) -> 0;
get_limit_dun_id(658) -> 0;
get_limit_dun_id(659) -> 0;
get_limit_dun_id(660) -> 0;
get_limit_dun_id(661) -> 0;
get_limit_dun_id(662) -> 0;
get_limit_dun_id(663) -> 0;
get_limit_dun_id(664) -> 0;
get_limit_dun_id(665) -> 0;
get_limit_dun_id(666) -> 0;
get_limit_dun_id(667) -> 0;
get_limit_dun_id(668) -> 0;
get_limit_dun_id(669) -> 0;
get_limit_dun_id(670) -> 0;
get_limit_dun_id(671) -> 0;
get_limit_dun_id(672) -> 0;
get_limit_dun_id(673) -> 0;
get_limit_dun_id(674) -> 0;
get_limit_dun_id(675) -> 0;
get_limit_dun_id(676) -> 0;
get_limit_dun_id(677) -> 0;
get_limit_dun_id(678) -> 0;
get_limit_dun_id(679) -> 0;
get_limit_dun_id(680) -> 0;
get_limit_dun_id(681) -> 0;
get_limit_dun_id(682) -> 0;
get_limit_dun_id(683) -> 0;
get_limit_dun_id(684) -> 0;
get_limit_dun_id(685) -> 0;
get_limit_dun_id(686) -> 0;
get_limit_dun_id(687) -> 0;
get_limit_dun_id(688) -> 0;
get_limit_dun_id(689) -> 0;
get_limit_dun_id(690) -> 0;
get_limit_dun_id(691) -> 0;
get_limit_dun_id(692) -> 0;
get_limit_dun_id(693) -> 0;
get_limit_dun_id(694) -> 0;
get_limit_dun_id(695) -> 0;
get_limit_dun_id(696) -> 0;
get_limit_dun_id(697) -> 0;
get_limit_dun_id(698) -> 0;
get_limit_dun_id(699) -> 0;
get_limit_dun_id(700) -> 0;
get_limit_dun_id(701) -> 0;
get_limit_dun_id(702) -> 0;
get_limit_dun_id(703) -> 0;
get_limit_dun_id(704) -> 0;
get_limit_dun_id(705) -> 0;
get_limit_dun_id(706) -> 0;
get_limit_dun_id(707) -> 0;
get_limit_dun_id(708) -> 0;
get_limit_dun_id(709) -> 0;
get_limit_dun_id(710) -> 0;
get_limit_dun_id(711) -> 0;
get_limit_dun_id(712) -> 0;
get_limit_dun_id(713) -> 0;
get_limit_dun_id(714) -> 0;
get_limit_dun_id(715) -> 0;
get_limit_dun_id(716) -> 0;
get_limit_dun_id(717) -> 0;
get_limit_dun_id(718) -> 0;
get_limit_dun_id(719) -> 0;
get_limit_dun_id(720) -> 0;
get_limit_dun_id(721) -> 0;
get_limit_dun_id(722) -> 0;
get_limit_dun_id(723) -> 0;
get_limit_dun_id(724) -> 0;
get_limit_dun_id(725) -> 0;
get_limit_dun_id(726) -> 0;
get_limit_dun_id(727) -> 0;
get_limit_dun_id(728) -> 0;
get_limit_dun_id(729) -> 0;
get_limit_dun_id(730) -> 0;
get_limit_dun_id(731) -> 0;
get_limit_dun_id(732) -> 0;
get_limit_dun_id(733) -> 0;
get_limit_dun_id(734) -> 0;
get_limit_dun_id(735) -> 0;
get_limit_dun_id(736) -> 0;
get_limit_dun_id(737) -> 0;
get_limit_dun_id(738) -> 0;
get_limit_dun_id(739) -> 0;
get_limit_dun_id(740) -> 0;
get_limit_dun_id(741) -> 0;
get_limit_dun_id(742) -> 0;
get_limit_dun_id(743) -> 0;
get_limit_dun_id(744) -> 0;
get_limit_dun_id(745) -> 0;
get_limit_dun_id(746) -> 0;
get_limit_dun_id(747) -> 0;
get_limit_dun_id(748) -> 0;
get_limit_dun_id(749) -> 0;
get_limit_dun_id(750) -> 0;
get_limit_dun_id(751) -> 0;
get_limit_dun_id(752) -> 0;
get_limit_dun_id(753) -> 0;
get_limit_dun_id(754) -> 0;
get_limit_dun_id(755) -> 0;
get_limit_dun_id(756) -> 0;
get_limit_dun_id(757) -> 0;
get_limit_dun_id(758) -> 0;
get_limit_dun_id(759) -> 0;
get_limit_dun_id(760) -> 0;
get_limit_dun_id(761) -> 0;
get_limit_dun_id(762) -> 0;
get_limit_dun_id(763) -> 0;
get_limit_dun_id(764) -> 0;
get_limit_dun_id(765) -> 0;
get_limit_dun_id(766) -> 0;
get_limit_dun_id(767) -> 0;
get_limit_dun_id(768) -> 0;
get_limit_dun_id(769) -> 0;
get_limit_dun_id(770) -> 0;
get_limit_dun_id(771) -> 0;
get_limit_dun_id(772) -> 0;
get_limit_dun_id(773) -> 0;
get_limit_dun_id(774) -> 0;
get_limit_dun_id(775) -> 0;
get_limit_dun_id(776) -> 0;
get_limit_dun_id(777) -> 0;
get_limit_dun_id(778) -> 0;
get_limit_dun_id(779) -> 0;
get_limit_dun_id(780) -> 0;
get_limit_dun_id(781) -> 0;
get_limit_dun_id(782) -> 0;
get_limit_dun_id(783) -> 0;
get_limit_dun_id(784) -> 0;
get_limit_dun_id(785) -> 0;
get_limit_dun_id(786) -> 0;
get_limit_dun_id(787) -> 0;
get_limit_dun_id(788) -> 0;
get_limit_dun_id(789) -> 0;
get_limit_dun_id(790) -> 0;
get_limit_dun_id(791) -> 0;
get_limit_dun_id(792) -> 0;
get_limit_dun_id(793) -> 0;
get_limit_dun_id(794) -> 0;
get_limit_dun_id(795) -> 0;
get_limit_dun_id(796) -> 0;
get_limit_dun_id(797) -> 0;
get_limit_dun_id(798) -> 0;
get_limit_dun_id(799) -> 0;
get_limit_dun_id(800) -> 0;
get_limit_dun_id(801) -> 0;
get_limit_dun_id(802) -> 0;
get_limit_dun_id(803) -> 0;
get_limit_dun_id(804) -> 0;
get_limit_dun_id(805) -> 0;
get_limit_dun_id(806) -> 0;
get_limit_dun_id(807) -> 0;
get_limit_dun_id(808) -> 0;
get_limit_dun_id(809) -> 0;
get_limit_dun_id(810) -> 0;
get_limit_dun_id(811) -> 0;
get_limit_dun_id(812) -> 0;
get_limit_dun_id(813) -> 0;
get_limit_dun_id(814) -> 0;
get_limit_dun_id(815) -> 0;
get_limit_dun_id(816) -> 0;
get_limit_dun_id(817) -> 0;
get_limit_dun_id(818) -> 0;
get_limit_dun_id(819) -> 0;
get_limit_dun_id(820) -> 0;
get_limit_dun_id(821) -> 0;
get_limit_dun_id(822) -> 0;
get_limit_dun_id(823) -> 0;
get_limit_dun_id(824) -> 0;
get_limit_dun_id(825) -> 0;
get_limit_dun_id(826) -> 0;
get_limit_dun_id(827) -> 0;
get_limit_dun_id(828) -> 0;
get_limit_dun_id(829) -> 0;
get_limit_dun_id(830) -> 0;
get_limit_dun_id(831) -> 0;
get_limit_dun_id(832) -> 0;
get_limit_dun_id(833) -> 0;
get_limit_dun_id(834) -> 0;
get_limit_dun_id(835) -> 0;
get_limit_dun_id(836) -> 0;
get_limit_dun_id(837) -> 0;
get_limit_dun_id(838) -> 0;
get_limit_dun_id(839) -> 0;
get_limit_dun_id(840) -> 0;
get_limit_dun_id(841) -> 0;
get_limit_dun_id(842) -> 0;
get_limit_dun_id(843) -> 0;
get_limit_dun_id(844) -> 0;
get_limit_dun_id(845) -> 0;
get_limit_dun_id(846) -> 0;
get_limit_dun_id(847) -> 0;
get_limit_dun_id(848) -> 0;
get_limit_dun_id(849) -> 0;
get_limit_dun_id(850) -> 0;
get_limit_dun_id(851) -> 0;
get_limit_dun_id(852) -> 0;
get_limit_dun_id(853) -> 0;
get_limit_dun_id(854) -> 0;
get_limit_dun_id(855) -> 0;
get_limit_dun_id(856) -> 0;
get_limit_dun_id(857) -> 0;
get_limit_dun_id(858) -> 0;
get_limit_dun_id(859) -> 0;
get_limit_dun_id(860) -> 0;
get_limit_dun_id(861) -> 0;
get_limit_dun_id(862) -> 0;
get_limit_dun_id(863) -> 0;
get_limit_dun_id(864) -> 0;
get_limit_dun_id(865) -> 0;
get_limit_dun_id(866) -> 0;
get_limit_dun_id(867) -> 0;
get_limit_dun_id(868) -> 0;
get_limit_dun_id(869) -> 0;
get_limit_dun_id(870) -> 0;
get_limit_dun_id(871) -> 0;
get_limit_dun_id(872) -> 0;
get_limit_dun_id(873) -> 0;
get_limit_dun_id(874) -> 0;
get_limit_dun_id(875) -> 0;
get_limit_dun_id(876) -> 0;
get_limit_dun_id(877) -> 0;
get_limit_dun_id(878) -> 0;
get_limit_dun_id(879) -> 0;
get_limit_dun_id(880) -> 0;
get_limit_dun_id(881) -> 0;
get_limit_dun_id(882) -> 0;
get_limit_dun_id(883) -> 0;
get_limit_dun_id(884) -> 0;
get_limit_dun_id(885) -> 0;
get_limit_dun_id(886) -> 0;
get_limit_dun_id(887) -> 0;
get_limit_dun_id(888) -> 0;
get_limit_dun_id(889) -> 0;
get_limit_dun_id(890) -> 0;
get_limit_dun_id(891) -> 0;
get_limit_dun_id(892) -> 0;
get_limit_dun_id(893) -> 0;
get_limit_dun_id(894) -> 0;
get_limit_dun_id(895) -> 0;
get_limit_dun_id(896) -> 0;
get_limit_dun_id(897) -> 0;
get_limit_dun_id(898) -> 0;
get_limit_dun_id(899) -> 0;
get_limit_dun_id(900) -> 0;
get_limit_dun_id(901) -> 0;
get_limit_dun_id(902) -> 0;
get_limit_dun_id(903) -> 0;
get_limit_dun_id(904) -> 0;
get_limit_dun_id(905) -> 0;
get_limit_dun_id(906) -> 0;
get_limit_dun_id(907) -> 0;
get_limit_dun_id(908) -> 0;
get_limit_dun_id(909) -> 0;
get_limit_dun_id(910) -> 0;
get_limit_dun_id(911) -> 0;
get_limit_dun_id(912) -> 0;
get_limit_dun_id(913) -> 0;
get_limit_dun_id(914) -> 0;
get_limit_dun_id(915) -> 0;
get_limit_dun_id(916) -> 0;
get_limit_dun_id(917) -> 0;
get_limit_dun_id(918) -> 0;
get_limit_dun_id(919) -> 0;
get_limit_dun_id(920) -> 0;
get_limit_dun_id(921) -> 0;
get_limit_dun_id(922) -> 0;
get_limit_dun_id(923) -> 0;
get_limit_dun_id(924) -> 0;
get_limit_dun_id(925) -> 0;
get_limit_dun_id(926) -> 0;
get_limit_dun_id(927) -> 0;
get_limit_dun_id(928) -> 0;
get_limit_dun_id(929) -> 0;
get_limit_dun_id(930) -> 0;
get_limit_dun_id(931) -> 0;
get_limit_dun_id(932) -> 0;
get_limit_dun_id(933) -> 0;
get_limit_dun_id(934) -> 0;
get_limit_dun_id(935) -> 0;
get_limit_dun_id(936) -> 0;
get_limit_dun_id(937) -> 0;
get_limit_dun_id(938) -> 0;
get_limit_dun_id(939) -> 0;
get_limit_dun_id(940) -> 0;
get_limit_dun_id(941) -> 0;
get_limit_dun_id(942) -> 0;
get_limit_dun_id(943) -> 0;
get_limit_dun_id(944) -> 0;
get_limit_dun_id(945) -> 0;
get_limit_dun_id(946) -> 0;
get_limit_dun_id(947) -> 0;
get_limit_dun_id(948) -> 0;
get_limit_dun_id(949) -> 0;
get_limit_dun_id(950) -> 0;
get_limit_dun_id(951) -> 0;
get_limit_dun_id(952) -> 0;
get_limit_dun_id(953) -> 0;
get_limit_dun_id(954) -> 0;
get_limit_dun_id(955) -> 0;
get_limit_dun_id(956) -> 0;
get_limit_dun_id(957) -> 0;
get_limit_dun_id(958) -> 0;
get_limit_dun_id(959) -> 0;
get_limit_dun_id(960) -> 0;
get_limit_dun_id(961) -> 0;
get_limit_dun_id(962) -> 0;
get_limit_dun_id(963) -> 0;
get_limit_dun_id(964) -> 0;
get_limit_dun_id(965) -> 0;
get_limit_dun_id(966) -> 0;
get_limit_dun_id(967) -> 0;
get_limit_dun_id(968) -> 0;
get_limit_dun_id(969) -> 0;
get_limit_dun_id(970) -> 0;
get_limit_dun_id(971) -> 0;
get_limit_dun_id(972) -> 0;
get_limit_dun_id(973) -> 0;
get_limit_dun_id(974) -> 0;
get_limit_dun_id(975) -> 0;
get_limit_dun_id(976) -> 0;
get_limit_dun_id(977) -> 0;
get_limit_dun_id(978) -> 0;
get_limit_dun_id(979) -> 0;
get_limit_dun_id(980) -> 0;
get_limit_dun_id(981) -> 0;
get_limit_dun_id(982) -> 0;
get_limit_dun_id(983) -> 0;
get_limit_dun_id(984) -> 0;
get_limit_dun_id(985) -> 0;
get_limit_dun_id(986) -> 0;
get_limit_dun_id(987) -> 0;
get_limit_dun_id(988) -> 0;
get_limit_dun_id(989) -> 0;
get_limit_dun_id(990) -> 0;
get_limit_dun_id(991) -> 0;
get_limit_dun_id(992) -> 0;
get_limit_dun_id(993) -> 0;
get_limit_dun_id(994) -> 0;
get_limit_dun_id(995) -> 0;
get_limit_dun_id(996) -> 0;
get_limit_dun_id(997) -> 0;
get_limit_dun_id(998) -> 0;
get_limit_dun_id(999) -> 0;
get_limit_dun_id(1000) -> 0;
get_limit_dun_id(_) -> 0.

get_buy_count(0) -> 3;
get_buy_count(1) -> 3;
get_buy_count(2) -> 3;
get_buy_count(3) -> 3;
get_buy_count(4) -> 3;
get_buy_count(5) -> 3;
get_buy_count(6) -> 3;
get_buy_count(7) -> 3;
get_buy_count(8) -> 3;
get_buy_count(9) -> 3;
get_buy_count(10) -> 3;
get_buy_count(11) -> 3;
get_buy_count(12) -> 3;
get_buy_count(13) -> 3;
get_buy_count(14) -> 3;
get_buy_count(15) -> 3;
get_buy_count(16) -> 3;
get_buy_count(17) -> 3;
get_buy_count(18) -> 3;
get_buy_count(19) -> 3;
get_buy_count(20) -> 3;
get_buy_count(21) -> 3;
get_buy_count(22) -> 3;
get_buy_count(23) -> 3;
get_buy_count(24) -> 3;
get_buy_count(25) -> 3;
get_buy_count(26) -> 3;
get_buy_count(27) -> 3;
get_buy_count(28) -> 3;
get_buy_count(29) -> 3;
get_buy_count(30) -> 3;
get_buy_count(31) -> 3;
get_buy_count(32) -> 3;
get_buy_count(33) -> 3;
get_buy_count(34) -> 3;
get_buy_count(35) -> 3;
get_buy_count(36) -> 3;
get_buy_count(37) -> 3;
get_buy_count(38) -> 3;
get_buy_count(39) -> 3;
get_buy_count(40) -> 3;
get_buy_count(41) -> 3;
get_buy_count(42) -> 3;
get_buy_count(43) -> 3;
get_buy_count(44) -> 3;
get_buy_count(45) -> 3;
get_buy_count(46) -> 3;
get_buy_count(47) -> 3;
get_buy_count(48) -> 3;
get_buy_count(49) -> 3;
get_buy_count(50) -> 3;
get_buy_count(51) -> 3;
get_buy_count(52) -> 3;
get_buy_count(53) -> 3;
get_buy_count(54) -> 3;
get_buy_count(55) -> 3;
get_buy_count(56) -> 3;
get_buy_count(57) -> 3;
get_buy_count(58) -> 3;
get_buy_count(59) -> 3;
get_buy_count(60) -> 3;
get_buy_count(61) -> 3;
get_buy_count(62) -> 3;
get_buy_count(63) -> 3;
get_buy_count(64) -> 3;
get_buy_count(65) -> 3;
get_buy_count(66) -> 3;
get_buy_count(67) -> 3;
get_buy_count(68) -> 3;
get_buy_count(69) -> 3;
get_buy_count(70) -> 3;
get_buy_count(71) -> 3;
get_buy_count(72) -> 3;
get_buy_count(73) -> 3;
get_buy_count(74) -> 3;
get_buy_count(75) -> 3;
get_buy_count(76) -> 3;
get_buy_count(77) -> 3;
get_buy_count(78) -> 3;
get_buy_count(79) -> 3;
get_buy_count(80) -> 3;
get_buy_count(81) -> 3;
get_buy_count(82) -> 3;
get_buy_count(83) -> 3;
get_buy_count(84) -> 3;
get_buy_count(85) -> 3;
get_buy_count(86) -> 3;
get_buy_count(87) -> 3;
get_buy_count(88) -> 3;
get_buy_count(89) -> 3;
get_buy_count(90) -> 3;
get_buy_count(91) -> 3;
get_buy_count(92) -> 3;
get_buy_count(93) -> 3;
get_buy_count(94) -> 3;
get_buy_count(95) -> 3;
get_buy_count(96) -> 3;
get_buy_count(97) -> 3;
get_buy_count(98) -> 3;
get_buy_count(99) -> 3;
get_buy_count(100) -> 3;
get_buy_count(101) -> 3;
get_buy_count(102) -> 3;
get_buy_count(103) -> 3;
get_buy_count(104) -> 3;
get_buy_count(105) -> 3;
get_buy_count(106) -> 3;
get_buy_count(107) -> 3;
get_buy_count(108) -> 3;
get_buy_count(109) -> 3;
get_buy_count(110) -> 3;
get_buy_count(111) -> 3;
get_buy_count(112) -> 3;
get_buy_count(113) -> 3;
get_buy_count(114) -> 3;
get_buy_count(115) -> 3;
get_buy_count(116) -> 3;
get_buy_count(117) -> 3;
get_buy_count(118) -> 3;
get_buy_count(119) -> 3;
get_buy_count(120) -> 3;
get_buy_count(121) -> 3;
get_buy_count(122) -> 3;
get_buy_count(123) -> 3;
get_buy_count(124) -> 3;
get_buy_count(125) -> 3;
get_buy_count(126) -> 3;
get_buy_count(127) -> 3;
get_buy_count(128) -> 3;
get_buy_count(129) -> 3;
get_buy_count(130) -> 3;
get_buy_count(131) -> 3;
get_buy_count(132) -> 3;
get_buy_count(133) -> 3;
get_buy_count(134) -> 3;
get_buy_count(135) -> 3;
get_buy_count(136) -> 3;
get_buy_count(137) -> 3;
get_buy_count(138) -> 3;
get_buy_count(139) -> 3;
get_buy_count(140) -> 3;
get_buy_count(141) -> 3;
get_buy_count(142) -> 3;
get_buy_count(143) -> 3;
get_buy_count(144) -> 3;
get_buy_count(145) -> 3;
get_buy_count(146) -> 3;
get_buy_count(147) -> 3;
get_buy_count(148) -> 3;
get_buy_count(149) -> 3;
get_buy_count(150) -> 3;
get_buy_count(151) -> 3;
get_buy_count(152) -> 3;
get_buy_count(153) -> 3;
get_buy_count(154) -> 3;
get_buy_count(155) -> 3;
get_buy_count(156) -> 3;
get_buy_count(157) -> 3;
get_buy_count(158) -> 3;
get_buy_count(159) -> 3;
get_buy_count(160) -> 3;
get_buy_count(161) -> 3;
get_buy_count(162) -> 3;
get_buy_count(163) -> 3;
get_buy_count(164) -> 3;
get_buy_count(165) -> 3;
get_buy_count(166) -> 3;
get_buy_count(167) -> 3;
get_buy_count(168) -> 3;
get_buy_count(169) -> 3;
get_buy_count(170) -> 3;
get_buy_count(171) -> 3;
get_buy_count(172) -> 3;
get_buy_count(173) -> 3;
get_buy_count(174) -> 3;
get_buy_count(175) -> 3;
get_buy_count(176) -> 3;
get_buy_count(177) -> 3;
get_buy_count(178) -> 3;
get_buy_count(179) -> 3;
get_buy_count(180) -> 3;
get_buy_count(181) -> 3;
get_buy_count(182) -> 3;
get_buy_count(183) -> 3;
get_buy_count(184) -> 3;
get_buy_count(185) -> 3;
get_buy_count(186) -> 3;
get_buy_count(187) -> 3;
get_buy_count(188) -> 3;
get_buy_count(189) -> 3;
get_buy_count(190) -> 3;
get_buy_count(191) -> 3;
get_buy_count(192) -> 3;
get_buy_count(193) -> 3;
get_buy_count(194) -> 3;
get_buy_count(195) -> 3;
get_buy_count(196) -> 3;
get_buy_count(197) -> 3;
get_buy_count(198) -> 3;
get_buy_count(199) -> 3;
get_buy_count(200) -> 3;
get_buy_count(_) -> 0.

get_buy_count_expend(1) -> [{15, 20}];
get_buy_count_expend(2) -> [{15, 30}];
get_buy_count_expend(3) -> [{15, 40}];
get_buy_count_expend(_Info) ->
    logger:data_error("get_buy_count_expend_data_not_exist===>~w",
		      [_Info], star_tower_data, 3683),
    undefined.

max_tower() -> 900.

get_all_first_award() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
     17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
     31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44,
     45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
     59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72,
     73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86,
     87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
     100].

get_first_award(1) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29304, 30}, {1, 10000}];
get_first_award(2) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {10001, 50}, {1, 15000}];
get_first_award(3) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(4) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {10403, 1}, {10001, 100}];
get_first_award(5) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40105, 1}, {40305, 1}];
get_first_award(6) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(7) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40405, 1}, {40205, 1}];
get_first_award(8) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40106, 1}, {40306, 1}];
get_first_award(9) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(10) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {40406, 1}, {40206, 1}];
get_first_award(11) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40107, 1}, {40307, 1}];
get_first_award(12) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(13) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40407, 1}, {40207, 1}];
get_first_award(14) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40107, 1}, {40307, 1}];
get_first_award(15) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(16) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40408, 1}, {40208, 1}];
get_first_award(17) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40108, 1}, {40308, 1}];
get_first_award(18) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(19) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40408, 1}, {40208, 1}];
get_first_award(20) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {40108, 1}, {40308, 1}];
get_first_award(21) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(22) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40409, 1}, {40209, 1}];
get_first_award(23) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40109, 1}, {40309, 1}];
get_first_award(24) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(25) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40409, 1}, {40209, 1}, {10453, 1}];
get_first_award(26) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40109, 1}, {40309, 1}];
get_first_award(27) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(28) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40410, 1}, {40210, 1}];
get_first_award(29) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40110, 1}, {40310, 1}];
get_first_award(30) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {29905, 50}];
get_first_award(31) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40410, 1}, {40210, 1}, {10453, 1}];
get_first_award(32) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40110, 1}, {40310, 1}];
get_first_award(33) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(34) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40411, 1}, {40211, 1}];
get_first_award(35) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40111, 1}, {40311, 1}];
get_first_award(36) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(37) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40411, 1}, {40211, 1}];
get_first_award(38) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40111, 1}, {40311, 1}];
get_first_award(39) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(40) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {40412, 1}, {40212, 1}];
get_first_award(41) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(42) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(43) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(44) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(45) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(46) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(47) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(48) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(49) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(50) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {40112, 1}, {40312, 1}];
get_first_award(51) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(52) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(53) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(54) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(55) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(56) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(57) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(58) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(59) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(60) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {29905, 50}];
get_first_award(61) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(62) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(63) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(64) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(65) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(66) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(67) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(68) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(69) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(70) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {40412, 1}, {40212, 1}];
get_first_award(71) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(72) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(73) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(74) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(75) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(76) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(77) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(78) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(79) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(80) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {40112, 1}, {40312, 1}];
get_first_award(81) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(82) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(83) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(84) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(85) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(86) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(87) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(88) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(89) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(90) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {29905, 50}];
get_first_award(91) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(92) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(93) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(94) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(95) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(96) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(97) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {29905, 50}];
get_first_award(98) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40412, 1}, {40212, 1}];
get_first_award(99) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 500000}, {40112, 1}, {40312, 1}];
get_first_award(100) ->
    [{39052, 500}, {39053, 500}, {10090, 10}, {10091, 5},
     {3, 10000000}, {29905, 50}];
get_first_award(_Info) ->
    logger:data_error("get_first_award_data_not_exist===>~w",
		      [_Info], star_tower_data, 3779),
    undefined.

get_first_award_tower(1) -> 10;
get_first_award_tower(2) -> 20;
get_first_award_tower(3) -> 30;
get_first_award_tower(4) -> 40;
get_first_award_tower(5) -> 50;
get_first_award_tower(6) -> 60;
get_first_award_tower(7) -> 70;
get_first_award_tower(8) -> 80;
get_first_award_tower(9) -> 90;
get_first_award_tower(10) -> 100;
get_first_award_tower(11) -> 110;
get_first_award_tower(12) -> 120;
get_first_award_tower(13) -> 130;
get_first_award_tower(14) -> 140;
get_first_award_tower(15) -> 150;
get_first_award_tower(16) -> 160;
get_first_award_tower(17) -> 170;
get_first_award_tower(18) -> 180;
get_first_award_tower(19) -> 190;
get_first_award_tower(20) -> 200;
get_first_award_tower(21) -> 210;
get_first_award_tower(22) -> 220;
get_first_award_tower(23) -> 230;
get_first_award_tower(24) -> 240;
get_first_award_tower(25) -> 250;
get_first_award_tower(26) -> 260;
get_first_award_tower(27) -> 270;
get_first_award_tower(28) -> 280;
get_first_award_tower(29) -> 290;
get_first_award_tower(30) -> 300;
get_first_award_tower(31) -> 310;
get_first_award_tower(32) -> 320;
get_first_award_tower(33) -> 330;
get_first_award_tower(34) -> 340;
get_first_award_tower(35) -> 350;
get_first_award_tower(36) -> 360;
get_first_award_tower(37) -> 370;
get_first_award_tower(38) -> 380;
get_first_award_tower(39) -> 390;
get_first_award_tower(40) -> 400;
get_first_award_tower(41) -> 410;
get_first_award_tower(42) -> 420;
get_first_award_tower(43) -> 430;
get_first_award_tower(44) -> 440;
get_first_award_tower(45) -> 450;
get_first_award_tower(46) -> 460;
get_first_award_tower(47) -> 470;
get_first_award_tower(48) -> 480;
get_first_award_tower(49) -> 490;
get_first_award_tower(50) -> 500;
get_first_award_tower(51) -> 510;
get_first_award_tower(52) -> 520;
get_first_award_tower(53) -> 530;
get_first_award_tower(54) -> 540;
get_first_award_tower(55) -> 550;
get_first_award_tower(56) -> 560;
get_first_award_tower(57) -> 570;
get_first_award_tower(58) -> 580;
get_first_award_tower(59) -> 590;
get_first_award_tower(60) -> 600;
get_first_award_tower(61) -> 610;
get_first_award_tower(62) -> 620;
get_first_award_tower(63) -> 630;
get_first_award_tower(64) -> 640;
get_first_award_tower(65) -> 650;
get_first_award_tower(66) -> 660;
get_first_award_tower(67) -> 670;
get_first_award_tower(68) -> 680;
get_first_award_tower(69) -> 690;
get_first_award_tower(70) -> 700;
get_first_award_tower(71) -> 710;
get_first_award_tower(72) -> 720;
get_first_award_tower(73) -> 730;
get_first_award_tower(74) -> 740;
get_first_award_tower(75) -> 750;
get_first_award_tower(76) -> 760;
get_first_award_tower(77) -> 770;
get_first_award_tower(78) -> 780;
get_first_award_tower(79) -> 790;
get_first_award_tower(80) -> 800;
get_first_award_tower(81) -> 810;
get_first_award_tower(82) -> 820;
get_first_award_tower(83) -> 830;
get_first_award_tower(84) -> 840;
get_first_award_tower(85) -> 850;
get_first_award_tower(86) -> 860;
get_first_award_tower(87) -> 870;
get_first_award_tower(88) -> 880;
get_first_award_tower(89) -> 890;
get_first_award_tower(90) -> 900;
get_first_award_tower(91) -> 910;
get_first_award_tower(92) -> 920;
get_first_award_tower(93) -> 930;
get_first_award_tower(94) -> 940;
get_first_award_tower(95) -> 950;
get_first_award_tower(96) -> 960;
get_first_award_tower(97) -> 970;
get_first_award_tower(98) -> 980;
get_first_award_tower(99) -> 990;
get_first_award_tower(100) -> 1000;
get_first_award_tower(_Info) ->
    logger:data_error("get_first_award_tower_data_not_exist===>~w",
		      [_Info], star_tower_data, 3871),
    undefined.

get_first_award_id(10) -> 1;
get_first_award_id(20) -> 2;
get_first_award_id(30) -> 3;
get_first_award_id(40) -> 4;
get_first_award_id(50) -> 5;
get_first_award_id(60) -> 6;
get_first_award_id(70) -> 7;
get_first_award_id(80) -> 8;
get_first_award_id(90) -> 9;
get_first_award_id(100) -> 10;
get_first_award_id(110) -> 11;
get_first_award_id(120) -> 12;
get_first_award_id(130) -> 13;
get_first_award_id(140) -> 14;
get_first_award_id(150) -> 15;
get_first_award_id(160) -> 16;
get_first_award_id(170) -> 17;
get_first_award_id(180) -> 18;
get_first_award_id(190) -> 19;
get_first_award_id(200) -> 20;
get_first_award_id(210) -> 21;
get_first_award_id(220) -> 22;
get_first_award_id(230) -> 23;
get_first_award_id(240) -> 24;
get_first_award_id(250) -> 25;
get_first_award_id(260) -> 26;
get_first_award_id(270) -> 27;
get_first_award_id(280) -> 28;
get_first_award_id(290) -> 29;
get_first_award_id(300) -> 30;
get_first_award_id(310) -> 31;
get_first_award_id(320) -> 32;
get_first_award_id(330) -> 33;
get_first_award_id(340) -> 34;
get_first_award_id(350) -> 35;
get_first_award_id(360) -> 36;
get_first_award_id(370) -> 37;
get_first_award_id(380) -> 38;
get_first_award_id(390) -> 39;
get_first_award_id(400) -> 40;
get_first_award_id(410) -> 41;
get_first_award_id(420) -> 42;
get_first_award_id(430) -> 43;
get_first_award_id(440) -> 44;
get_first_award_id(450) -> 45;
get_first_award_id(460) -> 46;
get_first_award_id(470) -> 47;
get_first_award_id(480) -> 48;
get_first_award_id(490) -> 49;
get_first_award_id(500) -> 50;
get_first_award_id(510) -> 51;
get_first_award_id(520) -> 52;
get_first_award_id(530) -> 53;
get_first_award_id(540) -> 54;
get_first_award_id(550) -> 55;
get_first_award_id(560) -> 56;
get_first_award_id(570) -> 57;
get_first_award_id(580) -> 58;
get_first_award_id(590) -> 59;
get_first_award_id(600) -> 60;
get_first_award_id(610) -> 61;
get_first_award_id(620) -> 62;
get_first_award_id(630) -> 63;
get_first_award_id(640) -> 64;
get_first_award_id(650) -> 65;
get_first_award_id(660) -> 66;
get_first_award_id(670) -> 67;
get_first_award_id(680) -> 68;
get_first_award_id(690) -> 69;
get_first_award_id(700) -> 70;
get_first_award_id(710) -> 71;
get_first_award_id(720) -> 72;
get_first_award_id(730) -> 73;
get_first_award_id(740) -> 74;
get_first_award_id(750) -> 75;
get_first_award_id(760) -> 76;
get_first_award_id(770) -> 77;
get_first_award_id(780) -> 78;
get_first_award_id(790) -> 79;
get_first_award_id(800) -> 80;
get_first_award_id(810) -> 81;
get_first_award_id(820) -> 82;
get_first_award_id(830) -> 83;
get_first_award_id(840) -> 84;
get_first_award_id(850) -> 85;
get_first_award_id(860) -> 86;
get_first_award_id(870) -> 87;
get_first_award_id(880) -> 88;
get_first_award_id(890) -> 89;
get_first_award_id(900) -> 90;
get_first_award_id(910) -> 91;
get_first_award_id(920) -> 92;
get_first_award_id(930) -> 93;
get_first_award_id(940) -> 94;
get_first_award_id(950) -> 95;
get_first_award_id(960) -> 96;
get_first_award_id(970) -> 97;
get_first_award_id(980) -> 98;
get_first_award_id(990) -> 99;
get_first_award_id(1000) -> 100;
get_first_award_id(_Info) ->
    logger:data_error("get_first_award_id_data_not_exist===>~w",
		      [_Info], star_tower_data, 3963),
    undefined.

get_first_notice(3) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第30层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(6) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第60层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(9) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第90层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(12) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第120层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(15) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第150层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(18) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第180层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(21) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第210层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(24) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第240层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(27) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第270层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(30) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第300层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(33) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第330层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(36) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第360层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(39) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第390层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(42) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第420层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(45) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第450层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(48) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第480层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(51) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第510层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(54) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第540层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(57) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第570层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(60) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第600层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(63) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第630层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(66) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第660层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(69) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第690层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(72) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第720层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(75) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第750层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(78) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第780层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(81) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第810层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(84) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第840层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(87) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第870层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(90) ->
    lang:get(<<"冒险者<div fontcolor=#186fb3>~ts</div>大显神威，成功通关<"
	       "div fontcolor=#c26706>试练塔第900层</div>，获得<div "
	       "fontcolor=#c26706>强力5星英雄</div>！"/utf8>>);
get_first_notice(_) -> <<>>.

reward_role({16000, <<"release2_2">>}) -> 1;
reward_role({10, <<"symix_901">>}) -> 1;
reward_role({100, <<"symix_1122">>}) -> 1;
reward_role({1002, <<"symix_431">>}) -> 1;
reward_role({1005, <<"symix2_1158">>}) -> 1;
reward_role({1006, <<"9377_1377">>}) -> 1;
reward_role({1007, <<"symix_1132">>}) -> 1;
reward_role({101, <<"symix_1246">>}) -> 1;
reward_role({1012, <<"symix_353">>}) -> 1;
reward_role({1014, <<"symlf_1876">>}) -> 1;
reward_role({1017, <<"9377_1368">>}) -> 1;
reward_role({1017, <<"9377ios_198">>}) -> 1;
reward_role({1017, <<"symix_999">>}) -> 1;
reward_role({102, <<"symix_913">>}) -> 1;
reward_role({1020, <<"9377_288">>}) -> 1;
reward_role({1021, <<"symix_1171">>}) -> 1;
reward_role({10212, <<"symlf_1">>}) -> 1;
reward_role({1022, <<"symix_1177">>}) -> 1;
reward_role({1026, <<"symix_1055">>}) -> 1;
reward_role({1027, <<"symix_1155">>}) -> 1;
reward_role({103, <<"9377_1171">>}) -> 1;
reward_role({1035, <<"symix_879">>}) -> 1;
reward_role({1039, <<"9377_1039">>}) -> 1;
reward_role({1039, <<"9377_18">>}) -> 1;
reward_role({104, <<"icebird_718">>}) -> 1;
reward_role({1041, <<"9377_1316">>}) -> 1;
reward_role({1043, <<"symix2_1289">>}) -> 1;
reward_role({1044, <<"9377_1346">>}) -> 1;
reward_role({1046, <<"symix2_1031">>}) -> 1;
reward_role({1048, <<"symlf_72">>}) -> 1;
reward_role({1049, <<"symix_1028">>}) -> 1;
reward_role({1052, <<"symix2_1147">>}) -> 1;
reward_role({1053, <<"symix2_830">>}) -> 1;
reward_role({1057, <<"symix_672">>}) -> 1;
reward_role({1058, <<"symix_264">>}) -> 1;
reward_role({1061, <<"symix2_1250">>}) -> 1;
reward_role({1061, <<"symlf_2938">>}) -> 1;
reward_role({1064, <<"symix2_1142">>}) -> 1;
reward_role({1069, <<"9377_586">>}) -> 1;
reward_role({107, <<"symix_1260">>}) -> 1;
reward_role({1071, <<"9377_1229">>}) -> 1;
reward_role({1071, <<"symlf_2663">>}) -> 1;
reward_role({1078, <<"icebird_629">>}) -> 1;
reward_role({1079, <<"9377_907">>}) -> 1;
reward_role({1083, <<"symlf_2783">>}) -> 1;
reward_role({1085, <<"9377_1360">>}) -> 1;
reward_role({1092, <<"symix_880">>}) -> 1;
reward_role({1093, <<"symix_962">>}) -> 1;
reward_role({1094, <<"symix_1261">>}) -> 1;
reward_role({1094, <<"symix_1265">>}) -> 1;
reward_role({1095, <<"symix2_1200">>}) -> 1;
reward_role({11, <<"9377_1125">>}) -> 1;
reward_role({1101, <<"symlf_2855">>}) -> 1;
reward_role({1101, <<"symlf_2912">>}) -> 1;
reward_role({1103, <<"9377_1367">>}) -> 1;
reward_role({1103, <<"symix_945">>}) -> 1;
reward_role({1104, <<"9377_626">>}) -> 1;
reward_role({1107, <<"9377_1236">>}) -> 1;
reward_role({1107, <<"9377_1336">>}) -> 1;
reward_role({1108, <<"symix_1269">>}) -> 1;
reward_role({111, <<"symix_1311">>}) -> 1;
reward_role({1116, <<"symlf_1373">>}) -> 1;
reward_role({112, <<"9377_1373">>}) -> 1;
reward_role({1123, <<"symix2_662">>}) -> 1;
reward_role({1126, <<"symlf_2133">>}) -> 1;
reward_role({113, <<"symix2_1312">>}) -> 1;
reward_role({1131, <<"symlf_1944">>}) -> 1;
reward_role({1133, <<"9377_1264">>}) -> 1;
reward_role({1136, <<"symix_1105">>}) -> 1;
reward_role({1137, <<"symix2_1050">>}) -> 1;
reward_role({114, <<"symix2_1038">>}) -> 1;
reward_role({114, <<"symlf_2659">>}) -> 1;
reward_role({114, <<"symlf_2913">>}) -> 1;
reward_role({1140, <<"symix_1150">>}) -> 1;
reward_role({1142, <<"symix_1294">>}) -> 1;
reward_role({1142, <<"symlf_2942">>}) -> 1;
reward_role({1144, <<"symix_1144">>}) -> 1;
reward_role({1144, <<"symlf_2583">>}) -> 1;
reward_role({1145, <<"9377_1074">>}) -> 1;
reward_role({1148, <<"symix_1289">>}) -> 1;
reward_role({1149, <<"symlf_2955">>}) -> 1;
reward_role({1152, <<"symlf_2899">>}) -> 1;
reward_role({1153, <<"symlf_2090">>}) -> 1;
reward_role({1158, <<"9377_614">>}) -> 1;
reward_role({1160, <<"symix2_1174">>}) -> 1;
reward_role({1161, <<"9377_1091">>}) -> 1;
reward_role({1163, <<"9377_1189">>}) -> 1;
reward_role({1168, <<"icebird_658">>}) -> 1;
reward_role({1168, <<"symix_841">>}) -> 1;
reward_role({1169, <<"symix2_791">>}) -> 1;
reward_role({1173, <<"symix2_1207">>}) -> 1;
reward_role({1174, <<"symix2_1069">>}) -> 1;
reward_role({1178, <<"symix_1260">>}) -> 1;
reward_role({1178, <<"symlf_2922">>}) -> 1;
reward_role({1179, <<"symix_1155">>}) -> 1;
reward_role({118, <<"9377_1234">>}) -> 1;
reward_role({1181, <<"9377_1362">>}) -> 1;
reward_role({1182, <<"symix_1220">>}) -> 1;
reward_role({1182, <<"symix2_1222">>}) -> 1;
reward_role({1183, <<"symix_1300">>}) -> 1;
reward_role({1199, <<"icebird_105">>}) -> 1;
reward_role({12, <<"symlf_2868">>}) -> 1;
reward_role({1200, <<"symlf_2947">>}) -> 1;
reward_role({1202, <<"symlf_1441">>}) -> 1;
reward_role({1205, <<"9377_1096">>}) -> 1;
reward_role({1207, <<"symix_789">>}) -> 1;
reward_role({1207, <<"symlf_1899">>}) -> 1;
reward_role({1211, <<"symlf_2974">>}) -> 1;
reward_role({12149, <<"symix_1">>}) -> 1;
reward_role({1218, <<"9377_22">>}) -> 1;
reward_role({122, <<"symix_989">>}) -> 1;
reward_role({1221, <<"symlf_2864">>}) -> 1;
reward_role({1223, <<"symix2_633">>}) -> 1;
reward_role({1224, <<"symix_865">>}) -> 1;
reward_role({1225, <<"symix_1239">>}) -> 1;
reward_role({1226, <<"symix_1173">>}) -> 1;
reward_role({123, <<"9377_1364">>}) -> 1;
reward_role({1230, <<"symix2_1158">>}) -> 1;
reward_role({1230, <<"symix2_1272">>}) -> 1;
reward_role({1230, <<"symlf_2046">>}) -> 1;
reward_role({1230, <<"tanwan_11">>}) -> 1;
reward_role({1236, <<"symix_1138">>}) -> 1;
reward_role({1239, <<"symix_1094">>}) -> 1;
reward_role({1239, <<"symix2_1095">>}) -> 1;
reward_role({1239, <<"symlf_1948">>}) -> 1;
reward_role({124, <<"symix_1233">>}) -> 1;
reward_role({124, <<"symlf_2403">>}) -> 1;
reward_role({1242, <<"symlf_2869">>}) -> 1;
reward_role({1243, <<"symix_1259">>}) -> 1;
reward_role({1253, <<"symix_1295">>}) -> 1;
reward_role({1256, <<"symix2_1221">>}) -> 1;
reward_role({1258, <<"9377_965">>}) -> 1;
reward_role({1264, <<"symix_1288">>}) -> 1;
reward_role({1266, <<"symix_460">>}) -> 1;
reward_role({1267, <<"symlf_2934">>}) -> 1;
reward_role({1269, <<"icebird_700">>}) -> 1;
reward_role({1269, <<"symix2_1025">>}) -> 1;
reward_role({1269, <<"symix2_1039">>}) -> 1;
reward_role({1269, <<"symix2_1207">>}) -> 1;
reward_role({1274, <<"symix_833">>}) -> 1;
reward_role({1276, <<"9377_1317">>}) -> 1;
reward_role({1276, <<"symix2_1268">>}) -> 1;
reward_role({128, <<"9377_1371">>}) -> 1;
reward_role({128, <<"symix_608">>}) -> 1;
reward_role({1282, <<"9377_1199">>}) -> 1;
reward_role({1282, <<"symlf_2671">>}) -> 1;
reward_role({1284, <<"9377_1366">>}) -> 1;
reward_role({1287, <<"symlf_2967">>}) -> 1;
reward_role({1288, <<"symix_965">>}) -> 1;
reward_role({1289, <<"9377_1283">>}) -> 1;
reward_role({1289, <<"symix_1160">>}) -> 1;
reward_role({1290, <<"symix_1136">>}) -> 1;
reward_role({1292, <<"symix_1086">>}) -> 1;
reward_role({1292, <<"symix2_1209">>}) -> 1;
reward_role({1296, <<"symix_1005">>}) -> 1;
reward_role({1297, <<"symlf_2901">>}) -> 1;
reward_role({1299, <<"symix_1197">>}) -> 1;
reward_role({130, <<"9377_1356">>}) -> 1;
reward_role({1301, <<"symlf_2857">>}) -> 1;
reward_role({1303, <<"symix_1227">>}) -> 1;
reward_role({1305, <<"9377_1346">>}) -> 1;
reward_role({1307, <<"symlf_793">>}) -> 1;
reward_role({131, <<"9377ios_279">>}) -> 1;
reward_role({131, <<"symix2_1001">>}) -> 1;
reward_role({1311, <<"symlf_2900">>}) -> 1;
reward_role({1312, <<"symix_1199">>}) -> 1;
reward_role({1312, <<"symix2_767">>}) -> 1;
reward_role({1313, <<"symix_986">>}) -> 1;
reward_role({1317, <<"symix_1172">>}) -> 1;
reward_role({132, <<"9377_1214">>}) -> 1;
reward_role({1321, <<"symix2_725">>}) -> 1;
reward_role({1323, <<"symix_1239">>}) -> 1;
reward_role({1326, <<"9377_1065">>}) -> 1;
reward_role({1327, <<"icebird_519">>}) -> 1;
reward_role({1327, <<"symix_977">>}) -> 1;
reward_role({1327, <<"symix2_957">>}) -> 1;
reward_role({1327, <<"symlf_2843">>}) -> 1;
reward_role({133, <<"symix_1197">>}) -> 1;
reward_role({1331, <<"symlf_2663">>}) -> 1;
reward_role({1333, <<"symlf_1047">>}) -> 1;
reward_role({1336, <<"symix2_551">>}) -> 1;
reward_role({1337, <<"9377_1240">>}) -> 1;
reward_role({1338, <<"symix2_1041">>}) -> 1;
reward_role({1338, <<"symix2_658">>}) -> 1;
reward_role({134, <<"symlf_2942">>}) -> 1;
reward_role({1342, <<"symlf_1250">>}) -> 1;
reward_role({1343, <<"symix_1029">>}) -> 1;
reward_role({1343, <<"symix2_1204">>}) -> 1;
reward_role({1343, <<"symix2_890">>}) -> 1;
reward_role({1344, <<"symix2_398">>}) -> 1;
reward_role({1347, <<"symix_481">>}) -> 1;
reward_role({1348, <<"symlf_2905">>}) -> 1;
reward_role({1349, <<"symix_10">>}) -> 1;
reward_role({1350, <<"9377_1196">>}) -> 1;
reward_role({1352, <<"9377_1248">>}) -> 1;
reward_role({1352, <<"symix2_1059">>}) -> 1;
reward_role({1354, <<"symix_1217">>}) -> 1;
reward_role({1354, <<"symix2_1070">>}) -> 1;
reward_role({1355, <<"symlf_2912">>}) -> 1;
reward_role({1357, <<"symlf_2694">>}) -> 1;
reward_role({136, <<"9377ios_264">>}) -> 1;
reward_role({136, <<"symlf_2927">>}) -> 1;
reward_role({1361, <<"symlf_2805">>}) -> 1;
reward_role({1363, <<"symix2_758">>}) -> 1;
reward_role({1367, <<"symix2_1022">>}) -> 1;
reward_role({1368, <<"symix2_1031">>}) -> 1;
reward_role({1370, <<"symix2_1002">>}) -> 1;
reward_role({1373, <<"symix_445">>}) -> 1;
reward_role({1373, <<"symlf_2451">>}) -> 1;
reward_role({1375, <<"symix_1205">>}) -> 1;
reward_role({1381, <<"9377_1357">>}) -> 1;
reward_role({1381, <<"symix2_1138">>}) -> 1;
reward_role({1386, <<"symlf_2914">>}) -> 1;
reward_role({139, <<"symix_1005">>}) -> 1;
reward_role({1390, <<"symix2_389">>}) -> 1;
reward_role({1393, <<"symlf_2904">>}) -> 1;
reward_role({1397, <<"9377_1264">>}) -> 1;
reward_role({1397, <<"symix2_1034">>}) -> 1;
reward_role({14, <<"9377ios_177">>}) -> 1;
reward_role({14, <<"symix_1285">>}) -> 1;
reward_role({14, <<"tanwan_122">>}) -> 1;
reward_role({1400, <<"symlf_2612">>}) -> 1;
reward_role({1404, <<"symix_983">>}) -> 1;
reward_role({1406, <<"symix2_867">>}) -> 1;
reward_role({1407, <<"symix2_872">>}) -> 1;
reward_role({1408, <<"symix2_679">>}) -> 1;
reward_role({1410, <<"icebird_716">>}) -> 1;
reward_role({14157, <<"symlf_2">>}) -> 1;
reward_role({1418, <<"9377_1272">>}) -> 1;
reward_role({142, <<"symix_1110">>}) -> 1;
reward_role({1420, <<"symix_1049">>}) -> 1;
reward_role({1420, <<"symlf_2894">>}) -> 1;
reward_role({1422, <<"symix_658">>}) -> 1;
reward_role({1425, <<"9377_573">>}) -> 1;
reward_role({1426, <<"symlf_2918">>}) -> 1;
reward_role({1428, <<"symix_719">>}) -> 1;
reward_role({1429, <<"symix_182">>}) -> 1;
reward_role({143, <<"symix_1254">>}) -> 1;
reward_role({1430, <<"9377_1334">>}) -> 1;
reward_role({1431, <<"symix_1146">>}) -> 1;
reward_role({1433, <<"icebird_763">>}) -> 1;
reward_role({1435, <<"symix_1211">>}) -> 1;
reward_role({1436, <<"9377ios_198">>}) -> 1;
reward_role({1438, <<"symix_265">>}) -> 1;
reward_role({1442, <<"symix2_809">>}) -> 1;
reward_role({1442, <<"symlf_2679">>}) -> 1;
reward_role({1442, <<"symlf_2929">>}) -> 1;
reward_role({1445, <<"9377_1268">>}) -> 1;
reward_role({145, <<"9377_1358">>}) -> 1;
reward_role({1454, <<"9377_173">>}) -> 1;
reward_role({1454, <<"symix_1139">>}) -> 1;
reward_role({1456, <<"symix_1222">>}) -> 1;
reward_role({1457, <<"symix_1183">>}) -> 1;
reward_role({1458, <<"symix2_903">>}) -> 1;
reward_role({1460, <<"symix_1036">>}) -> 1;
reward_role({1463, <<"symix_642">>}) -> 1;
reward_role({1465, <<"9377_598">>}) -> 1;
reward_role({1465, <<"symix_1073">>}) -> 1;
reward_role({1470, <<"symix_1194">>}) -> 1;
reward_role({1470, <<"symlf_2819">>}) -> 1;
reward_role({1472, <<"symlf_2798">>}) -> 1;
reward_role({1476, <<"symlf_2769">>}) -> 1;
reward_role({1477, <<"icebird_344">>}) -> 1;
reward_role({1477, <<"symix2_1267">>}) -> 1;
reward_role({1479, <<"9377_1295">>}) -> 1;
reward_role({1479, <<"9377_904">>}) -> 1;
reward_role({1479, <<"symix_1175">>}) -> 1;
reward_role({1479, <<"symix_679">>}) -> 1;
reward_role({1480, <<"symix2_1219">>}) -> 1;
reward_role({1482, <<"symix2_1184">>}) -> 1;
reward_role({1484, <<"symix2_1071">>}) -> 1;
reward_role({149, <<"9377_1323">>}) -> 1;
reward_role({1491, <<"symlf_1211">>}) -> 1;
reward_role({1500, <<"symlf_2972">>}) -> 1;
reward_role({1504, <<"symix2_1116">>}) -> 1;
reward_role({1508, <<"symix_847">>}) -> 1;
reward_role({1510, <<"icebird_684">>}) -> 1;
reward_role({1515, <<"tanwan_3">>}) -> 1;
reward_role({1516, <<"symix2_278">>}) -> 1;
reward_role({1516, <<"symlf_2609">>}) -> 1;
reward_role({1517, <<"9377_1299">>}) -> 1;
reward_role({15182, <<"symlf_2">>}) -> 1;
reward_role({1526, <<"symix_1017">>}) -> 1;
reward_role({1531, <<"9377_1149">>}) -> 1;
reward_role({1531, <<"symix_852">>}) -> 1;
reward_role({1533, <<"9377_1267">>}) -> 1;
reward_role({1534, <<"symlf_2882">>}) -> 1;
reward_role({1535, <<"symix_1201">>}) -> 1;
reward_role({1535, <<"symix_250">>}) -> 1;
reward_role({1535, <<"symlf_2938">>}) -> 1;
reward_role({1539, <<"9377_1348">>}) -> 1;
reward_role({1540, <<"symlf_2831">>}) -> 1;
reward_role({1541, <<"9377_1327">>}) -> 1;
reward_role({1541, <<"symix2_522">>}) -> 1;
reward_role({1546, <<"symix2_1034">>}) -> 1;
reward_role({1548, <<"9377_924">>}) -> 1;
reward_role({1551, <<"symlf_2888">>}) -> 1;
reward_role({1553, <<"symlf_2838">>}) -> 1;
reward_role({15532, <<"symix2_100">>}) -> 1;
reward_role({1558, <<"icebird_665">>}) -> 1;
reward_role({1559, <<"icebird_763">>}) -> 1;
reward_role({1567, <<"symix_991">>}) -> 1;
reward_role({1567, <<"symlf_2867">>}) -> 1;
reward_role({1573, <<"9377_1229">>}) -> 1;
reward_role({1576, <<"9377_1296">>}) -> 1;
reward_role({1576, <<"symlf_1576">>}) -> 1;
reward_role({1577, <<"symlf_1969">>}) -> 1;
reward_role({1578, <<"symix2_1273">>}) -> 1;
reward_role({158, <<"symix_1261">>}) -> 1;
reward_role({1584, <<"9377_1003">>}) -> 1;
reward_role({1585, <<"symlf_2933">>}) -> 1;
reward_role({1587, <<"symix2_1094">>}) -> 1;
reward_role({159, <<"symlf_2600">>}) -> 1;
reward_role({1596, <<"9377_75">>}) -> 1;
reward_role({1598, <<"symix2_1174">>}) -> 1;
reward_role({1599, <<"icebird_578">>}) -> 1;
reward_role({16, <<"symix2_829">>}) -> 1;
reward_role({1605, <<"9377_254">>}) -> 1;
reward_role({1608, <<"symlf_1590">>}) -> 1;
reward_role({1611, <<"icebird_750">>}) -> 1;
reward_role({1611, <<"symix_386">>}) -> 1;
reward_role({1612, <<"symlf_2788">>}) -> 1;
reward_role({1613, <<"symlf_2932">>}) -> 1;
reward_role({16188, <<"symix2_100">>}) -> 1;
reward_role({1620, <<"symlf_2840">>}) -> 1;
reward_role({1623, <<"9377_1041">>}) -> 1;
reward_role({1624, <<"icebird_681">>}) -> 1;
reward_role({1624, <<"symix_210">>}) -> 1;
reward_role({1624, <<"symix2_868">>}) -> 1;
reward_role({1624, <<"symlf_2694">>}) -> 1;
reward_role({1625, <<"symix_1023">>}) -> 1;
reward_role({1629, <<"symix2_339">>}) -> 1;
reward_role({163, <<"9377_1074">>}) -> 1;
reward_role({163, <<"symix_1112">>}) -> 1;
reward_role({1631, <<"symix_369">>}) -> 1;
reward_role({1634, <<"symlf_2560">>}) -> 1;
reward_role({1637, <<"symix_324">>}) -> 1;
reward_role({1637, <<"symlf_2955">>}) -> 1;
reward_role({1638, <<"symlf_2293">>}) -> 1;
reward_role({1638, <<"symlf_2947">>}) -> 1;
reward_role({1639, <<"9377_811">>}) -> 1;
reward_role({1639, <<"symix_1100">>}) -> 1;
reward_role({1642, <<"9377_1224">>}) -> 1;
reward_role({1642, <<"9377_1370">>}) -> 1;
reward_role({1642, <<"symlf_2945">>}) -> 1;
reward_role({1643, <<"symix_1319">>}) -> 1;
reward_role({1645, <<"icebird_48">>}) -> 1;
reward_role({1645, <<"symix_821">>}) -> 1;
reward_role({1646, <<"symix2_1121">>}) -> 1;
reward_role({1650, <<"9377_730">>}) -> 1;
reward_role({1650, <<"symix2_862">>}) -> 1;
reward_role({1651, <<"9377_1349">>}) -> 1;
reward_role({1653, <<"symix_1258">>}) -> 1;
reward_role({1656, <<"symix_1079">>}) -> 1;
reward_role({1656, <<"symlf_2893">>}) -> 1;
reward_role({1665, <<"symlf_2893">>}) -> 1;
reward_role({1668, <<"symix_1230">>}) -> 1;
reward_role({1669, <<"symlf_2356">>}) -> 1;
reward_role({167, <<"symlf_2926">>}) -> 1;
reward_role({1672, <<"symix2_685">>}) -> 1;
reward_role({1672, <<"symlf_2516">>}) -> 1;
reward_role({1673, <<"icebird_509">>}) -> 1;
reward_role({1676, <<"symix_1052">>}) -> 1;
reward_role({1677, <<"symix2_496">>}) -> 1;
reward_role({1680, <<"symlf_1928">>}) -> 1;
reward_role({1681, <<"symix2_1318">>}) -> 1;
reward_role({1684, <<"symix_1175">>}) -> 1;
reward_role({1684, <<"symlf_2505">>}) -> 1;
reward_role({1686, <<"9377_1349">>}) -> 1;
reward_role({1688, <<"symlf_2956">>}) -> 1;
reward_role({1692, <<"symix_1278">>}) -> 1;
reward_role({1695, <<"symlf_2957">>}) -> 1;
reward_role({1696, <<"symix2_605">>}) -> 1;
reward_role({1697, <<"symix2_1017">>}) -> 1;
reward_role({1703, <<"symlf_2841">>}) -> 1;
reward_role({1707, <<"symlf_2379">>}) -> 1;
reward_role({1710, <<"9377_566">>}) -> 1;
reward_role({1711, <<"symix_1300">>}) -> 1;
reward_role({1712, <<"9377_1361">>}) -> 1;
reward_role({1714, <<"9377_1273">>}) -> 1;
reward_role({1714, <<"symix2_1078">>}) -> 1;
reward_role({1716, <<"symix2_1060">>}) -> 1;
reward_role({1716, <<"symix2_1086">>}) -> 1;
reward_role({1718, <<"9377_1274">>}) -> 1;
reward_role({1720, <<"9377_771">>}) -> 1;
reward_role({1720, <<"symix_959">>}) -> 1;
reward_role({1722, <<"symix_844">>}) -> 1;
reward_role({1723, <<"symlf_2973">>}) -> 1;
reward_role({1724, <<"symlf_2906">>}) -> 1;
reward_role({1729, <<"symlf_2895">>}) -> 1;
reward_role({1733, <<"symix_1068">>}) -> 1;
reward_role({1733, <<"symlf_2762">>}) -> 1;
reward_role({1733, <<"symlf_2906">>}) -> 1;
reward_role({1735, <<"symix_999">>}) -> 1;
reward_role({1735, <<"symix2_341">>}) -> 1;
reward_role({1738, <<"symlf_1525">>}) -> 1;
reward_role({174, <<"symlf_2260">>}) -> 1;
reward_role({1740, <<"9377_1268">>}) -> 1;
reward_role({1744, <<"9377_1307">>}) -> 1;
reward_role({1745, <<"symix2_882">>}) -> 1;
reward_role({1746, <<"symix_1177">>}) -> 1;
reward_role({1748, <<"symlf_2739">>}) -> 1;
reward_role({1749, <<"symix_805">>}) -> 1;
reward_role({1750, <<"symlf_2915">>}) -> 1;
reward_role({1751, <<"symix2_1153">>}) -> 1;
reward_role({1756, <<"symix2_1039">>}) -> 1;
reward_role({1759, <<"9377_1143">>}) -> 1;
reward_role({1764, <<"symix_1030">>}) -> 1;
reward_role({1768, <<"symlf_2755">>}) -> 1;
reward_role({177, <<"symix_1232">>}) -> 1;
reward_role({1770, <<"symlf_2552">>}) -> 1;
reward_role({1771, <<"9377_201">>}) -> 1;
reward_role({1772, <<"symix_1093">>}) -> 1;
reward_role({1772, <<"symlf_2459">>}) -> 1;
reward_role({1773, <<"symix_1220">>}) -> 1;
reward_role({1776, <<"symix_1249">>}) -> 1;
reward_role({1778, <<"9377_1335">>}) -> 1;
reward_role({1782, <<"icebird_345">>}) -> 1;
reward_role({1782, <<"symix_985">>}) -> 1;
reward_role({1789, <<"symix_1214">>}) -> 1;
reward_role({1789, <<"symlf_1141">>}) -> 1;
reward_role({1795, <<"9377_1237">>}) -> 1;
reward_role({1799, <<"9377_1217">>}) -> 1;
reward_role({18, <<"9377_1204">>}) -> 1;
reward_role({180, <<"9377_1328">>}) -> 1;
reward_role({180, <<"9377_1338">>}) -> 1;
reward_role({1800, <<"symlf_2800">>}) -> 1;
reward_role({1801, <<"9377_1301">>}) -> 1;
reward_role({1802, <<"9377_1353">>}) -> 1;
reward_role({1805, <<"symix_1124">>}) -> 1;
reward_role({1806, <<"9377_1070">>}) -> 1;
reward_role({1807, <<"9377_607">>}) -> 1;
reward_role({1807, <<"9377_71">>}) -> 1;
reward_role({1808, <<"symix2_496">>}) -> 1;
reward_role({1809, <<"icebird_26">>}) -> 1;
reward_role({181, <<"symix2_1167">>}) -> 1;
reward_role({1817, <<"symlf_2541">>}) -> 1;
reward_role({1818, <<"icebird_575">>}) -> 1;
reward_role({1819, <<"symlf_1463">>}) -> 1;
reward_role({182, <<"symix_959">>}) -> 1;
reward_role({1821, <<"symix_1242">>}) -> 1;
reward_role({1822, <<"symix2_1212">>}) -> 1;
reward_role({1828, <<"symix_1153">>}) -> 1;
reward_role({1830, <<"9377_1090">>}) -> 1;
reward_role({1830, <<"symix_160">>}) -> 1;
reward_role({1831, <<"symix_245">>}) -> 1;
reward_role({1835, <<"symix_956">>}) -> 1;
reward_role({1839, <<"symix_873">>}) -> 1;
reward_role({1840, <<"symlf_2724">>}) -> 1;
reward_role({1843, <<"symlf_2450">>}) -> 1;
reward_role({1845, <<"symix2_1232">>}) -> 1;
reward_role({1850, <<"9377_1223">>}) -> 1;
reward_role({1857, <<"symix_1098">>}) -> 1;
reward_role({186, <<"symlf_2908">>}) -> 1;
reward_role({1862, <<"symix_1049">>}) -> 1;
reward_role({1864, <<"symix_1238">>}) -> 1;
reward_role({1868, <<"symix_1141">>}) -> 1;
reward_role({1868, <<"symix_933">>}) -> 1;
reward_role({1871, <<"symix2_1002">>}) -> 1;
reward_role({1872, <<"symix2_1238">>}) -> 1;
reward_role({1874, <<"symlf_2204">>}) -> 1;
reward_role({1874, <<"symlf_2892">>}) -> 1;
reward_role({1875, <<"symix_749">>}) -> 1;
reward_role({1876, <<"symix_597">>}) -> 1;
reward_role({1876, <<"symlf_786">>}) -> 1;
reward_role({1879, <<"symix2_469">>}) -> 1;
reward_role({1882, <<"symix2_1188">>}) -> 1;
reward_role({1884, <<"9377_963">>}) -> 1;
reward_role({1886, <<"symlf_2530">>}) -> 1;
reward_role({1887, <<"symix2_910">>}) -> 1;
reward_role({189, <<"9377_1374">>}) -> 1;
reward_role({1898, <<"icebird_108">>}) -> 1;
reward_role({1898, <<"symlf_2715">>}) -> 1;
reward_role({19, <<"symlf_2927">>}) -> 1;
reward_role({1901, <<"9377_1271">>}) -> 1;
reward_role({1903, <<"9377_1327">>}) -> 1;
reward_role({1905, <<"icebird_443">>}) -> 1;
reward_role({1907, <<"9377_1351">>}) -> 1;
reward_role({1908, <<"9377_211">>}) -> 1;
reward_role({191, <<"icebird_802">>}) -> 1;
reward_role({191, <<"symix2_1285">>}) -> 1;
reward_role({1910, <<"symix_1225">>}) -> 1;
reward_role({1911, <<"symix2_1224">>}) -> 1;
reward_role({1915, <<"9377_1290">>}) -> 1;
reward_role({1918, <<"9377_359">>}) -> 1;
reward_role({1919, <<"symlf_2334">>}) -> 1;
reward_role({1920, <<"icebird_230">>}) -> 1;
reward_role({1920, <<"symix2_364">>}) -> 1;
reward_role({1922, <<"symlf_2758">>}) -> 1;
reward_role({1927, <<"symix2_637">>}) -> 1;
reward_role({1928, <<"symix_1193">>}) -> 1;
reward_role({193, <<"symix_1260">>}) -> 1;
reward_role({193, <<"symix_1287">>}) -> 1;
reward_role({1934, <<"symix2_1148">>}) -> 1;
reward_role({1935, <<"symix2_1049">>}) -> 1;
reward_role({1936, <<"symix_962">>}) -> 1;
reward_role({1939, <<"symix2_1300">>}) -> 1;
reward_role({1940, <<"symlf_2979">>}) -> 1;
reward_role({1941, <<"symix_302">>}) -> 1;
reward_role({1942, <<"symix_434">>}) -> 1;
reward_role({1944, <<"symix_1037">>}) -> 1;
reward_role({1946, <<"symix2_1096">>}) -> 1;
reward_role({1949, <<"symlf_2396">>}) -> 1;
reward_role({1950, <<"symix2_1196">>}) -> 1;
reward_role({1957, <<"symix_1020">>}) -> 1;
reward_role({1958, <<"symlf_1430">>}) -> 1;
reward_role({1964, <<"9377_519">>}) -> 1;
reward_role({1964, <<"symix2_668">>}) -> 1;
reward_role({1965, <<"9377ios_68">>}) -> 1;
reward_role({1965, <<"symix2_1003">>}) -> 1;
reward_role({1968, <<"9377_385">>}) -> 1;
reward_role({1973, <<"symix_1035">>}) -> 1;
reward_role({1973, <<"symix_917">>}) -> 1;
reward_role({1978, <<"9377_1328">>}) -> 1;
reward_role({198, <<"9377_1349">>}) -> 1;
reward_role({1987, <<"symlf_2073">>}) -> 1;
reward_role({1990, <<"symix2_1203">>}) -> 1;
reward_role({1992, <<"symix_943">>}) -> 1;
reward_role({1994, <<"symix2_1077">>}) -> 1;
reward_role({1995, <<"9377_1331">>}) -> 1;
reward_role({1995, <<"9377_1347">>}) -> 1;
reward_role({1997, <<"symix_664">>}) -> 1;
reward_role({20, <<"9377_1125">>}) -> 1;
reward_role({20, <<"9377_1356">>}) -> 1;
reward_role({20, <<"symix2_1238">>}) -> 1;
reward_role({200, <<"icebird_795">>}) -> 1;
reward_role({2002, <<"symix_1082">>}) -> 1;
reward_role({2003, <<"symlf_2772">>}) -> 1;
reward_role({2007, <<"symlf_2428">>}) -> 1;
reward_role({2008, <<"symix2_221">>}) -> 1;
reward_role({2009, <<"symix_1198">>}) -> 1;
reward_role({201, <<"symix2_1204">>}) -> 1;
reward_role({2010, <<"symix2_207">>}) -> 1;
reward_role({2017, <<"symlf_2915">>}) -> 1;
reward_role({202, <<"9377_1352">>}) -> 1;
reward_role({2030, <<"symix_1025">>}) -> 1;
reward_role({2032, <<"symix_1162">>}) -> 1;
reward_role({2033, <<"symlf_2923">>}) -> 1;
reward_role({2035, <<"9377ios_84">>}) -> 1;
reward_role({2035, <<"symix2_763">>}) -> 1;
reward_role({2037, <<"symix2_213">>}) -> 1;
reward_role({2038, <<"symix_1184">>}) -> 1;
reward_role({204, <<"symix2_703">>}) -> 1;
reward_role({2041, <<"9377_1265">>}) -> 1;
reward_role({2041, <<"symix2_945">>}) -> 1;
reward_role({2042, <<"symlf_2826">>}) -> 1;
reward_role({2043, <<"9377_878">>}) -> 1;
reward_role({2045, <<"9377_1354">>}) -> 1;
reward_role({2046, <<"symix_335">>}) -> 1;
reward_role({2047, <<"symix_972">>}) -> 1;
reward_role({2047, <<"symlf_2627">>}) -> 1;
reward_role({2050, <<"symix_989">>}) -> 1;
reward_role({2051, <<"symix_1133">>}) -> 1;
reward_role({2051, <<"symix2_1096">>}) -> 1;
reward_role({2054, <<"9377_1194">>}) -> 1;
reward_role({2054, <<"symix_61">>}) -> 1;
reward_role({2057, <<"symix2_1110">>}) -> 1;
reward_role({2059, <<"9377_1102">>}) -> 1;
reward_role({2059, <<"9377_1190">>}) -> 1;
reward_role({2060, <<"9377_1085">>}) -> 1;
reward_role({2061, <<"symix_1274">>}) -> 1;
reward_role({2063, <<"9377_1314">>}) -> 1;
reward_role({2063, <<"symix_1163">>}) -> 1;
reward_role({2066, <<"9377_1283">>}) -> 1;
reward_role({2067, <<"symix2_351">>}) -> 1;
reward_role({2069, <<"symix_1063">>}) -> 1;
reward_role({2070, <<"symix_1052">>}) -> 1;
reward_role({2075, <<"9377_1222">>}) -> 1;
reward_role({2078, <<"symix_1220">>}) -> 1;
reward_role({2079, <<"symix_1188">>}) -> 1;
reward_role({208, <<"symix_1315">>}) -> 1;
reward_role({2082, <<"symix_1111">>}) -> 1;
reward_role({2084, <<"symix_1290">>}) -> 1;
reward_role({209, <<"symix_1245">>}) -> 1;
reward_role({2090, <<"symlf_2891">>}) -> 1;
reward_role({2093, <<"9377_207">>}) -> 1;
reward_role({2096, <<"symix2_723">>}) -> 1;
reward_role({21, <<"icebird_767">>}) -> 1;
reward_role({2101, <<"symix_1065">>}) -> 1;
reward_role({211, <<"9377_188">>}) -> 1;
reward_role({2110, <<"9377_1376">>}) -> 1;
reward_role({2111, <<"9377_1257">>}) -> 1;
reward_role({2114, <<"symix2_1011">>}) -> 1;
reward_role({2127, <<"symix_953">>}) -> 1;
reward_role({2127, <<"symlf_2415">>}) -> 1;
reward_role({213, <<"symlf_1699">>}) -> 1;
reward_role({2130, <<"9377_1278">>}) -> 1;
reward_role({2131, <<"symix2_1327">>}) -> 1;
reward_role({2136, <<"9377_788">>}) -> 1;
reward_role({2136, <<"symix_1094">>}) -> 1;
reward_role({2137, <<"symix_1124">>}) -> 1;
reward_role({2137, <<"symlf_2642">>}) -> 1;
reward_role({2138, <<"9377_617">>}) -> 1;
reward_role({2140, <<"symix_442">>}) -> 1;
reward_role({2141, <<"symix_971">>}) -> 1;
reward_role({2141, <<"symlf_2734">>}) -> 1;
reward_role({2143, <<"symlf_2878">>}) -> 1;
reward_role({2145, <<"symix2_1035">>}) -> 1;
reward_role({2149, <<"symix2_779">>}) -> 1;
reward_role({2157, <<"9377_1326">>}) -> 1;
reward_role({2161, <<"9377_1367">>}) -> 1;
reward_role({2165, <<"symix2_514">>}) -> 1;
reward_role({2166, <<"symix2_391">>}) -> 1;
reward_role({2167, <<"symix_734">>}) -> 1;
reward_role({217, <<"symix_1224">>}) -> 1;
reward_role({2174, <<"symlf_2563">>}) -> 1;
reward_role({2177, <<"9377_784">>}) -> 1;
reward_role({218, <<"symlf_2147">>}) -> 1;
reward_role({2180, <<"9377_1331">>}) -> 1;
reward_role({2187, <<"symlf_2780">>}) -> 1;
reward_role({2187, <<"symlf_2956">>}) -> 1;
reward_role({2189, <<"icebird_728">>}) -> 1;
reward_role({2194, <<"9377_247">>}) -> 1;
reward_role({2194, <<"icebird_654">>}) -> 1;
reward_role({2194, <<"symix_1318">>}) -> 1;
reward_role({2194, <<"symix2_1313">>}) -> 1;
reward_role({2197, <<"symix_566">>}) -> 1;
reward_role({2199, <<"symix_632">>}) -> 1;
reward_role({2199, <<"symlf_2956">>}) -> 1;
reward_role({2202, <<"symlf_2915">>}) -> 1;
reward_role({2203, <<"symix_903">>}) -> 1;
reward_role({2203, <<"symlf_2501">>}) -> 1;
reward_role({2204, <<"9377_1301">>}) -> 1;
reward_role({2205, <<"9377ios_213">>}) -> 1;
reward_role({2208, <<"symix_1190">>}) -> 1;
reward_role({2209, <<"symix_868">>}) -> 1;
reward_role({2210, <<"9377_1277">>}) -> 1;
reward_role({2212, <<"symix2_1144">>}) -> 1;
reward_role({2213, <<"symlf_2727">>}) -> 1;
reward_role({2214, <<"symlf_2633">>}) -> 1;
reward_role({2214, <<"symlf_2811">>}) -> 1;
reward_role({2216, <<"symix_1165">>}) -> 1;
reward_role({2228, <<"symix_998">>}) -> 1;
reward_role({2231, <<"symix_1004">>}) -> 1;
reward_role({2231, <<"symix2_728">>}) -> 1;
reward_role({2231, <<"symix2_864">>}) -> 1;
reward_role({2233, <<"symix2_552">>}) -> 1;
reward_role({2236, <<"symlf_2199">>}) -> 1;
reward_role({224, <<"9377ios_264">>}) -> 1;
reward_role({2241, <<"symix2_1310">>}) -> 1;
reward_role({2245, <<"symix_1039">>}) -> 1;
reward_role({2245, <<"symix_922">>}) -> 1;
reward_role({2250, <<"9377_1280">>}) -> 1;
reward_role({2251, <<"icebird_349">>}) -> 1;
reward_role({2253, <<"9377_139">>}) -> 1;
reward_role({226, <<"symix_1174">>}) -> 1;
reward_role({2260, <<"symix_1255">>}) -> 1;
reward_role({2262, <<"symlf_2815">>}) -> 1;
reward_role({2263, <<"symix_1319">>}) -> 1;
reward_role({2265, <<"symix_1143">>}) -> 1;
reward_role({2265, <<"symix2_1177">>}) -> 1;
reward_role({2267, <<"9377_1247">>}) -> 1;
reward_role({2268, <<"symix2_722">>}) -> 1;
reward_role({2268, <<"symix2_744">>}) -> 1;
reward_role({2269, <<"symlf_2141">>}) -> 1;
reward_role({227, <<"icebird_768">>}) -> 1;
reward_role({2271, <<"9377ios_248">>}) -> 1;
reward_role({2271, <<"symix_1134">>}) -> 1;
reward_role({2275, <<"9377_27">>}) -> 1;
reward_role({2275, <<"symix2_205">>}) -> 1;
reward_role({2276, <<"symlf_2316">>}) -> 1;
reward_role({2277, <<"9377_1355">>}) -> 1;
reward_role({2280, <<"9377_1336">>}) -> 1;
reward_role({2282, <<"symix_1179">>}) -> 1;
reward_role({2282, <<"symix_1260">>}) -> 1;
reward_role({2283, <<"symix_1066">>}) -> 1;
reward_role({2283, <<"symix2_1046">>}) -> 1;
reward_role({2283, <<"symix2_608">>}) -> 1;
reward_role({2284, <<"9377_1048">>}) -> 1;
reward_role({2284, <<"symix_1145">>}) -> 1;
reward_role({2286, <<"symix_949">>}) -> 1;
reward_role({2293, <<"symlf_2888">>}) -> 1;
reward_role({2298, <<"9377_1105">>}) -> 1;
reward_role({2298, <<"symix_1196">>}) -> 1;
reward_role({2299, <<"9377_1335">>}) -> 1;
reward_role({2300, <<"symlf_2853">>}) -> 1;
reward_role({2301, <<"symix2_292">>}) -> 1;
reward_role({2302, <<"symix2_232">>}) -> 1;
reward_role({2304, <<"symix2_956">>}) -> 1;
reward_role({2307, <<"symlf_2684">>}) -> 1;
reward_role({231, <<"9377_1368">>}) -> 1;
reward_role({2318, <<"9377_1371">>}) -> 1;
reward_role({232, <<"symix_1097">>}) -> 1;
reward_role({2323, <<"symix2_1191">>}) -> 1;
reward_role({2325, <<"symix_1130">>}) -> 1;
reward_role({2325, <<"symlf_2720">>}) -> 1;
reward_role({233, <<"symix_916">>}) -> 1;
reward_role({233, <<"symlf_2961">>}) -> 1;
reward_role({2330, <<"symlf_1252">>}) -> 1;
reward_role({2331, <<"symlf_2812">>}) -> 1;
reward_role({2334, <<"symix2_899">>}) -> 1;
reward_role({2337, <<"symix_1240">>}) -> 1;
reward_role({2338, <<"symix2_277">>}) -> 1;
reward_role({2340, <<"symix_1289">>}) -> 1;
reward_role({2341, <<"symix2_824">>}) -> 1;
reward_role({2343, <<"symix_747">>}) -> 1;
reward_role({2343, <<"symlf_2314">>}) -> 1;
reward_role({2344, <<"symlf_1431">>}) -> 1;
reward_role({2347, <<"9377_1028">>}) -> 1;
reward_role({2350, <<"icebird_386">>}) -> 1;
reward_role({2351, <<"symix_1318">>}) -> 1;
reward_role({2354, <<"symix_1184">>}) -> 1;
reward_role({2355, <<"symix_755">>}) -> 1;
reward_role({236, <<"9377_1262">>}) -> 1;
reward_role({2362, <<"symix2_1005">>}) -> 1;
reward_role({2366, <<"symix_988">>}) -> 1;
reward_role({2369, <<"symix2_1259">>}) -> 1;
reward_role({2371, <<"symlf_2583">>}) -> 1;
reward_role({2373, <<"symlf_2017">>}) -> 1;
reward_role({2375, <<"9377_485">>}) -> 1;
reward_role({2379, <<"symix2_1010">>}) -> 1;
reward_role({2379, <<"symlf_2007">>}) -> 1;
reward_role({2381, <<"symix2_801">>}) -> 1;
reward_role({2385, <<"9377_651">>}) -> 1;
reward_role({2385, <<"symlf_2003">>}) -> 1;
reward_role({2387, <<"symix_229">>}) -> 1;
reward_role({2388, <<"symix_1173">>}) -> 1;
reward_role({239, <<"symlf_2935">>}) -> 1;
reward_role({2390, <<"symlf_2863">>}) -> 1;
reward_role({2391, <<"icebird_389">>}) -> 1;
reward_role({2393, <<"symlf_2887">>}) -> 1;
reward_role({24, <<"symix_396">>}) -> 1;
reward_role({2403, <<"9377_1361">>}) -> 1;
reward_role({2404, <<"symix_1069">>}) -> 1;
reward_role({2405, <<"9377_1346">>}) -> 1;
reward_role({2413, <<"symix2_332">>}) -> 1;
reward_role({2415, <<"symix2_1217">>}) -> 1;
reward_role({2415, <<"symix2_817">>}) -> 1;
reward_role({2421, <<"symix_1218">>}) -> 1;
reward_role({2422, <<"9377_1309">>}) -> 1;
reward_role({2422, <<"symix2_995">>}) -> 1;
reward_role({2428, <<"symix_1151">>}) -> 1;
reward_role({2429, <<"symix_1124">>}) -> 1;
reward_role({2429, <<"symlf_2957">>}) -> 1;
reward_role({2431, <<"symix2_1238">>}) -> 1;
reward_role({2432, <<"9377_1268">>}) -> 1;
reward_role({2432, <<"symix_479">>}) -> 1;
reward_role({2433, <<"symix_1001">>}) -> 1;
reward_role({2436, <<"symlf_2892">>}) -> 1;
reward_role({2437, <<"symix2_1178">>}) -> 1;
reward_role({244, <<"9377_1277">>}) -> 1;
reward_role({244, <<"symix_742">>}) -> 1;
reward_role({2443, <<"symix2_257">>}) -> 1;
reward_role({2444, <<"symlf_2838">>}) -> 1;
reward_role({2445, <<"symix2_1054">>}) -> 1;
reward_role({2446, <<"symlf_2690">>}) -> 1;
reward_role({2447, <<"symlf_2716">>}) -> 1;
reward_role({2448, <<"symlf_2822">>}) -> 1;
reward_role({2454, <<"9377_1200">>}) -> 1;
reward_role({2454, <<"symlf_2148">>}) -> 1;
reward_role({2455, <<"symix_695">>}) -> 1;
reward_role({2456, <<"symix_1254">>}) -> 1;
reward_role({2460, <<"symix2_921">>}) -> 1;
reward_role({2465, <<"symix2_1000">>}) -> 1;
reward_role({2467, <<"9377_1020">>}) -> 1;
reward_role({2469, <<"symix_783">>}) -> 1;
reward_role({247, <<"symlf_2769">>}) -> 1;
reward_role({2470, <<"symlf_1701">>}) -> 1;
reward_role({2473, <<"symix_1068">>}) -> 1;
reward_role({2475, <<"symlf_2554">>}) -> 1;
reward_role({2482, <<"symlf_2903">>}) -> 1;
reward_role({2488, <<"symix_1033">>}) -> 1;
reward_role({2488, <<"symix_1096">>}) -> 1;
reward_role({249, <<"9377_1362">>}) -> 1;
reward_role({2491, <<"icebird_316">>}) -> 1;
reward_role({2491, <<"symix_664">>}) -> 1;
reward_role({2496, <<"symlf_1928">>}) -> 1;
reward_role({2497, <<"symix_164">>}) -> 1;
reward_role({25, <<"symix_1110">>}) -> 1;
reward_role({2500, <<"icebird_645">>}) -> 1;
reward_role({2504, <<"symix2_926">>}) -> 1;
reward_role({2506, <<"9377_205">>}) -> 1;
reward_role({2506, <<"icebird_356">>}) -> 1;
reward_role({2508, <<"symix_983">>}) -> 1;
reward_role({2511, <<"symix2_1290">>}) -> 1;
reward_role({2511, <<"symix2_892">>}) -> 1;
reward_role({252, <<"symix2_1163">>}) -> 1;
reward_role({2525, <<"symix2_759">>}) -> 1;
reward_role({2526, <<"symlf_2891">>}) -> 1;
reward_role({2527, <<"symlf_147">>}) -> 1;
reward_role({2529, <<"symix_1082">>}) -> 1;
reward_role({2533, <<"symix_1162">>}) -> 1;
reward_role({2533, <<"symix_1289">>}) -> 1;
reward_role({2536, <<"symlf_2312">>}) -> 1;
reward_role({2540, <<"symix_1101">>}) -> 1;
reward_role({2543, <<"icebird_523">>}) -> 1;
reward_role({2546, <<"symix_1194">>}) -> 1;
reward_role({2546, <<"symlf_2939">>}) -> 1;
reward_role({2549, <<"symix_661">>}) -> 1;
reward_role({2551, <<"symix_1211">>}) -> 1;
reward_role({2556, <<"symix2_876">>}) -> 1;
reward_role({2557, <<"symix2_1200">>}) -> 1;
reward_role({2559, <<"9377_596">>}) -> 1;
reward_role({2559, <<"icebird_674">>}) -> 1;
reward_role({2559, <<"symix2_1028">>}) -> 1;
reward_role({2560, <<"symix_1129">>}) -> 1;
reward_role({2562, <<"symix_792">>}) -> 1;
reward_role({2564, <<"symix_1203">>}) -> 1;
reward_role({2566, <<"symlf_2293">>}) -> 1;
reward_role({2568, <<"symix_1173">>}) -> 1;
reward_role({2569, <<"symix_1085">>}) -> 1;
reward_role({2569, <<"symix_1210">>}) -> 1;
reward_role({257, <<"symix_1248">>}) -> 1;
reward_role({2570, <<"9377_714">>}) -> 1;
reward_role({2572, <<"symlf_1950">>}) -> 1;
reward_role({2573, <<"symix_1110">>}) -> 1;
reward_role({2574, <<"symix_1278">>}) -> 1;
reward_role({2577, <<"symlf_2746">>}) -> 1;
reward_role({2579, <<"symix_490">>}) -> 1;
reward_role({2579, <<"symlf_840">>}) -> 1;
reward_role({2581, <<"symix2_1177">>}) -> 1;
reward_role({2581, <<"symlf_194">>}) -> 1;
reward_role({2583, <<"9377_1352">>}) -> 1;
reward_role({2584, <<"symix_1213">>}) -> 1;
reward_role({2586, <<"icebird_706">>}) -> 1;
reward_role({2587, <<"symix_1153">>}) -> 1;
reward_role({2588, <<"symlf_2725">>}) -> 1;
reward_role({2598, <<"symlf_2899">>}) -> 1;
reward_role({2599, <<"symlf_2939">>}) -> 1;
reward_role({260, <<"9377_1283">>}) -> 1;
reward_role({2604, <<"symix_1158">>}) -> 1;
reward_role({2606, <<"9377_1231">>}) -> 1;
reward_role({2609, <<"symix2_1163">>}) -> 1;
reward_role({2609, <<"symix2_135">>}) -> 1;
reward_role({2612, <<"symix2_1041">>}) -> 1;
reward_role({2613, <<"9377_712">>}) -> 1;
reward_role({2613, <<"symix_761">>}) -> 1;
reward_role({262, <<"symix_911">>}) -> 1;
reward_role({2625, <<"symix_1264">>}) -> 1;
reward_role({2627, <<"9377_1367">>}) -> 1;
reward_role({2628, <<"9377_666">>}) -> 1;
reward_role({2629, <<"icebird_465">>}) -> 1;
reward_role({2630, <<"symlf_2623">>}) -> 1;
reward_role({2632, <<"icebird_362">>}) -> 1;
reward_role({2633, <<"9377_1242">>}) -> 1;
reward_role({2633, <<"symix2_396">>}) -> 1;
reward_role({2634, <<"symlf_2809">>}) -> 1;
reward_role({2635, <<"symix_922">>}) -> 1;
reward_role({2639, <<"symlf_1935">>}) -> 1;
reward_role({264, <<"9377_1023">>}) -> 1;
reward_role({2640, <<"symix2_995">>}) -> 1;
reward_role({2641, <<"9377_1332">>}) -> 1;
reward_role({2643, <<"symix_1310">>}) -> 1;
reward_role({2647, <<"symix2_499">>}) -> 1;
reward_role({2650, <<"icebird_256">>}) -> 1;
reward_role({2651, <<"symlf_2996">>}) -> 1;
reward_role({2653, <<"9377_1328">>}) -> 1;
reward_role({2654, <<"symlf_2574">>}) -> 1;
reward_role({2656, <<"9377_800">>}) -> 1;
reward_role({2657, <<"9377_491">>}) -> 1;
reward_role({2658, <<"icebird_678">>}) -> 1;
reward_role({2659, <<"symix2_950">>}) -> 1;
reward_role({266, <<"symlf_1713">>}) -> 1;
reward_role({2661, <<"symix_1300">>}) -> 1;
reward_role({2663, <<"symix_621">>}) -> 1;
reward_role({2665, <<"9377_1213">>}) -> 1;
reward_role({2666, <<"symix2_1216">>}) -> 1;
reward_role({2666, <<"symlf_2679">>}) -> 1;
reward_role({2670, <<"9377_285">>}) -> 1;
reward_role({2672, <<"icebird_707">>}) -> 1;
reward_role({2674, <<"symix_852">>}) -> 1;
reward_role({2674, <<"symix_951">>}) -> 1;
reward_role({2675, <<"symlf_2889">>}) -> 1;
reward_role({2677, <<"symix_614">>}) -> 1;
reward_role({2678, <<"9377_422">>}) -> 1;
reward_role({2678, <<"symix_1067">>}) -> 1;
reward_role({2681, <<"symlf_2978">>}) -> 1;
reward_role({2684, <<"symix2_158">>}) -> 1;
reward_role({2685, <<"9377_1337">>}) -> 1;
reward_role({2685, <<"icebird_742">>}) -> 1;
reward_role({2685, <<"symlf_2847">>}) -> 1;
reward_role({2687, <<"symix_1028">>}) -> 1;
reward_role({2690, <<"symlf_2737">>}) -> 1;
reward_role({2691, <<"icebird_213">>}) -> 1;
reward_role({2691, <<"symlf_2082">>}) -> 1;
reward_role({2693, <<"symix_1160">>}) -> 1;
reward_role({2697, <<"symix2_632">>}) -> 1;
reward_role({270, <<"symlf_2914">>}) -> 1;
reward_role({2702, <<"symix_1130">>}) -> 1;
reward_role({2703, <<"9377_1355">>}) -> 1;
reward_role({2705, <<"symix2_774">>}) -> 1;
reward_role({2708, <<"9377_186">>}) -> 1;
reward_role({2709, <<"symix_1263">>}) -> 1;
reward_role({2710, <<"icebird_580">>}) -> 1;
reward_role({2710, <<"symix_1240">>}) -> 1;
reward_role({2711, <<"symix_1292">>}) -> 1;
reward_role({2713, <<"symix_888">>}) -> 1;
reward_role({2714, <<"symix2_1249">>}) -> 1;
reward_role({2714, <<"symlf_2531">>}) -> 1;
reward_role({2717, <<"symix_1193">>}) -> 1;
reward_role({2719, <<"9377_1246">>}) -> 1;
reward_role({2719, <<"symix_1051">>}) -> 1;
reward_role({2720, <<"symix2_1172">>}) -> 1;
reward_role({2721, <<"icebird_703">>}) -> 1;
reward_role({2727, <<"symlf_2676">>}) -> 1;
reward_role({2730, <<"symix2_965">>}) -> 1;
reward_role({2730, <<"symlf_2528">>}) -> 1;
reward_role({2733, <<"icebird_681">>}) -> 1;
reward_role({2733, <<"symix_715">>}) -> 1;
reward_role({2735, <<"symlf_1867">>}) -> 1;
reward_role({2736, <<"9377_1331">>}) -> 1;
reward_role({2736, <<"9377_784">>}) -> 1;
reward_role({2739, <<"9377_1299">>}) -> 1;
reward_role({2743, <<"symix_1258">>}) -> 1;
reward_role({2746, <<"symix2_1199">>}) -> 1;
reward_role({2748, <<"9377_1305">>}) -> 1;
reward_role({2748, <<"9377_1326">>}) -> 1;
reward_role({2749, <<"symix_1248">>}) -> 1;
reward_role({2749, <<"symlf_1031">>}) -> 1;
reward_role({275, <<"symix2_1068">>}) -> 1;
reward_role({2752, <<"symlf_2877">>}) -> 1;
reward_role({2754, <<"symlf_2517">>}) -> 1;
reward_role({2761, <<"9377_1141">>}) -> 1;
reward_role({2761, <<"symlf_2864">>}) -> 1;
reward_role({2762, <<"symlf_1445">>}) -> 1;
reward_role({2768, <<"symix2_777">>}) -> 1;
reward_role({2770, <<"symix_908">>}) -> 1;
reward_role({2770, <<"symix2_1038">>}) -> 1;
reward_role({2774, <<"symix_1216">>}) -> 1;
reward_role({2779, <<"9377_1316">>}) -> 1;
reward_role({2781, <<"symix2_1084">>}) -> 1;
reward_role({2783, <<"symlf_2552">>}) -> 1;
reward_role({2785, <<"symix2_460">>}) -> 1;
reward_role({2787, <<"symlf_2398">>}) -> 1;
reward_role({2787, <<"symlf_2968">>}) -> 1;
reward_role({279, <<"9377_1368">>}) -> 1;
reward_role({2792, <<"symix2_1281">>}) -> 1;
reward_role({2793, <<"icebird_356">>}) -> 1;
reward_role({2798, <<"symlf_2955">>}) -> 1;
reward_role({28, <<"9377_1354">>}) -> 1;
reward_role({280, <<"9377_6">>}) -> 1;
reward_role({280, <<"icebird_795">>}) -> 1;
reward_role({280, <<"symlf_2922">>}) -> 1;
reward_role({28005, <<"symlf_1">>}) -> 2;
reward_role({2801, <<"symlf_2697">>}) -> 1;
reward_role({2803, <<"symlf_1986">>}) -> 1;
reward_role({2803, <<"symlf_2810">>}) -> 1;
reward_role({2807, <<"symix_1141">>}) -> 1;
reward_role({281, <<"symix2_1219">>}) -> 1;
reward_role({2810, <<"symlf_1259">>}) -> 1;
reward_role({2812, <<"symix_1240">>}) -> 1;
reward_role({2814, <<"symix_1162">>}) -> 1;
reward_role({2815, <<"symlf_2891">>}) -> 1;
reward_role({282, <<"symix_1199">>}) -> 1;
reward_role({2822, <<"icebird_654">>}) -> 1;
reward_role({2823, <<"symix_283">>}) -> 1;
reward_role({2824, <<"9377_1293">>}) -> 1;
reward_role({2825, <<"symlf_2924">>}) -> 1;
reward_role({2826, <<"icebird_698">>}) -> 1;
reward_role({2828, <<"symix2_1171">>}) -> 1;
reward_role({2830, <<"symlf_2915">>}) -> 1;
reward_role({2832, <<"tanwan_24">>}) -> 1;
reward_role({2834, <<"symix_1119">>}) -> 1;
reward_role({2835, <<"9377_1268">>}) -> 1;
reward_role({2836, <<"symlf_979">>}) -> 1;
reward_role({2837, <<"9377_1038">>}) -> 1;
reward_role({2839, <<"symlf_2538">>}) -> 1;
reward_role({2840, <<"symix_880">>}) -> 1;
reward_role({2840, <<"symix2_1058">>}) -> 1;
reward_role({2841, <<"9377_1363">>}) -> 1;
reward_role({2842, <<"symix_925">>}) -> 1;
reward_role({2842, <<"symix2_1139">>}) -> 1;
reward_role({2842, <<"symix2_856">>}) -> 1;
reward_role({2843, <<"9377_960">>}) -> 1;
reward_role({2843, <<"icebird_748">>}) -> 1;
reward_role({2847, <<"symix_912">>}) -> 1;
reward_role({2858, <<"9377_1343">>}) -> 1;
reward_role({2858, <<"symix2_1115">>}) -> 1;
reward_role({2859, <<"symlf_2701">>}) -> 1;
reward_role({2860, <<"symix2_1070">>}) -> 1;
reward_role({2866, <<"symlf_1805">>}) -> 1;
reward_role({2867, <<"9377_833">>}) -> 1;
reward_role({287, <<"symix_1206">>}) -> 1;
reward_role({287, <<"symix_870">>}) -> 1;
reward_role({287, <<"symlf_1452">>}) -> 1;
reward_role({2871, <<"symix_907">>}) -> 1;
reward_role({2873, <<"symlf_2904">>}) -> 1;
reward_role({2876, <<"symlf_2904">>}) -> 1;
reward_role({2879, <<"9377_1291">>}) -> 1;
reward_role({2879, <<"symix2_1099">>}) -> 1;
reward_role({288, <<"symix_1192">>}) -> 1;
reward_role({288, <<"symix2_633">>}) -> 1;
reward_role({2881, <<"icebird_93">>}) -> 1;
reward_role({2881, <<"symlf_2604">>}) -> 1;
reward_role({2883, <<"symlf_2916">>}) -> 1;
reward_role({2886, <<"symix2_700">>}) -> 1;
reward_role({2888, <<"symlf_2948">>}) -> 1;
reward_role({2892, <<"symlf_2226">>}) -> 1;
reward_role({2893, <<"symlf_2215">>}) -> 1;
reward_role({2895, <<"symix2_981">>}) -> 1;
reward_role({2895, <<"symlf_2799">>}) -> 1;
reward_role({2897, <<"symlf_2254">>}) -> 1;
reward_role({2899, <<"symix_1055">>}) -> 1;
reward_role({29, <<"symix2_1336">>}) -> 1;
reward_role({2901, <<"9377_1365">>}) -> 1;
reward_role({2901, <<"symix2_909">>}) -> 1;
reward_role({2905, <<"icebird_751">>}) -> 1;
reward_role({2907, <<"symix_1239">>}) -> 1;
reward_role({291, <<"symix_1152">>}) -> 1;
reward_role({2911, <<"symix2_747">>}) -> 1;
reward_role({2911, <<"symlf_2506">>}) -> 1;
reward_role({2913, <<"symlf_2785">>}) -> 1;
reward_role({2915, <<"symix_781">>}) -> 1;
reward_role({2915, <<"symlf_2749">>}) -> 1;
reward_role({2916, <<"symix2_1056">>}) -> 1;
reward_role({2917, <<"symix2_1123">>}) -> 1;
reward_role({2918, <<"symix_965">>}) -> 1;
reward_role({2918, <<"symix2_628">>}) -> 1;
reward_role({2920, <<"9377_567">>}) -> 1;
reward_role({2923, <<"symix_529">>}) -> 1;
reward_role({2924, <<"icebird_534">>}) -> 1;
reward_role({2925, <<"symix_337">>}) -> 1;
reward_role({2925, <<"symlf_2851">>}) -> 1;
reward_role({2929, <<"symlf_2969">>}) -> 1;
reward_role({2930, <<"symix2_857">>}) -> 1;
reward_role({2931, <<"symix2_883">>}) -> 1;
reward_role({2933, <<"9377_676">>}) -> 1;
reward_role({2933, <<"symix_1178">>}) -> 1;
reward_role({2935, <<"icebird_742">>}) -> 1;
reward_role({2935, <<"symlf_2954">>}) -> 1;
reward_role({2938, <<"symix2_887">>}) -> 1;
reward_role({2941, <<"symlf_2488">>}) -> 1;
reward_role({2943, <<"symix_1020">>}) -> 1;
reward_role({2944, <<"symix_1143">>}) -> 1;
reward_role({2951, <<"tanwan_87">>}) -> 1;
reward_role({2952, <<"symix_11">>}) -> 1;
reward_role({2954, <<"symlf_2745">>}) -> 1;
reward_role({2956, <<"9377_1363">>}) -> 1;
reward_role({2957, <<"symix_1036">>}) -> 1;
reward_role({296, <<"symix_1210">>}) -> 1;
reward_role({296, <<"symix2_800">>}) -> 1;
reward_role({2960, <<"symix_1199">>}) -> 1;
reward_role({2961, <<"symlf_2584">>}) -> 1;
reward_role({2964, <<"symix2_1084">>}) -> 1;
reward_role({2966, <<"symix2_771">>}) -> 1;
reward_role({2967, <<"symix_819">>}) -> 1;
reward_role({2969, <<"symlf_2966">>}) -> 1;
reward_role({2973, <<"symix2_516">>}) -> 1;
reward_role({2974, <<"symix_1266">>}) -> 1;
reward_role({2975, <<"symix2_627">>}) -> 1;
reward_role({298, <<"symix2_453">>}) -> 1;
reward_role({2981, <<"symlf_2401">>}) -> 1;
reward_role({2983, <<"symix_1189">>}) -> 1;
reward_role({2986, <<"symix_536">>}) -> 1;
reward_role({2986, <<"symlf_2515">>}) -> 1;
reward_role({2991, <<"symlf_2543">>}) -> 1;
reward_role({2998, <<"9377_1123">>}) -> 1;
reward_role({2998, <<"symix2_366">>}) -> 1;
reward_role({3, <<"9377ios_288">>}) -> 1;
reward_role({30, <<"symix2_1257">>}) -> 1;
reward_role({30, <<"symix2_1290">>}) -> 1;
reward_role({3000, <<"symlf_2826">>}) -> 1;
reward_role({3002, <<"symix2_1012">>}) -> 1;
reward_role({3006, <<"symix2_914">>}) -> 1;
reward_role({3007, <<"symlf_2425">>}) -> 1;
reward_role({301, <<"symix_865">>}) -> 1;
reward_role({3010, <<"symix_152">>}) -> 1;
reward_role({3010, <<"symlf_2917">>}) -> 1;
reward_role({3016, <<"symlf_2775">>}) -> 1;
reward_role({3017, <<"symix2_1208">>}) -> 1;
reward_role({3022, <<"symlf_2946">>}) -> 1;
reward_role({3024, <<"symix2_324">>}) -> 1;
reward_role({3028, <<"symix_1123">>}) -> 1;
reward_role({3028, <<"symlf_1394">>}) -> 1;
reward_role({3029, <<"symix_1129">>}) -> 1;
reward_role({3030, <<"symix2_277">>}) -> 1;
reward_role({3030, <<"symlf_143">>}) -> 1;
reward_role({3032, <<"symix_1028">>}) -> 1;
reward_role({3037, <<"9377_751">>}) -> 1;
reward_role({3043, <<"icebird_467">>}) -> 1;
reward_role({3045, <<"symix2_1220">>}) -> 1;
reward_role({3055, <<"9377_1232">>}) -> 1;
reward_role({3058, <<"symix_1216">>}) -> 1;
reward_role({3059, <<"symlf_1156">>}) -> 1;
reward_role({3062, <<"symix2_493">>}) -> 1;
reward_role({3066, <<"symlf_2894">>}) -> 1;
reward_role({307, <<"symix_1180">>}) -> 1;
reward_role({3071, <<"symix2_673">>}) -> 1;
reward_role({3089, <<"9377_1079">>}) -> 1;
reward_role({3092, <<"9377_1323">>}) -> 1;
reward_role({3093, <<"symlf_2541">>}) -> 1;
reward_role({3094, <<"symix2_620">>}) -> 1;
reward_role({3096, <<"symlf_2981">>}) -> 1;
reward_role({3096, <<"symlf_770">>}) -> 1;
reward_role({310, <<"9377_1369">>}) -> 1;
reward_role({3102, <<"symix_520">>}) -> 1;
reward_role({3104, <<"symix_772">>}) -> 1;
reward_role({3113, <<"symix2_977">>}) -> 1;
reward_role({3115, <<"icebird_611">>}) -> 1;
reward_role({3118, <<"symix2_461">>}) -> 1;
reward_role({3125, <<"symix_514">>}) -> 1;
reward_role({3125, <<"symix2_788">>}) -> 1;
reward_role({3128, <<"symix2_1313">>}) -> 1;
reward_role({3129, <<"icebird_475">>}) -> 1;
reward_role({313, <<"symlf_2934">>}) -> 1;
reward_role({3137, <<"symix2_767">>}) -> 1;
reward_role({3139, <<"symlf_2233">>}) -> 1;
reward_role({3143, <<"symix2_1232">>}) -> 1;
reward_role({3147, <<"9377ios_154">>}) -> 1;
reward_role({3148, <<"9377_1056">>}) -> 1;
reward_role({315, <<"symix_1315">>}) -> 1;
reward_role({3150, <<"symix_589">>}) -> 1;
reward_role({3153, <<"symlf_2928">>}) -> 1;
reward_role({3154, <<"symix_1043">>}) -> 1;
reward_role({3162, <<"symlf_2787">>}) -> 1;
reward_role({3163, <<"symlf_2954">>}) -> 1;
reward_role({3166, <<"9377_1358">>}) -> 1;
reward_role({3167, <<"symix_493">>}) -> 1;
reward_role({3170, <<"symix2_140">>}) -> 1;
reward_role({3180, <<"symix_1185">>}) -> 1;
reward_role({3185, <<"symlf_2786">>}) -> 1;
reward_role({3186, <<"9377_1334">>}) -> 1;
reward_role({3187, <<"9377_1205">>}) -> 1;
reward_role({3189, <<"symlf_2005">>}) -> 1;
reward_role({3189, <<"symlf_2717">>}) -> 1;
reward_role({3190, <<"symix_832">>}) -> 1;
reward_role({3195, <<"9377_258">>}) -> 1;
reward_role({3204, <<"symlf_2366">>}) -> 1;
reward_role({3208, <<"9377_1294">>}) -> 1;
reward_role({3208, <<"symix_811">>}) -> 1;
reward_role({321, <<"symlf_2874">>}) -> 1;
reward_role({3210, <<"symlf_1446">>}) -> 1;
reward_role({3212, <<"symix_423">>}) -> 1;
reward_role({3216, <<"symix2_1042">>}) -> 1;
reward_role({3219, <<"symlf_343">>}) -> 1;
reward_role({3222, <<"symix2_1240">>}) -> 1;
reward_role({3223, <<"symix2_796">>}) -> 1;
reward_role({3225, <<"icebird_550">>}) -> 1;
reward_role({323, <<"9377_550">>}) -> 1;
reward_role({3231, <<"9377_1229">>}) -> 1;
reward_role({3232, <<"symlf_2943">>}) -> 1;
reward_role({3233, <<"symlf_2238">>}) -> 1;
reward_role({3236, <<"9377_1223">>}) -> 1;
reward_role({3238, <<"9377_1291">>}) -> 1;
reward_role({3241, <<"symix_1124">>}) -> 1;
reward_role({3242, <<"symlf_2282">>}) -> 1;
reward_role({3247, <<"symlf_2677">>}) -> 1;
reward_role({3251, <<"9377_1245">>}) -> 1;
reward_role({3252, <<"icebird_705">>}) -> 1;
reward_role({3255, <<"symix_678">>}) -> 1;
reward_role({3256, <<"9377_1359">>}) -> 1;
reward_role({3259, <<"symlf_2969">>}) -> 1;
reward_role({326, <<"9377_966">>}) -> 1;
reward_role({3262, <<"symix2_1010">>}) -> 1;
reward_role({3263, <<"symix_990">>}) -> 1;
reward_role({3263, <<"symix2_438">>}) -> 1;
reward_role({3266, <<"symlf_2846">>}) -> 1;
reward_role({3269, <<"symix_910">>}) -> 1;
reward_role({3269, <<"symlf_2529">>}) -> 1;
reward_role({327, <<"symix_1286">>}) -> 1;
reward_role({327, <<"symix2_1220">>}) -> 1;
reward_role({3270, <<"symlf_2615">>}) -> 1;
reward_role({3271, <<"symix2_1010">>}) -> 1;
reward_role({3275, <<"symix_924">>}) -> 1;
reward_role({3280, <<"symix2_1212">>}) -> 1;
reward_role({3283, <<"symix2_283">>}) -> 1;
reward_role({329, <<"symix_1155">>}) -> 1;
reward_role({3290, <<"symlf_1368">>}) -> 1;
reward_role({3297, <<"9377_692">>}) -> 1;
reward_role({33, <<"symix2_1084">>}) -> 1;
reward_role({33, <<"symix2_1159">>}) -> 1;
reward_role({33, <<"symix2_884">>}) -> 1;
reward_role({330, <<"9377_1360">>}) -> 1;
reward_role({3301, <<"symix_477">>}) -> 1;
reward_role({3308, <<"symlf_1422">>}) -> 1;
reward_role({3314, <<"9377_1276">>}) -> 1;
reward_role({3316, <<"9377_1319">>}) -> 1;
reward_role({33172, <<"symix2_1">>}) -> 1;
reward_role({3318, <<"symix_1150">>}) -> 1;
reward_role({3318, <<"symlf_2490">>}) -> 1;
reward_role({332, <<"symix2_1053">>}) -> 1;
reward_role({3322, <<"symix2_208">>}) -> 1;
reward_role({3322, <<"symlf_2955">>}) -> 1;
reward_role({3324, <<"icebird_686">>}) -> 1;
reward_role({3325, <<"symlf_2071">>}) -> 1;
reward_role({3334, <<"9377_1344">>}) -> 1;
reward_role({3344, <<"symlf_2913">>}) -> 1;
reward_role({3345, <<"icebird_342">>}) -> 1;
reward_role({3347, <<"symix2_199">>}) -> 1;
reward_role({3349, <<"symix2_941">>}) -> 1;
reward_role({3349, <<"symlf_1714">>}) -> 1;
reward_role({335, <<"icebird_123">>}) -> 1;
reward_role({3353, <<"symlf_2348">>}) -> 1;
reward_role({3353, <<"symlf_2591">>}) -> 1;
reward_role({3354, <<"9377_960">>}) -> 1;
reward_role({3355, <<"icebird_574">>}) -> 1;
reward_role({3360, <<"symlf_2860">>}) -> 1;
reward_role({3361, <<"symlf_2818">>}) -> 1;
reward_role({3362, <<"symlf_2959">>}) -> 1;
reward_role({3365, <<"9377_1368">>}) -> 1;
reward_role({3365, <<"symix2_345">>}) -> 1;
reward_role({337, <<"9377ios_204">>}) -> 1;
reward_role({337, <<"symix_1287">>}) -> 1;
reward_role({3370, <<"symix_1014">>}) -> 1;
reward_role({3371, <<"9377_1355">>}) -> 1;
reward_role({3382, <<"icebird_377">>}) -> 1;
reward_role({3383, <<"symix2_644">>}) -> 1;
reward_role({3384, <<"symlf_1418">>}) -> 1;
reward_role({3386, <<"symlf_2184">>}) -> 1;
reward_role({3386, <<"symlf_2488">>}) -> 1;
reward_role({3391, <<"symix2_581">>}) -> 1;
reward_role({3393, <<"symix2_544">>}) -> 1;
reward_role({3395, <<"symix_1200">>}) -> 1;
reward_role({3396, <<"9377_1316">>}) -> 1;
reward_role({3399, <<"icebird_304">>}) -> 1;
reward_role({3402, <<"symlf_2793">>}) -> 1;
reward_role({3405, <<"9377_1218">>}) -> 1;
reward_role({3407, <<"symix2_1140">>}) -> 1;
reward_role({3412, <<"symix_891">>}) -> 1;
reward_role({3414, <<"9377_718">>}) -> 1;
reward_role({3415, <<"symlf_2807">>}) -> 1;
reward_role({3421, <<"symix2_797">>}) -> 1;
reward_role({3422, <<"icebird_508">>}) -> 1;
reward_role({3422, <<"symlf_2480">>}) -> 1;
reward_role({3434, <<"9377_762">>}) -> 1;
reward_role({344, <<"9377_1333">>}) -> 1;
reward_role({3442, <<"9377_183">>}) -> 1;
reward_role({3446, <<"symix_183">>}) -> 1;
reward_role({3448, <<"9377_633">>}) -> 1;
reward_role({3449, <<"symlf_2952">>}) -> 1;
reward_role({3452, <<"9377_891">>}) -> 1;
reward_role({3453, <<"symlf_2450">>}) -> 1;
reward_role({3455, <<"icebird_247">>}) -> 1;
reward_role({3457, <<"symlf_2823">>}) -> 1;
reward_role({3461, <<"symix_763">>}) -> 1;
reward_role({3462, <<"symlf_2847">>}) -> 1;
reward_role({3465, <<"9377ios_208">>}) -> 1;
reward_role({3466, <<"symix2_287">>}) -> 1;
reward_role({3466, <<"symix2_629">>}) -> 1;
reward_role({3468, <<"symix_665">>}) -> 1;
reward_role({3470, <<"symlf_2125">>}) -> 1;
reward_role({3473, <<"symlf_2928">>}) -> 1;
reward_role({3474, <<"symlf_2955">>}) -> 1;
reward_role({3475, <<"9377_938">>}) -> 1;
reward_role({3477, <<"symlf_2152">>}) -> 1;
reward_role({3479, <<"symlf_2911">>}) -> 1;
reward_role({3482, <<"icebird_270">>}) -> 1;
reward_role({3483, <<"symlf_2124">>}) -> 1;
reward_role({3484, <<"symix_957">>}) -> 1;
reward_role({3485, <<"symlf_2036">>}) -> 1;
reward_role({3492, <<"symix_2">>}) -> 1;
reward_role({3494, <<"symlf_2966">>}) -> 1;
reward_role({3495, <<"symlf_1381">>}) -> 1;
reward_role({35, <<"9377_1311">>}) -> 1;
reward_role({35, <<"icebird_777">>}) -> 1;
reward_role({3502, <<"symix2_899">>}) -> 1;
reward_role({3506, <<"icebird_549">>}) -> 1;
reward_role({3507, <<"9377_1280">>}) -> 1;
reward_role({3507, <<"symlf_2702">>}) -> 1;
reward_role({351, <<"symlf_2959">>}) -> 1;
reward_role({3510, <<"9377_85">>}) -> 1;
reward_role({3511, <<"symix_878">>}) -> 1;
reward_role({3511, <<"symix2_747">>}) -> 1;
reward_role({3512, <<"9377_1325">>}) -> 1;
reward_role({3518, <<"symix2_311">>}) -> 1;
reward_role({352, <<"9377_1229">>}) -> 1;
reward_role({3522, <<"symix2_1118">>}) -> 1;
reward_role({3528, <<"symlf_1177">>}) -> 1;
reward_role({3529, <<"symlf_1335">>}) -> 1;
reward_role({3533, <<"symix_159">>}) -> 1;
reward_role({3534, <<"9377_1233">>}) -> 1;
reward_role({355, <<"symix_1149">>}) -> 1;
reward_role({3551, <<"symlf_2780">>}) -> 1;
reward_role({3554, <<"symlf_2301">>}) -> 1;
reward_role({3554, <<"symlf_461">>}) -> 1;
reward_role({3559, <<"symix_1077">>}) -> 1;
reward_role({3562, <<"icebird_402">>}) -> 1;
reward_role({3566, <<"symlf_2924">>}) -> 1;
reward_role({3569, <<"9377_1233">>}) -> 1;
reward_role({3569, <<"symix_391">>}) -> 1;
reward_role({3574, <<"symix_1020">>}) -> 1;
reward_role({3574, <<"symlf_2858">>}) -> 1;
reward_role({3576, <<"symix2_1248">>}) -> 1;
reward_role({3576, <<"symlf_2319">>}) -> 1;
reward_role({3578, <<"symlf_2767">>}) -> 1;
reward_role({3580, <<"9377_1274">>}) -> 1;
reward_role({3587, <<"9377_1237">>}) -> 1;
reward_role({3589, <<"symlf_2815">>}) -> 1;
reward_role({3597, <<"symlf_2622">>}) -> 1;
reward_role({3599, <<"symlf_2198">>}) -> 1;
reward_role({3600, <<"symix_435">>}) -> 1;
reward_role({3605, <<"symlf_2634">>}) -> 1;
reward_role({3608, <<"symlf_2669">>}) -> 1;
reward_role({3609, <<"symlf_1146">>}) -> 1;
reward_role({361, <<"symlf_2804">>}) -> 1;
reward_role({3612, <<"symix2_430">>}) -> 1;
reward_role({3615, <<"symlf_2955">>}) -> 1;
reward_role({3620, <<"symlf_1561">>}) -> 1;
reward_role({3624, <<"9377_151">>}) -> 1;
reward_role({3626, <<"icebird_667">>}) -> 1;
reward_role({3627, <<"icebird_441">>}) -> 1;
reward_role({363, <<"symlf_2668">>}) -> 1;
reward_role({363, <<"symlf_85">>}) -> 1;
reward_role({3632, <<"symix2_398">>}) -> 1;
reward_role({3632, <<"symlf_2172">>}) -> 1;
reward_role({3633, <<"symlf_2870">>}) -> 1;
reward_role({3645, <<"symix2_901">>}) -> 1;
reward_role({3649, <<"icebird_74">>}) -> 1;
reward_role({3652, <<"symlf_2826">>}) -> 1;
reward_role({3654, <<"symlf_2053">>}) -> 1;
reward_role({3656, <<"9377_1115">>}) -> 1;
reward_role({3659, <<"symix_1034">>}) -> 1;
reward_role({366, <<"symlf_2796">>}) -> 1;
reward_role({3661, <<"symlf_2961">>}) -> 1;
reward_role({367, <<"9377_1358">>}) -> 1;
reward_role({3673, <<"symlf_751">>}) -> 1;
reward_role({3676, <<"symlf_1007">>}) -> 1;
reward_role({368, <<"symix2_1291">>}) -> 1;
reward_role({368, <<"symlf_1950">>}) -> 1;
reward_role({3684, <<"symlf_1971">>}) -> 1;
reward_role({3691, <<"symlf_1974">>}) -> 1;
reward_role({370, <<"icebird_781">>}) -> 1;
reward_role({3707, <<"icebird_202">>}) -> 1;
reward_role({371, <<"symlf_1636">>}) -> 1;
reward_role({3719, <<"9377_115">>}) -> 1;
reward_role({372, <<"icebird_789">>}) -> 1;
reward_role({3722, <<"9377_1323">>}) -> 1;
reward_role({3738, <<"symlf_1820">>}) -> 1;
reward_role({3740, <<"symix2_1123">>}) -> 1;
reward_role({3741, <<"9377_311">>}) -> 1;
reward_role({3745, <<"icebird_483">>}) -> 1;
reward_role({3747, <<"9377_599">>}) -> 1;
reward_role({3747, <<"symix2_596">>}) -> 1;
reward_role({375, <<"9377_1107">>}) -> 1;
reward_role({3758, <<"symix2_499">>}) -> 1;
reward_role({3761, <<"icebird_81">>}) -> 1;
reward_role({3768, <<"9377_1234">>}) -> 1;
reward_role({3770, <<"9377_1245">>}) -> 1;
reward_role({3771, <<"9377_1159">>}) -> 1;
reward_role({3771, <<"9377_306">>}) -> 1;
reward_role({3775, <<"symix2_1094">>}) -> 1;
reward_role({3775, <<"symlf_1448">>}) -> 1;
reward_role({3778, <<"9377_1251">>}) -> 1;
reward_role({3783, <<"symix2_28">>}) -> 1;
reward_role({3784, <<"symlf_2728">>}) -> 1;
reward_role({379, <<"symix_1314">>}) -> 1;
reward_role({379, <<"symix2_952">>}) -> 1;
reward_role({3790, <<"symlf_1725">>}) -> 1;
reward_role({3791, <<"symix2_95">>}) -> 1;
reward_role({3792, <<"symlf_2648">>}) -> 1;
reward_role({3794, <<"symlf_2887">>}) -> 1;
reward_role({3796, <<"symlf_1068">>}) -> 1;
reward_role({3799, <<"symix2_801">>}) -> 1;
reward_role({3809, <<"9377_1216">>}) -> 1;
reward_role({383, <<"symix_912">>}) -> 1;
reward_role({3832, <<"icebird_406">>}) -> 1;
reward_role({3832, <<"symix2_795">>}) -> 1;
reward_role({3833, <<"symix2_721">>}) -> 1;
reward_role({3834, <<"9377_261">>}) -> 1;
reward_role({3839, <<"symlf_2939">>}) -> 1;
reward_role({3841, <<"9377_307">>}) -> 1;
reward_role({3843, <<"symlf_2448">>}) -> 1;
reward_role({3843, <<"symlf_2958">>}) -> 1;
reward_role({3844, <<"9377_1313">>}) -> 1;
reward_role({3852, <<"icebird_241">>}) -> 1;
reward_role({3854, <<"symlf_2268">>}) -> 1;
reward_role({3860, <<"9377_1137">>}) -> 1;
reward_role({387, <<"symix2_1233">>}) -> 1;
reward_role({3875, <<"9377_197">>}) -> 1;
reward_role({3878, <<"icebird_234">>}) -> 1;
reward_role({3884, <<"symlf_2481">>}) -> 1;
reward_role({3888, <<"symix2_17">>}) -> 1;
reward_role({3889, <<"symlf_2795">>}) -> 1;
reward_role({389, <<"symix_1332">>}) -> 1;
reward_role({389, <<"symix2_86">>}) -> 1;
reward_role({3890, <<"symlf_2939">>}) -> 1;
reward_role({3891, <<"9377_1076">>}) -> 1;
reward_role({3901, <<"symix_674">>}) -> 1;
reward_role({3907, <<"symlf_2815">>}) -> 1;
reward_role({391, <<"icebird_358">>}) -> 1;
reward_role({391, <<"symlf_42">>}) -> 1;
reward_role({392, <<"9377_175">>}) -> 1;
reward_role({392, <<"symix_372">>}) -> 1;
reward_role({3923, <<"9377_944">>}) -> 1;
reward_role({3932, <<"symlf_2868">>}) -> 1;
reward_role({3939, <<"symlf_2598">>}) -> 1;
reward_role({394, <<"symix_1301">>}) -> 1;
reward_role({394, <<"symlf_2568">>}) -> 1;
reward_role({394, <<"symlf_2792">>}) -> 1;
reward_role({3946, <<"symix2_49">>}) -> 1;
reward_role({3948, <<"symlf_2307">>}) -> 1;
reward_role({3959, <<"symix2_771">>}) -> 1;
reward_role({3962, <<"symlf_2611">>}) -> 1;
reward_role({3972, <<"symix2_68">>}) -> 1;
reward_role({3976, <<"symlf_1383">>}) -> 1;
reward_role({3980, <<"symlf_2184">>}) -> 1;
reward_role({3984, <<"symlf_1403">>}) -> 1;
reward_role({3984, <<"symlf_1645">>}) -> 1;
reward_role({3988, <<"symlf_2625">>}) -> 1;
reward_role({4017, <<"symix_899">>}) -> 1;
reward_role({402, <<"symlf_1268">>}) -> 1;
reward_role({4027, <<"symix_65">>}) -> 1;
reward_role({4028, <<"symlf_2909">>}) -> 1;
reward_role({403, <<"symix_1158">>}) -> 1;
reward_role({403, <<"symix2_763">>}) -> 1;
reward_role({4032, <<"icebird_96">>}) -> 1;
reward_role({4037, <<"symlf_2717">>}) -> 1;
reward_role({4038, <<"symlf_1490">>}) -> 1;
reward_role({404, <<"symix_1177">>}) -> 1;
reward_role({4048, <<"9377_1267">>}) -> 1;
reward_role({4051, <<"symix_588">>}) -> 1;
reward_role({4057, <<"symlf_2610">>}) -> 1;
reward_role({4066, <<"9377_1335">>}) -> 1;
reward_role({4066, <<"symlf_2328">>}) -> 1;
reward_role({407, <<"symix2_1045">>}) -> 1;
reward_role({4070, <<"9377_359">>}) -> 1;
reward_role({408, <<"symix2_1261">>}) -> 1;
reward_role({4082, <<"9377_1304">>}) -> 1;
reward_role({4084, <<"symlf_673">>}) -> 1;
reward_role({4085, <<"9377_1314">>}) -> 1;
reward_role({4095, <<"symlf_1361">>}) -> 1;
reward_role({410, <<"9377_1342">>}) -> 1;
reward_role({411, <<"icebird_773">>}) -> 1;
reward_role({4110, <<"symlf_2467">>}) -> 1;
reward_role({4114, <<"9377_1263">>}) -> 1;
reward_role({4119, <<"symlf_2580">>}) -> 1;
reward_role({4132, <<"9377_288">>}) -> 1;
reward_role({4132, <<"symlf_2168">>}) -> 1;
reward_role({4145, <<"symlf_2102">>}) -> 1;
reward_role({4145, <<"symlf_2915">>}) -> 1;
reward_role({416, <<"symix2_1177">>}) -> 1;
reward_role({416, <<"symlf_2912">>}) -> 1;
reward_role({4175, <<"9377_1299">>}) -> 1;
reward_role({4183, <<"icebird_17">>}) -> 1;
reward_role({4183, <<"icebird_226">>}) -> 1;
reward_role({4184, <<"symlf_1122">>}) -> 1;
reward_role({4185, <<"9377_1278">>}) -> 1;
reward_role({4192, <<"symlf_2725">>}) -> 1;
reward_role({4197, <<"symlf_624">>}) -> 1;
reward_role({4206, <<"symlf_2438">>}) -> 1;
reward_role({4213, <<"symlf_1351">>}) -> 1;
reward_role({4222, <<"icebird_28">>}) -> 1;
reward_role({4229, <<"symix_1000">>}) -> 1;
reward_role({4232, <<"symlf_2871">>}) -> 1;
reward_role({424, <<"symlf_2357">>}) -> 1;
reward_role({4240, <<"symix2_1001">>}) -> 1;
reward_role({4256, <<"9377_1270">>}) -> 1;
reward_role({4264, <<"symlf_63">>}) -> 1;
reward_role({427, <<"9377_1126">>}) -> 1;
reward_role({427, <<"symix2_1248">>}) -> 1;
reward_role({4270, <<"9377_1333">>}) -> 1;
reward_role({429, <<"symix_1307">>}) -> 1;
reward_role({43, <<"9377ios_203">>}) -> 1;
reward_role({43, <<"symix_1298">>}) -> 1;
reward_role({430, <<"9377_1275">>}) -> 1;
reward_role({4319, <<"symlf_2915">>}) -> 1;
reward_role({4319, <<"symlf_847">>}) -> 1;
reward_role({432, <<"symix_689">>}) -> 1;
reward_role({4330, <<"symlf_2293">>}) -> 1;
reward_role({4335, <<"9377_1200">>}) -> 1;
reward_role({434, <<"icebird_784">>}) -> 1;
reward_role({434, <<"symix_577">>}) -> 1;
reward_role({434, <<"symix_920">>}) -> 1;
reward_role({4342, <<"symlf_2532">>}) -> 1;
reward_role({4343, <<"symlf_2597">>}) -> 1;
reward_role({4355, <<"symlf_1884">>}) -> 1;
reward_role({4357, <<"symlf_2479">>}) -> 1;
reward_role({436, <<"9377_457">>}) -> 1;
reward_role({4373, <<"symlf_2923">>}) -> 1;
reward_role({440, <<"symix_1236">>}) -> 1;
reward_role({4419, <<"symix_233">>}) -> 1;
reward_role({4434, <<"9377_1267">>}) -> 1;
reward_role({445, <<"symix_804">>}) -> 1;
reward_role({4470, <<"symlf_1798">>}) -> 1;
reward_role({448, <<"symix_1131">>}) -> 1;
reward_role({4488, <<"symlf_889">>}) -> 1;
reward_role({4498, <<"symlf_2220">>}) -> 1;
reward_role({4499, <<"symlf_2612">>}) -> 1;
reward_role({45001, <<"symix_1">>}) -> 1;
reward_role({4505, <<"symlf_846">>}) -> 1;
reward_role({4508, <<"symlf_2974">>}) -> 1;
reward_role({451, <<"9377_1049">>}) -> 1;
reward_role({4518, <<"symix2_601">>}) -> 1;
reward_role({453, <<"symix2_450">>}) -> 1;
reward_role({456, <<"9377_982">>}) -> 1;
reward_role({456, <<"symix2_848">>}) -> 1;
reward_role({457, <<"symix_1109">>}) -> 1;
reward_role({4579, <<"symix_701">>}) -> 1;
reward_role({4580, <<"icebird_2">>}) -> 1;
reward_role({4581, <<"symlf_1415">>}) -> 1;
reward_role({459, <<"symix_965">>}) -> 1;
reward_role({4590, <<"symlf_2489">>}) -> 1;
reward_role({4593, <<"symix2_677">>}) -> 1;
reward_role({4597, <<"symlf_1934">>}) -> 1;
reward_role({46, <<"symix_1298">>}) -> 1;
reward_role({461, <<"9377_767">>}) -> 1;
reward_role({461, <<"icebird_803">>}) -> 1;
reward_role({4611, <<"9377_1241">>}) -> 1;
reward_role({462, <<"symix_1292">>}) -> 1;
reward_role({46249, <<"symix_1">>}) -> 1;
reward_role({4630, <<"symlf_1352">>}) -> 1;
reward_role({465, <<"9377_1363">>}) -> 1;
reward_role({4661, <<"9377_1300">>}) -> 1;
reward_role({4663, <<"symlf_2224">>}) -> 1;
reward_role({467, <<"symix2_729">>}) -> 1;
reward_role({4679, <<"symlf_2085">>}) -> 1;
reward_role({469, <<"symix_1177">>}) -> 1;
reward_role({470, <<"symix2_1040">>}) -> 1;
reward_role({4708, <<"symlf_2501">>}) -> 1;
reward_role({4713, <<"symlf_960">>}) -> 1;
reward_role({4715, <<"symlf_2118">>}) -> 1;
reward_role({4722, <<"symlf_1676">>}) -> 1;
reward_role({4725, <<"symix2_701">>}) -> 1;
reward_role({4745, <<"symlf_996">>}) -> 1;
reward_role({4746, <<"symlf_2200">>}) -> 1;
reward_role({475, <<"symlf_2177">>}) -> 1;
reward_role({4764, <<"symlf_2912">>}) -> 1;
reward_role({4775, <<"symix2_353">>}) -> 1;
reward_role({480, <<"symlf_2909">>}) -> 1;
reward_role({4804, <<"symlf_2224">>}) -> 1;
reward_role({48072, <<"symlf_1">>}) -> 1;
reward_role({481, <<"symix_519">>}) -> 1;
reward_role({4812, <<"symlf_2270">>}) -> 1;
reward_role({4821, <<"symlf_2014">>}) -> 1;
reward_role({4840, <<"symlf_6">>}) -> 1;
reward_role({485, <<"9377ios_258">>}) -> 1;
reward_role({4871, <<"symlf_2415">>}) -> 1;
reward_role({4880, <<"symix_902">>}) -> 1;
reward_role({49, <<"icebird_785">>}) -> 1;
reward_role({49, <<"symix2_1150">>}) -> 1;
reward_role({4913, <<"symlf_1904">>}) -> 1;
reward_role({4929, <<"symix2_3">>}) -> 1;
reward_role({493, <<"symix2_1091">>}) -> 1;
reward_role({494, <<"9377_1095">>}) -> 1;
reward_role({495, <<"symlf_2976">>}) -> 1;
reward_role({496, <<"9377_645">>}) -> 1;
reward_role({4962, <<"symlf_2159">>}) -> 1;
reward_role({497, <<"symix_955">>}) -> 1;
reward_role({4975, <<"symlf_1817">>}) -> 1;
reward_role({499, <<"symix_1104">>}) -> 1;
reward_role({5007, <<"symlf_1912">>}) -> 1;
reward_role({501, <<"9377_1108">>}) -> 1;
reward_role({502, <<"symlf_2557">>}) -> 1;
reward_role({5020, <<"symlf_776">>}) -> 1;
reward_role({504, <<"symlf_2896">>}) -> 1;
reward_role({505, <<"symix_1249">>}) -> 1;
reward_role({50516, <<"symlf_1">>}) -> 1;
reward_role({5058, <<"symlf_2400">>}) -> 1;
reward_role({507, <<"symix_1182">>}) -> 1;
reward_role({5070, <<"symlf_2062">>}) -> 1;
reward_role({508, <<"icebird_224">>}) -> 1;
reward_role({508, <<"symlf_2436">>}) -> 1;
reward_role({5091, <<"symlf_2923">>}) -> 1;
reward_role({512, <<"symlf_2919">>}) -> 1;
reward_role({513, <<"symlf_2816">>}) -> 1;
reward_role({51383, <<"symix_1">>}) -> 1;
reward_role({515, <<"icebird_776">>}) -> 1;
reward_role({515, <<"symix_1329">>}) -> 1;
reward_role({5166, <<"symlf_1704">>}) -> 1;
reward_role({517, <<"symix_1175">>}) -> 1;
reward_role({518, <<"symix_1313">>}) -> 1;
reward_role({519, <<"symlf_423">>}) -> 1;
reward_role({522, <<"9377_1237">>}) -> 1;
reward_role({522, <<"symlf_2431">>}) -> 1;
reward_role({5229, <<"symlf_1636">>}) -> 1;
reward_role({5235, <<"symlf_2455">>}) -> 1;
reward_role({524, <<"icebird_99">>}) -> 1;
reward_role({5243, <<"symlf_1536">>}) -> 1;
reward_role({5251, <<"symlf_2909">>}) -> 1;
reward_role({526, <<"icebird_762">>}) -> 1;
reward_role({528, <<"9377_561">>}) -> 1;
reward_role({530, <<"symix_1032">>}) -> 1;
reward_role({533, <<"symix2_722">>}) -> 1;
reward_role({5347, <<"symlf_1450">>}) -> 1;
reward_role({535, <<"9377_1364">>}) -> 1;
reward_role({536, <<"symix_423">>}) -> 1;
reward_role({5366, <<"symlf_1982">>}) -> 1;
reward_role({541, <<"symix_1312">>}) -> 1;
reward_role({5423, <<"symlf_1892">>}) -> 1;
reward_role({544, <<"9377_766">>}) -> 1;
reward_role({544, <<"symix_1209">>}) -> 1;
reward_role({5442, <<"symix_94">>}) -> 1;
reward_role({545, <<"icebird_799">>}) -> 1;
reward_role({546, <<"symix2_425">>}) -> 1;
reward_role({5493, <<"icebird_226">>}) -> 1;
reward_role({55, <<"symlf_2901">>}) -> 1;
reward_role({550, <<"symix2_1268">>}) -> 1;
reward_role({551, <<"symlf_2890">>}) -> 1;
reward_role({552, <<"symlf_105">>}) -> 1;
reward_role({5526, <<"symlf_1539">>}) -> 1;
reward_role({555, <<"9377_822">>}) -> 1;
reward_role({556, <<"symix_1245">>}) -> 1;
reward_role({558, <<"symix_1322">>}) -> 1;
reward_role({5581, <<"symlf_1039">>}) -> 1;
reward_role({5612, <<"symlf_2066">>}) -> 1;
reward_role({56330, <<"symix2_1">>}) -> 1;
reward_role({565, <<"symix2_1318">>}) -> 1;
reward_role({566, <<"symix_1155">>}) -> 1;
reward_role({567, <<"symlf_2203">>}) -> 1;
reward_role({57, <<"9377_962">>}) -> 1;
reward_role({5716, <<"symlf_1302">>}) -> 1;
reward_role({572, <<"symlf_2545">>}) -> 1;
reward_role({573, <<"icebird_370">>}) -> 1;
reward_role({574, <<"symix_334">>}) -> 1;
reward_role({579, <<"symix_938">>}) -> 1;
reward_role({582, <<"symix2_951">>}) -> 1;
reward_role({58254, <<"symix2_1">>}) -> 1;
reward_role({583, <<"symix_1230">>}) -> 1;
reward_role({5866, <<"symlf_1722">>}) -> 1;
reward_role({5875, <<"symix_1001">>}) -> 1;
reward_role({588, <<"symlf_2908">>}) -> 1;
reward_role({591, <<"9377_640">>}) -> 1;
reward_role({5911, <<"symix2_3">>}) -> 1;
reward_role({592, <<"symlf_2845">>}) -> 1;
reward_role({594, <<"symix2_468">>}) -> 1;
reward_role({595, <<"symlf_1281">>}) -> 1;
reward_role({596, <<"symix2_1089">>}) -> 1;
reward_role({596, <<"symix2_29">>}) -> 1;
reward_role({599, <<"symix2_1105">>}) -> 1;
reward_role({6, <<"symlf_2973">>}) -> 1;
reward_role({601, <<"9377_1160">>}) -> 1;
reward_role({603, <<"symix2_1256">>}) -> 1;
reward_role({603, <<"symix2_1259">>}) -> 1;
reward_role({60654, <<"symix_1">>}) -> 1;
reward_role({608, <<"symix2_800">>}) -> 1;
reward_role({611, <<"symix2_1245">>}) -> 1;
reward_role({612, <<"symix_1202">>}) -> 1;
reward_role({6146, <<"symlf_2385">>}) -> 1;
reward_role({616, <<"symix_993">>}) -> 1;
reward_role({616, <<"symlf_2975">>}) -> 1;
reward_role({617, <<"symix_1111">>}) -> 1;
reward_role({619, <<"9377_1250">>}) -> 1;
reward_role({625, <<"symix_1119">>}) -> 1;
reward_role({625, <<"symix_1249">>}) -> 1;
reward_role({627, <<"symlf_2912">>}) -> 1;
reward_role({629, <<"9377_1213">>}) -> 1;
reward_role({632, <<"9377_1351">>}) -> 1;
reward_role({633, <<"symlf_2108">>}) -> 1;
reward_role({640, <<"9377_1278">>}) -> 1;
reward_role({6411, <<"symlf_1903">>}) -> 1;
reward_role({643, <<"symlf_2896">>}) -> 1;
reward_role({644, <<"symix_1178">>}) -> 1;
reward_role({6454, <<"symlf_93">>}) -> 1;
reward_role({646, <<"9377_348">>}) -> 1;
reward_role({646, <<"symix2_1091">>}) -> 1;
reward_role({6475, <<"symlf_2056">>}) -> 1;
reward_role({649, <<"symix_1184">>}) -> 1;
reward_role({655, <<"symix_1327">>}) -> 1;
reward_role({656, <<"symix_1159">>}) -> 1;
reward_role({6564, <<"symlf_2367">>}) -> 1;
reward_role({6566, <<"symlf_1912">>}) -> 1;
reward_role({657, <<"icebird_747">>}) -> 1;
reward_role({657, <<"symix_330">>}) -> 1;
reward_role({657, <<"symix_969">>}) -> 1;
reward_role({658, <<"symix_1087">>}) -> 1;
reward_role({65874, <<"symix2_1">>}) -> 1;
reward_role({66, <<"9377_1341">>}) -> 1;
reward_role({660, <<"symix_1271">>}) -> 1;
reward_role({66197, <<"symix_1">>}) -> 1;
reward_role({664, <<"symix2_1245">>}) -> 1;
reward_role({666, <<"icebird_317">>}) -> 1;
reward_role({666, <<"symix_1264">>}) -> 1;
reward_role({67, <<"symix_1267">>}) -> 1;
reward_role({67, <<"symlf_680">>}) -> 1;
reward_role({67, <<"tanwan_108">>}) -> 1;
reward_role({671, <<"symlf_2974">>}) -> 1;
reward_role({67171, <<"symix2_1">>}) -> 1;
reward_role({673, <<"symix_1295">>}) -> 1;
reward_role({681, <<"symlf_2889">>}) -> 1;
reward_role({683, <<"symix2_1273">>}) -> 1;
reward_role({68738, <<"symix_1">>}) -> 1;
reward_role({688, <<"symix_814">>}) -> 1;
reward_role({689, <<"symix_1272">>}) -> 1;
reward_role({689, <<"symlf_2961">>}) -> 1;
reward_role({690, <<"symlf_2908">>}) -> 1;
reward_role({694, <<"icebird_694">>}) -> 1;
reward_role({69532, <<"symix_1">>}) -> 1;
reward_role({699, <<"9377_636">>}) -> 1;
reward_role({700, <<"symix2_766">>}) -> 1;
reward_role({701, <<"symix2_1167">>}) -> 1;
reward_role({70107, <<"symlf_1">>}) -> 1;
reward_role({702, <<"icebird_319">>}) -> 1;
reward_role({704, <<"symix_1305">>}) -> 1;
reward_role({707, <<"symix_1182">>}) -> 1;
reward_role({7129, <<"9377_620">>}) -> 1;
reward_role({715, <<"symlf_2914">>}) -> 1;
reward_role({7150, <<"symlf_2500">>}) -> 1;
reward_role({719, <<"symix_652">>}) -> 1;
reward_role({72, <<"symix2_780">>}) -> 1;
reward_role({723, <<"symix_373">>}) -> 1;
reward_role({724, <<"symix2_865">>}) -> 1;
reward_role({724, <<"symlf_2903">>}) -> 1;
reward_role({724, <<"symlf_2984">>}) -> 1;
reward_role({725, <<"symix_1195">>}) -> 1;
reward_role({726, <<"9377_1209">>}) -> 1;
reward_role({73, <<"9377_1327">>}) -> 1;
reward_role({730, <<"symix2_177">>}) -> 1;
reward_role({732, <<"symix2_886">>}) -> 1;
reward_role({737, <<"9377_802">>}) -> 1;
reward_role({738, <<"symlf_2986">>}) -> 1;
reward_role({74, <<"9377_1331">>}) -> 1;
reward_role({741, <<"symix_1206">>}) -> 1;
reward_role({742, <<"symlf_1782">>}) -> 1;
reward_role({744, <<"symlf_2255">>}) -> 1;
reward_role({745, <<"symix2_852">>}) -> 1;
reward_role({75, <<"symix2_1274">>}) -> 1;
reward_role({751, <<"symlf_2521">>}) -> 1;
reward_role({753, <<"symlf_2751">>}) -> 1;
reward_role({757, <<"symlf_1803">>}) -> 1;
reward_role({759, <<"9377_208">>}) -> 1;
reward_role({759, <<"icebird_768">>}) -> 1;
reward_role({761, <<"tanwan_88">>}) -> 1;
reward_role({763, <<"symix2_1283">>}) -> 1;
reward_role({764, <<"symix_1270">>}) -> 1;
reward_role({76595, <<"symlf_1">>}) -> 1;
reward_role({766, <<"symlf_2961">>}) -> 1;
reward_role({77, <<"symlf_2238">>}) -> 1;
reward_role({779, <<"symlf_2912">>}) -> 1;
reward_role({782, <<"symix2_673">>}) -> 1;
reward_role({784, <<"symix_1117">>}) -> 1;
reward_role({785, <<"icebird_104">>}) -> 1;
reward_role({786, <<"9377_1121">>}) -> 1;
reward_role({786, <<"symix_723">>}) -> 1;
reward_role({787, <<"symix2_1285">>}) -> 1;
reward_role({788, <<"symix_1026">>}) -> 1;
reward_role({79, <<"9377_1301">>}) -> 1;
reward_role({79, <<"symix2_927">>}) -> 1;
reward_role({791, <<"symlf_2386">>}) -> 1;
reward_role({796, <<"symix_697">>}) -> 1;
reward_role({796, <<"symlf_2213">>}) -> 1;
reward_role({8, <<"icebird_704">>}) -> 1;
reward_role({8, <<"symix_1194">>}) -> 1;
reward_role({8, <<"symix_1236">>}) -> 1;
reward_role({8, <<"symix2_1224">>}) -> 1;
reward_role({80, <<"symix2_1184">>}) -> 1;
reward_role({80, <<"symlf_2887">>}) -> 1;
reward_role({803, <<"9377_1367">>}) -> 1;
reward_role({805, <<"symix_1100">>}) -> 1;
reward_role({807, <<"symix_1133">>}) -> 1;
reward_role({81, <<"icebird_766">>}) -> 1;
reward_role({811, <<"symix2_1201">>}) -> 1;
reward_role({81199, <<"symlf_1">>}) -> 1;
reward_role({812, <<"symlf_2915">>}) -> 1;
reward_role({813, <<"symix_1196">>}) -> 1;
reward_role({813, <<"symix2_1285">>}) -> 1;
reward_role({814, <<"symix_200">>}) -> 1;
reward_role({816, <<"icebird_765">>}) -> 1;
reward_role({818, <<"symix_826">>}) -> 1;
reward_role({819, <<"9377_1296">>}) -> 1;
reward_role({819, <<"9377_1320">>}) -> 1;
reward_role({819, <<"symix2_174">>}) -> 1;
reward_role({82, <<"icebird_636">>}) -> 1;
reward_role({82, <<"symix2_1257">>}) -> 1;
reward_role({82, <<"symlf_2886">>}) -> 1;
reward_role({821, <<"symlf_1380">>}) -> 1;
reward_role({823, <<"9377_1276">>}) -> 1;
reward_role({824, <<"symix_1338">>}) -> 1;
reward_role({824, <<"symix2_908">>}) -> 1;
reward_role({826, <<"icebird_517">>}) -> 1;
reward_role({828, <<"symix2_1159">>}) -> 1;
reward_role({832, <<"symix2_1306">>}) -> 1;
reward_role({833, <<"9377_1293">>}) -> 1;
reward_role({835, <<"icebird_767">>}) -> 1;
reward_role({83693, <<"symlf_1">>}) -> 1;
reward_role({838, <<"symix_1179">>}) -> 1;
reward_role({84, <<"9377_1220">>}) -> 1;
reward_role({84, <<"9377_628">>}) -> 1;
reward_role({843, <<"icebird_272">>}) -> 1;
reward_role({843, <<"symix_1241">>}) -> 1;
reward_role({844, <<"symlf_2241">>}) -> 1;
reward_role({848, <<"9377_1087">>}) -> 1;
reward_role({854, <<"symlf_2897">>}) -> 1;
reward_role({855, <<"icebird_777">>}) -> 1;
reward_role({855, <<"symlf_2060">>}) -> 1;
reward_role({855, <<"symlf_2909">>}) -> 1;
reward_role({856, <<"symix_1286">>}) -> 1;
reward_role({85680, <<"symlf_1">>}) -> 1;
reward_role({857, <<"symix_1087">>}) -> 1;
reward_role({857, <<"symix_951">>}) -> 1;
reward_role({858, <<"symlf_1706">>}) -> 1;
reward_role({860, <<"symix_1228">>}) -> 1;
reward_role({860, <<"symix2_1207">>}) -> 1;
reward_role({864, <<"symix_1219">>}) -> 1;
reward_role({864, <<"symix_1288">>}) -> 1;
reward_role({866, <<"symix2_149">>}) -> 1;
reward_role({867, <<"symlf_2919">>}) -> 1;
reward_role({87, <<"symix_767">>}) -> 1;
reward_role({870, <<"9377ios_172">>}) -> 1;
reward_role({875, <<"symlf_2338">>}) -> 1;
reward_role({88, <<"icebird_787">>}) -> 1;
reward_role({881, <<"symlf_570">>}) -> 1;
reward_role({884, <<"9377_901">>}) -> 1;
reward_role({886, <<"symlf_2471">>}) -> 1;
reward_role({887, <<"symix_1055">>}) -> 1;
reward_role({887, <<"symix2_1227">>}) -> 1;
reward_role({887, <<"symlf_2257">>}) -> 1;
reward_role({889, <<"symix_1251">>}) -> 1;
reward_role({89, <<"symlf_2148">>}) -> 1;
reward_role({890, <<"9377_1232">>}) -> 1;
reward_role({9, <<"icebird_660">>}) -> 1;
reward_role({9, <<"symix_1127">>}) -> 1;
reward_role({9, <<"symlf_2932">>}) -> 1;
reward_role({900, <<"9377_659">>}) -> 1;
reward_role({900, <<"symix_1191">>}) -> 1;
reward_role({903, <<"9377_1318">>}) -> 1;
reward_role({903, <<"symix2_1234">>}) -> 1;
reward_role({907, <<"symix_195">>}) -> 1;
reward_role({908, <<"symix2_1247">>}) -> 1;
reward_role({91, <<"symlf_2767">>}) -> 1;
reward_role({916, <<"symix2_1175">>}) -> 1;
reward_role({916, <<"symix2_1191">>}) -> 1;
reward_role({917, <<"symix_1096">>}) -> 1;
reward_role({918, <<"symix_1056">>}) -> 1;
reward_role({918, <<"symlf_2843">>}) -> 1;
reward_role({919, <<"symix_1209">>}) -> 1;
reward_role({919, <<"symix2_632">>}) -> 1;
reward_role({920, <<"symlf_1941">>}) -> 1;
reward_role({924, <<"9377_1015">>}) -> 1;
reward_role({928, <<"symix_347">>}) -> 1;
reward_role({928, <<"symlf_2147">>}) -> 1;
reward_role({93, <<"9377ios_281">>}) -> 1;
reward_role({931, <<"symix_1004">>}) -> 1;
reward_role({932, <<"9377_1366">>}) -> 1;
reward_role({934, <<"9377_1045">>}) -> 1;
reward_role({934, <<"symix_1076">>}) -> 1;
reward_role({936, <<"icebird_758">>}) -> 1;
reward_role({936, <<"symix2_1158">>}) -> 1;
reward_role({938, <<"symix_1228">>}) -> 1;
reward_role({939, <<"symix2_1325">>}) -> 1;
reward_role({94, <<"symix2_1054">>}) -> 1;
reward_role({94, <<"symlf_2921">>}) -> 1;
reward_role({941, <<"symix_1242">>}) -> 1;
reward_role({944, <<"symix2_909">>}) -> 1;
reward_role({948, <<"symlf_2179">>}) -> 1;
reward_role({95, <<"icebird_653">>}) -> 1;
reward_role({951, <<"9377_890">>}) -> 1;
reward_role({952, <<"symix_1017">>}) -> 1;
reward_role({952, <<"symlf_2932">>}) -> 1;
reward_role({957, <<"symlf_2634">>}) -> 1;
reward_role({958, <<"symlf_2926">>}) -> 1;
reward_role({959, <<"symix_901">>}) -> 1;
reward_role({960, <<"symix2_1259">>}) -> 1;
reward_role({960, <<"symix2_980">>}) -> 1;
reward_role({962, <<"symix2_622">>}) -> 1;
reward_role({963, <<"symix_946">>}) -> 1;
reward_role({965, <<"9377ios_240">>}) -> 1;
reward_role({97, <<"icebird_767">>}) -> 1;
reward_role({970, <<"symix2_1208">>}) -> 1;
reward_role({972, <<"symlf_2630">>}) -> 1;
reward_role({974, <<"symix_1026">>}) -> 1;
reward_role({975, <<"symix2_1213">>}) -> 1;
reward_role({978, <<"symix_1206">>}) -> 1;
reward_role({979, <<"icebird_754">>}) -> 1;
reward_role({980, <<"symix_995">>}) -> 1;
reward_role({980, <<"symix2_804">>}) -> 1;
reward_role({981, <<"symix2_1332">>}) -> 1;
reward_role({981, <<"symlf_1268">>}) -> 1;
reward_role({982, <<"symix_1268">>}) -> 1;
reward_role({989, <<"symix_967">>}) -> 1;
reward_role({989, <<"symlf_2487">>}) -> 1;
reward_role({992, <<"symix_863">>}) -> 1;
reward_role({994, <<"9377_861">>}) -> 1;
reward_role({996, <<"symlf_2766">>}) -> 1;
reward_role(_) -> 0.


