-file("src/lager_util.erl", 1).

-module(lager_util).

-file("/usr/local/Cellar/erlang-r19/19.0.2/lib/erlan"
      "g/lib/kernel-5.0/include/file.hrl",
      1).

-record(file_info,
	{size  :: non_neg_integer() | undefined,
	 type  ::
	     device | directory | other | regular | symlink |
	     undefined,
	 access  :: read | write | read_write | none | undefined,
	 atime  ::
	     file:date_time() | non_neg_integer() | undefined,
	 mtime  ::
	     file:date_time() | non_neg_integer() | undefined,
	 ctime  ::
	     file:date_time() | non_neg_integer() | undefined,
	 mode  :: non_neg_integer() | undefined,
	 links  :: non_neg_integer() | undefined,
	 major_device  :: non_neg_integer() | undefined,
	 minor_device  :: non_neg_integer() | undefined,
	 inode  :: non_neg_integer() | undefined,
	 uid  :: non_neg_integer() | undefined,
	 gid  :: non_neg_integer() | undefined}).

-record(file_descriptor,
	{module  :: module(), data  :: term()}).

-file("src/lager_util.erl", 24).

-export([levels/0, level_to_num/1, level_to_chr/1,
	 num_to_level/1, config_to_mask/1, config_to_levels/1,
	 mask_to_levels/1, open_logfile/2, ensure_logfile/4,
	 rotate_logfile/2, format_time/0, format_time/1,
	 localtime_ms/0, localtime_ms/1, maybe_utc/1,
	 parse_rotation_date_spec/1, calculate_next_rotation/1,
	 validate_trace/1, check_traces/4, is_loggable/3,
	 trace_filter/1, trace_filter/2, expand_path/1,
	 find_file/2, check_hwm/1, make_internal_sink_name/1,
	 otp_version/0]).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_util.erl", 41).

levels() ->
    [debug, info, notice, warning, error, critical, alert,
     emergency, none].

level_to_num(debug) -> 128;
level_to_num(info) -> 64;
level_to_num(notice) -> 32;
level_to_num(warning) -> 16;
level_to_num(error) -> 8;
level_to_num(critical) -> 4;
level_to_num(alert) -> 2;
level_to_num(emergency) -> 1;
level_to_num(none) -> 0.

level_to_chr(debug) -> $D;
level_to_chr(info) -> $I;
level_to_chr(notice) -> $N;
level_to_chr(warning) -> $W;
level_to_chr(error) -> $E;
level_to_chr(critical) -> $C;
level_to_chr(alert) -> $A;
level_to_chr(emergency) -> $M;
level_to_chr(none) -> $\s.

num_to_level(128) -> debug;
num_to_level(64) -> info;
num_to_level(32) -> notice;
num_to_level(16) -> warning;
num_to_level(8) -> error;
num_to_level(4) -> critical;
num_to_level(2) -> alert;
num_to_level(1) -> emergency;
num_to_level(0) -> none.

-spec config_to_mask(atom() | string()) -> {mask,
					    integer()}.

config_to_mask(Conf) ->
    Levels = config_to_levels(Conf),
    {mask,
     lists:foldl(fun (Level, Acc) ->
			 level_to_num(Level) bor Acc
		 end,
		 0, Levels)}.

-spec
     mask_to_levels(non_neg_integer()) -> [lager:log_level()].

mask_to_levels(Mask) ->
    mask_to_levels(Mask, levels(), []).

mask_to_levels(_Mask, [], Acc) -> lists:reverse(Acc);
mask_to_levels(Mask, [Level | Levels], Acc) ->
    NewAcc = case level_to_num(Level) band Mask /= 0 of
	       true -> [Level | Acc];
	       false -> Acc
	     end,
    mask_to_levels(Mask, Levels, NewAcc).

-spec config_to_levels(atom() |
		       string()) -> [lager:log_level()].

config_to_levels(Conf) when is_atom(Conf) ->
    config_to_levels(atom_to_list(Conf));
config_to_levels([$! | Rest]) ->
    levels() -- config_to_levels(Rest);
config_to_levels([$=, $< | Rest]) ->
    [_ | Levels] = config_to_levels_int(Rest),
    lists:filter(fun (E) -> not lists:member(E, Levels) end,
		 levels());
config_to_levels([$<, $= | Rest]) ->
    [_ | Levels] = config_to_levels_int(Rest),
    lists:filter(fun (E) -> not lists:member(E, Levels) end,
		 levels());
config_to_levels([$>, $= | Rest]) ->
    config_to_levels_int(Rest);
config_to_levels([$=, $> | Rest]) ->
    config_to_levels_int(Rest);
config_to_levels([$= | Rest]) -> [level_to_atom(Rest)];
config_to_levels([$< | Rest]) ->
    Levels = config_to_levels_int(Rest),
    lists:filter(fun (E) -> not lists:member(E, Levels) end,
		 levels());
config_to_levels([$> | Rest]) ->
    [_ | Levels] = config_to_levels_int(Rest),
    lists:filter(fun (E) -> lists:member(E, Levels) end,
		 levels());
config_to_levels(Conf) -> config_to_levels_int(Conf).

config_to_levels_int(Conf) ->
    Level = level_to_atom(Conf),
    lists:dropwhile(fun (E) -> E /= Level end, levels()).

level_to_atom(String) ->
    Levels = levels(),
    try list_to_existing_atom(String) of
      Atom ->
	  case lists:member(Atom, Levels) of
	    true -> Atom;
	    false -> erlang:error(badarg)
	  end
    catch
      _:_ -> erlang:error(badarg)
    end.

open_logfile(Name, Buffer) ->
    case filelib:ensure_dir(Name) of
      ok ->
	  Options = [append, raw] ++
		      case Buffer of
			{Size, Interval}
			    when is_integer(Interval), Interval >= 0,
				 is_integer(Size), Size >= 0 ->
			    [{delayed_write, Size, Interval}];
			_ -> []
		      end,
	  case file:open(Name, Options) of
	    {ok, FD} ->
		case file:read_file_info(Name) of
		  {ok, FInfo} ->
		      Inode = FInfo#file_info.inode,
		      {ok, {FD, Inode, FInfo#file_info.size}};
		  X -> X
		end;
	    Y -> Y
	  end;
      Z -> Z
    end.

ensure_logfile(Name, FD, Inode, Buffer) ->
    case file:read_file_info(Name) of
      {ok, FInfo} ->
	  Inode2 = FInfo#file_info.inode,
	  case Inode == Inode2 of
	    true -> {ok, {FD, Inode, FInfo#file_info.size}};
	    false ->
		_ = file:close(FD),
		_ = file:close(FD),
		case open_logfile(Name, Buffer) of
		  {ok, {FD2, Inode3, Size}} -> {ok, {FD2, Inode3, Size}};
		  Error -> Error
		end
	  end;
      _ ->
	  _ = file:close(FD),
	  _ = file:close(FD),
	  case open_logfile(Name, Buffer) of
	    {ok, {FD2, Inode3, Size}} -> {ok, {FD2, Inode3, Size}};
	    Error -> Error
	  end
    end.

localtime_ms() ->
    Now = os:timestamp(), localtime_ms(Now).

localtime_ms(Now) ->
    {_, _, Micro} = Now,
    {Date, {Hours, Minutes, Seconds}} =
	calendar:now_to_local_time(Now),
    {Date,
     {Hours, Minutes, Seconds, Micro div 1000 rem 1000}}.

maybe_utc({Date, {H, M, S, Ms}}) ->
    case lager_stdlib:maybe_utc({Date, {H, M, S}}) of
      {utc, {Date1, {H1, M1, S1}}} ->
	  {utc, {Date1, {H1, M1, S1, Ms}}};
      {Date1, {H1, M1, S1}} -> {Date1, {H1, M1, S1, Ms}}
    end.

rotate_logfile(File, 0) -> file:delete(File);
rotate_logfile(File, 1) ->
    case file:rename(File, File ++ ".0") of
      ok -> ok;
      _ -> rotate_logfile(File, 0)
    end;
rotate_logfile(File, Count) ->
    _ = file:rename(File ++
		      "." ++ integer_to_list(Count - 2),
		    File ++ "." ++ integer_to_list(Count - 1)),
    rotate_logfile(File, Count - 1).

format_time() -> format_time(maybe_utc(localtime_ms())).

format_time({utc, {{Y, M, D}, {H, Mi, S, Ms}}}) ->
    {[integer_to_list(Y), $-, i2l(M), $-, i2l(D)],
     [i2l(H), $:, i2l(Mi), $:, i2l(S), $., i3l(Ms), $\s, $U,
      $T, $C]};
format_time({{Y, M, D}, {H, Mi, S, Ms}}) ->
    {[integer_to_list(Y), $-, i2l(M), $-, i2l(D)],
     [i2l(H), $:, i2l(Mi), $:, i2l(S), $., i3l(Ms)]};
format_time({utc, {{Y, M, D}, {H, Mi, S}}}) ->
    {[integer_to_list(Y), $-, i2l(M), $-, i2l(D)],
     [i2l(H), $:, i2l(Mi), $:, i2l(S), $\s, $U, $T, $C]};
format_time({{Y, M, D}, {H, Mi, S}}) ->
    {[integer_to_list(Y), $-, i2l(M), $-, i2l(D)],
     [i2l(H), $:, i2l(Mi), $:, i2l(S)]}.

parse_rotation_day_spec([], Res) ->
    {ok, Res ++ [{hour, 0}]};
parse_rotation_day_spec([$D, D1, D2], Res) ->
    case list_to_integer([D1, D2]) of
      X when X >= 0, X =< 23 -> {ok, Res ++ [{hour, X}]};
      _ -> {error, invalid_date_spec}
    end;
parse_rotation_day_spec([$D, D], Res)
    when D >= $0, D =< $9 ->
    {ok, Res ++ [{hour, D - 48}]};
parse_rotation_day_spec(_, _) ->
    {error, invalid_date_spec}.

parse_rotation_date_spec([$$, $W, W | T])
    when W >= $0, W =< $6 ->
    Week = W - 48,
    parse_rotation_day_spec(T, [{day, Week}]);
parse_rotation_date_spec([$$, $M, L | T])
    when L == $L; L == $l ->
    parse_rotation_day_spec(T, [{date, last}]);
parse_rotation_date_spec([$$, $M, M1, M2 | [$D | _] =
					       T]) ->
    case list_to_integer([M1, M2]) of
      X when X >= 1, X =< 31 ->
	  parse_rotation_day_spec(T, [{date, X}]);
      _ -> {error, invalid_date_spec}
    end;
parse_rotation_date_spec([$$, $M, M | [$D | _] = T]) ->
    parse_rotation_day_spec(T, [{date, M - 48}]);
parse_rotation_date_spec([$$, $M, M1, M2]) ->
    case list_to_integer([M1, M2]) of
      X when X >= 1, X =< 31 -> {ok, [{date, X}, {hour, 0}]};
      _ -> {error, invalid_date_spec}
    end;
parse_rotation_date_spec([$$, $M, M]) ->
    {ok, [{date, M - 48}, {hour, 0}]};
parse_rotation_date_spec([$$ | X]) when X /= [] ->
    parse_rotation_day_spec(X, []);
parse_rotation_date_spec(_) ->
    {error, invalid_date_spec}.

calculate_next_rotation(Spec) ->
    Now = calendar:local_time(),
    Later = calculate_next_rotation(Spec, Now),
    calendar:datetime_to_gregorian_seconds(Later) -
      calendar:datetime_to_gregorian_seconds(Now).

calculate_next_rotation([], Now) -> Now;
calculate_next_rotation([{hour, X} | T],
			{{_, _, _}, {Hour, _, _}} = Now)
    when Hour < X ->
    NewNow = setelement(2, Now, {X, 0, 0}),
    calculate_next_rotation(T, NewNow);
calculate_next_rotation([{hour, X} | T],
			{{_, _, _}, _} = Now) ->
    Seconds = calendar:datetime_to_gregorian_seconds(Now) +
		86400,
    DateTime =
	calendar:gregorian_seconds_to_datetime(Seconds),
    NewNow = setelement(2, DateTime, {X, 0, 0}),
    calculate_next_rotation(T, NewNow);
calculate_next_rotation([{day, Day} | T],
			{Date, _Time} = Now) ->
    DoW = calendar:day_of_the_week(Date),
    AdjustedDay = case Day of
		    0 -> 7;
		    X -> X
		  end,
    case AdjustedDay of
      DoW ->
	  OldDate = element(1, Now),
	  case calculate_next_rotation(T, Now) of
	    {OldDate, _} = NewNow -> NewNow;
	    {NewDate, _} ->
		NewNow = {NewDate, {0, 0, 0}},
		calculate_next_rotation([{day, Day} | T], NewNow)
	  end;
      Y when Y > DoW ->
	  PlusDays = Y - DoW,
	  Seconds = calendar:datetime_to_gregorian_seconds(Now) +
		      86400 * PlusDays,
	  {NewDate, _} =
	      calendar:gregorian_seconds_to_datetime(Seconds),
	  NewNow = {NewDate, {0, 0, 0}},
	  calculate_next_rotation(T, NewNow);
      Y when Y < DoW ->
	  PlusDays = 7 - DoW + Y,
	  Seconds = calendar:datetime_to_gregorian_seconds(Now) +
		      86400 * PlusDays,
	  {NewDate, _} =
	      calendar:gregorian_seconds_to_datetime(Seconds),
	  NewNow = {NewDate, {0, 0, 0}},
	  calculate_next_rotation(T, NewNow)
    end;
calculate_next_rotation([{date, last} | T],
			{{Year, Month, Day}, _} = Now) ->
    Last = calendar:last_day_of_the_month(Year, Month),
    case Last == Day of
      true ->
	  OldDate = element(1, Now),
	  case calculate_next_rotation(T, Now) of
	    {OldDate, _} = NewNow -> NewNow;
	    {NewDate, _} ->
		NewNow = {NewDate, {0, 0, 0}},
		calculate_next_rotation([{date, last} | T], NewNow)
	  end;
      false ->
	  NewNow = setelement(1, Now, {Year, Month, Last}),
	  calculate_next_rotation(T, NewNow)
    end;
calculate_next_rotation([{date, Date} | T],
			{{_, _, Date}, _} = Now) ->
    OldDate = element(1, Now),
    case calculate_next_rotation(T, Now) of
      {OldDate, _} = NewNow -> NewNow;
      {NewDate, _} ->
	  NewNow = setelement(1, Now, NewDate),
	  calculate_next_rotation([{date, Date} | T], NewNow)
    end;
calculate_next_rotation([{date, Date} | T],
			{{Year, Month, Day}, _} = Now) ->
    PlusDays = case Date of
		 X when X < Day ->
		     Last = calendar:last_day_of_the_month(Year, Month),
		     Last - Day;
		 X when X > Day -> X - Day
	       end,
    Seconds = calendar:datetime_to_gregorian_seconds(Now) +
		86400 * PlusDays,
    NewNow =
	calendar:gregorian_seconds_to_datetime(Seconds),
    calculate_next_rotation(T, NewNow).

-spec trace_filter(Query :: none | [tuple()]) -> {ok,
						  any()}.

trace_filter(Query) ->
    trace_filter(lager_default_tracer, Query).

trace_filter(Module, Query)
    when Query == none; Query == [] ->
    {ok, _} = glc:compile(Module, glc:null(false));
trace_filter(Module, Query) when is_list(Query) ->
    {ok, _} = glc:compile(Module,
			  glc_lib:reduce(trace_any(Query))).

validate_trace({Filter, Level, {Destination, ID}})
    when is_tuple(Filter);
	 is_list(Filter), is_atom(Level), is_atom(Destination) ->
    case validate_trace({Filter, Level, Destination}) of
      {ok, {F, L, D}} -> {ok, {F, L, {D, ID}}};
      Error -> Error
    end;
validate_trace({Filter, Level, Destination})
    when is_tuple(Filter);
	 is_list(Filter), is_atom(Level), is_atom(Destination) ->
    ValidFilter = validate_trace_filter(Filter),
    try config_to_mask(Level) of
      _ when not ValidFilter -> {error, invalid_trace};
      L when is_list(Filter) ->
	  {ok, {trace_all(Filter), L, Destination}};
      L -> {ok, {Filter, L, Destination}}
    catch
      _:_ -> {error, invalid_level}
    end;
validate_trace(_) -> {error, invalid_trace}.

validate_trace_filter(Filter)
    when is_tuple(Filter),
	 is_atom(element(1, Filter)) =:= false ->
    false;
validate_trace_filter(Filter) when is_list(Filter) ->
    lists:all(fun validate_trace_filter/1, Filter);
validate_trace_filter({Key, '*'}) when is_atom(Key) ->
    true;
validate_trace_filter({any, L}) when is_list(L) ->
    lists:all(fun validate_trace_filter/1, L);
validate_trace_filter({all, L}) when is_list(L) ->
    lists:all(fun validate_trace_filter/1, L);
validate_trace_filter({null, Bool})
    when is_boolean(Bool) ->
    true;
validate_trace_filter({Key, _Value})
    when is_atom(Key) ->
    true;
validate_trace_filter({Key, '=', _Value})
    when is_atom(Key) ->
    true;
validate_trace_filter({Key, '!=', _Value})
    when is_atom(Key) ->
    true;
validate_trace_filter({Key, '<', _Value})
    when is_atom(Key) ->
    true;
validate_trace_filter({Key, '=<', _Value})
    when is_atom(Key) ->
    true;
validate_trace_filter({Key, '>', _Value})
    when is_atom(Key) ->
    true;
validate_trace_filter({Key, '>=', _Value})
    when is_atom(Key) ->
    true;
validate_trace_filter(_) -> false.

trace_all(Query) -> glc:all(trace_acc(Query)).

trace_any(Query) -> glc:any(Query).

trace_acc(Query) -> trace_acc(Query, []).

trace_acc([], Acc) -> lists:reverse(Acc);
trace_acc([{any, L} | T], Acc) ->
    trace_acc(T, [glc:any(L) | Acc]);
trace_acc([{all, L} | T], Acc) ->
    trace_acc(T, [glc:all(L) | Acc]);
trace_acc([{null, Bool} | T], Acc) ->
    trace_acc(T, [glc:null(Bool) | Acc]);
trace_acc([{Key, '*'} | T], Acc) ->
    trace_acc(T, [glc:wc(Key) | Acc]);
trace_acc([{Key, '!'} | T], Acc) ->
    trace_acc(T, [glc:nf(Key) | Acc]);
trace_acc([{Key, Val} | T], Acc) ->
    trace_acc(T, [glc:eq(Key, Val) | Acc]);
trace_acc([{Key, '=', Val} | T], Acc) ->
    trace_acc(T, [glc:eq(Key, Val) | Acc]);
trace_acc([{Key, '!=', Val} | T], Acc) ->
    trace_acc(T, [glc:neq(Key, Val) | Acc]);
trace_acc([{Key, '>', Val} | T], Acc) ->
    trace_acc(T, [glc:gt(Key, Val) | Acc]);
trace_acc([{Key, '>=', Val} | T], Acc) ->
    trace_acc(T, [glc:gte(Key, Val) | Acc]);
trace_acc([{Key, '=<', Val} | T], Acc) ->
    trace_acc(T, [glc:lte(Key, Val) | Acc]);
trace_acc([{Key, '<', Val} | T], Acc) ->
    trace_acc(T, [glc:lt(Key, Val) | Acc]).

check_traces(_, _, [], Acc) -> lists:flatten(Acc);
check_traces(Attrs, Level,
	     [{_, {mask, FilterLevel}, _} | Flows], Acc)
    when Level band FilterLevel == 0 ->
    check_traces(Attrs, Level, Flows, Acc);
check_traces(Attrs, Level, [{Filter, _, _} | Flows],
	     Acc)
    when length(Attrs) < length(Filter) ->
    check_traces(Attrs, Level, Flows, Acc);
check_traces(Attrs, Level, [Flow | Flows], Acc) ->
    check_traces(Attrs, Level, Flows,
		 [check_trace(Attrs, Flow) | Acc]).

check_trace(Attrs, {Filter, _Level, Dest})
    when is_list(Filter) ->
    check_trace(Attrs, {trace_all(Filter), _Level, Dest});
check_trace(Attrs, {Filter, _Level, Dest})
    when is_tuple(Filter) ->
    Made = gre:make(Attrs, [list]),
    glc:handle(lager_default_tracer, Made),
    Match = glc_lib:matches(Filter, Made),
    case Match of
      true -> Dest;
      false -> []
    end.

-spec is_loggable(lager_msg:lager_msg(),
		  non_neg_integer() | {mask, non_neg_integer()},
		  term()) -> boolean().

is_loggable(Msg, {mask, Mask}, MyName) ->
    lager_msg:severity_as_int(Msg) band Mask /= 0 orelse
      lists:member(MyName, lager_msg:destinations(Msg));
is_loggable(Msg, SeverityThreshold, MyName) ->
    lager_msg:severity_as_int(Msg) =< SeverityThreshold
      orelse
      lists:member(MyName, lager_msg:destinations(Msg)).

i2l(I) when I < 10 -> [$0, $0 + I];
i2l(I) -> integer_to_list(I).

i3l(I) when I < 100 -> [$0 | i2l(I)];
i3l(I) -> integer_to_list(I).

expand_path(RelPath) ->
    case application:get_env(lager, log_root) of
      {ok, LogRoot} when is_list(LogRoot) ->
	  case string:str(filename:dirname(RelPath), LogRoot) of
	    X when X > 0 -> RelPath;
	    _Zero -> filename:join(LogRoot, RelPath)
	  end;
      undefined -> RelPath
    end.

find_file(_File1, _Handlers = []) -> false;
find_file(File1,
	  [{{lager_file_backend, File2}, _Handler, _Sink} =
	       HandlerInfo
	   | Handlers]) ->
    File1Abs = filename:absname(File1),
    File2Abs =
	filename:absname(lager_util:expand_path(File2)),
    case File1Abs =:= File2Abs of
      true -> HandlerInfo;
      false -> find_file(File1, Handlers)
    end;
find_file(File1, [_HandlerInfo | Handlers]) ->
    find_file(File1, Handlers).

check_hwm(Shaper = #lager_shaper{hwm = undefined}) ->
    {true, 0, Shaper};
check_hwm(Shaper = #lager_shaper{mps = Mps, hwm = Hwm})
    when Mps < Hwm ->
    {true, 0, Shaper#lager_shaper{mps = Mps + 1}};
check_hwm(Shaper = #lager_shaper{lasttime = Last,
				 dropped = Drop}) ->
    {M, S, _} = Now = os:timestamp(),
    case Last of
      {M, S, _} ->
	  NewDrops = discard_messages(Now, 0),
	  {false, 0,
	   Shaper#lager_shaper{dropped = Drop + NewDrops}};
      _ ->
	  {true, Drop,
	   Shaper#lager_shaper{dropped = 0, mps = 1,
			       lasttime = Now}}
    end.

discard_messages(Second, Count) ->
    {M, S, _} = os:timestamp(),
    case Second of
      {M, S, _} ->
	  receive
	    {notify, _Event} -> discard_messages(Second, Count + 1)
	    after 0 -> Count
	  end;
      _ -> Count
    end.

make_internal_sink_name(lager) -> lager_event;
make_internal_sink_name(Sink) ->
    list_to_atom(atom_to_list(Sink) ++ "_lager_event").

-spec otp_version() -> pos_integer().

otp_version() ->
    {Vsn, _} = string:to_integer(case
				   erlang:system_info(otp_release)
				     of
				   [$R | Rel] -> Rel;
				   Rel -> Rel
				 end),
    Vsn.


