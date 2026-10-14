-file("data/guild_marketplace_lib.erl", 1).

-file("src/mod/guild_marketplace/guild_marketplace_l"
      "ib.erl",
      1).

-module(guild_marketplace_lib).

-lager_records([{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{guild_marketplace,
		 [ver, id, next_booth_id, item_list, board_list]},
		{market_board,
		 [ver, type, name, operation, reward_list, unixtime]},
		{market_item,
		 [ver, id, base_id, num, attr, extra, holy_eqm_attr,
		  end_time, score]},
		{g_mem_red_packet,
		 [id, rid, name, face_id, avatar_bid, post, type, num,
		  max_num, val, max_val, list, mems, start_time, end_time,
		  msg_id, face_update_time, face_file]},
		{guild_data, [lev, exp, num, maintain]},
		{guild_position, [id, name, limit]},
		{g_merge,
		 [gid, gname, gid2, gname2, role_id, rname, end_time,
		  gold]},
		{guild_rank,
		 [id, name, lev, exp, leader_name, leader_id,
		  leader_face, leader_lev, members_num, members_max,
		  apply_lev, apply_type, create_time, power, index,
		  leader_avatar_bid, leader_look_id,
		  leader_face_update_time, leader_face_file,
		  apply_power]},
		{guild_apply,
		 [gid, id, pid, name, face, lev, power, post, vip_lev,
		  online, apply_time, face_update_time, face_file]},
		{guild_member,
		 [ver, id, pid, name, face, lev, sex, power, post,
		  vip_lev, online, join_time, login_time, donate,
		  day_donate, avatar_bid, red_packet_num,
		  red_packet_price, red_packet_time, red_packet_recv_num,
		  red_packet_recv_time, active_lev, day_donate_type,
		  day_donate_time, day_dun_time, day_war_time, look_id,
		  face_update_time, face_file]},
		{guild_war_box,
		 [order, rid, sid, name, item_id, item_num]},
		{guild_cache, []},
		{guild,
		 [ver, id, name, lev, exp, day_exp, pid, leader_name,
		  leader_id, members, members_num, members_max, next_id,
		  sign, apply_lev, apply_type, recruit_num, cache, sync,
		  create_time, power, rename_time, lock_time, donate_exp,
		  red_packet, guild_war_box_end_time, guild_war_relust,
		  guild_war_box, guild_war_sign, day_var,
		  vice_leader_mail, normal_mail, vitality, apply_power]},
		{guild_bag,
		 [ver, id, pid, name, post, lev, join_time, quit_time,
		  send_time, send_num, recv_num, true_quit_time,
		  quit_post]},
		{guild_log_info,
		 [id, guild_id, type, time, role_id, role_name, msg]},
		{guild_log, [key, list]},
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

-export([push/2, sell_market/4, buy_market/3,
	 screen_item/2]).

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

-file("src/mod/guild_marketplace/guild_marketplace_l"
      "ib.erl",
      14).

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

-file("src/mod/guild_marketplace/guild_marketplace_l"
      "ib.erl",
      15).

-file("inc/guild.hrl", 1).

-record(guild_log, {key = {0, <<>>}, list = []}).

-record(guild_log_info,
	{id = 0, guild_id = {0, <<>>}, type = 0, time = 0,
	 role_id = {0, <<>>}, role_name = 0, msg = <<>>}).

-record(guild_bag,
	{ver = 2, id = {0, <<>>}, pid, name = <<>>, post = 0,
	 lev = 0, join_time = 0, quit_time = 0, send_time = 0,
	 send_num = 0, recv_num = 0, true_quit_time = 0,
	 quit_post = 0}).

-record(guild,
	{ver = 7, id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 day_exp = 0, pid = 0, leader_name = <<>>,
	 leader_id = {0, <<>>}, members = [], members_num = 1,
	 members_max = 50, next_id = 1, sign = <<>>,
	 apply_lev = guild_data:get_const(guild_min_lev),
	 apply_type = 1, recruit_num = 0, cache, sync = 0,
	 create_time = 0, power = 0, rename_time = 0,
	 lock_time = 0, donate_exp = 0, red_packet = [],
	 guild_war_box_end_time = 0, guild_war_relust = 0,
	 guild_war_box = [], guild_war_sign = [], day_var = [],
	 vice_leader_mail = 0, normal_mail = 0, vitality = 0,
	 apply_power = 0}).

-record(guild_cache, {}).

-record(guild_war_box,
	{order = 0, rid = 0, sid = <<>>, name = <<>>,
	 item_id = 0, item_num = 0}).

-record(guild_member,
	{ver = 6, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, sex = 1, power = 0, post = 0,
	 vip_lev = 0, online = 1, join_time = 0, login_time = 0,
	 donate = 0, day_donate = 0, avatar_bid = 0,
	 red_packet_num = 0, red_packet_price = 0,
	 red_packet_time = 0, red_packet_recv_num = 0,
	 red_packet_recv_time = 0, active_lev = 0,
	 day_donate_type = 0, day_donate_time = 0,
	 day_dun_time = 0, day_war_time = 0, look_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(guild_apply,
	{gid = {0, <<>>}, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, power = 0, post = 0, vip_lev = 0,
	 online = 1, apply_time = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(guild_rank,
	{id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 leader_name = <<>>, leader_id = {0, <<>>},
	 leader_face = 0, leader_lev = 0, members_num = 1,
	 members_max = 50, apply_lev = 0, apply_type = 1,
	 create_time = 0, power = 0, index = 0,
	 leader_avatar_bid = 0, leader_look_id = 0,
	 leader_face_update_time = 0, leader_face_file = <<>>,
	 apply_power = 0}).

-record(g_merge,
	{gid = {0, <<>>}, gname = <<>>, gid2 = {0, <<>>},
	 gname2 = <<>>, role_id = {0, <<>>}, rname = <<>>,
	 end_time = 0, gold = 0}).

-record(guild_position,
	{id = 0, name = <<>>, limit = []}).

-record(guild_data,
	{lev = 0, exp = 0, num = 0, maintain = 0}).

-record(g_mem_red_packet,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, name = <<>>,
	 face_id = 0, avatar_bid = 0, post = <<>>, type = 0,
	 num = 0, max_num = 0, val = 0, max_val = 0, list = [],
	 mems = [], start_time = 0, end_time = 0, msg_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/guild_marketplace/guild_marketplace_l"
      "ib.erl",
      16).

-file("inc/guild_marketplace.hrl", 1).

-record(market_item,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 base_id = 0  :: pos_integer(),
	 num = 0  :: pos_integer(), attr = []  :: list(),
	 extra = []  :: list(), holy_eqm_attr = []  :: list(),
	 end_time = []  :: list(), score = 0  :: pos_integer()}).

-record(market_board,
	{ver = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: bitstring(),
	 operation = 1  :: pos_integer(),
	 reward_list = []  :: list(),
	 unixtime = 0  :: pos_integer()}).

-record(guild_marketplace,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 next_booth_id = 1  :: pos_integer(),
	 item_list = []  :: list(), board_list = []  :: list()}).

-file("src/mod/guild_marketplace/guild_marketplace_l"
      "ib.erl",
      17).

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

-file("src/mod/guild_marketplace/guild_marketplace_l"
      "ib.erl",
      18).

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

-file("src/mod/guild_marketplace/guild_marketplace_l"
      "ib.erl",
      19).

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

-file("src/mod/guild_marketplace/guild_marketplace_l"
      "ib.erl",
      20).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/guild_marketplace/guild_marketplace_l"
      "ib.erl",
      21).

-spec push(pos_integer(), #role{}) -> ok.

push(26900,
     Role = #role{guild_bag = #guild_bag{id = Gid}}) ->
    DayLimit = var:get_var(Role, day, 112, []),
    case guild_marketplace:get_guild_marketplace(Gid) of
      #guild_marketplace{item_list = ItemList} ->
	  NewItemList = screen_item(ItemList, []),
	  role:pack_send(26900, {NewItemList, DayLimit});
      _ -> role:pack_send(26900, {[], DayLimit})
    end,
    ok;
push(26903, #role{guild_bag = #guild_bag{id = Gid}}) ->
    case guild_marketplace:get_guild_marketplace(Gid) of
      #guild_marketplace{board_list = BoardList} ->
	  role:pack_send(26903, {BoardList});
      _ -> role:pack_send(26903, {[]})
    end,
    ok;
push(_, _) -> ok.

-spec sell_market(pos_integer(), pos_integer(),
		  pos_integer(), #role{}) -> {ok, #role{}} |
					     {false, string()}.

sell_market(Id, Num, Storage,
	    Role = #role{name = Name}) ->
    case check_sell_cond(Id, Num, Storage, Role) of
      {ok, Item = #item{base_id = BaseId}, Gid, RadioNum} ->
	  case sell_loss_and_gain(Item, Num, Storage, RadioNum,
				  Role)
	      of
	    {ok, Role1, LogGainLoss} ->
		case put_into_market(Gid, Item, Num, Name) of
		  ok ->
		      Time = var:get_var(Role1, day, 107, 0),
		      NewRole = var:set_var(Role1, day, 107, Time + 1),
		      MaxTime =
			  guild_marketplace_data:get_const(guild_marketplace_sell_time),
		      LastTime = max(0, MaxTime - Time - 1),
		      notice:alert(util:fbin(lang:get(<<"Đặt thành công, thời gian đặt còn lại：~w"/utf8>>),
					     [LastTime])),
		      log:log_gain(LogGainLoss, Role, NewRole,
				   <<"公会宝库出售"/utf8>>,
				   util:fbin("出售商品id:~w 数量~w", [BaseId, Num])),
		      {ok, NewRole};
		  {false, Reason} -> {false, Reason};
		  _ ->
		      {false, lang:get(<<"Không bán được sản phẩm"/utf8>>)}
		end;
	    {false, Reason} -> {false, Reason};
	    _ ->
		{false, lang:get(<<"Không bán được sản phẩm"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason};
      _ ->
	  {false, lang:get(<<"Không bán được sản phẩm"/utf8>>)}
    end.

-spec buy_market(pos_integer(), pos_integer(),
		 #role{}) -> {ok, #role{}} | {false, string()}.

buy_market(Id, Num,
	   Role = #role{name = Name,
			guild_bag = #guild_bag{id = Gid, pid = Pid}})
    when is_pid(Pid) ->
    case check_market(Id, Num, Gid) of
      {ok, BaseId} when is_integer(BaseId) ->
	  case buy_loss(BaseId, Num, Role) of
	    {ok, LossRole, LogLoss, RadioNum} ->
		Gain = format:val_to_gain([{BaseId, Num}],
					  guild_marketplace),
		case role_gain:do_notice(LossRole, Gain) of
		  {ok, NewRole} ->
		      case do_market(Id, Num, Name, Gid) of
			ok ->
			    log:log_gain(Gain ++ LogLoss, Role, NewRole,
					 <<"公会宝库购买"/utf8>>,
					 util:fbin("购买奖品资产id:~w 数量~w",
						   [BaseId, Num])),
			    NewRole1 = add_day_buy(BaseId, RadioNum, NewRole),
			    {ok, NewRole1};
			{false, Reason} -> {false, Reason}
		      end;
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  _ ->
		      {false, lang:get(<<"Không thể mua sản phẩm này"/utf8>>)}
		end;
	    {false, Reason} -> {false, Reason}
	  end;
      {ok,
       #market_item{base_id = BaseId, attr = Attr,
		    extra = Extra, holy_eqm_attr = HolyEqmAttr,
		    score = Score}} ->
	  case buy_loss(BaseId, Num, Role) of
	    {ok, LossRole, LosLoss, RadioNum} ->
		case item:make(BaseId, 0, Num) of
		  {ok, [Item]} ->
		      NewItem = Item#item{extra = Extra, attr = Attr,
					  holy_eqm_attr = HolyEqmAttr,
					  score = Score},
		      Gain = #gain{label = items_to_bag, val = [NewItem],
				   flag = guild_marketplace},
		      case role_gain:do_notice(LossRole, [Gain]) of
			{ok, NewRole} ->
			    case do_market(Id, Num, Name, Gid) of
			      ok ->
				  log:log_gain([Gain] ++ LosLoss, Role, NewRole,
					       <<"公会宝库购买"/utf8>>,
					       util:fbin("购买奖品资产id:~w 数量~w",
							 [BaseId, Num])),
				  NewRole1 = add_day_buy(BaseId, RadioNum,
							 NewRole),
				  {ok, NewRole1};
			      {false, Reason} -> {false, Reason}
			    end;
			{false, #gain{msg = Msg}} -> {false, Msg};
			_ ->
			    {false,
			     lang:get(<<"Không thể mua sản phẩm này"/utf8>>)}
		      end;
		  _ ->
		      {false, lang:get(<<"Không thể mua sản phẩm này"/utf8>>)}
		end;
	    {false, Reason} -> {false, Reason}
	  end;
      {false, Reason} -> {false, Reason};
      _ ->
	  {false, lang:get(<<"Mua hàng không thành công"/utf8>>)}
    end;
buy_market(_, _, _) ->
    {false, lang:get(<<"Bạn không có hội nhóm"/utf8>>)}.

-spec screen_item(list(), list()) -> list().

screen_item([], OldItemList) -> OldItemList;
screen_item([Item = #market_item{end_time = EndTimeList,
				 attr = Attr}
	     | Rest],
	    OldItemList) ->
    NewEndTimeList = case lists:keysort(2, EndTimeList) of
		       [{Num, EndTime} | _] -> [{Num, EndTime}];
		       _ -> []
		     end,
    CliAttr = [{attr_data:atom_to_int(AttrType),
		util:uceil(Val * 1000)}
	       || {AttrType, Val} <- Attr],
    NewItem = Item#market_item{end_time = NewEndTimeList,
			       attr = CliAttr},
    screen_item(Rest, [NewItem | OldItemList]);
screen_item(_, OldItemList) -> OldItemList.

check_sell_cond(Id, Num, Storage, Role) ->
    do_check([id, item, market, time, day_time, guild,
	      radio],
	     Role, #{id => Id, num => Num, storage => Storage}).

do_check([], _,
	 #{item := Item, gid := Gid, radio_num := RadioNum}) ->
    {ok, Item, Gid, RadioNum};
do_check([id | Rest], Role = #role{p_bag = Bag},
	 Args = #{id := Id, num := Num, storage := 1}) ->
    case package:find(by_id, Id, Bag) of
      false ->
	  {false,
	   lang:get(<<"Mục này không tồn tại và không thể sử "
		      "dụng được."/utf8>>)};
      {ok, #item{quantity = Q}} when Q < Num ->
	  {false,
	   lang:get(<<"Số lượng sản phẩm không đủ, không thể "
		      "sử dụng"/utf8>>)};
      {ok, Item = #item{}} ->
	  do_check(Rest, Role, Args#{item => Item})
    end;
do_check([id | Rest], Role = #role{p_eqm = Bag},
	 Args = #{id := Id, num := Num, storage := 3}) ->
    case package:find(by_id, Id, Bag) of
      false ->
	  {false,
	   lang:get(<<"Mục này không tồn tại và không thể sử "
		      "dụng được."/utf8>>)};
      {ok, #item{quantity = Q}} when Q < Num ->
	  {false,
	   lang:get(<<"Số lượng sản phẩm không đủ, không thể "
		      "sử dụng"/utf8>>)};
      {ok, Item = #item{}} ->
	  do_check(Rest, Role, Args#{item => Item})
    end;
do_check([item | Rest], Role,
	 Args = #{item := #item{base_id = BaseId}}) ->
    case item_data:get(BaseId) of
      #item_base{} -> do_check(Rest, Role, Args);
      _ -> {false, lang:get(<<"Mục không tồn tại"/utf8>>)}
    end;
do_check([time | Rest], Role, Args = #{item := Item}) ->
    case item:check_expire(Item) of
      true ->
	  {false,
	   lang:get(<<"Đạo cụ đã hết hạn và không thể sử dụng "
		      "được."/utf8>>)};
      _ ->
	  case item:check_start(Item) of
	    true -> do_check(Rest, Role, Args);
	    false ->
		{false,
		 lang:get(<<"Thời gian mở cửa chưa đến nên bạn không "
			    "thể sử dụng trước"/utf8>>)}
	  end
    end;
do_check([market | Rest], Role,
	 Args = #{item := #item{base_id = BaseId}}) ->
    case guild_marketplace_data:get_can_sell(BaseId) of
      1 -> do_check(Rest, Role, Args);
      _ ->
	  {false,
	   lang:get(<<"Mặt hàng này không thể bán được"/utf8>>)}
    end;
do_check([day_time | Rest], Role, Args) ->
    Time = var:get_var(Role, day, 107, 0),
    MaxTime =
	guild_marketplace_data:get_const(guild_marketplace_sell_time),
    case Time < MaxTime of
      true -> do_check(Rest, Role, Args);
      _ ->
	  {false,
	   lang:get(<<"Thời gian đặt của ngày hôm nay đã hết. "
		      "Hãy quay lại vào ngày mai."/utf8>>)}
    end;
do_check([guild | Rest],
	 Role = #role{guild_bag =
			  #guild_bag{pid = Pid, id = Gid, lev = GuildLev}},
	 Args) ->
    case is_pid(Pid) of
      true ->
	  GuildLimitLev =
	      guild_marketplace_data:get_const(open_lev),
	  case GuildLev < GuildLimitLev of
	    true ->
		{false, lang:get(<<"Cấp độ bang hội không đủ"/utf8>>)};
	    _ -> do_check(Rest, Role, Args#{gid => Gid})
	  end;
      _ ->
	  {false,
	   lang:get(<<"Bạn không ở trong một guild nào"/utf8>>)}
    end;
do_check([radio | Rest], Role,
	 Args = #{item := #item{base_id = BaseId},
		  num := Num}) ->
    case guild_marketplace_data:get_buy_radio(BaseId) of
      Radio when is_integer(Radio) andalso Radio > 0 ->
	  case Num rem Radio =:= 0 of
	    true ->
		RadioNum = Num div Radio,
		do_check(Rest, Role, Args#{radio_num => RadioNum});
	    _ -> {false, lang:get(<<"Số lượng bán sai"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Mặt hàng này không thể bán được"/utf8>>)}
    end;
do_check(_, _, _) ->
    {false, lang:get(<<"Lỗi tham số"/utf8>>)}.

put_into_market(Gid, Item, Num, Name) ->
    case guild_marketplace:get_guild_marketplace_pid(Gid) of
      {ok, Pid} ->
	  guild_marketplace:call(Pid,
				 {put_into_market, Item, Num, Name});
      _ ->
	  {false,
	   lang:get(<<"Không tìm thấy kho bạc của hội"/utf8>>)}
    end.

check_market(Id, Num, Gid) ->
    case guild_marketplace:get_guild_marketplace_pid(Gid) of
      {ok, Pid} ->
	  guild_marketplace:call(Pid,
				 {buy_market_check, Id, Num});
      _ ->
	  {false,
	   lang:get(<<"Không tìm thấy kho bạc của hội"/utf8>>)}
    end.

do_market(Id, Num, Name, Gid) ->
    case guild_marketplace:get_guild_marketplace_pid(Gid) of
      {ok, Pid} ->
	  guild_marketplace:call(Pid,
				 {buy_market, Id, Num, Name});
      _ ->
	  {false,
	   lang:get(<<"Không tìm thấy kho bạc của hội"/utf8>>)}
    end.

sell_loss_and_gain(Item = #item{base_id = BaseId}, Num,
		   Storage, RadioNum, Role) ->
    Loss = case Storage of
	     1 ->
		 [#loss{label = item_id, val = [{Item#item.id, Num}],
			flag = guild_marketplace}];
	     _ ->
		 [#loss{label = eqm_item_id, val = [{Item#item.id, Num}],
			flag = guild_marketplace}]
	   end,
    case role_gain:do(Role, Loss) of
      {ok, LossRole} ->
	  case guild_marketplace_data:get_sell_price(BaseId) of
	    GainList when is_list(GainList) ->
		Expend = [{GainId, GainNum * RadioNum}
			  || {GainId, GainNum} <- GainList],
		Gain = format:val_to_gain(Expend, guild_marketplace),
		case role_gain:do_notice(LossRole, Gain) of
		  {ok, NewRole} -> {ok, NewRole, Loss ++ Gain};
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  _ ->
		      {false,
		       lang:get(<<"Mặt hàng này không thể bán được"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Mặt hàng này không thể bán được"/utf8>>)}
	  end;
      _ ->
	  {false, lang:get(<<"Thiếu hụt số lượng công cụ"/utf8>>)}
    end.

buy_loss(BaseId, Num, Role) ->
    case guild_marketplace_data:get_buy_price(BaseId) of
      LossList when is_list(LossList) ->
	  case guild_marketplace_data:get_buy_radio(BaseId) of
	    Radio when is_integer(Radio) andalso Radio > 0 ->
		case Num rem Radio =:= 0 of
		  true ->
		      RadioNum = Num div Radio,
		      IsBuy = case guild_marketplace_data:get_day_buy(BaseId)
				  of
				DayLimit
				    when is_integer(DayLimit), DayLimit > 0 ->
				    DayLimitList = var:get_var(Role, day, 112,
							       []),
				    NewBuyTime = case lists:keyfind(BaseId, 1,
								    DayLimitList)
						     of
						   {BaseId, OldBuyTime} ->
						       OldBuyTime + RadioNum;
						   _ -> RadioNum
						 end,
				    case NewBuyTime =< DayLimit of
				      true -> 1;
				      _ -> 0
				    end;
				_ -> 1
			      end,
		      case IsBuy =:= 1 of
			true ->
			    Expend = [{LossId, LossNum * RadioNum}
				      || {LossId, LossNum} <- LossList],
			    Loss = format:val_to_loss(Expend,
						      guild_marketplace),
			    case role_gain:do(Role, Loss) of
			      {ok, NewRole} -> {ok, NewRole, Loss, RadioNum};
			      {false, #loss{msg = Msg}} -> {false, Msg};
			      _ ->
				  {false,
				   lang:get(<<"Không thể mua được mặt hàng này"/utf8>>)}
			    end;
			_ ->
			    {false,
			     lang:get(<<"Đã đạt đến giới hạn mua cho sản phẩm "
					"này"/utf8>>)}
		      end;
		  _ ->
		      {false, lang:get(<<"Số lượng mua không đúng"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Không thể mua được mặt hàng này"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không thể mua được mặt hàng này"/utf8>>)}
    end.

add_day_buy(BaseId, RadioNum, Role) ->
    case guild_marketplace_data:get_day_buy(BaseId) of
      DayLimit when is_integer(DayLimit), DayLimit > 0 ->
	  DayLimitList = var:get_var(Role, day, 112, []),
	  NewDayLimitList = case lists:keyfind(BaseId, 1,
					       DayLimitList)
				of
			      {BaseId, OldBuyTime} ->
				  NewBuyTime = OldBuyTime + RadioNum,
				  lists:keystore(BaseId, 1, DayLimitList,
						 {BaseId, NewBuyTime});
			      _ -> [{BaseId, RadioNum} | DayLimitList]
			    end,
	  NewRole = var:set_var(Role, day, 112, NewDayLimitList),
	  NewRole;
      _ -> Role
    end.


