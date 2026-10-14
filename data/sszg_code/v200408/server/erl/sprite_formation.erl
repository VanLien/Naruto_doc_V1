-file("src/mod/sprite/sprite_formation.erl", 1).

-module(sprite_formation).

-lager_records([{formation_attr_data,
		 [type, lev, expend, attr_1, attr_2, attr_3, attr_4,
		  attr_5, attr_6, attr_7, attr_8, attr_9, power]},
		{formation_data,
		 [type, pos, need_lev, name, need_items, restrain_s,
		  restrain_w]},
		{formation_info_p, [id, name, power, pos_info]},
		{pk_formation_info,
		 [id, name, formation, ffor_target, power, is_ready,
		  guild_name, lev, face_id, pid]},
		{formation_fight_info, [pos, fight_pos, id]},
		{formation_base_p,
		 [id, lev, exp, pos_info, formation_list, power,
		  hallows_id, all_lineups]},
		{formation_pos, [pos, id]},
		{formation_lineup,
		 [id, name, power, pos_info, max_power, type,
		  hallows_id]},
		{formation_sys, [id, type, pos_info, hallows_id]},
		{m_formation,
		 [ver, list, use_lineup, all_lineups, sys_formations]},
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
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{sprite_plan, [ver, id, name, plan_sprites]},
		{team_sprite, [ver, team, plan_id, team_sprites]},
		{formation_sprite, [ver, type, team_list]},
		{m_sprite_tree,
		 [ver, lev, break_lev, all_attr, sprites, power,
		  max_power, formation_list, plan_list]},
		{sprite_hatch,
		 [ver, id, is_open, lev, do_id, need_point, do_point,
		  state, end_time, all_end_time]},
		{m_sprite_hatch,
		 [ver, list, day_privilege_mail, day_buy_list, handbook,
		  baodi_info]},
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

-export([get_sprite_formation/2, get_sprite_formation/3,
	 push/3, push/2, save_plan/2, save_name/2,
	 save_sprites/2, save_sprites_by_plan/2,
	 clear_up_sprites/1, clear_up_sprites/2,
	 init_plan_list/0, buy_plan/2, get_type_info/3,
	 judge_panel/3, change_team_sort/3,
	 sprite_tree_set_sprites/2, sprite_tree_set_sprites/3,
	 init_formation_list/1, login/1, make_same_bid/3,
	 compound_exchange_sprites/3, add_pos/1]).

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

-file("src/mod/sprite/sprite_formation.erl", 32).

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

-file("src/mod/sprite/sprite_formation.erl", 33).

-file("inc/sprite.hrl", 1).

-record(m_sprite_hatch,
	{ver = 5, list = [], day_privilege_mail = 0,
	 day_buy_list = [], handbook = [], baodi_info = []}).

-record(sprite_hatch,
	{ver = 2, id = 0, is_open = 0, lev = 0, do_id = 0,
	 need_point = 0, do_point = 0, state = 0, end_time = 0,
	 all_end_time = 0}).

-record(m_sprite_tree,
	{ver = 3, lev = 1, break_lev = 0, all_attr,
	 sprites = [], power = 0, max_power = 0,
	 formation_list = []  :: list(),
	 plan_list = []  :: list()}).

-record(formation_sprite,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 team_list = []  :: list()}).

-record(team_sprite,
	{ver = 1  :: pos_integer(), team = 1  :: pos_integer(),
	 plan_id = 0  :: pos_integer(),
	 team_sprites = []  :: list()}).

-record(sprite_plan,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 name = <<>>  :: string(),
	 plan_sprites = []  :: list()}).

-file("src/mod/sprite/sprite_formation.erl", 34).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/sprite/sprite_formation.erl", 35).

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

-file("src/mod/sprite/sprite_formation.erl", 36).

-file("inc/formation.hrl", 1).

-record(m_formation,
	{ver = 1, list = [], use_lineup = 1, all_lineups = [],
	 sys_formations = []}).

-record(formation_sys,
	{id = 1, type = 1, pos_info = [], hallows_id = 0}).

-record(formation_lineup,
	{id = 1, name = <<>>, power = 0, pos_info = [],
	 max_power = 0, type = 1, hallows_id = 0}).

-record(formation_pos, {pos, id = 0}).

-record(formation_base_p,
	{id, lev, exp, pos_info, formation_list, power,
	 hallows_id = 0, all_lineups}).

-record(formation_fight_info, {pos, fight_pos, id = 0}).

-record(pk_formation_info,
	{id, name, formation, ffor_target, power,
	 is_ready = false, guild_name = <<>>, lev = 0, face_id,
	 pid = none}).

-record(formation_info_p,
	{id = 0, name = <<>>, power = 0, pos_info = []}).

-record(formation_data,
	{type, pos, need_lev, name, need_items = [],
	 restrain_s = [], restrain_w = []}).

-record(formation_attr_data,
	{type, lev, expend = [], attr_1 = [], attr_2 = [],
	 attr_3 = [], attr_4 = [], attr_5 = [], attr_6 = [],
	 attr_7 = [], attr_8 = [], attr_9 = [], power}).

-file("src/mod/sprite/sprite_formation.erl", 37).

login(Role = #role{m_sprite_tree =
		       SpriteTree = #m_sprite_tree{formation_list =
						       FormationList,
						   sprites = Sprites}}) ->
    NewFormationList = login_init([0, 1, 2, 4, 6, 7, 9, 11,
				   12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
				   24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34,
				   35, 36, 37, 94, 95, 97, 98, 99, 93, 38, 39],
				  FormationList, Sprites),
    NewSpriteTree = SpriteTree#m_sprite_tree{formation_list
						 = NewFormationList},
    NewRole = Role#role{m_sprite_tree = NewSpriteTree},
    {ok, NewRole}.

-spec add_pos(#role{}) -> #role{}.

add_pos(Role = #role{m_sprite_tree =
			 SpriteTree = #m_sprite_tree{break_lev = BreakLev,
						     plan_list = PlanList,
						     formation_list =
							 FormationList}}) ->
    MaxPos = sprite_data:get_limit_sprite_num(BreakLev),
    AllPos = lists:seq(1, MaxPos),
    {NewPlanList, NewFormationList} = do_add_pos(AllPos,
						 PlanList ++ FormationList, [],
						 []),
    NewSpriteTree = SpriteTree#m_sprite_tree{plan_list =
						 NewPlanList,
					     formation_list = NewFormationList},
    NewRole = Role#role{m_sprite_tree = NewSpriteTree},
    NewRole.

-spec get_type_info(#role{} | #role_robot{},
		    pos_integer(), pos_integer()) -> list().

get_type_info(Role = #role{m_sprite_tree =
			       #m_sprite_tree{formation_list = FormationList}},
	      Type, Team) ->
    case lists:keyfind(Type, #formation_sprite.type,
		       FormationList)
	of
      #formation_sprite{team_list = TeamList} ->
	  case lists:keyfind(Team, #team_sprite.team, TeamList) of
	    #team_sprite{team_sprites = TeamSprites} -> TeamSprites;
	    _ -> []
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
	    {__Pidsprite_formation67, _,
	     {__Levelsprite_formation67, __Tracessprite_formation67}}
		when __Levelsprite_formation67 band 8 /= 0 orelse
		       __Tracessprite_formation67 /= [] ->
		lager:do_log(error,
			     [{module, sprite_formation},
			      {function, get_type_info}, {line, 67},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家~ts id~w 战斗时请求精灵阵法类型错误 ~w",
					   [Role#role.name, Role#role.id,
					    Type]),
			     none, 4096, 8, __Levelsprite_formation67,
			     __Tracessprite_formation67, lager_event,
			     __Pidsprite_formation67);
	    _ -> ok
	  end,
	  []
    end;
get_type_info(Role = #role_robot{m_sprite_tree =
				     #m_sprite_tree{formation_list =
							FormationList}},
	      Type, Team) ->
    case lists:keyfind(Type, #formation_sprite.type,
		       FormationList)
	of
      #formation_sprite{team_list = TeamList} ->
	  case lists:keyfind(Team, #team_sprite.team, TeamList) of
	    #team_sprite{team_sprites = TeamSprites} -> TeamSprites;
	    _ -> []
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
	    {__Pidsprite_formation80, _,
	     {__Levelsprite_formation80, __Tracessprite_formation80}}
		when __Levelsprite_formation80 band 8 /= 0 orelse
		       __Tracessprite_formation80 /= [] ->
		lager:do_log(error,
			     [{module, sprite_formation},
			      {function, get_type_info}, {line, 80},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家~ts id~w 战斗时请求精灵阵法类型错误 ~w",
					   [Role#role_robot.name,
					    Role#role_robot.id, Type]),
			     none, 4096, 8, __Levelsprite_formation80,
			     __Tracessprite_formation80, lager_event,
			     __Pidsprite_formation80);
	    _ -> ok
	  end,
	  []
    end;
get_type_info(_, _, _) -> [].

-spec sprite_tree_set_sprites(#role{}, pos_integer(),
			      pos_integer()) -> #role{}.

sprite_tree_set_sprites(Role, Pos, Bid) ->
    sprite_tree_set_sprites(Role, [{Pos, Bid}]).

-spec sprite_tree_set_sprites(#role{},
			      list()) -> #role{}.

sprite_tree_set_sprites(Role = #role{m_sprite_tree =
					 SpriteTree =
					     #m_sprite_tree{formation_list =
								FormationList}},
			Info) ->
    AllSpritesBids = get_all_sprites_bid(Role),
    NewFormationList =
	do_sprite_tree_set_sprites(FormationList, Info,
				   AllSpritesBids, []),
    NewSpriteTree = SpriteTree#m_sprite_tree{formation_list
						 = NewFormationList},
    NewRole = Role#role{m_sprite_tree = NewSpriteTree},
    NewRole.

init_plan_list() ->
    InitList = sprite_data:get_all_sprites_plan(),
    do_init_plan_list(InitList, []).

init_formation_list(Sprites) ->
    do_init_formation_list([0, 1, 2, 4, 6, 7, 9, 11, 12, 13,
			    14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 27,
			    28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 94, 95, 97,
			    98, 99, 93, 38, 39],
			   Sprites, []).

-spec push(#role{}, pos_integer()) -> ok.

push(#role{m_sprite_tree =
	       #m_sprite_tree{plan_list = PlanList}},
     Code = 26556) ->
    sys_conn:pack_send(Code, {PlanList}), ok;
push(_Role, Code) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsprite_formation115, _,
       {__Levelsprite_formation115,
	__Tracessprite_formation115}}
	  when __Levelsprite_formation115 band 8 /= 0 orelse
		 __Tracessprite_formation115 /= [] ->
	  lager:do_log(error,
		       [{module, sprite_formation}, {function, push},
			{line, 115}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("精灵布阵协议请求错误，协议号:~w", [Code]), none, 4096,
		       8, __Levelsprite_formation115,
		       __Tracessprite_formation115, lager_event,
		       __Pidsprite_formation115);
      _ -> ok
    end,
    ok.

-spec push(#role{}, pos_integer(), list()) -> ok.

push(_Role, Code = 26555, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(_Role, Code = 26559, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(_Role, Code, _Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsprite_formation127, _,
       {__Levelsprite_formation127,
	__Tracessprite_formation127}}
	  when __Levelsprite_formation127 band 8 /= 0 orelse
		 __Tracessprite_formation127 /= [] ->
	  lager:do_log(error,
		       [{module, sprite_formation}, {function, push},
			{line, 127}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("精灵布阵协议请求错误，协议号:~w", [Code]), none, 4096,
		       8, __Levelsprite_formation127,
		       __Tracessprite_formation127, lager_event,
		       __Pidsprite_formation127);
      _ -> ok
    end,
    ok.

-spec get_sprite_formation(#role{},
			   pos_integer()) -> ok.

get_sprite_formation(Role, Type) ->
    get_sprite_formation(Role, Type, all).

-spec get_sprite_formation(#role{}, pos_integer(),
			   atom() | pos_integer()) -> ok.

get_sprite_formation(Role = #role{m_sprite_tree =
				      #m_sprite_tree{formation_list =
							 FormationList}},
		     Type, all) ->
    case lists:keyfind(Type, #formation_sprite.type,
		       FormationList)
	of
      #formation_sprite{team_list = TeamList} ->
	  PushTeamList = [{Team, Sprites, PlanId}
			  || #team_sprite{team = Team, team_sprites = Sprites,
					  plan_id = PlanId}
				 <- TeamList],
	  Data = {Type, PushTeamList},
	  push(Role, 26555, Data),
	  ok;
      _ ->
	  PushTeamList = [],
	  Data = {Type, PushTeamList},
	  push(Role, 26555, Data),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsprite_formation148, _,
	     {__Levelsprite_formation148,
	      __Tracessprite_formation148}}
		when __Levelsprite_formation148 band 8 /= 0 orelse
		       __Tracessprite_formation148 /= [] ->
		lager:do_log(error,
			     [{module, sprite_formation},
			      {function, get_sprite_formation}, {line, 148},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家~ts id~w 请求精灵阵法类型错误 ~w",
					   [Role#role.name, Role#role.id,
					    Type]),
			     none, 4096, 8, __Levelsprite_formation148,
			     __Tracessprite_formation148, lager_event,
			     __Pidsprite_formation148);
	    _ -> ok
	  end,
	  ok
    end;
get_sprite_formation(Role, Type, Team) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsprite_formation180, _,
       {__Levelsprite_formation180,
	__Tracessprite_formation180}}
	  when __Levelsprite_formation180 band 8 /= 0 orelse
		 __Tracessprite_formation180 /= [] ->
	  lager:do_log(error,
		       [{module, sprite_formation},
			{function, get_sprite_formation}, {line, 180},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("玩家:~ts id:~w请求精灵队伍异常 类型~w 队伍~w",
				     [Role#role.name, Role#role.id, Type,
				      Team]),
		       none, 4096, 8, __Levelsprite_formation180,
		       __Tracessprite_formation180, lager_event,
		       __Pidsprite_formation180);
      _ -> ok
    end,
    ok.

-spec save_plan(#role{}, tuple()) -> {ok, #role{}} |
				     {false, string()}.

save_plan(Role = #role{m_sprite_tree =
			   SpriteTree = #m_sprite_tree{plan_list = PlanList,
						       formation_list =
							   FormationList}},
	  {Id, Info, _Type, 0}) ->
    case check_save_plan([pos, bid, type], Role, Info) of
      ok ->
	  case lists:keyfind(Id, #sprite_plan.id, PlanList) of
	    SpritePlan = #sprite_plan{} ->
		NewSpritePlan = SpritePlan#sprite_plan{plan_sprites =
							   Info},
		NewPlanList = lists:keyreplace(Id, #sprite_plan.id,
					       PlanList, NewSpritePlan),
		NewFormationList = clear_plan_id(FormationList, Id, []),
		NewSpriteTree = SpriteTree#m_sprite_tree{plan_list =
							     NewPlanList,
							 formation_list =
							     NewFormationList},
		NewRole = Role#role{m_sprite_tree = NewSpriteTree},
		push(NewRole, 26559, {NewSpritePlan}),
		{ok, NewRole};
	    _ -> {false, lang:get(<<"没有该方案可选择"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end;
save_plan(Role = #role{m_sprite_tree =
			   SpriteTree = #m_sprite_tree{plan_list = PlanList,
						       formation_list =
							   FormationList}},
	  {Id, Info, Type, Team}) ->
    case check_save_plan([pos, bid, type], Role, Info) of
      ok ->
	  case lists:keyfind(Id, #sprite_plan.id, PlanList) of
	    SpritePlan = #sprite_plan{} ->
		NewSpritePlan = SpritePlan#sprite_plan{plan_sprites =
							   Info},
		NewPlanList = lists:keyreplace(Id, #sprite_plan.id,
					       PlanList, NewSpritePlan),
		ClearFormationList = clear_plan_id(FormationList, Id,
						   []),
		NewFormationList = save_team_plan_id(ClearFormationList,
						     Type, Team, Id),
		NewSpriteTree = SpriteTree#m_sprite_tree{plan_list =
							     NewPlanList,
							 formation_list =
							     NewFormationList},
		NewRole = Role#role{m_sprite_tree = NewSpriteTree},
		push(NewRole, 26559, {NewSpritePlan}),
		get_sprite_formation(NewRole, Type),
		{ok, NewRole};
	    _ -> {false, lang:get(<<"没有该方案可选择"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec save_name(#role{}, tuple()) -> {ok, #role{}} |
				     {false, string()}.

save_name(Role = #role{m_sprite_tree =
			   SpriteTree = #m_sprite_tree{plan_list = PlanList}},
	  {Id, Name}) ->
    SetName = case
		is_binary([string_util:trim(binary_to_list(Name))])
		  of
		false ->
		    list_to_binary([string_util:trim(binary_to_list(Name))]);
		true -> [string_util:trim(binary_to_list(Name))]
	      end,
    NLen = string_util:utf8_len(SetName),
    case keyword:check(name, SetName) of
      false -> {false, lang:get(<<"名字不合法"/utf8>>)};
      _ when NLen < 1 orelse NLen > 6 ->
	  {false, lang:get(<<"名字长度不对"/utf8>>)};
      true ->
	  case lists:keyfind(Id, #sprite_plan.id, PlanList) of
	    SpritePlan = #sprite_plan{} ->
		NewSpritePlan = SpritePlan#sprite_plan{name = SetName},
		NewPlanList = lists:keyreplace(Id, #sprite_plan.id,
					       PlanList, NewSpritePlan),
		NewSpriteTree = SpriteTree#m_sprite_tree{plan_list =
							     NewPlanList},
		NewRole = Role#role{m_sprite_tree = NewSpriteTree},
		push(NewRole, 26559, {NewSpritePlan}),
		{ok, NewRole};
	    _ -> {false, lang:get(<<"没有该方案可选择"/utf8>>)}
	  end
    end.

-spec save_sprites(#role{}, tuple()) -> {ok, #role{}} |
					{false, string()}.

save_sprites(Role = #role{m_sprite_tree =
			      SpriteTree = #m_sprite_tree{formation_list =
							      FormationList}},
	     {Type, Team, Info}) ->
    case check_save_sprites([pos, bid, team, type,
			     arena_champion],
			    Role, Info, Type, Team)
	of
      ok ->
	  case lists:keyfind(Type, #formation_sprite.type,
			     FormationList)
	      of
	    FormationSprite = #formation_sprite{team_list =
						    TeamList} ->
		NewTeamSprite = case lists:keyfind(Team,
						   #team_sprite.team, TeamList)
				    of
				  TeamSprite = #team_sprite{} ->
				      TeamSprite#team_sprite{team_sprites =
								 Info,
							     plan_id = 0};
				  _ ->
				      #team_sprite{team = Team,
						   team_sprites = Info}
				end,
		NewTeamList = lists:keystore(Team, #team_sprite.team,
					     TeamList, NewTeamSprite),
		NewFormationSprite =
		    FormationSprite#formation_sprite{team_list =
							 NewTeamList},
		NewFormationList = lists:keystore(Type,
						  #formation_sprite.type,
						  FormationList,
						  NewFormationSprite),
		NewSpriteTree = SpriteTree#m_sprite_tree{formation_list
							     =
							     NewFormationList},
		NewRole = Role#role{m_sprite_tree = NewSpriteTree},
		get_sprite_formation(NewRole, Type),
		save_other_type_information(Type, NewRole),
		{ok, NewRole};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsprite_formation275, _,
		   {__Levelsprite_formation275,
		    __Tracessprite_formation275}}
		      when __Levelsprite_formation275 band 8 /= 0 orelse
			     __Tracessprite_formation275 /= [] ->
		      lager:do_log(error,
				   [{module, sprite_formation},
				    {function, save_sprites}, {line, 275},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~ts id~w 请求精灵阵法类型错误 ~w",
						 [Role#role.name, Role#role.id,
						  Type]),
				   none, 4096, 8, __Levelsprite_formation275,
				   __Tracessprite_formation275, lager_event,
				   __Pidsprite_formation275);
		  _ -> ok
		end,
		{false, lang:get(<<"没有对应的阵法类型"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec save_sprites_by_plan(#role{}, tuple()) -> {ok,
						 #role{}} |
						{false, string()}.

save_sprites_by_plan(Role = #role{m_sprite_tree =
				      SpriteTree = #m_sprite_tree{formation_list
								      =
								      FormationList}},
		     {Type, Team, Id}) ->
    case check_save_sprites_by_plan([id, pos, bid, team,
				     type, arena_champion],
				    Role,
				    #{id => Id, type => Type, team => Team})
	of
      {ok, Info} ->
	  case lists:keyfind(Type, #formation_sprite.type,
			     FormationList)
	      of
	    FormationSprite = #formation_sprite{team_list =
						    TeamList} ->
		NewTeamSprite = case lists:keyfind(Team,
						   #team_sprite.team, TeamList)
				    of
				  TeamSprite = #team_sprite{} ->
				      TeamSprite#team_sprite{team_sprites =
								 Info,
							     plan_id = Id};
				  _ ->
				      #team_sprite{team = Team,
						   team_sprites = Info,
						   plan_id = Id}
				end,
		NewTeamList = lists:keystore(Team, #team_sprite.team,
					     TeamList, NewTeamSprite),
		NewFormationSprite =
		    FormationSprite#formation_sprite{team_list =
							 NewTeamList},
		NewFormationList = lists:keyreplace(Type,
						    #formation_sprite.type,
						    FormationList,
						    NewFormationSprite),
		NewSpriteTree = SpriteTree#m_sprite_tree{formation_list
							     =
							     NewFormationList},
		Role1 = Role#role{m_sprite_tree = NewSpriteTree},
		NewRole = delete_same_team_sprites(Type, Team, Role1),
		get_sprite_formation(NewRole, Type),
		save_other_type_information(Type, NewRole),
		{ok, NewRole};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsprite_formation309, _,
		   {__Levelsprite_formation309,
		    __Tracessprite_formation309}}
		      when __Levelsprite_formation309 band 8 /= 0 orelse
			     __Tracessprite_formation309 /= [] ->
		      lager:do_log(error,
				   [{module, sprite_formation},
				    {function, save_sprites_by_plan},
				    {line, 309}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~ts id~w 请求精灵阵法类型错误 ~w",
						 [Role#role.name, Role#role.id,
						  Type]),
				   none, 4096, 8, __Levelsprite_formation309,
				   __Tracessprite_formation309, lager_event,
				   __Pidsprite_formation309);
		  _ -> ok
		end,
		{false, lang:get(<<"没有对应的阵法类型"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec clear_up_sprites(#role{}, list()) -> #role{}.

clear_up_sprites(Role, SellList) ->
    case is_sprite(SellList) of
      true -> NewRole = clear_up_sprites(Role), NewRole;
      _ -> Role
    end.

-spec clear_up_sprites(#role{}) -> #role{}.

clear_up_sprites(Role = #role{m_sprite_tree =
				  SpriteTree = #m_sprite_tree{formation_list =
								  FormationList,
							      plan_list =
								  PlanList}}) ->
    AllBids = get_all_sprites_bid(Role),
    NewPlanList = clear_up_plan(PlanList, AllBids, []),
    NewFormationList = clear_up_formation(FormationList,
					  AllBids, []),
    NewSpriteTree = SpriteTree#m_sprite_tree{formation_list
						 = NewFormationList,
					     plan_list = NewPlanList},
    NewRole = Role#role{m_sprite_tree = NewSpriteTree},
    NewRole.

-spec buy_plan(#role{}, pos_integer()) -> {ok,
					   #role{}} |
					  {false, string()}.

buy_plan(Role, Id) ->
    case check_buy_plan([id, loss], Role, #{id => Id}) of
      {ok, Name, Loss} ->
	  Expend = format:val_to_loss(Loss, sprite_formation),
	  case role_gain:do_notice(Role, Expend) of
	    {ok,
	     LossRole = #role{m_sprite_tree =
				  SpriteTree = #m_sprite_tree{plan_list =
								  PlanList}}} ->
		NewSpritePlan = #sprite_plan{id = Id, name = Name},
		NewPlanList = [NewSpritePlan | PlanList],
		NewSpriteTree = SpriteTree#m_sprite_tree{plan_list =
							     NewPlanList},
		NewRole = LossRole#role{m_sprite_tree = NewSpriteTree},
		push(NewRole, 26559, {NewSpritePlan}),
		log:log_gain(Expend, Role, LossRole, <<"精灵方案"/utf8>>,
			     lang:get(<<"购买精灵方案"/utf8>>)),
		{ok, NewRole}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec judge_panel(#role{}, pos_integer(),
		  pos_integer()) -> ok | false.

judge_panel(Role = #role{m_sprite_tree =
			     #m_sprite_tree{plan_list = PlanList,
					    formation_list = FormationList}},
	    Bid, Num) ->
    HasBidsNum = length(get_all_sprites_bid(Role, Bid)),
    case Num > HasBidsNum of
      true -> false;
      _ ->
	  LastNum = HasBidsNum - Num,
	  case check_formation_bid_num(FormationList, LastNum,
				       Bid)
	      of
	    ok ->
		case check_plan_bid_num(PlanList, LastNum, Bid) of
		  ok -> false;
		  {false, Name} -> {ok, 1, 0, Name}
		end;
	    {false, Type} -> {ok, 0, Type, <<>>}
	  end
    end.

-spec change_team_sort(#role{}, pos_integer(),
		       list()) -> {ok, #role{}} | {false, string()}.

change_team_sort(Role = #role{m_sprite_tree =
				  SpriteTree = #m_sprite_tree{formation_list =
								  FormationList}},
		 Type, SortList) ->
    case check_change_team_sort([type, list], Role, Type,
				SortList)
	of
      ok ->
	  case lists:keyfind(Type, #formation_sprite.type,
			     FormationList)
	      of
	    FormationSprite = #formation_sprite{team_list =
						    TeamList} ->
		NewTeamList = do_change_team_sort(SortList, TeamList,
						  []),
		NewFormationSprite =
		    FormationSprite#formation_sprite{team_list =
							 NewTeamList},
		NewFormationList = lists:keystore(Type,
						  #formation_sprite.type,
						  FormationList,
						  NewFormationSprite),
		NewSpriteTree = SpriteTree#m_sprite_tree{formation_list
							     =
							     NewFormationList},
		NewRole = Role#role{m_sprite_tree = NewSpriteTree},
		get_sprite_formation(NewRole, Type),
		save_other_type_information(Type, NewRole),
		{ok, NewRole};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsprite_formation396, _,
		   {__Levelsprite_formation396,
		    __Tracessprite_formation396}}
		      when __Levelsprite_formation396 band 8 /= 0 orelse
			     __Tracessprite_formation396 /= [] ->
		      lager:do_log(error,
				   [{module, sprite_formation},
				    {function, change_team_sort}, {line, 396},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~ts id~w 请求精灵阵法类型错误 ~w",
						 [Role#role.name, Role#role.id,
						  Type]),
				   none, 4096, 8, __Levelsprite_formation396,
				   __Tracessprite_formation396, lager_event,
				   __Pidsprite_formation396);
		  _ -> ok
		end,
		{false, lang:get(<<"没有对应的阵法类型"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec compound_exchange_sprites(#role{}, pos_integer(),
				pos_integer()) -> #role{}.

compound_exchange_sprites(Role = #role{m_sprite_tree =
					   SpriteTree = #m_sprite_tree{plan_list
									   =
									   PlanList,
								       formation_list
									   =
									   FormationList}},
			  Bid, ExchangeBid) ->
    AllHasBids = get_all_sprites_bid(Role),
    NewFormationList =
	do_exchange_formation_list(FormationList, Bid,
				   ExchangeBid, AllHasBids, []),
    NewPlanList = do_exchange_plan(PlanList, Bid,
				   ExchangeBid, AllHasBids, []),
    NewSpriteTree = SpriteTree#m_sprite_tree{plan_list =
						 NewPlanList,
					     formation_list = NewFormationList},
    NewRole = Role#role{m_sprite_tree = NewSpriteTree},
    NewRole.

check_save_sprites([], _Role, _Info, _Type, _Team) ->
    ok;
check_save_sprites([pos | Rest],
		   Role = #role{m_sprite_tree =
				    #m_sprite_tree{sprites = RoleSprites}},
		   Info, Type, Team) ->
    case do_check_pos(Info, RoleSprites, []) of
      ok -> check_save_sprites(Rest, Role, Info, Type, Team);
      {false, Reason} -> {false, Reason}
    end;
check_save_sprites([team | Rest], Role, Info, Type,
		   Team) ->
    case lists:member(Type, [95, 19, 20, 97, 99]) of
      true ->
	  case Team =< 3 of
	    true ->
		check_save_sprites(Rest, Role, Info, Type, Team);
	    _ -> {false, lang:get(<<"队伍参数错误"/utf8>>)}
	  end;
      _ when Team =:= 1 ->
	  check_save_sprites(Rest, Role, Info, Type, Team);
      _ -> {false, lang:get(<<"队伍参数错误"/utf8>>)}
    end;
check_save_sprites([bid | Rest],
		   Role = #role{m_sprite_tree =
				    #m_sprite_tree{formation_list =
						       FormationList}},
		   Info, Type, Team) ->
    SpritesBids = [Bid || {_Pos, Bid} <- Info, Bid > 0],
    AllSpritesBids = get_all_sprites_bid(Role),
    case lists:keyfind(Type, #formation_sprite.type,
		       FormationList)
	of
      #formation_sprite{team_list = TeamList} ->
	  UseSpritesBids = get_other_team_sprites(TeamList, Team,
						  []),
	  RealSpritesBids = AllSpritesBids -- UseSpritesBids,
	  case check_has_bid(SpritesBids, RealSpritesBids) of
	    ok -> check_save_sprites(Rest, Role, Info, Type, Team);
	    {false, Reason} -> {false, Reason}
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
	    {__Pidsprite_formation454, _,
	     {__Levelsprite_formation454,
	      __Tracessprite_formation454}}
		when __Levelsprite_formation454 band 8 /= 0 orelse
		       __Tracessprite_formation454 /= [] ->
		lager:do_log(error,
			     [{module, sprite_formation},
			      {function, check_save_sprites}, {line, 454},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家~ts id~w 请求精灵阵法类型错误 ~w",
					   [Role#role.name, Role#role.id,
					    Type]),
			     none, 4096, 8, __Levelsprite_formation454,
			     __Tracessprite_formation454, lager_event,
			     __Pidsprite_formation454);
	    _ -> ok
	  end,
	  {false, lang:get(<<"没有对应的阵法类型"/utf8>>)}
    end;
check_save_sprites([type | Rest], Role, Info, Type,
		   Team) ->
    case check_same_type(Info) of
      ok -> check_save_sprites(Rest, Role, Info, Type, Team);
      {false, Reason} -> {false, Reason}
    end;
check_save_sprites([arena_champion | Rest], Role, Info,
		   Type, Team) ->
    case Type =:= 6 of
      true ->
	  case sys_env:get(arena_champion_set_formation) == 1
		 andalso
		 sys_env:get(arena_cluster_champion_set_formation) == 1
	      of
	    true ->
		check_save_sprites(Rest, Role, Info, Type, Team);
	    _ -> {false, lang:get(<<"当前状态不能更新阵法"/utf8>>)}
	  end;
      _ -> check_save_sprites(Rest, Role, Info, Type, Team)
    end;
check_save_sprites(_, _Role, _Info, _Type, _Team) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

get_other_team_sprites([], _Team, UseSpritesBids) ->
    UseSpritesBids;
get_other_team_sprites([#team_sprite{team = Team}
			| Rest],
		       Team, UseSpritesBids) ->
    get_other_team_sprites(Rest, Team, UseSpritesBids);
get_other_team_sprites([#team_sprite{team_sprites =
					 TeamSprites}
			| Rest],
		       Team, UseSpritesBids) ->
    TeamSprites1 = [Bid
		    || {_Pos, Bid} <- TeamSprites, Bid > 0],
    get_other_team_sprites(Rest, Team,
			   TeamSprites1 ++ UseSpritesBids).

check_change_team_sort([], _Role, _Type, _Team) -> ok;
check_change_team_sort([type | Rest], Role, Type,
		       Team) ->
    case lists:member(Type, [19, 20, 95]) of
      true -> check_change_team_sort(Rest, Role, Type, Team);
      _ -> {false, lang:get(<<"类型错误"/utf8>>)}
    end;
check_change_team_sort([list | Rest], Role, Type,
		       Team) ->
    List = [1, 2, 3],
    NList = lists:usort([Tid || {Tid, _} <- Team]),
    NOldList = lists:usort([OTid || {_, OTid} <- Team]),
    case NList =:= List andalso NOldList =:= List of
      true -> check_change_team_sort(Rest, Role, Type, Team);
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end;
check_change_team_sort(_, _Role, _Type, _Team) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_change_team_sort([], _TeamList, Acc) ->
    lists:keysort(#team_sprite.team, Acc);
do_change_team_sort([{NSort, OSort} | Rest], TeamList,
		    Acc) ->
    case lists:keyfind(OSort, #team_sprite.team, TeamList)
	of
      TeamSprite = #team_sprite{} ->
	  do_change_team_sort(Rest, TeamList,
			      [TeamSprite#team_sprite{team = NSort} | Acc]);
      _ ->
	  do_change_team_sort(Rest, TeamList,
			      [#team_sprite{team = NSort} | Acc])
    end.

check_save_plan([], _Role, _Info) -> ok;
check_save_plan([pos | Rest],
		Role = #role{m_sprite_tree =
				 #m_sprite_tree{sprites = RoleSprites}},
		Info) ->
    case do_check_pos(Info, RoleSprites, []) of
      ok -> check_save_plan(Rest, Role, Info);
      {false, Reason} -> {false, Reason}
    end;
check_save_plan([bid | Rest], Role, Info) ->
    SpritesBids = [Bid || {_Pos, Bid} <- Info, Bid > 0],
    AllSpritesBids = get_all_sprites_bid(Role),
    case check_has_bid(SpritesBids, AllSpritesBids) of
      ok -> check_save_plan(Rest, Role, Info);
      {false, Reason} -> {false, Reason}
    end;
check_save_plan([type | Rest], Role, Info) ->
    case check_same_type(Info) of
      ok -> check_save_plan(Rest, Role, Info);
      {false, Reason} -> {false, Reason}
    end;
check_save_plan(_, _Role, _Info) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_check_pos([], _RoleSprites, _OldInfo) -> ok;
do_check_pos([{Pos, _Bid} | Rest], RoleSprites,
	     OldInfo) ->
    case lists:member(Pos, [1, 2, 3, 4]) of
      true ->
	  case lists:member(Pos, OldInfo) of
	    false ->
		case lists:keyfind(Pos, 1, RoleSprites) of
		  {_, _AddId} ->
		      do_check_pos(Rest, RoleSprites, [Pos | OldInfo]);
		  _ -> {false, lang:get(<<"上阵了未解锁的位置"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"同个位置上保存了多个精灵"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"没有相应的位置"/utf8>>)}
    end;
do_check_pos(_Rest, _RoleSprites, _OldInfo) ->
    {false, lang:get(<<"精灵参数错误"/utf8>>)}.

check_has_bid([], _AllSpritesBids) -> ok;
check_has_bid([Bid | Rest], AllSpritesBids) ->
    case lists:member(Bid, Rest) of
      false ->
	  case lists:member(Bid, AllSpritesBids) of
	    true ->
		case item_data:get(Bid) of
		  #item_base{type = 36} ->
		      check_has_bid(Rest, AllSpritesBids);
		  _ -> {false, lang:get(<<"上阵了非精灵单位"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"未拥有对应的精灵"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"上阵了相同的精灵"/utf8>>)}
    end.

check_save_sprites_by_plan([], _Role,
			   #{info := Info}) ->
    {ok, Info};
check_save_sprites_by_plan([id | Rest],
			   Role = #role{m_sprite_tree =
					    #m_sprite_tree{plan_list =
							       PlanList}},
			   Args = #{id := Id}) ->
    case lists:keyfind(Id, #sprite_plan.id, PlanList) of
      #sprite_plan{plan_sprites = []} ->
	  {false, lang:get(<<"为空的方案不允许装配"/utf8>>)};
      #sprite_plan{plan_sprites = Info} ->
	  case length([1 || {_Pos, 0} <- Info]) =:= length(Info)
	      of
	    true -> {false, lang:get(<<"为空的方案不允许装配"/utf8>>)};
	    _ ->
		check_save_sprites_by_plan(Rest, Role,
					   Args#{info => Info})
	  end;
      _ -> {false, lang:get(<<"没有该方案"/utf8>>)}
    end;
check_save_sprites_by_plan([pos | Rest],
			   Role = #role{m_sprite_tree =
					    #m_sprite_tree{sprites =
							       RoleSprites}},
			   Args = #{info := Info}) ->
    case do_check_pos(Info, RoleSprites, []) of
      ok -> check_save_sprites_by_plan(Rest, Role, Args);
      {false, Reason} -> {false, Reason}
    end;
check_save_sprites_by_plan([team | Rest], Role,
			   Args = #{type := Type, team := Team}) ->
    case lists:member(Type, [95, 19, 20, 97, 99]) of
      true ->
	  case Team =< 3 of
	    true -> check_save_sprites_by_plan(Rest, Role, Args);
	    _ -> {false, lang:get(<<"队伍参数错误"/utf8>>)}
	  end;
      _ when Team =:= 1 ->
	  check_save_sprites_by_plan(Rest, Role, Args);
      _ -> {false, lang:get(<<"队伍参数错误"/utf8>>)}
    end;
check_save_sprites_by_plan([bid | Rest], Role,
			   Args = #{info := Info}) ->
    SpritesBids = [Bid || {_Pos, Bid} <- Info, Bid > 0],
    AllSpritesBids = get_all_sprites_bid(Role),
    case check_has_bid(SpritesBids, AllSpritesBids) of
      ok -> check_save_sprites_by_plan(Rest, Role, Args);
      {false, Reason} -> {false, Reason}
    end;
check_save_sprites_by_plan([type | Rest], Role,
			   Args = #{info := Info}) ->
    case check_same_type(Info) of
      ok -> check_save_sprites_by_plan(Rest, Role, Args);
      {false, Reason} -> {false, Reason}
    end;
check_save_sprites_by_plan([arena_champion | Rest],
			   Role, Args = #{type := Type}) ->
    case Type =:= 6 of
      true ->
	  case sys_env:get(arena_champion_set_formation) == 1
		 andalso
		 sys_env:get(arena_cluster_champion_set_formation) == 1
	      of
	    true -> check_save_sprites_by_plan(Rest, Role, Args);
	    _ -> {false, lang:get(<<"当前状态不能更新阵法"/utf8>>)}
	  end;
      _ -> check_save_sprites_by_plan(Rest, Role, Args)
    end;
check_save_sprites_by_plan(_Rest, _Role, _Args) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

get_all_sprites_bid(#role{m_sprite_tree =
			      #m_sprite_tree{sprites = Sprites},
			  p_bag = #package{items = Items}}) ->
    TreeBids = [TreeBid
		|| {_TreePos, TreeBid} <- Sprites, TreeBid > 0],
    AllSpritesBids = lists:flatten([make_same_bid(PackBid,
						  Quantity, [])
				    || #item{base_id = PackBid, type = 36,
					     quantity = Quantity}
					   <- Items])
		       ++ TreeBids,
    AllSpritesBids.

get_all_sprites_bid(#role{m_sprite_tree =
			      #m_sprite_tree{sprites = Sprites},
			  p_bag = #package{items = Items}},
		    Bid) ->
    TreeBids = [TreeBid
		|| {_TreePos, TreeBid} <- Sprites, TreeBid =:= Bid],
    AllSpritesBids = lists:flatten([make_same_bid(PackBid,
						  Quantity, [])
				    || #item{base_id = PackBid, type = 36,
					     quantity = Quantity}
					   <- Items,
				       PackBid =:= Bid])
		       ++ TreeBids,
    AllSpritesBids.

make_same_bid(_Bid, Quantity, BidList)
    when Quantity < 1 ->
    BidList;
make_same_bid(Bid, Quantity, BidList) ->
    make_same_bid(Bid, Quantity - 1, [Bid | BidList]).

delete_same_team_sprites(Type, Team,
			 Role = #role{m_sprite_tree =
					  SpriteTree =
					      #m_sprite_tree{formation_list =
								 FormationList}}) ->
    case lists:keyfind(Type, #formation_sprite.type,
		       FormationList)
	of
      FormationSprite = #formation_sprite{team_list =
					      TeamList}
	  when length(TeamList) > 1 ->
	  ThisTeam = #team_sprite{team_sprites = TeamSprites} =
			 lists:keyfind(Team, #team_sprite.team, TeamList),
	  TeamSpritesBids = [Bid
			     || {_Pos, Bid} <- TeamSprites, Bid > 0],
	  AllSpritesBids = get_all_sprites_bid(Role),
	  LastSpritesBids = AllSpritesBids -- TeamSpritesBids,
	  LastTeamList = lists:keysort(#team_sprite.team,
				       [LastTeam
					|| LastTeam = #team_sprite{team =
								       DataTeam}
					       <- TeamList,
					   DataTeam =/= Team]),
	  NewTeamList = [ThisTeam
			 | do_delete_same_team_sprites(LastTeamList,
						       LastSpritesBids, [])],
	  NewFormationSprite =
	      FormationSprite#formation_sprite{team_list =
						   NewTeamList},
	  NewFormationList = lists:keyreplace(Type,
					      #formation_sprite.type,
					      FormationList,
					      NewFormationSprite),
	  NewSpriteTree = SpriteTree#m_sprite_tree{formation_list
						       = NewFormationList},
	  NewRole = Role#role{m_sprite_tree = NewSpriteTree},
	  NewRole;
      #formation_sprite{} -> Role;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsprite_formation703, _,
	     {__Levelsprite_formation703,
	      __Tracessprite_formation703}}
		when __Levelsprite_formation703 band 8 /= 0 orelse
		       __Tracessprite_formation703 /= [] ->
		lager:do_log(error,
			     [{module, sprite_formation},
			      {function, delete_same_team_sprites}, {line, 703},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家~ts id~w 请求精灵阵法类型错误 ~w",
					   [Role#role.name, Role#role.id,
					    Type]),
			     none, 4096, 8, __Levelsprite_formation703,
			     __Tracessprite_formation703, lager_event,
			     __Pidsprite_formation703);
	    _ -> ok
	  end,
	  Role
    end.

do_delete_same_team_sprites([], _SpritesBids,
			    TeamList) ->
    TeamList;
do_delete_same_team_sprites([TeamSprite =
				 #team_sprite{team_sprites = TeamSprites,
					      plan_id = PlanId}
			     | Rest],
			    SpritesBids, TeamList) ->
    {NewTeamSprites, NewSpritesBids, NewPlanId} =
	do_delete_same_team_sprites1(TeamSprites, SpritesBids,
				     [], PlanId),
    NewTeamSprite = TeamSprite#team_sprite{team_sprites =
					       NewTeamSprites,
					   plan_id = NewPlanId},
    do_delete_same_team_sprites(Rest, NewSpritesBids,
				[NewTeamSprite | TeamList]).

do_delete_same_team_sprites1([], SpritesBids,
			     TeamSprites, PlanId) ->
    {TeamSprites, SpritesBids, PlanId};
do_delete_same_team_sprites1([{Pos, Bid} | Rest],
			     SpritesBids, TeamSprites, PlanId) ->
    case Bid > 0 of
      true ->
	  case lists:member(Bid, SpritesBids) of
	    true ->
		NewSpritesBids = lists:delete(Bid, SpritesBids),
		do_delete_same_team_sprites1(Rest, NewSpritesBids,
					     [{Pos, Bid} | TeamSprites],
					     PlanId);
	    _ ->
		do_delete_same_team_sprites1(Rest, SpritesBids,
					     [{Pos, 0} | TeamSprites], 0)
	  end;
      _ ->
	  do_delete_same_team_sprites1(Rest, SpritesBids,
				       [{Pos, Bid} | TeamSprites], PlanId)
    end.

clear_up_formation([], _AllBids, FormationList) ->
    FormationList;
clear_up_formation([FormationSprite =
			#formation_sprite{team_list = TeamList}
		    | Rest],
		   AllBids, FormationList) ->
    SortTeamList = lists:keysort(#team_sprite.team,
				 TeamList),
    NewTeamList = do_delete_same_team_sprites(SortTeamList,
					      AllBids, []),
    NewFormationSprite =
	FormationSprite#formation_sprite{team_list =
					     NewTeamList},
    clear_up_formation(Rest, AllBids,
		       [NewFormationSprite | FormationList]).

clear_up_plan([], _AllBids, PlanList) -> PlanList;
clear_up_plan([SpritePlan = #sprite_plan{plan_sprites =
					     PlanSprites}
	       | Rest],
	      AllBids, PlanList) ->
    NewPlanSprites = do_clear_up_plan(PlanSprites, AllBids,
				      []),
    NewSpritePlan = SpritePlan#sprite_plan{plan_sprites =
					       NewPlanSprites},
    clear_up_plan(Rest, AllBids,
		  [NewSpritePlan | PlanList]).

do_clear_up_plan([], _AllBids, PlanSprites) ->
    PlanSprites;
do_clear_up_plan([{Pos, Bid} | Rest], AllBids,
		 PlanSprites) ->
    case Bid > 0 of
      true ->
	  case lists:member(Bid, AllBids) of
	    true ->
		NewAllBids = lists:delete(Bid, AllBids),
		do_clear_up_plan(Rest, NewAllBids,
				 [{Pos, Bid} | PlanSprites]);
	    _ ->
		do_clear_up_plan(Rest, AllBids,
				 [{Pos, 0} | PlanSprites])
	  end;
      _ ->
	  do_clear_up_plan(Rest, AllBids,
			   [{Pos, Bid} | PlanSprites])
    end.

is_sprite([]) -> false;
is_sprite([{_Id, Bid, _Num} | Rest]) ->
    case item_data:get(Bid) of
      #item_base{type = 36} -> true;
      _ -> is_sprite(Rest)
    end.

do_init_plan_list([], PlanList) -> PlanList;
do_init_plan_list([{Id, Name, 1} | Rest], PlanList) ->
    Plan = #sprite_plan{id = Id, name = Name},
    do_init_plan_list(Rest, [Plan | PlanList]);
do_init_plan_list([_One | Rest], PlanList) ->
    do_init_plan_list(Rest, PlanList).

clear_plan_id([], _Id, FormationList) -> FormationList;
clear_plan_id([FormationSprite =
		   #formation_sprite{team_list = TeamList}
	       | Rest],
	      Id, FormationList) ->
    NewTeamList = clear_plan_id1(TeamList, Id, []),
    NewFormationSprite =
	FormationSprite#formation_sprite{team_list =
					     NewTeamList},
    clear_plan_id(Rest, Id,
		  [NewFormationSprite | FormationList]).

clear_plan_id1([], _Id, TeamList) -> TeamList;
clear_plan_id1([TeamSprite = #team_sprite{plan_id = Id}
		| Rest],
	       Id, TeamList) ->
    NewTeamSprite = TeamSprite#team_sprite{plan_id = 0},
    clear_plan_id1(Rest, Id, [NewTeamSprite | TeamList]);
clear_plan_id1([TeamSprite | Rest], Id, TeamList) ->
    clear_plan_id1(Rest, Id, [TeamSprite | TeamList]).

check_buy_plan([], _Role,
	       #{name := Name, loss := Loss}) ->
    {ok, Name, Loss};
check_buy_plan([id | Rest],
	       Role = #role{m_sprite_tree =
				#m_sprite_tree{plan_list = PlanList}},
	       Args = #{id := Id}) ->
    case lists:keyfind(Id, #sprite_plan.id, PlanList) of
      #sprite_plan{} ->
	  {false, lang:get(<<"你已经拥有该方案了"/utf8>>)};
      _ -> check_buy_plan(Rest, Role, Args)
    end;
check_buy_plan([loss | Rest], Role,
	       Args = #{id := Id}) ->
    case sprite_data:get_sprite_plan(Id) of
      {Name, Loss} ->
	  check_buy_plan(Rest, Role,
			 Args#{name => Name, loss => Loss});
      _ -> {false, lang:get(<<"没有该方案可以购买"/utf8>>)}
    end;
check_buy_plan(_Rest, _Role, _Args) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

save_team_plan_id(FormationList, Type, Team, Id) ->
    case lists:keyfind(Type, #formation_sprite.type,
		       FormationList)
	of
      FormationSprite = #formation_sprite{team_list =
					      TeamList} ->
	  case lists:keyfind(Team, #team_sprite.team, TeamList) of
	    TeamSprite = #team_sprite{} ->
		NewTeamSprite = TeamSprite#team_sprite{plan_id = Id},
		NewTeamList = lists:keyreplace(Team, #team_sprite.team,
					       TeamList, NewTeamSprite),
		NewFormationSprite =
		    FormationSprite#formation_sprite{team_list =
							 NewTeamList},
		NewFormationList = lists:keyreplace(Type,
						    #formation_sprite.type,
						    FormationList,
						    NewFormationSprite),
		NewFormationList;
	    _ -> FormationList
	  end;
      _ -> FormationList
    end.

check_formation_bid_num([], _LastNum, _Bid) -> ok;
check_formation_bid_num([#formation_sprite{team_list =
					       TeamList,
					   type = Type}
			 | Rest],
			LastNum, Bid) ->
    AllTeamSprites = lists:flatten([TeamSprites
				    || #team_sprite{team_sprites = TeamSprites}
					   <- TeamList]),
    case length([PlanBid
		 || {_Pos, PlanBid} <- AllTeamSprites, PlanBid =:= Bid])
	   > LastNum
	of
      true -> {false, Type};
      _ -> check_formation_bid_num(Rest, LastNum, Bid)
    end.

check_plan_bid_num([], _LastNum, _Bid) -> ok;
check_plan_bid_num([#sprite_plan{plan_sprites =
				     PlanSprites,
				 name = Name}
		    | Rest],
		   LastNum, Bid) ->
    case length([PlanBid
		 || {_Pos, PlanBid} <- PlanSprites, PlanBid =:= Bid])
	   > LastNum
	of
      true -> {false, Name};
      _ -> check_plan_bid_num(Rest, LastNum, Bid)
    end.

check_same_type([]) -> ok;
check_same_type([{_Pos, 0} | PosInfo]) ->
    check_same_type(PosInfo);
check_same_type([{_Pos, Id} | PosInfo]) ->
    SpriteType = sprite_data:get_sprite_type(Id),
    SpriteTypeLists = [sprite_data:get_sprite_type(IdT)
		       || {_, IdT} <- PosInfo, IdT > 0],
    case lists:member(SpriteType, SpriteTypeLists) of
      true -> {false, lang:get(<<"上阵了同类型的精灵"/utf8>>)};
      _ when is_integer(SpriteType) ->
	  check_same_type(PosInfo);
      _ -> {false, lang:get(<<"没有该精灵的信息"/utf8>>)}
    end;
check_same_type(_PosInfo) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_sprite_tree_set_sprites([], _Info, _AllSpritesBids,
			   FormationList) ->
    FormationList;
do_sprite_tree_set_sprites([Formation =
				#formation_sprite{team_list = TeamList}
			    | Rest],
			   Info, AllSpritesBids, FormationList) ->
    case length(TeamList) =:= 1 of
      true ->
	  NewTeamList = do_sprite_tree_set_sprites1(TeamList,
						    Info, AllSpritesBids, []),
	  NewFormation = Formation#formation_sprite{team_list =
							NewTeamList},
	  do_sprite_tree_set_sprites(Rest, Info, AllSpritesBids,
				     [NewFormation | FormationList]);
      _ ->
	  OtherUseBids = get_other_team_sprites(TeamList, 1, []),
	  RealSpritesBids = AllSpritesBids -- OtherUseBids,
	  NewTeamList = do_sprite_tree_set_sprites1(TeamList,
						    Info, RealSpritesBids, []),
	  NewFormation = Formation#formation_sprite{team_list =
							NewTeamList},
	  do_sprite_tree_set_sprites(Rest, Info, AllSpritesBids,
				     [NewFormation | FormationList])
    end.

do_sprite_tree_set_sprites1([], _Info, _AllSpritesBids,
			    TeamList) ->
    TeamList;
do_sprite_tree_set_sprites1([TeamSprite =
				 #team_sprite{team = 1,
					      team_sprites = TeamSprites,
					      plan_id = PlanId}
			     | Rest],
			    Info, AllSpritesBids, TeamList) ->
    SpriteTypeLists = [sprite_data:get_sprite_type(IdT)
		       || {_, IdT} <- TeamSprites, IdT > 0],
    {NewTeamSprites, NewPlanId} =
	do_sprite_tree_set_sprites2(Info, TeamSprites,
				    AllSpritesBids, SpriteTypeLists, PlanId),
    NewTeamSprite = TeamSprite#team_sprite{team_sprites =
					       NewTeamSprites,
					   plan_id = NewPlanId},
    do_sprite_tree_set_sprites1(Rest, Info, AllSpritesBids,
				[NewTeamSprite | TeamList]);
do_sprite_tree_set_sprites1([TeamSprite | Rest], Info,
			    AllSpritesBids, TeamList) ->
    do_sprite_tree_set_sprites1(Rest, Info, AllSpritesBids,
				[TeamSprite | TeamList]).

do_sprite_tree_set_sprites2([], TeamSprites,
			    _AllSpritesBids, _SpriteTypeLists, PlanId) ->
    {TeamSprites, PlanId};
do_sprite_tree_set_sprites2([{Pos, Bid} | Rest],
			    TeamSprites, AllSpritesBids, SpriteTypeLists,
			    PlanId)
    when Bid > 0 ->
    case lists:keyfind(Pos, 1, TeamSprites) of
      {Pos, TeamPosBid} when TeamPosBid > 0 ->
	  do_sprite_tree_set_sprites2(Rest, TeamSprites,
				      AllSpritesBids, SpriteTypeLists, PlanId);
      _ ->
	  case lists:member(Bid, AllSpritesBids) of
	    true ->
		SpriteType = sprite_data:get_sprite_type(Bid),
		case lists:member(SpriteType, SpriteTypeLists) of
		  false ->
		      NewTeamSprites = lists:keystore(Pos, 1, TeamSprites,
						      {Pos, Bid}),
		      do_sprite_tree_set_sprites2(Rest, NewTeamSprites,
						  AllSpritesBids,
						  SpriteTypeLists, 0);
		  _ ->
		      do_sprite_tree_set_sprites2(Rest, TeamSprites,
						  AllSpritesBids,
						  SpriteTypeLists, PlanId)
		end;
	    _ ->
		do_sprite_tree_set_sprites2(Rest, TeamSprites,
					    AllSpritesBids, SpriteTypeLists,
					    PlanId)
	  end
    end;
do_sprite_tree_set_sprites2([_One | Rest], TeamSprites,
			    AllSpritesBids, SpriteTypeLists, PlanId) ->
    do_sprite_tree_set_sprites2(Rest, TeamSprites,
				AllSpritesBids, SpriteTypeLists, PlanId).

do_init_formation_list([], _Sprites, FormationList) ->
    FormationList;
do_init_formation_list([Type | Rest], Sprites,
		       FormationList) ->
    case sprite_data:get_sprite_type_team(Type) of
      TeamNum when is_integer(TeamNum) ->
	  TeamList = do_init_formation_list1(1, TeamNum, Sprites,
					     []),
	  Formation = #formation_sprite{type = Type,
					team_list = TeamList},
	  do_init_formation_list(Rest, Sprites,
				 [Formation | FormationList]);
      _ ->
	  Formation = #formation_sprite{type = Type,
					team_list =
					    [#team_sprite{team = 1, plan_id = 0,
							  team_sprites =
							      Sprites}]},
	  do_init_formation_list(Rest, Sprites,
				 [Formation | FormationList])
    end.

do_init_formation_list1(Now, TeamNum, _Sprites,
			TeamList)
    when Now > TeamNum ->
    TeamList;
do_init_formation_list1(Now = 1, TeamNum, Sprites,
			TeamList) ->
    do_init_formation_list1(Now + 1, TeamNum, Sprites,
			    [#team_sprite{team = 1, plan_id = 0,
					  team_sprites = Sprites}
			     | TeamList]);
do_init_formation_list1(Now, TeamNum, Sprites,
			TeamList) ->
    NewSprites = [{Pos, 0} || {Pos, _Bid} <- Sprites],
    do_init_formation_list1(Now + 1, TeamNum, Sprites,
			    [#team_sprite{team = Now, plan_id = 0,
					  team_sprites = NewSprites}
			     | TeamList]).

login_init([], FormationList, _Sprites) ->
    FormationList;
login_init([Type | Rest], FormationList, Sprites) ->
    case lists:keyfind(Type, #formation_sprite.type,
		       FormationList)
	of
      #formation_sprite{} ->
	  login_init(Rest, FormationList, Sprites);
      _ ->
	  case sprite_data:get_sprite_type_team(Type) of
	    TeamNum when is_integer(TeamNum) ->
		TeamList = do_init_formation_list1(1, TeamNum, Sprites,
						   []),
		Formation = #formation_sprite{type = Type,
					      team_list = TeamList},
		login_init(Rest, [Formation | FormationList], Sprites);
	    _ ->
		Formation = #formation_sprite{type = Type,
					      team_list =
						  [#team_sprite{team = 1,
								plan_id = 0,
								team_sprites =
								    Sprites}]},
		login_init(Rest, [Formation | FormationList], Sprites)
	  end
    end.

do_exchange_formation_list([], _Bid, _ExchangeBid,
			   _AllHasBids, FormationList) ->
    FormationList;
do_exchange_formation_list([Formation =
				#formation_sprite{team_list = TeamList}
			    | Rest],
			   Bid, ExchangeBid, AllHasBids, FormationList) ->
    SortTeamList = lists:keysort(#team_sprite.team,
				 TeamList),
    NewTeamList = do_exchange_formation_list1(SortTeamList,
					      Bid, ExchangeBid, AllHasBids, 0,
					      []),
    NewFormation = Formation#formation_sprite{team_list =
						  NewTeamList},
    do_exchange_formation_list(Rest, Bid, ExchangeBid,
			       AllHasBids, [NewFormation | FormationList]).

do_exchange_formation_list1([], _Bid, _ExchangeBid,
			    _AllHasBids, _Flag, TeamList) ->
    TeamList;
do_exchange_formation_list1([ThisTeam =
				 #team_sprite{team_sprites = TeamSprites,
					      plan_id = PlanId}
			     | Rest],
			    Bid, ExchangeBid, AllHasBids, Flag, TeamList) ->
    {NewAllHasBids, NewPlanId, NewFlag, NewTeamSprites} =
	do_exchange_formation_list2(TeamSprites, Bid,
				    ExchangeBid, AllHasBids, PlanId, Flag, []),
    NewThisTeam = ThisTeam#team_sprite{team_sprites =
					   NewTeamSprites,
				       plan_id = NewPlanId},
    do_exchange_formation_list1(Rest, Bid, ExchangeBid,
				NewAllHasBids, NewFlag,
				[NewThisTeam | TeamList]).

do_exchange_formation_list2([], _Bid, _ExchangeBid,
			    AllHasBids, PlanId, Flag, TeamSprites) ->
    {AllHasBids, PlanId, Flag, TeamSprites};
do_exchange_formation_list2([{Pos, 0} | Rest], Bid,
			    ExchangeBid, AllHasBids, PlanId, Flag,
			    TeamSprites) ->
    do_exchange_formation_list2(Rest, Bid, ExchangeBid,
				AllHasBids, PlanId, Flag,
				[{Pos, 0} | TeamSprites]);
do_exchange_formation_list2([{Pos, PosBid} | Rest], Bid,
			    ExchangeBid, AllHasBids, PlanId, Flag,
			    TeamSprites) ->
    case PosBid =:= Bid of
      true ->
	  case Flag of
	    0 ->
		case lists:member(ExchangeBid, AllHasBids) of
		  true ->
		      NewAllHasBids = lists:delete(ExchangeBid, AllHasBids),
		      do_exchange_formation_list2(Rest, Bid, ExchangeBid,
						  NewAllHasBids, 0, 1,
						  [{Pos, ExchangeBid}
						   | TeamSprites]);
		  _ ->
		      case lists:member(PosBid, AllHasBids) of
			true ->
			    NewAllHasBids = lists:delete(PosBid, AllHasBids),
			    do_exchange_formation_list2(Rest, Bid, ExchangeBid,
							NewAllHasBids, PlanId,
							Flag,
							[{Pos, PosBid}
							 | TeamSprites]);
			_ ->
			    do_exchange_formation_list2(Rest, Bid, ExchangeBid,
							AllHasBids, 0, Flag,
							[{Pos, 0}
							 | TeamSprites])
		      end
		end;
	    _ ->
		case lists:member(PosBid, AllHasBids) of
		  true ->
		      NewAllHasBids = lists:delete(PosBid, AllHasBids),
		      do_exchange_formation_list2(Rest, Bid, ExchangeBid,
						  NewAllHasBids, PlanId, Flag,
						  [{Pos, PosBid}
						   | TeamSprites]);
		  _ ->
		      do_exchange_formation_list2(Rest, Bid, ExchangeBid,
						  AllHasBids, 0, Flag,
						  [{Pos, 0} | TeamSprites])
		end
	  end;
      _ ->
	  case lists:member(PosBid, AllHasBids) of
	    true ->
		NewAllHasBids = lists:delete(PosBid, AllHasBids),
		do_exchange_formation_list2(Rest, Bid, ExchangeBid,
					    NewAllHasBids, PlanId, Flag,
					    [{Pos, PosBid} | TeamSprites]);
	    _ ->
		do_exchange_formation_list2(Rest, Bid, ExchangeBid,
					    AllHasBids, 0, Flag,
					    [{Pos, 0} | TeamSprites])
	  end
    end.

do_exchange_plan([], _Bid, _ExchangeBid, _AllHasBids,
		 PlanList) ->
    PlanList;
do_exchange_plan([SpritePlan = #sprite_plan{plan_sprites
						= PlanSprites}
		  | Rest],
		 Bid, ExchangeBid, AllHasBids, PlanList) ->
    NewPlanSprites = do_exchange_plan1(PlanSprites, Bid,
				       ExchangeBid, AllHasBids, []),
    NewSpritePlan = SpritePlan#sprite_plan{plan_sprites =
					       NewPlanSprites},
    do_exchange_plan(Rest, Bid, ExchangeBid, AllHasBids,
		     [NewSpritePlan | PlanList]).

do_exchange_plan1([], _Bid, _ExchangeBid, _AllHasBids,
		  PlanSprites) ->
    PlanSprites;
do_exchange_plan1([{Pos, 0} | Rest], Bid, ExchangeBid,
		  AllHasBids, PlanSprites) ->
    do_exchange_plan1(Rest, Bid, ExchangeBid, AllHasBids,
		      [{Pos, 0} | PlanSprites]);
do_exchange_plan1([{Pos, PosBid} | Rest], Bid,
		  ExchangeBid, AllHasBids, PlanSprites) ->
    case PosBid =:= Bid of
      true ->
	  case lists:member(ExchangeBid, AllHasBids) of
	    true ->
		NewAllHasBids = lists:delete(ExchangeBid, AllHasBids),
		do_exchange_plan1(Rest, Bid, ExchangeBid, NewAllHasBids,
				  [{Pos, ExchangeBid} | PlanSprites]);
	    _ ->
		case lists:member(PosBid, AllHasBids) of
		  true ->
		      NewAllHasBids = lists:delete(PosBid, AllHasBids),
		      do_exchange_plan1(Rest, Bid, ExchangeBid, NewAllHasBids,
					[{Pos, PosBid} | PlanSprites]);
		  _ ->
		      do_exchange_plan1(Rest, Bid, ExchangeBid, AllHasBids,
					[{Pos, 0} | PlanSprites])
		end
	  end;
      _ ->
	  case lists:member(PosBid, AllHasBids) of
	    true ->
		NewAllHasBids = lists:delete(PosBid, AllHasBids),
		do_exchange_plan1(Rest, Bid, ExchangeBid, NewAllHasBids,
				  [{Pos, PosBid} | PlanSprites]);
	    _ ->
		do_exchange_plan1(Rest, Bid, ExchangeBid, AllHasBids,
				  [{Pos, 0} | PlanSprites])
	  end
    end.

do_add_pos(_AllPos, [], PlanList, FormationList) ->
    {PlanList, FormationList};
do_add_pos(AllPos,
	   [SpritePlan = #sprite_plan{plan_sprites = Sprites}
	    | Rest],
	   PlanList, FormationList) ->
    Fun = fun (Pos, Acc) ->
		  case lists:keymember(Pos, 1, Acc) of
		    true -> Acc;
		    _ -> [{Pos, 0} | Acc]
		  end
	  end,
    NSprites = lists:foldl(Fun, Sprites, AllPos),
    NewSpritePlan = SpritePlan#sprite_plan{plan_sprites =
					       NSprites},
    do_add_pos(AllPos, Rest, [NewSpritePlan | PlanList],
	       FormationList);
do_add_pos(AllPos,
	   [Formation = #formation_sprite{team_list = TeamList}
	    | Rest],
	   PlanList, FormationList) ->
    NewTeamList = do_add_pos1(AllPos, TeamList, []),
    NewFormation = Formation#formation_sprite{team_list =
						  NewTeamList},
    do_add_pos(AllPos, Rest, PlanList,
	       [NewFormation | FormationList]).

do_add_pos1(_AllPos, [], TeamList) -> TeamList;
do_add_pos1(AllPos,
	    [TeamSprite = #team_sprite{team_sprites = Sprites}
	     | Rest],
	    TeamList) ->
    Fun = fun (Pos, Acc) ->
		  case lists:keymember(Pos, 1, Acc) of
		    true -> Acc;
		    _ -> [{Pos, 0} | Acc]
		  end
	  end,
    NSprites = lists:foldl(Fun, Sprites, AllPos),
    NewTeamSprite = TeamSprite#team_sprite{team_sprites =
					       NSprites},
    do_add_pos1(AllPos, Rest, [NewTeamSprite | TeamList]).

save_other_type_information(6, Role) ->
    case role_robot:sync_role(Role) of
      {ok, Robot} ->
	  arena_champion_mgr:sync_role(Role, power),
	  arena_champion_mgr:update_combat_fighter(Robot),
	  arena_cluster_champion_mgr:sync_role(Role, power);
      _ -> skip
    end;
save_other_type_information(28, Role) ->
    arena_team_member:update_member(Role, sprite);
save_other_type_information(_Type, _Role) -> skip.


