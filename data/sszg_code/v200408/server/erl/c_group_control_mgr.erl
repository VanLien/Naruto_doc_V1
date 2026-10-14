-file("src/mod/group_control/c_group_control_mgr.erl",
      1).

-module(c_group_control_mgr).

-lager_records([{group_control_quest_data,
		 [quest_id, desc, add_value]},
		{group_control_data,
		 [step, name, need_value, timeout_day, step_quest,
		  step_function, step_reward, desc]},
		{group_control,
		 [id, group_id, name, status, step, val, time, is_auto,
		  is_finished, ext]},
		{state, []}]).

-behaviour(gen_server).

-export([start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([sync_srv_from_zone/3, sync_groups_to_zone/1,
	 update_group_from_zone/1]).

-record(state, {}).

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

-file("src/mod/group_control/c_group_control_mgr.erl",
      30).

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

-file("src/mod/group_control/c_group_control_mgr.erl",
      31).

-spec start_link() -> {ok, Pid :: pid()} | ignore |
		      {error, Reason :: term()}.

start_link() ->
    gen_server:start_link({local, c_group_control_mgr},
			  c_group_control_mgr, [], []).

sync_srv_from_zone(SrvId, GroupId, SrvName) ->
    gen_server:cast(c_group_control_mgr,
		    {sync_srv_from_zone, SrvId, GroupId, SrvName}).

sync_groups_to_zone(SrvId) ->
    gen_server:cast(c_group_control_mgr,
		    {sync_groups_to_zone, SrvId}).

update_group_from_zone(GroupControl) ->
    gen_server:cast(c_group_control_mgr,
		    {update_group_from_zone, GroupControl}).

-spec init(Args :: term()) -> {ok, State :: #state{}} |
			      {ok, State :: #state{}, timeout() | hibernate} |
			      {stop, Reason :: term()} | ignore.

init([]) ->
    dets:open_file(group_control,
		   [{file, "./dets/group_control_info.dets"},
		    {keypos, #group_control.id}, {type, set}]),
    ets:new(group_control,
	    [set, named_table, public,
	     {keypos, #group_control.id}]),
    ets:from_dets(group_control, group_control),
    {ok, #state{}}.

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

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

-spec handle_cast(Request :: term(),
		  State :: #state{}) -> {noreply, NewState :: #state{}} |
					{noreply, NewState :: #state{},
					 timeout() | hibernate} |
					{stop, Reason :: term(),
					 NewState :: #state{}}.

handle_cast({sync_srv_from_zone, SrvId, 0, _SrvName},
	    State) ->
    case ets:lookup(group_control, SrvId) of
      [] -> ok;
      [#group_control{group_id = GroupId}] ->
	  notice_server_del_to_groups(GroupId, SrvId),
	  delete_ets(SrvId)
    end,
    {noreply, State};
handle_cast({sync_srv_from_zone, SrvId, GroupId,
	     SrvName},
	    State) ->
    case ets:lookup(group_control, SrvId) of
      [#group_control{group_id = GroupId}] -> ok;
      [#group_control{group_id = OldGroupId}] ->
	  notice_server_del_to_groups(OldGroupId, SrvId),
	  Group = init_group_control(SrvId, GroupId, SrvName),
	  update_ets(Group),
	  notice_server_add_to_groups(GroupId, Group);
      [] ->
	  Group = init_group_control(SrvId, GroupId, SrvName),
	  update_ets(Group),
	  notice_server_add_to_groups(GroupId, Group)
    end,
    {noreply, State};
handle_cast({sync_groups_to_zone, SrvId}, State) ->
    Groups = case ets:lookup(group_control, SrvId) of
	       [] -> [];
	       [#group_control{group_id = GroupId}] ->
		   srv_of_group(GroupId)
	     end,
    notice_groups_to_zone(SrvId, Groups),
    {noreply, State};
handle_cast({update_group_from_zone,
	     GroupControl = #group_control{group_id = GroupId}},
	    State) ->
    update_ets(GroupControl),
    Groups0 = srv_of_group(GroupId),
    NewGroups = case is_all_srv_finish(Groups0) of
		  true ->
		      Now = date:unixtime(),
		      Groups1 = [G#group_control{step = Step + 1,
						 is_finished = false,
						 is_auto = false, time = Now}
				 || G = #group_control{step = Step} <- Groups0],
		      update_ets(Groups1),
		      Groups1;
		  false -> Groups0
		end,
    [notice_groups_to_zone(SrvId, NewGroups)
     || #group_control{id = SrvId} <- NewGroups],
    {noreply, State};
handle_cast(_Request, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_group_control_mgr162, _,
       {__Levelc_group_control_mgr162,
	__Tracesc_group_control_mgr162}}
	  when __Levelc_group_control_mgr162 band 8 /= 0 orelse
		 __Tracesc_group_control_mgr162 /= [] ->
	  lager:do_log(error,
		       [{module, c_group_control_mgr}, {function, handle_cast},
			{line, 162}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("handle cast not process ~w", [_Request]),
		       none, 4096, 8, __Levelc_group_control_mgr162,
		       __Tracesc_group_control_mgr162, lager_event,
		       __Pidc_group_control_mgr162);
      _ -> ok
    end,
    {noreply, State}.

-spec handle_info(Info :: timeout() | term(),
		  State :: #state{}) -> {noreply, NewState :: #state{}} |
					{noreply, NewState :: #state{},
					 timeout() | hibernate} |
					{stop, Reason :: term(),
					 NewState :: #state{}}.

handle_info(_Info, State) -> {noreply, State}.

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

delete_ets(SrvId) ->
    ets:delete(group_control, SrvId),
    dets:delete(group_control, SrvId).

update_ets(Group) ->
    ets:insert(group_control, Group),
    dets:insert(group_control, Group).

init_group_control(SrvId, GroupId, SrvName) ->
    #group_control{group_id = GroupId, id = SrvId,
		   time = date:unixtime(), val = 0, name = SrvName}.

srv_of_group(GroupId) ->
    ets:match_object(group_control,
		     #group_control{group_id = GroupId, _ = '_'}).

notice_server_del_to_groups(GroupId, SrvId) ->
    [cluster_lib:cast(TargetSrvId, group_control_mgr,
		      server_del, [SrvId])
     || #group_control{id = TargetSrvId}
	    <- srv_of_group(GroupId),
	TargetSrvId =/= SrvId].

notice_server_add_to_groups(GroupId,
			    Group = #group_control{id = SrvId}) ->
    [cluster_lib:cast(TargetSrvId, group_control_mgr,
		      server_add, [Group])
     || #group_control{id = TargetSrvId}
	    <- srv_of_group(GroupId),
	TargetSrvId =/= SrvId].

notice_groups_to_zone(SrvId, Groups) ->
    cluster_lib:cast(SrvId, group_control_mgr, reset_groups,
		     [Groups]).

is_all_srv_finish(Groups) ->
    lists:all(fun (#group_control{is_finished =
				      IsFinished}) ->
		      IsFinished =:= true
	      end,
	      Groups).


