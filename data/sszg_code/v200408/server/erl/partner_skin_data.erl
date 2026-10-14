-file("data/partner_skin_data.erl", 1).

-file("src/mod/data/partner_skin_data.erl", 1).

-module(partner_skin_data).

-lager_records([]).

-export([get_constant/1, get_name/1,
	 get_skin_owner_id/1, get_face_id/1, get_looks_id/1,
	 get_skins_by_partner_id/1, get_attr/1]).

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

-file("src/mod/data/partner_skin_data.erl", 16).

get_constant(skin_open) -> {lev, 35};
get_constant(_) -> undefined.

get_name(101) ->
    lang:get(<<"Naruto Uzumaki [Tuxedo]"/utf8>>);
get_name(102) -> lang:get(<<"Sakura Warrior"/utf8>>);
get_name(105) ->
    lang:get(<<"Itachi Uchiha:  [Tuxedo]"/utf8>>);
get_name(106) -> lang:get(<<"Guy Punk Rock"/utf8>>);
get_name(107) ->
    lang:get(<<"Toneri Otsutsuki:  Chế Độ Thức Tỉnh"/utf8>>);
get_name(108) -> lang:get(<<"Konan: Hầu gái"/utf8>>);
get_name(109) ->
    lang:get(<<"Shisui Uchiha: Anbu"/utf8>>);
get_name(110) ->
    lang:get(<<"Kushina Uzumaki[Bãi Biển]"/utf8>>);
get_name(111) ->
    lang:get(<<"Sakura Haruno[Swimsuit]"/utf8>>);
get_name(112) -> lang:get(<<"Gaara [Halloween]"/utf8>>);
get_name(113) ->
    lang:get(<<"Kaguya [Night Goddess]"/utf8>>);
get_name(114) ->
    lang:get(<<"Sakura [The Rambles Of Spring]"/utf8>>);
get_name(115) ->
    lang:get(<<"Sasuke [The Rambles Of Spring]"/utf8>>);
get_name(116) ->
    lang:get(<<"Naruto [Sexy Jutsu]"/utf8>>);
get_name(117) ->
    lang:get(<<"Pain [Hiệp khách bãi biển]"/utf8>>);
get_name(118) ->
    lang:get(<<"Naruto [Cyber Ranger]"/utf8>>);
get_name(119) ->
    lang:get(<<"Neji [Naughty Dragon]"/utf8>>);
get_name(120) ->
    lang:get(<<"Koji Kashin [Sage Mode]"/utf8>>);
get_name(121) ->
    lang:get(<<"Madara [Demon Slayer]"/utf8>>);
get_name(123) ->
    lang:get(<<"Madara [Demon Slayer (Bright)]"/utf8>>);
get_name(124) ->
    lang:get(<<"[The Rambles of Spring] (Daybreak)"/utf8>>);
get_name(125) ->
    lang:get(<<"[The Rambles of Spring] (Daybreak)"/utf8>>);
get_name(126) ->
    lang:get(<<"Kaguya [Night Goddess] (Elegance)"/utf8>>);
get_name(201) ->
    lang:get(<<"Hiruzen Sarutobi: S"/utf8>>);
get_name(202) -> lang:get(<<"Asuma Sarutobi: S"/utf8>>);
get_name(203) -> lang:get(<<"Zabuza Momochi: S"/utf8>>);
get_name(_Info) ->
    logger:data_error("get_name_data_not_exist===>~w",
		      [_Info], partner_skin_data, 34),
    undefined.

get_skin_owner_id(101) -> 30508;
get_skin_owner_id(102) -> 10511;
get_skin_owner_id(105) -> 20504;
get_skin_owner_id(106) -> 40504;
get_skin_owner_id(107) -> 50504;
get_skin_owner_id(108) -> 30511;
get_skin_owner_id(109) -> 20508;
get_skin_owner_id(110) -> 40506;
get_skin_owner_id(111) -> 10511;
get_skin_owner_id(112) -> 30502;
get_skin_owner_id(113) -> 50510;
get_skin_owner_id(114) -> 10511;
get_skin_owner_id(115) -> 50511;
get_skin_owner_id(116) -> 30508;
get_skin_owner_id(117) -> 30510;
get_skin_owner_id(118) -> 40511;
get_skin_owner_id(119) -> 30513;
get_skin_owner_id(120) -> 40513;
get_skin_owner_id(121) -> 50502;
get_skin_owner_id(123) -> 20511;
get_skin_owner_id(124) -> 40519;
get_skin_owner_id(125) -> 50522;
get_skin_owner_id(126) -> 50523;
get_skin_owner_id(201) -> 20507;
get_skin_owner_id(202) -> 30504;
get_skin_owner_id(203) -> 10504;
get_skin_owner_id(_Info) ->
    logger:data_error("get_skin_owner_id_data_not_exist===>~w",
		      [_Info], partner_skin_data, 50),
    undefined.

get_face_id(101) -> 2001;
get_face_id(102) -> 2002;
get_face_id(105) -> 2005;
get_face_id(106) -> 2006;
get_face_id(107) -> 2007;
get_face_id(108) -> 2008;
get_face_id(109) -> 2003;
get_face_id(110) -> 2012;
get_face_id(111) -> 2030;
get_face_id(112) -> 2004;
get_face_id(113) -> 2031;
get_face_id(114) -> 2010;
get_face_id(115) -> 2011;
get_face_id(116) -> 2009;
get_face_id(117) -> 2013;
get_face_id(118) -> 2014;
get_face_id(119) -> 2015;
get_face_id(120) -> 40513;
get_face_id(121) -> 2020;
get_face_id(123) -> 2022;
get_face_id(124) -> 2023;
get_face_id(125) -> 2024;
get_face_id(126) -> 2025;
get_face_id(201) -> 5001;
get_face_id(202) -> 5002;
get_face_id(203) -> 5003;
get_face_id(_Info) ->
    logger:data_error("get_face_id_data_not_exist===>~w",
		      [_Info], partner_skin_data, 66),
    undefined.

get_looks_id(101) -> [500001, 500002];
get_looks_id(102) -> [500011, 500012];
get_looks_id(105) -> [500041, 500042];
get_looks_id(106) -> [500051, 500052];
get_looks_id(107) -> [500061, 500062];
get_looks_id(108) -> [500071, 500072];
get_looks_id(109) -> [500081, 500082];
get_looks_id(110) -> [500111, 500112];
get_looks_id(111) -> [500013, 500014];
get_looks_id(112) -> [500015, 500016];
get_looks_id(113) -> [500091, 500092];
get_looks_id(114) -> [500101, 500102];
get_looks_id(115) -> [500121, 500122];
get_looks_id(116) -> [500131, 500132];
get_looks_id(117) -> [500161, 500162, 500141, 500142];
get_looks_id(118) ->
    [500151, 500152, 500153, 500161, 500162];
get_looks_id(119) -> [500171, 500172];
get_looks_id(120) -> [500181, 500182];
get_looks_id(121) -> [500191, 500192];
get_looks_id(123) -> [500211, 500212];
get_looks_id(124) -> [500221, 500222];
get_looks_id(125) -> [500231, 500232];
get_looks_id(126) -> [500241, 500242];
get_looks_id(201) -> [600001];
get_looks_id(202) -> [600002];
get_looks_id(203) -> [600003];
get_looks_id(_Info) ->
    logger:data_error("get_looks_id_data_not_exist===>~w",
		      [_Info], partner_skin_data, 82),
    undefined.

get_skins_by_partner_id(30502) -> [112];
get_skins_by_partner_id(40506) -> [110];
get_skins_by_partner_id(20508) -> [109];
get_skins_by_partner_id(30511) -> [108];
get_skins_by_partner_id(50504) -> [107];
get_skins_by_partner_id(40504) -> [106];
get_skins_by_partner_id(20504) -> [105];
get_skins_by_partner_id(10511) -> [102, 111, 114];
get_skins_by_partner_id(30508) -> [101, 116];
get_skins_by_partner_id(50510) -> [113];
get_skins_by_partner_id(50511) -> [115];
get_skins_by_partner_id(30510) -> [117];
get_skins_by_partner_id(40511) -> [118];
get_skins_by_partner_id(30513) -> [119];
get_skins_by_partner_id(40513) -> [120];
get_skins_by_partner_id(50512) -> [120];
get_skins_by_partner_id(50502) -> [121];
get_skins_by_partner_id(20514) -> [122];
get_skins_by_partner_id(20511) -> [123];
get_skins_by_partner_id(40519) -> [124];
get_skins_by_partner_id(50522) -> [125];
get_skins_by_partner_id(50523) -> [126];
get_skins_by_partner_id(20507) -> [201];
get_skins_by_partner_id(30504) -> [202];
get_skins_by_partner_id(10504) -> [203];
get_skins_by_partner_id(_) -> [].

get_attr(101) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(102) ->
    [{atk_per, 20}, {hp_max_per, 20}, {cure, 30}];
get_attr(105) ->
    [{atk_per, 20}, {hp_max_per, 20}, {def_per, 20}];
get_attr(106) ->
    [{atk_per, 20}, {hp_max_per, 20}, {speed, 3}];
get_attr(107) ->
    [{crit_ratio, 30}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(108) ->
    [{atk_per, 20}, {hp_max_per, 20}, {speed, 3}];
get_attr(109) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_ratio, 30}];
get_attr(110) ->
    [{atk_per, 20}, {hp_max_per, 20}, {speed, 3}];
get_attr(111) ->
    [{hp_max_per, 20}, {def_per, 20}, {dodge_magic, 20}];
get_attr(112) ->
    [{atk_per, 20}, {hp_max_per, 20}, {cure, 30}];
get_attr(113) ->
    [{atk_per, 20}, {hp_max_per, 20}, {dodge_magic, 20}];
get_attr(114) ->
    [{atk_per, 20}, {hp_max_per, 20}, {cure, 30}];
get_attr(115) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(116) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(117) ->
    [{atk_per, 20}, {hp_max_per, 20}, {dodge_magic, 20}];
get_attr(118) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(119) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(120) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(121) ->
    [{atk_per, 20}, {hp_max_per, 20}, {speed, 3}];
get_attr(123) ->
    [{def_per, 20}, {hp_max_per, 20}, {dodge_magic, 20}];
get_attr(124) ->
    [{def_per, 20}, {hp_max_per, 20}, {speed, 3}];
get_attr(125) ->
    [{atk_per, 20}, {hp_max_per, 20}, {hit_magic, 20}];
get_attr(126) ->
    [{atk_per, 20}, {hp_max_per, 20}, {dodge_magic, 20}];
get_attr(201) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(202) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(203) ->
    [{atk_per, 20}, {hp_max_per, 20}, {crit_rate, 20}];
get_attr(_Info) ->
    logger:data_error("get_attr_data_not_exist===>~w",
		      [_Info], partner_skin_data, 111),
    undefined.


