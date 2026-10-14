-file("data/color.erl", 1).

-file("src/mod/misc/color.erl", 1).

-module(color).

-lager_records([{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]},
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

-export([msg/2, format/1, string/2, bin_join/3,
	 kf_name/2]).

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

-file("src/mod/misc/color.erl", 14).

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

-file("src/mod/misc/color.erl", 15).

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

-file("src/mod/misc/color.erl", 16).

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

-file("src/mod/misc/color.erl", 17).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/mod/misc/color.erl", 18).

kf_name({_, SrvId}, Name) ->
    util:fbin(<<"【S~w】~ts"/utf8>>,
	      [game_lib:get_sid(SrvId), Name]);
kf_name(SrvId, Name) ->
    util:fbin(<<"【S~w】~ts"/utf8>>,
	      [game_lib:get_sid(SrvId), Name]).

-spec msg(bitstring(), list()) -> bitstring().

msg(F, A) -> util:fbin(F, do_msg(A, [])).

do_msg([], Rtn) -> lists:reverse(Rtn);
do_msg([I | T], Rtn) when is_tuple(I) ->
    do_msg(T, [format(I) | Rtn]);
do_msg([I | T], Rtn) -> do_msg(T, [I | Rtn]).

-spec format(tuple()) -> bitstring().

format(L) when is_list(L) ->
    L1 = [format(I) || I <- L],
    bin_join(L1, <<", ">>, <<>>);
format({list, L}) -> format(L);
format(#role{id = {Rid, SrvId}, name = Name}) ->
    format({click,
	    {3, rumor_role, [Rid, Name, SrvId],
	     list_to_binary(["[", Name, "]"])}});
format({name, {_, <<>>}, Name}) ->
    string(rumor_role, Name);
format({name, {_, <<"robot_1">>}, Name}) ->
    string(rumor_role, Name);
format({kf_name, {_, <<"robot_1">>}, Name}) ->
    string(rumor_role, Name);
format({is_kf_name, {Rid, SrvId}, Name}) ->
    case sys_lib:is_local(SrvId) of
      true -> format({name, {Rid, SrvId}, Name});
      _ -> format({kf_name, {Rid, SrvId}, Name})
    end;
format({name, {Rid, SrvId}, Name}) ->
    case get(is_kf) of
      true -> format({kf_name, {Rid, SrvId}, Name});
      _ ->
	  format({click,
		  {3, rumor_role, [Rid, Name, SrvId], Name}})
    end;
format({kf_name, {Rid, SrvId}, Name}) ->
    Sid = game_lib:get_sid(SrvId),
    format({click,
	    {3, rumor_role, [Rid, Name, SrvId],
	     list_to_binary([<<"[S"/utf8>>, integer_to_list(Sid),
			     "]", Name])}});
format({click, {Type, Color, Args, Str}}) ->
    list_to_binary(["<div click=", integer_to_list(Type),
		    "|", string:join([util:to_list(I) || I <- Args], "|"),
		    " fontcolor=", color(Color), ">", Str, "</div>"]);
format({href, {Type, Color, Args, Str}}) ->
    list_to_binary(["<div href=", integer_to_list(Type),
		    "|", string:join([util:to_list(I) || I <- Args], "|"),
		    " fontcolor=", color(Color), ">", Str, "</div>"]);
format({assets, AssetsCode})
    when is_integer(AssetsCode) ->
    list_to_binary([<<"<assets=">>,
		    case is_binary(integer_to_list(AssetsCode)) of
		      false -> list_to_binary(integer_to_list(AssetsCode));
		      true -> integer_to_list(AssetsCode)
		    end,
		    <<"/>">>]);
format({assets, AssetsAtom}) when is_atom(AssetsAtom) ->
    list_to_binary([<<"<assets=">>,
		    case
		      is_binary(integer_to_list(item_data:assets_atom2code(AssetsAtom)))
			of
		      false ->
			  list_to_binary(integer_to_list(item_data:assets_atom2code(AssetsAtom)));
		      true ->
			  integer_to_list(item_data:assets_atom2code(AssetsAtom))
		    end,
		    <<"/>">>]);
format({item_order, {Bid, Num}}) when is_integer(Bid) ->
    format({item_order, {Bid, 1, Num}});
format({item_order, {Bid, _Bind, Num}})
    when is_atom(Bid) orelse Bid < 1000 ->
    AssetsCode = case is_atom(Bid) of
		   true -> item_data:assets_atom2code(Bid);
		   _ -> Bid
		 end,
    list_to_binary([<<"<assets=">>,
		    case is_binary(integer_to_list(AssetsCode)) of
		      false -> list_to_binary(integer_to_list(AssetsCode));
		      true -> integer_to_list(AssetsCode)
		    end,
		    <<"/>">>,
		    case is_binary(integer_to_list(Num)) of
		      false -> list_to_binary(integer_to_list(Num));
		      true -> integer_to_list(Num)
		    end]);
format({item_order, {Bid, Bind, Num}}) ->
    format({item, {Bid, Bind, Num}});
format({item, {Bid, Num}}) when is_integer(Bid) ->
    format({item, {Bid, 1, Num}});
format({item, {Bid, _Bind, Num}})
    when is_atom(Bid) orelse Bid < 1000 ->
    AssetsCode = case is_atom(Bid) of
		   true -> item_data:assets_atom2code(Bid);
		   _ -> Bid
		 end,
    list_to_binary([<<"<assets=">>,
		    case is_binary(integer_to_list(AssetsCode)) of
		      false -> list_to_binary(integer_to_list(AssetsCode));
		      true -> integer_to_list(AssetsCode)
		    end,
		    <<"/>">>,
		    case is_binary(integer_to_list(Num)) of
		      false -> list_to_binary(integer_to_list(Num));
		      true -> integer_to_list(Num)
		    end]);
format({item, {Bid, _Bind, 1}}) when is_integer(Bid) ->
    format({item, Bid});
format({item, {Bid, _Bind, Num}})
    when is_integer(Bid) ->
    Color = color(item:attr(quality, Bid)),
    list_to_binary([<<"<div fontcolor=">>, Color, ">",
		    item:attr(name, Bid), "</div>",
		    string(green, lang:get(<<"x"/utf8>>)),
		    string(green, Num)]);
format({item, Bid}) when is_integer(Bid) ->
    Color = color(item:attr(quality, Bid)),
    list_to_binary([<<"<div fontcolor=">>, Color, ">",
		    item:attr(name, Bid), "</div>"]);
format({item,
	#item{base_id = Bid, quality = Quality,
	      quantity = 1}}) ->
    Color = color(Quality),
    list_to_binary([<<"<div fontcolor=">>, Color, ">",
		    item:attr(name, Bid), "</div>"]);
format({item,
	#item{base_id = Bid, quality = Quality,
	      quantity = N}}) ->
    Color = color(Quality),
    list_to_binary([<<"<div fontcolor=">>, Color, ">",
		    item:attr(name, Bid), "</div>",
		    string(green, lang:get(<<"x"/utf8>>)),
		    string(green, N)]);
format({item,
	#item_base{quality = Quality, name = Name}}) ->
    Color = color(Quality),
    <<"<div fontcolor=", Color/binary, ">", Name/binary,
      "</div>">>;
format({partner_eqm, Bid, UniqId, SrvId}) ->
    #item_base{quality = Quality, name = ItemName} =
	item_data:get(Bid),
    Star = item_data:eqm_star(Bid),
    Color = color(Quality),
    format({click,
	    {10, Color, [UniqId, SrvId],
	     list_to_binary(["[",
			     util:format_ex(lang:get(<<"~wNgôi sao~s"/utf8>>),
					    [Star, ItemName]),
			     "]"])}});
format({partner_artiface, Quality, ItemName, UniqId,
	SrvId}) ->
    Color = color(Quality),
    format({click,
	    {22, Color, [UniqId, SrvId],
	     list_to_binary(["[",
			     util:format_ex(lang:get(<<"~s"/utf8>>),
					    [ItemName]),
			     "]"])}});
format({partner_artifact, Quality, ItemName, UniqId,
	SrvId}) ->
    Offet = 1,
    Color = color(Quality + Offet),
    format({click,
	    {24, Color, [UniqId, SrvId],
	     list_to_binary(["[",
			     util:format_ex(lang:get(<<"~s"/utf8>>),
					    [ItemName]),
			     "]"])}});
format({partner_halo, Quality, ItemName, UniqId,
	SrvId}) ->
    Color = color(Quality),
    format({click,
	    {23, Color, [UniqId, SrvId],
	     list_to_binary(["[",
			     util:format_ex(lang:get(<<"~s"/utf8>>),
					    [ItemName]),
			     "]"])}});
format({combat_replay, {Name, TargetName, ReplayId}}) ->
    format({click,
	    {5, orange, [ReplayId],
	     list_to_binary(["[", Name,
			     color:format({blue, <<" vs ">>}), TargetName,
			     "]"])}});
format({combat_replay,
	{SrvId, Name, TargetName, ReplayId}}) ->
    format({click,
	    {51, orange, [SrvId, ReplayId],
	     list_to_binary(["[", Name,
			     color:format({blue, <<" vs ">>}), TargetName,
			     "]"])}});
format({combat_replay, {ReplayId}}) ->
    format({click,
	    {5, orange, [ReplayId],
	     list_to_binary(["[", lang:get(<<"Nhấp để xem"/utf8>>),
			     "]"])}});
format({combat_replay_hall,
	{HallSrvId, SrvId, Name, TargetName, ReplayId,
	 CombatType}}) ->
    format({click,
	    {57, orange, [ReplayId, SrvId, CombatType, HallSrvId],
	     list_to_binary(["[", Name,
			     color:format({blue, <<" vs ">>}), TargetName,
			     "]"])}});
format({string, {C, S}}) -> string(C, S);
format({string, C, S}) -> string(C, S);
format({role, Name}) -> string(rumor_role, Name);
format({string, S}) -> string(white, S);
format({time, {Color, {Hour, Minu, Sec}}}) ->
    string(Color,
	   util:fbin("~ts:~ts:~ts",
		     [format({time, Hour}), format({time, Minu}),
		      format({time, Sec})]));
format({time, Time}) when is_integer(Time) ->
    case Time >= 10 of
      true -> util:to_binary(Time);
      _ -> util:fbin(lang:get(<<"0~w"/utf8>>), [Time])
    end;
format({binary, S}) -> util:to_binary(S);
format({partner, {Rid, SrvId},
	#partner{id = PartnerId, bid = PartnerBid,
		 star = Star}}) ->
    #partner_base_data{name = PartnerName} =
	partner_data:get_base(PartnerBid),
    format({partner,
	    {PartnerBid, PartnerId, PartnerName, Rid, SrvId, Star,
	     0}});
format({partner,
	{PartnerBid, PartnerId, PartnerName, Rid, SrvId, Star,
	 IsAwake}}) ->
    #partner_base_data{rare_type = RareType} =
	partner_data:get_base(PartnerBid),
    Color = rare_type_color(RareType),
    format({click,
	    {4, Color,
	     [PartnerBid, Rid, SrvId, Star, IsAwake, PartnerId],
	     list_to_binary(["[", PartnerName, "]"])}});
format({partner,
	#partner_base_data{name = PartnerName,
			   rare_type = RareType}}) ->
    Color = rare_type_color(RareType),
    string(Color, PartnerName);
format({partner, {RareType, PartnerName}}) ->
    Color = rare_type_color(RareType),
    string(Color, PartnerName);
format({share_partner, {PartnerBid, ShareId}}) ->
    #partner_base_data{name = PartnerName,
		       rare_type = RareType} =
	partner_data:get_base(PartnerBid),
    Color = rare_type_color(RareType),
    format({click,
	    {29, Color, [PartnerBid, ShareId],
	     list_to_binary(["[", PartnerName, "]"])}});
format({share_badges, {Id, ShareId}}) ->
    {Name, Quality} = room_feat_data:get_badges_name(Id),
    Color = color(Quality),
    format({click,
	    {61, Color, [Id, ShareId],
	     list_to_binary(["[", Name, "]"])}});
format({share_room_feat, {Id, ShareId}}) ->
    #quest_data{name = Name} = room_feat_data:get(Id),
    Color = color_data:get(orange),
    format({click,
	    {62, Color, [Id, ShareId],
	     list_to_binary(["[", Name, "]"])}});
format({share_room_honor, {Point, ShareId}}) ->
    Name = room_feat_data:get_honor_name(Point),
    Color = color_data:get(orange),
    format({click,
	    {63, Color, [ShareId],
	     list_to_binary(["[", Name, "]"])}});
format({share_room_grow, {ShareId}}) ->
    Color = color_data:get(orange),
    format({click,
	    {64, Color, [ShareId],
	     list_to_binary(["[", lang:get(<<"Nhấp để xem"/utf8>>),
			     "]"])}});
format({share_item,
	{RoleId, ShareId,
	 #item{base_id = Bid, quality = Quality,
	       quantity = Quantity}}}) ->
    #item_base{name = Name} = item_data:get(Bid),
    Color = color(Quality),
    format({click,
	    {49, Color, [RoleId, ShareId],
	     list_to_binary(["[", Name, "]",
			     util:format_ex(lang:get(<<"x~w"/utf8>>),
					    [Quantity])])}});
format({feat, {FeatId, OwnerName}}) ->
    #quest_data{name = FeatName} = feat_data:get(FeatId),
    Color = color(2),
    format({click,
	    {25, Color, [FeatId, OwnerName],
	     list_to_binary(["[",
			     util:format_ex(lang:get(<<"Thành tựu-~s"/utf8>>),
					    [FeatName]),
			     "]"])}});
format({arena_elite_share, {Period, ShareId, Sid}}) ->
    Color = color(2),
    format({click,
	    {56, Color, [Period, ShareId, Sid],
	     list_to_binary(["[", lang:get(<<"Nhấp để xem"/utf8>>),
			     "]"])}});
format({Atom, S}) when is_binary(S) -> string(Atom, S);
format({Atom, S}) when is_integer(S) -> string(Atom, S);
format({item_order, L}) when is_list(L) ->
    L1 = [format({item_order, I}) || I <- L],
    bin_join(L1, <<", ">>, <<>>);
format({Atom, L})
    when is_atom(Atom) andalso is_list(L) ->
    L1 = [format({Atom, I}) || I <- L],
    bin_join(L1, <<", ">>, <<>>);
format(_Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcolor199, _, {__Levelcolor199, __Tracescolor199}}
	  when __Levelcolor199 band 8 /= 0 orelse
		 __Tracescolor199 /= [] ->
	  lager:do_log(error,
		       [{module, color}, {function, format}, {line, 199},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("Định dạng màu chữ lỗi:~w", [_Data]),
		       none, 4096, 8, __Levelcolor199, __Tracescolor199,
		       lager_event, __Pidcolor199);
      _ -> ok
    end,
    <<>>.

string(C, S) ->
    Color = color(C),
    Bin = util:to_binary(S),
    <<"<div fontcolor=", Color/binary, ">", Bin/binary,
      "</div>">>.

color(0) -> color_data:get(white);
color(1) -> color_data:get(green);
color(2) -> color_data:get(blue);
color(3) -> color_data:get(purple);
color(4) -> color_data:get(orange);
color(5) -> color_data:get(red);
color(N) when is_integer(N) -> color_data:get(white);
color(A) -> color_data:get(A).

rare_type_color(_) -> orange.

bin_join([], _Split, Bin) -> Bin;
bin_join([I | T], Split, <<>>) -> bin_join(T, Split, I);
bin_join([I | T], Split, Bin) ->
    bin_join(T, Split,
	     <<Bin/binary, Split/binary, I/binary>>).


