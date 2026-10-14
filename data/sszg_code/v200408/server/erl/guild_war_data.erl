-file("src/mod/data/guild_war_data.erl", 1).

-module(guild_war_data).

-lager_records([{guild_war_role_log,
		 [id, name, lev, face, power, formation_type,
		  formation_lev, time, repaly_id, result, hp, defense,
		  face_update_time, face_file]},
		{guild_war_log,
		 [flag1, flag2, time, id1, name1, id2, name2, gid, gname,
		  int_args, str_args]},
		{guild_war_partner,
		 [id, bid, lev, star, break_lev, base_attr, all_attr,
		  skills, break_skills, set_skills, ext_data]},
		{guild_war_role,
		 [pos, id, name, lev, face, power, formation_type,
		  formation_lev, war_score, star, defense, hp, hp_max,
		  status, def_count, def_log, count, repaly_info,
		  relic_def_count, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id, hallows_lucky,
		  hallows_seal, hallows_all_look_ids, extra, look_id,
		  face_update_time, face_file, break_groups]},
		{guild_war_sign,
		 [gid, group_id, srv_name, gname, def_num, defense,
		  last_matchs, avg_power, star_time, buff_lev, rank, hp,
		  hp_max, war_log, lev]}]).

-export([get_award/1, get_buff_list/0, get_buff_attr/1,
	 get_warscores/1, get_war_box_1/1, get_war_box_2/1,
	 get_const/1, get_marketplace_reward/1]).

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

-file("src/mod/data/guild_war_data.erl", 17).

-file("inc/guild_war.hrl", 1).

-record(guild_war_sign,
	{gid = {0, <<>>}, group_id = 0, srv_name = <<>>,
	 gname = <<>>, def_num = 0, defense = [],
	 last_matchs = {0, <<>>}, avg_power = 0, star_time = 0,
	 buff_lev = 0, rank = 0, hp = 0, hp_max = 0,
	 war_log = [], lev = 0}).

-record(guild_war_role,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, power = 0, formation_type = 0,
	 formation_lev = 0, war_score = 0, star = 0,
	 defense = [], hp = 3, hp_max = 3, status = 0,
	 def_count = 0, def_log = [], count = 0,
	 repaly_info = [], relic_def_count = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = [], look_id = 0, face_update_time = 0,
	 face_file = <<>>, break_groups = []}).

-record(guild_war_partner,
	{id = 0, bid = 0, lev = 0, star = 0, break_lev = 0,
	 base_attr = [], all_attr = [], skills = [],
	 break_skills = [], set_skills = [], ext_data = []}).

-record(guild_war_log,
	{flag1 = 0, flag2 = 0, time = 0, id1 = {0, <<>>},
	 name1 = <<>>, id2 = {0, <<>>}, name2 = <<>>,
	 gid = {0, <<>>}, gname = <<>>, int_args = [],
	 str_args = []}).

-record(guild_war_role_log,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 power = 0, formation_type = 0, formation_lev = 0,
	 time = 0, repaly_id = 0, result = 0, hp = 0,
	 defense = [], face_update_time = 0, face_file = <<>>}).

-file("src/mod/data/guild_war_data.erl", 18).

get_award(WarScore) when WarScore =< 1 ->
    [{10, 1200}, {1, 400000}];
get_award(WarScore) when WarScore =< 2 ->
    [{10, 1000}, {1, 350000}];
get_award(WarScore) when WarScore =< 3 ->
    [{10, 800}, {1, 300000}];
get_award(WarScore) when WarScore =< 10 ->
    [{10, 600}, {1, 250000}];
get_award(WarScore) when WarScore =< 20 ->
    [{10, 500}, {1, 200000}];
get_award(WarScore) when WarScore =< 50 ->
    [{10, 400}, {1, 150000}];
get_award(WarScore) when WarScore =< 99 ->
    [{10, 300}, {1, 100000}];
get_award(_) -> [].

get_buff_list() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].

get_buff_attr(1) ->
    [{atk_per, 20}, {def_per, 20}, {hp_max_per, 20},
     {speed, 2}];
get_buff_attr(2) ->
    [{atk_per, 30}, {def_per, 30}, {hp_max_per, 30},
     {speed, 3}];
get_buff_attr(3) ->
    [{atk_per, 40}, {def_per, 40}, {hp_max_per, 40},
     {speed, 4}];
get_buff_attr(4) ->
    [{atk_per, 50}, {def_per, 50}, {hp_max_per, 50},
     {speed, 5}];
get_buff_attr(5) ->
    [{atk_per, 60}, {def_per, 60}, {hp_max_per, 60},
     {speed, 6}];
get_buff_attr(6) ->
    [{atk_per, 70}, {def_per, 70}, {hp_max_per, 70},
     {speed, 7}];
get_buff_attr(7) ->
    [{atk_per, 80}, {def_per, 80}, {hp_max_per, 80},
     {speed, 8}];
get_buff_attr(8) ->
    [{atk_per, 90}, {def_per, 90}, {hp_max_per, 90},
     {speed, 9}];
get_buff_attr(9) ->
    [{atk_per, 100}, {def_per, 100}, {hp_max_per, 100},
     {speed, 10}];
get_buff_attr(10) ->
    [{atk_per, 110}, {def_per, 110}, {hp_max_per, 110},
     {speed, 11}];
get_buff_attr(11) ->
    [{atk_per, 120}, {def_per, 120}, {hp_max_per, 120},
     {speed, 12}];
get_buff_attr(12) ->
    [{atk_per, 130}, {def_per, 130}, {hp_max_per, 130},
     {speed, 13}];
get_buff_attr(13) ->
    [{atk_per, 140}, {def_per, 140}, {hp_max_per, 140},
     {speed, 14}];
get_buff_attr(14) ->
    [{atk_per, 150}, {def_per, 150}, {hp_max_per, 150},
     {speed, 15}];
get_buff_attr(15) ->
    [{atk_per, 160}, {def_per, 160}, {hp_max_per, 160},
     {speed, 16}];
get_buff_attr(_) -> [].

get_warscores(1) -> [{1, 75}, {2, 108}, {3, 140}];
get_warscores(2) -> [{1, 74}, {2, 106}, {3, 137}];
get_warscores(3) -> [{1, 72}, {2, 104}, {3, 135}];
get_warscores(4) -> [{1, 71}, {2, 102}, {3, 132}];
get_warscores(5) -> [{1, 70}, {2, 100}, {3, 130}];
get_warscores(6) -> [{1, 68}, {2, 98}, {3, 127}];
get_warscores(7) -> [{1, 67}, {2, 96}, {3, 124}];
get_warscores(8) -> [{1, 65}, {2, 94}, {3, 122}];
get_warscores(9) -> [{1, 64}, {2, 92}, {3, 119}];
get_warscores(10) -> [{1, 63}, {2, 90}, {3, 117}];
get_warscores(11) -> [{1, 61}, {2, 88}, {3, 114}];
get_warscores(12) -> [{1, 60}, {2, 86}, {3, 111}];
get_warscores(13) -> [{1, 58}, {2, 84}, {3, 109}];
get_warscores(14) -> [{1, 57}, {2, 82}, {3, 106}];
get_warscores(15) -> [{1, 56}, {2, 80}, {3, 104}];
get_warscores(16) -> [{1, 54}, {2, 78}, {3, 101}];
get_warscores(17) -> [{1, 53}, {2, 76}, {3, 98}];
get_warscores(18) -> [{1, 51}, {2, 74}, {3, 96}];
get_warscores(19) -> [{1, 50}, {2, 72}, {3, 93}];
get_warscores(20) -> [{1, 49}, {2, 70}, {3, 91}];
get_warscores(21) -> [{1, 47}, {2, 68}, {3, 88}];
get_warscores(22) -> [{1, 46}, {2, 66}, {3, 85}];
get_warscores(23) -> [{1, 44}, {2, 64}, {3, 83}];
get_warscores(24) -> [{1, 43}, {2, 62}, {3, 80}];
get_warscores(25) -> [{1, 42}, {2, 60}, {3, 78}];
get_warscores(26) -> [{1, 40}, {2, 58}, {3, 75}];
get_warscores(27) -> [{1, 39}, {2, 56}, {3, 72}];
get_warscores(28) -> [{1, 37}, {2, 54}, {3, 70}];
get_warscores(29) -> [{1, 36}, {2, 52}, {3, 67}];
get_warscores(30) -> [{1, 35}, {2, 50}, {3, 65}];
get_warscores(31) -> [{1, 33}, {2, 48}, {3, 62}];
get_warscores(32) -> [{1, 32}, {2, 46}, {3, 59}];
get_warscores(33) -> [{1, 30}, {2, 44}, {3, 57}];
get_warscores(34) -> [{1, 29}, {2, 42}, {3, 54}];
get_warscores(35) -> [{1, 28}, {2, 40}, {3, 52}];
get_warscores(36) -> [{1, 26}, {2, 38}, {3, 49}];
get_warscores(37) -> [{1, 25}, {2, 36}, {3, 46}];
get_warscores(38) -> [{1, 23}, {2, 34}, {3, 44}];
get_warscores(39) -> [{1, 22}, {2, 32}, {3, 41}];
get_warscores(40) -> [{1, 21}, {2, 30}, {3, 39}];
get_warscores(41) -> [{1, 19}, {2, 28}, {3, 36}];
get_warscores(42) -> [{1, 18}, {2, 26}, {3, 33}];
get_warscores(43) -> [{1, 16}, {2, 24}, {3, 31}];
get_warscores(44) -> [{1, 15}, {2, 22}, {3, 28}];
get_warscores(45) -> [{1, 14}, {2, 20}, {3, 26}];
get_warscores(46) -> [{1, 12}, {2, 18}, {3, 23}];
get_warscores(47) -> [{1, 11}, {2, 16}, {3, 20}];
get_warscores(48) -> [{1, 9}, {2, 14}, {3, 18}];
get_warscores(49) -> [{1, 8}, {2, 12}, {3, 15}];
get_warscores(50) -> [{1, 7}, {2, 10}, {3, 13}];
get_warscores(_) -> [].

get_war_box_1(0) ->
    [{[1, 5], 10, 720, 1}, {[6, 10], 10, 720, 2},
     {[11, 15], 10, 720, 3}, {[16, 20], 10, 720, 4},
     {[21, 99], 10, 720, 5}];
get_war_box_1(1) ->
    [{[1, 5], 10, 1200, 1}, {[6, 10], 10, 1200, 2},
     {[11, 15], 10, 1200, 3}, {[16, 20], 10, 1200, 4},
     {[21, 99], 10, 1200, 5}];
get_war_box_1(_) -> [].

get_war_box_2(0) -> [{10, 480, 100}, {10, 360, 100}];
get_war_box_2(1) -> [{10, 800, 100}, {10, 600, 100}];
get_war_box_2(_) -> [].

get_const(active_member_num) -> 1;
get_const(limit_lev) -> 1;
get_const(limit_open_time) -> 1;
get_const(active_member_condition) -> 5;
get_const(challange_time_limit) -> 2;
get_const(ruins_challange_limit) -> 5;
get_const(operation_coefficient_1) -> 1000;
get_const(operation_coefficient_2) -> 1000;
get_const(easy_difficulty) -> 900;
get_const(normal_difficulty) -> 1000;
get_const(hard_difficulty) -> 1100;
get_const(easy_diff_addition) -> 900;
get_const(normal_diff_addition) -> 1000;
get_const(hard_diff_addition) -> 1100;
get_const(battle_duration) -> 132;
get_const(guard_id) -> 81001;
get_const(guild_win_reward) -> [{10, 666}, {1, 50000}];
get_const(guild_lose_reward) -> [{10, 400}, {1, 30000}];
get_const(win_strongholds_reward_easy) ->
    [{10, 50}, {1, 20000}];
get_const(win_strongholds_reward_normal) ->
    [{10, 80}, {1, 30000}];
get_const(win_strongholds_reward_hard) ->
    [{10, 120}, {1, 50000}];
get_const(lose_strongholds_reward_easy) -> [{1, 5000}];
get_const(lose_strongholds_reward_normal) ->
    [{1, 9000}];
get_const(lose_strongholds_reward_hard) -> [{1, 15000}];
get_const(win_ruins_record) -> 5;
get_const(lose_ruins_record) -> 1;
get_const(lose_guard_record) -> 1;
get_const(matching_time) ->
    [{1, 4, 0}, {3, 4, 0}, {5, 4, 0}];
get_const(start_time) -> {12, 0, 0};
get_const(end_time) -> {20, 0, 0};
get_const(clear_time) -> {0, 0, 0};
get_const(time_desc) -> 0;
get_const(box_time_limit) -> 28800;
get_const(box_rule) -> 1;
get_const(treasure_item_amount) -> 1;
get_const(marketplace_rule) -> 1;
get_const(_Info) ->
    logger:data_error("get_const_data_not_exist===>~w",
		      [_Info], guild_war_data, 143),
    undefined.

get_marketplace_reward(Power)
    when Power < 10000000 andalso Power >= 0 ->
    {[{29905, 20, 350}, {29905, 30, 395}, {29905, 50, 85},
      {14001, 1, 170}],
     [{10403, 15}, {10001, 500}, {37001, 20}]};
get_marketplace_reward(Power)
    when Power < 20000000 andalso Power >= 10000000 ->
    {[{29905, 20, 350}, {29905, 30, 395}, {29905, 50, 85},
      {14001, 1, 170}],
     [{10403, 15}, {10001, 500}, {37001, 20}]};
get_marketplace_reward(Power)
    when Power < 30000000 andalso Power >= 20000000 ->
    {[{29905, 20, 350}, {29905, 30, 395}, {29905, 50, 85},
      {14001, 1, 170}],
     [{10403, 15}, {10001, 500}, {37001, 20}]};
get_marketplace_reward(Power)
    when Power < 40000000 andalso Power >= 30000000 ->
    {[{29905, 20, 350}, {29905, 30, 395}, {29905, 50, 85},
      {14001, 1, 170}],
     [{10403, 15}, {10001, 500}, {37001, 20}]};
get_marketplace_reward(Power)
    when Power < 999999999 andalso Power >= 40000000 ->
    {[{29905, 20, 350}, {29905, 30, 395}, {29905, 50, 85},
      {14001, 1, 170}],
     [{10403, 15}, {10001, 500}, {37001, 20}]};
get_marketplace_reward(_) -> undefined.


