-file("src/mod/recruit/recruit_mgr.erl", 1).

-module(recruit_mgr).

-lager_records([{state, []},
		{recruit_limit, [key, info]},
		{holiday_info, [camp_id, stats, ext]},
		{recruit_info, [group_id, stats, ext]},
		{m_recruit_award, [ver, list]},
		{m_recruit,
		 [ver, free_cd_end, list, convert_list, convert_state,
		  holiday_list, holy_eqm_lottery, logs,
		  holiday_sprite_lottery_list, lucky_sprites,
		  lucky_holy_eqm, all_score]}]).

-behaviour(gen_server).

-export([start_link/0, call/1, lookup/1,
	 lookup_holiday/1, lookup_holiday_sprite/1, lookup/2,
	 save/1, save_holiday/1, save_holiday_sprite/1, save/2,
	 delete/1, delete_holiday/1, delete_holiday_sprite/1,
	 delete/2, gm_check_info/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/recruit/recruit_mgr.erl", 37).

-file("inc/recruit.hrl", 1).

-record(m_recruit,
	{ver = 7, free_cd_end = 0, list = [], convert_list = [],
	 convert_state = [], holiday_list = [],
	 holy_eqm_lottery = [], logs = [],
	 holiday_sprite_lottery_list = [], lucky_sprites = [],
	 lucky_holy_eqm = [], all_score = 0}).

-record(m_recruit_award, {ver = 1, list = []}).

-record(recruit_info,
	{group_id = 0, stats = #{}, ext = #{}}).

-record(holiday_info,
	{camp_id = 0, stats = #{}, ext = #{}}).

-record(recruit_limit, {key, info = #{}}).

-file("src/mod/recruit/recruit_mgr.erl", 38).

-record(state, {}).

gm_check_info() ->
    Fun = fun (#recruit_limit{key = {{Id, Sid}, CampId},
			      info = LimitInfo},
	       Acc) ->
		  case CampId == 46022 of
		    true ->
			IdLimit1 = maps:get(1060, LimitInfo, undefined1),
			IdLimit2 = maps:get(1062, LimitInfo, undefined2),
			case IdLimit1 == IdLimit2 of
			  true ->
			      io:format("~ts",
					[io_lib:format("id:{~w, ~ts}  数据:~w~n",
						       [Id, Sid, IdLimit2])]),
			      Acc;
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    ets:foldl(Fun, [], recruit_limit_holiday).

-spec lookup({RoleId :: tuple(),
	      GroupId :: integer()}) -> {ok, Obj :: #recruit_limit{}}.

lookup(Key) -> lookup(recruit_limit, Key).

-spec lookup_holiday({RoleId :: tuple(),
		      CampId :: integer()}) -> {ok, Obj :: #recruit_limit{}}.

lookup_holiday(Key) ->
    lookup(recruit_limit_holiday, Key).

-spec lookup_holiday_sprite({RoleId :: tuple(),
			     CampId :: integer()}) -> {ok,
						       Obj :: #recruit_limit{}}.

lookup_holiday_sprite(Key) ->
    lookup(holiday_sprite_limit_lottery, Key).

-spec lookup(atom(), term()) -> {ok, Obj :: term()}.

lookup(Tab, Key) ->
    try case ets:lookup(Tab, Key) of
	  [Obj] -> {ok, Obj};
	  _ ->
	      case dets:lookup(Tab, Key) of
		[Obj] -> ets:insert(Tab, Obj), {ok, Obj};
		[] -> false
	      end
	end
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrecruit_mgr93, _,
	     {__Levelrecruit_mgr93, __Tracesrecruit_mgr93}}
		when __Levelrecruit_mgr93 band 8 /= 0 orelse
		       __Tracesrecruit_mgr93 /= [] ->
		lager:do_log(error,
			     [{module, recruit_mgr}, {function, lookup},
			      {line, 93}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("查找[Tab:~w]数据错误[Type:~w][Err:~w][Key:~w]",
					   [Tab, Type, Err, Key]),
			     none, 4096, 8, __Levelrecruit_mgr93,
			     __Tracesrecruit_mgr93, lager_event,
			     __Pidrecruit_mgr93);
	    _ -> ok
	  end,
	  false
    end.

-spec save(#recruit_limit{} |
	   [#recruit_limit{}]) -> ok | false.

save(Objs) -> save(recruit_limit, Objs).

-spec save_holiday(#recruit_limit{} |
		   [#recruit_limit{}]) -> ok | false.

save_holiday(Objs) -> save(recruit_limit_holiday, Objs).

-spec save_holiday_sprite(#recruit_limit{} |
			  [#recruit_limit{}]) -> ok | false.

save_holiday_sprite(Objs) ->
    save(holiday_sprite_limit_lottery, Objs).

-spec save(atom(), term() | [term()]) -> ok | false.

save(Tab, Objs) ->
    try ets:insert(Tab, Objs), dets:insert(Tab, Objs), ok
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrecruit_mgr118, _,
	     {__Levelrecruit_mgr118, __Tracesrecruit_mgr118}}
		when __Levelrecruit_mgr118 band 8 /= 0 orelse
		       __Tracesrecruit_mgr118 /= [] ->
		lager:do_log(error,
			     [{module, recruit_mgr}, {function, save},
			      {line, 118}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("保存[Tab:~w]数据错误[Type:~w][Err:~w][Objs:~w]",
					   [Tab, Type, Err, Objs]),
			     none, 4096, 8, __Levelrecruit_mgr118,
			     __Tracesrecruit_mgr118, lager_event,
			     __Pidrecruit_mgr118);
	    _ -> ok
	  end,
	  false
    end.

-spec delete({RoleId :: tuple(),
	      GroupId :: integer()}) -> ok | false.

delete(Key) -> delete(recruit_limit, Key).

-spec delete_holiday({RoleId :: tuple(),
		      GroupId :: integer()}) -> ok | false.

delete_holiday(Key) ->
    delete(recruit_limit_holiday, Key).

-spec delete_holiday_sprite({RoleId :: tuple(),
			     GroupId :: integer()}) -> ok | false.

delete_holiday_sprite(Key) ->
    delete(holiday_sprite_limit_lottery, Key).

-spec delete(atom(), term()) -> ok | false.

delete(Tab, Key) ->
    try ets:delete(Tab, Key), dets:delete(Tab, Key), ok
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrecruit_mgr143, _,
	     {__Levelrecruit_mgr143, __Tracesrecruit_mgr143}}
		when __Levelrecruit_mgr143 band 8 /= 0 orelse
		       __Tracesrecruit_mgr143 /= [] ->
		lager:do_log(error,
			     [{module, recruit_mgr}, {function, delete},
			      {line, 143}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("删除[Tab:~w]数据错误[Type:~w][Err:~w][Key:~w]",
					   [Tab, Type, Err, Key]),
			     none, 4096, 8, __Levelrecruit_mgr143,
			     __Tracesrecruit_mgr143, lager_event,
			     __Pidrecruit_mgr143);
	    _ -> ok
	  end,
	  false
    end.

call(Info) ->
    case catch gen_server:call(recruit_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrecruit_mgr149, _,
	     {__Levelrecruit_mgr149, __Tracesrecruit_mgr149}}
		when __Levelrecruit_mgr149 band 8 /= 0 orelse
		       __Tracesrecruit_mgr149 /= [] ->
		lager:do_log(error,
			     [{module, recruit_mgr}, {function, call},
			      {line, 149}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [recruit_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelrecruit_mgr149,
			     __Tracesrecruit_mgr149, lager_event,
			     __Pidrecruit_mgr149);
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
    gen_server:start_link({local, recruit_mgr}, recruit_mgr,
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
      {__Pidrecruit_mgr160, _,
       {__Levelrecruit_mgr160, __Tracesrecruit_mgr160}}
	  when __Levelrecruit_mgr160 band 64 /= 0 orelse
		 __Tracesrecruit_mgr160 /= [] ->
	  lager:do_log(info,
		       [{module, recruit_mgr}, {function, init}, {line, 160},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]正在启动...", [recruit_mgr]), none, 4096,
		       64, __Levelrecruit_mgr160, __Tracesrecruit_mgr160,
		       lager_event, __Pidrecruit_mgr160);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    case catch load_data() of
      ok ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrecruit_mgr164, _,
	     {__Levelrecruit_mgr164, __Tracesrecruit_mgr164}}
		when __Levelrecruit_mgr164 band 64 /= 0 orelse
		       __Tracesrecruit_mgr164 /= [] ->
		lager:do_log(info,
			     [{module, recruit_mgr}, {function, init},
			      {line, 164}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]启动完成", [recruit_mgr]), none,
			     4096, 64, __Levelrecruit_mgr164,
			     __Tracesrecruit_mgr164, lager_event,
			     __Pidrecruit_mgr164);
	    _ -> ok
	  end,
	  {ok, #state{}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrecruit_mgr167, _,
	     {__Levelrecruit_mgr167, __Tracesrecruit_mgr167}}
		when __Levelrecruit_mgr167 band 8 /= 0 orelse
		       __Tracesrecruit_mgr167 /= [] ->
		lager:do_log(error,
			     [{module, recruit_mgr}, {function, init},
			      {line, 167}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]启动失败[Err:~w]",
					   [recruit_mgr, Err]),
			     none, 4096, 8, __Levelrecruit_mgr167,
			     __Tracesrecruit_mgr167, lager_event,
			     __Pidrecruit_mgr167);
	    _ -> ok
	  end,
	  {stop, abnormal}
    end.

handle_call({add, CampId, Times}, _From, State) ->
    OldTimes = sys_env:get({holiday_recruit, CampId}, 0),
    NewTimes = OldTimes + Times,
    sys_env:save({holiday_recruit, CampId}, NewTimes),
    {reply, {OldTimes, NewTimes}, State};
handle_call({add_sprite, CampId, Times}, _From,
	    State) ->
    OldTimes = sys_env:get({holiday_sprite_lottery, CampId},
			   0),
    NewTimes = OldTimes + Times,
    sys_env:save({holiday_sprite_lottery, CampId},
		 NewTimes),
    {reply, {OldTimes, NewTimes}, State};
handle_call(_Request, _From, State) ->
    Reply = ok, {reply, Reply, State}.

handle_cast(_Request, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(Reason, _State) ->
    util:close_dets(recruit_limit),
    util:close_dets(recruit_limit_holiday),
    util:close_dets(holiday_sprite_limit_lottery),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrecruit_mgr196, _,
       {__Levelrecruit_mgr196, __Tracesrecruit_mgr196}}
	  when __Levelrecruit_mgr196 band 64 /= 0 orelse
		 __Tracesrecruit_mgr196 /= [] ->
	  lager:do_log(info,
		       [{module, recruit_mgr}, {function, terminate},
			{line, 196}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]完成关闭:~w", [recruit_mgr, Reason]),
		       none, 4096, 64, __Levelrecruit_mgr196,
		       __Tracesrecruit_mgr196, lager_event,
		       __Pidrecruit_mgr196);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    {ok, recruit_limit} = dets:open_file(recruit_limit,
					 [{file, "dets/recruit_limit.dets"},
					  {keypos, #recruit_limit.key}]),
    recruit_limit = ets:new(recruit_limit,
			    [set, named_table, public,
			     {keypos, #recruit_limit.key}]),
    {ok, recruit_limit_holiday} =
	dets:open_file(recruit_limit_holiday,
		       [{file, "dets/recruit_limit_holiday.dets"},
			{keypos, #recruit_limit.key}]),
    recruit_limit_holiday = ets:new(recruit_limit_holiday,
				    [set, named_table, public,
				     {keypos, #recruit_limit.key}]),
    {ok, holiday_sprite_limit_lottery} =
	dets:open_file(holiday_sprite_limit_lottery,
		       [{file, "dets/holiday_sprite_limit_lottery.dets"},
			{keypos, #recruit_limit.key}]),
    holiday_sprite_limit_lottery =
	ets:new(holiday_sprite_limit_lottery,
		[set, named_table, public,
		 {keypos, #recruit_limit.key}]),
    ok.


