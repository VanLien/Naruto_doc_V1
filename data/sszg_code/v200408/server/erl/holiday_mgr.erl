-file("src/mod/holiday/holiday_mgr.erl", 1).

-module(holiday_mgr).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{condition, [label, op, val, msg]},
		{activity, [id, status, name, data, ext_args]},
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
		  open_day, merge_day, is_show, type]},
		{holiday_state, [db_total, data_total]}]).

-behaviour(gen_server).

-export([get_holiday_sec/0, get_holiday_hour/0,
	 get_holiday_real_open_time/1, set_holiday_hour/1,
	 reload/0, check_start/0, notify/1,
	 get_holiday_total_end_ms/1, zero/0, apply/1,
	 check_expire/0, holiday_accumulate_set/0]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([merge_do_rank_award/1]).

-export([merge_do_calc_holiday/1]).

-export([has_holiday/0]).

-record(holiday_state,
	{db_total = undefined, data_total = []}).

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

-file("src/mod/holiday/holiday_mgr.erl", 33).

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

-file("src/mod/holiday/holiday_mgr.erl", 34).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday/holiday_mgr.erl", 35).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/holiday/holiday_mgr.erl", 36).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/holiday/holiday_mgr.erl", 37).

-spec has_holiday() -> ok.

has_holiday() ->
    P = sys_env:get(platform),
    Z = sys_env:get(zone_id),
    case holiday_lib:get_open_holiday([7009, 97009, 997009])
	of
      #holiday{camp_id = CampId} ->
	  io:format("~ts",
		    [io_lib:format("平台:~ts   区号:~w 活动id:~w",
				   [P, Z, CampId])]);
      _ -> ok
    end.

-spec merge_do_calc_holiday(map()) -> ok.

merge_do_calc_holiday(_Args) ->
    AllHolidays1 = ets:tab2list(holiday),
    Fun = fun (Holiday = #holiday{camp_id = CampId},
	       {AllT, ExpireT}) ->
		  case is_merge_open(Holiday) of
		    true -> {[CampId | AllT], ExpireT};
		    _ -> {AllT, [CampId | ExpireT]}
		  end
	  end,
    {AllHolidays, ExpireHolidays} = lists:foldl(Fun,
						{[], []}, AllHolidays1),
    SrvIds = sys_lib:srv_full_id(),
    SrvHolidays = [{SrvId, AllHolidays, ExpireHolidays}
		   || SrvId <- SrvIds],
    dets:insert(holiday_merge_holiday, SrvHolidays).

is_merge_open(#holiday{tbid = Tbid, end_time = EndTime})
    when Tbid >= 7000 andalso Tbid =< 7005 orelse
	   Tbid =:= 7009 ->
    Now = date:unixtime(), EndTime - 86400 > Now;
is_merge_open(Holiday) -> holiday_lib:is_open(Holiday).

-spec merge_do_rank_award(map()) -> ok.

merge_do_rank_award(_Args) ->
    AllHolidays1 = ets:tab2list(holiday),
    AllHolidays = [Holiday
		   || Holiday = #holiday{} <- AllHolidays1,
		      holiday_lib:is_open(Holiday)],
    RankHolidays = [H
		    || H = #holiday{tbid = Tbid} <- AllHolidays,
		       Tbid >= 7000 andalso Tbid =< 7005 orelse Tbid =:= 7009],
    do_merge_do_rank_award(RankHolidays).

do_merge_do_rank_award([]) -> ok;
do_merge_do_rank_award([Holiday | Others]) ->
    holiday_rule_rank:merge_apply_reward(Holiday),
    do_merge_do_rank_award(Others).

holiday_accumulate_set() ->
    case holiday_lib:get_open_holiday([1021, 91021, 991021])
	of
      #holiday{camp_id = CampId, bid = Bid, reward = Award} ->
	  OPenSrvDay = date:open_srv_day() - 1,
	  Period = OPenSrvDay div 15 + 1,
	  sys_env:save(holiday_accumulate_info,
		       {CampId, Bid, Period, Award, OPenSrvDay}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr90, _,
	     {__Levelholiday_mgr90, __Tracesholiday_mgr90}}
		when __Levelholiday_mgr90 band 128 /= 0 orelse
		       __Tracesholiday_mgr90 /= [] ->
		lager:do_log(debug,
			     [{module, holiday_mgr},
			      {function, holiday_accumulate_set}, {line, 90},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("积天豪礼:~w",
					   [sys_env:get(holiday_accumulate_info)]),
			     none, 4096, 128, __Levelholiday_mgr90,
			     __Tracesholiday_mgr90, lager_event,
			     __Pidholiday_mgr90);
	    _ -> ok
	  end,
	  ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr93, _,
	     {__Levelholiday_mgr93, __Tracesholiday_mgr93}}
		when __Levelholiday_mgr93 band 8 /= 0 orelse
		       __Tracesholiday_mgr93 /= [] ->
		lager:do_log(error,
			     [{module, holiday_mgr},
			      {function, holiday_accumulate_set}, {line, 93},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("严重问题:积天豪礼执行脚本时没有旧数据", []), none,
			     4096, 8, __Levelholiday_mgr93,
			     __Tracesholiday_mgr93, lager_event,
			     __Pidholiday_mgr93);
	    _ -> ok
	  end,
	  {false, lang:get(<<"严重问题:积天豪礼执行脚本时没有旧数据"/utf8>>)}
    end.

-spec
     get_holiday_real_open_time(pos_integer()) -> non_neg_integer() |
						  false.

get_holiday_real_open_time(CampId) ->
    case ets:lookup(holiday_real_open_time, CampId) of
      [{CampId, OpenTime} | _] -> OpenTime;
      _ -> false
    end.

-spec get_holiday_sec() -> non_neg_integer().

get_holiday_sec() -> 3600 * get_holiday_hour().

-spec get_holiday_hour() -> non_neg_integer().

get_holiday_hour() -> sys_env:get(holiday_hour, 0).

-spec set_holiday_hour(non_neg_integer()) -> ok.

set_holiday_hour(Hour) when is_integer(Hour) ->
    sys_env:set(holiday_hour, Hour).

-spec
     get_holiday_total_end_ms(pos_integer()) -> pos_integer().

get_holiday_total_end_ms(3) ->
    case get(holiday_role_cache) of
      [#holiday_total{end_time = EndTime} | _] -> EndTime;
      _ -> date:unixtime() + 86400 * 30
    end;
get_holiday_total_end_ms(Type) ->
    case call({get_total_end_time, Type}) of
      {ok, EndTime} -> EndTime;
      _ -> date:unixtime() + 86400 * 15
    end.

notify(Clock) ->
    role_group:pack_send(world, 16607, {Clock}), ok.

-spec check_start() -> ok.

check_start() ->
    holiday_mgr ! {check, next_load},
    holiday_mgr ! {check_ico, db_total},
    holiday_mgr ! {check_ico, data_total, 104, 21},
    holiday_mgr ! {check_ico, [3001, 93001, 993001]},
    holiday_mgr ! {check_ico, [3006, 93006, 993006]},
    holiday_mgr ! {check_ico, [1009, 91009, 991009]},
    holiday_mgr ! {check_ico, [1011], 909},
    holiday_groupon:check_status(),
    holiday_dial_mgr:check(),
    holiday_term_begins_mgr:check_status(),
    holiday_petard_mgr ! {check},
    holiday_merge_goal_mgr:info(check_status),
    holiday_valentines_mgr:info(check_status),
    monopoly_dungeons:reload(),
    holiday_nian_mgr:reload(),
    holiday_practise_tower_mgr:info(check_status),
    ok.

-spec apply(tuple()) -> ok.

apply(Mfa) -> info({apply, Mfa}).

-spec reload() -> ok.

reload() -> holiday_mgr ! reload.

zero() -> holiday_mgr ! zero.

info(Info) -> holiday_mgr ! Info.

cast(Info) -> gen_server:cast(holiday_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr182, _,
	     {__Levelholiday_mgr182, __Tracesholiday_mgr182}}
		when __Levelholiday_mgr182 band 8 /= 0 orelse
		       __Tracesholiday_mgr182 /= [] ->
		lager:do_log(error,
			     [{module, holiday_mgr}, {function, call},
			      {line, 182}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_mgr182,
			     __Tracesholiday_mgr182, lager_event,
			     __Pidholiday_mgr182);
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
    gen_server:start_link({local, holiday_mgr}, holiday_mgr,
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
      {__Pidholiday_mgr189, _,
       {__Levelholiday_mgr189, __Tracesholiday_mgr189}}
	  when __Levelholiday_mgr189 band 64 /= 0 orelse
		 __Tracesholiday_mgr189 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_mgr}, {function, init}, {line, 189},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_mgr]), none,
		       4096, 64, __Levelholiday_mgr189, __Tracesholiday_mgr189,
		       lager_event, __Pidholiday_mgr189);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(holiday_data,
			"dets/holiday_data.dets", 1, set),
    d_ets_lib:load_dets_to_ets(holiday_data, undefined),
    ets:new(holiday,
	    [set, named_table, public, {keypos, #holiday.bid}]),
    ExpireTab = holiday_expire,
    {ok, ExpireTab} = dets:open_file(ExpireTab,
				     [{file, "dets/holiday_expire.dets"},
				      {keypos, 1}]),
    ExpireTab = ets:new(ExpireTab,
			[set, named_table, public, {keypos, 1}]),
    init_expire(),
    d_ets_lib:new_d_ets(holiday_real_open_time,
			"dets/holiday_real_open_time.dets", 1, set),
    d_ets_lib:load_dets_to_ets(holiday_real_open_time,
			       undefined),
    d_ets_lib:new_d_ets(holiday_merge_holiday,
			"dets/holiday_merge_holiday.dets", 1, set),
    d_ets_lib:load_dets_to_ets(holiday_merge_holiday,
			       undefined),
    State = case game_lib:is_ios_verify() of
	      true -> #holiday_state{};
	      _ -> load(#holiday_state{})
	    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_mgr211, _,
       {__Levelholiday_mgr211, __Tracesholiday_mgr211}}
	  when __Levelholiday_mgr211 band 64 /= 0 orelse
		 __Tracesholiday_mgr211 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_mgr}, {function, init}, {line, 211},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_mgr]), none, 4096,
		       64, __Levelholiday_mgr211, __Tracesholiday_mgr211,
		       lager_event, __Pidholiday_mgr211);
      _ -> ok
    end,
    {ok, State}.

handle_call({get_total_end_time, 0}, _From,
	    State = #holiday_state{db_total =
				       #holiday_total{end_time = EndTime}}) ->
    {reply, {ok, EndTime}, State};
handle_call({get_total_end_time, 1}, _From,
	    State = #holiday_state{data_total = L}) ->
    case lists:keyfind(103, #holiday_total.id, L) of
      #holiday_total{end_time = EndTime} ->
	  {reply, {ok, EndTime}, State};
      _ -> {reply, {ok, 0}, State}
    end;
handle_call({get_total_end_time, 2}, _From,
	    State = #holiday_state{data_total = L}) ->
    case lists:keyfind(104, #holiday_total.id, L) of
      #holiday_total{end_time = EndTime} ->
	  {reply, {ok, EndTime}, State};
      _ -> {reply, {ok, 0}, State}
    end;
handle_call({get_total_end_time, _Type}, _From,
	    State) ->
    {reply, {ok, 0}, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(zero, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_mgr241, _,
       {__Levelholiday_mgr241, __Tracesholiday_mgr241}}
	  when __Levelholiday_mgr241 band 64 /= 0 orelse
		 __Tracesholiday_mgr241 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_mgr}, {function, handle_info},
			{line, 241}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "活动0点更新", none, 4096, 64, __Levelholiday_mgr241,
		       __Tracesholiday_mgr241, lager_event,
		       __Pidholiday_mgr241);
      _ -> ok
    end,
    NewState = load(State),
    holiday_groupon:exchange_clean_buy(day),
    holiday_lucky_dog_mgr:info(zero),
    case cluster_lib:is_normal_srv() of
      true -> holiday_role:zero_flush(all), notify(0), ok;
      _ -> ok
    end,
    {noreply, NewState};
handle_info(reload, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_mgr256, _,
       {__Levelholiday_mgr256, __Tracesholiday_mgr256}}
	  when __Levelholiday_mgr256 band 64 /= 0 orelse
		 __Tracesholiday_mgr256 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_mgr}, {function, handle_info},
			{line, 256}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "活动重新加载", none, 4096, 64, __Levelholiday_mgr256,
		       __Tracesholiday_mgr256, lager_event,
		       __Pidholiday_mgr256);
      _ -> ok
    end,
    NewState = load(State),
    case cluster_lib:is_normal_srv() of
      true -> holiday_role:reload(all), notify(0), ok;
      _ -> ok
    end,
    {noreply, NewState};
handle_info({check, next_load},
	    State = #holiday_state{db_total =
				       #holiday_total{end_time = EndTime}}) ->
    Now = date:unixtime(),
    AfterSec = max(0, EndTime - Now),
    case Now < EndTime andalso AfterSec < 86400 * 3 of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr273, _,
	     {__Levelholiday_mgr273, __Tracesholiday_mgr273}}
		when __Levelholiday_mgr273 band 64 /= 0 orelse
		       __Tracesholiday_mgr273 /= [] ->
		lager:do_log(info,
			     [{module, holiday_mgr}, {function, handle_info},
			      {line, 273}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~w秒后，检测节日活动", [AfterSec]), none,
			     4096, 64, __Levelholiday_mgr273,
			     __Tracesholiday_mgr273, lager_event,
			     __Pidholiday_mgr273);
	    _ -> ok
	  end,
	  util:set_timer({check, next_reload}, AfterSec + 10,
			 reload);
      false -> ignore
    end,
    {noreply, State};
handle_info({check_ico, db_total},
	    State = #holiday_state{db_total = HolidayTotal}) ->
    ActHolidayAll = 0,
    case HolidayTotal of
      #holiday_total{start_time = StartTime,
		     end_time = EndTime, is_show = IsShow,
		     open_day = OpenDay, id = Id, name = Name,
		     icon_id = IconId}
	  when ActHolidayAll > 0 ->
	  CurOpenDay = game_lib:server_open_time(day),
	  case CurOpenDay > OpenDay of
	    true ->
		Now = date:unixtime(),
		if IsShow =/= 1 ->
		       activity_global:set_activity(ActHolidayAll, 0, [0]);
		   Now >= EndTime ->
		       holiday_rule_rank:clear_rank(db),
		       activity_global:set_activity(ActHolidayAll, 0, [0]);
		   Now < StartTime ->
		       AfterSec = min(StartTime - Now, 86400 * 20),
		       util:set_timer({check_ico, db_total}, AfterSec + 1,
				      {check_ico, db_total}),
		       case {whereis(lager_event), whereis(lager_event),
			     lager_config:get({lager_event, loglevel}, {0, []})}
			   of
			 {undefined, undefined, _} ->
			     fun () -> {error, lager_not_running} end();
			 {undefined, _, _} ->
			     fun () ->
				     {error, {sink_not_configured, lager_event}}
			     end();
			 {__Pidholiday_mgr299, _,
			  {__Levelholiday_mgr299, __Tracesholiday_mgr299}}
			     when __Levelholiday_mgr299 band 64 /= 0 orelse
				    __Tracesholiday_mgr299 /= [] ->
			     lager:do_log(info,
					  [{module, holiday_mgr},
					   {function, handle_info}, {line, 299},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("总活动[~w:~w:~ts]距离开始时间:~w",
							[Id, IconId, Name,
							 AfterSec]),
					  none, 4096, 64, __Levelholiday_mgr299,
					  __Tracesholiday_mgr299, lager_event,
					  __Pidholiday_mgr299);
			 _ -> ok
		       end,
		       activity_global:set_activity(ActHolidayAll, 0, [0]);
		   true ->
		       AfterSec = min(EndTime - Now, 86400 * 20),
		       case {whereis(lager_event), whereis(lager_event),
			     lager_config:get({lager_event, loglevel}, {0, []})}
			   of
			 {undefined, undefined, _} ->
			     fun () -> {error, lager_not_running} end();
			 {undefined, _, _} ->
			     fun () ->
				     {error, {sink_not_configured, lager_event}}
			     end();
			 {__Pidholiday_mgr304, _,
			  {__Levelholiday_mgr304, __Tracesholiday_mgr304}}
			     when __Levelholiday_mgr304 band 64 /= 0 orelse
				    __Tracesholiday_mgr304 /= [] ->
			     lager:do_log(info,
					  [{module, holiday_mgr},
					   {function, handle_info}, {line, 304},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("总活动[~w:~w:~ts]距离结束时间:~w",
							[Id, IconId, Name,
							 AfterSec]),
					  none, 4096, 64, __Levelholiday_mgr304,
					  __Tracesholiday_mgr304, lager_event,
					  __Pidholiday_mgr304);
			 _ -> ok
		       end,
		       util:set_timer({check_ico, db_total}, AfterSec + 1,
				      {check_ico, db_total}),
		       activity_global:set_activity(ActHolidayAll, 1,
						    [EndTime, IconId])
		end;
	    false ->
		activity_global:set_activity(ActHolidayAll, 0, [0])
	  end;
      _ -> activity_global:set_activity(ActHolidayAll, 0, [0])
    end,
    activity_global:broadcast_activity(ActHolidayAll,
				       world),
    {noreply, State};
handle_info({check_ico, data_total, Id, Icon},
	    State = #holiday_state{data_total = L}) ->
    case lists:keyfind(Id, #holiday_total.id, L) of
      #holiday_total{start_time = StartTime, name = Name,
		     end_time = EndTime, is_show = 1, type = Type} ->
	  Now = date:unixtime(),
	  if Now >= EndTime ->
		 holiday_rule_rank:clear_rank(data),
		 activity_global:set_activity(Icon, 0, [0]);
	     Now < StartTime ->
		 AfterSec = min(StartTime - Now, 86400 * 20),
		 util:set_timer({check_ico, data_total, Icon},
				AfterSec + 1,
				{check_ico, data_total, Id, Icon}),
		 case {whereis(lager_event), whereis(lager_event),
		       lager_config:get({lager_event, loglevel}, {0, []})}
		     of
		   {undefined, undefined, _} ->
		       fun () -> {error, lager_not_running} end();
		   {undefined, _, _} ->
		       fun () -> {error, {sink_not_configured, lager_event}}
		       end();
		   {__Pidholiday_mgr332, _,
		    {__Levelholiday_mgr332, __Tracesholiday_mgr332}}
		       when __Levelholiday_mgr332 band 64 /= 0 orelse
			      __Tracesholiday_mgr332 /= [] ->
		       lager:do_log(info,
				    [{module, holiday_mgr},
				     {function, handle_info}, {line, 332},
				     {pid, pid_to_list(self())}, {node, node()}
				     | lager:md()],
				    io_lib:format("活动[~w:~ts]图标[~w:~w]距离开始时间:~w",
						  [Id, Name, Icon, Type,
						   AfterSec]),
				    none, 4096, 64, __Levelholiday_mgr332,
				    __Tracesholiday_mgr332, lager_event,
				    __Pidholiday_mgr332);
		   _ -> ok
		 end,
		 activity_global:set_activity(Icon, 0, [0]);
	     true ->
		 AfterSec = min(EndTime - Now, 86400 * 20),
		 util:set_timer({check_ico, data_total, Icon},
				AfterSec + 1,
				{check_ico, data_total, Id, Icon}),
		 case {whereis(lager_event), whereis(lager_event),
		       lager_config:get({lager_event, loglevel}, {0, []})}
		     of
		   {undefined, undefined, _} ->
		       fun () -> {error, lager_not_running} end();
		   {undefined, _, _} ->
		       fun () -> {error, {sink_not_configured, lager_event}}
		       end();
		   {__Pidholiday_mgr338, _,
		    {__Levelholiday_mgr338, __Tracesholiday_mgr338}}
		       when __Levelholiday_mgr338 band 64 /= 0 orelse
			      __Tracesholiday_mgr338 /= [] ->
		       lager:do_log(info,
				    [{module, holiday_mgr},
				     {function, handle_info}, {line, 338},
				     {pid, pid_to_list(self())}, {node, node()}
				     | lager:md()],
				    io_lib:format("活动[~w:~ts]图标[~w:~w]距离结束时间:~w",
						  [Id, Name, Icon, Type,
						   AfterSec]),
				    none, 4096, 64, __Levelholiday_mgr338,
				    __Tracesholiday_mgr338, lager_event,
				    __Pidholiday_mgr338);
		   _ -> ok
		 end,
		 case Type of
		   1 -> activity_global:set_activity(Icon, 0, [0]);
		   2 ->
		       activity_global:set_activity(0, 0, [0]),
		       case holiday_lib:list_type_holiday(Type) of
			 [] -> activity_global:set_activity(Icon, 0, [0]);
			 _ -> activity_global:set_activity(Icon, 1, [])
		       end;
		   _ -> ignore
		 end
	  end;
      _ -> activity_global:set_activity(Icon, 0, [0])
    end,
    activity_global:broadcast_activity(Icon, world),
    {noreply, State};
handle_info({check_ico, Bids = [Bid | _]}, State) ->
    AGId = holiday_ico:get_ico(Bid),
    self() ! {check_ico, Bids, AGId},
    {noreply, State};
handle_info({check_ico, Bids = [Bid | _], AGId}, State)
    when AGId > 0 ->
    {IsNeedClose, NewAGId} = case
			       holiday_lib:get_holiday(Bids)
				 of
			       #holiday{camp_id = CampId,
					start_time = StartTime,
					end_time = EndTime} ->
				   Now = date:unixtime(),
				   MainIco = holiday_lib:get_main_ico(CampId),
				   NAGid = util:if_true(MainIco =:= 0, AGId,
							MainIco),
				   if Now >= EndTime -> {true, NAGid};
				      Now < StartTime ->
					  AfterSec = min(StartTime - Now,
							 86400 * 20),
					  util:set_timer({check_ico, Bid},
							 AfterSec + 1,
							 {check_ico, Bids}),
					  case {whereis(lager_event),
						whereis(lager_event),
						lager_config:get({lager_event,
								  loglevel},
								 {0, []})}
					      of
					    {undefined, undefined, _} ->
						fun () ->
							{error,
							 lager_not_running}
						end();
					    {undefined, _, _} ->
						fun () ->
							{error,
							 {sink_not_configured,
							  lager_event}}
						end();
					    {__Pidholiday_mgr378, _,
					     {__Levelholiday_mgr378,
					      __Tracesholiday_mgr378}}
						when __Levelholiday_mgr378 band
						       64
						       /= 0
						       orelse
						       __Tracesholiday_mgr378 /=
							 [] ->
						lager:do_log(info,
							     [{module,
							       holiday_mgr},
							      {function,
							       handle_info},
							      {line, 378},
							      {pid,
							       pid_to_list(self())},
							      {node, node()}
							      | lager:md()],
							     io_lib:format("活动[~w]距离开始时间:~w",
									   [Bid,
									    AfterSec]),
							     none, 4096, 64,
							     __Levelholiday_mgr378,
							     __Tracesholiday_mgr378,
							     lager_event,
							     __Pidholiday_mgr378);
					    _ -> ok
					  end,
					  {true, NAGid};
				      true ->
					  AfterSec = min(EndTime - Now,
							 86400 * 20),
					  util:set_timer({check_ico, Bid},
							 AfterSec + 1,
							 {check_ico, Bids}),
					  case {whereis(lager_event),
						whereis(lager_event),
						lager_config:get({lager_event,
								  loglevel},
								 {0, []})}
					      of
					    {undefined, undefined, _} ->
						fun () ->
							{error,
							 lager_not_running}
						end();
					    {undefined, _, _} ->
						fun () ->
							{error,
							 {sink_not_configured,
							  lager_event}}
						end();
					    {__Pidholiday_mgr385, _,
					     {__Levelholiday_mgr385,
					      __Tracesholiday_mgr385}}
						when __Levelholiday_mgr385 band
						       64
						       /= 0
						       orelse
						       __Tracesholiday_mgr385 /=
							 [] ->
						lager:do_log(info,
							     [{module,
							       holiday_mgr},
							      {function,
							       handle_info},
							      {line, 385},
							      {pid,
							       pid_to_list(self())},
							      {node, node()}
							      | lager:md()],
							     io_lib:format("活动[~w]距离结束时间:~w",
									   [Bid,
									    AfterSec]),
							     none, 4096, 64,
							     __Levelholiday_mgr385,
							     __Tracesholiday_mgr385,
							     lager_event,
							     __Pidholiday_mgr385);
					    _ -> ok
					  end,
					  activity_global:set_and_push(NAGid, 1,
								       [EndTime],
								       Bid),
					  {false, NAGid}
				   end;
			       _ -> {true, AGId}
			     end,
    case IsNeedClose of
      false -> ignore;
      true ->
	  activity_global:set_and_push(NewAGId, 0, [0], Bid)
    end,
    {noreply, State};
handle_info({apply, Mfa}, State) ->
    try case Mfa of
	  {F} -> erlang:apply(F);
	  {F, A} -> erlang:apply(F, A);
	  {M, F, A} -> erlang:apply(M, F, A)
	end
    catch
      X:Y ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr409, _,
	     {__Levelholiday_mgr409, __Tracesholiday_mgr409}}
		when __Levelholiday_mgr409 band 8 /= 0 orelse
		       __Tracesholiday_mgr409 /= [] ->
		lager:do_log(error,
			     [{module, holiday_mgr}, {function, handle_info},
			      {line, 409}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法时出错:~w x:~w,~w ~w",
					   [Mfa, X, Y,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_mgr409,
			     __Tracesholiday_mgr409, lager_event,
			     __Pidholiday_mgr409);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    d_ets_lib:save(holiday_data),
    util:close_dets(holiday_expire),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_mgr419, _,
       {__Levelholiday_mgr419, __Tracesholiday_mgr419}}
	  when __Levelholiday_mgr419 band 64 /= 0 orelse
		 __Tracesholiday_mgr419 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_mgr}, {function, terminate},
			{line, 419}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "活动关闭", none, 4096, 64, __Levelholiday_mgr419,
		       __Tracesholiday_mgr419, lager_event,
		       __Pidholiday_mgr419);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load(State) ->
    Now = date:unixtime(),
    put(open_day,
	max(1,
	    game_lib:server_open_time(day) -
	      get_holiday_hour() div 24)),
    put(platform, list_to_atom(sys_env:get(platform))),
    put(srv_id, sys_env:get(server_id)),
    State1 = State#holiday_state{db_total = undefined,
				 data_total = []},
    OldList = ets:tab2list(holiday),
    {State2, DbSonList} = load_db(State1, Now),
    {State3, DataSonList} = load_data(State2, Now),
    AllSonList = DbSonList ++ DataSonList,
    [ets:delete(holiday, Bid)
     || #holiday{bid = Bid} <- OldList,
	not lists:keymember(Bid, #holiday.bid, AllSonList)],
    son_to_ets(list_util:keyresort(#holiday.end_time,
				   AllSonList),
	       AllSonList, Now),
    dump_expire(),
    check_start(),
    State3.

load_data(State, Now) ->
    State2 =
	load_data_total(holiday_role_data:list_open_total(),
			State, Now),
    SonList1 =
	load_data_son(State2#holiday_state.data_total, Now, []),
    SonL = holiday_role_data:list_open_son(0),
    SonList = do_load_data_son(SonL, #holiday_total{}, Now,
			       SonList1),
    {State2, SonList}.

load_data_son([], _Now, L) -> L;
load_data_son([Total = #holiday_total{id = Id} | T],
	      Now, L) ->
    NewL =
	do_load_data_son(holiday_role_data:list_open_son(Id),
			 Total, Now, L),
    load_data_son(T, Now, NewL).

do_load_data_son([], _Total, _Now, L) -> L;
do_load_data_son([CampId | T], Total, Now, L) ->
    Holiday = #holiday{bid = Bid, start_time = ST,
		       end_time = ET, total_id = TotalId, title = Title,
		       platform_id = WhilePlatform,
		       platform_exclude_id = BlackPlatform,
		       hide_srv_ids = HideSrvIds} =
		  holiday_role_data:get_open(CampId),
    Platform = get(platform),
    SrvId = get(srv_id),
    NewL = case WhilePlatform =:= [] orelse
		  lists:member(Platform, WhilePlatform)
	       of
	     true ->
		 case lists:member(Platform, BlackPlatform) orelse
			lists:member(SrvId, HideSrvIds)
		     of
		   true -> L;
		   _ ->
		       HolidaySec = get_holiday_sec(),
		       StartTime = date:parse_time(ST) - HolidaySec,
		       EndTime = date:parse_time(ET) - HolidaySec,
		       case StartTime =< Now andalso EndTime > Now of
			 true ->
			     case check_open(Holiday#holiday{start_time =
								 StartTime,
							     end_time = EndTime,
							     tbid =
								 holiday_lib:get_tbid(Bid)})
				 of
			       {ok,
				NewHoliday = #holiday{start_time = NewStartTime,
						      end_time = NewEndTime}} ->
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
				     {__Pidholiday_mgr480, _,
				      {__Levelholiday_mgr480,
				       __Tracesholiday_mgr480}}
					 when __Levelholiday_mgr480 band 64 /= 0
						orelse
						__Tracesholiday_mgr480 /= [] ->
					 lager:do_log(info,
						      [{module, holiday_mgr},
						       {function,
							do_load_data_son},
						       {line, 480},
						       {pid,
							pid_to_list(self())},
						       {node, node()}
						       | lager:md()],
						      io_lib:format("加载活动[~w/~w:~ts]成功:~w=>~w",
								    [TotalId,
								     CampId,
								     Title,
								     date:seconds_to_datetime(NewStartTime),
								     date:seconds_to_datetime(NewEndTime)]),
						      none, 4096, 64,
						      __Levelholiday_mgr480,
						      __Tracesholiday_mgr480,
						      lager_event,
						      __Pidholiday_mgr480);
				     _ -> ok
				   end,
				   [NewHoliday | L];
			       _ -> L
			     end;
			 _ -> L
		       end
		 end;
	     _ -> L
	   end,
    do_load_data_son(T, Total, Now, NewL).

load_data_total([], State, _Now) -> State;
load_data_total([Total = #holiday_total{id = Id,
					name = Name, start_time = ST,
					end_time = ET, status = 1}
		 | T],
		State = #holiday_state{data_total = L}, Now) ->
    HolidaySec = get_holiday_sec(),
    StartTime = date:parse_time(ST) - HolidaySec,
    EndTime = date:parse_time(ET) - HolidaySec,
    case StartTime =< Now andalso
	   (EndTime =:= 0 orelse EndTime > Now)
	of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr503, _,
	     {__Levelholiday_mgr503, __Tracesholiday_mgr503}}
		when __Levelholiday_mgr503 band 64 /= 0 orelse
		       __Tracesholiday_mgr503 /= [] ->
		lager:do_log(info,
			     [{module, holiday_mgr},
			      {function, load_data_total}, {line, 503},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("加载数据表到总活动[~w:~ts] 时间:~w=>~w",
					   [Id, Name,
					    date:seconds_to_datetime(StartTime),
					    date:seconds_to_datetime(EndTime)]),
			     none, 4096, 64, __Levelholiday_mgr503,
			     __Tracesholiday_mgr503, lager_event,
			     __Pidholiday_mgr503);
	    _ -> ok
	  end,
	  NewTotal = Total#holiday_total{start_time = StartTime,
					 end_time = EndTime},
	  load_data_total(T,
			  State#holiday_state{data_total = [NewTotal | L]},
			  Now);
      _ -> load_data_total(T, State, Now)
    end;
load_data_total([_ | T], State, Now) ->
    load_data_total(T, State, Now).

load_db(State, Now) ->
    State2 = load_db_total(State, Now),
    SonList = load_db_son(State2, Now),
    {State2, SonList}.

load_db_total(State, Now) ->
    CurOpenDay = get(open_day),
    case db:get_row(get_sql(total), [Now, CurOpenDay]) of
      {ok,
       [Id, Name, IconId, StartTime, EndTime, OpenDay,
	MergeDay, IsShow]} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr523, _,
	     {__Levelholiday_mgr523, __Tracesholiday_mgr523}}
		when __Levelholiday_mgr523 band 64 /= 0 orelse
		       __Tracesholiday_mgr523 /= [] ->
		lager:do_log(info,
			     [{module, holiday_mgr}, {function, load_db_total},
			      {line, 523}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载到总活动[~w:~w:~ts] 时间:~w=>~w",
					   [Id, IconId, Name,
					    date:seconds_to_datetime(StartTime),
					    date:seconds_to_datetime(EndTime)]),
			     none, 4096, 64, __Levelholiday_mgr523,
			     __Tracesholiday_mgr523, lager_event,
			     __Pidholiday_mgr523);
	    _ -> ok
	  end,
	  HolidayTotal = #holiday_total{id = Id, name = Name,
					icon_id = IconId,
					start_time = StartTime,
					end_time = EndTime, status = 1,
					open_day = OpenDay,
					merge_day = MergeDay, is_show = IsShow},
	  State#holiday_state{db_total = HolidayTotal};
      _ -> State
    end.

load_db_son(#holiday_state{db_total =
			       #holiday_total{id = Id} = Total},
	    _Now) ->
    case db:get_all(get_sql(son), [Id]) of
      {error, undefined} -> [];
      {error, _Why} -> [];
      {ok, Data} -> do_load_db_son(Total, Data, [])
    end;
load_db_son(_, _Now) -> [].

do_load_db_son(_Total, [], R) -> R;
do_load_db_son(Total = #holiday_total{open_day =
					  OpenDay,
				      merge_day = MergeDay},
	       [[Bid, TotalId, CampId, StartTime, EndTime, Title,
		 Title2, Ico, TypeIco, TopBanner, RuleStr, TimeStr,
		 BottomAlert, SortVal, RewardTitle, Reward, CliReward,
		 ItemEffect, MailSubject, MailContent, PanelType,
		 StartOpenDay, PShowReward, OpenDayMin, OpenDayMax]
		| L],
	       R) ->
    HolidaySec = get_holiday_sec(),
    CurOpenDay = get(open_day),
    R2 = case check_son_open(CurOpenDay,
			     StartTime - HolidaySec, date:unixtime(zero),
			     StartOpenDay, OpenDayMin, OpenDayMax)
	     of
	   true ->
	       Holiday = #holiday{bid = Bid,
				  tbid = holiday_lib:get_tbid(Bid),
				  total_id = TotalId, camp_id = CampId,
				  start_time = StartTime - HolidaySec,
				  end_time = EndTime - HolidaySec,
				  title = Title, title2 = Title2, ico = Ico,
				  type_ico = TypeIco, top_banner = TopBanner,
				  rule_str = RuleStr, time_str = TimeStr,
				  bottom_alert = BottomAlert,
				  sort_val = SortVal,
				  reward_title = RewardTitle,
				  reward = util:binary_to_term(Reward),
				  cli_reward = CliReward,
				  item_effect = util:binary_to_term(ItemEffect),
				  open_day = OpenDay, merge_day = MergeDay,
				  open_day_min = OpenDayMin,
				  open_day_max = OpenDayMax,
				  mail_subject = MailSubject,
				  mail_content = MailContent,
				  panel_type = PanelType,
				  process_show_reward = PShowReward},
	       case is_list(Holiday#holiday.reward) of
		 true ->
		     case {whereis(lager_event), whereis(lager_event),
			   lager_config:get({lager_event, loglevel}, {0, []})}
			 of
		       {undefined, undefined, _} ->
			   fun () -> {error, lager_not_running} end();
		       {undefined, _, _} ->
			   fun () -> {error, {sink_not_configured, lager_event}}
			   end();
		       {__Pidholiday_mgr591, _,
			{__Levelholiday_mgr591, __Tracesholiday_mgr591}}
			   when __Levelholiday_mgr591 band 64 /= 0 orelse
				  __Tracesholiday_mgr591 /= [] ->
			   lager:do_log(info,
					[{module, holiday_mgr},
					 {function, do_load_db_son},
					 {line, 591},
					 {pid, pid_to_list(self())},
					 {node, node()}
					 | lager:md()],
					io_lib:format("加载活动[~w/~w:~ts]成功:~w=>~w",
						      [TotalId, CampId, Title,
						       date:seconds_to_datetime(Holiday#holiday.start_time),
						       date:seconds_to_datetime(Holiday#holiday.end_time)]),
					none, 4096, 64, __Levelholiday_mgr591,
					__Tracesholiday_mgr591, lager_event,
					__Pidholiday_mgr591);
		       _ -> ok
		     end,
		     [Holiday | R];
		 false ->
		     case {whereis(lager_event), whereis(lager_event),
			   lager_config:get({lager_event, loglevel}, {0, []})}
			 of
		       {undefined, undefined, _} ->
			   fun () -> {error, lager_not_running} end();
		       {undefined, _, _} ->
			   fun () -> {error, {sink_not_configured, lager_event}}
			   end();
		       {__Pidholiday_mgr594, _,
			{__Levelholiday_mgr594, __Tracesholiday_mgr594}}
			   when __Levelholiday_mgr594 band 8 /= 0 orelse
				  __Tracesholiday_mgr594 /= [] ->
			   lager:do_log(error,
					[{module, holiday_mgr},
					 {function, do_load_db_son},
					 {line, 594},
					 {pid, pid_to_list(self())},
					 {node, node()}
					 | lager:md()],
					io_lib:format("活动奖励配置有问题!bid ~w ~ts, Holiday ~w",
						      [Bid, Title,
						       Holiday#holiday.reward]),
					none, 4096, 8, __Levelholiday_mgr594,
					__Tracesholiday_mgr594, lager_event,
					__Pidholiday_mgr594);
		       _ -> ok
		     end,
		     R
	       end;
	   _ -> R
	 end,
    do_load_db_son(Total, L, R2).

check_son_open(CurOpenDay, _StartTime, _Today,
	       StartOpenDay, _OpenDayMin, _OpenDayMax)
    when CurOpenDay < StartOpenDay ->
    false;
check_son_open(_CurOpenDay, _StartTime, _Today,
	       _StartOpenDay, 0, 0) ->
    true;
check_son_open(CurOpenDay, _StartTime, _Today,
	       _StartOpenDay, OpenDayMin, OpenDayMax) ->
    CurOpenDay >= OpenDayMin andalso
      (OpenDayMax =:= 0 orelse CurOpenDay =< OpenDayMax).

get_sql(total) ->
    "SELECT `id`,`name`,`icon_id`,`start_time`,`en"
    "d_time`,`open_day`,`merge_day`,`is_show` "
    "FROM `mod_holiday_total` WHERE `status`=1 "
    "AND end_time>=? and open_day <= ? order "
    "by end_time limit 1";
get_sql(son) ->
    "SELECT `bid`,`total_id`,`camp_id`,`start_time"
    "`,`end_time`,`title`,`title2`,`ico`,`type_ico"
    "`,`top_banner`,`rule_str`,`time_str`,`bottom_"
    "alert`,`sort_val`,`reward_title`,`reward`, "
    "`cli_reward`, `item_effect`, `mail_subject`,`"
    "mail_content`,`panel_type`,`start_open_day`,`"
    "process_show_reward`,`open_day_min`,`open_day"
    "_max` FROM `mod_holiday_son` WHERE total_id=? "
    "and status = 1".

son_to_ets([], _AllSonList, _Now) -> ok;
son_to_ets([Holiday = #holiday{bid = Bid,
			       start_time = StartTime, end_time = EndTime}
	    | L],
	   AllSonList, Now) ->
    case holiday_lib:get_holiday(Bid) of
      undefined -> ets:insert(holiday, Holiday);
      Holiday -> pass;
      OldH = #holiday{start_time = ST1} ->
	  case EndTime > Now andalso StartTime < ST1 orelse
		 not lists:member(OldH, AllSonList)
	      of
	    true -> ets:insert(holiday, Holiday);
	    _ -> ignore
	  end
    end,
    init_holiday_son(Holiday),
    son_to_ets(L, AllSonList, Now).

init_holiday_son(Holiday = #holiday{tbid = Bid})
    when Bid >= 7000 andalso Bid =< 7999 ->
    holiday_rule_rank:init(Holiday);
init_holiday_son(Holiday = #holiday{tbid = Bid})
    when Bid >= 3000 andalso Bid =< 3999 ->
    holiday_rule_func:set_timer(Holiday);
init_holiday_son(_) -> ok.

init_expire() ->
    Tab = holiday_expire,
    Prolong = 86400 * 2,
    Fun = fun (H = {CampId, Data}, {Time, Add, Del}) ->
		  case maps:get(end_time, Data, undefined) of
		    EndTime
			when is_integer(EndTime) andalso
			       EndTime + Prolong > Time ->
			{Time, [H | Add], Del};
		    _ -> {Time, Add, [CampId | Del]}
		  end
	  end,
    {_, AddL, DelL} = dets:foldl(Fun,
				 {date:unixtime(), [], []}, Tab),
    [dets:delete(Tab, CampId) || CampId <- DelL],
    ets:insert(Tab, AddL),
    expire_timer(),
    ok.

check_expire() ->
    Tab = holiday_expire,
    Prolong = 86400 * 2,
    Fun = fun ({CampId, Data}, {Time, Del}) ->
		  case maps:get(end_time, Data, undefined) of
		    EndTime
			when is_integer(EndTime) andalso
			       EndTime + Prolong > Time ->
			{Time, Del};
		    _ -> {Time, [CampId | Del]}
		  end;
	      (Unknow, Rtn) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_mgr675, _,
		     {__Levelholiday_mgr675, __Tracesholiday_mgr675}}
			when __Levelholiday_mgr675 band 8 /= 0 orelse
			       __Tracesholiday_mgr675 /= [] ->
			lager:do_log(error,
				     [{module, holiday_mgr},
				      {function, check_expire}, {line, 675},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("未知的过期活动数据Unknow:~w, Rtn:~w",
						   [Unknow, Rtn]),
				     none, 4096, 8, __Levelholiday_mgr675,
				     __Tracesholiday_mgr675, lager_event,
				     __Pidholiday_mgr675);
		    _ -> ok
		  end,
		  Rtn
	  end,
    {_, DelL} = ets:foldl(Fun, {date:unixtime(), []}, Tab),
    [ets:delete(Tab, CampId) || CampId <- DelL],
    [dets:delete(Tab, CampId) || CampId <- DelL],
    expire_timer(),
    ok.

expire_timer() ->
    RandSec = util:rand(1, 10),
    NextT = date:next_diff({6, 0, 0}) + RandSec,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_mgr688, _,
       {__Levelholiday_mgr688, __Tracesholiday_mgr688}}
	  when __Levelholiday_mgr688 band 128 /= 0 orelse
		 __Tracesholiday_mgr688 /= [] ->
	  lager:do_log(debug,
		       [{module, holiday_mgr}, {function, expire_timer},
			{line, 688}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("距离检查【活动】下一超时数据时间[Diff:~w]", [NextT]),
		       none, 4096, 128, __Levelholiday_mgr688,
		       __Tracesholiday_mgr688, lager_event,
		       __Pidholiday_mgr688);
      _ -> ok
    end,
    util:set_timer(expire_timer, NextT,
		   {apply, {holiday_mgr, check_expire, []}}),
    ok.

dump_expire() ->
    Fun = fun (H = #holiday{}, Acc) ->
		  Data = holiday_lib:to_expire_data(H), [Data | Acc];
	      (H, Acc) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_mgr698, _,
		     {__Levelholiday_mgr698, __Tracesholiday_mgr698}}
			when __Levelholiday_mgr698 band 8 /= 0 orelse
			       __Tracesholiday_mgr698 /= [] ->
			lager:do_log(error,
				     [{module, holiday_mgr},
				      {function, dump_expire}, {line, 698},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动数据结构不匹配:~w", [H]), none,
				     4096, 8, __Levelholiday_mgr698,
				     __Tracesholiday_mgr698, lager_event,
				     __Pidholiday_mgr698);
		    _ -> ok
		  end,
		  Acc
	  end,
    List = ets:foldl(Fun, [], holiday),
    ets:insert(holiday_expire, List),
    dets:insert(holiday_expire, List),
    ok.

check_open(Holiday = #holiday{tbid = 3020,
			      reward = Reward, bid = Bid, camp_id = CampId,
			      start_time = StartTime}) ->
    case ets:lookup(holiday_data, Bid) of
      [{Bid, CampId, Data}] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr710, _,
	     {__Levelholiday_mgr710, __Tracesholiday_mgr710}}
		when __Levelholiday_mgr710 band 64 /= 0 orelse
		       __Tracesholiday_mgr710 /= [] ->
		lager:do_log(info,
			     [{module, holiday_mgr}, {function, check_open},
			      {line, 710}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("活动已开启过,加载历史奖励,camp_id=~w bid=~w start_time=~w",
					   [CampId, Bid, StartTime]),
			     none, 4096, 64, __Levelholiday_mgr710,
			     __Tracesholiday_mgr710, lager_event,
			     __Pidholiday_mgr710);
	    _ -> ok
	  end,
	  {ok,
	   Holiday#holiday{reward =
			       maps:get(reward, Data, Reward)}};
      _ ->
	  case date:is_today(StartTime) of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_mgr715, _,
		   {__Levelholiday_mgr715, __Tracesholiday_mgr715}}
		      when __Levelholiday_mgr715 band 64 /= 0 orelse
			     __Tracesholiday_mgr715 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_mgr},
				    {function, check_open}, {line, 715},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("活动首次开启,保存奖励信息,camp_id=~w bid=~w start_time=~w",
						 [CampId, Bid, StartTime]),
				   none, 4096, 64, __Levelholiday_mgr715,
				   __Tracesholiday_mgr715, lager_event,
				   __Pidholiday_mgr715);
		  _ -> ok
		end,
		d_ets_lib:save_d_ets(holiday_data,
				     {Bid, CampId, #{reward => Reward}}),
		{ok, Holiday};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_mgr719, _,
		   {__Levelholiday_mgr719, __Tracesholiday_mgr719}}
		      when __Levelholiday_mgr719 band 8 /= 0 orelse
			     __Tracesholiday_mgr719 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_mgr},
				    {function, check_open}, {line, 719},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("开始时间不是今天 活动不再开启,camp_id=~w bid=~w start_time=~w",
						 [CampId, Bid, StartTime]),
				   none, 4096, 8, __Levelholiday_mgr719,
				   __Tracesholiday_mgr719, lager_event,
				   __Pidholiday_mgr719);
		  _ -> ok
		end,
		false
	  end
    end;
check_open(Holiday = #holiday{tbid = TBid,
			      condition = Condition, bid = Bid,
			      camp_id = CampId, start_time = StartTime})
    when TBid =:= 3010 orelse
	   TBid =:= 3011 orelse
	     TBid =:= 3012 orelse TBid =:= 3017 ->
    case ets:lookup(holiday_real_open_time, CampId) of
      [{CampId, _OpenTime} | _] -> skip;
      _ ->
	  case check_condition(Condition) of
	    true ->
		Now = date:unixtime(zero),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_mgr733, _,
		   {__Levelholiday_mgr733, __Tracesholiday_mgr733}}
		      when __Levelholiday_mgr733 band 64 /= 0 orelse
			     __Tracesholiday_mgr733 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_mgr},
				    {function, check_open}, {line, 733},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("活动首次开启,保存活动开启时间,camp_id=~w bid=~w start_time="
						 "~w, real_open_time=~w",
						 [CampId, Bid, StartTime, Now]),
				   none, 4096, 64, __Levelholiday_mgr733,
				   __Tracesholiday_mgr733, lager_event,
				   __Pidholiday_mgr733);
		  _ -> ok
		end,
		d_ets_lib:save_d_ets(holiday_real_open_time,
				     {CampId, Now});
	    _ -> false
	  end
    end,
    {ok, Holiday};
check_open(Holiday = #holiday{condition = Condition,
			      bid = Bid, camp_id = CampId,
			      start_time = StartTime})
    when CampId =:= 3003 orelse CampId =:= 3016 ->
    case check_condition(Condition) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr744, _,
	     {__Levelholiday_mgr744, __Tracesholiday_mgr744}}
		when __Levelholiday_mgr744 band 64 /= 0 orelse
		       __Tracesholiday_mgr744 /= [] ->
		lager:do_log(info,
			     [{module, holiday_mgr}, {function, check_open},
			      {line, 744}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("活动检测开启,加载历史奖励,camp_id=~w",
					   [CampId]),
			     none, 4096, 64, __Levelholiday_mgr744,
			     __Tracesholiday_mgr744, lager_event,
			     __Pidholiday_mgr744);
	    _ -> ok
	  end,
	  {ok, Holiday};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_mgr747, _,
	     {__Levelholiday_mgr747, __Tracesholiday_mgr747}}
		when __Levelholiday_mgr747 band 64 /= 0 orelse
		       __Tracesholiday_mgr747 /= [] ->
		lager:do_log(info,
			     [{module, holiday_mgr}, {function, check_open},
			      {line, 747}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("活动检测不开启,camp_id=~w", [CampId]),
			     none, 4096, 64, __Levelholiday_mgr747,
			     __Tracesholiday_mgr747, lager_event,
			     __Pidholiday_mgr747);
	    _ -> ok
	  end,
	  false
    end;
check_open(Holiday) -> {ok, Holiday}.

check_condition([]) -> true;
check_condition([#condition{label = open_srv_day,
			    val = Val}
		 | Condition]) ->
    Time = get(open_day),
    case Time == Val of
      true -> check_condition(Condition);
      _ -> false
    end;
check_condition([#condition{label = open_srv_time,
			    op = Op, val = Val}
		 | Condition]) ->
    Time = sys_env:get(open_timestamp),
    case comp(Op, Time, Val) of
      true -> check_condition(Condition);
      _ -> false
    end;
check_condition([_ | Condition]) ->
    check_condition(Condition).

comp(ue, Val, TargetVal) -> Val =/= TargetVal;
comp(eq, Val, TargetVal) -> Val =:= TargetVal;
comp(lt, Val, TargetVal) -> Val < TargetVal;
comp(gt, Val, TargetVal) -> Val > TargetVal;
comp(le, Val, TargetVal) -> Val =< TargetVal;
comp(ge, Val, TargetVal) -> Val >= TargetVal;
comp(include, L, TargetVal) ->
    lists:member(TargetVal, L);
comp(not_in, L, TargetVal) ->
    lists:member(TargetVal, L) =:= false.


