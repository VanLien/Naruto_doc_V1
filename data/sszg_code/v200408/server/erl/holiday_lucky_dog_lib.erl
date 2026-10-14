-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_l"
      "ib.erl",
      1).

-module(holiday_lucky_dog_lib).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{holiday_lucky_dog_info,
		 [ver, camp_id, period, status, lucky_dog, ext]},
		{holiday_lucky_dog_quest,
		 [quest_id, val, num, lucky_type, finish, ext]},
		{m_holiday_lucky_dog, [ver, camp_id, info, ext]},
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

-export([init/0, login/1, zero_flush/1, info/1, award/2,
	 fire/3, apply_calc_num/2, push_point/1, click_ico/1]).

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

-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_l"
      "ib.erl",
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

-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_l"
      "ib.erl",
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

-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_l"
      "ib.erl",
      21).

-file("inc/holiday_lucky_dog.hrl", 1).

-record(m_holiday_lucky_dog,
	{ver = 1, camp_id = 0, info = [], ext = []}).

-record(holiday_lucky_dog_quest,
	{quest_id = 0, val = 0, num = 0, lucky_type = 0,
	 finish = 0, ext = []}).

-record(holiday_lucky_dog_info,
	{ver = 1, camp_id = 0, period = 0, status = 0,
	 lucky_dog = [], ext = []}).

-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_l"
      "ib.erl",
      22).

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

-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_l"
      "ib.erl",
      23).

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

-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_l"
      "ib.erl",
      24).

init() -> #m_holiday_lucky_dog{}.

login(Role = #role{m_holiday_lucky_dog =
		       M = #m_holiday_lucky_dog{ext = Ext, camp_id = CampId,
						info = Info}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3046, 93046, 993046])
	of
      #holiday{camp_id = CampId} ->
	  push_point(Role), {ok, Role};
      #holiday{camp_id = NewCampId} ->
	  Role1 = do_award(Role, Info),
	  NewExt = lists:keydelete(old_data, 1, Ext),
	  NewInfo = do_init_info(NewCampId),
	  M1 = M#m_holiday_lucky_dog{camp_id = NewCampId,
				     info = NewInfo,
				     ext = [{old_data, M} | NewExt]},
	  NewRole = Role1#role{m_holiday_lucky_dog = M1},
	  push_point(NewRole),
	  {ok, NewRole};
      _ when CampId == 0 -> {ok, Role};
      _ ->
	  Role1 = do_award(Role, Info),
	  NewExt = lists:keydelete(old_data, 1, Ext),
	  M1 = M#m_holiday_lucky_dog{camp_id = 0, info = [],
				     ext = [{old_data, M} | NewExt]},
	  {ok, Role1#role{m_holiday_lucky_dog = M1}}
    end.

zero_flush(Role = #role{m_holiday_lucky_dog =
			    M = #m_holiday_lucky_dog{ext = Ext,
						     camp_id = CampId,
						     info = Info}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3046, 93046, 993046])
	of
      #holiday{camp_id = CampId} ->
	  push_point(Role), {ok, Role};
      #holiday{camp_id = NewCampId} ->
	  Role1 = do_award(Role, Info),
	  NewExt = lists:keydelete(old_data, 1, Ext),
	  NewInfo = do_init_info(NewCampId),
	  M1 = M#m_holiday_lucky_dog{camp_id = NewCampId,
				     info = NewInfo,
				     ext = [{old_data, M} | NewExt]},
	  NewRole = Role1#role{m_holiday_lucky_dog = M1},
	  push_point(NewRole),
	  {ok, NewRole};
      _ when CampId == 0 -> {ok, Role};
      _ ->
	  Role1 = do_award(Role, Info),
	  NewExt = lists:keydelete(old_data, 1, Ext),
	  M1 = M#m_holiday_lucky_dog{camp_id = 0, info = [],
				     ext = [{old_data, M} | NewExt]},
	  {ok, Role1#role{m_holiday_lucky_dog = M1}}
    end.

do_init_info(CampId) ->
    Periods = holiday_lucky_dog_data:get_period(CampId),
    [to_quest(Period, Ids) || {Period, Ids} <- Periods].

to_quest(Period, Ids) -> {Period, to_quest(Ids)}.

to_quest(Ids) when is_list(Ids) ->
    [to_quest(Id) || Id <- Ids];
to_quest(Id) -> #holiday_lucky_dog_quest{quest_id = Id}.

do_award(Role = #role{m_holiday_lucky_dog =
			  #m_holiday_lucky_dog{camp_id = CampId}},
	 Info) ->
    Fun = fun ({Period, Quests}, Acc) ->
		  Fun2 = fun (#holiday_lucky_dog_quest{finish = Finish,
						       lucky_type = LuckyType},
			      Acc2) ->
				 case Finish of
				   1 ->
				       Award =
					   holiday_lucky_dog_data:get_quest_award({CampId,
										   Period,
										   LuckyType}),
				       item_lib:merge(Award, Acc2);
				   _ -> Acc2
				 end
			 end,
		  lists:foldl(Fun2, Acc, Quests)
	  end,
    case lists:foldl(Fun, [], Info) of
      AllAward = [_ | _] ->
	  {Assets, Items} = format:split_assets_items(AllAward),
	  {ok, NewRole} = mail:add(Role,
				   {lang:get(<<"新春锦鲤活动奖励补发"/utf8>>),
				    lang:get(<<"亲爱的冒险者大人，这是您未领取的新春锦鲤活动奖励，请查收！"/utf8>>),
				    Assets, Items, <<"~新春锦鲤活动奖励补发"/utf8>>}),
	  NewRole;
      _ -> Role
    end.

-spec info(#role{}) -> ok.

info(Role = #role{m_holiday_lucky_dog =
		      #m_holiday_lucky_dog{info = L}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3046, 93046, 993046])
	of
      #holiday{camp_id = CampId, start_time = StartTime,
	       end_time = EndTime} ->
	  Now = date:unixtime(),
	  Period = date:day_diff(StartTime, Now) + 1,
	  {_, Status, _} = holiday_lucky_dog_mgr:get_info(CampId),
	  Fun = fun ({PeriodT, Quests}, Acc) ->
			StatusT = case PeriodT > Period orelse
					 PeriodT == Period andalso Status == 0
				      of
				    true -> 0;
				    _ -> 1
				  end,
			Fun2 = fun (Q = #holiday_lucky_dog_quest{quest_id =
								     QuestId,
								 lucky_type =
								     LuckyType,
								 val = Val,
								 finish =
								     Finish},
				    Acc2) ->
				       NewFinish = case Finish of
						     0 ->
							 case
							   holiday_lucky_dog_data:get_quest(QuestId)
							     of
							   {_, _, TagVal, _}
							       when
								 is_integer(TagVal)
								   andalso
								   Val >=
								     TagVal ->
							       1;
							   _ -> 0
							 end;
						     _ -> Finish
						   end,
				       PushFinish = util:if_true(StatusT == 1,
								 NewFinish, 0),
				       PushLuckyType = util:if_true(StatusT ==
								      1,
								    LuckyType,
								    0),
				       [Q#holiday_lucky_dog_quest{finish =
								      PushFinish,
								  lucky_type =
								      PushLuckyType}
					| Acc2]
			       end,
			PushQuests = lists:foldl(Fun2, [], Quests),
			[{PeriodT, StatusT, PushQuests} | Acc]
		end,
	  PushList = lists:foldl(Fun, [], L),
	  sys_conn:pack_send(28400,
			     {Period, StartTime, EndTime, PushList});
      _ -> sys_conn:pack_send(28400, {0, 0, 0, []})
    end,
    ok.

-spec award(#role{}, Period :: pos_integer()) -> ok.

award(Role = #role{m_holiday_lucky_dog =
		       #m_holiday_lucky_dog{info = Info}},
      Period) ->
    case holiday_lib:get_open_holiday(Role,
				      [3046, 93046, 993046])
	of
      #holiday{camp_id = CampId, start_time = StartTime} ->
	  Now = date:unixtime(),
	  NowPeriod = date:day_diff(StartTime, Now) + 1,
	  {_, Status, _} = holiday_lucky_dog_mgr:get_info(CampId),
	  case Period < NowPeriod orelse
		 Period == NowPeriod andalso Status == 1
	      of
	    true ->
		case lists:keyfind(Period, 1, Info) of
		  {_, Quests} ->
		      Fun2 = fun (Q = #holiday_lucky_dog_quest{finish =
								   Finish,
							       lucky_type =
								   LuckyType},
				  {Acc1, Acc2}) ->
				     case Finish of
				       1 ->
					   Award =
					       holiday_lucky_dog_data:get_quest_award({CampId,
										       Period,
										       LuckyType}),
					   {[Q#holiday_lucky_dog_quest{finish =
									   2}
					     | Acc1],
					    item_lib:merge(Award, Acc2)};
				       _ -> {[Q | Acc1], Acc2}
				     end
			     end,
		      case lists:foldl(Fun2, {[], []}, Quests) of
			{NewQuests, Award = [_ | _]} ->
			    GL = format:val_to_gain(Award,
						    holiday_lucky_dog_award),
			    case role_gain:do_notice(Role, GL) of
			      {ok,
			       NewRole = #role{m_holiday_lucky_dog =
						   M = #m_holiday_lucky_dog{info
										=
										NewInfo}}} ->
				  log:log_gain(GL, Role, NewRole,
					       util:fbin(<<"运营活动_幸运锦鲤"/utf8>>,
							 []),
					       util:fbin(<<"周期:~w, 获得:~w"/utf8>>,
							 [Period, Award])),
				  NewM = M#m_holiday_lucky_dog{info =
								   lists:keystore(Period,
										  1,
										  NewInfo,
										  {Period,
										   NewQuests})},
				  NewRole2 = NewRole#role{m_holiday_lucky_dog =
							      NewM},
				  info(NewRole2),
				  {ok, NewRole2};
			      {false, #gain{msg = Msg}} -> {false, Msg};
			      _ -> {false, lang:get(<<"领取出错"/utf8>>)}
			    end;
			_ -> {false, lang:get(<<"没有可领取的奖励"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"参数错误"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"没有可领取的奖励!"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动已结束"/utf8>>)}
    end.

fire(Role = #role{m_holiday_lucky_dog =
		      M = #m_holiday_lucky_dog{info = Info}},
     Type, AddRmd) ->
    case holiday_lib:get_open_holiday(Role,
				      [3046, 93046, 993046])
	of
      #holiday{camp_id = CampId, start_time = StartTime}
	  when Type == evt_cli_loaded orelse
		 Type == evt_high_recruit orelse
		   Type == evt_arena_fight_result orelse
		     Type == charge_rmb orelse
		       Type == evt_dial orelse
			 Type == evt_dungeon_stone_fight orelse
			   Type == evt_friend_present orelse
			     Type == evt_dungeon_fast_combat orelse
			       Type == evt_share_game ->
	  Now = date:unixtime(),
	  Period = date:day_diff(StartTime, Now) + 1,
	  {_, Status, _} = holiday_lucky_dog_mgr:get_info(CampId),
	  case lists:keyfind(Period, 1, Info) of
	    {_, Quests} when Status == 0 ->
		Fun = fun (Q = #holiday_lucky_dog_quest{quest_id =
							    QuestId,
							finish = Finish},
			   Acc) ->
			      case Finish == 0 of
				true ->
				    case
				      holiday_lucky_dog_data:get_quest(QuestId)
					of
				      {evt_cli_loaded, _, Need, _}
					  when Type == evt_cli_loaded ->
					  NewQ = do_add_val(Role, Q, Period,
							    Need, 1),
					  [NewQ | Acc];
				      {evt_high_recruit, _, Need, _}
					  when Type == evt_high_recruit ->
					  NewQ = do_add_val(Role, Q, Period,
							    Need, AddRmd),
					  [NewQ | Acc];
				      {evt_arena_fight_result, _, Need, _}
					  when Type == evt_arena_fight_result ->
					  NewQ = do_add_val(Role, Q, Period,
							    Need, 1),
					  [NewQ | Acc];
				      {charge_rmb, _, Need, _}
					  when Type == charge_rmb ->
					  NewQ = do_add_val(Role, Q, Period,
							    Need,
							    trunc(AddRmd)),
					  [NewQ | Acc];
				      {evt_dial, _, Need, _}
					  when Type == evt_dial ->
					  NewQ = do_add_val(Role, Q, Period,
							    Need, AddRmd),
					  [NewQ | Acc];
				      {evt_dungeon_stone_fight, _, Need, _}
					  when Type ==
						 evt_dungeon_stone_fight ->
					  NewQ = do_add_val(Role, Q, Period,
							    Need, 1),
					  [NewQ | Acc];
				      {evt_friend_present, _, Need, _}
					  when Type == evt_friend_present ->
					  NewQ = do_add_val(Role, Q, Period,
							    Need, 1),
					  [NewQ | Acc];
				      {evt_dungeon_fast_combat, _, Need, _}
					  when Type ==
						 evt_dungeon_fast_combat ->
					  NewQ = do_add_val(Role, Q, Period,
							    Need, 1),
					  [NewQ | Acc];
				      {evt_share_game, _, Need, _}
					  when Type == evt_share_game ->
					  NewQ = do_add_val(Role, Q, Period,
							    Need, 1),
					  [NewQ | Acc];
				      _ -> [Q | Acc]
				    end;
				_ -> [Q | Acc]
			      end;
			  (Temp, Acc) -> [Temp | Acc]
		      end,
		NewQuests = lists:foldl(Fun, [], Quests),
		NewRole = Role#role{m_holiday_lucky_dog =
					M#m_holiday_lucky_dog{info =
								  lists:keystore(Period,
										 1,
										 Info,
										 {Period,
										  NewQuests})}},
		info(NewRole),
		{ok, NewRole};
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

do_add_val(Role = #role{id = RoleId, lev = Lev},
	   Q = #holiday_lucky_dog_quest{quest_id = QuestId,
					val = Val},
	   Period, Need, AddVal) ->
    NewVal = AddVal + Val,
    AccRmb = charge_misc:charge_sum(Role),
    case NewVal >= Need of
      true ->
	  holiday_lucky_dog_mgr:info({calc_num, RoleId, Period,
				      QuestId, Lev, AccRmb});
      _ -> skip
    end,
    Q#holiday_lucky_dog_quest{val = NewVal}.

apply_calc_num(Role = #role{m_holiday_lucky_dog =
				M = #m_holiday_lucky_dog{info = Info}},
	       {calc_num, Period, QuestId, Num, LuckyType}) ->
    case lists:keyfind(Period, 1, Info) of
      {_, Quests} ->
	  case lists:keyfind(QuestId,
			     #holiday_lucky_dog_quest.quest_id, Quests)
	      of
	    Q = #holiday_lucky_dog_quest{finish = 0} ->
		NewQ = Q#holiday_lucky_dog_quest{num = Num,
						 lucky_type = LuckyType,
						 finish = 1},
		NewQuests = lists:keystore(QuestId,
					   #holiday_lucky_dog_quest.quest_id,
					   Quests, NewQ),
		NewInfo = lists:keystore(Period, 1, Info,
					 {Period, NewQuests}),
		NewM = M#m_holiday_lucky_dog{info = NewInfo},
		NewRole = Role#role{m_holiday_lucky_dog = NewM},
		log:save(holiday_lucky_dog_info,
			 {NewRole,
			  util:fbin(<<"号码：~w，任务Id:~w，大奖名次：~w"/utf8>>,
				    [Num, QuestId, LuckyType])}),
		info(NewRole),
		{ok, NewRole};
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

-spec push_point(#role{}) -> ok.

push_point(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [3046, 93046, 993046])
	of
      #holiday{} ->
	  case var:get_var(Role, day, 117, 0) of
	    0 -> sys_conn:pack_send(28402, {1, <<>>});
	    _ -> sys_conn:pack_send(28402, {0, <<>>})
	  end;
      _ ->
	  sys_conn:pack_send(28402,
			     {0, lang:get(<<"活动未开启"/utf8>>)})
    end.

-spec click_ico(#role{}) -> {ok, #role{}} |
			    {false, binary()}.

click_ico(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [3046, 93046, 993046])
	of
      #holiday{} ->
	  case var:get_var(Role, day, 117, 0) of
	    0 ->
		NRole1 = var:set_var(Role, day, 117, 1),
		push_point(NRole1),
		{ok, NRole1};
	    _ -> {false, lang:get(<<"红点已消失"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.


