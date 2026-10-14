-file("src/mod/notice/notice_mgr.erl", 1).

-module(notice_mgr).

-lager_records([{notice,
		 [id, position, sort, start_time, end_time,
		  time_interval, content, extra, channel]},
		{state, [notice_list]}]).

-behaviour(gen_server).

-export([start_link/0, info/1, stop/0, init/1,
	 handle_call/3, handle_cast/2, handle_info/2,
	 terminate/2, code_change/3]).

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

-file("src/mod/notice/notice_mgr.erl", 9).

-record(state, {notice_list = []}).

-record(notice,
	{id = 0, position = 0, sort = 0, start_time = 0,
	 end_time = 0, time_interval = 0, content = <<>>,
	 extra = <<>>, channel = <<>>}).

info(Msg) -> notice_mgr ! Msg.

start_link() ->
    gen_server:start_link({local, notice_mgr}, notice_mgr,
			  [], []).

stop() -> ok.

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidnotice_mgr36, _,
       {__Levelnotice_mgr36, __Tracesnotice_mgr36}}
	  when __Levelnotice_mgr36 band 64 /= 0 orelse
		 __Tracesnotice_mgr36 /= [] ->
	  lager:do_log(info,
		       [{module, notice_mgr}, {function, init}, {line, 36},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动...", none, 4096, 64, __Levelnotice_mgr36,
		       __Tracesnotice_mgr36, lager_event, __Pidnotice_mgr36);
      _ -> ok
    end,
    util:set_timer({notice_mgr, load}, 2, notice_mgr,
		   load_notice),
    {ok, undefined}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(load_notice, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidnotice_mgr48, _,
       {__Levelnotice_mgr48, __Tracesnotice_mgr48}}
	  when __Levelnotice_mgr48 band 128 /= 0 orelse
		 __Tracesnotice_mgr48 /= [] ->
	  lager:do_log(debug,
		       [{module, notice_mgr}, {function, handle_info},
			{line, 48}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "测试 load_notice", none, 4096, 128, __Levelnotice_mgr48,
		       __Tracesnotice_mgr48, lager_event, __Pidnotice_mgr48);
      _ -> ok
    end,
    util:unset_all_timer(),
    State2 = load(),
    {noreply, State2};
handle_info({notice, Id},
	    State = #state{notice_list = NoticeList}) ->
    case lists:keyfind(Id, #notice.id, NoticeList) of
      false -> ignore;
      Notice = #notice{start_time = StartTime,
		       end_time = EndTime, time_interval = TimeInterval} ->
	  Now = date:unixtime(),
	  if Now > EndTime + TimeInterval -> ignore;
	     Now < StartTime ->
		 util:set_timer({notice_mgr, notice, Id}, StartTime,
				{notice, Id});
	     true ->
		 do_notice(Notice),
		 util:set_timer({notice_mgr, notice, Id}, TimeInterval,
				{notice, Id})
	  end
    end,
    {noreply, State};
handle_info({delay_notice, Time, Data}, State) ->
    erlang:send_after(Time, self(), {delay_notice, Data}),
    {noreply, State};
handle_info({delay_notice, Data}, State) ->
    role_group:pack_send(world, 12761, Data),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(normal, _State) -> util:unset_all_timer(), ok;
terminate(Reason, _State) ->
    util:unset_all_timer(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidnotice_mgr88, _,
       {__Levelnotice_mgr88, __Tracesnotice_mgr88}}
	  when __Levelnotice_mgr88 band 8 /= 0 orelse
		 __Tracesnotice_mgr88 /= [] ->
	  lager:do_log(error,
		       [{module, notice_mgr}, {function, terminate},
			{line, 88}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w", [Reason]), none, 4096, 8,
		       __Levelnotice_mgr88, __Tracesnotice_mgr88, lager_event,
		       __Pidnotice_mgr88);
      _ -> ok
    end.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load() ->
    L = load_db(),
    Now = date:unixtime(),
    check_notice(L, 0, Now),
    #state{notice_list = L}.

load_db() ->
    Sql = "SELECT `id`,`position`,`sort`,`st`,`et`,`time"
	  "_interval`,`content`,`extra`,`channel` "
	  "FROM `mod_notice` WHERE (`is_play`=1) "
	  "AND (`et` > ?)",
    Now = date:unixtime(),
    L = case db:get_all(Sql, [Now]) of
	  {ok, Data} -> Data;
	  _ -> []
	end,
    NoticeList = [#notice{id = Id, position = Position,
			  sort = Sort, start_time = St, end_time = Et,
			  time_interval = max(20, TimeInterval),
			  content = Content, extra = Extra,
			  channel = parse_channel(Channel)}
		  || [Id, Position, Sort, St, Et, TimeInterval, Content,
		      Extra, Channel]
			 <- L],
    case NoticeList =:= [] of
      true -> [];
      false -> list_util:keysort(#notice.sort, NoticeList)
    end.

parse_channel(S) ->
    case catch util:string_to_term(S) of
      {ok, L = [I | _]} when is_binary(I) -> L;
      _ -> all
    end.

check_notice([], _I, _Now) -> ok;
check_notice([#notice{id = Id, start_time = StartTime,
		      end_time = EndTime}
	      | L],
	     I, Now) ->
    if Now > EndTime + I * 5 -> check_notice(L, I, Now);
       Now < StartTime ->
	   util:set_timer({notice_mgr, notice, Id},
			  StartTime - Now + I * 5, {notice, Id}),
	   check_notice(L, I + 1, Now);
       true ->
	   util:set_timer({notice_mgr, notice, Id}, I * 5,
			  {notice, Id}),
	   check_notice(L, I + 1, Now)
    end.

do_notice(#notice{position = Position,
		  content = Content, channel = Channel}) ->
    case Position of
      1 -> do_broadcast(Channel, null, sys_top, Content);
      2 -> do_broadcast(Channel, null, sys, Content);
      _ -> ignore
    end.

do_broadcast(Channels, RangeArg, BroadcastType, Msg)
    when is_list(Channels) ->
    notice:broadcast({channel, Channels}, RangeArg,
		     BroadcastType, Msg);
do_broadcast(_, RangeArg, BroadcastType, Msg) ->
    notice:broadcast(world, RangeArg, BroadcastType, Msg).


