-file("src/gr_manager_sup.erl", 1).

-module(gr_manager_sup).

-behaviour(supervisor).

-type startlink_err() :: {already_started, pid()} |
			 shutdown | term().

-type startlink_ret() :: {ok, pid()} | ignore |
			 {error, startlink_err()}.

-export([start_link/0]).

-export([init/1]).

-spec start_link() -> startlink_ret().

start_link() ->
    supervisor:start_link({local, gr_manager_sup},
			  gr_manager_sup, []).

-spec init([]) -> {ok,
		   {{one_for_one, 50, 10}, [supervisor:child_spec()]}}.

init(_Args) -> {ok, {{one_for_one, 50, 10}, []}}.


