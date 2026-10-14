-file("src/mod/misc/misc_rpc.erl", 1).

-module(misc_rpc).

-lager_records([{voting,
		 [ver, platform_zone, id, start_time, end_time,
		  board_time, is_email, finish_id, voting_list]},
		{voting_detail, [ver, id, role_voting]},
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
		{activity, [id, status, name, data, ext_args]},
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

-export([handle/3, send_10997/1, send_10996/1,
	 send_10995/1]).

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

-file("src/mod/misc/misc_rpc.erl", 8).

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

-file("src/mod/misc/misc_rpc.erl", 9).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/misc/misc_rpc.erl", 10).

-file("inc/pos.hrl", 1).

-record(pos_history,
	{map_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(pos,
	{ver = 2, srv_id = <<>>  :: bitstring(),
	 map_id = {0, <<>>}, map_pid = 0, map_bid = 0,
	 map_grid_pid = 0, last, hidden = 0, x = 0, y = 0,
	 dir = 5}).

-file("src/mod/misc/misc_rpc.erl", 11).

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

-file("src/mod/misc/misc_rpc.erl", 12).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/misc/misc_rpc.erl", 13).

-file("inc/voting.hrl", 1).

-record(voting_detail,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 role_voting = []  :: list()}).

-record(voting,
	{ver = 1  :: pos_integer(),
	 platform_zone = {<<>>, 0}  :: tuple(),
	 id = 0  :: pos_integer(),
	 start_time = 0  :: pos_integer(),
	 end_time = 0  :: pos_integer(),
	 board_time = 0  :: pos_integer(),
	 is_email = 0  :: pos_integer(),
	 finish_id = []  :: list(),
	 voting_list = []  :: list()}).

-file("src/mod/misc/misc_rpc.erl", 14).

handle(10900, {Rid, SrvId, _Hour, _Msg},
       #role{id = {Rid, SrvId}}) ->
    {reply, {0, lang:get(<<"别对自己进行该操作"/utf8>>)}};
handle(10900, {_Rid, _SrvId, _Hour, _Msg}, _Role) ->
    {reply, {0, lang:get(<<"不是GM，非法操作"/utf8>>)}};
handle(10901, {Rid, SrvId, _Hour, _Msg},
       #role{id = {Rid, SrvId}}) ->
    {reply, {0, lang:get(<<"别对自己进行该操作"/utf8>>)}};
handle(10901, {_Rid, _SrvId, _Hour, _Msg}, _Role) ->
    {reply, {0, lang:get(<<"不是GM，非法操作"/utf8>>)}};
handle(10902, {Rid, SrvId, _Msg},
       #role{id = {Rid, SrvId}}) ->
    {reply, {0, lang:get(<<"别对自己进行该操作"/utf8>>)}};
handle(10902, {_Rid, _SrvId, _Msg}, _Role) ->
    {reply, {0, lang:get(<<"不是GM，非法操作"/utf8>>)}};
handle(10905, {}, _Role) ->
    {reply, {world_lev:get_world_lev()}};
handle(10906, {}, _Role) ->
    {reply, {date:open_srv_day()}};
handle(10907, {}, _Role) ->
    {reply,
     {util:int_bool(sys_env:get(sys_ban_rename, false))}};
handle(10922, {}, Role) ->
    activity_global:send_all_activity(Role), {ok};
handle(10923, {Id}, _Role) ->
    case activity_global:get_activity(Id) of
      undefined -> {reply, {Id, 0, []}};
      AC ->
	  {reply,
	   {Id, AC#activity.status,
	    activity_global:activity_data(AC, date:unixtime())}}
    end;
handle(10924, {}, Role) ->
    activity_self:send_all_activity(Role), {ok};
handle(10925, {Id}, _Role) ->
    case activity_self:get_activity(Id) of
      {error, undefined} -> {reply, {Id, 0, [], []}};
      {ok, AC} ->
	  {reply,
	   {Id, AC#activity.status,
	    activity_self:activity_data(AC, date:unixtime()), []}}
    end;
handle(10926, {}, Role) ->
    misc:push_time_reward(Role), ok;
handle(10927, {Id}, Role) ->
    case misc:get_time_reward(Role, Id) of
      {false, Reason} -> {reply, {0, Reason, 0}};
      {ok, NRole, Time} -> {reply, {1, <<>>, Time}, NRole}
    end;
handle(10928, {}, _Role = #role{account = Account}) ->
    case ip_mgr:is_white_acc(Account) of
      true -> sys_conn:pack_send(10928, {1});
      _ -> sys_conn:pack_send(10928, {0})
    end,
    ok;
handle(10929, {}, Role) ->
    {ok, Role1} = holiday_lucky_dog_lib:fire(Role,
					     evt_share_game, 0),
    {reply, {1, <<>>}, Role1};
handle(10930, {}, _Role) ->
    OpenTimeStamp = game_lib:server_open_time(ms),
    {reply, {1, OpenTimeStamp}};
handle(10931, {}, #role{account = Account}) ->
    {reply, {qrcode_data:acc(Account)}};
handle(10945, {Id}, Role) ->
    case media_card:exchange(Role, Id) of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} ->
	  {reply, {1, lang:get(<<"领取成功"/utf8>>)}, NRole}
    end;
handle(10946, {}, Role) ->
    media_card:is_finish(Role), ok;
handle(10947, {PackageId, NotifyUrl}, Role) ->
    {reply, misc:get_pay_url(Role, PackageId, NotifyUrl)};
handle(10950, {}, Role) ->
    notice_board:push(Role, all), ok;
handle(10952, {Id}, Role) ->
    NRole = notice_board:read(Role, Id),
    {reply, {1, <<>>, Id}, NRole};
handle(10956, {Type, Id}, Role) ->
    L = var:get_var(Role, acc, 3039, []),
    NRole = var:set_var(Role, acc, 3039,
			lists:delete({Type, Id}, L)),
    {ok, NRole};
handle(10958, {Combat_Msg},
       #role{name = Name, ui_combat_type = UiCombatType,
	     combat_pid = CombatPid,
	     combat_type_list = CombatTypeList}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmisc_rpc145, _,
       {__Levelmisc_rpc145, __Tracesmisc_rpc145}}
	  when __Levelmisc_rpc145 band 64 /= 0 orelse
		 __Tracesmisc_rpc145 /= [] ->
	  lager:do_log(info,
		       [{module, misc_rpc}, {function, handle}, {line, 145},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("当前UI战斗类型:~w,角色名：~ts,战斗进程pid:~w,战斗类型:~w,战斗信息：~ts",
				     [UiCombatType, Name, CombatPid,
				      CombatTypeList, Combat_Msg]),
		       none, 4096, 64, __Levelmisc_rpc145, __Tracesmisc_rpc145,
		       lager_event, __Pidmisc_rpc145);
      _ -> ok
    end,
    {ok};
handle(10960, {}, Role) ->
    role_auth_award:info(Role), ok;
handle(10961, {}, Role) ->
    case role_misc:check_cd(rpc_10961, 3000) of
      false -> {reply, {0, lang:get(<<"操作过于频繁"/utf8>>)}};
      _ ->
	  case role_auth_award:get_award(Role) of
	    {false, Reason} -> {reply, {0, Reason}};
	    {false, Msg, NewRole} -> {reply, {0, Msg}, NewRole};
	    {ok, NRole} ->
		{reply, {1, lang:get(<<"领取成功"/utf8>>)}, NRole}
	  end
    end;
handle(10971, {HolidayBid}, Role) ->
    case misc:get_holiday_token(Role, HolidayBid) of
      {false, Reason} -> {reply, {0, Reason, <<>>}};
      {ok, NRole, Token} -> {reply, {1, <<>>, Token}, NRole}
    end;
handle(10985, {}, Role) ->
    red_point:push(Role, 10985), ok;
handle(10986, {Id}, Role) ->
    NewRole = red_point:point(Role, Id), {ok, NewRole};
handle(10987, {}, Role) ->
    subscriber:push(Role, 10987), ok;
handle(10988, {}, Role) ->
    NewRole = subscriber:delete_point(Role), {ok, NewRole};
handle(10989, {}, Role) ->
    subscriber:push(Role, 10989), ok;
handle(10990, {Code, Cmd},
       Role = #role{misc = RoleMisc}) ->
    case captcha:auth(Cmd, Code) of
      ok when Code =:= 0 -> ok;
      ok -> {reply, {1, Cmd, <<>>}};
      false -> {reply, {99, Cmd, <<>>}};
      {ok, {monitor, _Data}} ->
	  notice:alert(lang:get(<<"验证成功"/utf8>>)),
	  {reply, {1, Cmd, <<>>},
	   Role#role{misc = RoleMisc#role_misc{need_captcha = 0}}};
      {ok, {rpc, Data}} ->
	  role:redirect(self(), Cmd, Data),
	  put({captcha_auth, Cmd, Data}, true),
	  {reply, {1, Cmd, <<>>}};
      {ok, {cb_fun, FunInfo}} ->
	  sys_conn:pack_send(10990, {1, Cmd, <<>>}),
	  Rtn = case FunInfo of
		  {undefined, F, A} -> erlang:apply(F, [Role | A]);
		  {M, F, A} -> erlang:apply(M, F, [Role | A])
		end,
	  case Rtn of
	    ok -> ok;
	    {ok, NewRole} -> {ok, NewRole};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmisc_rpc229, _,
		   {__Levelmisc_rpc229, __Tracesmisc_rpc229}}
		      when __Levelmisc_rpc229 band 8 /= 0 orelse
			     __Tracesmisc_rpc229 /= [] ->
		      lager:do_log(error,
				   [{module, misc_rpc}, {function, handle},
				    {line, 229}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~s]处理验证码回调时发生异常，无效的返回值: ~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelmisc_rpc229,
				   __Tracesmisc_rpc229, lager_event,
				   __Pidmisc_rpc229);
		  _ -> ok
		end,
		ok
	  end;
      {refresh, ImgType, ImgBin} ->
	  {reply, {ImgType, Cmd, ImgBin}};
      {false, ImgType, ImgBin} ->
	  notice:alert(lang:get(<<"验证码错误"/utf8>>)),
	  {reply, {ImgType, Cmd, ImgBin}}
    end;
handle(10991, {}, Role) ->
    case voting_mgr:push_status(Role) of
      {ok, Status, IsVote, Flag, LastTime} ->
	  {reply, {Status, IsVote, Flag, LastTime}};
      _ -> {reply, {3, 0, 0, 0}}
    end;
handle(10992, {}, _Role) ->
    case voting_mgr:push_result() of
      {ok, AgreePoints, DisagreePoints, Id} ->
	  {reply, {1, <<>>, AgreePoints, DisagreePoints, Id}};
      {false, Reason} -> {reply, {0, Reason, 0, 0, 0}}
    end;
handle(10993, {Flag}, Role) ->
    case voting_mgr:vote(Role, Flag) of
      ok -> {reply, {1, lang:get(<<"投票成功"/utf8>>)}};
      {false, Reason} -> {reply, {0, Reason}};
      _ -> {reply, {0, lang:get(<<"投票失败"/utf8>>)}}
    end;
handle(10995, {}, Role) -> send_10995(Role), {ok};
handle(10997, {}, _Role) -> send_10997(_Role), {ok};
handle(10999, {Msg}, Role) ->
    log:save(log_cli_error, {Role, Msg}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmisc_rpc281, _,
       {__Levelmisc_rpc281, __Tracesmisc_rpc281}}
	  when __Levelmisc_rpc281 band 64 /= 0 orelse
		 __Tracesmisc_rpc281 /= [] ->
	  lager:do_log(info,
		       [{module, misc_rpc}, {function, handle}, {line, 281},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]客户端错误提示信息 lua_error:~ts",
				     [Role#role.name, Msg]),
		       none, 4096, 64, __Levelmisc_rpc281, __Tracesmisc_rpc281,
		       lager_event, __Pidmisc_rpc281);
      _ -> ok
    end,
    {ok};
handle(16800, {Idx, Val, Str}, Role) ->
    case notice_below:reply(Role, Idx, Val, Str) of
      {ok, NRole} -> {ok, NRole};
      _ -> ok
    end;
handle(16801, _, Role) -> role_buff:push(Role), ok;
handle(_Cmd, _Data, _Role) -> {error, unknown_cmd}.

send_10997(_Role) ->
    Flag = case game_lib:is_test() of
	     true -> 1;
	     _ -> 0
	   end,
    role:pack_send(10997, {Flag}),
    ok.

send_10996(_Role) ->
    Data = cli_ver_data_new:get_data(),
    role:pack_send(10996, {Data}),
    ok.

send_10995(_Role) ->
    MainSrvId = sys_env:get(server_id),
    Full = sys_lib:srv_full_id(),
    role:pack_send(10995, {MainSrvId, Full}),
    ok.


