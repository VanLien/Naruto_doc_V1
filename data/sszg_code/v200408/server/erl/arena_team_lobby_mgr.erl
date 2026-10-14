-file("data/arena_team_lobby_mgr.erl", 1).

-file("src/mod/arena_team/arena_team_lobby_mgr.erl", 1).

-module(arena_team_lobby_mgr).

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
		{arena_team_arge,
		 [result, win_count, lose_count, a_team_id, a_score,
		  a_new_score, a_rank, a_new_rank, a_team_members,
		  a_team_name, b_team_id, b_score, b_new_score, b_rank,
		  b_new_rank, b_team_name, b_team_members,
		  all_hurt_statistics, extra]},
		{arena_team_replay_partner,
		 [pos, bid, lev, star, skin_id, ext]},
		{arena_team_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_team_log,
		 [id, atk_id, atk_name, a_score, a_new_score, a_rank,
		  a_new_rank, a_team_members, a_team_power, b_team_id,
		  b_score, b_new_score, b_rank, b_new_rank, b_team_name,
		  b_team_members, b_team_power, ret, win_count,
		  lose_count, replay_list, time]},
		{role_arena_team_log, [id, list]},
		{arena_term_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  dower_skill, set_skill, attr, extra]},
		{arena_team_defense,
		 [order, role_id, role_lev, formation_type, hallows_id,
		  hallows_lev, hallows_skill_lev, partner_infos,
		  hallows_look_id, hallows_lucky, hallows_seal,
		  hallows_refine, hallows_all_look_ids, sprite_lev,
		  sprites, sprites_attr, extra, break_groups]},
		{arena_team_rival,
		 [id, leader_id, team_name, team_power, team_rank,
		  team_score, team_members, defense, ext]},
		{arena_team_partner,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  ext]},
		{arena_team_member,
		 [id, name, lev, face_id, avatar_bid, power, pos,
		  is_hide, team_partner, formation_type, hallows_id,
		  sprite_lev, sprites, ext, face_update_time, face_file,
		  break_groups]},
		{c_arena_team,
		 [ver, id, rank, score, team_match_power, score_time,
		  ext, members]},
		{arena_team,
		 [ver, id, creat_id, leader_id, leader_name, team_pid,
		  team_name, team_limit_power, team_limit_lev,
		  team_is_check, team_power, team_match_power,
		  team_members, join_list, is_sign, join_num, rival_info,
		  count, add_time, combat_count]},
		{m_arena_team,
		 [ver, period, team_id, combat_count, award_list,
		  old_data, point_info]},
		{state, [next_id, srv_id]}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_team_list/1]).

-record(state, {next_id = 1, srv_id = <<>>}).

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

-file("src/mod/arena_team/arena_team_lobby_mgr.erl",
      16).

-file("inc/arena_team.hrl", 1).

-record(m_arena_team,
	{ver = 4, period = 0, team_id = {0, <<>>},
	 combat_count = 0, award_list = [], old_data = [],
	 point_info = []}).

-record(arena_team,
	{ver = 1, id = {0, <<>>}, creat_id = {0, <<>>},
	 leader_id = {0, <<>>}, leader_name = <<>>, team_pid = 0,
	 team_name = <<>>, team_limit_power = 0,
	 team_limit_lev = 0, team_is_check = 0, team_power = 0,
	 team_match_power = 0, team_members = [], join_list = [],
	 is_sign = 0, join_num = 1, rival_info = [], count = 0,
	 add_time = 0, combat_count = 0}).

-record(c_arena_team,
	{ver = 1, id = {0, <<>>}, rank = 0, score = 1000,
	 team_match_power = 0, score_time = 0, ext = [],
	 members = []}).

-record(arena_team_member,
	{id = {0, <<>>}, name = <<>>, lev = 0, face_id = 0,
	 avatar_bid = 0, power = 0, pos = 0, is_hide = 0,
	 team_partner = [], formation_type = 1, hallows_id = 0,
	 sprite_lev = 0, sprites = [], ext = [],
	 face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(arena_team_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, ext = []}).

-record(arena_team_rival,
	{id = {0, <<>>}, leader_id = {0, <<>>},
	 team_name = <<>>, team_power = 0, team_rank = 0,
	 team_score = 0, team_members = [], defense = [],
	 ext = []}).

-record(arena_team_defense,
	{order, role_id, role_lev, formation_type, hallows_id,
	 hallows_lev, hallows_skill_lev, partner_infos,
	 hallows_look_id, hallows_lucky, hallows_seal,
	 hallows_refine, hallows_all_look_ids = [],
	 sprite_lev = 0, sprites = [], sprites_attr, extra = [],
	 break_groups = []}).

-record(arena_term_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(role_arena_team_log,
	{id = {0, <<>>}, list = []}).

-record(arena_team_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 a_score = 0, a_new_score = 0, a_rank = 0,
	 a_new_rank = 0, a_team_members = [], a_team_power = 0,
	 b_team_id = {0, <<>>}, b_score = 0, b_new_score = 0,
	 b_rank = 0, b_new_rank = 0, b_team_name = <<>>,
	 b_team_members = [], b_team_power = 0, ret = 1,
	 win_count = 0, lose_count = 0, replay_list = [],
	 time = 0}).

-record(arena_team_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_team_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, skin_id = 0,
	 ext = []}).

-record(arena_team_arge,
	{result = 0, win_count = 0, lose_count = 0,
	 a_team_id = {0, <<>>}, a_score = 0, a_new_score = 0,
	 a_rank = 0, a_new_rank = 0, a_team_members = [],
	 a_team_name = 0, b_team_id = {0, <<>>}, b_score = 0,
	 b_new_score = 0, b_rank = 0, b_new_rank = 0,
	 b_team_name = 0, b_team_members = [],
	 all_hurt_statistics = [], extra = []}).

-file("src/mod/arena_team/arena_team_lobby_mgr.erl",
      17).

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

-file("src/mod/arena_team/arena_team_lobby_mgr.erl",
      18).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/arena_team/arena_team_lobby_mgr.erl",
      19).

-spec get_team_list(#role{}) -> list().

get_team_list(_Role = #role{lev = Lev, power = Power,
			    m_arena_team = #m_arena_team{team_id = TeamId}}) ->
    Fun1 = [{{arena_team, '_', '$3', '_', '_', '_', '_',
	      '_', '$4', '$5', '_', '_', '_', '_', '_', '$1', '$2',
	      '_', '_', '_', '_'},
	     [{'andalso', {'==', '$1', 0},
	       {'andalso', {'=/=', '$3', {const, TeamId}},
		{'andalso', {'<', '$2', 3},
		 {'andalso', {'>=', {const, Power}, '$4'},
		  {'>=', {const, Lev}, '$5'}}}}}],
	     ['$_']}],
    Fun2 = [{{arena_team, '_', '$3', '_', '_', '_', '_',
	      '_', '$4', '$5', '_', '_', '_', '_', '_', '$1', '$2',
	      '_', '_', '_', '_'},
	     [{'andalso', {'==', '$1', 0},
	       {'andalso', {'=/=', '$3', {const, TeamId}},
		{'andalso', {'<', '$2', 3},
		 {'orelse',
		  {'andalso', {'>=', {const, Power}, '$4'},
		   {'<', {const, Lev}, '$5'}},
		  {'andalso', {'<', {const, Power}, '$4'},
		   {'>=', {const, Lev}, '$5'}}}}}}],
	     ['$_']}],
    Fun3 = [{{arena_team, '_', '$3', '_', '_', '_', '_',
	      '_', '$4', '$5', '_', '_', '_', '_', '_', '$1', '$2',
	      '_', '_', '_', '_'},
	     [{'andalso', {'==', '$1', 0},
	       {'andalso', {'=/=', '$3', {const, TeamId}},
		{'andalso', {'<', '$2', 3},
		 {'andalso', {'<', {const, Power}, '$4'},
		  {'<', {const, Lev}, '$5'}}}}}],
	     ['$_']}],
    Fun4 = [{{arena_team, '_', '$3', '_', '_', '_', '_',
	      '_', '_', '_', '_', '_', '_', '_', '_', '$1', '$2', '_',
	      '_', '_', '_'},
	     [{'andalso', {'==', '$1', 0},
	       {'andalso', {'=/=', '$3', {const, TeamId}},
		{'>=', '$2', 3}}}],
	     ['$_']}],
    L1 = get_team_list(Fun1, 50),
    L2 = L1 ++ get_team_list(Fun2, 50 - length(L1)),
    L3 = L2 ++ get_team_list(Fun3, 50 - length(L2)),
    L3 ++ get_team_list(Fun4, 50 - length(L3)).

get_team_list(_Fun, Num) when Num =< 0 -> [];
get_team_list(Fun, Num) when Num > 0 ->
    case ets:select(arena_team_list, Fun, Num) of
      {MatchL = [_ | _], _} -> MatchL;
      _ -> []
    end.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> arena_team_lobby_mgr ! Info.

cast(Info) ->
    gen_server:cast(arena_team_lobby_mgr, Info).

call(Info) ->
    case catch gen_server:call(arena_team_lobby_mgr, Info,
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
	    {__Pidarena_team_lobby_mgr78, _,
	     {__Levelarena_team_lobby_mgr78,
	      __Tracesarena_team_lobby_mgr78}}
		when __Levelarena_team_lobby_mgr78 band 8 /= 0 orelse
		       __Tracesarena_team_lobby_mgr78 /= [] ->
		lager:do_log(error,
			     [{module, arena_team_lobby_mgr}, {function, call},
			      {line, 78}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_team_lobby_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_team_lobby_mgr78,
			     __Tracesarena_team_lobby_mgr78, lager_event,
			     __Pidarena_team_lobby_mgr78);
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
    gen_server:start_link({local, arena_team_lobby_mgr},
			  arena_team_lobby_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_lobby_mgr84, _,
       {__Levelarena_team_lobby_mgr84,
	__Tracesarena_team_lobby_mgr84}}
	  when __Levelarena_team_lobby_mgr84 band 64 /= 0 orelse
		 __Tracesarena_team_lobby_mgr84 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_lobby_mgr}, {function, init},
			{line, 84}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [arena_team_lobby_mgr]),
		       none, 4096, 64, __Levelarena_team_lobby_mgr84,
		       __Tracesarena_team_lobby_mgr84, lager_event,
		       __Pidarena_team_lobby_mgr84);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(arena_team_list,
			"dets/arena_team_list.dets", #arena_team.id, set),
    d_ets_lib:load_dets_to_ets(arena_team_list, undefined),
    d_ets_lib:new_d_ets(arena_team_msg,
			"dets/arena_team_msg.dets", 1, set),
    d_ets_lib:new_d_ets(arena_team_log,
			"dets/arena_team_log.dets", 1, set),
    d_ets_lib:load_dets_to_ets(arena_team_log, undefined),
    d_ets_lib:new_ets(arena_role_team, 1, set),
    ets:new(arena_team_pid,
	    [set, named_table, public, {keypos, 1}]),
    d_ets_lib:new_d_ets(arena_team_invite,
			"dets/arena_team_invite.dets", 1, set),
    d_ets_lib:new_d_ets(arena_team_join,
			"dets/arena_team_join.dets", 1, set),
    do_init(),
    NextId = sys_env:get(arena_team_next_id, 1),
    State = #state{next_id = NextId,
		   srv_id = sys_env:get(server_id)},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_lobby_mgr114, _,
       {__Levelarena_team_lobby_mgr114,
	__Tracesarena_team_lobby_mgr114}}
	  when __Levelarena_team_lobby_mgr114 band 64 /= 0 orelse
		 __Tracesarena_team_lobby_mgr114 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_lobby_mgr}, {function, init},
			{line, 114}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [arena_team_lobby_mgr]),
		       none, 4096, 64, __Levelarena_team_lobby_mgr114,
		       __Tracesarena_team_lobby_mgr114, lager_event,
		       __Pidarena_team_lobby_mgr114);
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
	    {__Pidarena_team_lobby_mgr122, _,
	     {__Levelarena_team_lobby_mgr122,
	      __Tracesarena_team_lobby_mgr122}}
		when __Levelarena_team_lobby_mgr122 band 8 /= 0 orelse
		       __Tracesarena_team_lobby_mgr122 /= [] ->
		lager:do_log(error,
			     [{module, arena_team_lobby_mgr},
			      {function, handle_call}, {line, 122},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelarena_team_lobby_mgr122,
			     __Tracesarena_team_lobby_mgr122, lager_event,
			     __Pidarena_team_lobby_mgr122);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    arena_team_lobby_mgr, 123, _Reason}),
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
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
	    {__Pidarena_team_lobby_mgr135, _,
	     {__Levelarena_team_lobby_mgr135,
	      __Tracesarena_team_lobby_mgr135}}
		when __Levelarena_team_lobby_mgr135 band 8 /= 0 orelse
		       __Tracesarena_team_lobby_mgr135 /= [] ->
		lager:do_log(error,
			     [{module, arena_team_lobby_mgr},
			      {function, handle_info}, {line, 135},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelarena_team_lobby_mgr135,
			     __Tracesarena_team_lobby_mgr135, lager_event,
			     __Pidarena_team_lobby_mgr135);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    arena_team_lobby_mgr, 136, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_lobby_mgr141, _,
       {__Levelarena_team_lobby_mgr141,
	__Tracesarena_team_lobby_mgr141}}
	  when __Levelarena_team_lobby_mgr141 band 64 /= 0 orelse
		 __Tracesarena_team_lobby_mgr141 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_lobby_mgr}, {function, terminate},
			{line, 141}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelarena_team_lobby_mgr141,
		       __Tracesarena_team_lobby_mgr141, lager_event,
		       __Pidarena_team_lobby_mgr141);
      _ -> ok
    end,
    ets:to_dets(arena_team_invite, arena_team_invite),
    ets:to_dets(arena_team_join, arena_team_join),
    ets:to_dets(arena_team_msg, arena_team_msg),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_init() ->
    Fun = fun (Team = #arena_team{team_name = Name}, Acc) ->
		  {ok, _Pid} = arena_team:start_link(Team), [Name | Acc]
	  end,
    NameList = dets:foldl(Fun, [], arena_team_list),
    put(arena_team_list_name, NameList),
    self() ! {save_list_name, NameList}.

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
	    {__Pidarena_team_lobby_mgr171, _,
	     {__Levelarena_team_lobby_mgr171,
	      __Tracesarena_team_lobby_mgr171}}
		when __Levelarena_team_lobby_mgr171 band 8 /= 0 orelse
		       __Tracesarena_team_lobby_mgr171 /= [] ->
		lager:do_log(error,
			     [{module, arena_team_lobby_mgr},
			      {function, do_handle_call}, {line, 171},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelarena_team_lobby_mgr171,
			     __Tracesarena_team_lobby_mgr171, lager_event,
			     __Pidarena_team_lobby_mgr171);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    arena_team_lobby_mgr, 172, _Reason}),
	  {reply, {false, lang:get(<<"lỗi thực thi"/utf8>>)},
	   State}
    end;
do_handle_call({creat,
		Team = #arena_team{creat_id = RoleId,
				   team_name = Name}},
	       _From,
	       State = #state{next_id = NextId, srv_id = SrvId}) ->
    case arena_team_db:get_role_team_id(RoleId) of
      TeamId when TeamId =/= {0, <<>>} ->
	  {reply, {false, lang:get(<<"Đội đã tồn tại"/utf8>>)},
	   State};
      _ ->
	  TnameStr =
	      list_to_binary(string:to_upper(binary_to_list(Name))),
	  case get({team_name, TnameStr}) of
	    undefined ->
		Tid = {NextId, SrvId},
		NewTeam = Team#arena_team{id = Tid},
		case arena_team:start_link(NewTeam) of
		  {ok, TeamPid} ->
		      put({team_name, TnameStr}, 1),
		      arena_team_mgr:cluster_info(all, arena_team_lobby_mgr,
						  info, [{save_name, Name}]),
		      NNextId = NextId + 1,
		      sys_env:save(arena_team_next_id, NNextId),
		      {reply, {ok, TeamPid, Tid},
		       State#state{next_id = NNextId}};
		  Err ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidarena_team_lobby_mgr194, _,
			 {__Levelarena_team_lobby_mgr194,
			  __Tracesarena_team_lobby_mgr194}}
			    when __Levelarena_team_lobby_mgr194 band 8 /= 0
				   orelse
				   __Tracesarena_team_lobby_mgr194 /= [] ->
			    lager:do_log(error,
					 [{module, arena_team_lobby_mgr},
					  {function, do_handle_call},
					  {line, 194},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("创建队伍时启动失败:~w", [Err]),
					 none, 4096, 8,
					 __Levelarena_team_lobby_mgr194,
					 __Tracesarena_team_lobby_mgr194,
					 lager_event,
					 __Pidarena_team_lobby_mgr194);
			_ -> ok
		      end,
		      {reply,
		       {false, lang:get(<<"Tạo nhóm không thành công"/utf8>>)},
		       State}
		end;
	    _ ->
		{reply,
		 {false,
		  lang:get(<<"Một đội có cùng tên đã tồn tại"/utf8>>)},
		 State}
	  end
    end;
do_handle_call({creat, Team}, _From,
	       State = #state{next_id = NextId, srv_id = SrvId}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_lobby_mgr202, _,
       {__Levelarena_team_lobby_mgr202,
	__Tracesarena_team_lobby_mgr202}}
	  when __Levelarena_team_lobby_mgr202 band 8 /= 0 orelse
		 __Tracesarena_team_lobby_mgr202 /= [] ->
	  lager:do_log(error,
		       [{module, arena_team_lobby_mgr},
			{function, do_handle_call}, {line, 202},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("创建队伍时启动失败:~w", [Team]), none, 4096, 8,
		       __Levelarena_team_lobby_mgr202,
		       __Tracesarena_team_lobby_mgr202, lager_event,
		       __Pidarena_team_lobby_mgr202);
      _ -> ok
    end,
    {reply,
     {false, lang:get(<<"Tạo nhóm không thành công"/utf8>>)},
     State};
do_handle_call({rename, Name, OldName}, _From, State) ->
    TnameStr =
	list_to_binary(string:to_upper(binary_to_list(Name))),
    case get({team_name, TnameStr}) of
      undefined ->
	  OldTnameStr =
	      list_to_binary(string:to_upper(binary_to_list(OldName))),
	  put({team_name, TnameStr}, 1),
	  erase({team_name, OldTnameStr}),
	  arena_team_mgr:cluster_info(all, arena_team_lobby_mgr,
				      info, [{save_name, Name, OldName}]),
	  {reply, ok, State};
      _ ->
	  {reply,
	   {false,
	    lang:get(<<"Một đội có cùng tên đã tồn tại"/utf8>>)},
	   State}
    end;
do_handle_call({check_join, RoleId, TeamId, Type},
	       _From, State) ->
    case arena_team_db:get_role_team_id(RoleId) of
      TeamId ->
	  {reply, {false, lang:get(<<"Đã ở trong đội"/utf8>>)},
	   State};
      MyTeamId
	  when MyTeamId =/= {0, <<>>} andalso
		 Type == team_join_apply ->
	  {reply,
	   {false,
	    lang:get(<<"Người chơi này đã ở trong đội"/utf8>>)},
	   State};
      MyTeamId when MyTeamId =/= {0, <<>>} ->
	  {reply,
	   {false, lang:get(<<"Bạn đã ở trong hàng đợi"/utf8>>)},
	   State};
      _ ->
	  arena_team_db:update_ets(arena_role_team,
				   {RoleId, TeamId}, ets),
	  arena_team_db:update_ets(arena_team_invite, RoleId,
				   del),
	  {reply, ok, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({team_invite, TeamId, TarRoleId},
	       State) ->
    case arena_team_db:get_role_team_id(TarRoleId) of
      TarTeamId when TarTeamId =/= {0, <<>>} -> skip;
      _ ->
	  OldList = arena_team_db:get_team_invite(TarRoleId),
	  {NewList, _} = list_util:split(50,
					 [TeamId | lists:delete(TeamId,
								OldList)]),
	  arena_team_db:update_ets(arena_team_invite,
				   {TarRoleId, NewList}, ets),
	  role_lib:cast(by_id, TarRoleId,
			{arena_team_member, apply_handle, [new_team_invite]})
    end,
    {noreply, State};
do_handle_info({del_team_invite, RoleId, TeamId},
	       State) ->
    OldList = arena_team_db:get_team_invite(RoleId),
    arena_team_db:update_ets(arena_team_invite,
			     {RoleId, lists:delete(TeamId, OldList)}, ets),
    {noreply, State};
do_handle_info(start_count_time, State) ->
    L = ets:tab2list(arena_team_pid),
    [Pid ! start_count_time || {_, Pid} <- L],
    {noreply, State};
do_handle_info(del_count_time, State) ->
    L = ets:tab2list(arena_team_pid),
    [Pid ! del_count_time || {_, Pid} <- L],
    {noreply, State};
do_handle_info({team_quit, TeamId, TeamName}, State) ->
    arena_team_db:update_ets(arena_team_list, TeamId, del),
    ets:delete(arena_team_pid, TeamId),
    TnameStr =
	list_to_binary(string:to_upper(binary_to_list(TeamName))),
    erase({team_name, TnameStr}),
    arena_team_mgr:cluster_info(all, arena_team_lobby_mgr,
				info, [{save_name, del, TnameStr}]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_lobby_mgr272, _,
       {__Levelarena_team_lobby_mgr272,
	__Tracesarena_team_lobby_mgr272}}
	  when __Levelarena_team_lobby_mgr272 band 128 /= 0 orelse
		 __Tracesarena_team_lobby_mgr272 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_lobby_mgr},
			{function, do_handle_info}, {line, 272},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("队伍退出~w", [TeamId]), none, 4096, 128,
		       __Levelarena_team_lobby_mgr272,
		       __Tracesarena_team_lobby_mgr272, lager_event,
		       __Pidarena_team_lobby_mgr272);
      _ -> ok
    end,
    {noreply, State};
do_handle_info({save_name, del, DelName}, State) ->
    TnameStr =
	list_to_binary(string:to_upper(binary_to_list(DelName))),
    erase({team_name, TnameStr}),
    {noreply, State};
do_handle_info({save_name, TeamName, DelName}, State) ->
    TnameStr =
	list_to_binary(string:to_upper(binary_to_list(TeamName))),
    put({team_name, TnameStr}, true),
    TnameStr2 =
	list_to_binary(string:to_upper(binary_to_list(DelName))),
    erase({team_name, TnameStr2}),
    {noreply, State};
do_handle_info({save_name, TeamName}, State) ->
    TnameStr =
	list_to_binary(string:to_upper(binary_to_list(TeamName))),
    put({team_name, TnameStr}, true),
    {noreply, State};
do_handle_info({save_list_name, NameList}, State) ->
    [begin
       TnameStr =
	   list_to_binary(string:to_upper(binary_to_list(TeamName))),
       put({team_name, TnameStr}, true)
     end
     || TeamName <- NameList],
    {noreply, State};
do_handle_info(cluster_main, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_lobby_mgr299, _,
       {__Levelarena_team_lobby_mgr299,
	__Tracesarena_team_lobby_mgr299}}
	  when __Levelarena_team_lobby_mgr299 band 64 /= 0 orelse
		 __Tracesarena_team_lobby_mgr299 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_lobby_mgr},
			{function, do_handle_info}, {line, 299},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "主服连接成功 同步队伍名", none, 4096, 64,
		       __Levelarena_team_lobby_mgr299,
		       __Tracesarena_team_lobby_mgr299, lager_event,
		       __Pidarena_team_lobby_mgr299);
      _ -> ok
    end,
    case get(arena_team_list_name) of
      NameList = [_ | _] ->
	  arena_team_mgr:cluster_info(all, arena_team_lobby_mgr,
				      info, [{save_list_name, NameList}]);
      _ -> ok
    end,
    {noreply, State};
do_handle_info(close_all_team, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_lobby_mgr308, _,
       {__Levelarena_team_lobby_mgr308,
	__Tracesarena_team_lobby_mgr308}}
	  when __Levelarena_team_lobby_mgr308 band 64 /= 0 orelse
		 __Tracesarena_team_lobby_mgr308 /= [] ->
	  lager:do_log(info,
		       [{module, arena_team_lobby_mgr},
			{function, do_handle_info}, {line, 308},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "大厅正在关闭所有队伍", none, 4096, 64,
		       __Levelarena_team_lobby_mgr308,
		       __Tracesarena_team_lobby_mgr308, lager_event,
		       __Pidarena_team_lobby_mgr308);
      _ -> ok
    end,
    L = ets:tab2list(arena_team_pid),
    [Pid ! {stop, normal} || {_, Pid} <- L],
    ets:delete_all_objects(arena_team_pid),
    ets:delete_all_objects(arena_team_list),
    dets:delete_all_objects(arena_team_list),
    ets:delete_all_objects(arena_team_msg),
    dets:delete_all_objects(arena_team_msg),
    ets:delete_all_objects(arena_team_invite),
    dets:delete_all_objects(arena_team_invite),
    ets:delete_all_objects(arena_team_join),
    dets:delete_all_objects(arena_team_join),
    {noreply, State};
do_handle_info({'EXIT', Pid, Reason}, State)
    when Reason =/= normal ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_lobby_mgr334, _,
       {__Levelarena_team_lobby_mgr334,
	__Tracesarena_team_lobby_mgr334}}
	  when __Levelarena_team_lobby_mgr334 band 8 /= 0 orelse
		 __Tracesarena_team_lobby_mgr334 /= [] ->
	  lager:do_log(error,
		       [{module, arena_team_lobby_mgr},
			{function, do_handle_info}, {line, 334},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("收到队伍异常退出信息:~w", [Reason]), none, 4096, 8,
		       __Levelarena_team_lobby_mgr334,
		       __Tracesarena_team_lobby_mgr334, lager_event,
		       __Pidarena_team_lobby_mgr334);
      _ -> ok
    end,
    case arena_team_db:get_team_by_pid(Pid) of
      {ok, Team = #arena_team{team_name = Tname}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_lobby_mgr337, _,
	     {__Levelarena_team_lobby_mgr337,
	      __Tracesarena_team_lobby_mgr337}}
		when __Levelarena_team_lobby_mgr337 band 8 /= 0 orelse
		       __Tracesarena_team_lobby_mgr337 /= [] ->
		lager:do_log(error,
			     [{module, arena_team_lobby_mgr},
			      {function, do_handle_info}, {line, 337},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("收到队伍[~ts]异常退出信息:~w",
					   [Tname, Reason]),
			     none, 4096, 8, __Levelarena_team_lobby_mgr337,
			     __Tracesarena_team_lobby_mgr337, lager_event,
			     __Pidarena_team_lobby_mgr337);
	    _ -> ok
	  end,
	  case arena_team:start_link(Team) of
	    {ok, _Tpid} -> ok;
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_team_lobby_mgr340, _,
		   {__Levelarena_team_lobby_mgr340,
		    __Tracesarena_team_lobby_mgr340}}
		      when __Levelarena_team_lobby_mgr340 band 8 /= 0 orelse
			     __Tracesarena_team_lobby_mgr340 /= [] ->
		      lager:do_log(error,
				   [{module, arena_team_lobby_mgr},
				    {function, do_handle_info}, {line, 340},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("重启队伍[~ts]失败:~w",
						 [Tname, _Err]),
				   none, 4096, 8,
				   __Levelarena_team_lobby_mgr340,
				   __Tracesarena_team_lobby_mgr340, lager_event,
				   __Pidarena_team_lobby_mgr340);
		  _ -> ok
		end
	  end;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_team_lobby_mgr343, _,
	     {__Levelarena_team_lobby_mgr343,
	      __Tracesarena_team_lobby_mgr343}}
		when __Levelarena_team_lobby_mgr343 band 8 /= 0 orelse
		       __Tracesarena_team_lobby_mgr343 /= [] ->
		lager:do_log(error,
			     [{module, arena_team_lobby_mgr},
			      {function, do_handle_info}, {line, 343},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("接收到队伍异常退出信息 不能重启, 原因:~w 队伍:~w",
					   [Reason, _Err]),
			     none, 4096, 8, __Levelarena_team_lobby_mgr343,
			     __Tracesarena_team_lobby_mgr343, lager_event,
			     __Pidarena_team_lobby_mgr343);
	    _ -> ok
	  end
    end,
    {noreply, State};
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
	    {__Pidarena_team_lobby_mgr353, _,
	     {__Levelarena_team_lobby_mgr353,
	      __Tracesarena_team_lobby_mgr353}}
		when __Levelarena_team_lobby_mgr353 band 8 /= 0 orelse
		       __Tracesarena_team_lobby_mgr353 /= [] ->
		lager:do_log(error,
			     [{module, arena_team_lobby_mgr},
			      {function, do_handle_info}, {line, 353},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelarena_team_lobby_mgr353,
			     __Tracesarena_team_lobby_mgr353, lager_event,
			     __Pidarena_team_lobby_mgr353);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    arena_team_lobby_mgr, 354, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_team_lobby_mgr359, _,
       {__Levelarena_team_lobby_mgr359,
	__Tracesarena_team_lobby_mgr359}}
	  when __Levelarena_team_lobby_mgr359 band 128 /= 0 orelse
		 __Tracesarena_team_lobby_mgr359 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_team_lobby_mgr},
			{function, do_handle_info}, {line, 359},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("队伍未处理的消息~w", [_Info]), none, 4096, 128,
		       __Levelarena_team_lobby_mgr359,
		       __Tracesarena_team_lobby_mgr359, lager_event,
		       __Pidarena_team_lobby_mgr359);
      _ -> ok
    end,
    {noreply, State}.


