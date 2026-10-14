-file("src/mod/role_room/role_room_mgr.erl", 1).

-module(role_room_mgr).

-lager_records([{map_role,
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
		{room_rank_info,
		 [id, name, lev, face, avatar_bid, time, fans_num, rank,
		  look_id, face_update_time, face_file]},
		{room_fans_num, [id, fans]}, {room_fans, [myid, fid]},
		{room_bbs_message_below, [id, role_id, name, bbs_id]},
		{room_bbs_message,
		 [id, bbs_id, bbs_type, reply_name, reply_bbs_id,
		  reply_id, msg, time, tar_id, face_id, avatar_id, lev,
		  sex, name, face_update_time, face_file]},
		{room_honor_badges, [id, time]},
		{room_grow, [id, order, time, arge, ext]},
		{m_room_grow, [ver, finish, doing, info, next_id, ext]},
		{m_room_feat, [ver, flag, finish, doing, overdue, ext]},
		{m_room,
		 [ver, city_id, fanse_list, honor_badges, honor_point,
		  use_badges, room_bbs_set, room_bbs_num]},
		{state, []}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_fans_num/1, get_role_rank/1,
	 do_clear_rank/0]).

-export([gm_calc_rank/0]).

-record(state, {}).

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

-file("src/mod/role_room/role_room_mgr.erl", 20).

-file("inc/role_room.hrl", 1).

-record(m_room,
	{ver = 3, city_id = 0, fanse_list = [],
	 honor_badges = [], honor_point = 0, use_badges = [],
	 room_bbs_set = 1, room_bbs_num = 0}).

-record(m_room_feat,
	{ver = 1, flag = 0,
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()], ext = []}).

-record(m_room_grow,
	{ver = 1, finish = []  :: [pos_integer()],
	 doing = []  :: [tuple()], info = [], next_id = 1,
	 ext = []}).

-record(room_grow,
	{id = 0, order = 0, time = 0, arge = [], ext = []}).

-record(room_honor_badges, {id = 0, time = 0}).

-record(room_bbs_message,
	{id = {0, <<>>}, bbs_id = 0, bbs_type = 0,
	 reply_name = <<>>, reply_bbs_id = 0,
	 reply_id = {0, <<>>}, msg = <<>>, time = 0,
	 tar_id = {0, <<>>}, face_id = 0, avatar_id = 0, lev = 0,
	 sex = 0, name = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(room_bbs_message_below,
	{id = {0, <<>>}, role_id = {0, <<>>}, name = <<>>,
	 bbs_id = 0}).

-record(room_fans, {myid = {0, <<>>}, fid = {0, <<>>}}).

-record(room_fans_num, {id = {0, <<>>}, fans = 0}).

-record(room_rank_info,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, fans_num = 0, rank = 0,
	 look_id = 0, face_update_time = 0, face_file = <<>>}).

-file("src/mod/role_room/role_room_mgr.erl", 21).

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

-file("src/mod/role_room/role_room_mgr.erl", 22).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/role_room/role_room_mgr.erl", 23).

gm_calc_rank() -> catch info(gm_calc_rank).

do_clear_rank() ->
    ets:delete_all_objects(room_rank_info),
    dets:delete_all_objects(room_rank_info).

-spec get_fans_num(Rid :: role_id()) -> pos_integer().

get_fans_num(RoleId) ->
    case catch ets:lookup(room_fans_num, RoleId) of
      [#room_fans_num{fans = Fans} | _] -> Fans;
      _ -> 0
    end.

-spec get_role_rank(Rid :: role_id()) -> pos_integer().

get_role_rank(RoleId) ->
    case catch ets:match_object(room_rank_info,
				#room_rank_info{id = RoleId, _ = '_'})
	of
      [#room_rank_info{rank = Rank} | _] -> Rank;
      _ -> 0
    end.

-spec update_ets(atom(), any(), ets | dets | all) -> ok.

update_ets(Tab, Data, reset_all) ->
    ets:delete_all_objects(Tab),
    dets:delete_all_objects(Tab),
    update_ets(Tab, Data, ets),
    update_ets(Tab, Data, dets);
update_ets(Tab, Data, ets) -> ets:insert(Tab, Data);
update_ets(Tab, Data, dets) -> dets:insert(Tab, Data);
update_ets(Tab, Data, all) ->
    ets:insert(Tab, Data), dets:insert(Tab, Data).

tab(1) -> c_room_fans_1;
tab(2) -> c_room_fans_2;
tab(3) -> c_room_fans_3;
tab(4) -> c_room_fans_4;
tab(5) -> c_room_fans_5;
tab(N) when N > 5 -> tab(N rem 5 + 1).

info(Info) -> role_room_mgr ! Info.

cast(Info) -> gen_server:cast(role_room_mgr, Info).

call(Info) ->
    case catch gen_server:call(role_room_mgr, Info, 10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_room_mgr82, _,
	     {__Levelrole_room_mgr82, __Tracesrole_room_mgr82}}
		when __Levelrole_room_mgr82 band 8 /= 0 orelse
		       __Tracesrole_room_mgr82 /= [] ->
		lager:do_log(error,
			     [{module, role_room_mgr}, {function, call},
			      {line, 82}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [role_room_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelrole_room_mgr82,
			     __Tracesrole_room_mgr82, lager_event,
			     __Pidrole_room_mgr82);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, role_room_mgr},
			  role_room_mgr, [], []).

open_ets(0) -> ok;
open_ets(N) ->
    TabName = tab(N),
    dets:open_file(TabName,
		   [{file,
		     lists:concat(["./dets/role_room_", N, ".dets"])},
		    {keypos, #room_fans.myid}, {type, duplicate_bag}]),
    ets:new(TabName,
	    [duplicate_bag, named_table, public,
	     {keypos, #room_fans.myid}]),
    open_ets(N - 1).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_room_mgr97, _,
       {__Levelrole_room_mgr97, __Tracesrole_room_mgr97}}
	  when __Levelrole_room_mgr97 band 64 /= 0 orelse
		 __Tracesrole_room_mgr97 /= [] ->
	  lager:do_log(info,
		       [{module, role_room_mgr}, {function, init}, {line, 97},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [role_room_mgr]), none,
		       4096, 64, __Levelrole_room_mgr97,
		       __Tracesrole_room_mgr97, lager_event,
		       __Pidrole_room_mgr97);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(room_fans_num,
		   [{file, "./dets/room_fans_num.dets"},
		    {keypos, #room_fans_num.id}, {type, set}]),
    ets:new(room_fans_num,
	    [set, named_table, public,
	     {keypos, #room_fans_num.id}]),
    dets:open_file(room_rank_info,
		   [{file, "./dets/room_rank_info.dets"},
		    {keypos, #room_rank_info.rank}, {type, set}]),
    ets:new(room_rank_info,
	    [set, named_table, public,
	     {keypos, #room_rank_info.rank}]),
    do_init_room_rank_info(),
    ets:from_dets(room_fans_num, room_fans_num),
    put(room_rank_list, ets:tab2list(room_rank_info)),
    put(room_fans_rank_award,
	erlang:send_after(date:week_next_diff([1], {0, 0, 0}) *
			    1000,
			  self(), room_fans_rank_award)),
    open_ets(5),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_room_mgr118, _,
       {__Levelrole_room_mgr118, __Tracesrole_room_mgr118}}
	  when __Levelrole_room_mgr118 band 64 /= 0 orelse
		 __Tracesrole_room_mgr118 /= [] ->
	  lager:do_log(info,
		       [{module, role_room_mgr}, {function, init}, {line, 118},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [role_room_mgr]), none, 4096,
		       64, __Levelrole_room_mgr118, __Tracesrole_room_mgr118,
		       lager_event, __Pidrole_room_mgr118);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({add_fans, RoleId = {Rid, _}, TarRoleId,
	     TarRoleName, Num},
	    State) ->
    FanseNum = get_fans_num(RoleId),
    NFanseNum = max(0, FanseNum + Num),
    update_room_rank_info(RoleId, NFanseNum),
    update_ets(room_fans_num,
	       #room_fans_num{id = RoleId, fans = NFanseNum}, all),
    role_lib:cast(by_id, RoleId,
		  {role_lib, push_base_info, []}),
    room_feat_mgr:info({role_room_fans_do_feat, RoleId,
			TarRoleName, NFanseNum}),
    case Num > 0 of
      true ->
	  TabName = tab(Rid),
	  update_ets(TabName,
		     #room_fans{myid = RoleId, fid = TarRoleId}, all);
      _ ->
	  TabName = tab(Rid),
	  ets:match_delete(TabName,
			   #room_fans{myid = RoleId, fid = TarRoleId, _ = '_'}),
	  dets:match_delete(TabName,
			    #room_fans{myid = RoleId, fid = TarRoleId, _ = '_'})
    end,
    {noreply, State};
handle_info(gm_calc_rank, State) ->
    List = ets:tab2list(room_fans_num),
    Fun = fun (#room_fans_num{id = RoleId, fans = FansNum},
	       Acc) ->
		  update_room_rank_info(RoleId, FansNum), Acc
	  end,
    lists:foldl(Fun, [], List),
    {noreply, State};
handle_info(room_fans_rank_award, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_room_mgr162, _,
       {__Levelrole_room_mgr162, __Tracesrole_room_mgr162}}
	  when __Levelrole_room_mgr162 band 64 /= 0 orelse
		 __Tracesrole_room_mgr162 /= [] ->
	  lager:do_log(info,
		       [{module, role_room_mgr}, {function, handle_info},
			{line, 162}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "粉丝排行榜发送排名奖励", none, 4096, 64, __Levelrole_room_mgr162,
		       __Tracesrole_room_mgr162, lager_event,
		       __Pidrole_room_mgr162);
      _ -> ok
    end,
    case erase(room_fans_rank_award) of
      undefined -> skip;
      Timer -> erlang:cancel_timer(Timer)
    end,
    MaxRank = role_career_data:get_const(fan_rewardnumber),
    Now = date:unixtime(),
    OldCdTime = util:get(room_fans_rank_award_cd, 0),
    case Now >= OldCdTime + 10 of
      true ->
	  do_send_mail(1, MaxRank),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_room_mgr173, _,
	     {__Levelrole_room_mgr173, __Tracesrole_room_mgr173}}
		when __Levelrole_room_mgr173 band 64 /= 0 orelse
		       __Tracesrole_room_mgr173 /= [] ->
		lager:do_log(info,
			     [{module, role_room_mgr}, {function, handle_info},
			      {line, 173}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "粉丝排行榜发送排名奖励完成", none, 4096, 64,
			     __Levelrole_room_mgr173, __Tracesrole_room_mgr173,
			     lager_event, __Pidrole_room_mgr173);
	    _ -> ok
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
	    {__Pidrole_room_mgr175, _,
	     {__Levelrole_room_mgr175, __Tracesrole_room_mgr175}}
		when __Levelrole_room_mgr175 band 64 /= 0 orelse
		       __Tracesrole_room_mgr175 /= [] ->
		lager:do_log(info,
			     [{module, role_room_mgr}, {function, handle_info},
			      {line, 175}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "粉丝排行榜发送排名奖励时cd时间不足", none, 4096, 64,
			     __Levelrole_room_mgr175, __Tracesrole_room_mgr175,
			     lager_event, __Pidrole_room_mgr175);
	    _ -> ok
	  end
    end,
    put(room_fans_rank_award_cd, Now),
    put(room_fans_rank_award,
	erlang:send_after(date:week_next_diff([1], {0, 0, 0}) *
			    1000,
			  self(), room_fans_rank_award)),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_room_mgr185, _,
       {__Levelrole_room_mgr185, __Tracesrole_room_mgr185}}
	  when __Levelrole_room_mgr185 band 64 /= 0 orelse
		 __Tracesrole_room_mgr185 /= [] ->
	  lager:do_log(info,
		       [{module, role_room_mgr}, {function, terminate},
			{line, 185}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelrole_room_mgr185,
		       __Tracesrole_room_mgr185, lager_event,
		       __Pidrole_room_mgr185);
      _ -> ok
    end,
    ok.

do_send_mail(Start, Num) when Start > Num -> ok;
do_send_mail(Start, Num) ->
    case catch ets:lookup(room_rank_info, Start) of
      [#room_rank_info{id = Id, rank = Rank} | _] ->
	  Awaerds = role_career_data:get_const(fan_rank_reward),
	  Content =
	      color:msg(lang:get(<<"亲爱的冒险者大人：\n     恭喜您在上周的粉丝排行榜中获得了第~ts名，为了展现您受欢"
				   "迎的程度，特此送上专属头像框一个 \n祝您游戏愉快ヾ（≧∇≦）〃"/utf8>>),
			[{string, {red, Rank}}]),
	  {Assets, Items} = format:split_assets_items(Awaerds),
	  Mail = {lang:get(<<"粉丝排行奖励"/utf8>>), Content, Assets,
		  Items, lang:get(<<"粉丝排行奖励"/utf8>>)},
	  mail:send(Id, Mail);
      _ -> skip
    end,
    do_send_mail(Start + 1, Num).

update_rank(RankInfo = #room_rank_info{id = RoleId,
				       fans_num = FansNum}) ->
    RankList = util:get(room_rank_list, []),
    case lists:keyfind(RoleId, #room_rank_info.id, RankList)
	of
      #room_rank_info{} when FansNum =< 0 ->
	  NRankList = lists:keydelete(RoleId, #room_rank_info.id,
				      RankList),
	  NewListT = list_util:mkeysort2([{r,
					   #room_rank_info.fans_num},
					  {s, #room_rank_info.time}],
					 NRankList),
	  NewListT2 = do_rand(1, NewListT, []),
	  put(room_rank_list, NewListT2),
	  update_ets(room_rank_info, NewListT2, reset_all);
      _ when FansNum > 0 ->
	  NRankList = lists:keystore(RoleId, #room_rank_info.id,
				     RankList, RankInfo),
	  NewListT = list_util:mkeysort2([{r,
					   #room_rank_info.fans_num},
					  {s, #room_rank_info.time}],
					 NRankList),
	  NewListT2 = do_rand(1, NewListT, []),
	  {NewList3, _} = list_util:split(300, NewListT2),
	  put(room_rank_list, NewList3),
	  update_ets(room_rank_info, NewList3, reset_all);
      _ -> ok
    end.

do_rand(_, [], L) -> lists:reverse(L);
do_rand(N, [Data | List], L) ->
    NewData = Data#room_rank_info{rank = N},
    do_rand(N + 1, List, [NewData | L]).

code_change(_OldVsn, State, _Extra) -> {ok, State}.

update_room_rank_info(RoleId, NFanseNum) ->
    case role_robot:get_role(RoleId) of
      {ok,
       #role_robot{face_id = FaceId, lev = Lev, name = Name,
		   avatar_bid = AvatarBid, look_id = LookId,
		   face_update_time = FaceUpdateTime,
		   face_file = FaceFile}} ->
	  RoomRankInfo = #room_rank_info{id = RoleId, lev = Lev,
					 name = Name, face = FaceId,
					 face_update_time = FaceUpdateTime,
					 face_file = FaceFile,
					 avatar_bid = AvatarBid,
					 time = date:unixtime(),
					 fans_num = NFanseNum,
					 look_id = LookId},
	  update_rank(RoomRankInfo);
      _ -> ok
    end.

do_init_room_rank_info() ->
    case dets:first(room_rank_info) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_room_mgr247, _,
	     {__Levelrole_room_mgr247, __Tracesrole_room_mgr247}}
		when __Levelrole_room_mgr247 band 64 /= 0 orelse
		       __Tracesrole_room_mgr247 /= [] ->
		lager:do_log(info,
			     [{module, role_room_mgr},
			      {function, do_init_room_rank_info}, {line, 247},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "没有数据需要加载", none, 4096, 64,
			     __Levelrole_room_mgr247, __Tracesrole_room_mgr247,
			     lager_event, __Pidrole_room_mgr247);
	    _ -> ok
	  end,
	  [];
      _ ->
	  dets:traverse(room_rank_info,
			fun (C) ->
				case role_room_ver:do_room_rank_info(C) of
				  {false, Reason} ->
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
					{__Pidrole_room_mgr254, _,
					 {__Levelrole_room_mgr254,
					  __Tracesrole_room_mgr254}}
					    when __Levelrole_room_mgr254 band 8
						   /= 0
						   orelse
						   __Tracesrole_room_mgr254 /=
						     [] ->
					    lager:do_log(error,
							 [{module,
							   role_room_mgr},
							  {function,
							   do_init_room_rank_info},
							  {line, 254},
							  {pid,
							   pid_to_list(self())},
							  {node, node()}
							  | lager:md()],
							 io_lib:format("角色粉丝排行榜数据转换失败:~w",
								       [Reason]),
							 none, 4096, 8,
							 __Levelrole_room_mgr254,
							 __Tracesrole_room_mgr254,
							 lager_event,
							 __Pidrole_room_mgr254);
					_ -> ok
				      end,
				      {done, false};
				  {ok, NewC} ->
				      ets:insert(room_rank_info, NewC),
				      dets:insert(room_rank_info, NewC),
				      continue
				end
			end)
    end.


