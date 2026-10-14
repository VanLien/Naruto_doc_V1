-file("src/encode_uri.erl", 1).

-module(encode_uri).

-lager_records([]).

-author('Renato Albano <renatoalbano@gmail.com>').

-export([encode_tuplelist/1, encode/1]).

-spec encode_tuplelist(Data :: [{string(),
				 string()}, ...]) -> string().

encode_tuplelist(Data) -> encode_tuplelist(Data, "").

encode_tuplelist([], Acc) -> Acc;
encode_tuplelist([{Key, Value} | R], "") ->
    encode_tuplelist(R,
		     encode(Key) ++ "=" ++ encode(to_list(Value)));
encode_tuplelist([{Key, Value} | R], Acc) ->
    encode_tuplelist(R,
		     Acc ++
		       "&" ++ encode(Key) ++ "=" ++ encode(to_list(Value))).

-spec encode(Data :: string()) -> string().

encode([C | Cs]) when C >= $a, C =< $z ->
    [C | encode(Cs)];
encode([C | Cs]) when C >= $A, C =< $Z ->
    [C | encode(Cs)];
encode([C | Cs]) when C >= $0, C =< $9 ->
    [C | encode(Cs)];
encode([C | Cs]) when C == 32 -> [$+ | encode(Cs)];
encode([C = $- | Cs]) -> [C | encode(Cs)];
encode([C = $_ | Cs]) -> [C | encode(Cs)];
encode([C = 46 | Cs]) -> [C | encode(Cs)];
encode([C = $! | Cs]) -> [C | encode(Cs)];
encode([C = $~ | Cs]) -> [C | encode(Cs)];
encode([C = $* | Cs]) -> [C | encode(Cs)];
encode([C = 39 | Cs]) -> [C | encode(Cs)];
encode([C = $( | Cs]) -> [C | encode(Cs)];
encode([C = $) | Cs]) -> [C | encode(Cs)];
encode([C | Cs]) when C =< 127 ->
    escape_byte(C) ++ encode(Cs);
encode([C | Cs]) when (C >= 127) and (C =< 2047) ->
    escape_byte(C bsr 6 + 192) ++
      escape_byte(C band 63 + 128) ++ encode(Cs);
encode([C | Cs]) when C > 2047 ->
    escape_byte(C bsr 12 + 224) ++
      escape_byte(63 band (C bsr 6) + 128) ++
	escape_byte(C band 63 + 128) ++ encode(Cs);
encode([C | Cs]) -> escape_byte(C) ++ encode(Cs);
encode([]) -> [].

hex_octet(N) when N =< 9 -> [$0 + N];
hex_octet(N) when N > 15 ->
    hex_octet(N bsr 4) ++ hex_octet(N band 15);
hex_octet(N) -> [N - 10 + $a].

escape_byte(C) -> H = hex_octet(C), normalize(H).

normalize(H) when length(H) == 1 -> "%0" ++ H;
normalize(H) -> "%" ++ H.

to_list(X) when is_integer(X) -> integer_to_list(X);
to_list(X) when is_float(X) -> float_to_list(X);
to_list(X) when is_atom(X) -> atom_to_list(X);
to_list(X) when is_binary(X) ->
    unicode:characters_to_list(X);
to_list(X) when is_pid(X) -> pid_to_list(X);
to_list(X) when is_function(X) -> erlang:fun_to_list(X);
to_list(X) when is_port(X) -> erlang:port_to_list(X);
to_list(X) when is_tuple(X) -> tuple_to_list(X);
to_list(X) when is_list(X) -> X.


