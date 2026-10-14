-file("src/mod/role/role_auth.erl", 1).

-module(role_auth).

-lager_records([{state, []},
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{role_auth_adult,
		 [platform, name, can_charge, is_nonage, charge_limit,
		  is_wallow, down_sec, is_show_phone, show_info, is_mail,
		  is_mid_exp, is_lev_60]},
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

-behaviour(gen_server).

-export([set_adult_timer/2, gm_set_adult_timer/1,
	 async_apply/2, start_link/0, reload_adult_cfg/0,
	 request_sdk_adult/1, request_9377_sdk_adult/1,
	 set_adult/2, get_desc_exp/1, login/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/role/role_auth.erl", 37).

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

-file("src/mod/role/role_auth.erl", 38).

-file("inc/role_auth.hrl", 1).

-record(role_auth_adult,
	{platform = <<>>, name = <<>>, can_charge = 1,
	 is_nonage = 0, charge_limit = 5000, is_wallow = 0,
	 down_sec = 10800, is_show_phone = 0, show_info = <<>>,
	 is_mail = 0, is_mid_exp = 0, is_lev_60 = 0}).

-file("src/mod/role/role_auth.erl", 39).

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

-file("src/mod/role/role_auth.erl", 40).

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

-file("src/mod/role/role_auth.erl", 41).

-file("inc/vip.hrl", 1).

-record(m_vip,
	{ver = 2, lev = 0, lev_reward = [], tired_charge = []}).

-record(vip_data,
	{lev = 0  :: non_neg_integer(),
	 gold = 0  :: non_neg_integer(), price = []  :: list(),
	 old_price = []  :: list(), items = []  :: list(),
	 ext_reward = []}).

-record(vip_effect_data,
	{name = <<>>  :: bitstring(),
	 val = 0  :: non_neg_integer()}).

-file("src/mod/role/role_auth.erl", 42).

-file("inc/log.hrl", 1).

-file("src/mod/role/role_auth.erl", 43).

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

-file("src/mod/role/role_auth.erl", 44).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/mod/role/role_auth.erl", 45).

-record(state, {}).

-export([gm_apply/2]).

gm_apply(Role, 1) ->
    Msg = adult_stop_msg(1), adult_frame(Msg);
gm_apply(Role, 2) ->
    Msg = adult_stop_msg(2), adult_frame(Msg);
gm_apply(Role, 3) ->
    Msg = adult_stop_msg(3), adult_frame(Msg);
gm_apply(Role, 4) ->
    Msg = adult_stop_msg(4), adult_frame(Msg);
gm_apply(Role, 5) ->
    Msg = adult_stop_msg(5), adult_frame(Msg);
gm_apply(_Role, _Code) -> ok.

login(Role = #role{m_vip = #m_vip{lev = VipLev}})
    when VipLev >= 8 ->
    {ok, Role};
login(Role = #role{platform = PlatForm})
    when PlatForm =/= <<"symlf">> andalso
	   PlatForm =/= <<"release2">> andalso
	     PlatForm =/= <<"dev">> ->
    {ok, Role};
login(Role) -> {ok, Role}.

check_channel(#role{reg_channel = RegChannel}) ->
    case RegChannel of
      <<"16_", _/binary>> -> true;
      <<"47_", _/binary>> -> true;
      <<"72_", _/binary>> -> true;
      <<"syios_", _/binary>> -> true;
      <<"symix_", _/binary>> -> true;
      <<"symix2_", _/binary>> -> true;
      <<"demo">> -> true;
      <<"release2">> -> true;
      _ -> false
    end.

reload_adult_cfg() ->
    gen_server:cast(role_auth, reload_adult_cfg), ok.

gm_set_adult_timer(Role) ->
    case get(role_auth_arge) of
      -1 -> set_adult_timer(Role, -1);
      _ -> {ok, Role}
    end.

set_adult_timer(Role = #role{m_vip =
				 #m_vip{lev = VipLev}},
		_)
    when VipLev >= 8 ->
    {ok, Role};
set_adult_timer(Role = #role{platform = PlatForm}, _)
    when PlatForm == <<"icebird">> orelse
	   PlatForm == <<"tanwan">> ->
    {ok, Role};
set_adult_timer(RoleT = #role{account = Account,
			      lev = Lev, platform = PlatForm},
		Arge) ->
    put(role_auth_arge, Arge),
    case ip_mgr:is_white_acc(Account) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_auth178, _,
	     {__Levelrole_auth178, __Tracesrole_auth178}}
		when __Levelrole_auth178 band 64 /= 0 orelse
		       __Tracesrole_auth178 /= [] ->
		lager:do_log(info,
			     [{module, role_auth}, {function, set_adult_timer},
			      {line, 178}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("防沉迷设置年龄:~w", [Arge]), none, 4096,
			     64, __Levelrole_auth178, __Tracesrole_auth178,
			     lager_event, __Pidrole_auth178);
	    _ -> ok
	  end;
      _ -> skip
    end,
    Sid = sys_lib:srv_id(),
    Role = role_auth_visitors:check_arge(RoleT, Arge),
    case ip_mgr:is_white_acc(Account) orelse
	   PlatForm == <<"release2">> orelse
	     PlatForm == <<"dev">> orelse
	       Sid == <<"symlf_1">> orelse
		 PlatForm == <<"symlf">> orelse
		   PlatForm == <<"symix">> orelse PlatForm == <<"symix2">>
	of
      true ->
	  case adult_cfg() of
	    {ok,
	     AdultCfg = #role_auth_adult{is_wallow = WallowFlag,
					 down_sec = DownSec,
					 is_mid_exp = ExpFlag,
					 is_lev_60 = LevLimit}}
		when WallowFlag =:= 1 orelse ExpFlag =:= 1 ->
		case LevLimit =:= 1 andalso Lev > 60 of
		  false ->
		      case get_adult(Role, Arge) of
			{ok, 0} ->
			    case is_limit_time() of
			      true ->
				  Timer1 = #timer{id =
						      role_auth_adult_limit_time,
						  timeout = 1000, times = 1,
						  m = role_auth,
						  f = async_apply,
						  a = [adult_limit_time]},
				  Role1 = role_timer:add(Timer1, Role),
				  {ok, Role1};
			      _ ->
				  OnlineSec = var:day_online_time(Role),
				  RemainT = min(DownSec - OnlineSec,
						date:next_diff({22, 0, 0})),
				  Timer1 = #timer{id = role_auth_adult_notice,
						  timeout =
						      max(1, RemainT - 1800) *
							1000,
						  times = 1, m = role_auth,
						  f = async_apply,
						  a =
						      [{adult_notice, not_auth,
							WallowFlag, ExpFlag}]},
				  Role1 = role_timer:add(Timer1, Role),
				  RemainT1 = max(RemainT, 0),
				  TimeOut1 = RemainT1 * 1000,
				  Now = date:unixtime(),
				  NRole = case WallowFlag of
					    1 ->
						Timer2 = #timer{id =
								    role_auth_adult_kick,
								timeout =
								    TimeOut1,
								times = 1,
								m = role_auth,
								f = async_apply,
								a =
								    [adult_kick]},
						case {whereis(lager_event),
						      whereis(lager_event),
						      lager_config:get({lager_event,
									loglevel},
								       {0, []})}
						    of
						  {undefined, undefined, _} ->
						      fun () ->
							      {error,
							       lager_not_running}
						      end();
						  {undefined, _, _} ->
						      fun () ->
							      {error,
							       {sink_not_configured,
								lager_event}}
						      end();
						  {__Pidrole_auth212, _,
						   {__Levelrole_auth212,
						    __Tracesrole_auth212}}
						      when __Levelrole_auth212
							     band 128
							     /= 0
							     orelse
							     __Tracesrole_auth212
							       /= [] ->
						      lager:do_log(debug,
								   [{module,
								     role_auth},
								    {function,
								     set_adult_timer},
								    {line, 212},
								    {pid,
								     pid_to_list(self())},
								    {node,
								     node()}
								    | lager:md()],
								   io_lib:format("[~ts]角色未进行实名认证，当天在线时长:~w秒，认证提示：~wms，下线:~wms",
										 [Role#role.name,
										  OnlineSec,
										  (RemainT
										     -
										     1800)
										    *
										    1000,
										  TimeOut1]),
								   none, 4096,
								   128,
								   __Levelrole_auth212,
								   __Tracesrole_auth212,
								   lager_event,
								   __Pidrole_auth212);
						  _ -> ok
						end,
						push_auth_adult(Role1, 0,
								Now + RemainT1,
								AdultCfg),
						role_timer:add(Timer2, Role1);
					    _ ->
						case {whereis(lager_event),
						      whereis(lager_event),
						      lager_config:get({lager_event,
									loglevel},
								       {0, []})}
						    of
						  {undefined, undefined, _} ->
						      fun () ->
							      {error,
							       lager_not_running}
						      end();
						  {undefined, _, _} ->
						      fun () ->
							      {error,
							       {sink_not_configured,
								lager_event}}
						      end();
						  {__Pidrole_auth216, _,
						   {__Levelrole_auth216,
						    __Tracesrole_auth216}}
						      when __Levelrole_auth216
							     band 128
							     /= 0
							     orelse
							     __Tracesrole_auth216
							       /= [] ->
						      lager:do_log(debug,
								   [{module,
								     role_auth},
								    {function,
								     set_adult_timer},
								    {line, 216},
								    {pid,
								     pid_to_list(self())},
								    {node,
								     node()}
								    | lager:md()],
								   io_lib:format("[~ts]角色未进行实名认证，当天在线时长:~w秒，认证提示：~w",
										 [Role#role.name,
										  OnlineSec,
										  (RemainT
										     -
										     1800)
										    *
										    1000]),
								   none, 4096,
								   128,
								   __Levelrole_auth216,
								   __Tracesrole_auth216,
								   lager_event,
								   __Pidrole_auth216);
						  _ -> ok
						end,
						push_auth_adult(Role1, 0,
								Now + RemainT1,
								AdultCfg),
						Role1
					  end,
				  {ok, NRole}
			    end;
			{ok, 1} ->
			    case is_limit_time() of
			      true ->
				  Timer1 = #timer{id =
						      role_auth_adult_limit_time,
						  timeout = 1000, times = 1,
						  m = role_auth,
						  f = async_apply,
						  a = [adult_limit_time]},
				  Role1 = role_timer:add(Timer1, Role),
				  {ok, Role1};
			      _ ->
				  OnlineSec = var:day_online_time(Role),
				  RemainT = min(DownSec - OnlineSec,
						date:next_diff({22, 0, 0})),
				  Role1 = case RemainT > 1800 of
					    true ->
						Timer1 = #timer{id =
								    role_auth_adult_notice,
								timeout =
								    max(1,
									RemainT
									  -
									  1800)
								      * 1000,
								times = 1,
								m = role_auth,
								f = async_apply,
								a =
								    [{adult_notice,
								      not_auth,
								      WallowFlag,
								      ExpFlag}]},
						role_timer:add(Timer1, Role);
					    _ -> Role
					  end,
				  RemainT1 = max(RemainT, 0),
				  TimeOut1 = RemainT1 * 1000,
				  Now = date:unixtime(),
				  NRole = case WallowFlag of
					    1 ->
						Timer2 = #timer{id =
								    role_auth_adult_kick,
								timeout =
								    TimeOut1,
								times = 1,
								m = role_auth,
								f = async_apply,
								a =
								    [adult_kick]},
						case {whereis(lager_event),
						      whereis(lager_event),
						      lager_config:get({lager_event,
									loglevel},
								       {0, []})}
						    of
						  {undefined, undefined, _} ->
						      fun () ->
							      {error,
							       lager_not_running}
						      end();
						  {undefined, _, _} ->
						      fun () ->
							      {error,
							       {sink_not_configured,
								lager_event}}
						      end();
						  {__Pidrole_auth245, _,
						   {__Levelrole_auth245,
						    __Tracesrole_auth245}}
						      when __Levelrole_auth245
							     band 128
							     /= 0
							     orelse
							     __Tracesrole_auth245
							       /= [] ->
						      lager:do_log(debug,
								   [{module,
								     role_auth},
								    {function,
								     set_adult_timer},
								    {line, 245},
								    {pid,
								     pid_to_list(self())},
								    {node,
								     node()}
								    | lager:md()],
								   io_lib:format("[~ts]角色未进行实名认证，当天在线时长:~w秒，认证提示：~wms，下线:~wms",
										 [Role#role.name,
										  OnlineSec,
										  (RemainT
										     -
										     1800)
										    *
										    1000,
										  TimeOut1]),
								   none, 4096,
								   128,
								   __Levelrole_auth245,
								   __Tracesrole_auth245,
								   lager_event,
								   __Pidrole_auth245);
						  _ -> ok
						end,
						push_auth_adult(Role1, 0,
								Now + RemainT1,
								AdultCfg),
						role_timer:add(Timer2, Role1);
					    _ ->
						case {whereis(lager_event),
						      whereis(lager_event),
						      lager_config:get({lager_event,
									loglevel},
								       {0, []})}
						    of
						  {undefined, undefined, _} ->
						      fun () ->
							      {error,
							       lager_not_running}
						      end();
						  {undefined, _, _} ->
						      fun () ->
							      {error,
							       {sink_not_configured,
								lager_event}}
						      end();
						  {__Pidrole_auth249, _,
						   {__Levelrole_auth249,
						    __Tracesrole_auth249}}
						      when __Levelrole_auth249
							     band 128
							     /= 0
							     orelse
							     __Tracesrole_auth249
							       /= [] ->
						      lager:do_log(debug,
								   [{module,
								     role_auth},
								    {function,
								     set_adult_timer},
								    {line, 249},
								    {pid,
								     pid_to_list(self())},
								    {node,
								     node()}
								    | lager:md()],
								   io_lib:format("[~ts]角色未进行实名认证，当天在线时长:~w秒，认证提示：~w",
										 [Role#role.name,
										  OnlineSec,
										  (RemainT
										     -
										     1800)
										    *
										    1000]),
								   none, 4096,
								   128,
								   __Levelrole_auth249,
								   __Tracesrole_auth249,
								   lager_event,
								   __Pidrole_auth249);
						  _ -> ok
						end,
						push_auth_adult(Role1, 0,
								Now + RemainT1,
								AdultCfg),
						Role1
					  end,
				  {ok, NRole}
			    end;
			{ok, 2} ->
			    Role1 = role_timer:del(role_auth_nonage_kick, Role),
			    Role2 = role_timer:del(role_auth_adult_notice,
						   Role1),
			    AdultRole = set_adult(Role2, 2),
			    NewRole = set_desc_exp(AdultRole, 0),
			    push_auth_adult(NewRole, 2, 0, AdultCfg),
			    {ok, NewRole};
			{close, 2} ->
			    Role1 = role_timer:del(role_auth_nonage_kick, Role),
			    Role2 = role_timer:del(role_auth_adult_notice,
						   Role1),
			    NewRole = set_desc_exp(Role2, 0),
			    push_auth_adult(NewRole, 2, 0, AdultCfg),
			    {ok, NewRole};
			_ -> {ok, Role}
		      end;
		  true -> {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

is_limit_time() ->
    Now = date:unixtime(),
    {_, {Hour, _Minu, _}} = date:seconds_to_datetime(Now),
    Hour >= 22 orelse Hour < 8.

async_apply(Role = #role{reg_channel = RegChannel},
	    {adult_notice, NonageFlag, WallowFlag, ExpFlag}) ->
    case var:get_var(Role, other, 3028, 0) of
      Status when Status == 0 orelse Status == 1 ->
	  case NonageFlag of
	    nonage ->
		Msg = lang:get(<<"您已进入疲劳游戏时间，为了您的健康，请尽快下线休息。"/utf8>>),
		adult_frame(Msg);
	    not_auth ->
		Msg = case RegChannel of
			<<"51_1">> ->
			    lang:get(<<"根据国家法规，未成年玩家每天登录时长限制为1.5小时！您已累计在线满1小时，将在半小时后强"
				       "制下线。（若未完成认证，请打开【手机设置-华为帐号-个人信息-实名认证】进行认证，已完成认"
				       "证请重新登录尝试）"/utf8>>);
			_ -> adult_stop_msg(WallowFlag, ExpFlag)
		      end,
		adult_frame(Msg);
	    _ ->
		Msg = adult_stop_msg(WallowFlag, ExpFlag),
		adult_frame(Msg)
	  end,
	  case ExpFlag of
	    1 -> NewRole = set_desc_exp(Role, 1), {ok, NewRole};
	    _ -> ok
	  end;
      _ -> ok
    end;
async_apply(Role = #role{pid = Pid,
			 reg_channel = RegChannel},
	    adult_kick) ->
    case var:get_var(Role, other, 3028, 0) of
      Status when Status == 0 orelse Status == 1 ->
	  Msg = case RegChannel of
		  <<"51_1">> ->
		      lang:get(<<"根据国家法规，未成年玩家每天登录时长限制为1.5小时！您已进入不健康游戏时间，请您立即下线"
				 "休息。（若未完成认证，请打开【手机设置-华为帐号-个人信息-实名认证】进行认证，已完成认证"
				 "请重新登录尝试）"/utf8>>);
		  _ ->
		      lang:get(<<"您已进入不健康游戏时间，请您立即下线休息。（根据国家相关法规要求，未成年玩家每天登录时长限"
				 "制为1.5小时）"/utf8>>)
		end,
	  role:stop(async, Pid, Msg);
      _ -> skip
    end,
    ok;
async_apply(Role = #role{pid = Pid,
			 reg_channel = RegChannel},
	    adult_limit_time) ->
    case var:get_var(Role, other, 3028, 0) of
      Status when Status == 0 orelse Status == 1 ->
	  Msg = case RegChannel of
		  <<"51_1">> ->
		      lang:get(<<"根据国家法规，未成年玩家不能在22:00-8:00登录游戏！请注意休息，明天再来哟~（若未"
				 "完成认证，请打开【手机设置-华为帐号-个人信息-实名认证】进行认证，已完成认证请重新登录尝"
				 "试）"/utf8>>);
		  _ ->
		      lang:get(<<"根据国家相关法规要求，未成年玩家不能在22：00-8：00登录游戏！请注意休息，明天再来哟~"/utf8>>)
		end,
	  role:stop(async, Pid, Msg);
      _ -> skip
    end,
    ok;
async_apply(_Role, _) -> ok.

push_auth_adult(Role, Status, EndTime, AdultCfg) ->
    role:pack_send(Role, 10395,
		   {Status, EndTime, AdultCfg}),
    ok.

start_link() ->
    gen_server:start_link({local, role_auth}, role_auth, [],
			  []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_auth359, _,
       {__Levelrole_auth359, __Tracesrole_auth359}}
	  when __Levelrole_auth359 band 64 /= 0 orelse
		 __Tracesrole_auth359 /= [] ->
	  lager:do_log(info,
		       [{module, role_auth}, {function, init}, {line, 359},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("正在启动:[~w]", [role_auth]), none, 4096, 64,
		       __Levelrole_auth359, __Tracesrole_auth359, lager_event,
		       __Pidrole_auth359);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    case catch load_cfg() of
      ok ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_auth363, _,
	     {__Levelrole_auth363, __Tracesrole_auth363}}
		when __Levelrole_auth363 band 64 /= 0 orelse
		       __Tracesrole_auth363 /= [] ->
		lager:do_log(info,
			     [{module, role_auth}, {function, init},
			      {line, 363}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("启动完成:[~w]", [role_auth]), none,
			     4096, 64, __Levelrole_auth363,
			     __Tracesrole_auth363, lager_event,
			     __Pidrole_auth363);
	    _ -> ok
	  end,
	  {ok, #state{}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_auth366, _,
	     {__Levelrole_auth366, __Tracesrole_auth366}}
		when __Levelrole_auth366 band 8 /= 0 orelse
		       __Tracesrole_auth366 /= [] ->
		lager:do_log(error,
			     [{module, role_auth}, {function, init},
			      {line, 366}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("启动失败[Err:~w]", [Err]), none, 4096,
			     8, __Levelrole_auth366, __Tracesrole_auth366,
			     lager_event, __Pidrole_auth366);
	    _ -> ok
	  end,
	  {stop, abnormal}
    end.

handle_call(_Request, _From, State) ->
    {reply, false, State}.

handle_cast(reload_adult_cfg, State) ->
    Ret = load_adult(),
    role_group:apply(world,
		     {role_auth, gm_set_adult_timer, []}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_auth377, _,
       {__Levelrole_auth377, __Tracesrole_auth377}}
	  when __Levelrole_auth377 band 64 /= 0 orelse
		 __Tracesrole_auth377 /= [] ->
	  lager:do_log(info,
		       [{module, role_auth}, {function, handle_cast},
			{line, 377}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("重载防沉迷配置:~w", [Ret]), none, 4096, 64,
		       __Levelrole_auth377, __Tracesrole_auth377, lager_event,
		       __Pidrole_auth377);
      _ -> ok
    end,
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_auth386, _,
       {__Levelrole_auth386, __Tracesrole_auth386}}
	  when __Levelrole_auth386 band 64 /= 0 orelse
		 __Tracesrole_auth386 /= [] ->
	  lager:do_log(info,
		       [{module, role_auth}, {function, terminate},
			{line, 386}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]完成关闭:~w", [role_auth, Reason]), none,
		       4096, 64, __Levelrole_auth386, __Tracesrole_auth386,
		       lager_event, __Pidrole_auth386);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_cfg() -> load_adult(), ok.

load_adult() ->
    DbQueryResult =
	db:get_row("select can_charge, is_nonage, charge_limit, "
		   "is_wallow, down_sec, is_show_phone, "
		   "is_mail, show_info, is_mid_exp, is_lev_60 "
		   "from role_auth_adult where id=1"),
    case DbQueryResult of
      {ok,
       [CanCharge, IsNonage, ChargeLimit, IsWallow, DownSec,
	IsShowPlone, IsMail, ShowInfo, IsMidExp, IsLev60]} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_auth407, _,
	     {__Levelrole_auth407, __Tracesrole_auth407}}
		when __Levelrole_auth407 band 128 /= 0 orelse
		       __Tracesrole_auth407 /= [] ->
		lager:do_log(debug,
			     [{module, role_auth}, {function, load_adult},
			      {line, 407}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载数据成功:~w", [DbQueryResult]), none,
			     4096, 128, __Levelrole_auth407,
			     __Tracesrole_auth407, lager_event,
			     __Pidrole_auth407);
	    _ -> ok
	  end,
	  Cfg = #role_auth_adult{can_charge = CanCharge,
				 is_nonage = IsNonage,
				 charge_limit = ChargeLimit,
				 is_wallow = IsWallow, down_sec = DownSec,
				 is_show_phone = IsShowPlone, is_mail = IsMail,
				 show_info = ShowInfo, is_mid_exp = IsMidExp,
				 is_lev_60 = IsLev60},
	  update_adult_cfg(Cfg);
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_auth411, _,
	     {__Levelrole_auth411, __Tracesrole_auth411}}
		when __Levelrole_auth411 band 8 /= 0 orelse
		       __Tracesrole_auth411 /= [] ->
		lager:do_log(error,
			     [{module, role_auth}, {function, load_adult},
			      {line, 411}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载数据失败:~w", [Err]), none, 4096, 8,
			     __Levelrole_auth411, __Tracesrole_auth411,
			     lager_event, __Pidrole_auth411);
	    _ -> ok
	  end,
	  skip
    end.

adult_cfg() ->
    case sys_env:get(role_auth_env_adult, undefined) of
      undefined -> undefined;
      Obj -> {ok, Obj}
    end.

update_adult_cfg(Cfg = #role_auth_adult{}) ->
    sys_env:set(role_auth_env_adult, Cfg).

set_adult(Role, Flag) ->
    var:set_var(Role, other, 3028, Flag).

get_adult(Role = #role{account = Account,
		       platform = PlatForm},
	  -1) ->
    case PlatForm == <<"symlf">> of
      true ->
	  case var:get_var(Role, other, 3028, 0) of
	    Status when Status == 0 orelse Status == 1 ->
		case adult_cfg() of
		  {ok, #role_auth_adult{is_wallow = 1}} ->
		      case check_channel(Role) of
			true -> request_sdk_adult(Account);
			_ -> {close, 2}
		      end;
		  _ -> {close, 2}
		end;
	    Status -> {ok, Status}
	  end;
      _ -> {close, 2}
    end;
get_adult(Role = #role{}, 0) ->
    case var:get_var(Role, other, 3028, 0) of
      Status when Status == 0 orelse Status == 1 -> {ok, 0};
      Status -> {ok, Status}
    end;
get_adult(Role, Age) ->
    case var:get_var(Role, other, 3028, 0) of
      Status when Status == 0 orelse Status == 1 ->
	  case adult_cfg() of
	    {ok, #role_auth_adult{is_wallow = 1}} when Age >= 18 ->
		{ok, 2};
	    {ok, #role_auth_adult{is_wallow = 1}} ->
		case check_channel(Role) of
		  true -> {ok, 1};
		  _ -> {close, 2}
		end;
	    _ -> {close, 2}
	  end;
      Status -> {ok, Status}
    end.

get_desc_exp(Role) -> var:get_var(Role, day, 94, 1000).

set_desc_exp(Role, Flag) ->
    var:set_var(Role, five, 584, Flag).

get_url() ->
    case sys_env:get(platform) of
      "dev" ->
	  lists:concat(["http://", "test.shiyue.com",
			"/game/card/getAge"]);
      "release2" ->
	  lists:concat(["http://", "test.shiyue.com",
			"/game/card/getAge"]);
      _ ->
	  lists:concat(["https://", "api.shiyue.com",
			"/game/card/getAge"])
    end.

request_9377_sdk_adult(AccountT) ->
    Url =
	lists:concat(["https://wvw.9377.cn/api/getUserInfo.php"]),
    Time = date:unixtime(),
    Account = case AccountT of
		<<"9377_", AccountTemp/binary>> -> AccountTemp;
		_ -> AccountT
	      end,
    Query =
	string_util:to_string(game_lib:to_url_body_str([{username,
							 Account},
							{timestamp, Time}])),
    Sign = string_util:md5(string_util:to_string(Account) ++
			     string_util:to_string(Time) ++
			       "8651cf548ba895bb896d01e106c718ca"),
    List = [{username, Account}, {timestamp, Time},
	    {sign, Sign}],
    Body = game_lib:to_url_body_str(List),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_auth514, _,
       {__Levelrole_auth514, __Tracesrole_auth514}}
	  when __Levelrole_auth514 band 128 /= 0 orelse
		 __Tracesrole_auth514 /= [] ->
	  lager:do_log(debug,
		       [{module, role_auth},
			{function, request_9377_sdk_adult}, {line, 514},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts==>~ts ~p ~p",
				     [Url, Body, Sign, Query]),
		       none, 4096, 128, __Levelrole_auth514,
		       __Tracesrole_auth514, lager_event, __Pidrole_auth514);
      _ -> ok
    end,
    case catch httpc:request(post,
			     {Url, [], "application/x-www-form-urlencoded",
			      Body},
			     [{timeout, 5000}], [])
	of
      {ok, {_StatusLine, _Headers, RtnBody}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_auth517, _,
	     {__Levelrole_auth517, __Tracesrole_auth517}}
		when __Levelrole_auth517 band 128 /= 0 orelse
		       __Tracesrole_auth517 /= [] ->
		lager:do_log(debug,
			     [{module, role_auth},
			      {function, request_9377_sdk_adult}, {line, 517},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]请求防沉迷认证，页面进行认证, Status:~w ~nBody:~w",
					   [Account, _StatusLine, RtnBody]),
			     none, 4096, 128, __Levelrole_auth517,
			     __Tracesrole_auth517, lager_event,
			     __Pidrole_auth517);
	    _ -> ok
	  end,
	  {L} = ejson:decode(RtnBody),
	  {_, Code} = lists:keyfind(<<"status">>, 1, L),
	  {_, Msg} = lists:keyfind(<<"msg">>, 1, L),
	  case Code of
	    0 ->
		{_, {Data}} = lists:keyfind(<<"data">>, 1, L),
		Age = list_util:keyfind(<<"is_real_auth">>, Data, 12),
		case Age == 1 of
		  true -> {ok, 2};
		  _ -> {ok, 1}
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
		  {__Pidrole_auth538, _,
		   {__Levelrole_auth538, __Tracesrole_auth538}}
		      when __Levelrole_auth538 band 8 /= 0 orelse
			     __Tracesrole_auth538 /= [] ->
		      lager:do_log(error,
				   [{module, role_auth},
				    {function, request_9377_sdk_adult},
				    {line, 538}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~w]查验SDK身份认证失败:~w, msg=~ts",
						 [Account, Code, Msg]),
				   none, 4096, 8, __Levelrole_auth538,
				   __Tracesrole_auth538, lager_event,
				   __Pidrole_auth538);
		  _ -> ok
		end,
		{close, 2}
	  end;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_auth542, _,
	     {__Levelrole_auth542, __Tracesrole_auth542}}
		when __Levelrole_auth542 band 8 /= 0 orelse
		       __Tracesrole_auth542 /= [] ->
		lager:do_log(error,
			     [{module, role_auth},
			      {function, request_9377_sdk_adult}, {line, 542},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]请求防沉迷认证失败:~w", [Account, Err]),
			     none, 4096, 8, __Levelrole_auth542,
			     __Tracesrole_auth542, lager_event,
			     __Pidrole_auth542);
	    _ -> ok
	  end,
	  {close, 2}
    end.

request_sdk_adult(Account) ->
    Url = get_url(),
    Time = date:unixtime(),
    Query =
	string_util:to_string(game_lib:to_url_body_str([{account_id,
							 Account},
							{project_id, 11},
							{ts, Time}])),
    Sign = binary_to_list(string_util:sha(Query ++
					    "ZMIUClkQieIL7tElz7VSjVrT")),
    List = [{account_id, Account}, {project_id, 11},
	    {sign, Sign}, {ts, Time}],
    Body = game_lib:to_url_body_str(List),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_auth559, _,
       {__Levelrole_auth559, __Tracesrole_auth559}}
	  when __Levelrole_auth559 band 128 /= 0 orelse
		 __Tracesrole_auth559 /= [] ->
	  lager:do_log(debug,
		       [{module, role_auth}, {function, request_sdk_adult},
			{line, 559}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts==>~ts ~p ~p",
				     [Url, Body, Sign, Query]),
		       none, 4096, 128, __Levelrole_auth559,
		       __Tracesrole_auth559, lager_event, __Pidrole_auth559);
      _ -> ok
    end,
    case catch httpc:request(post,
			     {Url, [], "application/x-www-form-urlencoded",
			      Body},
			     [{timeout, 5000}], [])
	of
      {ok, {_StatusLine, _Headers, RtnBody}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_auth562, _,
	     {__Levelrole_auth562, __Tracesrole_auth562}}
		when __Levelrole_auth562 band 128 /= 0 orelse
		       __Tracesrole_auth562 /= [] ->
		lager:do_log(debug,
			     [{module, role_auth},
			      {function, request_sdk_adult}, {line, 562},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]请求防沉迷认证，页面进行认证, Status:~w ~nBody:~w",
					   [Account, _StatusLine, RtnBody]),
			     none, 4096, 128, __Levelrole_auth562,
			     __Tracesrole_auth562, lager_event,
			     __Pidrole_auth562);
	    _ -> ok
	  end,
	  {L} = ejson:decode(RtnBody),
	  {_, Code} = lists:keyfind(<<"code">>, 1, L),
	  {_, Msg} = lists:keyfind(<<"message">>, 1, L),
	  case Code of
	    1000 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrole_auth568, _,
		   {__Levelrole_auth568, __Tracesrole_auth568}}
		      when __Levelrole_auth568 band 8 /= 0 orelse
			     __Tracesrole_auth568 /= [] ->
		      lager:do_log(error,
				   [{module, role_auth},
				    {function, request_sdk_adult}, {line, 568},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~w]查验SDK身份认证失败:~w, msg=~ts",
						 [Account, Code, Msg]),
				   none, 4096, 8, __Levelrole_auth568,
				   __Tracesrole_auth568, lager_event,
				   __Pidrole_auth568);
		  _ -> ok
		end,
		{close, 2};
	    2209 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrole_auth571, _,
		   {__Levelrole_auth571, __Tracesrole_auth571}}
		      when __Levelrole_auth571 band 8 /= 0 orelse
			     __Tracesrole_auth571 /= [] ->
		      lager:do_log(error,
				   [{module, role_auth},
				    {function, request_sdk_adult}, {line, 571},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~w]查验SDK身份认证失败:~w, msg=~ts",
						 [Account, Code, Msg]),
				   none, 4096, 8, __Levelrole_auth571,
				   __Tracesrole_auth571, lager_event,
				   __Pidrole_auth571);
		  _ -> ok
		end,
		{ok, 0};
	    0 ->
		{_, {Data}} = lists:keyfind(<<"data">>, 1, L),
		Age = list_util:keyfind(<<"age">>, Data, 12),
		case Age >= 18 of
		  true -> {ok, 2};
		  _ -> {ok, 1}
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
		  {__Pidrole_auth584, _,
		   {__Levelrole_auth584, __Tracesrole_auth584}}
		      when __Levelrole_auth584 band 8 /= 0 orelse
			     __Tracesrole_auth584 /= [] ->
		      lager:do_log(error,
				   [{module, role_auth},
				    {function, request_sdk_adult}, {line, 584},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~w]查验SDK身份认证失败:~w, msg=~ts",
						 [Account, Code, Msg]),
				   none, 4096, 8, __Levelrole_auth584,
				   __Tracesrole_auth584, lager_event,
				   __Pidrole_auth584);
		  _ -> ok
		end,
		{close, 2}
	  end;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_auth588, _,
	     {__Levelrole_auth588, __Tracesrole_auth588}}
		when __Levelrole_auth588 band 8 /= 0 orelse
		       __Tracesrole_auth588 /= [] ->
		lager:do_log(error,
			     [{module, role_auth},
			      {function, request_sdk_adult}, {line, 588},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]请求防沉迷认证失败:~w", [Account, Err]),
			     none, 4096, 8, __Levelrole_auth588,
			     __Tracesrole_auth588, lager_event,
			     __Pidrole_auth588);
	    _ -> ok
	  end,
	  {close, 2}
    end.

make_sdk_adult_arg(Args) ->
    Sort = lists:keysort(1, Args),
    make_sdk_adult_arg(Sort, <<>>).

make_sdk_adult_arg([], Bin) -> Bin;
make_sdk_adult_arg([{Key, Val} | Rest], Bin) ->
    KeyBin = string_util:urlencode(Key),
    ValBin = string_util:urlencode(util:to_list(Val)),
    NewBin = case Bin of
	       <<>> -> <<KeyBin/binary, "=", ValBin/binary>>;
	       _ ->
		   <<Bin/binary, "&", KeyBin/binary, "=", ValBin/binary>>
	     end,
    make_sdk_adult_arg(Rest, NewBin).

adult_stop_msg(1) -> lang:get(<<"您累计在线时间已满1小时"/utf8>>);
adult_stop_msg(2) -> lang:get(<<"您累计在线时间已满2小时"/utf8>>);
adult_stop_msg(3) ->
    lang:get(<<"您累计在线时间已满3小时，请您下线休息，您的收益已减半"/utf8>>);
adult_stop_msg(4) ->
    lang:get(<<"您累计在线时间已满3小时，请您下线休息，您的收益已减半"/utf8>>);
adult_stop_msg(_) ->
    lang:get(<<"您已进入不健康游戏时间，请您立即下线休息。您的收益已降为零）"/utf8>>).

adult_stop_msg(1, 1) ->
    lang:get(<<"您已进入疲劳游戏时间，游戏内收益减半，并将在两小时后强制下线。（请重新登陆游戏进行验证，已"
	       "成年玩家可解除疲劳限制）"/utf8>>);
adult_stop_msg(1, _) ->
    lang:get(<<"您累计在线时间已满1小时，将在半小时后强制下线。（根据国家相关法规要求，未成年玩家每天登录"
	       "时长限制为1.5小时）"/utf8>>);
adult_stop_msg(_, 1) ->
    lang:get(<<"您已进入疲劳游戏时间，游戏内收益减半。（请重新登陆游戏进行验证，已成年玩家可解除疲劳限制）"/utf8>>);
adult_stop_msg(_WallowFlag, _ExpFlag) ->
    lang:get(<<"您已进入疲劳游戏时间，游戏内收益减半。（请重新登陆游戏进行验证，已成年玩家可解除疲劳限制）"/utf8>>).

adult_frame(Msg) -> notice:alert_frame(3, Msg), ok.


