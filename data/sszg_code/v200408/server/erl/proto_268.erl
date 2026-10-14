-file("src/proto/proto_268.erl", 1).

-module(proto_268).

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
		{guild_secret_area_rank, [ver, id, rank_detail]},
		{secret_rank, [ver, number, chapter_id, dps_list]},
		{role_rank,
		 [ver, r_id, lev, face_id, avatar_bid, name, dps, rank,
		  max_dps, power, face_update_time, face_file]},
		{guild_secret_area,
		 [ver, id, boss_detail, boss_list, number,
		  fail_boss_list, last_crusade]},
		{boss_detail,
		 [ver, bid, hp, max_hp, end_time, count_time,
		  kill_time]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/guild_secret_area.hrl", 1).

-record(boss_detail,
	{ver = 2  :: pos_integer(), bid = 0  :: pos_integer(),
	 hp = 0  :: pos_integer(), max_hp = 0  :: pos_integer(),
	 end_time = 0  :: pos_integer(),
	 count_time = 0  :: pos_integer(),
	 kill_time = 0  :: pos_integer()}).

-record(guild_secret_area,
	{ver = 2  :: pos_integer(),
	 id = {0, <<>>}  :: {pos_integer(), binary()},
	 boss_detail = #boss_detail{}  :: tuple(),
	 boss_list = []  :: list(), number = 0  :: pos_integer(),
	 fail_boss_list = []  :: pos_integer(),
	 last_crusade = 0  :: pos_integer()}).

-record(role_rank,
	{ver = 2  :: pos_integer(),
	 r_id = {0, <<>>}  :: tuple(), lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 rank = 0  :: pos_integer(),
	 max_dps = 0  :: pos_integer(),
	 power = 0  :: pos_integer(),
	 face_update_time = 0  :: pos_integer(),
	 face_file = <<>>  :: string()}).

-record(secret_rank,
	{ver = 1  :: pos_integer(),
	 number = 0  :: pos_integer(),
	 chapter_id = 0  :: pos_integer(),
	 dps_list = []  :: list()}).

-record(guild_secret_area_rank,
	{ver = 1  :: pos_integer(),
	 id = {0, <<>>}  :: {pos_integer(), binary()},
	 rank_detail = []  :: list()}).

-file("src/proto/proto_268.erl", 16).

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

-file("src/proto/proto_268.erl", 17).

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

-file("src/proto/proto_268.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(26800, cli, {}) -> {ok, <<2:32, 26800:16>>};
pack(26800, srv,
     {V0_count, V0_last_buy_time, V0_loss_list,
      #guild_secret_area{boss_detail =
			     #boss_detail{bid = V0_bid, hp = V0_hp,
					  max_hp = V0_max_hp,
					  end_time = V0_end_time,
					  count_time = V0_count_time},
			 boss_list = V0_boss_list},
      V0_progress_reward, V0_dps, V0_button, V0_is_reward}) ->
    D_a_t_a = <<V0_count:32, V0_last_buy_time:32,
		(length(V0_loss_list)):16,
		(list_to_binary([<<V1_loss_id:32, V1_num:32>>
				 || {V1_loss_id, V1_num}
					<- V0_loss_list]))/binary,
		V0_bid:32, V0_hp:32, V0_max_hp:32, V0_end_time:32,
		V0_count_time:32, (length(V0_boss_list)):16,
		(list_to_binary([<<V1_boss_id:32>>
				 || V1_boss_id <- V0_boss_list]))/binary,
		(length(V0_progress_reward)):16,
		(list_to_binary([<<V1_order:32>>
				 || V1_order <- V0_progress_reward]))/binary,
		V0_dps:32, V0_button:8, V0_is_reward:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26800:16,
       D_a_t_a/binary>>};
pack(26801, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26801:16,
       D_a_t_a/binary>>};
pack(26801, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26801:16,
       D_a_t_a/binary>>};
pack(26802, cli,
     {V0_boss_id, V0_formation_type, V0_pos_info,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_boss_id:32, V0_formation_type:16,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || #formation_pos{pos = V1_pos, id = V1_id}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26802:16,
       D_a_t_a/binary>>};
pack(26802, srv, {V0_flag, V0_msg, V0_combat_type}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_combat_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26802:16,
       D_a_t_a/binary>>};
pack(26803, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26803:16,
       D_a_t_a/binary>>};
pack(26803, srv,
     {V0_flag, V0_msg, V0_count, V0_last_buy_time}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32,
		V0_last_buy_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26803:16,
       D_a_t_a/binary>>};
pack(26804, cli, {V0_boss_id, V0_number}) ->
    D_a_t_a = <<V0_boss_id:32, V0_number:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26804:16,
       D_a_t_a/binary>>};
pack(26804, srv, {V0_flag, V0_msg, V0_number}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_number:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26804:16,
       D_a_t_a/binary>>};
pack(26805, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26805:16,
       D_a_t_a/binary>>};
pack(26805, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26805:16,
       D_a_t_a/binary>>};
pack(26806, cli, {V0_boss_id, V0_num}) ->
    D_a_t_a = <<V0_boss_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26806:16,
       D_a_t_a/binary>>};
pack(26806, srv, {V0_boss_id, V0_dps_list}) ->
    D_a_t_a = <<V0_boss_id:32, (length(V0_dps_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_lev:32, V1_face_id:32, V1_avatar_bid:32,
				   (protocol:pack(string, V1_name))/binary,
				   V1_dps:32, V1_rank:32, V1_max_dps:32,
				   V1_power:32, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #role_rank{r_id = {V1_rid, V1_srv_id},
					       lev = V1_lev,
					       face_id = V1_face_id,
					       avatar_bid = V1_avatar_bid,
					       name = V1_name, dps = V1_dps,
					       rank = V1_rank,
					       max_dps = V1_max_dps,
					       power = V1_power,
					       face_update_time =
						   V1_face_update_time,
					       face_file = V1_face_file}
					<- V0_dps_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26806:16,
       D_a_t_a/binary>>};
pack(26807, cli, {}) -> {ok, <<2:32, 26807:16>>};
pack(26807, srv, {V0_flag, V0_end_time}) ->
    D_a_t_a = <<V0_flag:8, V0_end_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26807:16,
       D_a_t_a/binary>>};
pack(26808, cli, {}) -> {ok, <<2:32, 26808:16>>};
pack(26808, srv,
     {V0_flag, V0_time, V0_market_reward, V0_boss_reward}) ->
    D_a_t_a = <<V0_flag:8, V0_time:32,
		(length(V0_market_reward)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num}
					<- V0_market_reward]))/binary,
		(length(V0_boss_reward)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num}
					<- V0_boss_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26808:16,
       D_a_t_a/binary>>};
pack(26809, cli, {}) -> {ok, <<2:32, 26809:16>>};
pack(26809, srv,
     {V0_result, V0_reward, V0_hurt_statistics}) ->
    D_a_t_a = <<V0_result:8, (length(V0_reward)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_reward]))/binary,
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
     <<(byte_size(D_a_t_a) + 2):32, 26809:16,
       D_a_t_a/binary>>};
pack(26810, cli, {}) -> {ok, <<2:32, 26810:16>>};
pack(26810, srv, {V0_vitality}) ->
    D_a_t_a = <<V0_vitality:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26810:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(26800, srv, _B0) -> {ok, {}};
unpack(26800, cli, _B0) ->
    {V1_count, _B1} = protocol:uint32(_B0),
    {V1_last_buy_time, _B2} = protocol:uint32(_B1),
    {V1_loss_list, _B7} = protocol:array(_B2,
					 fun (_B3) ->
						 {V2_loss_id, _B4} =
						     protocol:uint32(_B3),
						 {V2_num, _B5} =
						     protocol:uint32(_B4),
						 {{V2_loss_id, V2_num}, _B5}
					 end),
    {V1_bid, _B8} = protocol:uint32(_B7),
    {V1_hp, _B9} = protocol:uint32(_B8),
    {V1_max_hp, _B10} = protocol:uint32(_B9),
    {V1_end_time, _B11} = protocol:uint32(_B10),
    {V1_count_time, _B12} = protocol:uint32(_B11),
    {V1_boss_list, _B16} = protocol:array(_B12,
					  fun (_B13) ->
						  {V2_boss_id, _B14} =
						      protocol:uint32(_B13),
						  {V2_boss_id, _B14}
					  end),
    {V1_progress_reward, _B20} = protocol:array(_B16,
						fun (_B17) ->
							{V2_order, _B18} =
							    protocol:uint32(_B17),
							{V2_order, _B18}
						end),
    {V1_dps, _B21} = protocol:uint32(_B20),
    {V1_button, _B22} = protocol:uint8(_B21),
    {V1_is_reward, _B23} = protocol:uint8(_B22),
    {ok,
     {V1_count, V1_last_buy_time, V1_loss_list, V1_bid,
      V1_hp, V1_max_hp, V1_end_time, V1_count_time,
      V1_boss_list, V1_progress_reward, V1_dps, V1_button,
      V1_is_reward}};
unpack(26801, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(26801, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26802, srv, _B0) ->
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
unpack(26802, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_combat_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_combat_type}};
unpack(26803, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(26803, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {V1_last_buy_time, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_count, V1_last_buy_time}};
unpack(26804, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {V1_number, _B2} = protocol:uint32(_B1),
    {ok, {V1_boss_id, V1_number}};
unpack(26804, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_number, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_number}};
unpack(26805, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(26805, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26806, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_boss_id, V1_num}};
unpack(26806, cli, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {V1_dps_list, _B16} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_rid, _B3} =
						     protocol:uint32(_B2),
						 {V2_srv_id, _B4} =
						     protocol:string(_B3),
						 {V2_lev, _B5} =
						     protocol:uint32(_B4),
						 {V2_face_id, _B6} =
						     protocol:uint32(_B5),
						 {V2_avatar_bid, _B7} =
						     protocol:uint32(_B6),
						 {V2_name, _B8} =
						     protocol:string(_B7),
						 {V2_dps, _B9} =
						     protocol:uint32(_B8),
						 {V2_rank, _B10} =
						     protocol:uint32(_B9),
						 {V2_max_dps, _B11} =
						     protocol:uint32(_B10),
						 {V2_power, _B12} =
						     protocol:uint32(_B11),
						 {V2_face_update_time, _B13} =
						     protocol:uint32(_B12),
						 {V2_face_file, _B14} =
						     protocol:string(_B13),
						 {{V2_rid, V2_srv_id, V2_lev,
						   V2_face_id, V2_avatar_bid,
						   V2_name, V2_dps, V2_rank,
						   V2_max_dps, V2_power,
						   V2_face_update_time,
						   V2_face_file},
						  _B14}
					 end),
    {ok, {V1_boss_id, V1_dps_list}};
unpack(26807, srv, _B0) -> {ok, {}};
unpack(26807, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_flag, V1_end_time}};
unpack(26808, srv, _B0) -> {ok, {}};
unpack(26808, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_time, _B2} = protocol:uint32(_B1),
    {V1_market_reward, _B7} = protocol:array(_B2,
					     fun (_B3) ->
						     {V2_id, _B4} =
							 protocol:uint32(_B3),
						     {V2_num, _B5} =
							 protocol:uint32(_B4),
						     {{V2_id, V2_num}, _B5}
					     end),
    {V1_boss_reward, _B12} = protocol:array(_B7,
					    fun (_B8) ->
						    {V2_bid, _B9} =
							protocol:uint32(_B8),
						    {V2_num, _B10} =
							protocol:uint32(_B9),
						    {{V2_bid, V2_num}, _B10}
					    end),
    {ok,
     {V1_flag, V1_time, V1_market_reward, V1_boss_reward}};
unpack(26809, srv, _B0) -> {ok, {}};
unpack(26809, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_reward, _B6} = protocol:array(_B1,
				      fun (_B2) ->
					      {V2_bid, _B3} =
						  protocol:uint32(_B2),
					      {V2_num, _B4} =
						  protocol:uint32(_B3),
					      {{V2_bid, V2_num}, _B4}
				      end),
    {V1_hurt_statistics, _B28} = protocol:array(_B6,
						fun (_B7) ->
							{V2_type, _B8} =
							    protocol:uint8(_B7),
							{V2_partner_hurts,
							 _B26} =
							    protocol:array(_B8,
									   fun
									     (_B9) ->
										 {V3_rid,
										  _B10} =
										     protocol:uint32(_B9),
										 {V3_srvid,
										  _B11} =
										     protocol:string(_B10),
										 {V3_id,
										  _B12} =
										     protocol:uint32(_B11),
										 {V3_bid,
										  _B13} =
										     protocol:uint32(_B12),
										 {V3_star,
										  _B14} =
										     protocol:uint32(_B13),
										 {V3_lev,
										  _B15} =
										     protocol:uint32(_B14),
										 {V3_camp_type,
										  _B16} =
										     protocol:uint32(_B15),
										 {V3_dps,
										  _B17} =
										     protocol:uint32(_B16),
										 {V3_cure,
										  _B18} =
										     protocol:uint32(_B17),
										 {V3_ext_data,
										  _B23} =
										     protocol:array(_B18,
												    fun
												      (_B19) ->
													  {V4_key,
													   _B20} =
													      protocol:uint32(_B19),
													  {V4_val,
													   _B21} =
													      protocol:uint32(_B20),
													  {{V4_key,
													    V4_val},
													   _B21}
												    end),
										 {V3_be_hurt,
										  _B24} =
										     protocol:uint32(_B23),
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
										  _B24}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B26}
						end),
    {ok, {V1_result, V1_reward, V1_hurt_statistics}};
unpack(26810, srv, _B0) -> {ok, {}};
unpack(26810, cli, _B0) ->
    {V1_vitality, _B1} = protocol:uint32(_B0),
    {ok, {V1_vitality}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


