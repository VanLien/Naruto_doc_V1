-file("src/gr_manager.erl", 1).

-module(gr_manager).

-behaviour(gen_server).

-export([start_link/3, wait_for_pid/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state,
	{table_id  :: ets:tab(), managee  :: atom()}).

-spec setup(atom() | pid(), term()) -> ok.

setup(Name, Data) ->
    gen_server:cast(Name, {setup, Data}).

start_link(Name, Managee, Data) ->
    gen_server:start_link({local, Name}, gr_manager,
			  [Managee, Data], []).

init([Managee, Data]) ->
    process_flag(trap_exit, true),
    setup(self(), Data),
    {ok, #state{managee = Managee}}.

handle_call(_Request, _From, State) ->
    Reply = {error, unhandled_message},
    {reply, Reply, State}.

handle_cast({setup, Data},
	    State = #state{managee = Managee}) ->
    ManageePid = whereis(Managee),
    link(ManageePid),
    TableId = ets:new(gr_manager, [set, private]),
    ets:insert(TableId, Data),
    ets:setopts(TableId, {heir, self(), Data}),
    ets:give_away(TableId, ManageePid, Data),
    {noreply, State#state{table_id = TableId}};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info({'EXIT', _Pid, _Reason}, State) ->
    {noreply, State};
handle_info({'ETS-TRANSFER', TableId, _Pid, Data},
	    State = #state{managee = Managee}) ->
    ManageePid = wait_for_pid(Managee),
    link(ManageePid),
    ets:give_away(TableId, ManageePid, Data),
    {noreply, State#state{table_id = TableId}}.

-spec wait_for_pid(atom()) -> pid().

wait_for_pid(Managee) when is_pid(Managee) -> Managee;
wait_for_pid(Managee)
    when is_atom(Managee), Managee =/= undefined ->
    case whereis(Managee) of
      undefined -> timer:sleep(1), wait_for_pid(Managee);
      ManageePid -> ManageePid
    end.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


