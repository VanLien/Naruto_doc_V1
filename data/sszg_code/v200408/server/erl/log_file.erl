-file("src/mod/log/log_file.erl", 1).

-module(log_file).

-lager_records([{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{assets,
		 [ver, exp, coin, silver_coin, gold, red_gold, gold_acc,
		  vip_exp, energy, energy_max, energy_time, activity,
		  guild, arena_cent, hero_soul, feat_point, triple_rebate,
		  friend_point, boss_point, star_hun, star_point,
		  arena_guesscent, sky_coin, hero_exp, recruit_hero,
		  recruithigh_hero, expedition_medal, elite_coin,
		  holy_eqm_coin, skin_debris, cluster_coin, home_coin,
		  hallow_refine, cluster_guess_cent, feather_exchange,
		  brave_symbol, peak_guess_cent, hero_soul_coin,
		  acc_recruit_hero, predict_point]},
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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{state,
		 [zone, file, file_name, rows, all_rows, time]}]).

-behaviour(gen_server).

-export([log/5, do_log/4]).

-export([info/2, cast/2, call/2, start_num/0,
	 start_link/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state,
	{zone = 1, file, file_name, rows = 0, all_rows = 0,
	 time}).

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

-file("src/mod/log/log_file.erl", 16).

-file("inc/timer.hrl", 1).

-record(timer,
	{id  :: term(), timeout = 1000  :: pos_integer(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 a = []  :: [term()], times = 1  :: integer(),
	 next_tick = 0  :: non_neg_integer(),
	 set_time = 1  :: pos_integer()}).

-record(rtimer,
	{ref  :: undefined | reference(),
	 key = 0  :: non_neg_integer(),
	 timers = []  :: [#timer{}]}).

-record(s_timer,
	{ref  :: undefined | reference(),
	 timers = []  :: [#timer{}]}).

-file("src/mod/log/log_file.erl", 17).

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

-file("src/mod/log/log_file.erl", 18).

-file("inc/assets.hrl", 1).

-file("inc/game_assets.hrl", 1).

-file("inc/assets.hrl", 12).

-record(assets,
	{ver = -1, exp = 0, coin = 0, silver_coin = 0, gold = 0,
	 red_gold = 0, gold_acc = 0, vip_exp = 0, energy = 0,
	 energy_max = 0, energy_time = 0, activity = 0,
	 guild = 0, arena_cent = 0, hero_soul = 0,
	 feat_point = 0, triple_rebate = 0, friend_point = 0,
	 boss_point = 0, star_hun = 0, star_point = 0,
	 arena_guesscent = 0, sky_coin = 0, hero_exp = 0,
	 recruit_hero = 0, recruithigh_hero = 0,
	 expedition_medal = 0, elite_coin = 0, holy_eqm_coin = 0,
	 skin_debris = 0, cluster_coin = 0, home_coin = 0,
	 hallow_refine = 0, cluster_guess_cent = 0,
	 feather_exchange = 0, brave_symbol = 0,
	 peak_guess_cent = 0, hero_soul_coin = 0,
	 acc_recruit_hero = 0, predict_point = 0}).

-file("src/mod/log/log_file.erl", 19).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("src/mod/log/log_file.erl", 20).

log(Mod, Code, Data, Line, Role) ->
    case log_cfg(Mod, Code, Data) of
      {ok, Title, Msg} -> do_log(Title, Msg, Line, Role);
      _ -> ok
    end.

do_log(Title, Msg, Line,
       #role{id = {Rid, SrvId}, name = Name, lev = Lev,
	     assets = #assets{gold = Gold, coin = Coin}})
    when Lev >= 1 ->
    Log =
	util:fbin("[line:~w][name:~ts][id:~w,~ts][lev:~w][gold:~"
		  "w][coin:~w]~ts,~ts==>~w~n",
		  [Line, Name, Rid, SrvId, Lev, Gold, Coin, Title, Msg,
		   get(role_gain_log_items)]),
    info(Rid, {write, Log}),
    ok;
do_log(_Title, _Msg, _Line, _Role) -> ok.

log_cfg(async, 0, {Mod = combat_end, Fun, _Args}) ->
    case get(role_gain_log_items) of
      [_ | _] ->
	  {ok, "角色异步调用",
	   util:flist("mod:~w, fun:~w", [Mod, Fun])};
      _ -> skip
    end;
log_cfg(sync, 0, {Mod = combat_end, Fun, _Args}) ->
    case get(role_gain_log_items) of
      [_ | _] ->
	  {ok, "角色同步调用",
	   util:flist("mod:~w, fun:~w", [Mod, Fun])};
      _ -> skip
    end;
log_cfg(async, 0, {Fun, _Args}) ->
    {ok, "角色异步调用",
     util:flist("mod:~w, fun:~w",
		[util:fun_form_mod(Fun), Fun])};
log_cfg(async, 0, {undefined, Fun, _Args}) ->
    {ok, "角色异步调用",
     util:flist("mod:~w, fun:~w",
		[util:fun_form_mod(Fun), Fun])};
log_cfg(async, 0, {Mod, Fun, _Args}) ->
    {ok, "角色异步调用",
     util:flist("mod:~w, fun:~w", [Mod, Fun])};
log_cfg(sync, 0, {Fun, _Args}) ->
    {ok, "角色同步调用",
     util:flist("mod:~w, fun:~w",
		[util:fun_form_mod(Fun), Fun])};
log_cfg(sync, 0, {undefined, Fun, _Args}) ->
    {ok, "角色同步调用",
     util:flist("mod:~w, fun:~w",
		[util:fun_form_mod(Fun), Fun])};
log_cfg(sync, 0, {Mod, Fun, _Args}) ->
    {ok, "角色同步调用",
     util:flist("mod:~w, fun:~w", [Mod, Fun])};
log_cfg(loop_timer, 0, {undefined, Fun, _Args}) ->
    {ok, "角色定时器调用",
     util:flist("mod:~w, fun:~w",
		[util:fun_form_mod(Fun), Fun])};
log_cfg(loop_timer, 0, {Mod, Fun, _Args}) ->
    {ok, "角色定时器调用",
     util:flist("mod:~w, fun:~w", [Mod, Fun])};
log_cfg(timer, 0,
	{#timer{id = Id, m = undefined, f = Fun}}) ->
    {ok, "角色定时调用",
     util:flist("id:~w, mod:~w, fun:~w",
		[Id, util:fun_form_mod(Fun), Fun])};
log_cfg(timer, 0,
	{#timer{id = Id, m = Mod, f = Fun}}) ->
    {ok, "角色定时调用",
     util:flist("id:~w, mod:~w, fun:~w", [Id, Mod, Fun])};
log_cfg(_Mod, Code, Data)
    when is_integer(Code) andalso Code >= 1000 ->
    case rpc_cfg:log_title(Code, Data) of
      S = [_ | _] ->
	  {ok, S,
	   util:flist("请求信息:~w,~w",
		      [Code, rpc_cfg:log_data(Code, Data)])};
      _ ->
	  {ok, util:flist("未知协议_~w", [Code]),
	   util:flist("请求信息:~w,~w",
		      [Code, rpc_cfg:log_data(Code, Data)])}
    end;
log_cfg(_Mod, _Code, _Data) -> false.

info(N, Info) -> get_proc(N) ! Info.

cast(N, Info) -> gen_server:cast(get_proc(N), Info).

call(N, Info) ->
    case catch gen_server:call(get_proc(N), Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog_file83, _,
	     {__Levellog_file83, __Traceslog_file83}}
		when __Levellog_file83 band 8 /= 0 orelse
		       __Traceslog_file83 /= [] ->
		lager:do_log(error,
			     [{module, log_file}, {function, call}, {line, 83},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [get_proc(N), Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levellog_file83,
			     __Traceslog_file83, lager_event, __Pidlog_file83);
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

get_proc(1) -> log_file_1;
get_proc(2) -> log_file_2;
get_proc(3) -> log_file_3;
get_proc(4) -> log_file_4;
get_proc(5) -> log_file_5;
get_proc(6) -> log_file_6;
get_proc(7) -> log_file_7;
get_proc(8) -> log_file_8;
get_proc(9) -> log_file_9;
get_proc(10) -> log_file_10;
get_proc(11) -> log_file_11;
get_proc(12) -> log_file_12;
get_proc(13) -> log_file_13;
get_proc(14) -> log_file_14;
get_proc(15) -> log_file_15;
get_proc(16) -> log_file_16;
get_proc(17) -> log_file_17;
get_proc(18) -> log_file_18;
get_proc(19) -> log_file_19;
get_proc(20) -> log_file_20;
get_proc(N) when is_integer(N) ->
    get_proc(N rem 20 + 1);
get_proc(N) -> N.

start_num() -> start_num(20).

start_num(0) -> ok;
start_num(N) -> start_link(N), start_num(N - 1).

start_link(N) ->
    gen_server:start_link({local, get_proc(N)}, log_file,
			  [N], []).

init([N]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_file120, _,
       {__Levellog_file120, __Traceslog_file120}}
	  when __Levellog_file120 band 64 /= 0 orelse
		 __Traceslog_file120 /= [] ->
	  lager:do_log(info,
		       [{module, log_file}, {function, init}, {line, 120},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [log_file]), none, 4096,
		       64, __Levellog_file120, __Traceslog_file120,
		       lager_event, __Pidlog_file120);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    FullName = lists:concat(["./log_file", "/log_", N,
			     ".txt"]),
    {ok, F} = file:open(FullName,
			[append, raw, {delayed_write, 16 * 1024, 2}]),
    State = #state{file = F, file_name = FullName,
		   zone = N},
    erlang:send_after(util:rand(1000000, 1200000), self(),
		      loop),
    erlang:send_after(date:next_diff(4, 0, 0) * 1000 +
			util:rand(1, 300000),
		      self(), del_file),
    erlang:send_after(60000 + N * 30, self(), reset_time),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_file128, _,
       {__Levellog_file128, __Traceslog_file128}}
	  when __Levellog_file128 band 64 /= 0 orelse
		 __Traceslog_file128 /= [] ->
	  lager:do_log(info,
		       [{module, log_file}, {function, init}, {line, 128},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [log_file]), none, 4096, 64,
		       __Levellog_file128, __Traceslog_file128, lager_event,
		       __Pidlog_file128);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(new_file, State) ->
    {noreply, new_file(State)};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info({write, Content},
	    State = #state{file = F, rows = Rows,
			   all_rows = AllRows, time = undefined}) ->
    case sys_env:get(log_txt_file) of
      false -> {noreply, State};
      _ ->
	  {{Y, M, D}, {H, I, S}} = erlang:localtime(),
	  Time = util:fbin("~w/~s/~s ~s:~s:~s=>",
			   [Y, i2s(M), i2s(D), i2s(H), i2s(I), i2s(S)]),
	  case file:write(F, <<Time/binary, Content/binary>>) of
	    ok ->
		{noreply,
		 State#state{rows = Rows + 1, all_rows = AllRows + 1,
			     time = Time}};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlog_file150, _,
		   {__Levellog_file150, __Traceslog_file150}}
		      when __Levellog_file150 band 8 /= 0 orelse
			     __Traceslog_file150 /= [] ->
		      lager:do_log(error,
				   [{module, log_file}, {function, handle_info},
				    {line, 150}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("写日志操作失败: ~w", [Err]), none,
				   4096, 8, __Levellog_file150,
				   __Traceslog_file150, lager_event,
				   __Pidlog_file150);
		  _ -> ok
		end,
		{noreply, State#state{time = Time}}
	  end
    end;
handle_info({write, Content},
	    State = #state{file = F, rows = Rows,
			   all_rows = AllRows, time = Time}) ->
    case sys_env:get(log_txt_file) of
      false -> {noreply, State};
      _ ->
	  case file:write(F, <<Time/binary, Content/binary>>) of
	    ok ->
		{noreply,
		 State#state{rows = Rows + 1, all_rows = AllRows + 1}};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlog_file161, _,
		   {__Levellog_file161, __Traceslog_file161}}
		      when __Levellog_file161 band 8 /= 0 orelse
			     __Traceslog_file161 /= [] ->
		      lager:do_log(error,
				   [{module, log_file}, {function, handle_info},
				    {line, 161}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("写日志操作失败: ~w", [Err]), none,
				   4096, 8, __Levellog_file161,
				   __Traceslog_file161, lager_event,
				   __Pidlog_file161);
		  _ -> ok
		end,
		{noreply, State}
	  end
    end;
handle_info(reset_time, State) ->
    erlang:send_after(60000, self(), reset_time),
    {noreply, State#state{time = undefined}};
handle_info(loop, State) ->
    erlang:send_after(1800 * 1000, self(), loop),
    {noreply, new_file(State)};
handle_info(del_file, State = #state{zone = 1}) ->
    Now = date:unixtime(),
    del_day_file(Now, 10),
    del_day_file(Now, 10 + 1),
    erlang:send_after(date:next_diff(4, 0, 0) * 1000 +
			util:rand(1, 300000),
		      self(), del_file),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State = #state{file = F}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_file188, _,
       {__Levellog_file188, __Traceslog_file188}}
	  when __Levellog_file188 band 64 /= 0 orelse
		 __Traceslog_file188 /= [] ->
	  lager:do_log(info,
		       [{module, log_file}, {function, terminate}, {line, 188},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始关闭", []), none, 4096, 64,
		       __Levellog_file188, __Traceslog_file188, lager_event,
		       __Pidlog_file188);
      _ -> ok
    end,
    file:close(F),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_file190, _,
       {__Levellog_file190, __Traceslog_file190}}
	  when __Levellog_file190 band 64 /= 0 orelse
		 __Traceslog_file190 /= [] ->
	  lager:do_log(info,
		       [{module, log_file}, {function, terminate}, {line, 190},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭完成", []), none, 4096, 64,
		       __Levellog_file190, __Traceslog_file190, lager_event,
		       __Pidlog_file190);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

new_file(State = #state{rows = 0}) -> State;
new_file(State = #state{file = F, file_name = FullName,
			zone = N}) ->
    case F of
      undefined -> ignore;
      _ -> file:close(F)
    end,
    {{Y, M, D}, {H, I, S}} = erlang:localtime(),
    TargetDir = lists:concat(["./log_file", "/",
			      Y * 10000 + M * 100 + D]),
    TargetFile = lists:concat([TargetDir, "/", "log_", N,
			       "_", i2s(H), "-", i2s(I), "-", i2s(S), ".txt"]),
    make_dir(TargetDir),
    Cmd = lists:concat(["mv ", FullName, " ", TargetFile]),
    os:cmd(Cmd),
    {ok, Nf} = file:open(FullName,
			 [append, raw, {delayed_write, 16 * 1024, 2}]),
    State#state{file = Nf, rows = 0}.

i2s(0) -> "00";
i2s(1) -> "01";
i2s(2) -> "02";
i2s(3) -> "03";
i2s(4) -> "04";
i2s(5) -> "05";
i2s(6) -> "06";
i2s(7) -> "07";
i2s(8) -> "08";
i2s(9) -> "09";
i2s(N) -> integer_to_list(N).

make_dir(Dir) ->
    case filelib:is_dir(Dir) of
      false -> file:make_dir(Dir);
      _ -> skip
    end.

del_day_file(Now, Days) ->
    Time = Now - Days * 86400,
    {{Y, M, D}, _} = date:seconds_to_datetime(Time),
    TargetDir = lists:concat(["./log_file", "/",
			      Y * 10000 + M * 100 + D]),
    Cmd = lists:concat(["rm -rf ", TargetDir]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_file236, _,
       {__Levellog_file236, __Traceslog_file236}}
	  when __Levellog_file236 band 64 /= 0 orelse
		 __Traceslog_file236 /= [] ->
	  lager:do_log(info,
		       [{module, log_file}, {function, del_day_file},
			{line, 236}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("删除日志文件:~ts", [TargetDir]), none, 4096,
		       64, __Levellog_file236, __Traceslog_file236,
		       lager_event, __Pidlog_file236);
      _ -> ok
    end,
    os:cmd(Cmd).


