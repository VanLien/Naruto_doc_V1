-file("src/mod/holiday_return/holiday_return_sign.erl",
      1).

-module(holiday_return_sign).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{holiday_return_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_feat,
		 [ver, quest_list, period, extra, old_data]},
		{m_holiday_return,
		 [ver, period, start_time, end_time, is_buy,
		  exchange_day_list, exchange_buy_list,
		  return_discount_buy_list, bind_code, bind_end_time,
		  bind_roleid, reward_list, old_data, bind_power,
		  bind_charge, partner_half]},
		{m_holiday_return_sign, [ver, status_list, login_day]},
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

-export([login/1, info/1, reward/2, finish_reward/1,
	 zero_flush/1, init/0, is_all_gain/1, is_all_gain/2]).

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

-file("src/mod/holiday_return/holiday_return_sign.erl",
      18).

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

-file("src/mod/holiday_return/holiday_return_sign.erl",
      19).

-file("inc/holiday_return.hrl", 1).

-record(m_holiday_return_sign,
	{ver = 2, status_list = [], login_day = 0}).

-record(m_holiday_return,
	{ver = 3, period = 0, start_time = 0, end_time = 0,
	 is_buy = 0, exchange_day_list = [],
	 exchange_buy_list = [], return_discount_buy_list = [],
	 bind_code = 0, bind_end_time = 0,
	 bind_roleid = {0, <<>>}, reward_list = [],
	 old_data = [], bind_power = 0, bind_charge = 0,
	 partner_half = []}).

-record(m_holiday_return_feat,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 period = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(holiday_return_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/holiday_return/holiday_return_sign.erl",
      20).

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

-file("src/mod/holiday_return/holiday_return_sign.erl",
      21).

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

-file("src/mod/holiday_return/holiday_return_sign.erl",
      22).

-spec init() -> #m_holiday_return_sign{}.

init() -> #m_holiday_return_sign{}.

-spec login(#role{}) -> #role{}.

login(Role = #role{m_holiday_return_sign =
		       #m_holiday_return_sign{login_day = LoginDay}}) ->
    case holiday_return:check_open(Role) of
      {ok, _} ->
	  MaxDay = holiday_return_data:max_day(),
	  case LoginDay >= MaxDay of
	    true ->
		case is_all_gain(Role) of
		  true -> Role;
		  false -> add_status(Role, MaxDay)
		end;
	    false ->
		{NewLoginDay, NRole} = new_login_day(Role, LoginDay),
		add_status(NRole, NewLoginDay)
	  end;
      _ -> Role
    end.

new_login_day(Role, LoginDay) ->
    case var:get_var(Role, day, 88, 0) of
      0 ->
	  NRole = var:set_var(Role, day, 88, 1),
	  {LoginDay + 1, NRole};
      _ -> {LoginDay, Role}
    end.

-spec zero_flush(#role{}) -> #role{}.

zero_flush(Role = #role{m_holiday_return_sign =
			    #m_holiday_return_sign{login_day = LoginDay}}) ->
    case holiday_return:check_open(Role) of
      {ok, _} ->
	  MaxDay = holiday_return_data:max_day(),
	  case LoginDay >= MaxDay of
	    false ->
		{NewLoginDay, NRole} = new_login_day(Role, LoginDay),
		NewRole = add_status(NRole, NewLoginDay),
		push_status(NewRole),
		NewRole;
	    true -> Role
	  end;
      _ -> Role
    end.

-spec info(#role{}) -> [{Day :: integer(),
			 Status :: integer()}].

info(#role{m_holiday_return_sign =
	       #m_holiday_return_sign{status_list = StatusList}}) ->
    StatusList.

-spec reward(#role{}, Day :: integer()) -> {ok,
					    binary(), #role{}} |
					   {false, binary()}.

reward(Role = #role{m_holiday_return_sign =
			#m_holiday_return_sign{status_list = StatusList}},
       Day) ->
    case holiday_return:check_open(Role) of
      {ok, _} ->
	  case holiday_return_data:get(Day) of
	    #{rewards := Rewards} ->
		case lists:keyfind(Day, 1, StatusList) of
		  {Day, 2} ->
		      Gains = format:val_to_gain(Rewards,
						 holiday_return_sign),
		      case role_gain:do_notice(Role, Gains) of
			{ok, GainRole} ->
			    NewStatusList = lists:keystore(Day, 1, StatusList,
							   {Day, 3}),
			    NewRole = set_status_list(GainRole, NewStatusList),
			    log:log_gain(Gains, Role, NewRole,
					 lang:get(<<"回归活动_回归签到"/utf8>>),
					 util:fbin("领取回归签到奖励:~w", [Day])),
			    {ok, <<>>, NewRole};
			{false, #gain{msg = Msg}} -> {false, Msg};
			_ -> {false, lang:get(<<"无法获取奖励"/utf8>>)}
		      end;
		  {Day, 3} -> {false, lang:get(<<"您已领取过此天数的奖励"/utf8>>)};
		  _ -> {false, lang:get(<<"未达到领取奖励的相应登录天数"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"没有可以领取的天数奖励"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec finish_reward(#role{}) -> #role{}.

finish_reward(Role = #role{m_holiday_return_sign =
			       MSign = #m_holiday_return_sign{status_list =
								  StatusList}}) ->
    case holiday_return:check_open(Role) of
      {ok, _} -> Role;
      _ ->
	  case is_all_gain(Role) of
	    true -> Role;
	    false ->
		{Rewards, NewStatusList} = get_all_gain(StatusList),
		NRole = Role#role{m_holiday_return_sign =
				      MSign#m_holiday_return_sign{status_list =
								      NewStatusList}},
		{Assets, Items} = format:split_assets_items(Rewards),
		{ok, NewRole} = mail:add(NRole,
					 {util:fbin(lang:get(<<"~ts奖励补发"/utf8>>),
						    ["回归签到"]),
					  color:msg(lang:get(<<"冒险者大人：\n这是您在~ts活动中未领取的奖励。请注意查收"/utf8>>),
						    [{green,
						      lang:get(<<"回归签到"/utf8>>)}]),
					  Assets, Items,
					  lang:get(<<"回归签到奖励自动发放"/utf8>>),
					  86400 + date:unixtime()}),
		NewRole
	  end
    end.

get_all_gain(StatusList) ->
    List = holiday_return_data:days(),
    get_all_gain(List, StatusList, []).

get_all_gain([], StatusList, Rewards) ->
    {Rewards, StatusList};
get_all_gain([Day | Rest], StatusList, Rewards) ->
    case lists:keyfind(Day, 1, StatusList) of
      {Day, 2} ->
	  case holiday_return_data:get(Day) of
	    #{rewards := Reward} ->
		NewRewards = Reward ++ Rewards,
		NewStatusList = lists:keyreplace(Day, 1, StatusList,
						 {Day, 3}),
		get_all_gain(Rest, NewStatusList, NewRewards);
	    _ -> get_all_gain(Rest, StatusList, Rewards)
	  end;
      _ -> get_all_gain(Rest, StatusList, Rewards)
    end.

push_status(Role = #role{m_holiday_return_sign =
			     #m_holiday_return_sign{status_list =
							StatusList}}) ->
    role:pack_send(Role, 25915, {StatusList}), ok.

set_status_list(Role = #role{m_holiday_return_sign =
				 MLoginDays},
		NStatusList) ->
    NewMLoginDays =
	MLoginDays#m_holiday_return_sign{status_list =
					     NStatusList},
    Role#role{m_holiday_return_sign = NewMLoginDays}.

is_all_gain(#role{m_holiday_return_sign =
		      #m_holiday_return_sign{status_list = StatusList}}) ->
    List = holiday_return_data:days(),
    is_all_gain(List, StatusList).

is_all_gain(_List, []) -> true;
is_all_gain([], _StatusList) -> true;
is_all_gain([Day | Rest], StatusList) ->
    case lists:keyfind(Day, 1, StatusList) of
      {Day, 2} -> false;
      _ -> is_all_gain(Rest, StatusList)
    end.

add_status(Role = #role{m_holiday_return_sign =
			    MLoginDays = #m_holiday_return_sign{status_list =
								    StatusList}},
	   NewLoginDay) ->
    MaxStatusDay = case lists:reverse(lists:keysort(1,
						    StatusList))
		       of
		     [{MaxDay, _} | _] -> MaxDay;
		     _ -> 0
		   end,
    NewStatusList = do_add_status(StatusList, MaxStatusDay,
				  NewLoginDay, Role#role.name),
    NewMLoginDays =
	MLoginDays#m_holiday_return_sign{status_list =
					     NewStatusList,
					 login_day = NewLoginDay},
    Role#role{m_holiday_return_sign = NewMLoginDays}.

do_add_status(StatusList, MaxStatusDay, NewLoginDay,
	      _RoleName)
    when MaxStatusDay >= NewLoginDay ->
    StatusList;
do_add_status(StatusList, MaxStatusDay, NewLoginDay,
	      RoleName) ->
    NextStatusDay = MaxStatusDay + 1,
    case holiday_return_data:get(NextStatusDay) of
      #{} ->
	  case lists:keyfind(NextStatusDay, 1, StatusList) of
	    false ->
		NewStatusList = [{NextStatusDay, 2} | StatusList],
		do_add_status(NewStatusList, NextStatusDay, NewLoginDay,
			      RoleName);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_return_sign207, _,
		   {__Levelholiday_return_sign207,
		    __Tracesholiday_return_sign207}}
		      when __Levelholiday_return_sign207 band 8 /= 0 orelse
			     __Tracesholiday_return_sign207 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_return_sign},
				    {function, do_add_status}, {line, 207},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts已有回归签到奖励记录:~w",
						 [RoleName, Err]),
				   none, 4096, 8, __Levelholiday_return_sign207,
				   __Tracesholiday_return_sign207, lager_event,
				   __Pidholiday_return_sign207);
		  _ -> ok
		end,
		do_add_status(StatusList, NextStatusDay, NewLoginDay,
			      RoleName)
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_return_sign211, _,
	     {__Levelholiday_return_sign211,
	      __Tracesholiday_return_sign211}}
		when __Levelholiday_return_sign211 band 8 /= 0 orelse
		       __Tracesholiday_return_sign211 /= [] ->
		lager:do_log(error,
			     [{module, holiday_return_sign},
			      {function, do_add_status}, {line, 211},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts没有对应的回归签到奖励:~w",
					   [RoleName, NextStatusDay]),
			     none, 4096, 8, __Levelholiday_return_sign211,
			     __Tracesholiday_return_sign211, lager_event,
			     __Pidholiday_return_sign211);
	    _ -> ok
	  end,
	  do_add_status(StatusList, NextStatusDay, NewLoginDay,
			RoleName)
    end.


