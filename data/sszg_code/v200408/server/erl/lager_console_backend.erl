-file("src/lager_console_backend.erl", 1).

-module(lager_console_backend).

-behaviour(gen_event).

-export([init/1, handle_call/2, handle_event/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state,
	{level  :: {mask, integer()}, formatter  :: atom(),
	 format_config  :: any(), colors = []  :: list()}).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_console_backend.erl", 38).

init([Level]) when is_atom(Level) -> init(Level);
init([Level, true]) ->
    init([Level,
	  {lager_default_formatter, [{eol, eol()}]}]);
init([Level, false]) ->
    init([Level,
	  {lager_default_formatter,
	   [time, " ", color, "[", severity, "] ", "[", module,
	    ":", function, ":", line, "]", message]
	     ++ [eol()]}]);
init([Level, {Formatter, FormatterConfig}])
    when is_atom(Formatter) ->
    Colors = case application:get_env(lager, colored) of
	       {ok, true} ->
		   {ok, LagerColors} = application:get_env(lager, colors),
		   LagerColors;
	       _ -> []
	     end,
    try {is_new_style_console_available(),
	 lager_util:config_to_mask(Level)}
    of
      {false, _} ->
	  Msg = "Lager's console backend is incompatible "
		"with the 'old' shell, not enabling it",
	  try alarm_handler:set_alarm({lager_console_backend,
				       "WARNING: " ++ Msg})
	  catch
	    _:_ -> error_logger:warning_msg(Msg ++ "~n")
	  end,
	  io:format("WARNING: " ++ Msg ++ "~n"),
	  Self = self(),
	  spawn(fun () ->
			case catch gen_event:which_handlers(lager_event) of
			  X
			      when X == [];
				   X == {'EXIT', noproc};
				   X == [lager_backend_throttle] ->
			      timer:sleep(500),
			      gen_event:notify(lager_event,
					       {log,
						lager_msg:new(io_lib:format(Msg,
									    []),
							      warning,
							      [{pid, Self},
							       {line, 66},
							       {file,
								"src/lager_console_backend.erl"},
							       {module,
								lager_console_backend}],
							      [])});
			  _ ->
			      case lager_util:level_to_num(warning) band
				     element(1,
					     lager_config:get(loglevel,
							      {0, []}))
				     /= 0
				  of
				true ->
				    gen_event:notify(lager_event,
						     {log,
						      lager_msg:new(io_lib:format(Msg,
										  []),
								    warning,
								    [{pid,
								      Self},
								     {line, 66},
								     {file,
								      "src/lager_console_backend.erl"},
								     {module,
								      lager_console_backend}],
								    [])});
				_ -> ok
			      end
			end
		end),
	  {error, {fatal, old_shell}};
      {true, Levels} ->
	  {ok,
	   #state{level = Levels, formatter = Formatter,
		  format_config = FormatterConfig, colors = Colors}}
    catch
      _:_ -> {error, {fatal, bad_log_level}}
    end;
init(Level) ->
    init([Level,
	  {lager_default_formatter,
	   [time, " ", color, "[", severity, "] ", "[", module,
	    ":", function, ":", line, "]", message]
	     ++ [eol()]}]).

handle_call(get_loglevel,
	    #state{level = Level} = State) ->
    {ok, Level, State};
handle_call({set_loglevel, Level}, State) ->
    try lager_util:config_to_mask(Level) of
      Levels -> {ok, ok, State#state{level = Levels}}
    catch
      _:_ -> {ok, {error, bad_log_level}, State}
    end;
handle_call(_Request, State) -> {ok, ok, State}.

handle_event({log, Message},
	     #state{level = L, formatter = Formatter,
		    format_config = FormatConfig, colors = Colors} =
		 State) ->
    case lager_util:is_loggable(Message, L,
				lager_console_backend)
	of
      true ->
	  io:put_chars(user,
		       Formatter:format(Message, FormatConfig, Colors)),
	  {ok, State};
      false -> {ok, State}
    end;
handle_event(_Event, State) -> {ok, State}.

handle_info(_Info, State) -> {ok, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

eol() ->
    case application:get_env(lager, colored) of
      {ok, true} -> "\e[0m\r\n";
      _ -> "\r\n"
    end.

is_new_style_console_available() ->
    init:get_argument(noshell) /= error orelse
      element(1, os:type()) /= win32 orelse
	is_pid(whereis(user_drv)).


