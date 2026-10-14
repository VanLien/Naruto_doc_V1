-file("src/mod/role/role_num_online.erl", 1).

-module(role_num_online).

-lager_records([{state,
		 [platform, zone_id, channel_online]}]).

-behaviour(gen_server).

-export([start_link/0, inc_channel_online/1,
	 dec_channel_online/1, switch_channel_online/2,
	 del_channel/1]).

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

-file("src/mod/role/role_num_online.erl", 18).

-record(state,
	{platform = <<>>, zone_id, channel_online = []}).

start_link() ->
    gen_server:start_link({local, role_num_online},
			  role_num_online, [], []).

inc_channel_online(Channel) ->
    role_num_online ! {inc_channel_online, Channel}.

dec_channel_online(Channel) ->
    role_num_online ! {dec_channel_online, Channel}.

switch_channel_online(Channel, Channel) -> ok;
switch_channel_online(Channel1, Channel2) ->
    dec_channel_online(Channel1),
    inc_channel_online(Channel2).

del_channel(Channel) ->
    role_num_online ! {del_channel, Channel}.

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_num_online50, _,
       {__Levelrole_num_online50, __Tracesrole_num_online50}}
	  when __Levelrole_num_online50 band 64 /= 0 orelse
		 __Tracesrole_num_online50 /= [] ->
	  lager:do_log(info,
		       [{module, role_num_online}, {function, init},
			{line, 50}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动...", none, 4096, 64, __Levelrole_num_online50,
		       __Tracesrole_num_online50, lager_event,
		       __Pidrole_num_online50);
      _ -> ok
    end,
    {_Date, {_, Min, S}} = erlang:localtime(),
    process_flag(trap_exit, true),
    Sec = util:uint(300 - (Min * 60 + S) rem 300),
    util:set_timer(clock_save, Sec, save),
    {ok,
     #state{platform = list_to_binary(sys_env:get(platform)),
	    zone_id = sys_env:get(zone_id)}}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(save, State) ->
    util:set_timer(clock_save, 300, save),
    save(State),
    {noreply, State};
handle_info({inc_channel_online, Channel},
	    State = #state{channel_online = ChannelOnline}) ->
    Num = list_util:keyfind(Channel, ChannelOnline, 0),
    NewChannelOnline = lists:keystore(Channel, 1,
				      ChannelOnline, {Channel, Num + 1}),
    {noreply,
     State#state{channel_online = NewChannelOnline}};
handle_info({dec_channel_online, Channel},
	    State = #state{channel_online = ChannelOnline}) ->
    Num = list_util:keyfind(Channel, ChannelOnline, 0),
    NewChannelOnline = lists:keystore(Channel, 1,
				      ChannelOnline,
				      {Channel, max(0, Num - 1)}),
    {noreply,
     State#state{channel_online = NewChannelOnline}};
handle_info({del_channel, Channel},
	    State = #state{channel_online = ChannelOnline}) ->
    NewChannelOnline = lists:keydelete(Channel, 1,
				       ChannelOnline),
    {noreply,
     State#state{channel_online = NewChannelOnline}};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

save(State = #state{platform = Platform,
		    zone_id = ZoneId, channel_online = ChannelOnline}) ->
    Log = #{"product_name" => <<"sszg">>,
	    "platform_name" => Platform, "gameserver_no" => ZoneId,
	    "date_time" => log_util:date_time(),
	    "header_type" => <<"online">>},
    [log_mgr:write(Log#{"channel_name" => Channel,
			"num" => Num})
     || {Channel, Num} <- ChannelOnline, Num > 0],
    State.


