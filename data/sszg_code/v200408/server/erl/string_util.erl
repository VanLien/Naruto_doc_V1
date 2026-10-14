-file("src/lib/string_util.erl", 1).

-module(string_util).

-lager_records([]).

-export([to_lower/1, to_upper/1, to_float/1, to_byte/1,
	 to_string/1, trim/1, trim/2, ltrim/1, ltrim/2, rtrim/1,
	 rtrim/2, line_num/1, line_sub/3, implode/2,
	 implode_to_binary/2, explode/2, explode_chr/2, concat/1,
	 md5/1, rand_hex/1, rand_word/1, urlencode/1,
	 escape_uri/1, sha1/2, sha/1, name_width/1, regexp/2,
	 utf8_len/1, utf8_len2/1, gbk_len/1, gbk_len2/1,
	 string_width/1, binary_implode/2, get_word/1, sub/2,
	 sub_en/2]).

to_lower(Str) -> to_lower(Str, []).

to_lower([C | Cs], Acc) when C >= $A, C =< $Z ->
    to_lower(Cs, [C + ($a - $A) | Acc]);
to_lower([C | Cs], Acc) -> to_lower(Cs, [C | Acc]);
to_lower([], Acc) -> lists:reverse(Acc).

to_upper(Str) -> to_upper(Str, []).

to_upper([C | Cs], Acc) when C >= $a, C =< $z ->
    to_upper(Cs, [C - ($a - $A) | Acc]);
to_upper([C | Cs], Acc) -> to_upper(Cs, [C | Acc]);
to_upper([], Acc) -> lists:reverse(Acc).

to_float(Str) ->
    Str2 = [Chr
	    || Chr <- Str,
	       Chr >= $0 andalso Chr =< $9 orelse Chr == $.],
    case string:chr(Str2, $.) > 0 of
      false -> list_to_integer(Str2) * 1.0;
      true -> list_to_float(Str2)
    end.

to_byte(Str) ->
    Arg = case to_lower(lists:reverse(Str)) of
	    [$k | _] -> 1024;
	    [$m | _] -> 1048576;
	    [$g | _] -> 1073741824;
	    [$t | _] -> 1099511627776;
	    [$b, $k | _] -> 1024;
	    [$b, $m | _] -> 1048576;
	    [$b, $g | _] -> 1073741824;
	    [$b, $t | _] -> 1099511627776;
	    _ -> 1
	  end,
    util:uint(to_float(Str) * Arg).

trim(Str) -> trim(Str, [32, 9, 10, 13, 0, 11]).

trim(Str, Chars) -> rtrim(ltrim(Str, Chars), Chars).

ltrim(Str) -> ltrim(Str, [32, 9, 10, 13, 0, 11]).

ltrim([], _Chars) -> [];
ltrim(L = [C | T], Chars) ->
    case lists:member(C, Chars) of
      true -> ltrim(T, Chars);
      false -> L
    end.

rtrim(Str) -> rtrim(Str, [32, 9, 10, 13, 0, 11]).

rtrim(Str, Chars) ->
    lists:reverse(ltrim(lists:reverse(Str), Chars)).

line_num(Str) -> string:words(Str, $\n).

line_sub(Str, StartLine, LineNum) ->
    Lines = explode_chr(Str, $\n),
    lists:sublist(Lines, StartLine, LineNum).

implode(StrList, Sign) -> string:join(StrList, Sign).

implode_to_binary(StrList, Sign) ->
    erlang:list_to_binary(string:join(StrList, Sign)).

binary_implode([], _BitSign) -> <<>>;
binary_implode([BitStr | L], BitSign) ->
    binary_implode(L, BitStr, BitSign).

binary_implode([], BitMsg, _BitSign) -> BitMsg;
binary_implode([BitStr | L], BitMsg, BitSign) ->
    binary_implode(L,
		   util:format_ex("~s~s~s", [BitMsg, BitSign, BitStr]),
		   BitSign).

explode(Str, Sign) when is_binary(Str) ->
    explode(binary_to_list(Str), Sign);
explode(Str, Sign) when is_binary(Sign) ->
    explode(Str, binary_to_list(Sign));
explode(Str, Sign) -> string:tokens(Str, Sign).

explode_chr(Str, Char) when is_binary(Str) ->
    explode(binary_to_list(Str), Char);
explode_chr(Str, Char) ->
    explode_chr_f1(Str, Char, [], []).

explode_chr_f1([], _Char, Buffer, Res) ->
    lists:reverse([lists:reverse(Buffer) | Res]);
explode_chr_f1([Char | T], Char, Buffer, Res) ->
    explode_chr_f1(T, Char, [],
		   [lists:reverse(Buffer) | Res]);
explode_chr_f1([C | T], Char, Buffer, Res) ->
    explode_chr_f1(T, Char, [C | Buffer], Res).

concat(TermList) ->
    lists:flatmap(fun to_string/1, TermList).

to_string(X) when is_integer(X) -> integer_to_list(X);
to_string(X) when is_float(X) -> float_to_list(X);
to_string(X) when is_atom(X) -> atom_to_list(X);
to_string(X) when is_binary(X) ->
    unicode:characters_to_list(X);
to_string(X) when is_list(X) -> X.

md5(Str) when is_list(Str) ->
    erlang:list_to_binary([case erlang:integer_to_list(N,
						       16)
			       of
			     Sub when length(Sub) == 2 -> to_lower(Sub);
			     Sub when length(Sub) == 1 -> [$0 | to_lower(Sub)];
			     _ -> "00"
			   end
			   || N
				  <- erlang:binary_to_list(crypto:hash(md5,
								       Str))]);
md5(Str) when is_binary(Str) ->
    md5(erlang:binary_to_list(Str)).

sha1(Key, Data) ->
    <<Mac:160/integer>> = crypto:hmac(sha, Key, Data),
    lists:flatten(io_lib:format("~40.16.0b", [Mac])).

-spec sha(iodata()) -> binary().

sha(Data) ->
    list_to_binary([io_lib:format("~2.16.0b", [N])
		    || N <- binary_to_list(crypto:hash(sha, Data))]).

rand_hex(Len) -> rand_hex(Len, []).

rand_hex(0, Str) -> Str;
rand_hex(Len, Str) ->
    C = case util:rand(0, 15) of
	  I when I =< 9 -> $0 + I;
	  I -> $a + I - 10
	end,
    rand_hex(Len - 1, [C | Str]).

rand_word(Len) -> rand_word(Len, []).

rand_word(0, Str) -> Str;
rand_word(Len, Str) ->
    C = case util:rand($a, $z + 10) of
	  I when I > $z -> I - $z - 1 + $0;
	  I -> I
	end,
    rand_word(Len - 1, [C | Str]).

regexp(_Text, []) -> false;
regexp(Text, [H | L]) ->
    case re:run(Text, H,
		[{capture, none}, caseless, unicode])
	of
      match -> true;
      _ -> regexp(Text, L)
    end.

utf8_len(Str) ->
    {AsciiNum, Utf8Num} = utf8_len2(Str),
    AsciiNum + Utf8Num.

utf8_len2(Str) when is_list(Str) ->
    utf8_len2_f1(list_to_binary(Str), 0, 0);
utf8_len2(Str) when is_binary(Str) ->
    utf8_len2_f1(Str, 0, 0).

utf8_len2_f1(<<>>, AsciiNum, Utf8Num) ->
    {AsciiNum, Utf8Num};
utf8_len2_f1(<<H:8, Rest/binary>>, AsciiNum, Utf8Num)
    when H =< 127 ->
    utf8_len2_f1(Rest, AsciiNum + 1, Utf8Num);
utf8_len2_f1(<<H:8, _B:1/binary, Rest/binary>>,
	     AsciiNum, Utf8Num)
    when H >= 192, H =< 223 ->
    utf8_len2_f1(Rest, AsciiNum, Utf8Num + 1);
utf8_len2_f1(<<H:8, _B:2/binary, Rest/binary>>,
	     AsciiNum, Utf8Num)
    when H >= 224, H =< 239 ->
    utf8_len2_f1(Rest, AsciiNum, Utf8Num + 1);
utf8_len2_f1(<<H:8, _B:3/binary, Rest/binary>>,
	     AsciiNum, Utf8Num)
    when H >= 240, H =< 247 ->
    utf8_len2_f1(Rest, AsciiNum, Utf8Num + 1);
utf8_len2_f1(<<H:8, _B:4/binary, Rest/binary>>,
	     AsciiNum, Utf8Num)
    when H >= 248, H =< 251 ->
    utf8_len2_f1(Rest, AsciiNum, Utf8Num + 1);
utf8_len2_f1(<<H:8, _B:5/binary, Rest/binary>>,
	     AsciiNum, Utf8Num)
    when H >= 252, H =< 253 ->
    utf8_len2_f1(Rest, AsciiNum, Utf8Num + 1);
utf8_len2_f1(<<_H:8, Rest/binary>>, AsciiNum,
	     Utf8Num) ->
    utf8_len2_f1(Rest, AsciiNum + 1, Utf8Num).

string_width(String) when is_binary(String) ->
    string_width(unicode:characters_to_list(String));
string_width(String) -> string_width(String, 0).

string_width([], Len) -> Len;
string_width([H | T], Len) ->
    case H > 255 of
      true -> string_width(T, Len + 2);
      false -> string_width(T, Len + 1)
    end.

name_width(String) when is_binary(String) ->
    name_width(unicode:characters_to_list(String));
name_width(String) -> name_width(String, 0).

name_width([], Len) -> util:ceil(Len);
name_width([H | T], Len) ->
    case H > 255 of
      true -> name_width(T, Len + 2);
      false -> name_width(T, Len + 1)
    end.

gbk_len(Str) ->
    {AsciiNum, GbkNum} = gbk_len2(Str), AsciiNum + GbkNum.

gbk_len2(Str) when is_list(Str) ->
    gbk_len2_f1([], 0, 0);
gbk_len2(Str) when is_binary(Str) ->
    gbk_len2_f1(binary_to_list(Str), 0, 0).

gbk_len2_f1([], AsciiNum, GbkNum) -> {AsciiNum, GbkNum};
gbk_len2_f1([C | T], AsciiNum, GbkNum) when C =< 127 ->
    gbk_len2_f1(T, AsciiNum + 1, GbkNum);
gbk_len2_f1([C, C2 | T], AsciiNum, GbkNum)
    when 129 =< C, C =< 254,
	 64 =< C2 andalso C2 =< 126 orelse
	   128 =< C2 andalso C2 =< 254 ->
    gbk_len2_f1(T, AsciiNum, GbkNum + 1);
gbk_len2_f1([_C | T], AsciiNum, GbkNum) ->
    gbk_len2_f1(T, AsciiNum + 1, GbkNum).

urlencode(S) when is_binary(S) ->
    urlencode(binary_to_list(S));
urlencode(S) ->
    list_to_binary([if C >= $a andalso C =< $z orelse
			 C >= $A andalso C =< $Z orelse
			   C >= $0 andalso C =< $9 orelse
			     C == $. orelse C == $- orelse C == $_ ->
			   C;
		       true ->
			   case integer_to_list(C, 16) of
			     [H] -> [$%, $0 | H];
			     H2 -> [$% | H2]
			   end
		    end
		    || C <- S]).

escape_uri(S) when is_list(S) ->
    escape_uri(unicode:characters_to_binary(S));
escape_uri(<<C:8, Cs/binary>>) when C >= $a, C =< $z ->
    [C] ++ escape_uri(Cs);
escape_uri(<<C:8, Cs/binary>>) when C >= $A, C =< $Z ->
    [C] ++ escape_uri(Cs);
escape_uri(<<C:8, Cs/binary>>) when C >= $0, C =< $9 ->
    [C] ++ escape_uri(Cs);
escape_uri(<<C:8, Cs/binary>>) when C == $. ->
    [C] ++ escape_uri(Cs);
escape_uri(<<C:8, Cs/binary>>) when C == $- ->
    [C] ++ escape_uri(Cs);
escape_uri(<<C:8, Cs/binary>>) when C == $_ ->
    [C] ++ escape_uri(Cs);
escape_uri(<<C:8, Cs/binary>>) ->
    escape_byte(C) ++ escape_uri(Cs);
escape_uri(<<>>) -> "".

escape_byte(C) -> "%" ++ hex_octet(C).

hex_octet(N) when N =< 9 -> [$0 + N];
hex_octet(N) when N > 15 ->
    hex_octet(N bsr 4) ++ hex_octet(N band 15);
hex_octet(N) -> [N - 10 + $a].

get_word(<<H:8, Rest/binary>>) when H =< 127 ->
    {<<H>>, Rest};
get_word(<<H:8, B:1/binary, Rest/binary>>)
    when H >= 192, H =< 223 ->
    {<<H:8, B/binary>>, Rest};
get_word(<<H:8, B:2/binary, Rest/binary>>)
    when H >= 224, H =< 239 ->
    {<<H:8, B/binary>>, Rest};
get_word(<<H:8, B:3/binary, Rest/binary>>)
    when H >= 240, H =< 247 ->
    {<<H:8, B/binary>>, Rest};
get_word(<<H:8, B:4/binary, Rest/binary>>)
    when H >= 248, H =< 251 ->
    {<<H:8, B/binary>>, Rest};
get_word(<<H:8, B:5/binary, Rest/binary>>)
    when H >= 252, H =< 253 ->
    {<<H:8, B/binary>>, Rest};
get_word(<<H:8, Rest/binary>>) -> {<<H>>, Rest}.

sub(Bin, Len) when byte_size(Bin) =< Len -> Bin;
sub(Bin, Len) -> do_sub(Bin, Len, <<>>).

do_sub(Bin, Len, NewBin) ->
    {Word, Rest} = get_word(Bin),
    case Len - byte_size(Word) of
      0 -> <<NewBin/binary, Word/binary>>;
      Len1 when Len1 < 0 -> NewBin;
      Len1 ->
	  do_sub(Rest, Len1, <<NewBin/binary, Word/binary>>)
    end.

sub_en(Bin, Len) when byte_size(Bin) =< Len -> Bin;
sub_en(Bin, Len) -> do_sub_en(Bin, Len, <<>>).

do_sub_en(<<>>, _Len, NewBin) -> NewBin;
do_sub_en(_, 0, NewBin) -> NewBin;
do_sub_en(Bin, Len, NewBin) ->
    {Word, Rest} = get_word(Bin),
    case byte_size(Word) of
      1 ->
	  do_sub_en(Rest, Len - 1,
		    <<NewBin/binary, Word/binary>>);
      _ -> do_sub_en(Rest, Len, NewBin)
    end.


