-file("src/glc_run.erl", 1).

-module(glc_run).

-export([execute/2]).

execute(Fun, [Event, Store]) ->
    T1 = os:timestamp(),
    case catch Fun(Event, Store) of
      {'EXIT', {Reason, _ST}} ->
	  T2 = os:timestamp(),
	  {timer:now_diff(T2, T1), {error, Reason}};
      {'EXIT', Reason} ->
	  T2 = os:timestamp(),
	  {timer:now_diff(T2, T1), {error, Reason}};
      Else ->
	  T2 = os:timestamp(), {timer:now_diff(T2, T1), Else}
    end.


