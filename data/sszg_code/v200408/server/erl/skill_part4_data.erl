-file("data/skill_part4_data.erl", 1).

-file("src/mod/data/skill_part4_data.erl", 1).

-module(skill_part4_data).

-lager_records([{combat_buff_data,
		 [bid, name, group, join_type, lev, join_num, duration,
		  buff_result_type, buff_result, desc,
		  positive_or_negative, can_reduce, probability,
		  clean_when_dead, clean_next_wave, is_show, group_pro,
		  dot_type]},
		{effect_data,
		 [bid, group, target_type, target_num, effect_type,
		  hurt_type, base_hit, hit_type, effect_param, condition,
		  condition_param, extra_param, passive_effect,
		  effect_desc]},
		{skill_data,
		 [bid, name, owner, group, next_id, min_play_time, level,
		  is_normal_skill, type, trigger_condition, trigger_param,
		  target, effect_list, add_attr, cd, count, best_target,
		  fit_combat_type, skill_changed, power, is_combat_hidden,
		  priority]},
		{m_skill, [skills_used, skills_owned]}]).

-export([list_ids/0, get_skill/1, get_effect/1,
	 get_skill_id_by_group/2]).

-file("inc/skill.hrl", 1).

-record(m_skill,
	{skills_used = [], skills_owned = []  :: [integer()]}).

-record(skill_data,
	{bid, name, owner, group, next_id = 0,
	 min_play_time = 0, level, is_normal_skill = 0,
	 type  ::
	     passive_skill | active_skill | eqm_passive_skill,
	 trigger_condition = none, trigger_param = 0, target,
	 effect_list = [], add_attr = [], cd, count,
	 best_target = normal, fit_combat_type = all,
	 skill_changed = none, power = 0, is_combat_hidden = 0,
	 priority = 0}).

-record(effect_data,
	{bid, group, target_type, target_num, effect_type,
	 hurt_type, base_hit, hit_type = effect_hit,
	 effect_param, condition = none, condition_param = none,
	 extra_param = [], passive_effect = none,
	 effect_desc = <<>>}).

-record(combat_buff_data,
	{bid, name, group, join_type, lev, join_num, duration,
	 buff_result_type, buff_result = [], desc,
	 positive_or_negative, can_reduce, probability = 1000,
	 clean_when_dead = true, clean_next_wave = 0,
	 is_show = true, group_pro = 0, dot_type = 0}).

-file("src/mod/data/skill_part4_data.erl", 13).

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

-file("src/mod/data/skill_part4_data.erl", 14).

list_ids() ->
    [21011, 21012, 21013, 21014, 21015, 21021, 21022, 21023,
     21024, 21025, 21031, 21032, 21033, 21034, 21035, 21041,
     21042, 21043, 21044, 21045, 21051, 21052, 21053, 21054,
     21055, 22011, 22012, 22013, 22014, 22015, 22021, 22022,
     22023, 22024, 22025, 22031, 22032, 22033, 22034, 22035,
     22041, 22042, 22043, 22044, 22045, 23011, 23012, 23013,
     23014, 23015, 23021, 23022, 23023, 23024, 23025, 23029,
     23031, 23032, 23033, 23034, 23035, 23041, 23042, 23043,
     23044, 23045, 23051, 23052, 23053, 23054, 23055, 23061,
     23062, 23063, 23064, 23065, 23071, 23072, 23073, 23074,
     23075, 23001, 23002, 23003, 23004, 23005, 23081, 23082,
     23083, 23084, 23085, 23201, 23202, 23203, 23204, 23205,
     23095, 23094, 23093, 23092, 23091, 23215, 23214, 23213,
     23212, 23211, 23221, 23222, 23223, 23224, 23225, 24011,
     24005, 24004, 24003, 24002, 24001].

get_skill(23201) ->
    #skill_data{bid = 23201,
		name = lang:get(<<"Tử Môn"/utf8>>),
		owner = lang:get(<<"Tử Môn"/utf8>>), group = 2311,
		next_id = 23202, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [232001, 232011]};
get_skill(23202) ->
    #skill_data{bid = 23202,
		name = lang:get(<<"Tử Môn"/utf8>>),
		owner = lang:get(<<"Tử Môn"/utf8>>), group = 2311,
		next_id = 23203, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [232002, 232012]};
get_skill(23203) ->
    #skill_data{bid = 23203,
		name = lang:get(<<"Tử Môn"/utf8>>),
		owner = lang:get(<<"Tử Môn"/utf8>>), group = 2311,
		next_id = 23204, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [232003, 232013]};
get_skill(23204) ->
    #skill_data{bid = 23204,
		name = lang:get(<<"Tử Môn"/utf8>>),
		owner = lang:get(<<"Tử Môn"/utf8>>), group = 2311,
		next_id = 23205, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [232004, 232014]};
get_skill(23205) ->
    #skill_data{bid = 23205,
		name = lang:get(<<"Tử Môn"/utf8>>),
		owner = lang:get(<<"Tử Môn"/utf8>>), group = 2311,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [232005, 232015]};
get_skill(23091) ->
    #skill_data{bid = 23091,
		name = lang:get(<<"Mộc Long"/utf8>>),
		owner = lang:get(<<"Mộc Long"/utf8>>), group = 2309,
		next_id = 23092, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230901]};
get_skill(23092) ->
    #skill_data{bid = 23092,
		name = lang:get(<<"Mộc Long"/utf8>>),
		owner = lang:get(<<"Mộc Long"/utf8>>), group = 2309,
		next_id = 23093, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230902]};
get_skill(23093) ->
    #skill_data{bid = 23093,
		name = lang:get(<<"Mộc Long"/utf8>>),
		owner = lang:get(<<"Mộc Long"/utf8>>), group = 2309,
		next_id = 23094, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230903, 230913]};
get_skill(23094) ->
    #skill_data{bid = 23094,
		name = lang:get(<<"Mộc Long"/utf8>>),
		owner = lang:get(<<"Mộc Long"/utf8>>), group = 2309,
		next_id = 23095, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230904, 230914]};
get_skill(23095) ->
    #skill_data{bid = 23095,
		name = lang:get(<<"Mộc Long"/utf8>>),
		owner = lang:get(<<"Mộc Long"/utf8>>), group = 2309,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230905, 230915, 230925]};
get_skill(21011) ->
    #skill_data{bid = 21011,
		name = lang:get(<<"萌兔撞击"/utf8>>),
		owner = lang:get(<<"波比"/utf8>>), group = 2101,
		next_id = 21012, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210101]};
get_skill(21012) ->
    #skill_data{bid = 21012,
		name = lang:get(<<"萌兔撞击"/utf8>>),
		owner = lang:get(<<"波比"/utf8>>), group = 2101,
		next_id = 21013, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210102]};
get_skill(21013) ->
    #skill_data{bid = 21013,
		name = lang:get(<<"萌兔撞击"/utf8>>),
		owner = lang:get(<<"波比"/utf8>>), group = 2101,
		next_id = 21014, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210103]};
get_skill(21014) ->
    #skill_data{bid = 21014,
		name = lang:get(<<"萌兔撞击"/utf8>>),
		owner = lang:get(<<"波比"/utf8>>), group = 2101,
		next_id = 21015, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210104]};
get_skill(21015) ->
    #skill_data{bid = 21015,
		name = lang:get(<<"萌兔撞击"/utf8>>),
		owner = lang:get(<<"波比"/utf8>>), group = 2101,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210105]};
get_skill(21021) ->
    #skill_data{bid = 21021,
		name = lang:get(<<"弹弹冲击"/utf8>>),
		owner = lang:get(<<"弹弹"/utf8>>), group = 2102,
		next_id = 21022, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [210201]};
get_skill(21022) ->
    #skill_data{bid = 21022,
		name = lang:get(<<"弹弹冲击"/utf8>>),
		owner = lang:get(<<"弹弹"/utf8>>), group = 2102,
		next_id = 21023, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [210202]};
get_skill(21023) ->
    #skill_data{bid = 21023,
		name = lang:get(<<"弹弹冲击"/utf8>>),
		owner = lang:get(<<"弹弹"/utf8>>), group = 2102,
		next_id = 21024, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [210203]};
get_skill(21024) ->
    #skill_data{bid = 21024,
		name = lang:get(<<"弹弹冲击"/utf8>>),
		owner = lang:get(<<"弹弹"/utf8>>), group = 2102,
		next_id = 21025, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [210204]};
get_skill(21025) ->
    #skill_data{bid = 21025,
		name = lang:get(<<"弹弹冲击"/utf8>>),
		owner = lang:get(<<"弹弹"/utf8>>), group = 2102,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [210205]};
get_skill(21031) ->
    #skill_data{bid = 21031,
		name = lang:get(<<"热情鼓舞"/utf8>>),
		owner = lang:get(<<"火球"/utf8>>), group = 2103,
		next_id = 21032, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [210301]};
get_skill(21032) ->
    #skill_data{bid = 21032,
		name = lang:get(<<"热情鼓舞"/utf8>>),
		owner = lang:get(<<"火球"/utf8>>), group = 2103,
		next_id = 21033, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [210302]};
get_skill(21033) ->
    #skill_data{bid = 21033,
		name = lang:get(<<"热情鼓舞"/utf8>>),
		owner = lang:get(<<"火球"/utf8>>), group = 2103,
		next_id = 21034, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [210303]};
get_skill(21034) ->
    #skill_data{bid = 21034,
		name = lang:get(<<"热情鼓舞"/utf8>>),
		owner = lang:get(<<"火球"/utf8>>), group = 2103,
		next_id = 21035, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [210304]};
get_skill(21035) ->
    #skill_data{bid = 21035,
		name = lang:get(<<"热情鼓舞"/utf8>>),
		owner = lang:get(<<"火球"/utf8>>), group = 2103,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [210305]};
get_skill(21041) ->
    #skill_data{bid = 21041, name = lang:get(<<"滋养"/utf8>>),
		owner = lang:get(<<"小豆苗"/utf8>>), group = 2104,
		next_id = 21042, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_ally,
		count = 1, effect_list = [210401, 210411]};
get_skill(21042) ->
    #skill_data{bid = 21042, name = lang:get(<<"滋养"/utf8>>),
		owner = lang:get(<<"小豆苗"/utf8>>), group = 2104,
		next_id = 21043, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_ally,
		count = 1, effect_list = [210402, 210412]};
get_skill(21043) ->
    #skill_data{bid = 21043, name = lang:get(<<"滋养"/utf8>>),
		owner = lang:get(<<"小豆苗"/utf8>>), group = 2104,
		next_id = 21044, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_ally,
		count = 1, effect_list = [210403, 210413]};
get_skill(21044) ->
    #skill_data{bid = 21044, name = lang:get(<<"滋养"/utf8>>),
		owner = lang:get(<<"小豆苗"/utf8>>), group = 2104,
		next_id = 21045, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_ally,
		count = 1, effect_list = [210404, 210414]};
get_skill(21045) ->
    #skill_data{bid = 21045, name = lang:get(<<"滋养"/utf8>>),
		owner = lang:get(<<"小豆苗"/utf8>>), group = 2104,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_ally,
		count = 1, effect_list = [210405, 210415]};
get_skill(21051) ->
    #skill_data{bid = 21051,
		name = lang:get(<<"剧毒虫刺"/utf8>>),
		owner = lang:get(<<"花螳螂"/utf8>>), group = 2105,
		next_id = 21052, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210501, 210511]};
get_skill(21052) ->
    #skill_data{bid = 21052,
		name = lang:get(<<"剧毒虫刺"/utf8>>),
		owner = lang:get(<<"花螳螂"/utf8>>), group = 2105,
		next_id = 21053, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210502, 210511]};
get_skill(21053) ->
    #skill_data{bid = 21053,
		name = lang:get(<<"剧毒虫刺"/utf8>>),
		owner = lang:get(<<"花螳螂"/utf8>>), group = 2105,
		next_id = 21054, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210503, 210511]};
get_skill(21054) ->
    #skill_data{bid = 21054,
		name = lang:get(<<"剧毒虫刺"/utf8>>),
		owner = lang:get(<<"花螳螂"/utf8>>), group = 2105,
		next_id = 21055, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210504, 210511]};
get_skill(21055) ->
    #skill_data{bid = 21055,
		name = lang:get(<<"剧毒虫刺"/utf8>>),
		owner = lang:get(<<"花螳螂"/utf8>>), group = 2105,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [210505, 210511]};
get_skill(22011) ->
    #skill_data{bid = 22011,
		name = lang:get(<<"血之眷赐"/utf8>>),
		owner = lang:get(<<"暗夜精灵"/utf8>>), group = 2201,
		next_id = 22012, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220101, 220111]};
get_skill(22012) ->
    #skill_data{bid = 22012,
		name = lang:get(<<"血之眷赐"/utf8>>),
		owner = lang:get(<<"暗夜精灵"/utf8>>), group = 2201,
		next_id = 22013, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220102, 220111]};
get_skill(22013) ->
    #skill_data{bid = 22013,
		name = lang:get(<<"血之眷赐"/utf8>>),
		owner = lang:get(<<"暗夜精灵"/utf8>>), group = 2201,
		next_id = 22014, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220103, 220111]};
get_skill(22014) ->
    #skill_data{bid = 22014,
		name = lang:get(<<"血之眷赐"/utf8>>),
		owner = lang:get(<<"暗夜精灵"/utf8>>), group = 2201,
		next_id = 22015, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220104, 220111]};
get_skill(22015) ->
    #skill_data{bid = 22015,
		name = lang:get(<<"血之眷赐"/utf8>>),
		owner = lang:get(<<"暗夜精灵"/utf8>>), group = 2201,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220105, 220111]};
get_skill(22021) ->
    #skill_data{bid = 22021,
		name = lang:get(<<"熔火风暴"/utf8>>),
		owner = lang:get(<<"炎灵"/utf8>>), group = 2202,
		next_id = 22022, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220201, 220211]};
get_skill(22022) ->
    #skill_data{bid = 22022,
		name = lang:get(<<"熔火风暴"/utf8>>),
		owner = lang:get(<<"炎灵"/utf8>>), group = 2202,
		next_id = 22023, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220202, 220211]};
get_skill(22023) ->
    #skill_data{bid = 22023,
		name = lang:get(<<"熔火风暴"/utf8>>),
		owner = lang:get(<<"炎灵"/utf8>>), group = 2202,
		next_id = 22024, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220203, 220211]};
get_skill(22024) ->
    #skill_data{bid = 22024,
		name = lang:get(<<"熔火风暴"/utf8>>),
		owner = lang:get(<<"炎灵"/utf8>>), group = 2202,
		next_id = 22025, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220204, 220211]};
get_skill(22025) ->
    #skill_data{bid = 22025,
		name = lang:get(<<"熔火风暴"/utf8>>),
		owner = lang:get(<<"炎灵"/utf8>>), group = 2202,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220205, 220211]};
get_skill(22031) ->
    #skill_data{bid = 22031,
		name = lang:get(<<"潮汐涌动"/utf8>>),
		owner = lang:get(<<"潮汐之灵"/utf8>>), group = 2203,
		next_id = 22032, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220321, 220311, 220301]};
get_skill(22032) ->
    #skill_data{bid = 22032,
		name = lang:get(<<"潮汐涌动"/utf8>>),
		owner = lang:get(<<"潮汐之灵"/utf8>>), group = 2203,
		next_id = 22033, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220322, 220311, 220302]};
get_skill(22033) ->
    #skill_data{bid = 22033,
		name = lang:get(<<"潮汐涌动"/utf8>>),
		owner = lang:get(<<"潮汐之灵"/utf8>>), group = 2203,
		next_id = 22034, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220323, 220311, 220303]};
get_skill(22034) ->
    #skill_data{bid = 22034,
		name = lang:get(<<"潮汐涌动"/utf8>>),
		owner = lang:get(<<"潮汐之灵"/utf8>>), group = 2203,
		next_id = 22035, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220324, 220311, 220304]};
get_skill(22035) ->
    #skill_data{bid = 22035,
		name = lang:get(<<"潮汐涌动"/utf8>>),
		owner = lang:get(<<"潮汐之灵"/utf8>>), group = 2203,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [220325, 220311, 220305]};
get_skill(22041) ->
    #skill_data{bid = 22041,
		name = lang:get(<<"密林治愈"/utf8>>),
		owner = lang:get(<<"花仙子"/utf8>>), group = 2204,
		next_id = 22042, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [220401, 220411, 220421]};
get_skill(22042) ->
    #skill_data{bid = 22042,
		name = lang:get(<<"密林治愈"/utf8>>),
		owner = lang:get(<<"花仙子"/utf8>>), group = 2204,
		next_id = 22043, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [220402, 220412, 220422]};
get_skill(22043) ->
    #skill_data{bid = 22043,
		name = lang:get(<<"密林治愈"/utf8>>),
		owner = lang:get(<<"花仙子"/utf8>>), group = 2204,
		next_id = 22044, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [220403, 220413, 220423]};
get_skill(22044) ->
    #skill_data{bid = 22044,
		name = lang:get(<<"密林治愈"/utf8>>),
		owner = lang:get(<<"花仙子"/utf8>>), group = 2204,
		next_id = 22045, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [220404, 220414, 220424]};
get_skill(22045) ->
    #skill_data{bid = 22045,
		name = lang:get(<<"密林治愈"/utf8>>),
		owner = lang:get(<<"花仙子"/utf8>>), group = 2204,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [220405, 220415, 220425]};
get_skill(23011) ->
    #skill_data{bid = 23011,
		name = lang:get(<<"魔能灵动"/utf8>>),
		owner = lang:get(<<"幻界精灵"/utf8>>), group = 2301,
		next_id = 23012, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [230101]};
get_skill(23012) ->
    #skill_data{bid = 23012,
		name = lang:get(<<"魔能灵动"/utf8>>),
		owner = lang:get(<<"幻界精灵"/utf8>>), group = 2301,
		next_id = 23013, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [230102]};
get_skill(23013) ->
    #skill_data{bid = 23013,
		name = lang:get(<<"魔能灵动"/utf8>>),
		owner = lang:get(<<"幻界精灵"/utf8>>), group = 2301,
		next_id = 23014, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [230103]};
get_skill(23014) ->
    #skill_data{bid = 23014,
		name = lang:get(<<"魔能灵动"/utf8>>),
		owner = lang:get(<<"幻界精灵"/utf8>>), group = 2301,
		next_id = 23015, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [230104]};
get_skill(23015) ->
    #skill_data{bid = 23015,
		name = lang:get(<<"魔能灵动"/utf8>>),
		owner = lang:get(<<"幻界精灵"/utf8>>), group = 2301,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = min_hp_per, target = alive_enemy,
		count = 1, effect_list = [230105]};
get_skill(23021) ->
    #skill_data{bid = 23021,
		name = lang:get(<<"神谕祷言"/utf8>>),
		owner = lang:get(<<"神使"/utf8>>), group = 2302,
		next_id = 23022, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230201, 230211]};
get_skill(23022) ->
    #skill_data{bid = 23022,
		name = lang:get(<<"神谕祷言"/utf8>>),
		owner = lang:get(<<"神使"/utf8>>), group = 2302,
		next_id = 23023, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230202, 230212]};
get_skill(23023) ->
    #skill_data{bid = 23023,
		name = lang:get(<<"神谕祷言"/utf8>>),
		owner = lang:get(<<"神使"/utf8>>), group = 2302,
		next_id = 23024, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230203, 230213]};
get_skill(23024) ->
    #skill_data{bid = 23024,
		name = lang:get(<<"神谕祷言"/utf8>>),
		owner = lang:get(<<"神使"/utf8>>), group = 2302,
		next_id = 23025, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230204, 230214]};
get_skill(23025) ->
    #skill_data{bid = 23025,
		name = lang:get(<<"神谕祷言"/utf8>>),
		owner = lang:get(<<"神使"/utf8>>), group = 2302,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230205, 230215]};
get_skill(23029) ->
    #skill_data{bid = 23029,
		name = lang:get(<<"不屈复活"/utf8>>),
		owner = lang:get(<<"神使"/utf8>>), group = 2302,
		next_id = 0, min_play_time = 800, level = 10,
		is_normal_skill = 0, cd = 0, type = passive_skill,
		trigger_condition = when_dead,
		trigger_param = [{round_limit, 3}, {wave_limit, 3}],
		target = alive_enemy, count = 1, effect_list = [230291],
		priority = -5};
get_skill(23031) ->
    #skill_data{bid = 23031,
		name = lang:get(<<"烈焰奔腾"/utf8>>),
		owner = lang:get(<<"烈焰之蹄"/utf8>>), group = 2303,
		next_id = 23032, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230301, 230311]};
get_skill(23032) ->
    #skill_data{bid = 23032,
		name = lang:get(<<"烈焰奔腾"/utf8>>),
		owner = lang:get(<<"烈焰之蹄"/utf8>>), group = 2303,
		next_id = 23033, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230302, 230311]};
get_skill(23033) ->
    #skill_data{bid = 23033,
		name = lang:get(<<"烈焰奔腾"/utf8>>),
		owner = lang:get(<<"烈焰之蹄"/utf8>>), group = 2303,
		next_id = 23034, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230303, 230311]};
get_skill(23034) ->
    #skill_data{bid = 23034,
		name = lang:get(<<"烈焰奔腾"/utf8>>),
		owner = lang:get(<<"烈焰之蹄"/utf8>>), group = 2303,
		next_id = 23035, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230304, 230311]};
get_skill(23035) ->
    #skill_data{bid = 23035,
		name = lang:get(<<"烈焰奔腾"/utf8>>),
		owner = lang:get(<<"烈焰之蹄"/utf8>>), group = 2303,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230305, 230311]};
get_skill(23041) ->
    #skill_data{bid = 23041,
		name = lang:get(<<"帽子戏法"/utf8>>),
		owner = lang:get(<<"圣林行者"/utf8>>), group = 2304,
		next_id = 23042, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230401, 230411, 230421, 230431, 230441]};
get_skill(23042) ->
    #skill_data{bid = 23042,
		name = lang:get(<<"帽子戏法"/utf8>>),
		owner = lang:get(<<"圣林行者"/utf8>>), group = 2304,
		next_id = 23043, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230402, 230412, 230422, 230432, 230442]};
get_skill(23043) ->
    #skill_data{bid = 23043,
		name = lang:get(<<"帽子戏法"/utf8>>),
		owner = lang:get(<<"圣林行者"/utf8>>), group = 2304,
		next_id = 23044, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230403, 230413, 230423, 230433, 230443]};
get_skill(23044) ->
    #skill_data{bid = 23044,
		name = lang:get(<<"帽子戏法"/utf8>>),
		owner = lang:get(<<"圣林行者"/utf8>>), group = 2304,
		next_id = 23045, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230404, 230414, 230424, 230434, 230444]};
get_skill(23045) ->
    #skill_data{bid = 23045,
		name = lang:get(<<"帽子戏法"/utf8>>),
		owner = lang:get(<<"圣林行者"/utf8>>), group = 2304,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [230405, 230415, 230425, 230435, 230445]};
get_skill(23051) ->
    #skill_data{bid = 23051,
		name = lang:get(<<"岚羽疾风"/utf8>>),
		owner = lang:get(<<"疾风之怒"/utf8>>), group = 2305,
		next_id = 23052, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230501, 230511]};
get_skill(23052) ->
    #skill_data{bid = 23052,
		name = lang:get(<<"岚羽疾风"/utf8>>),
		owner = lang:get(<<"疾风之怒"/utf8>>), group = 2305,
		next_id = 23053, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230502, 230512]};
get_skill(23053) ->
    #skill_data{bid = 23053,
		name = lang:get(<<"岚羽疾风"/utf8>>),
		owner = lang:get(<<"疾风之怒"/utf8>>), group = 2305,
		next_id = 23054, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230503, 230513]};
get_skill(23054) ->
    #skill_data{bid = 23054,
		name = lang:get(<<"岚羽疾风"/utf8>>),
		owner = lang:get(<<"疾风之怒"/utf8>>), group = 2305,
		next_id = 23055, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230504, 230514]};
get_skill(23055) ->
    #skill_data{bid = 23055,
		name = lang:get(<<"岚羽疾风"/utf8>>),
		owner = lang:get(<<"疾风之怒"/utf8>>), group = 2305,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230505, 230515]};
get_skill(23061) ->
    #skill_data{bid = 23061,
		name = lang:get(<<"魔魂降临"/utf8>>),
		owner = lang:get(<<"漆黑魔魂"/utf8>>), group = 2306,
		next_id = 23062, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [230611, 230621, 230601]};
get_skill(23062) ->
    #skill_data{bid = 23062,
		name = lang:get(<<"魔魂降临"/utf8>>),
		owner = lang:get(<<"漆黑魔魂"/utf8>>), group = 2306,
		next_id = 23063, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [230612, 230622, 230602]};
get_skill(23063) ->
    #skill_data{bid = 23063,
		name = lang:get(<<"魔魂降临"/utf8>>),
		owner = lang:get(<<"漆黑魔魂"/utf8>>), group = 2306,
		next_id = 23064, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [230613, 230623, 230603]};
get_skill(23064) ->
    #skill_data{bid = 23064,
		name = lang:get(<<"魔魂降临"/utf8>>),
		owner = lang:get(<<"漆黑魔魂"/utf8>>), group = 2306,
		next_id = 23065, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [230614, 230624, 230604]};
get_skill(23065) ->
    #skill_data{bid = 23065,
		name = lang:get(<<"魔魂降临"/utf8>>),
		owner = lang:get(<<"漆黑魔魂"/utf8>>), group = 2306,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [230615, 230625, 230605]};
get_skill(23071) ->
    #skill_data{bid = 23071,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2307,
		next_id = 23072, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [230701]};
get_skill(23072) ->
    #skill_data{bid = 23072,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2307,
		next_id = 23073, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [230702]};
get_skill(23073) ->
    #skill_data{bid = 23073,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2307,
		next_id = 23074, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [230703]};
get_skill(23074) ->
    #skill_data{bid = 23074,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2307,
		next_id = 23075, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [230704]};
get_skill(23075) ->
    #skill_data{bid = 23075,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2307,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_ally, count = 1,
		effect_list = [230705]};
get_skill(23001) ->
    #skill_data{bid = 23001,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2300,
		next_id = 0, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 0, type = passive_skill,
		trigger_condition = after_be_physical_hurt_once,
		target = alive_enemy, count = 1,
		effect_list = [230011]};
get_skill(23002) ->
    #skill_data{bid = 23002,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2300,
		next_id = 0, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 0, type = passive_skill,
		trigger_condition = after_be_physical_hurt_once,
		target = alive_enemy, count = 1,
		effect_list = [230011]};
get_skill(23003) ->
    #skill_data{bid = 23003,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2300,
		next_id = 0, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 0, type = passive_skill,
		trigger_condition = after_be_physical_hurt_once,
		target = alive_enemy, count = 1,
		effect_list = [230011]};
get_skill(23004) ->
    #skill_data{bid = 23004,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2300,
		next_id = 0, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 0, type = passive_skill,
		trigger_condition = after_be_physical_hurt_once,
		target = alive_enemy, count = 1,
		effect_list = [230011]};
get_skill(23005) ->
    #skill_data{bid = 23005,
		name = lang:get(<<"霜寒护盾"/utf8>>),
		owner = lang:get(<<"冰岩巨兽"/utf8>>), group = 2300,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 0, type = passive_skill,
		trigger_condition = after_be_physical_hurt_once,
		target = alive_enemy, count = 1,
		effect_list = [230011]};
get_skill(23081) ->
    #skill_data{bid = 23081,
		name = lang:get(<<"海灵守护"/utf8>>),
		owner = lang:get(<<"海灵儿"/utf8>>), group = 2308,
		next_id = 23082, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230801, 230811]};
get_skill(23082) ->
    #skill_data{bid = 23082,
		name = lang:get(<<"海灵守护"/utf8>>),
		owner = lang:get(<<"海灵儿"/utf8>>), group = 2308,
		next_id = 23083, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230802, 230812]};
get_skill(23083) ->
    #skill_data{bid = 23083,
		name = lang:get(<<"海灵守护"/utf8>>),
		owner = lang:get(<<"海灵儿"/utf8>>), group = 2308,
		next_id = 23084, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230803, 230813]};
get_skill(23084) ->
    #skill_data{bid = 23084,
		name = lang:get(<<"海灵守护"/utf8>>),
		owner = lang:get(<<"海灵儿"/utf8>>), group = 2308,
		next_id = 23085, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230804, 230814, 230834]};
get_skill(23085) ->
    #skill_data{bid = 23085,
		name = lang:get(<<"海灵守护"/utf8>>),
		owner = lang:get(<<"海灵儿"/utf8>>), group = 2308,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_ally, count = 1,
		effect_list = [230805, 230815, 230835]};
get_skill(23211) ->
    #skill_data{bid = 23211,
		name = lang:get(<<"Bát Vĩ"/utf8>>),
		owner = lang:get(<<"Bát Vĩ"/utf8>>), group = 2321,
		next_id = 23212, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [232101, 232111, 232121]};
get_skill(23212) ->
    #skill_data{bid = 23212,
		name = lang:get(<<"Bát Vĩ"/utf8>>),
		owner = lang:get(<<"Bát Vĩ"/utf8>>), group = 2321,
		next_id = 23213, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [232102, 232112, 232122]};
get_skill(23213) ->
    #skill_data{bid = 23213,
		name = lang:get(<<"Bát Vĩ"/utf8>>),
		owner = lang:get(<<"Bát Vĩ"/utf8>>), group = 2321,
		next_id = 23214, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [232103, 232113, 232123, 232133]};
get_skill(23214) ->
    #skill_data{bid = 23214,
		name = lang:get(<<"Bát Vĩ"/utf8>>),
		owner = lang:get(<<"Bát Vĩ"/utf8>>), group = 2321,
		next_id = 23215, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list =
		    [232104, 232114, 232124, 232134, 232144, 232154,
		     232164]};
get_skill(23215) ->
    #skill_data{bid = 23215,
		name = lang:get(<<"Bát Vĩ"/utf8>>),
		owner = lang:get(<<"Bát Vĩ"/utf8>>), group = 2321,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [232105, 232115, 232125, 232135, 232145]};
get_skill(23221) ->
    #skill_data{bid = 23221,
		name = lang:get(<<"Thất Vĩ"/utf8>>),
		owner = lang:get(<<"Thất Vĩ"/utf8>>), group = 2322,
		next_id = 23222, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [232201, 232211]};
get_skill(23222) ->
    #skill_data{bid = 23222,
		name = lang:get(<<"Thất Vĩ"/utf8>>),
		owner = lang:get(<<"Thất Vĩ"/utf8>>), group = 2322,
		next_id = 23223, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [232202, 232212]};
get_skill(23223) ->
    #skill_data{bid = 23223,
		name = lang:get(<<"Thất Vĩ"/utf8>>),
		owner = lang:get(<<"Thất Vĩ"/utf8>>), group = 2322,
		next_id = 23224, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [232203, 232213]};
get_skill(23224) ->
    #skill_data{bid = 23224,
		name = lang:get(<<"Thất Vĩ"/utf8>>),
		owner = lang:get(<<"Thất Vĩ"/utf8>>), group = 2322,
		next_id = 23225, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [232204, 232214, 232224, 232234]};
get_skill(23225) ->
    #skill_data{bid = 23225,
		name = lang:get(<<"Thất Vĩ"/utf8>>),
		owner = lang:get(<<"Thất Vĩ"/utf8>>), group = 2322,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		best_target = max_atk, target = alive_enemy, count = 1,
		effect_list = [232205, 232215, 232225, 232235, 232245]};
get_skill(24001) ->
    #skill_data{bid = 24001,
		name = lang:get(<<"Cửu Vĩ"/utf8>>),
		owner = lang:get(<<"Cửu Vĩ"/utf8>>), group = 2400,
		next_id = 24002, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [240001, 240011]};
get_skill(24002) ->
    #skill_data{bid = 24002,
		name = lang:get(<<"Cửu Vĩ"/utf8>>),
		owner = lang:get(<<"Cửu Vĩ"/utf8>>), group = 2400,
		next_id = 24003, min_play_time = 800, level = 2,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [240002, 240012]};
get_skill(24003) ->
    #skill_data{bid = 24003,
		name = lang:get(<<"Cửu Vĩ"/utf8>>),
		owner = lang:get(<<"Cửu Vĩ"/utf8>>), group = 2400,
		next_id = 24004, min_play_time = 800, level = 3,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [240003, 240013, 240021, 240041]};
get_skill(24004) ->
    #skill_data{bid = 24004,
		name = lang:get(<<"Cửu Vĩ"/utf8>>),
		owner = lang:get(<<"Cửu Vĩ"/utf8>>), group = 2400,
		next_id = 24005, min_play_time = 800, level = 4,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [240004, 240014, 240022, 240042]};
get_skill(24005) ->
    #skill_data{bid = 24005,
		name = lang:get(<<"Cửu Vĩ"/utf8>>),
		owner = lang:get(<<"Cửu Vĩ"/utf8>>), group = 2400,
		next_id = 0, min_play_time = 800, level = 5,
		is_normal_skill = 0, cd = 4, type = active_skill,
		target = alive_enemy, count = 1,
		effect_list = [240005, 240015, 240023, 240043]};
get_skill(24011) ->
    #skill_data{bid = 24011,
		name = lang:get(<<"Cửu Vĩ"/utf8>>),
		owner = lang:get(<<"Cửu Vĩ"/utf8>>), group = 2401,
		next_id = 0, min_play_time = 800, level = 1,
		is_normal_skill = 0, cd = 0, type = passive_skill,
		target = self, count = 1, effect_list = [240031]};
get_skill(_) -> undefined.

get_effect(210101) ->
    #effect_data{bid = 210101, group = 2101,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 3080}, {buff, [28210]}],
		 base_hit = 50, hit_type = normal_hit};
get_effect(210102) ->
    #effect_data{bid = 210102, group = 2101,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 3700}, {buff, [28210]}],
		 base_hit = 80, hit_type = normal_hit};
get_effect(210103) ->
    #effect_data{bid = 210103, group = 2101,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 4440}, {buff, [28210]}],
		 base_hit = 110, hit_type = normal_hit};
get_effect(210104) ->
    #effect_data{bid = 210104, group = 2101,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 5330}, {buff, [28210]}],
		 base_hit = 140, hit_type = normal_hit};
get_effect(210105) ->
    #effect_data{bid = 210105, group = 2101,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 6400}, {buff, [28210]}],
		 base_hit = 170, hit_type = normal_hit};
get_effect(210201) ->
    #effect_data{bid = 210201, group = 2102,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 1620}, {buff, [22111]}],
		 base_hit = 100, hit_type = normal_hit};
get_effect(210202) ->
    #effect_data{bid = 210202, group = 2102,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 1950}, {buff, [22111]}],
		 base_hit = 130, hit_type = normal_hit};
get_effect(210203) ->
    #effect_data{bid = 210203, group = 2102,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 2340}, {buff, [22111]}],
		 base_hit = 160, hit_type = normal_hit};
get_effect(210204) ->
    #effect_data{bid = 210204, group = 2102,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 2800}, {buff, [22111]}],
		 base_hit = 190, hit_type = normal_hit};
get_effect(210205) ->
    #effect_data{bid = 210205, group = 2102,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 3370}, {buff, [22111]}],
		 base_hit = 210, hit_type = normal_hit};
get_effect(210301) ->
    #effect_data{bid = 210301, group = 2103,
		 target_type = skill, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [10441]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(210302) ->
    #effect_data{bid = 210302, group = 2103,
		 target_type = skill, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [10442]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(210303) ->
    #effect_data{bid = 210303, group = 2103,
		 target_type = skill, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [10443]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(210304) ->
    #effect_data{bid = 210304, group = 2103,
		 target_type = skill, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [10444]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(210305) ->
    #effect_data{bid = 210305, group = 2103,
		 target_type = skill, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [10445]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(210401) ->
    #effect_data{bid = 210401, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 480}, {target_hp_max, 60}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210402) ->
    #effect_data{bid = 210402, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 580}, {target_hp_max, 70}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210403) ->
    #effect_data{bid = 210403, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 690}, {target_hp_max, 80}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210404) ->
    #effect_data{bid = 210404, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 830}, {target_hp_max, 90}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210405) ->
    #effect_data{bid = 210405, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 1000}, {target_hp_max, 100}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210411) ->
    #effect_data{bid = 210411, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 576}, {target_hp_max, 60}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210412) ->
    #effect_data{bid = 210412, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 696}, {target_hp_max, 70}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210413) ->
    #effect_data{bid = 210413, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 828}, {target_hp_max, 80}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210414) ->
    #effect_data{bid = 210414, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 996}, {target_hp_max, 90}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210415) ->
    #effect_data{bid = 210415, group = 2104,
		 target_type = ally_minimal_hp, target_num = 1,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 1200}, {target_hp_max, 100}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210501) ->
    #effect_data{bid = 210501, group = 2105,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 2600}, {buff, [23211]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210502) ->
    #effect_data{bid = 210502, group = 2105,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 3130}, {buff, [23212]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210503) ->
    #effect_data{bid = 210503, group = 2105,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 3750}, {buff, [23213]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210504) ->
    #effect_data{bid = 210504, group = 2105,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 4500}, {buff, [23214]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210505) ->
    #effect_data{bid = 210505, group = 2105,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = physical,
		 effect_param = [{per, 5400}, {buff, [23215]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(210511) ->
    #effect_data{bid = 210511, group = 2105,
		 target_type = last_target, target_num = 1,
		 effect_type = add_buff, hurt_type = physical,
		 effect_param = [{buff, [21503]}], base_hit = 50,
		 hit_type = normal_hit};
get_effect(220101) ->
    #effect_data{bid = 220101, group = 2201,
		 target_type = enemy_minimal_hp, target_num = 1,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 2790}, {target_attr, [{hp_max, 30}]},
		      {max_hurt, 10000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220102) ->
    #effect_data{bid = 220102, group = 2201,
		 target_type = enemy_minimal_hp, target_num = 1,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 3150}, {target_attr, [{hp_max, 35}]},
		      {max_hurt, 10000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220103) ->
    #effect_data{bid = 220103, group = 2201,
		 target_type = enemy_minimal_hp, target_num = 1,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 3680}, {target_attr, [{hp_max, 40}]},
		      {max_hurt, 10000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220104) ->
    #effect_data{bid = 220104, group = 2201,
		 target_type = enemy_minimal_hp, target_num = 1,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 4420}, {target_attr, [{hp_max, 45}]},
		      {max_hurt, 10000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220105) ->
    #effect_data{bid = 220105, group = 2201,
		 target_type = enemy_minimal_hp, target_num = 1,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 5400}, {target_attr, [{hp_max, 50}]},
		      {max_hurt, 10000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220111) ->
    #effect_data{bid = 220111, group = 2201,
		 target_type = ally_minimal_hp, target_num = 1,
		 effect_type = add_hp, hurt_type = physical,
		 effect_param = [{hurt, 1000}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(220201) ->
    #effect_data{bid = 220201, group = 2202,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 1900}, {buff, [21008]}],
		 base_hit = 300, hit_type = normal_hit};
get_effect(220202) ->
    #effect_data{bid = 220202, group = 2202,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2290}, {buff, [21008]}],
		 base_hit = 400, hit_type = normal_hit};
get_effect(220203) ->
    #effect_data{bid = 220203, group = 2202,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2740}, {buff, [21008]}],
		 base_hit = 500, hit_type = normal_hit};
get_effect(220204) ->
    #effect_data{bid = 220204, group = 2202,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3290}, {buff, [21008]}],
		 base_hit = 600, hit_type = normal_hit};
get_effect(220205) ->
    #effect_data{bid = 220205, group = 2202,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3950}, {buff, [21008]}],
		 base_hit = 700, hit_type = normal_hit};
get_effect(220211) ->
    #effect_data{bid = 220211, group = 2202,
		 target_type = attack, target_num = 3,
		 condition = target_state, passive_effect = when_hurt,
		 condition_param = {buff, 210},
		 effect_type = temporary_add_attr, hurt_type = spells,
		 effect_param = [{dam, 200}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(220301) ->
    #effect_data{bid = 220301, group = 2203,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23011]}], base_hit = 100,
		 hit_type = normal_hit};
get_effect(220302) ->
    #effect_data{bid = 220302, group = 2203,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23011]}], base_hit = 150,
		 hit_type = normal_hit};
get_effect(220303) ->
    #effect_data{bid = 220303, group = 2203,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23011]}], base_hit = 200,
		 hit_type = normal_hit};
get_effect(220304) ->
    #effect_data{bid = 220304, group = 2203,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23011]}], base_hit = 250,
		 hit_type = normal_hit};
get_effect(220305) ->
    #effect_data{bid = 220305, group = 2203,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23011]}], base_hit = 300,
		 hit_type = normal_hit};
get_effect(220311) ->
    #effect_data{bid = 220311, group = 2203,
		 target_type = last_target, target_num = 3,
		 condition = target_state, condition_param = {buff, 230},
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [28011]}], base_hit = 200,
		 hit_type = normal_hit};
get_effect(220321) ->
    #effect_data{bid = 220321, group = 2203,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 1730}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(220322) ->
    #effect_data{bid = 220322, group = 2203,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2080}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(220323) ->
    #effect_data{bid = 220323, group = 2203,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2490}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(220324) ->
    #effect_data{bid = 220324, group = 2203,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2990}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(220325) ->
    #effect_data{bid = 220325, group = 2203,
		 target_type = enemy_and_random, target_num = 3,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3590}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(220401) ->
    #effect_data{bid = 220401, group = 2204,
		 target_type = ally_minimal_hp, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 290}, {target_hp_max, 40}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220402) ->
    #effect_data{bid = 220402, group = 2204,
		 target_type = ally_minimal_hp, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 350}, {target_hp_max, 45}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220403) ->
    #effect_data{bid = 220403, group = 2204,
		 target_type = ally_minimal_hp, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 420}, {target_hp_max, 50}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220404) ->
    #effect_data{bid = 220404, group = 2204,
		 target_type = ally_minimal_hp, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 500}, {target_hp_max, 55}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220405) ->
    #effect_data{bid = 220405, group = 2204,
		 target_type = ally_minimal_hp, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '>', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 600}, {target_hp_max, 60}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220411) ->
    #effect_data{bid = 220411, group = 2204,
		 target_type = last_target, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 435}, {target_hp_max, 60}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220412) ->
    #effect_data{bid = 220412, group = 2204,
		 target_type = last_target, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 525}, {target_hp_max, 68}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220413) ->
    #effect_data{bid = 220413, group = 2204,
		 target_type = last_target, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 630}, {target_hp_max, 75}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220414) ->
    #effect_data{bid = 220414, group = 2204,
		 target_type = last_target, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 750}, {target_hp_max, 83}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220415) ->
    #effect_data{bid = 220415, group = 2204,
		 target_type = last_target, target_num = 3,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 900}, {target_hp_max, 90}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220421) ->
    #effect_data{bid = 220421, group = 2204,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [11701, 10991]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220422) ->
    #effect_data{bid = 220422, group = 2204,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [11702, 10992]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220423) ->
    #effect_data{bid = 220423, group = 2204,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [11703, 10993]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220424) ->
    #effect_data{bid = 220424, group = 2204,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [11704, 10994]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(220425) ->
    #effect_data{bid = 220425, group = 2204,
		 target_type = last_target, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [11705, 10995]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230101) ->
    #effect_data{bid = 230101, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = change_effect_id, hurt_type = spells,
		 effect_param = [{[230111], 800}, {[230121], 200}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230102) ->
    #effect_data{bid = 230102, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = change_effect_id, hurt_type = spells,
		 effect_param = [{[230112], 800}, {[230122], 200}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230103) ->
    #effect_data{bid = 230103, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = change_effect_id, hurt_type = spells,
		 effect_param = [{[230113], 1000}, {[230123], 0}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230104) ->
    #effect_data{bid = 230104, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = change_effect_id, hurt_type = spells,
		 effect_param = [{[230114], 1000}, {[230124], 0}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230105) ->
    #effect_data{bid = 230105, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = change_effect_id, hurt_type = spells,
		 effect_param = [{[230115], 1000}, {[230125], 0}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230111) ->
    #effect_data{bid = 230111, group = 2301,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = spells,
		 effect_param =
		     [{per, 4730}, {target_attr, [{hp_max, 50}]},
		      {max_hurt, 15000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230112) ->
    #effect_data{bid = 230112, group = 2301,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = spells,
		 effect_param =
		     [{per, 5680}, {target_attr, [{hp_max, 60}]},
		      {max_hurt, 15000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230113) ->
    #effect_data{bid = 230113, group = 2301,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = spells,
		 effect_param =
		     [{per, 6920}, {target_attr, [{hp_max, 70}]},
		      {max_hurt, 15000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230114) ->
    #effect_data{bid = 230114, group = 2301,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = spells,
		 effect_param =
		     [{per, 8500}, {target_attr, [{hp_max, 80}]},
		      {max_hurt, 15000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230115) ->
    #effect_data{bid = 230115, group = 2301,
		 target_type = skill, target_num = 1, effect_type = hurt,
		 hurt_type = spells,
		 effect_param =
		     [{per, 10000}, {target_attr, [{hp_max, 100}]},
		      {max_hurt, 15000}, {ignore_def, 200}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230121) ->
    #effect_data{bid = 230121, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param = [{per, 100}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230122) ->
    #effect_data{bid = 230122, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param = [{per, 100}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230123) ->
    #effect_data{bid = 230123, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param = [{per, 100}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230124) ->
    #effect_data{bid = 230124, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param = [{per, 100}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230125) ->
    #effect_data{bid = 230125, group = 2301,
		 target_type = skill, target_num = 1,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param = [{per, 100}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230201) ->
    #effect_data{bid = 230201, group = 2302,
		 target_type = ally_and_random, target_num = 5,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [19201]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230202) ->
    #effect_data{bid = 230202, group = 2302,
		 target_type = ally_and_random, target_num = 5,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [19201]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230203) ->
    #effect_data{bid = 230203, group = 2302,
		 target_type = ally_and_random, target_num = 5,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [19201]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230204) ->
    #effect_data{bid = 230204, group = 2302,
		 target_type = ally_and_random, target_num = 5,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [19201]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230205) ->
    #effect_data{bid = 230205, group = 2302,
		 target_type = ally_and_random, target_num = 5,
		 condition = target_state,
		 condition_param = {hp_per, '=<', 300},
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [19201]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230211) ->
    #effect_data{bid = 230211, group = 2302,
		 target_type = last_target, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 260}, {target_hp_max, 30}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230212) ->
    #effect_data{bid = 230212, group = 2302,
		 target_type = last_target, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 320}, {target_hp_max, 35}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230213) ->
    #effect_data{bid = 230213, group = 2302,
		 target_type = last_target, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 380}, {target_hp_max, 40}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230214) ->
    #effect_data{bid = 230214, group = 2302,
		 target_type = last_target, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 460}, {target_hp_max, 45}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230215) ->
    #effect_data{bid = 230215, group = 2302,
		 target_type = last_target, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 550}, {target_hp_max, 50}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230291) ->
    #effect_data{bid = 230291, group = 2304,
		 target_type = self, target_num = 1,
		 effect_type = revive, hurt_type = spells,
		 effect_param =
		     [{target_hp_max, 1}, {remove_buff, [19201]}],
		 base_hit = 1000,
		 extra_param =
		     [{base_hit_by_round_skill,
		       [{2, 0}, {3, 0}, {4, 0}, {5, 0}]}],
		 hit_type = normal_hit};
get_effect(230301) ->
    #effect_data{bid = 230301, group = 2303,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 2060}, {enhance_by_buff, {210, 100, 1}},
		      {max_hurt, 5000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230302) ->
    #effect_data{bid = 230302, group = 2303,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 2470}, {enhance_by_buff, {210, 100, 1}},
		      {max_hurt, 5000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230303) ->
    #effect_data{bid = 230303, group = 2303,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 2970}, {enhance_by_buff, {210, 100, 1}},
		      {max_hurt, 5000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230304) ->
    #effect_data{bid = 230304, group = 2303,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 3560}, {enhance_by_buff, {210, 100, 1}},
		      {max_hurt, 5000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230305) ->
    #effect_data{bid = 230305, group = 2303,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param =
		     [{per, 4270}, {enhance_by_buff, {210, 100, 1}},
		      {max_hurt, 5000}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230311) ->
    #effect_data{bid = 230311, group = 2303,
		 target_type = last_target, target_num = 5,
		 condition = target_state,
		 condition_param = {buff_num, 210, 3},
		 effect_type = add_buff, hurt_type = physical,
		 effect_param = [{buff, [28210]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230401) ->
    #effect_data{bid = 230401, group = 2304,
		 target_type = enemy_back_row, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 1740}, {buff, [28210]}],
		 base_hit = 150, hit_type = effect_hit};
get_effect(230402) ->
    #effect_data{bid = 230402, group = 2304,
		 target_type = enemy_back_row, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2080}, {buff, [28210]}],
		 base_hit = 200, hit_type = effect_hit};
get_effect(230403) ->
    #effect_data{bid = 230403, group = 2304,
		 target_type = enemy_back_row, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2500}, {buff, [28210]}],
		 base_hit = 250, hit_type = effect_hit};
get_effect(230404) ->
    #effect_data{bid = 230404, group = 2304,
		 target_type = enemy_back_row, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3000}, {buff, [28210]}],
		 base_hit = 300, hit_type = effect_hit};
get_effect(230405) ->
    #effect_data{bid = 230405, group = 2304,
		 target_type = enemy_back_row, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3590}, {buff, [28210]}],
		 base_hit = 350, hit_type = effect_hit};
get_effect(230411) ->
    #effect_data{bid = 230411, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 1740}, {buff, [28210]}],
		 base_hit = 135, hit_type = effect_hit};
get_effect(230412) ->
    #effect_data{bid = 230412, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2080}, {buff, [28210]}],
		 base_hit = 180, hit_type = effect_hit};
get_effect(230413) ->
    #effect_data{bid = 230413, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2500}, {buff, [28210]}],
		 base_hit = 225, hit_type = effect_hit};
get_effect(230414) ->
    #effect_data{bid = 230414, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3000}, {buff, [28210]}],
		 base_hit = 270, hit_type = effect_hit};
get_effect(230415) ->
    #effect_data{bid = 230415, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3590}, {buff, [28210]}],
		 base_hit = 315, hit_type = effect_hit};
get_effect(230421) ->
    #effect_data{bid = 230421, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 1740}, {buff, [28210]}],
		 base_hit = 105, hit_type = effect_hit};
get_effect(230422) ->
    #effect_data{bid = 230422, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2080}, {buff, [28210]}],
		 base_hit = 140, hit_type = effect_hit};
get_effect(230423) ->
    #effect_data{bid = 230423, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2500}, {buff, [28210]}],
		 base_hit = 175, hit_type = effect_hit};
get_effect(230424) ->
    #effect_data{bid = 230424, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3000}, {buff, [28210]}],
		 base_hit = 210, hit_type = effect_hit};
get_effect(230425) ->
    #effect_data{bid = 230425, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3590}, {buff, [28210]}],
		 base_hit = 245, hit_type = effect_hit};
get_effect(230431) ->
    #effect_data{bid = 230431, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 1740}, {buff, [28210]}],
		 base_hit = 75, hit_type = effect_hit};
get_effect(230432) ->
    #effect_data{bid = 230432, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2080}, {buff, [28210]}],
		 base_hit = 100, hit_type = effect_hit};
get_effect(230433) ->
    #effect_data{bid = 230433, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2500}, {buff, [28210]}],
		 base_hit = 125, hit_type = effect_hit};
get_effect(230434) ->
    #effect_data{bid = 230434, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3000}, {buff, [28210]}],
		 base_hit = 150, hit_type = effect_hit};
get_effect(230435) ->
    #effect_data{bid = 230435, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3590}, {buff, [28210]}],
		 base_hit = 175, hit_type = effect_hit};
get_effect(230441) ->
    #effect_data{bid = 230441, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 1740}, {buff, [28210]}],
		 base_hit = 45, hit_type = effect_hit};
get_effect(230442) ->
    #effect_data{bid = 230442, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2080}, {buff, [28210]}],
		 base_hit = 60, hit_type = effect_hit};
get_effect(230443) ->
    #effect_data{bid = 230443, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2500}, {buff, [28210]}],
		 base_hit = 75, hit_type = effect_hit};
get_effect(230444) ->
    #effect_data{bid = 230444, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3000}, {buff, [28210]}],
		 base_hit = 90, hit_type = effect_hit};
get_effect(230445) ->
    #effect_data{bid = 230445, group = 2304,
		 target_type = not_selected, target_num = 1,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3590}, {buff, [28210]}],
		 base_hit = 105, hit_type = effect_hit};
get_effect(230501) ->
    #effect_data{bid = 230501, group = 2305,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 2060}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230502) ->
    #effect_data{bid = 230502, group = 2305,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 2470}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230503) ->
    #effect_data{bid = 230503, group = 2305,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 2970}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230504) ->
    #effect_data{bid = 230504, group = 2305,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 3560}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230505) ->
    #effect_data{bid = 230505, group = 2305,
		 target_type = enemy_and_random, target_num = 5,
		 effect_type = hurt, hurt_type = physical,
		 effect_param = [{per, 4270}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230511) ->
    #effect_data{bid = 230511, group = 2305,
		 target_type = ally_and_random, target_num = 5,
		 effect_type = add_buff, hurt_type = physical,
		 effect_param = [{buff, [10741]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230512) ->
    #effect_data{bid = 230512, group = 2305,
		 target_type = ally_and_random, target_num = 5,
		 effect_type = add_buff, hurt_type = physical,
		 effect_param = [{buff, [10742]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230513) ->
    #effect_data{bid = 230513, group = 2305,
		 target_type = ally_and_random, target_num = 5,
		 effect_type = add_buff, hurt_type = physical,
		 effect_param = [{buff, [10743]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230514) ->
    #effect_data{bid = 230514, group = 2305,
		 target_type = ally_and_random, target_num = 5,
		 effect_type = add_buff, hurt_type = physical,
		 effect_param = [{buff, [10744]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230515) ->
    #effect_data{bid = 230515, group = 2305,
		 target_type = ally_and_random, target_num = 5,
		 effect_type = add_buff, hurt_type = physical,
		 effect_param = [{buff, [10745]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230601) ->
    #effect_data{bid = 230601, group = 2306,
		 target_type = max_atk_ally, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [10151, 11901]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230602) ->
    #effect_data{bid = 230602, group = 2306,
		 target_type = max_atk_ally, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [10152, 11902]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230603) ->
    #effect_data{bid = 230603, group = 2306,
		 target_type = max_atk_ally, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [10153, 11903]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230604) ->
    #effect_data{bid = 230604, group = 2306,
		 target_type = max_atk_ally, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [10154, 11904]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230605) ->
    #effect_data{bid = 230605, group = 2306,
		 target_type = max_atk_ally, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [10155, 11905]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230611) ->
    #effect_data{bid = 230611, group = 2306,
		 target_type = skill, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23321]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230612) ->
    #effect_data{bid = 230612, group = 2306,
		 target_type = skill, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23322]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230613) ->
    #effect_data{bid = 230613, group = 2306,
		 target_type = skill, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23323]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230614) ->
    #effect_data{bid = 230614, group = 2306,
		 target_type = skill, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23324]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230615) ->
    #effect_data{bid = 230615, group = 2306,
		 target_type = skill, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [23325]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230621) ->
    #effect_data{bid = 230621, group = 2306,
		 target_type = last_target, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [21403]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230622) ->
    #effect_data{bid = 230622, group = 2306,
		 target_type = last_target, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [21403]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230623) ->
    #effect_data{bid = 230623, group = 2306,
		 target_type = last_target, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [21403]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230624) ->
    #effect_data{bid = 230624, group = 2306,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [21403]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230625) ->
    #effect_data{bid = 230625, group = 2306,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [21403]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230701) ->
    #effect_data{bid = 230701, group = 2307,
		 target_type = enemy_2_3_row_acc_with_atk,
		 target_num = 3, effect_type = add_buff,
		 hurt_type = physical, effect_param = [{buff, [16701]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230702) ->
    #effect_data{bid = 230702, group = 2307,
		 target_type = enemy_2_3_row_acc_with_atk,
		 target_num = 3, effect_type = add_buff,
		 hurt_type = physical, effect_param = [{buff, [16702]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230703) ->
    #effect_data{bid = 230703, group = 2307,
		 target_type = enemy_2_3_row_acc_with_atk,
		 target_num = 3, effect_type = add_buff,
		 hurt_type = physical, effect_param = [{buff, [16703]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230704) ->
    #effect_data{bid = 230704, group = 2307,
		 target_type = enemy_2_3_row_acc_with_atk,
		 target_num = 3, effect_type = add_buff,
		 hurt_type = physical, effect_param = [{buff, [16704]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230705) ->
    #effect_data{bid = 230705, group = 2307,
		 target_type = enemy_2_3_row_acc_with_atk,
		 target_num = 3, effect_type = add_buff,
		 hurt_type = physical, effect_param = [{buff, [16705]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230011) ->
    #effect_data{bid = 230011, group = 2300,
		 target_type = attack, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [28002]}], base_hit = 150,
		 extra_param = [{skill_hit_magic_only, true}],
		 hit_type = effect_hit};
get_effect(230021) ->
    #effect_data{bid = 230021, group = 2300,
		 target_type = attack, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [28002]}], base_hit = 180,
		 extra_param = [{skill_hit_magic_only, true}],
		 hit_type = effect_hit};
get_effect(230031) ->
    #effect_data{bid = 230031, group = 2300,
		 target_type = attack, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [28002]}], base_hit = 210,
		 extra_param = [{skill_hit_magic_only, true}],
		 hit_type = effect_hit};
get_effect(230041) ->
    #effect_data{bid = 230041, group = 2300,
		 target_type = attack, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [28002]}], base_hit = 240,
		 extra_param = [{skill_hit_magic_only, true}],
		 hit_type = effect_hit};
get_effect(230051) ->
    #effect_data{bid = 230051, group = 2300,
		 target_type = attack, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [28002]}], base_hit = 270,
		 extra_param = [{skill_hit_magic_only, true}],
		 hit_type = effect_hit};
get_effect(230801) ->
    #effect_data{bid = 230801, group = 2308,
		 target_type = ally_minimal_hp, target_num = 3,
		 effect_type = reduce_buff, hurt_type = spells,
		 effect_param = [{[2], all}], base_hit = 1000,
		 hit_type = normal_hit,
		 effect_desc = lang:get(<<"净化"/utf8>>)};
get_effect(230802) ->
    #effect_data{bid = 230802, group = 2308,
		 target_type = ally_minimal_hp, target_num = 3,
		 effect_type = reduce_buff, hurt_type = spells,
		 effect_param = [{[2], all}], base_hit = 1000,
		 hit_type = normal_hit,
		 effect_desc = lang:get(<<"净化"/utf8>>)};
get_effect(230803) ->
    #effect_data{bid = 230803, group = 2308,
		 target_type = ally_minimal_hp, target_num = 3,
		 effect_type = reduce_buff, hurt_type = spells,
		 effect_param = [{[2, 3], all}], base_hit = 1000,
		 hit_type = normal_hit,
		 effect_desc = lang:get(<<"净化"/utf8>>)};
get_effect(230804) ->
    #effect_data{bid = 230804, group = 2308,
		 target_type = ally_minimal_hp, target_num = 3,
		 effect_type = reduce_buff, hurt_type = spells,
		 effect_param = [{[2, 3], all}], base_hit = 1000,
		 hit_type = normal_hit,
		 effect_desc = lang:get(<<"净化"/utf8>>)};
get_effect(230805) ->
    #effect_data{bid = 230805, group = 2308,
		 target_type = ally_minimal_hp, target_num = 4,
		 effect_type = reduce_buff, hurt_type = spells,
		 effect_param = [{[2, 3], all}], base_hit = 1000,
		 hit_type = normal_hit,
		 effect_desc = lang:get(<<"净化"/utf8>>)};
get_effect(230811) ->
    #effect_data{bid = 230811, group = 2308,
		 target_type = last_target_select_num, target_num = 3,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 300}, {target_hp_max, 40}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230812) ->
    #effect_data{bid = 230812, group = 2308,
		 target_type = last_target_select_num, target_num = 3,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 370}, {target_hp_max, 45}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230813) ->
    #effect_data{bid = 230813, group = 2308,
		 target_type = last_target_select_num, target_num = 3,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 440}, {target_hp_max, 50}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230814) ->
    #effect_data{bid = 230814, group = 2308,
		 target_type = last_target_select_num, target_num = 3,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 550}, {target_hp_max, 55}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230815) ->
    #effect_data{bid = 230815, group = 2308,
		 target_type = last_target_select_num, target_num = 4,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 670}, {target_hp_max, 60}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230824) ->
    #effect_data{bid = 230824, group = 2308,
		 target_type = last_target_select_num, target_num = 3,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [10994]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230825) ->
    #effect_data{bid = 230825, group = 2308,
		 target_type = last_target_select_num, target_num = 4,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [10995]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230834) ->
    #effect_data{bid = 230834, group = 2308,
		 target_type = ally_random, target_num = 1,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [16801]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230835) ->
    #effect_data{bid = 230835, group = 2308,
		 target_type = ally_random, target_num = 2,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [16801]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232001) ->
    #effect_data{bid = 232001, group = 2311,
		 target_type = ally_minimal_hp, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 300}, {target_hp_max, 40}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232002) ->
    #effect_data{bid = 232002, group = 2311,
		 target_type = ally_minimal_hp, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 370}, {target_hp_max, 45}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232003) ->
    #effect_data{bid = 232003, group = 2311,
		 target_type = ally_minimal_hp, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 440}, {target_hp_max, 50}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232004) ->
    #effect_data{bid = 232004, group = 2311,
		 target_type = ally_minimal_hp, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 550}, {target_hp_max, 55}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232005) ->
    #effect_data{bid = 232005, group = 2311,
		 target_type = ally_minimal_hp, target_num = 5,
		 effect_type = add_hp, hurt_type = spells,
		 effect_param =
		     [{actor_hp_max, 670}, {target_hp_max, 60}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232011) ->
    #effect_data{bid = 232011, group = 2311,
		 target_type = last_target, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [14233, 14225, 14215, 16301, 16801]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232012) ->
    #effect_data{bid = 232012, group = 2311,
		 target_type = last_target, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [14233, 14225, 14215, 16301, 16801]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232013) ->
    #effect_data{bid = 232013, group = 2311,
		 target_type = last_target, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [14233, 14225, 14215, 16301, 16801]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232014) ->
    #effect_data{bid = 232014, group = 2311,
		 target_type = last_target, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [14233, 14225, 14215, 16301, 16801]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232015) ->
    #effect_data{bid = 232015, group = 2311,
		 target_type = last_target, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param =
		     [{buff, [14233, 14225, 14215, 16301, 16801]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230901) ->
    #effect_data{bid = 230901, group = 2309,
		 target_type = last_target, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param =
		     [{per, 2060}, {buff, [14121]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230902) ->
    #effect_data{bid = 230902, group = 2309,
		 target_type = last_target, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param =
		     [{per, 2470}, {buff, [14121]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230903) ->
    #effect_data{bid = 230903, group = 2309,
		 target_type = last_target, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param =
		     [{per, 2970}, {buff, [14121]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230904) ->
    #effect_data{bid = 230904, group = 2309,
		 target_type = last_target, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param =
		     [{per, 3560}, {buff, [14121]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230905) ->
    #effect_data{bid = 230905, group = 2309,
		 target_type = last_target, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param =
		     [{per, 4270}, {buff, [14121]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(230913) ->
    #effect_data{bid = 230913, group = 2309,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14143]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230914) ->
    #effect_data{bid = 230914, group = 2309,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14144]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230915) ->
    #effect_data{bid = 230915, group = 2309,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14145]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(230925) ->
    #effect_data{bid = 230925, group = 2309,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14146]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232101) ->
    #effect_data{bid = 232101, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2060}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232102) ->
    #effect_data{bid = 232102, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2470}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232103) ->
    #effect_data{bid = 232103, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2970}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232104) ->
    #effect_data{bid = 232104, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3560}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232105) ->
    #effect_data{bid = 232105, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 4270}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232111) ->
    #effect_data{bid = 232111, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{real_attr2, [{atk, 100}]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232112) ->
    #effect_data{bid = 232112, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{real_attr2, [{atk, 150}]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232113) ->
    #effect_data{bid = 232113, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{real_attr2, [{atk, 200}]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232114) ->
    #effect_data{bid = 232114, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{real_attr2, [{atk, 300}]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232115) ->
    #effect_data{bid = 232115, group = 2321,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{real_attr2, [{atk, 400}]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232121) ->
    #effect_data{bid = 232121, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14461]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232121) ->
    #effect_data{bid = 232121, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14461, 14461]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232123) ->
    #effect_data{bid = 232123, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = reduce_buff, hurt_type = spells,
		 effect_param = [{[1], all}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232124) ->
    #effect_data{bid = 232124, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = reduce_buff, hurt_type = spells,
		 effect_param = [{[1], all}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232125) ->
    #effect_data{bid = 232125, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = reduce_buff, hurt_type = spells,
		 effect_param = [{[1], all}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232133) ->
    #effect_data{bid = 232133, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14461, 14461]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232134) ->
    #effect_data{bid = 232134, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14461, 14461]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232144) ->
    #effect_data{bid = 232144, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14461, 14461]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232135) ->
    #effect_data{bid = 232135, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14461, 14461]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232154) ->
    #effect_data{bid = 232154, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14462, 14462]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232164) ->
    #effect_data{bid = 232164, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14462, 14462]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232145) ->
    #effect_data{bid = 232145, group = 2321,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14462, 14462]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232201) ->
    #effect_data{bid = 232201, group = 2322,
		 target_type = skill, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 2560}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232202) ->
    #effect_data{bid = 232202, group = 2322,
		 target_type = skill, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3070}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232203) ->
    #effect_data{bid = 232203, group = 2322,
		 target_type = skill, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param =
		     [{per, 3690}, {buff, [21001]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232204) ->
    #effect_data{bid = 232204, group = 2322,
		 target_type = skill, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param =
		     [{per, 4430}, {buff, [21001]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232205) ->
    #effect_data{bid = 232205, group = 2322,
		 target_type = skill, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param =
		     [{per, 5320}, {buff, [21001]}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232211) ->
    #effect_data{bid = 232211, group = 2322,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14531]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232212) ->
    #effect_data{bid = 232212, group = 2322,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14532]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232213) ->
    #effect_data{bid = 232213, group = 2322,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14533]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232214) ->
    #effect_data{bid = 232214, group = 2322,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14534]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232215) ->
    #effect_data{bid = 232215, group = 2322,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14535, 14561]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232224) ->
    #effect_data{bid = 232224, group = 2322,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14534]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232235) ->
    #effect_data{bid = 232235, group = 2322,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14535, 14561]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232234) ->
    #effect_data{bid = 232234, group = 2322,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14534]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(232225) ->
    #effect_data{bid = 232225, group = 2322,
		 target_type = skill, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14535, 14561, 21001]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(232245) ->
    #effect_data{bid = 232245, group = 2322,
		 target_type = last_target, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14535, 14561, 21001]}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(240001) ->
    #effect_data{bid = 240001, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 3700}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(240002) ->
    #effect_data{bid = 240002, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 4440}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(240003) ->
    #effect_data{bid = 240003, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 5340}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(240004) ->
    #effect_data{bid = 240004, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 6400}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(240005) ->
    #effect_data{bid = 240005, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = hurt, hurt_type = spells,
		 effect_param = [{per, 7680}, {make_eff_play, 1}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(240011) ->
    #effect_data{bid = 240011, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [22102]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240012) ->
    #effect_data{bid = 240012, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [22107]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240013) ->
    #effect_data{bid = 240013, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [22107]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240014) ->
    #effect_data{bid = 240014, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [22103]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240015) ->
    #effect_data{bid = 240015, group = 2400,
		 target_type = enemy_and_random, target_num = 99,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [22108]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240021) ->
    #effect_data{bid = 240021, group = 2401,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14701]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240022) ->
    #effect_data{bid = 240022, group = 2401,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14701]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240023) ->
    #effect_data{bid = 240023, group = 2401,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14702]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240031) ->
    #effect_data{bid = 240031, group = 2401,
		 target_type = self, target_num = 5,
		 effect_type = use_skill, hurt_type = spells,
		 effect_param = [{skill_id, 1}, {use_ex, use_ex}],
		 base_hit = 1000, hit_type = normal_hit};
get_effect(240041) ->
    #effect_data{bid = 240041, group = 2401,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14703]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240042) ->
    #effect_data{bid = 240042, group = 2401,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14703]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(240043) ->
    #effect_data{bid = 240043, group = 2401,
		 target_type = max_atk_ally, target_num = 5,
		 effect_type = add_buff, hurt_type = spells,
		 effect_param = [{buff, [14704]}], base_hit = 1000,
		 hit_type = normal_hit};
get_effect(_) -> undefined.

get_skill_id_by_group(2101, 1) -> 21011;
get_skill_id_by_group(2101, 2) -> 21012;
get_skill_id_by_group(2101, 3) -> 21013;
get_skill_id_by_group(2101, 4) -> 21014;
get_skill_id_by_group(2101, 5) -> 21015;
get_skill_id_by_group(2102, 1) -> 21021;
get_skill_id_by_group(2102, 2) -> 21022;
get_skill_id_by_group(2102, 3) -> 21023;
get_skill_id_by_group(2102, 4) -> 21024;
get_skill_id_by_group(2102, 5) -> 21025;
get_skill_id_by_group(2103, 1) -> 21031;
get_skill_id_by_group(2103, 2) -> 21032;
get_skill_id_by_group(2103, 3) -> 21033;
get_skill_id_by_group(2103, 4) -> 21034;
get_skill_id_by_group(2103, 5) -> 21035;
get_skill_id_by_group(2104, 1) -> 21041;
get_skill_id_by_group(2104, 2) -> 21042;
get_skill_id_by_group(2104, 3) -> 21043;
get_skill_id_by_group(2104, 4) -> 21044;
get_skill_id_by_group(2104, 5) -> 21045;
get_skill_id_by_group(2105, 1) -> 21051;
get_skill_id_by_group(2105, 2) -> 21052;
get_skill_id_by_group(2105, 3) -> 21053;
get_skill_id_by_group(2105, 4) -> 21054;
get_skill_id_by_group(2105, 5) -> 21055;
get_skill_id_by_group(2201, 1) -> 22011;
get_skill_id_by_group(2201, 2) -> 22012;
get_skill_id_by_group(2201, 3) -> 22013;
get_skill_id_by_group(2201, 4) -> 22014;
get_skill_id_by_group(2201, 5) -> 22015;
get_skill_id_by_group(2202, 1) -> 22021;
get_skill_id_by_group(2202, 2) -> 22022;
get_skill_id_by_group(2202, 3) -> 22023;
get_skill_id_by_group(2202, 4) -> 22024;
get_skill_id_by_group(2202, 5) -> 22025;
get_skill_id_by_group(2203, 1) -> 22031;
get_skill_id_by_group(2203, 2) -> 22032;
get_skill_id_by_group(2203, 3) -> 22033;
get_skill_id_by_group(2203, 4) -> 22034;
get_skill_id_by_group(2203, 5) -> 22035;
get_skill_id_by_group(2204, 1) -> 22041;
get_skill_id_by_group(2204, 2) -> 22042;
get_skill_id_by_group(2204, 3) -> 22043;
get_skill_id_by_group(2204, 4) -> 22044;
get_skill_id_by_group(2204, 5) -> 22045;
get_skill_id_by_group(2301, 1) -> 23011;
get_skill_id_by_group(2301, 2) -> 23012;
get_skill_id_by_group(2301, 3) -> 23013;
get_skill_id_by_group(2301, 4) -> 23014;
get_skill_id_by_group(2301, 5) -> 23015;
get_skill_id_by_group(2302, 1) -> 23021;
get_skill_id_by_group(2302, 2) -> 23022;
get_skill_id_by_group(2302, 3) -> 23023;
get_skill_id_by_group(2302, 4) -> 23024;
get_skill_id_by_group(2302, 5) -> 23025;
get_skill_id_by_group(2302, 10) -> 23029;
get_skill_id_by_group(2303, 1) -> 23031;
get_skill_id_by_group(2303, 2) -> 23032;
get_skill_id_by_group(2303, 3) -> 23033;
get_skill_id_by_group(2303, 4) -> 23034;
get_skill_id_by_group(2303, 5) -> 23035;
get_skill_id_by_group(2304, 1) -> 23041;
get_skill_id_by_group(2304, 2) -> 23042;
get_skill_id_by_group(2304, 3) -> 23043;
get_skill_id_by_group(2304, 4) -> 23044;
get_skill_id_by_group(2304, 5) -> 23045;
get_skill_id_by_group(2305, 1) -> 23051;
get_skill_id_by_group(2305, 2) -> 23052;
get_skill_id_by_group(2305, 3) -> 23053;
get_skill_id_by_group(2305, 4) -> 23054;
get_skill_id_by_group(2305, 5) -> 23055;
get_skill_id_by_group(2306, 1) -> 23061;
get_skill_id_by_group(2306, 2) -> 23062;
get_skill_id_by_group(2306, 3) -> 23063;
get_skill_id_by_group(2306, 4) -> 23064;
get_skill_id_by_group(2306, 5) -> 23065;
get_skill_id_by_group(2307, 1) -> 23071;
get_skill_id_by_group(2307, 2) -> 23072;
get_skill_id_by_group(2307, 3) -> 23073;
get_skill_id_by_group(2307, 4) -> 23074;
get_skill_id_by_group(2307, 5) -> 23075;
get_skill_id_by_group(2300, 1) -> 23001;
get_skill_id_by_group(2300, 2) -> 23002;
get_skill_id_by_group(2300, 3) -> 23003;
get_skill_id_by_group(2300, 4) -> 23004;
get_skill_id_by_group(2300, 5) -> 23005;
get_skill_id_by_group(2308, 1) -> 23081;
get_skill_id_by_group(2308, 2) -> 23082;
get_skill_id_by_group(2308, 3) -> 23083;
get_skill_id_by_group(2308, 4) -> 23084;
get_skill_id_by_group(2308, 5) -> 23085;
get_skill_id_by_group(2311, 1) -> 23201;
get_skill_id_by_group(2311, 2) -> 23202;
get_skill_id_by_group(2311, 3) -> 23203;
get_skill_id_by_group(2311, 4) -> 23204;
get_skill_id_by_group(2311, 5) -> 23205;
get_skill_id_by_group(2309, 5) -> 23095;
get_skill_id_by_group(2309, 4) -> 23094;
get_skill_id_by_group(2309, 3) -> 23093;
get_skill_id_by_group(2309, 2) -> 23092;
get_skill_id_by_group(2309, 1) -> 23091;
get_skill_id_by_group(2321, 5) -> 23215;
get_skill_id_by_group(2321, 4) -> 23214;
get_skill_id_by_group(2321, 3) -> 23213;
get_skill_id_by_group(2321, 2) -> 23212;
get_skill_id_by_group(2321, 1) -> 23211;
get_skill_id_by_group(2322, 1) -> 23221;
get_skill_id_by_group(2322, 2) -> 23222;
get_skill_id_by_group(2322, 3) -> 23223;
get_skill_id_by_group(2322, 4) -> 23224;
get_skill_id_by_group(2322, 5) -> 23225;
get_skill_id_by_group(2401, 1) -> 24011;
get_skill_id_by_group(2400, 5) -> 24005;
get_skill_id_by_group(2400, 4) -> 24004;
get_skill_id_by_group(2400, 3) -> 24003;
get_skill_id_by_group(2400, 2) -> 24002;
get_skill_id_by_group(2400, 1) -> 24001;
get_skill_id_by_group(_Id, _Lev) -> undefined.


