-file("src/mod/say/say_voice.erl", 1).

-module(say_voice).

-lager_records([{state, [next_id]}]).

-behaviour(gen_server).

-export([add/4, find/2]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {next_id = 1}).

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

-file("src/mod/say/say_voice.erl", 16).

add(SrvId, Voice, Time, Type) ->
    case call(get_id) of
      {ok, VoiceId} ->
	  RollId = to_roll_id(VoiceId),
	  ets:insert(say_voice_cache,
		     {{SrvId, RollId}, Voice, Time, Type}),
	  cast({add_suc, SrvId, VoiceId}),
	  {ok, SrvId, VoiceId};
      _ -> {error, lang:get(<<"系统繁忙"/utf8>>)}
    end.

find(SrvId, VoiceId) ->
    case catch ets:lookup(say_voice_cache,
			  {SrvId, to_roll_id(VoiceId)})
	of
      [{_, Voice, Time, Type}] -> {ok, Time, Voice, Type};
      [{_, File}] ->
	  case file:read_file(File) of
	    {ok, Bin} -> {ok, Bin};
	    _ -> {error, lang:get(<<"读取语音失败"/utf8>>)}
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
	    {__Pidsay_voice44, _,
	     {__Levelsay_voice44, __Tracessay_voice44}}
		when __Levelsay_voice44 band 64 /= 0 orelse
		       __Tracessay_voice44 /= [] ->
		lager:do_log(info,
			     [{module, say_voice}, {function, find}, {line, 44},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("===~s ==> ~w", [SrvId, VoiceId]),
			     none, 4096, 64, __Levelsay_voice44,
			     __Tracessay_voice44, lager_event,
			     __Pidsay_voice44);
	    _ -> ok
	  end,
	  {error, lang:get(<<"获取语音失败"/utf8>>)}
    end.

info(Info) -> say_voice ! Info.

cast(Info) -> gen_server:cast(say_voice, Info).

call(Info) ->
    case catch gen_server:call(say_voice, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsay_voice56, _,
	     {__Levelsay_voice56, __Tracessay_voice56}}
		when __Levelsay_voice56 band 8 /= 0 orelse
		       __Tracessay_voice56 /= [] ->
		lager:do_log(error,
			     [{module, say_voice}, {function, call}, {line, 56},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [say_voice, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelsay_voice56,
			     __Tracessay_voice56, lager_event,
			     __Pidsay_voice56);
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
    gen_server:start_link({local, say_voice}, say_voice, [],
			  []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsay_voice62, _,
       {__Levelsay_voice62, __Tracessay_voice62}}
	  when __Levelsay_voice62 band 64 /= 0 orelse
		 __Tracessay_voice62 /= [] ->
	  lager:do_log(info,
		       [{module, say_voice}, {function, init}, {line, 62},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [say_voice]), none, 4096,
		       64, __Levelsay_voice62, __Tracessay_voice62,
		       lager_event, __Pidsay_voice62);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    put(srv_id, sys_lib:srv_id()),
    put(path,
	util:fbin("~s/~s", [<<"./voice">>, get(srv_id)])),
    make_dir(<<"./voice">>),
    make_dir(get(path)),
    ets:new(say_voice_cache,
	    [set, named_table, public, {keypos, 1}]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsay_voice70, _,
       {__Levelsay_voice70, __Tracessay_voice70}}
	  when __Levelsay_voice70 band 64 /= 0 orelse
		 __Tracessay_voice70 /= [] ->
	  lager:do_log(info,
		       [{module, say_voice}, {function, init}, {line, 70},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [say_voice]), none, 4096, 64,
		       __Levelsay_voice70, __Tracessay_voice70, lager_event,
		       __Pidsay_voice70);
      _ -> ok
    end,
    {ok, State}.

handle_call(get_id, _From,
	    State = #state{next_id = NextId}) ->
    {reply, {ok, NextId},
     State#state{next_id = NextId + 1}};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({add_suc, SrvId, Id}, State) ->
    Path = get(path),
    spawn(fun () -> save_to_dist(SrvId, Id, Path) end),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsay_voice92, _,
       {__Levelsay_voice92, __Tracessay_voice92}}
	  when __Levelsay_voice92 band 64 /= 0 orelse
		 __Tracessay_voice92 /= [] ->
	  lager:do_log(info,
		       [{module, say_voice}, {function, terminate}, {line, 92},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始关闭", []), none, 4096, 64,
		       __Levelsay_voice92, __Tracessay_voice92, lager_event,
		       __Pidsay_voice92);
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
      {__Pidsay_voice93, _,
       {__Levelsay_voice93, __Tracessay_voice93}}
	  when __Levelsay_voice93 band 64 /= 0 orelse
		 __Tracessay_voice93 /= [] ->
	  lager:do_log(info,
		       [{module, say_voice}, {function, terminate}, {line, 93},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭完成", []), none, 4096, 64,
		       __Levelsay_voice93, __Tracessay_voice93, lager_event,
		       __Pidsay_voice93);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

to_roll_id(Id) -> Id rem 10000.

save_to_dist(SrvId, Id, Path) when Id > 100 ->
    RollId = to_roll_id(Id - 100),
    case catch ets:lookup(say_voice_cache, {SrvId, RollId})
	of
      [{_, Voice, Time, Type}] ->
	  case sys_conn:pack(12726,
			     {SrvId, RollId, Time, Voice, Type})
	      of
	    {ok, Bin} ->
		File = to_file(Path, SrvId, RollId),
		case file:write_file(File, Bin) of
		  ok ->
		      ets:insert(say_voice_cache, {{SrvId, RollId}, File});
		  _ -> ok
		end;
	    _ -> ok
	  end;
      _ -> ok
    end;
save_to_dist(_SrvId, _Id, _Path) -> ok.

to_file(Path, SrvId, Id) ->
    util:fbin("~s/~s_~w.dat", [Path, SrvId, Id]).

make_dir(Dir) ->
    case filelib:is_dir(Dir) of
      true -> ok;
      _ -> ok = file:make_dir(Dir)
    end.


