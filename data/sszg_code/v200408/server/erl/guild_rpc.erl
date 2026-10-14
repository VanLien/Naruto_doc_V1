-file("src/mod/guild/guild_rpc.erl", 1).

-module(guild_rpc).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{g_mem_red_packet,
		 [id, rid, name, face_id, avatar_bid, post, type, num,
		  max_num, val, max_val, list, mems, start_time, end_time,
		  msg_id, face_update_time, face_file]},
		{guild_data, [lev, exp, num, maintain]},
		{guild_position, [id, name, limit]},
		{g_merge,
		 [gid, gname, gid2, gname2, role_id, rname, end_time,
		  gold]},
		{guild_rank,
		 [id, name, lev, exp, leader_name, leader_id,
		  leader_face, leader_lev, members_num, members_max,
		  apply_lev, apply_type, create_time, power, index,
		  leader_avatar_bid, leader_look_id,
		  leader_face_update_time, leader_face_file,
		  apply_power]},
		{guild_apply,
		 [gid, id, pid, name, face, lev, power, post, vip_lev,
		  online, apply_time, face_update_time, face_file]},
		{guild_member,
		 [ver, id, pid, name, face, lev, sex, power, post,
		  vip_lev, online, join_time, login_time, donate,
		  day_donate, avatar_bid, red_packet_num,
		  red_packet_price, red_packet_time, red_packet_recv_num,
		  red_packet_recv_time, active_lev, day_donate_type,
		  day_donate_time, day_dun_time, day_war_time, look_id,
		  face_update_time, face_file]},
		{guild_war_box,
		 [order, rid, sid, name, item_id, item_num]},
		{guild_cache, []},
		{guild,
		 [ver, id, name, lev, exp, day_exp, pid, leader_name,
		  leader_id, members, members_num, members_max, next_id,
		  sign, apply_lev, apply_type, recruit_num, cache, sync,
		  create_time, power, rename_time, lock_time, donate_exp,
		  red_packet, guild_war_box_end_time, guild_war_relust,
		  guild_war_box, guild_war_sign, day_var,
		  vice_leader_mail, normal_mail, vitality, apply_power]},
		{guild_bag,
		 [ver, id, pid, name, post, lev, join_time, quit_time,
		  send_time, send_num, recv_num, true_quit_time,
		  quit_post]},
		{guild_log_info,
		 [id, guild_id, type, time, role_id, role_name, msg]},
		{guild_log, [key, list]},
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

-file("src/mod/guild/guild_rpc.erl", 9).

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

-file("src/mod/guild/guild_rpc.erl", 10).

-file("inc/guild.hrl", 1).

-record(guild_log, {key = {0, <<>>}, list = []}).

-record(guild_log_info,
	{id = 0, guild_id = {0, <<>>}, type = 0, time = 0,
	 role_id = {0, <<>>}, role_name = 0, msg = <<>>}).

-record(guild_bag,
	{ver = 2, id = {0, <<>>}, pid, name = <<>>, post = 0,
	 lev = 0, join_time = 0, quit_time = 0, send_time = 0,
	 send_num = 0, recv_num = 0, true_quit_time = 0,
	 quit_post = 0}).

-record(guild,
	{ver = 7, id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 day_exp = 0, pid = 0, leader_name = <<>>,
	 leader_id = {0, <<>>}, members = [], members_num = 1,
	 members_max = 50, next_id = 1, sign = <<>>,
	 apply_lev = guild_data:get_const(guild_min_lev),
	 apply_type = 1, recruit_num = 0, cache, sync = 0,
	 create_time = 0, power = 0, rename_time = 0,
	 lock_time = 0, donate_exp = 0, red_packet = [],
	 guild_war_box_end_time = 0, guild_war_relust = 0,
	 guild_war_box = [], guild_war_sign = [], day_var = [],
	 vice_leader_mail = 0, normal_mail = 0, vitality = 0,
	 apply_power = 0}).

-record(guild_cache, {}).

-record(guild_war_box,
	{order = 0, rid = 0, sid = <<>>, name = <<>>,
	 item_id = 0, item_num = 0}).

-record(guild_member,
	{ver = 6, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, sex = 1, power = 0, post = 0,
	 vip_lev = 0, online = 1, join_time = 0, login_time = 0,
	 donate = 0, day_donate = 0, avatar_bid = 0,
	 red_packet_num = 0, red_packet_price = 0,
	 red_packet_time = 0, red_packet_recv_num = 0,
	 red_packet_recv_time = 0, active_lev = 0,
	 day_donate_type = 0, day_donate_time = 0,
	 day_dun_time = 0, day_war_time = 0, look_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(guild_apply,
	{gid = {0, <<>>}, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, power = 0, post = 0, vip_lev = 0,
	 online = 1, apply_time = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(guild_rank,
	{id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 leader_name = <<>>, leader_id = {0, <<>>},
	 leader_face = 0, leader_lev = 0, members_num = 1,
	 members_max = 50, apply_lev = 0, apply_type = 1,
	 create_time = 0, power = 0, index = 0,
	 leader_avatar_bid = 0, leader_look_id = 0,
	 leader_face_update_time = 0, leader_face_file = <<>>,
	 apply_power = 0}).

-record(g_merge,
	{gid = {0, <<>>}, gname = <<>>, gid2 = {0, <<>>},
	 gname2 = <<>>, role_id = {0, <<>>}, rname = <<>>,
	 end_time = 0, gold = 0}).

-record(guild_position,
	{id = 0, name = <<>>, limit = []}).

-record(guild_data,
	{lev = 0, exp = 0, num = 0, maintain = 0}).

-record(g_mem_red_packet,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, name = <<>>,
	 face_id = 0, avatar_bid = 0, post = <<>>, type = 0,
	 num = 0, max_num = 0, val = 0, max_val = 0, list = [],
	 mems = [], start_time = 0, end_time = 0, msg_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/guild/guild_rpc.erl", 11).

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

-file("src/mod/guild/guild_rpc.erl", 12).

handle(13500,
       {GName, Sign, ApplyType, ApplyLev, ApplyPower}, Role) ->
    case guild_handle:create(Role,
			     {GName, Sign, ApplyType, ApplyLev, ApplyPower})
	of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} ->
	  {reply, {1, lang:get(<<"创建成功"/utf8>>)}, NRole}
    end;
handle(13501, {Page, Flag, Num, SearchName0},
       #role{id = RoleId}) ->
    L0 = guild_rank:get_rank_list(),
    L1 = case Flag of
	   1 -> L0;
	   _ ->
	       [G
		|| G = #guild_rank{members_max = Max,
				   members_num = Num0}
		       <- L0,
		   Num0 < Max]
	 end,
    L2 = case unicode:characters_to_list(SearchName0) of
	   [] -> L1;
	   SearchName ->
	       [G
		|| G = #guild_rank{name = GName} <- L0,
		   string:str(unicode:characters_to_list(GName),
			      SearchName)
		     > 0]
	 end,
    {NewPage, PageTotal, PageL} = case Num of
				    0 -> {1, 1, L2};
				    _ -> util:pages(Num, Page, L2)
				  end,
    ApplyList = guild_mgr:get_role_apply(RoleId),
    Fun = fun (G = #guild_rank{id = Gid}) ->
		  IsApply = case lists:keymember(Gid, #guild_apply.gid,
						 ApplyList)
				of
			      true -> 1;
			      _ -> 0
			    end,
		  {G, IsApply}
	  end,
    PageL1 = [Fun(G) || G <- PageL],
    N = length(L0),
    {reply,
     {NewPage, Flag, Num, PageTotal, N, SearchName0,
      PageL1}};
handle(13503, {Gid, GSrvId, Type}, Role) ->
    case guild_invite:req_join(Role, {Gid, GSrvId}, Type) of
      {false, Reason} -> {reply, {0, Reason, Gid, GSrvId, 0}};
      ok -> {ok, Role}
    end;
handle(13505, {Type, Rid, SrvId}, Role) ->
    case guild_invite:reply_join(Role, {Rid, SrvId}, Type)
	of
      {false, Reason} ->
	  {reply, {Type, Rid, SrvId, 0, Reason}};
      ok -> {reply, {Type, Rid, SrvId, 1, <<>>}}
    end;
handle(13507, {Page, Num},
       _Role = #role{guild_bag = #guild_bag{id = GuildId}}) ->
    ApplyList = guild_mgr:apply_list(GuildId),
    {_, PageTotal, ApplyPageL} = case {Page, Num} of
				   {Page, Num}
				       when Page >= 1 andalso Num >= 1 ->
				       util:pages(Num, Page, ApplyList);
				   _ -> {1, 1, ApplyList}
				 end,
    Fun = fun (#guild_apply{id = ApplyRoleId,
			    name = ApplyName, lev = ApplyLev, face = ApplyFace,
			    power = ApplyPower, vip_lev = ApplyVipLev,
			    face_update_time = FaceUpdateTime,
			    face_file = FaceFile},
	       Acc) ->
		  IsOnline = case role_query:local_cache(by_id,
							 ApplyRoleId)
				 of
			       {ok, _} -> 1;
			       _ -> 0
			     end,
		  CliData = {ApplyRoleId, ApplyName, ApplyLev, ApplyFace,
			     ApplyPower, ApplyVipLev, IsOnline, FaceUpdateTime,
			     FaceFile},
		  [CliData | Acc]
	  end,
    PageL = lists:foldl(Fun, [], ApplyPageL),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_rpc85, _,
       {__Levelguild_rpc85, __Tracesguild_rpc85}}
	  when __Levelguild_rpc85 band 128 /= 0 orelse
		 __Tracesguild_rpc85 /= [] ->
	  lager:do_log(debug,
		       [{module, guild_rpc}, {function, handle}, {line, 85},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]分页请求申请列表Page:~w, Num:~w, GuildId:~w",
				     [_Role#role.name, Page, Num, GuildId]),
		       none, 4096, 128, __Levelguild_rpc85,
		       __Tracesguild_rpc85, lager_event, __Pidguild_rpc85);
      _ -> ok
    end,
    {reply, {Page, PageTotal, Num, PageL}};
handle(13507, _Args, _Role) -> ok;
handle(13513, {Rid, SrvId}, Role) ->
    case guild_war_lib:check_can(Role) of
      false ->
	  {reply,
	   {Rid, SrvId, 0,
	    lang:get(<<"公会战匹配和进行期间不能移除他人出会"/utf8>>)}};
      _ ->
	  case guild_handle:kick(Role, {Rid, SrvId}) of
	    {false, Reason} -> {reply, {Rid, SrvId, 0, Reason}};
	    ok -> {reply, {Rid, SrvId, 1, <<>>}}
	  end
    end;
handle(13514, {}, Role) ->
    case guild_war_lib:check_can(Role) of
      false ->
	  {reply, {0, lang:get(<<"公会战匹配和进行期间不能退出公会"/utf8>>)}};
      _ ->
	  case guild_handle:quit(Role) of
	    {false, Reason} -> {reply, {0, Reason}};
	    ok -> ok
	  end
    end;
handle(13516, {}, Role) ->
    case guild_war_lib:check_can(Role) of
      false ->
	  {reply, {0, lang:get(<<"公会战匹配和进行期间不能解散公会"/utf8>>)}};
      _ ->
	  case guild_handle:disband(Role) of
	    {false, Reason} -> {reply, {0, Reason}};
	    ok -> ok
	  end
    end;
handle(13518, {},
       #role{guild_bag = #guild_bag{id = GuildId}}) ->
    case guild_lib:info(by_id, GuildId) of
      {ok, G} ->
	  {reply, {G, guild_rank:get_rank_idx(GuildId)}};
      _ -> ok
    end;
handle(13519, {},
       #role{guild_bag = #guild_bag{id = GuildId}}) ->
    case guild_lib:elem(GuildId, #guild.members) of
      {ok, Members = [_ | _]} -> {reply, {Members}};
      _ -> ok
    end;
handle(13520, {Rid, SrvId, Post}, Role) ->
    case guild_handle:set_post(Role, {Rid, SrvId}, Post) of
      {false, Reason} ->
	  {reply, {Rid, SrvId, Post, 0, Reason}};
      ok -> {reply, {Rid, SrvId, Post, 1, <<>>}}
    end;
handle(13521, {Sign}, Role) ->
    case guild_handle:set_sign(Role, Sign) of
      {false, Reason} -> {reply, {0, Reason}};
      ok -> {reply, {1, <<>>}}
    end;
handle(13522, {ApplyType, ApplyLev, ApplyPower}, Role)
    when ApplyType >= 0 andalso ApplyType =< 2 ->
    case guild_handle:set_apply(Role, ApplyType, ApplyLev,
				ApplyPower)
	of
      {false, Reason} -> {reply, {0, Reason}};
      ok -> {reply, {1, <<>>}}
    end;
handle(13523, {}, Role) ->
    guild_handle:push_base(Role), ok;
handle(13524, {Type}, Role) ->
    role:send_buff_begin(),
    case guild_handle:donate(Role, Type) of
      {false, Reason} ->
	  role:send_buff_clean(), {reply, {0, Reason}};
      {ok, NRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NRole}
    end;
handle(13534, {}, Role) ->
    guild_mem_red_packet:push_list(Role), ok;
handle(13535, {Type, Num, Id, Arg}, Role) ->
    role:send_buff_begin(),
    case guild_mem_red_packet:send(Role, Type, Num, Id, Arg)
	of
      {ok, NRole, #{day_send_num := DaySendNum}} ->
	  role:send_buff_flush(),
	  {reply, {1, lang:get(<<"发红包成功"/utf8>>), DaySendNum},
	   NRole};
      {false, Reason} ->
	  role:send_buff_clean(), {reply, {0, Reason, 0}}
    end;
handle(13536, {Id}, Role) ->
    role:send_buff_begin(),
    case guild_mem_red_packet:recv(Role, Id) of
      {ok, NRole,
       #{type := Type, get_val := Val,
	 day_recv_num := DayRecvNum}} ->
	  role:send_buff_flush(),
	  {reply, {1, <<>>, Id, Type, Val, DayRecvNum}, NRole};
      {false, Reason} ->
	  role:send_buff_clean(),
	  {reply, {0, Reason, Id, 0, 0, 0}}
    end;
handle(13540, {Id},
       #role{guild_bag = #guild_bag{id = GuildId}}) ->
    case ets:lookup(guild_mem_red_packet, {GuildId, Id}) of
      [#g_mem_red_packet{type = Type, name = Name,
			 face_id = FaceId, post = Post, avatar_bid = AvatarBid,
			 max_val = Val, mems = Mems,
			 face_update_time = FaceUpdateTime,
			 face_file = FaceFile}] ->
	  {reply,
	   {Id, Type, Name, FaceId, FaceUpdateTime, FaceFile,
	    AvatarBid, Post, Val, Mems}};
      _ -> ok
    end;
handle(13541, {},
       Role = #role{guild_bag = #guild_bag{id = GuildId}}) ->
    case guild_member:check_post(Role, verify_request) of
      true ->
	  ets:delete(guild_apply, GuildId), {reply, {1, <<>>}};
      {false, Reason} -> {reply, {0, Reason}}
    end;
handle(13545, {}, Role) ->
    {reply, {guild_mem_red_packet:recv_rank(Role)}};
handle(13546, {}, Role) ->
    guild_mem_red_packet:push_red_packet_info(Role), ok;
handle(13558, {}, Role) ->
    case guild_handle:recruit(Role) of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} ->
	  {reply, {1, lang:get(<<"招募消息发布成功"/utf8>>)}, NRole}
    end;
handle(13559, {Rid, SrvId}, Role) ->
    case guild_invite:req_invite(Role, {Rid, SrvId}) of
      {false, Reason} -> {reply, {0, Reason}};
      ok -> ok
    end;
handle(13561, {Type, Rid, SrvId}, Role) ->
    case guild_invite:reply_invite(Role, {Rid, SrvId}, Type)
	of
      {false, Reason} -> {reply, {0, Reason}};
      ok -> ok
    end;
handle(13565, {}, Role) ->
    role:send_buff_begin(),
    case guild_handle:impeach(Role) of
      {false, Reason} ->
	  role:send_buff_clean(), {reply, {0, Reason}};
      {ok, NRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NRole}
    end;
handle(13568, {GName},
       Role = #role{id = RId, name = RoleName,
		    guild_bag = #guild_bag{name = OldName}}) ->
    role:send_buff_begin(),
    case guild_handle:rename(Role, GName) of
      {false, Msg} ->
	  role:send_buff_clean(), {reply, {0, Msg}};
      {ok, NewR} ->
	  role:send_buff_flush(),
	  Msg =
	      util:format_ex(lang:get(<<"重大新闻！~s公会会长~s经过慎重考虑后，将公会更名为~s，从此以新的名号纵横大陆！"/utf8>>),
			     [color:format({green, OldName}),
			      color:format({name, RId, RoleName}),
			      color:format({green, GName})]),
	  notice:broadcast(rumor_left_top, Msg),
	  {sync, {1, lang:get(<<"修改成功"/utf8>>)}, NewR}
    end;
handle(13573, {},
       #role{guild_bag =
		 #guild_bag{id = GuildId, post = Post}}) ->
    case Post =:= 1 orelse Post =:= 2 of
      true ->
	  ApplyList = guild_mgr:apply_list(GuildId),
	  case ApplyList of
	    [_ | _] -> {reply, {1}};
	    _ -> ok
	  end;
      _ -> ok
    end;
handle(13574, {BoxId}, Role) ->
    case guild_handle:donate_box(Role, BoxId) of
      {ok, NewRole} ->
	  {reply, {1, lang:get(<<"领取成功"/utf8>>), BoxId}, NewRole};
      {false, Msg} -> {reply, {0, Msg, 0}}
    end;
handle(13576, {Rid, SrvId}, Role) ->
    case guild_invite:welcome(Role, {Rid, SrvId}) of
      ok -> {reply, {1, lang:get(<<"欢迎成功，感谢你的善意！"/utf8>>)}};
      {false, Msg} -> {reply, {0, Msg}}
    end;
handle(13577, {},
       #role{guild_bag = #guild_bag{id = GuildId}}) ->
    guild_handle:get_guild_log(GuildId), ok;
handle(13579, {Type, List},
       #role{guild_bag = #guild_bag{id = GuildId}}) ->
    case guild_handle:one_notice(GuildId, Type, List) of
      {true, Msg} -> {reply, {Msg}};
      {false, Msg} -> {reply, {Msg}}
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
      {__Pidguild_rpc395, _,
       {__Levelguild_rpc395, __Tracesguild_rpc395}}
	  when __Levelguild_rpc395 band 128 /= 0 orelse
		 __Tracesguild_rpc395 /= [] ->
	  lager:do_log(debug,
		       [{module, guild_rpc}, {function, handle}, {line, 395},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("模块[~w]收到无效的RPC调用[~w]: ~w",
				     [guild_rpc, _Cmd, _Data]),
		       none, 4096, 128, __Levelguild_rpc395,
		       __Tracesguild_rpc395, lager_event, __Pidguild_rpc395);
      _ -> ok
    end,
    {error, unknow_command}.


