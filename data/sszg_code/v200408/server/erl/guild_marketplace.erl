-file("src/mod/guild_marketplace/guild_marketplace.erl",
      1).

-module(guild_marketplace).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		  end_time, score]}]).

-behaviour(gen_server).

-export([update_data/2, get_guild_marketplace/1,
	 get_guild_marketplace_pid/1, push/3,
	 init_marketplace/1]).

-export([info/2, cast/2, call/2, start_link/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/guild_marketplace/guild_marketplace.erl",
      18).

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

-file("src/mod/guild_marketplace/guild_marketplace.erl",
      19).

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

-file("src/mod/guild_marketplace/guild_marketplace.erl",
      20).

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

-file("src/mod/guild_marketplace/guild_marketplace.erl",
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

-file("src/mod/guild_marketplace/guild_marketplace.erl",
      22).

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

-file("src/mod/guild_marketplace/guild_marketplace.erl",
      23).

-spec update_data(#guild_marketplace{},
		  ets | dets | all) -> ok.

update_data(G, ets)
    when is_record(G, guild_marketplace) ->
    ets:insert(guild_marketplace, G);
update_data(G, dets)
    when is_record(G, guild_marketplace) ->
    dets:insert(guild_marketplace, G);
update_data(G, all)
    when is_record(G, guild_marketplace) ->
    ets:insert(guild_marketplace, G),
    dets:insert(guild_marketplace, G);
update_data(_, _) -> ok.

-spec init_marketplace(tuple()) -> ok.

init_marketplace(Gid) ->
    case catch ets:lookup(guild_marketplace, Gid) of
      [] ->
	  NewData = #guild_marketplace{id = Gid},
	  update_data(NewData, all),
	  start_link(NewData);
      [GuildMarketPlace = #guild_marketplace{}] ->
	  start_link(GuildMarketPlace);
      _ -> ok
    end,
    ok.

-spec
     get_guild_marketplace(pos_integer()) -> #guild_marketplace{} |
					     false.

get_guild_marketplace(Gid) ->
    case catch ets:lookup(guild_marketplace, Gid) of
      [GM = #guild_marketplace{}] -> GM;
      _ -> false
    end.

-spec get_guild_marketplace_pid(pos_integer()) -> {ok,
						   pid()} |
						  false.

get_guild_marketplace_pid(Gid) ->
    case catch ets:lookup(guild_marketplace_pids, Gid) of
      [{Gid, Pid}] -> {ok, Pid};
      _ -> false
    end.

-spec push(#role{}, pos_integer(), list()) -> ok.

push(Role, 26904, NoticeList) ->
    NewNoticeList =
	guild_marketplace_lib:screen_item(NoticeList, []),
    guild_marketplace_lib:push(26903, Role),
    role:pack_send(26904, {NewNoticeList}),
    ok;
push(Role, 26905, NoticeList) ->
    NewNoticeList = screen_end_time(NoticeList, []),
    guild_marketplace_lib:push(26903, Role),
    DayLimit = var:get_var(Role, day, 112, []),
    role:pack_send(26905, {NewNoticeList, DayLimit}),
    ok;
push(Role, 26906, NoticeList) ->
    guild_marketplace_lib:push(26903, Role),
    DayLimit = var:get_var(Role, day, 112, []),
    role:pack_send(26906, {NoticeList, DayLimit}),
    ok;
push(_, _, _) -> ok.

info(Pid, Info) when is_pid(Pid) -> Pid ! Info;
info(_, _) -> not_pid.

cast(Pid, Info) when is_pid(Pid) ->
    gen_server:cast(Pid, Info);
cast(_, _) -> not_pid.

call(Pid, Info) when is_pid(Pid) ->
    case catch gen_server:call(Pid, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_marketplace106, _,
	     {__Levelguild_marketplace106,
	      __Tracesguild_marketplace106}}
		when __Levelguild_marketplace106 band 8 /= 0 orelse
		       __Tracesguild_marketplace106 /= [] ->
		lager:do_log(error,
			     [{module, guild_marketplace}, {function, call},
			      {line, 106}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [Pid, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild_marketplace106,
			     __Tracesguild_marketplace106, lager_event,
			     __Pidguild_marketplace106);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end;
call(_, _) -> not_pid.

start_link(G = #guild_marketplace{id =
				      {Gid, GSrvId}}) ->
    LocalName =
	list_to_atom(lists:concat(["guild_marketplace_", Gid,
				   "_", bitstring_to_list(GSrvId)])),
    gen_server:start_link({local, LocalName},
			  guild_marketplace, [G], []).

init([GuildMarket = #guild_marketplace{id = Gid,
				       item_list = ItemList}]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_marketplace115, _,
       {__Levelguild_marketplace115,
	__Tracesguild_marketplace115}}
	  when __Levelguild_marketplace115 band 64 /= 0 orelse
		 __Tracesguild_marketplace115 /= [] ->
	  lager:do_log(info,
		       [{module, guild_marketplace}, {function, init},
			{line, 115}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 公会宝库进程正在启动:...",
				     [guild_marketplace]),
		       none, 4096, 64, __Levelguild_marketplace115,
		       __Tracesguild_marketplace115, lager_event,
		       __Pidguild_marketplace115);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:insert(guild_marketplace_pids, {Gid, self()}),
    Now = date:unixtime(),
    {NewItemList, EndItemList, ItemChangeList,
     ItemDeleteList} =
	five_update(Now, ItemList, [], [], [], []),
    GuildMarket1 = GuildMarket#guild_marketplace{item_list =
						     NewItemList},
    GuildMarket2 = do_board(EndItemList,
			    lang:get(<<""/utf8>>), 2, 3, GuildMarket1),
    update_data(GuildMarket2, all),
    notice_online_guild_members(Gid, ItemChangeList, 26905),
    notice_online_guild_members(Gid, ItemDeleteList, 26906),
    Ref = erlang:send_after(date:next_diff(5, 0, 0) * 1000,
			    self(), five_update),
    put(five_update, Ref),
    guild_secret_area_mgr:info({init, Gid}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_marketplace131, _,
       {__Levelguild_marketplace131,
	__Tracesguild_marketplace131}}
	  when __Levelguild_marketplace131 band 64 /= 0 orelse
		 __Tracesguild_marketplace131 /= [] ->
	  lager:do_log(info,
		       [{module, guild_marketplace}, {function, init},
			{line, 131}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 公会宝库进程启动成功:...",
				     [guild_marketplace]),
		       none, 4096, 64, __Levelguild_marketplace131,
		       __Tracesguild_marketplace131, lager_event,
		       __Pidguild_marketplace131);
      _ -> ok
    end,
    {ok, GuildMarket2}.

handle_call({put_into_market, Item, Num, Name}, _From,
	    GuildMarket = #guild_marketplace{id = Gid}) ->
    {Reply, NewGuildMarket} = case check_item(Item, Num,
					      GuildMarket)
				  of
				ok ->
				    GuildMarket1 = put_into_market([{Item,
								     Num}],
								   Name, 1,
								   GuildMarket,
								   Gid),
				    {ok, GuildMarket1};
				{false, Reason} ->
				    {{false, Reason}, GuildMarket}
			      end,
    {reply, Reply, NewGuildMarket};
handle_call({buy_market_check, Id, Num}, _From,
	    GuildMarket) ->
    Reply = case check_buy_cond(Id, Num, GuildMarket) of
	      {ok, #market_item{base_id = BaseId}, 1} -> {ok, BaseId};
	      {ok, MarketItem = #market_item{}, _} ->
		  {ok, MarketItem};
	      {false, Reason} -> {false, Reason}
	    end,
    {reply, Reply, GuildMarket};
handle_call({buy_market, Id, Num, Name}, _From,
	    GuildMarket) ->
    {Reply, NewGuildMarket} = case check_buy_cond(Id, Num,
						  GuildMarket)
				  of
				{ok,
				 MarketItem = #market_item{base_id = BaseId},
				 1} ->
				    GuildMarket1 = buy_market(MarketItem, Num,
							      GuildMarket),
				    GuildMarket2 = do_board([{BaseId, Num}],
							    Name, 1, 2,
							    GuildMarket1),
				    update_data(GuildMarket2, all),
				    {ok, GuildMarket2};
				{ok,
				 MarketItem = #market_item{base_id = BaseId},
				 _} ->
				    GuildMarket1 = buy_market(MarketItem, Num,
							      GuildMarket),
				    GuildMarket2 = do_board([{BaseId, Num}],
							    Name, 1, 2,
							    GuildMarket1),
				    update_data(GuildMarket2, all),
				    {ok, GuildMarket2};
				{false, Reason} ->
				    {{false, Reason}, GuildMarket}
			      end,
    {reply, Reply, NewGuildMarket};
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
	    {__Pidguild_marketplace180, _,
	     {__Levelguild_marketplace180,
	      __Tracesguild_marketplace180}}
		when __Levelguild_marketplace180 band 8 /= 0 orelse
		       __Tracesguild_marketplace180 /= [] ->
		lager:do_log(error,
			     [{module, guild_marketplace},
			      {function, handle_call}, {line, 180},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelguild_marketplace180,
			     __Tracesguild_marketplace180, lager_event,
			     __Pidguild_marketplace180);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    guild_marketplace, 181, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(five_update,
	    GuildMarket = #guild_marketplace{id = Gid,
					     item_list = ItemList}) ->
    case get(five_update) of
      OldRef when is_reference(OldRef) ->
	  erlang:cancel_timer(OldRef);
      _ -> skip
    end,
    NewRef = erlang:send_after(date:next_diff(5, 0, 0) *
				 1000,
			       self(), five_update),
    put(five_update, NewRef),
    Now = date:unixtime(),
    {NewItemList, EndItemList, ItemChangeList,
     ItemDeleteList} =
	five_update(Now, ItemList, [], [], [], []),
    GuildMarket1 = GuildMarket#guild_marketplace{item_list =
						     NewItemList},
    GuildMarket2 = do_board(EndItemList,
			    lang:get(<<""/utf8>>), 2, 3, GuildMarket1),
    update_data(GuildMarket2, all),
    notice_online_guild_members(Gid, ItemChangeList, 26905),
    notice_online_guild_members(Gid, ItemDeleteList, 26906),
    {noreply, GuildMarket2};
handle_info({put_into_market, Type, Name, ItemList},
	    GuildMarket = #guild_marketplace{id = Gid}) ->
    NewGuildMarket = put_into_market(ItemList, Name, Type,
				     GuildMarket, Gid),
    InfoList = [{BaseId, Num}
		|| {#item{base_id = BaseId}, Num} <- ItemList],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_marketplace208, _,
       {__Levelguild_marketplace208,
	__Tracesguild_marketplace208}}
	  when __Levelguild_marketplace208 band 64 /= 0 orelse
		 __Tracesguild_marketplace208 /= [] ->
	  lager:do_log(info,
		       [{module, guild_marketplace}, {function, handle_info},
			{line, 208}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会id:~w, 放入物品:~w", [Gid, InfoList]),
		       none, 4096, 64, __Levelguild_marketplace208,
		       __Tracesguild_marketplace208, lager_event,
		       __Pidguild_marketplace208);
      _ -> ok
    end,
    {noreply, NewGuildMarket};
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
	    {__Pidguild_marketplace215, _,
	     {__Levelguild_marketplace215,
	      __Tracesguild_marketplace215}}
		when __Levelguild_marketplace215 band 8 /= 0 orelse
		       __Tracesguild_marketplace215 /= [] ->
		lager:do_log(error,
			     [{module, guild_marketplace},
			      {function, handle_info}, {line, 215},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelguild_marketplace215,
			     __Tracesguild_marketplace215, lager_event,
			     __Pidguild_marketplace215);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    guild_marketplace, 216, _Reason}),
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
      {__Pidguild_marketplace221, _,
       {__Levelguild_marketplace221,
	__Tracesguild_marketplace221}}
	  when __Levelguild_marketplace221 band 64 /= 0 orelse
		 __Tracesguild_marketplace221 /= [] ->
	  lager:do_log(info,
		       [{module, guild_marketplace}, {function, terminate},
			{line, 221}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelguild_marketplace221,
		       __Tracesguild_marketplace221, lager_event,
		       __Pidguild_marketplace221);
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
	    {__Pidguild_marketplace234, _,
	     {__Levelguild_marketplace234,
	      __Tracesguild_marketplace234}}
		when __Levelguild_marketplace234 band 8 /= 0 orelse
		       __Tracesguild_marketplace234 /= [] ->
		lager:do_log(error,
			     [{module, guild_marketplace},
			      {function, do_handle_call}, {line, 234},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelguild_marketplace234,
			     __Tracesguild_marketplace234, lager_event,
			     __Pidguild_marketplace234);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    guild_marketplace, 235, _Reason}),
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
	    {__Pidguild_marketplace248, _,
	     {__Levelguild_marketplace248,
	      __Tracesguild_marketplace248}}
		when __Levelguild_marketplace248 band 8 /= 0 orelse
		       __Tracesguild_marketplace248 /= [] ->
		lager:do_log(error,
			     [{module, guild_marketplace},
			      {function, do_handle_info}, {line, 248},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelguild_marketplace248,
			     __Tracesguild_marketplace248, lager_event,
			     __Pidguild_marketplace248);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    guild_marketplace, 249, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

check_item(#item{base_id = BaseId}, Num,
	   #guild_marketplace{item_list = ItemList}) ->
    NumList = [ItemNum
	       || #market_item{base_id = ItemBaseId, num = ItemNum}
		      <- ItemList,
		  ItemBaseId =:= BaseId],
    AllNum = lists:sum(NumList),
    case guild_marketplace_data:get_max_num(BaseId) of
      {1, MaxPile, Capacity} ->
	  MaxItemNum = MaxPile * Capacity,
	  case AllNum + Num > MaxItemNum of
	    true -> {false, lang:get(<<"东西太多了，宝库已经放不下了~"/utf8>>)};
	    _ -> ok
	  end;
      {0, _MaxPile, Capacity} ->
	  MaxItemNum = Capacity,
	  case AllNum + Num > MaxItemNum of
	    true -> {false, lang:get(<<"东西太多了，宝库已经放不下了~"/utf8>>)};
	    _ ->
		case Num =:= 1 of
		  true -> ok;
		  _ -> {false, lang:get(<<"参数错误"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"东西太多了，宝库已经放不下了~"/utf8>>)}
    end.

put_into_market(ItemList, Name, Type, GuildMarket,
		Gid) ->
    {PutGuildMarket, NoticeItem} =
	do_put_into_market(ItemList, GuildMarket, []),
    BoardItemList = [{BaseId, Num}
		     || {#item{base_id = BaseId}, Num} <- ItemList],
    BoardGuildMarket = do_board(BoardItemList, Name, Type,
				1, PutGuildMarket),
    update_data(BoardGuildMarket, all),
    notice_online_guild_members(Gid, NoticeItem, 26904),
    BoardGuildMarket.

do_put_into_market([], GuildMarket, NoticeItem) ->
    {GuildMarket, NoticeItem};
do_put_into_market([{#item{base_id = BaseId,
			   attr = Attr, extra = Extra,
			   holy_eqm_attr = HolyEqmAttr, score = Score},
		     Num}
		    | Rest],
		   GuildMarket = #guild_marketplace{next_booth_id =
							NextBoothId,
						    item_list = ItemList},
		   OldNoticeItem) ->
    case guild_marketplace_data:get_max_num(BaseId) of
      {1, MaxPile, _Capacity} ->
	  EndTime = get_end_time(BaseId),
	  {NewGuildMarket, NewNoticeItem} = case
					      put_into_pile(ItemList, BaseId,
							    Num, MaxPile,
							    EndTime, [],
							    OldNoticeItem)
						of
					      {ItemList1, Num, NoticeItem1}
						  when Num > 0 ->
						  GuildMarket1 =
						      GuildMarket#guild_marketplace{item_list
											=
											ItemList1},
						  {GuildMarket2, NoticeItem2} =
						      put_into_pile1(GuildMarket1,
								     BaseId,
								     Num,
								     MaxPile,
								     EndTime,
								     NoticeItem1),
						  {GuildMarket2, NoticeItem2};
					      {ItemList1, _, NoticeItem1} ->
						  GuildMarket1 =
						      GuildMarket#guild_marketplace{item_list
											=
											ItemList1},
						  {GuildMarket1, NoticeItem1}
					    end,
	  do_put_into_market(Rest, NewGuildMarket, NewNoticeItem);
      {0, _MaxPile, _Capacity} ->
	  EndTime = get_end_time(BaseId),
	  SingleItem = #market_item{id = NextBoothId,
				    base_id = BaseId, num = Num, attr = Attr,
				    extra = Extra, holy_eqm_attr = HolyEqmAttr,
				    score = Score, end_time = [{Num, EndTime}]},
	  NewGuildMarket =
	      GuildMarket#guild_marketplace{next_booth_id =
						NextBoothId + 1,
					    item_list =
						[SingleItem | ItemList]},
	  do_put_into_market(Rest, NewGuildMarket,
			     [SingleItem | OldNoticeItem]);
      _ ->
	  do_put_into_market(Rest, GuildMarket, OldNoticeItem)
    end.

put_into_pile1(GuildMarket, _, 0, _, _, NoticeItem) ->
    {GuildMarket, NoticeItem};
put_into_pile1(GuildMarket =
		   #guild_marketplace{next_booth_id = NextBoothId,
				      item_list = ItemList},
	       BaseId, Num, MaxPile, EndTime, OldNoticeItem)
    when Num > MaxPile ->
    SingleItem = #market_item{id = NextBoothId,
			      base_id = BaseId, num = MaxPile,
			      end_time = [{MaxPile, EndTime}]},
    NewGuildMarket =
	GuildMarket#guild_marketplace{next_booth_id =
					  NextBoothId + 1,
				      item_list = [SingleItem | ItemList]},
    LastNum = max(0, Num - MaxPile),
    put_into_pile1(NewGuildMarket, BaseId, LastNum, MaxPile,
		   EndTime, [SingleItem | OldNoticeItem]);
put_into_pile1(GuildMarket =
		   #guild_marketplace{next_booth_id = NextBoothId,
				      item_list = ItemList},
	       BaseId, Num, MaxPile, EndTime, OldNoticeItem) ->
    SingleItem = #market_item{id = NextBoothId,
			      base_id = BaseId, num = Num,
			      end_time = [{Num, EndTime}]},
    NewGuildMarket =
	GuildMarket#guild_marketplace{next_booth_id =
					  NextBoothId + 1,
				      item_list = [SingleItem | ItemList]},
    put_into_pile1(NewGuildMarket, BaseId, 0, MaxPile,
		   EndTime, [SingleItem | OldNoticeItem]).

put_into_pile([], _, Num, _, _, OldItemList,
	      NoticeItem) ->
    {OldItemList, Num, NoticeItem};
put_into_pile(LastItemList, _, 0, _, _, OldItemList,
	      NoticeItem) ->
    {LastItemList ++ OldItemList, 0, NoticeItem};
put_into_pile([MarketItem = #market_item{base_id =
					     BaseId,
					 num = OldNum, end_time = EndTimeList}
	       | Rest],
	      BaseId, Num, MaxPile, EndTime, OldItemList,
	      OldNoticeItem) ->
    PutNum = case OldNum + Num =< MaxPile of
	       true -> Num;
	       _ -> max(0, MaxPile - OldNum)
	     end,
    NewEndTimeList = case lists:keyfind(EndTime, 2,
					EndTimeList)
			 of
		       {OldEndNum, EndTime} ->
			   NewEndNum = OldEndNum + PutNum,
			   lists:keystore(EndTime, 2, EndTimeList,
					  {NewEndNum, EndTime});
		       _ ->
			   lists:keystore(EndTime, 2, EndTimeList,
					  {PutNum, EndTime})
		     end,
    NewMarketItem = MarketItem#market_item{num =
					       OldNum + PutNum,
					   end_time = NewEndTimeList},
    LastNum = max(0, Num - PutNum),
    put_into_pile(Rest, BaseId, LastNum, MaxPile, EndTime,
		  [NewMarketItem | OldItemList],
		  [NewMarketItem | OldNoticeItem]);
put_into_pile([MarketItem | Rest], BaseId, Num, MaxPile,
	      EndTime, OldItemList, OldNoticeItem) ->
    put_into_pile(Rest, BaseId, Num, MaxPile, EndTime,
		  [MarketItem | OldItemList], OldNoticeItem).

get_end_time(BaseId) ->
    case guild_marketplace_data:get_end_day(BaseId) of
      EndDay when is_integer(EndDay) ->
	  Now = date:unixtime(),
	  EndTime = 86400 * EndDay,
	  EndUnixtime = Now + EndTime,
	  RealEndUnixtime = date:unixtime({five, EndUnixtime}),
	  RealEndUnixtime;
      _ ->
	  Now = date:unixtime(),
	  EndTime = 86400,
	  EndUnixtime = Now + EndTime,
	  RealEndUnixtime = date:unixtime({five, EndUnixtime}),
	  RealEndUnixtime
    end.

five_update(_, [], OldItemList, EndItemList,
	    OldItemChangeList, OldItemDeleteList) ->
    {OldItemList, EndItemList, OldItemChangeList,
     OldItemDeleteList};
five_update(Now,
	    [MarketItem = #market_item{id = Id, base_id = BaseId,
				       end_time = EndTimeList, num = ItemNum}
	     | Rest],
	    OldItemList, EndItemList, OldItemChangeList,
	    OldItemDeleteList) ->
    {EndNum, NewEndTimeList} = end_time(EndTimeList, Now, 0,
					[]),
    case ItemNum > EndNum of
      true ->
	  case EndNum > 0 of
	    true ->
		NewMarketItem = MarketItem#market_item{num =
							   ItemNum - EndNum,
						       end_time =
							   NewEndTimeList},
		five_update(Now, Rest, [NewMarketItem | OldItemList],
			    [{BaseId, EndNum} | EndItemList],
			    [{Id, ItemNum - EndNum, NewEndTimeList}
			     | OldItemChangeList],
			    OldItemDeleteList);
	    _ ->
		five_update(Now, Rest, [MarketItem | OldItemList],
			    EndItemList, OldItemChangeList, OldItemDeleteList)
	  end;
      _ ->
	  five_update(Now, Rest, OldItemList,
		      [{BaseId, EndNum} | EndItemList], OldItemChangeList,
		      [Id | OldItemDeleteList])
    end.

end_time([], _, SumNum, OldEndTimeList) ->
    {SumNum, OldEndTimeList};
end_time([{Num, EndTime} | Rest], Now, SumNum,
	 OldEndTimeList)
    when EndTime =< Now ->
    end_time(Rest, Now, Num + SumNum, OldEndTimeList);
end_time([EndTime | Rest], Now, SumNum,
	 OldEndTimeList) ->
    end_time(Rest, Now, SumNum, [EndTime | OldEndTimeList]).

check_buy_cond(Id, Num,
	       #guild_marketplace{item_list = ItemList}) ->
    check_buy([id, num, pile], ItemList,
	      #{id => Id, num => Num}).

check_buy([], _,
	  #{market_item := MarketItem, flag := Flag}) ->
    {ok, MarketItem, Flag};
check_buy([id | Rest], ItemList, Args = #{id := Id}) ->
    case lists:keyfind(Id, #market_item.id, ItemList) of
      MarketItem = #market_item{} ->
	  check_buy(Rest, ItemList,
		    Args#{market_item => MarketItem});
      _ -> {false, lang:get(<<"来晚了一步，物品已经不在了~"/utf8>>)}
    end;
check_buy([num | Rest], ItemList,
	  Args = #{market_item := #market_item{num = ItemNum},
		   num := Num}) ->
    case Num =< ItemNum of
      true -> check_buy(Rest, ItemList, Args);
      _ -> {false, lang:get(<<"没有这么多商品"/utf8>>)}
    end;
check_buy([pile | Rest], ItemList,
	  Args = #{market_item :=
		       #market_item{base_id = BaseId}}) ->
    case guild_marketplace_data:get_max_num(BaseId) of
      {Flag, _, _} ->
	  check_buy(Rest, ItemList, Args#{flag => Flag});
      _ -> {false, lang:get(<<"没有该商品"/utf8>>)}
    end;
check_buy(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

buy_market(MarketItem = #market_item{id = Id,
				     num = ItemNum, end_time = EndTimeList},
	   Num,
	   GuildMarket = #guild_marketplace{id = Gid,
					    item_list = ItemList})
    when Num < ItemNum ->
    NewEndTimeList = buy_end_time(EndTimeList, Num),
    NewMarketItem = MarketItem#market_item{num =
					       ItemNum - Num,
					   end_time = NewEndTimeList},
    NewItemList = lists:keystore(Id, #market_item.id,
				 ItemList, NewMarketItem),
    NewGuildMarket = GuildMarket#guild_marketplace{item_list
						       = NewItemList},
    notice_online_guild_members(Gid,
				[{Id, ItemNum - Num, NewEndTimeList}], 26905),
    NewGuildMarket;
buy_market(#market_item{id = Id}, _Num,
	   GuildMarket = #guild_marketplace{id = Gid,
					    item_list = ItemList}) ->
    NewItemList = lists:keydelete(Id, #market_item.id,
				  ItemList),
    NewGuildMarket = GuildMarket#guild_marketplace{item_list
						       = NewItemList},
    notice_online_guild_members(Gid, [Id], 26906),
    NewGuildMarket.

buy_end_time(EndTimeList, Num) ->
    SortEndTimeList = lists:keysort(2, EndTimeList),
    NewEndTimeList = buy_end_time1(SortEndTimeList, Num,
				   []),
    NewEndTimeList.

buy_end_time1(Rest, 0, OldEndTimeList) ->
    Rest ++ OldEndTimeList;
buy_end_time1([], _, OldEndTimeList) -> OldEndTimeList;
buy_end_time1([{EndNum, EndTime} | Rest], Num,
	      OldEndTimeList) ->
    case Num < EndNum of
      true ->
	  NewEndNum = EndNum - Num,
	  buy_end_time1(Rest, 0,
			[{NewEndNum, EndTime} | OldEndTimeList]);
      _ ->
	  NewNum = Num - EndNum,
	  buy_end_time1(Rest, NewNum, OldEndTimeList)
    end.

do_board(ItemList, Name, Type, Operation = 3,
	 GuildMarket = #guild_marketplace{board_list =
					      BoardList}) ->
    case board_item_list(ItemList, []) of
      [] -> GuildMarket;
      BoardItemList ->
	  Now = date:unixtime(),
	  NewBoardList = do_board_operation_end(BoardItemList,
						BoardList, Type, Name,
						Operation, Now),
	  NewGuildMarket =
	      GuildMarket#guild_marketplace{board_list =
						NewBoardList},
	  NewGuildMarket
    end;
do_board(ItemList, Name, Type, Operation,
	 GuildMarket = #guild_marketplace{board_list =
					      BoardList}) ->
    case board_item_list(ItemList, []) of
      [] -> GuildMarket;
      BoardItemList ->
	  EndBoardList = end_time_board(BoardList),
	  Now = date:unixtime(),
	  MarketBoard = #market_board{type = Type, name = Name,
				      operation = Operation,
				      reward_list = BoardItemList,
				      unixtime = Now},
	  NewBoardList = [MarketBoard | EndBoardList],
	  NewGuildMarket =
	      GuildMarket#guild_marketplace{board_list =
						NewBoardList},
	  NewGuildMarket
    end.

end_time_board(BoardList) ->
    MaxNum =
	guild_marketplace_data:get_const(guild_marketplace_borad_num),
    case length(BoardList) < MaxNum of
      true -> BoardList;
      _ ->
	  case lists:keysort(#market_board.unixtime, BoardList) of
	    [#market_board{} | Rest] -> Rest;
	    _ -> BoardList
	  end
    end.

board_item_list([], OldList) -> OldList;
board_item_list([{BaseId, Num} | Rest], OldList) ->
    case guild_marketplace_data:get_is_board(BaseId) of
      1 -> board_item_list(Rest, [{BaseId, Num} | OldList]);
      _ -> board_item_list(Rest, OldList)
    end;
board_item_list(_, OldList) -> OldList.

notice_online_guild_members(Gid, NoticeList, Code) ->
    case guild_lib:info(by_id, Gid) of
      {ok, #guild{members = Member}} ->
	  [role:apply(async, Pid,
		      {guild_marketplace, push, [Code, NoticeList]})
	   || #guild_member{pid = Pid} <- Member, is_pid(Pid)];
      _ -> false
    end.

screen_end_time([], OldNoticeList) -> OldNoticeList;
screen_end_time([{Id, ItemNum, EndTimeList} | Rest],
		OldNoticeList) ->
    NewEndTimeList = case lists:keysort(2, EndTimeList) of
		       [{Num, EndTime} | _] -> [{Num, EndTime}];
		       _ -> []
		     end,
    screen_end_time(Rest,
		    [{Id, ItemNum, NewEndTimeList} | OldNoticeList]);
screen_end_time(_, OldNoticeList) -> OldNoticeList.

do_board_operation_end([], NewBoardList, _, _, _, _) ->
    NewBoardList;
do_board_operation_end(BoardItemList, BoardList, Type,
		       Name, Operation, Now) ->
    {NewBoardItemList, LastBoardItemList} = get_five_num(5,
							 BoardItemList, []),
    EndBoardList = end_time_board(BoardList),
    MarketBoard = #market_board{type = Type, name = Name,
				operation = Operation,
				reward_list = NewBoardItemList, unixtime = Now},
    NewBoardList = [MarketBoard | EndBoardList],
    do_board_operation_end(LastBoardItemList, NewBoardList,
			   Type, Name, Operation, Now);
do_board_operation_end(_, NewBoardList, _, _, _, _) ->
    NewBoardList.

get_five_num(Num, BoardItemList, NewBoardItemList)
    when Num =< 0 ->
    {NewBoardItemList, BoardItemList};
get_five_num(_Num, [], NewBoardItemList) ->
    {NewBoardItemList, []};
get_five_num(Num, [One | Rest], NewBoardItemList) ->
    get_five_num(Num - 1, Rest, [One | NewBoardItemList]);
get_five_num(_, BoardItemList, NewBoardItemList) ->
    {NewBoardItemList, BoardItemList}.


