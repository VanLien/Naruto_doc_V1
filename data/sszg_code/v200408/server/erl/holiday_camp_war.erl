-file("src/mod/holiday_camp_war/holiday_camp_war.erl",
      1).

-module(holiday_camp_war).

-lager_records([{group_attr, [atk, hp_max, def, speed]},
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

-export([login/1, init/0, zero_flush/1, level_up/1,
	 push_base/1, apply_push_base/2, push_fort_info/2,
	 apply_push_fort_info/2, combat_fort/5,
	 fort_combat_over/6, can_skip_combat/1, vote/2,
	 buy_fort_count/1, push_day_change/1,
	 apply_push_day_change/2, enter/1, is_open/1]).

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

-file("src/mod/holiday_camp_war/holiday_camp_war.erl",
      26).

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

-file("src/mod/holiday_camp_war/holiday_camp_war.erl",
      27).

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

-file("src/mod/holiday_camp_war/holiday_camp_war.erl",
      28).

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

-file("src/mod/holiday_camp_war/holiday_camp_war.erl",
      29).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_camp_war/holiday_camp_war.erl",
      30).

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

-file("src/mod/holiday_camp_war/holiday_camp_war.erl",
      31).

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

-file("src/mod/holiday_camp_war/holiday_camp_war.erl",
      32).

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

-file("src/mod/holiday_camp_war/holiday_camp_war.erl",
      33).

init() -> #m_holiday_camp_war{}.

-spec login(#role{}) -> ok.

login(Role = #role{m_holiday_camp_war =
		       #m_holiday_camp_war{period = OldPeriod}}) ->
    NewRole = case is_open(Role) of
		{Period, _State, _EndTime} when Period =/= OldPeriod ->
		    NRole1 = init_period(Role, Period),
		    activity_self:set_activity(810, 1, []),
		    holiday_camp_war_mgr:sync_role(NRole1),
		    NRole1;
		{_Period, _State, _EndTime} ->
		    activity_self:set_activity(810, 1, []),
		    holiday_camp_war_mgr:sync_role(Role),
		    Role;
		_ ->
		    sys_conn:pack_send(29300,
				       {0, <<>>, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
					0, 0, []}),
		    activity_self:set_activity(810, 0, []),
		    Role
	      end,
    {ok, NewRole}.

-spec zero_flush(#role{}) -> ok.

zero_flush(Role = #role{m_holiday_camp_war =
			    MH = #m_holiday_camp_war{period = OldPeriod}}) ->
    NewRole = case is_open(Role) of
		{Period, _State, _EndTime} when Period =/= OldPeriod ->
		    NRole1 = init_period(Role, Period),
		    activity_self:set_activity(810, 1, []),
		    holiday_camp_war_mgr:sync_role(NRole1),
		    log:save(join,
			     {NRole1, <<"阵营战"/utf8>>,
			      util:fbin(<<"阵营战可参与玩家"/utf8>>, [])}),
		    NRole1;
		{_Period, _State, _EndTime} ->
		    NewMH = MH#m_holiday_camp_war{enter_flag = 0,
						  vote_flag = 0, first_flag = 0,
						  first_count =
						      holiday_camp_war_data:get_const(first_free_count),
						  first_buy_count = 0,
						  second_count =
						      holiday_camp_war_data:get_const(second_free_count),
						  second_buy_count = 0},
		    activity_self:set_activity(810, 1, []),
		    NRole1 = Role#role{m_holiday_camp_war = NewMH},
		    holiday_camp_war_mgr:sync_role(NRole1),
		    log:save(join,
			     {NRole1, <<"阵营战"/utf8>>,
			      util:fbin(<<"阵营战可参与玩家"/utf8>>, [])}),
		    NRole1;
		_ ->
		    sys_conn:pack_send(29300,
				       {0, <<>>, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
					0, 0, []}),
		    activity_self:set_activity(810, 0, []),
		    Role
	      end,
    {ok, NewRole}.

level_up(Role) ->
    {ok, NewRole} = push_base(Role), NewRole.

-spec push_base(#role{}) -> {ok, #role{}}.

push_base(Role = #role{id = RoleId,
		       m_holiday_camp_war =
			   #m_holiday_camp_war{period = Period,
					       camp_id = CampId}}) ->
    NewRole = case is_open(Role) of
		{NewPeriod, _State, _EndTime}
		    when Period =/= NewPeriod ->
		    NRole = init_period(Role, NewPeriod),
		    activity_self:set_activity(810, 1, []),
		    holiday_camp_war_mgr:sync_role(NRole),
		    log:save(join,
			     {NRole, <<"阵营战"/utf8>>,
			      util:fbin(<<"阵营战可参与玩家"/utf8>>, [])}),
		    NRole;
		{Period, _State, _EndTime} ->
		    MainId = holiday_camp_war_db:get_main_id(RoleId,
							     Period),
		    holiday_camp_war_mgr:sync_role(Role),
		    activity_self:set_activity(810, 1, []),
		    cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
				     [{apply_push_base, RoleId, CampId,
				       MainId}]),
		    Role;
		_ ->
		    sys_conn:pack_send(29300,
				       {0, <<>>, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
					0, 0, []}),
		    activity_self:set_activity(810, 0, []),
		    Role
	      end,
    {ok, NewRole}.

-spec apply_push_base(#role{}, term()) -> ok.

apply_push_base(#role{m_holiday_camp_war =
			  #m_holiday_camp_war{period = Period, camp_id = CampId,
					      vote_flag = VoteFlag,
					      first_count = FirstCount,
					      first_buy_count = FirstBuyCount,
					      second_count = SecondCount,
					      second_buy_count =
						  SecondBuyCount}},
		{MyScore, LastScore, MedalScore, OtherMedalScore,
		 FortList}) ->
    {Period, PState, EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    {_, PEndTime, _, _, _} =
	holiday_camp_war_data:get_period(Period),
    PeriodEndTime = date:parse_time(PEndTime),
    FirstAccountTime =
	date:parse_time(holiday_camp_war_data:get_first_accout(Period)),
    BigEndTime = util:if_true(date:unixtime() >=
				FirstAccountTime,
			      PeriodEndTime, FirstAccountTime),
    {CombatCount, ResidueBuyCount} = case PState =:= 1
					    orelse PState =:= 2
					 of
				       true ->
					   {FirstCount,
					    holiday_camp_war_data:get_const(first_buy_count)
					      - FirstBuyCount};
				       _ ->
					   {SecondCount,
					    holiday_camp_war_data:get_const(second_buy_count)
					      - SecondBuyCount}
				     end,
    sys_conn:pack_send(29300,
		       {1, <<>>, Period, PState, EndTime, BigEndTime, CampId,
			MyScore, LastScore, VoteFlag, CombatCount,
			ResidueBuyCount, MedalScore, OtherMedalScore,
			FortList}),
    ok.

-spec push_fort_info(#role{}, integer()) -> ok.

push_fort_info(Role = #role{id = RoleId,
			    m_holiday_camp_war =
				#m_holiday_camp_war{period = Period}},
	       Id) ->
    case is_open(Role) of
      {Period, _State, _EndTime} ->
	  MainId = holiday_camp_war_db:get_main_id(RoleId,
						   Period),
	  cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
			   [{apply_push_fort_info, RoleId, MainId, Id}]),
	  ok;
      _ ->
	  sys_conn:pack_send(29301,
			     {0, lang:get(<<"活动未开启"/utf8>>), 0, 0, 0, 0, 0, [],
			      []}),
	  ok
    end.

-spec apply_push_fort_info(#role{}, term()) -> ok.

apply_push_fort_info(_Role,
		     {Id, Belong, Difficulty, AScore, BScore, Log,
		      StateLog}) ->
    sys_conn:pack_send(29301,
		       {1, <<>>, Id, Belong, Difficulty, AScore, BScore, Log,
			StateLog}),
    ok.

-spec combat_fort(#role{}, integer(), pos_integer(),
		  list(), pos_integer()) -> ok.

combat_fort(Role = #role{max_power = MaxPower,
			 m_holiday_camp_war =
			     #m_holiday_camp_war{camp_id = CampId}},
	    Id, FormationType, PosInfo, HallowId) ->
    case check_cond([open, time, formation, defend], Role,
		    #{id => Id, formation => FormationType,
		      pos_info => PosInfo, hallows_id => HallowId})
	of
      {ok, DefendList, BFormationType, BFormationLev, TarName,
       Up, UnitId} ->
	  {Period, _State, _EndTime} =
	      sys_env:get(holiday_camp_war_period, {0, 0, 0}),
	  CombatType = 44,
	  FormationLev = formation_lib:get_formation_lev(Role,
							 FormationType),
	  FightPos = formation_lib:gen_fight_pos(PosInfo,
						 FormationType),
	  AtkGroup0 = combat_lib:gen_fight_objects(Role,
						   FightPos),
	  AtkGroup = sprite_tree:gen_fight_object_type(Role, 40)
		       ++
		       hallows_lib:gen_fight_object(Role, HallowId) ++
			 AtkGroup0,
	  Args = #{on_role_combat_end =>
		       {holiday_camp_war, fort_combat_over, [Id, Up, UnitId]},
		   ext_args =>
		       [{cli_ext_args, [Period, Id]}, {is_show_panel, false}],
		   formation =>
		       [{1, FormationType, FormationLev},
			{2, BFormationType, BFormationLev}],
		   target_role_name => TarName},
	  case combat_lib:start_combat(Role, CombatType, AtkGroup,
				       [DefendList], Args)
	      of
	    {ok, _CombatPid} ->
		log:save(join,
			 {Role, <<"阵营战"/utf8>>,
			  util:fbin(<<"pve占位赛参与"/utf8>>, []), 1, MaxPower,
			  util:fbin(<<"阵营：~w"/utf8>>, [CampId])}),
		case formation:set_sys_formation(Role, 40,
						 FormationType, PosInfo,
						 HallowId)
		    of
		  {ok, NewRole} -> {ok, NewRole};
		  _ -> {ok, Role}
		end;
	    {false, Msg} -> {false, Msg};
	    _ -> {false, lang:get(<<"无法发起战斗"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec can_skip_combat(#role{}) -> true |
				  {false, binary()}.

can_skip_combat(#role{m_holiday_camp_war =
			  #m_holiday_camp_war{first_flag = Flag}}) ->
    case Flag of
      1 -> true;
      _ -> {false, lang:get(<<"至少需要挑战过一次才可以跳过战斗"/utf8>>)}
    end.

-spec fort_combat_over(#role{}, #combat_result{},
		       #combat{}, tuple(), boolean(), pos_integer()) -> {ok,
									 #role{}}.

fort_combat_over(Role = #role{id = RoleId, name = Name,
			      max_power = MaxPower,
			      m_holiday_camp_war =
				  MH = #m_holiday_camp_war{first_count =
							       FirstCount,
							   camp_id = CampId}},
		 #combat_result{total_hurt = Dps,
				hurt_statistics = HurtStatistics},
		 #combat{target_role_name = TargetName}, Id, Up,
		 UnitId) ->
    {Period, _, _} = sys_env:get(holiday_camp_war_period,
				 {0, 0, 0}),
    case
      holiday_camp_war_data:get_first_combat_reward({holiday_camp_war_data:get_fort_award_id({Period,
											      Id}),
						     Dps})
	of
      {DropIdList, BeReward, ScoreAward, DpsLev} ->
	  RewardList = case drop_lib:common_drop2(Role,
						  DropIdList)
			   of
			 [{_, DropItems, _, _}] ->
			     [{Bid, Val} || {Bid, _, Val} <- DropItems];
			 _ -> []
		       end,
	  AllReward = RewardList ++ BeReward,
	  log:save(join,
		   {Role, <<"阵营战"/utf8>>,
		    util:fbin(<<"pve伤害~w层"/utf8>>, [DpsLev]), 1, MaxPower,
		    util:fbin(<<"阵营:~w, 伤害:~w"/utf8>>, [CampId, Dps])}),
	  {Period, _State, _EndTime} =
	      sys_env:get(holiday_camp_war_period, {0, 0, 0}),
	  MainId = holiday_camp_war_db:get_main_id(RoleId,
						   Period),
	  AddScore = util:if_true(Up =:= 1,
				  util:ceil(holiday_camp_war_data:get_const(fort_award_up_per)
					      * ScoreAward
					      / 1000)
				    + ScoreAward,
				  ScoreAward),
	  cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
			   [{send_combat_fort_data, RoleId, MainId, Id,
			     AddScore, Name, CampId}]),
	  sys_conn:pack_send(29303,
			     {Dps, AddScore, CampId, Id, UnitId, Period,
			      TargetName, HurtStatistics, AllReward}),
	  NewMH = MH#m_holiday_camp_war{first_count =
					    FirstCount - 1,
					first_flag = 1},
	  Role1 = Role#role{m_holiday_camp_war = NewMH},
	  push_base(Role1),
	  push_fort_info(Role1, Id),
	  Gain = format:val_to_gain(AllReward,
				    holiday_camp_war_combat_fort),
	  case role_gain:do(Role1, Gain) of
	    {ok, GainRole} ->
		log:log_gain(Gain, Role1, GainRole, <<"阵营战-挑战据点"/utf8>>,
			     <<"挑战据点"/utf8>>),
		{ok, GainRole};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war244, _,
		   {__Levelholiday_camp_war244,
		    __Tracesholiday_camp_war244}}
		      when __Levelholiday_camp_war244 band 8 /= 0 orelse
			     __Tracesholiday_camp_war244 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_camp_war},
				    {function, fort_combat_over}, {line, 244},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("阵营战奖励失败玩家:~ts id:~w, 据点id:~w",
						 [Role1#role.name,
						  Role1#role.id, Id]),
				   none, 4096, 8, __Levelholiday_camp_war244,
				   __Tracesholiday_camp_war244, lager_event,
				   __Pidholiday_camp_war244);
		  _ -> ok
		end,
		{ok, Role1}
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
	    {__Pidholiday_camp_war248, _,
	     {__Levelholiday_camp_war248,
	      __Tracesholiday_camp_war248}}
		when __Levelholiday_camp_war248 band 8 /= 0 orelse
		       __Tracesholiday_camp_war248 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war},
			      {function, fort_combat_over}, {line, 248},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("阵营战奖励失败玩家:~ts id:~w, 据点id:~w Dps:~w",
					   [Role#role.name, Role#role.id, Id,
					    Dps]),
			     none, 4096, 8, __Levelholiday_camp_war248,
			     __Tracesholiday_camp_war248, lager_event,
			     __Pidholiday_camp_war248);
	    _ -> ok
	  end,
	  {ok, Role}
    end.

check_cond([], _Role,
	   _Arg = #{defendlist := DefendList,
		    b_formation_type := BFormationType,
		    b_formation_lev := BFormationLev, tarname := TarName,
		    score_up := Up, unit_id := UnitId}) ->
    {ok, DefendList, BFormationType, BFormationLev, TarName,
     Up, UnitId};
check_cond([open | Rest], Role = #role{}, Arg = #{}) ->
    case is_open(Role) of
      {Period, 2, _EndTime} when Period =/= 0 ->
	  check_cond(Rest, Role, Arg);
      _ -> {false, lang:get(<<"活动暂未开启"/utf8>>)}
    end;
check_cond([time | Rest],
	   Role = #role{m_holiday_camp_war =
			    #m_holiday_camp_war{first_count = Count}},
	   Arg) ->
    case Count > 0 of
      true -> check_cond(Rest, Role, Arg);
      _ -> {false, lang:get(<<"挑战次数不足"/utf8>>)}
    end;
check_cond([formation | Rest], Role,
	   Arg = #{formation := FormationType, pos_info := PosInfo,
		   hallows_id := HallowsId}) ->
    case formation:check_formation_pos_info(Role,
					    FormationType, PosInfo, HallowsId,
					    40)
	of
      {false, Reason} -> {false, Reason};
      {ok, []} -> {false, lang:get(<<"至少需要上阵一个英雄"/utf8>>)};
      {ok, _NewPosInfo} -> check_cond(Rest, Role, Arg)
    end;
check_cond([defend | Rest],
	   Role = #role{id = RoleId,
			m_holiday_camp_war =
			    #m_holiday_camp_war{camp_id = CampId}},
	   Arg = #{id := Id}) ->
    {Period, _State, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    MainId = holiday_camp_war_db:get_main_id(RoleId,
					     Period),
    case catch cluster_lib:call(MainId,
				holiday_camp_war_mgr, call,
				[{apply_fort_unit_id, MainId, Id, CampId}])
	of
      {BossId, Up} when is_integer(BossId) ->
	  #unit_data{formation = {BFormationType, BFormationLev},
		     name = TarName} =
	      unit_data:get(BossId),
	  WorldLev = world_lev:get_world_lev(),
	  case unit_monster:gen_fight_objects(WorldLev, BossId) of
	    [] -> {false, lang:get(<<"怪物配置有问题"/utf8>>)};
	    [DefendList | _] ->
		check_cond(Rest, Role,
			   Arg#{defendlist => DefendList,
				b_formation_type => BFormationType,
				b_formation_lev => BFormationLev,
				tarname => TarName, score_up => Up,
				unit_id => BossId});
	    _ -> {false, lang:get(<<"怪物配置有问题"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"数据有误"/utf8>>)}
    end;
check_cond(_Rest, _Role, _Args) ->
    {false, lang:get(<<"战斗参数错误"/utf8>>)}.

-spec buy_fort_count(#role{}) -> {ok, #role{},
				  integer(), integer()} |
				 {false, string()}.

buy_fort_count(Role = #role{m_holiday_camp_war =
				MH = #m_holiday_camp_war{first_count =
							     OldFirstCount,
							 first_buy_count =
							     OldFirstBuyCount}}) ->
    case is_open(Role) of
      {Period, _State, _EndTime} when Period =/= 0 ->
	  LimitBuyCount =
	      holiday_camp_war_data:get_const(first_buy_count),
	  case OldFirstBuyCount >= LimitBuyCount of
	    false ->
		Expend =
		    holiday_camp_war_data:get_const(first_buy_expend),
		Loss = format:val_to_loss(Expend, first_buy_expend),
		case role_gain:do(Role, Loss) of
		  {ok, NRole = #role{}} ->
		      NewMH = MH#m_holiday_camp_war{first_count =
							OldFirstCount + 1,
						    first_buy_count =
							OldFirstBuyCount + 1},
		      NRole1 = NRole#role{m_holiday_camp_war = NewMH},
		      {ok, NRole1, OldFirstCount + 1,
		       LimitBuyCount - OldFirstBuyCount - 1};
		  _ -> {false, lang:get(<<"购买失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"超出购买上限"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动暂未开启"/utf8>>)}
    end.

-spec vote(#role{}, integer()) -> {ok, #role{}} |
				  {false, string()}.

vote(Role = #role{id = RoleId,
		  m_holiday_camp_war =
		      MH = #m_holiday_camp_war{camp_id = CampId,
					       vote_flag = VoteFlag}},
     Id) ->
    case is_open(Role) of
      {Period, 1, _EndTime} when Period =/= 0 ->
	  case VoteFlag of
	    0 ->
		MainId = holiday_camp_war_db:get_main_id(RoleId,
							 Period),
		cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
				 [{do_vote, RoleId, MainId, Id, CampId}]),
		NewMH = MH#m_holiday_camp_war{vote_flag = 1},
		NRole1 = Role#role{m_holiday_camp_war = NewMH},
		push_base(NRole1),
		log:save(join,
			 {Role, <<"阵营战"/utf8>>,
			  util:fbin(<<"参与投票玩家"/utf8>>, [])}),
		{ok, NRole1};
	    _ -> {false, lang:get(<<"今日已经投过票了哦"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"当前不可投票"/utf8>>)}
    end.

-spec push_day_change(#role{}) -> ok.

push_day_change(Role = #role{id = RoleId,
			     m_holiday_camp_war = #m_holiday_camp_war{}}) ->
    case is_open(Role) of
      {Period, _State, _EndTime} when Period =/= 0 ->
	  MainId = holiday_camp_war_db:get_main_id(RoleId,
						   Period),
	  cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
			   [{apply_push_day_change, RoleId, MainId}]),
	  ok;
      _ ->
	  sys_conn:pack_send(29306,
			     {0, lang:get(<<"活动未开启"/utf8>>), []}),
	  ok
    end.

-spec apply_push_day_change(#role{}, term()) -> ok.

apply_push_day_change(#role{m_holiday_camp_war =
				#m_holiday_camp_war{}},
		      {ChangeList}) ->
    sys_conn:pack_send(29306, {1, <<>>, ChangeList}), ok.

-spec enter(#role{}) -> ok.

enter(Role = #role{id = RoleId, power = Power,
		   m_holiday_camp_war =
		       MH = #m_holiday_camp_war{camp_id = CampId,
						last_camp = LastCamp}}) ->
    case is_open(Role) of
      {Period, _State, _EndTime} ->
	  NRole = #role{m_holiday_camp_war =
			    MH1 = #m_holiday_camp_war{enter_flag = EnterFlag}} =
		      case CampId =:= 0 of
			true ->
			    MainId = holiday_camp_war_db:get_main_id(RoleId,
								     Period),
			    NewCampId = case LastCamp =:= 0 of
					  true ->
					      case catch
						     cluster_lib:call(MainId,
								      holiday_camp_war_mgr,
								      call,
								      [{req_camp_id,
									Power,
									MainId}])
						  of
						GetCampId
						    when
						      is_integer(GetCampId) ->
						    GetCampId;
						_ -> 100
					      end;
					  _ ->
					      GetCampId = util:if_true(LastCamp
									 =:=
									 100,
								       200,
								       100),
					      cluster_lib:cast(MainId,
							       holiday_camp_war_mgr,
							       info,
							       [{sync_camp_id,
								 GetCampId,
								 Power,
								 MainId}]),
					      GetCampId
					end,
			    sys_conn:pack_send(29319, {NewCampId}),
			    NRole1 = Role#role{m_holiday_camp_war =
						   MH#m_holiday_camp_war{camp_id
									     =
									     NewCampId}},
			    holiday_camp_war_mgr:sync_role(NRole1),
			    cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
					     [{apply_push_base, RoleId,
					       NewCampId, MainId}]),
			    NRole1;
			_ -> Role
		      end,
	  case EnterFlag of
	    0 ->
		NewMH = MH1#m_holiday_camp_war{enter_flag = 1},
		NewRole1 = NRole#role{m_holiday_camp_war = NewMH},
		{PStartTime, PEndTime, _, _, _} =
		    holiday_camp_war_data:get_period(Period),
		DStartTime = date:parse_time(PStartTime) + 86400,
		FirstAccountTime =
		    date:parse_time(holiday_camp_war_data:get_first_accout(Period)),
		DEndTime = date:parse_time(PEndTime) - 86400,
		Now = date:unixtime(),
		case Now < DStartTime orelse
		       Now > FirstAccountTime andalso Now =< DEndTime
		    of
		  true -> skip;
		  _ -> push_day_change(NewRole1)
		end,
		log:save(join,
			 {NewRole1, <<"阵营战"/utf8>>,
			  util:fbin(<<"阵营战进入界面玩家"/utf8>>, [])}),
		NewRole1;
	    _ -> NRole
	  end;
      _ -> Role
    end.

init_period(Role = #role{m_holiday_camp_war =
			     MH = #m_holiday_camp_war{camp_id = OldCampId}},
	    Period) ->
    FirstCount =
	holiday_camp_war_data:get_const(first_free_count),
    SecondCount =
	holiday_camp_war_data:get_const(second_free_count),
    NewMH = MH#m_holiday_camp_war{period = Period,
				  camp_id = 0,
				  old_data =
				      MH#m_holiday_camp_war{old_data = []},
				  last_camp = OldCampId, ref_count = 0,
				  atk_defens = [], def_defens = [],
				  end_time = 0, is_enter = 0, enter_flag = 0,
				  vote_flag = 0, first_flag = 0,
				  first_count = FirstCount, first_buy_count = 0,
				  second_count = SecondCount,
				  second_buy_count = 0},
    Role#role{m_holiday_camp_war = NewMH}.

is_open(Role = #role{id = RoleId}) ->
    Now = date:unixtime(),
    OpenTime = holiday_camp_war_data:period_list(),
    SrvOpenDay = date:open_srv_day(),
    SrvOpenTime = sys_env:get(open_timestamp),
    SrvId = sys_lib:srv_id(),
    {SrvPeriod, OldState, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    case is_open_time(Role, OpenTime, Now, SrvOpenDay,
		      SrvOpenTime)
	of
      {true, Period, _StartTime, EndTime}
	  when SrvPeriod =:= Period ->
	  MainId = holiday_camp_war_db:get_main_id(RoleId,
						   Period),
	  case ets:lookup(srv_id, MainId) of
	    [{_, _MainSrvId, _Node}] -> {Period, OldState, EndTime};
	    _ when SrvId =:= MainId -> {Period, OldState, EndTime};
	    _ -> false
	  end;
      _ -> false
    end.

is_open_time(_Role, [], _Now, _SrvOpenDay,
	     _SrvOpenTime) ->
    false;
is_open_time(Role,
	     [{Period, StartTime, EndTime, OpenCond, OpenDay,
	       OpenTime}
	      | Other],
	     Now, SrvOpenDay, SrvOpenTime) ->
    Time1 = date:parse_time(StartTime) -
	      holiday_mgr:get_holiday_sec(),
    Time2 = date:parse_time(EndTime) -
	      holiday_mgr:get_holiday_sec(),
    case role_misc:check_open_cond(OpenCond, Role) of
      true ->
	  case Now >= Time1 andalso
		 Now =< Time2 andalso
		   SrvOpenDay >= OpenDay andalso
		     SrvOpenTime =< date:parse_time(OpenTime)
	      of
	    true -> {true, Period, Time1, Time2};
	    _ ->
		is_open_time(Role, Other, Now, SrvOpenDay, SrvOpenTime)
	  end;
      _ -> false
    end.


