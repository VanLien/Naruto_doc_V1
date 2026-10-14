-file("src/mod/holiday_merge_goal/holiday_merge_goal"
      "_mgr.erl",
      1).

-module(holiday_merge_goal_mgr).

-lager_records([{m_merge_goal, [ver, camp_id, reward]},
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

-export([push/1, get_reward/2, login/1, init/0,
	 get_lev_score/2, gm_delete/1, gm_delete_reward/1,
	 gm_delete_all/1]).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/holiday_merge_goal/holiday_merge_goal"
      "_mgr.erl",
      23).

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

-file("src/mod/holiday_merge_goal/holiday_merge_goal"
      "_mgr.erl",
      24).

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

-file("src/mod/holiday_merge_goal/holiday_merge_goal"
      "_mgr.erl",
      25).

-file("inc/holiday_merge_goal.hrl", 1).

-record(m_merge_goal,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), reward = []  :: list()}).

-file("src/mod/holiday_merge_goal/holiday_merge_goal"
      "_mgr.erl",
      26).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_merge_goal/holiday_merge_goal"
      "_mgr.erl",
      27).

gm_delete(Role) ->
    {SysTemCampId, _Score, MaxScore} =
	sys_env:get(merge_goal, {0, 0, 0}),
    sys_env:save(merge_goal, {SysTemCampId, 0, MaxScore}),
    push(Role),
    ok.

gm_delete_all(Role) ->
    sys_env:save(merge_goal, {0, 0, 0}),
    sys_env:save(end_merge_goal, {0, 0, 0}),
    push(Role),
    ok.

gm_delete_reward(Role = #role{m_holiday_merge_goal =
				  MergeGoal}) ->
    NewMergeGoal = MergeGoal#m_merge_goal{reward = []},
    NewRole = Role#role{m_holiday_merge_goal =
			    NewMergeGoal},
    push(NewRole),
    NewRole.

init() -> #m_merge_goal{}.

-spec push(#role{}) -> ok.

push(Role = #role{m_holiday_merge_goal =
		      #m_merge_goal{camp_id = CampId,
				    reward = RewardList}}) ->
    {SysTemCampId, Score, MaxScore} =
	sys_env:get(merge_goal, {0, 0, 0}),
    Now = date:unixtime(),
    case holiday_lib:get_open_holiday(Role,
				      [3039, 93039, 993039, 9993039])
	of
      #holiday{camp_id = CampId, end_time = EndTime}
	  when SysTemCampId =:= CampId ->
	  LastTime = max(0, EndTime - Now),
	  {NowLev, NowScore, NowMaxScore} = get_lev_score(Score,
							  MaxScore),
	  holiday:push_bid_can_reward(Role, 9993039),
	  role:pack_send(27300,
			 {LastTime, NowLev, NowScore, NowMaxScore, RewardList});
      _ -> role:pack_send(27300, {0, 0, 0, 0, []})
    end,
    ok.

-spec get_reward(list(), #role{}) -> {ok, #role{}} |
				     {false, string()}.

get_reward(IdList, Role) ->
    case check_reward_cond(IdList, Role, []) of
      {ok, DataRewardList} ->
	  Gain = format:val_to_gain(DataRewardList,
				    holiday_merge_goal),
	  case role_gain:do_notice(Role, Gain) of
	    {ok,
	     GainRole = #role{m_holiday_merge_goal =
				  MergeGoal = #m_merge_goal{reward =
								RewardList}}} ->
		NewMergeGoal = MergeGoal#m_merge_goal{reward =
							  IdList ++ RewardList},
		NewRole = GainRole#role{m_holiday_merge_goal =
					    NewMergeGoal},
		push(NewRole),
		holiday:push_bid_can_reward(NewRole, 9993039),
		log:log_gain(Gain, Role, NewRole, <<"合服目标奖励"/utf8>>,
			     <<"领取奖励"/utf8>>),
		{ok, NewRole};
	    _ -> {false, lang:get(<<"领取奖励失败"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"没有奖励"/utf8>>)}
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_holiday_merge_goal =
		       MergeGoal = #m_merge_goal{camp_id = RoleCampId,
						 reward = RewardList}}) ->
    {NowCampId, _Score, _MaxScore} = sys_env:get(merge_goal,
						 {0, 0, 0}),
    {EndCampId, EndScore, EndMaxScore} =
	sys_env:get(end_merge_goal, {0, 0, 0}),
    EndRole = #role{m_holiday_merge_goal = MergeGoal1} =
		  case EndCampId =:= RoleCampId andalso RoleCampId > 0 of
		    true ->
			MailRole = mail_reward(Role, RewardList, EndScore,
					       EndMaxScore),
			EndMergeGoal = MergeGoal#m_merge_goal{camp_id = 0,
							      reward = []},
			Role1 = MailRole#role{m_holiday_merge_goal =
						  EndMergeGoal},
			Role1;
		    _ -> Role
		  end,
    NewRole = case NowCampId > 0 of
		true when NowCampId =:= EndCampId -> EndRole;
		true when NowCampId =:= RoleCampId -> EndRole;
		true ->
		    NowMergeGoal = MergeGoal1#m_merge_goal{camp_id =
							       NowCampId,
							   reward = []},
		    NowRole = EndRole#role{m_holiday_merge_goal =
					       NowMergeGoal},
		    NowRole;
		_ ->
		    NowRole = EndRole#role{m_holiday_merge_goal =
					       MergeGoal1#m_merge_goal{camp_id =
									   0,
								       reward =
									   []}},
		    NowRole
	      end,
    holiday:push_bid_can_reward(NewRole, 9993039),
    {ok, NewRole}.

-spec get_lev_score(pos_integer(),
		    pos_integer()) -> {pos_integer(), pos_integer(),
				       pos_integer()}.

get_lev_score(Score, MaxScore) ->
    ALLIntervalDataList =
	holiday_merge_goal_data:get_all_lev(),
    ALLIntervalDataList1 = lists:keysort(1,
					 ALLIntervalDataList),
    do_get_lev_score(Score, MaxScore, ALLIntervalDataList1,
		     0).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> holiday_merge_goal_mgr ! Info.

cast(Info) ->
    gen_server:cast(holiday_merge_goal_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_merge_goal_mgr, Info,
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
	    {__Pidholiday_merge_goal_mgr150, _,
	     {__Levelholiday_merge_goal_mgr150,
	      __Tracesholiday_merge_goal_mgr150}}
		when __Levelholiday_merge_goal_mgr150 band 8 /= 0 orelse
		       __Tracesholiday_merge_goal_mgr150 /= [] ->
		lager:do_log(error,
			     [{module, holiday_merge_goal_mgr},
			      {function, call}, {line, 150},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_merge_goal_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_merge_goal_mgr150,
			     __Tracesholiday_merge_goal_mgr150, lager_event,
			     __Pidholiday_merge_goal_mgr150);
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
    gen_server:start_link({local, holiday_merge_goal_mgr},
			  holiday_merge_goal_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_merge_goal_mgr156, _,
       {__Levelholiday_merge_goal_mgr156,
	__Tracesholiday_merge_goal_mgr156}}
	  when __Levelholiday_merge_goal_mgr156 band 64 /= 0
		 orelse __Tracesholiday_merge_goal_mgr156 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_merge_goal_mgr}, {function, init},
			{line, 156}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_merge_goal_mgr]),
		       none, 4096, 64, __Levelholiday_merge_goal_mgr156,
		       __Tracesholiday_merge_goal_mgr156, lager_event,
		       __Pidholiday_merge_goal_mgr156);
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
      {__Pidholiday_merge_goal_mgr159, _,
       {__Levelholiday_merge_goal_mgr159,
	__Tracesholiday_merge_goal_mgr159}}
	  when __Levelholiday_merge_goal_mgr159 band 64 /= 0
		 orelse __Tracesholiday_merge_goal_mgr159 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_merge_goal_mgr}, {function, init},
			{line, 159}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_merge_goal_mgr]),
		       none, 4096, 64, __Levelholiday_merge_goal_mgr159,
		       __Tracesholiday_merge_goal_mgr159, lager_event,
		       __Pidholiday_merge_goal_mgr159);
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
	    {__Pidholiday_merge_goal_mgr167, _,
	     {__Levelholiday_merge_goal_mgr167,
	      __Tracesholiday_merge_goal_mgr167}}
		when __Levelholiday_merge_goal_mgr167 band 8 /= 0 orelse
		       __Tracesholiday_merge_goal_mgr167 /= [] ->
		lager:do_log(error,
			     [{module, holiday_merge_goal_mgr},
			      {function, handle_call}, {line, 167},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_merge_goal_mgr167,
			     __Tracesholiday_merge_goal_mgr167, lager_event,
			     __Pidholiday_merge_goal_mgr167);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_merge_goal_mgr, 168, _Reason}),
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
	    {__Pidholiday_merge_goal_mgr180, _,
	     {__Levelholiday_merge_goal_mgr180,
	      __Tracesholiday_merge_goal_mgr180}}
		when __Levelholiday_merge_goal_mgr180 band 8 /= 0 orelse
		       __Tracesholiday_merge_goal_mgr180 /= [] ->
		lager:do_log(error,
			     [{module, holiday_merge_goal_mgr},
			      {function, handle_info}, {line, 180},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_merge_goal_mgr180,
			     __Tracesholiday_merge_goal_mgr180, lager_event,
			     __Pidholiday_merge_goal_mgr180);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_merge_goal_mgr, 181, _Reason}),
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
      {__Pidholiday_merge_goal_mgr186, _,
       {__Levelholiday_merge_goal_mgr186,
	__Tracesholiday_merge_goal_mgr186}}
	  when __Levelholiday_merge_goal_mgr186 band 64 /= 0
		 orelse __Tracesholiday_merge_goal_mgr186 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_merge_goal_mgr},
			{function, terminate}, {line, 186},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelholiday_merge_goal_mgr186,
		       __Tracesholiday_merge_goal_mgr186, lager_event,
		       __Pidholiday_merge_goal_mgr186);
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
	    {__Pidholiday_merge_goal_mgr198, _,
	     {__Levelholiday_merge_goal_mgr198,
	      __Tracesholiday_merge_goal_mgr198}}
		when __Levelholiday_merge_goal_mgr198 band 8 /= 0 orelse
		       __Tracesholiday_merge_goal_mgr198 /= [] ->
		lager:do_log(error,
			     [{module, holiday_merge_goal_mgr},
			      {function, do_handle_call}, {line, 198},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_merge_goal_mgr198,
			     __Tracesholiday_merge_goal_mgr198, lager_event,
			     __Pidholiday_merge_goal_mgr198);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_merge_goal_mgr, 199, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info(check_status, State) ->
    {CampId, Score, OldMaxScore} = sys_env:get(merge_goal,
					       {0, 0, 0}),
    case holiday_lib:get_open_holiday([3039, 93039, 993039,
				       9993039])
	of
      #holiday{camp_id = CampId} -> skip;
      #holiday{camp_id = NewCampId, start_time = StartTime}
	  when CampId > 0 ->
	  BaseMaxScore =
	      holiday_merge_goal_data:get_const(base_max_score),
	  AliveNum = max(get_alive_num(), 1),
	  Pro = get_pro(AliveNum) / 1000,
	  RealMaxScore = round(BaseMaxScore * Pro),
	  sys_env:save(end_merge_goal,
		       {CampId, Score, OldMaxScore}),
	  sys_env:save(merge_goal, {NewCampId, 0, RealMaxScore}),
	  role_group:apply(world,
			   {holiday_merge_goal_mgr, login, []}),
	  interval(StartTime);
      #holiday{camp_id = NewCampId, start_time = StartTime} ->
	  BaseMaxScore =
	      holiday_merge_goal_data:get_const(base_max_score),
	  AliveNum = max(get_alive_num(), 1),
	  Pro = get_pro(AliveNum) / 1000,
	  RealMaxScore = round(BaseMaxScore * Pro),
	  sys_env:save(merge_goal, {NewCampId, 0, RealMaxScore}),
	  role_group:apply(world,
			   {holiday_merge_goal_mgr, login, []}),
	  interval(StartTime);
      _ when CampId > 0 ->
	  sys_env:save(end_merge_goal,
		       {CampId, Score, OldMaxScore}),
	  sys_env:save(merge_goal, {0, 0, 0}),
	  role_group:apply(world,
			   {holiday_merge_goal_mgr, login, []});
      _ -> sys_env:save(merge_goal, {0, 0, 0})
    end,
    {noreply, State};
do_handle_info({add_score, RolePid, Val}, State) ->
    {CampId, Score, OldMaxScore} = sys_env:get(merge_goal,
					       {0, 0, 0}),
    case holiday_lib:get_open_holiday([3039, 93039, 993039,
				       9993039])
	of
      #holiday{camp_id = CampId} ->
	  NewScore = min(Score + Val, OldMaxScore),
	  sys_env:save(merge_goal,
		       {CampId, NewScore, OldMaxScore}),
	  role:apply(async, RolePid,
		     {holiday_merge_goal_mgr, push, []});
      _ -> skip
    end,
    {noreply, State};
do_handle_info(interval, State) ->
    {CampId, Score, OldMaxScore} = sys_env:get(merge_goal,
					       {0, 0, 0}),
    case holiday_lib:get_open_holiday([3039, 93039, 993039,
				       9993039])
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
	      holiday_merge_goal_data:get_all_interval(),
	  AllIntervalList = [DataInterval
			     || {DataDay, DataInterval} <- ALLIntervalDataList,
				DataDay < RealDay],
	  AllInterval = lists:sum(AllIntervalList),
	  case holiday_merge_goal_data:get_interval(RealDay) of
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
		      sys_env:save(merge_goal,
				   {CampId, NewScore, OldMaxScore}),
		      role_group:apply(world,
				       {holiday_merge_goal_mgr, push, []})
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
	    {__Pidholiday_merge_goal_mgr296, _,
	     {__Levelholiday_merge_goal_mgr296,
	      __Tracesholiday_merge_goal_mgr296}}
		when __Levelholiday_merge_goal_mgr296 band 8 /= 0 orelse
		       __Tracesholiday_merge_goal_mgr296 /= [] ->
		lager:do_log(error,
			     [{module, holiday_merge_goal_mgr},
			      {function, do_handle_info}, {line, 296},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_merge_goal_mgr296,
			     __Tracesholiday_merge_goal_mgr296, lager_event,
			     __Pidholiday_merge_goal_mgr296);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_merge_goal_mgr, 297, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

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
			    holiday_merge_goal_data:score_pro_list()),
    do_get_pro(ProList, AliveNum).

do_get_pro([], _AliveNum) -> 800;
do_get_pro([{_, Min, Max, Pro} | Rest], AliveNum) ->
    case AliveNum >= Min andalso AliveNum =< Max of
      true -> Pro;
      _ -> do_get_pro(Rest, AliveNum)
    end.

check_reward_cond([], _, OldDataRewardList) ->
    {ok, OldDataRewardList};
check_reward_cond([Id | Rest], Role,
		  OldDataRewardList) ->
    case check_reward_cond(Id, Role) of
      {ok, DataRewardList} ->
	  check_reward_cond(Rest, Role,
			    DataRewardList ++ OldDataRewardList);
      {false, Reason} -> {false, Reason}
    end;
check_reward_cond(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

check_reward_cond(Id,
		  #role{m_holiday_merge_goal =
			    #m_merge_goal{camp_id = CampId,
					  reward = RewardList}}) ->
    {SysTemCampId, Score, MaxScore} =
	sys_env:get(merge_goal, {0, 0, 0}),
    case SysTemCampId =:= CampId andalso SysTemCampId > 0 of
      true ->
	  Percent = Score / max(1, MaxScore) * 1000,
	  case lists:member(Id, RewardList) of
	    true -> {false, lang:get(<<"你已经领取过该奖励了"/utf8>>)};
	    _ ->
		case holiday_merge_goal_data:get_score_award(Id) of
		  {DataPercent, DataRewardList}
		      when Percent >= DataPercent ->
		      {ok, DataRewardList};
		  _ -> {false, lang:get(<<"当前不能领取该奖励"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"当前没有奖励可领取"/utf8>>)}
    end.

interval(StartTime) ->
    Now = date:unixtime(),
    RealDay = util:uceil(max(0, Now - StartTime) /
			   (86400 * 1)),
    case holiday_merge_goal_data:get_interval(RealDay) of
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

do_get_lev_score(Score, MaxScore, IntervalList,
		 OldAllPro) ->
    case IntervalList of
      [{Lev, Pro} | Rest] ->
	  LevMaxScore = MaxScore * Pro / 1000,
	  case Score > LevMaxScore of
	    true ->
		case Rest of
		  [] ->
		      {Lev,
		       round(max(0, Score - MaxScore * OldAllPro / 1000)),
		       round(MaxScore * max(0, Pro - OldAllPro) / 1000)};
		  _ -> do_get_lev_score(Score, MaxScore, Rest, Pro)
		end;
	    _ ->
		{Lev,
		 round(max(0, Score - MaxScore * OldAllPro / 1000)),
		 round(MaxScore * max(0, Pro - OldAllPro) / 1000)}
	  end;
      _ ->
	  {7, round(max(0, Score - MaxScore * 860 / 1000)),
	   round(MaxScore * 140 / 1000)}
    end.

mail_reward(Role, IdList, EndScore, EndMaxScore) ->
    ALLIntervalDataList =
	holiday_merge_goal_data:get_all_lev(),
    Pro = EndScore / EndMaxScore * 1000,
    case get_mail_reward(ALLIntervalDataList, Pro, IdList,
			 [])
	of
      [] -> Role;
      RewardList when is_list(RewardList) ->
	  {Assets, Items} = format:split_assets_items(RewardList),
	  {ok, MailRole} = mail:add(Role,
				    {lang:get(<<"合服目标奖励补发"/utf8>>),
				     lang:get(<<"亲爱的冒险者大人，这是您在合服目标中尚未领取的奖励，请查收"/utf8>>),
				     Assets, Items, <<"合服目标"/utf8>>,
				     86400 + date:unixtime()}),
	  MailRole;
      _ -> Role
    end.

get_mail_reward([], _, _, RewardList) -> RewardList;
get_mail_reward([{Lev, DataPro} | Rest], Pro, IdList,
		RewardList) ->
    case Pro >= DataPro of
      true ->
	  case lists:member(Lev, IdList) of
	    true -> get_mail_reward(Rest, Pro, IdList, RewardList);
	    _ ->
		case holiday_merge_goal_data:get_score_award(Lev) of
		  {_, DataRewardList} ->
		      get_mail_reward(Rest, Pro, IdList,
				      DataRewardList ++ RewardList);
		  _ -> get_mail_reward(Rest, Pro, IdList, RewardList)
		end
	  end;
      _ -> get_mail_reward(Rest, Pro, IdList, RewardList)
    end;
get_mail_reward(_, _, _, RewardList) -> RewardList.


