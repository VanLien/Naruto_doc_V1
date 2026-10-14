-file("src/mod/planes/planes_war_order.erl", 1).

-module(planes_war_order).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{m_star, [ver, star_list, fetter_list, all_attr]},
		{star_tower_replay, [tower, replays]},
		{tower_replay_data,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{m_star_divination,
		 [ver, luck, quality, all_count, flag, ref_count,
		  day_gold_count, day_hun_count]},
		{m_star_tower, [ver, max_tower, award_list]},
		{star,
		 [ver, set_id, break_lev, lev, natals, add_attr,
		  fetter_attr, set_skill_id, power]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{m_planes_war_order,
		 [ver, period, period_day, end_time, score, rmb_status,
		  card, lev_reward, start_time, ext]},
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

-export([zero_flush/1, init/0, login/1,
	 init_war_order/1, apply_timer/1, add_score/3,
	 push_base/1, take_lev_reward/2, fire/2,
	 is_charge_planes_war_order/2]).

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

-file("src/mod/planes/planes_war_order.erl", 21).

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

-file("src/mod/planes/planes_war_order.erl", 22).

-file("inc/planes_war_order.hrl", 1).

-record(m_planes_war_order,
	{ver = 1, period = 0, period_day = 0, end_time = 0,
	 score = 0, rmb_status = 0, card = [], lev_reward = [],
	 start_time = 0, ext = []}).

-file("src/mod/planes/planes_war_order.erl", 23).

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

-file("src/mod/planes/planes_war_order.erl", 24).

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

-file("src/mod/planes/planes_war_order.erl", 25).

-file("inc/star.hrl", 1).

-record(star,
	{ver = 1  :: non_neg_integer(),
	 set_id = 0  :: non_neg_integer(),
	 break_lev = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), natals = []  :: list(),
	 add_attr = []  :: list(), fetter_attr = []  :: list(),
	 set_skill_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(m_star_tower,
	{ver = 1  :: non_neg_integer(),
	 max_tower = 0  :: non_neg_integer(),
	 award_list = []  :: list()}).

-record(m_star_divination,
	{ver = 1  :: non_neg_integer(),
	 luck = 1  :: non_neg_integer(),
	 quality = 1  :: non_neg_integer(),
	 all_count = 0  :: non_neg_integer(),
	 flag = 0  :: non_neg_integer(),
	 ref_count = 0  :: non_neg_integer(),
	 day_gold_count = 0  :: non_neg_integer(),
	 day_hun_count = 0  :: non_neg_integer()}).

-record(tower_replay_data,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(star_tower_replay,
	{tower = 0  :: non_neg_integer(),
	 replays = []  :: [#tower_replay_data{}]}).

-record(m_star,
	{ver = 1  :: non_neg_integer(),
	 star_list = []  :: [#star{}],
	 fetter_list = []  :: list(), all_attr = []  :: list()}).

-file("src/mod/planes/planes_war_order.erl", 26).

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

-file("src/mod/planes/planes_war_order.erl", 27).

reissue(Role = #role{id = RoleId, name = Name,
		     m_planes_war_order =
			 WarOrder = #m_planes_war_order{period = OldPeriod,
							rmb_status =
							    OldRmbStatus,
							score = OldScore}}) ->
    case var:get_var(Role, other, 3117, 0) of
      0 ->
	  case OldRmbStatus of
	    1 when OldPeriod =/= 0 ->
		NRole = var:set_var(Role, other, 3117, 1),
		BuyGet = planes_war_order_data:get_buy_get(OldPeriod),
		NewScore = OldScore + BuyGet,
		NRole1 = NRole#role{m_planes_war_order =
					WarOrder#m_planes_war_order{score =
									NewScore}},
		{ok, NRole2} = mail:add(NRole1,
					{util:fbin("征战之证赠送邮件", []),
					 util:fbin("亲爱的冒险者大人，由于位面征战之证进阶卡规则调整，您已激活进阶卡，系统为您新增激活5阶奖励"
						   "，请前往位面玩法征战之证领取，祝游戏愉快",
						   []),
					 [], [], <<"征战之证赠送邮件"/utf8>>,
					 86400 + date:unixtime()}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidplanes_war_order39, _,
		   {__Levelplanes_war_order39, __Tracesplanes_war_order39}}
		      when __Levelplanes_war_order39 band 64 /= 0 orelse
			     __Tracesplanes_war_order39 /= [] ->
		      lager:do_log(info,
				   [{module, planes_war_order},
				    {function, reissue}, {line, 39},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~w，Name:~ts执行了位面战令胜场数增加",
						 [RoleId, Name]),
				   none, 4096, 64, __Levelplanes_war_order39,
				   __Tracesplanes_war_order39, lager_event,
				   __Pidplanes_war_order39);
		  _ -> ok
		end,
		{ok, NRole2};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidplanes_war_order42, _,
		   {__Levelplanes_war_order42, __Tracesplanes_war_order42}}
		      when __Levelplanes_war_order42 band 64 /= 0 orelse
			     __Tracesplanes_war_order42 /= [] ->
		      lager:do_log(info,
				   [{module, planes_war_order},
				    {function, reissue}, {line, 42},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家Name:~ts不执行位面战令胜场数增加",
						 [Name]),
				   none, 4096, 64, __Levelplanes_war_order42,
				   __Tracesplanes_war_order42, lager_event,
				   __Pidplanes_war_order42);
		  _ -> ok
		end,
		NRole1 = var:set_var(Role, other, 3117, 2),
		{ok, NRole1}
	  end;
      _ -> {ok, Role}
    end.

init() -> #m_planes_war_order{}.

init_war_order(Role = #role{lev = Lev,
			    m_planes_war_order =
				WarOrder = #m_planes_war_order{period =
								   Period}}) ->
    case planes:planes_check_update_time(Role) of
      {ok, Time} when is_integer(Time) ->
	  OpenDay = game_lib:server_open_time(day),
	  LimitLev = planes_war_order_data:get_const(limit_lev),
	  LimitOpenDay =
	      planes_war_order_data:get_const(open_srv_day),
	  NewRole = case Period =:= 0 of
		      true
			  when Lev >= LimitLev andalso
				 OpenDay >= LimitOpenDay ->
			  PeriodDay = planes_war_order_data:get_period_day(1),
			  StartTime = date:unixtime({zero, Time}),
			  EndTime = StartTime + 86400 * PeriodDay - 1,
			  NRole = Role#role{m_planes_war_order =
						WarOrder#m_planes_war_order{start_time
										=
										StartTime,
									    period
										=
										1,
									    period_day
										=
										1,
									    end_time
										=
										EndTime,
									    score
										=
										0,
									    rmb_status
										=
										0,
									    card
										=
										[],
									    lev_reward
										=
										[]}},
			  Timer1 = #timer{id = secret_dun_war_order_point,
					  timeout = 2 * 1000, times = 1,
					  m = planes_war_order, f = apply_timer,
					  a = []},
			  NRole1 = role_timer:set(Timer1, NRole),
			  NRole1;
		      _ -> Role
		    end,
	  NewRole;
      _ -> Role
    end.

apply_timer(Role) ->
    sys_conn:pack_send(28618, {1}), {ok, Role}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role0 = #role{m_planes_war_order =
			#m_planes_war_order{period = Period}}) ->
    {ok, Role} = reissue(Role0),
    NewRole = case Period =:= 0 of
		true -> init_war_order(Role);
		_ -> Role
	      end,
    {ok, NewRole}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_planes_war_order =
			    #m_planes_war_order{period = 0}}) ->
    NewRole = init_war_order(Role), {ok, NewRole};
zero_flush(Role = #role{m_planes_war_order =
			    WarOrder = #m_planes_war_order{start_time =
							       StartTime,
							   period = Period}}) ->
    MaxPeriodDay =
	planes_war_order_data:get_period_day(Period),
    MaxPeriod = planes_war_order_data:max_period(),
    Now = date:unixtime(),
    NewPeriodDay = date:day_diff(StartTime, Now) + 1,
    NewRole = case NewPeriodDay > MaxPeriodDay of
		false ->
		    Role#role{m_planes_war_order =
				  WarOrder#m_planes_war_order{period_day =
								  NewPeriodDay}};
		_ ->
		    NRole = #role{m_planes_war_order = NewWarOrder} =
				award_mail(Role),
		    NewPeriodDay1 = NewPeriodDay rem MaxPeriodDay,
		    NewPeriodDay2 = util:if_true(NewPeriodDay1 =:= 0,
						 MaxPeriodDay, NewPeriodDay1),
		    NewStartTime = date:unixtime(zero) -
				     86400 * (NewPeriodDay2 - 1),
		    CrossPeriod = util:if_true(NewPeriodDay1 =:= 0,
					       trunc(NewPeriodDay /
						       MaxPeriodDay)
						 - 1,
					       trunc(NewPeriodDay /
						       MaxPeriodDay)),
		    NewPeriod = min(Period + CrossPeriod, MaxPeriod),
		    NewMaxPeriodDay =
			planes_war_order_data:get_period_day(NewPeriod),
		    NewEndTime = NewStartTime + 86400 * NewMaxPeriodDay - 1,
		    NRole1 = NRole#role{m_planes_war_order =
					    NewWarOrder#m_planes_war_order{period
									       =
									       NewPeriod,
									   start_time
									       =
									       NewStartTime,
									   period_day
									       =
									       NewPeriodDay2,
									   end_time
									       =
									       NewEndTime,
									   score
									       =
									       0,
									   rmb_status
									       =
									       0,
									   card
									       =
									       [],
									   lev_reward
									       =
									       []}},
		    Timer1 = #timer{id = secret_dun_war_order_point,
				    timeout = 2 * 1000, times = 1,
				    m = planes_war_order, f = apply_timer,
				    a = []},
		    NRole2 = role_timer:set(Timer1, NRole1),
		    NRole2
	      end,
    {ok, NewRole}.

award_mail(Role = #role{m_planes_war_order =
			    WarOrder = #m_planes_war_order{score = Score,
							   lev_reward =
							       LevReward,
							   period = Period,
							   rmb_status =
							       RmbStatus}}) ->
    Lev = planes_war_order_data:get_lev({Period, Score}),
    case planes_war_order_data:lev_reward_list(Period) of
      LevRewardCfg = [_ | _] ->
	  CanGetLevReward = [LevCfg
			     || LevCfg <- LevRewardCfg, Lev >= LevCfg],
	  Fun = fun (LevT, {AllRewardT, LevRewardT}) ->
			RewardT = planes_war_order_data:get_lev_reward({Period,
									LevT}),
			RmbRewardT =
			    planes_war_order_data:get_rmb_lev_reward({Period,
								      LevT}),
			case lists:keyfind(LevT, 1, LevRewardT) of
			  false ->
			      case RmbStatus == 1 of
				true ->
				    Reward1 = item_lib:merge(RewardT,
							     RmbRewardT),
				    NAllRewardT = item_lib:merge(Reward1,
								 AllRewardT),
				    NLevRewardT = lists:keystore(LevT, 1,
								 LevRewardT,
								 {LevT, 1, 1}),
				    {NAllRewardT, NLevRewardT};
				_ ->
				    case RewardT of
				      [_ | _] ->
					  NAllRewardT = item_lib:merge(RewardT,
								       AllRewardT),
					  NLevRewardT = lists:keystore(LevT, 1,
								       LevRewardT,
								       {LevT, 1,
									0}),
					  {NAllRewardT, NLevRewardT};
				      _ -> {AllRewardT, LevRewardT}
				    end
			      end;
			  {_, 1, 0} when RmbStatus == 1 ->
			      NAllRewardT = item_lib:merge(RmbRewardT,
							   AllRewardT),
			      NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
							   {LevT, 1, 1}),
			      {NAllRewardT, NLevRewardT};
			  _ -> {AllRewardT, LevRewardT}
			end
		end,
	  {AllReward, NewLevReward} = lists:foldl(Fun,
						  {[], LevReward},
						  CanGetLevReward),
	  case AllReward =:= [] of
	    true -> Role;
	    _ ->
		{Assets, Items} = format:split_assets_items(AllReward),
		{ok, NRole} = mail:add(Role,
				       {util:fbin(lang:get(<<"征战之证奖励补发"/utf8>>),
						  []),
					color:msg(lang:get(<<"亲爱的冒险者大人：\n这是您在上期~ts活动未领取的奖励，请查收！"/utf8>>),
						  [{green,
						    lang:get(<<"征战之证"/utf8>>)}]),
					Assets, Items, <<"征战之证奖励补发"/utf8>>,
					86400 + date:unixtime()}),
		NewRole = NRole#role{m_planes_war_order =
					 WarOrder#m_planes_war_order{lev_reward
									 =
									 NewLevReward}},
		NewRole
	  end;
      _ -> Role
    end.

-spec push_base(#role{}) -> ok.

push_base(#role{m_planes_war_order =
		    #m_planes_war_order{period = Period,
					period_day = PeriodDay,
					end_time = EndTime, score = Score,
					rmb_status = RmbStatus,
					lev_reward = LevReward}}) ->
    Lev = planes_war_order_data:get_lev({Period, Score}),
    sys_conn:pack_send(28616,
		       {Period, PeriodDay, EndTime, Lev, RmbStatus, Score,
			LevReward}),
    ok.

-spec take_lev_reward(#role{}, pos_integer()) -> {ok,
						  #role{}} |
						 {false, bitstring()}.

take_lev_reward(Role = #role{m_planes_war_order =
				 WarOrder = #m_planes_war_order{score = Score,
								lev_reward =
								    LevReward,
								period = Period,
								rmb_status =
								    RmbStatus}},
		0) ->
    Lev = planes_war_order_data:get_lev({Period, Score}),
    case planes_war_order_data:lev_reward_list(Period) of
      LevRewardCfg = [_ | _] ->
	  CanGetLevReward = [LevCfg
			     || LevCfg <- LevRewardCfg, Lev >= LevCfg],
	  Fun = fun (LevT, {AllRewardT, LevRewardT}) ->
			RewardT = planes_war_order_data:get_lev_reward({Period,
									LevT}),
			RmbRewardT =
			    planes_war_order_data:get_rmb_lev_reward({Period,
								      LevT}),
			case lists:keyfind(LevT, 1, LevRewardT) of
			  false ->
			      case RmbStatus == 1 of
				true ->
				    Reward1 = item_lib:merge(RewardT,
							     RmbRewardT),
				    NAllRewardT = item_lib:merge(Reward1,
								 AllRewardT),
				    NLevRewardT = lists:keystore(LevT, 1,
								 LevRewardT,
								 {LevT, 1, 1}),
				    {NAllRewardT, NLevRewardT};
				_ ->
				    case RewardT of
				      [_ | _] ->
					  NAllRewardT = item_lib:merge(RewardT,
								       AllRewardT),
					  NLevRewardT = lists:keystore(LevT, 1,
								       LevRewardT,
								       {LevT, 1,
									0}),
					  {NAllRewardT, NLevRewardT};
				      _ -> {AllRewardT, LevRewardT}
				    end
			      end;
			  {_, 1, 0} when RmbStatus == 1 ->
			      NAllRewardT = item_lib:merge(RmbRewardT,
							   AllRewardT),
			      NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
							   {LevT, 1, 1}),
			      {NAllRewardT, NLevRewardT};
			  _ -> {AllRewardT, LevRewardT}
			end
		end,
	  {AllReward, NewLevReward} = lists:foldl(Fun,
						  {[], LevReward},
						  CanGetLevReward),
	  case AllReward =:= [] of
	    true -> {false, lang:get(<<"没有可领取的奖励"/utf8>>)};
	    _ ->
		GL = format:val_to_gain(AllReward, planes_war_order),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, NRole} ->
		      log:log_gain(GL, Role, NRole, <<"位面战令"/utf8>>,
				   util:fbin("一键领取，等级~w，特权：~w，领取前~w",
					     [Lev, RmbStatus, LevReward])),
		      NewRole = NRole#role{m_planes_war_order =
					       WarOrder#m_planes_war_order{lev_reward
									       =
									       NewLevReward}},
		      push_base(NewRole),
		      {ok, NewRole}
		end
	  end;
      _ -> {false, lang:get(<<"当前不在活动期间"/utf8>>)}
    end;
take_lev_reward(Role, _) -> {ok, Role}.

-spec fire(#role{}, map()) -> {ok, #role{}}.

fire(Role = #role{name = Name,
		  m_planes_war_order =
		      WarOrder = #m_planes_war_order{period = Period,
						     card = CardL,
						     score = OldScore}},
     Opt = #{sn := Sn, package_id := PackageId,
	     money := Money}) ->
    case planes_war_order_data:charge({Period, PackageId})
	of
      CardId when is_integer(CardId) ->
	  case lists:keyfind(CardId, 1, CardL) of
	    false ->
		BuyGet = planes_war_order_data:get_buy_get(Period),
		Reward = planes_war_order_data:get_card_award({Period,
							       CardId}),
		Gain = format:val_to_gain(Reward, planes_war_order),
		case role_gain:do_notice(Role, Gain) of
		  {false, _} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidplanes_war_order251, _,
			 {__Levelplanes_war_order251,
			  __Tracesplanes_war_order251}}
			    when __Levelplanes_war_order251 band 8 /= 0 orelse
				   __Tracesplanes_war_order251 /= [] ->
			    lager:do_log(error,
					 [{module, planes_war_order},
					  {function, fire}, {line, 251},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w购买位面战令礼包~w失败",
						       [Role#role.name,
							CardId]),
					 none, 4096, 8,
					 __Levelplanes_war_order251,
					 __Tracesplanes_war_order251,
					 lager_event, __Pidplanes_war_order251);
			_ -> ok
		      end,
		      {ok, Role};
		  {ok, Role1} ->
		      NewCardL = lists:keystore(CardId, 1, CardL,
						{CardId, 1}),
		      NewScore = OldScore + BuyGet,
		      NewRole = Role1#role{m_planes_war_order =
					       WarOrder#m_planes_war_order{card
									       =
									       NewCardL,
									   rmb_status
									       =
									       1,
									   score
									       =
									       NewScore}},
		      log:log_gain(Gain, Role, NewRole, <<"位面战令"/utf8>>,
				   util:fbin("位面战令进阶卡:~w", [CardId])),
		      notice:broadcast(rumor_left_top,
				       color:msg(lang:get(<<"恭喜~ts玩家激活~ts进阶奖励，冒险大陆再添一位冒险勇士！"/utf8>>),
						 [{role, Name},
						  planes_war_order_data:period_name(Period)])),
		      push_base(NewRole),
		      {ok, NewRole}
		end;
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"位面战令"/utf8>>,
			       util:fbin("位面战令充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

-spec add_score(#role{}, pos_integer(),
		pos_integer()) -> #role{}.

add_score(Role = #role{m_planes_war_order =
			   WarOrder = #m_planes_war_order{period = Period,
							  score = Score}},
	  Floor, Difficult)
    when is_integer(Floor) andalso is_integer(Difficult) ->
    AddScore = planes_war_order_data:get_score({Period,
						Floor, Difficult}),
    NewScore = Score + AddScore,
    NewRole = Role#role{m_planes_war_order =
			    WarOrder#m_planes_war_order{score = NewScore}},
    push_base(NewRole),
    NewRole.

-spec is_charge_planes_war_order(#role{},
				 pos_integer()) -> boolean().

is_charge_planes_war_order(#role{m_planes_war_order =
				     #m_planes_war_order{period = Period,
							 card = CardL}},
			   ChargeId) ->
    case planes_war_order_data:charge({Period, ChargeId}) of
      CardId when is_integer(CardId) ->
	  case Period =:= 0 of
	    false ->
		case lists:keyfind(CardId, 1, CardL) of
		  false -> true;
		  _ -> false
		end;
	    _ -> false
	  end;
      _ -> true
    end.


