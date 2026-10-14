-file("src/mod/guild/guild_mgr.erl", 1).

-module(guild_mgr).

-lager_records([{monopoly_dungeons_guild_rank,
		 [ver, id, stage_guild_rank]},
		{guild_stage_rank,
		 [ver, id, name, dps, unixtime, is_reward, leader_name,
		  member, members_max, lev]},
		{monopoly_dungeons,
		 [ver, id, camp_id, stage_list, buffs]},
		{dungeons_stage, [ver, id, develop, boss_list, rank]},
		{dungeons_boss, [ver, id, base_id, hp, max_hp]},
		{stage_rank,
		 [ver, id, name, dps, unixtime, lev, face_id, avatar_bid,
		  power]},
		{guild_marketplace,
		 [ver, id, next_booth_id, item_list, board_list]},
		{market_board,
		 [ver, type, name, operation, reward_list, unixtime]},
		{market_item,
		 [ver, id, base_id, num, attr, extra, holy_eqm_attr,
		  end_time, score]},
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
		{m_guild_dun,
		 [var, formation_list, dps_list, first_list]},
		{guild_dun_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time, look_id,
		  face_update_time, face_file]},
		{guild_dun_rank_boss, [var, boss_id, list]},
		{guild_dun_rank_guild,
		 [var, rank, gid, name, r_name, max_id, time, day_dps,
		  leader_id]},
		{guild_dun_box, [var, boss_id, award_list]},
		{guild_dun,
		 [var, id, f_id, max_id, boss_list, box_award, rank_list,
		  unit_hp, buff_lev, buff_end_time, day_dps,
		  assemble_time]},
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
		{guild_log, [key, list]}, {state, [next_id, srv_id]}]).

-behaviour(gen_server).

-export([apply_list/1, get_role_apply/1,
	 del_role_apply/1, save/1, ver/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {next_id = 0, srv_id = <<>>}).

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

-file("src/mod/guild/guild_mgr.erl", 19).

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

-file("src/mod/guild/guild_mgr.erl", 20).

-file("inc/guild_dun.hrl", 1).

-record(guild_dun,
	{var = 2, id = {0, <<>>}, f_id = 0, max_id = 0,
	 boss_list = [], box_award = [], rank_list = [],
	 unit_hp = [], buff_lev = 0, buff_end_time = 0,
	 day_dps = 0, assemble_time = 0}).

-record(guild_dun_box,
	{var = 1, boss_id = 0, award_list = []}).

-record(guild_dun_rank_guild,
	{var = 1, rank = 0, gid = {0, <<>>}, name = <<>>,
	 r_name = <<>>, max_id = 0, time = 0, day_dps = 0,
	 leader_id = {0, <<>>}}).

-record(guild_dun_rank_boss, {var = 1, boss_id, list}).

-record(guild_dun_rank_role,
	{var = 3, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0,
	 look_id = 0  :: pos_integer(), face_update_time = 0,
	 face_file = <<>>}).

-record(m_guild_dun,
	{var = 2, formation_list = [], dps_list = [],
	 first_list = []}).

-file("src/mod/guild/guild_mgr.erl", 21).

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

-file("src/mod/guild/guild_mgr.erl", 22).

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

-file("src/mod/guild/guild_mgr.erl", 23).

-file("inc/monopoly_dungeons.hrl", 1).

-record(stage_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 power = 0  :: pos_integer()}).

-record(dungeons_boss,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 base_id = 0  :: pos_integer(), hp = 0  :: pos_integer(),
	 max_hp = 0  :: pos_integer()}).

-record(dungeons_stage,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 develop = 0  :: pos_integer(),
	 boss_list = []  :: list(), rank = []  :: list()}).

-record(monopoly_dungeons,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 stage_list = []  :: list(), buffs = []  :: list()}).

-record(guild_stage_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 is_reward = 0  :: boolean(),
	 leader_name = <<>>  :: string(),
	 member = 0  :: pos_integer(),
	 members_max = 0  :: pos_integer(),
	 lev = 0  :: pos_integer()}).

-record(monopoly_dungeons_guild_rank,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 stage_guild_rank = []  :: list()}).

-file("src/mod/guild/guild_mgr.erl", 24).

-spec save(#guild{}) -> ok.

save([]) -> ok;
save([G | T]) -> save(G), save(T);
save(G) ->
    dets:insert(guild_list, G#guild{cache = undefined}), ok.

-spec apply_list(guild_id()) -> [#guild_apply{}].

apply_list(GuildId) ->
    case catch ets:lookup(guild_apply, GuildId) of
      L = [#guild_apply{} | _] -> L;
      _ -> []
    end.

-spec get_role_apply(role_id()) -> [#guild_apply{}].

get_role_apply(RoleId) ->
    ets:match_object(guild_apply,
		     #guild_apply{id = RoleId, _ = '_'}).

-spec del_role_apply(role_id()) -> ok.

del_role_apply(RoleId) ->
    ets:match_delete(guild_apply,
		     #guild_apply{id = RoleId, _ = '_'}).

info(Info) -> guild_mgr ! Info.

cast(Info) -> gen_server:cast(guild_mgr, Info).

call(Info) ->
    case catch gen_server:call(guild_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_mgr61, _,
	     {__Levelguild_mgr61, __Tracesguild_mgr61}}
		when __Levelguild_mgr61 band 8 /= 0 orelse
		       __Tracesguild_mgr61 /= [] ->
		lager:do_log(error,
			     [{module, guild_mgr}, {function, call}, {line, 61},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [guild_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild_mgr61,
			     __Tracesguild_mgr61, lager_event,
			     __Pidguild_mgr61);
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
    gen_server:start_link({local, guild_mgr}, guild_mgr, [],
			  []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_mgr67, _,
       {__Levelguild_mgr67, __Tracesguild_mgr67}}
	  when __Levelguild_mgr67 band 64 /= 0 orelse
		 __Tracesguild_mgr67 /= [] ->
	  lager:do_log(info,
		       [{module, guild_mgr}, {function, init}, {line, 67},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [guild_mgr]), none, 4096,
		       64, __Levelguild_mgr67, __Tracesguild_mgr67,
		       lager_event, __Pidguild_mgr67);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(guild_list,
		   [{file, "./dets/guild.dets"}, {keypos, #guild.id}]),
    ets:new(guild_list,
	    [set, named_table, public, {keypos, #guild.id}]),
    ets:new(guild_member,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(guild_member_quit,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(guild_leader,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(guild_pids,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(guild_apply,
	    [duplicate_bag, named_table, public,
	     {keypos, #guild_apply.gid}]),
    dets:open_file(guild_mem_red_packet,
		   [{file, "./dets/guild_mem_red_packet.dets"},
		    {keypos, #g_mem_red_packet.id}]),
    ets:new(guild_mem_red_packet,
	    [set, named_table, public,
	     {keypos, #g_mem_red_packet.id}]),
    d_ets_lib:load_dets_to_ets(guild_mem_red_packet,
			       fun (D) -> red_packet_ver(D) end),
    dets:open_file(guild_merge,
		   [{file, "./dets/guild_merge.dets"},
		    {keypos, #g_merge.gid}]),
    ets:new(guild_merge,
	    [set, named_table, public, {keypos, #g_merge.gid}]),
    dets:to_ets(guild_merge, guild_merge),
    ets:new(guild_log,
	    [set, named_table, public, {keypos, #guild_log.key}]),
    dets:open_file(guild_log,
		   [{file, "./dets/guild_log.dets"},
		    {keypos, #guild_log.key}]),
    dets:to_ets(guild_log, guild_log),
    ets:new(guild_notice,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(guild_marketplace,
		   [{file, "./dets/guild_marketplace.dets"},
		    {keypos, #guild_marketplace.id}]),
    ets:new(guild_marketplace,
	    [set, named_table, public,
	     {keypos, #guild_marketplace.id}]),
    do_init_guild_marketplace(),
    ets:new(guild_marketplace_pids,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(monopoly_dungeons,
		   [{file, "./dets/monopoly_dungeons.dets"},
		    {keypos, #monopoly_dungeons.id}]),
    ets:new(monopoly_dungeons,
	    [set, named_table, public,
	     {keypos, #monopoly_dungeons.id}]),
    do_init_monopoly_dungeons(),
    ets:new(monopoly_dungeons_pids,
	    [set, named_table, public, {keypos, 1}]),
    NextId = do_init(),
    do_init_dun(),
    State = #state{next_id = NextId,
		   srv_id = sys_env:get(server_id)},
    guild:apply(async, all,
		{60000, 120000, {log_http, guild_sync, []}}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_mgr108, _,
       {__Levelguild_mgr108, __Tracesguild_mgr108}}
	  when __Levelguild_mgr108 band 64 /= 0 orelse
		 __Tracesguild_mgr108 /= [] ->
	  lager:do_log(info,
		       [{module, guild_mgr}, {function, init}, {line, 108},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [guild_mgr]), none, 4096, 64,
		       __Levelguild_mgr108, __Tracesguild_mgr108, lager_event,
		       __Pidguild_mgr108);
      _ -> ok
    end,
    {ok, State}.

handle_call({create, G = #guild{name = Gname}}, _From,
	    State = #state{next_id = NextId, srv_id = SrvId}) ->
    GnameStr =
	list_to_binary(string:to_upper(binary_to_list(Gname))),
    case get({guild_name, GnameStr}) of
      undefined ->
	  Gid = {NextId, SrvId},
	  NewG = G#guild{id = Gid},
	  case guild:start_link(NewG, create) of
	    {ok, GuildPid} ->
		put({guild_name, GnameStr}, 1),
		dets:insert(guild_list, NewG),
		guild_dun:start_link(guild_dun_lib:init(Gid)),
		guild_secret_area_mgr:info({init, Gid}),
		guild_marketplace:init_marketplace(Gid),
		monopoly_dungeons:init_dungeons(Gid),
		{reply, {ok, GuildPid, Gid},
		 State#state{next_id = NextId + 1}};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_mgr129, _,
		   {__Levelguild_mgr129, __Tracesguild_mgr129}}
		      when __Levelguild_mgr129 band 8 /= 0 orelse
			     __Tracesguild_mgr129 /= [] ->
		      lager:do_log(error,
				   [{module, guild_mgr},
				    {function, handle_call}, {line, 129},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("创建公会时启动失败:~w", [Err]), none,
				   4096, 8, __Levelguild_mgr129,
				   __Tracesguild_mgr129, lager_event,
				   __Pidguild_mgr129);
		  _ -> ok
		end,
		{reply, {0, lang:get(<<"公会启动失败"/utf8>>)}, State}
	  end;
      _ ->
	  {reply, {false, lang:get(<<"已经存在同名的公会"/utf8>>)}, State}
    end;
handle_call({rename, GPid, Gname}, _From, State) ->
    GnameStr =
	list_to_binary(string:to_upper(binary_to_list(Gname))),
    case get({guild_name, GnameStr}) of
      undefined ->
	  case guild:apply(sync, GPid,
			   {guild_handle, apply_rename, [Gname]})
	      of
	    {false, Msg} -> {reply, {false, Msg}, State};
	    ok -> put({guild_name, GnameStr}, 1), {reply, ok, State}
	  end;
      _ ->
	  {reply, {false, lang:get(<<"已经存在同名的公会"/utf8>>)}, State}
    end;
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(hour_timer, State) ->
    guild:apply(async, all,
		{100, 5000, {guild_handle, maintain, []}}),
    util:set_timer(hour_timer, date:next_hour(),
		   hour_timer),
    {noreply, State};
handle_info({'EXIT', Pid, Reason}, State)
    when Reason =/= normal andalso Reason =/= disband ->
    case guild_lib:info(by_pid, Pid) of
      {ok, G = #guild{name = Gname}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_mgr167, _,
	     {__Levelguild_mgr167, __Tracesguild_mgr167}}
		when __Levelguild_mgr167 band 8 /= 0 orelse
		       __Tracesguild_mgr167 /= [] ->
		lager:do_log(error,
			     [{module, guild_mgr}, {function, handle_info},
			      {line, 167}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("收到公会[~ts]异常退出信息:~w",
					   [Gname, Reason]),
			     none, 4096, 8, __Levelguild_mgr167,
			     __Tracesguild_mgr167, lager_event,
			     __Pidguild_mgr167);
	    _ -> ok
	  end,
	  case guild:start_link(G, start) of
	    {ok, _Gpid} -> ok;
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_mgr170, _,
		   {__Levelguild_mgr170, __Tracesguild_mgr170}}
		      when __Levelguild_mgr170 band 8 /= 0 orelse
			     __Tracesguild_mgr170 /= [] ->
		      lager:do_log(error,
				   [{module, guild_mgr},
				    {function, handle_info}, {line, 170},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("重启公会[~ts]失败:~w",
						 [Gname, _Err]),
				   none, 4096, 8, __Levelguild_mgr170,
				   __Tracesguild_mgr170, lager_event,
				   __Pidguild_mgr170);
		  _ -> ok
		end
	  end;
      _Err ->
	  case guild_dun_mgr:get_guild_dun_by_pid(Pid) of
	    {ok, GDun = #guild_dun{}} -> guild_dun:start_link(GDun);
	    _Err2 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_mgr177, _,
		   {__Levelguild_mgr177, __Tracesguild_mgr177}}
		      when __Levelguild_mgr177 band 8 /= 0 orelse
			     __Tracesguild_mgr177 /= [] ->
		      lager:do_log(error,
				   [{module, guild_mgr},
				    {function, handle_info}, {line, 177},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("接收到公会异常退出信息 不能重启, 原因:~w 公会:~w 公会副本:~w",
						 [Reason, _Err, _Err2]),
				   none, 4096, 8, __Levelguild_mgr177,
				   __Tracesguild_mgr177, lager_event,
				   __Pidguild_mgr177);
		  _ -> ok
		end
	  end
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State = #state{next_id = NextId}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_mgr186, _,
       {__Levelguild_mgr186, __Tracesguild_mgr186}}
	  when __Levelguild_mgr186 band 64 /= 0 orelse
		 __Tracesguild_mgr186 /= [] ->
	  lager:do_log(info,
		       [{module, guild_mgr}, {function, terminate},
			{line, 186}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64, __Levelguild_mgr186,
		       __Tracesguild_mgr186, lager_event, __Pidguild_mgr186);
      _ -> ok
    end,
    L = guild_lib:list(),
    save(L),
    dets:insert(guild_log, ets:tab2list(guild_log)),
    sys_env:save(guild_next_id, NextId),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_mgr191, _,
       {__Levelguild_mgr191, __Tracesguild_mgr191}}
	  when __Levelguild_mgr191 band 64 /= 0 orelse
		 __Tracesguild_mgr191 /= [] ->
	  lager:do_log(info,
		       [{module, guild_mgr}, {function, terminate},
			{line, 191}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "完成关闭", none, 4096, 64, __Levelguild_mgr191,
		       __Tracesguild_mgr191, lager_event, __Pidguild_mgr191);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_init() ->
    put(next_id, sys_env:get(guild_next_id, 1)),
    Fun = fun (G) ->
		  {ok, NewG} = ver(G),
		  {ok, _Pid} = guild:start_link(NewG, start),
		  continue
	  end,
    dets:traverse(guild_list, Fun),
    erase(next_id).

do_init_dun() ->
    Fun = fun (G) ->
		  {ok, _Pid} = guild_dun:start_link(G), continue
	  end,
    dets:traverse(guild_dun, Fun).

do_init_guild_marketplace() ->
    case dets:first(guild_marketplace) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_mgr221, _,
	     {__Levelguild_mgr221, __Tracesguild_mgr221}}
		when __Levelguild_mgr221 band 64 /= 0 orelse
		       __Tracesguild_mgr221 /= [] ->
		lager:do_log(info,
			     [{module, guild_mgr},
			      {function, do_init_guild_marketplace},
			      {line, 221}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "没有数据需要加载", none, 4096, 64, __Levelguild_mgr221,
			     __Tracesguild_mgr221, lager_event,
			     __Pidguild_mgr221);
	    _ -> ok
	  end,
	  [];
      _ ->
	  dets:traverse(guild_marketplace,
			fun (C) ->
				case guild_marketplace_ver:do(C) of
				  {false, Reason} ->
				      case {whereis(lager_event),
					    whereis(lager_event),
					    lager_config:get({lager_event,
							      loglevel},
							     {0, []})}
					  of
					{undefined, undefined, _} ->
					    fun () -> {error, lager_not_running}
					    end();
					{undefined, _, _} ->
					    fun () ->
						    {error,
						     {sink_not_configured,
						      lager_event}}
					    end();
					{__Pidguild_mgr228, _,
					 {__Levelguild_mgr228,
					  __Tracesguild_mgr228}}
					    when __Levelguild_mgr228 band 8 /= 0
						   orelse
						   __Tracesguild_mgr228 /= [] ->
					    lager:do_log(error,
							 [{module, guild_mgr},
							  {function,
							   do_init_guild_marketplace},
							  {line, 228},
							  {pid,
							   pid_to_list(self())},
							  {node, node()}
							  | lager:md()],
							 io_lib:format("公会宝库数据转换失败:~w",
								       [Reason]),
							 none, 4096, 8,
							 __Levelguild_mgr228,
							 __Tracesguild_mgr228,
							 lager_event,
							 __Pidguild_mgr228);
					_ -> ok
				      end,
				      {done, false};
				  {ok, NewC} ->
				      guild_marketplace:update_data(NewC, all),
				      continue
				end
			end)
    end.

do_init_monopoly_dungeons() ->
    case dets:first(monopoly_dungeons) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_mgr243, _,
	     {__Levelguild_mgr243, __Tracesguild_mgr243}}
		when __Levelguild_mgr243 band 64 /= 0 orelse
		       __Tracesguild_mgr243 /= [] ->
		lager:do_log(info,
			     [{module, guild_mgr},
			      {function, do_init_monopoly_dungeons},
			      {line, 243}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "没有数据需要加载", none, 4096, 64, __Levelguild_mgr243,
			     __Tracesguild_mgr243, lager_event,
			     __Pidguild_mgr243);
	    _ -> ok
	  end,
	  [];
      _ ->
	  dets:traverse(monopoly_dungeons,
			fun (C) ->
				case monopoly_dungeons_ver:do(C) of
				  {false, Reason} ->
				      case {whereis(lager_event),
					    whereis(lager_event),
					    lager_config:get({lager_event,
							      loglevel},
							     {0, []})}
					  of
					{undefined, undefined, _} ->
					    fun () -> {error, lager_not_running}
					    end();
					{undefined, _, _} ->
					    fun () ->
						    {error,
						     {sink_not_configured,
						      lager_event}}
					    end();
					{__Pidguild_mgr250, _,
					 {__Levelguild_mgr250,
					  __Tracesguild_mgr250}}
					    when __Levelguild_mgr250 band 8 /= 0
						   orelse
						   __Tracesguild_mgr250 /= [] ->
					    lager:do_log(error,
							 [{module, guild_mgr},
							  {function,
							   do_init_monopoly_dungeons},
							  {line, 250},
							  {pid,
							   pid_to_list(self())},
							  {node, node()}
							  | lager:md()],
							 io_lib:format("万圣奇境boss数据转换失败:~w",
								       [Reason]),
							 none, 4096, 8,
							 __Levelguild_mgr250,
							 __Tracesguild_mgr250,
							 lager_event,
							 __Pidguild_mgr250);
					_ -> ok
				      end,
				      {done, false};
				  {ok, NewC} ->
				      monopoly_dungeons:update_data(NewC, all),
				      continue
				end
			end)
    end.

ver({guild, Ver = 1, Id, Name, Lev, Exp, DayExp, Pid,
     LeaderName, LeaderId, Members, MembersNum, MembersMax,
     NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
     Sync, CreateTime, Power, RenameTime, LockTime,
     DonateExp}) ->
    ver({guild, Ver + 1, Id, Name, Lev, Exp, DayExp, Pid,
	 LeaderName, LeaderId, Members, MembersNum, MembersMax,
	 NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
	 Sync, CreateTime, Power, RenameTime, LockTime,
	 DonateExp, []});
ver({guild, Ver = 2, Id, Name, Lev, Exp, DayExp, Pid,
     LeaderName, LeaderId, Members, MembersNum, MembersMax,
     NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
     Sync, CreateTime, Power, RenameTime, LockTime,
     DonateExp, RedPacket}) ->
    WarBoxEndTime = 0,
    WarRelust = 0,
    WarBox = [],
    WarSign = [],
    ver({guild, Ver + 1, Id, Name, Lev, Exp, DayExp, Pid,
	 LeaderName, LeaderId, Members, MembersNum, MembersMax,
	 NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
	 Sync, CreateTime, Power, RenameTime, LockTime,
	 DonateExp, RedPacket, WarBoxEndTime, WarRelust, WarBox,
	 WarSign});
ver({guild, Ver = 3, Id, Name, Lev, Exp, DayExp, Pid,
     LeaderName, LeaderId, Members, MembersNum, MembersMax,
     NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
     Sync, CreateTime, Power, RenameTime, LockTime,
     DonateExp, RedPacket, WarBoxEndTime, WarRelust, WarBox,
     WarSign}) ->
    DayVar = [],
    ver({guild, Ver + 1, Id, Name, Lev, Exp, DayExp, Pid,
	 LeaderName, LeaderId, Members, MembersNum, MembersMax,
	 NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
	 Sync, CreateTime, Power, RenameTime, LockTime,
	 DonateExp, RedPacket, WarBoxEndTime, WarRelust, WarBox,
	 WarSign, DayVar});
ver({guild, Ver = 4, Id, Name, Lev, Exp, DayExp, Pid,
     LeaderName, LeaderId, Members, MembersNum, MembersMax,
     NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
     Sync, CreateTime, Power, RenameTime, LockTime,
     DonateExp, RedPacket, WarBoxEndTime, WarRelust, WarBox,
     WarSign, DayVar}) ->
    ViceLeaderMail = 0,
    NormalMail = 0,
    ver({guild, Ver + 1, Id, Name, Lev, Exp, DayExp, Pid,
	 LeaderName, LeaderId, Members, MembersNum, MembersMax,
	 NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
	 Sync, CreateTime, Power, RenameTime, LockTime,
	 DonateExp, RedPacket, WarBoxEndTime, WarRelust, WarBox,
	 WarSign, DayVar, ViceLeaderMail, NormalMail});
ver({guild, Ver = 5, Id, Name, Lev, Exp, DayExp, Pid,
     LeaderName, LeaderId, Members, MembersNum, MembersMax,
     NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
     Sync, CreateTime, Power, RenameTime, LockTime,
     DonateExp, RedPacket, WarBoxEndTime, WarRelust, WarBox,
     WarSign, DayVar, ViceLeaderMail, NormalMail}) ->
    Vitality = 0,
    ver({guild, Ver + 1, Id, Name, Lev, Exp, DayExp, Pid,
	 LeaderName, LeaderId, Members, MembersNum, MembersMax,
	 NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
	 Sync, CreateTime, Power, RenameTime, LockTime,
	 DonateExp, RedPacket, WarBoxEndTime, WarRelust, WarBox,
	 WarSign, DayVar, ViceLeaderMail, NormalMail, Vitality});
ver({guild, Ver = 6, Id, Name, Lev, Exp, DayExp, Pid,
     LeaderName, LeaderId, Members, MembersNum, MembersMax,
     NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
     Sync, CreateTime, Power, RenameTime, LockTime,
     DonateExp, RedPacket, WarBoxEndTime, WarRelust, WarBox,
     WarSign, DayVar, ViceLeaderMail, NormalMail,
     Vitality}) ->
    ApplyPower = 0,
    ver({guild, Ver + 1, Id, Name, Lev, Exp, DayExp, Pid,
	 LeaderName, LeaderId, Members, MembersNum, MembersMax,
	 NextId, Sign, ApplyLev, ApplyType, RecruitNum, Cache,
	 Sync, CreateTime, Power, RenameTime, LockTime,
	 DonateExp, RedPacket, WarBoxEndTime, WarRelust, WarBox,
	 WarSign, DayVar, ViceLeaderMail, NormalMail, Vitality,
	 ApplyPower});
ver(G = #guild{id = {Gid, _}, name = Gname, lev = GLev,
	       members = Members, members_max = MemMax, ver = 7}) ->
    put(next_id, max(Gid + 1, get(next_id))),
    GnameStr =
	list_to_binary(string:to_upper(binary_to_list(Gname))),
    put({guild_name, GnameStr}, 1),
    {ok, NewMembers} = mems_ver(Members, []),
    #guild_data{num = MaxNum} = guild_data:get(GLev),
    NewMemMax = max(MemMax, MaxNum),
    {ok,
     G#guild{members = NewMembers, members_max = NewMemMax}};
ver(_G) -> error.

mems_ver([], L) -> {ok, lists:reverse(L)};
mems_ver([M | T], L) ->
    {ok, NewM} = mem_ver(M), mems_ver(T, [NewM | L]).

mem_ver({guild_member, Ver = 1, Id, Pid, Name, Face,
	 Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	 LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	 RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	 RedPacketRecvTime}) ->
    ActiveLev = 0,
    mem_ver({guild_member, Ver + 1, Id, Pid, Name, Face,
	     Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	     LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	     RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	     RedPacketRecvTime, ActiveLev});
mem_ver({guild_member, Ver = 2, Id, Pid, Name, Face,
	 Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	 LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	 RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	 RedPacketRecvTime, ActiveLev}) ->
    DayDonateType = 0,
    DayDonateTime = 0,
    mem_ver({guild_member, Ver + 1, Id, Pid, Name, Face,
	     Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	     LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	     RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	     RedPacketRecvTime, ActiveLev, DayDonateType,
	     DayDonateTime});
mem_ver({guild_member, Ver = 3, Id, Pid, Name, Face,
	 Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	 LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	 RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	 RedPacketRecvTime, ActiveLev, DayDonateType,
	 DayDonateTime}) ->
    DayDunTime = 0,
    DayWarTime = 0,
    mem_ver({guild_member, Ver + 1, Id, Pid, Name, Face,
	     Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	     LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	     RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	     RedPacketRecvTime, ActiveLev, DayDonateType,
	     DayDonateTime, DayDunTime, DayWarTime});
mem_ver({guild_member, Ver = 4, Id, Pid, Name, Face,
	 Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	 LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	 RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	 RedPacketRecvTime, ActiveLev, DayDonateType,
	 DayDonateTime, DayDunTime, DayWarTime}) ->
    LookId = 0,
    mem_ver({guild_member, Ver + 1, Id, Pid, Name, Face,
	     Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	     LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	     RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	     RedPacketRecvTime, ActiveLev, DayDonateType,
	     DayDonateTime, DayDunTime, DayWarTime, LookId});
mem_ver({guild_member, Ver = 5, Id, Pid, Name, Face,
	 Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	 LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	 RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	 RedPacketRecvTime, ActiveLev, DayDonateType,
	 DayDonateTime, DayDunTime, DayWarTime, LookId}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    mem_ver({guild_member, Ver + 1, Id, Pid, Name, Face,
	     Lev, Sex, Power, Post, VipLev, Online, JoinTime,
	     LoginTime, Donate, DayDonate, AvatarBid, RedPacketNum,
	     RedPacketPrice, RedPacketTime, RedPacketRecvNum,
	     RedPacketRecvTime, ActiveLev, DayDonateType,
	     DayDonateTime, DayDunTime, DayWarTime, LookId,
	     FaceUpdateTime, FaceFile});
mem_ver(M = #guild_member{ver = 6}) ->
    {ok, M#guild_member{pid = 0, online = 0}};
mem_ver(_M) -> error.

red_packet_ver({g_mem_red_packet, Id, RoleId, Name,
		FaceId, AvatarBid, Post, Type, Num, MaxNum, Val, MaxVal,
		List, Mems, StartTime, EndTime, MsgId}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    red_packet_ver({g_mem_red_packet, Id, RoleId, Name,
		    FaceId, AvatarBid, Post, Type, Num, MaxNum, Val, MaxVal,
		    List, Mems, StartTime, EndTime, MsgId, FaceUpdateTime,
		    FaceFile});
red_packet_ver(G = #g_mem_red_packet{mems = Mems}) ->
    NewMems = [red_packet_mem_ver(I) || I <- Mems],
    {ok, G#g_mem_red_packet{mems = NewMems}}.

red_packet_mem_ver({RoleId, Name, FaceId, AvatarBid,
		    Post, GetVal, Now}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    {RoleId, Name, FaceId, AvatarBid, Post, GetVal, Now,
     FaceUpdateTime, FaceFile};
red_packet_mem_ver({RoleId, Name, FaceId, AvatarBid,
		    Post, GetVal, Now, FaceUpdateTime, FaceFile}) ->
    {RoleId, Name, FaceId, AvatarBid, Post, GetVal, Now,
     FaceUpdateTime, FaceFile}.


