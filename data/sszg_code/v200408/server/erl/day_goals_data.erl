-file("src/mod/data/day_goals_data.erl", 1).

-module(day_goals_data).

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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{grow_data,
		 [ver, day, goal_id, status, condition, lev, progress,
		  target_type]},
		{m_day_goals,
		 [ver, end_time, num, welfare_list, grow_list,
		  price_list, finish_list, period, charge, old_data,
		  period_day, new_grow_list, lev_reward, old_data2]}]).

-export([get_welfare_list/1, get_grow_list/1,
	 get_price_list/1, get_finish_list/1,
	 get_welfare_condition/1, get_award1/1, get_award2/1,
	 get_award3/1, get_const/1, get_grow/1,
	 get_grow_data/1]).

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

-file("src/mod/data/day_goals_data.erl", 20).

-file("inc/day_goals.hrl", 1).

-record(m_day_goals,
	{ver = 3, end_time = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 welfare_list = []  :: list(), grow_list = []  :: list(),
	 price_list = []  :: list(), finish_list = []  :: list(),
	 period = 1  :: list(), charge = 0  :: list(),
	 old_data = [], period_day = 0, new_grow_list = [],
	 lev_reward = [], old_data2 = []}).

-record(grow_data,
	{ver = 2, day = 0  :: non_neg_integer(),
	 goal_id = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 target_type = 1  :: non_neg_integer()}).

-file("src/mod/data/day_goals_data.erl", 21).

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

-file("src/mod/data/day_goals_data.erl", 22).

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

-file("src/mod/data/day_goals_data.erl", 23).

get_welfare_list(7) ->
    [{1, 27000, [{login, 1}], undefined},
     {2, 37000, [{login, 2}], undefined},
     {3, 47000, [{login, 3}], undefined},
     {4, 57000, [{login, 4}], undefined},
     {5, 67000, [{login, 5}], undefined},
     {6, 77000, [{login, 6}], undefined},
     {7, 87000, [{login, 7}], undefined},
     {1, 27001, [{charge_rmb, 100}], undefined},
     {2, 37001, [{charge_rmb, 200}], undefined},
     {3, 47001, [{charge_rmb, 500}], undefined},
     {4, 57001, [{charge_rmb, 1000}], undefined},
     {5, 67001, [{charge_rmb, 2000}], undefined},
     {6, 77001, [{charge_rmb, 3000}], undefined},
     {7, 87001, [{charge_rmb, 5000}], undefined}];
get_welfare_list(4) ->
    [{1, 23000, [{login, 1}], undefined},
     {2, 33000, [{login, 2}], undefined},
     {3, 43000, [{login, 3}], undefined},
     {4, 53000, [{login, 4}], undefined},
     {5, 63000, [{login, 5}], undefined},
     {6, 73000, [{login, 6}], undefined},
     {7, 83000, [{login, 7}], undefined},
     {1, 23001, [{charge_rmb, 100}], undefined},
     {2, 33001, [{charge_rmb, 200}], undefined},
     {3, 43001, [{charge_rmb, 500}], undefined},
     {4, 53001, [{charge_rmb, 1000}], undefined},
     {5, 63001, [{charge_rmb, 2000}], undefined},
     {6, 73001, [{charge_rmb, 3000}], undefined},
     {7, 83001, [{charge_rmb, 5000}], undefined}];
get_welfare_list(1) ->
    [{1, 20000, [{login, 1}], undefined},
     {2, 30000, [{login, 2}], undefined},
     {3, 40000, [{login, 3}], undefined},
     {4, 50000, [{login, 4}], undefined},
     {5, 60000, [{login, 5}], undefined},
     {6, 70000, [{login, 6}], undefined},
     {7, 80000, [{login, 7}], undefined},
     {1, 20001, [{charge_rmb, 100}], undefined},
     {2, 30001, [{charge_rmb, 200}], undefined},
     {3, 40001, [{charge_rmb, 500}], {'<', 1576166410}},
     {3, 40011, [{charge_rmb, 500}], {'<', 1579492800}},
     {3, 40021, [{charge_rmb, 500}], {'>=', 1579492800}},
     {4, 50001, [{charge_rmb, 1000}], undefined},
     {5, 60001, [{charge_rmb, 2000}], undefined},
     {6, 70001, [{charge_rmb, 3000}], undefined},
     {7, 80001, [{charge_rmb, 5000}], undefined}];
get_welfare_list(_) -> [].

get_grow_list(7) ->
    [{1, 71010, 1}, {1, 71020, 1}, {1, 71030, 1},
     {1, 71040, 1}, {1, 71050, 1}, {1, 71060, 1},
     {1, 72010, 1}, {1, 72020, 1}, {1, 72030, 1},
     {1, 72040, 1}, {1, 72050, 1}, {1, 72060, 1},
     {2, 73010, 1}, {2, 73020, 1}, {2, 73030, 1},
     {2, 73040, 1}, {2, 73050, 1}, {2, 73060, 1},
     {2, 74010, 1}, {2, 74020, 1}, {2, 74030, 1},
     {2, 74040, 1}, {2, 74050, 1}, {2, 74060, 1},
     {3, 74310, 1}, {3, 74320, 1}, {3, 74330, 1},
     {3, 74340, 1}, {3, 74350, 1}, {3, 74360, 1},
     {3, 74110, 1}, {3, 74120, 1}, {3, 74130, 1},
     {3, 74140, 1}, {3, 74150, 1}, {3, 74160, 1},
     {4, 76010, 1}, {4, 76020, 1}, {4, 76030, 1},
     {4, 76040, 1}, {4, 76050, 1}, {4, 76060, 1},
     {4, 76110, 1}, {4, 76120, 1}, {4, 76130, 1},
     {4, 76140, 1}, {4, 76150, 1}, {4, 76160, 1},
     {5, 77010, 1}, {5, 77020, 1}, {5, 77030, 1},
     {5, 77040, 1}, {5, 77050, 1}, {5, 77060, 1},
     {5, 78010, 1}, {5, 78020, 1}, {5, 78030, 1},
     {5, 78040, 1}, {5, 78050, 1}, {5, 78060, 1},
     {6, 79010, 1}, {6, 79020, 1}, {6, 79030, 1},
     {6, 79040, 1}, {6, 79050, 1}, {6, 79060, 1},
     {6, 79110, 1}, {6, 79120, 1}, {6, 79130, 1},
     {6, 79140, 1}, {6, 79150, 1}, {6, 79160, 1},
     {7, 74210, 1}, {7, 74220, 1}, {7, 74230, 1},
     {7, 74240, 1}, {7, 74250, 1}, {7, 74260, 1},
     {7, 79210, 1}, {7, 79220, 1}, {7, 79230, 1},
     {7, 79240, 1}, {7, 79250, 1}, {7, 79260, 1}];
get_grow_list(4) ->
    [{1, 41010, 1}, {1, 41020, 1}, {1, 41030, 1},
     {1, 41040, 1}, {1, 41050, 1}, {1, 41060, 1},
     {1, 42010, 1}, {1, 42020, 1}, {1, 42030, 1},
     {1, 42040, 1}, {1, 42050, 1}, {1, 42060, 1},
     {2, 43010, 1}, {2, 43020, 1}, {2, 43030, 1},
     {2, 43040, 1}, {2, 43050, 1}, {2, 43060, 1},
     {2, 44010, 1}, {2, 44020, 1}, {2, 44030, 1},
     {2, 44040, 1}, {2, 44050, 1}, {2, 44060, 1},
     {3, 44310, 1}, {3, 44320, 1}, {3, 44330, 1},
     {3, 44340, 1}, {3, 44350, 1}, {3, 44360, 1},
     {3, 44110, 1}, {3, 44120, 1}, {3, 44130, 1},
     {3, 44140, 1}, {3, 44150, 1}, {3, 44160, 1},
     {4, 46010, 1}, {4, 46020, 1}, {4, 46030, 1},
     {4, 46040, 1}, {4, 46050, 1}, {4, 46060, 1},
     {4, 46110, 1}, {4, 46120, 1}, {4, 46130, 1},
     {4, 46140, 1}, {4, 46150, 1}, {4, 46160, 1},
     {5, 47010, 1}, {5, 47020, 1}, {5, 47030, 1},
     {5, 47040, 1}, {5, 47050, 1}, {5, 47060, 1},
     {5, 48010, 1}, {5, 48020, 1}, {5, 48030, 1},
     {5, 48040, 1}, {5, 48050, 1}, {5, 48060, 1},
     {6, 49010, 1}, {6, 49020, 1}, {6, 49030, 1},
     {6, 49040, 1}, {6, 49050, 1}, {6, 49060, 1},
     {6, 49110, 1}, {6, 49120, 1}, {6, 49130, 1},
     {6, 49140, 1}, {6, 49150, 1}, {6, 49160, 1},
     {7, 44210, 1}, {7, 44220, 1}, {7, 44230, 1},
     {7, 44240, 1}, {7, 44250, 1}, {7, 44260, 1},
     {7, 49210, 1}, {7, 49220, 1}, {7, 49230, 1},
     {7, 49240, 1}, {7, 49250, 1}, {7, 49260, 1}];
get_grow_list(1) ->
    [{1, 11010, 1}, {1, 11020, 1}, {1, 11030, 1},
     {1, 11040, 1}, {1, 11050, 1}, {1, 11060, 1},
     {1, 12010, 1}, {1, 12020, 1}, {1, 12030, 1},
     {1, 12040, 1}, {1, 12050, 1}, {1, 12060, 1},
     {2, 13010, 1}, {2, 13020, 1}, {2, 13030, 1},
     {2, 13040, 1}, {2, 13050, 1}, {2, 13060, 1},
     {2, 14010, 1}, {2, 14020, 1}, {2, 14030, 1},
     {2, 14040, 1}, {2, 14050, 1}, {2, 14060, 1},
     {3, 15010, 1}, {3, 15020, 1}, {3, 15030, 1},
     {3, 15040, 1}, {3, 15050, 1}, {3, 15060, 1},
     {3, 14110, 1}, {3, 14120, 1}, {3, 14130, 1},
     {3, 14140, 1}, {3, 14150, 1}, {3, 14160, 1},
     {4, 16010, 1}, {4, 16020, 1}, {4, 16030, 1},
     {4, 16040, 1}, {4, 16050, 1}, {4, 16060, 1},
     {4, 16110, 1}, {4, 16120, 1}, {4, 16130, 1},
     {4, 16140, 1}, {4, 16150, 1}, {4, 16160, 1},
     {5, 17010, 1}, {5, 17020, 1}, {5, 17030, 1},
     {5, 17040, 1}, {5, 17050, 1}, {5, 17060, 1},
     {5, 18010, 1}, {5, 18020, 1}, {5, 18030, 1},
     {5, 18040, 1}, {5, 18050, 1}, {5, 18060, 1},
     {6, 19010, 1}, {6, 19020, 1}, {6, 19030, 1},
     {6, 19040, 1}, {6, 19050, 1}, {6, 19060, 1},
     {6, 19110, 1}, {6, 19120, 1}, {6, 19130, 1},
     {6, 19140, 1}, {6, 19150, 1}, {6, 19160, 1},
     {7, 14310, 1}, {7, 14320, 1}, {7, 14330, 1},
     {7, 14340, 1}, {7, 14350, 1}, {7, 14360, 1},
     {7, 19210, 1}, {7, 19220, 1}, {7, 19230, 1},
     {7, 19240, 1}, {7, 19250, 1}, {7, 19260, 1}];
get_grow_list(_) -> [].

get_price_list(7) ->
    [701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711,
     712, 713, 714, 715, 716, 717, 718, 719, 720, 721];
get_price_list(4) ->
    [301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311,
     312, 313, 314, 315, 316, 317, 318, 319, 320, 321];
get_price_list(1) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
     17, 18, 19, 20, 21];
get_price_list(_) -> [].

get_finish_list(7) ->
    [{107, 20, [{10403, 1}]}, {207, 50, [{10403, 1}]},
     {307, 70, [{37002, 1}]}, {407, 100, [{3, 2000}]}];
get_finish_list(4) ->
    [{103, 20, [{10403, 1}]}, {203, 50, [{10403, 2}]},
     {303, 70, [{37002, 1}]}, {403, 100, [{3, 2000}]}];
get_finish_list(1) ->
    [{1, 20, [{10002, 5}]}, {2, 50, [{10403, 1}]},
     {3, 70, [{37002, 2}]}, {4, 100, [{3, 3000}]}];
get_finish_list(_) -> [].

get_welfare_condition(20000) -> [{login, 1}];
get_welfare_condition(30000) -> [{login, 2}];
get_welfare_condition(40000) -> [{login, 3}];
get_welfare_condition(50000) -> [{login, 4}];
get_welfare_condition(60000) -> [{login, 5}];
get_welfare_condition(70000) -> [{login, 6}];
get_welfare_condition(80000) -> [{login, 7}];
get_welfare_condition(20001) -> [{charge_rmb, 100}];
get_welfare_condition(30001) -> [{charge_rmb, 200}];
get_welfare_condition(40001) -> [{charge_rmb, 500}];
get_welfare_condition(40011) -> [{charge_rmb, 500}];
get_welfare_condition(40021) -> [{charge_rmb, 500}];
get_welfare_condition(50001) -> [{charge_rmb, 1000}];
get_welfare_condition(60001) -> [{charge_rmb, 2000}];
get_welfare_condition(70001) -> [{charge_rmb, 3000}];
get_welfare_condition(80001) -> [{charge_rmb, 5000}];
get_welfare_condition(23000) -> [{login, 1}];
get_welfare_condition(33000) -> [{login, 2}];
get_welfare_condition(43000) -> [{login, 3}];
get_welfare_condition(53000) -> [{login, 4}];
get_welfare_condition(63000) -> [{login, 5}];
get_welfare_condition(73000) -> [{login, 6}];
get_welfare_condition(83000) -> [{login, 7}];
get_welfare_condition(23001) -> [{charge_rmb, 100}];
get_welfare_condition(33001) -> [{charge_rmb, 200}];
get_welfare_condition(43001) -> [{charge_rmb, 500}];
get_welfare_condition(53001) -> [{charge_rmb, 1000}];
get_welfare_condition(63001) -> [{charge_rmb, 2000}];
get_welfare_condition(73001) -> [{charge_rmb, 3000}];
get_welfare_condition(83001) -> [{charge_rmb, 5000}];
get_welfare_condition(27000) -> [{login, 1}];
get_welfare_condition(37000) -> [{login, 2}];
get_welfare_condition(47000) -> [{login, 3}];
get_welfare_condition(57000) -> [{login, 4}];
get_welfare_condition(67000) -> [{login, 5}];
get_welfare_condition(77000) -> [{login, 6}];
get_welfare_condition(87000) -> [{login, 7}];
get_welfare_condition(27001) -> [{charge_rmb, 100}];
get_welfare_condition(37001) -> [{charge_rmb, 200}];
get_welfare_condition(47001) -> [{charge_rmb, 500}];
get_welfare_condition(57001) -> [{charge_rmb, 1000}];
get_welfare_condition(67001) -> [{charge_rmb, 2000}];
get_welfare_condition(77001) -> [{charge_rmb, 3000}];
get_welfare_condition(87001) -> [{charge_rmb, 5000}];
get_welfare_condition(_) -> undefined.

get_award1(20000) -> {1, [{3, 100}, {10001, 100}]};
get_award1(30000) -> {2, [{3, 150}, {10403, 1}]};
get_award1(40000) -> {3, [{3, 200}, {10103, 5}]};
get_award1(50000) -> {4, [{3, 250}, {10002, 1}]};
get_award1(60000) -> {5, [{3, 300}, {40108, 1}]};
get_award1(70000) -> {6, [{3, 350}, {37001, 5}]};
get_award1(80000) -> {7, [{3, 400}, {27306, 1}]};
get_award1(20001) -> {1, [{3, 500}, {10001, 500}]};
get_award1(30001) -> {2, [{3, 1000}, {10450, 1000}]};
get_award1(40001) -> {3, [{3, 1500}, {37002, 1}]};
get_award1(40011) -> {3, [{3, 1500}, {26907, 50}]};
get_award1(40021) -> {3, [{3, 1500}, {37002, 1}]};
get_award1(50001) -> {4, [{3, 2000}, {14001, 1}]};
get_award1(60001) -> {5, [{3, 5000}, {10450, 5000}]};
get_award1(70001) -> {6, [{3, 7000}, {14002, 500}]};
get_award1(80001) -> {7, [{3, 15000}, {27906, 50}]};
get_award1(23000) -> {1, [{3, 100}, {10001, 100}]};
get_award1(33000) -> {2, [{3, 150}, {10403, 1}]};
get_award1(43000) -> {3, [{3, 200}, {10103, 5}]};
get_award1(53000) -> {4, [{3, 250}, {10002, 5}]};
get_award1(63000) -> {5, [{3, 300}, {40108, 1}]};
get_award1(73000) -> {6, [{3, 350}, {37001, 5}]};
get_award1(83000) -> {7, [{3, 400}, {14001, 1}]};
get_award1(23001) -> {1, [{3, 500}, {10001, 500}]};
get_award1(33001) -> {2, [{3, 1000}, {10403, 3}]};
get_award1(43001) -> {3, [{3, 1500}, {37002, 1}]};
get_award1(53001) -> {4, [{3, 2000}, {14001, 1}]};
get_award1(63001) -> {5, [{3, 5000}, {10450, 5000}]};
get_award1(73001) -> {6, [{3, 7000}, {38051, 1}]};
get_award1(83001) -> {7, [{3, 15000}, {28903, 50}]};
get_award1(27000) -> {1, [{3, 100}, {10450, 100}]};
get_award1(37000) -> {2, [{3, 100}, {10002, 5}]};
get_award1(47000) -> {3, [{3, 100}, {37001, 5}]};
get_award1(57000) -> {4, [{3, 100}, {10403, 1}]};
get_award1(67000) -> {5, [{3, 100}, {38080, 1}]};
get_award1(77000) -> {6, [{3, 100}, {38081, 1}]};
get_award1(87000) -> {7, [{3, 100}, {37002, 1}]};
get_award1(27001) -> {1, [{3, 200}, {10450, 500}]};
get_award1(37001) -> {2, [{3, 400}, {10403, 3}]};
get_award1(47001) -> {3, [{3, 1000}, {37002, 1}]};
get_award1(57001) -> {4, [{3, 2000}, {14001, 1}]};
get_award1(67001) -> {5, [{3, 3000}, {10450, 5000}]};
get_award1(77001) -> {6, [{3, 5000}, {38061, 1}]};
get_award1(87001) -> {7, [{3, 8000}, {27905, 50}]};
get_award1(11010) -> {1, [{1, 20000}, {10001, 30}]};
get_award1(11020) -> {1, [{1, 30000}, {10001, 30}]};
get_award1(11030) -> {1, [{1, 50000}, {10001, 30}]};
get_award1(11040) -> {1, [{1, 80000}, {10001, 50}]};
get_award1(11050) -> {1, [{1, 100000}, {10001, 50}]};
get_award1(11060) -> {1, [{1, 100000}, {10001, 100}]};
get_award1(12010) -> {1, [{1, 20000}, {26700, 20}]};
get_award1(12020) -> {1, [{1, 30000}, {26701, 20}]};
get_award1(12030) -> {1, [{1, 50000}, {26702, 20}]};
get_award1(12040) -> {1, [{1, 80000}, {26703, 20}]};
get_award1(12050) -> {1, [{1, 100000}, {26704, 20}]};
get_award1(12060) -> {1, [{1, 100000}, {26704, 40}]};
get_award1(13010) -> {2, [{1, 20000}, {10103, 2}]};
get_award1(13020) -> {2, [{1, 30000}, {10103, 2}]};
get_award1(13030) -> {2, [{1, 50000}, {10451, 1}]};
get_award1(13040) -> {2, [{1, 80000}, {10103, 2}]};
get_award1(13050) -> {2, [{1, 100000}, {10103, 2}]};
get_award1(13060) -> {2, [{1, 100000}, {10452, 1}]};
get_award1(14010) -> {2, [{1, 20000}, {10001, 50}]};
get_award1(14020) -> {2, [{1, 30000}, {10450, 80}]};
get_award1(14030) -> {2, [{1, 50000}, {10001, 80}]};
get_award1(14040) -> {2, [{1, 80000}, {10450, 100}]};
get_award1(14050) -> {2, [{1, 100000}, {10001, 150}]};
get_award1(14060) -> {2, [{1, 100000}, {10450, 200}]};
get_award1(15010) -> {3, [{1, 20000}, {10103, 2}]};
get_award1(15020) -> {3, [{1, 30000}, {37001, 1}]};
get_award1(15030) -> {3, [{1, 50000}, {10103, 3}]};
get_award1(15040) -> {3, [{1, 80000}, {37001, 2}]};
get_award1(15050) -> {3, [{1, 100000}, {10103, 5}]};
get_award1(15060) -> {3, [{1, 100000}, {37001, 2}]};
get_award1(14110) -> {3, [{1, 20000}, {10002, 2}]};
get_award1(14120) -> {3, [{1, 30000}, {10002, 3}]};
get_award1(14130) -> {3, [{1, 50000}, {10002, 4}]};
get_award1(14140) -> {3, [{1, 80000}, {10002, 5}]};
get_award1(14150) -> {3, [{1, 100000}, {10002, 6}]};
get_award1(14160) -> {3, [{1, 100000}, {10002, 8}]};
get_award1(16010) -> {4, [{1, 20000}, {10002, 2}]};
get_award1(16020) -> {4, [{1, 30000}, {10002, 2}]};
get_award1(16030) -> {4, [{1, 50000}, {10002, 2}]};
get_award1(16040) -> {4, [{1, 80000}, {10002, 4}]};
get_award1(16050) -> {4, [{1, 100000}, {10002, 4}]};
get_award1(16060) -> {4, [{1, 100000}, {10002, 4}]};
get_award1(16110) -> {4, [{1, 20000}, {72001, 5}]};
get_award1(16120) -> {4, [{1, 30000}, {72001, 10}]};
get_award1(16130) -> {4, [{1, 50000}, {72001, 10}]};
get_award1(16140) -> {4, [{1, 80000}, {72001, 10}]};
get_award1(16150) -> {4, [{1, 100000}, {72001, 15}]};
get_award1(16160) -> {4, [{1, 100000}, {72001, 15}]};
get_award1(17010) -> {5, [{1, 20000}, {72001, 10}]};
get_award1(17020) -> {5, [{1, 30000}, {72001, 10}]};
get_award1(17030) -> {5, [{1, 50000}, {72001, 15}]};
get_award1(17040) -> {5, [{1, 80000}, {72001, 15}]};
get_award1(17050) -> {5, [{1, 100000}, {29904, 10}]};
get_award1(17060) -> {5, [{1, 100000}, {29904, 10}]};
get_award1(18010) -> {5, [{1, 20000}, {29904, 5}]};
get_award1(18020) -> {5, [{1, 30000}, {29904, 5}]};
get_award1(18030) -> {5, [{1, 50000}, {29904, 10}]};
get_award1(18040) -> {5, [{1, 80000}, {29904, 10}]};
get_award1(18050) -> {5, [{1, 100000}, {29904, 15}]};
get_award1(18060) -> {5, [{1, 100000}, {29904, 15}]};
get_award1(19010) -> {6, [{1, 20000}, {37001, 2}]};
get_award1(19020) -> {6, [{1, 30000}, {37001, 2}]};
get_award1(19030) -> {6, [{1, 50000}, {37001, 2}]};
get_award1(19040) -> {6, [{1, 80000}, {37001, 3}]};
get_award1(19050) -> {6, [{1, 100000}, {37001, 3}]};
get_award1(19060) -> {6, [{1, 100000}, {37001, 3}]};
get_award1(19110) -> {6, [{1, 20000}, {37001, 1}]};
get_award1(19120) -> {6, [{1, 30000}, {10401, 3}]};
get_award1(19130) -> {6, [{1, 50000}, {37001, 2}]};
get_award1(19140) -> {6, [{1, 80000}, {10401, 3}]};
get_award1(19150) -> {6, [{1, 100000}, {10403, 1}]};
get_award1(19160) -> {6, [{1, 100000}, {10403, 2}]};
get_award1(14310) -> {7, [{1, 20000}, {14002, 10}]};
get_award1(14320) -> {7, [{1, 30000}, {14002, 10}]};
get_award1(14330) -> {7, [{1, 50000}, {14002, 15}]};
get_award1(14340) -> {7, [{1, 80000}, {14002, 15}]};
get_award1(14350) -> {7, [{1, 100000}, {14002, 20}]};
get_award1(14360) -> {7, [{1, 100000}, {14002, 20}]};
get_award1(19210) -> {7, [{1, 20000}, {29904, 5}]};
get_award1(19220) -> {7, [{1, 30000}, {29904, 5}]};
get_award1(19230) -> {7, [{1, 50000}, {14002, 10}]};
get_award1(19240) -> {7, [{1, 80000}, {29904, 10}]};
get_award1(19250) -> {7, [{1, 100000}, {14002, 20}]};
get_award1(19260) -> {7, [{1, 100000}, {14002, 20}]};
get_award1(41010) -> {1, [{1, 20000}, {3, 50}]};
get_award1(41020) -> {1, [{1, 30000}, {3, 50}]};
get_award1(41030) -> {1, [{1, 50000}, {3, 50}]};
get_award1(41040) -> {1, [{1, 80000}, {3, 50}]};
get_award1(41050) -> {1, [{1, 100000}, {3, 50}]};
get_award1(41060) -> {1, [{1, 100000}, {3, 50}]};
get_award1(42010) -> {1, [{1, 20000}, {26905, 1}]};
get_award1(42020) -> {1, [{1, 30000}, {26905, 1}]};
get_award1(42030) -> {1, [{1, 50000}, {26905, 1}]};
get_award1(42040) -> {1, [{1, 80000}, {26905, 1}]};
get_award1(42050) -> {1, [{1, 100000}, {26905, 2}]};
get_award1(42060) -> {1, [{1, 100000}, {26905, 2}]};
get_award1(43010) -> {2, [{1, 20000}, {3, 50}]};
get_award1(43020) -> {2, [{1, 30000}, {3, 50}]};
get_award1(43030) -> {2, [{1, 50000}, {3, 50}]};
get_award1(43040) -> {2, [{1, 80000}, {3, 50}]};
get_award1(43050) -> {2, [{1, 100000}, {3, 50}]};
get_award1(43060) -> {2, [{1, 100000}, {3, 50}]};
get_award1(44010) -> {2, [{1, 20000}, {26905, 1}]};
get_award1(44020) -> {2, [{1, 30000}, {26905, 1}]};
get_award1(44030) -> {2, [{1, 50000}, {26905, 1}]};
get_award1(44040) -> {2, [{1, 80000}, {26905, 1}]};
get_award1(44050) -> {2, [{1, 100000}, {26905, 1}]};
get_award1(44060) -> {2, [{1, 100000}, {26905, 2}]};
get_award1(44310) -> {3, [{1, 20000}, {3, 50}]};
get_award1(44320) -> {3, [{1, 30000}, {3, 50}]};
get_award1(44330) -> {3, [{1, 50000}, {3, 50}]};
get_award1(44340) -> {3, [{1, 80000}, {3, 50}]};
get_award1(44350) -> {3, [{1, 100000}, {3, 50}]};
get_award1(44360) -> {3, [{1, 100000}, {3, 50}]};
get_award1(44110) -> {3, [{1, 20000}, {26905, 1}]};
get_award1(44120) -> {3, [{1, 30000}, {26905, 1}]};
get_award1(44130) -> {3, [{1, 50000}, {26905, 1}]};
get_award1(44140) -> {3, [{1, 80000}, {26905, 1}]};
get_award1(44150) -> {3, [{1, 100000}, {26905, 1}]};
get_award1(44160) -> {3, [{1, 100000}, {26905, 2}]};
get_award1(46010) -> {4, [{1, 20000}, {3, 50}]};
get_award1(46020) -> {4, [{1, 30000}, {3, 50}]};
get_award1(46030) -> {4, [{1, 50000}, {3, 50}]};
get_award1(46040) -> {4, [{1, 80000}, {3, 50}]};
get_award1(46050) -> {4, [{1, 100000}, {3, 50}]};
get_award1(46060) -> {4, [{1, 100000}, {3, 50}]};
get_award1(46110) -> {4, [{1, 20000}, {26905, 1}]};
get_award1(46120) -> {4, [{1, 30000}, {26905, 1}]};
get_award1(46130) -> {4, [{1, 50000}, {26905, 1}]};
get_award1(46140) -> {4, [{1, 80000}, {26905, 1}]};
get_award1(46150) -> {4, [{1, 100000}, {26905, 1}]};
get_award1(46160) -> {4, [{1, 100000}, {26905, 2}]};
get_award1(47010) -> {5, [{1, 20000}, {3, 50}]};
get_award1(47020) -> {5, [{1, 30000}, {3, 50}]};
get_award1(47030) -> {5, [{1, 50000}, {3, 50}]};
get_award1(47040) -> {5, [{1, 80000}, {3, 50}]};
get_award1(47050) -> {5, [{1, 100000}, {3, 50}]};
get_award1(47060) -> {5, [{1, 100000}, {3, 50}]};
get_award1(48010) -> {5, [{1, 20000}, {26905, 1}]};
get_award1(48020) -> {5, [{1, 30000}, {26905, 1}]};
get_award1(48030) -> {5, [{1, 50000}, {26905, 1}]};
get_award1(48040) -> {5, [{1, 80000}, {26905, 1}]};
get_award1(48050) -> {5, [{1, 100000}, {26905, 1}]};
get_award1(48060) -> {5, [{1, 100000}, {26905, 2}]};
get_award1(49010) -> {6, [{1, 20000}, {3, 50}]};
get_award1(49020) -> {6, [{1, 30000}, {3, 50}]};
get_award1(49030) -> {6, [{1, 50000}, {3, 50}]};
get_award1(49040) -> {6, [{1, 80000}, {3, 50}]};
get_award1(49050) -> {6, [{1, 100000}, {3, 50}]};
get_award1(49060) -> {6, [{1, 100000}, {3, 50}]};
get_award1(49110) -> {6, [{1, 20000}, {26905, 1}]};
get_award1(49120) -> {6, [{1, 30000}, {26905, 1}]};
get_award1(49130) -> {6, [{1, 50000}, {26905, 1}]};
get_award1(49140) -> {6, [{1, 80000}, {26905, 1}]};
get_award1(49150) -> {6, [{1, 100000}, {26905, 1}]};
get_award1(49160) -> {6, [{1, 100000}, {26905, 2}]};
get_award1(44210) -> {7, [{1, 20000}, {3, 50}]};
get_award1(44220) -> {7, [{1, 30000}, {3, 50}]};
get_award1(44230) -> {7, [{1, 50000}, {3, 50}]};
get_award1(44240) -> {7, [{1, 80000}, {3, 50}]};
get_award1(44250) -> {7, [{1, 100000}, {3, 50}]};
get_award1(44260) -> {7, [{1, 100000}, {3, 50}]};
get_award1(49210) -> {7, [{1, 20000}, {26905, 1}]};
get_award1(49220) -> {7, [{1, 30000}, {26905, 1}]};
get_award1(49230) -> {7, [{1, 50000}, {26905, 1}]};
get_award1(49240) -> {7, [{1, 80000}, {26905, 1}]};
get_award1(49250) -> {7, [{1, 100000}, {26905, 1}]};
get_award1(49260) -> {7, [{1, 100000}, {26905, 2}]};
get_award1(71010) -> {1, [{1, 10000}, {3, 50}]};
get_award1(71020) -> {1, [{1, 20000}, {3, 50}]};
get_award1(71030) -> {1, [{1, 30000}, {3, 50}]};
get_award1(71040) -> {1, [{1, 40000}, {3, 50}]};
get_award1(71050) -> {1, [{1, 50000}, {3, 50}]};
get_award1(71060) -> {1, [{1, 60000}, {3, 50}]};
get_award1(72010) -> {1, [{1, 10000}, {26900, 1}]};
get_award1(72020) -> {1, [{1, 20000}, {26900, 1}]};
get_award1(72030) -> {1, [{1, 30000}, {26900, 1}]};
get_award1(72040) -> {1, [{1, 40000}, {26900, 1}]};
get_award1(72050) -> {1, [{1, 50000}, {26900, 2}]};
get_award1(72060) -> {1, [{1, 60000}, {26900, 2}]};
get_award1(73010) -> {2, [{1, 10000}, {3, 50}]};
get_award1(73020) -> {2, [{1, 20000}, {3, 50}]};
get_award1(73030) -> {2, [{1, 30000}, {3, 50}]};
get_award1(73040) -> {2, [{1, 40000}, {3, 50}]};
get_award1(73050) -> {2, [{1, 50000}, {3, 50}]};
get_award1(73060) -> {2, [{1, 60000}, {3, 50}]};
get_award1(74010) -> {2, [{1, 10000}, {26900, 1}]};
get_award1(74020) -> {2, [{1, 20000}, {26900, 1}]};
get_award1(74030) -> {2, [{1, 30000}, {26900, 1}]};
get_award1(74040) -> {2, [{1, 40000}, {26900, 1}]};
get_award1(74050) -> {2, [{1, 50000}, {26900, 1}]};
get_award1(74060) -> {2, [{1, 60000}, {26900, 2}]};
get_award1(74310) -> {3, [{1, 10000}, {3, 50}]};
get_award1(74320) -> {3, [{1, 20000}, {3, 50}]};
get_award1(74330) -> {3, [{1, 30000}, {3, 50}]};
get_award1(74340) -> {3, [{1, 40000}, {3, 50}]};
get_award1(74350) -> {3, [{1, 50000}, {3, 50}]};
get_award1(74360) -> {3, [{1, 60000}, {3, 50}]};
get_award1(74110) -> {3, [{1, 10000}, {26900, 1}]};
get_award1(74120) -> {3, [{1, 20000}, {26900, 1}]};
get_award1(74130) -> {3, [{1, 30000}, {26900, 1}]};
get_award1(74140) -> {3, [{1, 40000}, {26900, 1}]};
get_award1(74150) -> {3, [{1, 50000}, {26900, 1}]};
get_award1(74160) -> {3, [{1, 60000}, {26900, 2}]};
get_award1(76010) -> {4, [{1, 10000}, {3, 50}]};
get_award1(76020) -> {4, [{1, 20000}, {3, 50}]};
get_award1(76030) -> {4, [{1, 30000}, {3, 50}]};
get_award1(76040) -> {4, [{1, 40000}, {3, 50}]};
get_award1(76050) -> {4, [{1, 50000}, {3, 50}]};
get_award1(76060) -> {4, [{1, 60000}, {3, 50}]};
get_award1(76110) -> {4, [{1, 10000}, {26900, 1}]};
get_award1(76120) -> {4, [{1, 20000}, {26900, 1}]};
get_award1(76130) -> {4, [{1, 30000}, {26900, 1}]};
get_award1(76140) -> {4, [{1, 40000}, {26900, 1}]};
get_award1(76150) -> {4, [{1, 50000}, {26900, 1}]};
get_award1(76160) -> {4, [{1, 60000}, {26900, 2}]};
get_award1(77010) -> {5, [{1, 10000}, {3, 50}]};
get_award1(77020) -> {5, [{1, 20000}, {3, 50}]};
get_award1(77030) -> {5, [{1, 30000}, {3, 50}]};
get_award1(77040) -> {5, [{1, 40000}, {3, 50}]};
get_award1(77050) -> {5, [{1, 50000}, {3, 50}]};
get_award1(77060) -> {5, [{1, 60000}, {3, 50}]};
get_award1(78010) -> {5, [{1, 10000}, {26900, 1}]};
get_award1(78020) -> {5, [{1, 20000}, {26900, 1}]};
get_award1(78030) -> {5, [{1, 30000}, {26900, 1}]};
get_award1(78040) -> {5, [{1, 40000}, {26900, 1}]};
get_award1(78050) -> {5, [{1, 50000}, {26900, 1}]};
get_award1(78060) -> {5, [{1, 60000}, {26900, 2}]};
get_award1(79010) -> {6, [{1, 10000}, {3, 50}]};
get_award1(79020) -> {6, [{1, 20000}, {3, 50}]};
get_award1(79030) -> {6, [{1, 30000}, {3, 50}]};
get_award1(79040) -> {6, [{1, 40000}, {3, 50}]};
get_award1(79050) -> {6, [{1, 50000}, {3, 50}]};
get_award1(79060) -> {6, [{1, 60000}, {3, 50}]};
get_award1(79110) -> {6, [{1, 10000}, {26900, 1}]};
get_award1(79120) -> {6, [{1, 20000}, {26900, 1}]};
get_award1(79130) -> {6, [{1, 30000}, {26900, 1}]};
get_award1(79140) -> {6, [{1, 40000}, {26900, 1}]};
get_award1(79150) -> {6, [{1, 50000}, {26900, 1}]};
get_award1(79160) -> {6, [{1, 60000}, {26900, 2}]};
get_award1(74210) -> {7, [{1, 10000}, {3, 50}]};
get_award1(74220) -> {7, [{1, 20000}, {3, 50}]};
get_award1(74230) -> {7, [{1, 30000}, {3, 50}]};
get_award1(74240) -> {7, [{1, 40000}, {3, 50}]};
get_award1(74250) -> {7, [{1, 50000}, {3, 50}]};
get_award1(74260) -> {7, [{1, 60000}, {3, 50}]};
get_award1(79210) -> {7, [{1, 10000}, {26900, 1}]};
get_award1(79220) -> {7, [{1, 20000}, {26900, 1}]};
get_award1(79230) -> {7, [{1, 30000}, {26900, 1}]};
get_award1(79240) -> {7, [{1, 40000}, {26900, 1}]};
get_award1(79250) -> {7, [{1, 50000}, {26900, 1}]};
get_award1(79260) -> {7, [{1, 60000}, {26900, 2}]};
get_award1(_) -> {0, []}.

get_award2(1) -> {1, 0, 0, [{10001, 20}]};
get_award2(2) -> {2, 0, 0, [{10103, 1}]};
get_award2(3) -> {3, 0, 0, [{10002, 1}]};
get_award2(4) -> {4, 0, 0, [{25, 50}]};
get_award2(5) -> {5, 0, 0, [{37001, 1}]};
get_award2(6) -> {6, 0, 0, [{1, 50000}]};
get_award2(7) -> {7, 0, 0, [{10401, 1}]};
get_award2(8) -> {1, 0, 300, [{26801, 30}]};
get_award2(9) -> {2, 0, 500, [{10403, 4}]};
get_award2(10) -> {3, 0, 300, [{29904, 30}]};
get_award2(11) -> {4, 0, 300, [{10002, 20}]};
get_award2(12) -> {5, 0, 1000, [{72001, 150}]};
get_award2(13) -> {6, 0, 1000, [{37001, 40}]};
get_award2(14) -> {7, 0, 2500, [{27304, 1}]};
get_award2(15) -> {1, 1, 150, [{10001, 300}]};
get_award2(16) -> {2, 2, 3000, [{29105, 50}]};
get_award2(17) -> {3, 3, 2000, [{72002, 40}]};
get_award2(18) -> {4, 4, 1250, [{10403, 10}]};
get_award2(19) -> {5, 4, 2500, [{10453, 1}]};
get_award2(20) -> {6, 5, 2500, [{37002, 5}]};
get_award2(21) -> {7, 6, 5000, [{28903, 50}]};
get_award2(301) -> {1, 0, 0, [{10001, 100}]};
get_award2(302) -> {2, 0, 0, [{10103, 2}]};
get_award2(303) -> {3, 0, 0, [{10, 250}]};
get_award2(304) -> {4, 0, 0, [{10002, 2}]};
get_award2(305) -> {5, 0, 0, [{37001, 2}]};
get_award2(306) -> {6, 0, 0, [{10450, 100}]};
get_award2(307) -> {7, 0, 0, [{10403, 1}]};
get_award2(308) -> {1, 0, 150, [{10450, 300}]};
get_award2(309) -> {2, 0, 500, [{10403, 4}]};
get_award2(310) -> {3, 0, 500, [{10, 2500}]};
get_award2(311) -> {4, 0, 300, [{10002, 20}]};
get_award2(312) -> {5, 0, 1125, [{72001, 150}]};
get_award2(313) -> {6, 0, 1000, [{37001, 40}]};
get_award2(314) -> {7, 0, 2500, [{29305, 50}]};
get_award2(315) -> {1, 1, 250, [{10450, 500}]};
get_award2(316) -> {2, 2, 3000, [{29205, 50}]};
get_award2(317) -> {3, 3, 1500, [{72001, 200}]};
get_award2(318) -> {4, 4, 1250, [{10403, 10}]};
get_award2(319) -> {5, 4, 2500, [{10453, 1}]};
get_award2(320) -> {6, 5, 2500, [{37002, 5}]};
get_award2(321) -> {7, 6, 5000, [{28901, 50}]};
get_award2(701) -> {1, 0, 0, [{10001, 50}]};
get_award2(702) -> {2, 0, 0, [{10103, 2}]};
get_award2(703) -> {3, 0, 0, [{10, 200}]};
get_award2(704) -> {4, 0, 0, [{10002, 2}]};
get_award2(705) -> {5, 0, 0, [{37001, 1}]};
get_award2(706) -> {6, 0, 0, [{10450, 100}]};
get_award2(707) -> {7, 0, 0, [{10403, 1}]};
get_award2(708) -> {1, 0, 150, [{10450, 300}]};
get_award2(709) -> {2, 0, 450, [{72001, 50}]};
get_award2(710) -> {3, 0, 300, [{10001, 500}]};
get_award2(711) -> {4, 0, 600, [{10450, 1000}]};
get_award2(712) -> {5, 0, 750, [{10403, 5}]};
get_award2(713) -> {6, 0, 1200, [{37001, 40}]};
get_award2(714) -> {7, 0, 3000, [{29305, 50}]};
get_award2(715) -> {1, 1, 250, [{10450, 500}]};
get_award2(716) -> {2, 2, 3000, [{29905, 50}]};
get_award2(717) -> {3, 3, 1350, [{72001, 150}]};
get_award2(718) -> {4, 4, 1500, [{10403, 10}]};
get_award2(719) -> {5, 4, 2500, [{10453, 1}]};
get_award2(720) -> {6, 5, 2500, [{37002, 5}]};
get_award2(721) -> {7, 5, 3000, [{29105, 50}]};
get_award2(_Info) ->
    logger:data_error("get_award2_data_not_exist===>~w",
		      [_Info], day_goals_data, 451),
    undefined.

get_award3(1) -> {20, [{10002, 5}]};
get_award3(2) -> {50, [{10403, 1}]};
get_award3(3) -> {70, [{37002, 2}]};
get_award3(4) -> {100, [{3, 3000}]};
get_award3(103) -> {20, [{10403, 1}]};
get_award3(203) -> {50, [{10403, 2}]};
get_award3(303) -> {70, [{37002, 1}]};
get_award3(403) -> {100, [{3, 2000}]};
get_award3(107) -> {20, [{10403, 1}]};
get_award3(207) -> {50, [{10403, 1}]};
get_award3(307) -> {70, [{37002, 1}]};
get_award3(407) -> {100, [{3, 2000}]};
get_award3(_Info) ->
    logger:data_error("get_award3_data_not_exist===>~w",
		      [_Info], day_goals_data, 465),
    undefined.

get_const(over_time) -> 7;
get_const(task_total) -> 119;
get_const(rule_desc) -> 1;
get_const(day_item) ->
    {10001, 10403, 8, 10002, 25, 37001, 40307};
get_const(day_item1) ->
    {10152, 17, 25, 10002, 10403, 37002, 40105};
get_const(day_item2) ->
    {8, 17, 25, 10002, 40106, 17, 10450};
get_const(day_item3) ->
    {40112, 17, 10403, 10002, 9, 37001, 72001};
get_const(limit_day_goals_charge_date) ->
    {{2021, 8, 2}, {9, 59, 0}};
get_const(_Info) ->
    logger:data_error("get_const_data_not_exist===>~w",
		      [_Info], day_goals_data, 475),
    undefined.

get_grow(7) ->
    [#grow_data{goal_id = 71010, day = 1,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 71020, day = 1,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 71030, day = 1,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 40, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 71040, day = 1,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 60, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 71050, day = 1,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 80, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 71060, day = 1,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 100, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 72010, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 72020, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 72030, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 72040, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 72050, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 72060, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 32, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 73010, day = 2,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 73020, day = 2,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 73030, day = 2,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 73040, day = 2,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 40, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 73050, day = 2,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 50, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 73060, day = 2,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 60, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74010, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 1, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74020, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74030, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74040, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74050, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74060, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74310, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 2, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74320, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74330, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74340, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74350, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74360, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74110, day = 3,
		progress =
		    [#quest_progress{label = evt_artifact_compose_quality,
				     target = 0, target_val = 1, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74120, day = 3,
		progress =
		    [#quest_progress{label = evt_artifact_compose_quality,
				     target = 0, target_val = 3, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74130, day = 3,
		progress =
		    [#quest_progress{label = evt_artifact_compose_quality,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74140, day = 3,
		progress =
		    [#quest_progress{label = evt_artifact_compose_quality,
				     target = 0, target_val = 7, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74150, day = 3,
		progress =
		    [#quest_progress{label = evt_artifact_compose_quality,
				     target = 0, target_val = 9, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74160, day = 3,
		progress =
		    [#quest_progress{label = evt_artifact_compose_quality,
				     target = 0, target_val = 1,
				     param = [10453]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 76010, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 76020, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 76030, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 76040, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 50, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 76050, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 5, param = [3]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 76060, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 10, param = [3]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 76110, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 76120, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 76130, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 76140, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 76150, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 76160, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 40, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 77010, day = 5,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 2, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 77020, day = 5,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 77030, day = 5,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 8, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 77040, day = 5,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 12, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 77050, day = 5,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 16, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 77060, day = 5,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 78010, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 1,
				     param = [{bind_star, 5}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 78020, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 2,
				     param = [{bind_star, 5}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 78030, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 3,
				     param = [{bind_star, 5}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 78040, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 5,
				     param = [{bind_star, 5}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 78050, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 1,
				     param = [{bind_star, 6}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 78060, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 2,
				     param = [{bind_star, 6}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79010, day = 6,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 1, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 79020, day = 6,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 79030, day = 6,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 79040, day = 6,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 79050, day = 6,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 79060, day = 6,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 79110, day = 6,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79120, day = 6,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79130, day = 6,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 15, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79140, day = 6,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79150, day = 6,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 25, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79160, day = 6,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 30, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 74210, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_score2,
				     target = 1100, target_val = 1,
				     param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74220, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_score2,
				     target = 1200, target_val = 1,
				     param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74230, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_score2,
				     target = 1300, target_val = 1,
				     param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74240, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_score2,
				     target = 1400, target_val = 1,
				     param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74250, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_score2,
				     target = 1500, target_val = 1,
				     param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 74260, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_score2,
				     target = 1700, target_val = 1,
				     param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 79210, day = 7,
		progress =
		    [#quest_progress{label = evt_artifact_recast,
				     target = 0, target_val = 1, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79220, day = 7,
		progress =
		    [#quest_progress{label = evt_artifact_recast,
				     target = 0, target_val = 2, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79230, day = 7,
		progress =
		    [#quest_progress{label = evt_artifact_recast,
				     target = 0, target_val = 3, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79240, day = 7,
		progress =
		    [#quest_progress{label = evt_artifact_recast,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79250, day = 7,
		progress =
		    [#quest_progress{label = evt_artifact_recast,
				     target = 0, target_val = 7, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 79260, day = 7,
		progress =
		    [#quest_progress{label = evt_artifact_recast,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 2}];
get_grow(4) ->
    [#grow_data{goal_id = 41010, day = 1,
		progress =
		    [#quest_progress{label = evt_adventure_boss_fight_count,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 41020, day = 1,
		progress =
		    [#quest_progress{label = evt_adventure_boss_fight_count,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 41030, day = 1,
		progress =
		    [#quest_progress{label = evt_adventure_boss_fight_count,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 41040, day = 1,
		progress =
		    [#quest_progress{label = evt_adventure_boss_fight_count,
				     target = 0, target_val = 40, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 41050, day = 1,
		progress =
		    [#quest_progress{label = evt_adventure_boss_fight_count,
				     target = 0, target_val = 50, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 41060, day = 1,
		progress =
		    [#quest_progress{label = evt_adventure_boss_fight_count,
				     target = 0, target_val = 60, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 42010, day = 1,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 2, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 42020, day = 1,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 42030, day = 1,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 8, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 42040, day = 1,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 12, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 42050, day = 1,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 16, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 42060, day = 1,
		progress =
		    [#quest_progress{label =
					 evt_adventure_item_expend_count,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 43010, day = 2,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 1, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 43020, day = 2,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 43030, day = 2,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 43040, day = 2,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 43050, day = 2,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 43060, day = 2,
		progress =
		    [#quest_progress{label = evt_adventure_treasure_open,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44010, day = 2,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44020, day = 2,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44030, day = 2,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44040, day = 2,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44050, day = 2,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44060, day = 2,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 35, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44310, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 2, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44320, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44330, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44340, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44350, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44360, day = 3,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44110, day = 3,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44120, day = 3,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44130, day = 3,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 15, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44140, day = 3,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44150, day = 3,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 25, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44160, day = 3,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 30, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 46010, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 46020, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 46030, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 46040, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 50, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 46050, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 5, param = [3]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 46060, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 10, param = [3]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 46110, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 46120, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 46130, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 46140, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 46150, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 46160, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 40, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 47010, day = 5,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 47020, day = 5,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 47030, day = 5,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 47040, day = 5,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 47050, day = 5,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 47060, day = 5,
		progress =
		    [#quest_progress{label = evt_star_tower_pass,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 48010, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 1,
				     param = [{bind_star, 5}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 48020, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 2,
				     param = [{bind_star, 5}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 48030, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 3,
				     param = [{bind_star, 5}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 48040, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 5,
				     param = [{bind_star, 5}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 48050, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 1,
				     param = [{bind_star, 6}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 48060, day = 5,
		progress =
		    [#quest_progress{label = evt_partner_add_new,
				     target = 0, target_val = 2,
				     param = [{bind_star, 6}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49010, day = 6,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 49020, day = 6,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 49030, day = 6,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 49040, day = 6,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 40, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 49050, day = 6,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 50, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 49060, day = 6,
		progress =
		    [#quest_progress{label = evt_dungeon_stone_fight,
				     target = 0, target_val = 60, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 49110, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49120, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49130, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 40, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49140, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 60, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49150, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 80, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49160, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 100, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 44210, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44220, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44230, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 40, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44240, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 60, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44250, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 80, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 44260, day = 7,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 100, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 49210, day = 7,
		progress =
		    [#quest_progress{label = evt_hallows_step_intensify,
				     target = 0, target_val = 1, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49220, day = 7,
		progress =
		    [#quest_progress{label = evt_hallows_step_intensify,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49230, day = 7,
		progress =
		    [#quest_progress{label = evt_hallows_step_intensify,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49240, day = 7,
		progress =
		    [#quest_progress{label = evt_hallows_step_intensify,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49250, day = 7,
		progress =
		    [#quest_progress{label = evt_hallows_step_intensify,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 49260, day = 7,
		progress =
		    [#quest_progress{label = evt_hallows_step_intensify,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 2}];
get_grow(1) ->
    [#grow_data{goal_id = 11010, day = 1,
		progress =
		    [#quest_progress{label = evt_dungeon_pass,
				     target = 10200, target_val = 1,
				     param = [chapter]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 11020, day = 1,
		progress =
		    [#quest_progress{label = evt_dungeon_pass,
				     target = 10300, target_val = 1,
				     param = [chapter]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 11030, day = 1,
		progress =
		    [#quest_progress{label = evt_dungeon_pass,
				     target = 10400, target_val = 1,
				     param = [chapter]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 11040, day = 1,
		progress =
		    [#quest_progress{label = evt_dungeon_pass,
				     target = 20080, target_val = 1,
				     param = [chapter]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 11050, day = 1,
		progress =
		    [#quest_progress{label = evt_dungeon_pass,
				     target = 20200, target_val = 1,
				     param = [chapter]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 11060, day = 1,
		progress =
		    [#quest_progress{label = evt_dungeon_pass,
				     target = 20300, target_val = 1,
				     param = [chapter]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 12010, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_donate, target = 0,
				     target_val = 1, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 12020, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_donate, target = 0,
				     target_val = 3, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 12030, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_donate, target = 0,
				     target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 12040, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 2, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 12050, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 12060, day = 1,
		progress =
		    [#quest_progress{label = evt_guild_dun_fight,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 13010, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 13020, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 13030, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 13040, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 13050, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 40, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 13060, day = 2,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 50, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 14010, day = 2,
		progress =
		    [#quest_progress{label = evt_recruit, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14020, day = 2,
		progress =
		    [#quest_progress{label = evt_recruit, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14030, day = 2,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14040, day = 2,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14050, day = 2,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14060, day = 2,
		progress =
		    [#quest_progress{label = evt_recruit, target = 300,
				     target_val = 40, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 15010, day = 3,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 5, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 15020, day = 3,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 15030, day = 3,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 15, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 15040, day = 3,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 15050, day = 3,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 15060, day = 3,
		progress =
		    [#quest_progress{label = evt_arena_fight, target = 0,
				     target_val = 40, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 14110, day = 3,
		progress =
		    [#quest_progress{label = evt_partner_star_up,
				     target = 5, target_val = 1, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14120, day = 3,
		progress =
		    [#quest_progress{label = evt_partner_star_up,
				     target = 5, target_val = 2, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14130, day = 3,
		progress =
		    [#quest_progress{label = evt_partner_star_up,
				     target = 5, target_val = 3, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14140, day = 3,
		progress =
		    [#quest_progress{label = evt_partner_star_up,
				     target = 5, target_val = 4, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14150, day = 3,
		progress =
		    [#quest_progress{label = evt_partner_star_up,
				     target = 6, target_val = 1, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14160, day = 3,
		progress =
		    [#quest_progress{label = evt_partner_star_up,
				     target = 6, target_val = 2, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 16010, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 16020, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 16030, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 16040, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 40, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 16050, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 5, param = [3]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 16060, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping, target = 0,
				     target_val = 10, param = [3]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 16110, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 5, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 16120, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 16130, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 16140, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 16150, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 16160, day = 4,
		progress =
		    [#quest_progress{label = evt_shipping_refresh,
				     target = 0, target_val = 40, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 17010, day = 5,
		progress =
		    [#quest_progress{label = evt_hallows_activate,
				     target = 0, target_val = 3,
				     param = [num]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 17020, day = 5,
		progress =
		    [#quest_progress{label = evt_hallows_activate,
				     target = 0, target_val = 5,
				     param = [num]}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 17030, day = 5,
		progress =
		    [#quest_progress{label = evt_hallows_step, target = 0,
				     target_val = 1, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 17040, day = 5,
		progress =
		    [#quest_progress{label = evt_hallows_step, target = 0,
				     target_val = 2, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 17050, day = 5,
		progress =
		    [#quest_progress{label = evt_hallows_step, target = 0,
				     target_val = 3, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 17060, day = 5,
		progress =
		    [#quest_progress{label = evt_hallows_step, target = 0,
				     target_val = 4, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 18010, day = 5,
		progress =
		    [#quest_progress{label = evt_levup, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 18020, day = 5,
		progress =
		    [#quest_progress{label = evt_levup, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 18030, day = 5,
		progress =
		    [#quest_progress{label = evt_levup, target = 0,
				     target_val = 30, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 18040, day = 5,
		progress =
		    [#quest_progress{label = evt_levup, target = 0,
				     target_val = 40, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 18050, day = 5,
		progress =
		    [#quest_progress{label = evt_levup, target = 0,
				     target_val = 45, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 18060, day = 5,
		progress =
		    [#quest_progress{label = evt_levup, target = 0,
				     target_val = 55, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19010, day = 6,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 19020, day = 6,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 19030, day = 6,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 0,
				     target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 19040, day = 6,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 0,
				     target_val = 40, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 19050, day = 6,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 0,
				     target_val = 50, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 19060, day = 6,
		progress =
		    [#quest_progress{label = evt_endless_appoint,
				     target = 0, target_val = 1, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 19110, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 10, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19120, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 20, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19130, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 30, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19140, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 40, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19150, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 60, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19160, day = 6,
		progress =
		    [#quest_progress{label = evt_dial, target = 0,
				     target_val = 80, param = []}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 14310, day = 7,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 2, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 14320, day = 7,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 10, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 14330, day = 7,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 15, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 14340, day = 7,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 20, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 14350, day = 7,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 25, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 14360, day = 7,
		progress =
		    [#quest_progress{label = evt_planes_kill_guard,
				     target = 0, target_val = 30, param = []}],
		lev = 1, target_type = 1},
     #grow_data{goal_id = 19210, day = 7,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 5, param = [{lev, 30}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19220, day = 7,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1, param = [{lev, 99}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19230, day = 7,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1, param = [{lev, 120}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19240, day = 7,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 5, param = [{star, 5}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19250, day = 7,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1, param = [{star, 6}]}],
		lev = 1, target_type = 2},
     #grow_data{goal_id = 19260, day = 7,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 2, param = [{star, 6}]}],
		lev = 1, target_type = 2}];
get_grow(_) -> [].

get_grow_data(11010) ->
    #grow_data{goal_id = 11010, day = 1,
	       progress =
		   [#quest_progress{label = evt_dungeon_pass,
				    target = 10200, target_val = 1,
				    param = [chapter]}],
	       lev = 1, target_type = 1};
get_grow_data(11020) ->
    #grow_data{goal_id = 11020, day = 1,
	       progress =
		   [#quest_progress{label = evt_dungeon_pass,
				    target = 10300, target_val = 1,
				    param = [chapter]}],
	       lev = 1, target_type = 1};
get_grow_data(11030) ->
    #grow_data{goal_id = 11030, day = 1,
	       progress =
		   [#quest_progress{label = evt_dungeon_pass,
				    target = 10400, target_val = 1,
				    param = [chapter]}],
	       lev = 1, target_type = 1};
get_grow_data(11040) ->
    #grow_data{goal_id = 11040, day = 1,
	       progress =
		   [#quest_progress{label = evt_dungeon_pass,
				    target = 20080, target_val = 1,
				    param = [chapter]}],
	       lev = 1, target_type = 1};
get_grow_data(11050) ->
    #grow_data{goal_id = 11050, day = 1,
	       progress =
		   [#quest_progress{label = evt_dungeon_pass,
				    target = 20200, target_val = 1,
				    param = [chapter]}],
	       lev = 1, target_type = 1};
get_grow_data(11060) ->
    #grow_data{goal_id = 11060, day = 1,
	       progress =
		   [#quest_progress{label = evt_dungeon_pass,
				    target = 20300, target_val = 1,
				    param = [chapter]}],
	       lev = 1, target_type = 1};
get_grow_data(12010) ->
    #grow_data{goal_id = 12010, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_donate, target = 0,
				    target_val = 1, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(12020) ->
    #grow_data{goal_id = 12020, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_donate, target = 0,
				    target_val = 3, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(12030) ->
    #grow_data{goal_id = 12030, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_donate, target = 0,
				    target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(12040) ->
    #grow_data{goal_id = 12040, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 2, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(12050) ->
    #grow_data{goal_id = 12050, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(12060) ->
    #grow_data{goal_id = 12060, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(13010) ->
    #grow_data{goal_id = 13010, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_floor_pass,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(13020) ->
    #grow_data{goal_id = 13020, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_floor_pass,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(13030) ->
    #grow_data{goal_id = 13030, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_floor_pass,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(13040) ->
    #grow_data{goal_id = 13040, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_floor_pass,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(13050) ->
    #grow_data{goal_id = 13050, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_floor_pass,
				    target = 0, target_val = 40, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(13060) ->
    #grow_data{goal_id = 13060, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_floor_pass,
				    target = 0, target_val = 50, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(14010) ->
    #grow_data{goal_id = 14010, day = 2,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14020) ->
    #grow_data{goal_id = 14020, day = 2,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14030) ->
    #grow_data{goal_id = 14030, day = 2,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14040) ->
    #grow_data{goal_id = 14040, day = 2,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14050) ->
    #grow_data{goal_id = 14050, day = 2,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14060) ->
    #grow_data{goal_id = 14060, day = 2,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 40, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(15010) ->
    #grow_data{goal_id = 15010, day = 3,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 5, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(15020) ->
    #grow_data{goal_id = 15020, day = 3,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(15030) ->
    #grow_data{goal_id = 15030, day = 3,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 15, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(15040) ->
    #grow_data{goal_id = 15040, day = 3,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(15050) ->
    #grow_data{goal_id = 15050, day = 3,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(15060) ->
    #grow_data{goal_id = 15060, day = 3,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 40, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(14110) ->
    #grow_data{goal_id = 14110, day = 3,
	       progress =
		   [#quest_progress{label = evt_partner_star_up,
				    target = 5, target_val = 1, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14120) ->
    #grow_data{goal_id = 14120, day = 3,
	       progress =
		   [#quest_progress{label = evt_partner_star_up,
				    target = 5, target_val = 2, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14130) ->
    #grow_data{goal_id = 14130, day = 3,
	       progress =
		   [#quest_progress{label = evt_partner_star_up,
				    target = 5, target_val = 3, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14140) ->
    #grow_data{goal_id = 14140, day = 3,
	       progress =
		   [#quest_progress{label = evt_partner_star_up,
				    target = 5, target_val = 4, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14150) ->
    #grow_data{goal_id = 14150, day = 3,
	       progress =
		   [#quest_progress{label = evt_partner_star_up,
				    target = 6, target_val = 1, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14160) ->
    #grow_data{goal_id = 14160, day = 3,
	       progress =
		   [#quest_progress{label = evt_partner_star_up,
				    target = 6, target_val = 2, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(16010) ->
    #grow_data{goal_id = 16010, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(16020) ->
    #grow_data{goal_id = 16020, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(16030) ->
    #grow_data{goal_id = 16030, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(16040) ->
    #grow_data{goal_id = 16040, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 40, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(16050) ->
    #grow_data{goal_id = 16050, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 5, param = [3]}],
	       lev = 1, target_type = 1};
get_grow_data(16060) ->
    #grow_data{goal_id = 16060, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 10, param = [3]}],
	       lev = 1, target_type = 1};
get_grow_data(16110) ->
    #grow_data{goal_id = 16110, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(16120) ->
    #grow_data{goal_id = 16120, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(16130) ->
    #grow_data{goal_id = 16130, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(16140) ->
    #grow_data{goal_id = 16140, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(16150) ->
    #grow_data{goal_id = 16150, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(16160) ->
    #grow_data{goal_id = 16160, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 40, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(17010) ->
    #grow_data{goal_id = 17010, day = 5,
	       progress =
		   [#quest_progress{label = evt_hallows_activate,
				    target = 0, target_val = 3, param = [num]}],
	       lev = 1, target_type = 1};
get_grow_data(17020) ->
    #grow_data{goal_id = 17020, day = 5,
	       progress =
		   [#quest_progress{label = evt_hallows_activate,
				    target = 0, target_val = 5, param = [num]}],
	       lev = 1, target_type = 1};
get_grow_data(17030) ->
    #grow_data{goal_id = 17030, day = 5,
	       progress =
		   [#quest_progress{label = evt_hallows_step, target = 0,
				    target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(17040) ->
    #grow_data{goal_id = 17040, day = 5,
	       progress =
		   [#quest_progress{label = evt_hallows_step, target = 0,
				    target_val = 2, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(17050) ->
    #grow_data{goal_id = 17050, day = 5,
	       progress =
		   [#quest_progress{label = evt_hallows_step, target = 0,
				    target_val = 3, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(17060) ->
    #grow_data{goal_id = 17060, day = 5,
	       progress =
		   [#quest_progress{label = evt_hallows_step, target = 0,
				    target_val = 4, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(18010) ->
    #grow_data{goal_id = 18010, day = 5,
	       progress =
		   [#quest_progress{label = evt_levup, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(18020) ->
    #grow_data{goal_id = 18020, day = 5,
	       progress =
		   [#quest_progress{label = evt_levup, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(18030) ->
    #grow_data{goal_id = 18030, day = 5,
	       progress =
		   [#quest_progress{label = evt_levup, target = 0,
				    target_val = 30, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(18040) ->
    #grow_data{goal_id = 18040, day = 5,
	       progress =
		   [#quest_progress{label = evt_levup, target = 0,
				    target_val = 40, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(18050) ->
    #grow_data{goal_id = 18050, day = 5,
	       progress =
		   [#quest_progress{label = evt_levup, target = 0,
				    target_val = 45, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(18060) ->
    #grow_data{goal_id = 18060, day = 5,
	       progress =
		   [#quest_progress{label = evt_levup, target = 0,
				    target_val = 55, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(19010) ->
    #grow_data{goal_id = 19010, day = 6,
	       progress =
		   [#quest_progress{label = evt_endless_pass, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(19020) ->
    #grow_data{goal_id = 19020, day = 6,
	       progress =
		   [#quest_progress{label = evt_endless_pass, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(19030) ->
    #grow_data{goal_id = 19030, day = 6,
	       progress =
		   [#quest_progress{label = evt_endless_pass, target = 0,
				    target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(19040) ->
    #grow_data{goal_id = 19040, day = 6,
	       progress =
		   [#quest_progress{label = evt_endless_pass, target = 0,
				    target_val = 40, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(19050) ->
    #grow_data{goal_id = 19050, day = 6,
	       progress =
		   [#quest_progress{label = evt_endless_pass, target = 0,
				    target_val = 50, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(19060) ->
    #grow_data{goal_id = 19060, day = 6,
	       progress =
		   [#quest_progress{label = evt_endless_appoint,
				    target = 0, target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(19110) ->
    #grow_data{goal_id = 19110, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(19120) ->
    #grow_data{goal_id = 19120, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(19130) ->
    #grow_data{goal_id = 19130, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 30, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(19140) ->
    #grow_data{goal_id = 19140, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 40, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(19150) ->
    #grow_data{goal_id = 19150, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 60, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(19160) ->
    #grow_data{goal_id = 19160, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 80, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(14310) ->
    #grow_data{goal_id = 14310, day = 7,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 2, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(14320) ->
    #grow_data{goal_id = 14320, day = 7,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(14330) ->
    #grow_data{goal_id = 14330, day = 7,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(14340) ->
    #grow_data{goal_id = 14340, day = 7,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(14350) ->
    #grow_data{goal_id = 14350, day = 7,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(14360) ->
    #grow_data{goal_id = 14360, day = 7,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(19210) ->
    #grow_data{goal_id = 19210, day = 7,
	       progress =
		   [#quest_progress{label = evt_partner, target = 0,
				    target_val = 5, param = [{lev, 30}]}],
	       lev = 1, target_type = 2};
get_grow_data(19220) ->
    #grow_data{goal_id = 19220, day = 7,
	       progress =
		   [#quest_progress{label = evt_partner, target = 0,
				    target_val = 1, param = [{lev, 99}]}],
	       lev = 1, target_type = 2};
get_grow_data(19230) ->
    #grow_data{goal_id = 19230, day = 7,
	       progress =
		   [#quest_progress{label = evt_partner, target = 0,
				    target_val = 1, param = [{lev, 120}]}],
	       lev = 1, target_type = 2};
get_grow_data(19240) ->
    #grow_data{goal_id = 19240, day = 7,
	       progress =
		   [#quest_progress{label = evt_partner, target = 0,
				    target_val = 5, param = [{star, 5}]}],
	       lev = 1, target_type = 2};
get_grow_data(19250) ->
    #grow_data{goal_id = 19250, day = 7,
	       progress =
		   [#quest_progress{label = evt_partner, target = 0,
				    target_val = 1, param = [{star, 6}]}],
	       lev = 1, target_type = 2};
get_grow_data(19260) ->
    #grow_data{goal_id = 19260, day = 7,
	       progress =
		   [#quest_progress{label = evt_partner, target = 0,
				    target_val = 2, param = [{star, 6}]}],
	       lev = 1, target_type = 2};
get_grow_data(41010) ->
    #grow_data{goal_id = 41010, day = 1,
	       progress =
		   [#quest_progress{label = evt_adventure_boss_fight_count,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(41020) ->
    #grow_data{goal_id = 41020, day = 1,
	       progress =
		   [#quest_progress{label = evt_adventure_boss_fight_count,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(41030) ->
    #grow_data{goal_id = 41030, day = 1,
	       progress =
		   [#quest_progress{label = evt_adventure_boss_fight_count,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(41040) ->
    #grow_data{goal_id = 41040, day = 1,
	       progress =
		   [#quest_progress{label = evt_adventure_boss_fight_count,
				    target = 0, target_val = 40, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(41050) ->
    #grow_data{goal_id = 41050, day = 1,
	       progress =
		   [#quest_progress{label = evt_adventure_boss_fight_count,
				    target = 0, target_val = 50, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(41060) ->
    #grow_data{goal_id = 41060, day = 1,
	       progress =
		   [#quest_progress{label = evt_adventure_boss_fight_count,
				    target = 0, target_val = 60, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(42010) ->
    #grow_data{goal_id = 42010, day = 1,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 2, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(42020) ->
    #grow_data{goal_id = 42020, day = 1,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(42030) ->
    #grow_data{goal_id = 42030, day = 1,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 8, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(42040) ->
    #grow_data{goal_id = 42040, day = 1,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 12, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(42050) ->
    #grow_data{goal_id = 42050, day = 1,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 16, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(42060) ->
    #grow_data{goal_id = 42060, day = 1,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(43010) ->
    #grow_data{goal_id = 43010, day = 2,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(43020) ->
    #grow_data{goal_id = 43020, day = 2,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(43030) ->
    #grow_data{goal_id = 43030, day = 2,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(43040) ->
    #grow_data{goal_id = 43040, day = 2,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(43050) ->
    #grow_data{goal_id = 43050, day = 2,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(43060) ->
    #grow_data{goal_id = 43060, day = 2,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44010) ->
    #grow_data{goal_id = 44010, day = 2,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44020) ->
    #grow_data{goal_id = 44020, day = 2,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44030) ->
    #grow_data{goal_id = 44030, day = 2,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44040) ->
    #grow_data{goal_id = 44040, day = 2,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44050) ->
    #grow_data{goal_id = 44050, day = 2,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44060) ->
    #grow_data{goal_id = 44060, day = 2,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 35, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44310) ->
    #grow_data{goal_id = 44310, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 2, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44320) ->
    #grow_data{goal_id = 44320, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44330) ->
    #grow_data{goal_id = 44330, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44340) ->
    #grow_data{goal_id = 44340, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44350) ->
    #grow_data{goal_id = 44350, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44360) ->
    #grow_data{goal_id = 44360, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44110) ->
    #grow_data{goal_id = 44110, day = 3,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44120) ->
    #grow_data{goal_id = 44120, day = 3,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44130) ->
    #grow_data{goal_id = 44130, day = 3,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 15, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44140) ->
    #grow_data{goal_id = 44140, day = 3,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44150) ->
    #grow_data{goal_id = 44150, day = 3,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 25, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44160) ->
    #grow_data{goal_id = 44160, day = 3,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 30, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(46010) ->
    #grow_data{goal_id = 46010, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(46020) ->
    #grow_data{goal_id = 46020, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(46030) ->
    #grow_data{goal_id = 46030, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(46040) ->
    #grow_data{goal_id = 46040, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 50, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(46050) ->
    #grow_data{goal_id = 46050, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 5, param = [3]}],
	       lev = 1, target_type = 1};
get_grow_data(46060) ->
    #grow_data{goal_id = 46060, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 10, param = [3]}],
	       lev = 1, target_type = 1};
get_grow_data(46110) ->
    #grow_data{goal_id = 46110, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(46120) ->
    #grow_data{goal_id = 46120, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(46130) ->
    #grow_data{goal_id = 46130, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(46140) ->
    #grow_data{goal_id = 46140, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(46150) ->
    #grow_data{goal_id = 46150, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(46160) ->
    #grow_data{goal_id = 46160, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 40, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(47010) ->
    #grow_data{goal_id = 47010, day = 5,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(47020) ->
    #grow_data{goal_id = 47020, day = 5,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(47030) ->
    #grow_data{goal_id = 47030, day = 5,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(47040) ->
    #grow_data{goal_id = 47040, day = 5,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(47050) ->
    #grow_data{goal_id = 47050, day = 5,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(47060) ->
    #grow_data{goal_id = 47060, day = 5,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(48010) ->
    #grow_data{goal_id = 48010, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 1,
				    param = [{bind_star, 5}]}],
	       lev = 1, target_type = 2};
get_grow_data(48020) ->
    #grow_data{goal_id = 48020, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 2,
				    param = [{bind_star, 5}]}],
	       lev = 1, target_type = 2};
get_grow_data(48030) ->
    #grow_data{goal_id = 48030, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 3,
				    param = [{bind_star, 5}]}],
	       lev = 1, target_type = 2};
get_grow_data(48040) ->
    #grow_data{goal_id = 48040, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 5,
				    param = [{bind_star, 5}]}],
	       lev = 1, target_type = 2};
get_grow_data(48050) ->
    #grow_data{goal_id = 48050, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 1,
				    param = [{bind_star, 6}]}],
	       lev = 1, target_type = 2};
get_grow_data(48060) ->
    #grow_data{goal_id = 48060, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 2,
				    param = [{bind_star, 6}]}],
	       lev = 1, target_type = 2};
get_grow_data(49010) ->
    #grow_data{goal_id = 49010, day = 6,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(49020) ->
    #grow_data{goal_id = 49020, day = 6,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(49030) ->
    #grow_data{goal_id = 49030, day = 6,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(49040) ->
    #grow_data{goal_id = 49040, day = 6,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 40, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(49050) ->
    #grow_data{goal_id = 49050, day = 6,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 50, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(49060) ->
    #grow_data{goal_id = 49060, day = 6,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 60, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(49110) ->
    #grow_data{goal_id = 49110, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49120) ->
    #grow_data{goal_id = 49120, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49130) ->
    #grow_data{goal_id = 49130, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 40, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49140) ->
    #grow_data{goal_id = 49140, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 60, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49150) ->
    #grow_data{goal_id = 49150, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 80, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49160) ->
    #grow_data{goal_id = 49160, day = 6,
	       progress =
		   [#quest_progress{label = evt_dial, target = 0,
				    target_val = 100, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(44210) ->
    #grow_data{goal_id = 44210, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44220) ->
    #grow_data{goal_id = 44220, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44230) ->
    #grow_data{goal_id = 44230, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 40, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44240) ->
    #grow_data{goal_id = 44240, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 60, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44250) ->
    #grow_data{goal_id = 44250, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 80, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(44260) ->
    #grow_data{goal_id = 44260, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 100, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(49210) ->
    #grow_data{goal_id = 49210, day = 7,
	       progress =
		   [#quest_progress{label = evt_hallows_step_intensify,
				    target = 0, target_val = 1, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49220) ->
    #grow_data{goal_id = 49220, day = 7,
	       progress =
		   [#quest_progress{label = evt_hallows_step_intensify,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49230) ->
    #grow_data{goal_id = 49230, day = 7,
	       progress =
		   [#quest_progress{label = evt_hallows_step_intensify,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49240) ->
    #grow_data{goal_id = 49240, day = 7,
	       progress =
		   [#quest_progress{label = evt_hallows_step_intensify,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49250) ->
    #grow_data{goal_id = 49250, day = 7,
	       progress =
		   [#quest_progress{label = evt_hallows_step_intensify,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(49260) ->
    #grow_data{goal_id = 49260, day = 7,
	       progress =
		   [#quest_progress{label = evt_hallows_step_intensify,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(71010) ->
    #grow_data{goal_id = 71010, day = 1,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(71020) ->
    #grow_data{goal_id = 71020, day = 1,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(71030) ->
    #grow_data{goal_id = 71030, day = 1,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 40, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(71040) ->
    #grow_data{goal_id = 71040, day = 1,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 60, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(71050) ->
    #grow_data{goal_id = 71050, day = 1,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 80, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(71060) ->
    #grow_data{goal_id = 71060, day = 1,
	       progress =
		   [#quest_progress{label = evt_arena_fight, target = 0,
				    target_val = 100, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(72010) ->
    #grow_data{goal_id = 72010, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(72020) ->
    #grow_data{goal_id = 72020, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(72030) ->
    #grow_data{goal_id = 72030, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(72040) ->
    #grow_data{goal_id = 72040, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(72050) ->
    #grow_data{goal_id = 72050, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(72060) ->
    #grow_data{goal_id = 72060, day = 1,
	       progress =
		   [#quest_progress{label = evt_guild_dun_fight,
				    target = 0, target_val = 32, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(73010) ->
    #grow_data{goal_id = 73010, day = 2,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(73020) ->
    #grow_data{goal_id = 73020, day = 2,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(73030) ->
    #grow_data{goal_id = 73030, day = 2,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(73040) ->
    #grow_data{goal_id = 73040, day = 2,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 40, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(73050) ->
    #grow_data{goal_id = 73050, day = 2,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 50, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(73060) ->
    #grow_data{goal_id = 73060, day = 2,
	       progress =
		   [#quest_progress{label = evt_dungeon_stone_fight,
				    target = 0, target_val = 60, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74010) ->
    #grow_data{goal_id = 74010, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 1, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74020) ->
    #grow_data{goal_id = 74020, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74030) ->
    #grow_data{goal_id = 74030, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74040) ->
    #grow_data{goal_id = 74040, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74050) ->
    #grow_data{goal_id = 74050, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74060) ->
    #grow_data{goal_id = 74060, day = 2,
	       progress =
		   [#quest_progress{label = evt_star_tower_pass,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74310) ->
    #grow_data{goal_id = 74310, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 2, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74320) ->
    #grow_data{goal_id = 74320, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74330) ->
    #grow_data{goal_id = 74330, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74340) ->
    #grow_data{goal_id = 74340, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74350) ->
    #grow_data{goal_id = 74350, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74360) ->
    #grow_data{goal_id = 74360, day = 3,
	       progress =
		   [#quest_progress{label = evt_planes_kill_guard,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74110) ->
    #grow_data{goal_id = 74110, day = 3,
	       progress =
		   [#quest_progress{label = evt_artifact_compose_quality,
				    target = 0, target_val = 1, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74120) ->
    #grow_data{goal_id = 74120, day = 3,
	       progress =
		   [#quest_progress{label = evt_artifact_compose_quality,
				    target = 0, target_val = 3, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74130) ->
    #grow_data{goal_id = 74130, day = 3,
	       progress =
		   [#quest_progress{label = evt_artifact_compose_quality,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74140) ->
    #grow_data{goal_id = 74140, day = 3,
	       progress =
		   [#quest_progress{label = evt_artifact_compose_quality,
				    target = 0, target_val = 7, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74150) ->
    #grow_data{goal_id = 74150, day = 3,
	       progress =
		   [#quest_progress{label = evt_artifact_compose_quality,
				    target = 0, target_val = 9, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74160) ->
    #grow_data{goal_id = 74160, day = 3,
	       progress =
		   [#quest_progress{label = evt_artifact_compose_quality,
				    target = 0, target_val = 1,
				    param = [10453]}],
	       lev = 1, target_type = 2};
get_grow_data(76010) ->
    #grow_data{goal_id = 76010, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(76020) ->
    #grow_data{goal_id = 76020, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(76030) ->
    #grow_data{goal_id = 76030, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 30, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(76040) ->
    #grow_data{goal_id = 76040, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 50, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(76050) ->
    #grow_data{goal_id = 76050, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 5, param = [3]}],
	       lev = 1, target_type = 1};
get_grow_data(76060) ->
    #grow_data{goal_id = 76060, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping, target = 0,
				    target_val = 10, param = [3]}],
	       lev = 1, target_type = 1};
get_grow_data(76110) ->
    #grow_data{goal_id = 76110, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(76120) ->
    #grow_data{goal_id = 76120, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(76130) ->
    #grow_data{goal_id = 76130, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(76140) ->
    #grow_data{goal_id = 76140, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(76150) ->
    #grow_data{goal_id = 76150, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 30, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(76160) ->
    #grow_data{goal_id = 76160, day = 4,
	       progress =
		   [#quest_progress{label = evt_shipping_refresh,
				    target = 0, target_val = 40, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(77010) ->
    #grow_data{goal_id = 77010, day = 5,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 2, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(77020) ->
    #grow_data{goal_id = 77020, day = 5,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(77030) ->
    #grow_data{goal_id = 77030, day = 5,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 8, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(77040) ->
    #grow_data{goal_id = 77040, day = 5,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 12, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(77050) ->
    #grow_data{goal_id = 77050, day = 5,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 16, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(77060) ->
    #grow_data{goal_id = 77060, day = 5,
	       progress =
		   [#quest_progress{label =
					evt_adventure_item_expend_count,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(78010) ->
    #grow_data{goal_id = 78010, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 1,
				    param = [{bind_star, 5}]}],
	       lev = 1, target_type = 2};
get_grow_data(78020) ->
    #grow_data{goal_id = 78020, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 2,
				    param = [{bind_star, 5}]}],
	       lev = 1, target_type = 2};
get_grow_data(78030) ->
    #grow_data{goal_id = 78030, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 3,
				    param = [{bind_star, 5}]}],
	       lev = 1, target_type = 2};
get_grow_data(78040) ->
    #grow_data{goal_id = 78040, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 5,
				    param = [{bind_star, 5}]}],
	       lev = 1, target_type = 2};
get_grow_data(78050) ->
    #grow_data{goal_id = 78050, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 1,
				    param = [{bind_star, 6}]}],
	       lev = 1, target_type = 2};
get_grow_data(78060) ->
    #grow_data{goal_id = 78060, day = 5,
	       progress =
		   [#quest_progress{label = evt_partner_add_new,
				    target = 0, target_val = 2,
				    param = [{bind_star, 6}]}],
	       lev = 1, target_type = 2};
get_grow_data(79010) ->
    #grow_data{goal_id = 79010, day = 6,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(79020) ->
    #grow_data{goal_id = 79020, day = 6,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(79030) ->
    #grow_data{goal_id = 79030, day = 6,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(79040) ->
    #grow_data{goal_id = 79040, day = 6,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 15, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(79050) ->
    #grow_data{goal_id = 79050, day = 6,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 20, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(79060) ->
    #grow_data{goal_id = 79060, day = 6,
	       progress =
		   [#quest_progress{label = evt_adventure_treasure_open,
				    target = 0, target_val = 25, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(79110) ->
    #grow_data{goal_id = 79110, day = 6,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79120) ->
    #grow_data{goal_id = 79120, day = 6,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79130) ->
    #grow_data{goal_id = 79130, day = 6,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 15, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79140) ->
    #grow_data{goal_id = 79140, day = 6,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 20, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79150) ->
    #grow_data{goal_id = 79150, day = 6,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 25, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79160) ->
    #grow_data{goal_id = 79160, day = 6,
	       progress =
		   [#quest_progress{label = evt_recruit, target = 300,
				    target_val = 30, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(74210) ->
    #grow_data{goal_id = 74210, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_score2,
				    target = 1100, target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74220) ->
    #grow_data{goal_id = 74220, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_score2,
				    target = 1200, target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74230) ->
    #grow_data{goal_id = 74230, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_score2,
				    target = 1300, target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74240) ->
    #grow_data{goal_id = 74240, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_score2,
				    target = 1400, target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74250) ->
    #grow_data{goal_id = 74250, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_score2,
				    target = 1500, target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(74260) ->
    #grow_data{goal_id = 74260, day = 7,
	       progress =
		   [#quest_progress{label = evt_arena_score2,
				    target = 1700, target_val = 1, param = []}],
	       lev = 1, target_type = 1};
get_grow_data(79210) ->
    #grow_data{goal_id = 79210, day = 7,
	       progress =
		   [#quest_progress{label = evt_artifact_recast,
				    target = 0, target_val = 1, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79220) ->
    #grow_data{goal_id = 79220, day = 7,
	       progress =
		   [#quest_progress{label = evt_artifact_recast,
				    target = 0, target_val = 2, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79230) ->
    #grow_data{goal_id = 79230, day = 7,
	       progress =
		   [#quest_progress{label = evt_artifact_recast,
				    target = 0, target_val = 3, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79240) ->
    #grow_data{goal_id = 79240, day = 7,
	       progress =
		   [#quest_progress{label = evt_artifact_recast,
				    target = 0, target_val = 5, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79250) ->
    #grow_data{goal_id = 79250, day = 7,
	       progress =
		   [#quest_progress{label = evt_artifact_recast,
				    target = 0, target_val = 7, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(79260) ->
    #grow_data{goal_id = 79260, day = 7,
	       progress =
		   [#quest_progress{label = evt_artifact_recast,
				    target = 0, target_val = 10, param = []}],
	       lev = 1, target_type = 2};
get_grow_data(_Info) ->
    logger:data_error("get_grow_data_data_not_exist===>~w",
		      [_Info], day_goals_data, 4010),
    undefined.


