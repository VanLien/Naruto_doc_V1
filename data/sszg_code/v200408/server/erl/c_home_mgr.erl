-file("data/c_home_mgr.erl", 1).

-file("src/mod/home/c_home_mgr.erl", 1).

-module(c_home_mgr).

-lager_records([{home_unit_data,
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
		{state, []}]).

-behaviour(gen_server).

-export([sync_role/1, call_apply/1, apply/1]).

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

-file("src/mod/home/c_home_mgr.erl", 13).

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

-file("src/mod/home/c_home_mgr.erl", 14).

sync_role(RandVisit = #home_rand_visit{id = RoleId}) ->
    TabName = tab(RoleId),
    d_ets_lib:save_d_ets(TabName, RandVisit),
    ok.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> c_home_mgr ! Info.

cast(Info) -> gen_server:cast(c_home_mgr, Info).

call(Info) ->
    case catch gen_server:call(c_home_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_home_mgr37, _,
	     {__Levelc_home_mgr37, __Tracesc_home_mgr37}}
		when __Levelc_home_mgr37 band 8 /= 0 orelse
		       __Tracesc_home_mgr37 /= [] ->
		lager:do_log(error,
			     [{module, c_home_mgr}, {function, call},
			      {line, 37}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_home_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_home_mgr37,
			     __Tracesc_home_mgr37, lager_event,
			     __Pidc_home_mgr37);
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
    gen_server:start_link({local, c_home_mgr}, c_home_mgr,
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
      {__Pidc_home_mgr43, _,
       {__Levelc_home_mgr43, __Tracesc_home_mgr43}}
	  when __Levelc_home_mgr43 band 64 /= 0 orelse
		 __Tracesc_home_mgr43 /= [] ->
	  lager:do_log(info,
		       [{module, c_home_mgr}, {function, init}, {line, 43},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [c_home_mgr]), none, 4096,
		       64, __Levelc_home_mgr43, __Tracesc_home_mgr43,
		       lager_event, __Pidc_home_mgr43);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    open_ets(10),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_home_mgr50, _,
       {__Levelc_home_mgr50, __Tracesc_home_mgr50}}
	  when __Levelc_home_mgr50 band 64 /= 0 orelse
		 __Tracesc_home_mgr50 /= [] ->
	  lager:do_log(info,
		       [{module, c_home_mgr}, {function, init}, {line, 50},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [c_home_mgr]), none, 4096,
		       64, __Levelc_home_mgr50, __Tracesc_home_mgr50,
		       lager_event, __Pidc_home_mgr50);
      _ -> ok
    end,
    {ok, State}.

open_ets(0) -> ok;
open_ets(N) ->
    TabName = tab(N),
    d_ets_lib:new_d_ets(TabName,
			lists:concat(["./dets/c_home_rand_visit_", N, ".dets"]),
			#home_rand_visit.id, set),
    d_ets_lib:load_dets_to_ets(TabName, undefined),
    open_ets(N - 1).

tab({Rid, _}) -> tab(Rid);
tab(1) -> c_home_rand_visit_1;
tab(2) -> c_home_rand_visit_2;
tab(3) -> c_home_rand_visit_3;
tab(4) -> c_home_rand_visit_4;
tab(5) -> c_home_rand_visit_5;
tab(6) -> c_home_rand_visit_6;
tab(7) -> c_home_rand_visit_7;
tab(8) -> c_home_rand_visit_8;
tab(9) -> c_home_rand_visit_9;
tab(10) -> c_home_rand_visit_10;
tab(N) when is_integer(N) andalso N > 0 ->
    tab(N rem 10 + 1);
tab(_) -> c_home_rand_visit_1.

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
	    {__Pidc_home_mgr81, _,
	     {__Levelc_home_mgr81, __Tracesc_home_mgr81}}
		when __Levelc_home_mgr81 band 8 /= 0 orelse
		       __Tracesc_home_mgr81 /= [] ->
		lager:do_log(error,
			     [{module, c_home_mgr}, {function, handle_call},
			      {line, 81}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelc_home_mgr81,
			     __Tracesc_home_mgr81, lager_event,
			     __Pidc_home_mgr81);
	    _ -> ok
	  end,
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
	    {__Pidc_home_mgr93, _,
	     {__Levelc_home_mgr93, __Tracesc_home_mgr93}}
		when __Levelc_home_mgr93 band 8 /= 0 orelse
		       __Tracesc_home_mgr93 /= [] ->
		lager:do_log(error,
			     [{module, c_home_mgr}, {function, handle_info},
			      {line, 93}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelc_home_mgr93,
			     __Tracesc_home_mgr93, lager_event,
			     __Pidc_home_mgr93);
	    _ -> ok
	  end,
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
      {__Pidc_home_mgr98, _,
       {__Levelc_home_mgr98, __Tracesc_home_mgr98}}
	  when __Levelc_home_mgr98 band 64 /= 0 orelse
		 __Tracesc_home_mgr98 /= [] ->
	  lager:do_log(info,
		       [{module, c_home_mgr}, {function, terminate},
			{line, 98}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_home_mgr98,
		       __Tracesc_home_mgr98, lager_event, __Pidc_home_mgr98);
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
	    {__Pidc_home_mgr110, _,
	     {__Levelc_home_mgr110, __Tracesc_home_mgr110}}
		when __Levelc_home_mgr110 band 8 /= 0 orelse
		       __Tracesc_home_mgr110 /= [] ->
		lager:do_log(error,
			     [{module, c_home_mgr}, {function, do_handle_call},
			      {line, 110}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_home_mgr110,
			     __Tracesc_home_mgr110, lager_event,
			     __Pidc_home_mgr110);
	    _ -> ok
	  end,
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
    end;
do_handle_call(get_rand_visit, _From, State) ->
    RandId = util:rand(1, 10),
    TabName = tab(RandId),
    NewMatchList = case util:get(TabName, '$end_of_table')
		       of
		     Continuation when is_tuple(Continuation) ->
			 case ets:match(Continuation) of
			   {MatchList, NewContinuation} ->
			       NewMatchListT = [Match || [Match] <- MatchList],
			       put(TabName, NewContinuation),
			       NewMatchListT;
			   _ ->
			       case ets:match(TabName, '$1', 10) of
				 {MatchList, NewContinuation} ->
				     NewMatchListT = [Match
						      || [Match] <- MatchList],
				     put(TabName, NewContinuation),
				     NewMatchListT;
				 _ -> put(TabName, '$end_of_table'), []
			       end
			 end;
		     _ ->
			 case ets:match(TabName, '$1', 10) of
			   {MatchList, NewContinuation} ->
			       NewMatchListT = [Match || [Match] <- MatchList],
			       put(TabName, NewContinuation),
			       NewMatchListT;
			   _ -> put(TabName, '$end_of_table'), []
			 end
		   end,
    {reply, {ok, NewMatchList}, State};
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
	    {__Pidc_home_mgr159, _,
	     {__Levelc_home_mgr159, __Tracesc_home_mgr159}}
		when __Levelc_home_mgr159 band 8 /= 0 orelse
		       __Tracesc_home_mgr159 /= [] ->
		lager:do_log(error,
			     [{module, c_home_mgr}, {function, do_handle_info},
			      {line, 159}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_home_mgr159,
			     __Tracesc_home_mgr159, lager_event,
			     __Pidc_home_mgr159);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.


