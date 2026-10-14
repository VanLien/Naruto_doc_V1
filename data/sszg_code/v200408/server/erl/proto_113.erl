-file("src/proto/proto_113.erl", 1).

-module(proto_113).

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
		{item_make_args, [base_id, bind, quantity, step, flag]},
		{item,
		 [ver, id, base_id, bind, look_id, type, quality, craft,
		  step, quantity, pos, expire_type, expire_time, enchant,
		  fail_enchant, attr, main_attr, extra_attr, score,
		  all_score, extra, data, price, set_id, career,
		  gemstones, star_lev, break_count, holy_eqm_attr]},
		{item_base,
		 [id, name, type, quality, overlap, use_type, gain_type,
		  expire_type, expire_time, condition, effect, attr,
		  value, lev, career, sex, ext, attr_type, eqm_jie,
		  add_num, can_share, eqm_set, use_count]},
		{m_star, [ver, star_list, fetter_list, all_attr]},
		{star_tower_replay, [tower, replays]},
		{tower_replay_data,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{m_star_divination,
		 [ver, luck, quality, all_count, flag, ref_count,
		  day_gold_count, day_hun_count]},
		{m_star_tower, [ver, max_tower, award_list]},
		{star,
		 [ver, set_id, break_lev, lev, natals, add_attr,
		  fetter_attr, set_skill_id, power]},
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

-file("src/proto/proto_113.erl", 16).

-file("inc/star.hrl", 1).

-record(star,
	{ver = 1  :: non_neg_integer(),
	 set_id = 0  :: non_neg_integer(),
	 break_lev = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), natals = []  :: list(),
	 add_attr = []  :: list(), fetter_attr = []  :: list(),
	 set_skill_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(m_star_tower,
	{ver = 1  :: non_neg_integer(),
	 max_tower = 0  :: non_neg_integer(),
	 award_list = []  :: list()}).

-record(m_star_divination,
	{ver = 1  :: non_neg_integer(),
	 luck = 1  :: non_neg_integer(),
	 quality = 1  :: non_neg_integer(),
	 all_count = 0  :: non_neg_integer(),
	 flag = 0  :: non_neg_integer(),
	 ref_count = 0  :: non_neg_integer(),
	 day_gold_count = 0  :: non_neg_integer(),
	 day_hun_count = 0  :: non_neg_integer()}).

-record(tower_replay_data,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(star_tower_replay,
	{tower = 0  :: non_neg_integer(),
	 replays = []  :: [#tower_replay_data{}]}).

-record(m_star,
	{ver = 1  :: non_neg_integer(),
	 star_list = []  :: [#star{}],
	 fetter_list = []  :: list(), all_attr = []  :: list()}).

-file("src/proto/proto_113.erl", 17).

-file("inc/item.hrl", 1).

-record(item_base,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 type = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 overlap = 1  :: pos_integer(), use_type = 0  :: 0..4,
	 gain_type = 0  :: non_neg_integer(),
	 expire_type = 0  :: non_neg_integer(),
	 expire_time = 0  ::
	     non_neg_integer() |
	     {{pos_integer(), pos_integer(), pos_integer()},
	      {non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}},
	 condition = []  :: [tuple()], effect = []  :: [tuple()],
	 attr = []  :: [tuple()], value = []  :: [tuple()],
	 lev = 0, career = 0, sex = 2, ext = [],
	 attr_type = 1  :: pos_integer(), eqm_jie = 0,
	 add_num = 0, can_share = 0, eqm_set = 0,
	 use_count = 0}).

-record(item,
	{ver = 3  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(), bind = 1  :: 0 | 1,
	 look_id = 0, type = 0  :: non_neg_integer(),
	 quality = 0  :: 0..4, craft = 0  :: 0..5,
	 step = 0  :: pos_integer(), quantity = 1  :: 0..250,
	 pos = 0  :: non_neg_integer(), expire_type = 0  :: 0..4,
	 expire_time = 0  :: non_neg_integer(),
	 enchant = 0  :: integer(),
	 fail_enchant = 0  :: non_neg_integer(),
	 attr = []  :: [tuple()], main_attr = [],
	 extra_attr = [], score = 0, all_score = 0,
	 extra = []  :: [tuple()], data = []  :: [any()],
	 price = 0, set_id = 0  :: pos_integer(),
	 career = 0  :: pos_integer(), gemstones = []  :: list(),
	 star_lev = 0  :: pos_integer(),
	 break_count = 0  :: pos_integer(), holy_eqm_attr = []}).

-record(item_make_args,
	{base_id = 0, bind = 0, quantity = 0, step = 0,
	 flag = default_iflag}).

-file("src/proto/proto_113.erl", 18).

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

-file("src/proto/proto_113.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(11300, cli, {}) -> {ok, <<2:32, 11300:16>>};
pack(11300, srv, {V0_star, V0_fetters}) ->
    D_a_t_a = <<(length(V0_star)):16,
		(list_to_binary([<<V1_set_id:32,
				   (length(V1_add_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_add_attr]))/binary,
				   V1_set_skill_id:32, V1_power:32,
				   (length(V1_natals)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32, V2_enchant:32,
						      V2_break_count:32,
						      V2_star_lev:32,
						      V2_score:32,
						      V2_all_score:32>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     type = V2_type,
							     enchant =
								 V2_enchant,
							     break_count =
								 V2_break_count,
							     star_lev =
								 V2_star_lev,
							     score = V2_score,
							     all_score =
								 V2_all_score}
							   <- V1_natals]))/binary>>
				 || #star{set_id = V1_set_id,
					  add_attr = V1_add_attr,
					  set_skill_id = V1_set_skill_id,
					  power = V1_power, natals = V1_natals}
					<- V0_star]))/binary,
		(length(V0_fetters)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetters]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11300:16,
       D_a_t_a/binary>>};
pack(11301, cli, {}) -> {ok, <<2:32, 11301:16>>};
pack(11301, srv,
     {#star{set_id = V0_set_id, add_attr = V0_add_attr,
	    set_skill_id = V0_set_skill_id, power = V0_power,
	    natals = V0_natals}}) ->
    D_a_t_a = <<V0_set_id:32, (length(V0_add_attr)):16,
		(list_to_binary([<<V1_attr_id:32, V1_attr_val:32>>
				 || {V1_attr_id, V1_attr_val}
					<- V0_add_attr]))/binary,
		V0_set_skill_id:32, V0_power:32, (length(V0_natals)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_type:32,
				   V1_enchant:32, V1_break_count:32,
				   V1_star_lev:32, V1_score:32,
				   V1_all_score:32>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  type = V1_type, enchant = V1_enchant,
					  break_count = V1_break_count,
					  star_lev = V1_star_lev,
					  score = V1_score,
					  all_score = V1_all_score}
					<- V0_natals]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11301:16,
       D_a_t_a/binary>>};
pack(11302, cli,
     {V0_set_id, V0_pos_id, V0_partner_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_pos_id:32,
		V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11302:16,
       D_a_t_a/binary>>};
pack(11302, srv,
     {V0_result, V0_msg, V0_old_set_id, V0_fetter}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_old_set_id:32, (length(V0_fetter)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetter]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11302:16,
       D_a_t_a/binary>>};
pack(11303, cli,
     {V0_set_id, V0_pos_id, V0_partner_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_pos_id:32,
		V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11303:16,
       D_a_t_a/binary>>};
pack(11303, srv,
     {V0_result, V0_msg, V0_old_set_id, V0_fetter}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_old_set_id:32, (length(V0_fetter)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetter]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11303:16,
       D_a_t_a/binary>>};
pack(11304, cli, {V0_set_id, V0_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11304:16,
       D_a_t_a/binary>>};
pack(11304, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11304:16,
       D_a_t_a/binary>>};
pack(11305, cli, {V0_set_id, V0_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11305:16,
       D_a_t_a/binary>>};
pack(11305, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11305:16,
       D_a_t_a/binary>>};
pack(11306, cli, {V0_id, V0_set_id}) ->
    D_a_t_a = <<V0_id:32, V0_set_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11306:16,
       D_a_t_a/binary>>};
pack(11306, srv, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11306:16,
       D_a_t_a/binary>>};
pack(11307, cli, {V0_set_id}) ->
    D_a_t_a = <<V0_set_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11307:16,
       D_a_t_a/binary>>};
pack(11307, srv, {V0_result, V0_msg, V0_fetter}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_fetter)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetter]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11307:16,
       D_a_t_a/binary>>};
pack(11308, cli, {}) -> {ok, <<2:32, 11308:16>>};
pack(11308, srv, {V0_star, V0_fetters}) ->
    D_a_t_a = <<(length(V0_star)):16,
		(list_to_binary([<<V1_set_id:32,
				   (length(V1_add_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_add_attr]))/binary,
				   V1_set_skill_id:32, V1_power:32,
				   (length(V1_natals)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32, V2_enchant:32,
						      V2_break_count:32,
						      V2_star_lev:32,
						      V2_score:32,
						      V2_all_score:32>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     type = V2_type,
							     enchant =
								 V2_enchant,
							     break_count =
								 V2_break_count,
							     star_lev =
								 V2_star_lev,
							     score = V2_score,
							     all_score =
								 V2_all_score}
							   <- V1_natals]))/binary>>
				 || #star{set_id = V1_set_id,
					  add_attr = V1_add_attr,
					  set_skill_id = V1_set_skill_id,
					  power = V1_power, natals = V1_natals}
					<- V0_star]))/binary,
		(length(V0_fetters)):16,
		(list_to_binary([<<V1_set_id:32, V1_pos_id:32,
				   V1_partner_id:32>>
				 || {V1_set_id, V1_pos_id, V1_partner_id}
					<- V0_fetters]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11308:16,
       D_a_t_a/binary>>};
pack(11310, cli, {V0_set_id, V0_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11310:16,
       D_a_t_a/binary>>};
pack(11310, srv,
     {V0_result, V0_msg, V0_set_id, V0_id, V0_lev}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_set_id:32,
		V0_id:32, V0_lev:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11310:16,
       D_a_t_a/binary>>};
pack(11311, cli, {V0_set_id, V0_id}) ->
    D_a_t_a = <<V0_set_id:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11311:16,
       D_a_t_a/binary>>};
pack(11311, srv,
     {V0_result, V0_msg, V0_set_id, V0_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_set_id:32,
		V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11311:16,
       D_a_t_a/binary>>};
pack(11320, cli, {}) -> {ok, <<2:32, 11320:16>>};
pack(11320, srv,
     {V0_result, V0_msg, V0_max_tower, V0_count,
      V0_buy_count, V0_award_list}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_max_tower:32,
		V0_count:32, V0_buy_count:32,
		(length(V0_award_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:8>>
				 || {V1_id, V1_status}
					<- V0_award_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11320:16,
       D_a_t_a/binary>>};
pack(11321, cli, {}) -> {ok, <<2:32, 11321:16>>};
pack(11321, srv,
     {V0_result, V0_msg, V0_count, V0_buy_count}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32,
		V0_buy_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11321:16,
       D_a_t_a/binary>>};
pack(11322, cli, {V0_tower}) ->
    D_a_t_a = <<V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11322:16,
       D_a_t_a/binary>>};
pack(11322, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11322:16,
       D_a_t_a/binary>>};
pack(11323, cli, {}) -> {ok, <<2:32, 11323:16>>};
pack(11323, srv,
     {V0_result, V0_max_tower, V0_tower, V0_timer, V0_count,
      V0_first_award, V0_award, V0_target_role_name,
      V0_hurt_statistics, V0_replay_id, V0_is_skip}) ->
    D_a_t_a = <<V0_result:8, V0_max_tower:32, V0_tower:32,
		V0_timer:32, V0_count:32, (length(V0_first_award)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num}
					<- V0_first_award]))/binary,
		(length(V0_award)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num} <- V0_award]))/binary,
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
		V0_replay_id:32, V0_is_skip:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11323:16,
       D_a_t_a/binary>>};
pack(11324, cli, {V0_tower}) ->
    D_a_t_a = <<V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11324:16,
       D_a_t_a/binary>>};
pack(11324, srv,
     {V0_result, V0_msg, V0_count, V0_buy_count}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32,
		V0_buy_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11324:16,
       D_a_t_a/binary>>};
pack(11325, cli, {V0_tower}) ->
    D_a_t_a = <<V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11325:16,
       D_a_t_a/binary>>};
pack(11325, srv,
     {V0_tower_replay_data, V0_m_replay_id, V0_my_time}) ->
    D_a_t_a = <<(length(V0_tower_replay_data)):16,
		(list_to_binary([<<V1_type:8, V1_rid:32,
				   (protocol:pack(string, V1_sid))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_power:32, V1_time:32,
				   V1_replay_id:32, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #tower_replay_data{type = V1_type,
						       rid = V1_rid,
						       sid = V1_sid,
						       name = V1_name,
						       face_id = V1_face_id,
						       power = V1_power,
						       time = V1_time,
						       repaly_id = V1_replay_id,
						       face_update_time =
							   V1_face_update_time,
						       face_file = V1_face_file}
					<- V0_tower_replay_data]))/binary,
		V0_m_replay_id:32, V0_my_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11325:16,
       D_a_t_a/binary>>};
pack(11326, cli, {}) -> {ok, <<2:32, 11326:16>>};
pack(11326, srv, {V0_tower}) ->
    D_a_t_a = <<V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11326:16,
       D_a_t_a/binary>>};
pack(11327, cli, {}) -> {ok, <<2:32, 11327:16>>};
pack(11327, srv, {V0_rank_lists}) ->
    D_a_t_a = <<(length(V0_rank_lists)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_rank:32, V1_tower:32>>
				 || {V1_rid, V1_srv_id, V1_name, V1_rank,
				     V1_tower}
					<- V0_rank_lists]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11327:16,
       D_a_t_a/binary>>};
pack(11328, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11328:16,
       D_a_t_a/binary>>};
pack(11328, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11328:16,
       D_a_t_a/binary>>};
pack(11329, cli, {}) -> {ok, <<2:32, 11329:16>>};
pack(11329, srv, {V0_award_list}) ->
    D_a_t_a = <<(length(V0_award_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:8>>
				 || {V1_id, V1_status}
					<- V0_award_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11329:16,
       D_a_t_a/binary>>};
pack(11330, cli, {}) -> {ok, <<2:32, 11330:16>>};
pack(11330, srv,
     {V0_quality, V0_luck, V0_end_count, V0_ref_count,
      V0_day_gold_count, V0_flag}) ->
    D_a_t_a = <<V0_quality:32, V0_luck:32, V0_end_count:32,
		V0_ref_count:32, V0_day_gold_count:32, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11330:16,
       D_a_t_a/binary>>};
pack(11331, cli, {V0_type, V0_count}) ->
    D_a_t_a = <<V0_type:8, V0_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11331:16,
       D_a_t_a/binary>>};
pack(11331, srv,
     {V0_result, V0_msg, V0_end_count, V0_quality,
      V0_day_gold_count, V0_flag, V0_award, V0_award2}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_end_count:32,
		V0_quality:32, V0_day_gold_count:32, V0_flag:8,
		(length(V0_award)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num} <- V0_award]))/binary,
		(length(V0_award2)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num}
					<- V0_award2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11331:16,
       D_a_t_a/binary>>};
pack(11332, cli, {}) -> {ok, <<2:32, 11332:16>>};
pack(11332, srv,
     {V0_result, V0_msg, V0_luck, V0_ref_count}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_luck:32,
		V0_ref_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11332:16,
       D_a_t_a/binary>>};
pack(11333, cli,
     {V0_replay_id, V0_channel, V0_tower}) ->
    D_a_t_a = <<V0_replay_id:32, V0_channel:16,
		V0_tower:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11333:16,
       D_a_t_a/binary>>};
pack(11333, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11333:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(11300, srv, _B0) -> {ok, {}};
unpack(11300, cli, _B0) ->
    {V1_star, _B22} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_set_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_add_attr, _B7} =
						 protocol:array(_B2,
								fun (_B3) ->
									{V3_attr_id,
									 _B4} =
									    protocol:uint32(_B3),
									{V3_attr_val,
									 _B5} =
									    protocol:uint32(_B4),
									{{V3_attr_id,
									  V3_attr_val},
									 _B5}
								end),
					     {V2_set_skill_id, _B8} =
						 protocol:uint32(_B7),
					     {V2_power, _B9} =
						 protocol:uint32(_B8),
					     {V2_natals, _B20} =
						 protocol:array(_B9,
								fun (_B10) ->
									{V3_id,
									 _B11} =
									    protocol:uint32(_B10),
									{V3_base_id,
									 _B12} =
									    protocol:uint32(_B11),
									{V3_type,
									 _B13} =
									    protocol:uint32(_B12),
									{V3_enchant,
									 _B14} =
									    protocol:uint32(_B13),
									{V3_break_count,
									 _B15} =
									    protocol:uint32(_B14),
									{V3_star_lev,
									 _B16} =
									    protocol:uint32(_B15),
									{V3_score,
									 _B17} =
									    protocol:uint32(_B16),
									{V3_all_score,
									 _B18} =
									    protocol:uint32(_B17),
									{{V3_id,
									  V3_base_id,
									  V3_type,
									  V3_enchant,
									  V3_break_count,
									  V3_star_lev,
									  V3_score,
									  V3_all_score},
									 _B18}
								end),
					     {{V2_set_id, V2_add_attr,
					       V2_set_skill_id, V2_power,
					       V2_natals},
					      _B20}
				     end),
    {V1_fetters, _B28} = protocol:array(_B22,
					fun (_B23) ->
						{V2_set_id, _B24} =
						    protocol:uint32(_B23),
						{V2_pos_id, _B25} =
						    protocol:uint32(_B24),
						{V2_partner_id, _B26} =
						    protocol:uint32(_B25),
						{{V2_set_id, V2_pos_id,
						  V2_partner_id},
						 _B26}
					end),
    {ok, {V1_star, V1_fetters}};
unpack(11301, srv, _B0) -> {ok, {}};
unpack(11301, cli, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_add_attr, _B6} = protocol:array(_B1,
					fun (_B2) ->
						{V2_attr_id, _B3} =
						    protocol:uint32(_B2),
						{V2_attr_val, _B4} =
						    protocol:uint32(_B3),
						{{V2_attr_id, V2_attr_val}, _B4}
					end),
    {V1_set_skill_id, _B7} = protocol:uint32(_B6),
    {V1_power, _B8} = protocol:uint32(_B7),
    {V1_natals, _B19} = protocol:array(_B8,
				       fun (_B9) ->
					       {V2_id, _B10} =
						   protocol:uint32(_B9),
					       {V2_base_id, _B11} =
						   protocol:uint32(_B10),
					       {V2_type, _B12} =
						   protocol:uint32(_B11),
					       {V2_enchant, _B13} =
						   protocol:uint32(_B12),
					       {V2_break_count, _B14} =
						   protocol:uint32(_B13),
					       {V2_star_lev, _B15} =
						   protocol:uint32(_B14),
					       {V2_score, _B16} =
						   protocol:uint32(_B15),
					       {V2_all_score, _B17} =
						   protocol:uint32(_B16),
					       {{V2_id, V2_base_id, V2_type,
						 V2_enchant, V2_break_count,
						 V2_star_lev, V2_score,
						 V2_all_score},
						_B17}
				       end),
    {ok,
     {V1_set_id, V1_add_attr, V1_set_skill_id, V1_power,
      V1_natals}};
unpack(11302, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_pos_id, _B2} = protocol:uint32(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_set_id, V1_pos_id, V1_partner_id}};
unpack(11302, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_old_set_id, _B3} = protocol:uint32(_B2),
    {V1_fetter, _B9} = protocol:array(_B3,
				      fun (_B4) ->
					      {V2_set_id, _B5} =
						  protocol:uint32(_B4),
					      {V2_pos_id, _B6} =
						  protocol:uint32(_B5),
					      {V2_partner_id, _B7} =
						  protocol:uint32(_B6),
					      {{V2_set_id, V2_pos_id,
						V2_partner_id},
					       _B7}
				      end),
    {ok, {V1_result, V1_msg, V1_old_set_id, V1_fetter}};
unpack(11303, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_pos_id, _B2} = protocol:uint32(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_set_id, V1_pos_id, V1_partner_id}};
unpack(11303, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_old_set_id, _B3} = protocol:uint32(_B2),
    {V1_fetter, _B9} = protocol:array(_B3,
				      fun (_B4) ->
					      {V2_set_id, _B5} =
						  protocol:uint32(_B4),
					      {V2_pos_id, _B6} =
						  protocol:uint32(_B5),
					      {V2_partner_id, _B7} =
						  protocol:uint32(_B6),
					      {{V2_set_id, V2_pos_id,
						V2_partner_id},
					       _B7}
				      end),
    {ok, {V1_result, V1_msg, V1_old_set_id, V1_fetter}};
unpack(11304, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_set_id, V1_id}};
unpack(11304, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11305, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_set_id, V1_id}};
unpack(11305, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11306, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_set_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_set_id}};
unpack(11306, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(11307, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_set_id}};
unpack(11307, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_fetter, _B8} = protocol:array(_B2,
				      fun (_B3) ->
					      {V2_set_id, _B4} =
						  protocol:uint32(_B3),
					      {V2_pos_id, _B5} =
						  protocol:uint32(_B4),
					      {V2_partner_id, _B6} =
						  protocol:uint32(_B5),
					      {{V2_set_id, V2_pos_id,
						V2_partner_id},
					       _B6}
				      end),
    {ok, {V1_result, V1_msg, V1_fetter}};
unpack(11308, srv, _B0) -> {ok, {}};
unpack(11308, cli, _B0) ->
    {V1_star, _B22} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_set_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_add_attr, _B7} =
						 protocol:array(_B2,
								fun (_B3) ->
									{V3_attr_id,
									 _B4} =
									    protocol:uint32(_B3),
									{V3_attr_val,
									 _B5} =
									    protocol:uint32(_B4),
									{{V3_attr_id,
									  V3_attr_val},
									 _B5}
								end),
					     {V2_set_skill_id, _B8} =
						 protocol:uint32(_B7),
					     {V2_power, _B9} =
						 protocol:uint32(_B8),
					     {V2_natals, _B20} =
						 protocol:array(_B9,
								fun (_B10) ->
									{V3_id,
									 _B11} =
									    protocol:uint32(_B10),
									{V3_base_id,
									 _B12} =
									    protocol:uint32(_B11),
									{V3_type,
									 _B13} =
									    protocol:uint32(_B12),
									{V3_enchant,
									 _B14} =
									    protocol:uint32(_B13),
									{V3_break_count,
									 _B15} =
									    protocol:uint32(_B14),
									{V3_star_lev,
									 _B16} =
									    protocol:uint32(_B15),
									{V3_score,
									 _B17} =
									    protocol:uint32(_B16),
									{V3_all_score,
									 _B18} =
									    protocol:uint32(_B17),
									{{V3_id,
									  V3_base_id,
									  V3_type,
									  V3_enchant,
									  V3_break_count,
									  V3_star_lev,
									  V3_score,
									  V3_all_score},
									 _B18}
								end),
					     {{V2_set_id, V2_add_attr,
					       V2_set_skill_id, V2_power,
					       V2_natals},
					      _B20}
				     end),
    {V1_fetters, _B28} = protocol:array(_B22,
					fun (_B23) ->
						{V2_set_id, _B24} =
						    protocol:uint32(_B23),
						{V2_pos_id, _B25} =
						    protocol:uint32(_B24),
						{V2_partner_id, _B26} =
						    protocol:uint32(_B25),
						{{V2_set_id, V2_pos_id,
						  V2_partner_id},
						 _B26}
					end),
    {ok, {V1_star, V1_fetters}};
unpack(11310, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_set_id, V1_id}};
unpack(11310, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_set_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {V1_lev, _B5} = protocol:uint32(_B4),
    {ok, {V1_result, V1_msg, V1_set_id, V1_id, V1_lev}};
unpack(11311, srv, _B0) ->
    {V1_set_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_set_id, V1_id}};
unpack(11311, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_set_id, _B3} = protocol:uint32(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_set_id, V1_id}};
unpack(11320, srv, _B0) -> {ok, {}};
unpack(11320, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_max_tower, _B3} = protocol:uint32(_B2),
    {V1_count, _B4} = protocol:uint32(_B3),
    {V1_buy_count, _B5} = protocol:uint32(_B4),
    {V1_award_list, _B10} = protocol:array(_B5,
					   fun (_B6) ->
						   {V2_id, _B7} =
						       protocol:uint32(_B6),
						   {V2_status, _B8} =
						       protocol:uint8(_B7),
						   {{V2_id, V2_status}, _B8}
					   end),
    {ok,
     {V1_result, V1_msg, V1_max_tower, V1_count,
      V1_buy_count, V1_award_list}};
unpack(11321, srv, _B0) -> {ok, {}};
unpack(11321, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {V1_buy_count, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_count, V1_buy_count}};
unpack(11322, srv, _B0) ->
    {V1_tower, _B1} = protocol:uint32(_B0),
    {ok, {V1_tower}};
unpack(11322, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11323, srv, _B0) -> {ok, {}};
unpack(11323, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_max_tower, _B2} = protocol:uint32(_B1),
    {V1_tower, _B3} = protocol:uint32(_B2),
    {V1_timer, _B4} = protocol:uint32(_B3),
    {V1_count, _B5} = protocol:uint32(_B4),
    {V1_first_award, _B10} = protocol:array(_B5,
					    fun (_B6) ->
						    {V2_item_id, _B7} =
							protocol:uint32(_B6),
						    {V2_num, _B8} =
							protocol:uint32(_B7),
						    {{V2_item_id, V2_num}, _B8}
					    end),
    {V1_award, _B15} = protocol:array(_B10,
				      fun (_B11) ->
					      {V2_item_id, _B12} =
						  protocol:uint32(_B11),
					      {V2_num, _B13} =
						  protocol:uint32(_B12),
					      {{V2_item_id, V2_num}, _B13}
				      end),
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
    {V1_is_skip, _B40} = protocol:uint8(_B39),
    {ok,
     {V1_result, V1_max_tower, V1_tower, V1_timer, V1_count,
      V1_first_award, V1_award, V1_target_role_name,
      V1_hurt_statistics, V1_replay_id, V1_is_skip}};
unpack(11324, srv, _B0) ->
    {V1_tower, _B1} = protocol:uint32(_B0),
    {ok, {V1_tower}};
unpack(11324, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {V1_buy_count, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_count, V1_buy_count}};
unpack(11325, srv, _B0) ->
    {V1_tower, _B1} = protocol:uint32(_B0),
    {ok, {V1_tower}};
unpack(11325, cli, _B0) ->
    {V1_tower_replay_data, _B13} = protocol:array(_B0,
						  fun (_B1) ->
							  {V2_type, _B2} =
							      protocol:uint8(_B1),
							  {V2_rid, _B3} =
							      protocol:uint32(_B2),
							  {V2_sid, _B4} =
							      protocol:string(_B3),
							  {V2_name, _B5} =
							      protocol:string(_B4),
							  {V2_face_id, _B6} =
							      protocol:uint32(_B5),
							  {V2_power, _B7} =
							      protocol:uint32(_B6),
							  {V2_time, _B8} =
							      protocol:uint32(_B7),
							  {V2_replay_id, _B9} =
							      protocol:uint32(_B8),
							  {V2_face_update_time,
							   _B10} =
							      protocol:uint32(_B9),
							  {V2_face_file, _B11} =
							      protocol:string(_B10),
							  {{V2_type, V2_rid,
							    V2_sid, V2_name,
							    V2_face_id,
							    V2_power, V2_time,
							    V2_replay_id,
							    V2_face_update_time,
							    V2_face_file},
							   _B11}
						  end),
    {V1_m_replay_id, _B14} = protocol:uint32(_B13),
    {V1_my_time, _B15} = protocol:uint32(_B14),
    {ok,
     {V1_tower_replay_data, V1_m_replay_id, V1_my_time}};
unpack(11326, srv, _B0) -> {ok, {}};
unpack(11326, cli, _B0) ->
    {V1_tower, _B1} = protocol:uint32(_B0),
    {ok, {V1_tower}};
unpack(11327, srv, _B0) -> {ok, {}};
unpack(11327, cli, _B0) ->
    {V1_rank_lists, _B8} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_rid, _B2} =
						      protocol:uint32(_B1),
						  {V2_srv_id, _B3} =
						      protocol:string(_B2),
						  {V2_name, _B4} =
						      protocol:string(_B3),
						  {V2_rank, _B5} =
						      protocol:uint32(_B4),
						  {V2_tower, _B6} =
						      protocol:uint32(_B5),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_rank, V2_tower},
						   _B6}
					  end),
    {ok, {V1_rank_lists}};
unpack(11328, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(11328, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(11329, srv, _B0) -> {ok, {}};
unpack(11329, cli, _B0) ->
    {V1_award_list, _B5} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_status, _B3} =
						      protocol:uint8(_B2),
						  {{V2_id, V2_status}, _B3}
					  end),
    {ok, {V1_award_list}};
unpack(11330, srv, _B0) -> {ok, {}};
unpack(11330, cli, _B0) ->
    {V1_quality, _B1} = protocol:uint32(_B0),
    {V1_luck, _B2} = protocol:uint32(_B1),
    {V1_end_count, _B3} = protocol:uint32(_B2),
    {V1_ref_count, _B4} = protocol:uint32(_B3),
    {V1_day_gold_count, _B5} = protocol:uint32(_B4),
    {V1_flag, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_quality, V1_luck, V1_end_count, V1_ref_count,
      V1_day_gold_count, V1_flag}};
unpack(11331, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_count, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_count}};
unpack(11331, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_end_count, _B3} = protocol:uint32(_B2),
    {V1_quality, _B4} = protocol:uint32(_B3),
    {V1_day_gold_count, _B5} = protocol:uint32(_B4),
    {V1_flag, _B6} = protocol:uint8(_B5),
    {V1_award, _B11} = protocol:array(_B6,
				      fun (_B7) ->
					      {V2_item_id, _B8} =
						  protocol:uint32(_B7),
					      {V2_num, _B9} =
						  protocol:uint32(_B8),
					      {{V2_item_id, V2_num}, _B9}
				      end),
    {V1_award2, _B16} = protocol:array(_B11,
				       fun (_B12) ->
					       {V2_item_id, _B13} =
						   protocol:uint32(_B12),
					       {V2_num, _B14} =
						   protocol:uint32(_B13),
					       {{V2_item_id, V2_num}, _B14}
				       end),
    {ok,
     {V1_result, V1_msg, V1_end_count, V1_quality,
      V1_day_gold_count, V1_flag, V1_award, V1_award2}};
unpack(11332, srv, _B0) -> {ok, {}};
unpack(11332, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_luck, _B3} = protocol:uint32(_B2),
    {V1_ref_count, _B4} = protocol:uint32(_B3),
    {ok, {V1_result, V1_msg, V1_luck, V1_ref_count}};
unpack(11333, srv, _B0) ->
    {V1_replay_id, _B1} = protocol:uint32(_B0),
    {V1_channel, _B2} = protocol:uint16(_B1),
    {V1_tower, _B3} = protocol:uint32(_B2),
    {ok, {V1_replay_id, V1_channel, V1_tower}};
unpack(11333, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


