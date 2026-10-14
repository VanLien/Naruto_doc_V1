-file("src/gr_app.erl", 1).

-module(gr_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) -> gr_sup:start_link().

stop(_State) -> ok.


