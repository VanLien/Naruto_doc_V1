-file("src/mod/data/room_feat_data.erl", 1).

-module(room_feat_data).

-lager_records([{condition, [label, op, val, msg]},
		{gain_loss_opts,
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
		  hide]}]).

-export([get_const/1, list/0, lev/1, suffix_quest/1,
	 dungeon_feat/1, get/1, get_point/1, get_badges_name/1,
	 get_honor_name/1]).

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

-file("src/mod/data/room_feat_data.erl", 18).

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

-file("src/mod/data/room_feat_data.erl", 19).

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

-file("src/mod/data/room_feat_data.erl", 20).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/data/room_feat_data.erl", 21).

get_const(experience_open_limit) -> 55;
get_const(badge_open_limit) -> 55;
get_const(home_world_feat) -> 1001;
get_const(_) -> undefined.

list() ->
    [1001, 40000, 40010, 41000, 41010, 42000, 42010, 42020,
     42100, 42110, 42120, 42130, 42200, 42210, 42220, 42230,
     43000, 43010, 43110, 43120, 43210, 43220, 44000, 44010,
     44020, 45000, 45010, 45020, 46000, 46010, 46020, 46030,
     46800, 46810, 46820, 46830, 46840, 47000, 47010, 47020,
     47030, 47040, 48000, 48010, 49000, 50000, 50010, 50020,
     50110, 50120, 50130, 51000, 51010, 51020, 51110, 51120,
     52000, 52010, 52020, 53000, 53010, 53110, 53120, 53210,
     53220, 53310, 53320, 53410, 53420, 53510, 53520, 53610,
     53620, 53630, 53710, 75000, 75010, 75020, 76000, 76010,
     76110, 76120, 76210, 76220, 77000, 77010, 77110, 77120,
     77210, 77220, 77310, 78000, 78010, 78020, 80000, 80010,
     80020, 80110, 80120, 90010, 90020, 90030, 90040, 90050,
     90060, 90070, 90080, 90090, 90100, 90110, 100010,
     100020, 100030, 100040, 100050, 100060, 100070].

lev(70) ->
    [100010, 100020, 100030, 100040, 100050, 100060,
     100070];
lev(val_not_exist) -> [80020];
lev(115) -> [80000, 80010, 80110, 80120];
lev(105) -> [78000, 78010, 78020];
lev(100) ->
    [77000, 77010, 77110, 77120, 77210, 77220, 77310];
lev(90) -> [76000, 76010, 76110, 76120, 76210, 76220];
lev(170) -> [53710];
lev(35) -> [49000];
lev(30) ->
    [46800, 46810, 46820, 46830, 46840, 47000, 47010, 47020,
     47030, 47040];
lev(25) -> [46000, 46010, 46020, 46030];
lev(18) ->
    [44000, 44010, 44020, 45000, 45010, 45020, 90050, 90060,
     90090];
lev(55) ->
    [42100, 42110, 42120, 42130, 42200, 42210, 42220, 42230,
     48000, 48010, 50000, 50010, 50020, 50110, 50120, 50130,
     51000, 51010, 51020, 51110, 51120, 52000, 52010, 52020,
     53000, 53010, 53110, 53120, 53210, 53220, 53310, 53320,
     53410, 53420, 53510, 53520, 53620, 53630, 75000, 75010,
     75020, 90070];
lev(8) -> [41000, 41010, 42000, 42010, 42020, 53610];
lev(16) -> [40000, 40010];
lev(10) ->
    [1001, 43000, 43010, 43110, 43120, 43210, 43220, 90010,
     90020, 90030, 90040, 90080, 90100, 90110];
lev(_) -> [].

suffix_quest(40000) -> 40010;
suffix_quest(41000) -> 41010;
suffix_quest(43000) -> 43010;
suffix_quest(43110) -> 43120;
suffix_quest(43210) -> 43220;
suffix_quest(44000) -> 44010;
suffix_quest(44010) -> 44020;
suffix_quest(45000) -> 45010;
suffix_quest(45010) -> 45020;
suffix_quest(46000) -> 46010;
suffix_quest(46010) -> 46020;
suffix_quest(46020) -> 46030;
suffix_quest(46800) -> 46810;
suffix_quest(46810) -> 46820;
suffix_quest(46820) -> 46830;
suffix_quest(46830) -> 46840;
suffix_quest(47000) -> 47010;
suffix_quest(47010) -> 47020;
suffix_quest(47020) -> 47030;
suffix_quest(47030) -> 47040;
suffix_quest(50000) -> 50010;
suffix_quest(50010) -> 50020;
suffix_quest(50110) -> 50120;
suffix_quest(50120) -> 50130;
suffix_quest(51000) -> 51010;
suffix_quest(51010) -> 51020;
suffix_quest(52000) -> 52010;
suffix_quest(52010) -> 52020;
suffix_quest(53000) -> 53010;
suffix_quest(53110) -> 53120;
suffix_quest(53210) -> 53220;
suffix_quest(53310) -> 53320;
suffix_quest(53410) -> 53420;
suffix_quest(53510) -> 53520;
suffix_quest(76000) -> 76010;
suffix_quest(76110) -> 76120;
suffix_quest(77000) -> 77010;
suffix_quest(78000) -> 78010;
suffix_quest(78010) -> 78020;
suffix_quest(80000) -> 80010;
suffix_quest(80010) -> 80020;
suffix_quest(_) -> undefined.

dungeon_feat(val_not_exist) ->
    [1001, 40000, 40010, 41000, 41010, 42000, 42010, 42020,
     42100, 42110, 42120, 42130, 42200, 42210, 42220, 42230,
     43000, 43010, 43110, 43120, 43210, 43220, 44000, 44010,
     44020, 45000, 45010, 45020, 46000, 46010, 46020, 46030,
     46800, 46810, 46820, 46830, 46840, 47000, 47010, 47020,
     47030, 47040, 48000, 48010, 49000, 50000, 50010, 50020,
     50110, 50120, 50130, 51000, 51010, 51020, 51110, 51120,
     52000, 52010, 52020, 53000, 53010, 53110, 53120, 53210,
     53220, 53310, 53320, 53410, 53420, 53510, 53520, 53610,
     53620, 53630, 53710, 75000, 75010, 75020, 76000, 76010,
     76110, 76120, 76210, 76220, 77000, 77010, 77110, 77120,
     77210, 77220, 77310, 78000, 78010, 78020, 80000, 80010,
     80020, 80110, 80120, 90010, 90020, 90030, 90040, 90050,
     90060, 90070, 90080, 90090, 90100, 90110, 100010,
     100020, 100030, 100040, 100050, 100060, 100070];
dungeon_feat(_) -> [].

get(1001) ->
    #quest_data{id = 1001,
		name = lang:get(<<"语言_roo_fe_02_1"/utf8>>), type = 2,
		lev = 10, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_levup, target = 0,
				     target_val = 70, param = []}],
		desc = lang:get(<<"你获得了一份神秘的礼物，快去看看吧"/utf8>>),
		commit_rewards = [{10033, 1}]};
get(40000) ->
    #quest_data{id = 40000,
		name = lang:get(<<"语言_roo_fe_01_2"/utf8>>), type = 3,
		lev = 16, pre_quest = 0, suffix_quest = 40010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 300, param = []}],
		desc = lang:get(<<"通关试练塔第300层"/utf8>>),
		commit_rewards = [{55501, 1}, {1, 100000}]};
get(40010) ->
    #quest_data{id = 40010,
		name = lang:get(<<"语言_roo_fe_01_2"/utf8>>), type = 3,
		lev = 16, pre_quest = [40000], val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_star_tower_floor_pass,
				     target = 0, target_val = 600, param = []}],
		desc = lang:get(<<"通关试练塔第600层"/utf8>>),
		commit_rewards = [{55502, 1}, {1, 100000}]};
get(41000) ->
    #quest_data{id = 41000,
		name = lang:get(<<"语言_roo_fe_01_3"/utf8>>), type = 1,
		lev = 8, pre_quest = 0, suffix_quest = 41010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_combat_pvp_over,
				     target = 0, target_val = 3,
				     param = [{win_round_less, 6}]}],
		extra = {win_round_less, 6},
		desc = lang:get(<<"PVP中，六回合内战胜战力高于自身的对手，累计3次"/utf8>>),
		commit_rewards = [{29, 3}, {3, 50}]};
get(41010) ->
    #quest_data{id = 41010,
		name = lang:get(<<"语言_roo_fe_01_4"/utf8>>), type = 1,
		lev = 8, pre_quest = [41000], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_combat_pvp_over,
				     target = 0, target_val = 3,
				     param = [{win_round_less, 4}]}],
		extra = {win_round_less, 4},
		desc = lang:get(<<"PVP中，四回合内战胜战力高于自身的对手，累计3次"/utf8>>),
		commit_rewards = [{29, 3}, {3, 100}]};
get(42000) ->
    #quest_data{id = 42000,
		name = lang:get(<<"语言_roo_fe_01_5"/utf8>>), type = 1,
		lev = 8, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_championships_end_rank,
				     target = 32, target_val = 3, param = []}],
		desc = lang:get(<<"冠军赛累计进入3次前32强"/utf8>>),
		commit_rewards = [{55411, 1}, {1, 100000}]};
get(42010) ->
    #quest_data{id = 42010,
		name = lang:get(<<"语言_roo_fe_01_6"/utf8>>), type = 1,
		lev = 8, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_championships_end_rank,
				     target = 8, target_val = 2, param = []}],
		desc = lang:get(<<"冠军赛累计进入2次前8强"/utf8>>),
		commit_rewards = [{55412, 1}, {1, 100000}]};
get(42020) ->
    #quest_data{id = 42020,
		name = lang:get(<<"语言_roo_fe_01_7"/utf8>>), type = 1,
		lev = 8, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_championships_end_rank,
				     target = 1, target_val = 1, param = []}],
		desc = lang:get(<<"获得一次冠军赛第1名"/utf8>>),
		commit_rewards = [{55413, 1}, {1, 100000}]};
get(42100) ->
    #quest_data{id = 42100,
		name = lang:get(<<"语言_roo_fe_01_8"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_cluster_championships_takepartin,
				     target = 0, target_val = 1, param = []}],
		desc = lang:get(<<"参与一次周冠军赛战斗"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 150}]};
get(42110) ->
    #quest_data{id = 42110,
		name = lang:get(<<"语言_roo_fe_01_9"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_cluster_championships_end_rank,
				     target = 64, target_val = 3, param = []}],
		desc = lang:get(<<"周冠军赛累计进入3次前64强"/utf8>>),
		commit_rewards = [{55421, 1}, {1, 100000}]};
get(42120) ->
    #quest_data{id = 42120,
		name = lang:get(<<"语言_roo_fe_01_10"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_cluster_championships_end_rank,
				     target = 8, target_val = 2, param = []}],
		desc = lang:get(<<"周冠军赛累计进入2次前8强"/utf8>>),
		commit_rewards = [{55422, 1}, {1, 100000}]};
get(42130) ->
    #quest_data{id = 42130,
		name = lang:get(<<"语言_roo_fe_01_11"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_cluster_championships_end_rank,
				     target = 1, target_val = 1, param = []}],
		desc = lang:get(<<"获得一次周冠军赛第1名"/utf8>>),
		commit_rewards = [{55423, 1}, {1, 100000}]};
get(42200) ->
    #quest_data{id = 42200,
		name = lang:get(<<"语言_roo_fe_01_12"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_peak_championships_takepartin,
				     target = 0, target_val = 1, param = []}],
		desc = lang:get(<<"参与一次巅峰冠军赛战斗"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 150}]};
get(42210) ->
    #quest_data{id = 42210,
		name = lang:get(<<"语言_roo_fe_01_13"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_peak_championships_end_rank,
				     target = 64, target_val = 3, param = []}],
		desc = lang:get(<<"巅峰冠军赛累计进入3次前64强"/utf8>>),
		commit_rewards = [{55431, 1}, {1, 100000}]};
get(42220) ->
    #quest_data{id = 42220,
		name = lang:get(<<"语言_roo_fe_01_14"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_peak_championships_end_rank,
				     target = 8, target_val = 2, param = []}],
		desc = lang:get(<<"巅峰冠军赛累计进入2次前8强"/utf8>>),
		commit_rewards = [{55432, 1}, {1, 100000}]};
get(42230) ->
    #quest_data{id = 42230,
		name = lang:get(<<"语言_roo_fe_01_15"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_peak_championships_end_rank,
				     target = 1, target_val = 1, param = []}],
		desc = lang:get(<<"获得一次巅峰冠军赛第1名"/utf8>>),
		commit_rewards = [{55433, 1}, {1, 100000}]};
get(43000) ->
    #quest_data{id = 43000,
		name = lang:get(<<"语言_roo_fe_01_16"/utf8>>), type = 3,
		lev = 10, pre_quest = 0, suffix_quest = 43010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_combat_over, target = 0,
				     target_val = 1,
				     param =
					 [{continue_hurt, [11, 26], 1,
					   1500000}]}],
		extra = {continue_hurt, [11, 26], 1, 1500000},
		desc = lang:get(<<"单场战斗累计造成150万中毒伤害"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(43010) ->
    #quest_data{id = 43010,
		name = lang:get(<<"语言_roo_fe_01_17"/utf8>>), type = 3,
		lev = 10, pre_quest = [43000], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_combat_over, target = 0,
				     target_val = 1,
				     param =
					 [{continue_hurt, [11, 26], 1,
					   3000000}]}],
		extra = {continue_hurt, [11, 26], 1, 3000000},
		desc = lang:get(<<"单场战斗累计造成300万中毒伤害"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 150}]};
get(43110) ->
    #quest_data{id = 43110,
		name = lang:get(<<"语言_roo_fe_01_18"/utf8>>), type = 3,
		lev = 10, pre_quest = 0, suffix_quest = 43120,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_combat_over, target = 0,
				     target_val = 1,
				     param =
					 [{continue_hurt, [11, 26], 2,
					   1500000}]}],
		extra = {continue_hurt, [11, 26], 2, 1500000},
		desc = lang:get(<<"单场战斗累计造成150万流血伤害"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(43120) ->
    #quest_data{id = 43120,
		name = lang:get(<<"语言_roo_fe_01_19"/utf8>>), type = 3,
		lev = 10, pre_quest = [43110], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_combat_over, target = 0,
				     target_val = 1,
				     param =
					 [{continue_hurt, [11, 26], 2,
					   3000000}]}],
		extra = {continue_hurt, [11, 26], 2, 3000000},
		desc = lang:get(<<"单场战斗累计造成300万流血伤害"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 150}]};
get(43210) ->
    #quest_data{id = 43210,
		name = lang:get(<<"语言_roo_fe_01_20"/utf8>>), type = 3,
		lev = 10, pre_quest = 0, suffix_quest = 43220,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_combat_over, target = 0,
				     target_val = 1,
				     param =
					 [{continue_hurt, [11, 26], 3,
					   1500000}]}],
		extra = {continue_hurt, [11, 26], 3, 1500000},
		desc = lang:get(<<"单场战斗累计造成150万灼烧伤害"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(43220) ->
    #quest_data{id = 43220,
		name = lang:get(<<"语言_roo_fe_01_21"/utf8>>), type = 3,
		lev = 10, pre_quest = [43210], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_combat_over, target = 0,
				     target_val = 1,
				     param =
					 [{continue_hurt, [11, 26], 3,
					   3000000}]}],
		extra = {continue_hurt, [11, 26], 3, 3000000},
		desc = lang:get(<<"单场战斗累计造成300万灼烧伤害"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 150}]};
get(44000) ->
    #quest_data{id = 44000,
		name = lang:get(<<"语言_roo_fe_01_22"/utf8>>), type = 3,
		lev = 18, pre_quest = 0, suffix_quest = 44010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_guild_dun_damage,
				     target = 0, target_val = 1500000,
				     param = []}],
		desc = lang:get(<<"公会副本中，单场战斗累计造成150万伤害"/utf8>>),
		commit_rewards = [{40112, 1}, {3, 50}]};
get(44010) ->
    #quest_data{id = 44010,
		name = lang:get(<<"语言_roo_fe_01_23"/utf8>>), type = 3,
		lev = 18, pre_quest = [44000], suffix_quest = 44020,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_guild_dun_damage,
				     target = 0, target_val = 3000000,
				     param = []}],
		desc = lang:get(<<"公会副本中，单场战斗累计造成300万伤害"/utf8>>),
		commit_rewards = [{40212, 1}, {3, 100}]};
get(44020) ->
    #quest_data{id = 44020,
		name = lang:get(<<"语言_roo_fe_01_24"/utf8>>), type = 3,
		lev = 18, pre_quest = [44010], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_guild_dun_damage,
				     target = 0, target_val = 5000000,
				     param = []}],
		desc = lang:get(<<"公会副本中，单场战斗累计造成500万伤害"/utf8>>),
		commit_rewards = [{40412, 1}, {40312, 1}]};
get(45000) ->
    #quest_data{id = 45000,
		name = lang:get(<<"语言_roo_fe_01_25"/utf8>>), type = 3,
		lev = 18, pre_quest = 0, suffix_quest = 45010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_guild_war_join_and_win,
				     target = 0, target_val = 10, param = []}],
		desc = lang:get(<<"参与并累计获得10次公会战胜利"/utf8>>),
		commit_rewards = [{55311, 1}, {1, 100000}]};
get(45010) ->
    #quest_data{id = 45010,
		name = lang:get(<<"语言_roo_fe_01_26"/utf8>>), type = 3,
		lev = 18, pre_quest = [45000], suffix_quest = 45020,
		val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_guild_war_join_and_win,
				     target = 0, target_val = 50, param = []}],
		desc = lang:get(<<"参与并累计获得50次公会战胜利"/utf8>>),
		commit_rewards = [{55312, 1}, {1, 100000}]};
get(45020) ->
    #quest_data{id = 45020,
		name = lang:get(<<"语言_roo_fe_01_27"/utf8>>), type = 3,
		lev = 18, pre_quest = [45010], val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_guild_war_join_and_win,
				     target = 0, target_val = 100, param = []}],
		desc = lang:get(<<"参与并累计获得100次公会战胜利"/utf8>>),
		commit_rewards = [{55313, 1}, {1, 100000}]};
get(46000) ->
    #quest_data{id = 46000,
		name = lang:get(<<"语言_roo_fe_01_28"/utf8>>), type = 3,
		lev = 25, pre_quest = 0, suffix_quest = 46010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 300,
				     target_val = 1, param = []}],
		desc = lang:get(<<"首次通关无尽试炼第300关"/utf8>>),
		commit_rewards = [{55301, 1}, {3, 100}]};
get(46010) ->
    #quest_data{id = 46010,
		name = lang:get(<<"语言_roo_fe_01_29"/utf8>>), type = 3,
		lev = 25, pre_quest = [46000], suffix_quest = 46020,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 450,
				     target_val = 1, param = []}],
		desc = lang:get(<<"首次通关无尽试炼第450关"/utf8>>),
		commit_rewards = [{55302, 1}, {3, 150}]};
get(46020) ->
    #quest_data{id = 46020,
		name = lang:get(<<"语言_roo_fe_01_30"/utf8>>), type = 3,
		lev = 25, pre_quest = [46010], suffix_quest = 46030,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 600,
				     target_val = 1, param = []}],
		desc = lang:get(<<"首次通关无尽试炼第600关"/utf8>>),
		commit_rewards = [{55303, 1}, {3, 200}]};
get(46030) ->
    #quest_data{id = 46030,
		name = lang:get(<<"语言_roo_fe_01_31"/utf8>>), type = 3,
		lev = 25, pre_quest = [46020], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_endless_pass, target = 900,
				     target_val = 1, param = []}],
		desc = lang:get(<<"首次通关无尽试炼第900关"/utf8>>),
		commit_rewards = [{55304, 1}, {3, 300}]};
get(46800) ->
    #quest_data{id = 46800,
		name = lang:get(<<"语言_roo_fe_01_32"/utf8>>), type = 3,
		lev = 30, pre_quest = 0, suffix_quest = 46810,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_planes_pass, target = 0,
				     target_val = 5, param = []}],
		desc = lang:get(<<"达成历练：通关第三层任意难度5次"/utf8>>),
		commit_rewards = [{55181, 1}, {1, 100000}]};
get(46810) ->
    #quest_data{id = 46810,
		name = lang:get(<<"语言_roo_fe_01_33"/utf8>>), type = 3,
		lev = 30, pre_quest = [46800], suffix_quest = 46820,
		val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_planes_pass, target = 0,
				     target_val = 10, param = []}],
		desc = lang:get(<<"达成历练：通关第三层任意难度10次"/utf8>>),
		commit_rewards = [{55182, 1}, {1, 100000}]};
get(46820) ->
    #quest_data{id = 46820,
		name = lang:get(<<"语言_roo_fe_01_34"/utf8>>), type = 3,
		lev = 30, pre_quest = [46810], suffix_quest = 46830,
		val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_planes_pass, target = 0,
				     target_val = 15, param = []}],
		desc = lang:get(<<"达成历练：通关第三层任意难度15次"/utf8>>),
		commit_rewards = [{55183, 1}, {1, 100000}]};
get(46830) ->
    #quest_data{id = 46830,
		name = lang:get(<<"语言_roo_fe_01_35"/utf8>>), type = 3,
		lev = 30, pre_quest = [46820], suffix_quest = 46840,
		val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_planes_pass, target = 0,
				     target_val = 20, param = []}],
		desc = lang:get(<<"达成历练：通关第三层任意难度20次"/utf8>>),
		commit_rewards = [{55184, 1}, {1, 100000}]};
get(46840) ->
    #quest_data{id = 46840,
		name = lang:get(<<"语言_roo_fe_01_36"/utf8>>), type = 3,
		lev = 30, pre_quest = [46830], val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_planes_pass, target = 0,
				     target_val = 30, param = []}],
		desc = lang:get(<<"达成历练：通关第三层任意难度30次"/utf8>>),
		commit_rewards = [{55185, 1}, {1, 100000}]};
get(47000) ->
    #quest_data{id = 47000,
		name = lang:get(<<"语言_roo_fe_01_37"/utf8>>), type = 3,
		lev = 30, pre_quest = 0, suffix_quest = 47010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_enter_secret_pass,
				     target = 0, target_val = 3,
				     param = [{dun_id, 1}]}],
		desc = lang:get(<<"位面征战【极冰雪原】达100%进度3次"/utf8>>),
		commit_rewards = [{55201, 1}, {1, 100000}]};
get(47010) ->
    #quest_data{id = 47010,
		name = lang:get(<<"语言_roo_fe_01_38"/utf8>>), type = 3,
		lev = 30, pre_quest = [47000], suffix_quest = 47020,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_enter_secret_pass,
				     target = 0, target_val = 3,
				     param = [{dun_id, 2}]}],
		desc = lang:get(<<"位面征战【熔火炼狱】达100%进度3次"/utf8>>),
		commit_rewards = [{55202, 1}, {1, 100000}]};
get(47020) ->
    #quest_data{id = 47020,
		name = lang:get(<<"语言_roo_fe_01_39"/utf8>>), type = 3,
		lev = 30, pre_quest = [47010], suffix_quest = 47030,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_enter_secret_pass,
				     target = 0, target_val = 3,
				     param = [{dun_id, 3}]}],
		desc = lang:get(<<"位面征战【风棘之森】达100%进度3次"/utf8>>),
		commit_rewards = [{55203, 1}, {1, 100000}]};
get(47030) ->
    #quest_data{id = 47030,
		name = lang:get(<<"语言_roo_fe_01_40"/utf8>>), type = 3,
		lev = 30, pre_quest = [47020], suffix_quest = 47040,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_enter_secret_pass,
				     target = 0, target_val = 5,
				     param = [{dun_id, 4}]}],
		desc = lang:get(<<"位面征战【神灵遗迹】达100%进度5次"/utf8>>),
		commit_rewards = [{55204, 1}, {1, 100000}]};
get(47040) ->
    #quest_data{id = 47040,
		name = lang:get(<<"语言_roo_fe_01_41"/utf8>>), type = 3,
		lev = 30, pre_quest = [47030], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_enter_secret_pass,
				     target = 0, target_val = 5,
				     param = [{dun_id, 5}]}],
		desc = lang:get(<<"位面征战【荒黯之墟】达100%进度5次"/utf8>>),
		commit_rewards = [{55205, 1}, {1, 100000}]};
get(48000) ->
    #quest_data{id = 48000,
		name = lang:get(<<"语言_roo_fe_01_42"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_get_item, target = 10454,
				     target_val = 10, param = []}],
		desc = lang:get(<<"累计获得10个彩虹符文"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 100}]};
get(48010) ->
    #quest_data{id = 48010,
		name = lang:get(<<"语言_roo_fe_01_43"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_get_item, target = 10455,
				     target_val = 10, param = []}],
		desc = lang:get(<<"累计获得10个闪烁符文"/utf8>>),
		commit_rewards = [{37002, 3}, {3, 200}]};
get(49000) ->
    #quest_data{id = 49000,
		name = lang:get(<<"语言_roo_fe_01_44"/utf8>>), type = 2,
		lev = 35, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_friend_cluster, target = 0,
				     target_val = 10, param = [num]}],
		desc = lang:get(<<"拥有10个跨服好友"/utf8>>),
		commit_rewards = [{37001, 5}, {3, 100}]};
get(50000) ->
    #quest_data{id = 50000,
		name = lang:get(<<"语言_roo_fe_01_45"/utf8>>), type = 3,
		lev = 55, pre_quest = 0, suffix_quest = 50010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_adventure_goto_floor,
				     target = 40, target_val = 1, param = []}],
		desc = lang:get(<<"进入神界冒险第40层"/utf8>>),
		commit_rewards = [{55401, 1}, {1, 100000}]};
get(50010) ->
    #quest_data{id = 50010,
		name = lang:get(<<"语言_roo_fe_01_46"/utf8>>), type = 3,
		lev = 55, pre_quest = [50000], suffix_quest = 50020,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_adventure_goto_floor,
				     target = 70, target_val = 1, param = []}],
		desc = lang:get(<<"进入神界冒险第70层"/utf8>>),
		commit_rewards = [{55402, 1}, {1, 100000}]};
get(50020) ->
    #quest_data{id = 50020,
		name = lang:get(<<"语言_roo_fe_01_47"/utf8>>), type = 3,
		lev = 55, pre_quest = [50010], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_adventure_goto_floor,
				     target = 90, target_val = 1, param = []}],
		desc = lang:get(<<"进入神界冒险第90层"/utf8>>),
		commit_rewards = [{55403, 1}, {1, 100000}]};
get(50110) ->
    #quest_data{id = 50110,
		name = lang:get(<<"语言_roo_fe_01_48"/utf8>>), type = 3,
		lev = 55, pre_quest = 0, suffix_quest = 50120,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_adventure_kill_mon,
				     target = 0, target_val = 500, param = []}],
		desc = lang:get(<<"神界冒险累计击杀500个守卫"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 50}]};
get(50120) ->
    #quest_data{id = 50120,
		name = lang:get(<<"语言_roo_fe_01_49"/utf8>>), type = 3,
		lev = 55, pre_quest = [50110], suffix_quest = 50130,
		val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_adventure_kill_mon,
				     target = 0, target_val = 2000,
				     param = []}],
		desc = lang:get(<<"神界冒险累计击杀2000个守卫"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 100}]};
get(50130) ->
    #quest_data{id = 50130,
		name = lang:get(<<"语言_roo_fe_01_50"/utf8>>), type = 3,
		lev = 55, pre_quest = [50120], val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_adventure_kill_mon,
				     target = 0, target_val = 5000,
				     param = []}],
		desc = lang:get(<<"神界冒险累计击杀5000个守卫"/utf8>>),
		commit_rewards = [{37002, 3}, {3, 150}]};
get(51000) ->
    #quest_data{id = 51000,
		name = lang:get(<<"语言_roo_fe_01_51"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, suffix_quest = 51010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_sky_ladder_win, target = 0,
				     target_val = 100, param = []}],
		desc = lang:get(<<"跨服天梯累计挑战胜利100次"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 50}]};
get(51010) ->
    #quest_data{id = 51010,
		name = lang:get(<<"语言_roo_fe_01_52"/utf8>>), type = 1,
		lev = 55, pre_quest = [51000], suffix_quest = 51020,
		val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_sky_ladder_win, target = 0,
				     target_val = 300, param = []}],
		desc = lang:get(<<"跨服天梯累计挑战胜利300次"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 100}]};
get(51020) ->
    #quest_data{id = 51020,
		name = lang:get(<<"语言_roo_fe_01_53"/utf8>>), type = 1,
		lev = 55, pre_quest = [51010], val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_sky_ladder_win, target = 0,
				     target_val = 600, param = []}],
		desc = lang:get(<<"跨服天梯累计挑战胜利600次"/utf8>>),
		commit_rewards = [{37002, 3}, {3, 150}]};
get(51110) ->
    #quest_data{id = 51110,
		name = lang:get(<<"语言_roo_fe_01_54"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_sky_ladder_end_rank,
				     target = 20, target_val = 1, param = []}],
		desc = lang:get(<<"跨服天梯赛季结算时获得前20名"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(51120) ->
    #quest_data{id = 51120,
		name = lang:get(<<"语言_roo_fe_01_55"/utf8>>), type = 1,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_sky_ladder_end_rank,
				     target = 1, target_val = 1, param = []}],
		desc = lang:get(<<"跨服天梯赛季结算时获得第1名"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 150}]};
get(52000) ->
    #quest_data{id = 52000,
		name = lang:get(<<"语言_roo_fe_01_56"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, suffix_quest = 52010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_power, target = 0,
				     target_val = 1000000, param = []}],
		desc = lang:get(<<"最高战力达到100万"/utf8>>),
		commit_rewards = [{55702, 1}, {1, 100000}]};
get(52010) ->
    #quest_data{id = 52010,
		name = lang:get(<<"语言_roo_fe_01_57"/utf8>>), type = 2,
		lev = 55, pre_quest = [52000], suffix_quest = 52020,
		val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_power, target = 0,
				     target_val = 2000000, param = []}],
		desc = lang:get(<<"最高战力达到200万"/utf8>>),
		commit_rewards = [{55703, 1}, {1, 100000}]};
get(52020) ->
    #quest_data{id = 52020,
		name = lang:get(<<"语言_roo_fe_01_57"/utf8>>), type = 2,
		lev = 55, pre_quest = [52010], val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_power, target = 0,
				     target_val = 3500000, param = []}],
		desc = lang:get(<<"最高战力达到350万"/utf8>>),
		commit_rewards = [{55704, 1}, {1, 100000}]};
get(53000) ->
    #quest_data{id = 53000,
		name = lang:get(<<"语言_roo_fe_01_58"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, suffix_quest = 53010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 5,
				     param = [{bind_star2, 10}]}],
		extra = {bind_star, 10},
		desc = lang:get(<<"当前拥有5个10星英雄"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 100}]};
get(53010) ->
    #quest_data{id = 53010,
		name = lang:get(<<"语言_roo_fe_01_60"/utf8>>), type = 2,
		lev = 55, pre_quest = [53000], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 5,
				     param = [{bind_star2, 11}]}],
		extra = {bind_star, 11},
		desc = lang:get(<<"当前拥有5个11星英雄"/utf8>>),
		commit_rewards = [{37002, 3}, {3, 200}]};
get(53110) ->
    #quest_data{id = 53110,
		name = lang:get(<<"语言_roo_fe_01_61"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, suffix_quest = 53120,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 3,
				     param = [{bind_star2, 10, 1}]}],
		extra = {bind_star, 10, 1},
		desc = lang:get(<<"使3个水系英雄达到10星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 150}]};
get(53120) ->
    #quest_data{id = 53120,
		name = lang:get(<<"语言_roo_fe_01_62"/utf8>>), type = 2,
		lev = 55, pre_quest = [53110], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1,
				     param = [{bind_star2, 11, 1}]}],
		extra = {bind_star, 11, 1},
		desc = lang:get(<<"使1个水系英雄达到11星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 200}]};
get(53210) ->
    #quest_data{id = 53210,
		name = lang:get(<<"语言_roo_fe_01_63"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, suffix_quest = 53220,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 3,
				     param = [{bind_star2, 10, 2}]}],
		extra = {bind_star, 10, 2},
		desc = lang:get(<<"使3个火系英雄达到10星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 150}]};
get(53220) ->
    #quest_data{id = 53220,
		name = lang:get(<<"语言_roo_fe_01_64"/utf8>>), type = 2,
		lev = 55, pre_quest = [53210], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1,
				     param = [{bind_star2, 11, 2}]}],
		extra = {bind_star, 11, 2},
		desc = lang:get(<<"使1个火系英雄达到11星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 200}]};
get(53310) ->
    #quest_data{id = 53310,
		name = lang:get(<<"语言_roo_fe_01_66"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, suffix_quest = 53320,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 3,
				     param = [{bind_star2, 10, 3}]}],
		extra = {bind_star, 10, 3},
		desc = lang:get(<<"使3个风系英雄达到10星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 150}]};
get(53320) ->
    #quest_data{id = 53320,
		name = lang:get(<<"语言_roo_fe_01_66"/utf8>>), type = 2,
		lev = 55, pre_quest = [53310], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1,
				     param = [{bind_star2, 11, 3}]}],
		extra = {bind_star, 11, 3},
		desc = lang:get(<<"使1个风系英雄达到11星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 200}]};
get(53410) ->
    #quest_data{id = 53410,
		name = lang:get(<<"语言_roo_fe_01_67"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, suffix_quest = 53420,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 3,
				     param = [{bind_star2, 10, 4}]}],
		extra = {bind_star, 10, 4},
		desc = lang:get(<<"使3个光系英雄达到10星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 150}]};
get(53420) ->
    #quest_data{id = 53420,
		name = lang:get(<<"语言_roo_fe_01_68"/utf8>>), type = 2,
		lev = 55, pre_quest = [53410], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1,
				     param = [{bind_star2, 11, 4}]}],
		extra = {bind_star, 11, 4},
		desc = lang:get(<<"使1个光系英雄达到11星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 200}]};
get(53510) ->
    #quest_data{id = 53510,
		name = lang:get(<<"语言_roo_fe_01_69"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, suffix_quest = 53520,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 3,
				     param = [{bind_star2, 10, 5}]}],
		extra = {bind_star, 10, 5},
		desc = lang:get(<<"使3个暗系英雄达到10星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 150}]};
get(53520) ->
    #quest_data{id = 53520,
		name = lang:get(<<"语言_roo_fe_01_70"/utf8>>), type = 2,
		lev = 55, pre_quest = [53510], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1,
				     param = [{bind_star2, 11, 5}]}],
		extra = {bind_star, 11, 5},
		desc = lang:get(<<"使1个暗系英雄达到11星"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 200}]};
get(53610) ->
    #quest_data{id = 53610,
		name = lang:get(<<"语言_roo_fe_01_71"/utf8>>), type = 2,
		lev = 8, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_championships_bet_cont_win_day,
				     target = 0, target_val = 11, param = []}],
		desc = lang:get(<<"任意一届冠军赛中11场竞猜全部正确"/utf8>>),
		commit_rewards = [{55701, 1}, {1, 100000}]};
get(53620) ->
    #quest_data{id = 53620,
		name = lang:get(<<"语言_roo_fe_01_72"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_cluster_championships_bet_cont_win_day,
				     target = 0, target_val = 12, param = []}],
		desc = lang:get(<<"任意一届周冠军赛中12场竞猜全部正确"/utf8>>),
		commit_rewards = [{55707, 1}, {1, 100000}]};
get(53630) ->
    #quest_data{id = 53630,
		name = lang:get(<<"语言_roo_fe_01_73"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label =
					 evt_peak_championships_bet_cont_win_season,
				     target = 0, target_val = 14, param = []}],
		desc = lang:get(<<"任意一届巅峰冠军赛中14场竞猜全部正确"/utf8>>),
		commit_rewards = [{55708, 1}, {1, 100000}]};
get(53710) ->
    #quest_data{id = 53710,
		name = lang:get(<<"语言_roo_fe_01_74"/utf8>>), type = 2,
		lev = 170, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partner, target = 0,
				     target_val = 1,
				     param = [{bind_star2, 13}]}],
		extra = {bind_star, 13},
		desc = lang:get(<<"获得一位13星英雄"/utf8>>),
		commit_rewards = [{55709, 1}, {1, 100000}]};
get(75000) ->
    #quest_data{id = 75000,
		name = lang:get(<<"语言_roo_fe_01_75"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partnerskill_learn,
				     target = 0, target_val = 10,
				     param = [{skill_lev, 1}]}],
		extra = {skill_lev, 1},
		desc = lang:get(<<"累计领悟10个初级技能"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 50}]};
get(75010) ->
    #quest_data{id = 75010,
		name = lang:get(<<"语言_roo_fe_01_76"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partnerskill_learn,
				     target = 0, target_val = 10,
				     param = [{skill_lev, 2}]}],
		extra = {skill_lev, 2},
		desc = lang:get(<<"累计领悟10个中级技能"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 100}]};
get(75020) ->
    #quest_data{id = 75020,
		name = lang:get(<<"语言_roo_fe_01_77"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_partnerskill_learn,
				     target = 0, target_val = 10,
				     param = [{skill_lev, 3}]}],
		extra = {skill_lev, 3},
		desc = lang:get(<<"累计领悟10个高级技能"/utf8>>),
		commit_rewards = [{37002, 3}, {3, 150}]};
get(76000) ->
    #quest_data{id = 76000,
		name = lang:get(<<"语言_roo_fe_01_78"/utf8>>), type = 3,
		lev = 90, pre_quest = 0, suffix_quest = 76010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_element_temple_pass,
				     target = 6, target_val = 1,
				     param = [pass]}],
		desc = lang:get(<<"通关任意圣殿的第6关"/utf8>>),
		commit_rewards = [{55101, 1}, {1, 100000}]};
get(76010) ->
    #quest_data{id = 76010,
		name = lang:get(<<"语言_roo_fe_01_79"/utf8>>), type = 3,
		lev = 90, pre_quest = [76000], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_element_temple_pass,
				     target = 6, target_val = 1,
				     param = [{five_dept_pass}]}],
		extra = {five_dept_pass},
		desc = lang:get(<<"本周内通过每个圣殿的第6关"/utf8>>),
		commit_rewards = [{55102, 1}, {1, 100000}]};
get(76110) ->
    #quest_data{id = 76110,
		name = lang:get(<<"语言_roo_fe_01_80"/utf8>>), type = 3,
		lev = 90, pre_quest = 0, suffix_quest = 76120,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_element_temple_pass,
				     target = 10, target_val = 1,
				     param = [pass]}],
		desc = lang:get(<<"通关任意圣殿的第10关"/utf8>>),
		commit_rewards = [{55103, 1}, {1, 100000}]};
get(76120) ->
    #quest_data{id = 76120,
		name = lang:get(<<"语言_roo_fe_01_81"/utf8>>), type = 3,
		lev = 90, pre_quest = [76110], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_element_temple_pass,
				     target = 10, target_val = 1,
				     param = [{five_dept_pass}]}],
		extra = {five_dept_pass},
		desc = lang:get(<<"本周内通过每个圣殿的第10关"/utf8>>),
		commit_rewards = [{55104, 1}, {1, 100000}]};
get(76210) ->
    #quest_data{id = 76210,
		name = lang:get(<<"语言_roo_fe_01_82"/utf8>>), type = 3,
		lev = 90, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_element_temple_end_rank,
				     target = 10, target_val = 3, param = []}],
		desc = lang:get(<<"排行榜结算时累计获得3次前10名"/utf8>>),
		commit_rewards = [{29, 3}, {3, 100}]};
get(76220) ->
    #quest_data{id = 76220,
		name = lang:get(<<"语言_roo_fe_01_83"/utf8>>), type = 3,
		lev = 90, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_element_temple_end_rank,
				     target = 3, target_val = 3, param = []}],
		desc = lang:get(<<"排行榜结算时累计获得3次前3名"/utf8>>),
		commit_rewards = [{29, 3}, {3, 150}]};
get(77000) ->
    #quest_data{id = 77000,
		name = lang:get(<<"语言_roo_fe_01_84"/utf8>>), type = 1,
		lev = 100, pre_quest = 0, suffix_quest = 77010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_elite_win_count,
				     target = 0, target_val = 100, param = []}],
		desc = lang:get(<<"超凡段位赛累计获胜100场"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(77010) ->
    #quest_data{id = 77010,
		name = lang:get(<<"语言_roo_fe_01_85"/utf8>>), type = 1,
		lev = 100, pre_quest = [77000], val_from_prev = 1,
		progress =
		    [#quest_progress{label = evt_arena_elite_win_count,
				     target = 0, target_val = 1000,
				     param = []}],
		desc = lang:get(<<"超凡段位赛累计获胜1000场"/utf8>>),
		commit_rewards = [{37002, 3}, {3, 150}]};
get(77110) ->
    #quest_data{id = 77110,
		name = lang:get(<<"语言_roo_fe_01_86"/utf8>>), type = 1,
		lev = 100, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_elite_end_lev,
				     target = 0, target_val = 1,
				     param = [{lev, 7}]}],
		extra = {lev, 7},
		desc = lang:get(<<"超凡段位赛赛季结算时达到铂金及以上段位"/utf8>>),
		commit_rewards = [{55601, 1}, {1, 100000}]};
get(77120) ->
    #quest_data{id = 77120,
		name = lang:get(<<"语言_roo_fe_01_87"/utf8>>), type = 1,
		lev = 100, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_elite_end_lev,
				     target = 0, target_val = 1,
				     param = [{lev, 10}]}],
		extra = {lev, 10},
		desc = lang:get(<<"超凡段位赛赛季结算时达到钻石及以上段位"/utf8>>),
		commit_rewards = [{55602, 1}, {1, 100000}]};
get(77210) ->
    #quest_data{id = 77210,
		name = lang:get(<<"语言_roo_fe_01_88"/utf8>>), type = 1,
		lev = 100, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_elite_end_rank,
				     target = 10, target_val = 1, param = []}],
		desc = lang:get(<<"超凡段位赛赛季结算时获得前10名"/utf8>>),
		commit_rewards = [{55603, 1}, {1, 100000}]};
get(77220) ->
    #quest_data{id = 77220,
		name = lang:get(<<"语言_roo_fe_01_89"/utf8>>), type = 1,
		lev = 100, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_elite_end_rank,
				     target = 1, target_val = 1, param = []}],
		desc = lang:get(<<"超凡段位赛赛季结算时获得第1名"/utf8>>),
		commit_rewards = [{55604, 1}, {1, 100000}]};
get(77310) ->
    #quest_data{id = 77310,
		name = lang:get(<<"语言_roo_fe_01_90"/utf8>>), type = 1,
		lev = 100, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_elite_champion,
				     target = 0, target_val = 1,
				     param = [{combat_type, 24}]}],
		desc = lang:get(<<"参与一次王者赛"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 100}]};
get(78000) ->
    #quest_data{id = 78000,
		name = lang:get(<<"语言_roo_fe_01_91"/utf8>>), type = 3,
		lev = 105, pre_quest = 0, suffix_quest = 78010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_dun_heaven_perfectpass,
				     target = 12, target_val = 1, param = []}],
		desc = lang:get(<<"完美通关天界副本前12章"/utf8>>),
		commit_rewards = [{17210, 3}, {3, 50}]};
get(78010) ->
    #quest_data{id = 78010,
		name = lang:get(<<"语言_roo_fe_01_92"/utf8>>), type = 3,
		lev = 105, pre_quest = [78000], suffix_quest = 78020,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_dun_heaven_perfectpass,
				     target = 24, target_val = 1, param = []}],
		desc = lang:get(<<"完美通关天界副本前24章"/utf8>>),
		commit_rewards = [{17210, 3}, {3, 50}]};
get(78020) ->
    #quest_data{id = 78020,
		name = lang:get(<<"语言_roo_fe_01_93"/utf8>>), type = 3,
		lev = 105, pre_quest = [78010], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_dun_heaven_perfectpass,
				     target = 36, target_val = 1, param = []}],
		desc = lang:get(<<"完美通关天界副本前36章"/utf8>>),
		commit_rewards = [{17211, 3}, {3, 50}]};
get(80000) ->
    #quest_data{id = 80000,
		name = lang:get(<<"语言_roo_fe_01_94"/utf8>>), type = 1,
		lev = 115, pre_quest = 0, suffix_quest = 80010,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_cluster_win,
				     target = 0, target_val = 100, param = []}],
		desc = lang:get(<<"跨服竞技场累计获胜100场"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 50}]};
get(80010) ->
    #quest_data{id = 80010,
		name = lang:get(<<"语言_roo_fe_01_95"/utf8>>), type = 1,
		lev = 115, pre_quest = [80000], suffix_quest = 80020,
		val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_cluster_win,
				     target = 0, target_val = 1000,
				     param = []}],
		desc = lang:get(<<"跨服竞技场累计获胜1000场"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 100}]};
get(80020) ->
    #quest_data{id = 80020,
		name = lang:get(<<"语言_roo_fe_01_96"/utf8>>), type = 1,
		pre_quest = [80010], val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_cluster_win,
				     target = 0, target_val = 2500,
				     param = []}],
		desc = lang:get(<<"跨服竞技场累计获胜2500场"/utf8>>),
		commit_rewards = [{37002, 3}, {3, 150}]};
get(80110) ->
    #quest_data{id = 80110,
		name = lang:get(<<"语言_roo_fe_01_97"/utf8>>), type = 1,
		lev = 115, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_cluster_end_rank,
				     target = 10, target_val = 1, param = []}],
		desc = lang:get(<<"跨服竞技场赛季结算时获得前10名"/utf8>>),
		commit_rewards = [{29, 3}, {3, 100}]};
get(80120) ->
    #quest_data{id = 80120,
		name = lang:get(<<"语言_roo_fe_01_98"/utf8>>), type = 1,
		lev = 115, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_cluster_end_rank,
				     target = 1, target_val = 1, param = []}],
		desc = lang:get(<<"跨服竞技场赛季结算时获得第1名"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 150}]};
get(90010) ->
    #quest_data{id = 90010,
		name = lang:get(<<"语言_roo_fe_01_99"/utf8>>), type = 2,
		lev = 10, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_artifact_recast_skills,
				     target = 0, target_val = 1,
				     param = [{skill, [700075, 700305]}]}],
		extra = {700075, 700305},
		desc = lang:get(<<"出现拥有高级迅捷+高级迟缓的符文"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 150}]};
get(90020) ->
    #quest_data{id = 90020,
		name = lang:get(<<"语言_roo_fe_01_99"/utf8>>), type = 2,
		lev = 10, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_artifact_recast_skills,
				     target = 0, target_val = 1,
				     param = [{skill, [750202, 750002]}]}],
		extra = {750202, 750002},
		desc = lang:get(<<"出现拥有高级物连+高级法连的符文"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 150}]};
get(90030) ->
    #quest_data{id = 90030,
		name = lang:get(<<"语言_roo_fe_01_100"/utf8>>), type = 2,
		lev = 10, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_recruit, target = 200,
				     target_val = 3, param = [{bind_star, 5}]}],
		extra = {bind_star, 5},
		desc = lang:get(<<"友情召唤累计获得3个五星英雄"/utf8>>),
		commit_rewards = [{55705, 1}, {1, 100000}]};
get(90040) ->
    #quest_data{id = 90040,
		name = lang:get(<<"语言_roo_fe_01_101"/utf8>>), type = 2,
		lev = 10, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_recruit, target = 100,
				     target_val = 3, param = [{bind_star, 5}]}],
		extra = {bind_star, 5},
		desc = lang:get(<<"普通召唤累计获得3个五星英雄"/utf8>>),
		commit_rewards = [{55706, 1}, {1, 100000}]};
get(90050) ->
    #quest_data{id = 90050,
		name = lang:get(<<"语言_roo_fe_01_102"/utf8>>), type = 2,
		lev = 18, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_guild_redpacket_best,
				     target = 0, target_val = 3, param = []}],
		desc = lang:get(<<"获得3次公会红包的手气最佳"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(90060) ->
    #quest_data{id = 90060,
		name = lang:get(<<"语言_roo_fe_01_103"/utf8>>), type = 2,
		lev = 18, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_guild_donate_expend,
				     target = 0, target_val = 30000,
				     param = [{item, 15}]}],
		extra = {item, 15},
		desc = lang:get(<<"公会捐献累计捐献3万钻石"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(90070) ->
    #quest_data{id = 90070,
		name = lang:get(<<"语言_roo_fe_01_104"/utf8>>), type = 2,
		lev = 55, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_adventure_finger_guessing,
				     target = 1, target_val = 100, param = []}],
		desc = lang:get(<<"冒险猜拳累计获胜100次"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(90080) ->
    #quest_data{id = 90080,
		name = lang:get(<<"语言_roo_fe_01_105"/utf8>>), type = 2,
		lev = 10, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_combat_balance, target = 0,
				     target_val = 100, param = []}],
		desc = lang:get(<<"战斗中累计触发100次天平模式"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(90090) ->
    #quest_data{id = 90090,
		name = lang:get(<<"语言_roo_fe_01_106"/utf8>>), type = 2,
		lev = 18, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_guild_mem_red_packet_price,
				     target = 0, target_val = 50000,
				     param = [{item, 3}]}],
		extra = {item, 3},
		desc = lang:get(<<"发放的红包累计超过5万钻石"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 100}]};
get(90100) ->
    #quest_data{id = 90100,
		name = lang:get(<<"语言_roo_fe_01_107"/utf8>>), type = 2,
		lev = 10, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_pass_holiday_boss_new,
				     target = 15, target_val = 1,
				     param = [{difficulty, 5}]}],
		extra = {difficulty, 5},
		desc = lang:get(<<"试炼之境击杀难度5及以上难度第15关boss"/utf8>>),
		commit_rewards = [{55801, 1}, {1, 100000}]};
get(90110) ->
    #quest_data{id = 90110,
		name = lang:get(<<"语言_roo_fe_01_108"/utf8>>), type = 2,
		lev = 10, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_charge_acc, target = 0,
				     target_val = 100000, param = []}],
		desc = lang:get(<<"累计充值100000钻石"/utf8>>),
		commit_rewards = [{55802, 1}, {1, 100000}]};
get(100010) ->
    #quest_data{id = 100010,
		name = lang:get(<<"语言_roo_fe_01_109"/utf8>>), type = 1,
		lev = 70, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_team_win, target = 0,
				     target_val = 100, param = []}],
		desc = lang:get(<<"组队竞技场队伍累计胜利100次（队伍挑战次数）"/utf8>>),
		commit_rewards = [{10403, 1}, {3, 50}]};
get(100020) ->
    #quest_data{id = 100020,
		name = lang:get(<<"语言_roo_fe_01_110"/utf8>>), type = 1,
		lev = 70, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_team_leader_join,
				     target = 0, target_val = 100, param = []}],
		desc = lang:get(<<"作为队长参与组队竞技场挑战100次（队伍挑战次数）"/utf8>>),
		commit_rewards = [{55901, 1}, {3, 100}]};
get(100030) ->
    #quest_data{id = 100030,
		name = lang:get(<<"语言_roo_fe_01_111"/utf8>>), type = 1,
		lev = 70, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_team_two_win,
				     target = 0, target_val = 75, param = []}],
		desc =
		    lang:get(<<"组队竞技场仅用己方前两位出战的选手就击败了对方全部选手累计75次"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 100}]};
get(100040) ->
    #quest_data{id = 100040,
		name = lang:get(<<"语言_roo_fe_01_112"/utf8>>), type = 1,
		lev = 70, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_team_season_five,
				     target = 0, target_val = 3, param = []}],
		desc = lang:get(<<"累计获得组队竞技场赛季结算前5名3次"/utf8>>),
		commit_rewards = [{55902, 1}, {3, 150}]};
get(100050) ->
    #quest_data{id = 100050,
		name = lang:get(<<"语言_roo_fe_01_113"/utf8>>), type = 1,
		lev = 70, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_team_season_one,
				     target = 0, target_val = 1, param = []}],
		desc = lang:get(<<"获得组队竞技场赛季结算第1名1次"/utf8>>),
		commit_rewards = [{55903, 1}, {3, 150}]};
get(100060) ->
    #quest_data{id = 100060,
		name = lang:get(<<"语言_roo_fe_01_114"/utf8>>), type = 1,
		lev = 70, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_team_first,
				     target = 0, target_val = 25, param = []}],
		desc = lang:get(<<"作为队伍首个出战的选手击败对方全部三位选手累计25次"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 150}]};
get(100070) ->
    #quest_data{id = 100070,
		name = lang:get(<<"语言_roo_fe_01_115"/utf8>>), type = 1,
		lev = 70, pre_quest = 0, val_from_prev = 0,
		progress =
		    [#quest_progress{label = evt_arena_team_last,
				     target = 0, target_val = 25, param = []}],
		desc = lang:get(<<"作为队伍最后出战的选手击败对方全部三位选手累计25次"/utf8>>),
		commit_rewards = [{37002, 1}, {3, 150}]};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      room_feat_data, 1571),
    undefined.

get_point(1001) -> 200;
get_point(1002) -> 500;
get_point(2001) -> 50;
get_point(2002) -> 200;
get_point(2003) -> 500;
get_point(2004) -> 800;
get_point(2081) -> 50;
get_point(2082) -> 200;
get_point(2083) -> 500;
get_point(2084) -> 800;
get_point(2085) -> 1000;
get_point(3001) -> 50;
get_point(3002) -> 200;
get_point(3003) -> 500;
get_point(3004) -> 800;
get_point(3005) -> 1000;
get_point(4001) -> 50;
get_point(4002) -> 200;
get_point(4003) -> 500;
get_point(5001) -> 50;
get_point(5002) -> 200;
get_point(5003) -> 500;
get_point(6001) -> 50;
get_point(6002) -> 200;
get_point(6003) -> 500;
get_point(6011) -> 50;
get_point(6012) -> 200;
get_point(6013) -> 500;
get_point(6021) -> 50;
get_point(6022) -> 200;
get_point(6023) -> 500;
get_point(7001) -> 200;
get_point(7002) -> 500;
get_point(7003) -> 500;
get_point(7004) -> 1200;
get_point(8001) -> 50;
get_point(8002) -> 200;
get_point(8003) -> 1200;
get_point(8004) -> 1200;
get_point(9001) -> 200;
get_point(9007) -> 200;
get_point(9008) -> 200;
get_point(9009) -> 500;
get_point(9002) -> 50;
get_point(9003) -> 200;
get_point(9004) -> 500;
get_point(9005) -> 200;
get_point(9006) -> 200;
get_point(9101) -> 200;
get_point(9102) -> 200;
get_point(9103) -> 200;
get_point(9104) -> 200;
get_point(9105) -> 200;
get_point(9106) -> 200;
get_point(9107) -> 200;
get_point(9108) -> 200;
get_point(9109) -> 200;
get_point(9201) -> 500;
get_point(9202) -> 800;
get_point(9203) -> 1200;
get_point(_) -> 0.

get_badges_name(1001) ->
    {lang:get(<<"试练·突破者"/utf8>>), 3};
get_badges_name(1002) ->
    {lang:get(<<"试练·引领者"/utf8>>), 4};
get_badges_name(2001) ->
    {lang:get(<<"无尽·初级"/utf8>>), 3};
get_badges_name(2002) ->
    {lang:get(<<"无尽·中级"/utf8>>), 4};
get_badges_name(2003) ->
    {lang:get(<<"无尽·高级"/utf8>>), 5};
get_badges_name(2004) ->
    {lang:get(<<"无尽·巅峰"/utf8>>), 5};
get_badges_name(2081) ->
    {lang:get(<<"位面·探险"/utf8>>), 4};
get_badges_name(2082) ->
    {lang:get(<<"位面·突破"/utf8>>), 4};
get_badges_name(2083) ->
    {lang:get(<<"位面·引领"/utf8>>), 4};
get_badges_name(2084) ->
    {lang:get(<<"位面·巅峰"/utf8>>), 5};
get_badges_name(2085) ->
    {lang:get(<<"位面·征战"/utf8>>), 5};
get_badges_name(3001) ->
    {lang:get(<<"位面征战·水"/utf8>>), 4};
get_badges_name(3002) ->
    {lang:get(<<"位面征战·火"/utf8>>), 4};
get_badges_name(3003) ->
    {lang:get(<<"位面征战·风"/utf8>>), 4};
get_badges_name(3004) ->
    {lang:get(<<"位面征战·光"/utf8>>), 5};
get_badges_name(3005) ->
    {lang:get(<<"位面征战·暗"/utf8>>), 5};
get_badges_name(4001) -> {lang:get(<<"攻无不克"/utf8>>), 3};
get_badges_name(4002) -> {lang:get(<<"战无不胜"/utf8>>), 4};
get_badges_name(4003) -> {lang:get(<<"所向披靡"/utf8>>), 5};
get_badges_name(5001) -> {lang:get(<<"寻宝者"/utf8>>), 3};
get_badges_name(5002) -> {lang:get(<<"探险者"/utf8>>), 4};
get_badges_name(5003) -> {lang:get(<<"大探险家"/utf8>>), 5};
get_badges_name(6001) ->
    {lang:get(<<"冠军赛·32强"/utf8>>), 3};
get_badges_name(6002) ->
    {lang:get(<<"冠军赛·8强"/utf8>>), 4};
get_badges_name(6003) -> {lang:get(<<"冠军之冕"/utf8>>), 5};
get_badges_name(6011) ->
    {lang:get(<<"荣耀之冠·64强"/utf8>>), 3};
get_badges_name(6012) ->
    {lang:get(<<"荣耀之冠·8强"/utf8>>), 4};
get_badges_name(6013) -> {lang:get(<<"勇冠神界"/utf8>>), 5};
get_badges_name(6021) ->
    {lang:get(<<"巅峰荣耀·64强"/utf8>>), 3};
get_badges_name(6022) ->
    {lang:get(<<"巅峰荣耀·8强"/utf8>>), 4};
get_badges_name(6023) -> {lang:get(<<"众神之巅"/utf8>>), 5};
get_badges_name(7001) -> {lang:get(<<"元素之力"/utf8>>), 3};
get_badges_name(7002) -> {lang:get(<<"元素掌控"/utf8>>), 4};
get_badges_name(7003) -> {lang:get(<<"元素领主"/utf8>>), 4};
get_badges_name(7004) -> {lang:get(<<"元素主宰"/utf8>>), 5};
get_badges_name(8001) -> {lang:get(<<"赛季精英"/utf8>>), 3};
get_badges_name(8002) -> {lang:get(<<"强者之证"/utf8>>), 4};
get_badges_name(8003) -> {lang:get(<<"王者之心"/utf8>>), 5};
get_badges_name(8004) -> {lang:get(<<"超凡之巅"/utf8>>), 5};
get_badges_name(9001) -> {lang:get(<<"神明眷顾"/utf8>>), 4};
get_badges_name(9007) -> {lang:get(<<"神之恩宠"/utf8>>), 4};
get_badges_name(9008) -> {lang:get(<<"智慧之神"/utf8>>), 5};
get_badges_name(9009) -> {lang:get(<<"神力觉醒"/utf8>>), 5};
get_badges_name(9002) -> {lang:get(<<"初露锋芒"/utf8>>), 3};
get_badges_name(9003) -> {lang:get(<<"冠绝一时"/utf8>>), 4};
get_badges_name(9004) -> {lang:get(<<"谁与争锋"/utf8>>), 5};
get_badges_name(9005) -> {lang:get(<<"欧气满满"/utf8>>), 4};
get_badges_name(9006) -> {lang:get(<<"欧皇降临"/utf8>>), 4};
get_badges_name(9101) -> {lang:get(<<"试炼之境"/utf8>>), 4};
get_badges_name(9102) ->
    {lang:get(<<"黄金的勇者"/utf8>>), 4};
get_badges_name(9103) ->
    {lang:get(<<"冒险的领航人"/utf8>>), 4};
get_badges_name(9104) ->
    {lang:get(<<"皇家骑士团"/utf8>>), 4};
get_badges_name(9105) ->
    {lang:get(<<"智慧之贤者"/utf8>>), 4};
get_badges_name(9106) -> {lang:get(<<"试炼之星"/utf8>>), 4};
get_badges_name(9107) ->
    {lang:get(<<"奇境探险家"/utf8>>), 4};
get_badges_name(9108) ->
    {lang:get(<<"冒险嘉年华"/utf8>>), 4};
get_badges_name(9109) ->
    {lang:get(<<"金瑞贺新春"/utf8>>), 4};
get_badges_name(9201) ->
    {lang:get(<<"友谊与荣耀"/utf8>>), 4};
get_badges_name(9202) -> {lang:get(<<"勇攀高峰"/utf8>>), 4};
get_badges_name(9203) -> {lang:get(<<"群山之巅"/utf8>>), 5};
get_badges_name(_) -> {<<>>, 2}.

get_honor_name(Point) when Point >= 50000 ->
    lang:get(<<"耀光公爵"/utf8>>);
get_honor_name(Point) when Point >= 10000 ->
    lang:get(<<"红莲伯爵"/utf8>>);
get_honor_name(Point) when Point >= 5000 ->
    lang:get(<<"雷霆子爵"/utf8>>);
get_honor_name(Point) when Point >= 2000 ->
    lang:get(<<"暗夜男爵"/utf8>>);
get_honor_name(Point) when Point >= 200 ->
    lang:get(<<"白银骑士"/utf8>>);
get_honor_name(Point) when Point >= 0 ->
    lang:get(<<"见习骑士"/utf8>>);
get_honor_name(_Info) ->
    logger:data_error("get_honor_name_data_not_exist===>~w",
		      [_Info], room_feat_data, 1703),
    undefined.


