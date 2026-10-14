-file("data/arena_team_mgr.erl", 1).

-file("src/mod/arena_team/arena_team_mgr.erl", 1).

-module(arena_team_mgr).

-lager_records([{cluster_dynamic_local_group,
		 [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
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
		  old_data, point_info]},
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
		{state, [ts, timeout, switch, period, next_rank]}]).

-behaviour(gen_fsm).

-export([m/0, info/1, cast/1, call/1, start_link/0,
	 get_info/1, cluster_get_info/1, save_log/1,
	 cluster_info/4, cluster_cast_main/3,
	 cluster_call_main/3]).

-export([gm_do_send/0, gm_do_send2/0, gm_update_quest/0,
	 gm_do_rank/0]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2, open_team/2, open_combat/2,
	 finish_award/2, combat_end/2]).

-record(state,
	{ts = 0, timeout = 0, switch = idle, period = 0,
	 next_rank = 1}).

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

-file("src/mod/arena_team/arena_team_mgr.erl", 38).

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

-file("src/mod/arena_team/arena_team_mgr.erl", 39).

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

-file("src/mod/arena_team/arena_team_mgr.erl", 40).

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

-file("src/mod/arena_team/arena_team_mgr.erl", 41).

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

-file("src/mod/arena_team/arena_team_mgr.erl", 42).

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

-file("src/mod/arena_team/arena_team_mgr.erl", 43).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/arena_team/arena_team_mgr.erl", 44).

gm_update_quest() ->
    case catch ets:tab2list(gm_send_mail) of
      L = [_ | _] ->
	  [room_feat_mgr:info({arena_team_do_feat_rank, TId,
			       Rank})
	   || {TId, Rank, _} <- L],
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_mgr49, _,
	     {__Levelarena_team_mgr49, __Tracesarena_team_mgr49}}
		when __Levelarena_team_mgr49 band 64 /= 0 orelse
		       __Tracesarena_team_mgr49 /= [] ->
		lager:do_log(info,
			     [{module, arena_team_mgr},
			      {function, gm_update_quest}, {line, 49},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("组队竞技场成就计算:~w", [length(L)]), none,
			     4096, 64, __Levelarena_team_mgr49,
			     __Tracesarena_team_mgr49, lager_event,
			     __Pidarena_team_mgr49);
	    _ -> ok
	  end,
	  ok;
      _ -> ok
    end.

gm_do_rank() ->
    Sid = sys_lib:srv_id(),
    case sys_env:get(arena_team_main_info,
		     {local, sys_lib:srv_id()})
	of
      {cluster, MainSrvId} ->
	  L = sys_env:get(arena_team_old_rank, []),
	  PushRank = [{Name, Power, Score, Rank,
		       [M#arena_team_member{team_partner = []}
			|| M = #arena_team_member{} <- Members]}
		      || {Name, Power, Score, Rank, Members} <- L,
			 Members =/= []],
	  cluster_lib:cast(MainSrvId, arena_team_mgr, info,
			   [{gm_update_arena_team_old_rank, Sid, PushRank}]);
      _ -> ok
    end.

gm_do_send() ->
    Sid = sys_lib:srv_id(),
    case sys_env:get(arena_team_main_info,
		     {local, sys_lib:srv_id()})
	of
      {cluster, MainSrvId} ->
	  L = sys_env:get(arena_team_old_rank, []),
	  PushRank = [{Rank,
		       [RoleId || #arena_team_member{id = RoleId} <- Members]}
		      || {Name, Power, Score, Rank, Members} <- L,
			 Members =/= []],
	  cluster_lib:cast(MainSrvId, arena_team_mgr, info,
			   [{gm_update_send_rank, Sid, PushRank}]);
      _ -> ok
    end.

gm_do_send2() ->
    Sid = sys_lib:srv_id(),
    case sys_env:get(arena_team_main_info,
		     {local, sys_lib:srv_id()})
	of
      {cluster, Sid} -> info(gm_do_update_zone_rank), ok;
      _ -> ok
    end.

gm_calc_rank(PushRank, []) -> PushRank;
gm_calc_rank([], RankInfo) -> RankInfo;
gm_calc_rank([{Rank, Ids} | Other], RankInfo) ->
    case lists:keyfind(Rank, 1, RankInfo) of
      {_, [_ | _]} -> gm_calc_rank(Other, RankInfo);
      _ ->
	  gm_calc_rank(Other,
		       lists:keystore(Rank, 1, RankInfo, {Rank, Ids}))
    end.

cluster_info(all, M, F, A) ->
    case sys_env:get(arena_team_main_info,
		     {local, sys_lib:srv_id()})
	of
      {cluster, _MainSrvId} ->
	  cluster_dynamic_group:group_cast(1, M, F, A);
      _ -> apply(M, F, A)
    end;
cluster_info(Srv, M, F, A) ->
    cluster_lib:cast(Srv, M, F, A), ok.

cluster_cast_main(M, F, A) ->
    case sys_env:get(arena_team_main_info,
		     {local, sys_lib:srv_id()})
	of
      {cluster, _MainSrvId} ->
	  cluster_dynamic_group:cast_main(1, M, F, A);
      _ -> apply(M, F, A)
    end.

cluster_call_main(M, F, A) ->
    case sys_env:get(arena_team_main_info,
		     {local, sys_lib:srv_id()})
	of
      {cluster, _MainSrvId} ->
	  cluster_dynamic_group:call_main(1, M, F, A);
      _ -> apply(M, F, A)
    end.

save_log({TeamId, CombatLog}) ->
    info({add_log, TeamId, CombatLog}).

cluster_get_info(TeamId) ->
    case catch cluster_call_main(arena_team_mgr, get_info,
				 [TeamId])
	of
      T = #c_arena_team{} -> T;
      _ -> #c_arena_team{}
    end.

get_info(TeamId) ->
    case catch ets:lookup(arena_team_sign, TeamId) of
      [Team = #c_arena_team{} | _] -> Team;
      _ -> #c_arena_team{}
    end.

-spec m() -> ok.

m() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr137, _,
       {__Levelarena_team_mgr137, __Tracesarena_team_mgr137}}
	  when __Levelarena_team_mgr137 band 64 /= 0 orelse
		 __Tracesarena_team_mgr137 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, m}, {line, 137},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64, __Levelarena_team_mgr137,
		       __Tracesarena_team_mgr137, lager_event,
		       __Pidarena_team_mgr137);
      _ -> ok
    end,
    gen_fsm:send_event(arena_team_mgr, timeout),
    [].

info(Info) -> arena_team_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(arena_team_mgr, Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(arena_team_mgr, Event,
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
	    {__Pidarena_team_mgr151, _,
	     {__Levelarena_team_mgr151, __Tracesarena_team_mgr151}}
		when __Levelarena_team_mgr151 band 8 /= 0 orelse
		       __Tracesarena_team_mgr151 /= [] ->
		lager:do_log(error,
			     [{module, arena_team_mgr}, {function, call},
			      {line, 151}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_team_mgr, Event, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_team_mgr151,
			     __Tracesarena_team_mgr151, lager_event,
			     __Pidarena_team_mgr151);
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
    gen_fsm:start_link({local, arena_team_mgr},
		       arena_team_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr157, _,
       {__Levelarena_team_mgr157, __Tracesarena_team_mgr157}}
	  when __Levelarena_team_mgr157 band 64 /= 0 orelse
		 __Tracesarena_team_mgr157 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, init},
			{line, 157}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64, __Levelarena_team_mgr157,
		       __Tracesarena_team_mgr157, lager_event,
		       __Pidarena_team_mgr157);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(arena_team_sign,
		   [{file, "./dets/arena_team_sign.dets"},
		    {keypos, #c_arena_team.id}, {type, set}]),
    ets:new(arena_team_sign,
	    [set, named_table, public, {keypos, #c_arena_team.id}]),
    ets:from_dets(arena_team_sign, arena_team_sign),
    dets:open_file(arena_team_count,
		   [{file, "./dets/arena_team_count.dets"}, {keypos, 1},
		    {type, set}]),
    ets:new(arena_team_count,
	    [set, named_table, public, {keypos, 1}]),
    ets:from_dets(arena_team_count, arena_team_count),
    ets:new(arena_team_rank,
	    [set, named_table, public,
	     {keypos, #c_arena_team.rank}]),
    Ms = date:unixtime(ms),
    {Period, Ts, Timeout, StateName} = case
					 sys_env:get(arena_team_state)
					   of
					 {PeriodT, Tst, Timeoutt, StateNamet} ->
					     {PeriodT, Tst, Timeoutt,
					      StateNamet};
					 _ ->
					     {0, Ms,
					      state_time(start_team_time), idle}
				       end,
    sys_env:save(arena_team_state,
		 {Period, Ts, Timeout, StateName}),
    NextRank = do_init(),
    State = #state{ts = Ts, timeout = Timeout,
		   switch = StateName, next_rank = NextRank,
		   period = Period},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr182, _,
       {__Levelarena_team_mgr182, __Tracesarena_team_mgr182}}
	  when __Levelarena_team_mgr182 band 64 /= 0 orelse
		 __Tracesarena_team_mgr182 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, init},
			{line, 182}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "启动完成", none, 4096, 64, __Levelarena_team_mgr182,
		       __Tracesarena_team_mgr182, lager_event,
		       __Pidarena_team_mgr182);
      _ -> ok
    end,
    {ok, StateName, State, max(1, Ts + Timeout - Ms)}.

state_time(Key) ->
    Week = date:day_of_the_week(),
    {Hour, Minu, Sec} = time(),
    DaySec = Hour * 3600 + Minu * 60 + Sec,
    {StatWeek, StatSec} = get_time(Week, Key),
    StatTime = next_time(Week, DaySec, StatWeek, StatSec),
    StatTime * 1000.

next_time(Week, Sec, Week, Sec1) when Sec1 > Sec ->
    Sec1 - Sec;
next_time(Week, Sec, Week1, Sec1) when Week1 > Week ->
    86400 * (Week1 - Week) + Sec1 - Sec;
next_time(Week, Sec, Week1, Sec1) ->
    next_time(Week, Sec, Week1 + 7, Sec1).

get_time(_Week, Key) ->
    {W, H, M} = arena_team_data:get_const(Key),
    {W, H * 3600 + M * 60}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok, continue(StateName, Reply, State).

handle_info(gm_load_mail, StateName, State) ->
    erlang:send_after(util:rand(3, 600000), self(),
		      gm_load_mail2),
    continue(StateName, State);
handle_info(gm_load_mail2, StateName, State) ->
    case ets:info(gm_load_mail, size) of
      undefined ->
	  ets:new(gm_load_mail,
		  [set, named_table, public, {keypos, 1}]);
      _ -> pass
    end,
    case ets:info(gm_load_mail, size) of
      0 ->
	  case
	    db:get_all("select to_rid, to_srv_id from log_mail "
		       "where ctime > ? and subject = ? ",
		       [date:unixtime() - 86400, <<"组队竞技场排行奖励"/utf8>>], 60000)
	      of
	    {ok, L} ->
		[ets:insert(gm_load_mail, {{Rid, SrvId}})
		 || [Rid, SrvId] <- L];
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_team_mgr224, _,
		   {__Levelarena_team_mgr224, __Tracesarena_team_mgr224}}
		      when __Levelarena_team_mgr224 band 8 /= 0 orelse
			     __Tracesarena_team_mgr224 /= [] ->
		      lager:do_log(error,
				   [{module, arena_team_mgr},
				    {function, handle_info}, {line, 224},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("加载数据失败:gm_load_mail", []),
				   none, 4096, 8, __Levelarena_team_mgr224,
				   __Tracesarena_team_mgr224, lager_event,
				   __Pidarena_team_mgr224);
		  _ -> ok
		end
	  end;
      _ -> pass
    end,
    continue(StateName, State);
handle_info({switch, S}, StateName, State)
    when S =:= open orelse S =:= close ->
    continue(StateName, State#state{switch = S});
handle_info(open_dets, StateName, State) ->
    dets:open_file(arena_team_count,
		   [{file, "./dets/arena_team_count.dets"}, {keypos, 1},
		    {type, set}]),
    ets:new(arena_team_count,
	    [set, named_table, public, {keypos, 1}]),
    ets:from_dets(arena_team_count, arena_team_count),
    continue(StateName, State);
handle_info(stop_arena_team, _StateName, State) ->
    ets:delete_all_objects(arena_team_rank),
    ets:delete_all_objects(arena_team_sign),
    dets:delete_all_objects(arena_team_sign),
    arena_team_lobby_mgr:info(close_all_team),
    sys_env:save(arena_team_old_rank, []),
    ets:delete_all_objects(arena_team_count),
    dets:delete_all_objects(arena_team_count),
    Fun = fun ({{_, Sid}, Logs}, Acc) ->
		  [[cluster_lib:cast(Sid, combat_replay_mgr,
				     dec_replay_reference, [Temp])
		    || {_, #arena_team_replay_info{id = Temp}}
			   <- ReplayListT]
		   || #arena_team_log{replay_list = ReplayListT} <- Logs],
		  Acc
	  end,
    ets:foldl(Fun, [], arena_team_log),
    ets:delete_all_objects(arena_team_log),
    dets:delete_all_objects(arena_team_log),
    ets:delete_all_objects(arena_role_team),
    Timeout = state_time(start_team_time),
    Ts = date:unixtime(ms),
    NewPeriod = 100,
    sys_env:save(arena_team_state,
		 {NewPeriod, Ts, Timeout, idle}),
    role_group:apply(world,
		     {arena_team_member, apply_handle,
		      [{change_state, idle, NewPeriod}]}),
    continue(idle,
	     State#state{ts = Ts, timeout = Timeout, next_rank = 1,
			 period = NewPeriod});
handle_info({gm_update_arena_team_old_rank, Sid,
	     PushRank},
	    StateName, State) ->
    L = sys_env:get(arena_team_old_rank, []),
    sys_env:set(arena_team_old_rank3, []),
    Fun = fun ({Name, Power, Score, Rank, Members}, Acc) ->
		  case Members == [] of
		    true ->
			case lists:keyfind(Rank, 4, PushRank) of
			  {NameT, PowerT, ScoreT, RankT, MembersT} ->
			      [{NameT, PowerT, ScoreT, RankT, MembersT} | Acc];
			  _ -> [{Name, Power, Score, Rank, Members} | Acc]
			end;
		    _ -> [{Name, Power, Score, Rank, Members} | Acc]
		  end
	  end,
    NewRank = lists:foldl(Fun, [], L),
    Srvs = util:get(arena_team_gm_srv_ids, []),
    put(arena_team_gm_srv_ids,
	[Sid | lists:delete(Sid, Srvs)]),
    sys_env:save(arena_team_old_rank, NewRank),
    continue(StateName, State);
handle_info(gm_update_arena_team_old_rank, StateName,
	    State) ->
    L = sys_env:get(arena_team_old_rank, []),
    Srvs = util:get(arena_team_gm_srv_ids, []),
    [cluster_lib:cast(Sid, arena_team_mgr, info,
		      [{gm_update_arena_team_old_rank, L}])
     || Sid <- Srvs],
    continue(StateName, State);
handle_info({gm_update_arena_team_old_rank, PushRank},
	    StateName, State) ->
    L = sys_env:get(arena_team_old_rank, []),
    sys_env:set(arena_team_old_rank2, L),
    sys_env:save(arena_team_old_rank, PushRank),
    continue(StateName, State);
handle_info({gm_update_send_rank, Sid, PushRank},
	    StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr318, _,
       {__Levelarena_team_mgr318, __Tracesarena_team_mgr318}}
	  when __Levelarena_team_mgr318 band 64 /= 0 orelse
		 __Tracesarena_team_mgr318 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, handle_info},
			{line, 318}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("游戏服上报了自身排名:~w", [{Sid, PushRank}]), none,
		       4096, 64, __Levelarena_team_mgr318,
		       __Tracesarena_team_mgr318, lager_event,
		       __Pidarena_team_mgr318);
      _ -> ok
    end,
    Srvs = util:get(arena_team_gm_srv_ids, []),
    put(arena_team_gm_srv_ids,
	[Sid | lists:delete(Sid, Srvs)]),
    RankInfo = util:get(arena_team_gm_rank_info, []),
    NewRank = gm_calc_rank(PushRank, RankInfo),
    put(arena_team_gm_rank_info, NewRank),
    continue(StateName, State);
handle_info(gm_do_update_zone_rank, StateName, State) ->
    Srvs = util:get(arena_team_gm_srv_ids, []),
    [erlang:send_after(util:rand(3, 600000), self(),
		       {gm_do_update_zone_rank, Sid})
     || Sid <- Srvs],
    continue(StateName, State);
handle_info({gm_do_update_zone_rank, Sid}, StateName,
	    State) ->
    RankInfo = util:get(arena_team_gm_rank_info, []),
    cluster_lib:cast(Sid, arena_team_mgr, info,
		     [{gm_update_zone_rank, RankInfo}]),
    continue(StateName, State);
handle_info({gm_update_zone_rank, PushRank}, StateName,
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr338, _,
       {__Levelarena_team_mgr338, __Tracesarena_team_mgr338}}
	  when __Levelarena_team_mgr338 band 64 /= 0 orelse
		 __Tracesarena_team_mgr338 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, handle_info},
			{line, 338}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("游戏服同步了主服排名:~w", [PushRank]), none, 4096,
		       64, __Levelarena_team_mgr338, __Tracesarena_team_mgr338,
		       lager_event, __Pidarena_team_mgr338);
      _ -> ok
    end,
    Ret = sys_env:get(gm_arena_team_10_28_rank_mail),
    case Ret of
      undefined ->
	  sys_env:save(gm_update_zone_rank2, PushRank),
	  SrvRankList = [{Rank,
			  [Id || Id <- RoleIds, sys_lib:is_local(Id)]}
			 || {Rank, RoleIds} <- PushRank],
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_mgr352, _,
	     {__Levelarena_team_mgr352, __Tracesarena_team_mgr352}}
		when __Levelarena_team_mgr352 band 64 /= 0 orelse
		       __Tracesarena_team_mgr352 /= [] ->
		lager:do_log(info,
			     [{module, arena_team_mgr}, {function, handle_info},
			      {line, 352}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("本服玩家排名数据:~w", [SrvRankList]), none,
			     4096, 64, __Levelarena_team_mgr352,
			     __Tracesarena_team_mgr352, lager_event,
			     __Pidarena_team_mgr352);
	    _ -> ok
	  end,
	  case
	    db:get_all("select to_rid, to_srv_id from log_mail "
		       "where ctime > ? and subject = ? and "
		       "gold <> 100",
		       [date:unixtime() - 86400, <<"组队竞技场排行奖励"/utf8>>], 60000)
	      of
	    {ok, L} ->
		DoList = [{Rid, Sid} || [Rid, Sid] <- L],
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_team_mgr356, _,
		   {__Levelarena_team_mgr356, __Tracesarena_team_mgr356}}
		      when __Levelarena_team_mgr356 band 64 /= 0 orelse
			     __Tracesarena_team_mgr356 /= [] ->
		      lager:do_log(info,
				   [{module, arena_team_mgr},
				    {function, handle_info}, {line, 356},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("本服发玩家奖励3", []), none, 4096,
				   64, __Levelarena_team_mgr356,
				   __Tracesarena_team_mgr356, lager_event,
				   __Pidarena_team_mgr356);
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
		  {__Pidarena_team_mgr357, _,
		   {__Levelarena_team_mgr357, __Tracesarena_team_mgr357}}
		      when __Levelarena_team_mgr357 band 64 /= 0 orelse
			     __Tracesarena_team_mgr357 /= [] ->
		      lager:do_log(info,
				   [{module, arena_team_mgr},
				    {function, handle_info}, {line, 357},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("本服玩家已发玩家3:~w", [DoList]),
				   none, 4096, 64, __Levelarena_team_mgr357,
				   __Tracesarena_team_mgr357, lager_event,
				   __Pidarena_team_mgr357);
		  _ -> ok
		end,
		case ets:info(gm_send_mail, size) of
		  undefined ->
		      ets:new(gm_send_mail,
			      [set, named_table, public, {keypos, 1}]);
		  _ -> pass
		end,
		gm_do_award(SrvRankList, DoList),
		sys_env:save(gm_arena_team_rank_mail, true),
		sys_env:save(gm_arena_team_10_28_rank_mail, true),
		continue(StateName, State);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_team_mgr368, _,
		   {__Levelarena_team_mgr368, __Tracesarena_team_mgr368}}
		      when __Levelarena_team_mgr368 band 64 /= 0 orelse
			     __Tracesarena_team_mgr368 /= [] ->
		      lager:do_log(info,
				   [{module, arena_team_mgr},
				    {function, handle_info}, {line, 368},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("组队竞技场补发失败3:~w",
						 [sys_lib:srv_id()]),
				   none, 4096, 64, __Levelarena_team_mgr368,
				   __Tracesarena_team_mgr368, lager_event,
				   __Pidarena_team_mgr368);
		  _ -> ok
		end,
		sys_env:save(gm_update_zone_rank_do2, false),
		continue(StateName, State)
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
	    {__Pidarena_team_mgr373, _,
	     {__Levelarena_team_mgr373, __Tracesarena_team_mgr373}}
		when __Levelarena_team_mgr373 band 64 /= 0 orelse
		       __Tracesarena_team_mgr373 /= [] ->
		lager:do_log(info,
			     [{module, arena_team_mgr}, {function, handle_info},
			      {line, 373}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("组队竞技场已补发过，不再重复补发:~w",
					   [sys_lib:srv_id()]),
			     none, 4096, 64, __Levelarena_team_mgr373,
			     __Tracesarena_team_mgr373, lager_event,
			     __Pidarena_team_mgr373);
	    _ -> ok
	  end,
	  continue(StateName, State)
    end;
handle_info({team_sign, CAreanTeam}, StateName,
	    State) ->
    arena_team_db:update_ets(arena_team_sign, CAreanTeam),
    continue(StateName, State);
handle_info({team_no_sign, TeamId}, StateName, State) ->
    arena_team_db:update_ets(arena_team_sign, TeamId, del),
    continue(StateName, State);
handle_info({team_no_sign, TeamId, ConnPid}, StateName,
	    State) ->
    arena_team_db:update_ets(arena_team_sign, TeamId, del),
    sys_conn:pack_send(ConnPid, 27241,
		       {1, lang:get(<<"Đã hủy đăng ký"/utf8>>)}),
    continue(StateName, State);
handle_info({match, TeamId, TeamPid}, StateName,
	    State) ->
    case get_info(TeamId) of
      #c_arena_team{score = Score, team_match_power = Power,
		    ext = Ext} ->
	  IsLoss = list_util:keyfind(1, Ext, 1),
	  case match(TeamId, IsLoss, Score, Power) of
	    MatchInfo = [_ | _] -> TeamPid ! {match, MatchInfo};
	    _ ->
		Flag = util:if_true(Score >
				      arena_team_data:get_const(guard_score),
				    0, 1),
		{RobotIds, MinLev, MaxLev} = match_robot(Flag),
		TeamPid !
		  {match_robot, {RobotIds, MinLev, MaxLev, Score, Flag}}
	  end;
      _ -> []
    end,
    continue(StateName, State);
handle_info(do_award, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr411, _,
       {__Levelarena_team_mgr411, __Tracesarena_team_mgr411}}
	  when __Levelarena_team_mgr411 band 64 /= 0 orelse
		 __Tracesarena_team_mgr411 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, handle_info},
			{line, 411}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始处理排行奖励发放", []), none, 4096, 64,
		       __Levelarena_team_mgr411, __Tracesarena_team_mgr411,
		       lager_event, __Pidarena_team_mgr411);
      _ -> ok
    end,
    do_award(),
    continue(StateName, State);
handle_info(close_all_team, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr418, _,
       {__Levelarena_team_mgr418, __Tracesarena_team_mgr418}}
	  when __Levelarena_team_mgr418 band 64 /= 0 orelse
		 __Tracesarena_team_mgr418 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, handle_info},
			{line, 418}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始关闭所有的队伍", []), none, 4096, 64,
		       __Levelarena_team_mgr418, __Tracesarena_team_mgr418,
		       lager_event, __Pidarena_team_mgr418);
      _ -> ok
    end,
    arena_team_lobby_mgr:info(close_all_team),
    continue(StateName, State);
handle_info({notice_msg, open_team},
	    StateName = open_team, State) ->
    NoticeMsg =
	color:msg(lang:get(<<"Đội hình hiện đã được mở tại Đấu trường "
			     "Đội và cuộc thi sẽ chính thức bắt đầu "
			     "vào lúc 0:00 Thứ Bảy. Hãy tham gia.~"/utf8>>),
		  [{href,
		    {67, green, [], lang:get(<<"【Bấm để đi】"/utf8>>)}}]),
    notice:broadcast(rumor_left_top, NoticeMsg),
    util:set_timer(notice_msg, 60 * 60,
		   {notice_msg, open_combat, NoticeMsg}),
    continue(StateName, State);
handle_info({notice_msg, open_combat},
	    StateName = open_combat, State) ->
    NoticeMsg =
	color:msg(lang:get(<<"Đội hình hiện đã được mở tại Đấu trường "
			     "Đội và cuộc thi sẽ chính thức bắt đầu "
			     "vào lúc 0:00 Thứ Bảy. Hãy tham gia.~"/utf8>>),
		  [{href,
		    {67, green, [], lang:get(<<"【Bấm để đi】"/utf8>>)}}]),
    notice:broadcast(rumor_left_top, NoticeMsg),
    util:set_timer(notice_msg, 60 * 120,
		   {notice_msg, open_combat, NoticeMsg}),
    continue(StateName, State);
handle_info({add_log, TeamId,
	     CombatLog = #arena_team_log{atk_id = Id = {_, Sid},
					 replay_list = ReplayList}},
	    StateName, State = #state{}) ->
    Logs = arena_team_db:get_team_log(TeamId),
    LogId = case Logs of
	      [#arena_team_log{id = LogId1} | _] when LogId1 < 30 ->
		  LogId1 + 1;
	      _ -> 1
	    end,
    NewLogData = CombatLog#arena_team_log{id = LogId},
    case TeamId == Id of
      true -> skip;
      _ ->
	  [cluster_lib:cast(Sid, combat_replay_mgr,
			    acc_replay_reference, [Temp])
	   || {_, #arena_team_replay_info{id = Temp}}
		  <- ReplayList]
    end,
    {NewLogs, DelLogs} = list_util:split(20,
					 [NewLogData | Logs]),
    [[cluster_lib:cast(Sid, combat_replay_mgr,
		       dec_replay_reference, [Temp])
      || {_, #arena_team_replay_info{id = Temp}}
	     <- ReplayListT]
     || #arena_team_log{replay_list = ReplayListT}
	    <- DelLogs],
    ets:insert(arena_team_log, {TeamId, NewLogs}),
    dets:insert(arena_team_log, {TeamId, NewLogs}),
    continue(StateName, State);
handle_info({combat_over, RolePid,
	     Arges = #arena_team_arge{result = Result,
				      a_team_id = ATeamId,
				      b_team_id = BTeamId = {_, BSid},
				      b_score = OldBScore},
	     AtkPos, APos},
	    StateName, State) ->
    ATeam = #c_arena_team{rank = ARank, score = AScore,
			  ext = AExt} =
		get_info(ATeamId),
    NewAExt = lists:keystore(1, 1, AExt,
			     {1, util:if_true(Result == 1, 0, 1)}),
    BTeam = #c_arena_team{rank = BRank, score = BScoreT} =
		get_info(BTeamId),
    BScore = util:if_true(BSid == <<"robot">>, OldBScore,
			  BScoreT),
    {_, NewState} = calc_score(State,
			       ATeam#c_arena_team{ext = NewAExt}, BTeam, Result,
			       AScore, BScore),
    #c_arena_team{rank = ANewRank, score = ANewScore} =
	get_info(ATeamId),
    #c_arena_team{rank = BNewRank, score = BNewScoreT} =
	get_info(BTeamId),
    BNewScore = util:if_true(BSid == <<"robot">>, OldBScore,
			     BNewScoreT),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr465, _,
       {__Levelarena_team_mgr465, __Tracesarena_team_mgr465}}
	  when __Levelarena_team_mgr465 band 128 /= 0 orelse
		 __Tracesarena_team_mgr465 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_mgr}, {function, handle_info},
			{line, 465}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("组队竞技场积分计算:~w",
				     [{Result, ARank, AScore, ANewRank,
				       ANewScore, BRank, BScore, BNewRank,
				       BNewScore}]),
		       none, 4096, 128, __Levelarena_team_mgr465,
		       __Tracesarena_team_mgr465, lager_event,
		       __Pidarena_team_mgr465);
      _ -> ok
    end,
    NewArges = Arges#arena_team_arge{a_rank = ARank,
				     a_new_rank = ANewRank, a_score = AScore,
				     a_new_score = ANewScore, b_rank = BRank,
				     b_new_rank = BNewRank, b_score = BScore,
				     b_new_score = BNewScore},
    role:apply(async, RolePid,
	       {arena_team_action, combat_over,
		[NewArges, AtkPos, APos]}),
    continue(StateName, NewState);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr485, _,
       {__Levelarena_team_mgr485, __Tracesarena_team_mgr485}}
	  when __Levelarena_team_mgr485 band 64 /= 0 orelse
		 __Tracesarena_team_mgr485 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, terminate},
			{line, 485}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64, __Levelarena_team_mgr485,
		       __Tracesarena_team_mgr485, lager_event,
		       __Pidarena_team_mgr485);
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
      {__Pidarena_team_mgr486, _,
       {__Levelarena_team_mgr486, __Tracesarena_team_mgr486}}
	  when __Levelarena_team_mgr486 band 64 /= 0 orelse
		 __Tracesarena_team_mgr486 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, terminate},
			{line, 486}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelarena_team_mgr486,
		       __Tracesarena_team_mgr486, lager_event,
		       __Pidarena_team_mgr486);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    Ms = date:unixtime(ms),
    {next_state, StateName, State,
     max(1, Ts + Timeout - Ms)}.

continue(StateName, Reply,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    Ms = date:unixtime(ms),
    {reply, Reply, StateName, State,
     max(1, Ts + Timeout - Ms)}.

idle(timeout, State = #state{period = Period}) ->
    Timeout = state_time(start_match_time),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr508, _,
       {__Levelarena_team_mgr508, __Tracesarena_team_mgr508}}
	  when __Levelarena_team_mgr508 band 64 /= 0 orelse
		 __Tracesarena_team_mgr508 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, idle},
			{line, 508}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("组队竞技场开始进入组队阶段, 当前赛季周期:~w", [Period]),
		       none, 4096, 64, __Levelarena_team_mgr508,
		       __Tracesarena_team_mgr508, lager_event,
		       __Pidarena_team_mgr508);
      _ -> ok
    end,
    ets:delete_all_objects(arena_team_rank),
    ets:delete_all_objects(arena_team_sign),
    dets:delete_all_objects(arena_team_sign),
    arena_team_lobby_mgr:info(close_all_team),
    Ts = date:unixtime(ms),
    NewPeriod = Period + 1,
    sys_env:save(arena_team_state,
		 {NewPeriod, Ts, Timeout, open_team}),
    role_group:apply(world,
		     {arena_team_member, apply_handle,
		      [{change_state, open_team, NewPeriod}]}),
    NoticeMsg =
	color:msg(lang:get(<<"Đội hình hiện đã được mở tại Đấu trường "
			     "Đội và cuộc thi sẽ chính thức bắt đầu "
			     "vào lúc 0:00 Thứ Bảy. Hãy tham gia.~ts"/utf8>>),
		  [{href,
		    {67, green, [], lang:get(<<"【Bấm để đi】"/utf8>>)}}]),
    notice:broadcast(rumor_left_top, NoticeMsg),
    util:set_timer(notice_msg, 60 * 60,
		   {notice_msg, open_team, NoticeMsg}),
    mail:global_send(#gmail{id = {arena_team, NewPeriod},
			    end_time = date:unixtime() + 86400 * 2,
			    subject =
				lang:get(<<"Đấu trường đồng đội đã được mở"/utf8>>),
			    content =
				lang:get(<<"Mùa giải Team Arena mới đã bắt đầu. "
					   "Trước 23h Chủ nhật, bạn có thể thành "
					   "lập đội để thi đấu. Hãy kêu gọi bạn "
					   "bè của mình thành lập đội quân mạnh "
					   "nhất,Cạnh tranh để giành thứ hạng vinh "
					   "quang của riêng bạn để nhận được phần "
					   "thưởng hào phóng~"/utf8>>),
			    conds =
				[{minlev,
				  arena_team_data:get_const(open_lev)}]}),
    case cluster_dynamic_group:get_group(1) of
      {true, #cluster_dynamic_local_group{main = MainSrvId}}
	  when MainSrvId =/= undefined ->
	  sys_env:save(arena_team_main_info,
		       {cluster, MainSrvId});
      _ ->
	  sys_env:save(arena_team_main_info,
		       {local, sys_lib:srv_id()})
    end,
    self() ! {notify_state, NoticeMsg},
    continue(open_team,
	     State#state{ts = Ts, timeout = Timeout,
			 period = NewPeriod, next_rank = 1});
idle(_Any, State) -> continue(idle, State).

open_team(timeout, State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr543, _,
       {__Levelarena_team_mgr543, __Tracesarena_team_mgr543}}
	  when __Levelarena_team_mgr543 band 64 /= 0 orelse
		 __Tracesarena_team_mgr543 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, open_team},
			{line, 543}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("组队竞技场开始进入战斗阶段, 当前赛季周期:~w", [Period]),
		       none, 4096, 64, __Levelarena_team_mgr543,
		       __Tracesarena_team_mgr543, lager_event,
		       __Pidarena_team_mgr543);
      _ -> ok
    end,
    Timeout = state_time(end_time),
    Ts = date:unixtime(ms),
    sys_env:save(arena_team_state,
		 {Period, Ts, Timeout, open_combat}),
    role_group:apply(world,
		     {arena_team_member, apply_handle,
		      [{change_state, open_combat}]}),
    NoticeMsg =
	color:msg(lang:get(<<"Đấu trường đồng đội đang diễn ra sôi "
			     "nổi. Hãy gọi cho bạn bè của bạn và hợp "
			     "lực để quét sạch hàng ngàn đội quân.,~ts"/utf8>>),
		  [{href,
		    {67, green, [], lang:get(<<"【Bấm để đi】"/utf8>>)}}]),
    notice:broadcast(rumor_left_top, NoticeMsg),
    util:set_timer(notice_msg, 60 * 120,
		   {notice_msg, open_combat, NoticeMsg}),
    arena_team_lobby_mgr:info(start_count_time),
    continue(open_combat,
	     State#state{ts = Ts, timeout = Timeout});
open_team(_Any, State) -> continue(open_team, State).

open_combat(timeout, State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr564, _,
       {__Levelarena_team_mgr564, __Tracesarena_team_mgr564}}
	  when __Levelarena_team_mgr564 band 64 /= 0 orelse
		 __Tracesarena_team_mgr564 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, open_combat},
			{line, 564}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("组队竞技场战斗结束，开始进入结算阶段, 当前赛季周期:~w",
				     [Period]),
		       none, 4096, 64, __Levelarena_team_mgr564,
		       __Tracesarena_team_mgr564, lager_event,
		       __Pidarena_team_mgr564);
      _ -> ok
    end,
    Timeout = state_time(end_settlement_time),
    Ts = date:unixtime(ms),
    sys_env:save(arena_team_state,
		 {Period, Ts, Timeout, finish_award}),
    role_group:apply(world,
		     {arena_team_member, apply_handle,
		      [{change_state, finish_award}]}),
    arena_team_lobby_mgr:info(del_count_time),
    continue(finish_award,
	     State#state{ts = Ts, timeout = Timeout});
open_combat(_Any, State) ->
    continue(open_combat, State).

finish_award(timeout,
	     State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr581, _,
       {__Levelarena_team_mgr581, __Tracesarena_team_mgr581}}
	  when __Levelarena_team_mgr581 band 64 /= 0 orelse
		 __Tracesarena_team_mgr581 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, finish_award},
			{line, 581}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("组队竞技场结算结束，开始进入空闲阶段, 当前赛季周期:~w",
				     [Period]),
		       none, 4096, 64, __Levelarena_team_mgr581,
		       __Tracesarena_team_mgr581, lager_event,
		       __Pidarena_team_mgr581);
      _ -> ok
    end,
    Timeout = state_time(start_team_time),
    Ts = date:unixtime(ms),
    NewPeriod = Period,
    sys_env:save(arena_team_state,
		 {NewPeriod, Ts, Timeout, combat_end}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr593, _,
       {__Levelarena_team_mgr593, __Tracesarena_team_mgr593}}
	  when __Levelarena_team_mgr593 band 64 /= 0 orelse
		 __Tracesarena_team_mgr593 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, finish_award},
			{line, 593}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始处理排行奖励发放", []), none, 4096, 64,
		       __Levelarena_team_mgr593, __Tracesarena_team_mgr593,
		       lager_event, __Pidarena_team_mgr593);
      _ -> ok
    end,
    do_award(),
    RankList =
	arena_team_mgr:cluster_call_main(arena_team_db,
					 list_rank, [1, 100]),
    L = arena_team_lib:to_cli_rank(RankList, []),
    sys_env:save(arena_team_old_rank, L),
    erlang:send_after(300000, self(), close_all_team),
    role_group:apply(world,
		     {arena_team_member, apply_handle,
		      [{change_state, combat_end, NewPeriod}]}),
    continue(combat_end,
	     State#state{ts = Ts, timeout = Timeout, next_rank = 1,
			 period = NewPeriod});
finish_award(_Any, State) ->
    continue(finish_award, State).

combat_end(timeout, State = #state{period = Period}) ->
    Timeout = state_time(start_match_time),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr615, _,
       {__Levelarena_team_mgr615, __Tracesarena_team_mgr615}}
	  when __Levelarena_team_mgr615 band 64 /= 0 orelse
		 __Tracesarena_team_mgr615 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, combat_end},
			{line, 615}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("组队竞技场开始进入组队阶段, 当前赛季周期:~w", [Period]),
		       none, 4096, 64, __Levelarena_team_mgr615,
		       __Tracesarena_team_mgr615, lager_event,
		       __Pidarena_team_mgr615);
      _ -> ok
    end,
    sys_env:save(arena_team_old_rank, []),
    ets:delete_all_objects(arena_team_rank),
    ets:delete_all_objects(arena_team_sign),
    dets:delete_all_objects(arena_team_sign),
    ets:delete_all_objects(arena_team_count),
    dets:delete_all_objects(arena_team_count),
    Fun = fun ({{_, Sid}, Logs}, Acc) ->
		  [[cluster_lib:cast(Sid, combat_replay_mgr,
				     dec_replay_reference, [Temp])
		    || {_, #arena_team_replay_info{id = Temp}}
			   <- ReplayListT]
		   || #arena_team_log{replay_list = ReplayListT} <- Logs],
		  Acc
	  end,
    ets:foldl(Fun, [], arena_team_log),
    ets:delete_all_objects(arena_team_log),
    dets:delete_all_objects(arena_team_log),
    ets:delete_all_objects(arena_role_team),
    Ts = date:unixtime(ms),
    NewPeriod = Period + 1,
    sys_env:save(arena_team_state,
		 {NewPeriod, Ts, Timeout, open_team}),
    role_group:apply(world,
		     {arena_team_member, apply_handle,
		      [{change_state, open_team, NewPeriod}]}),
    case cluster_dynamic_group:get_group(1) of
      {true, #cluster_dynamic_local_group{main = MainSrvId}}
	  when MainSrvId =/= undefined ->
	  sys_env:save(arena_team_main_info,
		       {cluster, MainSrvId});
      _ ->
	  sys_env:save(arena_team_main_info,
		       {local, sys_lib:srv_id()})
    end,
    NoticeMsg =
	color:msg(lang:get(<<"Đội hình hiện đã được mở tại Đấu trường "
			     "Đội và cuộc thi sẽ chính thức bắt đầu "
			     "vào lúc 0:00 Thứ Bảy. Hãy tham gia.~ts"/utf8>>),
		  [{href,
		    {67, green, [], lang:get(<<"【Bấm để đi】"/utf8>>)}}]),
    notice:broadcast(rumor_left_top, NoticeMsg),
    util:set_timer(notice_msg, 60 * 60,
		   {notice_msg, open_team, NoticeMsg}),
    mail:global_send(#gmail{id = {arena_team, NewPeriod},
			    end_time = date:unixtime() + 86400 * 2,
			    subject =
				lang:get(<<"Đấu trường đồng đội đã được mở"/utf8>>),
			    content =
				lang:get(<<"Mùa giải Team Arena mới đã bắt đầu. "
					   "Trước 23h Chủ nhật, bạn có thể thành "
					   "lập đội để thi đấu. Hãy kêu gọi bạn "
					   "bè của mình thành lập đội quân mạnh "
					   "nhất，Cạnh tranh để giành thứ hạng vinh "
					   "quang của riêng bạn để nhận được phần "
					   "thưởng hào phóng~"/utf8>>),
			    conds =
				[{minlev,
				  arena_team_data:get_const(open_lev)}]}),
    continue(open_team,
	     State#state{ts = Ts, timeout = Timeout, next_rank = 1,
			 period = NewPeriod});
combat_end(_Any, State) -> continue(combat_end, State).

match_robot(Flag) ->
    RobotIds = arena_team_data:get_robot_list(Flag),
    {RobotIds2, MinLev, MaxLev} = list_util:rand(RobotIds),
    {RobotIds2, MinLev, MaxLev}.

match(TeamId, IsLoss, Score, Power) ->
    Flag = util:if_true(Score >
			  arena_team_data:get_const(guard_score),
			0, 1),
    Flag2 = util:if_true(Flag == 1 andalso IsLoss == 1, 1,
			 0),
    MatchList = arena_team_data:get_match_info({Flag,
						Flag2}),
    do_match(MatchList, Score, Power, TeamId, []).

do_match([], _Score, _Power, _TeamId, L) -> L;
do_match([{_Pos, [], _PowerInfo} | MatchList], Score,
	 Power, TeamId, L) ->
    do_match(MatchList, Score, Power, TeamId, L);
do_match([{Pos,
	   [{MinScorePer, MaxScorePer} | ScoreInfo], PowerInfo}
	  | MatchList],
	 Score, Power, TeamId, L) ->
    MinScore = trunc(Score * MinScorePer / 1000),
    MaxScore = trunc(Score * MaxScorePer / 1000),
    case do_match2(Pos, MinScore, MaxScore, Power, TeamId,
		   PowerInfo, L)
	of
      {ok, Team} ->
	  do_match(MatchList, Score, Power, TeamId, [Team | L]);
      _ ->
	  do_match([{Pos, ScoreInfo, PowerInfo} | MatchList],
		   Score, Power, TeamId, L)
    end.

do_match2(_Pos, _MinScore, _MaxScore, _Power, _TeamId,
	  [], _L) ->
    false;
do_match2(Pos, MinScore, MaxScore, Power, TeamId,
	  [{MinPowrPer, MaxPowerPer} | PowerInfo], L) ->
    MinPowr = trunc(Power * MinPowrPer / 1000),
    MaxPowr = trunc(Power * MaxPowerPer / 1000),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr701, _,
       {__Levelarena_team_mgr701, __Tracesarena_team_mgr701}}
	  when __Levelarena_team_mgr701 band 128 /= 0 orelse
		 __Tracesarena_team_mgr701 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_mgr}, {function, do_match2},
			{line, 701}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("匹配:~w",
				     [{MinScore, MaxScore, MinPowr, MaxPowr,
				       Power}]),
		       none, 4096, 128, __Levelarena_team_mgr701,
		       __Tracesarena_team_mgr701, lager_event,
		       __Pidarena_team_mgr701);
      _ -> ok
    end,
    {TeamId1, TeamId2} = case L of
			   [#c_arena_team{id = DId}] -> {DId, {0, <<>>}};
			   [#c_arena_team{id = DId1}, #c_arena_team{id = DId2}
			    | _] ->
			       {DId1, DId2};
			   _ -> {{0, <<>>}, {0, <<>>}}
			 end,
    Fun1 = [{{c_arena_team, '_', '$1', '_', '$2', '$3', '_',
	      '_', '_'},
	     [{'andalso', {'=/=', '$1', {const, TeamId}},
	       {'andalso', {'>=', '$2', {const, MinScore}},
		{'andalso', {'<', '$2', {const, MaxScore}},
		 {'andalso', {'>=', '$3', {const, MinPowr}},
		  {'andalso', {'<', '$3', {const, MaxPowr}},
		   {'andalso', {'=/=', '$1', {const, TeamId1}},
		    {'=/=', '$1', {const, TeamId2}}}}}}}}],
	     ['$_']}],
    case ets:select(arena_team_sign, Fun1, 3) of
      {Teams = [_ | _], _} ->
	  Team = list_util:rand(Teams), {ok, Team};
      _ ->
	  do_match2(Pos, MinScore, MaxScore, Power, TeamId,
		    PowerInfo, L)
    end.

calc_score(State, ATeam,
	   BTeam = #c_arena_team{id = BTeamId}, 1, AScore,
	   BScore) ->
    AddScore = calc_add_score(AScore, BScore),
    DelScore = calc_del_score(AScore, BScore),
    NewAScore = max(1000, AScore + AddScore),
    NewBScore = max(1000, BScore - DelScore),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr733, _,
       {__Levelarena_team_mgr733, __Tracesarena_team_mgr733}}
	  when __Levelarena_team_mgr733 band 128 /= 0 orelse
		 __Tracesarena_team_mgr733 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_mgr}, {function, calc_score},
			{line, 733}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("==积分计算:~w",
				     [{AScore, BScore, AddScore, DelScore}]),
		       none, 4096, 128, __Levelarena_team_mgr733,
		       __Tracesarena_team_mgr733, lager_event,
		       __Pidarena_team_mgr733);
      _ -> ok
    end,
    {_, NewState} = update_rank(ATeam#c_arena_team{score =
						       NewAScore,
						   score_time =
						       date:unixtime()},
				AddScore, State),
    NBTeam = get_info(BTeamId),
    update_rank(NBTeam#c_arena_team{score = NewBScore},
		-DelScore, NewState);
calc_score(State, ATeam, _BTeam, _, AScore, BScore) ->
    DelScore = calc_del_score(BScore, AScore),
    NewAScore = max(1000, AScore - DelScore),
    update_rank(ATeam#c_arena_team{score = NewAScore,
				   score_time = date:unixtime()},
		-DelScore, State).

calc_add_score(AScore, BScore) ->
    Coefficient1 = arena_team_data:get_const(coefficient1),
    Coefficient2 = arena_team_data:get_const(coefficient2),
    Coefficient3 = arena_team_data:get_const(coefficient3),
    AddArg1 = arena_team_data:get_const(add_coefficient1),
    BassAdd = arena_team_data:get_const(add_score),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr749, _,
       {__Levelarena_team_mgr749, __Tracesarena_team_mgr749}}
	  when __Levelarena_team_mgr749 band 128 /= 0 orelse
		 __Tracesarena_team_mgr749 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_mgr}, {function, calc_add_score},
			{line, 749}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("==积分计算:~w",
				     [{BassAdd, math:log(Coefficient2),
				       math:log(Coefficient1 /
						  max(1,
						      BScore - AScore +
							Coefficient1
							+ 15)),
				       math:log(Coefficient2) /
					 math:log(Coefficient1 /
						    max(1,
							BScore - AScore +
							  Coefficient1
							  + 15)),
				       AddArg1,
				       1 - (AScore - 1000) / Coefficient3,
				       max(0,
					   1 -
					     (AScore - 1000) / Coefficient3)}]),
		       none, 4096, 128, __Levelarena_team_mgr749,
		       __Tracesarena_team_mgr749, lager_event,
		       __Pidarena_team_mgr749);
      _ -> ok
    end,
    case BScore - AScore == 15 of
      true -> BassAdd;
      _ ->
	  min(max(15,
		  trunc(BassAdd +
			  math:log(max(1, BScore - AScore + Coefficient1 + 15) /
				     Coefficient1)
			    / math:log(Coefficient2)
			    * AddArg1
			    * max(0, 1 - (AScore - 1000) / Coefficient3))),
	      30)
    end.

calc_del_score(AScore, BScore) -> 0.

update_rank(#c_arena_team{id = {0, <<>>}}, _ChangeScore,
	    State) ->
    {noreply, State};
update_rank(#c_arena_team{id = {_, <<"robot">>}},
	    _ChangeScore, State) ->
    {noreply, State};
update_rank(ArenaRole = #c_arena_team{id =
					  TeamId = {_, SrvId},
				      score = Score, rank = 0},
	    ChangeScore, State = #state{next_rank = NextRank}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr780, _,
       {__Levelarena_team_mgr780, __Tracesarena_team_mgr780}}
	  when __Levelarena_team_mgr780 band 128 /= 0 orelse
		 __Tracesarena_team_mgr780 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_mgr}, {function, update_rank},
			{line, 780}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("排行计算:~w", [{Score, NextRank}]), none,
		       4096, 128, __Levelarena_team_mgr780,
		       __Tracesarena_team_mgr780, lager_event,
		       __Pidarena_team_mgr780);
      _ -> ok
    end,
    case Score =< arena_team_data:get_const(init_score) of
      true ->
	  arena_team_db:update_ets(arena_team_sign, ArenaRole),
	  {noreply, State};
      false ->
	  {ok, #c_arena_team{rank = NewRank}} =
	      do_update_rank(ArenaRole#c_arena_team{rank = NextRank},
			     ChangeScore),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_mgr787, _,
	     {__Levelarena_team_mgr787, __Tracesarena_team_mgr787}}
		when __Levelarena_team_mgr787 band 128 /= 0 orelse
		       __Tracesarena_team_mgr787 /= [] ->
		lager:do_log(debug,
			     [{module, arena_team_mgr}, {function, update_rank},
			      {line, 787}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("排行计算:~w", [{NewRank, ChangeScore}]),
			     none, 4096, 128, __Levelarena_team_mgr787,
			     __Tracesarena_team_mgr787, lager_event,
			     __Pidarena_team_mgr787);
	    _ -> ok
	  end,
	  cluster_lib:cast(SrvId, arena_team, cast,
			   [by_id, TeamId, {change_rank, NewRank, Score}]),
	  {noreply, State#state{next_rank = NextRank + 1}}
    end;
update_rank(ArenaRole = #c_arena_team{id =
					  TeamId = {_, SrvId},
				      score = Score},
	    ChangeScore, State = #state{next_rank = NextRank}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr792, _,
       {__Levelarena_team_mgr792, __Tracesarena_team_mgr792}}
	  when __Levelarena_team_mgr792 band 128 /= 0 orelse
		 __Tracesarena_team_mgr792 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_mgr}, {function, update_rank},
			{line, 792}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("排行计算:~w", [{Score, NextRank}]), none,
		       4096, 128, __Levelarena_team_mgr792,
		       __Tracesarena_team_mgr792, lager_event,
		       __Pidarena_team_mgr792);
      _ -> ok
    end,
    {ok, #c_arena_team{rank = NewRank}} =
	do_update_rank(ArenaRole, ChangeScore),
    NewNextRank = util:if_true(NewRank =:= 0, NextRank - 1,
			       NextRank),
    cluster_lib:cast(SrvId, arena_team, cast,
		     [by_id, TeamId, {change_rank, NewRank, Score}]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr796, _,
       {__Levelarena_team_mgr796, __Tracesarena_team_mgr796}}
	  when __Levelarena_team_mgr796 band 128 /= 0 orelse
		 __Tracesarena_team_mgr796 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_mgr}, {function, update_rank},
			{line, 796}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("排行计算:~w", [{NewRank, ChangeScore}]),
		       none, 4096, 128, __Levelarena_team_mgr796,
		       __Tracesarena_team_mgr796, lager_event,
		       __Pidarena_team_mgr796);
      _ -> ok
    end,
    {noreply, State#state{next_rank = NewNextRank}}.

do_update_rank(ArenaRole = #c_arena_team{rank = 1},
	       ChangeScore)
    when ChangeScore >= 0 ->
    ets:insert(arena_team_rank, ArenaRole),
    arena_team_db:update_ets(arena_team_sign, ArenaRole),
    {ok, ArenaRole};
do_update_rank(ArenaRole = #c_arena_team{rank = Rank,
					 score = Score},
	       ChangeScore)
    when ChangeScore >= 0 ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr804, _,
       {__Levelarena_team_mgr804, __Tracesarena_team_mgr804}}
	  when __Levelarena_team_mgr804 band 128 /= 0 orelse
		 __Tracesarena_team_mgr804 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_mgr}, {function, do_update_rank},
			{line, 804}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("排行计算:~w", [{Rank, ChangeScore}]), none,
		       4096, 128, __Levelarena_team_mgr804,
		       __Tracesarena_team_mgr804, lager_event,
		       __Pidarena_team_mgr804);
      _ -> ok
    end,
    case ets:lookup(arena_team_rank, Rank - 1) of
      [R = #c_arena_team{score = Score2}]
	  when Score > Score2 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_mgr807, _,
	     {__Levelarena_team_mgr807, __Tracesarena_team_mgr807}}
		when __Levelarena_team_mgr807 band 128 /= 0 orelse
		       __Tracesarena_team_mgr807 /= [] ->
		lager:do_log(debug,
			     [{module, arena_team_mgr},
			      {function, do_update_rank}, {line, 807},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("排行计算:~w", [{Rank, ChangeScore}]),
			     none, 4096, 128, __Levelarena_team_mgr807,
			     __Tracesarena_team_mgr807, lager_event,
			     __Pidarena_team_mgr807);
	    _ -> ok
	  end,
	  ets:insert(arena_team_rank,
		     R#c_arena_team{rank = Rank}),
	  arena_team_db:update_ets(arena_team_sign,
				   R#c_arena_team{rank = Rank}),
	  do_update_rank(ArenaRole#c_arena_team{rank = Rank - 1},
			 ChangeScore);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_mgr812, _,
	     {__Levelarena_team_mgr812, __Tracesarena_team_mgr812}}
		when __Levelarena_team_mgr812 band 128 /= 0 orelse
		       __Tracesarena_team_mgr812 /= [] ->
		lager:do_log(debug,
			     [{module, arena_team_mgr},
			      {function, do_update_rank}, {line, 812},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("排行计算:~w", [{Rank, ChangeScore}]),
			     none, 4096, 128, __Levelarena_team_mgr812,
			     __Tracesarena_team_mgr812, lager_event,
			     __Pidarena_team_mgr812);
	    _ -> ok
	  end,
	  ets:insert(arena_team_rank, ArenaRole),
	  arena_team_db:update_ets(arena_team_sign, ArenaRole),
	  {ok, ArenaRole}
    end;
do_update_rank(ArenaRole = #c_arena_team{rank = Rank,
					 score = Score},
	       ChangeScore) ->
    case ets:lookup(arena_team_rank, Rank + 1) of
      [R = #c_arena_team{score = Score2}]
	  when Score < Score2 ->
	  ets:insert(arena_team_rank,
		     R#c_arena_team{rank = Rank}),
	  arena_team_db:update_ets(arena_team_sign,
				   R#c_arena_team{rank = Rank}),
	  do_update_rank(ArenaRole#c_arena_team{rank = Rank + 1},
			 ChangeScore);
      _ ->
	  case Score > arena_team_data:get_const(init_score) of
	    true ->
		ets:insert(arena_team_rank, ArenaRole),
		arena_team_db:update_ets(arena_team_sign, ArenaRole),
		{ok, ArenaRole};
	    false ->
		ets:delete(arena_team_rank, Rank),
		arena_team_db:update_ets(arena_team_sign,
					 ArenaRole#c_arena_team{rank = 0}),
		{ok, ArenaRole#c_arena_team{rank = 0}}
	  end
    end.

do_init() ->
    Fun = fun (R = #c_arena_team{rank = Rank}, Rank1) ->
		  case Rank > 0 of
		    true -> ets:insert(arena_team_rank, R);
		    _ -> skip
		  end,
		  max(Rank, Rank1)
	  end,
    ets:foldl(Fun, 0, arena_team_sign) + 1.

do_award() ->
    AwardRankList = lists:keysort(1,
				  arena_team_data:get_ward_ranks()),
    do_award(AwardRankList).

do_award([{StartRank, EndRank, Award}
	  | AwardRankList]) ->
    case do_award(StartRank, EndRank, Award) of
      finish -> ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_mgr856, _,
	     {__Levelarena_team_mgr856, __Tracesarena_team_mgr856}}
		when __Levelarena_team_mgr856 band 64 /= 0 orelse
		       __Tracesarena_team_mgr856 /= [] ->
		lager:do_log(info,
			     [{module, arena_team_mgr}, {function, do_award},
			      {line, 856}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("开始处理排行奖励发放~w",
					   [{StartRank, EndRank}]),
			     none, 4096, 64, __Levelarena_team_mgr856,
			     __Tracesarena_team_mgr856, lager_event,
			     __Pidarena_team_mgr856);
	    _ -> ok
	  end,
	  do_award(AwardRankList)
    end.

do_award(StartRank, EndRank, _Award)
    when StartRank > EndRank ->
    ok;
do_award(StartRank, EndRank, Award) ->
    case arena_team_db:rank_team(StartRank) of
      {ok, #c_arena_team{members = Ids}} ->
	  Title =
	      lang:get(<<"Phần thưởng xếp hạng đấu trường đội"/utf8>>),
	  {MailAssets, MailItems} =
	      format:split_assets_items(Award),
	  Content =
	      color:msg(lang:get(<<"Nhà thám hiểm thân mến, bạn đã giành "
				   "được vị trí đầu tiên trong bảng xếp "
				   "hạng giải đấu đấu trường đồng đội mùa "
				   "trước~tsNếu bạn đạt thứ hạng tốt, bạn "
				   "sẽ nhận được phần thưởng sau，Hãy tiếp "
				   "tục làm tốt công việc nhé"/utf8>>),
			[{green, StartRank}]),
	  Mail = {Title, Content, MailAssets, MailItems,
		  util:fbin(<<"组队竞技场排行奖励"/utf8>>, [])},
	  [mail:send(TId, Mail) || TId <- Ids],
	  [catch cluster_lib:cast(Sid, room_feat_mgr, info,
				  [{arena_team_do_feat_rank, TId, StartRank}])
	   || TId = {_, Sid} <- Ids],
	  [catch cluster_lib:cast(Sid, role_weekly_mgr, info,
				  [{arena_team_rank, TId, StartRank}])
	   || TId = {_, Sid} <- Ids],
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_mgr870, _,
	     {__Levelarena_team_mgr870, __Tracesarena_team_mgr870}}
		when __Levelarena_team_mgr870 band 64 /= 0 orelse
		       __Tracesarena_team_mgr870 /= [] ->
		lager:do_log(info,
			     [{module, arena_team_mgr}, {function, do_award},
			      {line, 870}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("组队竞技场发放奖励:~w", [{StartRank, Ids}]),
			     none, 4096, 64, __Levelarena_team_mgr870,
			     __Tracesarena_team_mgr870, lager_event,
			     __Pidarena_team_mgr870);
	    _ -> ok
	  end,
	  do_award(StartRank + 1, EndRank, Award);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_mgr874, _,
	     {__Levelarena_team_mgr874, __Tracesarena_team_mgr874}}
		when __Levelarena_team_mgr874 band 64 /= 0 orelse
		       __Tracesarena_team_mgr874 /= [] ->
		lager:do_log(info,
			     [{module, arena_team_mgr}, {function, do_award},
			      {line, 874}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("开始处理排行奖励发放结束~w", [StartRank]), none,
			     4096, 64, __Levelarena_team_mgr874,
			     __Tracesarena_team_mgr874, lager_event,
			     __Pidarena_team_mgr874);
	    _ -> ok
	  end,
	  finish
    end.

gm_do_award(SrvRankList, DoList) ->
    L = gm_do_award(SrvRankList, DoList, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_mgr880, _,
       {__Levelarena_team_mgr880, __Tracesarena_team_mgr880}}
	  when __Levelarena_team_mgr880 band 64 /= 0 orelse
		 __Tracesarena_team_mgr880 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_mgr}, {function, gm_do_award},
			{line, 880}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("组队竞技场已补发：~w", [L]), none, 4096, 64,
		       __Levelarena_team_mgr880, __Tracesarena_team_mgr880,
		       lager_event, __Pidarena_team_mgr880);
      _ -> ok
    end.

gm_do_award([], _DoList, L) -> L;
gm_do_award([{Rank, Ids} | Others], DoList, L) ->
    Award = arena_team_data:get_rank_award(Rank),
    Title =
	lang:get(<<"Phát hành lại phần thưởng xếp hạng đấu "
		   "trường đội"/utf8>>),
    {MailAssets, MailItems} =
	format:split_assets_items(Award),
    Content =
	color:msg(lang:get(<<"Kính gửi Nhà thám hiểm: Bạn đã đạt được "
			     "thứ hạng tốt ~ts trong bảng xếp hạng "
			     "giải đấu đấu trường đồng đội mùa trước,Xin "
			     "hãy tiếp tục công việc tốt. Sự bất thường "
			     "hiện tại trong việc phân phối phần thưởng "
			     "trong đấu trường đồng đội đã được khắc "
			     "phục và phần thưởng giải quyết thứ hạng "
			     "đã được phân phối lại cho tất cả các "
			     "nhà thám hiểm，Phần thưởng được phát "
			     "hành bất thường sẽ không được tái chế. "
			     "Cảm ơn các nhà thám hiểm đã phản hồi "
			     "nhiệt tình. Chúc các bạn chơi game vui "
			     "vẻ.。"/utf8>>),
		  [{green, Rank}]),
    Mail = {Title, Content, MailAssets, MailItems,
	    util:fbin(<<"组队竞技场排行奖励补发"/utf8>>, [])},
    Fun = fun (Id, Acc) ->
		  case lists:member(Id, DoList) of
		    true -> Acc;
		    _ ->
			case lists:member(Id, Acc) of
			  true -> Acc;
			  _ ->
			      ets:insert(gm_send_mail, {Id, Rank, Award}),
			      mail:send(Id, Mail),
			      [Id | Acc]
			end
		  end
	  end,
    NewL = lists:foldl(Fun, L, Ids),
    gm_do_award(Others, DoList, NewL).


