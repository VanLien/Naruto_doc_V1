-file("src/mod/misc/ip_mgr.erl", 1).

-module(ip_mgr).

-lager_records([{state, []},
		{ip_info, [ip, connected, max_conn, conn_times]}]).

-behaviour(gen_server).

-export([start_link/0, info/1, is_max/1, set/1, del/1,
	 inc/1, dec/1, top/1, top/2, reload_block/0,
	 reload_white/0, reload_white_acc/0, is_blocked/1,
	 is_white/1, is_white_acc/1, ip2bitstring/1,
	 ip_to_address/1, num_reg_idfa/1, reg_idfa/1,
	 inc_reg_idfa/1, num_reg_ip/1, reg_ip/1, inc_reg_ip/1,
	 num_reg_getui_cid/1, reg_getui_cid/1,
	 inc_reg_getui_cid/1, reload_device_black/0,
	 device_black_type/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/misc/ip_mgr.erl", 48).

-file("inc/ip_info.hrl", 1).

-record(ip_info,
	{ip  :: undefined | tuple(),
	 connected = 0  :: reset | non_neg_integer(),
	 max_conn = -1  :: integer(),
	 conn_times = 0  :: pos_integer()}).

-file("src/mod/misc/ip_mgr.erl", 49).

-record(state, {}).

-spec start_link() -> {ok, pid()} | ignore |
		      {error, term()}.

start_link() ->
    gen_server:start_link({local, ip_mgr}, ip_mgr, [], []).

-spec info(tuple()) -> {ok, #ip_info{}} |
		       {error, term()}.

info(Ip) ->
    case catch ets:lookup(ip_mgr, Ip) of
      [Info] -> {ok, Info};
      [] -> {error, ip_info_undefined};
      {'EXIT', {badarg, _}} -> {error, ip_mgr_not_running}
    end.

-spec is_max(tuple()) -> boolean().

is_max(Ip) ->
    case info(Ip) of
      {ok, #ip_info{max_conn = -1}} -> false;
      {ok, #ip_info{connected = C, max_conn = M}}
	  when C =< M ->
	  false;
      _ -> true
    end.

ip_to_address({IP1, IP2, IP3, IP4}) ->
    ip_to_address(util:fbin("~w.~w.~w.~w",
			    [IP1, IP2, IP3, IP4]));
ip_to_address(Ip) ->
    case ets:lookup(ip_address, Ip) of
      [{Ip, Names}] -> Names;
      _ ->
	  DataL = [{ip, Ip}],
	  Url = lists:concat(["http://", game_lib:oss_url(),
			      "/index.php/ip/area"]),
	  Time = date:unixtime(),
	  Sign =
	      string_util:md5(lists:concat([binary_to_list(<<"sszg">>),
					    Time,
					    "cmRcnnv1ky43qwc2379m28VKpcjc58cycYb2myXz"])),
	  List = [{product_name, <<"sszg">>}, {date_time, Time},
		  {sign, Sign}
		  | DataL],
	  Body = game_lib:to_url_body_str(List),
	  case catch httpc:request(post,
				   {Url, [],
				    "application/x-www-form-urlencoded", Body},
				   [{timeout, 5000}], [])
	      of
	    {ok, {_StatusLine, _Headers, RtnBody}} ->
		case catch ejson:decode(RtnBody) of
		  {[{<<"success">>, true}, {<<"message">>, {L}}]} ->
		      [case {whereis(lager_event), whereis(lager_event),
			     lager_config:get({lager_event, loglevel}, {0, []})}
			   of
			 {undefined, undefined, _} ->
			     fun () -> {error, lager_not_running} end();
			 {undefined, _, _} ->
			     fun () ->
				     {error, {sink_not_configured, lager_event}}
			     end();
			 {__Pidip_mgr99, _, {__Levelip_mgr99, __Tracesip_mgr99}}
			     when __Levelip_mgr99 band 128 /= 0 orelse
				    __Tracesip_mgr99 /= [] ->
			     lager:do_log(debug,
					  [{module, ip_mgr},
					   {function, ip_to_address},
					   {line, 99},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("~s==~ts", [K, V]),
					  none, 4096, 128, __Levelip_mgr99,
					  __Tracesip_mgr99, lager_event,
					  __Pidip_mgr99);
			 _ -> ok
		       end
		       || {K, V} <- L],
		      case lists:keyfind(<<"province">>, 1, L) of
			{_, PName} when PName =/= <<>> ->
			    CityName = list_util:keyfind(<<"city">>, L, PName),
			    ets:insert(ip_address, {Ip, {PName, CityName}}),
			    {PName, CityName};
			_ ->
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidip_mgr106, _,
			       {__Levelip_mgr106, __Tracesip_mgr106}}
				  when __Levelip_mgr106 band 8 /= 0 orelse
					 __Tracesip_mgr106 /= [] ->
				  lager:do_log(error,
					       [{module, ip_mgr},
						{function, ip_to_address},
						{line, 106},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("解析IP失败:~s ~w",
							     [Ip, L]),
					       none, 4096, 8, __Levelip_mgr106,
					       __Tracesip_mgr106, lager_event,
					       __Pidip_mgr106);
			      _ -> ok
			    end,
			    {lang:get(<<"神秘之地"/utf8>>),
			     lang:get(<<"神秘之地"/utf8>>)}
		      end;
		  {[{<<"success">>, false}, {<<"message">>, Msg}]}
		      when is_binary(Msg) ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidip_mgr110, _,
			 {__Levelip_mgr110, __Tracesip_mgr110}}
			    when __Levelip_mgr110 band 8 /= 0 orelse
				   __Tracesip_mgr110 /= [] ->
			    lager:do_log(error,
					 [{module, ip_mgr},
					  {function, ip_to_address},
					  {line, 110},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("ret=ip=~s=>~ts",
						       [Ip, RtnBody]),
					 none, 4096, 8, __Levelip_mgr110,
					 __Tracesip_mgr110, lager_event,
					 __Pidip_mgr110);
			_ -> ok
		      end,
		      {lang:get(<<"神秘之地"/utf8>>), lang:get(<<"神秘之地"/utf8>>)};
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidip_mgr113, _,
			 {__Levelip_mgr113, __Tracesip_mgr113}}
			    when __Levelip_mgr113 band 8 /= 0 orelse
				   __Tracesip_mgr113 /= [] ->
			    lager:do_log(error,
					 [{module, ip_mgr},
					  {function, ip_to_address},
					  {line, 113},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("ret=ip=~s=>~ts",
						       [Ip, RtnBody]),
					 none, 4096, 8, __Levelip_mgr113,
					 __Tracesip_mgr113, lager_event,
					 __Pidip_mgr113);
			_ -> ok
		      end,
		      {lang:get(<<"神秘之地"/utf8>>), lang:get(<<"神秘之地"/utf8>>)}
		end;
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidip_mgr117, _,
		   {__Levelip_mgr117, __Tracesip_mgr117}}
		      when __Levelip_mgr117 band 8 /= 0 orelse
			     __Tracesip_mgr117 /= [] ->
		      lager:do_log(error,
				   [{module, ip_mgr}, {function, ip_to_address},
				    {line, 117}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("ret=ip=~s=>~w", [Ip, _Err]),
				   none, 4096, 8, __Levelip_mgr117,
				   __Tracesip_mgr117, lager_event,
				   __Pidip_mgr117);
		  _ -> ok
		end,
		{lang:get(<<"神秘之地"/utf8>>), lang:get(<<"神秘之地"/utf8>>)}
	  end
    end.

-spec set(#ip_info{}) -> ok | {error, term()}.

set(Info = #ip_info{ip = Ip, connected = C}) ->
    case info(Ip) of
      {ok, _} when C =:= reset ->
	  ets:insert(ip_mgr, Info#ip_info{connected = 0}), ok;
      {ok, #ip_info{connected = Connected}} ->
	  ets:insert(ip_mgr, Info#ip_info{connected = Connected}),
	  ok;
      {error, ip_info_undefined} ->
	  ets:insert(ip_mgr, Info), ok;
      Err -> Err
    end.

-spec del(tuple()) -> ok | {error, term()}.

del(Ip) ->
    case ets:info(ip_mgr, size) of
      undefined -> {error, ip_mgr_not_running};
      _ -> ets:delete(ip_mgr, Ip), ok
    end.

-spec inc(tuple()) -> ok | {error, max_connection} |
		      {error, term()}.

inc(Ip) ->
    case info(Ip) of
      {ok, _} ->
	  ets:update_counter(ip_mgr, Ip,
			     [{#ip_info.connected, 1},
			      {#ip_info.conn_times, 1}]),
	  ok;
      {error, ip_info_undefined} ->
	  set(#ip_info{ip = Ip, connected = 1, conn_times = 1});
      Err -> Err
    end.

-spec dec(tuple()) -> ok | {error, term()}.

dec(Ip) ->
    case info(Ip) of
      {ok, _} ->
	  ets:update_counter(ip_mgr, Ip,
			     {#ip_info.connected, -1}),
	  ok;
      Err -> Err
    end.

num_reg_idfa(Num) ->
    [{Idfa, N}
     || {Idfa, N} <- ets:tab2list(reg_idfa), N >= Num].

reg_idfa(Idfa) ->
    case ets:lookup(reg_idfa, Idfa) of
      [{_, N}] -> N;
      _ -> 0
    end.

inc_reg_idfa(Idfa) ->
    case reg_idfa(Idfa) of
      0 -> ets:insert(reg_idfa, {Idfa, 1});
      _N -> ets:update_counter(reg_idfa, Idfa, 1)
    end.

num_reg_ip(Num) ->
    [{Ip, N}
     || {Ip, N} <- ets:tab2list(reg_ip_num), N >= Num].

reg_ip(Ip) ->
    case ets:lookup(reg_ip_num, Ip) of
      [{_, N}] -> N;
      _ -> 0
    end.

inc_reg_ip(Ip) ->
    case reg_ip(Ip) of
      0 -> ets:insert(reg_ip_num, {Ip, 1});
      _N -> ets:update_counter(reg_ip_num, Ip, 1)
    end.

num_reg_getui_cid(Num) ->
    [{Cid, N}
     || {Cid, N} <- ets:tab2list(reg_getui_cid_num),
	N >= Num].

reg_getui_cid(Cid) ->
    case ets:lookup(reg_getui_cid_num, Cid) of
      [{_, N}] -> N;
      _ -> 0
    end.

inc_reg_getui_cid(Cid) ->
    case reg_getui_cid(Cid) of
      0 -> ets:insert(reg_getui_cid_num, {Cid, 1});
      _N -> ets:update_counter(reg_getui_cid_num, Cid, 1)
    end.

reload_device_black() -> ip_mgr ! reload_device_black.

device_black_type(Device) ->
    case ets:lookup(device_black, Device) of
      [{_, Type}] -> Type;
      _ -> 0
    end.

top(T) -> top(T, 30).

top(connected, N) ->
    L = ets:tab2list(ip_mgr),
    Nl = lists:sort(fun sort_connected/2, L),
    lists:sublist(Nl, N);
top(conn_times, N) ->
    L = ets:tab2list(ip_mgr),
    Nl = lists:sort(fun sort_conn_times/2, L),
    lists:sublist(Nl, N).

reload_block() -> ip_mgr ! reload_block.

reload_white() -> ip_mgr ! reload_white.

reload_white_acc() -> ip_mgr ! reload_white_acc.

is_blocked(Ip = {_, _, _, _}) ->
    is_blocked(ip2bitstring(Ip));
is_blocked(Ip) ->
    case catch ets:lookup(ip_block, Ip) of
      [_] -> true;
      [] -> false;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr283, _,
	     {__Levelip_mgr283, __Tracesip_mgr283}}
		when __Levelip_mgr283 band 8 /= 0 orelse
		       __Tracesip_mgr283 /= [] ->
		lager:do_log(error,
			     [{module, ip_mgr}, {function, is_blocked},
			      {line, 283}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("查询是否被封禁ip时发生错误:~w", [_Err]), none,
			     4096, 8, __Levelip_mgr283, __Tracesip_mgr283,
			     lager_event, __Pidip_mgr283);
	    _ -> ok
	  end,
	  false
    end.

is_white(Ip = {_, _, _, _}) ->
    is_white(ip2bitstring(Ip));
is_white(Ip) ->
    case catch ets:lookup(ip_white, Ip) of
      [_] -> true;
      [] -> false;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr294, _,
	     {__Levelip_mgr294, __Tracesip_mgr294}}
		when __Levelip_mgr294 band 8 /= 0 orelse
		       __Tracesip_mgr294 /= [] ->
		lager:do_log(error,
			     [{module, ip_mgr}, {function, is_white},
			      {line, 294}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("查询是否被白名单ip时发生错误:~w", [_Err]), none,
			     4096, 8, __Levelip_mgr294, __Tracesip_mgr294,
			     lager_event, __Pidip_mgr294);
	    _ -> ok
	  end,
	  false
    end.

-spec is_white_acc(bitstring()) -> true | false.

is_white_acc(Account) ->
    case catch ets:lookup(account_white, Account) of
      [_] -> true;
      [] -> false;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr305, _,
	     {__Levelip_mgr305, __Tracesip_mgr305}}
		when __Levelip_mgr305 band 8 /= 0 orelse
		       __Tracesip_mgr305 /= [] ->
		lager:do_log(error,
			     [{module, ip_mgr}, {function, is_white_acc},
			      {line, 305}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("查询是否被白名单账号时发生错误:~w", [_Err]), none,
			     4096, 8, __Levelip_mgr305, __Tracesip_mgr305,
			     lager_event, __Pidip_mgr305);
	    _ -> ok
	  end,
	  false
    end.

ip2bitstring({N1, N2, N3, N4}) ->
    list_to_bitstring(integer_to_list(N1) ++
			"." ++
			  integer_to_list(N2) ++
			    "." ++
			      integer_to_list(N3) ++
				"." ++ integer_to_list(N4)).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidip_mgr317, _,
       {__Levelip_mgr317, __Tracesip_mgr317}}
	  when __Levelip_mgr317 band 64 /= 0 orelse
		 __Tracesip_mgr317 /= [] ->
	  lager:do_log(info,
		       [{module, ip_mgr}, {function, init}, {line, 317},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [ip_mgr]), none, 4096, 64,
		       __Levelip_mgr317, __Tracesip_mgr317, lager_event,
		       __Pidip_mgr317);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(ip_mgr,
	    [set, named_table, public, {keypos, #ip_info.ip}]),
    ets:new(ip_block,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(ip_white,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(device_black,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(account_white,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(ip_address,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(reg_idfa,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(reg_ip_num,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(reg_getui_cid_num,
	    [set, named_table, public, {keypos, 1}]),
    load_reg_info(),
    erlang:send_after(10000, self(), reload_block),
    erlang:send_after(11000, self(), reload_white),
    erlang:send_after(12000, self(), reload_white_acc),
    erlang:send_after(13000, self(), reload_device_black),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidip_mgr335, _,
       {__Levelip_mgr335, __Tracesip_mgr335}}
	  when __Levelip_mgr335 band 64 /= 0 orelse
		 __Tracesip_mgr335 /= [] ->
	  lager:do_log(info,
		       [{module, ip_mgr}, {function, init}, {line, 335},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [ip_mgr]), none, 4096, 64,
		       __Levelip_mgr335, __Tracesip_mgr335, lager_event,
		       __Pidip_mgr335);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reload_block, State) ->
    load_block(), {noreply, State};
handle_info(reload_white, State) ->
    load_white(), {noreply, State};
handle_info(reload_white_acc, State) ->
    load_white_acc(), {noreply, State};
handle_info(reload_device_black, State) ->
    load_device_black(), {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidip_mgr368, _,
       {__Levelip_mgr368, __Tracesip_mgr368}}
	  when __Levelip_mgr368 band 64 /= 0 orelse
		 __Tracesip_mgr368 /= [] ->
	  lager:do_log(info,
		       [{module, ip_mgr}, {function, terminate}, {line, 368},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在关闭...", [ip_mgr]), none, 4096, 64,
		       __Levelip_mgr368, __Tracesip_mgr368, lager_event,
		       __Pidip_mgr368);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidip_mgr369, _,
       {__Levelip_mgr369, __Tracesip_mgr369}}
	  when __Levelip_mgr369 band 64 /= 0 orelse
		 __Tracesip_mgr369 /= [] ->
	  lager:do_log(info,
		       [{module, ip_mgr}, {function, terminate}, {line, 369},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 关闭完成", [ip_mgr]), none, 4096, 64,
		       __Levelip_mgr369, __Tracesip_mgr369, lager_event,
		       __Pidip_mgr369);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

sort_connected(#ip_info{connected = C1},
	       #ip_info{connected = C2})
    when C1 =< C2 ->
    false;
sort_connected(_, _) -> true.

sort_conn_times(#ip_info{conn_times = C1},
		#ip_info{conn_times = C2})
    when C1 =< C2 ->
    false;
sort_conn_times(_, _) -> true.

load_block() ->
    Sql = <<"select ip from mod_black_ip where status "
	    "= 1">>,
    case db:get_all(Sql) of
      {ok, L} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr392, _,
	     {__Levelip_mgr392, __Tracesip_mgr392}}
		when __Levelip_mgr392 band 128 /= 0 orelse
		       __Tracesip_mgr392 /= [] ->
		lager:do_log(debug,
			     [{module, ip_mgr}, {function, load_block},
			      {line, 392}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("封禁的ip列表: ~w", [L]), none, 4096, 128,
			     __Levelip_mgr392, __Tracesip_mgr392, lager_event,
			     __Pidip_mgr392);
	    _ -> ok
	  end,
	  ets:delete_all_objects(ip_block),
	  lists:foreach(fun ([Ip]) -> ets:insert(ip_block, {Ip})
			end,
			L);
      {error, _Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr399, _,
	     {__Levelip_mgr399, __Tracesip_mgr399}}
		when __Levelip_mgr399 band 8 /= 0 orelse
		       __Tracesip_mgr399 /= [] ->
		lager:do_log(error,
			     [{module, ip_mgr}, {function, load_block},
			      {line, 399}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载封禁ip列表时发生错误: ~w", [_Err]), none,
			     4096, 8, __Levelip_mgr399, __Tracesip_mgr399,
			     lager_event, __Pidip_mgr399);
	    _ -> ok
	  end
    end,
    ok.

load_white() ->
    Sql = <<"select ip from mod_white_ip where status "
	    "= 1">>,
    case db:get_all(Sql) of
      {ok, L} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr408, _,
	     {__Levelip_mgr408, __Tracesip_mgr408}}
		when __Levelip_mgr408 band 128 /= 0 orelse
		       __Tracesip_mgr408 /= [] ->
		lager:do_log(debug,
			     [{module, ip_mgr}, {function, load_white},
			      {line, 408}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("白名单ip列表: ~w", [L]), none, 4096, 128,
			     __Levelip_mgr408, __Tracesip_mgr408, lager_event,
			     __Pidip_mgr408);
	    _ -> ok
	  end,
	  ets:delete_all_objects(ip_white),
	  lists:foreach(fun ([Ip]) -> ets:insert(ip_white, {Ip})
			end,
			L),
	  catch save_ip_to_register(L);
      {error, _Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr416, _,
	     {__Levelip_mgr416, __Tracesip_mgr416}}
		when __Levelip_mgr416 band 8 /= 0 orelse
		       __Tracesip_mgr416 /= [] ->
		lager:do_log(error,
			     [{module, ip_mgr}, {function, load_white},
			      {line, 416}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载白名单ip列表时发生错误: ~w", [_Err]), none,
			     4096, 8, __Levelip_mgr416, __Tracesip_mgr416,
			     lager_event, __Pidip_mgr416);
	    _ -> ok
	  end
    end,
    ok.

load_white_acc() ->
    Sql = <<"select account from mod_white_acc where "
	    "status = 1">>,
    case db:get_all(Sql) of
      {ok, L} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr425, _,
	     {__Levelip_mgr425, __Tracesip_mgr425}}
		when __Levelip_mgr425 band 128 /= 0 orelse
		       __Tracesip_mgr425 /= [] ->
		lager:do_log(debug,
			     [{module, ip_mgr}, {function, load_white_acc},
			      {line, 425}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("白名单acc列表: ~w", [L]), none, 4096,
			     128, __Levelip_mgr425, __Tracesip_mgr425,
			     lager_event, __Pidip_mgr425);
	    _ -> ok
	  end,
	  ets:delete_all_objects(account_white),
	  [ets:insert(account_white, {Account})
	   || [Account] <- L],
	  catch load_white_acc_file();
      {error, _Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr430, _,
	     {__Levelip_mgr430, __Tracesip_mgr430}}
		when __Levelip_mgr430 band 8 /= 0 orelse
		       __Tracesip_mgr430 /= [] ->
		lager:do_log(error,
			     [{module, ip_mgr}, {function, load_white_acc},
			      {line, 430}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载白名单acc列表时发生错误: ~w", [_Err]), none,
			     4096, 8, __Levelip_mgr430, __Tracesip_mgr430,
			     lager_event, __Pidip_mgr430);
	    _ -> ok
	  end
    end,
    ok.

load_device_black() ->
    Sql = <<"select device, type from mod_black_device "
	    "where status = 1">>,
    case db:get_all(Sql) of
      {ok, L} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr439, _,
	     {__Levelip_mgr439, __Tracesip_mgr439}}
		when __Levelip_mgr439 band 128 /= 0 orelse
		       __Tracesip_mgr439 /= [] ->
		lager:do_log(debug,
			     [{module, ip_mgr}, {function, load_device_black},
			      {line, 439}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("设置黑名单列表: ~w", [L]), none, 4096, 128,
			     __Levelip_mgr439, __Tracesip_mgr439, lager_event,
			     __Pidip_mgr439);
	    _ -> ok
	  end,
	  ets:delete_all_objects(device_black),
	  [ets:insert(device_black, {Device, Type})
	   || [Device, Type] <- L];
      {error, _Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr443, _,
	     {__Levelip_mgr443, __Tracesip_mgr443}}
		when __Levelip_mgr443 band 8 /= 0 orelse
		       __Tracesip_mgr443 /= [] ->
		lager:do_log(error,
			     [{module, ip_mgr}, {function, load_device_black},
			      {line, 443}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载设备黑名单列表时发生错误: ~w", [_Err]), none,
			     4096, 8, __Levelip_mgr443, __Tracesip_mgr443,
			     lager_event, __Pidip_mgr443);
	    _ -> ok
	  end
    end,
    ok.

save_ip_to_register(IpL) ->
    case register_var_dir(sys_env:get(server_id)) of
      undefined -> skip;
      Dir ->
	  S = io_lib:format("<?php \nreturn array(\n~ts\n);",
			    [string:join([io_lib:format("'~ts'", [Ip])
					  || Ip <- IpL],
					 ",\n")]),
	  file:write_file(Dir ++ "/white_ip.cache.php", S)
    end.

register_var_dir(<<"local_1">>) -> ".";
register_var_dir(<<"dev_1">>) ->
    "/data/zsyz.dev/register/var";
register_var_dir(<<"sy_1">>) ->
    "/data/sszg_register/var";
register_var_dir(_) -> undefined.

load_white_acc_file() ->
    File = "/data/zone/white_acc.cfg",
    case catch util:load(File) of
      {ok, L} ->
	  [ets:insert(account_white, {util:to_binary(Account)})
	   || Account <- L];
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr470, _,
	     {__Levelip_mgr470, __Tracesip_mgr470}}
		when __Levelip_mgr470 band 8 /= 0 orelse
		       __Tracesip_mgr470 /= [] ->
		lager:do_log(error,
			     [{module, ip_mgr}, {function, load_white_acc_file},
			      {line, 470}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载账号白名单配置文件[~s]出错:~w",
					   [File, _Err]),
			     none, 4096, 8, __Levelip_mgr470, __Tracesip_mgr470,
			     lager_event, __Pidip_mgr470);
	    _ -> ok
	  end
    end.

load_reg_info() ->
    Sql = <<"select reg_idfa, reg_ip, getui_cid from "
	    "role">>,
    case db:get_all(Sql, [], 30000) of
      {ok, L} -> do_load_reg_info(L);
      {error, _Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidip_mgr480, _,
	     {__Levelip_mgr480, __Tracesip_mgr480}}
		when __Levelip_mgr480 band 8 /= 0 orelse
		       __Tracesip_mgr480 /= [] ->
		lager:do_log(error,
			     [{module, ip_mgr}, {function, load_reg_info},
			      {line, 480}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载设备信息失败: ~w", [_Err]), none, 4096,
			     8, __Levelip_mgr480, __Tracesip_mgr480,
			     lager_event, __Pidip_mgr480);
	    _ -> ok
	  end
    end,
    ok.

do_load_reg_info([]) -> ok;
do_load_reg_info([[RegIdfa, RegIp, GetuiCid] | T]) ->
    inc_reg_idfa(RegIdfa),
    inc_reg_ip(RegIp),
    inc_reg_getui_cid(GetuiCid),
    do_load_reg_info(T).


