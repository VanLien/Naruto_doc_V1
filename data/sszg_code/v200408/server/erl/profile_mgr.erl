-file("src/mod/profile/profile_mgr.erl", 1).

-module(profile_mgr).

-lager_records([{state, []},
		{profile_add, [key, id, mod, ext]},
		{profile_reward, [ver, role_id, add_list]},
		{honor_info, [key, list, end_time]},
		{honor_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr, add_exp, dynamic]},
		{honor, [ver, base_id, expire_time]},
		{m_honor, [ver, used, list]},
		{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
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

-behaviour(gen_server).

-export([start_link/0, async_add/2, async_add/3,
	 async_del/2, lookup/1]).

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

-file("src/mod/profile/profile_mgr.erl", 24).

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

-file("src/mod/profile/profile_mgr.erl", 25).

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

-file("src/mod/profile/profile_mgr.erl", 26).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/profile/profile_mgr.erl", 27).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/profile/profile_mgr.erl", 28).

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

-file("src/mod/profile/profile_mgr.erl", 29).

-file("inc/profile.hrl", 1).

-record(profile_reward,
	{ver = 1, role_id, add_list = []}).

-record(profile_add, {key, id, mod, ext = #{}}).

-file("src/mod/profile/profile_mgr.erl", 30).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {}).

start_link() ->
    gen_server:start_link({local, profile_mgr}, profile_mgr,
			  [], []).

-spec async_add(RoleId :: tuple(),
		[#profile_add{}]) -> ok.

async_add(RoleId = {_Rid, _SrvId}, AddList) ->
    Data = [#{role_id => RoleId, add_list => AddList}],
    gen_server:cast(profile_mgr, {add, Data}),
    ok.

-spec async_add(RoleId :: tuple(), Mod :: atom(),
		Bid :: integer()) -> ok.

async_add(RoleId, Mod, Bid) ->
    async_add(RoleId, Mod, Bid, #{}).

-spec async_add(RoleId :: tuple(), Mod :: atom(),
		Bid :: integer(), Ext :: map()) -> ok.

async_add(RoleId, Mod, Bid, Ext) ->
    ProfileAdd = profile:make_profile_add(Mod, Bid, Ext),
    async_add(RoleId, [ProfileAdd]).

cast_add([]) -> ok;
cast_add([H | Rest]) -> cast_add(H), cast_add(Rest);
cast_add(#{role_id := RoleId, add_list := InfoL}) ->
    case lookup(RoleId) of
      [Reward = #profile_reward{add_list = AddList}] ->
	  NewAddL = init_info(InfoL, AddList),
	  NewReward = Reward#profile_reward{add_list = NewAddL},
	  role_lib:cast(by_id, RoleId,
			{profile, apply_add, [NewAddL]}),
	  save(profile_reward, NewReward);
      [] ->
	  NInfoL = init_info(InfoL, []),
	  Reward = #profile_reward{add_list = NInfoL,
				   role_id = RoleId},
	  role_lib:cast(by_id, RoleId,
			{profile, apply_add, [NInfoL]}),
	  save(profile_reward, Reward);
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidprofile_mgr78, _,
	     {__Levelprofile_mgr78, __Tracesprofile_mgr78}}
		when __Levelprofile_mgr78 band 8 /= 0 orelse
		       __Tracesprofile_mgr78 /= [] ->
		lager:do_log(error,
			     [{module, profile_mgr}, {function, cast_add},
			      {line, 78}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("异步添加[Rid:~w]装饰[InfoL:~w]失败:~w",
					   [RoleId, InfoL, Err]),
			     none, 4096, 8, __Levelprofile_mgr78,
			     __Tracesprofile_mgr78, lager_event,
			     __Pidprofile_mgr78);
	    _ -> ok
	  end,
	  skip
    end,
    ok;
cast_add(Unknow) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidprofile_mgr83, _,
       {__Levelprofile_mgr83, __Tracesprofile_mgr83}}
	  when __Levelprofile_mgr83 band 8 /= 0 orelse
		 __Tracesprofile_mgr83 /= [] ->
	  lager:do_log(error,
		       [{module, profile_mgr}, {function, cast_add},
			{line, 83}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("异步添加装饰失败:~w", [Unknow]), none, 4096, 8,
		       __Levelprofile_mgr83, __Tracesprofile_mgr83,
		       lager_event, __Pidprofile_mgr83);
      _ -> ok
    end,
    ok.

-spec async_del(#role{}, [term()]) -> ok.

async_del(#role{id = RoleId}, DelKeys) ->
    gen_server:cast(profile_mgr, {del, RoleId, DelKeys}),
    ok.

cast_del(RoleId, DelKeys) ->
    case lookup(RoleId) of
      {ok, Reward = #profile_reward{add_list = AddList}} ->
	  Fun = fun (Key, Acc) ->
			lists:keydelete(Key, #profile_add.key, Acc)
		end,
	  NAddList = lists:foldl(Fun, AddList, DelKeys),
	  case NAddList of
	    [_ | _] ->
		NReward = Reward#profile_reward{add_list = NAddList},
		save(profile_reward, NReward),
		ok;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidprofile_mgr105, _,
		   {__Levelprofile_mgr105, __Tracesprofile_mgr105}}
		      when __Levelprofile_mgr105 band 64 /= 0 orelse
			     __Tracesprofile_mgr105 /= [] ->
		      lager:do_log(info,
				   [{module, profile_mgr}, {function, cast_del},
				    {line, 105}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[Rid~w]已无添加个性设置，删除数据",
						 [RoleId]),
				   none, 4096, 64, __Levelprofile_mgr105,
				   __Tracesprofile_mgr105, lager_event,
				   __Pidprofile_mgr105);
		  _ -> ok
		end,
		delete(profile_reward, RoleId),
		ok
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
	    {__Pidprofile_mgr110, _,
	     {__Levelprofile_mgr110, __Tracesprofile_mgr110}}
		when __Levelprofile_mgr110 band 8 /= 0 orelse
		       __Tracesprofile_mgr110 /= [] ->
		lager:do_log(error,
			     [{module, profile_mgr}, {function, cast_del},
			      {line, 110}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("删除[Rid:~w]个性设置[InfoL:~w]失败:~w",
					   [RoleId, DelKeys, Err]),
			     none, 4096, 8, __Levelprofile_mgr110,
			     __Tracesprofile_mgr110, lager_event,
			     __Pidprofile_mgr110);
	    _ -> ok
	  end,
	  ok
    end.

-spec lookup(RoleId :: tuple()) -> {ok,
				    #profile_reward{}}.

lookup(RoleId) ->
    case ets:lookup(profile_reward, RoleId) of
      [Reward] -> {ok, Reward};
      _ -> false
    end.

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidprofile_mgr127, _,
       {__Levelprofile_mgr127, __Tracesprofile_mgr127}}
	  when __Levelprofile_mgr127 band 64 /= 0 orelse
		 __Tracesprofile_mgr127 /= [] ->
	  lager:do_log(info,
		       [{module, profile_mgr}, {function, init}, {line, 127},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]正在启动...", [profile_mgr]), none, 4096,
		       64, __Levelprofile_mgr127, __Tracesprofile_mgr127,
		       lager_event, __Pidprofile_mgr127);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    case catch load_data() of
      ok ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidprofile_mgr131, _,
	     {__Levelprofile_mgr131, __Tracesprofile_mgr131}}
		when __Levelprofile_mgr131 band 64 /= 0 orelse
		       __Tracesprofile_mgr131 /= [] ->
		lager:do_log(info,
			     [{module, profile_mgr}, {function, init},
			      {line, 131}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]启动完成", [profile_mgr]), none,
			     4096, 64, __Levelprofile_mgr131,
			     __Tracesprofile_mgr131, lager_event,
			     __Pidprofile_mgr131);
	    _ -> ok
	  end,
	  {ok, #state{}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidprofile_mgr134, _,
	     {__Levelprofile_mgr134, __Tracesprofile_mgr134}}
		when __Levelprofile_mgr134 band 8 /= 0 orelse
		       __Tracesprofile_mgr134 /= [] ->
		lager:do_log(error,
			     [{module, profile_mgr}, {function, init},
			      {line, 134}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]启动失败[Err:~w]",
					   [profile_mgr, Err]),
			     none, 4096, 8, __Levelprofile_mgr134,
			     __Tracesprofile_mgr134, lager_event,
			     __Pidprofile_mgr134);
	    _ -> ok
	  end,
	  {stop, abnormal}
    end.

handle_call(_Request, _From, State) ->
    {reply, false, State}.

handle_cast({add, AddList}, State) ->
    case catch cast_add(AddList) of
      ok -> ok;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidprofile_mgr146, _,
	     {__Levelprofile_mgr146, __Tracesprofile_mgr146}}
		when __Levelprofile_mgr146 band 8 /= 0 orelse
		       __Tracesprofile_mgr146 /= [] ->
		lager:do_log(error,
			     [{module, profile_mgr}, {function, handle_cast},
			      {line, 146}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("发放装饰奖励[AddList:~w]失败:~w",
					   [AddList, Err]),
			     none, 4096, 8, __Levelprofile_mgr146,
			     __Tracesprofile_mgr146, lager_event,
			     __Pidprofile_mgr146);
	    _ -> ok
	  end,
	  ok
    end,
    {noreply, State};
handle_cast({del, RoleId, DelIds}, State) ->
    case catch cast_del(RoleId, DelIds) of
      ok -> ok;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidprofile_mgr156, _,
	     {__Levelprofile_mgr156, __Tracesprofile_mgr156}}
		when __Levelprofile_mgr156 band 8 /= 0 orelse
		       __Tracesprofile_mgr156 /= [] ->
		lager:do_log(error,
			     [{module, profile_mgr}, {function, handle_cast},
			      {line, 156}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[Rid:~w]删除[DelIds:~w]失败:~w",
					   [RoleId, DelIds, Err]),
			     none, 4096, 8, __Levelprofile_mgr156,
			     __Tracesprofile_mgr156, lager_event,
			     __Pidprofile_mgr156);
	    _ -> ok
	  end,
	  ok
    end,
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(Reason, _State) ->
    util:close_dets(profile_reward),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidprofile_mgr169, _,
       {__Levelprofile_mgr169, __Tracesprofile_mgr169}}
	  when __Levelprofile_mgr169 band 64 /= 0 orelse
		 __Tracesprofile_mgr169 /= [] ->
	  lager:do_log(info,
		       [{module, profile_mgr}, {function, terminate},
			{line, 169}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]完成关闭:~w", [profile_mgr, Reason]),
		       none, 4096, 64, __Levelprofile_mgr169,
		       __Tracesprofile_mgr169, lager_event,
		       __Pidprofile_mgr169);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    {ok, profile_reward} = dets:open_file(profile_reward,
					  [{file, "dets/profile_reward.dets"},
					   {keypos, #profile_reward.role_id}]),
    profile_reward = ets:new(profile_reward,
			     [set, named_table, public,
			      {keypos, #profile_reward.role_id}]),
    profile_reward = dets:to_ets(profile_reward,
				 profile_reward),
    check_data(),
    ok.

check_data() ->
    Now = date:unixtime(),
    Fun = fun (Reward = #profile_reward{add_list = AddList},
	       Acc) ->
		  case overdue_data(AddList, Now, []) of
		    NAddList = [_ | _] ->
			NReward = Reward#profile_reward{add_list = NAddList},
			[NReward | Acc];
		    _ -> Acc
		  end
	  end,
    AddL = ets:foldl(Fun, [], profile_reward),
    save(profile_reward, AddL),
    ok.

overdue_data(#profile_add{key = Bid, mod = avatar,
			  ext = #{start_time := Time}},
	     Now) ->
    case avatar_data:get(Bid) of
      #avatar_frame_data{expire_type = 0} -> true;
      Data = #avatar_frame_data{} ->
	  case avatar:init_frame(Data) of
	    {ok, #avatar_frame{expire_time = ExpireTime}} ->
		ExpireTime - (Now - Time) >= Now;
	    _ -> false
	  end;
      _ -> false
    end;
overdue_data(#profile_add{key = Bid, mod = say_frame,
			  ext = #{start_time := Time}},
	     Now) ->
    case say_data:get(Bid) of
      #say_frame_data{expire_type = 0} -> true;
      Data = #say_frame_data{} ->
	  case say_frame:init_frame(Data) of
	    {ok, #say_frame{expire_time = ExpireTime}} ->
		ExpireTime - (Now - Time) >= Now;
	    _ -> false
	  end;
      _ -> false
    end;
overdue_data(#profile_add{key = Bid, mod = honor,
			  ext = #{start_time := Time}},
	     Now) ->
    case honor_data:get(Bid) of
      #honor_data{expire_type = 0} -> true;
      Data = #honor_data{} ->
	  case honor:init_frame(Data) of
	    {ok, #honor{expire_time = ExpireTime}} ->
		ExpireTime - (Now - Time) >= Now;
	    _ -> false
	  end;
      _ -> false
    end;
overdue_data(_Add, _Now) -> true.

overdue_data([], _Now, Acc) -> Acc;
overdue_data([H | Rest], Now, Acc) ->
    NewAcc = case overdue_data(H, Now) of
	       true -> [H | Acc];
	       _ -> Acc
	     end,
    overdue_data(Rest, Now, NewAcc).

save(Tab, Objs) ->
    try ets:insert(Tab, Objs), dets:insert(Tab, Objs), ok
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidprofile_mgr258, _,
	     {__Levelprofile_mgr258, __Tracesprofile_mgr258}}
		when __Levelprofile_mgr258 band 8 /= 0 orelse
		       __Tracesprofile_mgr258 /= [] ->
		lager:do_log(error,
			     [{module, profile_mgr}, {function, save},
			      {line, 258}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("保存[Tab:~w]数据错误[Type:~w][Err:~w][Objs:~w]",
					   [Tab, Type, Err, Objs]),
			     none, 4096, 8, __Levelprofile_mgr258,
			     __Tracesprofile_mgr258, lager_event,
			     __Pidprofile_mgr258);
	    _ -> ok
	  end,
	  false
    end.

delete(Tab, Key) ->
    try ets:delete(Tab, Key), dets:delete(Tab, Key), ok
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidprofile_mgr270, _,
	     {__Levelprofile_mgr270, __Tracesprofile_mgr270}}
		when __Levelprofile_mgr270 band 8 /= 0 orelse
		       __Tracesprofile_mgr270 /= [] ->
		lager:do_log(error,
			     [{module, profile_mgr}, {function, delete},
			      {line, 270}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("删除[Tab:~w]数据错误[Type:~w][Err:~w][Key:~w]",
					   [Tab, Type, Err, Key]),
			     none, 4096, 8, __Levelprofile_mgr270,
			     __Tracesprofile_mgr270, lager_event,
			     __Pidprofile_mgr270);
	    _ -> ok
	  end,
	  false
    end.

init_info([], Acc) -> Acc;
init_info([Info = #profile_add{key = Key} | T], Acc) ->
    case lists:keyfind(Key, #profile_add.key, Acc) of
      false -> init_info(T, [Info | Acc]);
      #profile_add{} ->
	  NewAcc = lists:keystore(Key, #profile_add.key, Acc,
				  Info),
	  init_info(T, NewAcc)
    end.


