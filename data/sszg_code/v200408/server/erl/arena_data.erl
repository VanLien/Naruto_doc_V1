-file("data/arena_data.erl", 1).

-file("src/mod/data/arena_data.erl", 1).

-module(arena_data).

-lager_records([{arena_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power, type,
		  ret, replay_id, score, time, face_update_time,
		  face_file]},
		{arena_role_log, [id, logs]},
		{arena_rank, [rank, id, score]},
		{arena_role,
		 [id, name, lev, sex, gid, gname, face, power, max_power,
		  lookid, score, rank, time, avatar_id, champion_power,
		  face_update_time, face_file]},
		{arena_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{arena_f,
		 [id, name, idx, lev, sex, face, power, status,
		  formation_type, formation_lev, pos_info, robot_id,
		  avatar_id, face_update_time, face_file, gid, gname]},
		{m_arena,
		 [ver, ref_time, ref_list, cont_win, buff_id,
		  season_ref_time, can_combat_num, had_combat_num,
		  buy_combat_num, acc_combat_num, season_reward]}]).

-export([get_const/1, get_ref/1, get_score/1,
	 cont_win/1, day_rank_reward/1, ref_num/1, rank_reward/1,
	 vip_free/1, season_num_reward/1, season_reward_list/0]).

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

-file("src/mod/data/arena_data.erl", 19).

-file("inc/arena.hrl", 1).

-record(m_arena,
	{ver = 1, ref_time = 0, ref_list = [], cont_win = 0,
	 buff_id = 0, season_ref_time = 0, can_combat_num = 0,
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, season_reward = []}).

-record(arena_f,
	{id = {0, <<>>}, name = <<>>, idx = 0, lev = 0, sex = 0,
	 face = 0, power = 0, status = 0, formation_type = 0,
	 formation_lev = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, face_update_time = 0, face_file = <<>>,
	 gid = {0, <<>>}, gname = <<>>}).

-record(arena_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext}).

-record(arena_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, champion_power = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_role_log, {id = {0, <<>>}, logs = []}).

-record(arena_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, type = 1, ret = 1,
	 replay_id = 0, score = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/data/arena_data.erl", 20).

get_const(season_time) -> {6, 23, 59, 59};
get_const(init_score) -> 1000;
get_const(protect_score) -> 1100;
get_const(limit_lev) -> 8;
get_const(dun_id) -> 0;
get_const(face_list) -> [10508, 20401, 20402, 20403];
get_const(combat_num) -> 5;
get_const(in_rank_min_score) -> 801;
get_const(like_max) -> 3;
get_const(ref_time) -> 3;
get_const(lose_item_ratio) -> 600;
get_const(min_score) -> 800;
get_const(hide_rank) -> 20;
get_const(score_iocn) -> 9999;
get_const(hide_min_score) -> 1100;
get_const(reward_time) -> {6, 20, 59, 59};
get_const(reset_score) -> 700;
get_const(daily_reward_time) -> {21, 0, 0};
get_const(arena_ticketcost) -> [{10103, 1}];
get_const(ticket_price) -> [{3, 20}];
get_const(arena_ticket) -> 10103;
get_const(win_drop) -> 20002;
get_const(lose_drop) -> 20003;
get_const(arena_skip_count) -> 10;
get_const(_Info) ->
    logger:data_error("get_const_data_not_exist===>~w",
		      [_Info], arena_data, 45),
    undefined.

get_ref(1) ->
    #{id => 1,
      score_range =>
	  [{970, 1030, 7}, {950, 1050, 7}, {900, 1100, 7},
	   {800, 1200, 7}, {700, 1300, 7}, {600, 1400, 7},
	   {100, 9999, 7}],
      power_range =>
	  [{1000, 1050}, {1000, 1050}, {1000, 1100}, {1000, 1200},
	   {1000, 1300}, {1000, 1400}, {1, 9999999}],
      robot =>
	  [10002, 10003, 10004, 10005, 10006, 10007, 10008],
      robot_power => [{950, 1050}]};
get_ref(2) ->
    #{id => 2,
      score_range =>
	  [{970, 1030, 7}, {950, 1050, 7}, {900, 1100, 7},
	   {800, 1200, 7}, {700, 1300, 7}, {600, 1400, 7},
	   {100, 9999, 7}],
      power_range =>
	  [{980, 1020}, {950, 1050}, {950, 1100}, {950, 1200},
	   {950, 1300}, {950, 1400}, {1, 9999999}],
      robot =>
	  [10002, 10003, 10004, 10005, 10006, 10007, 10008],
      robot_power => [{901, 949}]};
get_ref(3) ->
    #{id => 3,
      score_range =>
	  [{970, 1030, 7}, {950, 1050, 7}, {900, 1100, 7},
	   {800, 1200, 7}, {700, 1300, 7}, {600, 1400, 7},
	   {100, 9999, 7}],
      power_range =>
	  [{900, 1000}, {950, 1050}, {900, 1100}, {800, 1200},
	   {700, 1300}, {600, 1400}, {1, 9999999}],
      robot => [10000, 10001, 10002, 10003, 10004, 10005],
      robot_power => [{800, 900}]};
get_ref(11) ->
    #{id => 11, score_range => [{100, 800, 1}],
      power_range => [{950, 1000}],
      robot => [11000, 11001, 11002],
      robot_power => [{850, 900}]};
get_ref(12) ->
    #{id => 12, score_range => [{801, 900, 1}],
      power_range => [{960, 1000}],
      robot => [11000, 11001, 11002],
      robot_power => [{901, 970}]};
get_ref(13) ->
    #{id => 13, score_range => [{901, 1000, 1}],
      power_range => [{980, 1000}],
      robot => [11000, 11001, 11002],
      robot_power => [{971, 1000}]};
get_ref(_Info) ->
    logger:data_error("get_ref_data_not_exist===>~w",
		      [_Info], arena_data, 95),
    undefined.

get_score(Score)
    when Score >= 800 andalso Score =< 1099 ->
    #{index => 1, name => lang:get(<<"青铜"/utf8>>),
      min_score => 800, max_score => 1099};
get_score(Score)
    when Score >= 1100 andalso Score =< 1299 ->
    #{index => 2, name => lang:get(<<"白银"/utf8>>),
      min_score => 1100, max_score => 1299};
get_score(Score)
    when Score >= 1300 andalso Score =< 1499 ->
    #{index => 3, name => lang:get(<<"黄金"/utf8>>),
      min_score => 1300, max_score => 1499};
get_score(Score)
    when Score >= 1500 andalso Score =< 1799 ->
    #{index => 4, name => lang:get(<<"铂金"/utf8>>),
      min_score => 1500, max_score => 1799};
get_score(Score)
    when Score >= 1800 andalso Score =< 9999 ->
    #{index => 5, name => lang:get(<<"钻石"/utf8>>),
      min_score => 1800, max_score => 9999};
get_score(_) -> #{}.

cont_win(_) -> #{}.

day_rank_reward(Num) when Num >= 1 andalso Num =< 1 ->
    [{3, 2000000}, {8, 10000}, {10090, 50}, {10091, 60}];
day_rank_reward(Num) when Num >= 2 andalso Num =< 2 ->
    [{3, 1600000}, {8, 8000}, {10090, 40}, {10091, 50}];
day_rank_reward(Num) when Num >= 3 andalso Num =< 3 ->
    [{3, 1200000}, {8, 6000}, {10090, 30}, {10091, 40}];
day_rank_reward(Num) when Num >= 4 andalso Num =< 5 ->
    [{3, 1000000}, {8, 5000}, {10090, 20}, {10091, 30}];
day_rank_reward(Num) when Num >= 6 andalso Num =< 10 ->
    [{3, 800000}, {8, 4500}, {10090, 10}, {10091, 20}];
day_rank_reward(Num) when Num >= 11 andalso Num =< 20 ->
    [{3, 600000}, {8, 3000}, {10090, 5}, {10091, 10}];
day_rank_reward(Num) when Num >= 21 andalso Num =< 50 ->
    [{3, 400000}, {8, 1800}, {10090, 2}];
day_rank_reward(Num)
    when Num >= 51 andalso Num =< 100 ->
    [{3, 400000}, {8, 160}];
day_rank_reward(Num)
    when Num >= 101 andalso Num =< 200 ->
    [{3, 300000}, {8, 140}];
day_rank_reward(Num)
    when Num >= 201 andalso Num =< 500 ->
    [{3, 200000}, {8, 120}];
day_rank_reward(Num)
    when Num >= 501 andalso Num =< 1000 ->
    [{3, 100000}, {8, 100}];
day_rank_reward(Num)
    when Num >= 1001 andalso Num =< 99999 ->
    [{3, 50000}, {8, 80}];
day_rank_reward(_) -> undefined.

ref_num(Num) when Num >= 1 andalso Num =< 2 -> 0;
ref_num(Num) when Num >= 3 andalso Num =< 5 -> 0;
ref_num(Num) when Num >= 6 andalso Num =< 10 -> 0;
ref_num(Num) when Num >= 11 andalso Num =< 999 -> 0;
ref_num(_) -> -1.

rank_reward(Num) when Num >= 1 andalso Num =< 1 ->
    [{50001, 1}, {39052, 5000}, {10090, 200}, {10091, 200},
     {3, 5000000}, {8, 5000}];
rank_reward(Num) when Num >= 2 andalso Num =< 2 ->
    [{50002, 1}, {39052, 500}, {10090, 100}, {10091, 100},
     {3, 2000000}, {8, 4000}];
rank_reward(Num) when Num >= 3 andalso Num =< 3 ->
    [{50003, 1}, {39052, 500}, {10090, 50}, {10091, 50},
     {3, 1000000}, {8, 3000}];
rank_reward(Num) when Num >= 4 andalso Num =< 5 ->
    [{39052, 500}, {10090, 30}, {10091, 30}, {8, 2500}];
rank_reward(Num) when Num >= 6 andalso Num =< 10 ->
    [{39052, 500}, {10090, 20}, {10091, 20}, {8, 2000}];
rank_reward(Num) when Num >= 11 andalso Num =< 20 ->
    [{39052, 500}, {8, 1500}];
rank_reward(Num) when Num >= 21 andalso Num =< 50 ->
    [{3, 14000}, {8, 1000}];
rank_reward(Num) when Num >= 51 andalso Num =< 100 ->
    [{3, 12000}, {8, 750}];
rank_reward(Num) when Num >= 101 andalso Num =< 200 ->
    [{3, 10000}, {8, 500}];
rank_reward(Num) when Num >= 201 andalso Num =< 500 ->
    [{3, 8000}, {8, 400}];
rank_reward(Num) when Num >= 501 andalso Num =< 1000 ->
    [{3, 6000}, {8, 300}];
rank_reward(Num)
    when Num >= 1001 andalso Num =< 99999 ->
    [{3, 4000}, {8, 200}];
rank_reward(_) -> undefined.

vip_free(0) -> 3;
vip_free(1) -> 3;
vip_free(2) -> 3;
vip_free(3) -> 3;
vip_free(4) -> 3;
vip_free(5) -> 3;
vip_free(6) -> 3;
vip_free(7) -> 3;
vip_free(8) -> 3;
vip_free(9) -> 3;
vip_free(10) -> 3;
vip_free(11) -> 3;
vip_free(12) -> 3;
vip_free(13) -> 3;
vip_free(14) -> 3;
vip_free(15) -> 3;
vip_free(_) -> 0.

season_num_reward(10) -> [{10002, 5}];
season_num_reward(20) -> [{10403, 1}];
season_num_reward(35) -> [{10403, 1}];
season_num_reward(50) -> [{37002, 1}];
season_num_reward(70) -> [{37002, 1}];
season_num_reward(90) -> [{14001, 1}];
season_num_reward(120) -> [{14001, 1}];
season_num_reward(_) -> [].

season_reward_list() -> [10, 20, 35, 50, 70, 90, 120].


