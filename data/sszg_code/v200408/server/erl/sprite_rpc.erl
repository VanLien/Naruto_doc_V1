-file("data/sprite_rpc.erl", 1).

-file("src/mod/sprite/sprite_rpc.erl", 1).

-module(sprite_rpc).

-lager_records([{sprite_plan,
		 [ver, id, name, plan_sprites]},
		{team_sprite, [ver, team, plan_id, team_sprites]},
		{formation_sprite, [ver, type, team_list]},
		{m_sprite_tree,
		 [ver, lev, break_lev, all_attr, sprites, power,
		  max_power, formation_list, plan_list]},
		{sprite_hatch,
		 [ver, id, is_open, lev, do_id, need_point, do_point,
		  state, end_time, all_end_time]},
		{m_sprite_hatch,
		 [ver, list, day_privilege_mail, day_buy_list, handbook,
		  baodi_info]},
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

-file("src/mod/sprite/sprite_rpc.erl", 10).

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

-file("src/mod/sprite/sprite_rpc.erl", 11).

-file("inc/sprite.hrl", 1).

-record(m_sprite_hatch,
	{ver = 5, list = [], day_privilege_mail = 0,
	 day_buy_list = [], handbook = [], baodi_info = []}).

-record(sprite_hatch,
	{ver = 2, id = 0, is_open = 0, lev = 0, do_id = 0,
	 need_point = 0, do_point = 0, state = 0, end_time = 0,
	 all_end_time = 0}).

-record(m_sprite_tree,
	{ver = 3, lev = 1, break_lev = 0, all_attr,
	 sprites = [], power = 0, max_power = 0,
	 formation_list = []  :: list(),
	 plan_list = []  :: list()}).

-record(formation_sprite,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 team_list = []  :: list()}).

-record(team_sprite,
	{ver = 1  :: pos_integer(), team = 1  :: pos_integer(),
	 plan_id = 0  :: pos_integer(),
	 team_sprites = []  :: list()}).

-record(sprite_plan,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 name = <<>>  :: string(),
	 plan_sprites = []  :: list()}).

-file("src/mod/sprite/sprite_rpc.erl", 12).

handle(26500, {}, Role) -> sprite_hatch:info(Role), ok;
handle(26503, {Id, ItemId}, Role) ->
    case check_open(Role) of
      {false, Msg} -> {reply, {0, Msg, Id}};
      _ ->
	  case sprite_hatch:sprite_hatch_start(Role, Id, ItemId)
	      of
	    {ok, NRole} -> {reply, {1, <<>>, Id}, NRole};
	    {false, Msg} -> {reply, {0, Msg, Id}}
	  end
    end;
handle(26506, {Id}, Role) ->
    case check_open(Role) of
      {false, Msg} -> {reply, {0, Msg, Id, []}};
      _ ->
	  case sprite_hatch:sprite_hatch_finish(Role, Id) of
	    {ok, NRole, Awards} ->
		{reply, {1, <<>>, Id, Awards}, NRole};
	    {false, Msg} -> {reply, {0, Msg, Id, []}}
	  end
    end;
handle(26507, {Type, ItemBid, Num}, Role)
    when Num > 0 ->
    case check_open(Role) of
      {false, Msg} -> {reply, {0, Msg, ItemBid, 0}};
      _ ->
	  case sprite_hatch:sprite_hatch_buy_item(Role, Type,
						  ItemBid, Num)
	      of
	    {ok, NRole, Count} ->
		{reply, {1, <<>>, ItemBid, Count}, NRole};
	    {false, Msg} -> {reply, {0, Msg, ItemBid, 0}}
	  end
    end;
handle(26508, {Bid, Num, Pos}, Role) ->
    case check_open(Role) of
      {false, Msg} -> {reply, {0, Msg}};
      _ ->
	  case sprite_hatch:sprite_compound(Role, Bid, Num, Pos)
	      of
	    {ok, NRole} -> {reply, {1, <<>>}, NRole};
	    {false, Msg} -> {reply, {0, Msg}}
	  end
    end;
handle(26509, {}, Role) ->
    sprite_hatch:handbook_info(Role), ok;
handle(26510, {}, Role) -> sprite_tree:info(Role), ok;
handle(26511, {}, Role) ->
    case check_open(Role) of
      {false, Msg} -> {reply, {0, Msg}};
      _ ->
	  case sprite_tree:lev_up(Role) of
	    {ok, NRole} ->
		role_robot:sync_role(NRole), {reply, {1, <<>>}, NRole};
	    {false, Msg} -> {reply, {0, Msg}}
	  end
    end;
handle(26512, {}, Role) ->
    case check_open(Role) of
      {false, Msg} -> {reply, {0, Msg}};
      _ ->
	  case sprite_tree:break(Role) of
	    {ok, NRole} ->
		role_robot:sync_role(NRole), {reply, {1, <<>>}, NRole};
	    {false, Msg} -> {reply, {0, Msg}}
	  end
    end;
handle(26513, {Pos, ItemBid}, Role) ->
    case check_open(Role) of
      {false, Msg} -> {reply, {0, Msg}};
      _ ->
	  case sprite_tree:set_sprite(Role, Pos, ItemBid) of
	    {ok, NRole} ->
		role_robot:sync_role(NRole), {reply, {1, <<>>}, NRole};
	    {false, Msg} -> {reply, {0, Msg}}
	  end
    end;
handle(26514, {PosInfo}, Role) ->
    case check_open(Role) of
      {false, Msg} -> {reply, {0, Msg, []}};
      _ ->
	  case sprite_tree:set_sprite(Role, PosInfo) of
	    {ok, NRole} ->
		role_robot:sync_role(NRole),
		{reply,
		 {1,
		  lang:get(<<"Đã lưu thành công kỹ năng cây cổ thụ"/utf8>>),
		  PosInfo},
		 NRole};
	    {false, Msg} -> {reply, {0, Msg, PosInfo}}
	  end
    end;
handle(26521, {}, Role) ->
    holiday_sprite_lottery:push_base(Role), ok;
handle(26522, {Times, Type}, Role) ->
    role:send_buff_begin(),
    case holiday_sprite_lottery:draw(Role, Times, Type) of
      {ok, NewRole} -> role:send_buff_flush(), {ok, NewRole};
      {false, Msg} ->
	  role:send_buff_clean(), notice:alert(Role, Msg), ok
    end;
handle(26523, {Id}, Role) ->
    role:send_buff_begin(),
    case holiday_sprite_lottery:take_reward(Role, Id) of
      {false, Msg} ->
	  role:send_buff_clean(), {reply, {0, Msg}};
      {ok, NRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NRole}
    end;
handle(26530, {Bid}, Role) ->
    case sprite_hatch:sprite_holiday_decompound(Role, Bid)
	of
      {ok, NRole} -> {reply, {1, <<>>}, NRole};
      {false, Msg} -> {reply, {0, Msg}}
    end;
handle(26535, {Id}, Role) ->
    case check_open(Role) of
      {false, Msg} -> {reply, {0, Msg, Id}};
      _ ->
	  case sprite_hatch:sprite_hatch_open(Role, Id) of
	    {ok, NRole} -> {reply, {1, <<>>, Id}, NRole};
	    {false, Msg} -> {reply, {0, Msg, Id}}
	  end
    end;
handle(26550, {}, Role) ->
    sprite_lottery:push_base(Role), ok;
handle(26551, {Times, Type}, Role) ->
    role:send_buff_begin(),
    case sprite_lottery:draw(Role, Times, Type) of
      {ok, NewRole} -> role:send_buff_flush(), {ok, NewRole};
      {false, Msg} ->
	  role:send_buff_clean(), notice:alert(Role, Msg), ok
    end;
handle(26552, {Id}, Role) ->
    role:send_buff_begin(),
    case sprite_lottery:take_reward(Role, Id) of
      {false, Msg} ->
	  role:send_buff_clean(), {reply, {0, Msg}};
      {ok, NRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NRole}
    end;
handle(26554, {LuckyIds}, Role) ->
    case sprite_lottery:set_lucky_sprites(Role, LuckyIds) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(26555, {Type}, Role) ->
    sprite_formation:get_sprite_formation(Role, Type), ok;
handle(26556, {}, Role) ->
    sprite_formation:push(Role, 26556), ok;
handle(26557, {Id, Info, Type, Team}, Role) ->
    case sprite_formation:save_plan(Role,
				    {Id, Info, Type, Team})
	of
      {ok, NewRole} ->
	  {reply,
	   {1,
	    lang:get(<<"Kế hoạch đã được lưu thành công"/utf8>>)},
	   NewRole};
      {false, Reason} -> {reply, {0, Reason}}
    end;
handle(26558, {Id, Name}, Role) ->
    case sprite_formation:save_name(Role, {Id, Name}) of
      {ok, NewRole} ->
	  {reply,
	   {1,
	    lang:get(<<"Kế hoạch đã được lưu thành công"/utf8>>)},
	   NewRole};
      {false, Reason} -> {reply, {0, Reason}}
    end;
handle(26560, {Type, Team, Info, Flag}, Role) ->
    case sprite_formation:save_sprites(Role,
				       {Type, Team, Info})
	of
      {ok, NewRole} ->
	  role_robot:sync_role(NewRole),
	  Msg = util:if_true(Flag =:= 1,
			     lang:get(<<"Đã lưu thành công đội hình elf"/utf8>>),
			     <<>>),
	  {reply, {1, Msg, Type, Team}, NewRole};
      {false, Reason} -> {reply, {0, Reason, Type, Team}}
    end;
handle(26561, {Type, Team, Id}, Role) ->
    role:send_buff_begin(),
    case sprite_formation:save_sprites_by_plan(Role,
					       {Type, Team, Id})
	of
      {ok, NewRole} ->
	  role_robot:sync_role(NewRole),
	  role:send_buff_flush(),
	  {reply,
	   {1, lang:get(<<"Giải pháp lắp ráp thành công"/utf8>>),
	    Type, Team},
	   NewRole};
      {false, Reason} ->
	  role:send_buff_clean(), {reply, {0, Reason, Type, Team}}
    end;
handle(26562, {Id}, Role) ->
    role:send_buff_begin(),
    case sprite_formation:buy_plan(Role, Id) of
      {ok, NewRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NewRole};
      {false, Reason} ->
	  role:send_buff_clean(), {reply, {0, Reason}}
    end;
handle(26563, {Bid, Num}, Role) ->
    case sprite_formation:judge_panel(Role, Bid, Num) of
      {ok, Type, Id, Name} -> {reply, {1, Type, Id, Name}};
      _ -> {reply, {0, 0, 0, <<>>}}
    end;
handle(26564, {Type, SortList}, Role) ->
    case sprite_formation:change_team_sort(Role, Type,
					   SortList)
	of
      {ok, NewRole} -> {reply, {1, <<>>}, NewRole};
      {false, Reason} -> {reply, {0, Reason}}
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
      {__Pidsprite_rpc363, _,
       {__Levelsprite_rpc363, __Tracessprite_rpc363}}
	  when __Levelsprite_rpc363 band 128 /= 0 orelse
		 __Tracessprite_rpc363 /= [] ->
	  lager:do_log(debug,
		       [{module, sprite_rpc}, {function, handle}, {line, 363},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("模块[~w]收到无效的RPC调用[~w]: ~w",
				     [sprite_rpc, _Cmd, _Data]),
		       none, 4096, 128, __Levelsprite_rpc363,
		       __Tracessprite_rpc363, lager_event, __Pidsprite_rpc363);
      _ -> ok
    end,
    {error, unknow_command}.

check_open(#role{lev = Lev}) ->
    NeedLev = sprite_data:get_const(sprite_unlocked_lv),
    case Lev >= NeedLev of
      false ->
	  {false,
	   util:fbin(lang:get(<<"~wHệ thống phù thủy cấp độ 1"/utf8>>),
		     [NeedLev])};
      _ -> ok
    end.


