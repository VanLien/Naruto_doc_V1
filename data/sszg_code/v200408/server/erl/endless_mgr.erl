-file("data/endless_mgr.erl", 1).

-file("src/mod/endless/endless_mgr.erl", 1).

-module(endless_mgr).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
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
		{state, [timer]}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0,
	 update_data/2, gm/0, gm/1, notice_merge_reward/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {timer = undefined}).

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

-file("src/mod/endless/endless_mgr.erl", 15).

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

-file("src/mod/endless/endless_mgr.erl", 16).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/endless/endless_mgr.erl", 17).

-file("inc/log.hrl", 1).

-file("src/mod/endless/endless_mgr.erl", 18).

gm() -> info(send_reward).

gm(merge_reward) -> info(merge_reward).

info(Info) -> endless_mgr ! Info.

cast(Info) -> gen_server:cast(endless_mgr, Info).

call(Info) ->
    case catch gen_server:call(endless_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidendless_mgr32, _,
	     {__Levelendless_mgr32, __Tracesendless_mgr32}}
		when __Levelendless_mgr32 band 8 /= 0 orelse
		       __Tracesendless_mgr32 /= [] ->
		lager:do_log(error,
			     [{module, endless_mgr}, {function, call},
			      {line, 32}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [endless_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelendless_mgr32,
			     __Tracesendless_mgr32, lager_event,
			     __Pidendless_mgr32);
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
    gen_server:start_link({local, endless_mgr}, endless_mgr,
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
      {__Pidendless_mgr38, _,
       {__Levelendless_mgr38, __Tracesendless_mgr38}}
	  when __Levelendless_mgr38 band 64 /= 0 orelse
		 __Tracesendless_mgr38 /= [] ->
	  lager:do_log(info,
		       [{module, endless_mgr}, {function, init}, {line, 38},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [endless_mgr]), none,
		       4096, 64, __Levelendless_mgr38, __Tracesendless_mgr38,
		       lager_event, __Pidendless_mgr38);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(endless_employ,
		   [{file, "./dets/endless_employ.dets"},
		    {keypos, #endless_employ.rid}]),
    ets:new(endless_employ,
	    [set, named_table, public,
	     {keypos, #endless_employ.rid}]),
    dets:to_ets(endless_employ, endless_employ),
    dets:open_file(endless_employ_point,
		   [{file, "./dets/endless_employ_point.dets"},
		    {keypos, 1}]),
    ets:new(endless_employ_point,
	    [set, named_table, public, {keypos, 1}]),
    dets:to_ets(endless_employ_point, endless_employ_point),
    Ref = erlang:send_after(date:next_diff(0, 0, 0) * 1000 +
			      util:rand(1, 3000),
			    endless_mgr, send_reward),
    State = #state{timer = Ref},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidendless_mgr49, _,
       {__Levelendless_mgr49, __Tracesendless_mgr49}}
	  when __Levelendless_mgr49 band 64 /= 0 orelse
		 __Tracesendless_mgr49 /= [] ->
	  lager:do_log(info,
		       [{module, endless_mgr}, {function, init}, {line, 49},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [endless_mgr]), none, 4096,
		       64, __Levelendless_mgr49, __Tracesendless_mgr49,
		       lager_event, __Pidendless_mgr49);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(send_reward,
	    State = #state{timer = Timer}) ->
    cancel_timer(Timer),
    RewardRoleList = get_type_idx([18, 52, 53, 54, 55], []),
    send_rank_reward(RewardRoleList),
    ets:delete_all_objects(endless_employ),
    dets:delete_all_objects(endless_employ),
    ets:delete_all_objects(endless_employ_point),
    dets:delete_all_objects(endless_employ_point),
    Ref = erlang:send_after(date:next_diff(0, 0, 0) * 1000 +
			      util:rand(1, 3000),
			    endless_mgr, send_reward),
    {noreply, State#state{timer = Ref}};
handle_info(merge_reward, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidendless_mgr69, _,
       {__Levelendless_mgr69, __Tracesendless_mgr69}}
	  when __Levelendless_mgr69 band 64 /= 0 orelse
		 __Tracesendless_mgr69 /= [] ->
	  lager:do_log(info,
		       [{module, endless_mgr}, {function, handle_info},
			{line, 69}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "合服结算无尽排行榜", none, 4096, 64, __Levelendless_mgr69,
		       __Tracesendless_mgr69, lager_event, __Pidendless_mgr69);
      _ -> ok
    end,
    RewardRoleList = get_type_idx([18, 52, 53, 54, 55], []),
    send_merge_reward(RewardRoleList),
    save_clear([18, 52, 53, 54, 55]),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    dets:insert(endless_employ,
		ets:tab2list(endless_employ)),
    dets:insert(endless_employ_point,
		ets:tab2list(endless_employ_point)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidendless_mgr80, _,
       {__Levelendless_mgr80, __Tracesendless_mgr80}}
	  when __Levelendless_mgr80 band 64 /= 0 orelse
		 __Tracesendless_mgr80 /= [] ->
	  lager:do_log(info,
		       [{module, endless_mgr}, {function, terminate},
			{line, 80}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelendless_mgr80,
		       __Tracesendless_mgr80, lager_event, __Pidendless_mgr80);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

send_rank_reward([]) -> ok;
send_rank_reward([{Rid, Idx, _UpdateTime, Type}
		  | Rest]) ->
    case endless_data:rank_reward({Type, Idx}) of
      Cfg when is_list(Cfg), Type =:= 5 ->
	  mail:send(Rid,
		    {lang:get(<<"Xếp hạng thử nghiệm toàn diện Phần thưởng "
				"giải quyết hàng ngày"/utf8>>),
		     color:msg(lang:get(<<"Nhà thám hiểm thân mến, bạn đã đạt được "
					  "~ts vị trí đầu tiên trong danh sách "
					  "xếp hạng thử nghiệm toàn diện ngày hôm "
					  "nay! Xin hãy nhận lấy phần thưởng vinh "
					  "hiển này！Chúc mừng！ (＾ ワ＾)つロ"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_rank_reward(Rest);
      Cfg when is_list(Cfg), Type =:= 1 ->
	  mail:send(Rid,
		    {lang:get(<<"Xếp hạng thử nghiệm nước Phần thưởng "
				"giải quyết hàng ngày"/utf8>>),
		     color:msg(lang:get(<<"Nhà thám hiểm thân mến, hôm nay bạn "
					  "đã lọt vào danh sách xếp hạng thử nước~tsKết "
					  "quả xuất sắc nổi tiếng! Xin hãy nhận "
					  "lấy phần thưởng vinh hiển này！Chúc mừng！ "
					  "(＾ ワ＾)つロ"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_rank_reward(Rest);
      Cfg when is_list(Cfg), Type =:= 2 ->
	  mail:send(Rid,
		    {lang:get(<<"Xếp hạng thử nghiệm lửa Phần thưởng "
				"giải quyết hàng ngày"/utf8>>),
		     color:msg(lang:get(<<"Nhà thám hiểm thân mến, hôm nay bạn "
					  "đã lọt vào danh sách xếp hạng thử lửa~tsKết "
					  "quả xuất sắc nổi tiếng! Xin hãy nhận "
					  "lấy phần thưởng vinh hiển này！Chúc mừng！ "
					  "(＾ ワ＾)つロ"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_rank_reward(Rest);
      Cfg when is_list(Cfg), Type =:= 3 ->
	  mail:send(Rid,
		    {lang:get(<<"Xếp hạng thử nghiệm gió Phần thưởng "
				"giải quyết hàng ngày"/utf8>>),
		     color:msg(lang:get(<<"Kính gửi nhà thám hiểm, bạn đã đạt được "
					  "những điều sau trong bảng xếp hạng thử "
					  "nghiệm gió ngày hôm nay~tsKết quả xuất "
					  "sắc nổi tiếng! Xin hãy nhận lấy phần "
					  "thưởng vinh hiển này！Chúc mừng！ (＾ ワ＾)つロ"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_rank_reward(Rest);
      Cfg when is_list(Cfg), Type =:= 4 ->
	  mail:send(Rid,
		    {lang:get(<<"Phần thưởng thanh toán hàng ngày cho "
				"bảng xếp hạng Thử thách Ánh sáng và "
				"Bóng tối"/utf8>>),
		     color:msg(lang:get(<<"Nhà thám hiểm thân mến, hôm nay bạn "
					  "đã có được~tsKết quả xuất sắc nổi tiếng! "
					  "Xin hãy nhận lấy phần thưởng vinh hiển "
					  "này！Chúc mừng！ (＾ ワ＾)つロ"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_rank_reward(Rest);
      Undef ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidendless_mgr106, _,
	     {__Levelendless_mgr106, __Tracesendless_mgr106}}
		when __Levelendless_mgr106 band 8 /= 0 orelse
		       __Tracesendless_mgr106 /= [] ->
		lager:do_log(error,
			     [{module, endless_mgr},
			      {function, send_rank_reward}, {line, 106},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("未知的无尽排行奖励id:~w, Idx:~w, Undef:~w， type:~w",
					   [Rid, Idx, Undef, Type]),
			     none, 4096, 8, __Levelendless_mgr106,
			     __Tracesendless_mgr106, lager_event,
			     __Pidendless_mgr106);
	    _ -> ok
	  end,
	  ok
    end.

send_merge_reward([]) -> ok;
send_merge_reward([{Rid, Idx, _UpdateTime, Type}
		   | Rest]) ->
    case endless_data:rank_reward({Type, Idx}) of
      Cfg when is_list(Cfg), Type =:= 5 ->
	  mail:send(Rid,
		    {lang:get(<<"综合试炼排行榜合服提前结算奖励"/utf8>>),
		     color:msg(lang:get(<<"尊敬的冒险者，您今日在综合试炼排行榜中获得了~ts名的的优异成绩！由于进行合服操作，提前发"
					  "放奖励，请查收！"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_merge_reward(Rest);
      Cfg when is_list(Cfg), Type =:= 1 ->
	  mail:send(Rid,
		    {lang:get(<<"水系试炼排行榜合服提前结算奖励"/utf8>>),
		     color:msg(lang:get(<<"尊敬的冒险者，您今日在水系试炼排行榜中获得了~ts名的的优异成绩！由于进行合服操作，提前发"
					  "放奖励，请查收！"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_merge_reward(Rest);
      Cfg when is_list(Cfg), Type =:= 2 ->
	  mail:send(Rid,
		    {lang:get(<<"火系试炼排行榜合服提前结算奖励"/utf8>>),
		     color:msg(lang:get(<<"尊敬的冒险者，您今日在火系试炼排行榜中获得了~ts名的的优异成绩！由于进行合服操作，提前发"
					  "放奖励，请查收！"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_merge_reward(Rest);
      Cfg when is_list(Cfg), Type =:= 3 ->
	  mail:send(Rid,
		    {lang:get(<<"风系试炼排行榜合服提前结算奖励"/utf8>>),
		     color:msg(lang:get(<<"尊敬的冒险者，您今日在风系试炼排行榜中获得了~ts名的的优异成绩！由于进行合服操作，提前发"
					  "放奖励，请查收！"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_merge_reward(Rest);
      Cfg when is_list(Cfg), Type =:= 4 ->
	  mail:send(Rid,
		    {lang:get(<<"光暗试炼排行榜合服提前结算奖励"/utf8>>),
		     color:msg(lang:get(<<"尊敬的冒险者，您今日在光暗试炼排行榜中获得了~ts名的的优异成绩！由于进行合服操作，提前发"
					  "放奖励，请查收！"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"Thử thách bất tận"/utf8>>}),
	  send_merge_reward(Rest);
      Undef ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidendless_mgr130, _,
	     {__Levelendless_mgr130, __Tracesendless_mgr130}}
		when __Levelendless_mgr130 band 8 /= 0 orelse
		       __Tracesendless_mgr130 /= [] ->
		lager:do_log(error,
			     [{module, endless_mgr},
			      {function, send_merge_reward}, {line, 130},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("未知的无尽排行奖励id:~w, Idx:~w, Undef:~w， type:~w",
					   [Rid, Idx, Undef, Type]),
			     none, 4096, 8, __Levelendless_mgr130,
			     __Tracesendless_mgr130, lager_event,
			     __Pidendless_mgr130);
	    _ -> ok
	  end,
	  ok
    end.

-spec update_data(Data :: [tuple()] | tuple(),
		  Type :: employ | point) -> ok.

update_data(Data, employ) ->
    ets:insert(endless_employ, Data),
    dets:insert(endless_employ, Data),
    ok;
update_data(Data, point) ->
    ets:insert(endless_employ_point, Data),
    dets:insert(endless_employ_point, Data),
    ok.

cancel_timer(Ref) when is_reference(Ref) ->
    catch erlang:cancel_timer(Ref), ok;
cancel_timer(_Ref) -> ok.

notice_merge_reward(_Args) ->
    endless_mgr:info(merge_reward), ok.

get_type_idx([], RewardRoleList) -> RewardRoleList;
get_type_idx([RankType | Rest], []) ->
    #rank{list = List} = rank_mgr:lookup(RankType),
    EndLessType = get_end_less_type(RankType),
    RewardRoleList = [{Rid, Idx, UpdateTime, EndLessType}
		      || #rank_rc{id = Rid, idx = Idx, time = UpdateTime}
			     <- List],
    get_type_idx(Rest, RewardRoleList);
get_type_idx([RankType | Rest], RewardRoleList) ->
    #rank{list = List} = rank_mgr:lookup(RankType),
    NewRewardRoleList = exchange_role_list(List,
					   RewardRoleList, RankType),
    get_type_idx(Rest, NewRewardRoleList).

exchange_role_list([], RewardRoleList, _RankType) ->
    RewardRoleList;
exchange_role_list([#rank_rc{id = Id, idx = Idx,
			     time = UpdateTime}
		    | Rest],
		   RewardRoleList, RankType) ->
    case lists:keyfind(Id, 1, RewardRoleList) of
      {Id, _OldIdx, OldUpdateTime, _OldEndLessType}
	  when UpdateTime > OldUpdateTime ->
	  EndLessType = get_end_less_type(RankType),
	  NewRewardRoleList = lists:keyreplace(Id, 1,
					       RewardRoleList,
					       {Id, Idx, UpdateTime,
						EndLessType}),
	  exchange_role_list(Rest, NewRewardRoleList, RankType);
      {Id, _OldIdx, _OldUpdateTime, _OldEndLessType} ->
	  exchange_role_list(Rest, RewardRoleList, RankType);
      _ ->
	  EndLessType = get_end_less_type(RankType),
	  exchange_role_list(Rest,
			     [{Id, Idx, UpdateTime, EndLessType}
			      | RewardRoleList],
			     RankType)
    end.

get_end_less_type(18) -> 5;
get_end_less_type(52) -> 1;
get_end_less_type(53) -> 2;
get_end_less_type(54) -> 3;
get_end_less_type(55) -> 4.

save_clear([]) -> ok;
save_clear([Type | Rest]) ->
    log_rank:save(Type),
    rank_mgr:clear(Type),
    save_clear(Rest).


