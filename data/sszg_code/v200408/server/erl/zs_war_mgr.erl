-file("src/mod/zs_war/zs_war_mgr.erl", 1).

-module(zs_war_mgr).

-lager_records([{activity,
		 [id, status, name, data, ext_args]},
		{zs_war_guard_data,
		 [id, camp, bid, pos_x, pos_y, max_hp, diff_hp,
		  role_attr, camp_attr, time, cd]},
		{zs_war_skill_data,
		 [id, camp, name, cd, free, loss, effect]},
		{zs_war_guard,
		 [id, camp, bid, pos_x, pos_y, status, hp, max_hp]},
		{zs_war_zone, [group, zone, num, pid]},
		{zs_war_role,
		 [id, pid, name, zone_pid, zone_id, gid, gname, group,
		  camp, lev, sex, face, avatar_id, lookid, power,
		  max_power, arena_rank, pos_x, pos_y, score, num, win,
		  win_acc, win_best, lose, lose_acc, draw, status, effect,
		  move_num, move_cd_time, combat_cd_time, combat_role_id,
		  start_time, formation_type, pos_info, partner_hp, in_ui,
		  skill_list, skill_effect, is_robot, robot_id, items,
		  cnum_list, win_list]},
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
		{state, [ts, timeout, type, is_main, switch]}]).

-behaviour(gen_fsm).

-export([zero_update/1, m/0, get_server/0, check_type/0,
	 info/1, info/2, cast/1, cast/2, call/1, call/2,
	 start_link/0]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2, pre/2, match/2, stat/2]).

-record(state,
	{ts = 0, timeout = 0, type = 0, is_main = false,
	 switch = close}).

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

-file("src/mod/zs_war/zs_war_mgr.erl", 33).

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

-file("src/mod/zs_war/zs_war_mgr.erl", 34).

-file("inc/zs_war.hrl", 1).

-record(zs_war_role,
	{id = {0, <<>>}  :: {non_neg_integer(), bitstring()},
	 pid = 0  :: 0 | pid(), name = <<>>  :: bitstring(),
	 zone_pid = 0  :: 0 | pid(),
	 zone_id = 0  :: non_neg_integer(),
	 gid = {0, <<>>}  :: {non_neg_integer(), bitstring()},
	 gname = <<>>  :: bitstring(),
	 group = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), sex = 0  :: 0..2,
	 face = 0  :: non_neg_integer(),
	 avatar_id = 0  :: non_neg_integer(),
	 lookid = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 max_power = 0  :: non_neg_integer(),
	 arena_rank = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 score = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 win = 0  :: non_neg_integer(),
	 win_acc = 0  :: non_neg_integer(),
	 win_best = 0  :: non_neg_integer(),
	 lose = 0  :: non_neg_integer(),
	 lose_acc = 0  :: non_neg_integer(),
	 draw = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 effect = 0  :: non_neg_integer(),
	 move_num = 0  :: non_neg_integer(),
	 move_cd_time = 0  :: non_neg_integer(),
	 combat_cd_time = 0  :: non_neg_integer(),
	 combat_role_id = {0, <<>>}  :: tuple(),
	 start_time = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 pos_info = []  :: list(), partner_hp = []  :: list(),
	 in_ui = 0  :: 0..1, skill_list = []  :: list(),
	 skill_effect = []  :: list(), is_robot = 0  :: 0..1,
	 robot_id = 0  :: non_neg_integer(),
	 items = []  :: list(), cnum_list = []  :: list(),
	 win_list = []  :: list()}).

-record(zs_war_zone,
	{group = 0  :: non_neg_integer(),
	 zone = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(), pid = 0  :: pid()}).

-record(zs_war_guard,
	{id = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 max_hp = 0  :: non_neg_integer()}).

-record(zs_war_skill_data,
	{id = 0  :: non_neg_integer(), camp = 1  :: 1..2,
	 name = <<>>  :: bitstring(),
	 cd = 0  :: non_neg_integer(),
	 free = 0  :: non_neg_integer(), loss = []  :: list(),
	 effect = []  :: list()}).

-record(zs_war_guard_data,
	{id = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 max_hp = 0  :: non_neg_integer(),
	 diff_hp = 0  :: non_neg_integer(),
	 role_attr = []  :: list(), camp_attr = []  :: list(),
	 time = 0  :: non_neg_integer(),
	 cd = 0  :: non_neg_integer()}).

-file("src/mod/zs_war/zs_war_mgr.erl", 35).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/zs_war/zs_war_mgr.erl", 36).

-spec get_server() -> atom() | {node(), atom()}.

get_server() ->
    case check_type() of
      {false, 2} ->
	  case cluster_group:group_main_node() of
	    undefined -> zs_war_mgr;
	    MainNode -> {zs_war_mgr, MainNode}
	  end;
      _ -> zs_war_mgr
    end.

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
      {__Pidzs_war_mgr52, _,
       {__Levelzs_war_mgr52, __Traceszs_war_mgr52}}
	  when __Levelzs_war_mgr52 band 64 /= 0 orelse
		 __Traceszs_war_mgr52 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, m}, {line, 52},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64, __Levelzs_war_mgr52,
		       __Traceszs_war_mgr52, lager_event, __Pidzs_war_mgr52);
      _ -> ok
    end,
    case check_type() of
      {false, 1} -> gen_fsm:send_event(zs_war_mgr, timeout);
      {true, 2} ->
	  cluster_group:group_cast(gen_fsm, send_event,
				   [zs_war_mgr, timeout]);
      {false, 2} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war_mgr57, _,
	     {__Levelzs_war_mgr57, __Traceszs_war_mgr57}}
		when __Levelzs_war_mgr57 band 64 /= 0 orelse
		       __Traceszs_war_mgr57 /= [] ->
		lager:do_log(info,
			     [{module, zs_war_mgr}, {function, m}, {line, 57},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "非主服信息，不处理", none, 4096, 64, __Levelzs_war_mgr57,
			     __Traceszs_war_mgr57, lager_event,
			     __Pidzs_war_mgr57);
	    _ -> ok
	  end
    end.

info(Info) -> info(get_server(), Info).

info(Server, Info) -> Server ! Info.

cast(Event) -> cast(get_server(), Event).

cast(Server, Event) ->
    gen_fsm:send_all_state_event(Server, Event).

call(Event) -> call(get_server(), Event).

call(Server, Event) ->
    case catch gen_fsm:sync_send_all_state_event(Server,
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
	    {__Pidzs_war_mgr76, _,
	     {__Levelzs_war_mgr76, __Traceszs_war_mgr76}}
		when __Levelzs_war_mgr76 band 8 /= 0 orelse
		       __Traceszs_war_mgr76 /= [] ->
		lager:do_log(error,
			     [{module, zs_war_mgr}, {function, call},
			      {line, 76}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [Server, Event, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelzs_war_mgr76,
			     __Traceszs_war_mgr76, lager_event,
			     __Pidzs_war_mgr76);
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
    gen_fsm:start_link({local, zs_war_mgr}, zs_war_mgr, [],
		       []).

zero_update(WeekNum) ->
    zs_war_mgr ! {zero_update, WeekNum}.

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_mgr86, _,
       {__Levelzs_war_mgr86, __Traceszs_war_mgr86}}
	  when __Levelzs_war_mgr86 band 64 /= 0 orelse
		 __Traceszs_war_mgr86 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, init}, {line, 86},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64, __Levelzs_war_mgr86,
		       __Traceszs_war_mgr86, lager_event, __Pidzs_war_mgr86);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    Week = date:day_of_the_week(),
    IdelTimeout = next_time(Week) * 1000,
    put(role_list, []),
    put(zone_list, []),
    ets:new(zs_war_role,
	    [set, named_table, public, {keypos, 1}]),
    State = #state{ts = date:now(), timeout = IdelTimeout,
		   type = 1},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_mgr94, _,
       {__Levelzs_war_mgr94, __Traceszs_war_mgr94}}
	  when __Levelzs_war_mgr94 band 64 /= 0 orelse
		 __Traceszs_war_mgr94 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, init}, {line, 94},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "启动完成", none, 4096, 64, __Levelzs_war_mgr94,
		       __Traceszs_war_mgr94, lager_event, __Pidzs_war_mgr94);
      _ -> ok
    end,
    {ok, idle, State, IdelTimeout}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok, continue(StateName, Reply, State).

handle_info({sign_status, RoleId, ConnPid}, StateName,
	    State) ->
    Status = case StateName of
	       pre ->
		   util:if_true(lists:keymember(RoleId, #zs_war_role.id,
						get(role_list)),
				1, 0);
	       match ->
		   util:if_true(ets:member(zs_war_role, RoleId), 2, 0);
	       _ -> 0
	     end,
    sys_conn:pack_send(ConnPid, 21403, {Status}),
    continue(StateName, State);
handle_info({sign, ZsRole}, StateName = pre,
	    State = #state{type = 2, is_main = false}) ->
    cluster_group:cast_main(zs_war_mgr, info,
			    [{sign, ZsRole}]),
    continue(StateName, State);
handle_info({sign,
	     ZsRole = #zs_war_role{id = RoleId, pid = RolePid,
				   group = Group}},
	    StateName = pre, State) ->
    case lists:keyfind(RoleId, #zs_war_role.id,
		       get(role_list))
	of
      false ->
	  #{min_lev := MinLev, max_lev := MaxLev,
	    name := GroupName} =
	      zs_war_data:group_data(Group),
	  role:pack_send(proxy, RolePid, 21401,
			 {1,
			  util:fbin(lang:get(<<"成功报名~w-~w等级段~ts战场"/utf8>>),
				    [MinLev, MaxLev, GroupName])}),
	  put(role_list, [ZsRole | get(role_list)]);
      _ ->
	  role:pack_send(proxy, RolePid, 21401,
			 {1, lang:get(<<"已经报名过啦"/utf8>>)}),
	  put(role_list,
	      lists:keyreplace(RoleId, #zs_war_role.id,
			       get(role_list), ZsRole))
    end,
    continue(StateName, State);
handle_info({sign, ZsRole = #zs_war_role{id = RoleId}},
	    StateName = match, State) ->
    case ets:lookup(zs_war_role, RoleId) of
      [{_, ZonePid}] ->
	  zs_war_zone:info(ZonePid, {enter, ZsRole});
      _ -> find_zone_enter(ZsRole, State)
    end,
    continue(StateName, State);
handle_info({sign, #zs_war_role{pid = RolePid}},
	    StateName, State) ->
    notice:alert({role_pid, RolePid},
		 lang:get(<<"当前阶段不能报名"/utf8>>)),
    continue(StateName, State);
handle_info({zero_update, Week}, StateName, State) ->
    IdelTimeout = next_time(Week) * 1000,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_mgr144, _,
       {__Levelzs_war_mgr144, __Traceszs_war_mgr144}}
	  when __Levelzs_war_mgr144 band 64 /= 0 orelse
		 __Traceszs_war_mgr144 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, handle_info},
			{line, 144}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("0点处理活动开启时间,week~w, timeout=~w",
				     [Week, IdelTimeout]),
		       none, 4096, 64, __Levelzs_war_mgr144,
		       __Traceszs_war_mgr144, lager_event, __Pidzs_war_mgr144);
      _ -> ok
    end,
    continue(StateName,
	     State#state{timeout = IdelTimeout, ts = date:now()});
handle_info({switch, S}, StateName, State)
    when S =:= open orelse S =:= close ->
    continue(StateName, State#state{switch = S});
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
      {__Pidzs_war_mgr155, _,
       {__Levelzs_war_mgr155, __Traceszs_war_mgr155}}
	  when __Levelzs_war_mgr155 band 64 /= 0 orelse
		 __Traceszs_war_mgr155 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, terminate},
			{line, 155}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64, __Levelzs_war_mgr155,
		       __Traceszs_war_mgr155, lager_event, __Pidzs_war_mgr155);
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
      {__Pidzs_war_mgr156, _,
       {__Levelzs_war_mgr156, __Traceszs_war_mgr156}}
	  when __Levelzs_war_mgr156 band 64 /= 0 orelse
		 __Traceszs_war_mgr156 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, terminate},
			{line, 156}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelzs_war_mgr156,
		       __Traceszs_war_mgr156, lager_event, __Pidzs_war_mgr156);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

continue(StateName,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    {next_state, StateName, State,
     date:time_left(Timeout, Ts)}.

continue(StateName, Reply,
	 State = #state{ts = Ts, timeout = Timeout}) ->
    {reply, Reply, StateName, State,
     date:time_left(Timeout, Ts)}.

idle(timeout, State = #state{switch = close}) ->
    continue(idel,
	     State#state{ts = date:now(), timeout = 86400000});
idle(timeout, State) ->
    {IsMain, Type} = check_type(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_mgr177, _,
       {__Levelzs_war_mgr177, __Traceszs_war_mgr177}}
	  when __Levelzs_war_mgr177 band 64 /= 0 orelse
		 __Traceszs_war_mgr177 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, idle}, {line, 177},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("进入准备状态, ismain:~w type:~w timeout=~w",
				     [IsMain, Type,
				      zs_war_data:get_const(pre_time)]),
		       none, 4096, 64, __Levelzs_war_mgr177,
		       __Traceszs_war_mgr177, lager_event, __Pidzs_war_mgr177);
      _ -> ok
    end,
    put(role_list, []),
    put(zone_list, []),
    ets:delete_all_objects(zs_war_role),
    Now = date:unixtime(),
    activity_global:set_and_push(18, 1,
				 [Now + zs_war_data:get_const(pre_time)]),
    notice:broadcast(world, undefined, rumor,
		     color:msg(lang:get(<<"众神战场~w分钟后将开启，请冒险者速度前往报名!~ts"/utf8>>),
			       [zs_war_data:get_const(pre_time) div 60,
				{href,
				 {41, green, [],
				  lang:get(<<"【我要挑战】"/utf8>>)}}])),
    continue(pre,
	     State#state{ts = date:now(),
			 timeout = zs_war_data:get_const(pre_time) * 1000,
			 type = Type, is_main = IsMain});
idle(_Any, State) -> continue(idle, State).

pre(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_mgr190, _,
       {__Levelzs_war_mgr190, __Traceszs_war_mgr190}}
	  when __Levelzs_war_mgr190 band 64 /= 0 orelse
		 __Traceszs_war_mgr190 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, pre}, {line, 190},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "进入正式状态", none, 4096, 64, __Levelzs_war_mgr190,
		       __Traceszs_war_mgr190, lager_event, __Pidzs_war_mgr190);
      _ -> ok
    end,
    Now = date:unixtime(),
    activity_global:set_and_push(18, 2,
				 [Now + zs_war_data:get_const(match_time)]),
    start_zone(State),
    notice:broadcast(world, undefined, rumor,
		     color:msg(lang:get(<<"众神战场现在开启，未报名玩家可点击图标直接参与玩法~ts"/utf8>>),
			       [{href,
				 {41, green, [],
				  lang:get(<<"【我要挑战】"/utf8>>)}}])),
    continue(match,
	     State#state{ts = date:now(),
			 timeout = zs_war_data:get_const(match_time) * 1000});
pre(_Any, State) -> continue(pre, State).

match(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_mgr201, _,
       {__Levelzs_war_mgr201, __Traceszs_war_mgr201}}
	  when __Levelzs_war_mgr201 band 64 /= 0 orelse
		 __Traceszs_war_mgr201 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, match}, {line, 201},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "进入结算状态", none, 4096, 64, __Levelzs_war_mgr201,
		       __Traceszs_war_mgr201, lager_event, __Pidzs_war_mgr201);
      _ -> ok
    end,
    activity_global:set_and_push(18, 0, [0]),
    ets:delete_all_objects(zs_war_role),
    [zs_war_zone:info(ZonePid, {stop, timeover})
     || #zs_war_zone{pid = ZonePid} <- get(zone_list)],
    continue(stat,
	     State#state{ts = date:now(), timeout = 1000});
match(_Any, State) -> continue(match, State).

stat(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war_mgr211, _,
       {__Levelzs_war_mgr211, __Traceszs_war_mgr211}}
	  when __Levelzs_war_mgr211 band 64 /= 0 orelse
		 __Traceszs_war_mgr211 /= [] ->
	  lager:do_log(info,
		       [{module, zs_war_mgr}, {function, stat}, {line, 211},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "回到空闲状态", none, 4096, 64, __Levelzs_war_mgr211,
		       __Traceszs_war_mgr211, lager_event, __Pidzs_war_mgr211);
      _ -> ok
    end,
    put(role_list, []),
    put(zone_list, []),
    role_group:pack_send(world, 21403, {0}),
    Week = date:day_of_the_week(),
    NextTime = next_time(Week) * 1000,
    continue(idle,
	     State#state{ts = date:now(), timeout = NextTime});
stat(_Any, State) -> continue(stat, State).

next_time(WeekNum) ->
    OpenDay = date:open_srv_day(),
    OpenLimit = zs_war_data:get_const(limit_day),
    case OpenDay >= OpenLimit of
      true ->
	  case lists:member(WeekNum,
			    zs_war_data:get_const(week_days))
	      of
	    true ->
		date:next_diff(zs_war_data:get_const(start_time));
	    _ -> 864000
	  end;
      _ -> 864000
    end.

start_zone(State) ->
    RL = get(role_list), start_group(RL, State).

start_group([], _State) -> ok;
start_group([R = #zs_war_role{group = Group} | T],
	    State) ->
    {T1, T2} = lists:partition(fun (#zs_war_role{group =
						     Group1}) ->
				       Group =:= Group1
			       end,
			       T),
    NewRL = util:keys_sort([#zs_war_role.max_power],
			   [R | T1]),
    start_group_zone(Group, 1, State, NewRL),
    start_group(T2, State).

start_group_zone(_Group, _Zone, _State, []) -> ok;
start_group_zone(Group, Zone,
		 State = #state{type = Type}, RL) ->
    MaxNum = zs_war_data:get_const(zone_real),
    {L1, L2} = list_util:split(MaxNum, RL),
    {AL, BL} = split_camp(L1, 1, [], []),
    case zs_war_zone:start(#{group => Group, zone => Zone,
			     a_list => AL, b_list => BL, type => Type})
	of
      {ok, ZonePid} ->
	  [set_zone(RoleId, ZonePid)
	   || #zs_war_role{id = RoleId} <- L1],
	  put(zone_list,
	      [#zs_war_zone{group = Group, zone = Zone,
			    num = length(L1), pid = ZonePid}
	       | get(zone_list)]);
      ERR ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war_mgr263, _,
	     {__Levelzs_war_mgr263, __Traceszs_war_mgr263}}
		when __Levelzs_war_mgr263 band 8 /= 0 orelse
		       __Traceszs_war_mgr263 /= [] ->
		lager:do_log(error,
			     [{module, zs_war_mgr},
			      {function, start_group_zone}, {line, 263},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("启动战区失败:group:~w zone:~w err:~w",
					   [Group, Zone, ERR]),
			     none, 4096, 8, __Levelzs_war_mgr263,
			     __Traceszs_war_mgr263, lager_event,
			     __Pidzs_war_mgr263);
	    _ -> ok
	  end
    end,
    start_group_zone(Group, Zone + 1, State, L2).

split_camp([], _N, A, B) ->
    case util:rand(1, 2) of
      1 -> {A, B};
      _ -> {B, A}
    end;
split_camp([R1, R2 | T], N, A, B) ->
    split_camp(T, N + 1, [R2 | B], [R1 | A]);
split_camp([R | T], N, A, B) ->
    split_camp(T, N + 1, B, [R | A]).

find_zone_enter(ZsRole = #zs_war_role{id = RoleId,
				      group = Group, pid = RolePid},
		State) ->
    MaxNum = zs_war_data:get_const(zone_max),
    case [Z
	  || Z = #zs_war_zone{group = Group1} <- get(zone_list),
	     Group =:= Group1]
	of
      [] ->
	  role:pack_send(proxy, RolePid, 21401,
			 {1, lang:get(<<"报名成功"/utf8>>)}),
	  start_group_zone(Group, 1, State, [ZsRole]);
      L ->
	  MaxNum = zs_war_data:get_const(zone_max),
	  case [Z
		|| Z = #zs_war_zone{num = Num} <- L, Num < MaxNum]
	      of
	    [] ->
		role:pack_send(proxy, RolePid, 21401,
			       {1, lang:get(<<"报名成功"/utf8>>)}),
		start_group_zone(Group, length(L) + 1, State, [ZsRole]);
	    [Zone = #zs_war_zone{pid = ZonePid, num = Num} | _] ->
		NewZone = Zone#zs_war_zone{num = Num + 1},
		put(zone_list,
		    lists:keyreplace(ZonePid, #zs_war_zone.pid,
				     get(zone_list), NewZone)),
		set_zone(RoleId, ZonePid),
		zs_war_zone:info(ZonePid, {enter, ZsRole})
	  end
    end.

check_type() ->
    case sys_env:get(group_id) of
      0 -> {false, 1};
      _ ->
	  case cluster_group:has_main() of
	    true -> {cluster_group:is_main(), 2};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidzs_war_mgr308, _,
		   {__Levelzs_war_mgr308, __Traceszs_war_mgr308}}
		      when __Levelzs_war_mgr308 band 8 /= 0 orelse
			     __Traceszs_war_mgr308 /= [] ->
		      lager:do_log(error,
				   [{module, zs_war_mgr},
				    {function, check_type}, {line, 308},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("查找不到主服信息,开本服活动", []), none,
				   4096, 8, __Levelzs_war_mgr308,
				   __Traceszs_war_mgr308, lager_event,
				   __Pidzs_war_mgr308);
		  _ -> ok
		end,
		{false, 1}
	  end
    end.

set_zone(RoleId = {_, SrvId}, ZonePid) ->
    ets:insert(zs_war_role, {RoleId, ZonePid}),
    cluster_lib:cast(SrvId, ets, insert,
		     [zs_war_role, {RoleId, ZonePid}]).


