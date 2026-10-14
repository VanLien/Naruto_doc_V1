-file("src/mod/personal_push_gift/personal_push_gift"
      ".erl",
      1).

-module(personal_push_gift).

-lager_records([{activity,
		 [id, status, name, data, ext_args]},
		{triple_rebate_data,
		 [id, charge_sum, reward_times, mail_title,
		  mail_content]},
		{charge_data,
		 [id, name, val, gold, first_add, add, vip_exp, pic,
		  is_show, is_iosverify, type, items]},
		{m_charge,
		 [ver, charge_list, first_gift, triple_rebate_list,
		  merge_count, merge_charge_list, day_gift, week_refresh,
		  week_gift, month_refresh, month_gift, day_first_gift,
		  first_gift_ver, choose_first_gift_status,
		  reset_charge_list, warehouse_charge_list]},
		{personal_push_gift_data,
		 [gift_id, type_id, charge_id, limit_count, money,
		  costly_num, valid_time, open_cond, warehouse_id, award,
		  over_time, buy_count, trigger_id]},
		{m_personal_push,
		 [ver, fire_type, fire_not_buy, fire_gift, ext]},
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

-export([init/0, login/1, push_base_info/1, buy/2,
	 time_check/2, calc_push_gift/2]).

-export([gm_reset/1, gm_set_rfm/4, gm_get_rfm/1,
	 gm_fire_gift/2, gm_warehouse_check/1]).

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

-file("src/mod/personal_push_gift/personal_push_gift"
      ".erl",
      21).

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

-file("src/mod/personal_push_gift/personal_push_gift"
      ".erl",
      22).

-file("inc/personal_push.hrl", 1).

-record(m_personal_push,
	{ver = 1, fire_type = [], fire_not_buy = [],
	 fire_gift = [], ext = []}).

-record(personal_push_gift_data,
	{gift_id = 0, type_id = 0, charge_id = 0,
	 limit_count = 0, money = 0, costly_num = 0,
	 valid_time = 0, open_cond = [], warehouse_id = [],
	 award = [], over_time = 0, buy_count = 0,
	 trigger_id = 0}).

-file("src/mod/personal_push_gift/personal_push_gift"
      ".erl",
      23).

-file("inc/charge.hrl", 1).

-record(m_charge,
	{ver = 9, charge_list = [], first_gift = [],
	 triple_rebate_list = [], merge_count = 0,
	 merge_charge_list = [], day_gift = [], week_refresh = 0,
	 week_gift = [], month_refresh = 0, month_gift = [],
	 day_first_gift = {0, 0}, first_gift_ver = 0,
	 choose_first_gift_status = 0, reset_charge_list = [],
	 warehouse_charge_list = []}).

-record(charge_data,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(), val = 0  :: float(),
	 gold = 0  :: non_neg_integer(),
	 first_add = 0  :: non_neg_integer(),
	 add = 0  :: non_neg_integer(),
	 vip_exp = 0  :: non_neg_integer(),
	 pic = 0  :: non_neg_integer(), is_show = 0  :: 0..1,
	 is_iosverify = 1  :: 0..1,
	 type = 0  :: non_neg_integer(), items = []  :: list()}).

-record(triple_rebate_data,
	{id = 0  :: non_neg_integer(),
	 charge_sum = 0  :: bitstring(),
	 reward_times = 0  :: non_neg_integer(),
	 mail_title = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring()}).

-file("src/mod/personal_push_gift/personal_push_gift"
      ".erl",
      24).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/personal_push_gift/personal_push_gift"
      ".erl",
      25).

gm_reset(Role = #role{m_personal_push =
			  MR = #m_personal_push{}}) ->
    NRole = Role#role{m_personal_push =
			  MR#m_personal_push{fire_type = [], fire_not_buy = [],
					     fire_gift = []}},
    {ok, NRole}.

gm_set_rfm(Role = #role{m_charge = MC = #m_charge{}},
	   Time, Count, Money) ->
    NewChargeList = set_rfm(date:unixtime() - Time, Count,
			    Money, [], Count),
    NRole = Role#role{m_charge =
			  MC#m_charge{warehouse_charge_list = NewChargeList}},
    {ok, NRole}.

gm_get_rfm(#role{m_charge =
		     #m_charge{warehouse_charge_list = ChargeList}}) ->
    ChargeDay = personal_push_data:get_const(charge_day),
    StartTime = date:unixtime() - 86400 * ChargeDay,
    IntervalChargeTime = case ChargeList of
			   [_ | _] ->
			       lists:max([Time
					  || {Time, _ChargeId, _Money}
						 <- ChargeList]);
			   _ -> 0
			 end,
    RecncyScore = calc_type_score(date:unixtime() -
				    IntervalChargeTime,
				  1),
    ChargeTimes = [Time
		   || {Time, _ChargeId, _Money} <- ChargeList,
		      Time >= StartTime],
    FrequencyScore = calc_type_score(length(ChargeTimes),
				     2),
    MoneySum = lists:sum([Money
			  || {Time, _ChargeId, Money} <- ChargeList,
			     Time >= StartTime]),
    MonetaryScore = calc_type_score(MoneySum, 3),
    ScoresRange = get_socres_range(RecncyScore,
				   FrequencyScore, MonetaryScore),
    Money =
	personal_push_data:get_scores_to_money(ScoresRange),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpersonal_push_gift58, _,
       {__Levelpersonal_push_gift58,
	__Tracespersonal_push_gift58}}
	  when __Levelpersonal_push_gift58 band 64 /= 0 orelse
		 __Tracespersonal_push_gift58 /= [] ->
	  lager:do_log(info,
		       [{module, personal_push_gift}, {function, gm_get_rfm},
			{line, 58}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("-----------58---~w-------------",
				     [{ScoresRange, Money}]),
		       none, 4096, 64, __Levelpersonal_push_gift58,
		       __Tracespersonal_push_gift58, lager_event,
		       __Pidpersonal_push_gift58);
      _ -> ok
    end,
    [RecncyScore, FrequencyScore, MonetaryScore].

set_rfm(_Time, _Count, _Money, List, 0) -> List;
set_rfm(Time, Count, Money, List, 1) ->
    NewList = [{Time, Count, Money - Count + 1} | List],
    set_rfm(Time, Count, Money, NewList, 0);
set_rfm(Time, Count, Money, List, Num) ->
    NewList = [{Time, 0, 1} | List],
    set_rfm(Time, Count, Money, NewList, Num - 1).

gm_fire_gift(Role = #role{m_personal_push =
			      MPP = #m_personal_push{fire_type = FireTypeList,
						     fire_gift = FireGiftList}},
	     SGiftId) ->
    Now = date:unixtime(),
    case personal_push_data:get_gift(SGiftId) of
      GiftData = #personal_push_gift_data{valid_time =
					      ValidTime} ->
	  NewGiftData = GiftData#personal_push_gift_data{over_time
							     = Now + ValidTime,
							 trigger_id = 21001},
	  Fun = fun (Gift = #personal_push_gift_data{gift_id =
							 GiftId,
						     type_id = TypeId,
						     over_time = OverTime,
						     money = GiftMoney},
		     {Acc1, Acc3}) ->
			NewAcc1 = lists:keystore(TypeId, 1, Acc1,
						 {TypeId, Now}),
			GiftList1 = [GiftL
				     || GiftL = #personal_push_gift_data{type_id
									     =
									     TypeL,
									 money =
									     MoneyL}
					    <- Acc3,
					TypeL =:= TypeId andalso
					  MoneyL =:= GiftMoney],
			NewAcc3 = case GiftList1 of
				    [OldGift = #personal_push_gift_data{gift_id
									    =
									    OldGiftId,
									limit_count
									    =
									    OldLimitCount}
				     | _] ->
					set_time(OldGiftId, OverTime, Now),
					lists:keystore(OldGiftId,
						       #personal_push_gift_data.gift_id,
						       Acc3,
						       OldGift#personal_push_gift_data{limit_count
											   =
											   OldLimitCount
											     +
											     1,
										       over_time
											   =
											   OverTime});
				    _ ->
					set_time(GiftId, OverTime, Now),
					lists:keystore(GiftId,
						       #personal_push_gift_data.gift_id,
						       Acc3, Gift)
				  end,
			{NewAcc1, NewAcc3}
		end,
	  {NewFireTypeList, NewFireGiftList} = lists:foldl(Fun,
							   {FireTypeList,
							    FireGiftList},
							   [NewGiftData]),
	  NewRole = Role#role{m_personal_push =
				  MPP#m_personal_push{fire_type =
							  NewFireTypeList,
						      fire_gift =
							  NewFireGiftList}},
	  set_ico(NewRole),
	  push_flag(NewRole),
	  push_base_info(NewRole),
	  {ok, NewRole};
      _ -> {false, lang:get(<<"找不到礼包"/utf8>>)}
    end.

gm_warehouse_check(Role = #role{m_personal_push =
				    #m_personal_push{}}) ->
    put(warehouse_check, []),
    put(warehouse_cond_value, []),
    IdList = personal_push_data:get_cond_id_list(),
    List = do_gm_warehouse_check(Role, IdList, []),
    ValueList = util:get(warehouse_cond_value, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpersonal_push_gift112, _,
       {__Levelpersonal_push_gift112,
	__Tracespersonal_push_gift112}}
	  when __Levelpersonal_push_gift112 band 64 /= 0 orelse
		 __Tracespersonal_push_gift112 /= [] ->
	  lager:do_log(info,
		       [{module, personal_push_gift},
			{function, gm_warehouse_check}, {line, 112},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("---------warehouse_cond_value:~w",
				     [ValueList]),
		       none, 4096, 64, __Levelpersonal_push_gift112,
		       __Tracespersonal_push_gift112, lager_event,
		       __Pidpersonal_push_gift112);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpersonal_push_gift113, _,
       {__Levelpersonal_push_gift113,
	__Tracespersonal_push_gift113}}
	  when __Levelpersonal_push_gift113 band 64 /= 0 orelse
		 __Tracespersonal_push_gift113 /= [] ->
	  lager:do_log(info,
		       [{module, personal_push_gift},
			{function, gm_warehouse_check}, {line, 113},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("---------List:~w", [List]), none, 4096,
		       64, __Levelpersonal_push_gift113,
		       __Tracespersonal_push_gift113, lager_event,
		       __Pidpersonal_push_gift113);
      _ -> ok
    end,
    List.

do_gm_warehouse_check(_Role, [], Acc) -> Acc;
do_gm_warehouse_check(Role, [Id | Others], Acc) ->
    {WarehouseCond, _DWeight} =
	personal_push_data:get_warehouse_cond(Id),
    case warehouse_check:check(WarehouseCond, Role) of
      true -> do_gm_warehouse_check(Role, Others, [Id | Acc]);
      _ -> do_gm_warehouse_check(Role, Others, Acc)
    end.

-spec init() -> #m_personal_push{}.

init() -> #m_personal_push{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    Now = date:unixtime(),
    set_time(Role, Now),
    set_ico(Role),
    {ok, Role}.

set_ico(#role{m_personal_push =
		  #m_personal_push{fire_gift = []}}) ->
    activity_self:set_activity(809, 0, []);
set_ico(#role{m_personal_push =
		  #m_personal_push{fire_gift = List}}) ->
    List1 = [Gift
	     || Gift = #personal_push_gift_data{limit_count =
						    LimitCount,
						buy_count = BuyCount}
		    <- List,
		BuyCount < LimitCount],
    case List1 of
      [_ | _] ->
	  EndTime = lists:min([OverTime
			       || #personal_push_gift_data{over_time = OverTime}
				      <- List1]),
	  activity_self:set_activity(809, 1, [EndTime]);
      _ -> activity_self:set_activity(809, 0, [])
    end.

set_time(#role{m_personal_push =
		   #m_personal_push{fire_gift = List}},
	 Now) ->
    set_time(List, Now);
set_time([], _Now) -> ok;
set_time([#personal_push_gift_data{gift_id = Id,
				   over_time = EndTime}
	  | List],
	 Now) ->
    set_time(Id, EndTime, Now), set_time(List, Now).

set_time(Id, EndTime, Now) ->
    Time = max(1, EndTime - Now),
    role:set_ms_timer({personal_push_gift, Id}, Time * 1000,
		      {personal_push_gift, time_check, [Id]}).

-spec time_check(#role{}, pos_integer()) -> {ok,
					     #role{}}.

time_check(Role = #role{m_personal_push =
			    MMP = #m_personal_push{fire_gift = List,
						   fire_not_buy =
						       FireNotBuyList}},
	   Id) ->
    NewFireNotBuyList = case lists:keyfind(Id,
					   #personal_push_gift_data.gift_id,
					   List)
			    of
			  #personal_push_gift_data{buy_count = BuyCount,
						   over_time = OverTime,
						   valid_time = ValidTime}
			      when BuyCount =:= 0 ->
			      [{Id, OverTime - ValidTime} | FireNotBuyList];
			  _ -> FireNotBuyList
			end,
    NewList = lists:keydelete(Id,
			      #personal_push_gift_data.gift_id, List),
    NewRole = Role#role{m_personal_push =
			    MMP#m_personal_push{fire_gift = NewList,
						fire_not_buy =
						    NewFireNotBuyList}},
    set_ico(NewRole),
    push_base_info(NewRole),
    {ok, NewRole}.

push_base_info(#role{m_personal_push =
			 #m_personal_push{fire_gift = List}}) ->
    Fun = fun (#personal_push_gift_data{gift_id = GiftId,
					charge_id = ChargeId,
					limit_count = LimitCount,
					costly_num = CostlyNum, award = Award,
					over_time = OverTime,
					buy_count = BuyCount,
					trigger_id = Trigger},
	       Acc) ->
		  Desc = personal_push_data:get_trigger_desc(Trigger),
		  [{GiftId, ChargeId, LimitCount, CostlyNum, Award,
		    OverTime, BuyCount, Desc}
		   | Acc]
	  end,
    CliInfo = lists:foldl(Fun, [], List),
    sys_conn:pack_send(28900, {CliInfo}),
    ok.

push_flag(#role{m_personal_push =
		    #m_personal_push{fire_gift = List}}) ->
    case List of
      [_ | _] -> sys_conn:pack_send(28901, {1});
      _ -> skip
    end,
    ok.

-spec buy(#role{}, map()) -> {ok, #role{}}.

buy(Role = #role{m_personal_push =
		     #m_personal_push{fire_gift = FireList}},
    Opt = #{package_id := PackageId, sn := Sn,
	    money := Money}) ->
    case lists:keyfind(PackageId,
		       #personal_push_gift_data.charge_id, FireList)
	of
      Gift = #personal_push_gift_data{gift_id = GiftId,
				      money = GiftMoney,
				      limit_count = LimitCount,
				      buy_count = BuyCount, award = Award,
				      trigger_id = TriggerId}
	  when GiftMoney == Money ->
	  case BuyCount < LimitCount of
	    true ->
		Gain = format:val_to_gain(Award,
					  personal_push_gift_award),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole1 = #role{m_personal_push = MMP}} ->
		      log:log_gain(Gain, Role, NRole1, <<"运营活动_个推仓检礼包"/utf8>>,
				   util:fbin("购买礼包id:~w", [GiftId])),
		      NewGift = Gift#personal_push_gift_data{buy_count =
								 BuyCount + 1},
		      NewFireList = case BuyCount + 1 >= LimitCount of
				      true ->
					  lists:keydelete(GiftId,
							  #personal_push_gift_data.gift_id,
							  FireList);
				      _ ->
					  lists:keystore(GiftId,
							 #personal_push_gift_data.gift_id,
							 FireList, NewGift)
				    end,
		      NewRole = NRole1#role{m_personal_push =
						MMP#m_personal_push{fire_gift =
									NewFireList}},
		      log:save(task,
			       {NewRole, 1, GiftId,
				util:fbin(<<"~w-~w"/utf8>>, [GiftId, Money]),
				110, <<"RFM个推礼包"/utf8>>,
				util:fbin(<<"lev:~w,power:~w"/utf8>>,
					  [Role#role.lev, Role#role.power])}),
		      log:save(task,
			       {NewRole, 1, TriggerId,
				util:fbin(<<"~w-~w"/utf8>>, [TriggerId, Money]),
				111, <<"RFM个推礼包_推送条件"/utf8>>,
				util:fbin(<<"lev:~w,power:~w"/utf8>>,
					  [Role#role.lev, Role#role.power])}),
		      push_base_info(NewRole),
		      set_ico(NewRole),
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
			{__Pidpersonal_push_gift225, _,
			 {__Levelpersonal_push_gift225,
			  __Tracespersonal_push_gift225}}
			    when __Levelpersonal_push_gift225 band 8 /= 0 orelse
				   __Tracespersonal_push_gift225 /= [] ->
			    lager:do_log(error,
					 [{module, personal_push_gift},
					  {function, buy}, {line, 225},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w领取个推仓检礼包~w失败",
						       [{Role#role.id,
							 Role#role.name},
							PackageId]),
					 none, 4096, 8,
					 __Levelpersonal_push_gift225,
					 __Tracespersonal_push_gift225,
					 lager_event,
					 __Pidpersonal_push_gift225);
			_ -> ok
		      end,
		      {ok, Role}
		end;
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole,
			       <<"运营活动_个推仓检礼包"/utf8>>,
			       util:fbin("个推仓检礼包充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

calc_push_gift(Role = #role{m_personal_push =
				MPP = #m_personal_push{fire_type = FireTypeList,
						       fire_gift =
							   FireGiftList}},
	       Cond) ->
    put(warehouse_check, []),
    put(warehouse_cond_value, []),
    {TriggerId, GiftTypeList} =
	personal_push_data:get_gift_type_list(Cond),
    Money = calc_push_money(Role),
    GiftList = calc_gift_list(Role, GiftTypeList, Money,
			      TriggerId),
    GiftIdList = [Gid
		  || #personal_push_gift_data{gift_id = Gid} <- GiftList],
    case GiftList of
      [_ | _] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpersonal_push_gift252, _,
	     {__Levelpersonal_push_gift252,
	      __Tracespersonal_push_gift252}}
		when __Levelpersonal_push_gift252 band 64 /= 0 orelse
		       __Tracespersonal_push_gift252 /= [] ->
		lager:do_log(info,
			     [{module, personal_push_gift},
			      {function, calc_push_gift}, {line, 252},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家:~ts，id:~w,匹配到礼包:~w，金额；~w, 触发器id:~w",
					   [Role#role.name, Role#role.id,
					    GiftIdList, Money, TriggerId]),
			     none, 4096, 64, __Levelpersonal_push_gift252,
			     __Tracespersonal_push_gift252, lager_event,
			     __Pidpersonal_push_gift252);
	    _ -> ok
	  end,
	  Now = date:unixtime(),
	  Fun = fun (Gift = #personal_push_gift_data{gift_id =
							 GiftId,
						     type_id = TypeId,
						     over_time = OverTime,
						     money = GiftMoney},
		     {Acc1, Acc3}) ->
			NewAcc1 = lists:keystore(TypeId, 1, Acc1,
						 {TypeId, Now}),
			GiftList1 = [GiftL
				     || GiftL = #personal_push_gift_data{type_id
									     =
									     TypeL,
									 money =
									     MoneyL,
									 buy_count
									     =
									     BuyCountL,
									 limit_count
									     =
									     LimitCountL}
					    <- Acc3,
					TypeL =:= TypeId andalso
					  MoneyL =:= GiftMoney andalso
					    BuyCountL < LimitCountL],
			NewAcc3 = case GiftList1 of
				    [OldGift = #personal_push_gift_data{gift_id
									    =
									    OldGiftId,
									limit_count
									    =
									    OldLimitCount}
				     | _] ->
					case {whereis(lager_event),
					      whereis(lager_event),
					      lager_config:get({lager_event,
								loglevel},
							       {0, []})}
					    of
					  {undefined, undefined, _} ->
					      fun () ->
						      {error, lager_not_running}
					      end();
					  {undefined, _, _} ->
					      fun () ->
						      {error,
						       {sink_not_configured,
							lager_event}}
					      end();
					  {__Pidpersonal_push_gift262, _,
					   {__Levelpersonal_push_gift262,
					    __Tracespersonal_push_gift262}}
					      when __Levelpersonal_push_gift262
						     band 64
						     /= 0
						     orelse
						     __Tracespersonal_push_gift262
						       /= [] ->
					      lager:do_log(info,
							   [{module,
							     personal_push_gift},
							    {function,
							     calc_push_gift},
							    {line, 262},
							    {pid,
							     pid_to_list(self())},
							    {node, node()}
							    | lager:md()],
							   io_lib:format("玩家:~ts，id:~w,增加旧礼包~w限购次数，旧次数:~w",
									 [Role#role.name,
									  Role#role.id,
									  OldGiftId,
									  OldLimitCount]),
							   none, 4096, 64,
							   __Levelpersonal_push_gift262,
							   __Tracespersonal_push_gift262,
							   lager_event,
							   __Pidpersonal_push_gift262);
					  _ -> ok
					end,
					log:save(task,
						 {Role, 0, OldGiftId,
						  util:fbin(<<"~w-~w"/utf8>>,
							    [OldGiftId, Money]),
						  110, <<"RFM个推礼包"/utf8>>,
						  util:fbin(<<"lev:~w,power:~w"/utf8>>,
							    [Role#role.lev,
							     Role#role.power])}),
					set_time(OldGiftId, OverTime, Now),
					lists:keystore(OldGiftId,
						       #personal_push_gift_data.gift_id,
						       Acc3,
						       OldGift#personal_push_gift_data{limit_count
											   =
											   OldLimitCount
											     +
											     1,
										       over_time
											   =
											   OverTime});
				    _ ->
					case {whereis(lager_event),
					      whereis(lager_event),
					      lager_config:get({lager_event,
								loglevel},
							       {0, []})}
					    of
					  {undefined, undefined, _} ->
					      fun () ->
						      {error, lager_not_running}
					      end();
					  {undefined, _, _} ->
					      fun () ->
						      {error,
						       {sink_not_configured,
							lager_event}}
					      end();
					  {__Pidpersonal_push_gift268, _,
					   {__Levelpersonal_push_gift268,
					    __Tracespersonal_push_gift268}}
					      when __Levelpersonal_push_gift268
						     band 64
						     /= 0
						     orelse
						     __Tracespersonal_push_gift268
						       /= [] ->
					      lager:do_log(info,
							   [{module,
							     personal_push_gift},
							    {function,
							     calc_push_gift},
							    {line, 268},
							    {pid,
							     pid_to_list(self())},
							    {node, node()}
							    | lager:md()],
							   io_lib:format("玩家:~ts，id:~w,增加新礼包：~w",
									 [Role#role.name,
									  Role#role.id,
									  GiftId]),
							   none, 4096, 64,
							   __Levelpersonal_push_gift268,
							   __Tracespersonal_push_gift268,
							   lager_event,
							   __Pidpersonal_push_gift268);
					  _ -> ok
					end,
					log:save(task,
						 {Role, 0, GiftId,
						  util:fbin(<<"~w-~w"/utf8>>,
							    [GiftId, Money]),
						  110, <<"RFM个推礼包"/utf8>>,
						  util:fbin(<<"lev:~w,power:~w"/utf8>>,
							    [Role#role.lev,
							     Role#role.power])}),
					set_time(GiftId, OverTime, Now),
					lists:keystore(GiftId,
						       #personal_push_gift_data.gift_id,
						       Acc3, Gift)
				  end,
			log:save(task,
				 {Role, 0, TriggerId,
				  util:fbin(<<"~w-~w"/utf8>>,
					    [TriggerId, Money]),
				  111, <<"RFM个推礼包_推送条件"/utf8>>,
				  util:fbin(<<"lev:~w,power:~w"/utf8>>,
					    [Role#role.lev, Role#role.power])}),
			{NewAcc1, NewAcc3}
		end,
	  {NewFireTypeList, NewFireGiftList} = lists:foldl(Fun,
							   {FireTypeList,
							    FireGiftList},
							   GiftList),
	  NewRole = Role#role{m_personal_push =
				  MPP#m_personal_push{fire_type =
							  NewFireTypeList,
						      fire_gift =
							  NewFireGiftList}},
	  set_ico(NewRole),
	  push_flag(NewRole),
	  push_base_info(NewRole),
	  NewRole;
      _ -> Role
    end.

-spec calc_gift_list(#role{}, list(), pos_integer(),
		     pos_integer()) -> list().

calc_gift_list(Role = #role{m_personal_push =
				#m_personal_push{fire_type = FireTypeList}},
	       GiftTypeList, Money, TriggerId) ->
    Now = date:unixtime(),
    Fun = fun (TypeId, Acc) ->
		  CdTime = personal_push_data:get_type_cd(TypeId),
		  LastFireTime = list_util:keyfind(TypeId, FireTypeList,
						   0),
		  case Now - LastFireTime >= CdTime of
		    true ->
			TypeGiftList = personal_push_data:get_gift_list({TypeId,
									 Money}),
			case do_calc_gift_weight(Role, TypeGiftList, Now,
						 TriggerId, [])
			    of
			  {ok, Gift} -> [Gift | Acc];
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    AllGiftList = lists:foldl(Fun, [], GiftTypeList),
    AllGiftList.

do_calc_gift_weight(_Role = #role{m_personal_push =
				      #m_personal_push{fire_not_buy =
							   FireNotBuyList}},
		    [], Now, TriggerId, GiftWeightList) ->
    case GiftWeightList of
      [_ | _] ->
	  NotBuyDay =
	      personal_push_data:get_const(fire_not_buy_day),
	  Fun = fun ({Gift = #personal_push_gift_data{gift_id =
							  GiftId},
		      Weight},
		     Acc) ->
			LastBotBuyTime = list_util:keyfind(GiftId,
							   FireNotBuyList, 0),
			Flag = Now - LastBotBuyTime >= 86400 * NotBuyDay,
			case Flag of
			  true -> [{Gift, Weight} | Acc];
			  _ -> Acc
			end
		end,
	  GiftWeightList1 = lists:foldl(Fun, [], GiftWeightList),
	  GiftWeightList2 = case GiftWeightList1 of
			      [_ | _] -> GiftWeightList1;
			      _ -> GiftWeightList
			    end,
	  [{GiftData = #personal_push_gift_data{valid_time =
						    ValidTime},
	    _}
	   | _] =
	      list_util:keyresort(2, GiftWeightList2),
	  NewGiftData = GiftData#personal_push_gift_data{over_time
							     = Now + ValidTime,
							 trigger_id =
							     TriggerId},
	  {ok, NewGiftData};
      _ -> false
    end;
do_calc_gift_weight(Role,
		    [Gift = #personal_push_gift_data{open_cond = OpenCond,
						     warehouse_id =
							 WareHouseIdList}
		     | Others],
		    Now, TriggerId, GiftWeightList) ->
    case role_misc:check_open_cond(OpenCond, Role) of
      true ->
	  Weight = warehouse_check_weight(Role, WareHouseIdList,
					  0),
	  do_calc_gift_weight(Role, Others, Now, TriggerId,
			      [{Gift, Weight} | GiftWeightList]);
      _ ->
	  do_calc_gift_weight(Role, Others, Now, TriggerId,
			      GiftWeightList)
    end.

warehouse_check_weight(_Role, [], Acc) -> Acc;
warehouse_check_weight(Role, [Id | Others], Acc) ->
    WeightList = util:get(warehouse_check, []),
    {Weight, NewWeightList} = case lists:keyfind(Id, 1,
						 WeightList)
				  of
				{Id, LWeight} -> {LWeight, WeightList};
				_ ->
				    {WarehouseCond, DWeight} =
					personal_push_data:get_warehouse_cond(Id),
				    case warehouse_check:check(WarehouseCond,
							       Role)
					of
				      true ->
					  {DWeight,
					   lists:keystore(Id, 1, WeightList,
							  {Id, DWeight})};
				      _ ->
					  {0,
					   lists:keystore(Id, 1, WeightList,
							  {Id, 0})}
				    end
			      end,
    put(warehouse_check, NewWeightList),
    warehouse_check_weight(Role, Others, Acc + Weight).

-spec calc_push_money(#role{}) -> pos_integer().

calc_push_money(#role{m_charge =
			  #m_charge{warehouse_charge_list = ChargeList}}) ->
    ChargeDay = personal_push_data:get_const(charge_day),
    StartTime = date:unixtime() - 86400 * ChargeDay,
    IntervalChargeTime = case ChargeList of
			   [_ | _] ->
			       lists:max([Time
					  || {Time, _ChargeId, _Money}
						 <- ChargeList]);
			   _ -> 0
			 end,
    RecncyScore = calc_type_score(date:unixtime() -
				    IntervalChargeTime,
				  1),
    ChargeTimes = [Time
		   || {Time, _ChargeId, _Money} <- ChargeList,
		      Time >= StartTime],
    FrequencyScore = calc_type_score(length(ChargeTimes),
				     2),
    MoneySum = lists:sum([Money
			  || {Time, _ChargeId, Money} <- ChargeList,
			     Time >= StartTime]),
    MonetaryScore = calc_type_score(MoneySum, 3),
    ScoresRange = get_socres_range(RecncyScore,
				   FrequencyScore, MonetaryScore),
    Money =
	personal_push_data:get_scores_to_money(ScoresRange),
    Money.

get_socres_range(RecncyScore, FrequencyScore,
		 MonetaryScore) ->
    List = personal_push_data:get_score_range(),
    do_get_socres_range(RecncyScore, FrequencyScore,
			MonetaryScore, List).

do_get_socres_range(_RecncyScore, _FrequencyScore,
		    _MonetaryScore, []) ->
    {};
do_get_socres_range(RecncyScore, FrequencyScore,
		    MonetaryScore, [Range | Others]) ->
    [{Min1, Max1}, {Min2, Max2}, {Min3, Max3}] = Range,
    Flag1 = RecncyScore >= Min1 andalso RecncyScore =< Max1,
    Flag2 = FrequencyScore >= Min2 andalso
	      FrequencyScore =< Max2,
    Flag3 = MonetaryScore >= Min3 andalso
	      MonetaryScore =< Max3,
    case Flag1 =:= true andalso
	   Flag2 =:= true andalso Flag3 =:= true
	of
      true -> Range;
      _ ->
	  do_get_socres_range(RecncyScore, FrequencyScore,
			      MonetaryScore, Others)
    end.

calc_type_score(Value, Type) ->
    List = personal_push_data:get_rfm_list(Type),
    do_calc_type_score(Value, List).

do_calc_type_score(_Value, []) -> 1;
do_calc_type_score(Value,
		   [{Score, Min, Max} | Others]) ->
    case Value >= Min andalso Value =< Max of
      true -> Score;
      _ -> do_calc_type_score(Value, Others)
    end.


