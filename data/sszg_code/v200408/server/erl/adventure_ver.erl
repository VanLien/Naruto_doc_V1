-file("src/mod/adventure/adventure_ver.erl", 1).

-module(adventure_ver).

-lager_records([{adventure_data,
		 [id, room, name, lose]},
		{a_room,
		 [id, idx, evt_id, res_id, status, cond_status, lock,
		  init_evt_id, ext]},
		{m_adventure,
		 [ver, pass_id, pass_num, explore_num, id, room,
		  first_room, boss_room, room_list, buff_list, shop_list,
		  start_time, end_time, plist, is_kill_boss, init_time,
		  skill_list, bag_list, map_id, partner_id, skill_used,
		  round_reward, round_evt_group, kill_mon,
		  mine_combat_num, mine_round_combat, mine_round_reward,
		  current_id, mine_buy_count, init_id, laste_num]}]).

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

-file("src/mod/adventure/adventure_ver.erl", 11).

-file("inc/adventure.hrl", 1).

-record(m_adventure,
	{ver = 10, pass_id = 0, pass_num = 0, explore_num = 0,
	 id = 0, room = 0, first_room = 0, boss_room = 0,
	 room_list = [], buff_list = [], shop_list = [],
	 start_time = 0, end_time = 0, plist = [],
	 is_kill_boss = 0, init_time = 0, skill_list = [],
	 bag_list = [], map_id = 0, partner_id = 0,
	 skill_used = [], round_reward = [],
	 round_evt_group = [], kill_mon = 0, mine_combat_num = 0,
	 mine_round_combat = 0, mine_round_reward = [],
	 current_id = 0, mine_buy_count = 0, init_id = 0,
	 laste_num = 999}).

-record(a_room,
	{id = 1, idx = 0, evt_id = 0, res_id = 0, status = 0,
	 cond_status = 0, lock = 0, init_evt_id = 0, ext = []}).

-record(adventure_data,
	{id = 0, room = 0, name = <<>>, lose = []}).

-file("src/mod/adventure/adventure_ver.erl", 12).

do({m_adventure, Ver = 1, PassId, PassNum, ExplodeNum,
    Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
    ProgressReward, BuffRefNum, ResetNum, PList, IsKillBoss,
    PlunderNum, MapMoveDir}) ->
    NewVer = Ver + 1,
    IsBagUsed = 0,
    MAdventure = {m_adventure, NewVer, PassId, PassNum,
		  ExplodeNum, Id, Room, FirstRoom, BossRoom, RoomList,
		  BuffList, ProgressReward, BuffRefNum, ResetNum, PList,
		  IsKillBoss, PlunderNum, MapMoveDir, IsBagUsed},
    do(MAdventure);
do({m_adventure, Ver = 2, PassId, PassNum, ExplodeNum,
    Id, Room, FirstRoom, BossRoom, _RoomList, BuffList,
    ProgressReward, BuffRefNum, ResetNum, PList, IsKillBoss,
    PlunderNum, MapMoveDir, IsBagUsed}) ->
    RoomList = [],
    MapId = 0,
    do({m_adventure, Ver + 1, PassId, PassNum, ExplodeNum,
	Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
	ProgressReward, BuffRefNum, ResetNum, PList, IsKillBoss,
	PlunderNum, MapMoveDir, IsBagUsed, MapId});
do({m_adventure, Ver = 3, _, _, _, _, _, _, _, _, _, _,
    _, _, _, _, _, _, _, _}) ->
    PassId = 0,
    PassNum = 0,
    ExploreNum = 0,
    Id = 0,
    Room = 0,
    FirstRoom = 0,
    BossRoom = 0,
    RoomList = [],
    BuffList = [],
    ShopList = [],
    StartTime = 0,
    EndTime = 0,
    PList = [],
    IsKillBoss = 0,
    InitTime = 0,
    SkillList = [],
    BagList = [],
    MapId = 0,
    PartnerId = 0,
    do({m_adventure, Ver + 1, PassId, PassNum, ExploreNum,
	Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
	ShopList, StartTime, EndTime, PList, IsKillBoss,
	InitTime, SkillList, BagList, MapId, PartnerId});
do({m_adventure, Ver = 4, PassId, PassNum, ExploreNum,
    Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
    ShopList, StartTime, EndTime, PList, IsKillBoss,
    InitTime, SkillList, BagList, MapId, PartnerId}) ->
    do({m_adventure, Ver + 1, PassId, PassNum, ExploreNum,
	Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
	ShopList, StartTime, EndTime, PList, IsKillBoss,
	InitTime, SkillList, BagList, MapId, PartnerId, []});
do({m_adventure, Ver = 5, PassId, PassNum, ExploreNum,
    Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
    ShopList, StartTime, EndTime, PList, IsKillBoss,
    InitTime, SkillList, BagList, MapId, PartnerId,
    SkillUsed}) ->
    RoundReward = [],
    RoundEvtGroup = [],
    KillMon = 0,
    do({m_adventure, Ver + 1, PassId, PassNum, ExploreNum,
	Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
	ShopList, StartTime, EndTime, PList, IsKillBoss,
	InitTime, SkillList, BagList, MapId, PartnerId,
	SkillUsed, RoundReward, RoundEvtGroup, KillMon});
do({m_adventure, Ver = 6, PassId, PassNum, ExploreNum,
    Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
    ShopList, StartTime, EndTime, PList, IsKillBoss,
    InitTime, SkillList, BagList, MapId, PartnerId,
    SkillUsed, RoundReward, RoundEvtGroup, KillMon}) ->
    MineCombatNum =
	adventure_mine_data:get_const(free_attack),
    MineRoundCombat = 0,
    MineRoundReward = [],
    CurrentId = Id,
    do({m_adventure, Ver + 1, PassId, PassNum, ExploreNum,
	Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
	ShopList, StartTime, EndTime, PList, IsKillBoss,
	InitTime, SkillList, BagList, MapId, PartnerId,
	SkillUsed, RoundReward, RoundEvtGroup, KillMon,
	MineCombatNum, MineRoundCombat, MineRoundReward,
	CurrentId});
do({m_adventure, Ver = 7, PassId, PassNum, ExploreNum,
    Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
    ShopList, StartTime, EndTime, PList, IsKillBoss,
    InitTime, SkillList, BagList, MapId, PartnerId,
    SkillUsed, RoundReward, RoundEvtGroup, KillMon,
    MineCombatNum, MineRoundCombat, MineRoundReward,
    CurrentId}) ->
    MineBuyCount = 0,
    do({m_adventure, Ver + 1, PassId, PassNum, ExploreNum,
	Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
	ShopList, StartTime, EndTime, PList, IsKillBoss,
	InitTime, SkillList, BagList, MapId, PartnerId,
	SkillUsed, RoundReward, RoundEvtGroup, KillMon,
	MineCombatNum, MineRoundCombat, MineRoundReward,
	CurrentId, MineBuyCount});
do({m_adventure, Ver = 8, PassId, PassNum, ExploreNum,
    Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
    ShopList, StartTime, EndTime, PList, IsKillBoss,
    InitTime, SkillList, BagList, MapId, PartnerId,
    SkillUsed, RoundReward, RoundEvtGroup, KillMon,
    MineCombatNum, MineRoundCombat, MineRoundReward,
    CurrentId, MineBuyCount}) ->
    InitId = 0,
    do({m_adventure, Ver + 1, PassId, PassNum, ExploreNum,
	Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
	ShopList, StartTime, EndTime, PList, IsKillBoss,
	InitTime, SkillList, BagList, MapId, PartnerId,
	SkillUsed, RoundReward, RoundEvtGroup, KillMon,
	MineCombatNum, MineRoundCombat, MineRoundReward,
	CurrentId, MineBuyCount, InitId});
do({m_adventure, Ver = 9, PassId, PassNum, ExploreNum,
    Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
    ShopList, StartTime, EndTime, PList, IsKillBoss,
    InitTime, SkillList, BagList, MapId, PartnerId,
    SkillUsed, RoundReward, RoundEvtGroup, KillMon,
    MineCombatNum, MineRoundCombat, MineRoundReward,
    CurrentId, MineBuyCount, InitId}) ->
    LastNum = 999,
    do({m_adventure, Ver + 1, PassId, PassNum, ExploreNum,
	Id, Room, FirstRoom, BossRoom, RoomList, BuffList,
	ShopList, StartTime, EndTime, PList, IsKillBoss,
	InitTime, SkillList, BagList, MapId, PartnerId,
	SkillUsed, RoundReward, RoundEvtGroup, KillMon,
	MineCombatNum, MineRoundCombat, MineRoundReward,
	CurrentId, MineBuyCount, InitId, LastNum});
do(MAdventure = #m_adventure{ver = 10,
			     plist = PList}) ->
    NewPList = [partner_ver:do_partner_ver(P)
		|| P <- PList],
    {ok, MAdventure#m_adventure{plist = NewPList}};
do(MAdventure) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_ver81, _,
       {__Leveladventure_ver81, __Tracesadventure_ver81}}
	  when __Leveladventure_ver81 band 8 /= 0 orelse
		 __Tracesadventure_ver81 /= [] ->
	  lager:do_log(error,
		       [{module, adventure_ver}, {function, do}, {line, 81},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [MAdventure]), none, 4096, 8,
		       __Leveladventure_ver81, __Tracesadventure_ver81,
		       lager_event, __Pidadventure_ver81);
      _ -> ok
    end,
    {ok, MAdventure}.


