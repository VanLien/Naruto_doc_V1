-file("src/proto/proto_286.erl", 1).

-module(proto_286).

-lager_records([{item_make_args,
		 [base_id, bind, quantity, step, flag]},
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
		{planes_load_partner,
		 [ver, pos, bid, lev, name, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{planes_evt_data,
		 [id, type, ext, reward_list, exchange_id, group_id]},
		{planes_tile,
		 [ver, label, evt_id, ext, defend_radio, is_hide,
		  is_walk, is_business, combat_power]},
		{planes_floor,
		 [ver, floor, difficulty, map_id, line, index, tile_list,
		  is_reward, is_can_reward, is_treasure, fight_ids]},
		{m_planes,
		 [ver, floor, floor_list, update_time, partners_hp_radio,
		  buffs, buffs_ext, session_ids, load_partners,
		  load_partners_next_id, dun_power, formation, is_pass,
		  reward_list, is_spar]},
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

-file("src/proto/proto_286.erl", 16).

-file("inc/planes.hrl", 1).

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

-file("inc/planes.hrl", 7).

-record(m_planes,
	{ver = 2  :: pos_integer(), floor = 0  :: pos_integer(),
	 floor_list = []  :: list(),
	 update_time = 0  :: pos_integer(),
	 partners_hp_radio = []  :: list(),
	 buffs = []  :: list(), buffs_ext = []  :: list(),
	 session_ids = []  :: list(),
	 load_partners = []  :: list(),
	 load_partners_next_id = 1  :: pos_integer(),
	 dun_power = 0  :: pos_integer(),
	 formation = {1, [], 0}  :: tuple(),
	 is_pass = 0  :: boolean(), reward_list = []  :: list(),
	 is_spar = 0  :: pos_integer()}).

-record(planes_floor,
	{ver = 1  :: pos_integer(), floor = 1  :: pos_integer(),
	 difficulty = 1  :: pos_integer(),
	 map_id  :: pos_integer(), line = 1  :: pos_integer(),
	 index = 0  :: pos_integer(), tile_list = []  :: list(),
	 is_reward = 0  :: boolean(),
	 is_can_reward = 0  :: boolean(),
	 is_treasure = 0  :: boolean(),
	 fight_ids = []  :: list()}).

-record(planes_tile,
	{ver = 1  :: pos_integer(), label = {1, 1}  :: tuple(),
	 evt_id = 0  :: pos_integer(), ext = []  :: list(),
	 defend_radio = []  :: list(), is_hide = 0  :: boolean(),
	 is_walk = 0  :: boolean(),
	 is_business = 0  :: boolean(),
	 combat_power = 0  :: pos_integer()}).

-record(planes_evt_data,
	{id = 0  :: pos_integer(), type = 0  :: pos_integer(),
	 ext = []  :: list(), reward_list = []  :: list(),
	 exchange_id = 0  :: pos_integer(),
	 group_id = 0  :: pos_integer()}).

-record(planes_load_partner,
	{ver = 1  :: pos_integer(), pos = 1  :: pos_integer(),
	 bid = 1  :: pos_integer(), lev = 1  :: pos_integer(),
	 name = <<>>  :: binary(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/proto/proto_286.erl", 17).

-file("inc/combat.hrl", 1).

-file("inc/common.hrl", 1).

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

-file("src/proto/proto_286.erl", 18).

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

-file("src/proto/proto_286.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(28600, cli,
     {V0_line, V0_index, V0_action, V0_ext_list}) ->
    D_a_t_a = <<V0_line:32, V0_index:32, V0_action:8,
		(length(V0_ext_list)):16,
		(list_to_binary([<<V1_type:8, V1_val1:32, V1_val2:32>>
				 || {V1_type, V1_val1, V1_val2}
					<- V0_ext_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28600:16,
       D_a_t_a/binary>>};
pack(28600, srv,
     {V0_code, V0_msg, V0_line, V0_index, V0_action}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_line:32,
		V0_index:32, V0_action:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28600:16,
       D_a_t_a/binary>>};
pack(28601, cli, {}) -> {ok, <<2:32, 28601:16>>};
pack(28601, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28601:16,
       D_a_t_a/binary>>};
pack(28602, cli, {}) -> {ok, <<2:32, 28602:16>>};
pack(28602, srv,
     {V0_update_time, V0_look_id, V0_list, V0_is_holiday}) ->
    D_a_t_a = <<V0_update_time:32, V0_look_id:32,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_list]))/binary,
		V0_is_holiday:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28602:16,
       D_a_t_a/binary>>};
pack(28603, cli, {}) -> {ok, <<2:32, 28603:16>>};
pack(28603, srv,
     {V0_floor, V0_line, V0_index, V0_map_id, V0_tile_list,
      V0_is_can_reward, V0_is_reward}) ->
    D_a_t_a = <<V0_floor:32, V0_line:32, V0_index:32,
		V0_map_id:32, (length(V0_tile_list)):16,
		(list_to_binary([<<V1_line:32, V1_index:32,
				   V1_evt_id:32, V1_is_hide:8, V1_is_walk:8,
				   V1_combat_power:32>>
				 || #planes_tile{label = {V1_line, V1_index},
						 evt_id = V1_evt_id,
						 is_hide = V1_is_hide,
						 is_walk = V1_is_walk,
						 combat_power = V1_combat_power}
					<- V0_tile_list]))/binary,
		V0_is_can_reward:8, V0_is_reward:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28603:16,
       D_a_t_a/binary>>};
pack(28604, cli, {V0_floor, V0_difficulty}) ->
    D_a_t_a = <<V0_floor:32, V0_difficulty:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28604:16,
       D_a_t_a/binary>>};
pack(28604, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28604:16,
       D_a_t_a/binary>>};
pack(28605, cli, {V0_floor}) ->
    D_a_t_a = <<V0_floor:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28605:16,
       D_a_t_a/binary>>};
pack(28605, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28605:16,
       D_a_t_a/binary>>};
pack(28606, cli, {}) -> {ok, <<2:32, 28606:16>>};
pack(28606, srv,
     {V0_floor, V0_line, V0_index, V0_tile_list}) ->
    D_a_t_a = <<V0_floor:32, V0_line:32, V0_index:32,
		(length(V0_tile_list)):16,
		(list_to_binary([<<V1_line:32, V1_index:32,
				   V1_evt_id:32, V1_is_hide:8, V1_is_walk:8,
				   V1_combat_power:32>>
				 || #planes_tile{label = {V1_line, V1_index},
						 evt_id = V1_evt_id,
						 is_hide = V1_is_hide,
						 is_walk = V1_is_walk,
						 combat_power = V1_combat_power}
					<- V0_tile_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28606:16,
       D_a_t_a/binary>>};
pack(28607, cli, {}) -> {ok, <<2:32, 28607:16>>};
pack(28607, srv,
     {V0_power, V0_buffs, V0_rid, V0_srv_id, V0_name,
      V0_face, V0_lev, V0_guards_power, V0_formation_type,
      V0_guards, V0_sprites, V0_hallows_id, V0_sprite_lev,
      V0_strength, V0_face_update_time, V0_face_file,
      V0_is_spar}) ->
    D_a_t_a = <<V0_power:32, (length(V0_buffs)):16,
		(list_to_binary([<<V1_quality:8, V1_num:32>>
				 || {V1_quality, V1_num} <- V0_buffs]))/binary,
		V0_rid:32, (protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_face:32,
		V0_lev:8, V0_guards_power:32, V0_formation_type:32,
		(length(V0_guards)):16,
		(list_to_binary([<<V1_partner_id:32, V1_pos:8,
				   V1_bid:32, V1_lev:16, V1_star:8,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary,
				   V1_hp_per:8, V1_hp_max:32, V1_atk:32,
				   V1_guards_power:32>>
				 || {V1_partner_id, V1_pos, V1_bid, V1_lev,
				     V1_star, V1_ext_data, V1_hp_per, V1_hp_max,
				     V1_atk, V1_guards_power}
					<- V0_guards]))/binary,
		(length(V0_sprites)):16,
		(list_to_binary([<<V1_pos:8, V1_item_bid:32>>
				 || {V1_pos, V1_item_bid}
					<- V0_sprites]))/binary,
		V0_hallows_id:32, V0_sprite_lev:32, V0_strength:32,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary,
		V0_is_spar:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28607:16,
       D_a_t_a/binary>>};
pack(28608, cli, {}) -> {ok, <<2:32, 28608:16>>};
pack(28608, srv,
     {V0_result, V0_all_dps, V0_best_partner, V0_bid, V0_lev,
      V0_star, V0_use_skin, V0_target_role_name,
      V0_hurt_statistics, V0_award_list, {V0_line, V0_index},
      V0_replay_id}) ->
    D_a_t_a = <<V0_result:8, V0_all_dps:32,
		V0_best_partner:32, V0_bid:32, V0_lev:16, V0_star:8,
		V0_use_skin:32,
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
		(length(V0_award_list)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_award_list]))/binary,
		V0_line:32, V0_index:32, V0_replay_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28608:16,
       D_a_t_a/binary>>};
pack(28609, cli, {}) -> {ok, <<2:32, 28609:16>>};
pack(28609, srv, {V0_partners}) ->
    D_a_t_a = <<(length(V0_partners)):16,
		(list_to_binary([<<V1_flag:8, V1_partner_id:32,
				   V1_hp_per:8>>
				 || {V1_flag, V1_partner_id, V1_hp_per}
					<- V0_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28609:16,
       D_a_t_a/binary>>};
pack(28610, cli, {V0_partner_ids}) ->
    D_a_t_a = <<(length(V0_partner_ids)):16,
		(list_to_binary([<<V1_flag:8, V1_id:32>>
				 || {V1_flag, V1_id}
					<- V0_partner_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28610:16,
       D_a_t_a/binary>>};
pack(28610, srv, {V0_power}) ->
    D_a_t_a = <<V0_power:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28610:16,
       D_a_t_a/binary>>};
pack(28611, cli,
     {V0_formation_type, V0_pos_info, V0_hallows_id}) ->
    D_a_t_a = <<V0_formation_type:8,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32, V1_flag:8>>
				 || {V1_pos, V1_id, V1_flag}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28611:16,
       D_a_t_a/binary>>};
pack(28611, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28611:16,
       D_a_t_a/binary>>};
pack(28612, cli, {}) -> {ok, <<2:32, 28612:16>>};
pack(28612, srv,
     {V0_formation_type, V0_pos_info, V0_hallows_id}) ->
    D_a_t_a = <<V0_formation_type:8,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32, V1_flag:8>>
				 || {V1_pos, V1_id, V1_flag}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28612:16,
       D_a_t_a/binary>>};
pack(28613, cli, {}) -> {ok, <<2:32, 28613:16>>};
pack(28613, srv, {V0_partners}) ->
    D_a_t_a = <<(length(V0_partners)):16,
		(list_to_binary([<<V1_flag:8, V1_partner_id:32,
				   V1_bid:32, V1_lev:16, V1_star:8, V1_power:32,
				   V1_hp_per:8, (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_flag, V1_partner_id, V1_bid, V1_lev,
				     V1_star, V1_power, V1_hp_per, V1_ext_data}
					<- V0_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28613:16,
       D_a_t_a/binary>>};
pack(28614, cli, {}) -> {ok, <<2:32, 28614:16>>};
pack(28614, srv,
     {V0_floor, {V0_line, V0_index}, V0_ext_list}) ->
    D_a_t_a = <<V0_floor:32, V0_line:32, V0_index:32,
		(length(V0_ext_list)):16,
		(list_to_binary([<<V1_type:32, V1_val1:32, V1_val2:32>>
				 || {V1_type, V1_val1, V1_val2}
					<- V0_ext_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28614:16,
       D_a_t_a/binary>>};
pack(28615, cli, {}) -> {ok, <<2:32, 28615:16>>};
pack(28615, srv, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28615:16,
       D_a_t_a/binary>>};
pack(28616, cli, {}) -> {ok, <<2:32, 28616:16>>};
pack(28616, srv,
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
     <<(byte_size(D_a_t_a) + 2):32, 28616:16,
       D_a_t_a/binary>>};
pack(28617, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28617:16,
       D_a_t_a/binary>>};
pack(28617, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28617:16,
       D_a_t_a/binary>>};
pack(28618, cli, {}) -> {ok, <<2:32, 28618:16>>};
pack(28618, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28618:16,
       D_a_t_a/binary>>};
pack(28619, cli, {}) -> {ok, <<2:32, 28619:16>>};
pack(28619, srv, {V0_is_pop, V0_cur_day}) ->
    D_a_t_a = <<V0_is_pop:8, V0_cur_day:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28619:16,
       D_a_t_a/binary>>};
pack(28620, cli, {}) -> {ok, <<2:32, 28620:16>>};
pack(28620, srv, {V0_buffs}) ->
    D_a_t_a = <<(length(V0_buffs)):16,
		(list_to_binary([<<V1_buff_id:32>>
				 || V1_buff_id <- V0_buffs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28620:16,
       D_a_t_a/binary>>};
pack(28621, cli, {}) -> {ok, <<2:32, 28621:16>>};
pack(28621, srv,
     {V0_item_list, V0_is_select, {V0_line, V0_index}}) ->
    D_a_t_a = <<(length(V0_item_list)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32, V1_is_flag:8>>
				 || {V1_pos, V1_id, V1_is_flag}
					<- V0_item_list]))/binary,
		V0_is_select:8, V0_line:32, V0_index:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28621:16,
       D_a_t_a/binary>>};
pack(28622, cli, {}) -> {ok, <<2:32, 28622:16>>};
pack(28622, srv,
     {{V0_line, V0_index}, V0_planes_load_partner}) ->
    D_a_t_a = <<V0_line:32, V0_index:32,
		(length(V0_planes_load_partner)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_star:8, (length(V1_break_skills)):16,
				   (list_to_binary([<<V2_pos:8,
						      V2_skill_bid:32>>
						    || {V2_pos, V2_skill_bid}
							   <- V1_break_skills]))/binary,
				   V1_break_lev:8, V1_power:32, V1_use_skin:32,
				   V1_end_time:32, V1_atk:32, V1_def_p:32,
				   V1_def_s:32, V1_hp:32, V1_speed:32,
				   V1_hit_rate:32, V1_dodge_rate:32,
				   V1_crit_rate:32, V1_crit_ratio:32,
				   V1_hit_magic:32, V1_dodge_magic:32,
				   V1_def:32, (length(V1_eqms)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32>>
						    || {V2_id, V2_base_id,
							V2_type}
							   <- V1_eqms]))/binary,
				   (length(V1_artifacts)):16,
				   (list_to_binary([<<V2_artifact_pos:8,
						      V2_id:32, V2_base_id:32,
						      V2_enchant:32,
						      (length(V2_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_attr]))/binary,
						      (length(V2_extra_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_extra_attr]))/binary,
						      (length(V2_extra)):16,
						      (list_to_binary([<<V3_extra_k:32,
									 V3_extra_v:32>>
								       || {V3_extra_k,
									   V3_extra_v}
									      <- V2_extra]))/binary>>
						    || {V2_artifact_pos,
							#item{id = V2_id,
							      base_id =
								  V2_base_id,
							      enchant =
								  V2_enchant,
							      attr = V2_attr,
							      extra_attr =
								  V2_extra_attr,
							      extra = V2_extra}}
							   <- V1_artifacts]))/binary,
				   (length(V1_holy_eqm)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      (length(V2_main_attr)):16,
						      (list_to_binary([<<V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_attr_id,
									   V3_attr_val}
									      <- V2_main_attr]))/binary,
						      (length(V2_holy_eqm_attr)):16,
						      (list_to_binary([<<V3_pos:8,
									 V3_attr_id:32,
									 V3_attr_val:32>>
								       || {V3_pos,
									   V3_attr_id,
									   V3_attr_val}
									      <- V2_holy_eqm_attr]))/binary>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     main_attr =
								 V2_main_attr,
							     holy_eqm_attr =
								 V2_holy_eqm_attr}
							   <- V1_holy_eqm]))/binary,
				   (length(V1_dower_skill)):16,
				   (list_to_binary([<<V2_pos:8, V2_skill_id:32>>
						    || {V2_pos, V2_skill_id}
							   <- V1_dower_skill]))/binary>>
				 || #planes_load_partner{pos = V1_pos,
							 bid = V1_bid,
							 lev = V1_lev,
							 star = V1_star,
							 break_skills =
							     V1_break_skills,
							 break_lev =
							     V1_break_lev,
							 power = V1_power,
							 use_skin = V1_use_skin,
							 end_time = V1_end_time,
							 all_attr =
							     #attr{atk = V1_atk,
								   def_p =
								       V1_def_p,
								   def_s =
								       V1_def_s,
								   hp_max =
								       V1_hp,
								   speed =
								       V1_speed,
								   hit_rate =
								       V1_hit_rate,
								   dodge_rate =
								       V1_dodge_rate,
								   crit_rate =
								       V1_crit_rate,
								   crit_ratio =
								       V1_crit_ratio,
								   hit_magic =
								       V1_hit_magic,
								   dodge_magic =
								       V1_dodge_magic,
								   def =
								       V1_def},
							 eqms = V1_eqms,
							 artifacts =
							     V1_artifacts,
							 holy_eqm = V1_holy_eqm,
							 dower_skill =
							     V1_dower_skill}
					<- V0_planes_load_partner]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28622:16,
       D_a_t_a/binary>>};
pack(28623, cli, {V0_pos}) ->
    D_a_t_a = <<V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28623:16,
       D_a_t_a/binary>>};
pack(28623, srv,
     {#planes_load_partner{pos = V0_pos, bid = V0_bid,
			   lev = V0_lev, star = V0_star, skills = V0_skills,
			   break_lev = V0_break_lev, power = V0_power,
			   use_skin = V0_use_skin, end_time = V0_end_time,
			   base_attr =
			       #attr{atk = V0_atk, def_p = V0_def_p,
				     def_s = V0_def_s, hp_max = V0_hp,
				     speed = V0_speed, hit_rate = V0_hit_rate,
				     dodge_rate = V0_dodge_rate,
				     crit_rate = V0_crit_rate,
				     crit_ratio = V0_crit_ratio,
				     hit_magic = V0_hit_magic,
				     dodge_magic = V0_dodge_magic,
				     def = V0_def},
			   eqms = V0_eqms, artifacts = V0_artifacts,
			   holy_eqm = V0_holy_eqm,
			   dower_skill = V0_dower_skill}}) ->
    D_a_t_a = <<V0_pos:32, V0_bid:32, V0_lev:16, V0_star:8,
		(length(V0_skills)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_bid:32>>
				 || {V1_pos, V1_skill_bid}
					<- V0_skills]))/binary,
		V0_break_lev:8, V0_power:32, V0_use_skin:32,
		V0_end_time:32, V0_atk:32, V0_def_p:32, V0_def_s:32,
		V0_hp:32, V0_speed:32, V0_hit_rate:32, V0_dodge_rate:32,
		V0_crit_rate:32, V0_crit_ratio:32, V0_hit_magic:32,
		V0_dodge_magic:32, V0_def:32, (length(V0_eqms)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_type:32>>
				 || {V1_id, V1_base_id, V1_type}
					<- V0_eqms]))/binary,
		(length(V0_artifacts)):16,
		(list_to_binary([<<V1_artifact_pos:8, V1_id:32,
				   V1_base_id:32, V1_enchant:32,
				   (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary>>
				 || {V1_artifact_pos,
				     #item{id = V1_id, base_id = V1_base_id,
					   enchant = V1_enchant, attr = V1_attr,
					   extra_attr = V1_extra_attr,
					   extra = V1_extra}}
					<- V0_artifacts]))/binary,
		(length(V0_holy_eqm)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32,
				   (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   (length(V1_holy_eqm_attr)):16,
				   (list_to_binary([<<V2_pos:8, V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_pos, V2_attr_id,
							V2_attr_val}
							   <- V1_holy_eqm_attr]))/binary>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  main_attr = V1_main_attr,
					  holy_eqm_attr = V1_holy_eqm_attr}
					<- V0_holy_eqm]))/binary,
		(length(V0_dower_skill)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_id:32>>
				 || {V1_pos, V1_skill_id}
					<- V0_dower_skill]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28623:16,
       D_a_t_a/binary>>};
pack(28624, cli, {}) -> {ok, <<2:32, 28624:16>>};
pack(28624, srv, {V0_is_can_reward, V0_is_reward}) ->
    D_a_t_a = <<V0_is_can_reward:8, V0_is_reward:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28624:16,
       D_a_t_a/binary>>};
pack(28625, cli, {}) -> {ok, <<2:32, 28625:16>>};
pack(28625, srv, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28625:16,
       D_a_t_a/binary>>};
pack(28626, cli, {}) -> {ok, <<2:32, 28626:16>>};
pack(28626, srv, {}) -> {ok, <<2:32, 28626:16>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(28600, srv, _B0) ->
    {V1_line, _B1} = protocol:uint32(_B0),
    {V1_index, _B2} = protocol:uint32(_B1),
    {V1_action, _B3} = protocol:uint8(_B2),
    {V1_ext_list, _B9} = protocol:array(_B3,
					fun (_B4) ->
						{V2_type, _B5} =
						    protocol:uint8(_B4),
						{V2_val1, _B6} =
						    protocol:uint32(_B5),
						{V2_val2, _B7} =
						    protocol:uint32(_B6),
						{{V2_type, V2_val1, V2_val2},
						 _B7}
					end),
    {ok, {V1_line, V1_index, V1_action, V1_ext_list}};
unpack(28600, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_line, _B3} = protocol:uint32(_B2),
    {V1_index, _B4} = protocol:uint32(_B3),
    {V1_action, _B5} = protocol:uint8(_B4),
    {ok, {V1_code, V1_msg, V1_line, V1_index, V1_action}};
unpack(28601, srv, _B0) -> {ok, {}};
unpack(28601, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(28602, srv, _B0) -> {ok, {}};
unpack(28602, cli, _B0) ->
    {V1_update_time, _B1} = protocol:uint32(_B0),
    {V1_look_id, _B2} = protocol:uint32(_B1),
    {V1_list, _B6} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {V2_id, _B4}
				    end),
    {V1_is_holiday, _B7} = protocol:uint8(_B6),
    {ok,
     {V1_update_time, V1_look_id, V1_list, V1_is_holiday}};
unpack(28603, srv, _B0) -> {ok, {}};
unpack(28603, cli, _B0) ->
    {V1_floor, _B1} = protocol:uint32(_B0),
    {V1_line, _B2} = protocol:uint32(_B1),
    {V1_index, _B3} = protocol:uint32(_B2),
    {V1_map_id, _B4} = protocol:uint32(_B3),
    {V1_tile_list, _B13} = protocol:array(_B4,
					  fun (_B5) ->
						  {V2_line, _B6} =
						      protocol:uint32(_B5),
						  {V2_index, _B7} =
						      protocol:uint32(_B6),
						  {V2_evt_id, _B8} =
						      protocol:uint32(_B7),
						  {V2_is_hide, _B9} =
						      protocol:uint8(_B8),
						  {V2_is_walk, _B10} =
						      protocol:uint8(_B9),
						  {V2_combat_power, _B11} =
						      protocol:uint32(_B10),
						  {{V2_line, V2_index,
						    V2_evt_id, V2_is_hide,
						    V2_is_walk,
						    V2_combat_power},
						   _B11}
					  end),
    {V1_is_can_reward, _B14} = protocol:uint8(_B13),
    {V1_is_reward, _B15} = protocol:uint8(_B14),
    {ok,
     {V1_floor, V1_line, V1_index, V1_map_id, V1_tile_list,
      V1_is_can_reward, V1_is_reward}};
unpack(28604, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint32(_B0),
    {V1_difficulty, _B2} = protocol:uint8(_B1),
    {ok, {V1_floor, V1_difficulty}};
unpack(28604, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(28605, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint32(_B0),
    {ok, {V1_floor}};
unpack(28605, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(28606, srv, _B0) -> {ok, {}};
unpack(28606, cli, _B0) ->
    {V1_floor, _B1} = protocol:uint32(_B0),
    {V1_line, _B2} = protocol:uint32(_B1),
    {V1_index, _B3} = protocol:uint32(_B2),
    {V1_tile_list, _B12} = protocol:array(_B3,
					  fun (_B4) ->
						  {V2_line, _B5} =
						      protocol:uint32(_B4),
						  {V2_index, _B6} =
						      protocol:uint32(_B5),
						  {V2_evt_id, _B7} =
						      protocol:uint32(_B6),
						  {V2_is_hide, _B8} =
						      protocol:uint8(_B7),
						  {V2_is_walk, _B9} =
						      protocol:uint8(_B8),
						  {V2_combat_power, _B10} =
						      protocol:uint32(_B9),
						  {{V2_line, V2_index,
						    V2_evt_id, V2_is_hide,
						    V2_is_walk,
						    V2_combat_power},
						   _B10}
					  end),
    {ok, {V1_floor, V1_line, V1_index, V1_tile_list}};
unpack(28607, srv, _B0) -> {ok, {}};
unpack(28607, cli, _B0) ->
    {V1_power, _B1} = protocol:uint32(_B0),
    {V1_buffs, _B6} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_quality, _B3} =
						 protocol:uint8(_B2),
					     {V2_num, _B4} =
						 protocol:uint32(_B3),
					     {{V2_quality, V2_num}, _B4}
				     end),
    {V1_rid, _B7} = protocol:uint32(_B6),
    {V1_srv_id, _B8} = protocol:string(_B7),
    {V1_name, _B9} = protocol:string(_B8),
    {V1_face, _B10} = protocol:uint32(_B9),
    {V1_lev, _B11} = protocol:uint8(_B10),
    {V1_guards_power, _B12} = protocol:uint32(_B11),
    {V1_formation_type, _B13} = protocol:uint32(_B12),
    {V1_guards, _B30} = protocol:array(_B13,
				       fun (_B14) ->
					       {V2_partner_id, _B15} =
						   protocol:uint32(_B14),
					       {V2_pos, _B16} =
						   protocol:uint8(_B15),
					       {V2_bid, _B17} =
						   protocol:uint32(_B16),
					       {V2_lev, _B18} =
						   protocol:uint16(_B17),
					       {V2_star, _B19} =
						   protocol:uint8(_B18),
					       {V2_ext_data, _B24} =
						   protocol:array(_B19,
								  fun (_B20) ->
									  {V3_key,
									   _B21} =
									      protocol:uint32(_B20),
									  {V3_val,
									   _B22} =
									      protocol:uint32(_B21),
									  {{V3_key,
									    V3_val},
									   _B22}
								  end),
					       {V2_hp_per, _B25} =
						   protocol:uint8(_B24),
					       {V2_hp_max, _B26} =
						   protocol:uint32(_B25),
					       {V2_atk, _B27} =
						   protocol:uint32(_B26),
					       {V2_guards_power, _B28} =
						   protocol:uint32(_B27),
					       {{V2_partner_id, V2_pos, V2_bid,
						 V2_lev, V2_star, V2_ext_data,
						 V2_hp_per, V2_hp_max, V2_atk,
						 V2_guards_power},
						_B28}
				       end),
    {V1_sprites, _B35} = protocol:array(_B30,
					fun (_B31) ->
						{V2_pos, _B32} =
						    protocol:uint8(_B31),
						{V2_item_bid, _B33} =
						    protocol:uint32(_B32),
						{{V2_pos, V2_item_bid}, _B33}
					end),
    {V1_hallows_id, _B36} = protocol:uint32(_B35),
    {V1_sprite_lev, _B37} = protocol:uint32(_B36),
    {V1_strength, _B38} = protocol:uint32(_B37),
    {V1_face_update_time, _B39} = protocol:uint32(_B38),
    {V1_face_file, _B40} = protocol:string(_B39),
    {V1_is_spar, _B41} = protocol:uint8(_B40),
    {ok,
     {V1_power, V1_buffs, V1_rid, V1_srv_id, V1_name,
      V1_face, V1_lev, V1_guards_power, V1_formation_type,
      V1_guards, V1_sprites, V1_hallows_id, V1_sprite_lev,
      V1_strength, V1_face_update_time, V1_face_file,
      V1_is_spar}};
unpack(28608, srv, _B0) -> {ok, {}};
unpack(28608, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_all_dps, _B2} = protocol:uint32(_B1),
    {V1_best_partner, _B3} = protocol:uint32(_B2),
    {V1_bid, _B4} = protocol:uint32(_B3),
    {V1_lev, _B5} = protocol:uint16(_B4),
    {V1_star, _B6} = protocol:uint8(_B5),
    {V1_use_skin, _B7} = protocol:uint32(_B6),
    {V1_target_role_name, _B8} = protocol:string(_B7),
    {V1_hurt_statistics, _B30} = protocol:array(_B8,
						fun (_B9) ->
							{V2_type, _B10} =
							    protocol:uint8(_B9),
							{V2_partner_hurts,
							 _B28} =
							    protocol:array(_B10,
									   fun
									     (_B11) ->
										 {V3_rid,
										  _B12} =
										     protocol:uint32(_B11),
										 {V3_srvid,
										  _B13} =
										     protocol:string(_B12),
										 {V3_id,
										  _B14} =
										     protocol:uint32(_B13),
										 {V3_bid,
										  _B15} =
										     protocol:uint32(_B14),
										 {V3_star,
										  _B16} =
										     protocol:uint32(_B15),
										 {V3_lev,
										  _B17} =
										     protocol:uint32(_B16),
										 {V3_camp_type,
										  _B18} =
										     protocol:uint32(_B17),
										 {V3_dps,
										  _B19} =
										     protocol:uint32(_B18),
										 {V3_cure,
										  _B20} =
										     protocol:uint32(_B19),
										 {V3_ext_data,
										  _B25} =
										     protocol:array(_B20,
												    fun
												      (_B21) ->
													  {V4_key,
													   _B22} =
													      protocol:uint32(_B21),
													  {V4_val,
													   _B23} =
													      protocol:uint32(_B22),
													  {{V4_key,
													    V4_val},
													   _B23}
												    end),
										 {V3_be_hurt,
										  _B26} =
										     protocol:uint32(_B25),
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
										  _B26}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B28}
						end),
    {V1_award_list, _B35} = protocol:array(_B30,
					   fun (_B31) ->
						   {V2_bid, _B32} =
						       protocol:uint32(_B31),
						   {V2_num, _B33} =
						       protocol:uint32(_B32),
						   {{V2_bid, V2_num}, _B33}
					   end),
    {V1_line, _B36} = protocol:uint32(_B35),
    {V1_index, _B37} = protocol:uint32(_B36),
    {V1_replay_id, _B38} = protocol:uint32(_B37),
    {ok,
     {V1_result, V1_all_dps, V1_best_partner, V1_bid, V1_lev,
      V1_star, V1_use_skin, V1_target_role_name,
      V1_hurt_statistics, V1_award_list, V1_line, V1_index,
      V1_replay_id}};
unpack(28609, srv, _B0) -> {ok, {}};
unpack(28609, cli, _B0) ->
    {V1_partners, _B6} = protocol:array(_B0,
					fun (_B1) ->
						{V2_flag, _B2} =
						    protocol:uint8(_B1),
						{V2_partner_id, _B3} =
						    protocol:uint32(_B2),
						{V2_hp_per, _B4} =
						    protocol:uint8(_B3),
						{{V2_flag, V2_partner_id,
						  V2_hp_per},
						 _B4}
					end),
    {ok, {V1_partners}};
unpack(28610, srv, _B0) ->
    {V1_partner_ids, _B5} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_flag, _B2} =
						       protocol:uint8(_B1),
						   {V2_id, _B3} =
						       protocol:uint32(_B2),
						   {{V2_flag, V2_id}, _B3}
					   end),
    {ok, {V1_partner_ids}};
unpack(28610, cli, _B0) ->
    {V1_power, _B1} = protocol:uint32(_B0),
    {ok, {V1_power}};
unpack(28611, srv, _B0) ->
    {V1_formation_type, _B1} = protocol:uint8(_B0),
    {V1_pos_info, _B7} = protocol:array(_B1,
					fun (_B2) ->
						{V2_pos, _B3} =
						    protocol:uint8(_B2),
						{V2_id, _B4} =
						    protocol:uint32(_B3),
						{V2_flag, _B5} =
						    protocol:uint8(_B4),
						{{V2_pos, V2_id, V2_flag}, _B5}
					end),
    {V1_hallows_id, _B8} = protocol:uint32(_B7),
    {ok, {V1_formation_type, V1_pos_info, V1_hallows_id}};
unpack(28611, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(28612, srv, _B0) -> {ok, {}};
unpack(28612, cli, _B0) ->
    {V1_formation_type, _B1} = protocol:uint8(_B0),
    {V1_pos_info, _B7} = protocol:array(_B1,
					fun (_B2) ->
						{V2_pos, _B3} =
						    protocol:uint8(_B2),
						{V2_id, _B4} =
						    protocol:uint32(_B3),
						{V2_flag, _B5} =
						    protocol:uint8(_B4),
						{{V2_pos, V2_id, V2_flag}, _B5}
					end),
    {V1_hallows_id, _B8} = protocol:uint32(_B7),
    {ok, {V1_formation_type, V1_pos_info, V1_hallows_id}};
unpack(28613, srv, _B0) -> {ok, {}};
unpack(28613, cli, _B0) ->
    {V1_partners, _B15} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_flag, _B2} =
						     protocol:uint8(_B1),
						 {V2_partner_id, _B3} =
						     protocol:uint32(_B2),
						 {V2_bid, _B4} =
						     protocol:uint32(_B3),
						 {V2_lev, _B5} =
						     protocol:uint16(_B4),
						 {V2_star, _B6} =
						     protocol:uint8(_B5),
						 {V2_power, _B7} =
						     protocol:uint32(_B6),
						 {V2_hp_per, _B8} =
						     protocol:uint8(_B7),
						 {V2_ext_data, _B13} =
						     protocol:array(_B8,
								    fun (_B9) ->
									    {V3_key,
									     _B10} =
										protocol:uint32(_B9),
									    {V3_val,
									     _B11} =
										protocol:uint32(_B10),
									    {{V3_key,
									      V3_val},
									     _B11}
								    end),
						 {{V2_flag, V2_partner_id,
						   V2_bid, V2_lev, V2_star,
						   V2_power, V2_hp_per,
						   V2_ext_data},
						  _B13}
					 end),
    {ok, {V1_partners}};
unpack(28614, srv, _B0) -> {ok, {}};
unpack(28614, cli, _B0) ->
    {V1_floor, _B1} = protocol:uint32(_B0),
    {V1_line, _B2} = protocol:uint32(_B1),
    {V1_index, _B3} = protocol:uint32(_B2),
    {V1_ext_list, _B9} = protocol:array(_B3,
					fun (_B4) ->
						{V2_type, _B5} =
						    protocol:uint32(_B4),
						{V2_val1, _B6} =
						    protocol:uint32(_B5),
						{V2_val2, _B7} =
						    protocol:uint32(_B6),
						{{V2_type, V2_val1, V2_val2},
						 _B7}
					end),
    {ok, {V1_floor, V1_line, V1_index, V1_ext_list}};
unpack(28615, srv, _B0) -> {ok, {}};
unpack(28615, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(28616, srv, _B0) -> {ok, {}};
unpack(28616, cli, _B0) ->
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
unpack(28617, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(28617, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(28618, srv, _B0) -> {ok, {}};
unpack(28618, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(28619, srv, _B0) -> {ok, {}};
unpack(28619, cli, _B0) ->
    {V1_is_pop, _B1} = protocol:uint8(_B0),
    {V1_cur_day, _B2} = protocol:uint32(_B1),
    {ok, {V1_is_pop, V1_cur_day}};
unpack(28620, srv, _B0) -> {ok, {}};
unpack(28620, cli, _B0) ->
    {V1_buffs, _B4} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_buff_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_buff_id, _B2}
				     end),
    {ok, {V1_buffs}};
unpack(28621, srv, _B0) -> {ok, {}};
unpack(28621, cli, _B0) ->
    {V1_item_list, _B6} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_pos, _B2} =
						     protocol:uint8(_B1),
						 {V2_id, _B3} =
						     protocol:uint32(_B2),
						 {V2_is_flag, _B4} =
						     protocol:uint8(_B3),
						 {{V2_pos, V2_id, V2_is_flag},
						  _B4}
					 end),
    {V1_is_select, _B7} = protocol:uint8(_B6),
    {V1_line, _B8} = protocol:uint32(_B7),
    {V1_index, _B9} = protocol:uint32(_B8),
    {ok, {V1_item_list, V1_is_select, V1_line, V1_index}};
unpack(28622, srv, _B0) -> {ok, {}};
unpack(28622, cli, _B0) ->
    {V1_line, _B1} = protocol:uint32(_B0),
    {V1_index, _B2} = protocol:uint32(_B1),
    {V1_planes_load_partner, _B79} = protocol:array(_B2,
						    fun (_B3) ->
							    {V2_pos, _B4} =
								protocol:uint8(_B3),
							    {V2_bid, _B5} =
								protocol:uint32(_B4),
							    {V2_lev, _B6} =
								protocol:uint16(_B5),
							    {V2_star, _B7} =
								protocol:uint8(_B6),
							    {V2_break_skills,
							     _B12} =
								protocol:array(_B7,
									       fun
										 (_B8) ->
										     {V3_pos,
										      _B9} =
											 protocol:uint8(_B8),
										     {V3_skill_bid,
										      _B10} =
											 protocol:uint32(_B9),
										     {{V3_pos,
										       V3_skill_bid},
										      _B10}
									       end),
							    {V2_break_lev,
							     _B13} =
								protocol:uint8(_B12),
							    {V2_power, _B14} =
								protocol:uint32(_B13),
							    {V2_use_skin,
							     _B15} =
								protocol:uint32(_B14),
							    {V2_end_time,
							     _B16} =
								protocol:uint32(_B15),
							    {V2_atk, _B17} =
								protocol:uint32(_B16),
							    {V2_def_p, _B18} =
								protocol:uint32(_B17),
							    {V2_def_s, _B19} =
								protocol:uint32(_B18),
							    {V2_hp, _B20} =
								protocol:uint32(_B19),
							    {V2_speed, _B21} =
								protocol:uint32(_B20),
							    {V2_hit_rate,
							     _B22} =
								protocol:uint32(_B21),
							    {V2_dodge_rate,
							     _B23} =
								protocol:uint32(_B22),
							    {V2_crit_rate,
							     _B24} =
								protocol:uint32(_B23),
							    {V2_crit_ratio,
							     _B25} =
								protocol:uint32(_B24),
							    {V2_hit_magic,
							     _B26} =
								protocol:uint32(_B25),
							    {V2_dodge_magic,
							     _B27} =
								protocol:uint32(_B26),
							    {V2_def, _B28} =
								protocol:uint32(_B27),
							    {V2_eqms, _B34} =
								protocol:array(_B28,
									       fun
										 (_B29) ->
										     {V3_id,
										      _B30} =
											 protocol:uint32(_B29),
										     {V3_base_id,
										      _B31} =
											 protocol:uint32(_B30),
										     {V3_type,
										      _B32} =
											 protocol:uint32(_B31),
										     {{V3_id,
										       V3_base_id,
										       V3_type},
										      _B32}
									       end),
							    {V2_artifacts,
							     _B56} =
								protocol:array(_B34,
									       fun
										 (_B35) ->
										     {V3_artifact_pos,
										      _B36} =
											 protocol:uint8(_B35),
										     {V3_id,
										      _B37} =
											 protocol:uint32(_B36),
										     {V3_base_id,
										      _B38} =
											 protocol:uint32(_B37),
										     {V3_enchant,
										      _B39} =
											 protocol:uint32(_B38),
										     {V3_attr,
										      _B44} =
											 protocol:array(_B39,
													fun
													  (_B40) ->
													      {V4_attr_id,
													       _B41} =
														  protocol:uint32(_B40),
													      {V4_attr_val,
													       _B42} =
														  protocol:uint32(_B41),
													      {{V4_attr_id,
														V4_attr_val},
													       _B42}
													end),
										     {V3_extra_attr,
										      _B49} =
											 protocol:array(_B44,
													fun
													  (_B45) ->
													      {V4_attr_id,
													       _B46} =
														  protocol:uint32(_B45),
													      {V4_attr_val,
													       _B47} =
														  protocol:uint32(_B46),
													      {{V4_attr_id,
														V4_attr_val},
													       _B47}
													end),
										     {V3_extra,
										      _B54} =
											 protocol:array(_B49,
													fun
													  (_B50) ->
													      {V4_extra_k,
													       _B51} =
														  protocol:uint32(_B50),
													      {V4_extra_v,
													       _B52} =
														  protocol:uint32(_B51),
													      {{V4_extra_k,
														V4_extra_v},
													       _B52}
													end),
										     {{V3_artifact_pos,
										       V3_id,
										       V3_base_id,
										       V3_enchant,
										       V3_attr,
										       V3_extra_attr,
										       V3_extra},
										      _B54}
									       end),
							    {V2_holy_eqm,
							     _B72} =
								protocol:array(_B56,
									       fun
										 (_B57) ->
										     {V3_id,
										      _B58} =
											 protocol:uint32(_B57),
										     {V3_base_id,
										      _B59} =
											 protocol:uint32(_B58),
										     {V3_main_attr,
										      _B64} =
											 protocol:array(_B59,
													fun
													  (_B60) ->
													      {V4_attr_id,
													       _B61} =
														  protocol:uint32(_B60),
													      {V4_attr_val,
													       _B62} =
														  protocol:uint32(_B61),
													      {{V4_attr_id,
														V4_attr_val},
													       _B62}
													end),
										     {V3_holy_eqm_attr,
										      _B70} =
											 protocol:array(_B64,
													fun
													  (_B65) ->
													      {V4_pos,
													       _B66} =
														  protocol:uint8(_B65),
													      {V4_attr_id,
													       _B67} =
														  protocol:uint32(_B66),
													      {V4_attr_val,
													       _B68} =
														  protocol:uint32(_B67),
													      {{V4_pos,
														V4_attr_id,
														V4_attr_val},
													       _B68}
													end),
										     {{V3_id,
										       V3_base_id,
										       V3_main_attr,
										       V3_holy_eqm_attr},
										      _B70}
									       end),
							    {V2_dower_skill,
							     _B77} =
								protocol:array(_B72,
									       fun
										 (_B73) ->
										     {V3_pos,
										      _B74} =
											 protocol:uint8(_B73),
										     {V3_skill_id,
										      _B75} =
											 protocol:uint32(_B74),
										     {{V3_pos,
										       V3_skill_id},
										      _B75}
									       end),
							    {{V2_pos, V2_bid,
							      V2_lev, V2_star,
							      V2_break_skills,
							      V2_break_lev,
							      V2_power,
							      V2_use_skin,
							      V2_end_time,
							      V2_atk, V2_def_p,
							      V2_def_s, V2_hp,
							      V2_speed,
							      V2_hit_rate,
							      V2_dodge_rate,
							      V2_crit_rate,
							      V2_crit_ratio,
							      V2_hit_magic,
							      V2_dodge_magic,
							      V2_def, V2_eqms,
							      V2_artifacts,
							      V2_holy_eqm,
							      V2_dower_skill},
							     _B77}
						    end),
    {ok, {V1_line, V1_index, V1_planes_load_partner}};
unpack(28623, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0), {ok, {V1_pos}};
unpack(28623, cli, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0),
    {V1_bid, _B2} = protocol:uint32(_B1),
    {V1_lev, _B3} = protocol:uint16(_B2),
    {V1_star, _B4} = protocol:uint8(_B3),
    {V1_skills, _B9} = protocol:array(_B4,
				      fun (_B5) ->
					      {V2_pos, _B6} =
						  protocol:uint8(_B5),
					      {V2_skill_bid, _B7} =
						  protocol:uint32(_B6),
					      {{V2_pos, V2_skill_bid}, _B7}
				      end),
    {V1_break_lev, _B10} = protocol:uint8(_B9),
    {V1_power, _B11} = protocol:uint32(_B10),
    {V1_use_skin, _B12} = protocol:uint32(_B11),
    {V1_end_time, _B13} = protocol:uint32(_B12),
    {V1_atk, _B14} = protocol:uint32(_B13),
    {V1_def_p, _B15} = protocol:uint32(_B14),
    {V1_def_s, _B16} = protocol:uint32(_B15),
    {V1_hp, _B17} = protocol:uint32(_B16),
    {V1_speed, _B18} = protocol:uint32(_B17),
    {V1_hit_rate, _B19} = protocol:uint32(_B18),
    {V1_dodge_rate, _B20} = protocol:uint32(_B19),
    {V1_crit_rate, _B21} = protocol:uint32(_B20),
    {V1_crit_ratio, _B22} = protocol:uint32(_B21),
    {V1_hit_magic, _B23} = protocol:uint32(_B22),
    {V1_dodge_magic, _B24} = protocol:uint32(_B23),
    {V1_def, _B25} = protocol:uint32(_B24),
    {V1_eqms, _B31} = protocol:array(_B25,
				     fun (_B26) ->
					     {V2_id, _B27} =
						 protocol:uint32(_B26),
					     {V2_base_id, _B28} =
						 protocol:uint32(_B27),
					     {V2_type, _B29} =
						 protocol:uint32(_B28),
					     {{V2_id, V2_base_id, V2_type},
					      _B29}
				     end),
    {V1_artifacts, _B53} = protocol:array(_B31,
					  fun (_B32) ->
						  {V2_artifact_pos, _B33} =
						      protocol:uint8(_B32),
						  {V2_id, _B34} =
						      protocol:uint32(_B33),
						  {V2_base_id, _B35} =
						      protocol:uint32(_B34),
						  {V2_enchant, _B36} =
						      protocol:uint32(_B35),
						  {V2_attr, _B41} =
						      protocol:array(_B36,
								     fun
								       (_B37) ->
									   {V3_attr_id,
									    _B38} =
									       protocol:uint32(_B37),
									   {V3_attr_val,
									    _B39} =
									       protocol:uint32(_B38),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B39}
								     end),
						  {V2_extra_attr, _B46} =
						      protocol:array(_B41,
								     fun
								       (_B42) ->
									   {V3_attr_id,
									    _B43} =
									       protocol:uint32(_B42),
									   {V3_attr_val,
									    _B44} =
									       protocol:uint32(_B43),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B44}
								     end),
						  {V2_extra, _B51} =
						      protocol:array(_B46,
								     fun
								       (_B47) ->
									   {V3_extra_k,
									    _B48} =
									       protocol:uint32(_B47),
									   {V3_extra_v,
									    _B49} =
									       protocol:uint32(_B48),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B49}
								     end),
						  {{V2_artifact_pos, V2_id,
						    V2_base_id, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_extra},
						   _B51}
					  end),
    {V1_holy_eqm, _B69} = protocol:array(_B53,
					 fun (_B54) ->
						 {V2_id, _B55} =
						     protocol:uint32(_B54),
						 {V2_base_id, _B56} =
						     protocol:uint32(_B55),
						 {V2_main_attr, _B61} =
						     protocol:array(_B56,
								    fun
								      (_B57) ->
									  {V3_attr_id,
									   _B58} =
									      protocol:uint32(_B57),
									  {V3_attr_val,
									   _B59} =
									      protocol:uint32(_B58),
									  {{V3_attr_id,
									    V3_attr_val},
									   _B59}
								    end),
						 {V2_holy_eqm_attr, _B67} =
						     protocol:array(_B61,
								    fun
								      (_B62) ->
									  {V3_pos,
									   _B63} =
									      protocol:uint8(_B62),
									  {V3_attr_id,
									   _B64} =
									      protocol:uint32(_B63),
									  {V3_attr_val,
									   _B65} =
									      protocol:uint32(_B64),
									  {{V3_pos,
									    V3_attr_id,
									    V3_attr_val},
									   _B65}
								    end),
						 {{V2_id, V2_base_id,
						   V2_main_attr,
						   V2_holy_eqm_attr},
						  _B67}
					 end),
    {V1_dower_skill, _B74} = protocol:array(_B69,
					    fun (_B70) ->
						    {V2_pos, _B71} =
							protocol:uint8(_B70),
						    {V2_skill_id, _B72} =
							protocol:uint32(_B71),
						    {{V2_pos, V2_skill_id},
						     _B72}
					    end),
    {ok,
     {V1_pos, V1_bid, V1_lev, V1_star, V1_skills,
      V1_break_lev, V1_power, V1_use_skin, V1_end_time,
      V1_atk, V1_def_p, V1_def_s, V1_hp, V1_speed,
      V1_hit_rate, V1_dodge_rate, V1_crit_rate, V1_crit_ratio,
      V1_hit_magic, V1_dodge_magic, V1_def, V1_eqms,
      V1_artifacts, V1_holy_eqm, V1_dower_skill}};
unpack(28624, srv, _B0) -> {ok, {}};
unpack(28624, cli, _B0) ->
    {V1_is_can_reward, _B1} = protocol:uint8(_B0),
    {V1_is_reward, _B2} = protocol:uint8(_B1),
    {ok, {V1_is_can_reward, V1_is_reward}};
unpack(28625, srv, _B0) -> {ok, {}};
unpack(28625, cli, _B0) ->
    {V1_item_list, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_base_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_num, _B3} =
						     protocol:uint32(_B2),
						 {{V2_base_id, V2_num}, _B3}
					 end),
    {ok, {V1_item_list}};
unpack(28626, srv, _B0) -> {ok, {}};
unpack(28626, cli, _B0) -> {ok, {}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


