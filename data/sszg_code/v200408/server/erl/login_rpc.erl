-file("src/mod/data/login_rpc.erl", 1).

-module(login_rpc).

-lager_records([{name_index,
		 [name, id, acc, pid, conn_pid]},
		{id_index, [id, name, acc, pid, conn_pid, login_err]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
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
		{link, [socket, conn_pid, ip, port, lag]},
		{conn,
		 [object, type, account, platform, zone_id, role_id,
		  pid_object, socket, ip, port, connect_time, recv_count,
		  last_recv_count, send_count, error_send, bad_req_count,
		  loop_counter, max_recv_size, debug, length, seq,
		  read_head, custodian, custodian_id, conn_pid, cmd_idx,
		  cmd_code, cmd_err]}]).

-export([handle/3, get_srv_id/0, update_login_args/3,
	 update_ip/1, acc_group/1]).

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

-file("src/mod/data/login_rpc.erl", 9).

-file("inc/conn.hrl", 1).

-record(conn,
	{object  :: undefined | connector | role,
	 type = tester  :: game_server | monitor | tester,
	 account = <<>>  :: bitstring(),
	 platform = <<>>  :: bitstring(),
	 zone_id = 0  :: non_neg_integer(),
	 role_id = 0  :: non_neg_integer(),
	 pid_object  :: undefined | pid(),
	 socket  :: undefined | port(),
	 ip = {0, 0, 0, 0}  :: {0..255, 0..255, 0..255, 0..255},
	 port = 1  :: pos_integer(),
	 connect_time = {0, 0, 0}  ::
	     {non_neg_integer(), non_neg_integer(),
	      non_neg_integer()},
	 recv_count = 0  :: non_neg_integer(),
	 last_recv_count = 0  :: non_neg_integer(),
	 send_count = 0  :: non_neg_integer(),
	 error_send = 0  :: non_neg_integer(),
	 bad_req_count = 0  :: non_neg_integer(),
	 loop_counter = 0  :: non_neg_integer(),
	 max_recv_size = 1024, debug = false,
	 length = 0  :: non_neg_integer(),
	 seq = 0  :: non_neg_integer(),
	 read_head = false  :: boolean(),
	 custodian = <<>>  :: bitstring(),
	 custodian_id  ::
	     undefined |
	     {non_neg_integer(), bitstring(), non_neg_integer()},
	 conn_pid, cmd_idx = 0, cmd_code = 0, cmd_err = 0}).

-file("src/mod/data/login_rpc.erl", 10).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/data/login_rpc.erl", 11).

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

-file("src/mod/data/login_rpc.erl", 12).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/data/login_rpc.erl", 13).

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

-file("src/mod/data/login_rpc.erl", 14).

-file("inc/role_query.hrl", 1).

-record(id_index,
	{id = {0, <<>>}, name = <<>>, acc = <<>>, pid, conn_pid,
	 login_err = 0}).

-record(name_index,
	{name = <<>>, id = {0, <<>>}, acc = <<>>, pid,
	 conn_pid}).

-file("src/mod/data/login_rpc.erl", 15).

update_ip(all) ->
    role_group:apply(world, {login_rpc, update_ip, []});
update_ip(#role{link = #link{ip = IP}}) ->
    {ProvinceName, CityName} = ip_mgr:ip_to_address(IP),
    put(province_name, ProvinceName),
    put(city_name, CityName),
    ok.

acc_group(<<"tanwan", _/binary>>) -> <<"50">>;
acc_group(<<"bingniao", _/binary>>) -> <<"51">>;
acc_group(<<"6kw", _/binary>>) -> <<"52">>;
acc_group(<<"9377", _/binary>>) -> <<"53">>;
acc_group(<<"ssgc_", _/binary>>) -> <<"53">>;
acc_group(<<"test", _/binary>>) -> <<"0">>;
acc_group(<<"demo", _/binary>>) -> <<"0">>;
acc_group(<<"release", _/binary>>) -> <<"0">>;
acc_group(<<"16_", _/binary>>) -> <<"1">>;
acc_group(<<"47_", _/binary>>) -> <<"1">>;
acc_group(<<"sy_win", _/binary>>) -> <<"1">>;
acc_group(<<"syios_djsdmm", _/binary>>) -> <<"6">>;
acc_group(<<"syios", _/binary>>) -> <<"3">>;
acc_group(<<"66_", _/binary>>) -> <<"7">>;
acc_group(_) -> <<"2">>.

handle(10101, _Data, #conn{pid_object = ObjectPid})
    when ObjectPid =/= undefined ->
    ok;
handle(10101, {_Sex, _Name, _Career, Channel},
       #conn{account = Account, ip = Ip})
    when Account /= <<>> ->
    Career = 0,
    Sex = 2,
    Flag = check_channel_create(Channel),
    IDFA = get(idfa),
    IpBin = util:ip_to_binary(Ip),
    GetuiCid = get(getui_cid),
    case auth_info([{idfa, IDFA}, {ip, IpBin},
		    {getui_cid, GetuiCid}])
	of
      {false, Reason} ->
	  {stop, {2, Reason, 0, <<>>, <<>>, 0}};
      _ ->
	  AccGroup = acc_group(Channel),
	  case
	    db:get_one("SELECT COUNT(*) FROM role WHERE account "
		       "= binary ? and acc_group = ?",
		       [Account, AccGroup])
	      of
	    _ when Flag =:= false ->
		{stop,
		 {2,
		  lang:get(<<"Không thể tạo gói trong khu vực này"/utf8>>),
		  0, <<>>, <<>>, 0}};
	    {error, _} ->
		{stop,
		 {2,
		  lang:get(<<"Không lấy được thông tin tài khoản"/utf8>>),
		  0, <<>>, <<>>, 0}};
	    {ok, Num} when Num >= 1 ->
		{stop,
		 {2,
		  lang:get(<<"Đã đạt đến giới hạn tạo, không thể tạo "
			     "vai trò"/utf8>>),
		  0, <<>>, <<>>, 0}};
	    {ok, _Num} ->
		Rid = sys_env:update_counter(role_max_rid, 1),
		Name2 = role_misc:rand_name(Rid),
		Now = date:unixtime(),
		SrvId = get_srv_id(),
		DeviceId = get(device_id),
		Sql = "insert into role(rid, srv_id, account, "
		      "name, sex, career , lev, reg_time, login_time"
		      ", logout_time , reg_ip, login_ip, is_online, "
		      "getui_cid, device_type, os_ver, carrier_name, "
		      "net_type, reg_channel, reg_device_id, "
		      "reg_idfa, reg_os_name, reg_app_name, "
		      "reg_package_name, reg_package_version, "
		      "channel, device_id, idfa, os_name, app_name, "
		      "package_name, package_version, acc_group) "
		      "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
		      "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
		      "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
		Agrs = [Rid, SrvId, Account, Name2, Sex, Career, 1, Now,
			0, 0, IpBin, IpBin, 0, GetuiCid, get(device_type),
			get(os_ver), get(carrier_name), get(net_type), Channel,
			DeviceId, IDFA, get(os_name), get(app_name),
			get(package_name), get(package_version), Channel,
			DeviceId, IDFA, get(os_name), get(app_name),
			get(package_name), get(package_version), AccGroup],
		case db:insert(Sql, Agrs) of
		  {error, _} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidlogin_rpc92, _,
			 {__Levellogin_rpc92, __Traceslogin_rpc92}}
			    when __Levellogin_rpc92 band 8 /= 0 orelse
				   __Traceslogin_rpc92 /= [] ->
			    lager:do_log(error,
					 [{module, login_rpc},
					  {function, handle}, {line, 92},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("创建角色失败:~w", [Agrs]),
					 none, 4096, 8, __Levellogin_rpc92,
					 __Traceslogin_rpc92, lager_event,
					 __Pidlogin_rpc92);
			_ -> ok
		      end,
		      server_monitor:error(1),
		      server_monitor:error_log({2, <<"建号失败"/utf8>>,
						<<"Tạo tài khoản không thành công, bạn "
						  "cần lên mạng để kiểm tra và xử lý ngay "
						  "lập tức"/utf8>>,
						login_rpc, 94,
						util:get_stacktrace()}),
		      {stop,
		       {2, lang:get(<<"创建角色失败"/utf8>>), 0, <<>>, <<>>, 0}};
		  {ok, Rid} ->
		      put(role_ids, [{Rid, SrvId} | get(role_ids)]),
		      ip_mgr:inc_reg_idfa(IDFA),
		      ip_mgr:inc_reg_ip(IpBin),
		      ip_mgr:inc_reg_getui_cid(GetuiCid),
		      {reply, {1, <<>>, Rid, SrvId, Name2, Now}}
		end
	  end
    end;
handle(10102, _Data, #conn{pid_object = ObjectPid})
    when ObjectPid =/= undefined ->
    ok;
handle(10102, {Rid, SrvId},
       Conn = #conn{account = Account, ip = Ip,
		    socket = Socket, port = Port, conn_pid = ConnPid})
    when Account /= <<>> ->
    Id = {Rid, SrvId},
    Link = #link{socket = Socket, conn_pid = ConnPid,
		 ip = Ip, port = Port},
    case check_login(Id, Account, sys_env:get(platform), Ip)
	of
      {error, Reason} ->
	  {stop,
	   {0, Reason, date:unixtime(),
	    world_lev:get_world_lev()}};
      {error, ErrCode, Reason} ->
	  {stop,
	   {ErrCode, Reason, date:unixtime(),
	    world_lev:get_world_lev()}};
      {ok} ->
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} -> role_switch(Pid, Link, Conn, {Rid, SrvId});
	    {error, busy} ->
		{reply,
		 {0,
		  lang:get(<<"Đăng nhập không thành công, vui lòng "
			     "thử lại, nếu vẫn không thành công, vui "
			     "lòng liên hệ với GM"/utf8>>),
		  date:unixtime(), world_lev:get_world_lev()}};
	    {error, bad_process} ->
		{reply,
		 {0,
		  lang:get(<<"Đăng nhập không thành công, dữ liệu "
			     "của bạn không bình thường, vui lòng "
			     "thử lại, nếu vẫn không thành công, vui "
			     "lòng liên hệ với GM"/utf8>>),
		  date:unixtime(), world_lev:get_world_lev()}};
	    {error, not_found} -> role_login(Id, Link, Conn);
	    _O ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlogin_rpc137, _,
		   {__Levellogin_rpc137, __Traceslogin_rpc137}}
		      when __Levellogin_rpc137 band 8 /= 0 orelse
			     __Traceslogin_rpc137 /= [] ->
		      lager:do_log(error,
				   [{module, login_rpc}, {function, handle},
				    {line, 137}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("登陆出错,Reason ~w", [_O]), none,
				   4096, 8, __Levellogin_rpc137,
				   __Traceslogin_rpc137, lager_event,
				   __Pidlogin_rpc137);
		  _ -> ok
		end,
		{reply,
		 {0, lang:get(<<"Đăng nhập thất bại"/utf8>>),
		  date:unixtime(), world_lev:get_world_lev()}}
	  end
    end;
handle(10103, _Data, #conn{pid_object = ObjectPid})
    when ObjectPid =/= undefined ->
    ok;
handle(10103, {Rid, SrvId},
       Conn = #conn{account = Account, ip = Ip,
		    socket = Socket, port = Port, conn_pid = ConnPid})
    when Account /= <<>> ->
    Id = {Rid, SrvId},
    Link = #link{socket = Socket, conn_pid = ConnPid,
		 ip = Ip, port = Port},
    case check_login(Id, Account, sys_env:get(platform), Ip)
	of
      {error, Reason} ->
	  {stop,
	   {0, Reason, date:unixtime(),
	    world_lev:get_world_lev()}};
      {error, ErrCode, Reason} ->
	  {stop,
	   {ErrCode, Reason, date:unixtime(),
	    world_lev:get_world_lev()}};
      {ok} ->
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role_reconnect(Pid, Link, Conn, {Rid, SrvId});
	    {error, busy} ->
		{stop,
		 {0,
		  lang:get(<<"Đăng nhập không thành công, vui lòng "
			     "thử lại, nếu vẫn không thành công, vui "
			     "lòng liên hệ với GM"/utf8>>),
		  date:unixtime(), world_lev:get_world_lev()}};
	    {error, bad_process} ->
		{stop,
		 {0,
		  lang:get(<<"Đăng nhập không thành công, dữ liệu "
			     "của bạn không bình thường, vui lòng "
			     "thử lại, nếu vẫn không thành công, vui "
			     "lòng liên hệ với GM"/utf8>>),
		  date:unixtime(), world_lev:get_world_lev()}};
	    {error, not_found} -> role_login(Id, Link, Conn);
	    _O ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlogin_rpc172, _,
		   {__Levellogin_rpc172, __Traceslogin_rpc172}}
		      when __Levellogin_rpc172 band 64 /= 0 orelse
			     __Traceslogin_rpc172 /= [] ->
		      lager:do_log(info,
				   [{module, login_rpc}, {function, handle},
				    {line, 172}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("login:~s pid:~w",
						 [Account, self()]),
				   none, 4096, 64, __Levellogin_rpc172,
				   __Traceslogin_rpc172, lager_event,
				   __Pidlogin_rpc172);
		  _ -> ok
		end,
		{stop,
		 {0, lang:get(<<"Đăng nhập thất bại"/utf8>>),
		  date:unixtime(), world_lev:get_world_lev()}}
	  end
    end;
handle(_Cmd, _Data,
       _Conn = #conn{account = _Account}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlogin_rpc178, _,
       {__Levellogin_rpc178, __Traceslogin_rpc178}}
	  when __Levellogin_rpc178 band 128 /= 0 orelse
		 __Traceslogin_rpc178 /= [] ->
	  lager:do_log(debug,
		       [{module, login_rpc}, {function, handle}, {line, 178},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("_Conn ~w", [_Conn]), none, 4096, 128,
		       __Levellogin_rpc178, __Traceslogin_rpc178, lager_event,
		       __Pidlogin_rpc178);
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
      {__Pidlogin_rpc179, _,
       {__Levellogin_rpc179, __Traceslogin_rpc179}}
	  when __Levellogin_rpc179 band 128 /= 0 orelse
		 __Traceslogin_rpc179 /= [] ->
	  lager:do_log(debug,
		       [{module, login_rpc}, {function, handle}, {line, 179},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("{_Cmd, _Data, Account} ~w",
				     [{_Cmd, _Data, _Account}]),
		       none, 4096, 128, __Levellogin_rpc179,
		       __Traceslogin_rpc179, lager_event, __Pidlogin_rpc179);
      _ -> ok
    end,
    {error, unknown_cmd}.

check_login(Id, Account, Platform, IP) ->
    case lists:member(Id, get(role_ids)) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc186, _,
	     {__Levellogin_rpc186, __Traceslogin_rpc186}}
		when __Levellogin_rpc186 band 8 /= 0 orelse
		       __Traceslogin_rpc186 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, check_login},
			      {line, 186}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~s====Id:~w role_ids:~w",
					   [Account, Id, get(role_ids)]),
			     none, 4096, 8, __Levellogin_rpc186,
			     __Traceslogin_rpc186, lager_event,
			     __Pidlogin_rpc186);
	    _ -> ok
	  end,
	  {error, 2,
	   lang:get(<<"Đăng nhập không thành công, id vai trò "
		      "không tồn tại"/utf8>>)};
      true ->
	  conn_login_rpc:check_can_login(Account, Platform, IP)
    end.

get_srv_id() ->
    case get(enter_srv_id) of
      SrvId when SrvId =/= <<>> ->
	  case sys_lib:is_local(SrvId) of
	    true -> SrvId;
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlogin_rpc199, _,
		   {__Levellogin_rpc199, __Traceslogin_rpc199}}
		      when __Levellogin_rpc199 band 8 /= 0 orelse
			     __Traceslogin_rpc199 /= [] ->
		      lager:do_log(error,
				   [{module, login_rpc}, {function, get_srv_id},
				    {line, 199}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("客户端传过来的enter_srv_id不是本服的srv_id, enter_srv_id ~s",
						 [SrvId]),
				   none, 4096, 8, __Levellogin_rpc199,
				   __Traceslogin_rpc199, lager_event,
				   __Pidlogin_rpc199);
		  _ -> ok
		end,
		sys_lib:srv_id()
	  end;
      _ -> sys_lib:srv_id()
    end.

login_args() ->
    [{device_id, get(device_id)},
     {getui_cid, get(getui_cid)}, {idfa, get(idfa)},
     {channel, get(channel)},
     {device_type, get(device_type)},
     {os_name, get(os_name)}, {app_name, get(app_name)},
     {package_name, get(package_name)},
     {package_version, get(package_version)},
     {os_ver, get(os_ver)},
     {carrier_name, get(carrier_name)},
     {net_type, get(net_type)},
     {resolution, get(resolution)}, {now_ver, get(now_ver)},
     {srv_lock_ver, get(srv_lock_ver)},
     {emulator, get(emulator)},
     {login_auth_fail, get(login_auth_fail)}].

update_login_args(Role, Args, Flag) ->
    NRole = Role#role{device_id =
			  find_not_null(device_id, Args, Role#role.device_id),
		      getui_cid =
			  find_not_null(getui_cid, Args, Role#role.getui_cid),
		      device_type =
			  find_not_null(device_type, Args,
					Role#role.device_type),
		      idfa = find_not_null(idfa, Args, Role#role.idfa),
		      channel =
			  find_not_null(channel, Args, Role#role.channel),
		      os_name =
			  find_not_null(os_name, Args, Role#role.os_name),
		      app_name =
			  find_not_null(app_name, Args, Role#role.app_name),
		      package_name =
			  find_not_null(package_name, Args,
					Role#role.package_name),
		      package_ver =
			  find_not_null(package_version, Args,
					Role#role.package_ver),
		      os_ver = find_not_null(os_ver, Args, Role#role.os_ver),
		      carrier_name =
			  find_not_null(carrier_name, Args,
					Role#role.carrier_name),
		      net_type =
			  find_not_null(net_type, Args, Role#role.net_type),
		      resolution =
			  find_not_null(resolution, Args,
					Role#role.resolution)},
    put(now_ver, find_not_null(now_ver, Args, <<>>)),
    put(srv_lock_ver,
	find_not_null(srv_lock_ver, Args, <<>>)),
    put(emulator, find_not_null(emulator, Args, <<>>)),
    put(login_auth_fail,
	find_not_null(login_auth_fail, Args, undefined)),
    getui_mgr:sync_cache(NRole),
    case Flag of
      true ->
	  role_num_online:switch_channel_online(Role#role.channel,
						NRole#role.channel);
      _ -> skip
    end,
    Now = date:unixtime(),
    NRole1 = case get(emulator) of
	       <<"true">> ->
		   case var:get_var(NRole, other, 3082, 0) of
		     OverTime when OverTime > Now -> NRole;
		     _ -> var:set_var(NRole, other, 3082, Now + 86400 * 7)
		   end;
	       _ -> NRole
	     end,
    NRole1.

find_not_null(Key, L, DefVal) ->
    case lists:keyfind(Key, 1, L) of
      {Key, Val} when Val =/= <<>> -> Val;
      _ -> DefVal
    end.

register_conn(Conn = #conn{account = Account,
			   ip = {P1, P2, P3, P4}, port = Port}) ->
    erlang:register(list_to_atom(binary_to_list(unicode:characters_to_binary(lists:concat(["conn_",
											   binary_to_list(Account),
											   "_",
											   P1,
											   "_",
											   P2,
											   "_",
											   P3,
											   "_",
											   P4,
											   "_",
											   Port])))),
		    self()),
    Conn.

role_login({Rid, SrvId}, Link,
	   Conn = #conn{account = Account, ip = IP}) ->
    {ProvinceName, CityName} = ip_mgr:ip_to_address(IP),
    Args = [{province_name, ProvinceName},
	    {city_name, CityName}
	    | login_args()],
    case role:start(Rid, SrvId, Account, Link, Args) of
      {ok, Pid} ->
	  register_conn(Conn),
	  {reply,
	   {1, <<>>, date:unixtime(), world_lev:get_world_lev()},
	   Conn#conn{object = role, pid_object = Pid}};
      {error, {data_lock, Time}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc269, _,
	     {__Levellogin_rpc269, __Traceslogin_rpc269}}
		when __Levellogin_rpc269 band 64 /= 0 orelse
		       __Traceslogin_rpc269 /= [] ->
		lager:do_log(info,
			     [{module, login_rpc}, {function, role_login},
			      {line, 269}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Dữ liệu nhân vật bị khóa và không thể "
					   "đăng nhập~w:~s",
					   [Rid, SrvId]),
			     none, 4096, 64, __Levellogin_rpc269,
			     __Traceslogin_rpc269, lager_event,
			     __Pidlogin_rpc269);
	    _ -> ok
	  end,
	  Min = Time div 60,
	  Sev = Time rem 60,
	  {stop,
	   {0,
	    util:format_ex(lang:get(<<"Cảnh báo: Lâu đài của bạn đang bị tấn "
				      "công! Hãy đợi, bạn sẽ có thể trở lại "
				      "lâu đài của mình sau! Thời gian chờ "
				      "ước tính：~w分钟~w秒"/utf8>>),
			   [Min, Sev]),
	    date:unixtime(), world_lev:get_world_lev()}};
      {error, {already_started, _}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc275, _,
	     {__Levellogin_rpc275, __Traceslogin_rpc275}}
		when __Levellogin_rpc275 band 8 /= 0 orelse
		       __Traceslogin_rpc275 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, role_login},
			      {line, 275}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Nhân vật đang trực tuyến~w:~s",
					   [Rid, SrvId]),
			     none, 4096, 8, __Levellogin_rpc275,
			     __Traceslogin_rpc275, lager_event,
			     __Pidlogin_rpc275);
	    _ -> ok
	  end,
	  {reply,
	   {0,
	    lang:get(<<"Vai trò trực tuyến, đăng nhập không "
		       "thành công"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}};
      {error, load_failure} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc279, _,
	     {__Levellogin_rpc279, __Traceslogin_rpc279}}
		when __Levellogin_rpc279 band 8 /= 0 orelse
		       __Traceslogin_rpc279 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, role_login},
			      {line, 279}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Đăng nhập thất bại~w:~s",
					   [Rid, SrvId]),
			     none, 4096, 8, __Levellogin_rpc279,
			     __Traceslogin_rpc279, lager_event,
			     __Pidlogin_rpc279);
	    _ -> ok
	  end,
	  {reply,
	   {0,
	    lang:get(<<"Đã xảy ra ngoại lệ khi tải dữ liệu ký tự"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}};
      {error, interdict} ->
	  {stop,
	   {0,
	    lang:get(<<"Thân mến, tài khoản của bạn có thể không "
		       "bình thường, vui lòng liên hệ với GM "
		       "~"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}};
      {error, bad_account} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc285, _,
	     {__Levellogin_rpc285, __Traceslogin_rpc285}}
		when __Levellogin_rpc285 band 8 /= 0 orelse
		       __Traceslogin_rpc285 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, role_login},
			      {line, 285}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Dữ liệu vai trò[~w:~s]，Không phù hợp "
					   "với tài khoản hiện tại[~s]",
					   [Rid, SrvId, Account]),
			     none, 4096, 8, __Levellogin_rpc285,
			     __Traceslogin_rpc285, lager_event,
			     __Pidlogin_rpc285);
	    _ -> ok
	  end,
	  {stop,
	   {0,
	    lang:get(<<"Tài khoản hiện tại không bình thường"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}};
      {error, black_ip} ->
	  {stop,
	   {0,
	    lang:get(<<"Tài khoản của bạn đã bị khóa, vui lòng "
		       "liên hệ với GM !!!"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}};
      {error, _Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc291, _,
	     {__Levellogin_rpc291, __Traceslogin_rpc291}}
		when __Levellogin_rpc291 band 8 /= 0 orelse
		       __Traceslogin_rpc291 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, role_login},
			      {line, 291}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Đăng nhập thất bại~w:~s Reason:~w",
					   [Rid, SrvId, _Reason]),
			     none, 4096, 8, __Levellogin_rpc291,
			     __Traceslogin_rpc291, lager_event,
			     __Pidlogin_rpc291);
	    _ -> ok
	  end,
	  {reply,
	   {0,
	    lang:get(<<"Đã xảy ra ngoại lệ khi tải dữ liệu ký tự"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}}
    end.

role_switch(Pid, Link, Conn, RoleId) ->
    Args = login_args(),
    case catch role:apply(sync, Pid,
			  {fun apply_role_switch/3, [Link, Args]})
	of
      ok ->
	  register_conn(Conn),
	  {reply,
	   {1, <<>>, date:unixtime(), world_lev:get_world_lev()},
	   Conn#conn{object = role, pid_object = Pid}};
      {false, Reason} ->
	  {stop,
	   {0, Reason, date:unixtime(),
	    world_lev:get_world_lev()}};
      {error, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc305, _,
	     {__Levellogin_rpc305, __Traceslogin_rpc305}}
		when __Levellogin_rpc305 band 8 /= 0 orelse
		       __Traceslogin_rpc305 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, role_switch},
			      {line, 305}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Đăng nhập lại vai trò không thành công! "
					   "Reason ~w",
					   [Reason]),
			     none, 4096, 8, __Levellogin_rpc305,
			     __Traceslogin_rpc305, lager_event,
			     __Pidlogin_rpc305);
	    _ -> ok
	  end,
	  {stop,
	   {0,
	    lang:get(<<"Dữ liệu đã hết hạn, vui lòng đăng nhập "
		       "lại!"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}};
      _Reason ->
	  acc_login_err(RoleId, Pid,
			<<"Đăng nhập thất bại"/utf8>>,
			<<"Đăng nhập vai trò không thành công"/utf8>>),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc309, _,
	     {__Levellogin_rpc309, __Traceslogin_rpc309}}
		when __Levellogin_rpc309 band 8 /= 0 orelse
		       __Traceslogin_rpc309 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, role_switch},
			      {line, 309}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Đăng nhập lại vai trò không thành công "
					   "1！[_Reason ~w]",
					   [_Reason]),
			     none, 4096, 8, __Levellogin_rpc309,
			     __Traceslogin_rpc309, lager_event,
			     __Pidlogin_rpc309);
	    _ -> ok
	  end,
	  {stop,
	   {0, lang:get(<<"Kết nối lại không thành công 1"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}}
    end.

apply_role_switch(Role = #role{link =
				   #link{conn_pid = OldConnPid, ip = _IP},
			       misc = Misc, interdict_time = InterdictTime},
		  Link = #link{conn_pid = ConnPid, ip = _NewIP}, Args) ->
    Now = date:unixtime(),
    Channel = list_util:keyfind(channel, Args, <<>>),
    case InterdictTime > Now andalso
	   Channel =/= <<"release2">> andalso
	     Channel =/= <<"demo">>
	of
      true ->
	  {ok,
	   {false,
	    lang:get(<<"Tài khoản của bạn đã bị khóa, vui lòng "
		       "liên hệ với GM !!!"/utf8>>)}};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc321, _,
	     {__Levellogin_rpc321, __Traceslogin_rpc321}}
		when __Levellogin_rpc321 band 128 /= 0 orelse
		       __Traceslogin_rpc321 /= [] ->
		lager:do_log(debug,
			     [{module, login_rpc},
			      {function, apply_role_switch}, {line, 321},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]切换账号==~w",
					   [Role#role.name, ConnPid]),
			     none, 4096, 128, __Levellogin_rpc321,
			     __Traceslogin_rpc321, lager_event,
			     __Pidlogin_rpc321);
	    _ -> ok
	  end,
	  erlang:unlink(OldConnPid),
	  erlang:link(ConnPid),
	  put('@conn_pid', ConnPid),
	  role:put_dict('@login_type', role_switch),
	  combat:quit_watch_combat(Role),
	  Role1 = combat_replay_server:disconnect(Role),
	  Role2 = update_login_args(Role1#role{is_online = 1,
					       link = Link, is_ready = 0,
					       combat_pid = 0,
					       misc =
						   Misc#role_misc{combat_watch_pid
								      = 0}},
				    Args, true),
	  util:unset_timer(delay_stop),
	  role_query:sync_cache(Role2),
	  role_query:sync_index(Role2),
	  spawn(fun () ->
			sys_conn:pack_send(OldConnPid, 10310,
					   {1,
					    lang:get(<<"Nhân vật hiện tại đã đăng nhập ở nơi "
						       "khác và bạn buộc phải ngoại tuyến。"/utf8>>)}),
			util:sleep(500),
			erlang:exit(OldConnPid, kill)
		end),
	  role_group:join(all, Role2),
	  {ok, NRole} = combat_loop:enter(Role2, 0),
	  {ok, ok, NRole}
    end.

role_reconnect(Pid, Link, Conn, RoleId) ->
    Args = login_args(),
    case catch role:apply(sync, Pid,
			  {fun apply_role_reconnect/3, [Link, Args]})
	of
      ok ->
	  {reply,
	   {1, <<>>, date:unixtime(), world_lev:get_world_lev()},
	   Conn#conn{object = role, pid_object = Pid}};
      {error, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc350, _,
	     {__Levellogin_rpc350, __Traceslogin_rpc350}}
		when __Levellogin_rpc350 band 8 /= 0 orelse
		       __Traceslogin_rpc350 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, role_reconnect},
			      {line, 350}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色重连失败! Reason ~w", [Reason]), none,
			     4096, 8, __Levellogin_rpc350, __Traceslogin_rpc350,
			     lager_event, __Pidlogin_rpc350);
	    _ -> ok
	  end,
	  {stop,
	   {0,
	    lang:get(<<"Dữ liệu đã hết hạn, vui lòng đăng nhập "
		       "lại!"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}};
      _Reason ->
	  acc_login_err(RoleId, Pid, <<"重连失败"/utf8>>,
			<<"角色重连失败"/utf8>>),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc354, _,
	     {__Levellogin_rpc354, __Traceslogin_rpc354}}
		when __Levellogin_rpc354 band 8 /= 0 orelse
		       __Traceslogin_rpc354 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, role_reconnect},
			      {line, 354}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色重连失败1！[_Reason ~w]", [_Reason]),
			     none, 4096, 8, __Levellogin_rpc354,
			     __Traceslogin_rpc354, lager_event,
			     __Pidlogin_rpc354);
	    _ -> ok
	  end,
	  {stop,
	   {0, lang:get(<<"Kết nối lại không thành công 1"/utf8>>),
	    date:unixtime(), world_lev:get_world_lev()}}
    end.

apply_role_reconnect(Role = #role{link =
				      #link{conn_pid = OldConnPid, ip = _IP}},
		     Link = #link{conn_pid = ConnPid, ip = _NewIP}, Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlogin_rpc358, _,
       {__Levellogin_rpc358, __Traceslogin_rpc358}}
	  when __Levellogin_rpc358 band 128 /= 0 orelse
		 __Traceslogin_rpc358 /= [] ->
	  lager:do_log(debug,
		       [{module, login_rpc}, {function, apply_role_reconnect},
			{line, 358}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts] Kết nối lại sau khi ngắt kết "
				     "nối:~w",
				     [Role#role.name, ConnPid]),
		       none, 4096, 128, __Levellogin_rpc358,
		       __Traceslogin_rpc358, lager_event, __Pidlogin_rpc358);
      _ -> ok
    end,
    erlang:unlink(OldConnPid),
    erlang:link(ConnPid),
    put('@conn_pid', ConnPid),
    role:put_dict('@login_type', reconnect),
    Role2 = update_login_args(Role#role{is_online = 1,
					link = Link, is_ready = 0},
			      Args, true),
    util:unset_timer(delay_stop),
    role_query:sync_cache(Role2),
    role_query:sync_index(Role2),
    spawn(fun () ->
		  sys_conn:pack_send(OldConnPid, 10310,
				     {1,
				      lang:get(<<"Nhân vật hiện tại đã được đăng nhập "
						 "ở nơi khác và bạn buộc phải chuyển sang "
						 "chế độ ngoại tuyến."/utf8>>)}),
		  util:sleep(500),
		  erlang:exit(OldConnPid, kill)
	  end),
    role_group:join(all, Role2),
    {ok, ok, Role2}.

acc_login_err(RoleId, RolePid, Type, Msg) ->
    case catch ets:update_counter(role_id_index, RoleId,
				  {#id_index.login_err, 1})
	of
      3 ->
	  server_monitor:error_log({2, Type, Msg, login_rpc, 380,
				    util:get_stacktrace()}),
	  catch case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlogin_rpc381, _,
		   {__Levellogin_rpc381, __Traceslogin_rpc381}}
		      when __Levellogin_rpc381 band 8 /= 0 orelse
			     __Traceslogin_rpc381 /= [] ->
		      lager:do_log(error,
				   [{module, login_rpc},
				    {function, acc_login_err}, {line, 381},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("error==>>~w",
						 [recon:info(RolePid)]),
				   none, 4096, 8, __Levellogin_rpc381,
				   __Traceslogin_rpc381, lager_event,
				   __Pidlogin_rpc381);
		  _ -> ok
		end;
      _ -> skip
    end.

check_channel_create(<<"release">>) ->
    P = sys_env:get(platform),
    lists:member(P, ["release", "local", "demo", "dev"]);
check_channel_create(_) -> true.

auth_info(L) ->
    case check_icebird(get(icebird_args)) of
      true ->
	  WhiteIp = get(white_ip),
	  case sys_env:get(platform) of
	    "verifyios" -> true;
	    "release2" -> true;
	    "dev" -> true;
	    "local" -> true;
	    "mix" -> true;
	    _ when WhiteIp =:= true -> true;
	    _ -> do_auth_info(L)
	  end;
      Ret -> Ret
    end.

do_auth_info([]) -> true;
do_auth_info([{idfa, <<"mac">>} | _]) -> true;
do_auth_info([{idfa, <<"robot">>} | _]) -> true;
do_auth_info([{idfa, <<"windows">>} | _]) -> true;
do_auth_info([{idfa, <<"error">>} | T]) ->
    do_auth_info(T);
do_auth_info([{idfa, Idfa} | T]) ->
    IsEmulator = get(emulator),
    Channel = get(channel),
    Max = case ip_mgr:device_black_type(Idfa) of
	    _ when IsEmulator =:= <<"true">> -> 1;
	    _ when Channel =:= <<"16_20">> -> 1;
	    _ when Channel =:= <<"syios_djsdmm">> -> 1;
	    1 -> 1;
	    2 -> 2;
	    _ -> 3
	  end,
    case ip_mgr:reg_idfa(Idfa) < Max of
      true -> do_auth_info(T);
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc427, _,
	     {__Levellogin_rpc427, __Traceslogin_rpc427}}
		when __Levellogin_rpc427 band 8 /= 0 orelse
		       __Traceslogin_rpc427 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, do_auth_info},
			      {line, 427}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Số lượng vai trò sẽ được tạo bởi số "
					   "thiết bị đã đạt đến giới hạn trên:~s",
					   [Idfa]),
			     none, 4096, 8, __Levellogin_rpc427,
			     __Traceslogin_rpc427, lager_event,
			     __Pidlogin_rpc427);
	    _ -> ok
	  end,
	  {false, lang:get(<<"该包不能在该区创建号"/utf8>>)}
    end;
do_auth_info([{ip, Ip} | T]) ->
    Max = case get(channel) of
	    <<"16_20">> -> 3;
	    <<"syios_djsdmm">> -> 1;
	    _ -> 10
	  end,
    case ip_mgr:reg_ip(Ip) < Max of
      true -> do_auth_info(T);
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc439, _,
	     {__Levellogin_rpc439, __Traceslogin_rpc439}}
		when __Levellogin_rpc439 band 8 /= 0 orelse
		       __Traceslogin_rpc439 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, do_auth_info},
			      {line, 439}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("IP申请创建角色数量达上限:~s php_ip:~s",
					   [Ip, get(cli_ip)]),
			     none, 4096, 8, __Levellogin_rpc439,
			     __Traceslogin_rpc439, lager_event,
			     __Pidlogin_rpc439);
	    _ -> ok
	  end,
	  {false, lang:get(<<"该包不能在该区创建号2"/utf8>>)}
    end;
do_auth_info([{getui_cid, <<>>} | T]) ->
    do_auth_info(T);
do_auth_info([{getui_cid, Cid} | T]) ->
    case ip_mgr:reg_getui_cid(Cid) < 6 of
      true -> do_auth_info(T);
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlogin_rpc448, _,
	     {__Levellogin_rpc448, __Traceslogin_rpc448}}
		when __Levellogin_rpc448 band 8 /= 0 orelse
		       __Traceslogin_rpc448 /= [] ->
		lager:do_log(error,
			     [{module, login_rpc}, {function, do_auth_info},
			      {line, 448}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("getui_cid申请创建角色数量达上限:~s", [Cid]),
			     none, 4096, 8, __Levellogin_rpc448,
			     __Traceslogin_rpc448, lager_event,
			     __Pidlogin_rpc448);
	    _ -> ok
	  end,
	  {false, lang:get(<<"该包不能在该区创建号3"/utf8>>)}
    end.

check_icebird(_) -> true.


