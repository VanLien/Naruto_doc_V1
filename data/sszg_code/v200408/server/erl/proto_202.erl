-file("src/proto/proto_202.erl", 1).

-module(proto_202).

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
		{champion_result, [id, rank, cnum, win]},
		{champion_pk,
		 [id, step, round, group, score, is_guess, a_pos, a_id,
		  a_name, a_lev, a_gid, a_gname, a_face, a_avatar_id,
		  a_sex, a_plist, a_bet, a_power, a_max_power, a_robot_id,
		  a_formation_type, a_formation_lev, a_time, b_pos, b_id,
		  b_name, b_lev, b_gid, b_gname, b_face, b_avatar_id,
		  b_sex, b_plist, b_bet, b_power, b_max_power,
		  b_formation_type, b_formation_lev, b_robot_id, b_time,
		  ret, replay_id, diff_power, pk_rlist, a_sprite_lev,
		  a_sprites, b_sprite_lev, b_sprites, a_face_update_time,
		  a_face_file, b_face_update_time, b_face_file]},
		{champion_role_log, [id, logs]},
		{champion_bet_log, [id, rid, target, bet, get_bet]},
		{champion_bet, [id, bet, logs]},
		{champion_32_pk,
		 [pos, id, name, lev, face, sex, max_power, ret,
		  replay_id, face_update_time, face_file]},
		{arena_champion_rank,
		 [rank, id, old_rank, score, score_32]},
		{arena_champion_role,
		 [id, name, lev, sex, gid, gname, face, max_power, power,
		  lookid, old_rank, old_score, score, score_32, rank,
		  avatar_id, robot_id, group, group32, combat_num, win,
		  lose, time, face_update_time, face_file, match_id]},
		{champion_state,
		 [round, round_status, step, step_status,
		  step_status_time, state_start_time, state_end_time,
		  season_start_time, season_end_time]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{arena_pk_log,
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

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

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

-file("src/proto/proto_202.erl", 16).

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

-file("src/proto/proto_202.erl", 17).

-file("inc/arena_champion.hrl", 1).

-record(champion_state,
	{round = 0, round_status = 0, step = 0, step_status = 0,
	 step_status_time = 0, state_start_time = 0,
	 state_end_time = 0, season_start_time = 0,
	 season_end_time = 0}).

-record(arena_champion_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, max_power = 0,
	 power = 0, lookid = 0, old_rank = 0, old_score = 0,
	 score = 0, score_32 = 0, rank = 0, avatar_id = 0,
	 robot_id = 0, group = 0, group32 = 0, combat_num = 0,
	 win = 0, lose = 0, time = 0, face_update_time = 0,
	 face_file = <<>>, match_id = {0, <<>>}}).

-record(arena_champion_rank,
	{rank = 0, id = {0, <<>>}, old_rank = 0, score = 0,
	 score_32 = 0}).

-record(champion_32_pk,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, sex = 0, max_power = 0, ret = 0,
	 replay_id = 0, face_update_time = 0, face_file = <<>>}).

-record(champion_bet,
	{id = {0, <<>>}, bet = 0, logs = []}).

-record(champion_bet_log,
	{id = 0, rid = {0, <<>>}, target = 1, bet = 0,
	 get_bet = 0}).

-record(champion_role_log, {id = {0, <<>>}, logs = []}).

-record(champion_pk,
	{id = 0, step = 0, round = 0, group = 0, score = 0,
	 is_guess = 1, a_pos = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_lev = 0, a_gid = {0, <<>>},
	 a_gname = <<>>, a_face = 0, a_avatar_id = 0, a_sex = 0,
	 a_plist = [], a_bet = 0, a_power = 0, a_max_power = 0,
	 a_robot_id = 0, a_formation_type = 1,
	 a_formation_lev = 1, a_time = 0, b_pos = 0,
	 b_id = {0, <<>>}, b_name = <<>>, b_lev = 0,
	 b_gid = {0, <<>>}, b_gname = <<>>, b_face = 0,
	 b_avatar_id = 0, b_sex = 0, b_plist = [], b_bet = 0,
	 b_power = 0, b_max_power = 0, b_formation_type = 1,
	 b_formation_lev = 1, b_robot_id = 0, b_time = 0,
	 ret = 0, replay_id = 0, diff_power = 0, pk_rlist = [],
	 a_sprite_lev = 0, a_sprites = [], b_sprite_lev = 0,
	 b_sprites = [], a_face_update_time = 0,
	 a_face_file = <<>>, b_face_update_time = 0,
	 b_face_file = <<>>}).

-record(champion_result,
	{id = {0, <<>>}, rank = 0, cnum = 0, win = 0}).

-file("src/proto/proto_202.erl", 18).

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

-file("src/proto/proto_202.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(20200, cli, {}) -> {ok, <<2:32, 20200:16>>};
pack(20200, srv,
     {V0_rank, V0_score, V0_can_combat_num,
      V0_buy_combat_num, V0_ref_time, V0_start_time,
      V0_end_time, V0_cont_win}) ->
    D_a_t_a = <<V0_rank:16, V0_score:32,
		V0_can_combat_num:8, V0_buy_combat_num:8,
		V0_ref_time:32/signed, V0_start_time:32, V0_end_time:32,
		V0_cont_win:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20200:16,
       D_a_t_a/binary>>};
pack(20201, cli, {}) -> {ok, <<2:32, 20201:16>>};
pack(20201, srv, {V0_f_list, V0_type}) ->
    D_a_t_a = <<(length(V0_f_list)):16,
		(list_to_binary([<<V1_idx:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_sex:8, V1_face:32, V1_power:32,
				   V1_score:32, V1_get_score:8, V1_status:8,
				   (length(V1_p_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_star:8,
						      V2_break_lev:8,
						      V2_use_skin:32,
						      V2_resonate_lev:32>>
						    || {V2_pos, V2_bid, V2_lev,
							V2_star, V2_break_lev,
							V2_use_skin,
							V2_resonate_lev}
							   <- V1_p_list]))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string, V1_face_file))/binary,
				   V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   (protocol:pack(string, V1_gname))/binary>>
				 || {V1_idx, V1_rid, V1_srv_id, V1_name, V1_lev,
				     V1_sex, V1_face, V1_power, V1_score,
				     V1_get_score, V1_status, V1_p_list,
				     V1_face_update_time, V1_face_file, V1_gid,
				     V1_gsrv_id, V1_gname}
					<- V0_f_list]))/binary,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20201:16,
       D_a_t_a/binary>>};
pack(20202, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20202:16,
       D_a_t_a/binary>>};
pack(20202, srv,
     {V0_rid, V0_srv_id, V0_name, V0_lev, V0_face, V0_power,
      V0_score, V0_formation_type, V0_formation_lev,
      V0_p_list, V0_face_update_time, V0_face_file, V0_gid,
      V0_gsrv_id, V0_gname}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:16,
		V0_face:32, V0_power:32, V0_score:32,
		V0_formation_type:8, V0_formation_lev:8,
		(length(V0_p_list)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_quality:8, V1_star:8, V1_break_lev:8,
				   V1_use_skin:32, V1_resonate_lev:32>>
				 || {V1_pos, V1_bid, V1_lev, V1_quality,
				     V1_star, V1_break_lev, V1_use_skin,
				     V1_resonate_lev}
					<- V0_p_list]))/binary,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary, V0_gid:32,
		(protocol:pack(string, V0_gsrv_id))/binary,
		(protocol:pack(string, V0_gname))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20202:16,
       D_a_t_a/binary>>};
pack(20203, cli, {V0_rid, V0_srv_id, V0_is_auto}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_is_auto:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20203:16,
       D_a_t_a/binary>>};
pack(20203, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20203:16,
       D_a_t_a/binary>>};
pack(20204, cli, {V0_rid, V0_srv_id, V0_pos}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20204:16,
       D_a_t_a/binary>>};
pack(20204, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20204:16,
       D_a_t_a/binary>>};
pack(20206, cli, {}) -> {ok, <<2:32, 20206:16>>};
pack(20206, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20206:16,
       D_a_t_a/binary>>};
pack(20207, cli, {V0_num}) ->
    D_a_t_a = <<V0_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20207:16,
       D_a_t_a/binary>>};
pack(20207, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20207:16,
       D_a_t_a/binary>>};
pack(20208, cli, {}) -> {ok, <<2:32, 20208:16>>};
pack(20208, srv, {V0_had_combat_num, V0_num_list}) ->
    D_a_t_a = <<V0_had_combat_num:16,
		(length(V0_num_list)):16,
		(list_to_binary([<<V1_num:8>>
				 || V1_num <- V0_num_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20208:16,
       D_a_t_a/binary>>};
pack(20209, cli, {V0_num}) ->
    D_a_t_a = <<V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20209:16,
       D_a_t_a/binary>>};
pack(20209, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20209:16,
       D_a_t_a/binary>>};
pack(20210, srv,
     {V0_result, V0_score, V0_get_score, V0_items,
      V0_tar_name, V0_tar_lev, V0_tar_face,
      V0_face_update_time, V0_face_file, V0_tar_score,
      V0_lose_score, V0_target_role_name, V0_hurt_statistics,
      V0_replay_id}) ->
    D_a_t_a = <<V0_result:8, V0_score:32,
		V0_get_score:32/signed, (length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_items]))/binary,
		(protocol:pack(string, V0_tar_name))/binary,
		V0_tar_lev:16, V0_tar_face:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary,
		V0_tar_score:32/signed, V0_lose_score:32/signed,
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
		V0_replay_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20210:16,
       D_a_t_a/binary>>};
pack(20220, cli, {}) -> {ok, <<2:32, 20220:16>>};
pack(20220, srv, {V0_rank_list}) ->
    D_a_t_a = <<(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_rank:8, V1_score:32, V1_sex:8,
				   V1_lookid:32, V1_face_update_time:32,
				   (protocol:pack(string, V1_face_file))/binary,
				   V1_worship:32, V1_worship_status:8>>
				 || {#arena_role{id = {V1_rid, V1_srv_id},
						 name = V1_name, lev = V1_lev,
						 rank = V1_rank,
						 score = V1_score, sex = V1_sex,
						 lookid = V1_lookid,
						 face_update_time =
						     V1_face_update_time,
						 face_file = V1_face_file},
				     V1_worship, V1_worship_status}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20220:16,
       D_a_t_a/binary>>};
pack(20221, cli, {}) -> {ok, <<2:32, 20221:16>>};
pack(20221, srv,
     {V0_rank, V0_score, V0_worship, V0_rank_list}) ->
    D_a_t_a = <<V0_rank:16, V0_score:32, V0_worship:32,
		(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_sex:8, V1_rank:16,
				   V1_score:32, V1_power:32, V1_avatar_id:32,
				   V1_lookid:32, V1_face_update_time:32,
				   (protocol:pack(string, V1_face_file))/binary,
				   V1_worship:32, V1_worship_status:8>>
				 || {#arena_role{id = {V1_rid, V1_srv_id},
						 name = V1_name, lev = V1_lev,
						 face = V1_face, sex = V1_sex,
						 rank = V1_rank,
						 score = V1_score,
						 power = V1_power,
						 avatar_id = V1_avatar_id,
						 lookid = V1_lookid,
						 face_update_time =
						     V1_face_update_time,
						 face_file = V1_face_file},
				     V1_worship, V1_worship_status}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20221:16,
       D_a_t_a/binary>>};
pack(20222, cli, {}) -> {ok, <<2:32, 20222:16>>};
pack(20222, srv, {V0_log_list}) ->
    D_a_t_a = <<(length(V0_log_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_sex:8, V1_face:32,
				   V1_avatar_id:32, V1_power:32,
				   V1_score:16/signed, V1_type:8, V1_ret:8,
				   V1_replay_id:32, V1_time:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #arena_pk_log{rid = {V1_rid, V1_srv_id},
						  name = V1_name, lev = V1_lev,
						  sex = V1_sex, face = V1_face,
						  avatar_id = V1_avatar_id,
						  power = V1_power,
						  score = V1_score,
						  type = V1_type, ret = V1_ret,
						  replay_id = V1_replay_id,
						  time = V1_time,
						  face_update_time =
						      V1_face_update_time,
						  face_file = V1_face_file}
					<- V0_log_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20222:16,
       D_a_t_a/binary>>};
pack(20223, cli, {}) -> {ok, <<2:32, 20223:16>>};
pack(20223, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20223:16,
       D_a_t_a/binary>>};
pack(20250, cli, {}) -> {ok, <<2:32, 20250:16>>};
pack(20250, srv,
     {V0_start_time, V0_end_time, V0_step, V0_step_status,
      V0_step_status_time, V0_round, V0_round_status,
      V0_round_status_time, V0_flag}) ->
    D_a_t_a = <<V0_start_time:32, V0_end_time:32, V0_step:8,
		V0_step_status:8, V0_step_status_time:32, V0_round:8,
		V0_round_status:8, V0_round_status_time:32, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20250:16,
       D_a_t_a/binary>>};
pack(20251, cli, {}) -> {ok, <<2:32, 20251:16>>};
pack(20251, srv,
     {V0_rank, V0_best_rank, V0_can_bet, V0_group}) ->
    D_a_t_a = <<V0_rank:16, V0_best_rank:16, V0_can_bet:32,
		V0_group:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20251:16,
       D_a_t_a/binary>>};
pack(20252, cli, {}) -> {ok, <<2:32, 20252:16>>};
pack(20252, srv,
     #champion_pk{step = V0_step, round = V0_round,
		  group = V0_group, a_bet = V0_a_bet,
		  a_id = {V0_a_rid, V0_a_srv_id}, a_name = V0_a_name,
		  a_lev = V0_a_lev, a_face = V0_a_face,
		  a_face_update_time = V0_a_face_update_time,
		  a_face_file = V0_a_face_file,
		  a_avatar_id = V0_a_avatar_id, a_sex = V0_a_sex,
		  a_power = V0_a_power,
		  a_formation_type = V0_a_formation_type,
		  a_formation_lev = V0_a_formation_lev,
		  a_plist = V0_a_plist, b_bet = V0_b_bet,
		  b_id = {V0_b_rid, V0_b_srv_id}, b_name = V0_b_name,
		  b_lev = V0_b_lev, b_face = V0_b_face,
		  b_face_update_time = V0_b_face_update_time,
		  b_face_file = V0_b_face_file,
		  b_avatar_id = V0_b_avatar_id, b_sex = V0_b_sex,
		  b_power = V0_b_power,
		  b_formation_type = V0_b_formation_type,
		  b_formation_lev = V0_b_formation_lev,
		  b_plist = V0_b_plist, ret = V0_ret,
		  replay_id = V0_replay_id,
		  a_sprite_lev = V0_a_sprite_lev,
		  a_sprites = V0_a_sprites,
		  b_sprite_lev = V0_b_sprite_lev,
		  b_sprites = V0_b_sprites}) ->
    D_a_t_a = <<V0_step:8, V0_round:8, V0_group:8,
		V0_a_bet:32, V0_a_rid:32,
		(protocol:pack(string, V0_a_srv_id))/binary,
		(protocol:pack(string, V0_a_name))/binary, V0_a_lev:16,
		V0_a_face:32, V0_a_face_update_time:32,
		(protocol:pack(string, V0_a_face_file))/binary,
		V0_a_avatar_id:32, V0_a_sex:8, V0_a_power:32,
		V0_a_formation_type:8, V0_a_formation_lev:8,
		(length(V0_a_plist)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_quality:8, V1_star:8, V1_break_lev:8,
				   V1_hurt:32, V1_behurt:32, V1_curt:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || #{pos := V1_pos, bid := V1_bid,
				      lev := V1_lev, quality := V1_quality,
				      star := V1_star,
				      break_lev := V1_break_lev,
				      hurt := V1_hurt, behurt := V1_behurt,
				      curt := V1_curt, ext_data := V1_ext_data}
					<- V0_a_plist]))/binary,
		V0_b_bet:32, V0_b_rid:32,
		(protocol:pack(string, V0_b_srv_id))/binary,
		(protocol:pack(string, V0_b_name))/binary, V0_b_lev:16,
		V0_b_face:32, V0_b_face_update_time:32,
		(protocol:pack(string, V0_b_face_file))/binary,
		V0_b_avatar_id:32, V0_b_sex:8, V0_b_power:32,
		V0_b_formation_type:8, V0_b_formation_lev:8,
		(length(V0_b_plist)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_quality:8, V1_star:8, V1_break_lev:8,
				   V1_hurt:32, V1_behurt:32, V1_curt:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || #{pos := V1_pos, bid := V1_bid,
				      lev := V1_lev, quality := V1_quality,
				      star := V1_star,
				      break_lev := V1_break_lev,
				      hurt := V1_hurt, behurt := V1_behurt,
				      curt := V1_curt, ext_data := V1_ext_data}
					<- V0_b_plist]))/binary,
		V0_ret:8, V0_replay_id:32, V0_a_sprite_lev:16,
		(length(V0_a_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_a_sprites]))/binary,
		V0_b_sprite_lev:16, (length(V0_b_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_b_sprites]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20252:16,
       D_a_t_a/binary>>};
pack(20253, cli, {}) -> {ok, <<2:32, 20253:16>>};
pack(20253, srv,
     {V0_bet_type, V0_bet_val, V0_a_bet_ratio,
      V0_b_bet_ratio,
      #champion_pk{step = V0_step, round = V0_round,
		   group = V0_group, a_bet = V0_a_bet,
		   a_id = {V0_a_rid, V0_a_srv_id}, a_name = V0_a_name,
		   a_lev = V0_a_lev, a_face = V0_a_face,
		   a_face_update_time = V0_a_face_update_time,
		   a_face_file = V0_a_face_file,
		   a_avatar_id = V0_a_avatar_id, a_sex = V0_a_sex,
		   a_power = V0_a_power,
		   a_formation_type = V0_a_formation_type,
		   a_formation_lev = V0_a_formation_lev,
		   a_plist = V0_a_plist, b_bet = V0_b_bet,
		   b_id = {V0_b_rid, V0_b_srv_id}, b_name = V0_b_name,
		   b_lev = V0_b_lev, b_face = V0_b_face,
		   b_face_update_time = V0_b_face_update_time,
		   b_face_file = V0_b_face_file,
		   b_avatar_id = V0_b_avatar_id, b_sex = V0_b_sex,
		   b_power = V0_b_power,
		   b_formation_type = V0_b_formation_type,
		   b_formation_lev = V0_b_formation_lev,
		   b_plist = V0_b_plist, ret = V0_ret,
		   replay_id = V0_replay_id,
		   a_sprite_lev = V0_a_sprite_lev,
		   a_sprites = V0_a_sprites,
		   b_sprite_lev = V0_b_sprite_lev,
		   b_sprites = V0_b_sprites}}) ->
    D_a_t_a = <<V0_bet_type:8, V0_bet_val:32,
		V0_a_bet_ratio:16, V0_b_bet_ratio:16, V0_step:8,
		V0_round:8, V0_group:8, V0_a_bet:32, V0_a_rid:32,
		(protocol:pack(string, V0_a_srv_id))/binary,
		(protocol:pack(string, V0_a_name))/binary, V0_a_lev:16,
		V0_a_face:32, V0_a_face_update_time:32,
		(protocol:pack(string, V0_a_face_file))/binary,
		V0_a_avatar_id:32, V0_a_sex:8, V0_a_power:32,
		V0_a_formation_type:8, V0_a_formation_lev:8,
		(length(V0_a_plist)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_quality:8, V1_star:8, V1_break_lev:8,
				   V1_hurt:32, V1_behurt:32, V1_curt:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || #{pos := V1_pos, bid := V1_bid,
				      lev := V1_lev, quality := V1_quality,
				      star := V1_star,
				      break_lev := V1_break_lev,
				      hurt := V1_hurt, behurt := V1_behurt,
				      curt := V1_curt, ext_data := V1_ext_data}
					<- V0_a_plist]))/binary,
		V0_b_bet:32, V0_b_rid:32,
		(protocol:pack(string, V0_b_srv_id))/binary,
		(protocol:pack(string, V0_b_name))/binary, V0_b_lev:16,
		V0_b_face:32, V0_b_face_update_time:32,
		(protocol:pack(string, V0_b_face_file))/binary,
		V0_b_avatar_id:32, V0_b_sex:8, V0_b_power:32,
		V0_b_formation_type:8, V0_b_formation_lev:8,
		(length(V0_b_plist)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_quality:8, V1_star:8, V1_break_lev:8,
				   V1_hurt:32, V1_behurt:32, V1_curt:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || #{pos := V1_pos, bid := V1_bid,
				      lev := V1_lev, quality := V1_quality,
				      star := V1_star,
				      break_lev := V1_break_lev,
				      hurt := V1_hurt, behurt := V1_behurt,
				      curt := V1_curt, ext_data := V1_ext_data}
					<- V0_b_plist]))/binary,
		V0_ret:8, V0_replay_id:32, V0_a_sprite_lev:16,
		(length(V0_a_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_a_sprites]))/binary,
		V0_b_sprite_lev:16, (length(V0_b_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_b_sprites]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20253:16,
       D_a_t_a/binary>>};
pack(20254, cli, {V0_bet_type, V0_bet_val}) ->
    D_a_t_a = <<V0_bet_type:8, V0_bet_val:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20254:16,
       D_a_t_a/binary>>};
pack(20254, srv,
     {V0_code, V0_msg, V0_can_bet, V0_bet_type,
      V0_bet_val}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_can_bet:32,
		V0_bet_type:8, V0_bet_val:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20254:16,
       D_a_t_a/binary>>};
pack(20255, cli, {}) -> {ok, <<2:32, 20255:16>>};
pack(20255, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:16, V1_target:8, V1_bet:32,
				   V1_get_bet:32, V1_step:8, V1_round:8,
				   V1_group:8, V1_a_bet:32, V1_a_rid:32,
				   (protocol:pack(string, V1_a_srv_id))/binary,
				   (protocol:pack(string, V1_a_name))/binary,
				   V1_a_lev:16, V1_a_face:32,
				   V1_a_face_update_time:32,
				   (protocol:pack(string,
						  V1_a_face_file))/binary,
				   V1_a_avatar_id:32, V1_a_sex:8, V1_a_power:32,
				   V1_a_formation_type:8, V1_a_formation_lev:8,
				   (length(V1_a_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_quality:8,
						      V2_star:8, V2_break_lev:8,
						      V2_hurt:32, V2_behurt:32,
						      V2_curt:32,
						      (length(V2_ext_data)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext_data]))/binary>>
						    || #{pos := V2_pos,
							 bid := V2_bid,
							 lev := V2_lev,
							 quality := V2_quality,
							 star := V2_star,
							 break_lev :=
							     V2_break_lev,
							 hurt := V2_hurt,
							 behurt := V2_behurt,
							 curt := V2_curt,
							 ext_data :=
							     V2_ext_data}
							   <- V1_a_plist]))/binary,
				   V1_b_bet:32, V1_b_rid:32,
				   (protocol:pack(string, V1_b_srv_id))/binary,
				   (protocol:pack(string, V1_b_name))/binary,
				   V1_b_lev:16, V1_b_face:32,
				   V1_b_face_update_time:32,
				   (protocol:pack(string,
						  V1_b_face_file))/binary,
				   V1_b_avatar_id:32, V1_b_sex:8, V1_b_power:32,
				   V1_b_formation_type:8, V1_b_formation_lev:8,
				   (length(V1_b_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_quality:8,
						      V2_star:8, V2_break_lev:8,
						      V2_hurt:32, V2_behurt:32,
						      V2_curt:32,
						      (length(V2_ext_data)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext_data]))/binary>>
						    || #{pos := V2_pos,
							 bid := V2_bid,
							 lev := V2_lev,
							 quality := V2_quality,
							 star := V2_star,
							 break_lev :=
							     V2_break_lev,
							 hurt := V2_hurt,
							 behurt := V2_behurt,
							 curt := V2_curt,
							 ext_data :=
							     V2_ext_data}
							   <- V1_b_plist]))/binary,
				   V1_ret:8, V1_replay_id:32,
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
				 || {V1_id, V1_target, V1_bet, V1_get_bet,
				     #champion_pk{step = V1_step,
						  round = V1_round,
						  group = V1_group,
						  a_bet = V1_a_bet,
						  a_id =
						      {V1_a_rid, V1_a_srv_id},
						  a_name = V1_a_name,
						  a_lev = V1_a_lev,
						  a_face = V1_a_face,
						  a_face_update_time =
						      V1_a_face_update_time,
						  a_face_file = V1_a_face_file,
						  a_avatar_id = V1_a_avatar_id,
						  a_sex = V1_a_sex,
						  a_power = V1_a_power,
						  a_formation_type =
						      V1_a_formation_type,
						  a_formation_lev =
						      V1_a_formation_lev,
						  a_plist = V1_a_plist,
						  b_bet = V1_b_bet,
						  b_id =
						      {V1_b_rid, V1_b_srv_id},
						  b_name = V1_b_name,
						  b_lev = V1_b_lev,
						  b_face = V1_b_face,
						  b_face_update_time =
						      V1_b_face_update_time,
						  b_face_file = V1_b_face_file,
						  b_avatar_id = V1_b_avatar_id,
						  b_sex = V1_b_sex,
						  b_power = V1_b_power,
						  b_formation_type =
						      V1_b_formation_type,
						  b_formation_lev =
						      V1_b_formation_lev,
						  b_plist = V1_b_plist,
						  ret = V1_ret,
						  replay_id = V1_replay_id,
						  a_sprite_lev =
						      V1_a_sprite_lev,
						  a_sprites = V1_a_sprites,
						  b_sprite_lev =
						      V1_b_sprite_lev,
						  b_sprites = V1_b_sprites}}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20255:16,
       D_a_t_a/binary>>};
pack(20256, cli, {}) -> {ok, <<2:32, 20256:16>>};
pack(20256, srv, {V0_rank, V0_cnum, V0_win}) ->
    D_a_t_a = <<V0_rank:16, V0_cnum:8, V0_win:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20256:16,
       D_a_t_a/binary>>};
pack(20257, srv,
     {V0_a_bet, V0_b_bet, V0_a_bet_ratio, V0_b_bet_ratio}) ->
    D_a_t_a = <<V0_a_bet:32, V0_b_bet:32, V0_a_bet_ratio:16,
		V0_b_bet_ratio:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20257:16,
       D_a_t_a/binary>>};
pack(20258, cli, {}) -> {ok, <<2:32, 20258:16>>};
pack(20258, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:16, V1_score:16, V1_step:8,
				   V1_round:8, V1_group:8, V1_a_bet:32,
				   V1_a_rid:32,
				   (protocol:pack(string, V1_a_srv_id))/binary,
				   (protocol:pack(string, V1_a_name))/binary,
				   V1_a_lev:16, V1_a_face:32,
				   V1_a_face_update_time:32,
				   (protocol:pack(string,
						  V1_a_face_file))/binary,
				   V1_a_avatar_id:32, V1_a_sex:8, V1_a_power:32,
				   V1_a_formation_type:8, V1_a_formation_lev:8,
				   (length(V1_a_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_quality:8,
						      V2_star:8, V2_break_lev:8,
						      V2_hurt:32, V2_behurt:32,
						      V2_curt:32,
						      (length(V2_ext_data)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext_data]))/binary>>
						    || #{pos := V2_pos,
							 bid := V2_bid,
							 lev := V2_lev,
							 quality := V2_quality,
							 star := V2_star,
							 break_lev :=
							     V2_break_lev,
							 hurt := V2_hurt,
							 behurt := V2_behurt,
							 curt := V2_curt,
							 ext_data :=
							     V2_ext_data}
							   <- V1_a_plist]))/binary,
				   V1_b_bet:32, V1_b_rid:32,
				   (protocol:pack(string, V1_b_srv_id))/binary,
				   (protocol:pack(string, V1_b_name))/binary,
				   V1_b_lev:16, V1_b_face:32,
				   V1_b_face_update_time:32,
				   (protocol:pack(string,
						  V1_b_face_file))/binary,
				   V1_b_avatar_id:32, V1_b_sex:8, V1_b_power:32,
				   V1_b_formation_type:8, V1_b_formation_lev:8,
				   (length(V1_b_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_quality:8,
						      V2_star:8, V2_break_lev:8,
						      V2_hurt:32, V2_behurt:32,
						      V2_curt:32,
						      (length(V2_ext_data)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext_data]))/binary>>
						    || #{pos := V2_pos,
							 bid := V2_bid,
							 lev := V2_lev,
							 quality := V2_quality,
							 star := V2_star,
							 break_lev :=
							     V2_break_lev,
							 hurt := V2_hurt,
							 behurt := V2_behurt,
							 curt := V2_curt,
							 ext_data :=
							     V2_ext_data}
							   <- V1_b_plist]))/binary,
				   V1_ret:8, V1_replay_id:32,
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
				 || {V1_id, V1_score,
				     #champion_pk{step = V1_step,
						  round = V1_round,
						  group = V1_group,
						  a_bet = V1_a_bet,
						  a_id =
						      {V1_a_rid, V1_a_srv_id},
						  a_name = V1_a_name,
						  a_lev = V1_a_lev,
						  a_face = V1_a_face,
						  a_face_update_time =
						      V1_a_face_update_time,
						  a_face_file = V1_a_face_file,
						  a_avatar_id = V1_a_avatar_id,
						  a_sex = V1_a_sex,
						  a_power = V1_a_power,
						  a_formation_type =
						      V1_a_formation_type,
						  a_formation_lev =
						      V1_a_formation_lev,
						  a_plist = V1_a_plist,
						  b_bet = V1_b_bet,
						  b_id =
						      {V1_b_rid, V1_b_srv_id},
						  b_name = V1_b_name,
						  b_lev = V1_b_lev,
						  b_face = V1_b_face,
						  b_face_update_time =
						      V1_b_face_update_time,
						  b_face_file = V1_b_face_file,
						  b_avatar_id = V1_b_avatar_id,
						  b_sex = V1_b_sex,
						  b_power = V1_b_power,
						  b_formation_type =
						      V1_b_formation_type,
						  b_formation_lev =
						      V1_b_formation_lev,
						  b_plist = V1_b_plist,
						  ret = V1_ret,
						  replay_id = V1_replay_id,
						  a_sprite_lev =
						      V1_a_sprite_lev,
						  a_sprites = V1_a_sprites,
						  b_sprite_lev =
						      V1_b_sprite_lev,
						  b_sprites = V1_b_sprites}}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20258:16,
       D_a_t_a/binary>>};
pack(20260, cli, {}) -> {ok, <<2:32, 20260:16>>};
pack(20260, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_group:8, (length(V1_pos_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_rid:32,
						      (protocol:pack(string,
								     V2_srv_id))/binary,
						      (protocol:pack(string,
								     V2_name))/binary,
						      V2_ret:8,
						      V2_replay_id:32>>
						    || #champion_32_pk{pos =
									   V2_pos,
								       id =
									   {V2_rid,
									    V2_srv_id},
								       name =
									   V2_name,
								       ret =
									   V2_ret,
								       replay_id
									   =
									   V2_replay_id}
							   <- V1_pos_list]))/binary>>
				 || {V1_group, V1_pos_list}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20260:16,
       D_a_t_a/binary>>};
pack(20261, cli, {}) -> {ok, <<2:32, 20261:16>>};
pack(20261, srv, {V0_pos_list}) ->
    D_a_t_a = <<(length(V0_pos_list)):16,
		(list_to_binary([<<V1_pos:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face:32, V1_ret:8, V1_replay_id:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #champion_32_pk{pos = V1_pos,
						    id = {V1_rid, V1_srv_id},
						    name = V1_name,
						    face = V1_face,
						    ret = V1_ret,
						    replay_id = V1_replay_id,
						    face_update_time =
							V1_face_update_time,
						    face_file = V1_face_file}
					<- V0_pos_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20261:16,
       D_a_t_a/binary>>};
pack(20262, cli, {}) -> {ok, <<2:32, 20262:16>>};
pack(20262, srv, {V0_group, V0_pos}) ->
    D_a_t_a = <<V0_group:8, V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20262:16,
       D_a_t_a/binary>>};
pack(20263, cli, {V0_group, V0_pos}) ->
    D_a_t_a = <<V0_group:8, V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20263:16,
       D_a_t_a/binary>>};
pack(20263, srv,
     #champion_pk{step = V0_step, round = V0_round,
		  group = V0_group, a_bet = V0_a_bet,
		  a_id = {V0_a_rid, V0_a_srv_id}, a_name = V0_a_name,
		  a_lev = V0_a_lev, a_face = V0_a_face,
		  a_face_update_time = V0_a_face_update_time,
		  a_face_file = V0_a_face_file,
		  a_avatar_id = V0_a_avatar_id, a_sex = V0_a_sex,
		  a_power = V0_a_power,
		  a_formation_type = V0_a_formation_type,
		  a_formation_lev = V0_a_formation_lev,
		  a_plist = V0_a_plist, b_bet = V0_b_bet,
		  b_id = {V0_b_rid, V0_b_srv_id}, b_name = V0_b_name,
		  b_lev = V0_b_lev, b_face = V0_b_face,
		  b_face_update_time = V0_b_face_update_time,
		  b_face_file = V0_b_face_file,
		  b_avatar_id = V0_b_avatar_id, b_sex = V0_b_sex,
		  b_power = V0_b_power,
		  b_formation_type = V0_b_formation_type,
		  b_formation_lev = V0_b_formation_lev,
		  b_plist = V0_b_plist, ret = V0_ret,
		  replay_id = V0_replay_id,
		  a_sprite_lev = V0_a_sprite_lev,
		  a_sprites = V0_a_sprites,
		  b_sprite_lev = V0_b_sprite_lev,
		  b_sprites = V0_b_sprites}) ->
    D_a_t_a = <<V0_step:8, V0_round:8, V0_group:8,
		V0_a_bet:32, V0_a_rid:32,
		(protocol:pack(string, V0_a_srv_id))/binary,
		(protocol:pack(string, V0_a_name))/binary, V0_a_lev:16,
		V0_a_face:32, V0_a_face_update_time:32,
		(protocol:pack(string, V0_a_face_file))/binary,
		V0_a_avatar_id:32, V0_a_sex:8, V0_a_power:32,
		V0_a_formation_type:8, V0_a_formation_lev:8,
		(length(V0_a_plist)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_quality:8, V1_star:8, V1_break_lev:8,
				   V1_hurt:32, V1_behurt:32, V1_curt:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || #{pos := V1_pos, bid := V1_bid,
				      lev := V1_lev, quality := V1_quality,
				      star := V1_star,
				      break_lev := V1_break_lev,
				      hurt := V1_hurt, behurt := V1_behurt,
				      curt := V1_curt, ext_data := V1_ext_data}
					<- V0_a_plist]))/binary,
		V0_b_bet:32, V0_b_rid:32,
		(protocol:pack(string, V0_b_srv_id))/binary,
		(protocol:pack(string, V0_b_name))/binary, V0_b_lev:16,
		V0_b_face:32, V0_b_face_update_time:32,
		(protocol:pack(string, V0_b_face_file))/binary,
		V0_b_avatar_id:32, V0_b_sex:8, V0_b_power:32,
		V0_b_formation_type:8, V0_b_formation_lev:8,
		(length(V0_b_plist)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_quality:8, V1_star:8, V1_break_lev:8,
				   V1_hurt:32, V1_behurt:32, V1_curt:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || #{pos := V1_pos, bid := V1_bid,
				      lev := V1_lev, quality := V1_quality,
				      star := V1_star,
				      break_lev := V1_break_lev,
				      hurt := V1_hurt, behurt := V1_behurt,
				      curt := V1_curt, ext_data := V1_ext_data}
					<- V0_b_plist]))/binary,
		V0_ret:8, V0_replay_id:32, V0_a_sprite_lev:16,
		(length(V0_a_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_a_sprites]))/binary,
		V0_b_sprite_lev:16, (length(V0_b_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_b_sprites]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20263:16,
       D_a_t_a/binary>>};
pack(20280, cli, {}) -> {ok, <<2:32, 20280:16>>};
pack(20280, srv, {V0_rank_list}) ->
    D_a_t_a = <<(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_rank:8, V1_sex:8, V1_lookid:32,
				   V1_worship:32, V1_worship_status:8>>
				 || {#arena_champion_role{id =
							      {V1_rid,
							       V1_srv_id},
							  name = V1_name,
							  lev = V1_lev,
							  rank = V1_rank,
							  sex = V1_sex,
							  lookid = V1_lookid},
				     V1_worship, V1_worship_status}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20280:16,
       D_a_t_a/binary>>};
pack(20281, cli, {}) -> {ok, <<2:32, 20281:16>>};
pack(20281, srv,
     {V0_rank, V0_worship, V0_power, V0_rank_list}) ->
    D_a_t_a = <<V0_rank:16, V0_worship:32, V0_power:32,
		(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_sex:8, V1_rank:16,
				   V1_score:16, V1_power:32,
				   V1_face_update_time:32,
				   (protocol:pack(string, V1_face_file))/binary,
				   V1_worship:32, V1_worship_status:8>>
				 || {#arena_champion_role{id =
							      {V1_rid,
							       V1_srv_id},
							  name = V1_name,
							  lev = V1_lev,
							  face = V1_face,
							  sex = V1_sex,
							  rank = V1_rank,
							  score = V1_score,
							  max_power = V1_power,
							  face_update_time =
							      V1_face_update_time,
							  face_file =
							      V1_face_file},
				     V1_worship, V1_worship_status}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20281:16,
       D_a_t_a/binary>>};
pack(20282, srv, {V0_time, V0_rank_list}) ->
    D_a_t_a = <<V0_time:32, (length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_sex:8, V1_rank:16,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {#arena_champion_role{id =
							      {V1_rid,
							       V1_srv_id},
							  name = V1_name,
							  lev = V1_lev,
							  face = V1_face,
							  sex = V1_sex,
							  rank = V1_rank,
							  face_update_time =
							      V1_face_update_time,
							  face_file =
							      V1_face_file}}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20282:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(20200, srv, _B0) -> {ok, {}};
unpack(20200, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_can_combat_num, _B3} = protocol:uint8(_B2),
    {V1_buy_combat_num, _B4} = protocol:uint8(_B3),
    {V1_ref_time, _B5} = protocol:int32(_B4),
    {V1_start_time, _B6} = protocol:uint32(_B5),
    {V1_end_time, _B7} = protocol:uint32(_B6),
    {V1_cont_win, _B8} = protocol:uint16(_B7),
    {ok,
     {V1_rank, V1_score, V1_can_combat_num,
      V1_buy_combat_num, V1_ref_time, V1_start_time,
      V1_end_time, V1_cont_win}};
unpack(20201, srv, _B0) -> {ok, {}};
unpack(20201, cli, _B0) ->
    {V1_f_list, _B29} = protocol:array(_B0,
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
					       {V2_power, _B9} =
						   protocol:uint32(_B8),
					       {V2_score, _B10} =
						   protocol:uint32(_B9),
					       {V2_get_score, _B11} =
						   protocol:uint8(_B10),
					       {V2_status, _B12} =
						   protocol:uint8(_B11),
					       {V2_p_list, _B22} =
						   protocol:array(_B12,
								  fun (_B13) ->
									  {V3_pos,
									   _B14} =
									      protocol:uint8(_B13),
									  {V3_bid,
									   _B15} =
									      protocol:uint32(_B14),
									  {V3_lev,
									   _B16} =
									      protocol:uint16(_B15),
									  {V3_star,
									   _B17} =
									      protocol:uint8(_B16),
									  {V3_break_lev,
									   _B18} =
									      protocol:uint8(_B17),
									  {V3_use_skin,
									   _B19} =
									      protocol:uint32(_B18),
									  {V3_resonate_lev,
									   _B20} =
									      protocol:uint32(_B19),
									  {{V3_pos,
									    V3_bid,
									    V3_lev,
									    V3_star,
									    V3_break_lev,
									    V3_use_skin,
									    V3_resonate_lev},
									   _B20}
								  end),
					       {V2_face_update_time, _B23} =
						   protocol:uint32(_B22),
					       {V2_face_file, _B24} =
						   protocol:string(_B23),
					       {V2_gid, _B25} =
						   protocol:uint32(_B24),
					       {V2_gsrv_id, _B26} =
						   protocol:string(_B25),
					       {V2_gname, _B27} =
						   protocol:string(_B26),
					       {{V2_idx, V2_rid, V2_srv_id,
						 V2_name, V2_lev, V2_sex,
						 V2_face, V2_power, V2_score,
						 V2_get_score, V2_status,
						 V2_p_list, V2_face_update_time,
						 V2_face_file, V2_gid,
						 V2_gsrv_id, V2_gname},
						_B27}
				       end),
    {V1_type, _B30} = protocol:uint8(_B29),
    {ok, {V1_f_list, V1_type}};
unpack(20202, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(20202, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_lev, _B4} = protocol:uint16(_B3),
    {V1_face, _B5} = protocol:uint32(_B4),
    {V1_power, _B6} = protocol:uint32(_B5),
    {V1_score, _B7} = protocol:uint32(_B6),
    {V1_formation_type, _B8} = protocol:uint8(_B7),
    {V1_formation_lev, _B9} = protocol:uint8(_B8),
    {V1_p_list, _B20} = protocol:array(_B9,
				       fun (_B10) ->
					       {V2_pos, _B11} =
						   protocol:uint8(_B10),
					       {V2_bid, _B12} =
						   protocol:uint32(_B11),
					       {V2_lev, _B13} =
						   protocol:uint16(_B12),
					       {V2_quality, _B14} =
						   protocol:uint8(_B13),
					       {V2_star, _B15} =
						   protocol:uint8(_B14),
					       {V2_break_lev, _B16} =
						   protocol:uint8(_B15),
					       {V2_use_skin, _B17} =
						   protocol:uint32(_B16),
					       {V2_resonate_lev, _B18} =
						   protocol:uint32(_B17),
					       {{V2_pos, V2_bid, V2_lev,
						 V2_quality, V2_star,
						 V2_break_lev, V2_use_skin,
						 V2_resonate_lev},
						_B18}
				       end),
    {V1_face_update_time, _B21} = protocol:uint32(_B20),
    {V1_face_file, _B22} = protocol:string(_B21),
    {V1_gid, _B23} = protocol:uint32(_B22),
    {V1_gsrv_id, _B24} = protocol:string(_B23),
    {V1_gname, _B25} = protocol:string(_B24),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_lev, V1_face, V1_power,
      V1_score, V1_formation_type, V1_formation_lev,
      V1_p_list, V1_face_update_time, V1_face_file, V1_gid,
      V1_gsrv_id, V1_gname}};
unpack(20203, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_is_auto, _B3} = protocol:uint8(_B2),
    {ok, {V1_rid, V1_srv_id, V1_is_auto}};
unpack(20203, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20204, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_pos, _B3} = protocol:uint8(_B2),
    {ok, {V1_rid, V1_srv_id, V1_pos}};
unpack(20204, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20206, srv, _B0) -> {ok, {}};
unpack(20206, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20207, srv, _B0) ->
    {V1_num, _B1} = protocol:uint16(_B0), {ok, {V1_num}};
unpack(20207, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20208, srv, _B0) -> {ok, {}};
unpack(20208, cli, _B0) ->
    {V1_had_combat_num, _B1} = protocol:uint16(_B0),
    {V1_num_list, _B5} = protocol:array(_B1,
					fun (_B2) ->
						{V2_num, _B3} =
						    protocol:uint8(_B2),
						{V2_num, _B3}
					end),
    {ok, {V1_had_combat_num, V1_num_list}};
unpack(20209, srv, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0), {ok, {V1_num}};
unpack(20209, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20210, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_get_score, _B3} = protocol:int32(_B2),
    {V1_items, _B8} = protocol:array(_B3,
				     fun (_B4) ->
					     {V2_bid, _B5} =
						 protocol:uint32(_B4),
					     {V2_num, _B6} =
						 protocol:uint32(_B5),
					     {{V2_bid, V2_num}, _B6}
				     end),
    {V1_tar_name, _B9} = protocol:string(_B8),
    {V1_tar_lev, _B10} = protocol:uint16(_B9),
    {V1_tar_face, _B11} = protocol:uint32(_B10),
    {V1_face_update_time, _B12} = protocol:uint32(_B11),
    {V1_face_file, _B13} = protocol:string(_B12),
    {V1_tar_score, _B14} = protocol:int32(_B13),
    {V1_lose_score, _B15} = protocol:int32(_B14),
    {V1_target_role_name, _B16} = protocol:string(_B15),
    {V1_hurt_statistics, _B38} = protocol:array(_B16,
						fun (_B17) ->
							{V2_type, _B18} =
							    protocol:uint8(_B17),
							{V2_partner_hurts,
							 _B36} =
							    protocol:array(_B18,
									   fun
									     (_B19) ->
										 {V3_rid,
										  _B20} =
										     protocol:uint32(_B19),
										 {V3_srvid,
										  _B21} =
										     protocol:string(_B20),
										 {V3_id,
										  _B22} =
										     protocol:uint32(_B21),
										 {V3_bid,
										  _B23} =
										     protocol:uint32(_B22),
										 {V3_star,
										  _B24} =
										     protocol:uint32(_B23),
										 {V3_lev,
										  _B25} =
										     protocol:uint32(_B24),
										 {V3_camp_type,
										  _B26} =
										     protocol:uint32(_B25),
										 {V3_dps,
										  _B27} =
										     protocol:uint32(_B26),
										 {V3_cure,
										  _B28} =
										     protocol:uint32(_B27),
										 {V3_ext_data,
										  _B33} =
										     protocol:array(_B28,
												    fun
												      (_B29) ->
													  {V4_key,
													   _B30} =
													      protocol:uint32(_B29),
													  {V4_val,
													   _B31} =
													      protocol:uint32(_B30),
													  {{V4_key,
													    V4_val},
													   _B31}
												    end),
										 {V3_be_hurt,
										  _B34} =
										     protocol:uint32(_B33),
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
										  _B34}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B36}
						end),
    {V1_replay_id, _B39} = protocol:uint32(_B38),
    {ok,
     {V1_result, V1_score, V1_get_score, V1_items,
      V1_tar_name, V1_tar_lev, V1_tar_face,
      V1_face_update_time, V1_face_file, V1_tar_score,
      V1_lose_score, V1_target_role_name, V1_hurt_statistics,
      V1_replay_id}};
unpack(20220, srv, _B0) -> {ok, {}};
unpack(20220, cli, _B0) ->
    {V1_rank_list, _B15} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_rid, _B2} =
						      protocol:uint32(_B1),
						  {V2_srv_id, _B3} =
						      protocol:string(_B2),
						  {V2_name, _B4} =
						      protocol:string(_B3),
						  {V2_lev, _B5} =
						      protocol:uint16(_B4),
						  {V2_rank, _B6} =
						      protocol:uint8(_B5),
						  {V2_score, _B7} =
						      protocol:uint32(_B6),
						  {V2_sex, _B8} =
						      protocol:uint8(_B7),
						  {V2_lookid, _B9} =
						      protocol:uint32(_B8),
						  {V2_face_update_time, _B10} =
						      protocol:uint32(_B9),
						  {V2_face_file, _B11} =
						      protocol:string(_B10),
						  {V2_worship, _B12} =
						      protocol:uint32(_B11),
						  {V2_worship_status, _B13} =
						      protocol:uint8(_B12),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_lev, V2_rank, V2_score,
						    V2_sex, V2_lookid,
						    V2_face_update_time,
						    V2_face_file, V2_worship,
						    V2_worship_status},
						   _B13}
					  end),
    {ok, {V1_rank_list}};
unpack(20221, srv, _B0) -> {ok, {}};
unpack(20221, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_worship, _B3} = protocol:uint32(_B2),
    {V1_rank_list, _B21} = protocol:array(_B3,
					  fun (_B4) ->
						  {V2_rid, _B5} =
						      protocol:uint32(_B4),
						  {V2_srv_id, _B6} =
						      protocol:string(_B5),
						  {V2_name, _B7} =
						      protocol:string(_B6),
						  {V2_lev, _B8} =
						      protocol:uint16(_B7),
						  {V2_face, _B9} =
						      protocol:uint32(_B8),
						  {V2_sex, _B10} =
						      protocol:uint8(_B9),
						  {V2_rank, _B11} =
						      protocol:uint16(_B10),
						  {V2_score, _B12} =
						      protocol:uint32(_B11),
						  {V2_power, _B13} =
						      protocol:uint32(_B12),
						  {V2_avatar_id, _B14} =
						      protocol:uint32(_B13),
						  {V2_lookid, _B15} =
						      protocol:uint32(_B14),
						  {V2_face_update_time, _B16} =
						      protocol:uint32(_B15),
						  {V2_face_file, _B17} =
						      protocol:string(_B16),
						  {V2_worship, _B18} =
						      protocol:uint32(_B17),
						  {V2_worship_status, _B19} =
						      protocol:uint8(_B18),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_lev, V2_face, V2_sex,
						    V2_rank, V2_score, V2_power,
						    V2_avatar_id, V2_lookid,
						    V2_face_update_time,
						    V2_face_file, V2_worship,
						    V2_worship_status},
						   _B19}
					  end),
    {ok, {V1_rank, V1_score, V1_worship, V1_rank_list}};
unpack(20222, srv, _B0) -> {ok, {}};
unpack(20222, cli, _B0) ->
    {V1_log_list, _B18} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_rid, _B2} =
						     protocol:uint32(_B1),
						 {V2_srv_id, _B3} =
						     protocol:string(_B2),
						 {V2_name, _B4} =
						     protocol:string(_B3),
						 {V2_lev, _B5} =
						     protocol:uint16(_B4),
						 {V2_sex, _B6} =
						     protocol:uint8(_B5),
						 {V2_face, _B7} =
						     protocol:uint32(_B6),
						 {V2_avatar_id, _B8} =
						     protocol:uint32(_B7),
						 {V2_power, _B9} =
						     protocol:uint32(_B8),
						 {V2_score, _B10} =
						     protocol:int16(_B9),
						 {V2_type, _B11} =
						     protocol:uint8(_B10),
						 {V2_ret, _B12} =
						     protocol:uint8(_B11),
						 {V2_replay_id, _B13} =
						     protocol:uint32(_B12),
						 {V2_time, _B14} =
						     protocol:uint32(_B13),
						 {V2_face_update_time, _B15} =
						     protocol:uint32(_B14),
						 {V2_face_file, _B16} =
						     protocol:string(_B15),
						 {{V2_rid, V2_srv_id, V2_name,
						   V2_lev, V2_sex, V2_face,
						   V2_avatar_id, V2_power,
						   V2_score, V2_type, V2_ret,
						   V2_replay_id, V2_time,
						   V2_face_update_time,
						   V2_face_file},
						  _B16}
					 end),
    {ok, {V1_log_list}};
unpack(20223, srv, _B0) -> {ok, {}};
unpack(20223, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(20250, srv, _B0) -> {ok, {}};
unpack(20250, cli, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_step, _B3} = protocol:uint8(_B2),
    {V1_step_status, _B4} = protocol:uint8(_B3),
    {V1_step_status_time, _B5} = protocol:uint32(_B4),
    {V1_round, _B6} = protocol:uint8(_B5),
    {V1_round_status, _B7} = protocol:uint8(_B6),
    {V1_round_status_time, _B8} = protocol:uint32(_B7),
    {V1_flag, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_start_time, V1_end_time, V1_step, V1_step_status,
      V1_step_status_time, V1_round, V1_round_status,
      V1_round_status_time, V1_flag}};
unpack(20251, srv, _B0) -> {ok, {}};
unpack(20251, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_best_rank, _B2} = protocol:uint16(_B1),
    {V1_can_bet, _B3} = protocol:uint32(_B2),
    {V1_group, _B4} = protocol:uint8(_B3),
    {ok, {V1_rank, V1_best_rank, V1_can_bet, V1_group}};
unpack(20252, srv, _B0) -> {ok, {}};
unpack(20252, cli, _B0) ->
    {V1_step, _B1} = protocol:uint8(_B0),
    {V1_round, _B2} = protocol:uint8(_B1),
    {V1_group, _B3} = protocol:uint8(_B2),
    {V1_a_bet, _B4} = protocol:uint32(_B3),
    {V1_a_rid, _B5} = protocol:uint32(_B4),
    {V1_a_srv_id, _B6} = protocol:string(_B5),
    {V1_a_name, _B7} = protocol:string(_B6),
    {V1_a_lev, _B8} = protocol:uint16(_B7),
    {V1_a_face, _B9} = protocol:uint32(_B8),
    {V1_a_face_update_time, _B10} = protocol:uint32(_B9),
    {V1_a_face_file, _B11} = protocol:string(_B10),
    {V1_a_avatar_id, _B12} = protocol:uint32(_B11),
    {V1_a_sex, _B13} = protocol:uint8(_B12),
    {V1_a_power, _B14} = protocol:uint32(_B13),
    {V1_a_formation_type, _B15} = protocol:uint8(_B14),
    {V1_a_formation_lev, _B16} = protocol:uint8(_B15),
    {V1_a_plist, _B33} = protocol:array(_B16,
					fun (_B17) ->
						{V2_pos, _B18} =
						    protocol:uint8(_B17),
						{V2_bid, _B19} =
						    protocol:uint32(_B18),
						{V2_lev, _B20} =
						    protocol:uint16(_B19),
						{V2_quality, _B21} =
						    protocol:uint8(_B20),
						{V2_star, _B22} =
						    protocol:uint8(_B21),
						{V2_break_lev, _B23} =
						    protocol:uint8(_B22),
						{V2_hurt, _B24} =
						    protocol:uint32(_B23),
						{V2_behurt, _B25} =
						    protocol:uint32(_B24),
						{V2_curt, _B26} =
						    protocol:uint32(_B25),
						{V2_ext_data, _B31} =
						    protocol:array(_B26,
								   fun (_B27) ->
									   {V3_key,
									    _B28} =
									       protocol:uint32(_B27),
									   {V3_val,
									    _B29} =
									       protocol:uint32(_B28),
									   {{V3_key,
									     V3_val},
									    _B29}
								   end),
						{{V2_pos, V2_bid, V2_lev,
						  V2_quality, V2_star,
						  V2_break_lev, V2_hurt,
						  V2_behurt, V2_curt,
						  V2_ext_data},
						 _B31}
					end),
    {V1_b_bet, _B34} = protocol:uint32(_B33),
    {V1_b_rid, _B35} = protocol:uint32(_B34),
    {V1_b_srv_id, _B36} = protocol:string(_B35),
    {V1_b_name, _B37} = protocol:string(_B36),
    {V1_b_lev, _B38} = protocol:uint16(_B37),
    {V1_b_face, _B39} = protocol:uint32(_B38),
    {V1_b_face_update_time, _B40} = protocol:uint32(_B39),
    {V1_b_face_file, _B41} = protocol:string(_B40),
    {V1_b_avatar_id, _B42} = protocol:uint32(_B41),
    {V1_b_sex, _B43} = protocol:uint8(_B42),
    {V1_b_power, _B44} = protocol:uint32(_B43),
    {V1_b_formation_type, _B45} = protocol:uint8(_B44),
    {V1_b_formation_lev, _B46} = protocol:uint8(_B45),
    {V1_b_plist, _B63} = protocol:array(_B46,
					fun (_B47) ->
						{V2_pos, _B48} =
						    protocol:uint8(_B47),
						{V2_bid, _B49} =
						    protocol:uint32(_B48),
						{V2_lev, _B50} =
						    protocol:uint16(_B49),
						{V2_quality, _B51} =
						    protocol:uint8(_B50),
						{V2_star, _B52} =
						    protocol:uint8(_B51),
						{V2_break_lev, _B53} =
						    protocol:uint8(_B52),
						{V2_hurt, _B54} =
						    protocol:uint32(_B53),
						{V2_behurt, _B55} =
						    protocol:uint32(_B54),
						{V2_curt, _B56} =
						    protocol:uint32(_B55),
						{V2_ext_data, _B61} =
						    protocol:array(_B56,
								   fun (_B57) ->
									   {V3_key,
									    _B58} =
									       protocol:uint32(_B57),
									   {V3_val,
									    _B59} =
									       protocol:uint32(_B58),
									   {{V3_key,
									     V3_val},
									    _B59}
								   end),
						{{V2_pos, V2_bid, V2_lev,
						  V2_quality, V2_star,
						  V2_break_lev, V2_hurt,
						  V2_behurt, V2_curt,
						  V2_ext_data},
						 _B61}
					end),
    {V1_ret, _B64} = protocol:uint8(_B63),
    {V1_replay_id, _B65} = protocol:uint32(_B64),
    {V1_a_sprite_lev, _B66} = protocol:uint16(_B65),
    {V1_a_sprites, _B71} = protocol:array(_B66,
					  fun (_B67) ->
						  {V2_pos, _B68} =
						      protocol:uint8(_B67),
						  {V2_item_bid, _B69} =
						      protocol:uint32(_B68),
						  {{V2_pos, V2_item_bid}, _B69}
					  end),
    {V1_b_sprite_lev, _B72} = protocol:uint16(_B71),
    {V1_b_sprites, _B77} = protocol:array(_B72,
					  fun (_B73) ->
						  {V2_pos, _B74} =
						      protocol:uint8(_B73),
						  {V2_item_bid, _B75} =
						      protocol:uint32(_B74),
						  {{V2_pos, V2_item_bid}, _B75}
					  end),
    {ok,
     {V1_step, V1_round, V1_group, V1_a_bet, V1_a_rid,
      V1_a_srv_id, V1_a_name, V1_a_lev, V1_a_face,
      V1_a_face_update_time, V1_a_face_file, V1_a_avatar_id,
      V1_a_sex, V1_a_power, V1_a_formation_type,
      V1_a_formation_lev, V1_a_plist, V1_b_bet, V1_b_rid,
      V1_b_srv_id, V1_b_name, V1_b_lev, V1_b_face,
      V1_b_face_update_time, V1_b_face_file, V1_b_avatar_id,
      V1_b_sex, V1_b_power, V1_b_formation_type,
      V1_b_formation_lev, V1_b_plist, V1_ret, V1_replay_id,
      V1_a_sprite_lev, V1_a_sprites, V1_b_sprite_lev,
      V1_b_sprites}};
unpack(20253, srv, _B0) -> {ok, {}};
unpack(20253, cli, _B0) ->
    {V1_bet_type, _B1} = protocol:uint8(_B0),
    {V1_bet_val, _B2} = protocol:uint32(_B1),
    {V1_a_bet_ratio, _B3} = protocol:uint16(_B2),
    {V1_b_bet_ratio, _B4} = protocol:uint16(_B3),
    {V1_step, _B5} = protocol:uint8(_B4),
    {V1_round, _B6} = protocol:uint8(_B5),
    {V1_group, _B7} = protocol:uint8(_B6),
    {V1_a_bet, _B8} = protocol:uint32(_B7),
    {V1_a_rid, _B9} = protocol:uint32(_B8),
    {V1_a_srv_id, _B10} = protocol:string(_B9),
    {V1_a_name, _B11} = protocol:string(_B10),
    {V1_a_lev, _B12} = protocol:uint16(_B11),
    {V1_a_face, _B13} = protocol:uint32(_B12),
    {V1_a_face_update_time, _B14} = protocol:uint32(_B13),
    {V1_a_face_file, _B15} = protocol:string(_B14),
    {V1_a_avatar_id, _B16} = protocol:uint32(_B15),
    {V1_a_sex, _B17} = protocol:uint8(_B16),
    {V1_a_power, _B18} = protocol:uint32(_B17),
    {V1_a_formation_type, _B19} = protocol:uint8(_B18),
    {V1_a_formation_lev, _B20} = protocol:uint8(_B19),
    {V1_a_plist, _B37} = protocol:array(_B20,
					fun (_B21) ->
						{V2_pos, _B22} =
						    protocol:uint8(_B21),
						{V2_bid, _B23} =
						    protocol:uint32(_B22),
						{V2_lev, _B24} =
						    protocol:uint16(_B23),
						{V2_quality, _B25} =
						    protocol:uint8(_B24),
						{V2_star, _B26} =
						    protocol:uint8(_B25),
						{V2_break_lev, _B27} =
						    protocol:uint8(_B26),
						{V2_hurt, _B28} =
						    protocol:uint32(_B27),
						{V2_behurt, _B29} =
						    protocol:uint32(_B28),
						{V2_curt, _B30} =
						    protocol:uint32(_B29),
						{V2_ext_data, _B35} =
						    protocol:array(_B30,
								   fun (_B31) ->
									   {V3_key,
									    _B32} =
									       protocol:uint32(_B31),
									   {V3_val,
									    _B33} =
									       protocol:uint32(_B32),
									   {{V3_key,
									     V3_val},
									    _B33}
								   end),
						{{V2_pos, V2_bid, V2_lev,
						  V2_quality, V2_star,
						  V2_break_lev, V2_hurt,
						  V2_behurt, V2_curt,
						  V2_ext_data},
						 _B35}
					end),
    {V1_b_bet, _B38} = protocol:uint32(_B37),
    {V1_b_rid, _B39} = protocol:uint32(_B38),
    {V1_b_srv_id, _B40} = protocol:string(_B39),
    {V1_b_name, _B41} = protocol:string(_B40),
    {V1_b_lev, _B42} = protocol:uint16(_B41),
    {V1_b_face, _B43} = protocol:uint32(_B42),
    {V1_b_face_update_time, _B44} = protocol:uint32(_B43),
    {V1_b_face_file, _B45} = protocol:string(_B44),
    {V1_b_avatar_id, _B46} = protocol:uint32(_B45),
    {V1_b_sex, _B47} = protocol:uint8(_B46),
    {V1_b_power, _B48} = protocol:uint32(_B47),
    {V1_b_formation_type, _B49} = protocol:uint8(_B48),
    {V1_b_formation_lev, _B50} = protocol:uint8(_B49),
    {V1_b_plist, _B67} = protocol:array(_B50,
					fun (_B51) ->
						{V2_pos, _B52} =
						    protocol:uint8(_B51),
						{V2_bid, _B53} =
						    protocol:uint32(_B52),
						{V2_lev, _B54} =
						    protocol:uint16(_B53),
						{V2_quality, _B55} =
						    protocol:uint8(_B54),
						{V2_star, _B56} =
						    protocol:uint8(_B55),
						{V2_break_lev, _B57} =
						    protocol:uint8(_B56),
						{V2_hurt, _B58} =
						    protocol:uint32(_B57),
						{V2_behurt, _B59} =
						    protocol:uint32(_B58),
						{V2_curt, _B60} =
						    protocol:uint32(_B59),
						{V2_ext_data, _B65} =
						    protocol:array(_B60,
								   fun (_B61) ->
									   {V3_key,
									    _B62} =
									       protocol:uint32(_B61),
									   {V3_val,
									    _B63} =
									       protocol:uint32(_B62),
									   {{V3_key,
									     V3_val},
									    _B63}
								   end),
						{{V2_pos, V2_bid, V2_lev,
						  V2_quality, V2_star,
						  V2_break_lev, V2_hurt,
						  V2_behurt, V2_curt,
						  V2_ext_data},
						 _B65}
					end),
    {V1_ret, _B68} = protocol:uint8(_B67),
    {V1_replay_id, _B69} = protocol:uint32(_B68),
    {V1_a_sprite_lev, _B70} = protocol:uint16(_B69),
    {V1_a_sprites, _B75} = protocol:array(_B70,
					  fun (_B71) ->
						  {V2_pos, _B72} =
						      protocol:uint8(_B71),
						  {V2_item_bid, _B73} =
						      protocol:uint32(_B72),
						  {{V2_pos, V2_item_bid}, _B73}
					  end),
    {V1_b_sprite_lev, _B76} = protocol:uint16(_B75),
    {V1_b_sprites, _B81} = protocol:array(_B76,
					  fun (_B77) ->
						  {V2_pos, _B78} =
						      protocol:uint8(_B77),
						  {V2_item_bid, _B79} =
						      protocol:uint32(_B78),
						  {{V2_pos, V2_item_bid}, _B79}
					  end),
    {ok,
     {V1_bet_type, V1_bet_val, V1_a_bet_ratio,
      V1_b_bet_ratio, V1_step, V1_round, V1_group, V1_a_bet,
      V1_a_rid, V1_a_srv_id, V1_a_name, V1_a_lev, V1_a_face,
      V1_a_face_update_time, V1_a_face_file, V1_a_avatar_id,
      V1_a_sex, V1_a_power, V1_a_formation_type,
      V1_a_formation_lev, V1_a_plist, V1_b_bet, V1_b_rid,
      V1_b_srv_id, V1_b_name, V1_b_lev, V1_b_face,
      V1_b_face_update_time, V1_b_face_file, V1_b_avatar_id,
      V1_b_sex, V1_b_power, V1_b_formation_type,
      V1_b_formation_lev, V1_b_plist, V1_ret, V1_replay_id,
      V1_a_sprite_lev, V1_a_sprites, V1_b_sprite_lev,
      V1_b_sprites}};
unpack(20254, srv, _B0) ->
    {V1_bet_type, _B1} = protocol:uint8(_B0),
    {V1_bet_val, _B2} = protocol:uint32(_B1),
    {ok, {V1_bet_type, V1_bet_val}};
unpack(20254, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_can_bet, _B3} = protocol:uint32(_B2),
    {V1_bet_type, _B4} = protocol:uint8(_B3),
    {V1_bet_val, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_code, V1_msg, V1_can_bet, V1_bet_type, V1_bet_val}};
unpack(20255, srv, _B0) -> {ok, {}};
unpack(20255, cli, _B0) ->
    {V1_list, _B84} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint16(_B1),
					     {V2_target, _B3} =
						 protocol:uint8(_B2),
					     {V2_bet, _B4} =
						 protocol:uint32(_B3),
					     {V2_get_bet, _B5} =
						 protocol:uint32(_B4),
					     {V2_step, _B6} =
						 protocol:uint8(_B5),
					     {V2_round, _B7} =
						 protocol:uint8(_B6),
					     {V2_group, _B8} =
						 protocol:uint8(_B7),
					     {V2_a_bet, _B9} =
						 protocol:uint32(_B8),
					     {V2_a_rid, _B10} =
						 protocol:uint32(_B9),
					     {V2_a_srv_id, _B11} =
						 protocol:string(_B10),
					     {V2_a_name, _B12} =
						 protocol:string(_B11),
					     {V2_a_lev, _B13} =
						 protocol:uint16(_B12),
					     {V2_a_face, _B14} =
						 protocol:uint32(_B13),
					     {V2_a_face_update_time, _B15} =
						 protocol:uint32(_B14),
					     {V2_a_face_file, _B16} =
						 protocol:string(_B15),
					     {V2_a_avatar_id, _B17} =
						 protocol:uint32(_B16),
					     {V2_a_sex, _B18} =
						 protocol:uint8(_B17),
					     {V2_a_power, _B19} =
						 protocol:uint32(_B18),
					     {V2_a_formation_type, _B20} =
						 protocol:uint8(_B19),
					     {V2_a_formation_lev, _B21} =
						 protocol:uint8(_B20),
					     {V2_a_plist, _B38} =
						 protocol:array(_B21,
								fun (_B22) ->
									{V3_pos,
									 _B23} =
									    protocol:uint8(_B22),
									{V3_bid,
									 _B24} =
									    protocol:uint32(_B23),
									{V3_lev,
									 _B25} =
									    protocol:uint16(_B24),
									{V3_quality,
									 _B26} =
									    protocol:uint8(_B25),
									{V3_star,
									 _B27} =
									    protocol:uint8(_B26),
									{V3_break_lev,
									 _B28} =
									    protocol:uint8(_B27),
									{V3_hurt,
									 _B29} =
									    protocol:uint32(_B28),
									{V3_behurt,
									 _B30} =
									    protocol:uint32(_B29),
									{V3_curt,
									 _B31} =
									    protocol:uint32(_B30),
									{V3_ext_data,
									 _B36} =
									    protocol:array(_B31,
											   fun
											     (_B32) ->
												 {V4_key,
												  _B33} =
												     protocol:uint32(_B32),
												 {V4_val,
												  _B34} =
												     protocol:uint32(_B33),
												 {{V4_key,
												   V4_val},
												  _B34}
											   end),
									{{V3_pos,
									  V3_bid,
									  V3_lev,
									  V3_quality,
									  V3_star,
									  V3_break_lev,
									  V3_hurt,
									  V3_behurt,
									  V3_curt,
									  V3_ext_data},
									 _B36}
								end),
					     {V2_b_bet, _B39} =
						 protocol:uint32(_B38),
					     {V2_b_rid, _B40} =
						 protocol:uint32(_B39),
					     {V2_b_srv_id, _B41} =
						 protocol:string(_B40),
					     {V2_b_name, _B42} =
						 protocol:string(_B41),
					     {V2_b_lev, _B43} =
						 protocol:uint16(_B42),
					     {V2_b_face, _B44} =
						 protocol:uint32(_B43),
					     {V2_b_face_update_time, _B45} =
						 protocol:uint32(_B44),
					     {V2_b_face_file, _B46} =
						 protocol:string(_B45),
					     {V2_b_avatar_id, _B47} =
						 protocol:uint32(_B46),
					     {V2_b_sex, _B48} =
						 protocol:uint8(_B47),
					     {V2_b_power, _B49} =
						 protocol:uint32(_B48),
					     {V2_b_formation_type, _B50} =
						 protocol:uint8(_B49),
					     {V2_b_formation_lev, _B51} =
						 protocol:uint8(_B50),
					     {V2_b_plist, _B68} =
						 protocol:array(_B51,
								fun (_B52) ->
									{V3_pos,
									 _B53} =
									    protocol:uint8(_B52),
									{V3_bid,
									 _B54} =
									    protocol:uint32(_B53),
									{V3_lev,
									 _B55} =
									    protocol:uint16(_B54),
									{V3_quality,
									 _B56} =
									    protocol:uint8(_B55),
									{V3_star,
									 _B57} =
									    protocol:uint8(_B56),
									{V3_break_lev,
									 _B58} =
									    protocol:uint8(_B57),
									{V3_hurt,
									 _B59} =
									    protocol:uint32(_B58),
									{V3_behurt,
									 _B60} =
									    protocol:uint32(_B59),
									{V3_curt,
									 _B61} =
									    protocol:uint32(_B60),
									{V3_ext_data,
									 _B66} =
									    protocol:array(_B61,
											   fun
											     (_B62) ->
												 {V4_key,
												  _B63} =
												     protocol:uint32(_B62),
												 {V4_val,
												  _B64} =
												     protocol:uint32(_B63),
												 {{V4_key,
												   V4_val},
												  _B64}
											   end),
									{{V3_pos,
									  V3_bid,
									  V3_lev,
									  V3_quality,
									  V3_star,
									  V3_break_lev,
									  V3_hurt,
									  V3_behurt,
									  V3_curt,
									  V3_ext_data},
									 _B66}
								end),
					     {V2_ret, _B69} =
						 protocol:uint8(_B68),
					     {V2_replay_id, _B70} =
						 protocol:uint32(_B69),
					     {V2_a_sprite_lev, _B71} =
						 protocol:uint16(_B70),
					     {V2_a_sprites, _B76} =
						 protocol:array(_B71,
								fun (_B72) ->
									{V3_pos,
									 _B73} =
									    protocol:uint8(_B72),
									{V3_item_bid,
									 _B74} =
									    protocol:uint32(_B73),
									{{V3_pos,
									  V3_item_bid},
									 _B74}
								end),
					     {V2_b_sprite_lev, _B77} =
						 protocol:uint16(_B76),
					     {V2_b_sprites, _B82} =
						 protocol:array(_B77,
								fun (_B78) ->
									{V3_pos,
									 _B79} =
									    protocol:uint8(_B78),
									{V3_item_bid,
									 _B80} =
									    protocol:uint32(_B79),
									{{V3_pos,
									  V3_item_bid},
									 _B80}
								end),
					     {{V2_id, V2_target, V2_bet,
					       V2_get_bet, V2_step, V2_round,
					       V2_group, V2_a_bet, V2_a_rid,
					       V2_a_srv_id, V2_a_name, V2_a_lev,
					       V2_a_face, V2_a_face_update_time,
					       V2_a_face_file, V2_a_avatar_id,
					       V2_a_sex, V2_a_power,
					       V2_a_formation_type,
					       V2_a_formation_lev, V2_a_plist,
					       V2_b_bet, V2_b_rid, V2_b_srv_id,
					       V2_b_name, V2_b_lev, V2_b_face,
					       V2_b_face_update_time,
					       V2_b_face_file, V2_b_avatar_id,
					       V2_b_sex, V2_b_power,
					       V2_b_formation_type,
					       V2_b_formation_lev, V2_b_plist,
					       V2_ret, V2_replay_id,
					       V2_a_sprite_lev, V2_a_sprites,
					       V2_b_sprite_lev, V2_b_sprites},
					      _B82}
				     end),
    {ok, {V1_list}};
unpack(20256, srv, _B0) -> {ok, {}};
unpack(20256, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_cnum, _B2} = protocol:uint8(_B1),
    {V1_win, _B3} = protocol:uint8(_B2),
    {ok, {V1_rank, V1_cnum, V1_win}};
unpack(20257, cli, _B0) ->
    {V1_a_bet, _B1} = protocol:uint32(_B0),
    {V1_b_bet, _B2} = protocol:uint32(_B1),
    {V1_a_bet_ratio, _B3} = protocol:uint16(_B2),
    {V1_b_bet_ratio, _B4} = protocol:uint16(_B3),
    {ok,
     {V1_a_bet, V1_b_bet, V1_a_bet_ratio, V1_b_bet_ratio}};
unpack(20258, srv, _B0) -> {ok, {}};
unpack(20258, cli, _B0) ->
    {V1_list, _B82} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint16(_B1),
					     {V2_score, _B3} =
						 protocol:uint16(_B2),
					     {V2_step, _B4} =
						 protocol:uint8(_B3),
					     {V2_round, _B5} =
						 protocol:uint8(_B4),
					     {V2_group, _B6} =
						 protocol:uint8(_B5),
					     {V2_a_bet, _B7} =
						 protocol:uint32(_B6),
					     {V2_a_rid, _B8} =
						 protocol:uint32(_B7),
					     {V2_a_srv_id, _B9} =
						 protocol:string(_B8),
					     {V2_a_name, _B10} =
						 protocol:string(_B9),
					     {V2_a_lev, _B11} =
						 protocol:uint16(_B10),
					     {V2_a_face, _B12} =
						 protocol:uint32(_B11),
					     {V2_a_face_update_time, _B13} =
						 protocol:uint32(_B12),
					     {V2_a_face_file, _B14} =
						 protocol:string(_B13),
					     {V2_a_avatar_id, _B15} =
						 protocol:uint32(_B14),
					     {V2_a_sex, _B16} =
						 protocol:uint8(_B15),
					     {V2_a_power, _B17} =
						 protocol:uint32(_B16),
					     {V2_a_formation_type, _B18} =
						 protocol:uint8(_B17),
					     {V2_a_formation_lev, _B19} =
						 protocol:uint8(_B18),
					     {V2_a_plist, _B36} =
						 protocol:array(_B19,
								fun (_B20) ->
									{V3_pos,
									 _B21} =
									    protocol:uint8(_B20),
									{V3_bid,
									 _B22} =
									    protocol:uint32(_B21),
									{V3_lev,
									 _B23} =
									    protocol:uint16(_B22),
									{V3_quality,
									 _B24} =
									    protocol:uint8(_B23),
									{V3_star,
									 _B25} =
									    protocol:uint8(_B24),
									{V3_break_lev,
									 _B26} =
									    protocol:uint8(_B25),
									{V3_hurt,
									 _B27} =
									    protocol:uint32(_B26),
									{V3_behurt,
									 _B28} =
									    protocol:uint32(_B27),
									{V3_curt,
									 _B29} =
									    protocol:uint32(_B28),
									{V3_ext_data,
									 _B34} =
									    protocol:array(_B29,
											   fun
											     (_B30) ->
												 {V4_key,
												  _B31} =
												     protocol:uint32(_B30),
												 {V4_val,
												  _B32} =
												     protocol:uint32(_B31),
												 {{V4_key,
												   V4_val},
												  _B32}
											   end),
									{{V3_pos,
									  V3_bid,
									  V3_lev,
									  V3_quality,
									  V3_star,
									  V3_break_lev,
									  V3_hurt,
									  V3_behurt,
									  V3_curt,
									  V3_ext_data},
									 _B34}
								end),
					     {V2_b_bet, _B37} =
						 protocol:uint32(_B36),
					     {V2_b_rid, _B38} =
						 protocol:uint32(_B37),
					     {V2_b_srv_id, _B39} =
						 protocol:string(_B38),
					     {V2_b_name, _B40} =
						 protocol:string(_B39),
					     {V2_b_lev, _B41} =
						 protocol:uint16(_B40),
					     {V2_b_face, _B42} =
						 protocol:uint32(_B41),
					     {V2_b_face_update_time, _B43} =
						 protocol:uint32(_B42),
					     {V2_b_face_file, _B44} =
						 protocol:string(_B43),
					     {V2_b_avatar_id, _B45} =
						 protocol:uint32(_B44),
					     {V2_b_sex, _B46} =
						 protocol:uint8(_B45),
					     {V2_b_power, _B47} =
						 protocol:uint32(_B46),
					     {V2_b_formation_type, _B48} =
						 protocol:uint8(_B47),
					     {V2_b_formation_lev, _B49} =
						 protocol:uint8(_B48),
					     {V2_b_plist, _B66} =
						 protocol:array(_B49,
								fun (_B50) ->
									{V3_pos,
									 _B51} =
									    protocol:uint8(_B50),
									{V3_bid,
									 _B52} =
									    protocol:uint32(_B51),
									{V3_lev,
									 _B53} =
									    protocol:uint16(_B52),
									{V3_quality,
									 _B54} =
									    protocol:uint8(_B53),
									{V3_star,
									 _B55} =
									    protocol:uint8(_B54),
									{V3_break_lev,
									 _B56} =
									    protocol:uint8(_B55),
									{V3_hurt,
									 _B57} =
									    protocol:uint32(_B56),
									{V3_behurt,
									 _B58} =
									    protocol:uint32(_B57),
									{V3_curt,
									 _B59} =
									    protocol:uint32(_B58),
									{V3_ext_data,
									 _B64} =
									    protocol:array(_B59,
											   fun
											     (_B60) ->
												 {V4_key,
												  _B61} =
												     protocol:uint32(_B60),
												 {V4_val,
												  _B62} =
												     protocol:uint32(_B61),
												 {{V4_key,
												   V4_val},
												  _B62}
											   end),
									{{V3_pos,
									  V3_bid,
									  V3_lev,
									  V3_quality,
									  V3_star,
									  V3_break_lev,
									  V3_hurt,
									  V3_behurt,
									  V3_curt,
									  V3_ext_data},
									 _B64}
								end),
					     {V2_ret, _B67} =
						 protocol:uint8(_B66),
					     {V2_replay_id, _B68} =
						 protocol:uint32(_B67),
					     {V2_a_sprite_lev, _B69} =
						 protocol:uint16(_B68),
					     {V2_a_sprites, _B74} =
						 protocol:array(_B69,
								fun (_B70) ->
									{V3_pos,
									 _B71} =
									    protocol:uint8(_B70),
									{V3_item_bid,
									 _B72} =
									    protocol:uint32(_B71),
									{{V3_pos,
									  V3_item_bid},
									 _B72}
								end),
					     {V2_b_sprite_lev, _B75} =
						 protocol:uint16(_B74),
					     {V2_b_sprites, _B80} =
						 protocol:array(_B75,
								fun (_B76) ->
									{V3_pos,
									 _B77} =
									    protocol:uint8(_B76),
									{V3_item_bid,
									 _B78} =
									    protocol:uint32(_B77),
									{{V3_pos,
									  V3_item_bid},
									 _B78}
								end),
					     {{V2_id, V2_score, V2_step,
					       V2_round, V2_group, V2_a_bet,
					       V2_a_rid, V2_a_srv_id, V2_a_name,
					       V2_a_lev, V2_a_face,
					       V2_a_face_update_time,
					       V2_a_face_file, V2_a_avatar_id,
					       V2_a_sex, V2_a_power,
					       V2_a_formation_type,
					       V2_a_formation_lev, V2_a_plist,
					       V2_b_bet, V2_b_rid, V2_b_srv_id,
					       V2_b_name, V2_b_lev, V2_b_face,
					       V2_b_face_update_time,
					       V2_b_face_file, V2_b_avatar_id,
					       V2_b_sex, V2_b_power,
					       V2_b_formation_type,
					       V2_b_formation_lev, V2_b_plist,
					       V2_ret, V2_replay_id,
					       V2_a_sprite_lev, V2_a_sprites,
					       V2_b_sprite_lev, V2_b_sprites},
					      _B80}
				     end),
    {ok, {V1_list}};
unpack(20260, srv, _B0) -> {ok, {}};
unpack(20260, cli, _B0) ->
    {V1_list, _B13} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_group, _B2} =
						 protocol:uint8(_B1),
					     {V2_pos_list, _B11} =
						 protocol:array(_B2,
								fun (_B3) ->
									{V3_pos,
									 _B4} =
									    protocol:uint8(_B3),
									{V3_rid,
									 _B5} =
									    protocol:uint32(_B4),
									{V3_srv_id,
									 _B6} =
									    protocol:string(_B5),
									{V3_name,
									 _B7} =
									    protocol:string(_B6),
									{V3_ret,
									 _B8} =
									    protocol:uint8(_B7),
									{V3_replay_id,
									 _B9} =
									    protocol:uint32(_B8),
									{{V3_pos,
									  V3_rid,
									  V3_srv_id,
									  V3_name,
									  V3_ret,
									  V3_replay_id},
									 _B9}
								end),
					     {{V2_group, V2_pos_list}, _B11}
				     end),
    {ok, {V1_list}};
unpack(20261, srv, _B0) -> {ok, {}};
unpack(20261, cli, _B0) ->
    {V1_pos_list, _B12} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_pos, _B2} =
						     protocol:uint8(_B1),
						 {V2_rid, _B3} =
						     protocol:uint32(_B2),
						 {V2_srv_id, _B4} =
						     protocol:string(_B3),
						 {V2_name, _B5} =
						     protocol:string(_B4),
						 {V2_face, _B6} =
						     protocol:uint32(_B5),
						 {V2_ret, _B7} =
						     protocol:uint8(_B6),
						 {V2_replay_id, _B8} =
						     protocol:uint32(_B7),
						 {V2_face_update_time, _B9} =
						     protocol:uint32(_B8),
						 {V2_face_file, _B10} =
						     protocol:string(_B9),
						 {{V2_pos, V2_rid, V2_srv_id,
						   V2_name, V2_face, V2_ret,
						   V2_replay_id,
						   V2_face_update_time,
						   V2_face_file},
						  _B10}
					 end),
    {ok, {V1_pos_list}};
unpack(20262, srv, _B0) -> {ok, {}};
unpack(20262, cli, _B0) ->
    {V1_group, _B1} = protocol:uint8(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {ok, {V1_group, V1_pos}};
unpack(20263, srv, _B0) ->
    {V1_group, _B1} = protocol:uint8(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {ok, {V1_group, V1_pos}};
unpack(20263, cli, _B0) ->
    {V1_step, _B1} = protocol:uint8(_B0),
    {V1_round, _B2} = protocol:uint8(_B1),
    {V1_group, _B3} = protocol:uint8(_B2),
    {V1_a_bet, _B4} = protocol:uint32(_B3),
    {V1_a_rid, _B5} = protocol:uint32(_B4),
    {V1_a_srv_id, _B6} = protocol:string(_B5),
    {V1_a_name, _B7} = protocol:string(_B6),
    {V1_a_lev, _B8} = protocol:uint16(_B7),
    {V1_a_face, _B9} = protocol:uint32(_B8),
    {V1_a_face_update_time, _B10} = protocol:uint32(_B9),
    {V1_a_face_file, _B11} = protocol:string(_B10),
    {V1_a_avatar_id, _B12} = protocol:uint32(_B11),
    {V1_a_sex, _B13} = protocol:uint8(_B12),
    {V1_a_power, _B14} = protocol:uint32(_B13),
    {V1_a_formation_type, _B15} = protocol:uint8(_B14),
    {V1_a_formation_lev, _B16} = protocol:uint8(_B15),
    {V1_a_plist, _B33} = protocol:array(_B16,
					fun (_B17) ->
						{V2_pos, _B18} =
						    protocol:uint8(_B17),
						{V2_bid, _B19} =
						    protocol:uint32(_B18),
						{V2_lev, _B20} =
						    protocol:uint16(_B19),
						{V2_quality, _B21} =
						    protocol:uint8(_B20),
						{V2_star, _B22} =
						    protocol:uint8(_B21),
						{V2_break_lev, _B23} =
						    protocol:uint8(_B22),
						{V2_hurt, _B24} =
						    protocol:uint32(_B23),
						{V2_behurt, _B25} =
						    protocol:uint32(_B24),
						{V2_curt, _B26} =
						    protocol:uint32(_B25),
						{V2_ext_data, _B31} =
						    protocol:array(_B26,
								   fun (_B27) ->
									   {V3_key,
									    _B28} =
									       protocol:uint32(_B27),
									   {V3_val,
									    _B29} =
									       protocol:uint32(_B28),
									   {{V3_key,
									     V3_val},
									    _B29}
								   end),
						{{V2_pos, V2_bid, V2_lev,
						  V2_quality, V2_star,
						  V2_break_lev, V2_hurt,
						  V2_behurt, V2_curt,
						  V2_ext_data},
						 _B31}
					end),
    {V1_b_bet, _B34} = protocol:uint32(_B33),
    {V1_b_rid, _B35} = protocol:uint32(_B34),
    {V1_b_srv_id, _B36} = protocol:string(_B35),
    {V1_b_name, _B37} = protocol:string(_B36),
    {V1_b_lev, _B38} = protocol:uint16(_B37),
    {V1_b_face, _B39} = protocol:uint32(_B38),
    {V1_b_face_update_time, _B40} = protocol:uint32(_B39),
    {V1_b_face_file, _B41} = protocol:string(_B40),
    {V1_b_avatar_id, _B42} = protocol:uint32(_B41),
    {V1_b_sex, _B43} = protocol:uint8(_B42),
    {V1_b_power, _B44} = protocol:uint32(_B43),
    {V1_b_formation_type, _B45} = protocol:uint8(_B44),
    {V1_b_formation_lev, _B46} = protocol:uint8(_B45),
    {V1_b_plist, _B63} = protocol:array(_B46,
					fun (_B47) ->
						{V2_pos, _B48} =
						    protocol:uint8(_B47),
						{V2_bid, _B49} =
						    protocol:uint32(_B48),
						{V2_lev, _B50} =
						    protocol:uint16(_B49),
						{V2_quality, _B51} =
						    protocol:uint8(_B50),
						{V2_star, _B52} =
						    protocol:uint8(_B51),
						{V2_break_lev, _B53} =
						    protocol:uint8(_B52),
						{V2_hurt, _B54} =
						    protocol:uint32(_B53),
						{V2_behurt, _B55} =
						    protocol:uint32(_B54),
						{V2_curt, _B56} =
						    protocol:uint32(_B55),
						{V2_ext_data, _B61} =
						    protocol:array(_B56,
								   fun (_B57) ->
									   {V3_key,
									    _B58} =
									       protocol:uint32(_B57),
									   {V3_val,
									    _B59} =
									       protocol:uint32(_B58),
									   {{V3_key,
									     V3_val},
									    _B59}
								   end),
						{{V2_pos, V2_bid, V2_lev,
						  V2_quality, V2_star,
						  V2_break_lev, V2_hurt,
						  V2_behurt, V2_curt,
						  V2_ext_data},
						 _B61}
					end),
    {V1_ret, _B64} = protocol:uint8(_B63),
    {V1_replay_id, _B65} = protocol:uint32(_B64),
    {V1_a_sprite_lev, _B66} = protocol:uint16(_B65),
    {V1_a_sprites, _B71} = protocol:array(_B66,
					  fun (_B67) ->
						  {V2_pos, _B68} =
						      protocol:uint8(_B67),
						  {V2_item_bid, _B69} =
						      protocol:uint32(_B68),
						  {{V2_pos, V2_item_bid}, _B69}
					  end),
    {V1_b_sprite_lev, _B72} = protocol:uint16(_B71),
    {V1_b_sprites, _B77} = protocol:array(_B72,
					  fun (_B73) ->
						  {V2_pos, _B74} =
						      protocol:uint8(_B73),
						  {V2_item_bid, _B75} =
						      protocol:uint32(_B74),
						  {{V2_pos, V2_item_bid}, _B75}
					  end),
    {ok,
     {V1_step, V1_round, V1_group, V1_a_bet, V1_a_rid,
      V1_a_srv_id, V1_a_name, V1_a_lev, V1_a_face,
      V1_a_face_update_time, V1_a_face_file, V1_a_avatar_id,
      V1_a_sex, V1_a_power, V1_a_formation_type,
      V1_a_formation_lev, V1_a_plist, V1_b_bet, V1_b_rid,
      V1_b_srv_id, V1_b_name, V1_b_lev, V1_b_face,
      V1_b_face_update_time, V1_b_face_file, V1_b_avatar_id,
      V1_b_sex, V1_b_power, V1_b_formation_type,
      V1_b_formation_lev, V1_b_plist, V1_ret, V1_replay_id,
      V1_a_sprite_lev, V1_a_sprites, V1_b_sprite_lev,
      V1_b_sprites}};
unpack(20280, srv, _B0) -> {ok, {}};
unpack(20280, cli, _B0) ->
    {V1_rank_list, _B12} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_rid, _B2} =
						      protocol:uint32(_B1),
						  {V2_srv_id, _B3} =
						      protocol:string(_B2),
						  {V2_name, _B4} =
						      protocol:string(_B3),
						  {V2_lev, _B5} =
						      protocol:uint16(_B4),
						  {V2_rank, _B6} =
						      protocol:uint8(_B5),
						  {V2_sex, _B7} =
						      protocol:uint8(_B6),
						  {V2_lookid, _B8} =
						      protocol:uint32(_B7),
						  {V2_worship, _B9} =
						      protocol:uint32(_B8),
						  {V2_worship_status, _B10} =
						      protocol:uint8(_B9),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_lev, V2_rank, V2_sex,
						    V2_lookid, V2_worship,
						    V2_worship_status},
						   _B10}
					  end),
    {ok, {V1_rank_list}};
unpack(20281, srv, _B0) -> {ok, {}};
unpack(20281, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_worship, _B2} = protocol:uint32(_B1),
    {V1_power, _B3} = protocol:uint32(_B2),
    {V1_rank_list, _B19} = protocol:array(_B3,
					  fun (_B4) ->
						  {V2_rid, _B5} =
						      protocol:uint32(_B4),
						  {V2_srv_id, _B6} =
						      protocol:string(_B5),
						  {V2_name, _B7} =
						      protocol:string(_B6),
						  {V2_lev, _B8} =
						      protocol:uint16(_B7),
						  {V2_face, _B9} =
						      protocol:uint32(_B8),
						  {V2_sex, _B10} =
						      protocol:uint8(_B9),
						  {V2_rank, _B11} =
						      protocol:uint16(_B10),
						  {V2_score, _B12} =
						      protocol:uint16(_B11),
						  {V2_power, _B13} =
						      protocol:uint32(_B12),
						  {V2_face_update_time, _B14} =
						      protocol:uint32(_B13),
						  {V2_face_file, _B15} =
						      protocol:string(_B14),
						  {V2_worship, _B16} =
						      protocol:uint32(_B15),
						  {V2_worship_status, _B17} =
						      protocol:uint8(_B16),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_lev, V2_face, V2_sex,
						    V2_rank, V2_score, V2_power,
						    V2_face_update_time,
						    V2_face_file, V2_worship,
						    V2_worship_status},
						   _B17}
					  end),
    {ok, {V1_rank, V1_worship, V1_power, V1_rank_list}};
unpack(20282, cli, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0),
    {V1_rank_list, _B13} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_rid, _B3} =
						      protocol:uint32(_B2),
						  {V2_srv_id, _B4} =
						      protocol:string(_B3),
						  {V2_name, _B5} =
						      protocol:string(_B4),
						  {V2_lev, _B6} =
						      protocol:uint16(_B5),
						  {V2_face, _B7} =
						      protocol:uint32(_B6),
						  {V2_sex, _B8} =
						      protocol:uint8(_B7),
						  {V2_rank, _B9} =
						      protocol:uint16(_B8),
						  {V2_face_update_time, _B10} =
						      protocol:uint32(_B9),
						  {V2_face_file, _B11} =
						      protocol:string(_B10),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_lev, V2_face, V2_sex,
						    V2_rank,
						    V2_face_update_time,
						    V2_face_file},
						   _B11}
					  end),
    {ok, {V1_time, V1_rank_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


