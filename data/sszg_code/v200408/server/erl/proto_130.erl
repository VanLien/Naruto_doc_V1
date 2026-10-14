-file("src/proto/proto_130.erl", 1).

-module(proto_130).

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
		{dungeon_replay, [dun_id, replays]},
		{dungeon_replay_log,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{dungeon_data,
		 [id, name, chapter_id, mode, next_id, unit_id, items,
		  drop_ids, hook_unit_id, hook_items, hook_drop_ids,
		  hook_lev_add, time, is_big, energy_max, auto_items,
		  power, lev_limit, floor]},
		{dungeon, [id, status, cool_time, auto_num]},
		{dun_chapter, [id, status, list]},
		{m_dungeon,
		 [ver, mode, chapter_id, dun_id, max_dun_id,
		  last_hook_time, list, drop_idx, ext_reward, buff_list,
		  fast_combat_add_time, auto_combat_id, auto_combat_num,
		  auto_combat_items, chapter_awrads, is_first,
		  acc_hook_time, acc_hook_items]},
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

-file("src/proto/proto_130.erl", 16).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
	{ver = 6, mode = 1, chapter_id = 0, dun_id = 0,
	 max_dun_id = 0, last_hook_time = 0, list = [],
	 drop_idx = 0, ext_reward = [], buff_list = [],
	 fast_combat_add_time = 0, auto_combat_id = 0,
	 auto_combat_num = 0, auto_combat_items = [],
	 chapter_awrads = [], is_first = 1, acc_hook_time = 0,
	 acc_hook_items = []}).

-record(dun_chapter, {id = 0, status = 0, list = []}).

-record(dungeon,
	{id = 0, status = 0, cool_time = 0, auto_num = 0}).

-record(dungeon_data,
	{id = 0, name = <<>>, chapter_id = 0, mode = 1,
	 next_id = 0, unit_id = 0, items = [], drop_ids = [],
	 hook_unit_id = 0, hook_items = [], hook_drop_ids = [],
	 hook_lev_add = [], time = 0, is_big = 0, energy_max = 0,
	 auto_items = [], power = 0, lev_limit = 0, floor = 0}).

-record(dungeon_replay_log,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(dungeon_replay,
	{dun_id = 0  :: non_neg_integer(),
	 replays = []  :: [#dungeon_replay_log{}]}).

-file("src/proto/proto_130.erl", 17).

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

-file("src/proto/proto_130.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(13000, cli, {}) -> {ok, <<2:32, 13000:16>>};
pack(13000, srv,
     {V0_mode, V0_chapter_id, V0_dun_id, V0_status,
      V0_is_first, V0_cool_time, V0_max_dun_id, V0_auto_num,
      V0_auto_num_max, V0_mode_list}) ->
    D_a_t_a = <<V0_mode:8, V0_chapter_id:8, V0_dun_id:32,
		V0_status:8, V0_is_first:8, V0_cool_time:32,
		V0_max_dun_id:32, V0_auto_num:8, V0_auto_num_max:8,
		(length(V0_mode_list)):16,
		(list_to_binary([<<V1_mode:8,
				   (length(V1_chapter_list)):16,
				   (list_to_binary([<<V2_chapter_id:8,
						      V2_status:8,
						      (length(V2_dun_list)):16,
						      (list_to_binary([<<V3_dun_id:32,
									 V3_status:8,
									 V3_cool_time:32,
									 V3_auto_num:8>>
								       || {V3_dun_id,
									   V3_status,
									   V3_cool_time,
									   V3_auto_num}
									      <- V2_dun_list]))/binary>>
						    || {V2_chapter_id,
							V2_status, V2_dun_list}
							   <- V1_chapter_list]))/binary>>
				 || {V1_mode, V1_chapter_list}
					<- V0_mode_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13000:16,
       D_a_t_a/binary>>};
pack(13001, srv,
     {V0_mode, V0_chapter_id, V0_dun_id, V0_status,
      V0_is_first, V0_cool_time, V0_max_dun_id}) ->
    D_a_t_a = <<V0_mode:8, V0_chapter_id:8, V0_dun_id:32,
		V0_status:8, V0_is_first:8, V0_cool_time:32,
		V0_max_dun_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13001:16,
       D_a_t_a/binary>>};
pack(13002, cli, {}) -> {ok, <<2:32, 13002:16>>};
pack(13002, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13002:16,
       D_a_t_a/binary>>};
pack(13003, cli, {V0_is_auto}) ->
    D_a_t_a = <<V0_is_auto:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13003:16,
       D_a_t_a/binary>>};
pack(13003, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13003:16,
       D_a_t_a/binary>>};
pack(13004, cli, {}) -> {ok, <<2:32, 13004:16>>};
pack(13004, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13004:16,
       D_a_t_a/binary>>};
pack(13005, cli, {V0_dun_id, V0_num}) ->
    D_a_t_a = <<V0_dun_id:32, V0_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13005:16,
       D_a_t_a/binary>>};
pack(13005, srv,
     {V0_code, V0_msg, V0_dun_id, V0_num, V0_items}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_dun_id:32,
		V0_num:16, (length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13005:16,
       D_a_t_a/binary>>};
pack(13006, cli, {}) -> {ok, <<2:32, 13006:16>>};
pack(13006, srv,
     {V0_fast_combat_num, V0_fast_combat_max, V0_auto_num,
      V0_auto_num_max, V0_is_auto_combat,
      V0_fast_combat_add_time, V0_fast_combat_w_num,
      V0_fast_combat_p_num, V0_fast_combat_free_num,
      V0_is_holiday}) ->
    D_a_t_a = <<V0_fast_combat_num:8, V0_fast_combat_max:8,
		V0_auto_num:8, V0_auto_num_max:8, V0_is_auto_combat:8,
		V0_fast_combat_add_time:16, V0_fast_combat_w_num:8,
		V0_fast_combat_p_num:8, V0_fast_combat_free_num:8,
		V0_is_holiday:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13006:16,
       D_a_t_a/binary>>};
pack(13007, srv,
     {V0_type, V0_dun_id, V0_time, V0_old_lev, V0_new_lev,
      V0_items, V0_auto_start_dun_id, V0_auto_end_dun_id,
      V0_fast_add_time1, V0_fast_add_time2, V0_old_exp,
      V0_new_exp, V0_vip_buff, V0_honor_buff}) ->
    D_a_t_a = <<V0_type:8, V0_dun_id:32, V0_time:32,
		V0_old_lev:8, V0_new_lev:8, (length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_items]))/binary,
		V0_auto_start_dun_id:32, V0_auto_end_dun_id:32,
		V0_fast_add_time1:32, V0_fast_add_time2:32,
		V0_old_exp:32, V0_new_exp:32, V0_vip_buff:32,
		V0_honor_buff:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13007:16,
       D_a_t_a/binary>>};
pack(13008, cli, {}) -> {ok, <<2:32, 13008:16>>};
pack(13008, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:8>>
				 || V1_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13008:16,
       D_a_t_a/binary>>};
pack(13009, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13009:16,
       D_a_t_a/binary>>};
pack(13009, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13009:16,
       D_a_t_a/binary>>};
pack(13010, srv, {V0_dun_id, V0_chapter_id}) ->
    D_a_t_a = <<V0_dun_id:32, V0_chapter_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13010:16,
       D_a_t_a/binary>>};
pack(13011, cli, {}) -> {ok, <<2:32, 13011:16>>};
pack(13011, srv, {V0_buff_list}) ->
    D_a_t_a = <<(length(V0_buff_list)):16,
		(list_to_binary([<<V1_bid:32, V1_end_time:32>>
				 || {V1_bid, V1_end_time}
					<- V0_buff_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13011:16,
       D_a_t_a/binary>>};
pack(13012, cli, {}) -> {ok, <<2:32, 13012:16>>};
pack(13012, srv, {V0_chapter_list}) ->
    D_a_t_a = <<(length(V0_chapter_list)):16,
		(list_to_binary([<<V1_chapter_id:32,
				   (length(V1_award_list)):16,
				   (list_to_binary([<<V2_award_id:32,
						      V2_status:32>>
						    || {V2_award_id, V2_status}
							   <- V1_award_list]))/binary>>
				 || {V1_chapter_id, V1_award_list}
					<- V0_chapter_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13012:16,
       D_a_t_a/binary>>};
pack(13013, cli, {}) -> {ok, <<2:32, 13013:16>>};
pack(13013, srv, {V0_chapter_list}) ->
    D_a_t_a = <<(length(V0_chapter_list)):16,
		(list_to_binary([<<V1_chapter_id:32,
				   (length(V1_award_list)):16,
				   (list_to_binary([<<V2_award_id:32,
						      V2_status:32>>
						    || {V2_award_id, V2_status}
							   <- V1_award_list]))/binary>>
				 || {V1_chapter_id, V1_award_list}
					<- V0_chapter_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13013:16,
       D_a_t_a/binary>>};
pack(13014, cli, {V0_chapter_id, V0_award_id}) ->
    D_a_t_a = <<V0_chapter_id:32, V0_award_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13014:16,
       D_a_t_a/binary>>};
pack(13014, srv,
     {V0_code, V0_msg, V0_chapter_id, V0_award_id,
      V0_status}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_chapter_id:32, V0_award_id:32, V0_status:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13014:16,
       D_a_t_a/binary>>};
pack(13015, cli, {V0_dun_id}) ->
    D_a_t_a = <<V0_dun_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13015:16,
       D_a_t_a/binary>>};
pack(13015, srv, {V0_dungeon_replay_log}) ->
    D_a_t_a = <<(length(V0_dungeon_replay_log)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_sid))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_power:32, V1_time:32,
				   V1_repaly_id:32, V1_type:8,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #dungeon_replay_log{rid = V1_rid,
							sid = V1_sid,
							name = V1_name,
							face_id = V1_face_id,
							power = V1_power,
							time = V1_time,
							repaly_id =
							    V1_repaly_id,
							type = V1_type,
							face_update_time =
							    V1_face_update_time,
							face_file =
							    V1_face_file}
					<- V0_dungeon_replay_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13015:16,
       D_a_t_a/binary>>};
pack(13016, srv,
     {V0_result, V0_item_rewards, V0_combat_type,
      V0_partner_bid, V0_partner_hurt, V0_partner_total_hurt,
      V0_lev, V0_exp, V0_new_lev, V0_new_exp, V0_auto_num,
      V0_target_role_name, V0_hurt_statistics,
      V0_use_skin}) ->
    D_a_t_a = <<V0_result:8, (length(V0_item_rewards)):16,
		(list_to_binary([<<V1_bid:32, V1_is_bind:8, V1_num:32,
				   V1_id:32>>
				 || {V1_bid, V1_is_bind, V1_num, V1_id}
					<- V0_item_rewards]))/binary,
		V0_combat_type:16, V0_partner_bid:32,
		V0_partner_hurt:32, V0_partner_total_hurt:32, V0_lev:8,
		V0_exp:32, V0_new_lev:8, V0_new_exp:32, V0_auto_num:16,
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
		V0_use_skin:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13016:16,
       D_a_t_a/binary>>};
pack(13017, cli, {}) -> {ok, <<2:32, 13017:16>>};
pack(13017, srv, {V0_hook_time, V0_list}) ->
    D_a_t_a = <<V0_hook_time:32, (length(V0_list)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13017:16,
       D_a_t_a/binary>>};
pack(13018, cli, {}) -> {ok, <<2:32, 13018:16>>};
pack(13018, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13018:16,
       D_a_t_a/binary>>};
pack(13019, cli, {}) -> {ok, <<2:32, 13019:16>>};
pack(13019, srv, {}) -> {ok, <<2:32, 13019:16>>};
pack(13020, cli, {}) -> {ok, <<2:32, 13020:16>>};
pack(13020, srv, {V0_val}) ->
    D_a_t_a = <<V0_val:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13020:16,
       D_a_t_a/binary>>};
pack(13030, cli, {}) -> {ok, <<2:32, 13030:16>>};
pack(13030, srv, {V0_list, V0_pass_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_type:32, V1_day_num:8>>
				 || {V1_type, V1_day_num} <- V0_list]))/binary,
		(length(V0_pass_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_pass_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13030:16,
       D_a_t_a/binary>>};
pack(13031, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13031:16,
       D_a_t_a/binary>>};
pack(13031, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13031:16,
       D_a_t_a/binary>>};
pack(13032, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13032:16,
       D_a_t_a/binary>>};
pack(13032, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13032:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(13000, srv, _B0) -> {ok, {}};
unpack(13000, cli, _B0) ->
    {V1_mode, _B1} = protocol:uint8(_B0),
    {V1_chapter_id, _B2} = protocol:uint8(_B1),
    {V1_dun_id, _B3} = protocol:uint32(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {V1_is_first, _B5} = protocol:uint8(_B4),
    {V1_cool_time, _B6} = protocol:uint32(_B5),
    {V1_max_dun_id, _B7} = protocol:uint32(_B6),
    {V1_auto_num, _B8} = protocol:uint8(_B7),
    {V1_auto_num_max, _B9} = protocol:uint8(_B8),
    {V1_mode_list, _B25} = protocol:array(_B9,
					  fun (_B10) ->
						  {V2_mode, _B11} =
						      protocol:uint8(_B10),
						  {V2_chapter_list, _B23} =
						      protocol:array(_B11,
								     fun
								       (_B12) ->
									   {V3_chapter_id,
									    _B13} =
									       protocol:uint8(_B12),
									   {V3_status,
									    _B14} =
									       protocol:uint8(_B13),
									   {V3_dun_list,
									    _B21} =
									       protocol:array(_B14,
											      fun
												(_B15) ->
												    {V4_dun_id,
												     _B16} =
													protocol:uint32(_B15),
												    {V4_status,
												     _B17} =
													protocol:uint8(_B16),
												    {V4_cool_time,
												     _B18} =
													protocol:uint32(_B17),
												    {V4_auto_num,
												     _B19} =
													protocol:uint8(_B18),
												    {{V4_dun_id,
												      V4_status,
												      V4_cool_time,
												      V4_auto_num},
												     _B19}
											      end),
									   {{V3_chapter_id,
									     V3_status,
									     V3_dun_list},
									    _B21}
								     end),
						  {{V2_mode, V2_chapter_list},
						   _B23}
					  end),
    {ok,
     {V1_mode, V1_chapter_id, V1_dun_id, V1_status,
      V1_is_first, V1_cool_time, V1_max_dun_id, V1_auto_num,
      V1_auto_num_max, V1_mode_list}};
unpack(13001, cli, _B0) ->
    {V1_mode, _B1} = protocol:uint8(_B0),
    {V1_chapter_id, _B2} = protocol:uint8(_B1),
    {V1_dun_id, _B3} = protocol:uint32(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {V1_is_first, _B5} = protocol:uint8(_B4),
    {V1_cool_time, _B6} = protocol:uint32(_B5),
    {V1_max_dun_id, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_mode, V1_chapter_id, V1_dun_id, V1_status,
      V1_is_first, V1_cool_time, V1_max_dun_id}};
unpack(13002, srv, _B0) -> {ok, {}};
unpack(13002, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13003, srv, _B0) ->
    {V1_is_auto, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_auto}};
unpack(13003, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13004, srv, _B0) -> {ok, {}};
unpack(13004, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13005, srv, _B0) ->
    {V1_dun_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_dun_id, V1_num}};
unpack(13005, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_dun_id, _B3} = protocol:uint32(_B2),
    {V1_num, _B4} = protocol:uint16(_B3),
    {V1_items, _B9} = protocol:array(_B4,
				     fun (_B5) ->
					     {V2_bid, _B6} =
						 protocol:uint32(_B5),
					     {V2_num, _B7} =
						 protocol:uint32(_B6),
					     {{V2_bid, V2_num}, _B7}
				     end),
    {ok, {V1_code, V1_msg, V1_dun_id, V1_num, V1_items}};
unpack(13006, srv, _B0) -> {ok, {}};
unpack(13006, cli, _B0) ->
    {V1_fast_combat_num, _B1} = protocol:uint8(_B0),
    {V1_fast_combat_max, _B2} = protocol:uint8(_B1),
    {V1_auto_num, _B3} = protocol:uint8(_B2),
    {V1_auto_num_max, _B4} = protocol:uint8(_B3),
    {V1_is_auto_combat, _B5} = protocol:uint8(_B4),
    {V1_fast_combat_add_time, _B6} = protocol:uint16(_B5),
    {V1_fast_combat_w_num, _B7} = protocol:uint8(_B6),
    {V1_fast_combat_p_num, _B8} = protocol:uint8(_B7),
    {V1_fast_combat_free_num, _B9} = protocol:uint8(_B8),
    {V1_is_holiday, _B10} = protocol:uint8(_B9),
    {ok,
     {V1_fast_combat_num, V1_fast_combat_max, V1_auto_num,
      V1_auto_num_max, V1_is_auto_combat,
      V1_fast_combat_add_time, V1_fast_combat_w_num,
      V1_fast_combat_p_num, V1_fast_combat_free_num,
      V1_is_holiday}};
unpack(13007, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_dun_id, _B2} = protocol:uint32(_B1),
    {V1_time, _B3} = protocol:uint32(_B2),
    {V1_old_lev, _B4} = protocol:uint8(_B3),
    {V1_new_lev, _B5} = protocol:uint8(_B4),
    {V1_items, _B10} = protocol:array(_B5,
				      fun (_B6) ->
					      {V2_bid, _B7} =
						  protocol:uint32(_B6),
					      {V2_num, _B8} =
						  protocol:uint32(_B7),
					      {{V2_bid, V2_num}, _B8}
				      end),
    {V1_auto_start_dun_id, _B11} = protocol:uint32(_B10),
    {V1_auto_end_dun_id, _B12} = protocol:uint32(_B11),
    {V1_fast_add_time1, _B13} = protocol:uint32(_B12),
    {V1_fast_add_time2, _B14} = protocol:uint32(_B13),
    {V1_old_exp, _B15} = protocol:uint32(_B14),
    {V1_new_exp, _B16} = protocol:uint32(_B15),
    {V1_vip_buff, _B17} = protocol:uint32(_B16),
    {V1_honor_buff, _B18} = protocol:uint32(_B17),
    {ok,
     {V1_type, V1_dun_id, V1_time, V1_old_lev, V1_new_lev,
      V1_items, V1_auto_start_dun_id, V1_auto_end_dun_id,
      V1_fast_add_time1, V1_fast_add_time2, V1_old_exp,
      V1_new_exp, V1_vip_buff, V1_honor_buff}};
unpack(13008, srv, _B0) -> {ok, {}};
unpack(13008, cli, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint8(_B1),
					    {V2_id, _B2}
				    end),
    {ok, {V1_list}};
unpack(13009, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(13009, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(13010, cli, _B0) ->
    {V1_dun_id, _B1} = protocol:uint32(_B0),
    {V1_chapter_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_dun_id, V1_chapter_id}};
unpack(13011, srv, _B0) -> {ok, {}};
unpack(13011, cli, _B0) ->
    {V1_buff_list, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_bid, _B2} =
						     protocol:uint32(_B1),
						 {V2_end_time, _B3} =
						     protocol:uint32(_B2),
						 {{V2_bid, V2_end_time}, _B3}
					 end),
    {ok, {V1_buff_list}};
unpack(13012, srv, _B0) -> {ok, {}};
unpack(13012, cli, _B0) ->
    {V1_chapter_list, _B9} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_chapter_id, _B2} =
							protocol:uint32(_B1),
						    {V2_award_list, _B7} =
							protocol:array(_B2,
								       fun
									 (_B3) ->
									     {V3_award_id,
									      _B4} =
										 protocol:uint32(_B3),
									     {V3_status,
									      _B5} =
										 protocol:uint32(_B4),
									     {{V3_award_id,
									       V3_status},
									      _B5}
								       end),
						    {{V2_chapter_id,
						      V2_award_list},
						     _B7}
					    end),
    {ok, {V1_chapter_list}};
unpack(13013, srv, _B0) -> {ok, {}};
unpack(13013, cli, _B0) ->
    {V1_chapter_list, _B9} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_chapter_id, _B2} =
							protocol:uint32(_B1),
						    {V2_award_list, _B7} =
							protocol:array(_B2,
								       fun
									 (_B3) ->
									     {V3_award_id,
									      _B4} =
										 protocol:uint32(_B3),
									     {V3_status,
									      _B5} =
										 protocol:uint32(_B4),
									     {{V3_award_id,
									       V3_status},
									      _B5}
								       end),
						    {{V2_chapter_id,
						      V2_award_list},
						     _B7}
					    end),
    {ok, {V1_chapter_list}};
unpack(13014, srv, _B0) ->
    {V1_chapter_id, _B1} = protocol:uint32(_B0),
    {V1_award_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_chapter_id, V1_award_id}};
unpack(13014, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_chapter_id, _B3} = protocol:uint32(_B2),
    {V1_award_id, _B4} = protocol:uint32(_B3),
    {V1_status, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_code, V1_msg, V1_chapter_id, V1_award_id,
      V1_status}};
unpack(13015, srv, _B0) ->
    {V1_dun_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_dun_id}};
unpack(13015, cli, _B0) ->
    {V1_dungeon_replay_log, _B13} = protocol:array(_B0,
						   fun (_B1) ->
							   {V2_rid, _B2} =
							       protocol:uint32(_B1),
							   {V2_sid, _B3} =
							       protocol:string(_B2),
							   {V2_name, _B4} =
							       protocol:string(_B3),
							   {V2_face_id, _B5} =
							       protocol:uint32(_B4),
							   {V2_power, _B6} =
							       protocol:uint32(_B5),
							   {V2_time, _B7} =
							       protocol:uint32(_B6),
							   {V2_repaly_id, _B8} =
							       protocol:uint32(_B7),
							   {V2_type, _B9} =
							       protocol:uint8(_B8),
							   {V2_face_update_time,
							    _B10} =
							       protocol:uint32(_B9),
							   {V2_face_file,
							    _B11} =
							       protocol:string(_B10),
							   {{V2_rid, V2_sid,
							     V2_name,
							     V2_face_id,
							     V2_power, V2_time,
							     V2_repaly_id,
							     V2_type,
							     V2_face_update_time,
							     V2_face_file},
							    _B11}
						   end),
    {ok, {V1_dungeon_replay_log}};
unpack(13016, cli, _B0) ->
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
    {V1_combat_type, _B9} = protocol:uint16(_B8),
    {V1_partner_bid, _B10} = protocol:uint32(_B9),
    {V1_partner_hurt, _B11} = protocol:uint32(_B10),
    {V1_partner_total_hurt, _B12} = protocol:uint32(_B11),
    {V1_lev, _B13} = protocol:uint8(_B12),
    {V1_exp, _B14} = protocol:uint32(_B13),
    {V1_new_lev, _B15} = protocol:uint8(_B14),
    {V1_new_exp, _B16} = protocol:uint32(_B15),
    {V1_auto_num, _B17} = protocol:uint16(_B16),
    {V1_target_role_name, _B18} = protocol:string(_B17),
    {V1_hurt_statistics, _B40} = protocol:array(_B18,
						fun (_B19) ->
							{V2_type, _B20} =
							    protocol:uint8(_B19),
							{V2_partner_hurts,
							 _B38} =
							    protocol:array(_B20,
									   fun
									     (_B21) ->
										 {V3_rid,
										  _B22} =
										     protocol:uint32(_B21),
										 {V3_srvid,
										  _B23} =
										     protocol:string(_B22),
										 {V3_id,
										  _B24} =
										     protocol:uint32(_B23),
										 {V3_bid,
										  _B25} =
										     protocol:uint32(_B24),
										 {V3_star,
										  _B26} =
										     protocol:uint32(_B25),
										 {V3_lev,
										  _B27} =
										     protocol:uint32(_B26),
										 {V3_camp_type,
										  _B28} =
										     protocol:uint32(_B27),
										 {V3_dps,
										  _B29} =
										     protocol:uint32(_B28),
										 {V3_cure,
										  _B30} =
										     protocol:uint32(_B29),
										 {V3_ext_data,
										  _B35} =
										     protocol:array(_B30,
												    fun
												      (_B31) ->
													  {V4_key,
													   _B32} =
													      protocol:uint32(_B31),
													  {V4_val,
													   _B33} =
													      protocol:uint32(_B32),
													  {{V4_key,
													    V4_val},
													   _B33}
												    end),
										 {V3_be_hurt,
										  _B36} =
										     protocol:uint32(_B35),
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
										  _B36}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B38}
						end),
    {V1_use_skin, _B41} = protocol:uint32(_B40),
    {ok,
     {V1_result, V1_item_rewards, V1_combat_type,
      V1_partner_bid, V1_partner_hurt, V1_partner_total_hurt,
      V1_lev, V1_exp, V1_new_lev, V1_new_exp, V1_auto_num,
      V1_target_role_name, V1_hurt_statistics, V1_use_skin}};
unpack(13017, srv, _B0) -> {ok, {}};
unpack(13017, cli, _B0) ->
    {V1_hook_time, _B1} = protocol:uint32(_B0),
    {V1_list, _B6} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_bid, _B3} =
						protocol:uint32(_B2),
					    {V2_num, _B4} =
						protocol:uint32(_B3),
					    {{V2_bid, V2_num}, _B4}
				    end),
    {ok, {V1_hook_time, V1_list}};
unpack(13018, srv, _B0) -> {ok, {}};
unpack(13018, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13019, srv, _B0) -> {ok, {}};
unpack(13019, cli, _B0) -> {ok, {}};
unpack(13020, srv, _B0) -> {ok, {}};
unpack(13020, cli, _B0) ->
    {V1_val, _B1} = protocol:uint32(_B0), {ok, {V1_val}};
unpack(13030, srv, _B0) -> {ok, {}};
unpack(13030, cli, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_type, _B2} =
						protocol:uint32(_B1),
					    {V2_day_num, _B3} =
						protocol:uint8(_B2),
					    {{V2_type, V2_day_num}, _B3}
				    end),
    {V1_pass_list, _B9} = protocol:array(_B5,
					 fun (_B6) ->
						 {V2_id, _B7} =
						     protocol:uint32(_B6),
						 {V2_id, _B7}
					 end),
    {ok, {V1_list, V1_pass_list}};
unpack(13031, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(13031, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13032, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(13032, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


