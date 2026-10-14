-file("src/mod/guild/guild_invite.erl", 1).

-module(guild_invite).

-lager_records([{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([req_join/3, apply_req_join/2, reply_join/3,
	 apply_reply_join/2, req_invite/2, req_invite_apply/2,
	 reply_invite/3, welcome/2]).

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

-file("src/mod/guild/guild_invite.erl", 17).

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

-file("src/mod/guild/guild_invite.erl", 18).

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

-file("src/mod/guild/guild_invite.erl", 19).

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

-file("src/mod/guild/guild_invite.erl", 20).

-file("inc/log.hrl", 1).

-file("src/mod/guild/guild_invite.erl", 21).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/guild/guild_invite.erl", 22).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/guild/guild_invite.erl", 23).

-spec req_join(#role{}, guild_id(), 1..2) -> ok |
					     {false, bitstring()}.

req_join(#role{id = RoleId, lev = Lev},
	 GuildId = {Gid, GSrvId}, 2) ->
    case Lev >= guild_data:get_const(guild_min_lev) of
      true ->
	  ets:match_delete(guild_apply,
			   #guild_apply{id = RoleId, gid = GuildId, _ = '_'}),
	  sys_conn:pack_send(13503, {1, <<>>, Gid, GSrvId, 0}),
	  ok;
      _ -> {false, lang:get(<<"等级不足"/utf8>>)}
    end;
req_join(Role = #role{id = RoleId, lev = Lev,
		      power = Power,
		      guild_bag =
			  #guild_bag{id = {0, <<>>}, quit_time = QuitTime}},
	 GuildId, Type) ->
    case check_req_join(Role) of
      true ->
	  Now = date:unixtime(),
	  case Now >
		 QuitTime + guild_data:get_const(guild_quit_cd)
	      of
	    true when Type =:= 0 ->
		{ok, M} = role_convert:do(guild_apply, Role),
		L = ets:select(guild_list,
			       [{{guild, '_', '$1', '_', '_', '_', '_', '$2',
				  '_', '_', '_', '$5', '$6', '_', '_', '$3',
				  '$4', '_', '_', '_', '_', '_', '_', '_', '_',
				  '_', '_', '_', '_', '_', '_', '_', '_', '_',
				  '$7'},
				 [{'andalso', {'>=', {const, Lev}, '$3'},
				   {'andalso', {'>', '$6', '$5'},
				    {'andalso', {'=/=', '$4', 2},
				     {'>=', {const, Power}, '$7'}}}}],
				 [{{'$1', '$2', '$4'}}]}]),
		case [{Gid, GPid} || {Gid, GPid, 0} <- L] of
		  [{_Gid, GPid} | _] ->
		      guild:apply(async, GPid,
				  {guild_invite, apply_req_join, [M]}),
		      ok;
		  _ when L =:= [] ->
		      {false, lang:get(<<"没有满足条件的公会"/utf8>>)};
		  _ ->
		      ApplyList = guild_mgr:get_role_apply(RoleId),
		      [guild:apply(async, GPid,
				   {guild_invite, apply_req_join, [M]})
		       || {Gid, GPid, _} <- L,
			  not
			    lists:keymember(Gid, #guild_apply.gid, ApplyList)],
		      ok
		end;
	    true ->
		case guild_lib:pid(GuildId) of
		  {ok, GPid} ->
		      {ok, M} = role_convert:do(guild_apply, Role),
		      guild:apply(async, GPid,
				  {guild_invite, apply_req_join, [M]}),
		      ok;
		  _ -> {false, lang:get(<<"公会不存在"/utf8>>)}
		end;
	    _ ->
		{false,
		 util:fbin(lang:get(<<"退公会不足12小时，~ts后重新加入新公会"/utf8>>),
			   [format:sec(QuitTime +
					 guild_data:get_const(guild_quit_cd)
					 - Now)])}
	  end;
      {false, Msg} -> {false, Msg}
    end;
req_join(_Role, _GuildId, _Type) ->
    {false, lang:get(<<"你有公会啦"/utf8>>)}.

check_req_join(Role = #role{lev = Lev}) ->
    case Lev >= guild_data:get_const(guild_min_lev) of
      true ->
	  Conds = city_data:activate_cond(7),
	  city_lib:check_activate_cond(Role, Conds);
      false -> {false, lang:get(<<"等级不足，不能申请入公会"/utf8>>)}
    end.

-spec apply_req_join(#guild{}, #guild_member{}) -> ok |
						   {ok, #guild{}} |
						   {sync, #guild{}}.

apply_req_join(#guild{apply_lev = NeedLev,
		      id = {Gid, GSrvId}},
	       #guild_apply{pid = RolePid, lev = Lev})
    when Lev < NeedLev ->
    role:pack_send(proxy, RolePid, 13503,
		   {0, lang:get(<<"等级达不到该公会要求"/utf8>>), Gid, GSrvId, 0}),
    ok;
apply_req_join(#guild{apply_power = NeedPower,
		      id = {Gid, GSrvId}},
	       #guild_apply{pid = RolePid, power = Power})
    when Power < NeedPower ->
    role:pack_send(proxy, RolePid, 13503,
		   {0, lang:get(<<"战力达不到该公会要求"/utf8>>), Gid, GSrvId, 0}),
    ok;
apply_req_join(#guild{apply_type = 2,
		      id = {Gid, GSrvId}},
	       #guild_apply{pid = RolePid}) ->
    role:pack_send(proxy, RolePid, 13503,
		   {0, lang:get(<<"该公会已关闭入会申请"/utf8>>), Gid, GSrvId, 0}),
    ok;
apply_req_join(G = #guild{id = GuildId = {Gid, GSrvId},
			  members_max = MemMax, members_num = MemNum,
			  apply_type = ApplyType},
	       M = #guild_apply{id = RoleId, pid = RolePid,
				name = Name, face = Face, lev = Lev,
				vip_lev = VipLev, power = Power}) ->
    ApplyList = guild_mgr:apply_list(GuildId),
    case lists:keyfind(RoleId, #guild_apply.id, ApplyList)
	of
      false when length(ApplyList) >= 30 ->
	  role:pack_send(proxy, RolePid, 13503,
			 {0, lang:get(<<"该公会申请数量已达上限"/utf8>>), Gid, GSrvId, 0}),
	  ok;
      false when MemMax =< MemNum ->
	  role:pack_send(proxy, RolePid, 13503,
			 {0, lang:get(<<"该公会人数已达上限"/utf8>>), Gid, GSrvId, 0}),
	  ok;
      _ when ApplyType =:= 0 ->
	  case ets:insert_new(guild_member,
			      {RoleId, {Gid, GSrvId}})
	      of
	    true ->
		Now = date:unixtime(),
		M1 = #guild_member{id = RoleId, name = Name,
				   face = Face, lev = Lev, post = 3,
				   vip_lev = VipLev, login_time = Now,
				   join_time = Now, online = 1, power = Power},
		guild:apply(async, self(),
			    {guild_invite, apply_reply_join,
			     [{req_join, RoleId, RolePid, M1}]}),
		ok;
	    _ ->
		role:pack_send(proxy, RolePid, 13503,
			       {0, lang:get(<<"当前已加入公会"/utf8>>), Gid, GSrvId,
				0}),
		ok
	  end;
      false ->
	  ets:insert(guild_apply, M#guild_apply{gid = GuildId}),
	  Fun = fun (_R) -> notice_below:send(join_guild), ok end,
	  guild_member:mems_apply(G, {post, verify_request},
				  {Fun, []}),
	  role:pack_send(proxy, RolePid, 13503,
			 {1, <<>>, Gid, GSrvId, 1}),
	  ok;
      _ ->
	  role:pack_send(proxy, RolePid, 13503,
			 {1, lang:get(<<"已经申请加入该公会，请耐心等待"/utf8>>), Gid, GSrvId,
			  0}),
	  ok
    end.

-spec reply_join(#role{}, role_id(), 1 | 2) -> ok |
					       {false, bitstring()}.

reply_join(Role = #role{id = RoleId, pid = RolePid,
			guild_bag = #guild_bag{id = {Gid, GSrvId}, pid = GPid}},
	   TarRoleId, Agree)
    when Gid > 0 andalso is_pid(GPid) ->
    case guild_member:check_post(Role, verify_request) of
      true when Agree =:= 1 ->
	  case ets:match_object(guild_apply,
				#guild_apply{gid = {Gid, GSrvId},
					     id = TarRoleId, _ = '_'})
	      of
	    [A = #guild_apply{id = Id, name = Name, face = Face,
			      lev = Lev, vip_lev = VipLev, power = Power}] ->
		ets:match_delete(guild_apply, A),
		case ets:insert_new(guild_member,
				    {TarRoleId, {Gid, GSrvId}})
		    of
		  true ->
		      Now = date:unixtime(),
		      M = #guild_member{id = Id, name = Name, face = Face,
					lev = Lev, post = 3, vip_lev = VipLev,
					login_time = Now, join_time = Now,
					online = 0, power = Power},
		      guild:apply(async, GPid,
				  {guild_invite, apply_reply_join,
				   [{reply_join, RoleId, RolePid, M}]}),
		      ok;
		  _ -> {false, lang:get(<<"对方已加入其它公会"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"玩家已加入其它公会"/utf8>>)}
	  end;
      true ->
	  ets:match_delete(guild_apply,
			   #guild_apply{gid = {Gid, GSrvId}, id = TarRoleId,
					_ = '_'}),
	  ok;
      {false, Reason} -> {false, Reason}
    end;
reply_join(_, _Rid, _) ->
    {false, lang:get(<<"你没有公会"/utf8>>)}.

-spec apply_reply_join(#guild{}, tuple()) -> ok |
					     {ok, #guild{}} | {sync, #guild{}}.

apply_reply_join(G = #guild{id = GuildId, name = GName,
			    lev = GLev, members = Members, members_max = MemMax,
			    members_num = MemNum},
		 {_Flag, _, RolePid,
		  M = #guild_member{id = TarRoleId = {TarId, TarSrvId},
				    name = TarName}})
    when MemMax > MemNum ->
    case lists:keyfind(TarRoleId, #guild_member.id, Members)
	of
      false ->
	  NewMembers = [M | Members],
	  NewG = G#guild{members = NewMembers,
			 members_num = length(NewMembers)},
	  role_lib:cast(by_id, TarRoleId,
			{guild_member, set,
			 [{join_guild, GuildId, self(), GName, GLev, M}]}),
	  guild_mgr:del_role_apply(TarRoleId),
	  guild_member:pack_send(G, all, 13542, {1, [M]}),
	  guild_member:pack_send(G, all, 13518, {NewG, -1}),
	  notice:alert({role_pid, RolePid},
		       util:fbin(lang:get(<<"~ts成功加入公会"/utf8>>), [TarName])),
	  notice:broadcast(guild, NewMembers, sys_guild,
			   color:msg(lang:get(<<"冒险家~ts加入了公会，大家快来围观萌新啦！~ts"/utf8>>),
				     [{name, TarRoleId, TarName},
				      {href,
				       {32, deep_green, [TarId, TarSrvId],
					lang:get(<<"【欢迎新人】"/utf8>>)}}])),
	  mail:send(TarRoleId,
		    {lang:get(<<"公会通知"/utf8>>),
		     color:msg(lang:get(<<"恭喜您，通过了审批，成功加入~ts公会，成为大家庭的一员"/utf8>>),
			       [{string, {rumor_guild, GName}}]),
		     [], [], <<"联盟加入"/utf8>>}),
	  guild_mem_red_packet:push_list(TarRoleId, GuildId),
	  log_http:guild_sync(NewG),
	  {sync, NewG};
      _ -> ok
    end;
apply_reply_join(_,
		 {_Flag, _, RolePid, #guild_member{id = TarRoleId}}) ->
    notice:alert({role_pid, RolePid},
		 lang:get(<<"公会人数已满"/utf8>>)),
    guild_member:del(TarRoleId),
    ok.

-spec req_invite(#role{}, role_id()) -> {false,
					 bitstring()} |
					ok.

req_invite(Role = #role{id = RoleId, name = Name,
			guild_bag =
			    #guild_bag{id = Gid, name = Gname, pid = GPid}},
	   TarRoleId)
    when is_pid(GPid) ->
    case guild_member:check_post(Role, invite_join_guild) of
      {false, Reason} -> {false, Reason};
      true ->
	  case role_query:pid(by_id, TarRoleId) of
	    {ok, TarPid} ->
		case guild_member:gid(TarRoleId) of
		  {error, not_found} ->
		      ApplyList = guild_mgr:apply_list(Gid),
		      case lists:keymember(TarRoleId, #guild_apply.id,
					   ApplyList)
			  of
			true ->
			    {false, lang:get(<<"对方已在申请列表中，请前往申请列表处理"/utf8>>)};
			_ ->
			    case guild_lib:elem(Gid,
						[#guild.members_num,
						 #guild.members_max,
						 #guild.apply_lev,
						 #guild.apply_power])
				of
			      {ok, [MemNum, MemMax, ApplyLev, ApplyPower]}
				  when MemNum < MemMax ->
				  Now = date:unixtime(),
				  role:apply(async, TarPid,
					     {guild_invite, req_invite_apply,
					      [{RoleId, Name, Gid, Gname,
						ApplyLev, Now, ApplyPower}]}),
				  ok;
			      _ -> {false, lang:get(<<"公会人数已满"/utf8>>)}
			    end
		      end;
		  {ok, Gid} -> {false, lang:get(<<"对方已在公会中"/utf8>>)};
		  _ -> {false, lang:get(<<"对方已有公会"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"对方不在线"/utf8>>)}
	  end
    end;
req_invite(_Role, _TarRoleId) ->
    {false, lang:get(<<"你没有公会"/utf8>>)}.

-spec req_invite_apply(#role{}, tuple()) -> ok |
					    {ok, #role{}}.

req_invite_apply(Role = #role{guild_bag =
				  #guild_bag{id = {0, _}, quit_time = QuitTime},
			      lev = Lev, power = Power},
		 {{InviteRid, InviteSrvId}, InviteName, Gid, Gname,
		  ApplyLev, Now, ApplyPower}) ->
    MinLev = guild_data:get_const(guild_min_lev),
    TimeOut = guild_data:get_const(guild_quit_cd),
    case get({guild_invite, {InviteRid, InviteSrvId}}) of
      _ when Now - QuitTime < TimeOut ->
	  notice:alert({InviteRid, InviteSrvId},
		       util:fbin(lang:get(<<"对方退公会不足12小时，~ts后才加入新公会"/utf8>>),
				 [format:sec(QuitTime + TimeOut - Now)]));
      _ when Lev < MinLev orelse Lev < ApplyLev ->
	  notice:alert({InviteRid, InviteSrvId},
		       lang:get(<<"玩家等级达不到公会要求"/utf8>>));
      _ when Power < ApplyPower ->
	  notice:alert({InviteRid, InviteSrvId},
		       lang:get(<<"玩家战力达不到公会要求"/utf8>>));
      _ ->
	  put({guild_invite, {InviteRid, InviteSrvId}},
	      #{name => InviteName, gid => Gid, gname => Gname,
		time => Now}),
	  sys_conn:pack_send(13560,
			     {InviteRid, InviteSrvId, InviteName, Gname}),
	  notice:alert({InviteRid, InviteSrvId},
		       lang:get(<<"邀请已发送，请等待对方处理"/utf8>>)),
	  notice_below:send(Role, invite_join_guild,
			    [{1, InviteRid}],
			    [{1, InviteSrvId}, {2, InviteName}, {3, Gname}])
    end,
    ok;
req_invite_apply(_,
		 {InviteRoleId, _InviteName, _Gid, _Gname, _ApplyLev,
		  _Now, _ApplyPower}) ->
    notice:alert(InviteRoleId, lang:get(<<"对方已有公会"/utf8>>)),
    ok.

-spec reply_invite(#role{}, role_id(), 1..2) -> {false,
						 bitstring()} |
						ok.

reply_invite(Role = #role{id = RoleId, lev = Lev,
			  pid = RolePid,
			  guild_bag =
			      #guild_bag{id = {0, _}, quit_time = QuitTime}},
	     InviteRoleId, 1) ->
    case Lev >= guild_data:get_const(guild_min_lev) of
      true ->
	  Now = date:unixtime(),
	  TimeOut = guild_data:get_const(guild_quit_cd),
	  case erase({guild_invite, InviteRoleId}) of
	    #{} when Now - QuitTime < TimeOut ->
		{false,
		 util:fbin(lang:get(<<"退公会不足12小时，~ts后重新加入新公会"/utf8>>),
			   [format:sec(QuitTime + TimeOut - Now)])};
	    #{gid := Gid} ->
		case ets:insert_new(guild_member, {RoleId, Gid}) of
		  true ->
		      {ok, M1} = role_convert:do(guild_member, Role),
		      M = M1#guild_member{post = 3},
		      guild:apply(async, Gid,
				  {guild_invite, apply_reply_join,
				   [{reply_invite, RoleId, RolePid, M}]}),
		      ok;
		  _ -> {false, lang:get(<<"当前已加入其他公会"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"没有收到邀请信息"/utf8>>)}
	  end;
      false -> {false, lang:get(<<"等级不足，不能加入公会"/utf8>>)}
    end;
reply_invite(_Role, InviteRoleId, _Type) ->
    erase({guild_invite, InviteRoleId}), ok.

welcome(#role{id = RoleId}, RoleId) ->
    {false, lang:get(<<"自己欢迎自己！"/utf8>>)};
welcome(Role = #role{id = _Rid, name = _Name,
		     guild_bag = #guild_bag{id = GuildId, pid = _GPid}},
	TarRoleId) ->
    case guild_lib:elem(GuildId, #guild.members) of
      {ok, Members = [_ | _]} ->
	  case lists:keyfind(TarRoleId, #guild_member.id, Members)
	      of
	    #guild_member{name = TarName} ->
		case get(guild_welcome) of
		  List when is_list(List) ->
		      case lists:member(TarRoleId, List) of
			true -> {false, lang:get(<<"萌新表示谢谢！"/utf8>>)};
			_ ->
			    Msg =
				color:msg(lang:get(<<"欢迎~ts加入公会大家庭，撒花鼓掌！"/utf8>>),
					  [{name, TarRoleId, TarName}]),
			    say:speak(Role,
				      #{from => sys, msg => Msg, len => 0,
					channel => 4}),
			    put(guild_welcome, [TarRoleId | List]),
			    ok
		      end;
		  _ ->
		      Msg = color:msg(lang:get(<<"欢迎~ts加入公会大家庭，撒花鼓掌！"/utf8>>),
				      [{name, TarRoleId, TarName}]),
		      say:speak(Role,
				#{from => sys, msg => Msg, len => 0,
				  channel => 4}),
		      put(guild_welcome, [TarRoleId]),
		      ok
		end;
	    _ -> {false, lang:get(<<"萌新害羞地躲了起来！"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"出了些问题请稍后再试！"/utf8>>)}
    end.


