-file("src/mod/subscriber/subscriber.erl", 1).

-module(subscriber).

-lager_records([{m_subscriber,
		 [ver, id, buy_unixtime, reward_days, is_point]},
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

-export([fire/2, zero_flush/1, push/2, init/0, gm_buy/2,
	 gm_reset/1, delete_point/1]).

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

-file("src/mod/subscriber/subscriber.erl", 17).

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

-file("src/mod/subscriber/subscriber.erl", 18).

-file("inc/subscriber.hrl", 1).

-record(m_subscriber,
	{ver = 2  :: pos_integer(), id = 0  :: pos_integer(),
	 buy_unixtime = 0  :: pos_integer(),
	 reward_days = 0  :: pos_integer(),
	 is_point = 1  :: pos_integer()}).

-file("src/mod/subscriber/subscriber.erl", 19).

gm_buy(Role, PackageId) ->
    Opt = #{sn => "test", package_id => PackageId,
	    money => 1.0, currency_type => 1},
    fire(Role, Opt).

gm_reset(Role) ->
    {ok,
     Role#role{m_subscriber =
		   #m_subscriber{id = 0, buy_unixtime = 0,
				 reward_days = 0}}}.

init() -> #m_subscriber{}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_subscriber =
			    #m_subscriber{id = 0}}) ->
    {ok, Role};
zero_flush(Role = #role{m_subscriber =
			    MSubscriber = #m_subscriber{id = Id,
							buy_unixtime =
							    BuyUnixTime,
							reward_days =
							    RewardDays}}) ->
    Now = date:unixtime(),
    NowRewardDays = date:day_diff(BuyUnixTime, Now) + 1,
    case NowRewardDays > RewardDays of
      true ->
	  case subscriber_data:get_days(Id) of
	    AllDays
		when is_integer(AllDays), NowRewardDays > AllDays ->
		case AllDays - RewardDays of
		  LastDays when LastDays > 0 ->
		      Role1 = reward_subscriber(Role, RewardDays + 1,
						AllDays),
		      NewMSubscriber = MSubscriber#m_subscriber{id = 0,
								buy_unixtime =
								    0,
								reward_days = 0,
								is_point = 1},
		      NewRole = Role1#role{m_subscriber = NewMSubscriber},
		      push(NewRole, 10989),
		      push(NewRole, 10987),
		      {ok, NewRole};
		  _ ->
		      NewMSubscriber = MSubscriber#m_subscriber{id = 0,
								buy_unixtime =
								    0,
								reward_days = 0,
								is_point = 1},
		      NewRole = Role#role{m_subscriber = NewMSubscriber},
		      push(NewRole, 10989),
		      push(NewRole, 10987),
		      {ok, NewRole}
		end;
	    AllDays when is_integer(AllDays) ->
		Role1 = reward_subscriber(Role, RewardDays + 1,
					  NowRewardDays),
		NewMSubscriber = MSubscriber#m_subscriber{reward_days =
							      NowRewardDays},
		NewRole = Role1#role{m_subscriber = NewMSubscriber},
		push(NewRole, 10989),
		{ok, NewRole};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsubscriber72, _,
		   {__Levelsubscriber72, __Tracessubscriber72}}
		      when __Levelsubscriber72 band 8 /= 0 orelse
			     __Tracessubscriber72 /= [] ->
		      lager:do_log(error,
				   [{module, subscriber},
				    {function, zero_flush}, {line, 72},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts每日领取订阅特权失败，类型id:~w",
						 [Role#role.name, Id]),
				   none, 4096, 8, __Levelsubscriber72,
				   __Tracessubscriber72, lager_event,
				   __Pidsubscriber72);
		  _ -> ok
		end,
		{ok, Role}
	  end;
      _ ->
	  case subscriber_data:get_days(Id) of
	    AllDays
		when is_integer(AllDays), NowRewardDays > AllDays ->
		NewMSubscriber = MSubscriber#m_subscriber{id = 0,
							  buy_unixtime = 0,
							  reward_days = 0,
							  is_point = 1},
		NewRole = Role#role{m_subscriber = NewMSubscriber},
		push(NewRole, 10989),
		push(NewRole, 10987),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsubscriber84, _,
		   {__Levelsubscriber84, __Tracessubscriber84}}
		      when __Levelsubscriber84 band 8 /= 0 orelse
			     __Tracessubscriber84 /= [] ->
		      lager:do_log(error,
				   [{module, subscriber},
				    {function, zero_flush}, {line, 84},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts每日领取订阅特权玩家数据异常过期，类型id:~w 当前奖励天数~w "
						 "过期天数~w",
						 [Role#role.name, Id,
						  NowRewardDays, AllDays]),
				   none, 4096, 8, __Levelsubscriber84,
				   __Tracessubscriber84, lager_event,
				   __Pidsubscriber84);
		  _ -> ok
		end,
		{ok, NewRole};
	    _ -> {ok, Role}
	  end
    end.

-spec fire(#role{}, map()) -> {ok, #role{}}.

fire(Role = #role{m_subscriber =
		      MSubscriber = #m_subscriber{id = OldId}},
     Opt = #{sn := Sn, package_id := PackageId,
	     money := Money}) ->
    case subscriber_data:get_id_reward(PackageId) of
      {TypeId, Reward} when is_integer(TypeId) ->
	  case OldId =:= 0 of
	    true ->
		Gain = format:val_to_gain(Reward, subscriber),
		case role_gain:do_notice(Role, Gain) of
		  {false, _Reason} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidsubscriber104, _,
			 {__Levelsubscriber104, __Tracessubscriber104}}
			    when __Levelsubscriber104 band 8 /= 0 orelse
				   __Tracessubscriber104 /= [] ->
			    lager:do_log(error,
					 [{module, subscriber},
					  {function, fire}, {line, 104},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts领取订阅特权~w失败",
						       [Role#role.name,
							TypeId]),
					 none, 4096, 8, __Levelsubscriber104,
					 __Tracessubscriber104, lager_event,
					 __Pidsubscriber104);
			_ -> ok
		      end,
		      {ok, Role};
		  {ok, Role1} ->
		      Role2 = Role1#role{m_subscriber =
					     MSubscriber#m_subscriber{id =
									  TypeId,
								      buy_unixtime
									  =
									  date:unixtime(),
								      reward_days
									  = 1}},
		      NewRole = reward_subscriber(Role2, 1, 1),
		      log:log_gain(Gain, Role, NewRole, <<"运营活动_订阅特权"/utf8>>,
				   util:fbin(<<"订阅特权id:~w"/utf8>>, [TypeId])),
		      push(NewRole, 10989),
		      {ok, NewRole}
		end;
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"运营活动_订阅特权"/utf8>>,
			       util:fbin(<<"订阅特权充值:money=~w,sn=~ts package_id=~w"/utf8>>,
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

push(#role{m_subscriber =
	       #m_subscriber{is_point = IsFlag}},
     Code = 10987) ->
    sys_conn:pack_send(Code, {IsFlag}), ok;
push(#role{m_subscriber =
	       #m_subscriber{id = Id, buy_unixtime = BuyUnixTime}},
     Code = 10989) ->
    sys_conn:pack_send(Code, {Id, BuyUnixTime}), ok;
push(_, Code) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsubscriber130, _,
       {__Levelsubscriber130, __Tracessubscriber130}}
	  when __Levelsubscriber130 band 8 /= 0 orelse
		 __Tracessubscriber130 /= [] ->
	  lager:do_log(error,
		       [{module, subscriber}, {function, push}, {line, 130},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("协议发送错误~w", [Code]), none, 4096, 8,
		       __Levelsubscriber130, __Tracessubscriber130,
		       lager_event, __Pidsubscriber130);
      _ -> ok
    end,
    ok.

-spec delete_point(#role{}) -> #role{}.

delete_point(Role = #role{m_subscriber = Subscriber}) ->
    NewSubscriber = Subscriber#m_subscriber{is_point = 0},
    NewRole = Role#role{m_subscriber = NewSubscriber},
    push(NewRole, 10987),
    NewRole.

reward_subscriber(Role, NowDays, TargetDay)
    when NowDays > TargetDay ->
    Role;
reward_subscriber(Role = #role{m_subscriber =
				   #m_subscriber{id = Id}},
		  NowDays, TargetDay) ->
    AllReward = case subscriber_data:get_day_reward(Id) of
		  {DayReward, SevenDayReward}
		      when is_list(DayReward), is_list(SevenDayReward) ->
		      case NowDays =:= 1 orelse
			     max(1, NowDays - 1) rem 7 =:= 0
			  of
			true -> DayReward ++ SevenDayReward;
			_ -> DayReward
		      end;
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
			{__Pidsubscriber159, _,
			 {__Levelsubscriber159, __Tracessubscriber159}}
			    when __Levelsubscriber159 band 8 /= 0 orelse
				   __Tracessubscriber159 /= [] ->
			    lager:do_log(error,
					 [{module, subscriber},
					  {function, reward_subscriber},
					  {line, 159},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts每日领取订阅特权失败，类型id:~w",
						       [Role#role.name, Id]),
					 none, 4096, 8, __Levelsubscriber159,
					 __Tracessubscriber159, lager_event,
					 __Pidsubscriber159);
			_ -> ok
		      end,
		      []
		end,
    {Assets, Items} = format:split_assets_items(AllReward),
    Title = lang:get(<<"专属特权奖励邮件"/utf8>>),
    Content =
	lang:get(<<"亲爱的冒险者大人，专属于您的好礼，快马加鞭为您送上，以下是您激活的专属特权奖励内容，请查收"/utf8>>),
    Remark = util:fbin(<<"订阅特权id:~w第~w天奖励"/utf8>>,
		       [Id, NowDays]),
    {ok, NewRole} = mail:add(Role,
			     {Title, Content, Assets, Items, Remark,
			      604800 + date:unixtime()}),
    reward_subscriber(NewRole, NowDays + 1, TargetDay).


