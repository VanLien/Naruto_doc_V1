-file("src/proto/proto_206.erl", 1).

-module(proto_206).

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
		{adventure_mine_owned_data, [id, pos]},
		{adventure_mine_owned, [id, list]},
		{adventure_mine_log,
		 [replay_id, floor, room_id, rid, name, lev, mine_id,
		  face, avatar_id, power, type, ret, loss, time, expire]},
		{adventure_mine_role_log, [id, logs]},
		{adventure_mine_group, [group_id, num, power, list]},
		{adventure_mine_role,
		 [id, max_power, login_time, group_id]},
		{adventure_mine_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{adventure_mine_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  set_skill, attr, ext]},
		{adventure_mine_hook,
		 [id, role_id, mine_id, plunder_count, last_hook_time,
		  acc_hook_items, acc_hook_time, occupy_time,
		  primary_count, senior_count, log]},
		{adventure_mine_group_hook, [group_id, list]},
		{adventure_mine_hole,
		 [room_id, mine_id, role_id, name, lev, face, last_fight,
		  occupy_time, defense, hallows_id, power, formation_type,
		  robot_id, cool_time, last_replay_id]},
		{adventure_mine_floor, [id, list]},
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
		{group_attr, [atk, hp_max, def, speed]},
		{partner_base_p,
		 [partner_id, bid, lev, star, star_step, quality,
		  break_lev, power, skills, add_star, is_lock, use_skin,
		  end_time, resonate_lev, resonate_break_lev]},
		{partner_lev_data,
		 [add_hp, add_atk, add_def, add_speed]},
		{partner_base_data,
		 [bid, name, type, rare_type, init_star, show_star,
		  init_lev, pos_type, camp_type, break_lev, recruit_type,
		  skills, addition_skill, addition_skill2, skill_order,
		  ai, awake_items, awake_attr, awake_skill, init_power,
		  add_power, leader_skill, chips_num, chips_id,
		  hidden_skills, init_star5_num, hook_skills,
		  compose_expend, can_use_direct_item, awaken_info,
		  break_id, other_skills, item_id]},
		{partner_comment_p,
		 [comment_id, name, msg, like_num, no_like_num,
		  is_like]},
		{partner_comment,
		 [comment_id, partner_id, account, rid, sid, name,
		  post_time, msg, like_num, no_like_num]},
		{partner_bag,
		 [ver, type, num, buy_num, partner_list, partner_had,
		  comment_likes, partner_field, partner_star_lev,
		  max_star, partner_decomposes, partner_skins]},
		{partner_field, [lev, fields]},
		{partner_gemstone, [ver, type, gemstones]},
		{gemstone, [ver, pos, bid]},
		{partner_skin, [ver, id, end_time, ext]},
		{partner,
		 [ver, id, bid, type, career, is_lock, pos_type,
		  camp_type, rare_type, lev, quality, exp, name, star,
		  star_step, step_attr, break_lev, break_attr, power,
		  base_attr, group_attr, all_attr, skills, break_skills,
		  set_skills, eqm, hidden_skills, artifacts, fetter,
		  fetter_attr, fetter_power, score_lists, gemstones,
		  awaken_count, awaken_skills, add_star, dower_skill,
		  holy_eqm, use_skin, end_time, resonate_lev,
		  resonate_break_lev]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{adventure_data, [id, room, name, lose]},
		{a_room,
		 [id, idx, evt_id, res_id, status, cond_status, lock,
		  init_evt_id, ext]},
		{m_adventure,
		 [ver, pass_id, pass_num, explore_num, id, room,
		  first_room, boss_room, room_list, buff_list, shop_list,
		  start_time, end_time, plist, is_kill_boss, init_time,
		  skill_list, bag_list, map_id, partner_id, skill_used,
		  round_reward, round_evt_group, kill_mon,
		  mine_combat_num, mine_round_combat, mine_round_reward,
		  current_id, mine_buy_count, init_id, laste_num]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/adventure.hrl", 1).

-record(m_adventure,
	{ver = 10, pass_id = 0, pass_num = 0, explore_num = 0,
	 id = 0, room = 0, first_room = 0, boss_room = 0,
	 room_list = [], buff_list = [], shop_list = [],
	 start_time = 0, end_time = 0, plist = [],
	 is_kill_boss = 0, init_time = 0, skill_list = [],
	 bag_list = [], map_id = 0, partner_id = 0,
	 skill_used = [], round_reward = [],
	 round_evt_group = [], kill_mon = 0, mine_combat_num = 0,
	 mine_round_combat = 0, mine_round_reward = [],
	 current_id = 0, mine_buy_count = 0, init_id = 0,
	 laste_num = 999}).

-record(a_room,
	{id = 1, idx = 0, evt_id = 0, res_id = 0, status = 0,
	 cond_status = 0, lock = 0, init_evt_id = 0, ext = []}).

-record(adventure_data,
	{id = 0, room = 0, name = <<>>, lose = []}).

-file("src/proto/proto_206.erl", 16).

-file("inc/partner.hrl", 1).

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

-file("inc/partner.hrl", 11).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("inc/partner.hrl", 12).

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

-file("inc/partner.hrl", 13).

-record(partner,
	{ver = 7  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), career = 0,
	 is_lock = []  :: list(),
	 pos_type = 0  :: non_neg_integer(),
	 camp_type = 0  :: non_neg_integer(),
	 rare_type = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 quality = 0  :: non_neg_integer(),
	 exp = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 star = 1  :: non_neg_integer(),
	 star_step = 0  :: non_neg_integer(), step_attr = [],
	 break_lev = 0  :: non_neg_integer(),
	 break_attr = []  :: list(),
	 power = 0  :: non_neg_integer(), base_attr  :: #attr{},
	 group_attr = [], all_attr  :: #attr{},
	 skills = []  :: [non_neg_integer()],
	 break_skills = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 set_skills = []  :: [non_neg_integer()], eqm = [],
	 hidden_skills = [], artifacts = [], fetter = [],
	 fetter_attr = [], fetter_power = 0, score_lists = [],
	 gemstones = [], awaken_count = 0, awaken_skills = [],
	 add_star = 0, dower_skill = [], holy_eqm = [],
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(partner_skin,
	{ver = 1, id = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 ext = []  :: list()}).

-record(gemstone,
	{ver = 1, pos = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer()}).

-record(partner_gemstone,
	{ver = 1, type = 0  :: non_neg_integer(),
	 gemstones = []  :: [#gemstone{}]}).

-record(partner_field,
	{lev = 1  :: non_neg_integer(),
	 fields = []  ::
	     [{non_neg_integer(), non_neg_integer()}]}).

-record(partner_bag,
	{ver = -1  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 buy_num = 0  :: non_neg_integer(),
	 partner_list = []  :: [#partner{}],
	 partner_had = []  ::
	     [{non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}],
	 comment_likes = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 partner_field = []  :: #partner_field{},
	 partner_star_lev = 0  :: non_neg_integer(),
	 max_star = 0  :: non_neg_integer(),
	 partner_decomposes = []  :: non_neg_integer(),
	 partner_skins = []  :: list()}).

-record(partner_comment,
	{comment_id = 0, partner_id = 0, account = <<>>,
	 rid = 0, sid = <<>>, name = <<>>, post_time = 0,
	 msg = <<>>, like_num = 0, no_like_num = 0}).

-record(partner_comment_p,
	{comment_id = 0, name = <<>>, msg = <<>>, like_num = 0,
	 no_like_num = 0, is_like = 0}).

-record(partner_base_data,
	{bid, name, type, rare_type, init_star = 0,
	 show_star = 0, init_lev = 1, pos_type = 0,
	 camp_type = 0, break_lev = 0, recruit_type = 0,
	 skills = [], addition_skill = 0, addition_skill2 = 0,
	 skill_order = [], ai = 0, awake_items = [],
	 awake_attr = [], awake_skill = none, init_power = 0,
	 add_power = 0, leader_skill = 0, chips_num = 0,
	 chips_id = 0, hidden_skills = [], init_star5_num = 0,
	 hook_skills = [], compose_expend = [],
	 can_use_direct_item = 0, awaken_info = [], break_id = 0,
	 other_skills = [], item_id = 0}).

-record(partner_lev_data,
	{add_hp = 1000, add_atk = 1000, add_def = 1000,
	 add_speed = 1000}).

-record(partner_base_p,
	{partner_id, bid, lev, star, star_step, quality,
	 break_lev, power, skills, add_star, is_lock,
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(group_attr,
	{atk = 0, hp_max = 0, def = 0, speed = 0}).

-file("src/proto/proto_206.erl", 17).

-file("inc/attr.hrl", 1).

-file("src/proto/proto_206.erl", 18).

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

-file("src/proto/proto_206.erl", 19).

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

-file("src/proto/proto_206.erl", 20).

-file("inc/adventure_mine.hrl", 1).

-record(adventure_mine_floor, {id = {0, 0}, list = []}).

-record(adventure_mine_hole,
	{room_id = 0, mine_id = 0, role_id = {0, <<>>},
	 name = <<>>, lev = 0, face = 0, last_fight = {0, <<>>},
	 occupy_time = 0, defense = [], hallows_id = 0,
	 power = 0, formation_type = 1, robot_id = 0,
	 cool_time = 0, last_replay_id = 0}).

-record(adventure_mine_group_hook,
	{group_id = 0, list = []}).

-record(adventure_mine_hook,
	{id = {0, 0}, role_id = {0, <<>>}, mine_id = 0,
	 plunder_count = 0, last_hook_time = 0,
	 acc_hook_items = [], acc_hook_time = 0, occupy_time = 0,
	 primary_count = 0, senior_count = 0, log = []}).

-record(adventure_mine_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0, set_skill = [],
	 attr, ext = []}).

-record(adventure_mine_fight_lock,
	{id = {0, 0, 0}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-record(adventure_mine_role,
	{id = {0, <<>>}, max_power = 0, login_time = 0,
	 group_id = 0}).

-record(adventure_mine_group,
	{group_id = 0, num = 0, power = 0, list = []}).

-record(adventure_mine_role_log,
	{id = {0, <<>>}, logs = []}).

-record(adventure_mine_log,
	{replay_id = 0, floor = 0, room_id = 0, rid = {0, <<>>},
	 name = <<>>, lev = 0, mine_id = 0, face = 0,
	 avatar_id = 0, power = 0, type = 1, ret = 1, loss = [],
	 time = 0, expire = 0}).

-record(adventure_mine_owned,
	{id = {0, <<>>}, list = []}).

-record(adventure_mine_owned_data,
	{id = {0, 0}, pos = []}).

-file("src/proto/proto_206.erl", 21).

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

-file("src/proto/proto_206.erl", 22).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(20600, cli, {}) -> {ok, <<2:32, 20600:16>>};
pack(20600, srv,
     {V0_pass_id, V0_pass_num, V0_id, V0_room,
      V0_is_kill_boss, V0_map_id, V0_is_all_finish,
      V0_start_time, V0_end_time, V0_current_id}) ->
    D_a_t_a = <<V0_pass_id:8, V0_pass_num:8, V0_id:8,
		V0_room:8, V0_is_kill_boss:8, V0_map_id:8,
		V0_is_all_finish:8, V0_start_time:32, V0_end_time:32,
		V0_current_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20600:16,
       D_a_t_a/binary>>};
pack(20601, cli, {}) -> {ok, <<2:32, 20601:16>>};
pack(20601, srv,
     {V0_buff_list, V0_holiday_buff_list}) ->
    D_a_t_a = <<(length(V0_buff_list)):16,
		(list_to_binary([<<V1_bid:32, V1_time:32>>
				 || {V1_bid, V1_time} <- V0_buff_list]))/binary,
		(length(V0_holiday_buff_list)):16,
		(list_to_binary([<<V1_bid:32, V1_time:32>>
				 || {V1_bid, V1_time}
					<- V0_holiday_buff_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20601:16,
       D_a_t_a/binary>>};
pack(20602, cli, {}) -> {ok, <<2:32, 20602:16>>};
pack(20602, srv, {V0_room_list}) ->
    D_a_t_a = <<(length(V0_room_list)):16,
		(list_to_binary([<<V1_id:8, V1_status:8, V1_lock:8,
				   V1_evt_id:32, V1_res_id:8>>
				 || {V1_id, V1_status, V1_lock, V1_evt_id,
				     V1_res_id}
					<- V0_room_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20602:16,
       D_a_t_a/binary>>};
pack(20603, srv, {V0_room_list}) ->
    D_a_t_a = <<(length(V0_room_list)):16,
		(list_to_binary([<<V1_id:8, V1_status:8, V1_lock:8,
				   V1_evt_id:32, V1_res_id:8>>
				 || {V1_id, V1_status, V1_lock, V1_evt_id,
				     V1_res_id}
					<- V0_room_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20603:16,
       D_a_t_a/binary>>};
pack(20604, cli, {}) -> {ok, <<2:32, 20604:16>>};
pack(20604, srv, {V0_id, V0_combat_num, V0_partners}) ->
    D_a_t_a = <<V0_id:32, V0_combat_num:32,
		(length(V0_partners)):16,
		(list_to_binary([<<V1_now_hp:32, V1_partner_id:32,
				   V1_bid:32, V1_lev:16, V1_star:8,
				   (length(V1_skills)):16,
				   (list_to_binary([<<V2_pos:8,
						      V2_skill_bid:32>>
						    || {V2_pos, V2_skill_bid}
							   <- V1_skills]))/binary,
				   V1_break_lev:8, V1_power:32,
				   (length(V1_is_lock)):16,
				   (list_to_binary([<<V2_lock_type:32,
						      V2_is_lock:8>>
						    || {V2_lock_type,
							V2_is_lock}
							   <- V1_is_lock]))/binary,
				   V1_use_skin:32, V1_end_time:32,
				   V1_resonate_lev:32, V1_resonate_break_lev:32,
				   V1_atk:32, V1_def_p:32, V1_def_s:32,
				   V1_hp:32, V1_speed:32, V1_hit_rate:32,
				   V1_dodge_rate:32, V1_crit_rate:32,
				   V1_crit_ratio:32, V1_hit_magic:32,
				   V1_dodge_magic:32, V1_def:32, V1_atk2:32,
				   V1_hp2:32, V1_def2:32, V1_speed2:32,
				   (length(V1_eqms)):16,
				   (list_to_binary([<<V2_id:32, V2_base_id:32,
						      V2_type:32>>
						    || #item{id = V2_id,
							     base_id =
								 V2_base_id,
							     type = V2_type}
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
				   (length(V1_dower_skill)):16,
				   (list_to_binary([<<V2_pos:8, V2_skill_id:32>>
						    || {V2_pos, V2_skill_id}
							   <- V1_dower_skill]))/binary>>
				 || {{V1_now_hp,
				      {#partner_base_p{partner_id =
							   V1_partner_id,
						       bid = V1_bid,
						       lev = V1_lev,
						       star = V1_star,
						       skills = V1_skills,
						       break_lev = V1_break_lev,
						       power = V1_power,
						       is_lock = V1_is_lock,
						       use_skin = V1_use_skin,
						       end_time = V1_end_time,
						       resonate_lev =
							   V1_resonate_lev,
						       resonate_break_lev =
							   V1_resonate_break_lev},
				       #attr{atk = V1_atk, def_p = V1_def_p,
					     def_s = V1_def_s, hp_max = V1_hp,
					     speed = V1_speed,
					     hit_rate = V1_hit_rate,
					     dodge_rate = V1_dodge_rate,
					     crit_rate = V1_crit_rate,
					     crit_ratio = V1_crit_ratio,
					     hit_magic = V1_hit_magic,
					     dodge_magic = V1_dodge_magic,
					     def = V1_def},
				       #group_attr{atk = V1_atk2,
						   hp_max = V1_hp2,
						   def = V1_def2,
						   speed = V1_speed2},
				       V1_eqms, V1_artifacts, V1_dower_skill}}}
					<- V0_partners]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20604:16,
       D_a_t_a/binary>>};
pack(20605, cli, {V0_plist}) ->
    D_a_t_a = <<(length(V0_plist)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_plist]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20605:16,
       D_a_t_a/binary>>};
pack(20605, srv, {V0_code, V0_msg, V0_last_num}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_last_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20605:16,
       D_a_t_a/binary>>};
pack(20606, cli, {}) -> {ok, <<2:32, 20606:16>>};
pack(20606, srv, {V0_items_list, V0_vip_buff}) ->
    D_a_t_a = <<(length(V0_items_list)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_items_list]))/binary,
		V0_vip_buff:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20606:16,
       D_a_t_a/binary>>};
pack(20607, cli, {V0_skill_id, V0_val}) ->
    D_a_t_a = <<V0_skill_id:32, V0_val:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20607:16,
       D_a_t_a/binary>>};
pack(20607, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20607:16,
       D_a_t_a/binary>>};
pack(20608, cli, {V0_room_id}) ->
    D_a_t_a = <<V0_room_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20608:16,
       D_a_t_a/binary>>};
pack(20608, srv, {V0_code, V0_msg, V0_room_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_room_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20608:16,
       D_a_t_a/binary>>};
pack(20609, cli, {}) -> {ok, <<2:32, 20609:16>>};
pack(20609, srv, {V0_skill_list}) ->
    D_a_t_a = <<(length(V0_skill_list)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32,
				   V1_use_count:32>>
				 || {V1_bid, V1_num, V1_use_count}
					<- V0_skill_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20609:16,
       D_a_t_a/binary>>};
pack(20610, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20610:16,
       D_a_t_a/binary>>};
pack(20610, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20610:16,
       D_a_t_a/binary>>};
pack(20611, cli, {}) -> {ok, <<2:32, 20611:16>>};
pack(20611, srv, {V0_room_list}) ->
    D_a_t_a = <<(length(V0_room_list)):16,
		(list_to_binary([<<V1_id:8, V1_evt_id:32>>
				 || {V1_id, V1_evt_id}
					<- V0_room_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20611:16,
       D_a_t_a/binary>>};
pack(20612, srv, {}) -> {ok, <<2:32, 20612:16>>};
pack(20620, cli,
     {V0_room_id, V0_action, V0_ext_list}) ->
    D_a_t_a = <<V0_room_id:8, V0_action:8,
		(length(V0_ext_list)):16,
		(list_to_binary([<<V1_type:8, V1_val:32>>
				 || {V1_type, V1_val}
					<- V0_ext_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20620:16,
       D_a_t_a/binary>>};
pack(20620, srv,
     {V0_code, V0_msg, V0_room_id, V0_action}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_room_id:8,
		V0_action:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20620:16,
       D_a_t_a/binary>>};
pack(20621, srv,
     {V0_sel_val, V0_ret_val, V0_ret, V0_items}) ->
    D_a_t_a = <<V0_sel_val:8, V0_ret_val:8, V0_ret:8,
		(length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32, V1_move_to:8>>
				 || {V1_bid, V1_num, V1_move_to}
					<- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20621:16,
       D_a_t_a/binary>>};
pack(20623, srv,
     {V0_ret, V0_sel_val, V0_right, V0_num, V0_max, V0_bid,
      V0_ret_msg, V0_now_items, V0_max_items,
      V0_ret_items}) ->
    D_a_t_a = <<V0_ret:8, V0_sel_val:8, V0_right:8,
		V0_num:8, V0_max:8, V0_bid:32,
		(protocol:pack(string, V0_ret_msg))/binary,
		(length(V0_now_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_now_items]))/binary,
		(length(V0_max_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_max_items]))/binary,
		(length(V0_ret_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32, V1_move_to:8>>
				 || {V1_bid, V1_num, V1_move_to}
					<- V0_ret_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20623:16,
       D_a_t_a/binary>>};
pack(20624, srv, {V0_hp_per}) ->
    D_a_t_a = <<V0_hp_per:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20624:16,
       D_a_t_a/binary>>};
pack(20625, srv, {V0_id, V0_skill_id}) ->
    D_a_t_a = <<V0_id:8, V0_skill_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20625:16,
       D_a_t_a/binary>>};
pack(20627, srv, {V0_evt_id, V0_id}) ->
    D_a_t_a = <<V0_evt_id:32, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20627:16,
       D_a_t_a/binary>>};
pack(20628, srv, {V0_msg, V0_items}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary,
		(length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32, V1_move_to:8>>
				 || {V1_bid, V1_num, V1_move_to}
					<- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20628:16,
       D_a_t_a/binary>>};
pack(20630, srv, {V0_items}) ->
    D_a_t_a = <<(length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32, V1_move_to:8>>
				 || {V1_bid, V1_num, V1_move_to}
					<- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20630:16,
       D_a_t_a/binary>>};
pack(20631, srv, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_pay_type:8,
				   V1_pay_val:32, V1_bid:32, V1_num:32,
				   V1_is_buy:8, V1_discount:8>>
				 || #{id := V1_id, pay_type := V1_pay_type,
				      pay_val := V1_pay_val, bid := V1_bid,
				      num := V1_num, is_buy := V1_is_buy,
				      discount := V1_discount}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20631:16,
       D_a_t_a/binary>>};
pack(20632, cli, {}) -> {ok, <<2:32, 20632:16>>};
pack(20632, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_pay_type:8,
				   V1_pay_val:32, V1_bid:32, V1_num:32,
				   V1_is_buy:8, V1_discount:8>>
				 || #{id := V1_id, pay_type := V1_pay_type,
				      pay_val := V1_pay_val, bid := V1_bid,
				      num := V1_num, is_buy := V1_is_buy,
				      discount := V1_discount}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20632:16,
       D_a_t_a/binary>>};
pack(20633, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20633:16,
       D_a_t_a/binary>>};
pack(20633, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20633:16,
       D_a_t_a/binary>>};
pack(20634, cli, {}) -> {ok, <<2:32, 20634:16>>};
pack(20634, srv, {V0_list, V0_kill_mon}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:8>>
				 || {V1_id, V1_status} <- V0_list]))/binary,
		V0_kill_mon:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20634:16,
       D_a_t_a/binary>>};
pack(20635, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20635:16,
       D_a_t_a/binary>>};
pack(20635, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20635:16,
       D_a_t_a/binary>>};
pack(20636, cli, {V0_num}) ->
    D_a_t_a = <<V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20636:16,
       D_a_t_a/binary>>};
pack(20636, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20636:16,
       D_a_t_a/binary>>};
pack(20640, cli, {V0_floor, V0_is_notice}) ->
    D_a_t_a = <<V0_floor:8, V0_is_notice:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20640:16,
       D_a_t_a/binary>>};
pack(20640, srv,
     {V0_floor, V0_count, V0_occupy_count, V0_list,
      V0_buy_count}) ->
    D_a_t_a = <<V0_floor:8, V0_count:8, V0_occupy_count:8,
		(length(V0_list)):16,
		(list_to_binary([<<V1_room_id:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_lev:16,
				   (protocol:pack(string, V1_name))/binary,
				   V1_mine_id:32, V1_face:32, V1_status:8>>
				 || {#adventure_mine_hole{room_id = V1_room_id,
							  role_id =
							      {V1_rid,
							       V1_srv_id},
							  lev = V1_lev,
							  name = V1_name,
							  mine_id = V1_mine_id,
							  face = V1_face},
				     V1_status}
					<- V0_list]))/binary,
		V0_buy_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20640:16,
       D_a_t_a/binary>>};
pack(20641, cli, {V0_floor, V0_room_id}) ->
    D_a_t_a = <<V0_floor:8, V0_room_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20641:16,
       D_a_t_a/binary>>};
pack(20641, srv,
     {V0_room_id, V0_mine_id, V0_rid, V0_srv_id, V0_name,
      V0_lev, V0_face, V0_power, V0_plunder_count,
      V0_occupy_time, V0_defense, V0_items, V0_id,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_room_id:8, V0_mine_id:32, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:16,
		V0_face:32, V0_power:32, V0_plunder_count:8,
		V0_occupy_time:32, (length(V0_defense)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32, V1_bid:32,
				   V1_lev:16, V1_star:8, V1_use_skin:32>>
				 || {V1_pos, V1_id, V1_bid, V1_lev, V1_star,
				     V1_use_skin}
					<- V0_defense]))/binary,
		(length(V0_items)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num} <- V0_items]))/binary,
		V0_id:8, V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20641:16,
       D_a_t_a/binary>>};
pack(20642, cli, {}) -> {ok, <<2:32, 20642:16>>};
pack(20642, srv, {V0_defense}) ->
    D_a_t_a = <<(length(V0_defense)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_defense]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20642:16,
       D_a_t_a/binary>>};
pack(20643, cli, {V0_floor, V0_room_id, V0_is_skip}) ->
    D_a_t_a = <<V0_floor:8, V0_room_id:8, V0_is_skip:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20643:16,
       D_a_t_a/binary>>};
pack(20643, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20643:16,
       D_a_t_a/binary>>};
pack(20644, cli, {}) -> {ok, <<2:32, 20644:16>>};
pack(20644, srv, {V0_log_list}) ->
    D_a_t_a = <<(length(V0_log_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_power:32,
				   V1_floor:8, V1_room_id:8, V1_mine_id:32,
				   V1_ret:8, V1_replay_id:32, V1_time:32,
				   (length(V1_loss)):16,
				   (list_to_binary([<<V2_item_id:32, V2_num:32>>
						    || {V2_item_id, V2_num}
							   <- V1_loss]))/binary>>
				 || #adventure_mine_log{rid =
							    {V1_rid, V1_srv_id},
							name = V1_name,
							lev = V1_lev,
							face = V1_face,
							power = V1_power,
							floor = V1_floor,
							room_id = V1_room_id,
							mine_id = V1_mine_id,
							ret = V1_ret,
							replay_id =
							    V1_replay_id,
							time = V1_time,
							loss = V1_loss}
					<- V0_log_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20644:16,
       D_a_t_a/binary>>};
pack(20646, cli,
     {V0_floor, V0_room_id, V0_id, V0_pos_info,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_floor:8, V0_room_id:8, V0_id:8,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || {V1_pos, V1_id} <- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20646:16,
       D_a_t_a/binary>>};
pack(20646, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20646:16,
       D_a_t_a/binary>>};
pack(20647, cli, {}) -> {ok, <<2:32, 20647:16>>};
pack(20647, srv,
     {V0_had_combat_num, V0_num_list, V0_count}) ->
    D_a_t_a = <<V0_had_combat_num:16,
		(length(V0_num_list)):16,
		(list_to_binary([<<V1_num:8>>
				 || V1_num <- V0_num_list]))/binary,
		V0_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20647:16,
       D_a_t_a/binary>>};
pack(20648, cli, {V0_num}) ->
    D_a_t_a = <<V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20648:16,
       D_a_t_a/binary>>};
pack(20648, srv, {V0_code, V0_msg, V0_num}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20648:16,
       D_a_t_a/binary>>};
pack(20649, srv,
     {V0_result, V0_floor, V0_room_id, V0_count, V0_award,
      V0_target_role_name, V0_hurt_statistics,
      V0_end_time}) ->
    D_a_t_a = <<V0_result:8, V0_floor:8, V0_room_id:8,
		V0_count:32, (length(V0_award)):16,
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
		V0_end_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20649:16,
       D_a_t_a/binary>>};
pack(20651, cli, {V0_floor, V0_room_id}) ->
    D_a_t_a = <<V0_floor:8, V0_room_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20651:16,
       D_a_t_a/binary>>};
pack(20651, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20651:16,
       D_a_t_a/binary>>};
pack(20652, cli, {}) -> {ok, <<2:32, 20652:16>>};
pack(20652, srv, {V0_mine_list}) ->
    D_a_t_a = <<(length(V0_mine_list)):16,
		(list_to_binary([<<V1_floor:8, V1_room_id:8,
				   V1_mine_id:32, V1_occupy_time:32,
				   V1_primary_count:8, V1_senior_count:8,
				   (length(V1_hook_items)):16,
				   (list_to_binary([<<V2_item_id:32, V2_num:32>>
						    || {V2_item_id, V2_num}
							   <- V1_hook_items]))/binary>>
				 || {V1_floor, V1_room_id, V1_mine_id,
				     V1_occupy_time, V1_primary_count,
				     V1_senior_count, V1_hook_items}
					<- V0_mine_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20652:16,
       D_a_t_a/binary>>};
pack(20653, cli, {}) -> {ok, <<2:32, 20653:16>>};
pack(20653, srv, {V0_floor_list}) ->
    D_a_t_a = <<(length(V0_floor_list)):16,
		(list_to_binary([<<V1_floor:8>>
				 || V1_floor <- V0_floor_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20653:16,
       D_a_t_a/binary>>};
pack(20654, cli, {V0_floor, V0_room_id, V0_type}) ->
    D_a_t_a = <<V0_floor:8, V0_room_id:8, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20654:16,
       D_a_t_a/binary>>};
pack(20654, srv,
     {V0_code, V0_msg, V0_floor, V0_room_id, V0_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_floor:8,
		V0_room_id:8, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20654:16,
       D_a_t_a/binary>>};
pack(20655, cli, {}) -> {ok, <<2:32, 20655:16>>};
pack(20655, srv,
     {V0_code, V0_msg, V0_count, V0_buy_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:8,
		V0_buy_count:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20655:16,
       D_a_t_a/binary>>};
pack(20656, cli, {V0_rid, V0_srvid}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srvid))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20656:16,
       D_a_t_a/binary>>};
pack(20656, srv, {V0_floor, V0_room_id}) ->
    D_a_t_a = <<V0_floor:8, V0_room_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20656:16,
       D_a_t_a/binary>>};
pack(20657, cli, {}) -> {ok, <<2:32, 20657:16>>};
pack(20657, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20657:16,
       D_a_t_a/binary>>};
pack(20658, cli, {}) -> {ok, <<2:32, 20658:16>>};
pack(20658, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_floor:8, V1_room_id:8,
				   V1_hallows_id:32>>
				 || {V1_floor, V1_room_id, V1_hallows_id}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20658:16,
       D_a_t_a/binary>>};
pack(20659, cli, {}) -> {ok, <<2:32, 20659:16>>};
pack(20659, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20659:16,
       D_a_t_a/binary>>};
pack(20660, cli, {V0_floor, V0_room_id}) ->
    D_a_t_a = <<V0_floor:8, V0_room_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20660:16,
       D_a_t_a/binary>>};
pack(20660, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20660:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(20600, srv, _B0) -> {ok, {}};
unpack(20600, cli, _B0) ->
    {V1_pass_id, _B1} = protocol:uint8(_B0),
    {V1_pass_num, _B2} = protocol:uint8(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_room, _B4} = protocol:uint8(_B3),
    {V1_is_kill_boss, _B5} = protocol:uint8(_B4),
    {V1_map_id, _B6} = protocol:uint8(_B5),
    {V1_is_all_finish, _B7} = protocol:uint8(_B6),
    {V1_start_time, _B8} = protocol:uint32(_B7),
    {V1_end_time, _B9} = protocol:uint32(_B8),
    {V1_current_id, _B10} = protocol:uint8(_B9),
    {ok,
     {V1_pass_id, V1_pass_num, V1_id, V1_room,
      V1_is_kill_boss, V1_map_id, V1_is_all_finish,
      V1_start_time, V1_end_time, V1_current_id}};
unpack(20601, srv, _B0) -> {ok, {}};
unpack(20601, cli, _B0) ->
    {V1_buff_list, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_bid, _B2} =
						     protocol:uint32(_B1),
						 {V2_time, _B3} =
						     protocol:uint32(_B2),
						 {{V2_bid, V2_time}, _B3}
					 end),
    {V1_holiday_buff_list, _B10} = protocol:array(_B5,
						  fun (_B6) ->
							  {V2_bid, _B7} =
							      protocol:uint32(_B6),
							  {V2_time, _B8} =
							      protocol:uint32(_B7),
							  {{V2_bid, V2_time},
							   _B8}
						  end),
    {ok, {V1_buff_list, V1_holiday_buff_list}};
unpack(20602, srv, _B0) -> {ok, {}};
unpack(20602, cli, _B0) ->
    {V1_room_list, _B8} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_id, _B2} =
						     protocol:uint8(_B1),
						 {V2_status, _B3} =
						     protocol:uint8(_B2),
						 {V2_lock, _B4} =
						     protocol:uint8(_B3),
						 {V2_evt_id, _B5} =
						     protocol:uint32(_B4),
						 {V2_res_id, _B6} =
						     protocol:uint8(_B5),
						 {{V2_id, V2_status, V2_lock,
						   V2_evt_id, V2_res_id},
						  _B6}
					 end),
    {ok, {V1_room_list}};
unpack(20603, cli, _B0) ->
    {V1_room_list, _B8} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_id, _B2} =
						     protocol:uint8(_B1),
						 {V2_status, _B3} =
						     protocol:uint8(_B2),
						 {V2_lock, _B4} =
						     protocol:uint8(_B3),
						 {V2_evt_id, _B5} =
						     protocol:uint32(_B4),
						 {V2_res_id, _B6} =
						     protocol:uint8(_B5),
						 {{V2_id, V2_status, V2_lock,
						   V2_evt_id, V2_res_id},
						  _B6}
					 end),
    {ok, {V1_room_list}};
unpack(20604, srv, _B0) -> {ok, {}};
unpack(20604, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_combat_num, _B2} = protocol:uint32(_B1),
    {V1_partners, _B7} = protocol:array(_B2,
					fun (_B3) ->
						{V2_now_hp, _B4} =
						    protocol:uint32(_B3),
						{V2_info1, _B5} =
						    protocol:tuple(_B4),
						{{V2_now_hp, V2_info1}, _B5}
					end),
    {ok, {V1_id, V1_combat_num, V1_partners}};
unpack(20605, srv, _B0) ->
    {V1_plist, _B4} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_id, _B2}
				     end),
    {ok, {V1_plist}};
unpack(20605, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_last_num, _B3} = protocol:uint16(_B2),
    {ok, {V1_code, V1_msg, V1_last_num}};
unpack(20606, srv, _B0) -> {ok, {}};
unpack(20606, cli, _B0) ->
    {V1_items_list, _B5} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_bid, _B2} =
						      protocol:uint32(_B1),
						  {V2_num, _B3} =
						      protocol:uint32(_B2),
						  {{V2_bid, V2_num}, _B3}
					  end),
    {V1_vip_buff, _B6} = protocol:uint32(_B5),
    {ok, {V1_items_list, V1_vip_buff}};
unpack(20607, srv, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {V1_val, _B2} = protocol:uint32(_B1),
    {ok, {V1_skill_id, V1_val}};
unpack(20607, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20608, srv, _B0) ->
    {V1_room_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_room_id}};
unpack(20608, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_room_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_room_id}};
unpack(20609, srv, _B0) -> {ok, {}};
unpack(20609, cli, _B0) ->
    {V1_skill_list, _B6} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_bid, _B2} =
						      protocol:uint32(_B1),
						  {V2_num, _B3} =
						      protocol:uint32(_B2),
						  {V2_use_count, _B4} =
						      protocol:uint32(_B3),
						  {{V2_bid, V2_num,
						    V2_use_count},
						   _B4}
					  end),
    {ok, {V1_skill_list}};
unpack(20610, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(20610, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(20611, srv, _B0) -> {ok, {}};
unpack(20611, cli, _B0) ->
    {V1_room_list, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_id, _B2} =
						     protocol:uint8(_B1),
						 {V2_evt_id, _B3} =
						     protocol:uint32(_B2),
						 {{V2_id, V2_evt_id}, _B3}
					 end),
    {ok, {V1_room_list}};
unpack(20612, cli, _B0) -> {ok, {}};
unpack(20620, srv, _B0) ->
    {V1_room_id, _B1} = protocol:uint8(_B0),
    {V1_action, _B2} = protocol:uint8(_B1),
    {V1_ext_list, _B7} = protocol:array(_B2,
					fun (_B3) ->
						{V2_type, _B4} =
						    protocol:uint8(_B3),
						{V2_val, _B5} =
						    protocol:uint32(_B4),
						{{V2_type, V2_val}, _B5}
					end),
    {ok, {V1_room_id, V1_action, V1_ext_list}};
unpack(20620, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_room_id, _B3} = protocol:uint8(_B2),
    {V1_action, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_room_id, V1_action}};
unpack(20621, cli, _B0) ->
    {V1_sel_val, _B1} = protocol:uint8(_B0),
    {V1_ret_val, _B2} = protocol:uint8(_B1),
    {V1_ret, _B3} = protocol:uint8(_B2),
    {V1_items, _B9} = protocol:array(_B3,
				     fun (_B4) ->
					     {V2_bid, _B5} =
						 protocol:uint32(_B4),
					     {V2_num, _B6} =
						 protocol:uint32(_B5),
					     {V2_move_to, _B7} =
						 protocol:uint8(_B6),
					     {{V2_bid, V2_num, V2_move_to}, _B7}
				     end),
    {ok, {V1_sel_val, V1_ret_val, V1_ret, V1_items}};
unpack(20623, cli, _B0) ->
    {V1_ret, _B1} = protocol:uint8(_B0),
    {V1_sel_val, _B2} = protocol:uint8(_B1),
    {V1_right, _B3} = protocol:uint8(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {V1_max, _B5} = protocol:uint8(_B4),
    {V1_bid, _B6} = protocol:uint32(_B5),
    {V1_ret_msg, _B7} = protocol:string(_B6),
    {V1_now_items, _B12} = protocol:array(_B7,
					  fun (_B8) ->
						  {V2_bid, _B9} =
						      protocol:uint32(_B8),
						  {V2_num, _B10} =
						      protocol:uint32(_B9),
						  {{V2_bid, V2_num}, _B10}
					  end),
    {V1_max_items, _B17} = protocol:array(_B12,
					  fun (_B13) ->
						  {V2_bid, _B14} =
						      protocol:uint32(_B13),
						  {V2_num, _B15} =
						      protocol:uint32(_B14),
						  {{V2_bid, V2_num}, _B15}
					  end),
    {V1_ret_items, _B23} = protocol:array(_B17,
					  fun (_B18) ->
						  {V2_bid, _B19} =
						      protocol:uint32(_B18),
						  {V2_num, _B20} =
						      protocol:uint32(_B19),
						  {V2_move_to, _B21} =
						      protocol:uint8(_B20),
						  {{V2_bid, V2_num, V2_move_to},
						   _B21}
					  end),
    {ok,
     {V1_ret, V1_sel_val, V1_right, V1_num, V1_max, V1_bid,
      V1_ret_msg, V1_now_items, V1_max_items, V1_ret_items}};
unpack(20624, cli, _B0) ->
    {V1_hp_per, _B1} = protocol:uint8(_B0),
    {ok, {V1_hp_per}};
unpack(20625, cli, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_skill_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_skill_id}};
unpack(20627, cli, _B0) ->
    {V1_evt_id, _B1} = protocol:uint32(_B0),
    {V1_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_evt_id, V1_id}};
unpack(20628, cli, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {V1_items, _B7} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_bid, _B3} =
						 protocol:uint32(_B2),
					     {V2_num, _B4} =
						 protocol:uint32(_B3),
					     {V2_move_to, _B5} =
						 protocol:uint8(_B4),
					     {{V2_bid, V2_num, V2_move_to}, _B5}
				     end),
    {ok, {V1_msg, V1_items}};
unpack(20630, cli, _B0) ->
    {V1_items, _B6} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_bid, _B2} =
						 protocol:uint32(_B1),
					     {V2_num, _B3} =
						 protocol:uint32(_B2),
					     {V2_move_to, _B4} =
						 protocol:uint8(_B3),
					     {{V2_bid, V2_num, V2_move_to}, _B4}
				     end),
    {ok, {V1_items}};
unpack(20631, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B11} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_id, _B3} =
						 protocol:uint32(_B2),
					     {V2_pay_type, _B4} =
						 protocol:uint8(_B3),
					     {V2_pay_val, _B5} =
						 protocol:uint32(_B4),
					     {V2_bid, _B6} =
						 protocol:uint32(_B5),
					     {V2_num, _B7} =
						 protocol:uint32(_B6),
					     {V2_is_buy, _B8} =
						 protocol:uint8(_B7),
					     {V2_discount, _B9} =
						 protocol:uint8(_B8),
					     {{V2_id, V2_pay_type, V2_pay_val,
					       V2_bid, V2_num, V2_is_buy,
					       V2_discount},
					      _B9}
				     end),
    {ok, {V1_type, V1_list}};
unpack(20632, srv, _B0) -> {ok, {}};
unpack(20632, cli, _B0) ->
    {V1_list, _B10} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_pay_type, _B3} =
						 protocol:uint8(_B2),
					     {V2_pay_val, _B4} =
						 protocol:uint32(_B3),
					     {V2_bid, _B5} =
						 protocol:uint32(_B4),
					     {V2_num, _B6} =
						 protocol:uint32(_B5),
					     {V2_is_buy, _B7} =
						 protocol:uint8(_B6),
					     {V2_discount, _B8} =
						 protocol:uint8(_B7),
					     {{V2_id, V2_pay_type, V2_pay_val,
					       V2_bid, V2_num, V2_is_buy,
					       V2_discount},
					      _B8}
				     end),
    {ok, {V1_list}};
unpack(20633, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(20633, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(20634, srv, _B0) -> {ok, {}};
unpack(20634, cli, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint32(_B1),
					    {V2_status, _B3} =
						protocol:uint8(_B2),
					    {{V2_id, V2_status}, _B3}
				    end),
    {V1_kill_mon, _B6} = protocol:uint32(_B5),
    {ok, {V1_list, V1_kill_mon}};
unpack(20635, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(20635, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20636, srv, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0), {ok, {V1_num}};
unpack(20636, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20640, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_is_notice, _B2} = protocol:uint8(_B1),
    {ok, {V1_floor, V1_is_notice}};
unpack(20640, cli, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_count, _B2} = protocol:uint8(_B1),
    {V1_occupy_count, _B3} = protocol:uint8(_B2),
    {V1_list, _B14} = protocol:array(_B3,
				     fun (_B4) ->
					     {V2_room_id, _B5} =
						 protocol:uint8(_B4),
					     {V2_rid, _B6} =
						 protocol:uint32(_B5),
					     {V2_srv_id, _B7} =
						 protocol:string(_B6),
					     {V2_lev, _B8} =
						 protocol:uint16(_B7),
					     {V2_name, _B9} =
						 protocol:string(_B8),
					     {V2_mine_id, _B10} =
						 protocol:uint32(_B9),
					     {V2_face, _B11} =
						 protocol:uint32(_B10),
					     {V2_status, _B12} =
						 protocol:uint8(_B11),
					     {{V2_room_id, V2_rid, V2_srv_id,
					       V2_lev, V2_name, V2_mine_id,
					       V2_face, V2_status},
					      _B12}
				     end),
    {V1_buy_count, _B15} = protocol:uint8(_B14),
    {ok,
     {V1_floor, V1_count, V1_occupy_count, V1_list,
      V1_buy_count}};
unpack(20641, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_room_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_floor, V1_room_id}};
unpack(20641, cli, _B0) ->
    {V1_room_id, _B1} = protocol:uint8(_B0),
    {V1_mine_id, _B2} = protocol:uint32(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_srv_id, _B4} = protocol:string(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_lev, _B6} = protocol:uint16(_B5),
    {V1_face, _B7} = protocol:uint32(_B6),
    {V1_power, _B8} = protocol:uint32(_B7),
    {V1_plunder_count, _B9} = protocol:uint8(_B8),
    {V1_occupy_time, _B10} = protocol:uint32(_B9),
    {V1_defense, _B19} = protocol:array(_B10,
					fun (_B11) ->
						{V2_pos, _B12} =
						    protocol:uint8(_B11),
						{V2_id, _B13} =
						    protocol:uint32(_B12),
						{V2_bid, _B14} =
						    protocol:uint32(_B13),
						{V2_lev, _B15} =
						    protocol:uint16(_B14),
						{V2_star, _B16} =
						    protocol:uint8(_B15),
						{V2_use_skin, _B17} =
						    protocol:uint32(_B16),
						{{V2_pos, V2_id, V2_bid, V2_lev,
						  V2_star, V2_use_skin},
						 _B17}
					end),
    {V1_items, _B24} = protocol:array(_B19,
				      fun (_B20) ->
					      {V2_item_id, _B21} =
						  protocol:uint32(_B20),
					      {V2_num, _B22} =
						  protocol:uint32(_B21),
					      {{V2_item_id, V2_num}, _B22}
				      end),
    {V1_id, _B25} = protocol:uint8(_B24),
    {V1_hallows_id, _B26} = protocol:uint32(_B25),
    {ok,
     {V1_room_id, V1_mine_id, V1_rid, V1_srv_id, V1_name,
      V1_lev, V1_face, V1_power, V1_plunder_count,
      V1_occupy_time, V1_defense, V1_items, V1_id,
      V1_hallows_id}};
unpack(20642, srv, _B0) -> {ok, {}};
unpack(20642, cli, _B0) ->
    {V1_defense, _B4} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_id, _B2} =
						   protocol:uint32(_B1),
					       {V2_id, _B2}
				       end),
    {ok, {V1_defense}};
unpack(20643, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_room_id, _B2} = protocol:uint8(_B1),
    {V1_is_skip, _B3} = protocol:uint8(_B2),
    {ok, {V1_floor, V1_room_id, V1_is_skip}};
unpack(20643, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20644, srv, _B0) -> {ok, {}};
unpack(20644, cli, _B0) ->
    {V1_log_list, _B20} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_rid, _B2} =
						     protocol:uint32(_B1),
						 {V2_srv_id, _B3} =
						     protocol:string(_B2),
						 {V2_name, _B4} =
						     protocol:string(_B3),
						 {V2_lev, _B5} =
						     protocol:uint16(_B4),
						 {V2_face, _B6} =
						     protocol:uint32(_B5),
						 {V2_power, _B7} =
						     protocol:uint32(_B6),
						 {V2_floor, _B8} =
						     protocol:uint8(_B7),
						 {V2_room_id, _B9} =
						     protocol:uint8(_B8),
						 {V2_mine_id, _B10} =
						     protocol:uint32(_B9),
						 {V2_ret, _B11} =
						     protocol:uint8(_B10),
						 {V2_replay_id, _B12} =
						     protocol:uint32(_B11),
						 {V2_time, _B13} =
						     protocol:uint32(_B12),
						 {V2_loss, _B18} =
						     protocol:array(_B13,
								    fun
								      (_B14) ->
									  {V3_item_id,
									   _B15} =
									      protocol:uint32(_B14),
									  {V3_num,
									   _B16} =
									      protocol:uint32(_B15),
									  {{V3_item_id,
									    V3_num},
									   _B16}
								    end),
						 {{V2_rid, V2_srv_id, V2_name,
						   V2_lev, V2_face, V2_power,
						   V2_floor, V2_room_id,
						   V2_mine_id, V2_ret,
						   V2_replay_id, V2_time,
						   V2_loss},
						  _B18}
					 end),
    {ok, {V1_log_list}};
unpack(20646, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_room_id, _B2} = protocol:uint8(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_pos_info, _B8} = protocol:array(_B3,
					fun (_B4) ->
						{V2_pos, _B5} =
						    protocol:uint8(_B4),
						{V2_id, _B6} =
						    protocol:uint32(_B5),
						{{V2_pos, V2_id}, _B6}
					end),
    {V1_hallows_id, _B9} = protocol:uint32(_B8),
    {ok,
     {V1_floor, V1_room_id, V1_id, V1_pos_info,
      V1_hallows_id}};
unpack(20646, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(20647, srv, _B0) -> {ok, {}};
unpack(20647, cli, _B0) ->
    {V1_had_combat_num, _B1} = protocol:uint16(_B0),
    {V1_num_list, _B5} = protocol:array(_B1,
					fun (_B2) ->
						{V2_num, _B3} =
						    protocol:uint8(_B2),
						{V2_num, _B3}
					end),
    {V1_count, _B6} = protocol:uint8(_B5),
    {ok, {V1_had_combat_num, V1_num_list, V1_count}};
unpack(20648, srv, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0), {ok, {V1_num}};
unpack(20648, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_num}};
unpack(20649, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_floor, _B2} = protocol:uint8(_B1),
    {V1_room_id, _B3} = protocol:uint8(_B2),
    {V1_count, _B4} = protocol:uint32(_B3),
    {V1_award, _B9} = protocol:array(_B4,
				     fun (_B5) ->
					     {V2_item_id, _B6} =
						 protocol:uint32(_B5),
					     {V2_num, _B7} =
						 protocol:uint32(_B6),
					     {{V2_item_id, V2_num}, _B7}
				     end),
    {V1_target_role_name, _B10} = protocol:string(_B9),
    {V1_hurt_statistics, _B32} = protocol:array(_B10,
						fun (_B11) ->
							{V2_type, _B12} =
							    protocol:uint8(_B11),
							{V2_partner_hurts,
							 _B30} =
							    protocol:array(_B12,
									   fun
									     (_B13) ->
										 {V3_rid,
										  _B14} =
										     protocol:uint32(_B13),
										 {V3_srvid,
										  _B15} =
										     protocol:string(_B14),
										 {V3_id,
										  _B16} =
										     protocol:uint32(_B15),
										 {V3_bid,
										  _B17} =
										     protocol:uint32(_B16),
										 {V3_star,
										  _B18} =
										     protocol:uint32(_B17),
										 {V3_lev,
										  _B19} =
										     protocol:uint32(_B18),
										 {V3_camp_type,
										  _B20} =
										     protocol:uint32(_B19),
										 {V3_dps,
										  _B21} =
										     protocol:uint32(_B20),
										 {V3_cure,
										  _B22} =
										     protocol:uint32(_B21),
										 {V3_ext_data,
										  _B27} =
										     protocol:array(_B22,
												    fun
												      (_B23) ->
													  {V4_key,
													   _B24} =
													      protocol:uint32(_B23),
													  {V4_val,
													   _B25} =
													      protocol:uint32(_B24),
													  {{V4_key,
													    V4_val},
													   _B25}
												    end),
										 {V3_be_hurt,
										  _B28} =
										     protocol:uint32(_B27),
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
										  _B28}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B30}
						end),
    {V1_end_time, _B33} = protocol:uint32(_B32),
    {ok,
     {V1_result, V1_floor, V1_room_id, V1_count, V1_award,
      V1_target_role_name, V1_hurt_statistics, V1_end_time}};
unpack(20651, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_room_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_floor, V1_room_id}};
unpack(20651, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20652, srv, _B0) -> {ok, {}};
unpack(20652, cli, _B0) ->
    {V1_mine_list, _B14} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_floor, _B2} =
						      protocol:uint8(_B1),
						  {V2_room_id, _B3} =
						      protocol:uint8(_B2),
						  {V2_mine_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_occupy_time, _B5} =
						      protocol:uint32(_B4),
						  {V2_primary_count, _B6} =
						      protocol:uint8(_B5),
						  {V2_senior_count, _B7} =
						      protocol:uint8(_B6),
						  {V2_hook_items, _B12} =
						      protocol:array(_B7,
								     fun
								       (_B8) ->
									   {V3_item_id,
									    _B9} =
									       protocol:uint32(_B8),
									   {V3_num,
									    _B10} =
									       protocol:uint32(_B9),
									   {{V3_item_id,
									     V3_num},
									    _B10}
								     end),
						  {{V2_floor, V2_room_id,
						    V2_mine_id, V2_occupy_time,
						    V2_primary_count,
						    V2_senior_count,
						    V2_hook_items},
						   _B12}
					  end),
    {ok, {V1_mine_list}};
unpack(20653, srv, _B0) -> {ok, {}};
unpack(20653, cli, _B0) ->
    {V1_floor_list, _B4} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_floor, _B2} =
						      protocol:uint8(_B1),
						  {V2_floor, _B2}
					  end),
    {ok, {V1_floor_list}};
unpack(20654, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_room_id, _B2} = protocol:uint8(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_floor, V1_room_id, V1_type}};
unpack(20654, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_floor, _B3} = protocol:uint8(_B2),
    {V1_room_id, _B4} = protocol:uint8(_B3),
    {V1_type, _B5} = protocol:uint8(_B4),
    {ok, {V1_code, V1_msg, V1_floor, V1_room_id, V1_type}};
unpack(20655, srv, _B0) -> {ok, {}};
unpack(20655, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint8(_B2),
    {V1_buy_count, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_count, V1_buy_count}};
unpack(20656, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srvid, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srvid}};
unpack(20656, cli, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_room_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_floor, V1_room_id}};
unpack(20657, srv, _B0) -> {ok, {}};
unpack(20657, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(20658, srv, _B0) -> {ok, {}};
unpack(20658, cli, _B0) ->
    {V1_list, _B6} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_floor, _B2} =
						protocol:uint8(_B1),
					    {V2_room_id, _B3} =
						protocol:uint8(_B2),
					    {V2_hallows_id, _B4} =
						protocol:uint32(_B3),
					    {{V2_floor, V2_room_id,
					      V2_hallows_id},
					     _B4}
				    end),
    {ok, {V1_list}};
unpack(20659, srv, _B0) -> {ok, {}};
unpack(20659, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(20660, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0),
    {V1_room_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_floor, V1_room_id}};
unpack(20660, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


