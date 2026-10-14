-file("src/mod/sns/sns_rpc.erl", 1).

-module(sns_rpc).

-lager_records([{role_online,
		 [id, pid, conn_pid, name, account, status, lev, sex,
		  realm, platform, channel, career, power, face_id,
		  face_file, face_update_time, socket, max_dun_id,
		  province_name, city_name]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{friend_req,
		 [id, name, sex, career, face_id, lev, power, time,
		  avatar_bid, face_update_time, face_file]},
		{role_friend,
		 [id, name, gname, gid, sex, career, face_id, lev, power,
		  login_time, login_out_time, is_online, main_partner_id,
		  partner_bid, partner_lev, partner_star, is_home,
		  avatar_bid, vip_lev, dun_id, soft, face_update_time,
		  face_file]},
		{friend, [myid, fid, intimacy, is_draw, ctime]},
		{friend_tmp,
		 [fid, intimacy, ctime, name, gname, gid, sex, career,
		  face_id, avatar_bid, lev, vip_lev, power, login_time,
		  login_out_time, is_online, is_cross, main_partner_id,
		  partner_bid, partner_lev, partner_star, is_awake,
		  is_used, is_present, is_draw, dun_id, is_fanse, is_home,
		  soft, face_update_time, face_file]},
		{m_friend, [ver, is_open, list]},
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

-file("src/mod/sns/sns_rpc.erl", 9).

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

-file("src/mod/sns/sns_rpc.erl", 10).

-file("inc/friend.hrl", 1).

-record(m_friend, {ver = 1, is_open = 0, list = []}).

-record(friend_tmp,
	{fid = {0, <<>>}, intimacy = 0, ctime = 0, name = <<>>,
	 gname = <<>>, gid = {0, <<>>}, sex = 0, career = 0,
	 face_id = 0, avatar_bid = 0, lev = 0, vip_lev = 0,
	 power = 0, login_time = 0, login_out_time = 0,
	 is_online = 0, is_cross = 0, main_partner_id = 0,
	 partner_bid = 0, partner_lev = 0, partner_star = 0,
	 is_awake = 0, is_used = 0, is_present = 0, is_draw = 0,
	 dun_id = 1, is_fanse = 0, is_home = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(friend,
	{myid = 0, fid = {0, <<>>}, intimacy = 0, is_draw = 0,
	 ctime = 0}).

-record(role_friend,
	{id = {0, <<>>}, name = <<>>, gname = <<>>,
	 gid = {0, <<>>}, sex = 0, career = 0, face_id = 0,
	 lev = 0, power = 0, login_time = 0, login_out_time = 0,
	 is_online = 0, main_partner_id = 0, partner_bid = 0,
	 partner_lev = 0, partner_star = 0, is_home = 0,
	 avatar_bid = 0, vip_lev = 0, dun_id = 1, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(friend_req,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 face_id = 0, lev = 0, power = 0, time = 0,
	 avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-file("src/mod/sns/sns_rpc.erl", 11).

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

-file("src/mod/sns/sns_rpc.erl", 12).

-file("inc/role_online.hrl", 1).

-record(role_online,
	{id = {0, 0}, pid, conn_pid, name, account, status, lev,
	 sex, realm, platform, channel, career, power, face_id,
	 face_file = <<>>, face_update_time = 0, socket,
	 max_dun_id, province_name, city_name}).

-file("src/mod/sns/sns_rpc.erl", 13).

handle(13300, {},
       Role = #role{id = RoleId,
		    m_friend = #m_friend{list = List}}) ->
    {PresentCount, DrawCount} = var:get_var(Role, day, 55,
					    {10, 30}),
    DrawAll = 30,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsns_rpc18, _,
       {__Levelsns_rpc18, __Tracessns_rpc18}}
	  when __Levelsns_rpc18 band 128 /= 0 orelse
		 __Tracessns_rpc18 /= [] ->
	  lager:do_log(debug,
		       [{module, sns_rpc}, {function, handle}, {line, 18},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("好友ets列表:~w",
				     [friend_mgr:list_friends(RoleId)]),
		       none, 4096, 128, __Levelsns_rpc18, __Tracessns_rpc18,
		       lager_event, __Pidsns_rpc18);
      _ -> ok
    end,
    {reply, {PresentCount, DrawCount, DrawAll, List}};
handle(13303, {Rid, SrvId}, Role) ->
    case friend:req_add(Role, {Rid, SrvId}) of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, Msg} -> {reply, {1, Msg}};
      {ok, Msg, NRole} -> {reply, {1, Msg}, NRole}
    end;
handle(13305, {Rid, SrvId, Agree}, Role) ->
    case friend:reply_add(Role, {Rid, SrvId}, Agree) of
      {false, Reason} -> {reply, {Rid, SrvId, 0, Reason}};
      {ok, NRole} -> {reply, {Rid, SrvId, 1, <<>>}, NRole};
      ok -> {reply, {Rid, SrvId, 1, <<>>}}
    end;
handle(13306, {Ids}, Role) ->
    {ok, NRole} = friend:batch_req_add(Role, Ids),
    {reply, {1, lang:get(<<"请求已发送，请耐心等待"/utf8>>)}, NRole};
handle(13307, {Rid, SrvId}, Role) ->
    case friend:del(Role, {Rid, SrvId}) of
      {false, Reason} -> {reply, {0, Reason, Rid, SrvId}};
      {ok, NRole} ->
	  {reply, {1, lang:get(<<"删除成功"/utf8>>), Rid, SrvId},
	   NRole}
    end;
handle(13309, {Ids}, Role) ->
    {ok, NRole, DelIds} = friend:batch_del(Role, Ids),
    {reply, {DelIds}, NRole};
handle(13311, {}, _Role) ->
    {reply, {util:get(friend_req_list, [])}};
handle(13312, {}, _Role) ->
    erase(friend_req_list), {reply, {1, <<>>}};
handle(13314, {Name}, _Role) ->
    case role_misc:check_cd(rpc_13314, 1000) of
      true ->
	  List = role_query:search_name(Name, 10, 1, 200),
	  List1 = [RoleOnline#role_online{face_id =
					      util:if_true(holiday_return_new:is_return(RoleId)
							     =:= 1,
							   FaceId * 10000,
							   FaceId)}
		   || RoleOnline = #role_online{id = RoleId,
						face_id = FaceId}
			  <- List],
	  {reply, {List1}};
      _ -> ok
    end;
handle(13316, {Rid, SrvId, Type}, Role) ->
    case friend:present(Role, {Rid, SrvId}, Type) of
      {ok, NRole, Present, Draw} ->
	  {PresentCount, DrawCount} = var:get_var(NRole, day, 55,
						  {10, 30}),
	  {reply,
	   {Rid, SrvId, PresentCount, DrawCount, 1, <<>>, Type,
	    Present, Draw},
	   NRole};
      {false, Reason} ->
	  {PresentCount, DrawCount} = var:get_var(Role, day, 55,
						  {10, 30}),
	  {reply,
	   {Rid, SrvId, PresentCount, DrawCount, 0, Reason, Type,
	    0, 0}}
    end;
handle(13317, {Type, Ids},
       Role = #role{m_friend = #m_friend{list = FL}}) ->
    NewIds = case Type of
	       0 ->
		   FL1 = [FT || FT = #friend_tmp{is_present = 0} <- FL],
		   FL2 = util:keys_sort([#friend_tmp.login_time,
					 #friend_tmp.is_fanse],
					FL1),
		   Ids1 = [Fid || #friend_tmp{fid = Fid} <- FL2],
		   {PresentCount, _} = var:get_var(Role, day, 55,
						   {10, 30}),
		   {Ids2, _} = list_util:split(PresentCount, Ids1),
		   Ids2;
	       _ -> Ids
	     end,
    case friend:batch_present(Role, NewIds, Type) of
      {ok, <<>>, List, NRole} ->
	  {reply, {1, <<>>, Type, List}, NRole};
      {false, Reason, List, NRole} ->
	  {reply, {0, Reason, Type, List}, NRole}
    end;
handle(13320, {}, Role) ->
    case role_misc:check_cd(rpc_13320, 1000) of
      true ->
	  List = friend:search_list(Role),
	  List1 = [RoleOnline#role_online{face_id =
					      util:if_true(holiday_return_new:is_return(RoleId)
							     =:= 1,
							   FaceId * 10000,
							   FaceId)}
		   || RoleOnline = #role_online{id = RoleId,
						face_id = FaceId}
			  <- List],
	  {reply, {List1}};
      _ -> ok
    end;
handle(13330, {}, Role) ->
    List = sns_black:cli_list(Role),
    List1 = [RoleFriend#role_friend{face_id =
					util:if_true(holiday_return_new:is_return(RoleId)
						       =:= 1,
						     FaceId * 10000, FaceId)}
	     || RoleFriend = #role_friend{id = RoleId,
					  face_id = FaceId}
		    <- List],
    {reply, {List1}};
handle(13332, {Rid, SrvId}, Role) ->
    case sns_black:add(Role, {Rid, SrvId}) of
      {false, Reason} -> {reply, {0, Reason, Rid, SrvId}};
      {ok, NRole} ->
	  {reply, {1, lang:get(<<"添加成功"/utf8>>), Rid, SrvId},
	   NRole}
    end;
handle(13333, {Rid, SrvId}, Role) ->
    case sns_black:del(Role, {Rid, SrvId}) of
      {false, Reason} -> {reply, {0, Reason, Rid, SrvId}};
      {ok, NRole} -> {reply, {1, <<>>, Rid, SrvId}, NRole}
    end;
handle(13334, {Ids}, Role) ->
    {ok, NRole, DelIds} = friend:batch_add(Role, Ids),
    {reply, {DelIds}, NRole};
handle(_Cmd, _Data, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsns_rpc150, _,
       {__Levelsns_rpc150, __Tracessns_rpc150}}
	  when __Levelsns_rpc150 band 128 /= 0 orelse
		 __Tracessns_rpc150 /= [] ->
	  lager:do_log(debug,
		       [{module, sns_rpc}, {function, handle}, {line, 150},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("模块[~w]收到无效的RPC调用[~w]: ~w",
				     [sns_rpc, _Cmd, _Data]),
		       none, 4096, 128, __Levelsns_rpc150, __Tracessns_rpc150,
		       lager_event, __Pidsns_rpc150);
      _ -> ok
    end,
    {error, unknow_command}.


