-file("src/mod/data/adventure_mine_mgr.erl", 1).

-module(adventure_mine_mgr).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		  p_eqm, p_home]},
		{cluster_dynamic_local_group, [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
		{adventure_mine_owned_data, [id, pos]},
		{adventure_mine_owned, [id, list]},
		{adventure_mine_log,
		 [replay_id, floor, room_id, rid, name, lev, mine_id,
		  face, avatar_id, power, type, ret, loss, time, expire]},
		{adventure_mine_role_log, [id, logs]},
		{adventure_mine_group, [group_id, num, power, list]},
		{adventure_mine_role,
		 [id, max_power, login_time, group_id]},
		{adventure_mine_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{adventure_mine_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  set_skill, attr, ext]},
		{adventure_mine_hook,
		 [id, role_id, mine_id, plunder_count, last_hook_time,
		  acc_hook_items, acc_hook_time, occupy_time,
		  primary_count, senior_count, log]},
		{adventure_mine_group_hook, [group_id, list]},
		{adventure_mine_hole,
		 [room_id, mine_id, role_id, name, lev, face, last_fight,
		  occupy_time, defense, hallows_id, power, formation_type,
		  robot_id, cool_time, last_replay_id]},
		{adventure_mine_floor, [id, list]}, {state, []}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([do_init/0, send_info/3, send_call/3,
	 sync_role/1, merge_reward_srv/1, close_reward/0,
	 move_to_new_main/1, make_dirty/0]).

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

-file("src/mod/data/adventure_mine_mgr.erl", 23).

-file("inc/adventure_mine.hrl", 1).

-record(adventure_mine_floor, {id = {0, 0}, list = []}).

-record(adventure_mine_hole,
	{room_id = 0, mine_id = 0, role_id = {0, <<>>},
	 name = <<>>, lev = 0, face = 0, last_fight = {0, <<>>},
	 occupy_time = 0, defense = [], hallows_id = 0,
	 power = 0, formation_type = 1, robot_id = 0,
	 cool_time = 0, last_replay_id = 0}).

-record(adventure_mine_group_hook,
	{group_id = 0, list = []}).

-record(adventure_mine_hook,
	{id = {0, 0}, role_id = {0, <<>>}, mine_id = 0,
	 plunder_count = 0, last_hook_time = 0,
	 acc_hook_items = [], acc_hook_time = 0, occupy_time = 0,
	 primary_count = 0, senior_count = 0, log = []}).

-record(adventure_mine_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0, set_skill = [],
	 attr, ext = []}).

-record(adventure_mine_fight_lock,
	{id = {0, 0, 0}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-record(adventure_mine_role,
	{id = {0, <<>>}, max_power = 0, login_time = 0,
	 group_id = 0}).

-record(adventure_mine_group,
	{group_id = 0, num = 0, power = 0, list = []}).

-record(adventure_mine_role_log,
	{id = {0, <<>>}, logs = []}).

-record(adventure_mine_log,
	{replay_id = 0, floor = 0, room_id = 0, rid = {0, <<>>},
	 name = <<>>, lev = 0, mine_id = 0, face = 0,
	 avatar_id = 0, power = 0, type = 1, ret = 1, loss = [],
	 time = 0, expire = 0}).

-record(adventure_mine_owned,
	{id = {0, <<>>}, list = []}).

-record(adventure_mine_owned_data,
	{id = {0, 0}, pos = []}).

-file("src/mod/data/adventure_mine_mgr.erl", 24).

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

-file("src/mod/data/adventure_mine_mgr.erl", 25).

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

-file("src/mod/data/adventure_mine_mgr.erl", 26).

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

-file("src/mod/data/adventure_mine_mgr.erl", 27).

-file("inc/log.hrl", 1).

-file("src/mod/data/adventure_mine_mgr.erl", 28).

-file("inc/var.hrl", 1).

-record(m_var,
	{ver = -1, last_reset_time = 0  :: non_neg_integer(),
	 last_reset_day = {0, 0, 0}  ::
	     {non_neg_integer(), non_neg_integer(),
	      non_neg_integer()},
	 last_reset_five = 0  :: non_neg_integer(),
	 last_reset_week = {0, 0}  ::
	     {non_neg_integer(), non_neg_integer()},
	 last_acc_time = 0  :: non_neg_integer(),
	 acc_time = 0  :: non_neg_integer(),
	 login_charge_count = 0  :: non_neg_integer(),
	 acc_charge_count = 0  :: non_neg_integer(),
	 login_charge_num = 0  :: non_neg_integer(),
	 day_login = 0  :: non_neg_integer(),
	 acc_login_count = 0  :: non_neg_integer(),
	 total_acc_time = 0  :: non_neg_integer(),
	 acc_days = 1  :: non_neg_integer(),
	 best_days = 1  :: non_neg_integer(),
	 now_days = 1  :: non_neg_integer(),
	 month_days = 1  :: non_neg_integer(),
	 day_vars = []  :: [tuple()],
	 five_vars = []  :: [tuple()],
	 week_vars = []  :: [tuple()],
	 month_vars = []  :: [tuple()],
	 timeout_vars = []  :: [tuple()],
	 acc_vars = []  :: [tuple()],
	 other_vars = []  :: [tuple()],
	 week_five_vars = []  :: [tuple()],
	 week_five_time = 0  :: non_neg_integer()}).

-record(role_var,
	{id = {0, "", 0}  :: tuple(), vars = []  :: [tuple()]}).

-file("src/mod/data/adventure_mine_mgr.erl", 29).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/data/adventure_mine_mgr.erl", 30).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

env_info() ->
    sys_env:get(adventure_mine_info,
		#{is_main => 0, status => 0, start_time => 0,
		  end_time => 0, server_type => none, is_upload => 0}).

save_env_info(Val) ->
    sys_env:save(adventure_mine_info, Val).

info(Info) -> adventure_mine_mgr ! Info.

cast(Info) -> gen_server:cast(adventure_mine_mgr, Info).

call(Info) ->
    case catch gen_server:call(adventure_mine_mgr, Info,
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
	    {__Pidadventure_mine_mgr66, _,
	     {__Leveladventure_mine_mgr66,
	      __Tracesadventure_mine_mgr66}}
		when __Leveladventure_mine_mgr66 band 8 /= 0 orelse
		       __Tracesadventure_mine_mgr66 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_mgr}, {function, call},
			      {line, 66}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [adventure_mine_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Leveladventure_mine_mgr66,
			     __Tracesadventure_mine_mgr66, lager_event,
			     __Pidadventure_mine_mgr66);
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
    gen_server:start_link({local, adventure_mine_mgr},
			  adventure_mine_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr72, _,
       {__Leveladventure_mine_mgr72,
	__Tracesadventure_mine_mgr72}}
	  when __Leveladventure_mine_mgr72 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr72 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr}, {function, init},
			{line, 72}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [adventure_mine_mgr]),
		       none, 4096, 64, __Leveladventure_mine_mgr72,
		       __Tracesadventure_mine_mgr72, lager_event,
		       __Pidadventure_mine_mgr72);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(adventure_mine_floor,
			"dets/adventure_mine_floor.dets",
			#adventure_mine_floor.id, set),
    d_ets_lib:load_dets_to_ets(adventure_mine_floor,
			       undefined),
    d_ets_lib:new_d_ets(adventure_mine_role,
			"dets/adventure_mine_role.dets",
			#adventure_mine_role.id, set),
    d_ets_lib:load_dets_to_ets(adventure_mine_role,
			       undefined),
    d_ets_lib:new_d_ets(adventure_mine_role_bak,
			"dets/adventure_mine_role_bak.dets",
			#adventure_mine_role.id, set),
    d_ets_lib:load_dets_to_ets(adventure_mine_role_bak,
			       undefined),
    d_ets_lib:new_d_ets(adventure_mine_group,
			"dets/adventure_mine_group.dets",
			#adventure_mine_group.group_id, set),
    d_ets_lib:load_dets_to_ets(adventure_mine_group,
			       undefined),
    d_ets_lib:new_d_ets(adventure_mine_owned,
			"dets/adventure_mine_owned.dets",
			#adventure_mine_owned.id, set),
    d_ets_lib:load_dets_to_ets(adventure_mine_owned,
			       undefined),
    d_ets_lib:new_d_ets(adventure_mine_group_hook,
			"dets/adventure_mine_group_hook.dets",
			#adventure_mine_group_hook.group_id, set),
    d_ets_lib:load_dets_to_ets(adventure_mine_group_hook,
			       undefined),
    d_ets_lib:new_d_ets(adventure_mine_floor_max,
			"dets/adventure_mine_floor_max.dets", 1, set),
    d_ets_lib:load_dets_to_ets(adventure_mine_floor_max,
			       undefined),
    ets:new(adventure_mine_fight_lock,
	    [set, named_table, public,
	     {keypos, #adventure_mine_fight_lock.id}]),
    ets:new(adventure_mine_zone,
	    [set, named_table, public, {keypos, 1}]),
    do_init(),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr104, _,
       {__Leveladventure_mine_mgr104,
	__Tracesadventure_mine_mgr104}}
	  when __Leveladventure_mine_mgr104 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr104 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr}, {function, init},
			{line, 104}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [adventure_mine_mgr]), none,
		       4096, 64, __Leveladventure_mine_mgr104,
		       __Tracesadventure_mine_mgr104, lager_event,
		       __Pidadventure_mine_mgr104);
      _ -> ok
    end,
    {ok, State}.

do_init() ->
    case env_info() of
      #{server_type := none} -> ok;
      _ ->
	  Fun = fun (#adventure_mine_group{group_id = GroupId},
		     Acc) ->
			adventure_mine_zone:start_link(GroupId),
			max(GroupId, Acc)
		end,
	  ets:foldl(Fun, 0, adventure_mine_group)
    end.

do_reset() ->
    Maps = env_info(),
    SrvList0 = maps:get(srv_list, Maps, []),
    SrvFullId = sys_lib:srv_full_id(),
    SrvList = SrvFullId ++ SrvList0,
    L = ets:tab2list(adventure_mine_role),
    Time = date:unixtime() - 86400 * 3,
    L1 = [R
	  || R = #adventure_mine_role{id = {_, SrvId},
				      login_time = LoginTime}
		 <- L,
	     LoginTime >= Time, lists:member(SrvId, SrvList)],
    L2 =
	lists:reverse(lists:keysort(#adventure_mine_role.max_power,
				    L1)),
    {GroupL, NewRL} = case L2 of
			[] -> {new_group(10, []), []};
			_ -> calc_group(L2, 1, [], [])
		      end,
    d_ets_lib:clear_d_ets(adventure_mine_role),
    d_ets_lib:clear_d_ets(adventure_mine_group),
    d_ets_lib:save_d_ets(adventure_mine_role, NewRL),
    d_ets_lib:save_d_ets(adventure_mine_group, GroupL),
    ok.

new_group(0, GroupL) -> GroupL;
new_group(GroupId, GroupL) ->
    NewGroup = #adventure_mine_group{group_id = GroupId},
    init_group(GroupId),
    new_group(GroupId - 1, [NewGroup | GroupL]).

calc_group([], _GroupId, GroupL, NewRL) ->
    {GroupL, NewRL};
calc_group(RL, GroupId, GroupL, NewRL) ->
    {RL1, RL2} =
	list_util:split(adventure_mine_data:get_const(max_grouping),
			RL),
    case length(RL1) <
	   adventure_mine_data:get_const(merge_grouping)
	   andalso GroupId > 1 andalso GroupL =/= []
	of
      true ->
	  [LastGroup = #adventure_mine_group{group_id =
						 LastGroupId,
					     num = LastNum,
					     power = LastAvgPower,
					     list = LastRIdL1}
	   | _] =
	      GroupL,
	  {RIdL1, NewRL1, Num, AllPower} = role_group_data(RL1,
							   [], [], LastGroupId,
							   0, 0),
	  NewAvgPower = util:round((LastAvgPower * LastNum +
				      AllPower)
				     / (LastNum + Num)),
	  NewGroup = LastGroup#adventure_mine_group{num =
							LastNum + Num,
						    power = NewAvgPower,
						    list = RIdL1 ++ LastRIdL1},
	  NGroupL = lists:keystore(LastGroupId,
				   #adventure_mine_group.group_id, GroupL,
				   NewGroup),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr167, _,
	     {__Leveladventure_mine_mgr167,
	      __Tracesadventure_mine_mgr167}}
		when __Leveladventure_mine_mgr167 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr167 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, calc_group}, {line, 167},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("矿战最后一组分组，合并到前一组 ~w",
					   [{LastGroupId, RIdL1, Num,
					     AllPower}]),
			     none, 4096, 64, __Leveladventure_mine_mgr167,
			     __Tracesadventure_mine_mgr167, lager_event,
			     __Pidadventure_mine_mgr167);
	    _ -> ok
	  end,
	  calc_group(RL2, LastGroupId + 1, NGroupL,
		     NewRL1 ++ NewRL);
      _ ->
	  {RIdL1, NewRL1, Num, AllPower} = role_group_data(RL1,
							   [], [], GroupId, 0,
							   0),
	  AvgPower = util:round(AllPower / max(1, Num)),
	  NewGroup = #adventure_mine_group{group_id = GroupId,
					   num = Num, power = AvgPower,
					   list = RIdL1},
	  init_group(GroupId),
	  calc_group(RL2, GroupId + 1, [NewGroup | GroupL],
		     NewRL1 ++ NewRL)
    end.

role_group_data([], RoleIdL, NewRL, _GroupId, Num,
		AllPower) ->
    {RoleIdL, NewRL, Num, AllPower};
role_group_data([R = #adventure_mine_role{id = RoleId,
					  max_power = Power}
		 | Other],
		RoleIdL, L, GroupId, Num, AllPower) ->
    NewR = R#adventure_mine_role{group_id = GroupId},
    NewRoleIdL = [RoleId | RoleIdL],
    role_group_data(Other, NewRoleIdL, [NewR | L], GroupId,
		    Num + 1, AllPower + Power).

init_group(GroupId) ->
    FloorIds = adventure_mine_data:floor_list(),
    FloorList = init_floor(FloorIds, GroupId, []),
    d_ets_lib:save_d_ets(adventure_mine_floor, FloorList),
    adventure_mine_zone:start_link(GroupId),
    ok.

init_floor([], _GroupId, FloorList) -> FloorList;
init_floor([Floor | Other], GroupId, FloorList) ->
    MineIds = adventure_mine_data:get_floor_mine(Floor),
    MineHoleList = init_mine(MineIds, [], []),
    NewMineFloor = #adventure_mine_floor{id =
					     {GroupId, Floor},
					 list = MineHoleList},
    init_floor(Other, GroupId, [NewMineFloor | FloorList]).

init_mine([], _, MineHoleList) -> MineHoleList;
init_mine([MineId | Other], UsedRoomIds,
	  MineHoleList) ->
    case adventure_mine_data:get_mine_hole(MineId) of
      {RoomList, RobotIds, LevList, RobotName} ->
	  RoomId = case RoomList -- UsedRoomIds of
		     NRoomList = [_ | _] -> util:rand_list(NRoomList);
		     _ ->
			 AllRoomIds = lists:seq(1, 25),
			 RestRoomIds = AllRoomIds -- UsedRoomIds,
			 util:rand_list(RestRoomIds)
		   end,
	  {RobotId, _} = util:rand_list(RobotIds, 2),
	  FaceId =
	      util:rand_list(sky_ladder_data:get_const(robot_head)),
	  {Lev0, Lev1, Lev2} = util:rand_list(LevList),
	  AddLev = util:rand(Lev2, Lev1),
	  Lev = Lev0 + AddLev,
	  Role0 = role_data:first_init(#role{id =
						 {1, sys_env:get(server_id)},
					     type = robot}),
	  Role = Role0#role{lev = Lev},
	  case catch robot:get(Role, RobotId, #{}) of
	    #{partners := Partners} ->
		Power = lists:sum([PowerT
				   || #partner{power = PowerT} <- Partners]),
		Defense = [#adventure_mine_pos{pos = PId, id = PId,
					       bid = PBId, lev = PLev,
					       star = PStar,
					       break_lev = BreakLev,
					       power = PowerT}
			   || #partner{id = PId, bid = PBId, lev = PLev,
				       star = PStar, break_lev = BreakLev,
				       power = PowerT}
				  <- Partners],
		NewMineHole = #adventure_mine_hole{room_id = RoomId,
						   name = RobotName, lev = Lev,
						   face = FaceId,
						   mine_id = MineId,
						   power = Power,
						   robot_id = RobotId,
						   defense = Defense},
		init_mine(Other, [RoomId | UsedRoomIds],
			  [NewMineHole | MineHoleList]);
	    _ERR ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadventure_mine_mgr230, _,
		   {__Leveladventure_mine_mgr230,
		    __Tracesadventure_mine_mgr230}}
		      when __Leveladventure_mine_mgr230 band 8 /= 0 orelse
			     __Tracesadventure_mine_mgr230 /= [] ->
		      lager:do_log(error,
				   [{module, adventure_mine_mgr},
				    {function, init_mine}, {line, 230},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("生成机器人出错 ~w", [_ERR]), none,
				   4096, 8, __Leveladventure_mine_mgr230,
				   __Tracesadventure_mine_mgr230, lager_event,
				   __Pidadventure_mine_mgr230);
		  _ -> ok
		end,
		init_mine(Other, UsedRoomIds, MineHoleList)
	  end;
      _ -> init_mine(Other, UsedRoomIds, MineHoleList)
    end.

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
	    {__Pidadventure_mine_mgr242, _,
	     {__Leveladventure_mine_mgr242,
	      __Tracesadventure_mine_mgr242}}
		when __Leveladventure_mine_mgr242 band 8 /= 0 orelse
		       __Tracesadventure_mine_mgr242 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_mgr},
			      {function, handle_call}, {line, 242},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Leveladventure_mine_mgr242,
			     __Tracesadventure_mine_mgr242, lager_event,
			     __Pidadventure_mine_mgr242);
	    _ -> ok
	  end,
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
	    {__Pidadventure_mine_mgr254, _,
	     {__Leveladventure_mine_mgr254,
	      __Tracesadventure_mine_mgr254}}
		when __Leveladventure_mine_mgr254 band 8 /= 0 orelse
		       __Tracesadventure_mine_mgr254 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_mgr},
			      {function, handle_info}, {line, 254},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Leveladventure_mine_mgr254,
			     __Tracesadventure_mine_mgr254, lager_event,
			     __Pidadventure_mine_mgr254);
	    _ -> ok
	  end,
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
      {__Pidadventure_mine_mgr267, _,
       {__Leveladventure_mine_mgr267,
	__Tracesadventure_mine_mgr267}}
	  when __Leveladventure_mine_mgr267 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr267 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr}, {function, terminate},
			{line, 267}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Leveladventure_mine_mgr267,
		       __Tracesadventure_mine_mgr267, lager_event,
		       __Pidadventure_mine_mgr267);
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
	    {__Pidadventure_mine_mgr279, _,
	     {__Leveladventure_mine_mgr279,
	      __Tracesadventure_mine_mgr279}}
		when __Leveladventure_mine_mgr279 band 8 /= 0 orelse
		       __Tracesadventure_mine_mgr279 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_call}, {line, 279},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Leveladventure_mine_mgr279,
			     __Tracesadventure_mine_mgr279, lager_event,
			     __Pidadventure_mine_mgr279);
	    _ -> ok
	  end,
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
	    {__Pidadventure_mine_mgr291, _,
	     {__Leveladventure_mine_mgr291,
	      __Tracesadventure_mine_mgr291}}
		when __Leveladventure_mine_mgr291 band 8 /= 0 orelse
		       __Tracesadventure_mine_mgr291 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 291},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Leveladventure_mine_mgr291,
			     __Tracesadventure_mine_mgr291, lager_event,
			     __Pidadventure_mine_mgr291);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
do_handle_info({add_log, RoleId,
		LogData = #adventure_mine_log{rid = {_, BSrvId},
					      replay_id = NReplayId,
					      ret = Ret}},
	       State) ->
    OldLog = #adventure_mine_role_log{logs = Logs} =
		 adventure_mine_lib:get_log(RoleId),
    cluster_lib:cast(BSrvId, combat_replay_mgr,
		     acc_replay_reference, [NReplayId]),
    {NewLogs, DelLogs} = list_util:split(20,
					 [LogData | Logs]),
    [cluster_lib:cast(BSrvId0, combat_replay_mgr,
		      dec_replay_reference, [ReplayId])
     || #adventure_mine_log{rid = {_, BSrvId0},
			    replay_id = ReplayId}
	    <- DelLogs],
    d_ets_lib:save_ets(adventure_mine_role_log,
		       OldLog#adventure_mine_role_log{logs = NewLogs}),
    case Ret of
      2 ->
	  var:acc_role_var(RoleId, other, 13, 0),
	  notice_below:send(RoleId, mine_defeat);
      _ -> skip
    end,
    role:pack_send(RoleId, 20657, {1}),
    {noreply, State};
do_handle_info({change_log, RoleId, ReplayId}, State) ->
    OldLog = #adventure_mine_role_log{logs = Logs} =
		 adventure_mine_lib:get_log(RoleId),
    case lists:keyfind(ReplayId,
		       #adventure_mine_log.replay_id, Logs)
	of
      LogData = #adventure_mine_log{} ->
	  NewLogData = LogData#adventure_mine_log{ret = 3},
	  NewLogs = lists:keystore(ReplayId,
				   #adventure_mine_log.replay_id, Logs,
				   NewLogData),
	  d_ets_lib:save_ets(adventure_mine_role_log,
			     OldLog#adventure_mine_role_log{logs = NewLogs});
      _ -> skip
    end,
    {noreply, State};
do_handle_info(reward, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr323, _,
       {__Leveladventure_mine_mgr323,
	__Tracesadventure_mine_mgr323}}
	  when __Leveladventure_mine_mgr323 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr323 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, do_handle_info}, {line, 323},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "矿战结算", none, 4096, 64, __Leveladventure_mine_mgr323,
		       __Tracesadventure_mine_mgr323, lager_event,
		       __Pidadventure_mine_mgr323);
      _ -> ok
    end,
    Pids = ets:tab2list(adventure_mine_zone),
    [Pid ! {stop, normal} || {_, Pid} <- Pids],
    ets:delete_all_objects(adventure_mine_zone),
    GroupHook = ets:tab2list(adventure_mine_group_hook),
    do_reward(GroupHook),
    d_ets_lib:clear_d_ets(adventure_mine_floor),
    d_ets_lib:clear_d_ets(adventure_mine_group),
    d_ets_lib:clear_d_ets(adventure_mine_owned),
    d_ets_lib:clear_d_ets(adventure_mine_group_hook),
    ets:delete_all_objects(adventure_mine_fight_lock),
    util:set_timer(first_init_timer, 60 * 7, reset),
    info(del_overdue_log),
    Info = env_info(),
    save_env_info(Info#{status => 0}),
    {noreply, State};
do_handle_info(reset, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr344, _,
       {__Leveladventure_mine_mgr344,
	__Tracesadventure_mine_mgr344}}
	  when __Leveladventure_mine_mgr344 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr344 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, do_handle_info}, {line, 344},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "冒险矿战开始重置", none, 4096, 64,
		       __Leveladventure_mine_mgr344,
		       __Tracesadventure_mine_mgr344, lager_event,
		       __Pidadventure_mine_mgr344);
      _ -> ok
    end,
    case env_info() of
      Info = #{status := 1} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr347, _,
	     {__Leveladventure_mine_mgr347,
	      __Tracesadventure_mine_mgr347}}
		when __Leveladventure_mine_mgr347 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr347 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 347},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("冒险矿战重置时已经开启了 ~w", [Info]), none,
			     4096, 64, __Leveladventure_mine_mgr347,
			     __Tracesadventure_mine_mgr347, lager_event,
			     __Pidadventure_mine_mgr347);
	    _ -> ok
	  end,
	  skip;
      Info = #{server_type := none} ->
	  ets:insert(adventure_mine_role,
		     ets:tab2list(adventure_mine_role_bak)),
	  NewInfo = Info#{server_type => local, status => 1},
	  save_env_info(NewInfo),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr353, _,
	     {__Leveladventure_mine_mgr353,
	      __Tracesadventure_mine_mgr353}}
		when __Leveladventure_mine_mgr353 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr353 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 353},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("1冒险矿战重置前 ~w 重置后 ~w",
					   [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr353,
			     __Tracesadventure_mine_mgr353, lager_event,
			     __Pidadventure_mine_mgr353);
	    _ -> ok
	  end,
	  do_reset();
      Info = #{server_type := local} ->
	  save_env_info(Info#{status => 1}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr357, _,
	     {__Leveladventure_mine_mgr357,
	      __Tracesadventure_mine_mgr357}}
		when __Leveladventure_mine_mgr357 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr357 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 357},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("2冒险矿战重置前 ~w", [Info]), none, 4096,
			     64, __Leveladventure_mine_mgr357,
			     __Tracesadventure_mine_mgr357, lager_event,
			     __Pidadventure_mine_mgr357);
	    _ -> ok
	  end,
	  do_reset();
      Info = #{server_type := ready_cluster, is_main := 1} ->
	  {MainSrvId, AllSrvList} = get_cluster_group(),
	  NewInfo = Info#{server_type => cluster,
			  main_id => MainSrvId, srv_list => AllSrvList,
			  status => 1},
	  save_env_info(NewInfo),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr363, _,
	     {__Leveladventure_mine_mgr363,
	      __Tracesadventure_mine_mgr363}}
		when __Leveladventure_mine_mgr363 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr363 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 363},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("3冒险矿战重置前 ~w 重置后 ~w",
					   [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr363,
			     __Tracesadventure_mine_mgr363, lager_event,
			     __Pidadventure_mine_mgr363);
	    _ -> ok
	  end,
	  do_reset();
      Info = #{server_type := ready_cluster} ->
	  {MainSrvId, AllSrvList} = get_cluster_group(),
	  NewInfo = Info#{server_type => cluster,
			  main_id => MainSrvId, srv_list => AllSrvList,
			  status => 1},
	  save_env_info(NewInfo),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr369, _,
	     {__Leveladventure_mine_mgr369,
	      __Tracesadventure_mine_mgr369}}
		when __Leveladventure_mine_mgr369 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr369 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 369},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("4冒险矿战重置前 ~w 重置后 ~w",
					   [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr369,
			     __Tracesadventure_mine_mgr369, lager_event,
			     __Pidadventure_mine_mgr369);
	    _ -> ok
	  end,
	  skip;
      Info = #{server_type := cluster, is_main := 1} ->
	  save_env_info(Info#{status => 1}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr373, _,
	     {__Leveladventure_mine_mgr373,
	      __Tracesadventure_mine_mgr373}}
		when __Leveladventure_mine_mgr373 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr373 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 373},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("5冒险矿战重置前 ~w", [Info]), none, 4096,
			     64, __Leveladventure_mine_mgr373,
			     __Tracesadventure_mine_mgr373, lager_event,
			     __Pidadventure_mine_mgr373);
	    _ -> ok
	  end,
	  do_reset();
      Info = #{server_type := change_cluster} ->
	  {MainSrvId, AllSrvList} = get_cluster_group(),
	  IsMain = util:if_true(cluster_dynamic_group:is_main(1),
				1, 0),
	  NewInfo = Info#{server_type => cluster,
			  is_main => IsMain, main_id => MainSrvId,
			  srv_list => AllSrvList, status => 1},
	  save_env_info(NewInfo),
	  case IsMain =:= 1 of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadventure_mine_mgr382, _,
		   {__Leveladventure_mine_mgr382,
		    __Tracesadventure_mine_mgr382}}
		      when __Leveladventure_mine_mgr382 band 64 /= 0 orelse
			     __Tracesadventure_mine_mgr382 /= [] ->
		      lager:do_log(info,
				   [{module, adventure_mine_mgr},
				    {function, do_handle_info}, {line, 382},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("6冒险矿战重置前 ~w 重置后 ~w",
						 [Info, NewInfo]),
				   none, 4096, 64, __Leveladventure_mine_mgr382,
				   __Tracesadventure_mine_mgr382, lager_event,
				   __Pidadventure_mine_mgr382);
		  _ -> ok
		end,
		do_reset();
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadventure_mine_mgr385, _,
		   {__Leveladventure_mine_mgr385,
		    __Tracesadventure_mine_mgr385}}
		      when __Leveladventure_mine_mgr385 band 64 /= 0 orelse
			     __Tracesadventure_mine_mgr385 /= [] ->
		      lager:do_log(info,
				   [{module, adventure_mine_mgr},
				    {function, do_handle_info}, {line, 385},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("7冒险矿战重置前 ~w 重置后 ~w",
						 [Info, NewInfo]),
				   none, 4096, 64, __Leveladventure_mine_mgr385,
				   __Tracesadventure_mine_mgr385, lager_event,
				   __Pidadventure_mine_mgr385);
		  _ -> ok
		end,
		skip
	  end;
      Info = #{server_type := pre_cluster} ->
	  {MainSrvId, AllSrvList} = get_cluster_group(),
	  IsMain = util:if_true(cluster_dynamic_group:is_main(1),
				1, 0),
	  NewInfo = Info#{server_type => cluster,
			  is_main => IsMain, main_id => MainSrvId,
			  srv_list => AllSrvList, status => 1},
	  save_env_info(NewInfo),
	  case IsMain =:= 1 of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadventure_mine_mgr395, _,
		   {__Leveladventure_mine_mgr395,
		    __Tracesadventure_mine_mgr395}}
		      when __Leveladventure_mine_mgr395 band 64 /= 0 orelse
			     __Tracesadventure_mine_mgr395 /= [] ->
		      lager:do_log(info,
				   [{module, adventure_mine_mgr},
				    {function, do_handle_info}, {line, 395},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("8冒险矿战重置前 ~w 重置后 ~w",
						 [Info, NewInfo]),
				   none, 4096, 64, __Leveladventure_mine_mgr395,
				   __Tracesadventure_mine_mgr395, lager_event,
				   __Pidadventure_mine_mgr395);
		  _ -> ok
		end,
		do_reset();
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadventure_mine_mgr398, _,
		   {__Leveladventure_mine_mgr398,
		    __Tracesadventure_mine_mgr398}}
		      when __Leveladventure_mine_mgr398 band 64 /= 0 orelse
			     __Tracesadventure_mine_mgr398 /= [] ->
		      lager:do_log(info,
				   [{module, adventure_mine_mgr},
				    {function, do_handle_info}, {line, 398},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("9冒险矿战重置前 ~w 重置后 ~w",
						 [Info, NewInfo]),
				   none, 4096, 64, __Leveladventure_mine_mgr398,
				   __Tracesadventure_mine_mgr398, lager_event,
				   __Pidadventure_mine_mgr398);
		  _ -> ok
		end,
		skip
	  end;
      Info ->
	  save_env_info(Info#{status => 1}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr403, _,
	     {__Leveladventure_mine_mgr403,
	      __Tracesadventure_mine_mgr403}}
		when __Leveladventure_mine_mgr403 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr403 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 403},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("10冒险矿战重置前 ~w", [Info]), none, 4096,
			     64, __Leveladventure_mine_mgr403,
			     __Tracesadventure_mine_mgr403, lager_event,
			     __Pidadventure_mine_mgr403);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, State};
do_handle_info(cluster_main, State) ->
    IsMain = util:if_true(cluster_dynamic_group:is_main(1),
			  1, 0),
    case env_info() of
      Info = #{server_type := none} when IsMain == 1 ->
	  ets:insert(adventure_mine_role,
		     ets:tab2list(adventure_mine_role_bak)),
	  NewInfo = Info#{server_type => ready_cluster,
			  is_main => IsMain},
	  save_env_info(NewInfo),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr415, _,
	     {__Leveladventure_mine_mgr415,
	      __Tracesadventure_mine_mgr415}}
		when __Leveladventure_mine_mgr415 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr415 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 415},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("1冒险矿战连接前 ~w 连接后 ~w",
					   [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr415,
			     __Tracesadventure_mine_mgr415, lager_event,
			     __Pidadventure_mine_mgr415);
	    _ -> ok
	  end,
	  ok;
      Info = #{server_type := none} ->
	  NewInfo = Info#{server_type => ready_cluster,
			  is_main => IsMain},
	  save_env_info(NewInfo),
	  info(re_sync_robot_to_main_zone),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr421, _,
	     {__Leveladventure_mine_mgr421,
	      __Tracesadventure_mine_mgr421}}
		when __Leveladventure_mine_mgr421 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr421 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 421},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("2冒险矿战连接前 ~w 连接后 ~w",
					   [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr421,
			     __Tracesadventure_mine_mgr421, lager_event,
			     __Pidadventure_mine_mgr421);
	    _ -> ok
	  end,
	  ok;
      Info = #{server_type := local} ->
	  NewInfo = Info#{server_type => pre_cluster,
			  is_main => IsMain},
	  save_env_info(NewInfo),
	  info(re_sync_robot_to_main_zone),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr427, _,
	     {__Leveladventure_mine_mgr427,
	      __Tracesadventure_mine_mgr427}}
		when __Leveladventure_mine_mgr427 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr427 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 427},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("3冒险矿战连接前 ~w 连接后 ~w",
					   [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr427,
			     __Tracesadventure_mine_mgr427, lager_event,
			     __Pidadventure_mine_mgr427);
	    _ -> ok
	  end,
	  ok;
      _Info ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr430, _,
	     {__Leveladventure_mine_mgr430,
	      __Tracesadventure_mine_mgr430}}
		when __Leveladventure_mine_mgr430 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr430 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 430},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("4冒险矿战连接前 ~w", [_Info]), none, 4096,
			     64, __Leveladventure_mine_mgr430,
			     __Tracesadventure_mine_mgr430, lager_event,
			     __Pidadventure_mine_mgr430);
	    _ -> ok
	  end,
	  ok
    end,
    {noreply, State};
do_handle_info(cluster_change, State) ->
    IsMain = util:if_true(cluster_dynamic_group:is_main(1),
			  1, 0),
    case env_info() of
      Info = #{server_type := local} ->
	  NewInfo = Info#{server_type => pre_cluster,
			  is_main => IsMain},
	  save_env_info(NewInfo),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr441, _,
	     {__Leveladventure_mine_mgr441,
	      __Tracesadventure_mine_mgr441}}
		when __Leveladventure_mine_mgr441 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr441 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 441},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("1冒险矿战跨服变更前 ~w 变更后 ~w",
					   [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr441,
			     __Tracesadventure_mine_mgr441, lager_event,
			     __Pidadventure_mine_mgr441);
	    _ -> ok
	  end,
	  ok;
      Info = #{server_type := cluster} ->
	  NewInfo = Info#{server_type => change_cluster},
	  save_env_info(NewInfo),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr446, _,
	     {__Leveladventure_mine_mgr446,
	      __Tracesadventure_mine_mgr446}}
		when __Leveladventure_mine_mgr446 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr446 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 446},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("2冒险矿战跨服变更前 ~w 变更后 ~w",
					   [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr446,
			     __Tracesadventure_mine_mgr446, lager_event,
			     __Pidadventure_mine_mgr446);
	    _ -> ok
	  end,
	  ok;
      Info = #{server_type := none} ->
	  NewInfo = Info#{server_type => pre_cluster,
			  is_main => IsMain},
	  save_env_info(NewInfo),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr451, _,
	     {__Leveladventure_mine_mgr451,
	      __Tracesadventure_mine_mgr451}}
		when __Leveladventure_mine_mgr451 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr451 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 451},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("4冒险矿战跨服变更前 ~w 变更后 ~w",
					   [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr451,
			     __Tracesadventure_mine_mgr451, lager_event,
			     __Pidadventure_mine_mgr451);
	    _ -> ok
	  end,
	  ok;
      _Info ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr454, _,
	     {__Leveladventure_mine_mgr454,
	      __Tracesadventure_mine_mgr454}}
		when __Leveladventure_mine_mgr454 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr454 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 454},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("3冒险矿战跨服变更前 ~w", [_Info]), none,
			     4096, 64, __Leveladventure_mine_mgr454,
			     __Tracesadventure_mine_mgr454, lager_event,
			     __Pidadventure_mine_mgr454);
	    _ -> ok
	  end,
	  ok
    end,
    {noreply, State};
do_handle_info(check_is_open, State) ->
    case env_info() of
      #{status := 1} -> skip;
      Info = #{server_type := change_cluster,
	       main_id := MainSrvId} ->
	  SrvId = sys_env:get(server_id),
	  case MainSrvId == SrvId of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadventure_mine_mgr467, _,
		   {__Leveladventure_mine_mgr467,
		    __Tracesadventure_mine_mgr467}}
		      when __Leveladventure_mine_mgr467 band 64 /= 0 orelse
			     __Tracesadventure_mine_mgr467 /= [] ->
		      lager:do_log(info,
				   [{module, adventure_mine_mgr},
				    {function, do_handle_info}, {line, 467},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("该服务器没有开启矿战 ~w", [Info]), none,
				   4096, 64, __Leveladventure_mine_mgr467,
				   __Tracesadventure_mine_mgr467, lager_event,
				   __Pidadventure_mine_mgr467);
		  _ -> ok
		end,
		info(reset),
		ok;
	    _ ->
		case
		  adventure_mine_lib:cluster_get_adventure_mine_floor_cli(1,
									  10)
		    of
		  {ok, _} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidadventure_mine_mgr473, _,
			 {__Leveladventure_mine_mgr473,
			  __Tracesadventure_mine_mgr473}}
			    when __Leveladventure_mine_mgr473 band 64 /= 0
				   orelse __Tracesadventure_mine_mgr473 /= [] ->
			    lager:do_log(info,
					 [{module, adventure_mine_mgr},
					  {function, do_handle_info},
					  {line, 473},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("该服务器居然刚好能开矿战 ~w",
						       [Info]),
					 none, 4096, 64,
					 __Leveladventure_mine_mgr473,
					 __Tracesadventure_mine_mgr473,
					 lager_event,
					 __Pidadventure_mine_mgr473);
			_ -> ok
		      end,
		      skip;
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
			{__Pidadventure_mine_mgr476, _,
			 {__Leveladventure_mine_mgr476,
			  __Tracesadventure_mine_mgr476}}
			    when __Leveladventure_mine_mgr476 band 64 /= 0
				   orelse __Tracesadventure_mine_mgr476 /= [] ->
			    lager:do_log(info,
					 [{module, adventure_mine_mgr},
					  {function, do_handle_info},
					  {line, 476},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("该服务器没有开启矿战2 ~w",
						       [Info]),
					 none, 4096, 64,
					 __Leveladventure_mine_mgr476,
					 __Tracesadventure_mine_mgr476,
					 lager_event,
					 __Pidadventure_mine_mgr476);
			_ -> ok
		      end,
		      info(reset),
		      ok
		end
	  end;
      _Info -> skip
    end,
    {noreply, State};
do_handle_info(re_sync_robot_to_main_zone, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr487, _,
       {__Leveladventure_mine_mgr487,
	__Tracesadventure_mine_mgr487}}
	  when __Leveladventure_mine_mgr487 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr487 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, do_handle_info}, {line, 487},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始同步矿战机器人数据到主服", none, 4096, 64,
		       __Leveladventure_mine_mgr487,
		       __Tracesadventure_mine_mgr487, lager_event,
		       __Pidadventure_mine_mgr487);
      _ -> ok
    end,
    Time = date:unixtime() - 86400 * 3,
    L = ets:select(adventure_mine_role_bak,
		   [{{adventure_mine_role, '_', '_', '$1', '_'},
		     [{'>=', '$1', {const, Time}}], ['$_']}]),
    put(adventure_mine_role_bak, L),
    erlang:send_after(util:rand(1, 180), self(),
		      sync_robot_to_main_zone),
    {noreply, State};
do_handle_info(sync_robot_to_main_zone, State) ->
    case get(adventure_mine_role_bak) of
      [PushRole = #adventure_mine_role{} | L] ->
	  {AddPushRole, NextL} = list_util:split(20, L),
	  cluster_dynamic_group:cast_main(1, adventure_mine_mgr,
					  info,
					  [{main_zone_update_robot,
					    [PushRole | AddPushRole]}]),
	  put(adventure_mine_role_bak, NextL),
	  erlang:send_after(util:rand(100, 280), self(),
			    sync_robot_to_main_zone);
      _ -> ok
    end,
    {noreply, State};
do_handle_info({main_zone_update_robot,
		PushList = [#adventure_mine_role{} | _]},
	       State) ->
    Fun = fun (PushRole = #adventure_mine_role{id =
						   RoleId}) ->
		  case ets:lookup(adventure_mine_role, RoleId) of
		    [#adventure_mine_role{group_id = GroupId}] ->
			d_ets_lib:save_d_ets(adventure_mine_role,
					     PushRole#adventure_mine_role{group_id
									      =
									      GroupId});
		    _ -> d_ets_lib:save_d_ets(adventure_mine_role, PushRole)
		  end
	  end,
    lists:foreach(Fun, PushList),
    {noreply, State};
do_handle_info({update_main_robot,
		PushRole = #adventure_mine_role{id = RoleId,
						max_power = MaxPower,
						login_time = LoginTime}},
	       State) ->
    case ets:member(adventure_mine_role, RoleId) of
      true ->
	  L = [{#adventure_mine_role.max_power, MaxPower},
	       {#adventure_mine_role.login_time, LoginTime}],
	  ets:update_element(adventure_mine_role, RoleId, L);
      _ ->
	  L = ets:tab2list(adventure_mine_group),
	  case to_match(L, MaxPower) of
	    Group = #adventure_mine_group{group_id = GroupId,
					  num = Num, power = AvgPower,
					  list = List} ->
		NewPushRole = PushRole#adventure_mine_role{group_id =
							       GroupId},
		d_ets_lib:save_d_ets(adventure_mine_role, NewPushRole),
		NewAvgPower = util:round((AvgPower * Num + MaxPower) /
					   (Num + 1)),
		NewGroup = Group#adventure_mine_group{num = Num + 1,
						      power = NewAvgPower,
						      list = [RoleId | List]},
		d_ets_lib:save_d_ets(adventure_mine_group, NewGroup);
	    _ ->
		case util:rand_list(L) of
		  undefined ->
		      d_ets_lib:save_d_ets(adventure_mine_role, PushRole);
		  Group = #adventure_mine_group{group_id = GroupId,
						num = Num, power = AvgPower,
						list = List} ->
		      NewPushRole = PushRole#adventure_mine_role{group_id =
								     GroupId},
		      d_ets_lib:save_d_ets(adventure_mine_role, NewPushRole),
		      NewAvgPower = util:round((AvgPower * Num + MaxPower) /
						 (Num + 1)),
		      NewGroup = Group#adventure_mine_group{num = Num + 1,
							    power = NewAvgPower,
							    list =
								[RoleId
								 | List]},
		      d_ets_lib:save_d_ets(adventure_mine_group, NewGroup);
		  _ERR ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidadventure_mine_mgr541, _,
			 {__Leveladventure_mine_mgr541,
			  __Tracesadventure_mine_mgr541}}
			    when __Leveladventure_mine_mgr541 band 8 /= 0 orelse
				   __Tracesadventure_mine_mgr541 /= [] ->
			    lager:do_log(error,
					 [{module, adventure_mine_mgr},
					  {function, do_handle_info},
					  {line, 541},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("还有其他情况 ~w", [_ERR]),
					 none, 4096, 8,
					 __Leveladventure_mine_mgr541,
					 __Tracesadventure_mine_mgr541,
					 lager_event,
					 __Pidadventure_mine_mgr541);
			_ -> ok
		      end,
		      skip
		end
	  end
    end,
    {noreply, State};
do_handle_info(del_overdue_log, State) ->
    Fun = fun (#adventure_mine_role_log{id = RoleId,
					logs = Logs},
	       Acc) ->
		  [cluster_lib:cast(BSrvId, combat_replay_mgr,
				    dec_replay_reference, [Temp])
		   || #adventure_mine_log{replay_id = Temp,
					  rid = {_, BSrvId}}
			  <- Logs],
		  var:update_role_var_list(RoleId, other, [{del, 13}]),
		  Acc;
	      (_, Acc) -> Acc
	  end,
    ets:foldl(Fun, [], adventure_mine_role_log),
    dets:delete_all_objects(adventure_mine_role_log),
    ets:delete_all_objects(adventure_mine_role_log),
    {noreply, State};
do_handle_info({close_reward}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr560, _,
       {__Leveladventure_mine_mgr560,
	__Tracesadventure_mine_mgr560}}
	  when __Leveladventure_mine_mgr560 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr560 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, do_handle_info}, {line, 560},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("收到通知，处理的结算", []), none, 4096, 64,
		       __Leveladventure_mine_mgr560,
		       __Tracesadventure_mine_mgr560, lager_event,
		       __Pidadventure_mine_mgr560);
      _ -> ok
    end,
    case sys_env:get(close_reward) of
      undefined ->
	  Pids = ets:tab2list(adventure_mine_zone),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr564, _,
	     {__Leveladventure_mine_mgr564,
	      __Tracesadventure_mine_mgr564}}
		when __Leveladventure_mine_mgr564 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr564 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 564},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("收到通知，处理的结算 需处理:~w", [Pids]), none,
			     4096, 64, __Leveladventure_mine_mgr564,
			     __Tracesadventure_mine_mgr564, lager_event,
			     __Pidadventure_mine_mgr564);
	    _ -> ok
	  end,
	  [Pid ! {close_reward} || {_, Pid} <- Pids],
	  sys_env:save(close_reward, true);
      _ -> skip
    end,
    {noreply, State};
do_handle_info({merge_reward_srv, SrvIds}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr573, _,
       {__Leveladventure_mine_mgr573,
	__Tracesadventure_mine_mgr573}}
	  when __Leveladventure_mine_mgr573 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr573 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, do_handle_info}, {line, 573},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("主服收到通知，处理~w的结算", [SrvIds]), none, 4096,
		       64, __Leveladventure_mine_mgr573,
		       __Tracesadventure_mine_mgr573, lager_event,
		       __Pidadventure_mine_mgr573);
      _ -> ok
    end,
    Pids = ets:tab2list(adventure_mine_zone),
    [Pid ! {advance_reward_srv, SrvIds}
     || {_, Pid} <- Pids],
    Info = env_info(),
    SrvList0 = maps:get(srv_list, Info, []),
    NewSrvList = SrvList0 -- SrvIds,
    NewInfo = Info#{srv_list => NewSrvList},
    save_env_info(NewInfo),
    {noreply, State};
do_handle_info({move_to_new_main, NewMainSrvId,
		NewSrvList},
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr584, _,
       {__Leveladventure_mine_mgr584,
	__Tracesadventure_mine_mgr584}}
	  when __Leveladventure_mine_mgr584 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr584 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, do_handle_info}, {line, 584},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("矿战数据迁移到新主服 ~w", [NewMainSrvId]), none,
		       4096, 64, __Leveladventure_mine_mgr584,
		       __Tracesadventure_mine_mgr584, lager_event,
		       __Pidadventure_mine_mgr584);
      _ -> ok
    end,
    Pids = ets:tab2list(adventure_mine_zone),
    [Pid ! {stop, normal} || {_, Pid} <- Pids],
    ets:delete_all_objects(adventure_mine_zone),
    move_ets_to_new_main(adventure_mine_floor,
			 NewMainSrvId),
    move_ets_to_new_main(adventure_mine_group,
			 NewMainSrvId),
    move_ets_to_new_main(adventure_mine_owned,
			 NewMainSrvId),
    move_ets_to_new_main(adventure_mine_group_hook,
			 NewMainSrvId),
    move_ets_to_new_main(adventure_mine_role, NewMainSrvId),
    cluster_lib:cast(NewMainSrvId, adventure_mine_mgr, info,
		     [{merge_move_finish, NewMainSrvId, NewSrvList}]),
    {noreply, State};
do_handle_info({merge_move_finish, MainSrvId,
		AllSrvList},
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr596, _,
       {__Leveladventure_mine_mgr596,
	__Tracesadventure_mine_mgr596}}
	  when __Leveladventure_mine_mgr596 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr596 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, do_handle_info}, {line, 596},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "矿战数据迁移完成，进行进程初始化", none, 4096, 64,
		       __Leveladventure_mine_mgr596,
		       __Tracesadventure_mine_mgr596, lager_event,
		       __Pidadventure_mine_mgr596);
      _ -> ok
    end,
    Info = env_info(),
    NewInfo = Info#{status => 1, is_main => 1,
		    main_id => MainSrvId, srv_list => AllSrvList},
    save_env_info(NewInfo),
    do_init(),
    [cluster_lib:cast(SrvIdT, adventure_mine_mgr, info,
		      [{sync_cluster_info, MainSrvId, AllSrvList}])
     || SrvIdT <- AllSrvList],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr602, _,
       {__Leveladventure_mine_mgr602,
	__Tracesadventure_mine_mgr602}}
	  when __Leveladventure_mine_mgr602 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr602 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, do_handle_info}, {line, 602},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("矿战迁移前~w 迁移后~w", [Info, NewInfo]), none,
		       4096, 64, __Leveladventure_mine_mgr602,
		       __Tracesadventure_mine_mgr602, lager_event,
		       __Pidadventure_mine_mgr602);
      _ -> ok
    end,
    {noreply, State};
do_handle_info({sync_cluster_info, MainSrvId,
		AllSrvList},
	       State) ->
    case env_info() of
      Info = #{server_type := cluster} ->
	  NewInfo = Info#{main_id => MainSrvId,
			  srv_list => AllSrvList},
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr608, _,
	     {__Leveladventure_mine_mgr608,
	      __Tracesadventure_mine_mgr608}}
		when __Leveladventure_mine_mgr608 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr608 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 608},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("矿战子服迁移前~w 迁移后~w", [Info, NewInfo]),
			     none, 4096, 64, __Leveladventure_mine_mgr608,
			     __Tracesadventure_mine_mgr608, lager_event,
			     __Pidadventure_mine_mgr608);
	    _ -> ok
	  end,
	  save_env_info(NewInfo);
      _INFO ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr611, _,
	     {__Leveladventure_mine_mgr611,
	      __Tracesadventure_mine_mgr611}}
		when __Leveladventure_mine_mgr611 band 64 /= 0 orelse
		       __Tracesadventure_mine_mgr611 /= [] ->
		lager:do_log(info,
			     [{module, adventure_mine_mgr},
			      {function, do_handle_info}, {line, 611},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态不满足，不做改变~w", [_INFO]), none, 4096,
			     64, __Leveladventure_mine_mgr611,
			     __Tracesadventure_mine_mgr611, lager_event,
			     __Pidadventure_mine_mgr611);
	    _ -> ok
	  end
    end,
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

to_match([], _MaxPower) -> undefined;
to_match([Group = #adventure_mine_group{power = 0}
	  | _Other],
	 _MaxPower) ->
    Group;
to_match([Group = #adventure_mine_group{power =
					    AvgPower,
					num = Num}
	  | Other],
	 MaxPower) ->
    MaxAvgPower = AvgPower *
		    ((1000 + adventure_mine_data:get_const(combat_limit)) /
		       1000),
    MinAvgPower = AvgPower *
		    ((1000 - adventure_mine_data:get_const(combat_limit)) /
		       1000),
    case Num =<
	   adventure_mine_data:get_const(max_grouping) +
	     adventure_mine_data:get_const(max_insert)
	   andalso
	   MaxPower >= MinAvgPower andalso MaxPower =< MaxAvgPower
	of
      true -> Group;
      _ -> to_match(Other, MaxPower)
    end.

send_info(M, F, A) ->
    case env_info() of
      #{server_type := cluster, main_id := MainSrvId} ->
	  cluster_lib:cast(MainSrvId, M, F, A);
      #{server_type := change_cluster,
	main_id := MainSrvId} ->
	  cluster_lib:cast(MainSrvId, M, F, A);
      #{server_type := local} -> catch apply(M, F, A);
      #{server_type := pre_cluster} -> catch apply(M, F, A);
      _ -> {false, lang:get(<<"矿战没有开启"/utf8>>)}
    end.

send_call(M, F, A) ->
    case env_info() of
      #{server_type := cluster, main_id := MainSrvId} ->
	  cluster_lib:call(MainSrvId, M, F, A);
      #{server_type := change_cluster,
	main_id := MainSrvId} ->
	  cluster_lib:call(MainSrvId, M, F, A);
      #{server_type := local} -> catch apply(M, F, A);
      #{server_type := pre_cluster} -> catch apply(M, F, A);
      _ -> {false, lang:get(<<"矿战没有开启"/utf8>>)}
    end.

do_reward([]) -> ok;
do_reward([#adventure_mine_group_hook{list = HookList}
	   | Other]) ->
    do_hook_reward(HookList), do_reward(Other).

do_hook_reward([]) -> ok;
do_hook_reward([#adventure_mine_hook{id = {Floor, _},
				     role_id = RoleId,
				     acc_hook_items = AccHookItems}
		| Other]) ->
    case AccHookItems of
      [_ | _] ->
	  mail:send(RoleId,
		    {lang:get(<<"Khoảng Sản"/utf8>>),
		     color:msg(lang:get(<<"Các nhẫn giả thân mến, trận chiến mỏ "
					  "mạo hiểm đã được giải quyết và thu nhập "
					  "từ các tĩnh mạch của bạn trên lớp ~ts "
					  "là:"/utf8>>),
			       [{green, Floor}]),
		     items, AccHookItems,
		     <<"Trò chơi chiến tranh của tôi"/utf8>>}),
	  do_hook_reward(Other);
      _ -> do_hook_reward(Other)
    end.

load() ->
    MinLev = adventure_data:get_const(open_lev),
    LimitTime = date:unixtime() - 86400 * 3,
    case
      db:get_all("select rid, srv_id, max_power, login_time "
		 "from role where lev >= ? and (logout_time "
		 "> ? or login_time > ?) ",
		 [MinLev, LimitTime, LimitTime], 60000)
	of
      {ok, L} -> do_load(L, []);
      _ -> []
    end.

do_load([], L) -> L;
do_load([[Rid, SrvId, MaxPower, LoginTime] | T], L) ->
    R = #adventure_mine_role{id = {Rid, SrvId},
			     max_power = MaxPower, login_time = LoginTime},
    do_load(T, [R | L]).

get_cluster_group() ->
    case cluster_dynamic_group:get_group(1) of
      {true,
       #cluster_dynamic_local_group{main = MainSrvId,
				    list = AllSrvList}} ->
	  FullIds = lists:flatten([srv_full_id(SrvIdT)
				   || SrvIdT <- AllSrvList]),
	  {MainSrvId, FullIds};
      _ ->
	  LocalSrvId = sys_env:get(server_id),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_mgr699, _,
	     {__Leveladventure_mine_mgr699,
	      __Tracesadventure_mine_mgr699}}
		when __Leveladventure_mine_mgr699 band 8 /= 0 orelse
		       __Tracesadventure_mine_mgr699 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_mgr},
			      {function, get_cluster_group}, {line, 699},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w在获取跨服分组是失败", [LocalSrvId]), none,
			     4096, 8, __Leveladventure_mine_mgr699,
			     __Tracesadventure_mine_mgr699, lager_event,
			     __Pidadventure_mine_mgr699);
	    _ -> ok
	  end,
	  {LocalSrvId, [LocalSrvId]}
    end.

srv_full_id(SrvId) ->
    case catch cluster_lib:call(SrvId, sys_lib, srv_full_id,
				[])
	of
      SrvList when is_list(SrvList) -> SrvList;
      _ -> [SrvId]
    end.

-spec sync_role(#role{}) -> ok.

sync_role(#role{lev = Lev, id = RoleId,
		max_power = MaxPower}) ->
    ok.

merge_reward_srv(_Args) ->
    SrvIds = sys_lib:srv_full_id(),
    send_info(adventure_mine_mgr, info,
	      [{merge_reward_srv, SrvIds}]),
    ok.

close_reward() ->
    send_info(adventure_mine_mgr, info, [{close_reward}]),
    ok.

move_to_new_main(Maps) ->
    NewMain = maps:get(new_main, Maps, undefined),
    case NewMain of
      #cluster_dynamic_srv{main_srv = NewMainSrvId,
			   list = NewSrvList} ->
	  adventure_mine_mgr:info({move_to_new_main, NewMainSrvId,
				   NewSrvList}),
	  ok;
      _ -> false
    end.

move_ets_to_new_main(EtsName, NewMainSrvId) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr747, _,
       {__Leveladventure_mine_mgr747,
	__Tracesadventure_mine_mgr747}}
	  when __Leveladventure_mine_mgr747 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr747 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, move_ets_to_new_main}, {line, 747},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("名字~w 开始时间 ~w",
				     [EtsName, date:unixtime(ms)]),
		       none, 4096, 64, __Leveladventure_mine_mgr747,
		       __Tracesadventure_mine_mgr747, lager_event,
		       __Pidadventure_mine_mgr747);
      _ -> ok
    end,
    L = ets:tab2list(EtsName),
    move_ets_to_new_main(L, EtsName, NewMainSrvId),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_mgr750, _,
       {__Leveladventure_mine_mgr750,
	__Tracesadventure_mine_mgr750}}
	  when __Leveladventure_mine_mgr750 band 64 /= 0 orelse
		 __Tracesadventure_mine_mgr750 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_mgr},
			{function, move_ets_to_new_main}, {line, 750},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("名字~w 结束时间 ~w",
				     [EtsName, date:unixtime(ms)]),
		       none, 4096, 64, __Leveladventure_mine_mgr750,
		       __Tracesadventure_mine_mgr750, lager_event,
		       __Pidadventure_mine_mgr750);
      _ -> ok
    end,
    ok.

move_ets_to_new_main([], _EtsName, _NewMainSrvId) -> ok;
move_ets_to_new_main(List, EtsName, NewMainSrvId) ->
    {MoveList, NextMoveList} = list_util:split(50, List),
    cluster_lib:cast(NewMainSrvId, d_ets_lib, save_d_ets,
		     [EtsName, MoveList]),
    move_ets_to_new_main(NextMoveList, EtsName,
			 NewMainSrvId).

make_dirty() -> ok.


