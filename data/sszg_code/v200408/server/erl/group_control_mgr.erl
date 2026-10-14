-file("src/mod/group_control/group_control_mgr.erl", 1).

-module(group_control_mgr).

-lager_records([{activity,
		 [id, status, name, data, ext_args]},
		{group_control_quest_data, [quest_id, desc, add_value]},
		{group_control_data,
		 [step, name, need_value, timeout_day, step_quest,
		  step_function, step_reward, desc]},
		{group_control,
		 [id, group_id, name, status, step, val, time, is_auto,
		  is_finished, ext]},
		{state, [group_id, srv_id, is_begin]}]).

-behaviour(gen_server).

-export([start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([reload/0, server_add/1, server_del/1,
	 reset_groups/1, get_step/0, query_group_control_info/0,
	 get_current_step_and_val/0, get_servers/0]).

-export([finish_chapter/0, finish_chapter/1,
	 finish_rank_match/0, finish_zs_war/0]).

-export([gm_add_process_val/1, gm_clean_process/0]).

-record(state, {group_id, srv_id, is_begin = false}).

-file("inc/group_control.hrl", 1).

-record(group_control,
	{id = <<>>  :: bitstring(),
	 group_id = 0  :: non_neg_integer(), name = <<>>,
	 status = false  :: true | false,
	 step = 1  :: non_neg_integer(),
	 val = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 is_auto = false  :: true | false, is_finished = false,
	 ext = []  :: [any()]}).

-record(group_control_data,
	{step = 0, name = <<>>, need_value = 0, timeout_day = 0,
	 step_quest = [], step_function = [], step_reward = [],
	 desc = <<>>}).

-record(group_control_quest_data,
	{quest_id, desc, add_value}).

-file("src/mod/group_control/group_control_mgr.erl",
      52).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/group_control/group_control_mgr.erl",
      53).

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

-file("src/mod/group_control/group_control_mgr.erl",
      54).

-spec start_link() -> {ok, Pid :: pid()} | ignore |
		      {error, Reason :: term()}.

start_link() ->
    gen_server:start_link({local, group_control_mgr},
			  group_control_mgr, [], []).

reload() -> gen_server:cast(group_control_mgr, reload).

server_add(Group) ->
    gen_server:cast(group_control_mgr, {server_add, Group}).

server_del(SrvId) ->
    gen_server:cast(group_control_mgr, {server_del, SrvId}).

reset_groups(Groups) ->
    gen_server:cast(group_control_mgr,
		    {reset_groups, Groups}).

get_step() ->
    gen_server:call(group_control_mgr, {get_step}).

get_current_step_and_val() ->
    SrvId = sys_env:get(server_id),
    case ets:lookup(group_control, SrvId) of
      [] -> {0, 0};
      [#group_control{step = Step, val = Val}] -> {Step, Val}
    end.

get_servers() ->
    [SrvId
     || #group_control{id = SrvId}
	    <- ets:tab2list(group_control)].

query_group_control_info() ->
    gen_server:call(group_control_mgr,
		    {query_group_control_info}).

gm_add_process_val(Val) ->
    gen_server:cast(group_control_mgr,
		    {gm_add_process_val, Val}).

gm_clean_process() ->
    gen_server:cast(group_control_mgr, {gm_clean_process}).

finish_chapter() -> finish_chapter(1).

finish_chapter(N) -> finish_quest(101, N).

finish_rank_match() -> finish_quest(103, 1).

finish_zs_war() -> finish_quest(104, 1).

finish_quest(QuestId, N) ->
    case group_control_data:get_group_control_quest(QuestId)
	of
      undefined -> ok;
      #group_control_quest_data{add_value = Val} ->
	  add_process_val(QuestId, Val * N)
    end.

add_process_val(QuestId, Val) ->
    gen_server:cast(group_control_mgr,
		    {add_process_val, QuestId, Val}).

-spec init(Args :: term()) -> {ok, State :: #state{}} |
			      {ok, State :: #state{}, timeout() | hibernate} |
			      {stop, Reason :: term()} | ignore.

init([]) ->
    ets:new(group_control,
	    [set, named_table, public,
	     {keypos, #group_control.id}]),
    {ok,
     #state{srv_id = sys_env:get(server_id), group_id = 0}}.

-spec handle_call(Request :: term(),
		  From :: {pid(), Tag :: term()},
		  State :: #state{}) -> {reply, Reply :: term(),
					 NewState :: #state{}} |
					{reply, Reply :: term(),
					 NewState :: #state{},
					 timeout() | hibernate} |
					{noreply, NewState :: #state{}} |
					{noreply, NewState :: #state{},
					 timeout() | hibernate} |
					{stop, Reason :: term(),
					 Reply :: term(),
					 NewState :: #state{}} |
					{stop, Reason :: term(),
					 NewState :: #state{}}.

handle_call({get_step}, _From,
	    State = #state{srv_id = SrvId}) ->
    S = case ets:lookup(group_control, SrvId) of
	  [#group_control{step = Step}] -> Step;
	  _ -> 0
	end,
    {reply, S, State};
handle_call({query_group_control_info}, _From,
	    State = #state{srv_id = SrvId, group_id = GroupId}) ->
    Reply = case ets:lookup(group_control, SrvId) of
	      [] -> {GroupId, 0, []};
	      [#group_control{step = Step}] ->
		  ServerInfo = [{SId, SName, Val}
				|| #group_control{id = SId, name = SName,
						  val = Val}
				       <- ets:tab2list(group_control)],
		  {GroupId, Step, ServerInfo}
	    end,
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

-spec handle_cast(Request :: term(),
		  State :: #state{}) -> {noreply, NewState :: #state{}} |
					{noreply, NewState :: #state{},
					 timeout() | hibernate} |
					{stop, Reason :: term(),
					 NewState :: #state{}}.

handle_cast(reload, State = #state{srv_id = SrvId}) ->
    GroupId = sys_env:get(group_id),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidgroup_control_mgr207, _,
       {__Levelgroup_control_mgr207,
	__Tracesgroup_control_mgr207}}
	  when __Levelgroup_control_mgr207 band 128 /= 0 orelse
		 __Tracesgroup_control_mgr207 /= [] ->
	  lager:do_log(debug,
		       [{module, group_control_mgr}, {function, handle_cast},
			{line, 207}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("group control mgr ~w", [GroupId]), none,
		       4096, 128, __Levelgroup_control_mgr207,
		       __Tracesgroup_control_mgr207, lager_event,
		       __Pidgroup_control_mgr207);
      _ -> ok
    end,
    sync_srv_group_to_center(SrvId, GroupId,
			     sys_env:get(zone_name, <<>>)),
    get_groups_from_center(SrvId, GroupId),
    {noreply, State#state{group_id = GroupId}};
handle_cast({server_add, Group}, State)
    when is_record(Group, group_control) ->
    ets:insert(group_control, Group), {noreply, State};
handle_cast({server_del, SrvId}, State) ->
    ets:delete(group_control, SrvId), {noreply, State};
handle_cast({reset_groups, []},
	    State = #state{is_begin = false}) ->
    {noreply, State};
handle_cast({reset_groups, Groups},
	    State = #state{is_begin = false}) ->
    [ets:insert(group_control, G) || G <- Groups],
    activity_global:set_and_push(103, 1, []),
    start_zero_timer(),
    {noreply, State#state{is_begin = true}};
handle_cast({reset_groups, []},
	    State = #state{is_begin = true}) ->
    ets:delete_all_objects(group_control),
    activity_global:set_and_push(103, 0, []),
    {noreply, State#state{is_begin = false}};
handle_cast({reset_groups, Groups},
	    State = #state{is_begin = true}) ->
    ets:delete_all_objects(group_control),
    [ets:insert(group_control, G) || G <- Groups],
    {noreply, State#state{is_begin = true}};
handle_cast({add_process_val, QuestId, Val},
	    State = #state{srv_id = SrvId}) ->
    case ets:lookup(group_control, SrvId) of
      [GroupControl = #group_control{step = Step,
				     val = CurrentVal, is_finished = false}] ->
	  #group_control_data{need_value = NeedVal,
			      step_quest = Quests} =
	      group_control_data:get_group_control_data(Step),
	  case lists:member(QuestId, Quests) of
	    true ->
		NewGroupControl = do_add_process_val(GroupControl,
						     CurrentVal, NeedVal, Val),
		update_group_to_center(NewGroupControl);
	    false -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_cast({gm_add_process_val, Val},
	    State = #state{srv_id = SrvId}) ->
    case ets:lookup(group_control, SrvId) of
      [GroupControl = #group_control{step = Step,
				     val = CurrentVal, is_finished = false}] ->
	  #group_control_data{need_value = NeedVal,
			      step_quest = Quests} =
	      group_control_data:get_group_control_data(Step),
	  case Quests of
	    [] -> ok;
	    _ ->
		NewGroupControl = do_add_process_val(GroupControl,
						     CurrentVal, NeedVal, Val),
		update_group_to_center(NewGroupControl)
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_cast({gm_clean_process},
	    State = #state{srv_id = SrvId}) ->
    case ets:lookup(group_control, SrvId) of
      [GroupControl = #group_control{}] ->
	  NewGroupControl = GroupControl#group_control{step = 1,
						       val = 0,
						       is_finished = false},
	  update_group_to_center(NewGroupControl);
      _ -> ok
    end,
    {noreply, State};
handle_cast(_Request, State) -> {noreply, State}.

-spec handle_info(Info :: timeout() | term(),
		  State :: #state{}) -> {noreply, NewState :: #state{}} |
					{noreply, NewState :: #state{},
					 timeout() | hibernate} |
					{stop, Reason :: term(),
					 NewState :: #state{}}.

handle_info(zero_timer,
	    State = #state{is_begin = true, srv_id = SrvId}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidgroup_control_mgr302, _,
       {__Levelgroup_control_mgr302,
	__Tracesgroup_control_mgr302}}
	  when __Levelgroup_control_mgr302 band 64 /= 0 orelse
		 __Tracesgroup_control_mgr302 /= [] ->
	  lager:do_log(info,
		       [{module, group_control_mgr}, {function, handle_info},
			{line, 302}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "zero timer ", none, 4096, 64,
		       __Levelgroup_control_mgr302,
		       __Tracesgroup_control_mgr302, lager_event,
		       __Pidgroup_control_mgr302);
      _ -> ok
    end,
    start_zero_timer(),
    check_day_timeout(SrvId),
    {noreply, State};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidgroup_control_mgr308, _,
       {__Levelgroup_control_mgr308,
	__Tracesgroup_control_mgr308}}
	  when __Levelgroup_control_mgr308 band 64 /= 0 orelse
		 __Tracesgroup_control_mgr308 /= [] ->
	  lager:do_log(info,
		       [{module, group_control_mgr}, {function, handle_info},
			{line, 308}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("info not process ~w, state ~w",
				     [_Info, State]),
		       none, 4096, 64, __Levelgroup_control_mgr308,
		       __Tracesgroup_control_mgr308, lager_event,
		       __Pidgroup_control_mgr308);
      _ -> ok
    end,
    {noreply, State}.

-spec terminate(Reason :: normal | shutdown |
			  {shutdown, term()} | term(),
		State :: #state{}) -> term().

terminate(_Reason, _State) -> ok.

-spec code_change(OldVsn :: term() | {down, term()},
		  State :: #state{}, Extra :: term()) -> {ok,
							  NewState ::
							      #state{}} |
							 {error,
							  Reason :: term()}.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

sync_srv_group_to_center(SrvId, GroupId, SrvName) ->
    cluster_lib:cast(center, c_group_control_mgr,
		     sync_srv_from_zone, [SrvId, GroupId, SrvName]).

get_groups_from_center(SrvId, _GroupId) ->
    cluster_lib:cast(center, c_group_control_mgr,
		     sync_groups_to_zone, [SrvId]).

update_group_to_center(Group) ->
    cluster_lib:cast(center, c_group_control_mgr,
		     update_group_from_zone, [Group]).

do_add_process_val(GroupControl, CurrentVal, NeedVal,
		   AddVal) ->
    case CurrentVal + AddVal of
      N when N >= NeedVal ->
	  GroupControl#group_control{val = NeedVal,
				     is_finished = true};
      N -> GroupControl#group_control{val = N}
    end.

start_zero_timer() ->
    Seconds = date:next_diff({0, 0, 1}),
    util:set_timer(zero_timer, Seconds, zero_timer).

check_day_timeout(SrvId) ->
    case ets:lookup(group_control, SrvId) of
      [GroupControl = #group_control{time = BeginTime,
				     step = Step, is_finished = false}] ->
	  case group_control_data:get_constant(max_level) of
	    Max when Step >= Max -> ok;
	    _ ->
		D = date:day_diff(BeginTime, date:unixtime()),
		#group_control_data{timeout_day = TimeoutDay,
				    need_value = NeedVal} =
		    group_control_data:get_group_control_data(Step),
		case D >= TimeoutDay of
		  true ->
		      NewGroupControl = GroupControl#group_control{val =
								       NeedVal,
								   is_finished =
								       true},
		      update_group_to_center(NewGroupControl);
		  false -> ok
		end
	  end;
      _ -> ok
    end.


