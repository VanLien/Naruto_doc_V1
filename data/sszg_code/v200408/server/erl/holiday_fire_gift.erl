-file("src/mod/holiday_fire_gift/holiday_fire_gift.erl",
      1).

-module(holiday_fire_gift).

-lager_records([{group_attr, [atk, hp_max, def, speed]},
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
		{recruit_limit, [key, info]},
		{holiday_info, [camp_id, stats, ext]},
		{recruit_info, [group_id, stats, ext]},
		{m_recruit_award, [ver, list]},
		{m_recruit,
		 [ver, free_cd_end, list, convert_list, convert_state,
		  holiday_list, holy_eqm_lottery, logs,
		  holiday_sprite_lottery_list, lucky_sprites,
		  lucky_holy_eqm, all_score]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]},
		{fire_gift_info,
		 [ver, id, charge_id, start_time, end_time, buy_count,
		  limit_count, is_loop, limit_type, ext]},
		{m_holiday_fire_gift,
		 [ver, gift_list, old_gift_list, ext]},
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

-export([init/0, login/1, zero_flush/1, ref_gift_list/1,
	 get_info/1, push_point/1, fire/1, apply_timer/1, buy/2,
	 buy_zero/2]).

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

-file("src/mod/holiday_fire_gift/holiday_fire_gift.erl",
      20).

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

-file("src/mod/holiday_fire_gift/holiday_fire_gift.erl",
      21).

-file("inc/holiday_fire_gift.hrl", 1).

-record(m_holiday_fire_gift,
	{ver = 1, gift_list = [], old_gift_list = [],
	 ext = []}).

-record(fire_gift_info,
	{ver = 1, id = 0, charge_id = 0, start_time = 0,
	 end_time = 0, buy_count = 0, limit_count = 0,
	 is_loop = 0, limit_type = 0, ext = []}).

-file("src/mod/holiday_fire_gift/holiday_fire_gift.erl",
      22).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_fire_gift/holiday_fire_gift.erl",
      23).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/mod/holiday_fire_gift/holiday_fire_gift.erl",
      24).

-file("inc/timer.hrl", 1).

-record(timer,
	{id  :: term(), timeout = 1000  :: pos_integer(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 a = []  :: [term()], times = 1  :: integer(),
	 next_tick = 0  :: non_neg_integer(),
	 set_time = 1  :: pos_integer()}).

-record(rtimer,
	{ref  :: undefined | reference(),
	 key = 0  :: non_neg_integer(),
	 timers = []  :: [#timer{}]}).

-record(s_timer,
	{ref  :: undefined | reference(),
	 timers = []  :: [#timer{}]}).

-file("src/mod/holiday_fire_gift/holiday_fire_gift.erl",
      25).

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

-file("src/mod/holiday_fire_gift/holiday_fire_gift.erl",
      26).

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

-file("src/mod/holiday_fire_gift/holiday_fire_gift.erl",
      27).

-spec init() -> #m_holiday_fire_gift{}.

init() -> #m_holiday_fire_gift{}.

-spec push_point(#role{}) -> ok.

push_point(Role = #role{lev = Lev}) ->
    List = [70, 80, 105, 140],
    case lists:member(Lev, List) of
      true ->
	  Timer1 = #timer{id = holiday_fire_gift_point,
			  timeout = 2000, times = 1, m = holiday_fire_gift,
			  f = apply_timer, a = []},
	  NRole1 = role_timer:set(Timer1, Role),
	  NRole1;
      _ -> Role
    end.

apply_timer(Role) ->
    sys_conn:pack_send(16606, {991050, 1}), {ok, Role}.

fire(Role = #role{lev = Lev}) ->
    List1 = [70, 80, 105, 140],
    List2 = [10001, 10050, 10090, 10160, 10250],
    MaxDunId = dungeon_heaven_lib:get_max_dun_id(Role),
    case lists:member(Lev, List1) orelse
	   lists:member(MaxDunId, List2)
	of
      true -> role:redirect(Role, 16601, {}), ok;
      _ -> ok
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_holiday_fire_gift =
		       #m_holiday_fire_gift{}}) ->
    {ok, Role}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role) -> {ok, Role}.

-spec get_info(#role{}) -> ok.

get_info(Role = #role{m_holiday_fire_gift =
			  MHolidayFireGift = #m_holiday_fire_gift{}}) ->
    sys_conn:pack_send(16606, {991050, 0}),
    {NewGiftList, NewOldGiftLift} = ref_gift_list(Role),
    NRole = Role#role{m_holiday_fire_gift =
			  MHolidayFireGift#m_holiday_fire_gift{gift_list =
								   NewGiftList,
							       old_gift_list =
								   NewOldGiftLift}},
    Now = date:unixtime(),
    NewGiftList1 = [F
		    || F = #fire_gift_info{end_time = EndTime}
			   <- NewGiftList,
		       Now =< EndTime],
    Fun = fun (#fire_gift_info{id = Id,
			       charge_id = ChargeId, limit_count = LimitCount,
			       buy_count = BuyCount, end_time = EndTime,
			       limit_type = LimitType},
	       Acc) ->
		  {Price, OriginalPrice, ResName, Rank, Icon, AwardList} =
		      holiday_fire_gift_data:get_gift_info1(Id),
		  [{Id, Price, ChargeId, LimitType, BuyCount, LimitCount,
		    OriginalPrice, ResName, Rank, Icon, EndTime, AwardList}
		   | Acc]
	  end,
    InfoList = lists:foldl(Fun, [], NewGiftList1),
    {NRole, InfoList}.

-spec ref_gift_list(#role{}) -> list().

ref_gift_list(Role = #role{m_holiday_fire_gift =
			       #m_holiday_fire_gift{gift_list = GiftList,
						    old_gift_list =
							OldGiftLift}}) ->
    AllGift = holiday_fire_gift_data:gift_list(),
    Fun1 = fun ({Mid, CondList}, Acc) ->
		   case check_cond(Role, CondList) of
		     true -> [Mid | Acc];
		     _ -> Acc
		   end
	   end,
    AllGift1 = lists:foldl(Fun1, [], AllGift),
    Fun2 = fun (Fg = #fire_gift_info{id = Fid},
		{Gl, Ogl}) ->
		   case lists:member(Fid, AllGift1) of
		     true ->
			 {ChargeId, _, LimitCount, Loop, LimitType} =
			     holiday_fire_gift_data:get_gift_info(Fid),
			 NewFg = Fg#fire_gift_info{charge_id = ChargeId,
						   limit_count = LimitCount,
						   is_loop = Loop,
						   limit_type = LimitType},
			 {[NewFg | Gl], Ogl};
		     _ ->
			 {Gl, lists:keystore(Fid, #fire_gift_info.id, Ogl, Fg)}
		   end
	   end,
    {GiftList1, OldGiftLift1} = lists:foldl(Fun2,
					    {[], OldGiftLift}, GiftList),
    Now = date:unixtime(),
    Fun3 = fun (Mid, Acc) ->
		   case lists:keyfind(Mid, #fire_gift_info.id, Acc) of
		     false ->
			 {ChargeId, PeriodTime, LimitCount, Loop, LimitType} =
			     holiday_fire_gift_data:get_gift_info(Mid),
			 Acc1 = lists:keystore(Mid, #fire_gift_info.id, Acc,
					       #fire_gift_info{id = Mid,
							       charge_id =
								   ChargeId,
							       start_time = Now,
							       end_time =
								   Now +
								     PeriodTime,
							       buy_count = 0,
							       limit_count =
								   LimitCount,
							       is_loop = Loop,
							       limit_type =
								   LimitType,
							       ext = []}),
			 Acc1;
		     _ -> Acc
		   end
	   end,
    GiftList2 = lists:foldl(Fun3, GiftList1, AllGift1),
    Fun4 = fun (F = #fire_gift_info{id = Id4,
				    end_time = EndTime4, buy_count = BuyCount4,
				    limit_count = LimitCount4, is_loop = Loop4,
				    limit_type = LimitType4},
		Acc1) ->
		   case Now > EndTime4 of
		     true ->
			 case Loop4 =:= 1 of
			   true ->
			       {ChargeId, PeriodTime, LimitCount, Loop,
				LimitType} =
				   holiday_fire_gift_data:get_gift_info(Id4),
			       NewStartTime = Now -
						(Now - EndTime4) rem PeriodTime,
			       NewEndTime = NewStartTime + PeriodTime,
			       case LimitType4 =:= 4 of
				 true ->
				     case BuyCount4 < LimitCount4 of
				       true ->
					   [F#fire_gift_info{charge_id =
								 ChargeId,
							     start_time =
								 NewStartTime,
							     end_time =
								 NewEndTime,
							     limit_count =
								 LimitCount,
							     is_loop = Loop,
							     limit_type =
								 LimitType,
							     ext = []}
					    | Acc1];
				       _ -> [F | Acc1]
				     end;
				 _ ->
				     [F#fire_gift_info{charge_id = ChargeId,
						       start_time =
							   NewStartTime,
						       end_time = NewEndTime,
						       buy_count = 0,
						       limit_count = LimitCount,
						       is_loop = Loop,
						       limit_type = LimitType,
						       ext = []}
				      | Acc1]
			       end;
			   _ -> [F | Acc1]
			 end;
		     _ -> [F | Acc1]
		   end
	   end,
    GiftList3 = lists:foldl(Fun4, [], GiftList2),
    {GiftList3, OldGiftLift1}.

check_cond(_Role, []) -> true;
check_cond(Role = #role{lev = Lev}, [{lev, Val} | T]) ->
    case Lev >= Val of
      true -> check_cond(Role, T);
      _ -> false
    end;
check_cond(Role = #role{m_recruit =
			    #m_recruit{all_score = AllScore}},
	   [{all_score, Val1, Val2} | T]) ->
    case AllScore >= Val1 andalso AllScore =< Val2 of
      true -> check_cond(Role, T);
      _ -> false
    end;
check_cond(Role = #role{},
	   [{dun_id, Val1, Val2} | T]) ->
    MaxDunId = dungeon_heaven_lib:get_max_dun_id(Role),
    case MaxDunId >= Val1 andalso MaxDunId =< Val2 of
      true -> check_cond(Role, T);
      _ -> false
    end;
check_cond(Role = #role{partner_bag =
			    #partner_bag{partner_list = PartnerList}},
	   [{have_partner_star, Star} | T]) ->
    case lists:keymember(Star, #partner.star, PartnerList)
	of
      true -> check_cond(Role, T);
      _ -> false
    end;
check_cond(Role = #role{}, [Cond | T]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_fire_gift188, _,
       {__Levelholiday_fire_gift188,
	__Tracesholiday_fire_gift188}}
	  when __Levelholiday_fire_gift188 band 8 /= 0 orelse
		 __Tracesholiday_fire_gift188 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_fire_gift}, {function, check_cond},
			{line, 188}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("成长自选商城条件匹配~w出错", [Cond]), none, 4096, 8,
		       __Levelholiday_fire_gift188,
		       __Tracesholiday_fire_gift188, lager_event,
		       __Pidholiday_fire_gift188);
      _ -> ok
    end,
    check_cond(Role, T).

-spec buy(#role{}, map()) -> {ok, #role{}}.

buy(Role = #role{m_holiday_fire_gift =
		     #m_holiday_fire_gift{gift_list = GiftList,
					  old_gift_list = OldGiftList}},
    Opt = #{package_id := PackageId, sn := Sn,
	    money := Money}) ->
    case lists:keyfind(PackageId, #fire_gift_info.charge_id,
		       GiftList)
	of
      F = #fire_gift_info{id = Id, buy_count = BuyCount,
			  limit_count = LimitCount} ->
	  case BuyCount < LimitCount of
	    true ->
		Award = holiday_fire_gift_data:get_award(PackageId),
		Gain = format:val_to_gain(Award, holiday_fire_gift),
		case role_gain:do_notice(Role, Gain) of
		  {ok,
		   Role1 = #role{m_holiday_fire_gift =
				     MHolidayFireGift}} ->
		      log:log_gain(Gain, Role, Role1, <<"触发礼包"/utf8>>,
				   util:fbin(lang:get(<<"触发礼包直购,礼包id:~w 充值id:~w"/utf8>>),
					     [Id, PackageId])),
		      NewGiftList = lists:keystore(Id, #fire_gift_info.id,
						   GiftList,
						   F#fire_gift_info{buy_count =
									BuyCount
									  + 1}),
		      NewRole = Role1#role{m_holiday_fire_gift =
					       MHolidayFireGift#m_holiday_fire_gift{gift_list
											=
											NewGiftList}},
		      {NRole, InfoList} = get_info(NewRole),
		      sys_conn:pack_send(27800, {InfoList}),
		      {ok, NRole};
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_fire_gift209, _,
			 {__Levelholiday_fire_gift209,
			  __Tracesholiday_fire_gift209}}
			    when __Levelholiday_fire_gift209 band 8 /= 0 orelse
				   __Tracesholiday_fire_gift209 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_fire_gift},
					  {function, buy}, {line, 209},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】因未知原因购买触发礼包失败~w ~w ~w",
						       [Role#role.name,
							PackageId, Id, Award]),
					 none, 4096, 8,
					 __Levelholiday_fire_gift209,
					 __Tracesholiday_fire_gift209,
					 lager_event,
					 __Pidholiday_fire_gift209);
			_ -> ok
		      end,
		      {ok, Role}
		end;
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("触发礼包无法购买，改为充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ ->
	  case lists:keyfind(PackageId, #fire_gift_info.charge_id,
			     OldGiftList)
	      of
	    #fire_gift_info{} ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("触发礼包无法购买，改为充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole};
	    _ -> {ok, Role}
	  end
    end.

-spec buy_zero(#role{}, integer()) -> {ok, #role{}}.

buy_zero(Role = #role{m_holiday_fire_gift =
			  #m_holiday_fire_gift{gift_list = GiftList}},
	 PackageId) ->
    case lists:keyfind(PackageId, #fire_gift_info.charge_id,
		       GiftList)
	of
      F = #fire_gift_info{id = Id, buy_count = BuyCount,
			  limit_count = LimitCount} ->
	  case BuyCount < LimitCount of
	    true ->
		Award = holiday_fire_gift_data:get_award(PackageId),
		Gain = format:val_to_gain(Award, holiday_fire_gift),
		case role_gain:do_notice(Role, Gain) of
		  {ok,
		   Role1 = #role{m_holiday_fire_gift =
				     MHolidayFireGift}} ->
		      log:log_gain(Gain, Role, Role1, <<"触发礼包"/utf8>>,
				   util:fbin(lang:get(<<"触发礼包直购,礼包id:~w 充值id:~w"/utf8>>),
					     [Id, PackageId])),
		      NewGiftList = lists:keystore(Id, #fire_gift_info.id,
						   GiftList,
						   F#fire_gift_info{buy_count =
									BuyCount
									  + 1}),
		      NewRole = Role1#role{m_holiday_fire_gift =
					       MHolidayFireGift#m_holiday_fire_gift{gift_list
											=
											NewGiftList}},
		      {NRole, InfoList} = get_info(NewRole),
		      charge_mall:push_point(NewRole),
		      sys_conn:pack_send(27800, {InfoList}),
		      {ok, NRole};
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_fire_gift247, _,
			 {__Levelholiday_fire_gift247,
			  __Tracesholiday_fire_gift247}}
			    when __Levelholiday_fire_gift247 band 8 /= 0 orelse
				   __Tracesholiday_fire_gift247 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_fire_gift},
					  {function, buy_zero}, {line, 247},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】因未知原因购买触发礼包失败~w ~w ~w",
						       [Role#role.name,
							PackageId, Id, Award]),
					 none, 4096, 8,
					 __Levelholiday_fire_gift247,
					 __Tracesholiday_fire_gift247,
					 lager_event,
					 __Pidholiday_fire_gift247);
			_ -> ok
		      end,
		      {false, lang:get(<<"购买失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"该礼包已达购买次数上限"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"该礼包不可购买"/utf8>>)}
    end.


