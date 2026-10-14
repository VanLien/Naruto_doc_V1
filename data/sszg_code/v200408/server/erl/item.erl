-file("src/mod/item/item.erl", 1).

-module(item).

-lager_records([{s_timer, [ref, timers]},
		{rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{condition, [label, op, val, msg]},
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
		{assets,
		 [ver, exp, coin, silver_coin, gold, red_gold, gold_acc,
		  vip_exp, energy, energy_max, energy_time, activity,
		  guild, arena_cent, hero_soul, feat_point, triple_rebate,
		  friend_point, boss_point, star_hun, star_point,
		  arena_guesscent, sky_coin, hero_exp, recruit_hero,
		  recruithigh_hero, expedition_medal, elite_coin,
		  holy_eqm_coin, skin_debris, cluster_coin, home_coin,
		  hallow_refine, cluster_guess_cent, feather_exchange,
		  brave_symbol, peak_guess_cent, hero_soul_coin,
		  acc_recruit_hero, predict_point]},
		{item_make_args, [base_id, bind, quantity, step, flag]},
		{item,
		 [ver, id, base_id, bind, look_id, type, quality, craft,
		  step, quantity, pos, expire_type, expire_time, enchant,
		  fail_enchant, attr, main_attr, extra_attr, score,
		  all_score, extra, data, price, set_id, career,
		  gemstones, star_lev, break_count, holy_eqm_attr]},
		{item_base,
		 [id, name, type, quality, overlap, use_type, gain_type,
		  expire_type, expire_time, condition, effect, attr,
		  value, lev, career, sex, ext, attr_type, eqm_jie,
		  add_num, can_share, eqm_set, use_count]}]).

-export([make/3, make/4, make/1, use_normal/5,
	 check_expire/1, check_expire/2, check_start/1, attr/2,
	 login/1, match/3, make_expire/3, match_update/2,
	 make_cond/4, check/1]).

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

-file("src/mod/item/item.erl", 26).

-file("inc/item.hrl", 1).

-record(item_base,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 type = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 overlap = 1  :: pos_integer(), use_type = 0  :: 0..4,
	 gain_type = 0  :: non_neg_integer(),
	 expire_type = 0  :: non_neg_integer(),
	 expire_time = 0  ::
	     non_neg_integer() |
	     {{pos_integer(), pos_integer(), pos_integer()},
	      {non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}},
	 condition = []  :: [tuple()], effect = []  :: [tuple()],
	 attr = []  :: [tuple()], value = []  :: [tuple()],
	 lev = 0, career = 0, sex = 2, ext = [],
	 attr_type = 1  :: pos_integer(), eqm_jie = 0,
	 add_num = 0, can_share = 0, eqm_set = 0,
	 use_count = 0}).

-record(item,
	{ver = 3  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(), bind = 1  :: 0 | 1,
	 look_id = 0, type = 0  :: non_neg_integer(),
	 quality = 0  :: 0..4, craft = 0  :: 0..5,
	 step = 0  :: pos_integer(), quantity = 1  :: 0..250,
	 pos = 0  :: non_neg_integer(), expire_type = 0  :: 0..4,
	 expire_time = 0  :: non_neg_integer(),
	 enchant = 0  :: integer(),
	 fail_enchant = 0  :: non_neg_integer(),
	 attr = []  :: [tuple()], main_attr = [],
	 extra_attr = [], score = 0, all_score = 0,
	 extra = []  :: [tuple()], data = []  :: [any()],
	 price = 0, set_id = 0  :: pos_integer(),
	 career = 0  :: pos_integer(), gemstones = []  :: list(),
	 star_lev = 0  :: pos_integer(),
	 break_count = 0  :: pos_integer(), holy_eqm_attr = []}).

-record(item_make_args,
	{base_id = 0, bind = 0, quantity = 0, step = 0,
	 flag = default_iflag}).

-file("src/mod/item/item.erl", 27).

-file("inc/assets.hrl", 1).

-file("inc/game_assets.hrl", 1).

-file("inc/assets.hrl", 12).

-record(assets,
	{ver = -1, exp = 0, coin = 0, silver_coin = 0, gold = 0,
	 red_gold = 0, gold_acc = 0, vip_exp = 0, energy = 0,
	 energy_max = 0, energy_time = 0, activity = 0,
	 guild = 0, arena_cent = 0, hero_soul = 0,
	 feat_point = 0, triple_rebate = 0, friend_point = 0,
	 boss_point = 0, star_hun = 0, star_point = 0,
	 arena_guesscent = 0, sky_coin = 0, hero_exp = 0,
	 recruit_hero = 0, recruithigh_hero = 0,
	 expedition_medal = 0, elite_coin = 0, holy_eqm_coin = 0,
	 skin_debris = 0, cluster_coin = 0, home_coin = 0,
	 hallow_refine = 0, cluster_guess_cent = 0,
	 feather_exchange = 0, brave_symbol = 0,
	 peak_guess_cent = 0, hero_soul_coin = 0,
	 acc_recruit_hero = 0, predict_point = 0}).

-file("src/mod/item/item.erl", 28).

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

-file("src/mod/item/item.erl", 29).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/item/item.erl", 30).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/item/item.erl", 31).

-file("inc/log.hrl", 1).

-file("src/mod/item/item.erl", 32).

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

-file("src/mod/item/item.erl", 33).

-spec login(Role :: #role{}) -> {ok,
				 NewRole :: #role{}}.

login(Role) ->
    NRole = overdue(Role), {ok, set_timer(NRole)}.

-spec make(BaseId :: pos_integer(), Bind :: 1 | 0,
	   Quantity :: pos_integer()) -> false |
					 {ok, [Item :: #item{}]}.

make(BaseId, Bind, Quantity) ->
    make(#item_make_args{base_id = BaseId, bind = Bind,
			 quantity = Quantity,
			 flag = util:get(role_item_make_flag, default_iflag)}).

make(BaseId, Bind, Quantity, Flag) ->
    make(#item_make_args{base_id = BaseId, bind = Bind,
			 quantity = Quantity, flag = Flag}).

make({BaseId, Bind, Quantity}) ->
    make(#item_make_args{base_id = BaseId, bind = Bind,
			 quantity = Quantity});
make({BaseId, Bind, Quantity, Flag}) ->
    make(#item_make_args{base_id = BaseId, bind = Bind,
			 quantity = Quantity, flag = Flag});
make(Item = #item{}) -> {ok, [Item]};
make(#item_make_args{quantity = 0}) -> false;
make(#item_make_args{base_id = BaseId, bind = _Bind,
		     quantity = Quantity, flag = Flag}) ->
    Bind = 1,
    case item_data:get(BaseId) of
      #item_base{type = 9999} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem56, _, {__Levelitem56, __Tracesitem56}}
		when __Levelitem56 band 8 /= 0 orelse
		       __Tracesitem56 /= [] ->
		lager:do_log(error,
			     [{module, item}, {function, make}, {line, 56},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("生成错误的道具[BaseId:~w] From:~w flag=~w",
					   [BaseId, util:get_stacktrace(),
					    Flag]),
			     none, 4096, 8, __Levelitem56, __Tracesitem56,
			     lager_event, __Piditem56);
	    _ -> ok
	  end,
	  false;
      #item_base{quality = Quality, use_count = UseCount,
		 eqm_set = SetId, career = Career, ext = Ext,
		 attr = Attr, type = Type, condition = _Condition,
		 overlap = OverLap, expire_type = OldExpireType,
		 expire_time = OldExpireTime} ->
	  {ExpireType, ExpireTime} = make_expire(BaseId,
						 OldExpireType, OldExpireTime),
	  {MainAttr, Score} = case lists:keyfind(main_attr, 1,
						 Ext)
				  of
				false -> {[], 0};
				{_, MainAttrTemp} ->
				    {MainAttrTemp,
				     partner_lib:get_eqm_score(MainAttrTemp)}
			      end,
	  ItemT = #item{ver = 3, extra = [{11, UseCount}],
			set_id = SetId, career = Career, score = Score,
			all_score = Score, bind = Bind, base_id = BaseId,
			main_attr = MainAttr, quality = Quality, attr = Attr,
			quantity = Quantity, type = Type,
			expire_type = ExpireType, expire_time = ExpireTime},
	  case Quantity =< OverLap of
	    true ->
		Item0 = partner_artifact:init(ItemT, init_skill,
					      init_attr),
		NewItem = partner_holy_eqm:init(Item0),
		{ok, [NewItem]};
	    false ->
		do_make(ItemT#item{quantity = OverLap}, OverLap,
			Quantity, [])
	  end;
      _Err -> false
    end;
make(ItemInfo) when is_list(ItemInfo) ->
    makes(ItemInfo, []);
make(_Unkown) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem77, _, {__Levelitem77, __Tracesitem77}}
	  when __Levelitem77 band 8 /= 0 orelse
		 __Tracesitem77 /= [] ->
	  lager:do_log(error,
		       [{module, item}, {function, make}, {line, 77},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("生成一个物品错误Err:~w", [_Unkown]), none, 4096,
		       8, __Levelitem77, __Tracesitem77, lager_event,
		       __Piditem77);
      _ -> ok
    end,
    false.

makes([], Items) -> {ok, Items};
makes([H | Rest], Items) ->
    NewItems = case make(H) of
		 {ok, AddItems} -> AddItems ++ Items;
		 _ -> Items
	       end,
    makes(Rest, NewItems).

-spec use_normal(Role :: #role{}, Item :: #item{},
		 ItemBase :: #item_base{}, Num :: pos_integer(),
		 Args :: tuple()) -> {false, Reason :: bitstring()} |
				     {ok, NewRole :: #role{}}.

use_normal(Role, _Item,
	   ItemBase = #item_base{effect = Effect}, Num, Args) ->
    case item_effect:do(Effect, ItemBase, Role, Num, Args)
	of
      {ok, NewRole} ->
	  item_effect:msg(ItemBase, Num, NewRole), {ok, NewRole};
      {false, Reason} -> {false, Reason}
    end.

-spec check_expire(Item :: #item{}) -> true | false.

check_expire(#item{expire_type = 0}) -> false;
check_expire(#item{expire_type = 4}) -> false;
check_expire(#item{expire_type = 3}) -> false;
check_expire(#item{expire_type = 6}) -> false;
check_expire(#item{expire_type = 5}) -> false;
check_expire(#item{base_id = BaseId,
		   expire_time = 0}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem108, _, {__Levelitem108, __Tracesitem108}}
	  when __Levelitem108 band 8 /= 0 orelse
		 __Tracesitem108 /= [] ->
	  lager:do_log(error,
		       [{module, item}, {function, check_expire}, {line, 108},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]的过期时间设置错误", [BaseId]), none, 4096, 8,
		       __Levelitem108, __Tracesitem108, lager_event,
		       __Piditem108);
      _ -> ok
    end,
    false;
check_expire(#item{expire_time = EndTime}) ->
    Now = date:unixtime(), Now >= EndTime.

-spec check_expire(Now :: pos_integer(),
		   Item :: #item{}) -> true | false.

check_expire(_Now, #item{expire_type = 0}) -> false;
check_expire(_Now, #item{expire_type = 4}) -> false;
check_expire(_Now, #item{expire_type = 3}) -> false;
check_expire(_Now, #item{expire_type = 6}) -> false;
check_expire(_Now, #item{expire_type = 5}) -> false;
check_expire(_Now,
	     #item{base_id = BaseId, expire_time = 0}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem122, _, {__Levelitem122, __Tracesitem122}}
	  when __Levelitem122 band 8 /= 0 orelse
		 __Tracesitem122 /= [] ->
	  lager:do_log(error,
		       [{module, item}, {function, check_expire}, {line, 122},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]的过期时间设置错误", [BaseId]), none, 4096, 8,
		       __Levelitem122, __Tracesitem122, lager_event,
		       __Piditem122);
      _ -> ok
    end,
    false;
check_expire(Now, #item{expire_time = EndTime}) ->
    Now >= EndTime.

-spec check_start(Item :: #item{}) -> true | false.

check_start(#item{expire_type = 0}) -> true;
check_start(#item{expire_type = 2}) -> true;
check_start(#item{expire_type = 1}) -> true;
check_start(#item{expire_type = 5}) -> true;
check_start(#item{expire_type = 6}) -> true;
check_start(#item{base_id = BaseId, expire_time = 0}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem135, _, {__Levelitem135, __Tracesitem135}}
	  when __Levelitem135 band 8 /= 0 orelse
		 __Tracesitem135 /= [] ->
	  lager:do_log(error,
		       [{module, item}, {function, check_start}, {line, 135},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]的开启时间设置错误", [BaseId]), none, 4096, 8,
		       __Levelitem135, __Tracesitem135, lager_event,
		       __Piditem135);
      _ -> ok
    end,
    false;
check_start(#item{expire_time = StartTime}) ->
    Now = date:unixtime(), Now >= StartTime.

-spec attr(Atom,
	   Item :: #item{} | pos_integer()) -> bitstring() |
					       list() |
					       non_neg_integer() when Atom ::
									  name |
									  set_id |
									  base_attr |
									  effect.

attr(name, #item{base_id = BaseId}) ->
    case item_data:get(BaseId) of
      #item_base{name = Name} -> Name;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem148, _, {__Levelitem148, __Tracesitem148}}
		when __Levelitem148 band 8 /= 0 orelse
		       __Tracesitem148 /= [] ->
		lager:do_log(error,
			     [{module, item}, {function, attr}, {line, 148},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("发现错误的道具,[~w]", [BaseId]), none,
			     4096, 8, __Levelitem148, __Tracesitem148,
			     lager_event, __Piditem148);
	    _ -> ok
	  end,
	  lang:get(<<"未知物体"/utf8>>)
    end;
attr(name, BaseId) ->
    case item_data:get(BaseId) of
      #item_base{name = Name} -> Name;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem155, _, {__Levelitem155, __Tracesitem155}}
		when __Levelitem155 band 8 /= 0 orelse
		       __Tracesitem155 /= [] ->
		lager:do_log(error,
			     [{module, item}, {function, attr}, {line, 155},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("发现错误的道具,[~w]", [BaseId]), none,
			     4096, 8, __Levelitem155, __Tracesitem155,
			     lager_event, __Piditem155);
	    _ -> ok
	  end,
	  lang:get(<<"未知物体"/utf8>>)
    end;
attr(base_attr, #item{base_id = BaseId}) ->
    case item_data:get(BaseId) of
      #item_base{attr = Attr} -> Attr;
      _ -> []
    end;
attr(base_attr, BaseId) ->
    case item_data:get(BaseId) of
      #item_base{attr = Attr} -> Attr;
      _ -> []
    end;
attr(effect, #item{base_id = BaseId}) ->
    case item_data:get(BaseId) of
      #item_base{effect = Effect} -> Effect;
      _ -> []
    end;
attr(effect, BaseId) ->
    case item_data:get(BaseId) of
      #item_base{effect = Effect} -> Effect;
      _ -> []
    end;
attr(type, BaseId) ->
    case item_data:get(BaseId) of
      #item_base{type = Type} -> Type;
      _ -> 0
    end;
attr(quality, BaseId) ->
    case item_data:get(BaseId) of
      #item_base{quality = Quality} -> Quality;
      _ -> 0
    end;
attr(use_type, BaseId) ->
    case item_data:get(BaseId) of
      #item_base{use_type = UseType} -> UseType;
      _ -> 0
    end;
attr(expire, BaseId) ->
    case item_data:get(BaseId) of
      #item_base{expire_type = ExpireType,
		 expire_time = ExpireTime} ->
	  {ExpireType, ExpireTime};
      _ -> {0, 0}
    end.

-spec match(ExtraVal :: pos_integer(), #item{},
	    DefaultVal :: non_neg_integer()) -> Val ::
						    non_neg_integer().

match(_Err, _, Val) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem204, _, {__Levelitem204, __Tracesitem204}}
	  when __Levelitem204 band 8 /= 0 orelse
		 __Tracesitem204 /= [] ->
	  lager:do_log(error,
		       [{module, item}, {function, match}, {line, 204},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("匹配不存在的字段:~w", [_Err]), none, 4096, 8,
		       __Levelitem204, __Tracesitem204, lager_event,
		       __Piditem204);
      _ -> ok
    end,
    Val.

-spec match_update({pos_integer(),
		    pos_integer() | bitstring()},
		   #item{}) -> #item{}.

match_update(_Err, Item) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem210, _, {__Levelitem210, __Tracesitem210}}
	  when __Levelitem210 band 8 /= 0 orelse
		 __Tracesitem210 /= [] ->
	  lager:do_log(error,
		       [{module, item}, {function, match_update}, {line, 210},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("匹配更新不存在:~w", [_Err]), none, 4096, 8,
		       __Levelitem210, __Tracesitem210, lager_event,
		       __Piditem210);
      _ -> ok
    end,
    Item.

get_expire_items(_Now, [], ExpireItems) -> ExpireItems;
get_expire_items(Now, [Item = #item{} | T],
		 ExpireItems) ->
    case check_expire(Now, Item) of
      true -> get_expire_items(Now, T, [Item | ExpireItems]);
      false -> get_expire_items(Now, T, ExpireItems)
    end.

-spec check(#role{}) -> {ok, #role{}}.

check(Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem247, _, {__Levelitem247, __Tracesitem247}}
	  when __Levelitem247 band 128 /= 0 orelse
		 __Tracesitem247 /= [] ->
	  lager:do_log(debug,
		       [{module, item}, {function, check}, {line, 247},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts进行物品过期检查", [Role#role.name]), none,
		       4096, 128, __Levelitem247, __Tracesitem247, lager_event,
		       __Piditem247);
      _ -> ok
    end,
    NRole = overdue(Role),
    {ok, set_timer(NRole)}.

set_timer(Role = #role{p_bag =
			   #package{items = Items}}) ->
    Now = date:unixtime(),
    case [ExpireTime - Now
	  || #item{expire_time = ExpireTime,
		   expire_type = ExpireType}
		 <- Items,
	     ExpireTime > 0, ExpireType == 1 orelse ExpireType == 2]
	of
      [] -> Role;
      TL ->
	  T = max(1, lists:min(TL)),
	  role_timer:set(#timer{id = item_expire_check_timer,
				timeout = T * 1000, m = item, f = check,
				a = []},
			 Role)
    end.

overdue(Role = #role{p_bag =
			 #package{items = Items}}) ->
    Now = date:unixtime(),
    LossItems = get_expire_items(Now, Items, []),
    AllLossId = [{IdT, NumT}
		 || #item{id = IdT, quantity = NumT} <- LossItems],
    Loss = format:val_to_loss(AllLossId, item_expire),
    case role_gain:do(Role, Loss) of
      {ok, NRole} ->
	  log:log_gain(Loss, Role, NRole, <<"物品过期"/utf8>>,
		       util:fbin("过期物品 ~w", [LossItems])),
	  NRole;
      _ -> Role
    end.

make_cond(Lev, Career, Sex, Condition) ->
    {LevCond, NewLev} = case Lev >= 0 of
			  true ->
			      {[#condition{label = lev, op = ge, val = Lev}],
			       Lev};
			  false -> {[], 0}
			end,
    {CareerCond, NewCareer} = case Career >= 0 andalso
				     Career =< 0
				  of
				true ->
				    {[#condition{label = career, op = eq,
						 val = Career}],
				     Career};
				false ->
				    {[#condition{label = career, op = eq,
						 val = 0}],
				     0}
			      end,
    {SexCond, NewSex} = case Sex >= 1 andalso Sex =< 2 of
			  true ->
			      {[#condition{label = sex, op = eq, val = Sex}],
			       Sex};
			  false -> {[], 2}
			end,
    {LevCond ++ CareerCond ++ SexCond ++ Condition, NewLev,
     NewCareer, NewSex}.

make_expire(_, 0, 0) -> {0, 0};
make_expire(_BaseId, _, 0) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem293, _, {__Levelitem293, __Tracesitem293}}
	  when __Levelitem293 band 8 /= 0 orelse
		 __Tracesitem293 /= [] ->
	  lager:do_log(error,
		       [{module, item}, {function, make_expire}, {line, 293},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]的过期时间设置错误", [_BaseId]), none, 4096,
		       8, __Levelitem293, __Tracesitem293, lager_event,
		       __Piditem293);
      _ -> ok
    end,
    {0, 0};
make_expire(_BaseId, 5, _Minute) -> {5, 0};
make_expire(_BaseId, 6, _Data) -> {6, 0};
make_expire(_BaseId, 1, Minute) ->
    EndTime = date:unixtime() + Minute * 60, {1, EndTime};
make_expire(_BaseId, 3, Minute) ->
    StartTime = date:unixtime() + Minute * 60,
    {3, StartTime};
make_expire(_BaseId, 2,
	    {{Year, Month, Day}, {Hour, Minute, Seconds}}) ->
    case date:datetime_to_seconds({{Year, Month, Day},
				   {Hour, Minute, Seconds}})
	of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem315, _, {__Levelitem315, __Tracesitem315}}
		when __Levelitem315 band 8 /= 0 orelse
		       __Tracesitem315 /= [] ->
		lager:do_log(error,
			     [{module, item}, {function, make_expire},
			      {line, 315}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]的过期时间设置错误", [_BaseId]), none,
			     4096, 8, __Levelitem315, __Tracesitem315,
			     lager_event, __Piditem315);
	    _ -> ok
	  end,
	  {0, 0};
      End -> {2, End}
    end;
make_expire(_BaseId, 4,
	    {{Year, Month, Day}, {Hour, Minute, Seconds}}) ->
    case date:datetime_to_seconds({{Year, Month, Day},
				   {Hour, Minute, Seconds}})
	of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem322, _, {__Levelitem322, __Tracesitem322}}
		when __Levelitem322 band 8 /= 0 orelse
		       __Tracesitem322 /= [] ->
		lager:do_log(error,
			     [{module, item}, {function, make_expire},
			      {line, 322}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]的开启时间设置错误", [_BaseId]), none,
			     4096, 8, __Levelitem322, __Tracesitem322,
			     lager_event, __Piditem322);
	    _ -> ok
	  end,
	  {0, 0};
      Start -> {4, Start}
    end;
make_expire(_BaseId, _, _) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem326, _, {__Levelitem326, __Tracesitem326}}
	  when __Levelitem326 band 8 /= 0 orelse
		 __Tracesitem326 /= [] ->
	  lager:do_log(error,
		       [{module, item}, {function, make_expire}, {line, 326},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]的过期时间设置错误", [_BaseId]), none, 4096,
		       8, __Levelitem326, __Tracesitem326, lager_event,
		       __Piditem326);
      _ -> ok
    end.

do_make(_BaseItem, _OverLap, 0, Items) -> {ok, Items};
do_make(BaseItem, OverLap, Quantity, Items)
    when Quantity >= OverLap ->
    Item0 = partner_artifact:init(BaseItem, init_skill,
				  init_attr),
    NewItem = partner_holy_eqm:init(Item0),
    do_make(BaseItem, OverLap, Quantity - OverLap,
	    [NewItem | Items]);
do_make(BaseItem, OverLap, Quantity, Items)
    when OverLap > Quantity ->
    NItem = partner_artifact:init(BaseItem, init_skill,
				  init_attr),
    Item0 = partner_holy_eqm:init(NItem),
    NewItem = Item0#item{quantity = Quantity},
    do_make(BaseItem, OverLap, 0, [NewItem | Items]).


