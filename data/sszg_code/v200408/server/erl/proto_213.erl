-file("src/proto/proto_213.erl", 1).

-module(proto_213).

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
		{m_guild_dun,
		 [var, formation_list, dps_list, first_list]},
		{guild_dun_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time, look_id,
		  face_update_time, face_file]},
		{guild_dun_rank_boss, [var, boss_id, list]},
		{guild_dun_rank_guild,
		 [var, rank, gid, name, r_name, max_id, time, day_dps,
		  leader_id]},
		{guild_dun_box, [var, boss_id, award_list]},
		{guild_dun,
		 [var, id, f_id, max_id, boss_list, box_award, rank_list,
		  unit_hp, buff_lev, buff_end_time, day_dps,
		  assemble_time]},
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

-file("src/proto/proto_213.erl", 16).

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

-file("src/proto/proto_213.erl", 17).

-file("inc/guild_dun.hrl", 1).

-record(guild_dun,
	{var = 2, id = {0, <<>>}, f_id = 0, max_id = 0,
	 boss_list = [], box_award = [], rank_list = [],
	 unit_hp = [], buff_lev = 0, buff_end_time = 0,
	 day_dps = 0, assemble_time = 0}).

-record(guild_dun_box,
	{var = 1, boss_id = 0, award_list = []}).

-record(guild_dun_rank_guild,
	{var = 1, rank = 0, gid = {0, <<>>}, name = <<>>,
	 r_name = <<>>, max_id = 0, time = 0, day_dps = 0,
	 leader_id = {0, <<>>}}).

-record(guild_dun_rank_boss, {var = 1, boss_id, list}).

-record(guild_dun_rank_role,
	{var = 3, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0,
	 look_id = 0  :: pos_integer(), face_update_time = 0,
	 face_file = <<>>}).

-record(m_guild_dun,
	{var = 2, formation_list = [], dps_list = [],
	 first_list = []}).

-file("src/proto/proto_213.erl", 18).

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

-file("src/proto/proto_213.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(21300, cli, {}) -> {ok, <<2:32, 21300:16>>};
pack(21300, srv,
     {V0_fid, V0_max_id, V0_count, V0_buy_count, V0_info,
      V0_combat_info, V0_buff_lev, V0_buff_end_time,
      V0_ref_time, V0_worship, V0_coldtime}) ->
    D_a_t_a = <<V0_fid:32, V0_max_id:32, V0_count:32,
		V0_buy_count:16, (length(V0_info)):16,
		(list_to_binary([<<V1_boss_id:32, V1_hp:32>>
				 || {V1_boss_id, V1_hp} <- V0_info]))/binary,
		(length(V0_combat_info)):16,
		(list_to_binary([<<V1_boss_id:32, V1_dps:32>>
				 || {V1_boss_id, V1_dps}
					<- V0_combat_info]))/binary,
		V0_buff_lev:16, V0_buff_end_time:32, V0_ref_time:32,
		V0_worship:32, V0_coldtime:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21300:16,
       D_a_t_a/binary>>};
pack(21303, cli, {}) -> {ok, <<2:32, 21303:16>>};
pack(21303, srv, {V0_box_list}) ->
    D_a_t_a = <<(length(V0_box_list)):16,
		(list_to_binary([<<V1_fid:32, V1_num:32>>
				 || {V1_fid, V1_num} <- V0_box_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21303:16,
       D_a_t_a/binary>>};
pack(21304, cli, {V0_fid}) ->
    D_a_t_a = <<V0_fid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21304:16,
       D_a_t_a/binary>>};
pack(21304, srv, {V0_code, V0_msg, V0_fid, V0_num}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_fid:32,
		V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21304:16,
       D_a_t_a/binary>>};
pack(21305, cli, {}) -> {ok, <<2:32, 21305:16>>};
pack(21305, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21305:16,
       D_a_t_a/binary>>};
pack(21308, cli,
     {V0_boss_id, V0_formation_type, V0_pos_info,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_boss_id:32, V0_formation_type:16,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || #formation_pos{pos = V1_pos, id = V1_id}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21308:16,
       D_a_t_a/binary>>};
pack(21308, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21308:16,
       D_a_t_a/binary>>};
pack(21309, srv,
     {V0_bossid, V0_all_dps, V0_best_partner, V0_award_list,
      V0_target_role_name, V0_hurt_statistics}) ->
    D_a_t_a = <<V0_bossid:32, V0_all_dps:32,
		V0_best_partner:32, (length(V0_award_list)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_award_list]))/binary,
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
     <<(byte_size(D_a_t_a) + 2):32, 21309:16,
       D_a_t_a/binary>>};
pack(21312, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21312:16,
       D_a_t_a/binary>>};
pack(21312, srv,
     {V0_code, V0_msg, V0_count, V0_buy_count, V0_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:16,
		V0_buy_count:16, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21312:16,
       D_a_t_a/binary>>};
pack(21317, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21317:16,
       D_a_t_a/binary>>};
pack(21317, srv,
     {V0_code, V0_msg, V0_do_count, V0_all_dps,
      V0_best_partner, V0_award_list, V0_target_role_name,
      V0_hurt_statistics}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_do_count:32,
		V0_all_dps:32, V0_best_partner:32,
		(length(V0_award_list)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_award_list]))/binary,
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
     <<(byte_size(D_a_t_a) + 2):32, 21317:16,
       D_a_t_a/binary>>};
pack(21318, cli, {}) -> {ok, <<2:32, 21318:16>>};
pack(21318, srv,
     {V0_my_name, V0_my_rank, V0_my_max_id, V0_my_dps,
      {V0_r_rid, V0_r_srvid}, V0_r_name, V0_face_id, V0_lev,
      V0_power, V0_avatar_bid, V0_rank_guild}) ->
    D_a_t_a = <<(protocol:pack(string, V0_my_name))/binary,
		V0_my_rank:32, V0_my_max_id:8, V0_my_dps:32,
		V0_r_rid:32, (protocol:pack(string, V0_r_srvid))/binary,
		(protocol:pack(string, V0_r_name))/binary,
		V0_face_id:32, V0_lev:32, V0_power:32, V0_avatar_bid:32,
		(length(V0_rank_guild)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_name))/binary,
				   V1_rank:8,
				   (protocol:pack(string, V1_r_name))/binary,
				   V1_max_id:32, V1_day_dps:32>>
				 || #guild_dun_rank_guild{name = V1_name,
							  rank = V1_rank,
							  r_name = V1_r_name,
							  max_id = V1_max_id,
							  day_dps = V1_day_dps}
					<- V0_rank_guild]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21318:16,
       D_a_t_a/binary>>};
pack(21319, cli,
     {V0_boss_id, V0_start_num, V0_end_num}) ->
    D_a_t_a = <<V0_boss_id:32, V0_start_num:32,
		V0_end_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21319:16,
       D_a_t_a/binary>>};
pack(21319, srv,
     {V0_rank, V0_mydps, V0_worship, V0_day_worship,
      V0_rank_list}) ->
    D_a_t_a = <<V0_rank:32, V0_mydps:32, V0_worship:32,
		V0_day_worship:32, (length(V0_rank_list)):16,
		(list_to_binary([<<V1_rank:32, V1_r_rid:32,
				   (protocol:pack(string, V1_r_srvid))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string,
						  V1_family_name))/binary,
				   V1_all_dps:32, V1_face_id:32, V1_lev:32,
				   V1_power:32, V1_avatar_bid:32, V1_look_id:32,
				   V1_face_update_time:32,
				   (protocol:pack(string, V1_face_file))/binary,
				   V1_worship:32, V1_worship_status:8>>
				 || {#guild_dun_rank_role{rank = V1_rank,
							  r_id =
							      {V1_r_rid,
							       V1_r_srvid},
							  name = V1_name,
							  family_name =
							      V1_family_name,
							  all_dps = V1_all_dps,
							  face_id = V1_face_id,
							  lev = V1_lev,
							  power = V1_power,
							  avatar_bid =
							      V1_avatar_bid,
							  look_id = V1_look_id,
							  face_update_time =
							      V1_face_update_time,
							  face_file =
							      V1_face_file},
				     V1_worship, V1_worship_status}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21319:16,
       D_a_t_a/binary>>};
pack(21320, cli, {}) -> {ok, <<2:32, 21320:16>>};
pack(21320, srv, {V0_award_list}) ->
    D_a_t_a = <<(length(V0_award_list)):16,
		(list_to_binary([<<V1_fid:32, V1_status:8>>
				 || {V1_fid, V1_status}
					<- V0_award_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21320:16,
       D_a_t_a/binary>>};
pack(21321, cli, {V0_fid}) ->
    D_a_t_a = <<V0_fid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21321:16,
       D_a_t_a/binary>>};
pack(21321, srv, {V0_fid, V0_code, V0_msg}) ->
    D_a_t_a = <<V0_fid:32, V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21321:16,
       D_a_t_a/binary>>};
pack(21322, cli, {}) -> {ok, <<2:32, 21322:16>>};
pack(21322, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21322:16,
       D_a_t_a/binary>>};
pack(21323, cli, {}) -> {ok, <<2:32, 21323:16>>};
pack(21323, srv, {V0_code, V0_msg, V0_coldtime}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_coldtime:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21323:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(21300, srv, _B0) -> {ok, {}};
unpack(21300, cli, _B0) ->
    {V1_fid, _B1} = protocol:uint32(_B0),
    {V1_max_id, _B2} = protocol:uint32(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {V1_buy_count, _B4} = protocol:uint16(_B3),
    {V1_info, _B9} = protocol:array(_B4,
				    fun (_B5) ->
					    {V2_boss_id, _B6} =
						protocol:uint32(_B5),
					    {V2_hp, _B7} = protocol:uint32(_B6),
					    {{V2_boss_id, V2_hp}, _B7}
				    end),
    {V1_combat_info, _B14} = protocol:array(_B9,
					    fun (_B10) ->
						    {V2_boss_id, _B11} =
							protocol:uint32(_B10),
						    {V2_dps, _B12} =
							protocol:uint32(_B11),
						    {{V2_boss_id, V2_dps}, _B12}
					    end),
    {V1_buff_lev, _B15} = protocol:uint16(_B14),
    {V1_buff_end_time, _B16} = protocol:uint32(_B15),
    {V1_ref_time, _B17} = protocol:uint32(_B16),
    {V1_worship, _B18} = protocol:uint32(_B17),
    {V1_coldtime, _B19} = protocol:uint32(_B18),
    {ok,
     {V1_fid, V1_max_id, V1_count, V1_buy_count, V1_info,
      V1_combat_info, V1_buff_lev, V1_buff_end_time,
      V1_ref_time, V1_worship, V1_coldtime}};
unpack(21303, srv, _B0) -> {ok, {}};
unpack(21303, cli, _B0) ->
    {V1_box_list, _B5} = protocol:array(_B0,
					fun (_B1) ->
						{V2_fid, _B2} =
						    protocol:uint32(_B1),
						{V2_num, _B3} =
						    protocol:uint32(_B2),
						{{V2_fid, V2_num}, _B3}
					end),
    {ok, {V1_box_list}};
unpack(21304, srv, _B0) ->
    {V1_fid, _B1} = protocol:uint32(_B0), {ok, {V1_fid}};
unpack(21304, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_fid, _B3} = protocol:uint32(_B2),
    {V1_num, _B4} = protocol:uint32(_B3),
    {ok, {V1_code, V1_msg, V1_fid, V1_num}};
unpack(21305, srv, _B0) -> {ok, {}};
unpack(21305, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21308, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
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
     {V1_boss_id, V1_formation_type, V1_pos_info,
      V1_hallows_id}};
unpack(21308, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21309, cli, _B0) ->
    {V1_bossid, _B1} = protocol:uint32(_B0),
    {V1_all_dps, _B2} = protocol:uint32(_B1),
    {V1_best_partner, _B3} = protocol:uint32(_B2),
    {V1_award_list, _B8} = protocol:array(_B3,
					  fun (_B4) ->
						  {V2_bid, _B5} =
						      protocol:uint32(_B4),
						  {V2_num, _B6} =
						      protocol:uint32(_B5),
						  {{V2_bid, V2_num}, _B6}
					  end),
    {V1_target_role_name, _B9} = protocol:string(_B8),
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
     {V1_bossid, V1_all_dps, V1_best_partner, V1_award_list,
      V1_target_role_name, V1_hurt_statistics}};
unpack(21312, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(21312, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint16(_B2),
    {V1_buy_count, _B4} = protocol:uint16(_B3),
    {V1_type, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_code, V1_msg, V1_count, V1_buy_count, V1_type}};
unpack(21317, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(21317, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_do_count, _B3} = protocol:uint32(_B2),
    {V1_all_dps, _B4} = protocol:uint32(_B3),
    {V1_best_partner, _B5} = protocol:uint32(_B4),
    {V1_award_list, _B10} = protocol:array(_B5,
					   fun (_B6) ->
						   {V2_bid, _B7} =
						       protocol:uint32(_B6),
						   {V2_num, _B8} =
						       protocol:uint32(_B7),
						   {{V2_bid, V2_num}, _B8}
					   end),
    {V1_target_role_name, _B11} = protocol:string(_B10),
    {V1_hurt_statistics, _B33} = protocol:array(_B11,
						fun (_B12) ->
							{V2_type, _B13} =
							    protocol:uint8(_B12),
							{V2_partner_hurts,
							 _B31} =
							    protocol:array(_B13,
									   fun
									     (_B14) ->
										 {V3_rid,
										  _B15} =
										     protocol:uint32(_B14),
										 {V3_srvid,
										  _B16} =
										     protocol:string(_B15),
										 {V3_id,
										  _B17} =
										     protocol:uint32(_B16),
										 {V3_bid,
										  _B18} =
										     protocol:uint32(_B17),
										 {V3_star,
										  _B19} =
										     protocol:uint32(_B18),
										 {V3_lev,
										  _B20} =
										     protocol:uint32(_B19),
										 {V3_camp_type,
										  _B21} =
										     protocol:uint32(_B20),
										 {V3_dps,
										  _B22} =
										     protocol:uint32(_B21),
										 {V3_cure,
										  _B23} =
										     protocol:uint32(_B22),
										 {V3_ext_data,
										  _B28} =
										     protocol:array(_B23,
												    fun
												      (_B24) ->
													  {V4_key,
													   _B25} =
													      protocol:uint32(_B24),
													  {V4_val,
													   _B26} =
													      protocol:uint32(_B25),
													  {{V4_key,
													    V4_val},
													   _B26}
												    end),
										 {V3_be_hurt,
										  _B29} =
										     protocol:uint32(_B28),
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
										  _B29}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B31}
						end),
    {ok,
     {V1_code, V1_msg, V1_do_count, V1_all_dps,
      V1_best_partner, V1_award_list, V1_target_role_name,
      V1_hurt_statistics}};
unpack(21318, srv, _B0) -> {ok, {}};
unpack(21318, cli, _B0) ->
    {V1_my_name, _B1} = protocol:string(_B0),
    {V1_my_rank, _B2} = protocol:uint32(_B1),
    {V1_my_max_id, _B3} = protocol:uint8(_B2),
    {V1_my_dps, _B4} = protocol:uint32(_B3),
    {V1_r_rid, _B5} = protocol:uint32(_B4),
    {V1_r_srvid, _B6} = protocol:string(_B5),
    {V1_r_name, _B7} = protocol:string(_B6),
    {V1_face_id, _B8} = protocol:uint32(_B7),
    {V1_lev, _B9} = protocol:uint32(_B8),
    {V1_power, _B10} = protocol:uint32(_B9),
    {V1_avatar_bid, _B11} = protocol:uint32(_B10),
    {V1_rank_guild, _B19} = protocol:array(_B11,
					   fun (_B12) ->
						   {V2_name, _B13} =
						       protocol:string(_B12),
						   {V2_rank, _B14} =
						       protocol:uint8(_B13),
						   {V2_r_name, _B15} =
						       protocol:string(_B14),
						   {V2_max_id, _B16} =
						       protocol:uint32(_B15),
						   {V2_day_dps, _B17} =
						       protocol:uint32(_B16),
						   {{V2_name, V2_rank,
						     V2_r_name, V2_max_id,
						     V2_day_dps},
						    _B17}
					   end),
    {ok,
     {V1_my_name, V1_my_rank, V1_my_max_id, V1_my_dps,
      V1_r_rid, V1_r_srvid, V1_r_name, V1_face_id, V1_lev,
      V1_power, V1_avatar_bid, V1_rank_guild}};
unpack(21319, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {V1_start_num, _B2} = protocol:uint32(_B1),
    {V1_end_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_boss_id, V1_start_num, V1_end_num}};
unpack(21319, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint32(_B0),
    {V1_mydps, _B2} = protocol:uint32(_B1),
    {V1_worship, _B3} = protocol:uint32(_B2),
    {V1_day_worship, _B4} = protocol:uint32(_B3),
    {V1_rank_list, _B22} = protocol:array(_B4,
					  fun (_B5) ->
						  {V2_rank, _B6} =
						      protocol:uint32(_B5),
						  {V2_r_rid, _B7} =
						      protocol:uint32(_B6),
						  {V2_r_srvid, _B8} =
						      protocol:string(_B7),
						  {V2_name, _B9} =
						      protocol:string(_B8),
						  {V2_family_name, _B10} =
						      protocol:string(_B9),
						  {V2_all_dps, _B11} =
						      protocol:uint32(_B10),
						  {V2_face_id, _B12} =
						      protocol:uint32(_B11),
						  {V2_lev, _B13} =
						      protocol:uint32(_B12),
						  {V2_power, _B14} =
						      protocol:uint32(_B13),
						  {V2_avatar_bid, _B15} =
						      protocol:uint32(_B14),
						  {V2_look_id, _B16} =
						      protocol:uint32(_B15),
						  {V2_face_update_time, _B17} =
						      protocol:uint32(_B16),
						  {V2_face_file, _B18} =
						      protocol:string(_B17),
						  {V2_worship, _B19} =
						      protocol:uint32(_B18),
						  {V2_worship_status, _B20} =
						      protocol:uint8(_B19),
						  {{V2_rank, V2_r_rid,
						    V2_r_srvid, V2_name,
						    V2_family_name, V2_all_dps,
						    V2_face_id, V2_lev,
						    V2_power, V2_avatar_bid,
						    V2_look_id,
						    V2_face_update_time,
						    V2_face_file, V2_worship,
						    V2_worship_status},
						   _B20}
					  end),
    {ok,
     {V1_rank, V1_mydps, V1_worship, V1_day_worship,
      V1_rank_list}};
unpack(21320, srv, _B0) -> {ok, {}};
unpack(21320, cli, _B0) ->
    {V1_award_list, _B5} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_fid, _B2} =
						      protocol:uint32(_B1),
						  {V2_status, _B3} =
						      protocol:uint8(_B2),
						  {{V2_fid, V2_status}, _B3}
					  end),
    {ok, {V1_award_list}};
unpack(21321, srv, _B0) ->
    {V1_fid, _B1} = protocol:uint32(_B0), {ok, {V1_fid}};
unpack(21321, cli, _B0) ->
    {V1_fid, _B1} = protocol:uint32(_B0),
    {V1_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_fid, V1_code, V1_msg}};
unpack(21322, srv, _B0) -> {ok, {}};
unpack(21322, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(21323, srv, _B0) -> {ok, {}};
unpack(21323, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_coldtime, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_coldtime}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


