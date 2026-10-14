-file("src/mod/boss/boss_ver.erl", 1).

-module(boss_ver).

-lager_records([{world_boss_data,
		 [id, name, lev, ref_time, ref_item_num, base_items,
		  show_lev]},
		{boss_data,
		 [id, name, lev, base_items, drop_ids, month_boss_tag,
		  show_lev, first_items, hook_lose]},
		{world_boss_role,
		 [id, name, sex, face, lev, hurt, power, time]},
		{world_boss,
		 [id, hp, hp_max, rnum, start_time, ref_time, role_list,
		  kill_log]},
		{boss, [id, win, status]},
		{m_boss,
		 [ver, boss_list, world_num_time, world_can_num,
		  world_had_num, world_buy_num, world_remind,
		  extra_boss]}]).

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

-file("src/mod/boss/boss_ver.erl", 11).

-file("inc/boss.hrl", 1).

-record(m_boss,
	{ver = 2, boss_list = [], world_num_time = 0,
	 world_can_num = 0, world_had_num = 0, world_buy_num = 0,
	 world_remind = [], extra_boss = []}).

-record(boss, {id = 0, win = 0, status = 0}).

-record(world_boss,
	{id = 0, hp = 0, hp_max = 0, rnum = 0, start_time = 0,
	 ref_time = 0, role_list = [], kill_log = []}).

-record(world_boss_role,
	{id = {0, <<>>}, name = <<>>, sex = 0, face = 0,
	 lev = 0, hurt = 0, power = 0, time = 0}).

-record(boss_data,
	{id = 0, name = <<>>, lev = 0, base_items = [],
	 drop_ids = [], month_boss_tag = 0, show_lev = 0,
	 first_items = [], hook_lose = []}).

-record(world_boss_data,
	{id = 0, name = <<>>, lev = 0, ref_time = 0,
	 ref_item_num = 0, base_items = [], show_lev = 0}).

-file("src/mod/boss/boss_ver.erl", 12).

do({m_boss, Ver = 1, BossList, WorldNumTime,
    WorldCanNum, WorldHadNum, WorldBuyNum, WorldRemind}) ->
    NewVer = Ver + 1,
    ExtraBoss = [],
    MBoss = {m_boss, NewVer, BossList, WorldNumTime,
	     WorldCanNum, WorldHadNum, WorldBuyNum, WorldRemind,
	     ExtraBoss},
    do(MBoss);
do(MBoss = #m_boss{ver = 2}) -> {ok, MBoss};
do(MBoss) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidboss_ver26, _,
       {__Levelboss_ver26, __Tracesboss_ver26}}
	  when __Levelboss_ver26 band 8 /= 0 orelse
		 __Tracesboss_ver26 /= [] ->
	  lager:do_log(error,
		       [{module, boss_ver}, {function, do}, {line, 26},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [MBoss]), none, 4096, 8,
		       __Levelboss_ver26, __Tracesboss_ver26, lager_event,
		       __Pidboss_ver26);
      _ -> ok
    end,
    {ok, MBoss}.


