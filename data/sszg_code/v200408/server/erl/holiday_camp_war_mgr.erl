-file("src/mod/holiday_camp_war/holiday_camp_war_mgr"
      ".erl",
      1).

-module(holiday_camp_war_mgr).

-lager_records([{cluster_dynamic_local_group,
		 [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
		{holiday_camp_war_log_partner,
		 [pos, id, bid, lev, star, power, skin_id, resonate_lev,
		  hurt, be_hurt, curt, ext]},
		{holiday_camp_war_log_info,
		 [id, round, ret, time, a_id, a_name, a_power,
		  a_formation_type, a_order, a_end_hp, a_hallows_id,
		  a_hallows_look_id, a_sprite_lev, a_sprites, b_id,
		  b_name, b_power, b_formation_type, b_order, b_end_hp,
		  b_hallows_id, b_hallows_look_id, b_sprite_lev,
		  b_sprites, a_plist, b_plist, ext]},
		{holiday_camp_war_log_face,
		 [id, pos, is_leader, lev, name, face_id, avatar_bid,
		  face_file, face_update_time]},
		{holiday_camp_war_log,
		 [id, is_atk, atk_id, atk_name, atk_power, atk_face,
		  def_id, def_name, def_power, def_face, ret, win_count,
		  lose_count, replay_list, time]},
		{role_holiday_camp_war_log, [id, list]},
		{holiday_camp_war_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  resonate_lev, dower_skill, set_skill, attr, extra]},
		{holiday_camp_war_defense_role,
		 [id, name, face_id, power, avatar_bid, lev, pos,
		  is_leader, rank, score, face_update_time, face_file,
		  formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  hallows_refine, sprite_lev, sprite_breka_lev,
		  sprite_attr, sprites, ext, break_groups]},
		{holiday_camp_war_info,
		 [id, name, face_id, power, avatar_bid, lev, rank, score,
		  face_update_time, face_file, ext]},
		{holiday_camp_war_role,
		 [ver, id, camp_id, name, lev, face_id, avatar_bid,
		  power, camp_power, face_update_time, face_file, rank,
		  score, last_score, score_time, ext]},
		{holiday_camp_war_rank,
		 [rank, id, score, score_time, power]},
		{holiday_camp_war_camp_info,
		 [id, medal_score, score, score_time, member_num,
		  all_power, have_fort, can_combat_fort, vote_list,
		  old_fort_num, last_fort_num, old_medal_score,
		  last_medal_score, ext]},
		{holiday_camp_war_fort,
		 [id, a_score, b_score, unit_id, difficulty, belong, log,
		  state_log, a_up, b_up, ext]},
		{m_holiday_camp_war,
		 [ver, period, camp_id, old_data, last_camp, ref_count,
		  atk_defens, def_defens, end_time, is_enter, enter_flag,
		  vote_flag, first_flag, first_count, first_buy_count,
		  second_count, second_buy_count]},
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
		  m_holiday_arena_team, m_holiday_practise_tower,
		  m_holiday_camp_war, p_bag, p_eqm, p_home]},
		{state, [next_rank]}]).

-behaviour(gen_server).

-export([]).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([zero_update/0, init_fort/3, sync_role/1,
	 clear_old_data/1]).

-record(state, {next_rank = []}).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_mgr"
      ".erl",
      24).

-file("inc/role.hrl", 1).

-record(role,
	{ver = 79, id = {0, <<>>}, need_sync = 0,
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
	 m_holiday_arena_team, m_holiday_practise_tower,
	 m_holiday_camp_war, p_bag, p_eqm, p_home}).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_mgr"
      ".erl",
      25).

-file("inc/holiday_camp_war.hrl", 1).

-record(m_holiday_camp_war,
	{ver = 1, period = 0, camp_id = 0, old_data = [],
	 last_camp = 0, ref_count = 0, atk_defens = [],
	 def_defens = [], end_time = 0, is_enter = 0,
	 enter_flag = 0, vote_flag = 0, first_flag = 0,
	 first_count = 0, first_buy_count = 0, second_count = 0,
	 second_buy_count = 0}).

-record(holiday_camp_war_fort,
	{id = {0, <<>>}, a_score = 0, b_score = 0, unit_id = 0,
	 difficulty = 0, belong = 0, log = [], state_log = [],
	 a_up = 0, b_up = 0, ext = []}).

-record(holiday_camp_war_camp_info,
	{id = {0, <<>>}, medal_score = 0, score = 0,
	 score_time = 0, member_num = 0, all_power = 0,
	 have_fort = [], can_combat_fort = [], vote_list = [],
	 old_fort_num = 0, last_fort_num = 0,
	 old_medal_score = 0, last_medal_score = 0, ext = []}).

-record(holiday_camp_war_rank,
	{rank = {0, 0, <<>>}, id = {0, <<>>}, score = 0,
	 score_time = 0, power = 0}).

-record(holiday_camp_war_role,
	{ver = 1, id = {{0, <<>>}, <<>>}, camp_id = 0,
	 name = <<>>, lev = 0, face_id = 0, avatar_bid = 0,
	 power = 0, camp_power = 0, face_update_time = 0,
	 face_file = <<>>, rank = 0, score = 0, last_score = 0,
	 score_time = 0, ext = []}).

-record(holiday_camp_war_info,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, rank = 0, score = 0,
	 face_update_time = 0, face_file = <<>>, ext = []}).

-record(holiday_camp_war_defense_role,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, pos = 1, is_leader = 1,
	 rank = 0, score = 0, face_update_time = 0,
	 face_file = <<>>, formation_type = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0,
	 partner_infos = [], hallows_look_id = 0,
	 hallows_lucky = 0, hallows_seal = 0,
	 hallows_all_look_ids = [], hallows_refine = 0,
	 sprite_lev = 0, sprite_breka_lev = 0, sprite_attr,
	 sprites = [], ext = [], break_groups = []}).

-record(holiday_camp_war_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 resonate_lev = 0, dower_skill = [], set_skill = [],
	 attr, extra = []}).

-record(role_holiday_camp_war_log,
	{id = {0, <<>>}, list = []}).

-record(holiday_camp_war_log,
	{id = 0, is_atk = 0, atk_id = {0, <<>>},
	 atk_name = <<>>, atk_power = <<>>, atk_face = [],
	 def_id = {0, <<>>}, def_name = <<>>, def_power = <<>>,
	 def_face = [], ret = 1, win_count = 0, lose_count = 0,
	 replay_list = [], time = 0}).

-record(holiday_camp_war_log_face,
	{id = {0, <<>>}, pos = 1, is_leader = 1, lev = 1,
	 name = <<>>, face_id = 0, avatar_bid = 0,
	 face_file = <<>>, face_update_time = 0}).

-record(holiday_camp_war_log_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_power = 0, a_formation_type = 0,
	 a_order = 0, a_end_hp = 0, a_hallows_id = 1,
	 a_hallows_look_id = 0, a_sprite_lev = 0, a_sprites = [],
	 b_id = {0, <<>>}, b_name = <<>>, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 b_hallows_id = 1, b_hallows_look_id = 0,
	 b_sprite_lev = 0, b_sprites = [], a_plist = [],
	 b_plist = [], ext = []}).

-record(holiday_camp_war_log_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0, power = 0,
	 skin_id = 0, resonate_lev = 0, hurt = 0, be_hurt = 0,
	 curt = 0, ext = #{}}).

-file("src/mod/holiday_camp_war/holiday_camp_war_mgr"
      ".erl",
      26).

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

-file("src/mod/holiday_camp_war/holiday_camp_war_mgr"
      ".erl",
      27).

-spec sync_role(#role{}) -> ok.

sync_role(Role = #role{id = {_, Sid},
		       m_holiday_camp_war =
			   #m_holiday_camp_war{camp_id = CampId}}) ->
    case holiday_camp_war:is_open(Role) of
      {Period, _State, _EndTime} ->
	  HolidayRole =
	      holiday_camp_war_db:to_holiday_camp_war_role(Role),
	  MainId = holiday_camp_war_db:get_main_id(Sid, Period),
	  cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
			   [{do_sync_role,
			     HolidayRole#holiday_camp_war_role{camp_id =
								   CampId},
			     MainId}]),
	  ok;
      _ -> ok
    end.

-spec zero_update() -> ok.

zero_update() -> info(zero_update).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> holiday_camp_war_mgr ! Info.

cast(Info) ->
    gen_server:cast(holiday_camp_war_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_camp_war_mgr, Info,
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
	    {__Pidholiday_camp_war_mgr67, _,
	     {__Levelholiday_camp_war_mgr67,
	      __Tracesholiday_camp_war_mgr67}}
		when __Levelholiday_camp_war_mgr67 band 8 /= 0 orelse
		       __Tracesholiday_camp_war_mgr67 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_mgr}, {function, call},
			      {line, 67}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_camp_war_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_camp_war_mgr67,
			     __Tracesholiday_camp_war_mgr67, lager_event,
			     __Pidholiday_camp_war_mgr67);
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
    gen_server:start_link({local, holiday_camp_war_mgr},
			  holiday_camp_war_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr73, _,
       {__Levelholiday_camp_war_mgr73,
	__Tracesholiday_camp_war_mgr73}}
	  when __Levelholiday_camp_war_mgr73 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr73 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr}, {function, init},
			{line, 73}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_camp_war_mgr]),
		       none, 4096, 64, __Levelholiday_camp_war_mgr73,
		       __Tracesholiday_camp_war_mgr73, lager_event,
		       __Pidholiday_camp_war_mgr73);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(holiday_camp_war_main_ids,
			"dets/holiday_camp_war_main_ids.dets", 1, set),
    d_ets_lib:load_dets_to_ets(holiday_camp_war_main_ids,
			       undefined),
    d_ets_lib:new_d_ets(holiday_camp_war_main_list,
			"dets/holiday_camp_war_main_list.dets", 1, set),
    d_ets_lib:load_dets_to_ets(holiday_camp_war_main_list,
			       undefined),
    d_ets_lib:new_d_ets(holiday_camp_war_rank,
			"dets/holiday_camp_war_rank.dets",
			#holiday_camp_war_rank.rank, set),
    d_ets_lib:new_d_ets(holiday_camp_war_camp_info,
			"dets/holiday_camp_war_camp_info.dets",
			#holiday_camp_war_camp_info.id, set),
    d_ets_lib:load_dets_to_ets(holiday_camp_war_camp_info,
			       undefined),
    d_ets_lib:new_d_ets(holiday_camp_war_fort,
			"dets/holiday_camp_war_fort.dets",
			#holiday_camp_war_fort.id, set),
    d_ets_lib:load_dets_to_ets(holiday_camp_war_fort,
			       undefined),
    d_ets_lib:new_d_ets(holiday_camp_war_role,
			"dets/holiday_camp_war_role.dets",
			#holiday_camp_war_role.id, set),
    d_ets_lib:load_dets_to_ets(holiday_camp_war_role,
			       undefined),
    d_ets_lib:new_d_ets(holiday_camp_war_other,
			"dets/holiday_camp_war_other.dets",
			#holiday_camp_war_rank.rank, set),
    d_ets_lib:load_dets_to_ets(holiday_camp_war_other,
			       undefined),
    d_ets_lib:new_d_ets(role_holiday_camp_war_log,
			"dets/role_holiday_camp_war_log.dets",
			#role_holiday_camp_war_log.id, set),
    NextRankList = do_init(),
    init_timer(),
    util:set_timer(save_data_timer, util:rand(30, 60),
		   save_data),
    holiday_camp_war_match_mgr:do_open_match_pro(),
    State = #state{next_rank = NextRankList},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr115, _,
       {__Levelholiday_camp_war_mgr115,
	__Tracesholiday_camp_war_mgr115}}
	  when __Levelholiday_camp_war_mgr115 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr115 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr}, {function, init},
			{line, 115}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_camp_war_mgr]),
		       none, 4096, 64, __Levelholiday_camp_war_mgr115,
		       __Tracesholiday_camp_war_mgr115, lager_event,
		       __Pidholiday_camp_war_mgr115);
      _ -> ok
    end,
    {ok, State}.

do_init() ->
    Fun = fun (#holiday_camp_war_role{id = {RoleId, MainId},
				      camp_id = CampId, rank = Rank,
				      score = Score, score_time = ScoreTime,
				      power = Power},
	       NextRankList) ->
		  Rank1 = list_util:keyfind({CampId, MainId},
					    NextRankList, 0),
		  case Rank > 0 of
		    true ->
			ets:insert(holiday_camp_war_rank,
				   #holiday_camp_war_rank{rank =
							      {Rank, CampId,
							       MainId},
							  id = RoleId,
							  score = Score,
							  score_time =
							      ScoreTime,
							  power = Power});
		    _ -> skip
		  end,
		  lists:keystore({CampId, MainId}, 1, NextRankList,
				 {{CampId, MainId}, max(Rank, Rank1) + 1})
	  end,
    ets:foldl(Fun, [], holiday_camp_war_role).

init_timer() ->
    MainIds = sys_env:get(main_ids, []),
    case sys_env:get(holiday_camp_war_period, {0, 0, 0}) of
      {Period, OldState, OldEndTime}
	  when Period =/= 0 andalso length(MainIds) =/= 0 ->
	  FirstAccountTime =
	      date:parse_time(holiday_camp_war_data:get_first_accout(Period)),
	  case date:unixtime() > FirstAccountTime of
	    false when OldState =:= 1 ->
		FirstStartTime = date:unixtime(zero) +
				   date:time_sec(holiday_camp_war_data:get_first_start_time(Period)),
		sys_env:save(holiday_camp_war_period,
			     {Period, 1, FirstStartTime}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war_mgr141, _,
		   {__Levelholiday_camp_war_mgr141,
		    __Tracesholiday_camp_war_mgr141}}
		      when __Levelholiday_camp_war_mgr141 band 64 /= 0 orelse
			     __Tracesholiday_camp_war_mgr141 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_camp_war_mgr},
				    {function, init_timer}, {line, 141},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "阵营战进入 第一阶段-投票", none, 4096, 64,
				   __Levelholiday_camp_war_mgr141,
				   __Tracesholiday_camp_war_mgr141, lager_event,
				   __Pidholiday_camp_war_mgr141);
		  _ -> ok
		end,
		util:set_timer(first_start_timer,
			       max(1, FirstStartTime - date:unixtime()),
			       first_start);
	    false when OldState =:= 2 ->
		FirstEndTime = date:unixtime() +
				 date:next_diff(holiday_camp_war_data:get_first_end_time(Period)),
		FirstEndTime1 = util:if_true(FirstEndTime > OldEndTime,
					     FirstEndTime - 86400,
					     FirstEndTime),
		EndTime = min(FirstAccountTime, FirstEndTime1),
		sys_env:save(holiday_camp_war_period,
			     {Period, 2, EndTime}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war_mgr148, _,
		   {__Levelholiday_camp_war_mgr148,
		    __Tracesholiday_camp_war_mgr148}}
		      when __Levelholiday_camp_war_mgr148 band 64 /= 0 orelse
			     __Tracesholiday_camp_war_mgr148 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_camp_war_mgr},
				    {function, init_timer}, {line, 148},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "阵营战进入 第一阶段-挑战据点", none, 4096, 64,
				   __Levelholiday_camp_war_mgr148,
				   __Tracesholiday_camp_war_mgr148, lager_event,
				   __Pidholiday_camp_war_mgr148);
		  _ -> ok
		end,
		util:set_timer(first_end_timer,
			       max(1, EndTime - date:unixtime()), first_end);
	    true when OldState =:= 3 ->
		SecondStartTime =
		    date:parse_time(holiday_camp_war_data:get_second_start_time(Period)),
		sys_env:save(holiday_camp_war_period,
			     {Period, 3, SecondStartTime}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war_mgr153, _,
		   {__Levelholiday_camp_war_mgr153,
		    __Tracesholiday_camp_war_mgr153}}
		      when __Levelholiday_camp_war_mgr153 band 64 /= 0 orelse
			     __Tracesholiday_camp_war_mgr153 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_camp_war_mgr},
				    {function, init_timer}, {line, 153},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "阵营战进入 第二阶段-空闲", none, 4096, 64,
				   __Levelholiday_camp_war_mgr153,
				   __Tracesholiday_camp_war_mgr153, lager_event,
				   __Pidholiday_camp_war_mgr153);
		  _ -> ok
		end,
		util:set_timer(second_start_timer,
			       max(1, SecondStartTime - date:unixtime()),
			       second_start);
	    _ ->
		{_, PEndTime, _, _, _} =
		    holiday_camp_war_data:get_period(Period),
		PeriodEndTime = date:parse_time(PEndTime),
		{AccountTime, Times} = calc_recently_accout(Period),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war_mgr160, _,
		   {__Levelholiday_camp_war_mgr160,
		    __Tracesholiday_camp_war_mgr160}}
		      when __Levelholiday_camp_war_mgr160 band 64 /= 0 orelse
			     __Tracesholiday_camp_war_mgr160 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_camp_war_mgr},
				    {function, init_timer}, {line, 160},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("阵营战最近一个结算时间：~w，已经结算了~w期",
						 [AccountTime, Times]),
				   none, 4096, 64,
				   __Levelholiday_camp_war_mgr160,
				   __Tracesholiday_camp_war_mgr160, lager_event,
				   __Pidholiday_camp_war_mgr160);
		  _ -> ok
		end,
		repair_account_data(Times),
		EndTime = min(AccountTime, PeriodEndTime),
		sys_env:save(holiday_camp_war_period,
			     {Period, 4, EndTime}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war_mgr165, _,
		   {__Levelholiday_camp_war_mgr165,
		    __Tracesholiday_camp_war_mgr165}}
		      when __Levelholiday_camp_war_mgr165 band 64 /= 0 orelse
			     __Tracesholiday_camp_war_mgr165 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_camp_war_mgr},
				    {function, init_timer}, {line, 165},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "阵营战进入 第二阶段-匹配挑战", none, 4096, 64,
				   __Levelholiday_camp_war_mgr165,
				   __Tracesholiday_camp_war_mgr165, lager_event,
				   __Pidholiday_camp_war_mgr165);
		  _ -> ok
		end,
		util:set_timer(second_account_timer,
			       max(1, EndTime - date:unixtime()),
			       second_account),
		util:set_timer(second_zero_timer,
			       date:next_diff({23, 59, 59}), second_zero)
	  end,
	  sync_state(),
	  ok;
      _ -> skip
    end.

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
	    {__Pidholiday_camp_war_mgr181, _,
	     {__Levelholiday_camp_war_mgr181,
	      __Tracesholiday_camp_war_mgr181}}
		when __Levelholiday_camp_war_mgr181 band 8 /= 0 orelse
		       __Tracesholiday_camp_war_mgr181 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_mgr},
			      {function, handle_call}, {line, 181},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_camp_war_mgr181,
			     __Tracesholiday_camp_war_mgr181, lager_event,
			     __Pidholiday_camp_war_mgr181);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_camp_war_mgr, 182, _Reason}),
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
	    {__Pidholiday_camp_war_mgr194, _,
	     {__Levelholiday_camp_war_mgr194,
	      __Tracesholiday_camp_war_mgr194}}
		when __Levelholiday_camp_war_mgr194 band 8 /= 0 orelse
		       __Tracesholiday_camp_war_mgr194 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_mgr},
			      {function, handle_info}, {line, 194},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_camp_war_mgr194,
			     __Tracesholiday_camp_war_mgr194, lager_event,
			     __Pidholiday_camp_war_mgr194);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_camp_war_mgr, 195, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    dets:insert(holiday_camp_war_main_ids,
		ets:tab2list(holiday_camp_war_main_ids)),
    dets:insert(holiday_camp_war_main_list,
		ets:tab2list(holiday_camp_war_main_list)),
    dets:insert(holiday_camp_war_camp_info,
		ets:tab2list(holiday_camp_war_camp_info)),
    dets:insert(holiday_camp_war_fort,
		ets:tab2list(holiday_camp_war_fort)),
    dets:insert(holiday_camp_war_role,
		ets:tab2list(holiday_camp_war_role)),
    dets:insert(role_holiday_camp_war_log,
		ets:tab2list(role_holiday_camp_war_log)),
    dets:insert(holiday_camp_war_other,
		ets:tab2list(holiday_camp_war_other)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr207, _,
       {__Levelholiday_camp_war_mgr207,
	__Tracesholiday_camp_war_mgr207}}
	  when __Levelholiday_camp_war_mgr207 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr207 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr}, {function, terminate},
			{line, 207}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelholiday_camp_war_mgr207,
		       __Tracesholiday_camp_war_mgr207, lager_event,
		       __Pidholiday_camp_war_mgr207);
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
	    {__Pidholiday_camp_war_mgr219, _,
	     {__Levelholiday_camp_war_mgr219,
	      __Tracesholiday_camp_war_mgr219}}
		when __Levelholiday_camp_war_mgr219 band 8 /= 0 orelse
		       __Tracesholiday_camp_war_mgr219 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_mgr},
			      {function, do_handle_call}, {line, 219},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_camp_war_mgr219,
			     __Tracesholiday_camp_war_mgr219, lager_event,
			     __Pidholiday_camp_war_mgr219);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_camp_war_mgr, 220, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call({req_camp_id, Power, MainId}, _From,
	       State) ->
    [CampA = #holiday_camp_war_camp_info{member_num = NumA,
					 all_power = AllPowerA}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {100, MainId}),
    [CampB = #holiday_camp_war_camp_info{member_num = NumB,
					 all_power = AllPowerB}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {200, MainId}),
    CampId = case AllPowerA > AllPowerB of
	       true ->
		   ets:insert(holiday_camp_war_camp_info,
			      CampB#holiday_camp_war_camp_info{member_num =
								   NumB + 1,
							       all_power =
								   AllPowerB +
								     Power}),
		   200;
	       _ ->
		   ets:insert(holiday_camp_war_camp_info,
			      CampA#holiday_camp_war_camp_info{member_num =
								   NumA + 1,
							       all_power =
								   AllPowerA +
								     Power}),
		   100
	     end,
    {reply, CampId, State};
do_handle_call({apply_fort_unit_id, MainId, Id, CampId},
	       _From, State) ->
    Reply = case ets:lookup(holiday_camp_war_camp_info,
			    {CampId, MainId})
		of
	      [#holiday_camp_war_camp_info{can_combat_fort =
					       CanCombatFort}
	       | _] ->
		  case lists:member(Id, CanCombatFort) of
		    true ->
			case ets:lookup(holiday_camp_war_fort, {Id, MainId}) of
			  [#holiday_camp_war_fort{unit_id = UnitId, a_up = AUp,
						  b_up = BUp}
			   | _] ->
			      Up = util:if_true(CampId =:= 100, AUp, BUp),
			      {UnitId, Up};
			  _ -> {false, lang:get(<<"数据有误"/utf8>>)}
			end;
		    _ -> {false, lang:get(<<"数据有误"/utf8>>)}
		  end;
	      _ -> {false, lang:get(<<"数据有误"/utf8>>)}
	    end,
    {reply, Reply, State};
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
	    {__Pidholiday_camp_war_mgr269, _,
	     {__Levelholiday_camp_war_mgr269,
	      __Tracesholiday_camp_war_mgr269}}
		when __Levelholiday_camp_war_mgr269 band 8 /= 0 orelse
		       __Tracesholiday_camp_war_mgr269 /= [] ->
		lager:do_log(error,
			     [{module, holiday_camp_war_mgr},
			      {function, do_handle_info}, {line, 269},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_camp_war_mgr269,
			     __Tracesholiday_camp_war_mgr269, lager_event,
			     __Pidholiday_camp_war_mgr269);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_camp_war_mgr, 270, _Reason}),
	  {noreply, State}
    end;
do_handle_info(save_data, State) ->
    dets:insert(holiday_camp_war_camp_info,
		ets:tab2list(holiday_camp_war_camp_info)),
    dets:insert(holiday_camp_war_fort,
		ets:tab2list(holiday_camp_war_fort)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr278, _,
       {__Levelholiday_camp_war_mgr278,
	__Tracesholiday_camp_war_mgr278}}
	  when __Levelholiday_camp_war_mgr278 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr278 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, do_handle_info}, {line, 278},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "阵营战定时同步数据", none, 4096, 64,
		       __Levelholiday_camp_war_mgr278,
		       __Tracesholiday_camp_war_mgr278, lager_event,
		       __Pidholiday_camp_war_mgr278);
      _ -> ok
    end,
    {noreply, State};
do_handle_info(gm_clear_data, State) ->
    NewState = clear_old_data(State), {noreply, NewState};
do_handle_info({apply_push_base, RoleId, CampId,
		MainId},
	       State) ->
    {Period, _PState, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    OtherCampId = util:if_true(CampId =:= 100, 200, 100),
    [#holiday_camp_war_camp_info{medal_score = MedalScore,
				 can_combat_fort = CanCombatFort,
				 vote_list = VoteList}
     | _] =
	case ets:lookup(holiday_camp_war_camp_info,
			{CampId, MainId})
	    of
	  DataC = [#holiday_camp_war_camp_info{} | _] -> DataC;
	  _ -> [#holiday_camp_war_camp_info{}]
	end,
    [#holiday_camp_war_camp_info{medal_score =
				     OtherMedalScore}
     | _] =
	case ets:lookup(holiday_camp_war_camp_info,
			{OtherCampId, MainId})
	    of
	  Data = [#holiday_camp_war_camp_info{} | _] -> Data;
	  _ -> [#holiday_camp_war_camp_info{}]
	end,
    {MyScore, LastScore} = case
			     holiday_camp_war_db:get_camp_role(RoleId)
			       of
			     #holiday_camp_war_role{score = ScoreT,
						    last_score = LastScoreT} ->
				 {ScoreT, LastScoreT};
			     _ -> {0, 0}
			   end,
    AllFort = holiday_camp_war_data:get_all_fort(Period),
    Fun = fun ({Id, _Diff}, Acc) ->
		  [#holiday_camp_war_fort{belong = Belong,
					  difficulty = Difficulty, a_up = AUp,
					  b_up = BUp}
		   | _] =
		      ets:lookup(holiday_camp_war_fort, {Id, MainId}),
		  CanAtk = case lists:member(Id, CanCombatFort) of
			     false -> 0;
			     _ -> 1
			   end,
		  IsUp = util:if_true(CampId =:= 100 andalso AUp =:= 1
					orelse CampId =:= 200 andalso BUp =:= 1,
				      1, 0),
		  VoteNum = list_util:keyfind(Id, VoteList, 0),
		  [{Id, Belong, Difficulty, CanAtk, VoteNum, IsUp} | Acc]
	  end,
    FortList = lists:foldl(Fun, [], AllFort),
    role_lib:cast(by_id, RoleId,
		  {holiday_camp_war, apply_push_base,
		   [{MyScore, LastScore, MedalScore, OtherMedalScore,
		     FortList}]}),
    {noreply, State};
do_handle_info({apply_push_fort_info, RoleId, MainId,
		Id},
	       State) ->
    case ets:lookup(holiday_camp_war_fort, {Id, MainId}) of
      [#holiday_camp_war_fort{belong = Belong,
			      difficulty = Difficulty, a_score = AScore,
			      b_score = BScore, log = Log, state_log = StateLog}
       | _] ->
	  role_lib:cast(by_id, RoleId,
			{holiday_camp_war, apply_push_fort_info,
			 [{Id, Belong, Difficulty, AScore, BScore, Log,
			   StateLog}]});
      _ -> skip
    end,
    {noreply, State};
do_handle_info({send_combat_fort_data, RoleId, MainId,
		FortId, ScoreAward, Name, CampId},
	       State = #state{next_rank = NextRankList}) ->
    case sys_env:get(holiday_camp_war_period, {0, 0, 0}) of
      {Period, PState, _EndTime}
	  when Period =/= 0 andalso
		 (PState =:= 2 orelse PState =:= 4) ->
	  case ets:lookup(holiday_camp_war_fort, {FortId, MainId})
	      of
	    [Data = #holiday_camp_war_fort{a_score = AScore,
					   b_score = BScore, log = Log,
					   state_log = StateLog}
	     | _] ->
		NewData = #holiday_camp_war_fort{a_score = NewAScore,
						 b_score = NewBScore} =
			      case CampId of
				100 ->
				    Data#holiday_camp_war_fort{a_score =
								   AScore +
								     ScoreAward,
							       log =
								   lists:sublist([{Name,
										   CampId,
										   ScoreAward}
										  | Log],
										 3)};
				200 ->
				    Data#holiday_camp_war_fort{b_score =
								   BScore +
								     ScoreAward,
							       log =
								   lists:sublist([{Name,
										   CampId,
										   ScoreAward}
										  | Log],
										 3)};
				_ -> Data
			      end,
		NewData1 = case FortId =:= 0 of
			     true ->
				 [{MaxStateId, MWin, MState, _, _} | _] =
				     lists:reverse(lists:keysort(1, StateLog)),
				 NewStateLog = lists:keystore(MaxStateId, 1,
							      StateLog,
							      {MaxStateId, MWin,
							       MState,
							       NewAScore,
							       NewBScore}),
				 NewData#holiday_camp_war_fort{state_log =
								   NewStateLog};
			     _ -> NewData
			   end,
		ets:insert(holiday_camp_war_fort, NewData1);
	    _ -> skip
	  end,
	  case ets:lookup(holiday_camp_war_camp_info,
			  {CampId, MainId})
	      of
	    [DataC = #holiday_camp_war_camp_info{score = Score}
	     | _] ->
		ets:insert(holiday_camp_war_camp_info,
			   DataC#holiday_camp_war_camp_info{score =
								Score +
								  ScoreAward,
							    score_time =
								date:unixtime()});
	    _ -> skip
	  end,
	  NewState = case ets:lookup(holiday_camp_war_role,
				     {RoleId, MainId})
			 of
		       [DataR = #holiday_camp_war_role{score = ScoreP,
						       last_score = LastScore}
			| _] ->
			   NewDataR = DataR#holiday_camp_war_role{score =
								      ScoreP +
									ScoreAward,
								  last_score =
								      LastScore
									+
									ScoreAward,
								  score_time =
								      date:unixtime()},
			   ets:insert(holiday_camp_war_role, NewDataR),
			   NextRank = list_util:keyfind({CampId, MainId},
							NextRankList, 1),
			   NewNextRank = update_rank(NewDataR, CampId, MainId,
						     NextRank),
			   NewNextRankList = lists:keystore({CampId, MainId}, 1,
							    NextRankList,
							    {{CampId, MainId},
							     NewNextRank}),
			   State#state{next_rank = NewNextRankList};
		       _ -> State
		     end,
	  do_save_update(MainId),
	  {noreply, NewState};
      _ -> {noreply, State}
    end;
do_handle_info({do_vote, RoleId, MainId, Id, CampId},
	       State) ->
    case sys_env:get(holiday_camp_war_period, {0, 0, 0}) of
      {Period, 1, _EndTime} when Period =/= 0 ->
	  case ets:lookup(holiday_camp_war_camp_info,
			  {CampId, MainId})
	      of
	    [Data = #holiday_camp_war_camp_info{can_combat_fort =
						    CanCombatFort,
						vote_list = VoteList}
	     | _] ->
		case lists:member(Id, CanCombatFort) of
		  true ->
		      case ets:lookup(holiday_camp_war_role, {RoleId, MainId})
			  of
			[#holiday_camp_war_role{last_score = LastScore} | _] ->
			    Num = holiday_camp_war_data:get_vote_num({Period,
								      LastScore}),
			    OldNum = list_util:keyfind(Id, VoteList, 0),
			    NewVoteList = lists:keystore(Id, 1, VoteList,
							 {Id, OldNum + Num}),
			    ets:insert(holiday_camp_war_camp_info,
				       Data#holiday_camp_war_camp_info{vote_list
									   =
									   NewVoteList});
			_ -> skip
		      end;
		  _ -> skip
		end;
	    _ -> skip
	  end;
      _ -> skip
    end,
    {noreply, State};
do_handle_info({apply_push_day_change, RoleId, MainId},
	       State) ->
    case sys_env:get(holiday_camp_war_period, {0, 0, 0}) of
      {Period, _State, _EndTime} when Period =/= 0 ->
	  case ets:lookup(holiday_camp_war_camp_info,
			  {100, MainId})
	      of
	    [#holiday_camp_war_camp_info{old_fort_num = OldFortNumA,
					 last_fort_num = LastFortNumA,
					 old_medal_score = OldMedalScoreA,
					 last_medal_score = LastMedalScoreA}
	     | _] ->
		case ets:lookup(holiday_camp_war_camp_info,
				{200, MainId})
		    of
		  [#holiday_camp_war_camp_info{old_fort_num = OldFortNumB,
					       last_fort_num = LastFortNumB,
					       old_medal_score = OldMedalScoreB,
					       last_medal_score =
						   LastMedalScoreB}
		   | _] ->
		      role_lib:cast(by_id, RoleId,
				    {holiday_camp_war, apply_push_day_change,
				     [{[{100, OldFortNumA, OldMedalScoreA,
					 LastFortNumA, LastMedalScoreA},
					{200, OldFortNumB, OldMedalScoreB,
					 LastFortNumB, LastMedalScoreB}]}]});
		  _ -> skip
		end;
	    _ -> skip
	  end;
      _ -> skip
    end,
    {noreply, State};
do_handle_info({add_log, RoleId,
		LogData = #holiday_camp_war_log{}},
	       State) ->
    #role_holiday_camp_war_log{list = Logs} =
	holiday_camp_war_db:get_role_log(RoleId),
    LogId = case Logs of
	      [#holiday_camp_war_log{id = LogId1} | _]
		  when LogId1 < 100 ->
		  LogId1 + 1;
	      _ -> 1
	    end,
    NewLogData = LogData#holiday_camp_war_log{id = LogId},
    {NewLogs, DelLogs} = list_util:split(100,
					 [NewLogData | Logs]),
    [[big_world_lib:cast({big_world, Sid2},
			 combat_replay_mgr, dec_replay_reference, [Temp])
      || {_, #holiday_camp_war_log_info{id = Temp}}
	     <- ReplayListT]
     || #holiday_camp_war_log{atk_id = {_, Sid2},
			      replay_list = ReplayListT}
	    <- DelLogs],
    ets:insert(role_holiday_camp_war_log,
	       #role_holiday_camp_war_log{id = RoleId,
					  list = NewLogs}),
    {noreply, State};
do_handle_info({apply_get_rank, MainId, MyCampId,
		CampId, RoleId, StarNum, Num},
	       State = #state{next_rank = NextRankList}) ->
    {MyRank, MyScore} = case
			  ets:lookup(holiday_camp_war_role, {RoleId, MainId})
			    of
			  [#holiday_camp_war_role{rank = RankT,
						  score = ScoreT}] ->
			      {RankT, ScoreT};
			  _ -> {0, 0}
			end,
    MaxRank = max(100,
		  list_util:keyfind({CampId, MainId}, NextRankList, 1) -
		    1),
    Per = util:uceil(MyRank * 100 / MaxRank),
    List = holiday_camp_war_db:get_rank_roles(StarNum, Num,
					      MainId, CampId),
    role_lib:cast(by_id, RoleId,
		  {holiday_camp_war_team, apply_get_rank,
		   [{MyRank, MyScore, MyCampId, Per, CampId, List}]}),
    {noreply, State};
do_handle_info({do_sync_role,
		HolidayRole = #holiday_camp_war_role{id = {RoleId, _},
						     camp_id = CampId,
						     power = Power,
						     camp_power = CampPower,
						     lev = Lev, name = Name,
						     avatar_bid = AvatarId,
						     face_id = FaceId,
						     face_update_time =
							 FaceUpdateTime,
						     face_file = FaceFile},
		MainId},
	       State) ->
    case ets:lookup(holiday_camp_war_role, {RoleId, MainId})
	of
      [Data = #holiday_camp_war_role{}] ->
	  NData = Data#holiday_camp_war_role{lev = Lev,
					     camp_id = CampId, name = Name,
					     power = Power, face_id = FaceId,
					     avatar_bid = AvatarId,
					     camp_power = CampPower,
					     face_update_time = FaceUpdateTime,
					     face_file = FaceFile},
	  ets:insert(holiday_camp_war_role, NData),
	  ok;
      _ -> ets:insert(holiday_camp_war_role, HolidayRole)
    end,
    {noreply, State};
do_handle_info({sync_camp_id, GetCampId, Power, MainId},
	       State) ->
    [Camp = #holiday_camp_war_camp_info{member_num = Num,
					all_power = AllPower}
     | _] =
	ets:lookup(holiday_camp_war_camp_info,
		   {GetCampId, MainId}),
    ets:insert(holiday_camp_war_camp_info,
	       Camp#holiday_camp_war_camp_info{member_num = Num + 1,
					       all_power = AllPower + Power}),
    {noreply, State};
do_handle_info(cluster_ready, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr497, _,
       {__Levelholiday_camp_war_mgr497,
	__Tracesholiday_camp_war_mgr497}}
	  when __Levelholiday_camp_war_mgr497 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr497 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, do_handle_info}, {line, 497},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "中央服连接成功, 判断阵营战赛季周期和状态", none, 4096, 64,
		       __Levelholiday_camp_war_mgr497,
		       __Tracesholiday_camp_war_mgr497, lager_event,
		       __Pidholiday_camp_war_mgr497);
      _ -> ok
    end,
    check_period(),
    {noreply, State};
do_handle_info(zero_update, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr503, _,
       {__Levelholiday_camp_war_mgr503,
	__Tracesholiday_camp_war_mgr503}}
	  when __Levelholiday_camp_war_mgr503 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr503 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, do_handle_info}, {line, 503},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "0点更新，判断阵营战赛季周期和状态", none, 4096, 64,
		       __Levelholiday_camp_war_mgr503,
		       __Tracesholiday_camp_war_mgr503, lager_event,
		       __Pidholiday_camp_war_mgr503);
      _ -> ok
    end,
    check_period(),
    {noreply, State};
do_handle_info(cluster_open, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr509, _,
       {__Levelholiday_camp_war_mgr509,
	__Tracesholiday_camp_war_mgr509}}
	  when __Levelholiday_camp_war_mgr509 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr509 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, do_handle_info}, {line, 509},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "主服连接成功，判断阵营战赛季周期和状态", none, 4096, 64,
		       __Levelholiday_camp_war_mgr509,
		       __Tracesholiday_camp_war_mgr509, lager_event,
		       __Pidholiday_camp_war_mgr509);
      _ -> ok
    end,
    check_period(),
    {noreply, State};
do_handle_info({sync_state, {Period, PState, EndTime}},
	       State) ->
    {OldPeriod, _OldState, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr516, _,
       {__Levelholiday_camp_war_mgr516,
	__Tracesholiday_camp_war_mgr516}}
	  when __Levelholiday_camp_war_mgr516 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr516 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, do_handle_info}, {line, 516},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("同步阵营战最新状态：~w",
				     [{Period, PState, EndTime}]),
		       none, 4096, 64, __Levelholiday_camp_war_mgr516,
		       __Tracesholiday_camp_war_mgr516, lager_event,
		       __Pidholiday_camp_war_mgr516);
      _ -> ok
    end,
    sys_env:save(holiday_camp_war_period,
		 {Period, PState, EndTime}),
    NewState = case OldPeriod =/= 0 andalso Period =:= 0 of
		 true -> clear_old_data(State);
		 _ -> State
	       end,
    role_group:apply(world,
		     {holiday_camp_war, push_base, []}),
    {noreply, NewState};
do_handle_info({req_sync_state, Sid, Period, MainId},
	       State = #state{next_rank = NextRankList}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr531, _,
       {__Levelholiday_camp_war_mgr531,
	__Tracesholiday_camp_war_mgr531}}
	  when __Levelholiday_camp_war_mgr531 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr531 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, do_handle_info}, {line, 531},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("主服~w接收到子服~w同步状态的请求", [MainId, Sid]),
		       none, 4096, 64, __Levelholiday_camp_war_mgr531,
		       __Tracesholiday_camp_war_mgr531, lager_event,
		       __Pidholiday_camp_war_mgr531);
      _ -> ok
    end,
    {OldPeriod, _OldState, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    case is_period2() of
      {Period, _, _} when Period =:= OldPeriod ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr536, _,
	     {__Levelholiday_camp_war_mgr536,
	      __Tracesholiday_camp_war_mgr536}}
		when __Levelholiday_camp_war_mgr536 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr536 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, do_handle_info}, {line, 536},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "主服阵营战开启中", none, 4096, 64,
			     __Levelholiday_camp_war_mgr536,
			     __Tracesholiday_camp_war_mgr536, lager_event,
			     __Pidholiday_camp_war_mgr536);
	    _ -> ok
	  end,
	  NewNextRankList = init_fort(MainId, Period,
				      NextRankList),
	  save_main_and_list(MainId, Sid, Period),
	  sync_state(Sid),
	  {noreply, State#state{next_rank = NewNextRankList}};
      {Period, _, _} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr545, _,
	     {__Levelholiday_camp_war_mgr545,
	      __Tracesholiday_camp_war_mgr545}}
		when __Levelholiday_camp_war_mgr545 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr545 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, do_handle_info}, {line, 545},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "主服阵营战开启新周期", none, 4096, 64,
			     __Levelholiday_camp_war_mgr545,
			     __Tracesholiday_camp_war_mgr545, lager_event,
			     __Pidholiday_camp_war_mgr545);
	    _ -> ok
	  end,
	  NewNextRankList = init_fort(MainId, Period,
				      NextRankList),
	  save_main_and_list(MainId, Sid, Period),
	  FirstAccountTime =
	      date:parse_time(holiday_camp_war_data:get_first_accout(Period)),
	  case date:unixtime() >= FirstAccountTime of
	    false ->
		FirstStartTime = case Period =:= 1 of
				   true ->
				       get_min_time(holiday_camp_war_data:get_first_start_time(Period));
				   _ ->
				       date:unixtime(zero) +
					 date:time_sec(holiday_camp_war_data:get_first_start_time(Period))
				 end,
		sys_env:save(holiday_camp_war_period,
			     {Period, 1, FirstStartTime}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war_mgr563, _,
		   {__Levelholiday_camp_war_mgr563,
		    __Tracesholiday_camp_war_mgr563}}
		      when __Levelholiday_camp_war_mgr563 band 64 /= 0 orelse
			     __Tracesholiday_camp_war_mgr563 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_camp_war_mgr},
				    {function, do_handle_info}, {line, 563},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "阵营战进入 第一阶段-投票", none, 4096, 64,
				   __Levelholiday_camp_war_mgr563,
				   __Tracesholiday_camp_war_mgr563, lager_event,
				   __Pidholiday_camp_war_mgr563);
		  _ -> ok
		end,
		util:set_timer(first_start_timer,
			       max(1, FirstStartTime - date:unixtime()),
			       first_start);
	    _ ->
		SecondStartTime =
		    date:parse_time(holiday_camp_war_data:get_second_start_time(Period)),
		sys_env:save(holiday_camp_war_period,
			     {Period, 3, SecondStartTime}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_camp_war_mgr568, _,
		   {__Levelholiday_camp_war_mgr568,
		    __Tracesholiday_camp_war_mgr568}}
		      when __Levelholiday_camp_war_mgr568 band 64 /= 0 orelse
			     __Tracesholiday_camp_war_mgr568 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_camp_war_mgr},
				    {function, do_handle_info}, {line, 568},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "阵营战进入 第二阶段-空闲", none, 4096, 64,
				   __Levelholiday_camp_war_mgr568,
				   __Tracesholiday_camp_war_mgr568, lager_event,
				   __Pidholiday_camp_war_mgr568);
		  _ -> ok
		end,
		util:set_timer(second_start_timer,
			       max(1, SecondStartTime - date:unixtime()),
			       second_start)
	  end,
	  sync_state(Sid),
	  {noreply, State#state{next_rank = NewNextRankList}};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr574, _,
	     {__Levelholiday_camp_war_mgr574,
	      __Tracesholiday_camp_war_mgr574}}
		when __Levelholiday_camp_war_mgr574 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr574 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, do_handle_info}, {line, 574},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "开启阵营战异常", none, 4096, 64,
			     __Levelholiday_camp_war_mgr574,
			     __Tracesholiday_camp_war_mgr574, lager_event,
			     __Pidholiday_camp_war_mgr574);
	    _ -> ok
	  end,
	  sys_env:save(holiday_camp_war_period, {0, 0, 0}),
	  {noreply, State}
    end;
do_handle_info(first_start, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr581, _,
       {__Levelholiday_camp_war_mgr581,
	__Tracesholiday_camp_war_mgr581}}
	  when __Levelholiday_camp_war_mgr581 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr581 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, do_handle_info}, {line, 581},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "阵营战进入 第一阶段-挑战据点", none, 4096, 64,
		       __Levelholiday_camp_war_mgr581,
		       __Tracesholiday_camp_war_mgr581, lager_event,
		       __Pidholiday_camp_war_mgr581);
      _ -> ok
    end,
    vote_handle(),
    {Period, _OldState, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    FirstAccountTime =
	date:parse_time(holiday_camp_war_data:get_first_accout(Period)),
    FirstEndTime = case Period =:= 1 of
		     true ->
			 get_min_time(holiday_camp_war_data:get_first_end_time(Period));
		     _ ->
			 date:unixtime() +
			   date:next_diff(holiday_camp_war_data:get_first_end_time(Period))
		   end,
    EndTime = min(FirstAccountTime, FirstEndTime),
    sys_env:save(holiday_camp_war_period,
		 {Period, 2, EndTime}),
    sync_state(),
    util:set_timer(first_end_timer,
		   max(1, EndTime - date:unixtime()), first_end),
    {noreply, State};
do_handle_info(first_end, State) ->
    {Period, _OldState, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    FirstAccountTime =
	date:parse_time(holiday_camp_war_data:get_first_accout(Period)),
    case date:unixtime() >= FirstAccountTime of
      false ->
	  day_account(Period, false),
	  FirstStartTime = case Period =:= 1 of
			     true ->
				 get_min_time(holiday_camp_war_data:get_first_start_time(Period));
			     _ ->
				 date:unixtime() +
				   date:next_diff(holiday_camp_war_data:get_first_start_time(Period))
			   end,
	  sys_env:save(holiday_camp_war_period,
		       {Period, 1, FirstStartTime}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr615, _,
	     {__Levelholiday_camp_war_mgr615,
	      __Tracesholiday_camp_war_mgr615}}
		when __Levelholiday_camp_war_mgr615 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr615 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, do_handle_info}, {line, 615},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "阵营战进入 第一阶段-投票", none, 4096, 64,
			     __Levelholiday_camp_war_mgr615,
			     __Tracesholiday_camp_war_mgr615, lager_event,
			     __Pidholiday_camp_war_mgr615);
	    _ -> ok
	  end,
	  sync_state(),
	  util:set_timer(first_start_timer,
			 max(1, FirstStartTime - date:unixtime()), first_start);
      _ ->
	  day_account(Period, true),
	  first_accout(),
	  SecondStartTime =
	      date:parse_time(holiday_camp_war_data:get_second_start_time(Period)),
	  sys_env:save(holiday_camp_war_period,
		       {Period, 3, SecondStartTime}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr624, _,
	     {__Levelholiday_camp_war_mgr624,
	      __Tracesholiday_camp_war_mgr624}}
		when __Levelholiday_camp_war_mgr624 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr624 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, do_handle_info}, {line, 624},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "阵营战进入 第二阶段-空闲", none, 4096, 64,
			     __Levelholiday_camp_war_mgr624,
			     __Tracesholiday_camp_war_mgr624, lager_event,
			     __Pidholiday_camp_war_mgr624);
	    _ -> ok
	  end,
	  sync_state(),
	  util:set_timer(second_start_timer,
			 max(1, SecondStartTime - date:unixtime()),
			 second_start)
    end,
    dets:insert(holiday_camp_war_camp_info,
		ets:tab2list(holiday_camp_war_camp_info)),
    dets:insert(holiday_camp_war_fort,
		ets:tab2list(holiday_camp_war_fort)),
    {noreply, State};
do_handle_info(second_start, State) ->
    {Period, _OldState, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    {_, PEndTime, _, _, _} =
	holiday_camp_war_data:get_period(Period),
    PeriodEndTime = date:parse_time(PEndTime),
    {AccountTime, Times} = calc_recently_accout(Period),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr642, _,
       {__Levelholiday_camp_war_mgr642,
	__Tracesholiday_camp_war_mgr642}}
	  when __Levelholiday_camp_war_mgr642 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr642 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, do_handle_info}, {line, 642},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("阵营战最近一个结算时间：~w，已经结算了~w期",
				     [AccountTime, Times]),
		       none, 4096, 64, __Levelholiday_camp_war_mgr642,
		       __Tracesholiday_camp_war_mgr642, lager_event,
		       __Pidholiday_camp_war_mgr642);
      _ -> ok
    end,
    repair_account_data(Times),
    EndTime = min(AccountTime, PeriodEndTime),
    sys_env:save(holiday_camp_war_period,
		 {Period, 4, EndTime}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr647, _,
       {__Levelholiday_camp_war_mgr647,
	__Tracesholiday_camp_war_mgr647}}
	  when __Levelholiday_camp_war_mgr647 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr647 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, do_handle_info}, {line, 647},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "阵营战进入 第二阶段-匹配挑战", none, 4096, 64,
		       __Levelholiday_camp_war_mgr647,
		       __Tracesholiday_camp_war_mgr647, lager_event,
		       __Pidholiday_camp_war_mgr647);
      _ -> ok
    end,
    sync_state(),
    util:set_timer(second_account_timer,
		   max(1, EndTime - date:unixtime()), second_account),
    util:set_timer(second_zero_timer,
		   date:next_diff({0, 0, 1}), second_zero),
    {noreply, State};
do_handle_info(second_account,
	       State = #state{next_rank = NextRankList}) ->
    {Period, _OldState, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    {_, PEndTime, _, _, _} =
	holiday_camp_war_data:get_period(Period),
    PeriodEndTime = date:parse_time(PEndTime),
    case date:unixtime() >= PeriodEndTime of
      false ->
	  second_combat_accout(),
	  {AccountTime, Times} = calc_recently_accout(Period),
	  repair_account_data(Times),
	  sys_env:save(holiday_camp_war_period,
		       {Period, 4, AccountTime}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr667, _,
	     {__Levelholiday_camp_war_mgr667,
	      __Tracesholiday_camp_war_mgr667}}
		when __Levelholiday_camp_war_mgr667 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr667 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, do_handle_info}, {line, 667},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "阵营战第二阶段 继续第二阶段-匹配挑战", none, 4096, 64,
			     __Levelholiday_camp_war_mgr667,
			     __Tracesholiday_camp_war_mgr667, lager_event,
			     __Pidholiday_camp_war_mgr667);
	    _ -> ok
	  end,
	  sync_state(),
	  util:set_timer(second_account_timer,
			 max(1, AccountTime - date:unixtime()), second_account),
	  {noreply, State};
      _ ->
	  second_combat_accout(),
	  second_accout(),
	  season_account(Period, NextRankList),
	  NewState = clear_old_data(State),
	  util:unset_timer(second_zero_timer),
	  sys_env:save(holiday_camp_war_period, {0, 0, 0}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr680, _,
	     {__Levelholiday_camp_war_mgr680,
	      __Tracesholiday_camp_war_mgr680}}
		when __Levelholiday_camp_war_mgr680 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr680 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, do_handle_info}, {line, 680},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("阵营战周期~w, 赛季结束", [Period]), none,
			     4096, 64, __Levelholiday_camp_war_mgr680,
			     __Tracesholiday_camp_war_mgr680, lager_event,
			     __Pidholiday_camp_war_mgr680);
	    _ -> ok
	  end,
	  sync_state(),
	  {noreply, NewState}
    end;
do_handle_info(second_zero, State) ->
    second_zero(), {noreply, State};
do_handle_info(_Info, State) -> ok, {noreply, State}.

check_period() ->
    {OldPeriod, _OldState, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    case is_period() of
      {Period, _, _} when Period =:= OldPeriod ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr704, _,
	     {__Levelholiday_camp_war_mgr704,
	      __Tracesholiday_camp_war_mgr704}}
		when __Levelholiday_camp_war_mgr704 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr704 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, check_period}, {line, 704},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "阵营战已经开启了", none, 4096, 64,
			     __Levelholiday_camp_war_mgr704,
			     __Tracesholiday_camp_war_mgr704, lager_event,
			     __Pidholiday_camp_war_mgr704);
	    _ -> ok
	  end,
	  Sid = sys_lib:srv_id(),
	  MainId = holiday_camp_war_db:get_main_id(Sid, Period),
	  cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
			   [{req_sync_state, Sid, Period, MainId}]);
      {Period, _, _} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr710, _,
	     {__Levelholiday_camp_war_mgr710,
	      __Tracesholiday_camp_war_mgr710}}
		when __Levelholiday_camp_war_mgr710 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr710 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, check_period}, {line, 710},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "阵营战开启新周期", none, 4096, 64,
			     __Levelholiday_camp_war_mgr710,
			     __Tracesholiday_camp_war_mgr710, lager_event,
			     __Pidholiday_camp_war_mgr710);
	    _ -> ok
	  end,
	  Sid = sys_lib:srv_id(),
	  FullIds = sys_lib:srv_full_id(),
	  AllSids = [Sid | lists:delete(Sid, FullIds)],
	  {MainId, _MainList} = case
				  cluster_dynamic_group:get_group(1)
				    of
				  {true,
				   #cluster_dynamic_local_group{main =
								    MainSrvId,
								list =
								    MainListT}}
				      when MainSrvId =/= undefined ->
				      {MainSrvId, MainListT};
				  _ -> {Sid, [Sid]}
				end,
	  MainInfo = [{{SidT, Period}, MainId}
		      || SidT <- AllSids],
	  ets:insert(holiday_camp_war_main_ids, MainInfo),
	  dets:insert(holiday_camp_war_main_ids, MainInfo),
	  cluster_lib:cast(center, c_holiday_camp_war_mgr,
			   update_ets,
			   [c_holiday_camp_war_main_ids, MainInfo, all]),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr726, _,
	     {__Levelholiday_camp_war_mgr726,
	      __Tracesholiday_camp_war_mgr726}}
		when __Levelholiday_camp_war_mgr726 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr726 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, check_period}, {line, 726},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("主服为:~w", [MainId]), none, 4096, 64,
			     __Levelholiday_camp_war_mgr726,
			     __Tracesholiday_camp_war_mgr726, lager_event,
			     __Pidholiday_camp_war_mgr726);
	    _ -> ok
	  end,
	  cluster_lib:cast(MainId, holiday_camp_war_mgr, info,
			   [{req_sync_state, Sid, Period, MainId}]);
      _ -> sys_env:save(holiday_camp_war_period, {0, 0, 0})
    end.

vote_handle() ->
    MainIds = sys_env:get(main_ids, []),
    [do_vote_handle(MainId, 100) || MainId <- MainIds],
    [do_vote_handle(MainId, 200) || MainId <- MainIds],
    Fun = fun (Data = #holiday_camp_war_role{}, Acc) ->
		  [Data#holiday_camp_war_role{last_score = 0} | Acc]
	  end,
    List = ets:foldl(Fun, [], holiday_camp_war_role),
    ets:insert(holiday_camp_war_role, List),
    ok.

do_vote_handle(MainId, CampId) ->
    [#holiday_camp_war_camp_info{can_combat_fort =
				     CombatListT,
				 vote_list = VoteListT}
     | _] =
	ets:lookup(holiday_camp_war_camp_info,
		   {CampId, MainId}),
    case VoteListT of
      [_ | _] ->
	  [{Id, _} | _] = lists:reverse(lists:keysort(2,
						      VoteListT)),
	  case lists:member(Id, CombatListT) of
	    true ->
		[FortData = #holiday_camp_war_fort{} | _] =
		    ets:lookup(holiday_camp_war_fort, {Id, MainId}),
		NewFortData = util:if_true(CampId =:= 100,
					   FortData#holiday_camp_war_fort{a_up =
									      1},
					   FortData#holiday_camp_war_fort{b_up =
									      1}),
		ets:insert(holiday_camp_war_fort, NewFortData);
	    _ -> skip
	  end;
      _ -> skip
    end.

first_accout() ->
    MainIds = sys_env:get(main_ids, []),
    put(first_accout, []),
    [do_first_accout(MainId) || MainId <- MainIds],
    Fun = fun (#holiday_camp_war_role{id = {RoleId, MainId},
				      camp_id = CampId},
	       Acc) ->
		  FirstAccount = util:get(first_accout, []),
		  case lists:keyfind({MainId, CampId}, 1, FirstAccount) of
		    {_, win} ->
			case
			  holiday_camp_war_data:get_const(first_accout_win_award)
			    of
			  Award = [_ | _] ->
			      {MailAssets, MailItems} =
				  format:split_assets_items(Award),
			      Mail = {lang:get(<<"双生歌姬阶段结算"/utf8>>),
				      lang:get(<<"亲爱的冒险者大人：恭喜大大在双生歌姬作战活动的第一阶段中，所属阵营获得最终胜利，以下是您的"
						 "阵营奖励"/utf8>>),
				      MailAssets, MailItems,
				      <<"双生歌姬阶段结算"/utf8>>},
			      mail:send(RoleId, Mail),
			      Acc + 1;
			  _ -> Acc
			end;
		    {_, lose} ->
			case
			  holiday_camp_war_data:get_const(first_accout_lose_award)
			    of
			  Award = [_ | _] ->
			      {MailAssets, MailItems} =
				  format:split_assets_items(Award),
			      Mail = {lang:get(<<"双生歌姬阶段结算"/utf8>>),
				      lang:get(<<"亲爱的冒险者大人：大大在双生歌姬作战活动的第一阶段中，虽然所属阵营遗憾落败，我们依然为您准"
						 "备了阵营奖励，请不要灰心~再接再厉！"/utf8>>),
				      MailAssets, MailItems,
				      <<"双生歌姬阶段结算"/utf8>>},
			      mail:send(RoleId, Mail),
			      Acc + 1;
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    Num = ets:foldl(Fun, 0, holiday_camp_war_role),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr796, _,
       {__Levelholiday_camp_war_mgr796,
	__Tracesholiday_camp_war_mgr796}}
	  when __Levelholiday_camp_war_mgr796 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr796 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, first_accout}, {line, 796},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("阵营战第一阶段结算完成, 总共结算了~w人", [Num]), none,
		       4096, 64, __Levelholiday_camp_war_mgr796,
		       __Tracesholiday_camp_war_mgr796, lager_event,
		       __Pidholiday_camp_war_mgr796);
      _ -> ok
    end,
    ok.

do_first_accout(MainId) ->
    [FortData = #holiday_camp_war_fort{} | _] =
	ets:lookup(holiday_camp_war_fort, {0, MainId}),
    [CampA = #holiday_camp_war_camp_info{medal_score =
					     MedalScoreA,
					 score = ScoreA}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {100, MainId}),
    [CampB = #holiday_camp_war_camp_info{medal_score =
					     MedalScoreB,
					 score = ScoreB}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {200, MainId}),
    if MedalScoreA > MedalScoreB ->
	   FirstAccount = util:get(first_accout, []),
	   FirstAccount1 = lists:keystore({MainId, 100}, 1,
					  FirstAccount, {{MainId, 100}, win}),
	   FirstAccount2 = lists:keystore({MainId, 200}, 1,
					  FirstAccount1, {{MainId, 200}, lose}),
	   ets:insert(holiday_camp_war_fort,
		      FortData#holiday_camp_war_fort{belong = 100}),
	   put(first_accout, FirstAccount2);
       MedalScoreA < MedalScoreB ->
	   FirstAccount = util:get(first_accout, []),
	   FirstAccount1 = lists:keystore({MainId, 100}, 1,
					  FirstAccount, {{MainId, 100}, lose}),
	   FirstAccount2 = lists:keystore({MainId, 200}, 1,
					  FirstAccount1, {{MainId, 200}, win}),
	   ets:insert(holiday_camp_war_fort,
		      FortData#holiday_camp_war_fort{belong = 200}),
	   put(first_accout, FirstAccount2);
       true ->
	   case ScoreA > ScoreB of
	     true ->
		 FirstAccount = util:get(first_accout, []),
		 FirstAccount1 = lists:keystore({MainId, 100}, 1,
						FirstAccount,
						{{MainId, 100}, win}),
		 FirstAccount2 = lists:keystore({MainId, 200}, 1,
						FirstAccount1,
						{{MainId, 200}, lose}),
		 ets:insert(holiday_camp_war_fort,
			    FortData#holiday_camp_war_fort{belong = 100}),
		 put(first_accout, FirstAccount2);
	     _ ->
		 FirstAccount = util:get(first_accout, []),
		 FirstAccount1 = lists:keystore({MainId, 100}, 1,
						FirstAccount,
						{{MainId, 100}, lose}),
		 FirstAccount2 = lists:keystore({MainId, 200}, 1,
						FirstAccount1,
						{{MainId, 200}, win}),
		 ets:insert(holiday_camp_war_fort,
			    FortData#holiday_camp_war_fort{belong = 200}),
		 put(first_accout, FirstAccount2)
	   end
    end,
    NewCampA = CampA#holiday_camp_war_camp_info{medal_score
						    = 0,
						last_medal_score = 0,
						old_medal_score = 0, score = 0},
    NewCampB = CampB#holiday_camp_war_camp_info{medal_score
						    = 0,
						last_medal_score = 0,
						old_medal_score = 0, score = 0},
    ets:insert(holiday_camp_war_camp_info,
	       [NewCampA, NewCampB]).

day_account(Period, Flag) ->
    MainIds = sys_env:get(main_ids, []),
    [do_day_account(MainId, Period, Flag)
     || MainId <- MainIds],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr840, _,
       {__Levelholiday_camp_war_mgr840,
	__Tracesholiday_camp_war_mgr840}}
	  when __Levelholiday_camp_war_mgr840 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr840 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, day_account}, {line, 840},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "阵营战第一阶段每日结算完成", none, 4096, 64,
		       __Levelholiday_camp_war_mgr840,
		       __Tracesholiday_camp_war_mgr840, lager_event,
		       __Pidholiday_camp_war_mgr840);
      _ -> ok
    end,
    ok.

do_day_account(MainId, Period, Flag) ->
    [CampA = #holiday_camp_war_camp_info{medal_score =
					     MedalScoreA,
					 have_fort = HaveFortA,
					 can_combat_fort = CombatListA,
					 last_fort_num = LastFortNumA,
					 last_medal_score = LastMedalScoreA}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {100, MainId}),
    [CampB = #holiday_camp_war_camp_info{medal_score =
					     MedalScoreB,
					 have_fort = HaveFortB,
					 can_combat_fort = CombatListB,
					 last_fort_num = LastFortNumB,
					 last_medal_score = LastMedalScoreB}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {200, MainId}),
    {NewHaveFortA, NewHaveFortB} =
	calc_change_fort(HaveFortA, HaveFortB, CombatListA,
			 CombatListB, MainId),
    NewCombatListA = util:if_true(Flag =:= true, [0],
				  calc_atk_fort(NewHaveFortA, 100, Period,
						MainId)),
    NewCombatListB = util:if_true(Flag =:= true, [0],
				  calc_atk_fort(NewHaveFortB, 200, Period,
						MainId)),
    NewMedalScoreA = calc_medal_score(NewHaveFortA,
				      MedalScoreA, Period)
		       + calc_extra_medal_score(NewHaveFortA, Period),
    NewMedalScoreB = calc_medal_score(NewHaveFortB,
				      MedalScoreB, Period)
		       + calc_extra_medal_score(NewHaveFortB, Period),
    NewCampA = CampA#holiday_camp_war_camp_info{medal_score
						    = NewMedalScoreA,
						have_fort = NewHaveFortA,
						can_combat_fort =
						    NewCombatListA,
						vote_list = [],
						old_fort_num = LastFortNumA,
						last_fort_num =
						    length(NewHaveFortA) - 1,
						old_medal_score =
						    LastMedalScoreA,
						last_medal_score =
						    NewMedalScoreA},
    NewCampB = CampB#holiday_camp_war_camp_info{medal_score
						    = NewMedalScoreB,
						have_fort = NewHaveFortB,
						can_combat_fort =
						    NewCombatListB,
						vote_list = [],
						old_fort_num = LastFortNumB,
						last_fort_num =
						    length(NewHaveFortB) - 1,
						old_medal_score =
						    LastMedalScoreB,
						last_medal_score =
						    NewMedalScoreB},
    ets:insert(holiday_camp_war_camp_info,
	       [NewCampA, NewCampB]).

calc_extra_medal_score(HaveFort, Period) ->
    AllZone = holiday_camp_war_data:get_zone_list(Period),
    Fun1 = fun (Id) -> lists:member(Id, HaveFort) end,
    Fun2 = fun ({_ZoneId, FortList, ExtraMedal}, Acc) ->
		   case lists:all(Fun1, FortList) of
		     true -> Acc + ExtraMedal;
		     _ -> Acc
		   end
	   end,
    Extra = lists:foldl(Fun2, 0, AllZone),
    Extra.

calc_medal_score(HaveFort, MedalScore, Period) ->
    Fun = fun (Id, Acc) ->
		  Acc +
		    holiday_camp_war_data:get_medal_score({Period, Id})
	  end,
    NewHaveFort = [HId
		   || HId <- HaveFort, HId > 0 andalso HId < 100],
    AddScore = lists:foldl(Fun, 0, NewHaveFort),
    MedalScore + AddScore.

calc_atk_fort(HaveFort, CampId, Period, MainId) ->
    OppoCampId = util:if_true(CampId =:= 100, 200, 100),
    Fun1 = fun (Id, Acc) when Id =/= 0 ->
		   Acc ++
		     holiday_camp_war_data:get_neighbor_fort({Period, Id});
	       (_Id, Acc) -> Acc
	   end,
    AllNeighborFort = lists:usort(HaveFort ++
				    [Fid
				     || Fid <- lists:foldl(Fun1, [], HaveFort),
					Fid > 0]),
    Fun2 = fun (Id) ->
		   [#holiday_camp_war_fort{belong = Belong} | _] =
		       ets:lookup(holiday_camp_war_fort, {Id, MainId}),
		   case Belong =:= OppoCampId of
		     true -> true;
		     _ -> false
		   end
	   end,
    Fun3 = fun (Id, Acc) ->
		   [#holiday_camp_war_fort{belong = Belong} | _] =
		       ets:lookup(holiday_camp_war_fort, {Id, MainId}),
		   case Belong of
		     0 -> [Id | Acc];
		     OppoCampId -> [Id | Acc];
		     _ when Belong =:= CampId ->
			 NList =
			     holiday_camp_war_data:get_neighbor_fort({Period,
								      Id}),
			 case lists:any(Fun2, NList) of
			   true -> [Id | Acc];
			   _ -> Acc
			 end;
		     _ -> Acc
		   end
	   end,
    AtkList = lists:foldl(Fun3, [], AllNeighborFort),
    AtkList.

calc_change_fort(HaveFortA, HaveFortB, CombatListA,
		 CombatListB, MainId) ->
    ChangeFort = lists:usort(CombatListA ++ CombatListB),
    HaveFortA1 = HaveFortA -- ChangeFort,
    HaveFortB1 = HaveFortB -- ChangeFort,
    Fun = fun (Id, {Acc1, Acc2}) ->
		  [FortData = #holiday_camp_war_fort{a_score = AScore,
						     b_score = BScore,
						     belong = OldBelong}
		   | _] =
		      ets:lookup(holiday_camp_war_fort, {Id, MainId}),
		  case AScore =/= BScore of
		    true ->
			case AScore > BScore of
			  true ->
			      ets:insert(holiday_camp_war_fort,
					 FortData#holiday_camp_war_fort{a_score
									    = 0,
									b_score
									    = 0,
									a_up =
									    0,
									b_up =
									    0,
									log =
									    [],
									belong =
									    100}),
			      {[Id | Acc1], Acc2};
			  _ ->
			      ets:insert(holiday_camp_war_fort,
					 FortData#holiday_camp_war_fort{a_score
									    = 0,
									b_score
									    = 0,
									a_up =
									    0,
									b_up =
									    0,
									log =
									    [],
									belong =
									    200}),
			      {Acc1, [Id | Acc2]}
			end;
		    _ ->
			if OldBelong =:= 100 ->
			       ets:insert(holiday_camp_war_fort,
					  FortData#holiday_camp_war_fort{a_score
									     =
									     0,
									 b_score
									     =
									     0,
									 a_up =
									     0,
									 b_up =
									     0,
									 log =
									     [],
									 belong
									     =
									     100}),
			       {[Id | Acc1], Acc2};
			   OldBelong =:= 200 ->
			       ets:insert(holiday_camp_war_fort,
					  FortData#holiday_camp_war_fort{a_score
									     =
									     0,
									 b_score
									     =
									     0,
									 a_up =
									     0,
									 b_up =
									     0,
									 log =
									     [],
									 belong
									     =
									     200}),
			       {Acc1, [Id | Acc2]};
			   true ->
			       ets:insert(holiday_camp_war_fort,
					  FortData#holiday_camp_war_fort{a_score
									     =
									     0,
									 b_score
									     =
									     0,
									 a_up =
									     0,
									 b_up =
									     0,
									 log =
									     []}),
			       {Acc1, Acc2}
			end
		  end
	  end,
    {HaveFortA2, HaveFortB2} = lists:foldl(Fun,
					   {HaveFortA1, HaveFortB1},
					   ChangeFort),
    {HaveFortA2, HaveFortB2}.

calc_recently_accout(Period) ->
    {_, PEndTime, _, _, _} =
	holiday_camp_war_data:get_period(Period),
    PeriodEndTime = date:parse_time(PEndTime),
    IntervalTime =
	holiday_camp_war_data:get_second_accout_interval(Period),
    SecondStartTime =
	date:parse_time(holiday_camp_war_data:get_second_start_time(Period)),
    Now = date:unixtime(),
    {AccountTime, Times} =
	do_calc_recently_accout(min(SecondStartTime +
				      IntervalTime,
				    PeriodEndTime),
				IntervalTime, PeriodEndTime, Now, 0),
    {AccountTime, Times}.

do_calc_recently_accout(AccountTime, _IntervalTime,
			_PeriodEndTime, Now, Times)
    when AccountTime > Now ->
    {AccountTime, Times};
do_calc_recently_accout(AccountTime, IntervalTime,
			PeriodEndTime, Now, Times) ->
    NewAccountTime = min(AccountTime + IntervalTime,
			 PeriodEndTime),
    do_calc_recently_accout(NewAccountTime, IntervalTime,
			    PeriodEndTime, Now, Times + 1).

repair_account_data(Times) ->
    MainIds = sys_env:get(main_ids, []),
    [do_repair_account_data(MainId, Times)
     || MainId <- MainIds].

do_repair_account_data(MainId, Times) ->
    [FortData = #holiday_camp_war_fort{state_log = StateLog}
     | _] =
	ets:lookup(holiday_camp_war_fort, {0, MainId}),
    NewStateLog = do_repair_state_log(StateLog, Times, 1),
    NewFortData = FortData#holiday_camp_war_fort{state_log =
						     NewStateLog},
    ets:insert(holiday_camp_war_fort, NewFortData).

do_repair_state_log(StateLog, Times1, Times2)
    when Times2 > Times1 ->
    case lists:keyfind(Times1 + 1, 1, StateLog) of
      false ->
	  lists:keystore(Times1 + 1, 1, StateLog,
			 {Times1 + 1, 0, 2, 0, 0});
      _ -> StateLog
    end;
do_repair_state_log(StateLog, Times1, Times2) ->
    NewStateLog = case lists:keymember(Times2, 1, StateLog)
		      of
		    false ->
			lists:keystore(Times2, 1, StateLog,
				       {Times2, 0, 1, 0, 0});
		    _ -> StateLog
		  end,
    do_repair_state_log(NewStateLog, Times1, Times2 + 1).

second_combat_accout() ->
    MainIds = sys_env:get(main_ids, []),
    [do_second_combat_accout(MainId) || MainId <- MainIds],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr1011, _,
       {__Levelholiday_camp_war_mgr1011,
	__Tracesholiday_camp_war_mgr1011}}
	  when __Levelholiday_camp_war_mgr1011 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr1011 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, second_combat_accout}, {line, 1011},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "阵营战第二阶段周期结算完成", none, 4096, 64,
		       __Levelholiday_camp_war_mgr1011,
		       __Tracesholiday_camp_war_mgr1011, lager_event,
		       __Pidholiday_camp_war_mgr1011);
      _ -> ok
    end.

do_second_combat_accout(MainId) ->
    [FortData = #holiday_camp_war_fort{a_score = AScore,
				       b_score = BScore, state_log = StateLog}
     | _] =
	ets:lookup(holiday_camp_war_fort, {0, MainId}),
    [CampA = #holiday_camp_war_camp_info{medal_score =
					     MedalScoreA,
					 score_time = ScoreTimeA}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {100, MainId}),
    [CampB = #holiday_camp_war_camp_info{medal_score =
					     MedalScoreB,
					 score_time = ScoreTimeB}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {200, MainId}),
    [{MaxState, _, _, _, _} | _] =
	lists:reverse(lists:keysort(1, StateLog)),
    if AScore > BScore ->
	   NewStateLog = lists:keystore(MaxState, 1, StateLog,
					{MaxState, 100, 1, AScore, BScore}),
	   ets:insert(holiday_camp_war_fort,
		      FortData#holiday_camp_war_fort{a_score = 0, b_score = 0,
						     belong = 100,
						     state_log = NewStateLog}),
	   NewCampA = CampA#holiday_camp_war_camp_info{medal_score
							   =
							   MedalScoreA +
							     holiday_camp_war_data:get_const(second_accout_camp_win_medal),
						       score = 0},
	   NewCampB = CampB#holiday_camp_war_camp_info{medal_score
							   =
							   MedalScoreB +
							     holiday_camp_war_data:get_const(second_accout_camp_lose_medal),
						       score = 0},
	   ets:insert(holiday_camp_war_camp_info,
		      [NewCampA, NewCampB]);
       AScore < BScore ->
	   NewStateLog = lists:keystore(MaxState, 1, StateLog,
					{MaxState, 200, 1, AScore, BScore}),
	   ets:insert(holiday_camp_war_fort,
		      FortData#holiday_camp_war_fort{a_score = 0, b_score = 0,
						     belong = 200,
						     state_log = NewStateLog}),
	   NewCampA = CampA#holiday_camp_war_camp_info{medal_score
							   =
							   MedalScoreA +
							     holiday_camp_war_data:get_const(second_accout_camp_lose_medal),
						       score = 0},
	   NewCampB = CampB#holiday_camp_war_camp_info{medal_score
							   =
							   MedalScoreB +
							     holiday_camp_war_data:get_const(second_accout_camp_win_medal),
						       score = 0},
	   ets:insert(holiday_camp_war_camp_info,
		      [NewCampA, NewCampB]);
       true ->
	   case ScoreTimeA < ScoreTimeB of
	     true ->
		 NewStateLog = lists:keystore(MaxState, 1, StateLog,
					      {MaxState, 100, 1, AScore,
					       BScore}),
		 ets:insert(holiday_camp_war_fort,
			    FortData#holiday_camp_war_fort{a_score = 0,
							   b_score = 0,
							   belong = 100,
							   state_log =
							       NewStateLog}),
		 NewCampA = CampA#holiday_camp_war_camp_info{medal_score
								 =
								 MedalScoreA +
								   holiday_camp_war_data:get_const(second_accout_camp_win_medal),
							     score = 0},
		 NewCampB = CampB#holiday_camp_war_camp_info{medal_score
								 =
								 MedalScoreB +
								   holiday_camp_war_data:get_const(second_accout_camp_lose_medal),
							     score = 0},
		 ets:insert(holiday_camp_war_camp_info,
			    [NewCampA, NewCampB]);
	     _ ->
		 NewStateLog = lists:keystore(MaxState, 1, StateLog,
					      {MaxState, 200, 1, AScore,
					       BScore}),
		 ets:insert(holiday_camp_war_fort,
			    FortData#holiday_camp_war_fort{a_score = 0,
							   b_score = 0,
							   belong = 200,
							   state_log =
							       NewStateLog}),
		 NewCampA = CampA#holiday_camp_war_camp_info{medal_score
								 =
								 MedalScoreA +
								   holiday_camp_war_data:get_const(second_accout_camp_lose_medal),
							     score = 0},
		 NewCampB = CampB#holiday_camp_war_camp_info{medal_score
								 =
								 MedalScoreB +
								   holiday_camp_war_data:get_const(second_accout_camp_win_medal),
							     score = 0},
		 ets:insert(holiday_camp_war_camp_info,
			    [NewCampA, NewCampB])
	   end
    end.

second_zero() ->
    MainIds = sys_env:get(main_ids, []),
    [do_second_zero(MainId) || MainId <- MainIds],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr1060, _,
       {__Levelholiday_camp_war_mgr1060,
	__Tracesholiday_camp_war_mgr1060}}
	  when __Levelholiday_camp_war_mgr1060 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr1060 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, second_zero}, {line, 1060},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "阵营战第二阶段0点处理完成", none, 4096, 64,
		       __Levelholiday_camp_war_mgr1060,
		       __Tracesholiday_camp_war_mgr1060, lager_event,
		       __Pidholiday_camp_war_mgr1060);
      _ -> ok
    end.

do_second_zero(MainId) ->
    [CampA = #holiday_camp_war_camp_info{medal_score =
					     MedalScoreA,
					 last_medal_score = LastMedalScoreA}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {100, MainId}),
    [CampB = #holiday_camp_war_camp_info{medal_score =
					     MedalScoreB,
					 last_medal_score = LastMedalScoreB}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {200, MainId}),
    NewCampA =
	CampA#holiday_camp_war_camp_info{old_medal_score =
					     LastMedalScoreA,
					 last_medal_score = MedalScoreA},
    NewCampB =
	CampB#holiday_camp_war_camp_info{old_medal_score =
					     LastMedalScoreB,
					 last_medal_score = MedalScoreB},
    ets:insert(holiday_camp_war_camp_info,
	       [NewCampA, NewCampB]).

second_accout() ->
    MainIds = sys_env:get(main_ids, []),
    put(second_combat_accout, []),
    [do_second_accout(MainId) || MainId <- MainIds],
    Fun = fun (#holiday_camp_war_role{id = {RoleId, MainId},
				      camp_id = CampId},
	       Acc) ->
		  FirstAccount = util:get(second_combat_accout, []),
		  case lists:keyfind({MainId, CampId}, 1, FirstAccount) of
		    {_, win} ->
			case
			  holiday_camp_war_data:get_const(second_accout_win_award)
			    of
			  Award = [_ | _] ->
			      {MailAssets, MailItems} =
				  format:split_assets_items(Award),
			      Mail = {lang:get(<<"双生歌姬阶段结算"/utf8>>),
				      lang:get(<<"亲爱的冒险者大人：恭喜大大在双生歌姬作战活动的第二阶段中，所属阵营获得最终胜利，以下是您的"
						 "阵营奖励"/utf8>>),
				      MailAssets, MailItems,
				      <<"双生歌姬阶段结算"/utf8>>},
			      mail:send(RoleId, Mail),
			      Acc + 1;
			  _ -> Acc
			end;
		    {_, lose} ->
			case
			  holiday_camp_war_data:get_const(second_accout_lose_award)
			    of
			  Award = [_ | _] ->
			      {MailAssets, MailItems} =
				  format:split_assets_items(Award),
			      Mail = {lang:get(<<"双生歌姬阶段结算"/utf8>>),
				      lang:get(<<"亲爱的冒险者大人：大大在双生歌姬作战活动的第二阶段中，所属阵营遗憾落败，我们仍然为您准备了"
						 "阵营奖励，请不要灰心~再接再厉！"/utf8>>),
				      MailAssets, MailItems,
				      <<"双生歌姬阶段结算"/utf8>>},
			      mail:send(RoleId, Mail),
			      Acc + 1;
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    Num = ets:foldl(Fun, 0, holiday_camp_war_role),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr1102, _,
       {__Levelholiday_camp_war_mgr1102,
	__Tracesholiday_camp_war_mgr1102}}
	  when __Levelholiday_camp_war_mgr1102 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr1102 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, second_accout}, {line, 1102},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("阵营战第二阶段结算完成, 总共结算了~w人", [Num]), none,
		       4096, 64, __Levelholiday_camp_war_mgr1102,
		       __Tracesholiday_camp_war_mgr1102, lager_event,
		       __Pidholiday_camp_war_mgr1102);
      _ -> ok
    end,
    ok.

do_second_accout(MainId) ->
    [#holiday_camp_war_camp_info{medal_score = MedalScoreA}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {100, MainId}),
    [#holiday_camp_war_camp_info{medal_score = MedalScoreB}
     | _] =
	ets:lookup(holiday_camp_war_camp_info, {200, MainId}),
    if MedalScoreA > MedalScoreB ->
	   FirstAccount = util:get(second_combat_accout, []),
	   FirstAccount1 = lists:keystore({MainId, 100}, 1,
					  FirstAccount, {{MainId, 100}, win}),
	   FirstAccount2 = lists:keystore({MainId, 200}, 1,
					  FirstAccount1, {{MainId, 200}, lose}),
	   put(second_combat_accout, FirstAccount2);
       true ->
	   FirstAccount = util:get(second_combat_accout, []),
	   FirstAccount1 = lists:keystore({MainId, 100}, 1,
					  FirstAccount, {{MainId, 100}, lose}),
	   FirstAccount2 = lists:keystore({MainId, 200}, 1,
					  FirstAccount1, {{MainId, 200}, win}),
	   put(second_combat_accout, FirstAccount2)
    end.

season_account(Period, NextRankList) ->
    Fun = fun (Data = #holiday_camp_war_rank{rank =
						 {Rank, CampId, MainId},
					     id = RoleId},
	       {Acc1, Acc2}) ->
		  MaxRank = max(100,
				list_util:keyfind({CampId, MainId},
						  NextRankList, 1)
				  - 1),
		  Per = util:uceil(Rank * 100 / MaxRank),
		  case holiday_camp_war_data:get_rank_reward({Period,
							      Per})
		      of
		    Reward = [_ | _] ->
			Title = lang:get(<<"双生歌姬作战排行奖励发放"/utf8>>),
			{MailAssets, MailItems} =
			    format:split_assets_items(Reward),
			Content =
			    color:msg(lang:get(<<"尊敬的冒险者大人：大大在本期的双生歌姬作战活动中表现优异，最终排名为前~ts%，我们为您准"
						 "备了丰厚的排名奖励，请查收！"/utf8>>),
				      [{green, Per}]),
			Mail = {Title, Content, MailAssets, MailItems,
				util:fbin(<<"双生歌姬作战排行奖励发放"/utf8>>, [])},
			mail:send(RoleId, Mail),
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
			  {__Pidholiday_camp_war_mgr1132, _,
			   {__Levelholiday_camp_war_mgr1132,
			    __Tracesholiday_camp_war_mgr1132}}
			      when __Levelholiday_camp_war_mgr1132 band 64 /= 0
				     orelse
				     __Tracesholiday_camp_war_mgr1132 /= [] ->
			      lager:do_log(info,
					   [{module, holiday_camp_war_mgr},
					    {function, season_account},
					    {line, 1132},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("双生歌姬作战排行奖励发放:~w",
							 [{Rank, RoleId}]),
					   none, 4096, 64,
					   __Levelholiday_camp_war_mgr1132,
					   __Tracesholiday_camp_war_mgr1132,
					   lager_event,
					   __Pidholiday_camp_war_mgr1132);
			  _ -> ok
			end,
			{Acc1 + 1,
			 [Data#holiday_camp_war_rank{rank =
							 {Rank, CampId, MainId,
							  Period}}
			  | Acc2]};
		    _ -> {Acc1, Acc2}
		  end
	  end,
    {Num, RankList} = ets:foldl(Fun, {0, []},
				holiday_camp_war_rank),
    ets:insert(holiday_camp_war_other, RankList),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr1141, _,
       {__Levelholiday_camp_war_mgr1141,
	__Tracesholiday_camp_war_mgr1141}}
	  when __Levelholiday_camp_war_mgr1141 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr1141 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, season_account}, {line, 1141},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("双生歌姬作战排行奖励发放完成，共结算:~w人", [Num]), none,
		       4096, 64, __Levelholiday_camp_war_mgr1141,
		       __Tracesholiday_camp_war_mgr1141, lager_event,
		       __Pidholiday_camp_war_mgr1141);
      _ -> ok
    end.

init_fort(MainId, Period, NextRankList) ->
    case ets:lookup(holiday_camp_war_camp_info,
		    {100, MainId})
	of
      [_ | _] -> skip;
      _ ->
	  CombatFortA =
	      holiday_camp_war_data:get_neighbor_fort({Period, 100}),
	  CombatFortB =
	      holiday_camp_war_data:get_neighbor_fort({Period, 200}),
	  CampA = #holiday_camp_war_camp_info{id = {100, MainId},
					      have_fort = [100],
					      can_combat_fort = CombatFortA},
	  CampB = #holiday_camp_war_camp_info{id = {200, MainId},
					      have_fort = [200],
					      can_combat_fort = CombatFortB},
	  ets:insert(holiday_camp_war_camp_info, [CampA, CampB]),
	  dets:insert(holiday_camp_war_camp_info, [CampA, CampB]),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr1159, _,
	     {__Levelholiday_camp_war_mgr1159,
	      __Tracesholiday_camp_war_mgr1159}}
		when __Levelholiday_camp_war_mgr1159 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr1159 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, init_fort}, {line, 1159},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("主服~w初始化阵营数据成功！", [MainId]), none,
			     4096, 64, __Levelholiday_camp_war_mgr1159,
			     __Tracesholiday_camp_war_mgr1159, lager_event,
			     __Pidholiday_camp_war_mgr1159);
	    _ -> ok
	  end
    end,
    case ets:lookup(holiday_camp_war_fort, {1, MainId}) of
      [_ | _] -> skip;
      _ ->
	  WorldLev = world_lev:get_world_lev(),
	  UnitList =
	      holiday_camp_war_data:match_unit_list({Period,
						     WorldLev}),
	  AllFort = holiday_camp_war_data:get_all_fort(Period),
	  Fun = fun ({Id, Difficulty}, Acc) ->
			UnitId = list_util:keyfind(Id, UnitList, 0),
			Belong = if Id =:= 100 -> 100;
				    Id =:= 200 -> 200;
				    true -> 0
				 end,
			[#holiday_camp_war_fort{id = {Id, MainId},
						unit_id = UnitId,
						difficulty = Difficulty,
						belong = Belong}
			 | Acc]
		end,
	  FortList = lists:foldl(Fun, [], AllFort),
	  ets:insert(holiday_camp_war_fort, FortList),
	  dets:insert(holiday_camp_war_fort, FortList),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_camp_war_mgr1182, _,
	     {__Levelholiday_camp_war_mgr1182,
	      __Tracesholiday_camp_war_mgr1182}}
		when __Levelholiday_camp_war_mgr1182 band 64 /= 0 orelse
		       __Tracesholiday_camp_war_mgr1182 /= [] ->
		lager:do_log(info,
			     [{module, holiday_camp_war_mgr},
			      {function, init_fort}, {line, 1182},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("主服~w初始化据点数据成功！", [MainId]), none,
			     4096, 64, __Levelholiday_camp_war_mgr1182,
			     __Tracesholiday_camp_war_mgr1182, lager_event,
			     __Pidholiday_camp_war_mgr1182);
	    _ -> ok
	  end
    end,
    NewNextRankList = case lists:keyfind({100, MainId}, 1,
					 NextRankList)
			  of
			false ->
			    NextRankList1 = lists:keystore({100, MainId}, 1,
							   NextRankList,
							   {{100, MainId}, 1}),
			    NextRankList2 = lists:keystore({200, MainId}, 1,
							   NextRankList1,
							   {{200, MainId}, 1}),
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
			      {__Pidholiday_camp_war_mgr1191, _,
			       {__Levelholiday_camp_war_mgr1191,
				__Tracesholiday_camp_war_mgr1191}}
				  when __Levelholiday_camp_war_mgr1191 band 64
					 /= 0
					 orelse
					 __Tracesholiday_camp_war_mgr1191 /=
					   [] ->
				  lager:do_log(info,
					       [{module, holiday_camp_war_mgr},
						{function, init_fort},
						{line, 1191},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("主服~w初始化排名数据成功！",
							     [MainId]),
					       none, 4096, 64,
					       __Levelholiday_camp_war_mgr1191,
					       __Tracesholiday_camp_war_mgr1191,
					       lager_event,
					       __Pidholiday_camp_war_mgr1191);
			      _ -> ok
			    end,
			    NextRankList2;
			_ -> NextRankList
		      end,
    NewNextRankList.

clear_old_data(State) ->
    ets:delete_all_objects(holiday_camp_war_rank),
    ets:delete_all_objects(holiday_camp_war_camp_info),
    dets:delete_all_objects(holiday_camp_war_camp_info),
    ets:delete_all_objects(holiday_camp_war_fort),
    dets:delete_all_objects(holiday_camp_war_fort),
    ets:delete_all_objects(role_holiday_camp_war_log),
    dets:delete_all_objects(role_holiday_camp_war_log),
    ets:delete_all_objects(holiday_camp_war_role),
    dets:delete_all_objects(holiday_camp_war_role),
    sys_env:save(main_ids, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_camp_war_mgr1210, _,
       {__Levelholiday_camp_war_mgr1210,
	__Tracesholiday_camp_war_mgr1210}}
	  when __Levelholiday_camp_war_mgr1210 band 64 /= 0 orelse
		 __Tracesholiday_camp_war_mgr1210 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_camp_war_mgr},
			{function, clear_old_data}, {line, 1210},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "双生皮肤阵营战清除旧数据成功", none, 4096, 64,
		       __Levelholiday_camp_war_mgr1210,
		       __Tracesholiday_camp_war_mgr1210, lager_event,
		       __Pidholiday_camp_war_mgr1210);
      _ -> ok
    end,
    State#state{next_rank = []}.

is_period() ->
    Now = date:unixtime(),
    OpenTime = holiday_camp_war_data:period_list(),
    SrvOpenDay = date:open_srv_day(),
    SrvOpenTime = sys_env:get(open_timestamp),
    case is_open_time(OpenTime, Now, SrvOpenDay,
		      SrvOpenTime)
	of
      {true, Period, StartTime, EndTime} ->
	  {Period, StartTime, EndTime};
      _ -> false
    end.

is_open_time([], _Now, _SrvOpenDay, _SrvOpenTime) ->
    false;
is_open_time([{Period, StartTime, EndTime, _OpenCond,
	       OpenDay, OpenTime}
	      | Other],
	     Now, SrvOpenDay, SrvOpenTime) ->
    Time1 = date:parse_time(StartTime) -
	      holiday_mgr:get_holiday_sec(),
    Time2 = date:parse_time(EndTime) -
	      holiday_mgr:get_holiday_sec(),
    case Now >= Time1 andalso
	   Now =< Time2 andalso
	     SrvOpenDay >= OpenDay andalso
	       SrvOpenTime =< date:parse_time(OpenTime)
	of
      true ->
	  case Period =:= 1 of
	    true ->
		SrvList = [<<"symlf_1">>, <<"symlf_2">>, <<"symlf_3">>,
			   <<"symlf_4">>, <<"symlf_5">>, <<"symlf_6">>],
		Sid = sys_lib:srv_id(),
		case lists:member(Sid, SrvList) of
		  true -> {true, Period, Time1, Time2};
		  _ -> is_open_time(Other, Now, SrvOpenDay, SrvOpenTime)
		end;
	    _ -> {true, Period, Time1, Time2}
	  end;
      _ -> is_open_time(Other, Now, SrvOpenDay, SrvOpenTime)
    end.

is_period2() ->
    Now = date:unixtime(),
    OpenTime = holiday_camp_war_data:period_list(),
    case is_open_time2(OpenTime, Now) of
      {true, Period, StartTime, EndTime} ->
	  {Period, StartTime, EndTime};
      _ -> false
    end.

is_open_time2([], _Now) -> false;
is_open_time2([{Period, StartTime, EndTime, _OpenCond,
		_OpenDay, _OpenTime}
	       | Other],
	      Now) ->
    Time1 = date:parse_time(StartTime) -
	      holiday_mgr:get_holiday_sec(),
    Time2 = date:parse_time(EndTime) -
	      holiday_mgr:get_holiday_sec(),
    case Now >= Time1 andalso Now =< Time2 of
      true -> {true, Period, Time1, Time2};
      _ -> is_open_time2(Other, Now)
    end.

sync_state() ->
    {Period, _State, _EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    MainIds = sys_env:get(main_ids, []),
    Fun = fun (MainId, Acc) ->
		  Acc ++ holiday_camp_war_db:get_main_list(MainId, Period)
	  end,
    MainList = lists:foldl(Fun, [], MainIds),
    [sync_state(Sid) || Sid <- MainList],
    ok.

sync_state(Sid) ->
    {Period, State, EndTime} =
	sys_env:get(holiday_camp_war_period, {0, 0, 0}),
    cluster_lib:cast(Sid, holiday_camp_war_mgr, info,
		     [{sync_state, {Period, State, EndTime}}]).

save_main_and_list(MainId, Sid, Period) ->
    MainIds = sys_env:get(main_ids, []),
    NewMainIds = case lists:member(MainId, MainIds) of
		   false -> [MainId | MainIds];
		   _ -> MainIds
		 end,
    sys_env:save(main_ids, NewMainIds),
    OldMainList = holiday_camp_war_db:get_main_list(MainId,
						    Period),
    case lists:member(Sid, OldMainList) of
      false ->
	  NewMainList = {{MainId, Period}, [Sid | OldMainList]},
	  ets:insert(holiday_camp_war_main_list, NewMainList),
	  dets:insert(holiday_camp_war_main_list, NewMainList),
	  cluster_lib:cast(center, c_holiday_camp_war_mgr,
			   update_ets,
			   [c_holiday_camp_war_main_list, NewMainList, all]);
      _ -> skip
    end.

update_rank(ArenaRole = #holiday_camp_war_role{rank =
						   0},
	    CampId, MainId, NextRank) ->
    {ok, #holiday_camp_war_role{}} =
	do_update_rank(ArenaRole#holiday_camp_war_role{rank =
							   NextRank},
		       CampId, MainId),
    NextRank + 1;
update_rank(ArenaRole = #holiday_camp_war_role{},
	    CampId, MainId, NextRank) ->
    {ok, #holiday_camp_war_role{}} =
	do_update_rank(ArenaRole, CampId, MainId),
    NextRank.

do_update_rank(ArenaRole = #holiday_camp_war_role{rank =
						      1,
						  id = {RoleId2, RMainId},
						  power = Power, score = Score2,
						  score_time = ScoreTime},
	       CampId, MainId) ->
    ets:insert(holiday_camp_war_role, ArenaRole),
    ets:insert(holiday_camp_war_rank,
	       #holiday_camp_war_rank{rank = {1, CampId, MainId},
				      id = RoleId2, score = Score2,
				      score_time = ScoreTime, power = Power}),
    put(holiday_camp_war_role_update_role,
	[{RoleId2, RMainId}
	 | util:get(holiday_camp_war_role_update_role, [])]),
    {ok, ArenaRole};
do_update_rank(ArenaRole = #holiday_camp_war_role{rank =
						      Rank,
						  id = {RoleId, _},
						  score = Score, power = Power1,
						  score_time = ScoreTime1},
	       CampId, MainId) ->
    case ets:lookup(holiday_camp_war_rank,
		    {Rank - 1, CampId, MainId})
	of
      [#holiday_camp_war_rank{rank = {_, CampId2, MainId2},
			      id = RoleId2, score = Score2, power = Power2,
			      score_time = ScoreTime2}]
	  when Score > Score2 orelse
		 Score == Score2 andalso ScoreTime1 < ScoreTime2 ->
	  ets:insert(holiday_camp_war_rank,
		     #holiday_camp_war_rank{rank = {Rank, CampId2, MainId2},
					    id = RoleId2, score = Score2,
					    power = Power2,
					    score_time = ScoreTime2}),
	  ets:update_element(holiday_camp_war_role,
			     {RoleId2, MainId2},
			     {#holiday_camp_war_role.rank, Rank}),
	  put(holiday_camp_war_role_update_role,
	      [{RoleId2, MainId2}
	       | util:get(holiday_camp_war_role_update_role, [])]),
	  do_update_rank(ArenaRole#holiday_camp_war_role{rank =
							     Rank - 1},
			 CampId, MainId);
      _ ->
	  ets:insert(holiday_camp_war_role, ArenaRole),
	  ets:insert(holiday_camp_war_rank,
		     #holiday_camp_war_rank{rank = {Rank, CampId, MainId},
					    id = RoleId, score = Score,
					    power = Power1,
					    score_time = ScoreTime1}),
	  put(holiday_camp_war_role_update_role,
	      [{RoleId, MainId}
	       | util:get(holiday_camp_war_role_update_role, [])]),
	  {ok, ArenaRole}
    end.

do_save_update(MainId) ->
    ok,
    catch
      do_save_update(util:get(holiday_camp_war_role_update_role,
			      []),
		     MainId),
    erase(holiday_camp_war_role_update_role).

do_save_update([], _MainId) -> skip;
do_save_update([RoleId | T], MainId) ->
    case ets:lookup(holiday_camp_war_role, {RoleId, MainId})
	of
      [ArenaRole = #holiday_camp_war_role{} | _] ->
	  dets:insert(holiday_camp_war_role, ArenaRole);
      _ -> skip
    end,
    do_save_update(T, MainId).

get_min_time(TimeList) ->
    Fun = fun (Time, Acc) ->
		  [date:unixtime(zero) + date:time_sec(Time) | Acc]
	  end,
    NTimeList = lists:usort(lists:foldl(Fun, [], TimeList)),
    do_get_min_time(NTimeList, date:unixtime()).

do_get_min_time([], Now) -> Now;
do_get_min_time([T | Other], Now) ->
    case T > Now of
      true -> T;
      _ -> do_get_min_time(Other, Now)
    end.


