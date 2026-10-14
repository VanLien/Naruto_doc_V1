-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      1).

-module(holiday_camp_war_team).

-lager_records([{sprite_plan,
		 [ver, id, name, plan_sprites]},
		{team_sprite, [ver, team, plan_id, team_sprites]},
		{formation_sprite, [ver, type, team_list]},
		{m_sprite_tree,
		 [ver, lev, break_lev, all_attr, sprites, power,
		  max_power, formation_list, plan_list]},
		{sprite_hatch,
		 [ver, id, is_open, lev, do_id, need_point, do_point,
		  state, end_time, all_end_time]},
		{m_sprite_hatch,
		 [ver, list, day_privilege_mail, day_buy_list, handbook,
		  baodi_info]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{group_attr, [atk, hp_max, def, speed]},
		{partner_base_p,
		 [partner_id, bid, lev, star, star_step, quality,
		  break_lev, power, skills, add_star, is_lock, use_skin,
		  end_time, resonate_lev, resonate_break_lev,
		  star_step_list]},
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
		  max_star, partner_decomposes, partner_skins,
		  partner_library_award]},
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
		  resonate_break_lev, step_list, step_type_list]},
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
		{activity, [id, status, name, data, ext_args]},
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
		{holiday_camp_war_log_partner,
		 [pos, id, bid, lev, star, power, skin_id, resonate_lev,
		  hurt, be_hurt, curt, ext]},
		{holiday_camp_war_log_info,
		 [id, round, ret, time, a_id, a_name, a_power,
		  a_formation_type, a_order, a_end_hp, a_hallows_id,
		  a_hallows_look_id, a_sprite_lev, a_sprites, b_id,
		  b_name, b_power, b_formation_type, b_order, b_end_hp,
		  b_hallows_id, b_hallows_look_id, b_sprite_lev,
		  b_sprites, a_plist, b_plist, ext]},
		{holiday_camp_war_log_face,
		 [id, pos, is_leader, lev, name, face_id, avatar_bid,
		  face_file, face_update_time]},
		{holiday_camp_war_log,
		 [id, is_atk, atk_id, atk_name, atk_power, atk_face,
		  def_id, def_name, def_power, def_face, ret, win_count,
		  lose_count, replay_list, time]},
		{role_holiday_camp_war_log, [id, list]},
		{holiday_camp_war_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  resonate_lev, dower_skill, set_skill, attr, extra]},
		{holiday_camp_war_defense_role,
		 [id, name, face_id, power, avatar_bid, lev, pos,
		  is_leader, rank, score, face_update_time, face_file,
		  formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  hallows_refine, sprite_lev, sprite_breka_lev,
		  sprite_attr, sprites, ext, break_groups]},
		{holiday_camp_war_info,
		 [id, name, face_id, power, avatar_bid, lev, rank, score,
		  face_update_time, face_file, ext]},
		{holiday_camp_war_role,
		 [ver, id, camp_id, name, lev, face_id, avatar_bid,
		  power, camp_power, face_update_time, face_file, rank,
		  score, last_score, score_time, ext]},
		{holiday_camp_war_rank,
		 [rank, id, score, score_time, power]},
		{holiday_camp_war_camp_info,
		 [id, medal_score, score, score_time, member_num,
		  all_power, have_fort, can_combat_fort, vote_list,
		  old_fort_num, last_fort_num, old_medal_score,
		  last_medal_score, ext]},
		{holiday_camp_war_fort,
		 [id, a_score, b_score, unit_id, difficulty, belong, log,
		  state_log, a_up, b_up, ext]},
		{m_holiday_camp_war,
		 [ver, period, camp_id, old_data, last_camp, ref_count,
		  atk_defens, def_defens, end_time, is_enter, enter_flag,
		  vote_flag, first_flag, first_count, first_buy_count,
		  second_count, second_buy_count]},
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
		  m_holiday_arena_team, m_holiday_practise_tower,
		  m_holiday_camp_war, p_bag, p_eqm, p_home]}]).

-export([buy_count/1, match/1, ref_match/1,
	 match_over/2, auto_combat/1, match_confirm/1, combat/2,
	 do_next_combat/4, do_combat2/1, do_combat_over/3,
	 push_save_sys_formation/1, combat_pos_info_cache/2,
	 get_rank/4, apply_get_rank/2]).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      23).

-file("inc/role.hrl", 1).

-record(role,
	{ver = 79, id = {0, <<>>}, need_sync = 0,
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
	 m_holiday_arena_team, m_holiday_practise_tower,
	 m_holiday_camp_war, p_bag, p_eqm, p_home}).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      24).

-file("inc/holiday_camp_war.hrl", 1).

-record(m_holiday_camp_war,
	{ver = 1, period = 0, camp_id = 0, old_data = [],
	 last_camp = 0, ref_count = 0, atk_defens = [],
	 def_defens = [], end_time = 0, is_enter = 0,
	 enter_flag = 0, vote_flag = 0, first_flag = 0,
	 first_count = 0, first_buy_count = 0, second_count = 0,
	 second_buy_count = 0}).

-record(holiday_camp_war_fort,
	{id = {0, <<>>}, a_score = 0, b_score = 0, unit_id = 0,
	 difficulty = 0, belong = 0, log = [], state_log = [],
	 a_up = 0, b_up = 0, ext = []}).

-record(holiday_camp_war_camp_info,
	{id = {0, <<>>}, medal_score = 0, score = 0,
	 score_time = 0, member_num = 0, all_power = 0,
	 have_fort = [], can_combat_fort = [], vote_list = [],
	 old_fort_num = 0, last_fort_num = 0,
	 old_medal_score = 0, last_medal_score = 0, ext = []}).

-record(holiday_camp_war_rank,
	{rank = {0, 0, <<>>}, id = {0, <<>>}, score = 0,
	 score_time = 0, power = 0}).

-record(holiday_camp_war_role,
	{ver = 1, id = {{0, <<>>}, <<>>}, camp_id = 0,
	 name = <<>>, lev = 0, face_id = 0, avatar_bid = 0,
	 power = 0, camp_power = 0, face_update_time = 0,
	 face_file = <<>>, rank = 0, score = 0, last_score = 0,
	 score_time = 0, ext = []}).

-record(holiday_camp_war_info,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, rank = 0, score = 0,
	 face_update_time = 0, face_file = <<>>, ext = []}).

-record(holiday_camp_war_defense_role,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, pos = 1, is_leader = 1,
	 rank = 0, score = 0, face_update_time = 0,
	 face_file = <<>>, formation_type = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0,
	 partner_infos = [], hallows_look_id = 0,
	 hallows_lucky = 0, hallows_seal = 0,
	 hallows_all_look_ids = [], hallows_refine = 0,
	 sprite_lev = 0, sprite_breka_lev = 0, sprite_attr,
	 sprites = [], ext = [], break_groups = []}).

-record(holiday_camp_war_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 resonate_lev = 0, dower_skill = [], set_skill = [],
	 attr, extra = []}).

-record(role_holiday_camp_war_log,
	{id = {0, <<>>}, list = []}).

-record(holiday_camp_war_log,
	{id = 0, is_atk = 0, atk_id = {0, <<>>},
	 atk_name = <<>>, atk_power = <<>>, atk_face = [],
	 def_id = {0, <<>>}, def_name = <<>>, def_power = <<>>,
	 def_face = [], ret = 1, win_count = 0, lose_count = 0,
	 replay_list = [], time = 0}).

-record(holiday_camp_war_log_face,
	{id = {0, <<>>}, pos = 1, is_leader = 1, lev = 1,
	 name = <<>>, face_id = 0, avatar_bid = 0,
	 face_file = <<>>, face_update_time = 0}).

-record(holiday_camp_war_log_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_power = 0, a_formation_type = 0,
	 a_order = 0, a_end_hp = 0, a_hallows_id = 1,
	 a_hallows_look_id = 0, a_sprite_lev = 0, a_sprites = [],
	 b_id = {0, <<>>}, b_name = <<>>, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 b_hallows_id = 1, b_hallows_look_id = 0,
	 b_sprite_lev = 0, b_sprites = [], a_plist = [],
	 b_plist = [], ext = []}).

-record(holiday_camp_war_log_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0, power = 0,
	 skin_id = 0, resonate_lev = 0, hurt = 0, be_hurt = 0,
	 curt = 0, ext = #{}}).

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      25).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      26).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      27).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      28).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      29).

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
	{ver = 8  :: non_neg_integer(),
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
	 resonate_break_lev = 0, step_list = []  :: list(),
	 step_type_list = []  :: list()}).

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
	 partner_skins = []  :: list(),
	 partner_library_award = []  :: list()}).

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
	 resonate_break_lev = 0, star_step_list = []}).

-record(group_attr,
	{atk = 0, hp_max = 0, def = 0, speed = 0}).

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      30).

-file("inc/timer.hrl", 1).

-record(timer,
	{id  :: term(), timeout = 1000  :: pos_integer(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 a = []  :: [term()], times = 1  :: integer(),
	 next_tick = 0  :: non_neg_integer(),
	 set_time = 1  :: pos_integer()}).

-record(rtimer,
	{ref  :: undefined | reference(),
	 key = 0  :: non_neg_integer(),
	 timers = []  :: [#timer{}]}).

-record(s_timer,
	{ref  :: undefined | reference(),
	 timers = []  :: [#timer{}]}).

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      31).

-file("inc/sprite.hrl", 1).

-record(m_sprite_hatch,
	{ver = 5, list = [], day_privilege_mail = 0,
	 day_buy_list = [], handbook = [], baodi_info = []}).

-record(sprite_hatch,
	{ver = 2, id = 0, is_open = 0, lev = 0, do_id = 0,
	 need_point = 0, do_point = 0, state = 0, end_time = 0,
	 all_end_time = 0}).

-record(m_sprite_tree,
	{ver = 3, lev = 1, break_lev = 0, all_attr,
	 sprites = [], power = 0, max_power = 0,
	 formation_list = []  :: list(),
	 plan_list = []  :: list()}).

-record(formation_sprite,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 team_list = []  :: list()}).

-record(team_sprite,
	{ver = 1  :: pos_integer(), team = 1  :: pos_integer(),
	 plan_id = 0  :: pos_integer(),
	 team_sprites = []  :: list()}).

-record(sprite_plan,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 name = <<>>  :: string(),
	 plan_sprites = []  :: list()}).

-file("src/mod/holiday_camp_war/holiday_camp_war_tea"
      "m.erl",
      32).

-spec buy_count(#role{}) -> {ok, #role{}, integer(),
			     integer()} |
			    {false, string()}.

buy_count(Role = #role{m_holiday_camp_war =
			   MH = #m_holiday_camp_war{second_count =
							OldSecondCount,
						    second_buy_count =
							OldSecondBuyCount}}) ->
    case holiday_camp_war:is_open(Role) of
      {Period, _State, _EndTime} when Period =/= 0 ->
	  LimitBuyCount =
	      holiday_camp_war_data:get_const(second_buy_count),
	  case OldSecondBuyCount >= LimitBuyCount of
	    false ->
		Expend =
		    holiday_camp_war_data:get_const(second_buy_expend),
		Loss = format:val_to_loss(Expend, second_buy_expend),
		case role_gain:do(Role, Loss) of
		  {ok, NRole = #role{}} ->
		      NewMH = MH#m_holiday_camp_war{second_count =
							OldSecondCount + 1,
						    second_buy_count =
							OldSecondBuyCount + 1},
		      NRole1 = NRole#role{m_holiday_camp_war = NewMH},
		      {ok, NRole1, OldSecondCount + 1,
		       LimitBuyCount - OldSecondBuyCount - 1};
		  _ -> {false, lang:get(<<"购买失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"超出购买上限"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动暂未开启"/utf8>>)}
    end.

-spec match(#role{}) -> ok | {false, binary()}.

match(Role = #role{id = RoleId = {Rid, _},
		   max_power = MaxPower, pid = RolePid,
		   m_holiday_camp_war =
		       #m_holiday_camp_war{ref_count = RefCount,
					   atk_defens = AtkDefens,
					   def_defens = DefDefens,
					   is_enter = IsEnter,
					   end_time = EndTime,
					   second_count = SecondCount,
					   camp_id = CampId}}) ->
    case holiday_camp_war:is_open(Role) of
      {Period, 4, _EndTime} when Period =/= 0 ->
	  case combat_lib:combat_pid(Role, 45) of
	    {_CombatType, _CombatPid} ->
		sys_conn:pack_send(29307,
				   {0, lang:get(<<"已在战斗中"/utf8>>), [], [], 0, 0,
				    0});
	    _ ->
		Data = date:unixtime(),
		case Data > EndTime of
		  true ->
		      case SecondCount > 0 of
			true ->
			    MainId = holiday_camp_war_db:get_main_id(RoleId,
								     Period),
			    log:save(join,
				     {Role, <<"阵营战"/utf8>>,
				      util:fbin(<<"pvp匹配赛匹配"/utf8>>, []), 1,
				      MaxPower}),
			    holiday_camp_war_match_mgr:info(Rid,
							    {RolePid, RoleId,
							     MaxPower, MainId,
							     CampId, [RoleId],
							     [RoleId]});
			_ ->
			    sys_conn:pack_send(29307,
					       {0, lang:get(<<"挑战次数不足"/utf8>>),
						[], [], 0, 0, 0})
		      end;
		  _ ->
		      sys_conn:pack_send(29307,
					 {1, <<>>, AtkDefens, DefDefens,
					  RefCount, EndTime, IsEnter})
		end
	  end;
      _ ->
	  sys_conn:pack_send(29307,
			     {0, lang:get(<<"活动未开启"/utf8>>), [], [], 0, 0, 0})
    end.

-spec ref_match(#role{}) -> ok | {false, binary()}.

ref_match(Role = #role{id = RoleId = {Rid, _},
		       max_power = MaxPower, pid = RolePid,
		       m_holiday_camp_war =
			   #m_holiday_camp_war{ref_count = RefCount,
					       atk_defens = AtkDefens,
					       def_defens = DefDefens,
					       end_time = EndTime,
					       camp_id = CampId}}) ->
    case holiday_camp_war:is_open(Role) of
      {Period, _State, _EndTime} when DefDefens =/= [] ->
	  Data = date:unixtime(),
	  case Data > EndTime of
	    false ->
		MainId = holiday_camp_war_db:get_main_id(RoleId,
							 Period),
		Ids1 = [IdT
			|| #holiday_camp_war_defense_role{id = IdT}
			       <- AtkDefens],
		Ids2 = [IdT
			|| #holiday_camp_war_defense_role{id = IdT}
			       <- DefDefens],
		log:save(join,
			 {Role, <<"阵营战"/utf8>>,
			  util:fbin(<<"pvp匹配赛匹配"/utf8>>, []), 1, MaxPower}),
		holiday_camp_war_match_mgr:info(Rid,
						{ref_match, RolePid, RoleId,
						 MaxPower, MainId, CampId,
						 [RoleId | Ids1],
						 [RoleId | Ids2]}),
		NewRole =
		    role_timer:del(holiday_camp_war_to_combat_timer, Role),
		{ok, NewRole};
	    _ when RefCount > 3 ->
		sys_conn:pack_send(29308,
				   {0, lang:get(<<"刷新次数已用完"/utf8>>)}),
		{ok, Role};
	    _ ->
		sys_conn:pack_send(29308,
				   {0,
				    lang:get(<<"当前对手已过期, 重新打开界面自动刷新"/utf8>>)}),
		{ok, Role}
	  end;
      {_Period, _State, _EndTime} ->
	  sys_conn:pack_send(29308,
			     {0, lang:get(<<"当前未匹配对手"/utf8>>)}),
	  {ok, Role};
      _ ->
	  sys_conn:pack_send(29308,
			     {0, lang:get(<<"活动未开启"/utf8>>)}),
	  {ok, Role}
    end.

-spec match_over(#role{}, term()) -> ok |
				     {false, binary()}.

match_over(Role = #role{m_holiday_camp_war = M},
	   {true, AtkDefens, DefDefens}) ->
    case holiday_camp_war:is_open(Role) of
      {_Period, _State, _EndTime} ->
	  AfterTime =
	      holiday_camp_war_data:get_const(team_opponent_time),
	  EndTime = date:unixtime() + AfterTime,
	  NewAtkDefens = calc_robot_data(Role, AtkDefens, []),
	  NewDefDefens = calc_robot_data(Role, DefDefens, []),
	  NewRole = Role#role{m_holiday_camp_war =
				  M#m_holiday_camp_war{atk_defens =
							   NewAtkDefens,
						       ref_count = 0,
						       def_defens =
							   NewDefDefens,
						       end_time = EndTime}},
	  sys_conn:pack_send(29307,
			     {1, <<>>, NewAtkDefens, NewDefDefens, 0, EndTime,
			      0}),
	  Timer1 = #timer{id = holiday_camp_war_to_combat_timer,
			  timeout = max(1, AfterTime) * 1000, times = 1,
			  m = holiday_camp_war_team, f = auto_combat, a = []},
	  NewRole2 = role_timer:add(Timer1, NewRole),
	  {ok, NewRole2};
      _ -> {ok, Role}
    end;
match_over(Role = #role{m_holiday_camp_war =
			    M = #m_holiday_camp_war{ref_count = RefCount}},
	   {true, ref_match, AtkDefens, DefDefens}) ->
    AfterTime =
	holiday_camp_war_data:get_const(team_opponent_time),
    EndTime = date:unixtime() + AfterTime,
    NewAtkDefens = calc_robot_data(Role, AtkDefens, []),
    NewDefDefens = calc_robot_data(Role, DefDefens, []),
    NewRole = Role#role{m_holiday_camp_war =
			    M#m_holiday_camp_war{atk_defens = NewAtkDefens,
						 ref_count = RefCount + 1,
						 def_defens = NewDefDefens,
						 end_time = EndTime}},
    sys_conn:pack_send(29307,
		       {1, <<>>, NewAtkDefens, NewDefDefens, RefCount + 1,
			EndTime, 0}),
    Timer1 = #timer{id = holiday_camp_war_to_combat_timer,
		    timeout = max(1, AfterTime) * 1000, times = 1,
		    m = holiday_camp_war_team, f = auto_combat, a = []},
    NewRole2 = role_timer:add(Timer1, NewRole),
    sys_conn:pack_send(29308, {1, <<>>}),
    {ok, NewRole2};
match_over(Role = #role{m_holiday_camp_war =
			    #m_holiday_camp_war{end_time = EndTime}},
	   {false, ref_match, Msg}) ->
    sys_conn:pack_send(29308, {0, Msg}),
    Timer1 = #timer{id = holiday_camp_war_to_combat_timer,
		    timeout = max(1, EndTime - date:unixtime()) * 1000,
		    times = 1, m = holiday_camp_war_team, f = auto_combat,
		    a = []},
    NewRole2 = role_timer:add(Timer1, Role),
    {ok, NewRole2};
match_over(Role, {false, Msg}) ->
    sys_conn:pack_send(29307, {0, Msg, [], [], 0, 0, 0}),
    {ok, Role}.

calc_robot_data(_Role, [], L) -> L;
calc_robot_data(Role,
		[Data = #holiday_camp_war_defense_role{id =
							   {_, <<"robot">>}}
		 | Defens],
		L) ->
    Data2 = calc_robot_data(Role, Data),
    calc_robot_data(Role, Defens, [Data2 | L]);
calc_robot_data(Role,
		[Data = #holiday_camp_war_defense_role{} | Defens],
		L) ->
    calc_robot_data(Role, Defens, [Data | L]).

calc_robot_data(Role,
		Data = #holiday_camp_war_defense_role{id = {Rid, _}}) ->
    RobotId = Rid div 100,
    #{partners := PL, lev := Lev, face := Face,
      formation := FormationType,
      sprite_info := {SpriteLev, SpriteBreakLev, Sprites},
      hallows := {HallowsId, HallowsStep, HallowsSkill}} =
	robot:get(Role, RobotId, #{max_num => 5}),
    PosInfo = [#holiday_camp_war_partners_info{attr = Attr,
					       dower_skill = DowerSkill,
					       set_skill = SetSkill, id = PId,
					       pos = PId, bid = Bid, lev = PLev,
					       break_lev = BreakLev,
					       star = Star, power = Power,
					       use_skin = SkinId,
					       resonate_lev = ResonateLev}
	       || #partner{id = PId, bid = Bid, use_skin = SkinId,
			   lev = PLev, dower_skill = DowerSkill,
			   set_skills = SetSkill, break_lev = BreakLev,
			   all_attr = Attr, star = Star, power = Power,
			   resonate_lev = ResonateLev}
		      <- PL],
    AllPower = lists:sum([PowerT
			  || #holiday_camp_war_partners_info{power = PowerT}
				 <- PosInfo]),
    NamePrefix =
	util:rand_list(random_name_data:arena_list(1)),
    NameMiddle =
	util:rand_list(random_name_data:arena_list(2)),
    NameSuffix =
	util:rand_list(random_name_data:arena_list(3)),
    Name = <<NamePrefix/binary, NameMiddle/binary,
	     NameSuffix/binary>>,
    SpriteAttr = sprite_tree:calc_attr_by_lev(SpriteLev,
					      SpriteBreakLev),
    Data#holiday_camp_war_defense_role{name = Name,
				       face_id = Face,
				       lev =
					   min(role_career_data:get_const(max_lev),
					       Lev),
				       power = AllPower,
				       formation_type = FormationType,
				       hallows_id = HallowsId,
				       hallows_lev = HallowsStep,
				       hallows_skill_lev = HallowsSkill,
				       partner_infos = PosInfo,
				       sprite_lev = SpriteLev,
				       sprite_breka_lev = SpriteBreakLev,
				       sprite_attr = SpriteAttr,
				       sprites = Sprites}.

-spec match_confirm(#role{}) -> ok | {false, binary()}.

match_confirm(Role = #role{m_holiday_camp_war =
			       M = #m_holiday_camp_war{def_defens =
							   [_ | _]}}) ->
    NewRole = Role#role{m_holiday_camp_war =
			    M#m_holiday_camp_war{is_enter = 1}},
    {ok, NewRole};
match_confirm(Role) -> {ok, Role}.

-spec auto_combat(#role{}) -> {ok, #role{}}.

auto_combat(Role) ->
    case combat_lib:combat_pid(Role, 45) of
      {_CombatType, _CombatPid} -> ok;
      false ->
	  case combat(Role) of
	    {false, Msg} -> notice:alert(Msg), ok;
	    {ok, NRole} ->
		NewRole =
		    role_timer:del(holiday_camp_war_to_combat_timer, NRole),
		{ok, NewRole}
	  end;
      _ -> ok
    end.

combat(Role = #role{m_holiday_camp_war =
			#m_holiday_camp_war{atk_defens = AtkDefens,
					    def_defens = DefDefens}})
    when AtkDefens == [] orelse DefDefens == [] ->
    {ok, Role};
combat(Role = #role{m_holiday_camp_war =
			#m_holiday_camp_war{atk_defens = AtkDefens,
					    def_defens = DefDefens}}) ->
    case check_can_combat(Role) of
      {false, Msg} -> {false, Msg};
      _ ->
	  Round = 1,
	  do_combat(Role, Round, AtkDefens, DefDefens, new_combat)
    end.

to_log_face(Data) ->
    #holiday_camp_war_log_face{id =
				   Data#holiday_camp_war_defense_role.id,
			       pos = Data#holiday_camp_war_defense_role.pos,
			       is_leader =
				   Data#holiday_camp_war_defense_role.is_leader,
			       lev = Data#holiday_camp_war_defense_role.lev,
			       name = Data#holiday_camp_war_defense_role.name,
			       face_id =
				   Data#holiday_camp_war_defense_role.face_id,
			       avatar_bid =
				   Data#holiday_camp_war_defense_role.avatar_bid,
			       face_file =
				   Data#holiday_camp_war_defense_role.face_file,
			       face_update_time =
				   Data#holiday_camp_war_defense_role.face_update_time}.

-spec combat(#role{}, list()) -> {ok, #role{}} |
				 {false, binary()}.

combat(Role = #role{m_holiday_camp_war =
			M = #m_holiday_camp_war{atk_defens = AtkDefens,
						def_defens = DefDefens}},
       PosInfo) ->
    Flag = lists:sort([IdT
		       || #holiday_camp_war_defense_role{id = IdT}
			      <- AtkDefens])
	     == lists:sort([IdT || {IdT, _} <- PosInfo]),
    Flag2 = lists:seq(1, 3) ==
	      lists:sort([PosT || {_, PosT} <- PosInfo]),
    case check_can_combat(Role) of
      {false, Msg} -> {false, Msg};
      _ when Flag == false orelse Flag2 == false ->
	  {false, lang:get(<<"参数错误"/utf8>>)};
      _ ->
	  case combat_lib:combat_pid(Role, 45) of
	    {_CombatType, _CombatPid} ->
		{false, lang:get(<<"已在战斗中"/utf8>>)};
	    _ ->
		Round = 1,
		Fun = fun (Data = #holiday_camp_war_defense_role{id =
								     IdT},
			   Acc) ->
			      case lists:keyfind(IdT, 1, PosInfo) of
				{IdT, PosT} ->
				    [Data#holiday_camp_war_defense_role{pos =
									    PosT}
				     | Acc];
				_ -> [Data | Acc]
			      end
		      end,
		NAtkDefens = lists:foldl(Fun, [], AtkDefens),
		NewM = M#m_holiday_camp_war{atk_defens = NAtkDefens},
		do_combat(Role#role{m_holiday_camp_war = NewM}, Round,
			  NAtkDefens, DefDefens, new_combat)
	  end
    end.

check_can_combat(Role) ->
    case holiday_camp_war:is_open(Role) of
      {_Period, _State, _EndTime} -> true;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

do_combat(Role, Round, AtkDefens, DefDefens, _Result)
    when Round > 3 ->
    ok, do_combat_over(Role, AtkDefens, DefDefens);
do_combat(RoleT = #role{id = RoleId,
			combat_type_list = CombatTypeList},
	  Round, AtkDefens, DefDefens, Result) ->
    CombatType = 45,
    Role = util:if_true(Round == 1, RoleT,
			RoleT#role{combat_pid = 0,
				   combat_type_list =
				       lists:keydelete(CombatType, 1,
						       CombatTypeList)}),
    {FormationType, AtkList, APartnerObjs} =
	get_fight_object(Role, Round, AtkDefens),
    {BFormationType, DefList, BPartnerObjs} =
	get_fight_object(Role, Round, DefDefens),
    {WinCount, LoseCount} =
	util:get(holiday_camp_war_win_count, {0, 0}),
    {Result1, Result2, Result3} =
	util:get(holiday_camp_war_combat_result, {0, 0, 0}),
    if APartnerObjs == [], BPartnerObjs == [] ->
	   if Round == 1 ->
		  put(holiday_camp_war_combat_result,
		      {3, Result2, Result3});
	      Round == 2 ->
		  put(holiday_camp_war_combat_result,
		      {Result1, 3, Result3});
	      true ->
		  put(holiday_camp_war_combat_result,
		      {Result1, Result2, 3})
	   end,
	   do_combat(Role, Round + 1, AtkDefens, DefDefens,
		     Result);
       APartnerObjs == [] ->
	   if Round == 1 ->
		  put(holiday_camp_war_combat_result,
		      {2, Result2, Result3});
	      Round == 2 ->
		  put(holiday_camp_war_combat_result,
		      {Result1, 2, Result3});
	      true ->
		  put(holiday_camp_war_combat_result,
		      {Result1, Result2, 2})
	   end,
	   put(holiday_camp_war_win_count,
	       {WinCount, LoseCount + 1}),
	   do_combat(Role, Round + 1, AtkDefens, DefDefens,
		     Result);
       BPartnerObjs == [] ->
	   if Round == 1 ->
		  put(holiday_camp_war_combat_result,
		      {1, Result2, Result3});
	      Round == 2 ->
		  put(holiday_camp_war_combat_result,
		      {Result1, 1, Result3});
	      true ->
		  put(holiday_camp_war_combat_result,
		      {Result1, Result2, 1})
	   end,
	   put(holiday_camp_war_win_count,
	       {WinCount + 1, LoseCount}),
	   do_combat(Role, Round + 1, AtkDefens, DefDefens,
		     Result);
       true ->
	   TarName = case lists:keyfind(Round,
					#holiday_camp_war_defense_role.pos,
					DefDefens)
			 of
		       #holiday_camp_war_defense_role{name = NameT} -> NameT;
		       _ -> <<>>
		     end,
	   AName = case lists:keyfind(Round,
				      #holiday_camp_war_defense_role.pos,
				      AtkDefens)
		       of
		     #holiday_camp_war_defense_role{name = NameT2} -> NameT2;
		     _ -> {<<>>, 1}
		   end,
	   {ok, CRole0} = role_convert:do(combat_role, Role),
	   CRole = CRole0#combat_role{name = AName, conn_pid = 0,
				      group = 1, is_auto = true,
				      is_offline = true, auto_watch_model = 1,
				      watching = 0},
	   Args = #{on_role_combat_end =>
			{holiday_camp_war_team, do_next_combat,
			 [{Round, AtkDefens, DefDefens}]},
		    ext_args =>
			[{cli_ext_args, [Round, Result1, Result2, Result3]},
			 {is_show_panel, false}],
		    formation =>
			[{1, FormationType, 0}, {2, BFormationType, 0}],
		    target_role_name => TarName, combat_role => CRole},
	   put(is_multiple_combat, 1),
	   case combat_lib:start_combat(Role, CombatType, AtkList,
					[DefList], Args)
	       of
	     {ok, _CombatPid} ->
		 ok,
		 NewRole = case Result == new_combat of
			     true ->
				 put(holiday_camp_war_combat_atk_info,
				     [to_log_face(Data) || Data <- AtkDefens]),
				 put(holiday_camp_war_combat_def_info,
				     [to_log_face(Data) || Data <- DefDefens]),
				 holiday_camp_war_mgr:sync_role(Role),
				 Role;
			     _ -> Role
			   end,
		 NewRole2 =
		     role_timer:del(holiday_camp_war_to_combat_timer,
				    NewRole),
		 {ok, NewRole2};
	     {false, Err} ->
		 case Result == new_combat of
		   true ->
		       case {whereis(lager_event), whereis(lager_event),
			     lager_config:get({lager_event, loglevel}, {0, []})}
			   of
			 {undefined, undefined, _} ->
			     fun () -> {error, lager_not_running} end();
			 {undefined, _, _} ->
			     fun () ->
				     {error, {sink_not_configured, lager_event}}
			     end();
			 {__Pidholiday_camp_war_team345, _,
			  {__Levelholiday_camp_war_team345,
			   __Tracesholiday_camp_war_team345}}
			     when __Levelholiday_camp_war_team345 band 8 /= 0
				    orelse
				    __Tracesholiday_camp_war_team345 /= [] ->
			     lager:do_log(error,
					  [{module, holiday_camp_war_team},
					   {function, do_combat}, {line, 345},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("阵营战第二阶段进战斗失败:~w",
							[{RoleId, Round, Err}]),
					  none, 4096, 8,
					  __Levelholiday_camp_war_team345,
					  __Tracesholiday_camp_war_team345,
					  lager_event,
					  __Pidholiday_camp_war_team345);
			 _ -> ok
		       end,
		       erase(is_multiple_combat),
		       {false, Err};
		   _ ->
		       do_combat(Role, Round + 1, AtkDefens, DefDefens, Result)
		 end
	   end
    end.

get_fight_object(Role = #role{id = Id,
			      partner_bag =
				  #partner_bag{partner_list = Partners}},
		 Round, AtkDefens) ->
    case lists:keyfind(Round,
		       #holiday_camp_war_defense_role.pos, AtkDefens)
	of
      #holiday_camp_war_defense_role{id = Id} ->
	  #formation_sys{type = FormationType, pos_info = PosInfo,
			 hallows_id = HallowsId} =
	      formation:get_sys_formation(Role, 41),
	  #formation_data{pos = FightPos} =
	      formation_data:get_formation(FormationType),
	  Fun = fun (#formation_pos{id = IdT, pos = Pos}) ->
			Partner = lists:keyfind(IdT, #partner.id, Partners),
			FO1 = partner_lib:gen_fight_object(Role, Partner,
							   combat_lib:is_leader(Pos)),
			Pos1 = list_util:keyfind(Pos, FightPos),
			FO1#fight_object{pos = Pos1}
		end,
	  PartnerObj = [Fun(P) || P <- PosInfo],
	  AtkGroup = sprite_tree:gen_fight_object_type(Role, 41)
		       ++
		       hallows_lib:gen_fight_object(Role, HallowsId) ++
			 PartnerObj,
	  AtkGroup1 = combat_attr:calc(AtkGroup, 45, Role),
	  {FormationType, AtkGroup1, PartnerObj};
      DeFenseRole = #holiday_camp_war_defense_role{id =
						       TarRoleId,
						   lev = Rolelev,
						   sprite_lev = SpriteLev,
						   sprite_attr = SpriteAttr,
						   sprites = Sprites,
						   hallows_id = HallowsId,
						   hallows_lev = HallowsLev,
						   hallows_skill_lev =
						       HallowsSkillLev,
						   formation_type =
						       FormationType,
						   hallows_refine =
						       HallowsRefine,
						   partner_infos =
						       PartnerDefense,
						   hallows_look_id =
						       HallowsLookId,
						   hallows_lucky = HallowsLucky,
						   hallows_seal = HallowsSeal,
						   hallows_all_look_ids =
						       AllLooksIds} ->
	  PartnerObj = [gen_def_fight_objects_(PartnerInfo,
					       FormationType, TarRoleId, Role)
			|| PartnerInfo <- PartnerDefense],
	  AtkGroup = sprite_tree:gen_fight_object(Rolelev,
						  SpriteLev, SpriteAttr,
						  Sprites)
		       ++
		       hallows_lib:gen_def_fight_object(HallowsId, HallowsLev,
							HallowsSkillLev,
							HallowsLookId,
							AllLooksIds,
							HallowsLucky,
							HallowsSeal,
							HallowsRefine)
			 ++ PartnerObj,
	  AtkGroup1 = combat_attr:calc(AtkGroup, 45, DeFenseRole),
	  {FormationType, AtkGroup1, PartnerObj};
      _ -> {1, [], []}
    end.

gen_def_fight_objects_(#holiday_camp_war_partners_info{pos
							   = Pos,
						       id = Id, bid = Bid,
						       lev = Lev, star = Star,
						       break_lev = BreakLev,
						       dower_skill = DowerSkill,
						       power = Power,
						       attr = Attr,
						       set_skill = SetSkill,
						       use_skin = UseSkin,
						       resonate_lev =
							   ResnateLev},
		       FormationType, RoleId, Role) ->
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Pos1 = list_util:keyfind(Pos, FightPos),
    BaseData = #partner_base_data{} =
		   partner_data:get_base(Bid),
    P0 = partner:init_partner(Role, BaseData, Id, Lev,
			      Star),
    P = partner_lib:calc_attr(Role,
			      P0#partner{break_lev = BreakLev,
					 dower_skill = DowerSkill}),
    P1 = P#partner{all_attr = Attr, power = Power,
		   lev = Lev, star = Star, break_lev = BreakLev,
		   set_skills = SetSkill, use_skin = UseSkin,
		   resonate_lev = ResnateLev},
    FO1 = partner_lib:gen_fight_object(RoleId, 0, P1,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1}.

do_combat2(Role) ->
    case erase(holiday_camp_war_do_combat_arge) of
      {Round, AtkDefens, DefDefens, ResultT} ->
	  case do_combat(Role, Round, AtkDefens, DefDefens,
			 ResultT)
	      of
	    {ok, NRole} -> {ok, NRole};
	    {ok, NRole, _} -> {ok, NRole};
	    _ERR ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war_team414, _,
		   {__Levelholiday_camp_war_team414,
		    __Tracesholiday_camp_war_team414}}
		      when __Levelholiday_camp_war_team414 band 8 /= 0 orelse
			     __Tracesholiday_camp_war_team414 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_camp_war_team},
				    {function, do_combat2}, {line, 414},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]进战斗失败~w",
						 [Role#role.name, _ERR]),
				   none, 4096, 8,
				   __Levelholiday_camp_war_team414,
				   __Tracesholiday_camp_war_team414,
				   lager_event, __Pidholiday_camp_war_team414);
		  _ -> ok
		end,
		ok
	  end;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_team418, _,
	     {__Levelholiday_camp_war_team418,
	      __Tracesholiday_camp_war_team418}}
		when __Levelholiday_camp_war_team418 band 8 /= 0 orelse
		       __Tracesholiday_camp_war_team418 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_team},
			      {function, do_combat2}, {line, 418},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts跨服竞技场进下一场战斗失败~w",
					   [Role#role.name, _Err]),
			     none, 4096, 8, __Levelholiday_camp_war_team418,
			     __Tracesholiday_camp_war_team418, lager_event,
			     __Pidholiday_camp_war_team418);
	    _ -> ok
	  end,
	  ok
    end.

-spec do_next_combat(#role{}, #combat_result{},
		     #combat{}, tuple()) -> {ok, #role{}}.

do_next_combat(Role = #role{pid = Pid,
			    ui_combat_type = UiCombatType},
	       CombatResult = #combat_result{hurt_statistics =
						 HurtStatistics,
					     replay_id = ReplayId,
					     result = ResultT},
	       _Combat, {Round, AtkDefens, DefDefens}) ->
    {Result1, Result2, Result3} =
	util:get(holiday_camp_war_combat_result, {0, 0, 0}),
    if Round == 1 ->
	   put(holiday_camp_war_combat_result,
	       {ResultT, Result2, Result3});
       Round == 2 ->
	   put(holiday_camp_war_combat_result,
	       {Result1, ResultT, Result3});
       true ->
	   put(holiday_camp_war_combat_result,
	       {Result1, Result2, ResultT})
    end,
    {OldWinCount, OldLose} =
	util:get(holiday_camp_war_win_count, {0, 0}),
    {WinCount, Lose} = case ResultT == 1 of
			 true ->
			     put(holiday_camp_war_win_count,
				 {OldWinCount + 1, OldLose}),
			     {OldWinCount + 1, OldLose};
			 _ ->
			     put(holiday_camp_war_win_count,
				 {OldWinCount, OldLose + 1}),
			     {OldWinCount, OldLose + 1}
		       end,
    OldRoundLog = util:get(holiday_camp_war_round_log, []),
    RoundLog = #holiday_camp_war_log_info{a_name = AName,
					  b_name = BName} =
		   to_round_log(CombatResult, Round, AtkDefens, DefDefens),
    put(holiday_camp_war_hurt_statistics,
	[{Round, Round, Round, HurtStatistics, ReplayId, AName,
	  BName, ResultT}
	 | util:get(holiday_camp_war_hurt_statistics, [])]),
    put(holiday_camp_war_round_log,
	[{Round, RoundLog} | OldRoundLog]),
    case WinCount >= 2 orelse Lose >= 2 of
      true -> do_combat_over(Role, AtkDefens, DefDefens);
      _ ->
	  case UiCombatType == 45 of
	    true ->
		put(holiday_camp_war_do_combat_arge,
		    {Round + 1, AtkDefens, DefDefens, ResultT}),
		role:apply(async, Pid,
			   {holiday_camp_war_team, do_combat2, []}),
		{ok, Role};
	    _ ->
		do_combat(Role, Round + 1, AtkDefens, DefDefens,
			  ResultT)
	  end
    end.

do_combat_over(Role = #role{id = RoleId, name = Name,
			    max_power = MaxPower,
			    m_holiday_camp_war =
				M = #m_holiday_camp_war{camp_id = CampId,
							second_count =
							    SecondCount}},
	       _AtkDefens, DefDefens) ->
    HurtStatistics =
	util:get(holiday_camp_war_hurt_statistics, []),
    {WinCount, LoseCount} =
	util:get(holiday_camp_war_win_count, {0, 0}),
    erase(is_multiple_combat),
    erase(holiday_camp_war_hurt_statistics),
    erase(holiday_camp_war_win_count),
    erase(holiday_camp_war_combat_result),
    erase(holiday_camp_war_do_combat_arge),
    AllDefenPower = lists:sum([Power
			       || #holiday_camp_war_defense_role{power = Power}
				      <- DefDefens]),
    case holiday_camp_war:is_open(Role) of
      {Period, _State, _EndTime} ->
	  case holiday_camp_war_data:get_power_reward({Period,
						       AllDefenPower})
	      of
	    {DropIdList, BeReward, ScoreAward} ->
		RewardList = case drop_lib:common_drop2(Role,
							DropIdList)
				 of
			       [{_, DropItems, _, _}] ->
				   [{Bid, Val} || {Bid, _, Val} <- DropItems];
			       _ -> []
			     end,
		AllReward = RewardList ++ BeReward,
		Result = util:if_true(WinCount >= LoseCount, 1, 2),
		MainId = holiday_camp_war_db:get_main_id(RoleId,
							 Period),
		AddScore = util:if_true(Result =:= 1,
					util:ceil(holiday_camp_war_data:get_const(second_mulitple_win)
						    * ScoreAward
						    / 1000),
					util:ceil(holiday_camp_war_data:get_const(second_mulitple_lose)
						    * ScoreAward
						    / 1000)),
		cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
				 [{send_combat_fort_data, RoleId, MainId, 0,
				   AddScore, Name, CampId}]),
		ok,
		sys_conn:pack_send(29311,
				   {Result, AddScore, WinCount, LoseCount,
				    HurtStatistics, AllReward}),
		NewM = M#m_holiday_camp_war{ref_count = 0,
					    second_count = SecondCount - 1,
					    atk_defens = [], def_defens = [],
					    end_time = 0, is_enter = 0},
		NewRole = Role#role{m_holiday_camp_war = NewM},
		ReplayList = util:get(holiday_camp_war_round_log, []),
		erase(holiday_camp_war_round_log),
		AtkInfo = util:get(holiday_camp_war_combat_atk_info,
				   []),
		DefInfo = util:get(holiday_camp_war_combat_def_info,
				   []),
		Log = to_combat_log(AtkInfo, DefInfo, Result, WinCount,
				    LoseCount, ReplayList),
		AtkLog = Log#holiday_camp_war_log{is_atk = 1},
		cluster_lib:cast(element(2, RoleId),
				 holiday_camp_war_mgr, info,
				 [{add_log, RoleId, AtkLog}]),
		erase(is_multiple_combat),
		case Result =:= 1 of
		  true ->
		      log:save(join,
			       {Role, <<"阵营战"/utf8>>,
				util:fbin(<<"pvp匹配赛胜利"/utf8>>, []), 1, MaxPower,
				util:fbin(<<"阵营：~w"/utf8>>, [CampId])});
		  _ -> skip
		end,
		log:save(join,
			 {Role, <<"阵营战"/utf8>>,
			  util:fbin(<<"pvp匹配赛战斗"/utf8>>, []), 1, MaxPower}),
		Gain = format:val_to_gain(AllReward,
					  holiday_camp_war_combat_team),
		case role_gain:do(NewRole, Gain) of
		  {ok, GainRole} ->
		      log:log_gain(Gain, Role, GainRole, <<"阵营战-组队挑战"/utf8>>,
				   <<"挑战据点-组队挑战"/utf8>>),
		      holiday_camp_war:push_base(GainRole),
		      holiday_camp_war:push_fort_info(GainRole, 0),
		      {ok, GainRole};
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_camp_war_team524, _,
			 {__Levelholiday_camp_war_team524,
			  __Tracesholiday_camp_war_team524}}
			    when __Levelholiday_camp_war_team524 band 8 /= 0
				   orelse
				   __Tracesholiday_camp_war_team524 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_camp_war_team},
					  {function, do_combat_over},
					  {line, 524},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("阵营战第二阶段奖励失败玩家:~ts id:~w, 据点id:~w",
						       [Role#role.name,
							Role#role.id, 0]),
					 none, 4096, 8,
					 __Levelholiday_camp_war_team524,
					 __Tracesholiday_camp_war_team524,
					 lager_event,
					 __Pidholiday_camp_war_team524);
			_ -> ok
		      end,
		      {ok, NewRole}
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
		  {__Pidholiday_camp_war_team528, _,
		   {__Levelholiday_camp_war_team528,
		    __Tracesholiday_camp_war_team528}}
		      when __Levelholiday_camp_war_team528 band 8 /= 0 orelse
			     __Tracesholiday_camp_war_team528 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_camp_war_team},
				    {function, do_combat_over}, {line, 528},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("阵营战第二阶段奖励失败玩家:~ts id:~w, 据点id:~w, 数据：~w, "
						 "结果：~w",
						 [Role#role.name, Role#role.id,
						  0, {Period, AllDefenPower},
						  holiday_camp_war_data:get_power_reward({Period,
											  AllDefenPower})]),
				   none, 4096, 8,
				   __Levelholiday_camp_war_team528,
				   __Tracesholiday_camp_war_team528,
				   lager_event, __Pidholiday_camp_war_team528);
		  _ -> ok
		end,
		{ok, Role}
	  end;
      _ -> {ok, Role}
    end.

to_round_log(#combat_result{action_count = ActionCount,
			    replay_id = ReplayId, a_stat_info = AStatInfo,
			    b_stat_info = BStatInfo, result = ResultT},
	     Round, AtkDefens, DefDefens) ->
    {APower, APlist, AEndHp} = to_p_list(AStatInfo),
    {BPower, BPlist, BEndHp} = to_p_list(BStatInfo),
    {RoleId, AHallowsId, AHallowsLookId, ASpriteLev,
     ASprites, AFormationType, AName} =
	case lists:keyfind(Round,
			   #holiday_camp_war_defense_role.pos, AtkDefens)
	    of
	  #holiday_camp_war_defense_role{id = RoleIdT,
					 name = ANameT,
					 formation_type = AFormationTypeT,
					 hallows_id = AHallowsIdT,
					 hallows_look_id = AHallowsLookIdT,
					 sprite_lev = ASpriteLevT,
					 sprites = ASpritesT} ->
	      {RoleIdT, AHallowsIdT, AHallowsLookIdT, ASpriteLevT,
	       ASpritesT, AFormationTypeT, ANameT};
	  _ -> {{0, <<>>}, 1, 0, 0, [], 1, <<>>}
	end,
    {TarId, BHallowsId, BHallowsLookId, BSpriteLev,
     BSprites, BFormationType, BName} =
	case lists:keyfind(Round,
			   #holiday_camp_war_defense_role.pos, DefDefens)
	    of
	  #holiday_camp_war_defense_role{id = BRoleIdT,
					 name = BNameT,
					 formation_type = BFormationTypeT,
					 hallows_id = BHallowsIdT,
					 hallows_look_id = BHallowsLookIdT,
					 sprite_lev = BSpriteLevT,
					 sprites = BSpritesT} ->
	      {BRoleIdT, BHallowsIdT, BHallowsLookIdT, BSpriteLevT,
	       BSpritesT, BFormationTypeT, BNameT};
	  _ -> {{0, <<>>}, 1, 0, 0, [], 1, <<>>}
	end,
    combat_replay_mgr:acc_replay_reference(ReplayId),
    #holiday_camp_war_log_info{id = ReplayId,
			       round = ActionCount, ret = ResultT,
			       time = date:unixtime(), a_id = RoleId,
			       a_name = AName, a_power = APower,
			       a_formation_type = AFormationType,
			       a_order = Round, a_end_hp = AEndHp,
			       a_hallows_id = AHallowsId,
			       a_hallows_look_id = AHallowsLookId,
			       a_sprite_lev = ASpriteLev, a_sprites = ASprites,
			       b_id = TarId, b_name = BName, b_power = BPower,
			       b_formation_type = BFormationType,
			       b_order = Round, b_end_hp = BEndHp,
			       b_hallows_id = BHallowsId,
			       b_hallows_look_id = BHallowsLookId,
			       b_sprite_lev = BSpriteLev, b_sprites = BSprites,
			       a_plist = APlist, b_plist = BPlist}.

to_p_list(StatInfo) ->
    Fun = fun (#{pos := Pos, object_id := ObjectId,
		 hurt := Hurt, curt := Curt, be_hurt := BeHurt,
		 extra_data := ExtraData, star := Star, power := Power,
		 lev := Lev, object_bid := ObjectBid, hp := Hp,
		 hp_max := HpMax},
	       {Acc1, Acc2, Acc3, Acc4}) ->
		  ReplayP = #holiday_camp_war_log_partner{pos =
							      combat_target:logic_pos(Pos),
							  id = ObjectId,
							  bid = ObjectBid,
							  lev = Lev,
							  star = Star,
							  power = Power,
							  skin_id =
							      list_util:keyfind(5,
										ExtraData,
										0),
							  resonate_lev =
							      list_util:keyfind(11,
										ExtraData,
										0),
							  hurt = Hurt,
							  be_hurt = BeHurt,
							  curt = Curt},
		  {Acc1 + Power, [ReplayP | Acc2], Acc3 + Hp,
		   Acc4 + HpMax}
	  end,
    {AllPower, PList, AllHp, AllMaxHp} = lists:foldl(Fun,
						     {0, [], 0, 0}, StatInfo),
    {AllPower, PList, util:ceil(AllHp * 100 / AllMaxHp)}.

to_combat_log(AtkInfo, DefInfo, Ret, WinCount,
	      LoseCount, ReplayList) ->
    case lists:keyfind(1,
		       #holiday_camp_war_log_face.is_leader, AtkInfo)
	of
      #holiday_camp_war_log_face{id = AtkId, name = Name} ->
	  case lists:keyfind(1,
			     #holiday_camp_war_log_face.is_leader, DefInfo)
	      of
	    #holiday_camp_war_log_face{id = Id2, name = Name2} ->
		AtkPower = lists:sum([PowerT
				      || {_,
					  #holiday_camp_war_log_info{a_power =
									 PowerT}}
					     <- ReplayList]),
		DefPower = lists:sum([PowerT
				      || {_,
					  #holiday_camp_war_log_info{b_power =
									 PowerT}}
					     <- ReplayList]),
		#holiday_camp_war_log{atk_id = AtkId, atk_name = Name,
				      atk_face = AtkInfo, atk_power = AtkPower,
				      def_id = Id2, def_name = Name2,
				      def_face = DefInfo, def_power = DefPower,
				      ret = Ret, win_count = WinCount,
				      lose_count = LoseCount,
				      replay_list = ReplayList,
				      time = date:unixtime()};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war_team630, _,
		   {__Levelholiday_camp_war_team630,
		    __Tracesholiday_camp_war_team630}}
		      when __Levelholiday_camp_war_team630 band 8 /= 0 orelse
			     __Tracesholiday_camp_war_team630 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_camp_war_team},
				    {function, to_combat_log}, {line, 630},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("战斗结算时，对手数据找不到队长:~w",
						 [DefInfo]),
				   none, 4096, 8,
				   __Levelholiday_camp_war_team630,
				   __Tracesholiday_camp_war_team630,
				   lager_event, __Pidholiday_camp_war_team630);
		  _ -> ok
		end,
		skip
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
	    {__Pidholiday_camp_war_team634, _,
	     {__Levelholiday_camp_war_team634,
	      __Tracesholiday_camp_war_team634}}
		when __Levelholiday_camp_war_team634 band 8 /= 0 orelse
		       __Tracesholiday_camp_war_team634 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_team},
			      {function, to_combat_log}, {line, 634},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗结算时，进攻方找不到队长:~w", [AtkInfo]),
			     none, 4096, 8, __Levelholiday_camp_war_team634,
			     __Tracesholiday_camp_war_team634, lager_event,
			     __Pidholiday_camp_war_team634);
	    _ -> ok
	  end,
	  skip
    end.

-spec push_save_sys_formation(#role{}) -> #role{}.

push_save_sys_formation(NRole = #role{id = RoleId,
				      m_sprite_tree =
					  #m_sprite_tree{break_lev =
							     SpriteBreak,
							 all_attr = SpriteAttr},
				      m_holiday_camp_war =
					  M = #m_holiday_camp_war{atk_defens =
								      AtkDefense}}) ->
    case lists:keyfind(RoleId,
		       #holiday_camp_war_defense_role.id, AtkDefense)
	of
      Data = #holiday_camp_war_defense_role{} ->
	  #formation_sys{type = FormationType, pos_info = PosInfo,
			 hallows_id = HallowsId} =
	      formation:get_sys_formation(NRole, 41),
	  TeamPower = formation:get_sys_formation_power(NRole,
							41),
	  TeamPartners = to_team_partner(NRole, PosInfo),
	  {HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
	   HallowsLookIds, HallowsLucky, HallowsSeal} =
	      hallows_lib:get_hallows_info2(NRole, HallowsId),
	  HallowRefine = hallows_lib:get_hallows_refine(NRole,
							HallowsId),
	  {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(NRole,
							    41),
	  NewData =
	      Data#holiday_camp_war_defense_role{formation_type =
						     FormationType,
						 hallows_id = HallowsId,
						 hallows_lev = HallowsLev,
						 hallows_skill_lev =
						     HallowsSkillLev,
						 hallows_look_id =
						     HallowsLookId,
						 hallows_lucky = HallowsLucky,
						 hallows_seal = HallowsSeal,
						 hallows_refine = HallowRefine,
						 hallows_all_look_ids =
						     HallowsLookIds,
						 sprite_breka_lev = SpriteBreak,
						 sprite_lev = SpriteLev,
						 sprites = Sprites,
						 sprite_attr = SpriteAttr,
						 partner_infos = TeamPartners,
						 power = TeamPower},
	  sys_conn:pack_send(29312, {NewData}),
	  NewM = M#m_holiday_camp_war{atk_defens =
					  lists:keystore(RoleId,
							 #holiday_camp_war_defense_role.id,
							 AtkDefense, NewData)},
	  NewRole = NRole#role{m_holiday_camp_war = NewM},
	  holiday_camp_war_mgr:sync_role(NewRole),
	  NewRole;
      _ -> NRole
    end.

to_team_partner(#role{partner_bag =
			  #partner_bag{partner_list = PartnerList}},
		PartnerId) ->
    to_team_partner(PartnerList, PartnerId);
to_team_partner(#role_robot{partners = PartnerList},
		PartnerId) ->
    to_team_partner(PartnerList, PartnerId);
to_team_partner(PartnerList, PartnerIds)
    when is_list(PartnerIds) ->
    [begin
       #partner{bid = Bid, use_skin = SkinId, all_attr = Attr,
		dower_skill = DowerSkill, set_skills = SetSkill,
		lev = Lev, break_lev = BreakLev, star = Star,
		power = Power, resonate_lev = ResonateLev} =
	   lists:keyfind(Id, #partner.id, PartnerList),
       #holiday_camp_war_partners_info{attr = Attr,
				       dower_skill = DowerSkill,
				       set_skill = SetSkill, id = Id, pos = Pos,
				       bid = Bid, lev = Lev,
				       break_lev = BreakLev, star = Star,
				       power = Power, use_skin = SkinId,
				       resonate_lev = ResonateLev}
     end
     || #formation_pos{id = Id, pos = Pos} <- PartnerIds].

-spec combat_pos_info_cache(#role{}, list()) -> #role{}.

combat_pos_info_cache(Role = #role{m_holiday_camp_war =
				       M = #m_holiday_camp_war{atk_defens =
								   AtkDefens}},
		      PosInfo) ->
    case holiday_camp_war:is_open(Role) of
      {_Period, _State, _EndTime} ->
	  Flag = lists:sort([IdT
			     || #holiday_camp_war_defense_role{id = IdT}
				    <- AtkDefens])
		   == lists:sort([IdT || {IdT, _} <- PosInfo]),
	  Flag2 = lists:seq(1, 3) ==
		    lists:sort([PosT || {_, PosT} <- PosInfo]),
	  case Flag == false orelse Flag2 == false of
	    true -> Role;
	    _ ->
		Fun = fun (Data = #holiday_camp_war_defense_role{id =
								     IdT},
			   Acc) ->
			      case lists:keyfind(IdT, 1, PosInfo) of
				{IdT, PosT} ->
				    [Data#holiday_camp_war_defense_role{pos =
									    PosT}
				     | Acc];
				_ -> [Data | Acc]
			      end
		      end,
		NAtkDefens = lists:foldl(Fun, [], AtkDefens),
		NewM = M#m_holiday_camp_war{atk_defens = NAtkDefens},
		Role#role{m_holiday_camp_war = NewM}
	  end;
      _ -> Role
    end.

-spec get_rank(#role{}, pos_integer(), pos_integer(),
	       pos_integer()) -> list().

get_rank(Role = #role{id = RoleId,
		      m_holiday_camp_war =
			  #m_holiday_camp_war{camp_id = MyCampId}},
	 CampId, StarNum, Num) ->
    case holiday_camp_war:is_open(Role) of
      {Period, _State, _EndTime} ->
	  MainId = holiday_camp_war_db:get_main_id(RoleId,
						   Period),
	  cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
			   [{apply_get_rank, MainId, MyCampId, CampId, RoleId,
			     StarNum, Num}]),
	  ok;
      _ ->
	  sys_conn:pack_send(29314,
			     {0, lang:get(<<"活动未开启"/utf8>>), 0, 0, 0, 0, 0, []})
    end.

-spec apply_get_rank(#role{}, term()) -> ok.

apply_get_rank(_Role,
	       {MyRank, MyScore, MyCampId, Per, CampId, List}) ->
    sys_conn:pack_send(29314,
		       {1, <<>>, MyRank, MyScore, MyCampId, Per, CampId,
			List}),
    ok.


