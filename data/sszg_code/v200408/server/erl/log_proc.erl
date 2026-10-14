-file("log_proc.erl", 1).

-module(log_proc).

-lager_records([{state,
		 [file, flume_client, dets, dets_num, file_name, idx,
		  acc_idx, buffer, json_encode_fun]},
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

-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_link/2]).

-file("/code/sscode/server/inc/common.hrl", 1).

-file("/code/sscode/server/inc/lib_log.hrl", 1).

-file("/code/sscode/server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("log_proc.erl", 15).

-file("/code/sscode/server/inc/role.hrl", 1).

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

-file("log_proc.erl", 16).

-record(state,
	{file, flume_client, dets, dets_num = 10, file_name,
	 idx = 0, acc_idx = 0, buffer = [], json_encode_fun}).

-spec start_link(FileName :: string(),
		 Flag :: boolean()) -> ignore | {ok, pid()} |
				       {error, any()}.

start_link(FileName, Flag) ->
    gen_server:start_link(log_proc, [FileName, Flag], []).

init([FileName, Flag]) ->
    process_flag(trap_exit, true),
    Atom = list_to_atom(lists:concat(["log_proc_",
				      FileName])),
    FullName = "./log" ++ "/" ++ FileName ++ ".txt",
    {ok, F} = file:open(FullName,
			[append, raw, {delayed_write, 16 * 1024, 2}]),
    EncodeFun = json:encoder([{utf8, true}]),
    State = open_dets(#state{file = F, dets = Atom,
			     file_name = FileName,
			     json_encode_fun = EncodeFun}),
    erlang:send_after(util:rand(800000, 820000), self(),
		      loop),
    FlumeRef = erlang:send_after(util:rand(30000, 100000),
				 self(), flume_submit),
    erlang:put(flume_ref, FlumeRef),
    erlang:register(Atom, self()),
    put(file_name, FileName),
    self() ! init,
    case Flag of
      true ->
	  erlang:send_after(date:next_diff(4, 10, 0) * 1000 +
			      util:rand(1, 300000),
			    self(), del_file);
      _ -> skip
    end,
    ets:insert(log_pids, {Atom, self()}),
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(new_file, State) ->
    {noreply, new_file(State)};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info({write, Id, Content = #{}},
	    State = #state{flume_client = C0, idx = Idx,
			   buffer = Buffer, file = F, acc_idx = AccIdx,
			   json_encode_fun = EncodeFun}) ->
    Content1 = case Content of
		 #{"header_type" := <<"custom-event">>,
		   "comments" := Comments} ->
		     Content#{"comments" :=
				  unicode:characters_to_binary(json:encode(Comments))};
		 _ -> Content
	       end,
    Content2 = Content1#{"log_id" => Id},
    {noreply, State};
handle_info({write, Id, Content},
	    State = #state{file = F, acc_idx = AccIdx}) ->
    case catch file:write(F,
			  unicode:characters_to_binary(io_lib:format("~w$$~ts~n",
								     [Id,
								      Content])))
	of
      ok -> {noreply, State#state{acc_idx = AccIdx + 1}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog_proc96, _,
	     {__Levellog_proc96, __Traceslog_proc96}}
		when __Levellog_proc96 band 8 /= 0 orelse
		       __Traceslog_proc96 /= [] ->
		lager:do_log(error,
			     [{module, log_proc}, {function, handle_info},
			      {line, 96}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("写日志操作失败: ~w", [Err]), none, 4096, 8,
			     __Levellog_proc96, __Traceslog_proc96, lager_event,
			     __Pidlog_proc96);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
handle_info(loop, State) ->
    erlang:send_after(1200000, self(), loop),
    {noreply, new_file(State)};
handle_info(flume_submit,
	    State = #state{flume_client = C0, dets = Dets,
			   buffer = Buffer}) ->
    case time() of _ -> sys_env:set(log_txt_file, true) end,
    State1 = buffer_to_dets(Buffer,
			    State#state{buffer = [], idx = 0}),
    case erlang:get(flume_ref) of
      OldRef when is_reference(OldRef) ->
	  erlang:cancel_timer(OldRef);
      _ -> ok
    end,
    NewState = check_dets_empty(State1),
    FlumeRef = case get(chat) of
		 true ->
		     erlang:send_after(util:rand(10000, 15000), self(),
				       flume_submit);
		 _ ->
		     erlang:send_after(util:rand(90000, 180000), self(),
				       flume_submit)
	       end,
    erlang:put(flume_ref, FlumeRef),
    case NewState of
      #state{} -> {noreply, NewState};
      _Unkown ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog_proc128, _,
	     {__Levellog_proc128, __Traceslog_proc128}}
		when __Levellog_proc128 band 8 /= 0 orelse
		       __Traceslog_proc128 /= [] ->
		lager:do_log(error,
			     [{module, log_proc}, {function, handle_info},
			      {line, 128}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知结构 ~w", [_Unkown]), none, 4096, 8,
			     __Levellog_proc128, __Traceslog_proc128,
			     lager_event, __Pidlog_proc128);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
handle_info(init, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_proc134, _,
       {__Levellog_proc134, __Traceslog_proc134}}
	  when __Levellog_proc134 band 64 /= 0 orelse
		 __Traceslog_proc134 /= [] ->
	  lager:do_log(info,
		       [{module, log_proc}, {function, handle_info},
			{line, 134}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("flume 服务器初始化: ~s", [get(file_name)]),
		       none, 4096, 64, __Levellog_proc134, __Traceslog_proc134,
		       lager_event, __Pidlog_proc134);
      _ -> ok
    end,
    {noreply, State};
handle_info(del_file, State) ->
    Now = date:unixtime(),
    del_day_file(Now, 6),
    del_day_file(Now, 6 + 1),
    del_day_file(Now, 6 + 2),
    del_day_file(Now, 6 + 3),
    del_day_file(Now, 6 + 4),
    del_day_file(Now, 6 + 5),
    erlang:send_after(date:next_diff(4, 10, 0) * 1000 +
			util:rand(1, 300000),
		      self(), del_file),
    {noreply, State};
handle_info(print,
	    State = #state{file_name = FileName,
			   buffer = Buffer}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_proc151, _,
       {__Levellog_proc151, __Traceslog_proc151}}
	  when __Levellog_proc151 band 64 /= 0 orelse
		 __Traceslog_proc151 /= [] ->
	  lager:do_log(info,
		       [{module, log_proc}, {function, handle_info},
			{line, 151}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~s===>~w", [FileName, length(Buffer)]),
		       none, 4096, 64, __Levellog_proc151, __Traceslog_proc151,
		       lager_event, __Pidlog_proc151);
      _ -> ok
    end,
    {noreply, State};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_proc155, _,
       {__Levellog_proc155, __Traceslog_proc155}}
	  when __Levellog_proc155 band 8 /= 0 orelse
		 __Traceslog_proc155 /= [] ->
	  lager:do_log(error,
		       [{module, log_proc}, {function, handle_info},
			{line, 155}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到非法信息:~w", [_Info]), none, 4096, 8,
		       __Levellog_proc155, __Traceslog_proc155, lager_event,
		       __Pidlog_proc155);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason,
	  State = #state{file = F, buffer = Buffer, dets = Dets,
			 flume_client = C0}) ->
    file:close(F),
    buffer_to_dets(Buffer, State),
    dets:close(Dets),
    log_flume:close(C0),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

new_file(State = #state{acc_idx = 0}) -> State;
new_file(State = #state{file = F,
			file_name = FileName}) ->
    case F of
      undefined -> ignore;
      _ -> file:close(F)
    end,
    FullName = "./log" ++ "/" ++ FileName ++ ".txt",
    {{Y, M, D}, {H, I, S}} =
	calendar:now_to_local_time(date:now()),
    TargetDir = target_dir(Y, M, D),
    make_dir(TargetDir),
    TargetFile = lists:concat([TargetDir, "/", FileName,
			       "_", Y, "-", M, "-", D, "-", H, "-", I, "-", S,
			       ".txt"]),
    Cmd = lists:concat(["mv ", FullName, " ", TargetFile]),
    os:cmd(Cmd),
    {ok, Nf} = file:open(FullName,
			 [append, raw, {delayed_write, 16 * 1024, 2}]),
    State#state{file = Nf, acc_idx = 0}.

target_dir(Y, M, D) ->
    lists:concat(["./log", "/", Y * 10000 + M * 100 + D]).

make_dir(Dir) ->
    case filelib:is_dir(Dir) of
      false -> file:make_dir(Dir);
      _ -> skip
    end.

del_day_file(Now, Days) ->
    Time = Now - Days * 86400,
    {{Y, M, D}, _} = date:seconds_to_datetime(Time),
    TargetDir = target_dir(Y, M, D),
    Cmd = lists:concat(["rm -rf ", TargetDir]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_proc206, _,
       {__Levellog_proc206, __Traceslog_proc206}}
	  when __Levellog_proc206 band 64 /= 0 orelse
		 __Traceslog_proc206 /= [] ->
	  lager:do_log(info,
		       [{module, log_proc}, {function, del_day_file},
			{line, 206}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("删除日志文件:~ts", [TargetDir]), none, 4096,
		       64, __Levellog_proc206, __Traceslog_proc206,
		       lager_event, __Pidlog_proc206);
      _ -> ok
    end,
    os:cmd(Cmd).

buffer_to_dets([], State) -> State;
buffer_to_dets(L,
	       State = #state{dets = Dets, dets_num = DetsNum,
			      file_name = FileName}) ->
    case [{I, Log}
	  || Log = #{"log_id" := I, "header_type" := Type} <- L,
	     Type =/= <<"chat">>]
	of
      [] -> State;
      Logs ->
	  case dets:info(Dets, size) of
	    Size when Size >= 500000 andalso DetsNum >= 10 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlog_proc218, _,
		   {__Levellog_proc218, __Traceslog_proc218}}
		      when __Levellog_proc218 band 64 /= 0 orelse
			     __Traceslog_proc218 /= [] ->
		      lager:do_log(info,
				   [{module, log_proc},
				    {function, buffer_to_dets}, {line, 218},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w 日志超出限制,丢弃处理:~w",
						 [Dets, length(Logs)]),
				   none, 4096, 64, __Levellog_proc218,
				   __Traceslog_proc218, lager_event,
				   __Pidlog_proc218);
		  _ -> ok
		end,
		State;
	    Size when Size >= 500000 ->
		case catch dets:close(Dets) of
		  ok ->
		      DetsFile = "./dets/" ++
				   FileName ++
				     "_" ++
				       integer_to_list(DetsNum + 1) ++ ".dets",
		      dets:open_file(Dets,
				     [{file, DetsFile}, {keypos, 1},
				      {type, set}]),
		      dets:insert(Dets, Logs),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidlog_proc226, _,
			 {__Levellog_proc226, __Traceslog_proc226}}
			    when __Levellog_proc226 band 64 /= 0 orelse
				   __Traceslog_proc226 /= [] ->
			    lager:do_log(info,
					 [{module, log_proc},
					  {function, buffer_to_dets},
					  {line, 226},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w dets已满 启动新dets: ~w",
						       [Dets, DetsNum + 1]),
					 none, 4096, 64, __Levellog_proc226,
					 __Traceslog_proc226, lager_event,
					 __Pidlog_proc226);
			_ -> ok
		      end,
		      State#state{dets_num = DetsNum + 1};
		  Err ->
		      catch dets:insert(Dets, Logs),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidlog_proc230, _,
			 {__Levellog_proc230, __Traceslog_proc230}}
			    when __Levellog_proc230 band 8 /= 0 orelse
				   __Traceslog_proc230 /= [] ->
			    lager:do_log(error,
					 [{module, log_proc},
					  {function, buffer_to_dets},
					  {line, 230},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w 关闭dets失败:~w, ~w",
						       [Dets, DetsNum, Err]),
					 none, 4096, 8, __Levellog_proc230,
					 __Traceslog_proc230, lager_event,
					 __Pidlog_proc230);
			_ -> ok
		      end,
		      State
		end;
	    _ -> dets:insert(Dets, Logs), State
	  end
    end.

open_dets(State = #state{file_name = FileName,
			 dets_num = 0, dets = Atom}) ->
    dets:open_file(Atom,
		   [{file, "./dets/" ++ FileName ++ ".dets"}, {keypos, 1},
		    {type, set}]),
    State;
open_dets(State = #state{file_name = FileName,
			 dets_num = DetsNum, dets = Atom}) ->
    DetsFile = "./dets/" ++
		 FileName ++ "_" ++ integer_to_list(DetsNum) ++ ".dets",
    dets:open_file(Atom,
		   [{file, DetsFile}, {keypos, 1}, {type, set}]),
    check_dets_empty(State).

check_dets_empty(State = #state{dets_num = DetsNum,
				dets = Atom, file_name = FileName})
    when DetsNum > 0 ->
    case dets:info(Atom, size) of
      0 ->
	  case catch dets:close(Atom) of
	    ok ->
		DetsFile = "./dets/" ++
			     FileName ++
			       "_" ++ integer_to_list(DetsNum) ++ ".dets",
		file:delete(DetsFile),
		open_dets(State#state{dets_num = DetsNum - 1});
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlog_proc258, _,
		   {__Levellog_proc258, __Traceslog_proc258}}
		      when __Levellog_proc258 band 8 /= 0 orelse
			     __Traceslog_proc258 /= [] ->
		      lager:do_log(error,
				   [{module, log_proc},
				    {function, check_dets_empty}, {line, 258},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w 关闭dets失败:~w, ~w",
						 [Atom, DetsNum, Err]),
				   none, 4096, 8, __Levellog_proc258,
				   __Traceslog_proc258, lager_event,
				   __Pidlog_proc258);
		  _ -> ok
		end,
		State
	  end;
      _ -> State
    end;
check_dets_empty(State) -> State.

submit_dets(Client, Dets) ->
    do_submit_dets(Client, Dets, 200).

do_submit_dets(Client, _Dets, 0) -> Client;
do_submit_dets(Client, Dets, N) ->
    case dets:info(Dets, size) of
      0 -> Client;
      Size ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog_proc276, _,
	     {__Levellog_proc276, __Traceslog_proc276}}
		when __Levellog_proc276 band 64 /= 0 orelse
		       __Traceslog_proc276 /= [] ->
		lager:do_log(info,
			     [{module, log_proc}, {function, do_submit_dets},
			      {line, 276}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("发送日志缓存数据~w==~w", [Dets, Size]),
			     none, 4096, 64, __Levellog_proc276,
			     __Traceslog_proc276, lager_event,
			     __Pidlog_proc276);
	    _ -> ok
	  end,
	  case dets:match_object(Dets, '_', 50) of
	    '$end_of_table' -> Client;
	    {Objects = [_ | _], _} ->
		Logs = [Log || {_, Log = #{}} <- Objects],
		Ret = case flume_ret(submit(Client, Logs)) of
			{error, closed} -> log_flume:submit(Logs);
			Ret1 -> Ret1
		      end,
		case Ret of
		  {NewClient, {ok, 0}} ->
		      [dets:delete(Dets, Id) || #{"log_id" := Id} <- Logs],
		      do_submit_dets(NewClient, Dets, N - 1);
		  _Fail ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidlog_proc292, _,
			 {__Levellog_proc292, __Traceslog_proc292}}
			    when __Levellog_proc292 band 8 /= 0 orelse
				   __Traceslog_proc292 /= [] ->
			    lager:do_log(error,
					 [{module, log_proc},
					  {function, do_submit_dets},
					  {line, 292},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("提交日志失败 ~w", [_Fail]),
					 none, 4096, 8, __Levellog_proc292,
					 __Traceslog_proc292, lager_event,
					 __Pidlog_proc292);
			_ -> ok
		      end,
		      Client
		end;
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlog_proc296, _,
		   {__Levellog_proc296, __Traceslog_proc296}}
		      when __Levellog_proc296 band 8 /= 0 orelse
			     __Traceslog_proc296 /= [] ->
		      lager:do_log(error,
				   [{module, log_proc},
				    {function, do_submit_dets}, {line, 296},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("获取日志失败 ~w", [_Err]), none,
				   4096, 8, __Levellog_proc296,
				   __Traceslog_proc296, lager_event,
				   __Pidlog_proc296);
		  _ -> ok
		end,
		Client
	  end
    end.

flume_ret({_, {{_, {_, {error, closed}}}, _}}) ->
    {error, closed};
flume_ret({_, {error, closed}}) -> {error, closed};
flume_ret(Ret) -> Ret.

submit(undefined, Logs) -> log_flume:submit(Logs);
submit(C, Logs) -> log_flume:submit(C, Logs).

next_flume(undefined) -> undefined;
next_flume(C) ->
    try log_flume:close(C) catch
      E:X ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog_proc317, _,
	     {__Levellog_proc317, __Traceslog_proc317}}
		when __Levellog_proc317 band 8 /= 0 orelse
		       __Traceslog_proc317 /= [] ->
		lager:do_log(error,
			     [{module, log_proc}, {function, next_flume},
			      {line, 317}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("log_flume:close fail:~w ~w",
					   [E, X]),
			     none, 4096, 8, __Levellog_proc317,
			     __Traceslog_proc317, lager_event,
			     __Pidlog_proc317);
	    _ -> ok
	  end
    end,
    undefined.

write_file_log(_F, _EncodeFun,
	       #{"header_type" := <<"chat">>}) ->
    put(chat, true), true;
write_file_log(F, EncodeFun, Log) ->
    try case sys_env:get(log_txt_file) of
	  false -> pass;
	  _ ->
	      Bin = util:fbin("~ts~n",
			      [list_to_binary(EncodeFun({struct,
							 maps:to_list(Log)}))]),
	      ok = file:write(F, Bin)
	end,
	true
    catch
      Type:Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog_proc336, _,
	     {__Levellog_proc336, __Traceslog_proc336}}
		when __Levellog_proc336 band 8 /= 0 orelse
		       __Traceslog_proc336 /= [] ->
		lager:do_log(error,
			     [{module, log_proc}, {function, write_file_log},
			      {line, 336}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("ERR===>Type:~w,Reason:~w",
					   [Type, Reason]),
			     none, 4096, 8, __Levellog_proc336,
			     __Traceslog_proc336, lager_event,
			     __Pidlog_proc336);
	    _ -> ok
	  end,
	  false
    end.


