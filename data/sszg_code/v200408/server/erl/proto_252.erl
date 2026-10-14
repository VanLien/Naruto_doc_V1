-file("src/proto/proto_252.erl", 1).

-module(proto_252).

-lager_records([{holy_eqm_set_cell,
		 [ver, id, partner_id, name, list]},
		{m_holy_eqm_set, [ver, num, buy_num, next_id, list]},
		{holy_eqm_attr_data,
		 [group_id, attr, time_min, time_max, val_range,
		  first_pro, reset_pro]},
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
		  res_p, dam_s, res_s, tenacity]},
		{heaven_dun, [ver, id, state, star, star_info]},
		{heaven_chapter,
		 [ver, id, star, chapter_awards, dun_list]},
		{m_dungeon_heaven,
		 [ver, count, buy_count, chapter_list, formations]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/dungeon_heaven.hrl", 1).

-record(m_dungeon_heaven,
	{ver = 1, count = 0, buy_count = 0, chapter_list = [],
	 formations = []}).

-record(heaven_chapter,
	{ver = 1, id = 0, star = 0, chapter_awards = [],
	 dun_list = []}).

-record(heaven_dun,
	{ver = 1, id = 0, state = 0, star = 0, star_info = []}).

-file("src/proto/proto_252.erl", 16).

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

-file("src/proto/proto_252.erl", 17).

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

-file("src/proto/proto_252.erl", 18).

-file("inc/holy_eqm.hrl", 1).

-record(holy_eqm_attr_data,
	{group_id = 0, attr, time_min = 0, time_max = 0,
	 val_range = [], first_pro = 0, reset_pro = 0}).

-record(m_holy_eqm_set,
	{ver = 1, num = 0, buy_num = 0, next_id = 1,
	 list = []}).

-record(holy_eqm_set_cell,
	{ver = 1, id = 0, partner_id = 0, name = <<>>,
	 list = []}).

-file("src/proto/proto_252.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25200, cli, {}) -> {ok, <<2:32, 25200:16>>};
pack(25200, srv,
     {V0_count, V0_buy_count, V0_max_dun_id,
      V0_chapter_info}) ->
    D_a_t_a = <<V0_count:8, V0_buy_count:8,
		V0_max_dun_id:32, (length(V0_chapter_info)):16,
		(list_to_binary([<<V1_id:32, V1_all_star:8,
				   (length(V1_award_info)):16,
				   (list_to_binary([<<V2_id:8, V2_flag:8>>
						    || {V2_id, V2_flag}
							   <- V1_award_info]))/binary,
				   V1_is_finish:8>>
				 || {V1_id, V1_all_star, V1_award_info,
				     V1_is_finish}
					<- V0_chapter_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25200:16,
       D_a_t_a/binary>>};
pack(25201, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25201:16,
       D_a_t_a/binary>>};
pack(25201, srv, {V0_id, V0_all_star, V0_dun_info}) ->
    D_a_t_a = <<V0_id:32, V0_all_star:8,
		(length(V0_dun_info)):16,
		(list_to_binary([<<V1_id:32, V1_state:32, V1_star:32,
				   (length(V1_star_info)):16,
				   (list_to_binary([<<V2_star_id:8, V2_flag:8>>
						    || {V2_star_id, V2_flag}
							   <- V1_star_info]))/binary>>
				 || #heaven_dun{id = V1_id, state = V1_state,
						star = V1_star,
						star_info = V1_star_info}
					<- V0_dun_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25201:16,
       D_a_t_a/binary>>};
pack(25203, cli, {}) -> {ok, <<2:32, 25203:16>>};
pack(25203, srv,
     {V0_count, V0_buy_count, V0_max_dun_id,
      V0_chapter_info}) ->
    D_a_t_a = <<V0_count:8, V0_buy_count:8,
		V0_max_dun_id:32, (length(V0_chapter_info)):16,
		(list_to_binary([<<V1_id:32, V1_all_star:8,
				   (length(V1_award_info)):16,
				   (list_to_binary([<<V2_id:8, V2_flag:8>>
						    || {V2_id, V2_flag}
							   <- V1_award_info]))/binary,
				   V1_is_finish:8>>
				 || {V1_id, V1_all_star, V1_award_info,
				     V1_is_finish}
					<- V0_chapter_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25203:16,
       D_a_t_a/binary>>};
pack(25204, cli, {}) -> {ok, <<2:32, 25204:16>>};
pack(25204, srv, {V0_id, V0_dun_info}) ->
    D_a_t_a = <<V0_id:32, (length(V0_dun_info)):16,
		(list_to_binary([<<V1_id:32, V1_state:32, V1_star:32,
				   (length(V1_star_info)):16,
				   (list_to_binary([<<V2_star_id:8, V2_flag:8>>
						    || {V2_star_id, V2_flag}
							   <- V1_star_info]))/binary>>
				 || #heaven_dun{id = V1_id, state = V1_state,
						star = V1_star,
						star_info = V1_star_info}
					<- V0_dun_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25204:16,
       D_a_t_a/binary>>};
pack(25205, cli, {V0_id, V0_order_id}) ->
    D_a_t_a = <<V0_id:32, V0_order_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25205:16,
       D_a_t_a/binary>>};
pack(25205, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25205:16,
       D_a_t_a/binary>>};
pack(25206, cli, {}) -> {ok, <<2:32, 25206:16>>};
pack(25206, srv,
     {V0_result, V0_id, V0_order_id, V0_star_info, V0_award,
      V0_all_hurt_statistics}) ->
    D_a_t_a = <<V0_result:8, V0_id:32, V0_order_id:32,
		(length(V0_star_info)):16,
		(list_to_binary([<<V1_id:32, V1_state:32>>
				 || {V1_id, V1_state} <- V0_star_info]))/binary,
		(length(V0_award)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num} <- V0_award]))/binary,
		(length(V0_all_hurt_statistics)):16,
		(list_to_binary([<<V1_type:8, V1_a_round:8,
				   V1_b_round:8,
				   (protocol:pack(string,
						  V1_target_role_name))/binary,
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
				 || {V1_type, V1_a_round, V1_b_round,
				     V1_target_role_name, V1_hurt_statistics}
					<- V0_all_hurt_statistics]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25206:16,
       D_a_t_a/binary>>};
pack(25207, cli, {}) -> {ok, <<2:32, 25207:16>>};
pack(25207, srv,
     {V0_code, V0_msg, V0_count, V0_buy_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:8,
		V0_buy_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25207:16,
       D_a_t_a/binary>>};
pack(25208, cli, {V0_id, V0_order_id}) ->
    D_a_t_a = <<V0_id:32, V0_order_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25208:16,
       D_a_t_a/binary>>};
pack(25208, srv, {V0_code, V0_msg, V0_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25208:16,
       D_a_t_a/binary>>};
pack(25210, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25210:16,
       D_a_t_a/binary>>};
pack(25210, srv, {V0_type, V0_formations}) ->
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
     <<(byte_size(D_a_t_a) + 2):32, 25210:16,
       D_a_t_a/binary>>};
pack(25211, cli, {V0_type, V0_formations}) ->
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
     <<(byte_size(D_a_t_a) + 2):32, 25211:16,
       D_a_t_a/binary>>};
pack(25211, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25211:16,
       D_a_t_a/binary>>};
pack(25215, cli, {V0_id, V0_award_id}) ->
    D_a_t_a = <<V0_id:32, V0_award_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25215:16,
       D_a_t_a/binary>>};
pack(25215, srv,
     {V0_code, V0_msg, V0_id, V0_award_info}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32,
		(length(V0_award_info)):16,
		(list_to_binary([<<V1_id:8, V1_flag:8>>
				 || {V1_id, V1_flag}
					<- V0_award_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25215:16,
       D_a_t_a/binary>>};
pack(25216, cli, {}) -> {ok, <<2:32, 25216:16>>};
pack(25216, srv, {V0_combat_type, V0_flag}) ->
    D_a_t_a = <<V0_combat_type:32, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25216:16,
       D_a_t_a/binary>>};
pack(25217, cli,
     {V0_group_id, V0_times, V0_recruit_type}) ->
    D_a_t_a = <<V0_group_id:16, V0_times:8,
		V0_recruit_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25217:16,
       D_a_t_a/binary>>};
pack(25217, srv,
     {V0_group_id, V0_times, V0_recruit_type, V0_rewards}) ->
    D_a_t_a = <<V0_group_id:16, V0_times:8,
		V0_recruit_type:8, (length(V0_rewards)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_num:32>>
				 || {V1_id, V1_base_id, V1_num}
					<- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25217:16,
       D_a_t_a/binary>>};
pack(25218, cli, {V0_type, V0_group_id}) ->
    D_a_t_a = <<V0_type:8, V0_group_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25218:16,
       D_a_t_a/binary>>};
pack(25218, srv, {V0_type, V0_group_id, V0_log_list}) ->
    D_a_t_a = <<V0_type:8, V0_group_id:16,
		(length(V0_log_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_role_name))/binary,
				   V1_bid:32, V1_num:32>>
				 || {V1_role_name, V1_bid, V1_num}
					<- V0_log_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25218:16,
       D_a_t_a/binary>>};
pack(25219, cli, {}) -> {ok, <<2:32, 25219:16>>};
pack(25219, srv, {V0_recruit_list}) ->
    D_a_t_a = <<(length(V0_recruit_list)):16,
		(list_to_binary([<<V1_group_id:16, V1_free_times:8,
				   V1_reset_time:32, V1_baodi_count:32,
				   (length(V1_lucky_holy_eqm)):16,
				   (list_to_binary([<<V2_pos:8,
						      V2_lucky_holy_eqm:32>>
						    || {V2_pos,
							V2_lucky_holy_eqm}
							   <- V1_lucky_holy_eqm]))/binary,
				   V1_all_award_count:32,
				   (length(V1_do_awards)):16,
				   (list_to_binary([<<V2_award_id:32>>
						    || V2_award_id
							   <- V1_do_awards]))/binary,
				   V1_day_count:32, V1_is_open:8>>
				 || {V1_group_id, V1_free_times, V1_reset_time,
				     V1_baodi_count, V1_lucky_holy_eqm,
				     V1_all_award_count, V1_do_awards,
				     V1_day_count, V1_is_open}
					<- V0_recruit_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25219:16,
       D_a_t_a/binary>>};
pack(25220, cli, {}) -> {ok, <<2:32, 25220:16>>};
pack(25220, srv, {V0_num, V0_holy_eqm_set_cell}) ->
    D_a_t_a = <<V0_num:32,
		(length(V0_holy_eqm_set_cell)):16,
		(list_to_binary([<<V1_id:32, V1_partner_id:32,
				   (protocol:pack(string, V1_name))/binary,
				   (length(V1_list)):16,
				   (list_to_binary([<<V2_partner_id:32,
						      V2_item_id:32>>
						    || {V2_partner_id,
							V2_item_id}
							   <- V1_list]))/binary>>
				 || #holy_eqm_set_cell{id = V1_id,
						       partner_id =
							   V1_partner_id,
						       name = V1_name,
						       list = V1_list}
					<- V0_holy_eqm_set_cell]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25220:16,
       D_a_t_a/binary>>};
pack(25221, cli,
     {V0_id, V0_partner_id, V0_name, V0_holy_eqm}) ->
    D_a_t_a = <<V0_id:32, V0_partner_id:32,
		(protocol:pack(string, V0_name))/binary,
		(length(V0_holy_eqm)):16,
		(list_to_binary([<<V1_partner_id:32, V1_item_id:32>>
				 || {V1_partner_id, V1_item_id}
					<- V0_holy_eqm]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25221:16,
       D_a_t_a/binary>>};
pack(25221, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25221:16,
       D_a_t_a/binary>>};
pack(25222, cli, {}) -> {ok, <<2:32, 25222:16>>};
pack(25222, srv, {V0_holy_eqm_set_cell}) ->
    D_a_t_a = <<(length(V0_holy_eqm_set_cell)):16,
		(list_to_binary([<<V1_id:32, V1_partner_id:32,
				   (protocol:pack(string, V1_name))/binary,
				   (length(V1_list)):16,
				   (list_to_binary([<<V2_partner_id:32,
						      V2_item_id:32>>
						    || {V2_partner_id,
							V2_item_id}
							   <- V1_list]))/binary>>
				 || #holy_eqm_set_cell{id = V1_id,
						       partner_id =
							   V1_partner_id,
						       name = V1_name,
						       list = V1_list}
					<- V0_holy_eqm_set_cell]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25222:16,
       D_a_t_a/binary>>};
pack(25223, cli, {}) -> {ok, <<2:32, 25223:16>>};
pack(25223, srv, {V0_code, V0_msg, V0_num}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25223:16,
       D_a_t_a/binary>>};
pack(25224, cli, {V0_partner_id, V0_id}) ->
    D_a_t_a = <<V0_partner_id:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25224:16,
       D_a_t_a/binary>>};
pack(25224, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25224:16,
       D_a_t_a/binary>>};
pack(25230, cli, {V0_group_id, V0_lucky_holy_eqm}) ->
    D_a_t_a = <<V0_group_id:16,
		(length(V0_lucky_holy_eqm)):16,
		(list_to_binary([<<V1_pos:8, V1_lucky_holy_eqm:32>>
				 || {V1_pos, V1_lucky_holy_eqm}
					<- V0_lucky_holy_eqm]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25230:16,
       D_a_t_a/binary>>};
pack(25230, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25230:16,
       D_a_t_a/binary>>};
pack(25231, cli, {V0_group_id, V0_id}) ->
    D_a_t_a = <<V0_group_id:16, V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25231:16,
       D_a_t_a/binary>>};
pack(25231, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25231:16,
       D_a_t_a/binary>>};
pack(25232, cli, {}) -> {ok, <<2:32, 25232:16>>};
pack(25232, srv, {V0_score}) ->
    D_a_t_a = <<V0_score:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25232:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25200, srv, _B0) -> {ok, {}};
unpack(25200, cli, _B0) ->
    {V1_count, _B1} = protocol:uint8(_B0),
    {V1_buy_count, _B2} = protocol:uint8(_B1),
    {V1_max_dun_id, _B3} = protocol:uint32(_B2),
    {V1_chapter_info, _B14} = protocol:array(_B3,
					     fun (_B4) ->
						     {V2_id, _B5} =
							 protocol:uint32(_B4),
						     {V2_all_star, _B6} =
							 protocol:uint8(_B5),
						     {V2_award_info, _B11} =
							 protocol:array(_B6,
									fun
									  (_B7) ->
									      {V3_id,
									       _B8} =
										  protocol:uint8(_B7),
									      {V3_flag,
									       _B9} =
										  protocol:uint8(_B8),
									      {{V3_id,
										V3_flag},
									       _B9}
									end),
						     {V2_is_finish, _B12} =
							 protocol:uint8(_B11),
						     {{V2_id, V2_all_star,
						       V2_award_info,
						       V2_is_finish},
						      _B12}
					     end),
    {ok,
     {V1_count, V1_buy_count, V1_max_dun_id,
      V1_chapter_info}};
unpack(25201, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(25201, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_all_star, _B2} = protocol:uint8(_B1),
    {V1_dun_info, _B13} = protocol:array(_B2,
					 fun (_B3) ->
						 {V2_id, _B4} =
						     protocol:uint32(_B3),
						 {V2_state, _B5} =
						     protocol:uint32(_B4),
						 {V2_star, _B6} =
						     protocol:uint32(_B5),
						 {V2_star_info, _B11} =
						     protocol:array(_B6,
								    fun (_B7) ->
									    {V3_star_id,
									     _B8} =
										protocol:uint8(_B7),
									    {V3_flag,
									     _B9} =
										protocol:uint8(_B8),
									    {{V3_star_id,
									      V3_flag},
									     _B9}
								    end),
						 {{V2_id, V2_state, V2_star,
						   V2_star_info},
						  _B11}
					 end),
    {ok, {V1_id, V1_all_star, V1_dun_info}};
unpack(25203, srv, _B0) -> {ok, {}};
unpack(25203, cli, _B0) ->
    {V1_count, _B1} = protocol:uint8(_B0),
    {V1_buy_count, _B2} = protocol:uint8(_B1),
    {V1_max_dun_id, _B3} = protocol:uint32(_B2),
    {V1_chapter_info, _B14} = protocol:array(_B3,
					     fun (_B4) ->
						     {V2_id, _B5} =
							 protocol:uint32(_B4),
						     {V2_all_star, _B6} =
							 protocol:uint8(_B5),
						     {V2_award_info, _B11} =
							 protocol:array(_B6,
									fun
									  (_B7) ->
									      {V3_id,
									       _B8} =
										  protocol:uint8(_B7),
									      {V3_flag,
									       _B9} =
										  protocol:uint8(_B8),
									      {{V3_id,
										V3_flag},
									       _B9}
									end),
						     {V2_is_finish, _B12} =
							 protocol:uint8(_B11),
						     {{V2_id, V2_all_star,
						       V2_award_info,
						       V2_is_finish},
						      _B12}
					     end),
    {ok,
     {V1_count, V1_buy_count, V1_max_dun_id,
      V1_chapter_info}};
unpack(25204, srv, _B0) -> {ok, {}};
unpack(25204, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_dun_info, _B12} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_id, _B3} =
						     protocol:uint32(_B2),
						 {V2_state, _B4} =
						     protocol:uint32(_B3),
						 {V2_star, _B5} =
						     protocol:uint32(_B4),
						 {V2_star_info, _B10} =
						     protocol:array(_B5,
								    fun (_B6) ->
									    {V3_star_id,
									     _B7} =
										protocol:uint8(_B6),
									    {V3_flag,
									     _B8} =
										protocol:uint8(_B7),
									    {{V3_star_id,
									      V3_flag},
									     _B8}
								    end),
						 {{V2_id, V2_state, V2_star,
						   V2_star_info},
						  _B10}
					 end),
    {ok, {V1_id, V1_dun_info}};
unpack(25205, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_order_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_order_id}};
unpack(25205, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25206, srv, _B0) -> {ok, {}};
unpack(25206, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_order_id, _B3} = protocol:uint32(_B2),
    {V1_star_info, _B8} = protocol:array(_B3,
					 fun (_B4) ->
						 {V2_id, _B5} =
						     protocol:uint32(_B4),
						 {V2_state, _B6} =
						     protocol:uint32(_B5),
						 {{V2_id, V2_state}, _B6}
					 end),
    {V1_award, _B13} = protocol:array(_B8,
				      fun (_B9) ->
					      {V2_item_id, _B10} =
						  protocol:uint32(_B9),
					      {V2_num, _B11} =
						  protocol:uint32(_B10),
					      {{V2_item_id, V2_num}, _B11}
				      end),
    {V1_all_hurt_statistics, _B42} = protocol:array(_B13,
						    fun (_B14) ->
							    {V2_type, _B15} =
								protocol:uint8(_B14),
							    {V2_a_round, _B16} =
								protocol:uint8(_B15),
							    {V2_b_round, _B17} =
								protocol:uint8(_B16),
							    {V2_target_role_name,
							     _B18} =
								protocol:string(_B17),
							    {V2_hurt_statistics,
							     _B40} =
								protocol:array(_B18,
									       fun
										 (_B19) ->
										     {V3_type,
										      _B20} =
											 protocol:uint8(_B19),
										     {V3_partner_hurts,
										      _B38} =
											 protocol:array(_B20,
													fun
													  (_B21) ->
													      {V4_rid,
													       _B22} =
														  protocol:uint32(_B21),
													      {V4_srvid,
													       _B23} =
														  protocol:string(_B22),
													      {V4_id,
													       _B24} =
														  protocol:uint32(_B23),
													      {V4_bid,
													       _B25} =
														  protocol:uint32(_B24),
													      {V4_star,
													       _B26} =
														  protocol:uint32(_B25),
													      {V4_lev,
													       _B27} =
														  protocol:uint32(_B26),
													      {V4_camp_type,
													       _B28} =
														  protocol:uint32(_B27),
													      {V4_dps,
													       _B29} =
														  protocol:uint32(_B28),
													      {V4_cure,
													       _B30} =
														  protocol:uint32(_B29),
													      {V4_ext_data,
													       _B35} =
														  protocol:array(_B30,
																 fun
																   (_B31) ->
																       {V5_key,
																	_B32} =
																	   protocol:uint32(_B31),
																       {V5_val,
																	_B33} =
																	   protocol:uint32(_B32),
																       {{V5_key,
																	 V5_val},
																	_B33}
																 end),
													      {V4_be_hurt,
													       _B36} =
														  protocol:uint32(_B35),
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
													       _B36}
													end),
										     {{V3_type,
										       V3_partner_hurts},
										      _B38}
									       end),
							    {{V2_type,
							      V2_a_round,
							      V2_b_round,
							      V2_target_role_name,
							      V2_hurt_statistics},
							     _B40}
						    end),
    {ok,
     {V1_result, V1_id, V1_order_id, V1_star_info, V1_award,
      V1_all_hurt_statistics}};
unpack(25207, srv, _B0) -> {ok, {}};
unpack(25207, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint8(_B2),
    {V1_buy_count, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_count, V1_buy_count}};
unpack(25208, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_order_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_order_id}};
unpack(25208, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_count}};
unpack(25210, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(25210, cli, _B0) ->
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
unpack(25211, srv, _B0) ->
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
unpack(25211, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25215, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_award_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_award_id}};
unpack(25215, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_award_info, _B8} = protocol:array(_B3,
					  fun (_B4) ->
						  {V2_id, _B5} =
						      protocol:uint8(_B4),
						  {V2_flag, _B6} =
						      protocol:uint8(_B5),
						  {{V2_id, V2_flag}, _B6}
					  end),
    {ok, {V1_code, V1_msg, V1_id, V1_award_info}};
unpack(25216, srv, _B0) -> {ok, {}};
unpack(25216, cli, _B0) ->
    {V1_combat_type, _B1} = protocol:uint32(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_combat_type, V1_flag}};
unpack(25217, srv, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {V1_recruit_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_group_id, V1_times, V1_recruit_type}};
unpack(25217, cli, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {V1_recruit_type, _B3} = protocol:uint8(_B2),
    {V1_rewards, _B9} = protocol:array(_B3,
				       fun (_B4) ->
					       {V2_id, _B5} =
						   protocol:uint32(_B4),
					       {V2_base_id, _B6} =
						   protocol:uint32(_B5),
					       {V2_num, _B7} =
						   protocol:uint32(_B6),
					       {{V2_id, V2_base_id, V2_num},
						_B7}
				       end),
    {ok,
     {V1_group_id, V1_times, V1_recruit_type, V1_rewards}};
unpack(25218, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_group_id, _B2} = protocol:uint16(_B1),
    {ok, {V1_type, V1_group_id}};
unpack(25218, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_group_id, _B2} = protocol:uint16(_B1),
    {V1_log_list, _B8} = protocol:array(_B2,
					fun (_B3) ->
						{V2_role_name, _B4} =
						    protocol:string(_B3),
						{V2_bid, _B5} =
						    protocol:uint32(_B4),
						{V2_num, _B6} =
						    protocol:uint32(_B5),
						{{V2_role_name, V2_bid, V2_num},
						 _B6}
					end),
    {ok, {V1_type, V1_group_id, V1_log_list}};
unpack(25219, srv, _B0) -> {ok, {}};
unpack(25219, cli, _B0) ->
    {V1_recruit_list, _B19} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_group_id, _B2} =
							 protocol:uint16(_B1),
						     {V2_free_times, _B3} =
							 protocol:uint8(_B2),
						     {V2_reset_time, _B4} =
							 protocol:uint32(_B3),
						     {V2_baodi_count, _B5} =
							 protocol:uint32(_B4),
						     {V2_lucky_holy_eqm, _B10} =
							 protocol:array(_B5,
									fun
									  (_B6) ->
									      {V3_pos,
									       _B7} =
										  protocol:uint8(_B6),
									      {V3_lucky_holy_eqm,
									       _B8} =
										  protocol:uint32(_B7),
									      {{V3_pos,
										V3_lucky_holy_eqm},
									       _B8}
									end),
						     {V2_all_award_count,
						      _B11} =
							 protocol:uint32(_B10),
						     {V2_do_awards, _B15} =
							 protocol:array(_B11,
									fun
									  (_B12) ->
									      {V3_award_id,
									       _B13} =
										  protocol:uint32(_B12),
									      {V3_award_id,
									       _B13}
									end),
						     {V2_day_count, _B16} =
							 protocol:uint32(_B15),
						     {V2_is_open, _B17} =
							 protocol:uint8(_B16),
						     {{V2_group_id,
						       V2_free_times,
						       V2_reset_time,
						       V2_baodi_count,
						       V2_lucky_holy_eqm,
						       V2_all_award_count,
						       V2_do_awards,
						       V2_day_count,
						       V2_is_open},
						      _B17}
					     end),
    {ok, {V1_recruit_list}};
unpack(25220, srv, _B0) -> {ok, {}};
unpack(25220, cli, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0),
    {V1_holy_eqm_set_cell, _B12} = protocol:array(_B1,
						  fun (_B2) ->
							  {V2_id, _B3} =
							      protocol:uint32(_B2),
							  {V2_partner_id, _B4} =
							      protocol:uint32(_B3),
							  {V2_name, _B5} =
							      protocol:string(_B4),
							  {V2_list, _B10} =
							      protocol:array(_B5,
									     fun
									       (_B6) ->
										   {V3_partner_id,
										    _B7} =
										       protocol:uint32(_B6),
										   {V3_item_id,
										    _B8} =
										       protocol:uint32(_B7),
										   {{V3_partner_id,
										     V3_item_id},
										    _B8}
									     end),
							  {{V2_id,
							    V2_partner_id,
							    V2_name, V2_list},
							   _B10}
						  end),
    {ok, {V1_num, V1_holy_eqm_set_cell}};
unpack(25221, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_partner_id, _B2} = protocol:uint32(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_holy_eqm, _B8} = protocol:array(_B3,
					fun (_B4) ->
						{V2_partner_id, _B5} =
						    protocol:uint32(_B4),
						{V2_item_id, _B6} =
						    protocol:uint32(_B5),
						{{V2_partner_id, V2_item_id},
						 _B6}
					end),
    {ok, {V1_id, V1_partner_id, V1_name, V1_holy_eqm}};
unpack(25221, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25222, srv, _B0) -> {ok, {}};
unpack(25222, cli, _B0) ->
    {V1_holy_eqm_set_cell, _B11} = protocol:array(_B0,
						  fun (_B1) ->
							  {V2_id, _B2} =
							      protocol:uint32(_B1),
							  {V2_partner_id, _B3} =
							      protocol:uint32(_B2),
							  {V2_name, _B4} =
							      protocol:string(_B3),
							  {V2_list, _B9} =
							      protocol:array(_B4,
									     fun
									       (_B5) ->
										   {V3_partner_id,
										    _B6} =
										       protocol:uint32(_B5),
										   {V3_item_id,
										    _B7} =
										       protocol:uint32(_B6),
										   {{V3_partner_id,
										     V3_item_id},
										    _B7}
									     end),
							  {{V2_id,
							    V2_partner_id,
							    V2_name, V2_list},
							   _B9}
						  end),
    {ok, {V1_holy_eqm_set_cell}};
unpack(25223, srv, _B0) -> {ok, {}};
unpack(25223, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_num}};
unpack(25224, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_partner_id, V1_id}};
unpack(25224, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25230, srv, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_lucky_holy_eqm, _B6} = protocol:array(_B1,
					      fun (_B2) ->
						      {V2_pos, _B3} =
							  protocol:uint8(_B2),
						      {V2_lucky_holy_eqm, _B4} =
							  protocol:uint32(_B3),
						      {{V2_pos,
							V2_lucky_holy_eqm},
						       _B4}
					      end),
    {ok, {V1_group_id, V1_lucky_holy_eqm}};
unpack(25230, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(25231, srv, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_id, _B2} = protocol:uint16(_B1),
    {ok, {V1_group_id, V1_id}};
unpack(25231, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(25232, srv, _B0) -> {ok, {}};
unpack(25232, cli, _B0) ->
    {V1_score, _B1} = protocol:uint32(_B0),
    {ok, {V1_score}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


