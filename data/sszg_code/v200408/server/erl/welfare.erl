-file("src/mod/welfare/welfare.erl", 1).

-module(welfare).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{m_month_card,
		 [ver, card1_end_time, card2_end_time, card1_num,
		  card2_num, card1_gain, card2_gain, card1_status,
		  card2_status]},
		{dungeon_replay, [dun_id, replays]},
		{dungeon_replay_log,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{dungeon_data,
		 [id, name, chapter_id, mode, next_id, unit_id, items,
		  drop_ids, hook_unit_id, hook_items, hook_drop_ids,
		  hook_lev_add, time, is_big, energy_max, auto_items,
		  power, lev_limit, floor]},
		{dungeon, [id, status, cool_time, auto_num]},
		{dun_chapter, [id, status, list]},
		{m_dungeon,
		 [ver, mode, chapter_id, dun_id, max_dun_id,
		  last_hook_time, list, drop_idx, ext_reward, buff_list,
		  fast_combat_add_time, auto_combat_id, auto_combat_num,
		  auto_combat_items, chapter_awrads, is_first,
		  acc_hook_time, acc_hook_items]},
		{m_login_days, [ver, status_list, type]},
		{activity, [id, status, name, data, ext_args]},
		{m_welfare, [ver, statue, quese_list]},
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

-export([init/0, login/1, zero_flush/1, get_info/1,
	 get_award/2, fire/1]).

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

-file("src/mod/welfare/welfare.erl", 16).

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

-file("src/mod/welfare/welfare.erl", 17).

-file("inc/welfare.hrl", 1).

-record(m_welfare,
	{ver = 1, statue = 0, quese_list = []}).

-file("src/mod/welfare/welfare.erl", 18).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/welfare/welfare.erl", 19).

-file("inc/login_days.hrl", 1).

-record(m_login_days,
	{ver = 2, status_list = [], type = 0}).

-file("src/mod/welfare/welfare.erl", 20).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
	{ver = 6, mode = 1, chapter_id = 0, dun_id = 0,
	 max_dun_id = 0, last_hook_time = 0, list = [],
	 drop_idx = 0, ext_reward = [], buff_list = [],
	 fast_combat_add_time = 0, auto_combat_id = 0,
	 auto_combat_num = 0, auto_combat_items = [],
	 chapter_awrads = [], is_first = 1, acc_hook_time = 0,
	 acc_hook_items = []}).

-record(dun_chapter, {id = 0, status = 0, list = []}).

-record(dungeon,
	{id = 0, status = 0, cool_time = 0, auto_num = 0}).

-record(dungeon_data,
	{id = 0, name = <<>>, chapter_id = 0, mode = 1,
	 next_id = 0, unit_id = 0, items = [], drop_ids = [],
	 hook_unit_id = 0, hook_items = [], hook_drop_ids = [],
	 hook_lev_add = [], time = 0, is_big = 0, energy_max = 0,
	 auto_items = [], power = 0, lev_limit = 0, floor = 0}).

-record(dungeon_replay_log,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(dungeon_replay,
	{dun_id = 0  :: non_neg_integer(),
	 replays = []  :: [#dungeon_replay_log{}]}).

-file("src/mod/welfare/welfare.erl", 21).

-file("inc/month_card.hrl", 1).

-record(m_month_card,
	{ver = 1, card1_end_time = 0, card2_end_time = 0,
	 card1_num = 0, card2_num = 0, card1_gain = 0,
	 card2_gain = 0, card1_status = 0, card2_status = 0}).

-file("src/mod/welfare/welfare.erl", 22).

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

-file("src/mod/welfare/welfare.erl", 23).

-file("inc/log.hrl", 1).

-file("src/mod/welfare/welfare.erl", 24).

init() -> #m_welfare{}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role) ->
    {ok, NewRole} = login(Role),
    get_info(NewRole),
    {ok, NewRole}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_welfare =
		       MW = #m_welfare{statue = State, quese_list = L}}) ->
    case check_open(Role) of
      {true, EndTime} ->
	  NewL = do_ref(Role, welfare_data:list(), L, []),
	  NewState = calc_state(State, NewL),
	  NRole = Role#role{m_welfare =
				MW#m_welfare{statue = NewState,
					     quese_list = NewL}},
	  case close_ico(NRole) of
	    close -> skip;
	    _ -> activity_self:set_activity(504, 1, [EndTime])
	  end,
	  {ok, NRole};
      _ ->
	  case [Id || {Id, _, Status} <- L, Status == 1] == []
		 andalso State =/= 1
	      of
	    true -> {ok, Role};
	    _ ->
		Fun = fun ({Id, Val, Status}, {Acc1, Acc2}) ->
			      case welfare_data:get_award(Id) of
				Award = [_ | _] when Status == 1 ->
				    {Acc1 ++ Award, [{Id, Val, 2} | Acc2]};
				_ -> {Acc1, [{Id, Val, 2} | Acc2]}
			      end
		      end,
		{MailItem1, NewL} = lists:foldl(Fun, {[], []}, L),
		MailItem2 = case State == 1 of
			      true -> welfare_data:get_constant(award);
			      _ -> []
			    end,
		MailItem = MailItem2 ++ MailItem1,
		NRole = Role#role{m_welfare =
				      MW#m_welfare{statue = 2,
						   quese_list = NewL}},
		activity_self:set_activity(504, 0, []),
		case MailItem == [] of
		  true -> {ok, NRole};
		  _ ->
		      {Assets, Items} = format:split_assets_items(MailItem),
		      {ok, NewRole} = mail:add(NRole,
					       {lang:get(<<"限时招募"/utf8>>),
						lang:get(<<"亲爱的冒险者大人，这是您的限时招募未领取奖励，请查收"/utf8>>),
						Assets, Items,
						lang:get(<<"限时招募"/utf8>>),
						86400 + date:unixtime()}),
		      {ok, NewRole}
		end
	  end
    end.

do_ref(_Role, [], _L, L2) -> L2;
do_ref(Role, [Id | Other], L, L2) ->
    case lists:keyfind(Id, 1, L) of
      {_, Val, State} when State == 2 ->
	  do_ref(Role, Other, L, [{Id, Val, State} | L2]);
      {_, Val, State} when State == 1 ->
	  case check_finish(Role, Id) of
	    {_, _, 2} ->
		do_ref(Role, Other, L, [{Id, Val, 2} | L2]);
	    _ -> do_ref(Role, Other, L, [{Id, Val, State} | L2])
	  end;
      _ ->
	  {Id, Val, State} = check_finish(Role, Id),
	  do_ref(Role, Other, L, [{Id, Val, State} | L2])
    end.

check_finish(Role, Id) when is_integer(Id) ->
    Cond = welfare_data:get_cond(Id),
    {Val, State} = check_finish(Role, Cond),
    {Id, Val, State};
check_finish(#role{m_login_days =
		       #m_login_days{status_list = StatusList}},
	     {login_days, Day}) ->
    case lists:keyfind(Day, 1, StatusList) of
      {Day, 2} -> {0, 1};
      {Day, 3} -> {0, 2};
      _ -> {0, 0}
    end;
check_finish(#role{m_dungeon =
		       #m_dungeon{max_dun_id = MaxDunId, ext_reward = Reward}},
	     {dungeon_id, DunId, QuestId}) ->
    DunNum = case dungeon_data:get(MaxDunId) of
	       #dungeon_data{floor = Floor} -> Floor;
	       _ -> 0
	     end,
    case lists:member(QuestId, Reward) of
      true -> {DunId, 2};
      _ ->
	  case DunNum >= DunId of
	    true -> {DunId, 1};
	    _ -> {DunNum, 0}
	  end
    end;
check_finish(#role{m_month_card =
		       #m_month_card{card1_status = Statue}},
	     {month_card, 1})
    when Statue == 1 orelse Statue == 2 ->
    {0, 1};
check_finish(#role{m_month_card =
		       #m_month_card{card2_status = Statue}},
	     {month_card, 2})
    when Statue == 1 orelse Statue == 2 ->
    {0, 1};
check_finish(_Role, _Cond) -> {0, 0}.

calc_state(0, L) ->
    case [State || {_, _, State} <- L, State == 0] of
      [] -> 1;
      _ -> 0
    end;
calc_state(State, _L) -> State.

-spec get_info(#role{}) -> ok.

get_info(Role = #role{lev = Lev,
		      m_welfare =
			  #m_welfare{statue = State, quese_list = QueseList}})
    when Lev >= 10 ->
    EndTime = case check_open(Role) of
		{true, EndTimeT} -> EndTimeT;
		_ -> 0
	      end,
    sys_conn:pack_send(25100, {State, QueseList, EndTime});
get_info(_Role) -> ok.

-spec get_award(#role{}, pos_integer()) -> {false,
					    binary()} |
					   {ok, #role{}}.

get_award(#role{m_welfare = #m_welfare{statue = 2}},
	  0) ->
    {false, lang:get(<<"奖励已领取！"/utf8>>)};
get_award(#role{m_welfare = #m_welfare{statue = 0}},
	  0) ->
    {false, lang:get(<<"奖励未达成！"/utf8>>)};
get_award(Role, 0) ->
    case check_open(Role) of
      {true, _} ->
	  Award = welfare_data:get_constant(award),
	  Gain = format:val_to_gain(Award, welfare_award),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole = #role{m_welfare = MW}} ->
		log:log_gain(Gain, Role, NRole, <<"运营活动_限时招募"/utf8>>,
			     lang:get(<<"领取最终奖励"/utf8>>)),
		NewRole = NRole#role{m_welfare =
					 MW#m_welfare{statue = 2}},
		close_ico(NewRole),
		get_info(NewRole),
		{ok, NewRole};
	    {false, #loss{msg = Msg}} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"活动已结束"/utf8>>)}
    end;
get_award(Role = #role{m_welfare =
			   #m_welfare{quese_list = QueseList}},
	  Id) ->
    case check_open(Role) of
      {true, _} ->
	  case lists:keyfind(Id, 1, QueseList) of
	    {_, _, 2} -> {false, lang:get(<<"奖励已领取！"/utf8>>)};
	    {_, _, 0} -> {false, lang:get(<<"奖励未达成！"/utf8>>)};
	    {_, Val, 1} ->
		case welfare_data:get_award(Id) of
		  Award = [_ | _] ->
		      Gain = format:val_to_gain(Award, welfare_award),
		      case role_gain:do_notice(Role, Gain) of
			{ok,
			 NRole = #role{m_welfare =
					   MW = #m_welfare{quese_list =
							       QueseList2}}} ->
			    log:log_gain(Gain, Role, NRole,
					 <<"运营活动_限时招募"/utf8>>,
					 util:fbin(lang:get(<<"领取奖励~w"/utf8>>),
						   [Id])),
			    NewL = lists:keystore(Id, 1, QueseList2,
						  {Id, Val, 2}),
			    NewRole = NRole#role{m_welfare =
						     MW#m_welfare{quese_list =
								      NewL}},
			    close_ico(NewRole),
			    get_info(NewRole),
			    {ok, NewRole};
			{false, #loss{msg = Msg}} -> {false, Msg}
		      end;
		  _ -> {false, lang:get(<<"该任务暂无奖励"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"参数错误"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动已结束"/utf8>>)}
    end.

fire(Role = #role{m_welfare =
		      MW = #m_welfare{statue = State, quese_list = L}}) ->
    case check_open(Role) of
      {true, _} ->
	  NewL = do_ref(Role, welfare_data:list(), L, []),
	  NewState = calc_state(State, NewL),
	  NRole = Role#role{m_welfare =
				MW#m_welfare{statue = NewState,
					     quese_list = NewL}},
	  get_info(NRole),
	  close_ico(NRole),
	  NRole;
      _ -> Role
    end.

close_ico(#role{m_welfare =
		    #m_welfare{statue = State, quese_list = L}}) ->
    case [Status || {_, _, Status} <- L, Status =/= 2] of
      [] when State == 2 ->
	  activity_self:set_activity(504, 0, []), close;
      _ -> ok
    end.

check_open(#role{reg_time = RegTime}) ->
    RegDay = date:day_diff(RegTime, date:unixtime()) + 1,
    MinRegDay = welfare_data:get_constant(min_reg_day),
    MaxRegDay = welfare_data:get_constant(max_reg_day),
    OpenTimestamp = sys_env:get(open_timestamp),
    LimitOpenTimestamp =
	date:parse_time(welfare_data:get_constant(limit_open_srv_date)),
    case RegDay >= MinRegDay andalso
	   RegDay =< MaxRegDay andalso
	     OpenTimestamp < LimitOpenTimestamp
	of
      true ->
	  EndTime = date:unixtime() +
		      date:now_diff(MaxRegDay - RegDay, {23, 59, 59}),
	  {true, EndTime};
      _ -> false
    end.


