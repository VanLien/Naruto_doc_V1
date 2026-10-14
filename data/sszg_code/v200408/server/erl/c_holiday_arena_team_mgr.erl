-file("data/c_holiday_arena_team_mgr.erl", 1).

-file("src/mod/holiday_arena_team/c_holiday_arena_te"
      "am_mgr.erl",
      1).

-module(c_holiday_arena_team_mgr).

-lager_records([{map_role,
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
		{state, [ts, timeout, switch, period]}]).

-behaviour(gen_fsm).

-export([m/0, info/1, cast/1, call/1, start_link/0]).

-export([gm_clear/0, update_ets/3]).

-export([call_apply/1, apply/1]).

-export([continue/2, continue/3]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2, check/2, open/2]).

-record(state,
	{ts = 0, timeout = 0, switch = idle, period = 0}).

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

-file("src/mod/holiday_arena_team/c_holiday_arena_te"
      "am_mgr.erl",
      32).

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

-file("src/mod/holiday_arena_team/c_holiday_arena_te"
      "am_mgr.erl",
      33).

gm_clear() -> c_holiday_arena_team_mgr ! gm_clear.

-spec m() -> ok.

m() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_arena_team_mgr41, _,
       {__Levelc_holiday_arena_team_mgr41,
	__Tracesc_holiday_arena_team_mgr41}}
	  when __Levelc_holiday_arena_team_mgr41 band 64 /= 0
		 orelse __Tracesc_holiday_arena_team_mgr41 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_arena_team_mgr}, {function, m},
			{line, 41}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64,
		       __Levelc_holiday_arena_team_mgr41,
		       __Tracesc_holiday_arena_team_mgr41, lager_event,
		       __Pidc_holiday_arena_team_mgr41);
      _ -> ok
    end,
    gen_fsm:send_event(c_holiday_arena_team_mgr, timeout).

-spec update_ets(atom(), any(), ets | dets | all) -> ok.

update_ets(Tab, Data, all) ->
    ets:insert(Tab, Data), dets:insert(Tab, Data).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> c_holiday_arena_team_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(c_holiday_arena_team_mgr,
				 Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(c_holiday_arena_team_mgr,
					     Event, 10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_holiday_arena_team_mgr68, _,
	     {__Levelc_holiday_arena_team_mgr68,
	      __Tracesc_holiday_arena_team_mgr68}}
		when __Levelc_holiday_arena_team_mgr68 band 8 /= 0
		       orelse __Tracesc_holiday_arena_team_mgr68 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_arena_team_mgr},
			      {function, call}, {line, 68},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_holiday_arena_team_mgr, Event,
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_holiday_arena_team_mgr68,
			     __Tracesc_holiday_arena_team_mgr68, lager_event,
			     __Pidc_holiday_arena_team_mgr68);
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
    gen_fsm:start_link({local, c_holiday_arena_team_mgr},
		       c_holiday_arena_team_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_arena_team_mgr74, _,
       {__Levelc_holiday_arena_team_mgr74,
	__Tracesc_holiday_arena_team_mgr74}}
	  when __Levelc_holiday_arena_team_mgr74 band 64 /= 0
		 orelse __Tracesc_holiday_arena_team_mgr74 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_arena_team_mgr}, {function, init},
			{line, 74}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64,
		       __Levelc_holiday_arena_team_mgr74,
		       __Tracesc_holiday_arena_team_mgr74, lager_event,
		       __Pidc_holiday_arena_team_mgr74);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(c_holiday_arena_team_main_ids,
			"dets/c_holiday_arena_team_main_ids.dets", 1, set),
    d_ets_lib:load_dets_to_ets(c_holiday_arena_team_main_ids,
			       undefined),
    Ms = date:unixtime(ms),
    {Ts, TimeOut, NewPeriod, Switch} = case
					 sys_env:get(c_holiday_arena_team_state)
					   of
					 {TsT, _T, NewPeriodT, idle} ->
					     TimeOutT = 60 * 300 * 1000,
					     {TsT, TimeOutT, NewPeriodT, idle};
					 {TsT, TimeOutT, NewPeriodT, StateT} ->
					     {TsT, TimeOutT, NewPeriodT,
					      StateT};
					 _ ->
					     TimeOutT = 60 * 300 * 1000,
					     {Ms, TimeOutT, 0, idle}
				       end,
    sys_env:save(c_holiday_arena_team_state,
		 {Ts, TimeOut, NewPeriod, Switch}),
    State = #state{ts = Ts, timeout = TimeOut,
		   switch = Switch, period = NewPeriod},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_arena_team_mgr95, _,
       {__Levelc_holiday_arena_team_mgr95,
	__Tracesc_holiday_arena_team_mgr95}}
	  when __Levelc_holiday_arena_team_mgr95 band 64 /= 0
		 orelse __Tracesc_holiday_arena_team_mgr95 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_arena_team_mgr}, {function, init},
			{line, 95}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "启动完成", none, 4096, 64,
		       __Levelc_holiday_arena_team_mgr95,
		       __Tracesc_holiday_arena_team_mgr95, lager_event,
		       __Pidc_holiday_arena_team_mgr95);
      _ -> ok
    end,
    {ok, Switch, State,
     max(60000 * 300, Ts + TimeOut - Ms)}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(Request, From, StateName, State) ->
    case catch do_handle_sync_event(Request, From,
				    StateName, State)
	of
      {reply, Reply, NewStateName, NewState} ->
	  continue(NewStateName, Reply, NewState);
      _Reason ->
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    c_holiday_arena_team_mgr, 107, _Reason}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_holiday_arena_team_mgr108, _,
	     {__Levelc_holiday_arena_team_mgr108,
	      __Tracesc_holiday_arena_team_mgr108}}
		when __Levelc_holiday_arena_team_mgr108 band 8 /= 0
		       orelse __Tracesc_holiday_arena_team_mgr108 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_arena_team_mgr},
			      {function, handle_sync_event}, {line, 108},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [Request, StateName, _Reason]),
			     none, 4096, 8, __Levelc_holiday_arena_team_mgr108,
			     __Tracesc_holiday_arena_team_mgr108, lager_event,
			     __Pidc_holiday_arena_team_mgr108);
	    _ -> ok
	  end,
	  continue(StateName,
		   {false, lang:get(<<"Lỗi thực thi"/utf8>>)}, State)
    end.

handle_info(Info, StateName, State) ->
    case catch do_handle_info(Info, StateName, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    c_holiday_arena_team_mgr, 117, _Reason}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_holiday_arena_team_mgr118, _,
	     {__Levelc_holiday_arena_team_mgr118,
	      __Tracesc_holiday_arena_team_mgr118}}
		when __Levelc_holiday_arena_team_mgr118 band 8 /= 0
		       orelse __Tracesc_holiday_arena_team_mgr118 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_arena_team_mgr},
			      {function, handle_info}, {line, 118},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [Info, StateName, _Reason]),
			     none, 4096, 8, __Levelc_holiday_arena_team_mgr118,
			     __Tracesc_holiday_arena_team_mgr118, lager_event,
			     __Pidc_holiday_arena_team_mgr118);
	    _ -> ok
	  end,
	  continue(StateName, State)
    end.

terminate(_Reason, _StateName, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_arena_team_mgr123, _,
       {__Levelc_holiday_arena_team_mgr123,
	__Tracesc_holiday_arena_team_mgr123}}
	  when __Levelc_holiday_arena_team_mgr123 band 64 /= 0
		 orelse __Tracesc_holiday_arena_team_mgr123 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_arena_team_mgr},
			{function, terminate}, {line, 123},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64,
		       __Levelc_holiday_arena_team_mgr123,
		       __Tracesc_holiday_arena_team_mgr123, lager_event,
		       __Pidc_holiday_arena_team_mgr123);
      _ -> ok
    end,
    dets:insert(c_holiday_arena_team_main_ids,
		ets:tab2list(c_holiday_arena_team_main_ids)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_arena_team_mgr125, _,
       {__Levelc_holiday_arena_team_mgr125,
	__Tracesc_holiday_arena_team_mgr125}}
	  when __Levelc_holiday_arena_team_mgr125 band 64 /= 0
		 orelse __Tracesc_holiday_arena_team_mgr125 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_arena_team_mgr},
			{function, terminate}, {line, 125},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelc_holiday_arena_team_mgr125,
		       __Tracesc_holiday_arena_team_mgr125, lager_event,
		       __Pidc_holiday_arena_team_mgr125);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

do_handle_sync_event(_Request, _From, StateName,
		     State) ->
    {reply, ok, StateName, State}.

do_handle_info(update_period_info, StateName,
	       State = #state{period = Period}) ->
    cluster_lib:cast(all, holiday_arena_team_mgr, info,
		     [{update_period_info, StateName, Period}]),
    {noreply, StateName, State};
do_handle_info({update_period_info, FromPid}, StateName,
	       State = #state{period = Period}) ->
    FromPid ! {update_period_info, StateName, Period},
    {noreply, StateName, State};
do_handle_info(gm_clear, StateName,
	       State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_arena_team_mgr142, _,
       {__Levelc_holiday_arena_team_mgr142,
	__Tracesc_holiday_arena_team_mgr142}}
	  when __Levelc_holiday_arena_team_mgr142 band 64 /= 0
		 orelse __Tracesc_holiday_arena_team_mgr142 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_arena_team_mgr},
			{function, do_handle_info}, {line, 142},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "GM重置", none, 4096, 64,
		       __Levelc_holiday_arena_team_mgr142,
		       __Tracesc_holiday_arena_team_mgr142, lager_event,
		       __Pidc_holiday_arena_team_mgr142);
      _ -> ok
    end,
    Ms = date:unixtime(ms),
    TimeOutT = 5000,
    ets:delete_all_objects(c_holiday_arena_team_main_ids),
    sys_env:save(c_holiday_arena_team_state,
		 {Ms, TimeOutT, 0, idle}),
    cluster_lib:cast(all, holiday_arena_team_mgr, info,
		     [{synv_period_info, idle, 0}]),
    {noreply, idle,
     State#state{period = 0, switch = idle,
		 ts = date:unixtime(ms), timeout = TimeOutT}};
do_handle_info(_Info, StateName, State) ->
    {noreply, StateName, State}.

continue(StateName,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    Ms = date:unixtime(ms),
    {next_state, StateName, State,
     max(1, Ts + Timeout - Ms)}.

continue(StateName, Reply,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    Ms = date:unixtime(ms),
    {reply, Reply, StateName, State,
     max(1, Ts + Timeout - Ms)}.

idle(timeout, State) ->
    case catch do_state_handle(timeout, idle, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_holiday_arena_team_mgr169, _,
	     {__Levelc_holiday_arena_team_mgr169,
	      __Tracesc_holiday_arena_team_mgr169}}
		when __Levelc_holiday_arena_team_mgr169 band 8 /= 0
		       orelse __Tracesc_holiday_arena_team_mgr169 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_arena_team_mgr},
			      {function, idle}, {line, 169},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, idle, _Reason]),
			     none, 4096, 8, __Levelc_holiday_arena_team_mgr169,
			     __Tracesc_holiday_arena_team_mgr169, lager_event,
			     __Pidc_holiday_arena_team_mgr169);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    c_holiday_arena_team_mgr, 170, _Reason}),
	  continue(idle,
		   State#state{ts = date:unixtime(ms),
			       timeout = date:unixtime(ms) + 86400000})
    end;
idle(_Any, State) -> continue(idle, State).

check(timeout, State) ->
    case catch do_state_handle(timeout, check, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_holiday_arena_team_mgr182, _,
	     {__Levelc_holiday_arena_team_mgr182,
	      __Tracesc_holiday_arena_team_mgr182}}
		when __Levelc_holiday_arena_team_mgr182 band 8 /= 0
		       orelse __Tracesc_holiday_arena_team_mgr182 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_arena_team_mgr},
			      {function, check}, {line, 182},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, check, _Reason]),
			     none, 4096, 8, __Levelc_holiday_arena_team_mgr182,
			     __Tracesc_holiday_arena_team_mgr182, lager_event,
			     __Pidc_holiday_arena_team_mgr182);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    c_holiday_arena_team_mgr, 183, _Reason}),
	  continue(check,
		   State#state{ts = date:unixtime(ms),
			       timeout = date:unixtime(ms) + 86400000})
    end;
check(_Any, State) -> continue(check, State).

open(timeout, State) ->
    case catch do_state_handle(timeout, open, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_holiday_arena_team_mgr195, _,
	     {__Levelc_holiday_arena_team_mgr195,
	      __Tracesc_holiday_arena_team_mgr195}}
		when __Levelc_holiday_arena_team_mgr195 band 8 /= 0
		       orelse __Tracesc_holiday_arena_team_mgr195 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_arena_team_mgr},
			      {function, open}, {line, 195},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, open, _Reason]),
			     none, 4096, 8, __Levelc_holiday_arena_team_mgr195,
			     __Tracesc_holiday_arena_team_mgr195, lager_event,
			     __Pidc_holiday_arena_team_mgr195);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    c_holiday_arena_team_mgr, 196, _Reason}),
	  continue(open,
		   State#state{ts = date:unixtime(ms),
			       timeout = date:unixtime(ms) + 86400000})
    end;
open(_Any, State) -> continue(open, State).

do_state_handle(timeout, idle,
		State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_arena_team_mgr203, _,
       {__Levelc_holiday_arena_team_mgr203,
	__Tracesc_holiday_arena_team_mgr203}}
	  when __Levelc_holiday_arena_team_mgr203 band 64 /= 0
		 orelse __Tracesc_holiday_arena_team_mgr203 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_arena_team_mgr},
			{function, do_state_handle}, {line, 203},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动组队竞技场判断是否开启：~w", [State]), none, 4096,
		       64, __Levelc_holiday_arena_team_mgr203,
		       __Tracesc_holiday_arena_team_mgr203, lager_event,
		       __Pidc_holiday_arena_team_mgr203);
      _ -> ok
    end,
    NewPeriod = Period + 1,
    Ts = date:unixtime(ms),
    case holiday_arena_team_data:get_period_info(NewPeriod)
	of
      {StartTimeT, EndTimeT} ->
	  Now = date:unixtime(),
	  StartTime = date:parse_time(StartTimeT),
	  EndTime = date:parse_time(EndTimeT),
	  CheckTime = StartTime - 60 * 30,
	  case Now >= CheckTime andalso Now =< EndTime of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidc_holiday_arena_team_mgr216, _,
		   {__Levelc_holiday_arena_team_mgr216,
		    __Tracesc_holiday_arena_team_mgr216}}
		      when __Levelc_holiday_arena_team_mgr216 band 64 /= 0
			     orelse __Tracesc_holiday_arena_team_mgr216 /= [] ->
		      lager:do_log(info,
				   [{module, c_holiday_arena_team_mgr},
				    {function, do_state_handle}, {line, 216},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "活动组队竞技场判断为在数据采集期间内，进入数据采集阶段", none, 4096,
				   64, __Levelc_holiday_arena_team_mgr216,
				   __Tracesc_holiday_arena_team_mgr216,
				   lager_event,
				   __Pidc_holiday_arena_team_mgr216);
		  _ -> ok
		end,
		TimeOut = 60000 * 30,
		sys_env:save(c_holiday_arena_team_state,
			     {Ts, TimeOut, NewPeriod, check}),
		cluster_lib:cast(all, holiday_arena_team_mgr, info,
				 [{synv_period_info, check, NewPeriod}]),
		{noreply, check,
		 State#state{ts = Ts, timeout = TimeOut, switch = check,
			     period = NewPeriod}};
	    _ when Now < CheckTime ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidc_holiday_arena_team_mgr222, _,
		   {__Levelc_holiday_arena_team_mgr222,
		    __Tracesc_holiday_arena_team_mgr222}}
		      when __Levelc_holiday_arena_team_mgr222 band 64 /= 0
			     orelse __Tracesc_holiday_arena_team_mgr222 /= [] ->
		      lager:do_log(info,
				   [{module, c_holiday_arena_team_mgr},
				    {function, do_state_handle}, {line, 222},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("活动组队竞技场判断为未到数据采集时间:~w",
						 [CheckTime]),
				   none, 4096, 64,
				   __Levelc_holiday_arena_team_mgr222,
				   __Tracesc_holiday_arena_team_mgr222,
				   lager_event,
				   __Pidc_holiday_arena_team_mgr222);
		  _ -> ok
		end,
		TimeOut = (CheckTime - Now) * 1000,
		sys_env:save(c_holiday_arena_team_state,
			     {Ts, TimeOut, Period, idle}),
		{noreply, idle,
		 State#state{ts = Ts, timeout = TimeOut, switch = idle}};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidc_holiday_arena_team_mgr227, _,
		   {__Levelc_holiday_arena_team_mgr227,
		    __Tracesc_holiday_arena_team_mgr227}}
		      when __Levelc_holiday_arena_team_mgr227 band 64 /= 0
			     orelse __Tracesc_holiday_arena_team_mgr227 /= [] ->
		      lager:do_log(info,
				   [{module, c_holiday_arena_team_mgr},
				    {function, do_state_handle}, {line, 227},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("活动组队竞技场判断不在数据检查时间内:~w",
						 [EndTime]),
				   none, 4096, 64,
				   __Levelc_holiday_arena_team_mgr227,
				   __Tracesc_holiday_arena_team_mgr227,
				   lager_event,
				   __Pidc_holiday_arena_team_mgr227);
		  _ -> ok
		end,
		{noreply, idle,
		 State#state{ts = Ts, timeout = 86400000, switch = idle}}
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
	    {__Pidc_holiday_arena_team_mgr231, _,
	     {__Levelc_holiday_arena_team_mgr231,
	      __Tracesc_holiday_arena_team_mgr231}}
		when __Levelc_holiday_arena_team_mgr231 band 64 /= 0
		       orelse __Tracesc_holiday_arena_team_mgr231 /= [] ->
		lager:do_log(info,
			     [{module, c_holiday_arena_team_mgr},
			      {function, do_state_handle}, {line, 231},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("活动组队竞技场判断为不开启, 读取不到下一周期的数据：~w",
					   [_Err]),
			     none, 4096, 64, __Levelc_holiday_arena_team_mgr231,
			     __Tracesc_holiday_arena_team_mgr231, lager_event,
			     __Pidc_holiday_arena_team_mgr231);
	    _ -> ok
	  end,
	  {noreply, idle,
	   State#state{ts = Ts, timeout = 86400000, switch = idle}}
    end;
do_state_handle(timeout, check,
		State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_arena_team_mgr236, _,
       {__Levelc_holiday_arena_team_mgr236,
	__Tracesc_holiday_arena_team_mgr236}}
	  when __Levelc_holiday_arena_team_mgr236 band 64 /= 0
		 orelse __Tracesc_holiday_arena_team_mgr236 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_arena_team_mgr},
			{function, do_state_handle}, {line, 236},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动组队竞技场判断是否开启：~w", [State]), none, 4096,
		       64, __Levelc_holiday_arena_team_mgr236,
		       __Tracesc_holiday_arena_team_mgr236, lager_event,
		       __Pidc_holiday_arena_team_mgr236);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    case holiday_arena_team_data:get_period_info(Period) of
      {StartTimeT, EndTimeT} ->
	  Now = date:unixtime(),
	  StartTime = date:parse_time(StartTimeT),
	  EndTime = date:parse_time(EndTimeT),
	  case Now >= StartTime andalso Now < EndTime of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidc_holiday_arena_team_mgr246, _,
		   {__Levelc_holiday_arena_team_mgr246,
		    __Tracesc_holiday_arena_team_mgr246}}
		      when __Levelc_holiday_arena_team_mgr246 band 64 /= 0
			     orelse __Tracesc_holiday_arena_team_mgr246 /= [] ->
		      lager:do_log(info,
				   [{module, c_holiday_arena_team_mgr},
				    {function, do_state_handle}, {line, 246},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "活动组队竞技场判断为在活动开启期间内，进入开启阶段", none, 4096, 64,
				   __Levelc_holiday_arena_team_mgr246,
				   __Tracesc_holiday_arena_team_mgr246,
				   lager_event,
				   __Pidc_holiday_arena_team_mgr246);
		  _ -> ok
		end,
		TimeOut = (EndTime - Now) * 1000,
		sys_env:save(c_holiday_arena_team_state,
			     {Ts, TimeOut, Period, open}),
		cluster_lib:cast(all, holiday_arena_team_mgr, info,
				 [{synv_period_info, open, Period}]),
		{noreply, open,
		 State#state{ts = Ts, timeout = TimeOut, switch = open,
			     period = Period}};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidc_holiday_arena_team_mgr252, _,
		   {__Levelc_holiday_arena_team_mgr252,
		    __Tracesc_holiday_arena_team_mgr252}}
		      when __Levelc_holiday_arena_team_mgr252 band 64 /= 0
			     orelse __Tracesc_holiday_arena_team_mgr252 /= [] ->
		      lager:do_log(info,
				   [{module, c_holiday_arena_team_mgr},
				    {function, do_state_handle}, {line, 252},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("活动组队竞技场判断不在活动开启期间内:~w",
						 [{StartTime, EndTime}]),
				   none, 4096, 64,
				   __Levelc_holiday_arena_team_mgr252,
				   __Tracesc_holiday_arena_team_mgr252,
				   lager_event,
				   __Pidc_holiday_arena_team_mgr252);
		  _ -> ok
		end,
		{noreply, idle,
		 State#state{ts = Ts, timeout = 86400000, switch = idle}}
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
	    {__Pidc_holiday_arena_team_mgr256, _,
	     {__Levelc_holiday_arena_team_mgr256,
	      __Tracesc_holiday_arena_team_mgr256}}
		when __Levelc_holiday_arena_team_mgr256 band 64 /= 0
		       orelse __Tracesc_holiday_arena_team_mgr256 /= [] ->
		lager:do_log(info,
			     [{module, c_holiday_arena_team_mgr},
			      {function, do_state_handle}, {line, 256},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("活动组队竞技场判断为不开启, 读取不到下一周期的数据：~w",
					   [_Err]),
			     none, 4096, 64, __Levelc_holiday_arena_team_mgr256,
			     __Tracesc_holiday_arena_team_mgr256, lager_event,
			     __Pidc_holiday_arena_team_mgr256);
	    _ -> ok
	  end,
	  {noreply, idle,
	   State#state{ts = Ts, timeout = 86400000, switch = idle}}
    end;
do_state_handle(timeout, open,
		State = #state{period = Period}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_arena_team_mgr261, _,
       {__Levelc_holiday_arena_team_mgr261,
	__Tracesc_holiday_arena_team_mgr261}}
	  when __Levelc_holiday_arena_team_mgr261 band 64 /= 0
		 orelse __Tracesc_holiday_arena_team_mgr261 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_arena_team_mgr},
			{function, do_state_handle}, {line, 261},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动组队竞技场进入空闲期：~w", [State]), none, 4096,
		       64, __Levelc_holiday_arena_team_mgr261,
		       __Tracesc_holiday_arena_team_mgr261, lager_event,
		       __Pidc_holiday_arena_team_mgr261);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    TimeOut = 60000 * 30,
    sys_env:save(c_holiday_arena_team_state,
		 {Ts, TimeOut, Period, idle}),
    cluster_lib:cast(all, holiday_arena_team_mgr, info,
		     [{synv_period_info, idle, Period}]),
    {noreply, idle,
     State#state{ts = Ts, timeout = TimeOut, switch = idle,
		 period = Period}};
do_state_handle(_Info, StateName, State) ->
    {noreply, StateName, State}.


