-file("src/mod/holiday/holiday_misc.erl", 1).

-module(holiday_misc).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]}]).

-export([push_download_info/1, download_reward/1,
	 push_bind_phone_info/1, bind_phone_reward/3,
	 wechat_reward/1, get_wechat_reward/1]).

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

-file("src/mod/holiday/holiday_misc.erl", 15).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/mod/holiday/holiday_misc.erl", 16).

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

-file("src/mod/holiday/holiday_misc.erl", 17).

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

-file("src/mod/holiday/holiday_misc.erl", 18).

-file("inc/gain.hrl", 1).

-record(gain,
	{label  :: atom(), val  :: term(),
	 msg = <<>>  :: bitstring(), flag  :: atom(),
	 reason  :: atom(), ext = 0  :: term(),
	 notice = 0  :: 0..1,
	 move_to = 0  :: non_neg_integer()}).

-record(loss,
	{label  :: atom(), val  :: term(),
	 own_val = 0  :: term(), msg = <<>>  :: bitstring(),
	 flag  :: atom(), reason  :: atom(),
	 ext = 0  :: term()}).

-record(gain_loss_opts,
	{title = <<>>, return_gl = [], is_continue = false,
	 order = loss  :: gain | loss,
	 gain_tag = <<>>  :: binary(),
	 loss_tag = <<>>  :: binary(),
	 split_str = <<"，"/utf8>>  :: binary(),
	 split_op_str = <<"，"/utf8>>  :: binary(),
	 type = 2  :: non_neg_integer(),
	 is_auto_buy = 0  :: 0..1,
	 need_notify_fail_item = false  :: true | false,
	 log_name = <<"市场"/utf8>>  :: true | false}).

-file("src/mod/holiday/holiday_misc.erl", 19).

-file("inc/log.hrl", 1).

-file("src/mod/holiday/holiday_misc.erl", 20).

-spec push_download_info(#role{}) -> ok.

push_download_info(Role) ->
    Status = var:get_var(Role, other, 3007, 0),
    Award = holiday_role_data:get_const(award),
    sys_conn:pack_send(16630, {Status, Award}),
    ok.

-spec download_reward(#role{}) -> {false, bitstring()} |
				  {ok, #role{}}.

download_reward(Role) ->
    Award = holiday_role_data:get_const(award),
    case var:get_var(Role, other, 3007, 0) of
      0 ->
	  GL = format:val_to_gain(Award, holiday_award),
	  case role_gain:do_notice(Role, GL,
				   #gain_loss_opts{type = 2})
	      of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role2} ->
		NewRole = var:set_var(Role2, other, 3007, 1),
		log:log_gain(GL, Role, NewRole, <<"边玩边下"/utf8>>,
			     util:fbin("领奖励", [])),
		{ok, NewRole}
	  end;
      _ -> {false, lang:get(<<"无法重复领取"/utf8>>)}
    end.

-spec push_bind_phone_info(#role{}) -> ok.

push_bind_phone_info(Role = #role{platform = Platform,
				  account = Accout}) ->
    Status = case var:get_var(Role, other, 3010, 0) of
	       0 ->
		   case Platform =:= <<"9377ios">> of
		     true ->
			 Flag = ip_mgr:is_white_acc(Accout),
			 util:if_true(Flag =:= true, 0, 1);
		     _ -> 0
		   end;
	       _ -> 1
	     end,
    Award = holiday_role_data:get_const(bind_phone_items),
    sys_conn:pack_send(16635, {Status, Award}),
    ok.

-spec bind_phone_reward(#role{}, binary(),
			binary()) -> ok | {false, bitstring()} | {ok, #role{}}.

bind_phone_reward(Role = #role{platform = <<"icebird">>,
			       account = <<"bingniao_", UserId/binary>>},
		  AppId, AccessToken) ->
    Now = date:unixtime(),
    case var:get_var(Role, other, 3010, 0) of
      0 ->
	  Sign = util:md5(lists:concat(["time=", Now,
					"5687d666f2eb1c22aac9c5e07cbaf173"])),
	  Url = "http://m.xiaotengyouxi.com/api/checkPhone",
	  Body =
	      util:fbin("appId=~ts&accessToken=~ts&userId=~ts&time=~w&"
			"sign=~ts",
			[AppId, AccessToken, UserId, Now, Sign]),
	  case catch httpc:request(post,
				   {Url, [],
				    "application/x-www-form-urlencoded", Body},
				   [{timeout, 5000}], [])
	      of
	    {ok, {_StatusLine, _Headers, RtnBody}} ->
		case ejson:decode(RtnBody) of
		  {L} ->
		      case lists:keyfind(<<"content">>, 1, L) of
			{<<"content">>, {[{<<"isBind">>, Flag} | _]}} ->
			    if Flag =:= 1 ->
				   Award =
				       holiday_role_data:get_const(bind_phone_items),
				   GL = format:val_to_gain(Award, bind_phone),
				   case role_gain:do_notice(Role, GL,
							    #gain_loss_opts{type
										=
										2})
				       of
				     {false, #gain{msg = Msg}} -> {false, Msg};
				     {ok, Role2} ->
					 NewRole = var:set_var(Role2, other,
							       3010, 1),
					 log:log_gain(GL, Role, NewRole,
						      <<"绑定手机"/utf8>>,
						      util:fbin("领取手机绑定奖励",
								[])),
					 {ok, NewRole}
				   end;
			       true ->
				   {false, lang:get(<<"请前往游戏悬浮窗，进行手机绑定"/utf8>>)}
			    end;
			_ ->
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
			      {__Pidholiday_misc99, _,
			       {__Levelholiday_misc99, __Tracesholiday_misc99}}
				  when __Levelholiday_misc99 band 8 /= 0 orelse
					 __Tracesholiday_misc99 /= [] ->
				  lager:do_log(error,
					       [{module, holiday_misc},
						{function, bind_phone_reward},
						{line, 99},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[AppId:~w, AccessToken:~w, Now:~w,Account:~s "
							     "Sign:~s]验证失败4! return_json: ~w",
							     [AppId,
							      AccessToken, Now,
							      UserId, Sign, L]),
					       none, 4096, 8,
					       __Levelholiday_misc99,
					       __Tracesholiday_misc99,
					       lager_event,
					       __Pidholiday_misc99);
			      _ -> ok
			    end,
			    {false, lang:get(<<"验证失败"/utf8>>)}
		      end;
		  Other ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_misc103, _,
			 {__Levelholiday_misc103, __Tracesholiday_misc103}}
			    when __Levelholiday_misc103 band 8 /= 0 orelse
				   __Tracesholiday_misc103 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_misc},
					  {function, bind_phone_reward},
					  {line, 103},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[AppId:~w, AccessToken:~w, Now:~w,Account:~s "
						       "Sign:~s]验证失败3! Other: ~w",
						       [AppId, AccessToken, Now,
							UserId, Sign, Other]),
					 none, 4096, 8, __Levelholiday_misc103,
					 __Tracesholiday_misc103, lager_event,
					 __Pidholiday_misc103);
			_ -> ok
		      end,
		      {false, lang:get(<<"验证失败"/utf8>>)}
		end;
	    {error, Reason} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_misc107, _,
		   {__Levelholiday_misc107, __Tracesholiday_misc107}}
		      when __Levelholiday_misc107 band 8 /= 0 orelse
			     __Tracesholiday_misc107 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_misc},
				    {function, bind_phone_reward}, {line, 107},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[AppId:~w, AccessToken:~w, Now:~w,Account:~s "
						 "Sign:~s]验证失败1!~w",
						 [AppId, AccessToken, Now,
						  UserId, Sign, Reason]),
				   none, 4096, 8, __Levelholiday_misc107,
				   __Tracesholiday_misc107, lager_event,
				   __Pidholiday_misc107);
		  _ -> ok
		end,
		{false, lang:get(<<"验证失败"/utf8>>)};
	    Any ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_misc110, _,
		   {__Levelholiday_misc110, __Tracesholiday_misc110}}
		      when __Levelholiday_misc110 band 8 /= 0 orelse
			     __Tracesholiday_misc110 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_misc},
				    {function, bind_phone_reward}, {line, 110},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[AppId:~w, AccessToken:~w, Now:~w, Account:~s "
						 "Sign:~s]验证失败2!~w",
						 [AppId, AccessToken, Now,
						  UserId, Sign, Any]),
				   none, 4096, 8, __Levelholiday_misc110,
				   __Tracesholiday_misc110, lager_event,
				   __Pidholiday_misc110);
		  _ -> ok
		end,
		{false, lang:get(<<"验证失败"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"您已领取过奖励"/utf8>>)}
    end;
bind_phone_reward(Role = #role{platform = <<"9377">>,
			       account = <<"9377_", UserId/binary>>},
		  AppId, AccessToken) ->
    Now = date:unixtime(),
    case var:get_var(Role, other, 3010, 0) of
      0 ->
	  Sign = util:md5(lists:concat([binary_to_list(UserId),
					Now,
					"8651cf548ba895bb896d01e106c718ca"])),
	  Url = "https://wvw.9377.cn/api/getUserInfo.php",
	  Body = util:fbin("username=~ts&timestamp=~w&sign=~ts",
			   [UserId, Now, Sign]),
	  case catch httpc:request(post,
				   {Url, [],
				    "application/x-www-form-urlencoded", Body},
				   [{timeout, 5000}], [])
	      of
	    {ok, {_StatusLine, _Headers, RtnBody}} ->
		case ejson:decode(RtnBody) of
		  {L} ->
		      case lists:keyfind(<<"data">>, 1, L) of
			{<<"data">>, {Data}} ->
			    Flag = list_util:keyfind(<<"is_bind_mobile">>, Data,
						     0),
			    if Flag =:= 1 ->
				   Award =
				       holiday_role_data:get_const(bind_phone_items),
				   GL = format:val_to_gain(Award, bind_phone),
				   case role_gain:do_notice(Role, GL,
							    #gain_loss_opts{type
										=
										2})
				       of
				     {false, #gain{msg = Msg}} -> {false, Msg};
				     {ok, Role2} ->
					 NewRole = var:set_var(Role2, other,
							       3010, 1),
					 log:log_gain(GL, Role, NewRole,
						      <<"绑定手机"/utf8>>,
						      util:fbin("领取手机绑定奖励",
								[])),
					 {ok, NewRole}
				   end;
			       true ->
				   {false, lang:get(<<"请前往游戏悬浮窗，进行手机绑定"/utf8>>)}
			    end;
			_ ->
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
			      {__Pidholiday_misc146, _,
			       {__Levelholiday_misc146,
				__Tracesholiday_misc146}}
				  when __Levelholiday_misc146 band 8 /= 0 orelse
					 __Tracesholiday_misc146 /= [] ->
				  lager:do_log(error,
					       [{module, holiday_misc},
						{function, bind_phone_reward},
						{line, 146},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[AppId:~w, AccessToken:~w, Now:~w,Account:~s "
							     "Sign:~s]验证失败4! return_json: ~w",
							     [AppId,
							      AccessToken, Now,
							      UserId, Sign, L]),
					       none, 4096, 8,
					       __Levelholiday_misc146,
					       __Tracesholiday_misc146,
					       lager_event,
					       __Pidholiday_misc146);
			      _ -> ok
			    end,
			    {false, lang:get(<<"验证失败"/utf8>>)}
		      end;
		  Other ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_misc150, _,
			 {__Levelholiday_misc150, __Tracesholiday_misc150}}
			    when __Levelholiday_misc150 band 8 /= 0 orelse
				   __Tracesholiday_misc150 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_misc},
					  {function, bind_phone_reward},
					  {line, 150},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[AppId:~w, AccessToken:~w, Now:~w,Account:~s "
						       "Sign:~s]验证失败3! Other: ~w",
						       [AppId, AccessToken, Now,
							UserId, Sign, Other]),
					 none, 4096, 8, __Levelholiday_misc150,
					 __Tracesholiday_misc150, lager_event,
					 __Pidholiday_misc150);
			_ -> ok
		      end,
		      {false, lang:get(<<"验证失败"/utf8>>)}
		end;
	    {error, Reason} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_misc154, _,
		   {__Levelholiday_misc154, __Tracesholiday_misc154}}
		      when __Levelholiday_misc154 band 8 /= 0 orelse
			     __Tracesholiday_misc154 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_misc},
				    {function, bind_phone_reward}, {line, 154},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[AppId:~w, AccessToken:~w, Now:~w,Account:~s "
						 "Sign:~s]验证失败1!~w",
						 [AppId, AccessToken, Now,
						  UserId, Sign, Reason]),
				   none, 4096, 8, __Levelholiday_misc154,
				   __Tracesholiday_misc154, lager_event,
				   __Pidholiday_misc154);
		  _ -> ok
		end,
		{false, lang:get(<<"验证失败"/utf8>>)};
	    Any ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_misc157, _,
		   {__Levelholiday_misc157, __Tracesholiday_misc157}}
		      when __Levelholiday_misc157 band 8 /= 0 orelse
			     __Tracesholiday_misc157 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_misc},
				    {function, bind_phone_reward}, {line, 157},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[AppId:~w, AccessToken:~w, Now:~w, Account:~s "
						 "Sign:~s]验证失败2!~w",
						 [AppId, AccessToken, Now,
						  UserId, Sign, Any]),
				   none, 4096, 8, __Levelholiday_misc157,
				   __Tracesholiday_misc157, lager_event,
				   __Pidholiday_misc157);
		  _ -> ok
		end,
		{false, lang:get(<<"验证失败"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"您已领取过奖励"/utf8>>)}
    end;
bind_phone_reward(Role = #role{platform = <<"9377ios">>,
			       account = <<"9377ios_", UserId/binary>>},
		  AppId, AccessToken) ->
    Now = date:unixtime(),
    case var:get_var(Role, other, 3010, 0) of
      0 ->
	  Sign = util:md5(lists:concat([binary_to_list(UserId),
					Now,
					"8651cf548ba895bb896d01e106c718ca"])),
	  Url = "https://wvw.9377.cn/api/getUserInfo.php",
	  Body = util:fbin("username=~ts&timestamp=~w&sign=~ts",
			   [UserId, Now, Sign]),
	  case catch httpc:request(post,
				   {Url, [],
				    "application/x-www-form-urlencoded", Body},
				   [{timeout, 5000}], [])
	      of
	    {ok, {_StatusLine, _Headers, RtnBody}} ->
		case ejson:decode(RtnBody) of
		  {L} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_misc174, _,
			 {__Levelholiday_misc174, __Tracesholiday_misc174}}
			    when __Levelholiday_misc174 band 64 /= 0 orelse
				   __Tracesholiday_misc174 /= [] ->
			    lager:do_log(info,
					 [{module, holiday_misc},
					  {function, bind_phone_reward},
					  {line, 174},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("------------------~w------------------",
						       [L]),
					 none, 4096, 64, __Levelholiday_misc174,
					 __Tracesholiday_misc174, lager_event,
					 __Pidholiday_misc174);
			_ -> ok
		      end,
		      case lists:keyfind(<<"data">>, 1, L) of
			{<<"data">>, {Data}} ->
			    Flag = list_util:keyfind(<<"is_bind_mobile">>, Data,
						     0),
			    if Flag =:= 1 ->
				   Award =
				       holiday_role_data:get_const(bind_phone_items),
				   GL = format:val_to_gain(Award, bind_phone),
				   case role_gain:do_notice(Role, GL,
							    #gain_loss_opts{type
										=
										2})
				       of
				     {false, #gain{msg = Msg}} -> {false, Msg};
				     {ok, Role2} ->
					 NewRole = var:set_var(Role2, other,
							       3010, 1),
					 log:log_gain(GL, Role, NewRole,
						      <<"绑定手机"/utf8>>,
						      util:fbin("领取手机绑定奖励",
								[])),
					 {ok, NewRole}
				   end;
			       true ->
				   {false, lang:get(<<"请前往登录界面，进行手机绑定"/utf8>>)}
			    end;
			_ ->
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
			      {__Pidholiday_misc194, _,
			       {__Levelholiday_misc194,
				__Tracesholiday_misc194}}
				  when __Levelholiday_misc194 band 8 /= 0 orelse
					 __Tracesholiday_misc194 /= [] ->
				  lager:do_log(error,
					       [{module, holiday_misc},
						{function, bind_phone_reward},
						{line, 194},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[AppId:~w, AccessToken:~w, Now:~w,Account:~s "
							     "Sign:~s]验证失败4! return_json: ~w",
							     [AppId,
							      AccessToken, Now,
							      UserId, Sign, L]),
					       none, 4096, 8,
					       __Levelholiday_misc194,
					       __Tracesholiday_misc194,
					       lager_event,
					       __Pidholiday_misc194);
			      _ -> ok
			    end,
			    {false, lang:get(<<"验证失败"/utf8>>)}
		      end;
		  Other ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_misc198, _,
			 {__Levelholiday_misc198, __Tracesholiday_misc198}}
			    when __Levelholiday_misc198 band 8 /= 0 orelse
				   __Tracesholiday_misc198 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_misc},
					  {function, bind_phone_reward},
					  {line, 198},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[AppId:~w, AccessToken:~w, Now:~w,Account:~s "
						       "Sign:~s]验证失败3! Other: ~w",
						       [AppId, AccessToken, Now,
							UserId, Sign, Other]),
					 none, 4096, 8, __Levelholiday_misc198,
					 __Tracesholiday_misc198, lager_event,
					 __Pidholiday_misc198);
			_ -> ok
		      end,
		      {false, lang:get(<<"验证失败"/utf8>>)}
		end;
	    {error, Reason} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_misc202, _,
		   {__Levelholiday_misc202, __Tracesholiday_misc202}}
		      when __Levelholiday_misc202 band 8 /= 0 orelse
			     __Tracesholiday_misc202 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_misc},
				    {function, bind_phone_reward}, {line, 202},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[AppId:~w, AccessToken:~w, Now:~w,Account:~s "
						 "Sign:~s]验证失败1!~w",
						 [AppId, AccessToken, Now,
						  UserId, Sign, Reason]),
				   none, 4096, 8, __Levelholiday_misc202,
				   __Tracesholiday_misc202, lager_event,
				   __Pidholiday_misc202);
		  _ -> ok
		end,
		{false, lang:get(<<"验证失败"/utf8>>)};
	    Any ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_misc205, _,
		   {__Levelholiday_misc205, __Tracesholiday_misc205}}
		      when __Levelholiday_misc205 band 8 /= 0 orelse
			     __Tracesholiday_misc205 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_misc},
				    {function, bind_phone_reward}, {line, 205},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[AppId:~w, AccessToken:~w, Now:~w, Account:~s "
						 "Sign:~s]验证失败2!~w",
						 [AppId, AccessToken, Now,
						  UserId, Sign, Any]),
				   none, 4096, 8, __Levelholiday_misc205,
				   __Tracesholiday_misc205, lager_event,
				   __Pidholiday_misc205);
		  _ -> ok
		end,
		{false, lang:get(<<"验证失败"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"您已领取过奖励"/utf8>>)}
    end;
bind_phone_reward(Role, NumberStr, <<>>) ->
    case catch byte_size(NumberStr) =:= 11 andalso
		 is_integer(list_to_integer(binary_to_list(NumberStr)))
	of
      true ->
	  case var:get_var(Role, other, 3010, 0) of
	    0 ->
		case role_misc:check_cd(bind_phone_send_code, 60000) of
		  false -> {false, lang:get(<<"请求验证码过频繁"/utf8>>)};
		  true ->
		      DataL = [{phone_number, NumberStr}],
		      Url = lists:concat(["http://", game_lib:oss_url(),
					  "/index.php/sms/send"]),
		      Time = date:unixtime(),
		      Sign =
			  string_util:md5(lists:concat([binary_to_list(<<"sszg">>),
							Time,
							"cmRcnnv1ky43qwc2379m28VKpcjc58cycYb2myXz"])),
		      List = [{product_name, <<"sszg">>}, {date_time, Time},
			      {sign, Sign}
			      | DataL],
		      Body = game_lib:to_url_body_str(List),
		      case catch httpc:request(post,
					       {Url, [],
						"application/x-www-form-urlencoded",
						Body},
					       [{timeout, 5000}], [])
			  of
			{ok, {_StatusLine, _Headers, RtnBody}} ->
			    case catch ejson:decode(RtnBody) of
			      {[{<<"success">>, true}, {<<"message">>, {L}}]} ->
				  case lists:keyfind(<<"code">>, 1, L) of
				    {_, Code} ->
					put(bind_phone, {NumberStr, Code}), ok;
				    _ -> {false, lang:get(<<"请求验证码失败"/utf8>>)}
				  end;
			      {[{<<"success">>, false}, {<<"message">>, Msg}]}
				  when is_binary(Msg) ->
				  erase(bind_phone_send_code), {false, Msg};
			      _ ->
				  case {whereis(lager_event),
					whereis(lager_event),
					lager_config:get({lager_event,
							  loglevel},
							 {0, []})}
				      of
				    {undefined, undefined, _} ->
					fun () -> {error, lager_not_running}
					end();
				    {undefined, _, _} ->
					fun () ->
						{error,
						 {sink_not_configured,
						  lager_event}}
					end();
				    {__Pidholiday_misc241, _,
				     {__Levelholiday_misc241,
				      __Tracesholiday_misc241}}
					when __Levelholiday_misc241 band 8 /= 0
					       orelse
					       __Tracesholiday_misc241 /= [] ->
					lager:do_log(error,
						     [{module, holiday_misc},
						      {function,
						       bind_phone_reward},
						      {line, 241},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("ret==>~ts",
								   [RtnBody]),
						     none, 4096, 8,
						     __Levelholiday_misc241,
						     __Tracesholiday_misc241,
						     lager_event,
						     __Pidholiday_misc241);
				    _ -> ok
				  end,
				  erase(bind_phone_send_code),
				  {false, lang:get(<<"发送验证码失败"/utf8>>)}
			    end;
			_Err ->
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
			      {__Pidholiday_misc246, _,
			       {__Levelholiday_misc246,
				__Tracesholiday_misc246}}
				  when __Levelholiday_misc246 band 8 /= 0 orelse
					 __Tracesholiday_misc246 /= [] ->
				  lager:do_log(error,
					       [{module, holiday_misc},
						{function, bind_phone_reward},
						{line, 246},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("send_ret=~w",
							     [_Err]),
					       none, 4096, 8,
					       __Levelholiday_misc246,
					       __Tracesholiday_misc246,
					       lager_event,
					       __Pidholiday_misc246);
			      _ -> ok
			    end,
			    erase(bind_phone_send_code),
			    {false, lang:get(<<"请求验证码失败"/utf8>>)}
		      end
		end;
	    _ -> {false, lang:get(<<"手机已绑定"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"手机号不合法"/utf8>>)}
    end;
bind_phone_reward(Role = #role{id = {Rid, _},
			       account = Account, platform = Platform,
			       zone_id = ZoneId, channel = ChannelName,
			       name = Name, lev = Lev, os_name = OsName},
		  NumberStr, Code) ->
    case get(bind_phone) of
      {NumberStr, Code} ->
	  case var:get_var(Role, other, 3010, 0) of
	    0 ->
		case catch list_to_integer(binary_to_list(NumberStr)) of
		  Number when is_integer(Number) ->
		      Award = holiday_role_data:get_const(bind_phone_items),
		      GL = format:val_to_gain(Award, bind_phone),
		      case role_gain:do_notice(Role, GL,
					       #gain_loss_opts{type = 2})
			  of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, Role2} ->
			    NewRole = var:set_var(Role2, other, 3010, Number),
			    log:log_gain(GL, Role, NewRole, <<"绑定手机"/utf8>>,
					 util:fbin("领奖励:~w", [Number])),
			    SendList = [{platform_name, Platform},
					{channel_name, ChannelName},
					{gameserver_no, ZoneId}, {role_id, Rid},
					{role_name, Name}, {account, Account},
					{lv, Lev}, {phone_number, NumberStr},
					{os, OsName}],
			    log_http:send("sms/phone", SendList),
			    {ok, NewRole}
		      end;
		  _ -> {false, lang:get(<<"手机号非法"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"无法重复领取"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"验证码不正确"/utf8>>)}
    end.

-spec wechat_reward(#role{}) -> ok.

wechat_reward(Role) ->
    Status = var:get_var(Role, other, 3045, 0),
    Award = holiday_role_data:get_const(wechat_reward),
    sys_conn:pack_send(16633, {Status, Award}),
    ok.

-spec get_wechat_reward(#role{}) -> {false,
				     bitstring()} |
				    {ok, #role{}}.

get_wechat_reward(Role) ->
    NewRole = var:set_var(Role, other, 3045, 1),
    {ok, NewRole}.


