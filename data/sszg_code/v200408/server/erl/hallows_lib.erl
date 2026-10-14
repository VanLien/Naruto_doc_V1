-file("src/mod/hallows/hallows_lib.erl", 1).

-module(hallows_lib).

-lager_records([{combat_drama,
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
		{hallows_look_data,
		 [id, name, attr, is_item, time, loss]},
		{hallows_looks, [ver, id, endtime, eqm_hallows]},
		{hallows_quest_data, [id, hid, items, progress]},
		{hallows_data,
		 [id, step, name, attr, loss, max_lucky, clear_limit,
		  clear_time, reward, notice, open_desc, skill_order]},
		{hallows_skill, [ver, pos, lev, skill_bid, attr]},
		{hallows,
		 [ver, id, step, lucky, lucky_endtime, power, base_attr,
		  add_attr, eqm, skill, seal, reward, rebirth_loss,
		  is_notice, look_id, refine_lev]},
		{m_hallows,
		 [ver, hallows_list, all_lv, attr_list, quest_list,
		  look_list, look_quest_list]},
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

-export([is_spirit/1, get_all_step/1,
	 get_hallows_attr/3, get_hallows_attr/7,
	 gen_fight_object/2, gen_def_fight_object/3,
	 gen_def_fight_object/8, get_hallows_info/2,
	 get_hallows_info2/2, get_hallows_refine/2]).

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

-file("src/mod/hallows/hallows_lib.erl", 20).

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

-file("src/mod/hallows/hallows_lib.erl", 21).

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

-file("src/mod/hallows/hallows_lib.erl", 22).

-file("inc/hallows.hrl", 1).

-record(m_hallows,
	{ver = 3, hallows_list = [], all_lv = 0, attr_list = [],
	 quest_list = [], look_list = [], look_quest_list = []}).

-record(hallows,
	{ver = 4, id = 0, step = 0, lucky = 0,
	 lucky_endtime = 0, power = 0, base_attr = [],
	 add_attr = [], eqm = [], skill = [], seal = 0,
	 reward = [], rebirth_loss = [], is_notice = 0,
	 look_id = 0, refine_lev = 0}).

-record(hallows_skill,
	{ver = 1, pos = 0, lev = 0, skill_bid = 0, attr = []}).

-record(hallows_data,
	{id = 0, step = 0, name = <<>>, attr = [], loss = [],
	 max_lucky = 0, clear_limit = 0, clear_time = 0,
	 reward = [], notice = <<>>, open_desc = <<>>,
	 skill_order = []}).

-record(hallows_quest_data,
	{id = 0, hid = 0, items = [], progress = []}).

-record(hallows_looks,
	{ver = 1, id = 0, endtime = 0, eqm_hallows = 0}).

-record(hallows_look_data,
	{id = 0, name = <<>>, attr = [], is_item = 0, time = 0,
	 loss = []}).

-file("src/mod/hallows/hallows_lib.erl", 23).

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

-file("src/mod/hallows/hallows_lib.erl", 24).

-spec is_spirit(#item{}) -> false | true.

is_spirit(#item{type = Type}) ->
    lists:member(Type, [19, 20, 21, 22]).

-spec get_all_step(#role{}) -> pos_integer().

get_all_step(#role{m_hallows =
		       #m_hallows{hallows_list = HallowsList}}) ->
    get_all_step(HallowsList);
get_all_step(NewList) -> get_all_step(NewList, 0).

get_all_step([], AllStep) -> AllStep;
get_all_step([#hallows{step = Step} | Rest],
	     OldAllStep) ->
    get_all_step(Rest, Step + OldAllStep).

-spec get_hallows_attr(#role{} | #role_robot{},
		       pos_integer(), pos_integer()) -> list().

get_hallows_attr(Role = #role{}, Type, HallowsId) ->
    case hallows:get_hallows(Role, HallowsId) of
      #hallows{base_attr = BaseAttr, add_attr = AddAttr} ->
	  HallowsAttr = item_lib:merge(BaseAttr, AddAttr),
	  Ratio = hallows_data:career_ratio(Type),
	  do_calc_ratio(Ratio, HallowsAttr);
      _ -> []
    end.

-spec get_hallows_attr(pos_integer(), pos_integer(),
		       pos_integer(), list(), pos_integer(), pos_integer(),
		       pos_integer()) -> list().

get_hallows_attr(HallowsId, Step, SkillLev, Looks,
		 Lucky, Seal, Type) ->
    case hallows_data:get({HallowsId, Step}) of
      #hallows_data{attr = BaseAttr} ->
	  SkillL = hallows_data:skill_attr(HallowsId),
	  AllSkillL = lists:flatten([SkillAttr
				     || {SkillAttr, SLev} <- SkillL,
					SkillLev >= SLev]),
	  SealAttr = [{AttrId, Val * Seal}
		      || {AttrId, Val}
			     <- hallows_data:get_const(stone_attribute)],
	  TempAttr = calc_tmp_attr(HallowsId, Step, Lucky),
	  HallowsAttr = item_lib:merge(AllSkillL ++
					 SealAttr ++ TempAttr,
				       BaseAttr),
	  LooksAttr = hallows_look:calc_look_attr(Looks),
	  NewHallowsAttr = calc_base_attr_per(LooksAttr,
					      HallowsAttr),
	  Ratio = hallows_data:career_ratio(Type),
	  do_calc_ratio(Ratio, NewHallowsAttr);
      _ -> []
    end.

do_calc_ratio([], Attr) -> Attr;
do_calc_ratio([{Atom, Ratio} | Rest], Acc) ->
    case lists:keyfind(Atom, 1, Acc) of
      false -> do_calc_ratio(Rest, Acc);
      {_, Val} ->
	  NewVal = util:uround(Val * (Ratio / 1000)),
	  NewAcc = lists:keystore(Atom, 1, Acc, {Atom, NewVal}),
	  do_calc_ratio(Rest, NewAcc)
    end;
do_calc_ratio(_, Acc) -> Acc.

calc_tmp_attr(HallowsId, Step, Lucky) ->
    case Step >= hallows_data:get_const(order_max) orelse
	   Lucky =:= 0
	of
      true -> [];
      _ ->
	  #hallows_data{attr = Attr1, max_lucky = MaxLucky} =
	      hallows_data:get({HallowsId, Step}),
	  #hallows_data{attr = Attr2} =
	      hallows_data:get({HallowsId, Step + 1}),
	  Attr3 = do_calc_tmp_attr(Attr2, Attr1, []),
	  Ratio = hallows_data:get_const(temporary_ratio),
	  [{AttrId,
	    util:uround(Lucky / MaxLucky * Val * (Ratio / 1000))}
	   || {AttrId, Val} <- Attr3]
    end.

do_calc_tmp_attr([], _, Acc) -> Acc;
do_calc_tmp_attr([{AttrId, Val} | Rest], Attr,
		 AccAttr) ->
    case lists:keyfind(AttrId, 1, Attr) of
      false -> do_calc_tmp_attr(Rest, Attr, AccAttr);
      {_, OldVal} ->
	  do_calc_tmp_attr(Rest, Attr,
			   [{AttrId, max(0, Val - OldVal)} | AccAttr])
    end.

get_hallows_info(Role, Id) ->
    case hallows:get_hallows(Role, Id) of
      #hallows{id = Id, step = Step, skill = Skills} ->
	  SkillLev = case Skills of
		       [#hallows_skill{lev = SLev} | _] -> SLev;
		       _ -> 1
		     end,
	  {Id, Step, SkillLev};
      _ -> {0, 0, 0}
    end.

get_hallows_info2(Role, Id) ->
    case hallows:get_hallows(Role, Id) of
      #hallows{id = Id, step = Step, skill = Skills,
	       seal = Seal, lucky = Lucky, look_id = LookId} ->
	  SkillLev = case Skills of
		       [#hallows_skill{lev = SLev} | _] -> SLev;
		       _ -> 1
		     end,
	  LookIds = hallows_look:get_look_id(Role),
	  {Id, Step, SkillLev, LookId, LookIds, Lucky, Seal};
      _ -> {0, 0, 0, 0, [], 0, 0}
    end.

get_hallows_refine(Role, Id) ->
    case hallows:get_hallows(Role, Id) of
      #hallows{refine_lev = Lev} -> Lev;
      _ -> 0
    end.

gen_fight_object(R = #role_robot{m_hallows =
				     #m_hallows{hallows_list = HallowsList}},
		 Id)
    when is_integer(Id) andalso Id > 0 ->
    case lists:keyfind(Id, #hallows.id, HallowsList) of
      Hallows = #hallows{} -> gen_fight_object(R, Hallows);
      _ -> []
    end;
gen_fight_object(Role, Id)
    when is_integer(Id) andalso Id > 0 ->
    case hallows:get_hallows(Role, Id) of
      Hallows = #hallows{} -> gen_fight_object(Role, Hallows);
      _ -> []
    end;
gen_fight_object(Role,
		 #hallows{id = Id, step = Step, skill = Skills,
			  look_id = LookId, lucky = Lucky, seal = Seal,
			  refine_lev = RefineLev}) ->
    Attr = hallows_data:get_attr({Id, Step}),
    #hallows_data{name = Name,
		  skill_order = SkillGroupOrder} =
	hallows_data:get({Id, Step}),
    NewSkillGroupOrder = [util:if_true(LookId =:= 0,
				       SkillGroupOrder,
				       hallows_data:skill_look_order({Id,
								      LookId}))],
    AllSkills = [util:if_true(LookId =:= 0, SkillId,
			      hallows_data:skill_look_bid({SkillId, LookId}))
		 || #hallows_skill{skill_bid = SkillId} <- Skills],
    {ActiveSkillIds, PassiveSkillIds} =
	skill_lib:split_skills(AllSkills),
    ActiveSkills = [skill_data:get_skill(SId)
		    || SId <- ActiveSkillIds],
    PassiveSkills = [skill_data:get_skill(SId)
		     || SId <- PassiveSkillIds],
    SkillOrder = lists:filtermap(fun (GroupId) ->
					 case lists:keyfind(GroupId,
							    #skill_data.group,
							    ActiveSkills)
					     of
					   false -> {true, 0};
					   #skill_data{bid = SId} -> {true, SId}
					 end
				 end,
				 NewSkillGroupOrder),
    SkillLev = case Skills of
		 [#hallows_skill{lev = SLev} | _] -> SLev;
		 _ -> 1
	       end,
    LookIds = hallows_look:get_look_id(Role),
    ExtraData = [{3, Lucky}, {4, Seal}, {9, RefineLev}],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhallows_lib175, _,
       {__Levelhallows_lib175, __Traceshallows_lib175}}
	  when __Levelhallows_lib175 band 128 /= 0 orelse
		 __Traceshallows_lib175 /= [] ->
	  lager:do_log(debug,
		       [{module, hallows_lib}, {function, gen_fight_object},
			{line, 175}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("圣器战斗信息 id=~w step=~w ActiveSkillIds=~w "
				     "PassiveSkillIds=~w",
				     [Id, Step, ActiveSkillIds,
				      PassiveSkillIds]),
		       none, 4096, 128, __Levelhallows_lib175,
		       __Traceshallows_lib175, lager_event,
		       __Pidhallows_lib175);
      _ -> ok
    end,
    [#fight_object{base_attr = Attr, fight_attr = Attr,
		   hp = Attr#attr.hp_max, hp_max = Attr#attr.hp_max,
		   object_id = Id, object_bid = Id, object_name = Name,
		   lev = Step, star = LookId, object_type = 4,
		   active_skills = ActiveSkills,
		   passive_skills = PassiveSkills,
		   skill_order = SkillOrder,
		   initial_hp_max = Attr#attr.hp_max,
		   awaken_type = SkillLev, hallows_looks = LookIds,
		   extra_data = ExtraData}];
gen_fight_object(_Role, _) -> [].

gen_def_fight_object(Id, Step, SkillLev) when Id > 0 ->
    Attr = hallows_data:get_attr({Id, Step}),
    #hallows_data{name = Name,
		  skill_order = SkillGroupOrder} =
	hallows_data:get({Id, Step}),
    {AllSkills, _, _} = hallows_data:get_skill({Id,
						SkillLev}),
    {ActiveSkillIds, PassiveSkillIds} =
	skill_lib:split_skills([AllSkills]),
    ActiveSkills = [skill_data:get_skill(SId)
		    || SId <- ActiveSkillIds],
    PassiveSkills = [skill_data:get_skill(SId)
		     || SId <- PassiveSkillIds],
    SkillOrder = lists:filtermap(fun (GroupId) ->
					 case lists:keyfind(GroupId,
							    #skill_data.group,
							    ActiveSkills)
					     of
					   false -> {true, 0};
					   #skill_data{bid = SId} -> {true, SId}
					 end
				 end,
				 SkillGroupOrder),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhallows_lib211, _,
       {__Levelhallows_lib211, __Traceshallows_lib211}}
	  when __Levelhallows_lib211 band 128 /= 0 orelse
		 __Traceshallows_lib211 /= [] ->
	  lager:do_log(debug,
		       [{module, hallows_lib},
			{function, gen_def_fight_object}, {line, 211},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("机器人圣器战斗信息 id=~w step=~w ActiveSkillIds=~w "
				     "PassiveSkillIds=~w",
				     [Id, Step, ActiveSkillIds,
				      PassiveSkillIds]),
		       none, 4096, 128, __Levelhallows_lib211,
		       __Traceshallows_lib211, lager_event,
		       __Pidhallows_lib211);
      _ -> ok
    end,
    [#fight_object{base_attr = Attr, fight_attr = Attr,
		   hp = Attr#attr.hp_max, hp_max = Attr#attr.hp_max,
		   object_id = Id, object_bid = Id, object_name = Name,
		   lev = Step, object_type = 4,
		   active_skills = ActiveSkills,
		   passive_skills = PassiveSkills,
		   skill_order = SkillOrder,
		   initial_hp_max = Attr#attr.hp_max,
		   awaken_type = SkillLev}];
gen_def_fight_object(_, _, _) -> [].

-spec gen_def_fight_object(pos_integer(), pos_integer(),
			   pos_integer(), pos_integer(), list(), pos_integer(),
			   pos_integer(), pos_integer()) -> list().

gen_def_fight_object(Id, Step, SkillLev, LookId,
		     AllLookIds, Lucky, Seal, RefineLev)
    when Id > 0 ->
    Attr = hallows_data:get_attr({Id, Step}),
    #hallows_data{name = Name,
		  skill_order = SkillGroupOrder} =
	hallows_data:get({Id, Step}),
    NewSkillGroupOrder = [util:if_true(LookId =:= 0,
				       SkillGroupOrder,
				       hallows_data:skill_look_order({Id,
								      LookId}))],
    {AllSkillsT, _, _} = hallows_data:get_skill({Id,
						 SkillLev}),
    AllSkills = [util:if_true(LookId =:= 0, AllSkillsT,
			      hallows_data:skill_look_bid({AllSkillsT,
							   LookId}))],
    {ActiveSkillIds, PassiveSkillIds} =
	skill_lib:split_skills(AllSkills),
    ActiveSkills = [skill_data:get_skill(SId)
		    || SId <- ActiveSkillIds],
    PassiveSkills = [skill_data:get_skill(SId)
		     || SId <- PassiveSkillIds],
    SkillOrder = lists:filtermap(fun (GroupId) ->
					 case lists:keyfind(GroupId,
							    #skill_data.group,
							    ActiveSkills)
					     of
					   false -> {true, 0};
					   #skill_data{bid = SId} -> {true, SId}
					 end
				 end,
				 NewSkillGroupOrder),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhallows_lib246, _,
       {__Levelhallows_lib246, __Traceshallows_lib246}}
	  when __Levelhallows_lib246 band 128 /= 0 orelse
		 __Traceshallows_lib246 /= [] ->
	  lager:do_log(debug,
		       [{module, hallows_lib},
			{function, gen_def_fight_object}, {line, 246},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("机器人圣器战斗信息 id=~w step=~w ActiveSkillIds=~w "
				     "PassiveSkillIds=~w",
				     [Id, Step, ActiveSkillIds,
				      PassiveSkillIds]),
		       none, 4096, 128, __Levelhallows_lib246,
		       __Traceshallows_lib246, lager_event,
		       __Pidhallows_lib246);
      _ -> ok
    end,
    ExtraData = [{3, Lucky}, {4, Seal}, {9, RefineLev}],
    [#fight_object{base_attr = Attr, fight_attr = Attr,
		   hp = Attr#attr.hp_max, hp_max = Attr#attr.hp_max,
		   object_id = Id, object_bid = Id, object_name = Name,
		   lev = Step, star = LookId, object_type = 4,
		   active_skills = ActiveSkills,
		   passive_skills = PassiveSkills,
		   skill_order = SkillOrder,
		   initial_hp_max = Attr#attr.hp_max,
		   awaken_type = SkillLev, hallows_looks = AllLookIds,
		   extra_data = ExtraData}];
gen_def_fight_object(_, _, _, _, _, _, _, _) -> [].

calc_base_attr_per([], Attr) -> Attr;
calc_base_attr_per([{atk_per, Ratio} | Other], Attr) ->
    case lists:keyfind(atk, 1, Attr) of
      {_, Val} ->
	  NewVal = util:round(Val + Val * (Ratio / 1000)),
	  NewAttr = lists:keystore(atk, 1, Attr, {atk, NewVal}),
	  calc_base_attr_per(Other, NewAttr);
      _ -> calc_base_attr_per(Other, Attr)
    end;
calc_base_attr_per([{hp_max_per, Ratio} | Other],
		   Attr) ->
    case lists:keyfind(hp_max, 1, Attr) of
      {_, Val} ->
	  NewVal = util:round(Val + Val * (Ratio / 1000)),
	  NewAttr = lists:keystore(hp_max, 1, Attr,
				   {hp_max, NewVal}),
	  calc_base_attr_per(Other, NewAttr);
      _ -> calc_base_attr_per(Other, Attr)
    end;
calc_base_attr_per([AddAttr | Other], Attr) ->
    NewAttr = item_lib:merge(AddAttr, Attr),
    calc_base_attr_per(Other, NewAttr).


