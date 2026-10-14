-file("src/mod/holiday/holiday_role.erl", 1).

-module(holiday_role).

-lager_records([{expedition_replay_partner,
		 [pos, bid, lev, star, ext]},
		{expedition_replay,
		 [id, round, ret, time, difficulty, guard_id, a_id,
		  a_name, a_lev, a_power, a_formation_type, a_end_hp,
		  b_id, b_name, b_lev, b_power, b_formation_type,
		  b_end_hp, a_plist, b_plist, ext]},
		{expedition_log, [id, list]},
		{expedition_employ_p,
		 [id, bid, lev, star, quality, break_lev, power, num,
		  ext]},
		{expedition_employ, [rid, rname, num, list]},
		{expedition_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{expedition_f,
		 [id, type, robot_id, role_id, name, lev, face, power,
		  hallows_id, formation_type, items, guards, partner_hp,
		  status]},
		{m_expedition,
		 [ver, guard_id, partner_hp, list, employ, appoint,
		  difficulty, max_difficulty, last_join_time,
		  last_difficulty, max_power]},
		{break_egg_data,
		 [id, rewards, rate, lev_min, lev_max, time_min,
		  time_max, is_record, is_notice, is_effect, role_max,
		  srv_max, hit_must_not_after_m_times,
		  not_hit_must_after_n_times]},
		{m_break_egg,
		 [ver, camp_id, lucky, refresh_time, break_time,
		  egg_type, last_list, each_list, logs]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{condition, [label, op, val, msg]},
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
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
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
		{activity, [id, status, name, data, ext_args]}]).

-export([login/1, repair_hd_3028/1, reload/1,
	 zero_flush/1, parse_time/2, parse_son_time/2, reg_day/2,
	 repair_hd/0, repair_hd_7004/1]).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday/holiday_role.erl", 18).

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

-file("src/mod/holiday/holiday_role.erl", 19).

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

-file("src/mod/holiday/holiday_role.erl", 20).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/holiday/holiday_role.erl", 21).

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

-file("src/mod/holiday/holiday_role.erl", 22).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/holiday/holiday_role.erl", 23).

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

-file("src/mod/holiday/holiday_role.erl", 24).

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

-file("src/mod/holiday/holiday_role.erl", 25).

-file("inc/break_egg.hrl", 1).

-record(m_break_egg,
	{ver = 1, camp_id = 0, lucky = 0, refresh_time = 0,
	 break_time = 0, egg_type = [], last_list = [],
	 each_list = [], logs = []}).

-record(break_egg_data,
	{id = 0, rewards = [], rate = 0, lev_min = 0,
	 lev_max = 0, time_min = 0, time_max = 0, is_record = 0,
	 is_notice = 0, is_effect = 0, role_max = 0, srv_max = 0,
	 hit_must_not_after_m_times = 0,
	 not_hit_must_after_n_times = 0}).

-file("src/mod/holiday/holiday_role.erl", 26).

-file("inc/log.hrl", 1).

-file("src/mod/holiday/holiday_role.erl", 27).

-file("inc/expedition.hrl", 1).

-record(m_expedition,
	{ver = 2, guard_id = 0, partner_hp = [], list = [],
	 employ = [], appoint = [], difficulty = 0,
	 max_difficulty = 0, last_join_time = 0,
	 last_difficulty = {0, 0}, max_power = 0}).

-record(expedition_f,
	{id = 1  :: 1..100, type = 1, robot_id = 0,
	 role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: bitstring(),
	 lev = 0  :: non_neg_integer(),
	 face = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 hallows_id = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 items = []  :: list(), guards = []  :: list(),
	 partner_hp = []  :: list(), status = 0  :: 0..2}).

-record(expedition_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext = []}).

-record(expedition_employ,
	{rid = {0, <<>>}, rname = <<>>, num = 0, list = []}).

-record(expedition_employ_p,
	{id = 0, bid = 0, lev = 0, star = 0, quality = 0,
	 break_lev = 0, power = 0, num = 0, ext = []}).

-record(expedition_log,
	{id = {{0, <<>>}, 0}, list = []}).

-record(expedition_replay,
	{id = 0, round = 0, ret = 0, time = 0, difficulty = 0,
	 guard_id = 0, a_id = {0, <<>>}, a_name = <<>>,
	 a_lev = 0, a_power = 0, a_formation_type = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_power = 0, b_formation_type = 0,
	 b_end_hp = 0, a_plist = [], b_plist = [], ext = []}).

-record(expedition_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-file("src/mod/holiday/holiday_role.erl", 28).

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role) ->
    {ok, Role1} = reload(Role),
    repair([1005, 1011, 1021, 1024, 1025, 3023, 3030, 7004,
	    1022],
	   Role1).

repair([], Role) -> {ok, Role};
repair([I | T], Role) ->
    {ok, NRole} = do_repair(I, Role), repair(T, NRole).

do_repair(1005, Role) ->
    case var:get_var(Role, day, 36, 0) of
      N when is_integer(N) andalso N > 0 ->
	  case holiday_lib:get_open_holiday(91005) of
	    #holiday{camp_id = CampId} ->
		{ok, var:set_var(Role, day, 36, [{CampId, N}])};
	    _ -> {ok, var:set_var(Role, day, 36, [{0, N}])}
	  end;
      _ -> {ok, Role}
    end;
do_repair(1011, Role) ->
    case var:get_var(Role, day, 38, 0) of
      N when is_integer(N) andalso N > 0 ->
	  case holiday_lib:get_open_holiday(91011) of
	    #holiday{camp_id = CampId} ->
		{ok, var:set_var(Role, day, 38, [{CampId, N}])};
	    _ -> {ok, var:set_var(Role, day, 38, [{0, N}])}
	  end;
      _ -> {ok, Role}
    end;
do_repair(1024, Role) ->
    case var:get_var(Role, day, 59, 0) of
      N when is_integer(N) andalso N > 0 ->
	  case holiday_lib:get_open_holiday(91024) of
	    #holiday{camp_id = CampId} ->
		{ok, var:set_var(Role, day, 59, [{CampId, N}])};
	    _ -> {ok, var:set_var(Role, day, 59, [{0, N}])}
	  end;
      _ -> {ok, Role}
    end;
do_repair(1025, Role) ->
    case var:get_var(Role, day, 60, 0) of
      N when is_integer(N) andalso N > 0 ->
	  case holiday_lib:get_open_holiday(91025) of
	    #holiday{camp_id = CampId} ->
		{ok, var:set_var(Role, day, 60, [{CampId, N}])};
	    _ -> {ok, var:set_var(Role, day, 60, [{0, N}])}
	  end;
      _ -> {ok, Role}
    end;
do_repair(1021, Role) ->
    case var:get_var(Role, day, 44, 0) of
      N when is_integer(N) andalso N > 0 ->
	  case holiday_lib:get_open_holiday(991021) of
	    #holiday{camp_id = CampId} ->
		{ok, var:set_var(Role, day, 44, [{CampId, {0, N}}])};
	    _ -> {ok, var:set_var(Role, day, 44, [{0, {0, N}}])}
	  end;
      _ -> {ok, Role}
    end;
do_repair(3023,
	  Role = #role{assets = #assets{activity = Activity},
		       m_var = #m_var{last_reset_time = LastResetTime}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3023, 93023, 993023])
	of
      Holiday = #holiday{camp_id = CampId, bid = Bid} ->
	  case date:is_same_day(LastResetTime, date:unixtime()) of
	    true ->
		{Count, GetAimList} = holiday_lib:get_tv_val(CampId,
							     Bid, Role),
		case Activity > Count of
		  true ->
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, Role,
						       {Activity, GetAimList},
						       ExpireSec),
		      {ok, NewRole};
		  _ -> {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end;
do_repair(3030, Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [3030, 93030, 993030])
	of
      #holiday{} ->
	  IsMail = var:get_var(Role, other, 3092, 0),
	  case IsMail == 1 of
	    true -> {ok, Role};
	    _ ->
		MailItem = [{10010, 10}],
		{Assets, Items} = format:split_assets_items(MailItem),
		{ok, NRole} = mail:add(Role,
				       {lang:get(<<"系统邮件"/utf8>>),
					lang:get(<<"亲爱的冒险者大人：\n        附件是小助手赠与您的【重生材料】，在2月13日维护之"
						   "前将<div fontcolor=#c23f35>「潘」</div>提升了至10星及以上的"
						   "玩家，可以前往<div fontcolor=#c23f35>【限时活动-限时重生】</di"
						   "v>页面进行使用，材料<div fontcolor=#c23f35>仅可用于「潘」回退操作"
						   "</div>，详情请前往活动页面查看\n【注意】可进行回退操作的时间段为：<div "
						   "fontcolor=#c23f35>2月13日维护后至2月19日23:59</div>。过"
						   "期后道具将被销毁，并无法进行回退操作"/utf8>>),
					Assets, Items, <<"运营活动_潘重生"/utf8>>,
					86400 * 3 + date:unixtime()}),
		NewRole = var:set_var(NRole, other, 3092, 1),
		{ok, NewRole}
	  end;
      _ -> {ok, Role}
    end;
do_repair(7004,
	  Role = #role{id = {_, SrvId},
		       m_expedition =
			   #m_expedition{last_join_time = LastJoinTime,
					 difficulty = Difficulty,
					 guard_id = GuardId}}) ->
    case lists:member(SrvId,
		      [<<"symlf_1">>, <<"symlf_2">>, <<"local_1">>,
		       <<"release2_1">>, <<"release2_2">>])
	of
      true ->
	  case holiday_lib:get_open_holiday(Role,
					    [7004, 97004, 997004])
	      of
	    Holiday = #holiday{camp_id = CampId, bid = Bid,
			       reward = [Reward, _]} ->
		Now = date:unixtime(),
		case LastJoinTime >= 1570982400 andalso Now < 1571155200
		    of
		  true ->
		      {Count, RankCount, Lists} =
			  holiday_lib:get_tv_val(CampId, Bid, Role),
		      AddCount = if Difficulty =:= 2 -> 2;
				    Difficulty =:= 3 -> 3;
				    true -> 1
				 end,
		      NewCount = expedition:pass_floor(GuardId - 1),
		      NewRankCount = NewCount * AddCount,
		      case NewCount > Count of
			true ->
			    Fun = fun ({Aim, NeedCount, _Award, _BStr}, Acc) ->
					  case list_util:keyfind(Aim, Lists, 0)
					      of
					    0 when NeedCount =< NewCount ->
						[{Aim, 1} | Acc];
					    Status -> [{Aim, Status} | Acc]
					  end
				  end,
			    NewList = lists:foldl(Fun, [], Reward),
			    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
			    NewRole = holiday_lib:set_tv_val(CampId, Role,
							     {NewCount,
							      NewRankCount,
							      NewList},
							     ExpireSec),
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidholiday_role187, _,
			       {__Levelholiday_role187,
				__Tracesholiday_role187}}
				  when __Levelholiday_role187 band 64 /= 0
					 orelse __Tracesholiday_role187 /= [] ->
				  lager:do_log(info,
					       [{module, holiday_role},
						{function, do_repair},
						{line, 187},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("~w的~ts角色做了排行榜补发处理, 旧数据:~w 新数据:~w",
							     [Role#role.id,
							      Role#role.name,
							      {Count, RankCount,
							       Lists},
							      {NewCount,
							       NewRankCount,
							       NewList}]),
					       none, 4096, 64,
					       __Levelholiday_role187,
					       __Tracesholiday_role187,
					       lager_event,
					       __Pidholiday_role187);
			      _ -> ok
			    end,
			    rank_listener:handle(expedition, NewRole,
						 #{time => Now,
						   count => NewRankCount}),
			    {ok, NewRole};
			_ -> {ok, Role}
		      end;
		  _ -> {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end;
do_repair(1022,
	  Role = #role{id = RoleId = {_, SrvId}}) ->
    case lists:member(SrvId,
		      [<<"symlf_1">>, <<"symlf_2">>, <<"local_1">>,
		       <<"release2_1">>, <<"release2_2">>])
	of
      true ->
	  case holiday_lib:get_open_holiday(Role,
					    [1022, 91022, 991022])
	      of
	    Holiday = #holiday{camp_id = CampId = 46064, bid = Bid,
			       reward = Reward} ->
		Now = date:unixtime(),
		case Now < 1571068800 of
		  true ->
		      NewMoney = charge_lib:calc_charge(RoleId, 1570982400,
							Now),
		      {OldMoney, GetAimList} = holiday_lib:get_tv_val(CampId,
								      Bid,
								      Role),
		      case NewMoney > OldMoney of
			true ->
			    Fun = fun (I, L) ->
					  Aim = element(1, I),
					  case lists:keyfind(Aim, 1, GetAimList)
					      of
					    false when NewMoney >= Aim ->
						[{Aim, 1} | L];
					    false -> L;
					    Temp -> [Temp | L]
					  end
				  end,
			    NewGetAimList = lists:foldl(Fun, [], Reward),
			    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
			    NewRole = holiday_lib:set_tv_val(CampId, Role,
							     {NewMoney,
							      NewGetAimList},
							     ExpireSec),
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidholiday_role226, _,
			       {__Levelholiday_role226,
				__Tracesholiday_role226}}
				  when __Levelholiday_role226 band 64 /= 0
					 orelse __Tracesholiday_role226 /= [] ->
				  lager:do_log(info,
					       [{module, holiday_role},
						{function, do_repair},
						{line, 226},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("~w的~ts角色做了累充补发处理, 旧数据:~w 新数据:~w",
							     [Role#role.id,
							      Role#role.name,
							      {OldMoney,
							       GetAimList},
							      {NewMoney,
							       NewGetAimList}]),
					       none, 4096, 64,
					       __Levelholiday_role226,
					       __Tracesholiday_role226,
					       lager_event,
					       __Pidholiday_role226);
			      _ -> ok
			    end,
			    {ok, NewRole};
			_ -> {ok, Role}
		      end;
		  _ -> {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

repair_hd_3028(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [3028, 93028, 993028])
	of
      Holiday = #holiday{camp_id = CampId, bid = Bid} ->
	  IsRepair = var:get_var(Role, other, 3050, 0),
	  case IsRepair == 1 of
	    true -> {ok, Role};
	    _ ->
		{_DayList, BuyList} = holiday_lib:get_tv_val(CampId,
							     Bid, Role),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole0 = holiday_lib:set_tv_val(CampId, Role,
						  {[], BuyList}, ExpireSec),
		NewRole = var:set_var(NewRole0, other, 3050, 1),
		{ok, NewRole}
	  end;
      _ ->
	  NewRole = var:set_var(Role, other, 3050, 1),
	  {ok, NewRole}
    end.

repair_hd() ->
    role_group:apply(world,
		     {holiday_role, repair_hd_7004, []}).

repair_hd_7004(Role) -> repair([7004, 1022], Role).

-spec zero_flush(#role{}) -> ok | {ok, #role{}}.

zero_flush(all) ->
    role_group:apply(world, {holiday_role, zero_flush, []});
zero_flush(Role) ->
    BidL = [1003, 91003, 991003, 1005, 91005, 991005, 1006,
	    91006, 991006, 1011, 91011, 991011, 3007, 93007, 993007,
	    1022, 91022, 991022, 1024, 91024, 991024, 1025, 91025,
	    991025, 1026, 91026, 991026, 1027, 91027, 991027, 1028,
	    91028, 991028, 1035, 91035, 991035, 3009, 93009, 993009,
	    3013, 93013, 993013, 3014, 93014, 993014, 3021, 93021,
	    993021, 3026, 93026, 993026, 3028, 93028, 993028, 1036,
	    91036, 991036, 1037, 91037, 991037, 1038, 91038, 991038,
	    1039, 91039, 991039, 9991039, 1040, 91040, 991040,
	    9991040, 1041, 91041, 991041, 9991041, 1045, 91045,
	    991045, 7009, 97009, 997009, 3044, 93044, 993044, 1048,
	    91048, 991048, 1052, 91052, 991052, 1053, 91053, 991053,
	    1054, 91054, 991054],
    CampIdL = holiday_lib:get_tv_camp_id(Role),
    List1 = zero_flush_holiday(CampIdL, BidL, Role, []),
    BidL2 = [3030, 93030, 993030],
    AllL = holiday_lib:get_holiday_list(BidL2, List1),
    FlushRole = zero_flush(Role, AllL),
    NRole = close_son_data(FlushRole, AllL),
    reload(NRole).

zero_flush(Role, []) -> Role;
zero_flush(Role,
	   [Holiday = #holiday{bid = Bid} | Rest]) ->
    NewRole = case holiday_lib:get_mod(Bid) of
		undefined -> Role;
		Mod ->
		    case catch Mod:zero_flush(Role, Holiday) of
		      NRole = #role{} -> NRole;
		      Err ->
			  case {whereis(lager_event), whereis(lager_event),
				lager_config:get({lager_event, loglevel},
						 {0, []})}
			      of
			    {undefined, undefined, _} ->
				fun () -> {error, lager_not_running} end();
			    {undefined, _, _} ->
				fun () ->
					{error,
					 {sink_not_configured, lager_event}}
				end();
			    {__Pidholiday_role327, _,
			     {__Levelholiday_role327, __Tracesholiday_role327}}
				when __Levelholiday_role327 band 8 /= 0 orelse
				       __Tracesholiday_role327 /= [] ->
				lager:do_log(error,
					     [{module, holiday_role},
					      {function, zero_flush},
					      {line, 327},
					      {pid, pid_to_list(self())},
					      {node, node()}
					      | lager:md()],
					     io_lib:format("[~ts]活动0点更新[Bid:~w][Mod:~w]错误:~w",
							   [Role#role.name, Bid,
							    Mod, Err]),
					     none, 4096, 8,
					     __Levelholiday_role327,
					     __Tracesholiday_role327,
					     lager_event, __Pidholiday_role327);
			    _ -> ok
			  end,
			  Role
		    end
	      end,
    zero_flush(NewRole, Rest).

-spec reload(#role{}) -> {ok, #role{}}.

reload(all) ->
    role_group:apply(world, {holiday_role, reload, []});
reload(Role = #role{platform = <<"verifyios">>}) ->
    put(holiday_role_cache, []),
    put(holiday_role_son_cache, #{}),
    {ok, Role};
reload(Role) ->
    put(holiday_role_cache, []),
    put(holiday_role_son_cache, #{}),
    holiday_ico:reset_flush(),
    Now = date:unixtime(),
    SrvId = sys_lib:srv_id(),
    NRole = load_data_total(holiday_role_data:list_total(),
			    Role, SrvId, Now),
    SonStatusL = [[1008, 91008, 991008], [1014, 991014],
		  [91014], [1015, 91015, 991015], [1016, 91016, 991016],
		  [1017, 91017, 991017], [1018, 91018, 991018],
		  [1019, 91019, 991019], [1020, 91020, 991020],
		  [3024, 93024, 993024], [7007, 97007, 997007]],
    NewRoleT = check_status(NRole, SonStatusL),
    {ok, NewRoleT_1} = lev_gift:login(NewRoleT),
    {ok, NewRole} = holiday_snatch_lib:login(NewRoleT_1),
    check_ico_status(Role,
		     [10, {908, [991011]}, {1101, [991024]},
		      {1102, [991025]}, {513, [91029]}]),
    NewRole2 = reload_list([{holiday_boss, login, []},
			    {holiday_lanterm_adventure, login, []},
			    {holiday_lanterm_adventure1, login, []},
			    {holiday_lanterm_adventure2, login, []},
			    {holiday_lanterm_adventure3, login, []},
			    {holiday_skin_draw, zero_flush, []},
			    {holiday_term_begins, login, []},
			    {holiday_petard, login, []},
			    {monopoly_maps, login, []},
			    {holiday_optional_lottery, zero_flush, []},
			    {holiday_nian, zero_flush, []},
			    {holiday_lucky_dog_lib, zero_flush, []},
			    {holiday_valentines, zero_flush, []},
			    {partner, calc_hd_3030_var, []},
			    {holiday_valentine_boss, zero_flush, []},
			    {holiday_new_week_card, zero_flush, []},
			    {holiday_practise_tower_lib, zero_flush, []}],
			   NewRole),
    {ok, NewRole2}.

reload_list([], Role) -> Role;
reload_list([{Mod, Fun, Args0} | T],
	    Role = #role{name = Name}) ->
    ArgFun = fun (A) -> A end,
    Args = [ArgFun(A) || A <- Args0],
    NewArgs = case {Mod, Fun} of _ -> [Role | Args] end,
    case catch erlang:apply(Mod, Fun, NewArgs) of
      ok -> reload_list(T, Role);
      {ok, NRole} when is_record(NRole, role) ->
	  reload_list(T, NRole);
      NRole = #role{} -> reload_list(T, NRole);
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_role394, _,
	     {__Levelholiday_role394, __Tracesholiday_role394}}
		when __Levelholiday_role394 band 8 /= 0 orelse
		       __Tracesholiday_role394 /= [] ->
		lager:do_log(error,
			     [{module, holiday_role}, {function, reload_list},
			      {line, 394}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]执行活动0点刷新调用[~w:~w:~w]时发生异常：~w",
					   [Name, Mod, Fun, Args, _Err]),
			     none, 4096, 8, __Levelholiday_role394,
			     __Tracesholiday_role394, lager_event,
			     __Pidholiday_role394);
	    _ -> ok
	  end,
	  reload_list(T, Role)
    end;
reload_list([_ | T], Role) -> reload_list(T, Role).

check_status(Role, []) -> Role;
check_status(Role, [Bids = [_ | _] | Rest]) ->
    case holiday_lib:get_open_holiday_list(Bids) of
      HolidayList = [_ | _] ->
	  NRole = init_son_data(Role, HolidayList),
	  check_status(NRole, Rest);
      _ -> check_status(Role, Rest)
    end.

init_son_data(Role, []) -> Role;
init_son_data(Role, [Holiday | T]) ->
    NRole = init_son_data(Role, Holiday),
    init_son_data(NRole, T);
init_son_data(Role = #role{lev = Lev},
	      Holiday = #holiday{camp_id = CampId, bid = Bid,
				 tbid = TBid, reward = [{_PackageId, Reward}]})
    when TBid =:= 1008 ->
    {IsActivate, GetAimList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun (I, L) ->
		  Aim = element(1, I),
		  case lists:keyfind(Aim, 1, GetAimList) of
		    false when Lev >= Aim -> [{Aim, 1} | L];
		    false -> L;
		    Temp -> [Temp | L]
		  end
	  end,
    NewGetAimList = lists:foldl(Fun, [], Reward),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    holiday_lib:set_tv_val(CampId, Role,
			   {IsActivate, NewGetAimList}, ExpireSec);
init_son_data(Role = #role{m_break_egg =
			       #m_break_egg{camp_id = OldCampId,
					    egg_type = EggType}},
	      #holiday{camp_id = CampId, tbid = 3024}) ->
    if CampId =/= OldCampId orelse EggType =:= [] ->
	   EggTypeL = holiday_break_egg:init_egg_type(),
	   Role#role{m_break_egg =
			 #m_break_egg{camp_id = CampId, egg_type = EggTypeL}};
       true -> Role
    end;
init_son_data(Role, Holiday = #holiday{tbid = 7007}) ->
    NRole = holiday_boss_new:do_ref_round(Role, Holiday),
    NRole;
init_son_data(Role, Holiday) ->
    holiday_ico:push_ico(Role, Holiday), Role.

close_son_data(Role, []) -> Role;
close_son_data(Role, [Holiday | T]) ->
    NRole = case holiday_lib:is_open(Holiday) of
	      false -> close_son_data(Role, Holiday);
	      _ -> Role
	    end,
    close_son_data(NRole, T);
close_son_data(Role, Holiday) ->
    holiday_ico:close(Role, Holiday), Role.

load_data_total([], Role, SrvId, Now) ->
    ForeverL = holiday_role_data:list_son(0),
    load_data_son(ForeverL, Role, SrvId, Now);
load_data_total([Total = #holiday_total{id = TotalId,
					start_time = ST, end_time = ET,
					status = 1}
		 | T],
		Role, SrvId, Now) ->
    StartTime = parse_time(ST, Role),
    EndTime = parse_time(ET, Role),
    NewRole = case Now >= StartTime andalso
		     (EndTime =:= 0 orelse Now < EndTime)
		  of
		true ->
		    NewTotal = Total#holiday_total{start_time = StartTime,
						   end_time = EndTime},
		    NRole =
			load_data_son(holiday_role_data:list_son(TotalId), Role,
				      SrvId, Now),
		    put(holiday_role_cache,
			[NewTotal | get(holiday_role_cache)]),
		    NRole;
		_ -> Role
	      end,
    load_data_total(T, NewRole, SrvId, Now);
load_data_total([_ | T], Role, SrvId, Now) ->
    load_data_total(T, Role, SrvId, Now).

load_data_son([], Role, _SrvId, _Now) -> Role;
load_data_son([CampId | T],
	      Role = #role{platform = Platform}, SrvId, Now) ->
    Holiday = #holiday{bid = Bid, condition = Condition,
		       hide_srv_ids = HideSrvIds} =
		  holiday_role_data:get(CampId),
    {StartTime, EndTime} = parse_son_time(Holiday, Role),
    L = [<<"9377">>, <<"9377ios">>, <<"tanwan">>,
	 <<"icebird">>],
    Flag = lists:member(Platform, L),
    NewRole = case Now >= StartTime andalso
		     (EndTime =:= 0 orelse Now < EndTime) andalso
		       not lists:member(SrvId, HideSrvIds)
		  of
		_ when Bid < 990000 orelse Bid >= 9990000 ->
		    case {whereis(lager_event), whereis(lager_event),
			  lager_config:get({lager_event, loglevel}, {0, []})}
			of
		      {undefined, undefined, _} ->
			  fun () -> {error, lager_not_running} end();
		      {undefined, _, _} ->
			  fun () -> {error, {sink_not_configured, lager_event}}
			  end();
		      {__Pidholiday_role492, _,
		       {__Levelholiday_role492, __Tracesholiday_role492}}
			  when __Levelholiday_role492 band 128 /= 0 orelse
				 __Tracesholiday_role492 /= [] ->
			  lager:do_log(debug,
				       [{module, holiday_role},
					{function, load_data_son}, {line, 492},
					{pid, pid_to_list(self())},
					{node, node()}
					| lager:md()],
				       io_lib:format("[~ts]活动[~w]配置错误[CampId:~w],请检查",
						     [Role#role.name, Bid,
						      CampId]),
				       none, 4096, 128, __Levelholiday_role492,
				       __Tracesholiday_role492, lager_event,
				       __Pidholiday_role492);
		      _ -> ok
		    end,
		    Role;
		_ when Bid == 993043 andalso Flag -> Role;
		true ->
		    case role_cond:check(Condition, Role) of
		      true ->
			  NewHoliday = #{camp_id => CampId,
					 start_time => StartTime,
					 end_time => EndTime},
			  put(holiday_role_son_cache,
			      (get(holiday_role_son_cache))#{Bid =>
								 NewHoliday}),
			  NRole = set_last_time_var(Holiday,
						    {StartTime, EndTime}, Role),
			  case {whereis(lager_event), whereis(lager_event),
				lager_config:get({lager_event, loglevel},
						 {0, []})}
			      of
			    {undefined, undefined, _} ->
				fun () -> {error, lager_not_running} end();
			    {undefined, _, _} ->
				fun () ->
					{error,
					 {sink_not_configured, lager_event}}
				end();
			    {__Pidholiday_role502, _,
			     {__Levelholiday_role502, __Tracesholiday_role502}}
				when __Levelholiday_role502 band 128 /= 0 orelse
				       __Tracesholiday_role502 /= [] ->
				lager:do_log(debug,
					     [{module, holiday_role},
					      {function, load_data_son},
					      {line, 502},
					      {pid, pid_to_list(self())},
					      {node, node()}
					      | lager:md()],
					     io_lib:format("~ts,活动开启:campid=~w, bid=~w",
							   [Role#role.name,
							    CampId, Bid]),
					     none, 4096, 128,
					     __Levelholiday_role502,
					     __Tracesholiday_role502,
					     lager_event, __Pidholiday_role502);
			    _ -> ok
			  end,
			  NRole;
		      {false,
		       #condition{msg = _Msg, label = lev, val = NeedVal}} ->
			  put(holiday_cond_lev,
			      min(util:get(holiday_cond_lev, 9999), NeedVal)),
			  case {whereis(lager_event), whereis(lager_event),
				lager_config:get({lager_event, loglevel},
						 {0, []})}
			      of
			    {undefined, undefined, _} ->
				fun () -> {error, lager_not_running} end();
			    {undefined, _, _} ->
				fun () ->
					{error,
					 {sink_not_configured, lager_event}}
				end();
			    {__Pidholiday_role506, _,
			     {__Levelholiday_role506, __Tracesholiday_role506}}
				when __Levelholiday_role506 band 128 /= 0 orelse
				       __Tracesholiday_role506 /= [] ->
				lager:do_log(debug,
					     [{module, holiday_role},
					      {function, load_data_son},
					      {line, 506},
					      {pid, pid_to_list(self())},
					      {node, node()}
					      | lager:md()],
					     io_lib:format("[~ts]不满足活动[CampId:~w]开放条件:~ts",
							   [Role#role.name,
							    CampId, _Msg]),
					     none, 4096, 128,
					     __Levelholiday_role506,
					     __Tracesholiday_role506,
					     lager_event, __Pidholiday_role506);
			    _ -> ok
			  end,
			  Role;
		      {false,
		       #condition{msg = _Msg, label = charge_sum,
				  val = NeedVal}} ->
			  put(holiday_cond_charge_sum,
			      min(util:get(holiday_cond_charge_sum, 999999),
				  NeedVal)),
			  case {whereis(lager_event), whereis(lager_event),
				lager_config:get({lager_event, loglevel},
						 {0, []})}
			      of
			    {undefined, undefined, _} ->
				fun () -> {error, lager_not_running} end();
			    {undefined, _, _} ->
				fun () ->
					{error,
					 {sink_not_configured, lager_event}}
				end();
			    {__Pidholiday_role510, _,
			     {__Levelholiday_role510, __Tracesholiday_role510}}
				when __Levelholiday_role510 band 128 /= 0 orelse
				       __Tracesholiday_role510 /= [] ->
				lager:do_log(debug,
					     [{module, holiday_role},
					      {function, load_data_son},
					      {line, 510},
					      {pid, pid_to_list(self())},
					      {node, node()}
					      | lager:md()],
					     io_lib:format("[~ts]不满足活动[CampId:~w]开放条件:~ts",
							   [Role#role.name,
							    CampId, _Msg]),
					     none, 4096, 128,
					     __Levelholiday_role510,
					     __Tracesholiday_role510,
					     lager_event, __Pidholiday_role510);
			    _ -> ok
			  end,
			  Role;
		      {false, #condition{msg = _Msg}} ->
			  case {whereis(lager_event), whereis(lager_event),
				lager_config:get({lager_event, loglevel},
						 {0, []})}
			      of
			    {undefined, undefined, _} ->
				fun () -> {error, lager_not_running} end();
			    {undefined, _, _} ->
				fun () ->
					{error,
					 {sink_not_configured, lager_event}}
				end();
			    {__Pidholiday_role513, _,
			     {__Levelholiday_role513, __Tracesholiday_role513}}
				when __Levelholiday_role513 band 128 /= 0 orelse
				       __Tracesholiday_role513 /= [] ->
				lager:do_log(debug,
					     [{module, holiday_role},
					      {function, load_data_son},
					      {line, 513},
					      {pid, pid_to_list(self())},
					      {node, node()}
					      | lager:md()],
					     io_lib:format("[~ts]不满足活动[CampId:~w]开放条件:~ts",
							   [Role#role.name,
							    CampId, _Msg]),
					     none, 4096, 128,
					     __Levelholiday_role513,
					     __Tracesholiday_role513,
					     lager_event, __Pidholiday_role513);
			    _ -> ok
			  end,
			  Role;
		      _Err ->
			  case {whereis(lager_event), whereis(lager_event),
				lager_config:get({lager_event, loglevel},
						 {0, []})}
			      of
			    {undefined, undefined, _} ->
				fun () -> {error, lager_not_running} end();
			    {undefined, _, _} ->
				fun () ->
					{error,
					 {sink_not_configured, lager_event}}
				end();
			    {__Pidholiday_role516, _,
			     {__Levelholiday_role516, __Tracesholiday_role516}}
				when __Levelholiday_role516 band 128 /= 0 orelse
				       __Tracesholiday_role516 /= [] ->
				lager:do_log(debug,
					     [{module, holiday_role},
					      {function, load_data_son},
					      {line, 516},
					      {pid, pid_to_list(self())},
					      {node, node()}
					      | lager:md()],
					     io_lib:format("[~ts]不满足活动[CampId:~w]开放条件:~w",
							   [Role#role.name,
							    CampId, _Err]),
					     none, 4096, 128,
					     __Levelholiday_role516,
					     __Tracesholiday_role516,
					     lager_event, __Pidholiday_role516);
			    _ -> ok
			  end,
			  Role
		    end;
		_ -> Role
	      end,
    load_data_son(T, NewRole, SrvId, Now).

reg_day(#role{misc =
		  #role_misc{reg_zero_time = RegZeroTime}},
	Now) ->
    max(Now - RegZeroTime, 0) div 86400 + 1.

parse_time({open_day, Day}, _Role) ->
    date:unixtime({zero, game_lib:server_open_time(ms)}) +
      86400 * (Day - 1);
parse_time({open_day, Day, OffSetSec}, _Role) ->
    date:unixtime({zero, game_lib:server_open_time(ms)}) +
      86400 * (Day - 1)
      + OffSetSec;
parse_time({reg_day, Day},
	   #role{misc =
		     #role_misc{reg_zero_time = RegZeroTime}}) ->
    RegZeroTime + 86400 * (Day - 1);
parse_time({reg_day, Day, OffSetSec},
	   #role{misc =
		     #role_misc{reg_zero_time = RegZeroTime}}) ->
    RegZeroTime + 86400 * (Day - 1) + OffSetSec;
parse_time(T, _Role) when is_integer(T) -> T;
parse_time(T, _Role) ->
    date:parse_time(T) - holiday_mgr:get_holiday_sec().

parse_son_time(#holiday{start_time = first_time,
			end_time = {last_day, Day}, camp_id = CampId},
	       Role) ->
    ST = var:get_var(Role, timeout,
		     {holiday_first_time, CampId}, undefined),
    Offset = 86400 * Day - holiday_mgr:get_holiday_sec(),
    case ST =:= undefined of
      false -> EndTime = ST + Offset, {ST, EndTime};
      true ->
	  Zero = date:unixtime(zero),
	  EndTime = Zero + Offset,
	  {Zero, EndTime}
    end;
parse_son_time(#holiday{start_time = ST, end_time = ET},
	       Role) ->
    StartTime = parse_time(ST, Role),
    EndTime = parse_time(ET, Role),
    {StartTime, EndTime}.

set_last_time_var(#holiday{start_time = first_time,
			   end_time = {last_day, _Day}, camp_id = CampId},
		  {StartTime, EndTime}, Role) ->
    var:set_var(Role, {timeout, EndTime + 86400 * 2},
		{holiday_first_time, CampId}, StartTime);
set_last_time_var(_Holiday, _SonTime, Role) -> Role.

check_ico_status(Role, [I | T]) ->
    check_ico_status(Role, I), check_ico_status(Role, T);
check_ico_status(Role, {Ico, Bids = [91029]}) ->
    case holiday_lib:get_open_holiday(Role, Bids) of
      #holiday{end_time = EndTime} ->
	  activity_self:set_activity(push, Ico, 1, [EndTime]);
      _ -> activity_self:set_activity(push, Ico, 0, [0])
    end;
check_ico_status(_Role, {Ico, Bids}) ->
    case holiday_lib:get_open_holiday(Bids) of
      #holiday{end_time = EndTime} ->
	  activity_self:set_activity(push, Ico, 1, [EndTime]);
      _ -> activity_self:set_activity(push, Ico, 0, [0])
    end;
check_ico_status(_Role, _) -> ok.

zero_flush_holiday([], _BidL, _Role, Acc) -> Acc;
zero_flush_holiday([CampId | CampIdRest], BidL, Role,
		   Acc) ->
    case holiday_lib:get_holiday_data(CampId) of
      Holiday = #holiday{bid = Bid} ->
	  case lists:member(Bid, BidL) of
	    true ->
		NHoliday = case holiday_lib:get_open_holiday(Bid) of
			     OpenHoliday = #holiday{camp_id = CampId} ->
				 OpenHoliday;
			     _ ->
				 TBid = holiday_lib:get_tbid(Bid),
				 {StartTime, EndTime} = parse_son_time(Holiday,
								       Role),
				 Holiday#holiday{tbid = TBid,
						 start_time = StartTime,
						 end_time = EndTime}
			   end,
		zero_flush_holiday(CampIdRest, BidL, Role,
				   [NHoliday | Acc]);
	    false -> zero_flush_holiday(CampIdRest, BidL, Role, Acc)
	  end;
      _ ->
	  case holiday_lib:get_expire_holiday(CampId) of
	    Holiday = #holiday{} ->
		zero_flush_holiday(CampIdRest, BidL, Role,
				   [Holiday | Acc]);
	    _ -> zero_flush_holiday(CampIdRest, BidL, Role, Acc)
	  end
    end.


