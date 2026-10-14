-file("src/lager_default_formatter.erl", 1).

-module(lager_default_formatter).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_default_formatter.erl", 23).

-export([format/2, format/3]).

-spec format(lager_msg:lager_msg(), list(),
	     list()) -> any().

format(Msg, [], Colors) ->
    format(Msg, [{eol, "\n"}], Colors);
format(Msg, [{eol, EOL}], Colors) ->
    format(Msg,
	   [date, " ", time, " ", color, "[", severity, "] ",
	    {pid, ""},
	    {module,
	     [{pid, ["@"], ""}, module,
	      {function, [":", function], ""},
	      {line, [":", line], ""}],
	     ""},
	    " ", message, EOL],
	   Colors);
format(Message, Config, Colors) ->
    [case V of
       color -> output_color(Message, Colors);
       _ -> output(V, Message)
     end
     || V <- Config].

-spec format(lager_msg:lager_msg(), list()) -> any().

format(Msg, Config) -> format(Msg, Config, []).

-spec output(term(), lager_msg:lager_msg()) -> iolist().

output(message, Msg) -> lager_msg:message(Msg);
output(date, Msg) ->
    {D, _T} = lager_msg:datetime(Msg), D;
output(time, Msg) ->
    {_D, T} = lager_msg:datetime(Msg), T;
output(severity, Msg) ->
    atom_to_list(lager_msg:severity(Msg));
output(severity_upper, Msg) ->
    uppercase_severity(lager_msg:severity(Msg));
output(blank, _Msg) -> output({blank, " "}, _Msg);
output({blank, Fill}, _Msg) -> Fill;
output(sev, Msg) ->
    [lager_util:level_to_chr(lager_msg:severity(Msg))];
output(metadata, Msg) ->
    output({metadata, "=", " "}, Msg);
output({metadata, IntSep, FieldSep}, Msg) ->
    MD = lists:keysort(1, lager_msg:metadata(Msg)),
    string:join([io_lib:format("~s~s~p", [K, IntSep, V])
		 || {K, V} <- MD],
		FieldSep);
output(Prop, Msg) when is_atom(Prop) ->
    Metadata = lager_msg:metadata(Msg),
    make_printable(get_metadata(Prop, Metadata,
				<<"Undefined">>));
output({Prop, Default}, Msg) when is_atom(Prop) ->
    Metadata = lager_msg:metadata(Msg),
    make_printable(get_metadata(Prop, Metadata,
				output(Default, Msg)));
output({Prop, Present, Absent}, Msg)
    when is_atom(Prop) ->
    Metadata = lager_msg:metadata(Msg),
    case get_metadata(Prop, Metadata) of
      undefined -> [output(V, Msg) || V <- Absent];
      _ -> [output(V, Msg) || V <- Present]
    end;
output({Prop, Present, Absent, Width}, Msg)
    when is_atom(Prop) ->
    Metadata = lager_msg:metadata(Msg),
    case get_metadata(Prop, Metadata) of
      undefined -> [output(V, Msg, Width) || V <- Absent];
      _ -> [output(V, Msg, Width) || V <- Present]
    end;
output(Other, _) -> make_printable(Other).

output(message, Msg, _Width) -> lager_msg:message(Msg);
output(date, Msg, _Width) ->
    {D, _T} = lager_msg:datetime(Msg), D;
output(time, Msg, _Width) ->
    {_D, T} = lager_msg:datetime(Msg), T;
output(severity, Msg, Width) ->
    make_printable(atom_to_list(lager_msg:severity(Msg)),
		   Width);
output(sev, Msg, _Width) ->
    [lager_util:level_to_chr(lager_msg:severity(Msg))];
output(blank, _Msg, _Width) ->
    output({blank, " "}, _Msg, _Width);
output({blank, Fill}, _Msg, _Width) -> Fill;
output(metadata, Msg, _Width) ->
    output({metadata, "=", " "}, Msg, _Width);
output({metadata, IntSep, FieldSep}, Msg, _Width) ->
    MD = lists:keysort(1, lager_msg:metadata(Msg)),
    [string:join([io_lib:format("~s~s~p", [K, IntSep, V])
		  || {K, V} <- MD],
		 FieldSep)];
output(Prop, Msg, Width) when is_atom(Prop) ->
    Metadata = lager_msg:metadata(Msg),
    make_printable(get_metadata(Prop, Metadata,
				<<"Undefined">>),
		   Width);
output({Prop, Default}, Msg, Width)
    when is_atom(Prop) ->
    Metadata = lager_msg:metadata(Msg),
    make_printable(get_metadata(Prop, Metadata,
				output(Default, Msg)),
		   Width);
output(Other, _, Width) -> make_printable(Other, Width).

output_color(_Msg, []) -> [];
output_color(Msg, Colors) ->
    Level = lager_msg:severity(Msg),
    case lists:keyfind(Level, 1, Colors) of
      {_, Color} -> Color;
      _ -> []
    end.

-spec make_printable(any()) -> iolist().

make_printable(A) when is_atom(A) -> atom_to_list(A);
make_printable(P) when is_pid(P) -> pid_to_list(P);
make_printable(L) when is_list(L) orelse is_binary(L) ->
    L;
make_printable(Other) -> io_lib:format("~p", [Other]).

make_printable(A, W) when is_integer(W) ->
    string:left(make_printable(A), W);
make_printable(A, {Align, W}) when is_integer(W) ->
    case Align of
      left -> string:left(make_printable(A), W);
      centre -> string:centre(make_printable(A), W);
      right -> string:right(make_printable(A), W);
      _ -> string:left(make_printable(A), W)
    end;
make_printable(A, _W) -> make_printable(A).

get_metadata(Key, Metadata) ->
    get_metadata(Key, Metadata, undefined).

get_metadata(Key, Metadata, Default) ->
    case lists:keyfind(Key, 1, Metadata) of
      false -> Default;
      {Key, Value} -> Value
    end.

uppercase_severity(debug) -> "DEBUG";
uppercase_severity(info) -> "INFO";
uppercase_severity(notice) -> "NOTICE";
uppercase_severity(warning) -> "WARNING";
uppercase_severity(error) -> "ERROR";
uppercase_severity(critical) -> "CRITICAL";
uppercase_severity(alert) -> "ALERT";
uppercase_severity(emergency) -> "EMERGENCY".


