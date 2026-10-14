-file("src/mod/quest/quest_filter.erl", 1).

-module(quest_filter).

-lager_records([{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]},
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

-file("src/mod/quest/quest_filter.erl", 9).

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

-file("src/mod/quest/quest_filter.erl", 10).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/mod/quest/quest_filter.erl", 11).

-type check_label() :: career | lev | accepted |
		       pre_quest | accept_cond | time | week | srv.

-export([accept_list/1, check/2, check/3]).

-spec accept_list(#role{}) -> #role{}.

accept_list(Role = #role{lev = Lev,
			 m_quest =
			     MQuest = #m_quest{finished = Finished,
					       daily_finished = DayFinished,
					       quest = Quests}}) ->
    L = lev_list(Lev, []),
    DoingL = [Id || #quest{id = Id} <- Quests],
    L1 = L -- DayFinished ++ Finished,
    L2 = L1 -- DoingL,
    AcceptList = filter(L2, Role, []),
    Role#role{m_quest =
		  MQuest#m_quest{acceptable = AcceptList}}.

-spec check(#quest_data{} | integer(),
	    #role{}) -> boolean().

-spec check(#quest_data{}, Steps :: check_label(),
	    #role{}) -> boolean().

check(QuestData = #quest_data{}, Role) ->
    check(QuestData,
	  [career, lev, pre_quest, accept_cond, time, week, srv],
	  Role);
check(QuestId, Role) when is_integer(QuestId) ->
    case quest_data:get(QuestId) of
      QuestData = #quest_data{} ->
	  check(QuestData,
		[career, lev, pre_quest, accept_cond, time, week, srv],
		Role);
      _False -> false
    end.

check(QuestData = #quest_data{type = 1}, Steps, Role) ->
    check_cond(Steps, QuestData, Role);
check(QuestData = #quest_data{type = 2}, Steps, Role) ->
    check_cond(Steps, QuestData, Role);
check(QuestData = #quest_data{}, Steps, Role) ->
    check_cond(Steps, QuestData, Role);
check(QuestData, _Steps, #role{name = Name}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquest_filter56, _,
       {__Levelquest_filter56, __Tracesquest_filter56}}
	  when __Levelquest_filter56 band 8 /= 0 orelse
		 __Tracesquest_filter56 /= [] ->
	  lager:do_log(error,
		       [{module, quest_filter}, {function, check}, {line, 56},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未知任务数据:~w", [Name, QuestData]),
		       none, 4096, 8, __Levelquest_filter56,
		       __Tracesquest_filter56, lager_event,
		       __Pidquest_filter56);
      _ -> ok
    end,
    false.

lev_list(0, L) -> L;
lev_list(Lev, L) ->
    L1 = quest_data:lev_list(Lev),
    lev_list(Lev - 1, L1 ++ L).

filter([], _Role, Acceptable) -> Acceptable;
filter([H | T], Role, Acceptable) ->
    case quest_data:get(H) of
      {error, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest_filter77, _,
	     {__Levelquest_filter77, __Tracesquest_filter77}}
		when __Levelquest_filter77 band 8 /= 0 orelse
		       __Tracesquest_filter77 /= [] ->
		lager:do_log(error,
			     [{module, quest_filter}, {function, filter},
			      {line, 77}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("不存在任务[~w]的配置数据: ~w", [H, Reason]),
			     none, 4096, 8, __Levelquest_filter77,
			     __Tracesquest_filter77, lager_event,
			     __Pidquest_filter77);
	    _ -> ok
	  end,
	  filter(T, Role, Acceptable);
      QuestData ->
	  case check(QuestData, Role) of
	    false -> filter(T, Role, Acceptable);
	    true -> filter(T, Role, [H | Acceptable])
	  end
    end.

-spec check_cond(Labels, QuestData, Role) -> boolean() |
					     {false,
					      ErrMsg :: string()} when Labels ::
									   check_label(),
								       QuestData ::
									   #quest_data{},
								       Role ::
									   #role{}.

check_cond([], _QuestData, _Role) -> true;
check_cond([Label | Rest], QuestData, Role) ->
    case check_cond(Label, QuestData, Role) of
      true -> check_cond(Rest, QuestData, Role);
      false -> false
    end;
check_cond(career, #quest_data{career = NeedClasses},
	   #role{career = RoleClasses}) ->
    RoleClasses =:= NeedClasses orelse NeedClasses =:= 0;
check_cond(accepted, #quest_data{id = Id},
	   #role{m_quest = #m_quest{quest = Quests}}) ->
    lists:keyfind(Id, #quest.id, Quests) =:= false;
check_cond(pre_quest,
	   #quest_data{pre_quest = [0 | PreQuest]},
	   #role{m_quest = #m_quest{finished = Finished}}) ->
    pre_quest_check(all, PreQuest, Finished);
check_cond(pre_quest,
	   #quest_data{pre_quest = PreQuest = [_ | _]},
	   #role{m_quest = #m_quest{finished = Finished}}) ->
    pre_quest_check(one, PreQuest, Finished);
check_cond(pre_quest, #quest_data{pre_quest = PreQuest},
	   #role{m_quest = #m_quest{finished = Finished}})
    when is_integer(PreQuest) ->
    pre_quest_check(one, [PreQuest], Finished);
check_cond(pre_quest, _QuestData, _Role) -> true;
check_cond(accept_cond, #quest_data{condition = Conds},
	   Role) ->
    role_cond:check(Conds, Role) =:= true;
check_cond(lev,
	   #quest_data{lev = MinLev, max_lev = MaxLev},
	   #role{lev = RoleLev}) ->
    RoleLev >= MinLev andalso
      (RoleLev =< MaxLev orelse MaxLev =:= 0);
check_cond(time,
	   #quest_data{id = _Id, start_time = ST, end_time = ET},
	   _Role) ->
    {StartT, EndT} = date:parse_time(ST, ET),
    quest:set_check_timer([StartT, EndT]),
    Now = date:unixtime(),
    Now >= StartT andalso (Now < EndT orelse EndT =:= 0);
check_cond(week, #quest_data{weekdays = WeedDays},
	   _Role) ->
    Week = date:day_of_the_week(date:unixtime()),
    WeedDays =:= [] orelse lists:member(Week, WeedDays);
check_cond(srv, Data, Role) -> check_srv(Role, Data);
check_cond(_Label, _QuestData, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquest_filter146, _,
       {__Levelquest_filter146, __Tracesquest_filter146}}
	  when __Levelquest_filter146 band 8 /= 0 orelse
		 __Tracesquest_filter146 /= [] ->
	  lager:do_log(error,
		       [{module, quest_filter}, {function, check_cond},
			{line, 146}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("查找不到标签：~w", [_Label]), none, 4096, 8,
		       __Levelquest_filter146, __Tracesquest_filter146,
		       lager_event, __Pidquest_filter146);
      _ -> ok
    end,
    false.

pre_quest_check(all, [], _Finished) -> true;
pre_quest_check(one, [], _Finished) -> false;
pre_quest_check(one = Label, [H | T], Finished) ->
    case lists:member(H, Finished) of
      true -> true;
      _ -> pre_quest_check(Label, T, Finished)
    end;
pre_quest_check(all = Label, [H | T], Finished) ->
    case lists:member(H, Finished) of
      false -> false;
      _ -> pre_quest_check(Label, T, Finished)
    end.

check_srv(_Role,
	  #quest_data{white_list = [], black_list = []}) ->
    true;
check_srv(#role{platform = P, zone_id = Z},
	  #quest_data{white_list = WhiteL,
		      black_list = BlackL}) ->
    check_srv(P, Z, WhiteL, white) andalso
      check_srv(P, Z, BlackL, black).

check_srv(_P, _Z, [], _) -> true;
check_srv(P, Z, L, white) ->
    [1 || {P1, Z1} <- L, P =:= P1, Z =:= Z1 orelse Z1 =:= 0]
      =/= [];
check_srv(P, Z, L, black) ->
    [1 || {P1, Z1} <- L, P =:= P1, Z =:= Z1 orelse Z1 =:= 0]
      =:= [].


