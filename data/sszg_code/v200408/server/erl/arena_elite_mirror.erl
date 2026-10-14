-file("arena_elite_mirror.erl", 1).

-module(arena_elite_mirror).

-lager_records([{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]},
		{sprite_plan, [ver, id, name, plan_sprites]},
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
		{guild_log, [key, list]}, {m_look, [use_id, list]},
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
		{m_arena_elite_war_order,
		 [ver, period, period_day, end_time, win_count,
		  rmb_status, card, lev_reward, start_time, ext]},
		{arena_replay_partner, [pos, bid, lev, star, ext]},
		{arena_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_elite_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_elite_lev, def_id, def_name, def_face, def_lev,
		  def_rank, def_elite_lev, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_elite_log, [id, list]},
		{arena_elite_rank,
		 [ver, rank, id, name, power, lev, face, look_id, score,
		  elite_lev, time, avatar_id, face_update_time,
		  face_file]},
		{arena_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, dower_skill,
		  set_skill, attr, extra]},
		{arena_elite_rival_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  extra]},
		{c_e_role,
		 [ver, id, name, power, lev, face, look_id, score,
		  elite_lev, avatar_id, is_king, match_power, all_star,
		  win_rio, zid, face_update_time, face_file]},
		{arena_elite_role,
		 [ver, id, name, lev, sex, gid, gname, face, power,
		  look_id, score, elite_lev, time, avatar_id, is_king,
		  defense, manifesto, face_update_time, face_file,
		  break_groups]},
		{c_elite_srv_info,
		 [type, sid, num, world_lev, open_time, merge_srvs]},
		{m_arena_elite_defens, [type, formations]},
		{m_arena_elite_log,
		 [ver, period, max_lev, max_score, combat_win_count1,
		  combat_all_count1, combat_win_count2, combat_all_count2,
		  max_dps, mvp_info, winning_streak, winning_streak_now,
		  beast_rivl_info, extra, log_zone_id, log_rank]},
		{arena_elite_role_best,
		 [id, name, lev, sex, gid, gname, face, power, look_id,
		  score, elite_lev, time, avatar_id, is_king, extra,
		  face_update_time, face_file]},
		{m_arena_elite,
		 [ver, lev, init_lev, period, score, day_combat_count,
		  day_buy_count, frist_ref_time, ref_count, match_cd_time,
		  had_combat_num, acc_combat_num, lev_reward,
		  last_combat_id, promoted_info, rival_info, defens,
		  old_rank, day_point_count, log, extra, last_reset_time,
		  max_day_buy_count, is_skip]},
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

-export([update_mirror/1, get_mirror/1, do_ver/1]).

-file("/sszg_code/server/inc/common.hrl", 1).

-file("/sszg_code/server/inc/lib_log.hrl", 1).

-file("/sszg_code/server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("arena_elite_mirror.erl", 13).

-file("/sszg_code/server/inc/role.hrl", 1).

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

-file("arena_elite_mirror.erl", 14).

-file("/sszg_code/server/inc/arena_elite.hrl", 1).

-record(m_arena_elite,
	{ver = 6, lev = 1, init_lev = 1, period = 0, score = 0,
	 day_combat_count = 0, day_buy_count = 0,
	 frist_ref_time = 0, ref_count = 0, match_cd_time = 0,
	 had_combat_num = 0, acc_combat_num = 0, lev_reward = [],
	 last_combat_id = {0, <<>>}, promoted_info = [],
	 rival_info = [], defens = [], old_rank = [],
	 day_point_count = [], log = [], extra = [],
	 last_reset_time = 0, max_day_buy_count = 0,
	 is_skip = 0}).

-record(arena_elite_role_best,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = [],
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, extra = [],
	 face_update_time = 0, face_file = <<>>}).

-record(m_arena_elite_log,
	{ver = 2, period = 0, max_lev = 1, max_score = 1000,
	 combat_win_count1 = 0, combat_all_count1 = 0,
	 combat_win_count2 = 0, combat_all_count2 = 0,
	 max_dps = 0, mvp_info = [], winning_streak = 0,
	 winning_streak_now = 0,
	 beast_rivl_info = #arena_elite_role_best{}, extra = [],
	 log_zone_id = 0, log_rank = 0}).

-record(m_arena_elite_defens,
	{type = 1, formations = []}).

-record(c_elite_srv_info,
	{type = 1, sid = <<>>, num = 0, world_lev = 0,
	 open_time = 0, merge_srvs = []}).

-record(arena_elite_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, defense = [],
	 manifesto = [], face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(c_e_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, power = 0,
	 lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, avatar_id = 0, is_king = 0,
	 match_power = 1, all_star = 1, win_rio = 1, zid = 1,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_elite_rival_defense,
	{order, formation_type, hallows_id, hallows_lev,
	 hallows_skill_lev, partner_infos, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = []}).

-record(arena_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(arena_elite_rank,
	{ver = 2, rank = 0, id = {0, <<>>}, name = <<>>,
	 power = 0, lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, time = 0, avatar_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(role_arena_elite_log,
	{id = {0, <<>>}, list = []}).

-record(arena_elite_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0,
	 atk_elite_lev = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_face = 0, def_lev = 0, def_rank = 0,
	 def_elite_lev = 0, ret = 1, win_count = 0,
	 lose_count = 0, combat_type = 0, replay_list = [],
	 time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(m_arena_elite_war_order,
	{ver = 2, period = 0, period_day = 0, end_time = 0,
	 win_count = 0, rmb_status = 0, card = [],
	 lev_reward = [], start_time = 0, ext = []}).

-file("arena_elite_mirror.erl", 15).

-file("/sszg_code/server/inc/partner.hrl", 1).

-file("/sszg_code/server/inc/attr.hrl", 1).

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

-file("/sszg_code/server/inc/partner.hrl", 11).

-file("/sszg_code/server/inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("/sszg_code/server/inc/partner.hrl", 12).

-file("/sszg_code/server/inc/common.hrl", 1).

-file("/sszg_code/server/inc/partner.hrl", 13).

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

-file("arena_elite_mirror.erl", 16).

-file("/sszg_code/server/inc/formation.hrl", 1).

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

-file("arena_elite_mirror.erl", 17).

-file("/sszg_code/server/inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("arena_elite_mirror.erl", 18).

-file("/sszg_code/server/inc/guild.hrl", 1).

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

-file("arena_elite_mirror.erl", 19).

-file("/sszg_code/server/inc/combat.hrl", 1).

-file("/sszg_code/server/inc/common.hrl", 1).

-file("/sszg_code/server/inc/combat.hrl", 13).

-file("/sszg_code/server/inc/attr.hrl", 1).

-file("/sszg_code/server/inc/combat.hrl", 14).

-file("/sszg_code/server/inc/skill.hrl", 1).

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

-file("/sszg_code/server/inc/combat.hrl", 15).

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

-file("arena_elite_mirror.erl", 20).

-file("/sszg_code/server/inc/sprite.hrl", 1).

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

-file("arena_elite_mirror.erl", 21).

-file("/sszg_code/server/inc/guild_skill.hrl", 1).

-record(m_guild_skill,
	{ver = 2  :: pos_integer(), groups = []  :: list(),
	 break_groups = []  :: list()}).

-record(guild_skill_group,
	{ver = 1, career = 0, group_id = 0, skill_ids = [],
	 group_ids = []}).

-record(guild_skill_break_group,
	{ver = 1  :: pos_integer(),
	 career = 0  :: pos_integer(),
	 attr_formation = []  :: list(),
	 skill_formation = {0, 0}  :: tuple(),
	 ext = []  :: list()}).

-file("arena_elite_mirror.erl", 22).

do_ver({arena_elite_role, Ver = 1, Id, Name, Lev, Sex,
	Gid, Gname, Face, Power, LookId, Score, EliteLev, Time,
	AvatarId, IsKing, Defense}) ->
    Manifesto = [],
    do_ver({arena_elite_role, Ver + 1, Id, Name, Lev, Sex,
	    Gid, Gname, Face, Power, LookId, Score, EliteLev, Time,
	    AvatarId, IsKing, Defense, Manifesto});
do_ver({arena_elite_role, Ver = 2, Id, Name, Lev, Sex,
	Gid, Gname, Face, Power, LookId, Score, EliteLev, Time,
	AvatarId, IsKing, Defense, Manifesto}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    do_ver({arena_elite_role, Ver + 1, Id, Name, Lev, Sex,
	    Gid, Gname, Face, Power, LookId, Score, EliteLev, Time,
	    AvatarId, IsKing, Defense, Manifesto, FaceUpdateTime,
	    FaceFile});
do_ver({arena_elite_role, Ver = 3, Id, Name, Lev, Sex,
	Gid, Gname, Face, Power, LookId, Score, EliteLev, Time,
	AvatarId, IsKing, Defense, Manifesto, FaceUpdateTime,
	FaceFile}) ->
    BreakGroups = [],
    do_ver({arena_elite_role, Ver + 1, Id, Name, Lev, Sex,
	    Gid, Gname, Face, Power, LookId, Score, EliteLev, Time,
	    AvatarId, IsKing, Defense, Manifesto, FaceUpdateTime,
	    FaceFile, BreakGroups});
do_ver(Data = #arena_elite_role{ver = 4,
				defense = Defense}) ->
    NewDefense = [{Type,
		   [do_defense_ver(DefenseT2) || DefenseT2 <- DefenseT]}
		  || {Type, DefenseT} <- Defense],
    Data#arena_elite_role{defense = NewDefense}.

do_defense_ver({arena_elite_rival_defense, Order,
		FormationType, HallowsId, HallowsLev, HallowsSkillLev,
		PartnerInfos}) ->
    HallowsLookId = 0,
    HallowsLucky = 0,
    HallowsSeal = 0,
    HallowsAllLookIds = [],
    Extra = [],
    do_defense_ver({arena_elite_rival_defense, Order,
		    FormationType, HallowsId, HallowsLev, HallowsSkillLev,
		    PartnerInfos, HallowsLookId, HallowsLucky, HallowsSeal,
		    HallowsAllLookIds, Extra});
do_defense_ver(Data = #arena_elite_rival_defense{}) ->
    Data;
do_defense_ver(Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mirror50, _,
       {__Levelarena_elite_mirror50,
	__Tracesarena_elite_mirror50}}
	  when __Levelarena_elite_mirror50 band 8 /= 0 orelse
		 __Tracesarena_elite_mirror50 /= [] ->
	  lager:do_log(error,
		       [{module, arena_elite_mirror},
			{function, do_defense_ver}, {line, 50},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误的精英赛布阵镜像数据:~w", [Data]), none, 4096, 8,
		       __Levelarena_elite_mirror50,
		       __Tracesarena_elite_mirror50, lager_event,
		       __Pidarena_elite_mirror50);
      _ -> ok
    end,
    Data.

-spec get_mirror(role_id()) -> #arena_elite_role{} |
			       false.

get_mirror(Id) ->
    case ets:lookup(arena_elite_mirror, Id) of
      [R = #arena_elite_role{} | _] -> R;
      _ -> false
    end.

-spec update_mirror(#role{}) -> ok.

update_mirror(Role = #role{id = Id}) ->
    {OldNormalDefens, OldNormalPower, OldKingDefens,
     OldKingPower} =
	get_mirror_defense(Id),
    {NormalDefens, NormalPower, KingDefens, KingPower} =
	to_arena_elite_defens(Role),
    LimitMirrorPowerRio =
	arena_elite_data:get_constant(update_mirror_battlenum_condition),
    LimitPower = util:ceil(OldNormalPower *
			     LimitMirrorPowerRio
			     * 1.0e-3),
    NewNormalDefens = util:if_true(NormalPower >=
				     LimitPower,
				   NormalDefens, OldNormalDefens),
    LimitPower2 = util:ceil(OldKingPower *
			      LimitMirrorPowerRio
			      * 1.0e-3),
    NewKingDefens = util:if_true(KingPower >= LimitPower2,
				 KingDefens, OldKingDefens),
    case NewNormalDefens == OldNormalDefens andalso
	   NewKingDefens == OldKingDefens
	of
      true -> ok;
      _ ->
	  CRole = to_arena_role(Role, NewNormalDefens,
				NewKingDefens),
	  ets:insert(arena_elite_mirror, CRole),
	  dets:insert(arena_elite_mirror, CRole)
    end.

get_mirror_defense(Id) ->
    Defense = util:ets_lookup_element(arena_elite_mirror,
				      Id, #arena_elite_role.defense, []),
    {NormalDefens, NormalPower} = get_power(1, Defense),
    {KingDefens, KingPower} = get_power(2, Defense),
    {NormalDefens, NormalPower, KingDefens, KingPower}.

get_power(Type, Defense) ->
    case lists:keyfind(Type, 1, Defense) of
      {_, L} ->
	  Power = lists:sum([lists:sum([PowerT
					|| #arena_partners_info{power = PowerT}
					       <- PosInfos])
			     || #arena_elite_rival_defense{partner_infos =
							       PosInfos}
				    <- L]),
	  {L, Power};
      _ -> {[], 0}
    end.

to_arena_elite_defens(R = #role{m_sprite_tree =
				    #m_sprite_tree{all_attr = SpriteAttr,
						   break_lev = SpriteBreak},
				partner_bag =
				    #partner_bag{partner_list = PList}}) ->
    NormalDefens = get_defens(R, 1),
    KingDefens = get_defens(R, 2),
    Fun = fun ({Order, FormationType, PosInfo, HallowsId},
	       {Acc, Acc2, SpriteFormationType}) ->
		  case [P
			|| P <- PosInfo,
			   lists:keymember(P#formation_pos.id, #partner.id,
					   PList)]
		      of
		    [] -> {Acc, Acc2, SpriteFormationType};
		    NewPosInfo ->
			{SpriteLev, Sprites} = sprite_tree:get_sprite_lev(R,
									  SpriteFormationType,
									  Order),
			DefenseT = [to_arena_elite_partner(Pos,
							   lists:keyfind(PartnerId,
									 #partner.id,
									 PList))
				    || #formation_pos{pos = Pos, id = PartnerId}
					   <- NewPosInfo],
			{HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
			 HallowsLookIds, HallowsLucky, HallowsSeal} =
			    hallows_lib:get_hallows_info2(R, HallowsId),
			PowerT = lists:sum([PowerTemp
					    || #arena_partners_info{power =
									PowerTemp}
						   <- DefenseT]),
			HallowRefine = hallows_lib:get_hallows_refine(R,
								      HallowsId),
			Extra = [{1, HallowRefine},
				 {2,
				  {SpriteLev, SpriteBreak, SpriteAttr,
				   Sprites}}],
			Type = #arena_elite_rival_defense{order = Order,
							  formation_type =
							      FormationType,
							  hallows_id =
							      HallowsId,
							  hallows_lev =
							      HallowsLev,
							  hallows_skill_lev =
							      HallowsSkillLev,
							  partner_infos =
							      DefenseT,
							  hallows_look_id =
							      HallowsLookId,
							  hallows_all_look_ids =
							      HallowsLookIds,
							  hallows_lucky =
							      HallowsLucky,
							  hallows_seal =
							      HallowsSeal,
							  extra = Extra},
			{[Type | Acc], Acc2 + PowerT, SpriteFormationType}
		  end
	  end,
    {NormalDefens2, NormalPower, _} = lists:foldl(Fun,
						  {[], 0, 93}, NormalDefens),
    {KingDefens2, KingPower, _} = lists:foldl(Fun,
					      {[], 0, 99}, KingDefens),
    {NormalDefens2, NormalPower, KingDefens2, KingPower}.

get_defens(Role = #role{m_arena_elite =
			    #m_arena_elite{defens = Defens}},
	   Type) ->
    case lists:keyfind(Type, #m_arena_elite_defens.type,
		       Defens)
	of
      #m_arena_elite_defens{formations = Formations} ->
	  PushFormations = [{OrderT, FormationTypeT,
			     [Temp
			      || Temp = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(Role, IdT) =/= false],
			     HallowsIdT}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
				   <- Formations],
	  case [1 || E <- PushFormations, element(3, E) =/= []] of
	    [_ | _] -> PushFormations;
	    _ ->
		#formation_lineup{pos_info = PosInfo,
				  type = FormationType,
				  hallows_id = HallowsId} =
		    formation_lib:query_formation_info_without_resonate(Role),
		Formations1 = [{1, FormationType, PosInfo, HallowsId}],
		PushFormations1 = [{OrderT, FormationTypeT,
				    [Temp
				     || Temp = #formation_pos{id = IdT}
					    <- PosInfoT,
					partner_lib:get_partner(Role, IdT) =/=
					  false],
				    HallowsIdT}
				   || {OrderT, FormationTypeT, PosInfoT,
				       HallowsIdT}
					  <- Formations1],
		PushFormations1
	  end;
      _ when Type == 1 ->
	  #formation_lineup{pos_info = PosInfo,
			    type = FormationType, hallows_id = HallowsId} =
	      formation_lib:query_formation_info_without_resonate(Role),
	  Formations = [{1, FormationType, PosInfo, HallowsId}],
	  PushFormations = [{OrderT, FormationTypeT,
			     [Temp
			      || Temp = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(Role, IdT) =/= false],
			     HallowsIdT}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
				   <- Formations],
	  PushFormations;
      _ ->
	  Formations = get_defens(Role, 1),
	  PushFormations = [{OrderT, FormationTypeT,
			     [Temp
			      || Temp = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(Role, IdT) =/= false],
			     HallowsIdT}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
				   <- Formations],
	  PushFormations
    end.

to_arena_elite_partner(Pos, P) ->
    #arena_partners_info{pos = Pos, id = P#partner.id,
			 bid = P#partner.bid, lev = P#partner.lev,
			 star = P#partner.star, break_lev = P#partner.break_lev,
			 dower_skill = P#partner.dower_skill,
			 power = P#partner.power, attr = P#partner.all_attr,
			 set_skill = P#partner.set_skills,
			 extra = [{5, P#partner.use_skin}]}.

to_arena_role(R = #role{m_look =
			    #m_look{use_id = UseId},
			guild_bag = #guild_bag{id = Gid, name = GName},
			m_arena_elite =
			    #m_arena_elite{lev = EliteLev, score = Score},
			m_guild_skill =
			    #m_guild_skill{break_groups = BreakGroups}},
	      NormalDefens, KingDefens) ->
    Defense = [{1, NormalDefens}, {2, KingDefens}],
    {_, FaceFile, FaceUpdateTime} = role_face:face_info(R),
    #arena_elite_role{id = R#role.id, name = R#role.name,
		      lev = R#role.lev, sex = R#role.sex, gid = Gid,
		      gname = GName, face = R#role.face_id,
		      score =
			  arena_elite_data:get_all_score(EliteLev) + Score,
		      elite_lev = EliteLev, look_id = UseId,
		      defense = Defense,
		      manifesto = arena_elite_manifesto:get_manifesto(R),
		      face_update_time = FaceUpdateTime, face_file = FaceFile,
		      break_groups = BreakGroups}.


