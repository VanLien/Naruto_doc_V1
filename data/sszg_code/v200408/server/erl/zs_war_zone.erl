-file("data/zs_war_zone.erl", 1).

-file("src/mod/data/zs_war_zone.erl", 1).

-module(zs_war_zone).

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
		{unit_make_args, [pos, evts, disabled]},
		{map_unit,
		 [id, type, activity, status, guide_lev, name, layer,
		  base_id, lev, career, sex, hp, hp_max, speed, x, y, gx,
		  gy, looks]},
		{unit,
		 [id, type, minor_type, pid, activity, combat_pid, name,
		  status, guide_lev, nature, quality, layer, disabled,
		  base_id, lev, career, sex, hp, hp_max, speed, lock,
		  def_status, pos, looks, evt, ts, timeout, t_move, t_atk,
		  extra]},
		{unit_data,
		 [bid, type, minor_type, name, activity, cli_create,
		  guide_lev, status, nature, disabled, condition, lev,
		  career, sex, hp, mp, hp_max, mp_max, speed, lock,
		  t_move, t_atk, range_trace, range_atk, gain, slave,
		  waves, talk, looks, order, data, layer, def_status,
		  status_list, drop_id, act_drops, tran_pos,
		  reward_panel_type, reward, formation, camp_type]},
		{unit_order, [order, type, arg, data, condition, over]},
		{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
		{zs_war_guard_data,
		 [id, camp, bid, pos_x, pos_y, max_hp, diff_hp,
		  role_attr, camp_attr, time, cd]},
		{zs_war_skill_data,
		 [id, camp, name, cd, free, loss, effect]},
		{zs_war_guard,
		 [id, camp, bid, pos_x, pos_y, status, hp, max_hp]},
		{zs_war_zone, [group, zone, num, pid]},
		{zs_war_role,
		 [id, pid, name, zone_pid, zone_id, gid, gname, group,
		  camp, lev, sex, face, avatar_id, lookid, power,
		  max_power, arena_rank, pos_x, pos_y, score, num, win,
		  win_acc, win_best, lose, lose_acc, draw, status, effect,
		  move_num, move_cd_time, combat_cd_time, combat_role_id,
		  start_time, formation_type, pos_info, partner_hp, in_ui,
		  skill_list, skill_effect, is_robot, robot_id, items,
		  cnum_list, win_list]},
		{map_role,
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
		{state, [ts, timeout]}]).

-behaviour(gen_fsm).

-export([info/2, cast/2, call/2, start/1, camp_name/1]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([match/2, stat/2]).

-record(state, {ts = 0, timeout = 0}).

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

-file("src/mod/data/zs_war_zone.erl", 24).

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

-file("src/mod/data/zs_war_zone.erl", 25).

-file("inc/zs_war.hrl", 1).

-record(zs_war_role,
	{id = {0, <<>>}  :: {non_neg_integer(), bitstring()},
	 pid = 0  :: 0 | pid(), name = <<>>  :: bitstring(),
	 zone_pid = 0  :: 0 | pid(),
	 zone_id = 0  :: non_neg_integer(),
	 gid = {0, <<>>}  :: {non_neg_integer(), bitstring()},
	 gname = <<>>  :: bitstring(),
	 group = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), sex = 0  :: 0..2,
	 face = 0  :: non_neg_integer(),
	 avatar_id = 0  :: non_neg_integer(),
	 lookid = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 max_power = 0  :: non_neg_integer(),
	 arena_rank = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 score = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 win = 0  :: non_neg_integer(),
	 win_acc = 0  :: non_neg_integer(),
	 win_best = 0  :: non_neg_integer(),
	 lose = 0  :: non_neg_integer(),
	 lose_acc = 0  :: non_neg_integer(),
	 draw = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 effect = 0  :: non_neg_integer(),
	 move_num = 0  :: non_neg_integer(),
	 move_cd_time = 0  :: non_neg_integer(),
	 combat_cd_time = 0  :: non_neg_integer(),
	 combat_role_id = {0, <<>>}  :: tuple(),
	 start_time = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 pos_info = []  :: list(), partner_hp = []  :: list(),
	 in_ui = 0  :: 0..1, skill_list = []  :: list(),
	 skill_effect = []  :: list(), is_robot = 0  :: 0..1,
	 robot_id = 0  :: non_neg_integer(),
	 items = []  :: list(), cnum_list = []  :: list(),
	 win_list = []  :: list()}).

-record(zs_war_zone,
	{group = 0  :: non_neg_integer(),
	 zone = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(), pid = 0  :: pid()}).

-record(zs_war_guard,
	{id = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 max_hp = 0  :: non_neg_integer()}).

-record(zs_war_skill_data,
	{id = 0  :: non_neg_integer(), camp = 1  :: 1..2,
	 name = <<>>  :: bitstring(),
	 cd = 0  :: non_neg_integer(),
	 free = 0  :: non_neg_integer(), loss = []  :: list(),
	 effect = []  :: list()}).

-record(zs_war_guard_data,
	{id = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 max_hp = 0  :: non_neg_integer(),
	 diff_hp = 0  :: non_neg_integer(),
	 role_attr = []  :: list(), camp_attr = []  :: list(),
	 time = 0  :: non_neg_integer(),
	 cd = 0  :: non_neg_integer()}).

-file("src/mod/data/zs_war_zone.erl", 26).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/data/zs_war_zone.erl", 27).

-file("inc/unit.hrl", 1).

-record(unit_order,
	{order  :: move | guard | attack | atom(),
	 type = 0  :: 0..2,
	 arg  :: undefined | tuple() | [tuple()],
	 data  :: undefined | term(), condition = []  :: list(),
	 over  :: undefined | defense | stop | atom()}).

-record(unit_data,
	{bid = auto  :: auto | pos_integer(),
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 name = ""  :: bitstring(), activity = 0  :: 0..1,
	 cli_create = 0  :: 0..1,
	 guide_lev = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 condition = []  :: [tuple()],
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 2  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 mp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 mp_max = 0  :: non_neg_integer(),
	 speed = 180  :: pos_integer(), lock = 0  :: 0 | 1,
	 t_move = 3  :: pos_integer(),
	 t_atk = 3  :: pos_integer(),
	 range_trace = 200  :: pos_integer(),
	 range_atk = 100  :: pos_integer(), gain = []  :: list(),
	 slave = []  :: list(), waves = []  :: list(),
	 talk = []  :: list(), looks = []  :: list(),
	 order = []  :: list(), data = []  :: list(),
	 layer = 0  :: non_neg_integer(),
	 def_status = defense  :: defense | patrol | loaf,
	 status_list = []  :: list(),
	 drop_id = 0  :: non_neg_integer(),
	 act_drops = []  :: list(), tran_pos = [],
	 reward_panel_type = 1, reward = [], formation = {1, 1},
	 camp_type = 0}).

-record(unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 pid = 0  :: non_neg_integer() | pid(),
	 activity = 0  :: 0..1,
	 combat_pid = 0  :: non_neg_integer() | pid(),
	 name = ""  :: bitstring(),
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 layer = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(), lock = 0  :: 0 | 1,
	 def_status = defense  :: defense,
	 pos  :: undefined | tuple(), looks = []  :: [tuple()],
	 evt = []  :: [atom()],
	 ts = {1, 1, 1}  ::
	     {pos_integer(), pos_integer(), pos_integer()},
	 timeout = 864000  :: non_neg_integer(),
	 t_move = 1  :: pos_integer(),
	 t_atk = 1  :: pos_integer(), extra = []  :: [tuple()]}).

-record(map_unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: pos_integer(), activity = 0  :: 0..1,
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 name = ""  :: bitstring(),
	 layer = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 looks = []  :: [tuple()]}).

-record(unit_make_args,
	{pos = {0, 0, 0}, evts = [], disabled = 0  :: 0 | 1}).

-file("src/mod/data/zs_war_zone.erl", 28).

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

-file("src/mod/data/zs_war_zone.erl", 29).

-file("inc/log.hrl", 1).

-file("src/mod/data/zs_war_zone.erl", 30).

-file("inc/game_assets.hrl", 1).

-file("src/mod/data/zs_war_zone.erl", 31).

info(RoleId = {_, _}, Info) ->
    case ets:lookup(zs_war_role, RoleId) of
      [{_, ZonePid}] when is_pid(ZonePid) ->
	  info(ZonePid, Info);
      _ ->
	  case zs_war_mgr:get_server() of
	    {_, MainNode} when MainNode =/= node() ->
		case cluster_lib:call({node, MainNode}, ets, lookup,
				      [zs_war_role, RoleId])
		    of
		  [{_, ZonePid}] when is_pid(ZonePid) ->
		      info(ZonePid, Info);
		  _ -> not_pid
		end;
	    _ -> not_pid_local
	  end
    end;
info(Pid, Info) -> Pid ! Info.

cast(Pid, Event) ->
    gen_fsm:send_all_state_event(Pid, Event).

call(Pid, Event) ->
    case catch gen_fsm:sync_send_all_state_event(Pid, Event,
						 10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war_zone55, _,
	     {__Levelzs_war_zone55, __Traceszs_war_zone55}}
		when __Levelzs_war_zone55 band 8 /= 0 orelse
		       __Traceszs_war_zone55 /= [] ->
		lager:do_log(error,
			     [{module, zs_war_zone}, {function, call},
			      {line, 55}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [Pid, Event, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelzs_war_zone55,
			     __Traceszs_war_zone55, lager_event,
			     __Pidzs_war_zone55);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

start(Info = #{group := Group, zone := Zone}) ->
    LocalName = list_to_atom(lists:concat(["zs_war_", Group,
					   "_", Zone])),
    gen_fsm:start({local, LocalName}, zs_war_zone, [Info],
		  []).

init([#{group := Group, zone := Zone, a_list := AList,
	b_list := BList, type := Type}]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone62, _,
       {__Levelzs_war_zone62, __Traceszs_war_zone62}}
	  when __Levelzs_war_zone62 band 64 /= 0 orelse
		 __Traceszs_war_zone62 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_zone}, {function, init}, {line, 62},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始启动:group:~w zone:~w a_num:~w b_num:~w",
				     [Group, Zone, length(AList),
				      length(BList)]),
		       none, 4096, 64, __Levelzs_war_zone62,
		       __Traceszs_war_zone62, lager_event, __Pidzs_war_zone62);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    put(is_kf, Type =:= 2),
    put(idx, 1),
    put(group, Group),
    put(zone, Zone),
    put({pos_y_list, 1}, [1, 2, 3]),
    put({pos_y_list, 2}, [1, 2, 3]),
    put({pos_x_list, 1}, [2, 3, 4, 5]),
    put({pos_x_list, 2}, [14, 13, 12, 11]),
    put({power, 1}, 0),
    put({power, 2}, 0),
    NewAList = [init_pos(R#zs_war_role{camp = 1})
		|| R <- AList],
    NewBList = [init_pos(R#zs_war_role{camp = 2})
		|| R <- BList],
    put(role_list, NewAList ++ NewBList),
    put({role_num, 1}, length(NewAList)),
    put({role_num, 2}, length(NewBList)),
    put({score, 1}, 0),
    put({score, 2}, 0),
    put(guard_list, init_guard()),
    IdelTimeout = zs_war_data:get_const(match_time) * 1000,
    State = #state{ts = date:now(), timeout = IdelTimeout},
    self() ! init,
    erlang:send_after(10 * 1000, self(), move),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone86, _,
       {__Levelzs_war_zone86, __Traceszs_war_zone86}}
	  when __Levelzs_war_zone86 band 64 /= 0 orelse
		 __Traceszs_war_zone86 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_zone}, {function, init}, {line, 86},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("启动完成:zs_war_~w_~w", [Group, Zone]), none,
		       4096, 64, __Levelzs_war_zone86, __Traceszs_war_zone86,
		       lager_event, __Pidzs_war_zone86);
      _ -> ok
    end,
    {ok, match, State, IdelTimeout}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok, continue(StateName, Reply, State).

handle_info(init, StateName, State) ->
    [role:apply(async, RolePid,
		{zs_war, sync_ui_status, []})
     || #zs_war_role{pid = RolePid} <- get(role_list),
	is_pid(RolePid)],
    init_robot(),
    send(all, all, 21403, {3}),
    continue(StateName, State);
handle_info({push_info, RoleId, RolePid}, StateName,
	    State) ->
    role:pack_send(proxy, RolePid, 21410,
		   {0, get(role_list)}),
    role:pack_send(proxy, RolePid, 21412, pack_21412()),
    role:pack_send(proxy, RolePid, 21413,
		   {0, get(guard_list)}),
    case get_role(RoleId) of
      R = #zs_war_role{skill_list = SkillList,
		       start_time = StartTime, num = CNum, win_acc = Win} ->
	  Time = StartTime - date:unixtime(),
	  case Time > 0 of
	    true -> send(R, 1, 21409, {Time});
	    _ -> skip
	  end,
	  send(R, all, 21425, {get(group), CNum, Win}),
	  send(R, all, 21420, {SkillList});
      _ -> skip
    end,
    continue(StateName, State);
handle_info({sync_ui_status, RoleId, RolePid, UI},
	    StateName = match, State) ->
    case get_role(RoleId) of
      R = #zs_war_role{} ->
	  update_role(R#zs_war_role{pid = RolePid, in_ui = UI});
      _ -> pass
    end,
    continue(StateName, State);
handle_info({sync_formation, RoleId, FormationType,
	     PosInfo},
	    StateName = match, State) ->
    case get_role(RoleId) of
      R = #zs_war_role{status = Status, partner_hp = []}
	  when Status =/= 1 ->
	  update_role(R#zs_war_role{formation_type =
					FormationType,
				    pos_info = PosInfo});
      R = #zs_war_role{} ->
	  update_role(R#zs_war_role{formation_type =
					FormationType});
      _ -> pass
    end,
    continue(StateName, State);
handle_info({enter,
	     ZsRole = #zs_war_role{id = RoleId, pid = RolePid,
				   pos_info = PosInfo}},
	    StateName = match, State) ->
    case get_role(RoleId) of
      false ->
	  ANum = get({role_num, 1}),
	  BNum = get({role_num, 2}),
	  APower = get({power, 1}),
	  BPower = get({power, 2}),
	  Camp = if ANum < BNum -> 1;
		    ANum > BNum -> 2;
		    APower < BPower -> 1;
		    APower > BPower -> 2;
		    true -> util:rand_list([1, 2])
		 end,
	  put({role_num, Camp}, get({role_num, Camp}) + 1),
	  NewZsRole = init_pos(ZsRole#zs_war_role{camp = Camp,
						  in_ui = 1}),
	  send(NewZsRole, all, 21403, {3}),
	  send(all, 1, 21410, {1, [NewZsRole]}),
	  #{min_lev := MinLev, max_lev := MaxLev,
	    name := GroupName} =
	      zs_war_data:group_data(get(group)),
	  role:pack_send(proxy, RolePid, 21401,
			 {1,
			  util:fbin(lang:get(<<"成功报名~w-~w等级段~ts战场"/utf8>>),
				    [MinLev, MaxLev, GroupName])}),
	  put(role_list, [NewZsRole | get(role_list)]);
      OldZsRole = #zs_war_role{partner_hp = []} ->
	  role:pack_send(proxy, RolePid, 21401,
			 {1, lang:get(<<"报名成功"/utf8>>)}),
	  update_role(OldZsRole#zs_war_role{pid = RolePid,
					    pos_info = PosInfo, in_ui = 1});
      OldZsRole ->
	  role:pack_send(proxy, RolePid, 21401,
			 {1, lang:get(<<"报名成功"/utf8>>)}),
	  update_role(OldZsRole#zs_war_role{pid = RolePid,
					    in_ui = 1})
    end,
    continue(StateName, State);
handle_info(move, StateName = match, State) ->
    Now = date:unixtime(),
    move_match(Now),
    guard_diff_hp_effect(Now),
    erlang:send_after(1000, self(), move),
    continue(StateName, State);
handle_info({combat_cancel, RoleId}, StateName = match,
	    State) ->
    case get_role(RoleId) of
      ZsRole = #zs_war_role{status = 1} ->
	  update_and_push_role(ZsRole#zs_war_role{status = 0,
						  combat_cd_time =
						      date:unixtime() + 5});
      _ -> skip
    end,
    continue(StateName, State);
handle_info({clear_combat, RoleId, TarRoleId},
	    StateName = match, State) ->
    case get_role(RoleId) of
      R = #zs_war_role{combat_role_id = TarRoleId} ->
	  update_role(R#zs_war_role{combat_role_id = {0, <<>>}});
      _ -> skip
    end,
    continue(StateName, State);
handle_info({combat_over, RoleId, TarRoleId,
	     CombatResult},
	    StateName = match, State) ->
    try combat_over(get_role(RoleId), get_role(TarRoleId),
		    CombatResult, date:unixtime()),
	send(all, 1, 21412, pack_21412())
    catch
      _C:_E ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war_zone213, _,
	     {__Levelzs_war_zone213, __Traceszs_war_zone213}}
		when __Levelzs_war_zone213 band 8 /= 0 orelse
		       __Traceszs_war_zone213 /= [] ->
		lager:do_log(error,
			     [{module, zs_war_zone}, {function, handle_info},
			      {line, 213}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色~w pk ~w  err: ~w ~w ~w",
					   [RoleId, TarRoleId, _C, _E,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelzs_war_zone213,
			     __Traceszs_war_zone213, lager_event,
			     __Pidzs_war_zone213);
	    _ -> ok
	  end
    end,
    continue(StateName, State);
handle_info({robot_ai, RobotId, N}, StateName = match,
	    State) ->
    robot_ai(get_role(RobotId), N),
    continue(StateName, State);
handle_info({use_skill, RoleId, SkillId, Ext},
	    StateName = match, State) ->
    try use_skill(get_role(RoleId),
		  zs_war_data:get_skill(SkillId), Ext)
    catch
      _C:_E ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war_zone227, _,
	     {__Levelzs_war_zone227, __Traceszs_war_zone227}}
		when __Levelzs_war_zone227 band 8 /= 0 orelse
		       __Traceszs_war_zone227 /= [] ->
		lager:do_log(error,
			     [{module, zs_war_zone}, {function, handle_info},
			      {line, 227}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色~w 使用技能:~w err: ~w ~w ~w",
					   [RoleId, SkillId, _C, _E,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelzs_war_zone227,
			     __Traceszs_war_zone227, lager_event,
			     __Pidzs_war_zone227);
	    _ -> ok
	  end
    end,
    continue(StateName, State);
handle_info({del_skill_effect, RoleId, SkillEff},
	    StateName, State) ->
    case get_role(RoleId) of
      R = #zs_war_role{skill_effect = SkillEffect, status = 2}
	  when SkillEff =:= 3 ->
	  update_and_push_role(R#zs_war_role{skill_effect =
						 lists:delete(SkillEff,
							      SkillEffect),
					     status = 0});
      R = #zs_war_role{skill_effect = SkillEffect}
	  when SkillEff =:= 1 ->
	  update_and_push_role(R#zs_war_role{skill_effect =
						 lists:delete(SkillEff,
							      SkillEffect)});
      R = #zs_war_role{skill_effect = SkillEffect} ->
	  update_and_push_role(R#zs_war_role{skill_effect =
						 lists:delete(SkillEff,
							      SkillEffect)});
      _ -> skip
    end,
    continue(StateName, State);
handle_info({stop, Flag}, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone274, _,
       {__Levelzs_war_zone274, __Traceszs_war_zone274}}
	  when __Levelzs_war_zone274 band 64 /= 0 orelse
		 __Traceszs_war_zone274 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_zone}, {function, handle_info},
			{line, 274}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到结束命令:~w", [Flag]), none, 4096, 64,
		       __Levelzs_war_zone274, __Traceszs_war_zone274,
		       lager_event, __Pidzs_war_zone274);
      _ -> ok
    end,
    continue(StateName,
	     State#state{ts = date:now(), timeout = 1});
handle_info(_Info, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone278, _,
       {__Levelzs_war_zone278, __Traceszs_war_zone278}}
	  when __Levelzs_war_zone278 band 64 /= 0 orelse
		 __Traceszs_war_zone278 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_zone}, {function, handle_info},
			{line, 278}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w=>接收到非法信息:~w", [StateName, _Info]),
		       none, 4096, 64, __Levelzs_war_zone278,
		       __Traceszs_war_zone278, lager_event,
		       __Pidzs_war_zone278);
      _ -> ok
    end,
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    [role:apply(async, RolePid,
		{fun (R) ->
			 combat:stop(list_util:keyfind(15,
						       R#role.combat_type_list,
						       0),
				     stop),
			 ok
		 end})
     || #zs_war_role{pid = RolePid} <- get(role_list),
	is_pid(RolePid)],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone284, _,
       {__Levelzs_war_zone284, __Traceszs_war_zone284}}
	  when __Levelzs_war_zone284 band 64 /= 0 orelse
		 __Traceszs_war_zone284 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_zone}, {function, terminate},
			{line, 284}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭:group:~w zone:~w",
				     [get(group), get(zone)]),
		       none, 4096, 64, __Levelzs_war_zone284,
		       __Traceszs_war_zone284, lager_event,
		       __Pidzs_war_zone284);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state, StateName, State,
     date:time_left(Timeout, Ts)}.

continue(StateName, Reply,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    {reply, Reply, StateName, State,
     date:time_left(Timeout, Ts)}.

match(timeout, State) ->
    reward(),
    continue(stat,
	     State#state{ts = date:now(), timeout = 1500});
match(_Any, State) -> continue(match, State).

stat(timeout, State) -> {stop, normal, State};
stat(_Any, State) -> continue(stat, State).

get_role(RoleId) ->
    lists:keyfind(RoleId, #zs_war_role.id, get(role_list)).

update_role(RL) when is_list(RL) ->
    [update_role(R) || R <- RL];
update_role(ZsRole = #zs_war_role{id = RoleId}) ->
    put(role_list,
	lists:keyreplace(RoleId, #zs_war_role.id,
			 get(role_list), ZsRole)).

update_and_push_role(R) -> update_and_push_role(R, 3).

update_and_push_role([], _Type) -> ok;
update_and_push_role(ZsRole = #zs_war_role{}, Type) ->
    send(all, 1, 21410, {Type, [ZsRole]}),
    update_role(ZsRole);
update_and_push_role(RL, Type) ->
    send(all, 1, 21410, {Type, RL}), update_role(RL).

init_pos(ZsRole = #zs_war_role{camp = Camp,
			       max_power = MaxPower}) ->
    [PosY | Ty] = get({pos_y_list, Camp}),
    [PosX | Tx] = get({pos_x_list, Camp}),
    case Ty of
      [] ->
	  put({pos_y_list, Camp}, [1, 2, 3]),
	  put({pos_x_list, Camp}, Tx ++ [PosX]);
      _ -> put({pos_y_list, Camp}, Ty)
    end,
    put({power, Camp}, get({power, Camp}) + MaxPower),
    SkillList = [{SId, 0, 0}
		 || SId <- zs_war_data:list_skill(Camp)],
    Now = date:unixtime(),
    ZsRole#zs_war_role{pos_x = PosX, pos_y = PosY,
		       start_time = Now + 10, move_cd_time = Now + 10,
		       skill_list = SkillList, combat_cd_time = Now + 10,
		       zone_id = get(zone), zone_pid = self()}.

init_robot() ->
    ANum = get({role_num, 1}),
    BNum = get({role_num, 2}),
    Num = ANum + BNum,
    case Num < zs_war_data:get_const(robot_limit) of
      true ->
	  [R = #zs_war_role{power = Power} | _] =
	      util:keys_sort([{asc, #zs_war_role.power}],
			     get(role_list)),
	  case zs_war_data:get_robot({get(group), Power}) of
	    Data = #{a_robot_list := ARobotList,
		     b_robot_list := BRobotList} ->
		do_init_robot(ANum,
			      zs_war_data:get_const(robot_limit) div 2, 1, R,
			      ARobotList, Data),
		do_init_robot(BNum,
			      zs_war_data:get_const(robot_limit) div 2, 2, R,
			      BRobotList, Data);
	    _ -> pass
	  end;
      _ -> skip
    end.

do_init_robot(Num, Max, Camp,
	      R = #zs_war_role{lev = Lev, power = Power},
	      RobotList = [_ | _],
	      Data = #{attr_correction :=
			   [{MinPowerRatio, MaxPowerRatio}],
		       lev_correction := [{MinLev, MaxLev}]})
    when Num < Max ->
    #{min_lev := GroupMinLev, max_lev := GroupMaxLev} =
	zs_war_data:group_data(get(group)),
    put({role_num, Camp}, get({role_num, Camp}) + 1),
    Lev1 = util:check_range(Lev + util:rand(MinLev, MaxLev),
			    GroupMinLev, GroupMaxLev),
    Power1 = round(Power *
		     util:rand(MinPowerRatio, MaxPowerRatio)
		     / 1000),
    Name1 = util:rand_list(random_name_data:arena_list(1)),
    Name2 = util:rand_list(random_name_data:arena_list(2)),
    Name3 = util:rand_list(random_name_data:arena_list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    RoleId = {get_id(), <<>>},
    RobotId = util:rand_list(RobotList),
    #{formation := Formation} = robot_data:get(RobotId),
    {FormationType, _FormationLev, _} =
	util:rand_list(Formation, 3),
    NewR = init_pos(#zs_war_role{id = RoleId, name = Name,
				 face = 10001, lookid = 10001, lev = Lev1,
				 robot_id = RobotId, is_robot = 1, camp = Camp,
				 group = get(group), power = Power1,
				 max_power = Power1,
				 formation_type = FormationType}),
    put(role_list, [NewR | get(role_list)]),
    erlang:send_after(util:rand(10000, 20000), self(),
		      {robot_ai, RoleId, 0}),
    do_init_robot(Num + 1, Max, Camp, R, RobotList, Data);
do_init_robot(_Num, _Max, _Camp, _R, _RobotList,
	      _Data) ->
    ok.

robot_ai(R = #zs_war_role{id = RoleId, camp = Camp},
	 N) ->
    SId = util:rand_list(zs_war_data:list_skill(Camp)),
    case catch use_skill(R, zs_war_data:get_skill(SId), #{})
	of
      true ->
	  erlang:send_after(util:rand(30000, 60000), self(),
			    {robot_ai, RoleId, N + 1});
      _ ->
	  erlang:send_after(util:rand(5000, 15000), self(),
			    {robot_ai, RoleId, N + 1})
    end;
robot_ai(_, _N) -> ok.

get_id() -> put(idx, get(idx) + 1).

init_guard() ->
    [do_init_guard(I)
     || I <- zs_war_data:list_guard(get(group))].

do_init_guard(Id) ->
    #zs_war_guard_data{camp = Camp, bid = Bid, pos_x = PosX,
		       pos_y = PosY, max_hp = MaxHp} =
	zs_war_data:get_guard({get(group), Id}),
    #zs_war_guard{id = Id, camp = Camp, bid = Bid,
		  pos_x = PosX, pos_y = PosY, max_hp = MaxHp, hp = MaxHp}.

send(RL, InUI, broadcast_and_top, Msg) ->
    send(RL, InUI, 12761,
	 {[], 48, 0, Msg, date:unixtime()});
send(RL, InUI, broadcast, Msg) ->
    send(RL, InUI, 12761,
	 {[], 16, 0, Msg, date:unixtime()});
send(all, InUI, Cmd, Data) ->
    do_send(get(role_list), InUI,
	    proto_lib:pack(Cmd, Data));
send(RL, InUI, Cmd, Data) ->
    do_send(RL, InUI, proto_lib:pack(Cmd, Data)).

do_send([I | T], InUI, Bin) ->
    do_send(I, InUI, Bin), do_send(T, InUI, Bin);
do_send(#zs_war_role{pid = RolePid, in_ui = 1}, 1, Bin)
    when is_pid(RolePid) ->
    role:proxy_send(RolePid, Bin);
do_send(#zs_war_role{pid = RolePid}, all, Bin)
    when is_pid(RolePid) ->
    role:proxy_send(RolePid, Bin);
do_send(RolePid, _InUI, Bin) when is_pid(RolePid) ->
    role:proxy_send(RolePid, Bin);
do_send(_, _InUI, _Bin) -> ok.

use_skill(R = #zs_war_role{status = 1}, _S, _Ext) ->
    send(R, all, 12741, {lang:get(<<"战斗中，不能使用该技能"/utf8>>)}),
    false;
use_skill(R = #zs_war_role{status = 2}, _S, _Ext) ->
    send(R, all, 12741, {lang:get(<<"眩晕中，不能使用该技能"/utf8>>)}),
    false;
use_skill(R = #zs_war_role{skill_list = SkillList,
			   pid = RolePid, status = 0, start_time = StartTime},
	  Data = #zs_war_skill_data{id = Id, cd = CdTime,
				    effect = Effect, loss = Loss, free = Free},
	  Ext) ->
    Now = date:unixtime(),
    case lists:keyfind(Id, 1, SkillList) of
      _ when StartTime > Now ->
	  send(R, all, 12741,
	       {lang:get(<<"准备倒计时，不能使用技能"/utf8>>)}),
	  false;
      {Id, EndTime, _Num} when EndTime > Now ->
	  send(R, all, 12741, {lang:get(<<"技能冷却中"/utf8>>)}),
	  false;
      {Id, _EndTime, Num} ->
	  case check_can_use_skill(Loss, Free, Num, Ext) of
	    {false, Reason} -> send(R, all, 12741, {Reason}), false;
	    true ->
		case do_use_skill(R, Now, Effect, Data) of
		  {ok, NewR} ->
		      case Loss of
			[_ | _] when Num >= Free ->
			    role:apply(async, RolePid,
				       {zs_war, apply_use_skill, [Id]});
			_ -> skip
		      end,
		      NewSkillList = lists:keyreplace(Id, 1, SkillList,
						      {Id, Now + CdTime,
						       Num + 1}),
		      send(R, all, 21420, {NewSkillList}),
		      update_and_push_role(NewR#zs_war_role{skill_list =
								NewSkillList}),
		      true;
		  _ -> false
		end
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war_zone474, _,
	     {__Levelzs_war_zone474, __Traceszs_war_zone474}}
		when __Levelzs_war_zone474 band 8 /= 0 orelse
		       __Traceszs_war_zone474 /= [] ->
		lager:do_log(error,
			     [{module, zs_war_zone}, {function, use_skill},
			      {line, 474}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]使用技能~w 不存在",
					   [R#zs_war_role.name, Id]),
			     none, 4096, 8, __Levelzs_war_zone474,
			     __Traceszs_war_zone474, lager_event,
			     __Pidzs_war_zone474);
	    _ -> ok
	  end,
	  false
    end;
use_skill(_R, _SkillData, _Ext) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone478, _,
       {__Levelzs_war_zone478, __Traceszs_war_zone478}}
	  when __Levelzs_war_zone478 band 8 /= 0 orelse
		 __Traceszs_war_zone478 /= [] ->
	  lager:do_log(error,
		       [{module, zs_war_zone}, {function, use_skill},
			{line, 478}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("使用技能失败:~w", [_SkillData]), none, 4096, 8,
		       __Levelzs_war_zone478, __Traceszs_war_zone478,
		       lager_event, __Pidzs_war_zone478);
      _ -> ok
    end,
    false.

check_can_use_skill(_, Free, Num, _Ext)
    when Free > Num ->
    true;
check_can_use_skill([], _Free, _Num, _Ext) -> true;
check_can_use_skill([{3, NeedGold} | T], Free, Num,
		    Ext) ->
    case maps:get(gold, Ext, 0) >= NeedGold of
      true -> check_can_use_skill(T, Free, Num, Ext);
      _ -> {false, lang:get(<<"Không đủ vàng"/utf8>>)}
    end;
check_can_use_skill([{15, NeedGold} | T], Free, Num,
		    Ext) ->
    case maps:get(gold, Ext, 0) + maps:get(red_gold, Ext, 0)
	   >= NeedGold
	of
      true -> check_can_use_skill(T, Free, Num, Ext);
      _ -> {false, lang:get(<<"Không đủ vàng"/utf8>>)}
    end;
check_can_use_skill([{1, NeedCoin} | T], Free, Num,
		    Ext) ->
    case maps:get(coin, Ext, 0) >= NeedCoin of
      true -> check_can_use_skill(T, Free, Num, Ext);
      _ -> {false, lang:get(<<"Bạc không đủ"/utf8>>)}
    end.

do_use_skill(R = #zs_war_role{id = RoleId,
			      skill_effect = SkillEffect,
			      combat_cd_time = ComTime, start_time = StartTime,
			      move_cd_time = MoveCd},
	     Now, [{upspeed, Time}],
	     #zs_war_skill_data{name = SkillName}) ->
    NewR = R#zs_war_role{combat_cd_time =
			     max(ComTime, Now + Time),
			 move_cd_time = max(StartTime, min(MoveCd, Now)),
			 skill_effect = [1 | lists:delete(1, SkillEffect)]},
    erlang:send_after(Time * 1000, self(),
		      {del_skill_effect, RoleId, 1}),
    send(R, all, 12741,
	 {color:msg(lang:get(<<"Bạn đã sử dụng~tsKỹ năng  "/utf8>>),
		    [{binary, SkillName}])}),
    {ok, NewR};
do_use_skill(R = #zs_war_role{id = RoleId,
			      skill_effect = SkillEffect},
	     _Now, [{def, Time}],
	     #zs_war_skill_data{name = SkillName}) ->
    NewR = R#zs_war_role{skill_effect =
			     [2 | lists:delete(2, SkillEffect)]},
    erlang:send_after(Time * 1000, self(),
		      {del_skill_effect, RoleId, 2}),
    send(R, all, 12741,
	 {color:msg(lang:get(<<"Bạn đã sử dụng~tsKỹ năng  "/utf8>>),
		    [{binary, SkillName}])}),
    {ok, NewR};
do_use_skill(R = #zs_war_role{id = RoleId, camp = Camp,
			      pos_x = PosX, name = Name},
	     _Now, [{stop, Time, HitRatio}],
	     #zs_war_skill_data{name = _SkillName}) ->
    case [{pos_distance(Camp, PosX, PosX2), R1}
	  || R1 = #zs_war_role{camp = Camp2, pos_x = PosX2,
			       status = 0}
		 <- get(role_list),
	     Camp =/= Camp2, pos_distance(Camp, PosX, PosX2) > 0]
	of
      L0 = [_ | _] ->
	  L1 = [{N, _} | _] = util:keys_sort([{asc, 1}], L0),
	  L2 = [R1 || {N2, R1} <- L1, N2 =:= N],
	  R2 = #zs_war_role{id = RoleId2,
			    skill_effect = SkillEffect2, name = Name2} =
		   util:rand_list(L2),
	  case lists:member(2, SkillEffect2) of
	    true ->
		send(R, all, 12741,
		     {color:msg(lang:get(<<"Làm choáng kẻ địch trước mặt bạn thành "
					   "công.~ts"/utf8>>),
				[{name, RoleId2, Name2}])}),
		send(R2, 1, 12741,
		     {color:msg(lang:get(<<"Đã bảo vệ thành công mặt trận~tsTấn "
					   "công choáng váng"/utf8>>),
				[{name, RoleId, Name}])});
	    _ ->
		case util:rand(1, 1000) =< HitRatio of
		  true ->
		      send(R, all, 12741,
			   {color:msg(lang:get(<<"Làm choáng kẻ địch trước mặt bạn thành "
						 "công.~ts"/utf8>>),
				      [{name, RoleId2, Name2}])}),
		      erlang:send_after(Time * 1000, self(),
					{del_skill_effect, RoleId2, 3}),
		      update_and_push_role(R2#zs_war_role{status = 2,
							  skill_effect =
							      [3
							       | lists:delete(1,
									      SkillEffect2)]}),
		      send(R2, 1, 12741,
			   {color:msg(lang:get(<<"Bị ảnh hưởng bởi phía trước~tsTấn công "
						 "choáng váng"/utf8>>),
				      [{name, RoleId, Name}])});
		  _ ->
		      send(R, all, 12741,
			   {color:msg(lang:get(<<"~tsTôi né đòn tấn công choáng váng của "
						 "anh bằng chuyển động duyên dáng của "
						 "mình."/utf8>>),
				      [{name, RoleId2, Name2}])})
		end
	  end;
      _ ->
	  send(R, all, 12741,
	       {lang:get(<<"Cuộc tấn công này đã thất bại, không "
			   "có mục tiêu phía trước."/utf8>>)})
    end,
    {ok, R};
do_use_skill(_R, _Now, _Eff, _SData) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone535, _,
       {__Levelzs_war_zone535, __Traceszs_war_zone535}}
	  when __Levelzs_war_zone535 band 8 /= 0 orelse
		 __Traceszs_war_zone535 /= [] ->
	  lager:do_log(error,
		       [{module, zs_war_zone}, {function, do_use_skill},
			{line, 535}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts 技能效果不能处理:~w",
				     [_R#zs_war_role.name, _Eff]),
		       none, 4096, 8, __Levelzs_war_zone535,
		       __Traceszs_war_zone535, lager_event,
		       __Pidzs_war_zone535);
      _ -> ok
    end.

move_match(Now) ->
    case [R
	  || R = #zs_war_role{status = 0} <- get(role_list)]
	of
      [] -> skip;
      RL ->
	  {UpdateRL, MoveRL, CombatRL} = do_move_match(RL, Now,
						       [], [], []),
	  update_and_push_role(UpdateRL, 2),
	  update_role(MoveRL),
	  case UpdateRL of
	    [] -> skip;
	    _ -> send(all, 1, 21412, pack_21412())
	  end,
	  case MoveRL of
	    [] -> skip;
	    _ -> send(all, 1, 21411, {MoveRL})
	  end,
	  do_combat(CombatRL)
    end.

do_move_match([], _Now, UpdateRL, MoveRL, CombatRL) ->
    {UpdateRL, MoveRL, CombatRL};
do_move_match([R = #zs_war_role{id = RoleId1,
				camp = Camp, pos_x = PosX, pos_y = PosY,
				move_num = MoveNum, score = Score,
				skill_effect = SkillEffect}
	       | T],
	      Now, UpdateRL, MoveRL, CombatRL) ->
    case do_match(R, T, Now) of
      skip ->
	  do_move_match(T, Now, UpdateRL, MoveRL, CombatRL);
      relive ->
	  AddScore = check_score(move, MoveNum, get_score(4)),
	  NewR = R#zs_war_role{pos_x = start_pos_x(Camp),
			       pos_y = start_pos_y(PosY),
			       move_num = MoveNum + 1,
			       score = Score + AddScore},
	  update_and_push_role(NewR, 2),
	  add_camp_score(move, NewR, 4, AddScore),
	  guard_hurt(NewR,
		     zs_war_data:combat_hurt({get(group), 4})),
	  notice_score(move, NewR, AddScore,
		       zs_war_data:combat_hurt({get(group), 4})),
	  do_move_match(T, Now, UpdateRL, MoveRL, CombatRL);
      move ->
	  MoveTime = util:if_true(lists:member(1, SkillEffect), 1,
				  2),
	  NewR = R#zs_war_role{pos_x = next_pos_x(PosX, Camp),
			       move_cd_time = Now + MoveTime},
	  update_role(NewR),
	  do_move_match(T, Now, UpdateRL, [NewR | MoveRL],
			CombatRL);
      {pk, R2 = #zs_war_role{id = RoleId2}} ->
	  NewR = R#zs_war_role{status = 1,
			       combat_role_id = RoleId2},
	  NewR2 = R2#zs_war_role{status = 1,
				 combat_role_id = RoleId1},
	  do_move_match(lists:keydelete(R2#zs_war_role.id,
					#zs_war_role.id, T),
			Now, [NewR, NewR2 | UpdateRL], MoveRL,
			[{NewR, NewR2} | CombatRL])
    end.

do_match(#zs_war_role{pos_x = 2, camp = 1,
		      move_cd_time = Time},
	 _T, Now) ->
    util:if_true(Now >= Time, move, skip);
do_match(#zs_war_role{pos_x = 14, camp = 2,
		      move_cd_time = Time},
	 _T, Now) ->
    util:if_true(Now >= Time, move, skip);
do_match(#zs_war_role{pos_x = 14, camp = 1,
		      move_cd_time = Time},
	 _T, Now) ->
    util:if_true(Now >= Time, relive, skip);
do_match(#zs_war_role{pos_x = 2, camp = 2,
		      move_cd_time = Time},
	 _T, Now) ->
    util:if_true(Now >= Time, relive, skip);
do_match(#zs_war_role{move_cd_time = Time,
		      combat_cd_time = ComTime},
	 _T, Now)
    when Now < ComTime ->
    util:if_true(Time > Now, skip, move);
do_match(#zs_war_role{id = RoleId, camp = Camp,
		      pos_x = PosX, move_cd_time = Time,
		      combat_role_id = LastRoleId},
	 T, Now) ->
    NextPosX = next_pos_x(PosX, Camp),
    StartPosX = util:if_true(Camp =:= 1, 2, 14),
    case [R
	  || R = #zs_war_role{camp = Camp2, pos_x = PosX2,
			      combat_cd_time = ComTime}
		 <- T,
	     Camp2 =/= Camp, PosX2 =/= StartPosX,
	     PosX =:= PosX2 orelse NextPosX =:= PosX2,
	     Now >= ComTime]
	of
      L = [_ | _] ->
	  case [R || R <- L, R#zs_war_role.id =/= LastRoleId] of
	    L1 = [_ | _] -> {pk, util:rand_list(L1)};
	    _ when Now < Time -> skip;
	    _ ->
		self() ! {clear_combat, RoleId, LastRoleId},
		util:if_true(Time > Now, skip, move)
	  end;
      _ when Now >= Time -> move;
      _ -> skip
    end.

enemy_camp(1) -> 2;
enemy_camp(2) -> 1.

start_pos_x(1) -> 2;
start_pos_x(2) -> 14.

start_pos_y(_PosY) -> util:rand_list([1, 2, 3]).

next_pos_x(PosX, 1) -> min(PosX + 1, 14);
next_pos_x(PosX, 2) -> max(PosX - 1, 2).

pos_distance(1, PosX1, PosX2) -> PosX2 - PosX1;
pos_distance(2, PosX1, PosX2) -> PosX1 - PosX2.

camp_name(1) -> lang:get(<<"Thần Zeus"/utf8>>);
camp_name(2) -> lang:get(<<"Balrog"/utf8>>).

camp_color(1) -> godwar_team1;
camp_color(2) -> godwar_team2.

get_score(Type) ->
    zs_war_data:get_score({get(group), Type}).

check_score(move, Num, AddScore) ->
    util:if_true(Num >=
		   zs_war_data:get_const(move_reward_times),
		 0, AddScore);
check_score(combat, Num, AddScore) ->
    util:if_true(Num >= zs_war_data:get_const(reward_times),
		 0, AddScore).

notice_score(_Flag, _R, _AddScore, _Hurt) -> ok.

add_camp_score(combat, R = #zs_war_role{}, Type,
	       AddScore = 0) ->
    acc_items(R, Type, AddScore), ok;
add_camp_score(move, R = #zs_war_role{}, _Type,
	       _AddScore = 0) ->
    send(R, 1, 12741,
	 {util:fbin(lang:get(<<"Chạm đất~wKhông có điểm danh dự nào "
			       "có thể đạt được sau"/utf8>>),
		    [zs_war_data:get_const(move_reward_times)])});
add_camp_score(Flag, R = #zs_war_role{camp = Camp},
	       Type, AddScore) ->
    acc_items(R, Type, AddScore),
    add_camp_score(Flag, Camp, Type, AddScore);
add_camp_score(_Flag, Camp, _Type, AddScore) ->
    put({score, Camp}, get({score, Camp}) + AddScore).

acc_items(R, 4, AddScore) ->
    send(R, 1, 12741,
	 {util:fbin(lang:get(<<"Thành công chạm bóng, điểm danh dự+~w"/utf8>>),
		    [AddScore])});
acc_items(R = #zs_war_role{items = Items, pid = RolePid,
			   is_robot = 0},
	  Type, AddScore)
    when is_pid(RolePid) ->
    AddItems0 = case AddScore of
		  0 -> zs_war_data:combat_items2({get(group), Type});
		  _ -> zs_war_data:combat_items1({get(group), Type})
		end,
    AddItems = [{Bid, Num} || {Bid, Num} <- AddItems0],
    NewItems = item_lib:merge(AddItems, Items),
    role:apply(async, RolePid,
	       {zs_war, apply_reward,
		[#{type => Type, add_score => AddScore,
		   group => get(group), items => AddItems0}]}),
    update_role(R#zs_war_role{items = NewItems});
acc_items(_R, _Type, _AddScore) -> ok.

pack_21412() ->
    {get({score, 1}), get({score, 2}), get(group),
     get(zone)}.

guard_hurt(#zs_war_role{camp = _Camp}, _Hurt) -> ok.

guard_diff_hp_effect(Now) ->
    Score1 = get({score, 1}),
    Score2 = get({score, 2}),
    #zs_war_guard_data{diff_hp = DiffHp, time = Time,
		       cd = Cd} =
	zs_war_data:get_guard({get(group), 1}),
    case abs(Score1 - Score2) >= DiffHp of
      true ->
	  Camp = util:if_true(Score1 > Score2, 2, 1),
	  case get({camp_effect, Camp}) of
	    E = #{role_id := RoleId, end_time := EndTime,
		  buff_end_time := BuffEndTime}
		when EndTime > Now ->
		case BuffEndTime < Now andalso RoleId =/= null of
		  true ->
		      put({camp_effect, Camp}, E#{role_id := null}),
		      R = get_role(RoleId),
		      NewR = calc_effect(R, Now),
		      update_and_push_role(NewR);
		  _ -> pass
		end;
	    _E ->
		case [R
		      || R = #zs_war_role{camp = Camp1} <- get(role_list),
			 Camp =:= Camp1]
		    of
		  [] -> pass;
		  RL ->
		      R = #zs_war_role{id = RoleId} = util:rand_list(RL),
		      put({camp_effect, Camp},
			  #{role_id => RoleId, buff_end_time => Now + Time,
			    end_time => Now + Time + Cd}),
		      NewR = R#zs_war_role{effect = 9},
		      update_and_push_role(NewR),
		      combat_notice(R, camp_effect)
		end
	  end;
      _ -> pass
    end.

do_combat([]) -> ok;
do_combat([{#zs_war_role{id = RoleId1, is_robot = 1},
	    #zs_war_role{id = RoleId2, is_robot = 1}}
	   | T]) ->
    erlang:send_after(util:rand(30000, 100000), self(),
		      {combat_over, RoleId1, RoleId2,
		       #combat_result{result = util:rand_list([1, 2])}}),
    do_combat(T);
do_combat([{R1 = #zs_war_role{id = Rid1, name = Name1,
			      camp = Camp1},
	    R2 = #zs_war_role{id = Rid2, name = Name2,
			      camp = Camp2}}
	   | T]) ->
    send(R1, 1, 12741,
	 {color:msg(lang:get(<<"bắt gặp~ts"/utf8>>),
		    [{name, Rid2, Name2}])}),
    send(R2, 1, 12741,
	 {color:msg(lang:get(<<"bắt gặp~ts"/utf8>>),
		    [{name, Rid1, Name1}])}),
    Ext = #{Camp1 => get({camp_effect, Camp1}),
	    Camp2 => get({camp_effect, Camp2})},
    spawn(fun () -> zs_war:combat(R1, R2, Ext) end),
    do_combat(T).

combat_over(R1 = #zs_war_role{win = Win1,
			      win_acc = WinAcc1, win_best = WinBest1,
			      partner_hp = PartnerHp1, score = Score1,
			      num = Num1},
	    R2 = #zs_war_role{lose = Lose2, lose_acc = LoseAcc2,
			      camp = Camp2, score = Score2, win = Win2,
			      win_acc = WinAcc2, num = Num2, pos_y = PosY2},
	    #combat_result{result = 1, a_stat_info = AtkList},
	    Now) ->
    FirstFloodScore = util:if_true(get(first_kill) ==
				     undefined,
				   zs_war_data:get_const(reward_firstblood), 0),
    AddScore1 = check_score(combat, Num1,
			    get_score(1) +
			      zs_war_data:cont_win_score({get(group), 1,
							  Win1 + 1})
			      +
			      zs_war_data:cont_win_score({get(group), 2, Win2})
			      + FirstFloodScore),
    AddScore2 = check_score(combat, Num2, get_score(2)),
    NewScore1 = Score1 + AddScore1,
    NewScore2 = Score2 + AddScore2,
    NewR1 = calc_effect(R1#zs_war_role{win = Win1 + 1,
				       win_acc = WinAcc1 + 1,
				       win_best = max(WinBest1, Win1 + 1),
				       lose = 0, status = 0,
				       partner_hp =
					   merge_hp(PartnerHp1, AtkList),
				       score = NewScore1,
				       combat_cd_time = Now + 5,
				       num = Num1 + 1},
			Now),
    NewR2 = calc_effect(R2#zs_war_role{win = 0,
				       lose = Lose2 + 1,
				       lose_acc = LoseAcc2 + 1,
				       status = die_status(R2),
				       pos_x = start_pos_x(Camp2),
				       pos_y = start_pos_y(PosY2),
				       partner_hp = [], score = NewScore2,
				       combat_cd_time = Now + 7,
				       num = Num2 + 1},
			Now),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone756, _,
       {__Levelzs_war_zone756, __Traceszs_war_zone756}}
	  when __Levelzs_war_zone756 band 128 /= 0 orelse
		 __Traceszs_war_zone756 /= [] ->
	  lager:do_log(debug,
		       [{module, zs_war_zone}, {function, combat_over},
			{line, 756}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts win pk ~ts  AddScore: ~w : ~w",
				     [R1#zs_war_role.name, R2#zs_war_role.name,
				      AddScore1, AddScore2]),
		       none, 4096, 128, __Levelzs_war_zone756,
		       __Traceszs_war_zone756, lager_event,
		       __Pidzs_war_zone756);
      _ -> ok
    end,
    send(NewR1, all, 21425,
	 {get(group), Num1 + 1, WinAcc1 + 1}),
    send(NewR2, all, 21425,
	 {get(group), Num2 + 1, WinAcc2}),
    update_and_push_role([NewR1, NewR2], 2),
    add_camp_score(combat, NewR1, 1, AddScore1),
    add_camp_score(combat, NewR2, 2, AddScore2),
    guard_hurt(NewR1,
	       zs_war_data:combat_hurt({get(group), 1}) +
		 zs_war_data:buff_hurt({get(group), 1, Win1 + 1})),
    guard_hurt(NewR2,
	       zs_war_data:combat_hurt({get(group), 2})),
    notice_score(win, NewR1, AddScore1,
		 zs_war_data:combat_hurt({get(group), 1}) +
		   zs_war_data:buff_hurt({get(group), 1, Win1 + 1})),
    notice_score(lose, NewR2, AddScore2,
		 zs_war_data:combat_hurt({get(group), 2})),
    combat_notice(R1, R2);
combat_over(R1 = #zs_war_role{win = Win1,
			      win_acc = WinAcc1, lose = Lose1,
			      lose_acc = LoseAcc1, camp = Camp1, score = Score1,
			      num = Num1, pos_y = PosY1},
	    R2 = #zs_war_role{win = Win2, win_acc = WinAcc2,
			      win_best = WinBest2, partner_hp = PartnerHp2,
			      score = Score2, num = Num2},
	    #combat_result{result = 2, b_stat_info = DefList},
	    Now) ->
    FirstFloodScore = util:if_true(get(first_kill) ==
				     undefined,
				   zs_war_data:get_const(reward_firstblood), 0),
    AddScore1 = check_score(combat, Num1, get_score(2)),
    AddScore2 = check_score(combat, Num2,
			    get_score(1) +
			      zs_war_data:cont_win_score({get(group), 1,
							  Win2 + 1})
			      +
			      zs_war_data:cont_win_score({get(group), 2, Win1})
			      + FirstFloodScore),
    NewScore1 = Score1 + AddScore1,
    NewScore2 = Score2 + AddScore2,
    NewR1 = calc_effect(R1#zs_war_role{win = 0,
				       lose = Lose1 + 1,
				       lose_acc = LoseAcc1 + 1,
				       status = die_status(R1),
				       pos_x = start_pos_x(Camp1),
				       pos_y = start_pos_y(PosY1),
				       partner_hp = [], score = NewScore1,
				       combat_cd_time = Now + 7,
				       num = Num1 + 1},
			Now),
    NewR2 = calc_effect(R2#zs_war_role{win = Win2 + 1,
				       win_acc = WinAcc2 + 1,
				       win_best = max(WinBest2, Win2 + 1),
				       lose = 0, status = 0,
				       partner_hp =
					   merge_hp(PartnerHp2, DefList),
				       score = NewScore2,
				       combat_cd_time = Now + 5,
				       num = Num2 + 1},
			Now),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone775, _,
       {__Levelzs_war_zone775, __Traceszs_war_zone775}}
	  when __Levelzs_war_zone775 band 128 /= 0 orelse
		 __Traceszs_war_zone775 /= [] ->
	  lager:do_log(debug,
		       [{module, zs_war_zone}, {function, combat_over},
			{line, 775}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts pk win ~ts  AddScore: ~w : ~w",
				     [R1#zs_war_role.name, R2#zs_war_role.name,
				      AddScore1, AddScore2]),
		       none, 4096, 128, __Levelzs_war_zone775,
		       __Traceszs_war_zone775, lager_event,
		       __Pidzs_war_zone775);
      _ -> ok
    end,
    send(NewR1, all, 21425,
	 {get(group), Num1 + 1, WinAcc1}),
    send(NewR2, all, 21425,
	 {get(group), Num2 + 1, WinAcc2 + 1}),
    update_and_push_role([NewR1, NewR2], 2),
    add_camp_score(combat, NewR1, 2, AddScore1),
    add_camp_score(combat, NewR2, 1, AddScore2),
    guard_hurt(NewR1,
	       zs_war_data:combat_hurt({get(group), 2})),
    guard_hurt(NewR2,
	       zs_war_data:combat_hurt({get(group), 1}) +
		 zs_war_data:buff_hurt({get(group), 1, Win2 + 1})),
    notice_score(lose, NewR1, AddScore1,
		 zs_war_data:combat_hurt({get(group), 2})),
    notice_score(win, NewR2, AddScore2,
		 zs_war_data:combat_hurt({get(group), 1}) +
		   zs_war_data:buff_hurt({get(group), 1, Win1 + 1})),
    combat_notice(R2, R1);
combat_over(R1 = #zs_war_role{draw = Draw1,
			      partner_hp = PartnerHp1, score = Score1,
			      num = Num1, win_acc = WinAcc1},
	    R2 = #zs_war_role{draw = Draw2, partner_hp = PartnerHp2,
			      score = Score2, num = Num2, win_acc = WinAcc2},
	    #combat_result{a_stat_info = AtkList,
			   b_stat_info = DefList},
	    Now) ->
    AddScore1 = check_score(combat, Num1, get_score(3)),
    AddScore2 = check_score(combat, Num2, get_score(3)),
    NewScore1 = Score1 + AddScore1,
    NewScore2 = Score2 + AddScore2,
    NewR1 = R1#zs_war_role{draw = Draw1 + 1, status = 0,
			   partner_hp = merge_hp(PartnerHp1, AtkList),
			   score = NewScore1, combat_cd_time = Now + 7,
			   num = Num1 + 1},
    NewR2 = R2#zs_war_role{draw = Draw2 + 1, status = 0,
			   partner_hp = merge_hp(PartnerHp2, DefList),
			   score = NewScore2, combat_cd_time = Now + 7,
			   num = Num2 + 1},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone793, _,
       {__Levelzs_war_zone793, __Traceszs_war_zone793}}
	  when __Levelzs_war_zone793 band 128 /= 0 orelse
		 __Traceszs_war_zone793 /= [] ->
	  lager:do_log(debug,
		       [{module, zs_war_zone}, {function, combat_over},
			{line, 793}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts pk draw ~ts  AddScore: ~w : ~w",
				     [R1#zs_war_role.name, R2#zs_war_role.name,
				      AddScore1, AddScore2]),
		       none, 4096, 128, __Levelzs_war_zone793,
		       __Traceszs_war_zone793, lager_event,
		       __Pidzs_war_zone793);
      _ -> ok
    end,
    send(NewR1, all, 21425,
	 {get(group), Num1 + 1, WinAcc1}),
    send(NewR2, all, 21425,
	 {get(group), Num2 + 1, WinAcc2}),
    update_and_push_role([NewR1, NewR2]),
    add_camp_score(combat, NewR1, 3, AddScore1),
    add_camp_score(combat, NewR2, 3, AddScore2),
    guard_hurt(NewR1,
	       zs_war_data:combat_hurt({get(group), 3})),
    guard_hurt(NewR2,
	       zs_war_data:combat_hurt({get(group), 3})),
    notice_score(draw, NewR1, AddScore1,
		 zs_war_data:combat_hurt({get(group), 3})),
    notice_score(draw, NewR2, AddScore2,
		 zs_war_data:combat_hurt({get(group), 3})).

merge_hp(HpList, L) ->
    Fun = fun (#{object_id := Id, hp := Hp,
		 hp_max := MaxHp},
	       L1) ->
		  lists:keystore(Id, 1, L1,
				 {Id, util:ceil(Hp * 100 / MaxHp)})
	  end,
    L1 = lists:foldl(Fun, HpList, L),
    case [1 || {_Id, Val} <- L1, Val > 0] of
      [] -> [];
      _ -> L1
    end.

die_status(_) -> 0.

calc_effect(R = #zs_war_role{id = RoleId, camp = Camp,
			     win = Win, lose = Lose},
	    Now) ->
    case get({camp_effect, Camp}) of
      E = #{role_id := RoleId, buff_end_time := Time}
	  when Time > Now andalso Win =:= 0 andalso Lose > 0 ->
	  #zs_war_guard_data{cd = Cd} =
	      zs_war_data:get_guard({get(group), Camp}),
	  put({camp_effect, Camp},
	      E#{role_id := null, buff_end_time := Now,
		 end_time := Now + Cd}),
	  R#zs_war_role{effect =
			    zs_war_data:buff_effect({get(group), 1, Win}) +
			      zs_war_data:buff_effect({get(group), 2, Lose})};
      #{role_id := RoleId, buff_end_time := Time}
	  when Time > Now ->
	  R#zs_war_role{effect = 9};
      _ ->
	  R#zs_war_role{effect =
			    zs_war_data:buff_effect({get(group), 1, Win}) +
			      zs_war_data:buff_effect({get(group), 2, Lose})}
    end.

combat_notice(#zs_war_role{id = RoleId, name = Name,
			   camp = Camp},
	      relive) ->
    Msg = case Camp of
	    1 ->
		color:msg(lang:get(<<"~ts阵营的~ts一路披荆斩棘，成功抵达敌方阵营，对炎魔之王造成了~ts点伤害！"/utf8>>),
			  [{string, camp_color(Camp), camp_name(Camp)},
			   {name, RoleId, Name},
			   {green, zs_war_data:combat_hurt({get(group), 4})}]);
	    _ ->
		color:msg(lang:get(<<"~ts阵营的~ts突破重重阻碍，成功抵达敌方阵营，对宙斯造成了~ts点伤害！"/utf8>>),
			  [{string, camp_color(Camp), camp_name(Camp)},
			   {name, RoleId, Name},
			   {godwar_score,
			    zs_war_data:combat_hurt({get(group), 4})}])
	  end,
    send(all, all, broadcast, Msg);
combat_notice(#zs_war_role{id = RoleId, name = Name,
			   camp = Camp},
	      camp_effect) ->
    Msg = case Camp of
	    1 ->
		color:msg(lang:get(<<"一道雷电闪过！~ts获得了~ts，同时宙斯阵营全体获得强力效果加成，大家要小心了！"/utf8>>),
			  [{name, RoleId, Name},
			   {string, camp_color(Camp),
			    lang:get(<<"宙斯之力"/utf8>>)}]);
	    _ ->
		color:msg(lang:get(<<"一阵火光冲天！~ts获得了~ts，同时炎魔阵营全体获得强力效果加成，大家要小心了！"/utf8>>),
			  [{name, RoleId, Name},
			   {string, camp_color(Camp),
			    lang:get(<<"炎魔之力"/utf8>>)}])
	  end,
    send(all, all, broadcast_and_top, Msg);
combat_notice(R1 = #zs_war_role{id =
				    RoleId1 = {_, SrvId1},
				face = Face1, name = Name1, camp = Camp1,
				win = Win1, num = Num1},
	      R2 = #zs_war_role{id = RoleId2 = {_, SrvId2},
				pid = RolePid2, face = Face2, name = Name2,
				lose = Lose2, win = Win2}) ->
    role:apply(async, RolePid2,
	       {zs_war, sync_formation, []}),
    case get(first_kill) of
      undefined ->
	  send(all, 1, 21416,
	       {1, Camp1, Face1, SrvId1, Name1, Face2, SrvId2, Name2}),
	  Msg0 =
	      color:msg(lang:get(<<"~ts阵营的~ts率先击杀敌方的~ts，额外获得~ts积分奖励！"/utf8>>),
			[{string, camp_color(Camp1), camp_name(Camp1)},
			 {name, RoleId1, Name1}, {name, RoleId2, Name2},
			 {godwar_score,
			  zs_war_data:get_const(reward_firstblood)}]),
	  send(all, all, broadcast, Msg0),
	  put(first_kill, RoleId1);
      _ -> pass
    end,
    case zs_war_data:buff_msg({get(group), 1, Win1 + 1}) of
      undefined -> pass;
      Msg1 -> send(R1, 1, 12741, {Msg1})
    end,
    case zs_war_data:buff_msg({get(group), 2, Lose2 + 1}) of
      undefined -> pass;
      Msg2 -> send(R2, 1, 12741, {Msg2})
    end,
    Data1 = zs_war_data:cont_win_notice({get(group), 1,
					 Win1 + 1}),
    case Data1 of
      #{notice_type := NoticeType1} when NoticeType1 > 0 ->
	  send(all, 1, 21416,
	       {NoticeType1, Camp1, Face1, SrvId1, Name1, Face2,
		SrvId2, Name2});
      _ -> pass
    end,
    case Data1 of
      #{msg1 := Msg1_1, msg2 := Msg1_2}
	  when is_binary(Msg1_1) andalso Msg1_1 =/= <<>> ->
	  Msg3 = case check_score(combat, Num1,
				  zs_war_data:cont_win_score({get(group), 1,
							      Win1 + 1}))
		     of
		   0 ->
		       color:msg(Msg1_2,
				 [{string, camp_color(Camp1), camp_name(Camp1)},
				  {name, RoleId1, Name1},
				  {string, godwar_score, Win1 + 1}]);
		   AddScore1 ->
		       color:msg(Msg1_1,
				 [{string, camp_color(Camp1), camp_name(Camp1)},
				  {name, RoleId1, Name1},
				  {string, godwar_score, Win1 + 1},
				  {string, godwar_score, AddScore1}])
		 end,
	  send(all, all, broadcast, Msg3);
      _ -> pass
    end,
    Data2 = zs_war_data:cont_win_notice({get(group), 2,
					 Win2}),
    case Data2 of
      #{notice_type := NoticeType2} ->
	  send(all, 1, 21416,
	       {NoticeType2, Camp1, Face1, SrvId1, Name1, Face2,
		SrvId2, Name2});
      _ -> pass
    end,
    case Data2 of
      #{msg1 := Msg2_1, msg2 := Msg2_2}
	  when is_binary(Msg2_1) andalso Msg2_1 =/= <<>> ->
	  Msg4 = case check_score(combat, Num1,
				  zs_war_data:cont_win_score({get(group), 2,
							      Win2}))
		     of
		   0 ->
		       color:msg(Msg2_2,
				 [{string, camp_color(Camp1), camp_name(Camp1)},
				  {name, RoleId1, Name1},
				  {name, RoleId2, Name2}]);
		   AddScore2 ->
		       color:msg(Msg2_1,
				 [{string, camp_color(Camp1), camp_name(Camp1)},
				  {name, RoleId1, Name1},
				  {name, RoleId2, Name2},
				  {string, godwar_score, AddScore2}])
		 end,
	  send(all, all, broadcast, Msg4);
      _ -> pass
    end,
    GroupData = zs_war_data:group_data(get(group)),
    case zs_war_data:get_const(news_kill) =:= Win1 + 1 of
      true ->
	  Msg5 =
	      color:msg(lang:get(<<"~ts在~ts-~ts等级段第~ts ~ts中大杀四方！他的名字已响彻整个众神战场！"/utf8>>),
			[{name, RoleId1, Name1},
			 {string, godwar_score, maps:get(min_lev, GroupData)},
			 {string, godwar_score, maps:get(max_lev, GroupData)},
			 {string, godwar_score, get(zone)},
			 {string, red, maps:get(name, GroupData)}]),
	  send(all, all, broadcast_and_top, Msg5);
      _ -> pass
    end;
combat_notice(_R, _Ext) -> ok.

reward() ->
    Score1 = get({score, 1}),
    Score2 = get({score, 2}),
    Ret = if Score1 > Score2 -> 1;
	     Score1 < Score2 -> 2;
	     true -> 0
	  end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone908, _,
       {__Levelzs_war_zone908, __Traceszs_war_zone908}}
	  when __Levelzs_war_zone908 band 64 /= 0 orelse
		 __Traceszs_war_zone908 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_zone}, {function, reward}, {line, 908},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("众神战结果:group:~w zone:~w score_a:~w score_b:~w "
				     "ret=~w",
				     [get(group), get(zone), Score1, Score2,
				      Ret]),
		       none, 4096, 64, __Levelzs_war_zone908,
		       __Traceszs_war_zone908, lager_event,
		       __Pidzs_war_zone908);
      _ -> ok
    end,
    RL = util:keys_sort([#zs_war_role.win_best,
			 #zs_war_role.win_acc, #zs_war_role.score],
			get(role_list)),
    send_reward(RL, Ret, 1),
    send(all, all, 21415, {Ret, RL}),
    #{name := GroupName} =
	zs_war_data:group_data(get(group)),
    RL3 = [{name, RoleId, Name}
	   || #zs_war_role{id = RoleId, name = Name}
		  <- lists:sublist(RL, 3)],
    Msg =
	color:msg(lang:get(<<"众神战场活动结束，恭喜~ts获得~ts第~ts战场前~ts名。"/utf8>>),
		  [{list, RL3}, {red, GroupName}, {binary, get(zone)},
		   {binary, length(RL3)}]),
    notice:broadcast(world, undefined, rumor, Msg),
    ok.

send_reward([], _Ret, _Rank) -> ok;
send_reward([#zs_war_role{id = RoleId, name = Name,
			  camp = Camp, win_acc = WinAcc, lose_acc = LoseAcc,
			  win_best = WinBest, score = Score, is_robot = 0}
	     | T],
	    Ret, Rank) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_zone920, _,
       {__Levelzs_war_zone920, __Traceszs_war_zone920}}
	  when __Levelzs_war_zone920 band 64 /= 0 orelse
		 __Traceszs_war_zone920 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_zone}, {function, send_reward},
			{line, 920}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]信息group:~w zone:~w camp:~w rank:~w "
				     "score:~w win_acc:~w win_best:~w lose_acc:~w",
				     [Name, get(group), get(zone), Camp, Rank,
				      Score, WinAcc, WinBest, LoseAcc]),
		       none, 4096, 64, __Levelzs_war_zone920,
		       __Traceszs_war_zone920, lager_event,
		       __Pidzs_war_zone920);
      _ -> ok
    end,
    Data = zs_war_data:rank_items({get(group), Rank}),
    ScoreRatio = maps:get(ratio, Data, 100),
    RankItems0 = maps:get(items, Data, []),
    AssetsVal = round(Score * ScoreRatio / 1000),
    RankItems = [{zs_war_data:get_const(reward_type),
		  AssetsVal}
		 | RankItems0],
    mail:send(RoleId,
	      {lang:get(<<"众神战场个人奖励"/utf8>>),
	       util:fbin(lang:get(<<"hân ái nhẫn giả：\n Chúc mừng ngài tại "
				    "lần này bên trong chúng thần trong chiến "
				    "trường thu được thứ ~w Tên điểm tích "
				    "lũy xếp hạng thành tích, lần sau tiếp "
				    "tục cố lên đâu \n Đây là ngài ban thưởng, "
				    "xin chú ý kiểm tra và nhận a"/utf8>>),
			 [Rank]),
	       [], RankItems, <<"众神之战"/utf8>>}),
    GroupData = zs_war_data:group_data(get(group)),
    case Ret of
      0 ->
	  mail:send(RoleId,
		    {lang:get(<<"Chiến trường"/utf8>>),
		     util:fbin(lang:get(<<"Thân ái nhẫn giả: \n Tại chúng thần "
					  "chiến trường trong hoạt động, ngài chỗ "
					  "~ts Trận doanh cùng đối phương trận "
					  "doanh đánh thành ngang tay, lần sau "
					  "thêm ít sức mạnh a,\n Đây là ngài tại "
					  "chúng thần chiến trường trong hoạt động "
					  "thu hoạch được ban thưởng, xin chú ý "
					  "kiểm tra và nhận a"/utf8>>),
			       [camp_name(Camp)]),
		     [], maps:get(draw_items, GroupData, []),
		     <<"众神之战"/utf8>>});
      Camp ->
	  mail:send(RoleId,
		    {lang:get(<<"Chiến trường"/utf8>>),
		     util:fbin(lang:get(<<"hân ái nhẫn giả：\n Tại chúng thần chiến "
					  "trường trong hoạt động, chúc mừng ngài "
					  "chỗ ~ts Trận doanh thu được thắng lợi "
					  "\n Đây là ngài tại chúng thần chiến "
					  "trường trong hoạt động thu hoạch được "
					  "ban thưởng, xin chú ý kiểm tra và nhận "
					  "a"/utf8>>),
			       [camp_name(Camp)]),
		     [], maps:get(win_items, GroupData, []),
		     <<"众神之战"/utf8>>});
      _ ->
	  mail:send(RoleId,
		    {lang:get(<<"Chiến trường"/utf8>>),
		     util:fbin(lang:get(<<"hân ái nhẫn giả：\n Đây là ngài tại chúng "
					  "thần chiến trường trong hoạt động thu "
					  "hoạch được ban thưởng, xin chú ý kiểm "
					  "tra và nhận a"/utf8>>),
			       []),
		     [], maps:get(lose_items, GroupData, []),
		     <<"众神之战"/utf8>>})
    end,
    send_reward(T, Ret, Rank + 1);
send_reward([_ | T], Ret, Rank) ->
    send_reward(T, Ret, Rank + 1).


