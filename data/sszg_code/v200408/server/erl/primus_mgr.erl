-file("src/mod/primus/primus_mgr.erl", 1).

-module(primus_mgr).

-lager_records([{primus_log,
		 [role_id, name, lev, face_id, power, num, replay_id,
		  formation_type, formation_lev, partner_list, time, ret,
		  face_update_time, face_file]},
		{primus,
		 [pos, num, status, look_id, role_id, name, lev, face_id,
		  power, face_update_time, face_file]},
		{state, []}]).

-behaviour(gen_server).

-export([is_on_pos/1, lookup/1, get_logs/1,
	 async_exec/3, merge_convert/1]).

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

-file("src/mod/primus/primus_mgr.erl", 13).

-file("inc/primus.hrl", 1).

-record(primus,
	{pos = 1  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 look_id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: binary(), lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), face_update_time = 0,
	 face_file = <<>>}).

-record(primus_log,
	{role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: binary(), lev = 0  :: non_neg_integer(),
	 face_id  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 replay_id = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 formation_lev = 0  :: non_neg_integer(),
	 partner_list = []  :: list(),
	 time = 0  :: non_neg_integer(),
	 ret = 1  :: non_neg_integer(), face_update_time = 0,
	 face_file = <<>>}).

-file("src/mod/primus/primus_mgr.erl", 14).

-spec is_on_pos(RoleId :: non_neg_integer()) -> true |
						false.

is_on_pos(RoleId) ->
    case ets:match_object(primus,
			  #primus{role_id = RoleId, _ = '_'})
	of
      [_ | _] -> true;
      _ -> false
    end.

-spec lookup(Pos :: non_neg_integer()) -> {ok,
					   #primus{}} |
					  false.

lookup(Pos) ->
    case ets:lookup(primus, Pos) of
      [P] -> {ok, P};
      _ -> false
    end.

-spec get_logs(Pos :: non_neg_integer()) -> list().

get_logs(Pos) ->
    case ets:lookup(primus_log, Pos) of
      [{Pos, L}] -> [ver_log(I) || I <- L];
      _ -> []
    end.

-spec async_exec(atom(), atom(), list) -> ok.

async_exec(Mod, Fun, Args) ->
    info({async, Mod, Fun, Args}).

info(Info) -> primus_mgr ! Info.

cast(Info) -> gen_server:cast(primus_mgr, Info).

call(Info) ->
    case catch gen_server:call(primus_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidprimus_mgr52, _,
	     {__Levelprimus_mgr52, __Tracesprimus_mgr52}}
		when __Levelprimus_mgr52 band 8 /= 0 orelse
		       __Tracesprimus_mgr52 /= [] ->
		lager:do_log(error,
			     [{module, primus_mgr}, {function, call},
			      {line, 52}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [primus_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelprimus_mgr52,
			     __Tracesprimus_mgr52, lager_event,
			     __Pidprimus_mgr52);
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
    gen_server:start_link({local, primus_mgr}, primus_mgr,
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
      {__Pidprimus_mgr58, _,
       {__Levelprimus_mgr58, __Tracesprimus_mgr58}}
	  when __Levelprimus_mgr58 band 64 /= 0 orelse
		 __Tracesprimus_mgr58 /= [] ->
	  lager:do_log(info,
		       [{module, primus_mgr}, {function, init}, {line, 58},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [primus_mgr]), none, 4096,
		       64, __Levelprimus_mgr58, __Tracesprimus_mgr58,
		       lager_event, __Pidprimus_mgr58);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(primus, "dets/primus.dets",
			#primus.pos, set),
    d_ets_lib:load_dets_to_ets(primus,
			       fun (D) -> ver(D) end),
    d_ets_lib:new_d_ets(primus_log, "dets/primus_log.dets",
			1, set),
    d_ets_lib:load_dets_to_ets(primus_log, undefined),
    do_init(),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidprimus_mgr66, _,
       {__Levelprimus_mgr66, __Tracesprimus_mgr66}}
	  when __Levelprimus_mgr66 band 64 /= 0 orelse
		 __Tracesprimus_mgr66 /= [] ->
	  lager:do_log(info,
		       [{module, primus_mgr}, {function, init}, {line, 66},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [primus_mgr]), none, 4096,
		       64, __Levelprimus_mgr66, __Tracesprimus_mgr66,
		       lager_event, __Pidprimus_mgr66);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(gm_reset, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidprimus_mgr77, _,
       {__Levelprimus_mgr77, __Tracesprimus_mgr77}}
	  when __Levelprimus_mgr77 band 64 /= 0 orelse
		 __Tracesprimus_mgr77 /= [] ->
	  lager:do_log(info,
		       [{module, primus_mgr}, {function, handle_info},
			{line, 77}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "数据重置处理", none, 4096, 64, __Levelprimus_mgr77,
		       __Tracesprimus_mgr77, lager_event, __Pidprimus_mgr77);
      _ -> ok
    end,
    ets:delete_all_objects(primus),
    ets:delete_all_objects(primus_log),
    do_init(),
    {noreply, State};
handle_info({gm_uplev, Pos, Lev}, State) ->
    case primus_data:get_unit({Pos, Lev}) of
      Data when is_map(Data) ->
	  {ok, P} = primus_mgr:lookup(Pos),
	  NewP = P#primus{num = Lev},
	  d_ets_lib:save_d_ets(primus, NewP),
	  ok;
      _ -> notice:alert(lang:get(<<"不存在的神殿数据"/utf8>>))
    end,
    {noreply, State};
handle_info({async, Fun, Mod, Args}, State) ->
    try apply(Fun, Mod, Args) catch
      X:T ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidprimus_mgr101, _,
	     {__Levelprimus_mgr101, __Tracesprimus_mgr101}}
		when __Levelprimus_mgr101 band 8 /= 0 orelse
		       __Tracesprimus_mgr101 /= [] ->
		lager:do_log(error,
			     [{module, primus_mgr}, {function, handle_info},
			      {line, 101}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("exec_fun:~w,~w, error:~w,~w ~w",
					   [Fun, Mod, X, T,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelprimus_mgr101,
			     __Tracesprimus_mgr101, lager_event,
			     __Pidprimus_mgr101);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidprimus_mgr106, _,
       {__Levelprimus_mgr106, __Tracesprimus_mgr106}}
	  when __Levelprimus_mgr106 band 8 /= 0 orelse
		 __Tracesprimus_mgr106 /= [] ->
	  lager:do_log(error,
		       [{module, primus_mgr}, {function, handle_info},
			{line, 106}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到非法信息:~w", [_Info]), none, 4096, 8,
		       __Levelprimus_mgr106, __Tracesprimus_mgr106,
		       lager_event, __Pidprimus_mgr106);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason, _State) ->
    d_ets_lib:save(primus),
    d_ets_lib:save(primus_log),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidprimus_mgr112, _,
       {__Levelprimus_mgr112, __Tracesprimus_mgr112}}
	  when __Levelprimus_mgr112 band 64 /= 0 orelse
		 __Tracesprimus_mgr112 /= [] ->
	  lager:do_log(info,
		       [{module, primus_mgr}, {function, terminate},
			{line, 112}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelprimus_mgr112,
		       __Tracesprimus_mgr112, lager_event, __Pidprimus_mgr112);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_init() ->
    case ets:info(primus, size) of
      0 -> [init_primus(Pos) || Pos <- primus_data:list()];
      _ -> pass
    end.

init_primus(Pos) ->
    honor_mgr:clear({primus, Pos}),
    #{look_id := LookId} = primus_data:get(Pos),
    D = #primus{pos = Pos, look_id = LookId},
    d_ets_lib:save_d_ets(primus, D).

merge_convert(P = #primus{pos = Pos, num = Num}) ->
    case ets:lookup(primus, Pos) of
      [P1 = #primus{num = Num1}] when Num1 < Num ->
	  #{look_id := LookId1} = primus_data:get(Pos),
	  NewP = P1#primus{role_id = {0, <<>>}, name = <<>>,
			   lev = 0, face_id = 0, look_id = LookId1},
	  ets:insert(primus, NewP),
	  dets:insert(primus, NewP),
	  {ok, NewP};
      _ ->
	  #{look_id := LookId1} = primus_data:get(Pos),
	  NewP = P#primus{role_id = {0, <<>>}, name = <<>>,
			  lev = 0, face_id = 0, look_id = LookId1},
	  ets:insert(primus, NewP),
	  dets:insert(primus, NewP),
	  {ok, NewP}
    end;
merge_convert(P) -> {ok, P}.

ver({primus, Pos, Num, Status, LookId, RoleId, Name,
     Lev, FaceId, Power}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    ver({primus, Pos, Num, Status, LookId, RoleId, Name,
	 Lev, FaceId, Power, FaceUpdateTime, FaceFile});
ver(P = #primus{}) -> {ok, P}.

ver_log({primus_log, RoleId, Name, Lev, FaceId, Power,
	 Num, ReplayId, FormationType, FormationLev, PartnerList,
	 Time, Ret}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    ver_log({primus_log, RoleId, Name, Lev, FaceId, Power,
	     Num, ReplayId, FormationType, FormationLev, PartnerList,
	     Time, Ret, FaceUpdateTime, FaceFile});
ver_log(Log = #primus_log{}) -> Log.


