-file("src/mod/misc/server_timer.erl", 1).

-module(server_timer).

-lager_records([{s_timer, [ref, timers]},
		{rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]}]).

-export([add/1, del/1, set/1, timer/1, clean/0,
	 tick/1]).

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

-file("src/mod/misc/server_timer.erl", 22).

-file("inc/timer.hrl", 1).

-record(timer,
	{id  :: term(), timeout = 1000  :: pos_integer(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 a = []  :: [term()], times = 1  :: integer(),
	 next_tick = 0  :: non_neg_integer(),
	 set_time = 1  :: pos_integer()}).

-record(rtimer,
	{ref  :: undefined | reference(),
	 key = 0  :: non_neg_integer(),
	 timers = []  :: [#timer{}]}).

-record(s_timer,
	{ref  :: undefined | reference(),
	 timers = []  :: [#timer{}]}).

-file("src/mod/misc/server_timer.erl", 23).

-spec add(#timer{}) -> ok.

add(Timer = #timer{}) ->
    case get(pid_timer) of
      #s_timer{ref = Ref, timers = Timers} ->
	  catch erlang:cancel_timer(Ref), next([Timer | Timers]);
      _ -> next([Timer])
    end;
add(Timers = [_ | _]) when is_list(Timers) ->
    case is_timer(Timers) of
      true ->
	  case get(pid_timer) of
	    #s_timer{ref = Ref, timers = ServerTimers} ->
		catch erlang:cancel_timer(Ref),
		next(Timers ++ ServerTimers);
	    _ -> next(Timers)
	  end;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidserver_timer52, _,
	     {__Levelserver_timer52, __Tracesserver_timer52}}
		when __Levelserver_timer52 band 8 /= 0 orelse
		       __Tracesserver_timer52 /= [] ->
		lager:do_log(error,
			     [{module, server_timer}, {function, add},
			      {line, 52}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("非角色进程定时器参数错误[~w]", [Timers]), none,
			     4096, 8, __Levelserver_timer52,
			     __Tracesserver_timer52, lager_event,
			     __Pidserver_timer52);
	    _ -> ok
	  end,
	  ok
    end;
add(_Unknow) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidserver_timer56, _,
       {__Levelserver_timer56, __Tracesserver_timer56}}
	  when __Levelserver_timer56 band 8 /= 0 orelse
		 __Tracesserver_timer56 /= [] ->
	  lager:do_log(error,
		       [{module, server_timer}, {function, add}, {line, 56},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("非角色进程定时器参数错误[~w]", [_Unknow]), none,
		       4096, 8, __Levelserver_timer56, __Tracesserver_timer56,
		       lager_event, __Pidserver_timer56);
      _ -> ok
    end,
    ok.

-spec add(#timer{}, #s_timer{}) -> ok.

add(Timer, #s_timer{ref = Ref, timers = Timers}) ->
    catch erlang:cancel_timer(Ref), next([Timer | Timers]).

-spec set(#timer{}) -> ok.

set(Timer = #timer{id = Id}) ->
    case get(pid_timer) of
      STimer = #s_timer{} ->
	  NewSTimer = del(Id, STimer), add(Timer, NewSTimer);
      _ -> add(Timer, #s_timer{})
    end;
set(_Unknow) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidserver_timer75, _,
       {__Levelserver_timer75, __Tracesserver_timer75}}
	  when __Levelserver_timer75 band 8 /= 0 orelse
		 __Tracesserver_timer75 /= [] ->
	  lager:do_log(error,
		       [{module, server_timer}, {function, set}, {line, 75},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("非角色进程定时器参数错误[~w]", [_Unknow]), none,
		       4096, 8, __Levelserver_timer75, __Tracesserver_timer75,
		       lager_event, __Pidserver_timer75);
      _ -> ok
    end,
    ok.

-spec del(pos_integer()) -> ok.

del(TimerId) ->
    case get(pid_timer) of
      STimer = #s_timer{} ->
	  DelSTimer = del(TimerId, STimer),
	  put(pid_timer, DelSTimer);
      _ -> put(pid_timer, #s_timer{})
    end.

-spec del(pos_integer(), #s_timer{}) -> ok.

del(_TimerId, STimer = #s_timer{timers = []}) -> STimer;
del(TimerId,
    #s_timer{ref = Ref,
	     timers = [#timer{id = TimerId} | Timers]}) ->
    erlang:cancel_timer(Ref), do_next(Timers);
del(TimerId, STimer = #s_timer{timers = Timers}) ->
    STimer#s_timer{timers =
		       lists:keydelete(TimerId, #timer.id, Timers)}.

-spec timer(Label :: keep | remove | ok) -> ok.

timer(Label) ->
    case get(pid_timer) of
      Stimer = #s_timer{} -> timer(Stimer, Label);
      _ -> ok
    end.

timer(#s_timer{timers = []}, _Label) -> ok;
timer(#s_timer{timers =
		   [Timer = #timer{times = Times} | Timers]},
      Label) ->
    case Label of
      keep when Times =:= 1 ->
	  next([Timer#timer{times = 1, next_tick = 0} | Timers]);
      remove when Times =/= 1 -> next(Timers);
      Atom
	  when Atom =:= ok orelse
		 Atom =:= keep orelse Atom =:= remove ->
	  next([Timer#timer{times = max(-1, Times - 1),
			    next_tick = 0}
		| Timers]);
      Else ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidserver_timer118, _,
	     {__Levelserver_timer118, __Tracesserver_timer118}}
		when __Levelserver_timer118 band 8 /= 0 orelse
		       __Tracesserver_timer118 /= [] ->
		lager:do_log(error,
			     [{module, server_timer}, {function, timer},
			      {line, 118}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行定时器{~w}时得到错误的返回值格式: ~w",
					   [Timer, Else]),
			     none, 4096, 8, __Levelserver_timer118,
			     __Tracesserver_timer118, lager_event,
			     __Pidserver_timer118);
	    _ -> ok
	  end,
	  next(Timers)
    end,
    ok.

clean() ->
    case get(pid_timer) of
      #s_timer{ref = Ref} ->
	  case Ref of
	    undefined -> ok;
	    _ -> erlang:cancel_timer(Ref)
	  end,
	  erase(pid_timer),
	  ok;
      _ -> ok
    end.

tick({ok, {set, Timer}, RtnState}) ->
    set(Timer), {ok, RtnState};
tick({ok, {set, Timer}}) -> set(Timer), ok;
tick({ok, remove, RtnState}) ->
    timer(remove), {ok, RtnState};
tick(remove) -> timer(remove), ok;
tick(_False) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidserver_timer152, _,
       {__Levelserver_timer152, __Tracesserver_timer152}}
	  when __Levelserver_timer152 band 128 /= 0 orelse
		 __Tracesserver_timer152 /= [] ->
	  lager:do_log(debug,
		       [{module, server_timer}, {function, tick}, {line, 152},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("定时器返回值:~w", [_False]), none, 4096, 128,
		       __Levelserver_timer152, __Tracesserver_timer152,
		       lager_event, __Pidserver_timer152);
      _ -> ok
    end,
    timer(remove),
    false.

-spec next(Timers :: [#timer{}]) -> ok.

next(Timers) ->
    STimer = do_next(Timers), put(pid_timer, STimer), ok.

do_next([]) -> #s_timer{};
do_next([#timer{times = 0} | Timers]) ->
    do_next(Timers);
do_next([Timer = #timer{next_tick = 0, timeout = To}
	 | Timers]) ->
    Now = date:unixtime(ms),
    NewTimer = Timer#timer{set_time = Now,
			   next_tick = Now + To},
    do_next([NewTimer | Timers]);
do_next(Timers) ->
    Now = date:unixtime(ms),
    L = lists:keysort(#timer.next_tick, Timers),
    [#timer{id = Id, next_tick = Nt} | _] = L,
    T = case Nt - Now of
	  Diff when Diff > 0 -> Diff;
	  _ -> 100
	end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidserver_timer183, _,
       {__Levelserver_timer183, __Tracesserver_timer183}}
	  when __Levelserver_timer183 band 128 /= 0 orelse
		 __Tracesserver_timer183 /= [] ->
	  lager:do_log(debug,
		       [{module, server_timer}, {function, do_next},
			{line, 183}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("下一个定时器[Id:~w][T:~w]", [Id, T]), none,
		       4096, 128, __Levelserver_timer183,
		       __Tracesserver_timer183, lager_event,
		       __Pidserver_timer183);
      _ -> ok
    end,
    NewRef = erlang:send_after(T, self(), {timer_tick, Id}),
    #s_timer{ref = NewRef, timers = L}.

is_timer(#timer{}) -> true;
is_timer([]) -> true;
is_timer([H | Rest]) ->
    case is_timer(H) of
      true -> is_timer(Rest);
      false -> false
    end;
is_timer(_) -> false.


