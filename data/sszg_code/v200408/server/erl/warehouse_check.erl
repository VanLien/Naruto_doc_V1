-file("src/mod/personal_push_gift/warehouse_check.erl",
      1).

-module(warehouse_check).

-lager_records([{assets,
		 [ver, exp, coin, silver_coin, gold, red_gold, gold_acc,
		  vip_exp, energy, energy_max, energy_time, activity,
		  guild, arena_cent, hero_soul, feat_point, triple_rebate,
		  friend_point, boss_point, star_hun, star_point,
		  arena_guesscent, sky_coin, hero_exp, recruit_hero,
		  recruithigh_hero, expedition_medal, elite_coin,
		  holy_eqm_coin, skin_debris, cluster_coin, home_coin,
		  hallow_refine, cluster_guess_cent, feather_exchange,
		  brave_symbol, peak_guess_cent, hero_soul_coin,
		  acc_recruit_hero, predict_point]},
		{recruit_limit, [key, info]},
		{holiday_info, [camp_id, stats, ext]},
		{recruit_info, [group_id, stats, ext]},
		{m_recruit_award, [ver, list]},
		{m_recruit,
		 [ver, free_cd_end, list, convert_list, convert_state,
		  holiday_list, holy_eqm_lottery, logs,
		  holiday_sprite_lottery_list, lucky_sprites,
		  lucky_holy_eqm, all_score]},
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
		{personal_push_gift_data,
		 [gift_id, type_id, charge_id, limit_count, money,
		  costly_num, valid_time, open_cond, warehouse_id, award,
		  over_time, buy_count, trigger_id]},
		{m_personal_push,
		 [ver, fire_type, fire_not_buy, fire_gift, ext]},
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

-export([check/2]).

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

-file("src/mod/personal_push_gift/warehouse_check.erl",
      9).

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

-file("src/mod/personal_push_gift/warehouse_check.erl",
      10).

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

-file("src/mod/personal_push_gift/warehouse_check.erl",
      11).

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

-file("src/mod/personal_push_gift/warehouse_check.erl",
      12).

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

-file("src/mod/personal_push_gift/warehouse_check.erl",
      13).

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

-file("src/mod/personal_push_gift/warehouse_check.erl",
      14).

-file("inc/recruit.hrl", 1).

-record(m_recruit,
	{ver = 7, free_cd_end = 0, list = [], convert_list = [],
	 convert_state = [], holiday_list = [],
	 holy_eqm_lottery = [], logs = [],
	 holiday_sprite_lottery_list = [], lucky_sprites = [],
	 lucky_holy_eqm = [], all_score = 0}).

-record(m_recruit_award, {ver = 1, list = []}).

-record(recruit_info,
	{group_id = 0, stats = #{}, ext = #{}}).

-record(holiday_info,
	{camp_id = 0, stats = #{}, ext = #{}}).

-record(recruit_limit, {key, info = #{}}).

-file("src/mod/personal_push_gift/warehouse_check.erl",
      15).

-file("inc/assets.hrl", 1).

-file("inc/game_assets.hrl", 1).

-file("inc/assets.hrl", 12).

-record(assets,
	{ver = -1, exp = 0, coin = 0, silver_coin = 0, gold = 0,
	 red_gold = 0, gold_acc = 0, vip_exp = 0, energy = 0,
	 energy_max = 0, energy_time = 0, activity = 0,
	 guild = 0, arena_cent = 0, hero_soul = 0,
	 feat_point = 0, triple_rebate = 0, friend_point = 0,
	 boss_point = 0, star_hun = 0, star_point = 0,
	 arena_guesscent = 0, sky_coin = 0, hero_exp = 0,
	 recruit_hero = 0, recruithigh_hero = 0,
	 expedition_medal = 0, elite_coin = 0, holy_eqm_coin = 0,
	 skin_debris = 0, cluster_coin = 0, home_coin = 0,
	 hallow_refine = 0, cluster_guess_cent = 0,
	 feather_exchange = 0, brave_symbol = 0,
	 peak_guess_cent = 0, hero_soul_coin = 0,
	 acc_recruit_hero = 0, predict_point = 0}).

-file("src/mod/personal_push_gift/warehouse_check.erl",
      16).

check({top_hero_star_check, Diff}, Role) ->
    ValueList = util:get(warehouse_cond_value, []),
    Val = case lists:keyfind(top_hero_star_check, 1,
			     ValueList)
	      of
	    {_, Val1} -> Val1;
	    _ ->
		AvgStar2 = trunc(lists:sum([Star
					    || #partner{star = Star}
						   <- partner_lib:get_max_partner(Role,
										  5)])
				   / 5),
		MaxStar2 = case partner:check_star_limit(Role, 11) of
			     true ->
				 case partner:check_star_limit(Role, 12) of
				   true ->
				       case partner:check_star_limit(Role, 13)
					   of
					 true -> 13;
					 _ -> 12
				       end;
				   _ -> 11
				 end;
			     _ -> 10
			   end,
		Val2 = max(0, MaxStar2 - AvgStar2),
		NewValueList = lists:keystore(top_hero_star_check, 1,
					      ValueList,
					      {top_hero_star_check, Val2}),
		put(warehouse_cond_value, NewValueList),
		Val2
	  end,
    case Val >= Diff of
      true -> true;
      _ -> false
    end;
check({item_check, 1, Num},
      #role{assets = #assets{coin = Coin}}) ->
    ValueList = util:get(warehouse_cond_value, []),
    HasNum = case lists:keyfind({item_check, 1}, 1,
				ValueList)
		 of
	       {_, HasNum1} -> HasNum1;
	       _ ->
		   NewValueList = lists:keystore({item_check, 1}, 1,
						 ValueList,
						 {{item_check, 1}, Coin}),
		   put(warehouse_cond_value, NewValueList),
		   Coin
	     end,
    case HasNum =< Num of
      true -> true;
      _ -> false
    end;
check({item_check, 22, Num},
      #role{assets = #assets{hero_exp = Exp}}) ->
    ValueList = util:get(warehouse_cond_value, []),
    HasNum = case lists:keyfind({item_check, 22}, 1,
				ValueList)
		 of
	       {_, HasNum1} -> HasNum1;
	       _ ->
		   NewValueList = lists:keystore({item_check, 22}, 1,
						 ValueList,
						 {{item_check, 22}, Exp}),
		   put(warehouse_cond_value, NewValueList),
		   Exp
	     end,
    case HasNum =< Num of
      true -> true;
      _ -> false
    end;
check({item_check, ItemId, Num}, Role) ->
    ValueList = util:get(warehouse_cond_value, []),
    HasNum = case lists:keyfind({item_check, ItemId}, 1,
				ValueList)
		 of
	       {_, HasNum1} -> HasNum1;
	       _ ->
		   {_, HasNum2} = package:count(by_base_id, ItemId,
						Role#role.p_bag),
		   NewValueList = lists:keystore({item_check, ItemId}, 1,
						 ValueList,
						 {{item_check, ItemId},
						  HasNum2}),
		   put(warehouse_cond_value, NewValueList),
		   HasNum2
	     end,
    case HasNum =< Num of
      true -> true;
      _ -> false
    end;
check({eqm_check, Diff},
      #role{partner_bag =
		#partner_bag{partner_list = PartnerList}}) ->
    ValueList = util:get(warehouse_cond_value, []),
    AvgJie = case lists:keyfind(eqm_check, 1, ValueList) of
	       {_, AvgJie1} -> AvgJie1;
	       _ ->
		   PList1 =
		       lists:sublist(list_util:keyresort(#partner.power,
							 PartnerList),
				     5),
		   EqmList = lists:flatten([Eqm
					    || #partner{eqm = Eqm} <- PList1]),
		   AllItemBase = [item_data:get(BaseId)
				  || #item{base_id = BaseId} <- EqmList],
		   AvgJie2 = trunc(lists:sum([Jie
					      || I = #item_base{eqm_jie = Jie}
						     <- AllItemBase,
						 is_record(I, item_base)])
				     / max(1, length(PList1) * 4)),
		   NewValueList = lists:keystore(eqm_check, 1, ValueList,
						 {eqm_check, AvgJie2}),
		   put(warehouse_cond_value, NewValueList),
		   AvgJie2
	     end,
    case AvgJie =< Diff of
      true -> true;
      _ -> false
    end;
check({artifact_check, Diff},
      #role{partner_bag =
		#partner_bag{partner_list = PartnerList}}) ->
    ValueList = util:get(warehouse_cond_value, []),
    Val = case lists:keyfind(artifact_check, 1, ValueList)
	      of
	    {_, Val1} -> Val1;
	    _ ->
		PList1 =
		    lists:sublist(list_util:keyresort(#partner.power,
						      PartnerList),
				  5),
		{star, NeedStar} =
		    partner_data:get_constant(artifact_two),
		{lev, NeedLev} =
		    partner_data:get_constant(artifact_one),
		Fun = fun (#partner{star = Star, lev = Lev}, Acc) ->
			      if Star >= NeedStar andalso Lev >= NeedLev ->
				     Acc + 2;
				 Star >= NeedStar -> Acc + 1;
				 Lev >= NeedLev -> Acc + 1;
				 true -> Acc
			      end
		      end,
		AllNum = lists:foldl(Fun, 0, PList1),
		ArtifactList = lists:flatten([Artifacts
					      || #partner{artifacts = Artifacts}
						     <- PList1]),
		ItemLength = length([I
				     || {_, I = #item{quality = Quality}}
					    <- ArtifactList,
					Quality =:= 4 orelse Quality =:= 5]),
		Val2 = AllNum - ItemLength,
		NewValueList = lists:keystore(artifact_check, 1,
					      ValueList,
					      {artifact_check, Val2}),
		put(warehouse_cond_value, NewValueList),
		Val2
	  end,
    case Val >= Diff of
      true -> true;
      _ -> false
    end;
check({sprite_check, Diff},
      #role{m_sprite_tree =
		#m_sprite_tree{sprites = Sprites}}) ->
    ValueList = util:get(warehouse_cond_value, []),
    AvgJie = case lists:keyfind(sprite_check, 1, ValueList)
		 of
	       {_, AvgJie1} -> AvgJie1;
	       _ ->
		   ItemList = [item_data:get(Bid) || {_, Bid} <- Sprites],
		   ItemList1 = [Jie
				|| I = #item_base{eqm_jie = Jie} <- ItemList,
				   is_record(I, item_base)],
		   AvgJie2 = trunc(lists:sum(ItemList1) /
				     max(1, length(ItemList1))),
		   NewValueList = lists:keystore(sprite_check, 1,
						 ValueList,
						 {sprite_check, AvgJie2}),
		   put(warehouse_cond_value, NewValueList),
		   AvgJie2
	     end,
    case AvgJie =< Diff of
      true -> true;
      _ -> false
    end;
check({holy_eqm_3q1_check, Score, Set},
      #role{m_recruit = #m_recruit{all_score = AllScore},
	    partner_bag = #partner_bag{partner_list = PartnerList}})
    when AllScore >= Score ->
    ValueList = util:get(warehouse_cond_value, []),
    SetList = case lists:keyfind({holy_eqm_3q1_check,
				  Score},
				 1, ValueList)
		  of
		{_, SetList1} -> SetList1;
		_ ->
		    PList1 =
			lists:sublist(list_util:keyresort(#partner.power,
							  PartnerList),
				      5),
		    HolyEqmList = [HolyEqm
				   || #partner{holy_eqm = HolyEqm} <- PList1],
		    Fun = fun (PartnerHolyEqmList, Acc1) ->
				  Fun1 = fun (#item{base_id = Bid,
						    set_id = SId},
					      Acc) ->
						 case
						   item_data:get_star_jie(Bid)
						     of
						   {Star, _} when Star > 1 ->
						       case
							 partner_holy_eqm_data:get_rand_attr_group(Bid)
							   of
							 {Quality, _}
							     when Quality > 0 ->
							     [trunc(SId / 100)
							      | Acc];
							 _ -> Acc
						       end;
						   _ -> Acc
						 end
					 end,
				  SetList = lists:foldl(Fun1, [],
							PartnerHolyEqmList),
				  Fun2 = fun (SId, AAcc) ->
						 List1 = [SSId
							  || SSId <- SetList,
							     SSId =:= SId],
						 case length(List1) =:= 3 of
						   true -> [SId | AAcc];
						   _ -> AAcc
						 end
					 end,
				  NewAcc1 = lists:foldl(Fun2, Acc1, SetList),
				  lists:usort(NewAcc1)
			  end,
		    SetList2 = lists:foldl(Fun, [], HolyEqmList),
		    NewValueList = lists:keystore({holy_eqm_3q1_check,
						   Score},
						  1, ValueList,
						  {{holy_eqm_3q1_check, Score},
						   SetList2}),
		    put(warehouse_cond_value, NewValueList),
		    SetList2
	      end,
    case lists:member(Set, SetList) of
      true -> true;
      _ -> false
    end;
check({holy_eqm_2q2_check, Score, Set},
      #role{m_recruit = #m_recruit{all_score = AllScore},
	    partner_bag = #partner_bag{partner_list = PartnerList}})
    when AllScore >= Score ->
    ValueList = util:get(warehouse_cond_value, []),
    SetList = case lists:keyfind({holy_eqm_2q2_check,
				  Score},
				 1, ValueList)
		  of
		{_, SetList1} -> SetList1;
		_ ->
		    PList1 =
			lists:sublist(list_util:keyresort(#partner.power,
							  PartnerList),
				      5),
		    HolyEqmList = [HolyEqm
				   || #partner{holy_eqm = HolyEqm} <- PList1],
		    Fun = fun (PartnerHolyEqmList, Acc1) ->
				  Fun1 = fun (#item{base_id = Bid,
						    set_id = SId},
					      Acc) ->
						 case
						   item_data:get_star_jie(Bid)
						     of
						   {Star, _} when Star > 1 ->
						       case
							 partner_holy_eqm_data:get_rand_attr_group(Bid)
							   of
							 {Quality, _}
							     when Quality > 0 ->
							     [trunc(SId / 100)
							      | Acc];
							 _ -> Acc
						       end;
						   _ -> Acc
						 end
					 end,
				  SetList = lists:foldl(Fun1, [],
							PartnerHolyEqmList),
				  Fun2 = fun (SId, AAcc) ->
						 List1 = [SSId
							  || SSId <- SetList,
							     SSId =:= SId],
						 case length(List1) =:= 2 of
						   true -> [SId | AAcc];
						   _ -> AAcc
						 end
					 end,
				  NewAcc1 = lists:foldl(Fun2, Acc1, SetList),
				  lists:usort(NewAcc1)
			  end,
		    SetList2 = lists:foldl(Fun, [], HolyEqmList),
		    NewValueList = lists:keystore({holy_eqm_2q2_check,
						   Score},
						  1, ValueList,
						  {{holy_eqm_2q2_check, Score},
						   SetList2}),
		    put(warehouse_cond_value, NewValueList),
		    SetList2
	      end,
    case lists:member(Set, SetList) of
      true -> true;
      _ -> false
    end;
check({holy_eqm_check, Star},
      #role{partner_bag =
		#partner_bag{partner_list = PartnerList}}) ->
    ValueList = util:get(warehouse_cond_value, []),
    AvgStar = case lists:keyfind(holy_eqm_check, 1,
				 ValueList)
		  of
		{_, AvgStar1} -> AvgStar1;
		_ ->
		    PList1 =
			lists:sublist(list_util:keyresort(#partner.power,
							  PartnerList),
				      5),
		    HolyEqmList = lists:flatten([HolyEqm
						 || #partner{holy_eqm = HolyEqm}
							<- PList1]),
		    Fun = fun (#item{base_id = Bid}, Acc) ->
				  case
				    partner_holy_eqm_data:get_rand_attr_group(Bid)
				      of
				    {Quality, _} when Quality > 0 ->
					case item_data:get_star_jie(Bid) of
					  {Star, _} when Star > 1 -> Acc + Star;
					  _ -> Acc
					end;
				    _ -> Acc
				  end
			  end,
		    AllStar = lists:foldl(Fun, 0, HolyEqmList),
		    AvgStar2 = trunc(AllStar / max(1, length(PList1) * 4)),
		    NewValueList = lists:keystore(holy_eqm_check, 1,
						  ValueList,
						  {holy_eqm_check, AvgStar2}),
		    put(warehouse_cond_value, NewValueList),
		    AvgStar2
	      end,
    case AvgStar =< Star of
      true -> true;
      _ -> false
    end;
check({lev, Val}, #role{lev = Lev}) ->
    ValueList = util:get(warehouse_cond_value, []),
    Lev2 = case lists:keyfind(lev, 1, ValueList) of
	     {_, Lev1} -> Lev1;
	     _ ->
		 NewValueList = lists:keystore(lev, 1, ValueList,
					       {lev, Lev}),
		 put(warehouse_cond_value, NewValueList),
		 Lev
	   end,
    case Lev2 >= Val of
      true -> true;
      _ -> false
    end;
check(Cond, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidwarehouse_check369, _,
       {__Levelwarehouse_check369, __Traceswarehouse_check369}}
	  when __Levelwarehouse_check369 band 8 /= 0 orelse
		 __Traceswarehouse_check369 /= [] ->
	  lager:do_log(error,
		       [{module, warehouse_check}, {function, check},
			{line, 369}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]仓检条件配置出错[~w]",
				     [Role#role.name, Cond]),
		       none, 4096, 8, __Levelwarehouse_check369,
		       __Traceswarehouse_check369, lager_event,
		       __Pidwarehouse_check369);
      _ -> ok
    end,
    false.


