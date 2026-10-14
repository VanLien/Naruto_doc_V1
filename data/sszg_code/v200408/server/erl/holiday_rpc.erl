-file("src/mod/holiday/holiday_rpc.erl", 1).

-module(holiday_rpc).

-lager_records([{holiday_predict_info,
		 [type, count, buy_list, rand_lists, flag]},
		{m_holiday_predict, [ver, camp_id, info]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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

-export([handle/3]).

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

-file("src/mod/holiday/holiday_rpc.erl", 9).

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

-file("src/mod/holiday/holiday_rpc.erl", 10).

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

-file("src/mod/holiday/holiday_rpc.erl", 11).

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

-file("src/mod/holiday/holiday_rpc.erl", 12).

-file("inc/holiday_predict.hrl", 1).

-record(m_holiday_predict,
	{ver = 1  :: non_neg_integer(), camp_id = 0,
	 info = []}).

-record(holiday_predict_info,
	{type = 0, count = 0, buy_list = [], rand_lists = [],
	 flag = 0}).

-file("src/mod/holiday/holiday_rpc.erl", 13).

handle(16601, {}, Role) ->
    case game_lib:is_ios_verify(Role#role.platform) of
      true -> {reply, {[]}};
      _ -> {reply, holiday:type_all(Role, all)}
    end;
handle(16602, {}, Role) ->
    case game_lib:is_ios_verify(Role#role.platform) of
      true -> ok;
      _ ->
	  CanGetList = holiday:can_get_reward(Role, all),
	  {reply, {CanGetList}}
    end;
handle(16603, {Bid}, Role) ->
    case game_lib:is_ios_verify(Role#role.platform) of
      true -> ok;
      _ ->
	  Reply = holiday:holiday_one(Role, Bid), {reply, Reply}
    end;
handle(16604, {Bid, Aim, Arg}, Role) ->
    role:send_buff_begin(),
    case holiday:take(Role, Bid, Aim, Arg) of
      {error, ErrMsg} when is_atom(ErrMsg) ->
	  util:print_stacktrace(),
	  role:send_buff_clean(),
	  {reply, {0, lang:get(<<"未知错误!"/utf8>>)}};
      {error, ErrMsg} ->
	  role:send_buff_clean(), {reply, {0, ErrMsg}};
      {ok, Msg, Role2} ->
	  role:send_buff_flush(),
	  holiday_lib:push_holiday_one(Role2, Bid),
	  {sync, {1, Msg}, Role2}
    end;
handle(16605, {BidList}, Role) ->
    case game_lib:is_ios_verify(Role#role.platform) of
      true -> ok;
      _ ->
	  Reply = holiday_lib:is_open_list(Role, BidList),
	  {reply, {Reply}}
    end;
handle(16620, {Bids}, Role) ->
    case game_lib:is_ios_verify(Role#role.platform) of
      true -> ok;
      _ ->
	  Replys = [holiday:holiday_one(Role, Bid)
		    || Bid <- Bids],
	  {reply, {Replys}}
    end;
handle(16630, {}, Role) ->
    holiday_misc:push_download_info(Role), ok;
handle(16631, {}, Role) ->
    case holiday_misc:download_reward(Role) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NewRole} -> {reply, {1, <<>>}, NewRole}
    end;
handle(16633, {}, Role) ->
    holiday_misc:wechat_reward(Role), ok;
handle(16634, {}, Role) ->
    {ok, NewRole} = holiday_misc:get_wechat_reward(Role),
    {reply, {}, NewRole};
handle(16635, {}, Role) ->
    holiday_misc:push_bind_phone_info(Role), ok;
handle(16636, {Number, Code}, Role) ->
    case holiday_misc:bind_phone_reward(Role, Number, Code)
	of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole};
      ok -> {reply, {2, <<>>}}
    end;
handle(16637, {}, Role) ->
    holiday_dial:push_dial_info(Role), ok;
handle(16638, {Type, Type1}, Role) ->
    case holiday_dial:do_dial(Role, Type, Type1) of
      {false, Reason} -> {reply, {0, Reason, [], [], [], []}};
      {ok, NRole, FristAward, Awards1, Awards2,
       AwardPosList} ->
	  holiday_dial:push_ref_dial_info(NRole, Type),
	  {reply,
	   {1, <<>>, FristAward, Awards1, Awards2, AwardPosList},
	   NRole}
    end;
handle(16640, {Type, Id}, Role) ->
    case holiday_dial:get_award(Role, Type, Id) of
      {false, Reason} -> {reply, {0, Reason, Type}};
      {ok, NRole} ->
	  holiday_dial:push_ref_dial_info(NRole, Type),
	  {reply, {1, <<>>, Type}, NRole}
    end;
handle(16642, {Type}, Role) ->
    case holiday_dial:ref(Role, Type) of
      {false, Reason} -> {reply, {0, Reason, Type}};
      {ok, NRole} ->
	  holiday_dial:push_ref_dial_info(NRole, Type),
	  {reply, {1, <<>>, Type}, NRole}
    end;
handle(16643, {Type, Type1}, Role) ->
    case holiday_dial:do_dial(Role, Type, Type1) of
      {false, Reason} -> {reply, {0, Reason, [], [], [], []}};
      {ok, NRole, FristAward, Awards1, Awards2,
       AwardPosList} ->
	  holiday_dial:push_ref_dial_info(NRole, Type),
	  {reply,
	   {1, <<>>, FristAward, Awards1, Awards2, AwardPosList},
	   NRole}
    end;
handle(16650, {Bid}, Role) ->
    case holiday_rule_rank:get_rank_award(Role, Bid) of
      {MyRank, List} -> {reply, {MyRank, List}};
      _ -> {reply, {0, []}}
    end;
handle(16651, {}, Role) ->
    holiday_dime:push_base_info(Role), ok;
handle(16652, {Id}, Role) ->
    case holiday_dime:get_award(Role, Id) of
      {ok, NewRole} -> {sync, {1, <<>>}, NewRole};
      {false, Msg} -> {reply, {0, Msg}}
    end;
handle(16653, {}, Role) ->
    holiday_new_week_card:push_base_info(Role), ok;
handle(16654, {Id}, Role) ->
    case holiday_new_week_card:get_award(Role, Id) of
      {ok, NewRole} -> {sync, {1, <<>>}, NewRole};
      {false, Msg} -> {reply, {0, Msg}}
    end;
handle(16660, {}, Role) ->
    {reply, {holiday_exchange:get_info(Role)}};
handle(16661, {Bid, Aim, Num}, Role) ->
    case holiday_exchange:buy(Role, Bid, Aim, Num) of
      {ok, BuyNum, NRole} ->
	  {reply, {1, <<>>, Bid, Aim, BuyNum}, NRole};
      {false, Msg} -> {reply, {0, Msg, Bid, Aim, 0}}
    end;
handle(16665, {Bid, Ids}, Role) ->
    role:send_buff_begin(),
    case holiday_exchange:buy2(Role, Bid, Ids) of
      {false, ErrMsg} ->
	  role:send_buff_clean(), {reply, {0, ErrMsg}};
      {ok, Msg, Role2} ->
	  role:send_buff_flush(), {sync, {1, Msg}, Role2}
    end;
handle(16666, {Bid}, Role) ->
    NRole = holiday:point(Role, Bid), {ok, NRole};
handle(16670, {}, Role) -> holiday_dial2:info(Role), ok;
handle(16671, {Count, Flag}, Role) ->
    case holiday_dial2:do_dial(Role, Count, Flag) of
      {false, Reason} -> {reply, {0, Reason, 0, Flag}};
      {ok, NRole, Zid} -> {sync, {1, <<>>, Zid, Flag}, NRole}
    end;
handle(16672, {}, Role) ->
    holiday_dial2:do_push(Role), ok;
handle(16673, {AwardId}, Role) ->
    case holiday_dial2:get_award(Role, AwardId) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NewRole} -> {sync, {1, <<>>}, NewRole}
    end;
handle(16674, {Type}, Role) ->
    List = holiday_dial2:get_log(Role, Type),
    {reply, {Type, List}};
handle(16675, {Num}, Role) ->
    case holiday_dial2:buy(Role, Num) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NewRole} -> {sync, {1, <<>>}, NewRole}
    end;
handle(16680, {}, Role) ->
    holiday_break_egg:push_base(Role),
    NRole = var:set_list_val(Role, day, 76, 3024, 1),
    holiday:push_bid_can_reward(NRole, 93024),
    {ok, NRole};
handle(16681, {}, Role) ->
    case holiday_break_egg:refresh(Role) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NewRole} ->
	  {reply, {1, lang:get(<<"刷新成功"/utf8>>)}, NewRole}
    end;
handle(16682, {EggId}, Role) ->
    case holiday_break_egg:break(Role, EggId) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NewRole} -> {reply, {1, <<>>}, NewRole}
    end;
handle(16683, {}, Role) ->
    case holiday_break_egg:auto_break(Role) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NewRole} -> {reply, {1, <<>>}, NewRole}
    end;
handle(16684, {Num}, Role) ->
    case holiday_break_egg:buy(Role, Num) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NewRole} -> {reply, {1, <<>>}, NewRole}
    end;
handle(16685, {Type}, Role) ->
    List = holiday_break_egg:get_log(Role, Type),
    {reply, {Type, List}};
handle(16686, {PartnerId, Bid, Expend}, Role) ->
    role:send_buff_begin(),
    case holiday_convert:convert(Role, PartnerId, Bid,
				 Expend)
	of
      {false, Msg} ->
	  role:send_buff_clean(), {reply, {0, Msg}};
      {ok, NewRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NewRole}
    end;
handle(16687, {Bid}, Role) ->
    NRole = holiday:point2(Role, Bid), {ok, NRole};
handle(16688, {}, Role) ->
    holiday_groupon:get_exchange_info(Role), ok;
handle(16689, {Id, Num}, Role) ->
    case holiday_groupon:take_exchange(Role, Id, Num) of
      {ok, NewRole} -> {reply, {1, <<>>, Id, Num}, NewRole};
      {false, Msg} -> {reply, {0, Msg, Id, Num}}
    end;
handle(16690, {}, Role) ->
    holiday_predict:push_predict_info(Role), ok;
handle(16691, {Type}, Role) ->
    case holiday_predict:ref(Role, Type) of
      {false, Reason} ->
	  {reply, {0, Reason, Type, #holiday_predict_info{}, 0}};
      {ok, NRole, NewInfo, RefCount} ->
	  {reply, {1, <<>>, Type, NewInfo, RefCount}, NRole}
    end;
handle(16692, {Num}, Role) ->
    case holiday_predict:buy_item(Role, Num) of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(16693, {Type}, Role) ->
    case holiday_predict:buy(Role, Type) of
      {false, Reason} ->
	  {reply, {0, Reason, Type, 0, #holiday_predict_info{}}};
      {ok, NRole, BuyTime, NewInfo} ->
	  {reply, {1, <<>>, Type, BuyTime, NewInfo}, NRole}
    end;
handle(16694, {Type}, Role) ->
    case holiday_predict:open(Role, Type) of
      {false, Reason} -> {reply, {0, Reason, Type}};
      {ok, NRole} -> {reply, {1, <<>>, Type}, NRole}
    end;
handle(16695, {Code}, Role) ->
    role:send_buff_begin(),
    case holiday:take(Role, 993043, 0, Code) of
      {error, ErrMsg} when is_atom(ErrMsg) ->
	  util:print_stacktrace(),
	  role:send_buff_clean(),
	  {reply, {0, lang:get(<<"未知错误!"/utf8>>)}};
      {error, ErrMsg} ->
	  role:send_buff_clean(), {reply, {0, ErrMsg}};
      {ok, Msg, Role2} ->
	  role:send_buff_flush(),
	  holiday_lib:push_holiday_one(Role2, 993043),
	  {sync, {1, Msg}, Role2}
    end;
handle(16698, {Id}, Role) ->
    case holiday_time_award:get_award(Role, Id) of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(_Cmd, _Data, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rpc417, _,
       {__Levelholiday_rpc417, __Tracesholiday_rpc417}}
	  when __Levelholiday_rpc417 band 128 /= 0 orelse
		 __Tracesholiday_rpc417 /= [] ->
	  lager:do_log(debug,
		       [{module, holiday_rpc}, {function, handle}, {line, 417},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("模块[~w]收到无效的RPC调用[~w]: ~w",
				     [holiday_rpc, _Cmd, _Data]),
		       none, 4096, 128, __Levelholiday_rpc417,
		       __Tracesholiday_rpc417, lager_event,
		       __Pidholiday_rpc417);
      _ -> ok
    end,
    {error, unknow_command}.


