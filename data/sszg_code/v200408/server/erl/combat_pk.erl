-file("data/combat_pk.erl", 1).

-file("src/mod/combat/combat_pk.erl", 1).

-module(combat_pk).

-lager_records([{replay_partner,
		 [id, pos, bid, lev, star, break_lev, power, hp, hp_max,
		  atk, def, speed, crit_rate, crit_ratio, hit_magic,
		  dodge_magic, hurt, behurt, curt, skills, eqms,
		  artifacts, ext]},
		{replay_stat, [id, like, share, play, collect]},
		{replay_info,
		 [id, combat_type, round, sec_type, a_rid, a_name, a_lev,
		  a_face, a_power, a_formation_type, a_camp_type,
		  a_hallow, a_rank, b_rid, b_name, b_lev, b_face, b_power,
		  b_formation_type, b_camp_type, b_hallow, b_rank,
		  a_plist, b_plist, ret, time, like, share, play, collect,
		  ext]},
		{replay,
		 [id, type, combat_type, sec_type, a_rid, a_cond_val,
		  a_power, a_lev, b_rid, b_cond_val, b_power, b_lev,
		  time]},
		{replay_role, [key, list]},
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
		{combat_replay, [ver, combat_type, combat_plays, info]},
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

-export([pk_target/4, agree_pk_target/3,
	 apply_agree_pk_target/2, combat_over/4, share/2,
	 gm_must_pk/2, combat_over_gm_must/4]).

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

-file("src/mod/combat/combat_pk.erl", 16).

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

-file("src/mod/combat/combat_pk.erl", 17).

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

-file("src/mod/combat/combat_pk.erl", 18).

-file("inc/combat_replay.hrl", 1).

-record(combat_replay,
	{ver = 1, combat_type, combat_plays = [], info}).

-file("src/mod/combat/combat_pk.erl", 19).

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

-file("src/mod/combat/combat_pk.erl", 20).

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

-file("src/mod/combat/combat_pk.erl", 21).

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

-file("src/mod/combat/combat_pk.erl", 22).

-file("inc/replay_hall.hrl", 1).

-record(replay_role, {key = {{0, <<>>}, 0}, list = []}).

-record(replay,
	{id = 0, type = 0, combat_type = 0, sec_type = 0,
	 a_rid = 0, a_cond_val = 0, a_power = 0, a_lev = 0,
	 b_rid = 0, b_cond_val = 0, b_power = 0, b_lev = 0,
	 time = 0}).

-record(replay_info,
	{id = 0, combat_type = 0, round = 0, sec_type = 0,
	 a_rid = {0, <<>>}, a_name = <<>>, a_lev = 0, a_face = 0,
	 a_power = 0, a_formation_type = 0, a_camp_type = 0,
	 a_hallow, a_rank = 0, b_rid = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_face = 0, b_power = 0,
	 b_formation_type = 0, b_camp_type = 0, b_hallow,
	 b_rank = 0, a_plist = [], b_plist = [], ret = 0,
	 time = 0, like = 0, share = 0, play = 0, collect = 0,
	 ext = []}).

-record(replay_stat,
	{id = 0, like = 0, share = 0, play = 0, collect = 0}).

-record(replay_partner,
	{id = 0, pos = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, hp = 0, hp_max = 0, atk = 0,
	 def = 0, speed = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, hurt = 0, behurt = 0,
	 curt = 0, skills = [], eqms = [], artifacts = [],
	 ext = []}).

-file("src/mod/combat/combat_pk.erl", 23).

-spec pk_target(#role{}, binary() | role_id(), 0..1,
		0..1) -> {false, binary()} | {ok, #role{}}.

pk_target(Role, TarName, Mode, IsProvince)
    when is_binary(TarName) ->
    case
      db:get_row("select rid, srv_id from role where name "
		 "= ? or account = ? limit 1",
		 [TarName, TarName])
	of
      {ok, [Rid, SrvId]} ->
	  pk_target(Role, {Rid, SrvId}, Mode, IsProvince);
      _ ->
	  {false, lang:get(<<"Người chơi không tồn tại"/utf8>>)}
    end;
pk_target(#role{id = RoleId}, RoleId, _, _) ->
    {false,
     lang:get(<<"Không thể PK với chính mình"/utf8>>)};
pk_target(#role{lev = Lev}, _RoleId, _, _)
    when Lev < 20 ->
    {false,
     lang:get(<<"Chỉ có thể giao đấu sau cấp 20"/utf8>>)};
pk_target(Role, TarRoleId, 0, IsProvince) ->
    {ok,
     R = #role_robot{name = TargetName, gname = GName,
		     lev = TarLev, face_id = TarFace,
		     face_update_time = FaceUpdateTime, face_file = FaceFile,
		     m_formation =
			 #m_formation{use_lineup = Id, all_lineups = AllLine,
				      list = List}}} =
	role_robot:get_role(TarRoleId),
    {AFormationType, AFormationLev, FightPos,
     FormationArgs} =
	formation_lib:combat_formation_info(Role),
    AttackList1 = combat_lib:gen_fight_objects(Role,
					       FightPos),
    AttackList2 = sprite_tree:gen_fight_object(Role) ++
		    hallows_lib:gen_fight_object(Role,
						 maps:get(hallows_id,
							  FormationArgs, 0))
		      ++ AttackList1,
    AttackList = combat_attr:calc(AttackList2, 8, Role),
    #formation_lineup{pos_info = PosInfo,
		      type = BFormationType, hallows_id = HallowsId} =
	lists:keyfind(Id, #formation_lineup.id, AllLine),
    {_, BFormationLev, _} =
	list_util:keyfind(BFormationType, 1, List, {1, 1, 0}),
    BFightPos = formation_lib:gen_fight_pos(PosInfo,
					    BFormationType),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcombat_pk44, _,
       {__Levelcombat_pk44, __Tracescombat_pk44}}
	  when __Levelcombat_pk44 band 128 /= 0 orelse
		 __Tracescombat_pk44 /= [] ->
	  lager:do_log(debug,
		       [{module, combat_pk}, {function, pk_target}, {line, 44},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("PK LINE:~w===>~w hallows_id=~w",
				     [{Id, AllLine}, BFightPos, HallowsId]),
		       none, 4096, 128, __Levelcombat_pk44,
		       __Tracescombat_pk44, lager_event, __Pidcombat_pk44);
      _ -> ok
    end,
    {ok, DefList0} = role_robot:to_fight_objects(R,
						 [{Pos, PId}
						  || #formation_fight_info{fight_pos
									       =
									       Pos,
									   id =
									       PId}
							 <- BFightPos,
						     PId > 0]),
    DefList1 = sprite_tree:gen_fight_object(R) ++
		 hallows_lib:gen_fight_object(R, HallowsId) ++ DefList0,
    DefList = combat_attr:calc(DefList1, 8, R),
    ReplayInfo0 = replay_hall:convert(#replay_info{}, a,
				      Role,
				      #{power => Role#role.power,
					formation_type => AFormationType,
					rank =>
					    arena_lib:role_rank(Role#role.id)}),
    ReplayInfo = replay_hall:convert(ReplayInfo0, b, R,
				     #{power => R#role_robot.power,
				       formation_type => BFormationType,
				       rank => arena_lib:role_rank(TarRoleId)}),
    Args = #{on_role_combat_end =>
		 {combat_pk, combat_over,
		  [{TarRoleId, TargetName, GName, TarLev, TarFace,
		    IsProvince, FaceUpdateTime, FaceFile}]},
	     formation =>
		 [{1, AFormationType, AFormationLev},
		  {2, BFormationType, BFormationLev}],
	     target_role_name => TargetName,
	     replay_info => ReplayInfo},
    combat_lib:start_combat(Role, 8, AttackList, [DefList],
			    Args),
    {ok, Role};
pk_target(Role, TarRoleId, 1, IsProvince) ->
    {AFormationType, AFormationLev, AFightPos,
     FormationArgs} =
	formation_lib:combat_formation_info(Role),
    AttackList1 = combat_lib:gen_fight_objects(Role,
					       AFightPos),
    AttackList2 = sprite_tree:gen_fight_object(Role) ++
		    hallows_lib:gen_fight_object(Role,
						 maps:get(hallows_id,
							  FormationArgs, 0))
		      ++ AttackList1,
    AttackList = combat_attr:calc(AttackList2, 8, Role),
    {ok, TargetName, TarGName, TarLev, TarFace,
     BFormationType, BFormationLev, DefList, BCombatRole,
     BReplayInfo, FaceUpdateTime, FaceFile} =
	role_lib:call(by_id, TarRoleId,
		      {fun (R = #role{guild_bag = #guild_bag{name = GName1},
				      lev = TarLev1, face_id = TarFace1}) ->
			       {FormationType, FormationLev, BFightPos,
				BFormationArgs} =
				   formation_lib:combat_formation_info(R),
			       FOList1 = combat_lib:gen_fight_objects(R,
								      BFightPos),
			       FOList2 = sprite_tree:gen_fight_object(R) ++
					   hallows_lib:gen_fight_object(R,
									maps:get(hallows_id,
										 BFormationArgs,
										 0))
					     ++ FOList1,
			       FOList = combat_attr:calc(FOList2, 8, R),
			       ReplayInfo0 = replay_hall:convert(#replay_info{},
								 b, R,
								 #{power =>
								       R#role.power,
								   formation_type
								       =>
								       FormationType,
								   rank =>
								       arena_lib:role_rank(TarRoleId)}),
			       {ok, CombatRole} = role_convert:do(combat_role,
								  R),
			       {_, FaceFile1, FaceUpdateTime1} =
				   role_face:face_info(R),
			       {ok,
				{ok, R#role.name, GName1, TarLev1, TarFace1,
				 FormationType, FormationLev, FOList,
				 CombatRole, ReplayInfo0, FaceUpdateTime1,
				 FaceFile1}}
		       end}),
    {ok, ACombatRole} = role_convert:do(combat_role, Role),
    ReplayInfo = replay_hall:convert(BReplayInfo, a, Role,
				     #{power => Role#role.power,
				       formation_type => AFormationType,
				       rank =>
					   arena_lib:role_rank(Role#role.id)}),
    Args = #{on_role_combat_end =>
		 {combat_pk, combat_over,
		  [{TarRoleId, TargetName, TarGName, TarLev, TarFace,
		    IsProvince, FaceUpdateTime, FaceFile}]},
	     formation =>
		 [{1, AFormationType, AFormationLev},
		  {2, BFormationType, BFormationLev}],
	     target_role_name => TargetName,
	     replay_info => ReplayInfo},
    combat_lib:start_pk(8, AttackList, DefList,
			[ACombatRole, BCombatRole], Args),
    {ok, Role};
pk_target(Role = #role{id = RoleId = {Rid, SrvId},
		       name = Name, lev = Lev, face_id = FaceId},
	  TarRoleId, 2, IsProvince) ->
    case role_robot:get_role(TarRoleId) of
      {ok, #role_robot{auto_pk = 0, name = TargetName}} ->
	  Now = date:unixtime(),
	  Timeout = combat_type_data:get_const(pk_req_timeout),
	  case lists:keyfind(TarRoleId, 1,
			     util:get(combat_pk_list, []))
	      of
	    {_, #{time := Time}} when Now - Time < Timeout ->
		{false,
		 util:fbin(lang:get(<<"~tsPhải đợi sau 1 khoảng thời gian nữa "
				      "mới có thể gửi yêu cầu giao đấu lần "
				      "nữa"/utf8>>),
			   [format:sec(Timeout + Time - Now)])};
	    _ ->
		case role_query:pid(by_id, TarRoleId) of
		  {ok, TarPid} ->
		      notice_below:send_challenge({role_pid, TarPid},
						  {Rid, SrvId, Name, Lev,
						   FaceId}),
		      put(combat_pk_list,
			  lists:keystore(TarRoleId, 1,
					 util:get(combat_pk_list, []),
					 {TarRoleId,
					  #{time => Now, agree => 0,
					    is_province => IsProvince}})),
		      notice:alert(util:fbin(lang:get(<<"Hướng đến người chơi~tsĐã gửi yêu cầu "
							"giao đấu, xin vui lòng kiên nhẫn chờ "
							"phản hồi！"/utf8>>),
					     [TargetName])),
		      {ok, Role};
		  _ ->
		      {false, lang:get(<<"Bên kia không trực tuyến"/utf8>>)}
		end
	  end;
      {ok,
       R = #role_robot{name = TargetName, gname = GName,
		       lev = TarLev, face_id = TarFace,
		       face_update_time = FaceUpdateTime, face_file = FaceFile,
		       m_formation =
			   #m_formation{use_lineup = Id, all_lineups = AllLine,
					list = List}}} ->
	  {AFormationType, AFormationLev, FightPos,
	   FormationArgs} =
	      formation_lib:combat_formation_info(Role),
	  AttackList1 = combat_lib:gen_fight_objects(Role,
						     FightPos),
	  AttackList2 = sprite_tree:gen_fight_object(Role) ++
			  hallows_lib:gen_fight_object(Role,
						       maps:get(hallows_id,
								FormationArgs,
								0))
			    ++ AttackList1,
	  AttackList = combat_attr:calc(AttackList2, 8, Role),
	  #formation_lineup{pos_info = PosInfo,
			    type = BFormationType, hallows_id = HallowsId} =
	      lists:keyfind(Id, #formation_lineup.id, AllLine),
	  {_, BFormationLev, _} =
	      list_util:keyfind(BFormationType, 1, List, {1, 1, 0}),
	  BFightPos = formation_lib:gen_fight_pos(PosInfo,
						  BFormationType),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcombat_pk100, _,
	     {__Levelcombat_pk100, __Tracescombat_pk100}}
		when __Levelcombat_pk100 band 128 /= 0 orelse
		       __Tracescombat_pk100 /= [] ->
		lager:do_log(debug,
			     [{module, combat_pk}, {function, pk_target},
			      {line, 100}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("PK LINE:~w===>~w hallows_id=~w",
					   [{Id, AllLine}, BFightPos,
					    HallowsId]),
			     none, 4096, 128, __Levelcombat_pk100,
			     __Tracescombat_pk100, lager_event,
			     __Pidcombat_pk100);
	    _ -> ok
	  end,
	  {ok, DefList0} = role_robot:to_fight_objects(R,
						       [{Pos, PId}
							|| #formation_fight_info{fight_pos
										     =
										     Pos,
										 id
										     =
										     PId}
							       <- BFightPos,
							   PId > 0]),
	  DefList1 = sprite_tree:gen_fight_object(R) ++
		       hallows_lib:gen_fight_object(R, HallowsId) ++ DefList0,
	  DefList = combat_attr:calc(DefList1, 8, R),
	  ReplayInfo0 = replay_hall:convert(#replay_info{}, a,
					    Role,
					    #{power => Role#role.power,
					      formation_type => AFormationType,
					      rank =>
						  arena_lib:role_rank(Role#role.id)}),
	  ReplayInfo = replay_hall:convert(ReplayInfo0, b, R,
					   #{power => R#role_robot.power,
					     formation_type => BFormationType,
					     rank =>
						 arena_lib:role_rank(TarRoleId)}),
	  Args = #{on_role_combat_end =>
		       {combat_pk, combat_over,
			[{TarRoleId, TargetName, GName, TarLev, TarFace,
			  IsProvince, FaceUpdateTime, FaceFile}]},
		   formation =>
		       [{1, AFormationType, AFormationLev},
			{2, BFormationType, BFormationLev}],
		   target_role_name => TargetName,
		   replay_info => ReplayInfo},
	  combat_lib:start_combat(Role, 8, AttackList, [DefList],
				  Args),
	  holiday_return_new:send_return(Role,
					 {RoleId, TarRoleId}, pk),
	  notice:alert(TarRoleId,
		       util:fbin(lang:get(<<"Người chơi~ts đã gửi một cuộc thảo luận "
					    "cho bạn"/utf8>>),
				 [Name])),
	  {ok, Role};
      _ ->
	  {false,
	   lang:get(<<"Không thể tìm thấy dữ liệu mục tiêu"/utf8>>)}
    end;
pk_target(Role = #role{id = RoleId}, TarRoleId, 3, _) ->
    case lists:keyfind(TarRoleId, 1,
		       util:get(combat_pk_list, []))
	of
      {TarRoleId, #{agree := 1, is_province := IsProvince}} ->
	  put(combat_pk_list,
	      lists:keydelete(TarRoleId, 1,
			      util:get(combat_pk_list, []))),
	  {ok,
	   R = #role_robot{name = TargetName, gname = GName,
			   lev = TarLev, face_id = TarFace,
			   face_update_time = FaceUpdateTime,
			   face_file = FaceFile,
			   m_formation =
			       #m_formation{use_lineup = Id,
					    all_lineups = AllLine,
					    list = List}}} =
	      role_robot:get_role(TarRoleId),
	  {AFormationType, AFormationLev, FightPos,
	   FormationArgs} =
	      formation_lib:combat_formation_info(Role),
	  AttackList1 = combat_lib:gen_fight_objects(Role,
						     FightPos),
	  AttackList2 = sprite_tree:gen_fight_object(Role) ++
			  hallows_lib:gen_fight_object(Role,
						       maps:get(hallows_id,
								FormationArgs,
								0))
			    ++ AttackList1,
	  AttackList = combat_attr:calc(AttackList2, 8, Role),
	  #formation_lineup{pos_info = PosInfo,
			    type = BFormationType, hallows_id = HallowsId} =
	      lists:keyfind(Id, #formation_lineup.id, AllLine),
	  {_, BFormationLev, _} =
	      list_util:keyfind(BFormationType, 1, List, {1, 1, 0}),
	  BFightPos = formation_lib:gen_fight_pos(PosInfo,
						  BFormationType),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcombat_pk126, _,
	     {__Levelcombat_pk126, __Tracescombat_pk126}}
		when __Levelcombat_pk126 band 128 /= 0 orelse
		       __Tracescombat_pk126 /= [] ->
		lager:do_log(debug,
			     [{module, combat_pk}, {function, pk_target},
			      {line, 126}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("PK LINE:~w===>~w hallows_id:~w",
					   [{Id, AllLine}, BFightPos,
					    HallowsId]),
			     none, 4096, 128, __Levelcombat_pk126,
			     __Tracescombat_pk126, lager_event,
			     __Pidcombat_pk126);
	    _ -> ok
	  end,
	  {ok, DefList0} = role_robot:to_fight_objects(R,
						       [{Pos, PId}
							|| #formation_fight_info{fight_pos
										     =
										     Pos,
										 id
										     =
										     PId}
							       <- BFightPos,
							   PId > 0]),
	  DefList1 = sprite_tree:gen_fight_object(R) ++
		       hallows_lib:gen_fight_object(R, HallowsId) ++ DefList0,
	  DefList = combat_attr:calc(DefList1, 8, R),
	  ReplayInfo0 = replay_hall:convert(#replay_info{}, a,
					    Role,
					    #{power => Role#role.power,
					      formation_type => AFormationType,
					      rank =>
						  arena_lib:role_rank(Role#role.id)}),
	  ReplayInfo = replay_hall:convert(ReplayInfo0, b, R,
					   #{power => R#role_robot.power,
					     formation_type => BFormationType,
					     rank =>
						 arena_lib:role_rank(TarRoleId)}),
	  Args = #{on_role_combat_end =>
		       {combat_pk, combat_over,
			[{TarRoleId, TargetName, GName, TarLev, TarFace,
			  IsProvince, FaceUpdateTime, FaceFile}]},
		   formation =>
		       [{1, AFormationType, AFormationLev},
			{2, BFormationType, BFormationLev}],
		   target_role_name => TargetName,
		   replay_info => ReplayInfo},
	  combat_lib:start_combat(Role, 8, AttackList, [DefList],
				  Args),
	  holiday_return_new:send_return(Role,
					 {RoleId, TarRoleId}, pk),
	  {ok, Role};
      _ ->
	  {false,
	   lang:get(<<"Bạn cần sự đồng ý của bên kia để thảo "
		      "luận"/utf8>>)}
    end.

-spec agree_pk_target(#role{}, role_id(),
		      1..2) -> {false, binary()} | ok.

agree_pk_target(Role, TarRoleId, Agree) ->
    case role_query:pid(by_id, TarRoleId) of
      {ok, TarPid} ->
	  {ok, Robot} = role_convert:do(role_robot, Role),
	  role:apply(async, TarPid,
		     {combat_pk, apply_agree_pk_target, [{Robot, Agree}]}),
	  ok;
      _ ->
	  {false, lang:get(<<"Bên kia đang ngoại tuyến"/utf8>>)}
    end.

apply_agree_pk_target(Role = #role{name = Name},
		      {#role_robot{id = TarRoleId = {TarRid, TarSrvId},
				   name = TargetName, lev = TarLev,
				   face_id = TarFace,
				   face_update_time = FaceUpdateTime,
				   face_file = FaceFile},
		       1}) ->
    case lists:keyfind(TarRoleId, 1,
		       util:get(combat_pk_list, []))
	of
      {TarRoleId, Info} ->
	  put(combat_pk_list,
	      lists:keyreplace(TarRoleId, 1,
			       util:get(combat_pk_list, []),
			       {TarRoleId, Info#{agree := 1}})),
	  sys_conn:pack_send(20016,
			     {TarRid, TarSrvId, TargetName, TarLev, TarFace,
			      FaceUpdateTime, FaceFile}),
	  notice:alert(util:fbin(lang:get(<<"~tsĐồng ý với yêu cầu thảo luận của "
					    "bạn"/utf8>>),
				 [TargetName])),
	  notice:alert(TarRoleId,
		       util:fbin(lang:get(<<"bạn đã đồng ý~tsyêu cầu thảo luận"/utf8>>),
				 [Name])),
	  {ok, Role};
      _ ->
	  notice:alert(TarRoleId,
		       util:fbin(lang:get(<<"bạn đã đồng ý~tsyêu cầu thảo luận"/utf8>>),
				 [Name])),
	  ok
    end;
apply_agree_pk_target(#role{name = Name},
		      {#role_robot{id = TarRoleId, name = _TarName}, _}) ->
    notice:alert(TarRoleId,
		 util:fbin(lang:get(<<"bạn đã từ chối~tsyêu cầu thảo luận"/utf8>>),
			   [Name])),
    put(combat_pk_list,
	lists:keydelete(TarRoleId, 1,
			util:get(combat_pk_list, []))),
    ok.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> ok | {ok, #role{}}.

combat_over(_Role,
	    #combat_result{result = Result, replay_id = ReplayId,
			   hurt_statistics = HurtStatistics},
	    #combat{},
	    {_TarRoleId, TargetName, TarGName, TarLev, TarFace,
	     IsProvince, FaceUpdateTime, FaceFile}) ->
    sys_conn:pack_send(20033,
		       {Result, TargetName, TarGName, TarLev, TarFace,
			FaceUpdateTime, FaceFile, ReplayId, IsProvince,
			HurtStatistics}),
    ok.

-spec share(#role{}, tuple()) -> ok.

share(Role = #role{id = {_, SrvId}, name = Name},
      {ReplayId, ChannelId, TargetName, 1}) ->
    Msg =
	util:format_ex(lang:get(<<"Chia sẻ video thảo luận theo thời gian "
				  "thực~sBấm để xem"/utf8>>),
		       [color:format({combat_replay,
				      {SrvId, Name, TargetName, ReplayId}})]),
    say:speak(Role,
	      #{from => sys, channel => ChannelId,
		check => <<Name/binary, TargetName/binary>>, len => 0,
		msg => Msg}),
    ok;
share(Role = #role{name = Name},
      {ReplayId, ChannelId, TargetName, 2}) ->
    Msg =
	util:format_ex(lang:get(<<"Tôi đã thực hiện một số vụ cướp bóc "
				  "ở Thần giới, nhấp vào để xem kết quả "
				  "của tôi~s"/utf8>>),
		       [color:format({combat_replay,
				      {Name, TargetName, ReplayId}})]),
    say:speak(Role,
	      #{from => sys, channel => ChannelId,
		check => <<Name/binary, TargetName/binary>>, len => 0,
		msg => Msg}),
    ok;
share(Role = #role{id = {_, SrvId}, name = Name},
      {ReplayId, ChannelId, TargetName, 3}) ->
    Msg =
	util:format_ex(lang:get(<<"Tôi đã chiến đấu một trận trên thang "
				  "Click để xem trận chiến anh hùng.~s"/utf8>>),
		       [color:format({combat_replay,
				      {SrvId, Name, TargetName, ReplayId}})]),
    say:speak(Role,
	      #{from => sys, channel => ChannelId,
		check => <<Name/binary, TargetName/binary>>, len => 0,
		msg => Msg}),
    ok;
share(Role = #role{id = {_, SrvId}, name = Name},
      {ReplayId, ChannelId, TargetName, 4}) ->
    Msg =
	util:format_ex(lang:get(<<"tôi đã chia sẻ~svideo trận chiến~s，Click "
				  "để xem ngay"/utf8>>),
		       [color:format({blue,
				      list_to_binary(["[",
						      lang:get(<<"Đấu trường"/utf8>>),
						      "]"])}),
			color:format({combat_replay,
				      {SrvId, Name, TargetName, ReplayId}})]),
    say:speak(Role,
	      #{from => sys, channel => ChannelId,
		check => <<Name/binary, TargetName/binary>>, len => 0,
		msg => Msg}),
    ok;
share(Role = #role{id = {_, SrvId}, name = Name},
      {ReplayId, ChannelId, TargetName, 5}) ->
    Msg =
	util:format_ex(lang:get(<<"Hãy cùng xem hiệu suất của tôi trong "
				  "các trận chiến bang hội~s"/utf8>>),
		       [color:format({combat_replay,
				      {SrvId, Name, TargetName, ReplayId}})]),
    say:speak(Role,
	      #{from => sys, channel => ChannelId,
		check => <<Name/binary, TargetName/binary>>, len => 0,
		msg => Msg}),
    ok;
share(Role = #role{id = {_, SrvId}, name = Name},
      {ReplayId, ChannelId, TargetName, 6}) ->
    Msg =
	util:format_ex(lang:get(<<"tôi đã chia sẻ~svideo trận chiến~s，Click "
				  "để xem ngay"/utf8>>),
		       [color:format({blue,
				      list_to_binary(["[",
						      lang:get(<<"Xếp hạng"/utf8>>),
						      "]"])}),
			color:format({combat_replay,
				      {SrvId, Name, TargetName, ReplayId}})]),
    say:speak(Role,
	      #{from => sys, channel => ChannelId,
		check => <<Name/binary, TargetName/binary>>, len => 0,
		msg => Msg}),
    ok;
share(Role = #role{id = {_, SrvId}, name = Name},
      {ReplayId, ChannelId, TargetName, 7}) ->
    Msg =
	util:format_ex(lang:get(<<"Chia sẻ video giải phóng mặt bằng Tháp "
				  "thử nghiệm~sBấm để xem"/utf8>>),
		       [color:format({combat_replay,
				      {SrvId, Name, TargetName, ReplayId}})]),
    say:speak(Role,
	      #{from => sys, channel => ChannelId, len => 0,
		msg => Msg}),
    ok;
share(Role = #role{id = {_, SrvId}, name = Name},
      {ReplayId, ChannelId, TargetName, 8}) ->
    case combat_replay_mgr:save_chare_replay(ReplayId) of
      false -> {false, lang:get(<<"Video đã hết hạn"/utf8>>)};
      _ ->
	  Msg =
	      util:format_ex(lang:get(<<"Tôi đã có một trận chiến trong trò chơi "
					"máy bay, nhấp vào để xem diễn biến trận "
					"chiến~s"/utf8>>),
			     [color:format({combat_replay,
					    {SrvId, Name, TargetName,
					     ReplayId}})]),
	  say:speak(Role,
		    #{from => sys, channel => ChannelId,
		      check => <<Name/binary, TargetName/binary>>, len => 0,
		      msg => Msg}),
	  ok
    end;
share(Role = #role{id = {_, SrvId}, name = Name},
      {ReplayId, ChannelId, TargetName, 9}) ->
    Msg =
	util:format_ex(lang:get(<<"Tôi đã chiến đấu trong một trận đấu "
				  "cấp độ hợp tác, Nhấp để xem trận chiến.~s"/utf8>>),
		       [color:format({combat_replay,
				      {SrvId, Name, TargetName, ReplayId}})]),
    say:speak(Role,
	      #{from => sys, channel => ChannelId,
		check => <<Name/binary, TargetName/binary>>, len => 0,
		msg => Msg}),
    ok;
share(_Role, _Arg) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcombat_pk228, _,
       {__Levelcombat_pk228, __Tracescombat_pk228}}
	  when __Levelcombat_pk228 band 8 /= 0 orelse
		 __Tracescombat_pk228 /= [] ->
	  lager:do_log(error,
		       [{module, combat_pk}, {function, share}, {line, 228},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("Loại chia sẻ không tồn tại:~w", [_Arg]),
		       none, 4096, 8, __Levelcombat_pk228,
		       __Tracescombat_pk228, lager_event, __Pidcombat_pk228);
      _ -> ok
    end,
    ok.

gm_must_pk(Role, Num) ->
    case get(gm_must_pk_role_id) of
      TarRoleId = {_, _} ->
	  {ok,
	   R = #role_robot{name = TargetName, gname = GName,
			   lev = TarLev, face_id = TarFace,
			   m_formation =
			       #m_formation{use_lineup = Id,
					    all_lineups = AllLine,
					    list = List}}} =
	      role_robot:get_role(TarRoleId),
	  {AFormationType, AFormationLev, FightPos,
	   FormationArgs} =
	      formation_lib:combat_formation_info(Role),
	  AttackList1 = combat_lib:gen_fight_objects(Role,
						     FightPos),
	  AttackList2 = sprite_tree:gen_fight_object(Role) ++
			  hallows_lib:gen_fight_object(Role,
						       maps:get(hallows_id,
								FormationArgs,
								0))
			    ++ AttackList1,
	  AttackList = combat_attr:calc(AttackList2, 8, Role),
	  #formation_lineup{pos_info = PosInfo,
			    type = BFormationType, hallows_id = HallowsId} =
	      lists:keyfind(Id, #formation_lineup.id, AllLine),
	  {_, BFormationLev, _} =
	      list_util:keyfind(BFormationType, 1, List, {1, 1, 0}),
	  BFightPos = formation_lib:gen_fight_pos(PosInfo,
						  BFormationType),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcombat_pk243, _,
	     {__Levelcombat_pk243, __Tracescombat_pk243}}
		when __Levelcombat_pk243 band 128 /= 0 orelse
		       __Tracescombat_pk243 /= [] ->
		lager:do_log(debug,
			     [{module, combat_pk}, {function, gm_must_pk},
			      {line, 243}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("PK LINE:~w===>~w hallows_id:~w",
					   [{Id, AllLine}, BFightPos,
					    HallowsId]),
			     none, 4096, 128, __Levelcombat_pk243,
			     __Tracescombat_pk243, lager_event,
			     __Pidcombat_pk243);
	    _ -> ok
	  end,
	  {ok, DefList0} = role_robot:to_fight_objects(R,
						       [{Pos, PId}
							|| #formation_fight_info{fight_pos
										     =
										     Pos,
										 id
										     =
										     PId}
							       <- BFightPos,
							   PId > 0]),
	  DefList2 = sprite_tree:gen_fight_object(R) ++
		       hallows_lib:gen_fight_object(R, HallowsId) ++ DefList0,
	  DefList = combat_attr:calc(DefList2, 8, R),
	  ReplayInfo0 = replay_hall:convert(#replay_info{}, a,
					    Role,
					    #{power => Role#role.power,
					      formation_type => AFormationType,
					      rank =>
						  arena_lib:role_rank(Role#role.id)}),
	  ReplayInfo = replay_hall:convert(ReplayInfo0, b, R,
					   #{power => R#role_robot.power,
					     formation_type => BFormationType,
					     rank =>
						 arena_lib:role_rank(TarRoleId)}),
	  {ok, CRole0} = role_convert:do(combat_role, Role),
	  CRole = CRole0#combat_role{conn_pid = 0, watching = 0,
				     is_auto = true},
	  Args = #{on_role_combat_end =>
		       {combat_pk, combat_over_gm_must, [{TargetName, Num}]},
		   formation =>
		       [{1, AFormationType, AFormationLev},
			{2, BFormationType, BFormationLev}],
		   target_role_name => TargetName,
		   replay_info => ReplayInfo, combat_role => CRole,
		   is_robot => 1},
	  combat_lib:start_combat(Role, 8, AttackList, [DefList],
				  Args),
	  {ok, Role};
      _ -> {reply, "Không có đối tượng để đánh nhau"}
    end.

combat_over_gm_must(_Role = #role{pid = Pid},
		    #combat_result{result = Result, action_count = Round},
		    #combat{}, {TargetName, Num}) ->
    NewNum = Num - 1,
    List = util:get(gm_must_pk_combat_result, []),
    Tag = util:if_true(Result == 1, win, lose),
    {TagNum, RoundList} = list_util:keyfind(Tag, List,
					    {0, []}),
    NewList = lists:keystore(Tag, 1, List,
			     {Tag, {TagNum + 1, [Round | RoundList]}}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcombat_pk264, _,
       {__Levelcombat_pk264, __Tracescombat_pk264}}
	  when __Levelcombat_pk264 band 128 /= 0 orelse
		 __Tracescombat_pk264 /= [] ->
	  lager:do_log(debug,
		       [{module, combat_pk}, {function, combat_over_gm_must},
			{line, 264}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("combat_over_gm_must=== ~w ",
				     [{Num, NewNum}]),
		       none, 4096, 128, __Levelcombat_pk264,
		       __Tracescombat_pk264, lager_event, __Pidcombat_pk264);
      _ -> ok
    end,
    case NewNum =< 0 of
      true ->
	  NewListT = [{T1, {T2, lists:sum(T3) / T2}}
		      || {T1, {T2, T3}} <- NewList, T2 =/= 0],
	  Msg = util:fbin("thử thách ~ts kết quả~w",
			  [TargetName, NewListT]),
	  sys_conn:pack_send(10399, {1, Msg}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcombat_pk270, _,
	     {__Levelcombat_pk270, __Tracescombat_pk270}}
		when __Levelcombat_pk270 band 128 /= 0 orelse
		       __Tracescombat_pk270 /= [] ->
		lager:do_log(debug,
			     [{module, combat_pk},
			      {function, combat_over_gm_must}, {line, 270},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("combat_over_gm_must=== ~ts ",
					   [Msg]),
			     none, 4096, 128, __Levelcombat_pk270,
			     __Tracescombat_pk270, lager_event,
			     __Pidcombat_pk270);
	    _ -> ok
	  end,
	  put(gm_must_pk_combat_result, []);
      _ ->
	  put(gm_must_pk_combat_result, NewList),
	  role:apply(async, Pid,
		     {combat_pk, gm_must_pk, [NewNum]})
    end,
    ok.


