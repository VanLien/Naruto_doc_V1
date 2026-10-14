-file("src/mod/partner_rand/partner_rand_match_mgr.erl",
      1).

-module(partner_rand_match_mgr).

-lager_records([{planes_load_partner,
		 [ver, pos, bid, lev, name, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{planes_evt_data,
		 [id, type, ext, reward_list, exchange_id, group_id]},
		{planes_tile,
		 [ver, label, evt_id, ext, defend_radio, is_hide,
		  is_walk, is_business, combat_power]},
		{planes_floor,
		 [ver, floor, difficulty, map_id, line, index, tile_list,
		  is_reward, is_can_reward, is_treasure, fight_ids]},
		{m_planes,
		 [ver, floor, floor_list, update_time, partners_hp_radio,
		  buffs, buffs_ext, session_ids, load_partners,
		  load_partners_next_id, dun_power, formation, is_pass,
		  reward_list, is_spar]},
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
		{partner_rand,
		 [ver, id, bid, role_id, name, lev, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{partner_rand_match,
		 [id, bid, role_id, lev, star, power]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{state, []}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, info/2, cast/1, call/1, start_link/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([do_open_match_pro/0, do_match/1, tab/1]).

-record(state, {}).

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

-file("src/mod/partner_rand/partner_rand_match_mgr.erl",
      18).

-file("inc/partner_rand.hrl", 1).

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

-file("inc/partner_rand.hrl", 8).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("inc/partner_rand.hrl", 9).

-file("inc/common.hrl", 1).

-file("inc/partner_rand.hrl", 10).

-record(partner_rand_match,
	{id = 0  :: pos_integer(), bid = 1  :: pos_integer(),
	 role_id = {0, <<>>}  :: pos_integer(),
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 power = 1  :: pos_integer()}).

-record(partner_rand,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 bid = 1  :: pos_integer(),
	 role_id = {0, <<>>}  :: pos_integer(), name = <<>>,
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/partner_rand/partner_rand_match_mgr.erl",
      19).

-file("inc/partner.hrl", 1).

-file("inc/attr.hrl", 1).

-file("inc/partner.hrl", 11).

-file("inc/package.hrl", 1).

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

-file("src/mod/partner_rand/partner_rand_match_mgr.erl",
      20).

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

-file("src/mod/partner_rand/partner_rand_match_mgr.erl",
      21).

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

-file("src/mod/partner_rand/partner_rand_match_mgr.erl",
      22).

-file("inc/planes.hrl", 1).

-file("inc/attr.hrl", 1).

-file("inc/planes.hrl", 7).

-record(m_planes,
	{ver = 2  :: pos_integer(), floor = 0  :: pos_integer(),
	 floor_list = []  :: list(),
	 update_time = 0  :: pos_integer(),
	 partners_hp_radio = []  :: list(),
	 buffs = []  :: list(), buffs_ext = []  :: list(),
	 session_ids = []  :: list(),
	 load_partners = []  :: list(),
	 load_partners_next_id = 1  :: pos_integer(),
	 dun_power = 0  :: pos_integer(),
	 formation = {1, [], 0}  :: tuple(),
	 is_pass = 0  :: boolean(), reward_list = []  :: list(),
	 is_spar = 0  :: pos_integer()}).

-record(planes_floor,
	{ver = 1  :: pos_integer(), floor = 1  :: pos_integer(),
	 difficulty = 1  :: pos_integer(),
	 map_id  :: pos_integer(), line = 1  :: pos_integer(),
	 index = 0  :: pos_integer(), tile_list = []  :: list(),
	 is_reward = 0  :: boolean(),
	 is_can_reward = 0  :: boolean(),
	 is_treasure = 0  :: boolean(),
	 fight_ids = []  :: list()}).

-record(planes_tile,
	{ver = 1  :: pos_integer(), label = {1, 1}  :: tuple(),
	 evt_id = 0  :: pos_integer(), ext = []  :: list(),
	 defend_radio = []  :: list(), is_hide = 0  :: boolean(),
	 is_walk = 0  :: boolean(),
	 is_business = 0  :: boolean(),
	 combat_power = 0  :: pos_integer()}).

-record(planes_evt_data,
	{id = 0  :: pos_integer(), type = 0  :: pos_integer(),
	 ext = []  :: list(), reward_list = []  :: list(),
	 exchange_id = 0  :: pos_integer(),
	 group_id = 0  :: pos_integer()}).

-record(planes_load_partner,
	{ver = 1  :: pos_integer(), pos = 1  :: pos_integer(),
	 bid = 1  :: pos_integer(), lev = 1  :: pos_integer(),
	 name = <<>>  :: binary(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/partner_rand/partner_rand_match_mgr.erl",
      23).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/partner_rand/partner_rand_match_mgr.erl",
      24).

do_open_match_pro() -> do_open_match_pro(20).

do_open_match_pro(0) -> ok;
do_open_match_pro(N) ->
    partner_rand_match_mgr:start_link(N),
    do_open_match_pro(N - 1).

tab(1) -> partner_rand_match_1;
tab(2) -> partner_rand_match_2;
tab(3) -> partner_rand_match_3;
tab(4) -> partner_rand_match_4;
tab(5) -> partner_rand_match_5;
tab(6) -> partner_rand_match_6;
tab(7) -> partner_rand_match_7;
tab(8) -> partner_rand_match_8;
tab(9) -> partner_rand_match_9;
tab(10) -> partner_rand_match_10;
tab(11) -> partner_rand_match_11;
tab(12) -> partner_rand_match_12;
tab(13) -> partner_rand_match_13;
tab(14) -> partner_rand_match_14;
tab(15) -> partner_rand_match_15;
tab(16) -> partner_rand_match_16;
tab(17) -> partner_rand_match_17;
tab(18) -> partner_rand_match_18;
tab(19) -> partner_rand_match_19;
tab(20) -> partner_rand_match_20;
tab(N) when N > 20 -> tab(N rem 20 + 1).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> partner_rand_match_mgr ! Info.

info({Rid, _}, Info) -> info(Rid, Info);
info(Rid, Info) ->
    LoaclName = tab(Rid),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_match_mgr73, _,
       {__Levelpartner_rand_match_mgr73,
	__Tracespartner_rand_match_mgr73}}
	  when __Levelpartner_rand_match_mgr73 band 128 /= 0
		 orelse __Tracespartner_rand_match_mgr73 /= [] ->
	  lager:do_log(debug,
		       [{module, partner_rand_match_mgr}, {function, info},
			{line, 73}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===进程~w=====信息:~w", [LoaclName, Info]),
		       none, 4096, 128, __Levelpartner_rand_match_mgr73,
		       __Tracespartner_rand_match_mgr73, lager_event,
		       __Pidpartner_rand_match_mgr73);
      _ -> ok
    end,
    LoaclName ! Info.

cast(Info) ->
    gen_server:cast(partner_rand_match_mgr, Info).

call(Info) ->
    case catch gen_server:call(partner_rand_match_mgr, Info,
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
	    {__Pidpartner_rand_match_mgr81, _,
	     {__Levelpartner_rand_match_mgr81,
	      __Tracespartner_rand_match_mgr81}}
		when __Levelpartner_rand_match_mgr81 band 8 /= 0 orelse
		       __Tracespartner_rand_match_mgr81 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_match_mgr},
			      {function, call}, {line, 81},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [partner_rand_match_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelpartner_rand_match_mgr81,
			     __Tracespartner_rand_match_mgr81, lager_event,
			     __Pidpartner_rand_match_mgr81);
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

start_link(Num) ->
    LocalName =
	list_to_atom(lists:concat(["partner_rand_match_",
				   Num])),
    gen_server:start_link({local, LocalName},
			  partner_rand_match_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_match_mgr88, _,
       {__Levelpartner_rand_match_mgr88,
	__Tracespartner_rand_match_mgr88}}
	  when __Levelpartner_rand_match_mgr88 band 64 /= 0 orelse
		 __Tracespartner_rand_match_mgr88 /= [] ->
	  lager:do_log(info,
		       [{module, partner_rand_match_mgr}, {function, init},
			{line, 88}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [partner_rand_match_mgr]),
		       none, 4096, 64, __Levelpartner_rand_match_mgr88,
		       __Tracespartner_rand_match_mgr88, lager_event,
		       __Pidpartner_rand_match_mgr88);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_match_mgr91, _,
       {__Levelpartner_rand_match_mgr91,
	__Tracespartner_rand_match_mgr91}}
	  when __Levelpartner_rand_match_mgr91 band 64 /= 0 orelse
		 __Tracespartner_rand_match_mgr91 /= [] ->
	  lager:do_log(info,
		       [{module, partner_rand_match_mgr}, {function, init},
			{line, 91}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [partner_rand_match_mgr]),
		       none, 4096, 64, __Levelpartner_rand_match_mgr91,
		       __Tracespartner_rand_match_mgr91, lager_event,
		       __Pidpartner_rand_match_mgr91);
      _ -> ok
    end,
    {ok, State}.

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
	    {__Pidpartner_rand_match_mgr99, _,
	     {__Levelpartner_rand_match_mgr99,
	      __Tracespartner_rand_match_mgr99}}
		when __Levelpartner_rand_match_mgr99 band 8 /= 0 orelse
		       __Tracespartner_rand_match_mgr99 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_match_mgr},
			      {function, handle_call}, {line, 99},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelpartner_rand_match_mgr99,
			     __Tracespartner_rand_match_mgr99, lager_event,
			     __Pidpartner_rand_match_mgr99);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    partner_rand_match_mgr, 100, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner_rand_match_mgr112, _,
	     {__Levelpartner_rand_match_mgr112,
	      __Tracespartner_rand_match_mgr112}}
		when __Levelpartner_rand_match_mgr112 band 8 /= 0 orelse
		       __Tracespartner_rand_match_mgr112 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_match_mgr},
			      {function, handle_info}, {line, 112},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelpartner_rand_match_mgr112,
			     __Tracespartner_rand_match_mgr112, lager_event,
			     __Pidpartner_rand_match_mgr112);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    partner_rand_match_mgr, 113, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_match_mgr118, _,
       {__Levelpartner_rand_match_mgr118,
	__Tracespartner_rand_match_mgr118}}
	  when __Levelpartner_rand_match_mgr118 band 64 /= 0
		 orelse __Tracespartner_rand_match_mgr118 /= [] ->
	  lager:do_log(info,
		       [{module, partner_rand_match_mgr},
			{function, terminate}, {line, 118},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelpartner_rand_match_mgr118,
		       __Tracespartner_rand_match_mgr118, lager_event,
		       __Pidpartner_rand_match_mgr118);
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
	    {__Pidpartner_rand_match_mgr130, _,
	     {__Levelpartner_rand_match_mgr130,
	      __Tracespartner_rand_match_mgr130}}
		when __Levelpartner_rand_match_mgr130 band 8 /= 0 orelse
		       __Tracespartner_rand_match_mgr130 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_match_mgr},
			      {function, do_handle_call}, {line, 130},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelpartner_rand_match_mgr130,
			     __Tracespartner_rand_match_mgr130, lager_event,
			     __Pidpartner_rand_match_mgr130);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    partner_rand_match_mgr, 131, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

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
	    {__Pidpartner_rand_match_mgr144, _,
	     {__Levelpartner_rand_match_mgr144,
	      __Tracespartner_rand_match_mgr144}}
		when __Levelpartner_rand_match_mgr144 band 8 /= 0 orelse
		       __Tracespartner_rand_match_mgr144 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_match_mgr},
			      {function, do_handle_info}, {line, 144},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelpartner_rand_match_mgr144,
			     __Tracespartner_rand_match_mgr144, lager_event,
			     __Pidpartner_rand_match_mgr144);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    partner_rand_match_mgr, 145, _Reason}),
	  {noreply, State}
    end;
do_handle_info({match, RolePid, RoleId, MatchPower,
		PosTypes, BidProRios, Args, {M, F, A}},
	       State) ->
    case big_world_lib:is_link() of
      true ->
	  big_world_lib:cast(center, partner_rand_match_mgr,
			     do_match,
			     [{RolePid, RoleId, MatchPower, 1, 1, [], PosTypes,
			       BidProRios, Args, M, F, A}]);
      _ ->
	  case cluster_lib:is_link() of
	    true ->
		cluster_lib:cast(center, partner_rand_match_mgr,
				 do_match,
				 [{RolePid, RoleId, MatchPower, 1, 1, [],
				   PosTypes, BidProRios, Args, M, F, A}]);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidpartner_rand_match_mgr158, _,
		   {__Levelpartner_rand_match_mgr158,
		    __Tracespartner_rand_match_mgr158}}
		      when __Levelpartner_rand_match_mgr158 band 128 /= 0
			     orelse __Tracespartner_rand_match_mgr158 /= [] ->
		      lager:do_log(debug,
				   [{module, partner_rand_match_mgr},
				    {function, do_handle_info}, {line, 158},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("未连接中央服", []), none, 4096, 128,
				   __Levelpartner_rand_match_mgr158,
				   __Tracespartner_rand_match_mgr158,
				   lager_event, __Pidpartner_rand_match_mgr158);
		  _ -> ok
		end,
		role_lib:cast(by_pid, RolePid, {M, F, [[], A]})
	  end
    end,
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

do_match(Info) ->
    TabLists = [c_partner_rand_mgr:match_tab(TabId)
		|| TabId <- util:shuffle(lists:seq(1, 5))],
    do_match_(Info, TabLists).

do_match_({RolePid, {Rid, Sid}, _MatchPower, _Round,
	   Pos, MatchPartners, _PosTypes, _BidProRios, _Args, M, F,
	   A},
	  _TabLists)
    when Pos > 4 ->
    PushPartners = convert_load_partner(MatchPartners, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_match_mgr171, _,
       {__Levelpartner_rand_match_mgr171,
	__Tracespartner_rand_match_mgr171}}
	  when __Levelpartner_rand_match_mgr171 band 64 /= 0
		 orelse __Tracespartner_rand_match_mgr171 /= [] ->
	  lager:do_log(info,
		       [{module, partner_rand_match_mgr},
			{function, do_match_}, {line, 171},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("{~w:~s}匹配了~w个对手",
				     [Rid, Sid,
				      {_MatchPower, length(PushPartners),
				       MatchPartners}]),
		       none, 4096, 64, __Levelpartner_rand_match_mgr171,
		       __Tracespartner_rand_match_mgr171, lager_event,
		       __Pidpartner_rand_match_mgr171);
      _ -> ok
    end,
    role_lib:cast(by_pid, RolePid,
		  {M, F, [PushPartners, A]});
do_match_({RolePid, RoleId, MatchPower, Round, Pos,
	   MatchPartners, PosTypes, ExitBids, Args, M, F, A},
	  TabLists) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_match_mgr174, _,
       {__Levelpartner_rand_match_mgr174,
	__Tracespartner_rand_match_mgr174}}
	  when __Levelpartner_rand_match_mgr174 band 128 /= 0
		 orelse __Tracespartner_rand_match_mgr174 /= [] ->
	  lager:do_log(debug,
		       [{module, partner_rand_match_mgr},
			{function, do_match_}, {line, 174},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("匹配了~w个对手",
				     [{Pos, Round, length(MatchPartners)}]),
		       none, 4096, 128, __Levelpartner_rand_match_mgr174,
		       __Tracespartner_rand_match_mgr174, lager_event,
		       __Pidpartner_rand_match_mgr174);
      _ -> ok
    end,
    PowerRios =
	planes_data:get_macth_limit_match_power(MatchPower),
    case lists:keyfind(Round, 1, PowerRios) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner_rand_match_mgr178, _,
	     {__Levelpartner_rand_match_mgr178,
	      __Tracespartner_rand_match_mgr178}}
		when __Levelpartner_rand_match_mgr178 band 128 /= 0
		       orelse __Tracespartner_rand_match_mgr178 /= [] ->
		lager:do_log(debug,
			     [{module, partner_rand_match_mgr},
			      {function, do_match_}, {line, 178},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("匹配了~w个对手",
					   [{Pos, Round,
					     length(MatchPartners)}]),
			     none, 4096, 128, __Levelpartner_rand_match_mgr178,
			     __Tracespartner_rand_match_mgr178, lager_event,
			     __Pidpartner_rand_match_mgr178);
	    _ -> ok
	  end,
	  do_match_({RolePid, RoleId, MatchPower, 1, Pos + 1,
		     MatchPartners, PosTypes, ExitBids, Args, M, F, A},
		    TabLists);
      {_, MinPowerRio, MaxPowerRio} ->
	  LimitMinMatchPower = trunc(MinPowerRio * MatchPower *
				       1.0e-3),
	  LimitMaxMatchPower = trunc(MaxPowerRio * 1.0e-3 *
				       MatchPower),
	  PosBid1 = case lists:keyfind(1, 1, MatchPartners) of
		      {_, _, BidTemp} -> BidTemp;
		      _ -> 0
		    end,
	  PosBid2 = case lists:keyfind(2, 1, MatchPartners) of
		      {_, _, BidTemp2} -> BidTemp2;
		      _ -> 0
		    end,
	  PosBid3 = case lists:keyfind(3, 1, MatchPartners) of
		      {_, _, BidTemp3} -> BidTemp3;
		      _ -> 0
		    end,
	  DoFun = [{{partner_rand_match, '$1', '$2', '$4', '_',
		     '_', '$3'},
		    [{'andalso', {'=<', '$3', {const, LimitMaxMatchPower}},
		      {'andalso', {'>=', '$3', {const, LimitMinMatchPower}},
		       {'andalso', {'=/=', '$2', {const, PosBid1}},
			{'andalso', {'=/=', '$2', {const, PosBid2}},
			 {'andalso', {'=/=', '$2', {const, PosBid3}},
			  {'=/=', '$4', {const, RoleId}}}}}}}],
		    [{{'$1', '$2'}}]}],
	  Group = list_util:keyfind(Pos, PosTypes, 1),
	  GroupId = maps:get(group_id, Args, 1),
	  RandList =
	      planes_data:get_match_group_rand_list({GroupId, Group}),
	  L = get_match_roles(DoFun, TabLists, ExitBids,
			      MatchPartners, RandList, []),
	  case length(L) >= 30 of
	    true ->
		RandList2 = calc_pro(Pos, RandList, L, []),
		{Id, Bid, _} = util:rand_list(RandList2, 3),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidpartner_rand_match_mgr215, _,
		   {__Levelpartner_rand_match_mgr215,
		    __Tracespartner_rand_match_mgr215}}
		      when __Levelpartner_rand_match_mgr215 band 128 /= 0
			     orelse __Tracespartner_rand_match_mgr215 /= [] ->
		      lager:do_log(debug,
				   [{module, partner_rand_match_mgr},
				    {function, do_match_}, {line, 215},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("匹配了~w个对手",
						 [{Pos, Round,
						   length(MatchPartners)}]),
				   none, 4096, 128,
				   __Levelpartner_rand_match_mgr215,
				   __Tracespartner_rand_match_mgr215,
				   lager_event, __Pidpartner_rand_match_mgr215);
		  _ -> ok
		end,
		do_match_({RolePid, RoleId, MatchPower, 1, Pos + 1,
			   [{Pos, Id, Bid} | MatchPartners], PosTypes, ExitBids,
			   Args, M, F, A},
			  TabLists);
	    false
		when Round == length(PowerRios) andalso length(L) > 0 ->
		RandList2 = calc_pro(Pos, RandList, L, []),
		{Id, Bid, _} = util:rand_list(RandList2, 3),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidpartner_rand_match_mgr220, _,
		   {__Levelpartner_rand_match_mgr220,
		    __Tracespartner_rand_match_mgr220}}
		      when __Levelpartner_rand_match_mgr220 band 128 /= 0
			     orelse __Tracespartner_rand_match_mgr220 /= [] ->
		      lager:do_log(debug,
				   [{module, partner_rand_match_mgr},
				    {function, do_match_}, {line, 220},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("匹配了~w个对手",
						 [{Pos, Round,
						   length(MatchPartners)}]),
				   none, 4096, 128,
				   __Levelpartner_rand_match_mgr220,
				   __Tracespartner_rand_match_mgr220,
				   lager_event, __Pidpartner_rand_match_mgr220);
		  _ -> ok
		end,
		do_match_({RolePid, RoleId, MatchPower, 1, Pos + 1,
			   [{Pos, Id, Bid} | MatchPartners], PosTypes, ExitBids,
			   Args, M, F, A},
			  TabLists);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidpartner_rand_match_mgr223, _,
		   {__Levelpartner_rand_match_mgr223,
		    __Tracespartner_rand_match_mgr223}}
		      when __Levelpartner_rand_match_mgr223 band 128 /= 0
			     orelse __Tracespartner_rand_match_mgr223 /= [] ->
		      lager:do_log(debug,
				   [{module, partner_rand_match_mgr},
				    {function, do_match_}, {line, 223},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("匹配了~w个对手",
						 [{Pos, Round,
						   length(MatchPartners)}]),
				   none, 4096, 128,
				   __Levelpartner_rand_match_mgr223,
				   __Tracespartner_rand_match_mgr223,
				   lager_event, __Pidpartner_rand_match_mgr223);
		  _ -> ok
		end,
		do_match_({RolePid, RoleId, MatchPower, Round + 1, Pos,
			   MatchPartners, PosTypes, ExitBids, Args, M, F, A},
			  TabLists)
	  end
    end.

get_match_roles(_DoFun, [], _ExitBids, _MatchPartners,
		_RandList, MatchList) ->
    MatchList;
get_match_roles(DoFun, [TabName | TabLists], ExitBids,
		MatchPartners, RandList, MatchList) ->
    case ets:select(TabName, DoFun, 60) of
      {L, _} ->
	  L1 = [{IdT, Bid}
		|| {IdT, Bid} <- L,
		   lists:keymember(Bid, 1, RandList) andalso
		     not lists:keymember(Bid, 1, ExitBids) andalso
		       not lists:keymember(Bid, 3, MatchPartners) andalso
			 not lists:keymember(IdT, 1, MatchList)],
	  NewMatchList = MatchList ++ L1,
	  case length(NewMatchList) >= 40 of
	    true -> NewMatchList;
	    _ ->
		get_match_roles(DoFun, TabLists, ExitBids,
				MatchPartners, RandList, NewMatchList)
	  end;
      _ ->
	  get_match_roles(DoFun, TabLists, ExitBids,
			  MatchPartners, RandList, MatchList)
    end.

calc_pro(_Pos, _RandList, [], ProList) -> ProList;
calc_pro(Pos, RandList, [{Id, Bid} | L], ProList) ->
    Pro = list_util:keyfind(Bid, RandList, 0),
    calc_pro(Pos, RandList, L, [{Id, Bid, Pro} | ProList]).

convert_load_partner([], Lists) -> Lists;
convert_load_partner([{Pos, Id, Bid} | Other], Lists) ->
    case convert_load_partner(Pos, Id, Bid) of
      false -> convert_load_partner(Other, Lists);
      Data -> convert_load_partner(Other, [Data | Lists])
    end;
convert_load_partner(Pos,
		     #partner_rand{bid = Bid, lev = Lev, star = Star,
				   break_lev = BreakLev, use_skin = UseSkin,
				   all_attr = AllAttr, skills = Skills,
				   break_skills = BreakSkills,
				   set_skills = SetSkills, eqms = Eqm,
				   artifacts = Artifacts, holy_eqm = HolyEqm,
				   end_time = EndTime, dower_skill = DowerSkill,
				   power = Power}) ->
    #planes_load_partner{pos = Pos, bid = Bid, lev = Lev,
			 star = Star, break_lev = BreakLev, use_skin = UseSkin,
			 all_attr = AllAttr, skills = Skills,
			 break_skills = BreakSkills, set_skills = SetSkills,
			 eqms = Eqm, artifacts = Artifacts, holy_eqm = HolyEqm,
			 end_time = EndTime, dower_skill = DowerSkill,
			 power = Power}.

convert_load_partner(Pos, Id, Bid) ->
    case ets:lookup(c_partner_rand_mgr:tab(Id), Id) of
      [Data = #partner_rand{} | _] ->
	  convert_load_partner(Pos, Data);
      _ ->
	  case ets:lookup(c_partner_rand_mgr:tab(Bid), Id) of
	    [Data = #partner_rand{} | _] ->
		convert_load_partner(Pos, Data);
	    _ -> false
	  end
    end.


