-file("src/mod/holiday_snatch/c_holiday_snatch_mgr.erl",
      1).

-module(c_holiday_snatch_mgr).

-lager_records([{holiday_snatch_log,
		 [log_id, win_num, win_role_info, join_num, max_num,
		  time, award, award_name, ext]},
		{holiday_snatch_role_info,
		 [sid, num, open_srv_time, merge_srvs, ext]},
		{holiday_snatch_info,
		 [pos, round, id, num, num_list, win_num, state,
		  state_time, rand_list, win_role_info, ext]},
		{holiday_snatch, [zone_id, info, ext]},
		{m_holiday_snatch,
		 [ver, camp_id, buy_log, old_data, ext]},
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
		{state, [ts, timeout, switch, period, camp_id]}]).

-behaviour(gen_fsm).

-export([m/0, info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([close/2, open/2]).

-export([get_holiday_snatch/1, init_info/0, init_info/1,
	 update_ets/3, gm_update_role_info/0]).

-record(state,
	{ts = 0, timeout = 0, switch = open, period = 1,
	 camp_id = 0}).

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

-file("src/mod/holiday_snatch/c_holiday_snatch_mgr.erl",
      35).

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

-file("src/mod/holiday_snatch/c_holiday_snatch_mgr.erl",
      36).

-file("inc/holiday_snatch.hrl", 1).

-record(m_holiday_snatch,
	{ver = 1, camp_id = 0, buy_log = [], old_data = [],
	 ext = []}).

-record(holiday_snatch,
	{zone_id = 0, info = [], ext = []}).

-record(holiday_snatch_info,
	{pos = 0, round = 1, id = 0, num = 0, num_list = [],
	 win_num = 0, state = 0, state_time = 0, rand_list = [],
	 win_role_info = #{}, ext = []}).

-record(holiday_snatch_role_info,
	{sid = <<>>, num = 0, open_srv_time = 0,
	 merge_srvs = [], ext = []}).

-record(holiday_snatch_log,
	{log_id = {0, 0}, win_num = 0, win_role_info = #{},
	 join_num = 0, max_num = 0, time = 0, award = [],
	 award_name = <<>>, ext = []}).

-file("src/mod/holiday_snatch/c_holiday_snatch_mgr.erl",
      37).

gm_update_role_info() ->
    case sys_lib:srv_id() == <<"center_7">> of
      false ->
	  big_world_lib:cast(all, holiday_snatch_mgr, info,
			     [update_zone_role_info]);
      _ ->
	  cluster_lib:cast(all, holiday_snatch_mgr, info,
			   [update_zone_role_info])
    end.

-spec
     get_holiday_snatch(pos_integer()) -> #holiday_snatch{}.

get_holiday_snatch(ZoneId) ->
    case catch ets:lookup(c_holiday_snatch_list, ZoneId) of
      [Data = #holiday_snatch{} | _] -> Data;
      _ ->
	  Data = init_zone_info(ZoneId),
	  update_ets(c_holiday_snatch_list, Data, all),
	  Data
    end.

init_zone_info(ZoneId) ->
    #holiday_snatch{zone_id = ZoneId, info = init_info()}.

init_info() ->
    PosList = holiday_snatch_data:all_pos(),
    [init_info(Pos) || Pos <- PosList].

init_info(Pos) ->
    Fid = holiday_snatch_data:get_pos_f_id(Pos),
    RandList = holiday_snatch_data:get_rand_list(Fid),
    {Id, _} = util:rand_list(RandList, 2),
    #holiday_snatch_info{pos = Pos, id = Id,
			 rand_list = do_init_rand_ids(Pos, Id)}.

do_init_rand_ids(Pos, Id) ->
    NeedNum = holiday_snatch_data:get_limit_num(Id) + 50,
    Min = 10000 * Pos + 1,
    Max = 10000 * Pos + 9999,
    rand_num(Min, Max, NeedNum, #{}, []).

rand_num(_Min, _Max, 0, _Maps, L) -> L;
rand_num(Min, Max, NeedNum, Maps, L) ->
    RandNum = util:rand(Min, Max),
    case maps:get(RandNum, Maps, undefined) of
      undefined ->
	  rand_num(Min, Max, NeedNum - 1,
		   Maps#{RandNum => RandNum}, [RandNum | L]);
      _ -> rand_num(Min, Max, NeedNum, Maps, L)
    end.

update_ets(Tab, Data, reset_all) ->
    ets:delete_all_objects(Tab),
    dets:delete_all_objects(Tab),
    update_ets(Tab, Data, ets),
    update_ets(Tab, Data, dets);
update_ets(Tab, Data, all) ->
    update_ets(Tab, Data, ets), update_ets(Tab, Data, dets);
update_ets(Tab, Data, ets) -> ets:insert(Tab, Data);
update_ets(Tab, Data, dets) -> dets:insert(Tab, Data).

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
      {__Pidc_holiday_snatch_mgr113, _,
       {__Levelc_holiday_snatch_mgr113,
	__Tracesc_holiday_snatch_mgr113}}
	  when __Levelc_holiday_snatch_mgr113 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr113 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr}, {function, m},
			{line, 113}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64,
		       __Levelc_holiday_snatch_mgr113,
		       __Tracesc_holiday_snatch_mgr113, lager_event,
		       __Pidc_holiday_snatch_mgr113);
      _ -> ok
    end,
    gen_fsm:send_event(c_holiday_snatch_mgr, timeout).

info(Info) -> c_holiday_snatch_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(c_holiday_snatch_mgr,
				 Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(c_holiday_snatch_mgr,
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
	    {__Pidc_holiday_snatch_mgr126, _,
	     {__Levelc_holiday_snatch_mgr126,
	      __Tracesc_holiday_snatch_mgr126}}
		when __Levelc_holiday_snatch_mgr126 band 8 /= 0 orelse
		       __Tracesc_holiday_snatch_mgr126 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_snatch_mgr}, {function, call},
			      {line, 126}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_holiday_snatch_mgr, Event, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_holiday_snatch_mgr126,
			     __Tracesc_holiday_snatch_mgr126, lager_event,
			     __Pidc_holiday_snatch_mgr126);
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
    gen_fsm:start_link({local, c_holiday_snatch_mgr},
		       c_holiday_snatch_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch_mgr132, _,
       {__Levelc_holiday_snatch_mgr132,
	__Tracesc_holiday_snatch_mgr132}}
	  when __Levelc_holiday_snatch_mgr132 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr132 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr}, {function, init},
			{line, 132}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64, __Levelc_holiday_snatch_mgr132,
		       __Tracesc_holiday_snatch_mgr132, lager_event,
		       __Pidc_holiday_snatch_mgr132);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(c_holiday_snatch_list,
		   [{file, "./dets/c_holiday_snatch_list.dets"},
		    {keypos, #holiday_snatch.zone_id}]),
    ets:new(c_holiday_snatch_list,
	    [set, named_table, public,
	     {keypos, #holiday_snatch.zone_id}]),
    dets:open_file(c_holiday_snatch_role,
		   [{file, "./dets/c_holiday_snatch_role.dets"},
		    {keypos, #holiday_snatch_role_info.sid}]),
    ets:new(c_holiday_snatch_role,
	    [set, named_table, public,
	     {keypos, #holiday_snatch_role_info.sid}]),
    dets:open_file(c_holiday_snatch_zone_info,
		   [{file, "./dets/c_holiday_snatch_zone_info.dets"},
		    {keypos, 1}]),
    ets:new(c_holiday_snatch_zone_info,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(c_holiday_snatch_srv_info,
		   [{file, "./dets/c_holiday_snatch_srv_info.dets"},
		    {keypos, 1}]),
    ets:new(c_holiday_snatch_srv_info,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(c_holiday_snatch_zone_log,
		   [{file, "./dets/c_holiday_snatch_zone_log.dets"},
		    {keypos, 1}]),
    ets:new(c_holiday_snatch_zone_log,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(c_holiday_snatch_other,
		   [{file, "./dets/c_holiday_snatch_other.dets"},
		    {keypos, 1}]),
    ets:new(c_holiday_snatch_other,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(c_holiday_snatch_pids,
	    [set, named_table, public, {keypos, 1}]),
    ets:from_dets(c_holiday_snatch_role,
		  c_holiday_snatch_role),
    ets:from_dets(c_holiday_snatch_list,
		  c_holiday_snatch_list),
    ets:from_dets(c_holiday_snatch_zone_info,
		  c_holiday_snatch_zone_info),
    ets:from_dets(c_holiday_snatch_srv_info,
		  c_holiday_snatch_srv_info),
    ets:from_dets(c_holiday_snatch_other,
		  c_holiday_snatch_other),
    ets:from_dets(c_holiday_snatch_zone_log,
		  c_holiday_snatch_zone_log),
    Ms = date:unixtime(ms),
    {Ts, TimeOut, NewPeriod, Switch, CampId} = case
						 sys_env:get(c_holiday_snatch_state)
						   of
						 {TsT, TimeOutT, NewPeriodT,
						  StateT, CampIdT} ->
						     {TsT, TimeOutT, NewPeriodT,
						      StateT, CampIdT};
						 _ ->
						     OpenTime =
							 holiday_snatch_data:get_constant(holiday_open_time),
						     TimeOutT =
							 date:next_diff(OpenTime),
						     {Ms, TimeOutT * 1000, 1,
						      close, 0}
					       end,
    case sys_env:get(c_holiday_snatch_camp) of
      {_, close} ->
	  sys_env:save(c_holiday_snatch_state,
		       {Ts, TimeOut, NewPeriod, close, CampId}),
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
	    {__Pidc_holiday_snatch_mgr177, _,
	     {__Levelc_holiday_snatch_mgr177,
	      __Tracesc_holiday_snatch_mgr177}}
		when __Levelc_holiday_snatch_mgr177 band 64 /= 0 orelse
		       __Tracesc_holiday_snatch_mgr177 /= [] ->
		lager:do_log(info,
			     [{module, c_holiday_snatch_mgr}, {function, init},
			      {line, 177}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "启动完成", none, 4096, 64,
			     __Levelc_holiday_snatch_mgr177,
			     __Tracesc_holiday_snatch_mgr177, lager_event,
			     __Pidc_holiday_snatch_mgr177);
	    _ -> ok
	  end,
	  {ok, close, State, max(1, Ts + TimeOut - Ms)};
      _ ->
	  do_init(),
	  sys_env:save(c_holiday_snatch_state,
		       {Ts, TimeOut, NewPeriod, Switch, CampId}),
	  State = #state{ts = Ts, timeout = TimeOut,
			 switch = Switch, period = NewPeriod, camp_id = CampId},
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_holiday_snatch_mgr183, _,
	     {__Levelc_holiday_snatch_mgr183,
	      __Tracesc_holiday_snatch_mgr183}}
		when __Levelc_holiday_snatch_mgr183 band 64 /= 0 orelse
		       __Tracesc_holiday_snatch_mgr183 /= [] ->
		lager:do_log(info,
			     [{module, c_holiday_snatch_mgr}, {function, init},
			      {line, 183}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "启动完成", none, 4096, 64,
			     __Levelc_holiday_snatch_mgr183,
			     __Tracesc_holiday_snatch_mgr183, lager_event,
			     __Pidc_holiday_snatch_mgr183);
	    _ -> ok
	  end,
	  {ok, Switch, State, max(1, Ts + TimeOut - Ms)}
    end.

do_init() ->
    Fun = fun (Data) ->
		  {ok, _Pid} = c_holiday_snatch:start_link(Data), continue
	  end,
    dets:traverse(c_holiday_snatch_list, Fun).

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok, continue(StateName, Reply, State).

handle_info({switch, S}, StateName, State)
    when S =:= open orelse S =:= close ->
    continue(StateName, State#state{switch = S});
handle_info({update_zone_role_info,
	     {SrvId, Num, OPenTime, MergeList}},
	    StateName, State) ->
    Info = #holiday_snatch_role_info{sid = SrvId, num = Num,
				     open_srv_time = OPenTime,
				     merge_srvs = MergeList},
    update_ets(c_holiday_snatch_role, Info, all),
    ZoneId = c_holiday_snatch_lib:get_zone_id(SrvId),
    case ZoneId > 0 of
      true ->
	  update_ets(c_holiday_snatch_srv_info, {SrvId, ZoneId},
		     all);
      _ -> ok
    end,
    continue(StateName, State);
handle_info(star_all_zone, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch_mgr218, _,
       {__Levelc_holiday_snatch_mgr218,
	__Tracesc_holiday_snatch_mgr218}}
	  when __Levelc_holiday_snatch_mgr218 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr218 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr},
			{function, handle_info}, {line, 218},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动手动执行重新分组", []), none, 4096, 64,
		       __Levelc_holiday_snatch_mgr218,
		       __Tracesc_holiday_snatch_mgr218, lager_event,
		       __Pidc_holiday_snatch_mgr218);
      _ -> ok
    end,
    Pids = ets:tab2list(c_holiday_snatch_pids),
    [Pid ! {stop, normal} || {Pid, _} <- Pids],
    ets:delete_all_objects(c_holiday_snatch_list),
    dets:delete_all_objects(c_holiday_snatch_list),
    ets:delete_all_objects(c_holiday_snatch_pids),
    MaxZoneId = c_holiday_snatch_lib:calc_zone(),
    start_all_zone(MaxZoneId),
    big_world_lib:cast(center_all, holiday_snatch_mgr, info,
		       [{sync_data, big_world}]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch_mgr229, _,
       {__Levelc_holiday_snatch_mgr229,
	__Tracesc_holiday_snatch_mgr229}}
	  when __Levelc_holiday_snatch_mgr229 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr229 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr},
			{function, handle_info}, {line, 229},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动手动执行重新分组完成", []), none, 4096, 64,
		       __Levelc_holiday_snatch_mgr229,
		       __Tracesc_holiday_snatch_mgr229, lager_event,
		       __Pidc_holiday_snatch_mgr229);
      _ -> ok
    end,
    continue(StateName, State);
handle_info({holiday_reset, CampId}, StateName,
	    State = #state{camp_id = CampId}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch_mgr234, _,
       {__Levelc_holiday_snatch_mgr234,
	__Tracesc_holiday_snatch_mgr234}}
	  when __Levelc_holiday_snatch_mgr234 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr234 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr},
			{function, handle_info}, {line, 234},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动重载后，没变化~w", [CampId]), none, 4096, 64,
		       __Levelc_holiday_snatch_mgr234,
		       __Tracesc_holiday_snatch_mgr234, lager_event,
		       __Pidc_holiday_snatch_mgr234);
      _ -> ok
    end,
    continue(StateName, State);
handle_info({holiday_reset, CampId}, StateName,
	    State = #state{}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch_mgr238, _,
       {__Levelc_holiday_snatch_mgr238,
	__Tracesc_holiday_snatch_mgr238}}
	  when __Levelc_holiday_snatch_mgr238 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr238 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr},
			{function, handle_info}, {line, 238},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动重载后，处理新的活动~w",
				     [{CampId, State#state.camp_id}]),
		       none, 4096, 64, __Levelc_holiday_snatch_mgr238,
		       __Tracesc_holiday_snatch_mgr238, lager_event,
		       __Pidc_holiday_snatch_mgr238);
      _ -> ok
    end,
    Pids = ets:tab2list(c_holiday_snatch_pids),
    [Pid ! {stop, normal} || {Pid, _} <- Pids],
    ets:delete_all_objects(c_holiday_snatch_list),
    dets:delete_all_objects(c_holiday_snatch_list),
    ets:delete_all_objects(c_holiday_snatch_zone_info),
    dets:delete_all_objects(c_holiday_snatch_zone_info),
    ets:delete_all_objects(c_holiday_snatch_zone_log),
    dets:delete_all_objects(c_holiday_snatch_zone_log),
    ets:delete_all_objects(c_holiday_snatch_srv_info),
    dets:delete_all_objects(c_holiday_snatch_srv_info),
    ets:delete_all_objects(c_holiday_snatch_pids),
    MaxZoneId = c_holiday_snatch_lib:calc_zone(),
    start_all_zone(MaxZoneId),
    {Ts, TimeOut, Period, Status, _} =
	sys_env:get(c_holiday_snatch_state),
    sys_env:save(c_holiday_snatch_state,
		 {Ts, TimeOut, Period, Status, CampId}),
    continue(StateName, State#state{camp_id = CampId});
handle_info({sync_data, Sid, FromPid}, StateName,
	    State) ->
    Type = case sys_lib:srv_id() == <<"center_7">> of
	     false -> big_world;
	     _ -> cluster
	   end,
    ZoneId = c_holiday_snatch_lib:get_zone_id(Sid),
    ZonePid = c_holiday_snatch_lib:get_pid(ZoneId),
    {Ts, TimeOut, _, _, _} =
	sys_env:get(c_holiday_snatch_state),
    FromPid !
      {sync_status_to_zone, StateName, Ts, TimeOut, ZonePid,
       Type},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch_mgr275, _,
       {__Levelc_holiday_snatch_mgr275,
	__Tracesc_holiday_snatch_mgr275}}
	  when __Levelc_holiday_snatch_mgr275 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr275 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr},
			{function, handle_info}, {line, 275},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]同步了活动数据， ZoneId:~w, zone_pid:~w",
				     [Sid, ZoneId, ZonePid]),
		       none, 4096, 64, __Levelc_holiday_snatch_mgr275,
		       __Tracesc_holiday_snatch_mgr275, lager_event,
		       __Pidc_holiday_snatch_mgr275);
      _ -> ok
    end,
    continue(StateName, State);
handle_info(sync_status_to_zone, StateName, State) ->
    {Ts, TimeOut, _, _, _} =
	sys_env:get(c_holiday_snatch_state),
    case sys_lib:srv_id() == <<"center_7">> of
      false ->
	  big_world_lib:cast(all, holiday_snatch_mgr, info,
			     [{sync_status_to_zone2, StateName, Ts, TimeOut,
			       big_world}]);
      _ ->
	  cluster_lib:cast(all, holiday_snatch_mgr, info,
			   [{sync_status_to_zone2, StateName, Ts, TimeOut,
			     cluster}])
    end,
    continue(StateName, State);
handle_info({'EXIT', Pid, Reason}, StateName, State)
    when Reason =/= normal ->
    case ets:lookup(c_holiday_snatch_pids, Pid) of
      [{Pid, ZoneId}] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_holiday_snatch_mgr291, _,
	     {__Levelc_holiday_snatch_mgr291,
	      __Tracesc_holiday_snatch_mgr291}}
		when __Levelc_holiday_snatch_mgr291 band 8 /= 0 orelse
		       __Tracesc_holiday_snatch_mgr291 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_snatch_mgr},
			      {function, handle_info}, {line, 291},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("接收到夺宝活动异常退出信息:~w ~w",
					   [ZoneId, Reason]),
			     none, 4096, 8, __Levelc_holiday_snatch_mgr291,
			     __Tracesc_holiday_snatch_mgr291, lager_event,
			     __Pidc_holiday_snatch_mgr291);
	    _ -> ok
	  end,
	  ets:delete(c_holiday_snatch_pids, Pid),
	  case c_holiday_snatch:start_link(ZoneId) of
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
		  {__Pidc_holiday_snatch_mgr295, _,
		   {__Levelc_holiday_snatch_mgr295,
		    __Tracesc_holiday_snatch_mgr295}}
		      when __Levelc_holiday_snatch_mgr295 band 8 /= 0 orelse
			     __Tracesc_holiday_snatch_mgr295 /= [] ->
		      lager:do_log(error,
				   [{module, c_holiday_snatch_mgr},
				    {function, handle_info}, {line, 295},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("重启夺宝活动进程失败:~w ~w",
						 [ZoneId, _Err]),
				   none, 4096, 8,
				   __Levelc_holiday_snatch_mgr295,
				   __Tracesc_holiday_snatch_mgr295, lager_event,
				   __Pidc_holiday_snatch_mgr295);
		  _ -> ok
		end
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
	    {__Pidc_holiday_snatch_mgr298, _,
	     {__Levelc_holiday_snatch_mgr298,
	      __Tracesc_holiday_snatch_mgr298}}
		when __Levelc_holiday_snatch_mgr298 band 8 /= 0 orelse
		       __Tracesc_holiday_snatch_mgr298 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_snatch_mgr},
			      {function, handle_info}, {line, 298},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("接收到夺宝活动异常退出信息 不能重启, 原因:~w :~w ",
					   [Reason, _Err]),
			     none, 4096, 8, __Levelc_holiday_snatch_mgr298,
			     __Tracesc_holiday_snatch_mgr298, lager_event,
			     __Pidc_holiday_snatch_mgr298);
	    _ -> ok
	  end
    end,
    continue(StateName, State);
handle_info(_Info, StateName, State) ->
    continue(StateName, State).

terminate(_Reason, _StateName, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch_mgr306, _,
       {__Levelc_holiday_snatch_mgr306,
	__Tracesc_holiday_snatch_mgr306}}
	  when __Levelc_holiday_snatch_mgr306 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr306 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr}, {function, terminate},
			{line, 306}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64, __Levelc_holiday_snatch_mgr306,
		       __Tracesc_holiday_snatch_mgr306, lager_event,
		       __Pidc_holiday_snatch_mgr306);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch_mgr307, _,
       {__Levelc_holiday_snatch_mgr307,
	__Tracesc_holiday_snatch_mgr307}}
	  when __Levelc_holiday_snatch_mgr307 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr307 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr}, {function, terminate},
			{line, 307}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_holiday_snatch_mgr307,
		       __Tracesc_holiday_snatch_mgr307, lager_event,
		       __Pidc_holiday_snatch_mgr307);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

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

close(timeout,
      State = #state{period = Period, camp_id = CampId}) ->
    Ts = date:unixtime(ms),
    TimeOut =
	date:next_diff(holiday_snatch_data:get_constant(holiday_close_time))
	  * 1000,
    sys_env:save(c_holiday_snatch_state,
		 {Ts, TimeOut, Period, open, CampId}),
    self() ! sync_status_to_zone,
    Pids = ets:tab2list(c_holiday_snatch_pids),
    [Pid ! open || {Pid, _} <- Pids],
    continue(open, State#state{ts = Ts, timeout = TimeOut});
close(_Any, State) -> continue(close, State).

open(timeout,
     State = #state{period = Period, camp_id = CampId}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch_mgr340, _,
       {__Levelc_holiday_snatch_mgr340,
	__Tracesc_holiday_snatch_mgr340}}
	  when __Levelc_holiday_snatch_mgr340 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch_mgr340 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch_mgr}, {function, open},
			{line, 340}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("勇者夺宝进入第~w期结束", [Period]), none, 4096, 64,
		       __Levelc_holiday_snatch_mgr340,
		       __Tracesc_holiday_snatch_mgr340, lager_event,
		       __Pidc_holiday_snatch_mgr340);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    TimeOut =
	date:next_diff(holiday_snatch_data:get_constant(holiday_open_time))
	  * 1000,
    sys_env:save(c_holiday_snatch_state,
		 {Ts, TimeOut, Period + 1, close, CampId}),
    self() ! sync_status_to_zone,
    Pids = ets:tab2list(c_holiday_snatch_pids),
    [Pid ! close || {Pid, _} <- Pids],
    continue(close,
	     State#state{ts = Ts, timeout = TimeOut});
open(_Any, State) -> continue(open, State).

start_all_zone(MaxZoneId) when MaxZoneId =< 0 -> ok;
start_all_zone(MaxZoneId) ->
    c_holiday_snatch:start_link(MaxZoneId),
    start_all_zone(MaxZoneId - 1).


