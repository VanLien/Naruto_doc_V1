-file("src/mod/misc/keyword.erl", 1).

-module(keyword).

-lager_records([{state, []},
		{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg,
		  remark]}]).

-behaviour(gen_server).

-export([reload/0, reload_ad/0, filter/1, filter/2,
	 check/2, is_ad/2, ad_type/1, filter_return_keyword/1]).

-export([start_link/0, stop/0, init/1, handle_call/3,
	 handle_cast/2, handle_info/2, terminate/2,
	 code_change/3]).

-file("inc/common.hrl", 1).

-file("inc/lib_log.hrl", 1).

-file("inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("src/mod/misc/keyword.erl", 23).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/misc/keyword.erl", 24).

-record(state, {}).

reload() -> keyword ! reload.

reload_ad() -> keyword ! reload_ad.

-spec filter(bitstring()) -> bitstring().

filter(Msg) -> filter(base, Msg).

-spec filter(atom(), bitstring()) -> bitstring().

filter(Flag, Str) when is_list(Str) ->
    filter(Flag, list_to_binary(Str));
filter(base, Bin) ->
    element(1,
	    do_filter_tab([keyword_index, keyword_index3,
			   keyword_index_word],
			  Bin, []));
filter(Flag, _Bin) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidkeyword51, _,
       {__Levelkeyword51, __Traceskeyword51}}
	  when __Levelkeyword51 band 8 /= 0 orelse
		 __Traceskeyword51 /= [] ->
	  lager:do_log(error,
		       [{module, keyword}, {function, filter}, {line, 51},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误类型~w", [Flag]), none, 4096, 8,
		       __Levelkeyword51, __Traceskeyword51, lager_event,
		       __Pidkeyword51);
      _ -> ok
    end,
    <<>>.

-spec filter_return_keyword(Msg ::
				bitstring()) -> {bitstring(), list()}.

filter_return_keyword(Msg) ->
    do_filter_tab([keyword_index, keyword_index3,
		   keyword_index_word],
		  Msg, []).

do_filter_tab([], Bin, Keywords) -> {Bin, Keywords};
do_filter_tab([Tab = keyword_index_word | T], Bin,
	      Keywords) ->
    case do_filter(Bin, <<>>, Tab, []) of
      {NewBin, NewKeywords = [_, _ | _]} ->
	  do_filter_tab(T, NewBin, NewKeywords ++ Keywords);
      _ -> do_filter_tab(T, Bin, Keywords)
    end;
do_filter_tab([Tab | T], Bin, Keywords) ->
    {NewBin, NewKeywords} = do_filter(Bin, <<>>, Tab,
				      Keywords),
    do_filter_tab(T, NewBin, NewKeywords).

do_filter(<<>>, Body, _Tab, Keywords) ->
    {Body, Keywords};
do_filter(Bin, Body, Tab, Keywords) ->
    case do_filter_f1(<<>>, Bin, Tab, [], Keywords) of
      {true, Rest, NewKeywords} ->
	  do_filter(Rest, <<Body/binary, "*">>, Tab, NewKeywords);
      false ->
	  {Word, Rest} = get_word(Bin),
	  do_filter(Rest, <<Body/binary, Word/binary>>, Tab,
		    Keywords)
    end.

do_filter_f1(_Words, <<>>, _Tab, [], _) -> false;
do_filter_f1(_Words, <<>>, _Tab, [Buff | _],
	     KeyWords) ->
    {true, Buff, KeyWords};
do_filter_f1(Words, Rest, Tab, Buffs, KeyWords) ->
    {Word, Rest2} = get_word(Rest),
    Words2 = <<Words/binary, (to_up(Word))/binary>>,
    case get_index(Tab, Words2) of
      3 -> do_filter_f1(Words2, Rest2, Tab, Buffs, KeyWords);
      2 -> {true, Rest2, [Words2 | KeyWords]};
      1 ->
	  do_filter_f1(Words2, Rest2, Tab, [Rest2 | Buffs],
		       [Words2 | KeyWords]);
      _ -> do_filter_f1(<<>>, <<>>, Tab, Buffs, KeyWords)
    end.

-spec check(atom(), bitstring()) -> true | false.

check(Flag, Str) when is_list(Str) ->
    check(Flag, list_to_binary(Str));
check(base, Bin) ->
    do_check_tab([keyword_index, keyword_index2,
		  keyword_index3, keyword_index_ad],
		 Bin)
      =:= true;
check(name, Bin) ->
    case do_check_name(Bin) of
      false -> false;
      true ->
	  do_check_tab([keyword_index, keyword_index2,
			keyword_index3, keyword_index_ad],
		       Bin)
	    =:= true
    end;
check(Flag, _Bin) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidkeyword108, _,
       {__Levelkeyword108, __Traceskeyword108}}
	  when __Levelkeyword108 band 8 /= 0 orelse
		 __Traceskeyword108 /= [] ->
	  lager:do_log(error,
		       [{module, keyword}, {function, check}, {line, 108},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误类型~w", [Flag]), none, 4096, 8,
		       __Levelkeyword108, __Traceskeyword108, lager_event,
		       __Pidkeyword108);
      _ -> ok
    end,
    false.

do_check_name(Bin) when is_binary(Bin) ->
    do_check_name(binary_to_list(Bin));
do_check_name(Str) ->
    case re:run(case is_binary(Str) of
		  false -> list_to_binary(Str);
		  true -> Str
		end,
		"([毛习胡刁X进近今禁斤尽大主胖守夶平评坪萍呯玶泙岼屏大席胖政吴帮邦国过瘟搵揾韫家嘉假伽茄"
		"寳甲假庆青林琳礼李理磕克墙强彭媛].*){2,}|([\\d零壹贰叁肆伍陆柒捌玖一二三四五"
		"六七八九oO〇lIi丨Qq扣抠秋叩啾群裙].*){5}|[^a-zA-Z0-9\\x{4E"
		"00}-\\x{9FA5}_Dé\\256\\261\\x{394}\\x{3A8}\\x"
		"{3A9}\\x{3C9}ǒ\\x{418}\\x{424}\\x{E3F}\\x{203"
		"0}\\x{2033}\\x{203B}\\x{20AF}\\x{2105}\\x{210"
		"9}\\x{2121}\\x{2122}\\x{2190}\\x{2191}\\x{219"
		"2}\\x{2193}\\x{2196}\\x{2197}\\x{2198}\\x{219"
		"9}\\x{2208}\\x{220F}\\x{2211}\\x{221A}\\x{221"
		"E}\\x{2228}\\x{2229}\\x{222A}\\x{224C}\\x{226"
		"0}\\x{2261}\\x{2264}\\x{2265}\\x{2299}\\x{22A"
		"5}\\x{2312}\\x{2566}\\x{2606}\\x{2661}\\x{266"
		"A}\\x{3001}\\x{3003}\\x{3005}\\x{3007}\\x{302"
		"4}\\x{3028}\\x{304C}\\x{3065}\\x{306C}\\x{307"
		"4}\\x{3077}\\x{307D}\\x{307E}\\x{309E}\\x{30A"
		"F}\\x{30BA}\\x{30D1}\\x{30D7}\\x{30DA}\\x{30D"
		"F}\\x{30FE}\\x{FE4C}\\x{FFE0}\\x{FFE1}\\x{306"
		"E}\\x{2116}\\x{706c}\\x{4e36}\\x{4e28}\\x{4e3"
		"f}\\x{2573}\\x{256c}\\x{5350}\\x{2103}\\x{002"
		"1}]",
		[{capture, none}, caseless, unicode])
	of
      match -> false;
      nomatch -> true
    end.

do_check_tab([], _Bin) -> true;
do_check_tab([Tab | T], Bin) ->
    case do_check(Bin, Tab, <<>>) of
      true -> do_check_tab(T, Bin);
      Ret -> Ret
    end.

do_check(<<>>, _Tab, _Buff) -> true;
do_check(Bin, Tab, Buff) ->
    {Word, Rest} = get_word_ad(Bin),
    Word1 = to_up(Word),
    NewBuff = <<Buff/binary, Word1/binary>>,
    case get_index(Tab, NewBuff) of
      _ when NewBuff == <<>> -> do_check(Rest, Tab, NewBuff);
      3 -> do_check(Rest, Tab, NewBuff);
      2 -> {false, NewBuff};
      1 -> {false, NewBuff};
      _ ->
	  case byte_size(Buff) of
	    0 -> do_check(Rest, Tab, <<>>);
	    _ ->
		{_Word, BuffRest} = get_word_ad(Buff),
		do_check(<<BuffRest/binary, Bin/binary>>, Tab, <<>>)
	  end
    end.

to_up(<<H:8>>) when H >= $a andalso H =< $z ->
    <<(H - 32)>>;
to_up(W) -> W.

word_init(<<>>, _Tab, _Head) -> ok;
word_init(Bin, Tab, Head) ->
    case get_word_ad(Bin) of
      {Word, <<>>} ->
	  Head2 = <<Head/binary, (to_up(Word))/binary>>,
	  case get_index(Tab, Head2) of
	    3 -> set_index(Tab, Head2, 1);
	    2 -> ok;
	    1 -> ok;
	    _ -> set_index(Tab, Head2, 2)
	  end;
      {Word, Rest} ->
	  Head2 = <<Head/binary, (to_up(Word))/binary>>,
	  case get_index(Tab, Head2) of
	    1 -> word_init(Rest, Tab, Head2);
	    2 ->
		set_index(Tab, Head2, 1), word_init(Rest, Tab, Head2);
	    3 -> word_init(Rest, Tab, Head2);
	    _ ->
		set_index(Tab, Head2, 3), word_init(Rest, Tab, Head2)
	  end
    end.

get_index(keyword_index_word, Key) ->
    get_index_word(Key);
get_index(Tab, Key) ->
    case ets:lookup(Tab, Key) of
      [{_, Flag}] -> Flag;
      [] -> undefined
    end.

set_index(Tab, Key, Flag) ->
    ets:insert(Tab, {Key, Flag}).

get_index_word(<<"毛"/utf8>>) -> 2;
get_index_word(<<"习"/utf8>>) -> 2;
get_index_word(<<"胡"/utf8>>) -> 2;
get_index_word(<<"袭"/utf8>>) -> 2;
get_index_word(<<"刁"/utf8>>) -> 2;
get_index_word(<<"X "/utf8>>) -> 2;
get_index_word(<<"进"/utf8>>) -> 2;
get_index_word(<<"近"/utf8>>) -> 2;
get_index_word(<<"今"/utf8>>) -> 2;
get_index_word(<<"禁"/utf8>>) -> 2;
get_index_word(<<"斤"/utf8>>) -> 2;
get_index_word(<<"尽"/utf8>>) -> 2;
get_index_word(<<"大"/utf8>>) -> 2;
get_index_word(<<"主"/utf8>>) -> 2;
get_index_word(<<"胖"/utf8>>) -> 2;
get_index_word(<<"守"/utf8>>) -> 2;
get_index_word(<<"夶"/utf8>>) -> 2;
get_index_word(<<"平"/utf8>>) -> 2;
get_index_word(<<"评"/utf8>>) -> 2;
get_index_word(<<"坪"/utf8>>) -> 2;
get_index_word(<<"萍"/utf8>>) -> 2;
get_index_word(<<"呯"/utf8>>) -> 2;
get_index_word(<<"玶"/utf8>>) -> 2;
get_index_word(<<"泙"/utf8>>) -> 2;
get_index_word(<<"岼"/utf8>>) -> 2;
get_index_word(<<"屏"/utf8>>) -> 2;
get_index_word(<<"大"/utf8>>) -> 2;
get_index_word(<<"席"/utf8>>) -> 2;
get_index_word(<<"胖"/utf8>>) -> 2;
get_index_word(<<"政"/utf8>>) -> 2;
get_index_word(<<"吴"/utf8>>) -> 2;
get_index_word(<<"帮"/utf8>>) -> 2;
get_index_word(<<"邦"/utf8>>) -> 2;
get_index_word(<<"国"/utf8>>) -> 2;
get_index_word(<<"过"/utf8>>) -> 2;
get_index_word(<<"瘟"/utf8>>) -> 2;
get_index_word(<<"搵"/utf8>>) -> 2;
get_index_word(<<"揾"/utf8>>) -> 2;
get_index_word(<<"韫"/utf8>>) -> 2;
get_index_word(<<"家"/utf8>>) -> 2;
get_index_word(<<"嘉"/utf8>>) -> 2;
get_index_word(<<"假"/utf8>>) -> 2;
get_index_word(<<"伽"/utf8>>) -> 2;
get_index_word(<<"茄"/utf8>>) -> 2;
get_index_word(<<"寳"/utf8>>) -> 2;
get_index_word(<<"甲"/utf8>>) -> 2;
get_index_word(<<"庆"/utf8>>) -> 2;
get_index_word(<<"青"/utf8>>) -> 2;
get_index_word(<<"林"/utf8>>) -> 2;
get_index_word(<<"琳"/utf8>>) -> 2;
get_index_word(<<"礼"/utf8>>) -> 2;
get_index_word(<<"李"/utf8>>) -> 2;
get_index_word(<<"理"/utf8>>) -> 2;
get_index_word(<<"磕"/utf8>>) -> 2;
get_index_word(<<"克"/utf8>>) -> 2;
get_index_word(<<"墙"/utf8>>) -> 2;
get_index_word(<<"强"/utf8>>) -> 2;
get_index_word(<<"彭"/utf8>>) -> 2;
get_index_word(<<"媛"/utf8>>) -> 2;
get_index_word(_) -> undefined.

is_ad(Lev, _Msg) when Lev > 60 -> true;
is_ad(_Lev, Msg) when is_binary(Msg) ->
    case do_check(Msg, keyword_index_ad, <<>>) of
      true -> do_check_ad(Msg, keyword_index_ad, <<>>);
      Ret -> Ret
    end.

do_check_ad(<<>>, _Tab, _Buff) -> true;
do_check_ad(Bin, Tab, Buff) ->
    {Word, Rest} = get_word_ad(Bin),
    Word1 = to_up(Word),
    NewBuff = <<Buff/binary, Word1/binary>>,
    case get_index(Tab, NewBuff) of
      3 -> do_check_ad(Rest, Tab, NewBuff);
      2 -> {false, NewBuff};
      1 -> {false, NewBuff};
      _ ->
	  case byte_size(Buff) of
	    0 -> do_check_ad(Rest, Tab, <<>>);
	    _ ->
		{_Word, BuffRest} = get_word_ad(Buff),
		do_check_ad(<<BuffRest/binary, Bin/binary>>, Tab, <<>>)
	  end
    end.

get_word_ad(<<>>) -> {<<>>, <<>>};
get_word_ad(<<" "/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"~"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"〜"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<","/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"，"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<":"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"："/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"."/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"。"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<";"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"；"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"-"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"_"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"="/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"+"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"*"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"&"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"^"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"…"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"%"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"$"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"#"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"@"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"!"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"！"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"|"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"？"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"?"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"'"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"‘"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"\""/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"“"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"`"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"·"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"("/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<")"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"["/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"]"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"{"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"}"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"（"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"）"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"【"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"】"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"「"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"」"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"/"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"／"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"\\"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"、"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"\n"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<"\t"/utf8, Rest/binary>>) ->
    get_word_ad(Rest);
get_word_ad(<<H:8, Rest/binary>>) when H =< 127 ->
    if H >= $0 andalso H =< $9 ->
	   get_num_word_ad(Rest, <<H>>);
       H >= $a andalso H =< $z ->
	   get_letter_word_ad(Rest, <<H>>);
       H >= $A andalso H =< $Z ->
	   get_letter_word_ad(Rest, <<H>>);
       true -> {<<H>>, Rest}
    end;
get_word_ad(<<H:8, B:1/binary, Rest/binary>>)
    when H >= 192, H =< 223 ->
    {<<H:8, B/binary>>, Rest};
get_word_ad(<<H:8, B:2/binary, Rest/binary>>)
    when H >= 224, H =< 239 ->
    {<<H:8, B/binary>>, Rest};
get_word_ad(<<H:8, B:3/binary, Rest/binary>>)
    when H >= 240, H =< 247 ->
    {<<H:8, B/binary>>, Rest};
get_word_ad(<<H:8, B:4/binary, Rest/binary>>)
    when H >= 248, H =< 251 ->
    {<<H:8, B/binary>>, Rest};
get_word_ad(<<H:8, B:5/binary, Rest/binary>>)
    when H >= 252, H =< 253 ->
    {<<H:8, B/binary>>, Rest};
get_word_ad(<<H:8, Rest/binary>>) -> {<<H>>, Rest}.

get_word(<<H:8, Rest/binary>>) when H =< 127 ->
    if H >= $0 andalso H =< $9 ->
	   get_num_word_ad(Rest, <<H>>);
       H >= $a andalso H =< $z ->
	   get_letter_word_ad(Rest, <<H>>);
       H >= $A andalso H =< $Z ->
	   get_letter_word_ad(Rest, <<H>>);
       true -> {<<H>>, Rest}
    end;
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

get_num_word_ad(<<>>, Num) -> {Num, <<>>};
get_num_word_ad(<<H:8, Rest/binary>>, Num)
    when H >= $0 andalso H =< $9 ->
    get_num_word_ad(Rest, <<Num/binary, H:8>>);
get_num_word_ad(Rest, Num) -> {Num, Rest}.

get_letter_word_ad(<<>>, Word) -> {Word, <<>>};
get_letter_word_ad(<<H:8, Rest/binary>>, Word)
    when H >= $a andalso H =< $z ->
    get_letter_word_ad(Rest, <<Word/binary, H:8>>);
get_letter_word_ad(<<H:8, Rest/binary>>, Word)
    when H >= $A andalso H =< $Z ->
    get_letter_word_ad(Rest, <<Word/binary, H:8>>);
get_letter_word_ad(Rest, Word) -> {Word, Rest}.

ad_type(Str) ->
    case ets:lookup(keyword_ad, Str) of
      [{Str, Type}] -> Type;
      _ -> 0
    end.

init_index(Tab, Data) ->
    case ets:info(Tab) of
      undefined -> {error, not_exists_tab};
      _ ->
	  ets:delete_all_objects(Tab),
	  [word_init(unicode:characters_to_binary(WordStr), Tab,
		     <<>>)
	   || WordStr <- Data],
	  ok
    end.

list_data() ->
    ["充值", "冲值", "出售", "卖号", "GM", "指导员", "管理员", "官网", "客服",
     "通知", "系统", "官方", "公告", "告示", "颁奖", "奖励", "领奖", "发奖",
     "送礼", "好礼", "豪礼", "礼品", "礼物", "专员", "提示", "信息", "获奖",
     "抽奖", "派送", "派奖", "派礼", "32395", "下线联系", "QQ", "放送",
     "领取码", "幸运码", "领取", "名额", "已被", "职员", "抽选", "回馈", "真情",
     "万元", "商务", "免费Q", "裸聊", "倮聊", "神秘人", "公众号", "策划",
     "技术"].

init_ad() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidkeyword493, _,
       {__Levelkeyword493, __Traceskeyword493}}
	  when __Levelkeyword493 band 64 /= 0 orelse
		 __Traceskeyword493 /= [] ->
	  lager:do_log(info,
		       [{module, keyword}, {function, init_ad}, {line, 493},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "成功加载钻石哥关键字库！", none, 4096, 64, __Levelkeyword493,
		       __Traceskeyword493, lager_event, __Pidkeyword493);
      _ -> ok
    end,
    Sql = "SELECT `content`, `type` FROM `mod_keywords` "
	  "where status = 1",
    case db:get_all(Sql) of
      {ok, Data} ->
	  ets:delete_all_objects(keyword_ad),
	  F = fun ([X, 1], {L1, L2}) -> {[X | L1], L2};
		  ([X, T], {L1, L2}) ->
		      X1 =
			  unicode:characters_to_binary(string:to_upper(unicode:characters_to_list(X))),
		      ets:insert(keyword_ad, {X1, T}),
		      {L1, [X | L2]}
	      end,
	  {L3, L4} = lists:foldl(F, {[], []}, Data),
	  init_index(keyword_index3, L3),
	  init_index(keyword_index_ad, L4);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidkeyword509, _,
	     {__Levelkeyword509, __Traceskeyword509}}
		when __Levelkeyword509 band 8 /= 0 orelse
		       __Traceskeyword509 /= [] ->
		lager:do_log(error,
			     [{module, keyword}, {function, init_ad},
			      {line, 509}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("钻石哥关键字库初始化失败!~w", [_Reason]), none,
			     4096, 8, __Levelkeyword509, __Traceskeyword509,
			     lager_event, __Pidkeyword509);
	    _ -> ok
	  end
    end.

start_link() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidkeyword515, _,
       {__Levelkeyword515, __Traceskeyword515}}
	  when __Levelkeyword515 band 64 /= 0 orelse
		 __Traceskeyword515 /= [] ->
	  lager:do_log(info,
		       [{module, keyword}, {function, start_link}, {line, 515},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w 启动...", [keyword]), none, 4096, 64,
		       __Levelkeyword515, __Traceskeyword515, lager_event,
		       __Pidkeyword515);
      _ -> ok
    end,
    gen_server:start_link({local, keyword}, keyword, [],
			  []).

stop() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidkeyword520, _,
       {__Levelkeyword520, __Traceskeyword520}}
	  when __Levelkeyword520 band 64 /= 0 orelse
		 __Traceskeyword520 /= [] ->
	  lager:do_log(info,
		       [{module, keyword}, {function, stop}, {line, 520},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭~w...", [keyword]), none, 4096, 64,
		       __Levelkeyword520, __Traceskeyword520, lager_event,
		       __Pidkeyword520);
      _ -> ok
    end,
    ok.

init([]) ->
    ets:new(keyword_index, [named_table, set, public]),
    ets:new(keyword_index2, [named_table, set, public]),
    ets:new(keyword_index3, [named_table, set, public]),
    ets:new(keyword_index_ad, [named_table, set, public]),
    ets:new(keyword_ad,
	    [set, named_table, public, {keypos, 1}]),
    self() ! reload,
    {ok, #state{}}.

handle_cast(_Event, State) -> {noreply, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_info(reload, State) ->
    init_index(keyword_index, keywords_data:list()),
    init_index(keyword_index2, list_data()),
    init_ad(),
    {noreply, State};
handle_info(reload_ad, State) ->
    init_ad(), {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(normal, _State) -> ok;
terminate(Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidkeyword557, _,
       {__Levelkeyword557, __Traceskeyword557}}
	  when __Levelkeyword557 band 8 /= 0 orelse
		 __Traceskeyword557 /= [] ->
	  lager:do_log(error,
		       [{module, keyword}, {function, terminate}, {line, 557},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w 异常结束 ~w", [keyword, Reason]), none,
		       4096, 8, __Levelkeyword557, __Traceskeyword557,
		       lager_event, __Pidkeyword557);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


