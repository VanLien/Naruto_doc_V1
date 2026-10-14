-file("src/mod/say/say_mgr.erl", 1).

-module(say_mgr).

-lager_records([{violators_record, [id, name, lists]},
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
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
		{state,
		 [world_say_list, cross_say_list, province_say_list,
		  cache_id]}]).

-behaviour(gen_server).

-export([add_cache/1, get_cache/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state,
	{world_say_list = [], cross_say_list = [],
	 province_say_list = [], cache_id = 1}).

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

-file("src/mod/say/say_mgr.erl", 18).

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

-file("src/mod/say/say_mgr.erl", 19).

-spec add_cache(tuple()) -> pos_integer().

add_cache(Data) ->
    {ok, Id} = call(get_cache_id),
    ets:insert(say_cache, {Id, Data}),
    Id.

-spec get_cache(pos_integer()) -> {ok, tuple()} | false.

get_cache(Id) ->
    case ets:lookup(say_cache, Id) of
      [{_, Data}] -> {ok, Data};
      _ -> false
    end.

info(Info) -> say_mgr ! Info.

cast(Info) -> gen_server:cast(say_mgr, Info).

call(Info) ->
    case catch gen_server:call(say_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsay_mgr44, _,
	     {__Levelsay_mgr44, __Tracessay_mgr44}}
		when __Levelsay_mgr44 band 8 /= 0 orelse
		       __Tracessay_mgr44 /= [] ->
		lager:do_log(error,
			     [{module, say_mgr}, {function, call}, {line, 44},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [say_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelsay_mgr44, __Tracessay_mgr44,
			     lager_event, __Pidsay_mgr44);
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
    gen_server:start_link({local, say_mgr}, say_mgr, [],
			  []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsay_mgr50, _,
       {__Levelsay_mgr50, __Tracessay_mgr50}}
	  when __Levelsay_mgr50 band 64 /= 0 orelse
		 __Tracessay_mgr50 /= [] ->
	  lager:do_log(info,
		       [{module, say_mgr}, {function, init}, {line, 50},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [say_mgr]), none, 4096,
		       64, __Levelsay_mgr50, __Tracessay_mgr50, lager_event,
		       __Pidsay_mgr50);
      _ -> ok
    end,
    dets:open_file(say_private_offline_msg,
		   [{file, "./dets/say_private_offline_msg.dets"},
		    {keypos, 1}]),
    ets:new(say_private_offline_msg,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(say_cache,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(say_report,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(say_mention,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(say_history,
	    [set, named_table, public, {keypos, #say_history.id}]),
    ets:new(violators_record,
	    [set, named_table, public,
	     {keypos, #violators_record.id}]),
    ets:insert(say_mention, {1, 0}),
    ets:insert(say_mention, {4, 0}),
    ets:new(role_face_report,
	    [set, named_table, public, {keypos, 1}]),
    load(),
    util:set_timer(clear_violators_timer, {0, 0, 0},
		   clear_violators),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsay_mgr64, _,
       {__Levelsay_mgr64, __Tracessay_mgr64}}
	  when __Levelsay_mgr64 band 64 /= 0 orelse
		 __Tracessay_mgr64 /= [] ->
	  lager:do_log(info,
		       [{module, say_mgr}, {function, init}, {line, 64},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [say_mgr]), none, 4096, 64,
		       __Levelsay_mgr64, __Tracessay_mgr64, lager_event,
		       __Pidsay_mgr64);
      _ -> ok
    end,
    {ok, State}.

handle_call(get_cache_id, _From,
	    State = #state{cache_id = Id})
    when Id >= 10000 ->
    {reply, {ok, Id}, State#state{cache_id = 1}};
handle_call(get_cache_id, _From,
	    State = #state{cache_id = Id}) ->
    {reply, {ok, Id}, State#state{cache_id = Id + 1}};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({add_private_offine_msg, RoleId,
	     SaySend = #say_send{id = FromRoleId,
				 msg_list = MsgList1}},
	    State) ->
    SendL = lookup_send(RoleId),
    NewSendL = case lists:keyfind(FromRoleId, #say_send.id,
				  SendL)
		   of
		 false -> lists:sublist([SaySend | SendL], 20);
		 #say_send{msg_list = [_ | MsgList]}
		     when length(MsgList) >= 19 ->
		     NewSaySend = SaySend#say_send{msg_list =
						       MsgList ++ MsgList1},
		     lists:keyreplace(FromRoleId, #say_send.id, SendL,
				      NewSaySend);
		 #say_send{msg_list = MsgList} ->
		     NewSaySend = SaySend#say_send{msg_list =
						       MsgList ++ MsgList1},
		     lists:keyreplace(FromRoleId, #say_send.id, SendL,
				      NewSaySend)
	       end,
    ets:insert(say_private_offline_msg, {RoleId, NewSendL}),
    dets:insert(say_private_offline_msg,
		{RoleId, NewSendL}),
    {noreply, State};
handle_info({del_private_offline_msg, RoleId,
	     FromRoleId},
	    State) ->
    SendL = lookup_send(RoleId),
    NewSendL = lists:keydelete(FromRoleId, #say_send.id,
			       SendL),
    ets:insert(say_private_offline_msg, {RoleId, NewSendL}),
    dets:insert(say_private_offline_msg,
		{RoleId, NewSendL}),
    {noreply, State};
handle_info({del_private_offline_msg, RoleId}, State) ->
    ets:delete(say_private_offline_msg, RoleId),
    dets:delete(say_private_offline_msg, RoleId),
    {noreply, State};
handle_info({del_say, {Rid, SrvId}},
	    State = #state{world_say_list = L}) ->
    NewL = [I
	    || I = {_XTime, {[R], _XChannel, _XLen, _XMsg}} <- L,
	       element(1, R) =/= Rid orelse element(2, R) =/= SrvId],
    role_group:pack_send(world, 12704, {Rid, SrvId}),
    {noreply, State#state{world_say_list = NewL}};
handle_info({say, 1, SayData},
	    State = #state{world_say_list = L}) ->
    Now = date:unixtime(),
    L1 = L ++ [{Now, SayData}],
    NewL = case length(L1) > 30 of
	     true -> [_ | L2] = L1, L2;
	     _ -> L1
	   end,
    {noreply, State#state{world_say_list = NewL}};
handle_info({say, 1024, SayData},
	    State = #state{cross_say_list = L}) ->
    Now = date:unixtime(),
    L1 = L ++ [{Now, SayData}],
    NewL = case length(L1) > 30 of
	     true -> [_ | L2] = L1, L2;
	     _ -> L1
	   end,
    {noreply, State#state{cross_say_list = NewL}};
handle_info({say, 2048, PName, SayData},
	    State = #state{province_say_list = List}) ->
    Now = date:unixtime(),
    NewList = case lists:keyfind(PName, 1, List) of
		{_, L} ->
		    L1 = L ++ [{Now, SayData}],
		    case length(L1) > 10 of
		      true ->
			  [_ | L2] = L1,
			  lists:keystore(PName, 1, List, {PName, L2});
		      _ -> lists:keystore(PName, 1, List, {PName, L1})
		    end;
		_ ->
		    lists:keystore(PName, 1, List,
				   {PName, [{Now, SayData}]})
	      end,
    {noreply, State#state{province_say_list = NewList}};
handle_info({world_say_push, RoleId, ConnPid, PName,
	     Lev},
	    State = #state{world_say_list = WL, cross_say_list = CL,
			   province_say_list = PL}) ->
    Now = date:unixtime(),
    L1 = [{XRoleInfo, XChannel, XLen, XMsg, XTime}
	  || {XTime, {XRoleInfo, XChannel, XLen, XMsg, _}} <- WL,
	     Now - XTime =< 3600 * 6 andalso
	       (XChannel =/= 1024 orelse
		  Lev >= misc_data:get_const(cross_level))],
    L2 = [{XRoleInfo, XChannel, XLen, XMsg, XTime}
	  || {XTime, {XRoleInfo, XChannel, XLen, XMsg, _}} <- CL,
	     Now - XTime =< 3600 * 6 andalso
	       Lev >= misc_data:get_const(cross_level)],
    L3 = case lists:keyfind(PName, 1, PL) of
	   {_, L4} ->
	       [{XRoleInfo, XChannel, XLen, XMsg, XTime}
		|| {XTime, {XRoleInfo, XChannel, XLen, XMsg, _}} <- L4,
		   Now - XTime =< 3600 * 6 andalso
		     Lev >= misc_data:get_const(province_level)];
	   _ -> []
	 end,
    case L1 ++ L2 ++ L3 of
      NewL = [_ | _] ->
	  role:pack_send(ConnPid, 12766, {1, NewL});
      _ -> skip
    end,
    case lookup_send(RoleId) of
      SendL = [#say_send{id = {FromRid, FromSrvId},
			 name = FromName, career = FromCareer}
	       | _] ->
	  role:pack_send(ConnPid, 12722, {SendL}),
	  notice_below:send_private(ConnPid,
				    {FromRid, FromSrvId, FromName, FromCareer});
      _ -> []
    end,
    {noreply, State};
handle_info({mention, Msg, Channel, SenderInfo},
	    State) ->
    say:mention(Msg, Channel, SenderInfo), {noreply, State};
handle_info({clear}, State) ->
    {noreply,
     State#state{world_say_list = [], cross_say_list = [],
		 province_say_list = []}};
handle_info(clear_violators, State) ->
    ets:delete_all_objects(violators_record),
    ets:delete_all_objects(role_face_report),
    Now = date:unixtime(),
    ets:select_delete(say_history,
		      [{{'_', '_', '$1', '_'}, [{'<', '$1', Now}], [true]}]),
    util:set_timer(clear_violators_timer, {0, 0, 0},
		   clear_violators),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

say_send_ver({say_send, Id, Name, Sex, Career, Lev,
	      FaceId, VipLev, Capacity, HeadBid, ChatBubble,
	      MsgList}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    say_send_ver({say_send, Id, Name, Sex, Career, Lev,
		  FaceId, VipLev, Capacity, HeadBid, ChatBubble, MsgList,
		  FaceUpdateTime, FaceFile});
say_send_ver(SaySend = #say_send{}) -> SaySend.

load() ->
    Fun = fun ({RoleId, L}) ->
		  L1 = [say_send_ver(Send) || Send <- L],
		  NewL = [Send#say_send{msg_list =
					    [M || M = #say_msg{} <- MsgL]}
			  || Send = #say_send{msg_list = MsgL} <- L1],
		  ets:insert(say_private_offline_msg, {RoleId, NewL}),
		  continue
	  end,
    dets:traverse(say_private_offline_msg, Fun).

lookup_send(RoleId) ->
    case ets:lookup(say_private_offline_msg, RoleId) of
      [{_, L}] -> L;
      _ -> []
    end.


