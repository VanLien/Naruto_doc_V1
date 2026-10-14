-file("src/mod/holiday_nian/holiday_nian_mgr.erl", 1).

-module(holiday_nian_mgr).

-lager_records([{player,
		 [ver, r_id, name, look_id, honor_id, face]},
		{role_monster_rank,
		 [ver, r_id, lev, face_id, avatar_bid, name, dps, power,
		  rank, unixtime]},
		{holiday_nian_item, [ver, id, base_id, num]},
		{holiday_nian_evt_data,
		 [id, type, ext, win_reward_list, main_id]},
		{holiday_nian,
		 [ver, platform_zone, camp_id, update_time, val,
		  timer_event_list, red_packet_update_time,
		  last_red_packet_num, red_packet_information,
		  timer_monster_time, timer_monster_end_unixtime,
		  timer_monster_rank, gold_monster_end_unixtime,
		  gold_monster_rank, red_packet_radio]},
		{nian_tile,
		 [ver, index, is_walk, evtid, group_id, res_id, is_born,
		  ext]},
		{m_holiday_nian,
		 [ver, camp_id, now, tile_list, update_time,
		  red_packet_update_time, timer_monster_update_time,
		  map_id, bag, bag_next_id, power, power_unixtime,
		  timer_monster_combat_time, gold_monster_combat_time,
		  collection, old_data, is_gold, face, player,
		  player_unixtime]},
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]}]).

-behaviour(gen_server).

-export([update_data/2, reload/0,
	 get_holiday_nian_val/0, get_holiday_nian_update_time/0,
	 get_holiday_nian_timer_monster/0,
	 get_holiday_nian_timer_monster_rank/0,
	 get_holiday_nian/0, get_holiday_nian_last_red_packet/0,
	 get_holiday_nian_gold_monster/0, gm_commit_tribute/1,
	 get_max_val/1, gm_operation/1, gm_reset/0,
	 gm_gold_repair/0]).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

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

-file("src/mod/holiday_nian/holiday_nian_mgr.erl", 28).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/mod/holiday_nian/holiday_nian_mgr.erl", 29).

-file("inc/holiday_nian.hrl", 1).

-record(m_holiday_nian,
	{ver = 2  :: pos_integer(),
	 camp_id = 0  :: pos_integer(),
	 now = 0  :: pos_integer(), tile_list = []  :: list(),
	 update_time = 0  :: pos_integer(),
	 red_packet_update_time = 0  :: pos_integer(),
	 timer_monster_update_time = 0  :: pos_integer(),
	 map_id = 0  :: pos_integer(), bag = []  :: list(),
	 bag_next_id = 1  :: list(), power = 0  :: pos_integer(),
	 power_unixtime = 0  :: pos_integer(),
	 timer_monster_combat_time = {0, 0}  :: pos_integer(),
	 gold_monster_combat_time = {0, 0}  :: pos_integer(),
	 collection = []  :: list(), old_data = []  :: list(),
	 is_gold = 0  :: boolean(), face = []  :: list(),
	 player = []  :: list(),
	 player_unixtime = 0  :: pos_integer()}).

-record(nian_tile,
	{ver = 1  :: pos_integer(), index = 0  :: pos_integer(),
	 is_walk = 0  :: pos_integer(),
	 evtid = 0  :: pos_integer(),
	 group_id = 0  :: pos_integer(),
	 res_id = 0  :: pos_integer(),
	 is_born = 0  :: pos_integer(), ext = []  :: list()}).

-record(holiday_nian,
	{ver = 2  :: pos_integer(),
	 platform_zone = {<<>>, 0}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 update_time = 0  :: pos_integer(),
	 val = 0  :: pos_integer(),
	 timer_event_list = []  :: list(),
	 red_packet_update_time = 0  :: pos_integer(),
	 last_red_packet_num = 0  :: pos_integer(),
	 red_packet_information = []  :: list(),
	 timer_monster_time = 0  :: pos_integer(),
	 timer_monster_end_unixtime = 0  :: pos_integer(),
	 timer_monster_rank = []  :: pos_integer(),
	 gold_monster_end_unixtime = 0  :: pos_integer(),
	 gold_monster_rank = []  :: pos_integer(),
	 red_packet_radio = 0  :: pos_integer()}).

-record(holiday_nian_evt_data,
	{id = 0  :: pos_integer(), type = 0  :: pos_integer(),
	 ext = []  :: list(), win_reward_list = []  :: list(),
	 main_id = 0  :: pos_integer()}).

-record(holiday_nian_item,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 base_id = 0  :: pos_integer(),
	 num = 0  :: pos_integer()}).

-record(role_monster_rank,
	{ver = 1  :: pos_integer(),
	 r_id = {0, <<>>}  :: tuple(), lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 power = 0  :: pos_integer(), rank = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer()}).

-record(player,
	{ver = 1  :: pos_integer(),
	 r_id = {0, <<>>}  :: tuple(), name = <<>>  :: string(),
	 look_id = 0  :: pos_integer(),
	 honor_id = 0  :: pos_integer(), face = []  :: list()}).

-file("src/mod/holiday_nian/holiday_nian_mgr.erl", 30).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_nian/holiday_nian_mgr.erl", 31).

gm_reset() ->
    ets:delete_all_objects(holiday_nian),
    dets:delete_all_objects(holiday_nian),
    info(gm_reset).

gm_commit_tribute(Num) ->
    holiday_nian_mgr:info({commit_tribute, Num}).

gm_operation(Type) ->
    case Type of
      1 -> info(update_event);
      2 -> info({gm_end_time, 1});
      3 -> info(gold_monster_update_time);
      _ -> info({gm_end_time, 2})
    end.

gm_gold_repair() -> info(gm_gold_repair).

-spec update_data(#holiday_nian{},
		  ets | dets | all) -> ok.

update_data(G, ets) when is_record(G, holiday_nian) ->
    ets:insert(holiday_nian, G);
update_data(G, dets) when is_record(G, holiday_nian) ->
    dets:insert(holiday_nian, G);
update_data(G, all) when is_record(G, holiday_nian) ->
    ets:insert(holiday_nian, G),
    dets:insert(holiday_nian, G);
update_data(_, _) -> ok.

-spec get_holiday_nian_update_time() -> tuple() | false.

get_holiday_nian_update_time() ->
    case catch ets:lookup(holiday_nian,
			  {sys_env:get(platform), sys_env:get(zone_id)})
	of
      [#holiday_nian{update_time = UpdateTime,
		     timer_event_list = TimerEventList,
		     red_packet_update_time = RedPacketUpdateTime,
		     last_red_packet_num = LastRedPacketNum,
		     timer_monster_time = TimerMonsterTime,
		     timer_monster_end_unixtime = TimerMonsterEndUnixTime,
		     gold_monster_end_unixtime = GoldMonsterEndUnixTime}] ->
	  {UpdateTime, TimerEventList, RedPacketUpdateTime,
	   LastRedPacketNum, TimerMonsterTime,
	   TimerMonsterEndUnixTime, GoldMonsterEndUnixTime};
      _ -> false
    end.

-spec
     get_holiday_nian_last_red_packet() -> {pos_integer(),
					    list()} |
					   false.

get_holiday_nian_last_red_packet() ->
    case catch ets:lookup(holiday_nian,
			  {sys_env:get(platform), sys_env:get(zone_id)})
	of
      [#holiday_nian{last_red_packet_num = LastRedPacketNum,
		     red_packet_information = RedPacketInformation}] ->
	  {LastRedPacketNum, RedPacketInformation};
      _ -> false
    end.

-spec get_holiday_nian_val() -> tuple() | false.

get_holiday_nian_val() ->
    case catch ets:lookup(holiday_nian,
			  {sys_env:get(platform), sys_env:get(zone_id)})
	of
      [#holiday_nian{val = Val,
		     red_packet_radio = RedPacketRadio}] ->
	  MaxVal = get_max_val(RedPacketRadio), {Val, MaxVal};
      _ -> false
    end.

-spec get_holiday_nian_timer_monster() -> tuple() |
					  false.

get_holiday_nian_timer_monster() ->
    case catch ets:lookup(holiday_nian,
			  {sys_env:get(platform), sys_env:get(zone_id)})
	of
      [#holiday_nian{timer_monster_time = Time,
		     timer_monster_end_unixtime = EndUnixTime}] ->
	  {Time, EndUnixTime};
      _ -> false
    end.

-spec get_holiday_nian_gold_monster() -> tuple() |
					 false.

get_holiday_nian_gold_monster() ->
    case catch ets:lookup(holiday_nian,
			  {sys_env:get(platform), sys_env:get(zone_id)})
	of
      [#holiday_nian{gold_monster_end_unixtime =
			 GoldMonsterEndUnixTime}] ->
	  GoldMonsterEndUnixTime;
      _ -> false
    end.

-spec get_holiday_nian_timer_monster_rank() -> tuple() |
					       false.

get_holiday_nian_timer_monster_rank() ->
    case catch ets:lookup(holiday_nian,
			  {sys_env:get(platform), sys_env:get(zone_id)})
	of
      [#holiday_nian{timer_monster_rank = TimerMonsterRank,
		     gold_monster_rank = GoldMonsterRank}] ->
	  {TimerMonsterRank, GoldMonsterRank};
      _ -> false
    end.

-spec get_holiday_nian() -> #holiday_nian{} | false.

get_holiday_nian() ->
    case catch ets:lookup(holiday_nian,
			  {sys_env:get(platform), sys_env:get(zone_id)})
	of
      [Holiday_nian = #holiday_nian{}] -> Holiday_nian;
      _ -> false
    end.

-spec reload() -> ok.

reload() -> info(reload), ok.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> holiday_nian_mgr ! Info.

cast(Info) -> gen_server:cast(holiday_nian_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_nian_mgr, Info,
			       10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_nian_mgr165, _,
	     {__Levelholiday_nian_mgr165,
	      __Tracesholiday_nian_mgr165}}
		when __Levelholiday_nian_mgr165 band 8 /= 0 orelse
		       __Tracesholiday_nian_mgr165 /= [] ->
		lager:do_log(error,
			     [{module, holiday_nian_mgr}, {function, call},
			      {line, 165}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_nian_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_nian_mgr165,
			     __Tracesholiday_nian_mgr165, lager_event,
			     __Pidholiday_nian_mgr165);
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
    gen_server:start_link({local, holiday_nian_mgr},
			  holiday_nian_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_nian_mgr171, _,
       {__Levelholiday_nian_mgr171,
	__Tracesholiday_nian_mgr171}}
	  when __Levelholiday_nian_mgr171 band 64 /= 0 orelse
		 __Tracesholiday_nian_mgr171 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_nian_mgr}, {function, init},
			{line, 171}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_nian_mgr]), none,
		       4096, 64, __Levelholiday_nian_mgr171,
		       __Tracesholiday_nian_mgr171, lager_event,
		       __Pidholiday_nian_mgr171);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(holiday_nian,
		   [{file, "./dets/holiday_nian.dets"},
		    {keypos, #holiday_nian.platform_zone}]),
    ets:new(holiday_nian,
	    [set, named_table, public,
	     {keypos, #holiday_nian.platform_zone}]),
    case dets:first(holiday_nian) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_nian_mgr178, _,
	     {__Levelholiday_nian_mgr178,
	      __Tracesholiday_nian_mgr178}}
		when __Levelholiday_nian_mgr178 band 64 /= 0 orelse
		       __Tracesholiday_nian_mgr178 /= [] ->
		lager:do_log(info,
			     [{module, holiday_nian_mgr}, {function, init},
			      {line, 178}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "没有数据需要加载", none, 4096, 64,
			     __Levelholiday_nian_mgr178,
			     __Tracesholiday_nian_mgr178, lager_event,
			     __Pidholiday_nian_mgr178);
	    _ -> ok
	  end,
	  [];
      _ ->
	  dets:traverse(holiday_nian,
			fun (C) ->
				case holiday_nian_ver:do_mgr(C) of
				  {false, Reason} ->
				      case {whereis(lager_event),
					    whereis(lager_event),
					    lager_config:get({lager_event,
							      loglevel},
							     {0, []})}
					  of
					{undefined, undefined, _} ->
					    fun () -> {error, lager_not_running}
					    end();
					{undefined, _, _} ->
					    fun () ->
						    {error,
						     {sink_not_configured,
						      lager_event}}
					    end();
					{__Pidholiday_nian_mgr185, _,
					 {__Levelholiday_nian_mgr185,
					  __Tracesholiday_nian_mgr185}}
					    when __Levelholiday_nian_mgr185 band
						   8
						   /= 0
						   orelse
						   __Tracesholiday_nian_mgr185
						     /= [] ->
					    lager:do_log(error,
							 [{module,
							   holiday_nian_mgr},
							  {function, init},
							  {line, 185},
							  {pid,
							   pid_to_list(self())},
							  {node, node()}
							  | lager:md()],
							 io_lib:format("年兽活动管理器数据转换失败:~w",
								       [Reason]),
							 none, 4096, 8,
							 __Levelholiday_nian_mgr185,
							 __Tracesholiday_nian_mgr185,
							 lager_event,
							 __Pidholiday_nian_mgr185);
					_ -> ok
				      end,
				      {done, false};
				  {ok, NewC} -> update_data(NewC, all), continue
				end
			end)
    end,
    State = case get_holiday_nian() of
	      HolidayNian = #holiday_nian{} -> HolidayNian;
	      _ ->
		  #holiday_nian{platform_zone =
				    {sys_env:get(platform),
				     sys_env:get(zone_id)}}
	    end,
    update_data(State, all),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_nian_mgr202, _,
       {__Levelholiday_nian_mgr202,
	__Tracesholiday_nian_mgr202}}
	  when __Levelholiday_nian_mgr202 band 64 /= 0 orelse
		 __Tracesholiday_nian_mgr202 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_nian_mgr}, {function, init},
			{line, 202}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_nian_mgr]), none,
		       4096, 64, __Levelholiday_nian_mgr202,
		       __Tracesholiday_nian_mgr202, lager_event,
		       __Pidholiday_nian_mgr202);
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
	    {__Pidholiday_nian_mgr210, _,
	     {__Levelholiday_nian_mgr210,
	      __Tracesholiday_nian_mgr210}}
		when __Levelholiday_nian_mgr210 band 8 /= 0 orelse
		       __Tracesholiday_nian_mgr210 /= [] ->
		lager:do_log(error,
			     [{module, holiday_nian_mgr},
			      {function, handle_call}, {line, 210},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_nian_mgr210,
			     __Tracesholiday_nian_mgr210, lager_event,
			     __Pidholiday_nian_mgr210);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_nian_mgr, 211, _Reason}),
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
	    {__Pidholiday_nian_mgr223, _,
	     {__Levelholiday_nian_mgr223,
	      __Tracesholiday_nian_mgr223}}
		when __Levelholiday_nian_mgr223 band 8 /= 0 orelse
		       __Tracesholiday_nian_mgr223 /= [] ->
		lager:do_log(error,
			     [{module, holiday_nian_mgr},
			      {function, handle_info}, {line, 223},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_nian_mgr223,
			     __Tracesholiday_nian_mgr223, lager_event,
			     __Pidholiday_nian_mgr223);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_nian_mgr, 224, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_nian_mgr229, _,
       {__Levelholiday_nian_mgr229,
	__Tracesholiday_nian_mgr229}}
	  when __Levelholiday_nian_mgr229 band 64 /= 0 orelse
		 __Tracesholiday_nian_mgr229 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_nian_mgr}, {function, terminate},
			{line, 229}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelholiday_nian_mgr229,
		       __Tracesholiday_nian_mgr229, lager_event,
		       __Pidholiday_nian_mgr229);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({get_red_packet, Id, Name, FaceId,
		AvatarBid, RewardList},
	       _From,
	       Nian = #holiday_nian{camp_id = CampId,
				    last_red_packet_num = LastRedPacketNum,
				    update_time = UpdateTime,
				    timer_event_list = TimerEvent,
				    red_packet_update_time =
					RedPacketUpdateTime,
				    red_packet_information =
					RedPackerInformation,
				    timer_monster_time = TimerMonsterTime,
				    timer_monster_end_unixtime =
					TimerMonsterEndUnixtime,
				    gold_monster_end_unixtime =
					GoldMonsterEndUnixTime,
				    red_packet_radio = RedPacketRadio}) ->
    {Reply, NewNian1} = case
			  holiday_lib:get_open_holiday([7010, 97010, 997010])
			    of
			  #holiday{camp_id = CampId} ->
			      case LastRedPacketNum > 0 of
				true ->
				    NewLastRedPacketNum = LastRedPacketNum - 1,
				    NewRedPackerInformation = [{Id, Name,
								FaceId,
								AvatarBid,
								RewardList,
								date:unixtime()}
							       | RedPackerInformation],
				    NewNian =
					Nian#holiday_nian{last_red_packet_num =
							      NewLastRedPacketNum,
							  red_packet_information
							      =
							      NewRedPackerInformation},
				    DisplayNum =
					holiday_nian_data:get_const(holiday_nian_red_packet_display_num),
				    PushInformation =
					lists:sublist(lists:reverse(lists:keysort(6,
										  NewRedPackerInformation)),
						      DisplayNum),
				    case NewLastRedPacketNum > 0 of
				      true -> ok;
				      _ ->
					  role_group:apply(world,
							   {holiday_nian,
							    update_event,
							    [{UpdateTime,
							      TimerEvent,
							      RedPacketUpdateTime,
							      NewLastRedPacketNum,
							      TimerMonsterTime,
							      TimerMonsterEndUnixtime,
							      GoldMonsterEndUnixTime}]})
				    end,
				    update_data(NewNian, all),
				    role_group:apply(world,
						     {holiday_nian, push,
						      [28200]}),
				    {{ok, PushInformation, NewLastRedPacketNum,
				      RedPacketRadio},
				     NewNian};
				_ ->
				    {{false, lang:get(<<"红包剩余数量不足"/utf8>>),
				      RedPackerInformation, LastRedPacketNum,
				      RedPacketRadio},
				     Nian}
			      end;
			  _ ->
			      {{false, lang:get(<<"不在活动期间内"/utf8>>),
				RedPackerInformation, LastRedPacketNum,
				RedPacketRadio},
			       Nian}
			end,
    {reply, Reply, NewNian1};
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
	    {__Pidholiday_nian_mgr276, _,
	     {__Levelholiday_nian_mgr276,
	      __Tracesholiday_nian_mgr276}}
		when __Levelholiday_nian_mgr276 band 8 /= 0 orelse
		       __Tracesholiday_nian_mgr276 /= [] ->
		lager:do_log(error,
			     [{module, holiday_nian_mgr},
			      {function, do_handle_call}, {line, 276},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_nian_mgr276,
			     __Tracesholiday_nian_mgr276, lager_event,
			     __Pidholiday_nian_mgr276);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_nian_mgr, 277, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info(reload,
	       Nain = #holiday_nian{camp_id = CampId}) ->
    NewNain1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId} ->
		     do_handle_normal_reload(Nain), Nain;
		 #holiday{camp_id = NewCampId} ->
		     UpdateTimeList =
			 holiday_nian_data:get_const(holiday_nian_update_time),
		     Now = date:unixtime(),
		     TodayNow = max(0, Now - date:unixtime({zero, Now})),
		     UpdateTime = length([1
					  || {_, UpdateUnixtime}
						 <- UpdateTimeList,
					     TodayNow >= UpdateUnixtime]),
		     role_group:apply(world,
				      {holiday_nian, update_event,
				       [{UpdateTime, [], 0, 0, 0, 0, 0}]}),
		     NextTime = get_next_update_time(),
		     case get(update_event) of
		       EventOldRef when is_reference(EventOldRef) ->
			   erlang:cancel_timer(EventOldRef);
		       _ -> skip
		     end,
		     put(update_event,
			 erlang:send_after(NextTime * 1000, self(),
					   update_event)),
		     ST =
			 holiday_nian_data:get_const(holiday_nian_gold_nian_appears),
		     GoldMonsterUpdateTime = date:parse_time(ST),
		     case get(gold_monster_update_time) of
		       GoldOldRef when is_reference(GoldOldRef) ->
			   erlang:cancel_timer(GoldOldRef);
		       _ -> skip
		     end,
		     put(gold_monster_update_time,
			 erlang:send_after(max(1, GoldMonsterUpdateTime - Now) *
					     1000,
					   self(), gold_monster_update_time)),
		     OpenSrvDay = date:open_srv_day(),
		     RedPacketRadio1 = case
					 holiday_nian_data:get_red_packet_radio(OpenSrvDay)
					   of
					 RedPacketRadio
					     when is_integer(RedPacketRadio) ->
					     RedPacketRadio;
					 _ -> 1000
				       end,
		     case get(add_val) of
		       ValOldRef when is_reference(ValOldRef) ->
			   erlang:cancel_timer(ValOldRef);
		       _ -> skip
		     end,
		     put(add_val,
			 erlang:send_after(holiday_nian_data:get_const(make_progress_check_cd)
					     * 1000,
					   self(), add_val)),
		     case {whereis(lager_event), whereis(lager_event),
			   lager_config:get({lager_event, loglevel}, {0, []})}
			 of
		       {undefined, undefined, _} ->
			   fun () -> {error, lager_not_running} end();
		       {undefined, _, _} ->
			   fun () -> {error, {sink_not_configured, lager_event}}
			   end();
		       {__Pidholiday_nian_mgr369, _,
			{__Levelholiday_nian_mgr369,
			 __Tracesholiday_nian_mgr369}}
			   when __Levelholiday_nian_mgr369 band 64 /= 0 orelse
				  __Tracesholiday_nian_mgr369 /= [] ->
			   lager:do_log(info,
					[{module, holiday_nian_mgr},
					 {function, do_handle_info},
					 {line, 369},
					 {pid, pid_to_list(self())},
					 {node, node()}
					 | lager:md()],
					io_lib:format("reload:~w ==> ~w",
						      [CampId, NewCampId]),
					none, 4096, 64,
					__Levelholiday_nian_mgr369,
					__Tracesholiday_nian_mgr369,
					lager_event, __Pidholiday_nian_mgr369);
		       _ -> ok
		     end,
		     NewNain = Nain#holiday_nian{camp_id = NewCampId,
						 platform_zone =
						     {sys_env:get(platform),
						      sys_env:get(zone_id)},
						 update_time = UpdateTime,
						 val = 0, timer_event_list = [],
						 last_red_packet_num = 0,
						 red_packet_update_time = 0,
						 red_packet_information = [],
						 timer_monster_time = 0,
						 timer_monster_end_unixtime = 0,
						 timer_monster_rank = [],
						 gold_monster_rank = [],
						 gold_monster_end_unixtime = 0,
						 red_packet_radio =
						     RedPacketRadio1},
		     NewNain;
		 _ -> Nain
	       end,
    update_data(NewNain1, all),
    {noreply, NewNain1};
do_handle_info(add_val,
	       Nian = #holiday_nian{camp_id = CampId,
				    red_packet_radio = RedPacketRadio,
				    val = Val,
				    timer_monster_end_unixtime =
					TimerMonsterEndUnixTime,
				    timer_event_list = TimerEventList}) ->
    case get(add_val) of
      ValOldRef when is_reference(ValOldRef) ->
	  erlang:cancel_timer(ValOldRef);
      _ -> skip
    end,
    NewNian1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId, start_time = StartTime} ->
		     put(add_val,
			 erlang:send_after(holiday_nian_data:get_const(make_progress_check_cd)
					     * 1000,
					   self(), add_val)),
		     case lists:member(19001, TimerEventList) of
		       true -> Nian;
		       _ ->
			   Now = date:unixtime(),
			   CdTime =
			       holiday_nian_data:get_const(make_progress_cd) *
				 3600,
			   MaxVal = get_max_val(RedPacketRadio),
			   case TimerMonsterEndUnixTime of
			     0 when Now - StartTime >= CdTime ->
				 UpdateTime = (Now - StartTime - CdTime) div
						3600,
				 GoalVal = round(UpdateTime *
						   holiday_nian_data:get_const(make_progress_value)
						   / 1000
						   * MaxVal),
				 case Val >= GoalVal of
				   true -> Nian;
				   _ ->
				       NewVal = min(MaxVal, GoalVal),
				       ValNian = Nian#holiday_nian{val =
								       NewVal},
				       NewNian = tribute_event(ValNian, Val,
							       NewVal),
				       update_data(NewNian, all),
				       role_group:apply(world,
							{holiday_nian, push,
							 [28200]}),
				       NewNian
				 end;
			     0 -> Nian;
			     _ when Now - TimerMonsterEndUnixTime >= CdTime ->
				 UpdateTime = (Now - TimerMonsterEndUnixTime -
						 CdTime)
						div 3600,
				 GoalVal = round(UpdateTime *
						   holiday_nian_data:get_const(make_progress_value)
						   / 1000
						   * MaxVal),
				 case Val >= GoalVal of
				   true -> Nian;
				   _ ->
				       NewVal = min(MaxVal, GoalVal),
				       ValNian = Nian#holiday_nian{val =
								       NewVal},
				       NewNian = tribute_event(ValNian, Val,
							       NewVal),
				       update_data(NewNian, all),
				       role_group:apply(world,
							{holiday_nian, push,
							 [28200]}),
				       NewNian
				 end;
			     _ -> Nian
			   end
		     end;
		 _ -> Nian
	       end,
    {noreply, NewNian1};
do_handle_info(update_event,
	       Nian = #holiday_nian{camp_id = CampId,
				    update_time = UpdateTime,
				    timer_event_list = TimerEvent,
				    red_packet_update_time =
					RedPacketUpdateTime,
				    last_red_packet_num = LastRedPacketNum,
				    timer_monster_time = TimerMonsterTime,
				    timer_monster_end_unixtime =
					TimerMonsterEndUnxitime,
				    gold_monster_end_unixtime =
					GoldMonsterEndUnixTime}) ->
    case get(update_event) of
      EventOldRef when is_reference(EventOldRef) ->
	  erlang:cancel_timer(EventOldRef);
      _ -> skip
    end,
    NewNian1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId} ->
		     NewUpdateTime = UpdateTime + 1,
		     role_group:apply(world,
				      {holiday_nian, update_event,
				       [{NewUpdateTime, TimerEvent,
					 RedPacketUpdateTime, LastRedPacketNum,
					 TimerMonsterTime,
					 TimerMonsterEndUnxitime,
					 GoldMonsterEndUnixTime}]}),
		     NextTime = get_next_update_time(),
		     put(update_event,
			 erlang:send_after(NextTime * 1000, self(),
					   update_event)),
		     NewNian = Nian#holiday_nian{update_time =
						     NewUpdateTime},
		     NewNian;
		 _ -> Nian
	       end,
    update_data(NewNian1, all),
    {noreply, NewNian1};
do_handle_info({commit_tribute, AddNum},
	       Nian = #holiday_nian{camp_id = CampId, val = Val,
				    red_packet_radio = RedPacketRadio}) ->
    NewNian1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId} ->
		     MaxVal = get_max_val(RedPacketRadio),
		     case Val >= MaxVal of
		       true -> Nian;
		       _ ->
			   NewVal = min(MaxVal, Val + AddNum),
			   ValNian = Nian#holiday_nian{val = NewVal},
			   NewNian = tribute_event(ValNian, Val, NewVal),
			   update_data(NewNian, all),
			   role_group:apply(world,
					    {holiday_nian, push, [28200]}),
			   NewNian
		     end;
		 _ -> Nian
	       end,
    {noreply, NewNian1};
do_handle_info(timer_monster_end_time,
	       Nain = #holiday_nian{camp_id = CampId,
				    update_time = UpdateTime,
				    timer_event_list = TimerEvent,
				    red_packet_update_time =
					RedPacketUpdateTime,
				    last_red_packet_num = LastRedPacketNum,
				    red_packet_radio = OldRedPacketRadio,
				    timer_monster_time = TimerMonsterTime,
				    timer_monster_end_unixtime =
					TimerMonsterEndUnxitime,
				    gold_monster_end_unixtime =
					GoldMonsterEndUnixTime}) ->
    case get(timer_monster_end_time) of
      OldRef when is_reference(OldRef) ->
	  erlang:cancel_timer(OldRef);
      _ -> skip
    end,
    NewNian1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId} ->
		     Now = date:unixtime(),
		     case lists:member(19001, TimerEvent) of
		       true when Now >= TimerMonsterEndUnxitime ->
			   NewRedPacketRadio = get_new_red_packet_radio(Now,
									OldRedPacketRadio),
			   NewVal = 0,
			   NewTimerEventList = lists:delete(19001, TimerEvent),
			   NewNian = Nain#holiday_nian{val = NewVal,
						       timer_event_list =
							   NewTimerEventList,
						       red_packet_radio =
							   NewRedPacketRadio},
			   update_data(NewNian, all),
			   role_group:apply(world,
					    {holiday_nian, push, [28200]}),
			   role_group:apply(world,
					    {holiday_nian, update_event,
					     [{UpdateTime, NewTimerEventList,
					       RedPacketUpdateTime,
					       LastRedPacketNum,
					       TimerMonsterTime,
					       TimerMonsterEndUnxitime,
					       GoldMonsterEndUnixTime}]}),
			   NewNian;
		       true ->
			   put(timer_monster_end_time,
			       erlang:send_after(max(1,
						     TimerMonsterEndUnxitime -
						       Now)
						   * 1000,
						 self(),
						 timer_monster_end_time)),
			   Nain;
		       _ -> Nain
		     end;
		 _ -> Nain
	       end,
    {noreply, NewNian1};
do_handle_info({timer_monster_rank, RId, RoleLev,
		FaceId, AvatarBid, Name, Power, Dps},
	       Nian = #holiday_nian{camp_id = CampId,
				    timer_event_list = TimerEvent,
				    timer_monster_rank = TimerMonsterRank,
				    timer_monster_end_unixtime =
					TimerMonsterEndUnxitime}) ->
    NewNian1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId} ->
		     Now = date:unixtime(),
		     case lists:member(19001, TimerEvent) of
		       true when Now < TimerMonsterEndUnxitime ->
			   case lists:keyfind(RId, #role_monster_rank.r_id,
					      TimerMonsterRank)
			       of
			     RoleRank = #role_monster_rank{dps = OldDps} ->
				 NewDps = OldDps + Dps,
				 NewRoleRank = RoleRank#role_monster_rank{dps =
									      NewDps,
									  unixtime
									      =
									      Now},
				 AddTimerMonsterRank = lists:keyreplace(RId,
									#role_monster_rank.r_id,
									TimerMonsterRank,
									NewRoleRank),
				 NewDpsList = rank_dps(AddTimerMonsterRank),
				 NewNian = Nian#holiday_nian{timer_monster_rank
								 = NewDpsList},
				 update_data(NewNian, all),
				 case lists:keyfind(RId,
						    #role_monster_rank.r_id,
						    NewDpsList)
				     of
				   #role_monster_rank{rank = NewRank}
				       when NewRank < 4 ->
				       role_group:apply(world,
							{holiday_nian, push,
							 [28213, {1, 0}]});
				   _ -> skip
				 end,
				 NewNian;
			     _ ->
				 RoleRank = #role_monster_rank{r_id = RId,
							       lev = RoleLev,
							       face_id = FaceId,
							       avatar_bid =
								   AvatarBid,
							       name = Name,
							       power = Power,
							       dps = Dps,
							       unixtime = Now},
				 AddTimerMonsterRank = [RoleRank
							| TimerMonsterRank],
				 NewDpsList = rank_dps(AddTimerMonsterRank),
				 NewNian = Nian#holiday_nian{timer_monster_rank
								 = NewDpsList},
				 update_data(NewNian, all),
				 case lists:keyfind(RId,
						    #role_monster_rank.r_id,
						    NewDpsList)
				     of
				   #role_monster_rank{rank = NewRank}
				       when NewRank < 4 ->
				       role_group:apply(world,
							{holiday_nian, push,
							 [28213, {1, 0}]});
				   _ -> skip
				 end,
				 NewNian
			   end;
		       _ -> Nian
		     end;
		 _ -> Nian
	       end,
    {noreply, NewNian1};
do_handle_info(gold_monster_update_time,
	       Nian = #holiday_nian{camp_id = CampId,
				    update_time = UpdateTime,
				    timer_event_list = TimerEvent,
				    red_packet_update_time =
					RedPacketUpdateTime,
				    last_red_packet_num = LastRedPacketNum,
				    timer_monster_time = TimerMonsterTime,
				    timer_monster_end_unixtime =
					TimerMonsterEndUnxitime,
				    gold_monster_end_unixtime =
					GoldMonsterEndUnixTime}) ->
    case get(gold_monster_update_time) of
      OldRef when is_reference(OldRef) ->
	  erlang:cancel_timer(OldRef);
      _ -> skip
    end,
    NewNian1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId}
		     when GoldMonsterEndUnixTime =:= 0 ->
		     case lists:member(19051, TimerEvent) of
		       true -> Nian;
		       _ when GoldMonsterEndUnixTime =:= 0 ->
			   NewTimerEvent = [19051 | TimerEvent],
			   SaveTime =
			       holiday_nian_data:get_const(holiday_nian_gold_monster_time),
			   NewGoldMonsterEndUnixTime = SaveTime +
							 date:unixtime(),
			   NewNian = Nian#holiday_nian{timer_event_list =
							   NewTimerEvent,
						       gold_monster_rank = [],
						       gold_monster_end_unixtime
							   =
							   NewGoldMonsterEndUnixTime},
			   role_group:apply(world,
					    {holiday_nian, update_event,
					     [{UpdateTime, NewTimerEvent,
					       RedPacketUpdateTime,
					       LastRedPacketNum,
					       TimerMonsterTime,
					       TimerMonsterEndUnxitime,
					       NewGoldMonsterEndUnixTime}]}),
			   case get(gold_monster_end_time) of
			     OldRef1 when is_reference(OldRef1) ->
				 erlang:cancel_timer(OldRef1);
			     _ -> skip
			   end,
			   put(gold_monster_end_time,
			       erlang:send_after(SaveTime * 1000, self(),
						 gold_monster_end_time)),
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
			     {__Pidholiday_nian_mgr606, _,
			      {__Levelholiday_nian_mgr606,
			       __Tracesholiday_nian_mgr606}}
				 when __Levelholiday_nian_mgr606 band 64 /= 0
					orelse
					__Tracesholiday_nian_mgr606 /= [] ->
				 lager:do_log(info,
					      [{module, holiday_nian_mgr},
					       {function, do_handle_info},
					       {line, 606},
					       {pid, pid_to_list(self())},
					       {node, node()}
					       | lager:md()],
					      io_lib:format("gold_monster_update_time:~w",
							    [CampId]),
					      none, 4096, 64,
					      __Levelholiday_nian_mgr606,
					      __Tracesholiday_nian_mgr606,
					      lager_event,
					      __Pidholiday_nian_mgr606);
			     _ -> ok
			   end,
			   NewNian;
		       _ -> Nian
		     end;
		 _ -> Nian
	       end,
    update_data(NewNian1, all),
    {noreply, NewNian1};
do_handle_info(gold_monster_end_time,
	       Nain = #holiday_nian{camp_id = CampId,
				    update_time = UpdateTime,
				    timer_event_list = TimerEvent,
				    red_packet_update_time =
					RedPacketUpdateTime,
				    last_red_packet_num = LastRedPacketNum,
				    timer_monster_time = TimerMonsterTime,
				    timer_monster_end_unixtime =
					TimerMonsterEndUnxitime,
				    gold_monster_end_unixtime =
					GoldMonsterEndUnixTime,
				    gold_monster_rank = GoldMonsterRank}) ->
    case get(gold_monster_end_time) of
      OldRef when is_reference(OldRef) ->
	  erlang:cancel_timer(OldRef);
      _ -> skip
    end,
    NewNian1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId} ->
		     Now = date:unixtime(),
		     case lists:member(19051, TimerEvent) of
		       true when Now >= GoldMonsterEndUnixTime ->
			   NewTimerEventList = lists:delete(19051, TimerEvent),
			   NewNian = Nain#holiday_nian{timer_event_list =
							   NewTimerEventList},
			   role_group:apply(world,
					    {holiday_nian, update_event,
					     [{UpdateTime, NewTimerEventList,
					       RedPacketUpdateTime,
					       LastRedPacketNum,
					       TimerMonsterTime,
					       TimerMonsterEndUnxitime,
					       GoldMonsterEndUnixTime}]}),
			   gold_monster_rank_count(GoldMonsterRank),
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
			     {__Pidholiday_nian_mgr636, _,
			      {__Levelholiday_nian_mgr636,
			       __Tracesholiday_nian_mgr636}}
				 when __Levelholiday_nian_mgr636 band 64 /= 0
					orelse
					__Tracesholiday_nian_mgr636 /= [] ->
				 lager:do_log(info,
					      [{module, holiday_nian_mgr},
					       {function, do_handle_info},
					       {line, 636},
					       {pid, pid_to_list(self())},
					       {node, node()}
					       | lager:md()],
					      io_lib:format("gold_monster_end_time:~w",
							    [CampId]),
					      none, 4096, 64,
					      __Levelholiday_nian_mgr636,
					      __Tracesholiday_nian_mgr636,
					      lager_event,
					      __Pidholiday_nian_mgr636);
			     _ -> ok
			   end,
			   NewNian;
		       true ->
			   put(gold_monster_end_time,
			       erlang:send_after(max(1,
						     GoldMonsterEndUnixTime -
						       Now)
						   * 1000,
						 self(),
						 gold_monster_end_time)),
			   Nain;
		       _ -> Nain
		     end;
		 _ -> Nain
	       end,
    update_data(NewNian1, all),
    {noreply, NewNian1};
do_handle_info({gold_monster_rank, RId, RoleLev, FaceId,
		AvatarBid, Name, Power, Dps},
	       Nian = #holiday_nian{camp_id = CampId,
				    timer_event_list = TimerEvent,
				    gold_monster_rank = GoldMonsterRank,
				    gold_monster_end_unixtime =
					GoldMonsterEndUnxitime}) ->
    NewNian1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId} ->
		     Now = date:unixtime(),
		     case lists:member(19051, TimerEvent) of
		       true when Now < GoldMonsterEndUnxitime ->
			   case lists:keyfind(RId, #role_monster_rank.r_id,
					      GoldMonsterRank)
			       of
			     RoleRank = #role_monster_rank{dps = OldDps} ->
				 NewDps = OldDps + Dps,
				 NewRoleRank = RoleRank#role_monster_rank{dps =
									      NewDps,
									  unixtime
									      =
									      Now},
				 AddGoldMonsterRank = lists:keyreplace(RId,
								       #role_monster_rank.r_id,
								       GoldMonsterRank,
								       NewRoleRank),
				 NewDpsList = rank_dps(AddGoldMonsterRank),
				 NewNian = Nian#holiday_nian{gold_monster_rank =
								 NewDpsList},
				 update_data(NewNian, all),
				 case lists:keyfind(RId,
						    #role_monster_rank.r_id,
						    NewDpsList)
				     of
				   #role_monster_rank{rank = NewRank}
				       when NewRank < 4 ->
				       role_group:apply(world,
							{holiday_nian, push,
							 [28213, {2, 0}]});
				   _ -> skip
				 end,
				 NewNian;
			     _ ->
				 RoleRank = #role_monster_rank{r_id = RId,
							       lev = RoleLev,
							       face_id = FaceId,
							       avatar_bid =
								   AvatarBid,
							       name = Name,
							       power = Power,
							       dps = Dps,
							       unixtime = Now},
				 AddGoldMonsterRank = [RoleRank
						       | GoldMonsterRank],
				 NewDpsList = rank_dps(AddGoldMonsterRank),
				 NewNian = Nian#holiday_nian{gold_monster_rank =
								 NewDpsList},
				 update_data(NewNian, all),
				 case lists:keyfind(RId,
						    #role_monster_rank.r_id,
						    NewDpsList)
				     of
				   #role_monster_rank{rank = NewRank}
				       when NewRank < 4 ->
				       role_group:apply(world,
							{holiday_nian, push,
							 [28213, {2, 0}]});
				   _ -> skip
				 end,
				 NewNian
			   end;
		       _ -> Nian
		     end;
		 _ -> Nian
	       end,
    {noreply, NewNian1};
do_handle_info({gold_monster_rank, RId, RoleLev, FaceId,
		AvatarBid, Name, Power, Dps, AccDps},
	       Nian = #holiday_nian{camp_id = CampId,
				    timer_event_list = TimerEvent,
				    gold_monster_rank = GoldMonsterRank,
				    gold_monster_end_unixtime =
					GoldMonsterEndUnxitime}) ->
    NewNian1 = case holiday_lib:get_open_holiday([7010,
						  97010, 997010])
		   of
		 #holiday{camp_id = CampId} ->
		     Now = date:unixtime(),
		     case lists:member(19051, TimerEvent) of
		       true when Now < GoldMonsterEndUnxitime ->
			   case lists:keyfind(RId, #role_monster_rank.r_id,
					      GoldMonsterRank)
			       of
			     RoleRank = #role_monster_rank{dps = OldDps} ->
				 NewDps = max(OldDps + Dps, AccDps),
				 NewRoleRank = RoleRank#role_monster_rank{dps =
									      NewDps,
									  unixtime
									      =
									      Now},
				 AddGoldMonsterRank = lists:keyreplace(RId,
								       #role_monster_rank.r_id,
								       GoldMonsterRank,
								       NewRoleRank),
				 NewDpsList = rank_dps(AddGoldMonsterRank),
				 NewNian = Nian#holiday_nian{gold_monster_rank =
								 NewDpsList},
				 update_data(NewNian, all),
				 case lists:keyfind(RId,
						    #role_monster_rank.r_id,
						    NewDpsList)
				     of
				   #role_monster_rank{rank = NewRank}
				       when NewRank < 4 ->
				       role_group:apply(world,
							{holiday_nian, push,
							 [28213, {2, 0}]});
				   _ -> skip
				 end,
				 NewNian;
			     _ ->
				 RoleRank = #role_monster_rank{r_id = RId,
							       lev = RoleLev,
							       face_id = FaceId,
							       avatar_bid =
								   AvatarBid,
							       name = Name,
							       power = Power,
							       dps = AccDps,
							       unixtime = Now},
				 AddGoldMonsterRank = [RoleRank
						       | GoldMonsterRank],
				 NewDpsList = rank_dps(AddGoldMonsterRank),
				 NewNian = Nian#holiday_nian{gold_monster_rank =
								 NewDpsList},
				 update_data(NewNian, all),
				 case lists:keyfind(RId,
						    #role_monster_rank.r_id,
						    NewDpsList)
				     of
				   #role_monster_rank{rank = NewRank}
				       when NewRank < 4 ->
				       role_group:apply(world,
							{holiday_nian, push,
							 [28213, {2, 0}]});
				   _ -> skip
				 end,
				 NewNian
			   end;
		       _ -> Nian
		     end;
		 _ -> Nian
	       end,
    {noreply, NewNian1};
do_handle_info({gm_end_time, Type},
	       Nain = #holiday_nian{update_time = UpdateTime,
				    timer_event_list = TimerEvent,
				    red_packet_update_time =
					RedPacketUpdateTime,
				    last_red_packet_num = LastRedPacketNum,
				    timer_monster_time = TimerMonsterTime,
				    timer_monster_end_unixtime =
					TimerMonsterEndUnxitime,
				    gold_monster_end_unixtime =
					GoldMonsterEndUnixTime,
				    gold_monster_rank = GoldMonsterRank}) ->
    NewNian1 = case Type of
		 1 ->
		     case get(timer_monster_end_time) of
		       OldRef when is_reference(OldRef) ->
			   erlang:cancel_timer(OldRef);
		       _ -> skip
		     end,
		     NewVal = 0,
		     NewTimerEventList = lists:delete(19001, TimerEvent),
		     NewNian = Nain#holiday_nian{val = NewVal,
						 timer_event_list =
						     NewTimerEventList},
		     role_group:apply(world, {holiday_nian, push, [28200]}),
		     role_group:apply(world,
				      {holiday_nian, update_event,
				       [{UpdateTime, NewTimerEventList,
					 RedPacketUpdateTime, LastRedPacketNum,
					 TimerMonsterTime,
					 TimerMonsterEndUnxitime,
					 GoldMonsterEndUnixTime}]}),
		     NewNian;
		 _ ->
		     case get(gold_monster_end_time) of
		       OldRef when is_reference(OldRef) ->
			   erlang:cancel_timer(OldRef);
		       _ -> skip
		     end,
		     NewTimerEventList = lists:delete(19051, TimerEvent),
		     NewNian = Nain#holiday_nian{timer_event_list =
						     NewTimerEventList},
		     role_group:apply(world,
				      {holiday_nian, update_event,
				       [{UpdateTime, NewTimerEventList,
					 RedPacketUpdateTime, LastRedPacketNum,
					 TimerMonsterTime,
					 TimerMonsterEndUnxitime,
					 GoldMonsterEndUnixTime}]}),
		     gold_monster_rank_count(GoldMonsterRank),
		     NewNian
	       end,
    update_data(NewNian1, all),
    {noreply, NewNian1};
do_handle_info(gm_reset, Nain) ->
    NewNian = Nain#holiday_nian{camp_id = 0,
				platform_zone =
				    {sys_env:get(platform),
				     sys_env:get(zone_id)},
				update_time = 0, val = 0, timer_event_list = [],
				last_red_packet_num = 0,
				red_packet_update_time = 0,
				red_packet_information = [],
				timer_monster_time = 0,
				timer_monster_end_unixtime = 0,
				timer_monster_rank = [], gold_monster_rank = [],
				gold_monster_end_unixtime = 0},
    update_data(NewNian, all),
    {noreply, NewNian};
do_handle_info(gm_gold_repair,
	       Nain = #holiday_nian{timer_event_list = TimerEvent,
				    gold_monster_end_unixtime = EndTime}) ->
    Now = date:unixtime(),
    case lists:member(19051, TimerEvent) of
      false when EndTime > Now ->
	  NewTimerEvent = [19051 | TimerEvent],
	  NewNain = Nain#holiday_nian{timer_event_list =
					  NewTimerEvent},
	  update_data(NewNain, all),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_nian_mgr793, _,
	     {__Levelholiday_nian_mgr793,
	      __Tracesholiday_nian_mgr793}}
		when __Levelholiday_nian_mgr793 band 64 /= 0 orelse
		       __Tracesholiday_nian_mgr793 /= [] ->
		lager:do_log(info,
			     [{module, holiday_nian_mgr},
			      {function, do_handle_info}, {line, 793},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "gm_gold_repair", none, 4096, 64,
			     __Levelholiday_nian_mgr793,
			     __Tracesholiday_nian_mgr793, lager_event,
			     __Pidholiday_nian_mgr793);
	    _ -> ok
	  end,
	  {noreply, NewNain};
      _ -> {noreply, Nain}
    end;
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
	    {__Pidholiday_nian_mgr805, _,
	     {__Levelholiday_nian_mgr805,
	      __Tracesholiday_nian_mgr805}}
		when __Levelholiday_nian_mgr805 band 8 /= 0 orelse
		       __Tracesholiday_nian_mgr805 /= [] ->
		lager:do_log(error,
			     [{module, holiday_nian_mgr},
			      {function, do_handle_info}, {line, 805},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_nian_mgr805,
			     __Tracesholiday_nian_mgr805, lager_event,
			     __Pidholiday_nian_mgr805);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_nian_mgr, 806, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

-spec get_max_val(pos_integer()) -> pos_integer().

get_max_val(RedPacketRadio) ->
    ValList = holiday_nian_data:get_all_val(),
    MaxVal = lists:max(ValList),
    RealVal = round(MaxVal * RedPacketRadio / 1000),
    RealVal.

get_next_update_time() ->
    UpdateTimeList =
	holiday_nian_data:get_const(holiday_nian_update_time),
    Now = date:unixtime(),
    TodayNow = max(0, Now - date:unixtime({zero, Now})),
    UpdateTime = [UpdateUnixtime
		  || {_, UpdateUnixtime} <- UpdateTimeList,
		     TodayNow < UpdateUnixtime],
    MinUnixTime1 = case lists:sort(UpdateTime) of
		     [MinUnixTime | _] -> MinUnixTime;
		     _ ->
			 [{_, MinUnixTime} | _] = lists:keysort(2,
								UpdateTimeList),
			 86400 + MinUnixTime
		   end,
    LastTime = max(0, MinUnixTime1 - TodayNow),
    LastTime.

tribute_event(Nain = #holiday_nian{update_time =
				       UpdateTime,
				   timer_event_list = TimerEvent0,
				   red_packet_update_time =
				       OldRedPacketUpdateTime,
				   last_red_packet_num = OldLastRedPacketNum,
				   timer_monster_time = OldTimerMonsterTime,
				   timer_monster_end_unixtime =
				       OldTimerMonsterEndUnixtime,
				   gold_monster_end_unixtime =
				       GoldMonsterEndUnixTime,
				   red_packet_radio = RedPacketRadio},
	      Val, NewVal) ->
    MaxVal = get_max_val(RedPacketRadio),
    TimerMonsterFlag = case Val < MaxVal andalso
			      NewVal >= MaxVal
			   of
			 true -> 1;
			 _ -> 0
		       end,
    RedPacketFlag = case [1
			  || {DataVal, 1} <- holiday_nian_data:get_tribute(),
			     Val < round(DataVal * RedPacketRadio / 1000),
			     NewVal >= round(DataVal * RedPacketRadio / 1000)]
			of
		      [] -> 0;
		      _ -> 1
		    end,
    TimerEvent1 = case lists:member(19051, TimerEvent0) of
		    true -> [19051];
		    _ -> []
		  end,
    case {TimerMonsterFlag, RedPacketFlag} of
      {1, 1} ->
	  TimerEvent = [19001, 10701 | TimerEvent1],
	  NewRedPacketUpdateTime = OldRedPacketUpdateTime + 1,
	  RedPacketMaxNum =
	      holiday_nian_data:get_const(holiday_nian_red_packet_max_num),
	  NewLastRedPacketNum = round(RedPacketMaxNum *
					RedPacketRadio
					/ 1000),
	  NewTimerMonsterTime = OldTimerMonsterTime + 1,
	  SaveTime =
	      holiday_nian_data:get_const(holiday_nian_timer_monster_time),
	  NewTimerMonsterEndUnixtime = SaveTime + date:unixtime(),
	  NewNian = Nain#holiday_nian{timer_event_list =
					  TimerEvent,
				      last_red_packet_num = NewLastRedPacketNum,
				      red_packet_update_time =
					  NewRedPacketUpdateTime,
				      red_packet_information = [],
				      timer_monster_time = NewTimerMonsterTime,
				      timer_monster_end_unixtime =
					  NewTimerMonsterEndUnixtime,
				      timer_monster_rank = []},
	  role_group:apply(world,
			   {holiday_nian, update_event,
			    [{UpdateTime, TimerEvent, NewRedPacketUpdateTime,
			      NewLastRedPacketNum, NewTimerMonsterTime,
			      NewTimerMonsterEndUnixtime,
			      GoldMonsterEndUnixTime}]}),
	  case get(timer_monster_end_time) of
	    OldRef when is_reference(OldRef) ->
		erlang:cancel_timer(OldRef);
	    _ -> skip
	  end,
	  put(timer_monster_end_time,
	      erlang:send_after(SaveTime * 1000, self(),
				timer_monster_end_time)),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_nian_mgr891, _,
	     {__Levelholiday_nian_mgr891,
	      __Tracesholiday_nian_mgr891}}
		when __Levelholiday_nian_mgr891 band 64 /= 0 orelse
		       __Tracesholiday_nian_mgr891 /= [] ->
		lager:do_log(info,
			     [{module, holiday_nian_mgr},
			      {function, tribute_event}, {line, 891},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("tribute_event==~w", [TimerEvent]),
			     none, 4096, 64, __Levelholiday_nian_mgr891,
			     __Tracesholiday_nian_mgr891, lager_event,
			     __Pidholiday_nian_mgr891);
	    _ -> ok
	  end,
	  NewNian;
      {1, 0} ->
	  TimerEvent = [19001 | TimerEvent1],
	  NewTimerMonsterTime = OldTimerMonsterTime + 1,
	  SaveTime =
	      holiday_nian_data:get_const(holiday_nian_timer_monster_time),
	  NewTimerMonsterEndUnixtime = SaveTime + date:unixtime(),
	  NewNian = Nain#holiday_nian{timer_event_list =
					  TimerEvent,
				      timer_monster_time = NewTimerMonsterTime,
				      timer_monster_end_unixtime =
					  NewTimerMonsterEndUnixtime,
				      timer_monster_rank = []},
	  role_group:apply(world,
			   {holiday_nian, update_event,
			    [{UpdateTime, TimerEvent, OldRedPacketUpdateTime,
			      OldLastRedPacketNum, NewTimerMonsterTime,
			      NewTimerMonsterEndUnixtime,
			      GoldMonsterEndUnixTime}]}),
	  case get(timer_monster_end_time) of
	    OldRef when is_reference(OldRef) ->
		erlang:cancel_timer(OldRef);
	    _ -> skip
	  end,
	  put(timer_monster_end_time,
	      erlang:send_after(SaveTime * 1000, self(),
				timer_monster_end_time)),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_nian_mgr908, _,
	     {__Levelholiday_nian_mgr908,
	      __Tracesholiday_nian_mgr908}}
		when __Levelholiday_nian_mgr908 band 64 /= 0 orelse
		       __Tracesholiday_nian_mgr908 /= [] ->
		lager:do_log(info,
			     [{module, holiday_nian_mgr},
			      {function, tribute_event}, {line, 908},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("tribute_event==~w", [TimerEvent]),
			     none, 4096, 64, __Levelholiday_nian_mgr908,
			     __Tracesholiday_nian_mgr908, lager_event,
			     __Pidholiday_nian_mgr908);
	    _ -> ok
	  end,
	  NewNian;
      {0, 1} ->
	  TimerEvent = [10701 | TimerEvent1],
	  NewRedPacketUpdateTime = OldRedPacketUpdateTime + 1,
	  RedPacketMaxNum =
	      holiday_nian_data:get_const(holiday_nian_red_packet_max_num),
	  NewLastRedPacketNum = round(RedPacketMaxNum *
					RedPacketRadio
					/ 1000),
	  NewNian = Nain#holiday_nian{timer_event_list =
					  TimerEvent,
				      last_red_packet_num = NewLastRedPacketNum,
				      red_packet_update_time =
					  NewRedPacketUpdateTime,
				      red_packet_information = []},
	  role_group:apply(world,
			   {holiday_nian, update_event,
			    [{UpdateTime, TimerEvent, NewRedPacketUpdateTime,
			      NewLastRedPacketNum, OldTimerMonsterTime,
			      OldTimerMonsterEndUnixtime,
			      GoldMonsterEndUnixTime}]}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_nian_mgr918, _,
	     {__Levelholiday_nian_mgr918,
	      __Tracesholiday_nian_mgr918}}
		when __Levelholiday_nian_mgr918 band 64 /= 0 orelse
		       __Tracesholiday_nian_mgr918 /= [] ->
		lager:do_log(info,
			     [{module, holiday_nian_mgr},
			      {function, tribute_event}, {line, 918},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("tribute_event==~w", [TimerEvent]),
			     none, 4096, 64, __Levelholiday_nian_mgr918,
			     __Tracesholiday_nian_mgr918, lager_event,
			     __Pidholiday_nian_mgr918);
	    _ -> ok
	  end,
	  NewNian;
      _ -> Nain
    end.

do_handle_normal_reload(#holiday_nian{timer_event_list =
					  TimerEventList,
				      timer_monster_end_unixtime =
					  TimerMonsterEndUnixTime,
				      gold_monster_end_unixtime =
					  GoldMonsterEndUnixTime}) ->
    Now = date:unixtime(),
    case get(update_event) of
      undefined ->
	  NextTime = get_next_update_time(),
	  put(update_event,
	      erlang:send_after(NextTime * 1000, self(),
				update_event));
      _ -> skip
    end,
    case lists:member(19001, TimerEventList) of
      true ->
	  case get(timer_monster_end_time) of
	    undefined ->
		TimerLastTime = max(1, TimerMonsterEndUnixTime - Now),
		put(timer_monster_end_time,
		    erlang:send_after(TimerLastTime * 1000, self(),
				      timer_monster_end_time));
	    _ -> skip
	  end;
      _ -> ok
    end,
    case lists:member(19051, TimerEventList) of
      true ->
	  case get(gold_monster_end_time) of
	    undefined ->
		GoldLastTime = max(1, GoldMonsterEndUnixTime - Now),
		put(gold_monster_end_time,
		    erlang:send_after(GoldLastTime * 1000, self(),
				      gold_monster_end_time));
	    _ -> skip
	  end;
      _ when GoldMonsterEndUnixTime =:= 0 ->
	  case get(gold_monster_update_time) of
	    undefined ->
		ST =
		    holiday_nian_data:get_const(holiday_nian_gold_nian_appears),
		GoldMonsterUpdateTime = date:parse_time(ST),
		put(gold_monster_update_time,
		    erlang:send_after(max(1, GoldMonsterUpdateTime - Now) *
					1000,
				      self(), gold_monster_update_time));
	    _ -> skip
	  end;
      _ -> skip
    end,
    case get(add_val) of
      undefined ->
	  put(add_val,
	      erlang:send_after(holiday_nian_data:get_const(make_progress_check_cd)
				  * 1000,
				self(), add_val));
      _ -> skip
    end.

rank_dps(DpsList) ->
    DpsList1 = util:keys_sort([{asc,
				#role_monster_rank.unixtime},
			       #role_monster_rank.dps],
			      DpsList),
    NewDpsList = do_rank_dps(DpsList1, 1, []),
    NewDpsList.

do_rank_dps([], _, DpsList) -> DpsList;
do_rank_dps([RoleRank = #role_monster_rank{} | Rest],
	    Rank, DpsList) ->
    do_rank_dps(Rest, Rank + 1,
		[RoleRank#role_monster_rank{rank = Rank} | DpsList]);
do_rank_dps(_, _, DpsList) -> DpsList.

gold_monster_rank_count([]) -> ok;
gold_monster_rank_count([#role_monster_rank{rank = Rank,
					    r_id = Id}
			 | Rest]) ->
    case
      holiday_nian_data:get_gold_monster_rank_reward(Rank)
	of
      RewardList when is_list(RewardList) ->
	  mail:send(Id,
		    {lang:get(<<"金色年兽排名奖励"/utf8>>),
		     color:msg(lang:get(<<"尊敬的冒险者，您在金色年兽伤害排行榜中获得第~ts名的名次，获得下列的排名奖励！请再接再厉"
					  "！ヾ（≧∇≦）〃"/utf8>>),
			       [{green, Rank}]),
		     items, RewardList, <<"年兽活动"/utf8>>});
      _ -> skip
    end,
    gold_monster_rank_count(Rest);
gold_monster_rank_count(_) -> ok.

get_new_red_packet_radio(Now, OldRedPacketRadio) ->
    StartTime = date:unixtime({zero, Now - 86400}),
    EndTime = date:unixtime({zero, Now}),
    case
      db:get_one("select count(*) from role where (logout_time "
		 ">= ? and logout_time <= ?) or (login_time "
		 ">= ? and login_time <= ?) and lev >= "
		 "?",
		 [StartTime, EndTime, StartTime, EndTime, 40], 60000)
	of
      {ok, Num} ->
	  case holiday_nian_data:get_red_packet_radio2(Num) of
	    NewRedPacketRadio when is_integer(NewRedPacketRadio) ->
		NewRedPacketRadio;
	    _ -> OldRedPacketRadio
	  end;
      _ -> OldRedPacketRadio
    end.


