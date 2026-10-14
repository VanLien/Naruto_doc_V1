-file("src/mod/role_room/room_bbs.erl", 1).

-module(room_bbs).

-lager_records([{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
		{violators_record, [id, name, lists]},
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
		{room_rank_info,
		 [id, name, lev, face, avatar_bid, time, fans_num, rank,
		  look_id, face_update_time, face_file]},
		{room_fans_num, [id, fans]}, {room_fans, [myid, fid]},
		{room_bbs_message_below, [id, role_id, name, bbs_id]},
		{room_bbs_message,
		 [id, bbs_id, bbs_type, reply_name, reply_bbs_id,
		  reply_id, msg, time, tar_id, face_id, avatar_id, lev,
		  sex, name, face_update_time, face_file]},
		{room_honor_badges, [id, time]},
		{room_grow, [id, order, time, arge, ext]},
		{m_room_grow, [ver, finish, doing, info, next_id, ext]},
		{m_room_feat, [ver, flag, finish, doing, overdue, ext]},
		{m_room,
		 [ver, city_id, fanse_list, honor_badges, honor_point,
		  use_badges, room_bbs_set, room_bbs_num]},
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

-export([login/1, do_calc_point/1, leave_message/3,
	 back_message/4, get_message/4, set_bbs_info/2,
	 del_message/2, calc_bbs_info/1, read_message/3,
	 push_new_msg/2]).

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

-file("src/mod/role_room/room_bbs.erl", 20).

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

-file("src/mod/role_room/room_bbs.erl", 21).

-file("inc/role_room.hrl", 1).

-record(m_room,
	{ver = 3, city_id = 0, fanse_list = [],
	 honor_badges = [], honor_point = 0, use_badges = [],
	 room_bbs_set = 1, room_bbs_num = 0}).

-record(m_room_feat,
	{ver = 1, flag = 0,
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()], ext = []}).

-record(m_room_grow,
	{ver = 1, finish = []  :: [pos_integer()],
	 doing = []  :: [tuple()], info = [], next_id = 1,
	 ext = []}).

-record(room_grow,
	{id = 0, order = 0, time = 0, arge = [], ext = []}).

-record(room_honor_badges, {id = 0, time = 0}).

-record(room_bbs_message,
	{id = {0, <<>>}, bbs_id = 0, bbs_type = 0,
	 reply_name = <<>>, reply_bbs_id = 0,
	 reply_id = {0, <<>>}, msg = <<>>, time = 0,
	 tar_id = {0, <<>>}, face_id = 0, avatar_id = 0, lev = 0,
	 sex = 0, name = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(room_bbs_message_below,
	{id = {0, <<>>}, role_id = {0, <<>>}, name = <<>>,
	 bbs_id = 0}).

-record(room_fans, {myid = {0, <<>>}, fid = {0, <<>>}}).

-record(room_fans_num, {id = {0, <<>>}, fans = 0}).

-record(room_rank_info,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, fans_num = 0, rank = 0,
	 look_id = 0, face_update_time = 0, face_file = <<>>}).

-file("src/mod/role_room/room_bbs.erl", 22).

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

-file("src/mod/role_room/room_bbs.erl", 23).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/role_room/room_bbs.erl", 24).

login(Role) ->
    role:apply(async, self(),
	       {room_bbs, do_calc_point, []}),
    {ok, Role}.

do_calc_point(Role = #role{id = Id,
			   m_room = #m_room{room_bbs_num = Num}}) ->
    room_bbs_mgr:role_login(Id, Num), {ok, Role}.

-spec leave_message(#role{}, role_id(),
		    binary()) -> {false, binary()} | {ok, #role{}}.

leave_message(Role = #role{lev = Lev}, TarRoleId,
	      Data) ->
    NeedLev = room_grow_data:get_const(bbs_open_limit),
    case check_can_leave(Role, TarRoleId, #{data => Data},
			 [set, num, data_num, black_friend, cd, sys_ban], #{})
	of
      _ when Lev < NeedLev ->
	  {false, lang:get(<<"等级不足"/utf8>>)};
      {true, _} ->
	  {NewMsg, KeyWords} =
	      keyword:filter_return_keyword(Data),
	  Len = string_util:utf8_len(Data),
	  case say:do_check_speak([ad, banned, repeak], Role,
				  #{channel => 999999997, len => Len,
				    msg => Data})
	      of
	    {false, Reason} -> {false, Reason};
	    {false, Reason, _NRole} -> {false, Reason};
	    {send_self, _Reason, NRole} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidroom_bbs48, _,
		   {__Levelroom_bbs48, __Tracesroom_bbs48}}
		      when __Levelroom_bbs48 band 8 /= 0 orelse
			     __Tracesroom_bbs48 /= [] ->
		      lager:do_log(error,
				   [{module, room_bbs},
				    {function, leave_message}, {line, 48},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts留言板留言内容有问题,Reason:~ts  内容:~ts",
						 [NRole#role.name, _Reason,
						  Data]),
				   none, 4096, 8, __Levelroom_bbs48,
				   __Tracesroom_bbs48, lager_event,
				   __Pidroom_bbs48);
		  _ -> ok
		end,
		notice:alert(lang:get(<<"留言内容有问题"/utf8>>)),
		{ok, NRole};
	    _ ->
		log:chat(Role, 999999998,
			 util:fbin("对方id:~w", [TarRoleId]), Data, KeyWords),
		BbsMsg = to_bbs_msg(Role, TarRoleId, NewMsg, 1),
		cluster_lib:cast(element(2, TarRoleId), room_bbs_mgr,
				 info, [{add, BbsMsg}]),
		{ok, Role}
	  end;
      {false, Msg} -> {false, Msg}
    end.

-spec back_message(#role{}, role_id(), pos_integer(),
		   binary()) -> {false, binary()} | {ok, #role{}}.

back_message(Role = #role{name = Name, lev = Lev},
	     TarRoleId, ToBbsId, Data) ->
    NeedLev = room_grow_data:get_const(bbs_open_limit),
    case check_can_leave(Role, TarRoleId,
			 #{bbs_id => ToBbsId, data => Data},
			 [set, num, data_num, bbs_id, black_friend, cd,
			  sys_ban],
			 #{})
	of
      _ when Lev < NeedLev ->
	  {false, lang:get(<<"等级不足"/utf8>>)};
      {true, #{tar_id := TarId, tar_name := TarName}} ->
	  {NewMsg, KeyWords} =
	      keyword:filter_return_keyword(Data),
	  Len = string_util:utf8_len(Data),
	  case say:do_check_speak([ad, banned, repeak], Role,
				  #{channel => 999999997, len => Len,
				    msg => Data})
	      of
	    {false, Reason} -> {false, Reason};
	    {false, Reason, _NRole} -> {false, Reason};
	    {send_self, _Reason, NRole} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidroom_bbs76, _,
		   {__Levelroom_bbs76, __Tracesroom_bbs76}}
		      when __Levelroom_bbs76 band 8 /= 0 orelse
			     __Tracesroom_bbs76 /= [] ->
		      lager:do_log(error,
				   [{module, room_bbs},
				    {function, back_message}, {line, 76},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts留言板留言回复内容有问题,Reason:~ts  内容:~ts",
						 [Name, _Reason, Data]),
				   none, 4096, 8, __Levelroom_bbs76,
				   __Tracesroom_bbs76, lager_event,
				   __Pidroom_bbs76);
		  _ -> ok
		end,
		notice:alert(lang:get(<<"留言回复内容有问题"/utf8>>)),
		{ok, NRole};
	    _ ->
		log:chat(Role, 999999998,
			 util:fbin("对方id:~w", [TarRoleId]), Data, KeyWords),
		BbsMsg = to_bbs_msg(Role, TarRoleId, NewMsg, 2),
		NBbsMsg = BbsMsg#room_bbs_message{reply_bbs_id =
						      ToBbsId,
						  reply_id = TarId,
						  reply_name = TarName},
		cluster_lib:cast(element(2, TarRoleId), room_bbs_mgr,
				 info, [{add_back, NBbsMsg}]),
		{ok, Role}
	  end;
      {false, Msg} -> {false, Msg}
    end.

-spec get_message(#role{}, role_id(), pos_integer(),
		  pos_integer()) -> {false, binary()} | ok.

get_message(_Role, TarRoleId = {Rid, Sid}, Start,
	    Num) ->
    {MaxNum, List} = room_bbs_mgr:get_message(TarRoleId,
					      Start, Num),
    sys_conn:pack_send(25837,
		       {1, <<>>, Rid, Sid, Start, Num, MaxNum, List}).

-spec del_message(#role{}, pos_integer()) -> {false,
					      binary()} |
					     ok.

del_message(Role = #role{id = RoleId}, BbsId) ->
    ets:match_delete(room_bbs_message,
		     #room_bbs_message{id = RoleId, bbs_id = BbsId,
				       _ = '_'}),
    dets:match_delete(room_bbs_message,
		      #room_bbs_message{id = RoleId, bbs_id = BbsId,
					_ = '_'}),
    calc_bbs_info(Role).

-spec read_message(#role{}, role_id(),
		   pos_integer()) -> {false, binary()} | ok.

read_message(Role = #role{id = RoleId}, RoleId,
	     _BbsId) ->
    ets:match_delete(room_bbs_message_below,
		     #room_bbs_message_below{id = RoleId, role_id = RoleId,
					     _ = '_'}),
    dets:match_delete(room_bbs_message_below,
		      #room_bbs_message_below{id = RoleId, role_id = RoleId,
					      _ = '_'}),
    calc_bbs_info(Role);
read_message(Role = #role{id = RoleId}, TarRoleId,
	     BbsId) ->
    ets:match_delete(room_bbs_message_below,
		     #room_bbs_message_below{id = RoleId,
					     role_id = TarRoleId,
					     bbs_id = BbsId, _ = '_'}),
    dets:match_delete(room_bbs_message_below,
		      #room_bbs_message_below{id = RoleId,
					      role_id = TarRoleId,
					      bbs_id = BbsId, _ = '_'}),
    Role.

-spec set_bbs_info(#role{}, pos_integer()) -> {false,
					       binary()} |
					      ok.

set_bbs_info(Role = #role{m_room = MRoom}, Type) ->
    NMRoom = MRoom#m_room{room_bbs_set = Type},
    NRole = Role#role{m_room = NMRoom},
    role_robot:sync_role(NRole),
    NRole.

-spec calc_bbs_info(#role{}) -> {false, binary()} | ok.

calc_bbs_info(Role = #role{id = RoleId,
			   m_room = MRoom}) ->
    NMRoom = MRoom#m_room{room_bbs_num =
			      room_bbs_mgr:get_bbs_num(RoleId)},
    Role#role{m_room = NMRoom}.

push_new_msg(Role,
	     BbsMsg = #room_bbs_message{id = Id}) ->
    MaxNum = room_bbs_mgr:get_bbs_num(Role#role.id),
    sys_conn:pack_send(25841, {MaxNum, Id, [BbsMsg]}),
    ok.

to_bbs_msg(Role = #role{m_avatar =
			    #m_avatar{used = AvatarId}},
	   TarRoleId, NewMsg, BbsType) ->
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    #room_bbs_message{id = TarRoleId, bbs_type = BbsType,
		      msg = NewMsg, time = date:unixtime(),
		      tar_id = Role#role.id, face_id = Role#role.face_id,
		      avatar_id = AvatarId, lev = Role#role.lev,
		      sex = Role#role.sex, name = Role#role.name,
		      face_update_time = FaceUpdateTime,
		      face_file = FaceFile}.

check_can_leave(_Role, _TarRoleId, _Cache, [], Maps) ->
    {true, Maps};
check_can_leave(Role, TarRoleId, Cache, [Atom | Other],
		Maps) ->
    case check_can_leave(Role, TarRoleId, Cache, Atom, Maps)
	of
      true ->
	  check_can_leave(Role, TarRoleId, Cache, Other, Maps);
      {true, NMaps} ->
	  check_can_leave(Role, TarRoleId, Cache, Other, NMaps);
      {false, Msg} -> {false, Msg}
    end;
check_can_leave(#role{id = RoleId}, RoleId, _Cache, set,
		_Maps) ->
    true;
check_can_leave(Role, TarRoleId, _Cache, set, _Maps) ->
    IsFriend = friend_lib:is_friend(Role, TarRoleId),
    case get_bbs_set_info(TarRoleId) of
      {false, Msg} -> {false, Msg};
      1 -> true;
      2 when IsFriend -> true;
      _ -> {false, lang:get(<<"对方设置了仅好友可留言哦~"/utf8>>)}
    end;
check_can_leave(_Role, TarRoleId, _Cache, num, _Maps) ->
    MaxNum = room_grow_data:get_const(bbs_number_limit),
    case room_bbs_mgr:get_bbs_num(TarRoleId) < MaxNum of
      true -> true;
      _ -> {false, lang:get(<<"留言板信息已满"/utf8>>)}
    end;
check_can_leave(_Role, _TarRoleId, _Cache, cd, _Maps) ->
    Cd = room_grow_data:get_const(bbs_time_limit),
    case
      role_misc:check_cd_with_end_time(room_feat_badges_share,
				       Cd * 1000)
	of
      true -> true;
      {false, EndTime} ->
	  {false,
	   util:fbin(lang:get(<<"距离下次留言还剩~w秒"/utf8>>), [EndTime])}
    end;
check_can_leave(_Role, _TarRoleId, #{data := Data},
		data_num, _Maps) ->
    MsgLen = string_util:utf8_len(Data),
    LimitNum = room_grow_data:get_const(bbs_writing_number),
    case MsgLen =< LimitNum andalso MsgLen > 0 of
      true -> true;
      _ -> {false, lang:get(<<"留言过长"/utf8>>)}
    end;
check_can_leave(_Role, TarRoleId, #{bbs_id := BbsId},
		bbs_id, Maps) ->
    case room_bbs_mgr:get_bbs_info(TarRoleId, BbsId) of
      #room_bbs_message{tar_id = TarId, name = TarName} ->
	  {true, Maps#{tar_id => TarId, tar_name => TarName}};
      _ -> {false, lang:get(<<"该留言不存在, 无法回复"/utf8>>)}
    end;
check_can_leave(#role{id = RoleId}, TarRoleId, _Cache,
		black_friend, _Maps) ->
    case cluster_lib:call(element(2, TarRoleId), sns_black,
			  is_black, [TarRoleId, RoleId])
	of
      false -> true;
      _ -> {false, lang:get(<<"对方好像不欢迎你留言呢"/utf8>>)}
    end;
check_can_leave(_Role, _TarRoleId, _Cache, sys_ban,
		_Maps) ->
    case sys_env:get(sys_ban_rename, false) of
      true -> {false, lang:get(<<"功能维护中，暂时关闭，请谅解"/utf8>>)};
      _ -> true
    end;
check_can_leave(_Role, _TarRoleId, Cache, Atom, Maps) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidroom_bbs210, _,
       {__Levelroom_bbs210, __Tracesroom_bbs210}}
	  when __Levelroom_bbs210 band 8 /= 0 orelse
		 __Tracesroom_bbs210 /= [] ->
	  lager:do_log(error,
		       [{module, room_bbs}, {function, check_can_leave},
			{line, 210}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("留言板回复验证存在未处理的验证数据:~w",
				     [{Cache, Atom, Maps}]),
		       none, 4096, 8, __Levelroom_bbs210, __Tracesroom_bbs210,
		       lager_event, __Pidroom_bbs210);
      _ -> ok
    end,
    {false, lang:get(<<"参数错误"/utf8>>)}.

get_bbs_set_info(TarRoleId) ->
    NeedLev = room_grow_data:get_const(bbs_open_limit),
    case role_robot:get_role(TarRoleId) of
      {ok, #role_robot{lev = Lev}} when Lev < NeedLev ->
	  {false, lang:get(<<"对方等级不足，未开启留言功能"/utf8>>)};
      {ok, #role_robot{room_bbs_set = Set}} -> Set;
      _ -> {false, lang:get(<<"找不到该玩家信息"/utf8>>)}
    end.


