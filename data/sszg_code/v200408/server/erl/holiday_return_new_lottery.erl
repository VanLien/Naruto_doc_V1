-file("src/mod/holiday_return_new/holiday_return_new"
      "_lottery.erl",
      1).

-module(holiday_return_new_lottery).

-lager_records([{holiday_return_new_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_new,
		 [ver, period, start_time, end_time, gift_status,
		  sign_list, quest_list, exchange_day_list,
		  exchange_buy_list, free_draw_count, draw_count,
		  draw_info, draw_type_info, must_not, get_red_count,
		  red_packet_info, get_red_info, ext]},
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

-export([push_draw_info/1, lottery/2, draw/2]).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      "_lottery.erl",
      12).

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

-file("src/mod/holiday_return_new/holiday_return_new"
      "_lottery.erl",
      13).

-file("inc/holiday_return_new.hrl", 1).

-record(m_holiday_return_new,
	{ver = 1, period = 0, start_time = 0, end_time = 0,
	 gift_status = 0, sign_list = [], quest_list = [],
	 exchange_day_list = [], exchange_buy_list = [],
	 free_draw_count = 0, draw_count = 0, draw_info = 0,
	 draw_type_info = [], must_not = [], get_red_count = 0,
	 red_packet_info = [], get_red_info = [], ext = []}).

-record(holiday_return_new_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/holiday_return_new/holiday_return_new"
      "_lottery.erl",
      14).

-spec push_draw_info(#role{}) -> ok.

push_draw_info(Role = #role{m_holiday_return_new =
				#m_holiday_return_new{period = Period,
						      free_draw_count =
							  FreeDrawCount,
						      draw_count = DrawCount,
						      draw_type_info =
							  DarwTypeInfo,
						      start_time = StartTime,
						      end_time = EndTime}}) ->
    case holiday_return_new:check_open(Role) of
      {ok, Period} ->
	  FreeFlag = util:if_true(FreeDrawCount >=
				    holiday_return_new_data:get_const(free_draw_time),
				  0, 1),
	  AllList =
	      holiday_return_new_data:get_award_list(Period),
	  Fun = fun ({Type, Count}, Acc) ->
			TypeList = [Show | _] =
				       holiday_return_new_data:get_type_award_info({Period,
										    Type}),
			[{Type, Count, length(TypeList), Show} | Acc]
		end,
	  CliInfo = lists:foldl(Fun, [], DarwTypeInfo),
	  sys_conn:pack_send(27903,
			     {EndTime, StartTime, DrawCount, length(AllList),
			      FreeFlag, CliInfo}),
	  ok;
      _ -> ok
    end.

-spec lottery(#role{}, integer()) -> {ok, #role{}} |
				     {false, binary()}.

lottery(Role = #role{m_holiday_return_new =
			 #m_holiday_return_new{period = Period,
					       draw_count = DrawCount}},
	CostType) ->
    case holiday_return_new:check_open(Role) of
      {ok, Period} ->
	  AllList =
	      holiday_return_new_data:get_award_list(Period),
	  Times = case CostType of
		    1 -> 1;
		    2 -> 1;
		    _ -> 10
		  end,
	  NewDrawCount = DrawCount + Times,
	  case NewDrawCount > length(AllList) of
	    false -> draw(Role, CostType);
	    _ -> {false, lang:get(<<"抽奖次数已达上限"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

draw(Role = #role{m_holiday_return_new =
		      #m_holiday_return_new{free_draw_count = FreeCount}},
     CostType = 1) ->
    case FreeCount <
	   holiday_return_new_data:get_const(free_draw_time)
	of
      true -> draw_process(Role, 1, CostType, []);
      _ -> {false, lang:get(<<"免费次数已用完"/utf8>>)}
    end;
draw(Role, CostType)
    when CostType =:= 2 orelse CostType =:= 3 ->
    Times = util:if_true(CostType =:= 2, 1, 10),
    Expend = cal_draw_expend(Role, Times),
    draw_process(Role, Times, CostType, Expend);
draw(_Role, _) -> {false, lang:get(<<"抽奖失败"/utf8>>)}.

draw_process(Role, Times, CostType, Expend) ->
    {NRole, Award} = do_draw(Role, Times, []),
    Gain = format:val_to_gain(Award,
			      holiday_return_new_lottery_gain),
    Loss = format:val_to_loss(Expend,
			      holiday_return_new_lottery_loss),
    case role_gain:do_notice(NRole, Gain ++ Loss) of
      {ok,
       NRole1 = #role{m_holiday_return_new =
			  MHolidayReturnNew =
			      #m_holiday_return_new{free_draw_count =
							FreeDrawCount}}} ->
	  log:log_gain(Gain ++ Loss, NRole, NRole1,
		       <<"新版回归活动_回归抽奖"/utf8>>,
		       util:fbin(lang:get(<<"次数:~w，类型：~w"/utf8>>),
				 [Times, CostType])),
	  NewRole = case CostType =:= 1 of
		      true ->
			  NRole2 = NRole1#role{m_holiday_return_new =
						   MHolidayReturnNew#m_holiday_return_new{free_draw_count
											      =
											      FreeDrawCount
												+
												1}},
			  NRole2;
		      _ -> NRole1
		    end,
	  push_draw_info(NewRole),
	  {ok, NewRole};
      _ -> {false, lang:get(<<"抽奖失败"/utf8>>)}
    end.

do_draw(Role, 0, Award) -> {Role, Award};
do_draw(Role, Time, Award) ->
    {NRole, AwardOne} = get_one_award(Role),
    do_draw(NRole, Time - 1, AwardOne ++ Award).

get_one_award(Role = #role{m_holiday_return_new =
			       MHolidayReturnNew = #m_holiday_return_new{period
									     =
									     Period,
									 draw_count
									     =
									     DrawCount,
									 draw_info
									     =
									     DrawInfo,
									 draw_type_info
									     =
									     DrawTypeInfo}}) ->
    AllAwardList =
	holiday_return_new_data:get_award_list(Period),
    Fun1 = fun (Id, Acc) ->
		   case lists:keyfind(Id, 1, Acc) of
		     A when is_tuple(A) -> Acc -- [A];
		     _ -> Acc
		   end
	   end,
    AllAwardList1 = lists:foldl(Fun1, AllAwardList,
				DrawInfo),
    Fun2 = fun (Award = {_, _, _, _, Must, _, _}, Acc) ->
		   case Must > 0 andalso DrawCount + 1 =:= Must of
		     true -> [Award | Acc];
		     _ -> Acc
		   end
	   end,
    AllAwardList2 = lists:foldl(Fun2, [], AllAwardList1),
    {Id, TypeId, Reward, _, _, _, _} = case AllAwardList2 of
					 [_ | _] ->
					     util:rand_list(AllAwardList2, 6);
					 _ ->
					     Fun3 = fun (A = {_, _, _, MustNot,
							      _, _, _},
							 Acc) ->
							    case MustNot > 0
								   andalso
								   DrawCount + 1
								     =< MustNot
								of
							      true -> Acc;
							      _ -> [A | Acc]
							    end
						    end,
					     AllAwardList3 = lists:foldl(Fun3,
									 [],
									 AllAwardList1),
					     util:rand_list(AllAwardList3, 6)
				       end,
    Num = list_util:keyfind(TypeId, DrawTypeInfo, 0),
    NewDrawTypeInfo = lists:keystore(TypeId, 1,
				     DrawTypeInfo, {TypeId, Num + 1}),
    NewMHolidayReturnNew =
	MHolidayReturnNew#m_holiday_return_new{draw_count =
						   DrawCount + 1,
					       draw_info = [Id | DrawInfo],
					       draw_type_info =
						   NewDrawTypeInfo},
    NRole = Role#role{m_holiday_return_new =
			  NewMHolidayReturnNew},
    {NRole, Reward}.

cal_draw_expend(Role, Times) ->
    [{ItemId, ItemNum}] =
	holiday_return_new_data:get_const(draw_item_cost),
    {_, HasNum} = package:count(by_base_id, ItemId,
				Role#role.p_bag),
    [{ValId, Val}] =
	holiday_return_new_data:get_const(draw_item_value),
    case HasNum >= ItemNum * Times of
      true -> [{ItemId, ItemNum * Times}];
      _ ->
	  Num = (ItemNum * Times - HasNum) * Val,
	  [{ItemId, HasNum}, {ValId, Num}]
    end.


