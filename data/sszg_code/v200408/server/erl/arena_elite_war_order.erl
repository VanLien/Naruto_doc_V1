-file("data/arena_elite_war_order.erl", 1).

-file("arena_elite_war_order.erl", 1).

-module(arena_elite_war_order).

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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{m_arena_elite_war_order,
		 [ver, period, period_day, end_time, win_count,
		  rmb_status, card, lev_reward, start_time, ext]},
		{arena_replay_partner, [pos, bid, lev, star, ext]},
		{arena_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_elite_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_elite_lev, def_id, def_name, def_face, def_lev,
		  def_rank, def_elite_lev, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_elite_log, [id, list]},
		{arena_elite_rank,
		 [ver, rank, id, name, power, lev, face, look_id, score,
		  elite_lev, time, avatar_id, face_update_time,
		  face_file]},
		{arena_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, dower_skill,
		  set_skill, attr, extra]},
		{arena_elite_rival_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  extra]},
		{c_e_role,
		 [ver, id, name, power, lev, face, look_id, score,
		  elite_lev, avatar_id, is_king, match_power, all_star,
		  win_rio, zid, face_update_time, face_file]},
		{arena_elite_role,
		 [ver, id, name, lev, sex, gid, gname, face, power,
		  look_id, score, elite_lev, time, avatar_id, is_king,
		  defense, manifesto, face_update_time, face_file,
		  break_groups]},
		{c_elite_srv_info,
		 [type, sid, num, world_lev, open_time, merge_srvs]},
		{m_arena_elite_defens, [type, formations]},
		{m_arena_elite_log,
		 [ver, period, max_lev, max_score, combat_win_count1,
		  combat_all_count1, combat_win_count2, combat_all_count2,
		  max_dps, mvp_info, winning_streak, winning_streak_now,
		  beast_rivl_info, extra, log_zone_id, log_rank]},
		{arena_elite_role_best,
		 [id, name, lev, sex, gid, gname, face, power, look_id,
		  score, elite_lev, time, avatar_id, is_king, extra,
		  face_update_time, face_file]},
		{m_arena_elite,
		 [ver, lev, init_lev, period, score, day_combat_count,
		  day_buy_count, frist_ref_time, ref_count, match_cd_time,
		  had_combat_num, acc_combat_num, lev_reward,
		  last_combat_id, promoted_info, rival_info, defens,
		  old_rank, day_point_count, log, extra, last_reset_time,
		  max_day_buy_count, is_skip]},
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

-export([zero_flush/1, init/0, login/1,
	 init_war_order/1, apply_timer/1, add_win_count/1,
	 push_base/1, take_lev_reward/2, fire/2,
	 is_charge_arena_elite_war_order/2]).

-file("/sszg_code/server/inc/common.hrl", 1).

-file("/sszg_code/server/inc/lib_log.hrl", 1).

-file("/sszg_code/server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("arena_elite_war_order.erl", 21).

-file("/sszg_code/server/inc/role.hrl", 1).

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

-file("arena_elite_war_order.erl", 22).

-file("/sszg_code/server/inc/arena_elite.hrl", 1).

-record(m_arena_elite,
	{ver = 6, lev = 1, init_lev = 1, period = 0, score = 0,
	 day_combat_count = 0, day_buy_count = 0,
	 frist_ref_time = 0, ref_count = 0, match_cd_time = 0,
	 had_combat_num = 0, acc_combat_num = 0, lev_reward = [],
	 last_combat_id = {0, <<>>}, promoted_info = [],
	 rival_info = [], defens = [], old_rank = [],
	 day_point_count = [], log = [], extra = [],
	 last_reset_time = 0, max_day_buy_count = 0,
	 is_skip = 0}).

-record(arena_elite_role_best,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = [],
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, extra = [],
	 face_update_time = 0, face_file = <<>>}).

-record(m_arena_elite_log,
	{ver = 2, period = 0, max_lev = 1, max_score = 1000,
	 combat_win_count1 = 0, combat_all_count1 = 0,
	 combat_win_count2 = 0, combat_all_count2 = 0,
	 max_dps = 0, mvp_info = [], winning_streak = 0,
	 winning_streak_now = 0,
	 beast_rivl_info = #arena_elite_role_best{}, extra = [],
	 log_zone_id = 0, log_rank = 0}).

-record(m_arena_elite_defens,
	{type = 1, formations = []}).

-record(c_elite_srv_info,
	{type = 1, sid = <<>>, num = 0, world_lev = 0,
	 open_time = 0, merge_srvs = []}).

-record(arena_elite_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, defense = [],
	 manifesto = [], face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(c_e_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, power = 0,
	 lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, avatar_id = 0, is_king = 0,
	 match_power = 1, all_star = 1, win_rio = 1, zid = 1,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_elite_rival_defense,
	{order, formation_type, hallows_id, hallows_lev,
	 hallows_skill_lev, partner_infos, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = []}).

-record(arena_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(arena_elite_rank,
	{ver = 2, rank = 0, id = {0, <<>>}, name = <<>>,
	 power = 0, lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, time = 0, avatar_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(role_arena_elite_log,
	{id = {0, <<>>}, list = []}).

-record(arena_elite_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0,
	 atk_elite_lev = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_face = 0, def_lev = 0, def_rank = 0,
	 def_elite_lev = 0, ret = 1, win_count = 0,
	 lose_count = 0, combat_type = 0, replay_list = [],
	 time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(m_arena_elite_war_order,
	{ver = 2, period = 0, period_day = 0, end_time = 0,
	 win_count = 0, rmb_status = 0, card = [],
	 lev_reward = [], start_time = 0, ext = []}).

-file("arena_elite_war_order.erl", 23).

-file("/sszg_code/server/inc/gain.hrl", 1).

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

-file("arena_elite_war_order.erl", 24).

-file("/sszg_code/server/inc/timer.hrl", 1).

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

-file("arena_elite_war_order.erl", 25).

-file("/sszg_code/server/inc/var.hrl", 1).

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

-file("arena_elite_war_order.erl", 26).

reissue(Role = #role{id = RoleId, name = Name,
		     m_arena_elite_war_order =
			 WarOrder = #m_arena_elite_war_order{period = OldPeriod,
							     rmb_status =
								 OldRmbStatus,
							     win_count =
								 OldWinCount}}) ->
    case var:get_var(Role, other, 3116, 0) of
      0 ->
	  case OldRmbStatus of
	    1 when OldPeriod =/= 0 ->
		NRole = var:set_var(Role, other, 3116, 1),
		BuyGet =
		    arena_elite_war_order_data:get_buy_get(OldPeriod),
		NewWinCount = OldWinCount + BuyGet,
		NRole1 = NRole#role{m_arena_elite_war_order =
					WarOrder#m_arena_elite_war_order{win_count
									     =
									     NewWinCount}},
		{ok, NRole2} = mail:add(NRole1,
					{util:fbin("王者之证赠送邮件", []),
					 util:fbin("亲爱的冒险者大人，由于超凡段位赛王者之证进阶卡规则调整，您已激活进阶卡，系统为您新增激活4"
						   "阶奖励，请前往超凡段位赛玩法王者之证领取，祝游戏愉快",
						   []),
					 [], [], <<"王者之证赠送邮件"/utf8>>,
					 86400 + date:unixtime()}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_elite_war_order38, _,
		   {__Levelarena_elite_war_order38,
		    __Tracesarena_elite_war_order38}}
		      when __Levelarena_elite_war_order38 band 64 /= 0 orelse
			     __Tracesarena_elite_war_order38 /= [] ->
		      lager:do_log(info,
				   [{module, arena_elite_war_order},
				    {function, reissue}, {line, 38},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~w，Name:~ts执行了段位赛战令胜场数增加",
						 [RoleId, Name]),
				   none, 4096, 64,
				   __Levelarena_elite_war_order38,
				   __Tracesarena_elite_war_order38, lager_event,
				   __Pidarena_elite_war_order38);
		  _ -> ok
		end,
		{ok, NRole2};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_elite_war_order41, _,
		   {__Levelarena_elite_war_order41,
		    __Tracesarena_elite_war_order41}}
		      when __Levelarena_elite_war_order41 band 64 /= 0 orelse
			     __Tracesarena_elite_war_order41 /= [] ->
		      lager:do_log(info,
				   [{module, arena_elite_war_order},
				    {function, reissue}, {line, 41},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家Name:~ts不执行段位赛战令胜场数增加",
						 [Name]),
				   none, 4096, 64,
				   __Levelarena_elite_war_order41,
				   __Tracesarena_elite_war_order41, lager_event,
				   __Pidarena_elite_war_order41);
		  _ -> ok
		end,
		NRole1 = var:set_var(Role, other, 3116, 2),
		{ok, NRole1}
	  end;
      _ -> {ok, Role}
    end.

init() -> #m_arena_elite_war_order{}.

init_war_order(Role = #role{m_arena_elite_war_order =
				WarOrder = #m_arena_elite_war_order{period =
									Period}}) ->
    NewRole = case Period =:= 0 of
		true ->
		    PeriodDay =
			arena_elite_war_order_data:get_period_day(2),
		    Now = date:unixtime(),
		    EndTime = Now + date:now_diff(PeriodDay, {0, 0, 0}),
		    NRole = Role#role{m_arena_elite_war_order =
					  WarOrder#m_arena_elite_war_order{start_time
									       =
									       Now,
									   period
									       =
									       2,
									   period_day
									       =
									       1,
									   end_time
									       =
									       EndTime,
									   win_count
									       =
									       0,
									   rmb_status
									       =
									       0,
									   card
									       =
									       [],
									   lev_reward
									       =
									       []}},
		    Timer1 = #timer{id = arena_elite_war_order_point,
				    timeout = 2 * 1000, times = 1,
				    m = arena_elite_war_order, f = apply_timer,
				    a = []},
		    NRole1 = role_timer:set(Timer1, NRole),
		    NRole1;
		_ -> Role
	      end,
    NewRole.

apply_timer(Role) ->
    sys_conn:pack_send(24954, {1}), {ok, Role}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role0 = #role{m_arena_elite_war_order =
			#m_arena_elite_war_order{period = Period}}) ->
    {ok, Role} = reissue(Role0),
    NewRole = case Period =:= 0 of
		true ->
		    case arena_elite_lib:check_open(Role) of
		      {false, _Msg} -> Role;
		      _ -> init_war_order(Role)
		    end;
		_ -> Role
	      end,
    {ok, NewRole}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_arena_elite_war_order =
			    #m_arena_elite_war_order{period = 0}}) ->
    NewRole = case arena_elite_lib:check_open(Role) of
		{false, _Msg} -> Role;
		_ -> init_war_order(Role)
	      end,
    {ok, NewRole};
zero_flush(Role = #role{m_arena_elite_war_order =
			    WarOrder = #m_arena_elite_war_order{start_time =
								    StartTime,
								period =
								    Period}}) ->
    MaxPeriodDay =
	arena_elite_war_order_data:get_period_day(Period),
    MaxPeriod = arena_elite_war_order_data:max_period(),
    Now = date:unixtime(),
    NewPeriodDay = date:day_diff(StartTime, Now) + 1,
    NewRole = case NewPeriodDay > MaxPeriodDay of
		false ->
		    Role#role{m_arena_elite_war_order =
				  WarOrder#m_arena_elite_war_order{period_day =
								       NewPeriodDay}};
		_ ->
		    NRole = #role{m_arena_elite_war_order = NewWarOrder} =
				award_mail(Role),
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
		    NewPeriod = min(Period + CrossPeriod, MaxPeriod),
		    NewMaxPeriodDay =
			arena_elite_war_order_data:get_period_day(NewPeriod),
		    NewEndTime = NewStartTime + 86400 * NewMaxPeriodDay - 1,
		    NRole1 = NRole#role{m_arena_elite_war_order =
					    NewWarOrder#m_arena_elite_war_order{period
										    =
										    NewPeriod,
										start_time
										    =
										    NewStartTime,
										period_day
										    =
										    NewPeriodDay2,
										end_time
										    =
										    NewEndTime,
										win_count
										    =
										    0,
										rmb_status
										    =
										    0,
										card
										    =
										    [],
										lev_reward
										    =
										    []}},
		    Timer1 = #timer{id = arena_elite_war_order_point,
				    timeout = 2 * 1000, times = 1,
				    m = arena_elite_war_order, f = apply_timer,
				    a = []},
		    NRole2 = role_timer:set(Timer1, NRole1),
		    NRole2
	      end,
    {ok, NewRole}.

award_mail(Role = #role{m_arena_elite_war_order =
			    WarOrder = #m_arena_elite_war_order{win_count =
								    WinCount,
								lev_reward =
								    LevReward,
								period = Period,
								rmb_status =
								    RmbStatus}}) ->
    Lev = arena_elite_war_order_data:get_lev({Period,
					      WinCount}),
    case arena_elite_war_order_data:lev_reward_list(Period)
	of
      LevRewardCfg = [_ | _] ->
	  CanGetLevReward = [LevCfg
			     || LevCfg <- LevRewardCfg, Lev >= LevCfg],
	  Fun = fun (LevT, {AllRewardT, LevRewardT}) ->
			RewardT =
			    arena_elite_war_order_data:get_lev_reward({Period,
								       LevT}),
			RmbRewardT =
			    arena_elite_war_order_data:get_rmb_lev_reward({Period,
									   LevT}),
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
	    true -> Role;
	    _ ->
		{Assets, Items} = format:split_assets_items(AllReward),
		{ok, NRole} = mail:add(Role,
				       {util:fbin(lang:get(<<"Phát hành lại phần thưởng chứng nhận "
							     "của King"/utf8>>),
						  []),
					color:msg(lang:get(<<"Kính gửi Quý Nhẫn Giả: \nĐây là phần "
							     "thưởng mà bạn không nhận được trong "
							     "sự kiện ~ts vừa qua, vui lòng kiểm tra "
							     "nó.！"/utf8>>),
						  [{green,
						    lang:get(<<"Bằng chứng của nhà vua"/utf8>>)}]),
					Assets, Items,
					<<"Phát hành lại phần thưởng chứng nhận "
					  "của King"/utf8>>,
					86400 + date:unixtime()}),
		NewRole = NRole#role{m_arena_elite_war_order =
					 WarOrder#m_arena_elite_war_order{lev_reward
									      =
									      NewLevReward}},
		NewRole
	  end;
      _ -> Role
    end.

-spec push_base(#role{}) -> ok.

push_base(#role{m_arena_elite_war_order =
		    #m_arena_elite_war_order{period = Period,
					     period_day = PeriodDay,
					     end_time = EndTime,
					     win_count = WinCount,
					     rmb_status = RmbStatus,
					     lev_reward = LevReward}}) ->
    Lev = arena_elite_war_order_data:get_lev({Period,
					      WinCount}),
    sys_conn:pack_send(24952,
		       {Period, PeriodDay, EndTime, Lev, RmbStatus, WinCount,
			LevReward}),
    ok.

-spec take_lev_reward(#role{}, pos_integer()) -> {ok,
						  #role{}} |
						 {false, bitstring()}.

take_lev_reward(Role = #role{m_arena_elite_war_order =
				 WarOrder = #m_arena_elite_war_order{win_count =
									 WinCount,
								     lev_reward
									 =
									 LevReward,
								     period =
									 Period,
								     rmb_status
									 =
									 RmbStatus}},
		0) ->
    Lev = arena_elite_war_order_data:get_lev({Period,
					      WinCount}),
    case arena_elite_war_order_data:lev_reward_list(Period)
	of
      LevRewardCfg = [_ | _] ->
	  CanGetLevReward = [LevCfg
			     || LevCfg <- LevRewardCfg, Lev >= LevCfg],
	  Fun = fun (LevT, {AllRewardT, LevRewardT}) ->
			RewardT =
			    arena_elite_war_order_data:get_lev_reward({Period,
								       LevT}),
			RmbRewardT =
			    arena_elite_war_order_data:get_rmb_lev_reward({Period,
									   LevT}),
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
	    true ->
		{false,
		 lang:get(<<"Không có phần thưởng để yêu cầu"/utf8>>)};
	    _ ->
		GL = format:val_to_gain(AllReward,
					arena_elite_war_order),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, NRole} ->
		      log:log_gain(GL, Role, NRole, <<"段位赛战令"/utf8>>,
				   util:fbin("一键领取，等级~w，特权：~w，领取前~w",
					     [Lev, RmbStatus, LevReward])),
		      NewRole = NRole#role{m_arena_elite_war_order =
					       WarOrder#m_arena_elite_war_order{lev_reward
										    =
										    NewLevReward}},
		      push_base(NewRole),
		      {ok, NewRole}
		end
	  end;
      _ -> {false, lang:get(<<"Hiện không hoạt động"/utf8>>)}
    end;
take_lev_reward(Role, _) -> {ok, Role}.

-spec fire(#role{}, map()) -> {ok, #role{}}.

fire(Role = #role{name = Name,
		  m_arena_elite_war_order =
		      WarOrder = #m_arena_elite_war_order{period = Period,
							  card = CardL,
							  win_count =
							      OldWinCount}},
     Opt = #{sn := Sn, package_id := PackageId,
	     money := Money}) ->
    case arena_elite_war_order_data:charge({Period,
					    PackageId})
	of
      CardId when is_integer(CardId) ->
	  case lists:keyfind(CardId, 1, CardL) of
	    false ->
		BuyGet = arena_elite_war_order_data:get_buy_get(Period),
		Reward =
		    arena_elite_war_order_data:get_card_award({Period,
							       CardId}),
		Gain = format:val_to_gain(Reward,
					  arena_elite_war_order),
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
			{__Pidarena_elite_war_order253, _,
			 {__Levelarena_elite_war_order253,
			  __Tracesarena_elite_war_order253}}
			    when __Levelarena_elite_war_order253 band 8 /= 0
				   orelse
				   __Tracesarena_elite_war_order253 /= [] ->
			    lager:do_log(error,
					 [{module, arena_elite_war_order},
					  {function, fire}, {line, 253},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w购买段位赛战令礼包~w失败",
						       [Role#role.name,
							CardId]),
					 none, 4096, 8,
					 __Levelarena_elite_war_order253,
					 __Tracesarena_elite_war_order253,
					 lager_event,
					 __Pidarena_elite_war_order253);
			_ -> ok
		      end,
		      {ok, Role};
		  {ok, Role1} ->
		      NewCardL = lists:keystore(CardId, 1, CardL,
						{CardId, 1}),
		      NewWinCount = OldWinCount + BuyGet,
		      NewRole = Role1#role{m_arena_elite_war_order =
					       WarOrder#m_arena_elite_war_order{card
										    =
										    NewCardL,
										rmb_status
										    =
										    1,
										win_count
										    =
										    NewWinCount}},
		      log:log_gain(Gain, Role, NewRole, <<"段位赛战令"/utf8>>,
				   util:fbin("段位赛战令进阶卡:~w", [CardId])),
		      notice:broadcast(rumor_left_top,
				       color:msg(lang:get(<<"Xin chúc mừng~những người chơi đã kích "
							    "hoạt~các phần thưởng nâng cao, Adventure "
							    "Continent bổ sung thêm một chiến binh "
							    "phiêu lưu khác！"/utf8>>),
						 [{role, Name},
						  arena_elite_war_order_data:period_name(Period)])),
		      push_base(NewRole),
		      {ok, NewRole}
		end;
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"段位赛战令"/utf8>>,
			       util:fbin("段位赛战令充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

-spec add_win_count(#role{}) -> #role{}.

add_win_count(Role = #role{m_arena_elite_war_order =
			       WarOrder = #m_arena_elite_war_order{win_count =
								       WinCount}}) ->
    NewWinCount = WinCount + 1,
    NewRole = Role#role{m_arena_elite_war_order =
			    WarOrder#m_arena_elite_war_order{win_count =
								 NewWinCount}},
    push_base(NewRole),
    NewRole.

-spec is_charge_arena_elite_war_order(#role{},
				      pos_integer()) -> boolean().

is_charge_arena_elite_war_order(#role{m_arena_elite_war_order
					  =
					  #m_arena_elite_war_order{period =
								       Period,
								   card =
								       CardL}},
				ChargeId) ->
    case arena_elite_war_order_data:charge({Period,
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


