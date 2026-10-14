-file("data/dungeon_heaven.erl", 1).

-file("src/mod/dungeon_heaven/dungeon_heaven.erl", 1).

-module(dungeon_heaven).

-lager_records([{personal_push_gift_data,
		 [gift_id, type_id, charge_id, limit_count, money,
		  costly_num, valid_time, open_cond, warehouse_id, award,
		  over_time, buy_count, trigger_id]},
		{m_personal_push,
		 [ver, fire_type, fire_not_buy, fire_gift, ext]},
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
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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
		{heaven_dun, [ver, id, state, star, star_info]},
		{heaven_chapter,
		 [ver, id, star, chapter_awards, dun_list]},
		{m_dungeon_heaven,
		 [ver, count, buy_count, chapter_list, formations]},
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

-export([init_chapter/1, get_unit_fight_object/4,
	 gen_fight_object/4, get_formation_pos_info/2,
	 ref_dun_heaven/4, get_chapter/2, check_open/2,
	 calc_star_info/1, check_next_open/1]).

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

-file("src/mod/dungeon_heaven/dungeon_heaven.erl", 19).

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

-file("src/mod/dungeon_heaven/dungeon_heaven.erl", 20).

-file("inc/dungeon_heaven.hrl", 1).

-record(m_dungeon_heaven,
	{ver = 1, count = 0, buy_count = 0, chapter_list = [],
	 formations = []}).

-record(heaven_chapter,
	{ver = 1, id = 0, star = 0, chapter_awards = [],
	 dun_list = []}).

-record(heaven_dun,
	{ver = 1, id = 0, state = 0, star = 0, star_info = []}).

-file("src/mod/dungeon_heaven/dungeon_heaven.erl", 21).

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

-file("src/mod/dungeon_heaven/dungeon_heaven.erl", 22).

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

-file("src/mod/dungeon_heaven/dungeon_heaven.erl", 23).

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

-file("src/mod/dungeon_heaven/dungeon_heaven.erl", 24).

-file("inc/personal_push.hrl", 1).

-record(m_personal_push,
	{ver = 1, fire_type = [], fire_not_buy = [],
	 fire_gift = [], ext = []}).

-record(personal_push_gift_data,
	{gift_id = 0, type_id = 0, charge_id = 0,
	 limit_count = 0, money = 0, costly_num = 0,
	 valid_time = 0, open_cond = [], warehouse_id = [],
	 award = [], over_time = 0, buy_count = 0,
	 trigger_id = 0}).

-file("src/mod/dungeon_heaven/dungeon_heaven.erl", 25).

-spec init_chapter(pos_integer()) -> #heaven_chapter{}.

init_chapter(Id) ->
    #heaven_chapter{id = Id,
		    chapter_awards = init_award(Id),
		    dun_list = init_dun_list(Id)}.

init_award(Id) ->
    AwardList =
	dungeon_heaven_data:get_chapter_award_list(Id),
    [{AwardId, 0} || AwardId <- AwardList].

init_dun_list(Id) ->
    DunList = dungeon_heaven_data:get_chapter_dun_list(Id),
    [to_dun_info(Id, DunId) || DunId <- DunList].

to_dun_info(ChapterId, DunId) ->
    StarInfo = [{Id, 0}
		|| {Id, _}
		       <- dungeon_heaven_data:get_cond_info({ChapterId,
							     DunId})],
    #heaven_dun{id = DunId,
		state = util:if_true(DunId == 1, 1, 0),
		star_info = StarInfo}.

-spec get_chapter(#role{} | list(),
		  pos_integer()) -> {false, binary()} | #heaven_chapter{}.

get_chapter(#role{m_dun_heaven =
		      #m_dungeon_heaven{chapter_list = ChapterList}},
	    ChapterId) ->
    get_chapter(ChapterList, ChapterId);
get_chapter(ChapterList, 1) ->
    lists:keyfind(1, #heaven_chapter.id, ChapterList);
get_chapter(ChapterList, ChapterId) ->
    case lists:keyfind(ChapterId, #heaven_chapter.id,
		       ChapterList)
	of
      Chapter = #heaven_chapter{} -> Chapter;
      _ -> check_open(ChapterList, ChapterId)
    end.

-spec ref_dun_heaven(#role{}, 1 | 2, pos_integer(),
		     pos_integer()) -> {#role{}, list(), list()}.

ref_dun_heaven(Role = #role{name = Name, id = Id,
			    m_dun_heaven =
				MD = #m_dungeon_heaven{chapter_list =
							   ChapterList}},
	       Cache, ChapterId, OrderId) ->
    case lists:keyfind(ChapterId, #heaven_chapter.id,
		       ChapterList)
	of
      Chapter = #heaven_chapter{chapter_awards =
				    ChapterAwards,
				star = Star, dun_list = DunList} ->
	  {NewDunList, PushDunList, AddStar, StarInfo} =
	      ref_dun_list(DunList, ChapterId, OrderId, Cache, Name,
			   Id),
	  NewStar = AddStar + Star,
	  NewChapterAwards = ref_chapter_awards(ChapterAwards,
						NewStar, ChapterId),
	  NewChapter = Chapter#heaven_chapter{chapter_awards =
						  NewChapterAwards,
					      star = NewStar,
					      dun_list = NewDunList},
	  NChapterList = lists:keyreplace(ChapterId,
					  #heaven_chapter.id, ChapterList,
					  NewChapter),
	  CheckList =
	      dungeon_heaven_data:get_chapter_check_open(ChapterId),
	  case check_open(NChapterList,
			  [ChapterId + 1 | CheckList], [])
	      of
	    AddChapters = [_ | _] ->
		NewChapterList = AddChapters ++ NChapterList,
		NewRole = Role#role{m_dun_heaven =
					MD#m_dungeon_heaven{chapter_list =
								NewChapterList}},
		NewRole1 = gift_trigger:fire(NewRole,
					     heaven_chapter_pass,
					     [{6, ChapterId}]),
		{NewRole1, PushDunList, [NewChapter | AddChapters],
		 StarInfo};
	    _ ->
		NewRole = Role#role{m_dun_heaven =
					MD#m_dungeon_heaven{chapter_list =
								NChapterList}},
		{NewRole, PushDunList, [NewChapter], StarInfo}
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
	    {__Piddungeon_heaven85, _,
	     {__Leveldungeon_heaven85, __Tracesdungeon_heaven85}}
		when __Leveldungeon_heaven85 band 8 /= 0 orelse
		       __Tracesdungeon_heaven85 /= [] ->
		lager:do_log(error,
			     [{module, dungeon_heaven},
			      {function, ref_dun_heaven}, {line, 85},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]~w神装副本通关数据异常:~w",
					   [Role#role.name, Role#role.id,
					    {ChapterId, OrderId}]),
			     none, 4096, 8, __Leveldungeon_heaven85,
			     __Tracesdungeon_heaven85, lager_event,
			     __Piddungeon_heaven85);
	    _ -> ok
	  end,
	  {Role, [], [], []}
    end.

-spec check_next_open(#role{}) -> #role{}.

check_next_open(Role = #role{m_dun_heaven =
				 MD = #m_dungeon_heaven{chapter_list = L}}) ->
    MaxCHapterId = lists:max([Id
			      || #heaven_chapter{id = Id} <- L]),
    case check_open(L, [MaxCHapterId + 1], []) of
      AddChapters = [_ | _] ->
	  NewChapterList = L ++ AddChapters,
	  NewRole = Role#role{m_dun_heaven =
				  MD#m_dungeon_heaven{chapter_list =
							  NewChapterList}},
	  NewRole;
      _ -> Role
    end.

check_open(_ChapterList, [], L) -> L;
check_open(ChapterList, [ChapterId | CheckList], L) ->
    case check_open(ChapterList, ChapterId) of
      AddChapter = #heaven_chapter{} ->
	  check_open(ChapterList, CheckList, [AddChapter | L]);
      _ -> check_open(ChapterList, CheckList, L)
    end.

check_open(ChapterList, ChapterId) ->
    case lists:keyfind(ChapterId, #heaven_chapter.id,
		       ChapterList)
	of
      #heaven_chapter{} -> {false, <<>>};
      _ ->
	  MaxChapterId = lists:max(dungeon_heaven_data:list()),
	  case lists:keyfind(ChapterId - 1, #heaven_chapter.id,
			     ChapterList)
	      of
	    _ when ChapterId > MaxChapterId ->
		{false,
		 lang:get(<<"Không có thông tin về chương này"/utf8>>)};
	    #heaven_chapter{dun_list = DunList} ->
		case [Dun
		      || Dun = #heaven_dun{state = State} <- DunList,
			 State =/= 2]
		    of
		  [] ->
		      case
			dungeon_heaven_data:get_chapter_cond_info(ChapterId)
			  of
			Conds = [_ | _] ->
			    case check_chapter_cond(ChapterList, Conds) of
			      true -> init_chapter(ChapterId);
			      {false, Msg} -> {false, Msg}
			    end;
			_ -> init_chapter(ChapterId)
		      end;
		  _ ->
		      {false,
		       lang:get(<<"Mở khóa sau khi hoàn thành tất cả các "
				  "cấp độ của chương trước"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Mở khóa sau khi hoàn thành chương trước"/utf8>>)}
	  end
    end.

check_chapter_cond(_ChapterList, []) -> true;
check_chapter_cond(ChapterList,
		   [{Id, NeedStar} | Conds]) ->
    case lists:keyfind(Id, #heaven_chapter.id, ChapterList)
	of
      #heaven_chapter{star = Star} when Star >= NeedStar ->
	  check_chapter_cond(ChapterList, Conds);
      _ ->
	  {false,
	   util:fbin(lang:get(<<"Mở khóa sau khi đạt được ~w sao ở chương ~w"/utf8>>),
		     [Id, NeedStar])}
    end.

ref_chapter_awards(ChapterAwards, Star, ChapterId) ->
    Fun = fun ({Id, State}, Acc) ->
		  case State == 0 of
		    true ->
			case
			  dungeon_heaven_data:get_chapter_award_need_star({ChapterId,
									   Id})
			    of
			  NeedStar
			      when is_integer(NeedStar) andalso
				     Star >= NeedStar ->
			      [{Id, 1} | Acc];
			  _ -> [{Id, State} | Acc]
			end;
		    _ -> [{Id, State} | Acc]
		  end
	  end,
    lists:foldl(Fun, [], ChapterAwards).

ref_dun_list(DunList, ChapterId, OrderId, Cache, Name,
	     Id) ->
    case lists:keyfind(OrderId, #heaven_dun.id, DunList) of
      Dun = #heaven_dun{star = Star} ->
	  NewStarInfo = calc_star_info(Cache, ChapterId, OrderId),
	  NewStar = length([1 || {_, 1} <- NewStarInfo]),
	  NewDun = case NewStar >= Star of
		     true ->
			 Dun#heaven_dun{state = 2, star = NewStar,
					star_info = NewStarInfo};
		     _ -> Dun#heaven_dun{state = 2}
		   end,
	  NDunList = lists:keyreplace(OrderId, #heaven_dun.id,
				      DunList, NewDun),
	  AddStar = max(0, NewStar - Star),
	  case lists:keyfind(OrderId + 1, #heaven_dun.id, DunList)
	      of
	    NextDun = #heaven_dun{state = 0} ->
		NNextDun = NextDun#heaven_dun{state = 1},
		NewDunList = lists:keyreplace(OrderId + 1,
					      #heaven_dun.id, NDunList,
					      NNextDun),
		{NewDunList, [NewDun, NNextDun], AddStar, NewStarInfo};
	    _ -> {NDunList, [NewDun], AddStar, NewStarInfo}
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
	    {__Piddungeon_heaven184, _,
	     {__Leveldungeon_heaven184, __Tracesdungeon_heaven184}}
		when __Leveldungeon_heaven184 band 8 /= 0 orelse
		       __Tracesdungeon_heaven184 /= [] ->
		lager:do_log(error,
			     [{module, dungeon_heaven},
			      {function, ref_dun_list}, {line, 184},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]~w神装副本通关数据异常:~w",
					   [Name, Id, {ChapterId, OrderId}]),
			     none, 4096, 8, __Leveldungeon_heaven184,
			     __Tracesdungeon_heaven184, lager_event,
			     __Piddungeon_heaven184);
	    _ -> ok
	  end,
	  {DunList, [], 0, []}
    end.

-spec calc_star_info(#combat{}) -> #m_dungeon_heaven{}.

calc_star_info(Combat = #combat{type = 27,
				on_role_combat_end = OnRoleCombatEnd}) ->
    case OnRoleCombatEnd of
      {_, _,
       [{_, _Flag, _UnitIds, _Round, ARound, _BRound,
	 ChapterId, OrderId, FormationType, PosInfo,
	 _StarInfo}]} ->
	  HpInfo = [{Pos, Hp, HpMax}
		    || #{pos := Pos, hp := Hp, hp_max := HpMax}
			   <- combat_statistics:get_stat_info(1)],
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddungeon_heaven194, _,
	     {__Leveldungeon_heaven194, __Tracesdungeon_heaven194}}
		when __Leveldungeon_heaven194 band 128 /= 0 orelse
		       __Tracesdungeon_heaven194 /= [] ->
		lager:do_log(debug,
			     [{module, dungeon_heaven},
			      {function, calc_star_info}, {line, 194},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗血量:~w", [HpInfo]), none, 4096,
			     128, __Leveldungeon_heaven194,
			     __Tracesdungeon_heaven194, lager_event,
			     __Piddungeon_heaven194);
	    _ -> ok
	  end,
	  Cache = #{result => 2, pos_info => PosInfo,
		    order => [Combat#combat.round],
		    formation_type => [FormationType],
		    a_hp_info => [HpInfo], a_round => ARound},
	  calc_star_info(Cache, ChapterId, OrderId);
      _ -> []
    end;
calc_star_info(_Combat) -> [].

calc_star_info(Cache, ChapterId, OrderId) ->
    case dungeon_heaven_data:get_cond_info({ChapterId,
					    OrderId})
	of
      CondInfosT = [_ | _] ->
	  CondInfos = [{Id, dungeon_heaven_data:get_cond(CondId)}
		       || {Id, CondId} <- CondInfosT],
	  check_cond(CondInfos, [], Cache);
      _ -> []
    end.

check_cond([], StarInfo, _Cache) -> StarInfo;
check_cond([{Id, Cond} | CondInfos], StarInfo, Cache) ->
    case check_cond(Cond, Cache) of
      true ->
	  check_cond(CondInfos, [{Id, 1} | StarInfo], Cache);
      _ -> check_cond(CondInfos, [{Id, 0} | StarInfo], Cache)
    end.

check_cond([], _Cache) -> true;
check_cond([{combat_result, Comp, NeedResult} | Other],
	   Cache = #{result := Result}) ->
    case comp(Comp, Result, NeedResult) of
      true -> check_cond(Other, Cache);
      _ -> false
    end;
check_cond([{{combat_camp_type, CampType}, Comp,
	     NeedNum}
	    | Other],
	   Cache = #{pos_info := AttkLists}) ->
    AttkList = lists:flatten(AttkLists),
    Num = length([T
		  || #fight_object{camp_type = T} <- AttkList,
		     T == CampType]),
    case comp(Comp, Num, NeedNum) of
      true -> check_cond(Other, Cache);
      _ -> false
    end;
check_cond([{{career_type, Career}, Comp, NeedNum}
	    | Other],
	   Cache = #{pos_info := AttkLists}) ->
    AttkList = lists:flatten(AttkLists),
    Num = length([T
		  || #fight_object{career = T} <- AttkList, T == Career]),
    case comp(Comp, Num, NeedNum) of
      true -> check_cond(Other, Cache);
      _ -> false
    end;
check_cond([{formation_type, Comp, FormationType}
	    | Other],
	   Cache = #{formation_type := FormationTypes}) ->
    case [Type
	  || Type <- FormationTypes,
	     comp(Comp, Type, FormationType)]
	of
      [_ | _] -> check_cond(Other, Cache);
      _ -> false
    end;
check_cond([{attk_hp_per, Comp, NeedNum} | Other],
	   Cache = #{a_hp_info := HpLists, result := Result}) ->
    HpList = lists:flatten(HpLists),
    case [Pos
	  || {Pos, Hp, HpMax} <- HpList,
	     Hp > 0 andalso
	       not comp(Comp, trunc(Hp / HpMax * 1000), NeedNum)]
	of
      [] when Result == 1 -> check_cond(Other, Cache);
      _ -> false
    end;
check_cond([{dead_num, Comp, NeedNum} | Other],
	   Cache = #{a_hp_info := HpLists, a_round := ARound}) ->
    HpList = lists:flatten(HpLists),
    Num = length([Pos || {Pos, Hp, _} <- HpList, Hp == 0]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddungeon_heaven257, _,
       {__Leveldungeon_heaven257, __Tracesdungeon_heaven257}}
	  when __Leveldungeon_heaven257 band 128 /= 0 orelse
		 __Tracesdungeon_heaven257 /= [] ->
	  lager:do_log(debug,
		       [{module, dungeon_heaven}, {function, check_cond},
			{line, 257}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("战斗血量:~w", [{Num, ARound, HpList}]), none,
		       4096, 128, __Leveldungeon_heaven257,
		       __Tracesdungeon_heaven257, lager_event,
		       __Piddungeon_heaven257);
      _ -> ok
    end,
    case comp(Comp, Num, NeedNum) andalso ARound == 1 of
      true -> check_cond(Other, Cache);
      _ -> false
    end;
check_cond([{combat_order, Comp, Val} | Other],
	   Cache = #{order := Orders}) ->
    Order = lists:sum(Orders),
    case comp(Comp, Order, Val) of
      true -> check_cond(Other, Cache);
      _ -> false
    end;
check_cond([Cond | _], _Cache) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddungeon_heaven269, _,
       {__Leveldungeon_heaven269, __Tracesdungeon_heaven269}}
	  when __Leveldungeon_heaven269 band 8 /= 0 orelse
		 __Tracesdungeon_heaven269 /= [] ->
	  lager:do_log(error,
		       [{module, dungeon_heaven}, {function, check_cond},
			{line, 269}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("存在未被处理的星级条件:~w", [Cond]), none, 4096, 8,
		       __Leveldungeon_heaven269, __Tracesdungeon_heaven269,
		       lager_event, __Piddungeon_heaven269);
      _ -> ok
    end,
    false.

comp('>=', Val, TargetVal) -> Val >= TargetVal;
comp('==', Val, TargetVal) -> Val == TargetVal;
comp('=<', Val, TargetVal) -> Val =< TargetVal.

get_unit_fight_object(#role{lev = Lev}, UnitIds, Round,
		      StatInfo) ->
    case list_util:nth(UnitIds, Round) of
      undefined ->
	  {false,
	   util:fbin(lang:get(<<"Không có dữ liệu cấu hình cho lượt này:~w"/utf8>>),
		     [{Round, UnitIds}])};
      UnitId ->
	  case unit_data:get(UnitId) of
	    #unit_data{formation = {BFormationType, _BFormationLev},
		       name = TarName} ->
		case unit_monster:gen_fight_objects(Lev, UnitId) of
		  [DefendListT | _] ->
		      DefendList = add_star_info(StatInfo, DefendListT),
		      {TarName, BFormationType, DefendList};
		  _ ->
		      {false,
		       lang:get(<<"Cấu hình quái vật có vấn đề"/utf8>>)}
		end;
	    _ ->
		{false, lang:get(<<"Quái vật không tồn tại"/utf8>>)}
	  end
    end.

-spec gen_fight_object(#role{}, pos_integer(), list(),
		       pos_integer()) -> {false, binary()} |
					 {pos_integer(), list()}.

gen_fight_object(Role, Round, StatInfo, Flag) ->
    FormationType = util:if_true(Flag == 1, 2, 1),
    {ok, _, PushFormations} =
	dungeon_heaven_lib:get_formation_sys(Role,
					     FormationType),
    case lists:keyfind(Round, 1, PushFormations) of
      {Round, FormationId, PosInfo, HallowsId} ->
	  FightPos = formation_lib:gen_fight_pos(PosInfo,
						 FormationId),
	  AttackList0 = combat_lib:gen_fight_objects(Role,
						     FightPos),
	  AttackList1 = add_star_info(StatInfo, AttackList0),
	  SpriteFormationType = util:if_true(Flag == 1, 97, 98),
	  AttackList = sprite_tree:gen_fight_object_type(Role,
							 SpriteFormationType,
							 Round)
			 ++
			 hallows_lib:gen_fight_object(Role, HallowsId) ++
			   AttackList1,
	  {FormationId, AttackList};
      _ ->
	  {false, lang:get(<<"Không có đội nào như vậy"/utf8>>)}
    end.

-spec get_formation_pos_info(#role{},
			     pos_integer()) -> list().

get_formation_pos_info(Role, Flag) ->
    FormationType = util:if_true(Flag == 1, 2, 1),
    {ok, _, PushFormations} =
	dungeon_heaven_lib:get_formation_sys(Role,
					     FormationType),
    Fun = fun ({_Round, Formation, PosInfo, _HallowsId},
	       Acc) ->
		  FightPos = formation_lib:gen_fight_pos(PosInfo,
							 Formation),
		  AttackList0 = combat_lib:gen_fight_objects(Role,
							     FightPos),
		  AttackList0 ++ Acc
	  end,
    lists:foldl(Fun, [], PushFormations).

add_star_info([], DefendList) -> DefendList;
add_star_info([#{object_id := PId, hp := Hp,
		 hp_max := HpMax}
	       | T],
	      DefendList) ->
    Fun = fun (FO = #fight_object{object_type = 4}) ->
		  {true, FO};
	      (FO = #fight_object{object_type = 5}) -> {true, FO};
	      (FO = #fight_object{object_id = Id, hp_max = HpMax2}) ->
		  case PId == Id of
		    true ->
			{true,
			 FO#fight_object{hp = round(Hp * HpMax2 / HpMax)}};
		    _ -> {true, FO}
		  end
	  end,
    NDefendList = lists:filtermap(Fun, DefendList),
    add_star_info(T, NDefendList).


