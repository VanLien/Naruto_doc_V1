-file("src/lager_common_test_backend.erl", 1).

-module(lager_common_test_backend).

-behavior(gen_event).

-export([init/1, handle_call/2, handle_event/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_logs/0, bounce/0, bounce/1]).

-record(state,
	{level  :: {mask, integer()}, formatter  :: atom(),
	 format_config  :: any(), log = []  :: list()}).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_common_test_backend.erl", 23).

-spec get_logs() -> [iolist()] | {error, term()}.

get_logs() ->
    gen_event:call(lager_event, lager_common_test_backend,
		   get_logs, infinity).

bounce() -> bounce(error).

bounce(Level) ->
    _ = application:stop(lager),
    application:set_env(lager,
			suppress_application_start_stop, true),
    application:set_env(lager, handlers,
			[{lager_common_test_backend, [Level, false]}]),
    ok = lager:start(),
    error_logger_lager_h:set_high_water(100000),
    ok.

-spec init(integer() | atom() | [term()]) -> {ok,
					      #state{}} |
					     {error, atom()}.

init([Level, true]) ->
    init([Level, {lager_default_formatter, [{eol, "\n"}]}]);
init([Level, false]) ->
    init([Level,
	  {lager_default_formatter,
	   [time, " ", color, "[", severity, "] ", message] ++
	     ["\n"]}]);
init([Level, {Formatter, FormatterConfig}])
    when is_atom(Formatter) ->
    case lists:member(Level,
		      [debug, info, notice, warning, error, critical, alert,
		       emergency, none])
	of
      true ->
	  {ok,
	   #state{level = lager_util:config_to_mask(Level),
		  formatter = Formatter,
		  format_config = FormatterConfig}};
      _ -> {error, bad_log_level}
    end;
init(Level) ->
    init([Level,
	  {lager_default_formatter,
	   [time, " ", color, "[", severity, "] ", message] ++
	     ["\n"]}]).

-spec handle_event(tuple(), #state{}) -> {ok, #state{}}.

handle_event({log, Message},
	     #state{level = L, formatter = Formatter,
		    format_config = FormatConfig, log = Logs} =
		 State) ->
    case lager_util:is_loggable(Message, L,
				lager_common_test_backend)
	of
      true ->
	  Log = Formatter:format(Message, FormatConfig),
	  ct:pal(Log),
	  {ok, State#state{log = [Log | Logs]}};
      false -> {ok, State}
    end;
handle_event(Event, State) ->
    ct:pal(Event),
    {ok, State#state{log = [Event | State#state.log]}}.

-spec handle_call(any(), #state{}) -> {ok, any(),
				       #state{}}.

handle_call(get_loglevel,
	    #state{level = Level} = State) ->
    {ok, Level, State};
handle_call({set_loglevel, Level}, State) ->
    case lists:member(Level,
		      [debug, info, notice, warning, error, critical, alert,
		       emergency, none])
	of
      true ->
	  {ok, ok,
	   State#state{level = lager_util:config_to_mask(Level)}};
      _ -> {ok, {error, bad_log_level}, State}
    end;
handle_call(get_logs, #state{log = Logs} = State) ->
    {ok, lists:reverse(Logs), State};
handle_call(_, State) -> {ok, ok, State}.

-spec handle_info(any(), #state{}) -> {ok, #state{}}.

handle_info(_, State) -> {ok, State}.

-spec code_change(any(), #state{}, any()) -> {ok,
					      #state{}}.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

-spec terminate(any(), #state{}) -> {ok, list()}.

terminate(_Reason, #state{log = Logs}) ->
    {ok, lists:reverse(Logs)}.


