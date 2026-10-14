-file("src/mod/holiday_snatch/holiday_snatch_lib.erl",
      1).

-module(holiday_snatch_lib).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{holiday_snatch_log,
		 [log_id, win_num, win_role_info, join_num, max_num,
		  time, award, award_name, ext]},
		{holiday_snatch_role_info,
		 [sid, num, open_srv_time, merge_srvs, ext]},
		{holiday_snatch_info,
		 [pos, round, id, num, num_list, win_num, state,
		  state_time, rand_list, win_role_info, ext]},
		{holiday_snatch, [zone_id, info, ext]},
		{m_holiday_snatch,
		 [ver, camp_id, buy_log, old_data, ext]},
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

-export([init/0, login/1, info/1, buy/3, fire/0,
	 get_win_info_pos/2, get_all_log/0, get_role_log/1]).

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

-file("src/mod/holiday_snatch/holiday_snatch_lib.erl",
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

-file("src/mod/holiday_snatch/holiday_snatch_lib.erl",
      19).

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

-file("src/mod/holiday_snatch/holiday_snatch_lib.erl",
      20).

-file("inc/holiday_snatch.hrl", 1).

-record(m_holiday_snatch,
	{ver = 1, camp_id = 0, buy_log = [], old_data = [],
	 ext = []}).

-record(holiday_snatch,
	{zone_id = 0, info = [], ext = []}).

-record(holiday_snatch_info,
	{pos = 0, round = 1, id = 0, num = 0, num_list = [],
	 win_num = 0, state = 0, state_time = 0, rand_list = [],
	 win_role_info = #{}, ext = []}).

-record(holiday_snatch_role_info,
	{sid = <<>>, num = 0, open_srv_time = 0,
	 merge_srvs = [], ext = []}).

-record(holiday_snatch_log,
	{log_id = {0, 0}, win_num = 0, win_role_info = #{},
	 join_num = 0, max_num = 0, time = 0, award = [],
	 award_name = <<>>, ext = []}).

-file("src/mod/holiday_snatch/holiday_snatch_lib.erl",
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

-file("src/mod/holiday_snatch/holiday_snatch_lib.erl",
      22).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_snatch/holiday_snatch_lib.erl",
      23).

init() -> #m_holiday_snatch{}.

login(Role = #role{m_holiday_snatch =
		       HS = #m_holiday_snatch{camp_id = CampId}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3029, 93029, 993029])
	of
      #holiday{camp_id = CampId} -> {ok, Role};
      #holiday{camp_id = CampId2} ->
	  OldData = util:if_true(CampId == 0, [], [HS]),
	  NHS = #m_holiday_snatch{camp_id = CampId2,
				  old_data = OldData},
	  NRole = Role#role{m_holiday_snatch = NHS},
	  {ok, NRole};
      _ -> {ok, Role}
    end.

to_push_info(_Role, [], L) -> L;
to_push_info(Role = #role{m_holiday_snatch =
			      #m_holiday_snatch{buy_log = BuyLogs}},
	     [Info = #holiday_snatch_info{pos = Pos, round = Round,
					  ext = Ext}
	      | List],
	     L) ->
    BuyNum = case lists:keyfind({Pos, Round}, 1, BuyLogs) of
	       {_, _, T} -> length(T);
	       _ -> 0
	     end,
    PushInfo = Info#holiday_snatch_info{ext =
					    [{1, BuyNum} | Ext]},
    to_push_info(Role, List, [PushInfo | L]).

-spec info(#role{}) -> ok.

info(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [3029, 93029, 993029])
	of
      #holiday{} ->
	  {StateName, Ts, TimeOut} =
	      sys_env:get(holiday_snatch_state),
	  State = util:if_true(StateName == open, 1, 0),
	  List = holiday_snatch_mgr:get_info(),
	  PushInfo = to_push_info(Role, List, []),
	  StateTime = (Ts + TimeOut) div 1000,
	  Logs = holiday_snatch_mgr:get_log(),
	  PushLogT = case length(Logs) =< 3 of
		       true -> Logs;
		       _ -> {T, _} = lists:split(3, Logs), T
		     end,
	  PushLog = [to_push_log(Log) || Log <- PushLogT],
	  sys_conn:pack_send(25700,
			     {State, StateTime, PushInfo, PushLog});
      _ -> ok
    end,
    ok.

buy(Role = #role{id = RoleId, name = Name, lev = Lev,
		 face_id = FaceId,
		 m_holiday_snatch =
		     M = #m_holiday_snatch{buy_log = BuyLogs}},
    Pos, Num) ->
    case check_can_buy(Role) of
      ok ->
	  List = holiday_snatch_mgr:get_info(),
	  case lists:keyfind(Pos, #holiday_snatch_info.pos, List)
	      of
	    #holiday_snatch_info{id = Id, round = Round} ->
		Expend = holiday_snatch_data:get_expend(Id),
		Loss = format:val_to_loss([{K, V * Num}
					   || {K, V} <- Expend],
					  holiday_snatch_buy),
		case role_gain:do(Role, Loss) of
		  {ok, NRole} ->
		      Pid = sys_env:get(holiday_snatch_pid),
		      case catch gen_server:call(Pid,
						 {sync_role_buy,
						  #{role_id => RoleId,
						    name => Name, pos => Pos,
						    lev => Lev,
						    face_id => FaceId,
						    num => Num}},
						 5000)
			  of
			{true, NumList} ->
			    log:log_gain(Loss, Role, NRole,
					 <<"运营活动_一元夺宝"/utf8>>,
					 util:fbin("位置:~w 数量:~w", [Pos, Num])),
			    NewBuyLogs = case lists:keyfind({Pos, Round}, 1,
							    BuyLogs)
					     of
					   {{Pos, Round}, _, OldNum} ->
					       lists:keystore({Pos, Round}, 1,
							      BuyLogs,
							      {{Pos, Round}, Id,
							       NumList ++
								 OldNum});
					   _ ->
					       [{{Pos, Round}, Id, NumList}
						| BuyLogs]
					 end,
			    {ok,
			     NRole#role{m_holiday_snatch =
					    M#m_holiday_snatch{buy_log =
								   NewBuyLogs}}};
			{false, Msg} -> {false, Msg};
			_ERR ->
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
			      {__Pidholiday_snatch_lib101, _,
			       {__Levelholiday_snatch_lib101,
				__Tracesholiday_snatch_lib101}}
				  when __Levelholiday_snatch_lib101 band 8 /= 0
					 orelse
					 __Tracesholiday_snatch_lib101 /= [] ->
				  lager:do_log(error,
					       [{module, holiday_snatch_lib},
						{function, buy}, {line, 101},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("勇者夺宝购买同步消息返回错误:~w",
							     [_ERR]),
					       none, 4096, 8,
					       __Levelholiday_snatch_lib101,
					       __Tracesholiday_snatch_lib101,
					       lager_event,
					       __Pidholiday_snatch_lib101);
			      _ -> ok
			    end,
			    {false, lang:get(<<"参数错误2"/utf8>>)}
		      end;
		  {false, #loss{msg = Msg}} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"参数错误"/utf8>>)}
	  end;
      {false, Msg} -> {false, Msg}
    end.

check_can_buy(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [3029, 93029, 993029])
	of
      #holiday{} ->
	  case sys_env:get(holiday_snatch_state) of
	    {open, _, _} -> ok;
	    _ -> {false, lang:get(<<"活动未到开启时间"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec get_win_info_pos(#role{}, pos_integer()) -> ok.

get_win_info_pos(#role{m_holiday_snatch =
			   #m_holiday_snatch{buy_log = BuyLogs}},
		 Pos) ->
    List = holiday_snatch_mgr:get_info(),
    case lists:keyfind(Pos, #holiday_snatch_info.pos, List)
	of
      #holiday_snatch_info{id = Id, round = Round,
			   state = State, win_num = WinNum,
			   win_role_info = WinRoleInfo}
	  when State == 2 orelse State == 3 ->
	  BuyNums = case lists:keyfind({Pos, Round}, 1, BuyLogs)
			of
		      {_, _, L} -> L;
		      _ -> []
		    end,
	  RoleId = maps:get(role_id, WinRoleInfo, {0, <<>>}),
	  Name = maps:get(name, WinRoleInfo, <<>>),
	  FaceId = maps:get(face_id, WinRoleInfo, 0),
	  Lev = maps:get(lev, WinRoleInfo, 1),
	  IsWin = util:if_true(lists:member(WinNum, BuyNums), 1,
			       0),
	  sys_conn:pack_send(25702,
			     {IsWin, WinNum, RoleId, Name, FaceId, Lev, Id,
			      BuyNums}),
	  ok;
      _ ->
	  sys_conn:pack_send(25702,
			     {0, 0, {0, <<>>}, <<>>, 0, 1, 0, []}),
	  ok
    end.

-spec get_role_log(#role{}) -> ok.

get_role_log(#role{m_holiday_snatch =
		       #m_holiday_snatch{buy_log = BuyLogs}}) ->
    Infos = holiday_snatch_mgr:get_info(),
    Logs = holiday_snatch_mgr:get_log(),
    Fun = fun ({{Pos, Round}, Id, BuyNums}, Acc) ->
		  case lists:keyfind({Pos, Round},
				     #holiday_snatch_log.log_id, Logs)
		      of
		    #holiday_snatch_log{win_num = WinNum, time = Time,
					award_name = AwardName,
					award = Award} ->
			IsWin = util:if_true(lists:member(WinNum, BuyNums), 1,
					     0),
			[{IsWin, WinNum, BuyNums, Time, AwardName, Award}
			 | Acc];
		    _ ->
			AwardName = holiday_snatch_data:get_award_name(Id),
			Award = holiday_snatch_data:get_award(Id),
			case lists:keyfind(Pos, #holiday_snatch_info.pos, Infos)
			    of
			  #holiday_snatch_info{round = Round} ->
			      [{0, 0, BuyNums, 0, AwardName, Award} | Acc];
			  _ -> [{0, 1, BuyNums, 0, AwardName, Award} | Acc]
			end
		  end
	  end,
    PushList = lists:sublist(lists:foldl(Fun, [], BuyLogs),
			     30),
    sys_conn:pack_send(25704, {PushList}).

-spec get_all_log() -> ok.

get_all_log() ->
    Logs = lists:sublist(holiday_snatch_mgr:get_log(), 30),
    PushLogs = [to_push_log(Log) || Log <- Logs],
    sys_conn:pack_send(25703, {PushLogs}).

to_push_log(#holiday_snatch_log{win_role_info =
				    WinRoleInfo,
				join_num = JoinNum, max_num = MaxNum,
				time = Time, award_name = AwardName,
				award = Award}) ->
    WinName = maps:get(name, WinRoleInfo, <<>>),
    {WinName, JoinNum, MaxNum, Time, AwardName, Award}.

fire() ->
    case holiday_lib:get_open_holiday([3029, 93029, 993029])
	of
      #holiday{camp_id = CampId} ->
	  Sid = sys_lib:srv_id(),
	  case lists:member(Sid,
			    [<<"dev_1">>, <<"symlf_1">>, <<"release2_2">>,
			     <<"symlf_7">>])
	      of
	    true ->
		big_world_lib:cast(center, c_holiday_snatch_mgr, info,
				   [{holiday_reset, CampId}]),
		case big_world_lib:center_node() ==
		       cluster_lib:center_node()
		    of
		  true -> ok;
		  _ ->
		      cluster_lib:cast(center, c_holiday_snatch_mgr, info,
				       [{holiday_reset, CampId}])
		end,
		ok;
	    _ -> ok
	  end;
      _ -> ok
    end.


