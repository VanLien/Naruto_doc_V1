-file("src/proto/proto_256.erl", 1).

-module(proto_256).

-lager_records([{arena_cluster_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{arena_cluster_replay_partner,
		 [pos, bid, lev, star, ext]},
		{arena_cluster_replay,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_cluster_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_score, def_id, def_name, def_face, def_lev,
		  def_rank, def_score, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_cluster_log, [id, list]},
		{arena_cluster_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, score, rank, time, avatar_id,
		  cont_win, ext]},
		{arena_cluster_rank, [rank, id, score]},
		{arena_cluster_f_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  dower_skill, set_skill, attr, extra]},
		{arena_cluster_f_order,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, pos_info, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  power, is_hidden, extra]},
		{arena_cluster_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, order_info, robot_id, avatar_id, look, ext]},
		{m_arena_cluster,
		 [ver, ref_time, formations, ref_list, season_ref_time,
		  season_combat_num, best_rank, day_combat_num,
		  acc_combat_num, day_reward, turn_card_reward,
		  turn_card_num, turn_card_history, worship,
		  worship_list]},
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

-file("src/proto/proto_256.erl", 16).

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

-file("src/proto/proto_256.erl", 17).

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

-file("src/proto/proto_256.erl", 18).

-file("inc/arena_cluster.hrl", 1).

-record(m_arena_cluster,
	{ver = 1, ref_time = 0, formations = [], ref_list = [],
	 season_ref_time = 0, season_combat_num = 0,
	 best_rank = 0, day_combat_num = 0, acc_combat_num = 0,
	 day_reward = [], turn_card_reward = [],
	 turn_card_num = 0, turn_card_history = [], worship = 0,
	 worship_list = []}).

-record(arena_cluster_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, order_info = [], robot_id = 0, avatar_id = 0,
	 look = 0, ext = []}).

-record(arena_cluster_f_order,
	{order, formation_type = 1, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, pos_info = [],
	 hallows_look_id = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_all_look_ids = [], power = 0,
	 is_hidden = 0, extra = []}).

-record(arena_cluster_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 dower_skill = [], set_skill = [], attr, extra = []}).

-record(arena_cluster_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_cluster_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, cont_win = 0, ext = []}).

-record(role_arena_cluster_log,
	{id = {0, <<>>}, list = []}).

-record(arena_cluster_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0, atk_score = 0,
	 def_id = {0, <<>>}, def_name = <<>>, def_face = 0,
	 def_lev = 0, def_rank = 0, def_score = 0, ret = 1,
	 win_count = 0, lose_count = 0, combat_type = 0,
	 replay_list = [], time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_cluster_replay,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_cluster_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(arena_cluster_fight_lock,
	{id = {0, <<>>}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-file("src/proto/proto_256.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25600, cli, {}) -> {ok, <<2:32, 25600:16>>};
pack(25600, srv,
     {V0_rank, V0_max_rank, V0_score, V0_can_combat_num,
      V0_buy_combat_num, V0_ref_time, V0_start_time,
      V0_end_time, V0_is_auto, V0_season_combat_num}) ->
    D_a_t_a = <<V0_rank:16, V0_max_rank:16, V0_score:32,
		V0_can_combat_num:8, V0_buy_combat_num:8,
		V0_ref_time:32/signed, V0_start_time:32, V0_end_time:32,
		V0_is_auto:8, V0_season_combat_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25600:16,
       D_a_t_a/binary>>};
pack(25601, cli, {}) -> {ok, <<2:32, 25601:16>>};
pack(25601, srv, {V0_f_list, V0_type}) ->
    D_a_t_a = <<(length(V0_f_list)):16,
		(list_to_binary([<<V1_idx:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_sex:8, V1_face:32, V1_look:32,
				   V1_power:32, V1_score:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {V1_idx, V1_rid, V1_srv_id, V1_name, V1_lev,
				     V1_sex, V1_face, V1_look, V1_power,
				     V1_score, V1_face_update_time,
				     V1_face_file}
					<- V0_f_list]))/binary,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25601:16,
       D_a_t_a/binary>>};
pack(25602, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25602:16,
       D_a_t_a/binary>>};
pack(25602, srv,
     {V0_rid, V0_srv_id, V0_name, V0_lev, V0_face,
      V0_face_update_time, V0_face_file, V0_sex, V0_power,
      V0_score, V0_avatar_id, V0_order_list}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:16,
		V0_face:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary, V0_sex:8,
		V0_power:32, V0_score:32, V0_avatar_id:32,
		(length(V0_order_list)):16,
		(list_to_binary([<<V1_order:8, V1_power:32,
				   V1_is_hidden:8, (length(V1_p_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_use_skin:32,
						      V2_resonate_lev:32>>
						    || {V2_pos, V2_id, V2_bid,
							V2_lev, V2_star,
							V2_use_skin,
							V2_resonate_lev}
							   <- V1_p_list]))/binary>>
				 || {V1_order, V1_power, V1_is_hidden,
				     V1_p_list}
					<- V0_order_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25602:16,
       D_a_t_a/binary>>};
pack(25603, cli,
     {V0_rid, V0_srv_id, V0_order, V0_pos}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_order:8,
		V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25603:16,
       D_a_t_a/binary>>};
pack(25603, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25603:16,
       D_a_t_a/binary>>};
pack(25604, cli, {V0_type, V0_formations}) ->
    D_a_t_a = <<V0_type:8, (length(V0_formations)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   (length(V1_pos_info)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32>>
						    || {V2_pos, V2_id}
							   <- V1_pos_info]))/binary,
				   V1_hallows_id:32, V1_is_hidden:8>>
				 || {V1_order, V1_formation_type, V1_pos_info,
				     V1_hallows_id, V1_is_hidden}
					<- V0_formations]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25604:16,
       D_a_t_a/binary>>};
pack(25604, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25604:16,
       D_a_t_a/binary>>};
pack(25605, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25605:16,
       D_a_t_a/binary>>};
pack(25605, srv, {V0_type, V0_formations}) ->
    D_a_t_a = <<V0_type:8, (length(V0_formations)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   (length(V1_pos_info)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32>>
						    || #formation_pos{pos =
									  V2_pos,
								      id =
									  V2_id}
							   <- V1_pos_info]))/binary,
				   V1_hallows_id:32, V1_is_hidden:8>>
				 || {V1_order, V1_formation_type, V1_pos_info,
				     V1_hallows_id, V1_is_hidden}
					<- V0_formations]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25605:16,
       D_a_t_a/binary>>};
pack(25606, cli, {V0_rid, V0_srv_id, V0_is_auto}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_is_auto:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25606:16,
       D_a_t_a/binary>>};
pack(25606, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25606:16,
       D_a_t_a/binary>>};
pack(25607, cli, {}) -> {ok, <<2:32, 25607:16>>};
pack(25607, srv, {V0_had_combat_num, V0_num_list}) ->
    D_a_t_a = <<V0_had_combat_num:16,
		(length(V0_num_list)):16,
		(list_to_binary([<<V1_num:8>>
				 || V1_num <- V0_num_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25607:16,
       D_a_t_a/binary>>};
pack(25608, cli, {V0_num}) ->
    D_a_t_a = <<V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25608:16,
       D_a_t_a/binary>>};
pack(25608, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25608:16,
       D_a_t_a/binary>>};
pack(25609, cli, {}) -> {ok, <<2:32, 25609:16>>};
pack(25609, srv, {V0_code, V0_msg, V0_ref_time}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_ref_time:32/signed>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25609:16,
       D_a_t_a/binary>>};
pack(25610, cli, {}) -> {ok, <<2:32, 25610:16>>};
pack(25610, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25610:16,
       D_a_t_a/binary>>};
pack(25611, cli, {}) -> {ok, <<2:32, 25611:16>>};
pack(25611, srv,
     {V0_result, V0_score, V0_get_score, V0_tar_name,
      V0_tar_lev, V0_tar_face, V0_face_update_time,
      V0_face_file, V0_tar_score, V0_lose_score,
      V0_all_hurt_statistics}) ->
    D_a_t_a = <<V0_result:8, V0_score:32,
		V0_get_score:32/signed,
		(protocol:pack(string, V0_tar_name))/binary,
		V0_tar_lev:16, V0_tar_face:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary,
		V0_tar_score:32/signed, V0_lose_score:32/signed,
		(length(V0_all_hurt_statistics)):16,
		(list_to_binary([<<V1_round:8,
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
				 || {V1_round, V1_hurt_statistics}
					<- V0_all_hurt_statistics]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25611:16,
       D_a_t_a/binary>>};
pack(25612, cli, {}) -> {ok, <<2:32, 25612:16>>};
pack(25612, srv, {V0_card_info}) ->
    D_a_t_a = <<(length(V0_card_info)):16,
		(list_to_binary([<<V1_pos:8, V1_status:8,
				   (length(V1_reward)):16,
				   (list_to_binary([<<V2_item_id:32, V2_num:32>>
						    || {V2_item_id, V2_num}
							   <- V1_reward]))/binary,
				   (length(V1_val)):16,
				   (list_to_binary([<<V2_item_id:32, V2_num:32>>
						    || {V2_item_id, V2_num}
							   <- V1_val]))/binary>>
				 || {V1_pos, V1_status, V1_reward, V1_val}
					<- V0_card_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25612:16,
       D_a_t_a/binary>>};
pack(25613, cli, {V0_pos}) ->
    D_a_t_a = <<V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25613:16,
       D_a_t_a/binary>>};
pack(25613, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25613:16,
       D_a_t_a/binary>>};
pack(25614, cli, {}) -> {ok, <<2:32, 25614:16>>};
pack(25614, srv, {V0_rank_list}) ->
    D_a_t_a = <<(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_rank:32, V1_lookid:32, V1_worship:32,
				   V1_worship_status:8>>
				 || {#arena_cluster_role{id =
							     {V1_rid,
							      V1_srv_id},
							 name = V1_name,
							 gname = V1_gname,
							 rank = V1_rank,
							 lookid = V1_lookid},
				     V1_worship, V1_worship_status}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25614:16,
       D_a_t_a/binary>>};
pack(25615, cli, {}) -> {ok, <<2:32, 25615:16>>};
pack(25615, srv,
     {V0_rank, V0_best_rank, V0_arena_cluster_role}) ->
    D_a_t_a = <<V0_rank:16, V0_best_rank:16,
		(length(V0_arena_cluster_role)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_lev:16, V1_face:32, V1_sex:8, V1_rank:16,
				   V1_power:32, V1_avatar_id:32, V1_score:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {#arena_cluster_role{id =
							     {V1_rid,
							      V1_srv_id},
							 name = V1_name,
							 gname = V1_gname,
							 lev = V1_lev,
							 face = V1_face,
							 sex = V1_sex,
							 rank = V1_rank,
							 power = V1_power,
							 avatar_id =
							     V1_avatar_id,
							 score = V1_score},
				     V1_face_update_time, V1_face_file}
					<- V0_arena_cluster_role]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25615:16,
       D_a_t_a/binary>>};
pack(25616, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25616:16,
       D_a_t_a/binary>>};
pack(25616, srv, {V0_type, V0_arena_cluster_log}) ->
    D_a_t_a = <<V0_type:8,
		(length(V0_arena_cluster_log)):16,
		(list_to_binary([<<V1_id:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_atk_name))/binary,
				   V1_atk_face:32, V1_atk_lev:32,
				   V1_atk_rank:32, V1_atk_score:32,
				   V1_atk_face_update_time:32,
				   (protocol:pack(string,
						  V1_atk_face_file))/binary,
				   V1_def_rid:32,
				   (protocol:pack(string,
						  V1_def_srv_id))/binary,
				   (protocol:pack(string, V1_def_name))/binary,
				   V1_def_face:32, V1_def_lev:32,
				   V1_def_rank:32, V1_def_score:32,
				   V1_def_face_update_time:32,
				   (protocol:pack(string,
						  V1_def_face_file))/binary,
				   V1_ret:8, V1_win_count:8, V1_lose_count:8,
				   V1_combat_type:8, V1_time:32>>
				 || #arena_cluster_log{id = V1_id,
						       atk_id =
							   {V1_rid, V1_srv_id},
						       atk_name = V1_atk_name,
						       atk_face = V1_atk_face,
						       atk_lev = V1_atk_lev,
						       atk_rank = V1_atk_rank,
						       atk_score = V1_atk_score,
						       atk_face_update_time =
							   V1_atk_face_update_time,
						       atk_face_file =
							   V1_atk_face_file,
						       def_id =
							   {V1_def_rid,
							    V1_def_srv_id},
						       def_name = V1_def_name,
						       def_face = V1_def_face,
						       def_lev = V1_def_lev,
						       def_rank = V1_def_rank,
						       def_score = V1_def_score,
						       def_face_update_time =
							   V1_def_face_update_time,
						       def_face_file =
							   V1_def_face_file,
						       ret = V1_ret,
						       win_count = V1_win_count,
						       lose_count =
							   V1_lose_count,
						       combat_type =
							   V1_combat_type,
						       time = V1_time}
					<- V0_arena_cluster_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25616:16,
       D_a_t_a/binary>>};
pack(25617, cli, {V0_type, V0_id}) ->
    D_a_t_a = <<V0_type:8, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25617:16,
       D_a_t_a/binary>>};
pack(25617, srv,
     {V0_type, V0_id, V0_arena_replay_infos}) ->
    D_a_t_a = <<V0_type:8, V0_id:32,
		(length(V0_arena_replay_infos)):16,
		(list_to_binary([<<V1_order:8, V1_id:32, V1_round:8,
				   V1_ret:8, V1_time:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_a_power:32, V1_a_formation_type:32,
				   V1_a_order:8, V1_a_end_hp:8, V1_b_rid:32,
				   (protocol:pack(string, V1_b_srv_id))/binary,
				   V1_b_power:32, V1_b_formation_type:32,
				   V1_b_order:8, V1_b_end_hp:8,
				   (length(V1_a_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_star:8,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #arena_cluster_replay_partner{pos
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
						    || #arena_cluster_replay_partner{pos
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
							   <- V1_hurt_statistics]))/binary,
				   V1_a_sprite_lev:16,
				   (length(V1_a_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_a_sprites]))/binary,
				   V1_b_sprite_lev:16,
				   (length(V1_b_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_b_sprites]))/binary>>
				 || {V1_order,
				     #arena_cluster_replay{id = V1_id,
							   round = V1_round,
							   ret = V1_ret,
							   time = V1_time,
							   a_id =
							       {V1_rid,
								V1_srv_id},
							   a_power = V1_a_power,
							   a_formation_type =
							       V1_a_formation_type,
							   a_order = V1_a_order,
							   a_end_hp =
							       V1_a_end_hp,
							   b_id =
							       {V1_b_rid,
								V1_b_srv_id},
							   b_power = V1_b_power,
							   b_formation_type =
							       V1_b_formation_type,
							   b_order = V1_b_order,
							   b_end_hp =
							       V1_b_end_hp,
							   a_plist = V1_a_plist,
							   b_plist =
							       V1_b_plist},
				     V1_hurt_statistics, V1_a_sprite_lev,
				     V1_a_sprites, V1_b_sprite_lev,
				     V1_b_sprites}
					<- V0_arena_replay_infos]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25617:16,
       D_a_t_a/binary>>};
pack(25618, cli, {}) -> {ok, <<2:32, 25618:16>>};
pack(25618, srv,
     {V0_worship_code, V0_reward_code, V0_combat_code}) ->
    D_a_t_a = <<V0_worship_code:8, V0_reward_code:8,
		V0_combat_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25618:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25600, srv, _B0) -> {ok, {}};
unpack(25600, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_max_rank, _B2} = protocol:uint16(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_can_combat_num, _B4} = protocol:uint8(_B3),
    {V1_buy_combat_num, _B5} = protocol:uint8(_B4),
    {V1_ref_time, _B6} = protocol:int32(_B5),
    {V1_start_time, _B7} = protocol:uint32(_B6),
    {V1_end_time, _B8} = protocol:uint32(_B7),
    {V1_is_auto, _B9} = protocol:uint8(_B8),
    {V1_season_combat_num, _B10} = protocol:uint32(_B9),
    {ok,
     {V1_rank, V1_max_rank, V1_score, V1_can_combat_num,
      V1_buy_combat_num, V1_ref_time, V1_start_time,
      V1_end_time, V1_is_auto, V1_season_combat_num}};
unpack(25601, srv, _B0) -> {ok, {}};
unpack(25601, cli, _B0) ->
    {V1_f_list, _B15} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_idx, _B2} =
						   protocol:uint8(_B1),
					       {V2_rid, _B3} =
						   protocol:uint32(_B2),
					       {V2_srv_id, _B4} =
						   protocol:string(_B3),
					       {V2_name, _B5} =
						   protocol:string(_B4),
					       {V2_lev, _B6} =
						   protocol:uint16(_B5),
					       {V2_sex, _B7} =
						   protocol:uint8(_B6),
					       {V2_face, _B8} =
						   protocol:uint32(_B7),
					       {V2_look, _B9} =
						   protocol:uint32(_B8),
					       {V2_power, _B10} =
						   protocol:uint32(_B9),
					       {V2_score, _B11} =
						   protocol:uint32(_B10),
					       {V2_face_update_time, _B12} =
						   protocol:uint32(_B11),
					       {V2_face_file, _B13} =
						   protocol:string(_B12),
					       {{V2_idx, V2_rid, V2_srv_id,
						 V2_name, V2_lev, V2_sex,
						 V2_face, V2_look, V2_power,
						 V2_score, V2_face_update_time,
						 V2_face_file},
						_B13}
				       end),
    {V1_type, _B16} = protocol:uint8(_B15),
    {ok, {V1_f_list, V1_type}};
unpack(25602, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(25602, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_lev, _B4} = protocol:uint16(_B3),
    {V1_face, _B5} = protocol:uint32(_B4),
    {V1_face_update_time, _B6} = protocol:uint32(_B5),
    {V1_face_file, _B7} = protocol:string(_B6),
    {V1_sex, _B8} = protocol:uint8(_B7),
    {V1_power, _B9} = protocol:uint32(_B8),
    {V1_score, _B10} = protocol:uint32(_B9),
    {V1_avatar_id, _B11} = protocol:uint32(_B10),
    {V1_order_list, _B27} = protocol:array(_B11,
					   fun (_B12) ->
						   {V2_order, _B13} =
						       protocol:uint8(_B12),
						   {V2_power, _B14} =
						       protocol:uint32(_B13),
						   {V2_is_hidden, _B15} =
						       protocol:uint8(_B14),
						   {V2_p_list, _B25} =
						       protocol:array(_B15,
								      fun
									(_B16) ->
									    {V3_pos,
									     _B17} =
										protocol:uint8(_B16),
									    {V3_id,
									     _B18} =
										protocol:uint32(_B17),
									    {V3_bid,
									     _B19} =
										protocol:uint32(_B18),
									    {V3_lev,
									     _B20} =
										protocol:uint16(_B19),
									    {V3_star,
									     _B21} =
										protocol:uint8(_B20),
									    {V3_use_skin,
									     _B22} =
										protocol:uint32(_B21),
									    {V3_resonate_lev,
									     _B23} =
										protocol:uint32(_B22),
									    {{V3_pos,
									      V3_id,
									      V3_bid,
									      V3_lev,
									      V3_star,
									      V3_use_skin,
									      V3_resonate_lev},
									     _B23}
								      end),
						   {{V2_order, V2_power,
						     V2_is_hidden, V2_p_list},
						    _B25}
					   end),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_lev, V1_face,
      V1_face_update_time, V1_face_file, V1_sex, V1_power,
      V1_score, V1_avatar_id, V1_order_list}};
unpack(25603, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_order, _B3} = protocol:uint8(_B2),
    {V1_pos, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_srv_id, V1_order, V1_pos}};
unpack(25603, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25604, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_formations, _B13} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_order, _B3} =
						       protocol:uint8(_B2),
						   {V2_formation_type, _B4} =
						       protocol:uint8(_B3),
						   {V2_pos_info, _B9} =
						       protocol:array(_B4,
								      fun
									(_B5) ->
									    {V3_pos,
									     _B6} =
										protocol:uint8(_B5),
									    {V3_id,
									     _B7} =
										protocol:uint32(_B6),
									    {{V3_pos,
									      V3_id},
									     _B7}
								      end),
						   {V2_hallows_id, _B10} =
						       protocol:uint32(_B9),
						   {V2_is_hidden, _B11} =
						       protocol:uint8(_B10),
						   {{V2_order,
						     V2_formation_type,
						     V2_pos_info, V2_hallows_id,
						     V2_is_hidden},
						    _B11}
					   end),
    {ok, {V1_type, V1_formations}};
unpack(25604, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25605, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(25605, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_formations, _B13} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_order, _B3} =
						       protocol:uint8(_B2),
						   {V2_formation_type, _B4} =
						       protocol:uint8(_B3),
						   {V2_pos_info, _B9} =
						       protocol:array(_B4,
								      fun
									(_B5) ->
									    {V3_pos,
									     _B6} =
										protocol:uint8(_B5),
									    {V3_id,
									     _B7} =
										protocol:uint32(_B6),
									    {{V3_pos,
									      V3_id},
									     _B7}
								      end),
						   {V2_hallows_id, _B10} =
						       protocol:uint32(_B9),
						   {V2_is_hidden, _B11} =
						       protocol:uint8(_B10),
						   {{V2_order,
						     V2_formation_type,
						     V2_pos_info, V2_hallows_id,
						     V2_is_hidden},
						    _B11}
					   end),
    {ok, {V1_type, V1_formations}};
unpack(25606, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_is_auto, _B3} = protocol:uint8(_B2),
    {ok, {V1_rid, V1_srv_id, V1_is_auto}};
unpack(25606, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25607, srv, _B0) -> {ok, {}};
unpack(25607, cli, _B0) ->
    {V1_had_combat_num, _B1} = protocol:uint16(_B0),
    {V1_num_list, _B5} = protocol:array(_B1,
					fun (_B2) ->
						{V2_num, _B3} =
						    protocol:uint8(_B2),
						{V2_num, _B3}
					end),
    {ok, {V1_had_combat_num, V1_num_list}};
unpack(25608, srv, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0), {ok, {V1_num}};
unpack(25608, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25609, srv, _B0) -> {ok, {}};
unpack(25609, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_ref_time, _B3} = protocol:int32(_B2),
    {ok, {V1_code, V1_msg, V1_ref_time}};
unpack(25610, srv, _B0) -> {ok, {}};
unpack(25610, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(25611, srv, _B0) -> {ok, {}};
unpack(25611, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_get_score, _B3} = protocol:int32(_B2),
    {V1_tar_name, _B4} = protocol:string(_B3),
    {V1_tar_lev, _B5} = protocol:uint16(_B4),
    {V1_tar_face, _B6} = protocol:uint32(_B5),
    {V1_face_update_time, _B7} = protocol:uint32(_B6),
    {V1_face_file, _B8} = protocol:string(_B7),
    {V1_tar_score, _B9} = protocol:int32(_B8),
    {V1_lose_score, _B10} = protocol:int32(_B9),
    {V1_all_hurt_statistics, _B36} = protocol:array(_B10,
						    fun (_B11) ->
							    {V2_round, _B12} =
								protocol:uint8(_B11),
							    {V2_hurt_statistics,
							     _B34} =
								protocol:array(_B12,
									       fun
										 (_B13) ->
										     {V3_type,
										      _B14} =
											 protocol:uint8(_B13),
										     {V3_partner_hurts,
										      _B32} =
											 protocol:array(_B14,
													fun
													  (_B15) ->
													      {V4_rid,
													       _B16} =
														  protocol:uint32(_B15),
													      {V4_srvid,
													       _B17} =
														  protocol:string(_B16),
													      {V4_id,
													       _B18} =
														  protocol:uint32(_B17),
													      {V4_bid,
													       _B19} =
														  protocol:uint32(_B18),
													      {V4_star,
													       _B20} =
														  protocol:uint32(_B19),
													      {V4_lev,
													       _B21} =
														  protocol:uint32(_B20),
													      {V4_camp_type,
													       _B22} =
														  protocol:uint32(_B21),
													      {V4_dps,
													       _B23} =
														  protocol:uint32(_B22),
													      {V4_cure,
													       _B24} =
														  protocol:uint32(_B23),
													      {V4_ext_data,
													       _B29} =
														  protocol:array(_B24,
																 fun
																   (_B25) ->
																       {V5_key,
																	_B26} =
																	   protocol:uint32(_B25),
																       {V5_val,
																	_B27} =
																	   protocol:uint32(_B26),
																       {{V5_key,
																	 V5_val},
																	_B27}
																 end),
													      {V4_be_hurt,
													       _B30} =
														  protocol:uint32(_B29),
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
													       _B30}
													end),
										     {{V3_type,
										       V3_partner_hurts},
										      _B32}
									       end),
							    {{V2_round,
							      V2_hurt_statistics},
							     _B34}
						    end),
    {ok,
     {V1_result, V1_score, V1_get_score, V1_tar_name,
      V1_tar_lev, V1_tar_face, V1_face_update_time,
      V1_face_file, V1_tar_score, V1_lose_score,
      V1_all_hurt_statistics}};
unpack(25612, srv, _B0) -> {ok, {}};
unpack(25612, cli, _B0) ->
    {V1_card_info, _B15} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_pos, _B2} =
						      protocol:uint8(_B1),
						  {V2_status, _B3} =
						      protocol:uint8(_B2),
						  {V2_reward, _B8} =
						      protocol:array(_B3,
								     fun
								       (_B4) ->
									   {V3_item_id,
									    _B5} =
									       protocol:uint32(_B4),
									   {V3_num,
									    _B6} =
									       protocol:uint32(_B5),
									   {{V3_item_id,
									     V3_num},
									    _B6}
								     end),
						  {V2_val, _B13} =
						      protocol:array(_B8,
								     fun
								       (_B9) ->
									   {V3_item_id,
									    _B10} =
									       protocol:uint32(_B9),
									   {V3_num,
									    _B11} =
									       protocol:uint32(_B10),
									   {{V3_item_id,
									     V3_num},
									    _B11}
								     end),
						  {{V2_pos, V2_status,
						    V2_reward, V2_val},
						   _B13}
					  end),
    {ok, {V1_card_info}};
unpack(25613, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0), {ok, {V1_pos}};
unpack(25613, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25614, srv, _B0) -> {ok, {}};
unpack(25614, cli, _B0) ->
    {V1_rank_list, _B11} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_rid, _B2} =
						      protocol:uint32(_B1),
						  {V2_srv_id, _B3} =
						      protocol:string(_B2),
						  {V2_name, _B4} =
						      protocol:string(_B3),
						  {V2_gname, _B5} =
						      protocol:string(_B4),
						  {V2_rank, _B6} =
						      protocol:uint32(_B5),
						  {V2_lookid, _B7} =
						      protocol:uint32(_B6),
						  {V2_worship, _B8} =
						      protocol:uint32(_B7),
						  {V2_worship_status, _B9} =
						      protocol:uint8(_B8),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_gname, V2_rank,
						    V2_lookid, V2_worship,
						    V2_worship_status},
						   _B9}
					  end),
    {ok, {V1_rank_list}};
unpack(25615, srv, _B0) -> {ok, {}};
unpack(25615, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_best_rank, _B2} = protocol:uint16(_B1),
    {V1_arena_cluster_role, _B18} = protocol:array(_B2,
						   fun (_B3) ->
							   {V2_rid, _B4} =
							       protocol:uint32(_B3),
							   {V2_srv_id, _B5} =
							       protocol:string(_B4),
							   {V2_name, _B6} =
							       protocol:string(_B5),
							   {V2_gname, _B7} =
							       protocol:string(_B6),
							   {V2_lev, _B8} =
							       protocol:uint16(_B7),
							   {V2_face, _B9} =
							       protocol:uint32(_B8),
							   {V2_sex, _B10} =
							       protocol:uint8(_B9),
							   {V2_rank, _B11} =
							       protocol:uint16(_B10),
							   {V2_power, _B12} =
							       protocol:uint32(_B11),
							   {V2_avatar_id,
							    _B13} =
							       protocol:uint32(_B12),
							   {V2_score, _B14} =
							       protocol:uint32(_B13),
							   {V2_face_update_time,
							    _B15} =
							       protocol:uint32(_B14),
							   {V2_face_file,
							    _B16} =
							       protocol:string(_B15),
							   {{V2_rid, V2_srv_id,
							     V2_name, V2_gname,
							     V2_lev, V2_face,
							     V2_sex, V2_rank,
							     V2_power,
							     V2_avatar_id,
							     V2_score,
							     V2_face_update_time,
							     V2_face_file},
							    _B16}
						   end),
    {ok, {V1_rank, V1_best_rank, V1_arena_cluster_role}};
unpack(25616, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(25616, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_arena_cluster_log, _B28} = protocol:array(_B1,
						  fun (_B2) ->
							  {V2_id, _B3} =
							      protocol:uint32(_B2),
							  {V2_rid, _B4} =
							      protocol:uint32(_B3),
							  {V2_srv_id, _B5} =
							      protocol:string(_B4),
							  {V2_atk_name, _B6} =
							      protocol:string(_B5),
							  {V2_atk_face, _B7} =
							      protocol:uint32(_B6),
							  {V2_atk_lev, _B8} =
							      protocol:uint32(_B7),
							  {V2_atk_rank, _B9} =
							      protocol:uint32(_B8),
							  {V2_atk_score, _B10} =
							      protocol:uint32(_B9),
							  {V2_atk_face_update_time,
							   _B11} =
							      protocol:uint32(_B10),
							  {V2_atk_face_file,
							   _B12} =
							      protocol:string(_B11),
							  {V2_def_rid, _B13} =
							      protocol:uint32(_B12),
							  {V2_def_srv_id,
							   _B14} =
							      protocol:string(_B13),
							  {V2_def_name, _B15} =
							      protocol:string(_B14),
							  {V2_def_face, _B16} =
							      protocol:uint32(_B15),
							  {V2_def_lev, _B17} =
							      protocol:uint32(_B16),
							  {V2_def_rank, _B18} =
							      protocol:uint32(_B17),
							  {V2_def_score, _B19} =
							      protocol:uint32(_B18),
							  {V2_def_face_update_time,
							   _B20} =
							      protocol:uint32(_B19),
							  {V2_def_face_file,
							   _B21} =
							      protocol:string(_B20),
							  {V2_ret, _B22} =
							      protocol:uint8(_B21),
							  {V2_win_count, _B23} =
							      protocol:uint8(_B22),
							  {V2_lose_count,
							   _B24} =
							      protocol:uint8(_B23),
							  {V2_combat_type,
							   _B25} =
							      protocol:uint8(_B24),
							  {V2_time, _B26} =
							      protocol:uint32(_B25),
							  {{V2_id, V2_rid,
							    V2_srv_id,
							    V2_atk_name,
							    V2_atk_face,
							    V2_atk_lev,
							    V2_atk_rank,
							    V2_atk_score,
							    V2_atk_face_update_time,
							    V2_atk_face_file,
							    V2_def_rid,
							    V2_def_srv_id,
							    V2_def_name,
							    V2_def_face,
							    V2_def_lev,
							    V2_def_rank,
							    V2_def_score,
							    V2_def_face_update_time,
							    V2_def_face_file,
							    V2_ret,
							    V2_win_count,
							    V2_lose_count,
							    V2_combat_type,
							    V2_time},
							   _B26}
						  end),
    {ok, {V1_type, V1_arena_cluster_log}};
unpack(25617, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_id}};
unpack(25617, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_arena_replay_infos, _B80} = protocol:array(_B2,
						   fun (_B3) ->
							   {V2_order, _B4} =
							       protocol:uint8(_B3),
							   {V2_id, _B5} =
							       protocol:uint32(_B4),
							   {V2_round, _B6} =
							       protocol:uint8(_B5),
							   {V2_ret, _B7} =
							       protocol:uint8(_B6),
							   {V2_time, _B8} =
							       protocol:uint32(_B7),
							   {V2_rid, _B9} =
							       protocol:uint32(_B8),
							   {V2_srv_id, _B10} =
							       protocol:string(_B9),
							   {V2_a_power, _B11} =
							       protocol:uint32(_B10),
							   {V2_a_formation_type,
							    _B12} =
							       protocol:uint32(_B11),
							   {V2_a_order, _B13} =
							       protocol:uint8(_B12),
							   {V2_a_end_hp, _B14} =
							       protocol:uint8(_B13),
							   {V2_b_rid, _B15} =
							       protocol:uint32(_B14),
							   {V2_b_srv_id, _B16} =
							       protocol:string(_B15),
							   {V2_b_power, _B17} =
							       protocol:uint32(_B16),
							   {V2_b_formation_type,
							    _B18} =
							       protocol:uint32(_B17),
							   {V2_b_order, _B19} =
							       protocol:uint8(_B18),
							   {V2_b_end_hp, _B20} =
							       protocol:uint8(_B19),
							   {V2_a_plist, _B32} =
							       protocol:array(_B20,
									      fun
										(_B21) ->
										    {V3_pos,
										     _B22} =
											protocol:uint8(_B21),
										    {V3_bid,
										     _B23} =
											protocol:uint32(_B22),
										    {V3_lev,
										     _B24} =
											protocol:uint16(_B23),
										    {V3_star,
										     _B25} =
											protocol:uint8(_B24),
										    {V3_ext,
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
										    {{V3_pos,
										      V3_bid,
										      V3_lev,
										      V3_star,
										      V3_ext},
										     _B30}
									      end),
							   {V2_b_plist, _B44} =
							       protocol:array(_B32,
									      fun
										(_B33) ->
										    {V3_pos,
										     _B34} =
											protocol:uint8(_B33),
										    {V3_bid,
										     _B35} =
											protocol:uint32(_B34),
										    {V3_lev,
										     _B36} =
											protocol:uint16(_B35),
										    {V3_star,
										     _B37} =
											protocol:uint8(_B36),
										    {V3_ext,
										     _B42} =
											protocol:array(_B37,
												       fun
													 (_B38) ->
													     {V4_key,
													      _B39} =
														 protocol:uint32(_B38),
													     {V4_val,
													      _B40} =
														 protocol:uint32(_B39),
													     {{V4_key,
													       V4_val},
													      _B40}
												       end),
										    {{V3_pos,
										      V3_bid,
										      V3_lev,
										      V3_star,
										      V3_ext},
										     _B42}
									      end),
							   {V2_hurt_statistics,
							    _B66} =
							       protocol:array(_B44,
									      fun
										(_B45) ->
										    {V3_type,
										     _B46} =
											protocol:uint8(_B45),
										    {V3_partner_hurts,
										     _B64} =
											protocol:array(_B46,
												       fun
													 (_B47) ->
													     {V4_rid,
													      _B48} =
														 protocol:uint32(_B47),
													     {V4_srvid,
													      _B49} =
														 protocol:string(_B48),
													     {V4_id,
													      _B50} =
														 protocol:uint32(_B49),
													     {V4_bid,
													      _B51} =
														 protocol:uint32(_B50),
													     {V4_star,
													      _B52} =
														 protocol:uint32(_B51),
													     {V4_lev,
													      _B53} =
														 protocol:uint32(_B52),
													     {V4_camp_type,
													      _B54} =
														 protocol:uint32(_B53),
													     {V4_dps,
													      _B55} =
														 protocol:uint32(_B54),
													     {V4_cure,
													      _B56} =
														 protocol:uint32(_B55),
													     {V4_ext_data,
													      _B61} =
														 protocol:array(_B56,
																fun
																  (_B57) ->
																      {V5_key,
																       _B58} =
																	  protocol:uint32(_B57),
																      {V5_val,
																       _B59} =
																	  protocol:uint32(_B58),
																      {{V5_key,
																	V5_val},
																       _B59}
																end),
													     {V4_be_hurt,
													      _B62} =
														 protocol:uint32(_B61),
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
													      _B62}
												       end),
										    {{V3_type,
										      V3_partner_hurts},
										     _B64}
									      end),
							   {V2_a_sprite_lev,
							    _B67} =
							       protocol:uint16(_B66),
							   {V2_a_sprites,
							    _B72} =
							       protocol:array(_B67,
									      fun
										(_B68) ->
										    {V3_pos,
										     _B69} =
											protocol:uint8(_B68),
										    {V3_item_bid,
										     _B70} =
											protocol:uint32(_B69),
										    {{V3_pos,
										      V3_item_bid},
										     _B70}
									      end),
							   {V2_b_sprite_lev,
							    _B73} =
							       protocol:uint16(_B72),
							   {V2_b_sprites,
							    _B78} =
							       protocol:array(_B73,
									      fun
										(_B74) ->
										    {V3_pos,
										     _B75} =
											protocol:uint8(_B74),
										    {V3_item_bid,
										     _B76} =
											protocol:uint32(_B75),
										    {{V3_pos,
										      V3_item_bid},
										     _B76}
									      end),
							   {{V2_order, V2_id,
							     V2_round, V2_ret,
							     V2_time, V2_rid,
							     V2_srv_id,
							     V2_a_power,
							     V2_a_formation_type,
							     V2_a_order,
							     V2_a_end_hp,
							     V2_b_rid,
							     V2_b_srv_id,
							     V2_b_power,
							     V2_b_formation_type,
							     V2_b_order,
							     V2_b_end_hp,
							     V2_a_plist,
							     V2_b_plist,
							     V2_hurt_statistics,
							     V2_a_sprite_lev,
							     V2_a_sprites,
							     V2_b_sprite_lev,
							     V2_b_sprites},
							    _B78}
						   end),
    {ok, {V1_type, V1_id, V1_arena_replay_infos}};
unpack(25618, srv, _B0) -> {ok, {}};
unpack(25618, cli, _B0) ->
    {V1_worship_code, _B1} = protocol:uint8(_B0),
    {V1_reward_code, _B2} = protocol:uint8(_B1),
    {V1_combat_code, _B3} = protocol:uint8(_B2),
    {ok, {V1_worship_code, V1_reward_code, V1_combat_code}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


