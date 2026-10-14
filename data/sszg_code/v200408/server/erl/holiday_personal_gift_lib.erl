-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      1).

-module(holiday_personal_gift_lib).

-lager_records([{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]},
		{halidom, [ver, id, lev, exp, lev_num, step, all_attr]},
		{m_halidom, [ver, list]},
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
		{m_holiday_personal_gift,
		 [ver, period, start_time, end_time, award_id, count,
		  limit_count, ext]},
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

-export([calculate/1, ref_center_max_score/1, get_max/1,
	 calc_personal_score/1, get_standard_score/4,
	 calc_lable/2]).

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

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      17).

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

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      18).

-file("inc/holiday_personal_gift.hrl", 1).

-record(m_holiday_personal_gift,
	{ver = 1, period = 0  :: non_neg_integer(),
	 start_time = 0, end_time = 0, award_id = 0, count = 0,
	 limit_count = 0, ext = []}).

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      19).

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

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      20).

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

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      21).

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

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      22).

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

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      23).

-file("inc/halidom.hrl", 1).

-record(m_halidom, {ver = 1, list = []}).

-record(halidom,
	{ver = 1, id = 0, lev = 1, exp = 0, lev_num = 0,
	 step = 0, all_attr = []}).

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      24).

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

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      25).

-file("inc/vip.hrl", 1).

-record(m_vip,
	{ver = 2, lev = 0, lev_reward = [], tired_charge = []}).

-record(vip_data,
	{lev = 0  :: non_neg_integer(),
	 gold = 0  :: non_neg_integer(), price = []  :: list(),
	 old_price = []  :: list(), items = []  :: list(),
	 ext_reward = []}).

-record(vip_effect_data,
	{name = <<>>  :: bitstring(),
	 val = 0  :: non_neg_integer()}).

-file("src/mod/holiday_personal_gift/holiday_persona"
      "l_gift_lib.erl",
      26).

-spec calculate(#role{}) -> {boolean(), pos_integer(),
			     pos_integer()}.

calculate(Role = #role{name = Name, id = Id,
		       m_vip = #m_vip{lev = VipLev}}) ->
    WorldLev = world_lev:get_world_lev(),
    PersonalScore = calc_personal_score(Role),
    VipRange = holiday_personal_gift_data:vip_range(),
    Range = get_diff1(VipLev, VipRange),
    VipId = holiday_personal_gift_data:vip_id(Range),
    StandardScore = get_standard_score([1, 2, 3, 4, 5, 6, 7,
					8, 9],
				       WorldLev, VipLev, []),
    case length(StandardScore) =/= 0 of
      true ->
	  Lables = calc_lable(StandardScore, PersonalScore),
	  do_calculate(Lables, VipId, WorldLev);
      _ -> {false, 0, 0, 0, 0}
    end.

do_calculate([], _VipId, _WorldLev) ->
    {false, 0, 0, 0, 0};
do_calculate([{Lable1, Diff, _} | Lables], VipId,
	     WorldLev) ->
    case holiday_personal_gift_data:award({Lable1, VipId})
	of
      {AwardId, LimitCount, MinLev, MaxLev}
	  when WorldLev >= MinLev andalso WorldLev =< MaxLev ->
	  {true, AwardId, LimitCount, Lable1, Diff};
      _ -> do_calculate(Lables, VipId, WorldLev)
    end;
do_calculate([_Err | Lables], VipId, WorldLev) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_personal_gift_lib66, _,
       {__Levelholiday_personal_gift_lib66,
	__Tracesholiday_personal_gift_lib66}}
	  when __Levelholiday_personal_gift_lib66 band 8 /= 0
		 orelse __Tracesholiday_personal_gift_lib66 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_personal_gift_lib},
			{function, do_calculate}, {line, 66},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("个人推送礼包出现未知的数据:~w", [_Err]), none, 4096,
		       8, __Levelholiday_personal_gift_lib66,
		       __Tracesholiday_personal_gift_lib66, lager_event,
		       __Pidholiday_personal_gift_lib66);
      _ -> ok
    end,
    do_calculate(Lables, VipId, WorldLev).

ref_center_max_score(Role = #role{m_vip =
				      #m_vip{lev = VipLev}}) ->
    WorldLev = world_lev:get_world_lev(),
    PersonalScore = calc_personal_score(Role),
    do_ref_center_max_score(PersonalScore, WorldLev,
			    VipLev).

do_ref_center_max_score([], _WorldLev, _VipLev) -> ok;
do_ref_center_max_score([{Type, Score} | Others],
			WorldLev, VipLev) ->
    local_ref_max({WorldLev, VipLev, Type, Score}),
    do_ref_center_max_score(Others, WorldLev, VipLev).

local_ref_max({WorldLev, VipLev, Type, Score}) ->
    case ets:lookup(local_personal_gift_score,
		    {WorldLev, VipLev, Type})
	of
      [{_, {Type, LocalScore}} | _] when Score > LocalScore ->
	  d_ets_lib:save_d_ets(local_personal_gift_score,
			       {{WorldLev, VipLev, Type}, {Type, Score}}),
	  big_world_lib:cast(center, c_holiday_personal_gift_mgr,
			     info,
			     [{ref_center, WorldLev, VipLev, Type, Score}]);
      [] ->
	  d_ets_lib:save_d_ets(local_personal_gift_score,
			       {{WorldLev, VipLev, Type}, {Type, Score}}),
	  big_world_lib:cast(center, c_holiday_personal_gift_mgr,
			     info,
			     [{ref_center, WorldLev, VipLev, Type, Score}]);
      _ -> skip
    end,
    ok.

-spec get_standard_score(list(), pos_integer(), #role{},
			 list()) -> list().

get_standard_score([], _WorldLev, _VipLev, List) ->
    List;
get_standard_score([Type | T], WorldLev, VipLev,
		   List) ->
    [{Min, Max}] = case
		     holiday_personal_gift_data:lev_range(Type)
		       of
		     [{Min1, Max1}] -> [{Min1, Max1}];
		     _ -> [{0, 0}]
		   end,
    {_, Score} = case get_max({WorldLev - Min + 1,
			       WorldLev + Max, VipLev, Type, 0})
		     of
		   {Type, MaxScore} -> {Type, MaxScore};
		   _ -> {Type, 0}
		 end,
    case Score > 0 of
      true ->
	  get_standard_score(T, WorldLev, VipLev,
			     [{Type, Score} | List]);
      _ -> get_standard_score(T, WorldLev, VipLev, List)
    end.

get_max({WorldLev, MaxWorldLev, _VipLev, Type,
	 MaxScore})
    when WorldLev > MaxWorldLev ->
    {Type, MaxScore};
get_max({WorldLev, MaxWorldLev, VipLev, Type,
	 MaxScore}) ->
    case ets:lookup(local_personal_gift_score,
		    {WorldLev, VipLev, Type})
	of
      [{_, {_, Score}} | _] when Score > MaxScore ->
	  get_max({WorldLev + 1, MaxWorldLev, VipLev, Type,
		   Score});
      _ ->
	  get_max({WorldLev + 1, MaxWorldLev, VipLev, Type,
		   MaxScore})
    end.

-spec calc_personal_score(#role{}) -> list().

calc_personal_score(Role) ->
    do_calc_personal_score([1, 2, 3, 4, 5, 6, 7, 8, 9],
			   Role, []).

do_calc_personal_score([], _Role, PersonalScore) ->
    PersonalScore;
do_calc_personal_score([1 | Others], Role = #role{},
		       PersonalScore) ->
    PartnerList = get_partners(Role),
    ScoreList =
	[holiday_personal_gift_data:partner_score({Bid, Star})
	 || #partner{bid = Bid, star = Star} <- PartnerList],
    do_calc_personal_score(Others, Role,
			   [{1, lists:sum(ScoreList)} | PersonalScore]);
do_calc_personal_score([2 | Others], Role = #role{},
		       PersonalScore) ->
    PartnerList = get_partners(Role),
    Eqms = [Eqm || #partner{eqm = Eqm} <- PartnerList],
    ScoreList = [holiday_personal_gift_data:eqm_score(SetId)
		 || #item{base_id = SetId} <- lists:flatten(Eqms)],
    do_calc_personal_score(Others, Role,
			   [{2, lists:sum(ScoreList)} | PersonalScore]);
do_calc_personal_score([3 | Others], Role = #role{},
		       PersonalScore) ->
    PartnerList = get_partners(Role),
    Eqms = [Eqm || #partner{holy_eqm = Eqm} <- PartnerList],
    SetIds = [{SetId, item_data:get_star_jie(Bid),
	       list_util:keyfind(10, Extra, 0)}
	      || #item{set_id = SetId, base_id = Bid, extra = Extra}
		     <- lists:flatten(Eqms)],
    Fun1 = fun ({SetId, Star, Jie}) ->
		   case holiday_personal_gift_data:holy_eqm_score({SetId,
								   Star, Jie})
		       of
		     Score when Score =/= 0 -> Score;
		     _ ->
			 holiday_personal_gift_data:holy_eqm_score({SetId, 6,
								    2})
		   end
	   end,
    Fun2 = fun ({SetId, Star, Jie}) ->
		   case
		     holiday_personal_gift_data:holy_eqm_one_score({SetId,
								    Star, Jie})
		       of
		     Score when Score =/= 0 -> Score;
		     _ ->
			 holiday_personal_gift_data:holy_eqm_one_score({SetId,
									6, 2})
		   end
	   end,
    ScoreList = [Fun1({SetId, Star, Jie}) +
		   RefTime * Fun2({SetId, Star, Jie})
		 || {SetId, {Star, Jie}, RefTime} <- SetIds],
    do_calc_personal_score(Others, Role,
			   [{3, lists:sum(ScoreList)} | PersonalScore]);
do_calc_personal_score([4 | Others], Role = #role{},
		       PersonalScore) ->
    PartnerList = get_partners(Role),
    Artifacts = [Artifact
		 || #partner{artifacts = Artifact} <- PartnerList],
    ScoreList =
	[holiday_personal_gift_data:aftifact_score(Bid)
	 || {_, #item{base_id = Bid}}
		<- lists:flatten(Artifacts)],
    do_calc_personal_score(Others, Role,
			   [{4, lists:sum(ScoreList)} | PersonalScore]);
do_calc_personal_score([5 | Others], Role = #role{},
		       PersonalScore) ->
    PartnerList = get_partners(Role),
    Skills = [Skill
	      || #partner{dower_skill = Skill} <- PartnerList],
    ScoreList =
	[holiday_personal_gift_data:skill_score(SkillId)
	 || {_, SkillId} <- lists:flatten(Skills)],
    do_calc_personal_score(Others, Role,
			   [{5, lists:sum(ScoreList)} | PersonalScore]);
do_calc_personal_score([6 | Others],
		       Role = #role{m_hallows =
					#m_hallows{hallows_list = HallowsList}},
		       PersonalScore) ->
    ScoreList =
	[holiday_personal_gift_data:hallow_lev_score(Step) +
	   Lucky
	 || #hallows{step = Step, lucky = Lucky} <- HallowsList],
    do_calc_personal_score(Others, Role,
			   [{6, lists:sum(ScoreList)} | PersonalScore]);
do_calc_personal_score([7 | Others],
		       Role = #role{m_hallows =
					#m_hallows{hallows_list = HallowsList}},
		       PersonalScore) ->
    ScoreList =
	[holiday_personal_gift_data:hallow_lev_score(RefineLev)
	 || #hallows{refine_lev = RefineLev} <- HallowsList],
    do_calc_personal_score(Others, Role,
			   [{7, lists:sum(ScoreList)} | PersonalScore]);
do_calc_personal_score([8 | Others],
		       Role = #role{m_halidom = #m_halidom{list = List}},
		       PersonalScore) ->
    Levs = [Lev || #halidom{lev = Lev} <- List],
    case length(Levs) =:= 0 of
      true ->
	  do_calc_personal_score(Others, Role,
				 [{8, 0} | PersonalScore]);
      _ ->
	  do_calc_personal_score(Others, Role,
				 [{8,
				   holiday_personal_gift_data:halidom_score(lists:max(Levs))}
				  | PersonalScore])
    end;
do_calc_personal_score([9 | Others],
		       Role = #role{m_guild_skill =
					#m_guild_skill{groups = GroupList}},
		       PersonalScore) ->
    Fun = fun (SkillIds, Group) ->
		  case length(SkillIds) =:= 0 of
		    true -> {6, Group rem 1000 - 1};
		    _ -> {length(SkillIds), Group rem 1000}
		  end
	  end,
    SkillLevs = [Fun(SkillIds, Group)
		 || #guild_skill_group{skill_ids = SkillIds,
				       group_id = Group}
			<- GroupList],
    ScoreList =
	[holiday_personal_gift_data:guild_skill_score({Id,
						       Group})
	 || {Id, Group} <- SkillLevs],
    do_calc_personal_score(Others, Role,
			   [{9, lists:sum(ScoreList)} | PersonalScore]).

get_partners(Role) ->
    #formation_sys{pos_info = PosInfo} =
	formation:get_sys_formation(Role, 0),
    Ids = [IdT || #formation_pos{id = IdT} <- PosInfo],
    PartnerList = [partner_lib:get_partner(Role, Id)
		   || Id <- Ids,
		      partner_lib:get_partner(Role, Id) =/= false],
    PartnerList.

-spec calc_lable(list(), list()) -> list().

calc_lable(StandardScore, PersonalScore) ->
    do_calc_lable(PersonalScore, StandardScore, []).

do_calc_lable([], _StandardScore, Lables) ->
    list_util:mkeysort2([{r, 2}, {s, 3}], Lables);
do_calc_lable([{1, PScore} | Others], StandardScore,
	      Lables) ->
    SScore = list_util:keyfind(1, StandardScore, 1),
    Diff = max((SScore - PScore) / SScore, 0) * 100,
    DiffList =
	holiday_personal_gift_data:partner_star_list(),
    case get_diff(Diff, DiffList) of
      RightDiff = {_, _} ->
	  {Id, _} =
	      holiday_personal_gift_data:partner_star_lable(RightDiff),
	  do_calc_lable(Others, StandardScore,
			[{Id, Diff, 1} | Lables]);
      _ -> do_calc_lable(Others, StandardScore, Lables)
    end;
do_calc_lable([{2, PScore} | Others], StandardScore,
	      Lables) ->
    SScore = list_util:keyfind(2, StandardScore, 1),
    Diff = max((SScore - PScore) / SScore, 0) * 100,
    DiffList = holiday_personal_gift_data:eqm_list(),
    case get_diff(Diff, DiffList) of
      RightDiff = {_, _} ->
	  {Id, _} =
	      holiday_personal_gift_data:eqm_lable(RightDiff),
	  do_calc_lable(Others, StandardScore,
			[{Id, Diff, 9} | Lables]);
      _ -> do_calc_lable(Others, StandardScore, Lables)
    end;
do_calc_lable([{3, PScore} | Others], StandardScore,
	      Lables) ->
    SScore = list_util:keyfind(3, StandardScore, 1),
    Diff = max((SScore - PScore) / SScore, 0) * 100,
    DiffList = holiday_personal_gift_data:holy_eqm_list(),
    case get_diff(Diff, DiffList) of
      RightDiff = {_, _} ->
	  {Id, _} =
	      holiday_personal_gift_data:holy_eqm_lable(RightDiff),
	  do_calc_lable(Others, StandardScore,
			[{Id, Diff, 2} | Lables]);
      _ -> do_calc_lable(Others, StandardScore, Lables)
    end;
do_calc_lable([{4, PScore} | Others], StandardScore,
	      Lables) ->
    SScore = list_util:keyfind(4, StandardScore, 1),
    Diff = max((SScore - PScore) / SScore, 0) * 100,
    DiffList = holiday_personal_gift_data:aftifact_list(),
    case get_diff(Diff, DiffList) of
      RightDiff = {_, _} ->
	  {Id, _} =
	      holiday_personal_gift_data:aftifact_lable(RightDiff),
	  do_calc_lable(Others, StandardScore,
			[{Id, Diff, 3} | Lables]);
      _ -> do_calc_lable(Others, StandardScore, Lables)
    end;
do_calc_lable([{5, PScore} | Others], StandardScore,
	      Lables) ->
    SScore = list_util:keyfind(5, StandardScore, 1),
    Diff = max((SScore - PScore) / SScore, 0) * 100,
    DiffList = holiday_personal_gift_data:skill_list(),
    case get_diff(Diff, DiffList) of
      RightDiff = {_, _} ->
	  {Id, _} =
	      holiday_personal_gift_data:skill_lable(RightDiff),
	  do_calc_lable(Others, StandardScore,
			[{Id, Diff, 6} | Lables]);
      _ -> do_calc_lable(Others, StandardScore, Lables)
    end;
do_calc_lable([{6, PScore} | Others], StandardScore,
	      Lables) ->
    SScore = list_util:keyfind(6, StandardScore, 1),
    Diff = max((SScore - PScore) / SScore, 0) * 100,
    DiffList = holiday_personal_gift_data:hallow_lev_list(),
    case get_diff(Diff, DiffList) of
      RightDiff = {_, _} ->
	  {Id, _} =
	      holiday_personal_gift_data:hallow_lev_lable(RightDiff),
	  do_calc_lable(Others, StandardScore,
			[{Id, Diff, 5} | Lables]);
      _ -> do_calc_lable(Others, StandardScore, Lables)
    end;
do_calc_lable([{7, PScore} | Others], StandardScore,
	      Lables) ->
    SScore = list_util:keyfind(7, StandardScore, 1),
    Diff = max((SScore - PScore) / SScore, 0) * 100,
    DiffList =
	holiday_personal_gift_data:hallow_refine_list(),
    case get_diff(Diff, DiffList) of
      RightDiff = {_, _} ->
	  {Id, _} =
	      holiday_personal_gift_data:hallow_refine_lable(RightDiff),
	  do_calc_lable(Others, StandardScore,
			[{Id, Diff, 4} | Lables]);
      _ -> do_calc_lable(Others, StandardScore, Lables)
    end;
do_calc_lable([{8, PScore} | Others], StandardScore,
	      Lables) ->
    SScore = list_util:keyfind(8, StandardScore, 1),
    Diff = max((SScore - PScore) / SScore, 0) * 100,
    DiffList = holiday_personal_gift_data:halidom_list(),
    case get_diff(Diff, DiffList) of
      RightDiff = {_, _} ->
	  {Id, _} =
	      holiday_personal_gift_data:halidom_lable(RightDiff),
	  do_calc_lable(Others, StandardScore,
			[{Id, Diff, 7} | Lables]);
      _ -> do_calc_lable(Others, StandardScore, Lables)
    end;
do_calc_lable([{9, PScore} | Others], StandardScore,
	      Lables) ->
    SScore = list_util:keyfind(9, StandardScore, 1),
    Diff = max((SScore - PScore) / SScore, 0) * 100,
    DiffList =
	holiday_personal_gift_data:guild_skill_list(),
    case get_diff(Diff, DiffList) of
      RightDiff = {_, _} ->
	  {Id, _} =
	      holiday_personal_gift_data:guild_skill_lable(RightDiff),
	  do_calc_lable(Others, StandardScore,
			[{Id, Diff, 8} | Lables]);
      _ -> do_calc_lable(Others, StandardScore, Lables)
    end.

get_diff(_Diff, []) -> undefined;
get_diff(Diff, [{Min, Max} | Others]) ->
    case Diff >= Min andalso Diff < Max of
      true -> {Min, Max};
      _ -> get_diff(Diff, Others)
    end;
get_diff(Diff, [_ | Others]) -> get_diff(Diff, Others).

get_diff1(_Range, []) -> undefined;
get_diff1(Range, [{Min, Max} | Others]) ->
    case Range >= Min andalso Range =< Max of
      true -> {Min, Max};
      _ -> get_diff(Range, Others)
    end;
get_diff1(Range, [_ | Others]) ->
    get_diff(Range, Others).


