-file("arena_elite_mgr.erl", 1).

-module(arena_elite_mgr).

-lager_records([{m_arena_elite_war_order,
		 [ver, period, period_day, end_time, win_count,
		  rmb_status, card, lev_reward, start_time, ext]},
		{arena_replay_partner, [pos, bid, lev, star, ext]},
		{arena_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_elite_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_elite_lev, def_id, def_name, def_face, def_lev,
		  def_rank, def_elite_lev, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_elite_log, [id, list]},
		{arena_elite_rank,
		 [ver, rank, id, name, power, lev, face, look_id, score,
		  elite_lev, time, avatar_id, face_update_time,
		  face_file]},
		{arena_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, dower_skill,
		  set_skill, attr, extra]},
		{arena_elite_rival_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  extra]},
		{c_e_role,
		 [ver, id, name, power, lev, face, look_id, score,
		  elite_lev, avatar_id, is_king, match_power, all_star,
		  win_rio, zid, face_update_time, face_file]},
		{arena_elite_role,
		 [ver, id, name, lev, sex, gid, gname, face, power,
		  look_id, score, elite_lev, time, avatar_id, is_king,
		  defense, manifesto, face_update_time, face_file,
		  break_groups]},
		{c_elite_srv_info,
		 [type, sid, num, world_lev, open_time, merge_srvs]},
		{m_arena_elite_defens, [type, formations]},
		{m_arena_elite_log,
		 [ver, period, max_lev, max_score, combat_win_count1,
		  combat_all_count1, combat_win_count2, combat_all_count2,
		  max_dps, mvp_info, winning_streak, winning_streak_now,
		  beast_rivl_info, extra, log_zone_id, log_rank]},
		{arena_elite_role_best,
		 [id, name, lev, sex, gid, gname, face, power, look_id,
		  score, elite_lev, time, avatar_id, is_king, extra,
		  face_update_time, face_file]},
		{m_arena_elite,
		 [ver, lev, init_lev, period, score, day_combat_count,
		  day_buy_count, frist_ref_time, ref_count, match_cd_time,
		  had_combat_num, acc_combat_num, lev_reward,
		  last_combat_id, promoted_info, rival_info, defens,
		  old_rank, day_point_count, log, extra, last_reset_time,
		  max_day_buy_count, is_skip]},
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

-export([check_open/0, get_ranks/1, get_ranks/0,
	 check_is_king/1, get_role_ranks/1, get_role_ranks/2,
	 get_zid/1, get_zone_info/0]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2, open/2]).

-record(state, {ts = 0, timeout = 0, switch = open}).

-file("/sszg_code/server/inc/common.hrl", 1).

-file("/sszg_code/server/inc/lib_log.hrl", 1).

-file("/sszg_code/server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("arena_elite_mgr.erl", 33).

-file("/sszg_code/server/inc/role.hrl", 1).

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

-file("arena_elite_mgr.erl", 34).

-file("/sszg_code/server/inc/arena_elite.hrl", 1).

-record(m_arena_elite,
	{ver = 6, lev = 1, init_lev = 1, period = 0, score = 0,
	 day_combat_count = 0, day_buy_count = 0,
	 frist_ref_time = 0, ref_count = 0, match_cd_time = 0,
	 had_combat_num = 0, acc_combat_num = 0, lev_reward = [],
	 last_combat_id = {0, <<>>}, promoted_info = [],
	 rival_info = [], defens = [], old_rank = [],
	 day_point_count = [], log = [], extra = [],
	 last_reset_time = 0, max_day_buy_count = 0,
	 is_skip = 0}).

-record(arena_elite_role_best,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = [],
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, extra = [],
	 face_update_time = 0, face_file = <<>>}).

-record(m_arena_elite_log,
	{ver = 2, period = 0, max_lev = 1, max_score = 1000,
	 combat_win_count1 = 0, combat_all_count1 = 0,
	 combat_win_count2 = 0, combat_all_count2 = 0,
	 max_dps = 0, mvp_info = [], winning_streak = 0,
	 winning_streak_now = 0,
	 beast_rivl_info = #arena_elite_role_best{}, extra = [],
	 log_zone_id = 0, log_rank = 0}).

-record(m_arena_elite_defens,
	{type = 1, formations = []}).

-record(c_elite_srv_info,
	{type = 1, sid = <<>>, num = 0, world_lev = 0,
	 open_time = 0, merge_srvs = []}).

-record(arena_elite_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, defense = [],
	 manifesto = [], face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(c_e_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, power = 0,
	 lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, avatar_id = 0, is_king = 0,
	 match_power = 1, all_star = 1, win_rio = 1, zid = 1,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_elite_rival_defense,
	{order, formation_type, hallows_id, hallows_lev,
	 hallows_skill_lev, partner_infos, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = []}).

-record(arena_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(arena_elite_rank,
	{ver = 2, rank = 0, id = {0, <<>>}, name = <<>>,
	 power = 0, lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, time = 0, avatar_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(role_arena_elite_log,
	{id = {0, <<>>}, list = []}).

-record(arena_elite_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0,
	 atk_elite_lev = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_face = 0, def_lev = 0, def_rank = 0,
	 def_elite_lev = 0, ret = 1, win_count = 0,
	 lose_count = 0, combat_type = 0, replay_list = [],
	 time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(m_arena_elite_war_order,
	{ver = 2, period = 0, period_day = 0, end_time = 0,
	 win_count = 0, rmb_status = 0, card = [],
	 lev_reward = [], start_time = 0, ext = []}).

-file("arena_elite_mgr.erl", 35).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("arena_elite_mgr.erl", 36).

-spec get_zid(role_id()) -> integer().

get_zid({_, Sid}) -> get_zid(Sid);
get_zid(Sid) ->
    case Sid == sys_lib:srv_id() of
      true -> get_srv_zid();
      _ ->
	  case catch big_world_lib:call(all_big_world,
					c_arena_elite_lib, get_srv_zone_id,
					[Sid])
	      of
	    ZoneId when is_integer(ZoneId) -> ZoneId;
	    _ -> get_srv_zid()
	  end
    end.

get_srv_zid() ->
    case catch ets:lookup(arena_elite_other,
			  arena_elite_zone_id)
	of
      [{_, ZoneId} | _] -> ZoneId;
      _ ->
	  [_, Zid] = string_util:explode(sys_lib:srv_id(), "_"),
	  (list_to_integer(Zid) - 1) div 200 + 1
    end.

get_max_zone_info() ->
    case catch ets:lookup(arena_elite_other,
			  arena_elite_max_zone_info)
	of
      [{_, ZoneInfo} | _] -> ZoneInfo;
      _ -> []
    end.

-spec check_open() -> {false, binary()} |
		      {ok, atom, pos_integer(), pos_integer(), pos_integer()}.

check_open() ->
    WorldLev = world_lev:get_world_lev(),
    LimitWorldLev =
	arena_elite_data:get_constant(open_world_lev_limit),
    case sys_env:get(arena_elite_state) of
      {StateName, Ts, TimeOut, Period} ->
	  case WorldLev >= LimitWorldLev of
	    true -> {ok, StateName, Ts, TimeOut, Period};
	    _ ->
		{false,
		 util:fbin(lang:get(<<"世界等级~w级开启超凡段位赛"/utf8>>),
			   [LimitWorldLev])}
	  end;
      _ -> {false, lang:get(<<"超凡段位赛未开启"/utf8>>)}
    end.

check_is_king(#role_robot{id = Id}) ->
    check_is_king(Id);
check_is_king(#role{id = Id,
		    m_arena_elite = #m_arena_elite{lev = Lev}}) ->
    case check_open() of
      {ok, second_king, _Ts, _TimeOut, _Period} ->
	  LimitLev =
	      arena_elite_data:get_constant(king_match_condition),
	  case Lev >= LimitLev of
	    true -> true;
	    _ ->
		case ets:lookup(arena_elite_role, Id) of
		  [#c_e_role{is_king = 1} | _] -> true;
		  _ -> false
		end
	  end;
      _ -> false
    end;
check_is_king(Id) ->
    case check_open() of
      {ok, second_king, _Ts, _TimeOut, _Period} ->
	  case ets:lookup(arena_elite_role, Id) of
	    [#c_e_role{is_king = 1} | _] -> true;
	    _ -> false
	  end;
      _ -> false
    end.

-spec get_role_ranks(pos_integer()) -> pos_integer().

get_role_ranks(Id) ->
    case ets:match_object(arena_elite_rank,
			  #arena_elite_rank{id = Id, _ = '_'})
	of
      [#arena_elite_rank{rank = Rank} | _] -> Rank;
      _ -> 0
    end.

get_role_ranks(Id, ZoneId) ->
    case ZoneId == get_srv_zid() of
      true -> get_role_ranks(Id);
      _ ->
	  case catch big_world_lib:call(all_big_world,
					c_arena_elite_lib, get_role_ranks,
					[Id, ZoneId])
	      of
	    Rank when is_integer(Rank) -> Rank;
	    _ -> 0
	  end
    end.

-spec get_ranks() -> {false, binary()} |
		     {ok, atom, pos_integer(), pos_integer(), pos_integer()}.

get_ranks() -> L = ets:tab2list(arena_elite_rank), L.

-spec get_ranks(pos_integer()) -> {false, binary()} |
				  {ok, atom, pos_integer(), pos_integer(),
				   pos_integer()}.

get_ranks(Key) ->
    case ets:lookup(arena_old_elite_rank, Key) of
      [{Key, L} | _] ->
	  [{ZoneId,
	    [arena_elite_ver:do_rank_ver(Rank) || Rank <- Data]}
	   || {ZoneId, Data} <- L];
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_mgr151, _,
	     {__Levelarena_elite_mgr151, __Tracesarena_elite_mgr151}}
		when __Levelarena_elite_mgr151 band 8 /= 0 orelse
		       __Tracesarena_elite_mgr151 /= [] ->
		lager:do_log(error,
			     [{module, arena_elite_mgr}, {function, get_ranks},
			      {line, 151}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("中央服信息不同步，找不到历史赛季数据:~w", [Key]),
			     none, 4096, 8, __Levelarena_elite_mgr151,
			     __Tracesarena_elite_mgr151, lager_event,
			     __Pidarena_elite_mgr151);
	    _ -> ok
	  end,
	  info({sync_old_rank_data, Key}),
	  []
    end.

-spec get_zone_info() -> {false, binary()} |
			 {ok, atom, pos_integer(), pos_integer(),
			  pos_integer()}.

get_zone_info() -> get_max_zone_info().

update_ets(Tab, Data, reset_all) ->
    ets:delete_all_objects(Tab),
    dets:delete_all_objects(Tab),
    update_ets(Tab, Data, ets),
    update_ets(Tab, Data, dets);
update_ets(Tab, Data, reset_ets) ->
    ets:delete_all_objects(Tab), update_ets(Tab, Data, ets);
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
      {__Pidarena_elite_mgr197, _,
       {__Levelarena_elite_mgr197, __Tracesarena_elite_mgr197}}
	  when __Levelarena_elite_mgr197 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr197 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, m}, {line, 197},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64, __Levelarena_elite_mgr197,
		       __Tracesarena_elite_mgr197, lager_event,
		       __Pidarena_elite_mgr197);
      _ -> ok
    end,
    gen_fsm:send_event(arena_elite_mgr, timeout).

info(Info) -> arena_elite_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(arena_elite_mgr, Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(arena_elite_mgr,
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
	    {__Pidarena_elite_mgr210, _,
	     {__Levelarena_elite_mgr210, __Tracesarena_elite_mgr210}}
		when __Levelarena_elite_mgr210 band 8 /= 0 orelse
		       __Tracesarena_elite_mgr210 /= [] ->
		lager:do_log(error,
			     [{module, arena_elite_mgr}, {function, call},
			      {line, 210}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_elite_mgr, Event, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_elite_mgr210,
			     __Tracesarena_elite_mgr210, lager_event,
			     __Pidarena_elite_mgr210);
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
    gen_fsm:start_link({local, arena_elite_mgr},
		       arena_elite_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr216, _,
       {__Levelarena_elite_mgr216, __Tracesarena_elite_mgr216}}
	  when __Levelarena_elite_mgr216 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr216 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, init},
			{line, 216}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64, __Levelarena_elite_mgr216,
		       __Tracesarena_elite_mgr216, lager_event,
		       __Pidarena_elite_mgr216);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(arena_elite_hallows_award,
		   [{file, "./dets/arena_elite_hallows_award.dets"},
		    {keypos, 1}, {type, set}]),
    ets:new(arena_elite_hallows_award,
	    [set, named_table, public, {keypos, 1}]),
    ets:from_dets(arena_elite_hallows_award,
		  arena_elite_hallows_award),
    dets:open_file(arena_elite_role,
		   [{file, "./dets/arena_elite_role.dets"},
		    {keypos, #c_e_role.id}, {type, set}]),
    ets:new(arena_elite_role,
	    [set, named_table, public, {keypos, #c_e_role.id}]),
    dets:open_file(arena_elite_rank,
		   [{file, "./dets/arena_elite_rank.dets"},
		    {keypos, #arena_elite_rank.rank}, {type, set}]),
    ets:new(arena_elite_rank,
	    [set, named_table, public,
	     {keypos, #arena_elite_rank.rank}]),
    dets:open_file(arena_old_elite_rank,
		   [{file, "./dets/arena_old_elite_rank.dets"},
		    {keypos, 1}, {type, set}]),
    ets:new(arena_old_elite_rank,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(arena_elite_other,
		   [{file, "./dets/arena_elite_other.dets"}, {keypos, 1},
		    {type, set}]),
    ets:new(arena_elite_other,
	    [set, named_table, public, {keypos, 1}]),
    dets:open_file(arena_elite_mirror,
		   [{file, "./dets/arena_elite_mirror.dets"},
		    {keypos, #arena_elite_role.id}, {type, set}]),
    ets:new(arena_elite_mirror,
	    [set, named_table, public,
	     {keypos, #arena_elite_role.id}]),
    dets:open_file(arena_elite_reward_lev,
		   [{file, "./dets/arena_elite_reward_lev.dets"},
		    {keypos, 1}, {type, set}]),
    ets:new(arena_elite_reward_lev,
	    [set, named_table, public, {keypos, 1}]),
    Fun2 = fun (Data) ->
		   NewData = c_arena_elite_mgr:do_ver(Data),
		   update_ets(arena_elite_role, NewData, all),
		   continue
	   end,
    dets:traverse(arena_elite_role, Fun2),
    ets:from_dets(arena_elite_rank, arena_elite_rank),
    ets:from_dets(arena_old_elite_rank,
		  arena_old_elite_rank),
    ets:from_dets(arena_elite_other, arena_elite_other),
    ets:from_dets(arena_elite_reward_lev,
		  arena_elite_reward_lev),
    Fun3 = fun (Data) ->
		   NewData = arena_elite_mirror:do_ver(Data),
		   update_ets(arena_elite_mirror, NewData, all),
		   continue
	   end,
    dets:traverse(arena_elite_mirror, Fun3),
    ets:from_dets(arena_elite_mirror, arena_elite_mirror),
    Ms = date:unixtime(ms),
    {Ts, TimeOut, Switch} = case
			      sys_env:get(arena_elite_open_state)
				of
			      {TsT, TimeOutT, StateT} ->
				  {TsT, TimeOutT, StateT};
			      _ ->
				  NextOpenTime =
				      arena_elite_data:get_constant(open_time),
				  TimeOutT = date:next_diff(NextOpenTime) *
					       1000,
				  {Ms, TimeOutT, idle}
			    end,
    sys_env:save(arena_elite_open_state,
		 {Ts, TimeOut, Switch}),
    State = #state{ts = Ts, timeout = TimeOut,
		   switch = Switch},
    put(sync_rank_data_timer,
	erlang:send_after(300000 + util:rand(1, 60000), self(),
			  sync_rank_data)),
    arena_elite_match_mgr:do_open_match_pro(),
    put(arena_elite_update_zone_info,
	erlang:send_after(180 * 1000 + util:rand(1, 360000),
			  self(), update_zone_info)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr287, _,
       {__Levelarena_elite_mgr287, __Tracesarena_elite_mgr287}}
	  when __Levelarena_elite_mgr287 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr287 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, init},
			{line, 287}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "启动完成", none, 4096, 64, __Levelarena_elite_mgr287,
		       __Tracesarena_elite_mgr287, lager_event,
		       __Pidarena_elite_mgr287);
      _ -> ok
    end,
    {ok, Switch, State, max(1, Ts + TimeOut - Ms)}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok, continue(StateName, Reply, State).

handle_info(update_zone_info, StateName, State) ->
    SrvId = sys_lib:srv_id(),
    MergeSrvs = sys_lib:srv_full_id(),
    Num = get_arena_elite_num(),
    WorldLev = world_lev:get_world_lev(),
    OPenTime = sys_env:get(open_timestamp),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr304, _,
       {__Levelarena_elite_mgr304, __Tracesarena_elite_mgr304}}
	  when __Levelarena_elite_mgr304 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr304 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, handle_info},
			{line, 304}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===同步游戏服活跃人数~w",
				     [{SrvId, Num, WorldLev, OPenTime,
				       MergeSrvs}]),
		       none, 4096, 64, __Levelarena_elite_mgr304,
		       __Tracesarena_elite_mgr304, lager_event,
		       __Pidarena_elite_mgr304);
      _ -> ok
    end,
    big_world_lib:cast(center_all, c_arena_elite_mgr, info,
		       [{update_join_role,
			 {SrvId, Num, WorldLev, OPenTime, MergeSrvs}}]),
    case erase(arena_elite_update_zone_info) of
      undefined -> ok;
      Timer -> catch erlang:cancel_timer(Timer)
    end,
    put(arena_elite_update_zone_info,
	erlang:send_after(date:next_diff({4, 0, 0}) * 1000 +
			    util:rand(1, 3600000),
			  self(), update_zone_info)),
    continue(StateName, State);
handle_info(do_9377_update_zone_id, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr315, _,
       {__Levelarena_elite_mgr315, __Tracesarena_elite_mgr315}}
	  when __Levelarena_elite_mgr315 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr315 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, handle_info},
			{line, 315}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "9377收到战区手动重置信息", none, 4096, 64,
		       __Levelarena_elite_mgr315, __Tracesarena_elite_mgr315,
		       lager_event, __Pidarena_elite_mgr315);
      _ -> ok
    end,
    big_world_lib:cast(center_all, c_arena_elite_mgr, info,
		       [{update_join_role, sys_lib:srv_id(), self()}]),
    continue(StateName, State);
handle_info(gm_open_ets, StateName, State) ->
    case ets:info(arena_elite_hallows_award, size) of
      undefined ->
	  dets:open_file(arena_elite_hallows_award,
			 [{file, "./dets/arena_elite_hallows_award.dets"},
			  {keypos, 1}, {type, set}]),
	  ets:new(arena_elite_hallows_award,
		  [set, named_table, public, {keypos, 1}]);
      _ -> skip
    end,
    info(gm_hallows_award_to_ets),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr329, _,
       {__Levelarena_elite_mgr329, __Tracesarena_elite_mgr329}}
	  when __Levelarena_elite_mgr329 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr329 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, handle_info},
			{line, 329}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "执行了精英赛头像框修复代码", none, 4096, 64,
		       __Levelarena_elite_mgr329, __Tracesarena_elite_mgr329,
		       lager_event, __Pidarena_elite_mgr329);
      _ -> ok
    end,
    continue(StateName, State);
handle_info(gm_hallows_award_to_ets, StateName,
	    State) ->
    case ets:lookup(arena_elite_other, hallows_award) of
      [{_, Ranks, _EndTimeT}] ->
	  [cluster_lib:cast(Sid, arena_elite_mgr, info,
			    [{save_hallows_award_to_ets,
			      {IdT, Rank, ELev, Score}}])
	   || {IdT = {_, Sid}, Rank, ELev, Score} <- Ranks];
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_mgr339, _,
	     {__Levelarena_elite_mgr339, __Tracesarena_elite_mgr339}}
		when __Levelarena_elite_mgr339 band 8 /= 0 orelse
		       __Tracesarena_elite_mgr339 /= [] ->
		lager:do_log(error,
			     [{module, arena_elite_mgr},
			      {function, handle_info}, {line, 339},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("精英赛数据转移出错:~w",
					   [ets:lookup(arena_elite_other,
						       hallows_award)]),
			     none, 4096, 8, __Levelarena_elite_mgr339,
			     __Tracesarena_elite_mgr339, lager_event,
			     __Pidarena_elite_mgr339);
	    _ -> ok
	  end,
	  skip
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr342, _,
       {__Levelarena_elite_mgr342, __Tracesarena_elite_mgr342}}
	  when __Levelarena_elite_mgr342 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr342 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, handle_info},
			{line, 342}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "执行了精英赛头像框修复数据转移代码", none, 4096, 64,
		       __Levelarena_elite_mgr342, __Tracesarena_elite_mgr342,
		       lager_event, __Pidarena_elite_mgr342);
      _ -> ok
    end,
    continue(StateName, State);
handle_info({save_hallows_award_to_ets,
	     {IdT, Rank, ELev, Score}},
	    StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr346, _,
       {__Levelarena_elite_mgr346, __Tracesarena_elite_mgr346}}
	  when __Levelarena_elite_mgr346 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr346 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, handle_info},
			{line, 346}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("精英赛头像框排行数据:~w",
				     [{IdT, Rank, ELev, Score}]),
		       none, 4096, 64, __Levelarena_elite_mgr346,
		       __Tracesarena_elite_mgr346, lager_event,
		       __Pidarena_elite_mgr346);
      _ -> ok
    end,
    ets:insert(arena_elite_hallows_award,
	       {IdT, Rank, ELev, Score}),
    dets:insert(arena_elite_hallows_award,
		{IdT, Rank, ELev, Score}),
    continue(StateName, State);
handle_info({update_zone_id, Period, ZoneId, MaxZoneId},
	    StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr353, _,
       {__Levelarena_elite_mgr353, __Tracesarena_elite_mgr353}}
	  when __Levelarena_elite_mgr353 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr353 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, handle_info},
			{line, 353}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===精英赛同步战区~w", [ZoneId]), none, 4096, 64,
		       __Levelarena_elite_mgr353, __Tracesarena_elite_mgr353,
		       lager_event, __Pidarena_elite_mgr353);
      _ -> ok
    end,
    update_ets(arena_elite_other,
	       {arena_elite_zone_id, ZoneId}, all),
    L = get_max_zone_info(),
    NewL = lists:keystore(Period, 1, L,
			  {Period, MaxZoneId}),
    update_ets(arena_elite_other,
	       {arena_elite_max_zone_info, NewL}, all),
    continue(StateName, State);
handle_info({update_max_zone_id, Period, MaxZoneId},
	    StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr362, _,
       {__Levelarena_elite_mgr362, __Tracesarena_elite_mgr362}}
	  when __Levelarena_elite_mgr362 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr362 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, handle_info},
			{line, 362}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===精英赛同步最大战区~w", [MaxZoneId]), none,
		       4096, 64, __Levelarena_elite_mgr362,
		       __Tracesarena_elite_mgr362, lager_event,
		       __Pidarena_elite_mgr362);
      _ -> ok
    end,
    L = get_max_zone_info(),
    NewL = lists:keystore(Period, 1, L,
			  {Period, MaxZoneId}),
    update_ets(arena_elite_other,
	       {arena_elite_max_zone_info, NewL}, all),
    continue(StateName, State);
handle_info({update_max_zone_info, ZoneInfo}, StateName,
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr370, _,
       {__Levelarena_elite_mgr370, __Tracesarena_elite_mgr370}}
	  when __Levelarena_elite_mgr370 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr370 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, handle_info},
			{line, 370}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===精英赛同步最大战区~w", [ZoneInfo]), none, 4096,
		       64, __Levelarena_elite_mgr370,
		       __Tracesarena_elite_mgr370, lager_event,
		       __Pidarena_elite_mgr370);
      _ -> ok
    end,
    update_ets(arena_elite_other,
	       {arena_elite_max_zone_info, ZoneInfo}, all),
    continue(StateName, State);
handle_info({update_arena_role,
	     PushRole = #c_e_role{id = Id, elite_lev = Lev,
				  score = Score, match_power = MatchPower,
				  is_king = IsKing}},
	    StateName, State) ->
    update_ets(arena_elite_role, PushRole, all),
    cluster_lib:cast(center, c_arena_elite_mgr, info,
		     [{update_arena_role, PushRole}]),
    case big_world_lib:center_node() ==
	   cluster_lib:center_node()
	of
      true -> skip;
      _ ->
	  case big_world_lib:cast(center, c_arena_elite_mgr, info,
				  [{update_arena_role, PushRole}])
	      of
	    {error, not_ready} ->
		big_world_lib:cast(center_all, c_arena_elite_mgr, info,
				   [{update_arena_role_not_ver,
				     {Id, Lev, Score, IsKing}}]);
	    _ -> ok
	  end
    end,
    continue(StateName, State);
handle_info(new_period_update_arena_role, StateName,
	    State) ->
    case get(arena_elite_king_roles) of
      [PushRole = #c_e_role{id = Id, elite_lev = Lev,
			    score = Score, is_king = IsKing}
       | Others] ->
	  cluster_lib:cast(center, c_arena_elite_mgr, info,
			   [{update_arena_role2, PushRole}]),
	  case big_world_lib:center_node() ==
		 cluster_lib:center_node()
	      of
	    true -> skip;
	    _ ->
		case big_world_lib:cast(center, c_arena_elite_mgr, info,
					[{update_arena_role2, PushRole}])
		    of
		  {error, not_ready} ->
		      big_world_lib:cast(center_all, c_arena_elite_mgr, info,
					 [{update_arena_role_not_ver2,
					   {Id, Lev, Score, IsKing}}]);
		  _ -> ok
		end
	  end,
	  put(arena_elite_king_roles, Others),
	  erlang:send_after(util:rand(100, 200), self(),
			    new_period_update_arena_role);
      _ -> ok
    end,
    continue(StateName, State);
handle_info({new_period_update_arena_role, PushRole},
	    StateName, State) ->
    update_ets(arena_elite_role, PushRole, all),
    erlang:send_after(util:rand(1, 180), self(),
		      {sync_update_arena_role, PushRole}),
    continue(StateName, State);
handle_info(gm_calc_no_login_id, StateName, State) ->
    Ids = load_no_login(),
    cluster_lib:cast(center, c_arena_elite_mgr, info,
		     [{gm_calc_no_login_id, Ids}]),
    case big_world_lib:center_node() ==
	   cluster_lib:center_node()
	of
      true -> skip;
      _ ->
	  big_world_lib:cast(center, c_arena_elite_mgr, info,
			     [{gm_calc_no_login_id, Ids}])
    end,
    continue(StateName, State);
handle_info(sync_status_to_zone_update_robot, StateName,
	    State) ->
    LimitWorldLev =
	arena_elite_data:get_constant(open_world_lev_limit),
    WorldLev = world_lev:get_world_lev(),
    case LimitWorldLev < WorldLev of
      true ->
	  put(sync_status_to_zone_update_robot, load()),
	  erlang:send_after(util:rand(1, 180), self(),
			    sync_update_arena_role_robot);
      _ -> ok
    end,
    continue(StateName, State);
handle_info(sync_update_arena_role_robot, StateName,
	    State) ->
    case get(sync_status_to_zone_update_robot) of
      [PushRole = #c_e_role{id = Id} | L] ->
	  case ets:lookup(arena_elite_role, Id) of
	    [_ | _] -> ok;
	    _ -> update_ets(arena_elite_role, PushRole, all)
	  end,
	  cluster_lib:cast(center, c_arena_elite_mgr, info,
			   [{update_arena_role_robot, PushRole}]),
	  case big_world_lib:center_node() ==
		 cluster_lib:center_node()
	      of
	    true -> skip;
	    _ ->
		big_world_lib:cast(center, c_arena_elite_mgr, info,
				   [{update_arena_role_robot, PushRole}])
	  end,
	  put(sync_status_to_zone_update_robot, L),
	  erlang:send_after(util:rand(100, 280), self(),
			    sync_update_arena_role_robot);
      _ -> ok
    end,
    continue(StateName, State);
handle_info({sync_update_arena_role,
	     PushRole = #c_e_role{id = Id, elite_lev = Lev,
				  score = Score, is_king = IsKing}},
	    StateName, State) ->
    cluster_lib:cast(center, c_arena_elite_mgr, info,
		     [{update_arena_role2, PushRole}]),
    case big_world_lib:center_node() ==
	   cluster_lib:center_node()
	of
      true -> skip;
      _ ->
	  case big_world_lib:cast(center, c_arena_elite_mgr, info,
				  [{update_arena_role2, PushRole}])
	      of
	    {error, not_ready} ->
		big_world_lib:cast(center_all, c_arena_elite_mgr, info,
				   [{update_arena_role_not_ver2,
				     {Id, Lev, Score, IsKing}}]);
	    _ -> ok
	  end
    end,
    continue(StateName, State);
handle_info(sync_data, StateName, State) ->
    cluster_lib:cast(center, c_arena_elite_mgr, info,
		     [{sync_data, self()}]),
    continue(StateName, State);
handle_info({sync_old_rank_data, Key}, StateName,
	    State) ->
    big_world_lib:cast(center, c_arena_elite_mgr, info,
		       [{sync_old_rank_data, Key, self()}]),
    continue(StateName, State);
handle_info({sync_old_rank_data_to_zone, Period, L},
	    StateName, State) ->
    update_ets(arena_old_elite_rank, {Period, L}, all),
    continue(StateName, State);
handle_info(sync_rank_data, StateName, State) ->
    big_world_lib:cast(center, c_arena_elite_mgr, info,
		       [{sync_rank_data, self(), sys_lib:srv_id()}]),
    case get(sync_rank_data_timer) of
      undefined -> ok;
      Timer -> erlang:cancel_timer(Timer)
    end,
    put(sync_rank_data_timer,
	erlang:send_after(300000 + util:rand(1, 60000), self(),
			  sync_rank_data)),
    continue(StateName, State);
handle_info({sync_rank_data, L}, StateName, State) ->
    update_ets(arena_elite_rank, L, reset_ets),
    put(arena_elite_rank, L),
    continue(StateName, State);
handle_info({sync_status_to_zone_clean, StateName, Ts,
	     TimeOut, Period, StartTime},
	    StateName2, State) ->
    sys_env:save(arena_elite_state_start_time, StartTime),
    sys_env:save(arena_elite_state,
		 {StateName, Ts, TimeOut, Period}),
    do_award(del),
    ets:delete_all_objects(arena_elite_role),
    dets:delete_all_objects(arena_elite_role),
    ets:delete_all_objects(arena_elite_rank),
    dets:delete_all_objects(arena_elite_rank),
    ets:delete_all_objects(arena_old_elite_rank),
    dets:delete_all_objects(arena_old_elite_rank),
    ets:delete_all_objects(arena_elite_other),
    dets:delete_all_objects(arena_elite_other),
    ets:delete_all_objects(role_arena_elite_log),
    dets:delete_all_objects(role_arena_elite_log),
    ets:delete_all_objects(arena_elite_mirror),
    dets:delete_all_objects(arena_elite_mirror),
    ets:delete_all_objects(arena_elite_reward_lev),
    dets:delete_all_objects(arena_elite_reward_lev),
    role_group:apply(world,
		     {arena_elite_lib, get_info, []}),
    continue(StateName2, State);
handle_info({sync_status_to_zone, idle, Ts, TimeOut,
	     Period, StartTime},
	    StateName2, State) ->
    sys_env:save(arena_elite_state_start_time, StartTime),
    sys_env:save(arena_elite_state,
		 {idle, Ts, TimeOut, Period}),
    continue(StateName2, State);
handle_info({sync_status_to_zone, first_routine, Ts,
	     TimeOut, Period, StartTime},
	    StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr545, _,
       {__Levelarena_elite_mgr545, __Tracesarena_elite_mgr545}}
	  when __Levelarena_elite_mgr545 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr545 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, handle_info},
			{line, 545}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("同步上半赛季开启阶段,", []), none, 4096, 64,
		       __Levelarena_elite_mgr545, __Tracesarena_elite_mgr545,
		       lager_event, __Pidarena_elite_mgr545);
      _ -> ok
    end,
    case check_open() of
      {ok, first_routine, _, _, Period} ->
	  sys_env:save(arena_elite_state,
		       {first_routine, Ts, TimeOut, Period}),
	  role_group:apply(world,
			   {arena_elite_lib, get_info, []}),
	  ok;
      {ok, _, _, _, OldPeriod} ->
	  sys_env:save(arena_elite_state,
		       {first_routine, Ts, TimeOut, Period}),
	  L = ets:tab2list(arena_elite_rank),
	  Ranks = [{IdT, Rank, ELev, Score}
		   || #arena_elite_rank{rank = Rank, id = IdT,
					elite_lev = ELev, score = Score}
			  <- L,
		      Rank < 101 andalso Rank > 0],
	  update_ets(arena_elite_other,
		     {hallows_award, Ranks,
		      util:ceil((TimeOut + Ts) / 1000)},
		     all),
	  ets:delete_all_objects(arena_elite_hallows_award),
	  dets:delete_all_objects(arena_elite_hallows_award),
	  [cluster_lib:cast(Sid, arena_elite_mgr, info,
			    [{save_hallows_award_to_ets,
			      {IdT, Rank, ELev, Score}}])
	   || {IdT = {_, Sid}, Rank, ELev, Score} <- Ranks],
	  NoticeMsg =
	      color:msg(lang:get(<<"跨服PVP玩法超凡段位赛~ts已开启，击败各路豪强，酷炫强力的~ts和海量资源属于你！~ts"/utf8>>),
			[{string,
			  {blue,
			   util:fbin(lang:get(<<"第~w赛季（上半赛季）"/utf8>>),
				     [Period])}},
			 {string, {orange, lang:get(<<"神器幻化外观"/utf8>>)}},
			 {href, {55, green, [], lang:get(<<"【我要参与】"/utf8>>)}}]),
	  notice:broadcast(rumor_left_top, NoticeMsg),
	  erlang:send_after(util:rand(6000, 120000), self(),
			    {sync_old_rank_data, max(1, Period - 1)}),
	  do_init_king_role(false),
	  do_award(del),
	  role_group:apply(world,
			   {hallows_look, arena_elite_activate, []}),
	  role_group:apply(world,
			   {arena_elite_lib, get_info, []}),
	  room_feat_mgr:info({arena_elite_do_feat, OldPeriod,
			      Ranks}),
	  ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_mgr583, _,
	     {__Levelarena_elite_mgr583, __Tracesarena_elite_mgr583}}
		when __Levelarena_elite_mgr583 band 64 /= 0 orelse
		       __Tracesarena_elite_mgr583 /= [] ->
		lager:do_log(info,
			     [{module, arena_elite_mgr},
			      {function, handle_info}, {line, 583},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("本服未达到开启条件, 不广播", []), none, 4096,
			     64, __Levelarena_elite_mgr583,
			     __Tracesarena_elite_mgr583, lager_event,
			     __Pidarena_elite_mgr583);
	    _ -> ok
	  end,
	  sys_env:save(arena_elite_state,
		       {first_routine, Ts, TimeOut, Period}),
	  skip
    end,
    big_world_lib:cast(center_all, c_arena_elite_mgr, info,
		       [{update_join_role, sys_lib:srv_id(), self()}]),
    sys_env:save(arena_elite_state_start_time, StartTime),
    continue(StateName, State);
handle_info({sync_status_to_zone, second_routine, Ts,
	     TimeOut, Period, StartTime},
	    StateName, State) ->
    case check_open() of
      {ok, second_routine, _, _, _} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_mgr593, _,
	     {__Levelarena_elite_mgr593, __Tracesarena_elite_mgr593}}
		when __Levelarena_elite_mgr593 band 64 /= 0 orelse
		       __Tracesarena_elite_mgr593 /= [] ->
		lager:do_log(info,
			     [{module, arena_elite_mgr},
			      {function, handle_info}, {line, 593},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("同步下赛季半赛季开启阶段1", []), none, 4096, 64,
			     __Levelarena_elite_mgr593,
			     __Tracesarena_elite_mgr593, lager_event,
			     __Pidarena_elite_mgr593);
	    _ -> ok
	  end,
	  sys_env:save(arena_elite_state,
		       {second_routine, Ts, TimeOut, Period}),
	  ok;
      {ok, _, _, _, _} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_mgr597, _,
	     {__Levelarena_elite_mgr597, __Tracesarena_elite_mgr597}}
		when __Levelarena_elite_mgr597 band 64 /= 0 orelse
		       __Tracesarena_elite_mgr597 /= [] ->
		lager:do_log(info,
			     [{module, arena_elite_mgr},
			      {function, handle_info}, {line, 597},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("同步下半赛季开启阶段2", []), none, 4096, 64,
			     __Levelarena_elite_mgr597,
			     __Tracesarena_elite_mgr597, lager_event,
			     __Pidarena_elite_mgr597);
	    _ -> ok
	  end,
	  sys_env:save(arena_elite_state,
		       {second_routine, Ts, TimeOut, Period}),
	  do_award(none),
	  role_group:apply(world,
			   {arena_elite_lib, get_info, []}),
	  NoticeMsg =
	      color:msg(lang:get(<<"跨服PVP玩法超凡段位赛~ts已开启，酷炫强力的~ts在召唤着强者！你会是下一位强者吗？~ts"/utf8>>),
			[{string,
			  {blue,
			   util:fbin(lang:get(<<"第~w赛季（下半赛季）"/utf8>>),
				     [Period])}},
			 {string, {orange, lang:get(<<"神器幻化外观"/utf8>>)}},
			 {href, {55, green, [], lang:get(<<"【我要参与】"/utf8>>)}}]),
	  notice:broadcast(rumor_left_top, NoticeMsg),
	  L = ets:tab2list(arena_elite_rank),
	  Ranks = [{IdT, Rank, ELev, Score}
		   || #arena_elite_rank{rank = Rank, id = IdT,
					elite_lev = ELev, score = Score}
			  <- L,
		      Rank < 101 andalso Rank > 0],
	  update_ets(arena_elite_other,
		     {hallows_award, Ranks,
		      util:ceil((TimeOut + Ts) / 1000 +
				  86400 *
				    arena_elite_data:get_constant(second_king))},
		     all),
	  ets:delete_all_objects(arena_elite_hallows_award),
	  dets:delete_all_objects(arena_elite_hallows_award),
	  [cluster_lib:cast(Sid, arena_elite_mgr, info,
			    [{save_hallows_award_to_ets,
			      {IdT, Rank, ELev, Score}}])
	   || {IdT = {_, Sid}, Rank, ELev, Score} <- Ranks],
	  role_group:apply(world,
			   {hallows_look, arena_elite_activate, []}),
	  ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_mgr622, _,
	     {__Levelarena_elite_mgr622, __Tracesarena_elite_mgr622}}
		when __Levelarena_elite_mgr622 band 64 /= 0 orelse
		       __Tracesarena_elite_mgr622 /= [] ->
		lager:do_log(info,
			     [{module, arena_elite_mgr},
			      {function, handle_info}, {line, 622},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("本服未达到超凡段位赛开启条件, 同步下半赛季阶段", []),
			     none, 4096, 64, __Levelarena_elite_mgr622,
			     __Tracesarena_elite_mgr622, lager_event,
			     __Pidarena_elite_mgr622);
	    _ -> ok
	  end,
	  sys_env:save(arena_elite_state,
		       {second_routine, Ts, TimeOut, Period}),
	  skip
    end,
    big_world_lib:cast(center_all, c_arena_elite_mgr, info,
		       [{update_join_role, sys_lib:srv_id(), self()}]),
    sys_env:save(arena_elite_state_start_time, StartTime),
    continue(StateName, State);
handle_info({sync_status_to_zone, second_king, Ts,
	     TimeOut, Period, StartTime},
	    StateName, State) ->
    case check_open() of
      {ok, second_king, _, _, _} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_mgr632, _,
	     {__Levelarena_elite_mgr632, __Tracesarena_elite_mgr632}}
		when __Levelarena_elite_mgr632 band 64 /= 0 orelse
		       __Tracesarena_elite_mgr632 /= [] ->
		lager:do_log(info,
			     [{module, arena_elite_mgr},
			      {function, handle_info}, {line, 632},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("同步下赛季半赛季开启阶段1", []), none, 4096, 64,
			     __Levelarena_elite_mgr632,
			     __Tracesarena_elite_mgr632, lager_event,
			     __Pidarena_elite_mgr632);
	    _ -> ok
	  end,
	  sys_env:save(arena_elite_state,
		       {second_king, Ts, TimeOut, Period}),
	  ok;
      {ok, _, _, _, _} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_mgr636, _,
	     {__Levelarena_elite_mgr636, __Tracesarena_elite_mgr636}}
		when __Levelarena_elite_mgr636 band 64 /= 0 orelse
		       __Tracesarena_elite_mgr636 /= [] ->
		lager:do_log(info,
			     [{module, arena_elite_mgr},
			      {function, handle_info}, {line, 636},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("同步上半赛季开启阶段2", []), none, 4096, 64,
			     __Levelarena_elite_mgr636,
			     __Tracesarena_elite_mgr636, lager_event,
			     __Pidarena_elite_mgr636);
	    _ -> ok
	  end,
	  do_init_king_role(true),
	  NoticeMsg =
	      color:msg(lang:get(<<"跨服PVP玩法超凡段位赛~ts已开启，达到“超凡王者”段位的勇者将进行角逐！王者赛的战斗奖"
				   "励将比常规赛更丰厚，荣誉属于真正的强者！~ts"/utf8>>),
			[{string, {blue, lang:get(<<"王者赛"/utf8>>)}},
			 {href, {55, green, [], lang:get(<<"【我要参与】"/utf8>>)}}]),
	  notice:broadcast(rumor_left_top, NoticeMsg),
	  sys_env:save(arena_elite_state,
		       {second_king, Ts, TimeOut, Period}),
	  role_group:apply(world,
			   {arena_elite_lib, get_info, []}),
	  ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_mgr648, _,
	     {__Levelarena_elite_mgr648, __Tracesarena_elite_mgr648}}
		when __Levelarena_elite_mgr648 band 64 /= 0 orelse
		       __Tracesarena_elite_mgr648 /= [] ->
		lager:do_log(info,
			     [{module, arena_elite_mgr},
			      {function, handle_info}, {line, 648},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("本服未达到超凡段位赛开启条件, 同步王者赛匹配阶段", []),
			     none, 4096, 64, __Levelarena_elite_mgr648,
			     __Tracesarena_elite_mgr648, lager_event,
			     __Pidarena_elite_mgr648);
	    _ -> ok
	  end,
	  sys_env:save(arena_elite_state,
		       {second_king, Ts, TimeOut, Period}),
	  skip
    end,
    big_world_lib:cast(center_all, c_arena_elite_mgr, info,
		       [{update_join_role, sys_lib:srv_id(), self()}]),
    sys_env:save(arena_elite_state_start_time, StartTime),
    continue(StateName, State);
handle_info({switch, S}, StateName, State)
    when S =:= open ->
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
      {__Pidarena_elite_mgr664, _,
       {__Levelarena_elite_mgr664, __Tracesarena_elite_mgr664}}
	  when __Levelarena_elite_mgr664 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr664 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, terminate},
			{line, 664}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64, __Levelarena_elite_mgr664,
		       __Tracesarena_elite_mgr664, lager_event,
		       __Pidarena_elite_mgr664);
      _ -> ok
    end,
    ets:to_dets(arena_elite_rank, arena_elite_rank),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr666, _,
       {__Levelarena_elite_mgr666, __Tracesarena_elite_mgr666}}
	  when __Levelarena_elite_mgr666 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr666 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, terminate},
			{line, 666}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelarena_elite_mgr666,
		       __Tracesarena_elite_mgr666, lager_event,
		       __Pidarena_elite_mgr666);
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
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr685, _,
       {__Levelarena_elite_mgr685, __Tracesarena_elite_mgr685}}
	  when __Levelarena_elite_mgr685 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr685 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, idle},
			{line, 685}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("精英赛开战, 进入开战期", []), none, 4096, 64,
		       __Levelarena_elite_mgr685, __Tracesarena_elite_mgr685,
		       lager_event, __Pidarena_elite_mgr685);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    NextOpenTime =
	arena_elite_data:get_constant(close_time),
    TimeOut = date:next_diff(NextOpenTime) * 1000,
    sys_env:save(arena_elite_open_state,
		 {Ts, TimeOut, open}),
    role_group:apply(world,
		     {arena_elite_lib, push_combat_state, []}),
    case check_open() of
      {false, _Msg} -> skip;
      _ ->
	  NoticeMsg =
	      color:msg(lang:get(<<"跨服PVP玩法超凡段位赛已开启挑战，请勇者们前来参与，酷炫强力的~ts在召唤着你！荣誉属于"
				   "真正的强者！~ts"/utf8>>),
			[{string, {orange, lang:get(<<"神器幻化外观"/utf8>>)}},
			 {href, {55, green, [], lang:get(<<"【我要参与】"/utf8>>)}}]),
	  notice:broadcast(rumor_left_top, NoticeMsg)
    end,
    continue(open,
	     State#state{ts = Ts, timeout = TimeOut, switch = open});
idle(_Any, State) -> continue(idle, State).

open(timeout, State = #state{}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_mgr710, _,
       {__Levelarena_elite_mgr710, __Tracesarena_elite_mgr710}}
	  when __Levelarena_elite_mgr710 band 64 /= 0 orelse
		 __Tracesarena_elite_mgr710 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_mgr}, {function, open},
			{line, 710}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("精英赛开战时间结束, 进入空闲期", []), none, 4096, 64,
		       __Levelarena_elite_mgr710, __Tracesarena_elite_mgr710,
		       lager_event, __Pidarena_elite_mgr710);
      _ -> ok
    end,
    Ts = date:unixtime(ms),
    NextOpenTime = arena_elite_data:get_constant(open_time),
    TimeOut = date:next_diff(NextOpenTime) * 1000,
    sys_env:save(arena_elite_open_state,
		 {Ts, TimeOut, idle}),
    role_group:apply(world,
		     {arena_elite_lib, push_combat_state, []}),
    continue(idle,
	     State#state{ts = Ts, timeout = TimeOut, switch = idle});
open(_Any, State) -> continue(open, State).

do_init_king_role(Flag) ->
    ZoneId = get_zid(sys_lib:srv_id()),
    Fun = fun (CRole = #c_e_role{elite_lev = EliteLev,
				 is_king = IsKing},
	       Acc) ->
		  case Flag of
		    false when IsKing == 1 ->
			NewCRole = CRole#c_e_role{is_king = 0, zid = ZoneId},
			update_ets(arena_elite_role, NewCRole, all),
			[NewCRole | Acc];
		    true when EliteLev >= 18 ->
			NewCRole = CRole#c_e_role{is_king = 1, zid = ZoneId},
			update_ets(arena_elite_role, NewCRole, all),
			[NewCRole | Acc];
		    _ -> Acc
		  end
	  end,
    L = ets:foldl(Fun, [], arena_elite_role),
    put(arena_elite_king_roles, L),
    erlang:send_after(util:rand(1, 200), self(),
		      new_period_update_arena_role).

get_content(Lev, Msg1, Msg2) when Lev >= 22 ->
    Msg3 = {string, {orange, lang:get(<<"【海神三叉戟】"/utf8>>)}},
    Msg4 = {string, {orange, lang:get(<<"【冠世王者】"/utf8>>)}},
    color:msg(lang:get(<<"尊敬的冒险者大人，恭喜您在~ts中获得~ts的段位！除了以下的段位结算奖励，还有~ts神器"
			 "幻化外观和~ts头像框，希望您在接下来的赛季中能继续出色的表现！"/utf8>>),
	      [Msg1, Msg2, Msg3, Msg4]);
get_content(Lev, Msg1, Msg2) when Lev >= 20 ->
    Msg3 = {string, {orange, lang:get(<<"【冠世王者】"/utf8>>)}},
    color:msg(lang:get(<<"尊敬的冒险者大人，恭喜您在~ts中获得~ts的段位！除了以下的段位结算奖励，还有~ts头像"
			 "框，希望您在接下来的赛季中能继续出色的表现！"/utf8>>),
	      [Msg1, Msg2, Msg3]);
get_content(_, Msg1, Msg2) ->
    color:msg(lang:get(<<"尊敬的冒险者大人，恭喜您在~ts中获得~ts的段位！以下是段位结算奖励，希望您在接下来的赛"
			 "季中能继续出色的表现！"/utf8>>),
	      [Msg1, Msg2]).

do_award(Type) ->
    Fun = fun (#c_e_role{id = Id, lev = RoleLev,
			 elite_lev = Lev, score = Score},
	       Acc) ->
		  case RoleLev >=
			 arena_elite_data:get_constant(open_person_lev_limit)
		      of
		    true ->
			case arena_elite_data:get_award(Lev) of
			  Rewards = [_ | _] ->
			      Name = arena_elite_data:get_lev_name(Lev),
			      Msg1 = case Type of
				       del ->
					   {string,
					    {blue,
					     lang:get(<<"超凡段位赛（下半赛季）"/utf8>>)}};
				       _ ->
					   {string,
					    {blue,
					     lang:get(<<"超凡段位赛（上半赛季）"/utf8>>)}}
				     end,
			      Msg2 = {string,
				      {blue,
				       util:fbin(lang:get(<<"【~ts】"/utf8>>),
						 [Name])}},
			      Content = get_content(Lev, Msg1, Msg2),
			      {Assets, Items} =
				  format:split_assets_items(Rewards),
			      LogMsg = util:fbin("超凡段位赛段位等级结算奖励[elite_lev:~w]",
						 [Lev]),
			      Mail = {lang:get(<<"超凡段位赛结算奖励"/utf8>>), Content,
				      Assets, Items, LogMsg},
			      mail:send(Id, Mail),
			      [{Id, Lev, Score} | Acc];
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    L = ets:foldl(Fun, [], arena_elite_role),
    update_ets(arena_elite_reward_lev, L, reset_all),
    case Type of
      del ->
	  room_feat_mgr:info({arena_elite_do_feat2, L}),
	  ets:delete_all_objects(arena_elite_role),
	  dets:delete_all_objects(arena_elite_role);
      _ -> ok
    end,
    ok.

load() ->
    MinLev =
	arena_elite_data:get_constant(open_person_lev_limit),
    case
      db:get_all("select rid, srv_id, name, lev, max_power, "
		 "face_id from role where lev >= ? ",
		 [MinLev], 60000)
	of
      {ok, L} -> do_load(L, []);
      _ -> []
    end.

do_load([], L) -> L;
do_load([[Rid, SrvId, Name, Lev, Power, FaceId] | T],
	L) ->
    WinRio = 5.0e-1,
    Star = get_star({Rid, SrvId}),
    Zid = get_zid({Rid, SrvId}),
    R = #c_e_role{id = {Rid, SrvId}, name = Name, lev = Lev,
		  power = Power, face = FaceId, look_id = 110401,
		  score = 1000, elite_lev = 1, win_rio = WinRio,
		  all_star = Star, zid = Zid},
    do_load(T, [R | L]).

get_arena_elite_num() ->
    MinLev =
	arena_elite_data:get_constant(open_person_lev_limit),
    LimitDday =
	arena_elite_data:get_constant(activity_player_condition),
    LimitTime = date:unixtime() - 86400 * LimitDday,
    case db:get_one("select count(*) from role where lev "
		    ">= ? and (logout_time > ? or login_time "
		    "> ?)",
		    [MinLev, LimitTime, LimitTime], 60000)
	of
      {ok, Num} -> Num;
      _ -> 0
    end.

get_star(Id) ->
    case role_robot:get_role(Id) of
      {ok, Robot = #role_robot{}} ->
	  arena_elite_lib:get_sys_formation_star(Robot);
      _ -> arena_elite_data:get_constant(strength_var3)
    end.

load_no_login() ->
    case
      db:get_all("select rid, srv_id from role where lev "
		 ">= ? and logout_time < ? and login_time "
		 "< ? ",
		 [100, 1554652800, 1554652800], 60000)
	of
      {ok, L} -> [{Rid, Sid} || [Rid, Sid] <- L];
      _ -> []
    end.


