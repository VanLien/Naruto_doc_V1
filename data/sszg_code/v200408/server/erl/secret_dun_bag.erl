-file("src/mod/secret_dun/secret_dun_bag.erl", 1).

-module(secret_dun_bag).

-lager_records([{load_partner,
		 [ver, pos, bid, lev, name, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{secret_item, [ver, id, base_id, num]},
		{evt_data,
		 [id, type, ext, win_delete, false_delete,
		  win_reward_time, win_reward_list, false_reward_time,
		  false_reward_list, exchange_id, group_id]},
		{secret_tile,
		 [ver, index, is_walk, status, evtid, win_reward_time,
		  false_reward_time, res_id, is_born, ext, defend_radio,
		  platform, switch, is_hide]},
		{secret_floor,
		 [ver, floor, index, map_id, tile_list, walk_tile,
		  fight_ids]},
		{m_secret_dun,
		 [ver, dun_id, dun_floor, val, max_val, floor_list,
		  dun_ids, reward_dun_ids, update_time, partners_hp_radio,
		  bag, bag_next_id, buffs, session_ids, load_partners,
		  load_partners_next_id, dun_power, formation]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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

-export([push/2, push/3, gain/2, gain/3, loss/3,
	 loss/2]).

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

-file("src/mod/secret_dun/secret_dun_bag.erl", 16).

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

-file("src/mod/secret_dun/secret_dun_bag.erl", 17).

-file("inc/secret_dun.hrl", 1).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("inc/secret_dun.hrl", 7).

-record(m_secret_dun,
	{ver = 3  :: pos_integer(),
	 dun_id = 0  :: pos_integer(),
	 dun_floor = 1  :: pos_integer(),
	 val = 0  :: pos_integer(),
	 max_val = 0  :: pos_integer(),
	 floor_list = []  :: list(), dun_ids = []  :: list(),
	 reward_dun_ids = []  :: list(),
	 update_time = 0  :: pos_integer(),
	 partners_hp_radio = []  :: list(), bag = []  :: list(),
	 bag_next_id = 1  :: list(), buffs = []  :: list(),
	 session_ids = []  :: list(),
	 load_partners = []  :: list(),
	 load_partners_next_id = 1  :: pos_integer(),
	 dun_power = 0  :: pos_integer(),
	 formation = {1, [], 0}  :: tuple()}).

-record(secret_floor,
	{ver = 2  :: pos_integer(), floor = 1  :: pos_integer(),
	 index = 0  :: pos_integer(), map_id  :: pos_integer(),
	 tile_list = []  :: list(), walk_tile = []  :: list(),
	 fight_ids = []  :: list()}).

-record(secret_tile,
	{ver = 1  :: pos_integer(), index = 0  :: pos_integer(),
	 is_walk = 0  :: pos_integer(),
	 status = 3  :: pos_integer(),
	 evtid = 0  :: pos_integer(),
	 win_reward_time = 0  :: pos_integer(),
	 false_reward_time = 0  :: pos_integer(),
	 res_id = 0  :: pos_integer(),
	 is_born = 0  :: pos_integer(), ext = []  :: list(),
	 defend_radio = []  :: list(),
	 platform = 0  :: boolean(), switch = 0  :: boolean(),
	 is_hide = 0  :: boolean()}).

-record(evt_data,
	{id = 0  :: pos_integer(), type = 0  :: pos_integer(),
	 ext = []  :: list(), win_delete = 1  :: boolean(),
	 false_delete = 1  :: boolean(),
	 win_reward_time = 1  :: pos_integer(),
	 win_reward_list = []  :: list(),
	 false_reward_time = 1  :: pos_integer(),
	 false_reward_list = []  :: list(),
	 exchange_id = -1  :: pos_integer(),
	 group_id = 0  :: pos_integer()}).

-record(secret_item,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 base_id = 0  :: pos_integer(),
	 num = 0  :: pos_integer()}).

-record(load_partner,
	{ver = 1  :: pos_integer(), pos = 1  :: pos_integer(),
	 bid = 1  :: pos_integer(), lev = 1  :: pos_integer(),
	 name = <<>>  :: binary(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/secret_dun/secret_dun_bag.erl", 18).

-spec push(#role{}, pos_integer()) -> ok.

push(#role{m_secret_dun = #m_secret_dun{bag = BagList}},
     Code = 23112) ->
    sys_conn:pack_send(Code, {BagList}), ok;
push(_, _) -> ok.

-spec push(#role{} | #m_secret_dun{}, pos_integer(),
	   list()) -> ok.

push(_, Code = 23113, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(_, Code = 23114, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(_, _, _) -> ok.

-spec gain(#role{} | #m_secret_dun{}, pos_integer(),
	   pos_integer()) -> {ok, #role{} | #m_secret_dun{}} |
			     {false, string()}.

gain(Role = #role{}, BaseId, Num) ->
    gain(Role, [{BaseId, Num}]);
gain(SecretDun = #m_secret_dun{}, BaseId, Num) ->
    gain(SecretDun, [{BaseId, Num}]).

-spec gain(#role{} | #m_secret_dun{}, list()) -> {ok,
						  #role{} | #m_secret_dun{}} |
						 {false, string()}.

gain(Role = #role{m_secret_dun =
		      SecretDun = #m_secret_dun{bag = BagList,
						bag_next_id = NextId}},
     GainList) ->
    case do_gain(BagList, NextId, GainList, []) of
      {false, Reason} -> {false, Reason};
      {NewBagList, NewNextId, PushList} ->
	  NewSecretDun = SecretDun#m_secret_dun{bag_next_id =
						    NewNextId,
						bag = NewBagList},
	  NewRole = Role#role{m_secret_dun = NewSecretDun},
	  push(NewRole, 23113, {PushList}),
	  {ok, NewRole}
    end;
gain(SecretDun = #m_secret_dun{bag = BagList,
			       bag_next_id = NextId},
     GainList) ->
    case do_gain(BagList, NextId, GainList, []) of
      {false, Reason} -> {false, Reason};
      {NewBagList, NewNextId, PushList} ->
	  NewSecretDun = SecretDun#m_secret_dun{bag_next_id =
						    NewNextId,
						bag = NewBagList},
	  push(NewSecretDun, 23113, {PushList}),
	  {ok, NewSecretDun}
    end.

-spec loss(#role{}, pos_integer(),
	   pos_integer()) -> {ok, #role{} | #m_secret_dun{}} |
			     {false, string()}.

loss(Role = #role{}, BaseId, Num) ->
    loss(Role, [{BaseId, Num}]);
loss(SecretDun = #m_secret_dun{}, BaseId, Num) ->
    loss(SecretDun, [{BaseId, Num}]).

-spec loss(#role{} | #m_secret_dun{}, list()) -> {ok,
						  #role{} | #m_secret_dun{}} |
						 {false, string()}.

loss(Role = #role{m_secret_dun =
		      SecretDun = #m_secret_dun{bag = BagList}},
     LossList) ->
    case do_loss(BagList, LossList, [], []) of
      {NewBagList, UpdatePushList, DeletePushList} ->
	  NewSecretDun = SecretDun#m_secret_dun{bag = NewBagList},
	  NewRole = Role#role{m_secret_dun = NewSecretDun},
	  push(NewRole, 23113, {UpdatePushList}),
	  push(NewRole, 23114, {DeletePushList}),
	  {ok, NewRole};
      {false, Reason} -> {false, Reason}
    end;
loss(SecretDun = #m_secret_dun{bag = BagList},
     LossList) ->
    case do_loss(BagList, LossList, [], []) of
      {NewBagList, UpdatePushList, DeletePushList} ->
	  NewSecretDun = SecretDun#m_secret_dun{bag = NewBagList},
	  push(NewSecretDun, 23113, {UpdatePushList}),
	  push(NewSecretDun, 23114, {DeletePushList}),
	  {ok, NewSecretDun};
      {false, Reason} -> {false, Reason}
    end.

do_gain(BagList, NextId, [], PushList) ->
    {BagList, NextId, PushList};
do_gain(_, _, [{_, Num} | _Rest], _) when Num < 1 ->
    {false, lang:get(<<"获得物品的数量错误"/utf8>>)};
do_gain(BagList, NextId, [{BaseId, Num} | Rest],
	PushList) ->
    case do_gain1(BagList, NextId, {BaseId, Num}, [],
		  PushList)
	of
      {false, Reason} -> {false, Reason};
      {NewBagList, NewNextId, NewPushList} ->
	  do_gain(NewBagList, NewNextId, Rest, NewPushList)
    end;
do_gain(_, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_gain1(BagList, NextId, {_, 0}, NewBagList,
	 PushList) ->
    {BagList ++ NewBagList, NextId, PushList};
do_gain1([], NextId, {BaseId, Num}, NewBagList,
	 PushList) ->
    case item_data:get_secret_dun_bag_max_num(BaseId) of
      MaxNum when is_integer(MaxNum), Num =< MaxNum ->
	  SecretItem = #secret_item{id = NextId, base_id = BaseId,
				    num = Num},
	  do_gain1([], NextId + 1, {BaseId, 0},
		   [SecretItem | NewBagList],
		   [{NextId, BaseId, Num} | PushList]);
      MaxNum when is_integer(MaxNum) ->
	  SecretItem = #secret_item{id = NextId, base_id = BaseId,
				    num = MaxNum},
	  NewNum = max(0, Num - MaxNum),
	  do_gain1([], NextId + 1, {BaseId, NewNum},
		   [SecretItem | NewBagList],
		   [{NextId, BaseId, MaxNum} | PushList]);
      _ -> {false, lang:get(<<"没有该物品的数据"/utf8>>)}
    end;
do_gain1([SecretItem = #secret_item{base_id = BaseId,
				    num = OldNum, id = Pos}
	  | Rest],
	 NextId, {BaseId, Num}, NewBagList, PushList) ->
    case item_data:get_secret_dun_bag_max_num(BaseId) of
      MaxNum when is_integer(MaxNum), OldNum < MaxNum ->
	  case OldNum + Num > MaxNum of
	    true ->
		NewSecretItem = SecretItem#secret_item{num = MaxNum},
		NewNum = OldNum + Num - MaxNum,
		do_gain1(Rest, NextId, {BaseId, NewNum},
			 [NewSecretItem | NewBagList],
			 [{Pos, BaseId, MaxNum} | PushList]);
	    _ ->
		NewSecretItem = SecretItem#secret_item{num =
							   OldNum + Num},
		do_gain1(Rest, NextId, {BaseId, 0},
			 [NewSecretItem | NewBagList],
			 [{Pos, BaseId, OldNum + Num} | PushList])
	  end;
      MaxNum when is_integer(MaxNum) ->
	  do_gain1(Rest, NextId, {BaseId, Num},
		   [SecretItem | NewBagList], PushList);
      _ -> {false, lang:get(<<"没有该物品的数据"/utf8>>)}
    end;
do_gain1([SecretItem = #secret_item{} | Rest], NextId,
	 {BaseId, Num}, NewBagList, PushList) ->
    do_gain1(Rest, NextId, {BaseId, Num},
	     [SecretItem | NewBagList], PushList);
do_gain1(_, _, _, _, _) ->
    {false, lang:get(<<"获得物品失败"/utf8>>)}.

do_loss(BagList, [], UpdatePushList, DeletePushList) ->
    {BagList, UpdatePushList, DeletePushList};
do_loss(_, [{_, Num} | _], _, _) when Num < 1 ->
    {false, lang:get(<<"物品数量错误"/utf8>>)};
do_loss(BagList, [{BaseId, Num} | Rest], UpdatePushList,
	DeletePushList) ->
    case do_loss1(BagList, {BaseId, Num}, UpdatePushList,
		  DeletePushList)
	of
      {NewBagList, NewUpdatePushList, NewDeletePushList} ->
	  do_loss(NewBagList, Rest, NewUpdatePushList,
		  NewDeletePushList);
      {false, Reason} -> {false, Reason}
    end;
do_loss(_, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_loss1(BagList, {_, 0}, UpdatePushList,
	 DeletePushList) ->
    {BagList, UpdatePushList, DeletePushList};
do_loss1(BagList, {BaseId, Num}, UpdatePushList,
	 DeletePushList) ->
    case lists:keyfind(BaseId, #secret_item.base_id,
		       BagList)
	of
      SecretItem = #secret_item{num = OldNum, id = Pos}
	  when Num < OldNum ->
	  NewSecretItem = SecretItem#secret_item{num =
						     OldNum - Num},
	  NewBagList = lists:keyreplace(BaseId,
					#secret_item.base_id, BagList,
					NewSecretItem),
	  do_loss1(NewBagList, {BaseId, 0},
		   [{Pos, BaseId, OldNum - Num} | UpdatePushList],
		   DeletePushList);
      SecretItem = #secret_item{num = OldNum, id = Pos} ->
	  NewBagList = lists:delete(SecretItem, BagList),
	  do_loss1(NewBagList, {BaseId, max(0, Num - OldNum)},
		   UpdatePushList, [Pos | DeletePushList]);
      _ -> {false, lang:get(<<"道具不足"/utf8>>)}
    end;
do_loss1(_, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.


