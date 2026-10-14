-file("data/dungeon_ver.erl", 1).

-file("src/mod/dungeon/dungeon_ver.erl", 1).

-module(dungeon_ver).

-lager_records([{m_dun_stone,
		 [ver, had_num, can_num, buy_num, pass_id, list,
		  pass_dun]},
		{dungeon_replay, [dun_id, replays]},
		{dungeon_replay_log,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{dungeon_data,
		 [id, name, chapter_id, mode, next_id, unit_id, items,
		  drop_ids, hook_unit_id, hook_items, hook_drop_ids,
		  hook_lev_add, time, is_big, energy_max, auto_items,
		  power, lev_limit, floor]},
		{dungeon, [id, status, cool_time, auto_num]},
		{dun_chapter, [id, status, list]},
		{m_dungeon,
		 [ver, mode, chapter_id, dun_id, max_dun_id,
		  last_hook_time, list, drop_idx, ext_reward, buff_list,
		  fast_combat_add_time, auto_combat_id, auto_combat_num,
		  auto_combat_items, chapter_awrads, is_first,
		  acc_hook_time, acc_hook_items]}]).

-export([do/1, do_stone/1]).

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

-file("src/mod/dungeon/dungeon_ver.erl", 12).

-file("inc/dungeon.hrl", 1).

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

-file("src/mod/dungeon/dungeon_ver.erl", 13).

-file("inc/dungeon_stone.hrl", 1).

-record(m_dun_stone,
	{ver = 3, had_num = 0, can_num = 0, buy_num = 0,
	 pass_id = 0, list = [], pass_dun = []}).

-file("src/mod/dungeon/dungeon_ver.erl", 14).

do({m_dungeon, Ver = 1, Mode, CharpterId, DunId,
    MaxDunId, LstHookTime, List, DropIdx, ExtReward}) ->
    NewVer = Ver + 1,
    BuffList = [],
    MDungeon = {m_dungeon, NewVer, Mode, CharpterId, DunId,
		MaxDunId, LstHookTime, List, DropIdx, ExtReward,
		BuffList},
    do(MDungeon);
do({m_dungeon, Ver = 2, Mode, CharpterId, DunId,
    MaxDunId, LstHookTime, List, DropIdx, ExtReward,
    BuffList}) ->
    FastCombatAddTime = 0,
    AutoCombatId = 0,
    AutoCombatNum = 0,
    AutoCombatItems = [],
    MDungeon = {m_dungeon, Ver + 1, Mode, CharpterId, DunId,
		MaxDunId, LstHookTime, List, DropIdx, ExtReward,
		BuffList, FastCombatAddTime, AutoCombatId,
		AutoCombatNum, AutoCombatItems},
    do(MDungeon);
do({m_dungeon, Ver = 3, Mode, CharpterId, DunId,
    MaxDunId, LstHookTime, List, DropIdx, ExtReward,
    BuffList, FastCombatAddTime, AutoCombatId,
    AutoCombatNum, AutoCombatItems}) ->
    ChapterAwards = [],
    MDungeon = {m_dungeon, Ver + 1, Mode, CharpterId, DunId,
		MaxDunId, LstHookTime, List, DropIdx, ExtReward,
		BuffList, FastCombatAddTime, AutoCombatId,
		AutoCombatNum, AutoCombatItems, ChapterAwards},
    do(MDungeon);
do({m_dungeon, Ver = 4, Mode, CharpterId, DunId,
    MaxDunId, LstHookTime, List, DropIdx, ExtReward,
    BuffList, FastCombatAddTime, AutoCombatId,
    AutoCombatNum, AutoCombatItems, ChapterAwards}) ->
    IsFirst = 1,
    MDungeon = {m_dungeon, Ver + 1, Mode, CharpterId, DunId,
		MaxDunId, LstHookTime, List, DropIdx, ExtReward,
		BuffList, FastCombatAddTime, AutoCombatId,
		AutoCombatNum, AutoCombatItems, ChapterAwards, IsFirst},
    do(MDungeon);
do({m_dungeon, Ver = 5, Mode, CharpterId, DunId,
    MaxDunId, LstHookTime, List, DropIdx, ExtReward,
    BuffList, FastCombatAddTime, AutoCombatId,
    AutoCombatNum, AutoCombatItems, ChapterAwards,
    IsFirst}) ->
    AccHookTime = 0,
    AccHookItems = [],
    MDungeon = {m_dungeon, Ver + 1, Mode, CharpterId, DunId,
		MaxDunId, LstHookTime, List, DropIdx, ExtReward,
		BuffList, FastCombatAddTime, AutoCombatId,
		AutoCombatNum, AutoCombatItems, ChapterAwards, IsFirst,
		AccHookTime, AccHookItems},
    do(MDungeon);
do(MDungeon = #m_dungeon{ver = 6}) -> {ok, MDungeon};
do(MDungeon) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddungeon_ver74, _,
       {__Leveldungeon_ver74, __Tracesdungeon_ver74}}
	  when __Leveldungeon_ver74 band 8 /= 0 orelse
		 __Tracesdungeon_ver74 /= [] ->
	  lager:do_log(error,
		       [{module, dungeon_ver}, {function, do}, {line, 74},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [MDungeon]), none, 4096, 8,
		       __Leveldungeon_ver74, __Tracesdungeon_ver74,
		       lager_event, __Piddungeon_ver74);
      _ -> ok
    end,
    {false,
     lang:get(<<"Chuyển đổi dữ liệu bản sao không thành "
		"công"/utf8>>)}.

-spec do_stone(tuple()) -> {false, binary()} |
			   {ok, #m_dun_stone{}}.

do_stone({m_dun_stone, Ver = 1, HadNum, CanNum, BuyNum,
	  PassId}) ->
    List = [],
    do_stone({m_dun_stone, Ver + 1, HadNum, CanNum, BuyNum,
	      PassId, List});
do_stone({m_dun_stone, Ver = 2, HadNum, CanNum, BuyNum,
	  PassId, _}) ->
    List = [],
    PassDun = [],
    do_stone({m_dun_stone, Ver + 1, HadNum, CanNum, BuyNum,
	      PassId, List, PassDun});
do_stone(MDunStone = #m_dun_stone{ver = 3}) ->
    {ok, MDunStone};
do_stone(_MDunStone) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddungeon_ver89, _,
       {__Leveldungeon_ver89, __Tracesdungeon_ver89}}
	  when __Leveldungeon_ver89 band 8 /= 0 orelse
		 __Tracesdungeon_ver89 /= [] ->
	  lager:do_log(error,
		       [{module, dungeon_ver}, {function, do_stone},
			{line, 89}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("材料副本版本转换失败:~w", [_MDunStone]), none,
		       4096, 8, __Leveldungeon_ver89, __Tracesdungeon_ver89,
		       lager_event, __Piddungeon_ver89);
      _ -> ok
    end,
    {false,
     lang:get(<<"Chuyển đổi phiên bản sao chép tài liệu "
		"không thành công"/utf8>>)}.


