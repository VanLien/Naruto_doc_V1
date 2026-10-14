-file("src/mod/role/role_query.erl", 1).

-module(role_query).

-lager_records([{m_face,
		 [ver, status, update_time, file]},
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
		{link, [socket, conn_pid, ip, port, lag]},
		{name_index, [name, id, acc, pid, conn_pid]},
		{id_index, [id, name, acc, pid, conn_pid, login_err]},
		{role_online,
		 [id, pid, conn_pid, name, account, status, lev, sex,
		  realm, platform, channel, career, power, face_id,
		  face_file, face_update_time, socket, max_dun_id,
		  province_name, city_name]},
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
		{state, []}]).

-behaviour(gen_server).

-export([pid/2, pid/3, conn_pid/2, conn_pid/3, index/2,
	 index/3, cache/2, cache/3, rec/3, rec/4, attr/3, attr/4,
	 local_pid/2, local_pid/3, local_conn_pid/2,
	 local_conn_pid/3, local_index/2, local_index/3,
	 local_cache/2, local_cache/3, local_rec/3, local_rec/4,
	 local_attr/2, local_attr/3, local_attr/4, clean/1,
	 sync_cache/1, sync_index/1, kick_all_offline/0,
	 check_online/1, search_name/4]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/role/role_query.erl", 47).

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

-file("src/mod/role/role_query.erl", 48).

-file("inc/role_online.hrl", 1).

-record(role_online,
	{id = {0, 0}, pid, conn_pid, name, account, status, lev,
	 sex, realm, platform, channel, career, power, face_id,
	 face_file = <<>>, face_update_time = 0, socket,
	 max_dun_id, province_name, city_name}).

-file("src/mod/role/role_query.erl", 49).

-file("inc/role_query.hrl", 1).

-record(id_index,
	{id = {0, <<>>}, name = <<>>, acc = <<>>, pid, conn_pid,
	 login_err = 0}).

-record(name_index,
	{name = <<>>, id = {0, <<>>}, acc = <<>>, pid,
	 conn_pid}).

-file("src/mod/role/role_query.erl", 50).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/role/role_query.erl", 51).

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

-file("src/mod/role/role_query.erl", 52).

-file("inc/face.hrl", 1).

-record(m_face,
	{ver = 1, status = 0, update_time = 0, file = <<>>}).

-file("src/mod/role/role_query.erl", 53).

-spec pid(Type, Id, SrvId) -> {ok, pid()} |
			      {error, not_found} | {error, term()} when Type ::
									    by_id |
									    by_acc |
									    by_name,
									Id ::
									    non_neg_integer() |
									    bitstring(),
									SrvId ::
									    bitstring().

pid(by_id, {Id, SrvId}) -> pid(by_id, Id, SrvId).

pid(by_id, Id, SrvId) ->
    cluster_lib:call(SrvId, role_query, local_pid,
		     [by_id, Id, SrvId]);
pid(by_name, Name, SrvId) ->
    cluster_lib:call(SrvId, role_query, local_pid,
		     [by_name, Name, SrvId]).

-spec conn_pid(Type, Id, SrvId) -> {ok, pid()} |
				   {error, not_found} |
				   {error, term()} when Type :: by_id | by_acc |
								by_name,
							Id ::
							    non_neg_integer() |
							    bitstring(),
							SrvId :: bitstring().

conn_pid(by_id, {Id, SrvId}) ->
    conn_pid(by_id, Id, SrvId).

conn_pid(by_id, Id, SrvId) ->
    cluster_lib:call(SrvId, role_query, local_conn_pid,
		     [by_id, Id, SrvId]);
conn_pid(by_name, Name, SrvId) ->
    cluster_lib:call(SrvId, role_query, local_conn_pid,
		     [by_name, Name, SrvId]).

-spec index(Type, Id, SrvId) -> {ok, Rtn} |
				{error, not_found} |
				{error, term()} when Type :: by_id | by_acc |
							     by_name,
						     Id :: non_neg_integer() |
							   bitstring(),
						     SrvId :: bitstring(),
						     Rtn :: #id_index{} |
							    #name_index{}.

index(by_id, {Id, SrvId}) -> index(by_id, Id, SrvId).

index(by_id, Id, SrvId) ->
    cluster_lib:call(SrvId, role_query, local_index,
		     [by_id, Id, SrvId]);
index(by_name, Name, SrvId) ->
    cluster_lib:call(SrvId, role_query, local_index,
		     [by_name, Name, SrvId]).

-spec cache(Type, Id, SrvId) -> {ok, #role_online{}} |
				{error, not_found} |
				{error, term()} when Type :: by_id | by_acc |
							     by_name,
						     Id :: non_neg_integer() |
							   bitstring(),
						     SrvId :: bitstring().

cache(by_id, {Id, SrvId}) -> cache(by_id, Id, SrvId).

cache(by_id, Id, SrvId) ->
    cluster_lib:call(SrvId, role_query, local_cache,
		     [by_id, Id, SrvId]);
cache(by_name, Name, SrvId) ->
    cluster_lib:call(SrvId, role_query, local_cache,
		     [by_name, Name, SrvId]).

-spec rec(Type, Id, SrvId, RecName) -> {ok, tuple()} |
				       {error, not_found} |
				       {error, term()} when Type :: by_id |
								    by_acc |
								    by_name,
							    Id ::
								non_neg_integer() |
								bitstring(),
							    SrvId :: p(),
							    RecName :: atom().

rec(by_id, {Id, SrvId}, RecName) ->
    rec(by_id, Id, SrvId, RecName).

rec(by_id, Id, SrvId, RecName) ->
    cluster_lib:call(SrvId, role_query, local_rec,
		     [by_id, Id, SrvId, RecName]);
rec(by_name, Name, SrvId, RecName) ->
    cluster_lib:call(SrvId, role_query, local_rec,
		     [by_name, Name, SrvId, RecName]).

-spec attr(Type, Id, SrvId, Pos) -> {ok, [term()]} |
				    {error, not_found} |
				    {error, term()} when Type :: by_id |
								 by_acc |
								 by_name,
							 Id ::
							     non_neg_integer() |
							     bitstring(),
							 SrvId :: bitstring(),
							 Pos :: [pos_integer()].

attr(by_id, {Id, SrvId}, Pos) ->
    attr(by_id, Id, SrvId, Pos).

attr(by_id, Id, SrvId, Pos) ->
    cluster_lib:call(SrvId, role_query, local_attr,
		     [by_id, Id, SrvId, Pos]);
attr(by_name, Name, SrvId, Pos) ->
    cluster_lib:call(SrvId, role_query, local_attr,
		     [by_name, Name, SrvId, Pos]).

-spec local_pid(Type, Id, SrvId) -> {ok, pid()} |
				    {error, not_found} |
				    {error, term()} when Type :: by_id |
								 by_acc |
								 by_name,
							 Id ::
							     non_neg_integer() |
							     bitstring(),
							 SrvId :: bitstring().

local_pid(by_id, {Id, SrvId}) ->
    local_pid(by_id, Id, SrvId);
local_pid(by_id, Unknow) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_query132, _,
       {__Levelrole_query132, __Tracesrole_query132}}
	  when __Levelrole_query132 band 8 /= 0 orelse
		 __Tracesrole_query132 /= [] ->
	  lager:do_log(error,
		       [{module, role_query}, {function, local_pid},
			{line, 132}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("从本节点查询角色进程ID[未知的参数:~w]", [Unknow]), none,
		       4096, 8, __Levelrole_query132, __Tracesrole_query132,
		       lager_event, __Pidrole_query132);
      _ -> ok
    end,
    {error, not_found}.

local_pid(Type, Id, SrvId) ->
    case local_index(Type, Id, SrvId) of
      {ok, #id_index{pid = Pid}} -> {ok, Pid};
      {ok, #name_index{pid = Pid}} -> {ok, Pid};
      {error, Reason} -> {error, Reason}
    end.

-spec local_conn_pid(Type, Id, SrvId) -> {ok, pid()} |
					 {error, not_found} |
					 {error, term()} when Type :: by_id |
								      by_acc |
								      by_name,
							      Id ::
								  non_neg_integer() |
								  bitstring(),
							      SrvId ::
								  bitstring().

local_conn_pid(by_id, {Id, SrvId}) ->
    local_conn_pid(by_id, Id, SrvId).

local_conn_pid(Type, Id, SrvId) ->
    case local_index(Type, Id, SrvId) of
      {ok, #id_index{conn_pid = Pid}} -> {ok, Pid};
      {ok, #name_index{conn_pid = Pid}} -> {ok, Pid};
      {error, Reason} -> {error, Reason}
    end.

-spec local_index(Type, Id, SrvId) -> {ok, Rtn} |
				      {error, not_found} |
				      {error, term()} when Type :: by_id |
								   by_acc |
								   by_name,
							   Id ::
							       non_neg_integer() |
							       bitstring(),
							   SrvId :: bitstring(),
							   Rtn :: #id_index{} |
								  #name_index{}.

local_index(by_id, {Id, SrvId}) ->
    local_index(by_id, Id, SrvId).

local_index(by_id, Id, SrvId) ->
    case catch ets:lookup(role_id_index, {Id, SrvId}) of
      [Idx] -> {ok, Idx};
      [] -> {error, not_found};
      Err -> {error, Err}
    end;
local_index(by_name, Name, _SrvId) ->
    case catch ets:lookup(role_name_index, Name) of
      [Idx] -> {ok, Idx};
      [] -> {error, not_found};
      Err -> {error, Err}
    end.

-spec local_cache(Type, Id, SrvId) -> {ok,
				       #role_online{}} |
				      {error, not_found} |
				      {error, term()} when Type :: by_id |
								   by_acc |
								   by_name,
							   Id ::
							       non_neg_integer() |
							       bitstring(),
							   SrvId :: bitstring().

local_cache(by_id, {Id, SrvId}) ->
    local_cache(by_id, Id, SrvId).

local_cache(by_id, Id, SrvId) ->
    case catch ets:lookup(role_online, {Id, SrvId}) of
      [R] -> {ok, R};
      [] -> {error, not_found};
      Err -> {error, Err}
    end;
local_cache(by_name, Name, SrvId) ->
    case local_index(by_name, Name, SrvId) of
      {error, Reason} -> {error, Reason};
      {ok, #name_index{id = {Id, _}}} ->
	  local_cache(by_id, Id, SrvId)
    end.

-spec local_rec(Type, Id, SrvId, RecName) -> {ok,
					      tuple()} |
					     {error, not_found} |
					     {error, term()} when Type ::
								      by_id |
								      by_acc |
								      by_name,
								  Id ::
								      non_neg_integer() |
								      bitstring(),
								  SrvId ::
								      bitstring(),
								  RecName ::
								      atom().

local_rec(by_id, {Id, SrvId}, RecName) ->
    local_rec(by_id, Id, SrvId, RecName).

local_rec(by_id, Id, SrvId, RecName) ->
    case local_pid(by_id, Id, SrvId) of
      {error, Reason} -> {error, Reason};
      {ok, Pid} -> role:convert(Pid, RecName)
    end;
local_rec(by_name, Name, SrvId, RecName) ->
    case local_pid(by_name, Name, SrvId) of
      {error, Reason} -> {error, Reason};
      {ok, Pid} -> role:convert(Pid, RecName)
    end.

local_attr(Id, Pos) when is_integer(Id) ->
    local_attr(by_id, Id, game_lib:get_server_id(), Pos).

-spec local_attr(Type, Id, SrvId, Pos) -> {ok,
					   [term()]} |
					  {error, term()} when Type :: by_id |
								       by_acc |
								       by_name,
							       Id ::
								   non_neg_integer() |
								   bitstring(),
							       SrvId ::
								   bitstring(),
							       Pos ::
								   [pos_integer()].

local_attr(by_id, {Id, SrvId}, Pos) ->
    local_attr(by_id, Id, SrvId, Pos).

local_attr(by_id, Id, SrvId, Pos) ->
    case local_pid(by_id, Id, SrvId) of
      {error, Reason} -> {error, Reason};
      {ok, Pid} -> role:element(Pid, Pos)
    end;
local_attr(by_name, Name, SrvId, Pos) ->
    case local_pid(by_name, Name, SrvId) of
      {error, Reason} -> {error, Reason};
      {ok, Pid} -> role:element(Pid, Pos)
    end.

-spec sync_cache(#role{}) -> ok.

sync_cache(Role = #role{pid = RolePid, id = Id,
			account = Account, name = RoleName, lev = Lev,
			sex = Sex,
			link = #link{conn_pid = ConnPid, socket = Socket},
			platform = Platform, channel = Channel, career = Career,
			face_id = FaceId, power = Power,
			m_dungeon = #m_dungeon{max_dun_id = MaxDunId}}) ->
    {ProvinceName, CityName} =
	role_misc:get_city_name(Role),
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    ets:insert(role_online,
	       #role_online{id = Id, pid = RolePid, conn_pid = ConnPid,
			    name = RoleName, account = Account, lev = Lev,
			    sex = Sex, platform = Platform, channel = Channel,
			    career = Career, socket = Socket, face_id = FaceId,
			    face_file = FaceFile,
			    face_update_time = FaceUpdateTime, power = Power,
			    max_dun_id = MaxDunId, province_name = ProvinceName,
			    city_name = CityName});
sync_cache(_Role) -> ok.

-spec sync_index(#role{}) -> ok.

sync_index(#role{id = {Rid, SrvId}, pid = Pid,
		 name = Name, account = Acc,
		 link = #link{conn_pid = ConnPid}}) ->
    ets:insert(role_id_index,
	       #id_index{id = {Rid, SrvId}, acc = Acc, name = Name,
			 pid = Pid, conn_pid = ConnPid}),
    ets:insert(role_name_index,
	       #name_index{name = Name, id = {Rid, SrvId}, pid = Pid,
			   conn_pid = ConnPid}),
    ok.

-spec clean(#role{}) -> ok.

clean(#role{id = Id, name = Name}) ->
    ets:delete(role_online, Id),
    ets:delete(role_id_index, Id),
    ets:delete(role_name_index, Name),
    ok.

-spec kick_all_offline() -> ok.

kick_all_offline() ->
    Fun = fun (#id_index{pid = Pid}, _) ->
		  case is_pid(Pid) of
		    true -> catch role:stop(sync, Pid, <<>>);
		    false -> ignore
		  end
	  end,
    ets:foldl(Fun, 0, role_id_index).

-spec check_online(Ids :: [{integer(),
			    binary()}]) -> {ok, [#role_online{}]}.

check_online([]) -> {ok, []};
check_online(Ids) when is_list(Ids) ->
    Limit = 8,
    case length(Ids) =< Limit of
      true -> check_online(Ids, []);
      _ ->
	  {NewIds, _RestIds} = lists:split(Limit, Ids),
	  check_online(NewIds, [])
    end;
check_online(_Ids) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_query308, _,
       {__Levelrole_query308, __Tracesrole_query308}}
	  when __Levelrole_query308 band 128 /= 0 orelse
		 __Tracesrole_query308 /= [] ->
	  lager:do_log(debug,
		       [{module, role_query}, {function, check_online},
			{line, 308}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("非法参数:~w", [_Ids]), none, 4096, 128,
		       __Levelrole_query308, __Tracesrole_query308,
		       lager_event, __Pidrole_query308);
      _ -> ok
    end,
    {ok, []}.

check_online([], Rtn) -> {ok, Rtn};
check_online([{Id, SrvId} | Rest], Rtn) ->
    NewRtn = case cache(by_id, Id, SrvId) of
	       {ok, Online = #role_online{}} -> [Online | Rtn];
	       {error, not_found} -> Rtn;
	       Err ->
		   case {whereis(lager_event), whereis(lager_event),
			 lager_config:get({lager_event, loglevel}, {0, []})}
		       of
		     {undefined, undefined, _} ->
			 fun () -> {error, lager_not_running} end();
		     {undefined, _, _} ->
			 fun () -> {error, {sink_not_configured, lager_event}}
			 end();
		     {__Pidrole_query320, _,
		      {__Levelrole_query320, __Tracesrole_query320}}
			 when __Levelrole_query320 band 8 /= 0 orelse
				__Tracesrole_query320 /= [] ->
			 lager:do_log(error,
				      [{module, role_query},
				       {function, check_online}, {line, 320},
				       {pid, pid_to_list(self())},
				       {node, node()}
				       | lager:md()],
				      io_lib:format("查询角色[Rid:~w]在线数据错误:~w",
						    [{Id, SrvId}, Err]),
				      none, 4096, 8, __Levelrole_query320,
				      __Tracesrole_query320, lager_event,
				      __Pidrole_query320);
		     _ -> ok
		   end,
		   Rtn
	     end,
    check_online(Rest, NewRtn);
check_online([_Unknow | Rest], Rtn) ->
    check_online(Rest, Rtn).

-spec search_name(string(), pos_integer(),
		  non_neg_integer(),
		  non_neg_integer()) -> [#role_online{}].

search_name(Str, Num, MinLev, MaxLev) ->
    do_search_name(ets:tab2list(role_online),
		   util:to_list(Str), Num, MinLev, MaxLev, []).

do_search_name([], _Str, _Num, _MinLev, _MaxLev, L) ->
    L;
do_search_name(_, _Str, 0, _MinLev, _MaxLev, L) -> L;
do_search_name([R = #role_online{name = Name, lev = Lev}
		| T],
	       Str, Num, MinLev, MaxLev, L)
    when Lev >= MinLev andalso Lev =< MaxLev ->
    case string:str(binary_to_list(Name), Str) of
      0 -> do_search_name(T, Str, Num, MinLev, MaxLev, L);
      _ ->
	  do_search_name(T, Str, Num - 1, MinLev, MaxLev, [R | L])
    end;
do_search_name([_ | T], Str, Num, MinLev, MaxLev, L) ->
    do_search_name(T, Str, Num, MinLev, MaxLev, L).

info(Info) -> role_query ! Info.

cast(Info) -> gen_server:cast(role_query, Info).

call(Info) ->
    case catch gen_server:call(role_query, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_query351, _,
	     {__Levelrole_query351, __Tracesrole_query351}}
		when __Levelrole_query351 band 8 /= 0 orelse
		       __Tracesrole_query351 /= [] ->
		lager:do_log(error,
			     [{module, role_query}, {function, call},
			      {line, 351}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [role_query, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelrole_query351,
			     __Tracesrole_query351, lager_event,
			     __Pidrole_query351);
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
    gen_server:start_link({local, role_query}, role_query,
			  [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_query357, _,
       {__Levelrole_query357, __Tracesrole_query357}}
	  when __Levelrole_query357 band 64 /= 0 orelse
		 __Tracesrole_query357 /= [] ->
	  lager:do_log(info,
		       [{module, role_query}, {function, init}, {line, 357},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [role_query]), none, 4096,
		       64, __Levelrole_query357, __Tracesrole_query357,
		       lager_event, __Pidrole_query357);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(role_online,
	    [set, named_table, public, {keypos, #role_online.id}]),
    ets:new(role_id_index,
	    [set, public, named_table, {keypos, #id_index.id}]),
    ets:new(role_name_index,
	    [set, public, named_table, {keypos, #name_index.name}]),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_query365, _,
       {__Levelrole_query365, __Tracesrole_query365}}
	  when __Levelrole_query365 band 64 /= 0 orelse
		 __Tracesrole_query365 /= [] ->
	  lager:do_log(info,
		       [{module, role_query}, {function, init}, {line, 365},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [role_query]), none, 4096,
		       64, __Levelrole_query365, __Tracesrole_query365,
		       lager_event, __Pidrole_query365);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

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
      {__Pidrole_query378, _,
       {__Levelrole_query378, __Tracesrole_query378}}
	  when __Levelrole_query378 band 64 /= 0 orelse
		 __Tracesrole_query378 /= [] ->
	  lager:do_log(info,
		       [{module, role_query}, {function, terminate},
			{line, 378}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始关闭", []), none, 4096, 64,
		       __Levelrole_query378, __Tracesrole_query378,
		       lager_event, __Pidrole_query378);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_query379, _,
       {__Levelrole_query379, __Tracesrole_query379}}
	  when __Levelrole_query379 band 64 /= 0 orelse
		 __Tracesrole_query379 /= [] ->
	  lager:do_log(info,
		       [{module, role_query}, {function, terminate},
			{line, 379}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭完成", []), none, 4096, 64,
		       __Levelrole_query379, __Tracesrole_query379,
		       lager_event, __Pidrole_query379);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


