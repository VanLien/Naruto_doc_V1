-file("data/c_partner_rand_mgr.erl", 1).

-file("src/mod/partner_rand/c_partner_rand_mgr.erl", 1).

-module(c_partner_rand_mgr).

-lager_records([{partner_rand,
		 [ver, id, bid, role_id, name, lev, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{partner_rand_match,
		 [id, bid, role_id, lev, star, power]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{state, [next_num]}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([print_num/1]).

-export([match_tab/1, tab/1]).

-record(state, {next_num = 1}).

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

-file("src/mod/partner_rand/c_partner_rand_mgr.erl",
      18).

-file("inc/partner_rand.hrl", 1).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("inc/partner_rand.hrl", 8).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("inc/partner_rand.hrl", 9).

-file("inc/common.hrl", 1).

-file("inc/partner_rand.hrl", 10).

-record(partner_rand_match,
	{id = 0  :: pos_integer(), bid = 1  :: pos_integer(),
	 role_id = {0, <<>>}  :: pos_integer(),
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 power = 1  :: pos_integer()}).

-record(partner_rand,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 bid = 1  :: pos_integer(),
	 role_id = {0, <<>>}  :: pos_integer(), name = <<>>,
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/partner_rand/c_partner_rand_mgr.erl",
      19).

print_num(tab) ->
    [io:format("~ts",
	       [io_lib:format("~w => ~w~n",
			      [tab(Id), ets:info(tab(Id), size)])])
     || Id <- lists:seq(1, 20)],
    ok;
print_num(tab2) ->
    [io:format("~ts",
	       [io_lib:format("~w => ~w~n",
			      [tab(Id), dets:info(tab(Id), size)])])
     || Id <- lists:seq(1, 20)],
    ok;
print_num(match_tab) ->
    [io:format("~ts",
	       [io_lib:format("~w => ~w~n",
			      [match_tab(Id), ets:info(match_tab(Id), size)])])
     || Id <- lists:seq(1, 5)],
    ok.

update_ets(Tab, Data, reset_all) ->
    ets:delete_all_objects(Tab),
    dets:delete_all_objects(Tab),
    update_ets(Tab, Data, ets),
    update_ets(Tab, Data, dets);
update_ets(Tab, Data, all) ->
    update_ets(Tab, Data, ets), update_ets(Tab, Data, dets);
update_ets(Tab, Data, ets) -> ets:insert(Tab, Data);
update_ets(Tab, Data, dets) -> dets:insert(Tab, Data).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> c_partner_rand_mgr ! Info.

cast(Info) -> gen_server:cast(c_partner_rand_mgr, Info).

call(Info) ->
    case catch gen_server:call(c_partner_rand_mgr, Info,
			       10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_partner_rand_mgr60, _,
	     {__Levelc_partner_rand_mgr60,
	      __Tracesc_partner_rand_mgr60}}
		when __Levelc_partner_rand_mgr60 band 8 /= 0 orelse
		       __Tracesc_partner_rand_mgr60 /= [] ->
		lager:do_log(error,
			     [{module, c_partner_rand_mgr}, {function, call},
			      {line, 60}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_partner_rand_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_partner_rand_mgr60,
			     __Tracesc_partner_rand_mgr60, lager_event,
			     __Pidc_partner_rand_mgr60);
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
    gen_server:start_link({local, c_partner_rand_mgr},
			  c_partner_rand_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_partner_rand_mgr66, _,
       {__Levelc_partner_rand_mgr66,
	__Tracesc_partner_rand_mgr66}}
	  when __Levelc_partner_rand_mgr66 band 64 /= 0 orelse
		 __Tracesc_partner_rand_mgr66 /= [] ->
	  lager:do_log(info,
		       [{module, c_partner_rand_mgr}, {function, init},
			{line, 66}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [c_partner_rand_mgr]),
		       none, 4096, 64, __Levelc_partner_rand_mgr66,
		       __Tracesc_partner_rand_mgr66, lager_event,
		       __Pidc_partner_rand_mgr66);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_ets(c_partner_rand_num, 1, set),
    open_match_ets(5),
    open_ets(20),
    NextNum = sys_env:get(c_partner_rand_mgr, 1),
    State = #state{next_num = NextNum},
    ResetTime = sys_env:get(c_partner_rand_reset_time, 0),
    util:set_timer(c_partner_rand_reset_time,
		   max(0, ResetTime - date:unixtime()),
		   c_partner_rand_reset_time),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_partner_rand_mgr84, _,
       {__Levelc_partner_rand_mgr84,
	__Tracesc_partner_rand_mgr84}}
	  when __Levelc_partner_rand_mgr84 band 64 /= 0 orelse
		 __Tracesc_partner_rand_mgr84 /= [] ->
	  lager:do_log(info,
		       [{module, c_partner_rand_mgr}, {function, init},
			{line, 84}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [c_partner_rand_mgr]), none,
		       4096, 64, __Levelc_partner_rand_mgr84,
		       __Tracesc_partner_rand_mgr84, lager_event,
		       __Pidc_partner_rand_mgr84);
      _ -> ok
    end,
    {ok, State}.

open_match_ets(0) -> ok;
open_match_ets(N) ->
    TabName = match_tab(N),
    ets:new(TabName,
	    [set, named_table, public,
	     {keypos, #partner_rand_match.id}]),
    open_match_ets(N - 1).

open_ets(0) -> ok;
open_ets(N) ->
    TabName = tab(N),
    dets:open_file(TabName,
		   [{file,
		     lists:concat(["./dets/c_partner_rand_", N, ".dets"])},
		    {keypos, #partner_rand.id}, {type, set}]),
    ets:new(TabName,
	    [set, named_table, public, {keypos, #partner_rand.id}]),
    Fun = fun (Data) ->
		  NewData = #partner_rand{id = Id, bid = Bid, star = Star,
					  power = Power} =
				do_ver(Data),
		  update_ets(TabName, NewData, ets),
		  update_ets(match_tab(Id), to_match_data(NewData), ets),
		  {PowerType, _MaxNum} =
		      partner_rand_lib:get_power_type(Power, Star),
		  OldNum = get_num({Bid, Star, PowerType}),
		  NewNum = OldNum + 1,
		  update_ets(c_partner_rand_num,
			     {{Bid, Star, PowerType}, NewNum}, ets),
		  continue
	  end,
    dets:traverse(TabName, Fun),
    open_ets(N - 1).

do_ver(Data = #partner_rand{ver = 1}) -> Data.

to_match_data(#partner_rand{id = Id, bid = Bid,
			    role_id = RoleId, lev = Lev, star = Star,
			    power = Power}) ->
    #partner_rand_match{id = Id, bid = Bid,
			role_id = RoleId, lev = Lev, star = Star,
			power = Power}.

tab(1) -> c_partner_rand_1;
tab(2) -> c_partner_rand_2;
tab(3) -> c_partner_rand_3;
tab(4) -> c_partner_rand_4;
tab(5) -> c_partner_rand_5;
tab(6) -> c_partner_rand_6;
tab(7) -> c_partner_rand_7;
tab(8) -> c_partner_rand_8;
tab(9) -> c_partner_rand_9;
tab(10) -> c_partner_rand_10;
tab(11) -> c_partner_rand_11;
tab(12) -> c_partner_rand_12;
tab(13) -> c_partner_rand_13;
tab(14) -> c_partner_rand_14;
tab(15) -> c_partner_rand_15;
tab(16) -> c_partner_rand_16;
tab(17) -> c_partner_rand_17;
tab(18) -> c_partner_rand_18;
tab(19) -> c_partner_rand_19;
tab(20) -> c_partner_rand_20;
tab(N) when N > 20 -> tab(N rem 20 + 1).

match_tab(1) -> c_partner_rand_match_1;
match_tab(2) -> c_partner_rand_match_2;
match_tab(3) -> c_partner_rand_match_3;
match_tab(4) -> c_partner_rand_match_4;
match_tab(5) -> c_partner_rand_match_5;
match_tab(N) when N > 5 -> match_tab(N rem 5 + 1).

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
	    {__Pidc_partner_rand_mgr170, _,
	     {__Levelc_partner_rand_mgr170,
	      __Tracesc_partner_rand_mgr170}}
		when __Levelc_partner_rand_mgr170 band 8 /= 0 orelse
		       __Tracesc_partner_rand_mgr170 /= [] ->
		lager:do_log(error,
			     [{module, c_partner_rand_mgr},
			      {function, handle_call}, {line, 170},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelc_partner_rand_mgr170,
			     __Tracesc_partner_rand_mgr170, lager_event,
			     __Pidc_partner_rand_mgr170);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    c_partner_rand_mgr, 171, _Reason}),
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
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
	    {__Pidc_partner_rand_mgr183, _,
	     {__Levelc_partner_rand_mgr183,
	      __Tracesc_partner_rand_mgr183}}
		when __Levelc_partner_rand_mgr183 band 8 /= 0 orelse
		       __Tracesc_partner_rand_mgr183 /= [] ->
		lager:do_log(error,
			     [{module, c_partner_rand_mgr},
			      {function, handle_info}, {line, 183},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelc_partner_rand_mgr183,
			     __Tracesc_partner_rand_mgr183, lager_event,
			     __Pidc_partner_rand_mgr183);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    c_partner_rand_mgr, 184, _Reason}),
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
      {__Pidc_partner_rand_mgr189, _,
       {__Levelc_partner_rand_mgr189,
	__Tracesc_partner_rand_mgr189}}
	  when __Levelc_partner_rand_mgr189 band 64 /= 0 orelse
		 __Tracesc_partner_rand_mgr189 /= [] ->
	  lager:do_log(info,
		       [{module, c_partner_rand_mgr}, {function, terminate},
			{line, 189}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_partner_rand_mgr189,
		       __Tracesc_partner_rand_mgr189, lager_event,
		       __Pidc_partner_rand_mgr189);
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
	    {__Pidc_partner_rand_mgr201, _,
	     {__Levelc_partner_rand_mgr201,
	      __Tracesc_partner_rand_mgr201}}
		when __Levelc_partner_rand_mgr201 band 8 /= 0 orelse
		       __Tracesc_partner_rand_mgr201 /= [] ->
		lager:do_log(error,
			     [{module, c_partner_rand_mgr},
			      {function, do_handle_call}, {line, 201},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_partner_rand_mgr201,
			     __Tracesc_partner_rand_mgr201, lager_event,
			     __Pidc_partner_rand_mgr201);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    c_partner_rand_mgr, 202, _Reason}),
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
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
	    {__Pidc_partner_rand_mgr215, _,
	     {__Levelc_partner_rand_mgr215,
	      __Tracesc_partner_rand_mgr215}}
		when __Levelc_partner_rand_mgr215 band 8 /= 0 orelse
		       __Tracesc_partner_rand_mgr215 /= [] ->
		lager:do_log(error,
			     [{module, c_partner_rand_mgr},
			      {function, do_handle_info}, {line, 215},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_partner_rand_mgr215,
			     __Tracesc_partner_rand_mgr215, lager_event,
			     __Pidc_partner_rand_mgr215);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    c_partner_rand_mgr, 216, _Reason}),
	  {noreply, State}
    end;
do_handle_info({sync_data, FromPid}, State) ->
    FromPid !
      {sync_status_to_zone, ets:tab2list(c_partner_rand_num)},
    {noreply, State};
do_handle_info({push_partner, PushL},
	       State = #state{next_num = NextNum}) ->
    NewNextNum = do_update_data(PushL, NextNum),
    DoDelNum = NewNextNum - NextNum,
    case get(need_del_ids) of
      L = [_ | _] ->
	  {DelIds, OtherIds} = list_util:split(DoDelNum, L),
	  [{ets:delete(match_tab(Id), Id),
	    ets:delete(tab(Id), Id)}
	   || Id <- DelIds],
	  put(need_del_ids, OtherIds);
      _ -> skip
    end,
    sys_env:save(c_partner_rand_mgr, NewNextNum),
    {noreply, State#state{next_num = NewNextNum}};
do_handle_info({del_partner, N}, State) when N < 21 ->
    EtsTab = tab(N),
    Fun = fun (#partner_rand{id = Id, eqms = Eqm}, Acc) ->
		  case length(Eqm) < 4 of
		    true -> [Id | Acc];
		    _ -> Acc
		  end
	  end,
    Ids = ets:foldl(Fun, [], EtsTab),
    put(del_partner_ids, Ids),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_partner_rand_mgr248, _,
       {__Levelc_partner_rand_mgr248,
	__Tracesc_partner_rand_mgr248}}
	  when __Levelc_partner_rand_mgr248 band 64 /= 0 orelse
		 __Tracesc_partner_rand_mgr248 /= [] ->
	  lager:do_log(info,
		       [{module, c_partner_rand_mgr},
			{function, do_handle_info}, {line, 248},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("del_partner==~w  ~w", [N, length(Ids)]),
		       none, 4096, 64, __Levelc_partner_rand_mgr248,
		       __Tracesc_partner_rand_mgr248, lager_event,
		       __Pidc_partner_rand_mgr248);
      _ -> ok
    end,
    util:set_ms_timer(del_partner_timer, 100,
		      {do_del_partner, N}),
    {noreply, State};
do_handle_info({do_del_partner, N}, State) ->
    case erase(del_partner_ids) of
      [Id | T] ->
	  case ets:lookup(tab(N), Id) of
	    [#partner_rand{bid = Bid, star = Star,
			   power = Power}] ->
		{PowerType, MaxNum} =
		    partner_rand_lib:get_power_type(Power, Star),
		OldNum = get_num({Bid, Star, PowerType}),
		NewNum = max(OldNum - 1, 0),
		ets:delete(match_tab(N), Id),
		ets:delete(tab(N), Id),
		dets:delete(tab(N), Id),
		update_ets(c_partner_rand_num,
			   {{Bid, Star, PowerType}, NewNum}, ets),
		cluster_lib:cast(all, partner_rand_mgr, info,
				 [{update_max_num,
				   {Bid, Star, PowerType, MaxNum}}]);
	    _ -> skip
	  end,
	  util:set_ms_timer(del_partner_timer, 500,
			    {do_del_partner, N}),
	  put(del_partner_ids, T);
      _ ->
	  util:set_ms_timer(del_partner_timer, 100,
			    {del_partner, N + 1})
    end,
    {noreply, State};
do_handle_info(c_partner_rand_reset_time, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_partner_rand_mgr275, _,
       {__Levelc_partner_rand_mgr275,
	__Tracesc_partner_rand_mgr275}}
	  when __Levelc_partner_rand_mgr275 band 64 /= 0 orelse
		 __Tracesc_partner_rand_mgr275 /= [] ->
	  lager:do_log(info,
		       [{module, c_partner_rand_mgr},
			{function, do_handle_info}, {line, 275},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "中央服重置了英雄池数据", none, 4096, 64,
		       __Levelc_partner_rand_mgr275,
		       __Tracesc_partner_rand_mgr275, lager_event,
		       __Pidc_partner_rand_mgr275);
      _ -> ok
    end,
    List = lists:seq(1, 20),
    [dets:delete_all_objects(tab(Num)) || Num <- List],
    Fun1 = fun (#partner_rand_match{id = Id}, Acc) ->
		   [Id | Acc]
	   end,
    Fun = fun (Num, Acc) ->
		  EtsTab = match_tab(Num),
		  Ids = ets:foldl(Fun1, [], EtsTab),
		  Ids ++ Acc
	  end,
    NeedDelIds = lists:foldl(Fun, [], lists:seq(1, 5)),
    put(need_del_ids, NeedDelIds),
    ets:delete_all_objects(c_partner_rand_num),
    catch cluster_lib:cast(all, partner_rand_mgr, info,
			   [c_partner_rand_do_rester]),
    Now = date:unixtime(),
    TimeOut = date:week_next_diff([6], {7, 0, 1}),
    ResetTime = Now + TimeOut + util:rand(1, 1800),
    sys_env:save(c_partner_rand_reset_time, ResetTime),
    util:set_timer(c_partner_rand_reset_time,
		   max(0, ResetTime - Now), c_partner_rand_reset_time),
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

do_update_data([], NextNum) -> NextNum;
do_update_data([DataT = #partner_rand{bid = Bid,
				      star = Star, power = Power}
		| PushL],
	       NextNum) ->
    {PowerType, MaxNum} =
	partner_rand_lib:get_power_type(Power, Star),
    OldNum = get_num({Bid, Star, PowerType}),
    case get_num({Bid, Star, PowerType}) of
      OldNum when OldNum > MaxNum ->
	  do_update_data(PushL, NextNum);
      OldNum ->
	  Data = DataT#partner_rand{id = NextNum},
	  NewNum = OldNum + 1,
	  update_ets(c_partner_rand_num,
		     {{Bid, Star, PowerType}, NewNum}, ets),
	  case NewNum >= MaxNum of
	    true ->
		cluster_lib:cast(all, partner_rand_mgr, info,
				 [{update_max_num,
				   {Bid, Star, PowerType, MaxNum}}]);
	    _ -> skip
	  end,
	  update_ets(tab(NextNum), Data, all),
	  update_ets(match_tab(NextNum), to_match_data(Data),
		     ets),
	  do_update_data(PushL, NextNum + 1)
    end.

get_num({Bid, Star, PowerType}) ->
    case ets:lookup(c_partner_rand_num,
		    {Bid, Star, PowerType})
	of
      [{_, OldNum}] -> OldNum;
      _ -> 0
    end.


