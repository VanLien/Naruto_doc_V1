-file("src/mod/home/home_mgr.erl", 1).

-module(home_mgr).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{cluster_dynamic_local_group, [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
		{home_unit_data,
		 [bid, name, type, dir, set_id, soft, tile_list_1,
		  tile_list_2, effect_count]},
		{home_role_rank, [id, rank]},
		{home_rank_rc,
		 [id, name, lev, face, avatar_bid, time, cache_time,
		  worship_num, visit_num, soft, score, rank,
		  face_update_time, face_file]},
		{home_unit_set, [set_id, reward, collect]},
		{home_rand_visit,
		 [id, name, lev, sex, face, power, last_login, soft,
		  face_update_time, face_file]},
		{home_log,
		 [id, name, face, lev, is_friend, type, time, int_args,
		  str_args, face_update_time, face_file]},
		{home_visitor, [id, name, look_id, time, is_leave]},
		{home_unit, [ver, bid, index, dir]},
		{home_ext, [id, visitors, log]},
		{home_floor,
		 [floor, wall_bid, land_bid, soft, home_unit]},
		{home,
		 [ver, id, name, look_id, bid, wall_bid, land_bid, soft,
		  home_unit, floor_list, log, open_floor, main_floor]},
		{m_home,
		 [ver, num, buy_num, list, day_visitors, soft, max_soft,
		  look_id, look_list, last_visitors, worship,
		  worship_list, rand_list, last_rand_time, set_list,
		  last_hook_time, acc_hook_time, acc_hook_items,
		  open_floor, floor_list, main_floor, max_sum_soft]},
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
		{state, [next_rank]}]).

-behaviour(gen_server).

-export([update_ets/2, roleid_rank/1]).

-export([apply/1, sync_role/3, sync_rand_visit/1,
	 check_put_furniture/7, tab/1, info/1, cast/1, call/1,
	 start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {next_rank = 1}).

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

-file("src/mod/home/home_mgr.erl", 13).

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

-file("src/mod/home/home_mgr.erl", 14).

-file("inc/home.hrl", 1).

-record(m_home,
	{ver = 3, num = 0, buy_num = 0, list = [],
	 day_visitors = [], soft = 0, max_soft = 0, look_id = 0,
	 look_list = [], last_visitors = {0, <<>>}, worship = 0,
	 worship_list = [], rand_list = [], last_rand_time = 0,
	 set_list = [], last_hook_time = 0, acc_hook_time = 0,
	 acc_hook_items = [], open_floor = [], floor_list = [],
	 main_floor = 0, max_sum_soft = 0}).

-record(home,
	{ver = 2, id = {0, <<>>}, name = <<>>, look_id = 0,
	 bid = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = [], floor_list = [], log = [],
	 open_floor = [1], main_floor = 1}).

-record(home_floor,
	{floor = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = []}).

-record(home_ext,
	{id = {0, <<>>}, visitors = [], log = []}).

-record(home_unit,
	{ver = 1, bid = 0  :: non_neg_integer(),
	 index = 0  :: non_neg_integer(), dir = 1  :: 1..2}).

-record(home_visitor,
	{id = {0, <<>>}, name = <<>>, look_id = 0, time = 0,
	 is_leave = 0}).

-record(home_log,
	{id = {0, <<>>}, name = <<>>, face = 0, lev = 0,
	 is_friend = 0, type = 0, time = 0, int_args = [],
	 str_args = [], face_update_time = 0, face_file = <<>>}).

-record(home_rand_visit,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, power = 0, last_login = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(home_unit_set,
	{set_id = 0, reward = [], collect = []}).

-record(home_rank_rc,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, cache_time = 0,
	 worship_num = 0, visit_num = 0, soft = 0, score = 0,
	 rank = 0, face_update_time = 0, face_file = <<>>}).

-record(home_role_rank, {id = {0, <<>>}, rank = 0}).

-record(home_unit_data,
	{bid = 0, name = <<>>, type = 0, dir = 1, set_id = 0,
	 soft = 0, tile_list_1 = [], tile_list_2 = [],
	 effect_count = 1}).

-file("src/mod/home/home_mgr.erl", 15).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/mod/home/home_mgr.erl", 16).

-file("inc/var.hrl", 1).

-record(m_var,
	{ver = -1, last_reset_time = 0  :: non_neg_integer(),
	 last_reset_day = {0, 0, 0}  ::
	     {non_neg_integer(), non_neg_integer(),
	      non_neg_integer()},
	 last_reset_five = 0  :: non_neg_integer(),
	 last_reset_week = {0, 0}  ::
	     {non_neg_integer(), non_neg_integer()},
	 last_acc_time = 0  :: non_neg_integer(),
	 acc_time = 0  :: non_neg_integer(),
	 login_charge_count = 0  :: non_neg_integer(),
	 acc_charge_count = 0  :: non_neg_integer(),
	 login_charge_num = 0  :: non_neg_integer(),
	 day_login = 0  :: non_neg_integer(),
	 acc_login_count = 0  :: non_neg_integer(),
	 total_acc_time = 0  :: non_neg_integer(),
	 acc_days = 1  :: non_neg_integer(),
	 best_days = 1  :: non_neg_integer(),
	 now_days = 1  :: non_neg_integer(),
	 month_days = 1  :: non_neg_integer(),
	 day_vars = []  :: [tuple()],
	 five_vars = []  :: [tuple()],
	 week_vars = []  :: [tuple()],
	 month_vars = []  :: [tuple()],
	 timeout_vars = []  :: [tuple()],
	 acc_vars = []  :: [tuple()],
	 other_vars = []  :: [tuple()],
	 week_five_vars = []  :: [tuple()],
	 week_five_time = 0  :: non_neg_integer()}).

-record(role_var,
	{id = {0, "", 0}  :: tuple(), vars = []  :: [tuple()]}).

-file("src/mod/home/home_mgr.erl", 17).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/home/home_mgr.erl", 18).

sync_role(Role = #role{id = RoleId}, Ext, Flag) ->
    case ets:member(tab(RoleId), RoleId) of
      true -> sync_role_(Role, Ext, Flag);
      _ -> skip
    end,
    ok.

sync_role_(#role{id = RoleId}, Name, name) ->
    L = [{#home.name, Name}],
    ets:update_element(tab(RoleId), RoleId, L);
sync_role_(#role{id = RoleId}, MainFloor, main_floor) ->
    L = [{#home.main_floor, MainFloor}],
    ets:update_element(tab(RoleId), RoleId, L);
sync_role_(#role{id = RoleId,
		 m_home = #m_home{look_id = LookId}},
	   _Ext, _Flag) ->
    L = [{#home.look_id, LookId}],
    ets:update_element(tab(RoleId), RoleId, L).

sync_rand_visit(RandVisit) ->
    d_ets_lib:save_d_ets(home_rand_visit_bak, RandVisit),
    cluster_dynamic_group:cast_main(1, d_ets_lib,
				    save_d_ets, [home_rand_visit, RandVisit]),
    ok.

update_ets(Home = #home{id = RoleId}, all) ->
    d_ets_lib:save_d_ets(tab(RoleId), Home);
update_ets(Home = #home{id = RoleId}, _) ->
    d_ets_lib:save_ets(tab(RoleId), Home);
update_ets(HomeExt = #home_ext{}, all) ->
    d_ets_lib:save_d_ets(home_ext, HomeExt);
update_ets(HomeExt = #home_ext{}, _) ->
    d_ets_lib:save_ets(home_ext, HomeExt).

tab({Rid, _}) -> tab(Rid);
tab(1) -> home_1;
tab(2) -> home_2;
tab(3) -> home_3;
tab(4) -> home_4;
tab(5) -> home_5;
tab(N) when is_integer(N) andalso N > 0 ->
    tab(N rem 5 + 1);
tab(_) -> home_1.

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> home_mgr ! Info.

cast(Info) -> gen_server:cast(home_mgr, Info).

call(Info) ->
    case catch gen_server:call(home_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhome_mgr74, _,
	     {__Levelhome_mgr74, __Traceshome_mgr74}}
		when __Levelhome_mgr74 band 8 /= 0 orelse
		       __Traceshome_mgr74 /= [] ->
		lager:do_log(error,
			     [{module, home_mgr}, {function, call}, {line, 74},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [home_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelhome_mgr74,
			     __Traceshome_mgr74, lager_event, __Pidhome_mgr74);
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
    gen_server:start_link({local, home_mgr}, home_mgr, [],
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
      {__Pidhome_mgr80, _,
       {__Levelhome_mgr80, __Traceshome_mgr80}}
	  when __Levelhome_mgr80 band 64 /= 0 orelse
		 __Traceshome_mgr80 /= [] ->
	  lager:do_log(info,
		       [{module, home_mgr}, {function, init}, {line, 80},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [home_mgr]), none, 4096,
		       64, __Levelhome_mgr80, __Traceshome_mgr80, lager_event,
		       __Pidhome_mgr80);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(home_1, "dets/home_1.dets",
			#home.id, set),
    d_ets_lib:new_d_ets(home_2, "dets/home_2.dets",
			#home.id, set),
    d_ets_lib:new_d_ets(home_3, "dets/home_3.dets",
			#home.id, set),
    d_ets_lib:new_d_ets(home_4, "dets/home_4.dets",
			#home.id, set),
    d_ets_lib:new_d_ets(home_5, "dets/home_5.dets",
			#home.id, set),
    d_ets_lib:new_ets(home_tile_l_wall, 1, set),
    d_ets_lib:new_ets(home_tile_r_wall, 1, set),
    d_ets_lib:new_ets(home_tile_land, 1, set),
    d_ets_lib:new_d_ets(home_rand_visit,
			"dets/home_rand_visit.dets", #home_rand_visit.id, set),
    d_ets_lib:load_dets_to_ets(home_rand_visit,
			       fun (D) -> rand_visit_ver(D) end),
    d_ets_lib:new_d_ets(home_rand_visit_bak,
			"dets/home_rand_visit_bak.dets", #home_rand_visit.id,
			set),
    d_ets_lib:load_dets_to_ets(home_rand_visit_bak,
			       fun (D) -> rand_visit_ver(D) end),
    d_ets_lib:new_d_ets(home_rank, "dets/home_rank.dets",
			#home_rank_rc.rank, set),
    d_ets_lib:load_dets_to_ets(home_rank,
			       fun (D) -> do_rank_ver(D) end),
    util:set_timer(update_rank_timer, util:rand(300, 540),
		   update_save),
    ets:new(home_role_rank,
	    [set, named_table, public,
	     {keypos, #home_role_rank.id}]),
    ets:new(home_rank_update,
	    [set, named_table, public, {keypos, 1}]),
    Fun = fun (#home_rank_rc{id = RoleId, rank = Rank},
	       Rank1) ->
		  case Rank > 0 of
		    true ->
			ets:insert(home_role_rank,
				   #home_role_rank{rank = Rank, id = RoleId});
		    _ -> skip
		  end,
		  max(Rank, Rank1)
	  end,
    NextRank = ets:foldl(Fun, 0, home_rank) + 1,
    d_ets_lib:new_d_ets(home_ext, "dets/home_ext.dets",
			#home_ext.id, set),
    home_table:init(),
    State = #state{next_rank = NextRank},
    util:set_timer(clear_timer,
		   date:week_next_diff([1], {0, 0, 0}), clear_rank),
    init_merge(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhome_mgr124, _,
       {__Levelhome_mgr124, __Traceshome_mgr124}}
	  when __Levelhome_mgr124 band 64 /= 0 orelse
		 __Traceshome_mgr124 /= [] ->
	  lager:do_log(info,
		       [{module, home_mgr}, {function, init}, {line, 124},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [home_mgr]), none, 4096, 64,
		       __Levelhome_mgr124, __Traceshome_mgr124, lager_event,
		       __Pidhome_mgr124);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhome_mgr132, _,
	     {__Levelhome_mgr132, __Traceshome_mgr132}}
		when __Levelhome_mgr132 band 8 /= 0 orelse
		       __Traceshome_mgr132 /= [] ->
		lager:do_log(error,
			     [{module, home_mgr}, {function, handle_call},
			      {line, 132}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelhome_mgr132,
			     __Traceshome_mgr132, lager_event,
			     __Pidhome_mgr132);
	    _ -> ok
	  end,
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhome_mgr144, _,
	     {__Levelhome_mgr144, __Traceshome_mgr144}}
		when __Levelhome_mgr144 band 8 /= 0 orelse
		       __Traceshome_mgr144 /= [] ->
		lager:do_log(error,
			     [{module, home_mgr}, {function, handle_info},
			      {line, 144}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelhome_mgr144,
			     __Traceshome_mgr144, lager_event,
			     __Pidhome_mgr144);
	    _ -> ok
	  end,
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    d_ets_lib:save(home_1),
    d_ets_lib:save(home_2),
    d_ets_lib:save(home_3),
    d_ets_lib:save(home_4),
    d_ets_lib:save(home_5),
    d_ets_lib:save(home_ext),
    d_ets_lib:save(home_rand_visit),
    d_ets_lib:save(home_rand_visit_bak),
    d_ets_lib:save(home_rank),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhome_mgr158, _,
       {__Levelhome_mgr158, __Traceshome_mgr158}}
	  when __Levelhome_mgr158 band 64 /= 0 orelse
		 __Traceshome_mgr158 /= [] ->
	  lager:do_log(info,
		       [{module, home_mgr}, {function, terminate}, {line, 158},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelhome_mgr158,
		       __Traceshome_mgr158, lager_event, __Pidhome_mgr158);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhome_mgr170, _,
	     {__Levelhome_mgr170, __Traceshome_mgr170}}
		when __Levelhome_mgr170 band 8 /= 0 orelse
		       __Traceshome_mgr170 /= [] ->
		lager:do_log(error,
			     [{module, home_mgr}, {function, do_handle_call},
			      {line, 170}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelhome_mgr170,
			     __Traceshome_mgr170, lager_event,
			     __Pidhome_mgr170);
	    _ -> ok
	  end,
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(get_rand_visit, _From, State) ->
    TabName = case sys_env:get(home_merge_status, false) of
		true -> home_rand_visit_bak;
		_ -> home_rand_visit
	      end,
    NewMatchList = case util:get(TabName, '$end_of_table')
		       of
		     Continuation when is_tuple(Continuation) ->
			 case ets:match(Continuation) of
			   {MatchList, NewContinuation} ->
			       NewMatchListT = [Match || [Match] <- MatchList],
			       put(TabName, NewContinuation),
			       NewMatchListT;
			   _ ->
			       case ets:match(TabName, '$1', 10) of
				 {MatchList, NewContinuation} ->
				     NewMatchListT = [Match
						      || [Match] <- MatchList],
				     put(TabName, NewContinuation),
				     NewMatchListT;
				 _ -> put(TabName, '$end_of_table'), []
			       end
			 end;
		     _ ->
			 case ets:match(TabName, '$1', 10) of
			   {MatchList, NewContinuation} ->
			       NewMatchListT = [Match || [Match] <- MatchList],
			       put(TabName, NewContinuation),
			       NewMatchListT;
			   _ -> put(TabName, '$end_of_table'), []
			 end
		   end,
    {reply, {ok, NewMatchList}, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhome_mgr222, _,
	     {__Levelhome_mgr222, __Traceshome_mgr222}}
		when __Levelhome_mgr222 band 8 /= 0 orelse
		       __Traceshome_mgr222 /= [] ->
		lager:do_log(error,
			     [{module, home_mgr}, {function, do_handle_info},
			      {line, 222}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelhome_mgr222,
			     __Traceshome_mgr222, lager_event,
			     __Pidhome_mgr222);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
do_handle_info({visit, TarRoleId, IsFriend, Face,
		FaceFile, FaceUpdateTime, Lev,
		HomeVisitor = #home_visitor{id = VRoleId, name = VName},
		MySoft},
	       State) ->
    case home_lib:lookup_ext(TarRoleId) of
      {ok,
       HomeExt = #home_ext{visitors = Visitors, log = Logs}} ->
	  Visitors1 = lists:keydelete(VRoleId, #home_visitor.id,
				      Visitors),
	  NewVisitors = lists:sublist([HomeVisitor | Visitors1],
				      home_data:get_const(visitors_num_limit)),
	  Log = #home_log{type = 1, id = VRoleId, name = VName,
			  face = Face, face_update_time = FaceUpdateTime,
			  face_file = FaceFile, lev = Lev,
			  time = date:unixtime(), is_friend = IsFriend,
			  int_args = [{1, MySoft}]},
	  NewLogs = lists:sublist([Log | Logs], 20),
	  NewHomeExt = HomeExt#home_ext{visitors = NewVisitors,
					log = NewLogs},
	  home_mgr:update_ets(NewHomeExt, ets),
	  var:acc_role_var(TarRoleId, other, 12, 0),
	  {noreply, State};
      _ -> {noreply, State}
    end;
do_handle_info({del_visit, TarRoleId, LeaveRoleId},
	       State) ->
    case home_lib:lookup_ext(TarRoleId) of
      {ok, HomeExt = #home_ext{visitors = Visitors}} ->
	  NewVisitors = lists:keydelete(LeaveRoleId,
					#home_visitor.id, Visitors),
	  NewHomeExt = HomeExt#home_ext{visitors = NewVisitors},
	  home_mgr:update_ets(NewHomeExt, ets),
	  {noreply, State};
      _ -> {noreply, State}
    end;
do_handle_info(update_save, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhome_mgr255, _,
       {__Levelhome_mgr255, __Traceshome_mgr255}}
	  when __Levelhome_mgr255 band 128 /= 0 orelse
		 __Traceshome_mgr255 /= [] ->
	  lager:do_log(debug,
		       [{module, home_mgr}, {function, do_handle_info},
			{line, 255}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("家园数据保存:~w",
				     [ets:info(home_rank_update, size)]),
		       none, 4096, 128, __Levelhome_mgr255,
		       __Traceshome_mgr255, lager_event, __Pidhome_mgr255);
      _ -> ok
    end,
    catch do_save_update(ets:tab2list(home_rank_update)),
    ets:delete_all_objects(home_rank_update),
    util:set_timer(update_rank_timer, util:rand(300, 540),
		   update_save),
    {noreply, State};
do_handle_info(clear_data, State) ->
    erase(home_rand_visit),
    erase(home_rand_visit_bak),
    sys_env:save(home_merge_status, false),
    d_ets_lib:clear_d_ets(home_rand_visit),
    {noreply, State};
do_handle_info(re_sync_rand_to_main_zone, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhome_mgr270, _,
       {__Levelhome_mgr270, __Traceshome_mgr270}}
	  when __Levelhome_mgr270 band 64 /= 0 orelse
		 __Traceshome_mgr270 /= [] ->
	  lager:do_log(info,
		       [{module, home_mgr}, {function, do_handle_info},
			{line, 270}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始同步随机访问数据到主服", none, 4096, 64, __Levelhome_mgr270,
		       __Traceshome_mgr270, lager_event, __Pidhome_mgr270);
      _ -> ok
    end,
    L = ets:tab2list(home_rand_visit_bak),
    put(home_rand_visit_to_main_zone, L),
    erlang:send_after(util:rand(1, 180), self(),
		      sync_rand_to_main_zone),
    {noreply, State};
do_handle_info(sync_rand_to_main_zone, State) ->
    case get(home_rand_visit_to_main_zone) of
      [RandVisit = #home_rand_visit{} | L] ->
	  cluster_dynamic_group:cast_main(1, d_ets_lib,
					  save_d_ets,
					  [home_rand_visit, RandVisit]),
	  put(home_rand_visit_to_main_zone, L),
	  erlang:send_after(util:rand(100, 280), self(),
			    sync_rand_to_main_zone);
      _ -> ok
    end,
    {noreply, State};
do_handle_info({update_rank, RoleId, Flag},
	       State = #state{next_rank = NextRank}) ->
    NewNextRank = update_rank(RoleId, Flag, NextRank),
    {noreply, State#state{next_rank = NewNextRank}};
do_handle_info(clear_rank, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhome_mgr295, _,
       {__Levelhome_mgr295, __Traceshome_mgr295}}
	  when __Levelhome_mgr295 band 64 /= 0 orelse
		 __Traceshome_mgr295 /= [] ->
	  lager:do_log(info,
		       [{module, home_mgr}, {function, do_handle_info},
			{line, 295}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "家园排行清除", none, 4096, 64, __Levelhome_mgr295,
		       __Traceshome_mgr295, lager_event, __Pidhome_mgr295);
      _ -> ok
    end,
    List = home:get_rank_list(1, 200, []),
    d_ets_lib:clear_d_ets(home_rank),
    ets:delete_all_objects(home_role_rank),
    ets:delete_all_objects(home_rank_update),
    log_rank:save(#rank{type = 46, list = List}),
    util:set_timer(clear_timer,
		   date:week_next_diff([1], {0, 0, 0}), clear_rank),
    {noreply, State#state{next_rank = 1}};
do_handle_info(_Info, State) -> {noreply, State}.

-spec check_put_furniture(tuple(), bitstring(),
			  pos_integer(), pos_integer(), pos_integer(), list(),
			  pos_integer()) -> ok | {false, bitstring()}.

check_put_furniture(RoleId, RoleName, WallBid, LandBid,
		    NewSoft, List, 1) ->
    case check_type(WallBid, LandBid) of
      {false, Msg} -> {false, Msg};
      _ ->
	  case home_lib:lookup(RoleId) of
	    {ok, Home} ->
		case check_tile(List, #{}, #{}, 0) of
		  true ->
		      NewHomeUnit = [#home_unit{bid = Bid, index = Index,
						dir = Dir}
				     || {Bid, Index, Dir} <- List],
		      NewHome = Home#home{wall_bid = WallBid,
					  land_bid = LandBid, soft = NewSoft,
					  home_unit = NewHomeUnit,
					  bid = RoleName},
		      home_mgr:update_ets(NewHome, all),
		      ok;
		  {false, Msg} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"家园不存在"/utf8>>)}
	  end
    end;
check_put_furniture(RoleId, RoleName, WallBid, LandBid,
		    NewSoft, List, Floor) ->
    case check_type(WallBid, LandBid) of
      {false, Msg} -> {false, Msg};
      _ ->
	  case home_lib:lookup(RoleId) of
	    {ok, Home = #home{floor_list = FloorList}} ->
		case check_tile(List, #{}, #{}, 0) of
		  true ->
		      case lists:keyfind(Floor, #home_floor.floor, FloorList)
			  of
			#home_floor{} ->
			    NewHomeUnit = [#home_unit{bid = Bid, index = Index,
						      dir = Dir}
					   || {Bid, Index, Dir} <- List],
			    NewHomeFloor = #home_floor{floor = Floor,
						       wall_bid = WallBid,
						       land_bid = LandBid,
						       soft = NewSoft,
						       home_unit = NewHomeUnit},
			    NewFloorList = lists:keystore(Floor,
							  #home_floor.floor,
							  FloorList,
							  NewHomeFloor),
			    NewHome = Home#home{bid = RoleName,
						floor_list = NewFloorList},
			    home_mgr:update_ets(NewHome, all),
			    ok;
			_ -> {false, lang:get(<<"该楼层尚未开通"/utf8>>)}
		      end;
		  {false, Msg} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"家园不存在"/utf8>>)}
	  end
    end.

check_type(WallBid, LandBid) ->
    WallType = home_data:get_type(WallBid),
    LandType = home_data:get_type(LandBid),
    if WallType =/= 4 ->
	   {false, lang:get(<<"该家具不是墙壁"/utf8>>)};
       LandType =/= 3 -> {false, lang:get(<<"该家具不是地板"/utf8>>)};
       true -> true
    end.

check_tile([], _LockMap, _LockMap2, LockTile) ->
    LimitTile =
	home_data:get_const(floor_effective_area_limit),
    if LockTile > LimitTile ->
	   {false, lang:get(<<"家具占用格子过多"/utf8>>)};
       true -> true
    end;
check_tile([{Bid, Index, Dir} | Other], LockMap,
	   LockMap2, LockTile) ->
    case home_data:get(Bid) of
      #home_unit_data{type = 1, tile_list_1 = TileList1,
		      tile_list_2 = TileList2} ->
	  TileList = util:if_true(Dir == 1, TileList1, TileList2),
	  case home_table:lock_tile(20, Index, TileList, LockMap)
	      of
	    NewLockMap when is_map(NewLockMap) ->
		AddTile = length(TileList),
		NewLockTile = LockTile + AddTile,
		check_tile(Other, NewLockMap, LockMap2, NewLockTile);
	    _ -> {false, lang:get(<<"该位置已被占用"/utf8>>)}
	  end;
      #home_unit_data{type = 2, tile_list_1 = TileList1,
		      tile_list_2 = TileList2} ->
	  TileType = util:if_true(Dir == 1, 21, 22),
	  TileList = util:if_true(Dir == 1, TileList1, TileList2),
	  case home_table:lock_tile(TileType, Index, TileList,
				    LockMap)
	      of
	    NewLockMap when is_map(NewLockMap) ->
		check_tile(Other, NewLockMap, LockMap2, LockTile);
	    _ -> {false, lang:get(<<"该位置已被占用"/utf8>>)}
	  end;
      #home_unit_data{type = 5, tile_list_1 = TileList1,
		      tile_list_2 = TileList2} ->
	  TileList = util:if_true(Dir == 1, TileList1, TileList2),
	  case home_table:lock_tile(20, Index, TileList, LockMap2)
	      of
	    NewLockMap when is_map(NewLockMap) ->
		check_tile(Other, LockMap, NewLockMap, LockTile);
	    _ -> {false, lang:get(<<"该位置已被占用"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"该物品不是家具"/utf8>>)}
    end.

update_rank(RoleId, Flag, NextRank) ->
    Now = date:unixtime(),
    case roleid_rank(RoleId) of
      Rc = #home_rank_rc{worship_num = WorshipNum,
			 visit_num = VisitNum} ->
	  {NewWorshipNum, NewVisitNum, NewScore} =
	      calc_score(WorshipNum, VisitNum, Flag),
	  NewRc = Rc#home_rank_rc{worship_num = NewWorshipNum,
				  visit_num = NewVisitNum, score = NewScore,
				  time = Now},
	  do_update_rank(NewRc),
	  NextRank;
      false ->
	  case role_robot:get_role(RoleId) of
	    {ok,
	     #role_robot{face_id = FaceId,
			 face_update_time = FaceTime, face_file = FaceFile,
			 lev = Lev, name = Name, avatar_bid = AvatarBid,
			 is_open_home = 1, soft = Soft}} ->
		{NewWorshipNum, NewVisitNum, NewScore} = calc_score(0,
								    0, Flag),
		NewRc = #home_rank_rc{rank = NextRank, id = RoleId,
				      worship_num = NewWorshipNum,
				      visit_num = NewVisitNum, score = NewScore,
				      face = FaceId,
				      face_update_time = FaceTime,
				      face_file = FaceFile, lev = Lev,
				      name = Name, avatar_bid = AvatarBid,
				      soft = Soft, time = Now},
		do_update_rank(NewRc),
		NextRank + 1;
	    _ -> NextRank
	  end
    end.

do_update_rank(#home_rank_rc{name = Name, rank = Rank})
    when Rank =< 0 ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhome_mgr428, _,
       {__Levelhome_mgr428, __Traceshome_mgr428}}
	  when __Levelhome_mgr428 band 8 /= 0 orelse
		 __Traceshome_mgr428 /= [] ->
	  lager:do_log(error,
		       [{module, home_mgr}, {function, do_update_rank},
			{line, 428}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts的家园排行居然突破了0 ~w", [Name, Rank]), none,
		       4096, 8, __Levelhome_mgr428, __Traceshome_mgr428,
		       lager_event, __Pidhome_mgr428);
      _ -> ok
    end,
    skip;
do_update_rank(HomeRankRc = #home_rank_rc{rank = 1,
					  id = RoleId}) ->
    ets:insert(home_rank, HomeRankRc),
    ets:insert(home_role_rank,
	       #home_role_rank{id = RoleId, rank = 1}),
    ets:insert(home_rank_update, {1}),
    ok;
do_update_rank(HomeRankRc = #home_rank_rc{rank = Rank,
					  id = RoleId, score = Score}) ->
    case ets:lookup(home_rank, Rank - 1) of
      [OldRc = #home_rank_rc{id = RoleId2, score = Score2}]
	  when Score > Score2 ->
	  ets:insert(home_rank, OldRc#home_rank_rc{rank = Rank}),
	  ets:update_element(home_role_rank, RoleId2,
			     {#home_role_rank.rank, Rank}),
	  ets:insert(home_rank_update, {Rank}),
	  do_update_rank(HomeRankRc#home_rank_rc{rank =
						     Rank - 1});
      _ ->
	  ets:insert(home_rank, HomeRankRc),
	  ets:insert(home_role_rank,
		     #home_role_rank{id = RoleId, rank = Rank}),
	  ets:insert(home_rank_update, {Rank}),
	  ok
    end.

calc_score(WorshipNum, VisitNum, worship) ->
    {WorshipRate, VisitRate} =
	home_data:get_const(popularity_formula),
    NewScore = (WorshipNum + 1) * WorshipRate +
		 VisitNum * VisitRate,
    NewWorshipNum = WorshipNum + 1,
    {NewWorshipNum, VisitNum, NewScore};
calc_score(WorshipNum, VisitNum, _) ->
    {WorshipRate, VisitRate} =
	home_data:get_const(popularity_formula),
    NewScore = WorshipNum * WorshipRate +
		 (VisitNum + 1) * VisitRate,
    NewVisitNum = VisitNum + 1,
    {WorshipNum, NewVisitNum, NewScore}.

rand_visit_ver({home_rand_visit, RoleId, Name, Lev, Sex,
		Face, Power, LastLogin}) ->
    Soft = home_lib:get_soft(RoleId),
    rand_visit_ver({home_rand_visit, RoleId, Name, Lev, Sex,
		    Face, Power, LastLogin, Soft});
rand_visit_ver({home_rand_visit, RoleId, Name, Lev, Sex,
		Face, Power, LastLogin, Soft}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    rand_visit_ver({home_rand_visit, RoleId, Name, Lev, Sex,
		    Face, Power, LastLogin, Soft, FaceUpdateTime,
		    FaceFile});
rand_visit_ver(D) -> {ok, D}.

do_rank_ver({home_rank_rc, RoleId, Name, Lev, Face,
	     AvatarBid, Time, CacheTime, WorShipNum, VisitNum, Soft,
	     Score, Rank}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    do_rank_ver({home_rank_rc, RoleId, Name, Lev, Face,
		 AvatarBid, Time, CacheTime, WorShipNum, VisitNum, Soft,
		 Score, Rank, FaceUpdateTime, FaceFile});
do_rank_ver(D) -> {ok, D}.

-spec roleid_rank(tuple()) -> #home_rank_rc{} | false.

roleid_rank(RoleId) ->
    case ets:lookup(home_role_rank, RoleId) of
      [#home_role_rank{rank = Rank}] -> get_rank_rc(Rank);
      _ -> false
    end.

get_rank_rc(Rank) ->
    case ets:lookup(home_rank, Rank) of
      [Rc = #home_rank_rc{}] -> Rc;
      _ -> false
    end.

do_save_update([]) -> skip;
do_save_update([{Rank} | T]) ->
    case get_rank_rc(Rank) of
      RankRc = #home_rank_rc{} ->
	  dets:insert(home_rank, RankRc);
      _ -> skip
    end,
    do_save_update(T).

init_merge() ->
    MergeIndex = sys_env:get(merge_index, 0),
    NowIndex = sys_env:get(home_merge_index, 0),
    case MergeIndex =/= NowIndex of
      true ->
	  sys_env:save(home_merge_index, MergeIndex),
	  sys_env:save(home_merge_status, true),
	  ok;
      _ -> skip
    end,
    ok.


