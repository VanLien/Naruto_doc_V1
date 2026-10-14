-file("src/mod/holiday/holiday_groupon.erl", 1).

-module(holiday_groupon).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		{state, [switch]}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0]).

-export([gm/1, env_info/1, reward_info/2,
	 current_discount/2, add/1, check_status/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_exchange_info/1, take_exchange/3,
	 exchange_clean_buy/1]).

-record(state, {switch = close}).

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

-file("src/mod/holiday/holiday_groupon.erl", 26).

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

-file("src/mod/holiday/holiday_groupon.erl", 27).

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

-file("src/mod/holiday/holiday_groupon.erl", 28).

-file("inc/gain.hrl", 1).

-record(gain,
	{label  :: atom(), val  :: term(),
	 msg = <<>>  :: bitstring(), flag  :: atom(),
	 reason  :: atom(), ext = 0  :: term(),
	 notice = 0  :: 0..1,
	 move_to = 0  :: non_neg_integer()}).

-record(loss,
	{label  :: atom(), val  :: term(),
	 own_val = 0  :: term(), msg = <<>>  :: bitstring(),
	 flag  :: atom(), reason  :: atom(),
	 ext = 0  :: term()}).

-record(gain_loss_opts,
	{title = <<>>, return_gl = [], is_continue = false,
	 order = loss  :: gain | loss,
	 gain_tag = <<>>  :: binary(),
	 loss_tag = <<>>  :: binary(),
	 split_str = <<"，"/utf8>>  :: binary(),
	 split_op_str = <<"，"/utf8>>  :: binary(),
	 type = 2  :: non_neg_integer(),
	 is_auto_buy = 0  :: 0..1,
	 need_notify_fail_item = false  :: true | false,
	 log_name = <<"市场"/utf8>>  :: true | false}).

-file("src/mod/holiday/holiday_groupon.erl", 29).

-file("inc/log.hrl", 1).

-file("src/mod/holiday/holiday_groupon.erl", 30).

-spec get_exchange_info(#role{}) -> ok.

get_exchange_info(Role = #role{lev = Lev}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3028, 93028, 993028])
	of
      #holiday{camp_id = CampId} ->
	  {AllDayList, AllList} = sys_env:get({holiday_groupon,
					       CampId},
					      {[], []}),
	  {DayList, BuyList} = holiday_lib:get_tv_val(CampId,
						      93028, Role),
	  Fun = fun (Id, Acc) ->
			case check_limit(Role,
					 holiday_exchange_data:get_limit(Id))
			    of
			  true ->
			      Val1 = list_util:keyfind(Id, DayList, 0),
			      Val2 = list_util:keyfind(Id, BuyList, 0),
			      Val3 = list_util:keyfind(Id, AllDayList, 0),
			      Val4 = list_util:keyfind(Id, AllList, 0),
			      [{Id, Val1, Val2, Val3, Val4} | Acc];
			  _ -> Acc
			end
		end,
	  PushList = lists:foldl(Fun, [],
				 holiday_exchange_data:list()),
	  sys_conn:pack_send(16688, {PushList}),
	  ok;
      _ -> notice:alert(lang:get(<<"活动已结束"/utf8>>)), ok
    end.

check_limit(_Role, []) -> true;
check_limit(Role = #role{lev = Lev},
	    [{lev, MinLev, MaxLev} | Other]) ->
    case Lev >= MinLev andalso Lev =< MaxLev of
      true -> check_limit(Role, Other);
      _ -> {false, lang:get(<<"等级不符合购买条件"/utf8>>)}
    end.

-spec take_exchange(#role{}, pos_integer(),
		    pos_integer()) -> {ok, #role{}} | {false, binary()}.

take_exchange(Role, Id, Num) when Num > 0 ->
    case holiday_lib:get_open_holiday(Role,
				      [3028, 93028, 993028])
	of
      Holiday = #holiday{camp_id = CampId, bid = Bid} ->
	  case check_limit(Role,
			   holiday_exchange_data:get_limit(Id))
	      of
	    true ->
		case holiday_exchange_data:get_buy_info(Id) of
		  {Expend, Award} ->
		      case holiday_exchange_data:get_limit_info(Id) of
			{Limit1, Limit2, Limit3, Limit4} ->
			    {AllDayList, AllList} =
				sys_env:get({holiday_groupon, CampId},
					    {[], []}),
			    {DayList, BuyList} = holiday_lib:get_tv_val(CampId,
									Bid,
									Role),
			    Val1 = list_util:keyfind(Id, DayList, 0),
			    Val2 = list_util:keyfind(Id, BuyList, 0),
			    Val3 = list_util:keyfind(Id, AllDayList, 0),
			    Val4 = list_util:keyfind(Id, AllList, 0),
			    if Limit1 > 0, Val1 + Num > Limit1 ->
				   {false, lang:get(<<"今日购买已达上限"/utf8>>)};
			       Limit2 > 0, Val2 + Num > Limit2 ->
				   {false, lang:get(<<"商品购买已达上限"/utf8>>)};
			       Limit3 > 0, Val3 + Num > Limit3 ->
				   {false, lang:get(<<"今日全服购买已达上限"/utf8>>)};
			       Limit4 > 0, Val4 + Num > Limit4 ->
				   {false, lang:get(<<"商品全服购买已达上限"/utf8>>)};
			       true ->
				   NewExpend = [{ItemIdT,
						 util:round(NumT * Num)}
						|| {ItemIdT, NumT} <- Expend],
				   NewAward = [{ItemIdT, util:round(NumT * Num)}
					       || {ItemIdT, NumT} <- Award],
				   Loss = format:val_to_loss(NewExpend,
							     hd_3028_buy),
				   Gain = format:val_to_gain(NewAward,
							     hd_3028_buy),
				   case role_gain:do_notice(Role, Loss ++ Gain)
				       of
				     {ok, NRole} ->
					 log:log_gain(Loss ++ Gain, Role, NRole,
						      <<"运营活动_杂货铺"/utf8>>,
						      util:fbin(lang:get(<<"兑换id:~w ~w"/utf8>>),
								[Id, Num])),
					 case Limit3 > 0 orelse Limit4 > 0 of
					   true ->
					       info({exchange_add_count, CampId,
						     Id, Num});
					   _ -> skip
					 end,
					 NDayList = util:if_true(Limit1 == 0,
								 DayList,
								 lists:keystore(Id,
										1,
										DayList,
										{Id,
										 Val1
										   +
										   Num})),
					 NBuyList = util:if_true(Limit2 == 0,
								 BuyList,
								 lists:keystore(Id,
										1,
										BuyList,
										{Id,
										 Val2
										   +
										   Num})),
					 ExpireSec =
					     holiday_lib:get_tv_timeout(Holiday),
					 NewRole =
					     holiday_lib:set_tv_val(CampId,
								    NRole,
								    {NDayList,
								     NBuyList},
								    ExpireSec),
					 get_exchange_info(NewRole),
					 {ok, NewRole};
				     {false, #loss{msg = Msg}} -> {false, Msg};
				     {false, #gain{msg = Msg}} -> {false, Msg}
				   end
			    end;
			_ -> {false, lang:get(<<"参数错误"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"没有该奖励"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"购买条件不足"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动已结束"/utf8>>)}
    end;
take_exchange(_, _, _) ->
    {false, lang:get(<<"购买数量不对"/utf8>>)}.

-spec exchange_clean_buy(day | all) -> ok.

exchange_clean_buy(Type) ->
    case holiday_lib:get_open_holiday([3028, 93028, 993028])
	of
      #holiday{camp_id = CampId} ->
	  info({exchange_clean_buy, Type, CampId});
      _ -> ok
    end.

gm(Role) ->
    NRole = var:set_var(Role,
			{timeout, date:unixtime(zero) + 86400 * 2},
			{holiday, 11001}, {0, [{1, 1, [5000, 5000, 5000]}]}),
    {ok, NRole}.

check_status() -> holiday_groupon ! check_status.

info(Info) -> holiday_groupon ! Info.

cast(Info) -> gen_server:cast(holiday_groupon, Info).

call(Info) ->
    case catch gen_server:call(holiday_groupon, Info, 10000)
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
	    {__Pidholiday_groupon157, _,
	     {__Levelholiday_groupon157, __Tracesholiday_groupon157}}
		when __Levelholiday_groupon157 band 8 /= 0 orelse
		       __Tracesholiday_groupon157 /= [] ->
		lager:do_log(error,
			     [{module, holiday_groupon}, {function, call},
			      {line, 157}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_groupon, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_groupon157,
			     __Tracesholiday_groupon157, lager_event,
			     __Pidholiday_groupon157);
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
    gen_server:start_link({local, holiday_groupon},
			  holiday_groupon, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_groupon163, _,
       {__Levelholiday_groupon163, __Tracesholiday_groupon163}}
	  when __Levelholiday_groupon163 band 64 /= 0 orelse
		 __Tracesholiday_groupon163 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_groupon}, {function, init},
			{line, 163}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_groupon]), none,
		       4096, 64, __Levelholiday_groupon163,
		       __Tracesholiday_groupon163, lager_event,
		       __Pidholiday_groupon163);
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
      {__Pidholiday_groupon166, _,
       {__Levelholiday_groupon166, __Tracesholiday_groupon166}}
	  when __Levelholiday_groupon166 band 64 /= 0 orelse
		 __Tracesholiday_groupon166 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_groupon}, {function, init},
			{line, 166}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_groupon]), none,
		       4096, 64, __Levelholiday_groupon166,
		       __Tracesholiday_groupon166, lager_event,
		       __Pidholiday_groupon166);
      _ -> ok
    end,
    {ok, State}.

handle_call({get_env_info, CampId}, _From, State) ->
    Reply = env_info(CampId), {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({exchange_clean_buy, day, CampId}, State) ->
    {_, AllList} = sys_env:get({holiday_groupon, CampId},
			       {[], []}),
    save(CampId, {[], AllList}),
    {noreply, State};
handle_info({exchange_clean_buy, all, CampId}, State) ->
    save(CampId, {[], []}), {noreply, State};
handle_info({exchange_add_count, CampId, Id, BuyCount},
	    State) ->
    {AllDayList, AllList} = sys_env:get({holiday_groupon,
					 CampId},
					{[], []}),
    DayCount = list_util:keyfind(Id, AllDayList, 0),
    AllCount = list_util:keyfind(Id, AllList, 0),
    NAllDayList = lists:keystore(Id, 1, AllDayList,
				 {Id, DayCount + BuyCount}),
    NAllList = lists:keystore(Id, 1, AllList,
			      {Id, AllCount + BuyCount}),
    save(CampId, {NAllDayList, NAllList}),
    {noreply, State};
handle_info({add, Id}, State) ->
    case get_open_holiday() of
      #holiday{camp_id = CampId} ->
	  List = env_info(CampId),
	  InitDiscount = list_util:keyfind(0,
					   holiday_groupon_data:discount({CampId,
									  Id}),
					   1000),
	  InitCount = holiday_groupon_data:get_init({CampId, Id}),
	  {_, BuyCount, Discount} = list_util:keyfind(Id, 1, List,
						      {Id, InitCount,
						       InitDiscount}),
	  NewBuyCount = BuyCount + 1,
	  NewDiscount = case [DiscountT
			      || {Goal, DiscountT}
				     <- holiday_groupon_data:discount({CampId,
								       Id}),
				 NewBuyCount >= Goal]
			    of
			  DT = [_ | _] -> lists:min(DT);
			  _ -> Discount
			end,
	  NewList = lists:keystore(Id, 1, List,
				   {Id, NewBuyCount, NewDiscount}),
	  save(CampId, NewList),
	  ok;
      _ -> skip
    end,
    {noreply, State};
handle_info(auto_add, State = #state{switch = open}) ->
    Now = date:unixtime(),
    IsCanAdd = case cluster_group:has_main() of
		 true -> cluster_group:is_main();
		 _ -> true
	       end,
    case IsCanAdd of
      true ->
	  case get_open_holiday() of
	    #holiday{camp_id = CampId, end_time = EndTime}
		when EndTime - Now > 86400 ->
		List = env_info(CampId),
		Ids = holiday_groupon_data:ids(CampId),
		Fun = fun (Id, Acc) ->
			      MaxCount = holiday_groupon_data:max_count({CampId,
									 Id}),
			      InitDiscount = list_util:keyfind(0,
							       holiday_groupon_data:discount({CampId,
											      Id}),
							       1000),
			      InitCount = holiday_groupon_data:get_init({CampId,
									 Id}),
			      {_, BuyCount, Discount} = list_util:keyfind(Id, 1,
									  List,
									  {Id,
									   InitCount,
									   InitDiscount}),
			      AutoAddRateList =
				  holiday_groupon_data:get_auto_rate({CampId,
								      Id}),
			      AutoAddRate = calc_auto_rate(AutoAddRateList,
							   BuyCount, MaxCount),
			      NewBuyCount = if BuyCount =< MaxCount ->
						   BuyCount +
						     util:round(MaxCount *
								  AutoAddRate
								  / 1000);
					       true -> BuyCount
					    end,
			      NewDiscount = case [DiscountT
						  || {Goal, DiscountT}
							 <- holiday_groupon_data:discount({CampId,
											   Id}),
						     NewBuyCount >= Goal]
						of
					      DT = [_ | _] -> lists:min(DT);
					      _ -> Discount
					    end,
			      lists:keystore(Id, 1, Acc,
					     {Id, NewBuyCount, NewDiscount})
		      end,
		NewList = lists:foldl(Fun, List, Ids),
		save(CampId, NewList),
		util:set_timer(auto_add_timer, 60 * 15, auto_add),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_groupon252, _,
		   {__Levelholiday_groupon252, __Tracesholiday_groupon252}}
		      when __Levelholiday_groupon252 band 64 /= 0 orelse
			     __Tracesholiday_groupon252 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_groupon},
				    {function, handle_info}, {line, 252},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("团购自增前【~w】 自增后【~w】",
						 [List, NewList]),
				   none, 4096, 64, __Levelholiday_groupon252,
				   __Tracesholiday_groupon252, lager_event,
				   __Pidholiday_groupon252);
		  _ -> ok
		end,
		ok;
	    _ -> skip
	  end;
      _ -> skip
    end,
    {noreply, State};
handle_info(check_status,
	    State = #state{switch = Switch}) ->
    NState = case get_open_holiday() of
	       #holiday{} ->
		   case Switch of
		     close ->
			 case {whereis(lager_event), whereis(lager_event),
			       lager_config:get({lager_event, loglevel},
						{0, []})}
			     of
			   {undefined, undefined, _} ->
			       fun () -> {error, lager_not_running} end();
			   {undefined, _, _} ->
			       fun () ->
				       {error,
					{sink_not_configured, lager_event}}
			       end();
			   {__Pidholiday_groupon269, _,
			    {__Levelholiday_groupon269,
			     __Tracesholiday_groupon269}}
			       when __Levelholiday_groupon269 band 64 /= 0
				      orelse __Tracesholiday_groupon269 /= [] ->
			       lager:do_log(info,
					    [{module, holiday_groupon},
					     {function, handle_info},
					     {line, 269},
					     {pid, pid_to_list(self())},
					     {node, node()}
					     | lager:md()],
					    io_lib:format("检查团购活动状态:~w to open",
							  [Switch]),
					    none, 4096, 64,
					    __Levelholiday_groupon269,
					    __Tracesholiday_groupon269,
					    lager_event,
					    __Pidholiday_groupon269);
			   _ -> ok
			 end,
			 util:set_timer(save_env_timer, 60 * 30, save_env),
			 util:set_timer(auto_add_timer, 60 * 15, auto_add),
			 State#state{switch = open};
		     open ->
			 case {whereis(lager_event), whereis(lager_event),
			       lager_config:get({lager_event, loglevel},
						{0, []})}
			     of
			   {undefined, undefined, _} ->
			       fun () -> {error, lager_not_running} end();
			   {undefined, _, _} ->
			       fun () ->
				       {error,
					{sink_not_configured, lager_event}}
			       end();
			   {__Pidholiday_groupon274, _,
			    {__Levelholiday_groupon274,
			     __Tracesholiday_groupon274}}
			       when __Levelholiday_groupon274 band 64 /= 0
				      orelse __Tracesholiday_groupon274 /= [] ->
			       lager:do_log(info,
					    [{module, holiday_groupon},
					     {function, handle_info},
					     {line, 274},
					     {pid, pid_to_list(self())},
					     {node, node()}
					     | lager:md()],
					    io_lib:format("检查团购活动状态:~w",
							  [Switch]),
					    none, 4096, 64,
					    __Levelholiday_groupon274,
					    __Tracesholiday_groupon274,
					    lager_event,
					    __Pidholiday_groupon274);
			   _ -> ok
			 end,
			 util:set_timer(save_env_timer, 60 * 30, save_env),
			 util:set_timer(auto_add_timer, 60 * 15, auto_add),
			 State
		   end;
	       _ ->
		   case Switch of
		     open ->
			 case {whereis(lager_event), whereis(lager_event),
			       lager_config:get({lager_event, loglevel},
						{0, []})}
			     of
			   {undefined, undefined, _} ->
			       fun () -> {error, lager_not_running} end();
			   {undefined, _, _} ->
			       fun () ->
				       {error,
					{sink_not_configured, lager_event}}
			       end();
			   {__Pidholiday_groupon282, _,
			    {__Levelholiday_groupon282,
			     __Tracesholiday_groupon282}}
			       when __Levelholiday_groupon282 band 64 /= 0
				      orelse __Tracesholiday_groupon282 /= [] ->
			       lager:do_log(info,
					    [{module, holiday_groupon},
					     {function, handle_info},
					     {line, 282},
					     {pid, pid_to_list(self())},
					     {node, node()}
					     | lager:md()],
					    io_lib:format("检查团购活动状态:~w to close",
							  [Switch]),
					    none, 4096, 64,
					    __Levelholiday_groupon282,
					    __Tracesholiday_groupon282,
					    lager_event,
					    __Pidholiday_groupon282);
			   _ -> ok
			 end,
			 State#state{switch = close};
		     close ->
			 case {whereis(lager_event), whereis(lager_event),
			       lager_config:get({lager_event, loglevel},
						{0, []})}
			     of
			   {undefined, undefined, _} ->
			       fun () -> {error, lager_not_running} end();
			   {undefined, _, _} ->
			       fun () ->
				       {error,
					{sink_not_configured, lager_event}}
			       end();
			   {__Pidholiday_groupon285, _,
			    {__Levelholiday_groupon285,
			     __Tracesholiday_groupon285}}
			       when __Levelholiday_groupon285 band 64 /= 0
				      orelse __Tracesholiday_groupon285 /= [] ->
			       lager:do_log(info,
					    [{module, holiday_groupon},
					     {function, handle_info},
					     {line, 285},
					     {pid, pid_to_list(self())},
					     {node, node()}
					     | lager:md()],
					    io_lib:format("检查团购活动状态:~w",
							  [Switch]),
					    none, 4096, 64,
					    __Levelholiday_groupon285,
					    __Tracesholiday_groupon285,
					    lager_event,
					    __Pidholiday_groupon285);
			   _ -> ok
			 end,
			 State
		   end
	     end,
    {noreply, NState};
handle_info(cluster_open, State) ->
    case cluster_group:has_main() of
      true ->
	  case cluster_group:is_main() of
	    false ->
		case get_open_holiday() of
		  #holiday{camp_id = CampId} ->
		      EnvInfo = env_info(CampId),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_groupon300, _,
			 {__Levelholiday_groupon300,
			  __Tracesholiday_groupon300}}
			    when __Levelholiday_groupon300 band 64 /= 0 orelse
				   __Tracesholiday_groupon300 /= [] ->
			    lager:do_log(info,
					 [{module, holiday_groupon},
					  {function, handle_info}, {line, 300},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~w】团购活动开启团购，同步数据到主服【~w】",
						       [CampId, EnvInfo]),
					 none, 4096, 64,
					 __Levelholiday_groupon300,
					 __Tracesholiday_groupon300,
					 lager_event, __Pidholiday_groupon300);
			_ -> ok
		      end,
		      cluster_group:cast_main(holiday_groupon, info,
					      [{sync_main_cluster_info, CampId,
						EnvInfo}]),
		      save(CampId, []),
		      {noreply, State};
		  _ -> {noreply, State}
		end;
	    _ -> {noreply, State}
	  end;
      _ -> {noreply, State}
    end;
handle_info({sync_main_cluster_info, CampId, OtherInfo},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_groupon316, _,
       {__Levelholiday_groupon316, __Tracesholiday_groupon316}}
	  when __Levelholiday_groupon316 band 64 /= 0 orelse
		 __Tracesholiday_groupon316 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_groupon}, {function, handle_info},
			{line, 316}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w团购数据同步到主服~w", [CampId, OtherInfo]),
		       none, 4096, 64, __Levelholiday_groupon316,
		       __Tracesholiday_groupon316, lager_event,
		       __Pidholiday_groupon316);
      _ -> ok
    end,
    case cluster_group:is_main() of
      true ->
	  case get_open_holiday() of
	    #holiday{camp_id = CampId} ->
		EnvInfo = env_info(CampId),
		Fun = fun ({Id, BuyCount, Discount}, Acc) ->
			      case lists:keyfind(Id, 1, Acc) of
				{_, OldBuyCount, _} ->
				    NewBuyCount = OldBuyCount + BuyCount,
				    NewDiscount = case [DiscountT
							|| {Goal, DiscountT}
							       <- holiday_groupon_data:discount({CampId,
												 Id}),
							   NewBuyCount >= Goal]
						      of
						    DT = [_ | _] ->
							lists:min(DT);
						    _ -> Discount
						  end,
				    lists:keystore(Id, 1, Acc,
						   {Id, NewBuyCount,
						    NewDiscount});
				_ ->
				    lists:keystore(Id, 1, Acc,
						   {Id, BuyCount, Discount})
			      end
		      end,
		NewEnvInfo = lists:foldl(Fun, EnvInfo, OtherInfo),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_groupon336, _,
		   {__Levelholiday_groupon336, __Tracesholiday_groupon336}}
		      when __Levelholiday_groupon336 band 64 /= 0 orelse
			     __Tracesholiday_groupon336 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_groupon},
				    {function, handle_info}, {line, 336},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("主服同步团购数据，原数据【~w】，新数据【~w】",
						 [EnvInfo, NewEnvInfo]),
				   none, 4096, 64, __Levelholiday_groupon336,
				   __Tracesholiday_groupon336, lager_event,
				   __Pidholiday_groupon336);
		  _ -> ok
		end,
		save(CampId, NewEnvInfo),
		{noreply, State};
	    #holiday{} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_groupon340, _,
		   {__Levelholiday_groupon340, __Tracesholiday_groupon340}}
		      when __Levelholiday_groupon340 band 8 /= 0 orelse
			     __Tracesholiday_groupon340 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_groupon},
				    {function, handle_info}, {line, 340},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "开启了团购活动，却不是同一个活动", none, 4096, 8,
				   __Levelholiday_groupon340,
				   __Tracesholiday_groupon340, lager_event,
				   __Pidholiday_groupon340);
		  _ -> ok
		end,
		{noreply, State};
	    _ -> {noreply, State}
	  end;
      _ -> {noreply, State}
    end;
handle_info(save_env, State = #state{switch = open}) ->
    case get_open_holiday() of
      #holiday{camp_id = CampId} ->
	  EnvInfo = env_info(CampId),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_groupon354, _,
	     {__Levelholiday_groupon354, __Tracesholiday_groupon354}}
		when __Levelholiday_groupon354 band 64 /= 0 orelse
		       __Tracesholiday_groupon354 /= [] ->
		lager:do_log(info,
			     [{module, holiday_groupon},
			      {function, handle_info}, {line, 354},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("当前的团购信息 ~w", [EnvInfo]), none, 4096,
			     64, __Levelholiday_groupon354,
			     __Tracesholiday_groupon354, lager_event,
			     __Pidholiday_groupon354);
	    _ -> ok
	  end,
	  util:set_timer(save_env_timer, 60 * 30, save_env),
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
	    {__Pidholiday_groupon358, _,
	     {__Levelholiday_groupon358, __Tracesholiday_groupon358}}
		when __Levelholiday_groupon358 band 8 /= 0 orelse
		       __Tracesholiday_groupon358 /= [] ->
		lager:do_log(error,
			     [{module, holiday_groupon},
			      {function, handle_info}, {line, 358},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "团购未开启却尝试保存信息，理论上不会进来", none, 4096, 8,
			     __Levelholiday_groupon358,
			     __Tracesholiday_groupon358, lager_event,
			     __Pidholiday_groupon358);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_groupon367, _,
       {__Levelholiday_groupon367, __Tracesholiday_groupon367}}
	  when __Levelholiday_groupon367 band 64 /= 0 orelse
		 __Tracesholiday_groupon367 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_groupon}, {function, terminate},
			{line, 367}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelholiday_groupon367,
		       __Tracesholiday_groupon367, lager_event,
		       __Pidholiday_groupon367);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

reward_info(#holiday{camp_id = CampId, bid = Bid},
	    Role) ->
    {_, GetAimList} = holiday_lib:get_tv_val(CampId, Bid,
					     Role),
    List = cluster_env_info(CampId),
    RewardList = holiday_groupon_data:reward_list(CampId),
    Fun = fun ({Aim, Items, OldPrice, Limit, AllLimit},
	       {AccRebate, Acc}) ->
		  InitDiscount = list_util:keyfind(0,
						   holiday_groupon_data:discount({CampId,
										  Aim}),
						   1000),
		  InitCount = holiday_groupon_data:get_init({CampId,
							     Aim}),
		  {_, BuyCount, Discount} = list_util:keyfind(Aim, 1,
							      List,
							      {Aim, InitCount,
							       InitDiscount}),
		  Price = util:round(OldPrice * (Discount / 1000)),
		  NewLimit = util:if_true(Limit =/= 0, Limit, AllLimit),
		  {AimStatus, Rebate, LimitArgs} = case lists:keyfind(Aim,
								      1,
								      GetAimList)
						       of
						     {Aim, Count, BuyPriceL} ->
							 RebateT =
							     lists:sum([max(0,
									    BuyPrice
									      -
									      Price)
									|| BuyPrice
									       <- BuyPriceL]),
							 {util:if_true(Limit >=
									 Count,
								       2, 0),
							  RebateT,
							  [{6, Count, <<>>},
							   {31, RebateT,
							    <<>>}]};
						     {Aim, DayCount, AllCount,
						      BuyPriceL} ->
							 NewCount =
							     util:if_true(Limit
									    =/=
									    0,
									  DayCount,
									  AllCount),
							 RebateT =
							     lists:sum([max(0,
									    BuyPrice
									      -
									      Price)
									|| BuyPrice
									       <- BuyPriceL]),
							 {util:if_true(NewLimit
									 >=
									 NewCount,
								       2, 0),
							  RebateT,
							  [{6, NewCount, <<>>},
							   {31, RebateT,
							    <<>>}]};
						     _ ->
							 {0, 0,
							  [{6, 0, <<>>},
							   {31, 0, <<>>}]}
						   end,
		  AimExt = [{26, OldPrice, <<>>}, {27, Price, <<>>},
			    {2, NewLimit, <<>>}, {32, BuyCount, <<>>}],
		  ItemValList = format:item_to_val(Items),
		  Data = {Aim,
			  case is_binary(lang:get(<<""/utf8>>)) of
			    false -> list_to_binary(lang:get(<<""/utf8>>));
			    true -> lang:get(<<""/utf8>>)
			  end,
			  AimStatus, ItemValList, AimExt ++ LimitArgs},
		  {AccRebate + Rebate, [Data | Acc]};
	      (Unknow, Acc) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_groupon401, _,
		     {__Levelholiday_groupon401, __Tracesholiday_groupon401}}
			when __Levelholiday_groupon401 band 8 /= 0 orelse
			       __Tracesholiday_groupon401 /= [] ->
			lager:do_log(error,
				     [{module, holiday_groupon},
				      {function, reward_info}, {line, 401},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("[~ts]活动[Bid:~w][CampId:~w]配置有误:~w",
						   [Role#role.name, Bid, CampId,
						    Unknow]),
				     none, 4096, 8, __Levelholiday_groupon401,
				     __Tracesholiday_groupon401, lager_event,
				     __Pidholiday_groupon401);
		    _ -> ok
		  end,
		  Acc
	  end,
    {AccRebate, AimList} = lists:foldl(Fun, {0, []},
				       RewardList),
    {AccRebate, AimList}.

current_discount(CampId, Id) ->
    case cluster_env_info(CampId) of
      List when is_list(List) ->
	  InitDiscount = list_util:keyfind(0,
					   holiday_groupon_data:discount({CampId,
									  Id}),
					   1000),
	  InitCount = holiday_groupon_data:get_init({CampId, Id}),
	  {_, _, Discount} = list_util:keyfind(Id, 1, List,
					       {Id, InitCount, InitDiscount}),
	  Discount;
      _ -> false
    end.

env_info(CampId) ->
    sys_env:get({holiday_groupon, CampId}, []).

save(CampId, Val) ->
    sys_env:save({holiday_groupon, CampId}, Val).

get_open_holiday() ->
    Bids = [3009, 93009, 993009],
    holiday_lib:get_open_holiday(Bids).

cluster_env_info(CampId) ->
    case sys_env:get(group_id) of
      0 -> env_info(CampId);
      _ ->
	  case cluster_group:has_main() of
	    true ->
		case cluster_group:call_main(holiday_groupon, call,
					     [{get_env_info, CampId}])
		    of
		  L when is_list(L) -> L;
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
			{__Pidholiday_groupon444, _,
			 {__Levelholiday_groupon444,
			  __Tracesholiday_groupon444}}
			    when __Levelholiday_groupon444 band 8 /= 0 orelse
				   __Tracesholiday_groupon444 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_groupon},
					  {function, cluster_env_info},
					  {line, 444},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 "无法跨服获取团购数据", none, 4096, 8,
					 __Levelholiday_groupon444,
					 __Tracesholiday_groupon444,
					 lager_event, __Pidholiday_groupon444);
			_ -> ok
		      end,
		      false
		end;
	    _ -> env_info(CampId)
	  end
    end.

add(Id) ->
    case sys_env:get(group_id) of
      0 -> info({add, Id});
      _ ->
	  case cluster_group:has_main() of
	    true ->
		cluster_group:cast_main(holiday_groupon, info,
					[{add, Id}]);
	    _ -> info({add, Id})
	  end
    end.

calc_auto_rate([], _, _) -> 1000;
calc_auto_rate([{MinCountRate, MaxCountRate,
		 AutoAddRate}
		| Other],
	       BuyCount, MaxCount) ->
    if BuyCount >= MaxCount * MinCountRate / 1000 andalso
	 BuyCount =< MaxCount * MaxCountRate / 1000 ->
	   AutoAddRate;
       true -> calc_auto_rate(Other, BuyCount, MaxCount)
    end.


