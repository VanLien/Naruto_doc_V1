-file("src/mod/data/personal_push_data.erl", 1).

-module(personal_push_data).

-lager_records([{personal_push_gift_data,
		 [gift_id, type_id, charge_id, limit_count, money,
		  costly_num, valid_time, open_cond, warehouse_id, award,
		  over_time, buy_count, trigger_id]},
		{m_personal_push,
		 [ver, fire_type, fire_not_buy, fire_gift, ext]}]).

-export([get_const/1, get_trigger_desc/1,
	 get_gift_type_list/1, get_trigger_list/0,
	 get_cond_id_list/0, get_rfm_list/1, get_score_range/0,
	 get_scores_to_money/1, get_gift_list/1, get_gift/1,
	 get_type_cd/1, get_warehouse_cond/1]).

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

-file("src/mod/data/personal_push_data.erl", 21).

-file("inc/personal_push.hrl", 1).

-record(m_personal_push,
	{ver = 1, fire_type = [], fire_not_buy = [],
	 fire_gift = [], ext = []}).

-record(personal_push_gift_data,
	{gift_id = 0, type_id = 0, charge_id = 0,
	 limit_count = 0, money = 0, costly_num = 0,
	 valid_time = 0, open_cond = [], warehouse_id = [],
	 award = [], over_time = 0, buy_count = 0,
	 trigger_id = 0}).

-file("src/mod/data/personal_push_data.erl", 22).

get_const(charge_day) -> 15;
get_const(fire_not_buy_day) -> 7;
get_const(start_time) -> {2021, 1, 1, 0, 0, 0};
get_const(end_time) -> {2021, 12, 31, 23, 59, 59};
get_const(open_cond) -> [{lev, 10}];
get_const(_) -> undefined.

get_trigger_desc(10001) ->
    lang:get(<<"恭喜您等级升至50级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10002) ->
    lang:get(<<"恭喜您等级升至60级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10003) ->
    lang:get(<<"恭喜您等级升至70级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10004) ->
    lang:get(<<"恭喜您等级升至80级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10005) ->
    lang:get(<<"恭喜您等级升至90级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10006) ->
    lang:get(<<"恭喜您等级升至100级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10007) ->
    lang:get(<<"恭喜您等级升至110级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10008) ->
    lang:get(<<"恭喜您等级升至120级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10009) ->
    lang:get(<<"恭喜您等级升至130级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10010) ->
    lang:get(<<"恭喜您等级升至140级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10011) ->
    lang:get(<<"恭喜您等级升至155级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10012) ->
    lang:get(<<"恭喜您等级升至160级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10013) ->
    lang:get(<<"恭喜您等级升至165级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10014) ->
    lang:get(<<"恭喜您等级升至170级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10015) ->
    lang:get(<<"恭喜您等级升至175级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10016) ->
    lang:get(<<"恭喜您等级升至185级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10017) ->
    lang:get(<<"恭喜您等级升至190级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10018) ->
    lang:get(<<"恭喜您等级升至195级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(10019) ->
    lang:get(<<"恭喜您等级升至200级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(11001) ->
    lang:get(<<"恭喜您的英雄实力飞升，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(12001) ->
    lang:get(<<"恭喜您获得了100次竞技场胜利，我们为您准备了超值礼包，助您再创佳绩！"/utf8>>);
get_trigger_desc(14001) ->
    lang:get(<<"恭喜您通关了试炼塔50关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14002) ->
    lang:get(<<"恭喜您通关了试炼塔100关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14003) ->
    lang:get(<<"恭喜您通关了试炼塔150关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14004) ->
    lang:get(<<"恭喜您通关了试炼塔200关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14005) ->
    lang:get(<<"恭喜您通关了试炼塔250关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14006) ->
    lang:get(<<"恭喜您通关了试炼塔300关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14007) ->
    lang:get(<<"恭喜您通关了试炼塔350关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14008) ->
    lang:get(<<"恭喜您通关了试炼塔400关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14009) ->
    lang:get(<<"恭喜您通关了试炼塔450关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14010) ->
    lang:get(<<"恭喜您通关了试炼塔500关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14011) ->
    lang:get(<<"恭喜您通关了试炼塔550关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14012) ->
    lang:get(<<"恭喜您通关了试炼塔600关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14013) ->
    lang:get(<<"恭喜您通关了试炼塔650关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14014) ->
    lang:get(<<"恭喜您通关了试炼塔700关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14015) ->
    lang:get(<<"恭喜您通关了试炼塔750关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14016) ->
    lang:get(<<"恭喜您通关了试炼塔800关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14017) ->
    lang:get(<<"恭喜您通关了试炼塔850关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14018) ->
    lang:get(<<"恭喜您通关了试炼塔900关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14019) ->
    lang:get(<<"恭喜您通关了试炼塔950关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(14020) ->
    lang:get(<<"恭喜您通关了试炼塔1000关，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(15001) ->
    lang:get(<<"试练之路屡屡失利，我们为您准备了超值礼包，帮助您战力飞升！"/utf8>>);
get_trigger_desc(16001) ->
    lang:get(<<"恭喜您无尽试炼屡创佳绩，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17001) ->
    lang:get(<<"恭喜您通关主线第1章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17002) ->
    lang:get(<<"恭喜您通关主线第2章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17003) ->
    lang:get(<<"恭喜您通关主线第3章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17004) ->
    lang:get(<<"恭喜您通关主线第4章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17005) ->
    lang:get(<<"恭喜您通关主线第5章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17006) ->
    lang:get(<<"恭喜您通关主线第6章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17007) ->
    lang:get(<<"恭喜您通关主线第7章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17008) ->
    lang:get(<<"恭喜您通关主线第8章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17009) ->
    lang:get(<<"恭喜您通关主线第9章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17010) ->
    lang:get(<<"恭喜您通关主线第10章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17011) ->
    lang:get(<<"恭喜您通关主线第11章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17012) ->
    lang:get(<<"恭喜您通关主线第12章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17013) ->
    lang:get(<<"恭喜您通关主线第13章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17014) ->
    lang:get(<<"恭喜您通关主线第14章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17015) ->
    lang:get(<<"恭喜您通关主线第15章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(17016) ->
    lang:get(<<"恭喜您通关主线第16章节，我们为您准备了超值礼包，帮助您更快通关！"/utf8>>);
get_trigger_desc(20001) ->
    lang:get(<<"恭喜您获取到了强力符文，我们为您准备了超值礼包，帮助您战力飞升！"/utf8>>);
get_trigger_desc(20002) ->
    lang:get(<<"恭喜您获取到了强力符文，我们为您准备了超值礼包，帮助您战力飞升！"/utf8>>);
get_trigger_desc(21001) ->
    lang:get(<<"欧气满满，心想事成，我们为您准备了超值礼包，帮助您战力飞升！"/utf8>>);
get_trigger_desc(30001) ->
    lang:get(<<"恭喜您提升至18级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30002) ->
    lang:get(<<"恭喜您提升至30级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30003) ->
    lang:get(<<"恭喜您提升至48级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30004) ->
    lang:get(<<"恭喜您提升至68级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30005) ->
    lang:get(<<"恭喜您提升至78级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30006) ->
    lang:get(<<"恭喜您提升至88级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30007) ->
    lang:get(<<"恭喜您提升至98级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30008) ->
    lang:get(<<"恭喜您提升至108级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30009) ->
    lang:get(<<"恭喜您提升至118级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30010) ->
    lang:get(<<"恭喜您提升至128级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30011) ->
    lang:get(<<"恭喜您提升至138级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30012) ->
    lang:get(<<"恭喜您提升至150级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(30013) ->
    lang:get(<<"恭喜您提升至188级，我们为您准备了超值礼包，帮助您战力提升！"/utf8>>);
get_trigger_desc(40001) ->
    lang:get(<<"恭喜您获得了5星强力英雄，我们为您准备了超值礼包，帮助您战力提升"/utf8>>);
get_trigger_desc(40002) ->
    lang:get(<<"恭喜您获得了6星强力英雄，我们为您准备了超值礼包，帮助您战力提升"/utf8>>);
get_trigger_desc(40003) ->
    lang:get(<<"恭喜您获得了7星强力英雄，我们为您准备了超值礼包，帮助您战力提升"/utf8>>);
get_trigger_desc(40004) ->
    lang:get(<<"恭喜您获得了8星强力英雄，我们为您准备了超值礼包，帮助您战力提升"/utf8>>);
get_trigger_desc(40005) ->
    lang:get(<<"恭喜您获得了9星强力英雄，我们为您准备了超值礼包，帮助您战力提升"/utf8>>);
get_trigger_desc(40006) ->
    lang:get(<<"恭喜您获得了10星强力英雄，我们为您准备了超值礼包，帮助您战力提升"/utf8>>);
get_trigger_desc(40007) ->
    lang:get(<<"恭喜您获得了11星强力英雄，我们为您准备了超值礼包，帮助您战力提升"/utf8>>);
get_trigger_desc(40008) ->
    lang:get(<<"恭喜您获得了12星强力英雄，我们为您准备了超值礼包，帮助您战力提升"/utf8>>);
get_trigger_desc(50001) ->
    lang:get(<<"恭喜您获得了13星强力英雄，我们为您准备了超值礼包，帮助您战力提升"/utf8>>);
get_trigger_desc(60001) ->
    lang:get(<<"恭喜您获取了3星极品神装，我们为您准备了超值礼包，帮助您战力飞升！"/utf8>>);
get_trigger_desc(60002) ->
    lang:get(<<"恭喜您获取了4星极品神装，我们为您准备了超值礼包，帮助您战力飞升！"/utf8>>);
get_trigger_desc(60003) ->
    lang:get(<<"恭喜您获取了5星极品神装，我们为您准备了超值礼包，帮助您战力飞升！"/utf8>>);
get_trigger_desc(70011) ->
    lang:get(<<"恭喜您通关水之神殿第2层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70012) ->
    lang:get(<<"恭喜您通关水之神殿第4层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70013) ->
    lang:get(<<"恭喜您通关水之神殿第6层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70014) ->
    lang:get(<<"恭喜您通关水之神殿第8层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70015) ->
    lang:get(<<"恭喜您通关水之神殿第10层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70016) ->
    lang:get(<<"恭喜您通关水之神殿第12层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70017) ->
    lang:get(<<"恭喜您通关水之神殿第14层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70021) ->
    lang:get(<<"恭喜您通关火之神殿第2层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70022) ->
    lang:get(<<"恭喜您通关火之神殿第4层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70023) ->
    lang:get(<<"恭喜您通关火之神殿第6层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70024) ->
    lang:get(<<"恭喜您通关火之神殿第8层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70025) ->
    lang:get(<<"恭喜您通关火之神殿第10层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70026) ->
    lang:get(<<"恭喜您通关火之神殿第12层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70027) ->
    lang:get(<<"恭喜您通关火之神殿第14层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70031) ->
    lang:get(<<"恭喜您通关风之神殿第2层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70032) ->
    lang:get(<<"恭喜您通关风之神殿第4层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70033) ->
    lang:get(<<"恭喜您通关风之神殿第6层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70034) ->
    lang:get(<<"恭喜您通关风之神殿第8层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70035) ->
    lang:get(<<"恭喜您通关风之神殿第10层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70036) ->
    lang:get(<<"恭喜您通关风之神殿第12层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70037) ->
    lang:get(<<"恭喜您通关风之神殿第14层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70041) ->
    lang:get(<<"恭喜您通关光之神殿第2层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70042) ->
    lang:get(<<"恭喜您通关光之神殿第4层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70043) ->
    lang:get(<<"恭喜您通关光之神殿第6层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70044) ->
    lang:get(<<"恭喜您通关光之神殿第8层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70045) ->
    lang:get(<<"恭喜您通关光之神殿第10层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70046) ->
    lang:get(<<"恭喜您通关光之神殿第12层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70047) ->
    lang:get(<<"恭喜您通关光之神殿第14层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70051) ->
    lang:get(<<"恭喜您通关暗之神殿第2层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70052) ->
    lang:get(<<"恭喜您通关暗之神殿第4层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70053) ->
    lang:get(<<"恭喜您通关暗之神殿第6层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70054) ->
    lang:get(<<"恭喜您通关暗之神殿第8层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70055) ->
    lang:get(<<"恭喜您通关暗之神殿第10层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70056) ->
    lang:get(<<"恭喜您通关暗之神殿第12层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(70057) ->
    lang:get(<<"恭喜您通关暗之神殿第14层，我们为您准备了超值礼包，帮助您再创佳绩！"/utf8>>);
get_trigger_desc(80001) ->
    lang:get(<<"恭喜您通关天界副本第1章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80002) ->
    lang:get(<<"恭喜您通关天界副本第2章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80003) ->
    lang:get(<<"恭喜您通关天界副本第3章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80004) ->
    lang:get(<<"恭喜您通关天界副本第4章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80005) ->
    lang:get(<<"恭喜您通关天界副本第5章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80006) ->
    lang:get(<<"恭喜您通关天界副本第6章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80007) ->
    lang:get(<<"恭喜您通关天界副本第7章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80008) ->
    lang:get(<<"恭喜您通关天界副本第8章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80009) ->
    lang:get(<<"恭喜您通关天界副本第9章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80010) ->
    lang:get(<<"恭喜您通关天界副本第10章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80011) ->
    lang:get(<<"恭喜您通关天界副本第11章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80012) ->
    lang:get(<<"恭喜您通关天界副本第12章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80013) ->
    lang:get(<<"恭喜您通关天界副本第13章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80014) ->
    lang:get(<<"恭喜您通关天界副本第14章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80015) ->
    lang:get(<<"恭喜您通关天界副本第15章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80016) ->
    lang:get(<<"恭喜您通关天界副本第16章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80017) ->
    lang:get(<<"恭喜您通关天界副本第17章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80018) ->
    lang:get(<<"恭喜您通关天界副本第18章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80019) ->
    lang:get(<<"恭喜您通关天界副本第19章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80020) ->
    lang:get(<<"恭喜您通关天界副本第20章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80021) ->
    lang:get(<<"恭喜您通关天界副本第21章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80022) ->
    lang:get(<<"恭喜您通关天界副本第22章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80023) ->
    lang:get(<<"恭喜您通关天界副本第23章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80024) ->
    lang:get(<<"恭喜您通关天界副本第24章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(80025) ->
    lang:get(<<"恭喜您通关天界副本第25章，我们为您准备了超值礼包，祝您再接再厉！"/utf8>>);
get_trigger_desc(_) -> undefined.

get_gift_type_list({lev_equal, 50}) -> {10001, [1]};
get_gift_type_list({lev_equal, 60}) -> {10002, [1]};
get_gift_type_list({lev_equal, 70}) -> {10003, [1]};
get_gift_type_list({lev_equal, 80}) -> {10004, [1]};
get_gift_type_list({lev_equal, 90}) -> {10005, [1]};
get_gift_type_list({lev_equal, 100}) -> {10006, [1]};
get_gift_type_list({lev_equal, 110}) -> {10007, [1]};
get_gift_type_list({lev_equal, 120}) -> {10008, [1]};
get_gift_type_list({lev_equal, 130}) -> {10009, [1]};
get_gift_type_list({lev_equal, 140}) -> {10010, [1]};
get_gift_type_list({lev_equal, 155}) -> {10011, [1]};
get_gift_type_list({lev_equal, 160}) -> {10012, [1]};
get_gift_type_list({lev_equal, 165}) -> {10013, [1]};
get_gift_type_list({lev_equal, 170}) -> {10014, [1]};
get_gift_type_list({lev_equal, 175}) -> {10015, [1]};
get_gift_type_list({lev_equal, 185}) -> {10016, [1]};
get_gift_type_list({lev_equal, 190}) -> {10017, [1]};
get_gift_type_list({lev_equal, 195}) -> {10018, [1]};
get_gift_type_list({lev_equal, 200}) -> {10019, [1]};
get_gift_type_list({hero_upstar_every, 20}) ->
    {11001, [1]};
get_gift_type_list({arena_victory_count, 100}) ->
    {12001, [1]};
get_gift_type_list({tower_pass, 50}) -> {14001, [1]};
get_gift_type_list({tower_pass, 100}) -> {14002, [1]};
get_gift_type_list({tower_pass, 150}) -> {14003, [1]};
get_gift_type_list({tower_pass, 200}) -> {14004, [1]};
get_gift_type_list({tower_pass, 250}) -> {14005, [1]};
get_gift_type_list({tower_pass, 300}) -> {14006, [1]};
get_gift_type_list({tower_pass, 350}) -> {14007, [1]};
get_gift_type_list({tower_pass, 400}) -> {14008, [1]};
get_gift_type_list({tower_pass, 450}) -> {14009, [1]};
get_gift_type_list({tower_pass, 500}) -> {14010, [1]};
get_gift_type_list({tower_pass, 550}) -> {14011, [1]};
get_gift_type_list({tower_pass, 600}) -> {14012, [1]};
get_gift_type_list({tower_pass, 650}) -> {14013, [1]};
get_gift_type_list({tower_pass, 700}) -> {14014, [1]};
get_gift_type_list({tower_pass, 750}) -> {14015, [1]};
get_gift_type_list({tower_pass, 800}) -> {14016, [1]};
get_gift_type_list({tower_pass, 850}) -> {14017, [1]};
get_gift_type_list({tower_pass, 900}) -> {14018, [1]};
get_gift_type_list({tower_pass, 950}) -> {14019, [1]};
get_gift_type_list({tower_pass, 1000}) -> {14020, [1]};
get_gift_type_list({tower_loss_every, 50}) ->
    {15001, [1]};
get_gift_type_list({endless_pass_every, 50}) ->
    {16001, [1]};
get_gift_type_list({main_chapter_pass, 1}) ->
    {17001, [1]};
get_gift_type_list({main_chapter_pass, 2}) ->
    {17002, [1]};
get_gift_type_list({main_chapter_pass, 3}) ->
    {17003, [1]};
get_gift_type_list({main_chapter_pass, 4}) ->
    {17004, [1]};
get_gift_type_list({main_chapter_pass, 5}) ->
    {17005, [1]};
get_gift_type_list({main_chapter_pass, 6}) ->
    {17006, [1]};
get_gift_type_list({main_chapter_pass, 7}) ->
    {17007, [1]};
get_gift_type_list({main_chapter_pass, 8}) ->
    {17008, [1]};
get_gift_type_list({main_chapter_pass, 9}) ->
    {17009, [1]};
get_gift_type_list({main_chapter_pass, 10}) ->
    {17010, [1]};
get_gift_type_list({main_chapter_pass, 11}) ->
    {17011, [1]};
get_gift_type_list({main_chapter_pass, 12}) ->
    {17012, [1]};
get_gift_type_list({main_chapter_pass, 13}) ->
    {17013, [1]};
get_gift_type_list({main_chapter_pass, 14}) ->
    {17014, [1]};
get_gift_type_list({main_chapter_pass, 15}) ->
    {17015, [1]};
get_gift_type_list({main_chapter_pass, 16}) ->
    {17016, [1]};
get_gift_type_list({get_rune_lev, 5}) -> {20001, [2]};
get_gift_type_list({get_rune_lev, 4}) -> {20002, [2]};
get_gift_type_list({rune_recoin_every, 40}) ->
    {21001, [2]};
get_gift_type_list({lev_equal, 18}) -> {30001, [3]};
get_gift_type_list({lev_equal, 30}) -> {30002, [3]};
get_gift_type_list({lev_equal, 48}) -> {30003, [3]};
get_gift_type_list({lev_equal, 68}) -> {30004, [3]};
get_gift_type_list({lev_equal, 78}) -> {30005, [3]};
get_gift_type_list({lev_equal, 88}) -> {30006, [3]};
get_gift_type_list({lev_equal, 98}) -> {30007, [3]};
get_gift_type_list({lev_equal, 108}) -> {30008, [3]};
get_gift_type_list({lev_equal, 118}) -> {30009, [3]};
get_gift_type_list({lev_equal, 128}) -> {30010, [3]};
get_gift_type_list({lev_equal, 138}) -> {30011, [3]};
get_gift_type_list({lev_equal, 150}) -> {30012, [3]};
get_gift_type_list({lev_equal, 188}) -> {30013, [3]};
get_gift_type_list({star, 5}) -> {40001, [4]};
get_gift_type_list({star, 6}) -> {40002, [4]};
get_gift_type_list({star, 7}) -> {40003, [4]};
get_gift_type_list({star, 8}) -> {40004, [4]};
get_gift_type_list({star, 9}) -> {40005, [4]};
get_gift_type_list({star, 10}) -> {40006, [4]};
get_gift_type_list({star, 11}) -> {40007, [4]};
get_gift_type_list({star, 12}) -> {40008, [4]};
get_gift_type_list({star, 13}) -> {50001, [5]};
get_gift_type_list({holy_eqm, 3, 2}) -> {60001, [6]};
get_gift_type_list({holy_eqm, 4, 2}) -> {60002, [6]};
get_gift_type_list({holy_eqm, 5, 2}) -> {60003, [6]};
get_gift_type_list({eletemple_pass, 1, 2}) ->
    {70011, [7]};
get_gift_type_list({eletemple_pass, 1, 4}) ->
    {70012, [7]};
get_gift_type_list({eletemple_pass, 1, 6}) ->
    {70013, [7]};
get_gift_type_list({eletemple_pass, 1, 8}) ->
    {70014, [7]};
get_gift_type_list({eletemple_pass, 1, 10}) ->
    {70015, [7]};
get_gift_type_list({eletemple_pass, 1, 12}) ->
    {70016, [7]};
get_gift_type_list({eletemple_pass, 1, 14}) ->
    {70017, [7]};
get_gift_type_list({eletemple_pass, 2, 2}) ->
    {70021, [7]};
get_gift_type_list({eletemple_pass, 2, 4}) ->
    {70022, [7]};
get_gift_type_list({eletemple_pass, 2, 6}) ->
    {70023, [7]};
get_gift_type_list({eletemple_pass, 2, 8}) ->
    {70024, [7]};
get_gift_type_list({eletemple_pass, 2, 10}) ->
    {70025, [7]};
get_gift_type_list({eletemple_pass, 2, 12}) ->
    {70026, [7]};
get_gift_type_list({eletemple_pass, 2, 14}) ->
    {70027, [7]};
get_gift_type_list({eletemple_pass, 3, 2}) ->
    {70031, [7]};
get_gift_type_list({eletemple_pass, 3, 4}) ->
    {70032, [7]};
get_gift_type_list({eletemple_pass, 3, 6}) ->
    {70033, [7]};
get_gift_type_list({eletemple_pass, 3, 8}) ->
    {70034, [7]};
get_gift_type_list({eletemple_pass, 3, 10}) ->
    {70035, [7]};
get_gift_type_list({eletemple_pass, 3, 12}) ->
    {70036, [7]};
get_gift_type_list({eletemple_pass, 3, 14}) ->
    {70037, [7]};
get_gift_type_list({eletemple_pass, 4, 2}) ->
    {70041, [7]};
get_gift_type_list({eletemple_pass, 4, 4}) ->
    {70042, [7]};
get_gift_type_list({eletemple_pass, 4, 6}) ->
    {70043, [7]};
get_gift_type_list({eletemple_pass, 4, 8}) ->
    {70044, [7]};
get_gift_type_list({eletemple_pass, 4, 10}) ->
    {70045, [7]};
get_gift_type_list({eletemple_pass, 4, 12}) ->
    {70046, [7]};
get_gift_type_list({eletemple_pass, 4, 14}) ->
    {70047, [7]};
get_gift_type_list({eletemple_pass, 5, 2}) ->
    {70051, [7]};
get_gift_type_list({eletemple_pass, 5, 4}) ->
    {70052, [7]};
get_gift_type_list({eletemple_pass, 5, 6}) ->
    {70053, [7]};
get_gift_type_list({eletemple_pass, 5, 8}) ->
    {70054, [7]};
get_gift_type_list({eletemple_pass, 5, 10}) ->
    {70055, [7]};
get_gift_type_list({eletemple_pass, 5, 12}) ->
    {70056, [7]};
get_gift_type_list({eletemple_pass, 5, 14}) ->
    {70057, [7]};
get_gift_type_list({heaven_chapter_pass, 1}) ->
    {80001, [8]};
get_gift_type_list({heaven_chapter_pass, 2}) ->
    {80002, [8]};
get_gift_type_list({heaven_chapter_pass, 3}) ->
    {80003, [8]};
get_gift_type_list({heaven_chapter_pass, 4}) ->
    {80004, [8]};
get_gift_type_list({heaven_chapter_pass, 5}) ->
    {80005, [8]};
get_gift_type_list({heaven_chapter_pass, 6}) ->
    {80006, [8]};
get_gift_type_list({heaven_chapter_pass, 7}) ->
    {80007, [8]};
get_gift_type_list({heaven_chapter_pass, 8}) ->
    {80008, [8]};
get_gift_type_list({heaven_chapter_pass, 9}) ->
    {80009, [8]};
get_gift_type_list({heaven_chapter_pass, 10}) ->
    {80010, [8]};
get_gift_type_list({heaven_chapter_pass, 11}) ->
    {80011, [8]};
get_gift_type_list({heaven_chapter_pass, 12}) ->
    {80012, [8]};
get_gift_type_list({heaven_chapter_pass, 13}) ->
    {80013, [8]};
get_gift_type_list({heaven_chapter_pass, 14}) ->
    {80014, [8]};
get_gift_type_list({heaven_chapter_pass, 15}) ->
    {80015, [8]};
get_gift_type_list({heaven_chapter_pass, 16}) ->
    {80016, [8]};
get_gift_type_list({heaven_chapter_pass, 17}) ->
    {80017, [8]};
get_gift_type_list({heaven_chapter_pass, 18}) ->
    {80018, [8]};
get_gift_type_list({heaven_chapter_pass, 19}) ->
    {80019, [8]};
get_gift_type_list({heaven_chapter_pass, 20}) ->
    {80020, [8]};
get_gift_type_list({heaven_chapter_pass, 21}) ->
    {80021, [8]};
get_gift_type_list({heaven_chapter_pass, 22}) ->
    {80022, [8]};
get_gift_type_list({heaven_chapter_pass, 23}) ->
    {80023, [8]};
get_gift_type_list({heaven_chapter_pass, 24}) ->
    {80024, [8]};
get_gift_type_list({heaven_chapter_pass, 25}) ->
    {80025, [8]};
get_gift_type_list(_) -> [].

get_trigger_list() ->
    [{heaven_chapter_pass, 25}, {heaven_chapter_pass, 24},
     {heaven_chapter_pass, 23}, {heaven_chapter_pass, 22},
     {heaven_chapter_pass, 21}, {heaven_chapter_pass, 20},
     {heaven_chapter_pass, 19}, {heaven_chapter_pass, 18},
     {heaven_chapter_pass, 17}, {heaven_chapter_pass, 16},
     {heaven_chapter_pass, 15}, {heaven_chapter_pass, 14},
     {heaven_chapter_pass, 13}, {heaven_chapter_pass, 12},
     {heaven_chapter_pass, 11}, {heaven_chapter_pass, 10},
     {heaven_chapter_pass, 9}, {heaven_chapter_pass, 8},
     {heaven_chapter_pass, 7}, {heaven_chapter_pass, 6},
     {heaven_chapter_pass, 5}, {heaven_chapter_pass, 4},
     {heaven_chapter_pass, 3}, {heaven_chapter_pass, 2},
     {heaven_chapter_pass, 1}, {eletemple_pass, 5, 14},
     {eletemple_pass, 5, 12}, {eletemple_pass, 5, 10},
     {eletemple_pass, 5, 8}, {eletemple_pass, 5, 6},
     {eletemple_pass, 5, 4}, {eletemple_pass, 5, 2},
     {eletemple_pass, 4, 14}, {eletemple_pass, 4, 12},
     {eletemple_pass, 4, 10}, {eletemple_pass, 4, 8},
     {eletemple_pass, 4, 6}, {eletemple_pass, 4, 4},
     {eletemple_pass, 4, 2}, {eletemple_pass, 3, 14},
     {eletemple_pass, 3, 12}, {eletemple_pass, 3, 10},
     {eletemple_pass, 3, 8}, {eletemple_pass, 3, 6},
     {eletemple_pass, 3, 4}, {eletemple_pass, 3, 2},
     {eletemple_pass, 2, 14}, {eletemple_pass, 2, 12},
     {eletemple_pass, 2, 10}, {eletemple_pass, 2, 8},
     {eletemple_pass, 2, 6}, {eletemple_pass, 2, 4},
     {eletemple_pass, 2, 2}, {eletemple_pass, 1, 14},
     {eletemple_pass, 1, 12}, {eletemple_pass, 1, 10},
     {eletemple_pass, 1, 8}, {eletemple_pass, 1, 6},
     {eletemple_pass, 1, 4}, {eletemple_pass, 1, 2},
     {holy_eqm, 5, 2}, {holy_eqm, 4, 2}, {holy_eqm, 3, 2},
     {star, 13}, {star, 12}, {star, 11}, {star, 10},
     {star, 9}, {star, 8}, {star, 7}, {star, 6}, {star, 5},
     {lev_equal, 188}, {lev_equal, 150}, {lev_equal, 138},
     {lev_equal, 128}, {lev_equal, 118}, {lev_equal, 108},
     {lev_equal, 98}, {lev_equal, 88}, {lev_equal, 78},
     {lev_equal, 68}, {lev_equal, 48}, {lev_equal, 30},
     {lev_equal, 18}, {rune_recoin_every, 40},
     {get_rune_lev, 4}, {get_rune_lev, 5},
     {main_chapter_pass, 16}, {main_chapter_pass, 15},
     {main_chapter_pass, 14}, {main_chapter_pass, 13},
     {main_chapter_pass, 12}, {main_chapter_pass, 11},
     {main_chapter_pass, 10}, {main_chapter_pass, 9},
     {main_chapter_pass, 8}, {main_chapter_pass, 7},
     {main_chapter_pass, 6}, {main_chapter_pass, 5},
     {main_chapter_pass, 4}, {main_chapter_pass, 3},
     {main_chapter_pass, 2}, {main_chapter_pass, 1},
     {endless_pass_every, 50}, {tower_loss_every, 50},
     {tower_pass, 1000}, {tower_pass, 950},
     {tower_pass, 900}, {tower_pass, 850}, {tower_pass, 800},
     {tower_pass, 750}, {tower_pass, 700}, {tower_pass, 650},
     {tower_pass, 600}, {tower_pass, 550}, {tower_pass, 500},
     {tower_pass, 450}, {tower_pass, 400}, {tower_pass, 350},
     {tower_pass, 300}, {tower_pass, 250}, {tower_pass, 200},
     {tower_pass, 150}, {tower_pass, 100}, {tower_pass, 50},
     {arena_victory_count, 100}, {hero_upstar_every, 20},
     {lev_equal, 200}, {lev_equal, 195}, {lev_equal, 190},
     {lev_equal, 185}, {lev_equal, 175}, {lev_equal, 170},
     {lev_equal, 165}, {lev_equal, 160}, {lev_equal, 155},
     {lev_equal, 140}, {lev_equal, 130}, {lev_equal, 120},
     {lev_equal, 110}, {lev_equal, 100}, {lev_equal, 90},
     {lev_equal, 80}, {lev_equal, 70}, {lev_equal, 60},
     {lev_equal, 50}].

get_cond_id_list() ->
    [1205, 1204, 1203, 1202, 1201, 1105, 1104, 1103, 1102,
     1101, 1014, 1013, 1012, 1011, 1010, 1009, 1008, 1007,
     1006, 1005, 1004, 1003, 1002, 1001, 914, 913, 912, 911,
     910, 909, 908, 907, 906, 905, 904, 903, 902, 901, 805,
     804, 803, 802, 801, 705, 704, 703, 702, 701, 605, 604,
     603, 602, 601, 505, 504, 503, 502, 501, 405, 404, 403,
     402, 401, 305, 304, 303, 302, 301, 205, 204, 203, 202,
     201, 105, 104, 103, 102, 101].

get_rfm_list(3) ->
    [{1, 0, 99}, {2, 100, 399}, {3, 400, 1399},
     {4, 1400, 999999}];
get_rfm_list(2) ->
    [{1, 0, 2}, {2, 3, 6}, {3, 7, 15}, {4, 16, 99999}];
get_rfm_list(1) ->
    [{1, 864001, 99999999}, {2, 432001, 864000},
     {3, 172801, 432000}, {4, 1, 172800}];
get_rfm_list(_) -> [].

get_score_range() ->
    [[{1, 4}, {1, 1}, {1, 1}], [{1, 2}, {2, 4}, {1, 1}],
     [{3, 4}, {2, 4}, {1, 1}], [{1, 2}, {1, 1}, {2, 2}],
     [{3, 4}, {1, 1}, {2, 2}], [{1, 2}, {2, 4}, {2, 2}],
     [{3, 4}, {2, 4}, {2, 2}], [{1, 2}, {1, 1}, {3, 3}],
     [{3, 4}, {1, 1}, {3, 3}], [{1, 2}, {2, 4}, {3, 3}],
     [{3, 4}, {2, 4}, {3, 3}], [{1, 2}, {1, 2}, {4, 4}],
     [{3, 4}, {1, 2}, {4, 4}], [{1, 2}, {3, 4}, {4, 4}],
     [{3, 4}, {3, 4}, {4, 4}]].

get_scores_to_money([{3, 4}, {3, 4}, {4, 4}]) -> 648;
get_scores_to_money([{1, 2}, {3, 4}, {4, 4}]) -> 328;
get_scores_to_money([{3, 4}, {1, 2}, {4, 4}]) -> 328;
get_scores_to_money([{1, 2}, {1, 2}, {4, 4}]) -> 198;
get_scores_to_money([{3, 4}, {2, 4}, {3, 3}]) -> 328;
get_scores_to_money([{1, 2}, {2, 4}, {3, 3}]) -> 198;
get_scores_to_money([{3, 4}, {1, 1}, {3, 3}]) -> 198;
get_scores_to_money([{1, 2}, {1, 1}, {3, 3}]) -> 128;
get_scores_to_money([{3, 4}, {2, 4}, {2, 2}]) -> 128;
get_scores_to_money([{1, 2}, {2, 4}, {2, 2}]) -> 128;
get_scores_to_money([{3, 4}, {1, 1}, {2, 2}]) -> 128;
get_scores_to_money([{1, 2}, {1, 1}, {2, 2}]) -> 68;
get_scores_to_money([{3, 4}, {2, 4}, {1, 1}]) -> 128;
get_scores_to_money([{1, 2}, {2, 4}, {1, 1}]) -> 68;
get_scores_to_money([{1, 4}, {1, 1}, {1, 1}]) -> 30;
get_scores_to_money(_) -> 0.

get_gift_list({8, 648}) ->
    [#personal_push_gift_data{gift_id = 81004, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 901, 1001],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39115, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 81008, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 901, 1001],
			      award =
				  [{3, 6480}, {17211, 73}, {39143, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 82004, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 902, 1002],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39116, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 82008, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 902, 1002],
			      award =
				  [{3, 6480}, {17211, 73}, {39144, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 83004, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 903, 1003],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39117, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 83008, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 903, 1003],
			      award =
				  [{3, 6480}, {17211, 73}, {39145, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 84004, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 904, 1004],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39118, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 84008, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 904, 1004],
			      award =
				  [{3, 6480}, {17211, 73}, {39146, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 85004, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 905, 1005],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39119, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 85008, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 905, 1005],
			      award =
				  [{3, 6480}, {17211, 73}, {39147, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 86004, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 906, 1006],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39120, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 86008, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 906, 1006],
			      award =
				  [{3, 6480}, {17211, 73}, {39148, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 87004, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 907, 1007],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39121, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 87008, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 907, 1007],
			      award =
				  [{3, 6480}, {17211, 73}, {39149, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 88004, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 908, 1008],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39122, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 88008, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 908, 1008],
			      award =
				  [{3, 6480}, {17211, 73}, {39150, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 89004, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 909, 1009],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39123, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 89008, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 909, 1009],
			      award =
				  [{3, 6480}, {17211, 73}, {39151, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 81104, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 910, 1010],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39124, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 81108, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 910, 1010],
			      award =
				  [{3, 6480}, {17211, 73}, {39152, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 81204, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 911, 1011],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39125, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 81208, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 911, 1011],
			      award =
				  [{3, 6480}, {17211, 73}, {39153, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 81304, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 912, 1012],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39126, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 81308, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 912, 1012],
			      award =
				  [{3, 6480}, {17211, 73}, {39154, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 81404, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 913, 1013],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39127, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 81408, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 913, 1013],
			      award =
				  [{3, 6480}, {17211, 73}, {39155, 1},
				   {28, 551}, {10030, 110}]},
     #personal_push_gift_data{gift_id = 81504, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 914, 1014],
			      award =
				  [{3, 6480}, {17210, 97}, {28, 680},
				   {39128, 1}, {10030, 154}]},
     #personal_push_gift_data{gift_id = 81508, type_id = 8,
			      charge_id = 8806, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 914, 1014],
			      award =
				  [{3, 6480}, {17211, 73}, {39156, 1},
				   {28, 551}, {10030, 110}]}];
get_gift_list({8, 328}) ->
    [#personal_push_gift_data{gift_id = 81003, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 901, 1001],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39115, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 81007, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 901, 1001],
			      award =
				  [{3, 3280}, {17211, 33}, {39143, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 82003, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 902, 1002],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39116, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 82007, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 902, 1002],
			      award =
				  [{3, 3280}, {17211, 33}, {39144, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 83003, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 903, 1003],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39117, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 83007, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 903, 1003],
			      award =
				  [{3, 3280}, {17211, 33}, {39145, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 84003, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 904, 1004],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39118, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 84007, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 904, 1004],
			      award =
				  [{3, 3280}, {17211, 33}, {39146, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 85003, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 905, 1005],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39119, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 85007, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 905, 1005],
			      award =
				  [{3, 3280}, {17211, 33}, {39147, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 86003, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 906, 1006],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39120, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 86007, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 906, 1006],
			      award =
				  [{3, 3280}, {17211, 33}, {39148, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 87003, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 907, 1007],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39121, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 87007, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 907, 1007],
			      award =
				  [{3, 3280}, {17211, 33}, {39149, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 88003, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 908, 1008],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39122, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 88007, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 908, 1008],
			      award =
				  [{3, 3280}, {17211, 33}, {39150, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 89003, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 909, 1009],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39123, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 89007, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 909, 1009],
			      award =
				  [{3, 3280}, {17211, 33}, {39151, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 81103, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 910, 1010],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39124, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 81107, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 910, 1010],
			      award =
				  [{3, 3280}, {17211, 33}, {39152, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 81203, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 911, 1011],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39125, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 81207, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 911, 1011],
			      award =
				  [{3, 3280}, {17211, 33}, {39153, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 81303, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 912, 1012],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39126, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 81307, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 912, 1012],
			      award =
				  [{3, 3280}, {17211, 33}, {39154, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 81403, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 913, 1013],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39127, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 81407, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 913, 1013],
			      award =
				  [{3, 3280}, {17211, 33}, {39155, 1},
				   {28, 164}, {10030, 33}]},
     #personal_push_gift_data{gift_id = 81503, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 914, 1014],
			      award =
				  [{3, 3280}, {17210, 44}, {28, 356},
				   {39128, 1}, {10030, 62}]},
     #personal_push_gift_data{gift_id = 81507, type_id = 8,
			      charge_id = 8805, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 914, 1014],
			      award =
				  [{3, 3280}, {17211, 33}, {39156, 1},
				   {28, 164}, {10030, 33}]}];
get_gift_list({8, 198}) ->
    [#personal_push_gift_data{gift_id = 81002, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 901, 1001],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39101, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 81006, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 901, 1001],
			      award =
				  [{3, 1980}, {17211, 24}, {39129, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 82002, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 902, 1002],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39102, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 82006, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 902, 1002],
			      award =
				  [{3, 1980}, {17211, 24}, {39130, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 83002, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 903, 1003],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39103, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 83006, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 903, 1003],
			      award =
				  [{3, 1980}, {17211, 24}, {39131, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 84002, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 904, 1004],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39104, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 84006, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 904, 1004],
			      award =
				  [{3, 1980}, {17211, 24}, {39132, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 85002, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 905, 1005],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39105, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 85006, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 905, 1005],
			      award =
				  [{3, 1980}, {17211, 24}, {39133, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 86002, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 906, 1006],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39106, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 86006, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 906, 1006],
			      award =
				  [{3, 1980}, {17211, 24}, {39134, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 87002, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 907, 1007],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39107, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 87006, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 907, 1007],
			      award =
				  [{3, 1980}, {17211, 24}, {39135, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 88002, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 908, 1008],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39108, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 88006, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 908, 1008],
			      award =
				  [{3, 1980}, {17211, 24}, {39136, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 89002, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 909, 1009],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39109, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 89006, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 909, 1009],
			      award =
				  [{3, 1980}, {17211, 24}, {39137, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 81102, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 910, 1010],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39110, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 81106, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 910, 1010],
			      award =
				  [{3, 1980}, {17211, 24}, {39138, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 81202, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 911, 1011],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39111, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 81206, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 911, 1011],
			      award =
				  [{3, 1980}, {17211, 24}, {39139, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 81302, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 912, 1012],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39112, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 81306, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 912, 1012],
			      award =
				  [{3, 1980}, {17211, 24}, {39140, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 81402, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 913, 1013],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39113, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 81406, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 913, 1013],
			      award =
				  [{3, 1980}, {17211, 24}, {39141, 1}, {28, 80},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 81502, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 914, 1014],
			      award =
				  [{3, 1980}, {17210, 33}, {28, 198},
				   {39114, 1}, {10030, 20}]},
     #personal_push_gift_data{gift_id = 81506, type_id = 8,
			      charge_id = 8804, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 914, 1014],
			      award =
				  [{3, 1980}, {17211, 24}, {39142, 1}, {28, 80},
				   {10030, 10}]}];
get_gift_list({8, 128}) ->
    [#personal_push_gift_data{gift_id = 81001, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 901, 1001],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39101, 1}]},
     #personal_push_gift_data{gift_id = 81005, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 901, 1001],
			      award =
				  [{3, 1280}, {17211, 19}, {39115, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 82001, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 902, 1002],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39102, 1}]},
     #personal_push_gift_data{gift_id = 82005, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 902, 1002],
			      award =
				  [{3, 1280}, {17211, 19}, {39116, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 83001, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 903, 1003],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39103, 1}]},
     #personal_push_gift_data{gift_id = 83005, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 903, 1003],
			      award =
				  [{3, 1280}, {17211, 19}, {39117, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 84001, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 904, 1004],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39104, 1}]},
     #personal_push_gift_data{gift_id = 84005, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 904, 1004],
			      award =
				  [{3, 1280}, {17211, 19}, {39118, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 85001, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 905, 1005],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39105, 1}]},
     #personal_push_gift_data{gift_id = 85005, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 905, 1005],
			      award =
				  [{3, 1280}, {17211, 19}, {39119, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 86001, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 906, 1006],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39106, 1}]},
     #personal_push_gift_data{gift_id = 86005, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 906, 1006],
			      award =
				  [{3, 1280}, {17211, 19}, {39120, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 87001, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 907, 1007],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39107, 1}]},
     #personal_push_gift_data{gift_id = 87005, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 907, 1007],
			      award =
				  [{3, 1280}, {17211, 19}, {39121, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 88001, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 908, 1008],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39108, 1}]},
     #personal_push_gift_data{gift_id = 88005, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 908, 1008],
			      award =
				  [{3, 1280}, {17211, 19}, {39122, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 89001, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 909, 1009],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39109, 1}]},
     #personal_push_gift_data{gift_id = 89005, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 909, 1009],
			      award =
				  [{3, 1280}, {17211, 19}, {39123, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 81101, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 910, 1010],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39110, 1}]},
     #personal_push_gift_data{gift_id = 81105, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 910, 1010],
			      award =
				  [{3, 1280}, {17211, 19}, {39124, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 81201, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 911, 1011],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39111, 1}]},
     #personal_push_gift_data{gift_id = 81205, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 911, 1011],
			      award =
				  [{3, 1280}, {17211, 19}, {39125, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 81301, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 912, 1012],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39112, 1}]},
     #personal_push_gift_data{gift_id = 81305, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 912, 1012],
			      award =
				  [{3, 1280}, {17211, 19}, {39126, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 81401, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 913, 1013],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39113, 1}]},
     #personal_push_gift_data{gift_id = 81405, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 913, 1013],
			      award =
				  [{3, 1280}, {17211, 19}, {39127, 1},
				   {28, 80}]},
     #personal_push_gift_data{gift_id = 81501, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 914, 1014],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 154},
				   {39114, 1}]},
     #personal_push_gift_data{gift_id = 81505, type_id = 8,
			      charge_id = 8803, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 914, 1014],
			      award =
				  [{3, 1280}, {17211, 19}, {39128, 1},
				   {28, 80}]}];
get_gift_list({8, 68}) ->
    [#personal_push_gift_data{gift_id = 80002, type_id = 8,
			      charge_id = 8802, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204],
			      award =
				  [{3, 680}, {17210, 19}, {28, 143},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 80012, type_id = 8,
			      charge_id = 8802, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204],
			      award =
				  [{3, 680}, {17211, 14}, {28, 143},
				   {10030, 10}]}];
get_gift_list({8, 30}) ->
    [#personal_push_gift_data{gift_id = 80001, type_id = 8,
			      charge_id = 8801, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204],
			      award = [{3, 300}, {17210, 13}, {28, 48}]},
     #personal_push_gift_data{gift_id = 80011, type_id = 8,
			      charge_id = 8801, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204],
			      award = [{3, 300}, {17211, 10}, {28, 48}]}];
get_gift_list({7, 648}) ->
    [#personal_push_gift_data{gift_id = 70006, type_id = 7,
			      charge_id = 8706, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1201, 1202,
				   1203],
			      award =
				  [{3, 6480}, {14001, 12}, {39157, 1},
				   {10408, 41}, {17009, 259}]}];
get_gift_list({7, 328}) ->
    [#personal_push_gift_data{gift_id = 70005, type_id = 7,
			      charge_id = 8705, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1201, 1202,
				   1203],
			      award =
				  [{3, 3280}, {14001, 6}, {39157, 1},
				   {10408, 10}, {17009, 66}]}];
get_gift_list({7, 198}) ->
    [#personal_push_gift_data{gift_id = 70004, type_id = 7,
			      charge_id = 8704, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1201, 1202,
				   1203],
			      award =
				  [{3, 1980}, {14001, 3}, {29905, 1},
				   {10408, 12}, {17009, 52}]}];
get_gift_list({7, 128}) ->
    [#personal_push_gift_data{gift_id = 70003, type_id = 7,
			      charge_id = 8703, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1202, 1203, 1201, 1202, 1203],
			      award =
				  [{3, 1280}, {14001, 2}, {10408, 12},
				   {17009, 46}, {17011, 10}]}];
get_gift_list({7, 68}) ->
    [#personal_push_gift_data{gift_id = 70002, type_id = 7,
			      charge_id = 8702, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1202, 1203, 1201, 1202, 1203],
			      award =
				  [{3, 680}, {14001, 1}, {10408, 10},
				   {17009, 27}]}];
get_gift_list({7, 30}) ->
    [#personal_push_gift_data{gift_id = 70001, type_id = 7,
			      charge_id = 8701, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1202, 1203,
				   1201, 1202, 1203, 1201, 1202, 1203],
			      award = [{3, 300}, {10408, 10}, {17009, 30}]}];
get_gift_list({6, 648}) ->
    [#personal_push_gift_data{gift_id = 60006, type_id = 6,
			      charge_id = 8606, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 6480}, {17210, 58}, {10030, 350},
				   {1, 14580000}]},
     #personal_push_gift_data{gift_id = 61006, type_id = 6,
			      charge_id = 8606, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 6480}, {17211, 44}, {10030, 350},
				   {1, 14580000}]}];
get_gift_list({6, 328}) ->
    [#personal_push_gift_data{gift_id = 60005, type_id = 6,
			      charge_id = 8605, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 3280}, {17210, 30}, {10030, 177},
				   {1, 7380000}]},
     #personal_push_gift_data{gift_id = 61005, type_id = 6,
			      charge_id = 8605, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 3280}, {17211, 22}, {10030, 177},
				   {1, 7380000}]}];
get_gift_list({6, 198}) ->
    [#personal_push_gift_data{gift_id = 60004, type_id = 6,
			      charge_id = 8604, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 1980}, {17210, 18}, {10030, 107},
				   {1, 4455000}]},
     #personal_push_gift_data{gift_id = 61004, type_id = 6,
			      charge_id = 8604, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 1980}, {17211, 13}, {10030, 107},
				   {1, 4455000}]}];
get_gift_list({6, 128}) ->
    [#personal_push_gift_data{gift_id = 60003, type_id = 6,
			      charge_id = 8603, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 1280}, {17210, 12}, {10030, 69},
				   {1, 2880000}]},
     #personal_push_gift_data{gift_id = 61003, type_id = 6,
			      charge_id = 8603, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 1280}, {17211, 9}, {10030, 69},
				   {1, 2880000}]}];
get_gift_list({6, 68}) ->
    [#personal_push_gift_data{gift_id = 60002, type_id = 6,
			      charge_id = 8602, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 680}, {17210, 7}, {10030, 41},
				   {1, 1700000}]},
     #personal_push_gift_data{gift_id = 61002, type_id = 6,
			      charge_id = 8602, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 680}, {17211, 5}, {10030, 41},
				   {1, 1700000}]}];
get_gift_list({6, 30}) ->
    [#personal_push_gift_data{gift_id = 60001, type_id = 6,
			      charge_id = 8601, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 300}, {17210, 4}, {10030, 22},
				   {1, 900000}]},
     #personal_push_gift_data{gift_id = 61001, type_id = 6,
			      charge_id = 8601, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 201, 202, 203, 204, 205, 101,
				   102, 103, 104, 105],
			      award =
				  [{3, 300}, {17211, 3}, {10030, 22},
				   {1, 900000}]}];
get_gift_list({5, 648}) ->
    [#personal_push_gift_data{gift_id = 50006, type_id = 5,
			      charge_id = 8506, limit_count = 10, money = 648,
			      costly_num = 800, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [1201, 1202, 1203, 1204, 1205, 1201, 1202,
				   1203, 1204, 1205, 701, 702, 703, 704, 705,
				   101, 102, 103, 104, 105],
			      award =
				  [{3, 6480}, {16202, 4}, {10460, 15},
				   {10450, 10000}]}];
get_gift_list({5, 328}) ->
    [#personal_push_gift_data{gift_id = 50005, type_id = 5,
			      charge_id = 8505, limit_count = 10, money = 328,
			      costly_num = 800, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [1201, 1202, 1203, 1204, 1205, 1201, 1202,
				   1203, 1204, 1205, 701, 702, 703, 704, 705,
				   101, 102, 103, 104, 105],
			      award =
				  [{3, 3280}, {16202, 2}, {10460, 7},
				   {10450, 5000}]}];
get_gift_list({5, 198}) ->
    [#personal_push_gift_data{gift_id = 50004, type_id = 5,
			      charge_id = 8504, limit_count = 10, money = 198,
			      costly_num = 800, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [1201, 1202, 1203, 1204, 1205, 1201, 1202,
				   1203, 1204, 1205, 701, 702, 703, 704, 705,
				   101, 102, 103, 104, 105],
			      award =
				  [{3, 1980}, {16202, 1}, {10460, 5},
				   {10450, 2500}]}];
get_gift_list({5, 128}) ->
    [#personal_push_gift_data{gift_id = 50003, type_id = 5,
			      charge_id = 8503, limit_count = 10, money = 128,
			      costly_num = 800, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [1201, 1202, 1203, 1204, 1205, 1201, 1202,
				   1203, 1204, 1205, 701, 702, 703, 704, 705,
				   101, 102, 103, 104, 105],
			      award =
				  [{3, 1280}, {16202, 1}, {10460, 3},
				   {10450, 1200}]}];
get_gift_list({5, 68}) ->
    [#personal_push_gift_data{gift_id = 50002, type_id = 5,
			      charge_id = 8502, limit_count = 10, money = 68,
			      costly_num = 800, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 680}, {39082, 1}, {10450, 1000}]}];
get_gift_list({5, 30}) ->
    [#personal_push_gift_data{gift_id = 50001, type_id = 5,
			      charge_id = 8501, limit_count = 10, money = 30,
			      costly_num = 800, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 300}, {39082, 1}]}];
get_gift_list({4, 648}) ->
    [#personal_push_gift_data{gift_id = 40006, type_id = 4,
			      charge_id = 8406, limit_count = 10, money = 648,
			      costly_num = 600, valid_time = 14400,
			      warehouse_id =
				  [201, 202, 203, 204, 205, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 6480}, {1, 64800000}, {22, 12960000},
				   {10001, 6480}]},
     #personal_push_gift_data{gift_id = 41006, type_id = 4,
			      charge_id = 8406, limit_count = 10, money = 648,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 6480}, {10450, 12960}, {1, 64800000},
				   {22, 6480000}]},
     #personal_push_gift_data{gift_id = 41012, type_id = 4,
			      charge_id = 8406, limit_count = 10, money = 648,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 6480}, {10450, 12960}, {1, 64800000},
				   {10001, 6480}]},
     #personal_push_gift_data{gift_id = 41018, type_id = 4,
			      charge_id = 8406, limit_count = 10, money = 648,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 6480}, {10450, 12960}, {22, 12960000},
				   {10001, 6480}]},
     #personal_push_gift_data{gift_id = 42002, type_id = 4,
			      charge_id = 8406, limit_count = 10, money = 648,
			      costly_num = 600, valid_time = 14400,
			      warehouse_id =
				  [501, 502, 503, 504, 505, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 6480}, {39095, 1}, {1, 12960000},
				   {22, 2592000}]}];
get_gift_list({4, 328}) ->
    [#personal_push_gift_data{gift_id = 40005, type_id = 4,
			      charge_id = 8405, limit_count = 10, money = 328,
			      costly_num = 600, valid_time = 14400,
			      warehouse_id =
				  [201, 202, 203, 204, 205, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 3280}, {1, 32800000}, {22, 6560000},
				   {10001, 3280}]},
     #personal_push_gift_data{gift_id = 41005, type_id = 4,
			      charge_id = 8405, limit_count = 10, money = 328,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 3280}, {10450, 6560}, {1, 32800000},
				   {22, 3280000}]},
     #personal_push_gift_data{gift_id = 41011, type_id = 4,
			      charge_id = 8405, limit_count = 10, money = 328,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 3280}, {10450, 6560}, {1, 32800000},
				   {10001, 3280}]},
     #personal_push_gift_data{gift_id = 41017, type_id = 4,
			      charge_id = 8405, limit_count = 10, money = 328,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 3280}, {10450, 6560}, {22, 6560000},
				   {10001, 3280}]},
     #personal_push_gift_data{gift_id = 42001, type_id = 4,
			      charge_id = 8405, limit_count = 10, money = 328,
			      costly_num = 600, valid_time = 14400,
			      warehouse_id =
				  [501, 502, 503, 504, 505, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 3280}, {39096, 1}, {1, 6560000},
				   {22, 1312000}]}];
get_gift_list({4, 198}) ->
    [#personal_push_gift_data{gift_id = 40004, type_id = 4,
			      charge_id = 8404, limit_count = 10, money = 198,
			      costly_num = 600, valid_time = 14400,
			      warehouse_id =
				  [201, 202, 203, 204, 205, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1980}, {1, 14850000}, {22, 4950000},
				   {10001, 1980}]},
     #personal_push_gift_data{gift_id = 41004, type_id = 4,
			      charge_id = 8404, limit_count = 10, money = 198,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1980}, {10450, 3960}, {1, 19800000},
				   {22, 1980000}]},
     #personal_push_gift_data{gift_id = 41010, type_id = 4,
			      charge_id = 8404, limit_count = 10, money = 198,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1980}, {10450, 3960}, {1, 19800000},
				   {10001, 1980}]},
     #personal_push_gift_data{gift_id = 41016, type_id = 4,
			      charge_id = 8404, limit_count = 10, money = 198,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1980}, {10450, 3960}, {22, 5940000},
				   {10001, 1000}]}];
get_gift_list({4, 128}) ->
    [#personal_push_gift_data{gift_id = 40003, type_id = 4,
			      charge_id = 8403, limit_count = 10, money = 128,
			      costly_num = 600, valid_time = 14400,
			      warehouse_id =
				  [201, 202, 203, 204, 205, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1280}, {1, 9600000}, {22, 3200000},
				   {10001, 1280}]},
     #personal_push_gift_data{gift_id = 41003, type_id = 4,
			      charge_id = 8403, limit_count = 10, money = 128,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1280}, {10450, 2560}, {1, 12800000},
				   {22, 1280000}]},
     #personal_push_gift_data{gift_id = 41009, type_id = 4,
			      charge_id = 8403, limit_count = 10, money = 128,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1280}, {10450, 2560}, {1, 12800000},
				   {10001, 1280}]},
     #personal_push_gift_data{gift_id = 41015, type_id = 4,
			      charge_id = 8403, limit_count = 10, money = 128,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1280}, {10450, 2560}, {22, 3840000},
				   {10001, 640}]}];
get_gift_list({4, 68}) ->
    [#personal_push_gift_data{gift_id = 40002, type_id = 4,
			      charge_id = 8402, limit_count = 10, money = 68,
			      costly_num = 600, valid_time = 14400,
			      warehouse_id =
				  [201, 202, 203, 204, 205, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 680}, {1, 3400000}, {22, 2040000},
				   {10001, 680}]},
     #personal_push_gift_data{gift_id = 41002, type_id = 4,
			      charge_id = 8402, limit_count = 10, money = 68,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 680}, {10450, 1360}, {1, 6800000},
				   {22, 680000}]},
     #personal_push_gift_data{gift_id = 41008, type_id = 4,
			      charge_id = 8402, limit_count = 10, money = 68,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 680}, {10450, 1360}, {1, 6800000},
				   {10001, 680}]},
     #personal_push_gift_data{gift_id = 41014, type_id = 4,
			      charge_id = 8402, limit_count = 10, money = 68,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 680}, {10450, 1360}, {22, 2040000},
				   {10001, 340}]}];
get_gift_list({4, 30}) ->
    [#personal_push_gift_data{gift_id = 40001, type_id = 4,
			      charge_id = 8401, limit_count = 10, money = 30,
			      costly_num = 600, valid_time = 14400,
			      warehouse_id =
				  [201, 202, 203, 204, 205, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 300}, {1, 1800000}, {22, 1080000},
				   {10001, 360}]},
     #personal_push_gift_data{gift_id = 41001, type_id = 4,
			      charge_id = 8401, limit_count = 10, money = 30,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 300}, {10450, 720}, {1, 3600000},
				   {22, 360000}]},
     #personal_push_gift_data{gift_id = 41007, type_id = 4,
			      charge_id = 8401, limit_count = 10, money = 30,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 201, 202, 203, 204,
				   205, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 300}, {10450, 720}, {1, 3600000},
				   {10001, 360}]},
     #personal_push_gift_data{gift_id = 41013, type_id = 4,
			      charge_id = 8401, limit_count = 10, money = 30,
			      costly_num = 600, valid_time = 14400,
			      open_cond = [{lev, 40}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 301, 302, 303, 304,
				   305, 401, 402, 403, 404, 405, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 300}, {10450, 720}, {22, 1080000},
				   {10001, 200}]}];
get_gift_list({3, 648}) ->
    [#personal_push_gift_data{gift_id = 30006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 15}, {lev_max, 20}],
			      warehouse_id =
				  [501, 502, 503, 504, 505, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award =
				  [{3, 6480}, {39099, 4}, {39157, 1},
				   {10403, 73}, {22, 7776000}]},
     #personal_push_gift_data{gift_id = 31006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 45}, {lev_max, 50}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 501, 502, 503,
				   504, 505],
			      award =
				  [{3, 6480}, {14001, 10}, {39157, 1},
				   {10403, 41}, {39097, 1}]},
     #personal_push_gift_data{gift_id = 32006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 65}, {lev_max, 70}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 501, 502, 503,
				   504, 505],
			      award =
				  [{3, 6480}, {14001, 10}, {39157, 1},
				   {10403, 41}, {39097, 1}]},
     #personal_push_gift_data{gift_id = 33006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 75}, {lev_max, 80}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 6480}, {10454, 1}, {39157, 1},
				   {10403, 41}, {10450, 5184}]},
     #personal_push_gift_data{gift_id = 34006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 85}, {lev_max, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 6480}, {14001, 10}, {10603, 14},
				   {10415, 41}, {10040, 173}]},
     #personal_push_gift_data{gift_id = 35006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 95}, {lev_max, 100}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 701, 702, 703, 704, 705, 1201, 1202,
				   1203],
			      award =
				  [{3, 6480}, {14001, 12}, {39157, 1},
				   {10415, 41}, {17009, 259}]},
     #personal_push_gift_data{gift_id = 36006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 105}, {lev_max, 110}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 6480}, {10454, 1}, {10603, 15},
				   {39157, 1}, {10403, 26}]},
     #personal_push_gift_data{gift_id = 37006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 115}, {lev_max, 120}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 1101, 1102, 1103,
				   1104, 1105, 1201, 1202, 1203, 1204, 1201,
				   1202, 1203, 1204],
			      award =
				  [{3, 6480}, {10454, 1}, {17210, 78},
				   {39505, 1}, {28, 583}]},
     #personal_push_gift_data{gift_id = 38006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 125}, {lev_max, 130}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 501, 502, 503, 504,
				   505, 601, 602, 603, 604, 605, 1101, 1102,
				   1103, 1104, 1105],
			      award =
				  [{3, 6480}, {10454, 1}, {39095, 1},
				   {39082, 1}, {17211, 20}]},
     #personal_push_gift_data{gift_id = 39006, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 135}, {lev_max, 140}],
			      warehouse_id =
				  [501, 502, 503, 504, 505, 101, 102, 103, 104,
				   105, 1101, 1102, 1103, 1104, 1105, 601, 602,
				   603, 604, 605],
			      award =
				  [{3, 6480}, {39095, 1}, {39157, 1},
				   {17211, 36}, {39082, 2}]},
     #personal_push_gift_data{gift_id = 31106, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 145}, {lev_max, 151}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 601, 602, 603, 604, 605, 1201, 1202,
				   1203, 1204],
			      award =
				  [{3, 6480}, {14001, 15}, {39157, 1},
				   {10454, 1}, {10090, 10}]},
     #personal_push_gift_data{gift_id = 31206, type_id = 3,
			      charge_id = 8306, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 185}, {lev_max, 190}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1202, 1203, 1204, 1205, 1201,
				   1202, 1203, 1204, 1205],
			      award =
				  [{3, 6480}, {14001, 15}, {39157, 1},
				   {16202, 3}, {10460, 10}]}];
get_gift_list({3, 328}) ->
    [#personal_push_gift_data{gift_id = 30005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 15}, {lev_max, 20}],
			      warehouse_id =
				  [501, 502, 503, 504, 505, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award =
				  [{3, 3280}, {39099, 2}, {39157, 1},
				   {10403, 31}, {22, 2624000}]},
     #personal_push_gift_data{gift_id = 31005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 45}, {lev_max, 50}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 501, 502, 503,
				   504, 505],
			      award =
				  [{3, 3280}, {14001, 5}, {39157, 1},
				   {10403, 16}, {39099, 1}]},
     #personal_push_gift_data{gift_id = 32005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 65}, {lev_max, 70}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 501, 502, 503,
				   504, 505],
			      award =
				  [{3, 3280}, {14001, 5}, {39157, 1},
				   {10403, 16}, {39099, 1}]},
     #personal_push_gift_data{gift_id = 33005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 75}, {lev_max, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 3280}, {14001, 5}, {39157, 1},
				   {10403, 16}, {10450, 2624}]},
     #personal_push_gift_data{gift_id = 34005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 85}, {lev_max, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 3280}, {14001, 5}, {10603, 11},
				   {10415, 16}, {10040, 87}]},
     #personal_push_gift_data{gift_id = 35005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 95}, {lev_max, 100}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 701, 702, 703, 704, 705, 1201, 1202,
				   1203],
			      award =
				  [{3, 3280}, {14001, 6}, {39157, 1},
				   {10415, 18}, {17009, 131}]},
     #personal_push_gift_data{gift_id = 36005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 105}, {lev_max, 110}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 3280}, {10454, 1}, {10603, 3},
				   {39157, 1}, {10403, 10}]},
     #personal_push_gift_data{gift_id = 37005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 115}, {lev_max, 120}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 1101, 1102, 1103,
				   1104, 1105, 1201, 1202, 1203, 1204, 1201,
				   1202, 1203, 1204],
			      award =
				  [{3, 3280}, {10454, 1}, {17210, 16},
				   {39501, 1}, {28, 100}]},
     #personal_push_gift_data{gift_id = 38005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 125}, {lev_max, 130}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1101, 1102,
				   1103, 1104, 1105],
			      award =
				  [{3, 3280}, {10454, 1}, {39157, 1},
				   {10403, 10}, {17211, 14}]},
     #personal_push_gift_data{gift_id = 39005, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 135}, {lev_max, 140}],
			      warehouse_id =
				  [501, 502, 503, 504, 505, 101, 102, 103, 104,
				   105, 1101, 1102, 1103, 1104, 1105, 601, 602,
				   603, 604, 605],
			      award =
				  [{3, 3280}, {39096, 1}, {39157, 1},
				   {17211, 12}, {39082, 1}]},
     #personal_push_gift_data{gift_id = 31105, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 145}, {lev_max, 151}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1101, 1102,
				   1103, 1104, 1105],
			      award =
				  [{3, 3280}, {14001, 10}, {39157, 1},
				   {10403, 10}, {17211, 10}]},
     #personal_push_gift_data{gift_id = 31205, type_id = 3,
			      charge_id = 8305, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 185}, {lev_max, 190}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1202, 1203, 1204, 1205, 1201,
				   1202, 1203, 1204, 1205],
			      award =
				  [{3, 3280}, {14001, 10}, {39157, 1},
				   {16202, 1}, {10460, 3}]}];
get_gift_list({3, 198}) ->
    [#personal_push_gift_data{gift_id = 30004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 15}, {lev_max, 20}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 501, 502, 503, 504,
				   505, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award =
				  [{3, 1980}, {29905, 50}, {39099, 1},
				   {10403, 19}, {22, 1584000}]},
     #personal_push_gift_data{gift_id = 31004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 45}, {lev_max, 50}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1201],
			      award =
				  [{3, 1980}, {29905, 50}, {14001, 2},
				   {10403, 19}, {37002, 2}]},
     #personal_push_gift_data{gift_id = 32004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 65}, {lev_max, 70}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1201],
			      award =
				  [{3, 1980}, {29905, 50}, {14001, 2},
				   {10403, 19}, {37002, 2}]},
     #personal_push_gift_data{gift_id = 33004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 75}, {lev_max, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1980}, {29905, 50}, {14001, 2},
				   {10403, 19}, {10450, 1584}]},
     #personal_push_gift_data{gift_id = 34004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 85}, {lev_max, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1980}, {14001, 2}, {10603, 7},
				   {10415, 19}, {10040, 53}]},
     #personal_push_gift_data{gift_id = 35004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 95}, {lev_max, 100}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 1201, 1202,
				   1203],
			      award =
				  [{3, 1980}, {14001, 2}, {10603, 7},
				   {10415, 19}, {17009, 79}]},
     #personal_push_gift_data{gift_id = 36004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 105}, {lev_max, 110}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 1201, 1202,
				   1203],
			      award =
				  [{3, 1980}, {29905, 50}, {10603, 6},
				   {10403, 22}, {17009, 89}]},
     #personal_push_gift_data{gift_id = 37004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 115}, {lev_max, 120}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 101, 102, 103,
				   104, 105, 101, 102, 103, 104, 105, 1201,
				   1202, 1203, 1204],
			      award =
				  [{3, 1980}, {17210, 32}, {14001, 4},
				   {10403, 16}, {28, 150}]},
     #personal_push_gift_data{gift_id = 38004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 125}, {lev_max, 130}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1101, 1102,
				   1103, 1104, 1105],
			      award =
				  [{3, 1980}, {39082, 1}, {14001, 4},
				   {10403, 16}, {17211, 12}]},
     #personal_push_gift_data{gift_id = 39004, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 135}, {lev_max, 140}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1101, 1102, 1103, 1104, 1105, 601, 602,
				   603, 604, 605],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 24},
				   {17211, 27}, {39082, 1}]},
     #personal_push_gift_data{gift_id = 31104, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 145}, {lev_max, 151}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1101, 1102,
				   1103, 1104, 1105],
			      award =
				  [{3, 1980}, {29905, 50}, {14001, 4},
				   {10403, 16}, {17211, 7}]},
     #personal_push_gift_data{gift_id = 31204, type_id = 3,
			      charge_id = 8304, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 185}, {lev_max, 190}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 701, 702, 703, 704, 705, 1201, 1202,
				   1203, 1204],
			      award =
				  [{3, 1980}, {29905, 50}, {14001, 4},
				   {10415, 20}, {28, 150}]}];
get_gift_list({3, 128}) ->
    [#personal_push_gift_data{gift_id = 30003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 15}, {lev_max, 20}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 501, 502, 503, 504,
				   505, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award =
				  [{3, 1280}, {29905, 50}, {39100, 1},
				   {10403, 8}, {22, 1024000}]},
     #personal_push_gift_data{gift_id = 31003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 45}, {lev_max, 50}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1201],
			      award =
				  [{3, 1280}, {29905, 50}, {14001, 1},
				   {10403, 8}, {37002, 1}]},
     #personal_push_gift_data{gift_id = 32003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 65}, {lev_max, 70}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1201],
			      award =
				  [{3, 1280}, {29905, 50}, {14001, 1},
				   {10403, 8}, {37002, 1}]},
     #personal_push_gift_data{gift_id = 33003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 75}, {lev_max, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {29905, 50}, {14001, 1},
				   {10403, 8}, {10450, 1024}]},
     #personal_push_gift_data{gift_id = 34003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 85}, {lev_max, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {14001, 2}, {10603, 4},
				   {10415, 8}, {10040, 34}]},
     #personal_push_gift_data{gift_id = 35003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 95}, {lev_max, 100}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 1201, 1202,
				   1203],
			      award =
				  [{3, 1280}, {14001, 2}, {10603, 4},
				   {10415, 8}, {17009, 51}]},
     #personal_push_gift_data{gift_id = 36003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 105}, {lev_max, 110}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 1201, 1202,
				   1203],
			      award =
				  [{3, 1280}, {29905, 50}, {10603, 4},
				   {10403, 10}, {17009, 58}]},
     #personal_push_gift_data{gift_id = 37003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 115}, {lev_max, 120}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 101, 102, 103,
				   104, 105, 101, 102, 103, 104, 105, 1201,
				   1202, 1203, 1204],
			      award =
				  [{3, 1280}, {17210, 28}, {14001, 2},
				   {10403, 10}, {28, 100}]},
     #personal_push_gift_data{gift_id = 38003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 125}, {lev_max, 130}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1101, 1102,
				   1103, 1104, 1105],
			      award =
				  [{3, 1280}, {39082, 1}, {14001, 2},
				   {10403, 10}, {17211, 10}]},
     #personal_push_gift_data{gift_id = 39003, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 135}, {lev_max, 140}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1101, 1102, 1103, 1104, 1105, 601, 602,
				   603, 604, 605],
			      award =
				  [{3, 1280}, {29905, 50}, {10403, 16},
				   {17211, 10}, {39082, 1}]},
     #personal_push_gift_data{gift_id = 31103, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 145}, {lev_max, 151}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 1101, 1102,
				   1103, 1104, 1105],
			      award =
				  [{3, 1280}, {29905, 50}, {14001, 2},
				   {10403, 10}, {17211, 5}]},
     #personal_push_gift_data{gift_id = 31203, type_id = 3,
			      charge_id = 8303, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 185}, {lev_max, 190}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 701, 702, 703, 704, 705, 1201, 1202,
				   1203, 1204],
			      award =
				  [{3, 1280}, {29905, 50}, {14001, 2},
				   {10415, 10}, {28, 100}]}];
get_gift_list({3, 68}) ->
    [#personal_push_gift_data{gift_id = 30002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 15}, {lev_max, 20}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 501, 502, 503, 504,
				   505, 301, 302, 303, 304, 305, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 680}, {10403, 15}, {39100, 1},
				   {22, 612000}]},
     #personal_push_gift_data{gift_id = 31002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 45}, {lev_max, 50}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 680}, {10403, 15}, {14001, 1}]},
     #personal_push_gift_data{gift_id = 32002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 65}, {lev_max, 70}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 680}, {10403, 15}, {14001, 1}]},
     #personal_push_gift_data{gift_id = 33002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 75}, {lev_max, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 680}, {10403, 15}, {14001, 1}]},
     #personal_push_gift_data{gift_id = 34002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 85}, {lev_max, 90}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 680}, {10415, 14}, {10603, 3},
				   {10040, 20}]},
     #personal_push_gift_data{gift_id = 35002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 95}, {lev_max, 100}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 1201, 1202, 1203, 101, 102, 103, 104,
				   105],
			      award =
				  [{3, 680}, {10403, 15}, {10415, 7},
				   {17009, 31}]},
     #personal_push_gift_data{gift_id = 36002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 105}, {lev_max, 110}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 1201, 1202, 1203, 101, 102, 103, 104,
				   105],
			      award =
				  [{3, 680}, {10403, 14}, {10603, 3},
				   {17009, 20}]},
     #personal_push_gift_data{gift_id = 37002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 115}, {lev_max, 120}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 101, 102, 103,
				   104, 105, 1201, 1202, 1203, 1204, 101, 102,
				   103, 104, 105],
			      award =
				  [{3, 680}, {17210, 21}, {10403, 12},
				   {28, 61}]},
     #personal_push_gift_data{gift_id = 38002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 125}, {lev_max, 130}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 101, 102, 103, 104,
				   105, 1201, 1202, 1203, 1204, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 680}, {39082, 1}, {10403, 12},
				   {28, 61}]},
     #personal_push_gift_data{gift_id = 39002, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 135}, {lev_max, 140}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 1101, 1102, 1103,
				   1104, 1105, 1201, 1202, 1203, 1204, 101, 102,
				   103, 104, 105],
			      award =
				  [{3, 680}, {39082, 1}, {17211, 12},
				   {28, 100}]},
     #personal_push_gift_data{gift_id = 31102, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 145}, {lev_max, 151}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 1201, 1202, 1203, 1204, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 680}, {10403, 12}, {10415, 10},
				   {28, 100}]},
     #personal_push_gift_data{gift_id = 31202, type_id = 3,
			      charge_id = 8302, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 185}, {lev_max, 190}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 1201, 1202, 1203, 1204, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 680}, {10403, 12}, {10415, 10},
				   {28, 100}]}];
get_gift_list({3, 30}) ->
    [#personal_push_gift_data{gift_id = 30001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 15}, {lev_max, 20}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 301, 302, 303, 304,
				   305, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 300}, {10403, 10}, {22, 1080000}]},
     #personal_push_gift_data{gift_id = 31001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 45}, {lev_max, 50}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				   104, 105, 101, 102, 103, 104, 105],
			      award = [{3, 300}, {10403, 10}, {37002, 1}]},
     #personal_push_gift_data{gift_id = 32001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 65}, {lev_max, 70}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				   104, 105, 101, 102, 103, 104, 105],
			      award = [{3, 300}, {10403, 10}, {37002, 1}]},
     #personal_push_gift_data{gift_id = 33001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 75}, {lev_max, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				   104, 105, 101, 102, 103, 104, 105],
			      award = [{3, 300}, {10403, 10}, {37002, 1}]},
     #personal_push_gift_data{gift_id = 34001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 85}, {lev_max, 90}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 300}, {10415, 10}, {10603, 1}]},
     #personal_push_gift_data{gift_id = 35001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 95}, {lev_max, 100}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 300}, {10403, 10}, {10415, 4}]},
     #personal_push_gift_data{gift_id = 36001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 105}, {lev_max, 110}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				   104, 105, 101, 102, 103, 104, 105],
			      award = [{3, 300}, {10403, 10}, {37002, 1}]},
     #personal_push_gift_data{gift_id = 37001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 115}, {lev_max, 120}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 101, 102, 103, 104, 105, 101,
				   102, 103, 104, 105],
			      award = [{3, 300}, {17210, 17}, {28, 108}]},
     #personal_push_gift_data{gift_id = 38001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 125}, {lev_max, 130}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1202, 1203,
				   1204, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 300}, {10403, 10}, {28, 108}]},
     #personal_push_gift_data{gift_id = 39001, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 135}, {lev_max, 140}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 101, 102, 103, 104, 105, 101,
				   102, 103, 104, 105],
			      award = [{3, 300}, {17211, 10}, {28, 108}]},
     #personal_push_gift_data{gift_id = 31101, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 145}, {lev_max, 151}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 300}, {10403, 10}, {10415, 4}]},
     #personal_push_gift_data{gift_id = 31201, type_id = 3,
			      charge_id = 8301, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 185}, {lev_max, 190}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1202, 1203,
				   1204, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 300}, {10403, 10}, {28, 108}]}];
get_gift_list({2, 648}) ->
    [#personal_push_gift_data{gift_id = 20006, type_id = 2,
			      charge_id = 8206, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 601, 602, 603, 604,
				   605, 701, 702, 703, 704, 705, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 6480}, {10490, 1}, {39082, 4},
				   {10450, 3888}, {1, 19440000}]},
     #personal_push_gift_data{gift_id = 20010, type_id = 2,
			      charge_id = 8206, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 701, 702, 703, 704,
				   705, 601, 602, 603, 604, 605, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 6480}, {10490, 1}, {10450, 12550},
				   {39082, 1}, {1, 19440000}]}];
get_gift_list({2, 328}) ->
    [#personal_push_gift_data{gift_id = 20005, type_id = 2,
			      charge_id = 8205, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 3280}, {39082, 3}, {10450, 7872},
				   {1, 9840000}]},
     #personal_push_gift_data{gift_id = 20009, type_id = 2,
			      charge_id = 8205, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 601, 602, 603, 604,
				   605, 701, 702, 703, 704, 705, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 3280}, {10450, 11808}, {39082, 2},
				   {1, 9840000}]}];
get_gift_list({2, 198}) ->
    [#personal_push_gift_data{gift_id = 20004, type_id = 2,
			      charge_id = 8204, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1980}, {39082, 2}, {10450, 4752},
				   {1, 5940000}]},
     #personal_push_gift_data{gift_id = 20008, type_id = 2,
			      charge_id = 8204, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 601, 602, 603, 604,
				   605, 701, 702, 703, 704, 705, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1980}, {10450, 7128}, {39082, 1},
				   {1, 5940000}]}];
get_gift_list({2, 128}) ->
    [#personal_push_gift_data{gift_id = 20003, type_id = 2,
			      charge_id = 8203, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 701, 702, 703, 704,
				   705, 201, 202, 203, 204, 205, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1280}, {39082, 1}, {10450, 4072},
				   {1, 3840000}]},
     #personal_push_gift_data{gift_id = 20007, type_id = 2,
			      charge_id = 8203, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 601, 602, 603, 604,
				   605, 201, 202, 203, 204, 205, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1280}, {10450, 3840}, {39082, 1},
				   {1, 3840000}]}];
get_gift_list({2, 68}) ->
    [#personal_push_gift_data{gift_id = 20002, type_id = 2,
			      charge_id = 8202, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 680}, {39082, 1}, {10450, 1904}]}];
get_gift_list({2, 30}) ->
    [#personal_push_gift_data{gift_id = 20001, type_id = 2,
			      charge_id = 8201, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 101, 102, 103,
				   104, 105],
			      award = [{3, 300}, {39082, 1}]}];
get_gift_list({1, 648}) ->
    [#personal_push_gift_data{gift_id = 15001, type_id = 1,
			      charge_id = 8106, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 20}],
			      warehouse_id =
				  [501, 502, 503, 504, 505, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 6480}, {39095, 1}, {14001, 5},
				   {10403, 24}, {1, 5000000}]},
     #personal_push_gift_data{gift_id = 15002, type_id = 1,
			      charge_id = 8106, limit_count = 10, money = 648,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 20}],
			      warehouse_id =
				  [601, 602, 603, 604, 605, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 6480}, {10454, 1}, {14001, 5},
				   {10403, 24}, {10450, 3888}]}];
get_gift_list({1, 328}) ->
    [#personal_push_gift_data{gift_id = 14001, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 201, 202, 203, 204, 205, 301, 302, 303,
				   304, 305],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {1, 19680000}, {22, 1968000}]},
     #personal_push_gift_data{gift_id = 14002, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 301, 302, 303, 304, 305, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {22, 3936000}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14003, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 401, 402, 403, 404, 405, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {10001, 3936}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14004, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 601, 602, 603, 604, 605, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {39082, 1}, {10450, 1968}]},
     #personal_push_gift_data{gift_id = 14005, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {10415, 16}, {10040, 66}]},
     #personal_push_gift_data{gift_id = 14006, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1202, 1203, 1201, 1202, 1203],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {17009, 197}, {17011, 20}]},
     #personal_push_gift_data{gift_id = 14007, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1101, 1102, 1103, 1104, 1105, 1201,
				   1202, 1203, 1204],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {17210, 26}, {28, 197}]},
     #personal_push_gift_data{gift_id = 14008, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1101, 1102, 1103, 1104, 1105, 1201,
				   1202, 1203, 1204],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {17211, 20}, {28, 197}]},
     #personal_push_gift_data{gift_id = 14009, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1201],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {72004, 196800}, {72001, 131}]},
     #personal_push_gift_data{gift_id = 14010, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1201],
			      award =
				  [{3, 3280}, {39157, 1}, {10403, 24},
				   {72001, 262}, {72004, 98400}]},
     #personal_push_gift_data{gift_id = 14011, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 3280}, {10415, 31}, {10603, 8},
				   {10040, 131}, {10403, 8}]},
     #personal_push_gift_data{gift_id = 14012, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 3280}, {10415, 31}, {10040, 197},
				   {10603, 5}, {10403, 8}]},
     #personal_push_gift_data{gift_id = 14013, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 3280}, {10603, 11}, {10415, 24},
				   {10040, 131}, {10403, 8}]},
     #personal_push_gift_data{gift_id = 14014, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204, 101, 102,
				   103, 104, 105],
			      award =
				  [{3, 3280}, {17210, 52}, {28, 590},
				   {10030, 79}, {10403, 8}]},
     #personal_push_gift_data{gift_id = 14015, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204, 101, 102,
				   103, 104, 105],
			      award =
				  [{3, 3280}, {17211, 40}, {28, 590},
				   {10030, 79}, {10403, 8}]},
     #personal_push_gift_data{gift_id = 14016, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 3280}, {10403, 31}, {1, 29520000},
				   {22, 3936000}, {10001, 1968}]},
     #personal_push_gift_data{gift_id = 14017, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 301, 302, 303, 304,
				   305, 201, 202, 203, 204, 205, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 3280}, {10403, 31}, {22, 5904000},
				   {1, 19680000}, {10001, 1968}]},
     #personal_push_gift_data{gift_id = 14018, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 401, 402, 403, 404,
				   405, 201, 202, 203, 204, 205, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 3280}, {10403, 31}, {10001, 5904},
				   {1, 19680000}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14019, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 601, 602, 603, 604,
				   605, 701, 702, 703, 704, 705, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 3280}, {10403, 31}, {39082, 2},
				   {10450, 3936}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14020, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 3280}, {10403, 31}, {10415, 24},
				   {10040, 131}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14021, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1202, 1203,
				   1201, 1202, 1203, 201, 202, 203, 204, 205],
			      award =
				  [{3, 3280}, {10403, 31}, {17009, 295},
				   {17011, 39}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14022, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1101, 1102, 1103,
				   1104, 1105, 1201, 1202, 1203, 1204, 201, 202,
				   203, 204, 205],
			      award =
				  [{3, 3280}, {10403, 31}, {17210, 39},
				   {28, 394}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14023, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1101, 1102, 1103,
				   1104, 1105, 1201, 1202, 1203, 1204, 201, 202,
				   203, 204, 205],
			      award =
				  [{3, 3280}, {10403, 31}, {17211, 30},
				   {28, 394}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14024, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1201, 201,
				   202, 203, 204, 205],
			      award =
				  [{3, 3280}, {10403, 31}, {72004, 295200},
				   {72001, 262}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14025, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1201, 201,
				   202, 203, 204, 205],
			      award =
				  [{3, 3280}, {10403, 31}, {72001, 394},
				   {72004, 196800}, {1, 9840000}]},
     #personal_push_gift_data{gift_id = 14026, type_id = 1,
			      charge_id = 8105, limit_count = 10, money = 328,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 20}],
			      warehouse_id =
				  [501, 502, 503, 504, 505, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 3280}, {39096, 1}, {14001, 2},
				   {10403, 16}, {1, 2000000}]}];
get_gift_list({1, 198}) ->
    [#personal_push_gift_data{gift_id = 13001, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 201, 202, 203, 204, 205, 301, 302, 303,
				   304, 305],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {1, 11880000}, {22, 1188000}]},
     #personal_push_gift_data{gift_id = 13002, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 301, 302, 303, 304, 305, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {22, 2376000}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13003, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 401, 402, 403, 404, 405, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {10001, 2376}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13004, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 601, 602, 603, 604, 605, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {39082, 1}, {10450, 1188}]},
     #personal_push_gift_data{gift_id = 13005, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {10415, 10}, {10040, 40}]},
     #personal_push_gift_data{gift_id = 13006, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1202, 1203, 1201, 1202, 1203],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {17009, 119}, {17011, 12}]},
     #personal_push_gift_data{gift_id = 13007, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1101, 1102, 1103, 1104, 1105, 1201,
				   1202, 1203, 1204],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {17210, 16}, {28, 119}]},
     #personal_push_gift_data{gift_id = 13008, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1101, 1102, 1103, 1104, 1105, 1201,
				   1202, 1203, 1204],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {17211, 12}, {28, 119}]},
     #personal_push_gift_data{gift_id = 13009, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1201],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {72004, 118800}, {72001, 79}]},
     #personal_push_gift_data{gift_id = 13010, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 1201, 1201],
			      award =
				  [{3, 1980}, {29905, 50}, {10403, 14},
				   {72001, 158}, {72004, 59400}]},
     #personal_push_gift_data{gift_id = 13011, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1980}, {10415, 19}, {10603, 5},
				   {10040, 79}, {10403, 5}]},
     #personal_push_gift_data{gift_id = 13012, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1980}, {10415, 19}, {10040, 119},
				   {10603, 3}, {10403, 5}]},
     #personal_push_gift_data{gift_id = 13013, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 101, 102, 103,
				   104, 105],
			      award =
				  [{3, 1980}, {10603, 7}, {10415, 14},
				   {10040, 79}, {10403, 5}]},
     #personal_push_gift_data{gift_id = 13014, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204, 101, 102,
				   103, 104, 105],
			      award =
				  [{3, 1980}, {17210, 32}, {28, 356},
				   {10030, 48}, {10403, 5}]},
     #personal_push_gift_data{gift_id = 13015, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204, 101, 102,
				   103, 104, 105],
			      award =
				  [{3, 1980}, {17211, 24}, {28, 356},
				   {10030, 48}, {10403, 5}]},
     #personal_push_gift_data{gift_id = 13016, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 1980}, {10403, 19}, {1, 17820000},
				   {22, 2376000}, {10001, 1188}]},
     #personal_push_gift_data{gift_id = 13017, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 301, 302, 303, 304,
				   305, 201, 202, 203, 204, 205, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 1980}, {10403, 19}, {22, 3564000},
				   {1, 11880000}, {10001, 1188}]},
     #personal_push_gift_data{gift_id = 13018, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 401, 402, 403, 404,
				   405, 201, 202, 203, 204, 205, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1980}, {10403, 19}, {10001, 3564},
				   {1, 11880000}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13019, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 601, 602, 603, 604,
				   605, 701, 702, 703, 704, 705, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1980}, {10403, 19}, {39082, 1},
				   {10450, 2376}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13020, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1980}, {10403, 19}, {10415, 14},
				   {10040, 79}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13021, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1202, 1203,
				   1201, 1202, 1203, 201, 202, 203, 204, 205],
			      award =
				  [{3, 1980}, {10403, 19}, {17009, 178},
				   {17011, 24}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13022, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1101, 1102, 1103,
				   1104, 1105, 1201, 1202, 1203, 1204, 201, 202,
				   203, 204, 205],
			      award =
				  [{3, 1980}, {10403, 19}, {17210, 24},
				   {28, 238}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13023, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1101, 1102, 1103,
				   1104, 1105, 1201, 1202, 1203, 1204, 201, 202,
				   203, 204, 205],
			      award =
				  [{3, 1980}, {10403, 19}, {17211, 18},
				   {28, 238}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13024, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1201, 201,
				   202, 203, 204, 205],
			      award =
				  [{3, 1980}, {10403, 19}, {72004, 178200},
				   {72001, 158}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13025, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1201, 201,
				   202, 203, 204, 205],
			      award =
				  [{3, 1980}, {10403, 19}, {72001, 238},
				   {72004, 118800}, {1, 5940000}]},
     #personal_push_gift_data{gift_id = 13026, type_id = 1,
			      charge_id = 8104, limit_count = 10, money = 198,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 20}],
			      warehouse_id =
				  [501, 502, 503, 504, 505, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 201, 202, 203,
				   204, 205],
			      award =
				  [{3, 1980}, {39097, 1}, {14001, 1},
				   {10403, 10}, {1, 1000000}]}];
get_gift_list({1, 128}) ->
    [#personal_push_gift_data{gift_id = 12001, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 201, 202, 203, 204, 205, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {29905, 50}, {10403, 10},
				   {1, 8064000}]},
     #personal_push_gift_data{gift_id = 12002, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 20}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 201, 202, 203, 204, 205, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10403, 15}, {14001, 1},
				   {1, 8064000}]},
     #personal_push_gift_data{gift_id = 12003, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10403, 15}, {1, 11136000},
				   {22, 1612800}]},
     #personal_push_gift_data{gift_id = 12004, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 301, 302, 303, 304,
				   305, 201, 202, 203, 204, 205, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10403, 15}, {22, 2227200},
				   {1, 8064000}]},
     #personal_push_gift_data{gift_id = 12005, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 401, 402, 403, 404,
				   405, 201, 202, 203, 204, 205, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10403, 15}, {10001, 2227},
				   {1, 8064000}]},
     #personal_push_gift_data{gift_id = 12006, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 201, 202, 203, 204, 205, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10403, 15}, {10450, 2227},
				   {1, 8064000}]},
     #personal_push_gift_data{gift_id = 12007, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 601, 602, 603, 604,
				   605, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10403, 15}, {39082, 1},
				   {10450, 1613}]},
     #personal_push_gift_data{gift_id = 12008, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}, {lev, 80}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 601, 602, 603, 604,
				   605, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10403, 15}, {39082, 1},
				   {10040, 54}]},
     #personal_push_gift_data{gift_id = 12009, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{open_day, 30}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1202, 1203,
				   1204, 1205, 101, 102, 103, 104, 105, 701,
				   702, 703, 704, 705],
			      award = [{3, 1280}, {10403, 15}, {16202, 1}]},
     #personal_push_gift_data{gift_id = 12010, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1202, 1203,
				   1201, 1202, 1203, 701, 702, 703, 704, 705],
			      award =
				  [{3, 1280}, {10403, 15}, {17009, 111},
				   {17011, 16}]},
     #personal_push_gift_data{gift_id = 12011, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1201, 701,
				   702, 703, 704, 705],
			      award =
				  [{3, 1280}, {10403, 15}, {72004, 111360},
				   {72001, 108}]},
     #personal_push_gift_data{gift_id = 12012, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10415, 15}, {10603, 3},
				   {10040, 54}]},
     #personal_push_gift_data{gift_id = 12013, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10415, 15}, {10040, 74},
				   {10603, 2}]},
     #personal_push_gift_data{gift_id = 12014, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10603, 5}, {10415, 10},
				   {10040, 54}]},
     #personal_push_gift_data{gift_id = 12015, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {10415, 15}, {10040, 74},
				   {10603, 2}]},
     #personal_push_gift_data{gift_id = 12016, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204, 701, 702,
				   703, 704, 705],
			      award =
				  [{3, 1280}, {17210, 26}, {28, 223},
				   {10030, 32}]},
     #personal_push_gift_data{gift_id = 12017, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204, 701, 702,
				   703, 704, 705],
			      award =
				  [{3, 1280}, {17211, 20}, {28, 223},
				   {10030, 32}]},
     #personal_push_gift_data{gift_id = 12018, type_id = 1,
			      charge_id = 8103, limit_count = 10, money = 128,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 20}],
			      warehouse_id =
				  [501, 502, 503, 504, 505, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 701, 702, 703,
				   704, 705],
			      award =
				  [{3, 1280}, {39098, 1}, {14001, 1},
				   {10403, 6}]}];
get_gift_list({1, 68}) ->
    [#personal_push_gift_data{gift_id = 11001, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 20}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 401, 402, 403,
				   404, 405],
			      award = [{3, 680}, {10403, 12}, {14001, 1}]},
     #personal_push_gift_data{gift_id = 11002, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 201, 202, 203, 204,
				   205, 301, 302, 303, 304, 305, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 680}, {10403, 12}, {1, 7650000},
				   {22, 510000}]},
     #personal_push_gift_data{gift_id = 11003, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 301, 302, 303, 304,
				   305, 201, 202, 203, 204, 205, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 680}, {10403, 12}, {22, 1530000},
				   {1, 2550000}]},
     #personal_push_gift_data{gift_id = 11004, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 401, 402, 403, 404,
				   405, 201, 202, 203, 204, 205, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 680}, {10403, 12}, {10001, 1530},
				   {1, 2550000}]},
     #personal_push_gift_data{gift_id = 11005, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1202, 1203,
				   1201, 1202, 1203, 401, 402, 403, 404, 405],
			      award =
				  [{3, 680}, {10403, 12}, {17009, 77},
				   {17011, 5}]},
     #personal_push_gift_data{gift_id = 11006, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1201, 401,
				   402, 403, 404, 405],
			      award =
				  [{3, 680}, {10403, 12}, {72004, 76500},
				   {72001, 34}]},
     #personal_push_gift_data{gift_id = 11007, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 680}, {10415, 12}, {10603, 2},
				   {10040, 17}]},
     #personal_push_gift_data{gift_id = 11008, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 701, 702, 703, 704, 705, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 680}, {10415, 12}, {10040, 51},
				   {10603, 1}]},
     #personal_push_gift_data{gift_id = 11009, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [201, 202, 203, 204, 205, 301, 302, 303, 304,
				   305, 101, 102, 103, 104, 105, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 680}, {1, 15300000}, {22, 1530000},
				   {10403, 2}]},
     #personal_push_gift_data{gift_id = 11010, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [301, 302, 303, 304, 305, 201, 202, 203, 204,
				   205, 101, 102, 103, 104, 105, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 680}, {22, 3060000}, {1, 7650000},
				   {10403, 2}]},
     #personal_push_gift_data{gift_id = 11011, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [401, 402, 403, 404, 405, 301, 302, 303, 304,
				   305, 201, 202, 203, 204, 205, 401, 402, 403,
				   404, 405],
			      award =
				  [{3, 680}, {10001, 3060}, {22, 1530000},
				   {1, 2550000}]},
     #personal_push_gift_data{gift_id = 11012, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204, 401, 402,
				   403, 404, 405],
			      award =
				  [{3, 680}, {17210, 20}, {28, 153},
				   {10030, 10}]},
     #personal_push_gift_data{gift_id = 11013, type_id = 1,
			      charge_id = 8102, limit_count = 10, money = 68,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 1201, 1202, 1203, 1204, 401, 402,
				   403, 404, 405],
			      award =
				  [{3, 680}, {17211, 15}, {28, 153},
				   {10030, 10}]}];
get_gift_list({1, 30}) ->
    [#personal_push_gift_data{gift_id = 10001, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 201, 202, 203, 204,
				   205, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award = [{3, 300}, {10403, 10}, {1, 1350000}]},
     #personal_push_gift_data{gift_id = 10002, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 301, 302, 303, 304,
				   305, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award = [{3, 300}, {10403, 10}, {22, 270000}]},
     #personal_push_gift_data{gift_id = 10003, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 401, 402, 403, 404,
				   405, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award = [{3, 300}, {10403, 10}, {10001, 270}]},
     #personal_push_gift_data{gift_id = 10004, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award = [{3, 300}, {10403, 10}, {10450, 270}]},
     #personal_push_gift_data{gift_id = 10005, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 90}],
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 1202, 1203,
				   101, 102, 103, 104, 105, 301, 302, 303, 304,
				   305],
			      award = [{3, 300}, {10403, 10}, {17009, 14}]},
     #personal_push_gift_data{gift_id = 10006, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				   104, 105, 301, 302, 303, 304, 305],
			      award = [{3, 300}, {10403, 10}, {72001, 18}]},
     #personal_push_gift_data{gift_id = 10007, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				   104, 105, 301, 302, 303, 304, 305],
			      award = [{3, 300}, {10403, 10}, {72004, 13500}]},
     #personal_push_gift_data{gift_id = 10008, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [201, 202, 203, 204, 205, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award = [{3, 300}, {1, 12150000}, {10403, 1}]},
     #personal_push_gift_data{gift_id = 10009, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [301, 302, 303, 304, 305, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award = [{3, 300}, {22, 2430000}, {10403, 1}]},
     #personal_push_gift_data{gift_id = 10010, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      warehouse_id =
				  [401, 402, 403, 404, 405, 101, 102, 103, 104,
				   105, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award = [{3, 300}, {10001, 2430}, {10403, 1}]},
     #personal_push_gift_data{gift_id = 10011, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{lev, 80}],
			      warehouse_id =
				  [701, 702, 703, 704, 705, 701, 702, 703, 704,
				   705, 101, 102, 103, 104, 105, 301, 302, 303,
				   304, 305],
			      award = [{3, 300}, {10415, 10}, {10040, 10}]},
     #personal_push_gift_data{gift_id = 10012, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond =
				  [{holy_eqm_score, 1},
				   {holy_eqm_score_max, 9999}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 101, 102, 103, 104, 105, 301,
				   302, 303, 304, 305],
			      award = [{3, 300}, {17210, 16}, {28, 27}]},
     #personal_push_gift_data{gift_id = 10013, type_id = 1,
			      charge_id = 8101, limit_count = 10, money = 30,
			      costly_num = 888, valid_time = 14400,
			      open_cond = [{holy_eqm_score, 10000}],
			      warehouse_id =
				  [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				   1203, 1204, 101, 102, 103, 104, 105, 301,
				   302, 303, 304, 305],
			      award = [{3, 300}, {17211, 12}, {28, 27}]}];
get_gift_list(_) -> [].

get_gift(10001) ->
    #personal_push_gift_data{gift_id = 10001, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 201, 202, 203, 204,
				  205, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award = [{3, 300}, {10403, 10}, {1, 1350000}]};
get_gift(10002) ->
    #personal_push_gift_data{gift_id = 10002, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 301, 302, 303, 304,
				  305, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award = [{3, 300}, {10403, 10}, {22, 270000}]};
get_gift(10003) ->
    #personal_push_gift_data{gift_id = 10003, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 401, 402, 403, 404,
				  405, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award = [{3, 300}, {10403, 10}, {10001, 270}]};
get_gift(10004) ->
    #personal_push_gift_data{gift_id = 10004, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award = [{3, 300}, {10403, 10}, {10450, 270}]};
get_gift(10005) ->
    #personal_push_gift_data{gift_id = 10005, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1202, 1203,
				  101, 102, 103, 104, 105, 301, 302, 303, 304,
				  305],
			     award = [{3, 300}, {10403, 10}, {17009, 14}]};
get_gift(10006) ->
    #personal_push_gift_data{gift_id = 10006, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				  104, 105, 301, 302, 303, 304, 305],
			     award = [{3, 300}, {10403, 10}, {72001, 18}]};
get_gift(10007) ->
    #personal_push_gift_data{gift_id = 10007, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				  104, 105, 301, 302, 303, 304, 305],
			     award = [{3, 300}, {10403, 10}, {72004, 13500}]};
get_gift(10008) ->
    #personal_push_gift_data{gift_id = 10008, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [201, 202, 203, 204, 205, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award = [{3, 300}, {1, 12150000}, {10403, 1}]};
get_gift(10009) ->
    #personal_push_gift_data{gift_id = 10009, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [301, 302, 303, 304, 305, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award = [{3, 300}, {22, 2430000}, {10403, 1}]};
get_gift(10010) ->
    #personal_push_gift_data{gift_id = 10010, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [401, 402, 403, 404, 405, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award = [{3, 300}, {10001, 2430}, {10403, 1}]};
get_gift(10011) ->
    #personal_push_gift_data{gift_id = 10011, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award = [{3, 300}, {10415, 10}, {10040, 10}]};
get_gift(10012) ->
    #personal_push_gift_data{gift_id = 10012, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 101, 102, 103, 104, 105, 301, 302,
				  303, 304, 305],
			     award = [{3, 300}, {17210, 16}, {28, 27}]};
get_gift(10013) ->
    #personal_push_gift_data{gift_id = 10013, type_id = 1,
			     charge_id = 8101, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 101, 102, 103, 104, 105, 301, 302,
				  303, 304, 305],
			     award = [{3, 300}, {17211, 12}, {28, 27}]};
get_gift(11001) ->
    #personal_push_gift_data{gift_id = 11001, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 20}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 401, 402, 403,
				  404, 405],
			     award = [{3, 680}, {10403, 12}, {14001, 1}]};
get_gift(11002) ->
    #personal_push_gift_data{gift_id = 11002, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 680}, {10403, 12}, {1, 7650000},
				  {22, 510000}]};
get_gift(11003) ->
    #personal_push_gift_data{gift_id = 11003, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 301, 302, 303, 304,
				  305, 201, 202, 203, 204, 205, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 680}, {10403, 12}, {22, 1530000},
				  {1, 2550000}]};
get_gift(11004) ->
    #personal_push_gift_data{gift_id = 11004, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 401, 402, 403, 404,
				  405, 201, 202, 203, 204, 205, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 680}, {10403, 12}, {10001, 1530},
				  {1, 2550000}]};
get_gift(11005) ->
    #personal_push_gift_data{gift_id = 11005, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1202, 1203,
				  1201, 1202, 1203, 401, 402, 403, 404, 405],
			     award =
				 [{3, 680}, {10403, 12}, {17009, 77},
				  {17011, 5}]};
get_gift(11006) ->
    #personal_push_gift_data{gift_id = 11006, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1201, 401, 402,
				  403, 404, 405],
			     award =
				 [{3, 680}, {10403, 12}, {72004, 76500},
				  {72001, 34}]};
get_gift(11007) ->
    #personal_push_gift_data{gift_id = 11007, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 680}, {10415, 12}, {10603, 2},
				  {10040, 17}]};
get_gift(11008) ->
    #personal_push_gift_data{gift_id = 11008, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 680}, {10415, 12}, {10040, 51},
				  {10603, 1}]};
get_gift(11009) ->
    #personal_push_gift_data{gift_id = 11009, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [201, 202, 203, 204, 205, 301, 302, 303, 304,
				  305, 101, 102, 103, 104, 105, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 680}, {1, 15300000}, {22, 1530000},
				  {10403, 2}]};
get_gift(11010) ->
    #personal_push_gift_data{gift_id = 11010, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [301, 302, 303, 304, 305, 201, 202, 203, 204,
				  205, 101, 102, 103, 104, 105, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 680}, {22, 3060000}, {1, 7650000},
				  {10403, 2}]};
get_gift(11011) ->
    #personal_push_gift_data{gift_id = 11011, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [401, 402, 403, 404, 405, 301, 302, 303, 304,
				  305, 201, 202, 203, 204, 205, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 680}, {10001, 3060}, {22, 1530000},
				  {1, 2550000}]};
get_gift(11012) ->
    #personal_push_gift_data{gift_id = 11012, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204, 401, 402,
				  403, 404, 405],
			     award =
				 [{3, 680}, {17210, 20}, {28, 153},
				  {10030, 10}]};
get_gift(11013) ->
    #personal_push_gift_data{gift_id = 11013, type_id = 1,
			     charge_id = 8102, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204, 401, 402,
				  403, 404, 405],
			     award =
				 [{3, 680}, {17211, 15}, {28, 153},
				  {10030, 10}]};
get_gift(12001) ->
    #personal_push_gift_data{gift_id = 12001, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 201, 202, 203, 204, 205, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {29905, 50}, {10403, 10},
				  {1, 8064000}]};
get_gift(12002) ->
    #personal_push_gift_data{gift_id = 12002, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 20}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 201, 202, 203, 204, 205, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10403, 15}, {14001, 1},
				  {1, 8064000}]};
get_gift(12003) ->
    #personal_push_gift_data{gift_id = 12003, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10403, 15}, {1, 11136000},
				  {22, 1612800}]};
get_gift(12004) ->
    #personal_push_gift_data{gift_id = 12004, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 301, 302, 303, 304,
				  305, 201, 202, 203, 204, 205, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10403, 15}, {22, 2227200},
				  {1, 8064000}]};
get_gift(12005) ->
    #personal_push_gift_data{gift_id = 12005, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 401, 402, 403, 404,
				  405, 201, 202, 203, 204, 205, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10403, 15}, {10001, 2227},
				  {1, 8064000}]};
get_gift(12006) ->
    #personal_push_gift_data{gift_id = 12006, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 201, 202, 203, 204, 205, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10403, 15}, {10450, 2227},
				  {1, 8064000}]};
get_gift(12007) ->
    #personal_push_gift_data{gift_id = 12007, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 601, 602, 603, 604,
				  605, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10403, 15}, {39082, 1},
				  {10450, 1613}]};
get_gift(12008) ->
    #personal_push_gift_data{gift_id = 12008, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}, {lev, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 601, 602, 603, 604,
				  605, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10403, 15}, {39082, 1},
				  {10040, 54}]};
get_gift(12009) ->
    #personal_push_gift_data{gift_id = 12009, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1202, 1203,
				  1204, 1205, 101, 102, 103, 104, 105, 701, 702,
				  703, 704, 705],
			     award = [{3, 1280}, {10403, 15}, {16202, 1}]};
get_gift(12010) ->
    #personal_push_gift_data{gift_id = 12010, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1202, 1203,
				  1201, 1202, 1203, 701, 702, 703, 704, 705],
			     award =
				 [{3, 1280}, {10403, 15}, {17009, 111},
				  {17011, 16}]};
get_gift(12011) ->
    #personal_push_gift_data{gift_id = 12011, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1201, 701, 702,
				  703, 704, 705],
			     award =
				 [{3, 1280}, {10403, 15}, {72004, 111360},
				  {72001, 108}]};
get_gift(12012) ->
    #personal_push_gift_data{gift_id = 12012, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10415, 15}, {10603, 3},
				  {10040, 54}]};
get_gift(12013) ->
    #personal_push_gift_data{gift_id = 12013, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10415, 15}, {10040, 74},
				  {10603, 2}]};
get_gift(12014) ->
    #personal_push_gift_data{gift_id = 12014, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10603, 5}, {10415, 10},
				  {10040, 54}]};
get_gift(12015) ->
    #personal_push_gift_data{gift_id = 12015, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {10415, 15}, {10040, 74},
				  {10603, 2}]};
get_gift(12016) ->
    #personal_push_gift_data{gift_id = 12016, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204, 701, 702,
				  703, 704, 705],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 223},
				  {10030, 32}]};
get_gift(12017) ->
    #personal_push_gift_data{gift_id = 12017, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204, 701, 702,
				  703, 704, 705],
			     award =
				 [{3, 1280}, {17211, 20}, {28, 223},
				  {10030, 32}]};
get_gift(12018) ->
    #personal_push_gift_data{gift_id = 12018, type_id = 1,
			     charge_id = 8103, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 20}],
			     warehouse_id =
				 [501, 502, 503, 504, 505, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {39098, 1}, {14001, 1},
				  {10403, 6}]};
get_gift(13001) ->
    #personal_push_gift_data{gift_id = 13001, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 201, 202, 203, 204, 205, 301, 302, 303,
				  304, 305],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {1, 11880000}, {22, 1188000}]};
get_gift(13002) ->
    #personal_push_gift_data{gift_id = 13002, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 301, 302, 303, 304, 305, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {22, 2376000}, {1, 5940000}]};
get_gift(13003) ->
    #personal_push_gift_data{gift_id = 13003, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 401, 402, 403, 404, 405, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {10001, 2376}, {1, 5940000}]};
get_gift(13004) ->
    #personal_push_gift_data{gift_id = 13004, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 601, 602, 603, 604, 605, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {39082, 1}, {10450, 1188}]};
get_gift(13005) ->
    #personal_push_gift_data{gift_id = 13005, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {10415, 10}, {10040, 40}]};
get_gift(13006) ->
    #personal_push_gift_data{gift_id = 13006, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1202, 1203, 1201, 1202, 1203],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {17009, 119}, {17011, 12}]};
get_gift(13007) ->
    #personal_push_gift_data{gift_id = 13007, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {17210, 16}, {28, 119}]};
get_gift(13008) ->
    #personal_push_gift_data{gift_id = 13008, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {17211, 12}, {28, 119}]};
get_gift(13009) ->
    #personal_push_gift_data{gift_id = 13009, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1201],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {72004, 118800}, {72001, 79}]};
get_gift(13010) ->
    #personal_push_gift_data{gift_id = 13010, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1201],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 14},
				  {72001, 158}, {72004, 59400}]};
get_gift(13011) ->
    #personal_push_gift_data{gift_id = 13011, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1980}, {10415, 19}, {10603, 5},
				  {10040, 79}, {10403, 5}]};
get_gift(13012) ->
    #personal_push_gift_data{gift_id = 13012, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1980}, {10415, 19}, {10040, 119},
				  {10603, 3}, {10403, 5}]};
get_gift(13013) ->
    #personal_push_gift_data{gift_id = 13013, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1980}, {10603, 7}, {10415, 14},
				  {10040, 79}, {10403, 5}]};
get_gift(13014) ->
    #personal_push_gift_data{gift_id = 13014, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 1980}, {17210, 32}, {28, 356},
				  {10030, 48}, {10403, 5}]};
get_gift(13015) ->
    #personal_push_gift_data{gift_id = 13015, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 1980}, {17211, 24}, {28, 356},
				  {10030, 48}, {10403, 5}]};
get_gift(13016) ->
    #personal_push_gift_data{gift_id = 13016, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 1980}, {10403, 19}, {1, 17820000},
				  {22, 2376000}, {10001, 1188}]};
get_gift(13017) ->
    #personal_push_gift_data{gift_id = 13017, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 301, 302, 303, 304,
				  305, 201, 202, 203, 204, 205, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 1980}, {10403, 19}, {22, 3564000},
				  {1, 11880000}, {10001, 1188}]};
get_gift(13018) ->
    #personal_push_gift_data{gift_id = 13018, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 401, 402, 403, 404,
				  405, 201, 202, 203, 204, 205, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1980}, {10403, 19}, {10001, 3564},
				  {1, 11880000}, {1, 5940000}]};
get_gift(13019) ->
    #personal_push_gift_data{gift_id = 13019, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 601, 602, 603, 604,
				  605, 701, 702, 703, 704, 705, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1980}, {10403, 19}, {39082, 1},
				  {10450, 2376}, {1, 5940000}]};
get_gift(13020) ->
    #personal_push_gift_data{gift_id = 13020, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1980}, {10403, 19}, {10415, 14},
				  {10040, 79}, {1, 5940000}]};
get_gift(13021) ->
    #personal_push_gift_data{gift_id = 13021, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1202, 1203,
				  1201, 1202, 1203, 201, 202, 203, 204, 205],
			     award =
				 [{3, 1980}, {10403, 19}, {17009, 178},
				  {17011, 24}, {1, 5940000}]};
get_gift(13022) ->
    #personal_push_gift_data{gift_id = 13022, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1101, 1102, 1103,
				  1104, 1105, 1201, 1202, 1203, 1204, 201, 202,
				  203, 204, 205],
			     award =
				 [{3, 1980}, {10403, 19}, {17210, 24},
				  {28, 238}, {1, 5940000}]};
get_gift(13023) ->
    #personal_push_gift_data{gift_id = 13023, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1101, 1102, 1103,
				  1104, 1105, 1201, 1202, 1203, 1204, 201, 202,
				  203, 204, 205],
			     award =
				 [{3, 1980}, {10403, 19}, {17211, 18},
				  {28, 238}, {1, 5940000}]};
get_gift(13024) ->
    #personal_push_gift_data{gift_id = 13024, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1201, 201, 202,
				  203, 204, 205],
			     award =
				 [{3, 1980}, {10403, 19}, {72004, 178200},
				  {72001, 158}, {1, 5940000}]};
get_gift(13025) ->
    #personal_push_gift_data{gift_id = 13025, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1201, 201, 202,
				  203, 204, 205],
			     award =
				 [{3, 1980}, {10403, 19}, {72001, 238},
				  {72004, 118800}, {1, 5940000}]};
get_gift(13026) ->
    #personal_push_gift_data{gift_id = 13026, type_id = 1,
			     charge_id = 8104, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 20}],
			     warehouse_id =
				 [501, 502, 503, 504, 505, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1980}, {39097, 1}, {14001, 1},
				  {10403, 10}, {1, 1000000}]};
get_gift(14001) ->
    #personal_push_gift_data{gift_id = 14001, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 201, 202, 203, 204, 205, 301, 302, 303,
				  304, 305],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {1, 19680000}, {22, 1968000}]};
get_gift(14002) ->
    #personal_push_gift_data{gift_id = 14002, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 301, 302, 303, 304, 305, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {22, 3936000}, {1, 9840000}]};
get_gift(14003) ->
    #personal_push_gift_data{gift_id = 14003, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 401, 402, 403, 404, 405, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {10001, 3936}, {1, 9840000}]};
get_gift(14004) ->
    #personal_push_gift_data{gift_id = 14004, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 601, 602, 603, 604, 605, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {39082, 1}, {10450, 1968}]};
get_gift(14005) ->
    #personal_push_gift_data{gift_id = 14005, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {10415, 16}, {10040, 66}]};
get_gift(14006) ->
    #personal_push_gift_data{gift_id = 14006, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1202, 1203, 1201, 1202, 1203],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {17009, 197}, {17011, 20}]};
get_gift(14007) ->
    #personal_push_gift_data{gift_id = 14007, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {17210, 26}, {28, 197}]};
get_gift(14008) ->
    #personal_push_gift_data{gift_id = 14008, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {17211, 20}, {28, 197}]};
get_gift(14009) ->
    #personal_push_gift_data{gift_id = 14009, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1201],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {72004, 196800}, {72001, 131}]};
get_gift(14010) ->
    #personal_push_gift_data{gift_id = 14010, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1201],
			     award =
				 [{3, 3280}, {39157, 1}, {10403, 24},
				  {72001, 262}, {72004, 98400}]};
get_gift(14011) ->
    #personal_push_gift_data{gift_id = 14011, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 3280}, {10415, 31}, {10603, 8},
				  {10040, 131}, {10403, 8}]};
get_gift(14012) ->
    #personal_push_gift_data{gift_id = 14012, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 3280}, {10415, 31}, {10040, 197},
				  {10603, 5}, {10403, 8}]};
get_gift(14013) ->
    #personal_push_gift_data{gift_id = 14013, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 3280}, {10603, 11}, {10415, 24},
				  {10040, 131}, {10403, 8}]};
get_gift(14014) ->
    #personal_push_gift_data{gift_id = 14014, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 3280}, {17210, 52}, {28, 590},
				  {10030, 79}, {10403, 8}]};
get_gift(14015) ->
    #personal_push_gift_data{gift_id = 14015, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 3280}, {17211, 40}, {28, 590},
				  {10030, 79}, {10403, 8}]};
get_gift(14016) ->
    #personal_push_gift_data{gift_id = 14016, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 3280}, {10403, 31}, {1, 29520000},
				  {22, 3936000}, {10001, 1968}]};
get_gift(14017) ->
    #personal_push_gift_data{gift_id = 14017, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 301, 302, 303, 304,
				  305, 201, 202, 203, 204, 205, 401, 402, 403,
				  404, 405],
			     award =
				 [{3, 3280}, {10403, 31}, {22, 5904000},
				  {1, 19680000}, {10001, 1968}]};
get_gift(14018) ->
    #personal_push_gift_data{gift_id = 14018, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 401, 402, 403, 404,
				  405, 201, 202, 203, 204, 205, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 3280}, {10403, 31}, {10001, 5904},
				  {1, 19680000}, {1, 9840000}]};
get_gift(14019) ->
    #personal_push_gift_data{gift_id = 14019, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 601, 602, 603, 604,
				  605, 701, 702, 703, 704, 705, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 3280}, {10403, 31}, {39082, 2},
				  {10450, 3936}, {1, 9840000}]};
get_gift(14020) ->
    #personal_push_gift_data{gift_id = 14020, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 3280}, {10403, 31}, {10415, 24},
				  {10040, 131}, {1, 9840000}]};
get_gift(14021) ->
    #personal_push_gift_data{gift_id = 14021, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1202, 1203,
				  1201, 1202, 1203, 201, 202, 203, 204, 205],
			     award =
				 [{3, 3280}, {10403, 31}, {17009, 295},
				  {17011, 39}, {1, 9840000}]};
get_gift(14022) ->
    #personal_push_gift_data{gift_id = 14022, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1101, 1102, 1103,
				  1104, 1105, 1201, 1202, 1203, 1204, 201, 202,
				  203, 204, 205],
			     award =
				 [{3, 3280}, {10403, 31}, {17210, 39},
				  {28, 394}, {1, 9840000}]};
get_gift(14023) ->
    #personal_push_gift_data{gift_id = 14023, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1101, 1102, 1103,
				  1104, 1105, 1201, 1202, 1203, 1204, 201, 202,
				  203, 204, 205],
			     award =
				 [{3, 3280}, {10403, 31}, {17211, 30},
				  {28, 394}, {1, 9840000}]};
get_gift(14024) ->
    #personal_push_gift_data{gift_id = 14024, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1201, 201, 202,
				  203, 204, 205],
			     award =
				 [{3, 3280}, {10403, 31}, {72004, 295200},
				  {72001, 262}, {1, 9840000}]};
get_gift(14025) ->
    #personal_push_gift_data{gift_id = 14025, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1201, 201, 202,
				  203, 204, 205],
			     award =
				 [{3, 3280}, {10403, 31}, {72001, 394},
				  {72004, 196800}, {1, 9840000}]};
get_gift(14026) ->
    #personal_push_gift_data{gift_id = 14026, type_id = 1,
			     charge_id = 8105, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 20}],
			     warehouse_id =
				 [501, 502, 503, 504, 505, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 3280}, {39096, 1}, {14001, 2},
				  {10403, 16}, {1, 2000000}]};
get_gift(15001) ->
    #personal_push_gift_data{gift_id = 15001, type_id = 1,
			     charge_id = 8106, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 20}],
			     warehouse_id =
				 [501, 502, 503, 504, 505, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 6480}, {39095, 1}, {14001, 5},
				  {10403, 24}, {1, 5000000}]};
get_gift(15002) ->
    #personal_push_gift_data{gift_id = 15002, type_id = 1,
			     charge_id = 8106, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 20}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 6480}, {10454, 1}, {14001, 5},
				  {10403, 24}, {10450, 3888}]};
get_gift(20001) ->
    #personal_push_gift_data{gift_id = 20001, type_id = 2,
			     charge_id = 8201, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 300}, {39082, 1}]};
get_gift(20002) ->
    #personal_push_gift_data{gift_id = 20002, type_id = 2,
			     charge_id = 8202, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 680}, {39082, 1}, {10450, 1904}]};
get_gift(20003) ->
    #personal_push_gift_data{gift_id = 20003, type_id = 2,
			     charge_id = 8203, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 701, 702, 703, 704,
				  705, 201, 202, 203, 204, 205, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1280}, {39082, 1}, {10450, 4072},
				  {1, 3840000}]};
get_gift(20004) ->
    #personal_push_gift_data{gift_id = 20004, type_id = 2,
			     charge_id = 8204, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1980}, {39082, 2}, {10450, 4752},
				  {1, 5940000}]};
get_gift(20005) ->
    #personal_push_gift_data{gift_id = 20005, type_id = 2,
			     charge_id = 8205, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 3280}, {39082, 3}, {10450, 7872},
				  {1, 9840000}]};
get_gift(20006) ->
    #personal_push_gift_data{gift_id = 20006, type_id = 2,
			     charge_id = 8206, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 601, 602, 603, 604,
				  605, 701, 702, 703, 704, 705, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 6480}, {10490, 1}, {39082, 4},
				  {10450, 3888}, {1, 19440000}]};
get_gift(20007) ->
    #personal_push_gift_data{gift_id = 20007, type_id = 2,
			     charge_id = 8203, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 601, 602, 603, 604,
				  605, 201, 202, 203, 204, 205, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1280}, {10450, 3840}, {39082, 1},
				  {1, 3840000}]};
get_gift(20008) ->
    #personal_push_gift_data{gift_id = 20008, type_id = 2,
			     charge_id = 8204, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 601, 602, 603, 604,
				  605, 701, 702, 703, 704, 705, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 1980}, {10450, 7128}, {39082, 1},
				  {1, 5940000}]};
get_gift(20009) ->
    #personal_push_gift_data{gift_id = 20009, type_id = 2,
			     charge_id = 8205, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 601, 602, 603, 604,
				  605, 701, 702, 703, 704, 705, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 3280}, {10450, 11808}, {39082, 2},
				  {1, 9840000}]};
get_gift(20010) ->
    #personal_push_gift_data{gift_id = 20010, type_id = 2,
			     charge_id = 8206, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 701, 702, 703, 704,
				  705, 601, 602, 603, 604, 605, 201, 202, 203,
				  204, 205],
			     award =
				 [{3, 6480}, {10490, 1}, {10450, 12550},
				  {39082, 1}, {1, 19440000}]};
get_gift(30001) ->
    #personal_push_gift_data{gift_id = 30001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 15}, {lev_max, 20}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 301, 302, 303, 304,
				  305, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 300}, {10403, 10}, {22, 1080000}]};
get_gift(30002) ->
    #personal_push_gift_data{gift_id = 30002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 15}, {lev_max, 20}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 501, 502, 503, 504,
				  505, 301, 302, 303, 304, 305, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 680}, {10403, 15}, {39100, 1},
				  {22, 612000}]};
get_gift(30003) ->
    #personal_push_gift_data{gift_id = 30003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 15}, {lev_max, 20}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 501, 502, 503, 504,
				  505, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award =
				 [{3, 1280}, {29905, 50}, {39100, 1},
				  {10403, 8}, {22, 1024000}]};
get_gift(30004) ->
    #personal_push_gift_data{gift_id = 30004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 15}, {lev_max, 20}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 501, 502, 503, 504,
				  505, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award =
				 [{3, 1980}, {29905, 50}, {39099, 1},
				  {10403, 19}, {22, 1584000}]};
get_gift(30005) ->
    #personal_push_gift_data{gift_id = 30005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 15}, {lev_max, 20}],
			     warehouse_id =
				 [501, 502, 503, 504, 505, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award =
				 [{3, 3280}, {39099, 2}, {39157, 1},
				  {10403, 31}, {22, 2624000}]};
get_gift(30006) ->
    #personal_push_gift_data{gift_id = 30006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 15}, {lev_max, 20}],
			     warehouse_id =
				 [501, 502, 503, 504, 505, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 301, 302, 303,
				  304, 305],
			     award =
				 [{3, 6480}, {39099, 4}, {39157, 1},
				  {10403, 73}, {22, 7776000}]};
get_gift(31001) ->
    #personal_push_gift_data{gift_id = 31001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 45}, {lev_max, 50}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				  104, 105, 101, 102, 103, 104, 105],
			     award = [{3, 300}, {10403, 10}, {37002, 1}]};
get_gift(31002) ->
    #personal_push_gift_data{gift_id = 31002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 45}, {lev_max, 50}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 680}, {10403, 15}, {14001, 1}]};
get_gift(31003) ->
    #personal_push_gift_data{gift_id = 31003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 45}, {lev_max, 50}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1201],
			     award =
				 [{3, 1280}, {29905, 50}, {14001, 1},
				  {10403, 8}, {37002, 1}]};
get_gift(31004) ->
    #personal_push_gift_data{gift_id = 31004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 45}, {lev_max, 50}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1201],
			     award =
				 [{3, 1980}, {29905, 50}, {14001, 2},
				  {10403, 19}, {37002, 2}]};
get_gift(31005) ->
    #personal_push_gift_data{gift_id = 31005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 45}, {lev_max, 50}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 501, 502, 503,
				  504, 505],
			     award =
				 [{3, 3280}, {14001, 5}, {39157, 1},
				  {10403, 16}, {39099, 1}]};
get_gift(31006) ->
    #personal_push_gift_data{gift_id = 31006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 45}, {lev_max, 50}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 501, 502, 503,
				  504, 505],
			     award =
				 [{3, 6480}, {14001, 10}, {39157, 1},
				  {10403, 41}, {39097, 1}]};
get_gift(32001) ->
    #personal_push_gift_data{gift_id = 32001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 65}, {lev_max, 70}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				  104, 105, 101, 102, 103, 104, 105],
			     award = [{3, 300}, {10403, 10}, {37002, 1}]};
get_gift(32002) ->
    #personal_push_gift_data{gift_id = 32002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 65}, {lev_max, 70}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 680}, {10403, 15}, {14001, 1}]};
get_gift(32003) ->
    #personal_push_gift_data{gift_id = 32003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 65}, {lev_max, 70}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1201],
			     award =
				 [{3, 1280}, {29905, 50}, {14001, 1},
				  {10403, 8}, {37002, 1}]};
get_gift(32004) ->
    #personal_push_gift_data{gift_id = 32004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 65}, {lev_max, 70}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1201],
			     award =
				 [{3, 1980}, {29905, 50}, {14001, 2},
				  {10403, 19}, {37002, 2}]};
get_gift(32005) ->
    #personal_push_gift_data{gift_id = 32005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 65}, {lev_max, 70}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 501, 502, 503,
				  504, 505],
			     award =
				 [{3, 3280}, {14001, 5}, {39157, 1},
				  {10403, 16}, {39099, 1}]};
get_gift(32006) ->
    #personal_push_gift_data{gift_id = 32006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 65}, {lev_max, 70}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 501, 502, 503,
				  504, 505],
			     award =
				 [{3, 6480}, {14001, 10}, {39157, 1},
				  {10403, 41}, {39097, 1}]};
get_gift(33001) ->
    #personal_push_gift_data{gift_id = 33001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 75}, {lev_max, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				  104, 105, 101, 102, 103, 104, 105],
			     award = [{3, 300}, {10403, 10}, {37002, 1}]};
get_gift(33002) ->
    #personal_push_gift_data{gift_id = 33002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 75}, {lev_max, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 680}, {10403, 15}, {14001, 1}]};
get_gift(33003) ->
    #personal_push_gift_data{gift_id = 33003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 75}, {lev_max, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {29905, 50}, {14001, 1},
				  {10403, 8}, {10450, 1024}]};
get_gift(33004) ->
    #personal_push_gift_data{gift_id = 33004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 75}, {lev_max, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1980}, {29905, 50}, {14001, 2},
				  {10403, 19}, {10450, 1584}]};
get_gift(33005) ->
    #personal_push_gift_data{gift_id = 33005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 75}, {lev_max, 80}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 3280}, {14001, 5}, {39157, 1},
				  {10403, 16}, {10450, 2624}]};
get_gift(33006) ->
    #personal_push_gift_data{gift_id = 33006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 75}, {lev_max, 80}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 6480}, {10454, 1}, {39157, 1},
				  {10403, 41}, {10450, 5184}]};
get_gift(34001) ->
    #personal_push_gift_data{gift_id = 34001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 85}, {lev_max, 90}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 300}, {10415, 10}, {10603, 1}]};
get_gift(34002) ->
    #personal_push_gift_data{gift_id = 34002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 85}, {lev_max, 90}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 680}, {10415, 14}, {10603, 3},
				  {10040, 20}]};
get_gift(34003) ->
    #personal_push_gift_data{gift_id = 34003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 85}, {lev_max, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1280}, {14001, 2}, {10603, 4}, {10415, 8},
				  {10040, 34}]};
get_gift(34004) ->
    #personal_push_gift_data{gift_id = 34004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 85}, {lev_max, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 1980}, {14001, 2}, {10603, 7},
				  {10415, 19}, {10040, 53}]};
get_gift(34005) ->
    #personal_push_gift_data{gift_id = 34005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 85}, {lev_max, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 3280}, {14001, 5}, {10603, 11},
				  {10415, 16}, {10040, 87}]};
get_gift(34006) ->
    #personal_push_gift_data{gift_id = 34006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 85}, {lev_max, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 701, 702, 703,
				  704, 705],
			     award =
				 [{3, 6480}, {14001, 10}, {10603, 14},
				  {10415, 41}, {10040, 173}]};
get_gift(35001) ->
    #personal_push_gift_data{gift_id = 35001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 95}, {lev_max, 100}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 300}, {10403, 10}, {10415, 4}]};
get_gift(35002) ->
    #personal_push_gift_data{gift_id = 35002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 95}, {lev_max, 100}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 1201, 1202, 1203, 101, 102, 103, 104,
				  105],
			     award =
				 [{3, 680}, {10403, 15}, {10415, 7},
				  {17009, 31}]};
get_gift(35003) ->
    #personal_push_gift_data{gift_id = 35003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 95}, {lev_max, 100}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 1201, 1202,
				  1203],
			     award =
				 [{3, 1280}, {14001, 2}, {10603, 4}, {10415, 8},
				  {17009, 51}]};
get_gift(35004) ->
    #personal_push_gift_data{gift_id = 35004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 95}, {lev_max, 100}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 701, 702, 703, 704, 705, 1201, 1202,
				  1203],
			     award =
				 [{3, 1980}, {14001, 2}, {10603, 7},
				  {10415, 19}, {17009, 79}]};
get_gift(35005) ->
    #personal_push_gift_data{gift_id = 35005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 95}, {lev_max, 100}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 701, 702, 703, 704, 705, 1201, 1202,
				  1203],
			     award =
				 [{3, 3280}, {14001, 6}, {39157, 1},
				  {10415, 18}, {17009, 131}]};
get_gift(35006) ->
    #personal_push_gift_data{gift_id = 35006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 95}, {lev_max, 100}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 701, 702, 703, 704, 705, 1201, 1202,
				  1203],
			     award =
				 [{3, 6480}, {14001, 12}, {39157, 1},
				  {10415, 41}, {17009, 259}]};
get_gift(36001) ->
    #personal_push_gift_data{gift_id = 36001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 105}, {lev_max, 110}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 101, 102, 103,
				  104, 105, 101, 102, 103, 104, 105],
			     award = [{3, 300}, {10403, 10}, {37002, 1}]};
get_gift(36002) ->
    #personal_push_gift_data{gift_id = 36002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 105}, {lev_max, 110}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 1201, 1202, 1203, 101, 102, 103, 104,
				  105],
			     award =
				 [{3, 680}, {10403, 14}, {10603, 3},
				  {17009, 20}]};
get_gift(36003) ->
    #personal_push_gift_data{gift_id = 36003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 105}, {lev_max, 110}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 1201, 1202,
				  1203],
			     award =
				 [{3, 1280}, {29905, 50}, {10603, 4},
				  {10403, 10}, {17009, 58}]};
get_gift(36004) ->
    #personal_push_gift_data{gift_id = 36004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 105}, {lev_max, 110}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 1201, 1202,
				  1203],
			     award =
				 [{3, 1980}, {29905, 50}, {10603, 6},
				  {10403, 22}, {17009, 89}]};
get_gift(36005) ->
    #personal_push_gift_data{gift_id = 36005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 105}, {lev_max, 110}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 3280}, {10454, 1}, {10603, 3}, {39157, 1},
				  {10403, 10}]};
get_gift(36006) ->
    #personal_push_gift_data{gift_id = 36006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 105}, {lev_max, 110}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 6480}, {10454, 1}, {10603, 15},
				  {39157, 1}, {10403, 26}]};
get_gift(37001) ->
    #personal_push_gift_data{gift_id = 37001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 115}, {lev_max, 120}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 101, 102, 103, 104, 105, 101, 102,
				  103, 104, 105],
			     award = [{3, 300}, {17210, 17}, {28, 108}]};
get_gift(37002) ->
    #personal_push_gift_data{gift_id = 37002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 115}, {lev_max, 120}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 101, 102, 103,
				  104, 105, 1201, 1202, 1203, 1204, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 680}, {17210, 21}, {10403, 12},
				  {28, 61}]};
get_gift(37003) ->
    #personal_push_gift_data{gift_id = 37003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 115}, {lev_max, 120}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 101, 102, 103,
				  104, 105, 101, 102, 103, 104, 105, 1201, 1202,
				  1203, 1204],
			     award =
				 [{3, 1280}, {17210, 28}, {14001, 2},
				  {10403, 10}, {28, 100}]};
get_gift(37004) ->
    #personal_push_gift_data{gift_id = 37004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 115}, {lev_max, 120}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 101, 102, 103,
				  104, 105, 101, 102, 103, 104, 105, 1201, 1202,
				  1203, 1204],
			     award =
				 [{3, 1980}, {17210, 32}, {14001, 4},
				  {10403, 16}, {28, 150}]};
get_gift(37005) ->
    #personal_push_gift_data{gift_id = 37005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 115}, {lev_max, 120}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 1101, 1102, 1103,
				  1104, 1105, 1201, 1202, 1203, 1204, 1201,
				  1202, 1203, 1204],
			     award =
				 [{3, 3280}, {10454, 1}, {17210, 16},
				  {39501, 1}, {28, 100}]};
get_gift(37006) ->
    #personal_push_gift_data{gift_id = 37006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 115}, {lev_max, 120}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 1101, 1102, 1103,
				  1104, 1105, 1201, 1202, 1203, 1204, 1201,
				  1202, 1203, 1204],
			     award =
				 [{3, 6480}, {10454, 1}, {17210, 78},
				  {39505, 1}, {28, 583}]};
get_gift(38001) ->
    #personal_push_gift_data{gift_id = 38001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 125}, {lev_max, 130}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1202, 1203,
				  1204, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 300}, {10403, 10}, {28, 108}]};
get_gift(38002) ->
    #personal_push_gift_data{gift_id = 38002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 125}, {lev_max, 130}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 101, 102, 103, 104,
				  105, 1201, 1202, 1203, 1204, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 680}, {39082, 1}, {10403, 12}, {28, 61}]};
get_gift(38003) ->
    #personal_push_gift_data{gift_id = 38003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 125}, {lev_max, 130}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1101, 1102,
				  1103, 1104, 1105],
			     award =
				 [{3, 1280}, {39082, 1}, {14001, 2},
				  {10403, 10}, {17211, 10}]};
get_gift(38004) ->
    #personal_push_gift_data{gift_id = 38004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 125}, {lev_max, 130}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1101, 1102,
				  1103, 1104, 1105],
			     award =
				 [{3, 1980}, {39082, 1}, {14001, 4},
				  {10403, 16}, {17211, 12}]};
get_gift(38005) ->
    #personal_push_gift_data{gift_id = 38005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 125}, {lev_max, 130}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1101, 1102,
				  1103, 1104, 1105],
			     award =
				 [{3, 3280}, {10454, 1}, {39157, 1},
				  {10403, 10}, {17211, 14}]};
get_gift(38006) ->
    #personal_push_gift_data{gift_id = 38006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 125}, {lev_max, 130}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 501, 502, 503, 504,
				  505, 601, 602, 603, 604, 605, 1101, 1102,
				  1103, 1104, 1105],
			     award =
				 [{3, 6480}, {10454, 1}, {39095, 1}, {39082, 1},
				  {17211, 20}]};
get_gift(39001) ->
    #personal_push_gift_data{gift_id = 39001, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 135}, {lev_max, 140}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 101, 102, 103, 104, 105, 101, 102,
				  103, 104, 105],
			     award = [{3, 300}, {17211, 10}, {28, 108}]};
get_gift(39002) ->
    #personal_push_gift_data{gift_id = 39002, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 135}, {lev_max, 140}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 1101, 1102, 1103,
				  1104, 1105, 1201, 1202, 1203, 1204, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 680}, {39082, 1}, {17211, 12},
				  {28, 100}]};
get_gift(39003) ->
    #personal_push_gift_data{gift_id = 39003, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 135}, {lev_max, 140}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1101, 1102, 1103, 1104, 1105, 601, 602,
				  603, 604, 605],
			     award =
				 [{3, 1280}, {29905, 50}, {10403, 16},
				  {17211, 10}, {39082, 1}]};
get_gift(39004) ->
    #personal_push_gift_data{gift_id = 39004, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 135}, {lev_max, 140}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1101, 1102, 1103, 1104, 1105, 601, 602,
				  603, 604, 605],
			     award =
				 [{3, 1980}, {29905, 50}, {10403, 24},
				  {17211, 27}, {39082, 1}]};
get_gift(39005) ->
    #personal_push_gift_data{gift_id = 39005, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 135}, {lev_max, 140}],
			     warehouse_id =
				 [501, 502, 503, 504, 505, 101, 102, 103, 104,
				  105, 1101, 1102, 1103, 1104, 1105, 601, 602,
				  603, 604, 605],
			     award =
				 [{3, 3280}, {39096, 1}, {39157, 1},
				  {17211, 12}, {39082, 1}]};
get_gift(39006) ->
    #personal_push_gift_data{gift_id = 39006, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 135}, {lev_max, 140}],
			     warehouse_id =
				 [501, 502, 503, 504, 505, 101, 102, 103, 104,
				  105, 1101, 1102, 1103, 1104, 1105, 601, 602,
				  603, 604, 605],
			     award =
				 [{3, 6480}, {39095, 1}, {39157, 1},
				  {17211, 36}, {39082, 2}]};
get_gift(31101) ->
    #personal_push_gift_data{gift_id = 31101, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 145}, {lev_max, 151}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 300}, {10403, 10}, {10415, 4}]};
get_gift(31102) ->
    #personal_push_gift_data{gift_id = 31102, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 145}, {lev_max, 151}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 1201, 1202, 1203, 1204, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 680}, {10403, 12}, {10415, 10},
				  {28, 100}]};
get_gift(31103) ->
    #personal_push_gift_data{gift_id = 31103, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 145}, {lev_max, 151}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1101, 1102,
				  1103, 1104, 1105],
			     award =
				 [{3, 1280}, {29905, 50}, {14001, 2},
				  {10403, 10}, {17211, 5}]};
get_gift(31104) ->
    #personal_push_gift_data{gift_id = 31104, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 145}, {lev_max, 151}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1101, 1102,
				  1103, 1104, 1105],
			     award =
				 [{3, 1980}, {29905, 50}, {14001, 4},
				  {10403, 16}, {17211, 7}]};
get_gift(31105) ->
    #personal_push_gift_data{gift_id = 31105, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 145}, {lev_max, 151}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1101, 1102,
				  1103, 1104, 1105],
			     award =
				 [{3, 3280}, {14001, 10}, {39157, 1},
				  {10403, 10}, {17211, 10}]};
get_gift(31106) ->
    #personal_push_gift_data{gift_id = 31106, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 145}, {lev_max, 151}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 601, 602, 603, 604, 605, 1201, 1202,
				  1203, 1204],
			     award =
				 [{3, 6480}, {14001, 15}, {39157, 1},
				  {10454, 1}, {10090, 10}]};
get_gift(31201) ->
    #personal_push_gift_data{gift_id = 31201, type_id = 3,
			     charge_id = 8301, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 185}, {lev_max, 190}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1202, 1203,
				  1204, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 300}, {10403, 10}, {28, 108}]};
get_gift(31202) ->
    #personal_push_gift_data{gift_id = 31202, type_id = 3,
			     charge_id = 8302, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 185}, {lev_max, 190}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 701, 702, 703, 704,
				  705, 1201, 1202, 1203, 1204, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 680}, {10403, 12}, {10415, 10},
				  {28, 100}]};
get_gift(31203) ->
    #personal_push_gift_data{gift_id = 31203, type_id = 3,
			     charge_id = 8303, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 185}, {lev_max, 190}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 701, 702, 703, 704, 705, 1201, 1202,
				  1203, 1204],
			     award =
				 [{3, 1280}, {29905, 50}, {14001, 2},
				  {10415, 10}, {28, 100}]};
get_gift(31204) ->
    #personal_push_gift_data{gift_id = 31204, type_id = 3,
			     charge_id = 8304, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 185}, {lev_max, 190}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 701, 702, 703, 704, 705, 1201, 1202,
				  1203, 1204],
			     award =
				 [{3, 1980}, {29905, 50}, {14001, 4},
				  {10415, 20}, {28, 150}]};
get_gift(31205) ->
    #personal_push_gift_data{gift_id = 31205, type_id = 3,
			     charge_id = 8305, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 185}, {lev_max, 190}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1202, 1203, 1204, 1205, 1201, 1202,
				  1203, 1204, 1205],
			     award =
				 [{3, 3280}, {14001, 10}, {39157, 1},
				  {16202, 1}, {10460, 3}]};
get_gift(31206) ->
    #personal_push_gift_data{gift_id = 31206, type_id = 3,
			     charge_id = 8306, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 185}, {lev_max, 190}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1202, 1203, 1204, 1205, 1201, 1202,
				  1203, 1204, 1205],
			     award =
				 [{3, 6480}, {14001, 15}, {39157, 1},
				  {16202, 3}, {10460, 10}]};
get_gift(40001) ->
    #personal_push_gift_data{gift_id = 40001, type_id = 4,
			     charge_id = 8401, limit_count = 10, money = 30,
			     costly_num = 600, valid_time = 14400,
			     warehouse_id =
				 [201, 202, 203, 204, 205, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 300}, {1, 1800000}, {22, 1080000},
				  {10001, 360}]};
get_gift(40002) ->
    #personal_push_gift_data{gift_id = 40002, type_id = 4,
			     charge_id = 8402, limit_count = 10, money = 68,
			     costly_num = 600, valid_time = 14400,
			     warehouse_id =
				 [201, 202, 203, 204, 205, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 680}, {1, 3400000}, {22, 2040000},
				  {10001, 680}]};
get_gift(40003) ->
    #personal_push_gift_data{gift_id = 40003, type_id = 4,
			     charge_id = 8403, limit_count = 10, money = 128,
			     costly_num = 600, valid_time = 14400,
			     warehouse_id =
				 [201, 202, 203, 204, 205, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1280}, {1, 9600000}, {22, 3200000},
				  {10001, 1280}]};
get_gift(40004) ->
    #personal_push_gift_data{gift_id = 40004, type_id = 4,
			     charge_id = 8404, limit_count = 10, money = 198,
			     costly_num = 600, valid_time = 14400,
			     warehouse_id =
				 [201, 202, 203, 204, 205, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1980}, {1, 14850000}, {22, 4950000},
				  {10001, 1980}]};
get_gift(40005) ->
    #personal_push_gift_data{gift_id = 40005, type_id = 4,
			     charge_id = 8405, limit_count = 10, money = 328,
			     costly_num = 600, valid_time = 14400,
			     warehouse_id =
				 [201, 202, 203, 204, 205, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 3280}, {1, 32800000}, {22, 6560000},
				  {10001, 3280}]};
get_gift(40006) ->
    #personal_push_gift_data{gift_id = 40006, type_id = 4,
			     charge_id = 8406, limit_count = 10, money = 648,
			     costly_num = 600, valid_time = 14400,
			     warehouse_id =
				 [201, 202, 203, 204, 205, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 6480}, {1, 64800000}, {22, 12960000},
				  {10001, 6480}]};
get_gift(41001) ->
    #personal_push_gift_data{gift_id = 41001, type_id = 4,
			     charge_id = 8401, limit_count = 10, money = 30,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 300}, {10450, 720}, {1, 3600000},
				  {22, 360000}]};
get_gift(41002) ->
    #personal_push_gift_data{gift_id = 41002, type_id = 4,
			     charge_id = 8402, limit_count = 10, money = 68,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 680}, {10450, 1360}, {1, 6800000},
				  {22, 680000}]};
get_gift(41003) ->
    #personal_push_gift_data{gift_id = 41003, type_id = 4,
			     charge_id = 8403, limit_count = 10, money = 128,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1280}, {10450, 2560}, {1, 12800000},
				  {22, 1280000}]};
get_gift(41004) ->
    #personal_push_gift_data{gift_id = 41004, type_id = 4,
			     charge_id = 8404, limit_count = 10, money = 198,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1980}, {10450, 3960}, {1, 19800000},
				  {22, 1980000}]};
get_gift(41005) ->
    #personal_push_gift_data{gift_id = 41005, type_id = 4,
			     charge_id = 8405, limit_count = 10, money = 328,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 3280}, {10450, 6560}, {1, 32800000},
				  {22, 3280000}]};
get_gift(41006) ->
    #personal_push_gift_data{gift_id = 41006, type_id = 4,
			     charge_id = 8406, limit_count = 10, money = 648,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 6480}, {10450, 12960}, {1, 64800000},
				  {22, 6480000}]};
get_gift(41007) ->
    #personal_push_gift_data{gift_id = 41007, type_id = 4,
			     charge_id = 8401, limit_count = 10, money = 30,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 300}, {10450, 720}, {1, 3600000},
				  {10001, 360}]};
get_gift(41008) ->
    #personal_push_gift_data{gift_id = 41008, type_id = 4,
			     charge_id = 8402, limit_count = 10, money = 68,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 680}, {10450, 1360}, {1, 6800000},
				  {10001, 680}]};
get_gift(41009) ->
    #personal_push_gift_data{gift_id = 41009, type_id = 4,
			     charge_id = 8403, limit_count = 10, money = 128,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1280}, {10450, 2560}, {1, 12800000},
				  {10001, 1280}]};
get_gift(41010) ->
    #personal_push_gift_data{gift_id = 41010, type_id = 4,
			     charge_id = 8404, limit_count = 10, money = 198,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1980}, {10450, 3960}, {1, 19800000},
				  {10001, 1980}]};
get_gift(41011) ->
    #personal_push_gift_data{gift_id = 41011, type_id = 4,
			     charge_id = 8405, limit_count = 10, money = 328,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 3280}, {10450, 6560}, {1, 32800000},
				  {10001, 3280}]};
get_gift(41012) ->
    #personal_push_gift_data{gift_id = 41012, type_id = 4,
			     charge_id = 8406, limit_count = 10, money = 648,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 201, 202, 203, 204,
				  205, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 6480}, {10450, 12960}, {1, 64800000},
				  {10001, 6480}]};
get_gift(41013) ->
    #personal_push_gift_data{gift_id = 41013, type_id = 4,
			     charge_id = 8401, limit_count = 10, money = 30,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 300}, {10450, 720}, {22, 1080000},
				  {10001, 200}]};
get_gift(41014) ->
    #personal_push_gift_data{gift_id = 41014, type_id = 4,
			     charge_id = 8402, limit_count = 10, money = 68,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 680}, {10450, 1360}, {22, 2040000},
				  {10001, 340}]};
get_gift(41015) ->
    #personal_push_gift_data{gift_id = 41015, type_id = 4,
			     charge_id = 8403, limit_count = 10, money = 128,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1280}, {10450, 2560}, {22, 3840000},
				  {10001, 640}]};
get_gift(41016) ->
    #personal_push_gift_data{gift_id = 41016, type_id = 4,
			     charge_id = 8404, limit_count = 10, money = 198,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 1980}, {10450, 3960}, {22, 5940000},
				  {10001, 1000}]};
get_gift(41017) ->
    #personal_push_gift_data{gift_id = 41017, type_id = 4,
			     charge_id = 8405, limit_count = 10, money = 328,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 3280}, {10450, 6560}, {22, 6560000},
				  {10001, 3280}]};
get_gift(41018) ->
    #personal_push_gift_data{gift_id = 41018, type_id = 4,
			     charge_id = 8406, limit_count = 10, money = 648,
			     costly_num = 600, valid_time = 14400,
			     open_cond = [{lev, 40}],
			     warehouse_id =
				 [701, 702, 703, 704, 705, 301, 302, 303, 304,
				  305, 401, 402, 403, 404, 405, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 6480}, {10450, 12960}, {22, 12960000},
				  {10001, 6480}]};
get_gift(42001) ->
    #personal_push_gift_data{gift_id = 42001, type_id = 4,
			     charge_id = 8405, limit_count = 10, money = 328,
			     costly_num = 600, valid_time = 14400,
			     warehouse_id =
				 [501, 502, 503, 504, 505, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 3280}, {39096, 1}, {1, 6560000},
				  {22, 1312000}]};
get_gift(42002) ->
    #personal_push_gift_data{gift_id = 42002, type_id = 4,
			     charge_id = 8406, limit_count = 10, money = 648,
			     costly_num = 600, valid_time = 14400,
			     warehouse_id =
				 [501, 502, 503, 504, 505, 201, 202, 203, 204,
				  205, 301, 302, 303, 304, 305, 101, 102, 103,
				  104, 105],
			     award =
				 [{3, 6480}, {39095, 1}, {1, 12960000},
				  {22, 2592000}]};
get_gift(50001) ->
    #personal_push_gift_data{gift_id = 50001, type_id = 5,
			     charge_id = 8501, limit_count = 10, money = 30,
			     costly_num = 800, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 300}, {39082, 1}]};
get_gift(50002) ->
    #personal_push_gift_data{gift_id = 50002, type_id = 5,
			     charge_id = 8502, limit_count = 10, money = 68,
			     costly_num = 800, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [601, 602, 603, 604, 605, 701, 702, 703, 704,
				  705, 101, 102, 103, 104, 105, 101, 102, 103,
				  104, 105],
			     award = [{3, 680}, {39082, 1}, {10450, 1000}]};
get_gift(50003) ->
    #personal_push_gift_data{gift_id = 50003, type_id = 5,
			     charge_id = 8503, limit_count = 10, money = 128,
			     costly_num = 800, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [1201, 1202, 1203, 1204, 1205, 1201, 1202,
				  1203, 1204, 1205, 701, 702, 703, 704, 705,
				  101, 102, 103, 104, 105],
			     award =
				 [{3, 1280}, {16202, 1}, {10460, 3},
				  {10450, 1200}]};
get_gift(50004) ->
    #personal_push_gift_data{gift_id = 50004, type_id = 5,
			     charge_id = 8504, limit_count = 10, money = 198,
			     costly_num = 800, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [1201, 1202, 1203, 1204, 1205, 1201, 1202,
				  1203, 1204, 1205, 701, 702, 703, 704, 705,
				  101, 102, 103, 104, 105],
			     award =
				 [{3, 1980}, {16202, 1}, {10460, 5},
				  {10450, 2500}]};
get_gift(50005) ->
    #personal_push_gift_data{gift_id = 50005, type_id = 5,
			     charge_id = 8505, limit_count = 10, money = 328,
			     costly_num = 800, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [1201, 1202, 1203, 1204, 1205, 1201, 1202,
				  1203, 1204, 1205, 701, 702, 703, 704, 705,
				  101, 102, 103, 104, 105],
			     award =
				 [{3, 3280}, {16202, 2}, {10460, 7},
				  {10450, 5000}]};
get_gift(50006) ->
    #personal_push_gift_data{gift_id = 50006, type_id = 5,
			     charge_id = 8506, limit_count = 10, money = 648,
			     costly_num = 800, valid_time = 14400,
			     open_cond = [{open_day, 30}],
			     warehouse_id =
				 [1201, 1202, 1203, 1204, 1205, 1201, 1202,
				  1203, 1204, 1205, 701, 702, 703, 704, 705,
				  101, 102, 103, 104, 105],
			     award =
				 [{3, 6480}, {16202, 4}, {10460, 15},
				  {10450, 10000}]};
get_gift(60001) ->
    #personal_push_gift_data{gift_id = 60001, type_id = 6,
			     charge_id = 8601, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 300}, {17210, 4}, {10030, 22},
				  {1, 900000}]};
get_gift(60002) ->
    #personal_push_gift_data{gift_id = 60002, type_id = 6,
			     charge_id = 8602, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 680}, {17210, 7}, {10030, 41},
				  {1, 1700000}]};
get_gift(60003) ->
    #personal_push_gift_data{gift_id = 60003, type_id = 6,
			     charge_id = 8603, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 1280}, {17210, 12}, {10030, 69},
				  {1, 2880000}]};
get_gift(60004) ->
    #personal_push_gift_data{gift_id = 60004, type_id = 6,
			     charge_id = 8604, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 1980}, {17210, 18}, {10030, 107},
				  {1, 4455000}]};
get_gift(60005) ->
    #personal_push_gift_data{gift_id = 60005, type_id = 6,
			     charge_id = 8605, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 3280}, {17210, 30}, {10030, 177},
				  {1, 7380000}]};
get_gift(60006) ->
    #personal_push_gift_data{gift_id = 60006, type_id = 6,
			     charge_id = 8606, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 6480}, {17210, 58}, {10030, 350},
				  {1, 14580000}]};
get_gift(61001) ->
    #personal_push_gift_data{gift_id = 61001, type_id = 6,
			     charge_id = 8601, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 300}, {17211, 3}, {10030, 22},
				  {1, 900000}]};
get_gift(61002) ->
    #personal_push_gift_data{gift_id = 61002, type_id = 6,
			     charge_id = 8602, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 680}, {17211, 5}, {10030, 41},
				  {1, 1700000}]};
get_gift(61003) ->
    #personal_push_gift_data{gift_id = 61003, type_id = 6,
			     charge_id = 8603, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 1280}, {17211, 9}, {10030, 69},
				  {1, 2880000}]};
get_gift(61004) ->
    #personal_push_gift_data{gift_id = 61004, type_id = 6,
			     charge_id = 8604, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 1980}, {17211, 13}, {10030, 107},
				  {1, 4455000}]};
get_gift(61005) ->
    #personal_push_gift_data{gift_id = 61005, type_id = 6,
			     charge_id = 8605, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 3280}, {17211, 22}, {10030, 177},
				  {1, 7380000}]};
get_gift(61006) ->
    #personal_push_gift_data{gift_id = 61006, type_id = 6,
			     charge_id = 8606, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 201, 202, 203, 204, 205, 101, 102,
				  103, 104, 105],
			     award =
				 [{3, 6480}, {17211, 44}, {10030, 350},
				  {1, 14580000}]};
get_gift(70001) ->
    #personal_push_gift_data{gift_id = 70001, type_id = 7,
			     charge_id = 8701, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 1201, 1202, 1203,
				  1201, 1202, 1203, 1201, 1202, 1203],
			     award = [{3, 300}, {10408, 10}, {17009, 30}]};
get_gift(70002) ->
    #personal_push_gift_data{gift_id = 70002, type_id = 7,
			     charge_id = 8702, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1202, 1203, 1201, 1202, 1203],
			     award =
				 [{3, 680}, {14001, 1}, {10408, 10},
				  {17009, 27}]};
get_gift(70003) ->
    #personal_push_gift_data{gift_id = 70003, type_id = 7,
			     charge_id = 8703, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 1201, 1202, 1203, 1201, 1202, 1203],
			     award =
				 [{3, 1280}, {14001, 2}, {10408, 12},
				  {17009, 46}, {17011, 10}]};
get_gift(70004) ->
    #personal_push_gift_data{gift_id = 70004, type_id = 7,
			     charge_id = 8704, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1201, 1202,
				  1203],
			     award =
				 [{3, 1980}, {14001, 3}, {29905, 1},
				  {10408, 12}, {17009, 52}]};
get_gift(70005) ->
    #personal_push_gift_data{gift_id = 70005, type_id = 7,
			     charge_id = 8705, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1201, 1202,
				  1203],
			     award =
				 [{3, 3280}, {14001, 6}, {39157, 1},
				  {10408, 10}, {17009, 66}]};
get_gift(70006) ->
    #personal_push_gift_data{gift_id = 70006, type_id = 7,
			     charge_id = 8706, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{lev, 90}],
			     warehouse_id =
				 [101, 102, 103, 104, 105, 101, 102, 103, 104,
				  105, 101, 102, 103, 104, 105, 1201, 1202,
				  1203],
			     award =
				 [{3, 6480}, {14001, 12}, {39157, 1},
				  {10408, 41}, {17009, 259}]};
get_gift(80001) ->
    #personal_push_gift_data{gift_id = 80001, type_id = 8,
			     charge_id = 8801, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204],
			     award = [{3, 300}, {17210, 13}, {28, 48}]};
get_gift(80002) ->
    #personal_push_gift_data{gift_id = 80002, type_id = 8,
			     charge_id = 8802, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204],
			     award =
				 [{3, 680}, {17210, 19}, {28, 143},
				  {10030, 10}]};
get_gift(80011) ->
    #personal_push_gift_data{gift_id = 80011, type_id = 8,
			     charge_id = 8801, limit_count = 10, money = 30,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204],
			     award = [{3, 300}, {17211, 10}, {28, 48}]};
get_gift(80012) ->
    #personal_push_gift_data{gift_id = 80012, type_id = 8,
			     charge_id = 8802, limit_count = 10, money = 68,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 1201, 1202,
				  1203, 1204, 1201, 1202, 1203, 1204],
			     award =
				 [{3, 680}, {17211, 14}, {28, 143},
				  {10030, 10}]};
get_gift(81001) ->
    #personal_push_gift_data{gift_id = 81001, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 901, 1001],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39101, 1}]};
get_gift(81002) ->
    #personal_push_gift_data{gift_id = 81002, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 901, 1001],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39101, 1},
				  {10030, 20}]};
get_gift(81003) ->
    #personal_push_gift_data{gift_id = 81003, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 901, 1001],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39115, 1},
				  {10030, 62}]};
get_gift(81004) ->
    #personal_push_gift_data{gift_id = 81004, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 901, 1001],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39115, 1},
				  {10030, 154}]};
get_gift(81005) ->
    #personal_push_gift_data{gift_id = 81005, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 901, 1001],
			     award =
				 [{3, 1280}, {17211, 19}, {39115, 1},
				  {28, 80}]};
get_gift(81006) ->
    #personal_push_gift_data{gift_id = 81006, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 901, 1001],
			     award =
				 [{3, 1980}, {17211, 24}, {39129, 1}, {28, 80},
				  {10030, 10}]};
get_gift(81007) ->
    #personal_push_gift_data{gift_id = 81007, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 901, 1001],
			     award =
				 [{3, 3280}, {17211, 33}, {39143, 1}, {28, 164},
				  {10030, 33}]};
get_gift(81008) ->
    #personal_push_gift_data{gift_id = 81008, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 901, 1001],
			     award =
				 [{3, 6480}, {17211, 73}, {39143, 1}, {28, 551},
				  {10030, 110}]};
get_gift(82001) ->
    #personal_push_gift_data{gift_id = 82001, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 902, 1002],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39102, 1}]};
get_gift(82002) ->
    #personal_push_gift_data{gift_id = 82002, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 902, 1002],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39102, 1},
				  {10030, 20}]};
get_gift(82003) ->
    #personal_push_gift_data{gift_id = 82003, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 902, 1002],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39116, 1},
				  {10030, 62}]};
get_gift(82004) ->
    #personal_push_gift_data{gift_id = 82004, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 902, 1002],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39116, 1},
				  {10030, 154}]};
get_gift(82005) ->
    #personal_push_gift_data{gift_id = 82005, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 902, 1002],
			     award =
				 [{3, 1280}, {17211, 19}, {39116, 1},
				  {28, 80}]};
get_gift(82006) ->
    #personal_push_gift_data{gift_id = 82006, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 902, 1002],
			     award =
				 [{3, 1980}, {17211, 24}, {39130, 1}, {28, 80},
				  {10030, 10}]};
get_gift(82007) ->
    #personal_push_gift_data{gift_id = 82007, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 902, 1002],
			     award =
				 [{3, 3280}, {17211, 33}, {39144, 1}, {28, 164},
				  {10030, 33}]};
get_gift(82008) ->
    #personal_push_gift_data{gift_id = 82008, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 902, 1002],
			     award =
				 [{3, 6480}, {17211, 73}, {39144, 1}, {28, 551},
				  {10030, 110}]};
get_gift(83001) ->
    #personal_push_gift_data{gift_id = 83001, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 903, 1003],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39103, 1}]};
get_gift(83002) ->
    #personal_push_gift_data{gift_id = 83002, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 903, 1003],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39103, 1},
				  {10030, 20}]};
get_gift(83003) ->
    #personal_push_gift_data{gift_id = 83003, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 903, 1003],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39117, 1},
				  {10030, 62}]};
get_gift(83004) ->
    #personal_push_gift_data{gift_id = 83004, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 903, 1003],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39117, 1},
				  {10030, 154}]};
get_gift(83005) ->
    #personal_push_gift_data{gift_id = 83005, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 903, 1003],
			     award =
				 [{3, 1280}, {17211, 19}, {39117, 1},
				  {28, 80}]};
get_gift(83006) ->
    #personal_push_gift_data{gift_id = 83006, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 903, 1003],
			     award =
				 [{3, 1980}, {17211, 24}, {39131, 1}, {28, 80},
				  {10030, 10}]};
get_gift(83007) ->
    #personal_push_gift_data{gift_id = 83007, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 903, 1003],
			     award =
				 [{3, 3280}, {17211, 33}, {39145, 1}, {28, 164},
				  {10030, 33}]};
get_gift(83008) ->
    #personal_push_gift_data{gift_id = 83008, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 903, 1003],
			     award =
				 [{3, 6480}, {17211, 73}, {39145, 1}, {28, 551},
				  {10030, 110}]};
get_gift(84001) ->
    #personal_push_gift_data{gift_id = 84001, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 904, 1004],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39104, 1}]};
get_gift(84002) ->
    #personal_push_gift_data{gift_id = 84002, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 904, 1004],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39104, 1},
				  {10030, 20}]};
get_gift(84003) ->
    #personal_push_gift_data{gift_id = 84003, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 904, 1004],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39118, 1},
				  {10030, 62}]};
get_gift(84004) ->
    #personal_push_gift_data{gift_id = 84004, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 904, 1004],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39118, 1},
				  {10030, 154}]};
get_gift(84005) ->
    #personal_push_gift_data{gift_id = 84005, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 904, 1004],
			     award =
				 [{3, 1280}, {17211, 19}, {39118, 1},
				  {28, 80}]};
get_gift(84006) ->
    #personal_push_gift_data{gift_id = 84006, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 904, 1004],
			     award =
				 [{3, 1980}, {17211, 24}, {39132, 1}, {28, 80},
				  {10030, 10}]};
get_gift(84007) ->
    #personal_push_gift_data{gift_id = 84007, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 904, 1004],
			     award =
				 [{3, 3280}, {17211, 33}, {39146, 1}, {28, 164},
				  {10030, 33}]};
get_gift(84008) ->
    #personal_push_gift_data{gift_id = 84008, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 904, 1004],
			     award =
				 [{3, 6480}, {17211, 73}, {39146, 1}, {28, 551},
				  {10030, 110}]};
get_gift(85001) ->
    #personal_push_gift_data{gift_id = 85001, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 905, 1005],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39105, 1}]};
get_gift(85002) ->
    #personal_push_gift_data{gift_id = 85002, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 905, 1005],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39105, 1},
				  {10030, 20}]};
get_gift(85003) ->
    #personal_push_gift_data{gift_id = 85003, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 905, 1005],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39119, 1},
				  {10030, 62}]};
get_gift(85004) ->
    #personal_push_gift_data{gift_id = 85004, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 905, 1005],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39119, 1},
				  {10030, 154}]};
get_gift(85005) ->
    #personal_push_gift_data{gift_id = 85005, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 905, 1005],
			     award =
				 [{3, 1280}, {17211, 19}, {39119, 1},
				  {28, 80}]};
get_gift(85006) ->
    #personal_push_gift_data{gift_id = 85006, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 905, 1005],
			     award =
				 [{3, 1980}, {17211, 24}, {39133, 1}, {28, 80},
				  {10030, 10}]};
get_gift(85007) ->
    #personal_push_gift_data{gift_id = 85007, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 905, 1005],
			     award =
				 [{3, 3280}, {17211, 33}, {39147, 1}, {28, 164},
				  {10030, 33}]};
get_gift(85008) ->
    #personal_push_gift_data{gift_id = 85008, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 905, 1005],
			     award =
				 [{3, 6480}, {17211, 73}, {39147, 1}, {28, 551},
				  {10030, 110}]};
get_gift(86001) ->
    #personal_push_gift_data{gift_id = 86001, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 906, 1006],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39106, 1}]};
get_gift(86002) ->
    #personal_push_gift_data{gift_id = 86002, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 906, 1006],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39106, 1},
				  {10030, 20}]};
get_gift(86003) ->
    #personal_push_gift_data{gift_id = 86003, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 906, 1006],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39120, 1},
				  {10030, 62}]};
get_gift(86004) ->
    #personal_push_gift_data{gift_id = 86004, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 906, 1006],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39120, 1},
				  {10030, 154}]};
get_gift(86005) ->
    #personal_push_gift_data{gift_id = 86005, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 906, 1006],
			     award =
				 [{3, 1280}, {17211, 19}, {39120, 1},
				  {28, 80}]};
get_gift(86006) ->
    #personal_push_gift_data{gift_id = 86006, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 906, 1006],
			     award =
				 [{3, 1980}, {17211, 24}, {39134, 1}, {28, 80},
				  {10030, 10}]};
get_gift(86007) ->
    #personal_push_gift_data{gift_id = 86007, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 906, 1006],
			     award =
				 [{3, 3280}, {17211, 33}, {39148, 1}, {28, 164},
				  {10030, 33}]};
get_gift(86008) ->
    #personal_push_gift_data{gift_id = 86008, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 906, 1006],
			     award =
				 [{3, 6480}, {17211, 73}, {39148, 1}, {28, 551},
				  {10030, 110}]};
get_gift(87001) ->
    #personal_push_gift_data{gift_id = 87001, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 907, 1007],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39107, 1}]};
get_gift(87002) ->
    #personal_push_gift_data{gift_id = 87002, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 907, 1007],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39107, 1},
				  {10030, 20}]};
get_gift(87003) ->
    #personal_push_gift_data{gift_id = 87003, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 907, 1007],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39121, 1},
				  {10030, 62}]};
get_gift(87004) ->
    #personal_push_gift_data{gift_id = 87004, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 907, 1007],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39121, 1},
				  {10030, 154}]};
get_gift(87005) ->
    #personal_push_gift_data{gift_id = 87005, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 907, 1007],
			     award =
				 [{3, 1280}, {17211, 19}, {39121, 1},
				  {28, 80}]};
get_gift(87006) ->
    #personal_push_gift_data{gift_id = 87006, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 907, 1007],
			     award =
				 [{3, 1980}, {17211, 24}, {39135, 1}, {28, 80},
				  {10030, 10}]};
get_gift(87007) ->
    #personal_push_gift_data{gift_id = 87007, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 907, 1007],
			     award =
				 [{3, 3280}, {17211, 33}, {39149, 1}, {28, 164},
				  {10030, 33}]};
get_gift(87008) ->
    #personal_push_gift_data{gift_id = 87008, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 907, 1007],
			     award =
				 [{3, 6480}, {17211, 73}, {39149, 1}, {28, 551},
				  {10030, 110}]};
get_gift(88001) ->
    #personal_push_gift_data{gift_id = 88001, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 908, 1008],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39108, 1}]};
get_gift(88002) ->
    #personal_push_gift_data{gift_id = 88002, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 908, 1008],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39108, 1},
				  {10030, 20}]};
get_gift(88003) ->
    #personal_push_gift_data{gift_id = 88003, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 908, 1008],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39122, 1},
				  {10030, 62}]};
get_gift(88004) ->
    #personal_push_gift_data{gift_id = 88004, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 908, 1008],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39122, 1},
				  {10030, 154}]};
get_gift(88005) ->
    #personal_push_gift_data{gift_id = 88005, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 908, 1008],
			     award =
				 [{3, 1280}, {17211, 19}, {39122, 1},
				  {28, 80}]};
get_gift(88006) ->
    #personal_push_gift_data{gift_id = 88006, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 908, 1008],
			     award =
				 [{3, 1980}, {17211, 24}, {39136, 1}, {28, 80},
				  {10030, 10}]};
get_gift(88007) ->
    #personal_push_gift_data{gift_id = 88007, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 908, 1008],
			     award =
				 [{3, 3280}, {17211, 33}, {39150, 1}, {28, 164},
				  {10030, 33}]};
get_gift(88008) ->
    #personal_push_gift_data{gift_id = 88008, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 908, 1008],
			     award =
				 [{3, 6480}, {17211, 73}, {39150, 1}, {28, 551},
				  {10030, 110}]};
get_gift(89001) ->
    #personal_push_gift_data{gift_id = 89001, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 909, 1009],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39109, 1}]};
get_gift(89002) ->
    #personal_push_gift_data{gift_id = 89002, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 909, 1009],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39109, 1},
				  {10030, 20}]};
get_gift(89003) ->
    #personal_push_gift_data{gift_id = 89003, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 909, 1009],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39123, 1},
				  {10030, 62}]};
get_gift(89004) ->
    #personal_push_gift_data{gift_id = 89004, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 909, 1009],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39123, 1},
				  {10030, 154}]};
get_gift(89005) ->
    #personal_push_gift_data{gift_id = 89005, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 909, 1009],
			     award =
				 [{3, 1280}, {17211, 19}, {39123, 1},
				  {28, 80}]};
get_gift(89006) ->
    #personal_push_gift_data{gift_id = 89006, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 909, 1009],
			     award =
				 [{3, 1980}, {17211, 24}, {39137, 1}, {28, 80},
				  {10030, 10}]};
get_gift(89007) ->
    #personal_push_gift_data{gift_id = 89007, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 909, 1009],
			     award =
				 [{3, 3280}, {17211, 33}, {39151, 1}, {28, 164},
				  {10030, 33}]};
get_gift(89008) ->
    #personal_push_gift_data{gift_id = 89008, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 909, 1009],
			     award =
				 [{3, 6480}, {17211, 73}, {39151, 1}, {28, 551},
				  {10030, 110}]};
get_gift(81101) ->
    #personal_push_gift_data{gift_id = 81101, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 910, 1010],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39110, 1}]};
get_gift(81102) ->
    #personal_push_gift_data{gift_id = 81102, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 910, 1010],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39110, 1},
				  {10030, 20}]};
get_gift(81103) ->
    #personal_push_gift_data{gift_id = 81103, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 910, 1010],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39124, 1},
				  {10030, 62}]};
get_gift(81104) ->
    #personal_push_gift_data{gift_id = 81104, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 910, 1010],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39124, 1},
				  {10030, 154}]};
get_gift(81105) ->
    #personal_push_gift_data{gift_id = 81105, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 910, 1010],
			     award =
				 [{3, 1280}, {17211, 19}, {39124, 1},
				  {28, 80}]};
get_gift(81106) ->
    #personal_push_gift_data{gift_id = 81106, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 910, 1010],
			     award =
				 [{3, 1980}, {17211, 24}, {39138, 1}, {28, 80},
				  {10030, 10}]};
get_gift(81107) ->
    #personal_push_gift_data{gift_id = 81107, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 910, 1010],
			     award =
				 [{3, 3280}, {17211, 33}, {39152, 1}, {28, 164},
				  {10030, 33}]};
get_gift(81108) ->
    #personal_push_gift_data{gift_id = 81108, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 910, 1010],
			     award =
				 [{3, 6480}, {17211, 73}, {39152, 1}, {28, 551},
				  {10030, 110}]};
get_gift(81201) ->
    #personal_push_gift_data{gift_id = 81201, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 911, 1011],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39111, 1}]};
get_gift(81202) ->
    #personal_push_gift_data{gift_id = 81202, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 911, 1011],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39111, 1},
				  {10030, 20}]};
get_gift(81203) ->
    #personal_push_gift_data{gift_id = 81203, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 911, 1011],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39125, 1},
				  {10030, 62}]};
get_gift(81204) ->
    #personal_push_gift_data{gift_id = 81204, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 911, 1011],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39125, 1},
				  {10030, 154}]};
get_gift(81205) ->
    #personal_push_gift_data{gift_id = 81205, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 911, 1011],
			     award =
				 [{3, 1280}, {17211, 19}, {39125, 1},
				  {28, 80}]};
get_gift(81206) ->
    #personal_push_gift_data{gift_id = 81206, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 911, 1011],
			     award =
				 [{3, 1980}, {17211, 24}, {39139, 1}, {28, 80},
				  {10030, 10}]};
get_gift(81207) ->
    #personal_push_gift_data{gift_id = 81207, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 911, 1011],
			     award =
				 [{3, 3280}, {17211, 33}, {39153, 1}, {28, 164},
				  {10030, 33}]};
get_gift(81208) ->
    #personal_push_gift_data{gift_id = 81208, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 911, 1011],
			     award =
				 [{3, 6480}, {17211, 73}, {39153, 1}, {28, 551},
				  {10030, 110}]};
get_gift(81301) ->
    #personal_push_gift_data{gift_id = 81301, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 912, 1012],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39112, 1}]};
get_gift(81302) ->
    #personal_push_gift_data{gift_id = 81302, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 912, 1012],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39112, 1},
				  {10030, 20}]};
get_gift(81303) ->
    #personal_push_gift_data{gift_id = 81303, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 912, 1012],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39126, 1},
				  {10030, 62}]};
get_gift(81304) ->
    #personal_push_gift_data{gift_id = 81304, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 912, 1012],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39126, 1},
				  {10030, 154}]};
get_gift(81305) ->
    #personal_push_gift_data{gift_id = 81305, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 912, 1012],
			     award =
				 [{3, 1280}, {17211, 19}, {39126, 1},
				  {28, 80}]};
get_gift(81306) ->
    #personal_push_gift_data{gift_id = 81306, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 912, 1012],
			     award =
				 [{3, 1980}, {17211, 24}, {39140, 1}, {28, 80},
				  {10030, 10}]};
get_gift(81307) ->
    #personal_push_gift_data{gift_id = 81307, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 912, 1012],
			     award =
				 [{3, 3280}, {17211, 33}, {39154, 1}, {28, 164},
				  {10030, 33}]};
get_gift(81308) ->
    #personal_push_gift_data{gift_id = 81308, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 912, 1012],
			     award =
				 [{3, 6480}, {17211, 73}, {39154, 1}, {28, 551},
				  {10030, 110}]};
get_gift(81401) ->
    #personal_push_gift_data{gift_id = 81401, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 913, 1013],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39113, 1}]};
get_gift(81402) ->
    #personal_push_gift_data{gift_id = 81402, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 913, 1013],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39113, 1},
				  {10030, 20}]};
get_gift(81403) ->
    #personal_push_gift_data{gift_id = 81403, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 913, 1013],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39127, 1},
				  {10030, 62}]};
get_gift(81404) ->
    #personal_push_gift_data{gift_id = 81404, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 913, 1013],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39127, 1},
				  {10030, 154}]};
get_gift(81405) ->
    #personal_push_gift_data{gift_id = 81405, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 913, 1013],
			     award =
				 [{3, 1280}, {17211, 19}, {39127, 1},
				  {28, 80}]};
get_gift(81406) ->
    #personal_push_gift_data{gift_id = 81406, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 913, 1013],
			     award =
				 [{3, 1980}, {17211, 24}, {39141, 1}, {28, 80},
				  {10030, 10}]};
get_gift(81407) ->
    #personal_push_gift_data{gift_id = 81407, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 913, 1013],
			     award =
				 [{3, 3280}, {17211, 33}, {39155, 1}, {28, 164},
				  {10030, 33}]};
get_gift(81408) ->
    #personal_push_gift_data{gift_id = 81408, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 913, 1013],
			     award =
				 [{3, 6480}, {17211, 73}, {39155, 1}, {28, 551},
				  {10030, 110}]};
get_gift(81501) ->
    #personal_push_gift_data{gift_id = 81501, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 914, 1014],
			     award =
				 [{3, 1280}, {17210, 26}, {28, 154},
				  {39114, 1}]};
get_gift(81502) ->
    #personal_push_gift_data{gift_id = 81502, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 914, 1014],
			     award =
				 [{3, 1980}, {17210, 33}, {28, 198}, {39114, 1},
				  {10030, 20}]};
get_gift(81503) ->
    #personal_push_gift_data{gift_id = 81503, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 914, 1014],
			     award =
				 [{3, 3280}, {17210, 44}, {28, 356}, {39128, 1},
				  {10030, 62}]};
get_gift(81504) ->
    #personal_push_gift_data{gift_id = 81504, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond =
				 [{holy_eqm_score, 1},
				  {holy_eqm_score_max, 9999}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 914, 1014],
			     award =
				 [{3, 6480}, {17210, 97}, {28, 680}, {39128, 1},
				  {10030, 154}]};
get_gift(81505) ->
    #personal_push_gift_data{gift_id = 81505, type_id = 8,
			     charge_id = 8803, limit_count = 10, money = 128,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 914, 1014],
			     award =
				 [{3, 1280}, {17211, 19}, {39128, 1},
				  {28, 80}]};
get_gift(81506) ->
    #personal_push_gift_data{gift_id = 81506, type_id = 8,
			     charge_id = 8804, limit_count = 10, money = 198,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 914, 1014],
			     award =
				 [{3, 1980}, {17211, 24}, {39142, 1}, {28, 80},
				  {10030, 10}]};
get_gift(81507) ->
    #personal_push_gift_data{gift_id = 81507, type_id = 8,
			     charge_id = 8805, limit_count = 10, money = 328,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 914, 1014],
			     award =
				 [{3, 3280}, {17211, 33}, {39156, 1}, {28, 164},
				  {10030, 33}]};
get_gift(81508) ->
    #personal_push_gift_data{gift_id = 81508, type_id = 8,
			     charge_id = 8806, limit_count = 10, money = 648,
			     costly_num = 888, valid_time = 14400,
			     open_cond = [{holy_eqm_score, 10000}],
			     warehouse_id =
				 [1101, 1102, 1103, 1104, 1105, 914, 1014],
			     award =
				 [{3, 6480}, {17211, 73}, {39156, 1}, {28, 551},
				  {10030, 110}]};
get_gift(_Info) ->
    logger:data_error("get_gift_data_not_exist===>~w",
		      [_Info], personal_push_data, 8610),
    undefined.

get_type_cd(1) -> 86400;
get_type_cd(2) -> 345600;
get_type_cd(3) -> 60;
get_type_cd(4) -> 14400;
get_type_cd(5) -> 0;
get_type_cd(6) -> 345600;
get_type_cd(7) -> 86400;
get_type_cd(8) -> 604800;
get_type_cd(_) -> 0.

get_warehouse_cond(101) ->
    {{top_hero_star_check, 1}, 90};
get_warehouse_cond(102) ->
    {{top_hero_star_check, 2}, 20};
get_warehouse_cond(103) ->
    {{top_hero_star_check, 3}, 10};
get_warehouse_cond(104) ->
    {{top_hero_star_check, 4}, 10};
get_warehouse_cond(105) ->
    {{top_hero_star_check, 5}, 10};
get_warehouse_cond(201) ->
    {{item_check, 1, 50000000}, 10};
get_warehouse_cond(202) ->
    {{item_check, 1, 30000000}, 20};
get_warehouse_cond(203) ->
    {{item_check, 1, 20000000}, 20};
get_warehouse_cond(204) ->
    {{item_check, 1, 10000000}, 20};
get_warehouse_cond(205) ->
    {{item_check, 1, 5000000}, 100};
get_warehouse_cond(301) ->
    {{item_check, 22, 50000000}, 10};
get_warehouse_cond(302) ->
    {{item_check, 22, 30000000}, 20};
get_warehouse_cond(303) ->
    {{item_check, 22, 20000000}, 20};
get_warehouse_cond(304) ->
    {{item_check, 22, 10000000}, 20};
get_warehouse_cond(305) ->
    {{item_check, 22, 5000000}, 100};
get_warehouse_cond(401) ->
    {{item_check, 10001, 10000}, 10};
get_warehouse_cond(402) ->
    {{item_check, 10001, 5000}, 20};
get_warehouse_cond(403) ->
    {{item_check, 10001, 2000}, 30};
get_warehouse_cond(404) ->
    {{item_check, 10001, 1000}, 40};
get_warehouse_cond(405) ->
    {{item_check, 10001, 500}, 70};
get_warehouse_cond(501) -> {{eqm_check, 16}, 20};
get_warehouse_cond(502) -> {{eqm_check, 15}, 20};
get_warehouse_cond(503) -> {{eqm_check, 14}, 40};
get_warehouse_cond(504) -> {{eqm_check, 13}, 20};
get_warehouse_cond(505) -> {{eqm_check, 12}, 20};
get_warehouse_cond(601) -> {{artifact_check, 5}, 40};
get_warehouse_cond(602) -> {{artifact_check, 4}, 40};
get_warehouse_cond(603) -> {{artifact_check, 3}, 20};
get_warehouse_cond(604) -> {{artifact_check, 2}, 20};
get_warehouse_cond(605) -> {{artifact_check, 1}, 20};
get_warehouse_cond(701) ->
    {{item_check, 10450, 5000}, 10};
get_warehouse_cond(702) ->
    {{item_check, 10450, 3000}, 20};
get_warehouse_cond(703) ->
    {{item_check, 10450, 2000}, 20};
get_warehouse_cond(704) ->
    {{item_check, 10450, 1000}, 20};
get_warehouse_cond(705) ->
    {{item_check, 10450, 500}, 80};
get_warehouse_cond(801) -> {{sprite_check, 5}, 20};
get_warehouse_cond(802) -> {{sprite_check, 4}, 40};
get_warehouse_cond(803) -> {{sprite_check, 3}, 40};
get_warehouse_cond(804) -> {{sprite_check, 2}, 20};
get_warehouse_cond(805) -> {{sprite_check, 1}, 20};
get_warehouse_cond(901) ->
    {{holy_eqm_3q1_check, 0, 1}, 100};
get_warehouse_cond(902) ->
    {{holy_eqm_3q1_check, 0, 2}, 100};
get_warehouse_cond(903) ->
    {{holy_eqm_3q1_check, 0, 3}, 100};
get_warehouse_cond(904) ->
    {{holy_eqm_3q1_check, 0, 4}, 100};
get_warehouse_cond(905) ->
    {{holy_eqm_3q1_check, 0, 5}, 100};
get_warehouse_cond(906) ->
    {{holy_eqm_3q1_check, 0, 6}, 100};
get_warehouse_cond(907) ->
    {{holy_eqm_3q1_check, 0, 7}, 100};
get_warehouse_cond(908) ->
    {{holy_eqm_3q1_check, 0, 8}, 100};
get_warehouse_cond(909) ->
    {{holy_eqm_3q1_check, 0, 9}, 100};
get_warehouse_cond(910) ->
    {{holy_eqm_3q1_check, 0, 10}, 100};
get_warehouse_cond(911) ->
    {{holy_eqm_3q1_check, 0, 11}, 100};
get_warehouse_cond(912) ->
    {{holy_eqm_3q1_check, 0, 12}, 100};
get_warehouse_cond(913) ->
    {{holy_eqm_3q1_check, 0, 13}, 100};
get_warehouse_cond(914) ->
    {{holy_eqm_3q1_check, 0, 14}, 100};
get_warehouse_cond(1001) ->
    {{holy_eqm_2q2_check, 0, 1}, 50};
get_warehouse_cond(1002) ->
    {{holy_eqm_2q2_check, 0, 2}, 50};
get_warehouse_cond(1003) ->
    {{holy_eqm_2q2_check, 0, 3}, 50};
get_warehouse_cond(1004) ->
    {{holy_eqm_2q2_check, 0, 4}, 50};
get_warehouse_cond(1005) ->
    {{holy_eqm_2q2_check, 0, 5}, 50};
get_warehouse_cond(1006) ->
    {{holy_eqm_2q2_check, 0, 6}, 50};
get_warehouse_cond(1007) ->
    {{holy_eqm_2q2_check, 0, 7}, 50};
get_warehouse_cond(1008) ->
    {{holy_eqm_2q2_check, 0, 8}, 50};
get_warehouse_cond(1009) ->
    {{holy_eqm_2q2_check, 0, 9}, 50};
get_warehouse_cond(1010) ->
    {{holy_eqm_2q2_check, 0, 10}, 50};
get_warehouse_cond(1011) ->
    {{holy_eqm_2q2_check, 0, 11}, 50};
get_warehouse_cond(1012) ->
    {{holy_eqm_2q2_check, 0, 12}, 50};
get_warehouse_cond(1013) ->
    {{holy_eqm_2q2_check, 0, 13}, 50};
get_warehouse_cond(1014) ->
    {{holy_eqm_2q2_check, 0, 14}, 50};
get_warehouse_cond(1101) -> {{holy_eqm_check, 1}, 30};
get_warehouse_cond(1102) -> {{holy_eqm_check, 2}, 30};
get_warehouse_cond(1103) -> {{holy_eqm_check, 3}, 40};
get_warehouse_cond(1104) -> {{holy_eqm_check, 4}, 30};
get_warehouse_cond(1105) -> {{holy_eqm_check, 5}, 30};
get_warehouse_cond(1201) -> {{lev, 20}, 10};
get_warehouse_cond(1202) -> {{lev, 80}, 10};
get_warehouse_cond(1203) -> {{lev, 90}, 10};
get_warehouse_cond(1204) -> {{lev, 120}, 10};
get_warehouse_cond(1205) -> {{lev, 150}, 10};
get_warehouse_cond(_Info) ->
    logger:data_error("get_warehouse_cond_data_not_exist===>~w",
		      [_Info], personal_push_data, 8700),
    undefined.


