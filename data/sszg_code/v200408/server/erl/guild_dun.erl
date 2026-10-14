-file("data/guild_dun.erl", 1).

-file("src/mod/guild_dun/guild_dun.erl", 1).

-module(guild_dun).

-lager_records([{map_role,
		 [pid, rid, srv_id, name, conn_pid, map, grid_pid, speed,
		  x, y, dir, gx, gy, status, event, label, lev, sex,
		  career, face, fc, avatar, looks]},
		{role_robot,
		 [id, account, platform, zone_id, channel, name, gid,
		  gname, lev, power, sex, career, face_id, face_file,
		  face_update_time, avatar_bid, avatar_frames, say_frames,
		  vip_lev, pos_info, partners, m_formation, sign, city,
		  max_dun_id, m_star, auto_pk, m_hallows, max_star_tower,
		  elite_lev, is_show_vip, arena_elite_defens, m_halidom,
		  m_guild_skill, arena_elite_manifesto,
		  arena_cluster_formation, city_id, honor, honor_badges,
		  honor_point, use_badges, fanse_list, grow_info,
		  room_bbs_set, backdrop_id, is_open_home, soft,
		  max_power, m_resonate_lev, m_sprite_tree,
		  m_arena_peak_champion, look_id, holiday_nian_face]},
		{role,
		 [ver, id, need_sync, loop_counter, type, pid, link,
		  reg_ip, reg_time, trigger, status, s_event, s_event_pid,
		  combat_pid, combat_replay_pid, combat_type_list,
		  ui_combat_type, play_speed, is_in_backstage, is_auto,
		  is_gain, is_ready, is_online, device_type, getui_cid,
		  channel, reg_channel, idfa, reg_idfa, device_id,
		  reg_device_id, os_name, reg_os_name, app_name,
		  reg_app_name, package_name, reg_package_name,
		  package_ver, reg_package_ver, os_ver, carrier_name,
		  net_type, resolution, platform, zone_id, account, name,
		  s_name, career, lev, uplev_time, sex, face_id,
		  face_list, hp, mspd, power, max_power, max_power_time,
		  arena_power, arena_max_power, arena_max_power_time,
		  banned_time, interdict_time, capacity, identity,
		  data_lock, timer, item_next_id, signature, city, assets,
		  pos, game_set, s_looks, login, misc, guild_bag,
		  surface_bag, partner_bag, m_look, m_charge, m_vip,
		  m_var, m_quest, m_drama, m_friend, m_mail, m_formation,
		  m_arena, m_feat, m_checkin, m_exchange, m_buff,
		  m_avatar, m_say, m_dungeon, m_boss, m_recruit, m_honor,
		  m_adventure, m_lev_gift, m_power_gift, m_star,
		  m_star_tower, m_market_silver, m_wish, m_login_days,
		  m_month_card, m_guild_dun, m_star_divination,
		  m_guild_skill, m_media_card_type, m_endless, m_dial,
		  m_days_ranks, m_escort, m_dun_stone, m_hallows,
		  m_day_goals, m_guild_quest, m_recruit_award,
		  m_sky_ladder, m_convert, m_shipping, m_expedition,
		  m_star_gift, holiday_assets, m_privilege, m_month_fund,
		  m_lanterm_festival, m_lanterm_adventure, m_invite_code,
		  misc_ext, m_arena_elite, arena_elite_power,
		  arena_elite_power_time, m_element_temple, m_halidom,
		  m_holiday_dial, arena_elite_max_star, m_break_egg,
		  m_welfare, m_dun_heaven, m_holiday_boss, m_war_order,
		  m_holiday_holy, m_week_card, m_holy_eqm_set,
		  m_arena_cluster, m_holiday_snatch, m_holiday_accumulate,
		  m_room, m_room_feat, m_holiday_boss_new,
		  m_holiday_return_feat, m_holiday_return_sign,
		  m_holiday_return, m_room_grow, m_lanterm_adventure1,
		  m_lanterm_adventure2, m_lanterm_adventure3, m_home,
		  m_home_pet, pet_bag, backdrop_id, backdrop_list,
		  m_holiday_predict, m_holiday_personal_gift, m_resonate,
		  m_resonate_extract, m_sprite_hatch, m_sprite_tree,
		  m_holiday_term_begins, m_holiday_petard, m_encounter,
		  m_holiday_merge_goal, m_arena_team, m_monopoly_maps,
		  m_training_camp, m_weekly, m_arena_peak_champion,
		  m_arena_elite_war_order, m_holiday_fire_gift,
		  m_holiday_personal_fire_gift, m_secret_dun,
		  m_holiday_return_new, m_holiday_charge_rebate,
		  m_holiday_charge_reset, m_holiday_optional_lottery,
		  m_holiday_lucky_dog, m_holiday_nian,
		  m_holiday_time_award, m_holiday_valentines, m_planes,
		  m_planes_war_order, m_new_war_order, m_face,
		  m_subscriber, m_holiday_dime, m_holiday_valentine_boss,
		  m_personal_push, m_holiday_new_week_card,
		  m_holiday_arena_team, m_holiday_practise_tower, p_bag,
		  p_eqm, p_home]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{m_guild_dun,
		 [var, formation_list, dps_list, first_list]},
		{guild_dun_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time, look_id,
		  face_update_time, face_file]},
		{guild_dun_rank_boss, [var, boss_id, list]},
		{guild_dun_rank_guild,
		 [var, rank, gid, name, r_name, max_id, time, day_dps,
		  leader_id]},
		{guild_dun_box, [var, boss_id, award_list]},
		{guild_dun,
		 [var, id, f_id, max_id, boss_list, box_award, rank_list,
		  unit_hp, buff_lev, buff_end_time, day_dps,
		  assemble_time]}]).

-behaviour(gen_server).

-export([add_dps/6, add_dps/7, close/1, set_type/2,
	 add_buff/1, assemble/2, gm_ref_buff/1, gm_set_f_id/2]).

-export([info/2, cast/2, call/2, start_link/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/guild_dun/guild_dun.erl", 24).

-file("inc/guild_dun.hrl", 1).

-record(guild_dun,
	{var = 2, id = {0, <<>>}, f_id = 0, max_id = 0,
	 boss_list = [], box_award = [], rank_list = [],
	 unit_hp = [], buff_lev = 0, buff_end_time = 0,
	 day_dps = 0, assemble_time = 0}).

-record(guild_dun_box,
	{var = 1, boss_id = 0, award_list = []}).

-record(guild_dun_rank_guild,
	{var = 1, rank = 0, gid = {0, <<>>}, name = <<>>,
	 r_name = <<>>, max_id = 0, time = 0, day_dps = 0,
	 leader_id = {0, <<>>}}).

-record(guild_dun_rank_boss, {var = 1, boss_id, list}).

-record(guild_dun_rank_role,
	{var = 3, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0,
	 look_id = 0  :: pos_integer(), face_update_time = 0,
	 face_file = <<>>}).

-record(m_guild_dun,
	{var = 2, formation_list = [], dps_list = [],
	 first_list = []}).

-file("src/mod/guild_dun/guild_dun.erl", 25).

-file("inc/game_assets.hrl", 1).

-file("src/mod/guild_dun/guild_dun.erl", 26).

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

-file("src/mod/guild_dun/guild_dun.erl", 27).

-file("inc/var.hrl", 1).

-record(m_var,
	{ver = -1, last_reset_time = 0  :: non_neg_integer(),
	 last_reset_day = {0, 0, 0}  ::
	     {non_neg_integer(), non_neg_integer(),
	      non_neg_integer()},
	 last_reset_five = 0  :: non_neg_integer(),
	 last_reset_week = {0, 0}  ::
	     {non_neg_integer(), non_neg_integer()},
	 last_acc_time = 0  :: non_neg_integer(),
	 acc_time = 0  :: non_neg_integer(),
	 login_charge_count = 0  :: non_neg_integer(),
	 acc_charge_count = 0  :: non_neg_integer(),
	 login_charge_num = 0  :: non_neg_integer(),
	 day_login = 0  :: non_neg_integer(),
	 acc_login_count = 0  :: non_neg_integer(),
	 total_acc_time = 0  :: non_neg_integer(),
	 acc_days = 1  :: non_neg_integer(),
	 best_days = 1  :: non_neg_integer(),
	 now_days = 1  :: non_neg_integer(),
	 month_days = 1  :: non_neg_integer(),
	 day_vars = []  :: [tuple()],
	 five_vars = []  :: [tuple()],
	 week_vars = []  :: [tuple()],
	 month_vars = []  :: [tuple()],
	 timeout_vars = []  :: [tuple()],
	 acc_vars = []  :: [tuple()],
	 other_vars = []  :: [tuple()],
	 week_five_vars = []  :: [tuple()],
	 week_five_time = 0  :: non_neg_integer()}).

-record(role_var,
	{id = {0, "", 0}  :: tuple(), vars = []  :: [tuple()]}).

-file("src/mod/guild_dun/guild_dun.erl", 28).

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

-file("src/mod/guild_dun/guild_dun.erl", 29).

-file("inc/role.hrl", 1).

-record(role,
	{ver = 78, id = {0, <<>>}, need_sync = 0,
	 loop_counter = 0, type = robot, pid, link, reg_ip,
	 reg_time = 0,
	 trigger = {1, []}  :: {pos_integer(), [tuple()]},
	 status = 0, s_event = 0, s_event_pid, combat_pid = 0,
	 combat_replay_pid = 0, combat_type_list = [],
	 ui_combat_type = 0, play_speed = 1,
	 is_in_backstage = false, is_auto = 0, is_gain = 0,
	 is_ready, is_online = 0, device_type = <<>>,
	 getui_cid = <<>>, channel = <<>>, reg_channel = <<>>,
	 idfa = <<>>, reg_idfa = <<>>, device_id = <<>>,
	 reg_device_id = <<>>, os_name = <<>>,
	 reg_os_name = <<>>, app_name = <<>>,
	 reg_app_name = <<>>, package_name = <<>>,
	 reg_package_name = <<>>, package_ver = <<>>,
	 reg_package_ver = <<>>, os_ver = <<>>,
	 carrier_name = <<>>, net_type = <<>>, resolution = <<>>,
	 platform = <<>>, zone_id = 0  :: non_neg_integer(),
	 account = <<>>, name = <<>>, s_name = 0, career = 0,
	 lev = 1, uplev_time = 0, sex = 0, face_id = 0,
	 face_list = [], hp = 0, mspd = 25, power = 0,
	 max_power = 0, max_power_time = 0, arena_power = 0,
	 arena_max_power = 0, arena_max_power_time = 0,
	 banned_time = 0, interdict_time = 0, capacity = 0,
	 identity = <<>>, data_lock = 0, timer, item_next_id = 1,
	 signature = <<>>, city = 0, assets, pos, game_set,
	 s_looks = []  ::
	     [{non_neg_integer(), non_neg_integer(),
	       non_neg_integer(), bitstring()}],
	 login, misc, guild_bag, surface_bag, partner_bag,
	 m_look, m_charge, m_vip, m_var, m_quest, m_drama,
	 m_friend, m_mail = [], m_formation, m_arena, m_feat,
	 m_checkin, m_exchange, m_buff, m_avatar, m_say,
	 m_dungeon, m_boss, m_recruit, m_honor, m_adventure,
	 m_lev_gift, m_power_gift, m_star, m_star_tower,
	 m_market_silver, m_wish, m_login_days, m_month_card,
	 m_guild_dun, m_star_divination, m_guild_skill,
	 m_media_card_type = [], m_endless, m_dial, m_days_ranks,
	 m_escort, m_dun_stone, m_hallows, m_day_goals,
	 m_guild_quest, m_recruit_award, m_sky_ladder, m_convert,
	 m_shipping, m_expedition, m_star_gift,
	 holiday_assets = [], m_privilege, m_month_fund,
	 m_lanterm_festival, m_lanterm_adventure, m_invite_code,
	 misc_ext, m_arena_elite, arena_elite_power = 0,
	 arena_elite_power_time = 0, m_element_temple, m_halidom,
	 m_holiday_dial, arena_elite_max_star = 0, m_break_egg,
	 m_welfare, m_dun_heaven, m_holiday_boss, m_war_order,
	 m_holiday_holy, m_week_card, m_holy_eqm_set,
	 m_arena_cluster, m_holiday_snatch, m_holiday_accumulate,
	 m_room, m_room_feat, m_holiday_boss_new,
	 m_holiday_return_feat, m_holiday_return_sign,
	 m_holiday_return, m_room_grow, m_lanterm_adventure1,
	 m_lanterm_adventure2, m_lanterm_adventure3, m_home,
	 m_home_pet, pet_bag, backdrop_id = 0,
	 backdrop_list = [], m_holiday_predict,
	 m_holiday_personal_gift, m_resonate, m_resonate_extract,
	 m_sprite_hatch, m_sprite_tree, m_holiday_term_begins,
	 m_holiday_petard, m_encounter, m_holiday_merge_goal,
	 m_arena_team, m_monopoly_maps, m_training_camp,
	 m_weekly, m_arena_peak_champion,
	 m_arena_elite_war_order, m_holiday_fire_gift,
	 m_holiday_personal_fire_gift, m_secret_dun,
	 m_holiday_return_new, m_holiday_charge_rebate,
	 m_holiday_charge_reset, m_holiday_optional_lottery,
	 m_holiday_lucky_dog, m_holiday_nian,
	 m_holiday_time_award, m_holiday_valentines, m_planes,
	 m_planes_war_order, m_new_war_order, m_face,
	 m_subscriber, m_holiday_dime, m_holiday_valentine_boss,
	 m_personal_push, m_holiday_new_week_card,
	 m_holiday_arena_team, m_holiday_practise_tower, p_bag,
	 p_eqm, p_home}).

-record(role_robot,
	{id = {0, <<>>}, account = <<>>, platform = <<>>,
	 zone_id = 0, channel = <<>>, name = <<>>,
	 gid = {0, <<>>}, gname = <<>>, lev = 0, power = 0,
	 sex = 0, career = 0, face_id = 0, face_file = <<>>,
	 face_update_time = 0, avatar_bid = 0,
	 avatar_frames = [], say_frames = [], vip_lev = 0,
	 pos_info = [], partners = [], m_formation = [],
	 sign = <<>>, city = 0, max_dun_id = 0, m_star,
	 auto_pk = 0, m_hallows, max_star_tower = 0,
	 elite_lev = 0, is_show_vip = 0, arena_elite_defens = [],
	 m_halidom, m_guild_skill, arena_elite_manifesto = [],
	 arena_cluster_formation = [], city_id = 0, honor = 0,
	 honor_badges = [], honor_point = 0, use_badges = [],
	 fanse_list = [], grow_info = [], room_bbs_set = 1,
	 backdrop_id = 0, is_open_home = 0, soft = 0,
	 max_power = 0, m_resonate_lev = 0, m_sprite_tree,
	 m_arena_peak_champion, look_id = 0,
	 holiday_nian_face = []}).

-record(map_role,
	{pid  :: undefined | pid(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 conn_pid  :: undefined | pid(),
	 map = 0  :: non_neg_integer(), grid_pid  :: pid(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 dir = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 event = 0  :: non_neg_integer(), label = 0  :: 0..2,
	 lev = 1  :: pos_integer(), sex = 0  :: 0..2,
	 career = 0  :: non_neg_integer(),
	 face = 1  :: pos_integer(),
	 fc = 0  :: non_neg_integer(),
	 avatar = 0  :: non_neg_integer(),
	 looks = []  :: list()}).

-file("src/mod/guild_dun/guild_dun.erl", 30).

-spec gm_ref_buff(#role{}) -> #role{}.

gm_ref_buff(#role{guild_bag = #guild_bag{id = Gid}}) ->
    case ets:lookup(guild_dun_pids, Gid) of
      [{_, Pid}] when is_pid(Pid) -> info(Pid, gm_ref_buff);
      _ -> {error, not_pid}
    end.

-spec gm_set_f_id(pos_integer(), pos_integer()) -> ok.

gm_set_f_id(#role{guild_bag = #guild_bag{id = Gid}},
	    Fid) ->
    gm_set_f_id(Gid, Fid);
gm_set_f_id(Gid, Fid) ->
    case ets:lookup(guild_dun_pids, Gid) of
      [{_, Pid}] when is_pid(Pid) ->
	  info(Pid, {gm_set_f_id, Fid});
      _ ->
	  {false,
	   lang:get(<<"Không thể tìm thấy thông tin liên minh "
		      "đã chỉ định."/utf8>>)}
    end.

add_dps(Gid, Dps, BossId, MonDpsList, Result, GName) ->
    case ets:lookup(guild_dun_pids, Gid) of
      [{_, Pid}] when is_pid(Pid) ->
	  call(Pid,
	       {add_dps, Dps, BossId, MonDpsList, Result, Gid, GName});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_dun58, _,
	     {__Levelguild_dun58, __Tracesguild_dun58}}
		when __Levelguild_dun58 band 8 /= 0 orelse
		       __Tracesguild_dun58 /= [] ->
		lager:do_log(error,
			     [{module, guild_dun}, {function, add_dps},
			      {line, 58}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法获取公会副本进程:~w   ~w", [Gid, GName]),
			     none, 4096, 8, __Levelguild_dun58,
			     __Tracesguild_dun58, lager_event,
			     __Pidguild_dun58);
	    _ -> ok
	  end,
	  {error, not_pid}
    end.

add_dps(Gid, Dps, BossId, MonDpsList, Result, GName,
	GuildBoosRankInfo) ->
    case ets:lookup(guild_dun_pids, Gid) of
      [{_, Pid}] when is_pid(Pid) ->
	  call(Pid,
	       {add_dps, Dps, BossId, MonDpsList, Result, Gid, GName,
		GuildBoosRankInfo});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_dun68, _,
	     {__Levelguild_dun68, __Tracesguild_dun68}}
		when __Levelguild_dun68 band 8 /= 0 orelse
		       __Tracesguild_dun68 /= [] ->
		lager:do_log(error,
			     [{module, guild_dun}, {function, add_dps},
			      {line, 68}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法获取公会副本进程:~w   ~w", [Gid, GName]),
			     none, 4096, 8, __Levelguild_dun68,
			     __Tracesguild_dun68, lager_event,
			     __Pidguild_dun68);
	    _ -> ok
	  end,
	  {error, not_pid}
    end.

add_buff(#role{guild_bag = #guild_bag{id = Gid}}) ->
    case ets:lookup(guild_dun_pids, Gid) of
      [{_, Pid}] when is_pid(Pid) -> call(Pid, add_buff);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_dun78, _,
	     {__Levelguild_dun78, __Tracesguild_dun78}}
		when __Levelguild_dun78 band 8 /= 0 orelse
		       __Tracesguild_dun78 /= [] ->
		lager:do_log(error,
			     [{module, guild_dun}, {function, add_buff},
			      {line, 78}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法获取公会副本进程:~w ", [Gid]), none, 4096,
			     8, __Levelguild_dun78, __Tracesguild_dun78,
			     lager_event, __Pidguild_dun78);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Phó bản hội chưa được khởi động."/utf8>>)}
    end.

ref_mon_hp(MonDpsList, UnitHp, BossId) ->
    case lists:keyfind(BossId, 1, UnitHp) of
      false -> UnitHp;
      {BossId, UnitHpList} ->
	  NewUnitHpList = ref_mon_hp(MonDpsList, UnitHpList),
	  lists:keyreplace(BossId, 1, UnitHp,
			   {BossId, NewUnitHpList})
    end.

ref_mon_hp([], UnitHp) -> UnitHp;
ref_mon_hp([{MonId, Dps} | MonDpsList], UnitHp) ->
    case lists:keyfind(MonId, 1, UnitHp) of
      false -> ref_mon_hp(MonDpsList, UnitHp);
      {MonId, OldHp} ->
	  NewHp = max(0, OldHp - Dps),
	  ref_mon_hp(MonDpsList,
		     lists:keyreplace(MonId, 1, UnitHp, {MonId, NewHp}))
    end.

do_combat_over(FId, MaxID, BossList, BoxAward, Dps,
	       BossId, UnitHp, Result) ->
    case lists:keyfind(BossId, 1, BossList) of
      {_, Hp} when Hp > 0 ->
	  if Dps >= Hp orelse Result =:= 1 ->
		 NewBossList = lists:keyreplace(BossId, 1, BossList,
						{BossId, 0}),
		 {NewFId, NewMaxID, NewUnitHp, AddBossList} = case
								lists:filter(fun
									       ({_,
										 HpTemp}) ->
										   HpTemp
										     >
										     0
									     end,
									     NewBossList)
								  of
								[] ->
								    UnitHpT =
									case
									  init_unit_hp(FId
											 +
											 1)
									    of
									  [] ->
									      UnitHp;
									  UnitHpT1 ->
									      UnitHpT1
									end,
								    AddBossList1 =
									case
									  guild_dun_data:get_boss_ids(FId
													+
													1)
									    of
									  [] ->
									      NewBossList;
									  AddBossListT ->
									      AddBossListT
									end,
								    {min(FId +
									   1,
									 length(lists:usort(guild_dun_data:get_all_fid()))),
								     MaxID + 1,
								     UnitHpT,
								     AddBossList1};
								_ ->
								    {FId, MaxID,
								     UnitHp,
								     NewBossList}
							      end,
		 {true, NewFId, NewMaxID, AddBossList, BoxAward,
		  NewBossList, NewUnitHp};
	     true ->
		 NewBossList = lists:keyreplace(BossId, 1, BossList,
						{BossId, Hp - Dps}),
		 {false, FId, MaxID, NewBossList, BoxAward, NewBossList,
		  UnitHp}
	  end;
      _ ->
	  {false, FId, MaxID, BossList, BoxAward, BossList,
	   UnitHp}
    end.

init_unit_hp(FId) ->
    BossList = guild_dun_data:get_boss_ids(FId),
    init_unit_hp(BossList, []).

init_unit_hp([], L) -> L;
init_unit_hp([{BossId, _} | BossList], L) ->
    UnitHp = case guild_dun_data:get_unit_id(BossId) of
	       undefine -> [];
	       UnitId ->
		   case unit_monster:gen_fight_objects(20, UnitId) of
		     [] -> [];
		     [DefendList | _] ->
			 [{MonBid, HpMax}
			  || #fight_object{object_bid = MonBid, hp_max = HpMax}
				 <- DefendList]
		   end
	     end,
    init_unit_hp(BossList, [{BossId, UnitHp} | L]).

close(GId) ->
    case ets:lookup(guild_dun_pids, GId) of
      [{_, Pid}] when is_pid(Pid) ->
	  catch ets:delete(guild_dun, GId),
	  case ets:lookup(guild_dun_rank_guild, GId) of
	    [_ | _] ->
		ets:delete(guild_dun_rank_guild, GId),
		dets:delete(guild_dun_rank_guild, GId);
	    _ -> ok
	  end,
	  Pid ! {stop, normal};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_dun183, _,
	     {__Levelguild_dun183, __Tracesguild_dun183}}
		when __Levelguild_dun183 band 8 /= 0 orelse
		       __Tracesguild_dun183 /= [] ->
		lager:do_log(error,
			     [{module, guild_dun}, {function, close},
			      {line, 183}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法获取公会副本进程:~w", [GId]), none, 4096,
			     8, __Levelguild_dun183, __Tracesguild_dun183,
			     lager_event, __Pidguild_dun183);
	    _ -> ok
	  end,
	  {error, not_pid}
    end.

set_type(GId, Type) ->
    case ets:lookup(guild_dun_pids, GId) of
      [{_, Pid}] when is_pid(Pid) ->
	  info(Pid, {set_type, Type});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_dun203, _,
	     {__Levelguild_dun203, __Tracesguild_dun203}}
		when __Levelguild_dun203 band 8 /= 0 orelse
		       __Tracesguild_dun203 /= [] ->
		lager:do_log(error,
			     [{module, guild_dun}, {function, set_type},
			      {line, 203}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法获取公会副本进程:~w", [GId]), none, 4096,
			     8, __Levelguild_dun203, __Tracesguild_dun203,
			     lager_event, __Pidguild_dun203);
	    _ -> ok
	  end,
	  {error, not_pid}
    end.

assemble(GId, Post) ->
    case ets:lookup(guild_dun_pids, GId) of
      [{_, Pid}] when is_pid(Pid) ->
	  call(Pid, {assemble, Post});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_dun213, _,
	     {__Levelguild_dun213, __Tracesguild_dun213}}
		when __Levelguild_dun213 band 8 /= 0 orelse
		       __Tracesguild_dun213 /= [] ->
		lager:do_log(error,
			     [{module, guild_dun}, {function, assemble},
			      {line, 213}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法获取公会副本进程:~w", [GId]), none, 4096,
			     8, __Levelguild_dun213, __Tracesguild_dun213,
			     lager_event, __Pidguild_dun213);
	    _ -> ok
	  end,
	  {error, not_pid}
    end.

info(Pid, Info) when is_pid(Pid) -> Pid ! Info;
info(_Pid, _Info) -> not_pid.

cast(Pid, Info) when is_pid(Pid) ->
    gen_server:cast(Pid, Info);
cast(_Pid, _Info) -> not_pid.

call(Pid, Info) when is_pid(Pid) ->
    case catch gen_server:call(Pid, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_dun226, _,
	     {__Levelguild_dun226, __Tracesguild_dun226}}
		when __Levelguild_dun226 band 8 /= 0 orelse
		       __Tracesguild_dun226 /= [] ->
		lager:do_log(error,
			     [{module, guild_dun}, {function, call},
			      {line, 226}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [Pid, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild_dun226,
			     __Tracesguild_dun226, lager_event,
			     __Pidguild_dun226);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end;
call(_Pid, _Info) -> not_pid.

start_link(G = #guild_dun{id = {Gid, GSrvId}}) ->
    LocalName = list_to_atom(lists:concat(["guild_dun_",
					   Gid, "_",
					   bitstring_to_list(GSrvId)])),
    gen_server:start_link({local, LocalName}, guild_dun,
			  [G], []).

init([G = #guild_dun{id = Gid}]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun234, _,
       {__Levelguild_dun234, __Tracesguild_dun234}}
	  when __Levelguild_dun234 band 64 /= 0 orelse
		 __Tracesguild_dun234 /= [] ->
	  lager:do_log(info,
		       [{module, guild_dun}, {function, init}, {line, 234},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 公会副本进程正在启动:...", [guild_dun]), none,
		       4096, 64, __Levelguild_dun234, __Tracesguild_dun234,
		       lager_event, __Pidguild_dun234);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    NewG0 = init_timer(G),
    NewG = open_next_dun(NewG0),
    ets:insert(guild_dun_pids, {Gid, self()}),
    guild_dun_mgr:update_ets(guild_dun, NewG, all),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun240, _,
       {__Levelguild_dun240, __Tracesguild_dun240}}
	  when __Levelguild_dun240 band 64 /= 0 orelse
		 __Tracesguild_dun240 /= [] ->
	  lager:do_log(info,
		       [{module, guild_dun}, {function, init}, {line, 240},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 公会副本进程启动成功:...", [guild_dun]), none,
		       4096, 64, __Levelguild_dun240, __Tracesguild_dun240,
		       lager_event, __Pidguild_dun240);
      _ -> ok
    end,
    {ok, NewG}.

handle_info({gm_set_f_id, FId}, State) ->
    NewState = State#guild_dun{f_id = FId, max_id = FId,
			       boss_list = guild_dun_data:get_boss_ids(FId),
			       unit_hp = init_unit_hp(FId)},
    guild_dun_mgr:update_ets(guild_dun, NewState, all),
    {noreply, NewState};
handle_info(gm_ref_buff, State) ->
    NewState = State#guild_dun{buff_lev = 0,
			       buff_end_time = 0},
    guild_dun_mgr:update_ets(guild_dun, NewState, all),
    {noreply, NewState};
handle_info(ref_buff, State) ->
    NewState = init_timer(State),
    guild_dun_mgr:update_ets(guild_dun, NewState, all),
    {noreply, NewState};
handle_info({push, BossId, Fid},
	    State = #guild_dun{id = GuildId}) ->
    case guild_lib:elem(GuildId,
			[#guild.members, #guild.name])
	of
      {ok, [Members = [_ | _], GName]} ->
	  List = guild_dun_rank:get_boss_rank(GuildId, BossId),
	  Members2 = [MId || #guild_member{id = MId} <- Members],
	  List2 = lists:keysort(#guild_dun_rank_role.all_dps,
				[Data
				 || Data = #guild_dun_rank_role{r_id = RankRid}
					<- List,
				    lists:member(RankRid, Members2)]),
	  Fun = fun (GuildDunRank, {Rank, Acc}) ->
			NAcc = [GuildDunRank#guild_dun_rank_role{rank = Rank}
				| Acc],
			{Rank + 1, NAcc}
		end,
	  {_, List3} = lists:foldl(Fun, {1, []},
				   lists:reverse(List2)),
	  Fun1 = fun (#guild_member{id = MemId}) ->
			 case lists:keyfind(MemId, #guild_dun_rank_role.r_id,
					    List3)
			     of
			   #guild_dun_rank_role{rank = Rank} when Rank > 0 ->
			       SendList = var:get_role_var(MemId, other, 6, []),
			       DayMailNum = var:get_role_var(MemId, day, 1, 0),
			       room_feat_mgr:info({guild_dun_boss_do_feat,
						   MemId, GName, Rank, Fid}),
			       case lists:member(BossId, SendList) of
				 false ->
				     Awaerds =
					 guild_dun_data:get_award_by_rank({BossId,
									   Rank}),
				     Content =
					 color:msg(lang:get(<<"Kính thưa các nhà phiêu lưu! Các thành "
							      "viên trong hội đã đồng lòng chiến thắng "
							      "Boss ở chương ~ts của phó bản, xếp hạng "
							      "sát thương của bạn là ~ts, bạn đã nhận "
							      "được các phần thưởng như...Các phần "
							      "thưởng dưới đây! Hãy cùng chúc mừng "
							      "cho công hội vĩ đại của chúng ta！"/utf8>>),
						   [{string, {red, Fid}},
						    {string, {red, Rank}}]),
				     {Assets, Items} =
					 format:split_assets_items(Awaerds),
				     Mail =
					 {lang:get(<<"Phần thưởng xếp hạng sát thương Boss "
						     "phó bản hội."/utf8>>),
					  Content, Assets, Items,
					  "公会副本boss伤害排行奖励"},
				     var:set_role_var(MemId, other, 6,
						      [BossId | SendList]),
				     mail:send(MemId, Mail);
				 _ when DayMailNum >= 5 -> ok;
				 _ ->
				     Awaerds =
					 guild_dun_data:get_rep_award(BossId),
				     Content =
					 color:msg(lang:get(<<"Nhà thám hiểm thân mến! Xin chúc mừng "
							      "guild của bạn đã đánh bại được trường "
							      "hợp này~tsBoss chương, sát thương của "
							      "bạn xếp hạng đầu tiên~ts，Đã thu được "
							      "nhưPhần thưởng cho lần tiếp theo! Xin "
							      "chúc mừng hội nhóm tuyệt vời của chúng "
							      "ta! (Đây không phải là lần đầu tiên "
							      "bạn giết người trong sự nghiệp phiêu "
							      "lưu của mình và phần thưởng là phần "
							      "thưởng chắc chắn cho lần giết đó)"/utf8>>),
						   [{string, {red, Fid}},
						    {string, {red, Rank}}]),
				     {Assets, Items} =
					 format:split_assets_items(Awaerds),
				     Mail =
					 {lang:get(<<"Phần thưởng xếp hạng sát thương trùm "
						     "ngục tối bang hội"/utf8>>),
					  Content, Assets, Items,
					  "公会副本boss伤害排行奖励"},
				     var:set_role_var(MemId, day, 1,
						      DayMailNum + 1),
				     mail:send(MemId, Mail)
			       end;
			   _ -> ok
			 end
		 end,
	  lists:map(Fun1, Members),
	  Fun2 = fun (#guild_member{pid = RolePid}) ->
			 role:apply(async, RolePid, {guild_dun_lib, push, []})
		 end,
	  lists:map(Fun2, Members),
	  {noreply, State};
      _ -> {noreply, State}
    end;
handle_info({stop, Reason}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun347, _,
       {__Levelguild_dun347, __Tracesguild_dun347}}
	  when __Levelguild_dun347 band 64 /= 0 orelse
		 __Tracesguild_dun347 /= [] ->
	  lager:do_log(info,
		       [{module, guild_dun}, {function, handle_info},
			{line, 347}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会副本接收到关闭信息:~w", [Reason]), none, 4096,
		       64, __Levelguild_dun347, __Tracesguild_dun347,
		       lager_event, __Pidguild_dun347);
      _ -> ok
    end,
    {stop, Reason, State};
handle_info(_Info, State) -> {noreply, State}.

handle_call(add_buff, _From,
	    State = #guild_dun{id = Gid, buff_lev = BuffLev,
			       buff_end_time = EndTime}) ->
    MaxBuffLev =
	lists:max(guild_dun_data:get_max_buff_lev()),
    case BuffLev + 1 > MaxBuffLev of
      true ->
	  {reply,
	   {false, lang:get(<<"Buff đã đạt cấp tối đa."/utf8>>)},
	   State};
      _ ->
	  Time1 = guild_dun_data:get_buff_add_time(BuffLev),
	  Time2 = guild_dun_data:get_buff_add_time(BuffLev + 1),
	  NewEndTime = Time2 - Time1 +
			 util:if_true(EndTime == 0, date:unixtime(), EndTime),
	  NewState = State#guild_dun{buff_lev = BuffLev + 1,
				     buff_end_time = NewEndTime},
	  init_timer(NewState),
	  guild_dun_mgr:update_ets(guild_dun, NewState, all),
	  Msg = case BuffLev == 0 of
		  true ->
		      lang:get(<<"Đã kích hoạt Buff thành công！"/utf8>>);
		  _ -> lang:get(<<"Đã nâng cấp Buff thành công！"/utf8>>)
		end,
	  case guild_lib:elem(Gid, #guild.members) of
	    {ok, Members = [_ | _]} ->
		Fun = fun (#guild_member{pid = RolePid}) ->
			      role:apply(async, RolePid,
					 {guild_dun_lib, ref_buff, []})
		      end,
		lists:map(Fun, Members),
		{reply, {ok, Msg}, NewState};
	    _ -> {reply, {ok, Msg}, NewState}
	  end
    end;
handle_call({add_dps, Dps, BossId, MonDpsList, Result,
	     Gid, GName},
	    _From,
	    State = #guild_dun{f_id = FId, max_id = MaxID,
			       boss_list = BossList, box_award = BoxAward,
			       unit_hp = UnitHp, day_dps = DayDps}) ->
    {IsKill, NewFId, NewMaxId, NewBossList, NewBoxAward, _,
     NewUnitHp} =
	do_combat_over(FId, MaxID, BossList, BoxAward, Dps,
		       BossId, UnitHp, Result),
    NewMonDpsList = ref_mon_hp(MonDpsList, NewUnitHp,
			       BossId),
    NewState = State#guild_dun{f_id = NewFId,
			       max_id = NewMaxId, boss_list = NewBossList,
			       unit_hp = NewMonDpsList, box_award = NewBoxAward,
			       day_dps = DayDps + Dps},
    guild_dun_mgr:update_ets(guild_dun, NewState, all),
    guild_dun_rank:info({ref_day_dps, Gid, DayDps + Dps}),
    case IsKill == true of
      true ->
	  guild_dun_rank:info({update, Gid, GName, NewMaxId,
			       IsKill}),
	  info(self(), {push, BossId, FId});
      _ -> ok
    end,
    {reply, IsKill, NewState};
handle_call({add_dps, Dps, BossId, MonDpsList, Result,
	     Gid, GName, GuildBoosRankInfo},
	    _From,
	    State = #guild_dun{f_id = FId, max_id = MaxID,
			       boss_list = BossList, box_award = BoxAward,
			       unit_hp = UnitHp, day_dps = DayDps}) ->
    {IsKill, NewFId, NewMaxId, NewBossList, NewBoxAward, _,
     NewUnitHp} =
	do_combat_over(FId, MaxID, BossList, BoxAward, Dps,
		       BossId, UnitHp, Result),
    NewMonDpsList = ref_mon_hp(MonDpsList, NewUnitHp,
			       BossId),
    NewState = State#guild_dun{f_id = NewFId,
			       max_id = NewMaxId, boss_list = NewBossList,
			       unit_hp = NewMonDpsList, box_award = NewBoxAward,
			       day_dps = DayDps + Dps},
    guild_dun_mgr:update_ets(guild_dun, NewState, all),
    guild_dun_rank:info({ref_day_dps, Gid, DayDps + Dps}),
    guild_dun_rank:gui_rank_boss(GuildBoosRankInfo, Gid),
    case IsKill == true of
      true ->
	  guild_dun_rank:info({update, Gid, GName, NewMaxId,
			       IsKill}),
	  info(self(), {push, BossId, FId});
      _ -> ok
    end,
    {reply, IsKill, NewState};
handle_call({assemble, Post}, _From,
	    State = #guild_dun{assemble_time = AssembleTime}) ->
    case Post =:= 3 of
      true ->
	  {reply,
	   {false,
	    lang:get(<<"Chỉ có Chủ và Phó guild mới có thể phát "
		       "động tập hợp."/utf8>>),
	    AssembleTime},
	   State};
      _ ->
	  Now = date:unixtime(),
	  case AssembleTime < Now of
	    false ->
		{reply,
		 {false,
		  lang:get(<<"Không thể phát động tập hợp trong thời "
			     "gian hồi chiêu, vui lòng chờ đợi thời "
			     "gian kết thúc."/utf8>>),
		  AssembleTime},
		 State};
	    _ ->
		NewAssembleTime = Now +
				    guild_dun_data:const(concentrate_cd),
		NewState = State#guild_dun{assemble_time =
					       NewAssembleTime},
		guild_dun_mgr:update_ets(guild_dun, NewState, all),
		{reply, {ok, NewAssembleTime}, NewState}
	  end
    end;
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    catch ets:delete(guild_dun_pids, _State#guild_dun.id),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun442, _,
       {__Levelguild_dun442, __Tracesguild_dun442}}
	  when __Levelguild_dun442 band 64 /= 0 orelse
		 __Tracesguild_dun442 /= [] ->
	  lager:do_log(info,
		       [{module, guild_dun}, {function, terminate},
			{line, 442}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会副本关闭:~w", [_Reason]), none, 4096, 64,
		       __Levelguild_dun442, __Tracesguild_dun442, lager_event,
		       __Pidguild_dun442);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

init_timer(GuildDun = #guild_dun{buff_end_time =
				     EndTime}) ->
    Date = date:unixtime(),
    case Date >= EndTime of
      true ->
	  GuildDun#guild_dun{buff_lev = 0, buff_end_time = 0};
      _ ->
	  case get(guild_dun_buff_timer) of
	    undefined -> ok;
	    Timer -> erlang:cancel_timer(Timer)
	  end,
	  put(guild_dun_buff_timer,
	      erlang:send_after((EndTime - Date) * 1000, self(),
				ref_buff)),
	  GuildDun
    end.

open_next_dun(GuildDun = #guild_dun{id = Gid,
				    f_id = FId, boss_list = BossList}) ->
    case lists:filter(fun ({_, HpTemp}) -> HpTemp > 0 end,
		      BossList)
	of
      [] ->
	  case init_unit_hp(FId + 1) of
	    [] -> GuildDun;
	    NewUnitHp ->
		case guild_dun_data:get_boss_ids(FId + 1) of
		  [] -> GuildDun;
		  NewBossList ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidguild_dun473, _,
			 {__Levelguild_dun473, __Tracesguild_dun473}}
			    when __Levelguild_dun473 band 64 /= 0 orelse
				   __Tracesguild_dun473 /= [] ->
			    lager:do_log(info,
					 [{module, guild_dun},
					  {function, open_next_dun},
					  {line, 473},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w已到达最大公会副本关卡~w,开启新一关",
						       [Gid, FId]),
					 none, 4096, 64, __Levelguild_dun473,
					 __Tracesguild_dun473, lager_event,
					 __Pidguild_dun473);
			_ -> ok
		      end,
		      GuildDun#guild_dun{f_id = FId + 1,
					 boss_list = NewBossList,
					 unit_hp = NewUnitHp}
		end
	  end;
      _ -> GuildDun
    end.


