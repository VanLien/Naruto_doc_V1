-file("src/lager_handler_watcher_sup.erl", 1).

-module(lager_handler_watcher_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

start_link() ->
    supervisor:start_link({local,
			   lager_handler_watcher_sup},
			  lager_handler_watcher_sup, []).

init([]) ->
    {ok,
     {{simple_one_for_one, 10, 60},
      [{lager_handler_watcher,
	{lager_handler_watcher, start_link, []}, temporary,
	5000, worker, [lager_handler_watcher]}]}}.


