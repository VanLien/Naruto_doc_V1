-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      1).

-module(holiday_practise_tower_lib).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{activity, [id, status, name, data, ext_args]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
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
		{holiday_practise_tower_rank,
		 [ver, platform_zone, camp_id, rank_list, old_rank_list,
		  ext]},
		{practise_role_rank,
		 [ver, id, lev, face_id, avatar_bid, name, val, unixtime,
		  power, rank, video_id, face_update_time, face_file,
		  ext]},
		{m_holiday_practise_tower,
		 [ver, camp_id, id, times, last_buy_times,
		  last_anew_times, update_unixtime, hp_radio, is_combat,
		  is_recombat, save_list, ext]},
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]},
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
		  p_eqm, p_home]}]).

-export([zero_flush/1, push/2, push/3, combat/5,
	 combat_over/4, init/0, reset/1, buy_time/1,
	 gm_reset_time/1, gm_set_id/2, log/2, zero_flush_log/1]).

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

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      22).

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

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      23).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      24).

-file("inc/holiday_practise_tower.hrl", 1).

-record(m_holiday_practise_tower,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), id = 0  :: pos_integer(),
	 times = 0  :: pos_integer(),
	 last_buy_times = 0  :: pos_integer(),
	 last_anew_times = 0  :: pos_integer(),
	 update_unixtime = 0  :: pos_integer(),
	 hp_radio = []  :: list(),
	 is_combat = {0, []}  :: tuple(),
	 is_recombat = 0  :: list(), save_list = []  :: list(),
	 ext = []  :: list()}).

-record(practise_role_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), val = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 power = 0  :: pos_integer(), rank = 0  :: pos_integer(),
	 video_id = 0  :: pos_integer(),
	 face_update_time = 0  :: pos_integer(),
	 face_file = <<>>  :: string(), ext = []  :: list()}).

-record(holiday_practise_tower_rank,
	{ver = 1  :: pos_integer(),
	 platform_zone = {<<>>, 0}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 rank_list = []  :: list(),
	 old_rank_list = []  :: list(), ext = []  :: list()}).

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      25).

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

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      26).

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

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      27).

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

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      28).

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

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      29).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      30).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      31).

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

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      32).

-file("inc/gain.hrl", 1).

-record(gain,
	{label  :: atom(), val  :: term(),
	 msg = <<>>  :: bitstring(), flag  :: atom(),
	 reason  :: atom(), ext = 0  :: term(),
	 notice = 0  :: 0..1,
	 move_to = 0  :: non_neg_integer()}).

-record(loss,
	{label  :: atom(), val  :: term(),
	 own_val = 0  :: term(), msg = <<>>  :: bitstring(),
	 flag  :: atom(), reason  :: atom(),
	 ext = 0  :: term()}).

-record(gain_loss_opts,
	{title = <<>>, return_gl = [], is_continue = false,
	 order = loss  :: gain | loss,
	 gain_tag = <<>>  :: binary(),
	 loss_tag = <<>>  :: binary(),
	 split_str = <<"，"/utf8>>  :: binary(),
	 split_op_str = <<"，"/utf8>>  :: binary(),
	 type = 2  :: non_neg_integer(),
	 is_auto_buy = 0  :: 0..1,
	 need_notify_fail_item = false  :: true | false,
	 log_name = <<"市场"/utf8>>  :: true | false}).

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_lib.erl",
      33).

gm_reset_time(Role = #role{m_holiday_practise_tower =
			       MHPractiseTower =
				   #m_holiday_practise_tower{last_buy_times =
								 OldLastBuyTime}}) ->
    FreeTime =
	holiday_practise_tower_data:get_const(holiday_practise_tower_free_time),
    BuyTime =
	holiday_practise_tower_data:get_const(holiday_practise_tower_buy_time),
    MaxBuyTime =
	holiday_practise_tower_data:get_const(holiday_practise_tower_max_buy_time),
    RestTime =
	holiday_practise_tower_data:get_const(holiday_practise_tower_reset_time),
    NewMHPractiseTower =
	MHPractiseTower#m_holiday_practise_tower{times =
						     FreeTime,
						 last_buy_times =
						     min(OldLastBuyTime +
							   BuyTime,
							 MaxBuyTime),
						 last_anew_times = RestTime},
    NewRole = Role#role{m_holiday_practise_tower =
			    NewMHPractiseTower},
    NewRole.

gm_set_id(Role = #role{m_holiday_practise_tower =
			   MHPractiseTower},
	  Id) ->
    NewMHPractiseTower =
	MHPractiseTower#m_holiday_practise_tower{id = Id,
						 hp_radio = []},
    NewRole = Role#role{m_holiday_practise_tower =
			    NewMHPractiseTower},
    push(NewRole, 29100),
    NewRole.

init() -> #m_holiday_practise_tower{}.

-spec zero_flush_log(#role{}) -> {ok, #role{}}.

zero_flush_log(Role = #role{m_holiday_practise_tower =
				#m_holiday_practise_tower{id = Id,
							  camp_id = CampId}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3053, 93053, 993053])
	of
      #holiday{camp_id = CampId} ->
	  WorldLev = util:fbin("~w", [world_lev:get_world_lev()]),
	  Type = <<"英灵武神殿层数"/utf8>>,
	  log:save(role_power_info, {Role, Type, Id, WorldLev});
      _ -> ok
    end,
    {ok, Role}.

push(Role = #role{id = RoleId,
		  m_holiday_practise_tower =
		      #m_holiday_practise_tower{camp_id = RoleCampId, id = Id,
						times = Time,
						last_buy_times = LastBuyTime,
						hp_radio = HpRadio,
						is_recombat = IsReCombat}},
     Code = 29100) ->
    case holiday_lib:get_open_holiday(Role,
				      [3053, 93053, 993053])
	of
      #holiday{camp_id = RoleCampId, end_time = EndTime} ->
	  LastUnixTime = max(0, EndTime - 86400),
	  Radio1 = case HpRadio of
		     [{_, Radio} | _] -> Radio;
		     _ -> 100
		   end,
	  {RankList3, RoleRank2} = case
				     holiday_practise_tower_mgr:get_practise_tower_rank()
				       of
				     RankList when is_list(RankList) ->
					 RankList1 = util:keys_sort([{asc,
								      #practise_role_rank.rank}],
								    RankList),
					 RankList2 = lists:sublist(RankList1,
								   3),
					 RoleRank1 = case lists:keyfind(RoleId,
									#practise_role_rank.id,
									RankList)
							 of
						       #practise_role_rank{rank
									       =
									       RoleRank} ->
							   RoleRank;
						       _ -> 0
						     end,
					 {RankList2, RoleRank1};
				     _ -> {[], 0}
				   end,
	  sys_conn:pack_send(Code,
			     {1, Id, Time, LastBuyTime, Radio1, LastUnixTime,
			      RankList3, RoleRank2, IsReCombat});
      _ ->
	  sys_conn:pack_send(Code, {0, 0, 0, 0, 0, 0, [], 0, 0})
    end,
    ok;
push(Role = #role{id = RoleId,
		  m_holiday_practise_tower =
		      #m_holiday_practise_tower{camp_id = RoleCampId,
						id = Id}},
     Code = 29105) ->
    case holiday_lib:get_open_holiday(Role,
				      [3053, 93053, 993053])
	of
      #holiday{camp_id = RoleCampId} ->
	  {RoleRank1, Val1, UnixTime1, VideoId1, RankList1} = case
								holiday_practise_tower_mgr:get_practise_tower_rank()
								  of
								RankList
								    when
								      is_list(RankList) ->
								    case
								      lists:keyfind(RoleId,
										    #practise_role_rank.id,
										    RankList)
									of
								      #practise_role_rank{rank
											      =
											      RoleRank,
											  val
											      =
											      Val,
											  unixtime
											      =
											      UnixTime,
											  video_id
											      =
											      VideoId} ->
									  {RoleRank,
									   Val,
									   UnixTime,
									   VideoId,
									   RankList};
								      _ ->
									  {0,
									   Id,
									   0, 0,
									   RankList}
								    end;
								_ ->
								    {0, 0, 0, 0,
								     []}
							      end,
	  sys_conn:pack_send(Code,
			     {1, RankList1, RoleRank1, Val1, UnixTime1,
			      VideoId1});
      _ -> sys_conn:pack_send(Code, {0, [], 0, 0, 0, 0})
    end,
    ok;
push(_, Code) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_practise_tower_lib127, _,
       {__Levelholiday_practise_tower_lib127,
	__Tracesholiday_practise_tower_lib127}}
	  when __Levelholiday_practise_tower_lib127 band 8 /= 0
		 orelse __Tracesholiday_practise_tower_lib127 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_practise_tower_lib}, {function, push},
			{line, 127}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("英灵武神殿协议请求错误，协议号:~w", [Code]), none, 4096,
		       8, __Levelholiday_practise_tower_lib127,
		       __Tracesholiday_practise_tower_lib127, lager_event,
		       __Pidholiday_practise_tower_lib127);
      _ -> ok
    end,
    ok.

push(_Role, Code = 29102, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(_Role, Code = 29106, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(#role{}, Code, _Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_practise_tower_lib138, _,
       {__Levelholiday_practise_tower_lib138,
	__Tracesholiday_practise_tower_lib138}}
	  when __Levelholiday_practise_tower_lib138 band 8 /= 0
		 orelse __Tracesholiday_practise_tower_lib138 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_practise_tower_lib}, {function, push},
			{line, 138}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("英灵武神殿协议请求错误，协议号:~w", [Code]), none, 4096,
		       8, __Levelholiday_practise_tower_lib138,
		       __Tracesholiday_practise_tower_lib138, lager_event,
		       __Pidholiday_practise_tower_lib138);
      _ -> ok
    end,
    ok.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_holiday_practise_tower =
			    MHPractiseTower = #m_holiday_practise_tower{camp_id
									    =
									    RoleCampId,
									id =
									    OldId,
									times =
									    OldTime,
									update_unixtime
									    =
									    UpdateUnixTime,
									last_buy_times
									    =
									    OldLastBuyTime,
									hp_radio
									    =
									    HpRadio,
									last_anew_times
									    =
									    OldLastAnewTime,
									is_combat
									    =
									    IsCombat,
									is_recombat
									    =
									    IsReCombat}}) ->
    FreeTime =
	holiday_practise_tower_data:get_const(holiday_practise_tower_free_time),
    BuyTime =
	holiday_practise_tower_data:get_const(holiday_practise_tower_buy_time),
    MaxBuyTime =
	holiday_practise_tower_data:get_const(holiday_practise_tower_max_buy_time),
    RestTime =
	holiday_practise_tower_data:get_const(holiday_practise_tower_reset_time),
    Now = date:unixtime(),
    NewRole = case holiday_lib:get_open_holiday(Role,
						[3053, 93053, 993053])
		  of
		#holiday{camp_id = RoleCampId} ->
		    NewMHPractiseTower = case date:day_diff(Now,
							    UpdateUnixTime)
					     of
					   DiffDay when DiffDay > 0 ->
					       MHPractiseTower1 =
						   MHPractiseTower#m_holiday_practise_tower{times
												=
												FreeTime,
											    last_buy_times
												=
												min(OldLastBuyTime
												      +
												      BuyTime
													*
													DiffDay,
												    MaxBuyTime),
											    last_anew_times
												=
												RestTime,
											    update_unixtime
												=
												Now},
					       MHPractiseTower1;
					   _ -> MHPractiseTower
					 end,
		    Role#role{m_holiday_practise_tower =
				  NewMHPractiseTower};
		#holiday{camp_id = NewCampId} ->
		    NewMHPractiseTower =
			MHPractiseTower#m_holiday_practise_tower{camp_id =
								     NewCampId,
								 id = 0,
								 times =
								     FreeTime,
								 last_buy_times
								     = BuyTime,
								 last_anew_times
								     = RestTime,
								 update_unixtime
								     = Now,
								 hp_radio = [],
								 is_combat =
								     {0, []},
								 is_recombat =
								     0},
		    Role#role{m_holiday_practise_tower =
				  NewMHPractiseTower};
		_ when RoleCampId > 0 ->
		    NewMHPractiseTower =
			MHPractiseTower#m_holiday_practise_tower{camp_id = 0,
								 id = 0,
								 times = 0,
								 last_buy_times
								     = 0,
								 last_anew_times
								     = 0,
								 update_unixtime
								     = 0,
								 hp_radio = [],
								 is_combat =
								     {0, []},
								 is_recombat =
								     0,
								 save_list =
								     [RoleCampId,
								      OldId,
								      OldTime,
								      OldLastBuyTime,
								      OldLastAnewTime,
								      UpdateUnixTime,
								      HpRadio,
								      IsCombat,
								      IsReCombat]},
		    Role#role{m_holiday_practise_tower =
				  NewMHPractiseTower};
		_ -> Role
	      end,
    push(NewRole, 29100),
    {ok, NewRole}.

-spec combat(#role{}, pos_integer(), pos_integer(),
	     list(), pos_integer()) -> {ok, #role{}} |
				       {false, string()}.

combat(Role = #role{ui_combat_type = UICombatType,
		    m_holiday_practise_tower =
			MHPractiseTower = #m_holiday_practise_tower{times =
									OldTime,
								    camp_id =
									CampId,
								    is_recombat
									=
									IsReCombat}},
       Id, FormationType, PosInfo, HallowId) ->
    case check_cond([id, holiday, time, formation, defend,
		     atk_group],
		    Role,
		    #{id => Id, formation => FormationType,
		      pos_info => PosInfo, hallows_id => HallowId})
	of
      {ok, DefendList, BFormationType, BFormationLev, TarName,
       AtkGroup0} ->
	  CombatType = 43,
	  FormationLev = formation_lib:get_formation_lev(Role,
							 FormationType),
	  AtkGroup = sprite_tree:gen_fight_object_type(Role, 39)
		       ++
		       hallows_lib:gen_fight_object(Role, HallowId) ++
			 AtkGroup0,
	  {ok, CRole0} = role_convert:do(combat_role, Role),
	  CRole = case UICombatType == 43 of
		    true -> CRole0;
		    _ ->
			CRole0#combat_role{auto_watch_model = 1, watching = 0,
					   is_auto = true, is_offline = true,
					   conn_pid = 0}
		  end,
	  Args = #{on_role_combat_end =>
		       {holiday_practise_tower_lib, combat_over,
			[{Id, CampId, IsReCombat}]},
		   ext_args => [{is_show_panel, false}],
		   formation =>
		       [{1, FormationType, FormationLev},
			{2, BFormationType, BFormationLev}],
		   target_role_name => TarName, combat_role => CRole},
	  case combat_lib:start_combat(Role, CombatType, AtkGroup,
				       [DefendList], Args)
	      of
	    {ok, _CombatPid} ->
		NewTime = case IsReCombat =:= 1 of
			    true -> OldTime;
			    _ -> max(0, OldTime - 1)
			  end,
		NewMHPractiseTower =
		    MHPractiseTower#m_holiday_practise_tower{times =
								 NewTime,
							     is_combat =
								 {0, []},
							     is_recombat = 0},
		Role1 = Role#role{m_holiday_practise_tower =
				      NewMHPractiseTower},
		push(Role1, 29100),
		holiday:push_bid_can_reward(Role1, 93053),
		Role2 = log_combat(Role1, [first_combat, combat],
				   #{is_combat => IsReCombat, id => Id}),
		case formation:set_sys_formation(Role2, 39,
						 FormationType, PosInfo,
						 HallowId)
		    of
		  {ok, NewRole} -> {ok, NewRole};
		  _ -> {ok, Role2}
		end;
	    {false, Msg} -> {false, Msg};
	    _ -> {false, lang:get(<<"无法发起战斗"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}}.

combat_over(Role = #role{id = RoleId, lev = RoleLev,
			 face_id = FaceId,
			 m_avatar = #m_avatar{used = AvatarBid}, power = Power,
			 name = Name,
			 partner_bag = #partner_bag{partner_list = PartnerList},
			 m_holiday_practise_tower =
			     MHPractiseTower = #m_holiday_practise_tower{camp_id
									     =
									     CampId,
									 last_anew_times
									     =
									     LastAnewTime}},
	    #combat_result{replay_id = ReplayId, total_hurt = Dps,
			   result = 1, hurt_statistics_a = PartnerDpsList,
			   hurt_statistics = HurtStatistics,
			   a_stat_info = ARemainHp},
	    #combat{target_role_name = TargetName},
	    {Id, OldCampId, IsReCombat}) ->
    BestPartnerId = case lists:reverse(lists:keysort(2,
						     PartnerDpsList))
			of
		      [{BestPartnerIdTemp, _} | _] -> BestPartnerIdTemp;
		      _ -> 0
		    end,
    {BestPartnerId1, Bid1, Lev1, Star1, UseSkin1} = case
						      lists:keyfind(BestPartnerId,
								    #partner.id,
								    PartnerList)
							of
						      #partner{bid = Bid,
							       lev = Lev,
							       star = Star,
							       use_skin =
								   UseSkin} ->
							  {BestPartnerId, Bid,
							   Lev, Star, UseSkin};
						      _ ->
							  {BestPartnerId, 0, 0,
							   0, 0}
						    end,
    log_combat_over(Role, [win],
		    #{is_combat => IsReCombat, id => Id,
		      a_stat_info => ARemainHp}),
    case holiday_practise_tower_data:get_reward(Id) of
      Reward when is_list(Reward) ->
	  push(Role, 29102,
	       {1, Dps, BestPartnerId1, Bid1, Lev1, Star1, UseSkin1,
		TargetName, HurtStatistics, Reward, LastAnewTime, Id}),
	  Gain = format:val_to_gain(Reward,
				    holiday_practise_tower),
	  case role_gain:do(Role, Gain) of
	    {ok, GainRole} ->
		log:log_gain(Gain, Role, GainRole, <<"武神殿"/utf8>>,
			     util:fbin(<<"武神殿_通关奖励 关数:~w"/utf8>>, [Id])),
		case OldCampId =:= CampId of
		  true ->
		      {_, FaceFile, FaceUpdateTime} =
			  role_face:face_info(Role),
		      PractiseRank = #practise_role_rank{id = RoleId,
							 lev = RoleLev,
							 face_id = FaceId,
							 avatar_bid = AvatarBid,
							 name = Name, val = Id,
							 unixtime =
							     date:unixtime(),
							 power = Power,
							 face_update_time =
							     FaceUpdateTime,
							 face_file = FaceFile,
							 video_id = ReplayId},
		      holiday_practise_tower_mgr:info({in_rank,
						       PractiseRank}),
		      NewMHPractiseTower =
			  MHPractiseTower#m_holiday_practise_tower{id = Id,
								   hp_radio =
								       []},
		      NewRole = GainRole#role{m_holiday_practise_tower =
						  NewMHPractiseTower},
		      push(NewRole, 29100),
		      {ok, NewRole};
		  _ -> {ok, GainRole}
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
		  {__Pidholiday_practise_tower_lib298, _,
		   {__Levelholiday_practise_tower_lib298,
		    __Tracesholiday_practise_tower_lib298}}
		      when __Levelholiday_practise_tower_lib298 band 8 /= 0
			     orelse
			     __Tracesholiday_practise_tower_lib298 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_practise_tower_lib},
				    {function, combat_over}, {line, 298},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("英灵武神殿奖励失败玩家:~ts id:~w, 关卡数id:~w",
						 [Role#role.name, Role#role.id,
						  Id]),
				   none, 4096, 8,
				   __Levelholiday_practise_tower_lib298,
				   __Tracesholiday_practise_tower_lib298,
				   lager_event,
				   __Pidholiday_practise_tower_lib298);
		  _ -> ok
		end,
		{ok, Role}
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
	    {__Pidholiday_practise_tower_lib302, _,
	     {__Levelholiday_practise_tower_lib302,
	      __Tracesholiday_practise_tower_lib302}}
		when __Levelholiday_practise_tower_lib302 band 8 /= 0
		       orelse __Tracesholiday_practise_tower_lib302 /= [] ->
		lager:do_log(error,
			     [{module, holiday_practise_tower_lib},
			      {function, combat_over}, {line, 302},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("英灵武神殿奖励失败玩家:~ts id:~w, 关卡数id:~w",
					   [Role#role.name, Role#role.id, Id]),
			     none, 4096, 8,
			     __Levelholiday_practise_tower_lib302,
			     __Tracesholiday_practise_tower_lib302, lager_event,
			     __Pidholiday_practise_tower_lib302);
	    _ -> ok
	  end,
	  {ok, Role}
    end;
combat_over(Role = #role{partner_bag =
			     #partner_bag{partner_list = PartnerList},
			 m_holiday_practise_tower =
			     MHPractiseTower = #m_holiday_practise_tower{camp_id
									     =
									     CampId,
									 hp_radio
									     =
									     HpRadio,
									 last_anew_times
									     =
									     LastAnewTime}},
	    #combat_result{total_hurt = Dps,
			   hurt_statistics_a = PartnerDpsList,
			   hurt_statistics = HurtStatistics,
			   b_stat_info = BRemainHp},
	    #combat{target_role_name = TargetName},
	    {Id, OldCampId, IsReCombat}) ->
    BestPartnerId = case lists:reverse(lists:keysort(2,
						     PartnerDpsList))
			of
		      [{BestPartnerIdTemp, _} | _] -> BestPartnerIdTemp;
		      _ -> 0
		    end,
    {BestPartnerId1, Bid1, Lev1, Star1, UseSkin1} = case
						      lists:keyfind(BestPartnerId,
								    #partner.id,
								    PartnerList)
							of
						      #partner{bid = Bid,
							       lev = Lev,
							       star = Star,
							       use_skin =
								   UseSkin} ->
							  {BestPartnerId, Bid,
							   Lev, Star, UseSkin};
						      _ ->
							  {BestPartnerId, 0, 0,
							   0, 0}
						    end,
    push(Role, 29102,
	 {0, Dps, BestPartnerId1, Bid1, Lev1, Star1, UseSkin1,
	  TargetName, HurtStatistics, [], LastAnewTime, Id}),
    log_combat_over(Role, [lose],
		    #{is_combat => IsReCombat, id => Id}),
    NewRole = case CampId =:= OldCampId of
		true ->
		    NewHpRadio = merge_hp(HpRadio, BRemainHp),
		    NewMHPractiseTower =
			MHPractiseTower#m_holiday_practise_tower{hp_radio =
								     NewHpRadio,
								 is_combat =
								     {1,
								      HpRadio}},
		    Role1 = Role#role{m_holiday_practise_tower =
					  NewMHPractiseTower},
		    Role1;
		_ -> Role
	      end,
    push(NewRole, 29100),
    {ok, NewRole}.

-spec reset(#role{}) -> {ok, #role{}} |
			{false, string()}.

reset(Role = #role{m_holiday_practise_tower =
		       MHPractiseTower =
			   #m_holiday_practise_tower{last_anew_times =
							 OldAnewTime}}) ->
    case check_reset_cond([holiday, time, flag], Role, #{})
	of
      {ok, HpRadio} ->
	  NewMHPractiseTower =
	      MHPractiseTower#m_holiday_practise_tower{is_combat =
							   {0, []},
						       hp_radio = HpRadio,
						       last_anew_times =
							   max(0,
							       OldAnewTime - 1),
						       is_recombat = 1},
	  NewRole = Role#role{m_holiday_practise_tower =
				  NewMHPractiseTower},
	  push(NewRole, 29100),
	  {ok, NewRole};
      {false, Reason} -> {false, Reason}
    end.

-spec buy_time(#role{}) -> {ok, #role{}} |
			   {false, string()}.

buy_time(Role) ->
    case check_buy_cond([holiday, time], Role, #{}) of
      {ok, Loss} ->
	  NewLossList = format:val_to_loss(Loss,
					   holiday_practise_tower),
	  case role_gain:do(Role, NewLossList) of
	    {ok,
	     LossRole = #role{m_holiday_practise_tower =
				  MHPractiseTower =
				      #m_holiday_practise_tower{last_buy_times =
								    OldLastBuyTime,
								times =
								    OldTime}}} ->
		NewMHValentineBoss =
		    MHPractiseTower#m_holiday_practise_tower{last_buy_times
								 =
								 max(0,
								     OldLastBuyTime
								       - 1),
							     times =
								 OldTime + 1},
		NewRole = LossRole#role{m_holiday_practise_tower =
					    NewMHValentineBoss},
		log:log_gain(NewLossList, Role, NewRole, <<"武神殿"/utf8>>,
			     <<"武神殿_购买挑战次数"/utf8>>),
		push(NewRole, 29100),
		holiday:push_bid_can_reward(NewRole, 93053),
		{ok, NewRole};
	    _ -> {false, lang:get(<<""/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

log(Role, 1) ->
    LogList = var:get_var(Role, day, 160, []),
    case lists:member(1, LogList) of
      true -> Role;
      _ ->
	  log:save(join,
		   {Role, <<"英灵武神殿"/utf8>>, <<"进入活动界面"/utf8>>}),
	  NewRole = var:set_var(Role, day, 160, [1 | LogList]),
	  NewRole
    end;
log(Role, 2) ->
    LogList = var:get_var(Role, day, 160, []),
    case lists:member(2, LogList) of
      true -> Role;
      _ ->
	  log:save(join,
		   {Role, <<"英灵武神殿"/utf8>>, <<"进入爬塔界面"/utf8>>}),
	  NewRole = var:set_var(Role, day, 160, [2 | LogList]),
	  NewRole
    end;
log(Role, _Type) -> Role.

check_cond([], _Role,
	   _Arg = #{defendlist := DefendList,
		    b_formation_type := BFormationType,
		    b_formation_lev := BFormationLev, tarname := TarName,
		    atk_group := AtkGroup}) ->
    {ok, DefendList, BFormationType, BFormationLev, TarName,
     AtkGroup};
check_cond([id | Rest],
	   Role = #role{m_holiday_practise_tower =
			    #m_holiday_practise_tower{id = RoleId}},
	   Arg = #{id := Id}) ->
    case RoleId + 1 =:= Id of
      true -> check_cond(Rest, Role, Arg);
      _ -> {false, lang:get(<<"当前不能挑战此boss"/utf8>>)}
    end;
check_cond([holiday | Rest],
	   Role = #role{m_holiday_practise_tower =
			    #m_holiday_practise_tower{camp_id = CampId}},
	   Arg) ->
    case holiday_lib:get_open_holiday(Role,
				      [3053, 93053, 993053])
	of
      #holiday{camp_id = CampId, end_time = EndTime} ->
	  Now = date:unixtime(),
	  case EndTime - Now > 86400 of
	    true -> check_cond(Rest, Role, Arg);
	    _ -> {false, lang:get(<<"当前不在挑战时间"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"当前不在活动期间"/utf8>>)}
    end;
check_cond([time | Rest],
	   Role = #role{m_holiday_practise_tower =
			    #m_holiday_practise_tower{times = Times,
						      is_recombat = IsCombat}},
	   Arg) ->
    case IsCombat of
      1 -> check_cond(Rest, Role, Arg);
      _ ->
	  case Times > 0 of
	    true -> check_cond(Rest, Role, Arg);
	    _ -> {false, lang:get(<<"挑战次数不足"/utf8>>)}
	  end
    end;
check_cond([formation | Rest], Role,
	   Arg = #{formation := FormationType, pos_info := PosInfo,
		   hallows_id := HallowsId}) ->
    case formation:check_formation_pos_info(Role,
					    FormationType, PosInfo, HallowsId,
					    39)
	of
      {false, Reason} -> {false, Reason};
      {ok, []} -> {false, lang:get(<<"至少需要上阵一个英雄"/utf8>>)};
      {ok, _NewPosInfo} -> check_cond(Rest, Role, Arg)
    end;
check_cond([defend | Rest],
	   Role = #role{m_holiday_practise_tower =
			    #m_holiday_practise_tower{hp_radio = HpRadio}},
	   Arg = #{id := Id}) ->
    case holiday_practise_tower_data:get_boss_id(Id) of
      BossId when is_integer(BossId) ->
	  #unit_data{formation = {BFormationType, BFormationLev},
		     name = TarName} =
	      unit_data:get(BossId),
	  WorldLev = world_lev:get_world_lev(),
	  case unit_monster:gen_fight_objects(WorldLev, BossId) of
	    [] -> {false, lang:get(<<"怪物配置有问题"/utf8>>)};
	    [DefendList | _] ->
		Fun = fun (F = #fight_object{pos = Pos, hp_max = HpMax},
			   Acc) ->
			      NewPos = Pos + 9,
			      case lists:keyfind(NewPos, 1, HpRadio) of
				{NewPos, Radio} ->
				    NewF = F#fight_object{hp =
							      round(Radio *
								      HpMax
								      / 100)},
				    [NewF | Acc];
				_ -> [F | Acc]
			      end
		      end,
		NewDefendList = lists:foldl(Fun, [], DefendList),
		check_cond(Rest, Role,
			   Arg#{defendlist => NewDefendList,
				b_formation_type => BFormationType,
				b_formation_lev => BFormationLev,
				tarname => TarName});
	    _ -> {false, lang:get(<<"怪物配置有问题"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"已达到最大通关数"/utf8>>)}
    end;
check_cond([atk_group | Rest], Role,
	   Arg = #{formation := FormationType, pos_info := PosInfo,
		   id := Id}) ->
    FightPos = formation_lib:gen_fight_pos(PosInfo,
					   FormationType),
    AtkGroup0 = combat_lib:gen_fight_objects(Role,
					     FightPos),
    AllPower = lists:sum([Power
			  || #fight_object{power = Power} <- AtkGroup0]),
    NewAtkGroup = case
		    holiday_practise_tower_data:get_buff_ext(Id)
		      of
		    {Power, AttrExt, AttrBids} when AllPower >= Power ->
			AtkGroup1 = add_attr(AtkGroup0, AttrExt, AttrBids, []),
			AtkGroup1;
		    _ -> AtkGroup0
		  end,
    check_cond(Rest, Role, Arg#{atk_group => NewAtkGroup});
check_cond(_Rest, _Role, _Args) ->
    {false, lang:get(<<"战斗参数错误"/utf8>>)}.

add_attr([], _AttrExt, _AttrBids, AtkGroup) -> AtkGroup;
add_attr([F = #fight_object{object_bid = Bid} | Rest],
	 AttrExt, AttrBids, AtkGroup) ->
    case lists:member(Bid, AttrBids) of
      true ->
	  F1 = combat_lib:add_base_attr(F, AttrExt),
	  add_attr(Rest, AttrExt, AttrBids, [F1 | AtkGroup]);
      _ -> add_attr(Rest, AttrExt, AttrBids, [F | AtkGroup])
    end.

merge_hp(HpRadio, []) -> HpRadio;
merge_hp(HpRadio,
	 [#{pos := Pos, is_boss := true, hp := Hp,
	    hp_max := HpMax}
	  | T]) ->
    merge_hp(lists:keystore(Pos, 1, HpRadio,
			    {Pos, util:ceil(Hp * 100 / HpMax)}),
	     T);
merge_hp(HpRadio, [_ | T]) -> merge_hp(HpRadio, T);
merge_hp(HpRadio, _) -> HpRadio.

check_reset_cond([], _Role, #{hp_radio := HpRadio}) ->
    {ok, HpRadio};
check_reset_cond([holiday | Rest],
		 Role = #role{m_holiday_practise_tower =
				  #m_holiday_practise_tower{camp_id = CampId}},
		 Arg) ->
    case holiday_lib:get_open_holiday(Role,
				      [3053, 93053, 993053])
	of
      #holiday{camp_id = CampId} ->
	  check_reset_cond(Rest, Role, Arg);
      _ -> {false, lang:get(<<"当前不在活动期间"/utf8>>)}
    end;
check_reset_cond([time | Rest],
		 Role = #role{m_holiday_practise_tower =
				  #m_holiday_practise_tower{last_anew_times =
								Time}},
		 Arg) ->
    case Time > 0 of
      true -> check_reset_cond(Rest, Role, Arg);
      _ -> {false, lang:get(<<"没有重置挑战的次数了"/utf8>>)}
    end;
check_reset_cond([flag | Rest],
		 Role = #role{m_holiday_practise_tower =
				  #m_holiday_practise_tower{is_combat =
								IsCombat}},
		 Arg) ->
    case IsCombat of
      {1, HpRadio} ->
	  check_reset_cond(Rest, Role, Arg#{hp_radio => HpRadio});
      _ -> {false, lang:get(<<"当前不可以重置"/utf8>>)}
    end;
check_reset_cond(_Rest, _Role, _Args) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

check_buy_cond([], _Role, #{loss := Loss}) ->
    {ok, Loss};
check_buy_cond([holiday | Rest],
	       Role = #role{m_holiday_practise_tower =
				#m_holiday_practise_tower{camp_id = CampId}},
	       Arg) ->
    case holiday_lib:get_open_holiday(Role,
				      [3053, 93053, 993053])
	of
      #holiday{camp_id = CampId, end_time = EndTime} ->
	  Now = date:unixtime(),
	  case EndTime - Now > 86400 of
	    true -> check_buy_cond(Rest, Role, Arg);
	    _ -> {false, lang:get(<<"当前不在挑战期间"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"当前不在活动期间"/utf8>>)}
    end;
check_buy_cond([time | Rest],
	       Role = #role{m_holiday_practise_tower =
				#m_holiday_practise_tower{times = Time,
							  last_buy_times =
							      BuyTime}},
	       Arg) ->
    FreeTime =
	holiday_practise_tower_data:get_const(holiday_practise_tower_free_time),
    case Time >= FreeTime of
      true -> {false, lang:get(<<"当前无需购买"/utf8>>)};
      _ ->
	  case BuyTime > 0 of
	    true ->
		check_buy_cond(Rest, Role,
			       Arg#{loss =>
					holiday_practise_tower_data:get_const(holiday_practise_tower_buy_loss)});
	    _ -> {false, lang:get(<<"已达到购买次数上限"/utf8>>)}
	  end
    end;
check_buy_cond(_Rest, _Role, _Arg) ->
    {false, lang:get(<<"购买参数错误"/utf8>>)}.

log_combat(Role, [], _Arg) -> Role;
log_combat(Role, [first_combat | Rest], Arg) ->
    LogList = var:get_var(Role, day, 160, []),
    case lists:member(3, LogList) of
      true -> log_combat(Role, Rest, Arg);
      _ ->
	  log:save(join,
		   {Role, <<"英灵武神殿"/utf8>>, <<"每日参与爬塔"/utf8>>}),
	  NewRole = var:set_var(Role, day, 160, [3 | LogList]),
	  log_combat(NewRole, Rest, Arg)
    end;
log_combat(Role = #role{power = Power}, [combat | Rest],
	   Arg = #{is_combat := IsReCombat, id := Id}) ->
    case IsReCombat of
      1 ->
	  log:save(join,
		   {Role, <<"英灵武神殿"/utf8>>,
		    util:fbin(<<"英灵武神殿~w层重新挑战"/utf8>>, [Id]), 1, Power});
      _ ->
	  log:save(task,
		   {Role, 0, Id, util:fbin(<<"英灵武神殿层数~w"/utf8>>, [Id]),
		    112, <<"英灵武神殿胜率"/utf8>>, <<"任务开始"/utf8>>}),
	  log:save(join,
		   {Role, <<"英灵武神殿"/utf8>>,
		    util:fbin(<<"英灵武神殿~w层挑战"/utf8>>, [Id]), 1, Power})
    end,
    log_combat(Role, Rest, Arg);
log_combat(Role, _, _Arg) -> Role.

log_combat_over(_Role, [], _Arg) -> ok;
log_combat_over(Role = #role{power = Power},
		[win | Rest],
		Arg = #{is_combat := IsReCombat, id := Id,
			a_stat_info := ARemainHp}) ->
    Fun = fun (#{object_name := Name}, AccMsg) ->
		  Msg = util:fbin("~ts ", [Name]),
		  <<AccMsg/binary, Msg/binary>>
	  end,
    LogInfo = lists:foldl(Fun, <<>>, ARemainHp),
    case IsReCombat of
      1 ->
	  log:save(task,
		   {Role, 1, Id, util:fbin(<<"英灵武神殿层数~w"/utf8>>, [Id]),
		    112, <<"英灵武神殿胜率"/utf8>>, <<"战斗胜利"/utf8>>}),
	  log:save(join,
		   {Role, <<"英灵武神殿"/utf8>>,
		    util:fbin(<<"英灵武神殿~w层通关"/utf8>>, [Id]), 1, Power,
		    LogInfo}),
	  log:save(join,
		   {Role, <<"英灵武神殿"/utf8>>,
		    util:fbin(<<"英灵武神殿~w层重新通关"/utf8>>, [Id]), 1, Power,
		    LogInfo});
      _ ->
	  log:save(task,
		   {Role, 1, Id, util:fbin(<<"英灵武神殿层数~w"/utf8>>, [Id]),
		    112, <<"英灵武神殿胜率"/utf8>>, <<"战斗胜利"/utf8>>}),
	  log:save(join,
		   {Role, <<"英灵武神殿"/utf8>>,
		    util:fbin(<<"英灵武神殿~w层通关"/utf8>>, [Id]), 1, Power,
		    LogInfo})
    end,
    log_combat_over(Role, Rest, Arg);
log_combat_over(Role, [lose | Rest],
		Arg = #{is_combat := IsReCombat, id := Id}) ->
    case IsReCombat of
      1 -> ok;
      _ ->
	  log:save(task,
		   {Role, 2, Id, util:fbin(<<"英灵武神殿层数~w"/utf8>>, [Id]),
		    112, <<"英灵武神殿胜率"/utf8>>, <<"战斗失败"/utf8>>})
    end,
    log_combat_over(Role, Rest, Arg);
log_combat_over(_Role, _, _Arg) -> ok.


