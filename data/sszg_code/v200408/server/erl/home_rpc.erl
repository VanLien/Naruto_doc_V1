-file("data/home_rpc.erl", 1).

-file("src/mod/home/home_rpc.erl", 1).

-module(home_rpc).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{endless_robot_data,
		 [id, bid, rname, group_id, unit_id, lev, star, quality,
		  power]},
		{endless_employ,
		 [id, rid, rname, bid, plev, star, quality, break_lev,
		  power, num, ext]},
		{endless_data,
		 [type, id, name, lev, unit_ids, is_reset, formation]},
		{new_endless,
		 [ver, type, max_id, ext_reward, day_begin, day_pass,
		  ext]},
		{m_endless,
		 [ver, r_id, max_id, ext_reward, day_begin, day_pass,
		  day_reward, employ, appoint, type, select_type,
		  new_endless_list, ext, flag]},
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

-export([handle/3]).

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

-file("src/mod/home/home_rpc.erl", 10).

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

-file("src/mod/home/home_rpc.erl", 11).

-file("inc/endless.hrl", 1).

-record(m_endless,
	{ver = 2  :: pos_integer(), r_id = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(),
	 day_reward = []  :: list(), employ = []  :: list(),
	 appoint = []  :: list(), type = 0  :: pos_integer(),
	 select_type = 0  :: pos_integer(),
	 new_endless_list = []  :: list(), ext = []  :: list(),
	 flag = 0  :: pos_integer()}).

-record(new_endless,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(), ext = []  :: list()}).

-record(endless_data,
	{type = 0, id = 0, name = <<>>, lev = 0, unit_ids = [],
	 is_reset = 0, formation = undefined}).

-record(endless_employ,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, rname = <<>>,
	 bid = 0, plev = 0, star = 0, quality = 0, break_lev = 0,
	 power = 0, num = 0, ext = []}).

-record(endless_robot_data,
	{id = 0, bid = 0, rname = <<>>, group_id = 0,
	 unit_id = 0, lev = 0, star = 0, quality = 0,
	 power = 0}).

-file("src/mod/home/home_rpc.erl", 12).

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

-file("src/mod/home/home_rpc.erl", 13).

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

-file("src/mod/home/home_rpc.erl", 14).

handle(26001, {Floor}, Role) ->
    case home:enter(Role, Floor) of
      {ok, CliData} -> {reply, CliData};
      {ok, NRole, CliData} -> {reply, CliData, NRole};
      {false, Msg} -> notice:alert(Msg), ok
    end;
handle(26002, {WallBid, LandBid, List, Floor},
       Role = #role{m_home = #m_home{soft = OldSoft}}) ->
    case role_misc:check_cd(rpc_26002, 800) of
      true ->
	  role:send_buff_begin(),
	  case home:put_furniture(Role, WallBid, LandBid, List,
				  Floor)
	      of
	    {false, Msg} ->
		role:send_buff_clean(),
		{reply,
		 {0, Msg, OldSoft, WallBid, LandBid, List, Floor, 0, 0,
		  [], 0}};
	    {ok, NRole, NewSoft, MaxSoftFloor, MaxSumSoft, OtherBid,
	     MaxFloorSoft} ->
		role:send_buff_flush(),
		{reply,
		 {1, lang:get(<<"Đã lưu thành công"/utf8>>), NewSoft,
		  WallBid, LandBid, List, Floor, MaxSoftFloor, MaxSumSoft,
		  OtherBid, MaxFloorSoft},
		 NRole}
	  end;
      _ ->
	  {reply,
	   {0,
	    lang:get(<<"Hoạt động thường xuyên, vui lòng đợi"/utf8>>),
	    OldSoft, WallBid, LandBid, List, Floor, 0, 0, [], 0}}
    end;
handle(26003, {Rid, SrvId, Floor}, Role) ->
    case role_misc:check_cd(rpc_26003, 1000) of
      true ->
	  case home:visit(Role, {Rid, SrvId}, Floor) of
	    {false, Msg} ->
		{reply,
		 {0, Msg, Rid, SrvId, <<>>, 0, 0, 0, 0, 0, 0, [], [],
		  <<>>, Floor}};
	    {ok, NRole, CliData} -> {reply, CliData, NRole}
	  end;
      _ ->
	  {reply,
	   {0, <<>>, Rid, SrvId, <<>>, 0, 0, 0, 0, 0, 0, [], [],
	    <<>>, Floor}}
    end;
handle(26004, {}, Role) -> home:push_info(Role), ok;
handle(26005, {Id}, Role) ->
    case home:use_look(Role, Id) of
      {ok, NRole} ->
	  {reply,
	   {1, lang:get(<<"Thay thế thành công"/utf8>>), Id},
	   NRole};
      {false, Reason} -> {reply, {0, Reason, 0}}
    end;
handle(26006, {Id}, Role) ->
    case home:activate_look(Role, Id) of
      {ok, NRole} ->
	  {reply,
	   {1, lang:get(<<"Mua hàng thành công"/utf8>>), Id},
	   NRole};
      {false, Reason} -> {reply, {0, Reason, 0}}
    end;
handle(26007, {Id}, Role) ->
    case home:first_choose(Role, Id) of
      {ok, NRole} -> {reply, {1, <<>>, Id}, NRole};
      {false, Reason} -> {reply, {0, Reason, 0}}
    end;
handle(26009, {}, Role) ->
    case home:rand_list(Role) of
      {ok, NRole, NewRandList} ->
	  {reply, {NewRandList}, NRole};
      {false, OldRandList} -> {reply, {OldRandList}}
    end;
handle(26010, {}, Role = #role{id = RoleId}) ->
    home:get_log(Role),
    var:update_role_var_list(RoleId, other, [{del, 12}]),
    ok;
handle(26011, {HomeName}, Role) ->
    case home:rename(Role, HomeName) of
      {false, Msg} -> {reply, {0, Msg, HomeName}};
      {ok, NRole, NewHomeName} ->
	  {reply, {1, <<>>, NewHomeName}, NRole}
    end;
handle(26013, {}, Role) -> home:push_set_list(Role), ok;
handle(26014, {RewardId}, Role) ->
    case home:take_set_reward(Role, RewardId) of
      {false, Msg} -> {reply, {0, Msg, RewardId}};
      {ok, NRole} -> {reply, {1, <<>>, RewardId}, NRole}
    end;
handle(26016, {}, Role) ->
    case home:take_hook_items(Role) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(26017, {}, Role) ->
    IsFirst = util:if_true(home:check_open(Role), 1, 0),
    {reply, {IsFirst}};
handle(26018, {}, Role) ->
    home:push_red_point(Role), ok;
handle(26019, {},
       #role{m_home = #m_home{worship_list = List}}) ->
    {reply, {List}};
handle(26020, {}, Role) ->
    {MyRank, MyScore, RankList} = home:get_ranks(Role),
    {reply, {MyRank, MyScore, RankList}};
handle(26021, {MainFloor}, Role) ->
    case home:set_main_floor(Role, MainFloor) of
      {ok, NRole, NewMaxSoftFloor} ->
	  {reply, {1, <<>>, MainFloor, NewMaxSoftFloor}, NRole};
      {false, Msg} -> {reply, {0, Msg, MainFloor, 0}}
    end;
handle(_Cmd, _Data, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhome_rpc167, _,
       {__Levelhome_rpc167, __Traceshome_rpc167}}
	  when __Levelhome_rpc167 band 128 /= 0 orelse
		 __Traceshome_rpc167 /= [] ->
	  lager:do_log(debug,
		       [{module, home_rpc}, {function, handle}, {line, 167},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("模块[~w]收到无效的RPC调用[~w]: ~w",
				     [home_rpc, _Cmd, _Data]),
		       none, 4096, 128, __Levelhome_rpc167,
		       __Traceshome_rpc167, lager_event, __Pidhome_rpc167);
      _ -> ok
    end,
    {error, unknow_command}.


