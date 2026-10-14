-file("src/mod/holiday_valentines/holiday_valentines"
      "_mgr.erl",
      1).

-module(holiday_valentines_mgr).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{m_holiday_valentines,
		 [ver, camp_id, score, reward, ext]},
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
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]},
		{state, []}]).

-behaviour(gen_server).

-export([]).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([gm_add_score/2]).

-record(state, {}).

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

-file("src/mod/holiday_valentines/holiday_valentines"
      "_mgr.erl",
      16).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/mod/holiday_valentines/holiday_valentines"
      "_mgr.erl",
      17).

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

-file("src/mod/holiday_valentines/holiday_valentines"
      "_mgr.erl",
      18).

-file("inc/holiday_valentines.hrl", 1).

-record(m_holiday_valentines,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(),
	 score = 0  :: pos_integer(), reward = []  :: list(),
	 ext = []  :: list()}).

-file("src/mod/holiday_valentines/holiday_valentines"
      "_mgr.erl",
      19).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_valentines/holiday_valentines"
      "_mgr.erl",
      20).

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

-file("src/mod/holiday_valentines/holiday_valentines"
      "_mgr.erl",
      21).

gm_add_score(_Role, AddScore) ->
    {SysTemCampId, Score, MaxScore} =
	sys_env:get(valentines_score, {0, 0, 0}),
    sys_env:save(valentines_score,
		 {SysTemCampId, Score + AddScore, MaxScore}),
    role_group:apply(world,
		     {holiday_valentines, push_base_info, []}),
    ok.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> holiday_valentines_mgr ! Info.

cast(Info) ->
    gen_server:cast(holiday_valentines_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_valentines_mgr, Info,
			       10000)
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
	    {__Pidholiday_valentines_mgr45, _,
	     {__Levelholiday_valentines_mgr45,
	      __Tracesholiday_valentines_mgr45}}
		when __Levelholiday_valentines_mgr45 band 8 /= 0 orelse
		       __Tracesholiday_valentines_mgr45 /= [] ->
		lager:do_log(error,
			     [{module, holiday_valentines_mgr},
			      {function, call}, {line, 45},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_valentines_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_valentines_mgr45,
			     __Tracesholiday_valentines_mgr45, lager_event,
			     __Pidholiday_valentines_mgr45);
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
    gen_server:start_link({local, holiday_valentines_mgr},
			  holiday_valentines_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_valentines_mgr51, _,
       {__Levelholiday_valentines_mgr51,
	__Tracesholiday_valentines_mgr51}}
	  when __Levelholiday_valentines_mgr51 band 64 /= 0 orelse
		 __Tracesholiday_valentines_mgr51 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_valentines_mgr}, {function, init},
			{line, 51}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_valentines_mgr]),
		       none, 4096, 64, __Levelholiday_valentines_mgr51,
		       __Tracesholiday_valentines_mgr51, lager_event,
		       __Pidholiday_valentines_mgr51);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_valentines_mgr54, _,
       {__Levelholiday_valentines_mgr54,
	__Tracesholiday_valentines_mgr54}}
	  when __Levelholiday_valentines_mgr54 band 64 /= 0 orelse
		 __Tracesholiday_valentines_mgr54 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_valentines_mgr}, {function, init},
			{line, 54}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_valentines_mgr]),
		       none, 4096, 64, __Levelholiday_valentines_mgr54,
		       __Tracesholiday_valentines_mgr54, lager_event,
		       __Pidholiday_valentines_mgr54);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_valentines_mgr62, _,
	     {__Levelholiday_valentines_mgr62,
	      __Tracesholiday_valentines_mgr62}}
		when __Levelholiday_valentines_mgr62 band 8 /= 0 orelse
		       __Tracesholiday_valentines_mgr62 /= [] ->
		lager:do_log(error,
			     [{module, holiday_valentines_mgr},
			      {function, handle_call}, {line, 62},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_valentines_mgr62,
			     __Tracesholiday_valentines_mgr62, lager_event,
			     __Pidholiday_valentines_mgr62);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_valentines_mgr, 63, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_valentines_mgr75, _,
	     {__Levelholiday_valentines_mgr75,
	      __Tracesholiday_valentines_mgr75}}
		when __Levelholiday_valentines_mgr75 band 8 /= 0 orelse
		       __Tracesholiday_valentines_mgr75 /= [] ->
		lager:do_log(error,
			     [{module, holiday_valentines_mgr},
			      {function, handle_info}, {line, 75},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_valentines_mgr75,
			     __Tracesholiday_valentines_mgr75, lager_event,
			     __Pidholiday_valentines_mgr75);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_valentines_mgr, 76, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_valentines_mgr81, _,
       {__Levelholiday_valentines_mgr81,
	__Tracesholiday_valentines_mgr81}}
	  when __Levelholiday_valentines_mgr81 band 64 /= 0 orelse
		 __Tracesholiday_valentines_mgr81 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_valentines_mgr},
			{function, terminate}, {line, 81},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelholiday_valentines_mgr81,
		       __Tracesholiday_valentines_mgr81, lager_event,
		       __Pidholiday_valentines_mgr81);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_valentines_mgr93, _,
	     {__Levelholiday_valentines_mgr93,
	      __Tracesholiday_valentines_mgr93}}
		when __Levelholiday_valentines_mgr93 band 8 /= 0 orelse
		       __Tracesholiday_valentines_mgr93 /= [] ->
		lager:do_log(error,
			     [{module, holiday_valentines_mgr},
			      {function, do_handle_call}, {line, 93},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_valentines_mgr93,
			     __Tracesholiday_valentines_mgr93, lager_event,
			     __Pidholiday_valentines_mgr93);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_valentines_mgr, 94, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info(check_status, State) ->
    {CampId, Score, OldMaxScore} =
	sys_env:get(valentines_score, {0, 0, 0}),
    case holiday_lib:get_open_holiday([3049, 93049, 993049])
	of
      #holiday{camp_id = CampId, start_time = StartTime} ->
	  interval(StartTime), ok;
      #holiday{camp_id = NewCampId, start_time = StartTime}
	  when CampId > 0 ->
	  BaseMaxScore =
	      holiday_valentines_data:get_const(base_max_score),
	  AliveNum = max(get_alive_num(), 1),
	  Pro = get_pro(AliveNum) / 1000,
	  RealMaxScore = round(BaseMaxScore * Pro),
	  sys_env:save(end_valentines_score,
		       {CampId, Score, OldMaxScore}),
	  sys_env:save(valentines_score,
		       {NewCampId, 0, RealMaxScore}),
	  rank_award(),
	  role_group:apply(world,
			   {holiday_valentines, login, []}),
	  interval(StartTime);
      #holiday{camp_id = NewCampId, start_time = StartTime} ->
	  BaseMaxScore =
	      holiday_valentines_data:get_const(base_max_score),
	  AliveNum = max(get_alive_num(), 1),
	  Pro = get_pro(AliveNum) / 1000,
	  RealMaxScore = round(BaseMaxScore * Pro),
	  sys_env:save(valentines_score,
		       {NewCampId, 0, RealMaxScore}),
	  role_group:apply(world,
			   {holiday_valentines, login, []}),
	  interval(StartTime);
      _ when CampId > 0 ->
	  sys_env:save(end_valentines_score,
		       {CampId, Score, OldMaxScore}),
	  sys_env:save(valentines_score, {0, 0, 0}),
	  rank_award(),
	  role_group:apply(world,
			   {holiday_valentines, login, []});
      _ -> sys_env:save(valentines_score, {0, 0, 0})
    end,
    {noreply, State};
do_handle_info({add_score, RolePid, Val}, State) ->
    {CampId, Score, OldMaxScore} =
	sys_env:get(valentines_score, {0, 0, 0}),
    case holiday_lib:get_open_holiday([3049, 93049, 993049])
	of
      #holiday{camp_id = CampId} ->
	  NewScore = min(Score + Val, OldMaxScore),
	  sys_env:save(valentines_score,
		       {CampId, NewScore, OldMaxScore}),
	  role:apply(async, RolePid,
		     {holiday_valentines, push_base_info, []});
      _ -> skip
    end,
    {noreply, State};
do_handle_info(interval, State) ->
    {CampId, Score, OldMaxScore} =
	sys_env:get(valentines_score, {0, 0, 0}),
    case holiday_lib:get_open_holiday([3049, 93049, 993049])
	of
      #holiday{camp_id = CampId, start_time = StartTime} ->
	  Now = date:unixtime(),
	  TodayHour = util:floor(max(0, Now - StartTime) / 3600)
			rem 24,
	  TodayUnixtime = max(0, Now - StartTime) rem 86400,
	  RealDay = util:uceil(max(0, Now - StartTime) /
				 (86400 * 1)),
	  NowPro = Score / max(1, OldMaxScore) * 1000,
	  ALLIntervalDataList =
	      holiday_valentines_data:get_all_interval(),
	  AllIntervalList = [DataInterval
			     || {DataDay, DataInterval} <- ALLIntervalDataList,
				DataDay < RealDay],
	  AllInterval = lists:sum(AllIntervalList),
	  case holiday_valentines_data:get_interval(RealDay) of
	    {DataPro, Interval, TotalTime}
		when TodayHour < TotalTime ->
		AllProTime = TotalTime * 3600 / max(1, Interval),
		TodayProTime = TodayUnixtime / max(1, Interval),
		TodayPro = DataPro / AllProTime * TodayProTime,
		MinPro = TodayPro + AllInterval,
		case NowPro >= MinPro of
		  true -> skip;
		  _ ->
		      NewScore = min(round(OldMaxScore * MinPro / 1000),
				     OldMaxScore),
		      sys_env:save(valentines_score,
				   {CampId, NewScore, OldMaxScore}),
		      role_group:apply(world,
				       {holiday_valentines, push_base_info, []})
		end;
	    _ -> skip
	  end,
	  interval(StartTime);
      _ -> skip
    end,
    {noreply, State};
do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_valentines_mgr194, _,
	     {__Levelholiday_valentines_mgr194,
	      __Tracesholiday_valentines_mgr194}}
		when __Levelholiday_valentines_mgr194 band 8 /= 0 orelse
		       __Tracesholiday_valentines_mgr194 /= [] ->
		lager:do_log(error,
			     [{module, holiday_valentines_mgr},
			      {function, do_handle_info}, {line, 194},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_valentines_mgr194,
			     __Tracesholiday_valentines_mgr194, lager_event,
			     __Pidholiday_valentines_mgr194);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_valentines_mgr, 195, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

rank_award() ->
    #rank{list = L} = rank_mgr:lookup(49),
    log_rank:save(49),
    rank_mgr:clear([49]),
    Fun = fun (#rank_rc{id = RoleId, idx = Rank}) ->
		  case holiday_valentines_data:rank_reward(Rank) of
		    Award = [_ | _] ->
			{MailAssets, MailItems} =
			    format:split_assets_items(Award),
			Content =
			    color:msg(lang:get(<<"亲爱的冒险者大人：\n恭喜您在甜蜜大作战活动中获得了情人节个人积分排行榜第~ts名的好名次"
						 "。附件是活动的排行奖励，请注意查收"/utf8>>),
				      [{red, Rank}]),
			Mail = {lang:get(<<"甜蜜大作战积分排行榜结算"/utf8>>), Content,
				MailAssets, MailItems, <<"甜蜜大作战积分排行榜结算"/utf8>>},
			mail:send(RoleId, Mail);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, L),
    ok.

get_alive_num() ->
    LimitDay = 1,
    LimitTime = date:unixtime() - 86400 * LimitDay,
    case
      db:get_one("select count(*) from role where logout_time "
		 "> ? or login_time > ?",
		 [LimitTime, LimitTime], 60000)
	of
      {ok, Num} -> Num;
      _ -> 0
    end.

get_pro(AliveNum) ->
    ProList = lists:keysort(2,
			    holiday_valentines_data:score_pro_list()),
    do_get_pro(ProList, AliveNum).

do_get_pro([], _AliveNum) -> 800;
do_get_pro([{_, Min, Max, Pro} | Rest], AliveNum) ->
    case AliveNum >= Min andalso AliveNum =< Max of
      true -> Pro;
      _ -> do_get_pro(Rest, AliveNum)
    end.

interval(StartTime) ->
    Now = date:unixtime(),
    RealDay = util:uceil(max(0, Now - StartTime) /
			   (86400 * 1)),
    case holiday_valentines_data:get_interval(RealDay) of
      {_DataPro, Interval, _TotalTime} ->
	  Ref = erlang:send_after(Interval * 1000, self(),
				  interval),
	  case get(interval) of
	    OldRef when is_reference(OldRef) ->
		erlang:cancel_timer(OldRef);
	    _ -> skip
	  end,
	  put(interval, Ref);
      _ -> skip
    end.


