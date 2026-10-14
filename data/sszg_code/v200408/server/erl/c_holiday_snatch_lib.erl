-file("src/mod/holiday_snatch/c_holiday_snatch_lib.erl",
      1).

-module(c_holiday_snatch_lib).

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
		  p_eqm, p_home]}]).

-export([calc_zone/0, get_zone_id/1, get_pid/1,
	 get_srvs/1, get_log/1, calc_zone/6]).

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

-file("src/mod/holiday_snatch/c_holiday_snatch_lib.erl",
      16).

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

-file("src/mod/holiday_snatch/c_holiday_snatch_lib.erl",
      17).

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

-file("src/mod/holiday_snatch/c_holiday_snatch_lib.erl",
      18).

-spec get_log(pos_integer()) -> list().

get_log(Zid) ->
    case catch ets:lookup(c_holiday_snatch_zone_log, Zid) of
      [{Zid, Logs} | _] -> Logs;
      _ -> []
    end.

-spec get_zone_id(binary()) -> pos_integer().

get_zone_id(Sid) ->
    case ets:lookup(c_holiday_snatch_srv_info, Sid) of
      [{Sid, ZoneId} | _] -> ZoneId;
      _ ->
	  case ets:lookup(c_holiday_snatch_other, max_zone_id) of
	    [{_, ZoneId}] -> update_zone_info(ZoneId, Sid), ZoneId;
	    _ -> 0
	  end
    end.

update_zone_info(Zid, Sid) ->
    case ets:lookup(c_holiday_snatch_zone_info, Zid) of
      [{Zid, Num, Sids} | _] ->
	  c_holiday_snatch_mgr:update_ets(c_holiday_snatch_zone_info,
					  {Zid, Num, [Sid | Sids]}, all);
      _ -> ok
    end.

-spec get_srvs(pos_integer()) -> list().

get_srvs(Zid) ->
    case ets:lookup(c_holiday_snatch_zone_info, Zid) of
      [{Zid, _Num, Sids} | _] -> Sids;
      _ -> []
    end.

-spec get_pid(pos_integer()) -> pid().

get_pid(ZoneId) ->
    case ets:match_object(c_holiday_snatch_pids,
			  {_ = '_', ZoneId})
	of
      [{Pid, ZoneId} | _] -> Pid;
      _ -> 0
    end.

calc_zone() ->
    List = ets:tab2list(c_holiday_snatch_role),
    LimitNum =
	holiday_snatch_data:get_constant(group_limit),
    Now = date:unixtime(),
    Fun = fun (Info = #holiday_snatch_role_info{sid = SidT,
						open_srv_time = OpenTime},
	       {Acc1, Acc2}) ->
		  OpenZeroTime = date:unixtime({zero, OpenTime}),
		  OpenDay = date:day_diff(OpenZeroTime, Now) + 1,
		  case OpenDay > 7 of
		    true -> {[Info | Acc1], Acc2};
		    _ -> {Acc1, [SidT | Acc2]}
		  end
	  end,
    {List1, OtherSrvs} = lists:foldl(Fun, {[], []}, List),
    {ZoneList, SList, MaxZoneId} =
	calc_zone(lists:keysort(#holiday_snatch_role_info.open_srv_time,
				List1),
		  LimitNum, {1, 0, []}, [], [], OtherSrvs),
    c_holiday_snatch_mgr:update_ets(c_holiday_snatch_zone_info,
				    ZoneList, reset_all),
    c_holiday_snatch_mgr:update_ets(c_holiday_snatch_srv_info,
				    SList, reset_all),
    c_holiday_snatch_mgr:update_ets(c_holiday_snatch_other,
				    {max_zone_id, MaxZoneId}, all),
    MaxZoneId.

calc_zone([], _LimitNum, {ZoneId, Num, SrvsT}, L, L2,
	  OtherSrvs) ->
    Srvs = lists:usort(SrvsT ++ OtherSrvs),
    MinNum = holiday_snatch_data:get_constant(zone_min_num),
    case Num < MinNum of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_holiday_snatch_lib92, _,
	     {__Levelc_holiday_snatch_lib92,
	      __Tracesc_holiday_snatch_lib92}}
		when __Levelc_holiday_snatch_lib92 band 64 /= 0 orelse
		       __Tracesc_holiday_snatch_lib92 /= [] ->
		lager:do_log(info,
			     [{module, c_holiday_snatch_lib},
			      {function, calc_zone}, {line, 92},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("勇者夺宝最后一组分组时，人数小于最小要求人数, 合并到前一组:~w",
					   [{ZoneId, Num}]),
			     none, 4096, 64, __Levelc_holiday_snatch_lib92,
			     __Tracesc_holiday_snatch_lib92, lager_event,
			     __Pidc_holiday_snatch_lib92);
	    _ -> ok
	  end,
	  case lists:keyfind(ZoneId - 1, 1, L) of
	    {LastZone, NumT, SrvsT2} ->
		{lists:keystore(LastZone, 1, L,
				{LastZone, Num + NumT, Srvs ++ SrvsT2}),
		 [{Sid, LastZone} || Sid <- Srvs] ++ L2, LastZone};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidc_holiday_snatch_lib97, _,
		   {__Levelc_holiday_snatch_lib97,
		    __Tracesc_holiday_snatch_lib97}}
		      when __Levelc_holiday_snatch_lib97 band 64 /= 0 orelse
			     __Tracesc_holiday_snatch_lib97 /= [] ->
		      lager:do_log(info,
				   [{module, c_holiday_snatch_lib},
				    {function, calc_zone}, {line, 97},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("勇者夺宝最后一组分组时，人数小于最小要求人数, 找不到前一组数据，取当前分组:~w",
						 [{ZoneId, Num,
						   lists:keyfind(ZoneId - 1, 1,
								 L)}]),
				   none, 4096, 64,
				   __Levelc_holiday_snatch_lib97,
				   __Tracesc_holiday_snatch_lib97, lager_event,
				   __Pidc_holiday_snatch_lib97);
		  _ -> ok
		end,
		{[{ZoneId, Num, Srvs} | L],
		 [{Sid, ZoneId} || Sid <- Srvs] ++ L2, ZoneId}
	  end;
      _ ->
	  {[{ZoneId, Num, Srvs} | L],
	   [{Sid, ZoneId} || Sid <- Srvs] ++ L2, ZoneId}
    end;
calc_zone([#holiday_snatch_role_info{sid = Sid,
				     num = Num}
	   | Other],
	  LimitNum, {ZoneId, ZNum, Srvs}, L, L2, OtherSrvs) ->
    case ZNum >= LimitNum of
      true ->
	  calc_zone(Other, LimitNum, {ZoneId + 1, Num, [Sid]},
		    [{ZoneId, ZNum, Srvs} | L],
		    [{SidT, ZoneId} || SidT <- Srvs] ++ L2, OtherSrvs);
      _ ->
	  calc_zone(Other, LimitNum,
		    {ZoneId, ZNum + Num, [Sid | Srvs]}, L, L2, OtherSrvs)
    end.


