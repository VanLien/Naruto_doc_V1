-file("src/mod/drop/drop.erl", 1).

-module(drop).

-lager_records([{drop_role,
		 [id, career, lev, name, num_best, num_common,
		  is_person_limit, drop_total, limit_flag, drop_limit,
		  common_list, best_list, item_list, notice_list]},
		{drop_group,
		 [group, item_bid, item_name, item_num, bind, rand,
		  career, lev]},
		{drop_son,
		 [drop_id, name, item_bid, item_name, item_num, bind,
		  rand, is_notice, career, lev, self_time, srv_time,
		  self_count, srv_count, self_down, self_up, world_lev]},
		{drop_total,
		 [drop_id, name, allot, super_r, first_r, second_r,
		  third_r, notice_msg]},
		{drop_bag, [ver, id, mon, mon_cache, common]},
		{drop_limit,
		 [ver, time_val, count_val, down_val, up_val]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([get_key/1, calc_drop_num/1, drop_son/7,
	 get_time_val/2, set_time_val/4, unset_time_val/2,
	 get_count_val/2, set_count_val/4, unset_count_val/2,
	 init_down_val/1, get_down_val/2, set_down_val/4,
	 unset_down_val/2, init_up_val/1, get_up_val/2,
	 set_up_val/4, unset_up_val/2, up_limit/4,
	 drop_son2item/5, is_group_item/1]).

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

-file("src/mod/drop/drop.erl", 39).

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

-file("src/mod/drop/drop.erl", 40).

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

-file("src/mod/drop/drop.erl", 41).

-file("inc/drop.hrl", 1).

-record(drop_limit,
	{ver = 1, time_val = [], count_val = [], down_val = [],
	 up_val = []}).

-record(drop_bag,
	{ver = 1, id = {0, <<>>}, mon = #drop_limit{},
	 mon_cache = #drop_limit{}, common = #drop_limit{}}).

-record(drop_total,
	{drop_id = 0, name = <<>>, allot = 0, super_r = 0,
	 first_r = 0, second_r = 0, third_r = 0,
	 notice_msg = <<>>}).

-record(drop_son,
	{drop_id = 0, name = <<>>, item_bid = 0,
	 item_name = <<>>, item_num = 0, bind = 1, rand = 0,
	 is_notice = 0, career = 0, lev = 0, self_time = 0,
	 srv_time = 0, self_count = 0, srv_count = 0,
	 self_down = 0, self_up = 0, world_lev = 0}).

-record(drop_group,
	{group = 0, item_bid = 0, item_name = <<>>,
	 item_num = 0, bind = 1, rand = 0, career = 0, lev = 0}).

-record(drop_role,
	{id = {0, <<>>}, career = 0, lev = 0, name = <<>>,
	 num_best = 0, num_common = 0, is_person_limit = 1,
	 drop_total = undefined, limit_flag = 1,
	 drop_limit = #drop_limit{}, common_list = [],
	 best_list = [], item_list = [], notice_list = []}).

-file("src/mod/drop/drop.erl", 42).

get_key(#drop_son{drop_id = DropId,
		  item_bid = ItemBid}) ->
    {DropId, ItemBid}.

calc_drop_num(#drop_total{super_r = PBest, first_r = Pa,
			  second_r = Pb, third_r = Pc}) ->
    RandBest = util:rand(1, 10000),
    case RandBest =< PBest of
      true -> {calc_drop_num_common([Pb, Pc], 0), 1};
      false -> {calc_drop_num_common([Pa, Pb, Pc], 0), 0}
    end.

calc_drop_num_common([], R) -> R;
calc_drop_num_common([PP | L], R) ->
    Rand = util:rand(1, 10000),
    case Rand =< PP of
      true -> calc_drop_num_common(L, R + 1);
      false -> calc_drop_num_common(L, R)
    end.

drop_son(DropNum, Label, DropTotal, DropBag, Career,
	 Lev, IsPersonLimit) ->
    drop_more(DropNum, Label, DropTotal, DropBag, Career,
	      Lev, IsPersonLimit, []).

drop_more(DropNum, _Label, _DropTotal, DropBag, _Career,
	  _Lev, _IsPersonLimit, R)
    when DropNum =< 0 ->
    {R, DropBag};
drop_more(DropNum, Label, DropTotal, DropBag, Career,
	  Lev, IsPersonLimit, R) ->
    {TmpDropSon, DropBag2} = drop_one(Label, DropTotal,
				      DropBag, Career, Lev, IsPersonLimit),
    R2 = case TmpDropSon of
	   #drop_son{} -> [TmpDropSon | R];
	   _ -> R
	 end,
    drop_more(DropNum - 1, Label, DropTotal, DropBag2,
	      Career, Lev, IsPersonLimit, R2).

drop_one(Label,
	 DropTotal = #drop_total{drop_id = DropId}, DropBag,
	 Career, Lev, IsPersonLimit) ->
    DropSonList0 = case Label of
		     best -> drop_data:best_list(DropId);
		     common -> drop_data:common_list(DropId)
		   end,
    DropSonList = [XDropSon
		   || XDropSon <- DropSonList0,
		      XDropSon#drop_son.rand > 0],
    WorldLev = 0,
    DropSonList2 = if IsPersonLimit == 0 -> DropSonList;
		      true ->
			  filter_condtion(Career, Lev, WorldLev, DropSonList)
		   end,
    DropSonList3 = filter_limit(DropTotal, DropBag,
				DropSonList2),
    DropSon = case DropSonList3 == [] of
		true -> undefined;
		false ->
		    case find_up_val(DropSonList3, DropBag) of
		      {ok, TmpDropSon} -> TmpDropSon;
		      _ ->
			  case list_util:keyrand(DropSonList3, #drop_son.rand)
			      of
			    TmpDropSon2 = #drop_son{} -> TmpDropSon2;
			    _ -> undefined
			  end
		    end
	      end,
    DropBag2 = up_limit(DropSonList, DropSon, DropBag,
			IsPersonLimit),
    {DropSon, DropBag2}.

up_limit([], _GetDropSon, DropBag, _IsPersonLimit) ->
    DropBag;
up_limit([DropSon | DropSonList], GetDropSon, DropBag,
	 IsPersonLimit) ->
    DropBag2 = case IsPersonLimit == 1 of
		 false -> DropBag;
		 true -> up_limit_personal(DropSon, GetDropSon, DropBag)
	       end,
    up_limit_global(DropSon, GetDropSon),
    up_limit(DropSonList, GetDropSon, DropBag2,
	     IsPersonLimit).

drop_son2item(_Career, _Lev, [], R, N) -> {R, N};
drop_son2item(Career, Lev,
	      [#drop_son{drop_id = DropId, item_bid = ItemBid,
			 item_num = ItemNum, bind = Bind, is_notice = IsNotice}
	       | DropSonList],
	      R, N) ->
    {R2, NewItemBid} = case is_group_item(ItemBid) of
			 true ->
			     case group2item(Career, Lev, ItemBid) of
			       #drop_group{item_bid = ItemBid2,
					   item_num = ItemNum2, bind = Bind2} ->
				   {item_lib:merge([{ItemBid2, Bind2,
						     ItemNum2}],
						   R),
				    ItemBid2};
			       _ ->
				   case {whereis(lager_event),
					 whereis(lager_event),
					 lager_config:get({lager_event,
							   loglevel},
							  {0, []})}
				       of
				     {undefined, undefined, _} ->
					 fun () -> {error, lager_not_running}
					 end();
				     {undefined, _, _} ->
					 fun () ->
						 {error,
						  {sink_not_configured,
						   lager_event}}
					 end();
				     {__Piddrop139, _,
				      {__Leveldrop139, __Tracesdrop139}}
					 when __Leveldrop139 band 8 /= 0 orelse
						__Tracesdrop139 /= [] ->
					 lager:do_log(error,
						      [{module, drop},
						       {function,
							drop_son2item},
						       {line, 139},
						       {pid,
							pid_to_list(self())},
						       {node, node()}
						       | lager:md()],
						      io_lib:format("[~w]掉落组配置数据异常:Career:~w Lev:~w ItemBid:~w",
								    [DropId,
								     Career,
								     Lev,
								     ItemBid]),
						      none, 4096, 8,
						      __Leveldrop139,
						      __Tracesdrop139,
						      lager_event,
						      __Piddrop139);
				     _ -> ok
				   end,
				   R
			     end;
			 false ->
			     {item_lib:merge([{ItemBid, Bind, ItemNum}], R),
			      ItemBid}
		       end,
    N2 = case IsNotice of
	   1 -> [{NewItemBid, ItemNum} | N];
	   _ -> N
	 end,
    drop_son2item(Career, Lev, DropSonList, R2, N2).

group2item(Career, Lev, GroupId) ->
    DropGroupList = drop_data:drop_group(GroupId),
    DropGroupList2 = group2item_f1(Career, Lev,
				   DropGroupList, []),
    list_util:keyrand(DropGroupList2, #drop_group.rand).

group2item_f1(_Career, _Lev, [], R) -> R;
group2item_f1(Career, Lev, [DropGroup | DropGroupList],
	      R) ->
    R2 = case filter_condtion_career(Career, DropGroup) of
	   false -> R;
	   true ->
	       case filter_condtion_lev(Lev, DropGroup) of
		 false -> R;
		 true -> [DropGroup | R]
	       end
	 end,
    group2item_f1(Career, Lev, DropGroupList, R2).

filter_timeout_val([], R, _Now) -> R;
filter_timeout_val([{K, Val, Timeout} | L], R, Now) ->
    R2 = case Timeout == 0 of
	   true -> [{K, Val, Timeout} | R];
	   false ->
	       case Timeout > Now of
		 true -> [{K, Val, Timeout} | R];
		 false -> R
	       end
	 end,
    filter_timeout_val(L, R2, Now).

get_time_val(#drop_limit{time_val = TimeVal}, Key)
    when is_list(TimeVal) ->
    case lists:keyfind(Key, 1, TimeVal) of
      false -> {0, 0};
      {_, Val, TimeOut} ->
	  Now = date:unixtime(),
	  case Now >= TimeOut of
	    true -> {0, 0};
	    false -> {Val, TimeOut}
	  end
    end.

set_time_val(DropLimit = #drop_limit{time_val =
					 TimeVal},
	     Key, Val, TimeOut) ->
    TimeVal2 = lists:keystore(Key, 1, TimeVal,
			      {Key, Val, TimeOut}),
    DropLimit#drop_limit{time_val = TimeVal2}.

unset_time_val(DropLimit = #drop_limit{time_val =
					   TimeVal},
	       Key) ->
    TimeVal2 = lists:keydelete(Key, 1, TimeVal),
    DropLimit#drop_limit{time_val = TimeVal2}.

get_count_val(#drop_limit{count_val = CountVal}, Key) ->
    case lists:keyfind(Key, 1, CountVal) of
      false -> {0, 0};
      {_, Num, MaxNum} -> {Num, MaxNum}
    end.

set_count_val(DropLimit = #drop_limit{count_val =
					  CountVal},
	      Key, Val, MaxVal) ->
    CountVal2 = lists:keystore(Key, 1, CountVal,
			       {Key, Val, MaxVal}),
    DropLimit#drop_limit{count_val = CountVal2}.

unset_count_val(DropLimit = #drop_limit{count_val =
					    CountVal},
		Key) ->
    CountVal2 = lists:keydelete(Key, 1, CountVal),
    DropLimit#drop_limit{count_val = CountVal2}.

init_down_val(DropLimit = #drop_limit{down_val =
					  DownVal}) ->
    Now = date:unixtime(ms),
    DownVal2 = filter_timeout_val(DownVal, [], Now),
    DropLimit#drop_limit{down_val = DownVal2}.

get_down_val(#drop_limit{down_val = DownVal}, Key) ->
    case lists:keyfind(Key, 1, DownVal) of
      false -> {0, 0};
      {_, Val, TimeOut} ->
	  case TimeOut == 0 of
	    true -> {Val, TimeOut};
	    false ->
		Now = date:unixtime(),
		case Now >= TimeOut of
		  true -> {0, 0};
		  false -> {Val, TimeOut}
		end
	  end
    end.

set_down_val(DropLimit = #drop_limit{down_val =
					 DownVal},
	     Key, Val, TimeOut) ->
    DownVal2 = lists:keystore(Key, 1, DownVal,
			      {Key, Val, TimeOut}),
    DropLimit#drop_limit{down_val = DownVal2}.

unset_down_val(DropLimit = #drop_limit{down_val =
					   DownVal},
	       Key) ->
    DownVal2 = lists:keydelete(Key, 1, DownVal),
    DropLimit#drop_limit{down_val = DownVal2}.

init_up_val(DropLimit = #drop_limit{up_val = UpVal}) ->
    Now = date:unixtime(ms),
    UpVal2 = filter_timeout_val(UpVal, [], Now),
    DropLimit#drop_limit{up_val = UpVal2}.

get_up_val(#drop_limit{up_val = UpVal}, Key) ->
    case lists:keyfind(Key, 1, UpVal) of
      false -> {0, 0};
      {_, Val, TimeOut} ->
	  case TimeOut == 0 of
	    true -> {Val, TimeOut};
	    false ->
		Now = date:unixtime(),
		case Now >= TimeOut of
		  true -> {0, 0};
		  false -> {Val, TimeOut}
		end
	  end
    end.

set_up_val(DropLimit = #drop_limit{up_val = UpVal}, Key,
	   Val, TimeOut) ->
    NumVal2 = lists:keystore(Key, 1, UpVal,
			     {Key, Val, TimeOut}),
    DropLimit#drop_limit{up_val = NumVal2}.

unset_up_val(DropLimit = #drop_limit{up_val = UpVal},
	     Key) ->
    UpVal2 = lists:keydelete(Key, 1, UpVal),
    DropLimit#drop_limit{up_val = UpVal2}.

filter_condtion(Career, Lev, WorldLev, DropSonList) ->
    filter_condtion_f1(Career, Lev, WorldLev, DropSonList,
		       []).

filter_condtion_f1(_Career, _Lev, _WorldLev, [], R) ->
    R;
filter_condtion_f1(Career, Lev, WorldLev,
		   [DropSon | DropSonList], R) ->
    IsOk = filter_condtion_career(Career, DropSon),
    IsOk2 = case IsOk of
	      false -> false;
	      true -> filter_condtion_lev(Lev, DropSon)
	    end,
    IsOk3 = case IsOk2 of
	      false -> false;
	      true -> filter_condtion_world_lev(WorldLev, DropSon)
	    end,
    R2 = case IsOk3 of
	   true -> [DropSon | R];
	   false -> R
	 end,
    filter_condtion_f1(Career, Lev, WorldLev, DropSonList,
		       R2).

filter_condtion_career(Career,
		       #drop_son{career = NeedCareer}) ->
    filter_condtion_career(Career, NeedCareer);
filter_condtion_career(Career,
		       #drop_group{career = NeedCareer}) ->
    filter_condtion_career(Career, NeedCareer);
filter_condtion_career(_Career, 0) -> true;
filter_condtion_career(Career, NeedCareer) ->
    Career =:= NeedCareer.

filter_condtion_lev(Lev, #drop_son{lev = NeedLev}) ->
    filter_condtion_lev(Lev, NeedLev);
filter_condtion_lev(Lev, #drop_group{lev = NeedLev}) ->
    filter_condtion_lev(Lev, NeedLev);
filter_condtion_lev(Lev, {Min, Max}) ->
    Lev >= Min andalso Lev =< Max;
filter_condtion_lev(_Lev, _NeedLev) -> true.

filter_condtion_world_lev(WorldLev,
			  #drop_son{world_lev = NeedLev}) ->
    filter_condtion_world_lev(WorldLev, NeedLev);
filter_condtion_world_lev(WorldLev, {Min, Max}) ->
    WorldLev >= Min andalso WorldLev =< Max;
filter_condtion_world_lev(_WorldLev, _NeedLev) -> true.

filter_limit(DropTotal, DropBag, DropSonList) ->
    filter_limit_f1(DropTotal, DropBag, DropSonList, []).

filter_limit_f1(_DropTotal, _DropBag, [], R) -> R;
filter_limit_f1(DropTotal, DropBag,
		[DropSon | DropSonList], R) ->
    IsOk = case filter_limit_personal(DropTotal, DropBag,
				      DropSon)
	       of
	     false -> false;
	     true -> filter_limit_global(DropSon)
	   end,
    R2 = case IsOk of
	   true -> [DropSon | R];
	   false -> R
	 end,
    filter_limit_f1(DropTotal, DropBag, DropSonList, R2).

filter_limit_personal(#drop_total{allot = Allot},
		      DropBag, DropSon) ->
    if Allot == 3 -> true;
       true ->
	   case filter_limit_personal_self_time(DropBag, DropSon)
	       of
	     false -> false;
	     true ->
		 case filter_limit_personal_self_count(DropBag, DropSon)
		     of
		   false -> false;
		   true -> filter_limit_personal_down(DropBag, DropSon)
		 end
	   end
    end.

filter_limit_personal_self_time(DropBag,
				DropSon = #drop_son{self_time = SelfTime}) ->
    case SelfTime of
      {_Time, Count} ->
	  {Val, _TimeOut} = get_time_val(DropBag,
					 get_key(DropSon)),
	  Val < Count;
      _ -> true
    end.

filter_limit_personal_self_count(DropBag,
				 DropSon = #drop_son{self_count = SelfCount}) ->
    case SelfCount of
      {_MaxCount, Count} ->
	  {Val, _MaxVal} = get_count_val(DropBag,
					 get_key(DropSon)),
	  Val < Count;
      _ -> true
    end.

filter_limit_personal_down(DropBag,
			   DropSon = #drop_son{self_down = Down}) ->
    case Down of
      {_Type, Count} ->
	  {Val, _MaxVal} = get_down_val(DropBag,
					get_key(DropSon)),
	  Val >= Count;
      _ -> true
    end.

filter_limit_global(DropSon) ->
    case filter_limit_global_src_time(DropSon) of
      false -> false;
      true -> filter_limit_global_count_time(DropSon)
    end.

filter_limit_global_src_time(DropSon =
				 #drop_son{srv_time = SrcTime}) ->
    case SrcTime of
      {_Time, Count} ->
	  {Val, _} = drop_mgr:get_time_val(get_key(DropSon)),
	  Val < Count;
      _ -> true
    end.

filter_limit_global_count_time(DropSon =
				   #drop_son{srv_count = SrcCount}) ->
    case SrcCount of
      {_, Count} ->
	  {Val, _} = drop_mgr:get_count_val(get_key(DropSon)),
	  Val < Count;
      _ -> true
    end.

find_up_val([], _DropBag) -> {error, not_found};
find_up_val([DropSon = #drop_son{self_up = Up}
	     | DropSonList],
	    DropBag) ->
    case Up of
      {_, Count} ->
	  {Val, _TimeOut} = get_up_val(DropBag, get_key(DropSon)),
	  case Val >= Count of
	    true -> {ok, DropSon};
	    false -> find_up_val(DropSonList, DropBag)
	  end;
      _ -> find_up_val(DropSonList, DropBag)
    end.

up_limit_personal(DropSon, GetDropSon, DropBag) ->
    DropBag2 = up_limit_personal_time_val(DropSon,
					  GetDropSon, DropBag),
    DropBag3 = up_limit_personal_count_val(DropSon,
					   GetDropSon, DropBag2),
    DropBag4 = up_limit_personal_down_val(DropSon,
					  GetDropSon, DropBag3),
    DropBag5 = up_limit_personal_up_val(DropSon, GetDropSon,
					DropBag4),
    DropBag5.

up_limit_personal_time_val(DropSon = #drop_son{self_time
						   = SelfTime},
			   GetDropSon, DropBag) ->
    case SelfTime of
      {Time, _Count} ->
	  case is_equal(DropSon, GetDropSon) of
	    true ->
		Key = get_key(DropSon),
		{Val, TimeOut} = get_time_val(DropBag, Key),
		TimeOut2 = case TimeOut == 0 of
			     true ->
				 case Time of
				   day_count -> date:unixtime(zero) + 86400;
				   _ -> date:unixtime() + Time
				 end;
			     false -> TimeOut
			   end,
		TmpDropBag = set_time_val(DropBag, Key, Val + 1,
					  TimeOut2),
		TmpDropBag;
	    false -> DropBag
	  end;
      _ -> DropBag
    end.

up_limit_personal_count_val(DropSon =
				#drop_son{self_count = SelfCount},
			    GetDropSon, DropBag) ->
    case SelfCount of
      {MaxCount, _Count} ->
	  AddCount = case is_equal(DropSon, GetDropSon) of
		       true -> 1;
		       false -> 0
		     end,
	  Key = get_key(DropSon),
	  {Val, MaxVal} = get_count_val(DropBag, Key),
	  case MaxVal + 1 >= MaxCount of
	    true -> unset_count_val(DropBag, Key);
	    false ->
		set_count_val(DropBag, Key, Val + AddCount, MaxVal + 1)
	  end;
      _ -> DropBag
    end.

up_limit_personal_down_val(DropSon = #drop_son{self_down
						   = DownVal},
			   GetDropSon, DropBag) ->
    case DownVal of
      {Type, _Count} ->
	  Key = get_key(DropSon),
	  Now = date:unixtime(),
	  {Val, TimeOut} = get_down_val(DropBag, Key),
	  case is_equal(DropSon, GetDropSon) andalso
		 Now >= TimeOut
	      of
	    false ->
		TimeOut2 = case Type == 0 of
			     true -> 0;
			     false ->
				 case TimeOut == 0 of
				   true ->
				       date:unixtime() + get_down_up_time(Type);
				   false -> TimeOut
				 end
			   end,
		set_down_val(DropBag, Key, Val + 1, TimeOut2);
	    true -> unset_down_val(DropBag, Key)
	  end;
      _ -> DropBag
    end.

up_limit_personal_up_val(DropSon = #drop_son{self_up =
						 UpVal},
			 GetDropSon, DropBag) ->
    case UpVal of
      {Type, _Count} ->
	  Key = get_key(DropSon),
	  case is_equal(DropSon, GetDropSon) of
	    false ->
		{Val, TimeOut} = get_up_val(DropBag, Key),
		TimeOut2 = case Type == 0 of
			     true -> 0;
			     false ->
				 case TimeOut == 0 of
				   true ->
				       date:unixtime() + get_down_up_time(Type);
				   false -> TimeOut
				 end
			   end,
		set_up_val(DropBag, Key, Val + 1, TimeOut2);
	    true -> unset_up_val(DropBag, Key)
	  end;
      _ -> DropBag
    end.

up_limit_global(DropSon, GetDropSon) ->
    up_limit_global_time_val(DropSon, GetDropSon),
    up_limit_global_count_val(DropSon, GetDropSon).

up_limit_global_time_val(DropSon = #drop_son{srv_time =
						 SrcTime},
			 GetDropSon) ->
    case SrcTime of
      {Time, _Count} ->
	  case is_equal(DropSon, GetDropSon) of
	    true ->
		Key = get_key(DropSon),
		{Val, TimeOut} = drop_mgr:get_time_val(Key),
		TimeOut2 = case TimeOut == 0 of
			     true -> date:unixtime() + Time;
			     false -> TimeOut
			   end,
		drop_mgr:set_time_val(Key, Val + 1, TimeOut2);
	    false -> ok
	  end;
      _ -> ok
    end.

up_limit_global_count_val(DropSon = #drop_son{srv_count
						  = SrcCount},
			  GetDropSon) ->
    case SrcCount of
      {MaxCount, _Count} ->
	  AddCount = case is_equal(DropSon, GetDropSon) of
		       true -> 1;
		       false -> 0
		     end,
	  Key = get_key(DropSon),
	  {Val, MaxVal} = drop_mgr:get_count_val(Key),
	  case MaxVal + 1 >= MaxCount of
	    true -> drop_mgr:unset_count_val(Key);
	    false ->
		drop_mgr:set_count_val(Key, Val + AddCount, MaxVal + 1)
	  end;
      _ -> ok
    end.

is_equal(#drop_son{drop_id = DropId, item_bid = ItemBid,
		   item_num = ItemNum},
	 #drop_son{drop_id = DropId2, item_bid = ItemBid2,
		   item_num = ItemNum2}) ->
    DropId == DropId2 andalso
      ItemBid == ItemBid2 andalso ItemNum == ItemNum2;
is_equal(_, _) -> false.

get_down_up_time(0) -> 0;
get_down_up_time(1) -> 3600 * 24;
get_down_up_time(2) -> 3600 * 48;
get_down_up_time(3) -> 3600 * 72;
get_down_up_time(_) -> 3600 * 168.

is_group_item(9999) -> false;
is_group_item(ItemBid) ->
    ItemBid >= 1000 andalso ItemBid < 10000.


