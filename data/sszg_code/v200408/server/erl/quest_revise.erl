-file("src/mod/quest/quest_revise.erl", 1).

-module(quest_revise).

-lager_records([{ios_mark_data,
		 [id, quest_type, progress]},
		{m_ios_mark, [ver, quest_list]},
		{holiday_return_new_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_new,
		 [ver, period, start_time, end_time, gift_status,
		  sign_list, quest_list, exchange_day_list,
		  exchange_buy_list, free_draw_count, draw_count,
		  draw_info, draw_type_info, must_not, get_red_count,
		  red_packet_info, get_red_info, ext]},
		{holiday_return_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_feat,
		 [ver, quest_list, period, extra, old_data]},
		{m_holiday_return,
		 [ver, period, start_time, end_time, is_buy,
		  exchange_day_list, exchange_buy_list,
		  return_discount_buy_list, bind_code, bind_end_time,
		  bind_roleid, reward_list, old_data, bind_power,
		  bind_charge, partner_half]},
		{m_holiday_return_sign, [ver, status_list, login_day]},
		{new_war_order_data,
		 [goal_id, period, quest_type, day, min_day, max_day,
		  min_lev, max_lev, status, condition, progress, award,
		  target_type]},
		{m_new_war_order,
		 [ver, period, period_day, period_lev, day_lev, week_lev,
		  start_time, end_time, rmb_status, quest_list, card,
		  lev_reward]},
		{war_order_data,
		 [goal_id, period, quest_type, day, min_day, max_day,
		  status, condition, lev, progress, award, target_type]},
		{m_war_order,
		 [ver, period, period_day, end_time, rmb_status,
		  exp_status, exp_num, quest_list, card, lev_reward]},
		{holiday_lanterm_adventure_data,
		 [camp_id, id, f_id, s_id, ref_day, progress, award]},
		{m_lanterm_adventure3,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure2,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure1,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_festival,
		 [ver, all_count, all_num, award_list, camp_id, extra,
		  old_data]},
		{m_feat, [ver, finish, doing, overdue]},
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
		{guild_quest_lev_data, [lev, exp, items, attr]},
		{guild_quest_data, [id, name, type, exp, progress]},
		{m_guild_quest,
		 [ver, lev, exp, day_exp, week_exp, list]},
		{grow_data,
		 [ver, day, goal_id, status, condition, lev, progress,
		  target_type]},
		{m_day_goals,
		 [ver, end_time, num, welfare_list, grow_list,
		  price_list, finish_list, period, charge, old_data,
		  period_day, new_grow_list, lev_reward, old_data2]},
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
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
		{quest_stats, [type, stats, desc]},
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

-export([login_do_feat/1, do/1, check_finish/1,
	 camp_progs/5, do_list/3, check_quest_status/2]).

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

-file("src/mod/quest/quest_revise.erl", 17).

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

-file("src/mod/quest/quest_revise.erl", 18).

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

-file("src/mod/quest/quest_revise.erl", 19).

-file("inc/pos.hrl", 1).

-record(pos_history,
	{map_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(pos,
	{ver = 2, srv_id = <<>>  :: bitstring(),
	 map_id = {0, <<>>}, map_pid = 0, map_bid = 0,
	 map_grid_pid = 0, last, hidden = 0, x = 0, y = 0,
	 dir = 5}).

-file("src/mod/quest/quest_revise.erl", 20).

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

-file("src/mod/quest/quest_revise.erl", 21).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/quest/quest_revise.erl", 22).

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

-file("src/mod/quest/quest_revise.erl", 23).

-file("inc/day_goals.hrl", 1).

-record(m_day_goals,
	{ver = 3, end_time = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 welfare_list = []  :: list(), grow_list = []  :: list(),
	 price_list = []  :: list(), finish_list = []  :: list(),
	 period = 1  :: list(), charge = 0  :: list(),
	 old_data = [], period_day = 0, new_grow_list = [],
	 lev_reward = [], old_data2 = []}).

-record(grow_data,
	{ver = 2, day = 0  :: non_neg_integer(),
	 goal_id = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 target_type = 1  :: non_neg_integer()}).

-file("src/mod/quest/quest_revise.erl", 24).

-file("inc/guild_quest.hrl", 1).

-record(m_guild_quest,
	{ver = 1, lev = 0  :: non_neg_integer(),
	 exp = 0  :: non_neg_integer(),
	 day_exp = 0  :: non_neg_integer(),
	 week_exp = 0  :: non_neg_integer(),
	 list = []  :: list()}).

-record(guild_quest_data,
	{id = 0, name = <<>>, type = 0, exp = 0,
	 progress = []}).

-record(guild_quest_lev_data,
	{lev = 0, exp = 0, items = [], attr = []}).

-file("src/mod/quest/quest_revise.erl", 25).

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

-file("src/mod/quest/quest_revise.erl", 26).

-file("inc/feat.hrl", 1).

-record(m_feat,
	{ver = 1  :: pos_integer(),
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()]}).

-file("src/mod/quest/quest_revise.erl", 27).

-file("inc/holiday_lanterm.hrl", 1).

-record(m_lanterm_festival,
	{ver = 1, all_count = []  :: non_neg_integer(),
	 all_num = 0  :: non_neg_integer(),
	 award_list = []  :: list(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure1,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure2,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure3,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(holiday_lanterm_adventure_data,
	{camp_id = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/quest/quest_revise.erl", 28).

-file("inc/war_order.hrl", 1).

-record(m_war_order,
	{ver = 1, period = 0, period_day = 0, end_time = 0,
	 rmb_status = 0, exp_status = 0, exp_num = 0,
	 quest_list = [], card = [], lev_reward = []}).

-record(war_order_data,
	{goal_id = 0  :: non_neg_integer(), period = 0,
	 quest_type = 0, day = 0  :: non_neg_integer(),
	 min_day = 0  :: non_neg_integer(),
	 max_day = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 award = [], target_type = 1  :: non_neg_integer()}).

-file("src/mod/quest/quest_revise.erl", 29).

-file("inc/new_war_order.hrl", 1).

-record(m_new_war_order,
	{ver = 1, period = 0, period_day = 0, period_lev = 0,
	 day_lev = 0, week_lev = 0, start_time = 0, end_time = 0,
	 rmb_status = 0, quest_list = [], card = [],
	 lev_reward = []}).

-record(new_war_order_data,
	{goal_id = 0  :: non_neg_integer(), period = 0,
	 quest_type = 0, day = 0  :: non_neg_integer(),
	 min_day = 0  :: non_neg_integer(),
	 max_day = 0  :: non_neg_integer(),
	 min_lev = 0  :: non_neg_integer(),
	 max_lev = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 progress = []  :: list(), award = [],
	 target_type = 1  :: non_neg_integer()}).

-file("src/mod/quest/quest_revise.erl", 30).

-file("inc/holiday_return.hrl", 1).

-record(m_holiday_return_sign,
	{ver = 2, status_list = [], login_day = 0}).

-record(m_holiday_return,
	{ver = 3, period = 0, start_time = 0, end_time = 0,
	 is_buy = 0, exchange_day_list = [],
	 exchange_buy_list = [], return_discount_buy_list = [],
	 bind_code = 0, bind_end_time = 0,
	 bind_roleid = {0, <<>>}, reward_list = [],
	 old_data = [], bind_power = 0, bind_charge = 0,
	 partner_half = []}).

-record(m_holiday_return_feat,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 period = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(holiday_return_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/quest/quest_revise.erl", 31).

-file("inc/holiday_return_new.hrl", 1).

-record(m_holiday_return_new,
	{ver = 1, period = 0, start_time = 0, end_time = 0,
	 gift_status = 0, sign_list = [], quest_list = [],
	 exchange_day_list = [], exchange_buy_list = [],
	 free_draw_count = 0, draw_count = 0, draw_info = 0,
	 draw_type_info = [], must_not = [], get_red_count = 0,
	 red_packet_info = [], get_red_info = [], ext = []}).

-record(holiday_return_new_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/quest/quest_revise.erl", 32).

-file("inc/ios_mark.hrl", 1).

-record(m_ios_mark,
	{ver = 1  :: pos_integer(),
	 quest_list = []  :: list()}).

-record(ios_mark_data,
	{id = 0  :: non_neg_integer(),
	 quest_type = 0  :: pos_integer(),
	 progress = []  :: list()}).

-file("src/mod/quest/quest_revise.erl", 33).

-spec check_finish(#role{}) -> #role{}.

check_finish(Role = #role{m_quest =
			      MQuest = #m_quest{finished = Finished,
						quest = Quests}}) ->
    DoIds = [Id || #quest{id = Id} <- Quests],
    MaxPhase0 = find_max_phase(Finished, 0),
    MaxPhase = find_max_phase(DoIds, MaxPhase0),
    L0 = quest_data:type_list(1),
    L1 = L0 -- DoIds,
    L2 = L1 -- Finished,
    NewFinished = check_need_auto_finish(L2, MaxPhase,
					 Finished),
    NRole = Role#role{m_quest =
			  MQuest#m_quest{finished = NewFinished}},
    {ok, NRole}.

find_max_phase([], MaxPhase) -> MaxPhase;
find_max_phase([Id | T], MaxPhase) ->
    case quest_data:get(Id) of
      #quest_data{phase = Phase, type = 1} ->
	  find_max_phase(T, max(MaxPhase, Phase));
      _ -> find_max_phase(T, MaxPhase)
    end.

check_need_auto_finish([], _MaxPhase, Finished) ->
    Finished;
check_need_auto_finish([Id | T], MaxPhase, Finished) ->
    case quest_data:get(Id) of
      #quest_data{phase = Phase} when Phase < MaxPhase ->
	  check_need_auto_finish(T, MaxPhase, [Id | Finished]);
      _ -> check_need_auto_finish(T, MaxPhase, Finished)
    end.

-spec login_do_feat(#role{}) -> {ok, #role{}}.

login_do_feat(Role) -> {ok, do_feat(Role)}.

-spec do(#role{}) -> #role{}.

do(Role) -> do_revise(Role).

do_feat(Role) -> do_revise_feat(Role).

do_revise(Role = #role{m_quest =
			   Mquest = #m_quest{quest = Quests}}) ->
    Now = date:unixtime(),
    AcceptTimeQuest = revise_accept_time(Quests, []),
    Quests0 = [Q
	       || Q = #quest{end_time = EndT} <- AcceptTimeQuest,
		  EndT =:= 0 orelse EndT > Now],
    NewQuests = do_do(Role, quest, Quests0, []),
    Role#role{m_quest = Mquest#m_quest{quest = NewQuests}}.

do_revise_feat(Role = #role{m_feat =
				MFeat = #m_feat{doing = Quests}}) ->
    Now = date:unixtime(),
    AcceptTimeQuest = revise_accept_time(Quests, []),
    Quests0 = [Q
	       || Q = #quest{end_time = EndT} <- AcceptTimeQuest,
		  EndT =:= 0 orelse EndT > Now],
    NewQuests = do_do(Role, feat, Quests0, []),
    Role#role{m_feat = MFeat#m_feat{doing = NewQuests}}.

do_list(Role, Label, Quests) ->
    do_do(Role, Label, Quests, []).

-spec check_quest_status(#role{}, #quest{}) -> #quest{}.

check_quest_status(Role,
		   Quest = #quest{progress = Progs}) ->
    check_status(Role, Quest, Progs).

do_do(_Role, _Label, [], Quests) -> Quests;
do_do(Role, Label = quest,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case quest_data:get(Id) of
      #quest_data{progress = Progs2} when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #quest_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = feat,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case feat_data:get(Id) of
      #quest_data{progress = Progs2} when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #quest_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = room_feat,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case room_feat_data:get(Id) of
      #quest_data{progress = Progs2} when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #quest_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = room_grow,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case room_grow_data:get(Id) of
      #quest_data{progress = Progs2} when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #quest_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = days_rank,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case (days_rank:data_mod()):get_quest(Id) of
      #quest_data{progress = Progs2} when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #quest_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = guild_quest,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case guild_quest_data:get(Id) of
      #guild_quest_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #guild_quest_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = hallows_quest,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case hallows_data:get_quest(Id) of
      #hallows_quest_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #hallows_quest_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = hallows_look_quest,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case hallows_data:get_look_quest(Id) of
      #hallows_quest_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #hallows_quest_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = day_goals,
      [Quest = #grow_data{goal_id = Id, status = Finish,
			  progress = Progs1}
       | T],
      Quests) ->
    case day_goals_data:get_grow_data(Id) of
      #grow_data{progress = Progs2} when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewProgs2 = [check_progress_status(Prog, Quest, Role)
			     || Prog <- NewProgs],
		NewQuest = case lists:keyfind(0, #quest_progress.finish,
					      NewProgs2)
			       of
			     false ->
				 Quest#grow_data{progress = NewProgs2,
						 status = 1};
			     _ -> Quest#grow_data{progress = NewProgs2}
			   end,
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #grow_data{} -> do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = holiday_lanterm_adventure,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case holiday_lanterm_adventure_data:get(Id) of
      #holiday_lanterm_adventure_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #holiday_lanterm_adventure_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = holiday_lanterm_adventure1,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case holiday_lanterm_adventure_data:get(Id) of
      #holiday_lanterm_adventure_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #holiday_lanterm_adventure_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = holiday_lanterm_adventure2,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case holiday_lanterm_adventure_data:get(Id) of
      #holiday_lanterm_adventure_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #holiday_lanterm_adventure_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = holiday_lanterm_adventure3,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case holiday_lanterm_adventure_data:get(Id) of
      #holiday_lanterm_adventure_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #holiday_lanterm_adventure_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = holiday_return_feat,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case holiday_return_data:get_quest(Id) of
      #holiday_return_feat_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #holiday_return_feat_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = holiday_return_new_feat,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case holiday_return_new_data:get_quest(Id) of
      #holiday_return_new_feat_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #holiday_return_new_feat_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = day_goals_new,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case day_goals_new:get_quest(Id) of
      #grow_data{progress = Progs2} when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #grow_data{} -> do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = holiday_war_order,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case holiday_war_order_data:get_quest(Id) of
      #war_order_data{progress = Progs2} when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #war_order_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = holiday_new_war_order,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case holiday_new_war_order_data:get_quest(Id) of
      #new_war_order_data{progress = Progs2}
	  when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #new_war_order_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label = ios_mark,
      [Quest = #quest{id = Id, finish = Finish,
		      progress = Progs1}
       | T],
      Quests) ->
    case ios_mark_data:get_quest(Id) of
      #ios_mark_data{progress = Progs2} when Finish =:= 0 ->
	  case camp_progs(lists:keysort(#quest_progress.id,
					Progs1),
			  Progs2, Quest, Role, [])
	      of
	    {ok, NewProgs} ->
		NewQuest = check_status(Role, Quest, NewProgs),
		do_do(Role, Label, T, [NewQuest | Quests]);
	    false -> do_do(Role, Label, T, Quests)
	  end;
      #ios_mark_data{} ->
	  do_do(Role, Label, T, [Quest | Quests]);
      _ -> do_do(Role, Label, T, Quests)
    end;
do_do(Role, Label, [I | T], Quests) ->
    do_do(Role, Label, T, [I | Quests]).

camp_progs([], [], _Quest, _Role, Progs) ->
    {ok, lists:reverse(Progs)};
camp_progs([P = #quest_progress{finish = 1} | T1],
	   [_ | T2], Quest, Role, Progs) ->
    camp_progs(T1, T2, Quest, Role, [P | Progs]);
camp_progs([P = #quest_progress{label = Label,
				target = Target, target_val = TarVal,
				param = Param}
	    | T1],
	   [#quest_progress{label = Label, target = Target,
			    target_val = TarVal, param = Param}
	    | T2],
	   Quest, Role, Progs) ->
    camp_progs(T1, T2, Quest, Role, [P | Progs]);
camp_progs([P = #quest_progress{label = Label} | T1],
	   [#quest_progress{label = Label, target_val = TarVal,
			    target = Target, param = Param}
	    | T2],
	   Quest, Role, Progs) ->
    NewP = check_progress_status(P#quest_progress{target_val
						      = TarVal,
						  target = Target,
						  param = Param},
				 Quest, Role),
    camp_progs(T1, T2, Quest, Role, [NewP | Progs]);
camp_progs(_Progs, _NProgs, _Quest, _Role, _Acc) ->
    false.

check_status(Role = #role{}, Quest, Progs) ->
    NewProgs = [check_progress_status(Prog, Quest, Role)
		|| Prog <- Progs],
    case lists:keyfind(0, #quest_progress.finish, NewProgs)
	of
      false -> Quest#quest{progress = NewProgs, finish = 1};
      _ -> Quest#quest{progress = NewProgs}
    end.

revise_accept_time([], Acc) -> Acc;
revise_accept_time([Quest = #quest{accept_time =
				       undefined}
		    | Rest],
		   Acc) ->
    NewQuest = Quest#quest{accept_time = 0},
    revise_accept_time(Rest, [NewQuest | Acc]);
revise_accept_time([Quest | Rest], Acc) ->
    revise_accept_time(Rest, [Quest | Acc]).

check_progress_status(Prog = #quest_progress{finish =
						 1},
		      _Quest, _Role) ->
    Prog;
check_progress_status(Prog = #quest_progress{label =
						 evt_enter_map,
					     target = Target,
					     target_val = TargetVal},
		      _Quest, #role{pos = #pos{map_bid = Target}}) ->
    Prog#quest_progress{finish = 1, value = TargetVal};
check_progress_status(Prog = #quest_progress{label =
						 evt_use_item,
					     target = Target},
		      _Quest,
		      _Role = #role{p_eqm = #package{items = Items}}) ->
    case lists:keyfind(Target, #item.base_id, Items) of
      #item{} ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
check_progress_status(Prog = #quest_progress{label =
						 evt_use_item_type,
					     target = Target},
		      _Quest,
		      _Role = #role{p_eqm = #package{items = Items}}) ->
    case lists:keyfind(Target, #item.type, Items) of
      #item{} ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
check_progress_status(Prog = #quest_progress{label =
						 evt_get_item,
					     target = Target},
		      _Quest, #role{p_bag = Bag})
    when Target > 0 ->
    {_, Num} = package:count(by_base_id, Target, Bag),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
check_progress_status(Prog,
		      #grow_data{goal_id = QuestId}, Role) ->
    quest_prog_init:update(Prog, QuestId, Role);
check_progress_status(Prog, #quest{id = QuestId},
		      Role) ->
    quest_prog_init:update(Prog, QuestId, Role).


