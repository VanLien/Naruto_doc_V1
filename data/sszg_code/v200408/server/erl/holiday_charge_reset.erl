-file("src/mod/holiday/holiday_charge_reset.erl", 1).

-module(holiday_charge_reset).

-lager_records([{s_timer, [ref, timers]},
		{rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{privilege_data,
		 [id, name, pay_type, charge_id, loss, limit_type,
		  limit_day, reward, limit_lev]},
		{privilege_gift,
		 [ver, id, status, buy_time, expire_time]},
		{privilege, [ver, id, expire_time]},
		{m_privilege, [ver, list, gift]},
		{fire_gift_info,
		 [ver, id, charge_id, start_time, end_time, buy_count,
		  limit_count, is_loop, limit_type, ext]},
		{m_holiday_fire_gift,
		 [ver, gift_list, old_gift_list, ext]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{m_holiday_charge_reset,
		 [ver, period, end_time, old_data_list, ext]},
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

-export([init/0, zero_flush/1, apply_timer/1,
	 check_open/1]).

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

-file("src/mod/holiday/holiday_charge_reset.erl", 14).

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

-file("src/mod/holiday/holiday_charge_reset.erl", 15).

-file("inc/holiday_charge_reset.hrl", 1).

-record(m_holiday_charge_reset,
	{ver = 1, period = 0, end_time = 0, old_data_list = [],
	 ext = []}).

-file("src/mod/holiday/holiday_charge_reset.erl", 16).

-file("inc/log.hrl", 1).

-file("src/mod/holiday/holiday_charge_reset.erl", 17).

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

-file("src/mod/holiday/holiday_charge_reset.erl", 18).

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

-file("src/mod/holiday/holiday_charge_reset.erl", 19).

-file("inc/holiday_fire_gift.hrl", 1).

-record(m_holiday_fire_gift,
	{ver = 1, gift_list = [], old_gift_list = [],
	 ext = []}).

-record(fire_gift_info,
	{ver = 1, id = 0, charge_id = 0, start_time = 0,
	 end_time = 0, buy_count = 0, limit_count = 0,
	 is_loop = 0, limit_type = 0, ext = []}).

-file("src/mod/holiday/holiday_charge_reset.erl", 20).

-file("inc/privilege.hrl", 1).

-record(m_privilege, {ver = 1, list = [], gift = []}).

-record(privilege, {ver = 1, id = 0, expire_time = 0}).

-record(privilege_gift,
	{ver = 1, id = 0, status = 0, buy_time = 0,
	 expire_time = 0}).

-record(privilege_data,
	{id = 0, name = <<>>, pay_type = 0, charge_id = 0,
	 loss = 0, limit_type = 0, limit_day = 0, reward = [],
	 limit_lev = 0}).

-file("src/mod/holiday/holiday_charge_reset.erl", 21).

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

-file("src/mod/holiday/holiday_charge_reset.erl", 22).

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

-file("src/mod/holiday/holiday_charge_reset.erl", 23).

-spec init() -> #m_holiday_charge_reset{}.

init() -> #m_holiday_charge_reset{}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_holiday_charge_reset =
			    #m_holiday_charge_reset{period = OldPeriod}}) ->
    NewRole = case check_open(Role) of
		{ok, _} -> Role;
		_ ->
		    {Period, _, EndTime, NRole1} = calc_period(Role),
		    if Period =:= 0 -> NRole1;
		       OldPeriod =/= Period ->
			   NRole2 = charge_reset(NRole1, Period, EndTime),
			   Timer1 = #timer{id = holiday_charge_reset,
					   timeout = 2000, times = 1,
					   m = holiday_charge_reset,
					   f = apply_timer, a = []},
			   NRole3 = role_timer:set(Timer1, NRole2),
			   NRole3;
		       true -> NRole1
		    end
	      end,
    {ok, NewRole}.

apply_timer(Role) ->
    sys_conn:pack_send(16696, {1}), {ok, Role}.

-spec charge_reset(#role{}, pos_integer(),
		   pos_integer()) -> #role{}.

charge_reset(Role = #role{m_charge =
			      MCharge = #m_charge{week_gift = WeekGift,
						  month_gift = MonthGift,
						  charge_list = ChargeList,
						  reset_charge_list =
						      ResetChargeList},
			  m_holiday_fire_gift =
			      MHolidayFireGift = #m_holiday_fire_gift{gift_list
									  =
									  GiftList},
			  m_privilege = MPrivilege = #m_privilege{gift = GiftL},
			  m_holiday_charge_reset =
			      MHolidayChargeReset =
				  #m_holiday_charge_reset{old_data_list =
							      OldDataList}},
	     Period, EndTime) ->
    GoldIdList =
	holiday_charge_reset_data:get_const(gold_mall_id_list),
    PrivilegeIdList =
	holiday_charge_reset_data:get_const(privilege_id_list),
    {NewChargeList, NewResetChargeList} =
	transter_charge_list(ChargeList, ResetChargeList,
			     GoldIdList),
    NewGiftList = [F#fire_gift_info{buy_count = 0}
		   || F <- GiftList],
    Fun = fun (Id, Acc) ->
		  lists:keydelete(Id, #privilege_gift.id, Acc)
	  end,
    NewGiftL = lists:foldl(Fun, GiftL, PrivilegeIdList),
    {NRole1, GetAimList1} = case
			      holiday_lib:get_open_holiday(Role,
							   [1006, 91006,
							    991006])
				of
			      Holiday = #holiday{camp_id = CampId, bid = Bid} ->
				  GetAimList = holiday_lib:get_tv_val(CampId,
								      Bid,
								      Role),
				  ExpireSec =
				      holiday_lib:get_tv_timeout(Holiday),
				  NRole2 = holiday_lib:set_tv_val(CampId, Role,
								  [],
								  ExpireSec),
				  holiday:push_bid_can_reward(NRole2, Bid),
				  holiday_lib:push_holiday_one(NRole2, Bid),
				  {NRole2, GetAimList};
			      _ -> {Role, []}
			    end,
    DayGift = util:get(charge_reset_day_gift, []),
    NewData = {Period,
	       [{day_gift, DayGift}, {week_gift, WeekGift},
		{month_gift, MonthGift}, {charge_list, ChargeList},
		{reset_charge_list, ResetChargeList},
		{gift_list, GiftList}, {privilege, GiftL},
		{1006, GetAimList1}]},
    NewOldDataList = lists:keystore(Period, 1, OldDataList,
				    NewData),
    NRole3 = NRole1#role{m_charge =
			     MCharge#m_charge{day_gift = [], week_gift = [],
					      month_gift = [],
					      charge_list = NewChargeList,
					      reset_charge_list =
						  NewResetChargeList},
			 m_holiday_fire_gift =
			     MHolidayFireGift#m_holiday_fire_gift{gift_list =
								      NewGiftList},
			 m_privilege = MPrivilege#m_privilege{gift = NewGiftL},
			 m_holiday_charge_reset =
			     MHolidayChargeReset#m_holiday_charge_reset{period =
									    Period,
									old_data_list
									    =
									    NewOldDataList,
									end_time
									    =
									    EndTime,
									ext =
									    []}},
    charge_mall:push_point(NRole3),
    privilege:push_gift(NRole3),
    NRole3.

transter_charge_list(ChargeList, ResetChargeList,
		     GoldIdList) ->
    Fun = fun (Id, {Acc1, Acc2}) ->
		  case lists:keyfind(Id, 1, Acc1) of
		    false -> {Acc1, Acc2};
		    T -> {Acc1 -- [T], list_util:mix_key_val(Acc2, [T])}
		  end
	  end,
    {NewChargeList, NewResetChargeList} = lists:foldl(Fun,
						      {ChargeList,
						       ResetChargeList},
						      GoldIdList),
    {NewChargeList, NewResetChargeList}.

-spec check_open(#role{}) -> {ok, pos_integer()} |
			     false.

check_open(#role{m_holiday_charge_reset =
		     #m_holiday_charge_reset{period = Period,
					     end_time = EndTime}}) ->
    Now = date:unixtime(),
    case Period =/= 0 andalso EndTime > Now of
      true -> {ok, Period};
      _ -> false
    end.

calc_period(Role) ->
    Now = date:unixtime(),
    OpenTime = holiday_charge_reset_data:period_list(),
    case is_open_time(OpenTime, Now, Role) of
      {true, Period, StartTime, EndTime, NRole} ->
	  {Period, StartTime, EndTime, NRole};
      {false, NRole1} -> {0, 0, 0, NRole1}
    end.

is_open_time([], _Now, Role) -> {false, Role};
is_open_time([{Period, StartTime, EndTime, OpenCond}
	      | Other],
	     Now, Role) ->
    Time1 = holiday_role:parse_time(StartTime, Role),
    Time2 = holiday_role:parse_time(EndTime, Role),
    case Now >= Time1 andalso Now =< Time2 of
      true ->
	  case var:get_var(Role, acc, 2061, {0, 0}) of
	    {_, Time} when Time < Time2 ->
		NRole1 = var:set_var(Role, acc, 2061, {0, Time2}),
		case role_misc:check_open_cond(OpenCond, NRole1) of
		  true ->
		      NRole2 = var:set_var(NRole1, acc, 2061, {1, Time2}),
		      {true, Period, Time1, Time2, NRole2};
		  _ -> {false, NRole1}
		end;
	    _ -> {false, Role}
	  end;
      _ -> is_open_time(Other, Now, Role)
    end.


