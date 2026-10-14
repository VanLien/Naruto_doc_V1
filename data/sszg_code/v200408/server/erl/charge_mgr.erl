-file("src/mod/charge/charge_mgr.erl", 1).

-module(charge_mgr).

-lager_records([{state, []}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0,
	 sync_charge_log/1, reload_role_charge_sn/2]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {}).

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

-file("src/mod/charge/charge_mgr.erl", 12).

info(Info) -> charge_mgr ! Info.

cast(Info) -> gen_server:cast(charge_mgr, Info).

reload_role_charge_sn(Rid, SrvId) ->
    cast({reload_role_charge_sn, Rid, SrvId}), ok.

call(Info) ->
    case catch gen_server:call(charge_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge_mgr26, _,
	     {__Levelcharge_mgr26, __Tracescharge_mgr26}}
		when __Levelcharge_mgr26 band 8 /= 0 orelse
		       __Tracescharge_mgr26 /= [] ->
		lager:do_log(error,
			     [{module, charge_mgr}, {function, call},
			      {line, 26}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [charge_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelcharge_mgr26,
			     __Tracescharge_mgr26, lager_event,
			     __Pidcharge_mgr26);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, charge_mgr}, charge_mgr,
			  [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcharge_mgr32, _,
       {__Levelcharge_mgr32, __Tracescharge_mgr32}}
	  when __Levelcharge_mgr32 band 64 /= 0 orelse
		 __Tracescharge_mgr32 /= [] ->
	  lager:do_log(info,
		       [{module, charge_mgr}, {function, init}, {line, 32},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [charge_mgr]), none, 4096,
		       64, __Levelcharge_mgr32, __Tracescharge_mgr32,
		       lager_event, __Pidcharge_mgr32);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(charge_sn,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(charge_sn_fail,
	    [set, named_table, public, {keypos, 1}]),
    {ok, L} =
	db:get_all("select rid, srv_id, sn from mod_charge "
		   "where status = 0",
		   [], 180000),
    [ets:insert(charge_sn, {Sn, Rid, SrvId})
     || [Rid, SrvId, Sn] <- L],
    util:set_timer(charge_loop, 120, loop),
    util:set_timer(day_sync_log,
		   date:next_diff({3, 30, 0}) + util:rand(1, 3600),
		   sync_log),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcharge_mgr41, _,
       {__Levelcharge_mgr41, __Tracescharge_mgr41}}
	  when __Levelcharge_mgr41 band 64 /= 0 orelse
		 __Tracescharge_mgr41 /= [] ->
	  lager:do_log(info,
		       [{module, charge_mgr}, {function, init}, {line, 41},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [charge_mgr]), none, 4096,
		       64, __Levelcharge_mgr41, __Tracescharge_mgr41,
		       lager_event, __Pidcharge_mgr41);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({reload_role_charge_sn, Rid, SrvId},
	    State) ->
    try {ok, L} =
	    db:get_all("select rid, srv_id, sn from mod_charge "
		       "where rid=? and srv_id=? and status "
		       "= 0",
		       [Rid, SrvId], 60000),
	case {whereis(lager_event), whereis(lager_event),
	      lager_config:get({lager_event, loglevel}, {0, []})}
	    of
	  {undefined, undefined, _} ->
	      fun () -> {error, lager_not_running} end();
	  {undefined, _, _} ->
	      fun () -> {error, {sink_not_configured, lager_event}}
	      end();
	  {__Pidcharge_mgr51, _,
	   {__Levelcharge_mgr51, __Tracescharge_mgr51}}
	      when __Levelcharge_mgr51 band 64 /= 0 orelse
		     __Tracescharge_mgr51 /= [] ->
	      lager:do_log(info,
			   [{module, charge_mgr}, {function, handle_cast},
			    {line, 51}, {pid, pid_to_list(self())},
			    {node, node()}
			    | lager:md()],
			   io_lib:format("重载指定角色[~w]订单L:~w", [{Rid, SrvId}, L]),
			   none, 4096, 64, __Levelcharge_mgr51,
			   __Tracescharge_mgr51, lager_event,
			   __Pidcharge_mgr51);
	  _ -> ok
	end,
	deal_loop(L)
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge_mgr55, _,
	     {__Levelcharge_mgr55, __Tracescharge_mgr55}}
		when __Levelcharge_mgr55 band 8 /= 0 orelse
		       __Tracescharge_mgr55 /= [] ->
		lager:do_log(error,
			     [{module, charge_mgr}, {function, handle_cast},
			      {line, 55}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("重载指定角色[~w]订单错误[Type:~w][Err:~w]",
					   [{Rid, SrvId}, Type, Err]),
			     none, 4096, 8, __Levelcharge_mgr55,
			     __Tracescharge_mgr55, lager_event,
			     __Pidcharge_mgr55);
	    _ -> ok
	  end,
	  ok
    end,
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(loop, State) ->
    Now = date:unixtime(),
    case
      db:get_all("select rid, srv_id, sn from mod_charge "
		 "where status = 0 and ctime > ? limit "
		 "100",
		 [Now - 1864000])
	of
      {ok, Data} -> deal_loop(Data);
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge_mgr69, _,
	     {__Levelcharge_mgr69, __Tracescharge_mgr69}}
		when __Levelcharge_mgr69 band 8 /= 0 orelse
		       __Tracescharge_mgr69 /= [] ->
		lager:do_log(error,
			     [{module, charge_mgr}, {function, handle_info},
			      {line, 69}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("循环处理订单失败:~w", [_Err]), none, 4096,
			     8, __Levelcharge_mgr69, __Tracescharge_mgr69,
			     lager_event, __Pidcharge_mgr69);
	    _ -> ok
	  end
    end,
    util:set_timer(charge_loop, 120, loop),
    {noreply, State};
handle_info(sync_log, State) ->
    sync_charge_log(2),
    util:set_timer(day_sync_log,
		   date:next_diff({3, 30, 0}) + util:rand(1, 3600),
		   sync_log),
    {noreply, State};
handle_info(gm_sync_log, State) ->
    util:set_timer(gm_sync_log, util:rand(1, 7200),
		   {do_gm_sync_log, 1}),
    {noreply, State};
handle_info({do_gm_sync_log, Id}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcharge_mgr84, _,
       {__Levelcharge_mgr84, __Tracescharge_mgr84}}
	  when __Levelcharge_mgr84 band 64 /= 0 orelse
		 __Tracescharge_mgr84 /= [] ->
	  lager:do_log(info,
		       [{module, charge_mgr}, {function, handle_info},
			{line, 84}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("同步充值日志:Id:~w", [Id]), none, 4096, 64,
		       __Levelcharge_mgr84, __Tracescharge_mgr84, lager_event,
		       __Pidcharge_mgr84);
      _ -> ok
    end,
    case do_gm_sync_log(Id) of
      {ok, finish} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge_mgr87, _,
	     {__Levelcharge_mgr87, __Tracescharge_mgr87}}
		when __Levelcharge_mgr87 band 64 /= 0 orelse
		       __Tracescharge_mgr87 /= [] ->
		lager:do_log(info,
			     [{module, charge_mgr}, {function, handle_info},
			      {line, 87}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步充值日志完成:~w", [Id]), none, 4096, 64,
			     __Levelcharge_mgr87, __Tracescharge_mgr87,
			     lager_event, __Pidcharge_mgr87);
	    _ -> ok
	  end,
	  ok;
      {ok, NewId} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge_mgr90, _,
	     {__Levelcharge_mgr90, __Tracescharge_mgr90}}
		when __Levelcharge_mgr90 band 64 /= 0 orelse
		       __Tracescharge_mgr90 /= [] ->
		lager:do_log(info,
			     [{module, charge_mgr}, {function, handle_info},
			      {line, 90}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步充值日志未结束:Id:~w NewId:~w",
					   [Id, NewId]),
			     none, 4096, 64, __Levelcharge_mgr90,
			     __Tracescharge_mgr90, lager_event,
			     __Pidcharge_mgr90);
	    _ -> ok
	  end,
	  util:set_ms_timer(gm_sync_log, util:rand(300, 5000),
			    {do_gm_sync_log, NewId})
    end,
    {noreply, State};
handle_info({delay_check, Sn, DealTime}, State) ->
    ets:insert(charge_sn_fail, {Sn, DealTime}),
    erlang:send_after(60000, self(),
		      {do_delay_check, Sn, DealTime}),
    {noreply, State};
handle_info({do_delay_check, Sn, DealTime}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcharge_mgr101, _,
       {__Levelcharge_mgr101, __Tracescharge_mgr101}}
	  when __Levelcharge_mgr101 band 64 /= 0 orelse
		 __Tracescharge_mgr101 /= [] ->
	  lager:do_log(info,
		       [{module, charge_mgr}, {function, handle_info},
			{line, 101}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("订单处理失败，延时重新处理 sn:~s deal_time=~w",
				     [Sn, DealTime]),
		       none, 4096, 64, __Levelcharge_mgr101,
		       __Tracescharge_mgr101, lager_event, __Pidcharge_mgr101);
      _ -> ok
    end,
    case ets:member(charge_sn_fail, Sn) of
      true ->
	  ets:delete(charge_sn_fail, Sn),
	  db:execute("update mod_charge set status = 0 where "
		     "sn =? and time_deal = ?",
		     [Sn, DealTime]);
      _ -> pass
    end,
    {noreply, State};
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
      {__Pidcharge_mgr115, _,
       {__Levelcharge_mgr115, __Tracescharge_mgr115}}
	  when __Levelcharge_mgr115 band 64 /= 0 orelse
		 __Tracescharge_mgr115 /= [] ->
	  lager:do_log(info,
		       [{module, charge_mgr}, {function, terminate},
			{line, 115}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭:~w", [_Reason]), none, 4096, 64,
		       __Levelcharge_mgr115, __Tracescharge_mgr115,
		       lager_event, __Pidcharge_mgr115);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

deal_loop([]) -> ok;
deal_loop([[Rid, SrvId, Sn] | T]) ->
    ets:insert(charge_sn, {Sn, Rid, SrvId}),
    role_lib:cast(by_id, {Rid, SrvId},
		  {charge, pay, [Sn, loop]}),
    deal_loop(T).

sync_charge_log(Days) ->
    Time = date:unixtime() - 86400 * Days,
    case
      db:get_all("select r.rid, r.srv_id, c.channel, r.login_ip"
		 ", r.account, r.name, r.lev, r.vip_lev, "
		 "r.career, r.sex, idfa, device_type, "
		 "getui_cid, login_time, sn, currency_type, "
		 "money, c.gold, package_id, pay_channel, "
		 "category, c.ctime from mod_charge c, "
		 "role r where c.rid=r.rid and c.srv_id "
		 "= r.srv_id and c.status = 1 and c.ctime "
		 "> ? ",
		 [Time])
	of
      {ok, Data} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge_mgr132, _,
	     {__Levelcharge_mgr132, __Tracescharge_mgr132}}
		when __Levelcharge_mgr132 band 64 /= 0 orelse
		       __Tracescharge_mgr132 /= [] ->
		lager:do_log(info,
			     [{module, charge_mgr}, {function, sync_charge_log},
			      {line, 132}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步充值日志:day:~w num:~w",
					   [Days, length(Data)]),
			     none, 4096, 64, __Levelcharge_mgr132,
			     __Tracescharge_mgr132, lager_event,
			     __Pidcharge_mgr132);
	    _ -> ok
	  end,
	  do_log(Data);
      _ -> ok
    end.

do_gm_sync_log(Id) ->
    MaxId = Id + 2000,
    case
      db:get_all("select r.rid, r.srv_id, c.channel, r.login_ip"
		 ", c.account, c.name, c.lev, r.vip_lev, "
		 "r.career, r.sex, idfa, device_type, "
		 "getui_cid, login_time, sn, currency_type, "
		 "money, c.gold, package_id, pay_channel, "
		 "category, c.ctime from mod_charge c, "
		 "role r where c.rid=r.rid and c.srv_id "
		 "= r.srv_id and c.status = 1 and c.id "
		 ">= ? and c.id < ? ",
		 [Id, MaxId])
	of
      {ok, []} ->
	  case db:get_one("select max(id) from mod_charge") of
	    {ok, MaxId1} when MaxId > MaxId1 -> {ok, finish};
	    _ -> {ok, MaxId}
	  end;
      {ok, Data} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge_mgr148, _,
	     {__Levelcharge_mgr148, __Tracescharge_mgr148}}
		when __Levelcharge_mgr148 band 64 /= 0 orelse
		       __Tracescharge_mgr148 /= [] ->
		lager:do_log(info,
			     [{module, charge_mgr}, {function, do_gm_sync_log},
			      {line, 148}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步充值日志:Id:~w MaxId:~w length:~w",
					   [Id, MaxId, length(Data)]),
			     none, 4096, 64, __Levelcharge_mgr148,
			     __Tracescharge_mgr148, lager_event,
			     __Pidcharge_mgr148);
	    _ -> ok
	  end,
	  do_log(Data),
	  {ok, MaxId};
      _ -> {ok, Id}
    end.

do_log([]) -> ok;
do_log([[Rid, SrvId, Channel, Ip, Account, Name, Lev,
	 VipLev, Career, Sex, Idfa, DeviceType, GetuiCid, LoginT,
	 Sn, CurrencyType, Money, Gold, PackageId, PayChannel,
	 PayCateGory, PayTime]
	| T]) ->
    L = [P | _] = string_util:explode(SrvId, "_"),
    Platform = list_to_binary(P),
    ZoneId = list_to_integer(lists:last(L)),
    Log = #{"product_name" => <<"sszg">>,
	    "header_type" => <<"payment">>,
	    "platform_name" => Platform, "gameserver_no" => ZoneId,
	    "ip" => Ip,
	    "date_time" =>
		log_util:date_time(date:seconds_to_datetime(PayTime)),
	    "account_id" => Account, "account_name" => Account,
	    "chr_id" => util:fbin("~w_~s", [Rid, SrvId]),
	    "chr_name" => Name, "chr_level" => Lev,
	    "chr_level_vip" => VipLev,
	    "career" => log_util:career_name(Career),
	    "gender" => log_util:sex_name(Sex), "device_id" => Idfa,
	    "device_type" => DeviceType, "device_key" => GetuiCid,
	    "os" => <<>>, "carrier" => <<>>, "net_type" => <<>>,
	    "resolution" => <<>>,
	    "session_id" =>
		util:fbin("~w_~s_~w", [Rid, SrvId, LoginT]),
	    order_id => Sn, currency_type => CurrencyType,
	    currency_amount => Money, pay_category => PayCateGory,
	    package_name => util:to_binary(PackageId),
	    pay_channel => PayChannel, virtual_amount => Gold,
	    "channel_name" => Channel},
    log_mgr:write(Log),
    do_log(T).


