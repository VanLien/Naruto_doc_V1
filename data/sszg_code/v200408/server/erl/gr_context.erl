-file("src/gr_context.erl", 1).

-module(gr_context).

-export([make/1]).

make(Options) ->
    make_(undefined, undefined, undefined, undefined,
	  Options).

make_(_Node, App, Pid, Time, [{'$n', Node} | T]) ->
    make_(Node, App, Pid, Time, T);
make_(Node, _App, Pid, Time, [{'$a', App} | T]) ->
    make_(Node, App, Pid, Time, T);
make_(Node, App, _Pid, Time, [{'$p', Pid} | T]) ->
    make_(Node, App, Pid, Time, T);
make_(Node, App, Pid, _Time, [{'$t', Time} | T]) ->
    make_(Node, App, Pid, Time, T);
make_(Node, App, Pid, Time, []) ->
    Pid2 = case Pid of
	     undefined -> self();
	     _ -> Pid
	   end,
    Node2 = case Node of
	      undefined -> node(Pid2);
	      _ -> Node
	    end,
    App2 = case App of
	     undefined -> application(Pid2);
	     _ -> App
	   end,
    Time2 = case Time of
	      undefined -> os:timestamp();
	      _ -> Time
	    end,
    {Node2, App2, Pid2, Time2}.

application(Pid) when Pid =:= self() ->
    case application:get_application(group_leader()) of
      {ok, App} -> App;
      undefined -> undefined
    end;
application(Pid) ->
    {_, GroupLeader} = erlang:process_info(Pid,
					   group_leader),
    case application:get_application(GroupLeader) of
      {ok, App} -> App;
      undefined -> undefined
    end.


