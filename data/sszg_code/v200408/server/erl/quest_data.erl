-file("data/quest_data.erl", 1).

-file("src/mod/data/quest_data.erl", 1).

-module(quest_data).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{quest_stats, [type, stats, desc]},
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
		  hide]},
		{condition, [label, op, val, msg]}]).

-export([list/0, lev_list/1, lev_classes_list/1,
	 type_list/1, get/1, type_name/1, group/1, phase_list/0,
	 get_phase/1, dungeon_quest/1]).

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

-file("src/mod/data/quest_data.erl", 23).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/data/quest_data.erl", 24).

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

-file("src/mod/data/quest_data.erl", 25).

-file("inc/gain.hrl", 1).

-record(gain,
	{label  :: atom(), val  :: term(),
	 msg = <<>>  :: bitstring(), flag  :: atom(),
	 reason  :: atom(), ext = 0  :: term(),
	 notice = 0  :: 0..1,
	 move_to = 0  :: non_neg_integer()}).

-record(loss,
	{label  :: atom(), val  :: term(),
	 own_val = 0  :: term(), msg = <<>>  :: bitstring(),
	 flag  :: atom(), reason  :: atom(),
	 ext = 0  :: term()}).

-record(gain_loss_opts,
	{title = <<>>, return_gl = [], is_continue = false,
	 order = loss  :: gain | loss,
	 gain_tag = <<>>  :: binary(),
	 loss_tag = <<>>  :: binary(),
	 split_str = <<"，"/utf8>>  :: binary(),
	 split_op_str = <<"，"/utf8>>  :: binary(),
	 type = 2  :: non_neg_integer(),
	 is_auto_buy = 0  :: 0..1,
	 need_notify_fail_item = false  :: true | false,
	 log_name = <<"市场"/utf8>>  :: true | false}).

-file("src/mod/data/quest_data.erl", 26).

-spec list() -> [integer()].

list() ->
    [90000, 90001, 90003, 90005, 90007, 90012, 90013, 90014,
     90018, 90020, 90023, 90024, 90025].

-spec lev_list(integer()) -> [integer()].

lev_list(70) -> [90025];
lev_list(30) -> [90024];
lev_list(15) -> [90023];
lev_list(25) -> [90018];
lev_list(6) -> [90012, 90013, 90014, 90020];
lev_list(8) -> [90005];
lev_list(1) -> [90003, 90007];
lev_list(5) -> [90001];
lev_list(3) -> [90000];
lev_list(_Lev) -> [].

-spec lev_classes_list({integer(),
			integer()}) -> [integer()].

lev_classes_list({70, 0}) -> [90025];
lev_classes_list({30, 0}) -> [90024];
lev_classes_list({15, 0}) -> [90023];
lev_classes_list({25, 0}) -> [90018];
lev_classes_list({6, 0}) ->
    [90012, 90013, 90014, 90020];
lev_classes_list({8, 0}) -> [90005];
lev_classes_list({1, 0}) -> [90003, 90007];
lev_classes_list({5, 0}) -> [90001];
lev_classes_list({3, 0}) -> [90000];
lev_classes_list({_Lev, _Classes}) -> [].

type_list(3) ->
    [90000, 90001, 90003, 90005, 90007, 90012, 90013, 90014,
     90018, 90020, 90023, 90024, 90025];
type_list(_) -> [].

-spec group(integer()) -> [integer()].

group(0) ->
    [90000, 90001, 90003, 90005, 90007, 90012, 90013, 90014,
     90018, 90020, 90023, 90024, 90025];
group(_Lev) -> [].

-spec get(integer()) -> {error, data_not_exists} |
			#quest_data{}.

get(90000) ->
    #quest_data{id = 90000,
		name = lang:get(<<"日常登录"/utf8>>), career = 0, lev = 3,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_cli_loaded, target = 0,
				     target_val = 1, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {3, 20},
		     {9, 15}]};
get(90001) ->
    #quest_data{id = 90001,
		name = lang:get(<<"好友赠送"/utf8>>), career = 0, lev = 5,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_friend_present,
				     target = 14, target_val = 5, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {14, 100},
		     {9, 15}]};
get(90003) ->
    #quest_data{id = 90003, name = lang:get(<<"召唤"/utf8>>),
		career = 0, lev = 1, type = 3, group = 0, layer = 0,
		val_from_prev = 0, auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_recruit, target = 0,
				     target_val = 3, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {3, 20},
		     {9, 15}]};
get(90005) ->
    #quest_data{id = 90005, name = lang:get(<<"竞技场"/utf8>>),
		career = 0, lev = 8, type = 3, group = 0, layer = 0,
		val_from_prev = 0, auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 3, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {10103, 2},
		     {9, 15}]};
get(90007) ->
    #quest_data{id = 90007,
		name = lang:get(<<"快速作战"/utf8>>), career = 0, lev = 1,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_dungeon_fast_combat,
				     target = 0, target_val = 5, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {3, 30},
		     {9, 15}]};
get(90012) ->
    #quest_data{id = 90012,
		name = lang:get(<<"试练塔挑战"/utf8>>), career = 0, lev = 6,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 3, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {10001, 20},
		     {9, 15}]};
get(90013) ->
    #quest_data{id = 90013,
		name = lang:get(<<"公会Boss"/utf8>>), career = 0, lev = 6,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 3, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {10, 50},
		     {9, 15}]};
get(90014) ->
    #quest_data{id = 90014,
		name = lang:get(<<"公会捐献"/utf8>>), career = 0, lev = 6,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_guild_donate, target = 0,
				     target_val = 1, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {1, 40000},
		     {9, 15}]};
get(90018) ->
    #quest_data{id = 90018,
		name = lang:get(<<"无尽试炼"/utf8>>), career = 0, lev = 25,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_endless_fight, target = 0,
				     target_val = 1, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {37001, 1},
		     {9, 15}]};
get(90020) ->
    #quest_data{id = 90020,
		name = lang:get(<<"悬赏任务"/utf8>>), career = 0, lev = 6,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 3, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {1, 40000},
		     {9, 15}]};
get(90023) ->
    #quest_data{id = 90023,
		name = lang:get(<<"神器副本"/utf8>>), career = 0, lev = 15,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 2, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {37001, 1},
		     {9, 15}]};
get(90024) ->
    #quest_data{id = 90024,
		name = lang:get(<<"装备合成"/utf8>>), career = 0, lev = 30,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_equipment_compound,
				     target = 0, target_val = 1, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {1, 30000},
		     {9, 15}]};
get(90025) ->
    #quest_data{id = 90025,
		name = lang:get(<<"家园拜访"/utf8>>), career = 0, lev = 70,
		type = 3, group = 0, layer = 0, val_from_prev = 0,
		auto_accept = 1, commit_type = 1,
		progress =
		    [#quest_progress{label = evt_worship, target = 5,
				     target_val = 3, param = []}],
		commit_rewards =
		    [{10001, 5000}, {10090, 5}, {10091, 5}, {22, 1000000},
		     {1, 2000000}, {3, 10000}, {39052, 10}, {1, 30000},
		     {9, 15}]};
get(_Id) -> {error, data_not_exists}.

phase_list() -> [].

get_phase(_Phase) -> undefined.

type_name(1) -> lang:get(<<"主线任务"/utf8>>);
type_name(2) -> lang:get(<<"支线任务"/utf8>>);
type_name(3) -> lang:get(<<"日常任务"/utf8>>);
type_name(4) -> lang:get(<<"战令每日任务"/utf8>>);
type_name(5) -> lang:get(<<"战令每周任务"/utf8>>);
type_name(6) -> lang:get(<<"战令周期任务"/utf8>>);
type_name(7) -> lang:get(<<"新战令每日任务"/utf8>>);
type_name(8) -> lang:get(<<"新战令每周任务"/utf8>>);
type_name(9) -> lang:get(<<"ios评分任务"/utf8>>);
type_name(_) -> <<>>.

dungeon_quest(val_not_exist) ->
    [90000, 90001, 90003, 90005, 90007, 90012, 90013, 90014,
     90018, 90020, 90023, 90024, 90025];
dungeon_quest(_) -> [].


