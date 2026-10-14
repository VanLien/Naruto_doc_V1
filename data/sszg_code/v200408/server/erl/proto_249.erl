-file("src/proto/proto_249.erl", 1).

-module(proto_249).

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
		  res_p, dam_s, res_s, tenacity]},
		{m_arena_elite_war_order,
		 [ver, period, period_day, end_time, win_count,
		  rmb_status, card, lev_reward, start_time, ext]},
		{arena_replay_partner, [pos, bid, lev, star, ext]},
		{arena_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_elite_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_elite_lev, def_id, def_name, def_face, def_lev,
		  def_rank, def_elite_lev, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_elite_log, [id, list]},
		{arena_elite_rank,
		 [ver, rank, id, name, power, lev, face, look_id, score,
		  elite_lev, time, avatar_id, face_update_time,
		  face_file]},
		{arena_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, dower_skill,
		  set_skill, attr, extra]},
		{arena_elite_rival_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  extra]},
		{c_e_role,
		 [ver, id, name, power, lev, face, look_id, score,
		  elite_lev, avatar_id, is_king, match_power, all_star,
		  win_rio, zid, face_update_time, face_file]},
		{arena_elite_role,
		 [ver, id, name, lev, sex, gid, gname, face, power,
		  look_id, score, elite_lev, time, avatar_id, is_king,
		  defense, manifesto, face_update_time, face_file,
		  break_groups]},
		{c_elite_srv_info,
		 [type, sid, num, world_lev, open_time, merge_srvs]},
		{m_arena_elite_defens, [type, formations]},
		{m_arena_elite_log,
		 [ver, period, max_lev, max_score, combat_win_count1,
		  combat_all_count1, combat_win_count2, combat_all_count2,
		  max_dps, mvp_info, winning_streak, winning_streak_now,
		  beast_rivl_info, extra, log_zone_id, log_rank]},
		{arena_elite_role_best,
		 [id, name, lev, sex, gid, gname, face, power, look_id,
		  score, elite_lev, time, avatar_id, is_king, extra,
		  face_update_time, face_file]},
		{m_arena_elite,
		 [ver, lev, init_lev, period, score, day_combat_count,
		  day_buy_count, frist_ref_time, ref_count, match_cd_time,
		  had_combat_num, acc_combat_num, lev_reward,
		  last_combat_id, promoted_info, rival_info, defens,
		  old_rank, day_point_count, log, extra, last_reset_time,
		  max_day_buy_count, is_skip]}]).

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

-file("src/proto/proto_249.erl", 16).

-file("inc/arena_elite.hrl", 1).

-record(m_arena_elite,
	{ver = 6, lev = 1, init_lev = 1, period = 0, score = 0,
	 day_combat_count = 0, day_buy_count = 0,
	 frist_ref_time = 0, ref_count = 0, match_cd_time = 0,
	 had_combat_num = 0, acc_combat_num = 0, lev_reward = [],
	 last_combat_id = {0, <<>>}, promoted_info = [],
	 rival_info = [], defens = [], old_rank = [],
	 day_point_count = [], log = [], extra = [],
	 last_reset_time = 0, max_day_buy_count = 0,
	 is_skip = 0}).

-record(arena_elite_role_best,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = [],
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, extra = [],
	 face_update_time = 0, face_file = <<>>}).

-record(m_arena_elite_log,
	{ver = 2, period = 0, max_lev = 1, max_score = 1000,
	 combat_win_count1 = 0, combat_all_count1 = 0,
	 combat_win_count2 = 0, combat_all_count2 = 0,
	 max_dps = 0, mvp_info = [], winning_streak = 0,
	 winning_streak_now = 0,
	 beast_rivl_info = #arena_elite_role_best{}, extra = [],
	 log_zone_id = 0, log_rank = 0}).

-record(m_arena_elite_defens,
	{type = 1, formations = []}).

-record(c_elite_srv_info,
	{type = 1, sid = <<>>, num = 0, world_lev = 0,
	 open_time = 0, merge_srvs = []}).

-record(arena_elite_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, defense = [],
	 manifesto = [], face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(c_e_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, power = 0,
	 lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, avatar_id = 0, is_king = 0,
	 match_power = 1, all_star = 1, win_rio = 1, zid = 1,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_elite_rival_defense,
	{order, formation_type, hallows_id, hallows_lev,
	 hallows_skill_lev, partner_infos, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = []}).

-record(arena_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(arena_elite_rank,
	{ver = 2, rank = 0, id = {0, <<>>}, name = <<>>,
	 power = 0, lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, time = 0, avatar_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(role_arena_elite_log,
	{id = {0, <<>>}, list = []}).

-record(arena_elite_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0,
	 atk_elite_lev = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_face = 0, def_lev = 0, def_rank = 0,
	 def_elite_lev = 0, ret = 1, win_count = 0,
	 lose_count = 0, combat_type = 0, replay_list = [],
	 time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(m_arena_elite_war_order,
	{ver = 2, period = 0, period_day = 0, end_time = 0,
	 win_count = 0, rmb_status = 0, card = [],
	 lev_reward = [], start_time = 0, ext = []}).

-file("src/proto/proto_249.erl", 17).

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

-file("src/proto/proto_249.erl", 18).

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

-file("src/proto/proto_249.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24900, cli, {}) -> {ok, <<2:32, 24900:16>>};
pack(24900, srv,
     {V0_lev, V0_score, V0_day_combat_count,
      V0_day_buy_count, V0_match_cd_time, V0_rank, V0_is_king,
      V0_promoted_info, V0_state, V0_period, V0_start_time,
      V0_end_time, V0_state_time, V0_lev_reward, V0_zone_id,
      V0_day_max_buy_count, V0_is_skip, V0_rmb_status}) ->
    D_a_t_a = <<V0_lev:32, V0_score:32/signed,
		V0_day_combat_count:32, V0_day_buy_count:32,
		V0_match_cd_time:32, V0_rank:16, V0_is_king:8,
		(length(V0_promoted_info)):16,
		(list_to_binary([<<V1_count:8, V1_flag:8>>
				 || {V1_count, V1_flag}
					<- V0_promoted_info]))/binary,
		V0_state:8, V0_period:32, V0_start_time:32,
		V0_end_time:32, V0_state_time:32,
		(length(V0_lev_reward)):16,
		(list_to_binary([<<V1_lev:8, V1_flag:8>>
				 || {V1_lev, V1_flag}
					<- V0_lev_reward]))/binary,
		V0_zone_id:32/signed, V0_day_max_buy_count:32,
		V0_is_skip:32, V0_rmb_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24900:16,
       D_a_t_a/binary>>};
pack(24901, cli, {}) -> {ok, <<2:32, 24901:16>>};
pack(24901, srv,
     {V0_day_combat_count, V0_match_cd_time,
      V0_to_combat_time, V0_is_match, V0_rand_list}) ->
    D_a_t_a = <<V0_day_combat_count:32, V0_match_cd_time:32,
		V0_to_combat_time:32, V0_is_match:8,
		(length(V0_rand_list)):16,
		(list_to_binary([<<V1_end_time:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_power:32, V1_lev:32, V1_sex:8, V1_face:32,
				   V1_look_id:32, V1_score:32, V1_elite_lev:32,
				   (length(V1_defense)):16,
				   (list_to_binary([<<V2_type:8,
						      (length(V2_defense_info)):16,
						      (list_to_binary([<<V3_order:8,
									 V3_formation_type:32,
									 (length(V3_partner_infos)):16,
									 (list_to_binary([<<V4_pos:8,
											    V4_bid:32,
											    V4_lev:16,
											    V4_star:8,
											    V4_power:32,
											    (length(V4_extra)):16,
											    (list_to_binary([<<V5_key:32,
													       V5_val:32>>
													     || {V5_key,
														 V5_val}
														    <- V4_extra]))/binary>>
											  || #arena_partners_info{pos
														      =
														      V4_pos,
														  bid
														      =
														      V4_bid,
														  lev
														      =
														      V4_lev,
														  star
														      =
														      V4_star,
														  power
														      =
														      V4_power,
														  extra
														      =
														      V4_extra}
												 <- V3_partner_infos]))/binary>>
								       || #arena_elite_rival_defense{order
													 =
													 V3_order,
												     formation_type
													 =
													 V3_formation_type,
												     partner_infos
													 =
													 V3_partner_infos}
									      <- V2_defense_info]))/binary>>
						    || {V2_type,
							V2_defense_info}
							   <- V1_defense]))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {V1_end_time,
				     #arena_elite_role{id = {V1_rid, V1_srv_id},
						       name = V1_name,
						       gname = V1_gname,
						       power = V1_power,
						       lev = V1_lev,
						       sex = V1_sex,
						       face = V1_face,
						       look_id = V1_look_id,
						       score = V1_score,
						       elite_lev = V1_elite_lev,
						       defense = V1_defense,
						       face_update_time =
							   V1_face_update_time,
						       face_file =
							   V1_face_file}}
					<- V0_rand_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24901:16,
       D_a_t_a/binary>>};
pack(24902, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24902:16,
       D_a_t_a/binary>>};
pack(24902, srv, {}) -> {ok, <<2:32, 24902:16>>};
pack(24903, cli, {}) -> {ok, <<2:32, 24903:16>>};
pack(24903, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24903:16,
       D_a_t_a/binary>>};
pack(24904, cli, {}) -> {ok, <<2:32, 24904:16>>};
pack(24904, srv,
     {V0_code, V0_msg, V0_day_combat_count,
      V0_day_buy_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_day_combat_count:32, V0_day_buy_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24904:16,
       D_a_t_a/binary>>};
pack(24905, cli, {}) -> {ok, <<2:32, 24905:16>>};
pack(24905, srv, {V0_state, V0_end_time}) ->
    D_a_t_a = <<V0_state:8, V0_end_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24905:16,
       D_a_t_a/binary>>};
pack(24906, cli, {}) -> {ok, <<2:32, 24906:16>>};
pack(24906, srv,
     {V0_result, V0_win_count, V0_lose_count, V0_combat_type,
      V0_promoted_info, V0_elite_lev, V0_new_elite_lev,
      V0_big_score, V0_score, V0_end_score, V0_add_score,
      V0_awards, V0_all_hurt_statistics,
      V0_target_role_name}) ->
    D_a_t_a = <<V0_result:8, V0_win_count:32,
		V0_lose_count:32, V0_combat_type:32,
		(length(V0_promoted_info)):16,
		(list_to_binary([<<V1_count:8, V1_flag:8>>
				 || {V1_count, V1_flag}
					<- V0_promoted_info]))/binary,
		V0_elite_lev:32/signed, V0_new_elite_lev:32/signed,
		V0_big_score:32/signed, V0_score:32/signed,
		V0_end_score:32/signed, V0_add_score:32/signed,
		(length(V0_awards)):16,
		(list_to_binary([<<V1_item_id:32, V1_item_num:32>>
				 || {V1_item_id, V1_item_num}
					<- V0_awards]))/binary,
		(length(V0_all_hurt_statistics)):16,
		(list_to_binary([<<V1_type:8, V1_a_round:8,
				   V1_b_round:8,
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
				   V1_replay_id:32>>
				 || {V1_type, V1_a_round, V1_b_round,
				     V1_hurt_statistics, V1_replay_id}
					<- V0_all_hurt_statistics]))/binary,
		(protocol:pack(string, V0_target_role_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24906:16,
       D_a_t_a/binary>>};
pack(24910, cli, {}) -> {ok, <<2:32, 24910:16>>};
pack(24910, srv, {V0_zone_info}) ->
    D_a_t_a = <<(length(V0_zone_info)):16,
		(list_to_binary([<<V1_period:32, V1_max_zone_id:32>>
				 || {V1_period, V1_max_zone_id}
					<- V0_zone_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24910:16,
       D_a_t_a/binary>>};
pack(24911, cli,
     {V0_period, V0_start_rank, V0_end_rank, V0_zone_id}) ->
    D_a_t_a = <<V0_period:32, V0_start_rank:8,
		V0_end_rank:8, V0_zone_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24911:16,
       D_a_t_a/binary>>};
pack(24911, srv,
     {V0_rank, V0_elite_lev, V0_score, V0_period,
      V0_arena_elite_rank, V0_zone_id, V0_max_zone_id}) ->
    D_a_t_a = <<V0_rank:32, V0_elite_lev:32, V0_score:32,
		V0_period:32, (length(V0_arena_elite_rank)):16,
		(list_to_binary([<<V1_rank:16, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_power:32,
				   V1_score:32, V1_elite_lev:32,
				   V1_avatar_id:32, V1_look_id:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #arena_elite_rank{rank = V1_rank,
						      id = {V1_rid, V1_srv_id},
						      name = V1_name,
						      lev = V1_lev,
						      face = V1_face,
						      power = V1_power,
						      score = V1_score,
						      elite_lev = V1_elite_lev,
						      avatar_id = V1_avatar_id,
						      look_id = V1_look_id,
						      face_update_time =
							  V1_face_update_time,
						      face_file = V1_face_file}
					<- V0_arena_elite_rank]))/binary,
		V0_zone_id:32, V0_max_zone_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24911:16,
       D_a_t_a/binary>>};
pack(24915, cli, {V0_lev}) ->
    D_a_t_a = <<V0_lev:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24915:16,
       D_a_t_a/binary>>};
pack(24915, srv, {V0_code, V0_msg, V0_lev_reward}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_lev_reward)):16,
		(list_to_binary([<<V1_lev:8, V1_flag:8>>
				 || {V1_lev, V1_flag}
					<- V0_lev_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24915:16,
       D_a_t_a/binary>>};
pack(24920, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24920:16,
       D_a_t_a/binary>>};
pack(24920, srv, {V0_type, V0_formations}) ->
    D_a_t_a = <<V0_type:8, (length(V0_formations)):16,
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
     <<(byte_size(D_a_t_a) + 2):32, 24920:16,
       D_a_t_a/binary>>};
pack(24921, cli, {V0_type, V0_formations}) ->
    D_a_t_a = <<V0_type:8, (length(V0_formations)):16,
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
     <<(byte_size(D_a_t_a) + 2):32, 24921:16,
       D_a_t_a/binary>>};
pack(24921, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24921:16,
       D_a_t_a/binary>>};
pack(24930, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24930:16,
       D_a_t_a/binary>>};
pack(24930, srv, {V0_type, V0_arena_elite_log}) ->
    D_a_t_a = <<V0_type:8, (length(V0_arena_elite_log)):16,
		(list_to_binary([<<V1_id:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_atk_name))/binary,
				   V1_atk_face:32, V1_atk_lev:32,
				   V1_atk_rank:32, V1_atk_elite_lev:32,
				   V1_def_rid:32,
				   (protocol:pack(string,
						  V1_def_srv_id))/binary,
				   (protocol:pack(string, V1_def_name))/binary,
				   V1_def_face:32, V1_def_lev:32,
				   V1_def_rank:32, V1_def_elite_lev:32,
				   V1_ret:8, V1_win_count:8, V1_lose_count:8,
				   V1_combat_type:8, V1_time:32,
				   V1_atk_face_update_time:32,
				   (protocol:pack(string,
						  V1_atk_face_file))/binary,
				   V1_def_face_update_time:32,
				   (protocol:pack(string,
						  V1_def_face_file))/binary>>
				 || #arena_elite_log{id = V1_id,
						     atk_id =
							 {V1_rid, V1_srv_id},
						     atk_name = V1_atk_name,
						     atk_face = V1_atk_face,
						     atk_lev = V1_atk_lev,
						     atk_rank = V1_atk_rank,
						     atk_elite_lev =
							 V1_atk_elite_lev,
						     def_id =
							 {V1_def_rid,
							  V1_def_srv_id},
						     def_name = V1_def_name,
						     def_face = V1_def_face,
						     def_lev = V1_def_lev,
						     def_rank = V1_def_rank,
						     def_elite_lev =
							 V1_def_elite_lev,
						     ret = V1_ret,
						     win_count = V1_win_count,
						     lose_count = V1_lose_count,
						     combat_type =
							 V1_combat_type,
						     time = V1_time,
						     atk_face_update_time =
							 V1_atk_face_update_time,
						     atk_face_file =
							 V1_atk_face_file,
						     def_face_update_time =
							 V1_def_face_update_time,
						     def_face_file =
							 V1_def_face_file}
					<- V0_arena_elite_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24930:16,
       D_a_t_a/binary>>};
pack(24931, cli, {V0_type, V0_id}) ->
    D_a_t_a = <<V0_type:8, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24931:16,
       D_a_t_a/binary>>};
pack(24931, srv,
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
						    || #arena_replay_partner{pos
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
						    || #arena_replay_partner{pos
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
							   <- V1_b_sprites]))/binary,
				   V1_a_add_power:32, V1_b_add_power:32>>
				 || {V1_order,
				     #arena_replay_info{id = V1_id,
							round = V1_round,
							ret = V1_ret,
							time = V1_time,
							a_id =
							    {V1_rid, V1_srv_id},
							a_power = V1_a_power,
							a_formation_type =
							    V1_a_formation_type,
							a_order = V1_a_order,
							a_end_hp = V1_a_end_hp,
							b_id =
							    {V1_b_rid,
							     V1_b_srv_id},
							b_power = V1_b_power,
							b_formation_type =
							    V1_b_formation_type,
							b_order = V1_b_order,
							b_end_hp = V1_b_end_hp,
							a_plist = V1_a_plist,
							b_plist = V1_b_plist},
				     V1_hurt_statistics, V1_a_sprite_lev,
				     V1_a_sprites, V1_b_sprite_lev,
				     V1_b_sprites, V1_a_add_power,
				     V1_b_add_power}
					<- V0_arena_replay_infos]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24931:16,
       D_a_t_a/binary>>};
pack(24940, cli, {V0_period}) ->
    D_a_t_a = <<V0_period:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24940:16,
       D_a_t_a/binary>>};
pack(24940, srv,
     {V0_best_mvp, V0_my_score, V0_my_elite_lev,
      #m_arena_elite_log{period = V0_period,
			 max_lev = V0_max_lev, max_score = V0_max_score,
			 combat_win_count1 = V0_combat_win_count1,
			 combat_all_count1 = V0_combat_all_count1,
			 combat_win_count2 = V0_combat_win_count2,
			 combat_all_count2 = V0_combat_all_count2,
			 max_dps = V0_max_dps,
			 winning_streak = V0_winning_streak,
			 beast_rivl_info =
			     #arena_elite_role_best{id = {V0_rid, V0_srv_id},
						    name = V0_name,
						    lev = V0_lev, sex = V0_sex,
						    gid =
							{V0_g_rid, V0_g_srv_id},
						    gname = V0_gname,
						    power = V0_power,
						    face = V0_face,
						    score = V0_score,
						    elite_lev = V0_elite_lev,
						    avatar_id = V0_avatar_id,
						    face_update_time =
							V0_face_update_time,
						    face_file = V0_face_file},
			 log_zone_id = V0_log_zone_id, log_rank = V0_log_rank},
      V0_use_skin}) ->
    D_a_t_a = <<V0_best_mvp:32, V0_my_score:32,
		V0_my_elite_lev:32, V0_period:32, V0_max_lev:16,
		V0_max_score:32, V0_combat_win_count1:32,
		V0_combat_all_count1:32, V0_combat_win_count2:8,
		V0_combat_all_count2:32, V0_max_dps:32,
		V0_winning_streak:32, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:32,
		V0_sex:32, V0_g_rid:32,
		(protocol:pack(string, V0_g_srv_id))/binary,
		(protocol:pack(string, V0_gname))/binary,
		(length(V0_power)):16,
		(list_to_binary([<<V1_order:8, V1_power:32>>
				 || {V1_order, V1_power} <- V0_power]))/binary,
		V0_face:32, V0_score:32, V0_elite_lev:32,
		V0_avatar_id:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary,
		V0_log_zone_id:32, V0_log_rank:32, V0_use_skin:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24940:16,
       D_a_t_a/binary>>};
pack(24941, cli, {V0_channel}) ->
    D_a_t_a = <<V0_channel:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24941:16,
       D_a_t_a/binary>>};
pack(24941, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24941:16,
       D_a_t_a/binary>>};
pack(24942, cli, {V0_id, V0_share_srv_id, V0_period}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_share_srv_id))/binary,
		V0_period:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24942:16,
       D_a_t_a/binary>>};
pack(24942, srv,
     {V0_id, V0_share_srv_id, V0_best_mvp, V0_my_score,
      V0_my_elite_lev,
      #m_arena_elite_log{period = V0_period,
			 max_lev = V0_max_lev, max_score = V0_max_score,
			 combat_win_count1 = V0_combat_win_count1,
			 combat_all_count1 = V0_combat_all_count1,
			 combat_win_count2 = V0_combat_win_count2,
			 combat_all_count2 = V0_combat_all_count2,
			 max_dps = V0_max_dps,
			 winning_streak = V0_winning_streak,
			 beast_rivl_info =
			     #arena_elite_role_best{id = {V0_rid, V0_srv_id},
						    name = V0_name,
						    lev = V0_lev, sex = V0_sex,
						    gid =
							{V0_g_rid, V0_g_srv_id},
						    gname = V0_gname,
						    power = V0_power,
						    face = V0_face,
						    score = V0_score,
						    elite_lev = V0_elite_lev,
						    avatar_id = V0_avatar_id,
						    face_update_time =
							V0_face_update_time,
						    face_file = V0_face_file},
			 log_zone_id = V0_log_zone_id, log_rank = V0_log_rank},
      V0_use_skin}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_share_srv_id))/binary,
		V0_best_mvp:32, V0_my_score:32, V0_my_elite_lev:32,
		V0_period:32, V0_max_lev:16, V0_max_score:32,
		V0_combat_win_count1:32, V0_combat_all_count1:32,
		V0_combat_win_count2:8, V0_combat_all_count2:32,
		V0_max_dps:32, V0_winning_streak:32, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:32,
		V0_sex:32, V0_g_rid:32,
		(protocol:pack(string, V0_g_srv_id))/binary,
		(protocol:pack(string, V0_gname))/binary,
		(length(V0_power)):16,
		(list_to_binary([<<V1_order:8, V1_power:32>>
				 || {V1_order, V1_power} <- V0_power]))/binary,
		V0_face:32, V0_score:32, V0_elite_lev:32,
		V0_avatar_id:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary,
		V0_log_zone_id:32, V0_log_rank:32, V0_use_skin:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24942:16,
       D_a_t_a/binary>>};
pack(24945, cli, {}) -> {ok, <<2:32, 24945:16>>};
pack(24945, srv, {V0_manifesto}) ->
    D_a_t_a = <<(length(V0_manifesto)):16,
		(list_to_binary([<<V1_order:8, V1_manifesto_id:32>>
				 || {V1_order, V1_manifesto_id}
					<- V0_manifesto]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24945:16,
       D_a_t_a/binary>>};
pack(24946, cli, {V0_manifesto}) ->
    D_a_t_a = <<(length(V0_manifesto)):16,
		(list_to_binary([<<V1_order:8, V1_manifesto_id:32>>
				 || {V1_order, V1_manifesto_id}
					<- V0_manifesto]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24946:16,
       D_a_t_a/binary>>};
pack(24946, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24946:16,
       D_a_t_a/binary>>};
pack(24950, cli, {}) -> {ok, <<2:32, 24950:16>>};
pack(24950, srv, {}) -> {ok, <<2:32, 24950:16>>};
pack(24951, cli, {}) -> {ok, <<2:32, 24951:16>>};
pack(24951, srv, {}) -> {ok, <<2:32, 24951:16>>};
pack(24952, cli, {}) -> {ok, <<2:32, 24952:16>>};
pack(24952, srv,
     {V0_period, V0_cur_day, V0_end_time, V0_lev,
      V0_rmb_status, V0_win_count, V0_list}) ->
    D_a_t_a = <<V0_period:16, V0_cur_day:32, V0_end_time:32,
		V0_lev:32, V0_rmb_status:8, V0_win_count:32,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_award_status:8,
				   V1_rmb_award_status:8>>
				 || {V1_id, V1_award_status,
				     V1_rmb_award_status}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24952:16,
       D_a_t_a/binary>>};
pack(24953, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24953:16,
       D_a_t_a/binary>>};
pack(24953, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24953:16,
       D_a_t_a/binary>>};
pack(24954, cli, {}) -> {ok, <<2:32, 24954:16>>};
pack(24954, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24954:16,
       D_a_t_a/binary>>};
pack(24955, cli, {}) -> {ok, <<2:32, 24955:16>>};
pack(24955, srv, {V0_is_pop, V0_cur_day}) ->
    D_a_t_a = <<V0_is_pop:8, V0_cur_day:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24955:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24900, srv, _B0) -> {ok, {}};
unpack(24900, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_score, _B2} = protocol:int32(_B1),
    {V1_day_combat_count, _B3} = protocol:uint32(_B2),
    {V1_day_buy_count, _B4} = protocol:uint32(_B3),
    {V1_match_cd_time, _B5} = protocol:uint32(_B4),
    {V1_rank, _B6} = protocol:uint16(_B5),
    {V1_is_king, _B7} = protocol:uint8(_B6),
    {V1_promoted_info, _B12} = protocol:array(_B7,
					      fun (_B8) ->
						      {V2_count, _B9} =
							  protocol:uint8(_B8),
						      {V2_flag, _B10} =
							  protocol:uint8(_B9),
						      {{V2_count, V2_flag},
						       _B10}
					      end),
    {V1_state, _B13} = protocol:uint8(_B12),
    {V1_period, _B14} = protocol:uint32(_B13),
    {V1_start_time, _B15} = protocol:uint32(_B14),
    {V1_end_time, _B16} = protocol:uint32(_B15),
    {V1_state_time, _B17} = protocol:uint32(_B16),
    {V1_lev_reward, _B22} = protocol:array(_B17,
					   fun (_B18) ->
						   {V2_lev, _B19} =
						       protocol:uint8(_B18),
						   {V2_flag, _B20} =
						       protocol:uint8(_B19),
						   {{V2_lev, V2_flag}, _B20}
					   end),
    {V1_zone_id, _B23} = protocol:int32(_B22),
    {V1_day_max_buy_count, _B24} = protocol:uint32(_B23),
    {V1_is_skip, _B25} = protocol:uint32(_B24),
    {V1_rmb_status, _B26} = protocol:uint8(_B25),
    {ok,
     {V1_lev, V1_score, V1_day_combat_count,
      V1_day_buy_count, V1_match_cd_time, V1_rank, V1_is_king,
      V1_promoted_info, V1_state, V1_period, V1_start_time,
      V1_end_time, V1_state_time, V1_lev_reward, V1_zone_id,
      V1_day_max_buy_count, V1_is_skip, V1_rmb_status}};
unpack(24901, srv, _B0) -> {ok, {}};
unpack(24901, cli, _B0) ->
    {V1_day_combat_count, _B1} = protocol:uint32(_B0),
    {V1_match_cd_time, _B2} = protocol:uint32(_B1),
    {V1_to_combat_time, _B3} = protocol:uint32(_B2),
    {V1_is_match, _B4} = protocol:uint8(_B3),
    {V1_rand_list, _B43} = protocol:array(_B4,
					  fun (_B5) ->
						  {V2_end_time, _B6} =
						      protocol:uint32(_B5),
						  {V2_rid, _B7} =
						      protocol:uint32(_B6),
						  {V2_srv_id, _B8} =
						      protocol:string(_B7),
						  {V2_name, _B9} =
						      protocol:string(_B8),
						  {V2_gname, _B10} =
						      protocol:string(_B9),
						  {V2_power, _B11} =
						      protocol:uint32(_B10),
						  {V2_lev, _B12} =
						      protocol:uint32(_B11),
						  {V2_sex, _B13} =
						      protocol:uint8(_B12),
						  {V2_face, _B14} =
						      protocol:uint32(_B13),
						  {V2_look_id, _B15} =
						      protocol:uint32(_B14),
						  {V2_score, _B16} =
						      protocol:uint32(_B15),
						  {V2_elite_lev, _B17} =
						      protocol:uint32(_B16),
						  {V2_defense, _B39} =
						      protocol:array(_B17,
								     fun
								       (_B18) ->
									   {V3_type,
									    _B19} =
									       protocol:uint8(_B18),
									   {V3_defense_info,
									    _B37} =
									       protocol:array(_B19,
											      fun
												(_B20) ->
												    {V4_order,
												     _B21} =
													protocol:uint8(_B20),
												    {V4_formation_type,
												     _B22} =
													protocol:uint32(_B21),
												    {V4_partner_infos,
												     _B35} =
													protocol:array(_B22,
														       fun
															 (_B23) ->
															     {V5_pos,
															      _B24} =
																 protocol:uint8(_B23),
															     {V5_bid,
															      _B25} =
																 protocol:uint32(_B24),
															     {V5_lev,
															      _B26} =
																 protocol:uint16(_B25),
															     {V5_star,
															      _B27} =
																 protocol:uint8(_B26),
															     {V5_power,
															      _B28} =
																 protocol:uint32(_B27),
															     {V5_extra,
															      _B33} =
																 protocol:array(_B28,
																		fun
																		  (_B29) ->
																		      {V6_key,
																		       _B30} =
																			  protocol:uint32(_B29),
																		      {V6_val,
																		       _B31} =
																			  protocol:uint32(_B30),
																		      {{V6_key,
																			V6_val},
																		       _B31}
																		end),
															     {{V5_pos,
															       V5_bid,
															       V5_lev,
															       V5_star,
															       V5_power,
															       V5_extra},
															      _B33}
														       end),
												    {{V4_order,
												      V4_formation_type,
												      V4_partner_infos},
												     _B35}
											      end),
									   {{V3_type,
									     V3_defense_info},
									    _B37}
								     end),
						  {V2_face_update_time, _B40} =
						      protocol:uint32(_B39),
						  {V2_face_file, _B41} =
						      protocol:string(_B40),
						  {{V2_end_time, V2_rid,
						    V2_srv_id, V2_name,
						    V2_gname, V2_power, V2_lev,
						    V2_sex, V2_face, V2_look_id,
						    V2_score, V2_elite_lev,
						    V2_defense,
						    V2_face_update_time,
						    V2_face_file},
						   _B41}
					  end),
    {ok,
     {V1_day_combat_count, V1_match_cd_time,
      V1_to_combat_time, V1_is_match, V1_rand_list}};
unpack(24902, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(24902, cli, _B0) -> {ok, {}};
unpack(24903, srv, _B0) -> {ok, {}};
unpack(24903, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24904, srv, _B0) -> {ok, {}};
unpack(24904, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_day_combat_count, _B3} = protocol:uint32(_B2),
    {V1_day_buy_count, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_code, V1_msg, V1_day_combat_count,
      V1_day_buy_count}};
unpack(24905, srv, _B0) -> {ok, {}};
unpack(24905, cli, _B0) ->
    {V1_state, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_state, V1_end_time}};
unpack(24906, srv, _B0) -> {ok, {}};
unpack(24906, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_win_count, _B2} = protocol:uint32(_B1),
    {V1_lose_count, _B3} = protocol:uint32(_B2),
    {V1_combat_type, _B4} = protocol:uint32(_B3),
    {V1_promoted_info, _B9} = protocol:array(_B4,
					     fun (_B5) ->
						     {V2_count, _B6} =
							 protocol:uint8(_B5),
						     {V2_flag, _B7} =
							 protocol:uint8(_B6),
						     {{V2_count, V2_flag}, _B7}
					     end),
    {V1_elite_lev, _B10} = protocol:int32(_B9),
    {V1_new_elite_lev, _B11} = protocol:int32(_B10),
    {V1_big_score, _B12} = protocol:int32(_B11),
    {V1_score, _B13} = protocol:int32(_B12),
    {V1_end_score, _B14} = protocol:int32(_B13),
    {V1_add_score, _B15} = protocol:int32(_B14),
    {V1_awards, _B20} = protocol:array(_B15,
				       fun (_B16) ->
					       {V2_item_id, _B17} =
						   protocol:uint32(_B16),
					       {V2_item_num, _B18} =
						   protocol:uint32(_B17),
					       {{V2_item_id, V2_item_num}, _B18}
				       end),
    {V1_all_hurt_statistics, _B49} = protocol:array(_B20,
						    fun (_B21) ->
							    {V2_type, _B22} =
								protocol:uint8(_B21),
							    {V2_a_round, _B23} =
								protocol:uint8(_B22),
							    {V2_b_round, _B24} =
								protocol:uint8(_B23),
							    {V2_hurt_statistics,
							     _B46} =
								protocol:array(_B24,
									       fun
										 (_B25) ->
										     {V3_type,
										      _B26} =
											 protocol:uint8(_B25),
										     {V3_partner_hurts,
										      _B44} =
											 protocol:array(_B26,
													fun
													  (_B27) ->
													      {V4_rid,
													       _B28} =
														  protocol:uint32(_B27),
													      {V4_srvid,
													       _B29} =
														  protocol:string(_B28),
													      {V4_id,
													       _B30} =
														  protocol:uint32(_B29),
													      {V4_bid,
													       _B31} =
														  protocol:uint32(_B30),
													      {V4_star,
													       _B32} =
														  protocol:uint32(_B31),
													      {V4_lev,
													       _B33} =
														  protocol:uint32(_B32),
													      {V4_camp_type,
													       _B34} =
														  protocol:uint32(_B33),
													      {V4_dps,
													       _B35} =
														  protocol:uint32(_B34),
													      {V4_cure,
													       _B36} =
														  protocol:uint32(_B35),
													      {V4_ext_data,
													       _B41} =
														  protocol:array(_B36,
																 fun
																   (_B37) ->
																       {V5_key,
																	_B38} =
																	   protocol:uint32(_B37),
																       {V5_val,
																	_B39} =
																	   protocol:uint32(_B38),
																       {{V5_key,
																	 V5_val},
																	_B39}
																 end),
													      {V4_be_hurt,
													       _B42} =
														  protocol:uint32(_B41),
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
													       _B42}
													end),
										     {{V3_type,
										       V3_partner_hurts},
										      _B44}
									       end),
							    {V2_replay_id,
							     _B47} =
								protocol:uint32(_B46),
							    {{V2_type,
							      V2_a_round,
							      V2_b_round,
							      V2_hurt_statistics,
							      V2_replay_id},
							     _B47}
						    end),
    {V1_target_role_name, _B50} = protocol:string(_B49),
    {ok,
     {V1_result, V1_win_count, V1_lose_count, V1_combat_type,
      V1_promoted_info, V1_elite_lev, V1_new_elite_lev,
      V1_big_score, V1_score, V1_end_score, V1_add_score,
      V1_awards, V1_all_hurt_statistics,
      V1_target_role_name}};
unpack(24910, srv, _B0) -> {ok, {}};
unpack(24910, cli, _B0) ->
    {V1_zone_info, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_period, _B2} =
						     protocol:uint32(_B1),
						 {V2_max_zone_id, _B3} =
						     protocol:uint32(_B2),
						 {{V2_period, V2_max_zone_id},
						  _B3}
					 end),
    {ok, {V1_zone_info}};
unpack(24911, srv, _B0) ->
    {V1_period, _B1} = protocol:uint32(_B0),
    {V1_start_rank, _B2} = protocol:uint8(_B1),
    {V1_end_rank, _B3} = protocol:uint8(_B2),
    {V1_zone_id, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_period, V1_start_rank, V1_end_rank, V1_zone_id}};
unpack(24911, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint32(_B0),
    {V1_elite_lev, _B2} = protocol:uint32(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_period, _B4} = protocol:uint32(_B3),
    {V1_arena_elite_rank, _B20} = protocol:array(_B4,
						 fun (_B5) ->
							 {V2_rank, _B6} =
							     protocol:uint16(_B5),
							 {V2_rid, _B7} =
							     protocol:uint32(_B6),
							 {V2_srv_id, _B8} =
							     protocol:string(_B7),
							 {V2_name, _B9} =
							     protocol:string(_B8),
							 {V2_lev, _B10} =
							     protocol:uint16(_B9),
							 {V2_face, _B11} =
							     protocol:uint32(_B10),
							 {V2_power, _B12} =
							     protocol:uint32(_B11),
							 {V2_score, _B13} =
							     protocol:uint32(_B12),
							 {V2_elite_lev, _B14} =
							     protocol:uint32(_B13),
							 {V2_avatar_id, _B15} =
							     protocol:uint32(_B14),
							 {V2_look_id, _B16} =
							     protocol:uint32(_B15),
							 {V2_face_update_time,
							  _B17} =
							     protocol:uint32(_B16),
							 {V2_face_file, _B18} =
							     protocol:string(_B17),
							 {{V2_rank, V2_rid,
							   V2_srv_id, V2_name,
							   V2_lev, V2_face,
							   V2_power, V2_score,
							   V2_elite_lev,
							   V2_avatar_id,
							   V2_look_id,
							   V2_face_update_time,
							   V2_face_file},
							  _B18}
						 end),
    {V1_zone_id, _B21} = protocol:uint32(_B20),
    {V1_max_zone_id, _B22} = protocol:uint32(_B21),
    {ok,
     {V1_rank, V1_elite_lev, V1_score, V1_period,
      V1_arena_elite_rank, V1_zone_id, V1_max_zone_id}};
unpack(24915, srv, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0), {ok, {V1_lev}};
unpack(24915, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_lev_reward, _B7} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_lev, _B4} =
						      protocol:uint8(_B3),
						  {V2_flag, _B5} =
						      protocol:uint8(_B4),
						  {{V2_lev, V2_flag}, _B5}
					  end),
    {ok, {V1_code, V1_msg, V1_lev_reward}};
unpack(24920, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(24920, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_formations, _B12} = protocol:array(_B1,
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
						   {{V2_order,
						     V2_formation_type,
						     V2_pos_info,
						     V2_hallows_id},
						    _B10}
					   end),
    {ok, {V1_type, V1_formations}};
unpack(24921, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_formations, _B12} = protocol:array(_B1,
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
						   {{V2_order,
						     V2_formation_type,
						     V2_pos_info,
						     V2_hallows_id},
						    _B10}
					   end),
    {ok, {V1_type, V1_formations}};
unpack(24921, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24930, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(24930, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_arena_elite_log, _B28} = protocol:array(_B1,
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
							{V2_atk_elite_lev,
							 _B10} =
							    protocol:uint32(_B9),
							{V2_def_rid, _B11} =
							    protocol:uint32(_B10),
							{V2_def_srv_id, _B12} =
							    protocol:string(_B11),
							{V2_def_name, _B13} =
							    protocol:string(_B12),
							{V2_def_face, _B14} =
							    protocol:uint32(_B13),
							{V2_def_lev, _B15} =
							    protocol:uint32(_B14),
							{V2_def_rank, _B16} =
							    protocol:uint32(_B15),
							{V2_def_elite_lev,
							 _B17} =
							    protocol:uint32(_B16),
							{V2_ret, _B18} =
							    protocol:uint8(_B17),
							{V2_win_count, _B19} =
							    protocol:uint8(_B18),
							{V2_lose_count, _B20} =
							    protocol:uint8(_B19),
							{V2_combat_type, _B21} =
							    protocol:uint8(_B20),
							{V2_time, _B22} =
							    protocol:uint32(_B21),
							{V2_atk_face_update_time,
							 _B23} =
							    protocol:uint32(_B22),
							{V2_atk_face_file,
							 _B24} =
							    protocol:string(_B23),
							{V2_def_face_update_time,
							 _B25} =
							    protocol:uint32(_B24),
							{V2_def_face_file,
							 _B26} =
							    protocol:string(_B25),
							{{V2_id, V2_rid,
							  V2_srv_id,
							  V2_atk_name,
							  V2_atk_face,
							  V2_atk_lev,
							  V2_atk_rank,
							  V2_atk_elite_lev,
							  V2_def_rid,
							  V2_def_srv_id,
							  V2_def_name,
							  V2_def_face,
							  V2_def_lev,
							  V2_def_rank,
							  V2_def_elite_lev,
							  V2_ret, V2_win_count,
							  V2_lose_count,
							  V2_combat_type,
							  V2_time,
							  V2_atk_face_update_time,
							  V2_atk_face_file,
							  V2_def_face_update_time,
							  V2_def_face_file},
							 _B26}
						end),
    {ok, {V1_type, V1_arena_elite_log}};
unpack(24931, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_id}};
unpack(24931, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_arena_replay_infos, _B82} = protocol:array(_B2,
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
							   {V2_a_add_power,
							    _B79} =
							       protocol:uint32(_B78),
							   {V2_b_add_power,
							    _B80} =
							       protocol:uint32(_B79),
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
							     V2_b_sprites,
							     V2_a_add_power,
							     V2_b_add_power},
							    _B80}
						   end),
    {ok, {V1_type, V1_id, V1_arena_replay_infos}};
unpack(24940, srv, _B0) ->
    {V1_period, _B1} = protocol:uint32(_B0),
    {ok, {V1_period}};
unpack(24940, cli, _B0) ->
    {V1_best_mvp, _B1} = protocol:uint32(_B0),
    {V1_my_score, _B2} = protocol:uint32(_B1),
    {V1_my_elite_lev, _B3} = protocol:uint32(_B2),
    {V1_period, _B4} = protocol:uint32(_B3),
    {V1_max_lev, _B5} = protocol:uint16(_B4),
    {V1_max_score, _B6} = protocol:uint32(_B5),
    {V1_combat_win_count1, _B7} = protocol:uint32(_B6),
    {V1_combat_all_count1, _B8} = protocol:uint32(_B7),
    {V1_combat_win_count2, _B9} = protocol:uint8(_B8),
    {V1_combat_all_count2, _B10} = protocol:uint32(_B9),
    {V1_max_dps, _B11} = protocol:uint32(_B10),
    {V1_winning_streak, _B12} = protocol:uint32(_B11),
    {V1_rid, _B13} = protocol:uint32(_B12),
    {V1_srv_id, _B14} = protocol:string(_B13),
    {V1_name, _B15} = protocol:string(_B14),
    {V1_lev, _B16} = protocol:uint32(_B15),
    {V1_sex, _B17} = protocol:uint32(_B16),
    {V1_g_rid, _B18} = protocol:uint32(_B17),
    {V1_g_srv_id, _B19} = protocol:string(_B18),
    {V1_gname, _B20} = protocol:string(_B19),
    {V1_power, _B25} = protocol:array(_B20,
				      fun (_B21) ->
					      {V2_order, _B22} =
						  protocol:uint8(_B21),
					      {V2_power, _B23} =
						  protocol:uint32(_B22),
					      {{V2_order, V2_power}, _B23}
				      end),
    {V1_face, _B26} = protocol:uint32(_B25),
    {V1_score, _B27} = protocol:uint32(_B26),
    {V1_elite_lev, _B28} = protocol:uint32(_B27),
    {V1_avatar_id, _B29} = protocol:uint32(_B28),
    {V1_face_update_time, _B30} = protocol:uint32(_B29),
    {V1_face_file, _B31} = protocol:string(_B30),
    {V1_log_zone_id, _B32} = protocol:uint32(_B31),
    {V1_log_rank, _B33} = protocol:uint32(_B32),
    {V1_use_skin, _B34} = protocol:uint32(_B33),
    {ok,
     {V1_best_mvp, V1_my_score, V1_my_elite_lev, V1_period,
      V1_max_lev, V1_max_score, V1_combat_win_count1,
      V1_combat_all_count1, V1_combat_win_count2,
      V1_combat_all_count2, V1_max_dps, V1_winning_streak,
      V1_rid, V1_srv_id, V1_name, V1_lev, V1_sex, V1_g_rid,
      V1_g_srv_id, V1_gname, V1_power, V1_face, V1_score,
      V1_elite_lev, V1_avatar_id, V1_face_update_time,
      V1_face_file, V1_log_zone_id, V1_log_rank,
      V1_use_skin}};
unpack(24941, srv, _B0) ->
    {V1_channel, _B1} = protocol:uint16(_B0),
    {ok, {V1_channel}};
unpack(24941, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24942, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_share_srv_id, _B2} = protocol:string(_B1),
    {V1_period, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_share_srv_id, V1_period}};
unpack(24942, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_share_srv_id, _B2} = protocol:string(_B1),
    {V1_best_mvp, _B3} = protocol:uint32(_B2),
    {V1_my_score, _B4} = protocol:uint32(_B3),
    {V1_my_elite_lev, _B5} = protocol:uint32(_B4),
    {V1_period, _B6} = protocol:uint32(_B5),
    {V1_max_lev, _B7} = protocol:uint16(_B6),
    {V1_max_score, _B8} = protocol:uint32(_B7),
    {V1_combat_win_count1, _B9} = protocol:uint32(_B8),
    {V1_combat_all_count1, _B10} = protocol:uint32(_B9),
    {V1_combat_win_count2, _B11} = protocol:uint8(_B10),
    {V1_combat_all_count2, _B12} = protocol:uint32(_B11),
    {V1_max_dps, _B13} = protocol:uint32(_B12),
    {V1_winning_streak, _B14} = protocol:uint32(_B13),
    {V1_rid, _B15} = protocol:uint32(_B14),
    {V1_srv_id, _B16} = protocol:string(_B15),
    {V1_name, _B17} = protocol:string(_B16),
    {V1_lev, _B18} = protocol:uint32(_B17),
    {V1_sex, _B19} = protocol:uint32(_B18),
    {V1_g_rid, _B20} = protocol:uint32(_B19),
    {V1_g_srv_id, _B21} = protocol:string(_B20),
    {V1_gname, _B22} = protocol:string(_B21),
    {V1_power, _B27} = protocol:array(_B22,
				      fun (_B23) ->
					      {V2_order, _B24} =
						  protocol:uint8(_B23),
					      {V2_power, _B25} =
						  protocol:uint32(_B24),
					      {{V2_order, V2_power}, _B25}
				      end),
    {V1_face, _B28} = protocol:uint32(_B27),
    {V1_score, _B29} = protocol:uint32(_B28),
    {V1_elite_lev, _B30} = protocol:uint32(_B29),
    {V1_avatar_id, _B31} = protocol:uint32(_B30),
    {V1_face_update_time, _B32} = protocol:uint32(_B31),
    {V1_face_file, _B33} = protocol:string(_B32),
    {V1_log_zone_id, _B34} = protocol:uint32(_B33),
    {V1_log_rank, _B35} = protocol:uint32(_B34),
    {V1_use_skin, _B36} = protocol:uint32(_B35),
    {ok,
     {V1_id, V1_share_srv_id, V1_best_mvp, V1_my_score,
      V1_my_elite_lev, V1_period, V1_max_lev, V1_max_score,
      V1_combat_win_count1, V1_combat_all_count1,
      V1_combat_win_count2, V1_combat_all_count2, V1_max_dps,
      V1_winning_streak, V1_rid, V1_srv_id, V1_name, V1_lev,
      V1_sex, V1_g_rid, V1_g_srv_id, V1_gname, V1_power,
      V1_face, V1_score, V1_elite_lev, V1_avatar_id,
      V1_face_update_time, V1_face_file, V1_log_zone_id,
      V1_log_rank, V1_use_skin}};
unpack(24945, srv, _B0) -> {ok, {}};
unpack(24945, cli, _B0) ->
    {V1_manifesto, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_order, _B2} =
						     protocol:uint8(_B1),
						 {V2_manifesto_id, _B3} =
						     protocol:uint32(_B2),
						 {{V2_order, V2_manifesto_id},
						  _B3}
					 end),
    {ok, {V1_manifesto}};
unpack(24946, srv, _B0) ->
    {V1_manifesto, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_order, _B2} =
						     protocol:uint8(_B1),
						 {V2_manifesto_id, _B3} =
						     protocol:uint32(_B2),
						 {{V2_order, V2_manifesto_id},
						  _B3}
					 end),
    {ok, {V1_manifesto}};
unpack(24946, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24950, srv, _B0) -> {ok, {}};
unpack(24950, cli, _B0) -> {ok, {}};
unpack(24951, srv, _B0) -> {ok, {}};
unpack(24951, cli, _B0) -> {ok, {}};
unpack(24952, srv, _B0) -> {ok, {}};
unpack(24952, cli, _B0) ->
    {V1_period, _B1} = protocol:uint16(_B0),
    {V1_cur_day, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_lev, _B4} = protocol:uint32(_B3),
    {V1_rmb_status, _B5} = protocol:uint8(_B4),
    {V1_win_count, _B6} = protocol:uint32(_B5),
    {V1_list, _B12} = protocol:array(_B6,
				     fun (_B7) ->
					     {V2_id, _B8} =
						 protocol:uint32(_B7),
					     {V2_award_status, _B9} =
						 protocol:uint8(_B8),
					     {V2_rmb_award_status, _B10} =
						 protocol:uint8(_B9),
					     {{V2_id, V2_award_status,
					       V2_rmb_award_status},
					      _B10}
				     end),
    {ok,
     {V1_period, V1_cur_day, V1_end_time, V1_lev,
      V1_rmb_status, V1_win_count, V1_list}};
unpack(24953, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(24953, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(24954, srv, _B0) -> {ok, {}};
unpack(24954, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(24955, srv, _B0) -> {ok, {}};
unpack(24955, cli, _B0) ->
    {V1_is_pop, _B1} = protocol:uint8(_B0),
    {V1_cur_day, _B2} = protocol:uint32(_B1),
    {ok, {V1_is_pop, V1_cur_day}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


