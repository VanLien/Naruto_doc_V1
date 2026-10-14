-file("data/c_holiday_camp_war_mgr.erl", 1).

-file("src/mod/holiday_camp_war/c_holiday_camp_war_m"
      "gr.erl",
      1).

-module(c_holiday_camp_war_mgr).

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
		{state, []}]).

-behaviour(gen_server).

-export([]).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([update_ets/3]).

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

-file("src/mod/holiday_camp_war/c_holiday_camp_war_m"
      "gr.erl",
      18).

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

-file("src/mod/holiday_camp_war/c_holiday_camp_war_m"
      "gr.erl",
      19).

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

-file("src/mod/holiday_camp_war/c_holiday_camp_war_m"
      "gr.erl",
      20).

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

-file("src/mod/holiday_camp_war/c_holiday_camp_war_m"
      "gr.erl",
      21).

-spec update_ets(atom(), any(), ets | dets | all) -> ok.

update_ets(Tab, Data, all) ->
    ets:insert(Tab, Data), dets:insert(Tab, Data).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> c_holiday_camp_war_mgr ! Info.

cast(Info) ->
    gen_server:cast(c_holiday_camp_war_mgr, Info).

call(Info) ->
    case catch gen_server:call(c_holiday_camp_war_mgr, Info,
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
	    {__Pidc_holiday_camp_war_mgr45, _,
	     {__Levelc_holiday_camp_war_mgr45,
	      __Tracesc_holiday_camp_war_mgr45}}
		when __Levelc_holiday_camp_war_mgr45 band 8 /= 0 orelse
		       __Tracesc_holiday_camp_war_mgr45 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_camp_war_mgr},
			      {function, call}, {line, 45},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_holiday_camp_war_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_holiday_camp_war_mgr45,
			     __Tracesc_holiday_camp_war_mgr45, lager_event,
			     __Pidc_holiday_camp_war_mgr45);
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
    gen_server:start_link({local, c_holiday_camp_war_mgr},
			  c_holiday_camp_war_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_camp_war_mgr51, _,
       {__Levelc_holiday_camp_war_mgr51,
	__Tracesc_holiday_camp_war_mgr51}}
	  when __Levelc_holiday_camp_war_mgr51 band 64 /= 0 orelse
		 __Tracesc_holiday_camp_war_mgr51 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_camp_war_mgr}, {function, init},
			{line, 51}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [c_holiday_camp_war_mgr]),
		       none, 4096, 64, __Levelc_holiday_camp_war_mgr51,
		       __Tracesc_holiday_camp_war_mgr51, lager_event,
		       __Pidc_holiday_camp_war_mgr51);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(c_holiday_camp_war_main_ids,
			"dets/c_holiday_camp_war_main_ids.dets", 1, set),
    d_ets_lib:load_dets_to_ets(c_holiday_camp_war_main_ids,
			       undefined),
    d_ets_lib:new_d_ets(c_holiday_camp_war_main_list,
			"dets/c_holiday_camp_war_main_list.dets", 1, set),
    d_ets_lib:load_dets_to_ets(c_holiday_camp_war_main_list,
			       undefined),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_camp_war_mgr63, _,
       {__Levelc_holiday_camp_war_mgr63,
	__Tracesc_holiday_camp_war_mgr63}}
	  when __Levelc_holiday_camp_war_mgr63 band 64 /= 0 orelse
		 __Tracesc_holiday_camp_war_mgr63 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_camp_war_mgr}, {function, init},
			{line, 63}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [c_holiday_camp_war_mgr]),
		       none, 4096, 64, __Levelc_holiday_camp_war_mgr63,
		       __Tracesc_holiday_camp_war_mgr63, lager_event,
		       __Pidc_holiday_camp_war_mgr63);
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
	    {__Pidc_holiday_camp_war_mgr71, _,
	     {__Levelc_holiday_camp_war_mgr71,
	      __Tracesc_holiday_camp_war_mgr71}}
		when __Levelc_holiday_camp_war_mgr71 band 8 /= 0 orelse
		       __Tracesc_holiday_camp_war_mgr71 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_camp_war_mgr},
			      {function, handle_call}, {line, 71},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelc_holiday_camp_war_mgr71,
			     __Tracesc_holiday_camp_war_mgr71, lager_event,
			     __Pidc_holiday_camp_war_mgr71);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    c_holiday_camp_war_mgr, 72, _Reason}),
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
	    {__Pidc_holiday_camp_war_mgr84, _,
	     {__Levelc_holiday_camp_war_mgr84,
	      __Tracesc_holiday_camp_war_mgr84}}
		when __Levelc_holiday_camp_war_mgr84 band 8 /= 0 orelse
		       __Tracesc_holiday_camp_war_mgr84 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_camp_war_mgr},
			      {function, handle_info}, {line, 84},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelc_holiday_camp_war_mgr84,
			     __Tracesc_holiday_camp_war_mgr84, lager_event,
			     __Pidc_holiday_camp_war_mgr84);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    c_holiday_camp_war_mgr, 85, _Reason}),
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
      {__Pidc_holiday_camp_war_mgr90, _,
       {__Levelc_holiday_camp_war_mgr90,
	__Tracesc_holiday_camp_war_mgr90}}
	  when __Levelc_holiday_camp_war_mgr90 band 64 /= 0 orelse
		 __Tracesc_holiday_camp_war_mgr90 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_camp_war_mgr},
			{function, terminate}, {line, 90},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_holiday_camp_war_mgr90,
		       __Tracesc_holiday_camp_war_mgr90, lager_event,
		       __Pidc_holiday_camp_war_mgr90);
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
	    {__Pidc_holiday_camp_war_mgr102, _,
	     {__Levelc_holiday_camp_war_mgr102,
	      __Tracesc_holiday_camp_war_mgr102}}
		when __Levelc_holiday_camp_war_mgr102 band 8 /= 0 orelse
		       __Tracesc_holiday_camp_war_mgr102 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_camp_war_mgr},
			      {function, do_handle_call}, {line, 102},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_holiday_camp_war_mgr102,
			     __Tracesc_holiday_camp_war_mgr102, lager_event,
			     __Pidc_holiday_camp_war_mgr102);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    c_holiday_camp_war_mgr, 103, _Reason}),
	  {reply, {false, lang:get(<<"lỗi thực thi"/utf8>>)},
	   State}
    end;
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
	    {__Pidc_holiday_camp_war_mgr116, _,
	     {__Levelc_holiday_camp_war_mgr116,
	      __Tracesc_holiday_camp_war_mgr116}}
		when __Levelc_holiday_camp_war_mgr116 band 8 /= 0 orelse
		       __Tracesc_holiday_camp_war_mgr116 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_camp_war_mgr},
			      {function, do_handle_info}, {line, 116},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_holiday_camp_war_mgr116,
			     __Tracesc_holiday_camp_war_mgr116, lager_event,
			     __Pidc_holiday_camp_war_mgr116);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    c_holiday_camp_war_mgr, 117, _Reason}),
	  {noreply, State}
    end;
do_handle_info(gm_clear_data, State) ->
    cluster_lib:cast(all, holiday_camp_war_mgr, info,
		     [gm_clear_data]),
    {noreply, State};
do_handle_info(_Info, State) -> ok, {noreply, State}.


