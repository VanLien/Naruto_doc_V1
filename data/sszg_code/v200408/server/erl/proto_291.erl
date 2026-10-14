-file("src/proto/proto_291.erl", 1).

-module(proto_291).

-lager_records([{holiday_practise_tower_rank,
		 [ver, platform_zone, camp_id, rank_list, old_rank_list,
		  ext]},
		{practise_role_rank,
		 [ver, id, lev, face_id, avatar_bid, name, val, unixtime,
		  power, rank, video_id, face_update_time, face_file,
		  ext]},
		{m_holiday_practise_tower,
		 [ver, camp_id, id, times, last_buy_times,
		  last_anew_times, update_unixtime, hp_radio, is_combat,
		  is_recombat, save_list, ext]},
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
		  res_p, dam_s, res_s, tenacity]},
		{formation_attr_data,
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
		 [ver, list, use_lineup, all_lineups, sys_formations]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

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

-file("src/proto/proto_291.erl", 16).

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

-file("src/proto/proto_291.erl", 17).

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

-file("src/proto/proto_291.erl", 18).

-file("inc/holiday_practise_tower.hrl", 1).

-record(m_holiday_practise_tower,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), id = 0  :: pos_integer(),
	 times = 0  :: pos_integer(),
	 last_buy_times = 0  :: pos_integer(),
	 last_anew_times = 0  :: pos_integer(),
	 update_unixtime = 0  :: pos_integer(),
	 hp_radio = []  :: list(),
	 is_combat = {0, []}  :: tuple(),
	 is_recombat = 0  :: list(), save_list = []  :: list(),
	 ext = []  :: list()}).

-record(practise_role_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), val = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 power = 0  :: pos_integer(), rank = 0  :: pos_integer(),
	 video_id = 0  :: pos_integer(),
	 face_update_time = 0  :: pos_integer(),
	 face_file = <<>>  :: string(), ext = []  :: list()}).

-record(holiday_practise_tower_rank,
	{ver = 1  :: pos_integer(),
	 platform_zone = {<<>>, 0}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 rank_list = []  :: list(),
	 old_rank_list = []  :: list(), ext = []  :: list()}).

-file("src/proto/proto_291.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(29100, cli, {}) -> {ok, <<2:32, 29100:16>>};
pack(29100, srv,
     {V0_flag, V0_id, V0_time, V0_last_buy_time, V0_radio,
      V0_last_unixtime, V0_practise_role_rank, V0_role_rank,
      V0_is_recombat}) ->
    D_a_t_a = <<V0_flag:8, V0_id:32, V0_time:32,
		V0_last_buy_time:32, V0_radio:8, V0_last_unixtime:32,
		(length(V0_practise_role_rank)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_lev:32, V1_face_id:32, V1_avatar_bid:32,
				   (protocol:pack(string, V1_name))/binary,
				   V1_val:32, V1_unixtime:32, V1_power:32,
				   V1_rank:32, V1_video_id:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #practise_role_rank{id =
							    {V1_rid, V1_srv_id},
							lev = V1_lev,
							face_id = V1_face_id,
							avatar_bid =
							    V1_avatar_bid,
							name = V1_name,
							val = V1_val,
							unixtime = V1_unixtime,
							power = V1_power,
							rank = V1_rank,
							video_id = V1_video_id,
							face_update_time =
							    V1_face_update_time,
							face_file =
							    V1_face_file}
					<- V0_practise_role_rank]))/binary,
		V0_role_rank:32, V0_is_recombat:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29100:16,
       D_a_t_a/binary>>};
pack(29101, cli,
     {V0_id, V0_formation_type, V0_pos_info,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_id:32, V0_formation_type:16,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || #formation_pos{pos = V1_pos, id = V1_id}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29101:16,
       D_a_t_a/binary>>};
pack(29101, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29101:16,
       D_a_t_a/binary>>};
pack(29102, cli, {}) -> {ok, <<2:32, 29102:16>>};
pack(29102, srv,
     {V0_flag, V0_all_dps, V0_best_partner, V0_bid, V0_lev,
      V0_star, V0_use_skin, V0_target_role_name,
      V0_hurt_statistics, V0_reward, V0_last_anew_times,
      V0_number}) ->
    D_a_t_a = <<V0_flag:8, V0_all_dps:32,
		V0_best_partner:32, V0_bid:32, V0_lev:16, V0_star:8,
		V0_use_skin:32,
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
		(length(V0_reward)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num} <- V0_reward]))/binary,
		V0_last_anew_times:32, V0_number:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29102:16,
       D_a_t_a/binary>>};
pack(29103, cli, {}) -> {ok, <<2:32, 29103:16>>};
pack(29103, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29103:16,
       D_a_t_a/binary>>};
pack(29104, cli, {}) -> {ok, <<2:32, 29104:16>>};
pack(29104, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29104:16,
       D_a_t_a/binary>>};
pack(29105, cli, {}) -> {ok, <<2:32, 29105:16>>};
pack(29105, srv,
     {V0_flag, V0_practise_role_rank, V0_role_rank,
      V0_role_val, V0_role_unixtime, V0_role_video_id}) ->
    D_a_t_a = <<V0_flag:8,
		(length(V0_practise_role_rank)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_lev:32, V1_face_id:32, V1_avatar_bid:32,
				   (protocol:pack(string, V1_name))/binary,
				   V1_val:32, V1_unixtime:32, V1_power:32,
				   V1_rank:32, V1_video_id:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #practise_role_rank{id =
							    {V1_rid, V1_srv_id},
							lev = V1_lev,
							face_id = V1_face_id,
							avatar_bid =
							    V1_avatar_bid,
							name = V1_name,
							val = V1_val,
							unixtime = V1_unixtime,
							power = V1_power,
							rank = V1_rank,
							video_id = V1_video_id,
							face_update_time =
							    V1_face_update_time,
							face_file =
							    V1_face_file}
					<- V0_practise_role_rank]))/binary,
		V0_role_rank:32, V0_role_val:32, V0_role_unixtime:32,
		V0_role_video_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29105:16,
       D_a_t_a/binary>>};
pack(29106, cli, {}) -> {ok, <<2:32, 29106:16>>};
pack(29106, srv, {V0_role_rank}) ->
    D_a_t_a = <<V0_role_rank:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29106:16,
       D_a_t_a/binary>>};
pack(29107, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29107:16,
       D_a_t_a/binary>>};
pack(29107, srv, {}) -> {ok, <<2:32, 29107:16>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(29100, srv, _B0) -> {ok, {}};
unpack(29100, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_time, _B3} = protocol:uint32(_B2),
    {V1_last_buy_time, _B4} = protocol:uint32(_B3),
    {V1_radio, _B5} = protocol:uint8(_B4),
    {V1_last_unixtime, _B6} = protocol:uint32(_B5),
    {V1_practise_role_rank, _B22} = protocol:array(_B6,
						   fun (_B7) ->
							   {V2_rid, _B8} =
							       protocol:uint32(_B7),
							   {V2_srv_id, _B9} =
							       protocol:string(_B8),
							   {V2_lev, _B10} =
							       protocol:uint32(_B9),
							   {V2_face_id, _B11} =
							       protocol:uint32(_B10),
							   {V2_avatar_bid,
							    _B12} =
							       protocol:uint32(_B11),
							   {V2_name, _B13} =
							       protocol:string(_B12),
							   {V2_val, _B14} =
							       protocol:uint32(_B13),
							   {V2_unixtime, _B15} =
							       protocol:uint32(_B14),
							   {V2_power, _B16} =
							       protocol:uint32(_B15),
							   {V2_rank, _B17} =
							       protocol:uint32(_B16),
							   {V2_video_id, _B18} =
							       protocol:uint32(_B17),
							   {V2_face_update_time,
							    _B19} =
							       protocol:uint32(_B18),
							   {V2_face_file,
							    _B20} =
							       protocol:string(_B19),
							   {{V2_rid, V2_srv_id,
							     V2_lev, V2_face_id,
							     V2_avatar_bid,
							     V2_name, V2_val,
							     V2_unixtime,
							     V2_power, V2_rank,
							     V2_video_id,
							     V2_face_update_time,
							     V2_face_file},
							    _B20}
						   end),
    {V1_role_rank, _B23} = protocol:uint32(_B22),
    {V1_is_recombat, _B24} = protocol:uint8(_B23),
    {ok,
     {V1_flag, V1_id, V1_time, V1_last_buy_time, V1_radio,
      V1_last_unixtime, V1_practise_role_rank, V1_role_rank,
      V1_is_recombat}};
unpack(29101, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_formation_type, _B2} = protocol:uint16(_B1),
    {V1_pos_info, _B7} = protocol:array(_B2,
					fun (_B3) ->
						{V2_pos, _B4} =
						    protocol:uint8(_B3),
						{V2_id, _B5} =
						    protocol:uint32(_B4),
						{{V2_pos, V2_id}, _B5}
					end),
    {V1_hallows_id, _B8} = protocol:uint32(_B7),
    {ok,
     {V1_id, V1_formation_type, V1_pos_info, V1_hallows_id}};
unpack(29101, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(29102, srv, _B0) -> {ok, {}};
unpack(29102, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_all_dps, _B2} = protocol:uint32(_B1),
    {V1_best_partner, _B3} = protocol:uint32(_B2),
    {V1_bid, _B4} = protocol:uint32(_B3),
    {V1_lev, _B5} = protocol:uint16(_B4),
    {V1_star, _B6} = protocol:uint8(_B5),
    {V1_use_skin, _B7} = protocol:uint32(_B6),
    {V1_target_role_name, _B8} = protocol:string(_B7),
    {V1_hurt_statistics, _B30} = protocol:array(_B8,
						fun (_B9) ->
							{V2_type, _B10} =
							    protocol:uint8(_B9),
							{V2_partner_hurts,
							 _B28} =
							    protocol:array(_B10,
									   fun
									     (_B11) ->
										 {V3_rid,
										  _B12} =
										     protocol:uint32(_B11),
										 {V3_srvid,
										  _B13} =
										     protocol:string(_B12),
										 {V3_id,
										  _B14} =
										     protocol:uint32(_B13),
										 {V3_bid,
										  _B15} =
										     protocol:uint32(_B14),
										 {V3_star,
										  _B16} =
										     protocol:uint32(_B15),
										 {V3_lev,
										  _B17} =
										     protocol:uint32(_B16),
										 {V3_camp_type,
										  _B18} =
										     protocol:uint32(_B17),
										 {V3_dps,
										  _B19} =
										     protocol:uint32(_B18),
										 {V3_cure,
										  _B20} =
										     protocol:uint32(_B19),
										 {V3_ext_data,
										  _B25} =
										     protocol:array(_B20,
												    fun
												      (_B21) ->
													  {V4_key,
													   _B22} =
													      protocol:uint32(_B21),
													  {V4_val,
													   _B23} =
													      protocol:uint32(_B22),
													  {{V4_key,
													    V4_val},
													   _B23}
												    end),
										 {V3_be_hurt,
										  _B26} =
										     protocol:uint32(_B25),
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
										  _B26}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B28}
						end),
    {V1_reward, _B35} = protocol:array(_B30,
				       fun (_B31) ->
					       {V2_base_id, _B32} =
						   protocol:uint32(_B31),
					       {V2_num, _B33} =
						   protocol:uint32(_B32),
					       {{V2_base_id, V2_num}, _B33}
				       end),
    {V1_last_anew_times, _B36} = protocol:uint32(_B35),
    {V1_number, _B37} = protocol:uint32(_B36),
    {ok,
     {V1_flag, V1_all_dps, V1_best_partner, V1_bid, V1_lev,
      V1_star, V1_use_skin, V1_target_role_name,
      V1_hurt_statistics, V1_reward, V1_last_anew_times,
      V1_number}};
unpack(29103, srv, _B0) -> {ok, {}};
unpack(29103, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(29104, srv, _B0) -> {ok, {}};
unpack(29104, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(29105, srv, _B0) -> {ok, {}};
unpack(29105, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_practise_role_rank, _B17} = protocol:array(_B1,
						   fun (_B2) ->
							   {V2_rid, _B3} =
							       protocol:uint32(_B2),
							   {V2_srv_id, _B4} =
							       protocol:string(_B3),
							   {V2_lev, _B5} =
							       protocol:uint32(_B4),
							   {V2_face_id, _B6} =
							       protocol:uint32(_B5),
							   {V2_avatar_bid,
							    _B7} =
							       protocol:uint32(_B6),
							   {V2_name, _B8} =
							       protocol:string(_B7),
							   {V2_val, _B9} =
							       protocol:uint32(_B8),
							   {V2_unixtime, _B10} =
							       protocol:uint32(_B9),
							   {V2_power, _B11} =
							       protocol:uint32(_B10),
							   {V2_rank, _B12} =
							       protocol:uint32(_B11),
							   {V2_video_id, _B13} =
							       protocol:uint32(_B12),
							   {V2_face_update_time,
							    _B14} =
							       protocol:uint32(_B13),
							   {V2_face_file,
							    _B15} =
							       protocol:string(_B14),
							   {{V2_rid, V2_srv_id,
							     V2_lev, V2_face_id,
							     V2_avatar_bid,
							     V2_name, V2_val,
							     V2_unixtime,
							     V2_power, V2_rank,
							     V2_video_id,
							     V2_face_update_time,
							     V2_face_file},
							    _B15}
						   end),
    {V1_role_rank, _B18} = protocol:uint32(_B17),
    {V1_role_val, _B19} = protocol:uint32(_B18),
    {V1_role_unixtime, _B20} = protocol:uint32(_B19),
    {V1_role_video_id, _B21} = protocol:uint32(_B20),
    {ok,
     {V1_flag, V1_practise_role_rank, V1_role_rank,
      V1_role_val, V1_role_unixtime, V1_role_video_id}};
unpack(29106, srv, _B0) -> {ok, {}};
unpack(29106, cli, _B0) ->
    {V1_role_rank, _B1} = protocol:uint32(_B0),
    {ok, {V1_role_rank}};
unpack(29107, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(29107, cli, _B0) -> {ok, {}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


