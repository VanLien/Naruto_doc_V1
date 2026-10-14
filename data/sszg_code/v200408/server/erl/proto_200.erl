-file("src/proto/proto_200.erl", 1).

-module(proto_200).

-lager_records([{formation_attr_data,
		 [type, lev, expend, attr_1, attr_2, attr_3, attr_4,
		  attr_5, attr_6, attr_7, attr_8, attr_9, power]},
		{formation_data,
		 [type, pos, need_lev, name, need_items, restrain_s,
		  restrain_w]},
		{formation_info_p, [id, name, power, pos_info]},
		{pk_formation_info,
		 [id, name, formation, ffor_target, power, is_ready,
		  guild_name, lev, face_id, pid]},
		{formation_fight_info, [pos, fight_pos, id]},
		{formation_base_p,
		 [id, lev, exp, pos_info, formation_list, power,
		  hallows_id, all_lineups]},
		{formation_pos, [pos, id]},
		{formation_lineup,
		 [id, name, power, pos_info, max_power, type,
		  hallows_id]},
		{formation_sys, [id, type, pos_info, hallows_id]},
		{m_formation,
		 [ver, list, use_lineup, all_lineups, sys_formations]},
		{combat_drama,
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

-file("src/proto/proto_200.erl", 16).

-file("inc/formation.hrl", 1).

-record(m_formation,
	{ver = 1, list = [], use_lineup = 1, all_lineups = [],
	 sys_formations = []}).

-record(formation_sys,
	{id = 1, type = 1, pos_info = [], hallows_id = 0}).

-record(formation_lineup,
	{id = 1, name = <<>>, power = 0, pos_info = [],
	 max_power = 0, type = 1, hallows_id = 0}).

-record(formation_pos, {pos, id = 0}).

-record(formation_base_p,
	{id, lev, exp, pos_info, formation_list, power,
	 hallows_id = 0, all_lineups}).

-record(formation_fight_info, {pos, fight_pos, id = 0}).

-record(pk_formation_info,
	{id, name, formation, ffor_target, power,
	 is_ready = false, guild_name = <<>>, lev = 0, face_id,
	 pid = none}).

-record(formation_info_p,
	{id = 0, name = <<>>, power = 0, pos_info = []}).

-record(formation_data,
	{type, pos, need_lev, name, need_items = [],
	 restrain_s = [], restrain_w = []}).

-record(formation_attr_data,
	{type, lev, expend = [], attr_1 = [], attr_2 = [],
	 attr_3 = [], attr_4 = [], attr_5 = [], attr_6 = [],
	 attr_7 = [], attr_8 = [], attr_9 = [], power}).

-file("src/proto/proto_200.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(20000, cli, {}) -> {ok, <<2:32, 20000:16>>};
pack(20000, srv, {V0_combat_type, V0_combat_map}) ->
    D_a_t_a = <<V0_combat_type:16, V0_combat_map:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20000:16,
       D_a_t_a/binary>>};
pack(20001, cli, {}) -> {ok, <<2:32, 20001:16>>};
pack(20001, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20001:16,
       D_a_t_a/binary>>};
pack(20002, cli, {}) -> {ok, <<2:32, 20002:16>>};
pack(20002, srv,
     {V0_pos, V0_owner_id, V0_owner_srv_id, V0_all_alive,
      V0_skill_plays, V0_round_buff, V0_countdown_time,
      V0_action_count, V0_combat_type, V0_hallows_list,
      V0_sprite_cd_info}) ->
    D_a_t_a = <<V0_pos:16, V0_owner_id:32,
		(protocol:pack(string, V0_owner_srv_id))/binary,
		(length(V0_all_alive)):16,
		(list_to_binary([<<V1_pos:16>>
				 || V1_pos <- V0_all_alive]))/binary,
		(length(V0_skill_plays)):16,
		(list_to_binary([<<V1_order:8, V1_actor:16,
				   V1_target:16, V1_skill_bid:32,
				   V1_talk_pos:16,
				   (protocol:pack(string,
						  V1_talk_content))/binary,
				   (length(V1_effect_play)):16,
				   (list_to_binary([<<V2_order:16, V2_actor:16,
						      V2_target:16,
						      V2_effect_bid:32,
						      V2_is_hit:8, V2_is_crit:8,
						      V2_hp_changed:32/signed,
						      V2_hp:64,
						      V2_is_dead:8/signed,
						      V2_camp_restrain:8/signed,
						      (length(V2_buff_list)):16,
						      (list_to_binary([<<V3_target:16,
									 V3_buff_bid:32,
									 V3_remain_round:16,
									 V3_end_round:8,
									 V3_action_type:8,
									 V3_change_type:8,
									 V3_change_value:32/signed,
									 V3_is_dead:8/signed,
									 V3_id:32>>
								       || #buff_play{target
											 =
											 V3_target,
										     buff_bid
											 =
											 V3_buff_bid,
										     remain_round
											 =
											 V3_remain_round,
										     end_round
											 =
											 V3_end_round,
										     action_type
											 =
											 V3_action_type,
										     change_type
											 =
											 V3_change_type,
										     change_value
											 =
											 V3_change_value,
										     is_dead
											 =
											 V3_is_dead,
										     id
											 =
											 V3_id}
									      <- V2_buff_list]))/binary,
						      (length(V2_summon_list)):16,
						      (list_to_binary([<<V3_pos:16,
									 V3_group:8,
									 V3_owner_id:32,
									 (protocol:pack(string,
											V3_owner_srv_id))/binary,
									 V3_object_type:16,
									 V3_object_id:32,
									 V3_object_bid:32,
									 (protocol:pack(string,
											V3_object_name))/binary,
									 V3_star:8,
									 V3_camp_type:8/signed,
									 V3_sex:8/signed,
									 V3_career:8/signed,
									 V3_lev:32,
									 V3_hp:64,
									 V3_hp_max:64,
									 V3_face_id:32/signed,
									 (length(V3_skills)):16,
									 (list_to_binary([<<V4_skill_bid:32,
											    V4_end_round:8/signed>>
											  || #skill_p{skill_bid
													  =
													  V4_skill_bid,
												      end_round
													  =
													  V4_end_round}
												 <- V3_skills]))/binary,
									 (length(V3_extra_data)):16,
									 (list_to_binary([<<V4_extra_key:8,
											    V4_extra_value:32>>
											  || {V4_extra_key,
											      V4_extra_value}
												 <- V3_extra_data]))/binary,
									 (length(V3_sprites)):16,
									 (list_to_binary([<<V4_pos:8,
											    V4_item_bid:32>>
											  || {V4_pos,
											      V4_item_bid}
												 <- V3_sprites]))/binary>>
								       || #fight_object_p{pos
											      =
											      V3_pos,
											  group
											      =
											      V3_group,
											  owner_id
											      =
											      V3_owner_id,
											  owner_srv_id
											      =
											      V3_owner_srv_id,
											  object_type
											      =
											      V3_object_type,
											  object_id
											      =
											      V3_object_id,
											  object_bid
											      =
											      V3_object_bid,
											  object_name
											      =
											      V3_object_name,
											  star
											      =
											      V3_star,
											  camp_type
											      =
											      V3_camp_type,
											  sex
											      =
											      V3_sex,
											  career
											      =
											      V3_career,
											  lev
											      =
											      V3_lev,
											  hp
											      =
											      V3_hp,
											  hp_max
											      =
											      V3_hp_max,
											  face_id
											      =
											      V3_face_id,
											  skills
											      =
											      V3_skills,
											  extra_data
											      =
											      V3_extra_data,
											  sprites
											      =
											      V3_sprites}
									      <- V2_summon_list]))/binary,
						      (length(V2_sub_effect_play_list)):16,
						      (list_to_binary([<<V3_sub_target:16,
									 V3_sub_effect_id:32,
									 V3_sub_hp_changed:32/signed,
									 V3_sub_is_hit:8,
									 V3_sub_skill_id:32,
									 (length(V3_extra_effect)):16,
									 (list_to_binary([<<V4_extra_key:16,
											    V4_extra_param:32/signed>>
											  || {V4_extra_key,
											      V4_extra_param}
												 <- V3_extra_effect]))/binary>>
								       || #sub_effect_play{sub_target
											       =
											       V3_sub_target,
											   sub_effect_id
											       =
											       V3_sub_effect_id,
											   sub_hp_changed
											       =
											       V3_sub_hp_changed,
											   sub_is_hit
											       =
											       V3_sub_is_hit,
											   sub_skill_id
											       =
											       V3_sub_skill_id,
											   extra_effect
											       =
											       V3_extra_effect}
									      <- V2_sub_effect_play_list]))/binary,
						      V2_is_blind:8,
						      V2_skill_bid_of_effect:32,
						      V2_actor_hp_changed:32/signed,
						      V2_actor_is_dead:8/signed,
						      V2_aid_actor:16,
						      V2_total_hurt:32,
						      (length(V2_hurt_reward)):16,
						      (list_to_binary([<<V3_assets_id:32,
									 V3_assets_val:32/signed>>
								       || {V3_assets_id,
									   V3_assets_val}
									      <- V2_hurt_reward]))/binary>>
						    || #effect_play{order =
									V2_order,
								    actor =
									V2_actor,
								    target =
									V2_target,
								    effect_bid =
									V2_effect_bid,
								    is_hit =
									V2_is_hit,
								    is_crit =
									V2_is_crit,
								    hp_changed =
									V2_hp_changed,
								    hp = V2_hp,
								    is_dead =
									V2_is_dead,
								    camp_restrain
									=
									V2_camp_restrain,
								    buff_list =
									V2_buff_list,
								    summon_list
									=
									V2_summon_list,
								    sub_effect_play_list
									=
									V2_sub_effect_play_list,
								    is_blind =
									V2_is_blind,
								    skill_bid_of_effect
									=
									V2_skill_bid_of_effect,
								    actor_hp_changed
									=
									V2_actor_hp_changed,
								    actor_is_dead
									=
									V2_actor_is_dead,
								    aid_actor =
									V2_aid_actor,
								    total_hurt =
									V2_total_hurt,
								    hurt_reward
									=
									V2_hurt_reward}
							   <- V1_effect_play]))/binary>>
				 || #skill_play{order = V1_order,
						actor = V1_actor,
						target = V1_target,
						skill_bid = V1_skill_bid,
						talk_pos = V1_talk_pos,
						talk_content = V1_talk_content,
						effect_play = V1_effect_play}
					<- V0_skill_plays]))/binary,
		(length(V0_round_buff)):16,
		(list_to_binary([<<V1_target:16, V1_buff_bid:32,
				   V1_remain_round:16, V1_end_round:8,
				   V1_action_type:8, V1_change_type:8,
				   V1_change_value:32/signed,
				   V1_is_dead:8/signed, V1_id:32>>
				 || #buff_play{target = V1_target,
					       buff_bid = V1_buff_bid,
					       remain_round = V1_remain_round,
					       end_round = V1_end_round,
					       action_type = V1_action_type,
					       change_type = V1_change_type,
					       change_value = V1_change_value,
					       is_dead = V1_is_dead, id = V1_id}
					<- V0_round_buff]))/binary,
		V0_countdown_time:32, V0_action_count:32,
		V0_combat_type:16, (length(V0_hallows_list)):16,
		(list_to_binary([<<V1_group:8, V1_val:8>>
				 || {V1_group, V1_val}
					<- V0_hallows_list]))/binary,
		(length(V0_sprite_cd_info)):16,
		(list_to_binary([<<V1_pos:16, (length(V1_cd_info)):16,
				   (list_to_binary([<<V2_skill_bid:32,
						      V2_end_round:8/signed>>
						    || #skill_p{skill_bid =
								    V2_skill_bid,
								end_round =
								    V2_end_round}
							   <- V1_cd_info]))/binary>>
				 || {V1_pos, V1_cd_info}
					<- V0_sprite_cd_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20002:16,
       D_a_t_a/binary>>};
pack(20004, cli, {}) -> {ok, <<2:32, 20004:16>>};
pack(20004, srv,
     {V0_skill_plays, V0_round_buff, V0_action_count,
      V0_combat_type, V0_star_list, V0_sprite_cd_info}) ->
    D_a_t_a = <<(length(V0_skill_plays)):16,
		(list_to_binary([<<V1_order:8, V1_actor:16,
				   V1_target:16, V1_skill_bid:32,
				   V1_talk_pos:16,
				   (protocol:pack(string,
						  V1_talk_content))/binary,
				   (length(V1_effect_play)):16,
				   (list_to_binary([<<V2_order:16, V2_actor:16,
						      V2_target:16,
						      V2_effect_bid:32,
						      V2_is_hit:8, V2_is_crit:8,
						      V2_hp_changed:32/signed,
						      V2_hp:64,
						      V2_is_dead:8/signed,
						      V2_camp_restrain:8/signed,
						      (length(V2_buff_list)):16,
						      (list_to_binary([<<V3_target:16,
									 V3_buff_bid:32,
									 V3_remain_round:16,
									 V3_end_round:8,
									 V3_action_type:8,
									 V3_change_type:8,
									 V3_change_value:32/signed,
									 V3_is_dead:8/signed,
									 V3_id:32>>
								       || #buff_play{target
											 =
											 V3_target,
										     buff_bid
											 =
											 V3_buff_bid,
										     remain_round
											 =
											 V3_remain_round,
										     end_round
											 =
											 V3_end_round,
										     action_type
											 =
											 V3_action_type,
										     change_type
											 =
											 V3_change_type,
										     change_value
											 =
											 V3_change_value,
										     is_dead
											 =
											 V3_is_dead,
										     id
											 =
											 V3_id}
									      <- V2_buff_list]))/binary,
						      (length(V2_summon_list)):16,
						      (list_to_binary([<<V3_pos:16,
									 V3_group:8,
									 V3_owner_id:32,
									 (protocol:pack(string,
											V3_owner_srv_id))/binary,
									 V3_object_type:16,
									 V3_object_id:32,
									 V3_object_bid:32,
									 (protocol:pack(string,
											V3_object_name))/binary,
									 V3_star:8,
									 V3_camp_type:8/signed,
									 V3_sex:8/signed,
									 V3_career:8/signed,
									 V3_lev:32,
									 V3_hp:64,
									 V3_hp_max:64,
									 V3_face_id:32/signed,
									 (length(V3_skills)):16,
									 (list_to_binary([<<V4_skill_bid:32,
											    V4_end_round:8/signed>>
											  || #skill_p{skill_bid
													  =
													  V4_skill_bid,
												      end_round
													  =
													  V4_end_round}
												 <- V3_skills]))/binary,
									 (length(V3_extra_data)):16,
									 (list_to_binary([<<V4_extra_key:8,
											    V4_extra_value:32>>
											  || {V4_extra_key,
											      V4_extra_value}
												 <- V3_extra_data]))/binary,
									 (length(V3_sprites)):16,
									 (list_to_binary([<<V4_pos:8,
											    V4_item_bid:32>>
											  || {V4_pos,
											      V4_item_bid}
												 <- V3_sprites]))/binary>>
								       || #fight_object_p{pos
											      =
											      V3_pos,
											  group
											      =
											      V3_group,
											  owner_id
											      =
											      V3_owner_id,
											  owner_srv_id
											      =
											      V3_owner_srv_id,
											  object_type
											      =
											      V3_object_type,
											  object_id
											      =
											      V3_object_id,
											  object_bid
											      =
											      V3_object_bid,
											  object_name
											      =
											      V3_object_name,
											  star
											      =
											      V3_star,
											  camp_type
											      =
											      V3_camp_type,
											  sex
											      =
											      V3_sex,
											  career
											      =
											      V3_career,
											  lev
											      =
											      V3_lev,
											  hp
											      =
											      V3_hp,
											  hp_max
											      =
											      V3_hp_max,
											  face_id
											      =
											      V3_face_id,
											  skills
											      =
											      V3_skills,
											  extra_data
											      =
											      V3_extra_data,
											  sprites
											      =
											      V3_sprites}
									      <- V2_summon_list]))/binary,
						      (length(V2_sub_effect_play_list)):16,
						      (list_to_binary([<<V3_sub_target:16,
									 V3_sub_effect_id:32,
									 V3_sub_hp_changed:32/signed,
									 V3_sub_is_hit:8,
									 V3_sub_skill_id:32,
									 (length(V3_extra_effect)):16,
									 (list_to_binary([<<V4_extra_key:16,
											    V4_extra_param:32/signed>>
											  || {V4_extra_key,
											      V4_extra_param}
												 <- V3_extra_effect]))/binary>>
								       || #sub_effect_play{sub_target
											       =
											       V3_sub_target,
											   sub_effect_id
											       =
											       V3_sub_effect_id,
											   sub_hp_changed
											       =
											       V3_sub_hp_changed,
											   sub_is_hit
											       =
											       V3_sub_is_hit,
											   sub_skill_id
											       =
											       V3_sub_skill_id,
											   extra_effect
											       =
											       V3_extra_effect}
									      <- V2_sub_effect_play_list]))/binary,
						      V2_is_blind:8,
						      V2_skill_bid_of_effect:32,
						      V2_actor_hp_changed:32/signed,
						      V2_actor_is_dead:8/signed,
						      V2_aid_actor:16,
						      V2_total_hurt:32,
						      (length(V2_hurt_reward)):16,
						      (list_to_binary([<<V3_assets_id:32,
									 V3_assets_val:32/signed>>
								       || {V3_assets_id,
									   V3_assets_val}
									      <- V2_hurt_reward]))/binary>>
						    || #effect_play{order =
									V2_order,
								    actor =
									V2_actor,
								    target =
									V2_target,
								    effect_bid =
									V2_effect_bid,
								    is_hit =
									V2_is_hit,
								    is_crit =
									V2_is_crit,
								    hp_changed =
									V2_hp_changed,
								    hp = V2_hp,
								    is_dead =
									V2_is_dead,
								    camp_restrain
									=
									V2_camp_restrain,
								    buff_list =
									V2_buff_list,
								    summon_list
									=
									V2_summon_list,
								    sub_effect_play_list
									=
									V2_sub_effect_play_list,
								    is_blind =
									V2_is_blind,
								    skill_bid_of_effect
									=
									V2_skill_bid_of_effect,
								    actor_hp_changed
									=
									V2_actor_hp_changed,
								    actor_is_dead
									=
									V2_actor_is_dead,
								    aid_actor =
									V2_aid_actor,
								    total_hurt =
									V2_total_hurt,
								    hurt_reward
									=
									V2_hurt_reward}
							   <- V1_effect_play]))/binary>>
				 || #skill_play{order = V1_order,
						actor = V1_actor,
						target = V1_target,
						skill_bid = V1_skill_bid,
						talk_pos = V1_talk_pos,
						talk_content = V1_talk_content,
						effect_play = V1_effect_play}
					<- V0_skill_plays]))/binary,
		(length(V0_round_buff)):16,
		(list_to_binary([<<V1_target:16, V1_buff_bid:32,
				   V1_remain_round:16, V1_end_round:8,
				   V1_action_type:8, V1_change_type:8,
				   V1_change_value:32/signed,
				   V1_is_dead:8/signed, V1_id:32>>
				 || #buff_play{target = V1_target,
					       buff_bid = V1_buff_bid,
					       remain_round = V1_remain_round,
					       end_round = V1_end_round,
					       action_type = V1_action_type,
					       change_type = V1_change_type,
					       change_value = V1_change_value,
					       is_dead = V1_is_dead, id = V1_id}
					<- V0_round_buff]))/binary,
		V0_action_count:32, V0_combat_type:16,
		(length(V0_star_list)):16,
		(list_to_binary([<<V1_id:8, V1_val:8>>
				 || {V1_id, V1_val} <- V0_star_list]))/binary,
		(length(V0_sprite_cd_info)):16,
		(list_to_binary([<<V1_pos:16, (length(V1_cd_info)):16,
				   (list_to_binary([<<V2_skill_bid:32,
						      V2_end_round:8/signed>>
						    || #skill_p{skill_bid =
								    V2_skill_bid,
								end_round =
								    V2_end_round}
							   <- V1_cd_info]))/binary>>
				 || {V1_pos, V1_cd_info}
					<- V0_sprite_cd_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20004:16,
       D_a_t_a/binary>>};
pack(20005, cli, {}) -> {ok, <<2:32, 20005:16>>};
pack(20005, srv, {}) -> {ok, <<2:32, 20005:16>>};
pack(20006, cli, {}) -> {ok, <<2:32, 20006:16>>};
pack(20006, srv,
     {V0_result, V0_item_rewards, V0_show_panel_type,
      V0_current_time, V0_best_time, V0_combat_type,
      V0_target_role_name, V0_hurt_statistics,
      V0_adventure_end_hp, V0_room_id, V0_ext_list}) ->
    D_a_t_a = <<V0_result:8, (length(V0_item_rewards)):16,
		(list_to_binary([<<V1_bid:32, V1_is_bind:8, V1_num:32,
				   V1_id:32>>
				 || {V1_bid, V1_is_bind, V1_num, V1_id}
					<- V0_item_rewards]))/binary,
		V0_show_panel_type:8, V0_current_time:32,
		V0_best_time:32, V0_combat_type:16,
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
					<- V0_hurt_statistics]))/binary,
		V0_adventure_end_hp:32, V0_room_id:8,
		(length(V0_ext_list)):16,
		(list_to_binary([<<V1_ext_type:8, V1_ext_val:32>>
				 || {V1_ext_type, V1_ext_val}
					<- V0_ext_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20006:16,
       D_a_t_a/binary>>};
pack(20008, cli, {}) -> {ok, <<2:32, 20008:16>>};
pack(20008, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20008:16,
       D_a_t_a/binary>>};
pack(20009, cli, {}) -> {ok, <<2:32, 20009:16>>};
pack(20009, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20009:16,
       D_a_t_a/binary>>};
pack(20013, cli, {}) -> {ok, <<2:32, 20013:16>>};
pack(20013, srv,
     {V0_combat_type, V0_formation, V0_objects, V0_is_auto,
      V0_buffs, V0_current_wave, V0_total_wave, V0_play_speed,
      V0_combat_map, V0_extra_args, V0_action_count,
      V0_a_object_num, V0_target_role_name,
      V0_actor_role_name, V0_begin_time, V0_suppress, V0_flag,
      V0_halo_list, V0_hallows_list,
      V0_cli_string_ext_args}) ->
    D_a_t_a = <<V0_combat_type:16,
		(length(V0_formation)):16,
		(list_to_binary([<<V1_group:8, V1_formation_type:8,
				   V1_formation_lev:8>>
				 || {V1_group, V1_formation_type,
				     V1_formation_lev}
					<- V0_formation]))/binary,
		(length(V0_objects)):16,
		(list_to_binary([<<V1_pos:16, V1_group:8,
				   V1_owner_id:32,
				   (protocol:pack(string,
						  V1_owner_srv_id))/binary,
				   V1_object_type:16, V1_object_id:32,
				   V1_object_bid:32,
				   (protocol:pack(string,
						  V1_object_name))/binary,
				   V1_star:8, V1_camp_type:8/signed,
				   V1_sex:8/signed, V1_career:8/signed,
				   V1_lev:32, V1_hp:64, V1_hp_max:64,
				   V1_face_id:32/signed, (length(V1_skills)):16,
				   (list_to_binary([<<V2_skill_bid:32,
						      V2_end_round:8/signed>>
						    || #skill_p{skill_bid =
								    V2_skill_bid,
								end_round =
								    V2_end_round}
							   <- V1_skills]))/binary,
				   (length(V1_extra_data)):16,
				   (list_to_binary([<<V2_extra_key:8,
						      V2_extra_value:32>>
						    || {V2_extra_key,
							V2_extra_value}
							   <- V1_extra_data]))/binary,
				   (length(V1_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites]))/binary>>
				 || #fight_object_p{pos = V1_pos,
						    group = V1_group,
						    owner_id = V1_owner_id,
						    owner_srv_id =
							V1_owner_srv_id,
						    object_type =
							V1_object_type,
						    object_id = V1_object_id,
						    object_bid = V1_object_bid,
						    object_name =
							V1_object_name,
						    star = V1_star,
						    camp_type = V1_camp_type,
						    sex = V1_sex,
						    career = V1_career,
						    lev = V1_lev, hp = V1_hp,
						    hp_max = V1_hp_max,
						    face_id = V1_face_id,
						    skills = V1_skills,
						    extra_data = V1_extra_data,
						    sprites = V1_sprites}
					<- V0_objects]))/binary,
		V0_is_auto:8, (length(V0_buffs)):16,
		(list_to_binary([<<V1_target:16, V1_buff_bid:32,
				   V1_remain_round:16, V1_end_round:8,
				   V1_action_type:8, V1_change_type:8,
				   V1_change_value:32/signed,
				   V1_is_dead:8/signed, V1_id:32>>
				 || #buff_play{target = V1_target,
					       buff_bid = V1_buff_bid,
					       remain_round = V1_remain_round,
					       end_round = V1_end_round,
					       action_type = V1_action_type,
					       change_type = V1_change_type,
					       change_value = V1_change_value,
					       is_dead = V1_is_dead, id = V1_id}
					<- V0_buffs]))/binary,
		V0_current_wave:8, V0_total_wave:16, V0_play_speed:8,
		V0_combat_map:32, (length(V0_extra_args)):16,
		(list_to_binary([<<V1_param:32>>
				 || V1_param <- V0_extra_args]))/binary,
		V0_action_count:32, V0_a_object_num:8,
		(protocol:pack(string, V0_target_role_name))/binary,
		(protocol:pack(string, V0_actor_role_name))/binary,
		V0_begin_time:32, V0_suppress:8, V0_flag:8,
		(length(V0_halo_list)):16,
		(list_to_binary([<<V1_group:8, V1_type:32>>
				 || {V1_group, V1_type}
					<- V0_halo_list]))/binary,
		(length(V0_hallows_list)):16,
		(list_to_binary([<<V1_group:8, V1_val:8, V1_max:8>>
				 || {V1_group, V1_val, V1_max}
					<- V0_hallows_list]))/binary,
		(length(V0_cli_string_ext_args)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_param))/binary>>
				 || V1_param
					<- V0_cli_string_ext_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20013:16,
       D_a_t_a/binary>>};
pack(20014, cli,
     {V0_target_id, V0_target_srv_id, V0_is_province}) ->
    D_a_t_a = <<V0_target_id:32,
		(protocol:pack(string, V0_target_srv_id))/binary,
		V0_is_province:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20014:16,
       D_a_t_a/binary>>};
pack(20014, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20014:16,
       D_a_t_a/binary>>};
pack(20015, cli,
     {V0_target_id, V0_target_srv_id, V0_is_agree}) ->
    D_a_t_a = <<V0_target_id:32,
		(protocol:pack(string, V0_target_srv_id))/binary,
		V0_is_agree:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20015:16,
       D_a_t_a/binary>>};
pack(20015, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20015:16,
       D_a_t_a/binary>>};
pack(20016, cli,
     {V0_target_id, V0_target_srv_id, V0_is_agree}) ->
    D_a_t_a = <<V0_target_id:32,
		(protocol:pack(string, V0_target_srv_id))/binary,
		V0_is_agree:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20016:16,
       D_a_t_a/binary>>};
pack(20016, srv,
     {V0_target_id, V0_target_srv_id, V0_target_name,
      V0_target_lev, V0_target_face, V0_face_update_time,
      V0_face_file}) ->
    D_a_t_a = <<V0_target_id:32,
		(protocol:pack(string, V0_target_srv_id))/binary,
		(protocol:pack(string, V0_target_name))/binary,
		V0_target_lev:8, V0_target_face:32,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20016:16,
       D_a_t_a/binary>>};
pack(20019, cli, {}) -> {ok, <<2:32, 20019:16>>};
pack(20019, srv, {}) -> {ok, <<2:32, 20019:16>>};
pack(20020, cli, {}) -> {ok, <<2:32, 20020:16>>};
pack(20020, srv,
     {V0_combat_type, V0_formation, V0_objects, V0_is_auto,
      V0_buffs, V0_current_wave, V0_total_wave,
      V0_target_role_name, V0_actor_role_name,
      V0_halo_list}) ->
    D_a_t_a = <<V0_combat_type:16,
		(length(V0_formation)):16,
		(list_to_binary([<<V1_group:8, V1_formation_type:8,
				   V1_formation_lev:8>>
				 || {V1_group, V1_formation_type,
				     V1_formation_lev}
					<- V0_formation]))/binary,
		(length(V0_objects)):16,
		(list_to_binary([<<V1_pos:16, V1_group:8,
				   V1_owner_id:32,
				   (protocol:pack(string,
						  V1_owner_srv_id))/binary,
				   V1_object_type:16, V1_object_id:32,
				   V1_object_bid:32,
				   (protocol:pack(string,
						  V1_object_name))/binary,
				   V1_star:8, V1_camp_type:8/signed,
				   V1_sex:8/signed, V1_career:8/signed,
				   V1_lev:32, V1_hp:64, V1_hp_max:64,
				   V1_face_id:32/signed, (length(V1_skills)):16,
				   (list_to_binary([<<V2_skill_bid:32,
						      V2_end_round:8/signed>>
						    || #skill_p{skill_bid =
								    V2_skill_bid,
								end_round =
								    V2_end_round}
							   <- V1_skills]))/binary,
				   (length(V1_extra_data)):16,
				   (list_to_binary([<<V2_extra_key:8,
						      V2_extra_value:32>>
						    || {V2_extra_key,
							V2_extra_value}
							   <- V1_extra_data]))/binary,
				   (length(V1_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites]))/binary>>
				 || #fight_object_p{pos = V1_pos,
						    group = V1_group,
						    owner_id = V1_owner_id,
						    owner_srv_id =
							V1_owner_srv_id,
						    object_type =
							V1_object_type,
						    object_id = V1_object_id,
						    object_bid = V1_object_bid,
						    object_name =
							V1_object_name,
						    star = V1_star,
						    camp_type = V1_camp_type,
						    sex = V1_sex,
						    career = V1_career,
						    lev = V1_lev, hp = V1_hp,
						    hp_max = V1_hp_max,
						    face_id = V1_face_id,
						    skills = V1_skills,
						    extra_data = V1_extra_data,
						    sprites = V1_sprites}
					<- V0_objects]))/binary,
		V0_is_auto:8, (length(V0_buffs)):16,
		(list_to_binary([<<V1_target:16, V1_buff_bid:32,
				   V1_remain_round:16, V1_end_round:8,
				   V1_action_type:8, V1_change_type:8,
				   V1_change_value:32/signed,
				   V1_is_dead:8/signed, V1_id:32>>
				 || #buff_play{target = V1_target,
					       buff_bid = V1_buff_bid,
					       remain_round = V1_remain_round,
					       end_round = V1_end_round,
					       action_type = V1_action_type,
					       change_type = V1_change_type,
					       change_value = V1_change_value,
					       is_dead = V1_is_dead, id = V1_id}
					<- V0_buffs]))/binary,
		V0_current_wave:8, V0_total_wave:16,
		(protocol:pack(string, V0_target_role_name))/binary,
		(protocol:pack(string, V0_actor_role_name))/binary,
		(length(V0_halo_list)):16,
		(list_to_binary([<<V1_group:8, V1_type:32>>
				 || {V1_group, V1_type}
					<- V0_halo_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20020:16,
       D_a_t_a/binary>>};
pack(20022, cli, {V0_speed}) ->
    D_a_t_a = <<V0_speed:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20022:16,
       D_a_t_a/binary>>};
pack(20022, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20022:16,
       D_a_t_a/binary>>};
pack(20026, cli, {}) -> {ok, <<2:32, 20026:16>>};
pack(20026, srv, {V0_drama_id}) ->
    D_a_t_a = <<V0_drama_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20026:16,
       D_a_t_a/binary>>};
pack(20027, cli, {}) -> {ok, <<2:32, 20027:16>>};
pack(20027, srv,
     {V0_combat_type, V0_formation, V0_objects, V0_is_auto,
      V0_current_wave, V0_total_wave, V0_play_speed,
      V0_extra_args, V0_target_role_name, V0_a_object_num,
      V0_actor_role_name, V0_suppress, V0_halo_list,
      V0_hallows_list, V0_string_ext_args}) ->
    D_a_t_a = <<V0_combat_type:16,
		(length(V0_formation)):16,
		(list_to_binary([<<V1_group:8, V1_formation_type:8,
				   V1_formation_lev:8>>
				 || {V1_group, V1_formation_type,
				     V1_formation_lev}
					<- V0_formation]))/binary,
		(length(V0_objects)):16,
		(list_to_binary([<<V1_pos:16, V1_group:8,
				   V1_owner_id:32,
				   (protocol:pack(string,
						  V1_owner_srv_id))/binary,
				   V1_object_type:16, V1_object_id:32,
				   V1_object_bid:32,
				   (protocol:pack(string,
						  V1_object_name))/binary,
				   V1_star:8, V1_camp_type:8/signed,
				   V1_sex:8/signed, V1_career:8/signed,
				   V1_lev:32, V1_hp:64, V1_hp_max:64,
				   V1_face_id:32/signed, (length(V1_skills)):16,
				   (list_to_binary([<<V2_skill_bid:32,
						      V2_end_round:8/signed>>
						    || #skill_p{skill_bid =
								    V2_skill_bid,
								end_round =
								    V2_end_round}
							   <- V1_skills]))/binary,
				   (length(V1_extra_data)):16,
				   (list_to_binary([<<V2_extra_key:8,
						      V2_extra_value:32>>
						    || {V2_extra_key,
							V2_extra_value}
							   <- V1_extra_data]))/binary,
				   (length(V1_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites]))/binary>>
				 || #fight_object_p{pos = V1_pos,
						    group = V1_group,
						    owner_id = V1_owner_id,
						    owner_srv_id =
							V1_owner_srv_id,
						    object_type =
							V1_object_type,
						    object_id = V1_object_id,
						    object_bid = V1_object_bid,
						    object_name =
							V1_object_name,
						    star = V1_star,
						    camp_type = V1_camp_type,
						    sex = V1_sex,
						    career = V1_career,
						    lev = V1_lev, hp = V1_hp,
						    hp_max = V1_hp_max,
						    face_id = V1_face_id,
						    skills = V1_skills,
						    extra_data = V1_extra_data,
						    sprites = V1_sprites}
					<- V0_objects]))/binary,
		V0_is_auto:8, V0_current_wave:8, V0_total_wave:16,
		V0_play_speed:8, (length(V0_extra_args)):16,
		(list_to_binary([<<V1_param:32>>
				 || V1_param <- V0_extra_args]))/binary,
		(protocol:pack(string, V0_target_role_name))/binary,
		V0_a_object_num:8,
		(protocol:pack(string, V0_actor_role_name))/binary,
		V0_suppress:8, (length(V0_halo_list)):16,
		(list_to_binary([<<V1_group:8, V1_type:32>>
				 || {V1_group, V1_type}
					<- V0_halo_list]))/binary,
		(length(V0_hallows_list)):16,
		(list_to_binary([<<V1_group:8, V1_val:8, V1_max:8>>
				 || {V1_group, V1_val, V1_max}
					<- V0_hallows_list]))/binary,
		(length(V0_string_ext_args)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_param))/binary>>
				 || V1_param <- V0_string_ext_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20027:16,
       D_a_t_a/binary>>};
pack(20028, cli, {}) -> {ok, <<2:32, 20028:16>>};
pack(20028, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20028:16,
       D_a_t_a/binary>>};
pack(20029, cli, {V0_replay_id}) ->
    D_a_t_a = <<V0_replay_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20029:16,
       D_a_t_a/binary>>};
pack(20029, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20029:16,
       D_a_t_a/binary>>};
pack(20030, cli, {}) -> {ok, <<2:32, 20030:16>>};
pack(20030, srv, {V0_is_in_combat}) ->
    D_a_t_a = <<V0_is_in_combat:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20030:16,
       D_a_t_a/binary>>};
pack(20033, cli, {}) -> {ok, <<2:32, 20033:16>>};
pack(20033, srv,
     {V0_result, V0_def_name, V0_def_guild_name, V0_def_lev,
      V0_def_face_id, V0_face_update_time, V0_face_file,
      V0_replay_id, V0_is_province, V0_hurt_statistics}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_def_name))/binary,
		(protocol:pack(string, V0_def_guild_name))/binary,
		V0_def_lev:32, V0_def_face_id:32,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary,
		V0_replay_id:32, V0_is_province:8,
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
     <<(byte_size(D_a_t_a) + 2):32, 20033:16,
       D_a_t_a/binary>>};
pack(20034, cli,
     {V0_replay_id, V0_channel, V0_target_name,
      V0_share_type}) ->
    D_a_t_a = <<V0_replay_id:32, V0_channel:16,
		(protocol:pack(string, V0_target_name))/binary,
		V0_share_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20034:16,
       D_a_t_a/binary>>};
pack(20034, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20034:16,
       D_a_t_a/binary>>};
pack(20036, cli, {V0_replay_id, V0_replay_srv_id}) ->
    D_a_t_a = <<V0_replay_id:32,
		(protocol:pack(string, V0_replay_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20036:16,
       D_a_t_a/binary>>};
pack(20036, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20036:16,
       D_a_t_a/binary>>};
pack(20060, cli, {V0_combat_type}) ->
    D_a_t_a = <<V0_combat_type:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20060:16,
       D_a_t_a/binary>>};
pack(20060, srv, {V0_combat_type, V0_type}) ->
    D_a_t_a = <<V0_combat_type:16, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20060:16,
       D_a_t_a/binary>>};
pack(20061, srv,
     {V0_combat_type, V0_bid, V0_partner_list, V0_wave_list,
      V0_dun_bid, V0_b_formation_type}) ->
    D_a_t_a = <<V0_combat_type:16, V0_bid:32,
		(length(V0_partner_list)):16,
		(list_to_binary([<<V1_pos:8, V1_speed:16, V1_bid:32,
				   V1_lev:8, V1_star:8, V1_quality:8, V1_hp:32,
				   V1_crit:16, (length(V1_skill_list)):16,
				   (list_to_binary([<<V2_sid:32,
						      (length(V2_effect_list)):16,
						      (list_to_binary([<<V3_eid:32,
									 V3_num:8,
									 V3_min_hurt:32,
									 V3_max_hurt:32>>
								       || {V3_eid,
									   V3_num,
									   V3_min_hurt,
									   V3_max_hurt}
									      <- V2_effect_list]))/binary,
						      V2_rand:8>>
						    || {V2_sid, V2_effect_list,
							V2_rand}
							   <- V1_skill_list]))/binary,
				   V1_use_skin:32>>
				 || {V1_pos, V1_speed, V1_bid, V1_lev, V1_star,
				     V1_quality, V1_hp, V1_crit, V1_skill_list,
				     V1_use_skin}
					<- V0_partner_list]))/binary,
		(length(V0_wave_list)):16,
		(list_to_binary([<<(length(V1_unit_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_speed:16, V2_hp:32,
						      V2_crit:16,
						      (length(V2_skill_list)):16,
						      (list_to_binary([<<V3_sid:32,
									 (length(V3_effect_list)):16,
									 (list_to_binary([<<V4_eid:32,
											    V4_num:8,
											    V4_min_hurt:32,
											    V4_max_hurt:32>>
											  || {V4_eid,
											      V4_num,
											      V4_min_hurt,
											      V4_max_hurt}
												 <- V3_effect_list]))/binary,
									 V3_rand:8>>
								       || {V3_sid,
									   V3_effect_list,
									   V3_rand}
									      <- V2_skill_list]))/binary>>
						    || {V2_pos, V2_bid,
							V2_speed, V2_hp,
							V2_crit, V2_skill_list}
							   <- V1_unit_list]))/binary>>
				 || {V1_unit_list} <- V0_wave_list]))/binary,
		V0_dun_bid:32, V0_b_formation_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20061:16,
       D_a_t_a/binary>>};
pack(20062, cli, {}) -> {ok, <<2:32, 20062:16>>};
pack(20062, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20062:16,
       D_a_t_a/binary>>};
pack(20063, cli, {}) -> {ok, <<2:32, 20063:16>>};
pack(20063, srv, {V0_type_list}) ->
    D_a_t_a = <<(length(V0_type_list)):16,
		(list_to_binary([<<V1_combat_type:16>>
				 || V1_combat_type <- V0_type_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20063:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(20000, srv, _B0) -> {ok, {}};
unpack(20000, cli, _B0) ->
    {V1_combat_type, _B1} = protocol:uint16(_B0),
    {V1_combat_map, _B2} = protocol:uint32(_B1),
    {ok, {V1_combat_type, V1_combat_map}};
unpack(20001, srv, _B0) -> {ok, {}};
unpack(20001, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20002, srv, _B0) -> {ok, {}};
unpack(20002, cli, _B0) ->
    {V1_pos, _B1} = protocol:uint16(_B0),
    {V1_owner_id, _B2} = protocol:uint32(_B1),
    {V1_owner_srv_id, _B3} = protocol:string(_B2),
    {V1_all_alive, _B7} = protocol:array(_B3,
					 fun (_B4) ->
						 {V2_pos, _B5} =
						     protocol:uint16(_B4),
						 {V2_pos, _B5}
					 end),
    {V1_skill_plays, _B99} = protocol:array(_B7,
					    fun (_B8) ->
						    {V2_order, _B9} =
							protocol:uint8(_B8),
						    {V2_actor, _B10} =
							protocol:uint16(_B9),
						    {V2_target, _B11} =
							protocol:uint16(_B10),
						    {V2_skill_bid, _B12} =
							protocol:uint32(_B11),
						    {V2_talk_pos, _B13} =
							protocol:uint16(_B12),
						    {V2_talk_content, _B14} =
							protocol:string(_B13),
						    {V2_effect_play, _B97} =
							protocol:array(_B14,
								       fun
									 (_B15) ->
									     {V3_order,
									      _B16} =
										 protocol:uint16(_B15),
									     {V3_actor,
									      _B17} =
										 protocol:uint16(_B16),
									     {V3_target,
									      _B18} =
										 protocol:uint16(_B17),
									     {V3_effect_bid,
									      _B19} =
										 protocol:uint32(_B18),
									     {V3_is_hit,
									      _B20} =
										 protocol:uint8(_B19),
									     {V3_is_crit,
									      _B21} =
										 protocol:uint8(_B20),
									     {V3_hp_changed,
									      _B22} =
										 protocol:int32(_B21),
									     {V3_hp,
									      _B23} =
										 protocol:uint64(_B22),
									     {V3_is_dead,
									      _B24} =
										 protocol:int8(_B23),
									     {V3_camp_restrain,
									      _B25} =
										 protocol:int8(_B24),
									     {V3_buff_list,
									      _B37} =
										 protocol:array(_B25,
												fun
												  (_B26) ->
												      {V4_target,
												       _B27} =
													  protocol:uint16(_B26),
												      {V4_buff_bid,
												       _B28} =
													  protocol:uint32(_B27),
												      {V4_remain_round,
												       _B29} =
													  protocol:uint16(_B28),
												      {V4_end_round,
												       _B30} =
													  protocol:uint8(_B29),
												      {V4_action_type,
												       _B31} =
													  protocol:uint8(_B30),
												      {V4_change_type,
												       _B32} =
													  protocol:uint8(_B31),
												      {V4_change_value,
												       _B33} =
													  protocol:int32(_B32),
												      {V4_is_dead,
												       _B34} =
													  protocol:int8(_B33),
												      {V4_id,
												       _B35} =
													  protocol:uint32(_B34),
												      {{V4_target,
													V4_buff_bid,
													V4_remain_round,
													V4_end_round,
													V4_action_type,
													V4_change_type,
													V4_change_value,
													V4_is_dead,
													V4_id},
												       _B35}
												end),
									     {V3_summon_list,
									      _B71} =
										 protocol:array(_B37,
												fun
												  (_B38) ->
												      {V4_pos,
												       _B39} =
													  protocol:uint16(_B38),
												      {V4_group,
												       _B40} =
													  protocol:uint8(_B39),
												      {V4_owner_id,
												       _B41} =
													  protocol:uint32(_B40),
												      {V4_owner_srv_id,
												       _B42} =
													  protocol:string(_B41),
												      {V4_object_type,
												       _B43} =
													  protocol:uint16(_B42),
												      {V4_object_id,
												       _B44} =
													  protocol:uint32(_B43),
												      {V4_object_bid,
												       _B45} =
													  protocol:uint32(_B44),
												      {V4_object_name,
												       _B46} =
													  protocol:string(_B45),
												      {V4_star,
												       _B47} =
													  protocol:uint8(_B46),
												      {V4_camp_type,
												       _B48} =
													  protocol:int8(_B47),
												      {V4_sex,
												       _B49} =
													  protocol:int8(_B48),
												      {V4_career,
												       _B50} =
													  protocol:int8(_B49),
												      {V4_lev,
												       _B51} =
													  protocol:uint32(_B50),
												      {V4_hp,
												       _B52} =
													  protocol:uint64(_B51),
												      {V4_hp_max,
												       _B53} =
													  protocol:uint64(_B52),
												      {V4_face_id,
												       _B54} =
													  protocol:int32(_B53),
												      {V4_skills,
												       _B59} =
													  protocol:array(_B54,
															 fun
															   (_B55) ->
															       {V5_skill_bid,
																_B56} =
																   protocol:uint32(_B55),
															       {V5_end_round,
																_B57} =
																   protocol:int8(_B56),
															       {{V5_skill_bid,
																 V5_end_round},
																_B57}
															 end),
												      {V4_extra_data,
												       _B64} =
													  protocol:array(_B59,
															 fun
															   (_B60) ->
															       {V5_extra_key,
																_B61} =
																   protocol:uint8(_B60),
															       {V5_extra_value,
																_B62} =
																   protocol:uint32(_B61),
															       {{V5_extra_key,
																 V5_extra_value},
																_B62}
															 end),
												      {V4_sprites,
												       _B69} =
													  protocol:array(_B64,
															 fun
															   (_B65) ->
															       {V5_pos,
																_B66} =
																   protocol:uint8(_B65),
															       {V5_item_bid,
																_B67} =
																   protocol:uint32(_B66),
															       {{V5_pos,
																 V5_item_bid},
																_B67}
															 end),
												      {{V4_pos,
													V4_group,
													V4_owner_id,
													V4_owner_srv_id,
													V4_object_type,
													V4_object_id,
													V4_object_bid,
													V4_object_name,
													V4_star,
													V4_camp_type,
													V4_sex,
													V4_career,
													V4_lev,
													V4_hp,
													V4_hp_max,
													V4_face_id,
													V4_skills,
													V4_extra_data,
													V4_sprites},
												       _B69}
												end),
									     {V3_sub_effect_play_list,
									      _B84} =
										 protocol:array(_B71,
												fun
												  (_B72) ->
												      {V4_sub_target,
												       _B73} =
													  protocol:uint16(_B72),
												      {V4_sub_effect_id,
												       _B74} =
													  protocol:uint32(_B73),
												      {V4_sub_hp_changed,
												       _B75} =
													  protocol:int32(_B74),
												      {V4_sub_is_hit,
												       _B76} =
													  protocol:uint8(_B75),
												      {V4_sub_skill_id,
												       _B77} =
													  protocol:uint32(_B76),
												      {V4_extra_effect,
												       _B82} =
													  protocol:array(_B77,
															 fun
															   (_B78) ->
															       {V5_extra_key,
																_B79} =
																   protocol:uint16(_B78),
															       {V5_extra_param,
																_B80} =
																   protocol:int32(_B79),
															       {{V5_extra_key,
																 V5_extra_param},
																_B80}
															 end),
												      {{V4_sub_target,
													V4_sub_effect_id,
													V4_sub_hp_changed,
													V4_sub_is_hit,
													V4_sub_skill_id,
													V4_extra_effect},
												       _B82}
												end),
									     {V3_is_blind,
									      _B85} =
										 protocol:uint8(_B84),
									     {V3_skill_bid_of_effect,
									      _B86} =
										 protocol:uint32(_B85),
									     {V3_actor_hp_changed,
									      _B87} =
										 protocol:int32(_B86),
									     {V3_actor_is_dead,
									      _B88} =
										 protocol:int8(_B87),
									     {V3_aid_actor,
									      _B89} =
										 protocol:uint16(_B88),
									     {V3_total_hurt,
									      _B90} =
										 protocol:uint32(_B89),
									     {V3_hurt_reward,
									      _B95} =
										 protocol:array(_B90,
												fun
												  (_B91) ->
												      {V4_assets_id,
												       _B92} =
													  protocol:uint32(_B91),
												      {V4_assets_val,
												       _B93} =
													  protocol:int32(_B92),
												      {{V4_assets_id,
													V4_assets_val},
												       _B93}
												end),
									     {{V3_order,
									       V3_actor,
									       V3_target,
									       V3_effect_bid,
									       V3_is_hit,
									       V3_is_crit,
									       V3_hp_changed,
									       V3_hp,
									       V3_is_dead,
									       V3_camp_restrain,
									       V3_buff_list,
									       V3_summon_list,
									       V3_sub_effect_play_list,
									       V3_is_blind,
									       V3_skill_bid_of_effect,
									       V3_actor_hp_changed,
									       V3_actor_is_dead,
									       V3_aid_actor,
									       V3_total_hurt,
									       V3_hurt_reward},
									      _B95}
								       end),
						    {{V2_order, V2_actor,
						      V2_target, V2_skill_bid,
						      V2_talk_pos,
						      V2_talk_content,
						      V2_effect_play},
						     _B97}
					    end),
    {V1_round_buff, _B111} = protocol:array(_B99,
					    fun (_B100) ->
						    {V2_target, _B101} =
							protocol:uint16(_B100),
						    {V2_buff_bid, _B102} =
							protocol:uint32(_B101),
						    {V2_remain_round, _B103} =
							protocol:uint16(_B102),
						    {V2_end_round, _B104} =
							protocol:uint8(_B103),
						    {V2_action_type, _B105} =
							protocol:uint8(_B104),
						    {V2_change_type, _B106} =
							protocol:uint8(_B105),
						    {V2_change_value, _B107} =
							protocol:int32(_B106),
						    {V2_is_dead, _B108} =
							protocol:int8(_B107),
						    {V2_id, _B109} =
							protocol:uint32(_B108),
						    {{V2_target, V2_buff_bid,
						      V2_remain_round,
						      V2_end_round,
						      V2_action_type,
						      V2_change_type,
						      V2_change_value,
						      V2_is_dead, V2_id},
						     _B109}
					    end),
    {V1_countdown_time, _B112} = protocol:uint32(_B111),
    {V1_action_count, _B113} = protocol:uint32(_B112),
    {V1_combat_type, _B114} = protocol:uint16(_B113),
    {V1_hallows_list, _B119} = protocol:array(_B114,
					      fun (_B115) ->
						      {V2_group, _B116} =
							  protocol:uint8(_B115),
						      {V2_val, _B117} =
							  protocol:uint8(_B116),
						      {{V2_group, V2_val},
						       _B117}
					      end),
    {V1_sprite_cd_info, _B128} = protocol:array(_B119,
						fun (_B120) ->
							{V2_pos, _B121} =
							    protocol:uint16(_B120),
							{V2_cd_info, _B126} =
							    protocol:array(_B121,
									   fun
									     (_B122) ->
										 {V3_skill_bid,
										  _B123} =
										     protocol:uint32(_B122),
										 {V3_end_round,
										  _B124} =
										     protocol:int8(_B123),
										 {{V3_skill_bid,
										   V3_end_round},
										  _B124}
									   end),
							{{V2_pos, V2_cd_info},
							 _B126}
						end),
    {ok,
     {V1_pos, V1_owner_id, V1_owner_srv_id, V1_all_alive,
      V1_skill_plays, V1_round_buff, V1_countdown_time,
      V1_action_count, V1_combat_type, V1_hallows_list,
      V1_sprite_cd_info}};
unpack(20004, srv, _B0) -> {ok, {}};
unpack(20004, cli, _B0) ->
    {V1_skill_plays, _B92} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_order, _B2} =
							protocol:uint8(_B1),
						    {V2_actor, _B3} =
							protocol:uint16(_B2),
						    {V2_target, _B4} =
							protocol:uint16(_B3),
						    {V2_skill_bid, _B5} =
							protocol:uint32(_B4),
						    {V2_talk_pos, _B6} =
							protocol:uint16(_B5),
						    {V2_talk_content, _B7} =
							protocol:string(_B6),
						    {V2_effect_play, _B90} =
							protocol:array(_B7,
								       fun
									 (_B8) ->
									     {V3_order,
									      _B9} =
										 protocol:uint16(_B8),
									     {V3_actor,
									      _B10} =
										 protocol:uint16(_B9),
									     {V3_target,
									      _B11} =
										 protocol:uint16(_B10),
									     {V3_effect_bid,
									      _B12} =
										 protocol:uint32(_B11),
									     {V3_is_hit,
									      _B13} =
										 protocol:uint8(_B12),
									     {V3_is_crit,
									      _B14} =
										 protocol:uint8(_B13),
									     {V3_hp_changed,
									      _B15} =
										 protocol:int32(_B14),
									     {V3_hp,
									      _B16} =
										 protocol:uint64(_B15),
									     {V3_is_dead,
									      _B17} =
										 protocol:int8(_B16),
									     {V3_camp_restrain,
									      _B18} =
										 protocol:int8(_B17),
									     {V3_buff_list,
									      _B30} =
										 protocol:array(_B18,
												fun
												  (_B19) ->
												      {V4_target,
												       _B20} =
													  protocol:uint16(_B19),
												      {V4_buff_bid,
												       _B21} =
													  protocol:uint32(_B20),
												      {V4_remain_round,
												       _B22} =
													  protocol:uint16(_B21),
												      {V4_end_round,
												       _B23} =
													  protocol:uint8(_B22),
												      {V4_action_type,
												       _B24} =
													  protocol:uint8(_B23),
												      {V4_change_type,
												       _B25} =
													  protocol:uint8(_B24),
												      {V4_change_value,
												       _B26} =
													  protocol:int32(_B25),
												      {V4_is_dead,
												       _B27} =
													  protocol:int8(_B26),
												      {V4_id,
												       _B28} =
													  protocol:uint32(_B27),
												      {{V4_target,
													V4_buff_bid,
													V4_remain_round,
													V4_end_round,
													V4_action_type,
													V4_change_type,
													V4_change_value,
													V4_is_dead,
													V4_id},
												       _B28}
												end),
									     {V3_summon_list,
									      _B64} =
										 protocol:array(_B30,
												fun
												  (_B31) ->
												      {V4_pos,
												       _B32} =
													  protocol:uint16(_B31),
												      {V4_group,
												       _B33} =
													  protocol:uint8(_B32),
												      {V4_owner_id,
												       _B34} =
													  protocol:uint32(_B33),
												      {V4_owner_srv_id,
												       _B35} =
													  protocol:string(_B34),
												      {V4_object_type,
												       _B36} =
													  protocol:uint16(_B35),
												      {V4_object_id,
												       _B37} =
													  protocol:uint32(_B36),
												      {V4_object_bid,
												       _B38} =
													  protocol:uint32(_B37),
												      {V4_object_name,
												       _B39} =
													  protocol:string(_B38),
												      {V4_star,
												       _B40} =
													  protocol:uint8(_B39),
												      {V4_camp_type,
												       _B41} =
													  protocol:int8(_B40),
												      {V4_sex,
												       _B42} =
													  protocol:int8(_B41),
												      {V4_career,
												       _B43} =
													  protocol:int8(_B42),
												      {V4_lev,
												       _B44} =
													  protocol:uint32(_B43),
												      {V4_hp,
												       _B45} =
													  protocol:uint64(_B44),
												      {V4_hp_max,
												       _B46} =
													  protocol:uint64(_B45),
												      {V4_face_id,
												       _B47} =
													  protocol:int32(_B46),
												      {V4_skills,
												       _B52} =
													  protocol:array(_B47,
															 fun
															   (_B48) ->
															       {V5_skill_bid,
																_B49} =
																   protocol:uint32(_B48),
															       {V5_end_round,
																_B50} =
																   protocol:int8(_B49),
															       {{V5_skill_bid,
																 V5_end_round},
																_B50}
															 end),
												      {V4_extra_data,
												       _B57} =
													  protocol:array(_B52,
															 fun
															   (_B53) ->
															       {V5_extra_key,
																_B54} =
																   protocol:uint8(_B53),
															       {V5_extra_value,
																_B55} =
																   protocol:uint32(_B54),
															       {{V5_extra_key,
																 V5_extra_value},
																_B55}
															 end),
												      {V4_sprites,
												       _B62} =
													  protocol:array(_B57,
															 fun
															   (_B58) ->
															       {V5_pos,
																_B59} =
																   protocol:uint8(_B58),
															       {V5_item_bid,
																_B60} =
																   protocol:uint32(_B59),
															       {{V5_pos,
																 V5_item_bid},
																_B60}
															 end),
												      {{V4_pos,
													V4_group,
													V4_owner_id,
													V4_owner_srv_id,
													V4_object_type,
													V4_object_id,
													V4_object_bid,
													V4_object_name,
													V4_star,
													V4_camp_type,
													V4_sex,
													V4_career,
													V4_lev,
													V4_hp,
													V4_hp_max,
													V4_face_id,
													V4_skills,
													V4_extra_data,
													V4_sprites},
												       _B62}
												end),
									     {V3_sub_effect_play_list,
									      _B77} =
										 protocol:array(_B64,
												fun
												  (_B65) ->
												      {V4_sub_target,
												       _B66} =
													  protocol:uint16(_B65),
												      {V4_sub_effect_id,
												       _B67} =
													  protocol:uint32(_B66),
												      {V4_sub_hp_changed,
												       _B68} =
													  protocol:int32(_B67),
												      {V4_sub_is_hit,
												       _B69} =
													  protocol:uint8(_B68),
												      {V4_sub_skill_id,
												       _B70} =
													  protocol:uint32(_B69),
												      {V4_extra_effect,
												       _B75} =
													  protocol:array(_B70,
															 fun
															   (_B71) ->
															       {V5_extra_key,
																_B72} =
																   protocol:uint16(_B71),
															       {V5_extra_param,
																_B73} =
																   protocol:int32(_B72),
															       {{V5_extra_key,
																 V5_extra_param},
																_B73}
															 end),
												      {{V4_sub_target,
													V4_sub_effect_id,
													V4_sub_hp_changed,
													V4_sub_is_hit,
													V4_sub_skill_id,
													V4_extra_effect},
												       _B75}
												end),
									     {V3_is_blind,
									      _B78} =
										 protocol:uint8(_B77),
									     {V3_skill_bid_of_effect,
									      _B79} =
										 protocol:uint32(_B78),
									     {V3_actor_hp_changed,
									      _B80} =
										 protocol:int32(_B79),
									     {V3_actor_is_dead,
									      _B81} =
										 protocol:int8(_B80),
									     {V3_aid_actor,
									      _B82} =
										 protocol:uint16(_B81),
									     {V3_total_hurt,
									      _B83} =
										 protocol:uint32(_B82),
									     {V3_hurt_reward,
									      _B88} =
										 protocol:array(_B83,
												fun
												  (_B84) ->
												      {V4_assets_id,
												       _B85} =
													  protocol:uint32(_B84),
												      {V4_assets_val,
												       _B86} =
													  protocol:int32(_B85),
												      {{V4_assets_id,
													V4_assets_val},
												       _B86}
												end),
									     {{V3_order,
									       V3_actor,
									       V3_target,
									       V3_effect_bid,
									       V3_is_hit,
									       V3_is_crit,
									       V3_hp_changed,
									       V3_hp,
									       V3_is_dead,
									       V3_camp_restrain,
									       V3_buff_list,
									       V3_summon_list,
									       V3_sub_effect_play_list,
									       V3_is_blind,
									       V3_skill_bid_of_effect,
									       V3_actor_hp_changed,
									       V3_actor_is_dead,
									       V3_aid_actor,
									       V3_total_hurt,
									       V3_hurt_reward},
									      _B88}
								       end),
						    {{V2_order, V2_actor,
						      V2_target, V2_skill_bid,
						      V2_talk_pos,
						      V2_talk_content,
						      V2_effect_play},
						     _B90}
					    end),
    {V1_round_buff, _B104} = protocol:array(_B92,
					    fun (_B93) ->
						    {V2_target, _B94} =
							protocol:uint16(_B93),
						    {V2_buff_bid, _B95} =
							protocol:uint32(_B94),
						    {V2_remain_round, _B96} =
							protocol:uint16(_B95),
						    {V2_end_round, _B97} =
							protocol:uint8(_B96),
						    {V2_action_type, _B98} =
							protocol:uint8(_B97),
						    {V2_change_type, _B99} =
							protocol:uint8(_B98),
						    {V2_change_value, _B100} =
							protocol:int32(_B99),
						    {V2_is_dead, _B101} =
							protocol:int8(_B100),
						    {V2_id, _B102} =
							protocol:uint32(_B101),
						    {{V2_target, V2_buff_bid,
						      V2_remain_round,
						      V2_end_round,
						      V2_action_type,
						      V2_change_type,
						      V2_change_value,
						      V2_is_dead, V2_id},
						     _B102}
					    end),
    {V1_action_count, _B105} = protocol:uint32(_B104),
    {V1_combat_type, _B106} = protocol:uint16(_B105),
    {V1_star_list, _B111} = protocol:array(_B106,
					   fun (_B107) ->
						   {V2_id, _B108} =
						       protocol:uint8(_B107),
						   {V2_val, _B109} =
						       protocol:uint8(_B108),
						   {{V2_id, V2_val}, _B109}
					   end),
    {V1_sprite_cd_info, _B120} = protocol:array(_B111,
						fun (_B112) ->
							{V2_pos, _B113} =
							    protocol:uint16(_B112),
							{V2_cd_info, _B118} =
							    protocol:array(_B113,
									   fun
									     (_B114) ->
										 {V3_skill_bid,
										  _B115} =
										     protocol:uint32(_B114),
										 {V3_end_round,
										  _B116} =
										     protocol:int8(_B115),
										 {{V3_skill_bid,
										   V3_end_round},
										  _B116}
									   end),
							{{V2_pos, V2_cd_info},
							 _B118}
						end),
    {ok,
     {V1_skill_plays, V1_round_buff, V1_action_count,
      V1_combat_type, V1_star_list, V1_sprite_cd_info}};
unpack(20005, srv, _B0) -> {ok, {}};
unpack(20005, cli, _B0) -> {ok, {}};
unpack(20006, srv, _B0) -> {ok, {}};
unpack(20006, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_item_rewards, _B8} = protocol:array(_B1,
					    fun (_B2) ->
						    {V2_bid, _B3} =
							protocol:uint32(_B2),
						    {V2_is_bind, _B4} =
							protocol:uint8(_B3),
						    {V2_num, _B5} =
							protocol:uint32(_B4),
						    {V2_id, _B6} =
							protocol:uint32(_B5),
						    {{V2_bid, V2_is_bind,
						      V2_num, V2_id},
						     _B6}
					    end),
    {V1_show_panel_type, _B9} = protocol:uint8(_B8),
    {V1_current_time, _B10} = protocol:uint32(_B9),
    {V1_best_time, _B11} = protocol:uint32(_B10),
    {V1_combat_type, _B12} = protocol:uint16(_B11),
    {V1_target_role_name, _B13} = protocol:string(_B12),
    {V1_hurt_statistics, _B35} = protocol:array(_B13,
						fun (_B14) ->
							{V2_type, _B15} =
							    protocol:uint8(_B14),
							{V2_partner_hurts,
							 _B33} =
							    protocol:array(_B15,
									   fun
									     (_B16) ->
										 {V3_rid,
										  _B17} =
										     protocol:uint32(_B16),
										 {V3_srvid,
										  _B18} =
										     protocol:string(_B17),
										 {V3_id,
										  _B19} =
										     protocol:uint32(_B18),
										 {V3_bid,
										  _B20} =
										     protocol:uint32(_B19),
										 {V3_star,
										  _B21} =
										     protocol:uint32(_B20),
										 {V3_lev,
										  _B22} =
										     protocol:uint32(_B21),
										 {V3_camp_type,
										  _B23} =
										     protocol:uint32(_B22),
										 {V3_dps,
										  _B24} =
										     protocol:uint32(_B23),
										 {V3_cure,
										  _B25} =
										     protocol:uint32(_B24),
										 {V3_ext_data,
										  _B30} =
										     protocol:array(_B25,
												    fun
												      (_B26) ->
													  {V4_key,
													   _B27} =
													      protocol:uint32(_B26),
													  {V4_val,
													   _B28} =
													      protocol:uint32(_B27),
													  {{V4_key,
													    V4_val},
													   _B28}
												    end),
										 {V3_be_hurt,
										  _B31} =
										     protocol:uint32(_B30),
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
										  _B31}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B33}
						end),
    {V1_adventure_end_hp, _B36} = protocol:uint32(_B35),
    {V1_room_id, _B37} = protocol:uint8(_B36),
    {V1_ext_list, _B42} = protocol:array(_B37,
					 fun (_B38) ->
						 {V2_ext_type, _B39} =
						     protocol:uint8(_B38),
						 {V2_ext_val, _B40} =
						     protocol:uint32(_B39),
						 {{V2_ext_type, V2_ext_val},
						  _B40}
					 end),
    {ok,
     {V1_result, V1_item_rewards, V1_show_panel_type,
      V1_current_time, V1_best_time, V1_combat_type,
      V1_target_role_name, V1_hurt_statistics,
      V1_adventure_end_hp, V1_room_id, V1_ext_list}};
unpack(20008, srv, _B0) -> {ok, {}};
unpack(20008, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20009, srv, _B0) -> {ok, {}};
unpack(20009, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20013, srv, _B0) -> {ok, {}};
unpack(20013, cli, _B0) ->
    {V1_combat_type, _B1} = protocol:uint16(_B0),
    {V1_formation, _B7} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_group, _B3} =
						     protocol:uint8(_B2),
						 {V2_formation_type, _B4} =
						     protocol:uint8(_B3),
						 {V2_formation_lev, _B5} =
						     protocol:uint8(_B4),
						 {{V2_group, V2_formation_type,
						   V2_formation_lev},
						  _B5}
					 end),
    {V1_objects, _B41} = protocol:array(_B7,
					fun (_B8) ->
						{V2_pos, _B9} =
						    protocol:uint16(_B8),
						{V2_group, _B10} =
						    protocol:uint8(_B9),
						{V2_owner_id, _B11} =
						    protocol:uint32(_B10),
						{V2_owner_srv_id, _B12} =
						    protocol:string(_B11),
						{V2_object_type, _B13} =
						    protocol:uint16(_B12),
						{V2_object_id, _B14} =
						    protocol:uint32(_B13),
						{V2_object_bid, _B15} =
						    protocol:uint32(_B14),
						{V2_object_name, _B16} =
						    protocol:string(_B15),
						{V2_star, _B17} =
						    protocol:uint8(_B16),
						{V2_camp_type, _B18} =
						    protocol:int8(_B17),
						{V2_sex, _B19} =
						    protocol:int8(_B18),
						{V2_career, _B20} =
						    protocol:int8(_B19),
						{V2_lev, _B21} =
						    protocol:uint32(_B20),
						{V2_hp, _B22} =
						    protocol:uint64(_B21),
						{V2_hp_max, _B23} =
						    protocol:uint64(_B22),
						{V2_face_id, _B24} =
						    protocol:int32(_B23),
						{V2_skills, _B29} =
						    protocol:array(_B24,
								   fun (_B25) ->
									   {V3_skill_bid,
									    _B26} =
									       protocol:uint32(_B25),
									   {V3_end_round,
									    _B27} =
									       protocol:int8(_B26),
									   {{V3_skill_bid,
									     V3_end_round},
									    _B27}
								   end),
						{V2_extra_data, _B34} =
						    protocol:array(_B29,
								   fun (_B30) ->
									   {V3_extra_key,
									    _B31} =
									       protocol:uint8(_B30),
									   {V3_extra_value,
									    _B32} =
									       protocol:uint32(_B31),
									   {{V3_extra_key,
									     V3_extra_value},
									    _B32}
								   end),
						{V2_sprites, _B39} =
						    protocol:array(_B34,
								   fun (_B35) ->
									   {V3_pos,
									    _B36} =
									       protocol:uint8(_B35),
									   {V3_item_bid,
									    _B37} =
									       protocol:uint32(_B36),
									   {{V3_pos,
									     V3_item_bid},
									    _B37}
								   end),
						{{V2_pos, V2_group, V2_owner_id,
						  V2_owner_srv_id,
						  V2_object_type, V2_object_id,
						  V2_object_bid, V2_object_name,
						  V2_star, V2_camp_type, V2_sex,
						  V2_career, V2_lev, V2_hp,
						  V2_hp_max, V2_face_id,
						  V2_skills, V2_extra_data,
						  V2_sprites},
						 _B39}
					end),
    {V1_is_auto, _B42} = protocol:uint8(_B41),
    {V1_buffs, _B54} = protocol:array(_B42,
				      fun (_B43) ->
					      {V2_target, _B44} =
						  protocol:uint16(_B43),
					      {V2_buff_bid, _B45} =
						  protocol:uint32(_B44),
					      {V2_remain_round, _B46} =
						  protocol:uint16(_B45),
					      {V2_end_round, _B47} =
						  protocol:uint8(_B46),
					      {V2_action_type, _B48} =
						  protocol:uint8(_B47),
					      {V2_change_type, _B49} =
						  protocol:uint8(_B48),
					      {V2_change_value, _B50} =
						  protocol:int32(_B49),
					      {V2_is_dead, _B51} =
						  protocol:int8(_B50),
					      {V2_id, _B52} =
						  protocol:uint32(_B51),
					      {{V2_target, V2_buff_bid,
						V2_remain_round, V2_end_round,
						V2_action_type, V2_change_type,
						V2_change_value, V2_is_dead,
						V2_id},
					       _B52}
				      end),
    {V1_current_wave, _B55} = protocol:uint8(_B54),
    {V1_total_wave, _B56} = protocol:uint16(_B55),
    {V1_play_speed, _B57} = protocol:uint8(_B56),
    {V1_combat_map, _B58} = protocol:uint32(_B57),
    {V1_extra_args, _B62} = protocol:array(_B58,
					   fun (_B59) ->
						   {V2_param, _B60} =
						       protocol:uint32(_B59),
						   {V2_param, _B60}
					   end),
    {V1_action_count, _B63} = protocol:uint32(_B62),
    {V1_a_object_num, _B64} = protocol:uint8(_B63),
    {V1_target_role_name, _B65} = protocol:string(_B64),
    {V1_actor_role_name, _B66} = protocol:string(_B65),
    {V1_begin_time, _B67} = protocol:uint32(_B66),
    {V1_suppress, _B68} = protocol:uint8(_B67),
    {V1_flag, _B69} = protocol:uint8(_B68),
    {V1_halo_list, _B74} = protocol:array(_B69,
					  fun (_B70) ->
						  {V2_group, _B71} =
						      protocol:uint8(_B70),
						  {V2_type, _B72} =
						      protocol:uint32(_B71),
						  {{V2_group, V2_type}, _B72}
					  end),
    {V1_hallows_list, _B80} = protocol:array(_B74,
					     fun (_B75) ->
						     {V2_group, _B76} =
							 protocol:uint8(_B75),
						     {V2_val, _B77} =
							 protocol:uint8(_B76),
						     {V2_max, _B78} =
							 protocol:uint8(_B77),
						     {{V2_group, V2_val,
						       V2_max},
						      _B78}
					     end),
    {V1_cli_string_ext_args, _B84} = protocol:array(_B80,
						    fun (_B81) ->
							    {V2_param, _B82} =
								protocol:string(_B81),
							    {V2_param, _B82}
						    end),
    {ok,
     {V1_combat_type, V1_formation, V1_objects, V1_is_auto,
      V1_buffs, V1_current_wave, V1_total_wave, V1_play_speed,
      V1_combat_map, V1_extra_args, V1_action_count,
      V1_a_object_num, V1_target_role_name,
      V1_actor_role_name, V1_begin_time, V1_suppress, V1_flag,
      V1_halo_list, V1_hallows_list, V1_cli_string_ext_args}};
unpack(20014, srv, _B0) ->
    {V1_target_id, _B1} = protocol:uint32(_B0),
    {V1_target_srv_id, _B2} = protocol:string(_B1),
    {V1_is_province, _B3} = protocol:uint8(_B2),
    {ok, {V1_target_id, V1_target_srv_id, V1_is_province}};
unpack(20014, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20015, srv, _B0) ->
    {V1_target_id, _B1} = protocol:uint32(_B0),
    {V1_target_srv_id, _B2} = protocol:string(_B1),
    {V1_is_agree, _B3} = protocol:uint8(_B2),
    {ok, {V1_target_id, V1_target_srv_id, V1_is_agree}};
unpack(20015, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20016, srv, _B0) ->
    {V1_target_id, _B1} = protocol:uint32(_B0),
    {V1_target_srv_id, _B2} = protocol:string(_B1),
    {V1_is_agree, _B3} = protocol:uint8(_B2),
    {ok, {V1_target_id, V1_target_srv_id, V1_is_agree}};
unpack(20016, cli, _B0) ->
    {V1_target_id, _B1} = protocol:uint32(_B0),
    {V1_target_srv_id, _B2} = protocol:string(_B1),
    {V1_target_name, _B3} = protocol:string(_B2),
    {V1_target_lev, _B4} = protocol:uint8(_B3),
    {V1_target_face, _B5} = protocol:uint32(_B4),
    {V1_face_update_time, _B6} = protocol:uint32(_B5),
    {V1_face_file, _B7} = protocol:string(_B6),
    {ok,
     {V1_target_id, V1_target_srv_id, V1_target_name,
      V1_target_lev, V1_target_face, V1_face_update_time,
      V1_face_file}};
unpack(20019, srv, _B0) -> {ok, {}};
unpack(20019, cli, _B0) -> {ok, {}};
unpack(20020, srv, _B0) -> {ok, {}};
unpack(20020, cli, _B0) ->
    {V1_combat_type, _B1} = protocol:uint16(_B0),
    {V1_formation, _B7} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_group, _B3} =
						     protocol:uint8(_B2),
						 {V2_formation_type, _B4} =
						     protocol:uint8(_B3),
						 {V2_formation_lev, _B5} =
						     protocol:uint8(_B4),
						 {{V2_group, V2_formation_type,
						   V2_formation_lev},
						  _B5}
					 end),
    {V1_objects, _B41} = protocol:array(_B7,
					fun (_B8) ->
						{V2_pos, _B9} =
						    protocol:uint16(_B8),
						{V2_group, _B10} =
						    protocol:uint8(_B9),
						{V2_owner_id, _B11} =
						    protocol:uint32(_B10),
						{V2_owner_srv_id, _B12} =
						    protocol:string(_B11),
						{V2_object_type, _B13} =
						    protocol:uint16(_B12),
						{V2_object_id, _B14} =
						    protocol:uint32(_B13),
						{V2_object_bid, _B15} =
						    protocol:uint32(_B14),
						{V2_object_name, _B16} =
						    protocol:string(_B15),
						{V2_star, _B17} =
						    protocol:uint8(_B16),
						{V2_camp_type, _B18} =
						    protocol:int8(_B17),
						{V2_sex, _B19} =
						    protocol:int8(_B18),
						{V2_career, _B20} =
						    protocol:int8(_B19),
						{V2_lev, _B21} =
						    protocol:uint32(_B20),
						{V2_hp, _B22} =
						    protocol:uint64(_B21),
						{V2_hp_max, _B23} =
						    protocol:uint64(_B22),
						{V2_face_id, _B24} =
						    protocol:int32(_B23),
						{V2_skills, _B29} =
						    protocol:array(_B24,
								   fun (_B25) ->
									   {V3_skill_bid,
									    _B26} =
									       protocol:uint32(_B25),
									   {V3_end_round,
									    _B27} =
									       protocol:int8(_B26),
									   {{V3_skill_bid,
									     V3_end_round},
									    _B27}
								   end),
						{V2_extra_data, _B34} =
						    protocol:array(_B29,
								   fun (_B30) ->
									   {V3_extra_key,
									    _B31} =
									       protocol:uint8(_B30),
									   {V3_extra_value,
									    _B32} =
									       protocol:uint32(_B31),
									   {{V3_extra_key,
									     V3_extra_value},
									    _B32}
								   end),
						{V2_sprites, _B39} =
						    protocol:array(_B34,
								   fun (_B35) ->
									   {V3_pos,
									    _B36} =
									       protocol:uint8(_B35),
									   {V3_item_bid,
									    _B37} =
									       protocol:uint32(_B36),
									   {{V3_pos,
									     V3_item_bid},
									    _B37}
								   end),
						{{V2_pos, V2_group, V2_owner_id,
						  V2_owner_srv_id,
						  V2_object_type, V2_object_id,
						  V2_object_bid, V2_object_name,
						  V2_star, V2_camp_type, V2_sex,
						  V2_career, V2_lev, V2_hp,
						  V2_hp_max, V2_face_id,
						  V2_skills, V2_extra_data,
						  V2_sprites},
						 _B39}
					end),
    {V1_is_auto, _B42} = protocol:uint8(_B41),
    {V1_buffs, _B54} = protocol:array(_B42,
				      fun (_B43) ->
					      {V2_target, _B44} =
						  protocol:uint16(_B43),
					      {V2_buff_bid, _B45} =
						  protocol:uint32(_B44),
					      {V2_remain_round, _B46} =
						  protocol:uint16(_B45),
					      {V2_end_round, _B47} =
						  protocol:uint8(_B46),
					      {V2_action_type, _B48} =
						  protocol:uint8(_B47),
					      {V2_change_type, _B49} =
						  protocol:uint8(_B48),
					      {V2_change_value, _B50} =
						  protocol:int32(_B49),
					      {V2_is_dead, _B51} =
						  protocol:int8(_B50),
					      {V2_id, _B52} =
						  protocol:uint32(_B51),
					      {{V2_target, V2_buff_bid,
						V2_remain_round, V2_end_round,
						V2_action_type, V2_change_type,
						V2_change_value, V2_is_dead,
						V2_id},
					       _B52}
				      end),
    {V1_current_wave, _B55} = protocol:uint8(_B54),
    {V1_total_wave, _B56} = protocol:uint16(_B55),
    {V1_target_role_name, _B57} = protocol:string(_B56),
    {V1_actor_role_name, _B58} = protocol:string(_B57),
    {V1_halo_list, _B63} = protocol:array(_B58,
					  fun (_B59) ->
						  {V2_group, _B60} =
						      protocol:uint8(_B59),
						  {V2_type, _B61} =
						      protocol:uint32(_B60),
						  {{V2_group, V2_type}, _B61}
					  end),
    {ok,
     {V1_combat_type, V1_formation, V1_objects, V1_is_auto,
      V1_buffs, V1_current_wave, V1_total_wave,
      V1_target_role_name, V1_actor_role_name, V1_halo_list}};
unpack(20022, srv, _B0) ->
    {V1_speed, _B1} = protocol:uint8(_B0), {ok, {V1_speed}};
unpack(20022, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20026, srv, _B0) -> {ok, {}};
unpack(20026, cli, _B0) ->
    {V1_drama_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_drama_id}};
unpack(20027, srv, _B0) -> {ok, {}};
unpack(20027, cli, _B0) ->
    {V1_combat_type, _B1} = protocol:uint16(_B0),
    {V1_formation, _B7} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_group, _B3} =
						     protocol:uint8(_B2),
						 {V2_formation_type, _B4} =
						     protocol:uint8(_B3),
						 {V2_formation_lev, _B5} =
						     protocol:uint8(_B4),
						 {{V2_group, V2_formation_type,
						   V2_formation_lev},
						  _B5}
					 end),
    {V1_objects, _B41} = protocol:array(_B7,
					fun (_B8) ->
						{V2_pos, _B9} =
						    protocol:uint16(_B8),
						{V2_group, _B10} =
						    protocol:uint8(_B9),
						{V2_owner_id, _B11} =
						    protocol:uint32(_B10),
						{V2_owner_srv_id, _B12} =
						    protocol:string(_B11),
						{V2_object_type, _B13} =
						    protocol:uint16(_B12),
						{V2_object_id, _B14} =
						    protocol:uint32(_B13),
						{V2_object_bid, _B15} =
						    protocol:uint32(_B14),
						{V2_object_name, _B16} =
						    protocol:string(_B15),
						{V2_star, _B17} =
						    protocol:uint8(_B16),
						{V2_camp_type, _B18} =
						    protocol:int8(_B17),
						{V2_sex, _B19} =
						    protocol:int8(_B18),
						{V2_career, _B20} =
						    protocol:int8(_B19),
						{V2_lev, _B21} =
						    protocol:uint32(_B20),
						{V2_hp, _B22} =
						    protocol:uint64(_B21),
						{V2_hp_max, _B23} =
						    protocol:uint64(_B22),
						{V2_face_id, _B24} =
						    protocol:int32(_B23),
						{V2_skills, _B29} =
						    protocol:array(_B24,
								   fun (_B25) ->
									   {V3_skill_bid,
									    _B26} =
									       protocol:uint32(_B25),
									   {V3_end_round,
									    _B27} =
									       protocol:int8(_B26),
									   {{V3_skill_bid,
									     V3_end_round},
									    _B27}
								   end),
						{V2_extra_data, _B34} =
						    protocol:array(_B29,
								   fun (_B30) ->
									   {V3_extra_key,
									    _B31} =
									       protocol:uint8(_B30),
									   {V3_extra_value,
									    _B32} =
									       protocol:uint32(_B31),
									   {{V3_extra_key,
									     V3_extra_value},
									    _B32}
								   end),
						{V2_sprites, _B39} =
						    protocol:array(_B34,
								   fun (_B35) ->
									   {V3_pos,
									    _B36} =
									       protocol:uint8(_B35),
									   {V3_item_bid,
									    _B37} =
									       protocol:uint32(_B36),
									   {{V3_pos,
									     V3_item_bid},
									    _B37}
								   end),
						{{V2_pos, V2_group, V2_owner_id,
						  V2_owner_srv_id,
						  V2_object_type, V2_object_id,
						  V2_object_bid, V2_object_name,
						  V2_star, V2_camp_type, V2_sex,
						  V2_career, V2_lev, V2_hp,
						  V2_hp_max, V2_face_id,
						  V2_skills, V2_extra_data,
						  V2_sprites},
						 _B39}
					end),
    {V1_is_auto, _B42} = protocol:uint8(_B41),
    {V1_current_wave, _B43} = protocol:uint8(_B42),
    {V1_total_wave, _B44} = protocol:uint16(_B43),
    {V1_play_speed, _B45} = protocol:uint8(_B44),
    {V1_extra_args, _B49} = protocol:array(_B45,
					   fun (_B46) ->
						   {V2_param, _B47} =
						       protocol:uint32(_B46),
						   {V2_param, _B47}
					   end),
    {V1_target_role_name, _B50} = protocol:string(_B49),
    {V1_a_object_num, _B51} = protocol:uint8(_B50),
    {V1_actor_role_name, _B52} = protocol:string(_B51),
    {V1_suppress, _B53} = protocol:uint8(_B52),
    {V1_halo_list, _B58} = protocol:array(_B53,
					  fun (_B54) ->
						  {V2_group, _B55} =
						      protocol:uint8(_B54),
						  {V2_type, _B56} =
						      protocol:uint32(_B55),
						  {{V2_group, V2_type}, _B56}
					  end),
    {V1_hallows_list, _B64} = protocol:array(_B58,
					     fun (_B59) ->
						     {V2_group, _B60} =
							 protocol:uint8(_B59),
						     {V2_val, _B61} =
							 protocol:uint8(_B60),
						     {V2_max, _B62} =
							 protocol:uint8(_B61),
						     {{V2_group, V2_val,
						       V2_max},
						      _B62}
					     end),
    {V1_string_ext_args, _B68} = protocol:array(_B64,
						fun (_B65) ->
							{V2_param, _B66} =
							    protocol:string(_B65),
							{V2_param, _B66}
						end),
    {ok,
     {V1_combat_type, V1_formation, V1_objects, V1_is_auto,
      V1_current_wave, V1_total_wave, V1_play_speed,
      V1_extra_args, V1_target_role_name, V1_a_object_num,
      V1_actor_role_name, V1_suppress, V1_halo_list,
      V1_hallows_list, V1_string_ext_args}};
unpack(20028, srv, _B0) -> {ok, {}};
unpack(20028, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20029, srv, _B0) ->
    {V1_replay_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_replay_id}};
unpack(20029, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20030, srv, _B0) -> {ok, {}};
unpack(20030, cli, _B0) ->
    {V1_is_in_combat, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_in_combat}};
unpack(20033, srv, _B0) -> {ok, {}};
unpack(20033, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_def_name, _B2} = protocol:string(_B1),
    {V1_def_guild_name, _B3} = protocol:string(_B2),
    {V1_def_lev, _B4} = protocol:uint32(_B3),
    {V1_def_face_id, _B5} = protocol:uint32(_B4),
    {V1_face_update_time, _B6} = protocol:uint32(_B5),
    {V1_face_file, _B7} = protocol:string(_B6),
    {V1_replay_id, _B8} = protocol:uint32(_B7),
    {V1_is_province, _B9} = protocol:uint8(_B8),
    {V1_hurt_statistics, _B31} = protocol:array(_B9,
						fun (_B10) ->
							{V2_type, _B11} =
							    protocol:uint8(_B10),
							{V2_partner_hurts,
							 _B29} =
							    protocol:array(_B11,
									   fun
									     (_B12) ->
										 {V3_rid,
										  _B13} =
										     protocol:uint32(_B12),
										 {V3_srvid,
										  _B14} =
										     protocol:string(_B13),
										 {V3_id,
										  _B15} =
										     protocol:uint32(_B14),
										 {V3_bid,
										  _B16} =
										     protocol:uint32(_B15),
										 {V3_star,
										  _B17} =
										     protocol:uint32(_B16),
										 {V3_lev,
										  _B18} =
										     protocol:uint32(_B17),
										 {V3_camp_type,
										  _B19} =
										     protocol:uint32(_B18),
										 {V3_dps,
										  _B20} =
										     protocol:uint32(_B19),
										 {V3_cure,
										  _B21} =
										     protocol:uint32(_B20),
										 {V3_ext_data,
										  _B26} =
										     protocol:array(_B21,
												    fun
												      (_B22) ->
													  {V4_key,
													   _B23} =
													      protocol:uint32(_B22),
													  {V4_val,
													   _B24} =
													      protocol:uint32(_B23),
													  {{V4_key,
													    V4_val},
													   _B24}
												    end),
										 {V3_be_hurt,
										  _B27} =
										     protocol:uint32(_B26),
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
										  _B27}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B29}
						end),
    {ok,
     {V1_result, V1_def_name, V1_def_guild_name, V1_def_lev,
      V1_def_face_id, V1_face_update_time, V1_face_file,
      V1_replay_id, V1_is_province, V1_hurt_statistics}};
unpack(20034, srv, _B0) ->
    {V1_replay_id, _B1} = protocol:uint32(_B0),
    {V1_channel, _B2} = protocol:uint16(_B1),
    {V1_target_name, _B3} = protocol:string(_B2),
    {V1_share_type, _B4} = protocol:uint8(_B3),
    {ok,
     {V1_replay_id, V1_channel, V1_target_name,
      V1_share_type}};
unpack(20034, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(20036, srv, _B0) ->
    {V1_replay_id, _B1} = protocol:uint32(_B0),
    {V1_replay_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_replay_id, V1_replay_srv_id}};
unpack(20036, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20060, srv, _B0) ->
    {V1_combat_type, _B1} = protocol:uint16(_B0),
    {ok, {V1_combat_type}};
unpack(20060, cli, _B0) ->
    {V1_combat_type, _B1} = protocol:uint16(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_combat_type, V1_type}};
unpack(20061, cli, _B0) ->
    {V1_combat_type, _B1} = protocol:uint16(_B0),
    {V1_bid, _B2} = protocol:uint32(_B1),
    {V1_partner_list, _B26} = protocol:array(_B2,
					     fun (_B3) ->
						     {V2_pos, _B4} =
							 protocol:uint8(_B3),
						     {V2_speed, _B5} =
							 protocol:uint16(_B4),
						     {V2_bid, _B6} =
							 protocol:uint32(_B5),
						     {V2_lev, _B7} =
							 protocol:uint8(_B6),
						     {V2_star, _B8} =
							 protocol:uint8(_B7),
						     {V2_quality, _B9} =
							 protocol:uint8(_B8),
						     {V2_hp, _B10} =
							 protocol:uint32(_B9),
						     {V2_crit, _B11} =
							 protocol:uint16(_B10),
						     {V2_skill_list, _B23} =
							 protocol:array(_B11,
									fun
									  (_B12) ->
									      {V3_sid,
									       _B13} =
										  protocol:uint32(_B12),
									      {V3_effect_list,
									       _B20} =
										  protocol:array(_B13,
												 fun
												   (_B14) ->
												       {V4_eid,
													_B15} =
													   protocol:uint32(_B14),
												       {V4_num,
													_B16} =
													   protocol:uint8(_B15),
												       {V4_min_hurt,
													_B17} =
													   protocol:uint32(_B16),
												       {V4_max_hurt,
													_B18} =
													   protocol:uint32(_B17),
												       {{V4_eid,
													 V4_num,
													 V4_min_hurt,
													 V4_max_hurt},
													_B18}
												 end),
									      {V3_rand,
									       _B21} =
										  protocol:uint8(_B20),
									      {{V3_sid,
										V3_effect_list,
										V3_rand},
									       _B21}
									end),
						     {V2_use_skin, _B24} =
							 protocol:uint32(_B23),
						     {{V2_pos, V2_speed, V2_bid,
						       V2_lev, V2_star,
						       V2_quality, V2_hp,
						       V2_crit, V2_skill_list,
						       V2_use_skin},
						      _B24}
					     end),
    {V1_wave_list, _B49} = protocol:array(_B26,
					  fun (_B27) ->
						  {V2_unit_list, _B47} =
						      protocol:array(_B27,
								     fun
								       (_B28) ->
									   {V3_pos,
									    _B29} =
									       protocol:uint8(_B28),
									   {V3_bid,
									    _B30} =
									       protocol:uint32(_B29),
									   {V3_speed,
									    _B31} =
									       protocol:uint16(_B30),
									   {V3_hp,
									    _B32} =
									       protocol:uint32(_B31),
									   {V3_crit,
									    _B33} =
									       protocol:uint16(_B32),
									   {V3_skill_list,
									    _B45} =
									       protocol:array(_B33,
											      fun
												(_B34) ->
												    {V4_sid,
												     _B35} =
													protocol:uint32(_B34),
												    {V4_effect_list,
												     _B42} =
													protocol:array(_B35,
														       fun
															 (_B36) ->
															     {V5_eid,
															      _B37} =
																 protocol:uint32(_B36),
															     {V5_num,
															      _B38} =
																 protocol:uint8(_B37),
															     {V5_min_hurt,
															      _B39} =
																 protocol:uint32(_B38),
															     {V5_max_hurt,
															      _B40} =
																 protocol:uint32(_B39),
															     {{V5_eid,
															       V5_num,
															       V5_min_hurt,
															       V5_max_hurt},
															      _B40}
														       end),
												    {V4_rand,
												     _B43} =
													protocol:uint8(_B42),
												    {{V4_sid,
												      V4_effect_list,
												      V4_rand},
												     _B43}
											      end),
									   {{V3_pos,
									     V3_bid,
									     V3_speed,
									     V3_hp,
									     V3_crit,
									     V3_skill_list},
									    _B45}
								     end),
						  {{V2_unit_list}, _B47}
					  end),
    {V1_dun_bid, _B50} = protocol:uint32(_B49),
    {V1_b_formation_type, _B51} = protocol:uint8(_B50),
    {ok,
     {V1_combat_type, V1_bid, V1_partner_list, V1_wave_list,
      V1_dun_bid, V1_b_formation_type}};
unpack(20062, srv, _B0) -> {ok, {}};
unpack(20062, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20063, srv, _B0) -> {ok, {}};
unpack(20063, cli, _B0) ->
    {V1_type_list, _B4} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_combat_type, _B2} =
						     protocol:uint16(_B1),
						 {V2_combat_type, _B2}
					 end),
    {ok, {V1_type_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(20000) -> <<2, 4, 6>>;
pack_mate(20002) ->
    <<11, 4, 6, 7, 9, 1, 4, 9, 7, 2, 4, 4, 6, 4, 7, 9, 20,
      4, 4, 4, 6, 2, 2, 5, 12, 1, 1, 9, 9, 4, 6, 4, 2, 2, 2,
      5, 1, 6, 9, 19, 4, 2, 6, 7, 4, 6, 6, 7, 2, 1, 1, 1, 6,
      12, 12, 5, 9, 2, 6, 1, 9, 2, 2, 6, 9, 2, 2, 6, 9, 6, 4,
      6, 5, 2, 6, 9, 2, 4, 5, 2, 6, 5, 1, 4, 6, 9, 2, 6, 5, 9,
      9, 4, 6, 4, 2, 2, 2, 5, 1, 6, 6, 6, 4, 9, 2, 2, 2, 9, 2,
      4, 9, 2, 6, 1>>;
pack_mate(20004) ->
    <<6, 9, 7, 2, 4, 4, 6, 4, 7, 9, 20, 4, 4, 4, 6, 2, 2, 5,
      12, 1, 1, 9, 9, 4, 6, 4, 2, 2, 2, 5, 1, 6, 9, 19, 4, 2,
      6, 7, 4, 6, 6, 7, 2, 1, 1, 1, 6, 12, 12, 5, 9, 2, 6, 1,
      9, 2, 2, 6, 9, 2, 2, 6, 9, 6, 4, 6, 5, 2, 6, 9, 2, 4, 5,
      2, 6, 5, 1, 4, 6, 9, 2, 6, 5, 9, 9, 4, 6, 4, 2, 2, 2, 5,
      1, 6, 6, 4, 9, 2, 2, 2, 9, 2, 4, 9, 2, 6, 1>>;
pack_mate(20020) ->
    <<10, 4, 9, 3, 2, 2, 2, 9, 19, 4, 2, 6, 7, 4, 6, 6, 7,
      2, 1, 1, 1, 6, 12, 12, 5, 9, 2, 6, 1, 9, 2, 2, 6, 9, 2,
      2, 6, 2, 9, 9, 4, 6, 4, 2, 2, 2, 5, 1, 6, 2, 4, 7, 7, 9,
      2, 2, 6>>;
pack_mate(20027) ->
    <<15, 4, 9, 3, 2, 2, 2, 9, 19, 4, 2, 6, 7, 4, 6, 6, 7,
      2, 1, 1, 1, 6, 12, 12, 5, 9, 2, 6, 1, 9, 2, 2, 6, 9, 2,
      2, 6, 2, 2, 4, 2, 9, 1, 6, 7, 2, 7, 2, 9, 2, 2, 6, 9, 3,
      2, 2, 2, 9, 1, 7>>;
pack_mate(_Code) -> <<0>>.

convert_data(20000, Data) ->
    #{combat_type => proto_lib:convert_data(Data, 1, int),
      combat_map => proto_lib:convert_data(Data, 2, int)};
convert_data(20002, Data) ->
    #{pos => proto_lib:convert_data(Data, 1, int),
      owner_id => proto_lib:convert_data(Data, 2, int),
      owner_srv_id => proto_lib:convert_data(Data, 3, str),
      all_alive => proto_lib:convert_data(Data, 4, list),
      skill_plays =>
	  begin
	    V1_skill_plays = proto_lib:convert_data(Data, 5, list),
	    [#skill_play{order =
			     proto_lib:convert_data(V1_skill_plays_I, 1, int),
			 actor =
			     proto_lib:convert_data(V1_skill_plays_I, 2, int),
			 target =
			     proto_lib:convert_data(V1_skill_plays_I, 3, int),
			 skill_bid =
			     proto_lib:convert_data(V1_skill_plays_I, 4, int),
			 talk_pos =
			     proto_lib:convert_data(V1_skill_plays_I, 5, int),
			 talk_content =
			     proto_lib:convert_data(V1_skill_plays_I, 6, str),
			 effect_play =
			     begin
			       V2_effect_play =
				   proto_lib:convert_data(V1_skill_plays_I, 7,
							  list),
			       [#effect_play{order =
						 proto_lib:convert_data(V2_effect_play_I,
									1, int),
					     actor =
						 proto_lib:convert_data(V2_effect_play_I,
									2, int),
					     target =
						 proto_lib:convert_data(V2_effect_play_I,
									3, int),
					     effect_bid =
						 proto_lib:convert_data(V2_effect_play_I,
									4, int),
					     is_hit =
						 proto_lib:convert_data(V2_effect_play_I,
									5, int),
					     is_crit =
						 proto_lib:convert_data(V2_effect_play_I,
									6, int),
					     hp_changed =
						 proto_lib:convert_data(V2_effect_play_I,
									7, int),
					     hp =
						 proto_lib:convert_data(V2_effect_play_I,
									8, int),
					     is_dead =
						 proto_lib:convert_data(V2_effect_play_I,
									9, int),
					     camp_restrain =
						 proto_lib:convert_data(V2_effect_play_I,
									10,
									int),
					     buff_list =
						 begin
						   V3_buff_list =
						       proto_lib:convert_data(V2_effect_play_I,
									      11,
									      list),
						   [#buff_play{target =
								   proto_lib:convert_data(V3_buff_list_I,
											  1,
											  int),
							       buff_bid =
								   proto_lib:convert_data(V3_buff_list_I,
											  2,
											  int),
							       remain_round =
								   proto_lib:convert_data(V3_buff_list_I,
											  3,
											  int),
							       end_round =
								   proto_lib:convert_data(V3_buff_list_I,
											  4,
											  int),
							       action_type =
								   proto_lib:convert_data(V3_buff_list_I,
											  5,
											  int),
							       change_type =
								   proto_lib:convert_data(V3_buff_list_I,
											  6,
											  int),
							       change_value =
								   proto_lib:convert_data(V3_buff_list_I,
											  7,
											  int),
							       is_dead =
								   proto_lib:convert_data(V3_buff_list_I,
											  8,
											  int),
							       id =
								   proto_lib:convert_data(V3_buff_list_I,
											  9,
											  int)}
						    || V3_buff_list_I
							   <- V3_buff_list]
						 end,
					     summon_list =
						 begin
						   V3_summon_list =
						       proto_lib:convert_data(V2_effect_play_I,
									      12,
									      list),
						   [#fight_object_p{pos =
									proto_lib:convert_data(V3_summon_list_I,
											       1,
											       int),
								    group =
									proto_lib:convert_data(V3_summon_list_I,
											       2,
											       int),
								    owner_id =
									proto_lib:convert_data(V3_summon_list_I,
											       3,
											       int),
								    owner_srv_id
									=
									proto_lib:convert_data(V3_summon_list_I,
											       4,
											       str),
								    object_type
									=
									proto_lib:convert_data(V3_summon_list_I,
											       5,
											       int),
								    object_id =
									proto_lib:convert_data(V3_summon_list_I,
											       6,
											       int),
								    object_bid =
									proto_lib:convert_data(V3_summon_list_I,
											       7,
											       int),
								    object_name
									=
									proto_lib:convert_data(V3_summon_list_I,
											       8,
											       str),
								    star =
									proto_lib:convert_data(V3_summon_list_I,
											       9,
											       int),
								    camp_type =
									proto_lib:convert_data(V3_summon_list_I,
											       10,
											       int),
								    sex =
									proto_lib:convert_data(V3_summon_list_I,
											       11,
											       int),
								    career =
									proto_lib:convert_data(V3_summon_list_I,
											       12,
											       int),
								    lev =
									proto_lib:convert_data(V3_summon_list_I,
											       13,
											       int),
								    hp =
									proto_lib:convert_data(V3_summon_list_I,
											       14,
											       int),
								    hp_max =
									proto_lib:convert_data(V3_summon_list_I,
											       15,
											       int),
								    face_id =
									proto_lib:convert_data(V3_summon_list_I,
											       16,
											       int),
								    skills =
									begin
									  V4_skills =
									      proto_lib:convert_data(V3_summon_list_I,
												     17,
												     list),
									  [#skill_p{skill_bid
											=
											proto_lib:convert_data(V4_skills_I,
													       1,
													       int),
										    end_round
											=
											proto_lib:convert_data(V4_skills_I,
													       2,
													       int)}
									   || V4_skills_I
										  <- V4_skills]
									end,
								    extra_data =
									begin
									  V4_extra_data =
									      proto_lib:convert_data(V3_summon_list_I,
												     18,
												     list),
									  [#{extra_key
										 =>
										 proto_lib:convert_data(V4_extra_data_I,
													1,
													int),
									     extra_value
										 =>
										 proto_lib:convert_data(V4_extra_data_I,
													2,
													int)}
									   || V4_extra_data_I
										  <- V4_extra_data]
									end,
								    sprites =
									begin
									  V4_sprites =
									      proto_lib:convert_data(V3_summon_list_I,
												     19,
												     list),
									  [#{pos
										 =>
										 proto_lib:convert_data(V4_sprites_I,
													1,
													int),
									     item_bid
										 =>
										 proto_lib:convert_data(V4_sprites_I,
													2,
													int)}
									   || V4_sprites_I
										  <- V4_sprites]
									end}
						    || V3_summon_list_I
							   <- V3_summon_list]
						 end,
					     sub_effect_play_list =
						 begin
						   V3_sub_effect_play_list =
						       proto_lib:convert_data(V2_effect_play_I,
									      13,
									      list),
						   [#sub_effect_play{sub_target
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												1,
												int),
								     sub_effect_id
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												2,
												int),
								     sub_hp_changed
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												3,
												int),
								     sub_is_hit
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												4,
												int),
								     sub_skill_id
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												5,
												int),
								     extra_effect
									 =
									 begin
									   V4_extra_effect =
									       proto_lib:convert_data(V3_sub_effect_play_list_I,
												      6,
												      list),
									   [#{extra_key
										  =>
										  proto_lib:convert_data(V4_extra_effect_I,
													 1,
													 int),
									      extra_param
										  =>
										  proto_lib:convert_data(V4_extra_effect_I,
													 2,
													 int)}
									    || V4_extra_effect_I
										   <- V4_extra_effect]
									 end}
						    || V3_sub_effect_play_list_I
							   <- V3_sub_effect_play_list]
						 end,
					     is_blind =
						 proto_lib:convert_data(V2_effect_play_I,
									14,
									int),
					     skill_bid_of_effect =
						 proto_lib:convert_data(V2_effect_play_I,
									15,
									int),
					     actor_hp_changed =
						 proto_lib:convert_data(V2_effect_play_I,
									16,
									int),
					     actor_is_dead =
						 proto_lib:convert_data(V2_effect_play_I,
									17,
									int),
					     aid_actor =
						 proto_lib:convert_data(V2_effect_play_I,
									18,
									int),
					     total_hurt =
						 proto_lib:convert_data(V2_effect_play_I,
									19,
									int),
					     hurt_reward =
						 begin
						   V3_hurt_reward =
						       proto_lib:convert_data(V2_effect_play_I,
									      20,
									      list),
						   [#{assets_id =>
							  proto_lib:convert_data(V3_hurt_reward_I,
										 1,
										 int),
						      assets_val =>
							  proto_lib:convert_data(V3_hurt_reward_I,
										 2,
										 int)}
						    || V3_hurt_reward_I
							   <- V3_hurt_reward]
						 end}
				|| V2_effect_play_I <- V2_effect_play]
			     end}
	     || V1_skill_plays_I <- V1_skill_plays]
	  end,
      round_buff =>
	  begin
	    V1_round_buff = proto_lib:convert_data(Data, 6, list),
	    [#buff_play{target =
			    proto_lib:convert_data(V1_round_buff_I, 1, int),
			buff_bid =
			    proto_lib:convert_data(V1_round_buff_I, 2, int),
			remain_round =
			    proto_lib:convert_data(V1_round_buff_I, 3, int),
			end_round =
			    proto_lib:convert_data(V1_round_buff_I, 4, int),
			action_type =
			    proto_lib:convert_data(V1_round_buff_I, 5, int),
			change_type =
			    proto_lib:convert_data(V1_round_buff_I, 6, int),
			change_value =
			    proto_lib:convert_data(V1_round_buff_I, 7, int),
			is_dead =
			    proto_lib:convert_data(V1_round_buff_I, 8, int),
			id = proto_lib:convert_data(V1_round_buff_I, 9, int)}
	     || V1_round_buff_I <- V1_round_buff]
	  end,
      countdown_time => proto_lib:convert_data(Data, 7, int),
      action_count => proto_lib:convert_data(Data, 8, int),
      combat_type => proto_lib:convert_data(Data, 9, int),
      hallows_list =>
	  begin
	    V1_hallows_list = proto_lib:convert_data(Data, 10,
						     list),
	    [#{group =>
		   proto_lib:convert_data(V1_hallows_list_I, 1, int),
	       val =>
		   proto_lib:convert_data(V1_hallows_list_I, 2, int)}
	     || V1_hallows_list_I <- V1_hallows_list]
	  end,
      sprite_cd_info =>
	  begin
	    V1_sprite_cd_info = proto_lib:convert_data(Data, 11,
						       list),
	    [#{pos =>
		   proto_lib:convert_data(V1_sprite_cd_info_I, 1, int),
	       cd_info =>
		   begin
		     V2_cd_info = proto_lib:convert_data(V1_sprite_cd_info_I,
							 2, list),
		     [#skill_p{skill_bid =
				   proto_lib:convert_data(V2_cd_info_I, 1, int),
			       end_round =
				   proto_lib:convert_data(V2_cd_info_I, 2, int)}
		      || V2_cd_info_I <- V2_cd_info]
		   end}
	     || V1_sprite_cd_info_I <- V1_sprite_cd_info]
	  end};
convert_data(20004, Data) ->
    #{skill_plays =>
	  begin
	    V1_skill_plays = proto_lib:convert_data(Data, 1, list),
	    [#skill_play{order =
			     proto_lib:convert_data(V1_skill_plays_I, 1, int),
			 actor =
			     proto_lib:convert_data(V1_skill_plays_I, 2, int),
			 target =
			     proto_lib:convert_data(V1_skill_plays_I, 3, int),
			 skill_bid =
			     proto_lib:convert_data(V1_skill_plays_I, 4, int),
			 talk_pos =
			     proto_lib:convert_data(V1_skill_plays_I, 5, int),
			 talk_content =
			     proto_lib:convert_data(V1_skill_plays_I, 6, str),
			 effect_play =
			     begin
			       V2_effect_play =
				   proto_lib:convert_data(V1_skill_plays_I, 7,
							  list),
			       [#effect_play{order =
						 proto_lib:convert_data(V2_effect_play_I,
									1, int),
					     actor =
						 proto_lib:convert_data(V2_effect_play_I,
									2, int),
					     target =
						 proto_lib:convert_data(V2_effect_play_I,
									3, int),
					     effect_bid =
						 proto_lib:convert_data(V2_effect_play_I,
									4, int),
					     is_hit =
						 proto_lib:convert_data(V2_effect_play_I,
									5, int),
					     is_crit =
						 proto_lib:convert_data(V2_effect_play_I,
									6, int),
					     hp_changed =
						 proto_lib:convert_data(V2_effect_play_I,
									7, int),
					     hp =
						 proto_lib:convert_data(V2_effect_play_I,
									8, int),
					     is_dead =
						 proto_lib:convert_data(V2_effect_play_I,
									9, int),
					     camp_restrain =
						 proto_lib:convert_data(V2_effect_play_I,
									10,
									int),
					     buff_list =
						 begin
						   V3_buff_list =
						       proto_lib:convert_data(V2_effect_play_I,
									      11,
									      list),
						   [#buff_play{target =
								   proto_lib:convert_data(V3_buff_list_I,
											  1,
											  int),
							       buff_bid =
								   proto_lib:convert_data(V3_buff_list_I,
											  2,
											  int),
							       remain_round =
								   proto_lib:convert_data(V3_buff_list_I,
											  3,
											  int),
							       end_round =
								   proto_lib:convert_data(V3_buff_list_I,
											  4,
											  int),
							       action_type =
								   proto_lib:convert_data(V3_buff_list_I,
											  5,
											  int),
							       change_type =
								   proto_lib:convert_data(V3_buff_list_I,
											  6,
											  int),
							       change_value =
								   proto_lib:convert_data(V3_buff_list_I,
											  7,
											  int),
							       is_dead =
								   proto_lib:convert_data(V3_buff_list_I,
											  8,
											  int),
							       id =
								   proto_lib:convert_data(V3_buff_list_I,
											  9,
											  int)}
						    || V3_buff_list_I
							   <- V3_buff_list]
						 end,
					     summon_list =
						 begin
						   V3_summon_list =
						       proto_lib:convert_data(V2_effect_play_I,
									      12,
									      list),
						   [#fight_object_p{pos =
									proto_lib:convert_data(V3_summon_list_I,
											       1,
											       int),
								    group =
									proto_lib:convert_data(V3_summon_list_I,
											       2,
											       int),
								    owner_id =
									proto_lib:convert_data(V3_summon_list_I,
											       3,
											       int),
								    owner_srv_id
									=
									proto_lib:convert_data(V3_summon_list_I,
											       4,
											       str),
								    object_type
									=
									proto_lib:convert_data(V3_summon_list_I,
											       5,
											       int),
								    object_id =
									proto_lib:convert_data(V3_summon_list_I,
											       6,
											       int),
								    object_bid =
									proto_lib:convert_data(V3_summon_list_I,
											       7,
											       int),
								    object_name
									=
									proto_lib:convert_data(V3_summon_list_I,
											       8,
											       str),
								    star =
									proto_lib:convert_data(V3_summon_list_I,
											       9,
											       int),
								    camp_type =
									proto_lib:convert_data(V3_summon_list_I,
											       10,
											       int),
								    sex =
									proto_lib:convert_data(V3_summon_list_I,
											       11,
											       int),
								    career =
									proto_lib:convert_data(V3_summon_list_I,
											       12,
											       int),
								    lev =
									proto_lib:convert_data(V3_summon_list_I,
											       13,
											       int),
								    hp =
									proto_lib:convert_data(V3_summon_list_I,
											       14,
											       int),
								    hp_max =
									proto_lib:convert_data(V3_summon_list_I,
											       15,
											       int),
								    face_id =
									proto_lib:convert_data(V3_summon_list_I,
											       16,
											       int),
								    skills =
									begin
									  V4_skills =
									      proto_lib:convert_data(V3_summon_list_I,
												     17,
												     list),
									  [#skill_p{skill_bid
											=
											proto_lib:convert_data(V4_skills_I,
													       1,
													       int),
										    end_round
											=
											proto_lib:convert_data(V4_skills_I,
													       2,
													       int)}
									   || V4_skills_I
										  <- V4_skills]
									end,
								    extra_data =
									begin
									  V4_extra_data =
									      proto_lib:convert_data(V3_summon_list_I,
												     18,
												     list),
									  [#{extra_key
										 =>
										 proto_lib:convert_data(V4_extra_data_I,
													1,
													int),
									     extra_value
										 =>
										 proto_lib:convert_data(V4_extra_data_I,
													2,
													int)}
									   || V4_extra_data_I
										  <- V4_extra_data]
									end,
								    sprites =
									begin
									  V4_sprites =
									      proto_lib:convert_data(V3_summon_list_I,
												     19,
												     list),
									  [#{pos
										 =>
										 proto_lib:convert_data(V4_sprites_I,
													1,
													int),
									     item_bid
										 =>
										 proto_lib:convert_data(V4_sprites_I,
													2,
													int)}
									   || V4_sprites_I
										  <- V4_sprites]
									end}
						    || V3_summon_list_I
							   <- V3_summon_list]
						 end,
					     sub_effect_play_list =
						 begin
						   V3_sub_effect_play_list =
						       proto_lib:convert_data(V2_effect_play_I,
									      13,
									      list),
						   [#sub_effect_play{sub_target
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												1,
												int),
								     sub_effect_id
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												2,
												int),
								     sub_hp_changed
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												3,
												int),
								     sub_is_hit
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												4,
												int),
								     sub_skill_id
									 =
									 proto_lib:convert_data(V3_sub_effect_play_list_I,
												5,
												int),
								     extra_effect
									 =
									 begin
									   V4_extra_effect =
									       proto_lib:convert_data(V3_sub_effect_play_list_I,
												      6,
												      list),
									   [#{extra_key
										  =>
										  proto_lib:convert_data(V4_extra_effect_I,
													 1,
													 int),
									      extra_param
										  =>
										  proto_lib:convert_data(V4_extra_effect_I,
													 2,
													 int)}
									    || V4_extra_effect_I
										   <- V4_extra_effect]
									 end}
						    || V3_sub_effect_play_list_I
							   <- V3_sub_effect_play_list]
						 end,
					     is_blind =
						 proto_lib:convert_data(V2_effect_play_I,
									14,
									int),
					     skill_bid_of_effect =
						 proto_lib:convert_data(V2_effect_play_I,
									15,
									int),
					     actor_hp_changed =
						 proto_lib:convert_data(V2_effect_play_I,
									16,
									int),
					     actor_is_dead =
						 proto_lib:convert_data(V2_effect_play_I,
									17,
									int),
					     aid_actor =
						 proto_lib:convert_data(V2_effect_play_I,
									18,
									int),
					     total_hurt =
						 proto_lib:convert_data(V2_effect_play_I,
									19,
									int),
					     hurt_reward =
						 begin
						   V3_hurt_reward =
						       proto_lib:convert_data(V2_effect_play_I,
									      20,
									      list),
						   [#{assets_id =>
							  proto_lib:convert_data(V3_hurt_reward_I,
										 1,
										 int),
						      assets_val =>
							  proto_lib:convert_data(V3_hurt_reward_I,
										 2,
										 int)}
						    || V3_hurt_reward_I
							   <- V3_hurt_reward]
						 end}
				|| V2_effect_play_I <- V2_effect_play]
			     end}
	     || V1_skill_plays_I <- V1_skill_plays]
	  end,
      round_buff =>
	  begin
	    V1_round_buff = proto_lib:convert_data(Data, 2, list),
	    [#buff_play{target =
			    proto_lib:convert_data(V1_round_buff_I, 1, int),
			buff_bid =
			    proto_lib:convert_data(V1_round_buff_I, 2, int),
			remain_round =
			    proto_lib:convert_data(V1_round_buff_I, 3, int),
			end_round =
			    proto_lib:convert_data(V1_round_buff_I, 4, int),
			action_type =
			    proto_lib:convert_data(V1_round_buff_I, 5, int),
			change_type =
			    proto_lib:convert_data(V1_round_buff_I, 6, int),
			change_value =
			    proto_lib:convert_data(V1_round_buff_I, 7, int),
			is_dead =
			    proto_lib:convert_data(V1_round_buff_I, 8, int),
			id = proto_lib:convert_data(V1_round_buff_I, 9, int)}
	     || V1_round_buff_I <- V1_round_buff]
	  end,
      action_count => proto_lib:convert_data(Data, 3, int),
      combat_type => proto_lib:convert_data(Data, 4, int),
      star_list =>
	  begin
	    V1_star_list = proto_lib:convert_data(Data, 5, list),
	    [#{id => proto_lib:convert_data(V1_star_list_I, 1, int),
	       val => proto_lib:convert_data(V1_star_list_I, 2, int)}
	     || V1_star_list_I <- V1_star_list]
	  end,
      sprite_cd_info =>
	  begin
	    V1_sprite_cd_info = proto_lib:convert_data(Data, 6,
						       list),
	    [#{pos =>
		   proto_lib:convert_data(V1_sprite_cd_info_I, 1, int),
	       cd_info =>
		   begin
		     V2_cd_info = proto_lib:convert_data(V1_sprite_cd_info_I,
							 2, list),
		     [#skill_p{skill_bid =
				   proto_lib:convert_data(V2_cd_info_I, 1, int),
			       end_round =
				   proto_lib:convert_data(V2_cd_info_I, 2, int)}
		      || V2_cd_info_I <- V2_cd_info]
		   end}
	     || V1_sprite_cd_info_I <- V1_sprite_cd_info]
	  end};
convert_data(20020, Data) ->
    #{combat_type => proto_lib:convert_data(Data, 1, int),
      formation =>
	  begin
	    V1_formation = proto_lib:convert_data(Data, 2, list),
	    [#{group =>
		   proto_lib:convert_data(V1_formation_I, 1, int),
	       formation_type =>
		   proto_lib:convert_data(V1_formation_I, 2, int),
	       formation_lev =>
		   proto_lib:convert_data(V1_formation_I, 3, int)}
	     || V1_formation_I <- V1_formation]
	  end,
      objects =>
	  begin
	    V1_objects = proto_lib:convert_data(Data, 3, list),
	    [#fight_object_p{pos =
				 proto_lib:convert_data(V1_objects_I, 1, int),
			     group =
				 proto_lib:convert_data(V1_objects_I, 2, int),
			     owner_id =
				 proto_lib:convert_data(V1_objects_I, 3, int),
			     owner_srv_id =
				 proto_lib:convert_data(V1_objects_I, 4, str),
			     object_type =
				 proto_lib:convert_data(V1_objects_I, 5, int),
			     object_id =
				 proto_lib:convert_data(V1_objects_I, 6, int),
			     object_bid =
				 proto_lib:convert_data(V1_objects_I, 7, int),
			     object_name =
				 proto_lib:convert_data(V1_objects_I, 8, str),
			     star =
				 proto_lib:convert_data(V1_objects_I, 9, int),
			     camp_type =
				 proto_lib:convert_data(V1_objects_I, 10, int),
			     sex =
				 proto_lib:convert_data(V1_objects_I, 11, int),
			     career =
				 proto_lib:convert_data(V1_objects_I, 12, int),
			     lev =
				 proto_lib:convert_data(V1_objects_I, 13, int),
			     hp = proto_lib:convert_data(V1_objects_I, 14, int),
			     hp_max =
				 proto_lib:convert_data(V1_objects_I, 15, int),
			     face_id =
				 proto_lib:convert_data(V1_objects_I, 16, int),
			     skills =
				 begin
				   V2_skills =
				       proto_lib:convert_data(V1_objects_I, 17,
							      list),
				   [#skill_p{skill_bid =
						 proto_lib:convert_data(V2_skills_I,
									1, int),
					     end_round =
						 proto_lib:convert_data(V2_skills_I,
									2, int)}
				    || V2_skills_I <- V2_skills]
				 end,
			     extra_data =
				 begin
				   V2_extra_data =
				       proto_lib:convert_data(V1_objects_I, 18,
							      list),
				   [#{extra_key =>
					  proto_lib:convert_data(V2_extra_data_I,
								 1, int),
				      extra_value =>
					  proto_lib:convert_data(V2_extra_data_I,
								 2, int)}
				    || V2_extra_data_I <- V2_extra_data]
				 end,
			     sprites =
				 begin
				   V2_sprites =
				       proto_lib:convert_data(V1_objects_I, 19,
							      list),
				   [#{pos =>
					  proto_lib:convert_data(V2_sprites_I,
								 1, int),
				      item_bid =>
					  proto_lib:convert_data(V2_sprites_I,
								 2, int)}
				    || V2_sprites_I <- V2_sprites]
				 end}
	     || V1_objects_I <- V1_objects]
	  end,
      is_auto => proto_lib:convert_data(Data, 4, int),
      buffs =>
	  begin
	    V1_buffs = proto_lib:convert_data(Data, 5, list),
	    [#buff_play{target =
			    proto_lib:convert_data(V1_buffs_I, 1, int),
			buff_bid = proto_lib:convert_data(V1_buffs_I, 2, int),
			remain_round =
			    proto_lib:convert_data(V1_buffs_I, 3, int),
			end_round = proto_lib:convert_data(V1_buffs_I, 4, int),
			action_type =
			    proto_lib:convert_data(V1_buffs_I, 5, int),
			change_type =
			    proto_lib:convert_data(V1_buffs_I, 6, int),
			change_value =
			    proto_lib:convert_data(V1_buffs_I, 7, int),
			is_dead = proto_lib:convert_data(V1_buffs_I, 8, int),
			id = proto_lib:convert_data(V1_buffs_I, 9, int)}
	     || V1_buffs_I <- V1_buffs]
	  end,
      current_wave => proto_lib:convert_data(Data, 6, int),
      total_wave => proto_lib:convert_data(Data, 7, int),
      target_role_name =>
	  proto_lib:convert_data(Data, 8, str),
      actor_role_name => proto_lib:convert_data(Data, 9, str),
      halo_list =>
	  begin
	    V1_halo_list = proto_lib:convert_data(Data, 10, list),
	    [#{group =>
		   proto_lib:convert_data(V1_halo_list_I, 1, int),
	       type => proto_lib:convert_data(V1_halo_list_I, 2, int)}
	     || V1_halo_list_I <- V1_halo_list]
	  end};
convert_data(20027, Data) ->
    #{combat_type => proto_lib:convert_data(Data, 1, int),
      formation =>
	  begin
	    V1_formation = proto_lib:convert_data(Data, 2, list),
	    [#{group =>
		   proto_lib:convert_data(V1_formation_I, 1, int),
	       formation_type =>
		   proto_lib:convert_data(V1_formation_I, 2, int),
	       formation_lev =>
		   proto_lib:convert_data(V1_formation_I, 3, int)}
	     || V1_formation_I <- V1_formation]
	  end,
      objects =>
	  begin
	    V1_objects = proto_lib:convert_data(Data, 3, list),
	    [#fight_object_p{pos =
				 proto_lib:convert_data(V1_objects_I, 1, int),
			     group =
				 proto_lib:convert_data(V1_objects_I, 2, int),
			     owner_id =
				 proto_lib:convert_data(V1_objects_I, 3, int),
			     owner_srv_id =
				 proto_lib:convert_data(V1_objects_I, 4, str),
			     object_type =
				 proto_lib:convert_data(V1_objects_I, 5, int),
			     object_id =
				 proto_lib:convert_data(V1_objects_I, 6, int),
			     object_bid =
				 proto_lib:convert_data(V1_objects_I, 7, int),
			     object_name =
				 proto_lib:convert_data(V1_objects_I, 8, str),
			     star =
				 proto_lib:convert_data(V1_objects_I, 9, int),
			     camp_type =
				 proto_lib:convert_data(V1_objects_I, 10, int),
			     sex =
				 proto_lib:convert_data(V1_objects_I, 11, int),
			     career =
				 proto_lib:convert_data(V1_objects_I, 12, int),
			     lev =
				 proto_lib:convert_data(V1_objects_I, 13, int),
			     hp = proto_lib:convert_data(V1_objects_I, 14, int),
			     hp_max =
				 proto_lib:convert_data(V1_objects_I, 15, int),
			     face_id =
				 proto_lib:convert_data(V1_objects_I, 16, int),
			     skills =
				 begin
				   V2_skills =
				       proto_lib:convert_data(V1_objects_I, 17,
							      list),
				   [#skill_p{skill_bid =
						 proto_lib:convert_data(V2_skills_I,
									1, int),
					     end_round =
						 proto_lib:convert_data(V2_skills_I,
									2, int)}
				    || V2_skills_I <- V2_skills]
				 end,
			     extra_data =
				 begin
				   V2_extra_data =
				       proto_lib:convert_data(V1_objects_I, 18,
							      list),
				   [#{extra_key =>
					  proto_lib:convert_data(V2_extra_data_I,
								 1, int),
				      extra_value =>
					  proto_lib:convert_data(V2_extra_data_I,
								 2, int)}
				    || V2_extra_data_I <- V2_extra_data]
				 end,
			     sprites =
				 begin
				   V2_sprites =
				       proto_lib:convert_data(V1_objects_I, 19,
							      list),
				   [#{pos =>
					  proto_lib:convert_data(V2_sprites_I,
								 1, int),
				      item_bid =>
					  proto_lib:convert_data(V2_sprites_I,
								 2, int)}
				    || V2_sprites_I <- V2_sprites]
				 end}
	     || V1_objects_I <- V1_objects]
	  end,
      is_auto => proto_lib:convert_data(Data, 4, int),
      current_wave => proto_lib:convert_data(Data, 5, int),
      total_wave => proto_lib:convert_data(Data, 6, int),
      play_speed => proto_lib:convert_data(Data, 7, int),
      extra_args => proto_lib:convert_data(Data, 8, list),
      target_role_name =>
	  proto_lib:convert_data(Data, 9, str),
      a_object_num => proto_lib:convert_data(Data, 10, int),
      actor_role_name =>
	  proto_lib:convert_data(Data, 11, str),
      suppress => proto_lib:convert_data(Data, 12, int),
      halo_list =>
	  begin
	    V1_halo_list = proto_lib:convert_data(Data, 13, list),
	    [#{group =>
		   proto_lib:convert_data(V1_halo_list_I, 1, int),
	       type => proto_lib:convert_data(V1_halo_list_I, 2, int)}
	     || V1_halo_list_I <- V1_halo_list]
	  end,
      hallows_list =>
	  begin
	    V1_hallows_list = proto_lib:convert_data(Data, 14,
						     list),
	    [#{group =>
		   proto_lib:convert_data(V1_hallows_list_I, 1, int),
	       val =>
		   proto_lib:convert_data(V1_hallows_list_I, 2, int),
	       max =>
		   proto_lib:convert_data(V1_hallows_list_I, 3, int)}
	     || V1_hallows_list_I <- V1_hallows_list]
	  end,
      string_ext_args =>
	  proto_lib:convert_data(Data, 15, list)};
convert_data(_Code, Data) -> Data.


