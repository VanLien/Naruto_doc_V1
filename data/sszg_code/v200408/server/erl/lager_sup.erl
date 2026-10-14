-file("src/lager_sup.erl", 1).

-module(lager_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

start_link() ->
    supervisor:start_link({local, lager_sup}, lager_sup,
			  []).

init([]) ->
    lager_config:new(),
    Children = [{lager,
		 {gen_event, start_link, [{local, lager_event}]},
		 permanent, 5000, worker, dynamic},
		{lager_handler_watcher_sup,
		 {lager_handler_watcher_sup, start_link, []}, permanent,
		 5000, supervisor, [lager_handler_watcher_sup]}],
    CrashLog = decide_crash_log(lager_app:get_env(lager,
						  crash_log, false)),
    {ok, {{one_for_one, 10, 60}, Children ++ CrashLog}}.

validate_positive({ok, Val}, _Default)
    when is_integer(Val) andalso Val >= 0 ->
    Val;
validate_positive(_Val, Default) -> Default.

determine_rotation_date({ok, ""}) -> undefined;
determine_rotation_date({ok, Val3}) ->
    case lager_util:parse_rotation_date_spec(Val3) of
      {ok, Spec} -> Spec;
      {error, _} ->
	  error_logger:error_msg("Invalid date spec for crash log ~p~n",
				 [Val3]),
	  undefined
    end;
determine_rotation_date(_) -> undefined.

decide_crash_log(undefined) -> [];
decide_crash_log(false) -> [];
decide_crash_log(File) ->
    MaxBytes = validate_positive(application:get_env(lager,
						     crash_log_msg_size),
				 65536),
    RotationSize =
	validate_positive(application:get_env(lager,
					      crash_log_size),
			  0),
    RotationCount =
	validate_positive(application:get_env(lager,
					      crash_log_count),
			  0),
    RotationDate =
	determine_rotation_date(application:get_env(lager,
						    crash_log_date)),
    [{lager_crash_log,
      {lager_crash_log, start_link,
       [File, MaxBytes, RotationSize, RotationDate,
	RotationCount]},
      permanent, 5000, worker, [lager_crash_log]}].


