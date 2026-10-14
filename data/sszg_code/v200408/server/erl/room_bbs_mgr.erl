-file("src/mod/role_room/room_bbs_mgr.erl", 1).

-module(room_bbs_mgr).

-lager_records([{room_rank_info,
		 [id, name, lev, face, avatar_bid, time, fans_num, rank,
		  look_id, face_update_time, face_file]},
		{room_fans_num, [id, fans]}, {room_fans, [myid, fid]},
		{room_bbs_message_below, [id, role_id, name, bbs_id]},
		{room_bbs_message,
		 [id, bbs_id, bbs_type, reply_name, reply_bbs_id,
		  reply_id, msg, time, tar_id, face_id, avatar_id, lev,
		  sex, name, face_update_time, face_file]},
		{room_honor_badges, [id, time]},
		{room_grow, [id, order, time, arge, ext]},
		{m_room_grow, [ver, finish, doing, info, next_id, ext]},
		{m_room_feat, [ver, flag, finish, doing, overdue, ext]},
		{m_room,
		 [ver, city_id, fanse_list, honor_badges, honor_point,
		  use_badges, room_bbs_set, room_bbs_num]},
		{state, [next_id]}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {next_id = 1}).

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

-file("src/mod/role_room/room_bbs_mgr.erl", 13).

-file("inc/role_room.hrl", 1).

-record(m_room,
	{ver = 3, city_id = 0, fanse_list = [],
	 honor_badges = [], honor_point = 0, use_badges = [],
	 room_bbs_set = 1, room_bbs_num = 0}).

-record(m_room_feat,
	{ver = 1, flag = 0,
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()], ext = []}).

-record(m_room_grow,
	{ver = 1, finish = []  :: [pos_integer()],
	 doing = []  :: [tuple()], info = [], next_id = 1,
	 ext = []}).

-record(room_grow,
	{id = 0, order = 0, time = 0, arge = [], ext = []}).

-record(room_honor_badges, {id = 0, time = 0}).

-record(room_bbs_message,
	{id = {0, <<>>}, bbs_id = 0, bbs_type = 0,
	 reply_name = <<>>, reply_bbs_id = 0,
	 reply_id = {0, <<>>}, msg = <<>>, time = 0,
	 tar_id = {0, <<>>}, face_id = 0, avatar_id = 0, lev = 0,
	 sex = 0, name = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(room_bbs_message_below,
	{id = {0, <<>>}, role_id = {0, <<>>}, name = <<>>,
	 bbs_id = 0}).

-record(room_fans, {myid = {0, <<>>}, fid = {0, <<>>}}).

-record(room_fans_num, {id = {0, <<>>}, fans = 0}).

-record(room_rank_info,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, fans_num = 0, rank = 0,
	 look_id = 0, face_update_time = 0, face_file = <<>>}).

-file("src/mod/role_room/room_bbs_mgr.erl", 14).

-export([get_tar_bbs_num/1, get_bbs_num/1,
	 get_message/3, get_message_info/3, role_login/2,
	 get_bbs_info/2, get_bbs_info2/2, get_bbs_by_id/1]).

role_login(Id, Num) ->
    case ets:lookup(room_bbs_message_below, Id) of
      L = [_ | _] ->
	  Fun = fun (#room_bbs_message_below{role_id = {Rid, Sid},
					     name = Name, bbs_id = BbsId},
		     Acc) ->
			case Id == {Rid, Sid} of
			  true ->
			      notice_below:send(bbs_message_reply_self), [true];
			  _ ->
			      notice_below:send(Id, bbs_message_reply,
						[{1, Rid}, {2, BbsId}],
						[{1, Sid}, {2, Name}]),
			      Acc
			end
		end,
	  IsSend = lists:foldl(Fun, [], L),
	  case IsSend of
	    [true | _] -> skip;
	    _ ->
		MaxNum = room_bbs_mgr:get_bbs_num(Id),
		case Num < MaxNum of
		  true -> notice_below:send(bbs_message);
		  _ -> skip
		end
	  end;
      _ ->
	  MaxNum = room_bbs_mgr:get_bbs_num(Id),
	  case Num < MaxNum of
	    true -> notice_below:send(bbs_message);
	    _ -> skip
	  end
    end.

get_bbs_info(RoleId, BbsId) ->
    catch cluster_lib:call(element(2, RoleId), room_bbs_mgr,
			   get_bbs_info2, [RoleId, BbsId]).

get_bbs_info2(RoleId, BbsId) ->
    L = get_bbs_by_id(RoleId),
    lists:keyfind(BbsId, #room_bbs_message.bbs_id, L).

get_message(RoleId, Start, Num) ->
    case catch cluster_lib:call(element(2, RoleId),
				room_bbs_mgr, get_message_info,
				[RoleId, Start, Num])
	of
      {ok, MaxNum, List} -> {MaxNum, List};
      _ -> {0, []}
    end.

get_message_info(RoleId, Start, Num) ->
    L = get_bbs_by_id(RoleId),
    NewL =
	to_push_list(lists:reverse(lists:keysort(#room_bbs_message.bbs_id,
						 L)),
		     Start, Num),
    {ok, length(NewL), NewL}.

to_push_list(L, 0, Num) ->
    {L2, _} = list_util:split(Num, L), L2;
to_push_list(L, Start, Num) ->
    lists:sublist(lists:reverse(L), Start, Num).

get_tar_bbs_num(RoleId) ->
    cluster_lib:call(element(2, RoleId), room_bbs_mgr,
		     get_bbs_num, [RoleId]).

get_bbs_num(RoleId) ->
    L = get_bbs_by_id(RoleId), length(L).

get_bbs_by_id(RoleId) ->
    case ets:lookup(room_bbs_message_load, RoleId) of
      [{RoleId, true} | _] ->
	  case ets:lookup(room_bbs_message, RoleId) of
	    L = [_ | _] -> [do_bbs_msg_ver(Date) || Date <- L];
	    _ -> []
	  end;
      _ ->
	  ets:insert(room_bbs_message_load, {RoleId, true}),
	  case dets:lookup(room_bbs_message, RoleId) of
	    L = [_ | _] ->
		NewL = [do_bbs_msg_ver(Date) || Date <- L],
		ets:insert(room_bbs_message, NewL),
		dets:delete(room_bbs_message, RoleId),
		dets:insert(room_bbs_message, NewL),
		NewL;
	    _ -> []
	  end
    end.

do_bbs_msg_ver({room_bbs_message, Id, BbsId, BbsType,
		ReplyName, ReplyBbsId, ReplyId, Msg, Time, TarId,
		FaceId, AvatarId, Lev, Sex, Name}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    do_bbs_msg_ver({room_bbs_message, Id, BbsId, BbsType,
		    ReplyName, ReplyBbsId, ReplyId, Msg, Time, TarId,
		    FaceId, AvatarId, Lev, Sex, Name, FaceUpdateTime,
		    FaceFile});
do_bbs_msg_ver(Data = #room_bbs_message{}) -> Data;
do_bbs_msg_ver(Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidroom_bbs_mgr115, _,
       {__Levelroom_bbs_mgr115, __Tracesroom_bbs_mgr115}}
	  when __Levelroom_bbs_mgr115 band 8 /= 0 orelse
		 __Tracesroom_bbs_mgr115 /= [] ->
	  lager:do_log(error,
		       [{module, room_bbs_mgr}, {function, do_bbs_msg_ver},
			{line, 115}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("留言板数据版本转换失败:~w", [Data]), none, 4096, 8,
		       __Levelroom_bbs_mgr115, __Tracesroom_bbs_mgr115,
		       lager_event, __Pidroom_bbs_mgr115);
      _ -> ok
    end,
    Data.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> room_bbs_mgr ! Info.

cast(Info) -> gen_server:cast(room_bbs_mgr, Info).

call(Info) ->
    case catch gen_server:call(room_bbs_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidroom_bbs_mgr134, _,
	     {__Levelroom_bbs_mgr134, __Tracesroom_bbs_mgr134}}
		when __Levelroom_bbs_mgr134 band 8 /= 0 orelse
		       __Tracesroom_bbs_mgr134 /= [] ->
		lager:do_log(error,
			     [{module, room_bbs_mgr}, {function, call},
			      {line, 134}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [room_bbs_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelroom_bbs_mgr134,
			     __Tracesroom_bbs_mgr134, lager_event,
			     __Pidroom_bbs_mgr134);
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
    gen_server:start_link({local, room_bbs_mgr},
			  room_bbs_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidroom_bbs_mgr140, _,
       {__Levelroom_bbs_mgr140, __Tracesroom_bbs_mgr140}}
	  when __Levelroom_bbs_mgr140 band 64 /= 0 orelse
		 __Tracesroom_bbs_mgr140 /= [] ->
	  lager:do_log(info,
		       [{module, room_bbs_mgr}, {function, init}, {line, 140},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [room_bbs_mgr]), none,
		       4096, 64, __Levelroom_bbs_mgr140,
		       __Tracesroom_bbs_mgr140, lager_event,
		       __Pidroom_bbs_mgr140);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(room_bbs_message_below,
		   [{file, "./dets/room_bbs_message_below.dets"},
		    {keypos, #room_bbs_message_below.id},
		    {type, duplicate_bag}]),
    ets:new(room_bbs_message_below,
	    [duplicate_bag, named_table, public,
	     {keypos, #room_bbs_message_below.id}]),
    ets:from_dets(room_bbs_message_below,
		  room_bbs_message_below),
    dets:open_file(room_bbs_message,
		   [{file, "./dets/room_bbs_message.dets"},
		    {keypos, #room_bbs_message.id}, {type, duplicate_bag}]),
    ets:new(room_bbs_message,
	    [duplicate_bag, named_table, public,
	     {keypos, #room_bbs_message.id}]),
    ets:new(room_bbs_message_load,
	    [set, named_table, public, {keypos, 1}]),
    NextId = sys_env:get(room_bbs_mgr_next_id, 1),
    State = #state{next_id = NextId},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidroom_bbs_mgr153, _,
       {__Levelroom_bbs_mgr153, __Tracesroom_bbs_mgr153}}
	  when __Levelroom_bbs_mgr153 band 64 /= 0 orelse
		 __Tracesroom_bbs_mgr153 /= [] ->
	  lager:do_log(info,
		       [{module, room_bbs_mgr}, {function, init}, {line, 153},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [room_bbs_mgr]), none, 4096,
		       64, __Levelroom_bbs_mgr153, __Tracesroom_bbs_mgr153,
		       lager_event, __Pidroom_bbs_mgr153);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidroom_bbs_mgr161, _,
	     {__Levelroom_bbs_mgr161, __Tracesroom_bbs_mgr161}}
		when __Levelroom_bbs_mgr161 band 8 /= 0 orelse
		       __Tracesroom_bbs_mgr161 /= [] ->
		lager:do_log(error,
			     [{module, room_bbs_mgr}, {function, handle_call},
			      {line, 161}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelroom_bbs_mgr161,
			     __Tracesroom_bbs_mgr161, lager_event,
			     __Pidroom_bbs_mgr161);
	    _ -> ok
	  end,
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidroom_bbs_mgr173, _,
	     {__Levelroom_bbs_mgr173, __Tracesroom_bbs_mgr173}}
		when __Levelroom_bbs_mgr173 band 8 /= 0 orelse
		       __Tracesroom_bbs_mgr173 /= [] ->
		lager:do_log(error,
			     [{module, room_bbs_mgr}, {function, handle_info},
			      {line, 173}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelroom_bbs_mgr173,
			     __Tracesroom_bbs_mgr173, lager_event,
			     __Pidroom_bbs_mgr173);
	    _ -> ok
	  end,
	  {noreply, State}
    end.

terminate(_Reason, _State = #state{next_id = NextId}) ->
    sys_env:save(room_bbs_mgr_next_id, NextId),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidroom_bbs_mgr179, _,
       {__Levelroom_bbs_mgr179, __Tracesroom_bbs_mgr179}}
	  when __Levelroom_bbs_mgr179 band 64 /= 0 orelse
		 __Tracesroom_bbs_mgr179 /= [] ->
	  lager:do_log(info,
		       [{module, room_bbs_mgr}, {function, terminate},
			{line, 179}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelroom_bbs_mgr179,
		       __Tracesroom_bbs_mgr179, lager_event,
		       __Pidroom_bbs_mgr179);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidroom_bbs_mgr191, _,
	     {__Levelroom_bbs_mgr191, __Tracesroom_bbs_mgr191}}
		when __Levelroom_bbs_mgr191 band 8 /= 0 orelse
		       __Tracesroom_bbs_mgr191 /= [] ->
		lager:do_log(error,
			     [{module, room_bbs_mgr},
			      {function, do_handle_call}, {line, 191},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelroom_bbs_mgr191,
			     __Tracesroom_bbs_mgr191, lager_event,
			     __Pidroom_bbs_mgr191);
	    _ -> ok
	  end,
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({add, BbsMsgT},
	       State = #state{next_id = BbsId}) ->
    BbsMsg = #room_bbs_message{id = RoleId, tar_id = Id} =
		 BbsMsgT#room_bbs_message{bbs_id = BbsId},
    ets:insert(room_bbs_message, BbsMsg),
    dets:insert(room_bbs_message, BbsMsg),
    case role_query:local_pid(by_id, RoleId) of
      {ok, Pid} ->
	  role:apply(async, Pid,
		     {fun (R) ->
			      case Id == RoleId of
				true ->
				    room_bbs:push_new_msg(R, BbsMsg),
				    NewR = room_bbs:calc_bbs_info(R),
				    {ok, NewR};
				_ ->
				    notice_below:send(bbs_message),
				    room_bbs:push_new_msg(R, BbsMsg),
				    role_lib:cast(by_id, Id,
						  {room_bbs, push_new_msg,
						   [BbsMsg]}),
				    {ok, R}
			      end
		      end});
      _ ->
	  role_lib:cast(by_id, Id,
			{room_bbs, push_new_msg, [BbsMsg]}),
	  skip
    end,
    NNextId = BbsId + 1,
    sys_env:save(room_bbs_mgr_next_id, NNextId),
    {noreply, State#state{next_id = NNextId}};
do_handle_info({add_back, BbsMsgT},
	       State = #state{next_id = BbsId}) ->
    BbsMsg = #room_bbs_message{id = RoleId,
			       reply_id = ReplyId, tar_id = Id, name = Name} =
		 BbsMsgT#room_bbs_message{bbs_id = BbsId},
    ets:insert(room_bbs_message, BbsMsg),
    dets:insert(room_bbs_message, BbsMsg),
    case role_query:local_pid(by_id, RoleId) of
      {ok, Pid} ->
	  role:apply(async, Pid,
		     {fun (R) ->
			      room_bbs:push_new_msg(R, BbsMsg),
			      case Id == RoleId of
				true ->
				    NewR = room_bbs:calc_bbs_info(R),
				    {ok, NewR};
				_ ->
				    role_lib:cast(by_id, Id,
						  {room_bbs, push_new_msg,
						   [BbsMsg]}),
				    notice_below:send(bbs_message_reply_self),
				    Below = #room_bbs_message_below{id = RoleId,
								    role_id =
									RoleId,
								    name = Name,
								    bbs_id =
									BbsId},
				    ets:insert(room_bbs_message_below, Below),
				    dets:insert(room_bbs_message_below, Below),
				    {ok, R}
			      end
		      end});
      _ ->
	  role_lib:cast(by_id, Id,
			{room_bbs, push_new_msg, [BbsMsg]}),
	  Below = #room_bbs_message_below{id = RoleId,
					  role_id = RoleId, name = Name,
					  bbs_id = BbsId},
	  ets:insert(room_bbs_message_below, Below),
	  dets:insert(room_bbs_message_below, Below)
    end,
    if ReplyId == RoleId -> skip;
       ReplyId == Id -> skip;
       true ->
	   cluster_lib:cast(element(2, ReplyId), room_bbs_mgr,
			    info, [{add_back2, BbsMsg}])
    end,
    NNextId = BbsId + 1,
    sys_env:save(room_bbs_mgr_next_id, NNextId),
    {noreply, State#state{next_id = NNextId}};
do_handle_info({add_back2,
		#room_bbs_message{id = RoleId = {Rid, Sid},
				  bbs_id = BbsId, name = Name,
				  reply_id = ReplyId}},
	       State) ->
    case role_query:local_pid(by_id, ReplyId) of
      {ok, Pid} ->
	  role:apply(async, Pid,
		     {fun (R) ->
			      notice_below:send(ReplyId, bbs_message_reply,
						[{1, Rid}, {2, BbsId}],
						[{1, Sid}, {2, Name}]),
			      {ok, R}
		      end});
      _ -> ok
    end,
    Below = #room_bbs_message_below{id = ReplyId,
				    role_id = RoleId, name = Name,
				    bbs_id = BbsId},
    ets:insert(room_bbs_message_below, Below),
    dets:insert(room_bbs_message_below, Below),
    {noreply, State};
do_handle_info({del_msg, RoleId}, State) ->
    ets:delete(room_bbs_message, RoleId),
    dets:delete(room_bbs_message, RoleId),
    ets:delete(room_bbs_message_below, RoleId),
    dets:delete(room_bbs_message_below, RoleId),
    ets:match_delete(room_bbs_message,
		     #room_bbs_message{tar_id = RoleId, _ = '_'}),
    dets:match_delete(room_bbs_message,
		      #room_bbs_message{tar_id = RoleId, _ = '_'}),
    {noreply, State};
do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidroom_bbs_mgr296, _,
	     {__Levelroom_bbs_mgr296, __Tracesroom_bbs_mgr296}}
		when __Levelroom_bbs_mgr296 band 8 /= 0 orelse
		       __Tracesroom_bbs_mgr296 /= [] ->
		lager:do_log(error,
			     [{module, room_bbs_mgr},
			      {function, do_handle_info}, {line, 296},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelroom_bbs_mgr296,
			     __Tracesroom_bbs_mgr296, lager_event,
			     __Pidroom_bbs_mgr296);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.


