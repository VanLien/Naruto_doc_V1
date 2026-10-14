-file("src/mod/holiday_optional_lottery/holiday_opti"
      "onal_lottery.erl",
      1).

-module(holiday_optional_lottery).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{m_holiday_optional_lottery,
		 [ver, camp_id, round, optional_type_id_list,
		  optional_type_info, round_draw_count, draw_count,
		  draw_info, draw_type_info, ext]},
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

-export([init/0, push_point/1, zero_flush/1,
	 click_ico/1, push_base_info/1, push_award_info/1,
	 get_optional_list/1, choose_option/2, next_round/1,
	 lottery/2]).

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

-file("src/mod/holiday_optional_lottery/holiday_opti"
      "onal_lottery.erl",
      19).

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

-file("src/mod/holiday_optional_lottery/holiday_opti"
      "onal_lottery.erl",
      20).

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

-file("src/mod/holiday_optional_lottery/holiday_opti"
      "onal_lottery.erl",
      21).

-file("inc/holiday_optional_lottery.hrl", 1).

-record(m_holiday_optional_lottery,
	{ver = 1, camp_id = 0, round = 0,
	 optional_type_id_list = [], optional_type_info = [],
	 round_draw_count = [], draw_count = 0, draw_info = [],
	 draw_type_info = [], ext = []}).

-file("src/mod/holiday_optional_lottery/holiday_opti"
      "onal_lottery.erl",
      22).

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

-file("src/mod/holiday_optional_lottery/holiday_opti"
      "onal_lottery.erl",
      23).

-spec init() -> #m_holiday_optional_lottery{}.

init() -> #m_holiday_optional_lottery{}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_holiday_optional_lottery =
			    MH = #m_holiday_optional_lottery{camp_id =
								 CampId}}) ->
    NewRole = case holiday_lib:get_open_holiday(Role,
						[3045, 93045, 993045])
		  of
		#holiday{camp_id = CampId} -> push_point(Role), Role;
		#holiday{camp_id = NewCampId} ->
		    NRole1 = add_log(Role),
		    NRole2 = NRole1#role{m_holiday_optional_lottery =
					     MH#m_holiday_optional_lottery{camp_id
									       =
									       NewCampId,
									   round
									       =
									       1,
									   optional_type_id_list
									       =
									       [],
									   optional_type_info
									       =
									       [],
									   round_draw_count
									       =
									       [],
									   draw_count
									       =
									       0,
									   draw_info
									       =
									       [],
									   draw_type_info
									       =
									       [],
									   ext =
									       []}},
		    NRole3 = var:set_var(NRole2, other, 3085, 1),
		    push_base_info(NRole3),
		    push_point(NRole3),
		    NRole3;
		_ -> NRole1 = add_log(Role), NRole1
	      end,
    {ok, NewRole}.

add_log(Role = #role{m_holiday_optional_lottery =
			 #m_holiday_optional_lottery{round_draw_count =
							 RoundDrawCount}}) ->
    Val = var:get_var(Role, other, 3085, 0),
    case Val =:= 1 of
      true ->
	  log:save(optional_lottery_info,
		   {Role,
		    util:fbin(<<"每轮抽奖情况：~w"/utf8>>, [RoundDrawCount])}),
	  NRole1 = var:set_var(Role, other, 3085, 0),
	  NRole1;
      _ -> Role
    end.

-spec push_point(#role{}) -> ok.

push_point(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [3045, 93045, 993045])
	of
      #holiday{} ->
	  case var:get_var(Role, day, 115, 0) of
	    0 -> sys_conn:pack_send(28306, {1, <<>>});
	    _ -> sys_conn:pack_send(28306, {0, <<>>})
	  end;
      _ ->
	  sys_conn:pack_send(28306,
			     {0, lang:get(<<"活动未开启"/utf8>>)})
    end.

-spec click_ico(#role{}) -> {ok, #role{}} |
			    {false, binary()}.

click_ico(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [3045, 93045, 993045])
	of
      #holiday{} ->
	  case var:get_var(Role, day, 115, 0) of
	    0 ->
		NRole1 = var:set_var(Role, day, 115, 1),
		push_point(NRole1),
		{ok, NRole1};
	    _ -> {false, lang:get(<<"红点已消失"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec push_base_info(#role{}) -> ok.

push_base_info(Role = #role{m_holiday_optional_lottery =
				#m_holiday_optional_lottery{round = Round,
							    round_draw_count =
								RoundDrawCountList,
							    draw_info =
								DrawInfo,
							    optional_type_id_list
								=
								OptionalTypeList}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3045, 93045, 993045])
	of
      #holiday{start_time = StartTime, end_time = EndTime} ->
	  DayCount = var:get_var(Role, day, 116, 0),
	  DayGoldCount =
	      holiday_optional_lottery_data:get_const(day_draw_time),
	  DayTime = DayGoldCount - DayCount,
	  DayOriginalCount = var:get_var(Role, day, 120, 0),
	  DayOriginalGoldCount =
	      holiday_optional_lottery_data:get_const(day_original_draw_time),
	  DayOriginalTime = DayOriginalGoldCount -
			      DayOriginalCount,
	  CliInfo = list_util:keyfind(Round, DrawInfo, []),
	  RoundDrawCount = list_util:keyfind(Round,
					     RoundDrawCountList, 0),
	  OptionalTypeId = list_util:keyfind(Round,
					     OptionalTypeList, 0),
	  MaxRound =
	      holiday_optional_lottery_data:get_const(max_round),
	  NextRound = util:if_true(lists:keymember(OptionalTypeId,
						   1, CliInfo)
				     andalso Round + 1 =< MaxRound,
				   1, 0),
	  sys_conn:pack_send(28300,
			     {EndTime, StartTime, Round, RoundDrawCount,
			      OptionalTypeId, DayTime, NextRound, CliInfo,
			      DayOriginalTime}),
	  ok;
      _ -> ok
    end.

-spec push_award_info(#role{}) -> ok.

push_award_info(Role = #role{m_holiday_optional_lottery
				 =
				 #m_holiday_optional_lottery{round = Round,
							     draw_type_info =
								 DrawTypeInfo}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3045, 93045, 993045])
	of
      #holiday{} ->
	  CliInfo = list_util:keyfind(Round, DrawTypeInfo, []),
	  sys_conn:pack_send(28301, {CliInfo}),
	  ok;
      _ -> ok
    end.

-spec get_optional_list(#role{}) -> {ok, #role{}} |
				    {false, binary()}.

get_optional_list(Role =
		      #role{m_holiday_optional_lottery =
				#m_holiday_optional_lottery{round = Round,
							    draw_type_info =
								DrawTypeInfo,
							    optional_type_id_list
								=
								OptionalTypeList,
							    optional_type_info =
								OptionalTypeInfo}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3045, 93045, 993045])
	of
      #holiday{camp_id = CampId} ->
	  RoundDrawTypeInfo = list_util:keyfind(Round,
						DrawTypeInfo, []),
	  OptionalTypeId = list_util:keyfind(Round,
					     OptionalTypeList, 0),
	  case lists:keymember(OptionalTypeId, 1,
			       RoundDrawTypeInfo)
	      of
	    false ->
		OptionalList =
		    holiday_optional_lottery_data:get_optional_list(CampId),
		Fun = fun ({TypeId, LimitCount, _, _, _, _, LimitRound},
			   Acc) ->
			      Count = list_util:keyfind(TypeId,
							OptionalTypeInfo, 0),
			      [{TypeId, Count, LimitCount, LimitRound} | Acc]
		      end,
		CliInfo = lists:foldl(Fun, [], OptionalList),
		{ok, CliInfo};
	    _ -> {false, lang:get(<<"您已获得本轮终极大奖"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec choose_option(#role{}, pos_integer()) -> {ok,
						#role{}} |
					       {false, binary()}.

choose_option(Role = #role{m_holiday_optional_lottery =
			       MH = #m_holiday_optional_lottery{round = Round,
								optional_type_id_list
								    =
								    OptionalTypeList,
								optional_type_info
								    =
								    OptionalTypeInfo,
								draw_info =
								    DrawInfo}},
	      ChooseTypeId) ->
    case holiday_lib:get_open_holiday(Role,
				      [3045, 93045, 993045])
	of
      #holiday{camp_id = CampId} ->
	  NowOption = list_util:keyfind(Round, OptionalTypeList,
					0),
	  RoundDrawInfo = list_util:keyfind(Round, DrawInfo, []),
	  case lists:keymember(NowOption, 1, RoundDrawInfo) of
	    false ->
		case
		  holiday_optional_lottery_data:get_optional_info({CampId,
								   ChooseTypeId})
		    of
		  {LimitCount, _, _, _, _, LimitRound} ->
		      Count = list_util:keyfind(ChooseTypeId,
						OptionalTypeInfo, 0),
		      case LimitRound =< Round of
			true when LimitCount - Count > 0 ->
			    NewOptionalTypeList = lists:keystore(Round, 1,
								 OptionalTypeList,
								 {Round,
								  ChooseTypeId}),
			    NRole = Role#role{m_holiday_optional_lottery =
						  MH#m_holiday_optional_lottery{optional_type_id_list
										    =
										    NewOptionalTypeList}},
			    push_base_info(NRole),
			    {ok, NRole};
			_ -> {false, lang:get(<<"不可选择该奖励"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"参数错误"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"本轮自选奖励已抽中"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec next_round(#role{}) -> {ok, #role{}} |
			     {false, binary()}.

next_round(Role = #role{m_holiday_optional_lottery =
			    MH = #m_holiday_optional_lottery{round = Round,
							     round_draw_count =
								 RoundDrawCountList,
							     optional_type_id_list
								 =
								 OptionalTypeIdList,
							     draw_info =
								 DrawInfo}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3045, 93045, 993045])
	of
      #holiday{camp_id = CampId} ->
	  MaxRound =
	      holiday_optional_lottery_data:get_const(max_round),
	  case Round + 1 =< MaxRound of
	    true ->
		AllList =
		    holiday_optional_lottery_data:get_award_list({CampId,
								  Round}),
		RoundDrawCount = list_util:keyfind(Round,
						   RoundDrawCountList, 0),
		OptionalTypeId = list_util:keyfind(Round,
						   OptionalTypeIdList, 0),
		IdPosList = list_util:keyfind(Round, DrawInfo, []),
		case RoundDrawCount >= length(AllList) + 1 orelse
		       lists:keymember(OptionalTypeId, 1, IdPosList) =:= true
		    of
		  true ->
		      NRole = Role#role{m_holiday_optional_lottery =
					    MH#m_holiday_optional_lottery{round
									      =
									      min(MaxRound,
										  Round
										    +
										    1)}},
		      push_base_info(NRole),
		      {ok, NRole};
		  _ -> {false, lang:get(<<"未满足进入下一轮的条件"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"当前已是最大轮次"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec lottery(#role{}, integer()) -> {ok, #role{}} |
				     {false, binary()}.

lottery(Role = #role{m_holiday_optional_lottery =
			 #m_holiday_optional_lottery{round = Round,
						     round_draw_count =
							 RoundDrawCountList,
						     optional_type_id_list =
							 OptionalTypeIdList,
						     draw_info = DrawInfo}},
	Pos) ->
    case holiday_lib:get_open_holiday(Role,
				      [3045, 93045, 993045])
	of
      #holiday{camp_id = CampId} ->
	  AllList =
	      holiday_optional_lottery_data:get_award_list({CampId,
							    Round}),
	  NewDrawCount = list_util:keyfind(Round,
					   RoundDrawCountList, 0)
			   + 1,
	  IdPosList = list_util:keyfind(Round, DrawInfo, []),
	  case lists:keymember(Pos, 2, IdPosList) of
	    false ->
		case NewDrawCount > length(AllList) + 1 of
		  false ->
		      OptionalTypeId = list_util:keyfind(Round,
							 OptionalTypeIdList, 0),
		      case OptionalTypeId =/= 0 of
			true ->
			    {Expend, CostType} = cal_draw_expend(Role),
			    DayCount = var:get_var(Role, day, 116, 0),
			    DayGoldCount =
				holiday_optional_lottery_data:get_const(day_draw_time),
			    DayOriginalCount = var:get_var(Role, day, 120, 0),
			    DayOriginalGoldCount =
				holiday_optional_lottery_data:get_const(day_original_draw_time),
			    case CostType =:= 2 orelse
				   DayCount < DayGoldCount orelse
				     DayOriginalCount < DayOriginalGoldCount
				of
			      true ->
				  draw_process(Role, CampId, CostType, Expend,
					       Pos);
			      _ -> {false, lang:get(<<"今日钻石兑换次数已达上限"/utf8>>)}
			    end;
			_ -> {false, lang:get(<<"请先选择终极大奖"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"您已获得全部奖励"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"该位置已经抽过了哦"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

draw_process(Role, CampId, CostType, Expend, Pos) ->
    {NRole, Award} = do_draw(Role, Pos),
    Gain = format:val_to_gain(Award,
			      holiday_optional_lottery_gain),
    Loss = format:val_to_loss(Expend,
			      holiday_optional_lottery_loss),
    case role_gain:do_notice(NRole, Gain ++ Loss) of
      {ok,
       NRole1 = #role{m_holiday_optional_lottery =
			  MH = #m_holiday_optional_lottery{round = Round,
							   round_draw_count =
							       RoundDrawCountList}}} ->
	  RoundDrawCount = list_util:keyfind(Round,
					     RoundDrawCountList, 0),
	  log:log_gain(Gain ++ Loss, NRole, NRole1,
		       <<"多轮自选不放回抽奖"/utf8>>,
		       util:fbin(<<"轮次：~w，次数：~w，类型：~w，奖励：~w"/utf8>>,
				 [Round, RoundDrawCount, CostType, Award])),
	  NewRole = case CostType of
		      3 ->
			  DayCount = var:get_var(NRole1, day, 116, 0),
			  NRole2 = var:set_var(NRole1, day, 116, DayCount + 1),
			  NRole2;
		      4 ->
			  DayOriginalCount = var:get_var(NRole1, day, 120, 0),
			  NRole3 = var:set_var(NRole1, day, 120,
					       DayOriginalCount + 1),
			  NRole3;
		      _ -> NRole1
		    end,
	  AllList =
	      holiday_optional_lottery_data:get_award_list({CampId,
							    Round}),
	  NewRole1 = case RoundDrawCount >= length(AllList) + 1 of
		       true ->
			   MaxRound =
			       holiday_optional_lottery_data:get_const(max_round),
			   NewRole#role{m_holiday_optional_lottery =
					    MH#m_holiday_optional_lottery{round
									      =
									      min(MaxRound,
										  Round
										    +
										    1)}};
		       _ -> NewRole
		     end,
	  push_base_info(NewRole1),
	  {ok, NewRole1};
      _ -> {false, lang:get(<<"抽奖失败"/utf8>>)}
    end.

do_draw(Role = #role{m_holiday_optional_lottery =
			 MH = #m_holiday_optional_lottery{camp_id = CampId,
							  round = Round,
							  optional_type_id_list
							      =
							      OptionalTypeIdList,
							  draw_info = DrawInfo,
							  round_draw_count =
							      RoundDrawCountList,
							  draw_type_info =
							      DrawTypeInfoList,
							  optional_type_info =
							      OptionalTypeInfo,
							  draw_count =
							      DrawCount}},
	Pos) ->
    AllAward =
	holiday_optional_lottery_data:get_award_list({CampId,
						      Round}),
    OptionalTypeId = list_util:keyfind(Round,
				       OptionalTypeIdList, 0),
    {_, ORewards, OMustNot, Omust, OPro, _} =
	holiday_optional_lottery_data:get_optional_info({CampId,
							 OptionalTypeId}),
    AllAwardList = AllAward ++
		     [{OptionalTypeId, OptionalTypeId, ORewards, OMustNot,
		       Omust, OPro}],
    Fun1 = fun ({Id, _}, Acc) ->
		   case lists:keyfind(Id, 1, Acc) of
		     A when is_tuple(A) -> Acc -- [A];
		     _ -> Acc
		   end
	   end,
    RoundDrawInfo = list_util:keyfind(Round, DrawInfo, []),
    AllAwardList1 = lists:foldl(Fun1, AllAwardList,
				RoundDrawInfo),
    RoundDrawCount = list_util:keyfind(Round,
				       RoundDrawCountList, 0),
    Fun2 = fun (Award = {_, _, _, _, Must, _}, Acc) ->
		   case Must > 0 andalso RoundDrawCount + 1 =:= Must of
		     true -> [Award | Acc];
		     _ -> Acc
		   end
	   end,
    AllAwardList2 = lists:foldl(Fun2, [], AllAwardList1),
    {Id, TypeId, Reward, _, _, _} = case AllAwardList2 of
				      [_ | _] ->
					  util:rand_list(AllAwardList2, 6);
				      _ ->
					  Fun3 = fun (A = {_, _, _, MustNot, _,
							   _},
						      Acc) ->
							 case MustNot > 0
								andalso
								RoundDrawCount +
								  1
								  =< MustNot
							     of
							   true -> Acc;
							   _ -> [A | Acc]
							 end
						 end,
					  AllAwardList3 = lists:foldl(Fun3, [],
								      AllAwardList1),
					  util:rand_list(AllAwardList3, 6)
				    end,
    RoundDrawTypeInfo = list_util:keyfind(Round,
					  DrawTypeInfoList, []),
    NewRoundDrawTypeInfo = lists:keystore(TypeId, 1,
					  RoundDrawTypeInfo,
					  {TypeId,
					   list_util:keyfind(TypeId,
							     RoundDrawTypeInfo,
							     0)
					     + 1}),
    NewDrawTypeInfoList = lists:keystore(Round, 1,
					 DrawTypeInfoList,
					 {Round, NewRoundDrawTypeInfo}),
    NewRoundDrawInfo = lists:keystore(Id, 1, RoundDrawInfo,
				      {Id, Pos}),
    NewDrawInfo = lists:keystore(Round, 1, DrawInfo,
				 {Round, NewRoundDrawInfo}),
    NewRoundDrawCountList = lists:keystore(Round, 1,
					   RoundDrawCountList,
					   {Round, RoundDrawCount + 1}),
    NewOptionalTypeInfo = case Id > 10000 of
			    true ->
				OptionCount = list_util:keyfind(Id,
								OptionalTypeInfo,
								0),
				lists:keystore(Id, 1, OptionalTypeInfo,
					       {Id, OptionCount + 1});
			    _ -> OptionalTypeInfo
			  end,
    NewMH = MH#m_holiday_optional_lottery{optional_type_info
					      = NewOptionalTypeInfo,
					  round_draw_count =
					      NewRoundDrawCountList,
					  draw_count = DrawCount + 1,
					  draw_info = NewDrawInfo,
					  draw_type_info = NewDrawTypeInfoList},
    NRole = Role#role{m_holiday_optional_lottery = NewMH},
    {NRole, Reward}.

cal_draw_expend(Role) ->
    [{ItemId, ItemNum}] =
	holiday_optional_lottery_data:get_const(draw_expend),
    {_, HasNum} = package:count(by_base_id, ItemId,
				Role#role.p_bag),
    case HasNum >= ItemNum of
      true -> {[{ItemId, ItemNum}], 2};
      _ ->
	  DayCount = var:get_var(Role, day, 116, 0),
	  DayGoldCount =
	      holiday_optional_lottery_data:get_const(day_draw_time),
	  case DayCount >= DayGoldCount of
	    false ->
		[{ValId, Val}] =
		    holiday_optional_lottery_data:get_const(draw_expend_value),
		{[{ValId, Val}], 3};
	    _ ->
		[{ValId, Val}] =
		    holiday_optional_lottery_data:get_const(draw_original_price),
		{[{ValId, Val}], 4}
	  end
    end.


