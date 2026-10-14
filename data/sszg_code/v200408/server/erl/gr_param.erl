-file("src/gr_param.erl", 1).

-module(gr_param).

-behaviour(gen_server).

-export([start_link/1, list/1, insert/2, lookup/2,
	 lookup_element/2, info/1, info_size/1, transform/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {table_id, waiting = []}).

list(Server) ->
    case catch gen_server:call(Server, list) of
      {'EXIT', _Reason} ->
	  list(gr_manager:wait_for_pid(Server));
      Else -> Else
    end.

info_size(Server) ->
    case catch gen_server:call(Server, info_size) of
      {'EXIT', _Reason} ->
	  info_size(gr_manager:wait_for_pid(Server));
      Else -> Else
    end.

insert(Server, Term) ->
    case catch gen_server:call(Server, {insert, Term}) of
      {'EXIT', _Reason} ->
	  insert(gr_manager:wait_for_pid(Server), Term);
      Else -> Else
    end.

lookup(Server, Term) ->
    case catch gen_server:call(Server, {lookup, Term}) of
      {'EXIT', _Reason} ->
	  lookup(gr_manager:wait_for_pid(Server), Term);
      Else -> Else
    end.

lookup_element(Server, Term) ->
    case catch gen_server:call(Server,
			       {lookup_element, Term})
	of
      {'EXIT', _Reason} ->
	  lookup_element(gr_manager:wait_for_pid(Server), Term);
      Else -> Else
    end.

info(Server) ->
    case catch gen_server:call(Server, info) of
      {'EXIT', _Reason} ->
	  info(gr_manager:wait_for_pid(Server));
      Else -> Else
    end.

transform(Server) ->
    case catch gen_server:call(Server, transform) of
      {'EXIT', _Reason} ->
	  transform(gr_manager:wait_for_pid(Server));
      Else -> Else
    end.

start_link(Name) ->
    gen_server:start_link({local, Name}, gr_param, [], []).

init([]) -> {ok, #state{}}.

handle_call(Call, From, State)
    when is_atom(Call), Call =:= list;
	 Call =:= info;
	 Call =:= info_size;
	 Call =:= transform ->
    TableId = State#state.table_id,
    Waiting = State#state.waiting,
    case TableId of
      undefined ->
	  {noreply,
	   State#state{waiting = [{Call, From} | Waiting]}};
      _ when Call =:= list ->
	  {reply, handle_list(TableId), State};
      _ when Call =:= info ->
	  {reply, handle_info(TableId), State};
      _ when Call =:= info_size ->
	  {reply, handle_info_size(TableId), State};
      _ when Call =:= transform ->
	  {reply, handle_transform(TableId), State}
    end;
handle_call({Call, Term}, From, State)
    when is_atom(Call), Call =:= insert;
	 Call =:= lookup;
	 Call =:= lookup_element ->
    TableId = State#state.table_id,
    Waiting = State#state.waiting,
    case TableId of
      undefined ->
	  {noreply,
	   State#state{waiting =
			   [{{Call, Term}, From} | Waiting]}};
      _ when Call =:= insert ->
	  {reply, handle_insert(TableId, Term), State};
      _ when Call =:= lookup ->
	  {reply, handle_lookup(TableId, Term), State};
      _ when Call =:= lookup_element ->
	  {reply, handle_lookup_element(TableId, Term), State}
    end;
handle_call(_Request, _From, State) ->
    Reply = {error, unhandled_message},
    {reply, Reply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({'ETS-TRANSFER', TableId, _Pid, _Data},
	    State) ->
    _ = [gen_server:reply(From, perform_call(TableId, Call))
	 || {Call, From} <- State#state.waiting],
    {noreply,
     State#state{table_id = TableId, waiting = []}};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

perform_call(TableId, Call) ->
    case Call of
      list -> handle_list(TableId);
      info -> handle_info(TableId);
      info_size -> handle_info_size(TableId);
      transform -> handle_transform(TableId);
      {insert, Term} -> handle_insert(TableId, Term);
      {lookup, Term} -> handle_lookup(TableId, Term);
      {lookup_element, Term} ->
	  handle_lookup_element(TableId, Term)
    end.

handle_list(TableId) -> ets:tab2list(TableId).

handle_info(TableId) -> ets:info(TableId).

handle_info_size(TableId) -> ets:info(TableId, size).

handle_transform(TableId) ->
    ParamsList = [{K, V}
		  || {V, K} <- ets:tab2list(TableId)],
    ets:delete_all_objects(TableId),
    ets:insert(TableId, ParamsList).

handle_insert(TableId, Term) ->
    ets:insert(TableId, Term).

handle_lookup(TableId, Term) ->
    ets:lookup(TableId, Term).

handle_lookup_element(TableId, Term) ->
    ets:lookup_element(TableId, Term, 2).


