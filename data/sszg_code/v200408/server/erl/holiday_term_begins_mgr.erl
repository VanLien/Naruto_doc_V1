-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      1).

-module(holiday_term_begins_mgr).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
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
		{role_feedback_info,
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
		{cross_group, [group_id, main, group_list]},
		{cloud_task, [id, pos]},
		{srv,
		 [id, full_id, pid, type, platform, name, node, cookie,
		  ver, is_main, group_id]},
		{holiday_term_begins_boss_rank, [rank, id, all_dps]},
		{holiday_term_begins_boss_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time]},
		{holiday_term_begins_boss,
		 [var, id, unit_id, boss_endtime, boss_hp, dps, buff_lev,
		  paper_num, reward, kill_reward, is_kill, boss_id]},
		{m_holiday_term_begins,
		 [ver, camp_id, round, round_endtime, difficulty,
		  order_id, order_endtime, fight_count, buy_count,
		  order_hp, submit_paper, paper_reward, boss_endtime,
		  boss_dps, boss_dps_list, all_boss_dps, best_partner_id,
		  hurt_statistics]},
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
		{state, [next_rank]}]).

-behaviour(gen_server).

-record(state, {next_rank = 1}).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([check_status/0, get_boss/1, get_boss_info/1]).

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

-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      16).

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

-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      17).

-file("inc/holiday_term_begins.hrl", 1).

-record(m_holiday_term_begins,
	{ver = 1, camp_id = 0, round = 0, round_endtime = 0,
	 difficulty = 0, order_id = 1, order_endtime = 0,
	 fight_count = 0, buy_count = 0, order_hp = [],
	 submit_paper = 0, paper_reward = [], boss_endtime = 0,
	 boss_dps = 0, boss_dps_list = [], all_boss_dps = 0,
	 best_partner_id = 0, hurt_statistics = []}).

-record(holiday_term_begins_boss,
	{var = 1, id = 0, unit_id = 0, boss_endtime = 0,
	 boss_hp = [], dps = 0, buff_lev = 0, paper_num = 0,
	 reward = [], kill_reward = [], is_kill = 0,
	 boss_id = 0}).

-record(holiday_term_begins_boss_rank_role,
	{var = 1, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0}).

-record(holiday_term_begins_boss_rank,
	{rank = 0, id = {0, <<>>}, all_dps = 0}).

-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      18).

-file("inc/cluster.hrl", 1).

-record(srv,
	{id = <<>>, full_id = [], pid, type = normal, platform,
	 name = <<>>, node, cookie, ver, is_main = 0,
	 group_id = 0}).

-record(cloud_task, {id, pos = 0}).

-record(cross_group,
	{group_id = 0, main, group_list = []}).

-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      19).

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

-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      20).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      21).

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

-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      22).

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

-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      23).

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

-file("src/mod/holiday_term_begins/holiday_term_begi"
      "ns_mgr.erl",
      24).

check_status() ->
    case sys_env:get(term_begins_group_status) of
      undefined -> skip;
      _ -> holiday_term_begins_mgr ! {get_group}
    end.

info(Info) -> holiday_term_begins_mgr ! Info.

cast(Info) ->
    gen_server:cast(holiday_term_begins_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_term_begins_mgr,
			       Info, 10000)
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
	    {__Pidholiday_term_begins_mgr42, _,
	     {__Levelholiday_term_begins_mgr42,
	      __Tracesholiday_term_begins_mgr42}}
		when __Levelholiday_term_begins_mgr42 band 8 /= 0 orelse
		       __Tracesholiday_term_begins_mgr42 /= [] ->
		lager:do_log(error,
			     [{module, holiday_term_begins_mgr},
			      {function, call}, {line, 42},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_term_begins_mgr, Info,
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_term_begins_mgr42,
			     __Tracesholiday_term_begins_mgr42, lager_event,
			     __Pidholiday_term_begins_mgr42);
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

start_link() ->
    gen_server:start_link({local, holiday_term_begins_mgr},
			  holiday_term_begins_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr48, _,
       {__Levelholiday_term_begins_mgr48,
	__Tracesholiday_term_begins_mgr48}}
	  when __Levelholiday_term_begins_mgr48 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr48 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr}, {function, init},
			{line, 48}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...",
				     [holiday_term_begins_mgr]),
		       none, 4096, 64, __Levelholiday_term_begins_mgr48,
		       __Tracesholiday_term_begins_mgr48, lager_event,
		       __Pidholiday_term_begins_mgr48);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(term_begins_paper,
			"dets/term_begins_paper.dets", 1, set),
    d_ets_lib:load_dets_to_ets(term_begins_paper,
			       undefined),
    d_ets_lib:new_d_ets(holiday_term_begins_boss,
			"dets/holiday_term_begins_boss.dets",
			#holiday_term_begins_boss.id, set),
    d_ets_lib:load_dets_to_ets(holiday_term_begins_boss,
			       undefined),
    d_ets_lib:new_d_ets(term_begins_role,
			"dets/term_begins_role.dets",
			#holiday_term_begins_boss_rank_role.r_id, set),
    d_ets_lib:load_dets_to_ets(term_begins_role, undefined),
    util:set_timer(update_rank_timer, util:rand(300, 540),
		   update_save),
    ets:new(term_begins_rank,
	    [set, named_table, public,
	     {keypos, #holiday_term_begins_boss_rank.rank}]),
    ets:new(term_begins_update,
	    [set, named_table, public, {keypos, 1}]),
    Fun = fun (#holiday_term_begins_boss_rank_role{r_id =
						       RoleId,
						   rank = Rank,
						   all_dps = AllDps},
	       Rank1) ->
		  case Rank > 0 of
		    true ->
			ets:insert(term_begins_rank,
				   #holiday_term_begins_boss_rank{rank = Rank,
								  id = RoleId,
								  all_dps =
								      AllDps});
		    _ -> skip
		  end,
		  max(Rank, Rank1)
	  end,
    NextRank = ets:foldl(Fun, 0, term_begins_role) + 1,
    State = #state{next_rank = NextRank},
    set_time_1(),
    set_time_2(),
    init_boss_timer(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr81, _,
       {__Levelholiday_term_begins_mgr81,
	__Tracesholiday_term_begins_mgr81}}
	  when __Levelholiday_term_begins_mgr81 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr81 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr}, {function, init},
			{line, 81}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_term_begins_mgr]),
		       none, 4096, 64, __Levelholiday_term_begins_mgr81,
		       __Tracesholiday_term_begins_mgr81, lager_event,
		       __Pidholiday_term_begins_mgr81);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr89, _,
	     {__Levelholiday_term_begins_mgr89,
	      __Tracesholiday_term_begins_mgr89}}
		when __Levelholiday_term_begins_mgr89 band 8 /= 0 orelse
		       __Tracesholiday_term_begins_mgr89 /= [] ->
		lager:do_log(error,
			     [{module, holiday_term_begins_mgr},
			      {function, handle_call}, {line, 89},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_term_begins_mgr89,
			     __Tracesholiday_term_begins_mgr89, lager_event,
			     __Pidholiday_term_begins_mgr89);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_term_begins_mgr, 90, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr102, _,
	     {__Levelholiday_term_begins_mgr102,
	      __Tracesholiday_term_begins_mgr102}}
		when __Levelholiday_term_begins_mgr102 band 8 /= 0
		       orelse __Tracesholiday_term_begins_mgr102 /= [] ->
		lager:do_log(error,
			     [{module, holiday_term_begins_mgr},
			      {function, handle_info}, {line, 102},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_term_begins_mgr102,
			     __Tracesholiday_term_begins_mgr102, lager_event,
			     __Pidholiday_term_begins_mgr102);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_term_begins_mgr, 103, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    d_ets_lib:save(term_begins_role),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr109, _,
       {__Levelholiday_term_begins_mgr109,
	__Tracesholiday_term_begins_mgr109}}
	  when __Levelholiday_term_begins_mgr109 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr109 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr},
			{function, terminate}, {line, 109},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelholiday_term_begins_mgr109,
		       __Tracesholiday_term_begins_mgr109, lager_event,
		       __Pidholiday_term_begins_mgr109);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr121, _,
	     {__Levelholiday_term_begins_mgr121,
	      __Tracesholiday_term_begins_mgr121}}
		when __Levelholiday_term_begins_mgr121 band 8 /= 0
		       orelse __Tracesholiday_term_begins_mgr121 /= [] ->
		lager:do_log(error,
			     [{module, holiday_term_begins_mgr},
			      {function, do_handle_call}, {line, 121},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_term_begins_mgr121,
			     __Tracesholiday_term_begins_mgr121, lager_event,
			     __Pidholiday_term_begins_mgr121);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_term_begins_mgr, 122, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call({get_paper_count_per, Name, All}, _From,
	       State) ->
    Return = case ets:lookup(term_begins_paper, Name) of
	       [{Name, Count} | _] ->
		   Per = trunc(Count / All * 1000), {Count, Per};
	       _ -> {0, 0}
	     end,
    {reply, Return, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr143, _,
	     {__Levelholiday_term_begins_mgr143,
	      __Tracesholiday_term_begins_mgr143}}
		when __Levelholiday_term_begins_mgr143 band 8 /= 0
		       orelse __Tracesholiday_term_begins_mgr143 /= [] ->
		lager:do_log(error,
			     [{module, holiday_term_begins_mgr},
			      {function, do_handle_info}, {line, 143},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_term_begins_mgr143,
			     __Tracesholiday_term_begins_mgr143, lager_event,
			     __Pidholiday_term_begins_mgr143);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_term_begins_mgr, 144, _Reason}),
	  {noreply, State}
    end;
do_handle_info({commit_paper, Name, Num, RolePid},
	       State) ->
    case ets:lookup(term_begins_paper, Name) of
      [{Name, OldNum} | _] ->
	  d_ets_lib:save_d_ets(term_begins_paper,
			       {Name, OldNum + Num});
      _ ->
	  d_ets_lib:save_d_ets(term_begins_paper, {Name, Num})
    end,
    role_lib:cast(by_pid, RolePid,
		  {holiday_term_begins, push, []}),
    {noreply, State};
do_handle_info({add_dps, Dps, BossDpsList, RolePid},
	       State) ->
    case get_boss_info(0) of
      Boss = #holiday_term_begins_boss{is_kill = 1,
				       dps = AllDps} ->
	  NewBoss = Boss#holiday_term_begins_boss{dps =
						      AllDps + Dps},
	  d_ets_lib:save_d_ets(holiday_term_begins_boss, NewBoss);
      Boss = #holiday_term_begins_boss{boss_hp = BossHp,
				       dps = AllDps, is_kill = 0,
				       kill_reward = KillReward,
				       paper_num = PaperNum} ->
	  NewBossHp = merge_hp(BossDpsList, BossHp),
	  case lists:filter(fun ({_, HpTemp, _}) -> HpTemp > 0
			    end,
			    NewBossHp)
	      of
	    [] ->
		NewBoss = Boss#holiday_term_begins_boss{boss_hp =
							    NewBossHp,
							dps = AllDps + Dps,
							is_kill = 1,
							paper_num =
							    PaperNum + 1},
		kill_reward(1, KillReward),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_term_begins_mgr167, _,
		   {__Levelholiday_term_begins_mgr167,
		    __Tracesholiday_term_begins_mgr167}}
		      when __Levelholiday_term_begins_mgr167 band 64 /= 0
			     orelse __Tracesholiday_term_begins_mgr167 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_term_begins_mgr},
				    {function, do_handle_info}, {line, 167},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("开学季BOSS被击杀，当前状态:~w, 参与人数:~w",
						 [NewBoss,
						  holiday_term_begins_boss:max_rank()]),
				   none, 4096, 64,
				   __Levelholiday_term_begins_mgr167,
				   __Tracesholiday_term_begins_mgr167,
				   lager_event,
				   __Pidholiday_term_begins_mgr167);
		  _ -> ok
		end,
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_term_begins_mgr168, _,
		   {__Levelholiday_term_begins_mgr168,
		    __Tracesholiday_term_begins_mgr168}}
		      when __Levelholiday_term_begins_mgr168 band 128 /= 0
			     orelse __Tracesholiday_term_begins_mgr168 /= [] ->
		      lager:do_log(debug,
				   [{module, holiday_term_begins_mgr},
				    {function, do_handle_info}, {line, 168},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("增加的BOSS伤害~w，剩余血量~w",
						 [BossDpsList, NewBossHp]),
				   none, 4096, 128,
				   __Levelholiday_term_begins_mgr168,
				   __Tracesholiday_term_begins_mgr168,
				   lager_event,
				   __Pidholiday_term_begins_mgr168);
		  _ -> ok
		end,
		d_ets_lib:save_d_ets(holiday_term_begins_boss, NewBoss);
	    _ ->
		NewBoss = Boss#holiday_term_begins_boss{boss_hp =
							    NewBossHp,
							dps = AllDps + Dps,
							paper_num =
							    PaperNum + 1},
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_term_begins_mgr172, _,
		   {__Levelholiday_term_begins_mgr172,
		    __Tracesholiday_term_begins_mgr172}}
		      when __Levelholiday_term_begins_mgr172 band 128 /= 0
			     orelse __Tracesholiday_term_begins_mgr172 /= [] ->
		      lager:do_log(debug,
				   [{module, holiday_term_begins_mgr},
				    {function, do_handle_info}, {line, 172},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("增加的BOSS伤害~w，剩余血量~w",
						 [BossDpsList, NewBossHp]),
				   none, 4096, 128,
				   __Levelholiday_term_begins_mgr172,
				   __Tracesholiday_term_begins_mgr172,
				   lager_event,
				   __Pidholiday_term_begins_mgr172);
		  _ -> ok
		end,
		d_ets_lib:save_d_ets(holiday_term_begins_boss, NewBoss)
	  end,
	  ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr177, _,
	     {__Levelholiday_term_begins_mgr177,
	      __Tracesholiday_term_begins_mgr177}}
		when __Levelholiday_term_begins_mgr177 band 8 /= 0
		       orelse __Tracesholiday_term_begins_mgr177 /= [] ->
		lager:do_log(error,
			     [{module, holiday_term_begins_mgr},
			      {function, do_handle_info}, {line, 177},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "居然没有找到开学活动BOSS", none, 4096, 8,
			     __Levelholiday_term_begins_mgr177,
			     __Tracesholiday_term_begins_mgr177, lager_event,
			     __Pidholiday_term_begins_mgr177);
	    _ -> ok
	  end,
	  skip
    end,
    role_lib:cast(by_pid, RolePid,
		  {holiday_term_begins, push, []}),
    {noreply, State};
do_handle_info({update_rank,
		RankRole = #holiday_term_begins_boss_rank_role{r_id =
								   RoleId}},
	       State = #state{next_rank = NextRank}) ->
    Now = date:unixtime(),
    Info = sys_env:get(holiday_term_begins_boss_info, #{}),
    EndTime = maps:get(reward_time, Info, 0),
    case EndTime > Now of
      true ->
	  case holiday_term_begins_boss:get_role(RoleId) of
	    {ok,
	     #holiday_term_begins_boss_rank_role{rank = OldRank}} ->
		NewRankRole =
		    RankRole#holiday_term_begins_boss_rank_role{rank =
								    OldRank},
		do_update_rank(NewRankRole),
		role_lib:cast(by_id, RoleId,
			      {holiday_term_begins, push_base, []}),
		{noreply, State};
	    false ->
		NewRankRole =
		    RankRole#holiday_term_begins_boss_rank_role{rank =
								    NextRank},
		do_update_rank(NewRankRole),
		role_lib:cast(by_id, RoleId,
			      {holiday_term_begins, push_base, []}),
		{noreply, State#state{next_rank = NextRank + 1}}
	  end;
      _ -> {noreply, State}
    end;
do_handle_info(update_save, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr206, _,
       {__Levelholiday_term_begins_mgr206,
	__Tracesholiday_term_begins_mgr206}}
	  when __Levelholiday_term_begins_mgr206 band 128 /= 0
		 orelse __Tracesholiday_term_begins_mgr206 /= [] ->
	  lager:do_log(debug,
		       [{module, holiday_term_begins_mgr},
			{function, do_handle_info}, {line, 206},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开学BOSS数据保存:~w",
				     [ets:info(term_begins_update, size)]),
		       none, 4096, 128, __Levelholiday_term_begins_mgr206,
		       __Tracesholiday_term_begins_mgr206, lager_event,
		       __Pidholiday_term_begins_mgr206);
      _ -> ok
    end,
    catch do_save_update(ets:tab2list(term_begins_update)),
    ets:delete_all_objects(term_begins_update),
    util:set_timer(update_rank_timer, util:rand(300, 540),
		   update_save),
    {noreply, State};
do_handle_info({get_group}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr212, _,
       {__Levelholiday_term_begins_mgr212,
	__Tracesholiday_term_begins_mgr212}}
	  when __Levelholiday_term_begins_mgr212 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr212 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr},
			{function, do_handle_info}, {line, 212},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始分配组", none, 4096, 64,
		       __Levelholiday_term_begins_mgr212,
		       __Tracesholiday_term_begins_mgr212, lager_event,
		       __Pidholiday_term_begins_mgr212);
      _ -> ok
    end,
    sys_env:set(term_begins_group_status, ok),
    catch cluster_group:handle_repair(),
    get_cluster_group(),
    {noreply, State};
do_handle_info({clear_data}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr218, _,
       {__Levelholiday_term_begins_mgr218,
	__Tracesholiday_term_begins_mgr218}}
	  when __Levelholiday_term_begins_mgr218 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr218 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr},
			{function, do_handle_info}, {line, 218},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "清空本轮BOSS数据", none, 4096, 64,
		       __Levelholiday_term_begins_mgr218,
		       __Tracesholiday_term_begins_mgr218, lager_event,
		       __Pidholiday_term_begins_mgr218);
      _ -> ok
    end,
    log_rank:save(47),
    d_ets_lib:clear_d_ets(term_begins_paper),
    d_ets_lib:clear_d_ets(holiday_term_begins_boss),
    d_ets_lib:clear_d_ets(term_begins_role),
    ets:delete_all_objects(term_begins_rank),
    ets:delete_all_objects(term_begins_update),
    set_time_2(),
    sys_env:del(holiday_term_begins_boss_info),
    init_boss_timer(),
    {noreply, State#state{next_rank = 1}};
do_handle_info(upload_data, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr230, _,
       {__Levelholiday_term_begins_mgr230,
	__Tracesholiday_term_begins_mgr230}}
	  when __Levelholiday_term_begins_mgr230 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr230 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr},
			{function, do_handle_info}, {line, 230},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开学季BOSS上传数据", none, 4096, 64,
		       __Levelholiday_term_begins_mgr230,
		       __Tracesholiday_term_begins_mgr230, lager_event,
		       __Pidholiday_term_begins_mgr230);
      _ -> ok
    end,
    ActNum = get_alive_num(),
    WorldLev = world_lev:get_world_lev(),
    SrvId = sys_env:get(server_id),
    holiday_term_begins_boss:send_info(holiday_term_begins_mgr,
				       info,
				       [{receive_data, SrvId, ActNum,
					 WorldLev}]),
    {noreply, State};
do_handle_info({receive_data, SrvId, ActNum, WorldLev},
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr237, _,
       {__Levelholiday_term_begins_mgr237,
	__Tracesholiday_term_begins_mgr237}}
	  when __Levelholiday_term_begins_mgr237 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr237 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr},
			{function, do_handle_info}, {line, 237},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开学季BOSS接受数据 ~w ~w ~w",
				     [SrvId, ActNum, WorldLev]),
		       none, 4096, 64, __Levelholiday_term_begins_mgr237,
		       __Tracesholiday_term_begins_mgr237, lager_event,
		       __Pidholiday_term_begins_mgr237);
      _ -> ok
    end,
    List = sys_env:get(term_match_boss_list, []),
    NewList = lists:keystore(SrvId, 1, List,
			     {SrvId, ActNum, WorldLev}),
    sys_env:save(term_match_boss_list, NewList),
    {noreply, State};
do_handle_info(match_boss, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr243, _,
       {__Levelholiday_term_begins_mgr243,
	__Tracesholiday_term_begins_mgr243}}
	  when __Levelholiday_term_begins_mgr243 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr243 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr},
			{function, do_handle_info}, {line, 243},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开学季BOSS匹配", none, 4096, 64,
		       __Levelholiday_term_begins_mgr243,
		       __Tracesholiday_term_begins_mgr243, lager_event,
		       __Pidholiday_term_begins_mgr243);
      _ -> ok
    end,
    case is_main() of
      true ->
	  case parse_time_2(holiday_term_begins_data:round_list(),
			    date:unixtime(), [])
	      of
	    [{Round, _, BossEndTime} | _] ->
		case holiday_term_begins_mgr:get_boss_info(0) of
		  #holiday_term_begins_boss{boss_endtime = BossEndTime} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_term_begins_mgr250, _,
			 {__Levelholiday_term_begins_mgr250,
			  __Tracesholiday_term_begins_mgr250}}
			    when __Levelholiday_term_begins_mgr250 band 64 /= 0
				   orelse
				   __Tracesholiday_term_begins_mgr250 /= [] ->
			    lager:do_log(info,
					 [{module, holiday_term_begins_mgr},
					  {function, do_handle_info},
					  {line, 250},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 "本轮已匹配过BOSS，不再进行匹配", none, 4096, 64,
					 __Levelholiday_term_begins_mgr250,
					 __Tracesholiday_term_begins_mgr250,
					 lager_event,
					 __Pidholiday_term_begins_mgr250);
			_ -> ok
		      end,
		      skip;
		  _ ->
		      case sys_env:get(term_match_boss_list) of
			List = [_ | _] ->
			    Len = length(List),
			    ActNum = max(200,
					 lists:sum([ActNumT
						    || {_, ActNumT, _}
							   <- List])),
			    WorldLev = lists:sum([WorldLevT
						  || {_, _, WorldLevT}
							 <- List]),
			    AvgWorldLev = max(51, WorldLev div Len),
			    {UnitId, BossId, FightAward, HitAward, Coe} =
				holiday_term_begins_data:match_boss({Round,
								     AvgWorldLev}),
			    BaseHpMax = unit_monster:get_boss_hp_max(UnitId),
			    PaperNum = case ets:lookup(term_begins_paper,
						       paper_count)
					   of
					 [{_, PaperNumT}] -> PaperNumT;
					 _ -> 0
				       end,
			    HitRate0 = min(100,
					   util:round(PaperNum * 100 /
							holiday_term_begins_data:get_const(collection_quantity))),
			    HitRate = HitRate0 *
					holiday_term_begins_data:get_const(damage),
			    HpMax = util:round(BaseHpMax * Coe *
						 (1 + HitRate / 100)
						 * ActNum),
			    BossHp = case unit_monster:gen_fight_objects(20,
									 UnitId)
					 of
				       [] -> [];
				       [DefendList | _] ->
					   [{MonBid, HpMax, HpMax}
					    || #fight_object{object_bid =
								 MonBid}
						   <- DefendList]
				     end,
			    NewBoss = #holiday_term_begins_boss{boss_endtime =
								    BossEndTime,
								boss_id =
								    BossId,
								unit_id =
								    UnitId,
								boss_hp =
								    BossHp,
								buff_lev =
								    HitRate,
								reward =
								    FightAward,
								kill_reward =
								    HitAward},
			    d_ets_lib:save_d_ets(holiday_term_begins_boss,
						 NewBoss),
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidholiday_term_begins_mgr274, _,
			       {__Levelholiday_term_begins_mgr274,
				__Tracesholiday_term_begins_mgr274}}
				  when __Levelholiday_term_begins_mgr274 band 64
					 /= 0
					 orelse
					 __Tracesholiday_term_begins_mgr274 /=
					   [] ->
				  lager:do_log(info,
					       [{module,
						 holiday_term_begins_mgr},
						{function, do_handle_info},
						{line, 274},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("世界BOSS匹配的数据 ~w, 活跃人数 ~w, 平均世界等级 ~w, "
							     "上交试卷 ~w",
							     [NewBoss, ActNum,
							      AvgWorldLev,
							      PaperNum]),
					       none, 4096, 64,
					       __Levelholiday_term_begins_mgr274,
					       __Tracesholiday_term_begins_mgr274,
					       lager_event,
					       __Pidholiday_term_begins_mgr274);
			      _ -> ok
			    end,
			    ok;
			_ ->
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidholiday_term_begins_mgr277, _,
			       {__Levelholiday_term_begins_mgr277,
				__Tracesholiday_term_begins_mgr277}}
				  when __Levelholiday_term_begins_mgr277 band 64
					 /= 0
					 orelse
					 __Tracesholiday_term_begins_mgr277 /=
					   [] ->
				  lager:do_log(info,
					       [{module,
						 holiday_term_begins_mgr},
						{function, do_handle_info},
						{line, 277},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       "居然没有采集到活跃数据，凭空生成BOSS", none,
					       4096, 64,
					       __Levelholiday_term_begins_mgr277,
					       __Tracesholiday_term_begins_mgr277,
					       lager_event,
					       __Pidholiday_term_begins_mgr277);
			      _ -> ok
			    end,
			    ActNum = max(80, get_alive_num()),
			    AvgWorldLev = max(51, world_lev:get_world_lev()),
			    {UnitId, BossId, FightAward, HitAward, Coe} =
				holiday_term_begins_data:match_boss({Round,
								     AvgWorldLev}),
			    BaseHpMax = unit_monster:get_boss_hp_max(UnitId),
			    PaperNum = case ets:lookup(term_begins_paper,
						       paper_count)
					   of
					 [{_, PaperNumT}] -> PaperNumT;
					 _ -> 0
				       end,
			    HitRate0 = min(100,
					   util:round(PaperNum * 100 /
							holiday_term_begins_data:get_const(collection_quantity))),
			    HitRate = HitRate0 *
					holiday_term_begins_data:get_const(damage),
			    HpMax = util:round(BaseHpMax * Coe *
						 (1 + HitRate / 100)
						 * ActNum),
			    BossHp = case unit_monster:gen_fight_objects(20,
									 UnitId)
					 of
				       [] -> [];
				       [DefendList | _] ->
					   [{MonBid, HpMax, HpMax}
					    || #fight_object{object_bid =
								 MonBid}
						   <- DefendList]
				     end,
			    NewBoss = #holiday_term_begins_boss{boss_endtime =
								    BossEndTime,
								boss_id =
								    BossId,
								unit_id =
								    UnitId,
								boss_hp =
								    BossHp,
								buff_lev =
								    HitRate,
								reward =
								    FightAward,
								kill_reward =
								    HitAward},
			    d_ets_lib:save_d_ets(holiday_term_begins_boss,
						 NewBoss),
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidholiday_term_begins_mgr295, _,
			       {__Levelholiday_term_begins_mgr295,
				__Tracesholiday_term_begins_mgr295}}
				  when __Levelholiday_term_begins_mgr295 band 64
					 /= 0
					 orelse
					 __Tracesholiday_term_begins_mgr295 /=
					   [] ->
				  lager:do_log(info,
					       [{module,
						 holiday_term_begins_mgr},
						{function, do_handle_info},
						{line, 295},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("本服世界BOSS匹配的数据 ~w, 活跃人数 ~w, 平均世界等级 ~w, "
							     "上交试卷 ~w",
							     [NewBoss, ActNum,
							      AvgWorldLev,
							      PaperNum]),
					       none, 4096, 64,
					       __Levelholiday_term_begins_mgr295,
					       __Tracesholiday_term_begins_mgr295,
					       lager_event,
					       __Pidholiday_term_begins_mgr295);
			      _ -> ok
			    end,
			    ok
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
		  {__Pidholiday_term_begins_mgr300, _,
		   {__Levelholiday_term_begins_mgr300,
		    __Tracesholiday_term_begins_mgr300}}
		      when __Levelholiday_term_begins_mgr300 band 8 /= 0
			     orelse __Tracesholiday_term_begins_mgr300 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_term_begins_mgr},
				    {function, do_handle_info}, {line, 300},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "当前不存在可匹配开学BOSS的周期", none, 4096, 8,
				   __Levelholiday_term_begins_mgr300,
				   __Tracesholiday_term_begins_mgr300,
				   lager_event,
				   __Pidholiday_term_begins_mgr300);
		  _ -> ok
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
	    {__Pidholiday_term_begins_mgr303, _,
	     {__Levelholiday_term_begins_mgr303,
	      __Tracesholiday_term_begins_mgr303}}
		when __Levelholiday_term_begins_mgr303 band 64 /= 0
		       orelse __Tracesholiday_term_begins_mgr303 /= [] ->
		lager:do_log(info,
			     [{module, holiday_term_begins_mgr},
			      {function, do_handle_info}, {line, 303},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "不满足条件，不进行开学季boss匹配", none, 4096, 64,
			     __Levelholiday_term_begins_mgr303,
			     __Tracesholiday_term_begins_mgr303, lager_event,
			     __Pidholiday_term_begins_mgr303);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, State};
do_handle_info({gm_match_boss, Round, ActNum, WorldLev,
		PaperNum},
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr308, _,
       {__Levelholiday_term_begins_mgr308,
	__Tracesholiday_term_begins_mgr308}}
	  when __Levelholiday_term_begins_mgr308 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr308 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr},
			{function, do_handle_info}, {line, 308},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "GM命令BOSS匹配", none, 4096, 64,
		       __Levelholiday_term_begins_mgr308,
		       __Tracesholiday_term_begins_mgr308, lager_event,
		       __Pidholiday_term_begins_mgr308);
      _ -> ok
    end,
    {UnitId, BossId, FightAward, HitAward, Coe} =
	holiday_term_begins_data:match_boss({Round, WorldLev}),
    BaseHpMax = unit_monster:get_boss_hp_max(UnitId),
    HitRate0 = min(100,
		   util:round(PaperNum * 100 /
				holiday_term_begins_data:get_const(collection_quantity))),
    HitRate = HitRate0 *
		holiday_term_begins_data:get_const(damage),
    HpMax = util:round(BaseHpMax * Coe * (1 + HitRate / 100)
			 * ActNum),
    BossHp = case unit_monster:gen_fight_objects(20, UnitId)
		 of
	       [] -> [];
	       [DefendList | _] ->
		   [{MonBid, HpMax, HpMax}
		    || #fight_object{object_bid = MonBid} <- DefendList]
	     end,
    NewBoss = #holiday_term_begins_boss{boss_id = BossId,
					unit_id = UnitId, boss_hp = BossHp,
					buff_lev = HitRate, reward = FightAward,
					kill_reward = HitAward},
    d_ets_lib:save_d_ets(holiday_term_begins_boss, NewBoss),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr320, _,
       {__Levelholiday_term_begins_mgr320,
	__Tracesholiday_term_begins_mgr320}}
	  when __Levelholiday_term_begins_mgr320 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr320 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr},
			{function, do_handle_info}, {line, 320},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("生成BOSS血量 ~w ~w ", [UnitId, BossHp]),
		       none, 4096, 64, __Levelholiday_term_begins_mgr320,
		       __Tracesholiday_term_begins_mgr320, lager_event,
		       __Pidholiday_term_begins_mgr320);
      _ -> ok
    end,
    {noreply, State};
do_handle_info(reward_round, State) ->
    case is_main() of
      true ->
	  MaxRank0 = holiday_term_begins_boss:max_rank(),
	  MaxRank = max(100, MaxRank0),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr327, _,
	     {__Levelholiday_term_begins_mgr327,
	      __Tracesholiday_term_begins_mgr327}}
		when __Levelholiday_term_begins_mgr327 band 64 /= 0
		       orelse __Tracesholiday_term_begins_mgr327 /= [] ->
		lager:do_log(info,
			     [{module, holiday_term_begins_mgr},
			      {function, do_handle_info}, {line, 327},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("开学季BOSS结算奖励， 最大数量 ~w", [MaxRank]),
			     none, 4096, 64, __Levelholiday_term_begins_mgr327,
			     __Tracesholiday_term_begins_mgr327, lager_event,
			     __Pidholiday_term_begins_mgr327);
	    _ -> ok
	  end,
	  season_reward(1, MaxRank);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr330, _,
	     {__Levelholiday_term_begins_mgr330,
	      __Tracesholiday_term_begins_mgr330}}
		when __Levelholiday_term_begins_mgr330 band 64 /= 0
		       orelse __Tracesholiday_term_begins_mgr330 /= [] ->
		lager:do_log(info,
			     [{module, holiday_term_begins_mgr},
			      {function, do_handle_info}, {line, 330},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "BOSS非启动服不进行结算奖励", none, 4096, 64,
			     __Levelholiday_term_begins_mgr330,
			     __Tracesholiday_term_begins_mgr330, lager_event,
			     __Pidholiday_term_begins_mgr330);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, State};
do_handle_info({notice_donate, Round}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr335, _,
       {__Levelholiday_term_begins_mgr335,
	__Tracesholiday_term_begins_mgr335}}
	  when __Levelholiday_term_begins_mgr335 band 64 /= 0
		 orelse __Tracesholiday_term_begins_mgr335 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_term_begins_mgr},
			{function, do_handle_info}, {line, 335},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开学季BOSS提醒捐献", none, 4096, 64,
		       __Levelholiday_term_begins_mgr335,
		       __Tracesholiday_term_begins_mgr335, lager_event,
		       __Pidholiday_term_begins_mgr335);
      _ -> ok
    end,
    case holiday_lib:get_open_holiday(97008) of
      #holiday{condition = Conds} ->
	  EndTime = date:unixtime() + 3600 * 12,
	  mail:global_send(#gmail{id =
				      {term_begins_notice, Round},
				  end_time = EndTime,
				  subject = lang:get(<<"开学季BOSS提醒"/utf8>>),
				  content =
				      lang:get(<<"尊敬的冒险者大人，开学季·世界BOSS大挑战还有12小时就要开启了，届时您手中剩余的“满分"
						 "试卷”将不能再进行捐献，请您尽快捐献以免造成损失"/utf8>>),
				  conds = Conds});
      _ -> skip
    end,
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

set_time_1() ->
    case sys_env:get(term_begins_group_status) of
      undefined ->
	  util:set_timer(first_group_timer, 60 * 6, {get_group});
      _ -> skip
    end.

set_time_2() ->
    Now = date:unixtime(),
    case parse_time_2(holiday_term_begins_data:round_list(),
		      Now, [])
	of
      [{_, _, EndTime} | _] ->
	  Time = EndTime - Now,
	  util:set_timer(clear_data, Time, {clear_data});
      _ -> skip
    end.

parse_time_2([], _Now, Acc) ->
    lists:sublist(lists:keysort(3, Acc), 1);
parse_time_2([{Round, StartTime, EndTime} | Other], Now,
	     Acc) ->
    Time1 = date:parse_time(StartTime) -
	      holiday_mgr:get_holiday_sec(),
    Time2 = date:parse_time(EndTime) -
	      holiday_mgr:get_holiday_sec(),
    case Now < Time2 of
      true ->
	  parse_time_2(Other, Now, [{Round, Time1, Time2} | Acc]);
      _ -> parse_time_2(Other, Now, Acc)
    end.

is_open_time([], _Now) -> false;
is_open_time([{Round, StartTime, EndTime} | Other],
	     Now) ->
    Time1 = date:parse_time(StartTime) -
	      holiday_mgr:get_holiday_sec(),
    Time2 = date:parse_time(EndTime) -
	      holiday_mgr:get_holiday_sec(),
    case Now >= Time1 andalso Now =< Time2 of
      true -> {true, Round};
      _ -> is_open_time(Other, Now)
    end.

init_boss_timer() ->
    Now = date:unixtime(),
    case sys_env:get(holiday_term_begins_boss_info) of
      Info when is_map(Info) -> set_boss_timer(Info);
      _ ->
	  case parse_time_2(holiday_term_begins_data:round_list(),
			    Now, [])
	      of
	    [{Round, _, EndTime} | _] ->
		NoticeTime = EndTime - 86400 * 2 - 3600 * 12,
		RewardTime = EndTime - 60 * 30,
		MatchTime = EndTime - 86400 * 2,
		UpLoadTime = MatchTime - util:rand(120, 300),
		Info = #{notice_time => NoticeTime,
			 reward_time => RewardTime, match_time => MatchTime,
			 upload_time => UpLoadTime, round => Round},
		sys_env:save(holiday_term_begins_boss_info, Info),
		set_boss_timer(Info),
		ok;
	    _ -> skip
	  end
    end.

set_boss_timer(#{reward_time := RewardTime,
		 match_time := MatchTime, upload_time := UpLoadTime}) ->
    Now = date:unixtime(),
    if RewardTime > Now ->
	   util:set_timer(reward_timer, RewardTime - Now,
			  reward_round);
       true -> skip
    end,
    if MatchTime > Now ->
	   util:set_timer(match_timer,
			  max(1, MatchTime - Now - 10), match_boss);
       true -> skip
    end,
    if UpLoadTime > Now ->
	   util:set_timer(upload_timer, UpLoadTime - Now,
			  upload_data);
       true -> skip
    end;
set_boss_timer(_ERR) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr428, _,
       {__Levelholiday_term_begins_mgr428,
	__Tracesholiday_term_begins_mgr428}}
	  when __Levelholiday_term_begins_mgr428 band 8 /= 0
		 orelse __Tracesholiday_term_begins_mgr428 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_term_begins_mgr},
			{function, set_boss_timer}, {line, 428},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("设置活动BOSS定时器有误 ~w", [_ERR]), none, 4096,
		       8, __Levelholiday_term_begins_mgr428,
		       __Tracesholiday_term_begins_mgr428, lager_event,
		       __Pidholiday_term_begins_mgr428);
      _ -> ok
    end,
    skip.

get_cluster_group() ->
    case holiday_lib:get_open_holiday(97008) of
      #holiday{camp_id = CampId} ->
	  case is_open_time(holiday_term_begins_data:round_list(),
			    date:unixtime())
	      of
	    {true, Round} ->
		case sys_env:get(term_begins_round, {0, 0}) of
		  {CampId, Round} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_term_begins_mgr439, _,
			 {__Levelholiday_term_begins_mgr439,
			  __Tracesholiday_term_begins_mgr439}}
			    when __Levelholiday_term_begins_mgr439 band 64 /= 0
				   orelse
				   __Tracesholiday_term_begins_mgr439 /= [] ->
			    lager:do_log(info,
					 [{module, holiday_term_begins_mgr},
					  {function, get_cluster_group},
					  {line, 439},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("本开学季BOSS已执行过分组 ~w",
						       [{CampId, Round}]),
					 none, 4096, 64,
					 __Levelholiday_term_begins_mgr439,
					 __Tracesholiday_term_begins_mgr439,
					 lager_event,
					 __Pidholiday_term_begins_mgr439);
			_ -> ok
		      end;
		  _ ->
		      sys_env:save(term_begins_round, {CampId, Round}),
		      case sys_env:get(term_main_srv) of
			_undefined ->
			    case cluster_group:get_group() of
			      {true, #cross_group{main = MainSrvId}} ->
				  sys_env:save(term_main_srv, MainSrvId);
			      _ -> sys_env:save(term_main_srv, undefined)
			    end;
			_ -> skip
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
		  {__Pidholiday_term_begins_mgr455, _,
		   {__Levelholiday_term_begins_mgr455,
		    __Tracesholiday_term_begins_mgr455}}
		      when __Levelholiday_term_begins_mgr455 band 64 /= 0
			     orelse __Tracesholiday_term_begins_mgr455 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_term_begins_mgr},
				    {function, get_cluster_group}, {line, 455},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "开学季BOSS在没有开活动的时候还想重新分组，两边配表不一致", none, 4096,
				   64, __Levelholiday_term_begins_mgr455,
				   __Tracesholiday_term_begins_mgr455,
				   lager_event,
				   __Pidholiday_term_begins_mgr455);
		  _ -> ok
		end,
		skip
	  end;
      _ -> skip
    end.

-spec get_boss(pos_integer()) -> false |
				 #holiday_term_begins_boss{}.

get_boss(Id) ->
    case
      holiday_term_begins_boss:send_call(holiday_term_begins_mgr,
					 get_boss_info, [Id])
	of
      Boss = #holiday_term_begins_boss{} -> Boss;
      _ -> false
    end.

-spec get_boss_info(pos_integer()) -> false |
				      {ok, #holiday_term_begins_boss{}}.

get_boss_info(Id) ->
    case catch ets:lookup(holiday_term_begins_boss, Id) of
      [Boss = #holiday_term_begins_boss{}] -> Boss;
      _ -> false
    end.

merge_hp([], BossHp) -> BossHp;
merge_hp([{MonId, Dps} | Other], BossHp) ->
    case lists:keyfind(MonId, 1, BossHp) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr486, _,
	     {__Levelholiday_term_begins_mgr486,
	      __Tracesholiday_term_begins_mgr486}}
		when __Levelholiday_term_begins_mgr486 band 8 /= 0
		       orelse __Tracesholiday_term_begins_mgr486 /= [] ->
		lager:do_log(error,
			     [{module, holiday_term_begins_mgr},
			      {function, merge_hp}, {line, 486},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("开学季副本在合并血量的时候出现不存在的怪物ID ~w",
					   [MonId]),
			     none, 4096, 8, __Levelholiday_term_begins_mgr486,
			     __Tracesholiday_term_begins_mgr486, lager_event,
			     __Pidholiday_term_begins_mgr486);
	    _ -> ok
	  end,
	  merge_hp(Other, BossHp);
      {_, Hp, HpMax} ->
	  NewHp = max(0, Hp - Dps),
	  NewBossHp = lists:keyreplace(MonId, 1, BossHp,
				       {MonId, NewHp, HpMax}),
	  merge_hp(Other, NewBossHp)
    end.

do_update_rank(#holiday_term_begins_boss_rank{rank =
						  Rank,
					      id = RoleId})
    when Rank =< 0 ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_term_begins_mgr496, _,
       {__Levelholiday_term_begins_mgr496,
	__Tracesholiday_term_begins_mgr496}}
	  when __Levelholiday_term_begins_mgr496 band 8 /= 0
		 orelse __Tracesholiday_term_begins_mgr496 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_term_begins_mgr},
			{function, do_update_rank}, {line, 496},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w的开学季排行居然突破了0 ~w", [RoleId, Rank]),
		       none, 4096, 8, __Levelholiday_term_begins_mgr496,
		       __Tracesholiday_term_begins_mgr496, lager_event,
		       __Pidholiday_term_begins_mgr496);
      _ -> ok
    end,
    skip;
do_update_rank(BossRankRole =
		   #holiday_term_begins_boss_rank_role{rank = 1,
						       r_id = RoleId,
						       all_dps = AllDps}) ->
    ets:insert(term_begins_rank,
	       #holiday_term_begins_boss_rank{rank = 1, id = RoleId,
					      all_dps = AllDps}),
    ets:insert(term_begins_role, BossRankRole),
    ets:insert(term_begins_update, {RoleId}),
    ok;
do_update_rank(BossRankRole =
		   #holiday_term_begins_boss_rank_role{rank = Rank,
						       r_id = RoleId,
						       all_dps = AllDps}) ->
    case ets:lookup(term_begins_rank, Rank - 1) of
      [#holiday_term_begins_boss_rank{id = RoleId2,
				      all_dps = AllDps2}]
	  when AllDps > AllDps2 ->
	  ets:insert(term_begins_rank,
		     #holiday_term_begins_boss_rank{rank = Rank,
						    id = RoleId2,
						    all_dps = AllDps2}),
	  ets:update_element(term_begins_role, RoleId2,
			     {#holiday_term_begins_boss_rank_role.rank, Rank}),
	  ets:insert(term_begins_update, {RoleId2}),
	  do_update_rank(BossRankRole#holiday_term_begins_boss_rank_role{rank
									     =
									     Rank
									       -
									       1});
      _ ->
	  ets:insert(term_begins_rank,
		     #holiday_term_begins_boss_rank{rank = Rank, id = RoleId,
						    all_dps = AllDps}),
	  ets:insert(term_begins_role, BossRankRole),
	  ets:insert(term_begins_update, {RoleId}),
	  ok
    end.

do_save_update([]) -> skip;
do_save_update([{RoleId} | T]) ->
    case holiday_term_begins_boss:get_role(RoleId) of
      {ok, BossRankRole} ->
	  dets:insert(term_begins_role, BossRankRole);
      _ -> skip
    end,
    do_save_update(T).

get_alive_num() ->
    MinLev = 10,
    LimitDday = 2,
    LimitTime = date:unixtime() - 86400 * LimitDday,
    case db:get_one("select count(*) from role where lev "
		    ">= ? and (logout_time > ? or login_time "
		    "> ?)",
		    [MinLev, LimitTime, LimitTime], 60000)
	of
      {ok, Num} -> Num;
      _ -> 0
    end.

kill_reward(Rank, Items) ->
    case holiday_term_begins_boss:rank_roleid(Rank) of
      null ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr541, _,
	     {__Levelholiday_term_begins_mgr541,
	      __Tracesholiday_term_begins_mgr541}}
		when __Levelholiday_term_begins_mgr541 band 64 /= 0
		       orelse __Tracesholiday_term_begins_mgr541 /= [] ->
		lager:do_log(info,
			     [{module, holiday_term_begins_mgr},
			      {function, kill_reward}, {line, 541},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("开学季击杀奖励在~w名停了下来", [Rank]), none,
			     4096, 64, __Levelholiday_term_begins_mgr541,
			     __Tracesholiday_term_begins_mgr541, lager_event,
			     __Pidholiday_term_begins_mgr541);
	    _ -> ok
	  end,
	  skip;
      RoleId when is_tuple(RoleId) ->
	  mail:send(RoleId,
		    {lang:get(<<"开学季BOSS击杀奖励"/utf8>>),
		     lang:get(<<"尊敬的冒险者大人，开学季活动的世界BOSS已被击败，为表彰您在活动中顽强拼搏奋勇作战，特为"
				"您发以下奖励以资鼓励！"/utf8>>),
		     items, Items, <<"开学季BOSS击杀"/utf8>>}),
	  kill_reward(Rank + 1, Items);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_term_begins_mgr547, _,
	     {__Levelholiday_term_begins_mgr547,
	      __Tracesholiday_term_begins_mgr547}}
		when __Levelholiday_term_begins_mgr547 band 64 /= 0
		       orelse __Tracesholiday_term_begins_mgr547 /= [] ->
		lager:do_log(info,
			     [{module, holiday_term_begins_mgr},
			      {function, kill_reward}, {line, 547},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("开学季击杀奖励在~w名停了下来", [Rank]), none,
			     4096, 64, __Levelholiday_term_begins_mgr547,
			     __Tracesholiday_term_begins_mgr547, lager_event,
			     __Pidholiday_term_begins_mgr547);
	    _ -> ok
	  end,
	  skip
    end.

season_reward(Rank, MaxRank) ->
    case holiday_term_begins_boss:rank_role(Rank) of
      {ok,
       #holiday_term_begins_boss_rank_role{r_id = RoleId,
					   all_dps = AllDps}} ->
	  RankPer = util:uceil(Rank * 100 / MaxRank),
	  case holiday_term_begins_data:rank_reward(RankPer) of
	    Items = [_ | _] ->
		mail:send(RoleId,
			  {lang:get(<<"开学季BOSS结算"/utf8>>),
			   color:msg(lang:get(<<"尊敬的冒险者大人，您在开学季·BOSS大挑战活动中造成了~ts的伤害，取得了伤害前~ts%"
						"的优异成绩，为您发放以下奖励，以此来纪念这充满荣耀的时刻！"/utf8>>),
				     [{green, AllDps}, {green, RankPer}]),
			   items, Items, <<"开学季BOSS结算"/utf8>>}),
		season_reward(Rank + 1, MaxRank);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_term_begins_mgr561, _,
		   {__Levelholiday_term_begins_mgr561,
		    __Tracesholiday_term_begins_mgr561}}
		      when __Levelholiday_term_begins_mgr561 band 64 /= 0
			     orelse __Tracesholiday_term_begins_mgr561 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_term_begins_mgr},
				    {function, season_reward}, {line, 561},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("开学季奖励在~w名停了下来,总~w名",
						 [Rank, MaxRank]),
				   none, 4096, 64,
				   __Levelholiday_term_begins_mgr561,
				   __Tracesholiday_term_begins_mgr561,
				   lager_event,
				   __Pidholiday_term_begins_mgr561);
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
	    {__Pidholiday_term_begins_mgr565, _,
	     {__Levelholiday_term_begins_mgr565,
	      __Tracesholiday_term_begins_mgr565}}
		when __Levelholiday_term_begins_mgr565 band 64 /= 0
		       orelse __Tracesholiday_term_begins_mgr565 /= [] ->
		lager:do_log(info,
			     [{module, holiday_term_begins_mgr},
			      {function, season_reward}, {line, 565},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("开学季奖励在~w名停了下来,总~w名",
					   [Rank, MaxRank]),
			     none, 4096, 64, __Levelholiday_term_begins_mgr565,
			     __Tracesholiday_term_begins_mgr565, lager_event,
			     __Pidholiday_term_begins_mgr565);
	    _ -> ok
	  end,
	  skip
    end.

is_main() ->
    case sys_env:get(platform) of
      "symix" -> true;
      "symix2" -> true;
      _ ->
	  SrvId = sys_env:get(server_id),
	  case sys_env:get(term_main_srv) of
	    undefined -> true;
	    #srv{id = SrvId} -> true;
	    _ -> false
	  end
    end.


