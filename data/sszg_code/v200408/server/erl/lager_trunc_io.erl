-file("src/lager_trunc_io.erl", 1).

-module(lager_trunc_io).

-author('matthias@corelatus.se').

-export([format/3, format/4, print/2, print/3, fprint/2,
	 fprint/3, safe/2]).

-version("$Id: trunc_io.erl,v 1.11 2009-02-23 "
	 "12:01:06 matthias Exp $").

-type option() :: {depth, integer()} |
		  {lists_as_strings, boolean()} |
		  {force_strings, boolean()}.

-type options() :: [option()].

-record(print_options,
	{depth = -1  :: integer(),
	 lists_as_strings = true  :: boolean(),
	 force_strings = false  :: boolean()}).

format(Fmt, Args, Max) -> format(Fmt, Args, Max, []).

format(Fmt, Args, Max, Options) ->
    try lager_format:format(Fmt, Args, Max, Options) catch
      _What:_Why -> erlang:error(badarg, [Fmt, Args])
    end.

-spec fprint(term(), pos_integer()) -> string().

fprint(Term, Max) -> fprint(Term, Max, []).

-spec fprint(term(), pos_integer(),
	     options()) -> string().

fprint(T, Max, Options) ->
    {L, _} = print(T, Max,
		   prepare_options(Options, #print_options{})),
    lists:flatten(L).

-spec safe(term(), pos_integer()) -> {string(),
				      pos_integer()} |
				     {string()}.

safe(What, Len) ->
    case catch print(What, Len) of
      {L, Used} when is_list(L) -> {L, Used};
      _ -> {"unable to print" ++ io_lib:write(What, 99)}
    end.

-spec print(term(), pos_integer()) -> {iolist(),
				       pos_integer()}.

print(Term, Max) -> print(Term, Max, []).

-spec print(term(), pos_integer(),
	    options() | #print_options{}) -> {iolist(),
					      pos_integer()}.

print(Term, Max, Options) when is_list(Options) ->
    print(Term, Max,
	  prepare_options(Options, #print_options{}));
print(Term, _Max, #print_options{force_strings = true})
    when not is_list(Term), not is_binary(Term),
	 not is_atom(Term) ->
    erlang:error(badarg);
print(_, Max, _Options) when Max < 0 -> {"...", 3};
print(_, _, #print_options{depth = 0}) -> {"...", 3};
print(Atom, _Max,
      #print_options{force_strings = NoQuote})
    when is_atom(Atom) ->
    L = atom_to_list(Atom),
    R = case atom_needs_quoting_start(L) andalso not NoQuote
	    of
	  true -> lists:flatten([$', L, $']);
	  false -> L
	end,
    {R, length(R)};
print(<<>>, _Max, #print_options{depth = 1}) ->
    {"<<>>", 4};
print(Bin, _Max, #print_options{depth = 1})
    when is_binary(Bin) ->
    {"<<...>>", 7};
print(<<>>, _Max, Options) ->
    case Options#print_options.force_strings of
      true -> {"", 0};
      false -> {"<<>>", 4}
    end;
print(Binary, 0, _Options) when is_bitstring(Binary) ->
    {"<<..>>", 6};
print(Bin, Max, _Options)
    when is_binary(Bin), Max < 2 ->
    {"<<...>>", 7};
print(Binary, Max, Options) when is_binary(Binary) ->
    B = binary_to_list(Binary, 1,
		       lists:min([Max, byte_size(Binary)])),
    {Res, Length} = case
		      Options#print_options.lists_as_strings orelse
			Options#print_options.force_strings
			of
		      true ->
			  Depth = Options#print_options.depth,
			  MaxSize = (Depth - 1) * 4,
			  In = case Depth > -1 andalso
				      MaxSize < length(B) andalso
					not Options#print_options.force_strings
				   of
				 true -> string:substr(B, 1, MaxSize);
				 false -> B
			       end,
			  MaxLen = case Options#print_options.force_strings of
				     true -> Max;
				     false -> Max - 1
				   end,
			  try alist(In, MaxLen, Options) of
			    {L0, Len0} ->
				case Options#print_options.force_strings of
				  false ->
				      case B /= In of
					true -> {[$", L0, "..."], Len0 + 4};
					false -> {[$" | L0], Len0 + 1}
				      end;
				  true -> {L0, Len0}
				end
			  catch
			    {unprintable, C} ->
				Index = string:chr(In, C),
				case Index > 1 andalso
				       Options#print_options.depth =< Index
					 andalso
					 Options#print_options.depth > -1
					   andalso
					   not
					     Options#print_options.force_strings
				    of
				  true ->
				      {L0, Len0} = alist_start(string:substr(In,
									     1,
									     Index
									       -
									       1),
							       Max - 1,
							       Options),
				      {L0 ++ "...", Len0 + 3};
				  false ->
				      list_body(In, Max - 4, dec_depth(Options),
						true)
				end
			  end;
		      _ -> list_body(B, Max - 4, dec_depth(Options), true)
		    end,
    case Options#print_options.force_strings of
      true -> {Res, Length};
      _ -> {["<<", Res, ">>"], Length + 4}
    end;
print({inline_bitstring, B}, _Max, _Options)
    when is_bitstring(B) ->
    Size = bit_size(B),
    <<Value:Size>> = B,
    ValueStr = integer_to_list(Value),
    SizeStr = integer_to_list(Size),
    {[ValueStr, $:, SizeStr],
     length(ValueStr) + length(SizeStr) + 1};
print(BitString, Max, Options)
    when is_bitstring(BitString) ->
    BL = case byte_size(BitString) > Max of
	   true -> binary_to_list(BitString, 1, Max);
	   _ ->
	       R = erlang:bitstring_to_list(BitString),
	       {Bytes, [Bits]} =
		   lists:splitwith(fun erlang:is_integer/1, R),
	       Bytes ++ [{inline_bitstring, Bits}]
	 end,
    {X, Len0} = list_body(BL, Max - 4, dec_depth(Options),
			  true),
    {["<<", X, ">>"], Len0 + 4};
print(Float, _Max, _Options) when is_float(Float) ->
    L = io_lib_format:fwrite_g(Float), {L, length(L)};
print(Fun, Max, _Options) when is_function(Fun) ->
    L = erlang:fun_to_list(Fun),
    case length(L) > Max of
      true ->
	  S = erlang:max(5, Max),
	  Res = string:substr(L, 1, S) ++ "..>",
	  {Res, length(Res)};
      _ -> {L, length(L)}
    end;
print(Integer, _Max, _Options)
    when is_integer(Integer) ->
    L = integer_to_list(Integer), {L, length(L)};
print(Pid, _Max, _Options) when is_pid(Pid) ->
    L = pid_to_list(Pid), {L, length(L)};
print(Ref, _Max, _Options) when is_reference(Ref) ->
    L = erlang:ref_to_list(Ref), {L, length(L)};
print(Port, _Max, _Options) when is_port(Port) ->
    L = erlang:port_to_list(Port), {L, length(L)};
print({'$lager_record', Name, Fields}, Max, Options) ->
    Leader = "#" ++ atom_to_list(Name) ++ "{",
    {RC, Len} = record_fields(Fields,
			      Max - length(Leader) + 1, dec_depth(Options)),
    {[Leader, RC, "}"], Len + length(Leader) + 1};
print(Tuple, Max, Options) when is_tuple(Tuple) ->
    {TC, Len} = tuple_contents(Tuple, Max - 2, Options),
    {[${, TC, $}], Len + 2};
print(List, Max, Options) when is_list(List) ->
    case Options#print_options.lists_as_strings orelse
	   Options#print_options.force_strings
	of
      true -> alist_start(List, Max, dec_depth(Options));
      _ ->
	  {R, Len} = list_body(List, Max - 2, dec_depth(Options),
			       false),
	  {[$[, R, $]], Len + 2}
    end;
print(Map, Max, Options) ->
    case erlang:is_builtin(erlang, is_map, 1) andalso
	   erlang:is_map(Map)
	of
      true ->
	  {MapBody, Len} = map_body(Map, Max - 3,
				    dec_depth(Options)),
	  {[$#, ${, MapBody, $}], Len + 3};
      false -> error(badarg, [Map, Max, Options])
    end.

tuple_contents(Tuple, Max, Options) ->
    L = tuple_to_list(Tuple),
    list_body(L, Max, dec_depth(Options), true).

list_body([], _Max, _Options, _Tuple) -> {[], 0};
list_body(_, Max, _Options, _Tuple) when Max < 4 ->
    {"...", 3};
list_body(_, _Max, #print_options{depth = 0}, _Tuple) ->
    {"...", 3};
list_body([H], Max, Options = #print_options{depth = 1},
	  _Tuple) ->
    print(H, Max, Options);
list_body([H | _], Max,
	  Options = #print_options{depth = 1}, Tuple) ->
    {List, Len} = print(H, Max - 4, Options),
    Sep = case Tuple of
	    true -> $,;
	    false -> $|
	  end,
    {[List ++ [Sep | "..."]], Len + 4};
list_body([H | T], Max, Options, Tuple) ->
    {List, Len} = print(H, Max, Options),
    {Final, FLen} = list_bodyc(T, Max - Len, Options,
			       Tuple),
    {[List | Final], FLen + Len};
list_body(X, Max, Options, _Tuple) ->
    {List, Len} = print(X, Max - 1, Options),
    {[$|, List], Len + 1}.

list_bodyc([], _Max, _Options, _Tuple) -> {[], 0};
list_bodyc(_, Max, _Options, _Tuple) when Max < 5 ->
    {",...", 4};
list_bodyc(_, _Max, #print_options{depth = 1}, true) ->
    {",...", 4};
list_bodyc(_, _Max, #print_options{depth = 1}, false) ->
    {"|...", 4};
list_bodyc([H | T], Max,
	   #print_options{depth = Depth} = Options, Tuple) ->
    {List, Len} = print(H, Max, dec_depth(Options)),
    {Final, FLen} = list_bodyc(T, Max - Len - 1,
			       dec_depth(Options), Tuple),
    Sep = case Depth == 1 andalso not Tuple of
	    true -> $|;
	    _ -> $,
	  end,
    {[Sep, List | Final], FLen + Len + 1};
list_bodyc(X, Max, Options, _Tuple) ->
    {List, Len} = print(X, Max - 1, Options),
    {[$|, List], Len + 1}.

map_body(Map, Max, #print_options{depth = Depth})
    when Max < 4; Depth =:= 0 ->
    case erlang:map_size(Map) of
      0 -> {[], 0};
      _ -> {"...", 3}
    end;
map_body(Map, Max, Options) ->
    case maps:to_list(Map) of
      [] -> {[], 0};
      [{Key, Value} | Rest] ->
	  {KeyStr, KeyLen} = print(Key, Max - 4, Options),
	  DiffLen = KeyLen + 4,
	  {ValueStr, ValueLen} = print(Value, Max - DiffLen,
				       Options),
	  DiffLen2 = DiffLen + ValueLen,
	  {Final, FLen} = map_bodyc(Rest, Max - DiffLen2,
				    dec_depth(Options)),
	  {[KeyStr, " => ", ValueStr | Final], DiffLen2 + FLen}
    end.

map_bodyc([], _Max, _Options) -> {[], 0};
map_bodyc(_Rest, Max, #print_options{depth = Depth})
    when Max < 5; Depth =:= 0 ->
    {",...", 4};
map_bodyc([{Key, Value} | Rest], Max, Options) ->
    {KeyStr, KeyLen} = print(Key, Max - 5, Options),
    DiffLen = KeyLen + 5,
    {ValueStr, ValueLen} = print(Value, Max - DiffLen,
				 Options),
    DiffLen2 = DiffLen + ValueLen,
    {Final, FLen} = map_bodyc(Rest, Max - DiffLen2,
			      dec_depth(Options)),
    {[$,, KeyStr, " => ", ValueStr | Final],
     DiffLen2 + FLen}.

alist_start([], _Max,
	    #print_options{force_strings = true}) ->
    {"", 0};
alist_start([], _Max, _Options) -> {"[]", 2};
alist_start(_, Max, _Options) when Max < 4 ->
    {"...", 3};
alist_start(_, _Max, #print_options{depth = 0}) ->
    {"[...]", 5};
alist_start(L, Max,
	    #print_options{force_strings = true} = Options) ->
    alist(L, Max, Options);
alist_start([H | T], Max, Options)
    when is_integer(H), H >= 32, H =< 126 ->
    try alist([H | T], Max - 1, Options) of
      {L, Len} -> {[$" | L], Len + 1}
    catch
      {unprintable, _} ->
	  {R, Len} = list_body([H | T], Max - 2, Options, false),
	  {[$[, R, $]], Len + 2}
    end;
alist_start([H | T], Max, Options)
    when is_integer(H), H >= 160, H =< 255 ->
    try alist([H | T], Max - 1, Options) of
      {L, Len} -> {[$" | L], Len + 1}
    catch
      {unprintable, _} ->
	  {R, Len} = list_body([H | T], Max - 2, Options, false),
	  {[$[, R, $]], Len + 2}
    end;
alist_start([H | T], Max, Options)
    when H =:= $\t;
	 H =:= $\n;
	 H =:= $\r;
	 H =:= $\v;
	 H =:= $\e;
	 H =:= $\f;
	 H =:= $\b ->
    try alist([H | T], Max - 1, Options) of
      {L, Len} -> {[$" | L], Len + 1}
    catch
      {unprintable, _} ->
	  {R, Len} = list_body([H | T], Max - 2, Options, false),
	  {[$[, R, $]], Len + 2}
    end;
alist_start(L, Max, Options) ->
    {R, Len} = list_body(L, Max - 2, Options, false),
    {[$[, R, $]], Len + 2}.

alist([], _Max, #print_options{force_strings = true}) ->
    {"", 0};
alist([], _Max, _Options) -> {"\"", 1};
alist(_, Max, #print_options{force_strings = true})
    when Max < 4 ->
    {"...", 3};
alist(_, Max, #print_options{force_strings = false})
    when Max < 5 ->
    {"...\"", 4};
alist([H | T], Max,
      Options = #print_options{force_strings = false,
			       lists_as_strings = true})
    when H =:= $"; H =:= $\\ ->
    {L, Len} = alist(T, Max - 1, Options),
    {[$\\, H | L], Len + 2};
alist([H | T], Max, Options)
    when is_integer(H), H >= 32, H =< 126 ->
    {L, Len} = alist(T, Max - 1, Options),
    {[H | L], Len + 1};
alist([H | T], Max, Options)
    when is_integer(H), H >= 160, H =< 255 ->
    {L, Len} = alist(T, Max - 1, Options),
    {[H | L], Len + 1};
alist([H | T], Max, Options)
    when H =:= $\t;
	 H =:= $\n;
	 H =:= $\r;
	 H =:= $\v;
	 H =:= $\e;
	 H =:= $\f;
	 H =:= $\b ->
    {L, Len} = alist(T, Max - 1, Options),
    case Options#print_options.force_strings of
      true -> {[H | L], Len + 1};
      _ -> {[escape(H) | L], Len + 1}
    end;
alist([H | T], Max,
      #print_options{force_strings = true} = Options)
    when is_integer(H) ->
    {L, Len} = alist(T, Max - 1, Options),
    {[H | L], Len + 1};
alist([H | T], Max,
      Options = #print_options{force_strings = true})
    when is_binary(H); is_list(H) ->
    {List, Len} = print(H, Max, Options),
    case Max - Len =< 0 of
      true -> {List, Len};
      false ->
	  {Final, FLen} = alist(T, Max - Len, Options),
	  {[List | Final], FLen + Len}
    end;
alist(_, _, #print_options{force_strings = true}) ->
    erlang:error(badarg);
alist([H | _L], _Max, _Options) ->
    throw({unprintable, H});
alist(H, _Max, _Options) -> throw({unprintable, H}).

atom_needs_quoting_start([H | T])
    when H >= $a, H =< $z ->
    atom_needs_quoting(T);
atom_needs_quoting_start(_) -> true.

atom_needs_quoting([]) -> false;
atom_needs_quoting([H | T])
    when H >= $a andalso H =< $z;
	 H >= $A andalso H =< $Z;
	 H >= $0 andalso H =< $9;
	 H == $@;
	 H == $_ ->
    atom_needs_quoting(T);
atom_needs_quoting(_) -> true.

-spec prepare_options(options(),
		      #print_options{}) -> #print_options{}.

prepare_options([], Options) -> Options;
prepare_options([{depth, Depth} | T], Options)
    when is_integer(Depth) ->
    prepare_options(T,
		    Options#print_options{depth = Depth});
prepare_options([{lists_as_strings, Bool} | T], Options)
    when is_boolean(Bool) ->
    prepare_options(T,
		    Options#print_options{lists_as_strings = Bool});
prepare_options([{force_strings, Bool} | T], Options)
    when is_boolean(Bool) ->
    prepare_options(T,
		    Options#print_options{force_strings = Bool}).

dec_depth(#print_options{depth = Depth} = Options)
    when Depth > 0 ->
    Options#print_options{depth = Depth - 1};
dec_depth(Options) -> Options.

escape($\t) -> "\\t";
escape($\n) -> "\\n";
escape($\r) -> "\\r";
escape($\e) -> "\\e";
escape($\f) -> "\\f";
escape($\b) -> "\\b";
escape($\v) -> "\\v".

record_fields([], _, _) -> {"", 0};
record_fields(_, Max, #print_options{depth = D})
    when Max < 4; D == 0 ->
    {"...", 3};
record_fields([{Field, Value} | T], Max, Options) ->
    {ExtraChars, Terminator} = case T of
				 [] -> {1, []};
				 _ -> {2, ","}
			       end,
    {FieldStr, FieldLen} = print(Field, Max - ExtraChars,
				 Options),
    {ValueStr, ValueLen} = print(Value,
				 Max - (FieldLen + ExtraChars), Options),
    {Final, FLen} = record_fields(T,
				  Max - (FieldLen + ValueLen + ExtraChars),
				  dec_depth(Options)),
    {[FieldStr ++ "=" ++ ValueStr ++ Terminator | Final],
     FLen + FieldLen + ValueLen + ExtraChars}.


