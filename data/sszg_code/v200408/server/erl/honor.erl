-file("data/honor.erl", 1).

-file("src/mod/honor/honor.erl", 1).

-module(honor).

-lager_records([{profile_add, [key, id, mod, ext]},
		{profile_reward, [ver, role_id, add_list]},
		{honor_info, [key, list, end_time]},
		{honor_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr, add_exp, dynamic]},
		{honor, [ver, base_id, expire_time]},
		{m_honor, [ver, used, list]}, {s_timer, [ref, timers]},
		{rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		  add_num, can_share, eqm_set, use_count]},
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

-export([init/0, login/1, info/1, use/2, activate/2,
	 arena_elite_activate/3, add/2, add/3, check/1,
	 set_timer/1, set_overdue/1, do_set_overdue/2, del/2,
	 update/3, init_frame/1, make_honor/3, make_honor/4,
	 apply_add/2, apply_del/2, get_add_exp/1]).

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

-file("src/mod/honor/honor.erl", 37).

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

-file("src/mod/honor/honor.erl", 38).

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

-file("src/mod/honor/honor.erl", 39).

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

-file("src/mod/honor/honor.erl", 40).

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

-file("src/mod/honor/honor.erl", 41).

-file("inc/honor.hrl", 1).

-record(m_honor, {ver = 1, used = 0, list = []}).

-record(honor, {ver = 1, base_id = 0, expire_time = 0}).

-record(honor_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = [], add_exp = 0, dynamic = 0}).

-record(honor_info,
	{key  :: atom(), list = []  :: list(),
	 end_time = 0  :: non_neg_integer()}).

-file("src/mod/honor/honor.erl", 42).

-file("inc/profile.hrl", 1).

-record(profile_reward,
	{ver = 1, role_id, add_list = []}).

-record(profile_add, {key, id, mod, ext = #{}}).

-file("src/mod/honor/honor.erl", 43).

-file("inc/log.hrl", 1).

-file("src/mod/honor/honor.erl", 44).

-export([gm_activate/2]).

gm_activate(Role, #{base_id := BaseId}) ->
    case honor_data:get(BaseId) of
      Data = #honor_data{} ->
	  Add = make_honor_profile_add(BaseId, #{}),
	  case make_honor(Role, Add, Data) of
	    {ok, NewHonor, RplHonor} ->
		NRole = update(Role, NewHonor, RplHonor),
		SetRole = set_timer(NRole, NewHonor),
		NewRole = update_attr(SetRole, Data),
		push_frame(NewRole, NewHonor),
		{ok, NewRole};
	    {false, Msg} -> {false, Msg}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không thể kích hoạt Danh hiệu không "
		      "xác định"/utf8>>)}
    end.

-spec init() -> #m_honor{}.

init() -> #m_honor{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{id = RoleId,
		   m_honor = MHonor = #m_honor{list = List}}) ->
    AList = honor_mgr:role_honors(RoleId),
    NewList = calc_dynamic_honor(List, AList, []),
    Role1 = Role#role{m_honor =
			  MHonor#m_honor{list = NewList}},
    OverRole = overdue(Role1),
    {ok, set_timer(OverRole)}.

calc_dynamic_honor([], AList, L) ->
    L1 = [#honor{base_id = Bid}
	  || Bid <- AList,
	     not lists:keymember(Bid, #honor.base_id, L)],
    L1 ++ L;
calc_dynamic_honor([Honor = #honor{base_id = Bid} | T],
		   AList, L) ->
    case honor_data:get(Bid) of
      #honor_data{dynamic = 1} ->
	  case lists:member(Bid, AList) of
	    false -> calc_dynamic_honor(T, AList, L);
	    _ -> calc_dynamic_honor(T, AList, [Honor | L])
	  end;
      _ -> calc_dynamic_honor(T, AList, [Honor | L])
    end.

-spec get_add_exp(#role{}) -> pos_integer().

get_add_exp(#role{m_honor = #m_honor{list = List}}) ->
    Fun = fun (#honor{base_id = BaseId}, Acc) ->
		  case honor_data:get(BaseId) of
		    #honor_data{add_exp = Add} -> Add + Acc;
		    _ -> Acc
		  end
	  end,
    lists:foldl(Fun, 0, List).

-spec del(#role{}, BaseId :: pos_integer()) -> {ok,
						#role{}}.

del(Role = #role{m_honor =
		     MHonor = #m_honor{list = List, used = Used}},
    BaseId) ->
    DelRole = case lists:keydelete(BaseId, #honor.base_id,
				   List)
		  of
		NewList = [#honor{base_id = UseBaseId} | _] ->
		    NRole = case Used =:= BaseId of
			      false ->
				  NewMHonor = MHonor#m_honor{list = NewList},
				  Role#role{m_honor = NewMHonor};
			      true ->
				  NewMHonor = MHonor#m_honor{list = NewList,
							     used = UseBaseId},
				  Role#role{m_honor = NewMHonor}
			    end,
		    set_timer(NRole);
		[] ->
		    NewMHonor = MHonor#m_honor{list = [], used = 0},
		    Role#role{m_honor = NewMHonor}
	      end,
    NewRole = profile_attr:update(DelRole),
    {ok, NewRole}.

-spec info(#role{}) -> {ok, HonorBid :: pos_integer(),
			list()}.

info(#role{m_honor =
	       #m_honor{list = List, used = HonorBid}}) ->
    {ok, HonorBid, List}.

-spec use(#role{}, BaseId :: integer()) -> {ok,
					    #role{}} |
					   {false, binary()}.

use(#role{m_honor = #m_honor{used = BaseId}}, BaseId) ->
    {false,
     lang:get(<<"Danh hiệu này hiện đang được sử dụng"/utf8>>)};
use(Role = #role{m_honor =
		     MHonor = #m_honor{list = List}},
    BaseId) ->
    case lists:keyfind(BaseId, #honor.base_id, List) of
      #honor{base_id = BaseId} ->
	  NewMHonor = MHonor#m_honor{used = BaseId},
	  NewRole = Role#role{m_honor = NewMHonor},
	  push_used_frame(NewRole),
	  {ok, NewRole};
      _ ->
	  {false,
	   lang:get(<<"Bạn chưa kích hoạt Danh hiệu này"/utf8>>)}
    end.

-spec activate(#role{}, map()) -> {ok, #role{}} |
				  {false, binary()}.

activate(Role, #{base_id := BaseId}) ->
    case honor_data:get(BaseId) of
      Data = #honor_data{is_panel = 1,
			 loss = LossCfg = [_ | _]} ->
	  Loss = format:val_to_loss(LossCfg, del_honor),
	  case role_gain:do(Role, Loss) of
	    {ok, LossRole} ->
		Add = make_honor_profile_add(BaseId, #{}),
		case make_honor(Role, Add, Data) of
		  {ok, NewHonor, RplHonor} ->
		      NRole = update(LossRole, NewHonor, RplHonor),
		      TimerRole = set_timer(NRole, NewHonor),
		      NewRole = update_attr(TimerRole, Data),
		      push_frame(NewRole, NewHonor),
		      log(NewRole, Role, NewHonor, RplHonor,
			  #{log_title => lang:get(<<"kích hoạt"/utf8>>),
			    gl => Loss}),
		      {ok, NewRole};
		  {false, Msg} -> {false, Msg}
		end;
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidhonor181, _, {__Levelhonor181, __Traceshonor181}}
		      when __Levelhonor181 band 8 /= 0 orelse
			     __Traceshonor181 /= [] ->
		      lager:do_log(error,
				   [{module, honor}, {function, activate},
				    {line, 181}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]激活称号失败:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelhonor181,
				   __Traceshonor181, lager_event,
				   __Pidhonor181);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Đạo cụ không đủ, không thể kích hoạt"/utf8>>)}
	  end;
      #honor_data{} ->
	  {false,
	   lang:get(<<"Danh hiệu sự kiện, tự động kích hoạt "
		      "khi nhận được"/utf8>>)};
      _Data ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhonor187, _, {__Levelhonor187, __Traceshonor187}}
		when __Levelhonor187 band 128 /= 0 orelse
		       __Traceshonor187 /= [] ->
		lager:do_log(debug,
			     [{module, honor}, {function, activate},
			      {line, 187}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法激活未知的称号:~w",
					   [Role#role.name, _Data]),
			     none, 4096, 128, __Levelhonor187, __Traceshonor187,
			     lager_event, __Pidhonor187);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Không thể kích hoạt Danh hiệu không "
		      "xác định"/utf8>>)}
    end.

-spec arena_elite_activate(#role{}, pos_integer(),
			   pos_integer()) -> #role{}.

arena_elite_activate(Role = #role{m_honor =
				      #m_honor{list = List}},
		     Rank, EndTime) ->
    case arena_elite_data:get_honor_id(Rank) of
      BaseId when BaseId =/= 0 ->
	  case honor_data:get(BaseId) of
	    Data = #honor_data{} ->
		case lists:keyfind(BaseId, #honor.base_id, List) of
		  #honor{expire_time = EndTime} -> Role;
		  _ ->
		      Date = date:seconds_to_datetime(EndTime),
		      NewData = Data#honor_data{expire_type = 2,
						expire_time = Date},
		      Add = make_honor_profile_add(BaseId, #{}),
		      case make_honor(Role, Add, NewData) of
			{ok, NewHonor, RplHonor} ->
			    NRole = update(Role, NewHonor, RplHonor),
			    TimerRole = set_timer(NRole, NewHonor),
			    NewRole = update_attr(TimerRole, NewData),
			    push_frame(NewRole, NewHonor),
			    log(NewRole, Role, NewHonor, RplHonor,
				#{log_title => lang:get(<<"kích hoạt"/utf8>>),
				  gl => []}),
			    NewRole;
			{false, Msg} ->
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
			      {__Pidhonor214, _,
			       {__Levelhonor214, __Traceshonor214}}
				  when __Levelhonor214 band 8 /= 0 orelse
					 __Traceshonor214 /= [] ->
				  lager:do_log(error,
					       [{module, honor},
						{function,
						 arena_elite_activate},
						{line, 214},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~ts]激活精英赛称号失败:~w ~w ~w",
							     [Role#role.name,
							      Rank, BaseId,
							      Msg]),
					       none, 4096, 8, __Levelhonor214,
					       __Traceshonor214, lager_event,
					       __Pidhonor214);
			      _ -> ok
			    end,
			    Role
		      end
		end;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidhonor219, _, {__Levelhonor219, __Traceshonor219}}
		      when __Levelhonor219 band 8 /= 0 orelse
			     __Traceshonor219 /= [] ->
		      lager:do_log(error,
				   [{module, honor},
				    {function, arena_elite_activate},
				    {line, 219}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]激活精英赛称号失败:~w ~w",
						 [Role#role.name, Rank,
						  BaseId]),
				   none, 4096, 8, __Levelhonor219,
				   __Traceshonor219, lager_event,
				   __Pidhonor219);
		  _ -> ok
		end,
		Role
	  end;
      _ -> Role
    end.

-spec apply_add(#role{} | role_id(),
		Bid :: non_neg_integer()) -> ok | {ok, #role{}}.

apply_add(Role = #role{}, Bid) ->
    case add(Role, Bid) of
      {ok, NRole} -> {ok, NRole};
      _ -> ok
    end;
apply_add(RoleId, Bid) ->
    role_lib:cast(by_id, RoleId, {honor, apply_add, [Bid]}).

-spec apply_del(#role{} | role_id(),
		Bid :: non_neg_integer()) -> ok.

apply_del(Role = #role{}, Bid) -> del(Role, Bid);
apply_del(RoleId, Bid) ->
    role_lib:cast(by_id, RoleId, {honor, apply_del, [Bid]}).

-spec add(RoleOrId :: #role{} | tuple(),
	  Bid :: integer()) -> ok | {ok, #role{}} |
			       {false, binary()}.

add(RoleOrId, Bid) -> add(RoleOrId, Bid, #{}).

-spec add(RoleOrId :: #role{} | tuple(),
	  Bid :: integer(), Ext :: map()) -> ok | {ok, #role{}} |
					     {false, binary()}.

add(Role = #role{}, Bid, Ext) ->
    case honor_data:get(Bid) of
      Data = #honor_data{} ->
	  ProfileAdd = make_honor_profile_add(Bid, Ext),
	  case make_honor(Role, ProfileAdd, Data) of
	    {ok, NewHonor, RplHonor} ->
		NRole = update(Role, NewHonor, RplHonor),
		NewRole = update_attr(NRole, Data),
		log(NewRole, Role, NewHonor, RplHonor),
		{ok, NewRole};
	    {false, Msg} -> {false, Msg}
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhonor264, _, {__Levelhonor264, __Traceshonor264}}
		when __Levelhonor264 band 8 /= 0 orelse
		       __Traceshonor264 /= [] ->
		lager:do_log(error,
			     [{module, honor}, {function, add}, {line, 264},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]更新未配置的称号Bid:~w",
					   [Role#role.name, Bid]),
			     none, 4096, 8, __Levelhonor264, __Traceshonor264,
			     lager_event, __Pidhonor264);
	    _ -> ok
	  end,
	  {false, lang:get(<<"Danh hiệu không tồn tại"/utf8>>)}
    end;
add(RoleId = {_Rid, _SrvId}, Bid, Ext) ->
    profile_mgr:async_add(RoleId, honor, Bid, Ext).

-spec update(#role{}, NHonor :: #honor{},
	     RplHonor :: #honor{} | undefined) -> #role{}.

update(Role = #role{m_honor =
			MHonor = #m_honor{list = List, used = UseBaseId}},
       NewHonor = #honor{base_id = BaseId}, RplHonor) ->
    {NewList, RplBaseId} = case RplHonor of
			     #honor{base_id = RplBid} ->
				 DelList = lists:keydelete(RplBid,
							   #honor.base_id,
							   List),
				 {lists:keystore(BaseId, #honor.base_id,
						 DelList, NewHonor),
				  RplBid};
			     _ ->
				 {lists:keystore(BaseId, #honor.base_id, List,
						 NewHonor),
				  0}
			   end,
    NewMHonor = case UseBaseId =:= 0 orelse
		       UseBaseId =:= RplBaseId
		    of
		  true -> MHonor#m_honor{list = NewList, used = BaseId};
		  _ -> MHonor#m_honor{list = NewList}
		end,
    Role#role{m_honor = NewMHonor}.

-spec check(#role{}) -> {ok, #role{}}.

check(Role) ->
    NRole = overdue(Role),
    NewRole = profile_attr:update(NRole),
    {ok, set_timer(NewRole)}.

-spec init_frame(Data :: #honor{} |
			 pos_integer()) -> {ok, #honor{}} | {false, binary()}.

init_frame(#honor_data{base_id = BaseId,
		       expire_type = ExpireType, expire_time = ExpireTime}) ->
    {_NewExpireType, NewExpireTime} =
	item:make_expire(BaseId, ExpireType, ExpireTime),
    {ok,
     #honor{base_id = BaseId, expire_time = NewExpireTime}};
init_frame(BaseId) ->
    case honor_data:get(BaseId) of
      Data = #honor_data{} -> init_frame(Data);
      _ ->
	  {false,
	   lang:get(<<"Không thể khởi tạo Danh hiệu không xác "
		      "định"/utf8>>)}
    end.

-spec log(NRole :: #role{}, Role :: #role{},
	  Honor :: #honor{}, RplHonor :: #honor{}) -> ok.

log(NRole, Role, Honor, RplHonor) ->
    log(NRole, Role, Honor, RplHonor, #{}).

log(NRole, Role,
    #honor{base_id = BaseId, expire_time = ExpireTime},
    RplHonor, LogData) ->
    LogTitle = maps:get(log_title, LogData,
			lang:get(<<"Nhận lấy"/utf8>>)),
    GL = maps:get(gl, LogData, []),
    LogMsg = case RplHonor of
	       #honor{base_id = RplBaseId,
		      expire_time = RplExpireTime} ->
		   util:fbin(<<"~ts:Bid:~w,Expire:~w,RplBid:~w,RplExpire:~w"/utf8>>,
			     [LogTitle, BaseId, ExpireTime, RplBaseId,
			      RplExpireTime]);
	       _ ->
		   util:fbin(<<"~ts:Bid:~w,Expire:~w"/utf8>>,
			     [LogTitle, BaseId, ExpireTime])
	     end,
    log:save(log_profile,
	     {GL, Role, NRole, <<"称号"/utf8>>, LogMsg}),
    ok.

-spec make_honor(#role{}, Add :: #profile_add{},
		 Data :: #honor_data{}) -> {ok, #honor{},
					    #honor{} | undefined} |
					   {false, Msg :: binary()}.

make_honor(Role, ProfileAdd, AddData) ->
    make_honor(Role, ProfileAdd, AddData, #{}).

-spec make_honor(#role{}, Add :: #profile_add{},
		 Data :: #honor_data{}, Opt :: map()) -> {ok, #honor{},
							  #honor{} |
							  undefined} |
							 {false,
							  Msg :: binary()}.

make_honor(Role = #role{m_honor =
			    #m_honor{list = Frames}},
	   ProfileAdd, AddData = #honor_data{group = Group},
	   Opt) ->
    case same_group(Frames, Group) of
      {ok, _RplHonor, #honor_data{expire_type = 0}} ->
	  {false,
	   lang:get(<<"Danh hiệu vĩnh viễn này đã được kích "
		      "hoạt và không cần phải kích hoạt lại"/utf8>>)};
      {ok, RplHonor, _Data} ->
	  make_honor(Role, ProfileAdd, AddData, RplHonor, Opt);
      false ->
	  make_honor(Role, ProfileAdd, AddData, undefined, Opt)
    end.

make_honor(Role, Add,
	   AddData = #honor_data{base_id = Bid, overlap = Overlap,
				 expire_type = AddExpireType},
	   RplHonor, _Opt) ->
    case init_frame(AddData) of
      {ok, AddHonor = #honor{expire_time = ExpireTime}} ->
	  case AddExpireType =:= 0 of
	    false ->
		case {Overlap, RplHonor} of
		  {1, #honor{expire_time = OldExpireTime}} ->
		      NewTime = calc_expire_time(Overlap, OldExpireTime,
						 ExpireTime, Add),
		      {ok, AddHonor#honor{expire_time = NewTime}, RplHonor};
		  {0, #honor{expire_time = OldExpireTime}} ->
		      case ExpireTime > OldExpireTime of
			true ->
			    NewTime = calc_expire_time(Overlap, OldExpireTime,
						       ExpireTime, Add),
			    {ok, AddHonor#honor{expire_time = NewTime},
			     RplHonor};
			false ->
			    {false,
			     lang:get(<<"Danh hiệu hiện tại kéo dài lâu hơn và "
					"không cần phải kích hoạt lại"/utf8>>)}
		      end;
		  {_, undefined} ->
		      Now = date:unixtime(),
		      ElapseTime = elapse_time(Add, Now),
		      NewTime = ExpireTime - ElapseTime,
		      case NewTime > Now of
			true ->
			    {ok, AddHonor#honor{expire_time = NewTime},
			     RplHonor};
			false ->
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
			      {__Pidhonor362, _,
			       {__Levelhonor362, __Traceshonor362}}
				  when __Levelhonor362 band 64 /= 0 orelse
					 __Traceshonor362 /= [] ->
				  lager:do_log(info,
					       [{module, honor},
						{function, make_honor},
						{line, 362},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~ts]称号已过期Bid:~w, ExTime:~w, Now:~w",
							     [Role#role.name,
							      Bid, ExpireTime,
							      Now]),
					       none, 4096, 64, __Levelhonor362,
					       __Traceshonor362, lager_event,
					       __Pidhonor362);
			      _ -> ok
			    end,
			    {false, lang:get(<<"Danh hiệu đã hết hạn"/utf8>>)}
		      end;
		  {_, #honor{base_id = Bid}} ->
		      {false,
		       lang:get(<<"Không thể thay thế cùng một Danh hiệu"/utf8>>)};
		  Unknow ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidhonor368, _, {__Levelhonor368, __Traceshonor368}}
			    when __Levelhonor368 band 8 /= 0 orelse
				   __Traceshonor368 /= [] ->
			    lager:do_log(error,
					 [{module, honor},
					  {function, make_honor}, {line, 368},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]更新称号失败[bid:~w][Err:~w]",
						       [Role#role.name, Bid,
							Unknow]),
					 none, 4096, 8, __Levelhonor368,
					 __Traceshonor368, lager_event,
					 __Pidhonor368);
			_ -> ok
		      end,
		      {false,
		       lang:get(<<"Danh hiệu chưa xử lý hết hạn"/utf8>>)}
		end;
	    true -> {ok, AddHonor, RplHonor}
	  end;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhonor375, _, {__Levelhonor375, __Traceshonor375}}
		when __Levelhonor375 band 8 /= 0 orelse
		       __Traceshonor375 /= [] ->
		lager:do_log(error,
			     [{module, honor}, {function, make_honor},
			      {line, 375}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]更新称号初始化失败[bid:~w][Err:~w]",
					   [Role#role.name, Bid, Err]),
			     none, 4096, 8, __Levelhonor375, __Traceshonor375,
			     lager_event, __Pidhonor375);
	    _ -> ok
	  end,
	  {false, lang:get(<<"Không thể tạo Danh hiệu"/utf8>>)}
    end.

set_timer(Role = #role{m_honor = #m_honor{list = L}}) ->
    Now = date:unixtime(),
    case [ExpireTime - Now
	  || #honor{expire_time = ExpireTime} <- L,
	     ExpireTime > 0]
	of
      [] -> Role;
      TL ->
	  T = max(1, lists:min(TL)),
	  role_timer:set(#timer{id = honor_check_timer,
				timeout = T * 1000, m = honor, f = check,
				a = []},
			 Role)
    end.

set_timer(Role, #honor{base_id = BaseId}) ->
    case honor_data:get(BaseId) of
      #honor_data{expire_type = 0} -> Role;
      _ -> set_timer(Role)
    end;
set_timer(Role, _Honor) -> set_timer(Role).

set_overdue(Role = #role{m_honor =
			     MHonor = #m_honor{list = List}}) ->
    NewList = do_set_overdue(List, []),
    NewMHonor = MHonor#m_honor{list = NewList},
    Role#role{m_honor = NewMHonor}.

do_set_overdue([], NList) -> NList;
do_set_overdue([Honor = #honor{} | T], NList) ->
    Now = date:unixtime(),
    NewExpireTime = Now - 60,
    NewHonor = Honor#honor{expire_time = NewExpireTime},
    do_set_overdue(T, [NewHonor | NList]).

overdue(Role = #role{id = RoleId,
		     m_honor =
			 MHonor = #m_honor{used = BaseId, list = List}}) ->
    {NewList, OldList} = do_overdue(List, [], []),
    NewBaseId = case lists:keyfind(BaseId, #honor.base_id,
				   NewList)
		    of
		  false ->
		      case NewList of
			[#honor{base_id = NextBaseId} | _] -> NextBaseId;
			_ -> 0
		      end;
		  _ -> BaseId
		end,
    NewMHonor = MHonor#m_honor{used = NewBaseId,
			       list = NewList},
    Role2 = Role#role{m_honor = NewMHonor},
    case length(OldList) > 0 of
      true ->
	  Str = get_overdue(OldList, <<>>),
	  {ok, RoleT} = mail:add(Role2,
				 {lang:get(<<"Danh hiệu đã hết hạn"/utf8>>),
				  color:msg(lang:get(<<"Thân gửi nhà thám hiểm, chức danh của "
						       "bạn là~tsHết hạn, phần thưởng thuộc "
						       "tính được thêm vào sẽ biến mất！"/utf8>>),
					    [{green, Str}]),
				  [], [],
				  lang:get(<<"Danh hiệu đã hết hạn"/utf8>>),
				  86400 + date:unixtime()}),
	  RoleT;
      _ -> Role2
    end.

get_overdue([], Str) -> Str;
get_overdue([#honor{base_id = Bid} | T], Str) ->
    case honor_data:get(Bid) of
      #honor_data{name = Name} ->
	  NStr = case Str of
		   <<>> -> <<"“"/utf8, Name/binary, "”"/utf8>>;
		   _ -> <<Str/binary, ",“"/utf8, Name/binary, "”"/utf8>>
		 end,
	  get_overdue(T, NStr);
      _ -> get_overdue(T, Str)
    end.

do_overdue([], NewList, OldList) -> {NewList, OldList};
do_overdue([Honor = #honor{expire_time = ExpireTime}
	    | T],
	   NewList, OldList) ->
    Now = date:unixtime(),
    case ExpireTime =:= 0 orelse ExpireTime > Now of
      true -> do_overdue(T, [Honor | NewList], OldList);
      _ -> do_overdue(T, NewList, [Honor | OldList])
    end.

push_frame(Role, Frame) ->
    role:pack_send(Role, 23303, {[Frame]}), ok.

push_used_frame(Role = #role{m_honor =
				 #m_honor{used = Used}}) ->
    role:pack_send(Role, 23301, {Used}), ok.

calc_expire_time(1, OldExpireTime, ExpireTime, Add) ->
    Now = date:unixtime(),
    ElapseTime = elapse_time(Add, Now),
    OldExpireTime + max(ExpireTime - ElapseTime - Now, 0);
calc_expire_time(0, OldExpireTime, ExpireTime, Add) ->
    Now = date:unixtime(),
    ElapseTime = elapse_time(Add, Now),
    max(ExpireTime - ElapseTime, OldExpireTime).

elapse_time(#profile_add{ext = Ext}, Now) ->
    StartTime = maps:get(start_time, Ext, 0),
    case StartTime > 0 of
      true -> Now - StartTime;
      false -> 0
    end.

same_group([], _Group) -> false;
same_group([Honor = #honor{base_id = BaseId} | Rest],
	   Group) ->
    case honor_data:get(BaseId) of
      Data = #honor_data{group = Group} -> {ok, Honor, Data};
      _ -> same_group(Rest, Group)
    end.

make_honor_profile_add(Bid, Ext) ->
    profile:make_profile_add(honor, Bid, Ext).

update_attr(Role, #honor_data{attr = Attr}) ->
    case Attr of
      [_ | _] -> profile_attr:update(Role);
      _ -> Role
    end.


