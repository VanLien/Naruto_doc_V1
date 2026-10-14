-file("src/mod/holiday/holiday_predict.erl", 1).

-module(holiday_predict).

-lager_records([{holiday,
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
		{gain_loss_opts,
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
		{holiday_predict_info,
		 [type, count, buy_list, rand_lists, flag]},
		{m_holiday_predict, [ver, camp_id, info]},
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

-export([login/1, zero_flush/1, init/0,
	 push_predict_info/1, open/2, buy_item/2, ref/2, buy/2,
	 get_free_ref_time/1, get_ref_time/2]).

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

-file("src/mod/holiday/holiday_predict.erl", 20).

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

-file("src/mod/holiday/holiday_predict.erl", 21).

-file("inc/holiday_predict.hrl", 1).

-record(m_holiday_predict,
	{ver = 1  :: non_neg_integer(), camp_id = 0,
	 info = []}).

-record(holiday_predict_info,
	{type = 0, count = 0, buy_list = [], rand_lists = [],
	 flag = 0}).

-file("src/mod/holiday/holiday_predict.erl", 22).

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

-file("src/mod/holiday/holiday_predict.erl", 23).

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

-file("src/mod/holiday/holiday_predict.erl", 24).

-file("inc/log.hrl", 1).

-file("src/mod/holiday/holiday_predict.erl", 25).

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

-file("src/mod/holiday/holiday_predict.erl", 26).

-file("inc/game_assets.hrl", 1).

-file("src/mod/holiday/holiday_predict.erl", 27).

init() -> #m_holiday_predict{}.

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{m_holiday_predict =
		       MHolidayPredict = #m_holiday_predict{camp_id = CampId,
							    info = List}}) ->
    case holiday_lib:get_open_holiday([3035, 93035, 993035])
	of
      #holiday{camp_id = CampId} ->
	  AllList = lists:usort(holiday_predict_data:list()),
	  {Flag, NRole} = new_login_day(Role),
	  NList = login_ref(NRole, AllList, List, Flag, []),
	  NRole#role{m_holiday_predict =
			 MHolidayPredict#m_holiday_predict{info = NList}};
      #holiday{camp_id = NewCampId} ->
	  AllList = lists:usort(holiday_predict_data:list()),
	  {_, NRole} = new_login_day(Role),
	  {NList, NRole1} = login_ref(NRole, AllList, List, []),
	  NRole1#role{m_holiday_predict =
			  MHolidayPredict#m_holiday_predict{camp_id = NewCampId,
							    info = NList}};
      _ -> Role
    end.

-spec zero_flush(#role{}) -> ok | {ok, #role{}}.

zero_flush(Role = #role{m_holiday_predict =
			    MHolidayPredict = #m_holiday_predict{camp_id =
								     CampId,
								 info =
								     List}}) ->
    Role1 = case holiday_lib:get_open_holiday([3035, 93035,
					       993035])
		of
	      #holiday{camp_id = CampId} ->
		  AllList = lists:usort(holiday_predict_data:list()),
		  {Flag, NRole} = new_login_day(Role),
		  NList = login_ref(NRole, AllList, List, Flag, []),
		  NRole#role{m_holiday_predict =
				 MHolidayPredict#m_holiday_predict{info =
								       NList}};
	      #holiday{camp_id = NewCampId} ->
		  AllList = lists:usort(holiday_predict_data:list()),
		  {_, NRole} = new_login_day(Role),
		  {NList, NRole1} = login_ref(NRole, AllList, List, []),
		  NRole1#role{m_holiday_predict =
				  MHolidayPredict#m_holiday_predict{camp_id =
									NewCampId,
								    info =
									NList}};
	      _ -> Role
	    end,
    {ok, Role1}.

new_login_day(Role) ->
    case var:get_var(Role, day, 100, 0) of
      0 ->
	  NRole = var:set_var(Role, day, 100, 1), {true, NRole};
      _ -> {false, Role}
    end.

login_ref(_Role, [], _List, _Flag, L) -> L;
login_ref(Role, [Type | Other], List, Flag, L) ->
    RandList = do_ref(Role, Type),
    case lists:keyfind(Type, #holiday_predict_info.type,
		       List)
	of
      Data = #holiday_predict_info{rand_lists = RandList1,
				   flag = BuyFlag} ->
	  {NewRandList, NewBuyFlag} = case Flag of
					true -> {RandList, 0};
					_ -> {RandList1, BuyFlag}
				      end,
	  login_ref(Role, Other, List, Flag,
		    [Data#holiday_predict_info{rand_lists = NewRandList,
					       flag = NewBuyFlag}
		     | L]);
      _ ->
	  login_ref(Role, Other, List, Flag,
		    [#holiday_predict_info{type = Type, count = 0,
					   buy_list = [], rand_lists = RandList,
					   flag = 0}
		     | L])
    end.

login_ref(NRole, [], _List, L) -> {L, NRole};
login_ref(Role, [Type | Other], List, L) ->
    RandList = do_ref(Role, Type),
    NRole = set_buy_time(Role, Type, 0),
    case lists:keyfind(Type, #holiday_predict_info.type,
		       List)
	of
      Data = #holiday_predict_info{} ->
	  login_ref(NRole, Other, List,
		    [Data#holiday_predict_info{count = 0, buy_list = [],
					       rand_lists = RandList, flag = 0}
		     | L]);
      _ ->
	  login_ref(NRole, Other, List,
		    [#holiday_predict_info{type = Type, count = 0,
					   buy_list = [], rand_lists = RandList,
					   flag = 0}
		     | L])
    end.

-spec push_predict_info(#role{}) -> ok | {ok, #role{}}.

push_predict_info(Role = #role{m_holiday_predict =
				   #m_holiday_predict{info = List}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3035, 93035, 993035])
	of
      #holiday{end_time = EndTime} ->
	  Now = date:unixtime(),
	  Time = EndTime - Now,
	  Ref1 = var:get_var(Role, day, 98, 0),
	  Ref2 = var:get_var(Role, day, 99, 0),
	  Buy1 = var:get_var(Role, acc, 2057, 0),
	  Buy2 = var:get_var(Role, acc, 2058, 0),
	  IsOpen1 = var:get_var(Role, day, 103, 0),
	  IsOpen2 = var:get_var(Role, day, 104, 0),
	  sys_conn:pack_send(16690,
			     {List, Time, Ref1, Ref2, Buy1, Buy2, IsOpen1,
			      IsOpen2});
      _ ->
	  sys_conn:pack_send(16690, {[], 0, 0, 0, 0, 0, 0, 0})
    end,
    ok.

-spec open(#role{}, pos_integer()) -> {ok, #role{}} |
				      {false, binary()}.

open(Role, Type) ->
    case holiday_lib:get_open_holiday(Role,
				      [3035, 93035, 993035])
	of
      #holiday{} ->
	  case Type of
	    1 -> {ok, var:set_var(Role, day, 103, 1)};
	    _ -> {ok, var:set_var(Role, day, 104, 1)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec buy_item(#role{}, pos_integer()) -> {ok,
					   #role{}} |
					  {false, binary()}.

buy_item(Role, Num) ->
    case holiday_lib:get_open_holiday(Role,
				      [3035, 93035, 993035])
	of
      #holiday{} ->
	  ItemId = holiday_predict_data:get_constant(item1),
	  Expend = [{Bid, Val * Num}
		    || {Bid, Val}
			   <- holiday_predict_data:get_constant(item_price)],
	  Loss = format:val_to_loss(Expend,
				    holiday_predict_buy_item),
	  Gain = format:val_to_gain([{ItemId, Num}],
				    holiday_predict_buy_item),
	  case role_gain:do_notice(Role, Loss ++ Gain) of
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole,
			     <<"预言召唤-松果宝藏购买松果币消耗"/utf8>>,
			     util:fbin(<<"消耗:~w, 获取:~w"/utf8>>,
				       [Expend, {ItemId, Num}])),
		{ok, NRole};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    _ -> {false, lang:get(<<"无法购买松果币"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec ref(#role{}, pos_integer()) -> {ok, #role{}} |
				     {false, binary()}.

ref(Role = #role{m_holiday_predict =
		     MHolidayPredict = #m_holiday_predict{info = List}},
    Type) ->
    case holiday_lib:get_open_holiday(Role,
				      [3035, 93035, 993035])
	of
      #holiday{bid = Bid} ->
	  RefTime = get_ref_time(Role, Type),
	  FreeRefime = get_free_ref_time(Type),
	  case lists:keyfind(Type, #holiday_predict_info.type,
			     List)
	      of
	    Data = #holiday_predict_info{count = Count,
					 buy_list = BuyList} ->
		case RefTime >= FreeRefime of
		  true ->
		      Expend = cal_refresh_expend(Role),
		      Loss = format:val_to_loss(Expend, holiday_predict_ref),
		      case role_gain:do(Role, Loss) of
			{ok, NRole} ->
			    log:log_gain(Loss, Role, NRole,
					 <<"预言召唤-松果宝藏刷新消耗"/utf8>>,
					 util:fbin(<<"预言召唤-松果宝藏刷新:~w"/utf8>>,
						   [Type])),
			    RandList = do_ref(NRole, Type),
			    NewBuyList = [{Id, Count1 + 1}
					  || {Id, Count1} <- BuyList],
			    NewInfo = Data#holiday_predict_info{type = Type,
								count =
								    Count + 1,
								rand_lists =
								    RandList,
								buy_list =
								    NewBuyList,
								flag = 0},
			    NewList = lists:keyreplace(Type,
						       #holiday_predict_info.type,
						       List, NewInfo),
			    NewRole = set_ref_time(NRole, Type, RefTime + 1),
			    NewRole1 = NewRole#role{m_holiday_predict =
							MHolidayPredict#m_holiday_predict{info
											      =
											      NewList}},
			    holiday:push_bid_can_reward(NewRole1, Bid),
			    {ok, NewRole1, NewInfo, RefTime + 1};
			{false, #loss{msg = Msg}} -> {false, Msg}
		      end;
		  _ ->
		      RandList = do_ref(Role, Type),
		      NewBuyList = [{Id, Count2 + 1}
				    || {Id, Count2} <- BuyList],
		      NewInfo = Data#holiday_predict_info{type = Type,
							  count = Count + 1,
							  rand_lists = RandList,
							  buy_list = NewBuyList,
							  flag = 0},
		      NewList = lists:keyreplace(Type,
						 #holiday_predict_info.type,
						 List, NewInfo),
		      NewRole = set_ref_time(Role, Type, RefTime + 1),
		      NewRole1 = NewRole#role{m_holiday_predict =
						  MHolidayPredict#m_holiday_predict{info
											=
											NewList}},
		      holiday:push_bid_can_reward(NewRole1, Bid),
		      {ok, NewRole1, NewInfo, RefTime + 1}
		end;
	    _ -> {false, lang:get(<<"数据错误"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

cal_refresh_expend(Role) ->
    [{ItemId, ItemNum}] =
	holiday_predict_data:get_constant(refresh),
    {_, HasNum} = package:count(by_base_id, ItemId,
				Role#role.p_bag),
    [{_, Val}] =
	holiday_predict_data:get_constant(item_price),
    case HasNum >= ItemNum of
      true -> [{ItemId, ItemNum}];
      _ ->
	  Num = (ItemNum - HasNum) * Val,
	  [{ItemId, HasNum}, {3, Num}]
    end.

do_ref(#role{lev = Lev,
	     m_holiday_predict = #m_holiday_predict{info = List}},
       Type) ->
    Num = get_type_num(Type),
    IsMust = case lists:keyfind(Type,
				#holiday_predict_info.type, List)
		 of
	       #holiday_predict_info{type = Type, count = Count}
		   when Type =:= 1 ->
		   MustNum = holiday_predict_data:get_constant(must_num_1),
		   case MustNum =:= 0 of
		     false -> (Count + 1) rem MustNum =:= 0;
		     _ -> false
		   end;
	       #holiday_predict_info{type = Type, count = Count} ->
		   MustNum = holiday_predict_data:get_constant(must_num_2),
		   case MustNum =:= 0 of
		     false -> (Count + 1) rem MustNum =:= 0;
		     _ -> false
		   end;
	       _ -> false
	     end,
    BuyList = case lists:keyfind(Type,
				 #holiday_predict_info.type, List)
		  of
		#holiday_predict_info{buy_list = OldBuyList} ->
		    OldBuyList;
		_ -> []
	      end,
    do_ref(BuyList, Num, Lev, Type, IsMust, []).

do_ref(_BuyList, 0, _Lev, _Type, _IsMust, L) -> L;
do_ref(BuyList, Num, Lev, Type, IsMust, L) ->
    RandList = case IsMust of
		 false ->
		     holiday_predict_data:get_rand_list1({Type, Num});
		 _ -> holiday_predict_data:get_rand_list2({Type, Num})
	       end,
    Fun = fun ({Id, MinLev, MaxLev, Pro, MustNoCount},
	       Acc) ->
		  case Lev >= MinLev andalso Lev < MaxLev of
		    true ->
			RefCount = list_util:keyfind(Id, BuyList, 9999),
			case RefCount >= MustNoCount of
			  true -> [{Id, Pro} | Acc];
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    RandList1 = lists:foldl(Fun, [], RandList),
    {Id, _Pro} = util:rand_list(RandList1, 2),
    do_ref(BuyList, Num - 1, Lev, Type, IsMust,
	   [{Num, Id} | L]).

-spec buy(#role{}, pos_integer()) -> {ok, #role{}} |
				     {false, binary()}.

buy(Role = #role{name = Name,
		 m_holiday_predict =
		     MHolidayPredict = #m_holiday_predict{info = List}},
    Type) ->
    case holiday_lib:get_open_holiday(Role,
				      [3035, 93035, 993035])
	of
      #holiday{} ->
	  BuyTime = get_buy_time(Role, Type),
	  LimitBuyTime = get_limit_buy_time(Type),
	  case BuyTime >= LimitBuyTime of
	    true -> {false, lang:get(<<"已达限购次数"/utf8>>)};
	    _ ->
		case lists:keyfind(Type, #holiday_predict_info.type,
				   List)
		    of
		  Data = #holiday_predict_info{rand_lists = RandList,
					       buy_list = BuyList,
					       flag = BuyFlag} ->
		      case BuyFlag of
			0 ->
			    Expend = cal_buy_expend(Role, Type),
			    {Award, NoticeList} = get_award(RandList, [], []),
			    Loss = format:val_to_loss(Expend,
						      holiday_predict_buy_expend),
			    Gain = format:val_to_gain(Award,
						      holiday_predict_buy_award),
			    case role_gain:do_notice(Role, Loss ++ Gain) of
			      {ok, NRole} ->
				  Str = case Type of
					  1 -> <<"预言召唤-松果宝藏幸运松果购买消耗"/utf8>>;
					  _ -> <<"预言召唤-松果宝藏豪华松果购买消耗"/utf8>>
					end,
				  log:log_gain(Loss ++ Gain, Role, NRole, Str,
					       util:fbin(<<"宝藏类型:~w, 消耗:~w, 获取:~w"/utf8>>,
							 [Type, Expend,
							  Award])),
				  NRole1 = set_buy_time(NRole, Type,
							BuyTime + 1),
				  do_notice(NRole1#role.id, Name, NoticeList),
				  NewBuyList = do_limit_item(RandList, BuyList,
							     Type),
				  NewInfo = Data#holiday_predict_info{buy_list =
									  NewBuyList,
								      flag = 1},
				  NewList = lists:keyreplace(Type,
							     #holiday_predict_info.type,
							     List, NewInfo),
				  {ok,
				   NRole1#role{m_holiday_predict =
						   MHolidayPredict#m_holiday_predict{info
											 =
											 NewList}},
				   BuyTime + 1, NewInfo};
			      {false, #loss{msg = Msg}} -> {false, Msg};
			      {false, #gain{msg = Msg}} -> {false, Msg};
			      _ -> {false, lang:get(<<"无法购买松果"/utf8>>)}
			    end;
			_ -> {false, lang:get(<<"当前松果物品已购买"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"数据错误"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

do_notice(_Rid, _Name, []) -> skip;
do_notice(RoleId = {Rid, SrvId}, Name,
	  [{ItemId, ItemNum} | Rest]) ->
    Msg =
	util:format_ex(lang:get(<<"欧皇附体的预言召唤师！~s 在松果宝藏活动中刷出了~s！快来参与吧！！"/utf8>>),
		       [color:format({name, {Rid, SrvId}, Name}),
			color:format({item, {ItemId, ItemNum}})]),
    notice:broadcast(rumor, Msg),
    do_notice(RoleId, Name, Rest).

do_limit_item([], BuyList, _Type) -> BuyList;
do_limit_item([{_, Id} | Other], BuyList, Type) ->
    case holiday_predict_data:get_item_must_no_count({Type,
						      Id})
	   > 0
	of
      true ->
	  NewBuyList = lists:keystore(Id, 1, BuyList, {Id, 0}),
	  do_limit_item(Other, NewBuyList, Type);
      _ -> do_limit_item(Other, BuyList, Type)
    end.

get_award([], Award, NoticeList) -> {Award, NoticeList};
get_award([{_, Id} | Other], Award, NoticeList) ->
    {ItemId, Num, IsNotice} =
	holiday_predict_data:get_award_by_id(Id),
    case IsNotice > 0 of
      true ->
	  get_award(Other, [{ItemId, Num} | Award],
		    [{ItemId, Num} | NoticeList]);
      _ ->
	  get_award(Other, [{ItemId, Num} | Award], NoticeList)
    end.

get_type_num(1) ->
    holiday_predict_data:get_constant(num_1);
get_type_num(_) ->
    holiday_predict_data:get_constant(num_2).

get_ref_time(Role, 1) -> var:get_var(Role, day, 98, 0);
get_ref_time(Role, _) -> var:get_var(Role, day, 99, 0).

get_buy_time(Role, 1) ->
    var:get_var(Role, acc, 2057, 0);
get_buy_time(Role, _) ->
    var:get_var(Role, acc, 2058, 0).

set_ref_time(Role, 1, Num) ->
    var:set_var(Role, day, 98, Num);
set_ref_time(Role, _, Num) ->
    var:set_var(Role, day, 99, Num).

set_buy_time(Role, 1, Num) ->
    var:set_var(Role, acc, 2057, Num);
set_buy_time(Role, _, Num) ->
    var:set_var(Role, acc, 2058, Num).

get_free_ref_time(1) ->
    holiday_predict_data:get_constant(free_time1);
get_free_ref_time(_) ->
    holiday_predict_data:get_constant(free_time2).

get_limit_buy_time(1) ->
    holiday_predict_data:get_constant(buy_time1);
get_limit_buy_time(_) ->
    holiday_predict_data:get_constant(buy_time2).

get_expend(Type, Type1) ->
    {Item, Gold} = holiday_predict_data:get_expend(Type),
    case Type1 of
      1 -> Item;
      _ -> Gold
    end.

cal_buy_expend(Role, Type) ->
    [{ItemId, ItemNum}] = get_expend(Type, 1),
    {_, HasNum} = package:count(by_base_id, ItemId,
				Role#role.p_bag),
    [{_, Val}] =
	holiday_predict_data:get_constant(item_price),
    case HasNum >= ItemNum of
      true -> [{ItemId, ItemNum}];
      _ ->
	  Num = (ItemNum - HasNum) * Val,
	  [{ItemId, HasNum}, {3, Num}]
    end.


