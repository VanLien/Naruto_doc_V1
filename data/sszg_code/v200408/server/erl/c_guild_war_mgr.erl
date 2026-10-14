-file("src/mod/guild_war2/c_guild_war_mgr.erl", 1).

-module(c_guild_war_mgr).

-lager_records([{guild_war_role_log,
		 [id, name, lev, face, power, formation_type,
		  formation_lev, time, repaly_id, result, hp, defense,
		  face_update_time, face_file]},
		{guild_war_log,
		 [flag1, flag2, time, id1, name1, id2, name2, gid, gname,
		  int_args, str_args]},
		{guild_war_partner,
		 [id, bid, lev, star, break_lev, base_attr, all_attr,
		  skills, break_skills, set_skills, ext_data]},
		{guild_war_role,
		 [pos, id, name, lev, face, power, formation_type,
		  formation_lev, war_score, star, defense, hp, hp_max,
		  status, def_count, def_log, count, repaly_info,
		  relic_def_count, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id, hallows_lucky,
		  hallows_seal, hallows_all_look_ids, extra, look_id,
		  face_update_time, face_file, break_groups]},
		{guild_war_sign,
		 [gid, group_id, srv_name, gname, def_num, defense,
		  last_matchs, avg_power, star_time, buff_lev, rank, hp,
		  hp_max, war_log, lev]},
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
		{state, [ts, timeout, switch]}]).

-behaviour(gen_fsm).

-export([m/0, info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2, match/2, match_over/2, open/2,
	 finish/2]).

-record(state, {ts = 0, timeout = 0, switch = open}).

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

-file("src/mod/guild_war2/c_guild_war_mgr.erl", 23).

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

-file("src/mod/guild_war2/c_guild_war_mgr.erl", 24).

-file("inc/guild_war.hrl", 1).

-record(guild_war_sign,
	{gid = {0, <<>>}, group_id = 0, srv_name = <<>>,
	 gname = <<>>, def_num = 0, defense = [],
	 last_matchs = {0, <<>>}, avg_power = 0, star_time = 0,
	 buff_lev = 0, rank = 0, hp = 0, hp_max = 0,
	 war_log = [], lev = 0}).

-record(guild_war_role,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, power = 0, formation_type = 0,
	 formation_lev = 0, war_score = 0, star = 0,
	 defense = [], hp = 3, hp_max = 3, status = 0,
	 def_count = 0, def_log = [], count = 0,
	 repaly_info = [], relic_def_count = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = [], look_id = 0, face_update_time = 0,
	 face_file = <<>>, break_groups = []}).

-record(guild_war_partner,
	{id = 0, bid = 0, lev = 0, star = 0, break_lev = 0,
	 base_attr = [], all_attr = [], skills = [],
	 break_skills = [], set_skills = [], ext_data = []}).

-record(guild_war_log,
	{flag1 = 0, flag2 = 0, time = 0, id1 = {0, <<>>},
	 name1 = <<>>, id2 = {0, <<>>}, name2 = <<>>,
	 gid = {0, <<>>}, gname = <<>>, int_args = [],
	 str_args = []}).

-record(guild_war_role_log,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 power = 0, formation_type = 0, formation_lev = 0,
	 time = 0, repaly_id = 0, result = 0, hp = 0,
	 defense = [], face_update_time = 0, face_file = <<>>}).

-file("src/mod/guild_war2/c_guild_war_mgr.erl", 25).

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
      {__Pidc_guild_war_mgr29, _,
       {__Levelc_guild_war_mgr29, __Tracesc_guild_war_mgr29}}
	  when __Levelc_guild_war_mgr29 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr29 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, m}, {line, 29},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64, __Levelc_guild_war_mgr29,
		       __Tracesc_guild_war_mgr29, lager_event,
		       __Pidc_guild_war_mgr29);
      _ -> ok
    end,
    cluster_lib:cast(center, gen_fsm, send_event,
		     [c_guild_war_mgr, timeout]).

info(Info) -> c_guild_war_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(c_guild_war_mgr, Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(c_guild_war_mgr,
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
	    {__Pidc_guild_war_mgr42, _,
	     {__Levelc_guild_war_mgr42, __Tracesc_guild_war_mgr42}}
		when __Levelc_guild_war_mgr42 band 8 /= 0 orelse
		       __Tracesc_guild_war_mgr42 /= [] ->
		lager:do_log(error,
			     [{module, c_guild_war_mgr}, {function, call},
			      {line, 42}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_guild_war_mgr, Event, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_guild_war_mgr42,
			     __Tracesc_guild_war_mgr42, lager_event,
			     __Pidc_guild_war_mgr42);
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
    gen_fsm:start_link({local, c_guild_war_mgr},
		       c_guild_war_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_guild_war_mgr48, _,
       {__Levelc_guild_war_mgr48, __Tracesc_guild_war_mgr48}}
	  when __Levelc_guild_war_mgr48 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr48 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, init},
			{line, 48}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64, __Levelc_guild_war_mgr48,
		       __Tracesc_guild_war_mgr48, lager_event,
		       __Pidc_guild_war_mgr48);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(c_guild_war_sign_group,
		   [{file, "./dets/c_guild_war_sign_group.dets"},
		    {keypos, 1}, {type, set}]),
    ets:new(c_guild_war_sign_group,
	    [set, named_table, public, {keypos, 1}]),
    Fun = fun ({GroupId, G}) ->
		  NewG = [guild_war_ver:do_ver(G1) || G1 <- G],
		  guild_war_db:update_ets(c_guild_war_sign_group,
					  {GroupId, NewG}),
		  continue
	  end,
    dets:traverse(c_guild_war_sign_group, Fun),
    dets:open_file(c_guild_war_match_info,
		   [{file, "./dets/c_guild_war_match_info.dets"},
		    {keypos, 1}, {type, set}]),
    ets:new(c_guild_war_match_info,
	    [set, named_table, public, {keypos, 1}]),
    Fun2 = fun ({GroupId, G}) ->
		   NewG = [{guild_war_ver:do_ver(G1),
			    guild_war_ver:do_ver(G2)}
			   || {G1, G2} <- G],
		   guild_war_db:update_ets(c_guild_war_match_info,
					   {GroupId, NewG}),
		   continue
	   end,
    dets:traverse(c_guild_war_match_info, Fun2),
    Ms = date:unixtime(ms),
    {Ts, Timeout, StateName} = case
				 sys_env:get(guild_war_ver)
				   of
				 {Tst, Timeoutt, StateNamet} ->
				     {Tst, Timeoutt, StateNamet};
				 _ -> {Ms, state_time(matching_time), idle}
			       end,
    sys_env:save(guild_war_ver, {Ts, Timeout, StateName}),
    State = #state{ts = Ts, timeout = Timeout,
		   switch = StateName},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_guild_war_mgr84, _,
       {__Levelc_guild_war_mgr84, __Tracesc_guild_war_mgr84}}
	  when __Levelc_guild_war_mgr84 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr84 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, init},
			{line, 84}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "启动完成", none, 4096, 64, __Levelc_guild_war_mgr84,
		       __Tracesc_guild_war_mgr84, lager_event,
		       __Pidc_guild_war_mgr84);
      _ -> ok
    end,
    {ok, StateName, State, max(1, Ts + Timeout - Ms)}.

state_time(Key) ->
    Week = date:day_of_the_week(),
    {Hour, Minu, Sec} = time(),
    DaySec = Hour * 3600 + Minu * 60 + Sec,
    {StatWeek, StatSec} = get_time(Week, Key),
    StatTime = next_time(Week, DaySec, StatWeek, StatSec),
    StatTime * 1000.

next_time(Week, Sec, Week, Sec1) when Sec1 > Sec ->
    Sec1 - Sec;
next_time(Week, Sec, Week1, Sec1) when Week1 > Week ->
    86400 * (Week1 - Week) + Sec1 - Sec;
next_time(Week, Sec, Week1, Sec1) ->
    next_time(Week, Sec, Week1 + 7, Sec1).

get_time(Week, Key) ->
    case [{W, H, M}
	  || {W, H, M} <- guild_war_data:get_const(Key), Week < W]
	of
      [{WeekT, Hour, Minu} | _] ->
	  {WeekT, Hour * 3600 + Minu * 60};
      _ ->
	  [{WeekT, Hour, Minu} | _] =
	      guild_war_data:get_const(Key),
	  {WeekT, Hour * 3600 + Minu * 60}
    end.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok, continue(StateName, Reply, State).

handle_info({switch, S}, StateName, State)
    when S =:= open orelse S =:= close ->
    continue(StateName, State#state{switch = S});
handle_info({match_push, {GroupId, List}}, match,
	    State) ->
    case ets:lookup(c_guild_war_sign_group, GroupId) of
      [{_, List2} | _] ->
	  DoList = [G
		    || G = #guild_war_sign{gid = Gid} <- List,
		       lists:keyfind(Gid, #guild_war_sign.gid, List2) ==
			 false],
	  guild_war_db:update_ets(c_guild_war_sign_group,
				  {GroupId, List2 ++ DoList});
      _ ->
	  guild_war_db:update_ets(c_guild_war_sign_group,
				  {GroupId, List})
    end,
    continue(match, State);
handle_info(sync_status_to_zone, StateName,
	    State = #state{ts = Ts, timeout = TimeOut}) ->
    cluster_lib:cast(all, guild_war_mgr, info,
		     [{sync_status_to_zone, StateName, Ts, TimeOut}]),
    continue(StateName, State);
handle_info({sync_data, FromPid}, StateName,
	    State = #state{ts = Ts, timeout = TimeOut}) ->
    FromPid ! {sync_status_to_zone, StateName, Ts, TimeOut},
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
      {__Pidc_guild_war_mgr146, _,
       {__Levelc_guild_war_mgr146, __Tracesc_guild_war_mgr146}}
	  when __Levelc_guild_war_mgr146 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr146 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, terminate},
			{line, 146}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64, __Levelc_guild_war_mgr146,
		       __Tracesc_guild_war_mgr146, lager_event,
		       __Pidc_guild_war_mgr146);
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
      {__Pidc_guild_war_mgr147, _,
       {__Levelc_guild_war_mgr147, __Tracesc_guild_war_mgr147}}
	  when __Levelc_guild_war_mgr147 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr147 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, terminate},
			{line, 147}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_guild_war_mgr147,
		       __Tracesc_guild_war_mgr147, lager_event,
		       __Pidc_guild_war_mgr147);
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

idle(timeout, State) ->
    Timeout = 3000 * 1000,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_guild_war_mgr168, _,
       {__Levelc_guild_war_mgr168, __Tracesc_guild_war_mgr168}}
	  when __Levelc_guild_war_mgr168 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr168 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, idle},
			{line, 168}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始进入匹配阶段", []), none, 4096, 64,
		       __Levelc_guild_war_mgr168, __Tracesc_guild_war_mgr168,
		       lager_event, __Pidc_guild_war_mgr168);
      _ -> ok
    end,
    ets:delete_all_objects(c_guild_war_sign_group),
    dets:delete_all_objects(c_guild_war_sign_group),
    ets:delete_all_objects(c_guild_war_match_info),
    dets:delete_all_objects(c_guild_war_match_info),
    self() ! sync_status_to_zone,
    Ts = date:unixtime(ms),
    sys_env:save(guild_war_ver, {Ts, Timeout, match}),
    continue(match,
	     State#state{ts = Ts, timeout = Timeout});
idle(_Any, State) -> continue(idle, State).

match(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_guild_war_mgr183, _,
       {__Levelc_guild_war_mgr183, __Tracesc_guild_war_mgr183}}
	  when __Levelc_guild_war_mgr183 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr183 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, match},
			{line, 183}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始进入匹配结果展示阶段", []), none, 4096, 64,
		       __Levelc_guild_war_mgr183, __Tracesc_guild_war_mgr183,
		       lager_event, __Pidc_guild_war_mgr183);
      _ -> ok
    end,
    do_match(),
    Timeout =
	date:next_diff(guild_war_data:get_const(start_time)) *
	  1000,
    self() ! sync_status_to_zone,
    Ts = date:unixtime(ms),
    sys_env:save(guild_war_ver, {Ts, Timeout, match_over}),
    continue(match_over,
	     State#state{ts = Ts, timeout = Timeout});
match(_Any, State) -> continue(match, State).

match_over(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_guild_war_mgr196, _,
       {__Levelc_guild_war_mgr196, __Tracesc_guild_war_mgr196}}
	  when __Levelc_guild_war_mgr196 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr196 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, match_over},
			{line, 196}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始进入战斗阶段", []), none, 4096, 64,
		       __Levelc_guild_war_mgr196, __Tracesc_guild_war_mgr196,
		       lager_event, __Pidc_guild_war_mgr196);
      _ -> ok
    end,
    self() ! sync_status_to_zone,
    Timeout =
	date:next_diff(guild_war_data:get_const(end_time)) *
	  1000,
    Ts = date:unixtime(ms),
    sys_env:save(guild_war_ver, {Ts, Timeout, open}),
    continue(open, State#state{ts = Ts, timeout = Timeout});
match_over(_Any, State) -> continue(match_over, State).

open(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_guild_war_mgr208, _,
       {__Levelc_guild_war_mgr208, __Tracesc_guild_war_mgr208}}
	  when __Levelc_guild_war_mgr208 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr208 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, open},
			{line, 208}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始进入结算阶段", []), none, 4096, 64,
		       __Levelc_guild_war_mgr208, __Tracesc_guild_war_mgr208,
		       lager_event, __Pidc_guild_war_mgr208);
      _ -> ok
    end,
    self() ! sync_status_to_zone,
    Ts = date:unixtime(ms),
    Timeout =
	date:next_diff(guild_war_data:get_const(clear_time)) *
	  1000,
    sys_env:save(guild_war_ver, {Ts, Timeout, finish}),
    continue(finish,
	     State#state{ts = Ts, timeout = Timeout});
open(_Any, State) -> continue(open, State).

finish(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_guild_war_mgr220, _,
       {__Levelc_guild_war_mgr220, __Tracesc_guild_war_mgr220}}
	  when __Levelc_guild_war_mgr220 band 64 /= 0 orelse
		 __Tracesc_guild_war_mgr220 /= [] ->
	  lager:do_log(info,
		       [{module, c_guild_war_mgr}, {function, finish},
			{line, 220}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始进入空闲阶段", []), none, 4096, 64,
		       __Levelc_guild_war_mgr220, __Tracesc_guild_war_mgr220,
		       lager_event, __Pidc_guild_war_mgr220);
      _ -> ok
    end,
    self() ! sync_status_to_zone,
    Ts = date:unixtime(ms),
    Timeout = state_time(matching_time),
    sys_env:save(guild_war_ver, {Ts, Timeout, idle}),
    continue(idle, State#state{ts = Ts, timeout = Timeout});
finish(_Any, State) -> continue(finish, State).

do_match() ->
    Guilds = ets:tab2list(c_guild_war_sign_group),
    do_match(Guilds).

do_match([]) -> ok;
do_match([{GroudId, Guilds} | Other]) ->
    Guilds2 = list_util:mkeysort2([{r,
				    #guild_war_sign.avg_power},
				   {r, #guild_war_sign.lev}],
				  Guilds),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_guild_war_mgr243, _,
       {__Levelc_guild_war_mgr243, __Tracesc_guild_war_mgr243}}
	  when __Levelc_guild_war_mgr243 band 128 /= 0 orelse
		 __Tracesc_guild_war_mgr243 /= [] ->
	  lager:do_log(debug,
		       [{module, c_guild_war_mgr}, {function, do_match},
			{line, 243}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会战参与匹配数据:~w",
				     [[{Gid, Name, AvgPower, Gid2, Rank, Lev}
				       || #guild_war_sign{gid = Gid,
							  last_matchs = Gid2,
							  gname = Name,
							  avg_power = AvgPower,
							  rank = Rank,
							  lev = Lev}
					      <- Guilds2]]),
		       none, 4096, 128, __Levelc_guild_war_mgr243,
		       __Tracesc_guild_war_mgr243, lager_event,
		       __Pidc_guild_war_mgr243);
      _ -> ok
    end,
    List = guild_war:do_match(Guilds2, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_guild_war_mgr249, _,
       {__Levelc_guild_war_mgr249, __Tracesc_guild_war_mgr249}}
	  when __Levelc_guild_war_mgr249 band 128 /= 0 orelse
		 __Tracesc_guild_war_mgr249 /= [] ->
	  lager:do_log(debug,
		       [{module, c_guild_war_mgr}, {function, do_match},
			{line, 249}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会战参与匹配结果:~w",
				     [[{Gid1, AvgPower1, Lev1, Gid2, AvgPower2,
					Lev2}
				       || {#guild_war_sign{gid = Gid1,
							   avg_power =
							       AvgPower1,
							   lev = Lev1},
					   #guild_war_sign{gid = Gid2,
							   avg_power =
							       AvgPower2,
							   lev = Lev2}}
					      <- List]]),
		       none, 4096, 128, __Levelc_guild_war_mgr249,
		       __Tracesc_guild_war_mgr249, lager_event,
		       __Pidc_guild_war_mgr249);
      _ -> ok
    end,
    ets:insert(c_guild_war_match_info, {GroudId, List}),
    dets:insert(c_guild_war_match_info, {GroudId, List}),
    do_match(Other).


