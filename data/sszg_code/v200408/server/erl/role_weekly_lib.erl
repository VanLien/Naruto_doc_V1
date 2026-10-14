-file("src/mod/data/role_weekly_lib.erl", 1).

-module(role_weekly_lib).

-lager_records([{role_feedback_info,
		 [role_id, id, state, status2, start_time, end_msg_time,
		  finish_time, score_time, title, content,
		  questions_lists, answer_lists, score]},
		{feedback,
		 [sess, rid, feedback_id, status, score, send_time,
		  time_out]},
		{gmail,
		 [id, type, mail_type, subject, content, assets, items,
		  start_time, end_time, conds, source, can_del]},
		{mail,
		 [sess, to, to_name, from, from_name, type, group_id,
		  status, subject, content, assets, items, source, rev_ts,
		  read_time, send_time, time_out, can_del]},
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
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
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
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
		{role_weekly_report,
		 [ver, rid, end_time, account, name, lev, face_id, power,
		  channel, have_partners, used_partners, get_partner,
		  get_gold, get_high_recruit, get_crystal, get_sprite,
		  send_point, login_day, acc_time, arena_elite_lev,
		  arena_cluster_rank, star_tower_rank, arena_score,
		  endless_rank, sky_ladder_rank, cluster_champion_rank,
		  arena_team_rank, element_rank, drama_rate, tag_list,
		  ext]},
		{m_weekly,
		 [ver, used_partners, get_partner, get_gold,
		  get_high_recruit, get_crystal, get_sprite, send_point]},
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

-export([get_weekly_data/1, get_tag_list/3,
	 send_weekly_share_award/1]).

-export([gm_get_weekly_data/1, gm_send_weekly_mail/1,
	 gm_send_all_weekly_mail/0]).

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

-file("src/mod/data/role_weekly_lib.erl", 19).

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

-file("src/mod/data/role_weekly_lib.erl", 20).

-file("inc/weekly.hrl", 1).

-record(m_weekly,
	{ver = 1, used_partners = [], get_partner = [],
	 get_gold = 0, get_high_recruit = 0, get_crystal = 0,
	 get_sprite = [], send_point = 0}).

-record(role_weekly_report,
	{ver = 1, rid = {{0, <<>>}, 0}, end_time = 0,
	 account = <<>>, name = <<>>, lev = 1, face_id = 0,
	 power = 0, channel = 0, have_partners = [],
	 used_partners = [], get_partner = [], get_gold = 0,
	 get_high_recruit = 0, get_crystal = 0, get_sprite = [],
	 send_point = 0, login_day = 0, acc_time = 0,
	 arena_elite_lev = 0, arena_cluster_rank = 0,
	 star_tower_rank = 0, arena_score = 0, endless_rank = 0,
	 sky_ladder_rank = 0, cluster_champion_rank = 0,
	 arena_team_rank = 0, element_rank = 0, drama_rate = 0,
	 tag_list = [], ext = []}).

-file("src/mod/data/role_weekly_lib.erl", 21).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/mod/data/role_weekly_lib.erl", 22).

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

-file("src/mod/data/role_weekly_lib.erl", 23).

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

-file("src/mod/data/role_weekly_lib.erl", 24).

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

-file("src/mod/data/role_weekly_lib.erl", 25).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/data/role_weekly_lib.erl", 26).

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

-file("src/mod/data/role_weekly_lib.erl", 27).

-file("inc/mail.hrl", 1).

-record(mail,
	{sess  :: {pos_integer(), bitstring()},
	 to  :: {pos_integer(), bitstring()},
	 to_name = <<>>  :: bitstring(),
	 from  :: {non_neg_integer(), bitstring()},
	 from_name = <<>>  :: bitstring(), type = 1  :: 0..1,
	 group_id = 0  :: non_neg_integer(), status = 0  :: 0..1,
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 source = <<>>  :: pos_integer(),
	 rev_ts = 0  :: pos_integer(),
	 read_time = 0  :: pos_integer(),
	 send_time = 0  :: pos_integer(),
	 time_out = 0  :: pos_integer(), can_del = 1  :: 0..1}).

-record(gmail,
	{id = 0, type = 0  :: non_neg_integer(),
	 mail_type = 1  :: non_neg_integer(),
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 conds = []  :: list(), source = <<>>  :: pos_integer(),
	 can_del = 1  :: 0..1}).

-record(feedback,
	{sess, rid, feedback_id = 0, status = 0, score = 0,
	 send_time = 0, time_out = 0}).

-record(role_feedback_info,
	{role_id, id = 0, state = 0, status2 = 0,
	 start_time = 0, end_msg_time = 0, finish_time = 0,
	 score_time = 0, title = <<>>, content = <<>>,
	 questions_lists = [], answer_lists = [], score = 0}).

-file("src/mod/data/role_weekly_lib.erl", 28).

gm_get_weekly_data(RoleId) ->
    case role_weekly_mgr:get_data(RoleId) of
      Data = #role_weekly_report{end_time = EndTime,
				 face_id = FaceId, name = Name, lev = Lev,
				 power = Power, have_partners = HavePartners,
				 used_partners = UsedPartners,
				 get_partner = GetPartners, get_gold = GetGold,
				 get_high_recruit = GetHigh,
				 get_crystal = GetCrystal, login_day = LoginDay,
				 acc_time = AccTime, channel = Channel} ->
	  Now = date:unixtime(),
	  StartTime = EndTime - 86400 * 7 + 1,
	  MaxStarPartners = get_max_star_num(HavePartners),
	  MostUsedPartners = [get_skin(Bid, HavePartners)
			      || Bid
				     <- [Bid1
					 || {Bid1, _}
						<- lists:sublist(UsedPartners,
								 5)]],
	  AveTime = round(AccTime / max(1, LoginDay)),
	  TagList = role_weekly_lib:get_tag_list(Data,
						 role_weekly_data:tag_list(),
						 []),
	  ExpireTime = Now +
			 date:week_next_diff([1], {7, 59, 59}),
	  Flag = util:if_true(lists:member(Channel,
					   role_weekly_data:get_const(channel_list)),
			      1, 0),
	  RankList = get_rank_list(Data, [],
				   [arena_elite_lev, arena_cluster_rank,
				    star_tower_rank, arena_score, endless_rank,
				    sky_ladder_rank, cluster_champion_rank,
				    arena_team_rank, element_rank, drama_rate]),
	  {StartTime, EndTime, FaceId, Name, Lev, Power, TagList,
	   MaxStarPartners, MostUsedPartners, length(GetPartners),
	   RankList, GetGold, GetHigh, GetCrystal, LoginDay,
	   AveTime, ExpireTime, Flag};
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"找不到数据"/utf8>>)}
    end.

gm_send_all_weekly_mail() ->
    Now = date:unixtime(),
    {{Y, Month, Day}, {_, _, _}} =
	date:seconds_to_datetime(Now),
    EndTime = Now + date:week_next_diff([7], {23, 59, 59}),
    mail:global_send(#gmail{id =
				{role_weekly_report, {Y, Month, Day}},
			    end_time = EndTime,
			    subject = lang:get(<<"冒险周报"/utf8>>),
			    content =
				util:fbin(lang:get(<<"Thân ái nhẫn giả, báo cáo cuộc phiêu "
						     "lưu hàng tuần của bạn cho tuần trước "
						     "đã được tạo, nhưng<div fontsize=24 fontcolor="
						     "#289b14 href='weekly'> Nhấp để xem báo "
						     "cáo hàng tuần mới nhất</div>，chia sẻ "
						     "báo cáo hàng tuần và nhận 100 vàng"/utf8>>),
					  []),
			    conds =
				[{minlev, role_weekly_data:get_const(min_lev)},
				 {reg_time_end,
				  Now -
				    86400 *
				      role_weekly_data:get_const(min_reg_day)},
				 {logout_time_start,
				  Now -
				    86400 *
				      role_weekly_data:get_const(max_logout_day)},
				 {platform_names_not,
				  [<<"9377">>, <<"9377ios">>]}]}).

gm_send_weekly_mail(#role{id = Rid}) ->
    Now = date:unixtime(),
    EndTime = Now + date:week_next_diff([7], {23, 59, 59}),
    Content =
	util:fbin(lang:get(<<"Thân ái nhẫn giả, ngài đầu tuần mạo "
			     "hiểm báo tuần đã tạo ra, nhưng <div "
			     "fontsize=24 fontcolor=#289b14 href='weekly'> "
			     "Nhấp để xem báo cáo hàng tuần mới nhất</div>，"
			     "chia sẻ báo cáo hàng tuần và nhận 100 "
			     "vàng"/utf8>>),
		  []),
    mail:send(Rid,
	      {lang:get(<<"冒险周报"/utf8>>), Content, [], [],
	       <<"周报邮件"/utf8>>, EndTime}),
    ok.

get_weekly_data(RoleId) ->
    case role_weekly_mgr:get_last_week_data(RoleId) of
      Data = #role_weekly_report{end_time = EndTime,
				 face_id = FaceId, name = Name, lev = Lev,
				 power = Power, tag_list = TagList,
				 have_partners = HavePartners,
				 used_partners = UsedPartners,
				 get_partner = GetPartners, get_gold = GetGold,
				 get_high_recruit = GetHigh,
				 get_crystal = GetCrystal, login_day = LoginDay,
				 acc_time = AccTime, channel = Channel} ->
	  Now = date:unixtime(),
	  StartTime = EndTime - 86400 * 7 + 1,
	  MaxStarPartners = get_max_star_num(HavePartners),
	  MostUsedPartners = [get_skin(Bid, HavePartners)
			      || Bid
				     <- [Bid1
					 || {Bid1, _}
						<- lists:sublist(UsedPartners,
								 5)]],
	  AveTime = round(AccTime / max(1, LoginDay)),
	  ExpireTime = Now +
			 date:week_next_diff([1], {7, 59, 59}),
	  Flag = util:if_true(lists:member(Channel,
					   role_weekly_data:get_const(channel_list)),
			      1, 0),
	  RankList = get_rank_list(Data, [],
				   [arena_elite_lev, arena_cluster_rank,
				    star_tower_rank, arena_score, endless_rank,
				    sky_ladder_rank, cluster_champion_rank,
				    arena_team_rank, element_rank, drama_rate]),
	  {StartTime, EndTime, FaceId, Name, Lev, Power, TagList,
	   MaxStarPartners, MostUsedPartners, length(GetPartners),
	   RankList, GetGold, GetHigh, GetCrystal, LoginDay,
	   AveTime, ExpireTime, Flag};
      {false, Reason} -> {false, Reason};
      _ -> {false, <<"找不到数据"/utf8>>}
    end.

send_weekly_share_award(RoleId) ->
    Now = date:unixtime(),
    AwardList = sys_env:get(role_weekly_award_info, []),
    Item = role_weekly_data:get_const(share_reward_week),
    {MailAssets, MailItems} =
	format:split_assets_items(Item),
    Mail = {lang:get(<<"冒险周报分享好礼"/utf8>>),
	    lang:get(<<"亲爱的冒险者大人，这是您分享冒险周报获得的奖励，请查收！"/utf8>>),
	    MailAssets, MailItems, <<"冒险周报分享好礼"/utf8>>,
	    86400 + Now},
    case lists:keyfind(RoleId, 1, AwardList) of
      {RoleId, LastTime, NextTime}
	  when is_integer(LastTime) andalso
		 is_integer(NextTime) andalso
		   LastTime > 0 andalso NextTime > 0 ->
	  case Now > NextTime of
	    true ->
		mail:send(RoleId, Mail),
		NewAwardList = lists:keystore(RoleId, 1, AwardList,
					      {RoleId, Now,
					       Now +
						 date:week_next_diff([1],
								     {7, 59,
								      59})}),
		sys_env:save(role_weekly_award_info, NewAwardList),
		ok;
	    _ -> {false, <<"本周周报分享奖励已发放"/utf8>>}
	  end;
      _ ->
	  mail:send(RoleId, Mail),
	  NewAwardList = lists:keystore(RoleId, 1, AwardList,
					{RoleId, Now,
					 Now +
					   date:week_next_diff([1],
							       {7, 59, 59})}),
	  sys_env:save(role_weekly_award_info, NewAwardList),
	  ok
    end.

get_max_star_num(HavePartners) ->
    Fun = fun ({_, _, Star, _, _, _, _}, Acc)
		  when Star >= 5 ->
		  OldNum = list_util:keyfind(Star, Acc, 0),
		  NewAcc = lists:keystore(Star, 1, Acc,
					  {Star, OldNum + 1}),
		  NewAcc;
	      (_, Acc) -> Acc
	  end,
    List = lists:foldl(Fun, [], HavePartners),
    NewList = lists:sublist(lists:reverse(lists:keysort(1,
							List)),
			    5),
    NewList.

get_skin(Bid, HavePartners) ->
    List1 = [P
	     || P = {_, Bid1, _, _, _, _, _} <- HavePartners,
		Bid1 =:= Bid],
    Fun = fun ({_, _, _, _, _, CampType, UseSkin},
	       {Acc1, _Acc2}) ->
		  case UseSkin > Acc1 of
		    true -> {UseSkin, CampType};
		    _ -> {Acc1, CampType}
		  end
	  end,
    {SkinId, CampType1} = lists:foldl(Fun, {0, 0}, List1),
    {Bid, CampType1, SkinId}.

get_last_tag(_List, GetList, 0) -> GetList;
get_last_tag(List, GetList, Num) ->
    Tag = {Id, _} = util:rand_list(List, 2),
    get_last_tag(List -- [Tag], [Id | GetList], Num - 1).

get_tag_list(_Data, [], List) ->
    List1 = lists:sublist(lists:reverse(lists:keysort(2,
						      List)),
			  8),
    List2 = [Id || {Id, _} <- List1],
    Fun = fun (Id, Acc) ->
		  case Id < 1000 of
		    true -> [role_weekly_data:get_tag_name(Id) | Acc];
		    _ -> [role_weekly_data:get_limit_tag_name(Id) | Acc]
		  end
	  end,
    case length(List2) < 8 of
      true ->
	  List3 = get_last_tag(role_weekly_data:limit_tag_list(),
			       [], 8 - length(List2)),
	  List4 = List2 ++ List3,
	  List5 = lists:foldl(Fun, [], List4),
	  List5;
      _ -> List6 = lists:foldl(Fun, [], List2), List6
    end;
get_tag_list(Data =
		 #role_weekly_report{cluster_champion_rank = Rank},
	     [{Id, {evt_arena_champion_rank, N}, Flag} | T], List) ->
    NewList = case Rank >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{arena_team_rank
					    = Rank},
	     [{Id, {evt_arena_team_rank, N}, Flag} | T], List) ->
    NewList = case Rank >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{arena_elite_lev
					    = Lev},
	     [{Id, {evt_arena_elite_lev, N}, Flag} | T], List) ->
    NewList = case Lev >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{login_day =
					    Day},
	     [{Id, {evt_login_day, N}, Flag} | T], List) ->
    NewList = case Day >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{get_partner =
					    Partners},
	     [{Id, {evt_get_partner, N}, Flag} | T], List) ->
    NewList = case length(Partners) >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{get_high_recruit
					    = Num},
	     [{Id, {evt_get_high_recruit, N}, Flag} | T], List) ->
    NewList = case Num >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{get_crystal =
					    Num},
	     [{Id, {evt_get_crystal, N}, Flag} | T], List) ->
    NewList = case Num >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{get_gold = Num},
	     [{Id, {evt_get_gold, N}, Flag} | T], List) ->
    NewList = case Num >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{element_rank =
					    Num},
	     [{Id, {evt_element_rank, N}, Flag} | T], List) ->
    NewList = case Num >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{power = Num},
	     [{Id, {evt_power, N}, Flag} | T], List) ->
    NewList = case Num >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data =
		 #role_weekly_report{arena_cluster_rank = Num},
	     [{Id, {evt_arena_cluster_rank, N}, Flag} | T], List) ->
    NewList = case Num >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{have_partners =
					    Partners},
	     [{Id, {evt_have_star_partner_num, S, N}, Flag} | T],
	     List) ->
    Fun = fun ({_, _, Star, _, _, _, _}, Acc) ->
		  case Star >= S of
		    true -> Acc + 1;
		    _ -> Acc
		  end
	  end,
    Num = lists:foldl(Fun, 0, Partners),
    NewList = case Num >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{used_partners =
					    Partners},
	     [{Id, {evt_used_partner, Bid}, Flag} | T], List) ->
    NewList = case lists:keymember(Bid, 1,
				   lists:sublist(Partners, 5))
		  of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{get_sprite =
					    SpriteList},
	     [{Id, {evt_get_sprite, Q, N}, Flag} | T], List) ->
    Fun = fun (Bid, Acc) ->
		  case item_data:get(Bid) of
		    #item_base{type = 36, quality = Quality} ->
			case Quality =:= Q of
			  true -> Acc + 1;
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    Num = lists:foldl(Fun, 0, SpriteList),
    NewList = case Num >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data = #role_weekly_report{send_point =
					    Num},
	     [{Id, {evt_send_point, N}, Flag} | T], List) ->
    NewList = case Num >= N of
		true -> [{Id, Flag} | List];
		_ -> List
	      end,
    get_tag_list(Data, T, NewList);
get_tag_list(Data, [H | T], List) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_weekly_lib328, _,
       {__Levelrole_weekly_lib328, __Tracesrole_weekly_lib328}}
	  when __Levelrole_weekly_lib328 band 128 /= 0 orelse
		 __Tracesrole_weekly_lib328 /= [] ->
	  lager:do_log(debug,
		       [{module, role_weekly_lib}, {function, get_tag_list},
			{line, 328}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("配置了未经处理的标签~w", [H]), none, 4096, 128,
		       __Levelrole_weekly_lib328, __Tracesrole_weekly_lib328,
		       lager_event, __Pidrole_weekly_lib328);
      _ -> ok
    end,
    get_tag_list(Data, T, List).

get_rank_list(_, List, []) ->
    [{Name, Type, Rank, Percent}
     || {Name, Type, _, Percent, Rank}
	    <- lists:sublist(lists:reverse(lists:keysort(3, List)),
			     role_weekly_data:get_const(show_beyond_num)),
	Rank =/= 0];
get_rank_list(Data, List, [H | T]) ->
    NewList = case get_rank_list(Data, H) of
		Ele when is_tuple(Ele) -> [Ele | List];
		_ -> List
	      end,
    get_rank_list(Data, NewList, T).

get_rank_list(#role_weekly_report{arena_elite_lev =
				      Lev},
	      arena_elite_lev) ->
    AliveNum =
	role_weekly_mgr:get_type_alive_num(arena_elite_lev),
    Fun = fun (#role_weekly_report{arena_elite_lev = ALev},
	       Acc) ->
		  case ALev >= Lev of
		    true -> Acc + 1;
		    _ -> Acc
		  end
	  end,
    NewAcc = ets:foldl(Fun, 1, role_weekly_report),
    Coe = role_weekly_data:get_const(arena_elite_lev_coe),
    Percent = util:if_true(Lev =:= 0, 0,
			   round(max(0, AliveNum - NewAcc) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"超凡段位赛"/utf8>>), lang:get(<<"段位"/utf8>>),
     CoePercent, Percent, Lev};
get_rank_list(#role_weekly_report{arena_cluster_rank =
				      Rank},
	      arena_cluster_rank) ->
    AliveNum =
	role_weekly_mgr:get_type_alive_num(arena_cluster_rank),
    Fun = fun (#role_weekly_report{arena_cluster_rank =
				       ARank},
	       Acc) ->
		  case ARank =< Rank andalso ARank =/= 0 of
		    true -> Acc + 1;
		    _ -> Acc
		  end
	  end,
    NewAcc = ets:foldl(Fun, 1, role_weekly_report),
    Coe =
	role_weekly_data:get_const(arena_cluster_rank_coe),
    Percent = util:if_true(Rank =:= 0, 0,
			   round(max(0, AliveNum - NewAcc) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"跨服竞技场"/utf8>>), lang:get(<<"排名"/utf8>>),
     CoePercent, Percent, Rank};
get_rank_list(#role_weekly_report{star_tower_rank =
				      Rank},
	      star_tower_rank) ->
    AliveNum =
	role_weekly_mgr:get_type_alive_num(star_tower_rank),
    Coe = role_weekly_data:get_const(star_tower_rank_coe),
    Percent = util:if_true(Rank =:= 0, 0,
			   round(max(0, AliveNum - Rank) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"试炼塔"/utf8>>), lang:get(<<"排名"/utf8>>),
     CoePercent, Percent, Rank};
get_rank_list(#role_weekly_report{rid = {Rid, _},
				  arena_score = _Score},
	      arena_score) ->
    Rank = arena_lib:role_rank(Rid),
    AliveNum =
	role_weekly_mgr:get_type_alive_num(arena_score),
    Coe = role_weekly_data:get_const(arena_score_coe),
    Percent = util:if_true(Rank =:= 0, 0,
			   round(max(0, AliveNum - Rank) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"竞技场"/utf8>>), lang:get(<<"排名"/utf8>>),
     CoePercent, Percent, Rank};
get_rank_list(#role_weekly_report{endless_rank = Rank},
	      endless_rank) ->
    AliveNum =
	role_weekly_mgr:get_type_alive_num(endless_rank),
    Coe = role_weekly_data:get_const(endless_rank_coe),
    Percent = util:if_true(Rank =:= 0, 0,
			   round(max(0, AliveNum - Rank) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"无尽试炼"/utf8>>), lang:get(<<"排名"/utf8>>),
     CoePercent, Percent, Rank};
get_rank_list(#role_weekly_report{sky_ladder_rank =
				      Rank},
	      sky_ladder_rank) ->
    AliveNum =
	role_weekly_mgr:get_type_alive_num(sky_ladder_rank),
    Fun = fun (#role_weekly_report{sky_ladder_rank = ARank},
	       Acc) ->
		  case ARank =< Rank andalso ARank =/= 0 of
		    true -> Acc + 1;
		    _ -> Acc
		  end
	  end,
    NewAcc = ets:foldl(Fun, 1, role_weekly_report),
    Coe = role_weekly_data:get_const(sky_ladder_rank_coe),
    Percent = util:if_true(Rank =:= 0, 0,
			   round(max(0, AliveNum - NewAcc) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"跨服天梯"/utf8>>), lang:get(<<"排名"/utf8>>),
     CoePercent, Percent, Rank};
get_rank_list(#role_weekly_report{cluster_champion_rank
				      = Rank},
	      cluster_champion_rank) ->
    AliveNum =
	role_weekly_mgr:get_type_alive_num(cluster_champion_rank),
    Fun = fun (#role_weekly_report{sky_ladder_rank = ARank},
	       Acc) ->
		  case ARank =< Rank andalso ARank =/= 0 of
		    true -> Acc + 1;
		    _ -> Acc
		  end
	  end,
    NewAcc = ets:foldl(Fun, 1, role_weekly_report),
    Coe =
	role_weekly_data:get_const(cluster_champion_rank_coe),
    Percent = util:if_true(Rank =:= 0, 0,
			   round(max(0, AliveNum - NewAcc) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"周冠军赛"/utf8>>), lang:get(<<"排名"/utf8>>),
     CoePercent, Percent, Rank};
get_rank_list(#role_weekly_report{arena_team_rank =
				      Rank},
	      arena_team_rank) ->
    AliveNum =
	role_weekly_mgr:get_type_alive_num(arena_team_rank),
    Fun = fun (#role_weekly_report{sky_ladder_rank = ARank},
	       Acc) ->
		  case ARank =< Rank andalso ARank =/= 0 of
		    true -> Acc + 1;
		    _ -> Acc
		  end
	  end,
    NewAcc = ets:foldl(Fun, 1, role_weekly_report),
    Coe = role_weekly_data:get_const(arena_team_rank_coe),
    Percent = util:if_true(Rank =:= 0, 0,
			   round(max(0, AliveNum - NewAcc) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"组队竞技场"/utf8>>), lang:get(<<"排名"/utf8>>),
     CoePercent, Percent, Rank};
get_rank_list(#role_weekly_report{element_rank = Rank0},
	      element_rank) ->
    Rank = util:if_true(is_integer(Rank0), Rank0, 0),
    AliveNum =
	role_weekly_mgr:get_type_alive_num(element_rank),
    Coe = role_weekly_data:get_const(element_rank_coe),
    Percent = util:if_true(Rank =:= 0, 0,
			   round(max(0, AliveNum - Rank) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"元素圣殿"/utf8>>), lang:get(<<"排名"/utf8>>),
     CoePercent, Percent, Rank};
get_rank_list(#role_weekly_report{drama_rate = Rank},
	      drama_rate) ->
    AliveNum =
	role_weekly_mgr:get_type_alive_num(drama_rate),
    Coe = role_weekly_data:get_const(drama_rate_coe),
    Percent = util:if_true(Rank =:= 0, 0,
			   round(max(0, AliveNum - Rank) / AliveNum * 100)),
    CoePercent = Percent * Coe,
    {lang:get(<<"剧情关卡"/utf8>>), lang:get(<<"排名"/utf8>>),
     CoePercent, Percent, Rank};
get_rank_list(_Data, _) -> false.


