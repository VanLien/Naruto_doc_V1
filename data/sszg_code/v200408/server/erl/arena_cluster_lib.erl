-file("src/mod/arena_cluster/arena_cluster_lib.erl", 1).

-module(arena_cluster_lib).

-lager_records([{arena_cluster_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{arena_cluster_replay_partner,
		 [pos, bid, lev, star, ext]},
		{arena_cluster_replay,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_cluster_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_score, def_id, def_name, def_face, def_lev,
		  def_rank, def_score, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_cluster_log, [id, list]},
		{arena_cluster_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, score, rank, time, avatar_id,
		  cont_win, ext]},
		{arena_cluster_rank, [rank, id, score]},
		{arena_cluster_f_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  dower_skill, set_skill, attr, extra]},
		{arena_cluster_f_order,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, pos_info, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  power, is_hidden, extra]},
		{arena_cluster_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, order_info, robot_id, avatar_id, look, ext]},
		{m_arena_cluster,
		 [ver, ref_time, formations, ref_list, season_ref_time,
		  season_combat_num, best_rank, day_combat_num,
		  acc_combat_num, day_reward, turn_card_reward,
		  turn_card_num, turn_card_history, worship,
		  worship_list]},
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
		  m_holiday_arena_team, p_bag, p_eqm, p_home]}]).

-export([role_rank/1, role_score/1, rank_roleid/1,
	 rank_role/1, get_log/1, get_role/1, hero_hall/0,
	 list_rank/1, list_rank/2, cluster_get_role/1,
	 cluster_get_log/1, cluster_hero_hall/0,
	 cluster_list_rank/1, cluster_role_rank/1,
	 cluster_role_score/1, push_log/2, push_log_info/3,
	 rank_role_to_cli/1, log_ver/1]).

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

-file("src/mod/arena_cluster/arena_cluster_lib.erl",
      28).

-file("inc/role.hrl", 1).

-record(role,
	{ver = 77, id = {0, <<>>}, need_sync = 0,
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
	 m_holiday_arena_team, p_bag, p_eqm, p_home}).

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

-file("src/mod/arena_cluster/arena_cluster_lib.erl",
      29).

-file("inc/arena_cluster.hrl", 1).

-record(m_arena_cluster,
	{ver = 1, ref_time = 0, formations = [], ref_list = [],
	 season_ref_time = 0, season_combat_num = 0,
	 best_rank = 0, day_combat_num = 0, acc_combat_num = 0,
	 day_reward = [], turn_card_reward = [],
	 turn_card_num = 0, turn_card_history = [], worship = 0,
	 worship_list = []}).

-record(arena_cluster_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, order_info = [], robot_id = 0, avatar_id = 0,
	 look = 0, ext = []}).

-record(arena_cluster_f_order,
	{order, formation_type = 1, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, pos_info = [],
	 hallows_look_id = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_all_look_ids = [], power = 0,
	 is_hidden = 0, extra = []}).

-record(arena_cluster_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 dower_skill = [], set_skill = [], attr, extra = []}).

-record(arena_cluster_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_cluster_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, cont_win = 0, ext = []}).

-record(role_arena_cluster_log,
	{id = {0, <<>>}, list = []}).

-record(arena_cluster_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0, atk_score = 0,
	 def_id = {0, <<>>}, def_name = <<>>, def_face = 0,
	 def_lev = 0, def_rank = 0, def_score = 0, ret = 1,
	 win_count = 0, lose_count = 0, combat_type = 0,
	 replay_list = [], time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_cluster_replay,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_cluster_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(arena_cluster_fight_lock,
	{id = {0, <<>>}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-file("src/mod/arena_cluster/arena_cluster_lib.erl",
      30).

-spec role_rank(role_id()) -> Rank :: non_neg_integer().

role_rank(RoleId) ->
    try ets:lookup_element(arena_cluster_role, RoleId,
			   #arena_cluster_role.rank)
    catch
      _:_ -> 0
    end.

-spec role_score(role_id()) -> Score :: pos_integer().

role_score(RoleId) ->
    try ets:lookup_element(arena_cluster_role, RoleId,
			   #arena_cluster_role.score)
    catch
      _:_ -> arena_cluster_data:get_const(init_score)
    end.

-spec rank_roleid(pos_integer()) -> role_id() | null.

rank_roleid(Rank) ->
    case ets:lookup(arena_cluster_rank, Rank) of
      [#arena_cluster_rank{id = RoleId}] -> RoleId;
      _ -> null
    end.

-spec rank_role(pos_integer()) -> {ok,
				   #arena_cluster_role{}} |
				  false.

rank_role(Rank) ->
    case rank_roleid(Rank) of
      null -> false;
      RoleId -> get_role(RoleId)
    end.

-spec get_log(role_id()) -> #role_arena_cluster_log{}.

get_log(RoleId) ->
    case ets:lookup(role_arena_cluster_log, RoleId) of
      [Log] -> Log;
      _ ->
	  case dets:lookup(role_arena_cluster_log, RoleId) of
	    [Log = #role_arena_cluster_log{list = List}] ->
		NewLog = Log#role_arena_cluster_log{list =
							[log_ver(I)
							 || I <- List]},
		ets:insert(role_arena_cluster_log, NewLog),
		NewLog;
	    [] ->
		Log = #role_arena_cluster_log{id = RoleId},
		ets:insert(role_arena_cluster_log, Log),
		Log
	  end
    end.

log_ver({arena_cluster_log, Id, AtkId, AtkName, AtkFace,
	 AtkLev, AtkRank, AtkScore, DefId, DefName, DefFace,
	 DefLev, DefRank, DefScore, Ret, WinCount, LoseCount,
	 CombatType, ReplayList, Time}) ->
    AtkFaceUpdateTime = 0,
    AtkFaceFile = <<>>,
    DefFaceUpdateTime = 0,
    DefFaceFile = <<>>,
    log_ver({arena_cluster_log, Id, AtkId, AtkName, AtkFace,
	     AtkLev, AtkRank, AtkScore, DefId, DefName, DefFace,
	     DefLev, DefRank, DefScore, Ret, WinCount, LoseCount,
	     CombatType, ReplayList, Time, AtkFaceUpdateTime,
	     AtkFaceFile, DefFaceUpdateTime, DefFaceFile});
log_ver(Log = #arena_cluster_log{}) -> Log.

-spec get_role(role_id()) -> {ok,
			      #arena_cluster_role{}} |
			     false.

get_role(RoleId) ->
    case ets:lookup(arena_cluster_role, RoleId) of
      [R] -> {ok, R};
      _ -> false
    end.

-spec hero_hall() -> [#arena_cluster_role{}].

hero_hall() -> arena_cluster_lib:list_rank(3).

-spec list_rank(Num ::
		    pos_integer()) -> [#arena_cluster_role{}].

list_rank(Num) when Num > 0 -> list_rank(1, Num);
list_rank(_Num) -> list_rank(1, 100).

-spec list_rank(StartRank :: pos_integer(),
		EndRank :: pos_integer()) -> [#arena_cluster_role{}].

list_rank(StartRank, EndRank) ->
    do_list_rank(StartRank, EndRank, []).

do_list_rank(StartRank, EndRank, L)
    when StartRank > EndRank ->
    lists:reverse(L);
do_list_rank(StartRank, EndRank, L) ->
    case rank_role(StartRank) of
      {ok, R} ->
	  do_list_rank(StartRank + 1, EndRank, [R | L]);
      _ -> lists:reverse(L)
    end.

-spec cluster_hero_hall() -> [#arena_cluster_role{}].

cluster_hero_hall() ->
    HistoryHall = sys_env:get(arena_cluster_hero_hall, []),
    case arena_cluster_mgr:is_open() orelse
	   HistoryHall =:= []
	of
      true ->
	  case arena_cluster_mgr:send_call(arena_cluster_lib,
					   hero_hall, [])
	      of
	    {false, Msg} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_lib133, _,
		   {__Levelarena_cluster_lib133,
		    __Tracesarena_cluster_lib133}}
		      when __Levelarena_cluster_lib133 band 8 /= 0 orelse
			     __Tracesarena_cluster_lib133 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster_lib},
				    {function, cluster_hero_hall}, {line, 133},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("跨服竞技场获取英雄榜出错[~ts]", [Msg]),
				   none, 4096, 8, __Levelarena_cluster_lib133,
				   __Tracesarena_cluster_lib133, lager_event,
				   __Pidarena_cluster_lib133);
		  _ -> ok
		end,
		[];
	    L when is_list(L) -> L;
	    _ -> []
	  end;
      _ -> HistoryHall
    end.

-spec
     cluster_get_role(role_id()) -> [#arena_cluster_role{}].

cluster_get_role(RoleId) ->
    case arena_cluster_mgr:send_call(arena_cluster_lib,
				     get_role, [RoleId])
	of
      {false, Msg} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_lib147, _,
	     {__Levelarena_cluster_lib147,
	      __Tracesarena_cluster_lib147}}
		when __Levelarena_cluster_lib147 band 8 /= 0 orelse
		       __Tracesarena_cluster_lib147 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_lib},
			      {function, cluster_get_role}, {line, 147},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("跨服竞技场获取角色数据出错[~ts]", [Msg]), none,
			     4096, 8, __Levelarena_cluster_lib147,
			     __Tracesarena_cluster_lib147, lager_event,
			     __Pidarena_cluster_lib147);
	    _ -> ok
	  end,
	  false;
      {ok, R} -> {ok, R};
      _ -> false
    end.

-spec cluster_list_rank(Num ::
			    pos_integer()) -> [#arena_cluster_role{}].

cluster_list_rank(Num) ->
    case arena_cluster_mgr:send_call(arena_cluster_lib,
				     list_rank, [Num])
	of
      {false, Msg} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_lib158, _,
	     {__Levelarena_cluster_lib158,
	      __Tracesarena_cluster_lib158}}
		when __Levelarena_cluster_lib158 band 8 /= 0 orelse
		       __Tracesarena_cluster_lib158 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_lib},
			      {function, cluster_list_rank}, {line, 158},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("跨服竞技场获取排行榜出错[~ts]", [Msg]), none,
			     4096, 8, __Levelarena_cluster_lib158,
			     __Tracesarena_cluster_lib158, lager_event,
			     __Pidarena_cluster_lib158);
	    _ -> ok
	  end,
	  [];
      L when is_list(L) -> L;
      _ -> []
    end.

-spec cluster_role_rank(role_id()) -> Rank ::
					  non_neg_integer().

cluster_role_rank(RoleId) ->
    case arena_cluster_mgr:send_call(arena_cluster_lib,
				     role_rank, [RoleId])
	of
      {false, Msg} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_lib169, _,
	     {__Levelarena_cluster_lib169,
	      __Tracesarena_cluster_lib169}}
		when __Levelarena_cluster_lib169 band 64 /= 0 orelse
		       __Tracesarena_cluster_lib169 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_lib},
			      {function, cluster_role_rank}, {line, 169},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("跨服竞技场获取[~w]排名出错[~ts]",
					   [RoleId, Msg]),
			     none, 4096, 64, __Levelarena_cluster_lib169,
			     __Tracesarena_cluster_lib169, lager_event,
			     __Pidarena_cluster_lib169);
	    _ -> ok
	  end,
	  0;
      Rank when is_integer(Rank) -> Rank;
      _ -> 0
    end.

-spec cluster_role_score(role_id()) -> Rank ::
					   non_neg_integer().

cluster_role_score(RoleId) ->
    case arena_cluster_mgr:send_call(arena_cluster_lib,
				     role_score, [RoleId])
	of
      {false, Msg} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_lib182, _,
	     {__Levelarena_cluster_lib182,
	      __Tracesarena_cluster_lib182}}
		when __Levelarena_cluster_lib182 band 64 /= 0 orelse
		       __Tracesarena_cluster_lib182 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_lib},
			      {function, cluster_role_score}, {line, 182},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("跨服竞技场获取[~w]积分出错[~ts]",
					   [RoleId, Msg]),
			     none, 4096, 64, __Levelarena_cluster_lib182,
			     __Tracesarena_cluster_lib182, lager_event,
			     __Pidarena_cluster_lib182);
	    _ -> ok
	  end,
	  arena_cluster_data:get_const(init_score);
      Score when is_integer(Score) -> Score;
      _ -> arena_cluster_data:get_const(init_score)
    end.

-spec cluster_get_log(role_id() |
		      pos_integer()) -> #role_arena_cluster_log{}.

cluster_get_log(RoleId) ->
    case arena_cluster_mgr:send_call(arena_cluster_lib,
				     get_log, [RoleId])
	of
      {false, Msg} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_lib195, _,
	     {__Levelarena_cluster_lib195,
	      __Tracesarena_cluster_lib195}}
		when __Levelarena_cluster_lib195 band 8 /= 0 orelse
		       __Tracesarena_cluster_lib195 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_lib},
			      {function, cluster_get_log}, {line, 195},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("跨服竞技场获取[~w]日志出错[~ts]",
					   [RoleId, Msg]),
			     none, 4096, 8, __Levelarena_cluster_lib195,
			     __Tracesarena_cluster_lib195, lager_event,
			     __Pidarena_cluster_lib195);
	    _ -> ok
	  end,
	  #role_arena_cluster_log{};
      L = #role_arena_cluster_log{} -> L;
      _ -> #role_arena_cluster_log{}
    end.

-spec push_log(#role{}, pos_integer()) -> ok.

push_log(#role{id = RoleId}, 1) ->
    #role_arena_cluster_log{list = L} = get_log(RoleId),
    sys_conn:pack_send(25616, {1, L}),
    ok;
push_log(#role{}, _) ->
    #role_arena_cluster_log{list = L} = cluster_get_log(0),
    sys_conn:pack_send(25616, {2, L}),
    ok.

-spec push_log_info(#role{}, pos_integer(),
		    pos_integer()) -> ok.

push_log_info(#role{id = Id}, Type, LogId) ->
    #role_arena_cluster_log{list = L} = case Type of
					  1 -> get_log(Id);
					  _ -> cluster_get_log(0)
					end,
    PushL = case lists:keyfind(LogId, #arena_cluster_log.id,
			       L)
		of
	      #arena_cluster_log{replay_list = Replays} ->
		  [{Round, ReplayLog,
		    [arena_elite_ver:do_partner_hurt_ver(T)
		     || T <- list_util:keyfind(1, Ext, [])],
		    list_util:keyfind(2, Ext, 0),
		    list_util:keyfind(3, Ext, []),
		    list_util:keyfind(4, Ext, 0),
		    list_util:keyfind(5, Ext, [])}
		   || {Round, ReplayLog = #arena_cluster_replay{ext = Ext}}
			  <- Replays];
	      _ -> []
	    end,
    sys_conn:pack_send(25617, {Type, LogId, PushL}).

rank_role_to_cli(L) ->
    [do_rank_role_to_cli(I) || I <- L].

do_rank_role_to_cli(R = #arena_cluster_role{ext =
						Ext}) ->
    {FaceUpdateTime, FaceFile} = list_util:keyfind(1, Ext,
						   {0, <<>>}),
    {R, FaceUpdateTime, FaceFile}.


