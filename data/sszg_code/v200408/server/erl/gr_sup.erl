-file("src/gr_sup.erl", 1).

-module(gr_sup).

-behaviour(supervisor).

-type startlink_err() :: {already_started, pid()} |
			 shutdown | term().

-type startlink_ret() :: {ok, pid()} | ignore |
			 {error, startlink_err()}.

-export([start_link/0]).

-export([init/1]).

-spec start_link() -> startlink_ret().

start_link() ->
    supervisor:start_link({local, gr_sup}, gr_sup, []).

-spec init([]) -> {ok,
		   {{one_for_one, 50, 10}, [supervisor:child_spec()]}}.

init([]) ->
    CounterSup = {gr_counter_sup,
		  {gr_counter_sup, start_link, []}, permanent, 5000,
		  supervisor, [gr_counter_sup]},
    ParamSup = {gr_param_sup,
		{gr_param_sup, start_link, []}, permanent, 5000,
		supervisor, [gr_param_sup]},
    MgrSup = {gr_manager_sup,
	      {gr_manager_sup, start_link, []}, permanent, 5000,
	      supervisor, [gr_manager_sup]},
    {ok,
     {{one_for_one, 50, 10},
      [CounterSup, ParamSup, MgrSup]}}.


