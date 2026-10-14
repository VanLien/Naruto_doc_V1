-file("src/mod/dungeon_heaven/holy_eqm_set.erl", 1).

-module(holy_eqm_set).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{assets,
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
		{holy_eqm_set_cell, [ver, id, partner_id, name, list]},
		{m_holy_eqm_set, [ver, num, buy_num, next_id, list]},
		{holy_eqm_attr_data,
		 [group_id, attr, time_min, time_max, val_range,
		  first_pro, reset_pro]},
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
		  p_eqm, p_home]}]).

-export([init/0, push_base/1, save/5, apply/3,
	 buy_cell/1]).

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

-file("src/mod/dungeon_heaven/holy_eqm_set.erl", 15).

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

-file("src/mod/dungeon_heaven/holy_eqm_set.erl", 16).

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

-file("src/mod/dungeon_heaven/holy_eqm_set.erl", 17).

-file("inc/holy_eqm.hrl", 1).

-record(holy_eqm_attr_data,
	{group_id = 0, attr, time_min = 0, time_max = 0,
	 val_range = [], first_pro = 0, reset_pro = 0}).

-record(m_holy_eqm_set,
	{ver = 1, num = 0, buy_num = 0, next_id = 1,
	 list = []}).

-record(holy_eqm_set_cell,
	{ver = 1, id = 0, partner_id = 0, name = <<>>,
	 list = []}).

-file("src/mod/dungeon_heaven/holy_eqm_set.erl", 18).

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

-file("src/mod/dungeon_heaven/holy_eqm_set.erl", 19).

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

-file("src/mod/dungeon_heaven/holy_eqm_set.erl", 20).

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

-file("src/mod/dungeon_heaven/holy_eqm_set.erl", 21).

-file("inc/log.hrl", 1).

-file("src/mod/dungeon_heaven/holy_eqm_set.erl", 22).

-spec init() -> #m_holy_eqm_set{}.

init() -> #m_holy_eqm_set{num = 3}.

-spec push_base(#role{}) -> ok.

push_base(Role = #role{partner_bag =
			   #partner_bag{partner_list = PL},
		       m_holy_eqm_set =
			   #m_holy_eqm_set{num = Num, list = List}}) ->
    ItemToPL = item_id_to_partner_id(Role),
    CliList = to_cli(List, [], PL, ItemToPL),
    sys_conn:pack_send(25220, {Num, CliList}),
    ok.

to_cli([], L, _, _) -> L;
to_cli([Cell | Other], L, PL, ItemToPL) ->
    CliCell = to_cli(Cell, PL, ItemToPL),
    to_cli(Other, [CliCell | L], PL, ItemToPL).

to_cli(Cli = #holy_eqm_set_cell{list = List}, PL,
       ItemToPL) ->
    Fun = fun ({_, ItemIdT}, Acc) ->
		  case lists:keyfind(ItemIdT, 1, ItemToPL) of
		    {_, ToPartnerId} -> [{ToPartnerId, ItemIdT} | Acc];
		    _ -> Acc
		  end
	  end,
    NewList = lists:foldl(Fun, [], List),
    NewPartnerId = case NewList of
		     [{PartnerId, _} | _] ->
			 case lists:keyfind(PartnerId, #partner.id, PL) of
			   #partner{holy_eqm = HolyEqm} ->
			       HolyEqmId = [ItemIdT
					    || #item{id = ItemIdT} <- HolyEqm],
			       CellEqmId = [ItemIdT || {_, ItemIdT} <- NewList],
			       case HolyEqmId -- CellEqmId == [] andalso
				      CellEqmId -- HolyEqmId == []
				   of
				 true -> PartnerId;
				 _ -> 0
			       end;
			   _ -> 0
			 end;
		     _ -> 0
		   end,
    Cli#holy_eqm_set_cell{partner_id = NewPartnerId,
			  list = NewList}.

-spec save(#role{}, pos_integer(), pos_integer(),
	   bitstring(), tuple()) -> {false, bitstring()} |
				    {ok, #role{}}.

save(Role = #role{partner_bag =
		      #partner_bag{partner_list = PL},
		  m_holy_eqm_set =
		      MHolyEqmSet = #m_holy_eqm_set{num = Num, list = List}},
     CellId, PartnerId, SetName0, SetInfo) ->
    case Num >= CellId andalso CellId > 0 of
      true ->
	  SetName = case
		      is_binary([string_util:trim(binary_to_list(SetName0))])
			of
		      false ->
			  list_to_binary([string_util:trim(binary_to_list(SetName0))]);
		      true -> [string_util:trim(binary_to_list(SetName0))]
		    end,
	  NLen = string_util:utf8_len(SetName),
	  case keyword:check(name, SetName) of
	    false -> {false, lang:get(<<"名字不合法"/utf8>>)};
	    _ when NLen < 1 orelse NLen > 6 ->
		{false, lang:get(<<"名字长度不对"/utf8>>)};
	    true ->
		ItemToPL = item_id_to_partner_id(Role),
		Fun = fun ({_, ItemIdT}, Acc) ->
			      case lists:keyfind(ItemIdT, 1, ItemToPL) of
				{_, ToPartnerId} ->
				    [{ToPartnerId, ItemIdT} | Acc];
				_ -> Acc
			      end
		      end,
		NewSetInfo = lists:foldl(Fun, [], SetInfo),
		ExistsItemId = lists:flatten([[{ItemIdT, IdT}
					       || {_, ItemIdT} <- CellL]
					      || #holy_eqm_set_cell{id = IdT,
								    list =
									CellL}
						     <- List,
						 CellId =/= IdT]),
		case check_can_save(NewSetInfo, Role, []) of
		  {false, Msg} -> {false, Msg};
		  _ ->
		      NewList0 = clear_repeat_item(NewSetInfo, ExistsItemId,
						   List),
		      NewHolyEqmSetCell = #holy_eqm_set_cell{id = CellId,
							     name = SetName,
							     partner_id =
								 PartnerId,
							     list = NewSetInfo},
		      NewList = lists:keystore(CellId, #holy_eqm_set_cell.id,
					       NewList0, NewHolyEqmSetCell),
		      NRole = Role#role{m_holy_eqm_set =
					    MHolyEqmSet#m_holy_eqm_set{list =
									   NewList}},
		      CliList = to_cli(NewList, [], PL, ItemToPL),
		      sys_conn:pack_send(25220, {Num, CliList}),
		      {ok, NRole}
		end
	  end;
      _ -> {false, lang:get(<<"该方案不存在"/utf8>>)}
    end.

-spec apply(#role{}, pos_integer(),
	    pos_integer()) -> {false, bitstring()} | {ok, #role{}}.

apply(Role = #role{m_holy_eqm_set =
		       #m_holy_eqm_set{list = List}},
      CellId, PartnerId) ->
    case lists:keyfind(CellId, #holy_eqm_set_cell.id, List)
	of
      #holy_eqm_set_cell{list = EList} ->
	  case partner_holy_eqm:drop_holy_eqm(Role, PartnerId, 0)
	      of
	    {ok, Role1} ->
		ItemToPL = item_id_to_partner_id(Role1),
		Fun = fun ({_, ItemIdT}, Acc) ->
			      case lists:keyfind(ItemIdT, 1, ItemToPL) of
				{_, ToPartnerId} ->
				    [{ToPartnerId, ItemIdT} | Acc];
				_ -> Acc
			      end
		      end,
		NewEList = lists:foldl(Fun, [], EList),
		case NewEList of
		  [_ | _] ->
		      NRole = change_set(Role1, PartnerId, NewEList),
		      push_base(NRole),
		      {ok, NRole};
		  _ -> {false, lang:get(<<"为空的方案不允许装配"/utf8>>)}
		end;
	    _ ->
		ItemToPL = item_id_to_partner_id(Role),
		Fun = fun ({_, ItemIdT}, Acc) ->
			      case lists:keyfind(ItemIdT, 1, ItemToPL) of
				{_, ToPartnerId} ->
				    [{ToPartnerId, ItemIdT} | Acc];
				_ -> Acc
			      end
		      end,
		NewEList = lists:foldl(Fun, [], EList),
		case NewEList of
		  [_ | _] ->
		      NRole = change_set(Role, PartnerId, NewEList),
		      push_base(NRole),
		      {ok, NRole};
		  _ -> {false, lang:get(<<"为空的方案不允许装配"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"方案不存在"/utf8>>)}
    end.

check_can_save([], _Role, _) -> true;
check_can_save([{PartnerId, ItemId} | Other], Role,
	       L) ->
    case is_holy_eqm_exists(Role, PartnerId, ItemId) of
      {true, Item = #item{type = Type}} ->
	  case lists:keyfind(Type, #item.type, L) of
	    false -> check_can_save(Other, Role, [Item | L]);
	    _ -> {false, lang:get(<<"存在相同部件"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"找不到神装"/utf8>>)}
    end.

clear_repeat_item([], _, List) -> List;
clear_repeat_item([{_, ItemIdT} | Other], ExistsItemId,
		  List) ->
    case lists:keyfind(ItemIdT, 1, ExistsItemId) of
      {_, CellId} ->
	  case lists:keyfind(CellId, #holy_eqm_set_cell.id, List)
	      of
	    H = #holy_eqm_set_cell{list = CellList} ->
		NewCellList = lists:keydelete(ItemIdT, 2, CellList),
		NewList = lists:keystore(CellId, #holy_eqm_set_cell.id,
					 List,
					 H#holy_eqm_set_cell{list =
								 NewCellList}),
		clear_repeat_item(Other, ExistsItemId, NewList);
	    _ -> clear_repeat_item(Other, ExistsItemId, List)
	  end;
      _ -> clear_repeat_item(Other, ExistsItemId, List)
    end.

is_holy_eqm_exists(Role, 0, ItemId) ->
    case package:fetch(3, ItemId, Role) of
      {ok, Item = #item{}} -> {true, Item};
      _ -> false
    end;
is_holy_eqm_exists(Role, PartnerId, ItemId) ->
    case partner_lib:get_partner(Role, PartnerId) of
      _P = #partner{holy_eqm = HolyEqm} ->
	  case lists:keyfind(ItemId, #item.id, HolyEqm) of
	    Item = #item{} -> {true, Item};
	    _ -> false
	  end;
      _ -> false
    end.

change_set(Role, 0, _) -> Role;
change_set(Role, _, []) -> Role;
change_set(Role, PartnerId, [{0, ItemId} | Other]) ->
    case partner_holy_eqm:dress_holy_eqm(Role, PartnerId,
					 ItemId)
	of
      {ok, NRole} -> change_set(NRole, PartnerId, Other);
      _ -> change_set(Role, PartnerId, Other)
    end;
change_set(Role, PartnerId,
	   [{OldPartnerId, ItemId} | Other]) ->
    case partner_holy_eqm:drop_holy_eqm(Role, OldPartnerId,
					ItemId)
	of
      {ok, Role1} ->
	  case partner_holy_eqm:dress_holy_eqm(Role1, PartnerId,
					       ItemId)
	      of
	    {ok, Role2} -> change_set(Role2, PartnerId, Other);
	    _ -> change_set(Role, PartnerId, Other)
	  end;
      _ -> change_set(Role, PartnerId, Other)
    end.

-spec buy_cell(#role{}) -> {false, bitstring(),
			    pos_integer()} |
			   {ok, #role{}, pos_integer()}.

buy_cell(Role = #role{m_holy_eqm_set =
			  MHolyEqmSet = #m_holy_eqm_set{num = Num,
							buy_num = BuyNum}}) ->
    case partner_holy_eqm_data:buy_holy_set_loss(Num + 1) of
      LossCfg = [_ | _] ->
	  Loss = format:val_to_loss(LossCfg, buy_cell),
	  case role_gain:do_notice(Role, Loss) of
	    {false, #loss{msg = Msg}} -> {false, Msg, Num};
	    {ok, Role1} ->
		NRole = Role1#role{m_holy_eqm_set =
				       MHolyEqmSet#m_holy_eqm_set{num = Num + 1,
								  buy_num =
								      BuyNum +
									1}},
		log:log_gain(Loss, Role, NRole, <<"神装管理"/utf8>>,
			     util:fbin(lang:get(<<"第~w次购买格子"/utf8>>),
				       [BuyNum + 1])),
		{ok, NRole, Num + 1}
	  end;
      _ -> {false, lang:get(<<"达到了购买上限"/utf8>>)}
    end.

item_id_to_partner_id(#role{partner_bag =
				#partner_bag{partner_list = PL},
			    p_eqm = #package{items = Items}}) ->
    ItemToPL = to_partner_id(PL, []),
    ItemToPackage = to_package_id(Items, []),
    ItemToPL ++ ItemToPackage.

to_partner_id([], L) -> L;
to_partner_id([#partner{holy_eqm = []} | Other], L) ->
    to_partner_id(Other, L);
to_partner_id([#partner{id = PId, holy_eqm = HolyEqm}
	       | Other],
	      L) ->
    AddL = [{ItemId, PId} || #item{id = ItemId} <- HolyEqm],
    NewL = AddL ++ L,
    to_partner_id(Other, NewL).

to_package_id([], L) -> L;
to_package_id([#item{id = ItemId, type = Type} | Other],
	      L)
    when Type == 23 orelse
	   Type == 24 orelse Type == 25 orelse Type == 26 ->
    to_package_id(Other, [{ItemId, 0} | L]);
to_package_id([_ | Other], L) ->
    to_package_id(Other, L).


