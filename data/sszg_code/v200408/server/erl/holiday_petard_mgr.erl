-file("src/mod/holiday_petard/holiday_petard_mgr.erl",
      1).

-module(holiday_petard_mgr).

-lager_records([{condition, [label, op, val, msg]},
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
		{role_feedback_info,
		 [role_id, id, state, status2, start_time, end_msg_time,
		  finish_time, score_time, title, content,
		  questions_lists, answer_lists, score]},
		{feedback,
		 [sess, rid, feedback_id, status, score, send_time,
		  time_out]},
		{gmail,
		 [id, type, mail_type, subject, content, assets, items,
		  start_time, end_time, conds, source, can_del]},
		{mail,
		 [sess, to, to_name, from, from_name, type, group_id,
		  status, subject, content, assets, items, source, rev_ts,
		  read_time, send_time, time_out, can_del]},
		{self_add_info,
		 [id, time, score, status, total_time, interval]},
		{get_red_packet_info,
		 [r_id, red_id, name, lev, face_id, avatar_bid, time,
		  item]},
		{petard_red_packet,
		 [id, rid, name, face_id, avatar_bid, num, max_num,
		  is_max, mems, must_not, start_time, end_time, msg_id]},
		{m_holiday_petard,
		 [ver, camp_id, end_time, get_red_count, send_red_count,
		  send_notice, must_not_small, must_not_big,
		  petard_reward, red_packet_info, get_red_info]},
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
		{state, []}]).

-behaviour(gen_server).

-record(state, {}).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([check/0]).

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

-file("src/mod/holiday_petard/holiday_petard_mgr.erl",
      14).

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

-file("src/mod/holiday_petard/holiday_petard_mgr.erl",
      15).

-file("inc/holiday_petard.hrl", 1).

-record(m_holiday_petard,
	{ver = 2, camp_id = 0, end_time = 0, get_red_count = 0,
	 send_red_count = 0, send_notice = 0,
	 must_not_small = [], must_not_big = [],
	 petard_reward = [], red_packet_info = [],
	 get_red_info = []}).

-record(petard_red_packet,
	{id = 0, rid = {0, <<>>}, name = <<>>, face_id = 0,
	 avatar_bid = 0, num = 0, max_num = 0, is_max = 0,
	 mems = [], must_not = [], start_time = 0, end_time = 0,
	 msg_id = 0}).

-record(get_red_packet_info,
	{r_id = {0, <<>>}, red_id = 0, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, time = 0, item = []}).

-record(self_add_info,
	{id = 0, time = 0, score = 0, status = 0,
	 total_time = 0, interval = 0}).

-file("src/mod/holiday_petard/holiday_petard_mgr.erl",
      16).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_petard/holiday_petard_mgr.erl",
      17).

-file("inc/mail.hrl", 1).

-record(mail,
	{sess  :: {pos_integer(), bitstring()},
	 to  :: {pos_integer(), bitstring()},
	 to_name = <<>>  :: bitstring(),
	 from  :: {non_neg_integer(), bitstring()},
	 from_name = <<>>  :: bitstring(), type = 1  :: 0..1,
	 group_id = 0  :: non_neg_integer(), status = 0  :: 0..1,
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 source = <<>>  :: pos_integer(),
	 rev_ts = 0  :: pos_integer(),
	 read_time = 0  :: pos_integer(),
	 send_time = 0  :: pos_integer(),
	 time_out = 0  :: pos_integer(), can_del = 1  :: 0..1}).

-record(gmail,
	{id = 0, type = 0  :: non_neg_integer(),
	 mail_type = 1  :: non_neg_integer(),
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 conds = []  :: list(), source = <<>>  :: pos_integer(),
	 can_del = 1  :: 0..1}).

-record(feedback,
	{sess, rid, feedback_id = 0, status = 0, score = 0,
	 send_time = 0, time_out = 0}).

-record(role_feedback_info,
	{role_id, id = 0, state = 0, status2 = 0,
	 start_time = 0, end_msg_time = 0, finish_time = 0,
	 score_time = 0, title = <<>>, content = <<>>,
	 questions_lists = [], answer_lists = [], score = 0}).

-file("src/mod/holiday_petard/holiday_petard_mgr.erl",
      18).

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

-file("src/mod/holiday_petard/holiday_petard_mgr.erl",
      19).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/holiday_petard/holiday_petard_mgr.erl",
      20).

check() ->
    CampId = sys_env:get(holiday_petard_campid, 0),
    case holiday_lib:get_open_holiday([3037, 93037, 993037])
	of
      #holiday{camp_id = CampId, condition = Cond} ->
	  case check_cond(Cond) of
	    true ->
		holiday_petard_mgr ! {send_mail},
		Now = date:unixtime(),
		SelfAddInfoList = sys_env:get(self_add_info, []),
		set_day_self_add(SelfAddInfoList, Now),
		holiday_petard_mgr ! {every_self_add_check_timer};
	    _ -> skip
	  end;
      #holiday{camp_id = NewCampId, start_time = StartTime,
	       end_time = EndTime, condition = Cond} ->
	  case check_cond(Cond) of
	    true ->
		sys_env:save(holiday_petard_campid, NewCampId),
		sys_env:save(holiday_petard_arg,
			     {StartTime, EndTime, Cond}),
		sys_env:save(self_add_info, []),
		sys_env:save(total_petard_score, 0),
		sys_env:save(red_packet_broadcast, []),
		sys_env:save(red_packet_id, 1),
		sys_env:save(every_gold_score, 0),
		sys_env:save(every_gold_time, 0),
		d_ets_lib:clear_d_ets(petard_red_packet),
		util:set_ms_timer(get_alive_num, util:rand(2000, 8000),
				  {get_alive_num_timer}),
		holiday_petard_mgr ! {send_mail},
		holiday_petard_mgr ! {calc_self_add};
	    _ -> skip
	  end;
      _ ->
	  sys_env:save(holiday_petard_campid, 0),
	  sys_env:save(holiday_petard_arg, {0, 0, 0}),
	  sys_env:save(self_add_info, []),
	  sys_env:save(total_petard_score, 0),
	  sys_env:save(red_packet_broadcast, []),
	  sys_env:save(red_packet_id, 1),
	  sys_env:save(every_gold_score, 0),
	  sys_env:save(every_gold_time, 0),
	  d_ets_lib:clear_d_ets(petard_red_packet)
    end.

check_cond([]) -> true;
check_cond([#condition{label = open_srv_time, op = Op,
		       val = Val}
	    | Rest]) ->
    Time = sys_env:get(open_timestamp),
    case comp(Op, Time, Val) of
      true -> check_cond(Rest);
      _ -> false
    end;
check_cond([#condition{label = open_srv_day, op = Op,
		       val = Val}
	    | Rest]) ->
    Time = date:open_srv_day(),
    case comp(Op, Time, Val) of
      true -> check_cond(Rest);
      _ -> false
    end;
check_cond([_ | Rest]) -> check_cond(Rest).

comp(ue, Val, TargetVal) -> Val =/= TargetVal;
comp(eq, Val, TargetVal) -> Val =:= TargetVal;
comp(lt, Val, TargetVal) -> Val < TargetVal;
comp(gt, Val, TargetVal) -> Val > TargetVal;
comp(le, Val, TargetVal) -> Val =< TargetVal;
comp(ge, Val, TargetVal) -> Val >= TargetVal;
comp(include, L, TargetVal) ->
    lists:member(TargetVal, L);
comp(not_in, L, TargetVal) ->
    lists:member(TargetVal, L) =:= false.

info(Info) -> holiday_petard_mgr ! Info.

cast(Info) -> gen_server:cast(holiday_petard_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_petard_mgr, Info,
			       10000)
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
	    {__Pidholiday_petard_mgr111, _,
	     {__Levelholiday_petard_mgr111,
	      __Tracesholiday_petard_mgr111}}
		when __Levelholiday_petard_mgr111 band 8 /= 0 orelse
		       __Tracesholiday_petard_mgr111 /= [] ->
		lager:do_log(error,
			     [{module, holiday_petard_mgr}, {function, call},
			      {line, 111}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_petard_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_petard_mgr111,
			     __Tracesholiday_petard_mgr111, lager_event,
			     __Pidholiday_petard_mgr111);
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
    gen_server:start_link({local, holiday_petard_mgr},
			  holiday_petard_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_petard_mgr117, _,
       {__Levelholiday_petard_mgr117,
	__Tracesholiday_petard_mgr117}}
	  when __Levelholiday_petard_mgr117 band 64 /= 0 orelse
		 __Tracesholiday_petard_mgr117 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_petard_mgr}, {function, init},
			{line, 117}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_petard_mgr]),
		       none, 4096, 64, __Levelholiday_petard_mgr117,
		       __Tracesholiday_petard_mgr117, lager_event,
		       __Pidholiday_petard_mgr117);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(petard_red_packet,
			"dets/petard_red_packet.dets", #petard_red_packet.id,
			set),
    d_ets_lib:load_dets_to_ets(petard_red_packet,
			       undefined),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_petard_mgr127, _,
       {__Levelholiday_petard_mgr127,
	__Tracesholiday_petard_mgr127}}
	  when __Levelholiday_petard_mgr127 band 64 /= 0 orelse
		 __Tracesholiday_petard_mgr127 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_petard_mgr}, {function, init},
			{line, 127}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_petard_mgr]), none,
		       4096, 64, __Levelholiday_petard_mgr127,
		       __Tracesholiday_petard_mgr127, lager_event,
		       __Pidholiday_petard_mgr127);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_petard_mgr135, _,
	     {__Levelholiday_petard_mgr135,
	      __Tracesholiday_petard_mgr135}}
		when __Levelholiday_petard_mgr135 band 8 /= 0 orelse
		       __Tracesholiday_petard_mgr135 /= [] ->
		lager:do_log(error,
			     [{module, holiday_petard_mgr},
			      {function, handle_call}, {line, 135},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_petard_mgr135,
			     __Tracesholiday_petard_mgr135, lager_event,
			     __Pidholiday_petard_mgr135);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_petard_mgr, 136, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_petard_mgr148, _,
	     {__Levelholiday_petard_mgr148,
	      __Tracesholiday_petard_mgr148}}
		when __Levelholiday_petard_mgr148 band 8 /= 0 orelse
		       __Tracesholiday_petard_mgr148 /= [] ->
		lager:do_log(error,
			     [{module, holiday_petard_mgr},
			      {function, handle_info}, {line, 148},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_petard_mgr148,
			     __Tracesholiday_petard_mgr148, lager_event,
			     __Pidholiday_petard_mgr148);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_petard_mgr, 149, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_petard_mgr154, _,
       {__Levelholiday_petard_mgr154,
	__Tracesholiday_petard_mgr154}}
	  when __Levelholiday_petard_mgr154 band 64 /= 0 orelse
		 __Tracesholiday_petard_mgr154 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_petard_mgr}, {function, terminate},
			{line, 154}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelholiday_petard_mgr154,
		       __Tracesholiday_petard_mgr154, lager_event,
		       __Pidholiday_petard_mgr154);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_petard_mgr166, _,
	     {__Levelholiday_petard_mgr166,
	      __Tracesholiday_petard_mgr166}}
		when __Levelholiday_petard_mgr166 band 8 /= 0 orelse
		       __Tracesholiday_petard_mgr166 /= [] ->
		lager:do_log(error,
			     [{module, holiday_petard_mgr},
			      {function, do_handle_call}, {line, 166},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_petard_mgr166,
			     __Tracesholiday_petard_mgr166, lager_event,
			     __Pidholiday_petard_mgr166);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_petard_mgr, 167, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call({add_score, Type, Num}, _From, State) ->
    Score = get_score(Type),
    OldScore = sys_env:get(total_petard_score, 0),
    NewScore = OldScore + Score * Num,
    role_group:apply(world,
		     {holiday_petard, apply_ref_petard_reward, []}),
    sys_env:save(total_petard_score, NewScore),
    {reply, NewScore, State};
do_handle_call({add_score_and_get_id, Type, Num,
		RedLimitNum},
	       _From, State) ->
    Score = get_score(Type),
    OldScore = sys_env:get(total_petard_score, 0),
    NewScore = OldScore + Score * Num,
    sys_env:save(total_petard_score, NewScore),
    OldId1 = sys_env:get(red_packet_id, 1),
    OldId2 = OldId1 + min(Num, RedLimitNum) - 1,
    sys_env:save(red_packet_id, OldId1 + Num),
    role_group:apply(world,
		     {holiday_petard, apply_ref_petard_reward, []}),
    {reply, {NewScore, {OldId1, OldId2}}, State};
do_handle_call({get_red_packet, Rid, Name, Lev, FaceId,
		AvatarBaseId, Id},
	       _From, State) ->
    Now = date:unixtime(),
    Reply = case ets:lookup(petard_red_packet, Id) of
	      [RedPacket = #petard_red_packet{name = SendName,
					      face_id = SendFaceId,
					      avatar_bid = SendAvatarBid,
					      num = Num, max_num = MaxNum,
					      end_time = EndTime,
					      must_not = MustNot, mems = Mems}
	       | _] ->
		  case Num < MaxNum of
		    true ->
			case Now < EndTime of
			  true ->
			      {NewMustNot, RewardList} =
				  holiday_petard:get_petard_award(0, MustNot, 1,
								  []),
			      GetRedPacketInfo = #get_red_packet_info{r_id =
									  Rid,
								      red_id =
									  Id,
								      name =
									  Name,
								      lev = Lev,
								      face_id =
									  FaceId,
								      avatar_bid
									  =
									  AvatarBaseId,
								      time =
									  Now,
								      item =
									  RewardList},
			      Flag = util:if_true(Num + 1 >= MaxNum, 1, 0),
			      NewRedPacket = RedPacket#petard_red_packet{num =
									     Num
									       +
									       1,
									 is_max
									     =
									     Flag,
									 must_not
									     =
									     NewMustNot,
									 mems =
									     [GetRedPacketInfo
									      | Mems]},
			      d_ets_lib:save_d_ets(petard_red_packet,
						   NewRedPacket),
			      BroadCastList = sys_env:get(red_packet_broadcast,
							  []),
			      NewBroadCastList = lists:sublist([GetRedPacketInfo
								| BroadCastList],
							       holiday_petard_data:get_const(broadcast_num)),
			      sys_env:save(red_packet_broadcast,
					   NewBroadCastList),
			      {true, lang:get(<<"领取成功"/utf8>>), Id,
			       [GetRedPacketInfo | Mems], Num + 1, MaxNum,
			       EndTime, RewardList, SendName, SendFaceId,
			       SendAvatarBid};
			  _ -> {false, lang:get(<<"该红包已过期"/utf8>>)}
			end;
		    _ -> {false, lang:get(<<"红包已领取完毕！请重新选择！"/utf8>>)}
		  end;
	      _ -> {false, lang:get(<<"无法领取该红包"/utf8>>)}
	    end,
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_petard_mgr226, _,
	     {__Levelholiday_petard_mgr226,
	      __Tracesholiday_petard_mgr226}}
		when __Levelholiday_petard_mgr226 band 8 /= 0 orelse
		       __Tracesholiday_petard_mgr226 /= [] ->
		lager:do_log(error,
			     [{module, holiday_petard_mgr},
			      {function, do_handle_info}, {line, 226},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_petard_mgr226,
			     __Tracesholiday_petard_mgr226, lager_event,
			     __Pidholiday_petard_mgr226);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_petard_mgr, 227, _Reason}),
	  {noreply, State}
    end;
do_handle_info({get_alive_num_timer}, State) ->
    BaseMaxScore =
	holiday_petard_data:get_const(base_max_score),
    AliveNum = max(get_alive_num(), 1),
    Pro = get_pro(AliveNum) / 1000,
    RealMaxScore = round(BaseMaxScore * Pro),
    RealMaxScore = sys_env:save(real_max_score,
				RealMaxScore),
    role_group:apply(world,
		     {holiday_petard, apply_ref_petard_reward, []}),
    {noreply, State};
do_handle_info({check}, State) ->
    check(), {noreply, State};
do_handle_info({send_mail}, State) ->
    Now = date:unixtime(),
    {_, EndTime, _} = sys_env:get(holiday_petard_arg,
				  {0, 0, 0}),
    Time = EndTime - 86400 - Now + util:rand(60, 180),
    case Time > 0 of
      true ->
	  util:set_timer(notice_timer, Time, {send_notice_mail});
      _ -> skip
    end,
    {noreply, State};
do_handle_info({send_notice_mail}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_petard_mgr253, _,
       {__Levelholiday_petard_mgr253,
	__Tracesholiday_petard_mgr253}}
	  when __Levelholiday_petard_mgr253 band 64 /= 0 orelse
		 __Tracesholiday_petard_mgr253 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_petard_mgr},
			{function, do_handle_info}, {line, 253},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "花火大会提醒使用", none, 4096, 64,
		       __Levelholiday_petard_mgr253,
		       __Tracesholiday_petard_mgr253, lager_event,
		       __Pidholiday_petard_mgr253);
      _ -> ok
    end,
    case holiday_lib:get_open_holiday([3037, 93037, 993037])
	of
      #holiday{condition = Conds} ->
	  EndTime = date:unixtime() + 3600 * 24,
	  mail:global_send(#gmail{id = holiday_petard_notice,
				  end_time = EndTime,
				  subject = lang:get(<<"花火大会活动提醒"/utf8>>),
				  content =
				      lang:get(<<"亲爱的冒险者大人，花火大会活动即将结束，您若有未使用的节日活动道具（含流星弹、礼花炮、花火"
						 "积分），请及时使用与兑换，烟花道具及积分将在活动结束后回收处理"/utf8>>),
				  conds = Conds});
      _ -> skip
    end,
    {noreply, State};
do_handle_info({calc_self_add}, State) ->
    Now = date:unixtime(),
    BaseMaxScore =
	holiday_petard_data:get_const(base_max_score),
    MaxScore = sys_env:get(real_max_score, BaseMaxScore),
    SelfAddList = holiday_petard_data:self_add_list(),
    SelfAddInfoList = [#self_add_info{id = Id,
				      time = Now + 86400 * (Id - 1) + 30,
				      score = round(MaxScore * Pro / 1000),
				      status = 0, total_time = TotalTime,
				      interval = Interval}
		       || {Id, Pro, Interval, TotalTime} <- SelfAddList],
    NewSelfAddInfoList = lists:keysort(#self_add_info.id,
				       SelfAddInfoList),
    sys_env:save(self_add_info, NewSelfAddInfoList),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_petard_mgr270, _,
       {__Levelholiday_petard_mgr270,
	__Tracesholiday_petard_mgr270}}
	  when __Levelholiday_petard_mgr270 band 64 /= 0 orelse
		 __Tracesholiday_petard_mgr270 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_petard_mgr},
			{function, do_handle_info}, {line, 270},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("--------------处理了自增条件----------~w------------"
				     "------\n",
				     [NewSelfAddInfoList]),
		       none, 4096, 64, __Levelholiday_petard_mgr270,
		       __Tracesholiday_petard_mgr270, lager_event,
		       __Pidholiday_petard_mgr270);
      _ -> ok
    end,
    set_day_self_add(NewSelfAddInfoList, Now),
    {noreply, State};
do_handle_info({day_self_add_check_timer,
		SelfAddInfo = #self_add_info{id = Id, score = Score,
					     interval = Interval,
					     total_time = TotalTime}},
	       State) ->
    Now = date:unixtime(),
    sys_env:save(day_self_add_info, SelfAddInfo),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_petard_mgr276, _,
       {__Levelholiday_petard_mgr276,
	__Tracesholiday_petard_mgr276}}
	  when __Levelholiday_petard_mgr276 band 64 /= 0 orelse
		 __Tracesholiday_petard_mgr276 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_petard_mgr},
			{function, do_handle_info}, {line, 276},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("----------------------------每天自增信息----------~"
				     "w------------------\n",
				     [SelfAddInfo]),
		       none, 4096, 64, __Levelholiday_petard_mgr276,
		       __Tracesholiday_petard_mgr276, lager_event,
		       __Pidholiday_petard_mgr276);
      _ -> ok
    end,
    EveryGoldScore = sys_env:get(every_gold_score, 0),
    NewEveryGoldScore = EveryGoldScore +
			  round(Score / (3600 * TotalTime / Interval)),
    sys_env:save(every_gold_score, NewEveryGoldScore),
    sys_env:save(every_gold_time, Now + Interval - 1),
    util:set_timer(every_self_add_check_timer, Interval - 1,
		   {every_self_add_check_timer}),
    OldSelfAddInfoList = sys_env:get(self_add_info),
    NewSelfAddInfoList = lists:keyreplace(Id,
					  #self_add_info.id, OldSelfAddInfoList,
					  SelfAddInfo#self_add_info{status =
									1}),
    sys_env:save(self_add_info, NewSelfAddInfoList),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_petard_mgr286, _,
       {__Levelholiday_petard_mgr286,
	__Tracesholiday_petard_mgr286}}
	  when __Levelholiday_petard_mgr286 band 64 /= 0 orelse
		 __Tracesholiday_petard_mgr286 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_petard_mgr},
			{function, do_handle_info}, {line, 286},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("----------------------------执行了天定时----------~"
				     "w------------------\n",
				     [NewSelfAddInfoList]),
		       none, 4096, 64, __Levelholiday_petard_mgr286,
		       __Tracesholiday_petard_mgr286, lager_event,
		       __Pidholiday_petard_mgr286);
      _ -> ok
    end,
    set_day_self_add(NewSelfAddInfoList, Now),
    {noreply, State};
do_handle_info({every_self_add_check_timer}, State) ->
    Now = date:unixtime(),
    Time = sys_env:get(every_gold_time, 0),
    case Now >= Time of
      true ->
	  case sys_env:get(day_self_add_info, 0) of
	    #self_add_info{score = Score, interval = Interval,
			   total_time = TotalTime} ->
		EveryGoldScore = sys_env:get(every_gold_score, 0),
		PetardScore = sys_env:get(total_petard_score, 0),
		case PetardScore < EveryGoldScore of
		  true ->
		      sys_env:save(total_petard_score, EveryGoldScore),
		      role_group:apply(world,
				       {holiday_petard, apply_ref_petard_reward,
					[]});
		  _ -> skip
		end,
		NewEveryGoldScore = EveryGoldScore +
				      round(Score /
					      (3600 * TotalTime / Interval)),
		sys_env:save(every_gold_score, NewEveryGoldScore),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_petard_mgr307, _,
		   {__Levelholiday_petard_mgr307,
		    __Tracesholiday_petard_mgr307}}
		      when __Levelholiday_petard_mgr307 band 64 /= 0 orelse
			     __Tracesholiday_petard_mgr307 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_petard_mgr},
				    {function, do_handle_info}, {line, 307},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("--------------执行了定时自增----------~w------------"
						 "------\n",
						 [{EveryGoldScore,
						   NewEveryGoldScore}]),
				   none, 4096, 64, __Levelholiday_petard_mgr307,
				   __Tracesholiday_petard_mgr307, lager_event,
				   __Pidholiday_petard_mgr307);
		  _ -> ok
		end,
		NewTime = Time + Interval - 1,
		sys_env:save(every_gold_time, NewTime),
		util:set_timer(every_self_add_check_timer, Interval - 1,
			       {every_self_add_check_timer});
	    _ -> skip
	  end;
      _ ->
	  util:set_timer(every_self_add_check_timer, Time - Now,
			 {every_self_add_check_timer})
    end,
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

set_day_self_add(SelfAddInfoList, Now) ->
    case get_recent_time(SelfAddInfoList, Now) of
      SelfAdd = #self_add_info{time = Time} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_petard_mgr325, _,
	     {__Levelholiday_petard_mgr325,
	      __Tracesholiday_petard_mgr325}}
		when __Levelholiday_petard_mgr325 band 64 /= 0 orelse
		       __Tracesholiday_petard_mgr325 /= [] ->
		lager:do_log(info,
			     [{module, holiday_petard_mgr},
			      {function, set_day_self_add}, {line, 325},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("--------------设了天定时检查----------~w------------"
					   "------\n",
					   [SelfAdd]),
			     none, 4096, 64, __Levelholiday_petard_mgr325,
			     __Tracesholiday_petard_mgr325, lager_event,
			     __Pidholiday_petard_mgr325);
	    _ -> ok
	  end,
	  util:set_timer(day_self_add_check_timer,
			 max(0, Time - Now),
			 {day_self_add_check_timer, SelfAdd});
      _ -> skip
    end.

get_recent_time([], _Now) -> false;
get_recent_time([SelfAdd = #self_add_info{time = Time,
					  status = Status}
		 | Rest],
		Now) ->
    case Time > Now andalso Status =:= 0 of
      true -> SelfAdd;
      _ -> get_recent_time(Rest, Now)
    end.

get_score(Type) ->
    Type1 = holiday_petard_data:get_const(meteor_bid),
    Type2 = holiday_petard_data:get_const(firework_bid),
    Score = case Type of
	      Type1 -> holiday_petard_data:get_const(meteor_score);
	      Type2 -> holiday_petard_data:get_const(firework_score);
	      _ -> 0
	    end,
    Score.

get_alive_num() ->
    LimitDay = 1,
    LimitTime = date:unixtime() - 86400 * LimitDay,
    case
      db:get_one("select count(*) from role where logout_time "
		 "> ? or login_time > ?",
		 [LimitTime, LimitTime], 60000)
	of
      {ok, Num} -> Num;
      _ -> 0
    end.

get_pro(AliveNum) ->
    ProList = lists:keysort(2,
			    holiday_petard_data:score_pro_list()),
    do_get_pro(ProList, AliveNum).

do_get_pro([], _AliveNum) -> 800;
do_get_pro([{_, Min, Max, Pro} | Rest], AliveNum) ->
    case AliveNum >= Min andalso AliveNum =< Max of
      true -> Pro;
      _ -> do_get_pro(Rest, AliveNum)
    end.


