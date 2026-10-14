-file("src/proto/proto_254.erl", 1).

-module(proto_254).

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
		  res_p, dam_s, res_s, tenacity]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/combat.hrl", 1).

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

-file("src/proto/proto_254.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25400, cli, {}) -> {ok, <<2:32, 25400:16>>};
pack(25400, srv,
     {V0_order, V0_score, V0_rank, V0_count}) ->
    D_a_t_a = <<V0_order:8, V0_score:32, V0_rank:32,
		V0_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25400:16,
       D_a_t_a/binary>>};
pack(25401, cli, {}) -> {ok, <<2:32, 25401:16>>};
pack(25401, srv,
     {V0_order, V0_score, V0_rank, V0_count, V0_buy_count,
      V0_hp_per, V0_award_info}) ->
    D_a_t_a = <<V0_order:8, V0_score:32, V0_rank:32,
		V0_count:8, V0_buy_count:8, V0_hp_per:32,
		(length(V0_award_info)):16,
		(list_to_binary([<<V1_award_id:32>>
				 || V1_award_id <- V0_award_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25401:16,
       D_a_t_a/binary>>};
pack(25402, cli, {}) -> {ok, <<2:32, 25402:16>>};
pack(25402, srv,
     {V0_code, V0_msg, V0_count, V0_buy_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:8,
		V0_buy_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25402:16,
       D_a_t_a/binary>>};
pack(25403, cli, {}) -> {ok, <<2:32, 25403:16>>};
pack(25403, srv, {V0_code, V0_msg, V0_award_info}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_award_info)):16,
		(list_to_binary([<<V1_award_id:32>>
				 || V1_award_id <- V0_award_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25403:16,
       D_a_t_a/binary>>};
pack(25404, cli, {}) -> {ok, <<2:32, 25404:16>>};
pack(25404, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25404:16,
       D_a_t_a/binary>>};
pack(25405, cli, {}) -> {ok, <<2:32, 25405:16>>};
pack(25405, srv,
     {V0_result, V0_dps_score, V0_kill_score, V0_all_dps,
      V0_best_partner, V0_target_role_name,
      V0_hurt_statistics}) ->
    D_a_t_a = <<V0_result:8, V0_dps_score:32,
		V0_kill_score:32, V0_all_dps:32, V0_best_partner:32,
		(protocol:pack(string, V0_target_role_name))/binary,
		(length(V0_hurt_statistics)):16,
		(list_to_binary([<<V1_type:8,
				   (length(V1_partner_hurts)):16,
				   (list_to_binary([<<V2_rid:32,
						      (protocol:pack(string,
								     V2_srvid))/binary,
						      V2_id:32, V2_bid:32,
						      V2_star:32, V2_lev:32,
						      V2_camp_type:32,
						      V2_dps:32, V2_cure:32,
						      (length(V2_ext_data)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext_data]))/binary,
						      V2_be_hurt:32>>
						    || #partner_hurt{master_id =
									 {V2_rid,
									  V2_srvid},
								     id = V2_id,
								     bid =
									 V2_bid,
								     star =
									 V2_star,
								     lev =
									 V2_lev,
								     camp_type =
									 V2_camp_type,
								     dps =
									 V2_dps,
								     cure =
									 V2_cure,
								     ext_data =
									 V2_ext_data,
								     be_hurt =
									 V2_be_hurt}
							   <- V1_partner_hurts]))/binary>>
				 || {V1_type, V1_partner_hurts}
					<- V0_hurt_statistics]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25405:16,
       D_a_t_a/binary>>};
pack(25410, cli, {}) -> {ok, <<2:32, 25410:16>>};
pack(25410, srv,
     {V0_round, V0_difficulty, V0_order, V0_order_type,
      V0_round_combat, V0_round_boss, V0_count, V0_buy_count,
      V0_endtime, V0_hp_per, V0_status}) ->
    D_a_t_a = <<V0_round:8, V0_difficulty:8, V0_order:8,
		V0_order_type:8, V0_round_combat:32, V0_round_boss:32,
		V0_count:8, V0_buy_count:8, V0_endtime:32, V0_hp_per:32,
		V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25410:16,
       D_a_t_a/binary>>};
pack(25411, cli, {}) -> {ok, <<2:32, 25411:16>>};
pack(25411, srv,
     {V0_code, V0_msg, V0_count, V0_buy_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:8,
		V0_buy_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25411:16,
       D_a_t_a/binary>>};
pack(25412, cli, {}) -> {ok, <<2:32, 25412:16>>};
pack(25412, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25412:16,
       D_a_t_a/binary>>};
pack(25413, cli, {}) -> {ok, <<2:32, 25413:16>>};
pack(25413, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25413:16,
       D_a_t_a/binary>>};
pack(25414, cli, {}) -> {ok, <<2:32, 25414:16>>};
pack(25414, srv, {V0_p_list}) ->
    D_a_t_a = <<(length(V0_p_list)):16,
		(list_to_binary([<<V1_id:32, V1_count:8>>
				 || {V1_id, V1_count} <- V0_p_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25414:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25400, srv, _B0) -> {ok, {}};
unpack(25400, cli, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_rank, _B3} = protocol:uint32(_B2),
    {V1_count, _B4} = protocol:uint8(_B3),
    {ok, {V1_order, V1_score, V1_rank, V1_count}};
unpack(25401, srv, _B0) -> {ok, {}};
unpack(25401, cli, _B0) ->
    {V1_order, _B1} = protocol:uint8(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_rank, _B3} = protocol:uint32(_B2),
    {V1_count, _B4} = protocol:uint8(_B3),
    {V1_buy_count, _B5} = protocol:uint8(_B4),
    {V1_hp_per, _B6} = protocol:uint32(_B5),
    {V1_award_info, _B10} = protocol:array(_B6,
					   fun (_B7) ->
						   {V2_award_id, _B8} =
						       protocol:uint32(_B7),
						   {V2_award_id, _B8}
					   end),
    {ok,
     {V1_order, V1_score, V1_rank, V1_count, V1_buy_count,
      V1_hp_per, V1_award_info}};
unpack(25402, srv, _B0) -> {ok, {}};
unpack(25402, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint8(_B2),
    {V1_buy_count, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_count, V1_buy_count}};
unpack(25403, srv, _B0) -> {ok, {}};
unpack(25403, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_award_info, _B6} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_award_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_award_id, _B4}
					  end),
    {ok, {V1_code, V1_msg, V1_award_info}};
unpack(25404, srv, _B0) -> {ok, {}};
unpack(25404, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25405, srv, _B0) -> {ok, {}};
unpack(25405, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_dps_score, _B2} = protocol:uint32(_B1),
    {V1_kill_score, _B3} = protocol:uint32(_B2),
    {V1_all_dps, _B4} = protocol:uint32(_B3),
    {V1_best_partner, _B5} = protocol:uint32(_B4),
    {V1_target_role_name, _B6} = protocol:string(_B5),
    {V1_hurt_statistics, _B28} = protocol:array(_B6,
						fun (_B7) ->
							{V2_type, _B8} =
							    protocol:uint8(_B7),
							{V2_partner_hurts,
							 _B26} =
							    protocol:array(_B8,
									   fun
									     (_B9) ->
										 {V3_rid,
										  _B10} =
										     protocol:uint32(_B9),
										 {V3_srvid,
										  _B11} =
										     protocol:string(_B10),
										 {V3_id,
										  _B12} =
										     protocol:uint32(_B11),
										 {V3_bid,
										  _B13} =
										     protocol:uint32(_B12),
										 {V3_star,
										  _B14} =
										     protocol:uint32(_B13),
										 {V3_lev,
										  _B15} =
										     protocol:uint32(_B14),
										 {V3_camp_type,
										  _B16} =
										     protocol:uint32(_B15),
										 {V3_dps,
										  _B17} =
										     protocol:uint32(_B16),
										 {V3_cure,
										  _B18} =
										     protocol:uint32(_B17),
										 {V3_ext_data,
										  _B23} =
										     protocol:array(_B18,
												    fun
												      (_B19) ->
													  {V4_key,
													   _B20} =
													      protocol:uint32(_B19),
													  {V4_val,
													   _B21} =
													      protocol:uint32(_B20),
													  {{V4_key,
													    V4_val},
													   _B21}
												    end),
										 {V3_be_hurt,
										  _B24} =
										     protocol:uint32(_B23),
										 {{V3_rid,
										   V3_srvid,
										   V3_id,
										   V3_bid,
										   V3_star,
										   V3_lev,
										   V3_camp_type,
										   V3_dps,
										   V3_cure,
										   V3_ext_data,
										   V3_be_hurt},
										  _B24}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B26}
						end),
    {ok,
     {V1_result, V1_dps_score, V1_kill_score, V1_all_dps,
      V1_best_partner, V1_target_role_name,
      V1_hurt_statistics}};
unpack(25410, srv, _B0) -> {ok, {}};
unpack(25410, cli, _B0) ->
    {V1_round, _B1} = protocol:uint8(_B0),
    {V1_difficulty, _B2} = protocol:uint8(_B1),
    {V1_order, _B3} = protocol:uint8(_B2),
    {V1_order_type, _B4} = protocol:uint8(_B3),
    {V1_round_combat, _B5} = protocol:uint32(_B4),
    {V1_round_boss, _B6} = protocol:uint32(_B5),
    {V1_count, _B7} = protocol:uint8(_B6),
    {V1_buy_count, _B8} = protocol:uint8(_B7),
    {V1_endtime, _B9} = protocol:uint32(_B8),
    {V1_hp_per, _B10} = protocol:uint32(_B9),
    {V1_status, _B11} = protocol:uint8(_B10),
    {ok,
     {V1_round, V1_difficulty, V1_order, V1_order_type,
      V1_round_combat, V1_round_boss, V1_count, V1_buy_count,
      V1_endtime, V1_hp_per, V1_status}};
unpack(25411, srv, _B0) -> {ok, {}};
unpack(25411, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint8(_B2),
    {V1_buy_count, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_count, V1_buy_count}};
unpack(25412, srv, _B0) -> {ok, {}};
unpack(25412, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25413, srv, _B0) -> {ok, {}};
unpack(25413, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25414, srv, _B0) -> {ok, {}};
unpack(25414, cli, _B0) ->
    {V1_p_list, _B5} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_id, _B2} =
						  protocol:uint32(_B1),
					      {V2_count, _B3} =
						  protocol:uint8(_B2),
					      {{V2_id, V2_count}, _B3}
				      end),
    {ok, {V1_p_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


