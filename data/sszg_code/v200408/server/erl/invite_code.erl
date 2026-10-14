-file("src/mod/invite_code/invite_code.erl", 1).

-module(invite_code).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
		{invite_code_bind,
		 [role_id, bind_id, account, name, sex, lev, vip, power,
		  face, avatar_bid, online, login_time, code, time,
		  reg_idfa, reg_ip, is_return, return_charge,
		  return_power, face_update_time, face_file]},
		{invite_code_role,
		 [role_id, code, time, num, list, return_num,
		  return_list]},
		{m_invite_code,
		 [ver, bind_code, bind_roleid, reward_list]},
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

-export([init/0, gm/2, bind_num/0, login/1, logout/1,
	 sync_info/1, apply_sync_info/2, apply_sync_bind_info/2,
	 apply_add_bind_role/2, get_code/1, bind_code/2,
	 apply_bind_role/1, apply_bind_fail/2, push_list/1,
	 push_reward/1, get_reward/2, get_bind_role/2,
	 push_bind_role/1]).

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

-file("src/mod/invite_code/invite_code.erl", 28).

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

-file("src/mod/invite_code/invite_code.erl", 29).

-file("inc/invite_code.hrl", 1).

-record(m_invite_code,
	{ver = 1, bind_code = 0, bind_roleid = {0, <<>>},
	 reward_list = []}).

-record(invite_code_role,
	{role_id = {0, <<>>}, code = 0, time = 0, num = 0,
	 list = [], return_num = 0, return_list = []}).

-record(invite_code_bind,
	{role_id = {0, <<>>}, bind_id = {0, <<>>},
	 account = <<>>, name = <<>>, sex = 0, lev = 0, vip = 0,
	 power = 0, face = 0, avatar_bid = 0, online = 1,
	 login_time = 0, code = 0, time = 0, reg_idfa = <<>>,
	 reg_ip = <<>>, is_return = 0, return_charge = 0,
	 return_power = 0, face_update_time = 0,
	 face_file = <<>>}).

-file("src/mod/invite_code/invite_code.erl", 30).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/invite_code/invite_code.erl", 31).

-file("inc/vip.hrl", 1).

-record(m_vip,
	{ver = 2, lev = 0, lev_reward = [], tired_charge = []}).

-record(vip_data,
	{lev = 0  :: non_neg_integer(),
	 gold = 0  :: non_neg_integer(), price = []  :: list(),
	 old_price = []  :: list(), items = []  :: list(),
	 ext_reward = []}).

-record(vip_effect_data,
	{name = <<>>  :: bitstring(),
	 val = 0  :: non_neg_integer()}).

-file("src/mod/invite_code/invite_code.erl", 32).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/invite_code/invite_code.erl", 33).

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

-file("src/mod/invite_code/invite_code.erl", 34).

-file("inc/log.hrl", 1).

-file("src/mod/invite_code/invite_code.erl", 35).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/invite_code/invite_code.erl", 36).

-spec init() -> #m_invite_code{}.

init() -> #m_invite_code{}.

-spec gm(#role{}, tuple()) -> ok | {ok, #role{}}.

gm(Role = #role{m_invite_code =
		    MInviteCode = #m_invite_code{reward_list = RewardList}},
   {set_num, Id, Num}) ->
    NewRewardList = case lists:keyfind(Id, 1, RewardList) of
		      false -> [{Id, Num, 0} | RewardList];
		      {Id, _N, Had} ->
			  lists:keyreplace(Id, 1, RewardList, {Id, Num, Had})
		    end,
    NRole = Role#role{m_invite_code =
			  MInviteCode#m_invite_code{reward_list =
							NewRewardList}},
    push_reward(NRole),
    {ok, NRole};
gm(_Role, _) -> ok.

bind_num() ->
    Ms = [{{invite_code_bind, '_', '_', '_', '_', '_', '_',
	    '_', '_', '_', '_', '_', '_', '$1', '_', '_', '_', '_',
	    '_', '_', '_', '_'},
	   [], [{'>', '$1', 0}]}],
    ets:select_count(invite_code_bind, Ms).

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{id = RoleId, misc = Misc}) ->
    sync_info(Role),
    case ets:lookup(invite_code_role, RoleId) of
      [#invite_code_role{list = List}] ->
	  RList = load_data(List, []),
	  {_, NRole} = calc_reward(Role#role{misc =
						 Misc#role_misc{invite_code_list
								    = RList}}),
	  {ok, NRole};
      _ -> ok
    end.

load_data([], L) -> L;
load_data([RoleId | T], L) ->
    case ets:lookup(invite_code_bind, RoleId) of
      [R] -> load_data(T, [R | L]);
      _ -> load_data(T, L)
    end.

-spec logout(#role{}) -> ok | {ok, #role{}}.

logout(Role) -> sync_info(Role, 0), ok.

-spec sync_info(#role{}, 0..1) -> ok.

sync_info(Role) ->
    sync_info(Role, 1), invite_code_return:sync_info(Role).

sync_info(Role = #role{id = RoleId,
		       m_invite_code = #m_invite_code{bind_code = Code},
		       misc = #role_misc{invite_code_list = InviteCodeList},
		       sex = Sex, lev = Lev, name = Name,
		       m_avatar = #m_avatar{used = AvatarBid},
		       m_vip = #m_vip{lev = VipLev}, power = Power,
		       face_id = FaceId, reg_idfa = RegIdfa, reg_ip = RegIp},
	  Online)
    when Code > 0 orelse InviteCodeList =/= [] ->
    case ets:lookup(invite_code_bind, RoleId) of
      [R = #invite_code_bind{code = Code,
			     bind_id = BindId = {_, BindSrvId}}] ->
	  {_, FaceFile, FaceUpdateTime} =
	      role_face:face_info(Role),
	  NewR = R#invite_code_bind{name = Name, sex = Sex,
				    vip = VipLev, lev = Lev, face = FaceId,
				    power = Power, avatar_bid = AvatarBid,
				    login_time = date:unixtime(),
				    online = Online, reg_idfa = RegIdfa,
				    reg_ip = RegIp,
				    face_update_time = FaceUpdateTime,
				    face_file = FaceFile},
	  d_ets_lib:save_ets(invite_code_bind, NewR),
	  case Code > 0 of
	    true ->
		cluster_lib:cast(BindSrvId, invite_code,
				 apply_sync_bind_info, [NewR, BindId]);
	    _ -> pass
	  end,
	  Fun = fun ({MainSrvId, L1}) ->
			L2 = [Rid || #invite_code_bind{role_id = Rid} <- L1],
			cluster_lib:cast(MainSrvId, invite_code,
					 apply_sync_bind_info, [NewR, L2])
		end,
	  cluster_lib:split_srv_exec(InviteCodeList,
				     #invite_code_bind.role_id, Fun),
	  ok;
      _ -> ok
    end;
sync_info(_Role, _Online) -> ok.

-spec apply_sync_info(#role{},
		      #invite_code_bind{}) -> {ok, #role{}}.

apply_sync_info(Role = #role{misc =
				 Misc = #role_misc{invite_code_list = List}},
		BindRole = #invite_code_bind{role_id = TarRoleId}) ->
    d_ets_lib:save_ets(invite_code_bind, BindRole),
    NewList = lists:keyreplace(TarRoleId,
			       #invite_code_bind.role_id, List, BindRole),
    Role1 = Role#role{misc =
			  Misc#role_misc{invite_code_list = NewList}},
    sys_conn:pack_send(19803, {BindRole}),
    case calc_reward(Role1) of
      {true, NRole} -> push_reward(NRole), {ok, NRole};
      _ -> {ok, Role1}
    end;
apply_sync_info(_Role, _BindRole) -> ok.

-spec apply_sync_bind_info(#invite_code_bind{},
			   [role_id()]) -> ok.

apply_sync_bind_info(BindRole = #invite_code_bind{},
		     BindId = {_, _}) ->
    d_ets_lib:save_ets(invite_code_bind, BindRole),
    role_lib:cast(by_id, BindId,
		  {invite_code, apply_sync_info, [BindRole]}),
    ok;
apply_sync_bind_info(BindRole = #invite_code_bind{},
		     _RoleIds) ->
    d_ets_lib:save_ets(invite_code_bind, BindRole), ok;
apply_sync_bind_info(_, _) -> ok.

-spec apply_add_bind_role(#role{},
			  #invite_code_bind{}) -> ok | {ok, #role{}}.

apply_add_bind_role(Role = #role{misc =
				     Misc = #role_misc{invite_code_list =
							   List}},
		    BindRole = #invite_code_bind{role_id = TarRoleId}) ->
    NewList = lists:keystore(TarRoleId,
			     #invite_code_bind.role_id, List, BindRole),
    NRole = Role#role{misc =
			  Misc#role_misc{invite_code_list = NewList}},
    sys_conn:pack_send(19803, {BindRole}),
    {ok, NRole}.

-spec get_code(#role{}) -> non_neg_integer().

get_code(Role = #role{id = RoleId,
		      account = Account}) ->
    try ets:lookup_element(invite_code_role, RoleId,
			   #invite_code_role.code)
    catch
      _E:_X ->
	  case big_world_lib:call(all_big_world,
				  c_invite_code_mgr, call,
				  [{make_code, RoleId, Account}])
	      of
	    {ok, Code} ->
		Data = #invite_code_role{role_id = RoleId, code = Code,
					 time = date:unixtime()},
		d_ets_lib:save_d_ets(invite_code_role, Data),
		case ets:member(invite_code_bind, RoleId) of
		  true -> skip;
		  _ ->
		      {ok, BindRole} = role_convert:do(invite_code_bind,
						       Role),
		      d_ets_lib:save_d_ets(invite_code_bind, BindRole)
		end,
		Code;
	    _ -> 0
	  end
    end.

-spec bind_code(#role{}, Code :: pos_integer()) -> {ok,
						    #role{}} |
						   {false, binary()} |
						   {false, pos_integer(),
						    binary()}.

bind_code(#role{m_invite_code =
		    #m_invite_code{bind_code = BindCode}},
	  _Code)
    when BindCode > 0 ->
    {false, 1, lang:get(<<"已绑定邀请，无需再次绑定"/utf8>>)};
bind_code(Role = #role{account = Account, lev = Lev,
		       id = RoleId, m_invite_code = MInviteCode},
	  Code)
    when Lev < 20 ->
    case ets:lookup(invite_code_bind, RoleId) of
      [#invite_code_bind{code = Code1}] when Code1 > 0 ->
	  {false, 1, lang:get(<<"已绑定邀请，无法再次绑定"/utf8>>)};
      _ ->
	  case big_world_lib:call(center_all, c_invite_code_mgr,
				  lookup_acc, [Account])
	      of
	    {ok, _} -> {false, lang:get(<<"在其它服已有角色，不能绑定"/utf8>>)};
	    _ ->
		case big_world_lib:call(all_big_world,
					c_invite_code_mgr, lookup, [Code])
		    of
		  false -> {false, lang:get(<<"邀请码不存在"/utf8>>)};
		  {ok, {Code, RoleId, _Account, _Time}} ->
		      {false, lang:get(<<"不能使用自己的邀请码"/utf8>>)};
		  {ok, {Code, _RoleId, Account, _Time}} ->
		      {false, lang:get(<<"不能使用自己的邀请码"/utf8>>)};
		  {ok, {Code, TarRoleId, _Account, _Time}} ->
		      case check_server_id(RoleId, TarRoleId) of
			true ->
			    {ok, BindRole0} = role_convert:do(invite_code_bind,
							      Role),
			    BindRole = BindRole0#invite_code_bind{bind_id =
								      TarRoleId,
								  code = Code},
			    case big_world_lib:call(element(2, TarRoleId),
						    invite_code,
						    apply_bind_role, [BindRole])
				of
			      ok ->
				  d_ets_lib:save_d_ets(invite_code_bind,
						       BindRole),
				  {ok,
				   Role#role{m_invite_code =
						 MInviteCode#m_invite_code{bind_code
									       =
									       Code,
									   bind_roleid
									       =
									       TarRoleId}}};
			      {false, Reason} -> {false, Reason};
			      _Err ->
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
				    {__Pidinvite_code208, _,
				     {__Levelinvite_code208,
				      __Tracesinvite_code208}}
					when __Levelinvite_code208 band 8 /= 0
					       orelse
					       __Tracesinvite_code208 /= [] ->
					lager:do_log(error,
						     [{module, invite_code},
						      {function, bind_code},
						      {line, 208},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("大世界请求邀请码信息时失败:~w",
								   [_Err]),
						     none, 4096, 8,
						     __Levelinvite_code208,
						     __Tracesinvite_code208,
						     lager_event,
						     __Pidinvite_code208);
				    _ -> ok
				  end,
				  {false, lang:get(<<"系统繁忙中，请稍后尝试"/utf8>>)}
			    end;
			_ -> {flase, lang:get(<<"不同平台邀请码不能使用"/utf8>>)}
		      end;
		  _Err ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidinvite_code215, _,
			 {__Levelinvite_code215, __Tracesinvite_code215}}
			    when __Levelinvite_code215 band 8 /= 0 orelse
				   __Tracesinvite_code215 /= [] ->
			    lager:do_log(error,
					 [{module, invite_code},
					  {function, bind_code}, {line, 215},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("大世界请求邀请码信息时失败:~w",
						       [_Err]),
					 none, 4096, 8, __Levelinvite_code215,
					 __Tracesinvite_code215, lager_event,
					 __Pidinvite_code215);
			_ -> ok
		      end,
		      {false, lang:get(<<"系统繁忙中，请稍后尝试"/utf8>>)}
		end
	  end
    end;
bind_code(_Role, _Code) ->
    {false, lang:get(<<"角色等级太高"/utf8>>)}.

check_server_id({_, <<"symlf_", _/binary>>},
		{_, <<"iosmlf_", _/binary>>}) ->
    false;
check_server_id({_, <<"iosmlf_", _/binary>>},
		{_, <<"symlf_", _/binary>>}) ->
    false;
check_server_id(_, _) -> true.

-spec apply_bind_role(#invite_code_bind{}) -> ok |
					      {false, binary()}.

apply_bind_role(BindRole = #invite_code_bind{bind_id =
						 BindId,
					     reg_idfa = RegIdfa,
					     reg_ip = RegIp}) ->
    case catch ets:lookup(invite_code_role, BindId) of
      [#invite_code_role{num = Num, list = RList}] ->
	  case Num >= invite_code_data:get_const(bind_num) of
	    true -> {false, lang:get(<<"对方绑定角色已达上限"/utf8>>)};
	    false ->
		case check_bind_role_source(RList, RegIdfa, RegIp) of
		  true -> invite_code_mgr:cast({bind, BindRole}), ok;
		  {false, Reason} -> {false, Reason}
		end
	  end;
      _ -> {false, lang:get(<<"绑定失败"/utf8>>)}
    end;
apply_bind_role(_) ->
    {false, lang:get(<<"与目标服务器互通失败"/utf8>>)}.

check_bind_role_source(_, <<>>, _RegIp) -> true;
check_bind_role_source(_, <<"mac">>, _RegIp) -> true;
check_bind_role_source(_, <<"windows">>, _RegIp) ->
    true;
check_bind_role_source([], _RegIdfa, _RegIp) -> true;
check_bind_role_source([RoleId | T], RegIdfa, RegIp) ->
    case catch ets:lookup_element(invite_code_bind, RoleId,
				  #invite_code_bind.reg_idfa)
	of
      RegIdfa -> {false, lang:get(<<"检查到异常，不能绑定该角色号"/utf8>>)};
      _ ->
	  case catch ets:lookup_element(invite_code_bind, RoleId,
					#invite_code_bind.reg_ip)
	      of
	    RegIp -> {false, lang:get(<<"检查到异常，不能绑定该角色号"/utf8>>)};
	    _ -> check_bind_role_source(T, RegIdfa, RegIp)
	  end
    end.

-spec apply_bind_fail(#role{}, role_id()) -> ok.

apply_bind_fail(Role = #role{m_invite_code =
				 MInviteCode = #m_invite_code{bind_roleid =
								  BindId}},
		BindId) ->
    notice:alert(lang:get(<<"绑定失败，对方绑定人数达上限"/utf8>>)),
    {ok,
     Role#role{m_invite_code =
		   MInviteCode#m_invite_code{bind_code = 0,
					     bind_roleid = {0, <<>>}}}}.

-spec push_list(#role{}) -> ok.

push_list(#role{misc =
		    #role_misc{invite_code_list = BindRoles,
			       return_code_list = ReturnRoles}}) ->
    sys_conn:pack_send(19802, {BindRoles ++ ReturnRoles}),
    ok.

-spec push_reward(#role{}) -> ok.

push_reward(#role{m_invite_code =
		      #m_invite_code{reward_list = List}}) ->
    sys_conn:pack_send(19804, {List}), ok.

-spec get_reward(#role{},
		 Id :: pos_integer()) -> {false, binary()} |
					 {ok, #role{}, pos_integer(),
					  pos_integer()}.

get_reward(Role = #role{m_invite_code =
			    MInviteCode = #m_invite_code{reward_list =
							     RewardList}},
	   Id) ->
    case lists:keyfind(Id, 1, RewardList) of
      {Id, Num, Had} when Num > Had ->
	  N = Num - Had,
	  #{items := Items0} = invite_code_data:get(Id),
	  Items = [{Bid, Val * N} || {Bid, Val} <- Items0],
	  GL = format:val_to_gain(Items, invite_code),
	  case role_gain:do_notice(Role, GL) of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		NewRewardList = lists:keyreplace(Id, 1, RewardList,
						 {Id, Num, Had + N}),
		NRole = Role1#role{m_invite_code =
				       MInviteCode#m_invite_code{reward_list =
								     NewRewardList}},
		log:log_gain(GL, Role, NRole, <<"邀请码奖励"/utf8>>,
			     util:fbin("奖励id:~w,num:~w,had:~w",
				       [Id, Num, Had])),
		{ok, NRole, Num, Had + N}
	  end;
      _ -> {false, lang:get(<<"没有奖励次数可领"/utf8>>)}
    end.

calc_reward(Role) ->
    do_calc_reward(invite_code_data:list(), Role, false).

do_calc_reward([], Role, Flag) -> {Flag, Role};
do_calc_reward([Id | T],
	       Role = #role{m_invite_code =
				MInviteCode = #m_invite_code{reward_list =
								 RewardList},
			    misc = #role_misc{invite_code_list = BindList}},
	       Flag) ->
    case calc_reward_finish_num(invite_code_data:get(Id),
				BindList)
	of
      0 -> do_calc_reward(T, Role, Flag);
      Num ->
	  case lists:keyfind(Id, 1, RewardList) of
	    false ->
		do_calc_reward(T,
			       Role#role{m_invite_code =
					     MInviteCode#m_invite_code{reward_list
									   =
									   [{Id,
									     Num,
									     0}
									    | RewardList]}},
			       true);
	    {Id, N, Had} when Num > N ->
		do_calc_reward(T,
			       Role#role{m_invite_code =
					     MInviteCode#m_invite_code{reward_list
									   =
									   lists:keyreplace(Id,
											    1,
											    RewardList,
											    {Id,
											     Num,
											     Had})}},
			       true);
	    _ -> do_calc_reward(T, Role, Flag)
	  end
    end.

calc_reward_finish_num(#{conds := [{vip, NeedVip}]},
		       BindList) ->
    length([1
	    || #invite_code_bind{vip = Vip} <- BindList,
	       Vip >= NeedVip]);
calc_reward_finish_num(#{conds := [{power, NeedPower}]},
		       BindList) ->
    length([1
	    || #invite_code_bind{power = Power} <- BindList,
	       Power >= NeedPower]);
calc_reward_finish_num(_Data, _BindList) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidinvite_code336, _,
       {__Levelinvite_code336, __Tracesinvite_code336}}
	  when __Levelinvite_code336 band 8 /= 0 orelse
		 __Tracesinvite_code336 /= [] ->
	  lager:do_log(error,
		       [{module, invite_code},
			{function, calc_reward_finish_num}, {line, 336},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("配置数据条件非法:~w", [_Data]), none, 4096, 8,
		       __Levelinvite_code336, __Tracesinvite_code336,
		       lager_event, __Pidinvite_code336);
      _ -> ok
    end,
    0.

-spec get_bind_role(#role{}, role_id()) -> false |
					   {ok, #invite_code_bind{}}.

get_bind_role(#role{misc =
			#role_misc{invite_code_list = RoleList},
		    m_invite_code =
			#m_invite_code{bind_roleid = BindRoleId}},
	      TarRoleId) ->
    case lists:keyfind(TarRoleId, #invite_code_bind.role_id,
		       RoleList)
	of
      false when BindRoleId =:= TarRoleId ->
	  case ets:lookup(invite_code_bind, TarRoleId) of
	    [R] -> {ok, R};
	    _ -> false
	  end;
      false -> false;
      R -> {ok, R}
    end.

-spec push_bind_role(#role{}) -> ok.

push_bind_role(#role{m_invite_code =
			 #m_invite_code{bind_code = Code = 0,
					bind_roleid = {Rid, SrvId}}}) ->
    sys_conn:pack_send(19807,
		       {Code, Rid, SrvId, <<>>, 0, 0, 0, 0, 0, 0, 0, <<>>}),
    ok;
push_bind_role(#role{m_invite_code =
			 #m_invite_code{bind_code = Code,
					bind_roleid = {Rid, SrvId}}}) ->
    Data = case ets:lookup(invite_code_bind, {Rid, SrvId})
	       of
	     [#invite_code_bind{name = Name, lev = Lev, vip = Vip,
				online = Online, power = Power, face = Face,
				avatar_bid = AvatarBid,
				face_update_time = FaceUpdateTime,
				face_file = FaceFile}] ->
		 {Code, Rid, SrvId, Name, Lev, Vip, Online, Power, Face,
		  AvatarBid, FaceUpdateTime, FaceFile};
	     _ -> {Code, Rid, SrvId, <<>>, 0, 0, 0, 0, 0, 0, 0, <<>>}
	   end,
    sys_conn:pack_send(19807, Data),
    ok.


