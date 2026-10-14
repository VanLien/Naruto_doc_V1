-file("src/mod/mail/feedback_mgr.erl", 1).

-module(feedback_mgr).

-lager_records([{role_feedback_info,
		 [role_id, id, state, status2, start_time, end_msg_time,
		  finish_time, score_time, title, content,
		  questions_lists, answer_lists, score]},
		{feedback,
		 [sess, rid, feedback_id, status, score, send_time,
		  time_out]},
		{gmail,
		 [id, type, mail_type, subject, content, assets, items,
		  start_time, end_time, conds, source, can_del]},
		{mail,
		 [sess, to, to_name, from, from_name, type, group_id,
		  status, subject, content, assets, items, source, rev_ts,
		  read_time, send_time, time_out, can_del]},
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
		{state, []}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_log/1, get_log_info/2]).

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

-file("src/mod/mail/feedback_mgr.erl", 17).

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

-file("src/mod/mail/feedback_mgr.erl", 18).

-file("inc/mail.hrl", 1).

-record(mail,
	{sess  :: {pos_integer(), bitstring()},
	 to  :: {pos_integer(), bitstring()},
	 to_name = <<>>  :: bitstring(),
	 from  :: {non_neg_integer(), bitstring()},
	 from_name = <<>>  :: bitstring(), type = 1  :: 0..1,
	 group_id = 0  :: non_neg_integer(), status = 0  :: 0..1,
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 source = <<>>  :: pos_integer(),
	 rev_ts = 0  :: pos_integer(),
	 read_time = 0  :: pos_integer(),
	 send_time = 0  :: pos_integer(),
	 time_out = 0  :: pos_integer(), can_del = 1  :: 0..1}).

-record(gmail,
	{id = 0, type = 0  :: non_neg_integer(),
	 mail_type = 1  :: non_neg_integer(),
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 conds = []  :: list(), source = <<>>  :: pos_integer(),
	 can_del = 1  :: 0..1}).

-record(feedback,
	{sess, rid, feedback_id = 0, status = 0, score = 0,
	 send_time = 0, time_out = 0}).

-record(role_feedback_info,
	{role_id, id = 0, state = 0, status2 = 0,
	 start_time = 0, end_msg_time = 0, finish_time = 0,
	 score_time = 0, title = <<>>, content = <<>>,
	 questions_lists = [], answer_lists = [], score = 0}).

-file("src/mod/mail/feedback_mgr.erl", 19).

get_log(#role{id = Id}) -> get_log(Id);
get_log(Id) ->
    case ets:lookup(feedback_log, Id) of
      L = [_ | _] -> L;
      _ ->
	  case dets:lookup(feedback_log, Id) of
	    L = [_ | _] ->
		Now = date:unixtime(),
		L2 = [check_time_out(Now, Info) || Info <- L],
		[update_feedback(Info2) || Info2 <- L2],
		L;
	    _ -> []
	  end
    end.

get_log_info(RoleId, Id) ->
    FeedLisst = get_log(RoleId),
    case lists:keyfind(Id, #role_feedback_info.id,
		       FeedLisst)
	of
      Info = #role_feedback_info{} -> Info;
      _ -> undefined
    end.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> feedback_mgr ! Info.

cast(Info) -> gen_server:cast(feedback_mgr, Info).

call(Info) ->
    case catch gen_server:call(feedback_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidfeedback_mgr60, _,
	     {__Levelfeedback_mgr60, __Tracesfeedback_mgr60}}
		when __Levelfeedback_mgr60 band 8 /= 0 orelse
		       __Tracesfeedback_mgr60 /= [] ->
		lager:do_log(error,
			     [{module, feedback_mgr}, {function, call},
			      {line, 60}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [feedback_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelfeedback_mgr60,
			     __Tracesfeedback_mgr60, lager_event,
			     __Pidfeedback_mgr60);
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
    gen_server:start_link({local, feedback_mgr},
			  feedback_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidfeedback_mgr66, _,
       {__Levelfeedback_mgr66, __Tracesfeedback_mgr66}}
	  when __Levelfeedback_mgr66 band 64 /= 0 orelse
		 __Tracesfeedback_mgr66 /= [] ->
	  lager:do_log(info,
		       [{module, feedback_mgr}, {function, init}, {line, 66},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [feedback_mgr]), none,
		       4096, 64, __Levelfeedback_mgr66, __Tracesfeedback_mgr66,
		       lager_event, __Pidfeedback_mgr66);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(feedback_log,
			"dets/feedback_log.dets", #role_feedback_info.role_id,
			duplicate_bag),
    d_ets_lib:new_d_ets(feedback_do_submit,
			"dets/feedback_do_submit.dets", 1, set),
    dets:to_ets(feedback_do_submit, feedback_do_submit),
    util:set_ms_timer(do_submit, util:rand(30000, 60000),
		      do_submit),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidfeedback_mgr73, _,
       {__Levelfeedback_mgr73, __Tracesfeedback_mgr73}}
	  when __Levelfeedback_mgr73 band 64 /= 0 orelse
		 __Tracesfeedback_mgr73 /= [] ->
	  lager:do_log(info,
		       [{module, feedback_mgr}, {function, init}, {line, 73},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [feedback_mgr]), none, 4096,
		       64, __Levelfeedback_mgr73, __Tracesfeedback_mgr73,
		       lager_event, __Pidfeedback_mgr73);
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
	    {__Pidfeedback_mgr81, _,
	     {__Levelfeedback_mgr81, __Tracesfeedback_mgr81}}
		when __Levelfeedback_mgr81 band 8 /= 0 orelse
		       __Tracesfeedback_mgr81 /= [] ->
		lager:do_log(error,
			     [{module, feedback_mgr}, {function, handle_call},
			      {line, 81}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelfeedback_mgr81,
			     __Tracesfeedback_mgr81, lager_event,
			     __Pidfeedback_mgr81);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    feedback_mgr, 82, _Reason}),
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
	    {__Pidfeedback_mgr94, _,
	     {__Levelfeedback_mgr94, __Tracesfeedback_mgr94}}
		when __Levelfeedback_mgr94 band 8 /= 0 orelse
		       __Tracesfeedback_mgr94 /= [] ->
		lager:do_log(error,
			     [{module, feedback_mgr}, {function, handle_info},
			      {line, 94}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelfeedback_mgr94,
			     __Tracesfeedback_mgr94, lager_event,
			     __Pidfeedback_mgr94);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    feedback_mgr, 95, _Reason}),
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
      {__Pidfeedback_mgr100, _,
       {__Levelfeedback_mgr100, __Tracesfeedback_mgr100}}
	  when __Levelfeedback_mgr100 band 64 /= 0 orelse
		 __Tracesfeedback_mgr100 /= [] ->
	  lager:do_log(info,
		       [{module, feedback_mgr}, {function, terminate},
			{line, 100}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelfeedback_mgr100,
		       __Tracesfeedback_mgr100, lager_event,
		       __Pidfeedback_mgr100);
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
	    {__Pidfeedback_mgr112, _,
	     {__Levelfeedback_mgr112, __Tracesfeedback_mgr112}}
		when __Levelfeedback_mgr112 band 8 /= 0 orelse
		       __Tracesfeedback_mgr112 /= [] ->
		lager:do_log(error,
			     [{module, feedback_mgr},
			      {function, do_handle_call}, {line, 112},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelfeedback_mgr112,
			     __Tracesfeedback_mgr112, lager_event,
			     __Pidfeedback_mgr112);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    feedback_mgr, 113, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
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
	    {__Pidfeedback_mgr126, _,
	     {__Levelfeedback_mgr126, __Tracesfeedback_mgr126}}
		when __Levelfeedback_mgr126 band 8 /= 0 orelse
		       __Tracesfeedback_mgr126 /= [] ->
		lager:do_log(error,
			     [{module, feedback_mgr},
			      {function, do_handle_info}, {line, 126},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelfeedback_mgr126,
			     __Tracesfeedback_mgr126, lager_event,
			     __Pidfeedback_mgr126);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    feedback_mgr, 127, _Reason}),
	  {noreply, State}
    end;
do_handle_info({read_feedback, RoleId, FeedbackId},
	       State) ->
    case feedback_mgr:get_log_info(RoleId, FeedbackId) of
      Info = #role_feedback_info{status2 = 0} ->
	  NewInfo = Info#role_feedback_info{status2 = 1},
	  update_feedback(NewInfo);
      _ -> skip
    end,
    {noreply, State};
do_handle_info({new_feedback,
		RoleFeedInfo = #role_feedback_info{role_id = RoleId,
						   id = FeedbackId}},
	       State) ->
    calc_del_feedback_log(RoleId),
    ets:insert(feedback_log, RoleFeedInfo),
    dets:insert(feedback_log, RoleFeedInfo),
    role_lib:cast(by_id, RoleId,
		  {feedback, update_feed, [FeedbackId]}),
    {noreply, State};
do_handle_info({new_questions, RoleId, FeedbackId,
		Content},
	       State) ->
    case feedback_mgr:get_log_info(RoleId, FeedbackId) of
      Info = #role_feedback_info{questions_lists = QList} ->
	  Now = date:unixtime(),
	  NewQList = [{Now, Content} | QList],
	  NewInfo = Info#role_feedback_info{end_msg_time = Now,
					    questions_lists = NewQList,
					    state = 1},
	  update_feedback(NewInfo),
	  role_lib:cast(by_id, RoleId,
			{feedback, update_feed, [FeedbackId]});
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidfeedback_mgr157, _,
	     {__Levelfeedback_mgr157, __Tracesfeedback_mgr157}}
		when __Levelfeedback_mgr157 band 8 /= 0 orelse
		       __Tracesfeedback_mgr157 /= [] ->
		lager:do_log(error,
			     [{module, feedback_mgr},
			      {function, do_handle_info}, {line, 157},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("新增追问时找不到该反馈信息:~w",
					   [{RoleId, FeedbackId, _Err}]),
			     none, 4096, 8, __Levelfeedback_mgr157,
			     __Tracesfeedback_mgr157, lager_event,
			     __Pidfeedback_mgr157);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, State};
do_handle_info({new_answer, RoleId, FeedbackId,
		AnswerInfo},
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidfeedback_mgr163, _,
       {__Levelfeedback_mgr163, __Tracesfeedback_mgr163}}
	  when __Levelfeedback_mgr163 band 64 /= 0 orelse
		 __Tracesfeedback_mgr163 /= [] ->
	  lager:do_log(info,
		       [{module, feedback_mgr}, {function, do_handle_info},
			{line, 163}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("收到客服反馈回复~w", [{RoleId, FeedbackId}]),
		       none, 4096, 64, __Levelfeedback_mgr163,
		       __Tracesfeedback_mgr163, lager_event,
		       __Pidfeedback_mgr163);
      _ -> ok
    end,
    case feedback_mgr:get_log_info(RoleId, FeedbackId) of
      Info = #role_feedback_info{answer_lists =
				     AnswerLists} ->
	  Now = date:unixtime(),
	  NewQList = [{Now, AnswerInfo} | AnswerLists],
	  NewInfo = Info#role_feedback_info{state = 2,
					    status2 = 0, end_msg_time = Now,
					    answer_lists = NewQList},
	  update_feedback(NewInfo),
	  role_lib:cast(by_id, RoleId,
			{feedback, update_feed, [FeedbackId]});
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidfeedback_mgr172, _,
	     {__Levelfeedback_mgr172, __Tracesfeedback_mgr172}}
		when __Levelfeedback_mgr172 band 8 /= 0 orelse
		       __Tracesfeedback_mgr172 /= [] ->
		lager:do_log(error,
			     [{module, feedback_mgr},
			      {function, do_handle_info}, {line, 172},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("新增追问时找不到该反馈信息:~w",
					   [{RoleId, FeedbackId, _Err}]),
			     none, 4096, 8, __Levelfeedback_mgr172,
			     __Tracesfeedback_mgr172, lager_event,
			     __Pidfeedback_mgr172);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, State};
do_handle_info({do_finish, RoleId, Id}, State) ->
    case feedback_mgr:get_log_info(RoleId, Id) of
      Info = #role_feedback_info{state = StateT}
	  when StateT =/= 3 andalso StateT =/= 4 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidfeedback_mgr180, _,
	     {__Levelfeedback_mgr180, __Tracesfeedback_mgr180}}
		when __Levelfeedback_mgr180 band 64 /= 0 orelse
		       __Tracesfeedback_mgr180 /= [] ->
		lager:do_log(info,
			     [{module, feedback_mgr},
			      {function, do_handle_info}, {line, 180},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家确认已解决问题:~w", [{RoleId, Id}]),
			     none, 4096, 64, __Levelfeedback_mgr180,
			     __Tracesfeedback_mgr180, lager_event,
			     __Pidfeedback_mgr180);
	    _ -> ok
	  end,
	  Now = date:unixtime(),
	  NewInfo = Info#role_feedback_info{state = 3,
					    finish_time = Now},
	  ets:insert(feedback_do_submit, {{RoleId, Id}, Now, 3}),
	  dets:insert(feedback_do_submit, {{RoleId, Id}, Now, 3}),
	  update_feedback(NewInfo),
	  role_lib:cast(by_id, RoleId,
			{feedback, update_feed, [Id]});
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidfeedback_mgr188, _,
	     {__Levelfeedback_mgr188, __Tracesfeedback_mgr188}}
		when __Levelfeedback_mgr188 band 8 /= 0 orelse
		       __Tracesfeedback_mgr188 /= [] ->
		lager:do_log(error,
			     [{module, feedback_mgr},
			      {function, do_handle_info}, {line, 188},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家确认已解决问题时找不到该反馈信息:~w",
					   [{RoleId, Id, _Err}]),
			     none, 4096, 8, __Levelfeedback_mgr188,
			     __Tracesfeedback_mgr188, lager_event,
			     __Pidfeedback_mgr188);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, State};
do_handle_info({do_score, RoleId, Id, Score}, State) ->
    case feedback_mgr:get_log_info(RoleId, Id) of
      Info = #role_feedback_info{state = StateT}
	  when StateT == 3 ->
	  Now = date:unixtime(),
	  NewInfo = Info#role_feedback_info{state = 4,
					    score = Score, score_time = Now},
	  ets:insert(feedback_do_submit, {{RoleId, Id}, Now, 4}),
	  dets:insert(feedback_do_submit, {{RoleId, Id}, Now, 4}),
	  update_feedback(NewInfo),
	  role_lib:cast(by_id, RoleId,
			{feedback, update_feed, [Id]});
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidfeedback_mgr203, _,
	     {__Levelfeedback_mgr203, __Tracesfeedback_mgr203}}
		when __Levelfeedback_mgr203 band 8 /= 0 orelse
		       __Tracesfeedback_mgr203 /= [] ->
		lager:do_log(error,
			     [{module, feedback_mgr},
			      {function, do_handle_info}, {line, 203},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家玩家评分时找不到该反馈信息:~w",
					   [{RoleId, Id, _Err}]),
			     none, 4096, 8, __Levelfeedback_mgr203,
			     __Tracesfeedback_mgr203, lager_event,
			     __Pidfeedback_mgr203);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, State};
do_handle_info(do_submit, State) ->
    do_submit(),
    util:set_ms_timer(do_submit, util:rand(30000, 60000),
		      do_submit),
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

do_submit() ->
    case ets:first(feedback_do_submit) of
      Key = {{Rid, Sid}, Id} ->
	  case ets:lookup(feedback_do_submit, Key) of
	    [{_, Time, Status} | _] ->
		case feedback_mgr:get_log_info({Rid, Sid}, Id) of
		  #role_feedback_info{state = StateT}
		      when StateT == Status ->
		      SubStatus = get_http_status(StateT),
		      Url = lists:concat(["http://", game_lib:oss_url(),
					  "/index.php/message/feedbackStatus"]),
		      Sign =
			  string_util:md5(lists:concat([binary_to_list(<<"sszg">>),
							Time,
							"cmRcnnv1ky43qwc2379m28VKpcjc58cycYb2myXz"])),
		      Extend = lists:flatten(json:encode({struct,
							  [{order_id,
							    util:fbin("~w_~s:~w",
								      [Rid, Sid,
								       Id])},
							   {status,
							    SubStatus}]})),
		      List = [{product_name, <<"sszg">>}, {date_time, Time},
			      {sign, Sign}, {extend, Extend}],
		      Body = game_lib:to_url_body_str(List),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidfeedback_mgr230, _,
			 {__Levelfeedback_mgr230, __Tracesfeedback_mgr230}}
			    when __Levelfeedback_mgr230 band 128 /= 0 orelse
				   __Tracesfeedback_mgr230 /= [] ->
			    lager:do_log(debug,
					 [{module, feedback_mgr},
					  {function, do_submit}, {line, 230},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("反馈请求本体 ~w", [Body]),
					 none, 4096, 128,
					 __Levelfeedback_mgr230,
					 __Tracesfeedback_mgr230, lager_event,
					 __Pidfeedback_mgr230);
			_ -> ok
		      end,
		      case catch httpc:request(post,
					       {Url, [],
						"application/x-www-form-urlencoded",
						Body},
					       [{timeout, 5000}], [])
			  of
			{ok, {_StatusLine, _Headers, RtnBody}} ->
			    case ejson:decode(RtnBody) of
			      {[{<<"success">>, true} | _]} ->
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
				    {__Pidfeedback_mgr235, _,
				     {__Levelfeedback_mgr235,
				      __Tracesfeedback_mgr235}}
					when __Levelfeedback_mgr235 band 64 /= 0
					       orelse
					       __Tracesfeedback_mgr235 /= [] ->
					lager:do_log(info,
						     [{module, feedback_mgr},
						      {function, do_submit},
						      {line, 235},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("客服反馈状态更新更新成功~w",
								   [{Key, Time,
								     Status}]),
						     none, 4096, 64,
						     __Levelfeedback_mgr235,
						     __Tracesfeedback_mgr235,
						     lager_event,
						     __Pidfeedback_mgr235);
				    _ -> ok
				  end,
				  ets:delete(feedback_do_submit, Key),
				  dets:delete(feedback_do_submit, Key),
				  ok;
			      {[{<<"success">>, false}, {<<"message">>, Msg}]}
				  when is_binary(Msg) ->
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
				    {__Pidfeedback_mgr240, _,
				     {__Levelfeedback_mgr240,
				      __Tracesfeedback_mgr240}}
					when __Levelfeedback_mgr240 band 8 /= 0
					       orelse
					       __Tracesfeedback_mgr240 /= [] ->
					lager:do_log(error,
						     [{module, feedback_mgr},
						      {function, do_submit},
						      {line, 240},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("客服反馈状态更新接口提交异常~w",
								   [Msg]),
						     none, 4096, 8,
						     __Levelfeedback_mgr240,
						     __Tracesfeedback_mgr240,
						     lager_event,
						     __Pidfeedback_mgr240);
				    _ -> ok
				  end,
				  {false, Msg};
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
				    {__Pidfeedback_mgr243, _,
				     {__Levelfeedback_mgr243,
				      __Tracesfeedback_mgr243}}
					when __Levelfeedback_mgr243 band 8 /= 0
					       orelse
					       __Tracesfeedback_mgr243 /= [] ->
					lager:do_log(error,
						     [{module, feedback_mgr},
						      {function, do_submit},
						      {line, 243},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("ret==>~ts",
								   [RtnBody]),
						     none, 4096, 8,
						     __Levelfeedback_mgr243,
						     __Tracesfeedback_mgr243,
						     lager_event,
						     __Pidfeedback_mgr243);
				    _ -> ok
				  end,
				  {false, lang:get(<<"提交失败"/utf8>>)}
			    end;
			{error, _Reason} ->
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
			      {__Pidfeedback_mgr247, _,
			       {__Levelfeedback_mgr247,
				__Tracesfeedback_mgr247}}
				  when __Levelfeedback_mgr247 band 8 /= 0 orelse
					 __Tracesfeedback_mgr247 /= [] ->
				  lager:do_log(error,
					       [{module, feedback_mgr},
						{function, do_submit},
						{line, 247},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("客服反馈状态更新接口提交异常~w",
							     [_Reason]),
					       none, 4096, 8,
					       __Levelfeedback_mgr247,
					       __Tracesfeedback_mgr247,
					       lager_event,
					       __Pidfeedback_mgr247);
			      _ -> ok
			    end,
			    {false, lang:get(<<"提交失败"/utf8>>)};
			Any ->
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
			      {__Pidfeedback_mgr250, _,
			       {__Levelfeedback_mgr250,
				__Tracesfeedback_mgr250}}
				  when __Levelfeedback_mgr250 band 8 /= 0 orelse
					 __Tracesfeedback_mgr250 /= [] ->
				  lager:do_log(error,
					       [{module, feedback_mgr},
						{function, do_submit},
						{line, 250},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("客服反馈状态更新接口提交异常~w",
							     [Any]),
					       none, 4096, 8,
					       __Levelfeedback_mgr250,
					       __Tracesfeedback_mgr250,
					       lager_event,
					       __Pidfeedback_mgr250);
			      _ -> ok
			    end,
			    {false, lang:get(<<"提交失败"/utf8>>)}
		      end;
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidfeedback_mgr254, _,
			 {__Levelfeedback_mgr254, __Tracesfeedback_mgr254}}
			    when __Levelfeedback_mgr254 band 64 /= 0 orelse
				   __Tracesfeedback_mgr254 /= [] ->
			    lager:do_log(info,
					 [{module, feedback_mgr},
					  {function, do_submit}, {line, 254},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("客服反馈状态更新更新时与当前订单状态不一致，不予上报~w",
						       [{Key, Time, Status}]),
					 none, 4096, 64, __Levelfeedback_mgr254,
					 __Tracesfeedback_mgr254, lager_event,
					 __Pidfeedback_mgr254);
			_ -> ok
		      end,
		      ets:delete(feedback_do_submit, Key),
		      dets:delete(feedback_do_submit, Key),
		      {false, lang:get(<<"提交失败"/utf8>>)}
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
		  {__Pidfeedback_mgr260, _,
		   {__Levelfeedback_mgr260, __Tracesfeedback_mgr260}}
		      when __Levelfeedback_mgr260 band 64 /= 0 orelse
			     __Tracesfeedback_mgr260 /= [] ->
		      lager:do_log(info,
				   [{module, feedback_mgr},
				    {function, do_submit}, {line, 260},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("客服反馈状态更新更新时找不到数据~w", [Key]),
				   none, 4096, 64, __Levelfeedback_mgr260,
				   __Tracesfeedback_mgr260, lager_event,
				   __Pidfeedback_mgr260);
		  _ -> ok
		end,
		ets:delete(feedback_do_submit, Key),
		dets:delete(feedback_do_submit, Key),
		ok
	  end;
      _ -> ok
    end.

get_http_status(3) -> 3;
get_http_status(4) -> 5;
get_http_status(5) -> 4;
get_http_status(_Any) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidfeedback_mgr272, _,
       {__Levelfeedback_mgr272, __Tracesfeedback_mgr272}}
	  when __Levelfeedback_mgr272 band 8 /= 0 orelse
		 __Tracesfeedback_mgr272 /= [] ->
	  lager:do_log(error,
		       [{module, feedback_mgr}, {function, get_http_status},
			{line, 272}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("反馈状态更新异常数据:~w", [_Any]), none, 4096, 8,
		       __Levelfeedback_mgr272, __Tracesfeedback_mgr272,
		       lager_event, __Pidfeedback_mgr272);
      _ -> ok
    end,
    0.

check_time_out(Now,
	       Info = #role_feedback_info{end_msg_time = EndMsgTime,
					  state = 2}) ->
    case Now >= EndMsgTime + 86400 * 7 of
      true -> Info#role_feedback_info{state = 5};
      _ -> Info
    end;
check_time_out(Now,
	       Info = #role_feedback_info{end_msg_time = EndMsgTime,
					  state = 3}) ->
    case Now >= EndMsgTime + 86400 * 3 of
      true -> Info#role_feedback_info{state = 5};
      _ -> Info
    end;
check_time_out(_Now, Info) -> Info.

-spec update_feedback(#role_feedback_info{}) -> ok.

update_feedback(Info = #role_feedback_info{role_id =
					       MyId,
					   id = Fid}) ->
    del_feedback(MyId, Fid),
    ets:insert(feedback_log, Info),
    dets:insert(feedback_log, Info).

-spec del_feedback(Rid :: role_id(),
		   Fid :: role_id()) -> ok.

del_feedback(Rid, Fid) ->
    ets:match_delete(feedback_log,
		     #role_feedback_info{role_id = Rid, id = Fid, _ = '_'}),
    dets:match_delete(feedback_log,
		      #role_feedback_info{role_id = Rid, id = Fid, _ = '_'}).

calc_del_feedback_log(RoleId) ->
    L = get_log(RoleId),
    case length(L) > 10 of
      true ->
	  [DelId | _] = lists:keysort(#role_feedback_info.id, L),
	  del_feedback(RoleId, DelId);
      _ -> ok
    end.


