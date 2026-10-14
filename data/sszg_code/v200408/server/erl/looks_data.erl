-file("data/looks_data.erl", 1).

-file("data/looks_data.erl", 1).

-file("src/mod/data/looks_data.erl", 1).

-module(looks_data).

-lager_records([]).

-export([list/0, get/1, get_looks_id/1, get_attr/1,
	 get_pre/1]).

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

-file("src/mod/data/looks_data.erl", 14).

list() ->
    [160541, 260541, 360541, 160582, 260582, 360582, 170534,
     270534, 370534, 120519, 220519, 320519, 170525, 270525,
     370525, 170512, 270512, 370512, 160538, 260538, 360538,
     170505, 270505, 370505, 190517, 290517, 390517, 150519,
     250519, 350519, 185002, 285002, 385002, 160506, 260506,
     360506, 170514, 270514, 370514, 140513, 240513, 340513,
     440513, 120515, 220515, 320515, 150517, 250517, 350517,
     500631, 500632, 150516, 250516, 350516, 150515, 250515,
     350515, 140516, 240516, 340516, 140517, 240517, 340517,
     110517, 210517, 310517, 500451, 500452, 500381, 500382,
     160502, 260502, 360502, 170523, 270523, 370523, 500651,
     500652, 110516, 210516, 310516, 500099, 170515, 270515,
     370515, 500089, 1170522, 2170522, 3170522, 160501,
     260501, 360501, 160503, 260503, 360503, 130517, 230517,
     330517, 120516, 220516, 320516, 130516, 230516, 330516,
     1160501, 2160501, 3160501, 150518, 250518, 350518,
     600201, 600202, 600301, 600302, 170503, 270503, 370503,
     470503, 1160502, 2160502, 3160502, 4160502, 110515,
     210515, 310515, 410515, 140515, 240515, 340515, 440515,
     350514, 450514, 130515, 230515, 330515, 430515, 180000,
     280000, 380000, 480000, 160000, 260000, 360000, 460000,
     120600, 220600, 320600, 420600, 150602, 250602, 350602,
     450602, 150601, 250601, 350601, 450601, 163000, 263000,
     363000, 463000, 162000, 262000, 362000, 462000, 161000,
     261000, 361000, 461000, 110101, 110201, 110202, 110301,
     110302, 110303, 110304, 110305, 110401, 110402, 110403,
     110404, 110405, 110501, 110502, 110503, 110504, 110505,
     110506, 110507, 110508, 110509, 110510, 110511, 110512,
     110513, 110514, 210501, 210502, 210503, 210504, 210505,
     210506, 210507, 210508, 210509, 210510, 210511, 210512,
     210513, 210514, 310501, 310502, 310503, 310504, 310505,
     310507, 310510, 310511, 310512, 310513, 310514, 410501,
     410502, 410503, 410504, 410505, 410507, 410510, 410511,
     410512, 410513, 410514, 120101, 120201, 120202, 120301,
     120302, 120303, 120304, 120305, 120401, 120402, 120403,
     120404, 120405, 120501, 120502, 120503, 120504, 120505,
     120506, 120507, 120508, 120509, 120510, 120511, 120512,
     120513, 120514, 220501, 220502, 220503, 220504, 220505,
     220506, 220507, 220508, 220509, 220510, 220511, 220512,
     220513, 220514, 320501, 320502, 320504, 320505, 320507,
     320508, 320509, 320510, 320511, 320512, 320513, 320514,
     420501, 420502, 420504, 420505, 420507, 420508, 420509,
     420510, 420511, 420512, 420513, 420514, 130101, 130201,
     130202, 130301, 130302, 130303, 130304, 130305, 130401,
     130402, 130403, 130404, 130405, 130499, 130501, 130502,
     130503, 130504, 130505, 130506, 130507, 130508, 130509,
     130510, 130511, 130512, 130513, 130514, 130599, 230501,
     230502, 230503, 230504, 230505, 230506, 230507, 230508,
     230509, 230510, 230511, 230512, 230513, 230514, 330501,
     330502, 330504, 330506, 330507, 330508, 330509, 330510,
     330511, 330512, 330513, 330514, 430501, 430502, 430504,
     430506, 430507, 430508, 430509, 430510, 430511, 430512,
     430513, 430514, 140301, 140401, 140402, 140403, 140404,
     140501, 140502, 140503, 140504, 140505, 140506, 140507,
     140508, 140509, 140510, 140511, 140512, 140514, 240501,
     240502, 240503, 240504, 240505, 240506, 240507, 240508,
     240509, 240510, 240511, 240512, 240514, 340502, 340503,
     340504, 340506, 340507, 340508, 340509, 340510, 340511,
     340512, 340514, 440502, 440503, 440504, 440506, 440507,
     440508, 440509, 440510, 440511, 440512, 440514, 150301,
     150401, 150402, 150403, 150404, 150501, 150502, 150503,
     150504, 150505, 150506, 150507, 150508, 150509, 150510,
     150511, 150512, 150513, 250501, 250502, 250503, 250504,
     250505, 250506, 250507, 250508, 250509, 250510, 250511,
     250512, 250513, 350502, 350503, 350504, 350505, 350507,
     350508, 350509, 350510, 350511, 350512, 350513, 450502,
     450503, 450504, 450505, 450507, 450508, 450509, 450510,
     450511, 450512, 450513, 500001, 500002, 500011, 500012,
     500041, 500042, 500051, 500052, 500061, 500062, 500071,
     500072, 500081, 500082, 500111, 500112, 500013, 500014,
     500015, 500016, 500091, 500092, 500101, 500102, 500121,
     500122, 500131, 500132, 500017, 500018, 500161, 500162,
     500019, 500020, 110518, 210518, 310518, 410518, 120517,
     220517, 320517, 420517, 120518, 220518, 320518, 420518,
     130518, 230518, 330518, 430518, 140518, 240518, 340518,
     440518, 140519, 240519, 340519, 440519, 140520, 140521,
     140522, 240520, 240521, 240522, 340520, 340521, 340522,
     440520, 440521, 440522, 150520, 150521, 150522, 250520,
     250521, 250522, 350520, 350521, 350522, 450520, 450521,
     450522, 150519, 250519, 350519, 500141, 500142, 500151,
     500152, 500153, 500161, 500162, 500171, 500172, 500181,
     500182, 500191, 500192, 500201, 500202, 500211, 500212,
     500221, 500222, 600001, 600002, 600003, 150523, 250523,
     350523, 450523, 550523, 140523, 240523, 340523, 440523,
     150923, 250923, 350923, 450923, 140524, 240524, 340524,
     440524, 500231, 500232, 500241, 500242, 140923, 240923,
     340923, 440923, 150524, 250524, 350524, 450524].

get(110101) ->
    #{id => 110101, partner_id => 10101,
      ico_id => <<"H30012">>,
      name => lang:get(<<"莉莉丝"/utf8>>), star => 1, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110201) ->
    #{id => 110201, partner_id => 10201,
      ico_id => <<"H30018">>, name => lang:get(<<"巫女"/utf8>>),
      star => 2, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(110202) ->
    #{id => 110202, partner_id => 10202,
      ico_id => <<"H30030">>,
      name => lang:get(<<"兽族步兵"/utf8>>), star => 2, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110301) ->
    #{id => 110301, partner_id => 10301,
      ico_id => <<"H30001">>,
      name => lang:get(<<"魔法女学徒"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110302) ->
    #{id => 110302, partner_id => 10302,
      ico_id => <<"H30029">>,
      name => lang:get(<<"美狄亚"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110303) ->
    #{id => 110303, partner_id => 10303,
      ico_id => <<"H30055">>,
      name => lang:get(<<"破坏者"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110304) ->
    #{id => 110304, partner_id => 10304,
      ico_id => <<"H30057">>,
      name => lang:get(<<"埃恩德隆"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110305) ->
    #{id => 110305, partner_id => 10305,
      ico_id => <<"H30067">>,
      name => lang:get(<<"月之骑士"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110401) ->
    #{id => 110401, partner_id => 10401,
      ico_id => <<"H30009">>, name => lang:get(<<"亚瑟"/utf8>>),
      star => 4, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(110402) ->
    #{id => 110402, partner_id => 10402,
      ico_id => <<"H30070">>,
      name => lang:get(<<"竖琴海妖"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110403) ->
    #{id => 110403, partner_id => 10403,
      ico_id => <<"H30039">>,
      name => lang:get(<<"水元素"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110404) ->
    #{id => 110404, partner_id => 10404,
      ico_id => <<"H30084">>,
      name => lang:get(<<"冰晶女巫"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110405) ->
    #{id => 110405, partner_id => 10405,
      ico_id => <<"H30005">>,
      name => lang:get(<<"娜迦侍女"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110501) ->
    #{id => 110501, partner_id => 10501,
      ico_id => <<"H30015">>,
      name => lang:get(<<"娜迦公主"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110502) ->
    #{id => 110502, partner_id => 10502,
      ico_id => <<"H30072">>,
      name => lang:get(<<"冰雪女王"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110503) ->
    #{id => 110503, partner_id => 10503,
      ico_id => <<"H30021">>,
      name => lang:get(<<"冰霜巨龙"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110504) ->
    #{id => 110504, partner_id => 10504,
      ico_id => <<"H30080">>, name => lang:get(<<"泰坦"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(110505) ->
    #{id => 110505, partner_id => 10505,
      ico_id => <<"H30065">>,
      name => lang:get(<<"波塞冬"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110506) ->
    #{id => 110506, partner_id => 10506,
      ico_id => <<"H30071">>,
      name => lang:get(<<"派西斯"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110507) ->
    #{id => 110507, partner_id => 10507,
      ico_id => <<"H30079">>,
      name => lang:get(<<"少年梅林"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110508) ->
    #{id => 110508, partner_id => 10508,
      ico_id => <<"H30083">>,
      name => lang:get(<<"海宁芙"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110509) ->
    #{id => 110509, partner_id => 10509,
      ico_id => <<"H30053">>,
      name => lang:get(<<"阿瑞斯"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110510) ->
    #{id => 110510, partner_id => 10510,
      ico_id => <<"H30097">>,
      name => lang:get(<<"耶梦加得"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110511) ->
    #{id => 110511, partner_id => 10511,
      ico_id => <<"H30102">>, name => lang:get(<<"酒神"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(110512) ->
    #{id => 110512, partner_id => 10512,
      ico_id => <<"H30113">>,
      name => lang:get(<<"利维坦"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(110513) ->
    #{id => 110513, partner_id => 10513,
      ico_id => <<"H10513">>,
      name => lang:get(<<"Shikamaru Nara"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(110514) ->
    #{id => 110514, partner_id => 10514,
      ico_id => <<"H10514">>,
      name =>
	  lang:get(<<"Kisame Hoshigaki:  Chế Độ Samehada"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(162000) ->
    #{id => 162000, partner_id => 62000,
      ico_id => <<"H62000">>,
      name => lang:get(<<"Utakata"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(210501) ->
    #{id => 210501, partner_id => 10501,
      ico_id => <<"H31015">>,
      name => lang:get(<<"娜迦公主"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210502) ->
    #{id => 210502, partner_id => 10502,
      ico_id => <<"H31072">>,
      name => lang:get(<<"冰雪女王"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210503) ->
    #{id => 210503, partner_id => 10503,
      ico_id => <<"H31021">>,
      name => lang:get(<<"冰霜巨龙"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210504) ->
    #{id => 210504, partner_id => 10504,
      ico_id => <<"H31080">>, name => lang:get(<<"泰坦"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(210505) ->
    #{id => 210505, partner_id => 10505,
      ico_id => <<"H31065">>,
      name => lang:get(<<"波塞冬"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210506) ->
    #{id => 210506, partner_id => 10506,
      ico_id => <<"H31071">>,
      name => lang:get(<<"派西斯"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210507) ->
    #{id => 210507, partner_id => 10507,
      ico_id => <<"H31079">>,
      name => lang:get(<<"少年梅林"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210508) ->
    #{id => 210508, partner_id => 10508,
      ico_id => <<"H31083">>,
      name => lang:get(<<"海宁芙"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210509) ->
    #{id => 210509, partner_id => 10509,
      ico_id => <<"H31053">>,
      name => lang:get(<<"阿瑞斯"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210510) ->
    #{id => 210510, partner_id => 10510,
      ico_id => <<"H31097">>,
      name => lang:get(<<"耶梦加得"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210511) ->
    #{id => 210511, partner_id => 10511,
      ico_id => <<"H31102">>, name => lang:get(<<"酒神"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(210512) ->
    #{id => 210512, partner_id => 10512,
      ico_id => <<"H31110">>,
      name => lang:get(<<"利维坦"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(210513) ->
    #{id => 210513, partner_id => 10513,
      ico_id => <<"H10513">>,
      name => lang:get(<<"Shikamaru Nara"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(210514) ->
    #{id => 210514, partner_id => 10514,
      ico_id => <<"H10514">>,
      name =>
	  lang:get(<<"Kisame Hoshigaki:  Chế Độ Samehada"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(262000) ->
    #{id => 262000, partner_id => 62000,
      ico_id => <<"H62000">>,
      name => lang:get(<<"Utakata"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(310501) ->
    #{id => 310501, partner_id => 10501,
      ico_id => <<"H32015">>,
      name => lang:get(<<"娜迦公主"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(310502) ->
    #{id => 310502, partner_id => 10502,
      ico_id => <<"H32072">>,
      name => lang:get(<<"冰雪女王"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(310503) ->
    #{id => 310503, partner_id => 10503,
      ico_id => <<"H32021">>,
      name => lang:get(<<"冰霜巨龙"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(310504) ->
    #{id => 310504, partner_id => 10504,
      ico_id => <<"H32080">>, name => lang:get(<<"泰坦"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(310505) ->
    #{id => 310505, partner_id => 10505,
      ico_id => <<"H32065">>,
      name => lang:get(<<"波塞冬"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(310507) ->
    #{id => 310507, partner_id => 10507,
      ico_id => <<"H32079">>,
      name => lang:get(<<"少年梅林"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(310510) ->
    #{id => 310510, partner_id => 10510,
      ico_id => <<"H32097">>,
      name => lang:get(<<"耶梦加得"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(310511) ->
    #{id => 310511, partner_id => 10511,
      ico_id => <<"H32102">>, name => lang:get(<<"酒神"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(310512) ->
    #{id => 310512, partner_id => 10512,
      ico_id => <<"H32110">>,
      name => lang:get(<<"利维坦"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(310513) ->
    #{id => 310513, partner_id => 10513,
      ico_id => <<"H10513">>,
      name => lang:get(<<"Shikamaru Nara"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(310514) ->
    #{id => 310514, partner_id => 10514,
      ico_id => <<"H10514">>,
      name =>
	  lang:get(<<"Kisame Hoshigaki:  Chế Độ Samehada"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(362000) ->
    #{id => 362000, partner_id => 62000,
      ico_id => <<"H62000">>,
      name => lang:get(<<"Utakata"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(410501) ->
    #{id => 410501, partner_id => 10501,
      ico_id => <<"H32015">>,
      name => lang:get(<<"娜迦公主"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(410502) ->
    #{id => 410502, partner_id => 10502,
      ico_id => <<"H32072">>,
      name => lang:get(<<"冰雪女王"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(410503) ->
    #{id => 410503, partner_id => 10503,
      ico_id => <<"H32021">>,
      name => lang:get(<<"冰霜巨龙"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(410504) ->
    #{id => 410504, partner_id => 10504,
      ico_id => <<"H32080">>, name => lang:get(<<"泰坦"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(410505) ->
    #{id => 410505, partner_id => 10505,
      ico_id => <<"H32065">>,
      name => lang:get(<<"波塞冬"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(410507) ->
    #{id => 410507, partner_id => 10507,
      ico_id => <<"H32079">>,
      name => lang:get(<<"少年梅林"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(410510) ->
    #{id => 410510, partner_id => 10510,
      ico_id => <<"H32097">>,
      name => lang:get(<<"耶梦加得"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(410511) ->
    #{id => 410511, partner_id => 10511,
      ico_id => <<"H32102">>, name => lang:get(<<"酒神"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(410512) ->
    #{id => 410512, partner_id => 10512,
      ico_id => <<"H32110">>,
      name => lang:get(<<"利维坦"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(410513) ->
    #{id => 410513, partner_id => 10513,
      ico_id => <<"H10513">>,
      name => lang:get(<<"Shikamaru Nara"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(410514) ->
    #{id => 410514, partner_id => 10514,
      ico_id => <<"H10514">>,
      name =>
	  lang:get(<<"Kisame Hoshigaki:  Chế Độ Samehada"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(462000) ->
    #{id => 462000, partner_id => 62000,
      ico_id => <<"H62000">>,
      name => lang:get(<<"Utakata"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(120101) ->
    #{id => 120101, partner_id => 20101,
      ico_id => <<"H30022">>,
      name => lang:get(<<"地狱犬"/utf8>>), star => 1, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120201) ->
    #{id => 120201, partner_id => 20201,
      ico_id => <<"H30066">>,
      name => lang:get(<<"死灵巫师"/utf8>>), star => 2, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120202) ->
    #{id => 120202, partner_id => 20202,
      ico_id => <<"H30088">>,
      name => lang:get(<<"精灵希尔"/utf8>>), star => 2, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120301) ->
    #{id => 120301, partner_id => 20301,
      ico_id => <<"H30006">>,
      name => lang:get(<<"邪狼·加鲁鲁"/utf8>>), star => 3,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(120302) ->
    #{id => 120302, partner_id => 20302,
      ico_id => <<"H30007">>,
      name => lang:get(<<"末日守卫"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120303) ->
    #{id => 120303, partner_id => 20303,
      ico_id => <<"H30014">>,
      name => lang:get(<<"维京海盗"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120304) ->
    #{id => 120304, partner_id => 20304,
      ico_id => <<"H30028">>,
      name => lang:get(<<"地狱火"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120305) ->
    #{id => 120305, partner_id => 20305,
      ico_id => <<"H30049">>,
      name => lang:get(<<"奥杜尔·铜须"/utf8>>), star => 3,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(120401) ->
    #{id => 120401, partner_id => 20401,
      ico_id => <<"H30020">>,
      name => lang:get(<<"火枪艾克"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120402) ->
    #{id => 120402, partner_id => 20402,
      ico_id => <<"H30069">>,
      name => lang:get(<<"凯瑟琳"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120403) ->
    #{id => 120403, partner_id => 20403,
      ico_id => <<"H30082">>,
      name => lang:get(<<"阿伽门农"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120404) ->
    #{id => 120404, partner_id => 20404,
      ico_id => <<"H30087">>,
      name => lang:get(<<"雷诺蛮锤"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120405) ->
    #{id => 120405, partner_id => 20405,
      ico_id => <<"H30045">>, name => lang:get(<<"翼女"/utf8>>),
      star => 4, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(120501) ->
    #{id => 120501, partner_id => 20501,
      ico_id => <<"H30062">>,
      name => lang:get(<<"炽天使"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120502) ->
    #{id => 120502, partner_id => 20502,
      ico_id => <<"H30061">>,
      name => lang:get(<<"炎魔之王"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120503) ->
    #{id => 120503, partner_id => 20503,
      ico_id => <<"H30050">>,
      name => lang:get(<<"剑豪卡赞"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120504) ->
    #{id => 120504, partner_id => 20504,
      ico_id => <<"H30019">>,
      name => lang:get(<<"菲尼克斯"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120505) ->
    #{id => 120505, partner_id => 20505,
      ico_id => <<"H30078">>,
      name => lang:get(<<"阿波罗"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120506) ->
    #{id => 120506, partner_id => 20506,
      ico_id => <<"H30060">>,
      name => lang:get(<<"吸血伯爵"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120507) ->
    #{id => 120507, partner_id => 20507,
      ico_id => <<"H30092">>,
      name => lang:get(<<"普罗米修斯"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120508) ->
    #{id => 120508, partner_id => 20508,
      ico_id => <<"H30093">>,
      name => lang:get(<<"瓦尔基里"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120509) ->
    #{id => 120509, partner_id => 20509,
      ico_id => <<"H30096">>, name => lang:get(<<"洛基"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(120510) ->
    #{id => 120510, partner_id => 20510,
      ico_id => <<"H30104">>, name => lang:get(<<"哪吒"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(120511) ->
    #{id => 120511, partner_id => 20511,
      ico_id => <<"H30107">>,
      name => lang:get(<<"海姆达尔"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120512) ->
    #{id => 120512, partner_id => 20512,
      ico_id => <<"H30112">>,
      name => lang:get(<<"阿奇丽"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(120513) ->
    #{id => 120513, partner_id => 20513,
      ico_id => <<"H20513">>,
      name => lang:get(<<"Kakashi: Susanoo"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(220501) ->
    #{id => 220501, partner_id => 20501,
      ico_id => <<"H31062">>,
      name => lang:get(<<"炽天使"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220502) ->
    #{id => 220502, partner_id => 20502,
      ico_id => <<"H31061">>,
      name => lang:get(<<"炎魔之王"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220503) ->
    #{id => 220503, partner_id => 20503,
      ico_id => <<"H31050">>,
      name => lang:get(<<"剑豪卡赞"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220504) ->
    #{id => 220504, partner_id => 20504,
      ico_id => <<"H31019">>,
      name => lang:get(<<"菲尼克斯"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220505) ->
    #{id => 220505, partner_id => 20505,
      ico_id => <<"H31078">>,
      name => lang:get(<<"阿波罗"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220506) ->
    #{id => 220506, partner_id => 20506,
      ico_id => <<"H31060">>,
      name => lang:get(<<"吸血伯爵"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220507) ->
    #{id => 220507, partner_id => 20507,
      ico_id => <<"H31092">>,
      name => lang:get(<<"普罗米修斯"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220508) ->
    #{id => 220508, partner_id => 20508,
      ico_id => <<"H31093">>,
      name => lang:get(<<"瓦尔基里"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220509) ->
    #{id => 220509, partner_id => 20509,
      ico_id => <<"H31096">>, name => lang:get(<<"洛基"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(220510) ->
    #{id => 220510, partner_id => 20510,
      ico_id => <<"H31104">>, name => lang:get(<<"哪吒"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(220511) ->
    #{id => 220511, partner_id => 20511,
      ico_id => <<"H31107">>,
      name => lang:get(<<"海姆达尔"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220512) ->
    #{id => 220512, partner_id => 20512,
      ico_id => <<"H31112">>,
      name => lang:get(<<"阿奇丽"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(220513) ->
    #{id => 220513, partner_id => 20513,
      ico_id => <<"H20513">>,
      name => lang:get(<<"Kakashi: Susanoo"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(320501) ->
    #{id => 320501, partner_id => 20501,
      ico_id => <<"H32062">>,
      name => lang:get(<<"炽天使"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(320502) ->
    #{id => 320502, partner_id => 20502,
      ico_id => <<"H32061">>,
      name => lang:get(<<"炎魔之王"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(320504) ->
    #{id => 320504, partner_id => 20504,
      ico_id => <<"H32019">>,
      name => lang:get(<<"菲尼克斯"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(320505) ->
    #{id => 320505, partner_id => 20505,
      ico_id => <<"H32078">>,
      name => lang:get(<<"阿波罗"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(320507) ->
    #{id => 320507, partner_id => 20507,
      ico_id => <<"H32092">>,
      name => lang:get(<<"普罗米修斯"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(320508) ->
    #{id => 320508, partner_id => 20508,
      ico_id => <<"H32093">>,
      name => lang:get(<<"瓦尔基里"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(320509) ->
    #{id => 320509, partner_id => 20509,
      ico_id => <<"H32096">>, name => lang:get(<<"洛基"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(320510) ->
    #{id => 320510, partner_id => 20510,
      ico_id => <<"H32104">>, name => lang:get(<<"哪吒"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(320511) ->
    #{id => 320511, partner_id => 20511,
      ico_id => <<"H32107">>,
      name => lang:get(<<"海姆达尔"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(320512) ->
    #{id => 320512, partner_id => 20512,
      ico_id => <<"H32112">>,
      name => lang:get(<<"阿奇丽"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(320513) ->
    #{id => 320513, partner_id => 20513,
      ico_id => <<"H20513">>,
      name => lang:get(<<"Kakashi: Susanoo"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(420501) ->
    #{id => 420501, partner_id => 20501,
      ico_id => <<"H32062">>,
      name => lang:get(<<"炽天使"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(420502) ->
    #{id => 420502, partner_id => 20502,
      ico_id => <<"H32061">>,
      name => lang:get(<<"炎魔之王"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(420504) ->
    #{id => 420504, partner_id => 20504,
      ico_id => <<"H32019">>,
      name => lang:get(<<"菲尼克斯"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(420505) ->
    #{id => 420505, partner_id => 20505,
      ico_id => <<"H32078">>,
      name => lang:get(<<"阿波罗"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(420507) ->
    #{id => 420507, partner_id => 20507,
      ico_id => <<"H32092">>,
      name => lang:get(<<"普罗米修斯"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(420508) ->
    #{id => 420508, partner_id => 20508,
      ico_id => <<"H32093">>,
      name => lang:get(<<"瓦尔基里"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(420509) ->
    #{id => 420509, partner_id => 20509,
      ico_id => <<"H32096">>, name => lang:get(<<"洛基"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(420510) ->
    #{id => 420510, partner_id => 20510,
      ico_id => <<"H32104">>, name => lang:get(<<"哪吒"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(420511) ->
    #{id => 420511, partner_id => 20511,
      ico_id => <<"H32107">>,
      name => lang:get(<<"海姆达尔"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(420512) ->
    #{id => 420512, partner_id => 20512,
      ico_id => <<"H32112">>,
      name => lang:get(<<"阿奇丽"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(420513) ->
    #{id => 420513, partner_id => 20513,
      ico_id => <<"H20513">>,
      name => lang:get(<<"Kakashi: Susanoo"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(130101) ->
    #{id => 130101, partner_id => 30101,
      ico_id => <<"H30086">>,
      name => lang:get(<<"树精灵"/utf8>>), star => 1, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130201) ->
    #{id => 130201, partner_id => 30201,
      ico_id => <<"H30068">>,
      name => lang:get(<<"花精灵"/utf8>>), star => 2, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130202) ->
    #{id => 130202, partner_id => 30202,
      ico_id => <<"H30025">>,
      name => lang:get(<<"精灵射手"/utf8>>), star => 2, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130301) ->
    #{id => 130301, partner_id => 30301,
      ico_id => <<"H30008">>, name => lang:get(<<"树人"/utf8>>),
      star => 3, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(130302) ->
    #{id => 130302, partner_id => 30302,
      ico_id => <<"H30032">>,
      name => lang:get(<<"风暴猎手"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130303) ->
    #{id => 130303, partner_id => 30303,
      ico_id => <<"H30034">>,
      name => lang:get(<<"雷霆狮鹫"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130304) ->
    #{id => 130304, partner_id => 30304,
      ico_id => <<"H30037">>, name => lang:get(<<"岩灵"/utf8>>),
      star => 3, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(130305) ->
    #{id => 130305, partner_id => 30305,
      ico_id => <<"H30047">>,
      name => lang:get(<<"游侠射手"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130401) ->
    #{id => 130401, partner_id => 30401,
      ico_id => <<"H30042">>,
      name => lang:get(<<"吟游诗人"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130402) ->
    #{id => 130402, partner_id => 30402,
      ico_id => <<"H30036">>,
      name => lang:get(<<"亡灵收割者"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130403) ->
    #{id => 130403, partner_id => 30403,
      ico_id => <<"H30004">>,
      name => lang:get(<<"圣锤提尔"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130404) ->
    #{id => 130404, partner_id => 30404,
      ico_id => <<"H30016">>,
      name => lang:get(<<"甘道夫"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130405) ->
    #{id => 130405, partner_id => 30405,
      ico_id => <<"H30017">>,
      name => lang:get(<<"德鲁伊"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130499) ->
    #{id => 130499, partner_id => 30402,
      ico_id => <<"H30036">>,
      name => lang:get(<<"亡灵收割者"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130501) ->
    #{id => 130501, partner_id => 30501,
      ico_id => <<"H30064">>, name => lang:get(<<"奥丁"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(130502) ->
    #{id => 130502, partner_id => 30502,
      ico_id => <<"H30056">>, name => lang:get(<<"影刹"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(130503) ->
    #{id => 130503, partner_id => 30503,
      ico_id => <<"H30051">>,
      name => lang:get(<<"凯兰崔尔"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130504) ->
    #{id => 130504, partner_id => 30504,
      ico_id => <<"H30010">>,
      name => lang:get(<<"魅魔女王"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130505) ->
    #{id => 130505, partner_id => 30505,
      ico_id => <<"H30085">>,
      name => lang:get(<<"美杜莎"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130506) ->
    #{id => 130506, partner_id => 30506,
      ico_id => <<"H30058">>,
      name => lang:get(<<"雅典娜"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130507) ->
    #{id => 130507, partner_id => 30507,
      ico_id => <<"H30094">>, name => lang:get(<<"潘"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(130508) ->
    #{id => 130508, partner_id => 30508,
      ico_id => <<"H30095">>,
      name => lang:get(<<"斯芬克斯"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130509) ->
    #{id => 130509, partner_id => 30509,
      ico_id => <<"H30099">>,
      name => lang:get(<<"芬尼尔"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130510) ->
    #{id => 130510, partner_id => 30510,
      ico_id => <<"H30101">>,
      name => lang:get(<<"拉塔托斯克"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130511) ->
    #{id => 130511, partner_id => 30511,
      ico_id => <<"H30106">>,
      name => lang:get(<<"辛西娅"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130512) ->
    #{id => 130512, partner_id => 30512,
      ico_id => <<"H30111">>,
      name => lang:get(<<"塞莎特"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(130513) ->
    #{id => 130513, partner_id => 30513,
      ico_id => <<"H30513">>,
      name => lang:get(<<"Neji Hyuga"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(130514) ->
    #{id => 130514, partner_id => 30514,
      ico_id => <<"H30514">>,
      name => lang:get(<<"Hinata Uzumaki"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(130599) ->
    #{id => 130599, partner_id => 30402,
      ico_id => <<"H30036">>,
      name => lang:get(<<"亡灵收割者"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230501) ->
    #{id => 230501, partner_id => 30501,
      ico_id => <<"H31064">>, name => lang:get(<<"奥丁"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(230502) ->
    #{id => 230502, partner_id => 30502,
      ico_id => <<"H31056">>, name => lang:get(<<"影刹"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(230503) ->
    #{id => 230503, partner_id => 30503,
      ico_id => <<"H31051">>,
      name => lang:get(<<"凯兰崔尔"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230504) ->
    #{id => 230504, partner_id => 30504,
      ico_id => <<"H31010">>,
      name => lang:get(<<"魅魔女王"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230505) ->
    #{id => 230505, partner_id => 30505,
      ico_id => <<"H31085">>,
      name => lang:get(<<"美杜莎"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230506) ->
    #{id => 230506, partner_id => 30506,
      ico_id => <<"H31058">>,
      name => lang:get(<<"雅典娜"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230507) ->
    #{id => 230507, partner_id => 30507,
      ico_id => <<"H31094">>, name => lang:get(<<"潘"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(230508) ->
    #{id => 230508, partner_id => 30508,
      ico_id => <<"H31095">>,
      name => lang:get(<<"斯芬克斯"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230509) ->
    #{id => 230509, partner_id => 30509,
      ico_id => <<"H31099">>,
      name => lang:get(<<"芬尼尔"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230510) ->
    #{id => 230510, partner_id => 30510,
      ico_id => <<"H31101">>,
      name => lang:get(<<"拉塔托斯克"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230511) ->
    #{id => 230511, partner_id => 30511,
      ico_id => <<"H31106">>,
      name => lang:get(<<"辛西娅"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230512) ->
    #{id => 230512, partner_id => 30512,
      ico_id => <<"H31111">>,
      name => lang:get(<<"塞莎特"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(230513) ->
    #{id => 230513, partner_id => 30513,
      ico_id => <<"H30513">>,
      name => lang:get(<<"Neji Hyuga"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(230514) ->
    #{id => 230514, partner_id => 30514,
      ico_id => <<"H30514">>,
      name => lang:get(<<"Hinata Uzumaki"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(330501) ->
    #{id => 330501, partner_id => 30501,
      ico_id => <<"H32064">>, name => lang:get(<<"奥丁"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(330502) ->
    #{id => 330502, partner_id => 30502,
      ico_id => <<"H32056">>, name => lang:get(<<"影刹"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(330504) ->
    #{id => 330504, partner_id => 30504,
      ico_id => <<"H32010">>,
      name => lang:get(<<"魅魔女王"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(330506) ->
    #{id => 330506, partner_id => 30506,
      ico_id => <<"H32058">>,
      name => lang:get(<<"雅典娜"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(330507) ->
    #{id => 330507, partner_id => 30507,
      ico_id => <<"H32094">>, name => lang:get(<<"潘"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(330508) ->
    #{id => 330508, partner_id => 30508,
      ico_id => <<"H32095">>,
      name => lang:get(<<"斯芬克斯"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(330509) ->
    #{id => 330509, partner_id => 30509,
      ico_id => <<"H32099">>,
      name => lang:get(<<"芬尼尔"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(330510) ->
    #{id => 330510, partner_id => 30510,
      ico_id => <<"H32101">>,
      name => lang:get(<<"拉塔托斯克"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(330511) ->
    #{id => 330511, partner_id => 30511,
      ico_id => <<"H32106">>,
      name => lang:get(<<"辛西娅"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(330512) ->
    #{id => 330512, partner_id => 30512,
      ico_id => <<"H32111">>,
      name => lang:get(<<"塞莎特"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(330513) ->
    #{id => 330513, partner_id => 30513,
      ico_id => <<"H30513">>,
      name => lang:get(<<"Neji Hyuga"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(330514) ->
    #{id => 330514, partner_id => 30514,
      ico_id => <<"H30514">>,
      name => lang:get(<<"Hinata Uzumaki"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(430501) ->
    #{id => 430501, partner_id => 30501,
      ico_id => <<"H32064">>, name => lang:get(<<"奥丁"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(430502) ->
    #{id => 430502, partner_id => 30502,
      ico_id => <<"H32056">>, name => lang:get(<<"影刹"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(430504) ->
    #{id => 430504, partner_id => 30504,
      ico_id => <<"H32010">>,
      name => lang:get(<<"魅魔女王"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(430506) ->
    #{id => 430506, partner_id => 30506,
      ico_id => <<"H32058">>,
      name => lang:get(<<"雅典娜"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(430507) ->
    #{id => 430507, partner_id => 30507,
      ico_id => <<"H32094">>, name => lang:get(<<"潘"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(430508) ->
    #{id => 430508, partner_id => 30508,
      ico_id => <<"H32095">>,
      name => lang:get(<<"斯芬克斯"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(430509) ->
    #{id => 430509, partner_id => 30509,
      ico_id => <<"H32099">>,
      name => lang:get(<<"芬尼尔"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(430510) ->
    #{id => 430510, partner_id => 30510,
      ico_id => <<"H32101">>,
      name => lang:get(<<"拉塔托斯克"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(430511) ->
    #{id => 430511, partner_id => 30511,
      ico_id => <<"H32106">>,
      name => lang:get(<<"辛西娅"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(430512) ->
    #{id => 430512, partner_id => 30512,
      ico_id => <<"H32111">>,
      name => lang:get(<<"塞莎特"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(430513) ->
    #{id => 430513, partner_id => 30513,
      ico_id => <<"H30513">>,
      name => lang:get(<<"Neji Hyuga"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(430514) ->
    #{id => 430514, partner_id => 30514,
      ico_id => <<"H30514">>,
      name => lang:get(<<"Hinata Uzumaki"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(140301) ->
    #{id => 140301, partner_id => 40301,
      ico_id => <<"H30089">>,
      name => lang:get(<<"光之苏尔"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140401) ->
    #{id => 140401, partner_id => 40401,
      ico_id => <<"H30048">>,
      name => lang:get(<<"光明牧师"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140402) ->
    #{id => 140402, partner_id => 40402,
      ico_id => <<"H30027">>,
      name => lang:get(<<"月之祭司"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140403) ->
    #{id => 140403, partner_id => 40403,
      ico_id => <<"H30003">>,
      name => lang:get(<<"精灵王子"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140404) ->
    #{id => 140404, partner_id => 40404,
      ico_id => <<"H30076">>,
      name => lang:get(<<"丘比特"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140501) ->
    #{id => 140501, partner_id => 40501,
      ico_id => <<"H30075">>,
      name => lang:get(<<"伊西斯"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140502) ->
    #{id => 140502, partner_id => 40502,
      ico_id => <<"H30031">>, name => lang:get(<<"宙斯"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140503) ->
    #{id => 140503, partner_id => 40503,
      ico_id => <<"H40503">>, name => lang:get(<<"赫拉"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140504) ->
    #{id => 140504, partner_id => 40504,
      ico_id => <<"H30077">>, name => lang:get(<<"雷神"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140505) ->
    #{id => 140505, partner_id => 40505,
      ico_id => <<"H30052">>, name => lang:get(<<"盖亚"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140506) ->
    #{id => 140506, partner_id => 40506,
      ico_id => <<"H30026">>,
      name => lang:get(<<"艾蕾莉亚"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140507) ->
    #{id => 140507, partner_id => 40507,
      ico_id => <<"H30090">>,
      name => lang:get(<<"神灵大祭司"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140508) ->
    #{id => 140508, partner_id => 40508,
      ico_id => <<"H30098">>,
      name => lang:get(<<"拉斐尔"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140509) ->
    #{id => 140509, partner_id => 40509,
      ico_id => <<"H30103">>,
      name => lang:get(<<"维纳斯"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140510) ->
    #{id => 140510, partner_id => 40510,
      ico_id => <<"H30109">>,
      name => lang:get(<<"加百列"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140511) ->
    #{id => 140511, partner_id => 40511,
      ico_id => <<"H32074">>,
      name => lang:get(<<"加百列"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(140512) ->
    #{id => 140512, partner_id => 40512,
      ico_id => <<"H40512">>,
      name => lang:get(<<"Naruto: Baryon Mode"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(161000) ->
    #{id => 161000, partner_id => 61000,
      ico_id => <<"H61000">>,
      name => lang:get(<<"Naruto: Lục Đạo"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(240501) ->
    #{id => 240501, partner_id => 40501,
      ico_id => <<"H31075">>,
      name => lang:get(<<"伊西斯"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(240502) ->
    #{id => 240502, partner_id => 40502,
      ico_id => <<"H31031">>, name => lang:get(<<"宙斯"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240503) ->
    #{id => 240503, partner_id => 40503,
      ico_id => <<"H40503">>, name => lang:get(<<"赫拉"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240504) ->
    #{id => 240504, partner_id => 40504,
      ico_id => <<"H31077">>, name => lang:get(<<"雷神"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240505) ->
    #{id => 240505, partner_id => 40505,
      ico_id => <<"H31052">>, name => lang:get(<<"盖亚"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240506) ->
    #{id => 240506, partner_id => 40506,
      ico_id => <<"H31026">>,
      name => lang:get(<<"艾蕾莉亚"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(240507) ->
    #{id => 240507, partner_id => 40507,
      ico_id => <<"H31090">>,
      name => lang:get(<<"神灵大祭司"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(240508) ->
    #{id => 240508, partner_id => 40508,
      ico_id => <<"H31098">>,
      name => lang:get(<<"拉斐尔"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(240509) ->
    #{id => 240509, partner_id => 40509,
      ico_id => <<"H31103">>,
      name => lang:get(<<"维纳斯"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(240510) ->
    #{id => 240510, partner_id => 40510,
      ico_id => <<"H31109">>,
      name => lang:get(<<"加百列"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(240511) ->
    #{id => 240511, partner_id => 40511,
      ico_id => <<"H32074">>,
      name => lang:get(<<"加百列"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(240512) ->
    #{id => 240512, partner_id => 40512,
      ico_id => <<"H40512">>,
      name => lang:get(<<"Naruto: Baryon Mode"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(261000) ->
    #{id => 261000, partner_id => 61000,
      ico_id => <<"H61000">>,
      name => lang:get(<<"Naruto: Lục Đạo"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(340502) ->
    #{id => 340502, partner_id => 40502,
      ico_id => <<"H32031">>, name => lang:get(<<"宙斯"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340503) ->
    #{id => 340503, partner_id => 40503,
      ico_id => <<"H40503">>, name => lang:get(<<"赫拉"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340504) ->
    #{id => 340504, partner_id => 40504,
      ico_id => <<"H32077">>, name => lang:get(<<"雷神"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340506) ->
    #{id => 340506, partner_id => 40506,
      ico_id => <<"H32026">>,
      name => lang:get(<<"艾蕾莉亚"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(340507) ->
    #{id => 340507, partner_id => 40507,
      ico_id => <<"H32090">>,
      name => lang:get(<<"神灵大祭司"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(340508) ->
    #{id => 340508, partner_id => 40508,
      ico_id => <<"H32098">>,
      name => lang:get(<<"拉斐尔"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(340509) ->
    #{id => 340509, partner_id => 40509,
      ico_id => <<"H32103">>,
      name => lang:get(<<"维纳斯"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(340510) ->
    #{id => 340510, partner_id => 40510,
      ico_id => <<"H32109">>,
      name => lang:get(<<"加百列"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(340511) ->
    #{id => 340511, partner_id => 40511,
      ico_id => <<"H32074">>,
      name => lang:get(<<"加百列"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(340512) ->
    #{id => 340512, partner_id => 40512,
      ico_id => <<"H40512">>,
      name => lang:get(<<"Naruto: Baryon Mode"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(361000) ->
    #{id => 361000, partner_id => 61000,
      ico_id => <<"H61000">>,
      name => lang:get(<<"Naruto: Lục Đạo"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440502) ->
    #{id => 440502, partner_id => 40502,
      ico_id => <<"H32031">>, name => lang:get(<<"宙斯"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440503) ->
    #{id => 440503, partner_id => 40503,
      ico_id => <<"H40503">>, name => lang:get(<<"赫拉"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440504) ->
    #{id => 440504, partner_id => 40504,
      ico_id => <<"H32077">>, name => lang:get(<<"雷神"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440506) ->
    #{id => 440506, partner_id => 40506,
      ico_id => <<"H32026">>,
      name => lang:get(<<"艾蕾莉亚"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(440507) ->
    #{id => 440507, partner_id => 40507,
      ico_id => <<"H32090">>,
      name => lang:get(<<"神灵大祭司"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(440508) ->
    #{id => 440508, partner_id => 40508,
      ico_id => <<"H32098">>,
      name => lang:get(<<"拉斐尔"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(440509) ->
    #{id => 440509, partner_id => 40509,
      ico_id => <<"H32103">>,
      name => lang:get(<<"维纳斯"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(440510) ->
    #{id => 440510, partner_id => 40510,
      ico_id => <<"H32109">>,
      name => lang:get(<<"加百列"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(440511) ->
    #{id => 440511, partner_id => 40511,
      ico_id => <<"H32074">>,
      name => lang:get(<<"加百列"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(440512) ->
    #{id => 440512, partner_id => 40512,
      ico_id => <<"H40512">>,
      name => lang:get(<<"Naruto: Baryon Mode"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(461000) ->
    #{id => 461000, partner_id => 61000,
      ico_id => <<"H61000">>,
      name => lang:get(<<"Naruto: Lục Đạo"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(150301) ->
    #{id => 150301, partner_id => 50301,
      ico_id => <<"H30011">>,
      name => lang:get(<<"暗影剑士"/utf8>>), star => 3, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150401) ->
    #{id => 150401, partner_id => 50401,
      ico_id => <<"H30081">>,
      name => lang:get(<<"毒咒女巫"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150402) ->
    #{id => 150402, partner_id => 50402,
      ico_id => <<"H30002">>,
      name => lang:get(<<"死亡骑士"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150403) ->
    #{id => 150403, partner_id => 50403,
      ico_id => <<"H30073">>,
      name => lang:get(<<"阿喀琉斯"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150404) ->
    #{id => 150404, partner_id => 50404,
      ico_id => <<"H30013">>,
      name => lang:get(<<"黑精灵密言"/utf8>>), star => 4, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150501) ->
    #{id => 150501, partner_id => 50501,
      ico_id => <<"H30041">>,
      name => lang:get(<<"蛇女墨莎"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150502) ->
    #{id => 150502, partner_id => 50502,
      ico_id => <<"H30040">>,
      name => lang:get(<<"哈迪斯"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150503) ->
    #{id => 150503, partner_id => 50503,
      ico_id => <<"H30046">>,
      name => lang:get(<<"亚巴顿"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150504) ->
    #{id => 150504, partner_id => 50504,
      ico_id => <<"H30059">>,
      name => lang:get(<<"黑暗之主"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150505) ->
    #{id => 150505, partner_id => 50505,
      ico_id => <<"H30054">>,
      name => lang:get(<<"阿努比斯"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150506) ->
    #{id => 150506, partner_id => 50506,
      ico_id => <<"H30063">>,
      name => lang:get(<<"路西法"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150507) ->
    #{id => 150507, partner_id => 50507,
      ico_id => <<"H30091">>,
      name => lang:get(<<"潘多拉"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150508) ->
    #{id => 150508, partner_id => 50508,
      ico_id => <<"H30100">>, name => lang:get(<<"海拉"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(150509) ->
    #{id => 150509, partner_id => 50509,
      ico_id => <<"H30105">>,
      name => lang:get(<<"尼德霍格"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(150510) ->
    #{id => 150510, partner_id => 50510,
      ico_id => <<"H30108">>, name => lang:get(<<"阿蒙"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(150511) ->
    #{id => 150511, partner_id => 50511,
      ico_id => <<"H35106">>,
      name => lang:get(<<"Sasuke: Indra"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(150512) ->
    #{id => 150512, partner_id => 50512,
      ico_id => <<"H50512">>,
      name => lang:get(<<"Sakura Uchiha"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(150513) ->
    #{id => 150513, partner_id => 50513,
      ico_id => <<"H50513">>,
      name => lang:get(<<"Obito: Lục đạo"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(163000) ->
    #{id => 163000, partner_id => 63000,
      ico_id => <<"H63000">>,
      name => lang:get(<<"Madara: Lục đạo"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(250501) ->
    #{id => 250501, partner_id => 50501,
      ico_id => <<"H31041">>,
      name => lang:get(<<"蛇女墨莎"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(250502) ->
    #{id => 250502, partner_id => 50502,
      ico_id => <<"H31040">>,
      name => lang:get(<<"哈迪斯"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(250503) ->
    #{id => 250503, partner_id => 50503,
      ico_id => <<"H31046">>,
      name => lang:get(<<"亚巴顿"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(250504) ->
    #{id => 250504, partner_id => 50504,
      ico_id => <<"H31059">>,
      name => lang:get(<<"黑暗之主"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(250505) ->
    #{id => 250505, partner_id => 50505,
      ico_id => <<"H31054">>,
      name => lang:get(<<"阿努比斯"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(250506) ->
    #{id => 250506, partner_id => 50506,
      ico_id => <<"H31063">>,
      name => lang:get(<<"路西法"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(250507) ->
    #{id => 250507, partner_id => 50507,
      ico_id => <<"H31091">>,
      name => lang:get(<<"潘多拉"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(250508) ->
    #{id => 250508, partner_id => 50508,
      ico_id => <<"H31100">>, name => lang:get(<<"海拉"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(250509) ->
    #{id => 250509, partner_id => 50509,
      ico_id => <<"H31105">>,
      name => lang:get(<<"尼德霍格"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(250510) ->
    #{id => 250510, partner_id => 50510,
      ico_id => <<"H31108">>, name => lang:get(<<"阿蒙"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(250511) ->
    #{id => 250511, partner_id => 50511,
      ico_id => <<"H35106">>,
      name => lang:get(<<"Sasuke: Indra"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(250512) ->
    #{id => 250512, partner_id => 50512,
      ico_id => <<"H50512">>,
      name => lang:get(<<"Sakura Uchiha"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(250513) ->
    #{id => 250513, partner_id => 50513,
      ico_id => <<"H50513">>,
      name => lang:get(<<"Obito: Lục đạo"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(263000) ->
    #{id => 263000, partner_id => 63000,
      ico_id => <<"H63000">>,
      name => lang:get(<<"Madara: Lục đạo"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(350502) ->
    #{id => 350502, partner_id => 50502,
      ico_id => <<"H32040">>,
      name => lang:get(<<"哈迪斯"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(350503) ->
    #{id => 350503, partner_id => 50503,
      ico_id => <<"H32046">>,
      name => lang:get(<<"亚巴顿"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(350504) ->
    #{id => 350504, partner_id => 50504,
      ico_id => <<"H32059">>,
      name => lang:get(<<"黑暗之主"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(350505) ->
    #{id => 350505, partner_id => 50505,
      ico_id => <<"H32054">>,
      name => lang:get(<<"阿努比斯"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(350507) ->
    #{id => 350507, partner_id => 50507,
      ico_id => <<"H32091">>,
      name => lang:get(<<"潘多拉"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(350508) ->
    #{id => 350508, partner_id => 50508,
      ico_id => <<"H32100">>, name => lang:get(<<"海拉"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(350509) ->
    #{id => 350509, partner_id => 50509,
      ico_id => <<"H32105">>,
      name => lang:get(<<"尼德霍格"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(350510) ->
    #{id => 350510, partner_id => 50510,
      ico_id => <<"H32108">>, name => lang:get(<<"阿蒙"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(350511) ->
    #{id => 350511, partner_id => 50511,
      ico_id => <<"H35106">>,
      name => lang:get(<<"Sasuke: Indra"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(350512) ->
    #{id => 350512, partner_id => 50512,
      ico_id => <<"H50512">>,
      name => lang:get(<<"Sakura Uchiha"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(350513) ->
    #{id => 350513, partner_id => 50513,
      ico_id => <<"H50513">>,
      name => lang:get(<<"Obito: Lục đạo"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(363000) ->
    #{id => 363000, partner_id => 63000,
      ico_id => <<"H63000">>,
      name => lang:get(<<"Madara: Lục đạo"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(450502) ->
    #{id => 450502, partner_id => 50502,
      ico_id => <<"H32040">>,
      name => lang:get(<<"哈迪斯"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(450503) ->
    #{id => 450503, partner_id => 50503,
      ico_id => <<"H32046">>,
      name => lang:get(<<"亚巴顿"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(450504) ->
    #{id => 450504, partner_id => 50504,
      ico_id => <<"H32059">>,
      name => lang:get(<<"黑暗之主"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(450505) ->
    #{id => 450505, partner_id => 50505,
      ico_id => <<"H32054">>,
      name => lang:get(<<"阿努比斯"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(450507) ->
    #{id => 450507, partner_id => 50507,
      ico_id => <<"H32091">>,
      name => lang:get(<<"潘多拉"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(450508) ->
    #{id => 450508, partner_id => 50508,
      ico_id => <<"H32100">>, name => lang:get(<<"海拉"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(450509) ->
    #{id => 450509, partner_id => 50509,
      ico_id => <<"H32105">>,
      name => lang:get(<<"尼德霍格"/utf8>>), star => 13, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(450510) ->
    #{id => 450510, partner_id => 50510,
      ico_id => <<"H32108">>, name => lang:get(<<"阿蒙"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(450511) ->
    #{id => 450511, partner_id => 50511,
      ico_id => <<"H35106">>,
      name => lang:get(<<"Sasuke: Indra"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(450512) ->
    #{id => 450512, partner_id => 50512,
      ico_id => <<"H50512">>,
      name => lang:get(<<"Sakura Uchiha"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(450513) ->
    #{id => 450513, partner_id => 50513,
      ico_id => <<"H50513">>,
      name => lang:get(<<"Obito: Lục đạo"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(463000) ->
    #{id => 463000, partner_id => 63000,
      ico_id => <<"H63000">>,
      name => lang:get(<<"Madara: Lục đạo"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(500001) ->
    #{id => 500001, partner_id => 30508,
      ico_id => <<"H50000">>,
      name => lang:get(<<"水色悠梦"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 101,
      pre_id => 0};
get(500002) ->
    #{id => 500002, partner_id => 30508,
      ico_id => <<"H50000">>,
      name => lang:get(<<"水色悠梦"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 101,
      pre_id => 500001};
get(500011) ->
    #{id => 500011, partner_id => 10511,
      ico_id => <<"H50001">>,
      name => lang:get(<<"如梦令"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 102,
      pre_id => 0};
get(500012) ->
    #{id => 500012, partner_id => 10511,
      ico_id => <<"H50001">>,
      name => lang:get(<<"如梦令"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 102,
      pre_id => 500011};
get(500013) ->
    #{id => 500013, partner_id => 10511,
      ico_id => <<"H50030">>,
      name => lang:get(<<"Kushina Uzumaki[Bãi Biển]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 111, pre_id => 0};
get(500014) ->
    #{id => 500014, partner_id => 10511,
      ico_id => <<"H50030">>,
      name => lang:get(<<"Kushina Uzumaki[Bãi Biển]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 111, pre_id => 500013};
get(500021) ->
    #{id => 500021, partner_id => 20508,
      ico_id => <<"H50002">>,
      name => lang:get(<<"赤羽火舞"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 103,
      pre_id => 0};
get(500022) ->
    #{id => 500022, partner_id => 20508,
      ico_id => <<"H50002">>,
      name => lang:get(<<"赤羽火舞"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 103,
      pre_id => 500021};
get(500031) ->
    #{id => 500031, partner_id => 10505,
      ico_id => <<"H50003">>,
      name => lang:get(<<"御龙金甲"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 104,
      pre_id => 0};
get(500032) ->
    #{id => 500032, partner_id => 10505,
      ico_id => <<"H50003">>,
      name => lang:get(<<"御龙金甲"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 104,
      pre_id => 500031};
get(500041) ->
    #{id => 500041, partner_id => 20504,
      ico_id => <<"H50004">>,
      name => lang:get(<<"赤魅海盗"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 105,
      pre_id => 0};
get(500042) ->
    #{id => 500042, partner_id => 20504,
      ico_id => <<"H50004">>,
      name => lang:get(<<"赤魅海盗"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 105,
      pre_id => 500041};
get(500051) ->
    #{id => 500051, partner_id => 40504,
      ico_id => <<"H50005">>,
      name => lang:get(<<"甜心女仆"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 106,
      pre_id => 0};
get(500052) ->
    #{id => 500052, partner_id => 40504,
      ico_id => <<"H50005">>,
      name => lang:get(<<"甜心女仆"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 106,
      pre_id => 500051};
get(500061) ->
    #{id => 500061, partner_id => 50504,
      ico_id => <<"H50006">>,
      name => lang:get(<<"暗影暴君"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 107,
      pre_id => 0};
get(500062) ->
    #{id => 500062, partner_id => 50504,
      ico_id => <<"H50006">>,
      name => lang:get(<<"暗影暴君"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 107,
      pre_id => 500061};
get(500071) ->
    #{id => 500071, partner_id => 30511,
      ico_id => <<"H50007">>,
      name => lang:get(<<"Konan: Hầu gái"/utf8>>), star => 0,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 108, pre_id => 0};
get(500072) ->
    #{id => 500072, partner_id => 30511,
      ico_id => <<"H50007">>,
      name => lang:get(<<"Konan: Hầu gái"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 108, pre_id => 500071};
get(500081) ->
    #{id => 500081, partner_id => 20508,
      ico_id => <<"H50008">>,
      name => lang:get(<<"Shisui Uchiha: Anbu"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 109, pre_id => 0};
get(500082) ->
    #{id => 500082, partner_id => 20508,
      ico_id => <<"H50008">>,
      name => lang:get(<<"Shisui Uchiha: Anbu"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 109, pre_id => 500081};
get(500101) ->
    #{id => 500101, partner_id => 10511,
      ico_id => <<"H50009">>,
      name =>
	  lang:get(<<"Sakura [The Rambles Of Spring]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 114, pre_id => 0};
get(500102) ->
    #{id => 500102, partner_id => 10511,
      ico_id => <<"H50009">>,
      name =>
	  lang:get(<<"Sakura [The Rambles Of Spring]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 114, pre_id => 500101};
get(500111) ->
    #{id => 500111, partner_id => 40506,
      ico_id => <<"H50011">>,
      name => lang:get(<<"Kushina Uzumaki[Bãi Biển]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 110, pre_id => 0};
get(500112) ->
    #{id => 500112, partner_id => 40506,
      ico_id => <<"H50011">>,
      name => lang:get(<<"Kushina Uzumaki[Bãi Biển]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 110, pre_id => 500111};
get(500113) ->
    #{id => 500113, partner_id => 10511,
      ico_id => <<"H50030">>,
      name => lang:get(<<"Sakura Haruno[Swimsuit]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 111, pre_id => 0};
get(500114) ->
    #{id => 500114, partner_id => 10511,
      ico_id => <<"H50030">>,
      name => lang:get(<<"Sakura Haruno[Swimsuit]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 111, pre_id => 500113};
get(500015) ->
    #{id => 500015, partner_id => 30502,
      ico_id => <<"H50002">>,
      name => lang:get(<<"冰雪圆舞曲"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 112,
      pre_id => 0};
get(500016) ->
    #{id => 500016, partner_id => 30502,
      ico_id => <<"H50002">>,
      name => lang:get(<<"圣诞天使"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 112,
      pre_id => 500015};
get(500091) ->
    #{id => 500091, partner_id => 50510,
      ico_id => <<"H50031">>,
      name => lang:get(<<"Kaguya [Night Goddess]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 113, pre_id => 0};
get(500092) ->
    #{id => 500092, partner_id => 50510,
      ico_id => <<"H50031">>,
      name => lang:get(<<"Kaguya [Night Goddess]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 113, pre_id => 500091};
get(500121) ->
    #{id => 500121, partner_id => 50511,
      ico_id => <<"H50010">>,
      name =>
	  lang:get(<<"Sasuke [The Rambles Of Spring]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 115, pre_id => 0};
get(500122) ->
    #{id => 500122, partner_id => 50511,
      ico_id => <<"H50010">>,
      name =>
	  lang:get(<<"Sasuke [The Rambles Of Spring]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 115, pre_id => 500121};
get(500131) ->
    #{id => 500131, partner_id => 30508,
      ico_id => <<"H50012">>,
      name => lang:get(<<"Naruto [Sexy Jutsu]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 116, pre_id => 0};
get(500132) ->
    #{id => 500132, partner_id => 30508,
      ico_id => <<"H50012">>,
      name => lang:get(<<"Naruto [Sexy Jutsu]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 116, pre_id => 500131};
get(500141) ->
    #{id => 500141, partner_id => 30510,
      ico_id => <<"H50013">>,
      name => lang:get(<<"Pain [Hiệp khách bãi biển]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 117, pre_id => 0};
get(500142) ->
    #{id => 500142, partner_id => 30510,
      ico_id => <<"H50013">>,
      name => lang:get(<<"Pain [Hiệp khách bãi biển]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 117, pre_id => 500141};
get(500151) ->
    #{id => 500151, partner_id => 40511,
      ico_id => <<"H50014">>,
      name => lang:get(<<"Naruto [Cyber Ranger]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 118, pre_id => 0};
get(500152) ->
    #{id => 500152, partner_id => 40511,
      ico_id => <<"H50014">>,
      name => lang:get(<<"Naruto [Cyber Ranger]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 118, pre_id => 500151};
get(500161) ->
    #{id => 500161, partner_id => 40511,
      ico_id => <<"H50014">>,
      name => lang:get(<<"Naruto [Cyber Ranger]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 118, pre_id => 0};
get(500162) ->
    #{id => 500162, partner_id => 40511,
      ico_id => <<"H50014">>,
      name => lang:get(<<"Naruto [Cyber Ranger]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 118, pre_id => 500151};
get(500171) ->
    #{id => 500171, partner_id => 30513,
      ico_id => <<"H50015">>,
      name => lang:get(<<"Neji [Naughty Dragon]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 119, pre_id => 0};
get(500172) ->
    #{id => 500172, partner_id => 30513,
      ico_id => <<"H50015">>,
      name => lang:get(<<"Neji [Naughty Dragon]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 119, pre_id => 500171};
get(500181) ->
    #{id => 500181, partner_id => 40513,
      ico_id => <<"H50016">>,
      name => lang:get(<<"Koji Kashin [Sage Mode]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 120, pre_id => 0};
get(500182) ->
    #{id => 500182, partner_id => 40513,
      ico_id => <<"H50016">>,
      name => lang:get(<<"Koji Kashin [Sage Mode]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 120, pre_id => 500181};
get(500191) ->
    #{id => 500191, partner_id => 50502,
      ico_id => <<"H50017">>,
      name => lang:get(<<"Madara [Demon Slayer]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 121, pre_id => 0};
get(500192) ->
    #{id => 500192, partner_id => 50502,
      ico_id => <<"H50017">>,
      name => lang:get(<<"Madara [Demon Slayer]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 121, pre_id => 500191};
get(500201) ->
    #{id => 500201, partner_id => 20514,
      ico_id => <<"H50018">>,
      name => lang:get(<<"Madara [Demon Slayer]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 122, pre_id => 0};
get(500202) ->
    #{id => 500202, partner_id => 20514,
      ico_id => <<"H50018">>,
      name => lang:get(<<"Madara [Demon Slayer]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 122, pre_id => 500201};
get(500211) ->
    #{id => 500211, partner_id => 20511,
      ico_id => <<"H50018">>,
      name =>
	  lang:get(<<"Madara [Demon Slayer (Bright)]"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 123, pre_id => 0};
get(500212) ->
    #{id => 500212, partner_id => 20511,
      ico_id => <<"H50018">>,
      name =>
	  lang:get(<<"Madara [Demon Slayer (Bright)]"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 123, pre_id => 500211};
get(500221) ->
    #{id => 500221, partner_id => 40519,
      ico_id => <<"H50020">>,
      name =>
	  lang:get(<<"[The Rambles of Spring] (Daybreak)"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 124, pre_id => 0};
get(500222) ->
    #{id => 500222, partner_id => 40519,
      ico_id => <<"H50020">>,
      name =>
	  lang:get(<<"[The Rambles of Spring] (Daybreak)"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 124, pre_id => 500221};
get(500231) ->
    #{id => 500231, partner_id => 50522,
      ico_id => <<"H50021">>,
      name =>
	  lang:get(<<"[The Rambles of Spring] (Daybreak)"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 125, pre_id => 0};
get(500232) ->
    #{id => 500232, partner_id => 50522,
      ico_id => <<"H50021">>,
      name =>
	  lang:get(<<"[The Rambles of Spring] (Daybreak)"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 125, pre_id => 500231};
get(500241) ->
    #{id => 500241, partner_id => 50523,
      ico_id => <<"H50021">>,
      name =>
	  lang:get(<<"Kaguya [Night Goddess] (Elegance)"/utf8>>),
      star => 0, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 126, pre_id => 0};
get(500242) ->
    #{id => 500242, partner_id => 50523,
      ico_id => <<"H50021">>,
      name =>
	  lang:get(<<"Kaguya [Night Goddess] (Elegance)"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 126, pre_id => 500241};
get(500141) ->
    #{id => 500141, partner_id => 30507,
      ico_id => <<"H50014">>,
      name => lang:get(<<"一战封神"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 115,
      pre_id => 500141};
get(500142) ->
    #{id => 500142, partner_id => 30507,
      ico_id => <<"H50014">>,
      name => lang:get(<<"一战封神"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 115,
      pre_id => 0};
get(500151) ->
    #{id => 500151, partner_id => 50509,
      ico_id => <<"H50015">>,
      name => lang:get(<<"黯灭金属"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 116,
      pre_id => 500151};
get(500152) ->
    #{id => 500152, partner_id => 50509,
      ico_id => <<"H50015">>,
      name => lang:get(<<"黯灭金属"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 116,
      pre_id => 0};
get(500161) ->
    #{id => 500161, partner_id => 50508,
      ico_id => <<"H50016">>,
      name => lang:get(<<"玫瑰之恋"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 117,
      pre_id => 500161};
get(500162) ->
    #{id => 500162, partner_id => 50508,
      ico_id => <<"H50016">>,
      name => lang:get(<<"玫瑰之恋"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 117,
      pre_id => 0};
get(500171) ->
    #{id => 500171, partner_id => 30509,
      ico_id => <<"H50017">>,
      name => lang:get(<<"岚月刃歌"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 118,
      pre_id => 0};
get(500172) ->
    #{id => 500172, partner_id => 30509,
      ico_id => <<"H50017">>,
      name => lang:get(<<"岚月刃歌"/utf8>>), star => 10, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 118,
      pre_id => 500171};
get(500181) ->
    #{id => 500181, partner_id => 40508,
      ico_id => <<"H50018">>,
      name => lang:get(<<"元气拉拉队"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 119,
      pre_id => 0};
get(500182) ->
    #{id => 500182, partner_id => 40508,
      ico_id => <<"H50018">>,
      name => lang:get(<<"元气拉拉队"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 119, pre_id => 500181};
get(500191) ->
    #{id => 500191, partner_id => 20508,
      ico_id => <<"H50019">>,
      name => lang:get(<<"圣剑骑士王"/utf8>>), star => 0, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 120,
      pre_id => 0};
get(500192) ->
    #{id => 500192, partner_id => 20508,
      ico_id => <<"H50019">>,
      name => lang:get(<<"圣剑骑士王"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 120, pre_id => 500191};
get(160582) ->
    #{id => 160582, partner_id => 60582,
      ico_id => <<"H660582">>,
      name => lang:get(<<"Hinata: The Last"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(260582) ->
    #{id => 260582, partner_id => 60582,
      ico_id => <<"H660582">>,
      name => lang:get(<<"Hinata: The Last"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(360582) ->
    #{id => 360582, partner_id => 60582,
      ico_id => <<"H660582">>,
      name => lang:get(<<"Hinata: The Last"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(120514) ->
    #{id => 120514, partner_id => 20514,
      ico_id => <<"H20514">>,
      name => lang:get(<<"Madara: Susanoo"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(220514) ->
    #{id => 220514, partner_id => 20514,
      ico_id => <<"H20514">>,
      name => lang:get(<<"Madara: Susanoo"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(320514) ->
    #{id => 320514, partner_id => 20514,
      ico_id => <<"H20514">>,
      name => lang:get(<<"Madara: Susanoo"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(420514) ->
    #{id => 420514, partner_id => 20514,
      ico_id => <<"H20514">>,
      name => lang:get(<<"Madara: Susanoo"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(120515) ->
    #{id => 120515, partner_id => 20515,
      ico_id => <<"H20515">>,
      name => lang:get(<<"Boruto Uzumaki"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(220515) ->
    #{id => 220515, partner_id => 20515,
      ico_id => <<"H20515">>,
      name => lang:get(<<"Boruto Uzumaki"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(320515) ->
    #{id => 320515, partner_id => 20515,
      ico_id => <<"H20515">>,
      name => lang:get(<<"Boruto Uzumaki"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(120600) ->
    #{id => 120600, partner_id => 20600,
      ico_id => <<"H30100">>,
      name => lang:get(<<"Rai Kage"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(220600) ->
    #{id => 220600, partner_id => 20600,
      ico_id => <<"H30100">>,
      name => lang:get(<<"Rai Kage"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(320600) ->
    #{id => 320600, partner_id => 20600,
      ico_id => <<"H30100">>,
      name => lang:get(<<"Rai Kage"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(420600) ->
    #{id => 420600, partner_id => 20600,
      ico_id => <<"H30100">>,
      name => lang:get(<<"Rai Kage"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(160000) ->
    #{id => 160000, partner_id => 60000,
      ico_id => <<"H321099">>,
      name => lang:get(<<"Jiraiya: Tiên Nhân"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(260000) ->
    #{id => 260000, partner_id => 60000,
      ico_id => <<"H321099">>,
      name => lang:get(<<"Jiraiya: Tiên Nhân"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(360000) ->
    #{id => 360000, partner_id => 60000,
      ico_id => <<"H321099">>,
      name => lang:get(<<"Jiraiya: Tiên Nhân"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(460000) ->
    #{id => 460000, partner_id => 60000,
      ico_id => <<"H321099">>,
      name => lang:get(<<"Jiraiya: Tiên Nhân"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(160518) ->
    #{id => 160518, partner_id => 60518,
      ico_id => <<"H30182">>,
      name => lang:get(<<"Itachi (Impure Land)"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(260518) ->
    #{id => 260518, partner_id => 60518,
      ico_id => <<"H30182">>,
      name => lang:get(<<"Itachi (Impure Land)"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(360518) ->
    #{id => 360518, partner_id => 60518,
      ico_id => <<"H30182">>,
      name => lang:get(<<"Itachi (Impure Land)"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(160541) ->
    #{id => 160541, partner_id => 60541,
      ico_id => <<"H660541">>,
      name => lang:get(<<"Asura Ōtsutsuki"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(260541) ->
    #{id => 260541, partner_id => 60541,
      ico_id => <<"H660541">>,
      name => lang:get(<<"Asura Ōtsutsuki"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(360541) ->
    #{id => 360541, partner_id => 60541,
      ico_id => <<"H660541">>,
      name => lang:get(<<"Asura Ōtsutsuki"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(170505) ->
    #{id => 170505, partner_id => 70505,
      ico_id => <<"H90516">>,
      name => lang:get(<<"Boruto: Momoshiki Ego"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(270505) ->
    #{id => 270505, partner_id => 70505,
      ico_id => <<"H90516">>,
      name => lang:get(<<"Boruto: Momoshiki Ego"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(370505) ->
    #{id => 370505, partner_id => 70505,
      ico_id => <<"H90516">>,
      name => lang:get(<<"Boruto: Momoshiki Ego"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140513) ->
    #{id => 140513, partner_id => 40513,
      ico_id => <<"H40513">>,
      name => lang:get(<<"Koji Kashin"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(240513) ->
    #{id => 240513, partner_id => 40513,
      ico_id => <<"H40513">>,
      name => lang:get(<<"Koji Kashin"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(340513) ->
    #{id => 340513, partner_id => 40513,
      ico_id => <<"H40513">>,
      name => lang:get(<<"Koji Kashin"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(440513) ->
    #{id => 440513, partner_id => 40513,
      ico_id => <<"H40513">>,
      name => lang:get(<<"Koji Kashin"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(110518) ->
    #{id => 110518, partner_id => 10518,
      ico_id => <<"H10518">>,
      name => lang:get(<<"Kushina: Kurama Possessed"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(210518) ->
    #{id => 210518, partner_id => 10518,
      ico_id => <<"H10518">>,
      name => lang:get(<<"Kushina: Kurama Possessed"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(310518) ->
    #{id => 310518, partner_id => 10518,
      ico_id => <<"H10518">>,
      name => lang:get(<<"Kushina: Kurama Possessed"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(410518) ->
    #{id => 410518, partner_id => 10518,
      ico_id => <<"H10518">>,
      name => lang:get(<<"Kushina: Kurama Possessed"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140523) ->
    #{id => 140523, partner_id => 40523,
      ico_id => <<"H40523">>,
      name => lang:get(<<"Minato: Flame Hashira"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240523) ->
    #{id => 240523, partner_id => 40523,
      ico_id => <<"H40523">>,
      name => lang:get(<<"Minato: Flame Hashira"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340523) ->
    #{id => 340523, partner_id => 40523,
      ico_id => <<"H40523">>,
      name => lang:get(<<"Minato: Flame Hashira"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440523) ->
    #{id => 440523, partner_id => 40523,
      ico_id => <<"H40523">>,
      name => lang:get(<<"Minato: Flame Hashira"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(150923) ->
    #{id => 150923, partner_id => 50923,
      ico_id => <<"H405241">>,
      name => lang:get(<<"Madara&Hashirama"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(250923) ->
    #{id => 250923, partner_id => 50923,
      ico_id => <<"H405241">>,
      name => lang:get(<<"Madara&Hashirama"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(350923) ->
    #{id => 350923, partner_id => 50923,
      ico_id => <<"H405241">>,
      name => lang:get(<<"Madara&Hashirama"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(450923) ->
    #{id => 450923, partner_id => 50923,
      ico_id => <<"H405241">>,
      name => lang:get(<<"Madara&Hashirama"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140923) ->
    #{id => 140923, partner_id => 40923,
      ico_id => <<"H30203">>,
      name => lang:get(<<"Guy Tử Môn"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(240923) ->
    #{id => 240923, partner_id => 40923,
      ico_id => <<"H30203">>,
      name => lang:get(<<"Guy Tử Môn"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(340923) ->
    #{id => 340923, partner_id => 40923,
      ico_id => <<"H30203">>,
      name => lang:get(<<"Guy Tử Môn"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(440923) ->
    #{id => 440923, partner_id => 40923,
      ico_id => <<"H30203">>,
      name => lang:get(<<"Guy Tử Môn"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(150524) ->
    #{id => 150524, partner_id => 50524,
      ico_id => <<"H50524">>,
      name => lang:get(<<"Pain Lục Đạo: Tối Thượng"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(250524) ->
    #{id => 250524, partner_id => 50524,
      ico_id => <<"H50524">>,
      name => lang:get(<<"Pain Lục Đạo: Tối Thượng"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(350524) ->
    #{id => 350524, partner_id => 50524,
      ico_id => <<"H50524">>,
      name => lang:get(<<"Pain Lục Đạo: Tối Thượng"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(450524) ->
    #{id => 450524, partner_id => 50524,
      ico_id => <<"H50524">>,
      name => lang:get(<<"Pain Lục Đạo: Tối Thượng"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140524) ->
    #{id => 140524, partner_id => 40524,
      ico_id => <<"H405240">>,
      name => lang:get(<<"Hashirama&Madara"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240524) ->
    #{id => 240524, partner_id => 40524,
      ico_id => <<"H405240">>,
      name => lang:get(<<"Hashirama&Madara"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340524) ->
    #{id => 340524, partner_id => 40524,
      ico_id => <<"H405240">>,
      name => lang:get(<<"Hashirama&Madara"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440524) ->
    #{id => 440524, partner_id => 40524,
      ico_id => <<"H405240">>,
      name => lang:get(<<"Hashirama&Madara"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(120517) ->
    #{id => 120517, partner_id => 20517,
      ico_id => <<"H20517">>,
      name => lang:get(<<"A&Killer B"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(220517) ->
    #{id => 220517, partner_id => 20517,
      ico_id => <<"H20517">>,
      name => lang:get(<<"A&Killer B"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(320517) ->
    #{id => 320517, partner_id => 20517,
      ico_id => <<"H20517">>,
      name => lang:get(<<"A&Killer B"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(420517) ->
    #{id => 420517, partner_id => 20517,
      ico_id => <<"H20517">>,
      name => lang:get(<<"A&Killer B"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(120518) ->
    #{id => 120518, partner_id => 20518,
      ico_id => <<"H205180">>,
      name => lang:get(<<"Sasuke: The Last"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(220518) ->
    #{id => 220518, partner_id => 20518,
      ico_id => <<"H205180">>,
      name => lang:get(<<"Sasuke: The Last"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(320518) ->
    #{id => 320518, partner_id => 20518,
      ico_id => <<"H205180">>,
      name => lang:get(<<"Sasuke: The Last"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(420518) ->
    #{id => 420518, partner_id => 20518,
      ico_id => <<"H205180">>,
      name => lang:get(<<"Sasuke: The Last"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(130518) ->
    #{id => 130518, partner_id => 30518,
      ico_id => <<"H30518">>,
      name => lang:get(<<"Hinata: The Last"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(230518) ->
    #{id => 230518, partner_id => 30518,
      ico_id => <<"H30518">>,
      name => lang:get(<<"Hinata: The Last"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(330518) ->
    #{id => 330518, partner_id => 30518,
      ico_id => <<"H30518">>,
      name => lang:get(<<"Hinata: The Last"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(430518) ->
    #{id => 430518, partner_id => 30518,
      ico_id => <<"H30518">>,
      name => lang:get(<<"Hinata: The Last"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140518) ->
    #{id => 140518, partner_id => 40518,
      ico_id => <<"H40518">>,
      name => lang:get(<<"Naruto Tiên Hồ"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(240518) ->
    #{id => 240518, partner_id => 40518,
      ico_id => <<"H40518">>,
      name => lang:get(<<"Naruto Tiên Hồ"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(340518) ->
    #{id => 340518, partner_id => 40518,
      ico_id => <<"H40518">>,
      name => lang:get(<<"Naruto Tiên Hồ"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(440518) ->
    #{id => 440518, partner_id => 40518,
      ico_id => <<"H40518">>,
      name => lang:get(<<"Naruto Tiên Hồ"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(140519) ->
    #{id => 140519, partner_id => 40519,
      ico_id => <<"H40519">>,
      name => lang:get(<<"Sakura: Road to Ninja"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240519) ->
    #{id => 240519, partner_id => 40519,
      ico_id => <<"H40519">>,
      name => lang:get(<<"Sakura: Road to Ninja"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340519) ->
    #{id => 340519, partner_id => 40519,
      ico_id => <<"H40519">>,
      name => lang:get(<<"Sakura: Road to Ninja"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440519) ->
    #{id => 440519, partner_id => 40519,
      ico_id => <<"H40519">>,
      name => lang:get(<<"Sakura: Road to Ninja"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140520) ->
    #{id => 140520, partner_id => 40520,
      ico_id => <<"H40520">>,
      name => lang:get(<<"Naruto: Asura"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(240520) ->
    #{id => 240520, partner_id => 40520,
      ico_id => <<"H40520">>,
      name => lang:get(<<"Naruto: Asura"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(340520) ->
    #{id => 340520, partner_id => 40520,
      ico_id => <<"H40520">>,
      name => lang:get(<<"Naruto: Asura"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(440520) ->
    #{id => 440520, partner_id => 40520,
      ico_id => <<"H40520">>,
      name => lang:get(<<"Naruto: Asura"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(140521) ->
    #{id => 140521, partner_id => 40521,
      ico_id => <<"H40521">>,
      name => lang:get(<<"Minato: Sage Mode"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240521) ->
    #{id => 240521, partner_id => 40521,
      ico_id => <<"H40521">>,
      name => lang:get(<<"Minato: Sage Mode"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340521) ->
    #{id => 340521, partner_id => 40521,
      ico_id => <<"H40521">>,
      name => lang:get(<<"Minato: Sage Mode"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440521) ->
    #{id => 440521, partner_id => 40521,
      ico_id => <<"H40521">>,
      name => lang:get(<<"Minato: Sage Mode"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140522) ->
    #{id => 140522, partner_id => 40522,
      ico_id => <<"H40522">>,
      name => lang:get(<<"Jiraiya: Sage Mode"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240522) ->
    #{id => 240522, partner_id => 40522,
      ico_id => <<"H40522">>,
      name => lang:get(<<"Jiraiya: Sage Mode"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340522) ->
    #{id => 340522, partner_id => 40522,
      ico_id => <<"H40522">>,
      name => lang:get(<<"Jiraiya: Sage Mode"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440522) ->
    #{id => 440522, partner_id => 40522,
      ico_id => <<"H40522">>,
      name => lang:get(<<"Jiraiya: Sage Mode"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(150520) ->
    #{id => 150520, partner_id => 50520,
      ico_id => <<"H505200">>,
      name => lang:get(<<"Madara: Six Paths"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(250520) ->
    #{id => 250520, partner_id => 50520,
      ico_id => <<"H505200">>,
      name => lang:get(<<"Madara: Six Paths"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(350520) ->
    #{id => 350520, partner_id => 50520,
      ico_id => <<"H505200">>,
      name => lang:get(<<"Madara: Six Paths"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(450520) ->
    #{id => 450520, partner_id => 50520,
      ico_id => <<"H505200">>,
      name => lang:get(<<"Madara: Six Paths"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(150521) ->
    #{id => 150521, partner_id => 50521,
      ico_id => <<"H50521">>,
      name => lang:get(<<"Obito&Kakashi"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(250521) ->
    #{id => 250521, partner_id => 50521,
      ico_id => <<"H50521">>,
      name => lang:get(<<"Obito&Kakashi"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(350521) ->
    #{id => 350521, partner_id => 50521,
      ico_id => <<"H50521">>,
      name => lang:get(<<"Obito&Kakashi"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(450521) ->
    #{id => 450521, partner_id => 50521,
      ico_id => <<"H50521">>,
      name => lang:get(<<"Obito&Kakashi"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(150522) ->
    #{id => 150522, partner_id => 50522,
      ico_id => <<"H50522">>,
      name => lang:get(<<"Sasuke: Supporting Kage"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(250522) ->
    #{id => 250522, partner_id => 50522,
      ico_id => <<"H50522">>,
      name => lang:get(<<"Sasuke: Supporting Kage"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(350522) ->
    #{id => 350522, partner_id => 50522,
      ico_id => <<"H50522">>,
      name => lang:get(<<"Sasuke: Supporting Kage"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(450522) ->
    #{id => 450522, partner_id => 50522,
      ico_id => <<"H50522">>,
      name => lang:get(<<"Sasuke: Supporting Kage"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(150523) ->
    #{id => 150523, partner_id => 50523,
      ico_id => <<"H50523">>,
      name => lang:get(<<"Kaguya UR"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(250523) ->
    #{id => 250523, partner_id => 50523,
      ico_id => <<"H50523">>,
      name => lang:get(<<"Kaguya UR"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(350523) ->
    #{id => 350523, partner_id => 50523,
      ico_id => <<"H50523">>,
      name => lang:get(<<"Kaguya UR"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(450523) ->
    #{id => 450523, partner_id => 50523,
      ico_id => <<"H50523">>,
      name => lang:get(<<"Kaguya UR"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(140514) ->
    #{id => 140514, partner_id => 40514,
      ico_id => <<"H40514">>,
      name => lang:get(<<"Tsunade: Byakugo"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240514) ->
    #{id => 240514, partner_id => 40514,
      ico_id => <<"H40514">>,
      name => lang:get(<<"Tsunade: Byakugo"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340514) ->
    #{id => 340514, partner_id => 40514,
      ico_id => <<"H40514">>,
      name => lang:get(<<"Tsunade: Byakugo"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440514) ->
    #{id => 440514, partner_id => 40514,
      ico_id => <<"H40514">>,
      name => lang:get(<<"Tsunade: Byakugo"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140515) ->
    #{id => 140515, partner_id => 40515,
      ico_id => <<"H40515">>,
      name => lang:get(<<"Orochimaru: New Era"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240515) ->
    #{id => 240515, partner_id => 40515,
      ico_id => <<"H40515">>,
      name => lang:get(<<"Orochimaru: New Era"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340515) ->
    #{id => 340515, partner_id => 40515,
      ico_id => <<"H40515">>,
      name => lang:get(<<"Orochimaru: New Era"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(440515) ->
    #{id => 440515, partner_id => 40515,
      ico_id => <<"H40515">>,
      name => lang:get(<<"Orochimaru: New Era"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140516) ->
    #{id => 140516, partner_id => 40516,
      ico_id => <<"H40516">>,
      name => lang:get(<<"Orochimaru: New Era"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(240516) ->
    #{id => 240516, partner_id => 40516,
      ico_id => <<"H40516">>,
      name => lang:get(<<"Orochimaru: New Era"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(340516) ->
    #{id => 340516, partner_id => 40516,
      ico_id => <<"H40516">>,
      name => lang:get(<<"Orochimaru: New Era"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(140517) ->
    #{id => 140517, partner_id => 40517,
      ico_id => <<"H40517">>,
      name => lang:get(<<"Naruto&Minato"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(240517) ->
    #{id => 240517, partner_id => 40517,
      ico_id => <<"H40517">>,
      name => lang:get(<<"Naruto&Minato"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(340517) ->
    #{id => 340517, partner_id => 40517,
      ico_id => <<"H40517">>,
      name => lang:get(<<"Naruto&Minato"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(163005) ->
    #{id => 163005, partner_id => 63005,
      ico_id => <<"H63005">>,
      name => lang:get(<<"Naruto Tiên Hồ"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(263005) ->
    #{id => 263005, partner_id => 63005,
      ico_id => <<"H63005">>,
      name => lang:get(<<"Naruto Tiên Hồ"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(363005) ->
    #{id => 363005, partner_id => 63005,
      ico_id => <<"H63005">>,
      name => lang:get(<<"Naruto Tiên Hồ"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(1605029) ->
    #{id => 1605029, partner_id => 605029,
      ico_id => <<"H30166">>,
      name => lang:get(<<"Naruto (Yêu Hồ)"/utf8>>), star => 5,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(2605029) ->
    #{id => 2605029, partner_id => 605029,
      ico_id => <<"H30166">>,
      name => lang:get(<<"Naruto (Yêu Hồ)"/utf8>>), star => 6,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(3605029) ->
    #{id => 3605029, partner_id => 605029,
      ico_id => <<"H30166">>,
      name => lang:get(<<"Naruto (Yêu Hồ)"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(110515) ->
    #{id => 110515, partner_id => 10515,
      ico_id => <<"H10515">>,
      name => lang:get(<<"Mei: 5th Mizukage"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(210515) ->
    #{id => 210515, partner_id => 10515,
      ico_id => <<"H10515">>,
      name => lang:get(<<"Mei: 5th Mizukage"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(310515) ->
    #{id => 310515, partner_id => 10515,
      ico_id => <<"H10515">>,
      name => lang:get(<<"Mei: 5th Mizukage"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(410515) ->
    #{id => 410515, partner_id => 10515,
      ico_id => <<"H10515">>,
      name => lang:get(<<"Mei: 5th Mizukage"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(150601) ->
    #{id => 150601, partner_id => 50601,
      ico_id => <<"H50601">>,
      name => lang:get(<<"Papa Sasuke Uchiha"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(250601) ->
    #{id => 250601, partner_id => 50601,
      ico_id => <<"H50601">>,
      name => lang:get(<<"Papa Sasuke Uchiha"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(350601) ->
    #{id => 350601, partner_id => 50601,
      ico_id => <<"H50601">>,
      name => lang:get(<<"Papa Sasuke Uchiha"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(450601) ->
    #{id => 450601, partner_id => 50601,
      ico_id => <<"H50601">>,
      name => lang:get(<<"Papa Sasuke Uchiha"/utf8>>),
      star => 13, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(150602) ->
    #{id => 150602, partner_id => 50602,
      ico_id => <<"H50602">>,
      name => lang:get(<<"Indra"/utf8>>), star => 5, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(250602) ->
    #{id => 250602, partner_id => 50602,
      ico_id => <<"H50602">>,
      name => lang:get(<<"Indra"/utf8>>), star => 6, lev => 1,
      vip_lev => 0, expend => [], attr => [], skin_id => 0,
      pre_id => 0};
get(350602) ->
    #{id => 350602, partner_id => 50602,
      ico_id => <<"H50602">>,
      name => lang:get(<<"Indra"/utf8>>), star => 10,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(450602) ->
    #{id => 450602, partner_id => 50602,
      ico_id => <<"H50602">>,
      name => lang:get(<<"Indra"/utf8>>), star => 13,
      lev => 1, vip_lev => 0, expend => [], attr => [],
      skin_id => 0, pre_id => 0};
get(160538) ->
    #{id => 160538, partner_id => 60538,
      ico_id => <<"H660538">>,
      name => lang:get(<<"Isshiki Otsutsuki"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(260538) ->
    #{id => 260538, partner_id => 60538,
      ico_id => <<"H660538">>,
      name => lang:get(<<"Isshiki Otsutsuki"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(360538) ->
    #{id => 360538, partner_id => 60538,
      ico_id => <<"H660538">>,
      name => lang:get(<<"Isshiki Otsutsuki"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(170512) ->
    #{id => 170512, partner_id => 70512,
      ico_id => <<"H91216">>,
      name => lang:get(<<"Madara thần kiếm"/utf8>>),
      star => 5, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(270512) ->
    #{id => 270512, partner_id => 70512,
      ico_id => <<"H91216">>,
      name => lang:get(<<"Madara thần kiếm"/utf8>>),
      star => 6, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(370512) ->
    #{id => 370512, partner_id => 70512,
      ico_id => <<"H91216">>,
      name => lang:get(<<"Madara thần kiếm"/utf8>>),
      star => 10, lev => 1, vip_lev => 0, expend => [],
      attr => [], skin_id => 0, pre_id => 0};
get(_) -> undefined.

get_looks_id({60582, 5}) -> [160582];
get_looks_id({60582, 6}) -> [260582];
get_looks_id({60582, 10}) -> [360582];
get_looks_id({20514, 5}) -> [120514];
get_looks_id({20514, 6}) -> [220514];
get_looks_id({20514, 10}) -> [320514];
get_looks_id({20515, 5}) -> [120515];
get_looks_id({20515, 6}) -> [220515];
get_looks_id({20515, 10}) -> [320515];
get_looks_id({20600, 5}) -> [120600];
get_looks_id({20600, 6}) -> [220600];
get_looks_id({20600, 10}) -> [320600];
get_looks_id({60000, 5}) -> [160000];
get_looks_id({60000, 6}) -> [260000];
get_looks_id({60000, 10}) -> [360000];
get_looks_id({60518, 5}) -> [160518];
get_looks_id({60518, 6}) -> [260518];
get_looks_id({60518, 10}) -> [360518];
get_looks_id({60541, 5}) -> [160541];
get_looks_id({60541, 6}) -> [260541];
get_looks_id({60541, 10}) -> [360541];
get_looks_id({70505, 5}) -> [170505];
get_looks_id({70505, 6}) -> [270505];
get_looks_id({70505, 10}) -> [370505];
get_looks_id({40513, 5}) -> [140513];
get_looks_id({40513, 6}) -> [240513];
get_looks_id({40513, 10}) -> [340513];
get_looks_id({40514, 5}) -> [140514];
get_looks_id({40514, 6}) -> [240514];
get_looks_id({40514, 10}) -> [340514];
get_looks_id({40515, 5}) -> [140515];
get_looks_id({40515, 6}) -> [240515];
get_looks_id({40515, 10}) -> [340515];
get_looks_id({40516, 5}) -> [140516];
get_looks_id({40516, 6}) -> [240516];
get_looks_id({40516, 10}) -> [340516];
get_looks_id({40517, 5}) -> [140517];
get_looks_id({40517, 6}) -> [240517];
get_looks_id({40517, 10}) -> [340517];
get_looks_id({63005, 5}) -> [163005];
get_looks_id({63005, 6}) -> [263005];
get_looks_id({63005, 10}) -> [363005];
get_looks_id({605029, 5}) -> [1605029];
get_looks_id({605029, 6}) -> [2605029];
get_looks_id({605029, 10}) -> [3605029];
get_looks_id({10515, 5}) -> [110515];
get_looks_id({10515, 6}) -> [210515];
get_looks_id({10515, 10}) -> [310515];
get_looks_id({50601, 5}) -> [150601];
get_looks_id({50601, 6}) -> [250601];
get_looks_id({50601, 10}) -> [350601];
get_looks_id({50602, 5}) -> [150602];
get_looks_id({50602, 6}) -> [250602];
get_looks_id({50602, 10}) -> [350602];
get_looks_id({60538, 5}) -> [160538];
get_looks_id({60538, 6}) -> [260538];
get_looks_id({60538, 10}) -> [360538];
get_looks_id({70512, 5}) -> [170512];
get_looks_id({70512, 6}) -> [270512];
get_looks_id({70512, 10}) -> [370512];
get_looks_id({30509, 0}) -> [500171];
get_looks_id({50509, 0}) -> [500151];
get_looks_id({40508, 0}) -> [500121, 500181];
get_looks_id({40506, 0}) -> [500111];
get_looks_id({20507, 0}) -> [500101];
get_looks_id({40503, 0}) -> [500091];
get_looks_id({50508, 0}) -> [500081, 500161];
get_looks_id({30507, 0}) -> [500071, 500141];
get_looks_id({50504, 0}) -> [500061];
get_looks_id({10501, 0}) -> [500051];
get_looks_id({50507, 0}) -> [500041];
get_looks_id({10505, 0}) -> [500031];
get_looks_id({20508, 0}) -> [500021, 500191];
get_looks_id({40507, 0}) -> [500011];
get_looks_id({30508, 0}) -> [500001, 500131];
get_looks_id({63000, 10}) -> [363000];
get_looks_id({50513, 10}) -> [350513];
get_looks_id({50512, 10}) -> [350512];
get_looks_id({50511, 10}) -> [350511];
get_looks_id({50510, 10}) -> [350510];
get_looks_id({50509, 10}) -> [350509, 500152];
get_looks_id({50508, 10}) -> [350508, 500082, 500162];
get_looks_id({50507, 10}) -> [350507, 500042];
get_looks_id({50505, 10}) -> [350505];
get_looks_id({50504, 10}) -> [350504, 500062];
get_looks_id({50503, 10}) -> [350503];
get_looks_id({50502, 10}) -> [350502];
get_looks_id({63000, 6}) -> [263000];
get_looks_id({50513, 6}) -> [250513];
get_looks_id({50512, 6}) -> [250512];
get_looks_id({50511, 6}) -> [250511];
get_looks_id({50510, 6}) -> [250510];
get_looks_id({50509, 6}) -> [250509];
get_looks_id({50508, 6}) -> [250508];
get_looks_id({50507, 6}) -> [250507];
get_looks_id({50506, 6}) -> [250506];
get_looks_id({50505, 6}) -> [250505];
get_looks_id({50504, 6}) -> [250504];
get_looks_id({50503, 6}) -> [250503];
get_looks_id({50502, 6}) -> [250502];
get_looks_id({50501, 6}) -> [250501];
get_looks_id({63000, 5}) -> [163000];
get_looks_id({50513, 5}) -> [150513];
get_looks_id({50512, 5}) -> [150512];
get_looks_id({50511, 5}) -> [150511];
get_looks_id({50510, 5}) -> [150510];
get_looks_id({50509, 5}) -> [150509];
get_looks_id({50508, 5}) -> [150508];
get_looks_id({50507, 5}) -> [150507];
get_looks_id({50506, 5}) -> [150506];
get_looks_id({50505, 5}) -> [150505];
get_looks_id({50504, 5}) -> [150504];
get_looks_id({50503, 5}) -> [150503];
get_looks_id({50502, 5}) -> [150502];
get_looks_id({50501, 5}) -> [150501];
get_looks_id({50404, 4}) -> [150404];
get_looks_id({50403, 4}) -> [150403];
get_looks_id({50402, 4}) -> [150402];
get_looks_id({50401, 4}) -> [150401];
get_looks_id({50301, 3}) -> [150301];
get_looks_id({61000, 10}) -> [361000];
get_looks_id({40512, 10}) -> [340512];
get_looks_id({40511, 10}) -> [340511];
get_looks_id({40510, 10}) -> [340510];
get_looks_id({40509, 10}) -> [340509];
get_looks_id({40508, 10}) -> [340508, 500122, 500182];
get_looks_id({40507, 10}) -> [340507, 500012];
get_looks_id({40506, 10}) -> [340506, 500112];
get_looks_id({40504, 10}) -> [340504];
get_looks_id({40503, 10}) -> [340503, 500092];
get_looks_id({40502, 10}) -> [340502];
get_looks_id({61000, 6}) -> [261000];
get_looks_id({40512, 6}) -> [240512];
get_looks_id({40511, 6}) -> [240511];
get_looks_id({40510, 6}) -> [240510];
get_looks_id({40509, 6}) -> [240509];
get_looks_id({40508, 6}) -> [240508];
get_looks_id({40507, 6}) -> [240507];
get_looks_id({40506, 6}) -> [240506];
get_looks_id({40505, 6}) -> [240505];
get_looks_id({40504, 6}) -> [240504];
get_looks_id({40503, 6}) -> [240503];
get_looks_id({40502, 6}) -> [240502];
get_looks_id({40501, 6}) -> [240501];
get_looks_id({61000, 5}) -> [161000];
get_looks_id({40512, 5}) -> [140512];
get_looks_id({40511, 5}) -> [140511];
get_looks_id({40510, 5}) -> [140510];
get_looks_id({40509, 5}) -> [140509];
get_looks_id({40508, 5}) -> [140508];
get_looks_id({40507, 5}) -> [140507];
get_looks_id({40506, 5}) -> [140506];
get_looks_id({40505, 5}) -> [140505];
get_looks_id({40504, 5}) -> [140504];
get_looks_id({40503, 5}) -> [140503];
get_looks_id({40502, 5}) -> [140502];
get_looks_id({40501, 5}) -> [140501];
get_looks_id({40404, 4}) -> [140404];
get_looks_id({40403, 4}) -> [140403];
get_looks_id({40402, 4}) -> [140402];
get_looks_id({40401, 4}) -> [140401];
get_looks_id({40301, 3}) -> [140301];
get_looks_id({30514, 10}) -> [330514];
get_looks_id({30513, 10}) -> [330513];
get_looks_id({30512, 10}) -> [330512];
get_looks_id({30511, 10}) -> [330511];
get_looks_id({30510, 10}) -> [330510];
get_looks_id({30509, 10}) -> [330509, 500172];
get_looks_id({30508, 10}) -> [330508, 500002, 500132];
get_looks_id({30507, 10}) -> [330507, 500072, 500142];
get_looks_id({30506, 10}) -> [330506];
get_looks_id({30504, 10}) -> [330504];
get_looks_id({30502, 10}) -> [330502];
get_looks_id({30501, 10}) -> [330501];
get_looks_id({30510, 10}) -> [500142];
get_looks_id({40511, 10}) -> [500152, 500162];
get_looks_id({30513, 10}) -> [500172];
get_looks_id({40513, 10}) -> [500182];
get_looks_id({50502, 10}) -> [500192];
get_looks_id({20514, 10}) -> [500202];
get_looks_id({20511, 10}) -> [500212];
get_looks_id({40519, 10}) -> [500222];
get_looks_id({30514, 6}) -> [230514];
get_looks_id({30513, 6}) -> [230513];
get_looks_id({30512, 6}) -> [230512];
get_looks_id({30511, 6}) -> [230511];
get_looks_id({30510, 6}) -> [230510];
get_looks_id({30509, 6}) -> [230509];
get_looks_id({30508, 6}) -> [230508];
get_looks_id({30507, 6}) -> [230507];
get_looks_id({30506, 6}) -> [230506];
get_looks_id({30505, 6}) -> [230505];
get_looks_id({30504, 6}) -> [230504];
get_looks_id({30503, 6}) -> [230503];
get_looks_id({30502, 6}) -> [230502];
get_looks_id({30501, 6}) -> [230501];
get_looks_id({30402, 6}) -> [130599];
get_looks_id({30514, 5}) -> [130514];
get_looks_id({30513, 5}) -> [130513];
get_looks_id({30512, 5}) -> [130512];
get_looks_id({30511, 5}) -> [130511];
get_looks_id({30510, 5}) -> [130510];
get_looks_id({30509, 5}) -> [130509];
get_looks_id({30508, 5}) -> [130508];
get_looks_id({30507, 5}) -> [130507];
get_looks_id({30506, 5}) -> [130506];
get_looks_id({30505, 5}) -> [130505];
get_looks_id({30504, 5}) -> [130504];
get_looks_id({30503, 5}) -> [130503];
get_looks_id({30502, 5}) -> [130502];
get_looks_id({30501, 5}) -> [130501];
get_looks_id({30402, 5}) -> [130499];
get_looks_id({30405, 4}) -> [130405];
get_looks_id({30404, 4}) -> [130404];
get_looks_id({30403, 4}) -> [130403];
get_looks_id({30402, 4}) -> [130402];
get_looks_id({30401, 4}) -> [130401];
get_looks_id({30305, 3}) -> [130305];
get_looks_id({30304, 3}) -> [130304];
get_looks_id({30303, 3}) -> [130303];
get_looks_id({30302, 3}) -> [130302];
get_looks_id({30301, 3}) -> [130301];
get_looks_id({30202, 2}) -> [130202];
get_looks_id({30201, 2}) -> [130201];
get_looks_id({30101, 1}) -> [130101];
get_looks_id({20513, 10}) -> [320513];
get_looks_id({20512, 10}) -> [320512];
get_looks_id({20511, 10}) -> [320511];
get_looks_id({20510, 10}) -> [320510];
get_looks_id({20509, 10}) -> [320509];
get_looks_id({20508, 10}) -> [320508, 500022, 500192];
get_looks_id({20507, 10}) -> [320507, 500102];
get_looks_id({20505, 10}) -> [320505];
get_looks_id({20504, 10}) -> [320504];
get_looks_id({20502, 10}) -> [320502];
get_looks_id({20501, 10}) -> [320501];
get_looks_id({20513, 6}) -> [220513];
get_looks_id({20512, 6}) -> [220512];
get_looks_id({20511, 6}) -> [220511];
get_looks_id({20510, 6}) -> [220510];
get_looks_id({20509, 6}) -> [220509];
get_looks_id({20508, 6}) -> [220508];
get_looks_id({20507, 6}) -> [220507];
get_looks_id({20506, 6}) -> [220506];
get_looks_id({20505, 6}) -> [220505];
get_looks_id({20504, 6}) -> [220504];
get_looks_id({20503, 6}) -> [220503];
get_looks_id({20502, 6}) -> [220502];
get_looks_id({20501, 6}) -> [220501];
get_looks_id({20513, 5}) -> [120513];
get_looks_id({20512, 5}) -> [120512];
get_looks_id({20511, 5}) -> [120511];
get_looks_id({20510, 5}) -> [120510];
get_looks_id({20509, 5}) -> [120509];
get_looks_id({20508, 5}) -> [120508];
get_looks_id({20507, 5}) -> [120507];
get_looks_id({20506, 5}) -> [120506];
get_looks_id({20505, 5}) -> [120505];
get_looks_id({20504, 5}) -> [120504];
get_looks_id({20503, 5}) -> [120503];
get_looks_id({20502, 5}) -> [120502];
get_looks_id({20501, 5}) -> [120501];
get_looks_id({20405, 4}) -> [120405];
get_looks_id({20404, 4}) -> [120404];
get_looks_id({20403, 4}) -> [120403];
get_looks_id({20402, 4}) -> [120402];
get_looks_id({20401, 4}) -> [120401];
get_looks_id({20305, 3}) -> [120305];
get_looks_id({20304, 3}) -> [120304];
get_looks_id({20303, 3}) -> [120303];
get_looks_id({20302, 3}) -> [120302];
get_looks_id({20301, 3}) -> [120301];
get_looks_id({20202, 2}) -> [120202];
get_looks_id({20201, 2}) -> [120201];
get_looks_id({20101, 1}) -> [120101];
get_looks_id({62000, 10}) -> [362000];
get_looks_id({10514, 10}) -> [310514];
get_looks_id({10513, 10}) -> [310513];
get_looks_id({10512, 10}) -> [310512];
get_looks_id({10511, 10}) -> [310511];
get_looks_id({10510, 10}) -> [310510];
get_looks_id({10507, 10}) -> [310507];
get_looks_id({10505, 10}) -> [310505, 500032];
get_looks_id({10504, 10}) -> [310504];
get_looks_id({10503, 10}) -> [310503];
get_looks_id({10502, 10}) -> [310502];
get_looks_id({10501, 10}) -> [310501, 500052];
get_looks_id({62000, 6}) -> [262000];
get_looks_id({10514, 6}) -> [210514];
get_looks_id({10513, 6}) -> [210513];
get_looks_id({10512, 6}) -> [210512];
get_looks_id({10511, 6}) -> [210511];
get_looks_id({10510, 6}) -> [210510];
get_looks_id({10509, 6}) -> [210509];
get_looks_id({10508, 6}) -> [210508];
get_looks_id({10507, 6}) -> [210507];
get_looks_id({10506, 6}) -> [210506];
get_looks_id({10505, 6}) -> [210505];
get_looks_id({10504, 6}) -> [210504];
get_looks_id({10503, 6}) -> [210503];
get_looks_id({10502, 6}) -> [210502];
get_looks_id({10501, 6}) -> [210501];
get_looks_id({62000, 5}) -> [162000];
get_looks_id({10514, 5}) -> [110514];
get_looks_id({10513, 5}) -> [110513];
get_looks_id({10512, 5}) -> [110512];
get_looks_id({10511, 5}) -> [110511];
get_looks_id({10510, 5}) -> [110510];
get_looks_id({10509, 5}) -> [110509];
get_looks_id({10508, 5}) -> [110508];
get_looks_id({10507, 5}) -> [110507];
get_looks_id({10506, 5}) -> [110506];
get_looks_id({10505, 5}) -> [110505];
get_looks_id({10504, 5}) -> [110504];
get_looks_id({10503, 5}) -> [110503];
get_looks_id({10502, 5}) -> [110502];
get_looks_id({10501, 5}) -> [110501];
get_looks_id({10405, 4}) -> [110405];
get_looks_id({10404, 4}) -> [110404];
get_looks_id({10403, 4}) -> [110403];
get_looks_id({10402, 4}) -> [110402];
get_looks_id({10401, 4}) -> [110401];
get_looks_id({10305, 3}) -> [110305];
get_looks_id({10304, 3}) -> [110304];
get_looks_id({10303, 3}) -> [110303];
get_looks_id({10302, 3}) -> [110302];
get_looks_id({10301, 3}) -> [110301];
get_looks_id({10202, 2}) -> [110202];
get_looks_id({10201, 2}) -> [110201];
get_looks_id({10101, 1}) -> [110101];
get_looks_id({10518, 5}) -> [110518];
get_looks_id({10518, 6}) -> [210518];
get_looks_id({10518, 10}) -> [310518];
get_looks_id({10518, 13}) -> [410518];
get_looks_id({40523, 5}) -> [140523];
get_looks_id({40523, 6}) -> [240523];
get_looks_id({40523, 10}) -> [340523];
get_looks_id({40523, 13}) -> [440523];
get_looks_id({50923, 5}) -> [150923];
get_looks_id({50923, 6}) -> [250923];
get_looks_id({50923, 10}) -> [350923];
get_looks_id({50923, 13}) -> [450923];
get_looks_id({40923, 5}) -> [140923];
get_looks_id({40923, 6}) -> [240923];
get_looks_id({40923, 10}) -> [340923];
get_looks_id({40923, 13}) -> [440923];
get_looks_id({50524, 5}) -> [150524];
get_looks_id({50524, 6}) -> [250524];
get_looks_id({50524, 10}) -> [350524];
get_looks_id({50524, 13}) -> [450524];
get_looks_id({40524, 5}) -> [140524];
get_looks_id({40524, 6}) -> [240524];
get_looks_id({40524, 10}) -> [340524];
get_looks_id({40524, 13}) -> [440524];
get_looks_id({20517, 5}) -> [120517];
get_looks_id({20517, 6}) -> [220517];
get_looks_id({20517, 10}) -> [320517];
get_looks_id({20517, 13}) -> [420517];
get_looks_id({20518, 5}) -> [120518];
get_looks_id({20518, 6}) -> [220518];
get_looks_id({20518, 10}) -> [320518];
get_looks_id({20518, 13}) -> [420518];
get_looks_id({30518, 5}) -> [130518];
get_looks_id({30518, 6}) -> [230518];
get_looks_id({30518, 10}) -> [330518];
get_looks_id({30518, 13}) -> [430518];
get_looks_id({40518, 5}) -> [140518];
get_looks_id({40518, 6}) -> [240518];
get_looks_id({40518, 10}) -> [340518];
get_looks_id({40518, 13}) -> [440518];
get_looks_id({40519, 5}) -> [140519];
get_looks_id({40519, 6}) -> [240519];
get_looks_id({40519, 10}) -> [340519];
get_looks_id({40519, 13}) -> [440519];
get_looks_id({40520, 5}) -> [140520];
get_looks_id({40520, 6}) -> [240520];
get_looks_id({40520, 10}) -> [340520];
get_looks_id({40520, 13}) -> [440520];
get_looks_id({40521, 5}) -> [140521];
get_looks_id({40521, 6}) -> [240521];
get_looks_id({40521, 10}) -> [340521];
get_looks_id({40521, 13}) -> [440521];
get_looks_id({40522, 5}) -> [140522];
get_looks_id({40522, 6}) -> [240522];
get_looks_id({40522, 10}) -> [340522];
get_looks_id({40522, 13}) -> [440522];
get_looks_id({50520, 5}) -> [150520];
get_looks_id({50520, 6}) -> [250520];
get_looks_id({50520, 10}) -> [350520];
get_looks_id({50520, 13}) -> [450520];
get_looks_id({50521, 5}) -> [150521];
get_looks_id({50521, 6}) -> [250521];
get_looks_id({50521, 10}) -> [350521];
get_looks_id({50521, 13}) -> [450521];
get_looks_id({50522, 5}) -> [150522];
get_looks_id({50522, 6}) -> [250522];
get_looks_id({50522, 10}) -> [350522];
get_looks_id({50522, 13}) -> [450522];
get_looks_id({50523, 5}) -> [150523];
get_looks_id({50523, 6}) -> [250523];
get_looks_id({50523, 10}) -> [350523];
get_looks_id({50523, 13}) -> [450523];
get_looks_id({50519, 5}) -> [150519];
get_looks_id({50519, 6}) -> [250519];
get_looks_id({50519, 10}) -> [350519];
get_looks_id({50519, 13}) -> [450519];
get_looks_id(_) -> [].

get_attr(110101) -> [];
get_attr(110201) -> [];
get_attr(110202) -> [];
get_attr(110301) -> [];
get_attr(110302) -> [];
get_attr(110303) -> [];
get_attr(110304) -> [];
get_attr(110305) -> [];
get_attr(110401) -> [];
get_attr(110402) -> [];
get_attr(110403) -> [];
get_attr(110404) -> [];
get_attr(110405) -> [];
get_attr(110501) -> [];
get_attr(110502) -> [];
get_attr(110503) -> [];
get_attr(110504) -> [];
get_attr(110505) -> [];
get_attr(110506) -> [];
get_attr(110507) -> [];
get_attr(110508) -> [];
get_attr(110509) -> [];
get_attr(110510) -> [];
get_attr(110511) -> [];
get_attr(110512) -> [];
get_attr(110513) -> [];
get_attr(110514) -> [];
get_attr(162000) -> [];
get_attr(210501) -> [];
get_attr(210502) -> [];
get_attr(210503) -> [];
get_attr(210504) -> [];
get_attr(210505) -> [];
get_attr(210506) -> [];
get_attr(210507) -> [];
get_attr(210508) -> [];
get_attr(210509) -> [];
get_attr(210510) -> [];
get_attr(210511) -> [];
get_attr(210512) -> [];
get_attr(210513) -> [];
get_attr(210514) -> [];
get_attr(262000) -> [];
get_attr(310501) -> [];
get_attr(310502) -> [];
get_attr(310503) -> [];
get_attr(310504) -> [];
get_attr(310505) -> [];
get_attr(310507) -> [];
get_attr(310510) -> [];
get_attr(310511) -> [];
get_attr(310512) -> [];
get_attr(310513) -> [];
get_attr(310514) -> [];
get_attr(362000) -> [];
get_attr(120101) -> [];
get_attr(120201) -> [];
get_attr(120202) -> [];
get_attr(120301) -> [];
get_attr(120302) -> [];
get_attr(120303) -> [];
get_attr(120304) -> [];
get_attr(120305) -> [];
get_attr(120401) -> [];
get_attr(120402) -> [];
get_attr(120403) -> [];
get_attr(120404) -> [];
get_attr(120405) -> [];
get_attr(120501) -> [];
get_attr(120502) -> [];
get_attr(120503) -> [];
get_attr(120504) -> [];
get_attr(120505) -> [];
get_attr(120506) -> [];
get_attr(120507) -> [];
get_attr(120508) -> [];
get_attr(120509) -> [];
get_attr(120510) -> [];
get_attr(120511) -> [];
get_attr(120512) -> [];
get_attr(120513) -> [];
get_attr(220501) -> [];
get_attr(220502) -> [];
get_attr(220503) -> [];
get_attr(220504) -> [];
get_attr(220505) -> [];
get_attr(220506) -> [];
get_attr(220507) -> [];
get_attr(220508) -> [];
get_attr(220509) -> [];
get_attr(220510) -> [];
get_attr(220511) -> [];
get_attr(220512) -> [];
get_attr(220513) -> [];
get_attr(320501) -> [];
get_attr(320502) -> [];
get_attr(320504) -> [];
get_attr(320505) -> [];
get_attr(320507) -> [];
get_attr(320508) -> [];
get_attr(320509) -> [];
get_attr(320510) -> [];
get_attr(320511) -> [];
get_attr(320512) -> [];
get_attr(320513) -> [];
get_attr(130101) -> [];
get_attr(130201) -> [];
get_attr(130202) -> [];
get_attr(130301) -> [];
get_attr(130302) -> [];
get_attr(130303) -> [];
get_attr(130304) -> [];
get_attr(130305) -> [];
get_attr(130401) -> [];
get_attr(130402) -> [];
get_attr(130403) -> [];
get_attr(130404) -> [];
get_attr(130405) -> [];
get_attr(130499) -> [];
get_attr(130501) -> [];
get_attr(130502) -> [];
get_attr(130503) -> [];
get_attr(130504) -> [];
get_attr(130505) -> [];
get_attr(130506) -> [];
get_attr(130507) -> [];
get_attr(130508) -> [];
get_attr(130509) -> [];
get_attr(130510) -> [];
get_attr(130511) -> [];
get_attr(130512) -> [];
get_attr(130513) -> [];
get_attr(130514) -> [];
get_attr(130599) -> [];
get_attr(230501) -> [];
get_attr(230502) -> [];
get_attr(230503) -> [];
get_attr(230504) -> [];
get_attr(230505) -> [];
get_attr(230506) -> [];
get_attr(230507) -> [];
get_attr(230508) -> [];
get_attr(230509) -> [];
get_attr(230510) -> [];
get_attr(230511) -> [];
get_attr(230512) -> [];
get_attr(230513) -> [];
get_attr(230514) -> [];
get_attr(330501) -> [];
get_attr(330502) -> [];
get_attr(330504) -> [];
get_attr(330506) -> [];
get_attr(330507) -> [];
get_attr(330508) -> [];
get_attr(330509) -> [];
get_attr(330510) -> [];
get_attr(330511) -> [];
get_attr(330512) -> [];
get_attr(330513) -> [];
get_attr(330514) -> [];
get_attr(140301) -> [];
get_attr(140401) -> [];
get_attr(140402) -> [];
get_attr(140403) -> [];
get_attr(140404) -> [];
get_attr(140501) -> [];
get_attr(140502) -> [];
get_attr(140503) -> [];
get_attr(140504) -> [];
get_attr(140505) -> [];
get_attr(140506) -> [];
get_attr(140507) -> [];
get_attr(140508) -> [];
get_attr(140509) -> [];
get_attr(140510) -> [];
get_attr(140511) -> [];
get_attr(140512) -> [];
get_attr(161000) -> [];
get_attr(240501) -> [];
get_attr(240502) -> [];
get_attr(240503) -> [];
get_attr(240504) -> [];
get_attr(240505) -> [];
get_attr(240506) -> [];
get_attr(240507) -> [];
get_attr(240508) -> [];
get_attr(240509) -> [];
get_attr(240510) -> [];
get_attr(240511) -> [];
get_attr(240512) -> [];
get_attr(261000) -> [];
get_attr(340502) -> [];
get_attr(340503) -> [];
get_attr(340504) -> [];
get_attr(340506) -> [];
get_attr(340507) -> [];
get_attr(340508) -> [];
get_attr(340509) -> [];
get_attr(340510) -> [];
get_attr(340511) -> [];
get_attr(340512) -> [];
get_attr(361000) -> [];
get_attr(150301) -> [];
get_attr(150401) -> [];
get_attr(150402) -> [];
get_attr(150403) -> [];
get_attr(150404) -> [];
get_attr(150501) -> [];
get_attr(150502) -> [];
get_attr(150503) -> [];
get_attr(150504) -> [];
get_attr(150505) -> [];
get_attr(150506) -> [];
get_attr(150507) -> [];
get_attr(150508) -> [];
get_attr(150509) -> [];
get_attr(150510) -> [];
get_attr(150511) -> [];
get_attr(150512) -> [];
get_attr(150513) -> [];
get_attr(163000) -> [];
get_attr(250501) -> [];
get_attr(250502) -> [];
get_attr(250503) -> [];
get_attr(250504) -> [];
get_attr(250505) -> [];
get_attr(250506) -> [];
get_attr(250507) -> [];
get_attr(250508) -> [];
get_attr(250509) -> [];
get_attr(250510) -> [];
get_attr(250511) -> [];
get_attr(250512) -> [];
get_attr(250513) -> [];
get_attr(263000) -> [];
get_attr(350502) -> [];
get_attr(350503) -> [];
get_attr(350504) -> [];
get_attr(350505) -> [];
get_attr(350507) -> [];
get_attr(350508) -> [];
get_attr(350509) -> [];
get_attr(350510) -> [];
get_attr(350511) -> [];
get_attr(350512) -> [];
get_attr(350513) -> [];
get_attr(363000) -> [];
get_attr(500001) -> [];
get_attr(500002) -> [];
get_attr(500011) -> [];
get_attr(500012) -> [];
get_attr(500013) -> [];
get_attr(500014) -> [];
get_attr(500021) -> [];
get_attr(500022) -> [];
get_attr(500031) -> [];
get_attr(500032) -> [];
get_attr(500041) -> [];
get_attr(500042) -> [];
get_attr(500051) -> [];
get_attr(500052) -> [];
get_attr(500061) -> [];
get_attr(500062) -> [];
get_attr(500071) -> [];
get_attr(500072) -> [];
get_attr(500081) -> [];
get_attr(500082) -> [];
get_attr(500091) -> [];
get_attr(500092) -> [];
get_attr(500101) -> [];
get_attr(500102) -> [];
get_attr(500111) -> [];
get_attr(500112) -> [];
get_attr(500121) -> [];
get_attr(500122) -> [];
get_attr(500131) -> [];
get_attr(500132) -> [];
get_attr(500141) -> [];
get_attr(500142) -> [];
get_attr(500151) -> [];
get_attr(500152) -> [];
get_attr(500161) -> [];
get_attr(500162) -> [];
get_attr(500171) -> [];
get_attr(500172) -> [];
get_attr(500181) -> [];
get_attr(500182) -> [];
get_attr(500191) -> [];
get_attr(500192) -> [];
get_attr(160582) -> [];
get_attr(260582) -> [];
get_attr(360582) -> [];
get_attr(120514) -> [];
get_attr(220514) -> [];
get_attr(320514) -> [];
get_attr(120515) -> [];
get_attr(220515) -> [];
get_attr(320515) -> [];
get_attr(120600) -> [];
get_attr(220600) -> [];
get_attr(320600) -> [];
get_attr(160000) -> [];
get_attr(260000) -> [];
get_attr(360000) -> [];
get_attr(160518) -> [];
get_attr(260518) -> [];
get_attr(360518) -> [];
get_attr(160541) -> [];
get_attr(260541) -> [];
get_attr(360541) -> [];
get_attr(170505) -> [];
get_attr(270505) -> [];
get_attr(370505) -> [];
get_attr(140513) -> [];
get_attr(240513) -> [];
get_attr(340513) -> [];
get_attr(140514) -> [];
get_attr(240514) -> [];
get_attr(340514) -> [];
get_attr(140515) -> [];
get_attr(240515) -> [];
get_attr(340515) -> [];
get_attr(140516) -> [];
get_attr(240516) -> [];
get_attr(340516) -> [];
get_attr(140517) -> [];
get_attr(240517) -> [];
get_attr(340517) -> [];
get_attr(163005) -> [];
get_attr(263005) -> [];
get_attr(363005) -> [];
get_attr(1605029) -> [];
get_attr(2605029) -> [];
get_attr(3605029) -> [];
get_attr(110515) -> [];
get_attr(210515) -> [];
get_attr(310515) -> [];
get_attr(150601) -> [];
get_attr(250601) -> [];
get_attr(350601) -> [];
get_attr(150602) -> [];
get_attr(250602) -> [];
get_attr(350602) -> [];
get_attr(160538) -> [];
get_attr(260538) -> [];
get_attr(360538) -> [];
get_attr(170512) -> [];
get_attr(270512) -> [];
get_attr(370512) -> [];
get_attr(110518) -> [];
get_attr(210518) -> [];
get_attr(310518) -> [];
get_attr(410518) -> [];
get_attr(140523) -> [];
get_attr(240523) -> [];
get_attr(340523) -> [];
get_attr(440523) -> [];
get_attr(150923) -> [];
get_attr(250923) -> [];
get_attr(350923) -> [];
get_attr(450923) -> [];
get_attr(140923) -> [];
get_attr(240923) -> [];
get_attr(340923) -> [];
get_attr(440923) -> [];
get_attr(150524) -> [];
get_attr(250524) -> [];
get_attr(350524) -> [];
get_attr(450524) -> [];
get_attr(140524) -> [];
get_attr(240524) -> [];
get_attr(340524) -> [];
get_attr(440524) -> [];
get_attr(120517) -> [];
get_attr(220517) -> [];
get_attr(320517) -> [];
get_attr(420517) -> [];
get_attr(120518) -> [];
get_attr(220518) -> [];
get_attr(320518) -> [];
get_attr(420518) -> [];
get_attr(130518) -> [];
get_attr(230518) -> [];
get_attr(330518) -> [];
get_attr(430518) -> [];
get_attr(140518) -> [];
get_attr(240518) -> [];
get_attr(340518) -> [];
get_attr(440518) -> [];
get_attr(140519) -> [];
get_attr(240519) -> [];
get_attr(340519) -> [];
get_attr(440519) -> [];
get_attr(140520) -> [];
get_attr(140521) -> [];
get_attr(140522) -> [];
get_attr(240520) -> [];
get_attr(240521) -> [];
get_attr(240522) -> [];
get_attr(340520) -> [];
get_attr(340521) -> [];
get_attr(340522) -> [];
get_attr(440520) -> [];
get_attr(440521) -> [];
get_attr(440522) -> [];
get_attr(150520) -> [];
get_attr(150521) -> [];
get_attr(150522) -> [];
get_attr(250520) -> [];
get_attr(250521) -> [];
get_attr(250522) -> [];
get_attr(350520) -> [];
get_attr(350521) -> [];
get_attr(350522) -> [];
get_attr(450520) -> [];
get_attr(450521) -> [];
get_attr(450522) -> [];
get_attr(150519) -> [];
get_attr(250519) -> [];
get_attr(350519) -> [];
get_attr(150523) -> [];
get_attr(250523) -> [];
get_attr(350523) -> [];
get_attr(450523) -> [];
get_attr(_) -> [].

get_pre(110101) -> 0;
get_pre(110201) -> 0;
get_pre(110202) -> 0;
get_pre(110301) -> 0;
get_pre(110302) -> 0;
get_pre(110303) -> 0;
get_pre(110304) -> 0;
get_pre(110305) -> 0;
get_pre(110401) -> 0;
get_pre(110402) -> 0;
get_pre(110403) -> 0;
get_pre(110404) -> 0;
get_pre(110405) -> 0;
get_pre(110501) -> 0;
get_pre(110502) -> 0;
get_pre(110503) -> 0;
get_pre(110504) -> 0;
get_pre(110505) -> 0;
get_pre(110506) -> 0;
get_pre(110507) -> 0;
get_pre(110508) -> 0;
get_pre(110509) -> 0;
get_pre(110510) -> 0;
get_pre(110511) -> 0;
get_pre(110512) -> 0;
get_pre(110513) -> 0;
get_pre(110514) -> 0;
get_pre(162000) -> 0;
get_pre(210501) -> 0;
get_pre(210502) -> 0;
get_pre(210503) -> 0;
get_pre(210504) -> 0;
get_pre(210505) -> 0;
get_pre(210506) -> 0;
get_pre(210507) -> 0;
get_pre(210508) -> 0;
get_pre(210509) -> 0;
get_pre(210510) -> 0;
get_pre(210511) -> 0;
get_pre(210512) -> 0;
get_pre(210513) -> 0;
get_pre(210514) -> 0;
get_pre(262000) -> 0;
get_pre(310501) -> 0;
get_pre(310502) -> 0;
get_pre(310503) -> 0;
get_pre(310504) -> 0;
get_pre(310505) -> 0;
get_pre(310507) -> 0;
get_pre(310510) -> 0;
get_pre(310511) -> 0;
get_pre(310512) -> 0;
get_pre(310513) -> 0;
get_pre(310514) -> 0;
get_pre(362000) -> 0;
get_pre(120101) -> 0;
get_pre(120201) -> 0;
get_pre(120202) -> 0;
get_pre(120301) -> 0;
get_pre(120302) -> 0;
get_pre(120303) -> 0;
get_pre(120304) -> 0;
get_pre(120305) -> 0;
get_pre(120401) -> 0;
get_pre(120402) -> 0;
get_pre(120403) -> 0;
get_pre(120404) -> 0;
get_pre(120405) -> 0;
get_pre(120501) -> 0;
get_pre(120502) -> 0;
get_pre(120503) -> 0;
get_pre(120504) -> 0;
get_pre(120505) -> 0;
get_pre(120506) -> 0;
get_pre(120507) -> 0;
get_pre(120508) -> 0;
get_pre(120509) -> 0;
get_pre(120510) -> 0;
get_pre(120511) -> 0;
get_pre(120512) -> 0;
get_pre(120513) -> 0;
get_pre(220501) -> 0;
get_pre(220502) -> 0;
get_pre(220503) -> 0;
get_pre(220504) -> 0;
get_pre(220505) -> 0;
get_pre(220506) -> 0;
get_pre(220507) -> 0;
get_pre(220508) -> 0;
get_pre(220509) -> 0;
get_pre(220510) -> 0;
get_pre(220511) -> 0;
get_pre(220512) -> 0;
get_pre(220513) -> 0;
get_pre(320501) -> 0;
get_pre(320502) -> 0;
get_pre(320504) -> 0;
get_pre(320505) -> 0;
get_pre(320507) -> 0;
get_pre(320508) -> 0;
get_pre(320509) -> 0;
get_pre(320510) -> 0;
get_pre(320511) -> 0;
get_pre(320512) -> 0;
get_pre(320513) -> 0;
get_pre(130101) -> 0;
get_pre(130201) -> 0;
get_pre(130202) -> 0;
get_pre(130301) -> 0;
get_pre(130302) -> 0;
get_pre(130303) -> 0;
get_pre(130304) -> 0;
get_pre(130305) -> 0;
get_pre(130401) -> 0;
get_pre(130402) -> 0;
get_pre(130403) -> 0;
get_pre(130404) -> 0;
get_pre(130405) -> 0;
get_pre(130499) -> 0;
get_pre(130501) -> 0;
get_pre(130502) -> 0;
get_pre(130503) -> 0;
get_pre(130504) -> 0;
get_pre(130505) -> 0;
get_pre(130506) -> 0;
get_pre(130507) -> 0;
get_pre(130508) -> 0;
get_pre(130509) -> 0;
get_pre(130510) -> 0;
get_pre(130511) -> 0;
get_pre(130512) -> 0;
get_pre(130513) -> 0;
get_pre(130514) -> 0;
get_pre(130599) -> 0;
get_pre(230501) -> 0;
get_pre(230502) -> 0;
get_pre(230503) -> 0;
get_pre(230504) -> 0;
get_pre(230505) -> 0;
get_pre(230506) -> 0;
get_pre(230507) -> 0;
get_pre(230508) -> 0;
get_pre(230509) -> 0;
get_pre(230510) -> 0;
get_pre(230511) -> 0;
get_pre(230512) -> 0;
get_pre(230513) -> 0;
get_pre(230514) -> 0;
get_pre(330501) -> 0;
get_pre(330502) -> 0;
get_pre(330504) -> 0;
get_pre(330506) -> 0;
get_pre(330507) -> 0;
get_pre(330508) -> 0;
get_pre(330509) -> 0;
get_pre(330510) -> 0;
get_pre(330511) -> 0;
get_pre(330512) -> 0;
get_pre(330513) -> 0;
get_pre(330514) -> 0;
get_pre(140301) -> 0;
get_pre(140401) -> 0;
get_pre(140402) -> 0;
get_pre(140403) -> 0;
get_pre(140404) -> 0;
get_pre(140501) -> 0;
get_pre(140502) -> 0;
get_pre(140503) -> 0;
get_pre(140504) -> 0;
get_pre(140505) -> 0;
get_pre(140506) -> 0;
get_pre(140507) -> 0;
get_pre(140508) -> 0;
get_pre(140509) -> 0;
get_pre(140510) -> 0;
get_pre(140511) -> 0;
get_pre(140512) -> 0;
get_pre(161000) -> 0;
get_pre(240501) -> 0;
get_pre(240502) -> 0;
get_pre(240503) -> 0;
get_pre(240504) -> 0;
get_pre(240505) -> 0;
get_pre(240506) -> 0;
get_pre(240507) -> 0;
get_pre(240508) -> 0;
get_pre(240509) -> 0;
get_pre(240510) -> 0;
get_pre(240511) -> 0;
get_pre(240512) -> 0;
get_pre(261000) -> 0;
get_pre(340502) -> 0;
get_pre(340503) -> 0;
get_pre(340504) -> 0;
get_pre(340506) -> 0;
get_pre(340507) -> 0;
get_pre(340508) -> 0;
get_pre(340509) -> 0;
get_pre(340510) -> 0;
get_pre(340511) -> 0;
get_pre(340512) -> 0;
get_pre(361000) -> 0;
get_pre(150301) -> 0;
get_pre(150401) -> 0;
get_pre(150402) -> 0;
get_pre(150403) -> 0;
get_pre(150404) -> 0;
get_pre(150501) -> 0;
get_pre(150502) -> 0;
get_pre(150503) -> 0;
get_pre(150504) -> 0;
get_pre(150505) -> 0;
get_pre(150506) -> 0;
get_pre(150507) -> 0;
get_pre(150508) -> 0;
get_pre(150509) -> 0;
get_pre(150510) -> 0;
get_pre(150511) -> 0;
get_pre(150512) -> 0;
get_pre(150513) -> 0;
get_pre(163000) -> 0;
get_pre(250501) -> 0;
get_pre(250502) -> 0;
get_pre(250503) -> 0;
get_pre(250504) -> 0;
get_pre(250505) -> 0;
get_pre(250506) -> 0;
get_pre(250507) -> 0;
get_pre(250508) -> 0;
get_pre(250509) -> 0;
get_pre(250510) -> 0;
get_pre(250511) -> 0;
get_pre(250512) -> 0;
get_pre(250513) -> 0;
get_pre(263000) -> 0;
get_pre(350502) -> 0;
get_pre(350503) -> 0;
get_pre(350504) -> 0;
get_pre(350505) -> 0;
get_pre(350507) -> 0;
get_pre(350508) -> 0;
get_pre(350509) -> 0;
get_pre(350510) -> 0;
get_pre(350511) -> 0;
get_pre(350512) -> 0;
get_pre(350513) -> 0;
get_pre(363000) -> 0;
get_pre(500001) -> 0;
get_pre(500002) -> 500001;
get_pre(500011) -> 0;
get_pre(500012) -> 500011;
get_pre(500013) -> 0;
get_pre(500014) -> 500013;
get_pre(500021) -> 0;
get_pre(500022) -> 500021;
get_pre(500031) -> 0;
get_pre(500032) -> 500031;
get_pre(500041) -> 0;
get_pre(500042) -> 500041;
get_pre(500051) -> 0;
get_pre(500052) -> 500051;
get_pre(500061) -> 0;
get_pre(500062) -> 500061;
get_pre(500071) -> 500071;
get_pre(500072) -> 0;
get_pre(500081) -> 500081;
get_pre(500082) -> 0;
get_pre(500101) -> 500101;
get_pre(500102) -> 0;
get_pre(500111) -> 500111;
get_pre(500112) -> 0;
get_pre(500113) -> 500113;
get_pre(500114) -> 0;
get_pre(500115) -> 500115;
get_pre(500116) -> 0;
get_pre(500091) -> 500091;
get_pre(500092) -> 0;
get_pre(500121) -> 500121;
get_pre(500122) -> 0;
get_pre(500131) -> 500131;
get_pre(500132) -> 0;
get_pre(500141) -> 500141;
get_pre(500142) -> 0;
get_pre(500151) -> 500151;
get_pre(500152) -> 0;
get_pre(500161) -> 500161;
get_pre(500162) -> 0;
get_pre(500171) -> 0;
get_pre(500172) -> 500171;
get_pre(500181) -> 0;
get_pre(500182) -> 500181;
get_pre(500191) -> 0;
get_pre(500192) -> 500191;
get_pre(160582) -> 0;
get_pre(260582) -> 0;
get_pre(360582) -> 0;
get_pre(120514) -> 0;
get_pre(220514) -> 0;
get_pre(320514) -> 0;
get_pre(120515) -> 0;
get_pre(220515) -> 0;
get_pre(320515) -> 0;
get_pre(120600) -> 0;
get_pre(220600) -> 0;
get_pre(320600) -> 0;
get_pre(160000) -> 0;
get_pre(260000) -> 0;
get_pre(360000) -> 0;
get_pre(160518) -> 0;
get_pre(260518) -> 0;
get_pre(360518) -> 0;
get_pre(160541) -> 0;
get_pre(260541) -> 0;
get_pre(360541) -> 0;
get_pre(170505) -> 0;
get_pre(270505) -> 0;
get_pre(370505) -> 0;
get_pre(140513) -> 0;
get_pre(240513) -> 0;
get_pre(340513) -> 0;
get_pre(140514) -> 0;
get_pre(240514) -> 0;
get_pre(340514) -> 0;
get_pre(140515) -> 0;
get_pre(240515) -> 0;
get_pre(340515) -> 0;
get_pre(140516) -> 0;
get_pre(240516) -> 0;
get_pre(340516) -> 0;
get_pre(140517) -> 0;
get_pre(240517) -> 0;
get_pre(340517) -> 0;
get_pre(163005) -> 0;
get_pre(263005) -> 0;
get_pre(363005) -> 0;
get_pre(1605029) -> 0;
get_pre(2605029) -> 0;
get_pre(3605029) -> 0;
get_pre(110515) -> 0;
get_pre(210515) -> 0;
get_pre(310515) -> 0;
get_pre(150601) -> 0;
get_pre(250601) -> 0;
get_pre(350601) -> 0;
get_pre(150602) -> 0;
get_pre(250602) -> 0;
get_pre(350602) -> 0;
get_pre(160538) -> 0;
get_pre(260538) -> 0;
get_pre(360538) -> 0;
get_pre(170512) -> 0;
get_pre(270512) -> 0;
get_pre(370512) -> 0;
get_pre(140523) -> 0;
get_pre(240523) -> 0;
get_pre(340523) -> 0;
get_pre(440523) -> 0;
get_pre(150923) -> 0;
get_pre(250923) -> 0;
get_pre(350923) -> 0;
get_pre(450923) -> 0;
get_pre(140923) -> 0;
get_pre(240923) -> 0;
get_pre(340923) -> 0;
get_pre(440923) -> 0;
get_pre(150524) -> 0;
get_pre(250524) -> 0;
get_pre(350524) -> 0;
get_pre(450524) -> 0;
get_pre(140524) -> 0;
get_pre(240524) -> 0;
get_pre(340524) -> 0;
get_pre(440524) -> 0;
get_pre(110518) -> 0;
get_pre(210518) -> 0;
get_pre(310518) -> 0;
get_pre(410518) -> 0;
get_pre(120517) -> 0;
get_pre(220517) -> 0;
get_pre(320517) -> 0;
get_pre(420517) -> 0;
get_pre(120518) -> 0;
get_pre(220518) -> 0;
get_pre(320518) -> 0;
get_pre(420518) -> 0;
get_pre(130518) -> 0;
get_pre(230518) -> 0;
get_pre(330518) -> 0;
get_pre(430518) -> 0;
get_pre(140518) -> 0;
get_pre(240518) -> 0;
get_pre(340518) -> 0;
get_pre(440518) -> 0;
get_pre(140519) -> 0;
get_pre(240519) -> 0;
get_pre(340519) -> 0;
get_pre(440519) -> 0;
get_pre(140520) -> 0;
get_pre(140521) -> 0;
get_pre(140522) -> 0;
get_pre(240520) -> 0;
get_pre(240521) -> 0;
get_pre(240522) -> 0;
get_pre(340520) -> 0;
get_pre(340521) -> 0;
get_pre(340522) -> 0;
get_pre(440520) -> 0;
get_pre(440521) -> 0;
get_pre(440522) -> 0;
get_pre(150520) -> 0;
get_pre(150521) -> 0;
get_pre(150522) -> 0;
get_pre(250520) -> 0;
get_pre(250521) -> 0;
get_pre(250522) -> 0;
get_pre(350520) -> 0;
get_pre(350521) -> 0;
get_pre(350522) -> 0;
get_pre(450520) -> 0;
get_pre(450521) -> 0;
get_pre(450522) -> 0;
get_pre(150523) -> 0;
get_pre(250523) -> 0;
get_pre(350523) -> 0;
get_pre(450523) -> 0;
get_pre(150519) -> 0;
get_pre(250519) -> 0;
get_pre(350519) -> 0;
get_pre(500141) -> 0;
get_pre(500142) -> 500141;
get_pre(500151) -> 0;
get_pre(500152) -> 500151;
get_pre(500153) -> 500151;
get_pre(500161) -> 0;
get_pre(500162) -> 500151;
get_pre(500171) -> 0;
get_pre(500172) -> 500171;
get_pre(500181) -> 0;
get_pre(500182) -> 500181;
get_pre(500191) -> 0;
get_pre(500192) -> 500191;
get_pre(500201) -> 0;
get_pre(500202) -> 500201;
get_pre(500211) -> 0;
get_pre(500212) -> 500211;
get_pre(500221) -> 0;
get_pre(500222) -> 500221;
get_pre(500231) -> 0;
get_pre(500232) -> 500231;
get_pre(500241) -> 0;
get_pre(500242) -> 500241;
get_pre(600001) -> 0;
get_pre(600002) -> 0;
get_pre(600003) -> 0;
get_pre(_) -> 0.


