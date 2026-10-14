-file("src/mod/drop/drop_lib.erl", 1).

-module(drop_lib).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		{drop_role,
		 [id, career, lev, name, num_best, num_common,
		  is_person_limit, drop_total, limit_flag, drop_limit,
		  common_list, best_list, item_list, notice_list]},
		{drop_group,
		 [group, item_bid, item_name, item_num, bind, rand,
		  career, lev]},
		{drop_son,
		 [drop_id, name, item_bid, item_name, item_num, bind,
		  rand, is_notice, career, lev, self_time, srv_time,
		  self_count, srv_count, self_down, self_up, world_lev]},
		{drop_total,
		 [drop_id, name, allot, super_r, first_r, second_r,
		  third_r, notice_msg]},
		{drop_bag, [ver, id, mon, mon_cache, common]},
		{drop_limit,
		 [ver, time_val, count_val, down_val, up_val]},
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

-export([combat_drop/2, gain_combat_drop/4,
	 gain_combat_drop/6, do_gain_combat_drop/4,
	 gm_drop_mon/3, gm_drop/3, common_drop_items/2,
	 common_drop/2, drop_notice/1, drop_notice/2,
	 recalc_partner_exp/3, recalc_by_buff/2,
	 common_drop2/2]).

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

-file("src/mod/drop/drop_lib.erl", 27).

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

-file("src/mod/drop/drop_lib.erl", 28).

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

-file("src/mod/drop/drop_lib.erl", 29).

-file("inc/drop.hrl", 1).

-record(drop_limit,
	{ver = 1, time_val = [], count_val = [], down_val = [],
	 up_val = []}).

-record(drop_bag,
	{ver = 1, id = {0, <<>>}, mon = #drop_limit{},
	 mon_cache = #drop_limit{}, common = #drop_limit{}}).

-record(drop_total,
	{drop_id = 0, name = <<>>, allot = 0, super_r = 0,
	 first_r = 0, second_r = 0, third_r = 0,
	 notice_msg = <<>>}).

-record(drop_son,
	{drop_id = 0, name = <<>>, item_bid = 0,
	 item_name = <<>>, item_num = 0, bind = 1, rand = 0,
	 is_notice = 0, career = 0, lev = 0, self_time = 0,
	 srv_time = 0, self_count = 0, srv_count = 0,
	 self_down = 0, self_up = 0, world_lev = 0}).

-record(drop_group,
	{group = 0, item_bid = 0, item_name = <<>>,
	 item_num = 0, bind = 1, rand = 0, career = 0, lev = 0}).

-record(drop_role,
	{id = {0, <<>>}, career = 0, lev = 0, name = <<>>,
	 num_best = 0, num_common = 0, is_person_limit = 1,
	 drop_total = undefined, limit_flag = 1,
	 drop_limit = #drop_limit{}, common_list = [],
	 best_list = [], item_list = [], notice_list = []}).

-file("src/mod/drop/drop_lib.erl", 30).

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

-file("src/mod/drop/drop_lib.erl", 31).

-file("inc/game_assets.hrl", 1).

-file("src/mod/drop/drop_lib.erl", 32).

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

-file("src/mod/drop/drop_lib.erl", 33).

-spec combat_drop(#combat{},
		  a_win | b_win) -> [{role_id(), list()}].

combat_drop(#combat{ext_args = ExtArgs,
		    combat_roles = Winner},
	    a_win) ->
    case lists:keyfind(unit, 1, ExtArgs) of
      {_, {_UnitId, _UnitPid, Bid}} ->
	  fight_over_mon(Winner, 0, Bid, 0);
      _ -> []
    end;
combat_drop(_Combat, _Result) -> [].

-spec gain_combat_drop(#role{}, #combat{}, 0 | 1 | 2,
		       list()) -> {ok, #role{},
				   [{integer(), integer(), integer(), integer(),
				     integer()}]}.

gain_combat_drop(Role, Combat, CombatResult,
		 BaseRewards) ->
    gain_combat_drop(Role, Combat, CombatResult,
		     BaseRewards, <<>>, <<>>).

gain_combat_drop(Role, Combat, CombatResult,
		 BaseRewards, LogType, LogMsg) ->
    do_gain_combat_drop(Role,
			combat_unit_drop_assets(Role, Combat, CombatResult) ++
			  BaseRewards,
			LogType, LogMsg).

do_gain_combat_drop(Role, BaseRewards, LogType,
		    LogMsg) ->
    BaseGL = format:val_to_gain(BaseRewards, drop),
    case role_gain:do(Role, BaseGL,
		      #gain_loss_opts{is_continue = true})
	of
      {ok, NRole, GainOpts} ->
	  DropItems1 = format:gain_to_cli_drop(GainOpts),
	  case LogType of
	    <<>> -> skip;
	    _ ->
		log:log_gain(GainOpts, Role, NRole, LogType, LogMsg)
	  end,
	  {ok, NRole, DropItems1};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrop_lib64, _,
	     {__Leveldrop_lib64, __Tracesdrop_lib64}}
		when __Leveldrop_lib64 band 8 /= 0 orelse
		       __Tracesdrop_lib64 /= [] ->
		lager:do_log(error,
			     [{module, drop_lib},
			      {function, do_gain_combat_drop}, {line, 64},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色Id:~w, 名字:~w, 损益操作失败",
					   [Role#role.id, Role#role.name]),
			     none, 4096, 8, __Leveldrop_lib64,
			     __Tracesdrop_lib64, lager_event, __Piddrop_lib64);
	    _ -> ok
	  end,
	  {ok, Role, []}
    end.

recalc_partner_exp(Role, DropItems0, Num) ->
    DropItems = recalc_by_buff(Role, DropItems0),
    recalc_partner_exp_(DropItems, Num).

recalc_by_buff(Role, DropItem) ->
    ExpTimes = role_buff:exp_times(Role),
    CoinTimes = role_buff:coin_times(Role),
    recalc_by_buff_(ExpTimes, CoinTimes, DropItem, []).

recalc_by_buff_(_ExpTimes, _CoinTimes, [], Result) ->
    Result;
recalc_by_buff_(ExpTimes, CoinTimes, [{6, V} | T],
		Result) ->
    recalc_by_buff_(ExpTimes, CoinTimes, T,
		    [{6, trunc(V * ExpTimes)} | Result]);
recalc_by_buff_(ExpTimes, CoinTimes, [{1, V} | T],
		Result) ->
    recalc_by_buff_(ExpTimes, CoinTimes, T,
		    [{1, trunc(V * CoinTimes)} | Result]);
recalc_by_buff_(ExpTimes, CoinTimes, [G | T], Result) ->
    recalc_by_buff_(ExpTimes, CoinTimes, T, [G | Result]).

recalc_partner_exp_(DropItems, 0) -> DropItems;
recalc_partner_exp_(DropItems, PartnerNum) ->
    {PartnerExp, Other} = split_partner_exp(DropItems),
    case PartnerExp of
      0 -> Other;
      _ -> [{6, trunc(PartnerExp / PartnerNum)} | Other]
    end.

split_partner_exp(DropItems) ->
    split_partner_exp(DropItems, {0, []}).

split_partner_exp([], Result) -> Result;
split_partner_exp([{6, Exp} | T],
		  {PartnerExp, Other}) ->
    split_partner_exp(T, {PartnerExp + Exp, Other});
split_partner_exp([H | T], {PartnerExp, Other}) ->
    split_partner_exp(T, {PartnerExp, [H | Other]}).

combat_unit_drop_assets(_Role,
			#combat{ext_args = ExtArgs = [_ | _]}, 1) ->
    case lists:keyfind(unit, 1, ExtArgs) of
      {_, {_UnitId, _UnitPid, Bid}} ->
	  case unit_data:get(Bid) of
	    #unit_data{gain = Gain} -> Gain;
	    _ -> []
	  end;
      _ -> []
    end;
combat_unit_drop_assets(_Role, _Combat,
			_CombatResult) ->
    [].

fight_over_mon([], _LeaderId, _MonBid, _DPid) -> [];
fight_over_mon(Winner, LeaderId, MonBid, DPid) ->
    case unit_data:get(MonBid) of
      #unit_data{drop_id = DropId,
		 act_drops = DropActivity} ->
	  ADropList = get_activity_drop(DropActivity, []),
	  fight_over_drop_list([DropId | ADropList], Winner,
			       LeaderId, DPid, []);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrop_lib129, _,
	     {__Leveldrop_lib129, __Tracesdrop_lib129}}
		when __Leveldrop_lib129 band 128 /= 0 orelse
		       __Tracesdrop_lib129 /= [] ->
		lager:do_log(debug,
			     [{module, drop_lib}, {function, fight_over_mon},
			      {line, 129}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("fight_over_mon::MonBid=~w",
					   [MonBid]),
			     none, 4096, 128, __Leveldrop_lib129,
			     __Tracesdrop_lib129, lager_event,
			     __Piddrop_lib129);
	    _ -> ok
	  end,
	  []
    end.

get_activity_drop([], Ret) -> Ret;
get_activity_drop([{AId, DropId} | T], Ret) ->
    case holiday_lib:is_open(AId) of
      true -> get_activity_drop(T, [DropId | Ret]);
      false -> get_activity_drop(T, Ret)
    end;
get_activity_drop([_H | T], Ret) ->
    get_activity_drop(T, Ret).

fight_over_drop_list([], _DropRoleList, _LeaderId,
		     _DPid, AllRoleItemList) ->
    AllRoleItemList;
fight_over_drop_list([DropId | T], DropRoleList,
		     LeaderId, DPid, AllRoleItemList) ->
    RoleItemList = fight_over_drop(DropRoleList, LeaderId,
				   DropId, DPid),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrop_lib149, _,
       {__Leveldrop_lib149, __Tracesdrop_lib149}}
	  when __Leveldrop_lib149 band 128 /= 0 orelse
		 __Tracesdrop_lib149 /= [] ->
	  lager:do_log(debug,
		       [{module, drop_lib}, {function, fight_over_drop_list},
			{line, 149}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("RoleItemList ~w", [RoleItemList]), none,
		       4096, 128, __Leveldrop_lib149, __Tracesdrop_lib149,
		       lager_event, __Piddrop_lib149);
      _ -> ok
    end,
    NAllRoleItemList = merge_drop_item(RoleItemList,
				       AllRoleItemList, []),
    fight_over_drop_list(T, DropRoleList, LeaderId, DPid,
			 NAllRoleItemList).

merge_drop_item([], _ODropItem, Ret) -> Ret;
merge_drop_item([RDrop = {Rid, ItemList} | T],
		ODropItem, Ret) ->
    case lists:keyfind(Rid, 1, ODropItem) of
      false -> merge_drop_item(T, ODropItem, [RDrop | Ret]);
      {Rid, OItemList} ->
	  ItemList1 = item_lib:merge(ItemList, []),
	  NItemList = item_lib:merge(ItemList1, OItemList),
	  merge_drop_item(T, ODropItem, [{Rid, NItemList} | Ret])
    end.

fight_over_drop([], _LeaderId, _DropId, _DPid) -> [];
fight_over_drop(_DropRoleList, _LeaderId, 0, _DPid) ->
    [];
fight_over_drop(DropRoleList, LeaderId, DropId, DPid) ->
    case drop_data:get(DropId) of
      DropTotal = #drop_total{notice_msg = NoticeMsg} ->
	  IsDungeon = is_pid(DPid),
	  DropLimitFlag = case IsDungeon of
			    false -> 1;
			    true -> 2
			  end,
	  DropRoleList2 = to_drop_role(DropRoleList),
	  DropRoleList3 = to_drop_role_ext(DropRoleList2,
					   DropTotal, DropLimitFlag),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrop_lib181, _,
	     {__Leveldrop_lib181, __Tracesdrop_lib181}}
		when __Leveldrop_lib181 band 128 /= 0 orelse
		       __Tracesdrop_lib181 /= [] ->
		lager:do_log(debug,
			     [{module, drop_lib}, {function, fight_over_drop},
			      {line, 181}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("DropRoleList2 ~w", [DropRoleList2]),
			     none, 4096, 128, __Leveldrop_lib181,
			     __Tracesdrop_lib181, lager_event,
			     __Piddrop_lib181);
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
	    {__Piddrop_lib182, _,
	     {__Leveldrop_lib182, __Tracesdrop_lib182}}
		when __Leveldrop_lib182 band 128 /= 0 orelse
		       __Tracesdrop_lib182 /= [] ->
		lager:do_log(debug,
			     [{module, drop_lib}, {function, fight_over_drop},
			      {line, 182}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("DropRoleList3 ~w", [DropRoleList3]),
			     none, 4096, 128, __Leveldrop_lib182,
			     __Tracesdrop_lib182, lager_event,
			     __Piddrop_lib182);
	    _ -> ok
	  end,
	  DropRoleList4 = drop_num(DropRoleList3, LeaderId,
				   DropTotal),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrop_lib186, _,
	     {__Leveldrop_lib186, __Tracesdrop_lib186}}
		when __Leveldrop_lib186 band 128 /= 0 orelse
		       __Tracesdrop_lib186 /= [] ->
		lager:do_log(debug,
			     [{module, drop_lib}, {function, fight_over_drop},
			      {line, 186}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("DropRoleList4 ~w", [DropRoleList4]),
			     none, 4096, 128, __Leveldrop_lib186,
			     __Tracesdrop_lib186, lager_event,
			     __Piddrop_lib186);
	    _ -> ok
	  end,
	  Result = drop_role2result(fight_over, DropRoleList4,
				    NoticeMsg, DropId),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrop_lib188, _,
	     {__Leveldrop_lib188, __Tracesdrop_lib188}}
		when __Leveldrop_lib188 band 128 /= 0 orelse
		       __Tracesdrop_lib188 /= [] ->
		lager:do_log(debug,
			     [{module, drop_lib}, {function, fight_over_drop},
			      {line, 188}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("DropId:~w Result ~w",
					   [DropId, Result]),
			     none, 4096, 128, __Leveldrop_lib188,
			     __Tracesdrop_lib188, lager_event,
			     __Piddrop_lib188);
	    _ -> ok
	  end,
	  Result;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrop_lib191, _,
	     {__Leveldrop_lib191, __Tracesdrop_lib191}}
		when __Leveldrop_lib191 band 8 /= 0 orelse
		       __Tracesdrop_lib191 /= [] ->
		lager:do_log(error,
			     [{module, drop_lib}, {function, fight_over_drop},
			      {line, 191}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("掉落不存在::DropId=~w", [DropId]), none,
			     4096, 8, __Leveldrop_lib191, __Tracesdrop_lib191,
			     lager_event, __Piddrop_lib191);
	    _ -> ok
	  end,
	  []
    end.

drop_num(DropRoleList, LeaderId, DropTotal) ->
    case DropTotal#drop_total.allot of
      1 ->
	  F = fun (DropRole, Sum) ->
		      {NumCommon, NumBest} = drop:calc_drop_num(DropTotal),
		      [DropRole#drop_role{num_best = NumBest,
					  num_common = NumCommon}
		       | Sum]
	      end,
	  DropRoleList2 = lists:foldr(F, [], DropRoleList),
	  drop_each(DropRoleList2, DropTotal, []);
      2 ->
	  {NumCommon, NumBest} = drop:calc_drop_num(DropTotal),
	  DropRoleList2 = allot_2_num(NumCommon, NumBest,
				      DropRoleList),
	  drop_each(DropRoleList2, DropTotal, []);
      3 ->
	  [DropRole | _] = DropRoleList,
	  {NumCommon, NumBest} = drop:calc_drop_num(DropTotal),
	  DropRoleList2 = [DropRole#drop_role{num_best = NumBest,
					      num_common = NumCommon,
					      is_person_limit = 0}],
	  Result = drop_each(DropRoleList2, DropTotal, []),
	  case Result of
	    [{_, GetItemList} | _] ->
		[{RoleId, GetItemList}
		 || #drop_role{id = RoleId} <- DropRoleList];
	    _ -> []
	  end;
      4 ->
	  case lists:keyfind(LeaderId, #drop_role.id,
			     DropRoleList)
	      of
	    false -> [];
	    DropRole ->
		{NumCommon, NumBest} = drop:calc_drop_num(DropTotal),
		DropRole2 = DropRole#drop_role{num_best = NumBest,
					       num_common = NumCommon},
		drop_each([DropRole2], DropTotal, [])
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
	    {__Piddrop_lib229, _,
	     {__Leveldrop_lib229, __Tracesdrop_lib229}}
		when __Leveldrop_lib229 band 8 /= 0 orelse
		       __Tracesdrop_lib229 /= [] ->
		lager:do_log(error,
			     [{module, drop_lib}, {function, drop_num},
			      {line, 229}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("分配类型错误:~w",
					   [DropTotal#drop_total.allot]),
			     none, 4096, 8, __Leveldrop_lib229,
			     __Tracesdrop_lib229, lager_event,
			     __Piddrop_lib229);
	    _ -> ok
	  end,
	  []
    end.

allot_2_num(NumCommon, NumBest, DropRoleList) ->
    RoleNum = erlang:length(DropRoleList),
    NumList = lists:duplicate(RoleNum, {0, 0}),
    NumList2 = allot_2_num_f1(NumCommon, NumBest, NumList),
    NumList3 = list_util:rand_more(NumList2, RoleNum),
    DropRoleList2 = allot_2_num_f2(DropRoleList, NumList3,
				   []),
    DropRoleList2.

allot_2_num_f1(NumCommon, NumBest, R)
    when NumBest =< 0 andalso NumCommon =< 0 ->
    R;
allot_2_num_f1(NumCommon, NumBest, [{N1, N2} | R]) ->
    case NumCommon > 0 of
      true ->
	  allot_2_num_f1(NumCommon - 1, NumBest,
			 R ++ [{N1 + 1, N2}]);
      false ->
	  case NumBest > 0 of
	    true ->
		allot_2_num_f1(NumCommon, NumBest - 1,
			       R ++ [{N1, N2 + 1}]);
	    false -> [{N1, N2} | R]
	  end
    end.

allot_2_num_f2(DropRoleList, NumList, R)
    when DropRoleList == [] orelse NumList == [] ->
    R;
allot_2_num_f2([DropRole | DropRoleList],
	       [{NumCommon, NumBest} | NumList], R) ->
    DropRole2 = DropRole#drop_role{num_common = NumCommon,
				   num_best = NumBest},
    allot_2_num_f2(DropRoleList, NumList, [DropRole2 | R]).

drop_each([], _DropTotal, Result) -> Result;
drop_each([DropRole = #drop_role{id = RoleId,
				 career = Career, lev = Lev, num_best = NumBest,
				 num_common = NumCommon,
				 is_person_limit = IsPersonLimit}
	   | DropRoleList],
	  DropTotal, Result) ->
    DropLimit = DropRole#drop_role.drop_limit,
    {GetCommonList, DropLimit2} = drop:drop_son(NumCommon,
						common, DropTotal, DropLimit,
						Career, Lev, IsPersonLimit),
    {GetBestList, DropLimit3} = drop:drop_son(NumBest, best,
					      DropTotal, DropLimit2, Career,
					      Lev, IsPersonLimit),
    drop_mgr:set_limit(RoleId, DropLimit3,
		       DropRole#drop_role.limit_flag),
    {GetItemList, NoticeItems} = drop:drop_son2item(Career,
						    Lev, GetCommonList, [], []),
    {GetItemList2, NoticeItems2} =
	drop:drop_son2item(Career, Lev, GetBestList,
			   GetItemList, NoticeItems),
    DropRole2 = DropRole#drop_role{common_list =
				       GetCommonList,
				   best_list = GetBestList,
				   item_list = GetItemList2,
				   notice_list = NoticeItems2},
    Result2 = [DropRole2 | Result],
    drop_each(DropRoleList, DropTotal, Result2).

gm_drop_mon(Role, MonBid, Num) ->
    case unit_data:get(MonBid) of
      #unit_data{drop_id = DropId} ->
	  gm_drop(Role, DropId, Num);
      _Other ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrop_lib284, _,
	     {__Leveldrop_lib284, __Tracesdrop_lib284}}
		when __Leveldrop_lib284 band 8 /= 0 orelse
		       __Tracesdrop_lib284 /= [] ->
		lager:do_log(error,
			     [{module, drop_lib}, {function, gm_drop_mon},
			      {line, 284}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("怪物掉落配置有问题!MonBid ~w, _Other ~w",
					   [MonBid, _Other]),
			     none, 4096, 8, __Leveldrop_lib284,
			     __Tracesdrop_lib284, lager_event,
			     __Piddrop_lib284);
	    _ -> ok
	  end,
	  Role
    end.

gm_drop(Role, DropId, Num) ->
    #role{id = RoleId, lev = RoleLev, name = Name} = Role,
    WinnerList = [#combat_role{id = RoleId, name = Name,
			       lev = RoleLev}],
    DPid = 0,
    ItemBidList = gm_drop_f1(Num, WinnerList, RoleId,
			     DropId, DPid, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrop_lib293, _,
       {__Leveldrop_lib293, __Tracesdrop_lib293}}
	  when __Leveldrop_lib293 band 64 /= 0 orelse
		 __Tracesdrop_lib293 /= [] ->
	  lager:do_log(info,
		       [{module, drop_lib}, {function, gm_drop}, {line, 293},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts===dropid:~w num:~w items:~w",
				     [Role#role.name, DropId, Num,
				      ItemBidList]),
		       none, 4096, 64, __Leveldrop_lib293, __Tracesdrop_lib293,
		       lager_event, __Piddrop_lib293);
      _ -> ok
    end,
    GL = format:val_to_gain(ItemBidList, drop),
    case role_gain:do_notice(Role, GL) of
      {ok, TmpRole2} -> TmpRole2;
      _Other -> Role
    end.

gm_drop_f1(Num, _WinnerList, _Leader, _DropId, _DPid,
	   ItemBidList)
    when Num =< 0 ->
    ItemBidList;
gm_drop_f1(Num, WinnerList, Leader, DropId, DPid,
	   ItemBidList) ->
    ItemBidList2 = case fight_over_drop(WinnerList, Leader,
					DropId, DPid)
		       of
		     [{_, AddItemBidList} | _] ->
			 item_lib:merge(ItemBidList, AddItemBidList);
		     _ -> ItemBidList
		   end,
    gm_drop_f1(Num - 1, WinnerList, Leader, DropId, DPid,
	       ItemBidList2).

-spec common_drop_items(#role{},
			pos_integer() | list()) -> {list(), list(), binary()}.

common_drop_items(Role, DropIds) ->
    case common_drop(Role, DropIds) of
      [{_, DropItems, NoticeItems, NoticeMsg}] ->
	  {DropItems, NoticeItems, NoticeMsg};
      _ -> {[], [], <<>>}
    end.

common_drop(RoleData, DropIds) when is_list(DropIds) ->
    Fun = fun (DropId, L) ->
		  case common_drop(RoleData, DropId) of
		    L1 when L =:= [] -> L1;
		    [{RoleId, AllList, NoticeList, NoticeMsg}] ->
			[{_, AllList1, NoticeList1, _}] = L,
			[{RoleId, item_lib:merge(AllList, AllList1),
			  item_lib:merge(NoticeList, NoticeList1), NoticeMsg}];
		    _ -> L
		  end
	  end,
    lists:foldl(Fun, [], DropIds);
common_drop(RoleData, DropId) when is_integer(DropId) ->
    try case drop_data:get(DropId) of
	  DropTotal = #drop_total{notice_msg = NoticeMsg} ->
	      DropRoleList = to_drop_role([RoleData]),
	      DropTotal2 = DropTotal#drop_total{allot = 1},
	      DropRoleList2 = to_drop_role_ext(DropRoleList,
					       DropTotal2, 3),
	      LeaderId = 0,
	      DropRoleList3 = drop_num(DropRoleList2, LeaderId,
				       DropTotal),
	      Result = drop_role2result(common, DropRoleList3,
					NoticeMsg),
	      Result;
	  _ ->
	      case {whereis(lager_event), whereis(lager_event),
		    lager_config:get({lager_event, loglevel}, {0, []})}
		  of
		{undefined, undefined, _} ->
		    fun () -> {error, lager_not_running} end();
		{undefined, _, _} ->
		    fun () -> {error, {sink_not_configured, lager_event}}
		    end();
		{__Piddrop_lib348, _,
		 {__Leveldrop_lib348, __Tracesdrop_lib348}}
		    when __Leveldrop_lib348 band 8 /= 0 orelse
			   __Tracesdrop_lib348 /= [] ->
		    lager:do_log(error,
				 [{module, drop_lib}, {function, common_drop},
				  {line, 348}, {pid, pid_to_list(self())},
				  {node, node()}
				  | lager:md()],
				 io_lib:format("common_drop::DropId=~w",
					       [DropId]),
				 none, 4096, 8, __Leveldrop_lib348,
				 __Tracesdrop_lib348, lager_event,
				 __Piddrop_lib348);
		_ -> ok
	      end,
	      []
	end
    catch
      X:Y ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrop_lib353, _,
	     {__Leveldrop_lib353, __Tracesdrop_lib353}}
		when __Leveldrop_lib353 band 8 /= 0 orelse
		       __Tracesdrop_lib353 /= [] ->
		lager:do_log(error,
			     [{module, drop_lib}, {function, common_drop},
			      {line, 353}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("掉落处理出错:dropid:~w, ~w, ~w",
					   [DropId, X, Y]),
			     none, 4096, 8, __Leveldrop_lib353,
			     __Tracesdrop_lib353, lager_event,
			     __Piddrop_lib353);
	    _ -> ok
	  end,
	  []
    end;
common_drop(_RoleData, _) -> [].

common_drop2(RoleData, DropIds) when is_list(DropIds) ->
    Fun = fun (DropId, L) ->
		  case common_drop(RoleData, DropId) of
		    L1 when L =:= [] -> L1;
		    [{RoleId, AllList, NoticeList, NoticeMsg}] ->
			[{_, AllList1, NoticeList1, _}] = L,
			[{RoleId, AllList ++ AllList1,
			  item_lib:merge(NoticeList, NoticeList1), NoticeMsg}];
		    _ -> L
		  end
	  end,
    lists:foldl(Fun, [], DropIds);
common_drop2(_RoleData, _) -> [].

to_drop_role(WinnerList) ->
    to_drop_role_f1(WinnerList, []).

to_drop_role_f1([], R) -> R;
to_drop_role_f1([#combat_role{id = Rid, name = Name,
			      lev = Lev}
		 | WinnerList],
		R) ->
    R2 = [#drop_role{id = Rid, name = Name, lev = Lev} | R],
    to_drop_role_f1(WinnerList, R2);
to_drop_role_f1([#role{id = Id, name = Name,
		       career = Career, lev = Lev}
		 | RoleList],
		R) ->
    R2 = [#drop_role{id = Id, name = Name, career = Career,
		     lev = Lev}
	  | R],
    to_drop_role_f1(RoleList, R2);
to_drop_role_f1([{RoleId, Career, Lev} | WinnerList],
		R) ->
    R2 = [#drop_role{id = RoleId, career = Career,
		     lev = Lev}
	  | R],
    to_drop_role_f1(WinnerList, R2);
to_drop_role_f1([{RoleId, Name, Career, Lev}
		 | WinnerList],
		R) ->
    R2 = [#drop_role{id = RoleId, name = Name,
		     career = Career, lev = Lev}
	  | R],
    to_drop_role_f1(WinnerList, R2).

to_drop_role_ext(DropRoleList, DropTotal, LimitFlag) ->
    F = fun (XDropRole = #drop_role{id = Id}, Sum) ->
		DropLimt = drop_mgr:get_limit(Id, LimitFlag),
		[XDropRole#drop_role{drop_total = DropTotal,
				     drop_limit = DropLimt,
				     limit_flag = LimitFlag}
		 | Sum]
	end,
    lists:foldl(F, [], DropRoleList).

drop_role2result(common, DropSonList, NoticeMsg) ->
    F = fun (#drop_role{id = Id, item_list = ItemList,
			notice_list = NoticeList, name = Name},
	     Sum) ->
		NewNotice = if NoticeMsg =:= <<>> -> <<>>;
			       NoticeList =:= [] -> <<>>;
			       true ->
				   ItemStr = item_to_binary(NoticeList, <<>>),
				   replace_str(NoticeMsg,
					       color:format({name, Id, Name}),
					       ItemStr)
			    end,
		[{Id, ItemList, NoticeList, NewNotice} | Sum]
	end,
    lists:foldl(F, [], DropSonList).

drop_role2result(fight_over, DropSonList, NoticeMsg,
		 DropId) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrop_lib423, _,
       {__Leveldrop_lib423, __Tracesdrop_lib423}}
	  when __Leveldrop_lib423 band 128 /= 0 orelse
		 __Tracesdrop_lib423 /= [] ->
	  lager:do_log(debug,
		       [{module, drop_lib}, {function, drop_role2result},
			{line, 423}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("NoticeMsg ~s", [NoticeMsg]), none, 4096,
		       128, __Leveldrop_lib423, __Tracesdrop_lib423,
		       lager_event, __Piddrop_lib423);
      _ -> ok
    end,
    F = fun (#drop_role{id = Id, item_list = ItemList,
			notice_list = NoticeList, name = Name},
	     Sum) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddrop_lib425, _,
		   {__Leveldrop_lib425, __Tracesdrop_lib425}}
		      when __Leveldrop_lib425 band 128 /= 0 orelse
			     __Tracesdrop_lib425 /= [] ->
		      lager:do_log(debug,
				   [{module, drop_lib},
				    {function, drop_role2result}, {line, 425},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("NoticeList ~w", [NoticeList]),
				   none, 4096, 128, __Leveldrop_lib425,
				   __Tracesdrop_lib425, lager_event,
				   __Piddrop_lib425);
		  _ -> ok
		end,
		if NoticeMsg =:= <<>> -> ignore;
		   NoticeList =:= [] -> ignore;
		   true ->
		       ItemStr = item_to_binary(NoticeList, <<>>),
		       NoticeStr = replace_str(NoticeMsg,
					       color:format({name, Id, Name}),
					       ItemStr),
		       drop_notice(DropId, NoticeStr)
		end,
		[{Id, ItemList} | Sum]
	end,
    lists:foldl(F, [], DropSonList).

item_to_binary([], Result) -> Result;
item_to_binary([{Id, Num} | T], Result)
    when Id < 10000 ->
    Name = color:format({assets, Id}),
    NResult = util:format("~ts, ~w ~ts",
			  [Result, Num, Name]),
    item_to_binary(T, NResult);
item_to_binary([{Id, Num} | T], Result) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrop_lib443, _,
       {__Leveldrop_lib443, __Tracesdrop_lib443}}
	  when __Leveldrop_lib443 band 128 /= 0 orelse
		 __Tracesdrop_lib443 /= [] ->
	  lager:do_log(debug,
		       [{module, drop_lib}, {function, item_to_binary},
			{line, 443}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("{Id, Num} ~w", [{Id, Num}]), none, 4096,
		       128, __Leveldrop_lib443, __Tracesdrop_lib443,
		       lager_event, __Piddrop_lib443);
      _ -> ok
    end,
    Name = color:format({item, {Id, Num}}),
    NResult = case Result of
		<<>> -> Name;
		_ -> util:format("~ts 、~ts", [Result, Name])
	      end,
    item_to_binary(T, NResult).

replace_str(Str, Name, ItemStr) ->
    Str1 = re:replace(Str, "#name#", Name,
		      [{return, binary}]),
    re:replace(Str1, "#item#", ItemStr, [{return, binary}]).

drop_notice(undefined) -> ok;
drop_notice(<<>>) -> ok;
drop_notice("") -> ok;
drop_notice([I | T]) when is_binary(I) ->
    drop_notice(I), drop_notice(T);
drop_notice(Notice) ->
    notice:broadcast(rumor_left_top, Notice).

drop_notice(_DropId, <<>>) -> ok;
drop_notice(DropId, Notice) ->
    case catch gen_server:call(drop_mgr,
			       {notice_interval, DropId})
	of
      {ok, true} -> notice:broadcast(rumor_left_top, Notice);
      _Other -> ignore
    end.


