-file("src/proto/proto_242.erl", 1).

-module(proto_242).

-lager_records([{group_attr, [atk, hp_max, def, speed]},
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
		{g_mem_red_packet,
		 [id, rid, name, face_id, avatar_bid, post, type, num,
		  max_num, val, max_val, list, mems, start_time, end_time,
		  msg_id, face_update_time, face_file]},
		{guild_data, [lev, exp, num, maintain]},
		{guild_position, [id, name, limit]},
		{g_merge,
		 [gid, gname, gid2, gname2, role_id, rname, end_time,
		  gold]},
		{guild_rank,
		 [id, name, lev, exp, leader_name, leader_id,
		  leader_face, leader_lev, members_num, members_max,
		  apply_lev, apply_type, create_time, power, index,
		  leader_avatar_bid, leader_look_id,
		  leader_face_update_time, leader_face_file,
		  apply_power]},
		{guild_apply,
		 [gid, id, pid, name, face, lev, power, post, vip_lev,
		  online, apply_time, face_update_time, face_file]},
		{guild_member,
		 [ver, id, pid, name, face, lev, sex, power, post,
		  vip_lev, online, join_time, login_time, donate,
		  day_donate, avatar_bid, red_packet_num,
		  red_packet_price, red_packet_time, red_packet_recv_num,
		  red_packet_recv_time, active_lev, day_donate_type,
		  day_donate_time, day_dun_time, day_war_time, look_id,
		  face_update_time, face_file]},
		{guild_war_box,
		 [order, rid, sid, name, item_id, item_num]},
		{guild_cache, []},
		{guild,
		 [ver, id, name, lev, exp, day_exp, pid, leader_name,
		  leader_id, members, members_num, members_max, next_id,
		  sign, apply_lev, apply_type, recruit_num, cache, sync,
		  create_time, power, rename_time, lock_time, donate_exp,
		  red_packet, guild_war_box_end_time, guild_war_relust,
		  guild_war_box, guild_war_sign, day_var,
		  vice_leader_mail, normal_mail, vitality, apply_power]},
		{guild_bag,
		 [ver, id, pid, name, post, lev, join_time, quit_time,
		  send_time, send_num, recv_num, true_quit_time,
		  quit_post]},
		{guild_log_info,
		 [id, guild_id, type, time, role_id, role_name, msg]},
		{guild_log, [key, list]},
		{guild_war_role_log,
		 [id, name, lev, face, power, formation_type,
		  formation_lev, time, repaly_id, result, hp, defense,
		  face_update_time, face_file]},
		{guild_war_log,
		 [flag1, flag2, time, id1, name1, id2, name2, gid, gname,
		  int_args, str_args]},
		{guild_war_partner,
		 [id, bid, lev, star, break_lev, base_attr, all_attr,
		  skills, break_skills, set_skills, ext_data]},
		{guild_war_role,
		 [pos, id, name, lev, face, power, formation_type,
		  formation_lev, war_score, star, defense, hp, hp_max,
		  status, def_count, def_log, count, repaly_info,
		  relic_def_count, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id, hallows_lucky,
		  hallows_seal, hallows_all_look_ids, extra, look_id,
		  face_update_time, face_file, break_groups]},
		{guild_war_sign,
		 [gid, group_id, srv_name, gname, def_num, defense,
		  last_matchs, avg_power, star_time, buff_lev, rank, hp,
		  hp_max, war_log, lev]},
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
		  res_p, dam_s, res_s, tenacity]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

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

-file("src/proto/proto_242.erl", 16).

-file("inc/guild_war.hrl", 1).

-record(guild_war_sign,
	{gid = {0, <<>>}, group_id = 0, srv_name = <<>>,
	 gname = <<>>, def_num = 0, defense = [],
	 last_matchs = {0, <<>>}, avg_power = 0, star_time = 0,
	 buff_lev = 0, rank = 0, hp = 0, hp_max = 0,
	 war_log = [], lev = 0}).

-record(guild_war_role,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, power = 0, formation_type = 0,
	 formation_lev = 0, war_score = 0, star = 0,
	 defense = [], hp = 3, hp_max = 3, status = 0,
	 def_count = 0, def_log = [], count = 0,
	 repaly_info = [], relic_def_count = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = [], look_id = 0, face_update_time = 0,
	 face_file = <<>>, break_groups = []}).

-record(guild_war_partner,
	{id = 0, bid = 0, lev = 0, star = 0, break_lev = 0,
	 base_attr = [], all_attr = [], skills = [],
	 break_skills = [], set_skills = [], ext_data = []}).

-record(guild_war_log,
	{flag1 = 0, flag2 = 0, time = 0, id1 = {0, <<>>},
	 name1 = <<>>, id2 = {0, <<>>}, name2 = <<>>,
	 gid = {0, <<>>}, gname = <<>>, int_args = [],
	 str_args = []}).

-record(guild_war_role_log,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 power = 0, formation_type = 0, formation_lev = 0,
	 time = 0, repaly_id = 0, result = 0, hp = 0,
	 defense = [], face_update_time = 0, face_file = <<>>}).

-file("src/proto/proto_242.erl", 17).

-file("inc/guild.hrl", 1).

-record(guild_log, {key = {0, <<>>}, list = []}).

-record(guild_log_info,
	{id = 0, guild_id = {0, <<>>}, type = 0, time = 0,
	 role_id = {0, <<>>}, role_name = 0, msg = <<>>}).

-record(guild_bag,
	{ver = 2, id = {0, <<>>}, pid, name = <<>>, post = 0,
	 lev = 0, join_time = 0, quit_time = 0, send_time = 0,
	 send_num = 0, recv_num = 0, true_quit_time = 0,
	 quit_post = 0}).

-record(guild,
	{ver = 7, id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 day_exp = 0, pid = 0, leader_name = <<>>,
	 leader_id = {0, <<>>}, members = [], members_num = 1,
	 members_max = 50, next_id = 1, sign = <<>>,
	 apply_lev = guild_data:get_const(guild_min_lev),
	 apply_type = 1, recruit_num = 0, cache, sync = 0,
	 create_time = 0, power = 0, rename_time = 0,
	 lock_time = 0, donate_exp = 0, red_packet = [],
	 guild_war_box_end_time = 0, guild_war_relust = 0,
	 guild_war_box = [], guild_war_sign = [], day_var = [],
	 vice_leader_mail = 0, normal_mail = 0, vitality = 0,
	 apply_power = 0}).

-record(guild_cache, {}).

-record(guild_war_box,
	{order = 0, rid = 0, sid = <<>>, name = <<>>,
	 item_id = 0, item_num = 0}).

-record(guild_member,
	{ver = 6, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, sex = 1, power = 0, post = 0,
	 vip_lev = 0, online = 1, join_time = 0, login_time = 0,
	 donate = 0, day_donate = 0, avatar_bid = 0,
	 red_packet_num = 0, red_packet_price = 0,
	 red_packet_time = 0, red_packet_recv_num = 0,
	 red_packet_recv_time = 0, active_lev = 0,
	 day_donate_type = 0, day_donate_time = 0,
	 day_dun_time = 0, day_war_time = 0, look_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(guild_apply,
	{gid = {0, <<>>}, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, power = 0, post = 0, vip_lev = 0,
	 online = 1, apply_time = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(guild_rank,
	{id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 leader_name = <<>>, leader_id = {0, <<>>},
	 leader_face = 0, leader_lev = 0, members_num = 1,
	 members_max = 50, apply_lev = 0, apply_type = 1,
	 create_time = 0, power = 0, index = 0,
	 leader_avatar_bid = 0, leader_look_id = 0,
	 leader_face_update_time = 0, leader_face_file = <<>>,
	 apply_power = 0}).

-record(g_merge,
	{gid = {0, <<>>}, gname = <<>>, gid2 = {0, <<>>},
	 gname2 = <<>>, role_id = {0, <<>>}, rname = <<>>,
	 end_time = 0, gold = 0}).

-record(guild_position,
	{id = 0, name = <<>>, limit = []}).

-record(guild_data,
	{lev = 0, exp = 0, num = 0, maintain = 0}).

-record(g_mem_red_packet,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, name = <<>>,
	 face_id = 0, avatar_bid = 0, post = <<>>, type = 0,
	 num = 0, max_num = 0, val = 0, max_val = 0, list = [],
	 mems = [], start_time = 0, end_time = 0, msg_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/proto/proto_242.erl", 18).

-file("inc/partner.hrl", 1).

-file("inc/attr.hrl", 1).

-file("inc/partner.hrl", 11).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("inc/partner.hrl", 12).

-file("inc/common.hrl", 1).

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

-file("src/proto/proto_242.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24200, cli, {}) -> {ok, <<2:32, 24200:16>>};
pack(24200, srv,
     {V0_count, V0_result, V0_ranks,
      #guild_war_sign{gname = V0_gname1, hp = V0_hp1,
		      buff_lev = V0_buff_lev1},
      #guild_war_sign{gname = V0_gname2,
		      gid = {V0_g_id, V0_g_sid}, hp = V0_hp2,
		      defense = V0_defense}}) ->
    D_a_t_a = <<V0_count:32, V0_result:8,
		(length(V0_ranks)):16,
		(list_to_binary([<<V1_rank:32,
				   (protocol:pack(string, V1_name))/binary>>
				 || {V1_rank, V1_name} <- V0_ranks]))/binary,
		(protocol:pack(string, V0_gname1))/binary, V0_hp1:16,
		V0_buff_lev1:16,
		(protocol:pack(string, V0_gname2))/binary, V0_g_id:32,
		(protocol:pack(string, V0_g_sid))/binary, V0_hp2:16,
		(length(V0_defense)):16,
		(list_to_binary([<<V1_pos:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_power:32, V1_hp:16,
				   V1_hp_max:16, V1_relic_def_count:16,
				   V1_status:8, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #guild_war_role{pos = V1_pos,
						    id = {V1_rid, V1_srv_id},
						    name = V1_name,
						    lev = V1_lev,
						    face = V1_face,
						    power = V1_power,
						    hp = V1_hp,
						    hp_max = V1_hp_max,
						    relic_def_count =
							V1_relic_def_count,
						    status = V1_status,
						    face_update_time =
							V1_face_update_time,
						    face_file = V1_face_file}
					<- V0_defense]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24200:16,
       D_a_t_a/binary>>};
pack(24201, cli, {V0_pos}) ->
    D_a_t_a = <<V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24201:16,
       D_a_t_a/binary>>};
pack(24201, srv,
     {#guild_war_role{pos = V0_pos, id = {V0_rid, V0_srv_id},
		      name = V0_name, lev = V0_lev, face = V0_face,
		      power = V0_power, formation_type = V0_formation_type,
		      formation_lev = V0_formation_lev, hp = V0_hp,
		      hp_max = V0_hp_max, def_count = V0_def_count,
		      relic_def_count = V0_relic_def_count,
		      defense = V0_defense,
		      face_update_time = V0_face_update_time,
		      face_file = V0_face_file}}) ->
    D_a_t_a = <<V0_pos:32, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:16,
		V0_face:32, V0_power:32, V0_formation_type:16,
		V0_formation_lev:16, V0_hp:16, V0_hp_max:16,
		V0_def_count:16, V0_relic_def_count:16,
		(length(V0_defense)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_star:8, (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_pos,
				     #guild_war_partner{bid = V1_bid,
							lev = V1_lev,
							star = V1_star,
							ext_data = V1_ext_data}}
					<- V0_defense]))/binary,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24201:16,
       D_a_t_a/binary>>};
pack(24202, cli, {V0_pos, V0_hp, V0_flag}) ->
    D_a_t_a = <<V0_pos:8, V0_hp:16, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24202:16,
       D_a_t_a/binary>>};
pack(24202, srv, {V0_code, V0_msg, V0_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24202:16,
       D_a_t_a/binary>>};
pack(24203, srv,
     {V0_result, V0_timer, V0_item_rewards, V0_all_dps,
      V0_best_partner, V0_bid, V0_lev, V0_star, V0_use_skin,
      V0_target_role_name, V0_hurt_statistics,
      V0_replay_id}) ->
    D_a_t_a = <<V0_result:8, V0_timer:32,
		(length(V0_item_rewards)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num}
					<- V0_item_rewards]))/binary,
		V0_all_dps:32, V0_best_partner:32, V0_bid:32, V0_lev:16,
		V0_star:8, V0_use_skin:32,
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
     <<(byte_size(D_a_t_a) + 2):32, 24203:16,
       D_a_t_a/binary>>};
pack(24204, cli, {}) -> {ok, <<2:32, 24204:16>>};
pack(24204, srv,
     {V0_status, V0_flag, V0_start_time, V0_end_time}) ->
    D_a_t_a = <<V0_status:8, V0_flag:8, V0_start_time:32,
		V0_end_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24204:16,
       D_a_t_a/binary>>};
pack(24205, cli, {}) -> {ok, <<2:32, 24205:16>>};
pack(24205, srv, {V0_match_info}) ->
    D_a_t_a = <<(length(V0_match_info)):16,
		(list_to_binary([<<V1_g_id1:32,
				   (protocol:pack(string, V1_g_sid1))/binary,
				   (protocol:pack(string, V1_srv_name1))/binary,
				   (protocol:pack(string,
						  V1_guild_name1))/binary,
				   V1_rank1:32, V1_g_id2:32,
				   (protocol:pack(string, V1_g_sid2))/binary,
				   (protocol:pack(string, V1_srv_name2))/binary,
				   (protocol:pack(string,
						  V1_guild_name2))/binary,
				   V1_rank2:32, V1_status:8, V1_g_id:32,
				   (protocol:pack(string, V1_g_sid))/binary>>
				 || {{V1_g_id1, V1_g_sid1}, V1_srv_name1,
				     V1_guild_name1, V1_rank1,
				     {V1_g_id2, V1_g_sid2}, V1_srv_name2,
				     V1_guild_name2, V1_rank2, V1_status,
				     {V1_g_id, V1_g_sid}}
					<- V0_match_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24205:16,
       D_a_t_a/binary>>};
pack(24206, cli, {}) -> {ok, <<2:32, 24206:16>>};
pack(24206, srv, {V0_flag, V0_defense}) ->
    D_a_t_a = <<V0_flag:8, (length(V0_defense)):16,
		(list_to_binary([<<V1_pos:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_power:32, V1_hp:16,
				   V1_hp_max:16, V1_relic_def_count:16,
				   V1_status:8, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #guild_war_role{pos = V1_pos,
						    id = {V1_rid, V1_srv_id},
						    name = V1_name,
						    lev = V1_lev,
						    face = V1_face,
						    power = V1_power,
						    hp = V1_hp,
						    hp_max = V1_hp_max,
						    relic_def_count =
							V1_relic_def_count,
						    status = V1_status,
						    face_update_time =
							V1_face_update_time,
						    face_file = V1_face_file}
					<- V0_defense]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24206:16,
       D_a_t_a/binary>>};
pack(24207, cli, {}) -> {ok, <<2:32, 24207:16>>};
pack(24207, srv,
     {V0_ranks,
      #guild_war_sign{hp = V0_hp, buff_lev = V0_buff_lev},
      V0_hp2}) ->
    D_a_t_a = <<(length(V0_ranks)):16,
		(list_to_binary([<<V1_rank:32,
				   (protocol:pack(string, V1_name))/binary>>
				 || {V1_rank, V1_name} <- V0_ranks]))/binary,
		V0_hp:16, V0_buff_lev:16, V0_hp2:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24207:16,
       D_a_t_a/binary>>};
pack(24208, cli, {}) -> {ok, <<2:32, 24208:16>>};
pack(24208, srv,
     {#guild_war_sign{hp = V0_hp, defense = V0_defense,
		      avg_power = V0_avg_power}}) ->
    D_a_t_a = <<V0_hp:16, (length(V0_defense)):16,
		(list_to_binary([<<V1_pos:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_power:32, V1_hp:16,
				   V1_hp_max:16, V1_relic_def_count:16,
				   V1_status:8, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #guild_war_role{pos = V1_pos,
						    id = {V1_rid, V1_srv_id},
						    name = V1_name,
						    lev = V1_lev,
						    face = V1_face,
						    power = V1_power,
						    hp = V1_hp,
						    hp_max = V1_hp_max,
						    relic_def_count =
							V1_relic_def_count,
						    status = V1_status,
						    face_update_time =
							V1_face_update_time,
						    face_file = V1_face_file}
					<- V0_defense]))/binary,
		V0_avg_power:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24208:16,
       D_a_t_a/binary>>};
pack(24209, cli, {{V0_g_id1, V0_g_sid1}, V0_pos}) ->
    D_a_t_a = <<V0_g_id1:32,
		(protocol:pack(string, V0_g_sid1))/binary, V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24209:16,
       D_a_t_a/binary>>};
pack(24209, srv,
     {V0_power, V0_formation_type, V0_formation_lev,
      V0_defense, V0_guild_war_role_log}) ->
    D_a_t_a = <<V0_power:32, V0_formation_type:32,
		V0_formation_lev:32, (length(V0_defense)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_star:8, V1_use_skin:32, V1_end_time:8,
				   V1_resonate_lev:32>>
				 || {V1_pos, V1_bid, V1_lev, V1_star,
				     V1_use_skin, V1_end_time, V1_resonate_lev}
					<- V0_defense]))/binary,
		(length(V0_guild_war_role_log)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_power:32,
				   V1_time:32, V1_repaly_id:32, V1_hp:16,
				   V1_result:8, V1_formation_type:32,
				   V1_formation_lev:32, (length(V1_defense)):16,
				   (list_to_binary([<<V2_pos:8, V2_bid:32,
						      V2_lev:16, V2_star:8,
						      V2_use_skin:32,
						      V2_end_time:8,
						      V2_resonate_lev:32>>
						    || {V2_pos, V2_bid, V2_lev,
							V2_star, V2_use_skin,
							V2_end_time,
							V2_resonate_lev}
							   <- V1_defense]))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #guild_war_role_log{id =
							    {V1_rid, V1_srv_id},
							name = V1_name,
							lev = V1_lev,
							face = V1_face,
							power = V1_power,
							time = V1_time,
							repaly_id =
							    V1_repaly_id,
							hp = V1_hp,
							result = V1_result,
							formation_type =
							    V1_formation_type,
							formation_lev =
							    V1_formation_lev,
							defense = V1_defense,
							face_update_time =
							    V1_face_update_time,
							face_file =
							    V1_face_file}
					<- V0_guild_war_role_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24209:16,
       D_a_t_a/binary>>};
pack(24210, cli, {}) -> {ok, <<2:32, 24210:16>>};
pack(24210, srv, {}) -> {ok, <<2:32, 24210:16>>};
pack(24212, cli, {}) -> {ok, <<2:32, 24212:16>>};
pack(24212, srv, {V0_guild_war_log}) ->
    D_a_t_a = <<(length(V0_guild_war_log)):16,
		(list_to_binary([<<V1_flag1:8, V1_flag2:8, V1_time:32,
				   V1_rid1:32,
				   (protocol:pack(string, V1_srv_id1))/binary,
				   (protocol:pack(string, V1_name1))/binary,
				   V1_rid2:32,
				   (protocol:pack(string, V1_srv_id2))/binary,
				   (protocol:pack(string, V1_name2))/binary,
				   V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   (length(V1_int_args)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_int_args]))/binary,
				   (length(V1_str_args)):16,
				   (list_to_binary([<<V2_key:32,
						      (protocol:pack(string,
								     V2_val))/binary>>
						    || {V2_key, V2_val}
							   <- V1_str_args]))/binary>>
				 || #guild_war_log{flag1 = V1_flag1,
						   flag2 = V1_flag2,
						   time = V1_time,
						   id1 = {V1_rid1, V1_srv_id1},
						   name1 = V1_name1,
						   id2 = {V1_rid2, V1_srv_id2},
						   name2 = V1_name2,
						   gid = {V1_rid, V1_srv_id},
						   gname = V1_gname,
						   int_args = V1_int_args,
						   str_args = V1_str_args}
					<- V0_guild_war_log]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24212:16,
       D_a_t_a/binary>>};
pack(24213, cli, {}) -> {ok, <<2:32, 24213:16>>};
pack(24213, srv, {V0_ranks}) ->
    D_a_t_a = <<(length(V0_ranks)):16,
		(list_to_binary([<<V1_rank:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_face:32, V1_lev:32,
				   (protocol:pack(string, V1_name))/binary,
				   V1_star:32, V1_war_score:32, V1_look_id:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {V1_rank, {V1_rid, V1_srv_id}, V1_face,
				     V1_lev, V1_name, V1_star, V1_war_score,
				     V1_look_id, V1_face_update_time,
				     V1_face_file}
					<- V0_ranks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24213:16,
       D_a_t_a/binary>>};
pack(24214, cli, {}) -> {ok, <<2:32, 24214:16>>};
pack(24214, srv, {V0_result}) ->
    D_a_t_a = <<V0_result:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24214:16,
       D_a_t_a/binary>>};
pack(24220, cli, {}) -> {ok, <<2:32, 24220:16>>};
pack(24220, srv,
     {V0_result, V0_end_time, V0_status,
      V0_guild_war_box}) ->
    D_a_t_a = <<V0_result:8, V0_end_time:32, V0_status:8,
		(length(V0_guild_war_box)):16,
		(list_to_binary([<<V1_order:16, V1_rid:32,
				   (protocol:pack(string, V1_sid))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_item_id:32, V1_item_num:32>>
				 || #guild_war_box{order = V1_order,
						   rid = V1_rid, sid = V1_sid,
						   name = V1_name,
						   item_id = V1_item_id,
						   item_num = V1_item_num}
					<- V0_guild_war_box]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24220:16,
       D_a_t_a/binary>>};
pack(24221, cli, {V0_order}) ->
    D_a_t_a = <<V0_order:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24221:16,
       D_a_t_a/binary>>};
pack(24221, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24221:16,
       D_a_t_a/binary>>};
pack(24223, cli, {}) -> {ok, <<2:32, 24223:16>>};
pack(24223, srv,
     {#guild_war_box{order = V0_order, rid = V0_rid,
		     sid = V0_sid, name = V0_name, item_id = V0_item_id,
		     item_num = V0_item_num}}) ->
    D_a_t_a = <<V0_order:16, V0_rid:32,
		(protocol:pack(string, V0_sid))/binary,
		(protocol:pack(string, V0_name))/binary, V0_item_id:32,
		V0_item_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24223:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24200, srv, _B0) -> {ok, {}};
unpack(24200, cli, _B0) ->
    {V1_count, _B1} = protocol:uint32(_B0),
    {V1_result, _B2} = protocol:uint8(_B1),
    {V1_ranks, _B7} = protocol:array(_B2,
				     fun (_B3) ->
					     {V2_rank, _B4} =
						 protocol:uint32(_B3),
					     {V2_name, _B5} =
						 protocol:string(_B4),
					     {{V2_rank, V2_name}, _B5}
				     end),
    {V1_gname1, _B8} = protocol:string(_B7),
    {V1_hp1, _B9} = protocol:uint16(_B8),
    {V1_buff_lev1, _B10} = protocol:uint16(_B9),
    {V1_gname2, _B11} = protocol:string(_B10),
    {V1_g_id, _B12} = protocol:uint32(_B11),
    {V1_g_sid, _B13} = protocol:string(_B12),
    {V1_hp2, _B14} = protocol:uint16(_B13),
    {V1_defense, _B30} = protocol:array(_B14,
					fun (_B15) ->
						{V2_pos, _B16} =
						    protocol:uint8(_B15),
						{V2_rid, _B17} =
						    protocol:uint32(_B16),
						{V2_srv_id, _B18} =
						    protocol:string(_B17),
						{V2_name, _B19} =
						    protocol:string(_B18),
						{V2_lev, _B20} =
						    protocol:uint16(_B19),
						{V2_face, _B21} =
						    protocol:uint32(_B20),
						{V2_power, _B22} =
						    protocol:uint32(_B21),
						{V2_hp, _B23} =
						    protocol:uint16(_B22),
						{V2_hp_max, _B24} =
						    protocol:uint16(_B23),
						{V2_relic_def_count, _B25} =
						    protocol:uint16(_B24),
						{V2_status, _B26} =
						    protocol:uint8(_B25),
						{V2_face_update_time, _B27} =
						    protocol:uint32(_B26),
						{V2_face_file, _B28} =
						    protocol:string(_B27),
						{{V2_pos, V2_rid, V2_srv_id,
						  V2_name, V2_lev, V2_face,
						  V2_power, V2_hp, V2_hp_max,
						  V2_relic_def_count, V2_status,
						  V2_face_update_time,
						  V2_face_file},
						 _B28}
					end),
    {ok,
     {V1_count, V1_result, V1_ranks, V1_gname1, V1_hp1,
      V1_buff_lev1, V1_gname2, V1_g_id, V1_g_sid, V1_hp2,
      V1_defense}};
unpack(24201, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0), {ok, {V1_pos}};
unpack(24201, cli, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint16(_B4),
    {V1_face, _B6} = protocol:uint32(_B5),
    {V1_power, _B7} = protocol:uint32(_B6),
    {V1_formation_type, _B8} = protocol:uint16(_B7),
    {V1_formation_lev, _B9} = protocol:uint16(_B8),
    {V1_hp, _B10} = protocol:uint16(_B9),
    {V1_hp_max, _B11} = protocol:uint16(_B10),
    {V1_def_count, _B12} = protocol:uint16(_B11),
    {V1_relic_def_count, _B13} = protocol:uint16(_B12),
    {V1_defense, _B25} = protocol:array(_B13,
					fun (_B14) ->
						{V2_pos, _B15} =
						    protocol:uint8(_B14),
						{V2_bid, _B16} =
						    protocol:uint32(_B15),
						{V2_lev, _B17} =
						    protocol:uint16(_B16),
						{V2_star, _B18} =
						    protocol:uint8(_B17),
						{V2_ext_data, _B23} =
						    protocol:array(_B18,
								   fun (_B19) ->
									   {V3_key,
									    _B20} =
									       protocol:uint32(_B19),
									   {V3_val,
									    _B21} =
									       protocol:uint32(_B20),
									   {{V3_key,
									     V3_val},
									    _B21}
								   end),
						{{V2_pos, V2_bid, V2_lev,
						  V2_star, V2_ext_data},
						 _B23}
					end),
    {V1_face_update_time, _B26} = protocol:uint32(_B25),
    {V1_face_file, _B27} = protocol:string(_B26),
    {ok,
     {V1_pos, V1_rid, V1_srv_id, V1_name, V1_lev, V1_face,
      V1_power, V1_formation_type, V1_formation_lev, V1_hp,
      V1_hp_max, V1_def_count, V1_relic_def_count, V1_defense,
      V1_face_update_time, V1_face_file}};
unpack(24202, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0),
    {V1_hp, _B2} = protocol:uint16(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {ok, {V1_pos, V1_hp, V1_flag}};
unpack(24202, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_count}};
unpack(24203, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_timer, _B2} = protocol:uint32(_B1),
    {V1_item_rewards, _B7} = protocol:array(_B2,
					    fun (_B3) ->
						    {V2_bid, _B4} =
							protocol:uint32(_B3),
						    {V2_num, _B5} =
							protocol:uint32(_B4),
						    {{V2_bid, V2_num}, _B5}
					    end),
    {V1_all_dps, _B8} = protocol:uint32(_B7),
    {V1_best_partner, _B9} = protocol:uint32(_B8),
    {V1_bid, _B10} = protocol:uint32(_B9),
    {V1_lev, _B11} = protocol:uint16(_B10),
    {V1_star, _B12} = protocol:uint8(_B11),
    {V1_use_skin, _B13} = protocol:uint32(_B12),
    {V1_target_role_name, _B14} = protocol:string(_B13),
    {V1_hurt_statistics, _B36} = protocol:array(_B14,
						fun (_B15) ->
							{V2_type, _B16} =
							    protocol:uint8(_B15),
							{V2_partner_hurts,
							 _B34} =
							    protocol:array(_B16,
									   fun
									     (_B17) ->
										 {V3_rid,
										  _B18} =
										     protocol:uint32(_B17),
										 {V3_srvid,
										  _B19} =
										     protocol:string(_B18),
										 {V3_id,
										  _B20} =
										     protocol:uint32(_B19),
										 {V3_bid,
										  _B21} =
										     protocol:uint32(_B20),
										 {V3_star,
										  _B22} =
										     protocol:uint32(_B21),
										 {V3_lev,
										  _B23} =
										     protocol:uint32(_B22),
										 {V3_camp_type,
										  _B24} =
										     protocol:uint32(_B23),
										 {V3_dps,
										  _B25} =
										     protocol:uint32(_B24),
										 {V3_cure,
										  _B26} =
										     protocol:uint32(_B25),
										 {V3_ext_data,
										  _B31} =
										     protocol:array(_B26,
												    fun
												      (_B27) ->
													  {V4_key,
													   _B28} =
													      protocol:uint32(_B27),
													  {V4_val,
													   _B29} =
													      protocol:uint32(_B28),
													  {{V4_key,
													    V4_val},
													   _B29}
												    end),
										 {V3_be_hurt,
										  _B32} =
										     protocol:uint32(_B31),
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
										  _B32}
									   end),
							{{V2_type,
							  V2_partner_hurts},
							 _B34}
						end),
    {V1_replay_id, _B37} = protocol:uint32(_B36),
    {ok,
     {V1_result, V1_timer, V1_item_rewards, V1_all_dps,
      V1_best_partner, V1_bid, V1_lev, V1_star, V1_use_skin,
      V1_target_role_name, V1_hurt_statistics, V1_replay_id}};
unpack(24204, srv, _B0) -> {ok, {}};
unpack(24204, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_start_time, _B3} = protocol:uint32(_B2),
    {V1_end_time, _B4} = protocol:uint32(_B3),
    {ok, {V1_status, V1_flag, V1_start_time, V1_end_time}};
unpack(24205, srv, _B0) -> {ok, {}};
unpack(24205, cli, _B0) ->
    {V1_match_info, _B16} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_g_id1, _B2} =
						       protocol:uint32(_B1),
						   {V2_g_sid1, _B3} =
						       protocol:string(_B2),
						   {V2_srv_name1, _B4} =
						       protocol:string(_B3),
						   {V2_guild_name1, _B5} =
						       protocol:string(_B4),
						   {V2_rank1, _B6} =
						       protocol:uint32(_B5),
						   {V2_g_id2, _B7} =
						       protocol:uint32(_B6),
						   {V2_g_sid2, _B8} =
						       protocol:string(_B7),
						   {V2_srv_name2, _B9} =
						       protocol:string(_B8),
						   {V2_guild_name2, _B10} =
						       protocol:string(_B9),
						   {V2_rank2, _B11} =
						       protocol:uint32(_B10),
						   {V2_status, _B12} =
						       protocol:uint8(_B11),
						   {V2_g_id, _B13} =
						       protocol:uint32(_B12),
						   {V2_g_sid, _B14} =
						       protocol:string(_B13),
						   {{V2_g_id1, V2_g_sid1,
						     V2_srv_name1,
						     V2_guild_name1, V2_rank1,
						     V2_g_id2, V2_g_sid2,
						     V2_srv_name2,
						     V2_guild_name2, V2_rank2,
						     V2_status, V2_g_id,
						     V2_g_sid},
						    _B14}
					   end),
    {ok, {V1_match_info}};
unpack(24206, srv, _B0) -> {ok, {}};
unpack(24206, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_defense, _B17} = protocol:array(_B1,
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
						{V2_face, _B8} =
						    protocol:uint32(_B7),
						{V2_power, _B9} =
						    protocol:uint32(_B8),
						{V2_hp, _B10} =
						    protocol:uint16(_B9),
						{V2_hp_max, _B11} =
						    protocol:uint16(_B10),
						{V2_relic_def_count, _B12} =
						    protocol:uint16(_B11),
						{V2_status, _B13} =
						    protocol:uint8(_B12),
						{V2_face_update_time, _B14} =
						    protocol:uint32(_B13),
						{V2_face_file, _B15} =
						    protocol:string(_B14),
						{{V2_pos, V2_rid, V2_srv_id,
						  V2_name, V2_lev, V2_face,
						  V2_power, V2_hp, V2_hp_max,
						  V2_relic_def_count, V2_status,
						  V2_face_update_time,
						  V2_face_file},
						 _B15}
					end),
    {ok, {V1_flag, V1_defense}};
unpack(24207, srv, _B0) -> {ok, {}};
unpack(24207, cli, _B0) ->
    {V1_ranks, _B5} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_rank, _B2} =
						 protocol:uint32(_B1),
					     {V2_name, _B3} =
						 protocol:string(_B2),
					     {{V2_rank, V2_name}, _B3}
				     end),
    {V1_hp, _B6} = protocol:uint16(_B5),
    {V1_buff_lev, _B7} = protocol:uint16(_B6),
    {V1_hp2, _B8} = protocol:uint16(_B7),
    {ok, {V1_ranks, V1_hp, V1_buff_lev, V1_hp2}};
unpack(24208, srv, _B0) -> {ok, {}};
unpack(24208, cli, _B0) ->
    {V1_hp, _B1} = protocol:uint16(_B0),
    {V1_defense, _B17} = protocol:array(_B1,
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
						{V2_face, _B8} =
						    protocol:uint32(_B7),
						{V2_power, _B9} =
						    protocol:uint32(_B8),
						{V2_hp, _B10} =
						    protocol:uint16(_B9),
						{V2_hp_max, _B11} =
						    protocol:uint16(_B10),
						{V2_relic_def_count, _B12} =
						    protocol:uint16(_B11),
						{V2_status, _B13} =
						    protocol:uint8(_B12),
						{V2_face_update_time, _B14} =
						    protocol:uint32(_B13),
						{V2_face_file, _B15} =
						    protocol:string(_B14),
						{{V2_pos, V2_rid, V2_srv_id,
						  V2_name, V2_lev, V2_face,
						  V2_power, V2_hp, V2_hp_max,
						  V2_relic_def_count, V2_status,
						  V2_face_update_time,
						  V2_face_file},
						 _B15}
					end),
    {V1_avg_power, _B18} = protocol:uint32(_B17),
    {ok, {V1_hp, V1_defense, V1_avg_power}};
unpack(24209, srv, _B0) ->
    {V1_g_id1, _B1} = protocol:uint32(_B0),
    {V1_g_sid1, _B2} = protocol:string(_B1),
    {V1_pos, _B3} = protocol:uint32(_B2),
    {ok, {V1_g_id1, V1_g_sid1, V1_pos}};
unpack(24209, cli, _B0) ->
    {V1_power, _B1} = protocol:uint32(_B0),
    {V1_formation_type, _B2} = protocol:uint32(_B1),
    {V1_formation_lev, _B3} = protocol:uint32(_B2),
    {V1_defense, _B13} = protocol:array(_B3,
					fun (_B4) ->
						{V2_pos, _B5} =
						    protocol:uint8(_B4),
						{V2_bid, _B6} =
						    protocol:uint32(_B5),
						{V2_lev, _B7} =
						    protocol:uint16(_B6),
						{V2_star, _B8} =
						    protocol:uint8(_B7),
						{V2_use_skin, _B9} =
						    protocol:uint32(_B8),
						{V2_end_time, _B10} =
						    protocol:uint8(_B9),
						{V2_resonate_lev, _B11} =
						    protocol:uint32(_B10),
						{{V2_pos, V2_bid, V2_lev,
						  V2_star, V2_use_skin,
						  V2_end_time, V2_resonate_lev},
						 _B11}
					end),
    {V1_guild_war_role_log, _B40} = protocol:array(_B13,
						   fun (_B14) ->
							   {V2_rid, _B15} =
							       protocol:uint32(_B14),
							   {V2_srv_id, _B16} =
							       protocol:string(_B15),
							   {V2_name, _B17} =
							       protocol:string(_B16),
							   {V2_lev, _B18} =
							       protocol:uint16(_B17),
							   {V2_face, _B19} =
							       protocol:uint32(_B18),
							   {V2_power, _B20} =
							       protocol:uint32(_B19),
							   {V2_time, _B21} =
							       protocol:uint32(_B20),
							   {V2_repaly_id,
							    _B22} =
							       protocol:uint32(_B21),
							   {V2_hp, _B23} =
							       protocol:uint16(_B22),
							   {V2_result, _B24} =
							       protocol:uint8(_B23),
							   {V2_formation_type,
							    _B25} =
							       protocol:uint32(_B24),
							   {V2_formation_lev,
							    _B26} =
							       protocol:uint32(_B25),
							   {V2_defense, _B36} =
							       protocol:array(_B26,
									      fun
										(_B27) ->
										    {V3_pos,
										     _B28} =
											protocol:uint8(_B27),
										    {V3_bid,
										     _B29} =
											protocol:uint32(_B28),
										    {V3_lev,
										     _B30} =
											protocol:uint16(_B29),
										    {V3_star,
										     _B31} =
											protocol:uint8(_B30),
										    {V3_use_skin,
										     _B32} =
											protocol:uint32(_B31),
										    {V3_end_time,
										     _B33} =
											protocol:uint8(_B32),
										    {V3_resonate_lev,
										     _B34} =
											protocol:uint32(_B33),
										    {{V3_pos,
										      V3_bid,
										      V3_lev,
										      V3_star,
										      V3_use_skin,
										      V3_end_time,
										      V3_resonate_lev},
										     _B34}
									      end),
							   {V2_face_update_time,
							    _B37} =
							       protocol:uint32(_B36),
							   {V2_face_file,
							    _B38} =
							       protocol:string(_B37),
							   {{V2_rid, V2_srv_id,
							     V2_name, V2_lev,
							     V2_face, V2_power,
							     V2_time,
							     V2_repaly_id,
							     V2_hp, V2_result,
							     V2_formation_type,
							     V2_formation_lev,
							     V2_defense,
							     V2_face_update_time,
							     V2_face_file},
							    _B38}
						   end),
    {ok,
     {V1_power, V1_formation_type, V1_formation_lev,
      V1_defense, V1_guild_war_role_log}};
unpack(24210, srv, _B0) -> {ok, {}};
unpack(24210, cli, _B0) -> {ok, {}};
unpack(24212, srv, _B0) -> {ok, {}};
unpack(24212, cli, _B0) ->
    {V1_guild_war_log, _B25} = protocol:array(_B0,
					      fun (_B1) ->
						      {V2_flag1, _B2} =
							  protocol:uint8(_B1),
						      {V2_flag2, _B3} =
							  protocol:uint8(_B2),
						      {V2_time, _B4} =
							  protocol:uint32(_B3),
						      {V2_rid1, _B5} =
							  protocol:uint32(_B4),
						      {V2_srv_id1, _B6} =
							  protocol:string(_B5),
						      {V2_name1, _B7} =
							  protocol:string(_B6),
						      {V2_rid2, _B8} =
							  protocol:uint32(_B7),
						      {V2_srv_id2, _B9} =
							  protocol:string(_B8),
						      {V2_name2, _B10} =
							  protocol:string(_B9),
						      {V2_rid, _B11} =
							  protocol:uint32(_B10),
						      {V2_srv_id, _B12} =
							  protocol:string(_B11),
						      {V2_gname, _B13} =
							  protocol:string(_B12),
						      {V2_int_args, _B18} =
							  protocol:array(_B13,
									 fun
									   (_B14) ->
									       {V3_key,
										_B15} =
										   protocol:uint32(_B14),
									       {V3_val,
										_B16} =
										   protocol:uint32(_B15),
									       {{V3_key,
										 V3_val},
										_B16}
									 end),
						      {V2_str_args, _B23} =
							  protocol:array(_B18,
									 fun
									   (_B19) ->
									       {V3_key,
										_B20} =
										   protocol:uint32(_B19),
									       {V3_val,
										_B21} =
										   protocol:string(_B20),
									       {{V3_key,
										 V3_val},
										_B21}
									 end),
						      {{V2_flag1, V2_flag2,
							V2_time, V2_rid1,
							V2_srv_id1, V2_name1,
							V2_rid2, V2_srv_id2,
							V2_name2, V2_rid,
							V2_srv_id, V2_gname,
							V2_int_args,
							V2_str_args},
						       _B23}
					      end),
    {ok, {V1_guild_war_log}};
unpack(24213, srv, _B0) -> {ok, {}};
unpack(24213, cli, _B0) ->
    {V1_ranks, _B14} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_rank, _B2} =
						  protocol:uint32(_B1),
					      {V2_rid, _B3} =
						  protocol:uint32(_B2),
					      {V2_srv_id, _B4} =
						  protocol:string(_B3),
					      {V2_face, _B5} =
						  protocol:uint32(_B4),
					      {V2_lev, _B6} =
						  protocol:uint32(_B5),
					      {V2_name, _B7} =
						  protocol:string(_B6),
					      {V2_star, _B8} =
						  protocol:uint32(_B7),
					      {V2_war_score, _B9} =
						  protocol:uint32(_B8),
					      {V2_look_id, _B10} =
						  protocol:uint32(_B9),
					      {V2_face_update_time, _B11} =
						  protocol:uint32(_B10),
					      {V2_face_file, _B12} =
						  protocol:string(_B11),
					      {{V2_rank, V2_rid, V2_srv_id,
						V2_face, V2_lev, V2_name,
						V2_star, V2_war_score,
						V2_look_id, V2_face_update_time,
						V2_face_file},
					       _B12}
				      end),
    {ok, {V1_ranks}};
unpack(24214, srv, _B0) -> {ok, {}};
unpack(24214, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {ok, {V1_result}};
unpack(24220, srv, _B0) -> {ok, {}};
unpack(24220, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_status, _B3} = protocol:uint8(_B2),
    {V1_guild_war_box, _B12} = protocol:array(_B3,
					      fun (_B4) ->
						      {V2_order, _B5} =
							  protocol:uint16(_B4),
						      {V2_rid, _B6} =
							  protocol:uint32(_B5),
						      {V2_sid, _B7} =
							  protocol:string(_B6),
						      {V2_name, _B8} =
							  protocol:string(_B7),
						      {V2_item_id, _B9} =
							  protocol:uint32(_B8),
						      {V2_item_num, _B10} =
							  protocol:uint32(_B9),
						      {{V2_order, V2_rid,
							V2_sid, V2_name,
							V2_item_id,
							V2_item_num},
						       _B10}
					      end),
    {ok,
     {V1_result, V1_end_time, V1_status, V1_guild_war_box}};
unpack(24221, srv, _B0) ->
    {V1_order, _B1} = protocol:uint16(_B0),
    {ok, {V1_order}};
unpack(24221, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(24223, srv, _B0) -> {ok, {}};
unpack(24223, cli, _B0) ->
    {V1_order, _B1} = protocol:uint16(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_sid, _B3} = protocol:string(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_item_id, _B5} = protocol:uint32(_B4),
    {V1_item_num, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_order, V1_rid, V1_sid, V1_name, V1_item_id,
      V1_item_num}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


