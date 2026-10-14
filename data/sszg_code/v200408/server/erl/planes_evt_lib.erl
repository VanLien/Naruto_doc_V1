-file("src/mod/planes/planes_evt_lib.erl", 1).

-module(planes_evt_lib).

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
		{arena_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power, type,
		  ret, replay_id, score, time, face_update_time,
		  face_file]},
		{arena_role_log, [id, logs]},
		{arena_rank, [rank, id, score]},
		{arena_role,
		 [id, name, lev, sex, gid, gname, face, power, max_power,
		  lookid, score, rank, time, avatar_id, champion_power,
		  face_update_time, face_file]},
		{arena_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{arena_f,
		 [id, name, idx, lev, sex, face, power, status,
		  formation_type, formation_lev, pos_info, robot_id,
		  avatar_id, face_update_time, face_file, gid, gname]},
		{m_arena,
		 [ver, ref_time, ref_list, cont_win, buff_id,
		  season_ref_time, can_combat_num, had_combat_num,
		  buy_combat_num, acc_combat_num, season_reward]},
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

-export([collective_reply/3, combat/6,
	 do_match_by_power/4, combat_over/4, hide/3, do_reward/3,
	 exchange_tile/3, walk_floor/3, buff_special_ext/2,
	 get_name/1, gen_objects/1]).

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

-file("src/mod/planes/planes_evt_lib.erl", 21).

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

-file("src/mod/planes/planes_evt_lib.erl", 22).

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

-file("src/mod/planes/planes_evt_lib.erl", 23).

-file("inc/planes.hrl", 1).

-file("inc/attr.hrl", 1).

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

-file("src/mod/planes/planes_evt_lib.erl", 24).

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

-file("src/mod/planes/planes_evt_lib.erl", 25).

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

-file("src/mod/planes/planes_evt_lib.erl", 26).

-file("inc/arena.hrl", 1).

-record(m_arena,
	{ver = 1, ref_time = 0, ref_list = [], cont_win = 0,
	 buff_id = 0, season_ref_time = 0, can_combat_num = 0,
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, season_reward = []}).

-record(arena_f,
	{id = {0, <<>>}, name = <<>>, idx = 0, lev = 0, sex = 0,
	 face = 0, power = 0, status = 0, formation_type = 0,
	 formation_lev = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, face_update_time = 0, face_file = <<>>,
	 gid = {0, <<>>}, gname = <<>>}).

-record(arena_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext}).

-record(arena_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, champion_power = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_role_log, {id = {0, <<>>}, logs = []}).

-record(arena_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, type = 1, ret = 1,
	 replay_id = 0, score = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/planes/planes_evt_lib.erl", 27).

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

-file("src/mod/planes/planes_evt_lib.erl", 28).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/planes/planes_evt_lib.erl", 29).

-file("inc/game_assets.hrl", 1).

-file("src/mod/planes/planes_evt_lib.erl", 30).

get_name(Type) ->
    case Type of
      0 -> <<"空事件"/utf8>>;
      1 -> <<"怪物"/utf8>>;
      2 -> <<"守卫"/utf8>>;
      3 -> <<"复活泉"/utf8>>;
      5 -> <<"英雄租借"/utf8>>;
      7 -> <<"商人"/utf8>>;
      6 -> <<"遗物"/utf8>>;
      4 -> <<"复活祭坛"/utf8>>;
      _ -> <<"未知事件"/utf8>>
    end.

hide(PlanesFloor, 0, _Label) -> {PlanesFloor, []};
hide(PlanesFloor = #planes_floor{tile_list = TileList},
     GroupId, Label) ->
    {NewTileList, ChangeTileList} = do_hide(TileList,
					    GroupId, [], [], Label),
    NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
						  NewTileList},
    {NewPlanesFloor, ChangeTileList}.

do_reward(Role, [], _Type) -> Role;
do_reward(Role = #role{lev = Lev}, [Id | Rest], Type) ->
    case planes_data:get_reward({Id, Lev}) of
      {1, RewardList} when is_list(RewardList) ->
	  NewItems = case planes:is_open_holiday(Role) of
		       1 ->
			   AddItems = [{ItemId1, util:ufloor(Num1 * 1.0e-1)}
				       || {ItemId1, Num1} <- RewardList,
					  ItemId1 =:= 25],
			   item_lib:merge(AddItems, RewardList);
		       _ -> RewardList
		     end,
	  Gain = format:val_to_gain(NewItems, planes),
	  case Type =:= 1 orelse Type =:= 2 of
	    true ->
		case role_gain:do(Role, Gain) of
		  {ok, GainRole} ->
		      log:log_gain(Gain, Role, GainRole, <<"位面探险"/utf8>>,
				   <<"获得奖励"/utf8>>),
		      do_reward(GainRole, Rest, Type);
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
			{__Pidplanes_evt_lib83, _,
			 {__Levelplanes_evt_lib83, __Tracesplanes_evt_lib83}}
			    when __Levelplanes_evt_lib83 band 64 /= 0 orelse
				   __Tracesplanes_evt_lib83 /= [] ->
			    lager:do_log(info,
					 [{module, planes_evt_lib},
					  {function, do_reward}, {line, 83},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("奖励获得失败玩家~ts 事件类型~w, 奖励id~w",
						       [Role#role.name, Type,
							Id]),
					 none, 4096, 64,
					 __Levelplanes_evt_lib83,
					 __Tracesplanes_evt_lib83, lager_event,
					 __Pidplanes_evt_lib83);
			_ -> ok
		      end,
		      do_reward(Role, Rest, Type)
		end;
	    _ ->
		case role_gain:do_notice(Role, Gain) of
		  {ok, GainRole} ->
		      log:log_gain(Gain, Role, GainRole, <<"位面探险"/utf8>>,
				   <<"获得奖励"/utf8>>),
		      do_reward(GainRole, Rest, Type);
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
			{__Pidplanes_evt_lib92, _,
			 {__Levelplanes_evt_lib92, __Tracesplanes_evt_lib92}}
			    when __Levelplanes_evt_lib92 band 64 /= 0 orelse
				   __Tracesplanes_evt_lib92 /= [] ->
			    lager:do_log(info,
					 [{module, planes_evt_lib},
					  {function, do_reward}, {line, 92},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("奖励获得失败玩家~ts 事件类型~w, 奖励id~w",
						       [Role#role.name, Type,
							Id]),
					 none, 4096, 64,
					 __Levelplanes_evt_lib92,
					 __Tracesplanes_evt_lib92, lager_event,
					 __Pidplanes_evt_lib92);
			_ -> ok
		      end,
		      do_reward(Role, Rest, Type)
		end
	  end;
      {2, DropList} when is_list(DropList) ->
	  RewardList = case drop_lib:common_drop(Role, DropList)
			   of
			 [{_, DropItems, _, _}] ->
			     [{Bid, Val} || {Bid, _, Val} <- DropItems];
			 _ -> []
		       end,
	  Gain = format:val_to_gain(RewardList, planes),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, GainRole} ->
		log:log_gain(Gain, Role, GainRole, <<"位面探险"/utf8>>,
			     <<"获得奖励"/utf8>>),
		do_reward(GainRole, Rest, Type);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidplanes_evt_lib110, _,
		   {__Levelplanes_evt_lib110, __Tracesplanes_evt_lib110}}
		      when __Levelplanes_evt_lib110 band 64 /= 0 orelse
			     __Tracesplanes_evt_lib110 /= [] ->
		      lager:do_log(info,
				   [{module, planes_evt_lib},
				    {function, do_reward}, {line, 110},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("奖励获得失败玩家~ts 事件类型~w, 奖励id~w",
						 [Role#role.name, Type, Id]),
				   none, 4096, 64, __Levelplanes_evt_lib110,
				   __Tracesplanes_evt_lib110, lager_event,
				   __Pidplanes_evt_lib110);
		  _ -> ok
		end,
		do_reward(Role, Rest, Type)
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
	    {__Pidplanes_evt_lib114, _,
	     {__Levelplanes_evt_lib114, __Tracesplanes_evt_lib114}}
		when __Levelplanes_evt_lib114 band 64 /= 0 orelse
		       __Tracesplanes_evt_lib114 /= [] ->
		lager:do_log(info,
			     [{module, planes_evt_lib}, {function, do_reward},
			      {line, 114}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("奖励配置错误玩家~ts 事件类型~w, 奖励id~w",
					   [Role#role.name, Type, Id]),
			     none, 4096, 64, __Levelplanes_evt_lib114,
			     __Tracesplanes_evt_lib114, lager_event,
			     __Pidplanes_evt_lib114);
	    _ -> ok
	  end,
	  do_reward(Role, Rest, Type)
    end;
do_reward(Role, _RewardList, _Type) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidplanes_evt_lib118, _,
       {__Levelplanes_evt_lib118, __Tracesplanes_evt_lib118}}
	  when __Levelplanes_evt_lib118 band 64 /= 0 orelse
		 __Tracesplanes_evt_lib118 /= [] ->
	  lager:do_log(info,
		       [{module, planes_evt_lib}, {function, do_reward},
			{line, 118}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("奖励配置错误玩家~ts 事件类型~w",
				     [Role#role.name, _Type]),
		       none, 4096, 64, __Levelplanes_evt_lib118,
		       __Tracesplanes_evt_lib118, lager_event,
		       __Pidplanes_evt_lib118);
      _ -> ok
    end,
    Role.

exchange_tile(PlanesFloor, PlanesTile, ExchangeId) ->
    NewPlanesTile = PlanesTile#planes_tile{combat_power = 0,
					   evt_id = ExchangeId, ext = [],
					   defend_radio = [], is_walk = 0,
					   is_hide = 0, is_business = 0},
    case planes_data:get_event_type(ExchangeId) of
      6 ->
	  NewPlanesFloor = PlanesFloor#planes_floor{is_treasure =
							1},
	  {NewPlanesFloor, NewPlanesTile};
      _ -> {PlanesFloor, NewPlanesTile}
    end.

walk_floor(PlanesFloor = #planes_floor{tile_list =
					   TileList,
				       floor = Floor, difficulty = Difficulty,
				       fight_ids = FightIds},
	   PlanesTile = #planes_tile{evt_id = 0,
				     label = {Line, Index}},
	   Role = #role{max_power = MaxPower}) ->
    ShowLine = 2 + Line,
    put(fight_ids, FightIds),
    {NewTileList, PushTileList} = show_combat_tile(TileList,
						   ShowLine, [], [], Role,
						   Floor, Difficulty),
    NewFightIds = case get(fight_ids) of
		    FightIds1 when is_list(FightIds1) -> FightIds1;
		    _ -> []
		  end,
    NewPlanesFloor = PlanesFloor#planes_floor{line = Line,
					      index = Index,
					      tile_list = NewTileList,
					      fight_ids = NewFightIds},
    NewPlanesTile = PlanesTile#planes_tile{is_walk = 1},
    log:save(join,
	     {Role, <<"新版位面"/utf8>>,
	      util:fbin(<<"完成~w层-~w行-~w"/utf8>>,
			[Floor, Line, Difficulty]),
	      1, MaxPower}),
    {NewPlanesFloor, NewPlanesTile, PushTileList};
walk_floor(PlanesFloor, PlanesTile, _Role) ->
    {PlanesFloor, PlanesTile, []}.

show_combat_tile([], _ShowLine, TileList, PushList,
		 _Role, _Floor, _Difficulty) ->
    {TileList, PushList};
show_combat_tile([Tile = #planes_tile{label =
					  {TileLine, _},
				      ext = [], evt_id = EvtId}
		  | Rest],
		 ShowLine, TileList, PushList, Role, Floor, Difficulty)
    when TileLine + 1 =:= ShowLine orelse
	   TileLine =:= ShowLine ->
    case planes_data:get_evt(EvtId) of
      #planes_evt_data{type = 1} ->
	  case planes:get_monster_tile(Tile, Role) of
	    NewTile = #planes_tile{} ->
		show_combat_tile(Rest, ShowLine, [NewTile | TileList],
				 [NewTile | PushList], Role, Floor, Difficulty);
	    _ ->
		show_combat_tile(Rest, ShowLine, [Tile | TileList],
				 PushList, Role, Floor, Difficulty)
	  end;
      _ ->
	  show_combat_tile(Rest, ShowLine, [Tile | TileList],
			   PushList, Role, Floor, Difficulty)
    end;
show_combat_tile([Tile | Rest], ShowLine, TileList,
		 PushList, Role, Floor, Difficulty) ->
    show_combat_tile(Rest, ShowLine, [Tile | TileList],
		     PushList, Role, Floor, Difficulty);
show_combat_tile(Rest, _ShowLine, TileList, PushList,
		 _Role, _Floor, _Difficulty) ->
    {Rest ++ TileList, PushList}.

collective_reply(_, [], PushList) -> {[], PushList};
collective_reply([], PartnerList, PushList) ->
    {PartnerList, PushList};
collective_reply([{revive, ReviveRadio, AddRadio}
		  | Rest],
		 PartnerList, PushList) ->
    {_MaxHpPartnerList, HurtPartnerList, DiedPartnerList} =
	filter_partner(PartnerList, [], [], []),
    case DiedPartnerList of
      [] ->
	  case HurtPartnerList of
	    [] -> collective_reply(Rest, PartnerList, PushList);
	    _ ->
		case lists:keysort(2, HurtPartnerList) of
		  [{PartnerId, HpRadio} | _] ->
		      NewPartner = {PartnerId, min(100, HpRadio + AddRadio)},
		      NewPartnerList = lists:keyreplace(PartnerId, 1,
							PartnerList,
							NewPartner),
		      collective_reply(Rest, NewPartnerList,
				       [NewPartner | PushList]);
		  _ -> {false, lang:get(<<"没有英雄可选"/utf8>>)}
		end
	  end;
      _ ->
	  case util:rand_list(DiedPartnerList) of
	    {PartnerId, HpRadio} ->
		NewPartner = {PartnerId,
			      min(100, HpRadio + ReviveRadio)},
		NewPartnerList = lists:keyreplace(PartnerId, 1,
						  PartnerList, NewPartner),
		collective_reply(Rest, NewPartnerList,
				 [NewPartner | PushList]);
	    _ -> {false, lang:get(<<"没有英雄可选"/utf8>>)}
	  end
    end;
collective_reply([{all_add_hp, Radio} | Rest],
		 PartnerList, PushList) ->
    {_MaxHpPartnerList, HurtPartnerList, _DiedPartnerList} =
	filter_partner(PartnerList, [], [], []),
    case HurtPartnerList of
      [] -> collective_reply(Rest, PartnerList, PushList);
      _ ->
	  {NewPartnerList, AddPushList} = add_hp(HurtPartnerList,
						 PartnerList, Radio, []),
	  collective_reply(Rest, NewPartnerList,
			   AddPushList ++ PushList)
    end;
collective_reply([_ | _Rest], _PartnerList, _) ->
    {false, lang:get(<<"没有该类型的恢复"/utf8>>)};
collective_reply(_, _PartnerList, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_match_by_power(MinPower, MaxPower, FightIds,
		  RoleLev) ->
    Fun = [{{arena_role, '_', '_', '_', '_', '_', '_', '_',
	     '$1', '_', '_', '_', '_', '_', '_', '_', '_', '_'},
	    [{'andalso', {'>=', '$1', {const, MinPower}},
	      {'=<', '$1', {const, MaxPower}}}],
	    ['$_']}],
    case ets:select(arena_role, Fun, 10) of
      {L1, _} ->
	  case [{ArenaId, ArenaName}
		|| #arena_role{id = ArenaId, name = ArenaName} <- L1,
		   not lists:member(ArenaId, FightIds)]
	      of
	    L2 = [_ | _] ->
		filter_guard_max_arena_robot(L2, RoleLev);
	    _ -> false
	  end;
      _ -> false
    end.

combat(Role, Planes,
       PlanesFloor = #planes_floor{floor = Floor},
       PlanesTile = #planes_tile{label = Label}, Ext,
       EvtData = #planes_evt_data{ext = DataExt}) ->
    case check_combat([time, formation, partner, defend,
		       fight],
		      Role, Planes, PlanesFloor, PlanesTile, Ext,
		      #{ext => DataExt})
	of
      {ok, AtkGroup0, DefendList, BFormationType, TarName,
       NewFormationType, NewHallowsId, PosInfo, AllSkills} ->
	  FormationLev = formation_lib:get_formation_lev(Role,
							 NewFormationType),
	  AtkGroup = sprite_tree:gen_fight_object_type(Role, 94)
		       ++
		       hallows_lib:gen_fight_object(Role, NewHallowsId) ++
			 AtkGroup0 ++ gen_objects({AllSkills}),
	  CombatArgs = #{on_role_combat_end =>
			     {planes_evt_lib, combat_over,
			      [{Floor, Label, EvtData}]},
			 formation =>
			     [{1, NewFormationType, FormationLev},
			      {2, BFormationType, 1}],
			 target_role_name => TarName,
			 ext_args => [{is_show_panel, false}]},
	  case combat_lib:start_combat(Role, 40, AtkGroup,
				       [DefendList], CombatArgs)
	      of
	    {ok, _CombatPid} ->
		NewPlanes = Planes#m_planes{formation =
						{NewFormationType, PosInfo,
						 NewHallowsId}},
		{ok, Role, NewPlanes, PlanesFloor, PlanesTile};
	    {false, Msg} -> {false, Msg};
	    _ -> {false, lang:get(<<"无法发起战斗"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}}.

combat_over(Role = #role{m_planes =
			     #m_planes{floor = 0}},
	    _, _, _) ->
    {ok, Role};
combat_over(Role = #role{id = RoleId, lev = RoleLev,
			 partner_bag = #partner_bag{partner_list = PartnerList},
			 m_planes =
			     Planes = #m_planes{floor_list = FloorList,
						partners_hp_radio =
						    PartnerRadio,
						load_partners = LoadPartners}},
	    #combat_result{replay_id = ReplayId,
			   result = Result = 1, a_stat_info = ARemainHp,
			   b_stat_info = BRemainHp, total_hurt = Dps,
			   hurt_statistics_a = PartnerDpsList,
			   hurt_statistics = HurtStatistics},
	    #combat{target_role_name = TargetName},
	    {Floor, Label, EvtData}) ->
    case lists:keyfind(Floor, #planes_floor.floor,
		       FloorList)
	of
      PlanesFloor = #planes_floor{tile_list = TileList} ->
	  case lists:keyfind(Label, #planes_tile.label, TileList)
	      of
	    PlanesTile = #planes_tile{defend_radio = DefendRadio} ->
		PushRewardList = get_combat_reward_list(EvtData,
							RoleLev, Role),
		NewDefendRadio = merge_target_hp(BRemainHp,
						 DefendRadio),
		NewPartnerRadio = merge_partner_hp(ARemainHp, RoleId,
						   PartnerRadio),
		NewPlanesTile = PlanesTile#planes_tile{defend_radio =
							   NewDefendRadio},
		BuffPlanes = #m_planes{reward_list = OldRewardList} =
				 buff_special_ext(win, Planes),
		NewRewardList = item_lib:merge(OldRewardList,
					       PushRewardList),
		NewPlanes = BuffPlanes#m_planes{partners_hp_radio =
						    NewPartnerRadio,
						reward_list = NewRewardList,
						is_spar = 0},
		NewRole = planes_evt:click_tile_combat(Role, NewPlanes,
						       PlanesFloor,
						       NewPlanesTile, EvtData),
		BestPartnerId = case lists:reverse(lists:keysort(2,
								 PartnerDpsList))
				    of
				  [{BestPartnerIdTemp, _} | _] ->
				      BestPartnerIdTemp;
				  _ -> 0
				end,
		{BestPartnerId1, Bid1, Lev1, Star1, UseSkin1} = case
								  BestPartnerId
								    >= 10000000
								    of
								  true ->
								      LoadId =
									  BestPartnerId
									    -
									    10000000,
								      case
									lists:keyfind(LoadId,
										      #planes_load_partner.pos,
										      LoadPartners)
									  of
									#planes_load_partner{bid
												 =
												 Bid,
											     lev
												 =
												 Lev,
											     star
												 =
												 Star,
											     use_skin
												 =
												 UseSkin} ->
									    {0,
									     Bid,
									     Lev,
									     Star,
									     UseSkin};
									_ ->
									    {0,
									     0,
									     0,
									     0,
									     0}
								      end;
								  _ ->
								      case
									lists:keyfind(BestPartnerId,
										      #partner.id,
										      PartnerList)
									  of
									#partner{bid
										     =
										     Bid,
										 lev
										     =
										     Lev,
										 star
										     =
										     Star,
										 use_skin
										     =
										     UseSkin} ->
									    {BestPartnerId,
									     Bid,
									     Lev,
									     Star,
									     UseSkin};
									_ ->
									    {BestPartnerId,
									     0,
									     0,
									     0,
									     0}
								      end
								end,
		planes:push(NewRole, 28608,
			    {Result, Dps, BestPartnerId1, Bid1, Lev1, Star1,
			     UseSkin1, TargetName, HurtStatistics,
			     PushRewardList, Label, ReplayId}),
		planes:push(NewRole, 28609, NewPartnerRadio),
		planes:push(NewRole, 28625),
		{ok, NewRole};
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end;
combat_over(Role = #role{id = RoleId, lev = RoleLev,
			 partner_bag = #partner_bag{partner_list = PartnerList},
			 m_planes =
			     Planes = #m_planes{floor = Floor,
						floor_list = FloorList,
						partners_hp_radio =
						    PartnerRadio,
						load_partners = LoadPartners}},
	    #combat_result{result = Result, replay_id = ReplayId,
			   a_stat_info = ARemainHp, b_stat_info = BRemainHp,
			   total_hurt = Dps, hurt_statistics_a = PartnerDpsList,
			   hurt_statistics = HurtStatistics},
	    #combat{target_role_name = TargetName},
	    {Floor, Label,
	     EvtData = #planes_evt_data{type = Type, ext = Ext}}) ->
    case lists:keyfind(Floor, #planes_floor.floor,
		       FloorList)
	of
      PlanesFloor = #planes_floor{tile_list = TileList,
				  difficulty = Difficulty} ->
	  case lists:keyfind(Label, #planes_tile.label, TileList)
	      of
	    PlanesTile = #planes_tile{defend_radio = DefendRadio,
				      evt_id = EvtId} ->
		NewDefendRadio = merge_target_hp(BRemainHp,
						 DefendRadio),
		NewPlanesTile = PlanesTile#planes_tile{defend_radio =
							   NewDefendRadio},
		NewPartnerRadio = merge_partner_hp(ARemainHp, RoleId,
						   PartnerRadio),
		NewPlanes = Planes#m_planes{partners_hp_radio =
						NewPartnerRadio,
					    is_spar = 0},
		BestPartnerId = case lists:reverse(lists:keysort(2,
								 PartnerDpsList))
				    of
				  [{BestPartnerIdTemp, _} | _] ->
				      BestPartnerIdTemp;
				  _ -> 0
				end,
		{BestPartnerId1, Bid1, Lev1, Star1, UseSkin1} = case
								  BestPartnerId
								    >= 10000000
								    of
								  true ->
								      LoadId =
									  BestPartnerId
									    -
									    10000000,
								      case
									lists:keyfind(LoadId,
										      #planes_load_partner.pos,
										      LoadPartners)
									  of
									#planes_load_partner{bid
												 =
												 Bid,
											     lev
												 =
												 Lev,
											     star
												 =
												 Star,
											     use_skin
												 =
												 UseSkin} ->
									    {0,
									     Bid,
									     Lev,
									     Star,
									     UseSkin};
									_ ->
									    {0,
									     0,
									     0,
									     0,
									     0}
								      end;
								  _ ->
								      case
									lists:keyfind(BestPartnerId,
										      #partner.id,
										      PartnerList)
									  of
									#partner{bid
										     =
										     Bid,
										 lev
										     =
										     Lev,
										 star
										     =
										     Star,
										 use_skin
										     =
										     UseSkin} ->
									    {BestPartnerId,
									     Bid,
									     Lev,
									     Star,
									     UseSkin};
									_ ->
									    {BestPartnerId,
									     0,
									     0,
									     0,
									     0}
								      end
								end,
		case check_all_dead(BRemainHp) of
		  true ->
		      PushRewardList = get_combat_reward_list(EvtData,
							      RoleLev, Role),
		      NewPlanes1 = #m_planes{reward_list = OldRewardList} =
				       buff_special_ext(win, NewPlanes),
		      NewRewardList = item_lib:merge(OldRewardList,
						     PushRewardList),
		      NewPlanes2 = NewPlanes1#m_planes{reward_list =
							   NewRewardList},
		      NewRole = planes_evt:click_tile_combat(Role, NewPlanes2,
							     PlanesFloor,
							     NewPlanesTile,
							     EvtData),
		      planes:push(NewRole, 28608,
				  {Result, Dps, BestPartnerId1, Bid1, Lev1,
				   Star1, UseSkin1, TargetName, HurtStatistics,
				   PushRewardList, Label, ReplayId}),
		      planes:push(NewRole, 28609, NewPartnerRadio),
		      {ok, NewRole};
		  _ ->
		      NewRole1 = case lists:keyfind(combat_time, 1, Ext) of
				   {combat_time, _Time} ->
				       NewRole =
					   planes_evt:click_tile_combat_false(Role,
									      NewPlanes,
									      PlanesFloor,
									      NewPlanesTile,
									      EvtData),
				       NewRole;
				   _ ->
				       NewTileList = lists:keyreplace(Label,
								      #planes_tile.label,
								      TileList,
								      NewPlanesTile),
				       NewPlanesFloor =
					   PlanesFloor#planes_floor{tile_list =
									NewTileList},
				       NewFloorList = lists:keyreplace(Floor,
								       #planes_floor.floor,
								       FloorList,
								       NewPlanesFloor),
				       NewNewPlanes1 =
					   NewPlanes#m_planes{floor_list =
								  NewFloorList},
				       NewRole = Role#role{m_planes =
							       NewNewPlanes1},
				       NewRole
				 end,
		      planes:push(NewRole1, 28609, NewPartnerRadio),
		      planes:push(NewRole1, 28608,
				  {Result, Dps, BestPartnerId1, Bid1, Lev1,
				   Star1, UseSkin1, TargetName, HurtStatistics,
				   [], Label, ReplayId}),
		      LogName = get_name(Type),
		      log:save(task,
			       {NewRole1, 0, EvtId,
				util:fbin(<<"类型~ts-层数~w-难度~w"/utf8>>,
					  [LogName, Floor, Difficulty]),
				107, <<"新版位面事件"/utf8>>, <<"新版位面事件"/utf8>>}),
		      log:save(task,
			       {NewRole1, 2, EvtId,
				util:fbin(<<"类型~ts-层数~w-难度~w"/utf8>>,
					  [LogName, Floor, Difficulty]),
				107, <<"新版位面事件"/utf8>>, <<"新版位面事件"/utf8>>}),
		      {ok, NewRole1}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end;
combat_over(Role, _, _, _) -> {ok, Role}.

buff_special_ext(item,
		 Planes = #m_planes{buffs = Buffs,
				    buffs_ext = BuffsExt}) ->
    NewBuffsExt = do_item_buff_ext(Buffs, BuffsExt),
    NewPlanes = Planes#m_planes{buffs_ext = NewBuffsExt},
    NewPlanes;
buff_special_ext(win,
		 Planes = #m_planes{buffs = Buffs,
				    buffs_ext = BuffsExt}) ->
    NewBuffsExt = do_win_buff_ext(Buffs, BuffsExt),
    NewPlanes = Planes#m_planes{buffs_ext = NewBuffsExt},
    NewPlanes;
buff_special_ext(_, Planes) -> Planes.

add_hp([], PartnerList, _, AddPushList) ->
    {PartnerList, AddPushList};
add_hp([{PartnerId, HpRadio} | Rest], PartnerList,
       Radio, AddPushList) ->
    Partner = {PartnerId, min(100, HpRadio + Radio)},
    NewPartnerList = lists:keyreplace(PartnerId, 1,
				      PartnerList, Partner),
    add_hp(Rest, NewPartnerList, Radio,
	   [Partner | AddPushList]);
add_hp(_, PartnerList, _, AddPushList) ->
    {PartnerList, AddPushList}.

filter_partner([], MaxHpPartnerList, HurtPartnerList,
	       DiedPartnerList) ->
    {MaxHpPartnerList, HurtPartnerList, DiedPartnerList};
filter_partner([Partner = {_, 0} | Rest],
	       MaxHpPartnerList, HurtPartnerList, DiedPartnerList) ->
    filter_partner(Rest, MaxHpPartnerList, HurtPartnerList,
		   [Partner | DiedPartnerList]);
filter_partner([Partner = {_, Radio} | Rest],
	       MaxHpPartnerList, HurtPartnerList, DiedPartnerList)
    when Radio < 100 ->
    filter_partner(Rest, MaxHpPartnerList,
		   [Partner | HurtPartnerList], DiedPartnerList);
filter_partner([Partner = {_, _} | Rest],
	       MaxHpPartnerList, HurtPartnerList, DiedPartnerList) ->
    filter_partner(Rest, [Partner | MaxHpPartnerList],
		   HurtPartnerList, DiedPartnerList);
filter_partner(_, MaxHpPartnerList, HurtPartnerList,
	       DiedPartnerList) ->
    {MaxHpPartnerList, HurtPartnerList, DiedPartnerList}.

get_pos_info([], OldPosInfo, OldFormationPos) ->
    {OldPosInfo, OldFormationPos};
get_pos_info([{3, PartnerPos, PartnerId} | Rest],
	     OldPosInfo, OldFormationPos) ->
    get_pos_info(Rest,
		 [{PartnerPos, PartnerId} | OldPosInfo],
		 [{PartnerPos, PartnerId, 0} | OldFormationPos]);
get_pos_info([{4, PartnerPos, PartnerId} | Rest],
	     OldPosInfo, OldFormationPos) ->
    get_pos_info(Rest,
		 [{PartnerPos, PartnerId} | OldPosInfo],
		 [{PartnerPos, PartnerId, 1} | OldFormationPos]);
get_pos_info([_ | Rest], OldPosInfo, OldFormationPos) ->
    get_pos_info(Rest, OldPosInfo, OldFormationPos);
get_pos_info(_, OldPosInfo, OldFormationPos) ->
    {OldPosInfo, OldFormationPos}.

check_combat([], _, _, _, _, _,
	     #{atk_grop := AtkGroup, defend_list := DefendList,
	       bformation_type := BFormationType, tarname := TarName,
	       formation_type := NewFormationType,
	       hallows_id := NewHallowsId,
	       formation_pos := FormationPos,
	       all_skills := AllSkills}) ->
    {ok, AtkGroup, DefendList, BFormationType, TarName,
     NewFormationType, NewHallowsId, FormationPos,
     AllSkills};
check_combat([time | Rest], Role, Planes, PlanesFloor,
	     PlanesTile, Ext, Args) ->
    NextUpdateUnixtime = planes:get_next_update_unixtime(),
    Now = date:unixtime(),
    case Now =< NextUpdateUnixtime - 600 of
      true ->
	  check_combat(Rest, Role, Planes, PlanesFloor,
		       PlanesTile, Ext, Args);
      _ ->
	  {false, lang:get(<<"本轮位面征战已关闭，不能继续战斗，请等待下次重置"/utf8>>)}
    end;
check_combat([formation | Rest], Role, Planes,
	     PlanesFloor, PlanesTile, Ext, Args) ->
    NewFormationType = case lists:keyfind(1, 1, Ext) of
			 {_, FormationType, _} -> FormationType;
			 _ -> 1
		       end,
    NewHallowsId = case lists:keyfind(2, 1, Ext) of
		     {_, HallowsId, _} -> HallowsId;
		     _ -> 0
		   end,
    {PosInfo, FormationPos} = get_pos_info(Ext, [], []),
    FightPos = formation_lib:gen_fight_pos(PosInfo,
					   NewFormationType),
    case planes:check_formation_pos_info(Role,
					 NewFormationType, FormationPos,
					 NewHallowsId)
	of
      {false, Reason} -> {false, Reason};
      {ok, []} -> {false, lang:get(<<"至少需要上阵一个英雄"/utf8>>)};
      {ok, _NewPosInfo} ->
	  check_combat(Rest, Role, Planes, PlanesFloor,
		       PlanesTile, Ext,
		       Args#{formation_type => NewFormationType,
			     hallows_id => NewHallowsId, fight_pos => FightPos,
			     formation_pos => FormationPos})
    end;
check_combat([partner | Rest], Role, Planes,
	     PlanesFloor, PlanesTile, Ext,
	     Args = #{formation_pos := FormationPos,
		      fight_pos := FightPos}) ->
    case get_partner(Role, Planes, FormationPos, FightPos,
		     [], [])
	of
      {ok, AtkGroup} ->
	  check_combat(Rest, Role, Planes, PlanesFloor,
		       PlanesTile, Ext, Args#{atk_grop => AtkGroup});
      {false, Reason} -> {false, Reason}
    end;
check_combat([defend | Rest], Role, Planes, PlanesFloor,
	     PlanesTile = #planes_tile{ext = [DefendInformation],
				       defend_radio = DefendRadio},
	     Ext, Args = #{ext := DataExt}) ->
    case get_fight_robot(Role, DefendInformation, DataExt)
	of
      {FormationType, Name, FOL0} ->
	  DefendList = combat_lib:init_fight_object_hp(FOL0,
						       DefendRadio),
	  check_combat(Rest, Role, Planes, PlanesFloor,
		       PlanesTile, Ext,
		       Args#{defend_list => DefendList,
			     bformation_type => FormationType,
			     tarname => Name});
      {false, Reason} -> {false, Reason}
    end;
check_combat([fight | Rest], Role,
	     Planes = #m_planes{buffs = Buffs, floor = Floor},
	     PlanesFloor, PlanesTile, Ext, Args) ->
    AllSkills = get_all_skills(Buffs, Floor, []),
    check_combat(Rest, Role, Planes, PlanesFloor,
		 PlanesTile, Ext, Args#{all_skills => AllSkills});
check_combat(_, _, _, _, _, _, _) ->
    {false, lang:get(<<"战斗参数错误"/utf8>>)}.

get_fight_robot(_Role,
		{FightId, Name, _Face, _Lev, FormationType, PosInfo,
		 {HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
		  AllLooksIds, HallowsLucky, HallowsSeal, HallowRefine},
		 Partners, SpriteLev, SpriteBreakLev, Sprites,
		 _FaceUpdateTime, _FaceFile},
		_DataExt)
    when is_tuple(FightId) ->
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Fun = fun (FormationPos) ->
		  to_formation_fight_info(FormationPos, FightPos)
	  end,
    BFightPos = lists:filtermap(Fun, PosInfo),
    BFightPos1 = [{Pos, PId}
		  || #formation_fight_info{fight_pos = Pos, id = PId}
			 <- BFightPos,
		     PId > 0],
    Fun1 = fun ({Pos, Id}) ->
		   case lists:keyfind(Id, #partner.id, Partners) of
		     P = #partner{} ->
			 Obj = partner_lib:gen_fight_object({1, <<>>}, 0, P,
							    combat_lib:is_leader(Pos),
							    {1, <<>>}, 1),
			 {true, Obj#fight_object{pos = Pos}};
		     _ -> false
		   end
	   end,
    DefListTT = lists:filtermap(Fun1, BFightPos1),
    {FormationType, Name,
     sprite_tree:gen_robot_fight_object(SpriteLev,
					SpriteBreakLev, Sprites)
       ++
       hallows_lib:gen_def_fight_object(HallowsId, HallowsLev,
					HallowsSkillLev, HallowsLookId,
					AllLooksIds, HallowsLucky, HallowsSeal,
					HallowRefine)
	 ++ DefListTT};
get_fight_robot(_Role,
		{FightId, Name, _Face, _Lev, FormationType, PosInfo,
		 {HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
		  AllLooksIds, HallowsLucky, HallowsSeal, HallowRefine},
		 Partners, SpriteLev, SpriteBreakLev, Sprites},
		_DataExt)
    when is_tuple(FightId) ->
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Fun = fun (FormationPos) ->
		  to_formation_fight_info(FormationPos, FightPos)
	  end,
    BFightPos = lists:filtermap(Fun, PosInfo),
    BFightPos1 = [{Pos, PId}
		  || #formation_fight_info{fight_pos = Pos, id = PId}
			 <- BFightPos,
		     PId > 0],
    Fun1 = fun ({Pos, Id}) ->
		   case lists:keyfind(Id, #partner.id, Partners) of
		     P = #partner{} ->
			 Obj = partner_lib:gen_fight_object({1, <<>>}, 0, P,
							    combat_lib:is_leader(Pos),
							    {1, <<>>}, 1),
			 {true, Obj#fight_object{pos = Pos}};
		     _ -> false
		   end
	   end,
    DefListTT = lists:filtermap(Fun1, BFightPos1),
    {FormationType, Name,
     sprite_tree:gen_robot_fight_object(SpriteLev,
					SpriteBreakLev, Sprites)
       ++
       hallows_lib:gen_def_fight_object(HallowsId, HallowsLev,
					HallowsSkillLev, HallowsLookId,
					AllLooksIds, HallowsLucky, HallowsSeal,
					HallowRefine)
	 ++ DefListTT};
get_fight_robot(_Role = #role{m_planes =
				  #m_planes{dun_power = MaxPower}},
		{FightId, Name, FormationType, _PosInfo,
		 {HallowsId, HallowsStep, HallowsSkill}, Partners,
		 SpriteLev, SpriteBreakLev, Sprites},
		DataExt)
    when is_integer(FightId) ->
    NewStrengthRadio = case lists:keyfind(strength, 1,
					  DataExt)
			   of
			 {strength, _, {hp_max_per, HpRadio},
			  {atk_per, AtkRadio}} ->
			     {HpRadio, AtkRadio};
			 _ -> get_guard_radio(DataExt, MaxPower)
		       end,
    #formation_data{pos = FightPosList} =
	formation_data:get_formation(FormationType),
    Fun = fun (P = #partner{id = PId,
			    all_attr = AllAttr}) ->
		  FightPos = list_util:keyfind(PId, FightPosList),
		  NAttr = base_ratio(NewStrengthRadio, AllAttr),
		  NewP = P#partner{all_attr = NAttr},
		  FO = partner_lib:gen_fight_object({1, <<>>}, 0, NewP,
						    combat_lib:is_leader(FightPos),
						    {1, <<>>}, 1),
		  FO#fight_object{pos = FightPos}
	  end,
    FOL0 = sprite_tree:gen_robot_fight_object(SpriteLev,
					      SpriteBreakLev, Sprites)
	     ++
	     hallows_lib:gen_def_fight_object(HallowsId, HallowsStep,
					      HallowsSkill)
	       ++ [Fun(P) || P <- Partners],
    {FormationType, Name, FOL0};
get_fight_robot(_, _, _) ->
    {false, lang:get(<<"没有战斗怪物"/utf8>>)}.

get_partner(_, _, [], _, _, AtkGroup) -> {ok, AtkGroup};
get_partner(Role,
	    Planes = #m_planes{partners_hp_radio = PartnerRadio,
			       buffs = Buffs, floor = Floor,
			       buffs_ext = BuffsExt, is_spar = IsSPar},
	    [{Pos, PartnerId, 0} | Rest], FightPos, OldBids,
	    OldAtkGroup) ->
    {LimitLev, LimitStar, LimitBreak} =
	planes_data:get_const(planes_filter_condition),
    case partner_lib:get_partner(Role, PartnerId) of
      false ->
	  get_partner(Role, Planes, Rest, FightPos, OldBids,
		      OldAtkGroup);
      #partner{end_time = EndTime} when EndTime =/= 0 ->
	  {false, lang:get(<<"赋能英雄无法参与战斗"/utf8>>)};
      Partner = #partner{bid = Bid, lev = Lev, star = Star,
			 break_lev = BreakLev, name = _PartnerName}
	  when Lev >= LimitLev, Star >= LimitStar,
	       BreakLev >= LimitBreak ->
	  case lists:member(Bid, OldBids) of
	    false ->
		BuffSkillPartner = #partner{all_attr = AllAttr} =
				       add_buff_skill(Partner, Buffs, Floor),
		SparPartner = case IsSPar of
				1 ->
				    SparRadio =
					planes_data:get_const(planes_spar_atk_radio),
				    NewAllAttr = base_atk_ratio(SparRadio,
								AllAttr),
				    BuffSkillPartner#partner{all_attr =
								 NewAllAttr};
				_ -> BuffSkillPartner
			      end,
		FO1 = partner_lib:gen_fight_object(Role, SparPartner,
						   combat_lib:is_leader(Pos)),
		#formation_fight_info{fight_pos = PartnerFightPos} =
		    lists:keyfind(Pos, #formation_fight_info.pos, FightPos),
		FO2 = FO1#fight_object{pos = PartnerFightPos},
		AttrList0 = add_buff_attr(FO2, Buffs, Floor, []),
		AttrList1 = add_buff_ext_attr(FO2, BuffsExt, Floor,
					      AttrList0),
		FO4 = #fight_object{hp_max = HpMax} =
			  combat_lib:add_base_attr(FO2, AttrList1),
		case lists:keyfind(PartnerId, 1, PartnerRadio) of
		  {_, 0} -> {false, lang:get(<<"上阵了已阵亡的英雄"/utf8>>)};
		  {PartnerId, HpPer} ->
		      get_partner(Role, Planes, Rest, FightPos,
				  [Bid | OldBids],
				  [FO4#fight_object{hp =
							round(HpPer * HpMax /
								100)}
				   | OldAtkGroup]);
		  _ ->
		      get_partner(Role, Planes, Rest, FightPos,
				  [Bid | OldBids], [FO4 | OldAtkGroup])
		end;
	    _ -> {false, lang:get(<<"不能上阵重复英雄"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"大于50级的英雄才可参战该玩法"/utf8>>)}
    end;
get_partner(Role,
	    Planes = #m_planes{partners_hp_radio = PartnerRadio,
			       load_partners = LoadPartnerList, buffs = Buffs,
			       floor = Floor, buffs_ext = BuffsExt,
			       is_spar = IsSPar},
	    [{Pos, PartnerId, 1} | Rest], FightPos, OldBids,
	    OldAtkGroup) ->
    case lists:keyfind(PartnerId, #planes_load_partner.pos,
		       LoadPartnerList)
	of
      false ->
	  get_partner(Role, Planes, Rest, FightPos, OldBids,
		      OldAtkGroup);
      #planes_load_partner{bid = Bid, lev = Lev, star = Star,
			   break_lev = BreakLev, pos = LoadPos,
			   use_skin = UseSkin, all_attr = AllAttr,
			   base_attr = BaseAttr, skills = Skills,
			   break_skills = BreakSkills, set_skills = SetSkills,
			   eqms = EqmData, artifacts = Artifacts,
			   holy_eqm = HolyEqm, end_time = EndTime,
			   dower_skill = DowerSkill, name = _PartnerName} ->
	  case lists:member(Bid, OldBids) of
	    false ->
		BaseData = #partner_base_data{} =
			       partner_data:get_base(Bid),
		P0 = partner:init_partner(Role, BaseData,
					  LoadPos + 10000000),
		P1 = partner_lib:calc_attr(Role,
					   P0#partner{lev = Lev, star = Star,
						      break_lev = BreakLev,
						      use_skin = UseSkin}),
		Eqm = [#item{id = ItemId, base_id = ItemBid,
			     type = ItemType}
		       || {ItemId, ItemBid, ItemType} <- EqmData],
		NewArtifacts = [{APos, item_ver:do(I, #{})}
				|| {APos, I} <- Artifacts],
		NewHolyEqm = [item_ver:do(I, #{}) || I <- HolyEqm],
		NewAllAttr = case IsSPar of
			       1 ->
				   SparRadio =
				       planes_data:get_const(planes_spar_atk_radio),
				   base_atk_ratio(SparRadio, AllAttr);
			       _ -> AllAttr
			     end,
		BuffSkillPartner = P1#partner{all_attr = NewAllAttr,
					      base_attr = BaseAttr,
					      skills = Skills,
					      break_skills = BreakSkills,
					      set_skills = SetSkills, eqm = Eqm,
					      artifacts = NewArtifacts,
					      holy_eqm = NewHolyEqm,
					      end_time = EndTime,
					      dower_skill = DowerSkill},
		P2 = add_buff_skill(BuffSkillPartner, Buffs, Floor),
		P3 = partner_lib:calc_power(P2),
		FO1 = partner_lib:gen_fight_object({PartnerId, <<>>},
						   self(), P3,
						   combat_lib:is_leader(Pos),
						   {PartnerId, <<>>}, 0),
		#formation_fight_info{fight_pos = PartnerFightPos} =
		    lists:keyfind(Pos, #formation_fight_info.pos, FightPos),
		FO2 = FO1#fight_object{pos = PartnerFightPos},
		AttrList0 = add_buff_attr(FO2, Buffs, Floor, []),
		AttrList1 = add_buff_ext_attr(FO2, BuffsExt, Floor,
					      AttrList0),
		FO4 = #fight_object{hp_max = HpMax} =
			  combat_lib:add_base_attr(FO2, AttrList1),
		case lists:keyfind({PartnerId, <<>>}, 1, PartnerRadio)
		    of
		  {_, 0} -> {false, lang:get(<<"上阵了已阵亡的英雄"/utf8>>)};
		  {{PartnerId, <<>>}, HpPer} ->
		      get_partner(Role, Planes, Rest, FightPos,
				  [Bid | OldBids],
				  [FO4#fight_object{hp =
							round(HpPer * HpMax /
								100)}
				   | OldAtkGroup]);
		  _ ->
		      get_partner(Role, Planes, Rest, FightPos,
				  [Bid | OldBids], [FO4 | OldAtkGroup])
		end;
	    _ -> {false, lang:get(<<"不能上阵重复英雄"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"大于50级的英雄才可参战该玩法"/utf8>>)}
    end;
get_partner(_, _, _, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

add_buff_ext_attr(_FO, [], _Floor, AttrList) ->
    AttrList;
add_buff_ext_attr(FO = #fight_object{camp_type =
					 CampType,
				     object_bid = BaseId, career = CareerType},
		  [{BuffId, Time} | Rest], Floor, AttrList) ->
    case planes_data:get_buff(BuffId) of
      {Range, Effect, FloorLimitList} ->
	  Flag = case lists:member(Floor, FloorLimitList) of
		   true ->
		       case Range of
			 [] -> 1;
			 [{career_type, CareerType}] -> 1;
			 [{camp_type, CampType}] -> 1;
			 [{partner, BaseId}] -> 1;
			 _ -> 0
		       end;
		   _ -> 0
		 end,
	  case Flag of
	    1 ->
		AttrIds = [AttrId || {_, AttrId, _} <- Effect],
		NewAttrList = get_att_FO(AttrIds, Time, AttrList),
		add_buff_ext_attr(FO, Rest, Floor, NewAttrList);
	    _ -> add_buff_ext_attr(FO, Rest, Floor, AttrList)
	  end;
      _ -> add_buff_ext_attr(FO, Rest, Floor, AttrList)
    end;
add_buff_ext_attr(_FO, _BuffsExt, _Floor, AttrList) ->
    AttrList.

add_buff_attr(_FO, [], _Floor, AttrList) -> AttrList;
add_buff_attr(FO = #fight_object{camp_type = CampType,
				 object_bid = BaseId, career = CareerType},
	      [BuffId | Rest], Floor, AttrList) ->
    case planes_data:get_buff(BuffId) of
      {Range, Effect, FloorLimitList} ->
	  AttrIds = [AttrId || {attr, AttrId} <- Effect],
	  case AttrIds of
	    [] -> add_buff_attr(FO, Rest, Floor, AttrList);
	    _ ->
		Flag = case lists:member(Floor, FloorLimitList) of
			 true ->
			     case Range of
			       [] -> 1;
			       [{career_type, CareerType}] -> 1;
			       [{camp_type, CampType}] -> 1;
			       [{partner, BaseId}] -> 1;
			       _ -> 0
			     end;
			 _ -> 0
		       end,
		case Flag of
		  1 ->
		      NewAttrList = get_att_FO(AttrIds, 1, AttrList),
		      add_buff_attr(FO, Rest, Floor, NewAttrList);
		  _ -> add_buff_attr(FO, Rest, Floor, AttrList)
		end
	  end;
      _ -> add_buff_attr(FO, Rest, Floor, AttrList)
    end;
add_buff_attr(_FO, _, _Floor, AttrList) -> AttrList.

get_att_FO([], _Num, AttrList) -> AttrList;
get_att_FO([AttrId | Rest], Num, AllAttrList) ->
    case planes_data:get_buff_attr(AttrId) of
      AttrList0 when is_list(AttrList0) ->
	  AttrList = [{Name, Val * Num}
		      || {Name, Val} <- AttrList0],
	  get_att_FO(Rest, Num, AttrList ++ AllAttrList);
      _ -> get_att_FO(Rest, Num, AllAttrList)
    end;
get_att_FO(_, _Num, AttrList) -> AttrList.

add_buff_skill(Partner, [], _Floor) -> Partner;
add_buff_skill(Partner = #partner{camp_type = CampType,
				  bid = BaseId, type = CareerType,
				  set_skills = SetSkills},
	       [BuffId | Rest], Floor) ->
    case planes_data:get_buff(BuffId) of
      {Range, Effect, FloorLimitList} ->
	  SkillIds = [SkillId || {skill, SkillId} <- Effect],
	  case SkillIds of
	    [] -> add_buff_skill(Partner, Rest, Floor);
	    _ ->
		Flag = case lists:member(Floor, FloorLimitList) of
			 true ->
			     case Range of
			       [] -> 1;
			       [{career_type, CareerType}] -> 1;
			       [{camp_type, CampType}] -> 1;
			       [{partner, BaseId}] -> 1;
			       _ -> 0
			     end;
			 _ -> 0
		       end,
		case Flag of
		  1 ->
		      NewPartner = Partner#partner{set_skills =
						       SkillIds ++ SetSkills},
		      add_buff_skill(NewPartner, Rest, Floor);
		  _ -> add_buff_skill(Partner, Rest, Floor)
		end
	  end;
      _ -> add_buff_skill(Partner, Rest, Floor)
    end;
add_buff_skill(Partner, _, _Floor) -> Partner.

merge_partner_hp([], _RoleId, PartnerRadio) ->
    PartnerRadio;
merge_partner_hp([#{master_id := RoleId,
		    object_id := PId, hp := Hp, hp_max := HpMax}
		  | T],
		 RoleId, PartnerRadio) ->
    merge_partner_hp(T, RoleId,
		     lists:keystore(PId, 1, PartnerRadio,
				    {PId, util:ceil(Hp * 100 / HpMax)}));
merge_partner_hp([#{master_id := MasterId, hp := Hp,
		    hp_max := HpMax}
		  | T],
		 RoleId, PList) ->
    merge_partner_hp(T, RoleId,
		     lists:keystore(MasterId, 1, PList,
				    {MasterId, util:ceil(Hp * 100 / HpMax)}));
merge_partner_hp([_ | T], RoleId, PList) ->
    merge_partner_hp(T, RoleId, PList);
merge_partner_hp(_, _, PList) -> PList.

merge_target_hp([], PList) -> PList;
merge_target_hp([#{object_id := PId, hp := Hp,
		   hp_max := HpMax}
		 | T],
		PList) ->
    merge_target_hp(T,
		    lists:keystore(PId, 1, PList,
				   {PId, util:ceil(Hp * 100 / HpMax)})).

check_all_dead([]) -> true;
check_all_dead([#{hp := 0} | T]) -> check_all_dead(T);
check_all_dead(_) -> false.

do_hide([], _GroupId, OldTileList, ChangeTileList,
	_Label) ->
    {OldTileList, ChangeTileList};
do_hide([PlanesTile = #planes_tile{label = Label}
	 | Rest],
	GroupId, OldTileList, ChangeTileList, Label) ->
    do_hide(Rest, GroupId, [PlanesTile | OldTileList],
	    ChangeTileList, Label);
do_hide([PlanesTile = #planes_tile{evt_id = EvtId}
	 | Rest],
	GroupId, OldTileList, ChangeTileList, Label) ->
    case planes_data:get_group(EvtId) of
      GroupId ->
	  NewPlanesTile = PlanesTile#planes_tile{is_hide = 1},
	  do_hide(Rest, GroupId, [NewPlanesTile | OldTileList],
		  [NewPlanesTile | ChangeTileList], Label);
      _ ->
	  do_hide(Rest, GroupId, [PlanesTile | OldTileList],
		  ChangeTileList, Label)
    end;
do_hide(TileList, _GroupId, OldTileList, ChangeTileList,
	_Label) ->
    {TileList ++ OldTileList, ChangeTileList}.

base_ratio({HpRadio, AtkRadio}, Attr) ->
    Attr#attr{atk =
		  util:round(Attr#attr.atk * AtkRadio / 1000),
	      hp_max = util:round(Attr#attr.hp_max * HpRadio / 1000)};
base_ratio(Radio, Attr) ->
    Attr#attr{atk =
		  util:round(Attr#attr.atk * Radio / 1000),
	      hp_max = util:round(Attr#attr.hp_max * Radio / 1000)}.

base_atk_ratio(AtkRadio, Attr) ->
    Attr#attr{atk =
		  util:round(Attr#attr.atk * AtkRadio / 1000)}.

get_combat_reward_list(#planes_evt_data{reward_list =
					    RewardIds},
		       RoleLev, Role) ->
    ItemsList = do_get_combat_reward_list(RewardIds, [],
					  RoleLev, Role),
    ItemsList.

do_get_combat_reward_list([], ItemsList, _RoleLev,
			  _Role) ->
    ItemsList;
do_get_combat_reward_list([Id | Rest], ItemsList,
			  RoleLev, Role) ->
    case planes_data:get_reward({Id, RoleLev}) of
      {1, RewardList} when is_list(RewardList) ->
	  NewItems = case secret_dun:is_open_holiday(Role) of
		       1 ->
			   AddItems = [{ItemId1, util:ufloor(Num1 * 1.0e-1)}
				       || {ItemId1, Num1} <- RewardList,
					  ItemId1 =:= 25],
			   item_lib:merge(AddItems, RewardList);
		       _ -> RewardList
		     end,
	  do_get_combat_reward_list(Rest, NewItems ++ ItemsList,
				    RoleLev, Role);
      _ ->
	  do_get_combat_reward_list(Rest, ItemsList, RoleLev,
				    Role)
    end;
do_get_combat_reward_list(_, ItemsList, _RoleLev,
			  _Role) ->
    ItemsList.

to_formation_fight_info({0, _PId}, _FightPos) -> false;
to_formation_fight_info({Pos, PId}, FightPos) ->
    Pos1 = list_util:keyfind(Pos, FightPos),
    {true,
     #formation_fight_info{pos = Pos, fight_pos = Pos1,
			   id = PId}}.

filter_guard_max_arena_robot(L2, RoleLev) ->
    case util:rand_list(L2) of
      Select = {ArenaId, Name} when is_tuple(ArenaId) ->
	  UpperLev =
	      planes_data:get_const(planes_upper_limit_lev),
	  LowLev = planes_data:get_const(planes_lower_limit_lev),
	  case role_robot:get_role(ArenaId) of
	    {ok,
	     Robot = #role_robot{partners = Partners,
				 lev = RobotLev}}
		when RobotLev >= RoleLev - LowLev andalso
		       RoleLev =< RoleLev + UpperLev ->
		#formation_sys{pos_info = PosInfo} =
		    formation:get_sys_formation(Robot, 1),
		case length(PosInfo) >= 5 of
		  true ->
		      Fun = fun (#formation_pos{id = PId}) ->
				    Partner = #partner{} = lists:keyfind(PId,
									 #partner.id,
									 Partners),
				    Partner
			    end,
		      PList = [Fun(I) || I <- PosInfo],
		      AllPower = lists:sum([Power
					    || #partner{power = Power}
						   <- PList]),
		      RadioAllPower = AllPower * 5.9999999999999998e-1,
		      case lists:reverse(lists:keysort(#partner.power, PList))
			  of
			[#partner{power = MaxPower} | _]
			    when MaxPower =< RadioAllPower ->
			    {ok, ArenaId, Name};
			_ ->
			    NewL2 = L2 -- [Select],
			    filter_guard_max_arena_robot(NewL2, RoleLev)
		      end;
		  _ ->
		      NewL2 = L2 -- [Select],
		      filter_guard_max_arena_robot(NewL2, RoleLev)
		end;
	    _ ->
		NewL2 = L2 -- [Select],
		filter_guard_max_arena_robot(NewL2, RoleLev)
	  end;
      _ -> false
    end.

do_item_buff_ext([], BuffsExt) -> BuffsExt;
do_item_buff_ext([BuffId | Rest], BuffsExt) ->
    NewBuffsExt1 = case planes_data:get_buff(BuffId) of
		     {_, Effect, _} ->
			 case lists:keyfind(revive_item, 1, Effect) of
			   {revive_item, _, MaxTime} ->
			       case lists:keyfind(BuffId, 1, BuffsExt) of
				 {BuffId, Time} ->
				     NewBuffsExt = lists:keyreplace(BuffId, 1,
								    BuffsExt,
								    {BuffId,
								     min(Time +
									   1,
									 MaxTime)}),
				     NewBuffsExt;
				 _ ->
				     NewBuffsExt = [{BuffId, 1} | BuffsExt],
				     NewBuffsExt
			       end;
			   _ -> BuffsExt
			 end;
		     _ -> BuffsExt
		   end,
    do_item_buff_ext(Rest, NewBuffsExt1);
do_item_buff_ext(_, BuffsExt) -> BuffsExt.

do_win_buff_ext([], BuffsExt) -> BuffsExt;
do_win_buff_ext([BuffId | Rest], BuffsExt) ->
    NewBuffsExt1 = case planes_data:get_buff(BuffId) of
		     {_, Effect, _} ->
			 case lists:keyfind(battle_win, 1, Effect) of
			   {battle_win, _, MaxTime} ->
			       case lists:keyfind(BuffId, 1, BuffsExt) of
				 {BuffId, Time} ->
				     NewBuffsExt = lists:keyreplace(BuffId, 1,
								    BuffsExt,
								    {BuffId,
								     min(Time +
									   1,
									 MaxTime)}),
				     NewBuffsExt;
				 _ ->
				     NewBuffsExt = [{BuffId, 1} | BuffsExt],
				     NewBuffsExt
			       end;
			   _ -> BuffsExt
			 end;
		     _ -> BuffsExt
		   end,
    do_win_buff_ext(Rest, NewBuffsExt1);
do_win_buff_ext(_, BuffsExt) -> BuffsExt.

get_guard_radio(DataExt, MaxPower) ->
    case lists:keyfind(group, 1, DataExt) of
      {group, GroupId} ->
	  case planes_data:get_guard_ext({GroupId, MaxPower}) of
	    NewDataExt when is_list(NewDataExt) ->
		case lists:keyfind(strength, 1, NewDataExt) of
		  {strength, _Radio} -> {1000, 1000};
		  {strength, _, {hp_max_per, HpRadio},
		   {atk_per, AtkRadio}} ->
		      {HpRadio, AtkRadio};
		  _ -> {1000, 1000}
		end;
	    _ -> {1000, 1000}
	  end;
      _ -> {1000, 1000}
    end.

get_all_skills([], _Floor, AllSkills) -> AllSkills;
get_all_skills([BuffId | Rest], Floor, AllSkills) ->
    case planes_data:get_buff(BuffId) of
      {_Range, Effect, FloorLimitList} ->
	  SkillIds = [SkillId
		      || {fight_skill, SkillId} <- Effect],
	  case SkillIds of
	    [] -> get_all_skills(Rest, Floor, AllSkills);
	    _ ->
		case lists:member(Floor, FloorLimitList) of
		  true ->
		      get_all_skills(Rest, Floor, SkillIds ++ AllSkills);
		  _ -> get_all_skills(Rest, Floor, AllSkills)
		end
	  end;
      _ -> get_all_skills(Rest, Floor, AllSkills)
    end;
get_all_skills(_Buffs, _Floor, AllSkills) -> AllSkills.

gen_objects({AllSkills = [_ | _]}) ->
    Attr = #attr{hp = 1, hp_max = 1},
    {ActiveSkillIds, PassiveSkillIds} =
	skill_lib:split_skills([AllSkills]),
    ActiveSkills = [skill_data:get_skill(SId)
		    || SId <- ActiveSkillIds],
    PassiveSkills = [skill_data:get_skill(SId)
		     || SId <- PassiveSkillIds],
    SkillOrder = [],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidplanes_evt_lib1051, _,
       {__Levelplanes_evt_lib1051, __Tracesplanes_evt_lib1051}}
	  when __Levelplanes_evt_lib1051 band 128 /= 0 orelse
		 __Tracesplanes_evt_lib1051 /= [] ->
	  lager:do_log(debug,
		       [{module, planes_evt_lib}, {function, gen_objects},
			{line, 1051}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("机器人战斗单位信息 AllSkills=~w ActiveSkillIds=~w "
				     "PassiveSkillIds=~w SkillOrder=~w",
				     [AllSkills, ActiveSkillIds,
				      PassiveSkillIds, SkillOrder]),
		       none, 4096, 128, __Levelplanes_evt_lib1051,
		       __Tracesplanes_evt_lib1051, lager_event,
		       __Pidplanes_evt_lib1051);
      _ -> ok
    end,
    [#fight_object{base_attr = Attr, fight_attr = Attr,
		   hp = Attr#attr.hp_max, hp_max = Attr#attr.hp_max,
		   object_id = 0, object_bid = 0, object_name = <<>>,
		   lev = 0, object_type = 6, active_skills = ActiveSkills,
		   passive_skills = PassiveSkills,
		   skill_order = SkillOrder,
		   initial_hp_max = Attr#attr.hp_max, awaken_type = 0}];
gen_objects(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidplanes_evt_lib1068, _,
       {__Levelplanes_evt_lib1068, __Tracesplanes_evt_lib1068}}
	  when __Levelplanes_evt_lib1068 band 128 /= 0 orelse
		 __Tracesplanes_evt_lib1068 /= [] ->
	  lager:do_log(debug,
		       [{module, planes_evt_lib}, {function, gen_objects},
			{line, 1068}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("位面不需要生成独立战斗单位信息:~w", [_Info]), none,
		       4096, 128, __Levelplanes_evt_lib1068,
		       __Tracesplanes_evt_lib1068, lager_event,
		       __Pidplanes_evt_lib1068);
      _ -> ok
    end,
    [].


