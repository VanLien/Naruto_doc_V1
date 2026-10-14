-file("src/adm/adm_mgr.erl", 1).

-module(adm_mgr).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
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
		{state, []}]).

-behaviour(gen_server).

-export([self_charge_status/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/adm/adm_mgr.erl", 15).

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

-file("src/adm/adm_mgr.erl", 16).

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

-file("src/adm/adm_mgr.erl", 17).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/adm/adm_mgr.erl", 18).

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

-file("src/adm/adm_mgr.erl", 19).

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

-file("src/adm/adm_mgr.erl", 20).

-spec self_charge_status(bitstring()) -> 0..1.

self_charge_status(Account) ->
    case ets:lookup(self_charge_account, Account) of
      [{_, Status}] -> Status;
      _ -> 0
    end.

info(Info) -> adm_mgr ! Info.

cast(Info) -> gen_server:cast(adm_mgr, Info).

call(Info) ->
    case catch gen_server:call(adm_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadm_mgr37, _,
	     {__Leveladm_mgr37, __Tracesadm_mgr37}}
		when __Leveladm_mgr37 band 8 /= 0 orelse
		       __Tracesadm_mgr37 /= [] ->
		lager:do_log(error,
			     [{module, adm_mgr}, {function, call}, {line, 37},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [adm_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Leveladm_mgr37, __Tracesadm_mgr37,
			     lager_event, __Pidadm_mgr37);
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
    gen_server:start_link({local, adm_mgr}, adm_mgr, [],
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
      {__Pidadm_mgr43, _,
       {__Leveladm_mgr43, __Tracesadm_mgr43}}
	  when __Leveladm_mgr43 band 64 /= 0 orelse
		 __Tracesadm_mgr43 /= [] ->
	  lager:do_log(info,
		       [{module, adm_mgr}, {function, init}, {line, 43},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [adm_mgr]), none, 4096,
		       64, __Leveladm_mgr43, __Tracesadm_mgr43, lager_event,
		       __Pidadm_mgr43);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(self_charge_account,
	    [set, named_table, public, {keypos, 1}]),
    case db:get_all("select account from mod_self_charge "
		    "where status = 1")
	of
      {ok, L} ->
	  [ets:insert(self_charge_account, {Account, 1})
	   || [Account] <- L];
      _ -> skip
    end,
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadm_mgr51, _,
       {__Leveladm_mgr51, __Tracesadm_mgr51}}
	  when __Leveladm_mgr51 band 64 /= 0 orelse
		 __Tracesadm_mgr51 /= [] ->
	  lager:do_log(info,
		       [{module, adm_mgr}, {function, init}, {line, 51},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [adm_mgr]), none, 4096, 64,
		       __Leveladm_mgr51, __Tracesadm_mgr51, lager_event,
		       __Pidadm_mgr51);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({banned, GMName, Remark, RoleIDs, TimeOut,
	     _IsNotice},
	    State) ->
    [begin
       case role_query:pid(by_id, {Rid, SrvId}) of
	 {ok, RPid} ->
	     role:apply(async, RPid,
			{fun (R) ->
				 var:set_role_var({Rid, SrvId}, other, 21,
						  {lang:get(<<"您因触犯禁言规则而被禁言，%s后解禁"/utf8>>),
						   erlang:min(TimeOut,
							      2051193600)}),
				 {sync,
				  R#role{banned_time =
					     erlang:min(TimeOut, 2051193600)}}
			 end,
			 []});
	 _ ->
	     Sql = "update role set banned_time = ? where "
		   "rid=? and srv_id=?",
	     var:set_role_var({Rid, SrvId}, other, 21,
			      {lang:get(<<"您因触犯禁言规则而被禁言，%s后解禁"/utf8>>),
			       TimeOut}),
	     db:execute(Sql, [TimeOut, Rid, SrvId])
       end,
       Type = case TimeOut =:= 0 of
		true -> <<"解除禁言"/utf8>>;
		false -> <<"禁言"/utf8>>
	      end,
       cluster_lib:cast(all, say_mgr, info,
			[{del_say, {Rid, SrvId}}]),
       case guild_member:gid({Rid, SrvId}) of
	 {ok, {0, <<>>}} -> skip;
	 {ok, Gid} ->
	     case guild_lib:info(by_id, Gid) of
	       {ok, #guild{pid = GuildPid}} ->
		   guild:info(GuildPid, {del_say, {Rid, SrvId}});
	       _ -> skip
	     end;
	 _ -> skip
       end,
       case {whereis(lager_event), whereis(lager_event),
	     lager_config:get({lager_event, loglevel}, {0, []})}
	   of
	 {undefined, undefined, _} ->
	     fun () -> {error, lager_not_running} end();
	 {undefined, _, _} ->
	     fun () -> {error, {sink_not_configured, lager_event}}
	     end();
	 {__Pidadm_mgr89, _,
	  {__Leveladm_mgr89, __Tracesadm_mgr89}}
	     when __Leveladm_mgr89 band 64 /= 0 orelse
		    __Tracesadm_mgr89 /= [] ->
	     lager:do_log(info,
			  [{module, adm_mgr}, {function, handle_info},
			   {line, 89}, {pid, pid_to_list(self())},
			   {node, node()}
			   | lager:md()],
			  io_lib:format("角色ID ~w被后台禁言，备注:~w",
					[{Rid, SrvId}, Remark]),
			  none, 4096, 64, __Leveladm_mgr89, __Tracesadm_mgr89,
			  lager_event, __Pidadm_mgr89);
	 _ -> ok
       end,
       write_log(Rid, SrvId, GMName, TimeOut, Remark, Type)
     end
     || {Rid, SrvId} <- RoleIDs, is_integer(Rid),
	is_binary(SrvId)],
    {noreply, State};
handle_info({interdict, GMName, Remark, RoleIDs,
	     TimeOut},
	    State) ->
    [begin
       case role_query:pid(by_id, {Rid, SrvId}) of
	 {ok, RPid} ->
	     role:apply(async, RPid,
			{fun (R) -> {sync, R#role{interdict_time = TimeOut}}
			 end,
			 []}),
	     role:stop(async, RPid, interdict,
		       lang:get(<<"您的账号出现异常，请联系GM！"/utf8>>));
	 _ ->
	     Sql = "update role set interdict_time = ? where "
		   "rid=? and srv_id=?",
	     db:execute(Sql, [TimeOut, Rid, SrvId])
       end,
       Type = case TimeOut =:= 0 of
		true -> <<"解除封号"/utf8>>;
		false -> <<"封号"/utf8>>
	      end,
       cluster_lib:cast(all, say_mgr, info,
			[{del_say, {Rid, SrvId}}]),
       catch cluster_lib:cast(all, room_bbs_mgr, info,
			      [{del_msg, {Rid, SrvId}}]),
       partner_comment_mgr:do_cast({do_delete_by_interdict,
				    {Rid, SrvId}}),
       case guild_member:gid({Rid, SrvId}) of
	 {ok, {0, <<>>}} -> skip;
	 {ok, Gid} ->
	     case guild_lib:info(by_id, Gid) of
	       {ok, #guild{pid = GuildPid}} ->
		   guild:info(GuildPid, {del_say, {Rid, SrvId}});
	       _ -> skip
	     end;
	 _ -> skip
       end,
       write_log(Rid, SrvId, GMName, TimeOut, Remark, Type)
     end
     || {Rid, SrvId} <- RoleIDs, is_integer(Rid),
	is_binary(SrvId)],
    {noreply, State};
handle_info({set_capacity, RoleIDs, Capacity}, State) ->
    [case role_query:pid(by_id, {Rid, SrvId}) of
       {ok, RPid} ->
	   role:apply(async, RPid,
		      {fun (R) ->
			       NewR = R#role{capacity = Capacity},
			       role_lib:push_base_info(NewR),
			       {sync, NewR}
		       end,
		       []});
       _ ->
	   Sql = "update `role` set `capacity` = ? where "
		 "rid = ? and srv_id = ?",
	   db:execute(Sql, [Capacity, Rid, SrvId])
     end
     || {Rid, SrvId} <- RoleIDs, is_integer(Rid),
	is_binary(SrvId)],
    {noreply, State};
handle_info({set_name, {Rid, SrvId}, NewName}, State) ->
    case role_query:pid(by_id, {Rid, SrvId}) of
      {ok, RPid} ->
	  Fun = fun (R) ->
			case role_misc:insert_name(NewName, R) of
			  {ok, NRole} ->
			      sys_conn:pack_send(10343, {1, <<>>, NewName}),
			      {sync, NRole};
			  _ -> ok
			end
		end,
	  role:apply(async, RPid, {Fun, []});
      _ ->
	  Sql = "update `role` set `name` = ? where rid "
		"= ? and srv_id = ?",
	  db:execute(Sql, [NewName, Rid, SrvId])
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

write_log(Rid, SrvId, GMName, Pasttime, Msg,
	  TypeName) ->
    Sql = "insert into log_gm(`type`, `gm_name`, "
	  "`rid`, `srv_id`, `name`, `lev`, `coin`, "
	  "`gold`, `logout_time`, `reason`, past_time, "
	  "handle_time, channel) values(?, ?, ?, "
	  "?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
    Now = date:unixtime(),
    case catch role_query:local_attr(by_id, {Rid, SrvId},
				     [#role.name, #role.lev, #role.assets,
				      #role.login, #role.channel])
	of
      {ok,
       [TrName, Lev, #assets{coin = Coin, gold = Gold},
	#login{prev_login_time = PrevLoginTime}, Channel]} ->
	  case db:insert(Sql,
			 [TypeName, GMName, Rid, SrvId, TrName, Lev, Coin, Gold,
			  PrevLoginTime, Msg, Pasttime, Now, Channel])
	      of
	    {ok, _Id} -> ignore;
	    _Any ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadm_mgr194, _,
		   {__Leveladm_mgr194, __Tracesadm_mgr194}}
		      when __Leveladm_mgr194 band 8 /= 0 orelse
			     __Tracesadm_mgr194 /= [] ->
		      lager:do_log(error,
				   [{module, adm_mgr}, {function, write_log},
				    {line, 194}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("GM操作日志 插入失败~w", [_Any]), none,
				   4096, 8, __Leveladm_mgr194,
				   __Tracesadm_mgr194, lager_event,
				   __Pidadm_mgr194);
		  _ -> ok
		end,
		ignore
	  end;
      _ ->
	  SelectSql1 = "select `name`, `lev`, `login_time`, "
		       "`channel` from `role` where `rid` = "
		       "? and `srv_id` = ?",
	  case db:get_row(SelectSql1,
			  [case is_binary(integer_to_list(Rid)) of
			     false -> list_to_binary(integer_to_list(Rid));
			     true -> integer_to_list(Rid)
			   end,
			   SrvId])
	      of
	    {ok, [TrName, Lev, LoginTime, Channel]} ->
		SelectSql2 = "select `coin`, `gold` from `role_assets` "
			     "where `rid` = ? and `srv_id` = ?",
		case db:get_row(SelectSql2,
				[case is_binary(integer_to_list(Rid)) of
				   false ->
				       list_to_binary(integer_to_list(Rid));
				   true -> integer_to_list(Rid)
				 end,
				 SrvId])
		    of
		  {ok, [Coin, Gold]} ->
		      case db:insert(Sql,
				     [TypeName, GMName, Rid, SrvId, TrName, Lev,
				      Coin, Gold, LoginTime, Msg, Pasttime, Now,
				      Channel])
			  of
			{ok, _Id} -> ignore;
			_Any ->
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
			      {__Pidadm_mgr207, _,
			       {__Leveladm_mgr207, __Tracesadm_mgr207}}
				  when __Leveladm_mgr207 band 8 /= 0 orelse
					 __Tracesadm_mgr207 /= [] ->
				  lager:do_log(error,
					       [{module, adm_mgr},
						{function, write_log},
						{line, 207},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("GM操作日志 插入失败~w",
							     [_Any]),
					       none, 4096, 8, __Leveladm_mgr207,
					       __Tracesadm_mgr207, lager_event,
					       __Pidadm_mgr207);
			      _ -> ok
			    end,
			    ignore
		      end;
		  _E0_1 ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidadm_mgr209, _,
			 {__Leveladm_mgr209, __Tracesadm_mgr209}}
			    when __Leveladm_mgr209 band 8 /= 0 orelse
				   __Tracesadm_mgr209 /= [] ->
			    lager:do_log(error,
					 [{module, adm_mgr},
					  {function, write_log}, {line, 209},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("GM操作日志 查询资产表错误~w",
						       [_E0_1]),
					 none, 4096, 8, __Leveladm_mgr209,
					 __Tracesadm_mgr209, lager_event,
					 __Pidadm_mgr209);
			_ -> ok
		      end,
		      ignore
		end;
	    _E1 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadm_mgr211, _,
		   {__Leveladm_mgr211, __Tracesadm_mgr211}}
		      when __Leveladm_mgr211 band 8 /= 0 orelse
			     __Tracesadm_mgr211 /= [] ->
		      lager:do_log(error,
				   [{module, adm_mgr}, {function, write_log},
				    {line, 211}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("GM操作日志 查询角色表报错~w", [_E1]),
				   none, 4096, 8, __Leveladm_mgr211,
				   __Tracesadm_mgr211, lager_event,
				   __Pidadm_mgr211);
		  _ -> ok
		end,
		ignore
	  end
    end.


