-file("src/lager_backend_throttle.erl", 1).

-module(lager_backend_throttle).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_backend_throttle.erl", 26).

-behaviour(gen_event).

-export([init/1, handle_call/2, handle_event/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state,
	{sink  :: atom(), hwm  :: non_neg_integer(),
	 window_min  :: non_neg_integer(),
	 async = true  :: boolean()}).

init([{sink, Sink}, Hwm, Window]) ->
    lager_config:set({Sink, async}, true),
    {ok,
     #state{sink = Sink, hwm = Hwm,
	    window_min = Hwm - Window}}.

handle_call(get_loglevel, State) ->
    {ok, {mask, 0}, State};
handle_call({set_loglevel, _Level}, State) ->
    {ok, ok, State};
handle_call(_Request, State) -> {ok, ok, State}.

handle_event({log, _Message}, State) ->
    {message_queue_len, Len} = erlang:process_info(self(),
						   message_queue_len),
    case {Len > State#state.hwm,
	  Len < State#state.window_min, State#state.async}
	of
      {true, _, true} ->
	  true,
	  lager_config:set({State#state.sink, async}, false),
	  {ok, State#state{async = false}};
      {_, true, false} ->
	  true,
	  lager_config:set({State#state.sink, async}, true),
	  {ok, State#state{async = true}};
      _ -> {ok, State}
    end;
handle_event(_Event, State) -> {ok, State}.

handle_info(_Info, State) -> {ok, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


