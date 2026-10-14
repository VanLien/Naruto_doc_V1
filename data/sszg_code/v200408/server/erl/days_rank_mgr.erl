-file("data/days_rank_mgr.erl", 1).

-file("src/mod/holiday_days_rank/days_rank_mgr.erl", 1).

-module(days_rank_mgr).

-lager_records([{state,
		 [timer, warn_timer, cluster_timer, cluster_warn_timer,
		  switch]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{name_index, [name, id, acc, pid, conn_pid]},
		{id_index, [id, name, acc, pid, conn_pid, login_err]},
		{arena_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power, type,
		  ret, replay_id, score, time, face_update_time,
		  face_file]},
		{arena_role_log, [id, logs]},
		{arena_rank, [rank, id, score]},
		{arena_role,
		 [id, name, lev, sex, gid, gname, face, power, max_power,
		  lookid, score, rank, time, avatar_id, champion_power,
		  face_update_time, face_file]},
		{arena_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{arena_f,
		 [id, name, idx, lev, sex, face, power, status,
		  formation_type, formation_lev, pos_info, robot_id,
		  avatar_id, face_update_time, face_file, gid, gname]},
		{m_arena,
		 [ver, ref_time, ref_list, cont_win, buff_id,
		  season_ref_time, can_combat_num, had_combat_num,
		  buy_combat_num, acc_combat_num, season_reward]},
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{activity, [id, status, name, data, ext_args]},
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

-export([start_link/0, list/1, rank_info/2, reload/0,
	 zero_update/0, check_open_type/1,
	 check_open_cluster_type/1, get_rank_bak/2,
	 arena_to_rank/0, send_reward/1, early_warn/1,
	 in_rank/3]).

-export([info/1, cast/1, call/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/holiday_days_rank/days_rank_mgr.erl",
      34).

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

-file("src/mod/holiday_days_rank/days_rank_mgr.erl",
      35).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_days_rank/days_rank_mgr.erl",
      36).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/holiday_days_rank/days_rank_mgr.erl",
      37).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_days_rank/days_rank_mgr.erl",
      38).

-file("inc/arena.hrl", 1).

-record(m_arena,
	{ver = 1, ref_time = 0, ref_list = [], cont_win = 0,
	 buff_id = 0, season_ref_time = 0, can_combat_num = 0,
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, season_reward = []}).

-record(arena_f,
	{id = {0, <<>>}, name = <<>>, idx = 0, lev = 0, sex = 0,
	 face = 0, power = 0, status = 0, formation_type = 0,
	 formation_lev = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, face_update_time = 0, face_file = <<>>,
	 gid = {0, <<>>}, gname = <<>>}).

-record(arena_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext}).

-record(arena_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, champion_power = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_role_log, {id = {0, <<>>}, logs = []}).

-record(arena_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, type = 1, ret = 1,
	 replay_id = 0, score = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/holiday_days_rank/days_rank_mgr.erl",
      39).

-file("inc/role_query.hrl", 1).

-record(id_index,
	{id = {0, <<>>}, name = <<>>, acc = <<>>, pid, conn_pid,
	 login_err = 0}).

-record(name_index,
	{name = <<>>, id = {0, <<>>}, acc = <<>>, pid,
	 conn_pid}).

-file("src/mod/holiday_days_rank/days_rank_mgr.erl",
      40).

-file("inc/var.hrl", 1).

-record(m_var,
	{ver = -1, last_reset_time = 0  :: non_neg_integer(),
	 last_reset_day = {0, 0, 0}  ::
	     {non_neg_integer(), non_neg_integer(),
	      non_neg_integer()},
	 last_reset_five = 0  :: non_neg_integer(),
	 last_reset_week = {0, 0}  ::
	     {non_neg_integer(), non_neg_integer()},
	 last_acc_time = 0  :: non_neg_integer(),
	 acc_time = 0  :: non_neg_integer(),
	 login_charge_count = 0  :: non_neg_integer(),
	 acc_charge_count = 0  :: non_neg_integer(),
	 login_charge_num = 0  :: non_neg_integer(),
	 day_login = 0  :: non_neg_integer(),
	 acc_login_count = 0  :: non_neg_integer(),
	 total_acc_time = 0  :: non_neg_integer(),
	 acc_days = 1  :: non_neg_integer(),
	 best_days = 1  :: non_neg_integer(),
	 now_days = 1  :: non_neg_integer(),
	 month_days = 1  :: non_neg_integer(),
	 day_vars = []  :: [tuple()],
	 five_vars = []  :: [tuple()],
	 week_vars = []  :: [tuple()],
	 month_vars = []  :: [tuple()],
	 timeout_vars = []  :: [tuple()],
	 acc_vars = []  :: [tuple()],
	 other_vars = []  :: [tuple()],
	 week_five_vars = []  :: [tuple()],
	 week_five_time = 0  :: non_neg_integer()}).

-record(role_var,
	{id = {0, "", 0}  :: tuple(), vars = []  :: [tuple()]}).

-file("src/mod/holiday_days_rank/days_rank_mgr.erl",
      41).

-record(state,
	{timer = undefined, warn_timer = undefined,
	 cluster_timer = undefined,
	 cluster_warn_timer = undefined, switch = close}).

-export([gm_del/1, gm_finish/1, gm_reset/1]).

gm_del(1) ->
    sys_env:del(days_rank_cluster_info_env),
    days_rank_mgr:info(cluster_open);
gm_del(_) -> sys_env:del(days_rank_info_env).

gm_finish(List) ->
    Info = info(), save_info(Info#{finish => List}), ok.

gm_reset(Day) ->
    Info = info_cluster(),
    NewTime = date:unixtime(zero) - 86400 * max(0, Day - 1),
    NewInfo = Info#{start_time => NewTime,
		    start_time_zero => NewTime},
    cluster_group:group_other_cast(days_rank_mgr, info,
				   [{sync_cluster_info, NewInfo}]),
    save_info_cluster(NewInfo).

get_sygame_1_time(EndTimeT, _) -> EndTimeT.

list(1) ->
    case info_cluster() of
      #{status := open, open := OpenL, close := Close} ->
	  List = Close ++ OpenL,
	  [{Id, ET} || {Id, _ST, ET} <- List];
      _ -> []
    end;
list(_) ->
    case info() of
      #{status := open, open := OpenL, close := Close} ->
	  List = Close ++ OpenL,
	  [{Id, ET} || {Id, _ST, ET} <- List];
      _ -> []
    end.

rank_info(Role = #role{}, Id) ->
    case (days_rank:data_mod()):get(Id) of
      #{rank_type := Type, is_cluster := 1} ->
	  case info_cluster() of
	    Info = #{status := open} ->
		rank_info(Role, Id, Type, Info);
	    _ -> false
	  end;
      #{rank_type := Type, is_cluster := 0} ->
	  case info() of
	    Info = #{status := open} ->
		rank_info(Role, Id, Type, Info);
	    _ -> false
	  end;
      _ -> false
    end.

rank_info(Role, Id, Type = 11,
	  #{status := open, open := OpenL, close := CloseL}) ->
    case lists:keyfind(Id, 1, OpenL) of
      {Id, _ST, ET} ->
	  ArenaList = arena_lib:list_rank(100),
	  RankList = [to_rank_rc(ArenaRole)
		      || ArenaRole <- ArenaList],
	  do_rank_info(Role, Type, ET, RankList);
      _ ->
	  case lists:keyfind(Id, 1, CloseL) of
	    {Id, _ST, ET} ->
		case get_rank_bak(by_id, Id) of
		  {ok, #{rank := #rank{list = RankList}}} ->
		      do_rank_info(Role, Type, ET, RankList);
		  [] -> {ok, ET, 0, []};
		  _ -> false
		end;
	    _ -> false
	  end
    end;
rank_info(Role, Id, Type,
	  #{status := open, open := OpenL, close := CloseL}) ->
    case lists:keyfind(Id, 1, OpenL) of
      {Id, _ST, ET} ->
	  NewType = case Type of
		      9 -> 2;
		      10 -> 3;
		      12 -> 6;
		      29 -> 18;
		      31 -> 32;
		      25 -> 1006;
		      _ -> Type
		    end,
	  RankList = rank:list(NewType),
	  do_rank_info(Role, Type, ET, RankList);
      _ ->
	  case lists:keyfind(Id, 1, CloseL) of
	    {Id, _ST, ET} ->
		case get_rank_bak(by_id, Id) of
		  {ok, #{rank := #rank{list = RankList}}} ->
		      do_rank_info(Role, Type, ET, RankList);
		  [] -> {ok, ET, 0, []};
		  _ -> false
		end;
	    _ -> false
	  end
    end.

do_rank_info(Role = #role{}, Type, ET, RankList) ->
    do_rank_info(Role, Type, ET, RankList, 3, []).

do_rank_info(#role{id = Rid}, Type, ET, RankList, Num,
	     Acc)
    when Num =< 0 ->
    Idx = rank:idx(Type, Rid, RankList), {ok, ET, Idx, Acc};
do_rank_info(Role = #role{}, Type, ET, RankList, Num,
	     Acc) ->
    case rank:rank(Type, Num, RankList) of
      {ok,
       #rank_rc{name = Name, lev = Lev, face_id = FaceId,
		rid = FstRid, srv_id = FstSrvId,
		avatar_bid = AvatarId}} ->
	  NewAcc = [{Num, Name, Lev, FaceId, AvatarId, FstRid,
		     FstSrvId}
		    | Acc],
	  do_rank_info(Role, Type, ET, RankList, Num - 1, NewAcc);
      _Other ->
	  do_rank_info(Role, Type, ET, RankList, Num - 1, Acc)
    end.

check_open_cluster(Types = [_ | _]) ->
    case info_cluster() of
      #{status := open, open := List} ->
	  check_open(Types, List, []);
      _ -> []
    end.

check_open(Types = [_ | _]) ->
    case info() of
      #{status := open, open := List} ->
	  check_open(Types, List, []);
      _ -> []
    end.

check_open(Type, List) ->
    case (days_rank:data_mod()):type_id(Type) of
      Id when is_integer(Id) ->
	  case lists:keyfind(Id, 1, List) of
	    Tuple when is_tuple(Tuple) ->
		[#{type => Type, id => Id}];
	    _ -> []
	  end;
      Undef ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr243, _,
	     {__Leveldays_rank_mgr243, __Tracesdays_rank_mgr243}}
		when __Leveldays_rank_mgr243 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr243 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, check_open},
			      {line, 243}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("不存在的七天排行榜类型Type:~w,~w",
					   [Type, Undef]),
			     none, 4096, 8, __Leveldays_rank_mgr243,
			     __Tracesdays_rank_mgr243, lager_event,
			     __Piddays_rank_mgr243);
	    _ -> ok
	  end,
	  []
    end.

check_open([], _List, Acc) -> Acc;
check_open([Type | Rest], List, Acc) ->
    NewAcc = case check_open(Type, List) of
	       RtnL = [_ | _] -> RtnL ++ Acc;
	       _ -> Acc
	     end,
    check_open(Rest, List, NewAcc).

check_open_type(Types = [_ | _]) ->
    case check_open(Types) of
      OpenTypes = [_ | _] ->
	  [RankType || #{type := RankType} <- OpenTypes];
      _ -> []
    end;
check_open_type(Type) -> check_open([Type]).

check_open_cluster_type(Types = [_ | _]) ->
    case check_open_cluster(Types) of
      OpenTypes = [_ | _] ->
	  [RankType || #{type := RankType} <- OpenTypes];
      _ -> []
    end;
check_open_cluster_type(Type) ->
    check_open_cluster([Type]).

is_open_cluster() ->
    case info_cluster() of
      #{status := open} -> true;
      _ -> false
    end.

is_open() ->
    case info() of
      #{status := open} -> true;
      _ -> false
    end.

reload() -> gen_server:cast(days_rank_mgr, reload), ok.

reload_cluster() ->
    gen_server:cast(days_rank_mgr, reload_cluster), ok.

zero_update() -> reload(), reload_cluster().

start_link() ->
    gen_server:start_link({local, days_rank_mgr},
			  days_rank_mgr, [], []).

info(Info) -> days_rank_mgr ! Info.

cast(Info) -> gen_server:cast(days_rank_mgr, Info).

call(Info) ->
    case catch gen_server:call(days_rank_mgr, Info, 10000)
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
	    {__Piddays_rank_mgr315, _,
	     {__Leveldays_rank_mgr315, __Tracesdays_rank_mgr315}}
		when __Leveldays_rank_mgr315 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr315 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, call},
			      {line, 315}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [days_rank_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Leveldays_rank_mgr315,
			     __Tracesdays_rank_mgr315, lager_event,
			     __Piddays_rank_mgr315);
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

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_mgr322, _,
       {__Leveldays_rank_mgr322, __Tracesdays_rank_mgr322}}
	  when __Leveldays_rank_mgr322 band 64 /= 0 orelse
		 __Tracesdays_rank_mgr322 /= [] ->
	  lager:do_log(info,
		       [{module, days_rank_mgr}, {function, init}, {line, 322},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [days_rank_mgr]), none,
		       4096, 64, __Leveldays_rank_mgr322,
		       __Tracesdays_rank_mgr322, lager_event,
		       __Piddays_rank_mgr322);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    case catch load_data() of
      ok ->
	  OpenTime = sys_env:srv_open_time(),
	  OpenCfg =
	      date:datetime_to_seconds((days_rank:data_mod()):get_const(open_time)),
	  Info = #{finish := Finish} = info(),
	  ServerId = sys_env:get(server_id),
	  case OpenTime >= OpenCfg andalso
		 ServerId =/= <<"sygame_25">>
	      of
	    true ->
		Now = date:unixtime(),
		EndTimeT =
		    date:parse_time((days_rank:data_mod()):get_const(end_time)),
		EndTime = get_sygame_1_time(EndTimeT,
					    sys_env:get(server_id)),
		case Now >= EndTime of
		  false ->
		      {OpenL, CloseL} = open_list(Finish),
		      {NewInfo, Timer, WarnTimer} = case OpenL of
						      [_ | _] ->
							  activity_global:set_activity(108,
										       1,
										       []),
							  {Ref, WarnRef} =
							      init_timer(OpenL),
							  {Info#{status => open,
								 open => OpenL,
								 close =>
								     CloseL},
							   Ref, WarnRef};
						      _ ->
							  {Info#{status =>
								     close},
							   undefined, undefined}
						    end,
		      save_info(NewInfo),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Piddays_rank_mgr348, _,
			 {__Leveldays_rank_mgr348, __Tracesdays_rank_mgr348}}
			    when __Leveldays_rank_mgr348 band 64 /= 0 orelse
				   __Tracesdays_rank_mgr348 /= [] ->
			    lager:do_log(info,
					 [{module, days_rank_mgr},
					  {function, init}, {line, 348},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~w] 启动完成Now:~w, Endtime:~w, Info:~w",
						       [days_rank_mgr, Now,
							EndTime, NewInfo]),
					 none, 4096, 64,
					 __Leveldays_rank_mgr348,
					 __Tracesdays_rank_mgr348, lager_event,
					 __Piddays_rank_mgr348);
			_ -> ok
		      end,
		      {ok,
		       init_cluster(#state{timer = Timer,
					   warn_timer = WarnTimer})};
		  _ ->
		      NewInfo = default_close(Info, 0),
		      save_info(NewInfo),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Piddays_rank_mgr353, _,
			 {__Leveldays_rank_mgr353, __Tracesdays_rank_mgr353}}
			    when __Leveldays_rank_mgr353 band 64 /= 0 orelse
				   __Tracesdays_rank_mgr353 /= [] ->
			    lager:do_log(info,
					 [{module, days_rank_mgr},
					  {function, init}, {line, 353},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~w] 启动完成Now:~w, Endtime:~w, Info:~w",
						       [days_rank_mgr, Now,
							EndTime, NewInfo]),
					 none, 4096, 64,
					 __Leveldays_rank_mgr353,
					 __Tracesdays_rank_mgr353, lager_event,
					 __Piddays_rank_mgr353);
			_ -> ok
		      end,
		      {ok, init_cluster(#state{})}
		end;
	    false ->
		NewInfo = default_close(Info, 0),
		save_info(NewInfo),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddays_rank_mgr359, _,
		   {__Leveldays_rank_mgr359, __Tracesdays_rank_mgr359}}
		      when __Leveldays_rank_mgr359 band 64 /= 0 orelse
			     __Tracesdays_rank_mgr359 /= [] ->
		      lager:do_log(info,
				   [{module, days_rank_mgr}, {function, init},
				    {line, 359}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~w] 启动完成OpenTime:~w, Cfg:~w, Info:~w",
						 [days_rank_mgr, OpenTime,
						  OpenCfg, NewInfo]),
				   none, 4096, 64, __Leveldays_rank_mgr359,
				   __Tracesdays_rank_mgr359, lager_event,
				   __Piddays_rank_mgr359);
		  _ -> ok
		end,
		{ok, init_cluster(#state{})}
	  end;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr363, _,
	     {__Leveldays_rank_mgr363, __Tracesdays_rank_mgr363}}
		when __Leveldays_rank_mgr363 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr363 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, init},
			      {line, 363}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]启动失败[Err:~w]",
					   [days_rank_mgr, Err]),
			     none, 4096, 8, __Leveldays_rank_mgr363,
			     __Tracesdays_rank_mgr363, lager_event,
			     __Piddays_rank_mgr363);
	    _ -> ok
	  end,
	  {stop, abnormal}
    end.

handle_call(_Request, _From, State) ->
    Reply = ok, {reply, Reply, State}.

handle_cast(reload,
	    State = #state{timer = Timer,
			   warn_timer = WarnTimer}) ->
    cancel_timer(Timer),
    cancel_timer(WarnTimer),
    Info = #{finish := Finish} = info(),
    {OpenL, CloseL} = open_list(Finish),
    {NewInfo, NextTimer, NextWarnTimer} = case OpenL of
					    [_ | _] ->
						[{Id, _, _} | _] =
						    lists:keysort(3, OpenL),
						open_ico(Id),
						{Ref, WarnRef} =
						    init_timer(OpenL),
						NInfo = Info#{status => open,
							      open => OpenL,
							      close => CloseL},
						case {whereis(lager_event),
						      whereis(lager_event),
						      lager_config:get({lager_event,
									loglevel},
								       {0, []})}
						    of
						  {undefined, undefined, _} ->
						      fun () ->
							      {error,
							       lager_not_running}
						      end();
						  {undefined, _, _} ->
						      fun () ->
							      {error,
							       {sink_not_configured,
								lager_event}}
						      end();
						  {__Piddays_rank_mgr384, _,
						   {__Leveldays_rank_mgr384,
						    __Tracesdays_rank_mgr384}}
						      when
							__Leveldays_rank_mgr384
							  band 64
							  /= 0
							  orelse
							  __Tracesdays_rank_mgr384
							    /= [] ->
						      lager:do_log(info,
								   [{module,
								     days_rank_mgr},
								    {function,
								     handle_cast},
								    {line, 384},
								    {pid,
								     pid_to_list(self())},
								    {node,
								     node()}
								    | lager:md()],
								   io_lib:format("七天排行重载，开放排行榜:~w",
										 [NInfo]),
								   none, 4096,
								   64,
								   __Leveldays_rank_mgr384,
								   __Tracesdays_rank_mgr384,
								   lager_event,
								   __Piddays_rank_mgr384);
						  _ -> ok
						end,
						{NInfo, Ref, WarnRef};
					    _ ->
						case {whereis(lager_event),
						      whereis(lager_event),
						      lager_config:get({lager_event,
									loglevel},
								       {0, []})}
						    of
						  {undefined, undefined, _} ->
						      fun () ->
							      {error,
							       lager_not_running}
						      end();
						  {undefined, _, _} ->
						      fun () ->
							      {error,
							       {sink_not_configured,
								lager_event}}
						      end();
						  {__Piddays_rank_mgr387, _,
						   {__Leveldays_rank_mgr387,
						    __Tracesdays_rank_mgr387}}
						      when
							__Leveldays_rank_mgr387
							  band 64
							  /= 0
							  orelse
							  __Tracesdays_rank_mgr387
							    /= [] ->
						      lager:do_log(info,
								   [{module,
								     days_rank_mgr},
								    {function,
								     handle_cast},
								    {line, 387},
								    {pid,
								     pid_to_list(self())},
								    {node,
								     node()}
								    | lager:md()],
								   io_lib:format("七天排行已关闭:~w",
										 [Info]),
								   none, 4096,
								   64,
								   __Leveldays_rank_mgr387,
								   __Tracesdays_rank_mgr387,
								   lager_event,
								   __Piddays_rank_mgr387);
						  _ -> ok
						end,
						{Info, undefined, undefined}
					  end,
    save_info(NewInfo),
    role_group:apply(world, {days_rank, zero_flush, []}),
    {noreply,
     State#state{timer = NextTimer,
		 warn_timer = NextWarnTimer}};
handle_cast(reload_cluster,
	    State = #state{cluster_timer = Timer,
			   cluster_warn_timer = WarnTimer}) ->
    case info_cluster() of
      Info = #{finish := Finish, is_main := 1} ->
	  cancel_timer(Timer),
	  cancel_timer(WarnTimer),
	  {OpenL, CloseL} = open_list_cluster(Finish),
	  {NewInfo, NextTimer, NextWarnTimer} = case OpenL of
						  [_ | _] ->
						      open_cluster_ico(),
						      {Ref, WarnRef} =
							  init_timer(OpenL),
						      NInfo = Info#{status =>
									open,
								    open =>
									OpenL,
								    close =>
									CloseL},
						      case
							{whereis(lager_event),
							 whereis(lager_event),
							 lager_config:get({lager_event,
									   loglevel},
									  {0,
									   []})}
							  of
							{undefined, undefined,
							 _} ->
							    fun () ->
								    {error,
								     lager_not_running}
							    end();
							{undefined, _, _} ->
							    fun () ->
								    {error,
								     {sink_not_configured,
								      lager_event}}
							    end();
							{__Piddays_rank_mgr407,
							 _,
							 {__Leveldays_rank_mgr407,
							  __Tracesdays_rank_mgr407}}
							    when
							      __Leveldays_rank_mgr407
								band 64
								/= 0
								orelse
								__Tracesdays_rank_mgr407
								  /= [] ->
							    lager:do_log(info,
									 [{module,
									   days_rank_mgr},
									  {function,
									   handle_cast},
									  {line,
									   407},
									  {pid,
									   pid_to_list(self())},
									  {node,
									   node()}
									  | lager:md()],
									 io_lib:format("七天排行重载，开放排行榜:~w",
										       [NInfo]),
									 none,
									 4096,
									 64,
									 __Leveldays_rank_mgr407,
									 __Tracesdays_rank_mgr407,
									 lager_event,
									 __Piddays_rank_mgr407);
							_ -> ok
						      end,
						      {NInfo, Ref, WarnRef};
						  _ ->
						      case
							{whereis(lager_event),
							 whereis(lager_event),
							 lager_config:get({lager_event,
									   loglevel},
									  {0,
									   []})}
							  of
							{undefined, undefined,
							 _} ->
							    fun () ->
								    {error,
								     lager_not_running}
							    end();
							{undefined, _, _} ->
							    fun () ->
								    {error,
								     {sink_not_configured,
								      lager_event}}
							    end();
							{__Piddays_rank_mgr410,
							 _,
							 {__Leveldays_rank_mgr410,
							  __Tracesdays_rank_mgr410}}
							    when
							      __Leveldays_rank_mgr410
								band 64
								/= 0
								orelse
								__Tracesdays_rank_mgr410
								  /= [] ->
							    lager:do_log(info,
									 [{module,
									   days_rank_mgr},
									  {function,
									   handle_cast},
									  {line,
									   410},
									  {pid,
									   pid_to_list(self())},
									  {node,
									   node()}
									  | lager:md()],
									 io_lib:format("七天排行已关闭:~w",
										       [Info]),
									 none,
									 4096,
									 64,
									 __Leveldays_rank_mgr410,
									 __Tracesdays_rank_mgr410,
									 lager_event,
									 __Piddays_rank_mgr410);
							_ -> ok
						      end,
						      {Info, undefined,
						       undefined}
						end,
	  save_info_cluster(NewInfo),
	  cluster_group:group_other_cast(days_rank_mgr, info,
					 [{sync_cluster_info, NewInfo}]),
	  {noreply,
	   State#state{cluster_timer = NextTimer,
		       cluster_warn_timer = NextWarnTimer}};
      _ -> {noreply, State}
    end;
handle_cast(_Msg, State) -> {noreply, State}.

handle_info({close, Id},
	    State = #state{timer = Timer,
			   warn_timer = WarnTimer}) ->
    cancel_timer(Timer),
    cancel_timer(WarnTimer),
    Info = #{finish := Finish} = info(),
    case lists:member(Id, Finish) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr430, _,
	     {__Leveldays_rank_mgr430, __Tracesdays_rank_mgr430}}
		when __Leveldays_rank_mgr430 band 64 /= 0 orelse
		       __Tracesdays_rank_mgr430 /= [] ->
		lager:do_log(info,
			     [{module, days_rank_mgr}, {function, handle_info},
			      {line, 430}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("发放七天排行奖励Id:~w", [Id]), none, 4096,
			     64, __Leveldays_rank_mgr430,
			     __Tracesdays_rank_mgr430, lager_event,
			     __Piddays_rank_mgr430);
	    _ -> ok
	  end,
	  send_reward(Id),
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
	    {__Piddays_rank_mgr434, _,
	     {__Leveldays_rank_mgr434, __Tracesdays_rank_mgr434}}
		when __Leveldays_rank_mgr434 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr434 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, handle_info},
			      {line, 434}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("已发放过七天排行奖励Id:~w, Info:~w",
					   [Id, Info]),
			     none, 4096, 8, __Leveldays_rank_mgr434,
			     __Tracesdays_rank_mgr434, lager_event,
			     __Piddays_rank_mgr434);
	    _ -> ok
	  end,
	  ok
    end,
    NewFinish = [Id | Finish],
    {OpenL, CloseL} = open_list(NewFinish),
    {NewInfo, NextTimer, NextWarnTimer} = case OpenL of
					    [] ->
						close_ico(),
						Now = date:unixtime(),
						NInfo = Info#{status => close,
							      open => OpenL,
							      close => CloseL,
							      finish =>
								  NewFinish,
							      end_time => Now},
						case {whereis(lager_event),
						      whereis(lager_event),
						      lager_config:get({lager_event,
									loglevel},
								       {0, []})}
						    of
						  {undefined, undefined, _} ->
						      fun () ->
							      {error,
							       lager_not_running}
						      end();
						  {undefined, _, _} ->
						      fun () ->
							      {error,
							       {sink_not_configured,
								lager_event}}
						      end();
						  {__Piddays_rank_mgr448, _,
						   {__Leveldays_rank_mgr448,
						    __Tracesdays_rank_mgr448}}
						      when
							__Leveldays_rank_mgr448
							  band 64
							  /= 0
							  orelse
							  __Tracesdays_rank_mgr448
							    /= [] ->
						      lager:do_log(info,
								   [{module,
								     days_rank_mgr},
								    {function,
								     handle_info},
								    {line, 448},
								    {pid,
								     pid_to_list(self())},
								    {node,
								     node()}
								    | lager:md()],
								   io_lib:format("七天排行Id:~w关闭，关闭七天排行活动:~w",
										 [Id,
										  NInfo]),
								   none, 4096,
								   64,
								   __Leveldays_rank_mgr448,
								   __Tracesdays_rank_mgr448,
								   lager_event,
								   __Piddays_rank_mgr448);
						  _ -> ok
						end,
						{NInfo, undefined, undefined};
					    _ ->
						[{NewId, _, _} | _] =
						    lists:keysort(3, OpenL),
						open_ico(NewId),
						{NextRef, NextWarnRef} =
						    init_timer(OpenL),
						NInfo = Info#{status => open,
							      open => OpenL,
							      close => CloseL,
							      finish =>
								  NewFinish},
						case {whereis(lager_event),
						      whereis(lager_event),
						      lager_config:get({lager_event,
									loglevel},
								       {0, []})}
						    of
						  {undefined, undefined, _} ->
						      fun () ->
							      {error,
							       lager_not_running}
						      end();
						  {undefined, _, _} ->
						      fun () ->
							      {error,
							       {sink_not_configured,
								lager_event}}
						      end();
						  {__Piddays_rank_mgr455, _,
						   {__Leveldays_rank_mgr455,
						    __Tracesdays_rank_mgr455}}
						      when
							__Leveldays_rank_mgr455
							  band 64
							  /= 0
							  orelse
							  __Tracesdays_rank_mgr455
							    /= [] ->
						      lager:do_log(info,
								   [{module,
								     days_rank_mgr},
								    {function,
								     handle_info},
								    {line, 455},
								    {pid,
								     pid_to_list(self())},
								    {node,
								     node()}
								    | lager:md()],
								   io_lib:format("七天排行Id:~w关闭，Info:~w",
										 [Id,
										  NInfo]),
								   none, 4096,
								   64,
								   __Leveldays_rank_mgr455,
								   __Tracesdays_rank_mgr455,
								   lager_event,
								   __Piddays_rank_mgr455);
						  _ -> ok
						end,
						{NInfo, NextRef, NextWarnRef}
					  end,
    save_info(NewInfo),
    {noreply,
     State#state{timer = NextTimer,
		 warn_timer = NextWarnTimer}};
handle_info({close_cluster, Id},
	    State = #state{cluster_timer = Timer,
			   cluster_warn_timer = WarnTimer}) ->
    case info_cluster() of
      Info = #{finish := Finish, is_main := 1} ->
	  cancel_timer(Timer),
	  cancel_timer(WarnTimer),
	  case lists:member(Id, Finish) of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddays_rank_mgr468, _,
		   {__Leveldays_rank_mgr468, __Tracesdays_rank_mgr468}}
		      when __Leveldays_rank_mgr468 band 64 /= 0 orelse
			     __Tracesdays_rank_mgr468 /= [] ->
		      lager:do_log(info,
				   [{module, days_rank_mgr},
				    {function, handle_info}, {line, 468},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("发放七天排行奖励Id:~w", [Id]), none,
				   4096, 64, __Leveldays_rank_mgr468,
				   __Tracesdays_rank_mgr468, lager_event,
				   __Piddays_rank_mgr468);
		  _ -> ok
		end,
		send_reward(Id),
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
		  {__Piddays_rank_mgr472, _,
		   {__Leveldays_rank_mgr472, __Tracesdays_rank_mgr472}}
		      when __Leveldays_rank_mgr472 band 8 /= 0 orelse
			     __Tracesdays_rank_mgr472 /= [] ->
		      lager:do_log(error,
				   [{module, days_rank_mgr},
				    {function, handle_info}, {line, 472},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("已发放过七天排行奖励Id:~w, Info:~w",
						 [Id, Info]),
				   none, 4096, 8, __Leveldays_rank_mgr472,
				   __Tracesdays_rank_mgr472, lager_event,
				   __Piddays_rank_mgr472);
		  _ -> ok
		end,
		ok
	  end,
	  NewFinish = [Id | Finish],
	  {OpenL, CloseL} = open_list_cluster(NewFinish),
	  {NewInfo, NextTimer, NextWarnTimer} = case OpenL of
						  [] ->
						      close_cluster_ico(),
						      Now = date:unixtime(),
						      NInfo = Info#{status =>
									close,
								    open =>
									OpenL,
								    close =>
									CloseL,
								    finish =>
									NewFinish,
								    end_time =>
									Now},
						      case
							{whereis(lager_event),
							 whereis(lager_event),
							 lager_config:get({lager_event,
									   loglevel},
									  {0,
									   []})}
							  of
							{undefined, undefined,
							 _} ->
							    fun () ->
								    {error,
								     lager_not_running}
							    end();
							{undefined, _, _} ->
							    fun () ->
								    {error,
								     {sink_not_configured,
								      lager_event}}
							    end();
							{__Piddays_rank_mgr486,
							 _,
							 {__Leveldays_rank_mgr486,
							  __Tracesdays_rank_mgr486}}
							    when
							      __Leveldays_rank_mgr486
								band 64
								/= 0
								orelse
								__Tracesdays_rank_mgr486
								  /= [] ->
							    lager:do_log(info,
									 [{module,
									   days_rank_mgr},
									  {function,
									   handle_info},
									  {line,
									   486},
									  {pid,
									   pid_to_list(self())},
									  {node,
									   node()}
									  | lager:md()],
									 io_lib:format("七天排行Id:~w关闭，关闭七天排行活动:~w",
										       [Id,
											NInfo]),
									 none,
									 4096,
									 64,
									 __Leveldays_rank_mgr486,
									 __Tracesdays_rank_mgr486,
									 lager_event,
									 __Piddays_rank_mgr486);
							_ -> ok
						      end,
						      {NInfo, undefined,
						       undefined};
						  _ ->
						      {NextRef, NextWarnRef} =
							  init_timer(OpenL),
						      NInfo = Info#{status =>
									open,
								    open =>
									OpenL,
								    close =>
									CloseL,
								    finish =>
									NewFinish},
						      case
							{whereis(lager_event),
							 whereis(lager_event),
							 lager_config:get({lager_event,
									   loglevel},
									  {0,
									   []})}
							  of
							{undefined, undefined,
							 _} ->
							    fun () ->
								    {error,
								     lager_not_running}
							    end();
							{undefined, _, _} ->
							    fun () ->
								    {error,
								     {sink_not_configured,
								      lager_event}}
							    end();
							{__Piddays_rank_mgr491,
							 _,
							 {__Leveldays_rank_mgr491,
							  __Tracesdays_rank_mgr491}}
							    when
							      __Leveldays_rank_mgr491
								band 64
								/= 0
								orelse
								__Tracesdays_rank_mgr491
								  /= [] ->
							    lager:do_log(info,
									 [{module,
									   days_rank_mgr},
									  {function,
									   handle_info},
									  {line,
									   491},
									  {pid,
									   pid_to_list(self())},
									  {node,
									   node()}
									  | lager:md()],
									 io_lib:format("七天排行Id:~w关闭，Info:~w",
										       [Id,
											NInfo]),
									 none,
									 4096,
									 64,
									 __Leveldays_rank_mgr491,
									 __Tracesdays_rank_mgr491,
									 lager_event,
									 __Piddays_rank_mgr491);
							_ -> ok
						      end,
						      {NInfo, NextRef,
						       NextWarnRef}
						end,
	  save_info_cluster(NewInfo),
	  cluster_group:group_other_cast(days_rank_mgr, info,
					 [{sync_cluster_info, NewInfo}]),
	  {noreply,
	   State#state{cluster_timer = NextTimer,
		       cluster_warn_timer = NextWarnTimer}};
      _ -> {noreply, State}
    end;
handle_info({warn, Id},
	    State = #state{warn_timer = WarnTimer,
			   cluster_warn_timer = ClWarnTimer}) ->
    case (days_rank:data_mod()):get(Id) of
      #{is_cluster := 1} ->
	  cancel_timer(ClWarnTimer),
	  early_warn(Id),
	  {noreply, State#state{cluster_warn_timer = undefined}};
      _ ->
	  cancel_timer(WarnTimer),
	  early_warn(Id),
	  {noreply, State#state{warn_timer = undefined}}
    end;
handle_info(cluster_open, State) ->
    case cluster_group:is_main() of
      true ->
	  case info_cluster() of
	    Info = #{start_time := 0} ->
		Now = date:unixtime(),
		NewInfo0 = default_close(Info, 1),
		NewInfo = NewInfo0#{start_time => Now,
				    start_time_zero => date:unixtime(zero),
				    is_main => 1},
		save_info_cluster(NewInfo),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddays_rank_mgr521, _,
		   {__Leveldays_rank_mgr521, __Tracesdays_rank_mgr521}}
		      when __Leveldays_rank_mgr521 band 64 /= 0 orelse
			     __Tracesdays_rank_mgr521 /= [] ->
		      lager:do_log(info,
				   [{module, days_rank_mgr},
				    {function, handle_info}, {line, 521},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~w] 启动完成Now:~w, Info:~w",
						 [days_rank_mgr, Now, NewInfo]),
				   none, 4096, 64, __Leveldays_rank_mgr521,
				   __Tracesdays_rank_mgr521, lager_event,
				   __Piddays_rank_mgr521);
		  _ -> ok
		end,
		{noreply, State};
	    Info ->
		cluster_group:group_other_cast(days_rank_mgr, info,
					       [{sync_cluster_info, Info}]),
		{noreply, State}
	  end;
      _ -> {noreply, State}
    end;
handle_info({sync_cluster_info, Info},
	    State = #state{cluster_timer = Timer,
			   cluster_warn_timer = WarnTimer})
    when is_map(Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_mgr558, _,
       {__Leveldays_rank_mgr558, __Tracesdays_rank_mgr558}}
	  when __Leveldays_rank_mgr558 band 128 /= 0 orelse
		 __Tracesdays_rank_mgr558 /= [] ->
	  lager:do_log(debug,
		       [{module, days_rank_mgr}, {function, handle_info},
			{line, 558}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("sync_cluster_info ~w", [Info]), none,
		       4096, 128, __Leveldays_rank_mgr558,
		       __Tracesdays_rank_mgr558, lager_event,
		       __Piddays_rank_mgr558);
      _ -> ok
    end,
    case cluster_group:is_main() of
      false ->
	  cancel_timer(Timer),
	  cancel_timer(WarnTimer),
	  Open = maps:get(open, Info, []),
	  NWarnTimer = case Open of
			 [_ | _] -> open_cluster_ico(), init_warn_timer(Open);
			 _ -> close_cluster_ico(), undefined
		       end,
	  save_info_cluster(Info#{is_main => 0}),
	  {noreply,
	   State#state{cluster_timer = undefined,
		       cluster_warn_timer = NWarnTimer}};
      _ -> {noreply, State}
    end;
handle_info(_Info, State) -> {noreply, State}.

terminate(Reason,
	  #state{switch = Switch, timer = Timer,
		 warn_timer = WarnTimer, cluster_timer = ClTimer,
		 cluster_warn_timer = ClWarnTimer}) ->
    cancel_timer(Timer),
    cancel_timer(WarnTimer),
    cancel_timer(ClTimer),
    cancel_timer(ClWarnTimer),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_mgr586, _,
       {__Leveldays_rank_mgr586, __Tracesdays_rank_mgr586}}
	  when __Leveldays_rank_mgr586 band 64 /= 0 orelse
		 __Tracesdays_rank_mgr586 /= [] ->
	  lager:do_log(info,
		       [{module, days_rank_mgr}, {function, terminate},
			{line, 586}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]完成关闭:~w,switch:~w",
				     [days_rank_mgr, Reason, Switch]),
		       none, 4096, 64, __Leveldays_rank_mgr586,
		       __Tracesdays_rank_mgr586, lager_event,
		       __Piddays_rank_mgr586);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

init_cluster(State) ->
    case info_cluster() of
      Info = #{start_time := StartTime, is_main := 1,
	       finish := Finish}
	  when StartTime =/= 0 ->
	  Now = date:unixtime(),
	  EndTime =
	      parse_time((days_rank:data_mod()):get_const(cluster_end_time)),
	  case Now >= EndTime of
	    false ->
		{OpenL, CloseL} = open_list_cluster(Finish),
		{NewInfo, Timer, WarnTimer} = case OpenL of
						[_ | _] ->
						    activity_global:set_activity(109,
										 1,
										 []),
						    {Ref, WarnRef} =
							init_timer(OpenL),
						    {Info#{status => open,
							   open => OpenL,
							   close => CloseL},
						     Ref, WarnRef};
						_ ->
						    {Info#{status => close},
						     undefined, undefined}
					      end,
		save_info_cluster(NewInfo),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddays_rank_mgr615, _,
		   {__Leveldays_rank_mgr615, __Tracesdays_rank_mgr615}}
		      when __Leveldays_rank_mgr615 band 64 /= 0 orelse
			     __Tracesdays_rank_mgr615 /= [] ->
		      lager:do_log(info,
				   [{module, days_rank_mgr},
				    {function, init_cluster}, {line, 615},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~w] 启动完成Now:~w, Endtime:~w, Info:~w",
						 [days_rank_mgr, Now, EndTime,
						  NewInfo]),
				   none, 4096, 64, __Leveldays_rank_mgr615,
				   __Tracesdays_rank_mgr615, lager_event,
				   __Piddays_rank_mgr615);
		  _ -> ok
		end,
		State#state{cluster_timer = Timer,
			    cluster_warn_timer = WarnTimer};
	    _ ->
		NewInfo = default_close(Info, 1),
		save_info_cluster(NewInfo),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddays_rank_mgr620, _,
		   {__Leveldays_rank_mgr620, __Tracesdays_rank_mgr620}}
		      when __Leveldays_rank_mgr620 band 64 /= 0 orelse
			     __Tracesdays_rank_mgr620 /= [] ->
		      lager:do_log(info,
				   [{module, days_rank_mgr},
				    {function, init_cluster}, {line, 620},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~w] 启动完成Now:~w, Endtime:~w, Info:~w",
						 [days_rank_mgr, Now, EndTime,
						  NewInfo]),
				   none, 4096, 64, __Leveldays_rank_mgr620,
				   __Tracesdays_rank_mgr620, lager_event,
				   __Piddays_rank_mgr620);
		  _ -> ok
		end,
		State
	  end;
      _ -> State
    end.

load_data() ->
    {ok, days_rank} = dets:open_file(days_rank,
				     [{file, "dets/days_rank.dets"},
				      {keypos, 1}]),
    days_rank = ets:new(days_rank,
			[set, named_table, public, {keypos, 1}]),
    dets:to_ets(days_rank, days_rank),
    ok.

save_rank_bak(Id, Type, Rank) ->
    log_rank:save(Rank),
    Obj = {Id, #{type => Type, rank => Rank}},
    ets:insert(days_rank, Obj),
    dets:insert(days_rank, Obj),
    ok.

get_rank_bak(by_id, Id) ->
    case catch ets:lookup(days_rank, Id) of
      [{Id, #{type := Type, rank := Rank}}] ->
	  {ok, #{id => Id, type => Type, rank => Rank}};
      [] -> [];
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr649, _,
	     {__Leveldays_rank_mgr649, __Tracesdays_rank_mgr649}}
		when __Leveldays_rank_mgr649 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr649 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, get_rank_bak},
			      {line, 649}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Id:~w查询备份排行榜信息错误:~w", [Id, Err]),
			     none, 4096, 8, __Leveldays_rank_mgr649,
			     __Tracesdays_rank_mgr649, lager_event,
			     __Piddays_rank_mgr649);
	    _ -> ok
	  end,
	  false
    end;
get_rank_bak(by_type, Type) ->
    case (days_rank:data_mod()):type_id(Type) of
      Id when is_integer(Id) -> get_rank_bak(by_id, Id);
      Undef ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr657, _,
	     {__Leveldays_rank_mgr657, __Tracesdays_rank_mgr657}}
		when __Leveldays_rank_mgr657 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr657 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, get_rank_bak},
			      {line, 657}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Type:~w没有对应的排行榜Id:~w",
					   [Type, Undef]),
			     none, 4096, 8, __Leveldays_rank_mgr657,
			     __Tracesdays_rank_mgr657, lager_event,
			     __Piddays_rank_mgr657);
	    _ -> ok
	  end,
	  false
    end.

info() ->
    sys_env:get(days_rank_info_env,
		#{status => close, open => [], close => [],
		  finish => []}).

save_info(Val) -> sys_env:save(days_rank_info_env, Val).

info_cluster() ->
    sys_env:get(days_rank_cluster_info_env,
		#{is_main => 0, start_time => 0, start_time_zero => 0,
		  status => close, open => [], close => [],
		  finish => []}).

save_info_cluster(Val) ->
    sys_env:save(days_rank_cluster_info_env, Val).

cancel_timer(Ref) when is_reference(Ref) ->
    catch erlang:cancel_timer(Ref), ok;
cancel_timer(_Ref) -> ok.

init_timer([]) -> {undefined, undefined};
init_timer(OpenList) ->
    case lists:keysort(3, OpenList) of
      [{Id, _ST, ET} | _] ->
	  Now = date:unixtime(),
	  NextT = max(date:diff(second, ET, Now), 1),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr691, _,
	     {__Leveldays_rank_mgr691, __Tracesdays_rank_mgr691}}
		when __Leveldays_rank_mgr691 band 64 /= 0 orelse
		       __Tracesdays_rank_mgr691 /= [] ->
		lager:do_log(info,
			     [{module, days_rank_mgr}, {function, init_timer},
			      {line, 691}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("距离排行榜[Id:~w]奖励时间[Diff:~w]",
					   [Id, NextT]),
			     none, 4096, 64, __Leveldays_rank_mgr691,
			     __Tracesdays_rank_mgr691, lager_event,
			     __Piddays_rank_mgr691);
	    _ -> ok
	  end,
	  WarnRef = case date:diff(second, ET, Now) - 3600 * 2 of
		      NextWarnT
			  when is_integer(NextWarnT) andalso NextWarnT > 0 ->
			  erlang:send_after(NextWarnT * 1000, days_rank_mgr,
					    {warn, Id});
		      _ -> undefined
		    end,
	  CloseRef = case (days_rank:data_mod()):get(Id) of
		       #{is_cluster := 1} ->
			   erlang:send_after(NextT * 1000, days_rank_mgr,
					     {close_cluster, Id});
		       _ ->
			   erlang:send_after(NextT * 1000, days_rank_mgr,
					     {close, Id})
		     end,
	  {CloseRef, WarnRef};
      SortL ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr706, _,
	     {__Leveldays_rank_mgr706, __Tracesdays_rank_mgr706}}
		when __Leveldays_rank_mgr706 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr706 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, init_timer},
			      {line, 706}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("定时器初始化错误:~w", [SortL]), none, 4096,
			     8, __Leveldays_rank_mgr706,
			     __Tracesdays_rank_mgr706, lager_event,
			     __Piddays_rank_mgr706);
	    _ -> ok
	  end,
	  {undefined, undefined}
    end.

init_warn_timer(OpenList) ->
    case lists:keysort(3, OpenList) of
      [{Id, _ST, ET} | _] ->
	  Now = date:unixtime(),
	  NextT = max(date:diff(second, ET, Now), 1),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr716, _,
	     {__Leveldays_rank_mgr716, __Tracesdays_rank_mgr716}}
		when __Leveldays_rank_mgr716 band 64 /= 0 orelse
		       __Tracesdays_rank_mgr716 /= [] ->
		lager:do_log(info,
			     [{module, days_rank_mgr},
			      {function, init_warn_timer}, {line, 716},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("距离排行榜[Id:~w]奖励时间[Diff:~w]",
					   [Id, NextT]),
			     none, 4096, 64, __Leveldays_rank_mgr716,
			     __Tracesdays_rank_mgr716, lager_event,
			     __Piddays_rank_mgr716);
	    _ -> ok
	  end,
	  WarnRef = case date:diff(second, ET, Now) - 3600 * 2 of
		      NextWarnT
			  when is_integer(NextWarnT) andalso NextWarnT > 0 ->
			  erlang:send_after(NextWarnT * 1000, days_rank_mgr,
					    {warn, Id});
		      _ -> undefined
		    end,
	  WarnRef;
      SortL ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr725, _,
	     {__Leveldays_rank_mgr725, __Tracesdays_rank_mgr725}}
		when __Leveldays_rank_mgr725 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr725 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr},
			      {function, init_warn_timer}, {line, 725},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("定时器初始化错误:~w", [SortL]), none, 4096,
			     8, __Leveldays_rank_mgr725,
			     __Tracesdays_rank_mgr725, lager_event,
			     __Piddays_rank_mgr725);
	    _ -> ok
	  end,
	  undefined
    end.

open_list_cluster(Finish) ->
    Now = date:unixtime(),
    List = (days_rank:data_mod()):list(1),
    open_list(List, Now, Finish, [], []).

open_list(Finish) ->
    Now = date:unixtime(),
    List = (days_rank:data_mod()):list(0),
    open_list(List, Now, Finish, [], []).

open_list([], _Time, _Finish, OpenL, CloseL) ->
    {OpenL, CloseL};
open_list([#{id := Id, start_time := STCfg,
	     end_time := ETCfg}
	   | Rest],
	  Now, Finish, OpenL, CloseL) ->
    ST = parse_time(STCfg),
    ETT = parse_time(ETCfg),
    ET = get_sygame_1_time(ETT, sys_env:get(server_id)),
    if Now >= ET ->
	   case lists:member(Id, Finish) of
	     true ->
		 NewCloseL = [{Id, ST, ET} | CloseL],
		 open_list(Rest, Now, Finish, OpenL, NewCloseL);
	     false ->
		 NewOpenL = [{Id, ST, ET} | OpenL],
		 open_list(Rest, Now, Finish, NewOpenL, CloseL)
	   end;
       Now >= ST andalso ET > Now ->
	   case lists:member(Id, Finish) of
	     true -> open_list(Rest, Now, Finish, OpenL, CloseL);
	     _ ->
		 NewOpenL = [{Id, ST, ET} | OpenL],
		 open_list(Rest, Now, Finish, NewOpenL, CloseL)
	   end;
       true -> open_list(Rest, Now, Finish, OpenL, CloseL)
    end;
open_list([Data | Rest], Now, Finish, OpenL, CloseL) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_mgr765, _,
       {__Leveldays_rank_mgr765, __Tracesdays_rank_mgr765}}
	  when __Leveldays_rank_mgr765 band 8 /= 0 orelse
		 __Tracesdays_rank_mgr765 /= [] ->
	  lager:do_log(error,
		       [{module, days_rank_mgr}, {function, open_list},
			{line, 765}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("七天排行配置有误:~w", [Data]), none, 4096, 8,
		       __Leveldays_rank_mgr765, __Tracesdays_rank_mgr765,
		       lager_event, __Piddays_rank_mgr765);
      _ -> ok
    end,
    open_list(Rest, Now, Finish, OpenL, CloseL).

open_ico(Id) ->
    Icon = maps:get(main_ico,
		    (days_rank:data_mod()):get(Id), 0),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddays_rank_mgr771, _,
       {__Leveldays_rank_mgr771, __Tracesdays_rank_mgr771}}
	  when __Leveldays_rank_mgr771 band 128 /= 0 orelse
		 __Tracesdays_rank_mgr771 /= [] ->
	  lager:do_log(debug,
		       [{module, days_rank_mgr}, {function, open_ico},
			{line, 771}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("open=~w===icon=~w", [Id, Icon]), none,
		       4096, 128, __Leveldays_rank_mgr771,
		       __Tracesdays_rank_mgr771, lager_event,
		       __Piddays_rank_mgr771);
      _ -> ok
    end,
    activity_global:set_activity(108, 1, [0],
				 [{1, Icon, <<>>}]),
    activity_global:broadcast_activity(108, world),
    ok.

close_ico() ->
    activity_global:set_activity(108, 0, []),
    activity_global:broadcast_activity(108, world),
    ok.

open_cluster_ico() ->
    activity_global:set_activity(109, 1, []),
    activity_global:broadcast_activity(109, world),
    ok.

close_cluster_ico() ->
    activity_global:set_activity(109, 0, []),
    activity_global:broadcast_activity(109, world),
    ok.

rank(Id) ->
    case (days_rank:data_mod()):get(Id) of
      #{rank_type := 9} -> {ok, rank_mgr:lookup(2)};
      #{rank_type := 10} -> {ok, rank_mgr:lookup(3)};
      #{rank_type := 12} -> {ok, rank_mgr:lookup(6)};
      #{rank_type := 11} ->
	  Rank = arena_to_rank(), {ok, Rank};
      #{rank_type := 31} -> {ok, rank_mgr:lookup(32)};
      #{rank_type := 29} -> {ok, rank_mgr:lookup(18)};
      #{rank_type := 25} -> {ok, rank_mgr:lookup(1006)};
      #{rank_type := Type} -> {ok, rank_mgr:lookup(Type)};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr817, _,
	     {__Leveldays_rank_mgr817, __Tracesdays_rank_mgr817}}
		when __Leveldays_rank_mgr817 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr817 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, rank},
			      {line, 817}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知的排行榜编号id:~w", [Id]), none, 4096,
			     8, __Leveldays_rank_mgr817,
			     __Tracesdays_rank_mgr817, lager_event,
			     __Piddays_rank_mgr817);
	    _ -> ok
	  end,
	  false
    end.

-spec arena_to_rank() -> #rank{}.

arena_to_rank() ->
    RankL = arena_lib:list_rank(100), arena_to_rank(RankL).

arena_to_rank(RankL) ->
    List = [to_rank_rc(ArenaRole) || ArenaRole <- RankL],
    Len = length(List),
    #rank{type = 11, list = List, len = Len}.

to_rank_rc(#arena_role{id = {Rid, SrvId}, rank = Rank,
		       name = Name, face = FaceId, lev = Lev, power = Power,
		       score = Score}) ->
    #rank_rc{id = {Rid, SrvId}, rid = Rid, srv_id = SrvId,
	     name = Name, lev = Lev, face_id = FaceId, power = Power,
	     idx = Rank, val1 = Score}.

send_reward(Id) ->
    case rank(Id) of
      {ok, Rank = #rank{list = List, type = Type}} ->
	  case rank:rank(Type, 1, List) of
	    {ok, First = #rank_rc{}} ->
		send_type_reward(Id, Type, First, List),
		save_rank_bak(Id, Type, Rank);
	    Other ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddays_rank_mgr844, _,
		   {__Leveldays_rank_mgr844, __Tracesdays_rank_mgr844}}
		      when __Leveldays_rank_mgr844 band 8 /= 0 orelse
			     __Tracesdays_rank_mgr844 /= [] ->
		      lager:do_log(error,
				   [{module, days_rank_mgr},
				    {function, send_reward}, {line, 844},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("排行榜id:~w没有第1名:~w，不发放奖励",
						 [Id, Other]),
				   none, 4096, 8, __Leveldays_rank_mgr844,
				   __Tracesdays_rank_mgr844, lager_event,
				   __Piddays_rank_mgr844);
		  _ -> ok
		end,
		false
	  end;
      Other ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr848, _,
	     {__Leveldays_rank_mgr848, __Tracesdays_rank_mgr848}}
		when __Leveldays_rank_mgr848 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr848 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, send_reward},
			      {line, 848}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("排行榜id:~w没有第1名:~w，不发放奖励",
					   [Id, Other]),
			     none, 4096, 8, __Leveldays_rank_mgr848,
			     __Tracesdays_rank_mgr848, lager_event,
			     __Piddays_rank_mgr848);
	    _ -> ok
	  end,
	  false
    end.

send_type_reward(_Id, _Type, _First, []) -> ok;
send_type_reward(Id, Type = 2,
		 First = #rank_rc{id = Rid, val1 = Val1, idx = Idx},
		 [#rank_rc{id = Rid} | Rest]) ->
    case Val1 >=
	   (days_rank:data_mod()):get_const(dugeon_limit)
	of
      true -> send_mail_reward(Id, Type, Idx, Rid, <<>>);
      false ->
	  Msg =
	      lang:get(<<"（Nếu bạn chưa hoàn thành số cấp độ được "
			 "chỉ định trong cốt truyện, bạn sẽ không "
			 "thể nhận được phần thưởng hạng nhất, "
			 "tức là bạn sẽ nhận được phần thưởng "
			 "hạng hai.）"/utf8>>),
	  send_mail_reward(Id, Type, Idx + 1, Rid, Msg)
    end,
    send_type_reward(Id, Type, First, Rest);
send_type_reward(Id, Type = 3,
		 First = #rank_rc{id = Rid, val1 = Val1, idx = Idx},
		 [#rank_rc{id = Rid} | Rest]) ->
    case Val1 >=
	   (days_rank:data_mod()):get_const(tower_limit)
	of
      true -> send_mail_reward(Id, Type, Idx, Rid, <<>>);
      false ->
	  Msg =
	      util:fbin(lang:get(<<"（星命塔通关小于~w，无法获得第一名奖励，即领取第二名奖励）"/utf8>>),
			[(days_rank:data_mod()):get_const(tower_limit)]),
	  send_mail_reward(Id, Type, Idx + 1, Rid, Msg)
    end,
    send_type_reward(Id, Type, First, Rest);
send_type_reward(Id, Type = 11,
		 First = #rank_rc{id = Rid, val1 = Val1, idx = Idx},
		 [#rank_rc{id = Rid} | Rest]) ->
    case Val1 >=
	   (days_rank:data_mod()):get_const(arena_limit)
	of
      true -> send_mail_reward(Id, Type, Idx, Rid, <<>>);
      false ->
	  Msg =
	      util:fbin(lang:get(<<"（竞技场杯数小于~w，无法获得第一名奖励，即领取第二名奖励）"/utf8>>),
			[(days_rank:data_mod()):get_const(arena_limit)]),
	  send_mail_reward(Id, Type, Idx + 1, Rid, Msg)
    end,
    send_type_reward(Id, Type, First, Rest);
send_type_reward(Id, Type = 6,
		 First = #rank_rc{id = Rid, val1 = Val1, idx = Idx},
		 [#rank_rc{id = Rid} | Rest]) ->
    case Val1 >=
	   (days_rank:data_mod()):get_const(team_limit)
	of
      true -> send_mail_reward(Id, Type, Idx, Rid, <<>>);
      false ->
	  Msg =
	      util:fbin(lang:get(<<"（角色战力小于~w，无法获得第一名奖励，即领取第二名奖励）"/utf8>>),
			[(days_rank:data_mod()):get_const(team_limit)]),
	  send_mail_reward(Id, Type, Idx + 1, Rid, Msg)
    end,
    send_type_reward(Id, Type, First, Rest);
send_type_reward(Id, Type = 14,
		 First = #rank_rc{id = Rid, val1 = Val1, idx = Idx},
		 [#rank_rc{id = Rid} | Rest]) ->
    case Val1 >=
	   (days_rank:data_mod()):get_const(partner_limit)
	of
      true -> send_mail_reward(Id, Type, Idx, Rid, <<>>);
      false ->
	  Msg =
	      util:fbin(lang:get(<<"（英雄总战力小于~w，无法获得第一名奖励，即领取第二名奖励）"/utf8>>),
			[(days_rank:data_mod()):get_const(partner_limit)]),
	  send_mail_reward(Id, Type, Idx + 1, Rid, Msg)
    end,
    send_type_reward(Id, Type, First, Rest);
send_type_reward(Id, Type = 15,
		 First = #rank_rc{id = Rid, val1 = Val1, idx = Idx},
		 [#rank_rc{id = Rid} | Rest]) ->
    case Val1 >=
	   (days_rank:data_mod()):get_const(advanture_limit)
	of
      true -> send_mail_reward(Id, Type, Idx, Rid, <<>>);
      false ->
	  Msg =
	      util:fbin(lang:get(<<"（神界冒险探索度小于~w，无法获得第一名奖励，即领取第二名奖励）"/utf8>>),
			[(days_rank:data_mod()):get_const(advanture_limit)]),
	  send_mail_reward(Id, Type, Idx + 1, Rid, Msg)
    end,
    send_type_reward(Id, Type, First, Rest);
send_type_reward(Id, Type, First,
		 [#rank_rc{id = Rid, idx = Idx} | Rest]) ->
    send_mail_reward(Id, Type, Idx, Rid, <<>>),
    send_type_reward(Id, Type, First, Rest).

send_mail_reward(Id, Type, Idx, Rid, Msg) ->
    case Idx >
	   (days_rank:data_mod()):get_const(reward_limit)
	of
      false ->
	  case (days_rank:data_mod()):reward({Id, Idx}) of
	    Cfg when is_map(Cfg) ->
		send_mail(Type, Idx, Rid, Cfg, Msg);
	    Undef ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddays_rank_mgr926, _,
		   {__Leveldays_rank_mgr926, __Tracesdays_rank_mgr926}}
		      when __Leveldays_rank_mgr926 band 8 /= 0 orelse
			     __Tracesdays_rank_mgr926 /= [] ->
		      lager:do_log(error,
				   [{module, days_rank_mgr},
				    {function, send_mail_reward}, {line, 926},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("未知的七天排行奖励id:~w, Idx:~w, Undef:~w",
						 [Id, Idx, Undef]),
				   none, 4096, 8, __Leveldays_rank_mgr926,
				   __Tracesdays_rank_mgr926, lager_event,
				   __Piddays_rank_mgr926);
		  _ -> ok
		end,
		ok
	  end;
      _ -> ok
    end.

send_mail(Type, Idx, Rid, Cfg, Msg) ->
    Subject = maps:get(subject, Cfg, <<>>),
    Rewards = maps:get(rewards, Cfg, []),
    Cnt = try ContentCfg = maps:get(content, Cfg, <<>>),
	      util:fbin(ContentCfg, [Idx])
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
		  {__Piddays_rank_mgr941, _,
		   {__Leveldays_rank_mgr941, __Tracesdays_rank_mgr941}}
		      when __Leveldays_rank_mgr941 band 8 /= 0 orelse
			     __Tracesdays_rank_mgr941 /= [] ->
		      lager:do_log(error,
				   [{module, days_rank_mgr},
				    {function, send_mail}, {line, 941},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("Type:~w,Reason:~w,type:~w,idx:~w,cfg:~w",
						 [Type, Reason, Type, Idx,
						  Cfg]),
				   none, 4096, 8, __Leveldays_rank_mgr941,
				   __Tracesdays_rank_mgr941, lager_event,
				   __Piddays_rank_mgr941);
		  _ -> ok
		end,
		Name = maps:get(name, Cfg, <<>>),
		ContentStr =
		    lang:get(<<"开服冲刺排行榜，各种大奖等你拿！\n恭喜您在今日<div fontcolor=#7c08b"
			       "2>【~ts】</div>排行中排名第<div fontcolor=#7c08b2>~w<"
			       "/div>名，获得了以下奖励："/utf8>>),
		util:fbin(ContentStr, [Name, Idx])
	  end,
    DescMsg = case Msg of
		<<>> -> <<>>;
		_ -> color:string(green, Msg)
	      end,
    Content = <<Cnt/binary, DescMsg/binary>>,
    do_send_mail(Type, Rid, Subject, Content, Rewards).

do_send_mail(Type, Rid, Subject, Content, Rewards) ->
    {Assets, Items} = format:split_assets_items(Rewards),
    Mail = {Subject, Content, Assets, Items,
	    util:fbin(<<"七天排行奖励:~w"/utf8>>, [Type])},
    mail:send(Rid, Mail),
    ok.

default_close(Info, IsCluster) ->
    Ids = (days_rank:data_mod()):ids(IsCluster),
    EndTime = maps:get(end_time, Info, 0),
    case EndTime > 0 of
      false ->
	  Info#{finish => Ids, end_time => date:unixtime()};
      _ -> Info#{finish => Ids}
    end.

-spec early_warn(pos_integer()) -> ok.

early_warn(Id) ->
    Roles = ets:tab2list(role_id_index),
    Rank = case rank(Id) of
	     {ok, #rank{list = List}} -> List;
	     _Other -> []
	   end,
    case (days_rank:data_mod()):get(Id) of
      Cfg when is_map(Cfg) ->
	  Name = maps:get(name, Cfg, <<>>),
	  do_warn(Roles, Rank, Name);
      Undef ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddays_rank_mgr985, _,
	     {__Leveldays_rank_mgr985, __Tracesdays_rank_mgr985}}
		when __Leveldays_rank_mgr985 band 8 /= 0 orelse
		       __Tracesdays_rank_mgr985 /= [] ->
		lager:do_log(error,
			     [{module, days_rank_mgr}, {function, early_warn},
			      {line, 985}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知的七天排行奖励id:~w, Undef:~w",
					   [Id, Undef]),
			     none, 4096, 8, __Leveldays_rank_mgr985,
			     __Tracesdays_rank_mgr985, lager_event,
			     __Piddays_rank_mgr985);
	    _ -> ok
	  end,
	  ok
    end.

do_warn([], _, _) -> ok;
do_warn([#id_index{id = Rid} | Rest], Rank, Name) ->
    Subject = util:fbin(lang:get(<<"~ts排行提醒"/utf8>>),
			[Name]),
    Content = case rank:idx(0, Rid, Rank) of
		Idx when is_integer(Idx) andalso Idx > 0 ->
		    ContentStr1 =
			lang:get(<<"恭喜！您进入<div fontcolor=#7c08b2>【~ts】</div>排行第<d"
				   "iv fontcolor=#7c08b2>~w</div>名，本榜将在<div "
				   "fontcolor=#7c08b2>24</div>点结算。\n排行榜前<div "
				   "fontcolor=#7c08b2>20</div>名玩家均可获得对应奖励，<div "
				   "fontcolor=#7c08b2>第一名</div>玩家还可获得<div "
				   "fontcolor=#7c08b2>专属称号</div>哦~~\n抓紧时间最后冲刺吧！"/utf8>>),
		    util:fbin(ContentStr1, [Name, Idx]);
		_ ->
		    ContentStr2 =
			lang:get(<<"<div fontcolor=#7c08b2>【~ts】</div>排行将在<div "
				   "fontcolor=#7c08b2>24</div>点结算。\n排行榜前<div "
				   "fontcolor=#7c08b2>20</div>名玩家均可获得对应奖励，<div "
				   "fontcolor=#7c08b2>第一名</div>玩家还可获得<div "
				   "fontcolor=#7c08b2>专属称号</div>哦~~\n抓紧时间最后冲刺吧！"/utf8>>),
		    util:fbin(ContentStr2, [Name])
	      end,
    Mail = {Subject, Content, [], [],
	    util:fbin(<<"七天排行提醒:~ts"/utf8>>, [Name])},
    mail:send(Rid, Mail),
    do_warn(Rest, Rank, Name);
do_warn([_ | Rest], Rank, Name) ->
    do_warn(Rest, Rank, Name).

parse_time({cluster_day, T}) ->
    case info_cluster() of
      #{start_time_zero := StartTime} when StartTime =/= 0 ->
	  StartTime + (T - 1) * 86400;
      _ -> 0
    end;
parse_time({cluster_day, T, OffSet}) ->
    case info_cluster() of
      #{start_time_zero := StartTime} when StartTime =/= 0 ->
	  StartTime + (T - 1) * 86400 + OffSet;
      _ -> 0
    end;
parse_time(T) -> date:parse_time(T).

-spec in_rank(atom(), #role{},
	      pos_integer()) -> #role{}.

in_rank(recruit, Role, AddNum) ->
    case is_open_cluster() of
      true ->
	  NRole = var:add_var(Role, other, 3035, AddNum),
	  rank_listener:handle(recruit, NRole, 1),
	  NRole;
      _ -> Role
    end;
in_rank(loss_gold, Role, AddNum) ->
    case is_open_cluster() of
      true ->
	  NRole = var:add_var(Role, other, 3034, AddNum),
	  rank_listener:handle(loss_gold, NRole, 1),
	  NRole;
      _ ->
	  case is_open() of
	    true ->
		NRole = var:add_var(Role, other, 3034, AddNum),
		rank_listener:handle(loss_gold, NRole, 1),
		NRole;
	    _ -> Role
	  end
    end;
in_rank(divination, Role, AddNum) ->
    case is_open_cluster() of
      true ->
	  NRole = var:add_var(Role, other, 3036, AddNum),
	  rank_listener:handle(divination, NRole, 1),
	  NRole;
      _ -> Role
    end;
in_rank(_, Role, _) -> Role.


