-file("data/arena_team.erl", 1).

-file("src/mod/arena_team/arena_team.erl", 1).

-module(arena_team).

-lager_records([{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]},
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
		{cluster_dynamic_local_group, [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
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
		  p_eqm, p_home]},
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
		{arena_team_arge,
		 [result, win_count, lose_count, a_team_id, a_score,
		  a_new_score, a_rank, a_new_rank, a_team_members,
		  a_team_name, b_team_id, b_score, b_new_score, b_rank,
		  b_new_rank, b_team_name, b_team_members,
		  all_hurt_statistics, extra]},
		{arena_team_replay_partner,
		 [pos, bid, lev, star, skin_id, ext]},
		{arena_team_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_team_log,
		 [id, atk_id, atk_name, a_score, a_new_score, a_rank,
		  a_new_rank, a_team_members, a_team_power, b_team_id,
		  b_score, b_new_score, b_rank, b_new_rank, b_team_name,
		  b_team_members, b_team_power, ret, win_count,
		  lose_count, replay_list, time]},
		{role_arena_team_log, [id, list]},
		{arena_term_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  dower_skill, set_skill, attr, extra]},
		{arena_team_defense,
		 [order, role_id, role_lev, formation_type, hallows_id,
		  hallows_lev, hallows_skill_lev, partner_infos,
		  hallows_look_id, hallows_lucky, hallows_seal,
		  hallows_refine, hallows_all_look_ids, sprite_lev,
		  sprites, sprites_attr, extra, break_groups]},
		{arena_team_rival,
		 [id, leader_id, team_name, team_power, team_rank,
		  team_score, team_members, defense, ext]},
		{arena_team_partner,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  ext]},
		{arena_team_member,
		 [id, name, lev, face_id, avatar_bid, power, pos,
		  is_hide, team_partner, formation_type, hallows_id,
		  sprite_lev, sprites, ext, face_update_time, face_file,
		  break_groups]},
		{c_arena_team,
		 [ver, id, rank, score, team_match_power, score_time,
		  ext, members]},
		{arena_team,
		 [ver, id, creat_id, leader_id, leader_name, team_pid,
		  team_name, team_limit_power, team_limit_lev,
		  team_is_check, team_power, team_match_power,
		  team_members, join_list, is_sign, join_num, rival_info,
		  count, add_time, combat_count]},
		{m_arena_team,
		 [ver, period, team_id, combat_count, award_list,
		  old_data, point_info]}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/1, cast/3]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([gm_add_count/0]).

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

-file("src/mod/arena_team/arena_team.erl", 15).

-file("inc/arena_team.hrl", 1).

-record(m_arena_team,
	{ver = 4, period = 0, team_id = {0, <<>>},
	 combat_count = 0, award_list = [], old_data = [],
	 point_info = []}).

-record(arena_team,
	{ver = 1, id = {0, <<>>}, creat_id = {0, <<>>},
	 leader_id = {0, <<>>}, leader_name = <<>>, team_pid = 0,
	 team_name = <<>>, team_limit_power = 0,
	 team_limit_lev = 0, team_is_check = 0, team_power = 0,
	 team_match_power = 0, team_members = [], join_list = [],
	 is_sign = 0, join_num = 1, rival_info = [], count = 0,
	 add_time = 0, combat_count = 0}).

-record(c_arena_team,
	{ver = 1, id = {0, <<>>}, rank = 0, score = 1000,
	 team_match_power = 0, score_time = 0, ext = [],
	 members = []}).

-record(arena_team_member,
	{id = {0, <<>>}, name = <<>>, lev = 0, face_id = 0,
	 avatar_bid = 0, power = 0, pos = 0, is_hide = 0,
	 team_partner = [], formation_type = 1, hallows_id = 0,
	 sprite_lev = 0, sprites = [], ext = [],
	 face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(arena_team_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, ext = []}).

-record(arena_team_rival,
	{id = {0, <<>>}, leader_id = {0, <<>>},
	 team_name = <<>>, team_power = 0, team_rank = 0,
	 team_score = 0, team_members = [], defense = [],
	 ext = []}).

-record(arena_team_defense,
	{order, role_id, role_lev, formation_type, hallows_id,
	 hallows_lev, hallows_skill_lev, partner_infos,
	 hallows_look_id, hallows_lucky, hallows_seal,
	 hallows_refine, hallows_all_look_ids = [],
	 sprite_lev = 0, sprites = [], sprites_attr, extra = [],
	 break_groups = []}).

-record(arena_term_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(role_arena_team_log,
	{id = {0, <<>>}, list = []}).

-record(arena_team_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 a_score = 0, a_new_score = 0, a_rank = 0,
	 a_new_rank = 0, a_team_members = [], a_team_power = 0,
	 b_team_id = {0, <<>>}, b_score = 0, b_new_score = 0,
	 b_rank = 0, b_new_rank = 0, b_team_name = <<>>,
	 b_team_members = [], b_team_power = 0, ret = 1,
	 win_count = 0, lose_count = 0, replay_list = [],
	 time = 0}).

-record(arena_team_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_team_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, skin_id = 0,
	 ext = []}).

-record(arena_team_arge,
	{result = 0, win_count = 0, lose_count = 0,
	 a_team_id = {0, <<>>}, a_score = 0, a_new_score = 0,
	 a_rank = 0, a_new_rank = 0, a_team_members = [],
	 a_team_name = 0, b_team_id = {0, <<>>}, b_score = 0,
	 b_new_score = 0, b_rank = 0, b_new_rank = 0,
	 b_team_name = 0, b_team_members = [],
	 all_hurt_statistics = [], extra = []}).

-file("src/mod/arena_team/arena_team.erl", 16).

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

-file("src/mod/arena_team/arena_team.erl", 17).

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

-file("src/mod/arena_team/arena_team.erl", 18).

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

-file("src/mod/arena_team/arena_team.erl", 19).

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

-file("src/mod/arena_team/arena_team.erl", 20).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/mod/arena_team/arena_team.erl", 21).

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

-file("src/mod/arena_team/arena_team.erl", 22).

-file("inc/guild_skill.hrl", 1).

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

-file("src/mod/arena_team/arena_team.erl", 23).

gm_add_count() ->
    L = ets:tab2list(arena_team_pid),
    [Pid ! gm_set_count_2020_04_04 || {_, Pid} <- L].

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> arena_team ! Info.

cast(by_id, TeamId, Info) ->
    case arena_team_db:get_team_by_id(TeamId) of
      #arena_team{team_pid = Pid} when is_pid(Pid) ->
	  Pid ! Info;
      _ -> ok
    end.

cast(Info) -> gen_server:cast(arena_team, Info).

call(Info) ->
    case catch gen_server:call(arena_team, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team51, _,
	     {__Levelarena_team51, __Tracesarena_team51}}
		when __Levelarena_team51 band 8 /= 0 orelse
		       __Tracesarena_team51 /= [] ->
		lager:do_log(error,
			     [{module, arena_team}, {function, call},
			      {line, 51}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_team, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_team51,
			     __Tracesarena_team51, lager_event,
			     __Pidarena_team51);
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

start_link(Team = #arena_team{id = {Tid, TSrvId}}) ->
    LocalName = list_to_atom(lists:concat(["arena_team_",
					   Tid, "_",
					   bitstring_to_list(TSrvId)])),
    gen_server:start_link({local, LocalName}, arena_team,
			  [Team], []).

init([Team = #arena_team{team_name = TName, id = Tid,
			 team_members = TeamMembers}]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team58, _,
       {__Levelarena_team58, __Tracesarena_team58}}
	  when __Levelarena_team58 band 64 /= 0 orelse
		 __Tracesarena_team58 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team}, {function, init}, {line, 58},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 队伍[~ts]正在启动...",
				     [arena_team, TName]),
		       none, 4096, 64, __Levelarena_team58,
		       __Tracesarena_team58, lager_event, __Pidarena_team58);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    [arena_team_member:add(RoleId, Tid)
     || #arena_team_member{id = RoleId} <- TeamMembers],
    NewTeam = Team#arena_team{team_pid = self()},
    arena_team_db:update_ets(arena_team_list, NewTeam),
    ets:insert(arena_team_pid, {Tid, self()}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team64, _,
       {__Levelarena_team64, __Tracesarena_team64}}
	  when __Levelarena_team64 band 64 /= 0 orelse
		 __Tracesarena_team64 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team}, {function, init}, {line, 64},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 队伍[~ts]启动完成", [arena_team, TName]),
		       none, 4096, 64, __Levelarena_team64,
		       __Tracesarena_team64, lager_event, __Pidarena_team64);
      _ -> ok
    end,
    {ok, NewTeam}.

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
	    {__Pidarena_team72, _,
	     {__Levelarena_team72, __Tracesarena_team72}}
		when __Levelarena_team72 band 8 /= 0 orelse
		       __Tracesarena_team72 /= [] ->
		lager:do_log(error,
			     [{module, arena_team}, {function, handle_call},
			      {line, 72}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelarena_team72,
			     __Tracesarena_team72, lager_event,
			     __Pidarena_team72);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    arena_team, 73, _Reason}),
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      {stop, Resean, NState} -> {stop, Resean, NState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team87, _,
	     {__Levelarena_team87, __Tracesarena_team87}}
		when __Levelarena_team87 band 8 /= 0 orelse
		       __Tracesarena_team87 /= [] ->
		lager:do_log(error,
			     [{module, arena_team}, {function, handle_info},
			      {line, 87}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelarena_team87,
			     __Tracesarena_team87, lager_event,
			     __Pidarena_team87);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    arena_team, 88, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason,
	  _State = #arena_team{id = TeamId,
			       team_name = TeamName}) ->
    arena_team_lobby_mgr:info({team_quit, TeamId,
			       TeamName}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team94, _,
       {__Levelarena_team94, __Tracesarena_team94}}
	  when __Levelarena_team94 band 64 /= 0 orelse
		 __Tracesarena_team94 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team}, {function, terminate},
			{line, 94}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("队伍~ts关闭完成", [TeamName]), none, 4096, 64,
		       __Levelarena_team94, __Tracesarena_team94, lager_event,
		       __Pidarena_team94);
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
	    {__Pidarena_team106, _,
	     {__Levelarena_team106, __Tracesarena_team106}}
		when __Levelarena_team106 band 8 /= 0 orelse
		       __Tracesarena_team106 /= [] ->
		lager:do_log(error,
			     [{module, arena_team}, {function, do_handle_call},
			      {line, 106}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelarena_team106,
			     __Tracesarena_team106, lager_event,
			     __Pidarena_team106);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    arena_team, 107, _Reason}),
	  {reply, {false, lang:get(<<"lỗi thực thi"/utf8>>)},
	   State}
    end;
do_handle_call({join,
		TeamRoleT = #arena_team_member{id = RoleId, ext = Ext}},
	       _From,
	       State = #arena_team{team_is_check = IsCheck,
				   join_list = JoinList, leader_id = LeaderId,
				   id = TeamId}) ->
    NewExt1 = lists:keystore(1, 1, Ext, {1, 0}),
    NewExt = lists:keystore(2, 1, NewExt1,
			    {2, date:unixtime()}),
    TeamRole = TeamRoleT#arena_team_member{ext = NewExt},
    case arena_team_condition:check_can_join(TeamRole,
					     State)
	of
      true when IsCheck == 0 ->
	  case do_join(TeamRole, State, join) of
	    {ok, NewState} ->
		role_lib:cast(by_id, LeaderId,
			      {arena_team_member, point, []}),
		{reply, join, NewState};
	    {false, Msg} -> {reply, {false, Msg}, State}
	  end;
      true ->
	  {NewJoinList, DelList} = list_util:split(50,
						   [TeamRole
						    | lists:keydelete(RoleId,
								      #arena_team_member.id,
								      JoinList)]),
	  NewState = State#arena_team{join_list = NewJoinList},
	  arena_team_db:update_ets(arena_team_list, NewState),
	  role_lib:cast(by_id, LeaderId,
			{arena_team_member, apply_handle, [new_join_req]}),
	  arena_team_db:update_team_join(RoleId, TeamId, add),
	  [arena_team_db:update_team_join(IdTemp, TeamId, del)
	   || #arena_team_member{id = IdTemp} <- DelList],
	  role_lib:cast(by_id, LeaderId,
			{arena_team_member, point, []}),
	  {reply, ok, NewState};
      {false, Msg} -> {reply, {false, Msg}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({stop, normal}, State) ->
    {stop, normal, State};
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
	    {__Pidarena_team152, _,
	     {__Levelarena_team152, __Tracesarena_team152}}
		when __Levelarena_team152 band 8 /= 0 orelse
		       __Tracesarena_team152 /= [] ->
		lager:do_log(error,
			     [{module, arena_team}, {function, do_handle_info},
			      {line, 152}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelarena_team152,
			     __Tracesarena_team152, lager_event,
			     __Pidarena_team152);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    arena_team, 153, _Reason}),
	  {noreply, State}
    end;
do_handle_info({join,
		TeamRoleT = #arena_team_member{id = RoleId, ext = Ext},
		ConnPid},
	       State = #arena_team{team_is_check = IsCheck,
				   join_list = JoinList, leader_id = LeaderId,
				   id = TeamId = {Tid, TSid}}) ->
    NewExt1 = lists:keystore(1, 1, Ext, {1, 0}),
    NewExt = lists:keystore(2, 1, NewExt1,
			    {2, date:unixtime()}),
    TeamRole = TeamRoleT#arena_team_member{ext = NewExt},
    case arena_team_condition:check_can_join(TeamRole,
					     State)
	of
      true when IsCheck == 0 ->
	  case do_join(TeamRole, State, join) of
	    {ok, NewState} ->
		sys_conn:pack_send(ConnPid, 27202,
				   {1, lang:get(<<"Đã gia nhập đội rồi"/utf8>>),
				    Tid, TSid}),
		role_lib:cast(by_id, LeaderId,
			      {arena_team_member, point, []}),
		{noreply, NewState};
	    {false, Msg} ->
		sys_conn:pack_send(ConnPid, 27202, {0, Msg, Tid, TSid}),
		{noreply, State}
	  end;
      true ->
	  {NewJoinList, DelList} = list_util:split(50,
						   [TeamRole
						    | lists:keydelete(RoleId,
								      #arena_team_member.id,
								      JoinList)]),
	  NewState = State#arena_team{join_list = NewJoinList},
	  arena_team_db:update_ets(arena_team_list, NewState),
	  role_lib:cast(by_id, LeaderId,
			{arena_team_member, apply_handle, [new_join_req]}),
	  sys_conn:pack_send(ConnPid, 27202,
			     {1,
			      lang:get(<<"Đơn đăng ký tham gia nhóm đã được gửi, "
					 "các bạn hãy kiên nhẫn chờ đợi được xét "
					 "duyệt."/utf8>>),
			      Tid, TSid}),
	  arena_team_db:update_team_join(RoleId, TeamId, add),
	  [arena_team_db:update_team_join(IdTemp, TeamId, del)
	   || #arena_team_member{id = IdTemp} <- DelList],
	  role_lib:cast(by_id, LeaderId,
			{arena_team_member, point, []}),
	  {noreply, NewState};
      {false, Msg} ->
	  sys_conn:pack_send(ConnPid, 27202, {0, Msg, Tid, TSid}),
	  {noreply, State}
    end;
do_handle_info({apply_join,
		TeamRoleT = #arena_team_member{ext = Ext}, ConnPid},
	       State = #arena_team{leader_id = LeaderId}) ->
    case arena_team_condition:check_can_join(TeamRoleT,
					     State)
	of
      true ->
	  NewExt1 = lists:keystore(1, 1, Ext, {1, 0}),
	  NewExt = lists:keystore(2, 1, NewExt1,
				  {2, date:unixtime()}),
	  TeamRole = TeamRoleT#arena_team_member{ext = NewExt},
	  case do_join(TeamRole, State, apply_join) of
	    {ok, NewState} ->
		sys_conn:pack_send(ConnPid, 27207,
				   {1,
				    lang:get(<<"Đã gia nhập đội rồi"/utf8>>)}),
		role_lib:cast(by_id, LeaderId,
			      {arena_team_member, point, []}),
		{noreply, NewState};
	    {false, Msg} ->
		sys_conn:pack_send(ConnPid, 27207, {0, Msg}),
		{noreply, State}
	  end;
      {false, Msg} ->
	  sys_conn:pack_send(ConnPid, 27207, {0, Msg}),
	  {noreply, State}
    end;
do_handle_info({team_join_apply, TarRoleId = {Rid, Sid},
		Type, ConnPid},
	       State = #arena_team{leader_id = LeaderId,
				   join_list = JoinList}) ->
    case lists:keytake(TarRoleId, #arena_team_member.id,
		       JoinList)
	of
      {value, TeamRoleT = #arena_team_member{ext = Ext},
       Other}
	  when Type == 1 ->
	  NewExt1 = lists:keystore(1, 1, Ext, {1, 0}),
	  NewExt = lists:keystore(2, 1, NewExt1,
				  {2, date:unixtime()}),
	  TeamRole = TeamRoleT#arena_team_member{ext = NewExt},
	  case do_join(TeamRole, State, team_join_apply) of
	    {ok, NewState} ->
		sys_conn:pack_send(ConnPid, 27204, {1, <<>>, Rid, Sid}),
		role_lib:cast(by_id, LeaderId,
			      {arena_team_member, point, []}),
		{noreply, NewState};
	    {false, Msg} ->
		NewJoinList = lists:keydelete(TarRoleId,
					      #arena_team_member.id, JoinList),
		NewState = State#arena_team{join_list = NewJoinList},
		sys_conn:pack_send(ConnPid, 27204, {0, Msg, Rid, Sid}),
		arena_team_db:update_ets(arena_team_list, NewState),
		role_lib:cast(by_id, LeaderId,
			      {arena_team_member, point, []}),
		{noreply, NewState}
	  end;
      {value, _TeamRole, Other} ->
	  NewState = State#arena_team{join_list = Other},
	  arena_team_db:update_ets(arena_team_list, NewState),
	  role_lib:cast(by_id, LeaderId,
			{arena_team_member, point, []}),
	  sys_conn:pack_send(ConnPid, 27204, {1, <<>>, Rid, Sid}),
	  {noreply, NewState};
      _ -> {noreply, State}
    end;
do_handle_info({team_quit, TeamId, RoleId, Name,
		ConnPid},
	       State = #arena_team{id = TeamId,
				   team_match_power = MaxPower,
				   is_sign = IsSign, team_name = TeamName,
				   leader_id = LeaderId,
				   team_members = Members}) ->
    {_, _, _, StateName} = sys_env:get(arena_team_state,
				       {0, 0, 0, idle}),
    NewMembers = lists:keydelete(RoleId,
				 #arena_team_member.id, Members),
    if StateName == open_combat andalso IsSign == 1 ->
	   sys_conn:pack_send(ConnPid, 27211,
			      {0,
			       lang:get(<<"Các đội đã đăng ký thi đấu không được "
					  "phép thay đổi nhân sự."/utf8>>)}),
	   {noreply, State};
       NewMembers == [] ->
	   arena_team_lobby_mgr:info({team_quit, TeamId,
				      TeamName}),
	   arena_team_member:del(RoleId),
	   role_lib:cast(by_id, RoleId,
			 {arena_team_member, apply_handle, [team_quit]}),
	   {stop, normal, State};
       RoleId == LeaderId ->
	   IsHide = case [1
			  || #arena_team_member{is_hide = 1} <- NewMembers]
			of
		      [] -> 1;
		      _ -> 0
		    end,
	   [TeamRole = #arena_team_member{id = NewLeaderId,
					  is_hide = IsHide2,
					  name = NewLeaderName, ext = Ext}
	    | Other] =
	       lists:keysort(#arena_team_member.power, NewMembers),
	   NewTeamRole = TeamRole#arena_team_member{is_hide =
							max(IsHide, IsHide2),
						    ext =
							lists:keystore(1, 1,
								       Ext,
								       {1, 1})},
	   NewMembers2 = [NewTeamRole | Other],
	   TeamPower = lists:sum([Power
				  || #arena_team_member{power = Power}
					 <- NewMembers]),
	   NewMaxPower = max(MaxPower, TeamPower),
	   NewState = State#arena_team{is_sign = 0,
				       team_power = TeamPower,
				       team_match_power = NewMaxPower,
				       leader_id = NewLeaderId,
				       leader_name = NewLeaderName,
				       team_members = NewMembers2,
				       join_num = length(NewMembers2)},
	   arena_team_db:update_ets(arena_team_list, NewState),
	   arena_team_member:del(RoleId),
	   [role_lib:cast(by_id, TId,
			  {arena_team_member, apply_handle, [new_member]})
	    || #arena_team_member{id = TId} <- NewMembers2],
	   role_lib:cast(by_id, RoleId,
			 {arena_team_member, apply_handle, [team_quit]}),
	   case IsSign == 1 of
	     true ->
		 arena_team_mgr:cluster_cast_main(arena_team_mgr, info,
						  [{team_no_sign, TeamId}]);
	     _ -> skip
	   end,
	   Data = {[], 512, 0, util:fbin("~ts退出队伍", [Name]),
		   date:unixtime()},
	   self() ! {say, Data},
	   {noreply, NewState};
       true ->
	   TeamPower = lists:sum([Power
				  || #arena_team_member{power = Power}
					 <- NewMembers]),
	   NewMaxPower = max(MaxPower, TeamPower),
	   NewState = State#arena_team{is_sign = 0,
				       team_power = TeamPower,
				       team_match_power = NewMaxPower,
				       team_members = NewMembers,
				       join_num = length(NewMembers)},
	   arena_team_db:update_ets(arena_team_list, NewState),
	   arena_team_member:del(RoleId),
	   [role_lib:cast(by_id, TId,
			  {arena_team_member, apply_handle, [new_member]})
	    || #arena_team_member{id = TId} <- NewMembers],
	   role_lib:cast(by_id, RoleId,
			 {arena_team_member, apply_handle, [team_quit]}),
	   role_lib:cast(by_id, LeaderId,
			 {arena_team_member, point, []}),
	   case IsSign == 1 of
	     true ->
		 arena_team_mgr:cluster_cast_main(arena_team_mgr, info,
						  [{team_no_sign, TeamId}]);
	     _ -> skip
	   end,
	   Data = {[], 512, 0, util:fbin("~ts退出队伍", [Name]),
		   date:unixtime()},
	   self() ! {say, Data},
	   {noreply, NewState}
    end;
do_handle_info({team_out_role, RoleId, Name, ConnPid},
	       State = #arena_team{id = TeamId,
				   team_match_power = MaxPower,
				   leader_id = LeaderId, team_members = Members,
				   is_sign = IsSign}) ->
    {_, _, _, StateName} = sys_env:get(arena_team_state,
				       {0, 0, 0, idle}),
    case IsSign == 1 andalso StateName == open_combat of
      true ->
	  sys_conn:pack_send(ConnPid, 27212,
			     {0,
			      lang:get(<<"Các đội đã đăng ký thi đấu không được "
					 "phép thay đổi nhân sự."/utf8>>)}),
	  {noreply, State};
      _ ->
	  [TeamRole1 | Other] = NewMembersT =
				    lists:keydelete(RoleId,
						    #arena_team_member.id,
						    Members),
	  NewMembers = case [1
			     || #arena_team_member{is_hide = 1} <- NewMembersT]
			   of
			 [] ->
			     [TeamRole1#arena_team_member{is_hide = 1} | Other];
			 _ -> NewMembersT
		       end,
	  TeamPower = lists:sum([Power
				 || #arena_team_member{power = Power}
					<- NewMembers]),
	  NewMaxPower = max(MaxPower, TeamPower),
	  NewState = State#arena_team{team_members = NewMembers,
				      join_num = length(NewMembers),
				      is_sign = 0, team_power = TeamPower,
				      team_match_power = NewMaxPower},
	  case IsSign == 1 of
	    true ->
		arena_team_mgr:cluster_cast_main(arena_team_mgr, info,
						 [{team_no_sign, TeamId}]);
	    _ -> skip
	  end,
	  arena_team_db:update_ets(arena_team_list, NewState),
	  arena_team_member:del(RoleId),
	  sys_conn:pack_send(ConnPid, 27212,
			     {1, lang:get(<<"Người chơi đã bị đá"/utf8>>)}),
	  Data = {[], 512, 0,
		  util:fbin("~ts rời khỏi đội", [Name]), date:unixtime()},
	  self() ! {say, Data},
	  role_lib:cast(by_id, RoleId,
			{arena_team_member, apply_handle, [team_out_role]}),
	  [role_lib:cast(by_id, TId,
			 {arena_team_member, apply_handle, [new_member]})
	   || #arena_team_member{id = TId} <- NewMembers],
	  role_lib:cast(by_id, LeaderId,
			{arena_team_member, point, []}),
	  {noreply, NewState}
    end;
do_handle_info({team_change_leader, RoleId},
	       State = #arena_team{leader_id = OldId,
				   team_members = Members}) ->
    case lists:keyfind(RoleId, #arena_team_member.id,
		       Members)
	of
      TeamMenberT = #arena_team_member{id = LeaderId,
				       name = LeaderName, ext = Ext} ->
	  TeamMenber = TeamMenberT#arena_team_member{ext =
							 lists:keystore(1, 1,
									Ext,
									{1,
									 1})},
	  OldLeaderMember = lists:keyfind(OldId,
					  #arena_team_member.id, Members),
	  NewMembers1 = lists:keystore(OldId,
				       #arena_team_member.id, Members,
				       OldLeaderMember#arena_team_member{ext =
									     lists:keystore(1,
											    1,
											    Ext,
											    {1,
											     0})}),
	  NewMembers = lists:keystore(LeaderId,
				      #arena_team_member.id, NewMembers1,
				      TeamMenber),
	  NewState = State#arena_team{leader_id = LeaderId,
				      leader_name = LeaderName,
				      team_members = NewMembers},
	  arena_team_db:update_ets(arena_team_list, NewState),
	  [role_lib:cast(by_id, TId,
			 {arena_team_member, apply_handle, [new_member]})
	   || #arena_team_member{id = TId} <- Members],
	  {noreply, NewState};
      _ -> {noreply, State}
    end;
do_handle_info({team_update_info,
		{LimitLev, LimitPower, IsCheck}},
	       State = #arena_team{team_members = Members}) ->
    NewState = State#arena_team{team_limit_power =
				    LimitPower,
				team_limit_lev = LimitLev,
				team_is_check = IsCheck},
    arena_team_db:update_ets(arena_team_list, NewState),
    [role_lib:cast(by_id, TId,
		   {arena_team_member, apply_handle, [new_member]})
     || #arena_team_member{id = TId} <- Members],
    {noreply, NewState};
do_handle_info({team_rename, Name, ConnPid},
	       State = #arena_team{team_name = OldName,
				   team_members = Members}) ->
    case Name == OldName of
      true ->
	  sys_conn:pack_send(ConnPid, 27226,
			     {1, lang:get(<<"Đã sửa đổi"/utf8>>)}),
	  {noreply, State};
      _ ->
	  case arena_team_lobby_mgr:call({rename, Name, OldName})
	      of
	    {false, Msg} ->
		sys_conn:pack_send(ConnPid, 27226, {0, Msg}),
		{noreply, State};
	    _ ->
		NewState = State#arena_team{team_name = Name},
		arena_team_db:update_ets(arena_team_list, NewState),
		[role_lib:cast(by_id, TId,
			       {arena_team_member, apply_handle, [new_member]})
		 || #arena_team_member{id = TId} <- Members],
		sys_conn:pack_send(ConnPid, 27226,
				   {1, lang:get(<<"Đã sửa đổi"/utf8>>)}),
		{noreply, NewState}
	  end
    end;
do_handle_info({team_sign, ConnPid},
	       State = #arena_team{team_members = Members,
				   is_sign = IsSign}) ->
    {_, _, _, StateName} = sys_env:get(arena_team_state,
				       {0, 0, 0, idle}),
    case StateName == open_combat orelse
	   StateName == open_team
	of
      false ->
	  sys_conn:pack_send(ConnPid, 27240,
			     {0,
			      lang:get(<<"Bạn chỉ có thể đăng ký tham gia giai "
					 "đoạn lập đội hoặc giai đoạn chiến đấu."/utf8>>)}),
	  {noreply, State};
      _ ->
	  MaxNum = 3,
	  case length(Members) >= MaxNum of
	    true when IsSign == 0 ->
		NewState = State#arena_team{is_sign = 1},
		arena_team_db:update_ets(arena_team_list, NewState),
		Msg = case StateName of
			open_combat ->
			    lang:get(<<"Đăng ký thành công và bạn đã trực tiếp "
				       "tham gia thử thách"/utf8>>);
			_ ->
			    lang:get(<<"Đăng ký thành công, chờ cuộc thi chính "
				       "thức bắt đầu"/utf8>>)
		      end,
		sys_conn:pack_send(ConnPid, 27240, {1, Msg}),
		[role_lib:cast(by_id, TId,
			       {arena_team_member, apply_handle, [update_team]})
		 || #arena_team_member{id = TId} <- Members],
		CAreanTeam = to_arean_team(NewState),
		arena_team_mgr:cluster_cast_main(arena_team_mgr, info,
						 [{team_sign, CAreanTeam}]),
		case StateName == open_combat of
		  true -> self() ! start_count_time;
		  _ -> skip
		end,
		{noreply, NewState};
	    _ when IsSign == 1 ->
		sys_conn:pack_send(ConnPid, 27240,
				   {0, lang:get(<<"Đã đăng ký"/utf8>>)}),
		{noreply, State};
	    _ ->
		sys_conn:pack_send(ConnPid, 27240,
				   {0, lang:get(<<"Không đủ số người"/utf8>>)}),
		{noreply, State}
	  end
    end;
do_handle_info({team_no_sign, ConnPid},
	       State = #arena_team{team_members = Members,
				   is_sign = IsSign, id = TeamId}) ->
    {_, _, _, StateName} = sys_env:get(arena_team_state,
				       {0, 0, 0, idle}),
    case StateName == open_team of
      false ->
	  sys_conn:pack_send(ConnPid, 27241,
			     {0,
			      lang:get(<<"Đã tham gia thử thách, đăng ký không "
					 "thể hủy"/utf8>>)}),
	  {noreply, State};
      _ ->
	  case IsSign == 1 of
	    true ->
		NewState = State#arena_team{is_sign = 0},
		arena_team_db:update_ets(arena_team_list, NewState),
		sys_conn:pack_send(ConnPid, 27241,
				   {1,
				    lang:get(<<"Hủy đăng ký thành công"/utf8>>)}),
		[role_lib:cast(by_id, TId,
			       {arena_team_member, apply_handle, [update_team]})
		 || #arena_team_member{id = TId} <- Members],
		arena_team_mgr:cluster_cast_main(arena_team_mgr, info,
						 [{team_no_sign, TeamId}]),
		{noreply, NewState};
	    _ ->
		sys_conn:pack_send(ConnPid, 27241,
				   {1,
				    lang:get(<<"Hủy đăng ký thành công"/utf8>>)}),
		{noreply, State}
	  end
    end;
do_handle_info({team_set_pos, ConnPid, PosInfo},
	       State = #arena_team{team_members = Members}) ->
    case arena_team_condition:check_set_pos(PosInfo, State)
	of
      {false, Msg} ->
	  sys_conn:pack_send(ConnPid, 27242, {0, Msg}),
	  {noreply, State};
      _ ->
	  case role_set_pos(Members, PosInfo, []) of
	    {ok, NewMembers} ->
		NewState = State#arena_team{team_members = NewMembers},
		arena_team_db:update_ets(arena_team_list, NewState),
		sys_conn:pack_send(ConnPid, 27242,
				   {1,
				    lang:get(<<"Thiết lập thành công"/utf8>>)}),
		[role_lib:cast(by_id, TId,
			       {arena_team_member, apply_handle, [update_team]})
		 || #arena_team_member{id = TId} <- Members],
		{noreply, NewState};
	    _ ->
		sys_conn:pack_send(ConnPid, 27242,
				   {1,
				    lang:get(<<"Thiết lập không thành công"/utf8>>)}),
		{noreply, State}
	  end
    end;
do_handle_info({match, MatchInfo},
	       State = #arena_team{team_members = Members}) ->
    RivalInfo = [Data
		 || Data <- [to_rival_info(Info) || Info <- MatchInfo],
		    Data =/= undefined],
    NewState = State#arena_team{rival_info = RivalInfo},
    arena_team_db:update_ets(arena_team_list, NewState),
    [role_lib:cast(by_id, TId,
		   {arena_team_member, apply_handle,
		    [{update_rival_info, RivalInfo}]})
     || #arena_team_member{id = TId} <- Members],
    {noreply, NewState};
do_handle_info({match_robot,
		{RobotIds, MinLev, MaxLev, Score, Flag}},
	       State = #arena_team{team_members = Members}) ->
    ScorePer = case Flag of
		 1 -> arena_team_data:get_const(integral_higher);
		 _ -> arena_team_data:get_const(integral_low)
	       end,
    TeamScore = max(1000,
		    util:rand(util:uround(Score * (1000 - ScorePer) / 1000),
			      util:uround(Score * (1000 + ScorePer) / 1000))),
    RivalInfo = [to_robot_rival_info(RobotIds, MinLev,
				     MaxLev, TeamScore)],
    NewState = State#arena_team{rival_info = RivalInfo},
    arena_team_db:update_ets(arena_team_list, NewState),
    [role_lib:cast(by_id, TId,
		   {arena_team_member, apply_handle,
		    [{update_rival_info, RivalInfo}]})
     || #arena_team_member{id = TId} <- Members],
    {noreply, NewState};
do_handle_info({change_rank, NewRank, Score},
	       State = #arena_team{team_members = Members}) ->
    [role_lib:cast(by_id, TId,
		   {arena_team_member, apply_handle,
		    [{change_rank, NewRank, Score}]})
     || #arena_team_member{id = TId} <- Members],
    {noreply, State};
do_handle_info({combat_over, Maps},
	       State = #arena_team{team_members = Members,
				   combat_count = CombatCount}) ->
    NewState = State#arena_team{combat_count = CombatCount,
				rival_info = []},
    arena_team_db:update_ets(arena_team_list, NewState),
    [role_lib:cast(by_id, TId,
		   {arena_team_member, apply_handle, [{combat_over}]})
     || #arena_team_member{id = TId} <- Members],
    [room_feat_mgr:info({arena_team_do_feat, TId, Maps})
     || #arena_team_member{id = TId} <- Members],
    {noreply, NewState};
do_handle_info({def_combat_over, Maps},
	       State = #arena_team{team_members = Members}) ->
    [role_lib:cast(by_id, TId,
		   {arena_team_member, apply_handle, [{combat_over}]})
     || #arena_team_member{id = TId} <- Members],
    [room_feat_mgr:info({arena_team_do_feat_def, TId, Maps})
     || #arena_team_member{id = TId} <- Members],
    {noreply, State};
do_handle_info({rank_award, Rank, Award},
	       State = #arena_team{team_members = Members}) ->
    Title =
	lang:get(<<"Phần thưởng xếp hạng đấu trường đội"/utf8>>),
    {MailAssets, MailItems} =
	format:split_assets_items(Award),
    Content =
	color:msg(lang:get(<<"Nhà thám hiểm thân mến, bạn đã đạt được "
			     "thứ hạng tốt ~ts trong bảng xếp hạng "
			     "giải quyết đấu trường đồng đội mùa trước，Hãy "
			     "tiếp tục làm tốt công việc nhé"/utf8>>),
		  [{green, Rank}]),
    Mail = {Title, Content, MailAssets, MailItems,
	    util:fbin(<<"Phần thưởng xếp hạng đấu trường đội"/utf8>>,
		      [])},
    [mail:send(TId, Mail)
     || #arena_team_member{id = TId} <- Members],
    [room_feat_mgr:info({arena_team_do_feat_rank, TId,
			 Rank})
     || #arena_team_member{id = TId} <- Members],
    {noreply, State};
do_handle_info({say, SayData},
	       State = #arena_team{id = TeamId,
				   team_members = Members}) ->
    [role_lib:cast(by_id, TId,
		   {arena_team_member, apply_handle, [{say, SayData}]})
     || #arena_team_member{id = TId} <- Members],
    do_save_msg(TeamId, SayData),
    {noreply, State};
do_handle_info({translate_broadcast, SayData},
	       State = #arena_team{id = TeamId,
				   team_members = Members}) ->
    [role_lib:cast(by_id, TId,
		   {arena_team_member, apply_handle,
		    [{translate_broadcast, SayData}]})
     || #arena_team_member{id = TId} <- Members],
    do_save_msg(TeamId, SayData),
    {noreply, State};
do_handle_info(combat_action,
	       State = #arena_team{id = TeamId, count = Count,
				   combat_count = CombatCount,
				   add_time = AddTime}) ->
    TimeOut = arena_team_data:get_const(recovery_time),
    MaxCount = arena_team_data:get_const(limit_number),
    NCombatCount = CombatCount + 1,
    NCount = Count - 1,
    NAddTime = case NCount >= MaxCount of
		 true -> AddTime;
		 _ when Count >= MaxCount ->
		     util:set_timer(team_add_count, TimeOut, add_count),
		     date:unixtime() + TimeOut;
		 _ -> AddTime
	       end,
    NewState = State#arena_team{add_time = NAddTime,
				combat_count = NCombatCount, count = NCount},
    arena_team_db:update_ets(arena_team_count,
			     {TeamId, NCombatCount}),
    arena_team_db:update_ets(arena_team_list, NewState),
    {noreply, NewState};
do_handle_info(del_count_time, State = #arena_team{}) ->
    util:unset_timer(team_add_count), {noreply, State};
do_handle_info(gm_set_count_2020_04_04,
	       State = #arena_team{id = TeamId, count = Count,
				   is_sign = IsSign, add_time = AddTime,
				   team_members = Members,
				   combat_count = CombatCount}) ->
    case get(gm_set_count_2020_04_04_1) of
      undefined when IsSign == 1 ->
	  TimeOut = arena_team_data:get_const(recovery_time),
	  MaxCount = arena_team_data:get_const(limit_number),
	  NAddTime = case Count >= MaxCount of
		       true ->
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
			     {__Pidarena_team562, _,
			      {__Levelarena_team562, __Tracesarena_team562}}
				 when __Levelarena_team562 band 64 /= 0 orelse
					__Tracesarena_team562 /= [] ->
				 lager:do_log(info,
					      [{module, arena_team},
					       {function, do_handle_info},
					       {line, 562},
					       {pid, pid_to_list(self())},
					       {node, node()}
					       | lager:md()],
					      io_lib:format("组队竞技场次数已满,无需设置定时器:~w",
							    [TeamId]),
					      none, 4096, 64,
					      __Levelarena_team562,
					      __Tracesarena_team562,
					      lager_event, __Pidarena_team562);
			     _ -> ok
			   end,
			   AddTime;
		       _ ->
			   case util:has_timer(team_add_count) of
			     true ->
				 case {whereis(lager_event),
				       whereis(lager_event),
				       lager_config:get({lager_event, loglevel},
							{0, []})}
				     of
				   {undefined, undefined, _} ->
				       fun () -> {error, lager_not_running}
				       end();
				   {undefined, _, _} ->
				       fun () ->
					       {error,
						{sink_not_configured,
						 lager_event}}
				       end();
				   {__Pidarena_team567, _,
				    {__Levelarena_team567,
				     __Tracesarena_team567}}
				       when __Levelarena_team567 band 64 /= 0
					      orelse
					      __Tracesarena_team567 /= [] ->
				       lager:do_log(info,
						    [{module, arena_team},
						     {function, do_handle_info},
						     {line, 567},
						     {pid, pid_to_list(self())},
						     {node, node()}
						     | lager:md()],
						    io_lib:format("组队竞技场次数修复,已有定时器:~w",
								  [TeamId]),
						    none, 4096, 64,
						    __Levelarena_team567,
						    __Tracesarena_team567,
						    lager_event,
						    __Pidarena_team567);
				   _ -> ok
				 end,
				 AddTime;
			     _ ->
				 case {whereis(lager_event),
				       whereis(lager_event),
				       lager_config:get({lager_event, loglevel},
							{0, []})}
				     of
				   {undefined, undefined, _} ->
				       fun () -> {error, lager_not_running}
				       end();
				   {undefined, _, _} ->
				       fun () ->
					       {error,
						{sink_not_configured,
						 lager_event}}
				       end();
				   {__Pidarena_team570, _,
				    {__Levelarena_team570,
				     __Tracesarena_team570}}
				       when __Levelarena_team570 band 64 /= 0
					      orelse
					      __Tracesarena_team570 /= [] ->
				       lager:do_log(info,
						    [{module, arena_team},
						     {function, do_handle_info},
						     {line, 570},
						     {pid, pid_to_list(self())},
						     {node, node()}
						     | lager:md()],
						    io_lib:format("组队竞技场次数修复,重新设置定时器:~w",
								  [TeamId]),
						    none, 4096, 64,
						    __Levelarena_team570,
						    __Tracesarena_team570,
						    lager_event,
						    __Pidarena_team570);
				   _ -> ok
				 end,
				 util:set_timer(team_add_count, TimeOut,
						add_count),
				 date:unixtime() + TimeOut
			   end
		     end,
	  NCombatCount = max(17 - (Count + CombatCount) +
			       CombatCount,
			     CombatCount),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team578, _,
	     {__Levelarena_team578, __Tracesarena_team578}}
		when __Levelarena_team578 band 64 /= 0 orelse
		       __Tracesarena_team578 /= [] ->
		lager:do_log(info,
			     [{module, arena_team}, {function, do_handle_info},
			      {line, 578}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("组队竞技场次数修复,新次数:~w",
					   [{TeamId, NCombatCount}]),
			     none, 4096, 64, __Levelarena_team578,
			     __Tracesarena_team578, lager_event,
			     __Pidarena_team578);
	    _ -> ok
	  end,
	  NewState = State#arena_team{combat_count = NCombatCount,
				      add_time = NAddTime},
	  arena_team_db:update_ets(arena_team_count,
				   {TeamId, NCombatCount}),
	  arena_team_db:update_ets(arena_team_list, NewState),
	  put(gm_set_count_2020_04_04_1, NCombatCount),
	  Title =
	      lang:get(<<"Bồi thường đặc biệt cho Đấu Trường Tổ "
			 "Đội"/utf8>>),
	  MaillLog = <<"Phần thưởng bù đặc biệt cho Đấu Trường "
		       "Tổ Đội"/utf8>>,
	  Msg =
	      lang:get(<<"Máy chủ Đại Lục Phiêu Lưu vào lúc <div "
			 "fontcolor=#8b0715>3:10 ngày 5 tháng "
			 "4</div> đã thực hiện bảo trì đặc biệt "
			 "cho chế độ chơi Đấu Trường Tổ Đội. Xin "
			 "quý Nhẫn Giả mở lại giao diện chế độ "
			 "chơi để trải nghiệm nội dung mới nhất, "
			 "chi tiết như sau:  \n\t\t\t\n      1. "
			 "Đấu Trường Tổ Đội sẽ hoàn lại【Tiến độ "
			 "phần thưởng thách đấu】, tiến độ hoàn "
			 "lại = \n\t\t\tSố lần thách đấu tối đa "
			 "bình thường - (Số lần chưa sử dụng + "
			 "Số lần đã thách đấu)  \n\t\t\t\n    "
			 "  2. Đã sửa lỗi hiển thị sai thời gian "
			 "hồi phục trong trường hợp đặc biệt của "
			 "Đấu Trường Tổ Đội.  \n\t\t\t\n      "
			 "Trợ lý chúc quý ngài đầy may mắn! Chúc "
			 "bạn chơi game vui vẻ!"/utf8>>),
	  [mail:send(TId, {Title, Msg, [], [], MaillLog})
	   || #arena_team_member{id = TId} <- Members],
	  [role_lib:cast(by_id, TId,
			 {arena_team_member, apply_handle,
			  [{update_combat_count, NCombatCount}]})
	   || #arena_team_member{id = TId} <- Members],
	  {noreply, NewState};
      undefined ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team594, _,
	     {__Levelarena_team594, __Tracesarena_team594}}
		when __Levelarena_team594 band 64 /= 0 orelse
		       __Tracesarena_team594 /= [] ->
		lager:do_log(info,
			     [{module, arena_team}, {function, do_handle_info},
			      {line, 594}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Đã sửa lỗi số lần tham gia Đấu Trường "
					   "Tổ Đội khi đội chưa đăng ký tham gia:~w",
					   [TeamId]),
			     none, 4096, 64, __Levelarena_team594,
			     __Tracesarena_team594, lager_event,
			     __Pidarena_team594);
	    _ -> ok
	  end,
	  {noreply, State};
      _ -> {noreply, State}
    end;
do_handle_info({gm_set_count, Count},
	       State = #arena_team{}) ->
    NewState = State#arena_team{count = Count},
    arena_team_db:update_ets(arena_team_list, NewState),
    {noreply, NewState};
do_handle_info(start_count_time,
	       State = #arena_team{is_sign = 0}) ->
    {noreply, State};
do_handle_info(start_count_time,
	       State = #arena_team{count = Count, add_time = AddTime,
				   is_sign = 1}) ->
    TimeOut = arena_team_data:get_const(recovery_time),
    NAddTime = case Count >=
		      arena_team_data:get_const(limit_number)
		   of
		 true -> AddTime;
		 _ ->
		     util:set_timer(team_add_count, TimeOut, add_count),
		     date:unixtime() + TimeOut
	       end,
    NewState = State#arena_team{add_time = NAddTime},
    arena_team_db:update_ets(arena_team_list, NewState),
    {noreply, NewState};
do_handle_info(add_count,
	       State = #arena_team{count = Count, add_time = AddTime,
				   team_members = Members,
				   combat_count = CombatCount}) ->
    MaxCount = arena_team_data:get_const(limit_number),
    TimeOut = arena_team_data:get_const(recovery_time),
    Now = date:unixtime(),
    NewState = if Count >= MaxCount -> State;
		  Count == MaxCount - 1 ->
		      State#arena_team{count = Count + 1};
		  true ->
		      NextAddTime = util:if_true(AddTime == 0, Now + TimeOut,
						 AddTime + TimeOut),
		      util:set_timer(team_add_count,
				     max(1, NextAddTime - Now), add_count),
		      State#arena_team{count = Count + 1,
				       add_time = NextAddTime}
	       end,
    arena_team_db:update_ets(arena_team_list, NewState),
    [role_lib:cast(by_id, TId,
		   {arena_team_member, apply_handle, [update_count]})
     || #arena_team_member{id = TId} <- Members],
    {noreply, NewState};
do_handle_info(gm_add_count,
	       State = #arena_team{leader_id = LeaderId, count = Count,
				   add_time = AddTime, team_members = Members,
				   combat_count = CombatCount}) ->
    case get(gm_add_count_2020_2_23) of
      undefined ->
	  NeedCount = util:abs(CombatCount + Count - 22),
	  AddCount = if NeedCount > 1 -> 2;
			NeedCount == 1 -> 1;
			true -> 0
		     end,
	  NewState = State#arena_team{count = Count + AddCount},
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team663, _,
	     {__Levelarena_team663, __Tracesarena_team663}}
		when __Levelarena_team663 band 64 /= 0 orelse
		       __Tracesarena_team663 /= [] ->
		lager:do_log(info,
			     [{module, arena_team}, {function, do_handle_info},
			      {line, 663}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Số lần bồi thường Đấu Trường Tổ Đội：~w",
					   [{State#arena_team.id, AddCount}]),
			     none, 4096, 64, __Levelarena_team663,
			     __Tracesarena_team663, lager_event,
			     __Pidarena_team663);
	    _ -> ok
	  end,
	  case AddCount > 0 of
	    true ->
		mail:send(LeaderId,
			  {lang:get(<<"Sửa lỗi số lần tham gia Đấu Trường Tổ "
				      "Đội"/utf8>>),
			   lang:get(<<"Thưa Quý Nhẫn Giả:  \n\t\t\t\tDo sự "
				      "cố mạng, một số người chơi gặp phải "
				      "tình trạng đăng nhập bất thường trong "
				      "ngày hôm nay, \n\t\t\t\tdẫn đến số lần "
				      "thách đấu trong Đấu Trường Tổ Đội không "
				      "thể sử dụng và không tăng lên khi đạt "
				      "giới hạn. Chúng tôi đã thực hiện bồi "
				      "thường số lần cho các người chơi bị "
				      "ảnh hưởng (sau khi bồi thường, số lần "
				      "có thể bị tràn). \n\t\t\t\tXin vui lòng "
				      "kiểm tra trong giao diện chế độ chơi, "
				      "chúng tôi rất tiếc vì sự bất tiện này "
				      "và chúc bạn chơi game vui vẻ!"/utf8>>),
			   [], [],
			   <<"Sửa lỗi số lần tham gia Đấu Trường Tổ "
			     "Đội"/utf8>>});
	    _ -> ok
	  end,
	  put(gm_add_count_2020_2_23, AddCount),
	  arena_team_db:update_ets(arena_team_list, NewState),
	  [role_lib:cast(by_id, TId,
			 {arena_team_member, apply_handle, [update_count]})
	   || #arena_team_member{id = TId} <- Members],
	  {noreply, NewState};
      _ -> {noreply, State}
    end;
do_handle_info({update_member,
		TeamRole = #arena_team_member{id = Id, ext = Ext1}},
	       State = #arena_team{team_match_power = MaxPower,
				   team_members = Members}) ->
    case lists:keytake(Id, #arena_team_member.id, Members)
	of
      {value,
       #arena_team_member{pos = Pos, is_hide = IsHide,
			  ext = Ext},
       Other} ->
	  HallowsLookId = list_util:keyfind(5, Ext1, 0),
	  NTeamRole = TeamRole#arena_team_member{pos = Pos,
						 is_hide = IsHide,
						 ext =
						     lists:keystore(5, 1, Ext,
								    {5,
								     HallowsLookId})},
	  NewMembers = [NTeamRole | Other],
	  TeamPower = lists:sum([Power
				 || #arena_team_member{power = Power}
					<- NewMembers]),
	  NewMaxPower = max(MaxPower, TeamPower),
	  NewState = State#arena_team{team_members = NewMembers,
				      team_power = TeamPower,
				      team_match_power = NewMaxPower},
	  arena_team_db:update_ets(arena_team_list, NewState),
	  [role_lib:cast(by_id, TId,
			 {arena_team_member, apply_handle, [update_team]})
	   || #arena_team_member{id = TId} <- Members],
	  {noreply, NewState};
      _ -> {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

do_save_msg(TeamId, SayData) ->
    SayHistory = arena_team_db:get_team_msg(TeamId),
    Now = date:unixtime(),
    L1 = SayHistory ++ [{Now, SayData}],
    NewSayHistory = case length(L1) > 30 of
		      true -> [_ | L2] = L1, L2;
		      _ -> L1
		    end,
    arena_team_db:update_ets(arena_team_msg,
			     {TeamId, NewSayHistory}, ets).

do_join(TeamRole = #arena_team_member{id = RoleId,
				      name = Name},
	State = #arena_team{team_members = TemMembers,
			    team_match_power = MaxPower, join_list = JoinList,
			    id = TeamId},
	Type) ->
    MaxNum = 3,
    NowNum = length(TemMembers),
    case NowNum >= MaxNum of
      false ->
	  case catch arena_team_lobby_mgr:call({check_join,
						RoleId, TeamId, Type})
	      of
	    ok ->
		Pos = calc_pos(TemMembers, MaxNum),
		NewTeamRole = TeamRole#arena_team_member{pos = Pos},
		NewTemMembers = [NewTeamRole | TemMembers],
		NewNum = length(NewTemMembers),
		NewJoinList = lists:keydelete(RoleId,
					      #arena_team_member.id, JoinList),
		TeamPower = lists:sum([Power
				       || #arena_team_member{power = Power}
					      <- NewTemMembers]),
		NewMaxPower = max(MaxPower, TeamPower),
		NewState = State#arena_team{team_members =
						NewTemMembers,
					    team_power = TeamPower,
					    team_match_power = NewMaxPower,
					    join_num = NewNum,
					    join_list = NewJoinList},
		arena_team_db:update_ets(arena_team_list, NewState),
		arena_team_db:update_ets(arena_team_invite, RoleId,
					 del),
		Data = {[], 512, 0,
			util:fbin("~tsGia nhập đội", [Name]), date:unixtime()},
		self() ! {say, Data},
		[role_lib:cast(by_id, TId,
			       {arena_team_member, apply_handle, [update_team]})
		 || #arena_team_member{id = TId} <- TemMembers],
		role_lib:cast(by_id, RoleId,
			      {arena_team_member, apply_handle,
			       [{new_team, TeamId}]}),
		arena_team_member:add(RoleId, TeamId),
		{ok, NewState};
	    {false, Msg} -> {false, Msg};
	    _ -> {false, lang:get(<<"Mạng đang bận"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"Đội ngũ đã đầy đủ"/utf8>>)}
    end.

to_robot_rival_info(RobotIds, MinLev, MaxLev,
		    TeamScore) ->
    NamePrefix =
	util:rand_list(random_name_data:arena_list(1)),
    NameMiddle =
	util:rand_list(random_name_data:arena_list(2)),
    NameSuffix =
	util:rand_list(random_name_data:arena_list(3)),
    TeamName = <<NamePrefix/binary, NameMiddle/binary,
		 NameSuffix/binary>>,
    {LeaderId, Members, DefenseT} =
	to_rival_robot_role(RobotIds, MinLev, MaxLev, 1,
			    {0, <<>>}, [], []),
    TeamPower = lists:sum([Power
			   || #arena_team_member{power = Power} <- Members]),
    Defense = to_rival_Defense(Members, DefenseT, []),
    #arena_team_rival{id = {1, <<"robot">>},
		      leader_id = LeaderId, team_name = TeamName,
		      team_power = TeamPower, team_rank = 0,
		      team_score = TeamScore, team_members = Members,
		      defense = Defense}.

to_rival_Defense([], _DefenseT, L) -> L;
to_rival_Defense([#arena_team_member{id = RoleId,
				     lev = Lev, formation_type = FormationType,
				     hallows_id = HallowsId, pos = Order,
				     ext = Ext, sprite_lev = SpriteLev,
				     sprites = Sprites,
				     break_groups = BreakGroups}
		  | Other],
		 DefenseT, L) ->
    HallowsLev = list_util:keyfind(3, Ext, 1),
    HallowsSkillLev = list_util:keyfind(4, Ext, 1),
    HallowslookId = list_util:keyfind(5, Ext, 0),
    Defense = case lists:keyfind(RoleId, 1, DefenseT) of
		{_, Teamp} -> Teamp;
		_ -> []
	      end,
    Def = #arena_team_defense{order = Order,
			      role_id = RoleId, role_lev = Lev,
			      formation_type = FormationType,
			      hallows_id = HallowsId, hallows_lev = HallowsLev,
			      hallows_skill_lev = HallowsSkillLev,
			      partner_infos = Defense,
			      hallows_look_id = HallowslookId,
			      hallows_all_look_ids = [], hallows_lucky = 0,
			      hallows_seal = 0, hallows_refine = 0,
			      sprite_lev = SpriteLev, sprites_attr = #attr{},
			      sprites = Sprites, break_groups = BreakGroups},
    to_rival_Defense(Other, DefenseT, [Def | L]).

to_rival_robot_role([], _MinLev, _MaxLev, _Pos,
		    LeaderId, L, L2) ->
    {LeaderId, L, L2};
to_rival_robot_role([RobotId | RobotIds], MinLev,
		    MaxLev, Pos, LeaderId, L, L2) ->
    NamePrefix =
	util:rand_list(random_name_data:arena_list(1)),
    NameMiddle =
	util:rand_list(random_name_data:arena_list(2)),
    NameSuffix =
	util:rand_list(random_name_data:arena_list(3)),
    Name = <<NamePrefix/binary, NameMiddle/binary,
	     NameSuffix/binary>>,
    FaceId =
	util:rand_list(arena_team_data:get_const(robot_headicon)),
    Role0 = role_data:first_init(#role{id =
					   {1, sys_env:get(server_id)},
				       type = robot}),
    Lev = util:rand(MinLev, MaxLev),
    Role = Role0#role{lev = Lev},
    {IsHide, IsLeader} = util:if_true(Pos == 1, {1, 1},
				      {0, 0}),
    {SpriteLev, Sprites} = util:if_true(Lev >=
					  sprite_data:get_const(sprite_unlocked_lv),
					{1, [{1, 0}]}, {0, []}),
    #{partners := Partners, formation := FormationType,
      hallows := {HallowsId, HallowsStep, HallowsSkill}} =
	robot:get(Role, RobotId, #{}),
    TeamPartners = [#arena_team_partner{pos = PId, id = PId,
					bid = PBId, lev = PLev, star = PStar,
					break_lev = BreakLev, power = PowerT}
		    || #partner{id = PId, bid = PBId, lev = PLev,
				star = PStar, break_lev = BreakLev,
				power = PowerT}
			   <- Partners],
    DefenseT = [#arena_term_partners_info{pos = PId,
					  id = PId, bid = PBId, lev = PLev,
					  star = PStar, break_lev = BreakLev,
					  power = PowerT, attr = Attr,
					  set_skill = SetSkills}
		|| #partner{id = PId, bid = PBId, lev = PLev,
			    star = PStar, break_lev = BreakLev, power = PowerT,
			    all_attr = Attr, set_skills = SetSkills}
		       <- Partners],
    AllPower = lists:sum([Power
			  || #partner{power = Power} <- Partners]),
    Member = #arena_team_member{id = {RobotId, <<"robot">>},
				name = Name, lev = Lev, face_id = FaceId,
				pos = Pos, is_hide = IsHide,
				team_partner = TeamPartners,
				formation_type = FormationType,
				power = AllPower, hallows_id = HallowsId,
				sprite_lev = SpriteLev, sprites = Sprites,
				ext =
				    [{1, IsLeader}, {3, HallowsStep},
				     {4, HallowsSkill}]},
    to_rival_robot_role(RobotIds, MinLev, MaxLev, Pos + 1,
			util:if_true(Pos == 1, {RobotId, <<"robot">>},
				     LeaderId),
			[Member | L],
			[{{RobotId, <<"robot">>}, DefenseT} | L2]).

to_rival_info(#c_arena_team{id = Id, rank = TeamRank,
			    score = TeamScore}) ->
    case arena_team_db:get_team_by_id(Id) of
      #arena_team{leader_id = LeaderId, team_name = TeamName,
		  team_power = TeamPower, team_members = TeamMembers} ->
	  {Defense, Members} = to_rival_role(TeamMembers, [], []),
	  #arena_team_rival{id = Id, leader_id = LeaderId,
			    team_name = TeamName, team_power = TeamPower,
			    team_rank = TeamRank, team_score = TeamScore,
			    team_members = Members, defense = Defense};
      _ -> undefined
    end.

to_rival_role([], Defense, Members) ->
    {Defense, Members};
to_rival_role([Member | TeamMembers], Defense,
	      Members) ->
    case to_rival_role(Member) of
      Def = #arena_team_defense{partner_infos =
				    PartnerInfo} ->
	  NMember = Member#arena_team_member{team_partner =
						 partner_to_team_partner(PartnerInfo,
									 [])},
	  to_rival_role(TeamMembers, [Def | Defense],
			[NMember | Members]);
      _ -> to_rival_role(TeamMembers, Defense, Members)
    end.

to_rival_role(#arena_team_member{id = TarRoleId,
				 pos = Pos}) ->
    case role_robot:get_role(TarRoleId) of
      {ok, Robot} -> to_rival_role_defense(Robot, Pos);
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team856, _,
	     {__Levelarena_team856, __Tracesarena_team856}}
		when __Levelarena_team856 band 8 /= 0 orelse
		       __Tracesarena_team856 /= [] ->
		lager:do_log(error,
			     [{module, arena_team}, {function, to_rival_role},
			      {line, 856}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Không tìm thấy dữ liệu của robot~w err=~w",
					   [TarRoleId, _Err]),
			     none, 4096, 8, __Levelarena_team856,
			     __Tracesarena_team856, lager_event,
			     __Pidarena_team856);
	    _ -> ok
	  end,
	  {false, lang:get(<<"Không thể tìm thấy đối thủ"/utf8>>)}
    end.

to_rival_role_defense(R = #role_robot{id = RoleId,
				      lev = Lev, partners = PList,
				      m_sprite_tree =
					  #m_sprite_tree{all_attr = Attr},
				      m_guild_skill =
					  #m_guild_skill{break_groups =
							     BreakGroups}},
		      Order) ->
    #formation_sys{pos_info = NewPosInfo,
		   type = FormationType, hallows_id = HallowsId} =
	formation:get_sys_formation(R, 28),
    {HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
     HallowsLookIds, HallowsLucky, HallowsSeal} =
	hallows_lib:get_hallows_info2(R, HallowsId),
    HallowRefine = hallows_lib:get_hallows_refine(R,
						  HallowsId),
    DefenseT = [to_arena_team_partner(Pos,
				      lists:keyfind(PartnerId, #partner.id,
						    PList))
		|| #formation_pos{pos = Pos, id = PartnerId}
		       <- NewPosInfo],
    {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(R,
						      28),
    #arena_team_defense{order = Order, role_id = RoleId,
			role_lev = Lev, formation_type = FormationType,
			hallows_id = HallowsId, hallows_lev = HallowsLev,
			hallows_skill_lev = HallowsSkillLev,
			partner_infos = DefenseT,
			hallows_look_id = HallowsLookId,
			hallows_all_look_ids = HallowsLookIds,
			hallows_lucky = HallowsLucky,
			hallows_seal = HallowsSeal,
			hallows_refine = HallowRefine, sprite_lev = SpriteLev,
			sprites_attr = Attr, sprites = Sprites,
			break_groups = BreakGroups}.

to_arena_team_partner(Pos,
		      P = #partner{resonate_lev = ResonateLev,
				   use_skin = SkinId, all_attr = Attr,
				   set_skills = SetSkills}) ->
    #arena_term_partners_info{pos = Pos, id = P#partner.id,
			      bid = P#partner.bid, lev = P#partner.lev,
			      star = P#partner.star,
			      break_lev = P#partner.break_lev,
			      power = P#partner.power, skin_id = SkinId,
			      attr = Attr, set_skill = SetSkills,
			      extra = [{11, ResonateLev}]}.

partner_to_team_partner([], L) -> L;
partner_to_team_partner([P =
			     #arena_term_partners_info{extra = Extra}
			 | PartnerInfo],
			L) ->
    ResonateLev = list_util:keyfind(11, Extra, 0),
    TeamPartner = #arena_team_partner{pos =
					  P#arena_term_partners_info.pos,
				      id = P#arena_term_partners_info.id,
				      bid = P#arena_term_partners_info.bid,
				      lev = P#arena_term_partners_info.lev,
				      star = P#arena_term_partners_info.star,
				      break_lev =
					  P#arena_term_partners_info.break_lev,
				      power = P#arena_term_partners_info.power,
				      skin_id =
					  P#arena_term_partners_info.skin_id,
				      ext = [{11, ResonateLev}]},
    partner_to_team_partner(PartnerInfo, [TeamPartner | L]).

calc_pos(TemMembers, MaxNum) ->
    PosList = [Pos
	       || #arena_team_member{pos = Pos} <- TemMembers],
    AllList = lists:seq(1, MaxNum),
    case AllList -- PosList of
      [PosT | _] -> PosT;
      _ -> 0
    end.

to_arean_team(Team = #arena_team{team_members =
				     Members}) ->
    #c_arena_team{id = Team#arena_team.id, score = 1000,
		  team_match_power = Team#arena_team.team_match_power,
		  members =
		      [Id || #arena_team_member{id = Id} <- Members]}.

role_set_pos([], _PosInfo, L) -> {ok, L};
role_set_pos([M = #arena_team_member{id = Id}
	      | Members],
	     PosInfo, L) ->
    case lists:keyfind(Id, 1, PosInfo) of
      {_, Pos, IsHide}
	  when Pos < 4 andalso
		 (IsHide == 0 orelse IsHide == 1) andalso Pos > 0 ->
	  case lists:keyfind(Pos, #arena_team_member.pos, L) of
	    #arena_team_member{} ->
		{false,
		 lang:get(<<"Nhiều đơn vị không thể được triển khai "
			    "ở cùng một vị trí"/utf8>>)};
	    _ when IsHide == 1 ->
		case lists:keyfind(IsHide, #arena_team_member.is_hide,
				   L)
		    of
		  #arena_team_member{} ->
		      {false,
		       lang:get(<<"Nhiều đơn vị không thể được đặt ở chế "
				  "độ ẩn"/utf8>>)};
		  _ ->
		      role_set_pos(Members, PosInfo,
				   [M#arena_team_member{is_hide = IsHide,
							pos = Pos}
				    | L])
		end;
	    _ ->
		role_set_pos(Members, PosInfo,
			     [M#arena_team_member{is_hide = IsHide, pos = Pos}
			      | L])
	  end;
      _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>)}
    end.


