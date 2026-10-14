-file("src/proto/proto_293.erl", 1).

-module(proto_293).

-lager_records([{holiday_camp_war_log_partner,
		 [pos, id, bid, lev, star, power, skin_id, resonate_lev,
		  hurt, be_hurt, curt, ext]},
		{holiday_camp_war_log_info,
		 [id, round, ret, time, a_id, a_name, a_power,
		  a_formation_type, a_order, a_end_hp, a_hallows_id,
		  a_hallows_look_id, a_sprite_lev, a_sprites, b_id,
		  b_name, b_power, b_formation_type, b_order, b_end_hp,
		  b_hallows_id, b_hallows_look_id, b_sprite_lev,
		  b_sprites, a_plist, b_plist, ext]},
		{holiday_camp_war_log_face,
		 [id, pos, is_leader, lev, name, face_id, avatar_bid,
		  face_file, face_update_time]},
		{holiday_camp_war_log,
		 [id, is_atk, atk_id, atk_name, atk_power, atk_face,
		  def_id, def_name, def_power, def_face, ret, win_count,
		  lose_count, replay_list, time]},
		{role_holiday_camp_war_log, [id, list]},
		{holiday_camp_war_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  resonate_lev, dower_skill, set_skill, attr, extra]},
		{holiday_camp_war_defense_role,
		 [id, name, face_id, power, avatar_bid, lev, pos,
		  is_leader, rank, score, face_update_time, face_file,
		  formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  hallows_refine, sprite_lev, sprite_breka_lev,
		  sprite_attr, sprites, ext, break_groups]},
		{holiday_camp_war_info,
		 [id, name, face_id, power, avatar_bid, lev, rank, score,
		  face_update_time, face_file, ext]},
		{holiday_camp_war_role,
		 [ver, id, camp_id, name, lev, face_id, avatar_bid,
		  power, camp_power, face_update_time, face_file, rank,
		  score, last_score, score_time, ext]},
		{holiday_camp_war_rank,
		 [rank, id, score, score_time, power]},
		{holiday_camp_war_camp_info,
		 [id, medal_score, score, score_time, member_num,
		  all_power, have_fort, can_combat_fort, vote_list,
		  old_fort_num, last_fort_num, old_medal_score,
		  last_medal_score, ext]},
		{holiday_camp_war_fort,
		 [id, a_score, b_score, unit_id, difficulty, belong, log,
		  state_log, a_up, b_up, ext]},
		{m_holiday_camp_war,
		 [ver, period, camp_id, old_data, last_camp, ref_count,
		  atk_defens, def_defens, end_time, is_enter, enter_flag,
		  vote_flag, first_flag, first_count, first_buy_count,
		  second_count, second_buy_count]},
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

-file("src/proto/proto_293.erl", 16).

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

-file("src/proto/proto_293.erl", 17).

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

-file("src/proto/proto_293.erl", 18).

-file("inc/holiday_camp_war.hrl", 1).

-record(m_holiday_camp_war,
	{ver = 1, period = 0, camp_id = 0, old_data = [],
	 last_camp = 0, ref_count = 0, atk_defens = [],
	 def_defens = [], end_time = 0, is_enter = 0,
	 enter_flag = 0, vote_flag = 0, first_flag = 0,
	 first_count = 0, first_buy_count = 0, second_count = 0,
	 second_buy_count = 0}).

-record(holiday_camp_war_fort,
	{id = {0, <<>>}, a_score = 0, b_score = 0, unit_id = 0,
	 difficulty = 0, belong = 0, log = [], state_log = [],
	 a_up = 0, b_up = 0, ext = []}).

-record(holiday_camp_war_camp_info,
	{id = {0, <<>>}, medal_score = 0, score = 0,
	 score_time = 0, member_num = 0, all_power = 0,
	 have_fort = [], can_combat_fort = [], vote_list = [],
	 old_fort_num = 0, last_fort_num = 0,
	 old_medal_score = 0, last_medal_score = 0, ext = []}).

-record(holiday_camp_war_rank,
	{rank = {0, 0, <<>>}, id = {0, <<>>}, score = 0,
	 score_time = 0, power = 0}).

-record(holiday_camp_war_role,
	{ver = 1, id = {{0, <<>>}, <<>>}, camp_id = 0,
	 name = <<>>, lev = 0, face_id = 0, avatar_bid = 0,
	 power = 0, camp_power = 0, face_update_time = 0,
	 face_file = <<>>, rank = 0, score = 0, last_score = 0,
	 score_time = 0, ext = []}).

-record(holiday_camp_war_info,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, rank = 0, score = 0,
	 face_update_time = 0, face_file = <<>>, ext = []}).

-record(holiday_camp_war_defense_role,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, pos = 1, is_leader = 1,
	 rank = 0, score = 0, face_update_time = 0,
	 face_file = <<>>, formation_type = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0,
	 partner_infos = [], hallows_look_id = 0,
	 hallows_lucky = 0, hallows_seal = 0,
	 hallows_all_look_ids = [], hallows_refine = 0,
	 sprite_lev = 0, sprite_breka_lev = 0, sprite_attr,
	 sprites = [], ext = [], break_groups = []}).

-record(holiday_camp_war_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 resonate_lev = 0, dower_skill = [], set_skill = [],
	 attr, extra = []}).

-record(role_holiday_camp_war_log,
	{id = {0, <<>>}, list = []}).

-record(holiday_camp_war_log,
	{id = 0, is_atk = 0, atk_id = {0, <<>>},
	 atk_name = <<>>, atk_power = <<>>, atk_face = [],
	 def_id = {0, <<>>}, def_name = <<>>, def_power = <<>>,
	 def_face = [], ret = 1, win_count = 0, lose_count = 0,
	 replay_list = [], time = 0}).

-record(holiday_camp_war_log_face,
	{id = {0, <<>>}, pos = 1, is_leader = 1, lev = 1,
	 name = <<>>, face_id = 0, avatar_bid = 0,
	 face_file = <<>>, face_update_time = 0}).

-record(holiday_camp_war_log_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_power = 0, a_formation_type = 0,
	 a_order = 0, a_end_hp = 0, a_hallows_id = 1,
	 a_hallows_look_id = 0, a_sprite_lev = 0, a_sprites = [],
	 b_id = {0, <<>>}, b_name = <<>>, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 b_hallows_id = 1, b_hallows_look_id = 0,
	 b_sprite_lev = 0, b_sprites = [], a_plist = [],
	 b_plist = [], ext = []}).

-record(holiday_camp_war_log_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0, power = 0,
	 skin_id = 0, resonate_lev = 0, hurt = 0, be_hurt = 0,
	 curt = 0, ext = #{}}).

-file("src/proto/proto_293.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(29300, cli, {}) -> {ok, <<2:32, 29300:16>>};
pack(29300, srv,
     {V0_code, V0_msg, V0_period, V0_state, V0_end_time,
      V0_big_end_time, V0_my_camp_id, V0_my_score,
      V0_last_score, V0_vote_flag, V0_residue_count,
      V0_residue_buy_count, V0_my_camp_point,
      V0_other_camp_point, V0_fort_info}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_period:8,
		V0_state:8, V0_end_time:32, V0_big_end_time:32,
		V0_my_camp_id:32, V0_my_score:32, V0_last_score:32,
		V0_vote_flag:8, V0_residue_count:32,
		V0_residue_buy_count:32, V0_my_camp_point:32,
		V0_other_camp_point:32, (length(V0_fort_info)):16,
		(list_to_binary([<<V1_id:32, V1_belong:32,
				   V1_difficulty:8, V1_can_atk:8,
				   V1_vote_num:32, V1_is_max:8>>
				 || {V1_id, V1_belong, V1_difficulty,
				     V1_can_atk, V1_vote_num, V1_is_max}
					<- V0_fort_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29300:16,
       D_a_t_a/binary>>};
pack(29301, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8/signed>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29301:16,
       D_a_t_a/binary>>};
pack(29301, srv,
     {V0_code, V0_msg, V0_id, V0_belong, V0_difficulty,
      V0_a_score, V0_b_score, V0_combat_log,
      V0_second_log}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32,
		V0_belong:32, V0_difficulty:8, V0_a_score:32,
		V0_b_score:32, (length(V0_combat_log)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_name))/binary,
				   V1_camp_id:32, V1_add_score:32>>
				 || {V1_name, V1_camp_id, V1_add_score}
					<- V0_combat_log]))/binary,
		(length(V0_second_log)):16,
		(list_to_binary([<<V1_state_num:8, V1_win_camp:32,
				   V1_end_state:8, V1_a_log_score:32,
				   V1_b_log_score:32>>
				 || {V1_state_num, V1_win_camp, V1_end_state,
				     V1_a_log_score, V1_b_log_score}
					<- V0_second_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29301:16,
       D_a_t_a/binary>>};
pack(29302, cli,
     {V0_id, V0_formation_type, V0_pos_info,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_id:32, V0_formation_type:16,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || #formation_pos{pos = V1_pos, id = V1_id}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29302:16,
       D_a_t_a/binary>>};
pack(29302, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29302:16,
       D_a_t_a/binary>>};
pack(29303, cli, {}) -> {ok, <<2:32, 29303:16>>};
pack(29303, srv,
     {V0_all_dps, V0_add_score, V0_camp_id, V0_id,
      V0_unit_id, V0_period, V0_target_role_name,
      V0_hurt_statistics, V0_reward}) ->
    D_a_t_a = <<V0_all_dps:32, V0_add_score:32,
		V0_camp_id:32, V0_id:32, V0_unit_id:32, V0_period:8,
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
				 || {V1_base_id, V1_num}
					<- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29303:16,
       D_a_t_a/binary>>};
pack(29304, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29304:16,
       D_a_t_a/binary>>};
pack(29304, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29304:16,
       D_a_t_a/binary>>};
pack(29305, cli, {}) -> {ok, <<2:32, 29305:16>>};
pack(29305, srv,
     {V0_code, V0_msg, V0_residue_count,
      V0_residue_buy_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_residue_count:16, V0_residue_buy_count:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29305:16,
       D_a_t_a/binary>>};
pack(29306, cli, {}) -> {ok, <<2:32, 29306:16>>};
pack(29306, srv,
     {V0_code, V0_msg, V0_camp_change_info}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_camp_change_info)):16,
		(list_to_binary([<<V1_camp_id:32, V1_last_point:32,
				   V1_last_score:32, V1_point:32, V1_score:32>>
				 || {V1_camp_id, V1_last_point, V1_last_score,
				     V1_point, V1_score}
					<- V0_camp_change_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29306:16,
       D_a_t_a/binary>>};
pack(29307, cli, {}) -> {ok, <<2:32, 29307:16>>};
pack(29307, srv,
     {V0_code, V0_msg, V0_atk_team_members,
      V0_def_team_members, V0_ref_count, V0_end_time,
      V0_is_enter}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_atk_team_members)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_sid))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_power:32, V1_avatar_bid:32,
				   V1_lev:32, V1_pos:16, V1_is_leader:8,
				   V1_rank:32, V1_score:32,
				   V1_face_update_time:32,
				   (protocol:pack(string, V1_face_file))/binary,
				   V1_formation_type:32, V1_hallows_id:32,
				   V1_hallows_look_id:32, V1_sprite_lev:32,
				   (length(V1_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites]))/binary,
				   (length(V1_partner_infos)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_star:8,
						      V2_use_skin:32,
						      V2_resonate_lev:32>>
						    || #holiday_camp_war_partners_info{pos
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
										       use_skin
											   =
											   V2_use_skin,
										       resonate_lev
											   =
											   V2_resonate_lev}
							   <- V1_partner_infos]))/binary>>
				 || #holiday_camp_war_defense_role{id =
								       {V1_rid,
									V1_sid},
								   name =
								       V1_name,
								   face_id =
								       V1_face_id,
								   power =
								       V1_power,
								   avatar_bid =
								       V1_avatar_bid,
								   lev = V1_lev,
								   pos = V1_pos,
								   is_leader =
								       V1_is_leader,
								   rank =
								       V1_rank,
								   score =
								       V1_score,
								   face_update_time
								       =
								       V1_face_update_time,
								   face_file =
								       V1_face_file,
								   formation_type
								       =
								       V1_formation_type,
								   hallows_id =
								       V1_hallows_id,
								   hallows_look_id
								       =
								       V1_hallows_look_id,
								   sprite_lev =
								       V1_sprite_lev,
								   sprites =
								       V1_sprites,
								   partner_infos
								       =
								       V1_partner_infos}
					<- V0_atk_team_members]))/binary,
		(length(V0_def_team_members)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_sid))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_power:32, V1_avatar_bid:32,
				   V1_lev:32, V1_pos:16, V1_is_leader:8,
				   V1_rank:32, V1_score:32,
				   V1_face_update_time:32,
				   (protocol:pack(string, V1_face_file))/binary,
				   V1_formation_type:32, V1_hallows_id:32,
				   V1_hallows_look_id:32, V1_sprite_lev:32,
				   (length(V1_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_sprites]))/binary,
				   (length(V1_partner_infos)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_star:8,
						      V2_use_skin:32,
						      V2_resonate_lev:32>>
						    || #holiday_camp_war_partners_info{pos
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
										       use_skin
											   =
											   V2_use_skin,
										       resonate_lev
											   =
											   V2_resonate_lev}
							   <- V1_partner_infos]))/binary>>
				 || #holiday_camp_war_defense_role{id =
								       {V1_rid,
									V1_sid},
								   name =
								       V1_name,
								   face_id =
								       V1_face_id,
								   power =
								       V1_power,
								   avatar_bid =
								       V1_avatar_bid,
								   lev = V1_lev,
								   pos = V1_pos,
								   is_leader =
								       V1_is_leader,
								   rank =
								       V1_rank,
								   score =
								       V1_score,
								   face_update_time
								       =
								       V1_face_update_time,
								   face_file =
								       V1_face_file,
								   formation_type
								       =
								       V1_formation_type,
								   hallows_id =
								       V1_hallows_id,
								   hallows_look_id
								       =
								       V1_hallows_look_id,
								   sprite_lev =
								       V1_sprite_lev,
								   sprites =
								       V1_sprites,
								   partner_infos
								       =
								       V1_partner_infos}
					<- V0_def_team_members]))/binary,
		V0_ref_count:8, V0_end_time:32, V0_is_enter:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29307:16,
       D_a_t_a/binary>>};
pack(29308, cli, {}) -> {ok, <<2:32, 29308:16>>};
pack(29308, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29308:16,
       D_a_t_a/binary>>};
pack(29309, cli, {}) -> {ok, <<2:32, 29309:16>>};
pack(29309, srv, {}) -> {ok, <<2:32, 29309:16>>};
pack(29310, cli, {V0_pos_info}) ->
    D_a_t_a = <<(length(V0_pos_info)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_sid))/binary,
				   V1_pos:16>>
				 || {{V1_rid, V1_sid}, V1_pos}
					<- V0_pos_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29310:16,
       D_a_t_a/binary>>};
pack(29310, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29310:16,
       D_a_t_a/binary>>};
pack(29311, cli, {}) -> {ok, <<2:32, 29311:16>>};
pack(29311, srv,
     {V0_result, V0_add_score, V0_win_count, V0_lose_count,
      V0_all_hurt_statistics, V0_reward}) ->
    D_a_t_a = <<V0_result:8, V0_add_score:32,
		V0_win_count:32, V0_lose_count:32,
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
				   V1_replay_id:32,
				   (protocol:pack(string, V1_a_name))/binary,
				   (protocol:pack(string, V1_b_name))/binary,
				   V1_ret:8>>
				 || {V1_type, V1_a_round, V1_b_round,
				     V1_hurt_statistics, V1_replay_id,
				     V1_a_name, V1_b_name, V1_ret}
					<- V0_all_hurt_statistics]))/binary,
		(length(V0_reward)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29311:16,
       D_a_t_a/binary>>};
pack(29312, cli, {}) -> {ok, <<2:32, 29312:16>>};
pack(29312, srv,
     {#holiday_camp_war_defense_role{id = {V0_rid, V0_sid},
				     name = V0_name, face_id = V0_face_id,
				     power = V0_power,
				     avatar_bid = V0_avatar_bid, lev = V0_lev,
				     pos = V0_pos, is_leader = V0_is_leader,
				     rank = V0_rank, score = V0_score,
				     face_update_time = V0_face_update_time,
				     face_file = V0_face_file,
				     formation_type = V0_formation_type,
				     hallows_id = V0_hallows_id,
				     hallows_look_id = V0_hallows_look_id,
				     sprite_lev = V0_sprite_lev,
				     sprites = V0_sprites,
				     partner_infos = V0_partner_infos}}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_sid))/binary,
		(protocol:pack(string, V0_name))/binary, V0_face_id:32,
		V0_power:32, V0_avatar_bid:32, V0_lev:32, V0_pos:16,
		V0_is_leader:8, V0_rank:32, V0_score:32,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary,
		V0_formation_type:32, V0_hallows_id:32,
		V0_hallows_look_id:32, V0_sprite_lev:32,
		(length(V0_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_sprites]))/binary,
		(length(V0_partner_infos)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_star:8, V1_use_skin:32,
				   V1_resonate_lev:32>>
				 || #holiday_camp_war_partners_info{pos =
									V1_pos,
								    bid =
									V1_bid,
								    lev =
									V1_lev,
								    star =
									V1_star,
								    use_skin =
									V1_use_skin,
								    resonate_lev
									=
									V1_resonate_lev}
					<- V0_partner_infos]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29312:16,
       D_a_t_a/binary>>};
pack(29313, cli, {V0_pos_info}) ->
    D_a_t_a = <<(length(V0_pos_info)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_sid))/binary,
				   V1_pos:16>>
				 || {{V1_rid, V1_sid}, V1_pos}
					<- V0_pos_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29313:16,
       D_a_t_a/binary>>};
pack(29313, srv, {}) -> {ok, <<2:32, 29313:16>>};
pack(29314, cli,
     {V0_camp_id, V0_start_num, V0_end_num}) ->
    D_a_t_a = <<V0_camp_id:32, V0_start_num:32,
		V0_end_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29314:16,
       D_a_t_a/binary>>};
pack(29314, srv,
     {V0_code, V0_msg, V0_my_rank, V0_my_score,
      V0_my_camp_id, V0_rank_per, V0_camp_id,
      V0_team_members}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_my_rank:32,
		V0_my_score:32, V0_my_camp_id:32, V0_rank_per:32,
		V0_camp_id:32, (length(V0_team_members)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_sid))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_power:32, V1_avatar_bid:32,
				   V1_lev:32, V1_rank:32, V1_score:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #holiday_camp_war_info{id =
							       {V1_rid, V1_sid},
							   name = V1_name,
							   face_id = V1_face_id,
							   power = V1_power,
							   avatar_bid =
							       V1_avatar_bid,
							   lev = V1_lev,
							   rank = V1_rank,
							   score = V1_score,
							   face_update_time =
							       V1_face_update_time,
							   face_file =
							       V1_face_file}
					<- V0_team_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29314:16,
       D_a_t_a/binary>>};
pack(29315, cli, {}) -> {ok, <<2:32, 29315:16>>};
pack(29315, srv, {V0_holiday_camp_war_log}) ->
    D_a_t_a = <<(length(V0_holiday_camp_war_log)):16,
		(list_to_binary([<<V1_id:32, V1_is_atk:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_atk_name))/binary,
				   (length(V1_atk_face)):16,
				   (list_to_binary([<<V2_pos:8, V2_rid:32,
						      (protocol:pack(string,
								     V2_srv_id))/binary,
						      V2_face_id:32,
						      V2_avatar_bid:32,
						      V2_is_leader:32,
						      V2_lev:16,
						      V2_face_update_time:32,
						      (protocol:pack(string,
								     V2_face_file))/binary>>
						    || #holiday_camp_war_log_face{pos
										      =
										      V2_pos,
										  id
										      =
										      {V2_rid,
										       V2_srv_id},
										  face_id
										      =
										      V2_face_id,
										  avatar_bid
										      =
										      V2_avatar_bid,
										  is_leader
										      =
										      V2_is_leader,
										  lev
										      =
										      V2_lev,
										  face_update_time
										      =
										      V2_face_update_time,
										  face_file
										      =
										      V2_face_file}
							   <- V1_atk_face]))/binary,
				   V1_def_rid:32,
				   (protocol:pack(string,
						  V1_def_srv_id))/binary,
				   (protocol:pack(string, V1_def_name))/binary,
				   (length(V1_def_face)):16,
				   (list_to_binary([<<V2_pos:8, V2_rid:32,
						      (protocol:pack(string,
								     V2_srv_id))/binary,
						      V2_face_id:32,
						      V2_avatar_bid:32,
						      V2_is_leader:32,
						      V2_lev:16,
						      V2_face_update_time:32,
						      (protocol:pack(string,
								     V2_face_file))/binary>>
						    || #holiday_camp_war_log_face{pos
										      =
										      V2_pos,
										  id
										      =
										      {V2_rid,
										       V2_srv_id},
										  face_id
										      =
										      V2_face_id,
										  avatar_bid
										      =
										      V2_avatar_bid,
										  is_leader
										      =
										      V2_is_leader,
										  lev
										      =
										      V2_lev,
										  face_update_time
										      =
										      V2_face_update_time,
										  face_file
										      =
										      V2_face_file}
							   <- V1_def_face]))/binary,
				   V1_ret:8, V1_win_count:8, V1_lose_count:8,
				   V1_time:32, V1_atk_power:32,
				   V1_def_power:32>>
				 || #holiday_camp_war_log{id = V1_id,
							  is_atk = V1_is_atk,
							  atk_id =
							      {V1_rid,
							       V1_srv_id},
							  atk_name =
							      V1_atk_name,
							  atk_face =
							      V1_atk_face,
							  def_id =
							      {V1_def_rid,
							       V1_def_srv_id},
							  def_name =
							      V1_def_name,
							  def_face =
							      V1_def_face,
							  ret = V1_ret,
							  win_count =
							      V1_win_count,
							  lose_count =
							      V1_lose_count,
							  time = V1_time,
							  atk_power =
							      V1_atk_power,
							  def_power =
							      V1_def_power}
					<- V0_holiday_camp_war_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29315:16,
       D_a_t_a/binary>>};
pack(29316, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29316:16,
       D_a_t_a/binary>>};
pack(29316, srv, {V0_id, V0_replay_infos}) ->
    D_a_t_a = <<V0_id:32, (length(V0_replay_infos)):16,
		(list_to_binary([<<V1_order:8, V1_id:32, V1_round:8,
				   V1_ret:8, V1_time:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_a_power:32, V1_a_formation_type:32,
				   V1_a_order:8, V1_a_end_hp:8,
				   V1_a_sprite_lev:16,
				   (length(V1_a_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_a_sprites]))/binary,
				   V1_b_rid:32,
				   (protocol:pack(string, V1_b_srv_id))/binary,
				   V1_b_power:32, V1_b_formation_type:32,
				   V1_b_order:8, V1_b_end_hp:8,
				   V1_b_sprite_lev:16,
				   (length(V1_b_sprites)):16,
				   (list_to_binary([<<V2_pos:8, V2_item_bid:32>>
						    || {V2_pos, V2_item_bid}
							   <- V1_b_sprites]))/binary,
				   (length(V1_a_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_power:32,
						      V2_skin_id:32,
						      V2_resonate_lev:32,
						      V2_hurt:32, V2_curt:32,
						      V2_be_hurt:32>>
						    || #holiday_camp_war_log_partner{pos
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
										     power
											 =
											 V2_power,
										     skin_id
											 =
											 V2_skin_id,
										     resonate_lev
											 =
											 V2_resonate_lev,
										     hurt
											 =
											 V2_hurt,
										     curt
											 =
											 V2_curt,
										     be_hurt
											 =
											 V2_be_hurt}
							   <- V1_a_plist]))/binary,
				   (length(V1_b_plist)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_power:32,
						      V2_skin_id:32,
						      V2_resonate_lev:32,
						      V2_hurt:32, V2_curt:32,
						      V2_be_hurt:32>>
						    || #holiday_camp_war_log_partner{pos
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
										     power
											 =
											 V2_power,
										     skin_id
											 =
											 V2_skin_id,
										     resonate_lev
											 =
											 V2_resonate_lev,
										     hurt
											 =
											 V2_hurt,
										     curt
											 =
											 V2_curt,
										     be_hurt
											 =
											 V2_be_hurt}
							   <- V1_b_plist]))/binary,
				   (protocol:pack(string, V1_a_name))/binary,
				   (protocol:pack(string, V1_b_name))/binary>>
				 || {V1_order,
				     #holiday_camp_war_log_info{id = V1_id,
								round =
								    V1_round,
								ret = V1_ret,
								time = V1_time,
								a_id =
								    {V1_rid,
								     V1_srv_id},
								a_power =
								    V1_a_power,
								a_formation_type
								    =
								    V1_a_formation_type,
								a_order =
								    V1_a_order,
								a_end_hp =
								    V1_a_end_hp,
								a_sprite_lev =
								    V1_a_sprite_lev,
								a_sprites =
								    V1_a_sprites,
								b_id =
								    {V1_b_rid,
								     V1_b_srv_id},
								b_power =
								    V1_b_power,
								b_formation_type
								    =
								    V1_b_formation_type,
								b_order =
								    V1_b_order,
								b_end_hp =
								    V1_b_end_hp,
								b_sprite_lev =
								    V1_b_sprite_lev,
								b_sprites =
								    V1_b_sprites,
								a_plist =
								    V1_a_plist,
								b_plist =
								    V1_b_plist,
								a_name =
								    V1_a_name,
								b_name =
								    V1_b_name}}
					<- V0_replay_infos]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29316:16,
       D_a_t_a/binary>>};
pack(29317, cli, {}) -> {ok, <<2:32, 29317:16>>};
pack(29317, srv,
     {V0_code, V0_msg, V0_count, V0_buy_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:16,
		V0_buy_count:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29317:16,
       D_a_t_a/binary>>};
pack(29318, cli, {}) -> {ok, <<2:32, 29318:16>>};
pack(29318, srv, {}) -> {ok, <<2:32, 29318:16>>};
pack(29319, cli, {}) -> {ok, <<2:32, 29319:16>>};
pack(29319, srv, {V0_camp_id}) ->
    D_a_t_a = <<V0_camp_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 29319:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(29300, srv, _B0) -> {ok, {}};
unpack(29300, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_period, _B3} = protocol:uint8(_B2),
    {V1_state, _B4} = protocol:uint8(_B3),
    {V1_end_time, _B5} = protocol:uint32(_B4),
    {V1_big_end_time, _B6} = protocol:uint32(_B5),
    {V1_my_camp_id, _B7} = protocol:uint32(_B6),
    {V1_my_score, _B8} = protocol:uint32(_B7),
    {V1_last_score, _B9} = protocol:uint32(_B8),
    {V1_vote_flag, _B10} = protocol:uint8(_B9),
    {V1_residue_count, _B11} = protocol:uint32(_B10),
    {V1_residue_buy_count, _B12} = protocol:uint32(_B11),
    {V1_my_camp_point, _B13} = protocol:uint32(_B12),
    {V1_other_camp_point, _B14} = protocol:uint32(_B13),
    {V1_fort_info, _B23} = protocol:array(_B14,
					  fun (_B15) ->
						  {V2_id, _B16} =
						      protocol:uint32(_B15),
						  {V2_belong, _B17} =
						      protocol:uint32(_B16),
						  {V2_difficulty, _B18} =
						      protocol:uint8(_B17),
						  {V2_can_atk, _B19} =
						      protocol:uint8(_B18),
						  {V2_vote_num, _B20} =
						      protocol:uint32(_B19),
						  {V2_is_max, _B21} =
						      protocol:uint8(_B20),
						  {{V2_id, V2_belong,
						    V2_difficulty, V2_can_atk,
						    V2_vote_num, V2_is_max},
						   _B21}
					  end),
    {ok,
     {V1_code, V1_msg, V1_period, V1_state, V1_end_time,
      V1_big_end_time, V1_my_camp_id, V1_my_score,
      V1_last_score, V1_vote_flag, V1_residue_count,
      V1_residue_buy_count, V1_my_camp_point,
      V1_other_camp_point, V1_fort_info}};
unpack(29301, srv, _B0) ->
    {V1_id, _B1} = protocol:int8(_B0), {ok, {V1_id}};
unpack(29301, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_belong, _B4} = protocol:uint32(_B3),
    {V1_difficulty, _B5} = protocol:uint8(_B4),
    {V1_a_score, _B6} = protocol:uint32(_B5),
    {V1_b_score, _B7} = protocol:uint32(_B6),
    {V1_combat_log, _B13} = protocol:array(_B7,
					   fun (_B8) ->
						   {V2_name, _B9} =
						       protocol:string(_B8),
						   {V2_camp_id, _B10} =
						       protocol:uint32(_B9),
						   {V2_add_score, _B11} =
						       protocol:uint32(_B10),
						   {{V2_name, V2_camp_id,
						     V2_add_score},
						    _B11}
					   end),
    {V1_second_log, _B21} = protocol:array(_B13,
					   fun (_B14) ->
						   {V2_state_num, _B15} =
						       protocol:uint8(_B14),
						   {V2_win_camp, _B16} =
						       protocol:uint32(_B15),
						   {V2_end_state, _B17} =
						       protocol:uint8(_B16),
						   {V2_a_log_score, _B18} =
						       protocol:uint32(_B17),
						   {V2_b_log_score, _B19} =
						       protocol:uint32(_B18),
						   {{V2_state_num, V2_win_camp,
						     V2_end_state,
						     V2_a_log_score,
						     V2_b_log_score},
						    _B19}
					   end),
    {ok,
     {V1_code, V1_msg, V1_id, V1_belong, V1_difficulty,
      V1_a_score, V1_b_score, V1_combat_log, V1_second_log}};
unpack(29302, srv, _B0) ->
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
unpack(29302, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(29303, srv, _B0) -> {ok, {}};
unpack(29303, cli, _B0) ->
    {V1_all_dps, _B1} = protocol:uint32(_B0),
    {V1_add_score, _B2} = protocol:uint32(_B1),
    {V1_camp_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_unit_id, _B5} = protocol:uint32(_B4),
    {V1_period, _B6} = protocol:uint8(_B5),
    {V1_target_role_name, _B7} = protocol:string(_B6),
    {V1_hurt_statistics, _B29} = protocol:array(_B7,
						fun (_B8) ->
							{V2_type, _B9} =
							    protocol:uint8(_B8),
							{V2_partner_hurts,
							 _B27} =
							    protocol:array(_B9,
									   fun
									     (_B10) ->
										 {V3_rid,
										  _B11} =
										     protocol:uint32(_B10),
										 {V3_srvid,
										  _B12} =
										     protocol:string(_B11),
										 {V3_id,
										  _B13} =
										     protocol:uint32(_B12),
										 {V3_bid,
										  _B14} =
										     protocol:uint32(_B13),
										 {V3_star,
										  _B15} =
										     protocol:uint32(_B14),
										 {V3_lev,
										  _B16} =
										     protocol:uint32(_B15),
										 {V3_camp_type,
										  _B17} =
										     protocol:uint32(_B16),
										 {V3_dps,
										  _B18} =
										     protocol:uint32(_B17),
										 {V3_cure,
										  _B19} =
										     protocol:uint32(_B18),
										 {V3_ext_data,
										  _B24} =
										     protocol:array(_B19,
												    fun
												      (_B20) ->
													  {V4_key,
													   _B21} =
													      protocol:uint32(_B20),
													  {V4_val,
													   _B22} =
													      protocol:uint32(_B21),
													  {{V4_key,
													    V4_val},
													   _B22}
												    end),
										 {V3_be_hurt,
										  _B25} =
										     protocol:uint32(_B24),
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
										  _B25}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B27}
						end),
    {V1_reward, _B34} = protocol:array(_B29,
				       fun (_B30) ->
					       {V2_base_id, _B31} =
						   protocol:uint32(_B30),
					       {V2_num, _B32} =
						   protocol:uint32(_B31),
					       {{V2_base_id, V2_num}, _B32}
				       end),
    {ok,
     {V1_all_dps, V1_add_score, V1_camp_id, V1_id,
      V1_unit_id, V1_period, V1_target_role_name,
      V1_hurt_statistics, V1_reward}};
unpack(29304, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(29304, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(29305, srv, _B0) -> {ok, {}};
unpack(29305, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_residue_count, _B3} = protocol:uint16(_B2),
    {V1_residue_buy_count, _B4} = protocol:uint16(_B3),
    {ok,
     {V1_code, V1_msg, V1_residue_count,
      V1_residue_buy_count}};
unpack(29306, srv, _B0) -> {ok, {}};
unpack(29306, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_camp_change_info, _B10} = protocol:array(_B2,
						 fun (_B3) ->
							 {V2_camp_id, _B4} =
							     protocol:uint32(_B3),
							 {V2_last_point, _B5} =
							     protocol:uint32(_B4),
							 {V2_last_score, _B6} =
							     protocol:uint32(_B5),
							 {V2_point, _B7} =
							     protocol:uint32(_B6),
							 {V2_score, _B8} =
							     protocol:uint32(_B7),
							 {{V2_camp_id,
							   V2_last_point,
							   V2_last_score,
							   V2_point, V2_score},
							  _B8}
						 end),
    {ok, {V1_code, V1_msg, V1_camp_change_info}};
unpack(29307, srv, _B0) -> {ok, {}};
unpack(29307, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_atk_team_members, _B36} = protocol:array(_B2,
						 fun (_B3) ->
							 {V2_rid, _B4} =
							     protocol:uint32(_B3),
							 {V2_sid, _B5} =
							     protocol:string(_B4),
							 {V2_name, _B6} =
							     protocol:string(_B5),
							 {V2_face_id, _B7} =
							     protocol:uint32(_B6),
							 {V2_power, _B8} =
							     protocol:uint32(_B7),
							 {V2_avatar_bid, _B9} =
							     protocol:uint32(_B8),
							 {V2_lev, _B10} =
							     protocol:uint32(_B9),
							 {V2_pos, _B11} =
							     protocol:uint16(_B10),
							 {V2_is_leader, _B12} =
							     protocol:uint8(_B11),
							 {V2_rank, _B13} =
							     protocol:uint32(_B12),
							 {V2_score, _B14} =
							     protocol:uint32(_B13),
							 {V2_face_update_time,
							  _B15} =
							     protocol:uint32(_B14),
							 {V2_face_file, _B16} =
							     protocol:string(_B15),
							 {V2_formation_type,
							  _B17} =
							     protocol:uint32(_B16),
							 {V2_hallows_id, _B18} =
							     protocol:uint32(_B17),
							 {V2_hallows_look_id,
							  _B19} =
							     protocol:uint32(_B18),
							 {V2_sprite_lev, _B20} =
							     protocol:uint32(_B19),
							 {V2_sprites, _B25} =
							     protocol:array(_B20,
									    fun
									      (_B21) ->
										  {V3_pos,
										   _B22} =
										      protocol:uint8(_B21),
										  {V3_item_bid,
										   _B23} =
										      protocol:uint32(_B22),
										  {{V3_pos,
										    V3_item_bid},
										   _B23}
									    end),
							 {V2_partner_infos,
							  _B34} =
							     protocol:array(_B25,
									    fun
									      (_B26) ->
										  {V3_pos,
										   _B27} =
										      protocol:uint8(_B26),
										  {V3_bid,
										   _B28} =
										      protocol:uint32(_B27),
										  {V3_lev,
										   _B29} =
										      protocol:uint16(_B28),
										  {V3_star,
										   _B30} =
										      protocol:uint8(_B29),
										  {V3_use_skin,
										   _B31} =
										      protocol:uint32(_B30),
										  {V3_resonate_lev,
										   _B32} =
										      protocol:uint32(_B31),
										  {{V3_pos,
										    V3_bid,
										    V3_lev,
										    V3_star,
										    V3_use_skin,
										    V3_resonate_lev},
										   _B32}
									    end),
							 {{V2_rid, V2_sid,
							   V2_name, V2_face_id,
							   V2_power,
							   V2_avatar_bid,
							   V2_lev, V2_pos,
							   V2_is_leader,
							   V2_rank, V2_score,
							   V2_face_update_time,
							   V2_face_file,
							   V2_formation_type,
							   V2_hallows_id,
							   V2_hallows_look_id,
							   V2_sprite_lev,
							   V2_sprites,
							   V2_partner_infos},
							  _B34}
						 end),
    {V1_def_team_members, _B70} = protocol:array(_B36,
						 fun (_B37) ->
							 {V2_rid, _B38} =
							     protocol:uint32(_B37),
							 {V2_sid, _B39} =
							     protocol:string(_B38),
							 {V2_name, _B40} =
							     protocol:string(_B39),
							 {V2_face_id, _B41} =
							     protocol:uint32(_B40),
							 {V2_power, _B42} =
							     protocol:uint32(_B41),
							 {V2_avatar_bid, _B43} =
							     protocol:uint32(_B42),
							 {V2_lev, _B44} =
							     protocol:uint32(_B43),
							 {V2_pos, _B45} =
							     protocol:uint16(_B44),
							 {V2_is_leader, _B46} =
							     protocol:uint8(_B45),
							 {V2_rank, _B47} =
							     protocol:uint32(_B46),
							 {V2_score, _B48} =
							     protocol:uint32(_B47),
							 {V2_face_update_time,
							  _B49} =
							     protocol:uint32(_B48),
							 {V2_face_file, _B50} =
							     protocol:string(_B49),
							 {V2_formation_type,
							  _B51} =
							     protocol:uint32(_B50),
							 {V2_hallows_id, _B52} =
							     protocol:uint32(_B51),
							 {V2_hallows_look_id,
							  _B53} =
							     protocol:uint32(_B52),
							 {V2_sprite_lev, _B54} =
							     protocol:uint32(_B53),
							 {V2_sprites, _B59} =
							     protocol:array(_B54,
									    fun
									      (_B55) ->
										  {V3_pos,
										   _B56} =
										      protocol:uint8(_B55),
										  {V3_item_bid,
										   _B57} =
										      protocol:uint32(_B56),
										  {{V3_pos,
										    V3_item_bid},
										   _B57}
									    end),
							 {V2_partner_infos,
							  _B68} =
							     protocol:array(_B59,
									    fun
									      (_B60) ->
										  {V3_pos,
										   _B61} =
										      protocol:uint8(_B60),
										  {V3_bid,
										   _B62} =
										      protocol:uint32(_B61),
										  {V3_lev,
										   _B63} =
										      protocol:uint16(_B62),
										  {V3_star,
										   _B64} =
										      protocol:uint8(_B63),
										  {V3_use_skin,
										   _B65} =
										      protocol:uint32(_B64),
										  {V3_resonate_lev,
										   _B66} =
										      protocol:uint32(_B65),
										  {{V3_pos,
										    V3_bid,
										    V3_lev,
										    V3_star,
										    V3_use_skin,
										    V3_resonate_lev},
										   _B66}
									    end),
							 {{V2_rid, V2_sid,
							   V2_name, V2_face_id,
							   V2_power,
							   V2_avatar_bid,
							   V2_lev, V2_pos,
							   V2_is_leader,
							   V2_rank, V2_score,
							   V2_face_update_time,
							   V2_face_file,
							   V2_formation_type,
							   V2_hallows_id,
							   V2_hallows_look_id,
							   V2_sprite_lev,
							   V2_sprites,
							   V2_partner_infos},
							  _B68}
						 end),
    {V1_ref_count, _B71} = protocol:uint8(_B70),
    {V1_end_time, _B72} = protocol:uint32(_B71),
    {V1_is_enter, _B73} = protocol:uint8(_B72),
    {ok,
     {V1_code, V1_msg, V1_atk_team_members,
      V1_def_team_members, V1_ref_count, V1_end_time,
      V1_is_enter}};
unpack(29308, srv, _B0) -> {ok, {}};
unpack(29308, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(29309, srv, _B0) -> {ok, {}};
unpack(29309, cli, _B0) -> {ok, {}};
unpack(29310, srv, _B0) ->
    {V1_pos_info, _B6} = protocol:array(_B0,
					fun (_B1) ->
						{V2_rid, _B2} =
						    protocol:uint32(_B1),
						{V2_sid, _B3} =
						    protocol:string(_B2),
						{V2_pos, _B4} =
						    protocol:uint16(_B3),
						{{V2_rid, V2_sid, V2_pos}, _B4}
					end),
    {ok, {V1_pos_info}};
unpack(29310, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(29311, srv, _B0) -> {ok, {}};
unpack(29311, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_add_score, _B2} = protocol:uint32(_B1),
    {V1_win_count, _B3} = protocol:uint32(_B2),
    {V1_lose_count, _B4} = protocol:uint32(_B3),
    {V1_all_hurt_statistics, _B36} = protocol:array(_B4,
						    fun (_B5) ->
							    {V2_type, _B6} =
								protocol:uint8(_B5),
							    {V2_a_round, _B7} =
								protocol:uint8(_B6),
							    {V2_b_round, _B8} =
								protocol:uint8(_B7),
							    {V2_hurt_statistics,
							     _B30} =
								protocol:array(_B8,
									       fun
										 (_B9) ->
										     {V3_type,
										      _B10} =
											 protocol:uint8(_B9),
										     {V3_partner_hurts,
										      _B28} =
											 protocol:array(_B10,
													fun
													  (_B11) ->
													      {V4_rid,
													       _B12} =
														  protocol:uint32(_B11),
													      {V4_srvid,
													       _B13} =
														  protocol:string(_B12),
													      {V4_id,
													       _B14} =
														  protocol:uint32(_B13),
													      {V4_bid,
													       _B15} =
														  protocol:uint32(_B14),
													      {V4_star,
													       _B16} =
														  protocol:uint32(_B15),
													      {V4_lev,
													       _B17} =
														  protocol:uint32(_B16),
													      {V4_camp_type,
													       _B18} =
														  protocol:uint32(_B17),
													      {V4_dps,
													       _B19} =
														  protocol:uint32(_B18),
													      {V4_cure,
													       _B20} =
														  protocol:uint32(_B19),
													      {V4_ext_data,
													       _B25} =
														  protocol:array(_B20,
																 fun
																   (_B21) ->
																       {V5_key,
																	_B22} =
																	   protocol:uint32(_B21),
																       {V5_val,
																	_B23} =
																	   protocol:uint32(_B22),
																       {{V5_key,
																	 V5_val},
																	_B23}
																 end),
													      {V4_be_hurt,
													       _B26} =
														  protocol:uint32(_B25),
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
													       _B26}
													end),
										     {{V3_type,
										       V3_partner_hurts},
										      _B28}
									       end),
							    {V2_replay_id,
							     _B31} =
								protocol:uint32(_B30),
							    {V2_a_name, _B32} =
								protocol:string(_B31),
							    {V2_b_name, _B33} =
								protocol:string(_B32),
							    {V2_ret, _B34} =
								protocol:uint8(_B33),
							    {{V2_type,
							      V2_a_round,
							      V2_b_round,
							      V2_hurt_statistics,
							      V2_replay_id,
							      V2_a_name,
							      V2_b_name,
							      V2_ret},
							     _B34}
						    end),
    {V1_reward, _B41} = protocol:array(_B36,
				       fun (_B37) ->
					       {V2_base_id, _B38} =
						   protocol:uint32(_B37),
					       {V2_num, _B39} =
						   protocol:uint32(_B38),
					       {{V2_base_id, V2_num}, _B39}
				       end),
    {ok,
     {V1_result, V1_add_score, V1_win_count, V1_lose_count,
      V1_all_hurt_statistics, V1_reward}};
unpack(29312, srv, _B0) -> {ok, {}};
unpack(29312, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_sid, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_face_id, _B4} = protocol:uint32(_B3),
    {V1_power, _B5} = protocol:uint32(_B4),
    {V1_avatar_bid, _B6} = protocol:uint32(_B5),
    {V1_lev, _B7} = protocol:uint32(_B6),
    {V1_pos, _B8} = protocol:uint16(_B7),
    {V1_is_leader, _B9} = protocol:uint8(_B8),
    {V1_rank, _B10} = protocol:uint32(_B9),
    {V1_score, _B11} = protocol:uint32(_B10),
    {V1_face_update_time, _B12} = protocol:uint32(_B11),
    {V1_face_file, _B13} = protocol:string(_B12),
    {V1_formation_type, _B14} = protocol:uint32(_B13),
    {V1_hallows_id, _B15} = protocol:uint32(_B14),
    {V1_hallows_look_id, _B16} = protocol:uint32(_B15),
    {V1_sprite_lev, _B17} = protocol:uint32(_B16),
    {V1_sprites, _B22} = protocol:array(_B17,
					fun (_B18) ->
						{V2_pos, _B19} =
						    protocol:uint8(_B18),
						{V2_item_bid, _B20} =
						    protocol:uint32(_B19),
						{{V2_pos, V2_item_bid}, _B20}
					end),
    {V1_partner_infos, _B31} = protocol:array(_B22,
					      fun (_B23) ->
						      {V2_pos, _B24} =
							  protocol:uint8(_B23),
						      {V2_bid, _B25} =
							  protocol:uint32(_B24),
						      {V2_lev, _B26} =
							  protocol:uint16(_B25),
						      {V2_star, _B27} =
							  protocol:uint8(_B26),
						      {V2_use_skin, _B28} =
							  protocol:uint32(_B27),
						      {V2_resonate_lev, _B29} =
							  protocol:uint32(_B28),
						      {{V2_pos, V2_bid, V2_lev,
							V2_star, V2_use_skin,
							V2_resonate_lev},
						       _B29}
					      end),
    {ok,
     {V1_rid, V1_sid, V1_name, V1_face_id, V1_power,
      V1_avatar_bid, V1_lev, V1_pos, V1_is_leader, V1_rank,
      V1_score, V1_face_update_time, V1_face_file,
      V1_formation_type, V1_hallows_id, V1_hallows_look_id,
      V1_sprite_lev, V1_sprites, V1_partner_infos}};
unpack(29313, srv, _B0) ->
    {V1_pos_info, _B6} = protocol:array(_B0,
					fun (_B1) ->
						{V2_rid, _B2} =
						    protocol:uint32(_B1),
						{V2_sid, _B3} =
						    protocol:string(_B2),
						{V2_pos, _B4} =
						    protocol:uint16(_B3),
						{{V2_rid, V2_sid, V2_pos}, _B4}
					end),
    {ok, {V1_pos_info}};
unpack(29313, cli, _B0) -> {ok, {}};
unpack(29314, srv, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_start_num, _B2} = protocol:uint32(_B1),
    {V1_end_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_camp_id, V1_start_num, V1_end_num}};
unpack(29314, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_my_rank, _B3} = protocol:uint32(_B2),
    {V1_my_score, _B4} = protocol:uint32(_B3),
    {V1_my_camp_id, _B5} = protocol:uint32(_B4),
    {V1_rank_per, _B6} = protocol:uint32(_B5),
    {V1_camp_id, _B7} = protocol:uint32(_B6),
    {V1_team_members, _B21} = protocol:array(_B7,
					     fun (_B8) ->
						     {V2_rid, _B9} =
							 protocol:uint32(_B8),
						     {V2_sid, _B10} =
							 protocol:string(_B9),
						     {V2_name, _B11} =
							 protocol:string(_B10),
						     {V2_face_id, _B12} =
							 protocol:uint32(_B11),
						     {V2_power, _B13} =
							 protocol:uint32(_B12),
						     {V2_avatar_bid, _B14} =
							 protocol:uint32(_B13),
						     {V2_lev, _B15} =
							 protocol:uint32(_B14),
						     {V2_rank, _B16} =
							 protocol:uint32(_B15),
						     {V2_score, _B17} =
							 protocol:uint32(_B16),
						     {V2_face_update_time,
						      _B18} =
							 protocol:uint32(_B17),
						     {V2_face_file, _B19} =
							 protocol:string(_B18),
						     {{V2_rid, V2_sid, V2_name,
						       V2_face_id, V2_power,
						       V2_avatar_bid, V2_lev,
						       V2_rank, V2_score,
						       V2_face_update_time,
						       V2_face_file},
						      _B19}
					     end),
    {ok,
     {V1_code, V1_msg, V1_my_rank, V1_my_score,
      V1_my_camp_id, V1_rank_per, V1_camp_id,
      V1_team_members}};
unpack(29315, srv, _B0) -> {ok, {}};
unpack(29315, cli, _B0) ->
    {V1_holiday_camp_war_log, _B41} = protocol:array(_B0,
						     fun (_B1) ->
							     {V2_id, _B2} =
								 protocol:uint32(_B1),
							     {V2_is_atk, _B3} =
								 protocol:uint8(_B2),
							     {V2_rid, _B4} =
								 protocol:uint32(_B3),
							     {V2_srv_id, _B5} =
								 protocol:string(_B4),
							     {V2_atk_name,
							      _B6} =
								 protocol:string(_B5),
							     {V2_atk_face,
							      _B18} =
								 protocol:array(_B6,
										fun
										  (_B7) ->
										      {V3_pos,
										       _B8} =
											  protocol:uint8(_B7),
										      {V3_rid,
										       _B9} =
											  protocol:uint32(_B8),
										      {V3_srv_id,
										       _B10} =
											  protocol:string(_B9),
										      {V3_face_id,
										       _B11} =
											  protocol:uint32(_B10),
										      {V3_avatar_bid,
										       _B12} =
											  protocol:uint32(_B11),
										      {V3_is_leader,
										       _B13} =
											  protocol:uint32(_B12),
										      {V3_lev,
										       _B14} =
											  protocol:uint16(_B13),
										      {V3_face_update_time,
										       _B15} =
											  protocol:uint32(_B14),
										      {V3_face_file,
										       _B16} =
											  protocol:string(_B15),
										      {{V3_pos,
											V3_rid,
											V3_srv_id,
											V3_face_id,
											V3_avatar_bid,
											V3_is_leader,
											V3_lev,
											V3_face_update_time,
											V3_face_file},
										       _B16}
										end),
							     {V2_def_rid,
							      _B19} =
								 protocol:uint32(_B18),
							     {V2_def_srv_id,
							      _B20} =
								 protocol:string(_B19),
							     {V2_def_name,
							      _B21} =
								 protocol:string(_B20),
							     {V2_def_face,
							      _B33} =
								 protocol:array(_B21,
										fun
										  (_B22) ->
										      {V3_pos,
										       _B23} =
											  protocol:uint8(_B22),
										      {V3_rid,
										       _B24} =
											  protocol:uint32(_B23),
										      {V3_srv_id,
										       _B25} =
											  protocol:string(_B24),
										      {V3_face_id,
										       _B26} =
											  protocol:uint32(_B25),
										      {V3_avatar_bid,
										       _B27} =
											  protocol:uint32(_B26),
										      {V3_is_leader,
										       _B28} =
											  protocol:uint32(_B27),
										      {V3_lev,
										       _B29} =
											  protocol:uint16(_B28),
										      {V3_face_update_time,
										       _B30} =
											  protocol:uint32(_B29),
										      {V3_face_file,
										       _B31} =
											  protocol:string(_B30),
										      {{V3_pos,
											V3_rid,
											V3_srv_id,
											V3_face_id,
											V3_avatar_bid,
											V3_is_leader,
											V3_lev,
											V3_face_update_time,
											V3_face_file},
										       _B31}
										end),
							     {V2_ret, _B34} =
								 protocol:uint8(_B33),
							     {V2_win_count,
							      _B35} =
								 protocol:uint8(_B34),
							     {V2_lose_count,
							      _B36} =
								 protocol:uint8(_B35),
							     {V2_time, _B37} =
								 protocol:uint32(_B36),
							     {V2_atk_power,
							      _B38} =
								 protocol:uint32(_B37),
							     {V2_def_power,
							      _B39} =
								 protocol:uint32(_B38),
							     {{V2_id, V2_is_atk,
							       V2_rid,
							       V2_srv_id,
							       V2_atk_name,
							       V2_atk_face,
							       V2_def_rid,
							       V2_def_srv_id,
							       V2_def_name,
							       V2_def_face,
							       V2_ret,
							       V2_win_count,
							       V2_lose_count,
							       V2_time,
							       V2_atk_power,
							       V2_def_power},
							      _B39}
						     end),
    {ok, {V1_holiday_camp_war_log}};
unpack(29316, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(29316, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_replay_infos, _B63} = protocol:array(_B1,
					     fun (_B2) ->
						     {V2_order, _B3} =
							 protocol:uint8(_B2),
						     {V2_id, _B4} =
							 protocol:uint32(_B3),
						     {V2_round, _B5} =
							 protocol:uint8(_B4),
						     {V2_ret, _B6} =
							 protocol:uint8(_B5),
						     {V2_time, _B7} =
							 protocol:uint32(_B6),
						     {V2_rid, _B8} =
							 protocol:uint32(_B7),
						     {V2_srv_id, _B9} =
							 protocol:string(_B8),
						     {V2_a_power, _B10} =
							 protocol:uint32(_B9),
						     {V2_a_formation_type,
						      _B11} =
							 protocol:uint32(_B10),
						     {V2_a_order, _B12} =
							 protocol:uint8(_B11),
						     {V2_a_end_hp, _B13} =
							 protocol:uint8(_B12),
						     {V2_a_sprite_lev, _B14} =
							 protocol:uint16(_B13),
						     {V2_a_sprites, _B19} =
							 protocol:array(_B14,
									fun
									  (_B15) ->
									      {V3_pos,
									       _B16} =
										  protocol:uint8(_B15),
									      {V3_item_bid,
									       _B17} =
										  protocol:uint32(_B16),
									      {{V3_pos,
										V3_item_bid},
									       _B17}
									end),
						     {V2_b_rid, _B20} =
							 protocol:uint32(_B19),
						     {V2_b_srv_id, _B21} =
							 protocol:string(_B20),
						     {V2_b_power, _B22} =
							 protocol:uint32(_B21),
						     {V2_b_formation_type,
						      _B23} =
							 protocol:uint32(_B22),
						     {V2_b_order, _B24} =
							 protocol:uint8(_B23),
						     {V2_b_end_hp, _B25} =
							 protocol:uint8(_B24),
						     {V2_b_sprite_lev, _B26} =
							 protocol:uint16(_B25),
						     {V2_b_sprites, _B31} =
							 protocol:array(_B26,
									fun
									  (_B27) ->
									      {V3_pos,
									       _B28} =
										  protocol:uint8(_B27),
									      {V3_item_bid,
									       _B29} =
										  protocol:uint32(_B28),
									      {{V3_pos,
										V3_item_bid},
									       _B29}
									end),
						     {V2_a_plist, _B45} =
							 protocol:array(_B31,
									fun
									  (_B32) ->
									      {V3_pos,
									       _B33} =
										  protocol:uint8(_B32),
									      {V3_id,
									       _B34} =
										  protocol:uint32(_B33),
									      {V3_bid,
									       _B35} =
										  protocol:uint32(_B34),
									      {V3_lev,
									       _B36} =
										  protocol:uint16(_B35),
									      {V3_star,
									       _B37} =
										  protocol:uint8(_B36),
									      {V3_power,
									       _B38} =
										  protocol:uint32(_B37),
									      {V3_skin_id,
									       _B39} =
										  protocol:uint32(_B38),
									      {V3_resonate_lev,
									       _B40} =
										  protocol:uint32(_B39),
									      {V3_hurt,
									       _B41} =
										  protocol:uint32(_B40),
									      {V3_curt,
									       _B42} =
										  protocol:uint32(_B41),
									      {V3_be_hurt,
									       _B43} =
										  protocol:uint32(_B42),
									      {{V3_pos,
										V3_id,
										V3_bid,
										V3_lev,
										V3_star,
										V3_power,
										V3_skin_id,
										V3_resonate_lev,
										V3_hurt,
										V3_curt,
										V3_be_hurt},
									       _B43}
									end),
						     {V2_b_plist, _B59} =
							 protocol:array(_B45,
									fun
									  (_B46) ->
									      {V3_pos,
									       _B47} =
										  protocol:uint8(_B46),
									      {V3_id,
									       _B48} =
										  protocol:uint32(_B47),
									      {V3_bid,
									       _B49} =
										  protocol:uint32(_B48),
									      {V3_lev,
									       _B50} =
										  protocol:uint16(_B49),
									      {V3_star,
									       _B51} =
										  protocol:uint8(_B50),
									      {V3_power,
									       _B52} =
										  protocol:uint32(_B51),
									      {V3_skin_id,
									       _B53} =
										  protocol:uint32(_B52),
									      {V3_resonate_lev,
									       _B54} =
										  protocol:uint32(_B53),
									      {V3_hurt,
									       _B55} =
										  protocol:uint32(_B54),
									      {V3_curt,
									       _B56} =
										  protocol:uint32(_B55),
									      {V3_be_hurt,
									       _B57} =
										  protocol:uint32(_B56),
									      {{V3_pos,
										V3_id,
										V3_bid,
										V3_lev,
										V3_star,
										V3_power,
										V3_skin_id,
										V3_resonate_lev,
										V3_hurt,
										V3_curt,
										V3_be_hurt},
									       _B57}
									end),
						     {V2_a_name, _B60} =
							 protocol:string(_B59),
						     {V2_b_name, _B61} =
							 protocol:string(_B60),
						     {{V2_order, V2_id,
						       V2_round, V2_ret,
						       V2_time, V2_rid,
						       V2_srv_id, V2_a_power,
						       V2_a_formation_type,
						       V2_a_order, V2_a_end_hp,
						       V2_a_sprite_lev,
						       V2_a_sprites, V2_b_rid,
						       V2_b_srv_id, V2_b_power,
						       V2_b_formation_type,
						       V2_b_order, V2_b_end_hp,
						       V2_b_sprite_lev,
						       V2_b_sprites, V2_a_plist,
						       V2_b_plist, V2_a_name,
						       V2_b_name},
						      _B61}
					     end),
    {ok, {V1_id, V1_replay_infos}};
unpack(29317, srv, _B0) -> {ok, {}};
unpack(29317, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint16(_B2),
    {V1_buy_count, _B4} = protocol:uint16(_B3),
    {ok, {V1_code, V1_msg, V1_count, V1_buy_count}};
unpack(29318, srv, _B0) -> {ok, {}};
unpack(29318, cli, _B0) -> {ok, {}};
unpack(29319, srv, _B0) -> {ok, {}};
unpack(29319, cli, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_camp_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


