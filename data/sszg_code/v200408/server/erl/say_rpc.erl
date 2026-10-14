-file("src/mod/say/say_rpc.erl", 1).

-module(say_rpc).

-lager_records([{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
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

-export([handle/3]).

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

-file("src/mod/say/say_rpc.erl", 9).

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

-file("src/mod/say/say_rpc.erl", 10).

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

-file("src/mod/say/say_rpc.erl", 11).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/say/say_rpc.erl", 12).

handle(12700, {}, Role) ->
    {ok, Used, Frames} = say_frame:info(Role),
    {reply, {Used, Frames}};
handle(12701, {BaseId}, Role) ->
    case say_frame:use(Role, BaseId) of
      {ok, NewRole} ->
	  notice:alert(NewRole, lang:get(<<"设置成功"/utf8>>)),
	  {ok, NewRole};
      {false, Msg} -> notice:alert(Role, Msg), {ok}
    end;
handle(12703, {BaseId}, Role) ->
    role:send_buff_begin(),
    case say_frame:activate(Role, #{base_id => BaseId}) of
      {ok, NewRole} ->
	  role:send_buff_flush(),
	  notice:alert(NewRole, lang:get(<<"成功激活"/utf8>>)),
	  {ok, NewRole};
      {false, Msg} ->
	  role:send_buff_clean(), notice:alert(Role, Msg), {ok}
    end;
handle(12720, {ToRid, ToSrvId, Len, SayMsg}, Role) ->
    case say:check_ban(Role) of
      {Msg, BannedTime} ->
	  sys_conn:pack_send(12772, {Msg, BannedTime}), ok;
      _ ->
	  case say_private:say(Role, {ToRid, ToSrvId}, Len,
			       SayMsg)
	      of
	    {false, Reason} -> {reply, {0, Reason}};
	    {false, Reason, NRole} -> {reply, {0, Reason}, NRole};
	    ok -> ok
	  end
    end;
handle(12723, {Rid, SrvId}, #role{id = RoleId}) ->
    say_mgr:info({del_private_offline_msg, RoleId,
		  {Rid, SrvId}}),
    ok;
handle(12725, {Voice, Len, Time, Type}, _Role)
    when byte_size(Voice) =:= Len andalso
	   Len > 1000 andalso Len < 128000 ->
    case say_voice:add(sys_lib:srv_id(), Voice, Time, Type)
	of
      {ok, SrvId, VoiceId} ->
	  {reply, {1, SrvId, VoiceId, <<>>}};
      {error, Msg} -> {reply, {0, <<>>, 0, Msg}}
    end;
handle(12725, {Voice, Len, Time, Type}, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsay_rpc74, _,
       {__Levelsay_rpc74, __Tracessay_rpc74}}
	  when __Levelsay_rpc74 band 8 /= 0 orelse
		 __Tracessay_rpc74 /= [] ->
	  lager:do_log(error,
		       [{module, say_rpc}, {function, handle}, {line, 74},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("==byte_size:~w Len:~w Time:~w Type:~w",
				     [byte_size(Voice), Len, Time, Type]),
		       none, 4096, 8, __Levelsay_rpc74, __Tracessay_rpc74,
		       lager_event, __Pidsay_rpc74);
      _ -> ok
    end,
    {reply, {0, <<>>, 0, lang:get(<<"语音长度不正常"/utf8>>)}};
handle(12726, {SrvId, VoiceId}, _Role) ->
    case cluster_lib:call(SrvId, say_voice, find,
			  [SrvId, VoiceId])
	of
      {ok, Bin} -> sys_conn:send(get('@conn_pid'), Bin), {ok};
      {ok, Time, Voice, Type} ->
	  {reply, {SrvId, VoiceId, Time, Voice, Type}};
      {error, Msg} when is_atom(Msg) ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsay_rpc86, _,
	     {__Levelsay_rpc86, __Tracessay_rpc86}}
		when __Levelsay_rpc86 band 8 /= 0 orelse
		       __Tracessay_rpc86 /= [] ->
		lager:do_log(error,
			     [{module, say_rpc}, {function, handle}, {line, 86},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找语音信息:~s ~w", [SrvId, Msg]), none,
			     4096, 8, __Levelsay_rpc86, __Tracessay_rpc86,
			     lager_event, __Pidsay_rpc86);
	    _ -> ok
	  end,
	  {ok};
      {error, Msg} -> {reply, {SrvId, VoiceId, 0, Msg, 0}}
    end;
handle(12729, {}, Role) ->
    say_subtitle:leave_peak(Role), ok;
handle(12730, {Type, IsPush}, Role) ->
    say_subtitle:enter(Role, Type, IsPush), ok;
handle(12731, {}, Role) -> say_subtitle:leave(Role), ok;
handle(12732, {Type, Msg}, Role) ->
    role:send_buff_begin(),
    case say_subtitle:send(Role, Type, Msg) of
      {false, Reason} ->
	  role:send_buff_clean(), {reply, {0, Reason}};
      {ok, NRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NRole}
    end;
handle(12762, {Channel, Len, SayMsg, Sign}, Role) ->
    put(say_speak, true),
    case say:check_ban(Role) of
      {Msg, BannedTime} ->
	  sys_conn:pack_send(12772, {Msg, BannedTime}), ok;
      _ ->
	  case say:speak(Role,
			 #{channel => Channel, len => Len, msg => SayMsg,
			   sign => Sign})
	      of
	    {false, Msg, NewRole} -> {reply, {0, Msg}, NewRole};
	    {false, ErrMsg} -> {reply, {0, ErrMsg}};
	    ok -> ok
	  end
    end;
handle(12764, {Channel, Id, SayMsg}, Role) ->
    case say:translate(Role, {Channel, Id, SayMsg}) of
      {false, Msg, NewRole} ->
	  notice:alert(Msg), {ok, NewRole};
      {false, ErrMsg} -> notice:alert(ErrMsg), {ok};
      _ -> {ok}
    end;
handle(12768, {_Rid, _SrvId, Channel, _Msg}, Role) ->
    say:read_mention(Role, Channel), ok;
handle(12770, {Rid, SrvId, Type, Content, EvidenceL},
       Role) ->
    case report:report(Role, Rid, SrvId, Type, Content,
		       EvidenceL)
	of
      {ok, NRole} ->
	  {reply, {1, lang:get(<<"举报成功"/utf8>>)}, NRole};
      {false, Msg} -> {reply, {0, Msg}}
    end;
handle(12771, TarRoleId = {TargetRid, TargetSrvId},
       _Role) ->
    case say:say_history(TarRoleId) of
      #say_history{lists = L} ->
	  Fun = fun ({Channel, SayMsg}, {Count, Acc}) ->
			{Count + 1, [{Count, Channel, SayMsg} | Acc]}
		end,
	  {_, CliL} = lists:foldl(Fun, {1, []}, L),
	  put(report_target_history,
	      lists:keystore(TarRoleId, 1,
			     util:get(report_target_history, []),
			     {TarRoleId, CliL})),
	  {reply, {TargetRid, TargetSrvId, CliL}};
      _ -> {reply, {TargetRid, TargetSrvId, []}}
    end;
handle(_Cmd, _Data, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsay_rpc180, _,
       {__Levelsay_rpc180, __Tracessay_rpc180}}
	  when __Levelsay_rpc180 band 128 /= 0 orelse
		 __Tracessay_rpc180 /= [] ->
	  lager:do_log(debug,
		       [{module, say_rpc}, {function, handle}, {line, 180},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("模块[~w]收到无效的RPC调用[~w]: ~w",
				     [say_rpc, _Cmd, _Data]),
		       none, 4096, 128, __Levelsay_rpc180, __Tracessay_rpc180,
		       lager_event, __Pidsay_rpc180);
      _ -> ok
    end,
    {error, unknow_command}.


