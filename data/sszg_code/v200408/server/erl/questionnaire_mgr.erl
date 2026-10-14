-file("src/mod/questionnaire/questionnaire_mgr.erl", 1).

-module(questionnaire_mgr).

-lager_records([{questionnaire,
		 [id, title, sort, topic_type, specific_type, must,
		  option, jump, topic, option_list]},
		{questionnaire_total,
		 [id, title, memo, guide, welcome, start_time, end_time,
		  mail_title, mail_content, rewards, min_lev, max_lev,
		  recharge_min, recharge_max]},
		{state, []}]).

-behaviour(gen_server).

-export([reload/0]).

-export([info/1, cast/1, call/1, start_link/0]).

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

-file("src/mod/questionnaire/questionnaire_mgr.erl",
      13).

-file("inc/questionnaire.hrl", 1).

-record(questionnaire_total,
	{id = 0, title = <<>>, memo = <<>>, guide = 0,
	 welcome = 0, start_time = 0, end_time = 0,
	 mail_title = <<>>, mail_content = <<>>, rewards = [],
	 min_lev = 0, max_lev = 0, recharge_min = 0,
	 recharge_max = 0}).

-record(questionnaire,
	{id = 0, title = <<>>, sort = 0, topic_type = 0,
	 specific_type = 0, must = 0, option = <<>>, jump = 0,
	 topic = 0, option_list = <<>>}).

-file("src/mod/questionnaire/questionnaire_mgr.erl",
      14).

reload() -> questionnaire_mgr ! reload.

info(Info) -> questionnaire_mgr ! Info.

cast(Info) -> gen_server:cast(questionnaire_mgr, Info).

call(Info) ->
    case catch gen_server:call(questionnaire_mgr, Info,
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
	    {__Pidquestionnaire_mgr26, _,
	     {__Levelquestionnaire_mgr26,
	      __Tracesquestionnaire_mgr26}}
		when __Levelquestionnaire_mgr26 band 8 /= 0 orelse
		       __Tracesquestionnaire_mgr26 /= [] ->
		lager:do_log(error,
			     [{module, questionnaire_mgr}, {function, call},
			      {line, 26}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [questionnaire_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelquestionnaire_mgr26,
			     __Tracesquestionnaire_mgr26, lager_event,
			     __Pidquestionnaire_mgr26);
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
    gen_server:start_link({local, questionnaire_mgr},
			  questionnaire_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquestionnaire_mgr32, _,
       {__Levelquestionnaire_mgr32,
	__Tracesquestionnaire_mgr32}}
	  when __Levelquestionnaire_mgr32 band 64 /= 0 orelse
		 __Tracesquestionnaire_mgr32 /= [] ->
	  lager:do_log(info,
		       [{module, questionnaire_mgr}, {function, init},
			{line, 32}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [questionnaire_mgr]),
		       none, 4096, 64, __Levelquestionnaire_mgr32,
		       __Tracesquestionnaire_mgr32, lager_event,
		       __Pidquestionnaire_mgr32);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(questionnaire_total,
	    [set, named_table, public,
	     {keypos, #questionnaire_total.id}]),
    ets:new(questionnaire,
	    [set, named_table, public, {keypos, 1}]),
    load(),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquestionnaire_mgr38, _,
       {__Levelquestionnaire_mgr38,
	__Tracesquestionnaire_mgr38}}
	  when __Levelquestionnaire_mgr38 band 64 /= 0 orelse
		 __Tracesquestionnaire_mgr38 /= [] ->
	  lager:do_log(info,
		       [{module, questionnaire_mgr}, {function, init},
			{line, 38}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [questionnaire_mgr]), none,
		       4096, 64, __Levelquestionnaire_mgr38,
		       __Tracesquestionnaire_mgr38, lager_event,
		       __Pidquestionnaire_mgr38);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({quest, Id}, State) ->
    Now = date:unixtime(),
    case ets:lookup(questionnaire_total, Id) of
      [#questionnaire_total{start_time = StartTime}]
	  when StartTime > Now ->
	  util:set_timer({quest, Id},
			 min(864000, StartTime - Now), {quest, Id});
      [#questionnaire_total{end_time = EndTime}]
	  when EndTime > Now ->
	  questionnaire:push_status(all),
	  util:set_timer({quest, Id}, min(864000, EndTime - Now),
			 {quest, Id});
      [#questionnaire_total{end_time = EndTime}]
	  when Now - EndTime >= 3600 ->
	  ets:delete(questionnaire_total, Id),
	  ets:delete(questionnaire, Id);
      [#questionnaire_total{}] ->
	  questionnaire:push_status(all),
	  util:set_timer({quest, Id}, 3601, {quest, Id}),
	  ok;
      _ -> skip
    end,
    {noreply, State};
handle_info(reload, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquestionnaire_mgr69, _,
       {__Levelquestionnaire_mgr69,
	__Tracesquestionnaire_mgr69}}
	  when __Levelquestionnaire_mgr69 band 64 /= 0 orelse
		 __Tracesquestionnaire_mgr69 /= [] ->
	  lager:do_log(info,
		       [{module, questionnaire_mgr}, {function, handle_info},
			{line, 69}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("数据重载", []), none, 4096, 64,
		       __Levelquestionnaire_mgr69, __Tracesquestionnaire_mgr69,
		       lager_event, __Pidquestionnaire_mgr69);
      _ -> ok
    end,
    load(),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load() ->
    ets:delete_all_objects(questionnaire_total),
    ets:delete_all_objects(questionnaire),
    Now = date:unixtime(),
    case db:get_all("select quest_id, quest_title, memo, "
		    "guide, welcome, mail_title, mail_content, "
		    "reward_content, min_lv, max_lv, recharge_min, "
		    "recharge_max, start_time, end_time from "
		    "mod_questionnaire where quest_status=1 "
		    "and end_time > ?",
		    [Now])
	of
      {ok, L} -> do_load(L, Now);
      _ -> skip
    end.

do_load([], _Now) -> ok;
do_load([[Id, Title, Memo, Guide, Welcome, MailTitle,
	  MailContent, RewardContent, MinLev, MaxLev, RechargeMin,
	  RechargeMax, StartTime, EndTime]
	 | T],
	Now) ->
    case
      db:get_all("select id, sort, topic_type, specific_type, "
		 "must, options, title, jump, topic, option_lis"
		 "t from mod_questionnaire_son where quest_id "
		 "= ?",
		 [Id])
	of
      {ok, L} ->
	  Fun = fun ([Id1, Sort, TopicType, SpecificType, Must,
		      Options, Title1, Jump, Topic, OptionList]) ->
			#questionnaire{id = Id1, sort = Sort, title = Title1,
				       topic_type = TopicType,
				       specific_type = SpecificType,
				       must = Must, option = Options,
				       jump = Jump, topic = Topic,
				       option_list = OptionList}
		end,
	  L1 = [Fun(I) || I <- L],
	  Quest = #questionnaire_total{id = Id, title = Title,
				       memo = Memo, guide = Guide,
				       welcome = Welcome,
				       mail_title = MailTitle,
				       mail_content = MailContent,
				       rewards =
					   util:binary_to_term(RewardContent),
				       min_lev = MinLev, max_lev = MaxLev,
				       recharge_min = RechargeMin,
				       recharge_max = RechargeMax,
				       start_time = StartTime,
				       end_time = EndTime},
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquestionnaire_mgr116, _,
	     {__Levelquestionnaire_mgr116,
	      __Tracesquestionnaire_mgr116}}
		when __Levelquestionnaire_mgr116 band 64 /= 0 orelse
		       __Tracesquestionnaire_mgr116 /= [] ->
		lager:do_log(info,
			     [{module, questionnaire_mgr}, {function, do_load},
			      {line, 116}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载题目[~w:~ts]成功", [Id, Title]), none,
			     4096, 64, __Levelquestionnaire_mgr116,
			     __Tracesquestionnaire_mgr116, lager_event,
			     __Pidquestionnaire_mgr116);
	    _ -> ok
	  end,
	  if StartTime > Now ->
		 util:set_timer({quest, Id},
				min(864000, StartTime - Now), {quest, Id});
	     EndTime > Now ->
		 util:set_timer({quest, Id}, min(864000, EndTime - Now),
				{quest, Id});
	     true -> skip
	  end,
	  ets:insert(questionnaire_total, Quest),
	  ets:insert(questionnaire, {Id, L1});
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquestionnaire_mgr127, _,
	     {__Levelquestionnaire_mgr127,
	      __Tracesquestionnaire_mgr127}}
		when __Levelquestionnaire_mgr127 band 8 /= 0 orelse
		       __Tracesquestionnaire_mgr127 /= [] ->
		lager:do_log(error,
			     [{module, questionnaire_mgr}, {function, do_load},
			      {line, 127}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("加载题目[~w:~ts]出错:~w",
					   [Id, Title, _Err]),
			     none, 4096, 8, __Levelquestionnaire_mgr127,
			     __Tracesquestionnaire_mgr127, lager_event,
			     __Pidquestionnaire_mgr127);
	    _ -> ok
	  end
    end,
    do_load(T, Now).


