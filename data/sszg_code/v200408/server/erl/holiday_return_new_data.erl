-file("src/mod/data/holiday_return_new_data.erl", 1).

-module(holiday_return_new_data).

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
		{holiday_return_new_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_new,
		 [ver, period, start_time, end_time, gift_status,
		  sign_list, quest_list, exchange_day_list,
		  exchange_buy_list, free_draw_count, draw_count,
		  draw_info, draw_type_info, must_not, get_red_count,
		  red_packet_info, get_red_info, ext]}]).

-export([get_const/1, period_list/0, get_quest/1,
	 get_quest_by_camp_id/1, get_id/1, get_return_gift/1,
	 get_award_list/1, get_type_award_info/1, max_day/1,
	 get_sign_award/1, red_packet_award/1,
	 red_packet_must_not/1, bless_msg/1, firework_award/1,
	 firework_must_not/1, get_buy_info/1, list/1,
	 get_limit_info/1]).

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

-file("src/mod/data/holiday_return_new_data.erl", 27).

-file("inc/holiday_return_new.hrl", 1).

-record(m_holiday_return_new,
	{ver = 1, period = 0, start_time = 0, end_time = 0,
	 gift_status = 0, sign_list = [], quest_list = [],
	 exchange_day_list = [], exchange_buy_list = [],
	 free_draw_count = 0, draw_count = 0, draw_info = 0,
	 draw_type_info = [], must_not = [], get_red_count = 0,
	 red_packet_info = [], get_red_info = [], ext = []}).

-record(holiday_return_new_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/data/holiday_return_new_data.erl", 28).

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

-file("src/mod/data/holiday_return_new_data.erl", 29).

get_const(free_draw_time) -> 1;
get_const(draw_item_cost) -> [{10416, 100}];
get_const(draw_item_value) -> [{3, 1}];
get_const(red_item_id) -> 10417;
get_const(max_day_get_num) -> 5;
get_const(broadcast_num) -> 30;
get_const(max_get_num) -> 8;
get_const(effect_time) -> 24;
get_const(red_packet_cond) ->
    [{open_day, 17}, {lev, 10}];
get_const(exchange_item_id) -> 10418;
get_const(exchange_item_day_limit_num) -> 100;
get_const(tips_1) -> 1;
get_const(tips_2) -> 2;
get_const(exchange_cond) -> [{open_day, 17}, {lev, 10}];
get_const(arena_team_award) -> [{10418, 5}];
get_const(pk_award) -> [{10418, 10}];
get_const(endless_award) -> [{10418, 20}];
get_const(invade_id) -> 99936;
get_const(defend_id) -> 99937;
get_const(red_item_value) -> [{1, 100000}];
get_const(exchange_item_value) -> [{1, 5000}];
get_const(draw_item_reward_value) -> [{1, 5000}];
get_const(_Info) ->
    logger:data_error("get_const_data_not_exist===>~w",
		      [_Info], holiday_return_new_data, 52),
    undefined.

period_list() ->
    [{1, {2019, 12, 19, 0, 0, 0}, {2022, 1, 1, 23, 59, 59},
      [{prevlogout_day, 16}, {lev, 40}]}].

get_quest(101) ->
    #holiday_return_new_feat_data{period = 1, id = 101,
				  f_id = 101, s_id = 1, ref_day = 1,
				  progress =
				      [#quest_progress{label = evt_visit_home,
						       target = 0,
						       target_val = 1,
						       param = []}],
				  award = [{10417, 1}]};
get_quest(102) ->
    #holiday_return_new_feat_data{period = 1, id = 102,
				  f_id = 102, s_id = 1, ref_day = 1,
				  progress =
				      [#quest_progress{label =
							   evt_get_friend_point,
						       target = 0,
						       target_val = 80,
						       param = []}],
				  award = [{10416, 100}]};
get_quest(103) ->
    #holiday_return_new_feat_data{period = 1, id = 103,
				  f_id = 103, s_id = 1, ref_day = 14,
				  progress =
				      [#quest_progress{label = evt_add_friend,
						       target = 0,
						       target_val = 1,
						       param = []}],
				  award = [{10416, 100}]};
get_quest(104) ->
    #holiday_return_new_feat_data{period = 1, id = 104,
				  f_id = 103, s_id = 2, ref_day = 14,
				  progress =
				      [#quest_progress{label = evt_add_friend,
						       target = 0,
						       target_val = 3,
						       param = []}],
				  award = [{10416, 100}]};
get_quest(105) ->
    #holiday_return_new_feat_data{period = 1, id = 105,
				  f_id = 103, s_id = 3, ref_day = 14,
				  progress =
				      [#quest_progress{label = evt_add_friend,
						       target = 0,
						       target_val = 5,
						       param = []}],
				  award = [{10416, 100}]};
get_quest(106) ->
    #holiday_return_new_feat_data{period = 1, id = 106,
				  f_id = 104, s_id = 1, ref_day = 14,
				  progress =
				      [#quest_progress{label =
							   evt_guild_dun_fight,
						       target = 0,
						       target_val = 1,
						       param = []}],
				  award = [{10416, 100}]};
get_quest(107) ->
    #holiday_return_new_feat_data{period = 1, id = 107,
				  f_id = 105, s_id = 1, ref_day = 14,
				  progress =
				      [#quest_progress{label =
							   evt_guild_secret_area_combat,
						       target = 0,
						       target_val = 1,
						       param = []}],
				  award = [{10416, 100}]};
get_quest(_Info) ->
    logger:data_error("get_quest_data_not_exist===>~w",
		      [_Info], holiday_return_new_data, 126),
    undefined.

get_quest_by_camp_id(1) ->
    [101, 102, 103, 104, 105, 106, 107];
get_quest_by_camp_id(_) -> [].

get_id({101, 1}) -> 101;
get_id({102, 1}) -> 102;
get_id({103, 1}) -> 103;
get_id({103, 2}) -> 104;
get_id({103, 3}) -> 105;
get_id({104, 1}) -> 106;
get_id({105, 1}) -> 107;
get_id(_Info) ->
    logger:data_error("get_id_data_not_exist===>~w",
		      [_Info], holiday_return_new_data, 138),
    undefined.

get_return_gift(1) ->
    [{50917, 1}, {10403, 2}, {10416, 500}, {39059, 1}];
get_return_gift(_Info) ->
    logger:data_error("get_return_gift_data_not_exist===>~w",
		      [_Info], holiday_return_new_data, 141),
    undefined.

get_award_list(1) ->
    [{1, 1, [{72001, 5}], 0, 0, 100, 0},
     {2, 1, [{72001, 5}], 0, 0, 100, 0},
     {3, 1, [{72001, 5}], 0, 0, 100, 0},
     {4, 1, [{72001, 5}], 0, 0, 100, 0},
     {5, 1, [{72001, 5}], 0, 0, 100, 0},
     {6, 1, [{72001, 5}], 0, 0, 100, 0},
     {7, 1, [{72001, 5}], 0, 0, 100, 0},
     {8, 1, [{72001, 5}], 0, 0, 100, 0},
     {9, 1, [{72001, 5}], 0, 0, 100, 0},
     {10, 1, [{72001, 5}], 0, 0, 100, 0},
     {11, 1, [{72001, 5}], 0, 0, 100, 0},
     {12, 1, [{72001, 5}], 0, 0, 100, 0},
     {13, 1, [{72001, 5}], 0, 0, 100, 0},
     {14, 1, [{72001, 5}], 0, 0, 100, 0},
     {15, 1, [{72001, 5}], 0, 0, 100, 0},
     {16, 2, [{10040, 5}], 0, 0, 100, 0},
     {17, 2, [{10040, 5}], 0, 0, 100, 0},
     {18, 2, [{10040, 5}], 0, 0, 100, 0},
     {19, 2, [{10040, 5}], 0, 0, 100, 0},
     {20, 2, [{10040, 5}], 0, 0, 100, 0},
     {21, 3, [{28, 10}], 0, 0, 100, 0},
     {22, 3, [{28, 10}], 0, 0, 100, 0},
     {23, 3, [{28, 10}], 0, 0, 100, 0},
     {24, 3, [{28, 10}], 0, 0, 100, 0},
     {25, 3, [{28, 10}], 0, 0, 100, 0},
     {26, 3, [{28, 10}], 0, 0, 100, 0},
     {27, 3, [{28, 10}], 0, 0, 100, 0},
     {28, 3, [{28, 10}], 0, 0, 100, 0},
     {29, 3, [{28, 10}], 0, 0, 100, 0},
     {30, 3, [{28, 10}], 0, 0, 100, 0},
     {31, 3, [{28, 10}], 0, 0, 100, 0},
     {32, 3, [{28, 10}], 0, 0, 100, 0},
     {33, 3, [{28, 10}], 0, 0, 100, 0},
     {34, 3, [{28, 10}], 0, 0, 100, 0},
     {35, 3, [{28, 10}], 0, 0, 100, 0},
     {36, 3, [{28, 10}], 0, 0, 100, 0},
     {37, 3, [{28, 10}], 0, 0, 100, 0},
     {38, 3, [{28, 10}], 0, 0, 100, 0},
     {39, 3, [{28, 10}], 0, 0, 100, 0},
     {40, 4, [{10450, 100}], 0, 0, 100, 0},
     {41, 4, [{10450, 100}], 0, 0, 100, 0},
     {42, 4, [{10450, 100}], 0, 0, 100, 0},
     {43, 4, [{10450, 100}], 0, 0, 100, 0},
     {44, 4, [{10450, 100}], 0, 0, 100, 0},
     {45, 4, [{10450, 100}], 0, 0, 100, 0},
     {46, 4, [{10450, 100}], 0, 0, 100, 0},
     {47, 4, [{10450, 100}], 0, 0, 100, 0},
     {48, 4, [{10450, 100}], 0, 0, 100, 0},
     {49, 4, [{10450, 100}], 0, 0, 100, 0},
     {50, 4, [{10450, 100}], 0, 0, 100, 0},
     {51, 4, [{10450, 100}], 0, 0, 100, 0},
     {52, 4, [{10450, 100}], 0, 0, 100, 0},
     {53, 4, [{10450, 100}], 0, 0, 100, 0},
     {54, 4, [{10450, 100}], 0, 0, 100, 0},
     {55, 4, [{10450, 100}], 0, 0, 100, 0},
     {56, 4, [{10450, 100}], 0, 0, 100, 0},
     {57, 4, [{10450, 100}], 0, 0, 100, 0},
     {58, 4, [{10450, 100}], 0, 0, 100, 0},
     {59, 4, [{10450, 100}], 0, 0, 100, 0},
     {60, 4, [{10450, 100}], 0, 0, 100, 0},
     {61, 4, [{10450, 100}], 0, 0, 100, 0},
     {62, 4, [{10450, 100}], 0, 0, 100, 0},
     {63, 4, [{10450, 100}], 0, 0, 100, 0},
     {64, 4, [{10450, 100}], 0, 0, 100, 0},
     {65, 4, [{10450, 100}], 0, 0, 100, 0},
     {66, 4, [{10450, 100}], 0, 0, 100, 0},
     {67, 4, [{10450, 100}], 0, 0, 100, 0},
     {68, 4, [{10450, 100}], 0, 0, 100, 0},
     {69, 4, [{10450, 100}], 0, 0, 100, 0},
     {70, 5, [{35, 1}], 62, 0, 100, 0},
     {71, 5, [{35, 1}], 40, 0, 100, 0},
     {72, 5, [{35, 1}], 0, 0, 100, 0},
     {73, 5, [{35, 1}], 91, 0, 100, 0},
     {74, 5, [{35, 1}], 0, 18, 100, 0},
     {75, 6, [{10602, 1}], 0, 0, 100, 0},
     {76, 6, [{10602, 1}], 15, 0, 100, 0},
     {77, 7, [{29905, 5}], 0, 0, 100, 1},
     {78, 7, [{29905, 5}], 0, 0, 100, 1},
     {79, 7, [{29905, 5}], 81, 0, 100, 1},
     {80, 7, [{29905, 5}], 0, 0, 100, 1},
     {81, 7, [{29905, 5}], 0, 0, 100, 1},
     {82, 7, [{29905, 5}], 30, 0, 100, 1},
     {83, 7, [{29905, 5}], 0, 0, 100, 1},
     {84, 7, [{29905, 5}], 70, 0, 100, 1},
     {85, 7, [{29905, 5}], 0, 0, 100, 1},
     {86, 7, [{29905, 5}], 0, 10, 100, 1},
     {87, 8, [{10403, 1}], 0, 0, 100, 1},
     {88, 8, [{10403, 1}], 0, 0, 100, 1},
     {89, 8, [{10403, 1}], 60, 0, 100, 1},
     {90, 8, [{10403, 1}], 61, 0, 100, 1},
     {91, 8, [{10403, 1}], 90, 0, 100, 1},
     {92, 8, [{10403, 1}], 0, 0, 100, 1},
     {93, 8, [{10403, 1}], 0, 0, 100, 1},
     {94, 8, [{10403, 1}], 0, 0, 100, 1},
     {95, 8, [{10403, 1}], 0, 0, 100, 1},
     {96, 8, [{10403, 1}], 0, 0, 100, 1},
     {97, 9, [{14001, 1}], 0, 28, 100, 1},
     {98, 9, [{14001, 1}], 50, 0, 100, 1},
     {99, 9, [{14001, 1}], 0, 0, 100, 1},
     {100, 10, [{39060, 1}], 80, 0, 100, 1}];
get_award_list(_) -> [].

get_type_award_info({1, 10}) -> [1];
get_type_award_info({1, 9}) -> [1];
get_type_award_info({1, 8}) -> [1];
get_type_award_info({1, 7}) -> [1];
get_type_award_info({1, 6}) -> [0];
get_type_award_info({1, 5}) -> [0];
get_type_award_info({1, 4}) -> [0];
get_type_award_info({1, 3}) -> [0];
get_type_award_info({1, 2}) -> [0];
get_type_award_info({1, 1}) -> [0];
get_type_award_info(_) -> [].

max_day(1) -> [1, 2, 3, 4, 5, 6, 7];
max_day(_) -> [].

get_sign_award({1, 1}) -> [{10416, 100}, {10417, 1}];
get_sign_award({1, 2}) -> [{10416, 100}, {10417, 1}];
get_sign_award({1, 3}) -> [{10416, 100}, {10417, 1}];
get_sign_award({1, 4}) -> [{10416, 100}, {10417, 1}];
get_sign_award({1, 5}) -> [{10416, 100}, {10417, 1}];
get_sign_award({1, 6}) -> [{10416, 100}, {10417, 1}];
get_sign_award({1, 7}) -> [{10416, 100}, {10417, 1}];
get_sign_award(_) -> [].

red_packet_award(1) ->
    [{1, [{10418, 10}], 100, 0}, {2, [{10418, 15}], 200, 0},
     {3, [{10418, 20}], 600, 0}, {4, [{10418, 30}], 100, 1}];
red_packet_award(_) -> [].

red_packet_must_not({1, 1}) -> 0;
red_packet_must_not({1, 2}) -> 0;
red_packet_must_not({1, 3}) -> 0;
red_packet_must_not({1, 4}) -> 1;
red_packet_must_not(_) -> 0.

bless_msg(1) ->
    [{1, 125, lang:get(<<"大吉大利！"/utf8>>)},
     {2, 125, lang:get(<<"以神灵之力，予你红包之礼"/utf8>>)},
     {3, 125, lang:get(<<"愿你开心每一天"/utf8>>)},
     {4, 125, lang:get(<<"致以最诚挚的祝福"/utf8>>)},
     {5, 125, lang:get(<<"最美的礼物送给最美的你"/utf8>>)},
     {6, 125, lang:get(<<"红包运气看颜值！"/utf8>>)},
     {7, 125, lang:get(<<"送给星空下最亮的崽"/utf8>>)},
     {8, 125, lang:get(<<"小小红包，以表心意"/utf8>>)}];
bless_msg(_) -> [].

firework_award(_) -> [].

firework_must_not(_) -> 0.

get_buy_info({1, 1}) -> {[{10418, 300}], [{14001, 1}]};
get_buy_info({1, 2}) -> {[{10418, 60}], [{10403, 1}]};
get_buy_info({1, 3}) -> {[{10418, 100}], [{10602, 1}]};
get_buy_info({1, 4}) -> {[{10418, 50}], [{10450, 100}]};
get_buy_info({1, 5}) -> {[{10418, 50}], [{10040, 5}]};
get_buy_info({1, 6}) -> {[{10418, 10}], [{1, 50000}]};
get_buy_info({1, 7}) -> {[{10418, 10}], [{22, 10000}]};
get_buy_info(_Info) ->
    logger:data_error("get_buy_info_data_not_exist===>~w",
		      [_Info], holiday_return_new_data, 195),
    undefined.

list(1) -> [1, 2, 3, 4, 5, 6, 7];
list(_) -> [].

get_limit_info({1, 1}) -> {0, 1};
get_limit_info({1, 2}) -> {0, 3};
get_limit_info({1, 3}) -> {0, 1};
get_limit_info({1, 4}) -> {0, 10};
get_limit_info({1, 5}) -> {0, 10};
get_limit_info({1, 6}) -> {0, 99};
get_limit_info({1, 7}) -> {0, 99};
get_limit_info(_Info) ->
    logger:data_error("get_limit_info_data_not_exist===>~w",
		      [_Info], holiday_return_new_data, 207),
    undefined.


