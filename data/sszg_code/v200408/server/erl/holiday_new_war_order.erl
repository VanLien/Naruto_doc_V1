-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      1).

-module(holiday_new_war_order).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{activity, [id, status, name, data, ext_args]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		{new_war_order_data,
		 [goal_id, period, quest_type, day, min_day, max_day,
		  min_lev, max_lev, status, condition, progress, award,
		  target_type]},
		{m_new_war_order,
		 [ver, period, period_day, period_lev, day_lev, week_lev,
		  start_time, end_time, rmb_status, quest_list, card,
		  lev_reward]},
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

-export([init/0, apply_timer/1, init_war_order/1,
	 zero_flush/1, reissue/1, login/1, fire/2, push_quest/1,
	 push_lev_reward/1, push_change_lev/2, push_gift/1,
	 update_quest/3, commit_quest/2, take_lev_reward/2,
	 is_charge_new_war_order/2]).

-export([gm_set_day/2]).

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

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      29).

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

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      30).

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

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      31).

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

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      32).

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

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      33).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      34).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      35).

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

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      36).

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

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      37).

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

-file("src/mod/holiday_new_war_order/holiday_new_war"
      "_order.erl",
      38).

reissue(all) ->
    role_group:apply(world,
		     {holiday_new_war_order, reissue, []});
reissue(Role = #role{id = RoleId, name = Name,
		     m_new_war_order =
			 #m_new_war_order{period = OldPeriod, period_day = Day,
					  rmb_status = OldRmbStatus}}) ->
    case var:get_var(Role, other, 3105, 0) of
      0 ->
	  case OldRmbStatus of
	    1 when OldPeriod =/= 0 ->
		NRole = var:set_var(Role, other, 3105, 1),
		Reward = [{50904, 1}, {80265, 2000}],
		{Assets, Items} = format:split_assets_items(Reward),
		{ok, NRole1} = mail:add(NRole,
					{util:fbin("英灵战令称号补发", []),
					 util:fbin("亲爱的冒险者大人，以下是英灵战令称号补发内容，请查收",
						   []),
					 Assets, Items, <<"英灵战令称号补发"/utf8>>,
					 86400 + date:unixtime()}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_new_war_order51, _,
		   {__Levelholiday_new_war_order51,
		    __Tracesholiday_new_war_order51}}
		      when __Levelholiday_new_war_order51 band 64 /= 0 orelse
			     __Tracesholiday_new_war_order51 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_new_war_order},
				    {function, reissue}, {line, 51},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~w，Name:~ts执行了新战令称号补发",
						 [RoleId, Name]),
				   none, 4096, 64,
				   __Levelholiday_new_war_order51,
				   __Tracesholiday_new_war_order51, lager_event,
				   __Pidholiday_new_war_order51);
		  _ -> ok
		end,
		{ok, NRole1};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_new_war_order54, _,
		   {__Levelholiday_new_war_order54,
		    __Tracesholiday_new_war_order54}}
		      when __Levelholiday_new_war_order54 band 128 /= 0 orelse
			     __Tracesholiday_new_war_order54 /= [] ->
		      lager:do_log(debug,
				   [{module, holiday_new_war_order},
				    {function, reissue}, {line, 54},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~w，Name:~ts执行了新战令称号补发时的期数：~w, 天数：~w, "
						 "充值状态：~w",
						 [RoleId, Name, OldPeriod, Day,
						  OldRmbStatus]),
				   none, 4096, 128,
				   __Levelholiday_new_war_order54,
				   __Tracesholiday_new_war_order54, lager_event,
				   __Pidholiday_new_war_order54);
		  _ -> ok
		end,
		NRole1 = var:set_var(Role, other, 3105, 2),
		{ok, NRole1}
	  end;
      _ -> {ok, Role}
    end.

-spec gm_set_day(#role{}, pos_integer()) -> {ok,
					     #role{}}.

gm_set_day(Role = #role{m_new_war_order =
			    MWarOrder = #m_new_war_order{period = OldPeriod,
							 quest_list =
							     QuestList}},
	   Day) ->
    PeriodDay =
	holiday_new_war_order_data:get_period_day(OldPeriod),
    NewStartTime = date:unixtime({zero,
				  date:unixtime() -
				    86400 * (min(PeriodDay, Day) - 1)}),
    NewEndTime = NewStartTime + 86400 * PeriodDay - 1,
    NewQuestList = do_gm_reload(QuestList, NewStartTime,
				NewEndTime, []),
    NRole = Role#role{m_new_war_order =
			  MWarOrder#m_new_war_order{start_time = NewStartTime,
						    quest_list = NewQuestList}},
    zero_flush(NRole).

do_gm_reload([], _, _, QuestList) -> QuestList;
do_gm_reload([Quest = #quest{id = Id} | T], StartTime,
	     EndTime, QuestList) ->
    case holiday_new_war_order_data:get_quest(Id) of
      #new_war_order_data{quest_type = QuestType, day = Day,
			  max_day = WeekMaxDay} ->
	  NewEndTimeT = if QuestType == 7 ->
			       StartTime + 86400 * Day - 1;
			   QuestType == 8 -> StartTime + 86400 * WeekMaxDay - 1;
			   true -> EndTime
			end,
	  NewEndTime = min(NewEndTimeT, EndTime),
	  NewQuest = Quest#quest{end_time = NewEndTime},
	  do_gm_reload(T, StartTime, EndTime,
		       [NewQuest | QuestList]);
      _ -> do_gm_reload(T, StartTime, EndTime, QuestList)
    end.

-spec init() -> #m_new_war_order{}.

init() -> #m_new_war_order{}.

init_war_order(Role = #role{lev = Lev,
			    m_new_war_order =
				WarOrder = #m_new_war_order{period =
								Period}}) ->
    OpenCond = holiday_new_war_order_data:open_cond(1),
    Now = date:unixtime(),
    NewRole = case role_misc:check_open_cond(OpenCond, Role)
		  of
		true when Period =:= 0 ->
		    PeriodDay =
			holiday_new_war_order_data:get_period_day(1),
		    StartTime = date:unixtime({zero, Now}),
		    EndTime = StartTime + 86400 * PeriodDay - 1,
		    NRole = Role#role{m_new_war_order =
					  WarOrder#m_new_war_order{start_time =
								       StartTime,
								   period = 1,
								   period_day =
								       1,
								   period_lev =
								       Lev,
								   day_lev =
								       Lev,
								   week_lev =
								       Lev,
								   end_time =
								       EndTime,
								   rmb_status =
								       0,
								   quest_list =
								       [],
								   card = [],
								   lev_reward =
								       []}},
		    NRole1 = check_new_quest(NRole, StartTime),
		    set_activity_status(1, 1, []),
		    push_gift(NRole1),
		    push_quest(NRole1),
		    Timer1 = #timer{id = new_war_order_point,
				    timeout = 2 * 1000, times = 1,
				    m = holiday_new_war_order, f = apply_timer,
				    a = []},
		    NRole2 = role_timer:set(Timer1, NRole1),
		    NRole2;
		_ -> Role
	      end,
    NewRole.

apply_timer(Role) ->
    sys_conn:pack_send(28708, {1}), {ok, Role}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_new_war_order =
			    #m_new_war_order{period = 0}}) ->
    NewRole = init_war_order(Role), {ok, NewRole};
zero_flush(Role = #role{lev = Lev,
			m_new_war_order =
			    #m_new_war_order{period = OldPeriod,
					     week_lev = OldWeekLev,
					     start_time = StartTime}}) ->
    MaxPeriodDay =
	holiday_new_war_order_data:get_period_day(OldPeriod),
    MaxPeriod = holiday_new_war_order_data:max_period(),
    Now = date:unixtime(),
    NewPeriodDay = date:day_diff(StartTime, Now) + 1,
    NewRole1 = case NewPeriodDay > MaxPeriodDay of
		 false ->
		     {Role1, DelQuestList} = reissue_award(Role, 0),
		     NRole = #role{m_new_war_order = MWarOrder} =
				 del_quest(DelQuestList, Role1),
		     WeekDayList =
			 lists:usort(holiday_new_war_order_data:week_start_day(OldPeriod)),
		     NewWeekLev = case lists:member(NewPeriodDay,
						    WeekDayList)
				      of
				    true -> Lev;
				    _ -> OldWeekLev
				  end,
		     NRole1 = NRole#role{m_new_war_order =
					     MWarOrder#m_new_war_order{period_day
									   =
									   NewPeriodDay,
								       day_lev =
									   Lev,
								       week_lev
									   =
									   NewWeekLev}},
		     NewRole = check_new_quest(NRole1, StartTime),
		     set_activity_status(OldPeriod, 1, []),
		     push_gift(NewRole),
		     push_quest(NewRole),
		     NewRole;
		 _ ->
		     {NNRole, DelQuestList} = reissue_award(Role, 1),
		     NRole = #role{m_new_war_order = NewWarOrder} =
				 del_quest(DelQuestList, NNRole),
		     NewPeriodDay1 = NewPeriodDay rem MaxPeriodDay,
		     NewPeriodDay2 = util:if_true(NewPeriodDay1 =:= 0,
						  MaxPeriodDay, NewPeriodDay1),
		     NewStartTime = date:unixtime(zero) -
				      86400 * (NewPeriodDay2 - 1),
		     CrossPeriod = util:if_true(NewPeriodDay1 =:= 0,
						trunc(NewPeriodDay /
							MaxPeriodDay)
						  - 1,
						trunc(NewPeriodDay /
							MaxPeriodDay)),
		     NewPeriod = min(OldPeriod + CrossPeriod, MaxPeriod),
		     NewMaxPeriodDay =
			 holiday_new_war_order_data:get_period_day(NewPeriod),
		     NewEndTime = NewStartTime + 86400 * NewMaxPeriodDay - 1,
		     NRole1 = NRole#role{m_new_war_order =
					     NewWarOrder#m_new_war_order{period
									     =
									     NewPeriod,
									 start_time
									     =
									     NewStartTime,
									 period_day
									     =
									     NewPeriodDay2,
									 period_lev
									     =
									     Lev,
									 day_lev
									     =
									     Lev,
									 week_lev
									     =
									     Lev,
									 end_time
									     =
									     NewEndTime,
									 rmb_status
									     =
									     0,
									 quest_list
									     =
									     [],
									 card =
									     [],
									 lev_reward
									     =
									     []}},
		     NewRole = check_new_quest(NRole1, NewStartTime),
		     set_activity_status(OldPeriod, 0, []),
		     set_activity_status(NewPeriod, 1, []),
		     push_gift(NewRole),
		     push_quest(NewRole),
		     Timer1 = #timer{id = new_war_order_point,
				     timeout = 2 * 1000, times = 1,
				     m = holiday_new_war_order, f = apply_timer,
				     a = []},
		     NRole2 = role_timer:set(Timer1, NewRole),
		     NRole2
	       end,
    {ok, NewRole1}.

-spec login(#role{}) -> {ok, #role{}}.

login(PRole = #role{lev = Lev,
		    m_new_war_order =
			#m_new_war_order{period = OldPeriod,
					 period_day = OldPeriodDay,
					 week_lev = OldWeekLev,
					 start_time = StartTime,
					 quest_list = QuestList,
					 rmb_status = OldRmbStatus}}) ->
    {ok, Role} = reissue(PRole),
    case OldPeriod =:= 0 of
      true -> NewRole = init_war_order(Role), {ok, NewRole};
      _ ->
	  MaxPeriodDay =
	      holiday_new_war_order_data:get_period_day(OldPeriod),
	  MaxPeriod = holiday_new_war_order_data:max_period(),
	  Now = date:unixtime(),
	  NewPeriodDay = date:day_diff(StartTime, Now) + 1,
	  NewRole1 = case NewPeriodDay > MaxPeriodDay of
		       true ->
			   {NRole = #role{m_new_war_order = NewWarOrder}, _} =
			       reissue_award(Role, 1),
			   NewPeriodDay1 = NewPeriodDay rem MaxPeriodDay,
			   NewPeriodDay2 = util:if_true(NewPeriodDay1 =:= 0,
							MaxPeriodDay,
							NewPeriodDay1),
			   NewStartTime = date:unixtime(zero) -
					    86400 * (NewPeriodDay2 - 1),
			   CrossPeriod = util:if_true(NewPeriodDay1 =:= 0,
						      trunc(NewPeriodDay /
							      MaxPeriodDay)
							- 1,
						      trunc(NewPeriodDay /
							      MaxPeriodDay)),
			   NewPeriod = min(OldPeriod + CrossPeriod, MaxPeriod),
			   NewMaxPeriodDay =
			       holiday_new_war_order_data:get_period_day(NewPeriod),
			   NewEndTime = NewStartTime + 86400 * NewMaxPeriodDay -
					  1,
			   NRole1 = NRole#role{m_new_war_order =
						   NewWarOrder#m_new_war_order{period
										   =
										   NewPeriod,
									       start_time
										   =
										   NewStartTime,
									       period_day
										   =
										   NewPeriodDay2,
									       period_lev
										   =
										   Lev,
									       day_lev
										   =
										   Lev,
									       week_lev
										   =
										   Lev,
									       end_time
										   =
										   NewEndTime,
									       rmb_status
										   =
										   0,
									       quest_list
										   =
										   [],
									       card
										   =
										   [],
									       lev_reward
										   =
										   []}},
			   NewRole = check_new_quest(NRole1, NewStartTime),
			   set_activity_status(OldPeriod, 0, []),
			   set_activity_status(NewPeriod, 1, []),
			   push_gift(NewRole),
			   push_quest(NewRole),
			   Timer1 = #timer{id = new_war_order_point,
					   timeout = 2 * 1000, times = 1,
					   m = holiday_new_war_order,
					   f = apply_timer, a = []},
			   NRole2 = role_timer:set(Timer1, NewRole),
			   NRole2;
		       false when NewPeriodDay =:= OldPeriodDay ->
			   QuestList1 = quest_revise:do_list(Role,
							     holiday_new_war_order,
							     QuestList),
			   {NewQuestList,
			    Role1 = #role{m_new_war_order = MWarOrder}} =
			       quest:load_quest(QuestList1, [],
						holiday_new_war_order, Role),
			   NewRole = check_new_quest(Role1#role{m_new_war_order
								    =
								    MWarOrder#m_new_war_order{quest_list
												  =
												  NewQuestList}},
						     StartTime),
			   set_activity_status(OldPeriod, 1, []),
			   push_gift(NewRole),
			   push_quest(NewRole),
			   NewRole;
		       _ ->
			   {Role1 = #role{m_new_war_order =
					      #m_new_war_order{quest_list =
								   QuestList1}},
			    _} =
			       reissue_award(Role, 0),
			   QuestList2 = quest_revise:do_list(Role1,
							     holiday_new_war_order,
							     QuestList1),
			   {NewQuestList,
			    NRole = #role{m_new_war_order = MWarOrder}} =
			       quest:load_quest(QuestList2, [],
						holiday_new_war_order, Role1),
			   WeekDayList =
			       lists:usort(holiday_new_war_order_data:week_start_day(OldPeriod)),
			   NewWeekLev = case lists:member(NewPeriodDay,
							  WeekDayList)
					    of
					  true -> Lev;
					  _ -> OldWeekLev
					end,
			   NRole1 = NRole#role{m_new_war_order =
						   MWarOrder#m_new_war_order{period_day
										 =
										 NewPeriodDay,
									     quest_list
										 =
										 NewQuestList,
									     day_lev
										 =
										 Lev,
									     week_lev
										 =
										 NewWeekLev}},
			   NewRole = check_new_quest(NRole1, StartTime),
			   set_activity_status(OldPeriod, 1, []),
			   push_gift(NewRole),
			   push_quest(NewRole),
			   NewRole
		     end,
	  {ok, NewRole1}
    end.

-spec fire(#role{}, map()) -> {ok, #role{}}.

fire(Role = #role{name = Name,
		  m_new_war_order =
		      #m_new_war_order{period = Period, card = CardL}},
     Opt = #{sn := Sn, package_id := PackageId,
	     money := Money}) ->
    case holiday_new_war_order_data:charge({Period,
					    PackageId})
	of
      CardId when is_integer(CardId) ->
	  case lists:keyfind(CardId, 1, CardL) of
	    false ->
		Reward =
		    holiday_new_war_order_data:get_card_award({Period,
							       CardId}),
		Gain = format:val_to_gain(Reward,
					  holiday_new_war_order),
		case role_gain:do_notice(Role, Gain) of
		  {false, _} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_new_war_order244, _,
			 {__Levelholiday_new_war_order244,
			  __Tracesholiday_new_war_order244}}
			    when __Levelholiday_new_war_order244 band 8 /= 0
				   orelse
				   __Tracesholiday_new_war_order244 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_new_war_order},
					  {function, fire}, {line, 244},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w领取新版战令礼包~w失败",
						       [Role#role.name,
							CardId]),
					 none, 4096, 8,
					 __Levelholiday_new_war_order244,
					 __Tracesholiday_new_war_order244,
					 lager_event,
					 __Pidholiday_new_war_order244);
			_ -> ok
		      end,
		      {ok, Role};
		  {ok, Role1 = #role{m_new_war_order = MWarOrder}} ->
		      NewCardL = lists:keystore(CardId, 1, CardL,
						{CardId, 1}),
		      NewRole = Role1#role{m_new_war_order =
					       MWarOrder#m_new_war_order{card =
									     NewCardL,
									 rmb_status
									     =
									     1}},
		      log:log_gain(Gain, Role, NewRole, <<"运营活动_新版战令"/utf8>>,
				   util:fbin("战令进阶卡:~w", [CardId])),
		      notice:broadcast(rumor_left_top,
				       color:msg(lang:get(<<"恭喜~ts玩家激活~ts进阶奖励，冒险大陆再添一位冒险勇士！"/utf8>>),
						 [{role, Name},
						  holiday_new_war_order_data:period_name(Period)])),
		      push_gift(NewRole),
		      {ok, NewRole}
		end;
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"运营活动_新版战令"/utf8>>,
			       util:fbin("战令活动充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

-spec update_quest(#role{}, #quest{},
		   #quest_progress{}) -> #role{}.

update_quest(Role = #role{m_new_war_order =
			      MWarOrder = #m_new_war_order{quest_list =
							       QuestList}},
	     Q = #quest{id = QuestId, progress = P},
	     Progress = #quest_progress{id = ProgressId}) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    P, Progress),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuestList = lists:keyreplace(QuestId, #quest.id,
					  QuestList, NewQuest),
	  NewRole = Role#role{m_new_war_order =
				  MWarOrder#m_new_war_order{quest_list =
								NewQuestList}},
	  push_quest(NewRole, [NewQuest]),
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuestList = lists:keyreplace(QuestId, #quest.id,
					  QuestList, NewQuest),
	  push_quest(Role, [NewQuest]),
	  Role#role{m_new_war_order =
			MWarOrder#m_new_war_order{quest_list = NewQuestList}}
    end.

-spec push_quest(#role{}) -> ok.

push_quest(Role = #role{m_new_war_order =
			    #m_new_war_order{quest_list = QuestList,
					     period = Period,
					     period_lev = PeriodLev,
					     day_lev = DayLev,
					     week_lev = WeekLev,
					     period_day = PeriodDay,
					     end_time = EndTime,
					     rmb_status = RmbStatus}}) ->
    CliList = [to_cli(I) || I = #quest{} <- QuestList],
    {Lev, Exp} = calc_lev(Role),
    sys_conn:pack_send(28700,
		       {Period, PeriodDay, EndTime, Lev, Exp, PeriodLev,
			DayLev, WeekLev, RmbStatus, CliList}),
    ok.

-spec push_quest(#role{}, list()) -> ok.

push_quest(_Role, List) ->
    CliList = [to_cli(I) || I <- List],
    sys_conn:pack_send(28701, {CliList}),
    ok.

to_cli(#quest{id = Id, finish = Finish, type = Type,
	      end_time = EndTime,
	      progress =
		  [#quest_progress{target_val = TarVal, value = Val}]}) ->
    {Id, Type, Finish, TarVal, Val, EndTime};
to_cli(#quest{id = Id, type = Type, finish = Finish,
	      progress = []}) ->
    {Id, Type, Finish, 1, 1, 0}.

-spec push_change_lev(#role{}, pos_integer()) -> ok.

push_change_lev(Role = #role{m_new_war_order =
				 #m_new_war_order{period = Period}},
		ItemId) ->
    NeedItemId =
	holiday_new_war_order_data:get_exp_item(Period),
    case ItemId =:= NeedItemId of
      true ->
	  {Lev, Exp} = calc_lev(Role),
	  sys_conn:pack_send(28705, {Lev, Exp}),
	  ok;
      _ -> ok
    end.

-spec push_lev_reward(#role{}) -> ok.

push_lev_reward(Role = #role{m_new_war_order =
				 #m_new_war_order{lev_reward = LevReward}}) ->
    {Lev, _} = calc_lev(Role),
    sys_conn:pack_send(28703, {Lev, LevReward}),
    ok.

-spec push_gift(#role{}) -> ok.

push_gift(#role{m_new_war_order =
		    #m_new_war_order{rmb_status = RmbStatus,
				     card = CardL}}) ->
    sys_conn:pack_send(28706, {RmbStatus, CardL}), ok.

-spec take_lev_reward(#role{}, pos_integer()) -> {ok,
						  #role{}} |
						 {false, bitstring()}.

take_lev_reward(Role = #role{m_new_war_order =
				 #m_new_war_order{lev_reward = LevReward,
						  period = Period,
						  rmb_status = RmbStatus,
						  period_lev = PLev}},
		0) ->
    {Lev, _} = calc_lev(Role),
    case holiday_new_war_order_data:lev_reward_list(Period)
	of
      LevRewardCfg = [_ | _] ->
	  CanGetLevReward = [LevCfg
			     || LevCfg <- LevRewardCfg, Lev >= LevCfg],
	  Fun = fun (LevT, {AllRewardT, LevRewardT}) ->
			RewardT =
			    holiday_new_war_order_data:get_lev_reward({Period,
								       LevT,
								       PLev}),
			RmbRewardT =
			    holiday_new_war_order_data:get_rmb_lev_reward({Period,
									   LevT,
									   PLev}),
			case lists:keyfind(LevT, 1, LevRewardT) of
			  false ->
			      case RmbStatus == 1 of
				true ->
				    Reward1 = item_lib:merge(RewardT,
							     RmbRewardT),
				    NAllRewardT = item_lib:merge(Reward1,
								 AllRewardT),
				    NLevRewardT = lists:keystore(LevT, 1,
								 LevRewardT,
								 {LevT, 1, 1}),
				    {NAllRewardT, NLevRewardT};
				_ ->
				    case RewardT of
				      [_ | _] ->
					  NAllRewardT = item_lib:merge(RewardT,
								       AllRewardT),
					  NLevRewardT = lists:keystore(LevT, 1,
								       LevRewardT,
								       {LevT, 1,
									0}),
					  {NAllRewardT, NLevRewardT};
				      _ -> {AllRewardT, LevRewardT}
				    end
			      end;
			  {_, 1, 0} when RmbStatus == 1 ->
			      NAllRewardT = item_lib:merge(RmbRewardT,
							   AllRewardT),
			      NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
							   {LevT, 1, 1}),
			      {NAllRewardT, NLevRewardT};
			  _ -> {AllRewardT, LevRewardT}
			end
		end,
	  {AllReward, NewLevReward} = lists:foldl(Fun,
						  {[], LevReward},
						  CanGetLevReward),
	  case AllReward =:= [] of
	    true -> {false, lang:get(<<"没有可领取的奖励"/utf8>>)};
	    _ ->
		GL = format:val_to_gain(AllReward,
					holiday_new_war_order),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, NRole = #role{m_new_war_order = MWarOrder}} ->
		      log:log_gain(GL, Role, NRole, <<"运营活动_新版战令"/utf8>>,
				   util:fbin("一键领取，等级~w，特权：~w，领取前~w",
					     [Lev, RmbStatus, LevReward])),
		      NewRole = NRole#role{m_new_war_order =
					       MWarOrder#m_new_war_order{lev_reward
									     =
									     NewLevReward}},
		      push_lev_reward(NewRole),
		      {ok, NewRole}
		end
	  end;
      _ -> {false, lang:get(<<"当前不在活动期间"/utf8>>)}
    end;
take_lev_reward(Role = #role{m_new_war_order =
				 #m_new_war_order{lev_reward = LevReward,
						  period = Period,
						  rmb_status = RmbStatus,
						  period_lev = PLev}},
		Id) ->
    {Lev, _} = calc_lev(Role),
    case Id > Lev of
      true -> {false, lang:get(<<"未达到领取等级"/utf8>>)};
      _ ->
	  case holiday_new_war_order_data:get_lev_reward({Period,
							  Id, PLev})
	      of
	    Reward = [_ | _] ->
		case lists:keyfind(Id, 1, LevReward) of
		  false when RmbStatus == 1 ->
		      RmbReward =
			  holiday_new_war_order_data:get_rmb_lev_reward({Period,
									 Id,
									 PLev}),
		      GL = format:val_to_gain(Reward ++ RmbReward,
					      new_war_order_lev_reward),
		      case role_gain:do_notice(Role, GL) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, NRole = #role{m_new_war_order = MWarOrder}} ->
			    NewLevReward = lists:keystore(Id, 1, LevReward,
							  {Id, 1, 1}),
			    NewRole = NRole#role{m_new_war_order =
						     MWarOrder#m_new_war_order{lev_reward
										   =
										   NewLevReward}},
			    log:log_gain(GL, Role, NewRole,
					 <<"运营活动_新版战令"/utf8>>,
					 util:fbin("领取普通和付费等级奖励 ~w", [Id])),
			    push_lev_reward(NewRole),
			    {ok, NewRole}
		      end;
		  false ->
		      GL = format:val_to_gain(Reward,
					      new_war_order_lev_reward),
		      case role_gain:do_notice(Role, GL) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, NRole = #role{m_new_war_order = MWarOrder}} ->
			    NewLevReward = lists:keystore(Id, 1, LevReward,
							  {Id, 1, 0}),
			    NewRole = NRole#role{m_new_war_order =
						     MWarOrder#m_new_war_order{lev_reward
										   =
										   NewLevReward}},
			    log:log_gain(GL, Role, NewRole,
					 <<"运营活动_新版战令"/utf8>>,
					 util:fbin("领取普通等级奖励 ~w", [Id])),
			    push_lev_reward(NewRole),
			    {ok, NewRole}
		      end;
		  {_, 1, 0} when RmbStatus == 1 ->
		      case
			holiday_new_war_order_data:get_rmb_lev_reward({Period,
								       Id,
								       PLev})
			  of
			RmbReward = [_ | _] ->
			    GL = format:val_to_gain(RmbReward,
						    new_war_order_lev_reward),
			    case role_gain:do_notice(Role, GL) of
			      {false, #gain{msg = Msg}} -> {false, Msg};
			      {ok,
			       NRole = #role{m_new_war_order = MWarOrder}} ->
				  NewLevReward = lists:keystore(Id, 1,
								LevReward,
								{Id, 1, 1}),
				  NewRole = NRole#role{m_new_war_order =
							   MWarOrder#m_new_war_order{lev_reward
											 =
											 NewLevReward}},
				  log:log_gain(GL, Role, NewRole,
					       <<"运营活动_新版战令"/utf8>>,
					       util:fbin("领取付费等级奖励 ~w", [Id])),
				  push_lev_reward(NewRole),
				  {ok, NewRole}
			    end;
			_ -> {false, lang:get(<<"奖励不存在"/utf8>>)}
		      end;
		  {_, 1, 0} -> {false, lang:get(<<"未达到领取条件"/utf8>>)};
		  _ -> {false, lang:get(<<"奖励已领取"/utf8>>)}
		end;
	    _ ->
		case lists:keyfind(Id, 1, LevReward) of
		  false when RmbStatus == 1 ->
		      case
			holiday_new_war_order_data:get_rmb_lev_reward({Period,
								       Id,
								       PLev})
			  of
			RmbReward = [_ | _] ->
			    GL = format:val_to_gain(RmbReward,
						    new_war_order_lev_reward),
			    case role_gain:do_notice(Role, GL) of
			      {false, #gain{msg = Msg}} -> {false, Msg};
			      {ok,
			       NRole = #role{m_new_war_order = MWarOrder}} ->
				  NewLevReward = lists:keystore(Id, 1,
								LevReward,
								{Id, 1, 1}),
				  NewRole = NRole#role{m_new_war_order =
							   MWarOrder#m_new_war_order{lev_reward
											 =
											 NewLevReward}},
				  log:log_gain(GL, Role, NewRole,
					       <<"运营活动_新版战令"/utf8>>,
					       util:fbin("领取付费等级奖励 ~w", [Id])),
				  push_lev_reward(NewRole),
				  {ok, NewRole}
			    end;
			_ -> {false, lang:get(<<"奖励不存在"/utf8>>)}
		      end;
		  {_, 1, 1} -> {false, lang:get(<<"奖励已领取"/utf8>>)};
		  _ -> {false, lang:get(<<"未达到领取条件"/utf8>>)}
		end
	  end
    end.

-spec commit_quest(#role{},
		   Id :: pos_integer()) -> {false, binary()} |
					   {ok, #role{}}.

commit_quest(Role = #role{m_new_war_order =
			      #m_new_war_order{quest_list = QuestList}},
	     Id) ->
    case holiday_new_war_order_data:get_reward(Id) of
      Items when is_list(Items) ->
	  case lists:keyfind(Id, #quest.id, QuestList) of
	    #quest{finish = 2} ->
		{false, lang:get(<<"任务已提交"/utf8>>)};
	    Q = #quest{finish = 1} ->
		GL = format:val_to_gain(Items,
					holiday_new_war_order_quest),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1 = #role{m_new_war_order = MWarOrder}} ->
		      NewQuest = Q#quest{finish = 2},
		      NewQuestList = lists:keyreplace(Id, #quest.id,
						      QuestList, NewQuest),
		      NRole = Role1#role{m_new_war_order =
					     MWarOrder#m_new_war_order{quest_list
									   =
									   NewQuestList}},
		      push_quest(NRole, [NewQuest]),
		      log:log_gain(GL, Role, NRole, <<"运营活动_新版战令"/utf8>>,
				   util:fbin("id:~w", [Id])),
		      {ok, NRole}
		end;
	    #quest{} -> {false, lang:get(<<"任务未完成"/utf8>>)};
	    _ -> {false, lang:get(<<"任务不存在"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"配置数据不存在"/utf8>>)}
    end.

reissue_award(Role = #role{m_new_war_order =
			       #m_new_war_order{quest_list = []}},
	      _) ->
    {Role, []};
reissue_award(Role = #role{m_new_war_order =
			       #m_new_war_order{period = Period,
						period_day = PeriodDay,
						quest_list = QuestList}},
	      0) ->
    ExpItemId =
	holiday_new_war_order_data:get_exp_item(Period),
    Now = date:unixtime(),
    {RestQuestList, OverdueQL} = lists:partition(fun
						   (#quest{end_time =
							       EndTime}) ->
						       EndTime > Now
						 end,
						 QuestList),
    GrowFun = fun (#quest{id = QuestId, finish = 1},
		   {AccMailItem, AccExpItem}) ->
		      AwardList = case
				    holiday_new_war_order_data:get_reward(QuestId)
				      of
				    List when is_list(List) -> List;
				    _ -> []
				  end,
		      {ExpAward, MailAward} = lists:partition(fun ({ItemId,
								    _}) ->
								      ItemId =:=
									ExpItemId
							      end,
							      AwardList),
		      NewAccItem = item_lib:merge(MailAward, AccMailItem),
		      NewExpItem = item_lib:merge(ExpAward, AccExpItem),
		      {NewAccItem, NewExpItem};
		  (_, DataT) -> DataT
	      end,
    {MailItem, ExpItem} = lists:foldl(GrowFun, {[], []},
				      OverdueQL),
    NRole = case MailItem of
	      [_ | _] ->
		  {Assets, Items} = format:split_assets_items(MailItem),
		  PeriodName =
		      holiday_new_war_order_data:period_name(Period),
		  {ok, RoleT} = mail:add(Role,
					 {util:fbin("~ts奖励补发", [PeriodName]),
					  util:fbin("亲爱的冒险者大人, 以下是您~ts活动中未领取的奖励，请查收",
						    [PeriodName]),
					  Assets, Items,
					  lang:get(<<"战令活动"/utf8>>),
					  86400 + date:unixtime()}),
		  RoleT;
	      _ -> Role
	    end,
    Gain = format:val_to_gain(ExpItem,
			      holiday_new_war_order),
    NewRole = #role{m_new_war_order = MWarOrder} = case
						     role_gain:do(NRole, Gain)
						       of
						     {false, _} ->
							 case
							   {whereis(lager_event),
							    whereis(lager_event),
							    lager_config:get({lager_event,
									      loglevel},
									     {0,
									      []})}
							     of
							   {undefined,
							    undefined, _} ->
							       fun () ->
								       {error,
									lager_not_running}
							       end();
							   {undefined, _, _} ->
							       fun () ->
								       {error,
									{sink_not_configured,
									 lager_event}}
							       end();
							   {__Pidholiday_new_war_order530,
							    _,
							    {__Levelholiday_new_war_order530,
							     __Tracesholiday_new_war_order530}}
							       when
								 __Levelholiday_new_war_order530
								   band 8
								   /= 0
								   orelse
								   __Tracesholiday_new_war_order530
								     /= [] ->
							       lager:do_log(error,
									    [{module,
									      holiday_new_war_order},
									     {function,
									      reissue_award},
									     {line,
									      530},
									     {pid,
									      pid_to_list(self())},
									     {node,
									      node()}
									     | lager:md()],
									    io_lib:format("【~w】无法领取新版战令补发奖励~w",
											  [Role#role.name,
											   ExpItem]),
									    none,
									    4096,
									    8,
									    __Levelholiday_new_war_order530,
									    __Tracesholiday_new_war_order530,
									    lager_event,
									    __Pidholiday_new_war_order530);
							   _ -> ok
							 end,
							 NRole;
						     {ok, NRoleT} ->
							 log:log_gain(Gain,
								      Role,
								      NRoleT,
								      <<"运营活动_新版战令"/utf8>>,
								      util:fbin("领取跨日补发奖励 ~w ~w",
										[Period,
										 PeriodDay])),
							 NRoleT
						   end,
    {NewRole#role{m_new_war_order =
		      MWarOrder#m_new_war_order{quest_list = RestQuestList}},
     OverdueQL};
reissue_award(Role = #role{m_new_war_order =
			       #m_new_war_order{period = Period,
						period_day = PeriodDay,
						period_lev = PLev,
						quest_list = QuestList,
						lev_reward = LevReward,
						rmb_status = RmbStatus}},
	      1) ->
    ExpItemId =
	holiday_new_war_order_data:get_exp_item(Period),
    GrowFun = fun (#quest{id = QuestId, finish = 1},
		   {AccMailItem, AccExpItem}) ->
		      AwardList = case
				    holiday_new_war_order_data:get_reward(QuestId)
				      of
				    List when is_list(List) -> List;
				    _ -> []
				  end,
		      {ExpAward, MailAward} = lists:partition(fun ({ItemId,
								    _}) ->
								      ItemId =:=
									ExpItemId
							      end,
							      AwardList),
		      NewAccItem = item_lib:merge(MailAward, AccMailItem),
		      NewExpItem = item_lib:merge(ExpAward, AccExpItem),
		      {NewAccItem, NewExpItem};
		  (_, DataT) -> DataT
	      end,
    {MailItem, ExpItem} = lists:foldl(GrowFun, {[], []},
				      QuestList),
    Gain = format:val_to_gain(ExpItem,
			      holiday_new_war_order),
    NRole = case role_gain:do(Role, Gain) of
	      {false, _} ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_new_war_order557, _,
		     {__Levelholiday_new_war_order557,
		      __Tracesholiday_new_war_order557}}
			when __Levelholiday_new_war_order557 band 8 /= 0 orelse
			       __Tracesholiday_new_war_order557 /= [] ->
			lager:do_log(error,
				     [{module, holiday_new_war_order},
				      {function, reissue_award}, {line, 557},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("【~w】无法领取新版战令补发奖励~w",
						   [Role#role.name, ExpItem]),
				     none, 4096, 8,
				     __Levelholiday_new_war_order557,
				     __Tracesholiday_new_war_order557,
				     lager_event,
				     __Pidholiday_new_war_order557);
		    _ -> ok
		  end,
		  Role;
	      {ok, NRoleT} ->
		  log:log_gain(Gain, Role, NRoleT, <<"运营活动_新版战令"/utf8>>,
			       util:fbin("领取战令补发经验奖励 ~w ~w",
					 [Period, PeriodDay])),
		  NRoleT
	    end,
    {NewLev, _} = calc_lev(NRole),
    CanGetLevReward = [LevCfg
		       || LevCfg
			      <- holiday_new_war_order_data:lev_reward_list(Period),
			  NewLev >= LevCfg],
    Fun = fun (LevT, {AllRewardT, LevRewardT}) ->
		  RewardT =
		      holiday_new_war_order_data:get_lev_reward({Period, LevT,
								 PLev}),
		  RmbRewardT =
		      holiday_new_war_order_data:get_rmb_lev_reward({Period,
								     LevT,
								     PLev}),
		  case lists:keyfind(LevT, 1, LevRewardT) of
		    false ->
			case RmbStatus == 1 of
			  true ->
			      Reward1 = item_lib:merge(RewardT, RmbRewardT),
			      NAllRewardT = item_lib:merge(Reward1, AllRewardT),
			      NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
							   {LevT, 1, 1}),
			      {NAllRewardT, NLevRewardT};
			  _ ->
			      NAllRewardT = item_lib:merge(RewardT, AllRewardT),
			      NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
							   {LevT, 1, 0}),
			      {NAllRewardT, NLevRewardT}
			end;
		    {_, 1, 0} when RmbStatus == 1 ->
			NAllRewardT = item_lib:merge(RmbRewardT, AllRewardT),
			NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
						     {LevT, 1, 1}),
			{NAllRewardT, NLevRewardT};
		    _ -> {AllRewardT, LevRewardT}
		  end
	  end,
    {AllReward, _} = lists:foldl(Fun, {[], LevReward},
				 CanGetLevReward),
    NewMailItem = item_lib:merge(AllReward, MailItem),
    NewRole0 = #role{m_new_war_order = MWarOrder} = case
						      NewMailItem
							of
						      [_ | _] ->
							  {Assets, Items} =
							      format:split_assets_items(NewMailItem),
							  PeriodName =
							      holiday_new_war_order_data:period_name(Period),
							  {ok, RoleT} =
							      mail:add(NRole,
								       {util:fbin("~ts奖励补发",
										  [PeriodName]),
									util:fbin("亲爱的冒险者大人, 以下是您~ts活动中未领取的奖励，请查收",
										  [PeriodName]),
									Assets,
									Items,
									lang:get(<<"战令活动"/utf8>>),
									86400 +
									  date:unixtime()}),
							  RoleT;
						      _ -> NRole
						    end,
    NewRole = del_holiday_assets(NewRole0, ExpItemId),
    {NewRole#role{m_new_war_order =
		      MWarOrder#m_new_war_order{quest_list = [],
						lev_reward = [], rmb_status = 0,
						card = []}},
     QuestList}.

del_holiday_assets(Role = #role{holiday_assets =
				    HolidayAssets},
		   ExpItemId) ->
    NewHolidayAssets = lists:keydelete(ExpItemId, 1,
				       HolidayAssets),
    Role#role{holiday_assets = NewHolidayAssets}.

-spec del_quest([#quest{}], #role{}) -> {[#quest{}],
					 #role{}}.

del_quest([], Role) -> Role;
del_quest([#quest{progress = Progress} | Other],
	  Role) ->
    Tids = [Tid
	    || #quest_progress{finish = 0, trigger = Tid}
		   <- Progress,
	       is_tuple(Tid)],
    NewRole = role_trigger:del(Tids, Role),
    del_quest(Other, NewRole).

check_new_quest(Role = #role{m_new_war_order =
				 #m_new_war_order{period = Period,
						  period_day = PeriodDay,
						  day_lev = DayLev,
						  week_lev = WeekLev}},
		StartTime) ->
    WeekQuestList = [W
		     || W = #new_war_order_data{min_day = MinDay,
						max_day = MaxDay,
						min_lev = MinLev,
						max_lev = MaxLev}
			    <- holiday_new_war_order_data:week_quest_list(Period),
			PeriodDay >= MinDay, PeriodDay =< MaxDay,
			WeekLev >= MinLev, WeekLev =< MaxLev],
    DayQuestList = [W
		    || W = #new_war_order_data{min_lev = MinLev,
					       max_lev = MaxLev}
			   <- holiday_new_war_order_data:day_quest_list({Period,
									 PeriodDay}),
		       DayLev >= MinLev, DayLev =< MaxLev],
    case DayQuestList ++ WeekQuestList of
      QuestL = [_ | _] ->
	  do_check_new_quest(QuestL, StartTime, Role);
      _ -> Role
    end.

do_check_new_quest([], _, Role) -> Role;
do_check_new_quest([#new_war_order_data{quest_type =
					    QuestType,
					day = Day, max_day = WeekMaxDay,
					goal_id = Id, progress = Progress}
		    | T],
		   StartTime,
		   Role = #role{m_new_war_order =
				    MWarOrder = #m_new_war_order{end_time =
								     EndTime,
								 quest_list =
								     QuestList}}) ->
    case lists:keymember(Id, #quest.id, QuestList) of
      true -> do_check_new_quest(T, StartTime, Role);
      _ ->
	  Progress1 = quest_prog_init:do(Role, Progress, Id),
	  Finish = case [false
			 || #quest_progress{finish = 0} <- Progress1]
		       of
		     [] -> 1;
		     _ -> 0
		   end,
	  QuestEndTimeT = if QuestType == 7 ->
				 StartTime + 86400 * Day - 1;
			     QuestType == 8 ->
				 StartTime + 86400 * WeekMaxDay - 1;
			     true -> EndTime
			  end,
	  QuestEndTime = min(QuestEndTimeT, EndTime),
	  {NewProgress, Role1} = quest:load_progress(Progress1,
						     holiday_new_war_order, Id,
						     [], Role),
	  NewQuest = #quest{id = Id, finish = Finish,
			    progress = NewProgress, type = QuestType,
			    end_time = QuestEndTime},
	  NewQuestList = [NewQuest | QuestList],
	  NRole = Role1#role{m_new_war_order =
				 MWarOrder#m_new_war_order{quest_list =
							       NewQuestList}},
	  do_check_new_quest(T, StartTime, NRole)
    end.

calc_lev(#role{holiday_assets = HolidayAssets,
	       m_new_war_order =
		   #m_new_war_order{period = Period,
				    period_lev = PLev}}) ->
    ItemId =
	holiday_new_war_order_data:get_exp_item(Period),
    case lists:keyfind(ItemId, 1, HolidayAssets) of
      {_, Exp} ->
	  Lev = case holiday_new_war_order_data:get_lev({Period,
							 Exp, PLev})
		    of
		  LevT when is_integer(LevT) -> LevT;
		  _ -> 0
		end,
	  {Lev, Exp};
      _ ->
	  Lev = case holiday_new_war_order_data:get_lev({Period,
							 0, PLev})
		    of
		  LevT when is_integer(LevT) -> LevT;
		  _ -> 0
		end,
	  {Lev, 0}
    end.

set_activity_status(Period, Status, Args) ->
    case holiday_new_war_order_data:get_icon(Period) of
      Icon when is_integer(Icon) ->
	  activity_self:set_activity(Icon, Status, Args);
      _ -> skip
    end.

-spec is_charge_new_war_order(#role{},
			      pos_integer()) -> boolean().

is_charge_new_war_order(#role{m_new_war_order =
				  #m_new_war_order{period = Period,
						   card = CardL}},
			ChargeId) ->
    case holiday_new_war_order_data:charge({Period,
					    ChargeId})
	of
      CardId when is_integer(CardId) ->
	  case Period =:= 0 of
	    false ->
		case lists:keyfind(CardId, 1, CardL) of
		  false -> true;
		  _ -> false
		end;
	    _ -> false
	  end;
      _ -> true
    end.


