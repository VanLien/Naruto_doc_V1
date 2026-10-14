-file("src/mod/holiday/holiday_dime.erl", 1).

-module(holiday_dime).

-lager_records([{activity,
		 [id, status, name, data, ext_args]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{m_holiday_dime,
		 [ver, period, end_time, is_buy, award_list, ext]},
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

-export([init/0, zero_flush/1, apply_timer/1, login/1,
	 level_up/2, push_base_info/1, check_open/1, get_award/2,
	 fire/2]).

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

-file("src/mod/holiday/holiday_dime.erl", 19).

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

-file("src/mod/holiday/holiday_dime.erl", 20).

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

-file("src/mod/holiday/holiday_dime.erl", 21).

-file("inc/holiday_dime.hrl", 1).

-record(m_holiday_dime,
	{ver = 1, period = 0, end_time = 0, is_buy = 0,
	 award_list = [], ext = []}).

-file("src/mod/holiday/holiday_dime.erl", 22).

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

-file("src/mod/holiday/holiday_dime.erl", 23).

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

-file("src/mod/holiday/holiday_dime.erl", 24).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday/holiday_dime.erl", 25).

-spec init() -> #m_holiday_dime{}.

init() -> #m_holiday_dime{}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_holiday_dime =
			    #m_holiday_dime{period = OldPeriod,
					    end_time = OldEndTime}}) ->
    NewRole = case check_open(Role) of
		{ok, _} ->
		    TRole = set_timer(Role, OldEndTime),
		    set_activity_status(OldPeriod, 1, []),
		    TRole;
		_ ->
		    {Period, _StartTime, EndTime} = calc_period(Role),
		    if Period =:= 0 ->
			   NRole1 = #role{m_holiday_dime = MH1} = Role,
			   NewMH = MH1#m_holiday_dime{period = 0, end_time = 0,
						      is_buy = 0,
						      award_list = [],
						      ext = []},
			   NRole2 = NRole1#role{m_holiday_dime = NewMH},
			   set_activity_status(OldPeriod, 0, []),
			   NRole2;
		       OldPeriod =/= Period ->
			   NRole1 = #role{m_holiday_dime = MH1} = Role,
			   NewMH = MH1#m_holiday_dime{period = Period,
						      end_time = EndTime,
						      is_buy = 0,
						      award_list = [],
						      ext = []},
			   NRole2 = NRole1#role{m_holiday_dime = NewMH},
			   set_activity_status(OldPeriod, 0, []),
			   set_activity_status(Period, 1, []),
			   TRole = set_timer(NRole2, EndTime),
			   TRole;
		       true ->
			   TRole = set_timer(Role, OldEndTime),
			   set_activity_status(OldPeriod, 1, []),
			   TRole
		    end
	      end,
    push_base_info(NewRole),
    {ok, NewRole}.

set_timer(Role = #role{m_holiday_dime =
			   #m_holiday_dime{}},
	  EndTime) ->
    Time = max(1, EndTime - date:unixtime() + 1),
    Timer = #timer{id = holiday_dime_timer,
		   timeout = Time * 1000, times = 1, m = holiday_dime,
		   f = apply_timer, a = []},
    NewRole = role_timer:set(Timer, Role),
    NewRole.

apply_timer(Role = #role{m_holiday_dime =
			     #m_holiday_dime{period = Period}}) ->
    case check_open(Role) of
      false -> set_activity_status(Period, 0, []);
      _ -> skip
    end,
    {ok, Role}.

set_activity_status(Period, Status, Args) ->
    case holiday_dime_data:get_icon(Period) of
      Icon when is_integer(Icon) ->
	  activity_self:set_activity(Icon, Status, Args);
      _ -> skip
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_holiday_dime =
		       #m_holiday_dime{period = OldPeriod,
				       end_time = OldEndTime}}) ->
    NewRole = case check_open(Role) of
		{ok, _} ->
		    TRole = set_timer(Role, OldEndTime),
		    set_activity_status(OldPeriod, 1, []),
		    TRole;
		_ ->
		    {Period, _StartTime, EndTime} = calc_period(Role),
		    if Period =:= 0 ->
			   NRole1 = #role{m_holiday_dime = MH1} = Role,
			   NewMH = MH1#m_holiday_dime{period = 0, end_time = 0,
						      is_buy = 0,
						      award_list = [],
						      ext = []},
			   NRole2 = NRole1#role{m_holiday_dime = NewMH},
			   set_activity_status(OldPeriod, 0, []),
			   NRole2;
		       OldPeriod =/= Period ->
			   NRole1 = #role{m_holiday_dime = MH1} = Role,
			   NewMH = MH1#m_holiday_dime{period = Period,
						      end_time = EndTime,
						      is_buy = 0,
						      award_list = [],
						      ext = []},
			   NRole2 = NRole1#role{m_holiday_dime = NewMH},
			   set_activity_status(OldPeriod, 0, []),
			   set_activity_status(Period, 1, []),
			   TRole = set_timer(NRole2, EndTime),
			   TRole;
		       true ->
			   TRole = set_timer(Role, OldEndTime),
			   set_activity_status(OldPeriod, 1, []),
			   TRole
		    end
	      end,
    push_base_info(NewRole),
    {ok, NewRole}.

-spec level_up(#role{}, #role{}) -> {ok, #role{}}.

level_up(_OldRole,
	 Role = #role{m_holiday_dime =
			  #m_holiday_dime{period = OldPeriod,
					  end_time = OldEndTime}}) ->
    NewRole = case check_open(Role) of
		{ok, _} ->
		    TRole = set_timer(Role, OldEndTime),
		    set_activity_status(OldPeriod, 1, []),
		    TRole;
		_ ->
		    {Period, _StartTime, EndTime} = calc_period(Role),
		    if Period =:= 0 ->
			   NRole1 = #role{m_holiday_dime = MH1} = Role,
			   NewMH = MH1#m_holiday_dime{period = 0, end_time = 0,
						      is_buy = 0,
						      award_list = [],
						      ext = []},
			   NRole2 = NRole1#role{m_holiday_dime = NewMH},
			   set_activity_status(OldPeriod, 0, []),
			   NRole2;
		       OldPeriod =/= Period ->
			   NRole1 = #role{m_holiday_dime = MH1} = Role,
			   NewMH = MH1#m_holiday_dime{period = Period,
						      end_time = EndTime,
						      is_buy = 0,
						      award_list = [],
						      ext = []},
			   NRole2 = NRole1#role{m_holiday_dime = NewMH},
			   set_activity_status(OldPeriod, 0, []),
			   set_activity_status(Period, 1, []),
			   TRole = set_timer(NRole2, EndTime),
			   TRole;
		       true ->
			   TRole = set_timer(Role, OldEndTime),
			   set_activity_status(OldPeriod, 1, []),
			   TRole
		    end
	      end,
    push_base_info(NewRole),
    {ok, NewRole}.

-spec push_base_info(#role{}) -> ok.

push_base_info(#role{power = Power,
		     m_holiday_dime =
			 #m_holiday_dime{period = Period,
					 award_list = AwardList,
					 is_buy = BuyFlag,
					 end_time = EndTime}}) ->
    AllAwardList = holiday_dime_data:award_list(Period),
    Fun = fun ({Id, LimitPower, _}, Acc) ->
		  case lists:keymember(Id, 1, AwardList) of
		    false when Power >= LimitPower -> [{Id, 1} | Acc];
		    _ -> Acc
		  end
	  end,
    CliInfo = lists:foldl(Fun, AwardList, AllAwardList),
    TrueTime = util:if_true(BuyFlag =:= 1, 0, EndTime),
    sys_conn:pack_send(16651,
		       {Period, BuyFlag, TrueTime, CliInfo}),
    ok.

-spec get_award(#role{}, pos_integer()) -> {ok,
					    #role{}} |
					   {false, binary()}.

get_award(Role = #role{power = Power,
		       m_holiday_dime =
			   MH = #m_holiday_dime{period = Period,
						award_list = AwardList,
						is_buy = BuyFlag}},
	  Id) ->
    case check_open(Role) of
      {ok, Period} ->
	  case BuyFlag of
	    1 ->
		{LimitPower, Award} =
		    holiday_dime_data:get_award({Period, Id}),
		case lists:keymember(Id, 1, AwardList) of
		  false when Power >= LimitPower ->
		      GL = format:val_to_gain(Award, holiday_dime_award),
		      case role_gain:do_notice(Role, GL) of
			{ok, NRole} ->
			    log:log_gain(GL, Role, NRole,
					 util:fbin(<<"运营活动_战力飞升礼包领奖"/utf8>>,
						   []),
					 util:fbin(<<"id:~w"/utf8>>, [Id])),
			    NewAwardList = lists:keystore(Id, 1, AwardList,
							  {Id, 2}),
			    NRole1 = NRole#role{m_holiday_dime =
						    MH#m_holiday_dime{award_list
									  =
									  NewAwardList}},
			    push_base_info(NRole1),
			    case check_open(NRole1) of
			      false -> set_activity_status(Period, 0, []);
			      _ -> skip
			    end,
			    {ok, NRole1};
			_ -> {false, lang:get(<<"领取失败"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"未满足领取条件"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"您尚未激活该礼包"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec fire(#role{}, map()) -> {ok, #role{}}.

fire(Role = #role{m_holiday_dime =
		      MH = #m_holiday_dime{period = Period,
					   is_buy = BuyFlag}},
     Opt = #{sn := Sn, package_id := PackageId,
	     money := Money}) ->
    case holiday_dime_data:get_charge_id(Period) of
      PackageId ->
	  case BuyFlag of
	    0 ->
		NRole1 = Role#role{m_holiday_dime =
				       MH#m_holiday_dime{is_buy = 1}},
		push_base_info(NRole1),
		{ok, NRole1};
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole,
			       <<"运营活动_战力飞升礼包"/utf8>>,
			       util:fbin("战力飞升礼包充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

-spec check_open(#role{}) -> {ok, pos_integer()} |
			     false.

check_open(#role{m_holiday_dime =
		     #m_holiday_dime{period = Period, end_time = EndTime,
				     is_buy = BuyFlag,
				     award_list = AwardList}}) ->
    Now = date:unixtime(),
    AllAwardList = holiday_dime_data:award_list(Period),
    Fun = fun ({Id, _, _}) ->
		  list_util:keyfind(Id, AwardList, 0) =:= 2
	  end,
    Flag = lists:all(Fun, AllAwardList),
    case Period =/= 0 andalso EndTime > Now orelse
	   BuyFlag =:= 1 andalso Flag =:= false
	of
      true -> {ok, Period};
      _ -> false
    end.

calc_period(Role) ->
    Now = date:unixtime(),
    OpenTime = holiday_dime_data:period_list(),
    case is_open_time(OpenTime, Now, Role) of
      {true, Period, StartTime, EndTime} ->
	  {Period, StartTime, EndTime};
      _ -> {0, 0, 0}
    end.

is_open_time([], _Now, _Role) -> false;
is_open_time([{Period, StartTime, EndTime, OpenCond}
	      | Other],
	     Now, Role = #role{reg_time = RegTime}) ->
    case role_misc:check_open_cond(OpenCond, Role) of
      true ->
	  Time1 = holiday_role:parse_time(StartTime, Role),
	  Time2 = holiday_role:parse_time(EndTime, Role),
	  Day = list_util:keyfind(reg_day_less, OpenCond, 0),
	  Time3 = min(Time2, RegTime + 86400 * Day),
	  case Now >= Time1 andalso Now =< Time2 of
	    true when Day =/= 0 -> {true, Period, Time1, Time3};
	    true -> {true, Period, Time1, Time2};
	    _ -> is_open_time(Other, Now, Role)
	  end;
      _ -> is_open_time(Other, Now, Role)
    end.


