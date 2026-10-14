-file("src/mod/data/days_rank_data.erl", 1).

-module(days_rank_data).

-lager_records([{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]}]).

-export([get_const/1, list/1, get/1, type_id/1, ids/1,
	 get_quest/1, get_quest_rank_id/1, get_quest_ids/1,
	 get_quest_rewards/1, explore/1, reward/1]).

-file("inc/common.hrl", 1).

-file("inc/lib_log.hrl", 1).

-file("inc/common.hrl", 109).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("src/mod/data/days_rank_data.erl", 20).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/mod/data/days_rank_data.erl", 21).

get_const(end_time) -> {open_day, 12, 86399};
get_const(open_time) -> {{2020, 10, 2}, {0, 0, 0}};
get_const(close_shop_time) -> {open_day, 7};
get_const(rank_title1) -> 90006;
get_const(rank_title2) -> 90702;
get_const(rank_title3) -> 90011;
get_const(rank_title4) -> 90010;
get_const(rank_title5) -> 90012;
get_const(rank_title6) -> 90701;
get_const(rank_title7) -> 90707;
get_const(dugeon_limit) -> 10420;
get_const(tower_limit) -> 20;
get_const(arena_limit) -> 900;
get_const(team_limit) -> 30000;
get_const(star_limit) -> 5000;
get_const(partner_limit) -> 10000;
get_const(advanture_limit) -> 1000;
get_const(reward_limit) -> 20;
get_const(rank_title8) -> 90701;
get_const(rank_title9) -> 90702;
get_const(rank_title10) -> 90703;
get_const(rank_title11) -> 90704;
get_const(rank_title12) -> 90705;
get_const(rank_title13) -> 90706;
get_const(rank_title14) -> 90707;
get_const(rank_title15) -> 90706;
get_const(rank_title16) -> 90008;
get_const(rank_title17) -> 90007;
get_const(rank_title18) -> 90013;
get_const(rank_title19) -> 90704;
get_const(cluster_end_time) -> {cluster_day, 7, 86399};
get_const(cluster_open_time) ->
    {{2020, 10, 2}, {0, 0, 0}};
get_const(_) -> undefined.

list(1) ->
    [#{id => 8, start_time => {cluster_day, 1},
       end_time => {cluster_day, 1, 86399}},
     #{id => 9, start_time => {cluster_day, 2},
       end_time => {cluster_day, 2, 86399}},
     #{id => 10, start_time => {cluster_day, 3},
       end_time => {cluster_day, 3, 86399}},
     #{id => 11, start_time => {cluster_day, 4},
       end_time => {cluster_day, 4, 86399}},
     #{id => 12, start_time => {cluster_day, 5},
       end_time => {cluster_day, 5, 86399}},
     #{id => 13, start_time => {cluster_day, 6},
       end_time => {cluster_day, 6, 86399}},
     #{id => 14, start_time => {cluster_day, 7},
       end_time => {cluster_day, 7, 86399}}];
list(0) ->
    [#{id => 1, start_time => {open_day, 1},
       end_time => {open_day, 1, 86399}},
     #{id => 2, start_time => {open_day, 2},
       end_time => {open_day, 2, 86399}},
     #{id => 3, start_time => {open_day, 3},
       end_time => {open_day, 3, 86399}},
     #{id => 4, start_time => {open_day, 4},
       end_time => {open_day, 4, 86399}},
     #{id => 5, start_time => {open_day, 5},
       end_time => {open_day, 5, 86399}},
     #{id => 6, start_time => {open_day, 6},
       end_time => {open_day, 6, 86399}},
     #{id => 7, start_time => {open_day, 7},
       end_time => {open_day, 7, 86399}},
     #{id => 15, start_time => {open_day, 8},
       end_time => {open_day, 8, 86399}},
     #{id => 16, start_time => {open_day, 9},
       end_time => {open_day, 9, 86395}},
     #{id => 17, start_time => {open_day, 10},
       end_time => {open_day, 10, 86399}},
     #{id => 18, start_time => {open_day, 11},
       end_time => {open_day, 11, 86399}},
     #{id => 19, start_time => {open_day, 12},
       end_time => {open_day, 12, 86399}}];
list(_) -> [].

get(1) ->
    #{id => 1, name => lang:get(<<"剧情推图"/utf8>>),
      rank_type => 9, is_temp => 0,
      start_time => {open_day, 1},
      end_time => {open_day, 1, 86399}, is_cluster => 0,
      main_ico => 36};
get(2) ->
    #{id => 2, name => lang:get(<<"圣器比拼"/utf8>>),
      rank_type => 27, is_temp => 1,
      start_time => {open_day, 2},
      end_time => {open_day, 2, 86399}, is_cluster => 0,
      main_ico => 38};
get(3) ->
    #{id => 3, name => lang:get(<<"最强英雄"/utf8>>),
      rank_type => 14, is_temp => 1,
      start_time => {open_day, 3},
      end_time => {open_day, 3, 86399}, is_cluster => 0,
      main_ico => 37};
get(4) ->
    #{id => 4, name => lang:get(<<"星命之耀"/utf8>>),
      rank_type => 19, is_temp => 1,
      start_time => {open_day, 4},
      end_time => {open_day, 4, 86399}, is_cluster => 0,
      main_ico => 41};
get(5) ->
    #{id => 5, name => lang:get(<<"神界冒险"/utf8>>),
      rank_type => 15, is_temp => 1,
      start_time => {open_day, 5},
      end_time => {open_day, 5, 86399}, is_cluster => 0,
      main_ico => 40};
get(6) ->
    #{id => 6, name => lang:get(<<"炫彩宝石"/utf8>>),
      rank_type => 31, is_temp => 0,
      start_time => {open_day, 6},
      end_time => {open_day, 6, 86399}, is_cluster => 0,
      main_ico => 44};
get(7) ->
    #{id => 7, name => lang:get(<<"消费排行榜"/utf8>>),
      rank_type => 23, is_temp => 0,
      start_time => {open_day, 7},
      end_time => {open_day, 7, 86399}, is_cluster => 0,
      main_ico => 39};
get(15) ->
    #{id => 15, name => lang:get(<<"超神阵容"/utf8>>),
      rank_type => 12, is_temp => 0,
      start_time => {open_day, 8},
      end_time => {open_day, 8, 86399}, is_cluster => 0,
      main_ico => 43};
get(16) ->
    #{id => 16, name => lang:get(<<"武道宗师"/utf8>>),
      rank_type => 11, is_temp => 0,
      start_time => {open_day, 9},
      end_time => {open_day, 9, 86395}, is_cluster => 0,
      main_ico => 42};
get(17) ->
    #{id => 17, name => lang:get(<<"爬塔达人"/utf8>>),
      rank_type => 10, is_temp => 0,
      start_time => {open_day, 10},
      end_time => {open_day, 10, 86399}, is_cluster => 0,
      main_ico => 45};
get(18) ->
    #{id => 18, name => lang:get(<<"寻宝专家"/utf8>>),
      rank_type => 28, is_temp => 1,
      start_time => {open_day, 11},
      end_time => {open_day, 11, 86399}, is_cluster => 0,
      main_ico => 46};
get(19) ->
    #{id => 19, name => lang:get(<<"无尽试炼"/utf8>>),
      rank_type => 29, is_temp => 0,
      start_time => {open_day, 12},
      end_time => {open_day, 12, 86399}, is_cluster => 0,
      main_ico => 47};
get(8) ->
    #{id => 8, name => lang:get(<<"炫彩宝石"/utf8>>),
      rank_type => 1021, is_temp => 0,
      start_time => {cluster_day, 1},
      end_time => {cluster_day, 1, 86399}, is_cluster => 1};
get(9) ->
    #{id => 9, name => lang:get(<<"圣器比拼"/utf8>>),
      rank_type => 26, is_temp => 1,
      start_time => {cluster_day, 2},
      end_time => {cluster_day, 2, 86399}, is_cluster => 1};
get(10) ->
    #{id => 10, name => lang:get(<<"观星大师"/utf8>>),
      rank_type => 1024, is_temp => 1,
      start_time => {cluster_day, 3},
      end_time => {cluster_day, 3, 86399}, is_cluster => 1};
get(11) ->
    #{id => 11, name => lang:get(<<"无尽试炼"/utf8>>),
      rank_type => 1018, is_temp => 0,
      start_time => {cluster_day, 4},
      end_time => {cluster_day, 4, 86399}, is_cluster => 1};
get(12) ->
    #{id => 12, name => lang:get(<<"召唤排行榜"/utf8>>),
      rank_type => 1022, is_temp => 0,
      start_time => {cluster_day, 5},
      end_time => {cluster_day, 5, 86399}, is_cluster => 1};
get(13) ->
    #{id => 13, name => lang:get(<<"最强阵容"/utf8>>),
      rank_type => 25, is_temp => 1,
      start_time => {cluster_day, 6},
      end_time => {cluster_day, 6, 86399}, is_cluster => 1};
get(14) ->
    #{id => 14, name => lang:get(<<"消费排行榜"/utf8>>),
      rank_type => 1023, is_temp => 0,
      start_time => {cluster_day, 7},
      end_time => {cluster_day, 7, 86399}, is_cluster => 1};
get(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_data338, _,
       {__Leveldays_rank_data338, __Tracesdays_rank_data338}}
	  when __Leveldays_rank_data338 band 8 /= 0 orelse
		 __Tracesdays_rank_data338 /= [] ->
	  lager:do_log(error,
		       [{module, days_rank_data}, {function, get}, {line, 338},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_data_not_exist===>~w", [_Info]),
		       none, 4096, 8, __Leveldays_rank_data338,
		       __Tracesdays_rank_data338, lager_event,
		       __Piddays_rank_data338);
      _ -> ok
    end,
    undefined.

type_id(9) -> 1;
type_id(27) -> 2;
type_id(14) -> 3;
type_id(19) -> 4;
type_id(15) -> 5;
type_id(31) -> 6;
type_id(23) -> 7;
type_id(12) -> 15;
type_id(11) -> 16;
type_id(10) -> 17;
type_id(28) -> 18;
type_id(29) -> 19;
type_id(1021) -> 8;
type_id(26) -> 9;
type_id(1024) -> 10;
type_id(1018) -> 11;
type_id(1022) -> 12;
type_id(25) -> 13;
type_id(1023) -> 14;
type_id(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_data359, _,
       {__Leveldays_rank_data359, __Tracesdays_rank_data359}}
	  when __Leveldays_rank_data359 band 8 /= 0 orelse
		 __Tracesdays_rank_data359 /= [] ->
	  lager:do_log(error,
		       [{module, days_rank_data}, {function, type_id},
			{line, 359}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("type_id_data_not_exist===>~w", [_Info]),
		       none, 4096, 8, __Leveldays_rank_data359,
		       __Tracesdays_rank_data359, lager_event,
		       __Piddays_rank_data359);
      _ -> ok
    end,
    undefined.

ids(1) -> [8, 9, 10, 11, 12, 13, 14];
ids(0) -> [1, 2, 3, 4, 5, 6, 7, 15, 16, 17, 18, 19];
ids(_) -> [].

get_quest(1001) ->
    #quest_data{id = 1001,
		progress =
		    [#quest_progress{label = evt_dungeon_pass,
				     target = 10300, target_val = 1,
				     param = [chapter]}]};
get_quest(1002) ->
    #quest_data{id = 1002,
		progress =
		    [#quest_progress{label = evt_dungeon_pass,
				     target = 20180, target_val = 1,
				     param = [chapter]}]};
get_quest(2001) ->
    #quest_data{id = 2001,
		progress =
		    [#quest_progress{label = evt_loss_hallows_essence,
				     target = 0, target_val = 30, param = []}]};
get_quest(2002) ->
    #quest_data{id = 2002,
		progress =
		    [#quest_progress{label = evt_loss_hallows_essence,
				     target = 0, target_val = 60, param = []}]};
get_quest(3001) ->
    #quest_data{id = 3001,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1,
				     param = [{break_lev, 4}]}]};
get_quest(3002) ->
    #quest_data{id = 3002,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 5,
				     param = [{break_lev, 4}]}]};
get_quest(4001) ->
    #quest_data{id = 4001,
		progress =
		    [#quest_progress{label = evt_star_natal_level_up,
				     target = 0, target_val = 1,
				     param = [{lev, 5}]}]};
get_quest(4002) ->
    #quest_data{id = 4002,
		progress =
		    [#quest_progress{label = evt_star_natal_level_up,
				     target = 0, target_val = 1,
				     param = [{lev, 10}]}]};
get_quest(5001) ->
    #quest_data{id = 5001,
		progress =
		    [#quest_progress{label = evt_adventure_explore,
				     target = 0, target_val = 10, param = []}]};
get_quest(5002) ->
    #quest_data{id = 5002,
		progress =
		    [#quest_progress{label = evt_adventure_explore,
				     target = 0, target_val = 20, param = []}]};
get_quest(6001) ->
    #quest_data{id = 6001,
		progress =
		    [#quest_progress{label = evt_stone_all_lv, target = 0,
				     target_val = 30, param = []}]};
get_quest(6002) ->
    #quest_data{id = 6002,
		progress =
		    [#quest_progress{label = evt_stone_all_lv, target = 0,
				     target_val = 40, param = []}]};
get_quest(7001) ->
    #quest_data{id = 7001,
		progress =
		    [#quest_progress{label = evt_loss_gold, target = 0,
				     target_val = 100, param = []}]};
get_quest(7002) ->
    #quest_data{id = 7002,
		progress =
		    [#quest_progress{label = evt_loss_gold, target = 0,
				     target_val = 300, param = []}]};
get_quest(8001) ->
    #quest_data{id = 8001,
		progress =
		    [#quest_progress{label = evt_power, target = 200000,
				     target_val = 1, param = [no_show]}]};
get_quest(8002) ->
    #quest_data{id = 8002,
		progress =
		    [#quest_progress{label = evt_power, target = 250000,
				     target_val = 1, param = [no_show]}]};
get_quest(9001) ->
    #quest_data{id = 9001,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 10, param = []}]};
get_quest(9002) ->
    #quest_data{id = 9002,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 15, param = []}]};
get_quest(10001) ->
    #quest_data{id = 10001,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 15, param = []}]};
get_quest(10002) ->
    #quest_data{id = 10002,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 20, param = []}]};
get_quest(11001) ->
    #quest_data{id = 11001,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 5, param = []}]};
get_quest(11002) ->
    #quest_data{id = 11002,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 10, param = []}]};
get_quest(12001) ->
    #quest_data{id = 12001,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 55,
				     target_val = 1, param = []}]};
get_quest(12002) ->
    #quest_data{id = 12002,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 65,
				     target_val = 1, param = []}]};
get_quest(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_data485, _,
       {__Leveldays_rank_data485, __Tracesdays_rank_data485}}
	  when __Leveldays_rank_data485 band 8 /= 0 orelse
		 __Tracesdays_rank_data485 /= [] ->
	  lager:do_log(error,
		       [{module, days_rank_data}, {function, get_quest},
			{line, 485}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_quest_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Leveldays_rank_data485,
		       __Tracesdays_rank_data485, lager_event,
		       __Piddays_rank_data485);
      _ -> ok
    end,
    undefined.

get_quest_rank_id(1001) -> 1;
get_quest_rank_id(1002) -> 1;
get_quest_rank_id(2001) -> 2;
get_quest_rank_id(2002) -> 2;
get_quest_rank_id(3001) -> 3;
get_quest_rank_id(3002) -> 3;
get_quest_rank_id(4001) -> 4;
get_quest_rank_id(4002) -> 4;
get_quest_rank_id(5001) -> 5;
get_quest_rank_id(5002) -> 5;
get_quest_rank_id(6001) -> 6;
get_quest_rank_id(6002) -> 6;
get_quest_rank_id(7001) -> 7;
get_quest_rank_id(7002) -> 7;
get_quest_rank_id(8001) -> 15;
get_quest_rank_id(8002) -> 15;
get_quest_rank_id(9001) -> 16;
get_quest_rank_id(9002) -> 16;
get_quest_rank_id(10001) -> 17;
get_quest_rank_id(10002) -> 17;
get_quest_rank_id(11001) -> 18;
get_quest_rank_id(11002) -> 18;
get_quest_rank_id(12001) -> 19;
get_quest_rank_id(12002) -> 19;
get_quest_rank_id(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_data511, _,
       {__Leveldays_rank_data511, __Tracesdays_rank_data511}}
	  when __Leveldays_rank_data511 band 8 /= 0 orelse
		 __Tracesdays_rank_data511 /= [] ->
	  lager:do_log(error,
		       [{module, days_rank_data},
			{function, get_quest_rank_id}, {line, 511},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_quest_rank_id_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Leveldays_rank_data511,
		       __Tracesdays_rank_data511, lager_event,
		       __Piddays_rank_data511);
      _ -> ok
    end,
    undefined.

get_quest_ids(19) -> [12001, 12002];
get_quest_ids(18) -> [11001, 11002];
get_quest_ids(17) -> [10001, 10002];
get_quest_ids(16) -> [9001, 9002];
get_quest_ids(15) -> [8001, 8002];
get_quest_ids(7) -> [7001, 7002];
get_quest_ids(6) -> [6001, 6002];
get_quest_ids(5) -> [5001, 5002];
get_quest_ids(4) -> [4001, 4002];
get_quest_ids(3) -> [3001, 3002];
get_quest_ids(2) -> [2001, 2002];
get_quest_ids(1) -> [1001, 1002];
get_quest_ids(_) -> [].

get_quest_rewards(1001) ->
    [{10008, 2}, {10102, 30}, {2, 20000}];
get_quest_rewards(1002) ->
    [{10008, 4}, {10102, 60}, {2, 40000}];
get_quest_rewards(2001) ->
    [{72001, 5}, {11, 100}, {2, 20000}];
get_quest_rewards(2002) ->
    [{72001, 10}, {11, 200}, {2, 40000}];
get_quest_rewards(3001) ->
    [{11, 500}, {10102, 30}, {2, 20000}];
get_quest_rewards(3002) ->
    [{11, 1000}, {10102, 60}, {2, 40000}];
get_quest_rewards(4001) ->
    [{10102, 250}, {10301, 100}, {2, 20000}];
get_quest_rewards(4002) ->
    [{10102, 500}, {10301, 200}, {2, 40000}];
get_quest_rewards(5001) ->
    [{7, 300}, {10102, 30}, {1, 4000}];
get_quest_rewards(5002) ->
    [{7, 600}, {10102, 60}, {1, 8000}];
get_quest_rewards(6001) ->
    [{70003, 10}, {10102, 30}, {1, 4000}];
get_quest_rewards(6002) ->
    [{70003, 15}, {10102, 60}, {1, 8000}];
get_quest_rewards(7001) ->
    [{7, 300}, {10102, 30}, {1, 4000}];
get_quest_rewards(7002) ->
    [{7, 600}, {10102, 60}, {1, 8000}];
get_quest_rewards(8001) ->
    [{11, 500}, {10102, 30}, {2, 20000}];
get_quest_rewards(8002) ->
    [{11, 1000}, {10102, 60}, {2, 40000}];
get_quest_rewards(9001) ->
    [{8, 100}, {10102, 30}, {2, 20000}];
get_quest_rewards(9002) ->
    [{8, 200}, {10102, 60}, {2, 40000}];
get_quest_rewards(10001) ->
    [{10102, 100}, {10301, 100}, {2, 20000}];
get_quest_rewards(10002) ->
    [{10102, 200}, {10301, 200}, {2, 40000}];
get_quest_rewards(11001) ->
    [{7, 300}, {10102, 30}, {1, 4000}];
get_quest_rewards(11002) ->
    [{7, 600}, {10102, 60}, {1, 8000}];
get_quest_rewards(12001) ->
    [{11, 500}, {10102, 30}, {2, 20000}];
get_quest_rewards(12002) ->
    [{11, 1000}, {10102, 60}, {2, 40000}];
get_quest_rewards(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_data551, _,
       {__Leveldays_rank_data551, __Tracesdays_rank_data551}}
	  when __Leveldays_rank_data551 band 8 /= 0 orelse
		 __Tracesdays_rank_data551 /= [] ->
	  lager:do_log(error,
		       [{module, days_rank_data},
			{function, get_quest_rewards}, {line, 551},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_quest_rewards_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Leveldays_rank_data551,
		       __Tracesdays_rank_data551, lager_event,
		       __Piddays_rank_data551);
      _ -> ok
    end,
    undefined.

explore(1) -> 50;
explore(2) -> 75;
explore(3) -> 100;
explore(4) -> 125;
explore(5) -> 150;
explore(6) -> 175;
explore(7) -> 200;
explore(8) -> 225;
explore(9) -> 250;
explore(10) -> 275;
explore(11) -> 300;
explore(12) -> 325;
explore(13) -> 350;
explore(14) -> 375;
explore(15) -> 400;
explore(16) -> 425;
explore(17) -> 450;
explore(18) -> 475;
explore(19) -> 500;
explore(20) -> 525;
explore(21) -> 550;
explore(22) -> 575;
explore(23) -> 600;
explore(24) -> 625;
explore(25) -> 650;
explore(26) -> 675;
explore(27) -> 700;
explore(28) -> 725;
explore(29) -> 750;
explore(30) -> 775;
explore(31) -> 800;
explore(32) -> 825;
explore(33) -> 850;
explore(34) -> 875;
explore(35) -> 900;
explore(36) -> 925;
explore(37) -> 950;
explore(38) -> 975;
explore(39) -> 1000;
explore(40) -> 1025;
explore(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_data593, _,
       {__Leveldays_rank_data593, __Tracesdays_rank_data593}}
	  when __Leveldays_rank_data593 band 8 /= 0 orelse
		 __Tracesdays_rank_data593 /= [] ->
	  lager:do_log(error,
		       [{module, days_rank_data}, {function, explore},
			{line, 593}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("explore_data_not_exist===>~w", [_Info]),
		       none, 4096, 8, __Leveldays_rank_data593,
		       __Tracesdays_rank_data593, lager_event,
		       __Piddays_rank_data593);
      _ -> ok
    end,
    undefined.

reward({1, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"剧情推图"/utf8>>),
      rewards =>
	  [{50101, 1}, {34001, 3}, {10152, 2}, {10008, 100},
	   {2, 300000}],
      subject => lang:get(<<"【剧情推图】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【剧情推图】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({1, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"剧情推图"/utf8>>),
      rewards =>
	  [{34001, 2}, {10152, 2}, {10008, 80}, {2, 200000}],
      subject => lang:get(<<"【剧情推图】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【剧情推图】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({1, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"剧情推图"/utf8>>),
      rewards =>
	  [{34001, 1}, {10152, 1}, {10008, 60}, {2, 100000}],
      subject => lang:get(<<"【剧情推图】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【剧情推图】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({1, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"剧情推图"/utf8>>),
      rewards => [{10152, 1}, {10008, 30}, {2, 80000}],
      subject => lang:get(<<"【剧情推图】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【剧情推图】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({1, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"剧情推图"/utf8>>),
      rewards => [{10151, 2}, {10008, 20}, {2, 50000}],
      subject => lang:get(<<"【剧情推图】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【剧情推图】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({1, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"剧情推图"/utf8>>),
      rewards => [{10151, 1}, {10008, 10}, {2, 20000}],
      subject => lang:get(<<"【剧情推图】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【剧情推图】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({2, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards =>
	  [{50112, 1}, {72003, 3}, {72002, 4}, {72001, 30},
	   {2, 300000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({2, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards =>
	  [{72003, 2}, {72002, 3}, {72001, 20}, {2, 200000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({2, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards =>
	  [{72003, 1}, {72002, 3}, {72001, 10}, {2, 100000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({2, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards => [{72002, 2}, {72001, 5}, {2, 80000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({2, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards => [{72002, 1}, {72001, 5}, {2, 50000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({2, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards => [{72002, 1}, {72001, 3}, {2, 20000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({3, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"最强英雄"/utf8>>),
      rewards =>
	  [{50106, 1}, {30030, 1}, {10412, 3}, {11, 1200},
	   {2, 300000}],
      subject => lang:get(<<"【最强英雄】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强英雄】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({3, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"最强英雄"/utf8>>),
      rewards =>
	  [{30024, 2}, {10412, 3}, {11, 1000}, {2, 200000}],
      subject => lang:get(<<"【最强英雄】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强英雄】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({3, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"最强英雄"/utf8>>),
      rewards =>
	  [{30024, 1}, {10412, 2}, {11, 800}, {2, 100000}],
      subject => lang:get(<<"【最强英雄】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强英雄】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({3, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"最强英雄"/utf8>>),
      rewards => [{10412, 2}, {11, 640}, {2, 80000}],
      subject => lang:get(<<"【最强英雄】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强英雄】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({3, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"最强英雄"/utf8>>),
      rewards => [{10412, 1}, {11, 480}, {2, 50000}],
      subject => lang:get(<<"【最强英雄】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强英雄】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({3, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"最强英雄"/utf8>>),
      rewards => [{10412, 1}, {11, 320}, {2, 20000}],
      subject => lang:get(<<"【最强英雄】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强英雄】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({4, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"星命之耀"/utf8>>),
      rewards =>
	  [{50105, 1}, {30030, 1}, {10102, 1200}, {10301, 600},
	   {2, 300000}],
      subject => lang:get(<<"【星命之耀】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【星命之耀】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({4, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"星命之耀"/utf8>>),
      rewards =>
	  [{30024, 2}, {10102, 1000}, {10301, 500}, {2, 200000}],
      subject => lang:get(<<"【星命之耀】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【星命之耀】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({4, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"星命之耀"/utf8>>),
      rewards =>
	  [{30024, 1}, {10102, 800}, {10301, 400}, {2, 100000}],
      subject => lang:get(<<"【星命之耀】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【星命之耀】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({4, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"星命之耀"/utf8>>),
      rewards => [{10102, 640}, {10301, 320}, {2, 80000}],
      subject => lang:get(<<"【星命之耀】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【星命之耀】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({4, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"星命之耀"/utf8>>),
      rewards => [{10102, 480}, {10301, 240}, {2, 50000}],
      subject => lang:get(<<"【星命之耀】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【星命之耀】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({4, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"星命之耀"/utf8>>),
      rewards => [{10102, 320}, {10301, 160}, {2, 20000}],
      subject => lang:get(<<"【星命之耀】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【星命之耀】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({5, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"神界冒险"/utf8>>),
      rewards =>
	  [{50107, 1}, {10421, 1}, {10996, 3}, {7, 1200},
	   {2, 300000}],
      subject => lang:get(<<"【神界冒险】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【神界冒险】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({5, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"神界冒险"/utf8>>),
      rewards =>
	  [{10420, 2}, {10996, 2}, {7, 1000}, {2, 200000}],
      subject => lang:get(<<"【神界冒险】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【神界冒险】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({5, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"神界冒险"/utf8>>),
      rewards =>
	  [{10420, 1}, {10996, 2}, {7, 800}, {2, 100000}],
      subject => lang:get(<<"【神界冒险】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【神界冒险】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({5, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"神界冒险"/utf8>>),
      rewards => [{10996, 1}, {7, 640}, {2, 80000}],
      subject => lang:get(<<"【神界冒险】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【神界冒险】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({5, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"神界冒险"/utf8>>),
      rewards => [{10995, 2}, {7, 480}, {2, 50000}],
      subject => lang:get(<<"【神界冒险】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【神界冒险】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({5, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"神界冒险"/utf8>>),
      rewards => [{10995, 1}, {7, 320}, {2, 20000}],
      subject => lang:get(<<"【神界冒险】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【神界冒险】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({6, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards =>
	  [{50111, 1}, {35113, 3}, {10030, 10}, {10008, 100},
	   {2, 300000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({6, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards =>
	  [{35113, 2}, {10030, 8}, {10008, 80}, {2, 200000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({6, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards =>
	  [{35113, 1}, {10030, 6}, {10008, 60}, {2, 100000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({6, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards => [{10030, 4}, {10008, 30}, {2, 80000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({6, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards => [{10030, 3}, {10008, 20}, {2, 50000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({6, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards => [{10030, 2}, {10008, 10}, {2, 20000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({7, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards =>
	  [{50117, 1}, {4, 888}, {11, 1200}, {10102, 600},
	   {2, 300000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({7, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards =>
	  [{4, 666}, {11, 1000}, {10102, 500}, {2, 200000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({7, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards =>
	  [{4, 555}, {11, 800}, {10102, 400}, {2, 100000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({7, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards => [{11, 640}, {10102, 320}, {2, 80000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({7, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards => [{11, 480}, {10102, 240}, {2, 50000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({7, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards => [{11, 320}, {10102, 160}, {2, 20000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({15, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"超神阵容"/utf8>>),
      rewards =>
	  [{50104, 1}, {4, 888}, {11, 1200}, {10102, 1200},
	   {2, 300000}],
      subject => lang:get(<<"【超神阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【超神阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({15, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"超神阵容"/utf8>>),
      rewards =>
	  [{4, 666}, {11, 1000}, {10102, 1000}, {2, 200000}],
      subject => lang:get(<<"【超神阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【超神阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({15, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"超神阵容"/utf8>>),
      rewards =>
	  [{4, 555}, {11, 800}, {10102, 800}, {2, 100000}],
      subject => lang:get(<<"【超神阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【超神阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({15, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"超神阵容"/utf8>>),
      rewards => [{11, 640}, {10102, 640}, {2, 80000}],
      subject => lang:get(<<"【超神阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【超神阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({15, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"超神阵容"/utf8>>),
      rewards => [{11, 480}, {10102, 480}, {2, 50000}],
      subject => lang:get(<<"【超神阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【超神阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({15, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"超神阵容"/utf8>>),
      rewards => [{11, 320}, {10102, 320}, {2, 20000}],
      subject => lang:get(<<"【超神阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【超神阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({16, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"武道宗师"/utf8>>),
      rewards =>
	  [{50103, 1}, {10421, 1}, {10030, 10}, {8, 1200},
	   {2, 300000}],
      subject => lang:get(<<"【武道宗师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【武道宗师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({16, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"武道宗师"/utf8>>),
      rewards =>
	  [{10420, 2}, {10030, 8}, {8, 1000}, {2, 200000}],
      subject => lang:get(<<"【武道宗师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【武道宗师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({16, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"武道宗师"/utf8>>),
      rewards =>
	  [{10420, 1}, {10030, 6}, {8, 800}, {2, 100000}],
      subject => lang:get(<<"【武道宗师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【武道宗师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({16, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"武道宗师"/utf8>>),
      rewards => [{10030, 4}, {8, 640}, {2, 80000}],
      subject => lang:get(<<"【武道宗师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【武道宗师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({16, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"武道宗师"/utf8>>),
      rewards => [{10030, 3}, {8, 480}, {2, 50000}],
      subject => lang:get(<<"【武道宗师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【武道宗师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({16, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"武道宗师"/utf8>>),
      rewards => [{10030, 2}, {8, 320}, {2, 20000}],
      subject => lang:get(<<"【武道宗师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【武道宗师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({17, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"爬塔达人"/utf8>>),
      rewards =>
	  [{50102, 1}, {10405, 3}, {13, 50}, {7, 1200},
	   {2, 300000}],
      subject => lang:get(<<"【爬塔达人】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【爬塔达人】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({17, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"爬塔达人"/utf8>>),
      rewards =>
	  [{10405, 2}, {13, 40}, {7, 1000}, {2, 200000}],
      subject => lang:get(<<"【爬塔达人】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【爬塔达人】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({17, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"爬塔达人"/utf8>>),
      rewards =>
	  [{10405, 1}, {13, 30}, {7, 800}, {2, 100000}],
      subject => lang:get(<<"【爬塔达人】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【爬塔达人】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({17, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"爬塔达人"/utf8>>),
      rewards => [{13, 20}, {7, 640}, {2, 80000}],
      subject => lang:get(<<"【爬塔达人】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【爬塔达人】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({17, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"爬塔达人"/utf8>>),
      rewards => [{13, 10}, {7, 480}, {2, 50000}],
      subject => lang:get(<<"【爬塔达人】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【爬塔达人】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({17, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"爬塔达人"/utf8>>),
      rewards => [{13, 5}, {7, 320}, {2, 20000}],
      subject => lang:get(<<"【爬塔达人】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【爬塔达人】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({18, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"寻宝专家"/utf8>>),
      rewards =>
	  [{50108, 1}, {72003, 3}, {13, 50}, {11, 1200},
	   {2, 300000}],
      subject => lang:get(<<"【寻宝专家】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【寻宝专家】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({18, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"寻宝专家"/utf8>>),
      rewards =>
	  [{72003, 2}, {13, 40}, {11, 1000}, {2, 200000}],
      subject => lang:get(<<"【寻宝专家】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【寻宝专家】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({18, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"寻宝专家"/utf8>>),
      rewards =>
	  [{72003, 1}, {13, 30}, {11, 800}, {2, 100000}],
      subject => lang:get(<<"【寻宝专家】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【寻宝专家】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({18, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"寻宝专家"/utf8>>),
      rewards => [{13, 20}, {11, 640}, {2, 80000}],
      subject => lang:get(<<"【寻宝专家】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【寻宝专家】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({18, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"寻宝专家"/utf8>>),
      rewards => [{13, 10}, {11, 480}, {2, 50000}],
      subject => lang:get(<<"【寻宝专家】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【寻宝专家】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({18, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"寻宝专家"/utf8>>),
      rewards => [{13, 5}, {11, 320}, {2, 20000}],
      subject => lang:get(<<"【寻宝专家】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【寻宝专家】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({19, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards =>
	  [{50114, 1}, {10421, 1}, {10030, 10}, {10102, 600},
	   {2, 300000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({19, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards =>
	  [{10420, 2}, {10030, 8}, {10102, 500}, {2, 200000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({19, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards =>
	  [{10420, 1}, {10030, 6}, {10102, 400}, {2, 100000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({19, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards => [{10030, 4}, {10102, 320}, {2, 80000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({19, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards => [{10030, 3}, {10102, 240}, {2, 50000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({19, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards => [{10030, 2}, {10102, 160}, {2, 20000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({8, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards =>
	  [{50111, 1}, {35113, 3}, {10030, 10}, {10008, 100},
	   {2, 300000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({8, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards =>
	  [{35113, 2}, {10030, 8}, {10008, 80}, {2, 200000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({8, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards =>
	  [{35113, 1}, {10030, 6}, {10008, 60}, {2, 100000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({8, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards => [{10030, 4}, {10008, 30}, {2, 80000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({8, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards => [{10030, 3}, {10008, 20}, {2, 50000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({8, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"炫彩宝石"/utf8>>),
      rewards => [{10030, 2}, {10008, 10}, {2, 20000}],
      subject => lang:get(<<"【炫彩宝石】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【炫彩宝石】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({9, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards =>
	  [{50112, 1}, {72003, 3}, {72002, 4}, {72001, 30},
	   {2, 300000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({9, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards =>
	  [{72003, 2}, {72002, 3}, {72001, 20}, {2, 200000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({9, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards =>
	  [{72003, 1}, {72002, 3}, {72001, 10}, {2, 100000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({9, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards => [{72002, 2}, {72001, 5}, {2, 80000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({9, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards => [{72002, 1}, {72001, 5}, {2, 50000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({9, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"圣器比拼"/utf8>>),
      rewards => [{72002, 1}, {72001, 3}, {2, 20000}],
      subject => lang:get(<<"【圣器比拼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【圣器比拼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({10, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"观星大师"/utf8>>),
      rewards =>
	  [{50113, 1}, {30030, 1}, {10412, 3}, {10301, 600},
	   {2, 300000}],
      subject => lang:get(<<"【观星大师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【观星大师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({10, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"观星大师"/utf8>>),
      rewards =>
	  [{30024, 2}, {10412, 3}, {10301, 500}, {2, 200000}],
      subject => lang:get(<<"【观星大师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【观星大师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({10, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"观星大师"/utf8>>),
      rewards =>
	  [{30024, 1}, {10412, 2}, {10301, 400}, {2, 100000}],
      subject => lang:get(<<"【观星大师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【观星大师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({10, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"观星大师"/utf8>>),
      rewards => [{10412, 2}, {10301, 320}, {2, 80000}],
      subject => lang:get(<<"【观星大师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【观星大师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({10, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"观星大师"/utf8>>),
      rewards => [{10412, 1}, {10301, 240}, {2, 50000}],
      subject => lang:get(<<"【观星大师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【观星大师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({10, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"观星大师"/utf8>>),
      rewards => [{10412, 1}, {10301, 160}, {2, 20000}],
      subject => lang:get(<<"【观星大师】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【观星大师】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({11, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards =>
	  [{50114, 1}, {10421, 1}, {10030, 10}, {10102, 600},
	   {2, 300000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({11, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards =>
	  [{10420, 2}, {10030, 8}, {10102, 500}, {2, 200000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({11, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards =>
	  [{10420, 1}, {10030, 6}, {10102, 400}, {2, 100000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({11, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards => [{10030, 4}, {10102, 320}, {2, 80000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({11, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards => [{10030, 3}, {10102, 240}, {2, 50000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({11, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"无尽试炼"/utf8>>),
      rewards => [{10030, 2}, {10102, 160}, {2, 20000}],
      subject => lang:get(<<"【无尽试炼】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【无尽试炼】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({12, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"召唤排行榜"/utf8>>),
      rewards =>
	  [{50115, 1}, {35113, 3}, {13, 50}, {11, 1200},
	   {2, 300000}],
      subject => lang:get(<<"【召唤排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【召唤排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({12, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"召唤排行榜"/utf8>>),
      rewards =>
	  [{35113, 2}, {13, 40}, {11, 1000}, {2, 200000}],
      subject => lang:get(<<"【召唤排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【召唤排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({12, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"召唤排行榜"/utf8>>),
      rewards =>
	  [{35113, 1}, {13, 30}, {11, 800}, {2, 100000}],
      subject => lang:get(<<"【召唤排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【召唤排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({12, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"召唤排行榜"/utf8>>),
      rewards => [{13, 20}, {11, 640}, {2, 80000}],
      subject => lang:get(<<"【召唤排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【召唤排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({12, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"召唤排行榜"/utf8>>),
      rewards => [{13, 10}, {11, 480}, {2, 50000}],
      subject => lang:get(<<"【召唤排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【召唤排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({12, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"召唤排行榜"/utf8>>),
      rewards => [{13, 5}, {11, 320}, {2, 20000}],
      subject => lang:get(<<"【召唤排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【召唤排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({13, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"最强阵容"/utf8>>),
      rewards =>
	  [{50116, 1}, {30030, 1}, {10102, 1200}, {10301, 600},
	   {2, 300000}],
      subject => lang:get(<<"【最强阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({13, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"最强阵容"/utf8>>),
      rewards =>
	  [{30024, 2}, {10102, 1000}, {10301, 500}, {2, 200000}],
      subject => lang:get(<<"【最强阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({13, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"最强阵容"/utf8>>),
      rewards =>
	  [{30024, 1}, {10102, 800}, {10301, 400}, {2, 100000}],
      subject => lang:get(<<"【最强阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({13, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"最强阵容"/utf8>>),
      rewards => [{10102, 640}, {10301, 320}, {2, 80000}],
      subject => lang:get(<<"【最强阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({13, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"最强阵容"/utf8>>),
      rewards => [{10102, 480}, {10301, 240}, {2, 50000}],
      subject => lang:get(<<"【最强阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({13, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"最强阵容"/utf8>>),
      rewards => [{10102, 320}, {10301, 160}, {2, 20000}],
      subject => lang:get(<<"【最强阵容】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【最强阵容】</div>排行中排名第<div fontcolor=#7c08b2>~w"
		     "</div>名，获得了以下奖励："/utf8>>)};
reward({14, Idx}) when Idx >= 1 andalso Idx =< 1 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards =>
	  [{50117, 1}, {4, 888}, {11, 1200}, {10102, 600},
	   {2, 300000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({14, Idx}) when Idx >= 2 andalso Idx =< 2 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards =>
	  [{4, 666}, {11, 1000}, {10102, 500}, {2, 200000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({14, Idx}) when Idx >= 3 andalso Idx =< 3 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards =>
	  [{4, 555}, {11, 800}, {10102, 400}, {2, 100000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({14, Idx}) when Idx >= 4 andalso Idx =< 5 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards => [{11, 640}, {10102, 320}, {2, 80000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({14, Idx}) when Idx >= 6 andalso Idx =< 10 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards => [{11, 480}, {10102, 240}, {2, 50000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward({14, Idx}) when Idx >= 11 andalso Idx =< 20 ->
    #{name => lang:get(<<"消费排行榜"/utf8>>),
      rewards => [{11, 320}, {10102, 160}, {2, 20000}],
      subject => lang:get(<<"【消费排行榜】排行榜结算"/utf8>>),
      content =>
	  lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
		     "2>【消费排行榜】</div>排行中排名第<div fontcolor=#7c08b2>~"
		     "w</div>名，获得了以下奖励："/utf8>>)};
reward(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_data1279, _,
       {__Leveldays_rank_data1279, __Tracesdays_rank_data1279}}
	  when __Leveldays_rank_data1279 band 8 /= 0 orelse
		 __Tracesdays_rank_data1279 /= [] ->
	  lager:do_log(error,
		       [{module, days_rank_data}, {function, reward},
			{line, 1279}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("reward_data_not_exist===>~w", [_Info]),
		       none, 4096, 8, __Leveldays_rank_data1279,
		       __Tracesdays_rank_data1279, lager_event,
		       __Piddays_rank_data1279);
      _ -> ok
    end,
    undefined.


