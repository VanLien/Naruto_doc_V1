-file("src/proto/proto_243.erl", 1).

-module(proto_243).

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
		{sky_ladder_result,
		 [result, id, def_name, def_lev, def_face,
		  def_change_rank, def_rank, def_old_rank,
		  is_change_best_rank, atk_change_rank, atk_rank,
		  atk_old_rank, atk_cont_win, reward,
		  def_face_update_time, def_face_file]},
		{sky_ladder_highlight,
		 [id, atk_id, atk_name, atk_face, atk_rank, def_id,
		  def_name, def_face, def_rank, ret, replay_id, time,
		  atk_face_update_time, atk_face_file,
		  def_face_update_time, def_face_file]},
		{sky_ladder_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power,
		  atk_power, enemy_old_rank, old_rank, type, ret,
		  replay_id, rank_type, rank, time, face_update_time,
		  face_file]},
		{sky_ladder_role_log,
		 [id, name, face, logs, face_update_time, face_file]},
		{sky_ladder_rank,
		 [rank, id, is_fight, fight_rid, fight_pid]},
		{sky_ladder_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, rank, best_rank, time, avatar_id,
		  robot_unit, cont_win, face_update_time, face_file]},
		{sky_ladder_f_pos,
		 [pos, id, bid, lev, use_skin, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, is_robot]},
		{sky_ladder_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, formation_type, formation_lev, hallows_id,
		  pos_info, robot_id, avatar_id, look, face_update_time,
		  face_file]},
		{m_sky_ladder,
		 [ver, ref_time, combat_time, ref_list, best_rank,
		  can_combat_num, had_combat_num, buy_combat_num,
		  acc_combat_num, first_reward, next_reset_nine, worship,
		  worship_list, season_idx, merge_index,
		  now_combat_num]}]).

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

-file("src/proto/proto_243.erl", 16).

-file("inc/sky_ladder.hrl", 1).

-record(m_sky_ladder,
	{ver = 2, ref_time = 0, combat_time = 0, ref_list = [],
	 best_rank = 0,
	 can_combat_num = sky_ladder_data:get_const(join_times),
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, first_reward = [],
	 next_reset_nine = 0, worship = 0, worship_list = [],
	 season_idx = 0, merge_index = 0, now_combat_num = 0}).

-record(sky_ladder_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, formation_type = 0, formation_lev = 0,
	 hallows_id = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, look = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(sky_ladder_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, use_skin = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, is_robot = 0}).

-record(sky_ladder_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, rank = 0, best_rank = 0,
	 time = 0, avatar_id = 0, robot_unit = 0, cont_win = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_rank,
	{rank = 0, id = {0, <<>>}, is_fight = 0,
	 fight_rid = {0, <<>>}, fight_pid = 0}).

-record(sky_ladder_role_log,
	{id = {0, <<>>}, name = <<>>, face = 0, logs = [],
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, atk_power = 0,
	 enemy_old_rank = 0, old_rank = 0, type = 1, ret = 1,
	 replay_id = 0, rank_type = 0, rank = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_highlight,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_rank = 0, def_id = {0, <<>>},
	 def_name = <<>>, def_face = 0, def_rank = 0, ret = 1,
	 replay_id = 0, time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(sky_ladder_result,
	{result = 0, id = {0, <<>>}, def_name = <<>>,
	 def_lev = 0, def_face = 0, def_change_rank = 0,
	 def_rank = 0, def_old_rank = 0, is_change_best_rank = 0,
	 atk_change_rank = 0, atk_rank = 0, atk_old_rank = 0,
	 atk_cont_win = 0, reward = [], def_face_update_time = 0,
	 def_face_file = <<>>}).

-file("src/proto/proto_243.erl", 17).

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

-file("src/proto/proto_243.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24300, cli, {}) -> {ok, <<2:32, 24300:16>>};
pack(24300, srv,
     {V0_rank, V0_best_rank, V0_can_combat_num,
      V0_buy_combat_num, V0_ref_time, V0_combat_time}) ->
    D_a_t_a = <<V0_rank:16, V0_best_rank:16,
		V0_can_combat_num:8, V0_buy_combat_num:8,
		V0_ref_time:32/signed, V0_combat_time:32/signed>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24300:16,
       D_a_t_a/binary>>};
pack(24301, cli, {}) -> {ok, <<2:32, 24301:16>>};
pack(24301, srv, {V0_f_list, V0_type}) ->
    D_a_t_a = <<(length(V0_f_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_idx:8,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_sex:8, V1_face:32, V1_power:32,
				   V1_rank:32, V1_look:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #sky_ladder_f{id = {V1_rid, V1_srv_id},
						  idx = V1_idx, name = V1_name,
						  lev = V1_lev, sex = V1_sex,
						  face = V1_face,
						  power = V1_power,
						  rank = V1_rank,
						  look = V1_look,
						  face_update_time =
						      V1_face_update_time,
						  face_file = V1_face_file}
					<- V0_f_list]))/binary,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24301:16,
       D_a_t_a/binary>>};
pack(24302, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24302:16,
       D_a_t_a/binary>>};
pack(24302, srv,
     {V0_rid, V0_srv_id, V0_name, V0_lev, V0_vip_lev,
      V0_face, V0_sex, V0_power, V0_rank, V0_gname,
      V0_avatar_id, V0_formation_type, V0_formation_lev,
      V0_p_list, V0_face_update_time, V0_face_file}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:16,
		V0_vip_lev:8, V0_face:32, V0_sex:8, V0_power:32,
		V0_rank:32, (protocol:pack(string, V0_gname))/binary,
		V0_avatar_id:32, V0_formation_type:8,
		V0_formation_lev:8, (length(V0_p_list)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32, V1_bid:32,
				   V1_lev:16, V1_quality:8, V1_star:8,
				   V1_is_robot:8>>
				 || {V1_pos, V1_id, V1_bid, V1_lev, V1_quality,
				     V1_star, V1_is_robot}
					<- V0_p_list]))/binary,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24302:16,
       D_a_t_a/binary>>};
pack(24303, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24303:16,
       D_a_t_a/binary>>};
pack(24303, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24303:16,
       D_a_t_a/binary>>};
pack(24304, cli, {}) -> {ok, <<2:32, 24304:16>>};
pack(24304, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24304:16,
       D_a_t_a/binary>>};
pack(24305, cli, {}) -> {ok, <<2:32, 24305:16>>};
pack(24305, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24305:16,
       D_a_t_a/binary>>};
pack(24306, cli, {}) -> {ok, <<2:32, 24306:16>>};
pack(24306, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24306:16,
       D_a_t_a/binary>>};
pack(24307, srv,
     {#sky_ladder_result{result = V0_result,
			 id = {V0_rid, V0_srv_id}, def_name = V0_def_name,
			 def_lev = V0_def_lev, def_face = V0_def_face,
			 def_face_update_time = V0_def_face_update_time,
			 def_face_file = V0_def_face_file,
			 def_change_rank = V0_def_change_rank,
			 def_rank = V0_def_rank,
			 is_change_best_rank = V0_is_change_best_rank,
			 atk_change_rank = V0_atk_change_rank,
			 atk_rank = V0_atk_rank, reward = V0_reward},
      V0_target_role_name, V0_hurt_statistics,
      V0_replay_id}) ->
    D_a_t_a = <<V0_result:8, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_def_name))/binary,
		V0_def_lev:32, V0_def_face:32,
		V0_def_face_update_time:32,
		(protocol:pack(string, V0_def_face_file))/binary,
		V0_def_change_rank:32/signed, V0_def_rank:32,
		V0_is_change_best_rank:32, V0_atk_change_rank:32/signed,
		V0_atk_rank:32, (length(V0_reward)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_reward]))/binary,
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
     <<(byte_size(D_a_t_a) + 2):32, 24307:16,
       D_a_t_a/binary>>};
pack(24308, cli, {}) -> {ok, <<2:32, 24308:16>>};
pack(24308, srv, {V0_rank_list}) ->
    D_a_t_a = <<(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_rank:32, V1_lookid:32, V1_worship:32,
				   V1_worship_status:8>>
				 || {#sky_ladder_role{id = {V1_rid, V1_srv_id},
						      name = V1_name,
						      gname = V1_gname,
						      rank = V1_rank,
						      lookid = V1_lookid},
				     V1_worship, V1_worship_status}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24308:16,
       D_a_t_a/binary>>};
pack(24309, cli, {}) -> {ok, <<2:32, 24309:16>>};
pack(24309, srv,
     {V0_rank, V0_best_rank, V0_rank_list}) ->
    D_a_t_a = <<V0_rank:16, V0_best_rank:16,
		(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_lev:16, V1_face:32, V1_sex:8, V1_rank:16,
				   V1_power:32, V1_avatar_id:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #sky_ladder_role{id = {V1_rid, V1_srv_id},
						     name = V1_name,
						     gname = V1_gname,
						     lev = V1_lev,
						     face = V1_face,
						     sex = V1_sex,
						     rank = V1_rank,
						     power = V1_power,
						     avatar_id = V1_avatar_id,
						     face_update_time =
							 V1_face_update_time,
						     face_file = V1_face_file}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24309:16,
       D_a_t_a/binary>>};
pack(24310, cli, {}) -> {ok, <<2:32, 24310:16>>};
pack(24310, srv, {V0_replay_srv_id, V0_log_list}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_replay_srv_id))/binary,
		(length(V0_log_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_sex:8, V1_face:32,
				   V1_avatar_id:32, V1_power:32, V1_type:8,
				   V1_ret:8, V1_rank_type:8, V1_rank:32,
				   V1_replay_id:32, V1_time:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #sky_ladder_pk_log{rid =
							   {V1_rid, V1_srv_id},
						       name = V1_name,
						       lev = V1_lev,
						       sex = V1_sex,
						       face = V1_face,
						       avatar_id = V1_avatar_id,
						       power = V1_power,
						       type = V1_type,
						       ret = V1_ret,
						       rank_type = V1_rank_type,
						       rank = V1_rank,
						       replay_id = V1_replay_id,
						       time = V1_time,
						       face_update_time =
							   V1_face_update_time,
						       face_file = V1_face_file}
					<- V0_log_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24310:16,
       D_a_t_a/binary>>};
pack(24311, cli, {}) -> {ok, <<2:32, 24311:16>>};
pack(24311, srv, {V0_replay_srv_id, V0_log_list}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_replay_srv_id))/binary,
		(length(V0_log_list)):16,
		(list_to_binary([<<V1_atk_rid:32,
				   (protocol:pack(string,
						  V1_atk_srv_id))/binary,
				   (protocol:pack(string, V1_atk_name))/binary,
				   V1_atk_face:32, V1_atk_rank:32,
				   V1_def_rid:32,
				   (protocol:pack(string,
						  V1_def_srv_id))/binary,
				   (protocol:pack(string, V1_def_name))/binary,
				   V1_def_face:32, V1_def_rank:32, V1_ret:8,
				   V1_replay_id:32, V1_time:32,
				   V1_atk_face_update_time:32,
				   (protocol:pack(string,
						  V1_atk_face_file))/binary,
				   V1_def_face_update_time:32,
				   (protocol:pack(string,
						  V1_def_face_file))/binary>>
				 || #sky_ladder_highlight{atk_id =
							      {V1_atk_rid,
							       V1_atk_srv_id},
							  atk_name =
							      V1_atk_name,
							  atk_face =
							      V1_atk_face,
							  atk_rank =
							      V1_atk_rank,
							  def_id =
							      {V1_def_rid,
							       V1_def_srv_id},
							  def_name =
							      V1_def_name,
							  def_face =
							      V1_def_face,
							  def_rank =
							      V1_def_rank,
							  ret = V1_ret,
							  replay_id =
							      V1_replay_id,
							  time = V1_time,
							  atk_face_update_time =
							      V1_atk_face_update_time,
							  atk_face_file =
							      V1_atk_face_file,
							  def_face_update_time =
							      V1_def_face_update_time,
							  def_face_file =
							      V1_def_face_file}
					<- V0_log_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24311:16,
       D_a_t_a/binary>>};
pack(24312, cli, {}) -> {ok, <<2:32, 24312:16>>};
pack(24312, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24312:16,
       D_a_t_a/binary>>};
pack(24313, cli, {}) -> {ok, <<2:32, 24313:16>>};
pack(24313, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24313:16,
       D_a_t_a/binary>>};
pack(24314, cli, {}) -> {ok, <<2:32, 24314:16>>};
pack(24314, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24314:16,
       D_a_t_a/binary>>};
pack(24315, cli, {}) -> {ok, <<2:32, 24315:16>>};
pack(24315, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24315:16,
       D_a_t_a/binary>>};
pack(24316, cli, {V0_rid, V0_srv_id, V0_pos}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_pos:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24316:16,
       D_a_t_a/binary>>};
pack(24316, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24316:16,
       D_a_t_a/binary>>};
pack(24317, cli, {}) -> {ok, <<2:32, 24317:16>>};
pack(24317, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24317:16,
       D_a_t_a/binary>>};
pack(24318, cli,
     {V0_replay_id, V0_srv_id, V0_channel,
      V0_target_name}) ->
    D_a_t_a = <<V0_replay_id:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_channel:16,
		(protocol:pack(string, V0_target_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24318:16,
       D_a_t_a/binary>>};
pack(24318, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24318:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24300, srv, _B0) -> {ok, {}};
unpack(24300, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_best_rank, _B2} = protocol:uint16(_B1),
    {V1_can_combat_num, _B3} = protocol:uint8(_B2),
    {V1_buy_combat_num, _B4} = protocol:uint8(_B3),
    {V1_ref_time, _B5} = protocol:int32(_B4),
    {V1_combat_time, _B6} = protocol:int32(_B5),
    {ok,
     {V1_rank, V1_best_rank, V1_can_combat_num,
      V1_buy_combat_num, V1_ref_time, V1_combat_time}};
unpack(24301, srv, _B0) -> {ok, {}};
unpack(24301, cli, _B0) ->
    {V1_f_list, _B15} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_rid, _B2} =
						   protocol:uint32(_B1),
					       {V2_srv_id, _B3} =
						   protocol:string(_B2),
					       {V2_idx, _B4} =
						   protocol:uint8(_B3),
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
					       {V2_rank, _B10} =
						   protocol:uint32(_B9),
					       {V2_look, _B11} =
						   protocol:uint32(_B10),
					       {V2_face_update_time, _B12} =
						   protocol:uint32(_B11),
					       {V2_face_file, _B13} =
						   protocol:string(_B12),
					       {{V2_rid, V2_srv_id, V2_idx,
						 V2_name, V2_lev, V2_sex,
						 V2_face, V2_power, V2_rank,
						 V2_look, V2_face_update_time,
						 V2_face_file},
						_B13}
				       end),
    {V1_type, _B16} = protocol:uint8(_B15),
    {ok, {V1_f_list, V1_type}};
unpack(24302, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(24302, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_lev, _B4} = protocol:uint16(_B3),
    {V1_vip_lev, _B5} = protocol:uint8(_B4),
    {V1_face, _B6} = protocol:uint32(_B5),
    {V1_sex, _B7} = protocol:uint8(_B6),
    {V1_power, _B8} = protocol:uint32(_B7),
    {V1_rank, _B9} = protocol:uint32(_B8),
    {V1_gname, _B10} = protocol:string(_B9),
    {V1_avatar_id, _B11} = protocol:uint32(_B10),
    {V1_formation_type, _B12} = protocol:uint8(_B11),
    {V1_formation_lev, _B13} = protocol:uint8(_B12),
    {V1_p_list, _B23} = protocol:array(_B13,
				       fun (_B14) ->
					       {V2_pos, _B15} =
						   protocol:uint8(_B14),
					       {V2_id, _B16} =
						   protocol:uint32(_B15),
					       {V2_bid, _B17} =
						   protocol:uint32(_B16),
					       {V2_lev, _B18} =
						   protocol:uint16(_B17),
					       {V2_quality, _B19} =
						   protocol:uint8(_B18),
					       {V2_star, _B20} =
						   protocol:uint8(_B19),
					       {V2_is_robot, _B21} =
						   protocol:uint8(_B20),
					       {{V2_pos, V2_id, V2_bid, V2_lev,
						 V2_quality, V2_star,
						 V2_is_robot},
						_B21}
				       end),
    {V1_face_update_time, _B24} = protocol:uint32(_B23),
    {V1_face_file, _B25} = protocol:string(_B24),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_lev, V1_vip_lev,
      V1_face, V1_sex, V1_power, V1_rank, V1_gname,
      V1_avatar_id, V1_formation_type, V1_formation_lev,
      V1_p_list, V1_face_update_time, V1_face_file}};
unpack(24303, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(24303, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24304, srv, _B0) -> {ok, {}};
unpack(24304, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24305, srv, _B0) -> {ok, {}};
unpack(24305, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24306, srv, _B0) -> {ok, {}};
unpack(24306, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24307, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_def_name, _B4} = protocol:string(_B3),
    {V1_def_lev, _B5} = protocol:uint32(_B4),
    {V1_def_face, _B6} = protocol:uint32(_B5),
    {V1_def_face_update_time, _B7} = protocol:uint32(_B6),
    {V1_def_face_file, _B8} = protocol:string(_B7),
    {V1_def_change_rank, _B9} = protocol:int32(_B8),
    {V1_def_rank, _B10} = protocol:uint32(_B9),
    {V1_is_change_best_rank, _B11} = protocol:uint32(_B10),
    {V1_atk_change_rank, _B12} = protocol:int32(_B11),
    {V1_atk_rank, _B13} = protocol:uint32(_B12),
    {V1_reward, _B18} = protocol:array(_B13,
				       fun (_B14) ->
					       {V2_bid, _B15} =
						   protocol:uint32(_B14),
					       {V2_num, _B16} =
						   protocol:uint32(_B15),
					       {{V2_bid, V2_num}, _B16}
				       end),
    {V1_target_role_name, _B19} = protocol:string(_B18),
    {V1_hurt_statistics, _B41} = protocol:array(_B19,
						fun (_B20) ->
							{V2_type, _B21} =
							    protocol:uint8(_B20),
							{V2_partner_hurts,
							 _B39} =
							    protocol:array(_B21,
									   fun
									     (_B22) ->
										 {V3_rid,
										  _B23} =
										     protocol:uint32(_B22),
										 {V3_srvid,
										  _B24} =
										     protocol:string(_B23),
										 {V3_id,
										  _B25} =
										     protocol:uint32(_B24),
										 {V3_bid,
										  _B26} =
										     protocol:uint32(_B25),
										 {V3_star,
										  _B27} =
										     protocol:uint32(_B26),
										 {V3_lev,
										  _B28} =
										     protocol:uint32(_B27),
										 {V3_camp_type,
										  _B29} =
										     protocol:uint32(_B28),
										 {V3_dps,
										  _B30} =
										     protocol:uint32(_B29),
										 {V3_cure,
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
										 {V3_be_hurt,
										  _B37} =
										     protocol:uint32(_B36),
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
										  _B37}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B39}
						end),
    {V1_replay_id, _B42} = protocol:uint32(_B41),
    {ok,
     {V1_result, V1_rid, V1_srv_id, V1_def_name, V1_def_lev,
      V1_def_face, V1_def_face_update_time, V1_def_face_file,
      V1_def_change_rank, V1_def_rank, V1_is_change_best_rank,
      V1_atk_change_rank, V1_atk_rank, V1_reward,
      V1_target_role_name, V1_hurt_statistics, V1_replay_id}};
unpack(24308, srv, _B0) -> {ok, {}};
unpack(24308, cli, _B0) ->
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
unpack(24309, srv, _B0) -> {ok, {}};
unpack(24309, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_best_rank, _B2} = protocol:uint16(_B1),
    {V1_rank_list, _B17} = protocol:array(_B2,
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
						  {V2_avatar_id, _B13} =
						      protocol:uint32(_B12),
						  {V2_face_update_time, _B14} =
						      protocol:uint32(_B13),
						  {V2_face_file, _B15} =
						      protocol:string(_B14),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_gname, V2_lev, V2_face,
						    V2_sex, V2_rank, V2_power,
						    V2_avatar_id,
						    V2_face_update_time,
						    V2_face_file},
						   _B15}
					  end),
    {ok, {V1_rank, V1_best_rank, V1_rank_list}};
unpack(24310, srv, _B0) -> {ok, {}};
unpack(24310, cli, _B0) ->
    {V1_replay_srv_id, _B1} = protocol:string(_B0),
    {V1_log_list, _B20} = protocol:array(_B1,
					 fun (_B2) ->
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
						 {V2_avatar_id, _B9} =
						     protocol:uint32(_B8),
						 {V2_power, _B10} =
						     protocol:uint32(_B9),
						 {V2_type, _B11} =
						     protocol:uint8(_B10),
						 {V2_ret, _B12} =
						     protocol:uint8(_B11),
						 {V2_rank_type, _B13} =
						     protocol:uint8(_B12),
						 {V2_rank, _B14} =
						     protocol:uint32(_B13),
						 {V2_replay_id, _B15} =
						     protocol:uint32(_B14),
						 {V2_time, _B16} =
						     protocol:uint32(_B15),
						 {V2_face_update_time, _B17} =
						     protocol:uint32(_B16),
						 {V2_face_file, _B18} =
						     protocol:string(_B17),
						 {{V2_rid, V2_srv_id, V2_name,
						   V2_lev, V2_sex, V2_face,
						   V2_avatar_id, V2_power,
						   V2_type, V2_ret,
						   V2_rank_type, V2_rank,
						   V2_replay_id, V2_time,
						   V2_face_update_time,
						   V2_face_file},
						  _B18}
					 end),
    {ok, {V1_replay_srv_id, V1_log_list}};
unpack(24311, srv, _B0) -> {ok, {}};
unpack(24311, cli, _B0) ->
    {V1_replay_srv_id, _B1} = protocol:string(_B0),
    {V1_log_list, _B21} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_atk_rid, _B3} =
						     protocol:uint32(_B2),
						 {V2_atk_srv_id, _B4} =
						     protocol:string(_B3),
						 {V2_atk_name, _B5} =
						     protocol:string(_B4),
						 {V2_atk_face, _B6} =
						     protocol:uint32(_B5),
						 {V2_atk_rank, _B7} =
						     protocol:uint32(_B6),
						 {V2_def_rid, _B8} =
						     protocol:uint32(_B7),
						 {V2_def_srv_id, _B9} =
						     protocol:string(_B8),
						 {V2_def_name, _B10} =
						     protocol:string(_B9),
						 {V2_def_face, _B11} =
						     protocol:uint32(_B10),
						 {V2_def_rank, _B12} =
						     protocol:uint32(_B11),
						 {V2_ret, _B13} =
						     protocol:uint8(_B12),
						 {V2_replay_id, _B14} =
						     protocol:uint32(_B13),
						 {V2_time, _B15} =
						     protocol:uint32(_B14),
						 {V2_atk_face_update_time,
						  _B16} =
						     protocol:uint32(_B15),
						 {V2_atk_face_file, _B17} =
						     protocol:string(_B16),
						 {V2_def_face_update_time,
						  _B18} =
						     protocol:uint32(_B17),
						 {V2_def_face_file, _B19} =
						     protocol:string(_B18),
						 {{V2_atk_rid, V2_atk_srv_id,
						   V2_atk_name, V2_atk_face,
						   V2_atk_rank, V2_def_rid,
						   V2_def_srv_id, V2_def_name,
						   V2_def_face, V2_def_rank,
						   V2_ret, V2_replay_id,
						   V2_time,
						   V2_atk_face_update_time,
						   V2_atk_face_file,
						   V2_def_face_update_time,
						   V2_def_face_file},
						  _B19}
					 end),
    {ok, {V1_replay_srv_id, V1_log_list}};
unpack(24312, srv, _B0) -> {ok, {}};
unpack(24312, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(24313, srv, _B0) -> {ok, {}};
unpack(24313, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(24314, srv, _B0) -> {ok, {}};
unpack(24314, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(24315, srv, _B0) -> {ok, {}};
unpack(24315, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24316, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_pos, _B3} = protocol:uint8(_B2),
    {ok, {V1_rid, V1_srv_id, V1_pos}};
unpack(24316, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24317, srv, _B0) -> {ok, {}};
unpack(24317, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(24318, srv, _B0) ->
    {V1_replay_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_channel, _B3} = protocol:uint16(_B2),
    {V1_target_name, _B4} = protocol:string(_B3),
    {ok,
     {V1_replay_id, V1_srv_id, V1_channel, V1_target_name}};
unpack(24318, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


