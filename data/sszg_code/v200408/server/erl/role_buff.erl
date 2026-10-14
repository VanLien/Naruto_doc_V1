-file("src/mod/role/role_buff.erl", 1).

-module(role_buff).

-lager_records([{s_timer, [ref, timers]},
		{rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{buff_data,
		 [bid, name, type, time_type, group, effect, seconds]},
		{role_buff, [ver, buff_list]},
		{role_buff_data, [bid, group, effect, end_time]}]).

-file("inc/buff.hrl", 1).

-record(role_buff_data,
	{bid, group, effect = [], end_time}).

-record(role_buff,
	{ver = 1, buff_list = []  :: [#role_buff_data{}]}).

-record(buff_data,
	{bid, name, type, time_type, group, effect = [],
	 seconds}).

-file("src/mod/role/role_buff.erl", 12).

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

-file("src/mod/role/role_buff.erl", 13).

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

-file("src/mod/role/role_buff.erl", 14).

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

-file("src/mod/role/role_buff.erl", 15).

-export([init/0, login/1, push/1, try_add_buff/2,
	 add_buff/2, del_buff/2, has_buff/2, find_buff/2,
	 buff_timeout/2, coin_times/1, exp_times/1,
	 sum_buff_attr/1]).

init() -> #role_buff{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_buff =
		       RB = #role_buff{buff_list = BuffList}}) ->
    Now = date:unixtime(),
    NewBuffList = [Buff
		   || Buff = #role_buff_data{end_time = EndTime}
			  <- BuffList,
		      EndTime > Now],
    NRole = Role#role{m_buff =
			  RB#role_buff{buff_list = NewBuffList}},
    {ok, start_buff_timer(NRole, NewBuffList)}.

-spec push(#role{}) -> ok.

push(Role = #role{m_buff =
		      #role_buff{buff_list = BuffList}}) ->
    Now = date:unixtime(),
    BuffReply = [{Bid, EndTime - Now}
		 || #role_buff_data{bid = Bid, end_time = EndTime}
			<- BuffList],
    role:pack_send(Role, 16801, {BuffReply}),
    ok.

-spec try_add_buff(#role{}, integer()) -> {ok, #role{}}.

try_add_buff(Role, BuffId) ->
    case add_buff(Role, BuffId) of
      {ok, NRole} -> {ok, NRole};
      _ -> {ok, Role}
    end.

-spec add_buff(#role{}, integer()) -> {ok, #role{}} |
				      {false, binary()}.

add_buff(Role, Bid) when is_integer(Bid) ->
    case buff_data:get_buff(Bid) of
      #buff_data{} = BuffData -> add_buff(Role, BuffData);
      _ -> {false, lang:get(<<"配置数据不存在"/utf8>>)}
    end;
add_buff(Role, BuffData) ->
    case do_add_buff(Role, BuffData) of
      {ok, NewR} -> push(NewR), {ok, NewR};
      {false, Reason} -> {false, Reason}
    end.

-spec del_buff(#role{}, pos_integer()) -> {ok, #role{}}.

del_buff(Role = #role{m_buff =
			  RB = #role_buff{buff_list = BuffList}},
	 BuffId) ->
    case lists:keyfind(BuffId, #role_buff_data.bid,
		       BuffList)
	of
      false -> {ok, Role};
      _Buff ->
	  NRole = Role#role{m_buff =
				RB#role_buff{buff_list =
						 lists:keydelete(BuffId,
								 #role_buff_data.bid,
								 BuffList)}},
	  notify_buff_remove(NRole, BuffId),
	  {ok, NRole}
    end.

-spec has_buff(#role{}, pos_integer()) -> true | false.

has_buff(#role{m_buff =
		   #role_buff{buff_list = BuffList}},
	 BuffId) ->
    lists:keymember(BuffId, #role_buff_data.bid, BuffList).

-spec find_buff(#role{}, pos_integer()) -> false |
					   #role_buff_data{}.

find_buff(#role{m_buff =
		    #role_buff{buff_list = BuffList}},
	  BuffId) ->
    lists:keyfind(BuffId, #role_buff_data.bid, BuffList).

-spec buff_timeout(#role{},
		   BuffId :: pos_integer()) -> {ok, #role{}}.

buff_timeout(Role = #role{m_buff =
			      RB = #role_buff{buff_list = BuffList}},
	     BuffId) ->
    case lists:keyfind(BuffId, #role_buff_data.bid,
		       BuffList)
	of
      #role_buff_data{} ->
	  NewRole = Role#role{m_buff =
				  RB#role_buff{buff_list =
						   lists:keydelete(BuffId,
								   #role_buff_data.bid,
								   BuffList)}},
	  notify_buff_remove(NewRole, BuffId),
	  {ok, NewRole};
      false -> {ok, Role}
    end.

-spec coin_times(#role{}) -> integer().

coin_times(Role) ->
    case has_double(Role, coin) of
      false -> 1;
      {true, N} -> N
    end.

exp_times(Role) ->
    case has_double(Role, exp) of
      false -> 1;
      {true, N} -> N
    end.

has_double(#role{m_buff =
		     #role_buff{buff_list = BuffList}},
	   Type) ->
    AllEffects = lists:flatten([Effect
				|| #role_buff_data{effect = Effect}
				       <- BuffList]),
    case lists:sum([N
		    || {EffectType, N} <- AllEffects, EffectType =:= Type])
	of
      0 -> false;
      Sum -> {true, Sum}
    end.

do_add_buff(Role = #role{m_buff =
			     RB = #role_buff{buff_list = BuffList}},
	    BuffData = #buff_data{bid = Bid1, group = Group,
				  seconds = Seconds, type = Type}) ->
    case lists:keyfind(Group, #role_buff_data.group,
		       BuffList)
	of
      false ->
	  RoleBuffData = to_role_buff_data(BuffData),
	  NewRole = Role#role{m_buff =
				  RB#role_buff{buff_list =
						   [RoleBuffData | BuffList]}},
	  NewRole1 = start_buff_timer(NewRole, RoleBuffData),
	  {ok, NewRole1};
      #role_buff_data{bid = Bid2} when Bid2 > Bid1 ->
	  {false, lang:get(<<"更高级BUFF已存在"/utf8>>)};
      #role_buff_data{} when Type =:= replace ->
	  NewRoleBuffData = to_role_buff_data(BuffData),
	  NewList = lists:keyreplace(Group, #role_buff_data.group,
				     BuffList, NewRoleBuffData),
	  NewRole = Role#role{m_buff =
				  RB#role_buff{buff_list = NewList}},
	  NewRole1 = start_buff_timer(NewRole, NewRoleBuffData),
	  {ok, NewRole1};
      #role_buff_data{end_time = EndTime} = RoleBuffData ->
	  NewRoleBuffData = RoleBuffData#role_buff_data{end_time =
							    EndTime + Seconds},
	  NewList = lists:keyreplace(Group, #role_buff_data.group,
				     BuffList, NewRoleBuffData),
	  NewRole = Role#role{m_buff =
				  RB#role_buff{buff_list = NewList}},
	  NewRole1 = start_buff_timer(NewRole, NewRoleBuffData),
	  {ok, NewRole1}
    end.

to_role_buff_data(BuffData) ->
    #role_buff_data{bid = BuffData#buff_data.bid,
		    group = BuffData#buff_data.group,
		    effect = BuffData#buff_data.effect,
		    end_time = gen_end_time(BuffData#buff_data.seconds)}.

gen_end_time(0) -> 0;
gen_end_time(T) -> date:unixtime() + T.

start_buff_timer(Role, []) -> Role;
start_buff_timer(Role, [I | T]) ->
    NRole = start_buff_timer(Role, I),
    start_buff_timer(NRole, T);
start_buff_timer(Role, #role_buff_data{end_time = 0}) ->
    Role;
start_buff_timer(Role,
		 #role_buff_data{bid = BuffId, group = Group,
				 end_time = EndTime}) ->
    TimeOut = max(0, EndTime - date:unixtime()) * 1000,
    role_timer:set(#timer{id = {role_buff, Group},
			  timeout = TimeOut, m = role_buff, f = buff_timeout,
			  a = [BuffId]},
		   Role).

notify_buff_remove(Role, BuffBid) ->
    role:pack_send(Role, 16802, {BuffBid}).

sum_buff_attr(0) -> [];
sum_buff_attr(BuffIds) when is_list(BuffIds) ->
    lists:flatten([sum_buff_attr(BuffId)
		   || BuffId <- BuffIds]);
sum_buff_attr({BuffId, N}) ->
    #buff_data{effect = Effect} =
	buff_data:get_buff(BuffId),
    [{AttrName, Val * N}
     || {AttrName, Val} <- Effect,
	attr_data:attr_atom2id(AttrName) =/= 0];
sum_buff_attr(BuffId) ->
    #buff_data{effect = Effect} =
	buff_data:get_buff(BuffId),
    [{AttrName, Val}
     || {AttrName, Val} <- Effect,
	attr_data:attr_atom2id(AttrName) =/= 0].


