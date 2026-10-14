-file("src/mod/data/holiday_return_data.erl", 1).

-module(holiday_return_data).

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
		  hide]},
		{holiday_return_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_feat,
		 [ver, quest_list, period, extra, old_data]},
		{m_holiday_return,
		 [ver, period, start_time, end_time, is_buy,
		  exchange_day_list, exchange_buy_list,
		  return_discount_buy_list, bind_code, bind_end_time,
		  bind_roleid, reward_list, old_data, bind_power,
		  bind_charge, partner_half]},
		{m_holiday_return_sign,
		 [ver, status_list, login_day]}]).

-export([get_const/1, period_list/0, get_holiday_day/1,
	 get_charge/1, get_buy_info/1, list/0, get_limit_info/1,
	 get/1, max_day/0, days/0, discount_info/1, get_quest/1,
	 get_quest_by_camp_id/1, get_id/1, get_max_day/1]).

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

-file("src/mod/data/holiday_return_data.erl", 24).

-file("inc/holiday_return.hrl", 1).

-record(m_holiday_return_sign,
	{ver = 2, status_list = [], login_day = 0}).

-record(m_holiday_return,
	{ver = 3, period = 0, start_time = 0, end_time = 0,
	 is_buy = 0, exchange_day_list = [],
	 exchange_buy_list = [], return_discount_buy_list = [],
	 bind_code = 0, bind_end_time = 0,
	 bind_roleid = {0, <<>>}, reward_list = [],
	 old_data = [], bind_power = 0, bind_charge = 0,
	 partner_half = []}).

-record(m_holiday_return_feat,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 period = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(holiday_return_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/data/holiday_return_data.erl", 25).

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

-file("src/mod/data/holiday_return_data.erl", 26).

get_const(privilege_rule) -> 1;
get_const(privilege_desc) -> 1;
get_const(store_rule) -> 1;
get_const(item_id) -> 80120;
get_const(_Info) ->
    logger:data_error("get_const_data_not_exist===>~w",
		      [_Info], holiday_return_data, 31),
    undefined.

period_list() ->
    [{1, {2021, 6, 20, 0, 0, 0}, {2022, 7, 3, 0, 0, 0},
      [{lev, 10}, {open_day, 8}]}].

get_holiday_day(1) -> 14;
get_holiday_day(_Info) ->
    logger:data_error("get_holiday_day_data_not_exist===>~w",
		      [_Info], holiday_return_data, 36),
    undefined.

get_charge(1) ->
    {1101,
     [{10403, 10}, {37001, 2}, {10002, 3}, {1, 1000000}]};
get_charge(_) -> undefined.

get_buy_info(1) -> {[{80120, 1}], [{3, 100}]};
get_buy_info(2) -> {[{80120, 5}], [{10450, 250}]};
get_buy_info(3) -> {[{80120, 5}], [{37001, 5}]};
get_buy_info(4) -> {[{80120, 5}], [{10403, 1}]};
get_buy_info(5) -> {[{80120, 10}], [{38092, 1}]};
get_buy_info(6) -> {[{80120, 10}], [{37002, 2}]};
get_buy_info(7) -> {[{80120, 10}], [{14001, 1}]};
get_buy_info(8) -> {[{80120, 20}], [{10453, 1}]};
get_buy_info(9) -> {[{80120, 20}], [{29905, 50}]};
get_buy_info(10) -> {[{80120, 30}], [{27905, 50}]};
get_buy_info(_Info) ->
    logger:data_error("get_buy_info_data_not_exist===>~w",
		      [_Info], holiday_return_data, 51),
    undefined.

list() -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].

get_limit_info(1) -> {1, 14};
get_limit_info(2) -> {3, 42};
get_limit_info(3) -> {3, 42};
get_limit_info(4) -> {3, 42};
get_limit_info(5) -> {0, 10};
get_limit_info(6) -> {0, 20};
get_limit_info(7) -> {0, 10};
get_limit_info(8) -> {0, 5};
get_limit_info(9) -> {0, 1};
get_limit_info(10) -> {0, 1};
get_limit_info(_Info) ->
    logger:data_error("get_limit_info_data_not_exist===>~w",
		      [_Info], holiday_return_data, 65),
    undefined.

get(1) ->
    #{day => 1, name => lang:get(<<"Ngày 1"/utf8>>),
      rewards => [{10403, 1}, {29905, 5}]};
get(2) ->
    #{day => 2, name => lang:get(<<"Ngày 2"/utf8>>),
      rewards => [{3, 200}, {29905, 5}]};
get(3) ->
    #{day => 3, name => lang:get(<<"Ngày 3"/utf8>>),
      rewards => [{37001, 5}, {29905, 5}]};
get(4) ->
    #{day => 4, name => lang:get(<<"Ngày 4"/utf8>>),
      rewards => [{10403, 1}, {29905, 5}]};
get(5) ->
    #{day => 5, name => lang:get(<<"Ngày 5"/utf8>>),
      rewards => [{10450, 200}, {29905, 10}]};
get(6) ->
    #{day => 6, name => lang:get(<<"Ngày 6"/utf8>>),
      rewards => [{72001, 20}, {29905, 10}]};
get(7) ->
    #{day => 7, name => lang:get(<<"Ngày 7"/utf8>>),
      rewards => [{50908, 1}, {29905, 10}]};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      holiday_return_data, 109),
    undefined.

max_day() -> 7.

days() -> [7, 6, 5, 4, 3, 2, 1].

discount_info({0, 1}) ->
    {1, [{37001, 2}, {10002, 3}, {10001, 100}, {80120, 1}]};
discount_info({1102, 1}) ->
    {3, [{10403, 3}, {72001, 30}, {37001, 2}, {80120, 5}]};
discount_info({1103, 1}) ->
    {3,
     [{10403, 7}, {10450, 500}, {10001, 300}, {80120, 12}]};
discount_info({1104, 1}) ->
    {3,
     [{14001, 2}, {37002, 1}, {1, 1000000}, {80120, 24}]};
discount_info({1105, 1}) ->
    {3, [{29905, 50}, {14001, 2}, {38081, 1}, {80120, 65}]};
discount_info({1106, 1}) ->
    {2,
     [{14001, 5}, {37002, 5}, {1, 5000000}, {80120, 88}]};
discount_info({1107, 1}) ->
    {1,
     [{29906, 50}, {14001, 5}, {38061, 1}, {80120, 128}]};
discount_info(_) -> undefined.

get_quest(1001) ->
    #holiday_return_feat_data{period = 1, id = 1001,
			      f_id = 1, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label = evt_cli_loaded,
						   target = 0, target_val = 1,
						   param = []}],
			      award = [{80120, 1}]};
get_quest(1002) ->
    #holiday_return_feat_data{period = 1, id = 1002,
			      f_id = 2, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label = evt_friend_present,
						   target = 14, target_val = 5,
						   param = []}],
			      award = [{80120, 1}]};
get_quest(1003) ->
    #holiday_return_feat_data{period = 1, id = 1003,
			      f_id = 3, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label = evt_recruit,
						   target = 0, target_val = 3,
						   param = []}],
			      award = [{80120, 2}]};
get_quest(1004) ->
    #holiday_return_feat_data{period = 1, id = 1004,
			      f_id = 4, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label = evt_arena_fight,
						   target = 0, target_val = 3,
						   param = []}],
			      award = [{80120, 2}]};
get_quest(1005) ->
    #holiday_return_feat_data{period = 1, id = 1005,
			      f_id = 5, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label =
						       evt_dungeon_fast_combat,
						   target = 0, target_val = 5,
						   param = []}],
			      award = [{80120, 2}]};
get_quest(1006) ->
    #holiday_return_feat_data{period = 1, id = 1006,
			      f_id = 6, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label = evt_star_tower_pass,
						   target = 0, target_val = 3,
						   param = []}],
			      award = [{80120, 2}]};
get_quest(1007) ->
    #holiday_return_feat_data{period = 1, id = 1007,
			      f_id = 7, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label = evt_endless_fight,
						   target = 0, target_val = 1,
						   param = []}],
			      award = [{80120, 2}]};
get_quest(1008) ->
    #holiday_return_feat_data{period = 1, id = 1008,
			      f_id = 8, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label = evt_shipping,
						   target = 0, target_val = 3,
						   param = []}],
			      award = [{80120, 5}]};
get_quest(1009) ->
    #holiday_return_feat_data{period = 1, id = 1009,
			      f_id = 9, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label =
						       evt_dungeon_stone_fight,
						   target = 0, target_val = 2,
						   param = []}],
			      award = [{80120, 5}]};
get_quest(1010) ->
    #holiday_return_feat_data{period = 1, id = 1010,
			      f_id = 10, s_id = 1, ref_day = 1,
			      progress =
				  [#quest_progress{label = evt_expedition_fight,
						   target = 3, target_val = 1,
						   param = [pass]}],
			      award = [{80120, 5}]};
get_quest(_Info) ->
    logger:data_error("get_quest_data_not_exist===>~w",
		      [_Info], holiday_return_data, 224),
    undefined.

get_quest_by_camp_id(1) ->
    [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009,
     1010];
get_quest_by_camp_id(_) -> [].

get_id({1, 1}) -> 1001;
get_id({2, 1}) -> 1002;
get_id({3, 1}) -> 1003;
get_id({4, 1}) -> 1004;
get_id({5, 1}) -> 1005;
get_id({6, 1}) -> 1006;
get_id({7, 1}) -> 1007;
get_id({8, 1}) -> 1008;
get_id({9, 1}) -> 1009;
get_id({10, 1}) -> 1010;
get_id(_Info) ->
    logger:data_error("get_id_data_not_exist===>~w",
		      [_Info], holiday_return_data, 239),
    undefined.

get_max_day(101) -> 14;
get_max_day(102) -> 14;
get_max_day(103) -> 14;
get_max_day(104) -> 16;
get_max_day(105) -> 14;
get_max_day(_Info) ->
    logger:data_error("get_max_day_data_not_exist===>~w",
		      [_Info], holiday_return_data, 246),
    undefined.


