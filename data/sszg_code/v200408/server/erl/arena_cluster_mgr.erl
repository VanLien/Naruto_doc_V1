-file("src/mod/arena_cluster/arena_cluster_mgr.erl", 1).

-module(arena_cluster_mgr).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{cluster_dynamic_local_group, [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
		{arena_cluster_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{arena_cluster_replay_partner,
		 [pos, bid, lev, star, ext]},
		{arena_cluster_replay,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_cluster_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_score, def_id, def_name, def_face, def_lev,
		  def_rank, def_score, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_cluster_log, [id, list]},
		{arena_cluster_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, score, rank, time, avatar_id,
		  cont_win, ext]},
		{arena_cluster_rank, [rank, id, score]},
		{arena_cluster_f_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  dower_skill, set_skill, attr, extra]},
		{arena_cluster_f_order,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, pos_info, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  power, is_hidden, extra]},
		{arena_cluster_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, order_info, robot_id, avatar_id, look, ext]},
		{m_arena_cluster,
		 [ver, ref_time, formations, ref_list, season_ref_time,
		  season_combat_num, best_rank, day_combat_num,
		  acc_combat_num, day_reward, turn_card_reward,
		  turn_card_num, turn_card_history, worship,
		  worship_list]},
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
		{state, [next_rank, last_time, is_main, status]}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([gm/2, lock_target/2, unlock_target/1,
	 sync_role/1, save_log/1, is_open/0, is_opening/0,
	 update_role/2, env_info/0, send_info/3, send_call/3,
	 notice_cont_win/3, notice_first_rank/3,
	 merge_main_role_move_back/1, move_to_new_main/1]).

-record(state,
	{next_rank = 0, last_time = 0, is_main = 0,
	 status = 0}).

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

-file("src/mod/arena_cluster/arena_cluster_mgr.erl",
      29).

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

-file("src/mod/arena_cluster/arena_cluster_mgr.erl",
      30).

-file("inc/arena_cluster.hrl", 1).

-record(m_arena_cluster,
	{ver = 1, ref_time = 0, formations = [], ref_list = [],
	 season_ref_time = 0, season_combat_num = 0,
	 best_rank = 0, day_combat_num = 0, acc_combat_num = 0,
	 day_reward = [], turn_card_reward = [],
	 turn_card_num = 0, turn_card_history = [], worship = 0,
	 worship_list = []}).

-record(arena_cluster_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, order_info = [], robot_id = 0, avatar_id = 0,
	 look = 0, ext = []}).

-record(arena_cluster_f_order,
	{order, formation_type = 1, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, pos_info = [],
	 hallows_look_id = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_all_look_ids = [], power = 0,
	 is_hidden = 0, extra = []}).

-record(arena_cluster_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 dower_skill = [], set_skill = [], attr, extra = []}).

-record(arena_cluster_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_cluster_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, cont_win = 0, ext = []}).

-record(role_arena_cluster_log,
	{id = {0, <<>>}, list = []}).

-record(arena_cluster_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0, atk_score = 0,
	 def_id = {0, <<>>}, def_name = <<>>, def_face = 0,
	 def_lev = 0, def_rank = 0, def_score = 0, ret = 1,
	 win_count = 0, lose_count = 0, combat_type = 0,
	 replay_list = [], time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_cluster_replay,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_cluster_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(arena_cluster_fight_lock,
	{id = {0, <<>>}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-file("src/mod/arena_cluster/arena_cluster_mgr.erl",
      31).

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

-file("src/mod/arena_cluster/arena_cluster_mgr.erl",
      32).

-file("inc/log.hrl", 1).

-file("src/mod/arena_cluster/arena_cluster_mgr.erl",
      33).

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

-file("src/mod/arena_cluster/arena_cluster_mgr.erl",
      34).

gm(_Role, {open, Status}) ->
    case Status =:= 1 of
      true ->
	  arena_cluster_mgr:send_info(arena_cluster_mgr, info,
				      [gm_open]);
      _ ->
	  arena_cluster_mgr:send_info(arena_cluster_mgr, info,
				      [gm_close])
    end,
    ok.

-spec sync_role(#role{}) -> ok.

sync_role(Role = #role{lev = Lev}) ->
    case Lev >= arena_cluster_data:get_const(lev_limt) of
      true ->
	  {ok, AR} = role_convert:do(arena_cluster_role, Role),
	  ets:insert(arena_cluster_role_bak, AR),
	  case world_lev:get_world_lev() >=
		 arena_cluster_data:get_const(world_lev_open)
	      of
	    true ->
		send_info(arena_cluster_mgr, info,
			  [{update_main_robot, AR}]),
		ok;
	    _ -> skip
	  end;
      _ -> skip
    end.

save_log({RoleId, CombatLog}) ->
    info({add_log, RoleId, CombatLog, false});
save_log({RoleId, _Power, _TarPower,
	  CombatLog = #arena_cluster_log{}}) ->
    info({add_log, RoleId, CombatLog, false});
save_log(CombatLog = #arena_cluster_log{atk_id = Id}) ->
    info({add_log, Id, CombatLog, false}).

lock_target({_, <<>>}, _TarRoleId) -> true;
lock_target(RoleId, TarRoleId) ->
    send_call(arena_cluster_mgr, call,
	      [{arena_cluster_pk, RoleId, TarRoleId}]).

unlock_target({_, <<>>}) -> true;
unlock_target(RoleId) ->
    send_info(arena_cluster_mgr, info,
	      [{unlock_arena_cluster_pk, RoleId}]).

-spec update_role(role_id() | #arena_cluster_role{},
		  pos_integer()) -> ok.

update_role({_, <<>>}, _AddScore) -> ok;
update_role(ArenaRole, AddScore) ->
    send_info(arena_cluster_mgr, info,
	      [{update_role, ArenaRole, AddScore}]).

update_ets(Data = #arena_cluster_role{id = RoleId,
				      rank = Rank, score = Score},
	   all) ->
    ets:insert(arena_cluster_rank,
	       #arena_cluster_rank{rank = Rank, id = RoleId,
				   score = Score}),
    ets:insert(arena_cluster_role, Data),
    dets:insert(arena_cluster_role, Data);
update_ets(Data = #arena_cluster_role{id = RoleId,
				      rank = Rank, score = Score},
	   ets) ->
    ets:insert(arena_cluster_rank,
	       #arena_cluster_rank{rank = Rank, id = RoleId,
				   score = Score}),
    ets:insert(arena_cluster_role, Data),
    ets:insert(arena_cluster_update, {RoleId}).

calc_time() ->
    StartTime = date:unixtime() +
		  date:week_next_diff([2], {0, 0, 0}),
    EndTime = date:unixtime() +
		date:week_next_diff([6], {23, 0, 0}),
    {StartTime, EndTime}.

-spec is_open() -> true | false.

is_open() ->
    case env_info() of
      #{status := 1} -> true;
      _ -> false
    end.

-spec is_opening() -> true | false.

is_opening() ->
    case env_info() of
      Map = #{status := 1} ->
	  Day = date:day_of_the_week(),
	  case lists:member(Day,
			    arena_cluster_data:get_const(season_time))
	      of
	    true -> true;
	    _ ->
		TempEndTime = maps:get(temp_end_time, Map, 0),
		Now = date:unixtime(),
		case TempEndTime =/= 0 andalso TempEndTime > Now of
		  true -> true;
		  _ -> false
		end
	  end;
      _ -> false
    end.

env_info() ->
    sys_env:get(arena_cluster_info,
		#{is_main => 0, season_start_time => 0,
		  season_end_time => 0, temp_end_time => 0, status => 0,
		  server_type => none, is_upload => 0}).

save_env_info(Val) ->
    sys_env:save(arena_cluster_info, Val).

info(Info) -> arena_cluster_mgr ! Info.

cast(Info) -> gen_server:cast(arena_cluster_mgr, Info).

call(Info) ->
    case catch gen_server:call(arena_cluster_mgr, Info,
			       10000)
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
	    {__Pidarena_cluster_mgr154, _,
	     {__Levelarena_cluster_mgr154,
	      __Tracesarena_cluster_mgr154}}
		when __Levelarena_cluster_mgr154 band 8 /= 0 orelse
		       __Tracesarena_cluster_mgr154 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_mgr}, {function, call},
			      {line, 154}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_cluster_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_cluster_mgr154,
			     __Tracesarena_cluster_mgr154, lager_event,
			     __Pidarena_cluster_mgr154);
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
    gen_server:start_link({local, arena_cluster_mgr},
			  arena_cluster_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr160, _,
       {__Levelarena_cluster_mgr160,
	__Tracesarena_cluster_mgr160}}
	  when __Levelarena_cluster_mgr160 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr160 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, init},
			{line, 160}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [arena_cluster_mgr]),
		       none, 4096, 64, __Levelarena_cluster_mgr160,
		       __Tracesarena_cluster_mgr160, lager_event,
		       __Pidarena_cluster_mgr160);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(arena_cluster_role,
		   [{file, "./dets/arena_cluster_role.dets"},
		    {keypos, #arena_cluster_role.id}, {type, set}]),
    dets:open_file(arena_cluster_role_bak,
		   [{file, "./dets/arena_cluster_role_bak.dets"},
		    {keypos, #arena_cluster_role.id}, {type, set}]),
    dets:open_file(role_arena_cluster_log,
		   [{file, "./dets/role_arena_cluster_log.dets"},
		    {keypos, #role_arena_cluster_log.id}, {type, set}]),
    ets:new(arena_cluster_role,
	    [set, named_table, public,
	     {keypos, #arena_cluster_role.id}]),
    ets:new(arena_cluster_role_bak,
	    [set, named_table, public,
	     {keypos, #arena_cluster_role.id}]),
    ets:new(arena_cluster_rank,
	    [set, named_table, public,
	     {keypos, #arena_cluster_rank.rank}]),
    ets:new(arena_cluster_update,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(role_arena_cluster_log,
	    [set, named_table, public,
	     {keypos, #role_arena_cluster_log.id}]),
    ets:new(arena_cluster_fight_lock,
	    [set, named_table, public,
	     {keypos, #arena_cluster_fight_lock.id}]),
    dets:to_ets(arena_cluster_role_bak,
		arena_cluster_role_bak),
    util:set_timer(update_save_timer, util:rand(300, 380),
		   update_save),
    NextDelDiff = date:week_next_diff([1, 3, 5, 7],
				      {2, 0, 0}),
    util:set_timer(del_overdue_log_timer,
		   NextDelDiff + util:rand(100, 1000), del_overdue_log),
    State = #state{},
    NewState = init_merge(State),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr177, _,
       {__Levelarena_cluster_mgr177,
	__Tracesarena_cluster_mgr177}}
	  when __Levelarena_cluster_mgr177 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr177 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, init},
			{line, 177}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [arena_cluster_mgr]), none,
		       4096, 64, __Levelarena_cluster_mgr177,
		       __Tracesarena_cluster_mgr177, lager_event,
		       __Pidarena_cluster_mgr177);
      _ -> ok
    end,
    {ok, NewState}.

init_merge(State) ->
    Now = date:unixtime(),
    {_StartTime, EndTime} = calc_time(),
    case env_info() of
      Info = #{season_start_time := OldStartTime,
	       season_end_time := OldEndTime, server_type := merge}
	  when OldStartTime =/= 0 ->
	  case Now >= OldStartTime andalso OldEndTime > Now of
	    true ->
		NewEndTime = util:if_true(EndTime =/= OldEndTime,
					  EndTime, OldEndTime),
		NewInfo = Info#{status => 1, is_main => 1,
				season_end_time => NewEndTime},
		save_env_info(NewInfo),
		NextRank = do_init(),
		util:set_timer(do_reward_timer, NewEndTime - Now,
			       end_season),
		util:set_timer(update_save_timer, util:rand(300, 380),
			       update_save),
		State#state{is_main = 1, status = 1,
			    next_rank = NextRank};
	    _ ->
		NewEndTime = util:if_true(EndTime =/= OldEndTime,
					  EndTime, OldEndTime),
		NewInfo = Info#{status => 0, is_main => 1,
				season_end_time => NewEndTime},
		save_env_info(NewInfo),
		NextRank = do_init(),
		util:set_timer(do_init_timer, OldStartTime - Now,
			       init_season),
		State#state{is_main = 1, next_rank = NextRank}
	  end;
      _ -> State
    end.

handle_call({arena_cluster_pk, RoleId, TarRoleId},
	    _From, State = #state{status = 1}) ->
    Reply = case ets:lookup(arena_cluster_fight_lock,
			    RoleId)
		of
	      [#arena_cluster_fight_lock{}] -> false;
	      _ ->
		  ets:insert(arena_cluster_fight_lock,
			     #arena_cluster_fight_lock{id = RoleId,
						       is_fight = 1,
						       fight_rid = TarRoleId}),
		  true
	    end,
    {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({update_role,
	     ArenaRole = #arena_cluster_role{id = RoleId,
					     name = Name},
	     AddScore},
	    State = #state{is_main = 1, status = 1}) ->
    case arena_cluster_lib:get_role(RoleId) of
      {ok,
       #arena_cluster_role{score = NowScore, rank = OldRank,
			   cont_win = ContWin}} ->
	  NewScore = max(NowScore + AddScore,
			 arena_cluster_data:get_const(min_score)),
	  NewContWin = util:if_true(AddScore > 0, ContWin + 1, 0),
	  cluster_dynamic_group:group_cast(1, arena_cluster_mgr,
					   notice_cont_win,
					   [RoleId, Name, NewContWin]),
	  update_rank(ArenaRole#arena_cluster_role{score =
						       NewScore,
						   rank = OldRank,
						   cont_win = NewContWin},
		      NewScore - NowScore, State);
      false -> update_rank(ArenaRole, AddScore, State)
    end;
handle_info({update_role, RoleId = {_, _}, AddScore},
	    State = #state{is_main = 1, status = 1}) ->
    case arena_cluster_lib:get_role(RoleId) of
      {ok,
       ArenaRole = #arena_cluster_role{score = NowScore,
				       rank = OldRank, cont_win = ContWin}}
	  when OldRank > 0 ->
	  NewScore = max(NowScore + AddScore,
			 arena_cluster_data:get_const(min_score)),
	  NewContWin = util:if_true(AddScore >= 0, ContWin, 0),
	  update_rank(ArenaRole#arena_cluster_role{score =
						       NewScore,
						   cont_win = NewContWin},
		      NewScore - NowScore, State);
      {ok,
       ArenaRole = #arena_cluster_role{score = NowScore}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr240, _,
	     {__Levelarena_cluster_mgr240,
	      __Tracesarena_cluster_mgr240}}
		when __Levelarena_cluster_mgr240 band 128 /= 0 orelse
		       __Tracesarena_cluster_mgr240 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 240},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w角色ID因为没有打过所以没有上榜", [RoleId]),
			     none, 4096, 128, __Levelarena_cluster_mgr240,
			     __Tracesarena_cluster_mgr240, lager_event,
			     __Pidarena_cluster_mgr240);
	    _ -> ok
	  end,
	  NewScore = max(NowScore + AddScore,
			 arena_cluster_data:get_const(min_score)),
	  update_ets(ArenaRole#arena_cluster_role{score =
						      NewScore},
		     ets),
	  {noreply, State};
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr245, _,
	     {__Levelarena_cluster_mgr245,
	      __Tracesarena_cluster_mgr245}}
		when __Levelarena_cluster_mgr245 band 8 /= 0 orelse
		       __Tracesarena_cluster_mgr245 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 245},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到角色信息:~w==~w",
					   [RoleId, AddScore]),
			     none, 4096, 8, __Levelarena_cluster_mgr245,
			     __Tracesarena_cluster_mgr245, lager_event,
			     __Pidarena_cluster_mgr245);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
handle_info({add_log, RoleId,
	     CombatLog = #arena_cluster_log{atk_id = Id = {_, Sid},
					    def_id = Id2,
					    replay_list = ReplayList},
	     Flag},
	    State) ->
    #role_arena_cluster_log{list = Logs} =
	arena_cluster_lib:get_log(RoleId),
    LogId = case Logs of
	      [#arena_cluster_log{id = LogId1} | _]
		  when LogId1 < 30 ->
		  LogId1 + 1;
	      _ -> 1
	    end,
    ARank = arena_cluster_lib:cluster_role_rank(Id),
    BRank = arena_cluster_lib:cluster_role_rank(Id2),
    NewLogData = CombatLog#arena_cluster_log{id = LogId,
					     atk_rank = ARank,
					     def_rank = BRank},
    case RoleId == Id of
      true -> skip;
      _ ->
	  [cluster_lib:cast(Sid, combat_replay_mgr,
			    acc_replay_reference, [Temp])
	   || {_, #arena_cluster_replay{id = Temp}} <- ReplayList,
	      Temp =/= 0]
    end,
    {NewLogs, DelLogs} = list_util:split(15,
					 [NewLogData | Logs]),
    [[cluster_lib:cast(DelSid, combat_replay_mgr,
		       dec_replay_reference, [Temp])
      || {_, #arena_cluster_replay{id = Temp}} <- ReplayListT,
	 Temp =/= 0]
     || #arena_cluster_log{atk_id = {_, DelSid},
			   replay_list = ReplayListT}
	    <- DelLogs],
    ets:insert(role_arena_cluster_log,
	       #role_arena_cluster_log{id = RoleId, list = NewLogs}),
    dets:insert(role_arena_cluster_log,
		#role_arena_cluster_log{id = RoleId, list = NewLogs}),
    case Flag of
      true ->
	  send_info(arena_cluster_mgr, info,
		    [{add_highlight, NewLogData}]);
      _ -> ok
    end,
    {noreply, State};
handle_info({del_log, RoleId}, State) ->
    #role_arena_cluster_log{list = Logs} =
	arena_cluster_lib:get_log(RoleId),
    {NewLogs, DelLogs} = case Logs of
			   [LogData = #arena_cluster_log{} | Other] ->
			       {Other, [LogData]};
			   _ -> {Logs, []}
			 end,
    [[cluster_lib:cast(DelSid, combat_replay_mgr,
		       dec_replay_reference, [Temp])
      || {_, #arena_cluster_replay{id = Temp}} <- ReplayListT,
	 Temp =/= 0]
     || #arena_cluster_log{atk_id = {_, DelSid},
			   replay_list = ReplayListT}
	    <- DelLogs],
    ets:insert(role_arena_cluster_log,
	       #role_arena_cluster_log{id = RoleId, list = NewLogs}),
    dets:insert(role_arena_cluster_log,
		#role_arena_cluster_log{id = RoleId, list = NewLogs}),
    {noreply, State};
handle_info({add_highlight,
	     NewLogData = #arena_cluster_log{atk_id = {_, Sid},
					     replay_list = ReplayList}},
	    State = #state{is_main = 1, status = 1}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr292, _,
       {__Levelarena_cluster_mgr292,
	__Tracesarena_cluster_mgr292}}
	  when __Levelarena_cluster_mgr292 band 128 /= 0 orelse
		 __Tracesarena_cluster_mgr292 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 292}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "跨服竞技场新增亮眼表现", none, 4096, 128,
		       __Levelarena_cluster_mgr292,
		       __Tracesarena_cluster_mgr292, lager_event,
		       __Pidarena_cluster_mgr292);
      _ -> ok
    end,
    #role_arena_cluster_log{list = Logs} =
	arena_cluster_lib:get_log(0),
    {NewLogs, DelLogs} = list_util:split(30,
					 [NewLogData | Logs]),
    [cluster_lib:cast(Sid, combat_replay_mgr,
		      acc_replay_reference, [Temp])
     || {_, #arena_cluster_replay{id = Temp}} <- ReplayList],
    [[cluster_lib:cast(DelSid, combat_replay_mgr,
		       dec_replay_reference, [Temp])
      || {_, #arena_cluster_replay{id = Temp}} <- ReplayListT]
     || #arena_cluster_log{atk_id = {_, DelSid},
			   replay_list = ReplayListT}
	    <- DelLogs],
    ets:update_element(role_arena_cluster_log, 0,
		       [{#role_arena_cluster_log.list, NewLogs}]),
    {noreply, State};
handle_info(del_overdue_log, State) ->
    try Now = date:unixtime(),
	Fun = fun (RL = #role_arena_cluster_log{list = LogsT},
		   Acc) ->
		      Logs = [arena_cluster_lib:log_ver(I) || I <- LogsT],
		      {NewLogs, DelLogs} = lists:partition(fun
							     (#arena_cluster_log{time
										     =
										     Time}) ->
								 Now - Time <
								   86400 * 14
							   end,
							   Logs),
		      [[cluster_lib:cast(DelSid, combat_replay_mgr,
					 dec_replay_reference, [Temp])
			|| {_, #arena_cluster_replay{id = Temp}} <- ReplayListT,
			   Temp =/= 0]
		       || #arena_cluster_log{atk_id = {_, DelSid},
					     replay_list = ReplayListT}
			      <- DelLogs],
		      case NewLogs of
			[_ | _] ->
			    NewRL = RL#role_arena_cluster_log{list = NewLogs},
			    [NewRL | Acc];
			_ -> Acc
		      end;
		  (_, Acc) -> Acc
	      end,
	L = dets:foldl(Fun, [], role_arena_cluster_log),
	dets:delete_all_objects(role_arena_cluster_log),
	ets:delete_all_objects(role_arena_cluster_log),
	dets:insert(role_arena_cluster_log, L),
	NextDiff = date:week_next_diff([1, 3, 5, 7], {2, 0, 0}),
	util:set_timer(del_overdue_log_timer,
		       NextDiff + util:rand(100, 1000), del_overdue_log)
    catch
      _TryC:_TryE ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr326, _,
	     {__Levelarena_cluster_mgr326,
	      __Tracesarena_cluster_mgr326}}
		when __Levelarena_cluster_mgr326 band 8 /= 0 orelse
		       __Tracesarena_cluster_mgr326 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 326},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("出错啦:~w : ~w error:~w",
					   [_TryC, _TryE,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_cluster_mgr326,
			     __Tracesarena_cluster_mgr326, lager_event,
			     __Pidarena_cluster_mgr326);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_info({unlock_arena_cluster_pk, RoleId}, State) ->
    ets:delete(arena_cluster_fight_lock, RoleId),
    {noreply, State};
handle_info(cluster_open, State) ->
    Now = date:unixtime(),
    case env_info() of
      Info = #{server_type := merge, status := 0,
	       season_start_time := OldStartTime} ->
	  case cluster_dynamic_group:is_main(1) of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_mgr342, _,
		   {__Levelarena_cluster_mgr342,
		    __Tracesarena_cluster_mgr342}}
		      when __Levelarena_cluster_mgr342 band 64 /= 0 orelse
			     __Tracesarena_cluster_mgr342 /= [] ->
		      lager:do_log(info,
				   [{module, arena_cluster_mgr},
				    {function, handle_info}, {line, 342},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "跨服竞技场由合服形式转换为跨服形式，本服为主服", none, 4096, 64,
				   __Levelarena_cluster_mgr342,
				   __Tracesarena_cluster_mgr342, lager_event,
				   __Pidarena_cluster_mgr342);
		  _ -> ok
		end,
		NewInfo = Info#{status => 0, is_main => 1,
				server_type => cluster},
		save_env_info(NewInfo),
		NextRank = do_init(),
		util:set_timer(do_init_timer, OldStartTime - Now,
			       init_season),
		{noreply,
		 State#state{is_main = 1, next_rank = NextRank}};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_mgr349, _,
		   {__Levelarena_cluster_mgr349,
		    __Tracesarena_cluster_mgr349}}
		      when __Levelarena_cluster_mgr349 band 64 /= 0 orelse
			     __Tracesarena_cluster_mgr349 /= [] ->
		      lager:do_log(info,
				   [{module, arena_cluster_mgr},
				    {function, handle_info}, {line, 349},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "跨服竞技场由合服形式转换为跨服形式，本服为非主服", none, 4096, 64,
				   __Levelarena_cluster_mgr349,
				   __Tracesarena_cluster_mgr349, lager_event,
				   __Pidarena_cluster_mgr349);
		  _ -> ok
		end,
		NewInfo = Info#{status => 0, is_main => 0,
				server_type => cluster},
		save_env_info(NewInfo),
		{noreply, State#state{is_main = 0}}
	  end;
      Info = #{server_type := merge} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr355, _,
	     {__Levelarena_cluster_mgr355,
	      __Tracesarena_cluster_mgr355}}
		when __Levelarena_cluster_mgr355 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr355 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 355},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "跨服竞技场由合服换为待跨服模式", none, 4096, 64,
			     __Levelarena_cluster_mgr355,
			     __Tracesarena_cluster_mgr355, lager_event,
			     __Pidarena_cluster_mgr355);
	    _ -> ok
	  end,
	  NewInfo = Info#{server_type => ready_cluster},
	  save_env_info(NewInfo),
	  {noreply, State};
      #{server_type := ready_cluster} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr360, _,
	     {__Levelarena_cluster_mgr360,
	      __Tracesarena_cluster_mgr360}}
		when __Levelarena_cluster_mgr360 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr360 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 360},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "跨服竞技待跨服模式时收到通知，不做处理", none, 4096, 64,
			     __Levelarena_cluster_mgr360,
			     __Tracesarena_cluster_mgr360, lager_event,
			     __Pidarena_cluster_mgr360);
	    _ -> ok
	  end,
	  {noreply, State};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr363, _,
	     {__Levelarena_cluster_mgr363,
	      __Tracesarena_cluster_mgr363}}
		when __Levelarena_cluster_mgr363 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr363 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 363},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "跨服竞技跨服模式开启", none, 4096, 64,
			     __Levelarena_cluster_mgr363,
			     __Tracesarena_cluster_mgr363, lager_event,
			     __Pidarena_cluster_mgr363);
	    _ -> ok
	  end,
	  case cluster_dynamic_group:is_main(1) of
	    true ->
		{StartTime, EndTime} = calc_time(),
		case env_info() of
		  Info = #{season_start_time := 0} ->
		      case StartTime > EndTime of
			true ->
			    NewInfo = Info#{season_start_time => Now,
					    season_end_time => EndTime,
					    status => 1, is_main => 1,
					    server_type => cluster},
			    save_env_info(NewInfo),
			    NextRank = do_init(),
			    util:set_timer(do_reward_timer, EndTime - Now,
					   end_season),
			    util:set_timer(update_save_timer,
					   util:rand(300, 380), update_save),
			    cluster_dynamic_group:group_other_cast(1,
								   arena_cluster_mgr,
								   info,
								   [{sync_cluster_info,
								     NewInfo}]),
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
			      {__Pidarena_cluster_mgr377, _,
			       {__Levelarena_cluster_mgr377,
				__Tracesarena_cluster_mgr377}}
				  when __Levelarena_cluster_mgr377 band 64 /= 0
					 orelse
					 __Tracesarena_cluster_mgr377 /= [] ->
				  lager:do_log(info,
					       [{module, arena_cluster_mgr},
						{function, handle_info},
						{line, 377},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("跨服竞技跨服模式开启:~w",
							     [NewInfo]),
					       none, 4096, 64,
					       __Levelarena_cluster_mgr377,
					       __Tracesarena_cluster_mgr377,
					       lager_event,
					       __Pidarena_cluster_mgr377);
			      _ -> ok
			    end,
			    {noreply,
			     State#state{is_main = 1, status = 1,
					 next_rank = NextRank}};
			_ ->
			    NewInfo = Info#{season_start_time => StartTime,
					    season_end_time => EndTime,
					    status => 0, is_main => 1,
					    server_type => cluster},
			    save_env_info(NewInfo),
			    NextRank = do_init(),
			    util:set_timer(do_init_timer, StartTime - Now,
					   init_season),
			    cluster_dynamic_group:group_other_cast(1,
								   arena_cluster_mgr,
								   info,
								   [{sync_cluster_info,
								     NewInfo}]),
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
			      {__Pidarena_cluster_mgr385, _,
			       {__Levelarena_cluster_mgr385,
				__Tracesarena_cluster_mgr385}}
				  when __Levelarena_cluster_mgr385 band 64 /= 0
					 orelse
					 __Tracesarena_cluster_mgr385 /= [] ->
				  lager:do_log(info,
					       [{module, arena_cluster_mgr},
						{function, handle_info},
						{line, 385},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("跨服竞技跨服模式开启:~w",
							     [NewInfo]),
					       none, 4096, 64,
					       __Levelarena_cluster_mgr385,
					       __Tracesarena_cluster_mgr385,
					       lager_event,
					       __Pidarena_cluster_mgr385);
			      _ -> ok
			    end,
			    {noreply,
			     State#state{is_main = 1, status = 0,
					 next_rank = NextRank}}
		      end;
		  Info = #{season_start_time := OldStartTime,
			   season_end_time := OldEndTime} ->
		      case Now >= OldStartTime andalso OldEndTime > Now of
			true ->
			    NewEndTime = util:if_true(EndTime =/= OldEndTime,
						      EndTime, OldEndTime),
			    NewInfo = Info#{status => 1, is_main => 1,
					    server_type => cluster,
					    season_end_time => NewEndTime},
			    save_env_info(NewInfo),
			    NextRank = do_init(),
			    util:set_timer(do_reward_timer, NewEndTime - Now,
					   end_season),
			    util:set_timer(update_save_timer,
					   util:rand(300, 380), update_save),
			    cluster_dynamic_group:group_other_cast(1,
								   arena_cluster_mgr,
								   info,
								   [{sync_cluster_info,
								     NewInfo}]),
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
			      {__Pidarena_cluster_mgr398, _,
			       {__Levelarena_cluster_mgr398,
				__Tracesarena_cluster_mgr398}}
				  when __Levelarena_cluster_mgr398 band 64 /= 0
					 orelse
					 __Tracesarena_cluster_mgr398 /= [] ->
				  lager:do_log(info,
					       [{module, arena_cluster_mgr},
						{function, handle_info},
						{line, 398},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("跨服竞技跨服模式开启:~w",
							     [NewInfo]),
					       none, 4096, 64,
					       __Levelarena_cluster_mgr398,
					       __Tracesarena_cluster_mgr398,
					       lager_event,
					       __Pidarena_cluster_mgr398);
			      _ -> ok
			    end,
			    {noreply,
			     State#state{is_main = 1, status = 1,
					 next_rank = NextRank}};
			_ ->
			    NewEndTime = util:if_true(EndTime =/= OldEndTime,
						      EndTime, OldEndTime),
			    NewInfo = Info#{status => 0, is_main => 1,
					    server_type => cluster,
					    season_end_time => NewEndTime},
			    save_env_info(NewInfo),
			    NextRank = do_init(),
			    util:set_timer(do_init_timer, OldStartTime - Now,
					   init_season),
			    cluster_dynamic_group:group_other_cast(1,
								   arena_cluster_mgr,
								   info,
								   [{sync_cluster_info,
								     NewInfo}]),
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
			      {__Pidarena_cluster_mgr407, _,
			       {__Levelarena_cluster_mgr407,
				__Tracesarena_cluster_mgr407}}
				  when __Levelarena_cluster_mgr407 band 64 /= 0
					 orelse
					 __Tracesarena_cluster_mgr407 /= [] ->
				  lager:do_log(info,
					       [{module, arena_cluster_mgr},
						{function, handle_info},
						{line, 407},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("跨服竞技跨服模式开启:~w",
							     [NewInfo]),
					       none, 4096, 64,
					       __Levelarena_cluster_mgr407,
					       __Tracesarena_cluster_mgr407,
					       lager_event,
					       __Pidarena_cluster_mgr407);
			      _ -> ok
			    end,
			    {noreply,
			     State#state{is_main = 1, status = 0,
					 next_rank = NextRank}}
		      end
		end;
	    _ -> {noreply, State}
	  end
    end;
handle_info({sync_cluster_info, Info}, State)
    when is_map(Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr417, _,
       {__Levelarena_cluster_mgr417,
	__Tracesarena_cluster_mgr417}}
	  when __Levelarena_cluster_mgr417 band 128 /= 0 orelse
		 __Tracesarena_cluster_mgr417 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 417}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("sync_cluster_info ~w", [Info]), none,
		       4096, 128, __Levelarena_cluster_mgr417,
		       __Tracesarena_cluster_mgr417, lager_event,
		       __Pidarena_cluster_mgr417);
      _ -> ok
    end,
    case env_info() of
      #{server_type := ServerType}
	  when ServerType == merge orelse
		 ServerType == ready_cluster ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr420, _,
	     {__Levelarena_cluster_mgr420,
	      __Tracesarena_cluster_mgr420}}
		when __Levelarena_cluster_mgr420 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr420 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 420},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("跨服竞技同步状态时不满足状态 ~w", [ServerType]),
			     none, 4096, 64, __Levelarena_cluster_mgr420,
			     __Tracesarena_cluster_mgr420, lager_event,
			     __Pidarena_cluster_mgr420);
	    _ -> ok
	  end,
	  {noreply, State};
      _ ->
	  case cluster_dynamic_group:is_main(1) of
	    false ->
		util:unset_timer(do_init_timer),
		util:unset_timer(do_reward_timer),
		save_env_info(Info#{is_main => 0,
				    server_type => cluster}),
		role_group:apply(world, {arena_cluster, push_open, []}),
		{noreply, State#state{is_main = 0}};
	    _ -> {noreply, State}
	  end
    end;
handle_info({sync_hero_hall, HeroHall}, State) ->
    case cluster_dynamic_group:is_main(1) of
      false ->
	  sys_env:save(arena_cluster_hero_hall, HeroHall),
	  {noreply, State};
      _ -> {noreply, State}
    end;
handle_info(init_season,
	    State = #state{is_main = 1, status = 0}) ->
    Info = #{season_end_time := EndTime} = env_info(),
    NewInfo = Info#{status => 1},
    save_env_info(NewInfo),
    cluster_dynamic_group:group_other_cast(1,
					   arena_cluster_mgr, info,
					   [{sync_cluster_info, NewInfo}]),
    Now = date:unixtime(),
    util:unset_timer(do_init_timer),
    util:set_timer(do_reward_timer, EndTime - Now,
		   end_season),
    util:set_timer(update_save_timer, util:rand(300, 380),
		   update_save),
    role_group:apply(world, {arena_cluster, push_open, []}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr455, _,
       {__Levelarena_cluster_mgr455,
	__Tracesarena_cluster_mgr455}}
	  when __Levelarena_cluster_mgr455 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr455 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 455}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("init_season:~w", [NewInfo]), none, 4096,
		       64, __Levelarena_cluster_mgr455,
		       __Tracesarena_cluster_mgr455, lager_event,
		       __Pidarena_cluster_mgr455);
      _ -> ok
    end,
    {noreply, State#state{status = 1, next_rank = 1}};
handle_info(end_season,
	    State = #state{is_main = 1, status = 1}) ->
    Info = env_info(),
    {StartTime, EndTime} = calc_time(),
    Now = date:unixtime(),
    season_reward(1),
    SelfId = sys_lib:srv_id(),
    RankList = case lists:member(SelfId,
				 [<<"symlf_1">>, <<"symlf_2">>, <<"symlf_3">>,
				  <<"symlf_4">>, <<"symlf_5">>, <<"symlf_6">>])
		   of
		 true ->
		     arena_cluster_lib:list_rank(arena_peak_champion_data:get_constant(battle_members1));
		 _ ->
		     arena_cluster_lib:list_rank(arena_peak_champion_data:get_constant(battle_members))
	       end,
    sys_env:save(arena_peak_champione_data, RankList),
    FeatRank = [{PushId, PushRank}
		|| #arena_cluster_role{id = PushId, rank = PushRank}
		       <- arena_cluster_lib:list_rank(100)],
    cluster_dynamic_group:group_cast(1, room_feat_mgr, info,
				     [{arena_cluster_do_feat, FeatRank}]),
    log_rank:save(44),
    HeroHall = arena_cluster_lib:hero_hall(),
    sys_env:save(arena_cluster_hero_hall, HeroHall),
    cluster_dynamic_group:group_other_cast(1,
					   arena_cluster_mgr, info,
					   [{sync_hero_hall, HeroHall}]),
    L = ets:tab2list(arena_cluster_role),
    ets:delete_all_objects(arena_cluster_rank),
    ets:delete_all_objects(arena_cluster_role),
    dets:delete_all_objects(arena_cluster_role),
    ets:delete_all_objects(arena_cluster_update),
    ets:delete_all_objects(arena_cluster_fight_lock),
    season_reset(L),
    case EndTime > StartTime of
      true ->
	  case Info of
	    #{server_type := merge} ->
		NewInfo = Info#{season_start_time => StartTime,
				season_end_time => EndTime, status => 0},
		save_env_info(NewInfo),
		util:set_timer(do_init_timer, StartTime - Now,
			       init_season);
	    _ ->
		case cluster_dynamic_group:is_main(1) of
		  true ->
		      NewInfo = Info#{season_start_time => StartTime,
				      season_end_time => EndTime, status => 0,
				      server_type => cluster, is_main => 1},
		      save_env_info(NewInfo),
		      cluster_dynamic_group:group_other_cast(1,
							     arena_cluster_mgr,
							     info,
							     [{sync_cluster_info,
							       NewInfo}]),
		      util:set_timer(do_init_timer, StartTime - Now,
				     init_season);
		  _ ->
		      NewInfo = Info#{season_start_time => StartTime,
				      season_end_time => EndTime, status => 0,
				      server_type => cluster, is_main => 0},
		      save_env_info(NewInfo)
		end
	  end,
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
	    {__Pidarena_cluster_mgr511, _,
	     {__Levelarena_cluster_mgr511,
	      __Tracesarena_cluster_mgr511}}
		when __Levelarena_cluster_mgr511 band 8 /= 0 orelse
		       __Tracesarena_cluster_mgr511 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 511},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("跨服竞技场进入错误的结算时间【~w】【~w】",
					   [StartTime, EndTime]),
			     none, 4096, 8, __Levelarena_cluster_mgr511,
			     __Tracesarena_cluster_mgr511, lager_event,
			     __Pidarena_cluster_mgr511);
	    _ -> ok
	  end,
	  NewInfo = Info#{season_start_time => Now + 60 * 30,
			  season_end_time => EndTime, status => 0},
	  save_env_info(NewInfo),
	  cluster_dynamic_group:group_other_cast(1,
						 arena_cluster_mgr, info,
						 [{sync_cluster_info,
						   NewInfo}]),
	  util:set_timer(do_init_timer, 60 * 30, init_season),
	  ok
    end,
    role_group:apply(world, {arena_cluster, push_open, []}),
    role_group:apply(world, {arena_cluster, push, []}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr520, _,
       {__Levelarena_cluster_mgr520,
	__Tracesarena_cluster_mgr520}}
	  when __Levelarena_cluster_mgr520 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr520 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 520}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("end_season:~w", [{StartTime, EndTime}]),
		       none, 4096, 64, __Levelarena_cluster_mgr520,
		       __Tracesarena_cluster_mgr520, lager_event,
		       __Pidarena_cluster_mgr520);
      _ -> ok
    end,
    {noreply, State#state{status = 0, next_rank = 1}};
handle_info({update_main_robot,
	     #arena_cluster_role{id = RoleId, lev = Lev, name = Name,
				 power = Power, face = FaceId, gid = Gid,
				 gname = GName, lookid = LookId,
				 avatar_id = AvatarId, max_power = MaxPower}},
	    State = #state{is_main = 1}) ->
    case ets:member(arena_cluster_role, RoleId) of
      true ->
	  L = [{#arena_cluster_role.lev, Lev},
	       {#arena_cluster_role.name, Name},
	       {#arena_cluster_role.power, Power},
	       {#arena_cluster_role.face, FaceId},
	       {#arena_cluster_role.gid, Gid},
	       {#arena_cluster_role.gname, GName},
	       {#arena_cluster_role.lookid, LookId},
	       {#arena_cluster_role.avatar_id, AvatarId},
	       {#arena_cluster_role.max_power, MaxPower}],
	  ets:update_element(arena_cluster_role, RoleId, L);
      _ -> skip
    end,
    {noreply, State};
handle_info(first_sync_robot_to_main_zone, State) ->
    LimitWorldLev =
	arena_cluster_data:get_const(world_lev_open),
    WorldLev = world_lev:get_world_lev(),
    case LimitWorldLev =< WorldLev of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr540, _,
	     {__Levelarena_cluster_mgr540,
	      __Tracesarena_cluster_mgr540}}
		when __Levelarena_cluster_mgr540 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr540 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 540},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "上传机器人数据到主服", none, 4096, 64,
			     __Levelarena_cluster_mgr540,
			     __Tracesarena_cluster_mgr540, lager_event,
			     __Pidarena_cluster_mgr540);
	    _ -> ok
	  end,
	  L = load(),
	  put(arena_cluster_sync_robot_to_main_zone, L),
	  ets:insert(arena_cluster_role_bak, L),
	  Info = env_info(),
	  save_env_info(Info#{is_upload => 1}),
	  erlang:send_after(util:rand(1, 180), self(),
			    sync_robot_to_main_zone);
      _ -> ok
    end,
    {noreply, State};
handle_info(clear_data, State = #state{status = 0}) ->
    ets:delete_all_objects(arena_cluster_rank),
    ets:delete_all_objects(arena_cluster_role),
    dets:delete_all_objects(arena_cluster_role),
    ets:delete_all_objects(arena_cluster_update),
    ets:delete_all_objects(arena_cluster_fight_lock),
    Info = env_info(),
    save_env_info(Info#{is_upload => 0}),
    {noreply, State};
handle_info(update_save, State = #state{is_main = 1}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr563, _,
       {__Levelarena_cluster_mgr563,
	__Tracesarena_cluster_mgr563}}
	  when __Levelarena_cluster_mgr563 band 128 /= 0 orelse
		 __Tracesarena_cluster_mgr563 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 563}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("跨服竞技场数据保存:~w",
				     [ets:info(arena_cluster_update, size)]),
		       none, 4096, 128, __Levelarena_cluster_mgr563,
		       __Tracesarena_cluster_mgr563, lager_event,
		       __Pidarena_cluster_mgr563);
      _ -> ok
    end,
    catch
      do_save_update(ets:tab2list(arena_cluster_update)),
    ets:delete_all_objects(arena_cluster_update),
    util:set_timer(update_save_timer, util:rand(300, 380),
		   update_save),
    {noreply, State};
handle_info(clear_data, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr570, _,
       {__Levelarena_cluster_mgr570,
	__Tracesarena_cluster_mgr570}}
	  when __Levelarena_cluster_mgr570 band 8 /= 0 orelse
		 __Tracesarena_cluster_mgr570 /= [] ->
	  lager:do_log(error,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 570}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "在跨服竞技场进行期间重新分配了跨服分组", none, 4096, 8,
		       __Levelarena_cluster_mgr570,
		       __Tracesarena_cluster_mgr570, lager_event,
		       __Pidarena_cluster_mgr570);
      _ -> ok
    end,
    {noreply, State};
handle_info(re_sync_robot_to_main_zone, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr575, _,
       {__Levelarena_cluster_mgr575,
	__Tracesarena_cluster_mgr575}}
	  when __Levelarena_cluster_mgr575 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr575 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 575}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始同步跨服竞技场机器人到主服", none, 4096, 64,
		       __Levelarena_cluster_mgr575,
		       __Tracesarena_cluster_mgr575, lager_event,
		       __Pidarena_cluster_mgr575);
      _ -> ok
    end,
    LimitWorldLev =
	arena_cluster_data:get_const(world_lev_open),
    WorldLev = world_lev:get_world_lev(),
    case LimitWorldLev =< WorldLev of
      true ->
	  L = ets:tab2list(arena_cluster_role_bak),
	  put(arena_cluster_sync_robot_to_main_zone, L),
	  Info = env_info(),
	  save_env_info(Info#{is_upload => 1}),
	  erlang:send_after(util:rand(1, 180), self(),
			    sync_robot_to_main_zone);
      _ -> ok
    end,
    {noreply, State};
handle_info({change_world_lev, NewWorldLev}, State) ->
    Info = env_info(),
    IsUpLoad = maps:get(is_upload, Info, 1),
    LimitWorldLev =
	arena_cluster_data:get_const(world_lev_open),
    case IsUpLoad =:= 0 andalso LimitWorldLev =< NewWorldLev
	of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr596, _,
	     {__Levelarena_cluster_mgr596,
	      __Tracesarena_cluster_mgr596}}
		when __Levelarena_cluster_mgr596 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr596 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 596},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "世界等级条件满足了，所以尝试上传机器人数据到主服", none, 4096, 64,
			     __Levelarena_cluster_mgr596,
			     __Tracesarena_cluster_mgr596, lager_event,
			     __Pidarena_cluster_mgr596);
	    _ -> ok
	  end,
	  L = ets:tab2list(arena_cluster_role_bak),
	  put(arena_cluster_sync_robot_to_main_zone, L),
	  Info = env_info(),
	  save_env_info(Info#{is_upload => 1}),
	  role_group:apply(world, {arena_cluster, push_open, []}),
	  erlang:send_after(util:rand(1, 180), self(),
			    sync_robot_to_main_zone);
      _ -> ok
    end,
    {noreply, State};
handle_info(sync_robot_to_main_zone, State) ->
    case get(arena_cluster_sync_robot_to_main_zone) of
      [PushRole = #arena_cluster_role{} | L] ->
	  cluster_dynamic_group:cast_main(1, arena_cluster_mgr,
					  info,
					  [{main_zone_update_robot, PushRole}]),
	  put(arena_cluster_sync_robot_to_main_zone, L),
	  erlang:send_after(util:rand(100, 280), self(),
			    sync_robot_to_main_zone);
      _ -> ok
    end,
    {noreply, State};
handle_info({main_zone_update_robot,
	     PushRole = #arena_cluster_role{id = RoleId}},
	    State) ->
    case ets:member(arena_cluster_role, RoleId) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr623, _,
	     {__Levelarena_cluster_mgr623,
	      __Tracesarena_cluster_mgr623}}
		when __Levelarena_cluster_mgr623 band 8 /= 0 orelse
		       __Tracesarena_cluster_mgr623 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 623},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("同步数据到主服的时候，居然原本就存在有该角色ID了 ~w",
					   [RoleId]),
			     none, 4096, 8, __Levelarena_cluster_mgr623,
			     __Tracesarena_cluster_mgr623, lager_event,
			     __Pidarena_cluster_mgr623);
	    _ -> ok
	  end,
	  skip;
      _ -> update_ets(PushRole, all)
    end,
    {noreply, State};
handle_info(gm_open, State = #state{is_main = 1}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr631, _,
       {__Levelarena_cluster_mgr631,
	__Tracesarena_cluster_mgr631}}
	  when __Levelarena_cluster_mgr631 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr631 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 631}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "GM有人输入了临时开启跨服赛", none, 4096, 64,
		       __Levelarena_cluster_mgr631,
		       __Tracesarena_cluster_mgr631, lager_event,
		       __Pidarena_cluster_mgr631);
      _ -> ok
    end,
    Now = date:unixtime(),
    case env_info() of
      Info when is_map(Info) ->
	  TempEndTime = date:unixtime({next_day, Now}),
	  NewInfo = Info#{season_start_time => Now,
			  temp_end_time => TempEndTime},
	  save_env_info(NewInfo),
	  util:set_timer(do_init_timer, 5, init_season),
	  cluster_dynamic_group:group_other_cast(1,
						 arena_cluster_mgr, info,
						 [{sync_cluster_info,
						   NewInfo}]),
	  {noreply, State};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr642, _,
	     {__Levelarena_cluster_mgr642,
	      __Tracesarena_cluster_mgr642}}
		when __Levelarena_cluster_mgr642 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr642 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 642},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "GM跨服赛已经在开启阶段", none, 4096, 64,
			     __Levelarena_cluster_mgr642,
			     __Tracesarena_cluster_mgr642, lager_event,
			     __Pidarena_cluster_mgr642);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
handle_info(gm_close, State = #state{is_main = 1}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr647, _,
       {__Levelarena_cluster_mgr647,
	__Tracesarena_cluster_mgr647}}
	  when __Levelarena_cluster_mgr647 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr647 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 647}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "GM有人输入了关闭跨服赛", none, 4096, 64,
		       __Levelarena_cluster_mgr647,
		       __Tracesarena_cluster_mgr647, lager_event,
		       __Pidarena_cluster_mgr647);
      _ -> ok
    end,
    case env_info() of
      #{status := 1} ->
	  util:set_timer(do_reward_timer, 5, end_season),
	  {noreply, State};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr653, _,
	     {__Levelarena_cluster_mgr653,
	      __Tracesarena_cluster_mgr653}}
		when __Levelarena_cluster_mgr653 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr653 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 653},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "GM跨服已经在关闭阶段", none, 4096, 64,
			     __Levelarena_cluster_mgr653,
			     __Tracesarena_cluster_mgr653, lager_event,
			     __Pidarena_cluster_mgr653);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
handle_info(notice_main_merge, State) ->
    SrvId = sys_lib:srv_id(),
    SrvList = sys_lib:srv_full_id(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr661, _,
       {__Levelarena_cluster_mgr661,
	__Tracesarena_cluster_mgr661}}
	  when __Levelarena_cluster_mgr661 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr661 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 661}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("通知主服进行合服操作, 合服ID: ~w", [SrvList]), none,
		       4096, 64, __Levelarena_cluster_mgr661,
		       __Tracesarena_cluster_mgr661, lager_event,
		       __Pidarena_cluster_mgr661);
      _ -> ok
    end,
    cluster_dynamic_group:cast_main(1, arena_cluster_mgr,
				    info,
				    [{main_role_move_back, SrvId, SrvList}]),
    {noreply, State};
handle_info({main_role_move_back, SrvId, SrvList},
	    State) ->
    MainSrvId = sys_lib:srv_id(),
    case MainSrvId == SrvId of
      true ->
	  {MoveList, KeepList} =
	      merge_arena_cluster_role(SrvList),
	  d_ets_lib:save_d_ets(arena_cluster_role, MoveList),
	  d_ets_lib:save_d_ets(arena_cluster_role, KeepList),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr673, _,
	     {__Levelarena_cluster_mgr673,
	      __Tracesarena_cluster_mgr673}}
		when __Levelarena_cluster_mgr673 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr673 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 673},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("跨服竞技原服即是主服，迁移大小 ~w ~w",
					   [length(MoveList),
					    length(KeepList)]),
			     none, 4096, 64, __Levelarena_cluster_mgr673,
			     __Tracesarena_cluster_mgr673, lager_event,
			     __Pidarena_cluster_mgr673);
	    _ -> ok
	  end,
	  ets:delete_all_objects(arena_cluster_rank),
	  NextRank = do_init2(),
	  {noreply, State#state{next_rank = NextRank}};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr678, _,
	     {__Levelarena_cluster_mgr678,
	      __Tracesarena_cluster_mgr678}}
		when __Levelarena_cluster_mgr678 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr678 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 678},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w的数据需要迁移到~w，原大小~w",
					   [SrvList, SrvId,
					    ets:info(arena_cluster_role,
						     size)]),
			     none, 4096, 64, __Levelarena_cluster_mgr678,
			     __Tracesarena_cluster_mgr678, lager_event,
			     __Pidarena_cluster_mgr678);
	    _ -> ok
	  end,
	  {MoveList, KeepList} =
	      merge_arena_cluster_role(SrvList),
	  MoveName =
	      list_to_atom(lists:concat(["arena_cluster_role_move_",
					 bitstring_to_list(SrvId)])),
	  put(MoveName, MoveList),
	  erlang:send_after(util:rand(1, 180), self(),
			    {move_back_robot_to_local, SrvId, MoveName}),
	  [d_ets_lib:clear_d_ets(arena_cluster_role, DelId)
	   || #arena_cluster_role{id = DelId} <- MoveList],
	  ets:delete_all_objects(arena_cluster_rank),
	  d_ets_lib:save_d_ets(arena_cluster_role, KeepList),
	  NextRank = do_init2(),
	  {noreply, State#state{next_rank = NextRank}}
    end;
handle_info({move_back_robot_to_local, SrvId, MoveName},
	    State) ->
    case get(MoveName) of
      [PushRole = #arena_cluster_role{} | L] ->
	  {AddPushRole, NextL} = list_util:split(20, L),
	  cluster_lib:cast(SrvId, arena_cluster_mgr, info,
			   [{local_zone_update_robot,
			     [PushRole | AddPushRole]}]),
	  put(MoveName, NextL),
	  erlang:send_after(util:rand(50, 150), self(),
			    {move_back_robot_to_local, SrvId, MoveName});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr699, _,
	     {__Levelarena_cluster_mgr699,
	      __Tracesarena_cluster_mgr699}}
		when __Levelarena_cluster_mgr699 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr699 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 699},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w的本服数据迁移已完成", [SrvId]), none, 4096,
			     64, __Levelarena_cluster_mgr699,
			     __Tracesarena_cluster_mgr699, lager_event,
			     __Pidarena_cluster_mgr699);
	    _ -> ok
	  end,
	  ok
    end,
    {noreply, State};
handle_info({local_zone_update_robot,
	     PushList = [#arena_cluster_role{} | _]},
	    State) ->
    Fun = fun (PushRole = #arena_cluster_role{id =
						  RoleId}) ->
		  case ets:member(arena_cluster_role, RoleId) of
		    true ->
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
			  {__Pidarena_cluster_mgr708, _,
			   {__Levelarena_cluster_mgr708,
			    __Tracesarena_cluster_mgr708}}
			      when __Levelarena_cluster_mgr708 band 64 /= 0
				     orelse
				     __Tracesarena_cluster_mgr708 /= [] ->
			      lager:do_log(info,
					   [{module, arena_cluster_mgr},
					    {function, handle_info},
					    {line, 708},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("跨服竞技角色居然原本就有了 ~w",
							 [RoleId]),
					   none, 4096, 64,
					   __Levelarena_cluster_mgr708,
					   __Tracesarena_cluster_mgr708,
					   lager_event,
					   __Pidarena_cluster_mgr708);
			  _ -> ok
			end,
			skip;
		    _ -> d_ets_lib:save_d_ets(arena_cluster_role, PushRole)
		  end
	  end,
    lists:foreach(Fun, PushList),
    {noreply, State};
handle_info({move_to_new_main, NewMainSrvId}, State) ->
    SrvList = sys_lib:srv_full_id(),
    {MoveList, KeepList} =
	merge_arena_cluster_role(SrvList),
    put(arena_cluster_role_move_new_main, KeepList),
    erlang:send_after(util:rand(1, 180), self(),
		      {move_back_robot_to_new_main, NewMainSrvId}),
    [d_ets_lib:clear_d_ets(arena_cluster_role, DelId)
     || #arena_cluster_role{id = DelId} <- KeepList],
    ets:delete_all_objects(arena_cluster_rank),
    d_ets_lib:save_d_ets(arena_cluster_role, MoveList),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr726, _,
       {__Levelarena_cluster_mgr726,
	__Tracesarena_cluster_mgr726}}
	  when __Levelarena_cluster_mgr726 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr726 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 726}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("数据迁移到~w  大小 ~w ~w ",
				     [NewMainSrvId, length(MoveList),
				      length(KeepList)]),
		       none, 4096, 64, __Levelarena_cluster_mgr726,
		       __Tracesarena_cluster_mgr726, lager_event,
		       __Pidarena_cluster_mgr726);
      _ -> ok
    end,
    {noreply, State#state{status = 0}};
handle_info({move_back_robot_to_new_main, NewMainSrvId},
	    State) ->
    case get(arena_cluster_role_move_new_main) of
      [PushRole = #arena_cluster_role{} | L] ->
	  {AddPushRole, NextL} = list_util:split(20, L),
	  cluster_lib:cast(NewMainSrvId, arena_cluster_mgr, info,
			   [{new_main_update_robot, [PushRole | AddPushRole]}]),
	  put(arena_cluster_role_move_new_main, NextL),
	  erlang:send_after(util:rand(50, 150), self(),
			    {move_back_robot_to_new_main, NewMainSrvId});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_mgr738, _,
	     {__Levelarena_cluster_mgr738,
	      __Tracesarena_cluster_mgr738}}
		when __Levelarena_cluster_mgr738 band 64 /= 0 orelse
		       __Tracesarena_cluster_mgr738 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_mgr},
			      {function, handle_info}, {line, 738},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "新主服数据迁移已完成", none, 4096, 64,
			     __Levelarena_cluster_mgr738,
			     __Tracesarena_cluster_mgr738, lager_event,
			     __Pidarena_cluster_mgr738);
	    _ -> ok
	  end,
	  cluster_lib:cast(NewMainSrvId, arena_cluster_mgr, info,
			   [move_to_new_main_finish]),
	  ok
    end,
    {noreply, State};
handle_info({new_main_update_robot,
	     PushList = [#arena_cluster_role{} | _]},
	    State) ->
    Fun = fun (PushRole = #arena_cluster_role{id =
						  RoleId}) ->
		  case ets:member(arena_cluster_role, RoleId) of
		    true ->
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
			  {__Pidarena_cluster_mgr748, _,
			   {__Levelarena_cluster_mgr748,
			    __Tracesarena_cluster_mgr748}}
			      when __Levelarena_cluster_mgr748 band 64 /= 0
				     orelse
				     __Tracesarena_cluster_mgr748 /= [] ->
			      lager:do_log(info,
					   [{module, arena_cluster_mgr},
					    {function, handle_info},
					    {line, 748},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("跨服竞技角色居然原本就有了 ~w",
							 [RoleId]),
					   none, 4096, 64,
					   __Levelarena_cluster_mgr748,
					   __Tracesarena_cluster_mgr748,
					   lager_event,
					   __Pidarena_cluster_mgr748);
			  _ -> ok
			end,
			skip;
		    _ -> d_ets_lib:save_d_ets(arena_cluster_role, PushRole)
		  end
	  end,
    lists:foreach(Fun, PushList),
    {noreply, State};
handle_info(move_to_new_main_finish, State) ->
    Info = env_info(),
    NewInfo = Info#{is_main => 1},
    save_env_info(NewInfo),
    Status = maps:get(status, Info, 0),
    NextRank = do_init2(),
    erlang:send_after(10000, arena_cluster_mgr,
		      cluster_open),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr765, _,
       {__Levelarena_cluster_mgr765,
	__Tracesarena_cluster_mgr765}}
	  when __Levelarena_cluster_mgr765 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr765 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, handle_info},
			{line, 765}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("跨服竞技场迁移前~w 迁移后~w", [Info, NewInfo]),
		       none, 4096, 64, __Levelarena_cluster_mgr765,
		       __Tracesarena_cluster_mgr765, lager_event,
		       __Pidarena_cluster_mgr765);
      _ -> ok
    end,
    {noreply,
     State#state{next_rank = NextRank, is_main = 1,
		 status = Status}};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    Info = env_info(),
    save_env_info(Info#{status => 0}),
    dets:insert(arena_cluster_role,
		ets:tab2list(arena_cluster_role)),
    dets:insert(arena_cluster_role_bak,
		ets:tab2list(arena_cluster_role_bak)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr790, _,
       {__Levelarena_cluster_mgr790,
	__Tracesarena_cluster_mgr790}}
	  when __Levelarena_cluster_mgr790 band 64 /= 0 orelse
		 __Tracesarena_cluster_mgr790 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_mgr}, {function, terminate},
			{line, 790}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelarena_cluster_mgr790,
		       __Tracesarena_cluster_mgr790, lager_event,
		       __Pidarena_cluster_mgr790);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_init() ->
    d_ets_lib:load_dets_to_ets(arena_cluster_role,
			       arena_cluster_role, undefined),
    do_init2().

do_init2() ->
    Fun = fun (#arena_cluster_role{id = RoleId, rank = Rank,
				   score = Score},
	       Rank1) ->
		  case Rank > 0 of
		    true ->
			ets:insert(arena_cluster_rank,
				   #arena_cluster_rank{rank = Rank, id = RoleId,
						       score = Score});
		    _ -> skip
		  end,
		  max(Rank, Rank1)
	  end,
    ets:foldl(Fun, 0, arena_cluster_role) + 1.

update_rank(ArenaRole = #arena_cluster_role{id = RoleId,
					    name = Name, score = Score,
					    rank = 0},
	    ChangeScore, State = #state{next_rank = NextRank}) ->
    case Score <
	   arena_cluster_data:get_const(in_rank_min_score)
	of
      true -> update_ets(ArenaRole, ets), {noreply, State};
      false ->
	  {ok, #arena_cluster_role{rank = NewRank}} =
	      do_update_rank(ArenaRole#arena_cluster_role{rank =
							      NextRank},
			     ChangeScore),
	  role_lib:cast(by_id, RoleId,
			{arena_cluster, set_best_rank, [NewRank]}),
	  cluster_dynamic_group:group_cast(1, arena_cluster_mgr,
					   notice_first_rank,
					   [RoleId, Name, NewRank]),
	  {noreply,
	   State#state{next_rank = NextRank + 1,
		       last_time = date:unixtime()}}
    end;
update_rank(ArenaRole = #arena_cluster_role{id = RoleId,
					    name = Name, rank = OldRank},
	    ChangeScore, State = #state{next_rank = NextRank}) ->
    {ok, #arena_cluster_role{rank = NewRank}} =
	do_update_rank(ArenaRole, ChangeScore),
    case NewRank < OldRank andalso NewRank > 0 of
      true ->
	  cluster_dynamic_group:group_cast(1, arena_cluster_mgr,
					   notice_first_rank,
					   [RoleId, Name, NewRank]),
	  role_lib:cast(by_id, RoleId,
			{arena_cluster, set_best_rank, [NewRank]});
      _ ->
	  role_lib:cast(by_id, RoleId, {arena_cluster, push, []})
    end,
    NewNextRank = util:if_true(NewRank =:= 0, NextRank - 1,
			       NextRank),
    {noreply,
     State#state{next_rank = NewNextRank,
		 last_time = date:unixtime()}}.

do_update_rank(ArenaRole = #arena_cluster_role{rank =
						   1},
	       ChangeScore)
    when ChangeScore >= 0 ->
    update_ets(ArenaRole, ets), {ok, ArenaRole};
do_update_rank(ArenaRole = #arena_cluster_role{rank =
						   Rank,
					       score = Score},
	       ChangeScore)
    when ChangeScore >= 0 ->
    case ets:lookup(arena_cluster_rank, Rank - 1) of
      [#arena_cluster_rank{id = RoleId2, score = Score2}]
	  when Score > Score2 ->
	  ets:insert(arena_cluster_rank,
		     #arena_cluster_rank{rank = Rank, id = RoleId2,
					 score = Score2}),
	  ets:update_element(arena_cluster_role, RoleId2,
			     {#arena_cluster_role.rank, Rank}),
	  ets:insert(arena_cluster_update, {RoleId2}),
	  do_update_rank(ArenaRole#arena_cluster_role{rank =
							  Rank - 1},
			 ChangeScore);
      _ -> update_ets(ArenaRole, ets), {ok, ArenaRole}
    end;
do_update_rank(ArenaRole = #arena_cluster_role{rank =
						   Rank,
					       score = Score},
	       ChangeScore) ->
    case ets:lookup(arena_cluster_rank, Rank + 1) of
      [#arena_cluster_rank{id = RoleId2, score = Score2}]
	  when Score < Score2 ->
	  ets:insert(arena_cluster_rank,
		     #arena_cluster_rank{rank = Rank, id = RoleId2,
					 score = Score2}),
	  ets:update_element(arena_cluster_role, RoleId2,
			     {#arena_cluster_role.rank, Rank}),
	  ets:insert(arena_cluster_update, {RoleId2}),
	  do_update_rank(ArenaRole#arena_cluster_role{rank =
							  Rank + 1},
			 ChangeScore);
      _ ->
	  case Score >=
		 arena_cluster_data:get_const(in_rank_min_score)
	      of
	    true -> update_ets(ArenaRole, ets), {ok, ArenaRole};
	    false ->
		ets:delete(arena_cluster_rank, Rank),
		update_ets(ArenaRole#arena_cluster_role{rank = 0}, ets),
		{ok, ArenaRole#arena_cluster_role{rank = 0}}
	  end
    end.

season_reward(Rank) ->
    case arena_cluster_data:rank_reward(Rank) of
      Items = [_ | _] ->
	  case arena_cluster_lib:rank_role(Rank) of
	    {ok, #arena_cluster_role{id = {_, <<"robot">>}}} ->
		season_reward(Rank + 1);
	    {ok, #arena_cluster_role{id = {_, <<>>}}} ->
		season_reward(Rank + 1);
	    {ok, #arena_cluster_role{id = RoleId = {_, Sid}}} ->
		mail:send(RoleId,
			  {lang:get(<<"跨服竞技场赛季结算排名奖励"/utf8>>),
			   color:msg(lang:get(<<"尊敬的冒险者，您在本赛季跨服竞技场中获得~ts名的名次，获得下列的排名奖励！请再接再厉！ヾ"
						"（≧∇≦）〃"/utf8>>),
				     [{green, Rank}]),
			   items, Items, <<"跨服竞技场"/utf8>>}),
		catch cluster_lib:cast(Sid, role_weekly_mgr, info,
				       [{arena_cluster_rank, RoleId, Rank}]),
		season_reward(Rank + 1);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_mgr881, _,
		   {__Levelarena_cluster_mgr881,
		    __Tracesarena_cluster_mgr881}}
		      when __Levelarena_cluster_mgr881 band 8 /= 0 orelse
			     __Tracesarena_cluster_mgr881 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster_mgr},
				    {function, season_reward}, {line, 881},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("跨服竞技场的奖励在[~w]名次停止发送", [Rank]),
				   none, 4096, 8, __Levelarena_cluster_mgr881,
				   __Tracesarena_cluster_mgr881, lager_event,
				   __Pidarena_cluster_mgr881);
		  _ -> ok
		end,
		ok
	  end;
      _ -> ok
    end.

merge_arena_cluster_role(SrvList) ->
    L = ets:tab2list(arena_cluster_role),
    merge_arena_cluster_role(L, [], [], SrvList).

merge_arena_cluster_role([], MoveList, KeepList,
			 _SrvList) ->
    KeepListT =
	lists:reverse(lists:keysort(#arena_cluster_role.score,
				    KeepList)),
    NewKeepList = merge_arena_cluster_rank(KeepListT, 1,
					   []),
    {MoveList, NewKeepList};
merge_arena_cluster_role([R = #arena_cluster_role{id =
						      {_, SrvId}}
			  | Other],
			 MoveList, KeepList, SrvList) ->
    case lists:member(SrvId, SrvList) of
      true ->
	  NewR = R#arena_cluster_role{rank = 0},
	  NewMoveList = [NewR | MoveList],
	  merge_arena_cluster_role(Other, NewMoveList, KeepList,
				   SrvList);
      _ ->
	  NewKeepList = [R | KeepList],
	  merge_arena_cluster_role(Other, MoveList, NewKeepList,
				   SrvList)
    end.

merge_arena_cluster_rank([], _NowRank, KeepList) ->
    KeepList;
merge_arena_cluster_rank([R = #arena_cluster_role{rank =
						      0}
			  | Other],
			 NowRank, KeepList) ->
    merge_arena_cluster_rank(Other, NowRank,
			     [R | KeepList]);
merge_arena_cluster_rank([R = #arena_cluster_role{}
			  | Other],
			 NowRank, KeepList) ->
    merge_arena_cluster_rank(Other, NowRank + 1,
			     [R#arena_cluster_role{rank = NowRank} | KeepList]).

send_info(M, F, A) ->
    case env_info() of
      #{server_type := cluster} ->
	  cluster_dynamic_group:cast_main(1, M, F, A);
      #{server_type := merge} -> catch apply(M, F, A);
      #{server_type := ready_cluster} -> catch apply(M, F, A);
      _ -> {false, lang:get(<<"跨服竞技场并没有开启"/utf8>>)}
    end.

send_call(M, F, A) ->
    case env_info() of
      #{server_type := cluster} ->
	  cluster_dynamic_group:call_main(1, M, F, A);
      #{server_type := merge} -> catch apply(M, F, A);
      #{server_type := ready_cluster} -> catch apply(M, F, A);
      _ -> {false, lang:get(<<"跨服竞技场并没有开启"/utf8>>)}
    end.

load() ->
    MinLev = arena_cluster_data:get_const(lev_limt),
    case
      db:get_all("select rid, srv_id, name, lev, max_power, "
		 "face_id from role where lev >= ? ",
		 [MinLev], 60000)
	of
      {ok, L} -> do_load(L, []);
      _ -> []
    end.

do_load([], L) -> L;
do_load([[Rid, SrvId, Name, Lev, Power, FaceId] | T],
	L) ->
    PartnerNum = get_partner_num({Rid, SrvId}),
    case PartnerNum > 10 of
      true ->
	  LookId =
	      util:rand_list(arena_cluster_data:get_const(robot_body)),
	  R = #arena_cluster_role{id = {Rid, SrvId}, name = Name,
				  lev = Lev, power = Power, max_power = Power,
				  face = FaceId, lookid = LookId,
				  score =
				      arena_cluster_data:get_const(init_score)},
	  do_load(T, [R | L]);
      _ -> do_load(T, L)
    end.

get_partner_num(Id) ->
    case role_robot:get_role(Id) of
      {ok, #role_robot{partners = List}} -> length(List);
      _ -> 1
    end.

season_reset([]) -> ok;
season_reset([R = #arena_cluster_role{} | T]) ->
    NewR = R#arena_cluster_role{score =
				    arena_cluster_data:get_const(init_score),
				rank = 0, cont_win = 0},
    update_ets(NewR, all),
    season_reset(T);
season_reset([_R | T]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_mgr975, _,
       {__Levelarena_cluster_mgr975,
	__Tracesarena_cluster_mgr975}}
	  when __Levelarena_cluster_mgr975 band 8 /= 0 orelse
		 __Tracesarena_cluster_mgr975 /= [] ->
	  lager:do_log(error,
		       [{module, arena_cluster_mgr}, {function, season_reset},
			{line, 975}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的数据结构在跨服竞技场重置 ~w", [_R]), none, 4096,
		       8, __Levelarena_cluster_mgr975,
		       __Tracesarena_cluster_mgr975, lager_event,
		       __Pidarena_cluster_mgr975);
      _ -> ok
    end,
    season_reset(T).

notice_cont_win(RoleId, Name, ContWin) ->
    case ContWin >= 5 andalso ContWin rem 5 == 0 of
      true ->
	  notice:broadcast(rumor_left_top,
			   color:msg(lang:get(<<"~ts已经在跨服竞技场中连胜~ts场，简直是战神附体！~ts"/utf8>>),
				     [{kf_name, RoleId, Name}, {green, ContWin},
				      {href,
				       {58, green, [],
					lang:get(<<"【前往挑战】"/utf8>>)}}]));
      _ -> skip
    end.

notice_first_rank(RoleId, Name, Rank) ->
    case Rank == 1 of
      true ->
	  notice:broadcast(rumor_left_top,
			   color:msg(lang:get(<<"不得了了！~ts达到了跨服竞技场的第一名！快来膜拜大神吧 ~ts"/utf8>>),
				     [{kf_name, RoleId, Name},
				      {href,
				       {59, green, [],
					lang:get(<<"【前往围观】"/utf8>>)}}]));
      _ -> skip
    end.

do_save_update([]) -> skip;
do_save_update([{RoleId} | T]) ->
    case arena_cluster_lib:get_role(RoleId) of
      {ok, ArenaRole = #arena_cluster_role{}} ->
	  dets:insert(arena_cluster_role, ArenaRole);
      _ -> skip
    end,
    do_save_update(T).

merge_main_role_move_back(_Args) ->
    SrvId = sys_lib:srv_id(),
    SrvList = sys_lib:srv_full_id(),
    send_info(arena_cluster_mgr, info,
	      [{main_role_move_back, SrvId, SrvList}]),
    ok.

move_to_new_main(Maps) ->
    NewMain = maps:get(new_main, Maps, undefined),
    case NewMain of
      #cluster_dynamic_srv{main_srv = NewMainSrvId} ->
	  arena_cluster_mgr:info({move_to_new_main,
				  NewMainSrvId}),
	  ok;
      _ -> false
    end.


