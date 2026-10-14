-file("src/mod/voting/voting_mgr.erl", 1).

-module(voting_mgr).

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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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
		{voting,
		 [ver, platform_zone, id, start_time, end_time,
		  board_time, is_email, finish_id, voting_list]},
		{voting_detail, [ver, id, role_voting]}, {state, []}]).

-behaviour(gen_server).

-export([update_voting/1, get_voting/0, vote/2,
	 push_result/0, info_result/1, push_status/1, ready/1,
	 gm_delete/0, tabtolist/0]).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/voting/voting_mgr.erl", 24).

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

-file("src/mod/voting/voting_mgr.erl", 25).

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

-file("src/mod/voting/voting_mgr.erl", 26).

-file("inc/vip.hrl", 1).

-record(m_vip,
	{ver = 2, lev = 0, lev_reward = [], tired_charge = []}).

-record(vip_data,
	{lev = 0  :: non_neg_integer(),
	 gold = 0  :: non_neg_integer(), price = []  :: list(),
	 old_price = []  :: list(), items = []  :: list(),
	 ext_reward = []}).

-record(vip_effect_data,
	{name = <<>>  :: bitstring(),
	 val = 0  :: non_neg_integer()}).

-file("src/mod/voting/voting_mgr.erl", 27).

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

-file("src/mod/voting/voting_mgr.erl", 28).

tabtolist() -> ets:tab2list(voting).

-spec info_result(pos_integer()) -> ok.

info_result(VoteId) ->
    P = sys_env:get(platform),
    Z = sys_env:get(zone_id),
    case get_voting() of
      #voting{start_time = StartTime, end_time = EndTime,
	      voting_list = VotingList} ->
	  case lists:keyfind(VoteId, #voting_detail.id,
			     VotingList)
	      of
	    #voting_detail{role_voting = RoleVotingList} ->
		LiveNum = get_alive_num(StartTime, EndTime),
		{AgreeNum, DisAgreeNum, AgreePoints, DisAgreePoints} =
		    vote_result(RoleVotingList, 0, 0, 0, 0),
		AllNum = AgreeNum + DisAgreeNum,
		M1 = AllNum / max(1, LiveNum),
		M2 = AgreeNum / max(1, AllNum),
		M3 = DisAgreeNum / max(1, AllNum),
		M4 = (AgreePoints - DisAgreePoints) /
		       max(1, AgreePoints + DisAgreePoints),
		io:format("~ts",
			  [io_lib:format("平台:~ts   区号:~w  ~n支持点数:~w,   反对点数:~w, "
					 "   总点数:~w~n本服支持总人数:~w,    本服反对总人数:~w, "
					 "       本服投票总人数:~w~n本服投票参与率:~w,  支持人数率:~w, "
					 " 反对人数率:~w,   投票支持比:~w ",
					 [P, Z, AgreePoints, DisAgreePoints,
					  AgreePoints + DisAgreePoints,
					  AgreeNum, DisAgreeNum,
					  AgreeNum + DisAgreeNum, M1, M2, M3,
					  M4])]);
	    _ ->
		io:format("~ts",
			  [io_lib:format("平台:~ts   区号:~w 无投票信息", [P, Z])])
	  end;
      _ ->
	  io:format("~ts",
		    [io_lib:format("平台:~ts   区号:~w 无投票信息", [P, Z])])
    end.

gm_delete() ->
    ets:delete_all_objects(voting),
    dets:delete_all_objects(voting).

-spec ready(#role{}) -> ok.

ready(Role) ->
    {ok, Status, IsVote, Flag, LastTime} =
	push_status(Role),
    sys_conn:pack_send(10991,
		       {Status, IsVote, Flag, LastTime}),
    ok.

push_status(#role{id = Id}) ->
    Now = date:unixtime(),
    case get_voting() of
      #voting{id = VotingId, start_time = StartTime,
	      end_time = EndTime, voting_list = VotingList}
	  when VotingId > 0, Now >= StartTime, Now =< EndTime ->
	  LastTime = max(0, EndTime - Now),
	  case lists:keyfind(VotingId, #voting_detail.id,
			     VotingList)
	      of
	    #voting_detail{role_voting = RoleVoting} ->
		case lists:keyfind(Id, 1, RoleVoting) of
		  {Id, _, Flag} -> {ok, 1, 1, Flag, LastTime};
		  _ -> {ok, 1, 0, 0, LastTime}
		end;
	    _ -> {ok, 1, 0, 0, LastTime}
	  end;
      #voting{id = VotingId, end_time = EndTime,
	      board_time = BoardTime, voting_list = VotingList}
	  when VotingId > 0, Now >= EndTime, Now =< BoardTime ->
	  LastTime = max(0, BoardTime - Now),
	  case lists:keyfind(VotingId, #voting_detail.id,
			     VotingList)
	      of
	    #voting_detail{role_voting = RoleVoting} ->
		case lists:keyfind(Id, 1, RoleVoting) of
		  {Id, _, Flag} -> {ok, 2, 1, Flag, LastTime};
		  _ -> {ok, 2, 0, 0, LastTime}
		end;
	    _ -> {ok, 2, 0, 0, LastTime}
	  end;
      _ -> {ok, 3, 0, 0, 0}
    end.

-spec push_result() -> {ok, pos_integer(),
			pos_integer()} |
		       {false, string()}.

push_result() ->
    Now = date:unixtime(),
    case get_voting() of
      #voting{end_time = EndTime, board_time = BoardTime,
	      id = Id, voting_list = VotingList}
	  when Now >= EndTime, Now =< BoardTime ->
	  case lists:keyfind(Id, #voting_detail.id, VotingList) of
	    #voting_detail{role_voting = RoleVotingList} ->
		{_, _, AgreePoints, DisAgreePoints} =
		    vote_result(RoleVotingList, 0, 0, 0, 0),
		{ok, AgreePoints, DisAgreePoints, Id};
	    _ -> {false, lang:get(<<"目前不可以查看投票结果"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"目前不可以查看投票结果"/utf8>>)}
    end.

-spec vote(#role{}, pos_integer()) -> ok |
				      {false, string()}.

vote(#role{id = RoleId, m_vip = #m_vip{lev = VipLev},
	   reg_time = RegTime, lev = Lev},
     Flag) ->
    case check_vote_cond(RoleId, RegTime, Lev) of
      ok -> info({vote, RoleId, VipLev, Flag}), ok;
      {false, Reason} -> {false, Reason}
    end.

-spec update_voting(#voting{}) -> ok.

update_voting(Data) ->
    ets:insert(voting, Data), dets:insert(voting, Data).

-spec get_voting() -> #voting{} | false.

get_voting() ->
    case catch ets:tab2list(voting) of
      [V = #voting{}] -> V;
      _ -> false
    end.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> voting_mgr ! Info.

cast(Info) -> gen_server:cast(voting_mgr, Info).

call(Info) ->
    case catch gen_server:call(voting_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidvoting_mgr168, _,
	     {__Levelvoting_mgr168, __Tracesvoting_mgr168}}
		when __Levelvoting_mgr168 band 8 /= 0 orelse
		       __Tracesvoting_mgr168 /= [] ->
		lager:do_log(error,
			     [{module, voting_mgr}, {function, call},
			      {line, 168}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [voting_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelvoting_mgr168,
			     __Tracesvoting_mgr168, lager_event,
			     __Pidvoting_mgr168);
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
    gen_server:start_link({local, voting_mgr}, voting_mgr,
			  [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidvoting_mgr174, _,
       {__Levelvoting_mgr174, __Tracesvoting_mgr174}}
	  when __Levelvoting_mgr174 band 64 /= 0 orelse
		 __Tracesvoting_mgr174 /= [] ->
	  lager:do_log(info,
		       [{module, voting_mgr}, {function, init}, {line, 174},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [voting_mgr]), none, 4096,
		       64, __Levelvoting_mgr174, __Tracesvoting_mgr174,
		       lager_event, __Pidvoting_mgr174);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(voting,
		   [{file, "./dets/voting.dets"},
		    {keypos, #voting.platform_zone}]),
    ets:new(voting,
	    [set, named_table, public,
	     {keypos, #voting.platform_zone}]),
    load_data(),
    load_voting(),
    Ref = erlang:send_after(60 * 1000, self(), detection),
    put(detection, Ref),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidvoting_mgr183, _,
       {__Levelvoting_mgr183, __Tracesvoting_mgr183}}
	  when __Levelvoting_mgr183 band 64 /= 0 orelse
		 __Tracesvoting_mgr183 /= [] ->
	  lager:do_log(info,
		       [{module, voting_mgr}, {function, init}, {line, 183},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [voting_mgr]), none, 4096,
		       64, __Levelvoting_mgr183, __Tracesvoting_mgr183,
		       lager_event, __Pidvoting_mgr183);
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
	    {__Pidvoting_mgr191, _,
	     {__Levelvoting_mgr191, __Tracesvoting_mgr191}}
		when __Levelvoting_mgr191 band 8 /= 0 orelse
		       __Tracesvoting_mgr191 /= [] ->
		lager:do_log(error,
			     [{module, voting_mgr}, {function, handle_call},
			      {line, 191}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelvoting_mgr191,
			     __Tracesvoting_mgr191, lager_event,
			     __Pidvoting_mgr191);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    voting_mgr, 192, _Reason}),
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
	    {__Pidvoting_mgr204, _,
	     {__Levelvoting_mgr204, __Tracesvoting_mgr204}}
		when __Levelvoting_mgr204 band 8 /= 0 orelse
		       __Tracesvoting_mgr204 /= [] ->
		lager:do_log(error,
			     [{module, voting_mgr}, {function, handle_info},
			      {line, 204}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelvoting_mgr204,
			     __Tracesvoting_mgr204, lager_event,
			     __Pidvoting_mgr204);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    voting_mgr, 205, _Reason}),
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
      {__Pidvoting_mgr210, _,
       {__Levelvoting_mgr210, __Tracesvoting_mgr210}}
	  when __Levelvoting_mgr210 band 64 /= 0 orelse
		 __Tracesvoting_mgr210 /= [] ->
	  lager:do_log(info,
		       [{module, voting_mgr}, {function, terminate},
			{line, 210}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelvoting_mgr210,
		       __Tracesvoting_mgr210, lager_event, __Pidvoting_mgr210);
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
	    {__Pidvoting_mgr222, _,
	     {__Levelvoting_mgr222, __Tracesvoting_mgr222}}
		when __Levelvoting_mgr222 band 8 /= 0 orelse
		       __Tracesvoting_mgr222 /= [] ->
		lager:do_log(error,
			     [{module, voting_mgr}, {function, do_handle_call},
			      {line, 222}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelvoting_mgr222,
			     __Tracesvoting_mgr222, lager_event,
			     __Pidvoting_mgr222);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    voting_mgr, 223, _Reason}),
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
	    {__Pidvoting_mgr236, _,
	     {__Levelvoting_mgr236, __Tracesvoting_mgr236}}
		when __Levelvoting_mgr236 band 8 /= 0 orelse
		       __Tracesvoting_mgr236 /= [] ->
		lager:do_log(error,
			     [{module, voting_mgr}, {function, do_handle_info},
			      {line, 236}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelvoting_mgr236,
			     __Tracesvoting_mgr236, lager_event,
			     __Pidvoting_mgr236);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    voting_mgr, 237, _Reason}),
	  {noreply, State}
    end;
do_handle_info(voting_timeout, State) ->
    case get(voting_timeout) of
      OldRef when is_reference(OldRef) ->
	  erlang:cancel_timer(OldRef);
      _ -> skip
    end,
    Now = date:unixtime(),
    case get_voting() of
      Voting = #voting{board_time = BoardTime} ->
	  send_email(Voting),
	  Ref = erlang:send_after(max(0, BoardTime - Now) * 1000,
				  self(), board_timeout),
	  put(board_timeout, Ref),
	  role_group:apply(world, {voting_mgr, ready, []});
      _ -> skip
    end,
    {noreply, State};
do_handle_info(board_timeout, State) ->
    case get(board_timeout) of
      OldRef when is_reference(OldRef) ->
	  erlang:cancel_timer(OldRef);
      _ -> skip
    end,
    case get_voting() of
      Voting = #voting{id = Id, finish_id = IdList} ->
	  NewVoting = Voting#voting{id = 0, start_time = 0,
				    end_time = 0, board_time = 0, is_email = 0,
				    finish_id = [Id | IdList]},
	  update_voting(NewVoting),
	  role_group:apply(world, {voting_mgr, ready, []});
      _ -> skip
    end,
    {noreply, State};
do_handle_info(detection, State) ->
    case get(detection) of
      OldRef when is_reference(OldRef) ->
	  erlang:cancel_timer(OldRef);
      _ -> skip
    end,
    detection(),
    Ref = erlang:send_after(60 * 1000, self(), detection),
    put(detection, Ref),
    {noreply, State};
do_handle_info({vote, RoleId, VipLev, Flag}, State) ->
    case get_voting() of
      Voting = #voting{id = Id, voting_list = VotingList} ->
	  case lists:keyfind(Id, #voting_detail.id, VotingList) of
	    VotingDetail = #voting_detail{role_voting =
					      RoleVotingList} ->
		NewRoleVotingList = [{RoleId, VipLev, Flag}
				     | RoleVotingList],
		NewVotingDetail = VotingDetail#voting_detail{role_voting
								 =
								 NewRoleVotingList},
		NewVotingList = lists:keystore(Id, #voting_detail.id,
					       VotingList, NewVotingDetail),
		NewVoting = Voting#voting{voting_list = NewVotingList},
		update_voting(NewVoting);
	    _ -> skip
	  end;
      _ -> skip
    end,
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

detection() ->
    case get_voting() of
      #voting{id = Id} when Id > 0 -> skip;
      Voting = #voting{} -> init_new_voting(Voting);
      _ -> init_new_voting()
    end.

load_voting() ->
    Now = date:unixtime(),
    case get_voting() of
      #voting{end_time = EndTime} when Now =< EndTime ->
	  Ref = erlang:send_after(max(0, EndTime - Now) * 1000,
				  self(), voting_timeout),
	  put(voting_timeout, Ref);
      Voting = #voting{board_time = BoardTime, is_email = 0}
	  when Now =< BoardTime ->
	  send_email(Voting),
	  Ref = erlang:send_after(max(0, BoardTime - Now) * 1000,
				  self(), board_timeout),
	  put(board_timeout, Ref);
      #voting{board_time = BoardTime} when Now =< BoardTime ->
	  Ref = erlang:send_after(max(0, BoardTime - Now) * 1000,
				  self(), board_timeout),
	  put(board_timeout, Ref);
      Voting = #voting{id = Id, is_email = 0,
		       finish_id = IdList}
	  when Id > 0 ->
	  send_email(Voting),
	  NewVoting = Voting#voting{id = 0, start_time = 0,
				    end_time = 0, board_time = 0, is_email = 0,
				    finish_id = [Id | IdList]},
	  update_voting(NewVoting);
      Voting = #voting{id = Id, finish_id = IdList}
	  when Id > 0 ->
	  NewVoting = Voting#voting{id = 0, start_time = 0,
				    end_time = 0, board_time = 0, is_email = 0,
				    finish_id = [Id | IdList]},
	  update_voting(NewVoting);
      Voting = #voting{} -> init_new_voting(Voting);
      _ -> init_new_voting()
    end.

init_new_voting() ->
    Now = date:unixtime(),
    case [{Id, date:parse_time(StartTime),
	   date:parse_time(EndTime), BoardTime}
	  || {Id, StartTime, EndTime, PlatformList, BoardTime}
		 <- merge_voting_data:get_voting(),
	     Now >= date:parse_time(StartTime),
	     Now =< date:parse_time(EndTime),
	     lists:member({sys_env:get(platform),
			   sys_env:get(zone_id)},
			  PlatformList)]
	of
      [{NowId, NowStartTime, NowEndTime, NowBoardTime}
       | _Rest] ->
	  RealBoardTime = NowEndTime + NowBoardTime * 3600,
	  NewVoting = #voting{platform_zone =
				  {sys_env:get(platform), sys_env:get(zone_id)},
			      id = NowId, start_time = NowStartTime,
			      end_time = NowEndTime, board_time = RealBoardTime,
			      voting_list = [#voting_detail{id = NowId}]},
	  Ref = erlang:send_after(max(0, NowEndTime - Now) * 1000,
				  self(), voting_timeout),
	  put(voting_timeout, Ref),
	  update_voting(NewVoting),
	  role_group:apply(world, {voting_mgr, ready, []});
      _ -> skip
    end.

init_new_voting(Voting = #voting{voting_list =
				     VotingList}) ->
    Now = date:unixtime(),
    case [{Id, date:parse_time(StartTime),
	   date:parse_time(EndTime), BoardTime}
	  || {Id, StartTime, EndTime, PlatformList, BoardTime}
		 <- merge_voting_data:get_voting(),
	     Now >= date:parse_time(StartTime),
	     Now =< date:parse_time(EndTime),
	     lists:member({sys_env:get(platform),
			   sys_env:get(zone_id)},
			  PlatformList)]
	of
      [{NowId, NowStartTime, NowEndTime, NowBoardTime}
       | _Rest] ->
	  RealBoardTime = NowEndTime + NowBoardTime * 3600,
	  NewVoting = Voting#voting{id = NowId,
				    start_time = NowStartTime,
				    end_time = NowEndTime,
				    board_time = RealBoardTime, is_email = 0,
				    voting_list =
					[#voting_detail{id = NowId}
					 | VotingList]},
	  Ref = erlang:send_after(max(0, NowEndTime - Now) * 1000,
				  self(), voting_timeout),
	  put(voting_timeout, Ref),
	  update_voting(NewVoting),
	  role_group:apply(world, {voting_mgr, ready, []});
      _ -> skip
    end.

check_vote_cond(RoleId, RegTime, Lev) ->
    LimitLev = merge_voting_data:get_const(level_limit),
    LimitRoleTime = 86400 *
		      merge_voting_data:get_const(role_time_limit),
    Now = date:unixtime(),
    case get_voting() of
      #voting{} when Lev < LimitLev ->
	  {false, lang:get(<<"等级不足，无法投票"/utf8>>)};
      #voting{} when Now < RegTime + LimitRoleTime ->
	  {false, lang:get(<<"创号时间不足，无法投票"/utf8>>)};
      #voting{id = Id, end_time = EndTime,
	      voting_list = VotingList}
	  when Id > 0, Now =< EndTime ->
	  case lists:keyfind(Id, #voting_detail.id, VotingList) of
	    #voting_detail{role_voting = RoleVoting} ->
		case lists:keyfind(RoleId, 1, RoleVoting) of
		  {RoleId, _, _} -> {false, lang:get(<<"你已经投过票了"/utf8>>)};
		  _ -> ok
		end;
	    _ -> {false, lang:get(<<"当前不能投票"/utf8>>)}
	  end;
      #voting{id = Id, board_time = BoardTime}
	  when Id > 0, Now =< BoardTime ->
	  {false, lang:get(<<"当前在公告期，不能投票"/utf8>>)};
      _ -> {false, lang:get(<<"当前本服没有合服投票"/utf8>>)}
    end.

send_email(Voting = #voting{id = Id,
			    voting_list = VotingList}) ->
    case lists:keyfind(Id, #voting_detail.id, VotingList) of
      #voting_detail{role_voting = RoleVoting} ->
	  {_, _, AgreePoints, DisAgreePoints} =
	      vote_result(RoleVoting, 0, 0, 0, 0),
	  MailAgreeRadio = util:round((AgreePoints -
					 DisAgreePoints)
					/ max(1, AgreePoints + DisAgreePoints)
					* 100),
	  Now = date:unixtime(),
	  Content = case MailAgreeRadio < 0 of
		      true ->
			  color:msg(lang:get(<<"尊敬的冒险者您好！本次合服调查已经结束，投票结果已经产生，您所在的服务器~ts的合服意愿的"
					       "支持率为~ts，详情可前往主界面中调查问卷入口查看（仅当天可查看），合服与否请以后续游戏公"
					       "告通知为准。感谢您的参与，祝您游戏愉快！"/utf8>>),
				    [{blue, sys_env:get(zone_name)},
				     {green, lang:get(<<"小于0%"/utf8>>)}]);
		      _ ->
			  color:msg(lang:get(<<"尊敬的冒险者您好！本次合服调查已经结束，投票结果已经产生，您所在的服务器~ts的合服意愿的"
					       "支持率为~ts~ts，详情可前往主界面中调查问卷入口查看（仅当天可查看），合服与否请以后续"
					       "游戏公告通知为准。感谢您的参与，祝您游戏愉快！"/utf8>>),
				    [{blue, sys_env:get(zone_name)},
				     {green, MailAgreeRadio},
				     {green, lang:get(<<"%"/utf8>>)}])
		    end,
	  mail:global_send(#gmail{id = {voting, Id},
				  subject = lang:get(<<"合服调查投票结束通知"/utf8>>),
				  end_time = Now + 86400 * 7,
				  conds =
				      [{login_time_end, Now + 86400 * 1},
				       {reg_time_end, Now}],
				  content = Content}),
	  NewVoting = Voting#voting{is_email = 1},
	  update_voting(NewVoting);
      _ -> skip
    end.

vote_result([], AgreeNum, DisAgreeNum, AgreePoints,
	    DisAgreePoints) ->
    {AgreeNum, DisAgreeNum, AgreePoints, DisAgreePoints};
vote_result([{_, Vip, 1} | Rest], AgreeNum, DisAgreeNum,
	    AgreePoints, DisAgreePoints) ->
    Point = merge_voting_data:get_const(vote_point),
    case merge_voting_data:get_vip_points(Vip) of
      VipPoint when is_integer(VipPoint) ->
	  vote_result(Rest, AgreeNum + 1, DisAgreeNum,
		      Point + VipPoint + AgreePoints, DisAgreePoints);
      _ ->
	  vote_result(Rest, AgreeNum + 1, DisAgreeNum,
		      Point + AgreePoints, DisAgreePoints)
    end;
vote_result([{_, Vip, _} | Rest], AgreeNum, DisAgreeNum,
	    AgreePoints, DisAgreePoints) ->
    Point = merge_voting_data:get_const(vote_point),
    case merge_voting_data:get_vip_points(Vip) of
      VipPoint when is_integer(VipPoint) ->
	  vote_result(Rest, AgreeNum, DisAgreeNum + 1,
		      AgreePoints, Point + VipPoint + DisAgreePoints);
      _ ->
	  vote_result(Rest, AgreeNum, DisAgreeNum + 1,
		      AgreePoints, Point + DisAgreePoints)
    end;
vote_result(_, AgreeNum, DisAgreeNum, AgreePoints,
	    DisAgreePoints) ->
    {AgreeNum, DisAgreeNum, AgreePoints, DisAgreePoints}.

get_alive_num(StartTime, EndTime) ->
    Now = date:unixtime(),
    LastTime = Now - 86400 * 7,
    case
      db:get_one("select count(*) from role where (logout_time "
		 ">= ? and logout_time <= ?) or (login_time "
		 ">= ? and login_time <= ?) and lev > "
		 "70 and reg_time <= ?",
		 [StartTime, EndTime, StartTime, EndTime, LastTime],
		 60000)
	of
      {ok, Num} -> Num;
      _ -> 0
    end.

load_data() ->
    case dets:first(voting) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidvoting_mgr482, _,
	     {__Levelvoting_mgr482, __Tracesvoting_mgr482}}
		when __Levelvoting_mgr482 band 64 /= 0 orelse
		       __Tracesvoting_mgr482 /= [] ->
		lager:do_log(info,
			     [{module, voting_mgr}, {function, load_data},
			      {line, 482}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "没有数据需要加载", none, 4096, 64, __Levelvoting_mgr482,
			     __Tracesvoting_mgr482, lager_event,
			     __Pidvoting_mgr482);
	    _ -> ok
	  end,
	  [];
      _ ->
	  dets:traverse(voting,
			fun (C) ->
				case voting_ver:do(C) of
				  {false, Reason} ->
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
					{__Pidvoting_mgr489, _,
					 {__Levelvoting_mgr489,
					  __Tracesvoting_mgr489}}
					    when __Levelvoting_mgr489 band 8 /=
						   0
						   orelse
						   __Tracesvoting_mgr489 /=
						     [] ->
					    lager:do_log(error,
							 [{module, voting_mgr},
							  {function, load_data},
							  {line, 489},
							  {pid,
							   pid_to_list(self())},
							  {node, node()}
							  | lager:md()],
							 io_lib:format("合服投票数据转换失败:~w",
								       [Reason]),
							 none, 4096, 8,
							 __Levelvoting_mgr489,
							 __Tracesvoting_mgr489,
							 lager_event,
							 __Pidvoting_mgr489);
					_ -> ok
				      end,
				      {done, false};
				  {ok, NewC} -> update_voting(NewC), continue
				end
			end)
    end.


