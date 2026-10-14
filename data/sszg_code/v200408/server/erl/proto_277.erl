-file("src/proto/proto_277.erl", 1).

-module(proto_277).

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
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{peak_champion_pk,
		 [id, step, round, group, score, is_guess, a_pos, a_id,
		  a_name, a_lev, a_face, a_avatar_id, a_sex, a_defense,
		  a_bet, a_power, a_robot_id, b_pos, b_id, b_name, b_lev,
		  b_face, b_avatar_id, b_sex, b_defense, b_bet, b_power,
		  b_robot_id, ret, result_info, diff_power, pk_rlist,
		  a_sprite_lev, a_sprites, a_sprite_attr, b_sprite_lev,
		  b_sprites, b_sprite_attr, a_face_update_time,
		  a_face_file, b_face_update_time, b_face_file,
		  a_sprites_list, b_sprites_list, a_break_groups,
		  b_break_groups]},
		{peak_champion_32_pk,
		 [pos, id, name, lev, face_id, avatar_bid, sex,
		  max_power, ret, ext]},
		{arena_peak_result_info,
		 [order, ret, time, round, a_end_hp, b_end_hp,
		  replay_info]},
		{arena_peak_role_partner,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  dower_skill, set_skill, attr, hurt, behurt, curt, ext]},
		{arena_peak_role_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_look_id, hallows_skill_lev, hallows_lucky,
		  hallows_seal, hallows_refine, hallows_all_look_ids,
		  power, plist]},
		{arena_peak_champion_role,
		 [id, name, lev, face_id, avatar_bid, sex, power,
		  defense, sprite_lev, sprites, sprites_attr, old_rank,
		  old_score, score, score_32, rank, robot_id, group,
		  group256, group64, combat_num, win, lose,
		  face_update_time, face_file, sprites_list,
		  break_groups]},
		{arena_peak_rank,
		 [rank, id, name, lev, face_id, avatar_bid, score, power,
		  sex, face_update_time, face_file]},
		{arena_peak_rank_info, [zone_id, list]},
		{c_arena_zone_info,
		 [zone_id, main_id, main_list, srv_lists, do_merge_lists,
		  num]},
		{m_arena_peak_champion,
		 [var, period, zone_id, old_periods, defense]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/arena_peak_champion.hrl", 1).

-record(m_arena_peak_champion,
	{var = 2, period = 0, zone_id = 0, old_periods = [],
	 defense = []}).

-record(c_arena_zone_info,
	{zone_id = 0, main_id = <<>>, main_list = [],
	 srv_lists = [], do_merge_lists = [], num = 0}).

-record(arena_peak_rank_info,
	{zone_id = {0, 0}, list = 0}).

-record(arena_peak_rank,
	{rank = 0, id = {0, <<>>}, name = 0, lev = 0,
	 face_id = 0, avatar_bid = 0, score = 0, power = 0,
	 sex = 0, face_update_time = 0, face_file = <<>>}).

-record(arena_peak_champion_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, face_id = 0,
	 avatar_bid = 0, sex = 0, power = 0, defense = [],
	 sprite_lev = 0, sprites = [], sprites_attr,
	 old_rank = 0, old_score = 0, score = 0, score_32 = 0,
	 rank = 0, robot_id = 0, group = 0, group256 = 0,
	 group64 = 0, combat_num = 0, win = 0, lose = 0,
	 face_update_time = 0, face_file = <<>>,
	 sprites_list = [], break_groups = []}).

-record(arena_peak_role_defense,
	{order = 0, formation_type = 1, hallows_id = 1,
	 hallows_lev = 0, hallows_look_id = 0,
	 hallows_skill_lev = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_refine = 0,
	 hallows_all_look_ids = [], power = 0, plist = []}).

-record(arena_peak_role_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, dower_skill = [],
	 set_skill = [], attr, hurt = 0, behurt = 0, curt = 0,
	 ext = #{}}).

-record(arena_peak_result_info,
	{order = 0, ret = 0, time = 0, round = 0, a_end_hp = 0,
	 b_end_hp = 0, replay_info = {0, <<>>}}).

-record(peak_champion_32_pk,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, sex = 0, max_power = 0,
	 ret = 0, ext = []}).

-record(peak_champion_pk,
	{id = 0, step = 0, round = 0, group = 0, score = 0,
	 is_guess = 1, a_pos = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_lev = 0, a_face = 0, a_avatar_id = 0,
	 a_sex = 0, a_defense = [], a_bet = 0, a_power = 0,
	 a_robot_id = 0, b_pos = 0, b_id = {0, <<>>},
	 b_name = <<>>, b_lev = 0, b_face = 0, b_avatar_id = 0,
	 b_sex = 0, b_defense = [], b_bet = 0, b_power = 0,
	 b_robot_id = 0, ret = 0, result_info = [],
	 diff_power = 0, pk_rlist = [], a_sprite_lev = 0,
	 a_sprites = [], a_sprite_attr, b_sprite_lev = 0,
	 b_sprites = [], b_sprite_attr, a_face_update_time = 0,
	 a_face_file = <<>>, b_face_update_time = 0,
	 b_face_file = <<>>, a_sprites_list = [],
	 b_sprites_list = [], a_break_groups = [],
	 b_break_groups = []}).

-file("src/proto/proto_277.erl", 16).

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

-file("src/proto/proto_277.erl", 17).

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

-file("src/proto/proto_277.erl", 18).

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

-file("src/proto/proto_277.erl", 19).

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

-file("src/proto/proto_277.erl", 20).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(27700, cli, {}) -> {ok, <<2:32, 27700:16>>};
pack(27700, srv,
     {V0_start_time, V0_end_time, V0_step, V0_step_status,
      V0_step_status_time, V0_round, V0_round_status,
      V0_round_status_time, V0_flag, V0_period, V0_zone_id,
      V0_max_zone_id}) ->
    D_a_t_a = <<V0_start_time:32, V0_end_time:32,
		V0_step:32, V0_step_status:8, V0_step_status_time:32,
		V0_round:8, V0_round_status:8, V0_round_status_time:32,
		V0_flag:8, V0_period:32, V0_zone_id:32,
		V0_max_zone_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27700:16,
       D_a_t_a/binary>>};
pack(27701, cli, {}) -> {ok, <<2:32, 27701:16>>};
pack(27701, srv,
     {V0_rank, V0_best_rank, V0_can_bet, V0_group_256,
      V0_group_64}) ->
    D_a_t_a = <<V0_rank:16, V0_best_rank:16, V0_can_bet:32,
		V0_group_256:8, V0_group_64:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27701:16,
       D_a_t_a/binary>>};
pack(27702, cli, {}) -> {ok, <<2:32, 27702:16>>};
pack(27702, srv,
     #peak_champion_pk{step = V0_step, round = V0_round,
		       group = V0_group, a_bet = V0_a_bet,
		       a_id = {V0_a_rid, V0_a_srv_id}, a_name = V0_a_name,
		       a_lev = V0_a_lev, a_face = V0_a_face,
		       a_face_update_time = V0_a_face_update_time,
		       a_face_file = V0_a_face_file,
		       a_avatar_id = V0_a_avatar_id, a_sex = V0_a_sex,
		       a_power = V0_a_power, a_defense = V0_a_defense,
		       b_bet = V0_b_bet, b_id = {V0_b_rid, V0_b_srv_id},
		       b_name = V0_b_name, b_lev = V0_b_lev,
		       b_face = V0_b_face,
		       b_face_update_time = V0_b_face_update_time,
		       b_face_file = V0_b_face_file,
		       b_avatar_id = V0_b_avatar_id, b_sex = V0_b_sex,
		       b_power = V0_b_power, b_defense = V0_b_defense,
		       ret = V0_ret, result_info = V0_result_info,
		       a_sprite_lev = V0_a_sprite_lev,
		       a_sprites = V0_a_sprites,
		       b_sprite_lev = V0_b_sprite_lev,
		       b_sprites = V0_b_sprites,
		       a_sprites_list = V0_a_sprites_list,
		       b_sprites_list = V0_b_sprites_list}) ->
    D_a_t_a = <<V0_step:32, V0_round:8, V0_group:8,
		V0_a_bet:32, V0_a_rid:32,
		(protocol:pack(string, V0_a_srv_id))/binary,
		(protocol:pack(string, V0_a_name))/binary, V0_a_lev:16,
		V0_a_face:32, V0_a_face_update_time:32,
		(protocol:pack(string, V0_a_face_file))/binary,
		V0_a_avatar_id:32, V0_a_sex:8, V0_a_power:32,
		(length(V0_a_defense)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   V1_hallows_id:32, V1_hallows_look_id:32,
				   V1_power:32, (length(V1_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32,
						      V2_skin_id:32, V2_hurt:32,
						      V2_behurt:32, V2_curt:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #arena_peak_role_partner{pos
										    =
										    V2_pos,
										id
										    =
										    V2_id,
										bid
										    =
										    V2_bid,
										lev
										    =
										    V2_lev,
										star
										    =
										    V2_star,
										break_lev
										    =
										    V2_break_lev,
										power
										    =
										    V2_power,
										skin_id
										    =
										    V2_skin_id,
										hurt
										    =
										    V2_hurt,
										behurt
										    =
										    V2_behurt,
										curt
										    =
										    V2_curt,
										ext
										    =
										    V2_ext}
							   <- V1_plist]))/binary>>
				 || #arena_peak_role_defense{order = V1_order,
							     formation_type =
								 V1_formation_type,
							     hallows_id =
								 V1_hallows_id,
							     hallows_look_id =
								 V1_hallows_look_id,
							     power = V1_power,
							     plist = V1_plist}
					<- V0_a_defense]))/binary,
		V0_b_bet:32, V0_b_rid:32,
		(protocol:pack(string, V0_b_srv_id))/binary,
		(protocol:pack(string, V0_b_name))/binary, V0_b_lev:16,
		V0_b_face:32, V0_b_face_update_time:32,
		(protocol:pack(string, V0_b_face_file))/binary,
		V0_b_avatar_id:32, V0_b_sex:8, V0_b_power:32,
		(length(V0_b_defense)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   V1_hallows_id:32, V1_hallows_look_id:32,
				   V1_power:32, (length(V1_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32,
						      V2_skin_id:32, V2_hurt:32,
						      V2_behurt:32, V2_curt:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #arena_peak_role_partner{pos
										    =
										    V2_pos,
										id
										    =
										    V2_id,
										bid
										    =
										    V2_bid,
										lev
										    =
										    V2_lev,
										star
										    =
										    V2_star,
										break_lev
										    =
										    V2_break_lev,
										power
										    =
										    V2_power,
										skin_id
										    =
										    V2_skin_id,
										hurt
										    =
										    V2_hurt,
										behurt
										    =
										    V2_behurt,
										curt
										    =
										    V2_curt,
										ext
										    =
										    V2_ext}
							   <- V1_plist]))/binary>>
				 || #arena_peak_role_defense{order = V1_order,
							     formation_type =
								 V1_formation_type,
							     hallows_id =
								 V1_hallows_id,
							     hallows_look_id =
								 V1_hallows_look_id,
							     power = V1_power,
							     plist = V1_plist}
					<- V0_b_defense]))/binary,
		V0_ret:8, (length(V0_result_info)):16,
		(list_to_binary([<<V1_order:8, V1_ret:8, V1_time:32,
				   V1_round:8, V1_a_end_hp:8, V1_b_end_hp:8,
				   V1_replay_id:32,
				   (protocol:pack(string,
						  V1_replay_sid))/binary>>
				 || #arena_peak_result_info{order = V1_order,
							    ret = V1_ret,
							    time = V1_time,
							    round = V1_round,
							    a_end_hp =
								V1_a_end_hp,
							    b_end_hp =
								V1_b_end_hp,
							    replay_info =
								{V1_replay_id,
								 V1_replay_sid}}
					<- V0_result_info]))/binary,
		V0_a_sprite_lev:16, (length(V0_a_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_a_sprites]))/binary,
		V0_b_sprite_lev:16, (length(V0_b_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_b_sprites]))/binary,
		(length(V0_a_sprites_list)):16,
		(list_to_binary([<<V1_team:8,
				   (length(V1_sprites_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites_list]))/binary>>
				 || {V1_team, V1_sprites_list}
					<- V0_a_sprites_list]))/binary,
		(length(V0_b_sprites_list)):16,
		(list_to_binary([<<V1_team:8,
				   (length(V1_sprites_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites_list]))/binary>>
				 || {V1_team, V1_sprites_list}
					<- V0_b_sprites_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27702:16,
       D_a_t_a/binary>>};
pack(27703, cli, {}) -> {ok, <<2:32, 27703:16>>};
pack(27703, srv,
     {V0_bet_type, V0_bet_val, V0_a_bet_ratio,
      V0_b_bet_ratio,
      #peak_champion_pk{step = V0_step, round = V0_round,
			group = V0_group, a_bet = V0_a_bet,
			a_id = {V0_a_rid, V0_a_srv_id}, a_name = V0_a_name,
			a_lev = V0_a_lev, a_face = V0_a_face,
			a_face_update_time = V0_a_face_update_time,
			a_face_file = V0_a_face_file,
			a_avatar_id = V0_a_avatar_id, a_sex = V0_a_sex,
			a_power = V0_a_power, a_defense = V0_a_defense,
			b_bet = V0_b_bet, b_id = {V0_b_rid, V0_b_srv_id},
			b_name = V0_b_name, b_lev = V0_b_lev,
			b_face = V0_b_face,
			b_face_update_time = V0_b_face_update_time,
			b_face_file = V0_b_face_file,
			b_avatar_id = V0_b_avatar_id, b_sex = V0_b_sex,
			b_power = V0_b_power, b_defense = V0_b_defense,
			ret = V0_ret, result_info = V0_result_info,
			a_sprite_lev = V0_a_sprite_lev,
			a_sprites = V0_a_sprites,
			b_sprite_lev = V0_b_sprite_lev,
			b_sprites = V0_b_sprites,
			a_sprites_list = V0_a_sprites_list,
			b_sprites_list = V0_b_sprites_list}}) ->
    D_a_t_a = <<V0_bet_type:8, V0_bet_val:32,
		V0_a_bet_ratio:16, V0_b_bet_ratio:16, V0_step:32,
		V0_round:8, V0_group:8, V0_a_bet:32, V0_a_rid:32,
		(protocol:pack(string, V0_a_srv_id))/binary,
		(protocol:pack(string, V0_a_name))/binary, V0_a_lev:16,
		V0_a_face:32, V0_a_face_update_time:32,
		(protocol:pack(string, V0_a_face_file))/binary,
		V0_a_avatar_id:32, V0_a_sex:8, V0_a_power:32,
		(length(V0_a_defense)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   V1_hallows_id:32, V1_hallows_look_id:32,
				   V1_power:32, (length(V1_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32,
						      V2_skin_id:32, V2_hurt:32,
						      V2_behurt:32, V2_curt:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #arena_peak_role_partner{pos
										    =
										    V2_pos,
										id
										    =
										    V2_id,
										bid
										    =
										    V2_bid,
										lev
										    =
										    V2_lev,
										star
										    =
										    V2_star,
										break_lev
										    =
										    V2_break_lev,
										power
										    =
										    V2_power,
										skin_id
										    =
										    V2_skin_id,
										hurt
										    =
										    V2_hurt,
										behurt
										    =
										    V2_behurt,
										curt
										    =
										    V2_curt,
										ext
										    =
										    V2_ext}
							   <- V1_plist]))/binary>>
				 || #arena_peak_role_defense{order = V1_order,
							     formation_type =
								 V1_formation_type,
							     hallows_id =
								 V1_hallows_id,
							     hallows_look_id =
								 V1_hallows_look_id,
							     power = V1_power,
							     plist = V1_plist}
					<- V0_a_defense]))/binary,
		V0_b_bet:32, V0_b_rid:32,
		(protocol:pack(string, V0_b_srv_id))/binary,
		(protocol:pack(string, V0_b_name))/binary, V0_b_lev:16,
		V0_b_face:32, V0_b_face_update_time:32,
		(protocol:pack(string, V0_b_face_file))/binary,
		V0_b_avatar_id:32, V0_b_sex:8, V0_b_power:32,
		(length(V0_b_defense)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   V1_hallows_id:32, V1_hallows_look_id:32,
				   V1_power:32, (length(V1_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32,
						      V2_skin_id:32, V2_hurt:32,
						      V2_behurt:32, V2_curt:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #arena_peak_role_partner{pos
										    =
										    V2_pos,
										id
										    =
										    V2_id,
										bid
										    =
										    V2_bid,
										lev
										    =
										    V2_lev,
										star
										    =
										    V2_star,
										break_lev
										    =
										    V2_break_lev,
										power
										    =
										    V2_power,
										skin_id
										    =
										    V2_skin_id,
										hurt
										    =
										    V2_hurt,
										behurt
										    =
										    V2_behurt,
										curt
										    =
										    V2_curt,
										ext
										    =
										    V2_ext}
							   <- V1_plist]))/binary>>
				 || #arena_peak_role_defense{order = V1_order,
							     formation_type =
								 V1_formation_type,
							     hallows_id =
								 V1_hallows_id,
							     hallows_look_id =
								 V1_hallows_look_id,
							     power = V1_power,
							     plist = V1_plist}
					<- V0_b_defense]))/binary,
		V0_ret:8, (length(V0_result_info)):16,
		(list_to_binary([<<V1_order:8, V1_ret:8, V1_time:32,
				   V1_round:8, V1_a_end_hp:8, V1_b_end_hp:8,
				   V1_replay_id:32,
				   (protocol:pack(string,
						  V1_replay_sid))/binary>>
				 || #arena_peak_result_info{order = V1_order,
							    ret = V1_ret,
							    time = V1_time,
							    round = V1_round,
							    a_end_hp =
								V1_a_end_hp,
							    b_end_hp =
								V1_b_end_hp,
							    replay_info =
								{V1_replay_id,
								 V1_replay_sid}}
					<- V0_result_info]))/binary,
		V0_a_sprite_lev:16, (length(V0_a_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_a_sprites]))/binary,
		V0_b_sprite_lev:16, (length(V0_b_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_b_sprites]))/binary,
		(length(V0_a_sprites_list)):16,
		(list_to_binary([<<V1_team:8,
				   (length(V1_sprites_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites_list]))/binary>>
				 || {V1_team, V1_sprites_list}
					<- V0_a_sprites_list]))/binary,
		(length(V0_b_sprites_list)):16,
		(list_to_binary([<<V1_team:8,
				   (length(V1_sprites_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites_list]))/binary>>
				 || {V1_team, V1_sprites_list}
					<- V0_b_sprites_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27703:16,
       D_a_t_a/binary>>};
pack(27704, cli, {V0_bet_type, V0_bet_val}) ->
    D_a_t_a = <<V0_bet_type:8, V0_bet_val:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27704:16,
       D_a_t_a/binary>>};
pack(27704, srv,
     {V0_code, V0_msg, V0_can_bet, V0_bet_type,
      V0_bet_val}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_can_bet:32,
		V0_bet_type:8, V0_bet_val:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27704:16,
       D_a_t_a/binary>>};
pack(27705, cli, {}) -> {ok, <<2:32, 27705:16>>};
pack(27705, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:16, V1_target:8, V1_bet:32,
				   V1_get_bet:32, V1_step:32, V1_round:8,
				   V1_group:8, V1_a_bet:32, V1_a_rid:32,
				   (protocol:pack(string, V1_a_srv_id))/binary,
				   (protocol:pack(string, V1_a_name))/binary,
				   V1_a_lev:16, V1_a_face:32,
				   V1_a_face_update_time:32,
				   (protocol:pack(string,
						  V1_a_face_file))/binary,
				   V1_a_avatar_id:32, V1_a_sex:8, V1_a_power:32,
				   (length(V1_a_defense)):16,
				   (list_to_binary([<<V2_order:8,
						      V2_formation_type:8,
						      V2_hallows_id:32,
						      V2_hallows_look_id:32,
						      V2_power:32,
						      (length(V2_plist)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_id:32,
									 V3_bid:32,
									 V3_lev:16,
									 V3_star:8,
									 V3_break_lev:8,
									 V3_power:32,
									 V3_skin_id:32,
									 V3_hurt:32,
									 V3_behurt:32,
									 V3_curt:32,
									 (length(V3_ext)):16,
									 (list_to_binary([<<V4_key:32,
											    V4_val:32>>
											  || {V4_key,
											      V4_val}
												 <- V3_ext]))/binary>>
								       || #arena_peak_role_partner{pos
												       =
												       V3_pos,
												   id
												       =
												       V3_id,
												   bid
												       =
												       V3_bid,
												   lev
												       =
												       V3_lev,
												   star
												       =
												       V3_star,
												   break_lev
												       =
												       V3_break_lev,
												   power
												       =
												       V3_power,
												   skin_id
												       =
												       V3_skin_id,
												   hurt
												       =
												       V3_hurt,
												   behurt
												       =
												       V3_behurt,
												   curt
												       =
												       V3_curt,
												   ext
												       =
												       V3_ext}
									      <- V2_plist]))/binary>>
						    || #arena_peak_role_defense{order
										    =
										    V2_order,
										formation_type
										    =
										    V2_formation_type,
										hallows_id
										    =
										    V2_hallows_id,
										hallows_look_id
										    =
										    V2_hallows_look_id,
										power
										    =
										    V2_power,
										plist
										    =
										    V2_plist}
							   <- V1_a_defense]))/binary,
				   V1_b_bet:32, V1_b_rid:32,
				   (protocol:pack(string, V1_b_srv_id))/binary,
				   (protocol:pack(string, V1_b_name))/binary,
				   V1_b_lev:16, V1_b_face:32,
				   V1_b_face_update_time:32,
				   (protocol:pack(string,
						  V1_b_face_file))/binary,
				   V1_b_avatar_id:32, V1_b_sex:8, V1_b_power:32,
				   (length(V1_b_defense)):16,
				   (list_to_binary([<<V2_order:8,
						      V2_formation_type:8,
						      V2_hallows_id:32,
						      V2_hallows_look_id:32,
						      V2_power:32,
						      (length(V2_plist)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_id:32,
									 V3_bid:32,
									 V3_lev:16,
									 V3_star:8,
									 V3_break_lev:8,
									 V3_power:32,
									 V3_skin_id:32,
									 V3_hurt:32,
									 V3_behurt:32,
									 V3_curt:32,
									 (length(V3_ext)):16,
									 (list_to_binary([<<V4_key:32,
											    V4_val:32>>
											  || {V4_key,
											      V4_val}
												 <- V3_ext]))/binary>>
								       || #arena_peak_role_partner{pos
												       =
												       V3_pos,
												   id
												       =
												       V3_id,
												   bid
												       =
												       V3_bid,
												   lev
												       =
												       V3_lev,
												   star
												       =
												       V3_star,
												   break_lev
												       =
												       V3_break_lev,
												   power
												       =
												       V3_power,
												   skin_id
												       =
												       V3_skin_id,
												   hurt
												       =
												       V3_hurt,
												   behurt
												       =
												       V3_behurt,
												   curt
												       =
												       V3_curt,
												   ext
												       =
												       V3_ext}
									      <- V2_plist]))/binary>>
						    || #arena_peak_role_defense{order
										    =
										    V2_order,
										formation_type
										    =
										    V2_formation_type,
										hallows_id
										    =
										    V2_hallows_id,
										hallows_look_id
										    =
										    V2_hallows_look_id,
										power
										    =
										    V2_power,
										plist
										    =
										    V2_plist}
							   <- V1_b_defense]))/binary,
				   V1_ret:8, (length(V1_result_info)):16,
				   (list_to_binary([<<V2_order:8, V2_ret:8,
						      V2_time:32, V2_round:8,
						      V2_a_end_hp:8,
						      V2_b_end_hp:8,
						      V2_replay_id:32,
						      (protocol:pack(string,
								     V2_replay_sid))/binary>>
						    || #arena_peak_result_info{order
										   =
										   V2_order,
									       ret
										   =
										   V2_ret,
									       time
										   =
										   V2_time,
									       round
										   =
										   V2_round,
									       a_end_hp
										   =
										   V2_a_end_hp,
									       b_end_hp
										   =
										   V2_b_end_hp,
									       replay_info
										   =
										   {V2_replay_id,
										    V2_replay_sid}}
							   <- V1_result_info]))/binary,
				   V1_a_sprite_lev:16,
				   (length(V1_a_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_a_sprites]))/binary,
				   V1_b_sprite_lev:16,
				   (length(V1_b_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_b_sprites]))/binary,
				   (length(V1_a_sprites_list)):16,
				   (list_to_binary([<<V2_team:8,
						      (length(V2_sprites_list)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_item_bid:32>>
								       || {V3_pos,
									   V3_item_bid}
									      <- V2_sprites_list]))/binary>>
						    || {V2_team,
							V2_sprites_list}
							   <- V1_a_sprites_list]))/binary,
				   (length(V1_b_sprites_list)):16,
				   (list_to_binary([<<V2_team:8,
						      (length(V2_sprites_list)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_item_bid:32>>
								       || {V3_pos,
									   V3_item_bid}
									      <- V2_sprites_list]))/binary>>
						    || {V2_team,
							V2_sprites_list}
							   <- V1_b_sprites_list]))/binary>>
				 || {V1_id, V1_target, V1_bet, V1_get_bet,
				     #peak_champion_pk{step = V1_step,
						       round = V1_round,
						       group = V1_group,
						       a_bet = V1_a_bet,
						       a_id =
							   {V1_a_rid,
							    V1_a_srv_id},
						       a_name = V1_a_name,
						       a_lev = V1_a_lev,
						       a_face = V1_a_face,
						       a_face_update_time =
							   V1_a_face_update_time,
						       a_face_file =
							   V1_a_face_file,
						       a_avatar_id =
							   V1_a_avatar_id,
						       a_sex = V1_a_sex,
						       a_power = V1_a_power,
						       a_defense = V1_a_defense,
						       b_bet = V1_b_bet,
						       b_id =
							   {V1_b_rid,
							    V1_b_srv_id},
						       b_name = V1_b_name,
						       b_lev = V1_b_lev,
						       b_face = V1_b_face,
						       b_face_update_time =
							   V1_b_face_update_time,
						       b_face_file =
							   V1_b_face_file,
						       b_avatar_id =
							   V1_b_avatar_id,
						       b_sex = V1_b_sex,
						       b_power = V1_b_power,
						       b_defense = V1_b_defense,
						       ret = V1_ret,
						       result_info =
							   V1_result_info,
						       a_sprite_lev =
							   V1_a_sprite_lev,
						       a_sprites = V1_a_sprites,
						       b_sprite_lev =
							   V1_b_sprite_lev,
						       b_sprites = V1_b_sprites,
						       a_sprites_list =
							   V1_a_sprites_list,
						       b_sprites_list =
							   V1_b_sprites_list}}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27705:16,
       D_a_t_a/binary>>};
pack(27706, cli, {}) -> {ok, <<2:32, 27706:16>>};
pack(27706, srv, {V0_rank, V0_cnum, V0_win}) ->
    D_a_t_a = <<V0_rank:16, V0_cnum:8, V0_win:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27706:16,
       D_a_t_a/binary>>};
pack(27707, cli, {}) -> {ok, <<2:32, 27707:16>>};
pack(27707, srv,
     {V0_a_bet, V0_b_bet, V0_a_bet_ratio, V0_b_bet_ratio}) ->
    D_a_t_a = <<V0_a_bet:32, V0_b_bet:32, V0_a_bet_ratio:16,
		V0_b_bet_ratio:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27707:16,
       D_a_t_a/binary>>};
pack(27708, cli, {}) -> {ok, <<2:32, 27708:16>>};
pack(27708, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:16, V1_score:16, V1_step:32,
				   V1_round:8, V1_group:8, V1_a_bet:32,
				   V1_a_rid:32,
				   (protocol:pack(string, V1_a_srv_id))/binary,
				   (protocol:pack(string, V1_a_name))/binary,
				   V1_a_lev:16, V1_a_face:32,
				   V1_a_face_update_time:32,
				   (protocol:pack(string,
						  V1_a_face_file))/binary,
				   V1_a_avatar_id:32, V1_a_sex:8, V1_a_power:32,
				   (length(V1_a_defense)):16,
				   (list_to_binary([<<V2_order:8,
						      V2_formation_type:8,
						      V2_hallows_id:32,
						      V2_hallows_look_id:32,
						      V2_power:32,
						      (length(V2_plist)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_id:32,
									 V3_bid:32,
									 V3_lev:16,
									 V3_star:8,
									 V3_break_lev:8,
									 V3_power:32,
									 V3_skin_id:32,
									 V3_hurt:32,
									 V3_behurt:32,
									 V3_curt:32,
									 (length(V3_ext)):16,
									 (list_to_binary([<<V4_key:32,
											    V4_val:32>>
											  || {V4_key,
											      V4_val}
												 <- V3_ext]))/binary>>
								       || #arena_peak_role_partner{pos
												       =
												       V3_pos,
												   id
												       =
												       V3_id,
												   bid
												       =
												       V3_bid,
												   lev
												       =
												       V3_lev,
												   star
												       =
												       V3_star,
												   break_lev
												       =
												       V3_break_lev,
												   power
												       =
												       V3_power,
												   skin_id
												       =
												       V3_skin_id,
												   hurt
												       =
												       V3_hurt,
												   behurt
												       =
												       V3_behurt,
												   curt
												       =
												       V3_curt,
												   ext
												       =
												       V3_ext}
									      <- V2_plist]))/binary>>
						    || #arena_peak_role_defense{order
										    =
										    V2_order,
										formation_type
										    =
										    V2_formation_type,
										hallows_id
										    =
										    V2_hallows_id,
										hallows_look_id
										    =
										    V2_hallows_look_id,
										power
										    =
										    V2_power,
										plist
										    =
										    V2_plist}
							   <- V1_a_defense]))/binary,
				   V1_b_bet:32, V1_b_rid:32,
				   (protocol:pack(string, V1_b_srv_id))/binary,
				   (protocol:pack(string, V1_b_name))/binary,
				   V1_b_lev:16, V1_b_face:32,
				   V1_b_face_update_time:32,
				   (protocol:pack(string,
						  V1_b_face_file))/binary,
				   V1_b_avatar_id:32, V1_b_sex:8, V1_b_power:32,
				   (length(V1_b_defense)):16,
				   (list_to_binary([<<V2_order:8,
						      V2_formation_type:8,
						      V2_hallows_id:32,
						      V2_hallows_look_id:32,
						      V2_power:32,
						      (length(V2_plist)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_id:32,
									 V3_bid:32,
									 V3_lev:16,
									 V3_star:8,
									 V3_break_lev:8,
									 V3_power:32,
									 V3_skin_id:32,
									 V3_hurt:32,
									 V3_behurt:32,
									 V3_curt:32,
									 (length(V3_ext)):16,
									 (list_to_binary([<<V4_key:32,
											    V4_val:32>>
											  || {V4_key,
											      V4_val}
												 <- V3_ext]))/binary>>
								       || #arena_peak_role_partner{pos
												       =
												       V3_pos,
												   id
												       =
												       V3_id,
												   bid
												       =
												       V3_bid,
												   lev
												       =
												       V3_lev,
												   star
												       =
												       V3_star,
												   break_lev
												       =
												       V3_break_lev,
												   power
												       =
												       V3_power,
												   skin_id
												       =
												       V3_skin_id,
												   hurt
												       =
												       V3_hurt,
												   behurt
												       =
												       V3_behurt,
												   curt
												       =
												       V3_curt,
												   ext
												       =
												       V3_ext}
									      <- V2_plist]))/binary>>
						    || #arena_peak_role_defense{order
										    =
										    V2_order,
										formation_type
										    =
										    V2_formation_type,
										hallows_id
										    =
										    V2_hallows_id,
										hallows_look_id
										    =
										    V2_hallows_look_id,
										power
										    =
										    V2_power,
										plist
										    =
										    V2_plist}
							   <- V1_b_defense]))/binary,
				   V1_ret:8, (length(V1_result_info)):16,
				   (list_to_binary([<<V2_order:8, V2_ret:8,
						      V2_time:32, V2_round:8,
						      V2_a_end_hp:8,
						      V2_b_end_hp:8,
						      V2_replay_id:32,
						      (protocol:pack(string,
								     V2_replay_sid))/binary>>
						    || #arena_peak_result_info{order
										   =
										   V2_order,
									       ret
										   =
										   V2_ret,
									       time
										   =
										   V2_time,
									       round
										   =
										   V2_round,
									       a_end_hp
										   =
										   V2_a_end_hp,
									       b_end_hp
										   =
										   V2_b_end_hp,
									       replay_info
										   =
										   {V2_replay_id,
										    V2_replay_sid}}
							   <- V1_result_info]))/binary,
				   V1_a_sprite_lev:16,
				   (length(V1_a_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_a_sprites]))/binary,
				   V1_b_sprite_lev:16,
				   (length(V1_b_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_b_sprites]))/binary,
				   (length(V1_a_sprites_list)):16,
				   (list_to_binary([<<V2_team:8,
						      (length(V2_sprites_list)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_item_bid:32>>
								       || {V3_pos,
									   V3_item_bid}
									      <- V2_sprites_list]))/binary>>
						    || {V2_team,
							V2_sprites_list}
							   <- V1_a_sprites_list]))/binary,
				   (length(V1_b_sprites_list)):16,
				   (list_to_binary([<<V2_team:8,
						      (length(V2_sprites_list)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_item_bid:32>>
								       || {V3_pos,
									   V3_item_bid}
									      <- V2_sprites_list]))/binary>>
						    || {V2_team,
							V2_sprites_list}
							   <- V1_b_sprites_list]))/binary>>
				 || {V1_id, V1_score,
				     #peak_champion_pk{step = V1_step,
						       round = V1_round,
						       group = V1_group,
						       a_bet = V1_a_bet,
						       a_id =
							   {V1_a_rid,
							    V1_a_srv_id},
						       a_name = V1_a_name,
						       a_lev = V1_a_lev,
						       a_face = V1_a_face,
						       a_face_update_time =
							   V1_a_face_update_time,
						       a_face_file =
							   V1_a_face_file,
						       a_avatar_id =
							   V1_a_avatar_id,
						       a_sex = V1_a_sex,
						       a_power = V1_a_power,
						       a_defense = V1_a_defense,
						       b_bet = V1_b_bet,
						       b_id =
							   {V1_b_rid,
							    V1_b_srv_id},
						       b_name = V1_b_name,
						       b_lev = V1_b_lev,
						       b_face = V1_b_face,
						       b_face_update_time =
							   V1_b_face_update_time,
						       b_face_file =
							   V1_b_face_file,
						       b_avatar_id =
							   V1_b_avatar_id,
						       b_sex = V1_b_sex,
						       b_power = V1_b_power,
						       b_defense = V1_b_defense,
						       ret = V1_ret,
						       result_info =
							   V1_result_info,
						       a_sprite_lev =
							   V1_a_sprite_lev,
						       a_sprites = V1_a_sprites,
						       b_sprite_lev =
							   V1_b_sprite_lev,
						       b_sprites = V1_b_sprites,
						       a_sprites_list =
							   V1_a_sprites_list,
						       b_sprites_list =
							   V1_b_sprites_list}}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27708:16,
       D_a_t_a/binary>>};
pack(27709, cli, {V0_zone_id, V0_type}) ->
    D_a_t_a = <<V0_zone_id:32, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27709:16,
       D_a_t_a/binary>>};
pack(27709, srv, {V0_zone_id, V0_type, V0_list}) ->
    D_a_t_a = <<V0_zone_id:32, V0_type:8,
		(length(V0_list)):16,
		(list_to_binary([<<V1_group:8, (length(V1_pos_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_rid:32,
						      (protocol:pack(string,
								     V2_srv_id))/binary,
						      (protocol:pack(string,
								     V2_name))/binary,
						      V2_lev:16, V2_face_id:32,
						      V2_avatar_bid:32,
						      V2_ret:8,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_ext_type:8,
									 V3_ext_val:32,
									 (protocol:pack(string,
											V3_ext_str_val))/binary>>
								       || {V3_ext_type,
									   V3_ext_val,
									   V3_ext_str_val}
									      <- V2_ext]))/binary>>
						    || #peak_champion_32_pk{pos
										=
										V2_pos,
									    id =
										{V2_rid,
										 V2_srv_id},
									    name
										=
										V2_name,
									    lev
										=
										V2_lev,
									    face_id
										=
										V2_face_id,
									    avatar_bid
										=
										V2_avatar_bid,
									    ret
										=
										V2_ret,
									    ext
										=
										V2_ext}
							   <- V1_pos_list]))/binary>>
				 || {V1_group, V1_pos_list}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27709:16,
       D_a_t_a/binary>>};
pack(27710, cli, {V0_zone_id}) ->
    D_a_t_a = <<V0_zone_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27710:16,
       D_a_t_a/binary>>};
pack(27710, srv, {V0_zone_id, V0_pos_list}) ->
    D_a_t_a = <<V0_zone_id:32, (length(V0_pos_list)):16,
		(list_to_binary([<<V1_pos:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face_id:32, V1_avatar_bid:32,
				   V1_ret:8, (length(V1_ext)):16,
				   (list_to_binary([<<V2_ext_type:8,
						      V2_ext_val:32,
						      (protocol:pack(string,
								     V2_ext_str_val))/binary>>
						    || {V2_ext_type, V2_ext_val,
							V2_ext_str_val}
							   <- V1_ext]))/binary>>
				 || #peak_champion_32_pk{pos = V1_pos,
							 id =
							     {V1_rid,
							      V1_srv_id},
							 name = V1_name,
							 lev = V1_lev,
							 face_id = V1_face_id,
							 avatar_bid =
							     V1_avatar_bid,
							 ret = V1_ret,
							 ext = V1_ext}
					<- V0_pos_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27710:16,
       D_a_t_a/binary>>};
pack(27711, cli, {}) -> {ok, <<2:32, 27711:16>>};
pack(27711, srv, {V0_group, V0_pos}) ->
    D_a_t_a = <<V0_group:8, V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27711:16,
       D_a_t_a/binary>>};
pack(27712, cli,
     {V0_zone_id, V0_type, V0_group, V0_pos}) ->
    D_a_t_a = <<V0_zone_id:32, V0_type:8, V0_group:8,
		V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27712:16,
       D_a_t_a/binary>>};
pack(27712, srv,
     {V0_zone_id, V0_type,
      #peak_champion_pk{step = V0_step, round = V0_round,
			group = V0_group, a_bet = V0_a_bet,
			a_id = {V0_a_rid, V0_a_srv_id}, a_name = V0_a_name,
			a_lev = V0_a_lev, a_face = V0_a_face,
			a_face_update_time = V0_a_face_update_time,
			a_face_file = V0_a_face_file,
			a_avatar_id = V0_a_avatar_id, a_sex = V0_a_sex,
			a_power = V0_a_power, a_defense = V0_a_defense,
			b_bet = V0_b_bet, b_id = {V0_b_rid, V0_b_srv_id},
			b_name = V0_b_name, b_lev = V0_b_lev,
			b_face = V0_b_face,
			b_face_update_time = V0_b_face_update_time,
			b_face_file = V0_b_face_file,
			b_avatar_id = V0_b_avatar_id, b_sex = V0_b_sex,
			b_power = V0_b_power, b_defense = V0_b_defense,
			ret = V0_ret, result_info = V0_result_info,
			a_sprite_lev = V0_a_sprite_lev,
			a_sprites = V0_a_sprites,
			b_sprite_lev = V0_b_sprite_lev,
			b_sprites = V0_b_sprites,
			a_sprites_list = V0_a_sprites_list,
			b_sprites_list = V0_b_sprites_list}}) ->
    D_a_t_a = <<V0_zone_id:32, V0_type:8, V0_step:32,
		V0_round:8, V0_group:8, V0_a_bet:32, V0_a_rid:32,
		(protocol:pack(string, V0_a_srv_id))/binary,
		(protocol:pack(string, V0_a_name))/binary, V0_a_lev:16,
		V0_a_face:32, V0_a_face_update_time:32,
		(protocol:pack(string, V0_a_face_file))/binary,
		V0_a_avatar_id:32, V0_a_sex:8, V0_a_power:32,
		(length(V0_a_defense)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   V1_hallows_id:32, V1_hallows_look_id:32,
				   V1_power:32, (length(V1_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32,
						      V2_skin_id:32, V2_hurt:32,
						      V2_behurt:32, V2_curt:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #arena_peak_role_partner{pos
										    =
										    V2_pos,
										id
										    =
										    V2_id,
										bid
										    =
										    V2_bid,
										lev
										    =
										    V2_lev,
										star
										    =
										    V2_star,
										break_lev
										    =
										    V2_break_lev,
										power
										    =
										    V2_power,
										skin_id
										    =
										    V2_skin_id,
										hurt
										    =
										    V2_hurt,
										behurt
										    =
										    V2_behurt,
										curt
										    =
										    V2_curt,
										ext
										    =
										    V2_ext}
							   <- V1_plist]))/binary>>
				 || #arena_peak_role_defense{order = V1_order,
							     formation_type =
								 V1_formation_type,
							     hallows_id =
								 V1_hallows_id,
							     hallows_look_id =
								 V1_hallows_look_id,
							     power = V1_power,
							     plist = V1_plist}
					<- V0_a_defense]))/binary,
		V0_b_bet:32, V0_b_rid:32,
		(protocol:pack(string, V0_b_srv_id))/binary,
		(protocol:pack(string, V0_b_name))/binary, V0_b_lev:16,
		V0_b_face:32, V0_b_face_update_time:32,
		(protocol:pack(string, V0_b_face_file))/binary,
		V0_b_avatar_id:32, V0_b_sex:8, V0_b_power:32,
		(length(V0_b_defense)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   V1_hallows_id:32, V1_hallows_look_id:32,
				   V1_power:32, (length(V1_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32,
						      V2_skin_id:32, V2_hurt:32,
						      V2_behurt:32, V2_curt:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #arena_peak_role_partner{pos
										    =
										    V2_pos,
										id
										    =
										    V2_id,
										bid
										    =
										    V2_bid,
										lev
										    =
										    V2_lev,
										star
										    =
										    V2_star,
										break_lev
										    =
										    V2_break_lev,
										power
										    =
										    V2_power,
										skin_id
										    =
										    V2_skin_id,
										hurt
										    =
										    V2_hurt,
										behurt
										    =
										    V2_behurt,
										curt
										    =
										    V2_curt,
										ext
										    =
										    V2_ext}
							   <- V1_plist]))/binary>>
				 || #arena_peak_role_defense{order = V1_order,
							     formation_type =
								 V1_formation_type,
							     hallows_id =
								 V1_hallows_id,
							     hallows_look_id =
								 V1_hallows_look_id,
							     power = V1_power,
							     plist = V1_plist}
					<- V0_b_defense]))/binary,
		V0_ret:8, (length(V0_result_info)):16,
		(list_to_binary([<<V1_order:8, V1_ret:8, V1_time:32,
				   V1_round:8, V1_a_end_hp:8, V1_b_end_hp:8,
				   V1_replay_id:32,
				   (protocol:pack(string,
						  V1_replay_sid))/binary>>
				 || #arena_peak_result_info{order = V1_order,
							    ret = V1_ret,
							    time = V1_time,
							    round = V1_round,
							    a_end_hp =
								V1_a_end_hp,
							    b_end_hp =
								V1_b_end_hp,
							    replay_info =
								{V1_replay_id,
								 V1_replay_sid}}
					<- V0_result_info]))/binary,
		V0_a_sprite_lev:16, (length(V0_a_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_a_sprites]))/binary,
		V0_b_sprite_lev:16, (length(V0_b_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_b_sprites]))/binary,
		(length(V0_a_sprites_list)):16,
		(list_to_binary([<<V1_team:8,
				   (length(V1_sprites_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites_list]))/binary>>
				 || {V1_team, V1_sprites_list}
					<- V0_a_sprites_list]))/binary,
		(length(V0_b_sprites_list)):16,
		(list_to_binary([<<V1_team:8,
				   (length(V1_sprites_list)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites_list]))/binary>>
				 || {V1_team, V1_sprites_list}
					<- V0_b_sprites_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27712:16,
       D_a_t_a/binary>>};
pack(27713, cli, {V0_zone_id, V0_period}) ->
    D_a_t_a = <<V0_zone_id:32, V0_period:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27713:16,
       D_a_t_a/binary>>};
pack(27713, srv,
     {V0_zone_id, V0_period, V0_arena_peak_rank}) ->
    D_a_t_a = <<V0_zone_id:32, V0_period:32,
		(length(V0_arena_peak_rank)):16,
		(list_to_binary([<<V1_rank:16, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_avatar_bid:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #arena_peak_rank{rank = V1_rank,
						     id = {V1_rid, V1_srv_id},
						     name = V1_name,
						     face_id = V1_face_id,
						     avatar_bid = V1_avatar_bid,
						     face_update_time =
							 V1_face_update_time,
						     face_file = V1_face_file}
					<- V0_arena_peak_rank]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27713:16,
       D_a_t_a/binary>>};
pack(27714, cli,
     {V0_zone_id, V0_start_num, V0_end_num}) ->
    D_a_t_a = <<V0_zone_id:32, V0_start_num:32,
		V0_end_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27714:16,
       D_a_t_a/binary>>};
pack(27714, srv,
     {V0_rank, V0_worship, V0_power, V0_score, V0_rank_list,
      V0_zone_id, V0_start_num, V0_end_num,
      V0_day_worship}) ->
    D_a_t_a = <<V0_rank:16, V0_worship:32, V0_power:32,
		V0_score:32, (length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face_id:32, V1_sex:8,
				   V1_rank:16, V1_score:16, V1_power:32,
				   V1_avatar_bid:32, V1_face_update_time:32,
				   (protocol:pack(string, V1_face_file))/binary,
				   V1_worship:32, V1_worship_status:8>>
				 || {#arena_peak_rank{id = {V1_rid, V1_srv_id},
						      name = V1_name,
						      lev = V1_lev,
						      face_id = V1_face_id,
						      sex = V1_sex,
						      rank = V1_rank,
						      score = V1_score,
						      power = V1_power,
						      avatar_bid =
							  V1_avatar_bid,
						      face_update_time =
							  V1_face_update_time,
						      face_file = V1_face_file},
				     V1_worship, V1_worship_status}
					<- V0_rank_list]))/binary,
		V0_zone_id:32, V0_start_num:32, V0_end_num:32,
		V0_day_worship:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27714:16,
       D_a_t_a/binary>>};
pack(27715, srv, {V0_time, V0_rank_list}) ->
    D_a_t_a = <<V0_time:32, (length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face_id:32, V1_sex:8,
				   V1_rank:16, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {#arena_peak_champion_role{id =
								   {V1_rid,
								    V1_srv_id},
							       name = V1_name,
							       lev = V1_lev,
							       face_id =
								   V1_face_id,
							       sex = V1_sex,
							       rank = V1_rank,
							       face_update_time
								   =
								   V1_face_update_time,
							       face_file =
								   V1_face_file}}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27715:16,
       D_a_t_a/binary>>};
pack(27716, srv, {}) -> {ok, <<2:32, 27716:16>>};
pack(27720, cli, {}) -> {ok, <<2:32, 27720:16>>};
pack(27720, srv, {V0_zone_info}) ->
    D_a_t_a = <<(length(V0_zone_info)):16,
		(list_to_binary([<<V1_period:32, V1_max_zone_id:32,
				   V1_self_zone_id:32>>
				 || {V1_period, V1_max_zone_id, V1_self_zone_id}
					<- V0_zone_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27720:16,
       D_a_t_a/binary>>};
pack(27725, cli, {V0_formations}) ->
    D_a_t_a = <<(length(V0_formations)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   (length(V1_pos_info)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32>>
						    || {V2_pos, V2_id}
							   <- V1_pos_info]))/binary,
				   V1_hallows_id:32>>
				 || {V1_order, V1_formation_type, V1_pos_info,
				     V1_hallows_id}
					<- V0_formations]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27725:16,
       D_a_t_a/binary>>};
pack(27725, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27725:16,
       D_a_t_a/binary>>};
pack(27726, cli, {}) -> {ok, <<2:32, 27726:16>>};
pack(27726, srv, {V0_formations}) ->
    D_a_t_a = <<(length(V0_formations)):16,
		(list_to_binary([<<V1_order:8, V1_formation_type:8,
				   (length(V1_pos_info)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32>>
						    || #formation_pos{pos =
									  V2_pos,
								      id =
									  V2_id}
							   <- V1_pos_info]))/binary,
				   V1_hallows_id:32>>
				 || {V1_order, V1_formation_type, V1_pos_info,
				     V1_hallows_id}
					<- V0_formations]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27726:16,
       D_a_t_a/binary>>};
pack(27730, cli, {}) -> {ok, <<2:32, 27730:16>>};
pack(27730, srv, {V0_point_info}) ->
    D_a_t_a = <<(length(V0_point_info)):16,
		(list_to_binary([<<V1_type:8, V1_is_point:8>>
				 || {V1_type, V1_is_point}
					<- V0_point_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27730:16,
       D_a_t_a/binary>>};
pack(27731, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27731:16,
       D_a_t_a/binary>>};
pack(27731, srv, {}) -> {ok, <<2:32, 27731:16>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(27700, srv, _B0) -> {ok, {}};
unpack(27700, cli, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_step, _B3} = protocol:uint32(_B2),
    {V1_step_status, _B4} = protocol:uint8(_B3),
    {V1_step_status_time, _B5} = protocol:uint32(_B4),
    {V1_round, _B6} = protocol:uint8(_B5),
    {V1_round_status, _B7} = protocol:uint8(_B6),
    {V1_round_status_time, _B8} = protocol:uint32(_B7),
    {V1_flag, _B9} = protocol:uint8(_B8),
    {V1_period, _B10} = protocol:uint32(_B9),
    {V1_zone_id, _B11} = protocol:uint32(_B10),
    {V1_max_zone_id, _B12} = protocol:uint32(_B11),
    {ok,
     {V1_start_time, V1_end_time, V1_step, V1_step_status,
      V1_step_status_time, V1_round, V1_round_status,
      V1_round_status_time, V1_flag, V1_period, V1_zone_id,
      V1_max_zone_id}};
unpack(27701, srv, _B0) -> {ok, {}};
unpack(27701, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_best_rank, _B2} = protocol:uint16(_B1),
    {V1_can_bet, _B3} = protocol:uint32(_B2),
    {V1_group_256, _B4} = protocol:uint8(_B3),
    {V1_group_64, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_rank, V1_best_rank, V1_can_bet, V1_group_256,
      V1_group_64}};
unpack(27702, srv, _B0) -> {ok, {}};
unpack(27702, cli, _B0) ->
    {V1_step, _B1} = protocol:uint32(_B0),
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
    {V1_a_defense, _B41} = protocol:array(_B14,
					  fun (_B15) ->
						  {V2_order, _B16} =
						      protocol:uint8(_B15),
						  {V2_formation_type, _B17} =
						      protocol:uint8(_B16),
						  {V2_hallows_id, _B18} =
						      protocol:uint32(_B17),
						  {V2_hallows_look_id, _B19} =
						      protocol:uint32(_B18),
						  {V2_power, _B20} =
						      protocol:uint32(_B19),
						  {V2_plist, _B39} =
						      protocol:array(_B20,
								     fun
								       (_B21) ->
									   {V3_pos,
									    _B22} =
									       protocol:uint8(_B21),
									   {V3_id,
									    _B23} =
									       protocol:uint32(_B22),
									   {V3_bid,
									    _B24} =
									       protocol:uint32(_B23),
									   {V3_lev,
									    _B25} =
									       protocol:uint16(_B24),
									   {V3_star,
									    _B26} =
									       protocol:uint8(_B25),
									   {V3_break_lev,
									    _B27} =
									       protocol:uint8(_B26),
									   {V3_power,
									    _B28} =
									       protocol:uint32(_B27),
									   {V3_skin_id,
									    _B29} =
									       protocol:uint32(_B28),
									   {V3_hurt,
									    _B30} =
									       protocol:uint32(_B29),
									   {V3_behurt,
									    _B31} =
									       protocol:uint32(_B30),
									   {V3_curt,
									    _B32} =
									       protocol:uint32(_B31),
									   {V3_ext,
									    _B37} =
									       protocol:array(_B32,
											      fun
												(_B33) ->
												    {V4_key,
												     _B34} =
													protocol:uint32(_B33),
												    {V4_val,
												     _B35} =
													protocol:uint32(_B34),
												    {{V4_key,
												      V4_val},
												     _B35}
											      end),
									   {{V3_pos,
									     V3_id,
									     V3_bid,
									     V3_lev,
									     V3_star,
									     V3_break_lev,
									     V3_power,
									     V3_skin_id,
									     V3_hurt,
									     V3_behurt,
									     V3_curt,
									     V3_ext},
									    _B37}
								     end),
						  {{V2_order, V2_formation_type,
						    V2_hallows_id,
						    V2_hallows_look_id,
						    V2_power, V2_plist},
						   _B39}
					  end),
    {V1_b_bet, _B42} = protocol:uint32(_B41),
    {V1_b_rid, _B43} = protocol:uint32(_B42),
    {V1_b_srv_id, _B44} = protocol:string(_B43),
    {V1_b_name, _B45} = protocol:string(_B44),
    {V1_b_lev, _B46} = protocol:uint16(_B45),
    {V1_b_face, _B47} = protocol:uint32(_B46),
    {V1_b_face_update_time, _B48} = protocol:uint32(_B47),
    {V1_b_face_file, _B49} = protocol:string(_B48),
    {V1_b_avatar_id, _B50} = protocol:uint32(_B49),
    {V1_b_sex, _B51} = protocol:uint8(_B50),
    {V1_b_power, _B52} = protocol:uint32(_B51),
    {V1_b_defense, _B79} = protocol:array(_B52,
					  fun (_B53) ->
						  {V2_order, _B54} =
						      protocol:uint8(_B53),
						  {V2_formation_type, _B55} =
						      protocol:uint8(_B54),
						  {V2_hallows_id, _B56} =
						      protocol:uint32(_B55),
						  {V2_hallows_look_id, _B57} =
						      protocol:uint32(_B56),
						  {V2_power, _B58} =
						      protocol:uint32(_B57),
						  {V2_plist, _B77} =
						      protocol:array(_B58,
								     fun
								       (_B59) ->
									   {V3_pos,
									    _B60} =
									       protocol:uint8(_B59),
									   {V3_id,
									    _B61} =
									       protocol:uint32(_B60),
									   {V3_bid,
									    _B62} =
									       protocol:uint32(_B61),
									   {V3_lev,
									    _B63} =
									       protocol:uint16(_B62),
									   {V3_star,
									    _B64} =
									       protocol:uint8(_B63),
									   {V3_break_lev,
									    _B65} =
									       protocol:uint8(_B64),
									   {V3_power,
									    _B66} =
									       protocol:uint32(_B65),
									   {V3_skin_id,
									    _B67} =
									       protocol:uint32(_B66),
									   {V3_hurt,
									    _B68} =
									       protocol:uint32(_B67),
									   {V3_behurt,
									    _B69} =
									       protocol:uint32(_B68),
									   {V3_curt,
									    _B70} =
									       protocol:uint32(_B69),
									   {V3_ext,
									    _B75} =
									       protocol:array(_B70,
											      fun
												(_B71) ->
												    {V4_key,
												     _B72} =
													protocol:uint32(_B71),
												    {V4_val,
												     _B73} =
													protocol:uint32(_B72),
												    {{V4_key,
												      V4_val},
												     _B73}
											      end),
									   {{V3_pos,
									     V3_id,
									     V3_bid,
									     V3_lev,
									     V3_star,
									     V3_break_lev,
									     V3_power,
									     V3_skin_id,
									     V3_hurt,
									     V3_behurt,
									     V3_curt,
									     V3_ext},
									    _B75}
								     end),
						  {{V2_order, V2_formation_type,
						    V2_hallows_id,
						    V2_hallows_look_id,
						    V2_power, V2_plist},
						   _B77}
					  end),
    {V1_ret, _B80} = protocol:uint8(_B79),
    {V1_result_info, _B91} = protocol:array(_B80,
					    fun (_B81) ->
						    {V2_order, _B82} =
							protocol:uint8(_B81),
						    {V2_ret, _B83} =
							protocol:uint8(_B82),
						    {V2_time, _B84} =
							protocol:uint32(_B83),
						    {V2_round, _B85} =
							protocol:uint8(_B84),
						    {V2_a_end_hp, _B86} =
							protocol:uint8(_B85),
						    {V2_b_end_hp, _B87} =
							protocol:uint8(_B86),
						    {V2_replay_id, _B88} =
							protocol:uint32(_B87),
						    {V2_replay_sid, _B89} =
							protocol:string(_B88),
						    {{V2_order, V2_ret, V2_time,
						      V2_round, V2_a_end_hp,
						      V2_b_end_hp, V2_replay_id,
						      V2_replay_sid},
						     _B89}
					    end),
    {V1_a_sprite_lev, _B92} = protocol:uint16(_B91),
    {V1_a_sprites, _B97} = protocol:array(_B92,
					  fun (_B93) ->
						  {V2_pos, _B94} =
						      protocol:uint8(_B93),
						  {V2_item_bid, _B95} =
						      protocol:uint32(_B94),
						  {{V2_pos, V2_item_bid}, _B95}
					  end),
    {V1_b_sprite_lev, _B98} = protocol:uint16(_B97),
    {V1_b_sprites, _B103} = protocol:array(_B98,
					   fun (_B99) ->
						   {V2_pos, _B100} =
						       protocol:uint8(_B99),
						   {V2_item_bid, _B101} =
						       protocol:uint32(_B100),
						   {{V2_pos, V2_item_bid},
						    _B101}
					   end),
    {V1_a_sprites_list, _B112} = protocol:array(_B103,
						fun (_B104) ->
							{V2_team, _B105} =
							    protocol:uint8(_B104),
							{V2_sprites_list,
							 _B110} =
							    protocol:array(_B105,
									   fun
									     (_B106) ->
										 {V3_pos,
										  _B107} =
										     protocol:uint8(_B106),
										 {V3_item_bid,
										  _B108} =
										     protocol:uint32(_B107),
										 {{V3_pos,
										   V3_item_bid},
										  _B108}
									   end),
							{{V2_team,
							  V2_sprites_list},
							 _B110}
						end),
    {V1_b_sprites_list, _B121} = protocol:array(_B112,
						fun (_B113) ->
							{V2_team, _B114} =
							    protocol:uint8(_B113),
							{V2_sprites_list,
							 _B119} =
							    protocol:array(_B114,
									   fun
									     (_B115) ->
										 {V3_pos,
										  _B116} =
										     protocol:uint8(_B115),
										 {V3_item_bid,
										  _B117} =
										     protocol:uint32(_B116),
										 {{V3_pos,
										   V3_item_bid},
										  _B117}
									   end),
							{{V2_team,
							  V2_sprites_list},
							 _B119}
						end),
    {ok,
     {V1_step, V1_round, V1_group, V1_a_bet, V1_a_rid,
      V1_a_srv_id, V1_a_name, V1_a_lev, V1_a_face,
      V1_a_face_update_time, V1_a_face_file, V1_a_avatar_id,
      V1_a_sex, V1_a_power, V1_a_defense, V1_b_bet, V1_b_rid,
      V1_b_srv_id, V1_b_name, V1_b_lev, V1_b_face,
      V1_b_face_update_time, V1_b_face_file, V1_b_avatar_id,
      V1_b_sex, V1_b_power, V1_b_defense, V1_ret,
      V1_result_info, V1_a_sprite_lev, V1_a_sprites,
      V1_b_sprite_lev, V1_b_sprites, V1_a_sprites_list,
      V1_b_sprites_list}};
unpack(27703, srv, _B0) -> {ok, {}};
unpack(27703, cli, _B0) ->
    {V1_bet_type, _B1} = protocol:uint8(_B0),
    {V1_bet_val, _B2} = protocol:uint32(_B1),
    {V1_a_bet_ratio, _B3} = protocol:uint16(_B2),
    {V1_b_bet_ratio, _B4} = protocol:uint16(_B3),
    {V1_step, _B5} = protocol:uint32(_B4),
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
    {V1_a_defense, _B45} = protocol:array(_B18,
					  fun (_B19) ->
						  {V2_order, _B20} =
						      protocol:uint8(_B19),
						  {V2_formation_type, _B21} =
						      protocol:uint8(_B20),
						  {V2_hallows_id, _B22} =
						      protocol:uint32(_B21),
						  {V2_hallows_look_id, _B23} =
						      protocol:uint32(_B22),
						  {V2_power, _B24} =
						      protocol:uint32(_B23),
						  {V2_plist, _B43} =
						      protocol:array(_B24,
								     fun
								       (_B25) ->
									   {V3_pos,
									    _B26} =
									       protocol:uint8(_B25),
									   {V3_id,
									    _B27} =
									       protocol:uint32(_B26),
									   {V3_bid,
									    _B28} =
									       protocol:uint32(_B27),
									   {V3_lev,
									    _B29} =
									       protocol:uint16(_B28),
									   {V3_star,
									    _B30} =
									       protocol:uint8(_B29),
									   {V3_break_lev,
									    _B31} =
									       protocol:uint8(_B30),
									   {V3_power,
									    _B32} =
									       protocol:uint32(_B31),
									   {V3_skin_id,
									    _B33} =
									       protocol:uint32(_B32),
									   {V3_hurt,
									    _B34} =
									       protocol:uint32(_B33),
									   {V3_behurt,
									    _B35} =
									       protocol:uint32(_B34),
									   {V3_curt,
									    _B36} =
									       protocol:uint32(_B35),
									   {V3_ext,
									    _B41} =
									       protocol:array(_B36,
											      fun
												(_B37) ->
												    {V4_key,
												     _B38} =
													protocol:uint32(_B37),
												    {V4_val,
												     _B39} =
													protocol:uint32(_B38),
												    {{V4_key,
												      V4_val},
												     _B39}
											      end),
									   {{V3_pos,
									     V3_id,
									     V3_bid,
									     V3_lev,
									     V3_star,
									     V3_break_lev,
									     V3_power,
									     V3_skin_id,
									     V3_hurt,
									     V3_behurt,
									     V3_curt,
									     V3_ext},
									    _B41}
								     end),
						  {{V2_order, V2_formation_type,
						    V2_hallows_id,
						    V2_hallows_look_id,
						    V2_power, V2_plist},
						   _B43}
					  end),
    {V1_b_bet, _B46} = protocol:uint32(_B45),
    {V1_b_rid, _B47} = protocol:uint32(_B46),
    {V1_b_srv_id, _B48} = protocol:string(_B47),
    {V1_b_name, _B49} = protocol:string(_B48),
    {V1_b_lev, _B50} = protocol:uint16(_B49),
    {V1_b_face, _B51} = protocol:uint32(_B50),
    {V1_b_face_update_time, _B52} = protocol:uint32(_B51),
    {V1_b_face_file, _B53} = protocol:string(_B52),
    {V1_b_avatar_id, _B54} = protocol:uint32(_B53),
    {V1_b_sex, _B55} = protocol:uint8(_B54),
    {V1_b_power, _B56} = protocol:uint32(_B55),
    {V1_b_defense, _B83} = protocol:array(_B56,
					  fun (_B57) ->
						  {V2_order, _B58} =
						      protocol:uint8(_B57),
						  {V2_formation_type, _B59} =
						      protocol:uint8(_B58),
						  {V2_hallows_id, _B60} =
						      protocol:uint32(_B59),
						  {V2_hallows_look_id, _B61} =
						      protocol:uint32(_B60),
						  {V2_power, _B62} =
						      protocol:uint32(_B61),
						  {V2_plist, _B81} =
						      protocol:array(_B62,
								     fun
								       (_B63) ->
									   {V3_pos,
									    _B64} =
									       protocol:uint8(_B63),
									   {V3_id,
									    _B65} =
									       protocol:uint32(_B64),
									   {V3_bid,
									    _B66} =
									       protocol:uint32(_B65),
									   {V3_lev,
									    _B67} =
									       protocol:uint16(_B66),
									   {V3_star,
									    _B68} =
									       protocol:uint8(_B67),
									   {V3_break_lev,
									    _B69} =
									       protocol:uint8(_B68),
									   {V3_power,
									    _B70} =
									       protocol:uint32(_B69),
									   {V3_skin_id,
									    _B71} =
									       protocol:uint32(_B70),
									   {V3_hurt,
									    _B72} =
									       protocol:uint32(_B71),
									   {V3_behurt,
									    _B73} =
									       protocol:uint32(_B72),
									   {V3_curt,
									    _B74} =
									       protocol:uint32(_B73),
									   {V3_ext,
									    _B79} =
									       protocol:array(_B74,
											      fun
												(_B75) ->
												    {V4_key,
												     _B76} =
													protocol:uint32(_B75),
												    {V4_val,
												     _B77} =
													protocol:uint32(_B76),
												    {{V4_key,
												      V4_val},
												     _B77}
											      end),
									   {{V3_pos,
									     V3_id,
									     V3_bid,
									     V3_lev,
									     V3_star,
									     V3_break_lev,
									     V3_power,
									     V3_skin_id,
									     V3_hurt,
									     V3_behurt,
									     V3_curt,
									     V3_ext},
									    _B79}
								     end),
						  {{V2_order, V2_formation_type,
						    V2_hallows_id,
						    V2_hallows_look_id,
						    V2_power, V2_plist},
						   _B81}
					  end),
    {V1_ret, _B84} = protocol:uint8(_B83),
    {V1_result_info, _B95} = protocol:array(_B84,
					    fun (_B85) ->
						    {V2_order, _B86} =
							protocol:uint8(_B85),
						    {V2_ret, _B87} =
							protocol:uint8(_B86),
						    {V2_time, _B88} =
							protocol:uint32(_B87),
						    {V2_round, _B89} =
							protocol:uint8(_B88),
						    {V2_a_end_hp, _B90} =
							protocol:uint8(_B89),
						    {V2_b_end_hp, _B91} =
							protocol:uint8(_B90),
						    {V2_replay_id, _B92} =
							protocol:uint32(_B91),
						    {V2_replay_sid, _B93} =
							protocol:string(_B92),
						    {{V2_order, V2_ret, V2_time,
						      V2_round, V2_a_end_hp,
						      V2_b_end_hp, V2_replay_id,
						      V2_replay_sid},
						     _B93}
					    end),
    {V1_a_sprite_lev, _B96} = protocol:uint16(_B95),
    {V1_a_sprites, _B101} = protocol:array(_B96,
					   fun (_B97) ->
						   {V2_pos, _B98} =
						       protocol:uint8(_B97),
						   {V2_item_bid, _B99} =
						       protocol:uint32(_B98),
						   {{V2_pos, V2_item_bid}, _B99}
					   end),
    {V1_b_sprite_lev, _B102} = protocol:uint16(_B101),
    {V1_b_sprites, _B107} = protocol:array(_B102,
					   fun (_B103) ->
						   {V2_pos, _B104} =
						       protocol:uint8(_B103),
						   {V2_item_bid, _B105} =
						       protocol:uint32(_B104),
						   {{V2_pos, V2_item_bid},
						    _B105}
					   end),
    {V1_a_sprites_list, _B116} = protocol:array(_B107,
						fun (_B108) ->
							{V2_team, _B109} =
							    protocol:uint8(_B108),
							{V2_sprites_list,
							 _B114} =
							    protocol:array(_B109,
									   fun
									     (_B110) ->
										 {V3_pos,
										  _B111} =
										     protocol:uint8(_B110),
										 {V3_item_bid,
										  _B112} =
										     protocol:uint32(_B111),
										 {{V3_pos,
										   V3_item_bid},
										  _B112}
									   end),
							{{V2_team,
							  V2_sprites_list},
							 _B114}
						end),
    {V1_b_sprites_list, _B125} = protocol:array(_B116,
						fun (_B117) ->
							{V2_team, _B118} =
							    protocol:uint8(_B117),
							{V2_sprites_list,
							 _B123} =
							    protocol:array(_B118,
									   fun
									     (_B119) ->
										 {V3_pos,
										  _B120} =
										     protocol:uint8(_B119),
										 {V3_item_bid,
										  _B121} =
										     protocol:uint32(_B120),
										 {{V3_pos,
										   V3_item_bid},
										  _B121}
									   end),
							{{V2_team,
							  V2_sprites_list},
							 _B123}
						end),
    {ok,
     {V1_bet_type, V1_bet_val, V1_a_bet_ratio,
      V1_b_bet_ratio, V1_step, V1_round, V1_group, V1_a_bet,
      V1_a_rid, V1_a_srv_id, V1_a_name, V1_a_lev, V1_a_face,
      V1_a_face_update_time, V1_a_face_file, V1_a_avatar_id,
      V1_a_sex, V1_a_power, V1_a_defense, V1_b_bet, V1_b_rid,
      V1_b_srv_id, V1_b_name, V1_b_lev, V1_b_face,
      V1_b_face_update_time, V1_b_face_file, V1_b_avatar_id,
      V1_b_sex, V1_b_power, V1_b_defense, V1_ret,
      V1_result_info, V1_a_sprite_lev, V1_a_sprites,
      V1_b_sprite_lev, V1_b_sprites, V1_a_sprites_list,
      V1_b_sprites_list}};
unpack(27704, srv, _B0) ->
    {V1_bet_type, _B1} = protocol:uint8(_B0),
    {V1_bet_val, _B2} = protocol:uint32(_B1),
    {ok, {V1_bet_type, V1_bet_val}};
unpack(27704, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_can_bet, _B3} = protocol:uint32(_B2),
    {V1_bet_type, _B4} = protocol:uint8(_B3),
    {V1_bet_val, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_code, V1_msg, V1_can_bet, V1_bet_type, V1_bet_val}};
unpack(27705, srv, _B0) -> {ok, {}};
unpack(27705, cli, _B0) ->
    {V1_list, _B128} = protocol:array(_B0,
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
						  protocol:uint32(_B5),
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
					      {V2_a_defense, _B46} =
						  protocol:array(_B19,
								 fun (_B20) ->
									 {V3_order,
									  _B21} =
									     protocol:uint8(_B20),
									 {V3_formation_type,
									  _B22} =
									     protocol:uint8(_B21),
									 {V3_hallows_id,
									  _B23} =
									     protocol:uint32(_B22),
									 {V3_hallows_look_id,
									  _B24} =
									     protocol:uint32(_B23),
									 {V3_power,
									  _B25} =
									     protocol:uint32(_B24),
									 {V3_plist,
									  _B44} =
									     protocol:array(_B25,
											    fun
											      (_B26) ->
												  {V4_pos,
												   _B27} =
												      protocol:uint8(_B26),
												  {V4_id,
												   _B28} =
												      protocol:uint32(_B27),
												  {V4_bid,
												   _B29} =
												      protocol:uint32(_B28),
												  {V4_lev,
												   _B30} =
												      protocol:uint16(_B29),
												  {V4_star,
												   _B31} =
												      protocol:uint8(_B30),
												  {V4_break_lev,
												   _B32} =
												      protocol:uint8(_B31),
												  {V4_power,
												   _B33} =
												      protocol:uint32(_B32),
												  {V4_skin_id,
												   _B34} =
												      protocol:uint32(_B33),
												  {V4_hurt,
												   _B35} =
												      protocol:uint32(_B34),
												  {V4_behurt,
												   _B36} =
												      protocol:uint32(_B35),
												  {V4_curt,
												   _B37} =
												      protocol:uint32(_B36),
												  {V4_ext,
												   _B42} =
												      protocol:array(_B37,
														     fun
														       (_B38) ->
															   {V5_key,
															    _B39} =
															       protocol:uint32(_B38),
															   {V5_val,
															    _B40} =
															       protocol:uint32(_B39),
															   {{V5_key,
															     V5_val},
															    _B40}
														     end),
												  {{V4_pos,
												    V4_id,
												    V4_bid,
												    V4_lev,
												    V4_star,
												    V4_break_lev,
												    V4_power,
												    V4_skin_id,
												    V4_hurt,
												    V4_behurt,
												    V4_curt,
												    V4_ext},
												   _B42}
											    end),
									 {{V3_order,
									   V3_formation_type,
									   V3_hallows_id,
									   V3_hallows_look_id,
									   V3_power,
									   V3_plist},
									  _B44}
								 end),
					      {V2_b_bet, _B47} =
						  protocol:uint32(_B46),
					      {V2_b_rid, _B48} =
						  protocol:uint32(_B47),
					      {V2_b_srv_id, _B49} =
						  protocol:string(_B48),
					      {V2_b_name, _B50} =
						  protocol:string(_B49),
					      {V2_b_lev, _B51} =
						  protocol:uint16(_B50),
					      {V2_b_face, _B52} =
						  protocol:uint32(_B51),
					      {V2_b_face_update_time, _B53} =
						  protocol:uint32(_B52),
					      {V2_b_face_file, _B54} =
						  protocol:string(_B53),
					      {V2_b_avatar_id, _B55} =
						  protocol:uint32(_B54),
					      {V2_b_sex, _B56} =
						  protocol:uint8(_B55),
					      {V2_b_power, _B57} =
						  protocol:uint32(_B56),
					      {V2_b_defense, _B84} =
						  protocol:array(_B57,
								 fun (_B58) ->
									 {V3_order,
									  _B59} =
									     protocol:uint8(_B58),
									 {V3_formation_type,
									  _B60} =
									     protocol:uint8(_B59),
									 {V3_hallows_id,
									  _B61} =
									     protocol:uint32(_B60),
									 {V3_hallows_look_id,
									  _B62} =
									     protocol:uint32(_B61),
									 {V3_power,
									  _B63} =
									     protocol:uint32(_B62),
									 {V3_plist,
									  _B82} =
									     protocol:array(_B63,
											    fun
											      (_B64) ->
												  {V4_pos,
												   _B65} =
												      protocol:uint8(_B64),
												  {V4_id,
												   _B66} =
												      protocol:uint32(_B65),
												  {V4_bid,
												   _B67} =
												      protocol:uint32(_B66),
												  {V4_lev,
												   _B68} =
												      protocol:uint16(_B67),
												  {V4_star,
												   _B69} =
												      protocol:uint8(_B68),
												  {V4_break_lev,
												   _B70} =
												      protocol:uint8(_B69),
												  {V4_power,
												   _B71} =
												      protocol:uint32(_B70),
												  {V4_skin_id,
												   _B72} =
												      protocol:uint32(_B71),
												  {V4_hurt,
												   _B73} =
												      protocol:uint32(_B72),
												  {V4_behurt,
												   _B74} =
												      protocol:uint32(_B73),
												  {V4_curt,
												   _B75} =
												      protocol:uint32(_B74),
												  {V4_ext,
												   _B80} =
												      protocol:array(_B75,
														     fun
														       (_B76) ->
															   {V5_key,
															    _B77} =
															       protocol:uint32(_B76),
															   {V5_val,
															    _B78} =
															       protocol:uint32(_B77),
															   {{V5_key,
															     V5_val},
															    _B78}
														     end),
												  {{V4_pos,
												    V4_id,
												    V4_bid,
												    V4_lev,
												    V4_star,
												    V4_break_lev,
												    V4_power,
												    V4_skin_id,
												    V4_hurt,
												    V4_behurt,
												    V4_curt,
												    V4_ext},
												   _B80}
											    end),
									 {{V3_order,
									   V3_formation_type,
									   V3_hallows_id,
									   V3_hallows_look_id,
									   V3_power,
									   V3_plist},
									  _B82}
								 end),
					      {V2_ret, _B85} =
						  protocol:uint8(_B84),
					      {V2_result_info, _B96} =
						  protocol:array(_B85,
								 fun (_B86) ->
									 {V3_order,
									  _B87} =
									     protocol:uint8(_B86),
									 {V3_ret,
									  _B88} =
									     protocol:uint8(_B87),
									 {V3_time,
									  _B89} =
									     protocol:uint32(_B88),
									 {V3_round,
									  _B90} =
									     protocol:uint8(_B89),
									 {V3_a_end_hp,
									  _B91} =
									     protocol:uint8(_B90),
									 {V3_b_end_hp,
									  _B92} =
									     protocol:uint8(_B91),
									 {V3_replay_id,
									  _B93} =
									     protocol:uint32(_B92),
									 {V3_replay_sid,
									  _B94} =
									     protocol:string(_B93),
									 {{V3_order,
									   V3_ret,
									   V3_time,
									   V3_round,
									   V3_a_end_hp,
									   V3_b_end_hp,
									   V3_replay_id,
									   V3_replay_sid},
									  _B94}
								 end),
					      {V2_a_sprite_lev, _B97} =
						  protocol:uint16(_B96),
					      {V2_a_sprites, _B102} =
						  protocol:array(_B97,
								 fun (_B98) ->
									 {V3_pos,
									  _B99} =
									     protocol:uint8(_B98),
									 {V3_item_bid,
									  _B100} =
									     protocol:uint32(_B99),
									 {{V3_pos,
									   V3_item_bid},
									  _B100}
								 end),
					      {V2_b_sprite_lev, _B103} =
						  protocol:uint16(_B102),
					      {V2_b_sprites, _B108} =
						  protocol:array(_B103,
								 fun (_B104) ->
									 {V3_pos,
									  _B105} =
									     protocol:uint8(_B104),
									 {V3_item_bid,
									  _B106} =
									     protocol:uint32(_B105),
									 {{V3_pos,
									   V3_item_bid},
									  _B106}
								 end),
					      {V2_a_sprites_list, _B117} =
						  protocol:array(_B108,
								 fun (_B109) ->
									 {V3_team,
									  _B110} =
									     protocol:uint8(_B109),
									 {V3_sprites_list,
									  _B115} =
									     protocol:array(_B110,
											    fun
											      (_B111) ->
												  {V4_pos,
												   _B112} =
												      protocol:uint8(_B111),
												  {V4_item_bid,
												   _B113} =
												      protocol:uint32(_B112),
												  {{V4_pos,
												    V4_item_bid},
												   _B113}
											    end),
									 {{V3_team,
									   V3_sprites_list},
									  _B115}
								 end),
					      {V2_b_sprites_list, _B126} =
						  protocol:array(_B117,
								 fun (_B118) ->
									 {V3_team,
									  _B119} =
									     protocol:uint8(_B118),
									 {V3_sprites_list,
									  _B124} =
									     protocol:array(_B119,
											    fun
											      (_B120) ->
												  {V4_pos,
												   _B121} =
												      protocol:uint8(_B120),
												  {V4_item_bid,
												   _B122} =
												      protocol:uint32(_B121),
												  {{V4_pos,
												    V4_item_bid},
												   _B122}
											    end),
									 {{V3_team,
									   V3_sprites_list},
									  _B124}
								 end),
					      {{V2_id, V2_target, V2_bet,
						V2_get_bet, V2_step, V2_round,
						V2_group, V2_a_bet, V2_a_rid,
						V2_a_srv_id, V2_a_name,
						V2_a_lev, V2_a_face,
						V2_a_face_update_time,
						V2_a_face_file, V2_a_avatar_id,
						V2_a_sex, V2_a_power,
						V2_a_defense, V2_b_bet,
						V2_b_rid, V2_b_srv_id,
						V2_b_name, V2_b_lev, V2_b_face,
						V2_b_face_update_time,
						V2_b_face_file, V2_b_avatar_id,
						V2_b_sex, V2_b_power,
						V2_b_defense, V2_ret,
						V2_result_info, V2_a_sprite_lev,
						V2_a_sprites, V2_b_sprite_lev,
						V2_b_sprites, V2_a_sprites_list,
						V2_b_sprites_list},
					       _B126}
				      end),
    {ok, {V1_list}};
unpack(27706, srv, _B0) -> {ok, {}};
unpack(27706, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_cnum, _B2} = protocol:uint8(_B1),
    {V1_win, _B3} = protocol:uint8(_B2),
    {ok, {V1_rank, V1_cnum, V1_win}};
unpack(27707, srv, _B0) -> {ok, {}};
unpack(27707, cli, _B0) ->
    {V1_a_bet, _B1} = protocol:uint32(_B0),
    {V1_b_bet, _B2} = protocol:uint32(_B1),
    {V1_a_bet_ratio, _B3} = protocol:uint16(_B2),
    {V1_b_bet_ratio, _B4} = protocol:uint16(_B3),
    {ok,
     {V1_a_bet, V1_b_bet, V1_a_bet_ratio, V1_b_bet_ratio}};
unpack(27708, srv, _B0) -> {ok, {}};
unpack(27708, cli, _B0) ->
    {V1_list, _B126} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_id, _B2} =
						  protocol:uint16(_B1),
					      {V2_score, _B3} =
						  protocol:uint16(_B2),
					      {V2_step, _B4} =
						  protocol:uint32(_B3),
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
					      {V2_a_defense, _B44} =
						  protocol:array(_B17,
								 fun (_B18) ->
									 {V3_order,
									  _B19} =
									     protocol:uint8(_B18),
									 {V3_formation_type,
									  _B20} =
									     protocol:uint8(_B19),
									 {V3_hallows_id,
									  _B21} =
									     protocol:uint32(_B20),
									 {V3_hallows_look_id,
									  _B22} =
									     protocol:uint32(_B21),
									 {V3_power,
									  _B23} =
									     protocol:uint32(_B22),
									 {V3_plist,
									  _B42} =
									     protocol:array(_B23,
											    fun
											      (_B24) ->
												  {V4_pos,
												   _B25} =
												      protocol:uint8(_B24),
												  {V4_id,
												   _B26} =
												      protocol:uint32(_B25),
												  {V4_bid,
												   _B27} =
												      protocol:uint32(_B26),
												  {V4_lev,
												   _B28} =
												      protocol:uint16(_B27),
												  {V4_star,
												   _B29} =
												      protocol:uint8(_B28),
												  {V4_break_lev,
												   _B30} =
												      protocol:uint8(_B29),
												  {V4_power,
												   _B31} =
												      protocol:uint32(_B30),
												  {V4_skin_id,
												   _B32} =
												      protocol:uint32(_B31),
												  {V4_hurt,
												   _B33} =
												      protocol:uint32(_B32),
												  {V4_behurt,
												   _B34} =
												      protocol:uint32(_B33),
												  {V4_curt,
												   _B35} =
												      protocol:uint32(_B34),
												  {V4_ext,
												   _B40} =
												      protocol:array(_B35,
														     fun
														       (_B36) ->
															   {V5_key,
															    _B37} =
															       protocol:uint32(_B36),
															   {V5_val,
															    _B38} =
															       protocol:uint32(_B37),
															   {{V5_key,
															     V5_val},
															    _B38}
														     end),
												  {{V4_pos,
												    V4_id,
												    V4_bid,
												    V4_lev,
												    V4_star,
												    V4_break_lev,
												    V4_power,
												    V4_skin_id,
												    V4_hurt,
												    V4_behurt,
												    V4_curt,
												    V4_ext},
												   _B40}
											    end),
									 {{V3_order,
									   V3_formation_type,
									   V3_hallows_id,
									   V3_hallows_look_id,
									   V3_power,
									   V3_plist},
									  _B42}
								 end),
					      {V2_b_bet, _B45} =
						  protocol:uint32(_B44),
					      {V2_b_rid, _B46} =
						  protocol:uint32(_B45),
					      {V2_b_srv_id, _B47} =
						  protocol:string(_B46),
					      {V2_b_name, _B48} =
						  protocol:string(_B47),
					      {V2_b_lev, _B49} =
						  protocol:uint16(_B48),
					      {V2_b_face, _B50} =
						  protocol:uint32(_B49),
					      {V2_b_face_update_time, _B51} =
						  protocol:uint32(_B50),
					      {V2_b_face_file, _B52} =
						  protocol:string(_B51),
					      {V2_b_avatar_id, _B53} =
						  protocol:uint32(_B52),
					      {V2_b_sex, _B54} =
						  protocol:uint8(_B53),
					      {V2_b_power, _B55} =
						  protocol:uint32(_B54),
					      {V2_b_defense, _B82} =
						  protocol:array(_B55,
								 fun (_B56) ->
									 {V3_order,
									  _B57} =
									     protocol:uint8(_B56),
									 {V3_formation_type,
									  _B58} =
									     protocol:uint8(_B57),
									 {V3_hallows_id,
									  _B59} =
									     protocol:uint32(_B58),
									 {V3_hallows_look_id,
									  _B60} =
									     protocol:uint32(_B59),
									 {V3_power,
									  _B61} =
									     protocol:uint32(_B60),
									 {V3_plist,
									  _B80} =
									     protocol:array(_B61,
											    fun
											      (_B62) ->
												  {V4_pos,
												   _B63} =
												      protocol:uint8(_B62),
												  {V4_id,
												   _B64} =
												      protocol:uint32(_B63),
												  {V4_bid,
												   _B65} =
												      protocol:uint32(_B64),
												  {V4_lev,
												   _B66} =
												      protocol:uint16(_B65),
												  {V4_star,
												   _B67} =
												      protocol:uint8(_B66),
												  {V4_break_lev,
												   _B68} =
												      protocol:uint8(_B67),
												  {V4_power,
												   _B69} =
												      protocol:uint32(_B68),
												  {V4_skin_id,
												   _B70} =
												      protocol:uint32(_B69),
												  {V4_hurt,
												   _B71} =
												      protocol:uint32(_B70),
												  {V4_behurt,
												   _B72} =
												      protocol:uint32(_B71),
												  {V4_curt,
												   _B73} =
												      protocol:uint32(_B72),
												  {V4_ext,
												   _B78} =
												      protocol:array(_B73,
														     fun
														       (_B74) ->
															   {V5_key,
															    _B75} =
															       protocol:uint32(_B74),
															   {V5_val,
															    _B76} =
															       protocol:uint32(_B75),
															   {{V5_key,
															     V5_val},
															    _B76}
														     end),
												  {{V4_pos,
												    V4_id,
												    V4_bid,
												    V4_lev,
												    V4_star,
												    V4_break_lev,
												    V4_power,
												    V4_skin_id,
												    V4_hurt,
												    V4_behurt,
												    V4_curt,
												    V4_ext},
												   _B78}
											    end),
									 {{V3_order,
									   V3_formation_type,
									   V3_hallows_id,
									   V3_hallows_look_id,
									   V3_power,
									   V3_plist},
									  _B80}
								 end),
					      {V2_ret, _B83} =
						  protocol:uint8(_B82),
					      {V2_result_info, _B94} =
						  protocol:array(_B83,
								 fun (_B84) ->
									 {V3_order,
									  _B85} =
									     protocol:uint8(_B84),
									 {V3_ret,
									  _B86} =
									     protocol:uint8(_B85),
									 {V3_time,
									  _B87} =
									     protocol:uint32(_B86),
									 {V3_round,
									  _B88} =
									     protocol:uint8(_B87),
									 {V3_a_end_hp,
									  _B89} =
									     protocol:uint8(_B88),
									 {V3_b_end_hp,
									  _B90} =
									     protocol:uint8(_B89),
									 {V3_replay_id,
									  _B91} =
									     protocol:uint32(_B90),
									 {V3_replay_sid,
									  _B92} =
									     protocol:string(_B91),
									 {{V3_order,
									   V3_ret,
									   V3_time,
									   V3_round,
									   V3_a_end_hp,
									   V3_b_end_hp,
									   V3_replay_id,
									   V3_replay_sid},
									  _B92}
								 end),
					      {V2_a_sprite_lev, _B95} =
						  protocol:uint16(_B94),
					      {V2_a_sprites, _B100} =
						  protocol:array(_B95,
								 fun (_B96) ->
									 {V3_pos,
									  _B97} =
									     protocol:uint8(_B96),
									 {V3_item_bid,
									  _B98} =
									     protocol:uint32(_B97),
									 {{V3_pos,
									   V3_item_bid},
									  _B98}
								 end),
					      {V2_b_sprite_lev, _B101} =
						  protocol:uint16(_B100),
					      {V2_b_sprites, _B106} =
						  protocol:array(_B101,
								 fun (_B102) ->
									 {V3_pos,
									  _B103} =
									     protocol:uint8(_B102),
									 {V3_item_bid,
									  _B104} =
									     protocol:uint32(_B103),
									 {{V3_pos,
									   V3_item_bid},
									  _B104}
								 end),
					      {V2_a_sprites_list, _B115} =
						  protocol:array(_B106,
								 fun (_B107) ->
									 {V3_team,
									  _B108} =
									     protocol:uint8(_B107),
									 {V3_sprites_list,
									  _B113} =
									     protocol:array(_B108,
											    fun
											      (_B109) ->
												  {V4_pos,
												   _B110} =
												      protocol:uint8(_B109),
												  {V4_item_bid,
												   _B111} =
												      protocol:uint32(_B110),
												  {{V4_pos,
												    V4_item_bid},
												   _B111}
											    end),
									 {{V3_team,
									   V3_sprites_list},
									  _B113}
								 end),
					      {V2_b_sprites_list, _B124} =
						  protocol:array(_B115,
								 fun (_B116) ->
									 {V3_team,
									  _B117} =
									     protocol:uint8(_B116),
									 {V3_sprites_list,
									  _B122} =
									     protocol:array(_B117,
											    fun
											      (_B118) ->
												  {V4_pos,
												   _B119} =
												      protocol:uint8(_B118),
												  {V4_item_bid,
												   _B120} =
												      protocol:uint32(_B119),
												  {{V4_pos,
												    V4_item_bid},
												   _B120}
											    end),
									 {{V3_team,
									   V3_sprites_list},
									  _B122}
								 end),
					      {{V2_id, V2_score, V2_step,
						V2_round, V2_group, V2_a_bet,
						V2_a_rid, V2_a_srv_id,
						V2_a_name, V2_a_lev, V2_a_face,
						V2_a_face_update_time,
						V2_a_face_file, V2_a_avatar_id,
						V2_a_sex, V2_a_power,
						V2_a_defense, V2_b_bet,
						V2_b_rid, V2_b_srv_id,
						V2_b_name, V2_b_lev, V2_b_face,
						V2_b_face_update_time,
						V2_b_face_file, V2_b_avatar_id,
						V2_b_sex, V2_b_power,
						V2_b_defense, V2_ret,
						V2_result_info, V2_a_sprite_lev,
						V2_a_sprites, V2_b_sprite_lev,
						V2_b_sprites, V2_a_sprites_list,
						V2_b_sprites_list},
					       _B124}
				      end),
    {ok, {V1_list}};
unpack(27709, srv, _B0) ->
    {V1_zone_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_zone_id, V1_type}};
unpack(27709, cli, _B0) ->
    {V1_zone_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_list, _B23} = protocol:array(_B2,
				     fun (_B3) ->
					     {V2_group, _B4} =
						 protocol:uint8(_B3),
					     {V2_pos_list, _B21} =
						 protocol:array(_B4,
								fun (_B5) ->
									{V3_pos,
									 _B6} =
									    protocol:uint8(_B5),
									{V3_rid,
									 _B7} =
									    protocol:uint32(_B6),
									{V3_srv_id,
									 _B8} =
									    protocol:string(_B7),
									{V3_name,
									 _B9} =
									    protocol:string(_B8),
									{V3_lev,
									 _B10} =
									    protocol:uint16(_B9),
									{V3_face_id,
									 _B11} =
									    protocol:uint32(_B10),
									{V3_avatar_bid,
									 _B12} =
									    protocol:uint32(_B11),
									{V3_ret,
									 _B13} =
									    protocol:uint8(_B12),
									{V3_ext,
									 _B19} =
									    protocol:array(_B13,
											   fun
											     (_B14) ->
												 {V4_ext_type,
												  _B15} =
												     protocol:uint8(_B14),
												 {V4_ext_val,
												  _B16} =
												     protocol:uint32(_B15),
												 {V4_ext_str_val,
												  _B17} =
												     protocol:string(_B16),
												 {{V4_ext_type,
												   V4_ext_val,
												   V4_ext_str_val},
												  _B17}
											   end),
									{{V3_pos,
									  V3_rid,
									  V3_srv_id,
									  V3_name,
									  V3_lev,
									  V3_face_id,
									  V3_avatar_bid,
									  V3_ret,
									  V3_ext},
									 _B19}
								end),
					     {{V2_group, V2_pos_list}, _B21}
				     end),
    {ok, {V1_zone_id, V1_type, V1_list}};
unpack(27710, srv, _B0) ->
    {V1_zone_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_zone_id}};
unpack(27710, cli, _B0) ->
    {V1_zone_id, _B1} = protocol:uint32(_B0),
    {V1_pos_list, _B18} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_pos, _B3} =
						     protocol:uint8(_B2),
						 {V2_rid, _B4} =
						     protocol:uint32(_B3),
						 {V2_srv_id, _B5} =
						     protocol:string(_B4),
						 {V2_name, _B6} =
						     protocol:string(_B5),
						 {V2_lev, _B7} =
						     protocol:uint16(_B6),
						 {V2_face_id, _B8} =
						     protocol:uint32(_B7),
						 {V2_avatar_bid, _B9} =
						     protocol:uint32(_B8),
						 {V2_ret, _B10} =
						     protocol:uint8(_B9),
						 {V2_ext, _B16} =
						     protocol:array(_B10,
								    fun
								      (_B11) ->
									  {V3_ext_type,
									   _B12} =
									      protocol:uint8(_B11),
									  {V3_ext_val,
									   _B13} =
									      protocol:uint32(_B12),
									  {V3_ext_str_val,
									   _B14} =
									      protocol:string(_B13),
									  {{V3_ext_type,
									    V3_ext_val,
									    V3_ext_str_val},
									   _B14}
								    end),
						 {{V2_pos, V2_rid, V2_srv_id,
						   V2_name, V2_lev, V2_face_id,
						   V2_avatar_bid, V2_ret,
						   V2_ext},
						  _B16}
					 end),
    {ok, {V1_zone_id, V1_pos_list}};
unpack(27711, srv, _B0) -> {ok, {}};
unpack(27711, cli, _B0) ->
    {V1_group, _B1} = protocol:uint8(_B0),
    {V1_pos, _B2} = protocol:uint8(_B1),
    {ok, {V1_group, V1_pos}};
unpack(27712, srv, _B0) ->
    {V1_zone_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_group, _B3} = protocol:uint8(_B2),
    {V1_pos, _B4} = protocol:uint8(_B3),
    {ok, {V1_zone_id, V1_type, V1_group, V1_pos}};
unpack(27712, cli, _B0) ->
    {V1_zone_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_step, _B3} = protocol:uint32(_B2),
    {V1_round, _B4} = protocol:uint8(_B3),
    {V1_group, _B5} = protocol:uint8(_B4),
    {V1_a_bet, _B6} = protocol:uint32(_B5),
    {V1_a_rid, _B7} = protocol:uint32(_B6),
    {V1_a_srv_id, _B8} = protocol:string(_B7),
    {V1_a_name, _B9} = protocol:string(_B8),
    {V1_a_lev, _B10} = protocol:uint16(_B9),
    {V1_a_face, _B11} = protocol:uint32(_B10),
    {V1_a_face_update_time, _B12} = protocol:uint32(_B11),
    {V1_a_face_file, _B13} = protocol:string(_B12),
    {V1_a_avatar_id, _B14} = protocol:uint32(_B13),
    {V1_a_sex, _B15} = protocol:uint8(_B14),
    {V1_a_power, _B16} = protocol:uint32(_B15),
    {V1_a_defense, _B43} = protocol:array(_B16,
					  fun (_B17) ->
						  {V2_order, _B18} =
						      protocol:uint8(_B17),
						  {V2_formation_type, _B19} =
						      protocol:uint8(_B18),
						  {V2_hallows_id, _B20} =
						      protocol:uint32(_B19),
						  {V2_hallows_look_id, _B21} =
						      protocol:uint32(_B20),
						  {V2_power, _B22} =
						      protocol:uint32(_B21),
						  {V2_plist, _B41} =
						      protocol:array(_B22,
								     fun
								       (_B23) ->
									   {V3_pos,
									    _B24} =
									       protocol:uint8(_B23),
									   {V3_id,
									    _B25} =
									       protocol:uint32(_B24),
									   {V3_bid,
									    _B26} =
									       protocol:uint32(_B25),
									   {V3_lev,
									    _B27} =
									       protocol:uint16(_B26),
									   {V3_star,
									    _B28} =
									       protocol:uint8(_B27),
									   {V3_break_lev,
									    _B29} =
									       protocol:uint8(_B28),
									   {V3_power,
									    _B30} =
									       protocol:uint32(_B29),
									   {V3_skin_id,
									    _B31} =
									       protocol:uint32(_B30),
									   {V3_hurt,
									    _B32} =
									       protocol:uint32(_B31),
									   {V3_behurt,
									    _B33} =
									       protocol:uint32(_B32),
									   {V3_curt,
									    _B34} =
									       protocol:uint32(_B33),
									   {V3_ext,
									    _B39} =
									       protocol:array(_B34,
											      fun
												(_B35) ->
												    {V4_key,
												     _B36} =
													protocol:uint32(_B35),
												    {V4_val,
												     _B37} =
													protocol:uint32(_B36),
												    {{V4_key,
												      V4_val},
												     _B37}
											      end),
									   {{V3_pos,
									     V3_id,
									     V3_bid,
									     V3_lev,
									     V3_star,
									     V3_break_lev,
									     V3_power,
									     V3_skin_id,
									     V3_hurt,
									     V3_behurt,
									     V3_curt,
									     V3_ext},
									    _B39}
								     end),
						  {{V2_order, V2_formation_type,
						    V2_hallows_id,
						    V2_hallows_look_id,
						    V2_power, V2_plist},
						   _B41}
					  end),
    {V1_b_bet, _B44} = protocol:uint32(_B43),
    {V1_b_rid, _B45} = protocol:uint32(_B44),
    {V1_b_srv_id, _B46} = protocol:string(_B45),
    {V1_b_name, _B47} = protocol:string(_B46),
    {V1_b_lev, _B48} = protocol:uint16(_B47),
    {V1_b_face, _B49} = protocol:uint32(_B48),
    {V1_b_face_update_time, _B50} = protocol:uint32(_B49),
    {V1_b_face_file, _B51} = protocol:string(_B50),
    {V1_b_avatar_id, _B52} = protocol:uint32(_B51),
    {V1_b_sex, _B53} = protocol:uint8(_B52),
    {V1_b_power, _B54} = protocol:uint32(_B53),
    {V1_b_defense, _B81} = protocol:array(_B54,
					  fun (_B55) ->
						  {V2_order, _B56} =
						      protocol:uint8(_B55),
						  {V2_formation_type, _B57} =
						      protocol:uint8(_B56),
						  {V2_hallows_id, _B58} =
						      protocol:uint32(_B57),
						  {V2_hallows_look_id, _B59} =
						      protocol:uint32(_B58),
						  {V2_power, _B60} =
						      protocol:uint32(_B59),
						  {V2_plist, _B79} =
						      protocol:array(_B60,
								     fun
								       (_B61) ->
									   {V3_pos,
									    _B62} =
									       protocol:uint8(_B61),
									   {V3_id,
									    _B63} =
									       protocol:uint32(_B62),
									   {V3_bid,
									    _B64} =
									       protocol:uint32(_B63),
									   {V3_lev,
									    _B65} =
									       protocol:uint16(_B64),
									   {V3_star,
									    _B66} =
									       protocol:uint8(_B65),
									   {V3_break_lev,
									    _B67} =
									       protocol:uint8(_B66),
									   {V3_power,
									    _B68} =
									       protocol:uint32(_B67),
									   {V3_skin_id,
									    _B69} =
									       protocol:uint32(_B68),
									   {V3_hurt,
									    _B70} =
									       protocol:uint32(_B69),
									   {V3_behurt,
									    _B71} =
									       protocol:uint32(_B70),
									   {V3_curt,
									    _B72} =
									       protocol:uint32(_B71),
									   {V3_ext,
									    _B77} =
									       protocol:array(_B72,
											      fun
												(_B73) ->
												    {V4_key,
												     _B74} =
													protocol:uint32(_B73),
												    {V4_val,
												     _B75} =
													protocol:uint32(_B74),
												    {{V4_key,
												      V4_val},
												     _B75}
											      end),
									   {{V3_pos,
									     V3_id,
									     V3_bid,
									     V3_lev,
									     V3_star,
									     V3_break_lev,
									     V3_power,
									     V3_skin_id,
									     V3_hurt,
									     V3_behurt,
									     V3_curt,
									     V3_ext},
									    _B77}
								     end),
						  {{V2_order, V2_formation_type,
						    V2_hallows_id,
						    V2_hallows_look_id,
						    V2_power, V2_plist},
						   _B79}
					  end),
    {V1_ret, _B82} = protocol:uint8(_B81),
    {V1_result_info, _B93} = protocol:array(_B82,
					    fun (_B83) ->
						    {V2_order, _B84} =
							protocol:uint8(_B83),
						    {V2_ret, _B85} =
							protocol:uint8(_B84),
						    {V2_time, _B86} =
							protocol:uint32(_B85),
						    {V2_round, _B87} =
							protocol:uint8(_B86),
						    {V2_a_end_hp, _B88} =
							protocol:uint8(_B87),
						    {V2_b_end_hp, _B89} =
							protocol:uint8(_B88),
						    {V2_replay_id, _B90} =
							protocol:uint32(_B89),
						    {V2_replay_sid, _B91} =
							protocol:string(_B90),
						    {{V2_order, V2_ret, V2_time,
						      V2_round, V2_a_end_hp,
						      V2_b_end_hp, V2_replay_id,
						      V2_replay_sid},
						     _B91}
					    end),
    {V1_a_sprite_lev, _B94} = protocol:uint16(_B93),
    {V1_a_sprites, _B99} = protocol:array(_B94,
					  fun (_B95) ->
						  {V2_pos, _B96} =
						      protocol:uint8(_B95),
						  {V2_item_bid, _B97} =
						      protocol:uint32(_B96),
						  {{V2_pos, V2_item_bid}, _B97}
					  end),
    {V1_b_sprite_lev, _B100} = protocol:uint16(_B99),
    {V1_b_sprites, _B105} = protocol:array(_B100,
					   fun (_B101) ->
						   {V2_pos, _B102} =
						       protocol:uint8(_B101),
						   {V2_item_bid, _B103} =
						       protocol:uint32(_B102),
						   {{V2_pos, V2_item_bid},
						    _B103}
					   end),
    {V1_a_sprites_list, _B114} = protocol:array(_B105,
						fun (_B106) ->
							{V2_team, _B107} =
							    protocol:uint8(_B106),
							{V2_sprites_list,
							 _B112} =
							    protocol:array(_B107,
									   fun
									     (_B108) ->
										 {V3_pos,
										  _B109} =
										     protocol:uint8(_B108),
										 {V3_item_bid,
										  _B110} =
										     protocol:uint32(_B109),
										 {{V3_pos,
										   V3_item_bid},
										  _B110}
									   end),
							{{V2_team,
							  V2_sprites_list},
							 _B112}
						end),
    {V1_b_sprites_list, _B123} = protocol:array(_B114,
						fun (_B115) ->
							{V2_team, _B116} =
							    protocol:uint8(_B115),
							{V2_sprites_list,
							 _B121} =
							    protocol:array(_B116,
									   fun
									     (_B117) ->
										 {V3_pos,
										  _B118} =
										     protocol:uint8(_B117),
										 {V3_item_bid,
										  _B119} =
										     protocol:uint32(_B118),
										 {{V3_pos,
										   V3_item_bid},
										  _B119}
									   end),
							{{V2_team,
							  V2_sprites_list},
							 _B121}
						end),
    {ok,
     {V1_zone_id, V1_type, V1_step, V1_round, V1_group,
      V1_a_bet, V1_a_rid, V1_a_srv_id, V1_a_name, V1_a_lev,
      V1_a_face, V1_a_face_update_time, V1_a_face_file,
      V1_a_avatar_id, V1_a_sex, V1_a_power, V1_a_defense,
      V1_b_bet, V1_b_rid, V1_b_srv_id, V1_b_name, V1_b_lev,
      V1_b_face, V1_b_face_update_time, V1_b_face_file,
      V1_b_avatar_id, V1_b_sex, V1_b_power, V1_b_defense,
      V1_ret, V1_result_info, V1_a_sprite_lev, V1_a_sprites,
      V1_b_sprite_lev, V1_b_sprites, V1_a_sprites_list,
      V1_b_sprites_list}};
unpack(27713, srv, _B0) ->
    {V1_zone_id, _B1} = protocol:uint32(_B0),
    {V1_period, _B2} = protocol:uint32(_B1),
    {ok, {V1_zone_id, V1_period}};
unpack(27713, cli, _B0) ->
    {V1_zone_id, _B1} = protocol:uint32(_B0),
    {V1_period, _B2} = protocol:uint32(_B1),
    {V1_arena_peak_rank, _B13} = protocol:array(_B2,
						fun (_B3) ->
							{V2_rank, _B4} =
							    protocol:uint16(_B3),
							{V2_rid, _B5} =
							    protocol:uint32(_B4),
							{V2_srv_id, _B6} =
							    protocol:string(_B5),
							{V2_name, _B7} =
							    protocol:string(_B6),
							{V2_face_id, _B8} =
							    protocol:uint32(_B7),
							{V2_avatar_bid, _B9} =
							    protocol:uint32(_B8),
							{V2_face_update_time,
							 _B10} =
							    protocol:uint32(_B9),
							{V2_face_file, _B11} =
							    protocol:string(_B10),
							{{V2_rank, V2_rid,
							  V2_srv_id, V2_name,
							  V2_face_id,
							  V2_avatar_bid,
							  V2_face_update_time,
							  V2_face_file},
							 _B11}
						end),
    {ok, {V1_zone_id, V1_period, V1_arena_peak_rank}};
unpack(27714, srv, _B0) ->
    {V1_zone_id, _B1} = protocol:uint32(_B0),
    {V1_start_num, _B2} = protocol:uint32(_B1),
    {V1_end_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_zone_id, V1_start_num, V1_end_num}};
unpack(27714, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_worship, _B2} = protocol:uint32(_B1),
    {V1_power, _B3} = protocol:uint32(_B2),
    {V1_score, _B4} = protocol:uint32(_B3),
    {V1_rank_list, _B21} = protocol:array(_B4,
					  fun (_B5) ->
						  {V2_rid, _B6} =
						      protocol:uint32(_B5),
						  {V2_srv_id, _B7} =
						      protocol:string(_B6),
						  {V2_name, _B8} =
						      protocol:string(_B7),
						  {V2_lev, _B9} =
						      protocol:uint16(_B8),
						  {V2_face_id, _B10} =
						      protocol:uint32(_B9),
						  {V2_sex, _B11} =
						      protocol:uint8(_B10),
						  {V2_rank, _B12} =
						      protocol:uint16(_B11),
						  {V2_score, _B13} =
						      protocol:uint16(_B12),
						  {V2_power, _B14} =
						      protocol:uint32(_B13),
						  {V2_avatar_bid, _B15} =
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
						    V2_lev, V2_face_id, V2_sex,
						    V2_rank, V2_score, V2_power,
						    V2_avatar_bid,
						    V2_face_update_time,
						    V2_face_file, V2_worship,
						    V2_worship_status},
						   _B19}
					  end),
    {V1_zone_id, _B22} = protocol:uint32(_B21),
    {V1_start_num, _B23} = protocol:uint32(_B22),
    {V1_end_num, _B24} = protocol:uint32(_B23),
    {V1_day_worship, _B25} = protocol:uint32(_B24),
    {ok,
     {V1_rank, V1_worship, V1_power, V1_score, V1_rank_list,
      V1_zone_id, V1_start_num, V1_end_num, V1_day_worship}};
unpack(27715, cli, _B0) ->
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
						  {V2_face_id, _B7} =
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
						    V2_lev, V2_face_id, V2_sex,
						    V2_rank,
						    V2_face_update_time,
						    V2_face_file},
						   _B11}
					  end),
    {ok, {V1_time, V1_rank_list}};
unpack(27716, cli, _B0) -> {ok, {}};
unpack(27720, srv, _B0) -> {ok, {}};
unpack(27720, cli, _B0) ->
    {V1_zone_info, _B6} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_period, _B2} =
						     protocol:uint32(_B1),
						 {V2_max_zone_id, _B3} =
						     protocol:uint32(_B2),
						 {V2_self_zone_id, _B4} =
						     protocol:uint32(_B3),
						 {{V2_period, V2_max_zone_id,
						   V2_self_zone_id},
						  _B4}
					 end),
    {ok, {V1_zone_info}};
unpack(27725, srv, _B0) ->
    {V1_formations, _B11} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_order, _B2} =
						       protocol:uint8(_B1),
						   {V2_formation_type, _B3} =
						       protocol:uint8(_B2),
						   {V2_pos_info, _B8} =
						       protocol:array(_B3,
								      fun
									(_B4) ->
									    {V3_pos,
									     _B5} =
										protocol:uint8(_B4),
									    {V3_id,
									     _B6} =
										protocol:uint32(_B5),
									    {{V3_pos,
									      V3_id},
									     _B6}
								      end),
						   {V2_hallows_id, _B9} =
						       protocol:uint32(_B8),
						   {{V2_order,
						     V2_formation_type,
						     V2_pos_info,
						     V2_hallows_id},
						    _B9}
					   end),
    {ok, {V1_formations}};
unpack(27725, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(27726, srv, _B0) -> {ok, {}};
unpack(27726, cli, _B0) ->
    {V1_formations, _B11} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_order, _B2} =
						       protocol:uint8(_B1),
						   {V2_formation_type, _B3} =
						       protocol:uint8(_B2),
						   {V2_pos_info, _B8} =
						       protocol:array(_B3,
								      fun
									(_B4) ->
									    {V3_pos,
									     _B5} =
										protocol:uint8(_B4),
									    {V3_id,
									     _B6} =
										protocol:uint32(_B5),
									    {{V3_pos,
									      V3_id},
									     _B6}
								      end),
						   {V2_hallows_id, _B9} =
						       protocol:uint32(_B8),
						   {{V2_order,
						     V2_formation_type,
						     V2_pos_info,
						     V2_hallows_id},
						    _B9}
					   end),
    {ok, {V1_formations}};
unpack(27730, srv, _B0) -> {ok, {}};
unpack(27730, cli, _B0) ->
    {V1_point_info, _B5} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_type, _B2} =
						      protocol:uint8(_B1),
						  {V2_is_point, _B3} =
						      protocol:uint8(_B2),
						  {{V2_type, V2_is_point}, _B3}
					  end),
    {ok, {V1_point_info}};
unpack(27731, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(27731, cli, _B0) -> {ok, {}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


