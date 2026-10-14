-file("src/mod/assets/assets_ver.erl", 1).

-module(assets_ver).

-lager_records([{assets,
		 [ver, exp, coin, silver_coin, gold, red_gold, gold_acc,
		  vip_exp, energy, energy_max, energy_time, activity,
		  guild, arena_cent, hero_soul, feat_point, triple_rebate,
		  friend_point, boss_point, star_hun, star_point,
		  arena_guesscent, sky_coin, hero_exp, recruit_hero,
		  recruithigh_hero, expedition_medal, elite_coin,
		  holy_eqm_coin, skin_debris, cluster_coin, home_coin,
		  hallow_refine, cluster_guess_cent, feather_exchange,
		  brave_symbol, peak_guess_cent, hero_soul_coin,
		  acc_recruit_hero, predict_point]}]).

-export([do/1]).

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

-file("src/mod/assets/assets_ver.erl", 15).

-file("inc/assets.hrl", 1).

-file("inc/game_assets.hrl", 1).

-file("inc/assets.hrl", 12).

-record(assets,
	{ver = -1, exp = 0, coin = 0, silver_coin = 0, gold = 0,
	 red_gold = 0, gold_acc = 0, vip_exp = 0, energy = 0,
	 energy_max = 0, energy_time = 0, activity = 0,
	 guild = 0, arena_cent = 0, hero_soul = 0,
	 feat_point = 0, triple_rebate = 0, friend_point = 0,
	 boss_point = 0, star_hun = 0, star_point = 0,
	 arena_guesscent = 0, sky_coin = 0, hero_exp = 0,
	 recruit_hero = 0, recruithigh_hero = 0,
	 expedition_medal = 0, elite_coin = 0, holy_eqm_coin = 0,
	 skin_debris = 0, cluster_coin = 0, home_coin = 0,
	 hallow_refine = 0, cluster_guess_cent = 0,
	 feather_exchange = 0, brave_symbol = 0,
	 peak_guess_cent = 0, hero_soul_coin = 0,
	 acc_recruit_hero = 0, predict_point = 0}).

-file("src/mod/assets/assets_ver.erl", 16).

do({assets, 2, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal}) ->
    EliteCoin = 0,
    NAssets = {assets, 3, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin},
    do(NAssets);
do({assets, 3, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin}) ->
    HolyEqmCoin = 0,
    NAssets = {assets, 4, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin},
    do(NAssets);
do({assets, 4, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin}) ->
    SkinDebris = 0,
    NAssets = {assets, 5, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris},
    do(NAssets);
do({assets, 5, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris}) ->
    ClusterCoin = 0,
    NAssets = {assets, 6, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin},
    do(NAssets);
do({assets, 6, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin}) ->
    HomeCoin = 0,
    NAssets = {assets, 7, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
	       HomeCoin},
    do(NAssets);
do({assets, 7, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
    HomeCoin}) ->
    HallowRefine = 0,
    NAssets = {assets, 8, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
	       HomeCoin, HallowRefine},
    do(NAssets);
do({assets, 8, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
    HomeCoin, HallowRefine}) ->
    ClusterGuessCent = 0,
    NAssets = {assets, 9, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
	       HomeCoin, HallowRefine, ClusterGuessCent},
    do(NAssets);
do({assets, 9, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
    HomeCoin, HallowRefine, ClusterGuessCent}) ->
    FeatherExchange = 0,
    NAssets = {assets, 10, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
	       HomeCoin, HallowRefine, ClusterGuessCent,
	       FeatherExchange},
    do(NAssets);
do({assets, 10, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
    HomeCoin, HallowRefine, ClusterGuessCent,
    FeatherExchange}) ->
    BraveSymbol = 0,
    NAssets = {assets, 11, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
	       HomeCoin, HallowRefine, ClusterGuessCent,
	       FeatherExchange, BraveSymbol},
    do(NAssets);
do({assets, 11, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
    HomeCoin, HallowRefine, ClusterGuessCent,
    FeatherExchange, BraveSymbol}) ->
    PeakGuessCent = 0,
    NAssets = {assets, 12, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
	       HomeCoin, HallowRefine, ClusterGuessCent,
	       FeatherExchange, BraveSymbol, PeakGuessCent},
    do(NAssets);
do({assets, 12, Exp, Coin, SliverCoin, Gold, RedGold,
    GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
    HomeCoin, HallowRefine, ClusterGuessCent,
    FeatherExchange, BraveSymbol, PeakGuessCent}) ->
    HeroSoulCoin = 0,
    NAssets = {assets, 13, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
	       HomeCoin, HallowRefine, ClusterGuessCent,
	       FeatherExchange, BraveSymbol, PeakGuessCent,
	       HeroSoulCoin},
    do(NAssets);
do({assets, Ver = 13, Exp, Coin, SliverCoin, Gold,
    RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
    HomeCoin, HallowRefine, ClusterGuessCent,
    FeatherExchange, BraveSymbol, PeakGuessCent,
    HeroSoulCoin}) ->
    AccRecruitHero = RecruitHero,
    NAssets = {assets, Ver + 1, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
	       HomeCoin, HallowRefine, ClusterGuessCent,
	       FeatherExchange, BraveSymbol, PeakGuessCent,
	       HeroSoulCoin, AccRecruitHero},
    do(NAssets);
do({assets, Ver = 14, Exp, Coin, SliverCoin, Gold,
    RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
    Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
    TripleRebate, FriendPoint, BossPoint, StarHun,
    StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
    RecruitHero, RecruitHighHero, ExpeditionMedal,
    EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
    HomeCoin, HallowRefine, ClusterGuessCent,
    FeatherExchange, BraveSymbol, PeakGuessCent,
    HeroSoulCoin, AccRecruitHero}) ->
    PredictPoint = 0,
    NAssets = {assets, Ver + 1, Exp, Coin, SliverCoin, Gold,
	       RedGold, GoldAcc, VipExp, Energy, EnergyMax, EnergyTime,
	       Activity, Guild, ArenaCent, HeroSoul, FeatPoint,
	       TripleRebate, FriendPoint, BossPoint, StarHun,
	       StarPoint, ArenaGuessCent, SkyCoin, HeroExp,
	       RecruitHero, RecruitHighHero, ExpeditionMedal,
	       EliteCoin, HolyEqmCoin, SkinDebris, ClusterCoin,
	       HomeCoin, HallowRefine, ClusterGuessCent,
	       FeatherExchange, BraveSymbol, PeakGuessCent,
	       HeroSoulCoin, AccRecruitHero, PredictPoint},
    do(NAssets);
do(Assets = #assets{ver = 15}) -> {ok, Assets};
do(Assets) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidassets_ver180, _,
       {__Levelassets_ver180, __Tracesassets_ver180}}
	  when __Levelassets_ver180 band 8 /= 0 orelse
		 __Tracesassets_ver180 /= [] ->
	  lager:do_log(error,
		       [{module, assets_ver}, {function, do}, {line, 180},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [Assets]), none, 4096, 8,
		       __Levelassets_ver180, __Tracesassets_ver180,
		       lager_event, __Pidassets_ver180);
      _ -> ok
    end,
    {ok, Assets}.


