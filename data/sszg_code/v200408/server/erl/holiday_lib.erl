-file("src/mod/holiday/holiday_lib.erl", 1).

-module(holiday_lib).

-lager_records([{condition, [label, op, val, msg]},
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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

-export([get_tbid/1, get_holiday_type/1,
	 list_type_holiday/1, list_type_holiday/2, get_holiday/1,
	 get_holiday_list/1, get_holiday_list/2,
	 get_open_holiday/2, get_open_holiday/1,
	 get_open_holiday_list/1, is_open/1, get_holiday_value/2,
	 set_holiday_value/3, get_tv_val/2, get_tv_val/3,
	 set_tv_val/4, get_total_id_by_bid/1, is_open_list/2,
	 get_mod/1, qry/2, push_holiday_one/2,
	 push_can_get_rewrd/1, to_client_item/1,
	 to_client_item/2, get_end_time/1, get_tv_timeout/1,
	 reset_tv_timeout/2, get_tv_camp_id/1, check_cond/2,
	 get_holiday_data/1, to_expire_data/1,
	 get_expire_holiday/1, get_main_ico/1]).

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

-file("src/mod/holiday/holiday_lib.erl", 42).

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

-file("src/mod/holiday/holiday_lib.erl", 43).

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

-file("src/mod/holiday/holiday_lib.erl", 44).

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

-file("src/mod/holiday/holiday_lib.erl", 45).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/holiday/holiday_lib.erl", 46).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/holiday/holiday_lib.erl", 47).

-spec get_tbid(integer()) -> integer().

get_tbid(Bid) when Bid > 9990000 -> Bid - 9990000;
get_tbid(Bid) when Bid > 990000 -> Bid - 990000;
get_tbid(Bid) when Bid > 90000 -> Bid - 90000;
get_tbid(Bid) -> Bid.

-spec get_holiday_type(pos_integer()) -> 0..3.

get_holiday_type(Bid) when Bid > 9990000 -> 2;
get_holiday_type(Bid) when Bid > 990000 -> 3;
get_holiday_type(Bid) when Bid > 90000 -> 1;
get_holiday_type(Bid) when Bid > 1000 -> 0;
get_holiday_type(_Bid) -> 0.

-spec list_type_holiday(Type :: all | 0..3) -> list().

list_type_holiday(all) ->
    list_type_holiday(3) ++ ets:tab2list(holiday);
list_type_holiday(3) ->
    [(holiday_role_data:get(CampId))#holiday{start_time =
						 StartTime,
					     end_time = EndTime,
					     tbid = get_tbid(Bid)}
     || {Bid,
	 #{start_time := StartTime, end_time := EndTime,
	   camp_id := CampId}}
	    <- maps:to_list(get(holiday_role_son_cache))];
list_type_holiday(4) ->
    list_type_holiday(3) ++ list_type_holiday(1);
list_type_holiday(Type) -> do_list_type_holiday(Type).

list_type_holiday(Role, Type) ->
    L = list_type_holiday(Type),
    [H || H <- L, check_cond(Role, H) =:= true].

do_list_type_holiday(Type) ->
    HolidayList = ets:tab2list(holiday),
    F = fun (XHoliday = #holiday{bid = XBid}, XSum) ->
		case holiday_lib:get_holiday_type(XBid) of
		  Type -> [XHoliday | XSum];
		  _ -> XSum
		end
	end,
    lists:foldr(F, [], HolidayList).

-spec push_can_get_rewrd(#role{}) -> ok.

push_can_get_rewrd(Role) ->
    role:redirect(Role#role.pid, 16602, {}), ok.

push_holiday_one(#role{pid = Pid}, Bid)
    when is_pid(Pid) ->
    role:redirect(Pid, 16603, {Bid}), ok.

-spec get_mod(pos_integer()) -> atom().

get_mod(1021) -> holiday_accumulate;
get_mod(Bid) when Bid >= 1000 andalso Bid =< 1999 ->
    holiday_rule_charge;
get_mod(Bid) when Bid >= 2000 andalso Bid =< 2999 ->
    holiday_rule_spend;
get_mod(3001) -> holiday_rule_boss;
get_mod(Bid) when Bid >= 3000 andalso Bid =< 3999 ->
    holiday_rule_func;
get_mod(Bid) when Bid >= 4000 andalso Bid =< 4999 ->
    holiday_rule_online;
get_mod(Bid) when Bid >= 5000 andalso Bid =< 5999 ->
    holiday_rule_interest;
get_mod(Bid) when Bid >= 6000 andalso Bid =< 6999 ->
    holiday_rule_other;
get_mod(Bid) when Bid >= 7000 andalso Bid =< 7999 ->
    holiday_rule_rank;
get_mod(Bid) when Bid >= 8000 andalso Bid =< 8999 ->
    holiday_rule_desc;
get_mod(Bid) when Bid >= 90000 ->
    get_mod(get_tbid(Bid));
get_mod(_) -> undefined.

-spec qry(pos_integer(), #role{}) -> tuple().

qry(Bid, Role) ->
    case get_mod(Bid) of
      undefined -> {0, 0, 0, [], [], [], <<>>, []};
      Mod ->
	  case get_holiday(Bid) of
	    Holiday = #holiday{cli_type = CliType} ->
		case check_cond(Role, Holiday) of
		  false -> {CliType, 0, 0, [], [], [], <<>>, []};
		  true ->
		      case lists:member(Bid,
					[1003, 91003, 991003, 1008, 91008,
					 991008, 1014, 91014, 991014, 1015,
					 91015, 991015, 1016, 91016, 991016,
					 1017, 91017, 991017, 1018, 91018,
					 991018, 1019, 91019, 991019, 1020,
					 91020, 991020, 1046, 91046, 991046])
			  of
			false -> do_qry(Holiday, Mod, Role);
			_ ->
			    case holiday_rule:is_gain_reward(Role, Holiday) of
			      true
				  when Bid == 1046 orelse
					 Bid == 91046 orelse Bid == 991046 ->
				  {CliType, 0, 1, [], [], [], <<>>, []};
			      true -> {CliType, 0, 0, [], [], [], <<>>, []};
			      false -> do_qry(Holiday, Mod, Role)
			    end
		      end
		end;
	    _ -> {0, 0, 0, [], [], [], <<>>, []}
	  end
    end.

do_qry(Holiday = #holiday{cli_type = CliType}, Mod,
       Role) ->
    case Mod:qry(Holiday, Role) of
      {RemainSec, MyAim, [], ItemEff, IntArgList, CliReward,
       RankList} ->
	  AimList = [{0, <<>>, 0, [], []}],
	  {CliType, RemainSec, MyAim, AimList, ItemEff,
	   IntArgList, CliReward, RankList};
      {RemainSec, MyAim, AimList, ItemEff, IntArgList,
       CliReward, RankList} ->
	  {CliType, RemainSec, MyAim, AimList, ItemEff,
	   IntArgList, CliReward, RankList};
      {error, _Reason} ->
	  {CliType, 0, 0, [], [], [], <<>>, []}
    end.

get_holiday_list([]) -> [];
get_holiday_list(Bids) -> get_holiday_list(Bids, []).

get_holiday_list([], Acc) -> Acc;
get_holiday_list([Bid | Rest], Acc) ->
    NewAcc = case get_holiday(Bid) of
	       Holiday = #holiday{} -> [Holiday | Acc];
	       _ -> Acc
	     end,
    get_holiday_list(Rest, NewAcc).

-spec get_holiday(pos_integer() | list()) -> undefined |
					     #holiday{}.

get_holiday([]) -> undefined;
get_holiday([Bid | T]) ->
    case get_holiday(Bid) of
      undefined -> get_holiday(T);
      Holiday -> Holiday
    end;
get_holiday(Bid)
    when Bid >= 990000 andalso Bid < 9990000 ->
    case get('@is_role_process') of
      true ->
	  case maps:get(Bid, get(holiday_role_son_cache),
			undefined)
	      of
	    #{start_time := StartTime, end_time := EndTime,
	      camp_id := CampId} ->
		(holiday_role_data:get(CampId))#holiday{start_time =
							    StartTime,
							end_time = EndTime,
							tbid = get_tbid(Bid)};
	    _ -> undefined
	  end;
      _ ->
	  do_get_holiday(holiday_role_data:bid_son(Bid),
			 date:unixtime(), holiday_mgr:get_holiday_sec())
    end;
get_holiday(Bid) ->
    case ets:lookup(holiday, Bid) of
      [Holiday | _] -> Holiday;
      _ -> undefined
    end.

do_get_holiday([], _Now, _OffSec) -> undefined;
do_get_holiday([H | T], Now, OffSec) ->
    case do_get_holiday(H, Now, OffSec) of
      Holiday = #holiday{} -> Holiday;
      _ -> do_get_holiday(T, Now, OffSec)
    end;
do_get_holiday(Holiday = #holiday{start_time = ST,
				  end_time = ET, bid = Bid},
	       Now, OffSec)
    when is_tuple(ST) andalso element(1, ST) =/= reg_day ->
    StartTime = date:parse_time(ST) - OffSec,
    EndTime = date:parse_time(ET) - OffSec,
    case StartTime =< Now andalso Now < EndTime of
      true ->
	  Holiday#holiday{start_time = StartTime,
			  end_time = EndTime, tbid = get_tbid(Bid)};
      _ -> undefined
    end;
do_get_holiday(CampId, Now, OffSec)
    when is_integer(CampId) ->
    do_get_holiday(holiday_role_data:get(CampId), Now,
		   OffSec);
do_get_holiday(Unknow, _Now, _OffSec) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_lib209, _,
       {__Levelholiday_lib209, __Tracesholiday_lib209}}
	  when __Levelholiday_lib209 band 8 /= 0 orelse
		 __Tracesholiday_lib209 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_lib}, {function, do_get_holiday},
			{line, 209}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的活动数据:~w", [Unknow]), none, 4096, 8,
		       __Levelholiday_lib209, __Tracesholiday_lib209,
		       lager_event, __Pidholiday_lib209);
      _ -> ok
    end,
    undefined.

-spec get_open_holiday(#role{},
		       list() | pos_integer()) -> undefined | #holiday{}.

get_open_holiday(Role, Bids) ->
    case get_open_holiday(Bids) of
      undefined -> undefined;
      Holiday ->
	  case check_cond(Role, Holiday) of
	    true -> Holiday;
	    _ -> undefined
	  end
    end.

-spec get_open_holiday(list() |
		       pos_integer()) -> undefined | #holiday{}.

get_open_holiday([]) -> undefined;
get_open_holiday([Bid | T]) ->
    case get_open_holiday(Bid) of
      undefined -> get_open_holiday(T);
      Holiday -> Holiday
    end;
get_open_holiday(Bid) ->
    Holiday = get_holiday(Bid),
    case is_open(Holiday) of
      true -> Holiday;
      _ -> undefined
    end.

get_open_holiday_list([]) -> [];
get_open_holiday_list(Bids) ->
    get_open_holiday_list(Bids, []).

get_open_holiday_list([], Acc) -> lists:reverse(Acc);
get_open_holiday_list([Bid | T], Acc) ->
    NewAcc = case get_open_holiday(Bid) of
	       undefined -> Acc;
	       Holiday -> [Holiday | Acc]
	     end,
    get_open_holiday_list(T, NewAcc).

-spec get_holiday_data(CampId ::
			   pos_integer()) -> undefined | #holiday{}.

get_holiday_data(CampId) ->
    case holiday_role_data:get(CampId) of
      Holiday = #holiday{} -> Holiday;
      _ ->
	  case holiday_role_data:get_open(CampId) of
	    Holiday = #holiday{} -> Holiday;
	    _ -> undefined
	  end
    end.

check_cond(_, #holiday{bid = Bid})
    when Bid >= 990000 andalso Bid < 9990000 ->
    true;
check_cond(Role,
	   #holiday{condition = Conds, bid = Bid}) ->
    case role_cond:check(Conds, Role) of
      true when Bid == 93030 orelse Bid == 993030 ->
	  case var:get_var(Role, other, 3093, 0) of
	    1 -> true;
	    3 -> true;
	    0 -> partner_lib:hase_partner_by_star(Role, 30507, 10);
	    _ -> false
	  end;
      true -> true;
      {false, #condition{label = lev, val = NeedVal}} ->
	  put(holiday_cond_lev,
	      min(util:get(holiday_cond_lev, 9999), NeedVal)),
	  false;
      {false,
       #condition{label = charge_sum, val = NeedVal}} ->
	  put(holiday_cond_charge_sum,
	      min(util:get(holiday_cond_charge_sum, 999999),
		  NeedVal)),
	  false;
      _ -> false
    end;
check_cond(_, _) -> true.

-spec is_open(atom() | pos_integer() |
	      #holiday{}) -> true | false.

is_open(undefined) -> false;
is_open(#holiday{start_time = StartTime,
		 end_time = 0}) ->
    Now = date:unixtime(), Now >= StartTime;
is_open(#holiday{start_time = StartTime,
		 end_time = EndTime}) ->
    Now = date:unixtime(),
    Now >= StartTime andalso Now =< EndTime;
is_open(Bid) when is_integer(Bid) ->
    is_open(get_holiday(Bid));
is_open(_) -> false.

-spec open_state(#role{},
		 pos_integer() | #holiday{}) -> {false,
						 non_neg_integer()} |
						{true, non_neg_integer()}.

open_state(Role,
	   Holiday = #holiday{bid = Bid, start_time = StartTime,
			      end_time = EndTime}) ->
    case check_cond(Role, Holiday) of
      true ->
	  Now = date:unixtime(),
	  IsOpen = case lists:member(Bid, []) of
		     true -> Now >= StartTime;
		     false ->
			 case Now >= StartTime andalso
				(Now =< EndTime orelse EndTime =:= 0)
			     of
			   true ->
			       case lists:member(Bid,
						 [1003, 91003, 991003, 1008,
						  91008, 991008, 1014, 91014,
						  991014, 1015, 91015, 991015,
						  1016, 91016, 991016, 1017,
						  91017, 991017, 1018, 91018,
						  991018, 1019, 91019, 991019,
						  1020, 91020, 991020, 1046,
						  91046, 991046])
				   of
				 true ->
				     not
				       holiday_rule:is_gain_reward(Role,
								   Holiday);
				 _ -> true
			       end;
			   false -> false
			 end
		   end,
	  {IsOpen, util:if_true(IsOpen, EndTime, 0)};
      _ -> {false, 0}
    end;
open_state(Role, Bid) when is_integer(Bid) ->
    open_state(Role, get_holiday(Bid));
open_state(_Role, _) -> {false, 0}.

-spec is_open_list(#role{}, list()) -> list().

is_open_list(Role, List) ->
    Fun = fun (Bid) ->
		  {IsOpen, EndTime} = open_state(Role, Bid),
		  {Bid, util:if_true(IsOpen, 1, 0), EndTime}
	  end,
    [Fun(Bid) || Bid <- List].

get_total_id_by_bid(Bid) ->
    case get_holiday(Bid) of
      #holiday{total_id = TotalId} -> TotalId;
      _ -> 0
    end.

-spec get_end_time(#holiday{}) -> non_neg_integer().

get_end_time(#holiday{end_time = 0, total_id = 0}) -> 0;
get_end_time(#holiday{bid = Bid}) ->
    holiday_mgr:get_holiday_total_end_ms(get_holiday_type(Bid)).

-spec get_tv_timeout(#holiday{}) -> non_neg_integer().

get_tv_timeout(#holiday{end_time = 0, total_id = 0}) ->
    0;
get_tv_timeout(#holiday{end_time = EndTime,
			total_id = 0}) ->
    EndTime + 86400 * 2;
get_tv_timeout(#holiday{bid = Bid,
			end_time = EndTime}) ->
    max(holiday_mgr:get_holiday_total_end_ms(get_holiday_type(Bid)),
	EndTime)
      + 86400 * 2.

reset_tv_timeout(Role = #role{m_var =
				  #m_var{timeout_vars = TimeoutVars},
			      misc = #role_misc{reg_zero_time = RegZeroTime}},
		 Now) ->
    Time = RegZeroTime + 86400 * 10,
    case Now < Time of
      true -> reset_tv_timeout(Role, Time, TimeoutVars);
      false -> Role
    end.

reset_tv_timeout(Role, _Time, []) -> Role;
reset_tv_timeout(Role, Time,
		 [{Key = {holiday, _}, {Timeout, Val}} | Rest]) ->
    NRole = case Timeout >= Time orelse Timeout =:= 0 of
	      true -> Role;
	      false -> var:set_var(Role, {timeout, Time}, Key, Val)
	    end,
    reset_tv_timeout(NRole, Time, Rest);
reset_tv_timeout(Role, Time, [_ | Rest]) ->
    reset_tv_timeout(Role, Time, Rest).

-spec get_holiday_value(#role{},
			pos_integer()) -> non_neg_integer().

get_holiday_value(Role, Bid) ->
    case get_open_holiday(Bid) of
      undefined -> holiday_tv:init_val(Bid);
      #holiday{camp_id = CampId} ->
	  get_tv_val(CampId, Bid, Role)
    end.

-spec set_holiday_value(#role{}, pos_integer(),
			Val :: pos_integer()) -> #role{}.

set_holiday_value(Role, Bid, Val) ->
    case get_holiday(Bid) of
      undefined -> Role;
      Holiday = #holiday{camp_id = CampId} ->
	  OldVal = get_tv_val(CampId, Bid, Role),
	  ExpireSec = get_tv_timeout(Holiday),
	  set_tv_val(CampId, Role, OldVal + Val, ExpireSec)
    end.

get_tv_name(CampId) -> {holiday, CampId}.

get_tv_camp_id(#role{m_var =
			 #m_var{timeout_vars = TimeoutVars}}) ->
    [CampId || {{holiday, CampId}, _} <- TimeoutVars].

-spec get_tv_val(pos_integer(), #role{}) -> any().

-spec get_tv_val(pos_integer(), pos_integer(),
		 #role{}) -> any().

get_tv_val(CampId, Role) ->
    TvName = get_tv_name(CampId),
    case var:get_var(Role, timeout, TvName, undefined) of
      undefined -> undefined;
      Val ->
	  case holiday_role_data:get(CampId) of
	    Holiday = #holiday{} ->
		{StartTime, EndTime} =
		    holiday_role:parse_son_time(Holiday, Role),
		Now = date:unixtime(),
		case Now >= StartTime andalso
		       (Now < EndTime orelse EndTime =:= 0)
		    of
		  true -> Val;
		  _ -> undefined
		end;
	    _ -> undefined
	  end
    end.

get_tv_val(CampId, Bid, Role) ->
    TvName = get_tv_name(CampId),
    case var:get_var(Role, timeout, TvName, undefined) of
      undefined -> holiday_tv:init_val(Bid);
      Val -> Val
    end.

-spec set_tv_val(pos_integer(), #role{}, any(),
		 pos_integer()) -> #role{}.

set_tv_val(CampId, Role, Data, TimeOutSec) ->
    TvName = get_tv_name(CampId),
    var:set_var(Role, {timeout, TimeOutSec}, TvName, Data).

-spec to_client_item(list()) -> list().

to_client_item(List) -> to_client_item_1(List, 0, []).

to_client_item(List, #role{career = Career}) ->
    to_client_item_1(List, Career, []).

to_client_item_1([], _RoleCareer, Rtn) ->
    lists:reverse(Rtn);
to_client_item_1([{career, Career, ItemBid, ItemNum,
		   _Bind}
		  | T],
		 RoleCareer, Result) ->
    case Career =:= RoleCareer of
      true ->
	  to_client_item_1(T, RoleCareer,
			   [{ItemBid, ItemNum} | Result]);
      false -> to_client_item_1(T, RoleCareer, Result)
    end;
to_client_item_1([{ItemBid, Num} | T], RoleCareer,
		 Rtn) ->
    to_client_item_1(T, RoleCareer, [{ItemBid, Num} | Rtn]);
to_client_item_1([{ItemBid, Num, _Bind} | T],
		 RoleCareer, Rtn) ->
    to_client_item_1(T, RoleCareer, [{ItemBid, Num} | Rtn]).

to_expire_data(#holiday{bid = Bid, camp_id = CampId,
			ico = Ico, reward = Reward, start_time = ST,
			end_time = ET, mail_subject = MailSub,
			mail_content = MailCtn}) ->
    Map = #{bid => Bid, ico => Ico, reward => Reward,
	    start_time => ST, end_time => ET,
	    mail_subject => MailSub, mail_content => MailCtn},
    {CampId, Map}.

get_expire_holiday(CampId) ->
    case ets:lookup(holiday_expire, CampId) of
      [{CampId, Data}] ->
	  Bid = maps:get(bid, Data, 0),
	  Ico = maps:get(ico, Data, <<>>),
	  Reward = maps:get(reward, Data, []),
	  ST = maps:get(start_time, Data, -1),
	  ET = maps:get(end_time, Data, -1),
	  MailSub = maps:get(mail_subject, Data, <<>>),
	  MailCtn = maps:get(mail_content, Data, <<>>),
	  #holiday{camp_id = CampId, bid = Bid, ico = Ico,
		   reward = Reward, start_time = ST, end_time = ET,
		   mail_subject = MailSub, mail_content = MailCtn};
      _ -> undefined
    end.

get_main_ico(CampId) ->
    case holiday_role_data:main_ico(CampId) of
      {Ico, _} -> Ico;
      Ico1 when Ico1 > 0 -> Ico1;
      _ ->
	  case holiday_role_data:open_ico(CampId) of
	    {Ico, _} -> Ico;
	    Ico2 when Ico2 > 0 -> Ico2;
	    _ -> 0
	  end
    end.


