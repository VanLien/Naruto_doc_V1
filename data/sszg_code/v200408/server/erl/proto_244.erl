-file("src/proto/proto_244.erl", 1).

-module(proto_244).

-lager_records([{combat_drama,
		 [id, next, timeout, ts, winner, play_list, combat_list,
		  guide_list]},
		{item_reward_p, [bid, is_bind, num]},
		{assets_reward_p, [type, val]},
		{exp_reward_p,
		 [object_type, object_id, srv_id, career, sex, old_lev,
		  old_exp, new_lev, new_exp, is_die, assets_reward]},
		{combat_order_p, [pos, distance, group]},
		{skill_p, [skill_bid, end_round]},
		{fight_object_p,
		 [pos, group, owner_id, owner_srv_id, object_type,
		  object_id, object_bid, is_awake, star, object_name, sex,
		  career, lev, hp, hp_max, face_id, round, skills,
		  is_strong_partner, extra_data, camp_type, sprites]},
		{buff_play,
		 [target, buff_bid, end_round, remain_round, action_type,
		  change_type, change_value, is_dead, id, id2]},
		{sub_effect_play,
		 [sub_target, sub_effect_id, sub_hp_changed,
		  sub_distance, sub_is_hit, sub_skill_id, extra_effect]},
		{effect_play,
		 [order, actor, target, effect_bid, is_hit, is_crit,
		  hp_changed, hp, buff_list, summon_list, distance,
		  is_dead, sub_effect_play_list, is_blind,
		  skill_bid_of_effect, actor_hp_changed, actor_is_dead,
		  aid_actor, total_hurt, hurt_reward, camp_restrain]},
		{skill_play,
		 [order, actor, target, skill_bid, talk_pos,
		  talk_content, effect_play]},
		{mon_ai,
		 [bid, name, ai, is_loop, condition, rate, skill_target,
		  skill_id, talk_target, talk_content]},
		{combat_result,
		 [result, dead_monster_num, wave_num, dead_partner,
		  replay_id, a_stat_info, b_stat_info, end_type,
		  opponent_id, total_hurt, action_count, group_a_num,
		  hurt_statistics_a, curt_statistics_a, hurt_statistics,
		  replay_info, combat_pid, a_halo_dizzy_num,
		  a_max_num_def, a_control_info, a_kill_info,
		  a_continue_hurt, a_revive_info, a_dodge_count,
		  a_anti_kill_count, a_halo_kill_count, a_fire_buff_num,
		  hurt_statistics_b, curt_statistics_b, b_halo_dizzy_num,
		  b_max_num_def, b_control_info, b_kill_info,
		  b_continue_hurt, b_revive_info, b_dodge_count,
		  b_anti_kill_count, b_halo_kill_count, b_fire_buff_num,
		  is_balance, a_sprite_kill_count]},
		{partner_hurt,
		 [master_id, id, bid, star, lev, camp_type, dps, cure,
		  ext_data, be_hurt]},
		{combat,
		 [type, attack_list, defend_list, combat_roles,
		  formation, on_combat_begin, on_combat_end,
		  on_role_combat_end, state_end_time, round_countdown,
		  min_play_time, take_action, ext_args, wave, total_wave,
		  multi_wave_defend, combat_result, is_pause, combat_map,
		  combat_drama, target_role_name, is_combat_end, end_time,
		  begin_time, watching_roles, is_skip, round, is_robot,
		  select_buff_callback, terminate_func, attack_power,
		  defend_power, replay_info, other_arge]},
		{combat_buff,
		 [id, bid, actor, group, end_round, buff_result_type,
		  positive_or_negative, buff_result, join_num, can_reduce,
		  lev, probability, clean_when_dead, hit_count, is_show,
		  wave, group_pro]},
		{fight_object,
		 [master_id, master_pid, object_type, object_id,
		  object_bid, is_clone, is_auto, is_leader, host_bid,
		  object_name, is_awake, star, sex, career, lev, face_id,
		  hp, hp_max, pos, round, wave_round, distance,
		  rand_speed, init_attr, base_attr, fight_attr,
		  active_skills, passive_skills, skill_order, buff_list,
		  owner_id, passive_effects_of_skill, is_boss,
		  is_strong_partner, quality, initial_hp_max, extra_data,
		  awaken_type, camp_type, power, replay, hallows_looks,
		  sprites, guild_break_power]},
		{combat_role,
		 [id, pid, conn_pid, name, gid, gname, is_auto, is_ready,
		  is_play_over, is_offline, group, auto_watch_model, lev,
		  face_id, watching, is_load_map_finish]},
		{combat_buff_data,
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
		{m_skill, [skills_used, skills_owned]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{expedition_replay_partner, [pos, bid, lev, star, ext]},
		{expedition_replay,
		 [id, round, ret, time, difficulty, guard_id, a_id,
		  a_name, a_lev, a_power, a_formation_type, a_end_hp,
		  b_id, b_name, b_lev, b_power, b_formation_type,
		  b_end_hp, a_plist, b_plist, ext]},
		{expedition_log, [id, list]},
		{expedition_employ_p,
		 [id, bid, lev, star, quality, break_lev, power, num,
		  ext]},
		{expedition_employ, [rid, rname, num, list]},
		{expedition_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{expedition_f,
		 [id, type, robot_id, role_id, name, lev, face, power,
		  hallows_id, formation_type, items, guards, partner_hp,
		  status]},
		{m_expedition,
		 [ver, guard_id, partner_hp, list, employ, appoint,
		  difficulty, max_difficulty, last_join_time,
		  last_difficulty, max_power]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

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

-file("src/proto/proto_244.erl", 16).

-file("inc/expedition.hrl", 1).

-record(m_expedition,
	{ver = 2, guard_id = 0, partner_hp = [], list = [],
	 employ = [], appoint = [], difficulty = 0,
	 max_difficulty = 0, last_join_time = 0,
	 last_difficulty = {0, 0}, max_power = 0}).

-record(expedition_f,
	{id = 1  :: 1..100, type = 1, robot_id = 0,
	 role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: bitstring(),
	 lev = 0  :: non_neg_integer(),
	 face = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 hallows_id = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 items = []  :: list(), guards = []  :: list(),
	 partner_hp = []  :: list(), status = 0  :: 0..2}).

-record(expedition_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext = []}).

-record(expedition_employ,
	{rid = {0, <<>>}, rname = <<>>, num = 0, list = []}).

-record(expedition_employ_p,
	{id = 0, bid = 0, lev = 0, star = 0, quality = 0,
	 break_lev = 0, power = 0, num = 0, ext = []}).

-record(expedition_log,
	{id = {{0, <<>>}, 0}, list = []}).

-record(expedition_replay,
	{id = 0, round = 0, ret = 0, time = 0, difficulty = 0,
	 guard_id = 0, a_id = {0, <<>>}, a_name = <<>>,
	 a_lev = 0, a_power = 0, a_formation_type = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_power = 0, b_formation_type = 0,
	 b_end_hp = 0, a_plist = [], b_plist = [], ext = []}).

-record(expedition_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-file("src/proto/proto_244.erl", 17).

-file("inc/combat.hrl", 1).

-file("inc/common.hrl", 1).

-file("inc/combat.hrl", 13).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("inc/combat.hrl", 14).

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

-file("inc/combat.hrl", 15).

-record(combat_role,
	{id = {0, <<>>}, pid = none, conn_pid = none,
	 name = <<>>, gid = {0, <<>>}, gname = <<>>,
	 is_auto = true, is_ready = false, is_play_over = false,
	 is_offline = false, group = 0, auto_watch_model = 0,
	 lev = 0, face_id = 0, watching = 1,
	 is_load_map_finish = false}).

-record(fight_object,
	{master_id = {0, <<>>}, master_pid = none,
	 object_type = 0, object_id = 0  :: integer(),
	 object_bid = 0, is_clone = 0, is_auto = 0,
	 is_leader = 0, host_bid = 0, object_name = <<>>,
	 is_awake = 0, star = 0, sex = 0, career = 0, lev = 0,
	 face_id = 0, hp = 1, hp_max = 1, pos = 0, round = 0,
	 wave_round = 0, distance = 0, rand_speed = 0, init_attr,
	 base_attr, fight_attr = #attr{},
	 active_skills = []  :: [#skill_data{}],
	 passive_skills = []  :: [#skill_data{}],
	 skill_order = []  :: [#skill_data{}], buff_list = [],
	 owner_id = {0, <<>>},
	 passive_effects_of_skill = []  :: [#effect_data{}],
	 is_boss = false, is_strong_partner = 0, quality = 0,
	 initial_hp_max = 0, extra_data = [], awaken_type = 0,
	 camp_type = 0, power = 0, replay, hallows_looks = [],
	 sprites = [], guild_break_power = 0}).

-record(combat_buff,
	{id, bid, actor, group, end_round, buff_result_type,
	 positive_or_negative, buff_result = [], join_num,
	 can_reduce, lev, probability = 1000,
	 clean_when_dead = true, hit_count = 0, is_show = true,
	 wave = 1, group_pro = 0}).

-record(combat,
	{type = 0, attack_list = []  :: [#fight_object{}],
	 defend_list = []  :: [#fight_object{}],
	 combat_roles = []  :: [#combat_role{}],
	 formation = []  ::
	     [{pos_integer(), pos_integer(), pos_integer()}],
	 on_combat_begin, on_combat_end, on_role_combat_end,
	 state_end_time = 0, round_countdown = 0,
	 min_play_time = 0, take_action = {}, ext_args = [],
	 wave = 1, total_wave = undefined,
	 multi_wave_defend = [], combat_result,
	 is_pause = false  :: false | {true, integer()},
	 combat_map = 0, combat_drama, target_role_name = <<>>,
	 is_combat_end = {combat_util, is_combat_end, []},
	 end_time = 0, begin_time = 0, watching_roles = [],
	 is_skip = 0, round = 0, is_robot = 0,
	 select_buff_callback, terminate_func, attack_power = 0,
	 defend_power = 0, replay_info, other_arge = []}).

-record(partner_hurt,
	{master_id, id, bid, star, lev, camp_type, dps, cure,
	 ext_data = [], be_hurt = 0}).

-record(combat_result,
	{result  :: 1 | 2, dead_monster_num = 0, wave_num = 0,
	 dead_partner = [], replay_id = 0, a_stat_info = [],
	 b_stat_info = [], end_type = normal  :: normal | quit,
	 opponent_id = {0, <<>>}, total_hurt = 0,
	 action_count = 0, group_a_num = 0,
	 hurt_statistics_a = [], curt_statistics_a = [],
	 hurt_statistics = [], replay_info = [], combat_pid = 0,
	 a_halo_dizzy_num = 0, a_max_num_def = 0,
	 a_control_info = [], a_kill_info = [],
	 a_continue_hurt = [], a_revive_info = [],
	 a_dodge_count = 0, a_anti_kill_count = 0,
	 a_halo_kill_count = 0, a_fire_buff_num = 0,
	 hurt_statistics_b = [], curt_statistics_b = [],
	 b_halo_dizzy_num = 0, b_max_num_def = 0,
	 b_control_info = [], b_kill_info = [],
	 b_continue_hurt = [], b_revive_info = [],
	 b_dodge_count = 0, b_anti_kill_count = 0,
	 b_halo_kill_count = 0, b_fire_buff_num = 0,
	 is_balance = 0, a_sprite_kill_count = 0}).

-record(mon_ai,
	{bid, name, ai, is_loop, condition = [], rate,
	 skill_target = false, skill_id, talk_target = none,
	 talk_content = <<>>}).

-record(skill_play,
	{order, actor, target, skill_bid = 0, talk_pos = 0,
	 talk_content = <<>>, effect_play = []}).

-record(effect_play,
	{order, actor, target = 0, effect_bid = 0, is_hit = 1,
	 is_crit = 0, hp_changed = 0, hp = 0, buff_list = [],
	 summon_list = [], distance = -1, is_dead = 0,
	 sub_effect_play_list = [], is_blind = 0,
	 skill_bid_of_effect = 0, actor_hp_changed = 0,
	 actor_is_dead = 0, aid_actor = 0, total_hurt = 0,
	 hurt_reward = [], camp_restrain = 0}).

-record(sub_effect_play,
	{sub_target = 0, sub_effect_id = 0, sub_hp_changed = 0,
	 sub_distance = -1, sub_is_hit = 1, sub_skill_id = 0,
	 extra_effect = []}).

-record(buff_play,
	{target = 0, buff_bid = 0, end_round = 0,
	 remain_round = 0, action_type = 0, change_type = 0,
	 change_value = 0, is_dead = 0, id = 0, id2 = 0}).

-record(fight_object_p,
	{pos = 0, group = 0, owner_id = 0, owner_srv_id = <<>>,
	 object_type = 0, object_id = 0, object_bid = 0,
	 is_awake = 0, star = 0, object_name = <<>>, sex = 0,
	 career = 0, lev = 0, hp = 0, hp_max = 0, face_id = 0,
	 round = 0, skills = [], is_strong_partner = 0,
	 extra_data = [], camp_type = 0, sprites = []}).

-record(skill_p, {skill_bid = 0, end_round = 0}).

-record(combat_order_p,
	{pos = 0, distance = 0, group = 0}).

-record(exp_reward_p,
	{object_type, object_id = 0, srv_id = <<>>, career = 0,
	 sex = 0, old_lev, old_exp, new_lev, new_exp, is_die = 0,
	 assets_reward}).

-record(assets_reward_p, {type, val}).

-record(item_reward_p, {bid, is_bind, num}).

-record(combat_drama,
	{id, next, timeout = infinity, ts, winner,
	 play_list = []  :: [pos_integer()],
	 combat_list = []  :: [tuple()],
	 guide_list = []  :: [pos_integer()]}).

-file("src/proto/proto_244.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24400, cli, {}) -> {ok, <<2:32, 24400:16>>};
pack(24400, srv,
     {V0_guard_id, V0_difficulty, V0_max_difficulty,
      V0_reward, V0_rewards}) ->
    D_a_t_a = <<V0_guard_id:32, V0_difficulty:8,
		V0_max_difficulty:8, (length(V0_reward)):16,
		(list_to_binary([<<V1_reward_id:32>>
				 || V1_reward_id <- V0_reward]))/binary,
		(length(V0_rewards)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24400:16,
       D_a_t_a/binary>>};
pack(24401, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24401:16,
       D_a_t_a/binary>>};
pack(24401, srv,
     {V0_id, V0_rid, V0_srv_id, V0_name, V0_face, V0_lev,
      V0_power, V0_guards, V0_rewards, V0_is_holiday,
      V0_status}) ->
    D_a_t_a = <<V0_id:8, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_face:32,
		V0_lev:8, V0_power:32, (length(V0_guards)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_star:8, V1_hp_per:8,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_pos, V1_bid, V1_lev, V1_star, V1_hp_per,
				     V1_ext_data}
					<- V0_guards]))/binary,
		(length(V0_rewards)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_rewards]))/binary,
		V0_is_holiday:8, V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24401:16,
       D_a_t_a/binary>>};
pack(24402, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24402:16,
       D_a_t_a/binary>>};
pack(24402, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24402:16,
       D_a_t_a/binary>>};
pack(24403, cli,
     {V0_formation_type, V0_pos_info, V0_hallows_id}) ->
    D_a_t_a = <<V0_formation_type:8,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_owner_id:32,
				   (protocol:pack(string,
						  V1_owner_srv_id))/binary,
				   V1_id:32>>
				 || {V1_pos, V1_owner_id, V1_owner_srv_id,
				     V1_id}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24403:16,
       D_a_t_a/binary>>};
pack(24403, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24403:16,
       D_a_t_a/binary>>};
pack(24405, cli, {}) -> {ok, <<2:32, 24405:16>>};
pack(24405, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_bid:32, V1_lev:16,
				   V1_star:8, V1_power:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_id, V1_bid, V1_lev, V1_star, V1_power,
				     V1_ext_data}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24405:16,
       D_a_t_a/binary>>};
pack(24406, cli, {}) -> {ok, <<2:32, 24406:16>>};
pack(24406, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_id:32, V1_bid:32, V1_lev:16, V1_star:8,
				   V1_power:32, V1_is_employ:8,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_rid, V1_srv_id, V1_name, V1_id, V1_bid,
				     V1_lev, V1_star, V1_power, V1_is_employ,
				     V1_ext_data}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24406:16,
       D_a_t_a/binary>>};
pack(24407, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24407:16,
       D_a_t_a/binary>>};
pack(24407, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24407:16,
       D_a_t_a/binary>>};
pack(24408, cli, {V0_rid, V0_srv_id, V0_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24408:16,
       D_a_t_a/binary>>};
pack(24408, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24408:16,
       D_a_t_a/binary>>};
pack(24409, cli, {}) -> {ok, <<2:32, 24409:16>>};
pack(24409, srv, {V0_list, V0_p_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_id:32, V1_bid:32, V1_lev:16, V1_star:8,
				   V1_power:32, V1_is_used:8, V1_hp_per:8,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_rid, V1_srv_id, V1_name, V1_id, V1_bid,
				     V1_lev, V1_star, V1_power, V1_is_used,
				     V1_hp_per, V1_ext_data}
					<- V0_list]))/binary,
		(length(V0_p_list)):16,
		(list_to_binary([<<V1_id:32, V1_hp_per:8>>
				 || {V1_id, V1_hp_per} <- V0_p_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24409:16,
       D_a_t_a/binary>>};
pack(24410, cli, {}) -> {ok, <<2:32, 24410:16>>};
pack(24410, srv, {V0_is_show}) ->
    D_a_t_a = <<V0_is_show:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24410:16,
       D_a_t_a/binary>>};
pack(24411, cli, {}) -> {ok, <<2:32, 24411:16>>};
pack(24411, srv, {V0_is_show}) ->
    D_a_t_a = <<V0_is_show:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24411:16,
       D_a_t_a/binary>>};
pack(24412, cli, {V0_difficulty}) ->
    D_a_t_a = <<V0_difficulty:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24412:16,
       D_a_t_a/binary>>};
pack(24412, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24412:16,
       D_a_t_a/binary>>};
pack(24413, srv, {}) -> {ok, <<2:32, 24413:16>>};
pack(24414, srv,
     {V0_guard_id, V0_floor_id, V0_rewards}) ->
    D_a_t_a = <<V0_guard_id:32, V0_floor_id:32,
		(length(V0_rewards)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24414:16,
       D_a_t_a/binary>>};
pack(24415, cli, {V0_guard_id}) ->
    D_a_t_a = <<V0_guard_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24415:16,
       D_a_t_a/binary>>};
pack(24415, srv, {V0_replay_infos}) ->
    D_a_t_a = <<(length(V0_replay_infos)):16,
		(list_to_binary([<<V1_id:32, V1_round:8, V1_ret:8,
				   V1_time:32, V1_guard_id:32, V1_difficulty:8,
				   V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_a_name))/binary,
				   V1_a_lev:16, V1_a_power:32,
				   V1_a_formation_type:32, V1_a_end_hp:8,
				   V1_b_rid:32,
				   (protocol:pack(string, V1_b_srv_id))/binary,
				   (protocol:pack(string, V1_b_name))/binary,
				   V1_b_lev:16, V1_b_power:32,
				   V1_b_formation_type:32, V1_b_end_hp:8,
				   (length(V1_a_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_star:8,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #expedition_replay_partner{pos
										      =
										      V2_pos,
										  bid
										      =
										      V2_bid,
										  lev
										      =
										      V2_lev,
										  star
										      =
										      V2_star,
										  ext
										      =
										      V2_ext}
							   <- V1_a_plist]))/binary,
				   (length(V1_b_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_star:8,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #expedition_replay_partner{pos
										      =
										      V2_pos,
										  bid
										      =
										      V2_bid,
										  lev
										      =
										      V2_lev,
										  star
										      =
										      V2_star,
										  ext
										      =
										      V2_ext}
							   <- V1_b_plist]))/binary,
				   (length(V1_hurt_statistics)):16,
				   (list_to_binary([<<V2_type:8,
						      (length(V2_partner_hurts)):16,
						      (list_to_binary([<<V3_rid:32,
									 (protocol:pack(string,
											V3_srvid))/binary,
									 V3_id:32,
									 V3_bid:32,
									 V3_star:32,
									 V3_lev:32,
									 V3_camp_type:32,
									 V3_dps:32,
									 V3_cure:32,
									 (length(V3_ext_data)):16,
									 (list_to_binary([<<V4_key:32,
											    V4_val:32>>
											  || {V4_key,
											      V4_val}
												 <- V3_ext_data]))/binary,
									 V3_be_hurt:32>>
								       || #partner_hurt{master_id
											    =
											    {V3_rid,
											     V3_srvid},
											id
											    =
											    V3_id,
											bid
											    =
											    V3_bid,
											star
											    =
											    V3_star,
											lev
											    =
											    V3_lev,
											camp_type
											    =
											    V3_camp_type,
											dps
											    =
											    V3_dps,
											cure
											    =
											    V3_cure,
											ext_data
											    =
											    V3_ext_data,
											be_hurt
											    =
											    V3_be_hurt}
									      <- V2_partner_hurts]))/binary>>
						    || {V2_type,
							V2_partner_hurts}
							   <- V1_hurt_statistics]))/binary>>
				 || {#expedition_replay{id = V1_id,
							round = V1_round,
							ret = V1_ret,
							time = V1_time,
							guard_id = V1_guard_id,
							difficulty =
							    V1_difficulty,
							a_id =
							    {V1_rid, V1_srv_id},
							a_name = V1_a_name,
							a_lev = V1_a_lev,
							a_power = V1_a_power,
							a_formation_type =
							    V1_a_formation_type,
							a_end_hp = V1_a_end_hp,
							b_id =
							    {V1_b_rid,
							     V1_b_srv_id},
							b_name = V1_b_name,
							b_lev = V1_b_lev,
							b_power = V1_b_power,
							b_formation_type =
							    V1_b_formation_type,
							b_end_hp = V1_b_end_hp,
							a_plist = V1_a_plist,
							b_plist = V1_b_plist},
				     V1_hurt_statistics}
					<- V0_replay_infos]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24415:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24400, srv, _B0) -> {ok, {}};
unpack(24400, cli, _B0) ->
    {V1_guard_id, _B1} = protocol:uint32(_B0),
    {V1_difficulty, _B2} = protocol:uint8(_B1),
    {V1_max_difficulty, _B3} = protocol:uint8(_B2),
    {V1_reward, _B7} = protocol:array(_B3,
				      fun (_B4) ->
					      {V2_reward_id, _B5} =
						  protocol:uint32(_B4),
					      {V2_reward_id, _B5}
				      end),
    {V1_rewards, _B12} = protocol:array(_B7,
					fun (_B8) ->
						{V2_bid, _B9} =
						    protocol:uint32(_B8),
						{V2_num, _B10} =
						    protocol:uint32(_B9),
						{{V2_bid, V2_num}, _B10}
					end),
    {ok,
     {V1_guard_id, V1_difficulty, V1_max_difficulty,
      V1_reward, V1_rewards}};
unpack(24401, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(24401, cli, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_face, _B5} = protocol:uint32(_B4),
    {V1_lev, _B6} = protocol:uint8(_B5),
    {V1_power, _B7} = protocol:uint32(_B6),
    {V1_guards, _B20} = protocol:array(_B7,
				       fun (_B8) ->
					       {V2_pos, _B9} =
						   protocol:uint8(_B8),
					       {V2_bid, _B10} =
						   protocol:uint32(_B9),
					       {V2_lev, _B11} =
						   protocol:uint16(_B10),
					       {V2_star, _B12} =
						   protocol:uint8(_B11),
					       {V2_hp_per, _B13} =
						   protocol:uint8(_B12),
					       {V2_ext_data, _B18} =
						   protocol:array(_B13,
								  fun (_B14) ->
									  {V3_key,
									   _B15} =
									      protocol:uint32(_B14),
									  {V3_val,
									   _B16} =
									      protocol:uint32(_B15),
									  {{V3_key,
									    V3_val},
									   _B16}
								  end),
					       {{V2_pos, V2_bid, V2_lev,
						 V2_star, V2_hp_per,
						 V2_ext_data},
						_B18}
				       end),
    {V1_rewards, _B25} = protocol:array(_B20,
					fun (_B21) ->
						{V2_bid, _B22} =
						    protocol:uint32(_B21),
						{V2_num, _B23} =
						    protocol:uint32(_B22),
						{{V2_bid, V2_num}, _B23}
					end),
    {V1_is_holiday, _B26} = protocol:uint8(_B25),
    {V1_status, _B27} = protocol:uint8(_B26),
    {ok,
     {V1_id, V1_rid, V1_srv_id, V1_name, V1_face, V1_lev,
      V1_power, V1_guards, V1_rewards, V1_is_holiday,
      V1_status}};
unpack(24402, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(24402, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(24403, srv, _B0) ->
    {V1_formation_type, _B1} = protocol:uint8(_B0),
    {V1_pos_info, _B8} = protocol:array(_B1,
					fun (_B2) ->
						{V2_pos, _B3} =
						    protocol:uint8(_B2),
						{V2_owner_id, _B4} =
						    protocol:uint32(_B3),
						{V2_owner_srv_id, _B5} =
						    protocol:string(_B4),
						{V2_id, _B6} =
						    protocol:uint32(_B5),
						{{V2_pos, V2_owner_id,
						  V2_owner_srv_id, V2_id},
						 _B6}
					end),
    {V1_hallows_id, _B9} = protocol:uint32(_B8),
    {ok, {V1_formation_type, V1_pos_info, V1_hallows_id}};
unpack(24403, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24405, srv, _B0) -> {ok, {}};
unpack(24405, cli, _B0) ->
    {V1_list, _B13} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_bid, _B3} =
						 protocol:uint32(_B2),
					     {V2_lev, _B4} =
						 protocol:uint16(_B3),
					     {V2_star, _B5} =
						 protocol:uint8(_B4),
					     {V2_power, _B6} =
						 protocol:uint32(_B5),
					     {V2_ext_data, _B11} =
						 protocol:array(_B6,
								fun (_B7) ->
									{V3_key,
									 _B8} =
									    protocol:uint32(_B7),
									{V3_val,
									 _B9} =
									    protocol:uint32(_B8),
									{{V3_key,
									  V3_val},
									 _B9}
								end),
					     {{V2_id, V2_bid, V2_lev, V2_star,
					       V2_power, V2_ext_data},
					      _B11}
				     end),
    {ok, {V1_list}};
unpack(24406, srv, _B0) -> {ok, {}};
unpack(24406, cli, _B0) ->
    {V1_list, _B17} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_rid, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_name, _B4} =
						 protocol:string(_B3),
					     {V2_id, _B5} =
						 protocol:uint32(_B4),
					     {V2_bid, _B6} =
						 protocol:uint32(_B5),
					     {V2_lev, _B7} =
						 protocol:uint16(_B6),
					     {V2_star, _B8} =
						 protocol:uint8(_B7),
					     {V2_power, _B9} =
						 protocol:uint32(_B8),
					     {V2_is_employ, _B10} =
						 protocol:uint8(_B9),
					     {V2_ext_data, _B15} =
						 protocol:array(_B10,
								fun (_B11) ->
									{V3_key,
									 _B12} =
									    protocol:uint32(_B11),
									{V3_val,
									 _B13} =
									    protocol:uint32(_B12),
									{{V3_key,
									  V3_val},
									 _B13}
								end),
					     {{V2_rid, V2_srv_id, V2_name,
					       V2_id, V2_bid, V2_lev, V2_star,
					       V2_power, V2_is_employ,
					       V2_ext_data},
					      _B15}
				     end),
    {ok, {V1_list}};
unpack(24407, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24407, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(24408, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_srv_id, V1_id}};
unpack(24408, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24409, srv, _B0) -> {ok, {}};
unpack(24409, cli, _B0) ->
    {V1_list, _B18} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_rid, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_name, _B4} =
						 protocol:string(_B3),
					     {V2_id, _B5} =
						 protocol:uint32(_B4),
					     {V2_bid, _B6} =
						 protocol:uint32(_B5),
					     {V2_lev, _B7} =
						 protocol:uint16(_B6),
					     {V2_star, _B8} =
						 protocol:uint8(_B7),
					     {V2_power, _B9} =
						 protocol:uint32(_B8),
					     {V2_is_used, _B10} =
						 protocol:uint8(_B9),
					     {V2_hp_per, _B11} =
						 protocol:uint8(_B10),
					     {V2_ext_data, _B16} =
						 protocol:array(_B11,
								fun (_B12) ->
									{V3_key,
									 _B13} =
									    protocol:uint32(_B12),
									{V3_val,
									 _B14} =
									    protocol:uint32(_B13),
									{{V3_key,
									  V3_val},
									 _B14}
								end),
					     {{V2_rid, V2_srv_id, V2_name,
					       V2_id, V2_bid, V2_lev, V2_star,
					       V2_power, V2_is_used, V2_hp_per,
					       V2_ext_data},
					      _B16}
				     end),
    {V1_p_list, _B23} = protocol:array(_B18,
				       fun (_B19) ->
					       {V2_id, _B20} =
						   protocol:uint32(_B19),
					       {V2_hp_per, _B21} =
						   protocol:uint8(_B20),
					       {{V2_id, V2_hp_per}, _B21}
				       end),
    {ok, {V1_list, V1_p_list}};
unpack(24410, srv, _B0) -> {ok, {}};
unpack(24410, cli, _B0) ->
    {V1_is_show, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_show}};
unpack(24411, srv, _B0) -> {ok, {}};
unpack(24411, cli, _B0) ->
    {V1_is_show, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_show}};
unpack(24412, srv, _B0) ->
    {V1_difficulty, _B1} = protocol:uint8(_B0),
    {ok, {V1_difficulty}};
unpack(24412, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24413, cli, _B0) -> {ok, {}};
unpack(24414, cli, _B0) ->
    {V1_guard_id, _B1} = protocol:uint32(_B0),
    {V1_floor_id, _B2} = protocol:uint32(_B1),
    {V1_rewards, _B7} = protocol:array(_B2,
				       fun (_B3) ->
					       {V2_bid, _B4} =
						   protocol:uint32(_B3),
					       {V2_num, _B5} =
						   protocol:uint32(_B4),
					       {{V2_bid, V2_num}, _B5}
				       end),
    {ok, {V1_guard_id, V1_floor_id, V1_rewards}};
unpack(24415, srv, _B0) ->
    {V1_guard_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_guard_id}};
unpack(24415, cli, _B0) ->
    {V1_replay_infos, _B69} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_id, _B2} =
							 protocol:uint32(_B1),
						     {V2_round, _B3} =
							 protocol:uint8(_B2),
						     {V2_ret, _B4} =
							 protocol:uint8(_B3),
						     {V2_time, _B5} =
							 protocol:uint32(_B4),
						     {V2_guard_id, _B6} =
							 protocol:uint32(_B5),
						     {V2_difficulty, _B7} =
							 protocol:uint8(_B6),
						     {V2_rid, _B8} =
							 protocol:uint32(_B7),
						     {V2_srv_id, _B9} =
							 protocol:string(_B8),
						     {V2_a_name, _B10} =
							 protocol:string(_B9),
						     {V2_a_lev, _B11} =
							 protocol:uint16(_B10),
						     {V2_a_power, _B12} =
							 protocol:uint32(_B11),
						     {V2_a_formation_type,
						      _B13} =
							 protocol:uint32(_B12),
						     {V2_a_end_hp, _B14} =
							 protocol:uint8(_B13),
						     {V2_b_rid, _B15} =
							 protocol:uint32(_B14),
						     {V2_b_srv_id, _B16} =
							 protocol:string(_B15),
						     {V2_b_name, _B17} =
							 protocol:string(_B16),
						     {V2_b_lev, _B18} =
							 protocol:uint16(_B17),
						     {V2_b_power, _B19} =
							 protocol:uint32(_B18),
						     {V2_b_formation_type,
						      _B20} =
							 protocol:uint32(_B19),
						     {V2_b_end_hp, _B21} =
							 protocol:uint8(_B20),
						     {V2_a_plist, _B33} =
							 protocol:array(_B21,
									fun
									  (_B22) ->
									      {V3_pos,
									       _B23} =
										  protocol:uint8(_B22),
									      {V3_bid,
									       _B24} =
										  protocol:uint32(_B23),
									      {V3_lev,
									       _B25} =
										  protocol:uint16(_B24),
									      {V3_star,
									       _B26} =
										  protocol:uint8(_B25),
									      {V3_ext,
									       _B31} =
										  protocol:array(_B26,
												 fun
												   (_B27) ->
												       {V4_key,
													_B28} =
													   protocol:uint32(_B27),
												       {V4_val,
													_B29} =
													   protocol:uint32(_B28),
												       {{V4_key,
													 V4_val},
													_B29}
												 end),
									      {{V3_pos,
										V3_bid,
										V3_lev,
										V3_star,
										V3_ext},
									       _B31}
									end),
						     {V2_b_plist, _B45} =
							 protocol:array(_B33,
									fun
									  (_B34) ->
									      {V3_pos,
									       _B35} =
										  protocol:uint8(_B34),
									      {V3_bid,
									       _B36} =
										  protocol:uint32(_B35),
									      {V3_lev,
									       _B37} =
										  protocol:uint16(_B36),
									      {V3_star,
									       _B38} =
										  protocol:uint8(_B37),
									      {V3_ext,
									       _B43} =
										  protocol:array(_B38,
												 fun
												   (_B39) ->
												       {V4_key,
													_B40} =
													   protocol:uint32(_B39),
												       {V4_val,
													_B41} =
													   protocol:uint32(_B40),
												       {{V4_key,
													 V4_val},
													_B41}
												 end),
									      {{V3_pos,
										V3_bid,
										V3_lev,
										V3_star,
										V3_ext},
									       _B43}
									end),
						     {V2_hurt_statistics,
						      _B67} =
							 protocol:array(_B45,
									fun
									  (_B46) ->
									      {V3_type,
									       _B47} =
										  protocol:uint8(_B46),
									      {V3_partner_hurts,
									       _B65} =
										  protocol:array(_B47,
												 fun
												   (_B48) ->
												       {V4_rid,
													_B49} =
													   protocol:uint32(_B48),
												       {V4_srvid,
													_B50} =
													   protocol:string(_B49),
												       {V4_id,
													_B51} =
													   protocol:uint32(_B50),
												       {V4_bid,
													_B52} =
													   protocol:uint32(_B51),
												       {V4_star,
													_B53} =
													   protocol:uint32(_B52),
												       {V4_lev,
													_B54} =
													   protocol:uint32(_B53),
												       {V4_camp_type,
													_B55} =
													   protocol:uint32(_B54),
												       {V4_dps,
													_B56} =
													   protocol:uint32(_B55),
												       {V4_cure,
													_B57} =
													   protocol:uint32(_B56),
												       {V4_ext_data,
													_B62} =
													   protocol:array(_B57,
															  fun
															    (_B58) ->
																{V5_key,
																 _B59} =
																    protocol:uint32(_B58),
																{V5_val,
																 _B60} =
																    protocol:uint32(_B59),
																{{V5_key,
																  V5_val},
																 _B60}
															  end),
												       {V4_be_hurt,
													_B63} =
													   protocol:uint32(_B62),
												       {{V4_rid,
													 V4_srvid,
													 V4_id,
													 V4_bid,
													 V4_star,
													 V4_lev,
													 V4_camp_type,
													 V4_dps,
													 V4_cure,
													 V4_ext_data,
													 V4_be_hurt},
													_B63}
												 end),
									      {{V3_type,
										V3_partner_hurts},
									       _B65}
									end),
						     {{V2_id, V2_round, V2_ret,
						       V2_time, V2_guard_id,
						       V2_difficulty, V2_rid,
						       V2_srv_id, V2_a_name,
						       V2_a_lev, V2_a_power,
						       V2_a_formation_type,
						       V2_a_end_hp, V2_b_rid,
						       V2_b_srv_id, V2_b_name,
						       V2_b_lev, V2_b_power,
						       V2_b_formation_type,
						       V2_b_end_hp, V2_a_plist,
						       V2_b_plist,
						       V2_hurt_statistics},
						      _B67}
					     end),
    {ok, {V1_replay_infos}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


