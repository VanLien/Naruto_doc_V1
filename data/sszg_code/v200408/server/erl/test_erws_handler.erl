-file("src/gm/test_erws_handler.erl", 1).

-module(test_erws_handler).

-lager_records([]).

-export([init/2, terminate/3]).

-export([websocket_init/1, websocket_handle/2,
	 websocket_info/2]).

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

-file("src/gm/test_erws_handler.erl", 9).

init(Req, _Opts) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidtest_erws_handler11, _,
       {__Leveltest_erws_handler11,
	__Tracestest_erws_handler11}}
	  when __Leveltest_erws_handler11 band 64 /= 0 orelse
		 __Tracestest_erws_handler11 /= [] ->
	  lager:do_log(info,
		       [{module, test_erws_handler}, {function, init},
			{line, 11}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("init=== opt=~w req=~w  ~w",
				     [_Opts, Req, get_stacktrace()]),
		       none, 4096, 64, __Leveltest_erws_handler11,
		       __Tracestest_erws_handler11, lager_event,
		       __Pidtest_erws_handler11);
      _ -> ok
    end,
    {cowboy_websocket, Req, #{msg_num => 0}}.

websocket_init(State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidtest_erws_handler15, _,
       {__Leveltest_erws_handler15,
	__Tracestest_erws_handler15}}
	  when __Leveltest_erws_handler15 band 64 /= 0 orelse
		 __Tracestest_erws_handler15 /= [] ->
	  lager:do_log(info,
		       [{module, test_erws_handler},
			{function, websocket_init}, {line, 15},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("websocket_init:~w", [get_stacktrace()]),
		       none, 4096, 64, __Leveltest_erws_handler15,
		       __Tracestest_erws_handler15, lager_event,
		       __Pidtest_erws_handler15);
      _ -> ok
    end,
    erlang:send_after(1000, self(), {tick}),
    erlang:start_timer(2000, self(), <<"Hello!">>),
    {ok, State}.

websocket_handle({text, Msg}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidtest_erws_handler21, _,
       {__Leveltest_erws_handler21,
	__Tracestest_erws_handler21}}
	  when __Leveltest_erws_handler21 band 128 /= 0 orelse
		 __Tracestest_erws_handler21 /= [] ->
	  lager:do_log(debug,
		       [{module, test_erws_handler},
			{function, websocket_handle}, {line, 21},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "Got Data: ~p ~w", [Msg, get_stacktrace()], 4096, 128,
		       __Leveltest_erws_handler21, __Tracestest_erws_handler21,
		       lager_event, __Pidtest_erws_handler21);
      _ -> ok
    end,
    {reply, {text, <<"responding to ", Msg/binary>>}, State,
     hibernate};
websocket_handle({binary, Bin},
		 State = #{msg_num := MsgNum}) ->
    case Bin of
      <<Size:32, N1:8, Len:16, Text:Len/binary, N2:16>> ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidtest_erws_handler28, _,
	     {__Leveltest_erws_handler28,
	      __Tracestest_erws_handler28}}
		when __Leveltest_erws_handler28 band 128 /= 0 orelse
		       __Tracestest_erws_handler28 /= [] ->
		lager:do_log(debug,
			     [{module, test_erws_handler},
			      {function, websocket_handle}, {line, 28},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "===size=~w, n1=~w, Len=~w text=~ts n2=~w",
			     [Size, N1, Len, Text, N2], 4096, 128,
			     __Leveltest_erws_handler28,
			     __Tracestest_erws_handler28, lager_event,
			     __Pidtest_erws_handler28);
	    _ -> ok
	  end,
	  ReplayBin = <<"hello中文测试"/utf8>>,
	  {reply,
	   {binary,
	    <<20000:16, (byte_size(ReplayBin)):16, ReplayBin/binary,
	      100:8>>},
	   State, hibernate};
      <<Len:32, Text0:Len/binary>> ->
	  <<Cmd:16, Text/binary>> = Text0,
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidtest_erws_handler33, _,
	     {__Leveltest_erws_handler33,
	      __Tracestest_erws_handler33}}
		when __Leveltest_erws_handler33 band 64 /= 0 orelse
		       __Tracestest_erws_handler33 /= [] ->
		lager:do_log(info,
			     [{module, test_erws_handler},
			      {function, websocket_handle}, {line, 33},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "msg_num:~w len:~w, cmd:~w, data=~w from=~w",
			     [MsgNum, Len, Cmd,
			      proto_168:unpack(Cmd, srv, Text),
			      get_stacktrace()],
			     4096, 64, __Leveltest_erws_handler33,
			     __Tracestest_erws_handler33, lager_event,
			     __Pidtest_erws_handler33);
	    _ -> ok
	  end,
	  self() ! {send_msg},
	  {[{active, false}], State#{msg_num := MsgNum + 1},
	   hibernate};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidtest_erws_handler37, _,
	     {__Leveltest_erws_handler37,
	      __Tracestest_erws_handler37}}
		when __Leveltest_erws_handler37 band 128 /= 0 orelse
		       __Tracestest_erws_handler37 /= [] ->
		lager:do_log(debug,
			     [{module, test_erws_handler},
			      {function, websocket_handle}, {line, 37},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "Got binary Data: ~p ~w", [Bin, get_stacktrace()],
			     4096, 128, __Leveltest_erws_handler37,
			     __Tracestest_erws_handler37, lager_event,
			     __Pidtest_erws_handler37);
	    _ -> ok
	  end,
	  ReplayBin = <<"hello中文测试"/utf8>>,
	  {reply,
	   {binary,
	    <<20000:16, (byte_size(ReplayBin)):16, ReplayBin/binary,
	      100:8>>},
	   State, hibernate}
    end;
websocket_handle(_Any, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidtest_erws_handler43, _,
       {__Leveltest_erws_handler43,
	__Tracestest_erws_handler43}}
	  when __Leveltest_erws_handler43 band 128 /= 0 orelse
		 __Tracestest_erws_handler43 /= [] ->
	  lager:do_log(debug,
		       [{module, test_erws_handler},
			{function, websocket_handle}, {line, 43},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "Got binary Data: ~p ~w", [_Any, get_stacktrace()],
		       4096, 128, __Leveltest_erws_handler43,
		       __Tracestest_erws_handler43, lager_event,
		       __Pidtest_erws_handler43);
      _ -> ok
    end,
    {reply, {text, <<"whut?">>}, State, hibernate}.

websocket_info({timeout, _Ref, Msg}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidtest_erws_handler47, _,
       {__Leveltest_erws_handler47,
	__Tracestest_erws_handler47}}
	  when __Leveltest_erws_handler47 band 64 /= 0 orelse
		 __Tracestest_erws_handler47 /= [] ->
	  lager:do_log(info,
		       [{module, test_erws_handler},
			{function, websocket_info}, {line, 47},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("timeout_msg======~ts", [Msg]), none,
		       4096, 64, __Leveltest_erws_handler47,
		       __Tracestest_erws_handler47, lager_event,
		       __Pidtest_erws_handler47);
      _ -> ok
    end,
    {ok, SendBin} = proto_168:pack(16801, srv,
				   {[{12, 13}, {14, 15}]}),
    {reply, {binary, SendBin}, State};
websocket_info({tick}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidtest_erws_handler52, _,
       {__Leveltest_erws_handler52,
	__Tracestest_erws_handler52}}
	  when __Leveltest_erws_handler52 band 64 /= 0 orelse
		 __Tracestest_erws_handler52 /= [] ->
	  lager:do_log(info,
		       [{module, test_erws_handler},
			{function, websocket_info}, {line, 52},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("tick======", []), none, 4096, 64,
		       __Leveltest_erws_handler52, __Tracestest_erws_handler52,
		       lager_event, __Pidtest_erws_handler52);
      _ -> ok
    end,
    {ok, SendBin} = proto_168:pack(16802, srv, {12345}),
    {reply, {binary, SendBin}, State};
websocket_info({send_msg},
	       State = #{msg_num := MsgNum}) ->
    case MsgNum of
      1 -> erlang:send_after(5000, self(), {read_next});
      _ -> pass
    end,
    {ok, SendBin} = proto_168:pack(16800, srv,
				   {11, [{12, 13}, {14, 15}],
				    [{111, <<"aa11中文测试"/utf8>>}], 123}),
    {reply, {binary, SendBin},
     State#{msg_num := MsgNum - 1}, hibernate};
websocket_info({read_next}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidtest_erws_handler66, _,
       {__Leveltest_erws_handler66,
	__Tracestest_erws_handler66}}
	  when __Leveltest_erws_handler66 band 64 /= 0 orelse
		 __Tracestest_erws_handler66 /= [] ->
	  lager:do_log(info,
		       [{module, test_erws_handler},
			{function, websocket_info}, {line, 66},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("read_next======", []), none, 4096, 64,
		       __Leveltest_erws_handler66, __Tracestest_erws_handler66,
		       lager_event, __Pidtest_erws_handler66);
      _ -> ok
    end,
    {[{active, true}], State, hibernate};
websocket_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidtest_erws_handler70, _,
       {__Leveltest_erws_handler70,
	__Tracestest_erws_handler70}}
	  when __Leveltest_erws_handler70 band 128 /= 0 orelse
		 __Tracestest_erws_handler70 /= [] ->
	  lager:do_log(debug,
		       [{module, test_erws_handler},
			{function, websocket_info}, {line, 70},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "websocket info:~w", [_Info], 4096, 128,
		       __Leveltest_erws_handler70, __Tracestest_erws_handler70,
		       lager_event, __Pidtest_erws_handler70);
      _ -> ok
    end,
    {ok, State, hibernate}.

terminate(_Reason, _Req, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidtest_erws_handler74, _,
       {__Leveltest_erws_handler74,
	__Tracestest_erws_handler74}}
	  when __Leveltest_erws_handler74 band 64 /= 0 orelse
		 __Tracestest_erws_handler74 /= [] ->
	  lager:do_log(info,
		       [{module, test_erws_handler}, {function, terminate},
			{line, 74}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("terminate:~w", [_Reason]), none, 4096,
		       64, __Leveltest_erws_handler74,
		       __Tracestest_erws_handler74, lager_event,
		       __Pidtest_erws_handler74);
      _ -> ok
    end,
    ok.

get_stacktrace() ->
    catch throw({hello}), erlang:get_stacktrace().


