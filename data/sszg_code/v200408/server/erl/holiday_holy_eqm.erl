-file("src/mod/holiday_holy_eqm/holiday_holy_eqm.erl",
      1).

-module(holiday_holy_eqm).

-lager_records([{holiday,
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
		{m_holiday_holy,
		 [ver, period, open_time, week_time, month_time,
		  limit_day, limit_week, limit_month, limit_all]},
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

-export([init/0, get_info/1, login/1, fire/1,
	 zero_flush/1, buy/2]).

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

-file("src/mod/holiday_holy_eqm/holiday_holy_eqm.erl",
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

-file("src/mod/holiday_holy_eqm/holiday_holy_eqm.erl",
      17).

-file("inc/holiday_holy.hrl", 1).

-record(m_holiday_holy,
	{ver = 1, period = 0, open_time = 0, week_time = 0,
	 month_time = 0, limit_day = [], limit_week = [],
	 limit_month = [], limit_all = []}).

-file("src/mod/holiday_holy_eqm/holiday_holy_eqm.erl",
      18).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_holy_eqm/holiday_holy_eqm.erl",
      19).

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

-file("src/mod/holiday_holy_eqm/holiday_holy_eqm.erl",
      20).

-spec init() -> #m_holiday_holy{}.

init() -> #m_holiday_holy{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_holiday_holy =
		       #m_holiday_holy{period = Period}}) ->
    NewPeriod = do_ref(Role),
    if NewPeriod =/= Period ->
	   NewRole = init_new_period(Role, NewPeriod),
	   {ok, NewRole};
       true -> {ok, Role}
    end.

init_new_period(Role = #role{m_holiday_holy = M},
		NewPeriod) ->
    Now = date:unixtime(),
    WeekTime = calc_time(Now, week),
    MonthTime = calc_time(Now, month),
    NewM = M#m_holiday_holy{period = NewPeriod,
			    open_time = Now, week_time = WeekTime,
			    month_time = MonthTime, limit_day = [],
			    limit_week = [], limit_month = [], limit_all = []},
    Role#role{m_holiday_holy = NewM}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_holiday_holy =
			    M = #m_holiday_holy{week_time = WeekTime,
						month_time = MonthTime,
						limit_week = LimitWeek,
						limit_month = LimitMonth}}) ->
    Now = date:unixtime(),
    {NewMongthTime, NewLimitMonth} = case Now >= MonthTime
					 of
				       true -> {calc_time(Now, month), []};
				       _ -> {MonthTime, LimitMonth}
				     end,
    {NewWeekTime, NewLimitWeek} = case Now >= WeekTime of
				    true -> {calc_time(Now, week), []};
				    _ -> {WeekTime, LimitWeek}
				  end,
    NewM = M#m_holiday_holy{week_time = NewWeekTime,
			    month_time = NewMongthTime, limit_day = [],
			    limit_week = NewLimitWeek,
			    limit_month = NewLimitMonth},
    NewRole = Role#role{m_holiday_holy = NewM},
    {ok, NewRole}.

-spec get_info(#role{}) -> ok.

get_info(Role = #role{m_holiday_holy =
			  #m_holiday_holy{period = Period, week_time = WeekTime,
					  month_time = MonthTime,
					  limit_day = LimitDay,
					  limit_week = LimitWeek,
					  limit_month = LimitMonth,
					  limit_all = LimitAll}}) ->
    ExpendLists = holiday_holy_eqm_data:get_expends(Period),
    CliInfo = to_cli_info(Role, ExpendLists, Period,
			  LimitDay, LimitWeek, LimitMonth, LimitAll, []),
    DayTime = date:unixtime() + date:next_diff({0, 0, 0}),
    sys_conn:pack_send(16606, {991031, 0}),
    sys_conn:pack_send(25500,
		       {Period, DayTime, WeekTime, MonthTime, CliInfo}),
    ok.

to_cli_info(_Role, [], _Period, _LimitDay, _LimitWeek,
	    _LimitMonth, _LimitAll, L) ->
    L;
to_cli_info(Role, [Id | ExpendLists], Period, LimitDay,
	    LimitWeek, LimitMonth, LimitAll, L) ->
    Cond = holiday_holy_eqm_data:get_cond({Period, Id}),
    case check_cond(Role, Cond) of
      true ->
	  LimitCfg = holiday_holy_eqm_data:get_limit({Period,
						      Id}),
	  {_, LimitNum, BuyNum} = get_buy_limit(Id, LimitCfg,
						Role),
	  {AwardList, Price, ChargeId, LimitType, OriginalPrice,
	   ResName, Rank, Icon} =
	      holiday_holy_eqm_data:get_info({Period, Id}),
	  to_cli_info(Role, ExpendLists, Period, LimitDay,
		      LimitWeek, LimitMonth, LimitAll,
		      [{Id, Price, ChargeId, LimitType, BuyNum, LimitNum,
			OriginalPrice, ResName, Rank, Icon, AwardList}
		       | L]);
      _ ->
	  to_cli_info(Role, ExpendLists, Period, LimitDay,
		      LimitWeek, LimitMonth, LimitAll, L)
    end.

check_cond(_Role, _Cond) -> true.

fire(Role = #role{m_holiday_holy =
		      #m_holiday_holy{period = Period}}) ->
    MaxDunId = dungeon_heaven_lib:get_max_dun_id(Role),
    NewPeriod = do_ref(Role),
    if MaxDunId == 10001 ->
	   put(holiday_holy_eqm_point, 1),
	   role:redirect(Role, 16601, {}),
	   holiday_lib:push_can_get_rewrd(Role),
	   ok;
       true -> pass
    end,
    if NewPeriod =/= Period ->
	   sys_conn:pack_send(16606, {991031, 1}),
	   NewRole = init_new_period(Role, NewPeriod),
	   NewRole;
       true -> Role
    end.

-spec buy(#role{}, map()) -> {ok, #role{}}.

buy(Role = #role{m_holiday_holy =
		     #m_holiday_holy{period = Period}},
    Opt = #{package_id := PackageId, sn := Sn,
	    money := Money}) ->
    case holiday_holy_eqm_data:get_gift({Period, PackageId})
	of
      undefined -> {ok, Role};
      {GiftId, Award} ->
	  LimitCfg = holiday_holy_eqm_data:get_limit({Period,
						      GiftId}),
	  {LimitType, LimitNum, BuyNum} = get_buy_limit(GiftId,
							LimitCfg, Role),
	  case LimitType =:= none orelse LimitNum > BuyNum of
	    true ->
		Gain = format:val_to_gain(Award, holiday_holy_eqm),
		case role_gain:do_notice(Role, Gain) of
		  {ok, Role1} ->
		      NewRole = set_buy_limit(LimitType, GiftId, BuyNum + 1,
					      Role1),
		      log:log_gain(Gain, Role, NewRole, <<"运营活动_神装商店"/utf8>>,
				   util:fbin(lang:get(<<"神装礼包直购,礼包id:~w 充值id:~w"/utf8>>),
					     [GiftId, PackageId])),
		      get_info(NewRole),
		      {ok, NewRole};
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_holy_eqm141, _,
			 {__Levelholiday_holy_eqm141,
			  __Tracesholiday_holy_eqm141}}
			    when __Levelholiday_holy_eqm141 band 8 /= 0 orelse
				   __Tracesholiday_holy_eqm141 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_holy_eqm},
					  {function, buy}, {line, 141},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】因未知原因领取神装礼包道具失败~w ~w ~w ~w",
						       [Role#role.name,
							PackageId, Period,
							GiftId, Award]),
					 none, 4096, 8,
					 __Levelholiday_holy_eqm141,
					 __Tracesholiday_holy_eqm141,
					 lager_event, __Pidholiday_holy_eqm141);
			_ -> ok
		      end,
		      {ok, Role}
		end;
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("神装礼包超过限购条件无法激活，改为充值:money=~w,sn=~ts "
					 "package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end
    end.

calc_time(Now, week) ->
    Now + date:now_diff(6, {23, 59, 59});
calc_time(Now, month) ->
    Now + date:now_diff(29, {23, 59, 59}).

get_buy_limit(GiftId, {LimitDay, _, _, _},
	      #role{m_holiday_holy =
			#m_holiday_holy{limit_day = LimitDayList}})
    when LimitDay > 0 ->
    {day, LimitDay,
     list_util:keyfind(GiftId, LimitDayList, 0)};
get_buy_limit(GiftId, {_, LimitWeek, _, _},
	      #role{m_holiday_holy =
			#m_holiday_holy{limit_week = LimitWeekList}})
    when LimitWeek > 0 ->
    {week, LimitWeek,
     list_util:keyfind(GiftId, LimitWeekList, 0)};
get_buy_limit(GiftId, {_, _, LimitMonth, _},
	      #role{m_holiday_holy =
			#m_holiday_holy{limit_month = LimitMonthList}})
    when LimitMonth > 0 ->
    {month, LimitMonth,
     list_util:keyfind(GiftId, LimitMonthList, 0)};
get_buy_limit(GiftId, {_, _, _, LimitAll},
	      #role{m_holiday_holy =
			#m_holiday_holy{limit_all = LimitAllList}})
    when LimitAll > 0 ->
    {all, LimitAll,
     list_util:keyfind(GiftId, LimitAllList, 0)};
get_buy_limit(GiftId, _,
	      #role{m_holiday_holy =
			#m_holiday_holy{limit_all = LimitAllList}}) ->
    {none, 0, list_util:keyfind(GiftId, LimitAllList, 0)}.

set_buy_limit(day, GiftId, NewBuyNum,
	      Role = #role{m_holiday_holy =
			       MHolidayHoly = #m_holiday_holy{limit_day =
								  LimitDayList}}) ->
    Role#role{m_holiday_holy =
		  MHolidayHoly#m_holiday_holy{limit_day =
						  lists:keystore(GiftId, 1,
								 LimitDayList,
								 {GiftId,
								  NewBuyNum})}};
set_buy_limit(week, GiftId, NewBuyNum,
	      Role = #role{m_holiday_holy =
			       MHolidayHoly = #m_holiday_holy{limit_week =
								  LimitWeekist}}) ->
    Role#role{m_holiday_holy =
		  MHolidayHoly#m_holiday_holy{limit_week =
						  lists:keystore(GiftId, 1,
								 LimitWeekist,
								 {GiftId,
								  NewBuyNum})}};
set_buy_limit(month, GiftId, NewBuyNum,
	      Role = #role{m_holiday_holy =
			       MHolidayHoly = #m_holiday_holy{limit_month =
								  LimitMonthList}}) ->
    Role#role{m_holiday_holy =
		  MHolidayHoly#m_holiday_holy{limit_month =
						  lists:keystore(GiftId, 1,
								 LimitMonthList,
								 {GiftId,
								  NewBuyNum})}};
set_buy_limit(_, GiftId, NewBuyNum,
	      Role = #role{m_holiday_holy =
			       MHolidayHoly = #m_holiday_holy{limit_all =
								  LimitAllList}}) ->
    Role#role{m_holiday_holy =
		  MHolidayHoly#m_holiday_holy{limit_all =
						  lists:keystore(GiftId, 1,
								 LimitAllList,
								 {GiftId,
								  NewBuyNum})}}.

do_ref(Role = #role{m_holiday_holy =
			#m_holiday_holy{period = OldPeriod}}) ->
    MaxDunId = dungeon_heaven_lib:get_max_dun_id(Role),
    Periods = holiday_holy_eqm_data:get_periods(),
    case [PeriodT
	  || {PeriodT, Min, Max} <- Periods,
	     MaxDunId >= Min andalso MaxDunId =< Max]
	of
      [Period | _] -> Period;
      _ -> util:if_true(OldPeriod =:= 0, 1, OldPeriod)
    end.


