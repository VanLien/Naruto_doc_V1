-file("src/mod/drop/drop_mgr.erl", 1).

-module(drop_mgr).

-lager_records([{state, []},
		{drop_role,
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

-export([start_link/0, init/1, handle_call/3,
	 handle_cast/2, handle_info/2, terminate/2,
	 code_change/3]).

-export([login/1, logout/1, get_drop_bag/1,
	 set_drop_bag/1, cache2mon/1, mon2cache/1, get_limit/2,
	 set_limit/3, set_time_val/3, get_time_val/1,
	 unset_time_val/1, set_count_val/3, get_count_val/1,
	 unset_count_val/1]).

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

-file("src/mod/drop/drop_mgr.erl", 32).

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

-file("src/mod/drop/drop_mgr.erl", 33).

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

-file("src/mod/drop/drop_mgr.erl", 34).

-record(state, {}).

-spec login(#role{}) -> ok | {ok, #role{}}.

login(#role{id = Id}) ->
    case dets:lookup(drop_bag, Id) of
      [DropBag = #drop_bag{}] ->
	  ets:insert(drop_bag, DropBag);
      _ -> skip
    end,
    ok.

-spec logout(#role{}) -> ok | {ok, #role{}}.

logout(#role{id = Id}) ->
    Limit = #drop_limit{},
    case ets:lookup(drop_bag, Id) of
      [#drop_bag{mon = Limit, mon_cache = Limit,
		 common = Limit}] ->
	  ets:delete(drop_bag, Id), dets:delete(drop_bag, Id);
      [DropBag] ->
	  ets:delete(drop_bag, Id),
	  dets:insert(drop_bag, DropBag);
      _ -> skip
    end,
    ok.

get_drop_bag(Id) ->
    case ets:lookup(drop_bag, Id) of
      [DropBag] -> DropBag;
      _ -> #drop_bag{id = Id}
    end.

set_drop_bag(DropBag) -> ets:insert(drop_bag, DropBag).

cache2mon(Id) ->
    DropBag = get_drop_bag(Id),
    DropBag2 = DropBag#drop_bag{mon =
				    DropBag#drop_bag.mon_cache},
    set_drop_bag(DropBag2).

mon2cache(Id) ->
    DropBag = get_drop_bag(Id),
    DropBag2 = DropBag#drop_bag{mon_cache =
				    DropBag#drop_bag.mon},
    set_drop_bag(DropBag2).

get_limit(Id, 1) ->
    #drop_bag{mon = DropLimit} = get_drop_bag(Id),
    DropLimit;
get_limit(Id, 2) ->
    #drop_bag{mon_cache = DropLimit} = get_drop_bag(Id),
    DropLimit;
get_limit(Id, 3) ->
    #drop_bag{common = DropLimit} = get_drop_bag(Id),
    DropLimit.

set_limit(Id, DropLimit, 1) ->
    DropBag = get_drop_bag(Id),
    DropBag2 = DropBag#drop_bag{mon = DropLimit,
				mon_cache = DropLimit},
    set_drop_bag(DropBag2);
set_limit(Id, DropLimit, 2) ->
    DropBag = get_drop_bag(Id),
    DropBag2 = DropBag#drop_bag{mon_cache = DropLimit},
    set_drop_bag(DropBag2);
set_limit(Id, DropLimit, 3) ->
    DropBag = get_drop_bag(Id),
    DropBag2 = DropBag#drop_bag{common = DropLimit},
    set_drop_bag(DropBag2).

set_time_val(Key, Val, TimeOut) ->
    ets:insert(drop_g_time_val, {Key, Val, TimeOut}).

get_time_val(Key) ->
    case ets:lookup(drop_g_time_val, Key) of
      [{_, Val, TimeOut} | _] ->
	  Now = date:unixtime(),
	  case Now >= TimeOut of
	    true -> unset_time_val(Key), {0, 0};
	    false -> {Val, TimeOut}
	  end;
      [] -> {0, 0}
    end.

unset_time_val(Key) -> ets:delete(drop_g_time_val, Key).

set_count_val(Key, Val, MaxVal) ->
    ets:insert(drop_g_count_val, {Key, Val, MaxVal}).

get_count_val(Key) ->
    case ets:lookup(drop_g_count_val, Key) of
      [{_, Val, MaxVal} | _] -> {Val, MaxVal};
      _ -> {0, 0}
    end.

unset_count_val(Key) ->
    ets:delete(drop_g_count_val, Key).

start_link() ->
    gen_server:start_link({local, drop_mgr}, drop_mgr, [],
			  []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrop_mgr158, _,
       {__Leveldrop_mgr158, __Tracesdrop_mgr158}}
	  when __Leveldrop_mgr158 band 64 /= 0 orelse
		 __Tracesdrop_mgr158 /= [] ->
	  lager:do_log(info,
		       [{module, drop_mgr}, {function, init}, {line, 158},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动...", none, 4096, 64, __Leveldrop_mgr158,
		       __Tracesdrop_mgr158, lager_event, __Piddrop_mgr158);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(drop_g_time_val,
	    [named_table, public, set, {keypos, 1}]),
    ets:new(drop_g_count_val,
	    [named_table, public, set, {keypos, 1}]),
    dets:open_file(drop_bag,
		   [{file, "./dets/drop_bag.dets"},
		    {keypos, #drop_bag.id}]),
    ets:new(drop_bag,
	    [named_table, public, set, {keypos, #drop_bag.id}]),
    {ok, #state{}}.

handle_call({notice_interval, DropId}, _From,
	    State = #state{}) ->
    Result = can_notice_return(DropId, 60),
    {reply, {ok, Result}, State};
handle_call({notice_interval, DropId, Sec}, _From,
	    State = #state{}) ->
    Result = can_notice_return(DropId, Sec),
    {reply, {ok, Result}, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrop_mgr186, _,
       {__Leveldrop_mgr186, __Tracesdrop_mgr186}}
	  when __Leveldrop_mgr186 band 64 /= 0 orelse
		 __Tracesdrop_mgr186 /= [] ->
	  lager:do_log(info,
		       [{module, drop_mgr}, {function, terminate}, {line, 186},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭:~w", [Reason]), none, 4096, 64,
		       __Leveldrop_mgr186, __Tracesdrop_mgr186, lager_event,
		       __Piddrop_mgr186);
      _ -> ok
    end.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

can_notice_return(DropId, Sec) ->
    Now = date:unixtime(),
    Result = case get({notice_interval, DropId}) of
	       Ts when is_integer(Ts) ->
		   case Now - Ts >= Sec of
		     true -> put({notice_interval, DropId}, Now), true;
		     false -> false
		   end;
	       undefined -> put({notice_interval, DropId}, Now), true
	     end,
    Result.


