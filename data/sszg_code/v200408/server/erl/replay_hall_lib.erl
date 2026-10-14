-file("src/mod/replay_hall/replay_hall_lib.erl", 1).

-module(replay_hall_lib).

-lager_records([{replay_partner,
		 [id, pos, bid, lev, star, break_lev, power, hp, hp_max,
		  atk, def, speed, crit_rate, crit_ratio, hit_magic,
		  dodge_magic, hurt, behurt, curt, skills, eqms,
		  artifacts, ext]},
		{replay_stat, [id, like, share, play, collect]},
		{replay_info,
		 [id, combat_type, round, sec_type, a_rid, a_name, a_lev,
		  a_face, a_power, a_formation_type, a_camp_type,
		  a_hallow, a_rank, b_rid, b_name, b_lev, b_face, b_power,
		  b_formation_type, b_camp_type, b_hallow, b_rank,
		  a_plist, b_plist, ret, time, like, share, play, collect,
		  ext]},
		{replay,
		 [id, type, combat_type, sec_type, a_rid, a_cond_val,
		  a_power, a_lev, b_rid, b_cond_val, b_power, b_lev,
		  time]},
		{replay_role, [key, list]},
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

-export([get_role_replay/1, get_replay_info/1,
	 list_replay_info/1, list_type_replay/1]).

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

-file("src/mod/replay_hall/replay_hall_lib.erl", 14).

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

-file("src/mod/replay_hall/replay_hall_lib.erl", 15).

-file("inc/replay_hall.hrl", 1).

-record(replay_role, {key = {{0, <<>>}, 0}, list = []}).

-record(replay,
	{id = 0, type = 0, combat_type = 0, sec_type = 0,
	 a_rid = 0, a_cond_val = 0, a_power = 0, a_lev = 0,
	 b_rid = 0, b_cond_val = 0, b_power = 0, b_lev = 0,
	 time = 0}).

-record(replay_info,
	{id = 0, combat_type = 0, round = 0, sec_type = 0,
	 a_rid = {0, <<>>}, a_name = <<>>, a_lev = 0, a_face = 0,
	 a_power = 0, a_formation_type = 0, a_camp_type = 0,
	 a_hallow, a_rank = 0, b_rid = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_face = 0, b_power = 0,
	 b_formation_type = 0, b_camp_type = 0, b_hallow,
	 b_rank = 0, a_plist = [], b_plist = [], ret = 0,
	 time = 0, like = 0, share = 0, play = 0, collect = 0,
	 ext = []}).

-record(replay_stat,
	{id = 0, like = 0, share = 0, play = 0, collect = 0}).

-record(replay_partner,
	{id = 0, pos = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, hp = 0, hp_max = 0, atk = 0,
	 def = 0, speed = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, hurt = 0, behurt = 0,
	 curt = 0, skills = [], eqms = [], artifacts = [],
	 ext = []}).

-file("src/mod/replay_hall/replay_hall_lib.erl", 16).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/replay_hall/replay_hall_lib.erl", 17).

-spec get_role_replay(tuple()) -> ok.

get_role_replay(Key) ->
    case ets:lookup(replay_role, Key) of
      [I] -> I;
      _ -> #replay_role{key = Key}
    end.

-spec get_replay_info(pos_integer()) -> {ok,
					 #replay_info{}} |
					false.

get_replay_info(ReplayId) ->
    Tab = combat_replay_mgr:replay_info_tab(ReplayId),
    case ets:lookup(Tab, ReplayId) of
      [I] -> {ok, I};
      _ ->
	  StatTab = combat_replay_mgr:replay_stat_tab(ReplayId),
	  case catch dets:lookup(StatTab, ReplayId) of
	    [#replay_stat{like = Like, share = Share, play = Play,
			  collect = Collect}] ->
		case replay_hall_file:load_replay_info(ReplayId) of
		  {ok, I = #replay_info{}} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidreplay_hall_lib38, _,
			 {__Levelreplay_hall_lib38, __Tracesreplay_hall_lib38}}
			    when __Levelreplay_hall_lib38 band 128 /= 0 orelse
				   __Tracesreplay_hall_lib38 /= [] ->
			    lager:do_log(debug,
					 [{module, replay_hall_lib},
					  {function, get_replay_info},
					  {line, 38},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("从文件中加载数据:~w",
						       [ReplayId]),
					 none, 4096, 128,
					 __Levelreplay_hall_lib38,
					 __Tracesreplay_hall_lib38, lager_event,
					 __Pidreplay_hall_lib38);
			_ -> ok
		      end,
		      NewI = I#replay_info{like = Like, share = Share,
					   play = Play, collect = Collect},
		      ets:insert(Tab, NewI),
		      replay_hall_mgr:info({loaded_replay_info, ReplayId}),
		      {ok, NewI};
		  _ -> false
		end;
	    _ ->
		case dets:lookup(Tab, ReplayId) of
		  [I = #replay_info{a_plist = [], b_plist = []}] ->
		      case replay_hall_file:load_replay_info(ReplayId) of
			{ok,
			 #replay_info{a_plist = APlist, b_plist = BPlist,
				      ext = Ext}} ->
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
			      {__Pidreplay_hall_lib51, _,
			       {__Levelreplay_hall_lib51,
				__Tracesreplay_hall_lib51}}
				  when __Levelreplay_hall_lib51 band 128 /= 0
					 orelse
					 __Tracesreplay_hall_lib51 /= [] ->
				  lager:do_log(debug,
					       [{module, replay_hall_lib},
						{function, get_replay_info},
						{line, 51},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("从文件中加载数据:~w",
							     [ReplayId]),
					       none, 4096, 128,
					       __Levelreplay_hall_lib51,
					       __Tracesreplay_hall_lib51,
					       lager_event,
					       __Pidreplay_hall_lib51);
			      _ -> ok
			    end,
			    NewI = I#replay_info{a_plist = APlist,
						 b_plist = BPlist, ext = Ext},
			    ets:insert(Tab, NewI),
			    dets:delete(Tab, ReplayId),
			    replay_hall_mgr:info({loaded_replay_info,
						  ReplayId}),
			    {ok, NewI};
			_ -> false
		      end;
		  [I = #replay_info{like = Like, share = Share,
				    play = Play, collect = Collect}] ->
		      catch dets:insert(StatTab,
					#replay_stat{id = ReplayId, like = Like,
						     share = Share, play = Play,
						     collect = Collect}),
		      replay_hall_file:save_replay_info(I),
		      ets:insert(Tab, I),
		      dets:delete(Tab, ReplayId),
		      replay_hall_mgr:info({loaded_replay_info, ReplayId}),
		      {ok, I};
		  _ -> false
		end
	  end
    end.

-spec list_replay_info(list()) -> list().

list_replay_info(Ids) -> do_list_replay_info(Ids, []).

do_list_replay_info([], L) -> L;
do_list_replay_info([ReplayId | T], L) ->
    case get_replay_info(ReplayId) of
      {ok, R} -> do_list_replay_info(T, [R | L]);
      _ -> do_list_replay_info(T, L)
    end.

-spec list_type_replay(pos_integer()) -> list().

list_type_replay(Type) ->
    ets:match_object(replay, #replay{type = Type, _ = '_'}).


