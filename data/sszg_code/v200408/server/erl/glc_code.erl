-file("src/glc_code.erl", 1).

-module(glc_code).

-compile({nowarn_unused_function,
	  {abstract_module, 2}}).

-compile({nowarn_unused_function,
	  {abstract_tables, 1}}).

-compile({nowarn_unused_function, {abstract_reset, 0}}).

-compile({nowarn_unused_function,
	  {abstract_filter, 3}}).

-compile({nowarn_unused_function,
	  {abstract_filter_, 4}}).

-compile({nowarn_unused_function,
	  {abstract_opfilter, 6}}).

-compile({nowarn_unused_function, {abstract_all, 4}}).

-compile({nowarn_unused_function, {abstract_any, 4}}).

-compile({nowarn_unused_function, {abstract_with, 3}}).

-compile({nowarn_unused_function,
	  {abstract_within, 3}}).

-compile({nowarn_unused_function,
	  {abstract_getkey, 4}}).

-compile({nowarn_unused_function,
	  {abstract_getkey_, 4}}).

-compile({nowarn_unused_function,
	  {abstract_getparam, 3}}).

-compile({nowarn_unused_function, {param_variable, 1}}).

-compile({nowarn_unused_function, {field_variable, 1}}).

-compile({nowarn_unused_function,
	  {field_variable_, 1}}).

-compile({nowarn_unused_function, {compile_forms, 2}}).

-compile({nowarn_unused_function, {load_binary, 2}}).

-export([compile/2]).

-record(module,
	{query  :: term(), tables  :: [{atom(), atom()}],
	 qtree  :: term(), store  :: term()}).

-type syntaxTree() :: erl_syntax:syntaxTree().

-record(state,
	{event = undefined  :: syntaxTree(),
	 fields = []  :: [{atom(), syntaxTree()}],
	 fieldc = 0  :: non_neg_integer(),
	 paramvars = []  :: [{term(), syntaxTree()}],
	 paramstab = undefined  :: atom(),
	 countstab = undefined  :: atom()}).

-type nextFun() :: fun((#state{}) -> [syntaxTree()]).

compile(Module, ModuleData) ->
    {ok, forms, Forms} = abstract_module(Module,
					 ModuleData),
    {ok, Module, Binary} = compile_forms(Forms,
					 [nowarn_unused_vars]),
    {ok, loaded, Module} = load_binary(Module, Binary),
    {ok, Module}.

-spec abstract_module(atom(), #module{}) -> {ok, forms,
					     list()}.

abstract_module(Module, Data) ->
    Forms = [erl_syntax:revert(E)
	     || E <- abstract_module_(Module, Data)],
    case lists:keyfind(errors, 1,
		       erl_syntax_lib:analyze_forms(Forms))
	of
      false -> {ok, forms, Forms};
      {_, []} -> {ok, forms, Forms};
      {_, [_ | _]} = Errors -> Errors
    end.

-spec abstract_module_(atom(),
		       #module{}) -> [erl_syntax:syntaxTree()].

abstract_module_(Module,
		 #module{tables = Tables, qtree = Tree, store = Store} =
		     Data) ->
    {_, ParamsTable} = lists:keyfind(params, 1, Tables),
    {_, CountsTable} = lists:keyfind(counters, 1, Tables),
    AbstractMod =
	[erl_syntax:attribute(erl_syntax:atom(module),
			      [erl_syntax:atom(Module)]),
	 erl_syntax:attribute(erl_syntax:atom(export),
			      [erl_syntax:list([erl_syntax:arity_qualifier(erl_syntax:atom(get),
									   erl_syntax:integer(1)),
						erl_syntax:arity_qualifier(erl_syntax:atom(info),
									   erl_syntax:integer(1)),
						erl_syntax:arity_qualifier(erl_syntax:atom(reset_counters),
									   erl_syntax:integer(1)),
						erl_syntax:arity_qualifier(erl_syntax:atom(table),
									   erl_syntax:integer(1)),
						erl_syntax:arity_qualifier(erl_syntax:atom(runjob),
									   erl_syntax:integer(2)),
						erl_syntax:arity_qualifier(erl_syntax:atom(handle),
									   erl_syntax:integer(1))])]),
	 erl_syntax:function(erl_syntax:atom(get),
			     abstract_get(Data) ++
			       [erl_syntax:clause([erl_syntax:underscore()],
						  none,
						  [erl_syntax:abstract({error,
									undefined})])]),
	 erl_syntax:function(erl_syntax:atom(info),
			     abstract_info(Data) ++
			       [erl_syntax:clause([erl_syntax:underscore()],
						  none,
						  [abstract_apply(erlang, error,
								  [erl_syntax:atom(badarg)])])]),
	 erl_syntax:function(erl_syntax:atom(reset_counters),
			     abstract_reset() ++
			       [erl_syntax:clause([erl_syntax:underscore()],
						  none,
						  [abstract_apply(erlang, error,
								  [erl_syntax:atom(badarg)])])]),
	 erl_syntax:function(erl_syntax:atom(table),
			     abstract_tables(Tables) ++
			       [erl_syntax:clause([erl_syntax:underscore()],
						  none,
						  [abstract_apply(erlang, error,
								  [erl_syntax:atom(badarg)])])]),
	 erl_syntax:function(erl_syntax:atom(handle),
			     [erl_syntax:clause([erl_syntax:variable("Event")],
						none,
						[abstract_count(input),
						 erl_syntax:application(none,
									erl_syntax:atom(handle_),
									[erl_syntax:variable("Event")])])]),
	 erl_syntax:function(erl_syntax:atom(runjob),
			     [erl_syntax:clause([erl_syntax:variable("Fun"),
						 erl_syntax:variable("Event")],
						none,
						[abstract_count(job_input),
						 erl_syntax:application(none,
									erl_syntax:atom(job_),
									[erl_syntax:variable("Fun"),
									 erl_syntax:variable("Event")])])]),
	 erl_syntax:function(erl_syntax:atom(handle_),
			     [erl_syntax:clause([erl_syntax:variable("Event")],
						none,
						abstract_filter(Tree, Data,
								#state{event =
									   erl_syntax:variable("Event"),
								       paramstab
									   =
									   ParamsTable,
								       countstab
									   =
									   CountsTable}))]),
	 erl_syntax:function(erl_syntax:atom(job_),
			     [erl_syntax:clause([erl_syntax:variable("Fun"),
						 erl_syntax:variable("Meta")],
						none,
						[erl_syntax:application(none,
									erl_syntax:atom(job_result),
									[erl_syntax:catch_expr(abstract_apply(glc_run,
													      execute,
													      [erl_syntax:variable("Fun"),
													       erl_syntax:list([erl_syntax:variable("Meta"),
																erl_syntax:abstract(Store)])])),
									 erl_syntax:variable("Meta")])])]),
	 erl_syntax:function(erl_syntax:atom(job_result),
			     abstract_runjob(Data))],
    gr_param:transform(ParamsTable),
    AbstractMod.

abstract_tables(Tables) ->
    [erl_syntax:clause([erl_syntax:abstract(K)], none,
		       [erl_syntax:abstract(V)])
     || {K, V} <- Tables].

abstract_query_find(K, Store) ->
    case lists:keyfind(K, 1, Store) of
      {_, Val} -> {ok, Val};
      _ -> {error, notfound}
    end.

abstract_query({with, Query, _}) ->
    [erl_syntax:abstract(Query)];
abstract_query([{with, _Query, _} | _] = I) ->
    [erl_syntax:abstract([Query || {with, Query, _} <- I])];
abstract_query({any, [{with, _Q, _A} | _] = I}) ->
    Queries = glc_lib:reduce(glc:any([Q
				      || {with, Q, _} <- I])),
    [erl_syntax:abstract(Queries)];
abstract_query({all, [{with, _Q, _A} | _] = I}) ->
    Queries = glc_lib:reduce(glc:all([Q
				      || {with, Q, _} <- I])),
    [erl_syntax:abstract(Queries)];
abstract_query(Query) -> [erl_syntax:abstract(Query)].

abstract_get(#module{query = _Query,
		     store = undefined}) ->
    [];
abstract_get(#module{query = _Query, store = Store}) ->
    [erl_syntax:clause([erl_syntax:abstract(K)], none,
		       abstract_query(abstract_query_find(K, Store)))
     || {K, _} <- Store].

abstract_runjob(#module{query = _Query,
			store = _Store}) ->
    Time = abstract_apply(erlang, '/',
			  [erl_syntax:variable("Time"),
			   erl_syntax:abstract(1000000)]),
    [erl_syntax:clause([erl_syntax:variable("JobResult"),
			erl_syntax:variable("Meta")],
		       none,
		       [erl_syntax:case_expr(erl_syntax:variable("JobResult"),
					     [erl_syntax:clause([erl_syntax:tuple([erl_syntax:variable("Time"),
										   erl_syntax:variable("Result")])],
								none,
								[erl_syntax:case_expr(erl_syntax:variable("Result"),
										      [erl_syntax:clause([erl_syntax:tuple([erl_syntax:atom(error),
															    erl_syntax:variable("Reason")])],
													 none,
													 [abstract_count(input),
													  abstract_count(job_error),
													  erl_syntax:application(none,
																 erl_syntax:atom(handle_),
																 abstract_job(Time,
																	      [erl_syntax:tuple([erl_syntax:atom(error),
																				 erl_syntax:variable("Reason")])])),
													  abstract_count(job_time,
															 erl_syntax:variable("Time")),
													  erl_syntax:tuple([erl_syntax:variable("Time"),
															    erl_syntax:tuple([erl_syntax:atom(error),
																	      erl_syntax:variable("Reason")])])]),
										       erl_syntax:clause([erl_syntax:variable("Result")],
													 none,
													 [abstract_count(input),
													  abstract_count(job_run),
													  erl_syntax:application(none,
																 erl_syntax:atom(handle_),
																 abstract_job(Time)),
													  abstract_count(job_time,
															 erl_syntax:variable("Time")),
													  erl_syntax:tuple([erl_syntax:variable("Time"),
															    erl_syntax:variable("Result")])])])])])])].

abstract_job(Time) -> abstract_job(Time, []).

abstract_job(Time, Error) ->
    Pairs = abstract_apply(gre, pairs,
			   [erl_syntax:variable("Meta")]),
    Runtime =
	erl_syntax:list([erl_syntax:tuple([erl_syntax:atom(runtime),
					   Time])]),
    [abstract_apply(gre, make,
		    [abstract_apply(erlang, '++',
				    [erl_syntax:list(Error),
				     abstract_apply(erlang, '++',
						    [Pairs, Runtime])]),
		     erl_syntax:abstract([list])])].

abstract_info(#module{query = Query}) ->
    [erl_syntax:clause([erl_syntax:abstract(K)], none, V)
     || {K, V}
	    <- [{query, abstract_query(Query)},
		{input, abstract_getcount(input)},
		{filter, abstract_getcount(filter)},
		{output, abstract_getcount(output)},
		{job_input, abstract_getcount(job_input)},
		{job_run, abstract_getcount(job_run)},
		{job_time, abstract_getcount(job_time)},
		{job_error, abstract_getcount(job_error)}]].

abstract_reset() ->
    [erl_syntax:clause([erl_syntax:abstract(K)], none, V)
     || {K, V}
	    <- [{all,
		 abstract_resetcount([input, filter, output, job_input,
				      job_run, job_time, job_error])},
		{input, abstract_resetcount(input)},
		{filter, abstract_resetcount(filter)},
		{output, abstract_resetcount(output)},
		{job_input, abstract_resetcount(job_input)},
		{job_run, abstract_resetcount(job_run)},
		{job_time, abstract_resetcount(job_time)},
		{job_error, abstract_resetcount(job_error)}]].

-spec abstract_filter(glc_ops:op() | [glc_ops:op()],
		      #module{}, #state{}) -> [syntaxTree()].

abstract_filter({Type, [{with, _Cond, _Fun} | _] = I},
		Data, State)
    when Type =:= all; Type =:= any ->
    Cond = glc_lib:reduce(glc:Type([Q
				    || {with, Q, _} <- I])),
    abstract_filter_(Cond,
		     _OnMatch = fun (State2) ->
					Funs = [F || {with, _, F} <- I],
					[abstract_count(output)] ++
					  abstract_with(Funs, Data, State2)
				end,
		     _OnNomatch = fun (_State2) -> [abstract_count(filter)]
				  end,
		     State);
abstract_filter([{with, _Cond, _Fun} | _] = I, Data,
		State) ->
    OnNomatch = fun (_State2) -> [abstract_count(filter, 0)]
		end,
    Funs = lists:foldr(fun ({with, Cond, Fun}, Acc) ->
			       [{Cond, Fun, Data} | Acc]
		       end,
		       [], I),
    abstract_within(Funs, OnNomatch, State);
abstract_filter({with, Cond, Fun}, Data, State) ->
    abstract_filter_(Cond,
		     _OnMatch = fun (State2) ->
					[abstract_count(output)] ++
					  abstract_with(Fun, Data, State2)
				end,
		     _OnNomatch = fun (_State2) -> [abstract_count(filter)]
				  end,
		     State);
abstract_filter(Cond, _Data, State) ->
    abstract_filter_(Cond,
		     _OnMatch = fun (_State2) -> [abstract_count(output)]
				end,
		     _OnNomatch = fun (_State2) -> [abstract_count(filter)]
				  end,
		     State).

-spec abstract_filter_(glc_ops:op(), nextFun(),
		       nextFun(), #state{}) -> syntaxTree().

abstract_filter_({null, true}, OnMatch, _OnNomatch,
		 State) ->
    OnMatch(State);
abstract_filter_({null, false}, _OnMatch, OnNomatch,
		 State) ->
    OnNomatch(State);
abstract_filter_({Key, '*'}, OnMatch, OnNomatch,
		 State) ->
    abstract_getkey(Key,
		    _OnMatch = fun (#state{} = State2) -> OnMatch(State2)
			       end,
		    _OnNomatch = fun (State2) -> OnNomatch(State2) end,
		    State);
abstract_filter_({Key, '!'}, OnMatch, OnNomatch,
		 State) ->
    abstract_getkey(Key,
		    _OnNomatch = fun (State2) -> OnNomatch(State2) end,
		    _OnMatch = fun (#state{} = State2) -> OnMatch(State2)
			       end,
		    State);
abstract_filter_({Key, Op, Value}, OnMatch, OnNomatch,
		 State)
    when Op =:= '>';
	 Op =:= '=';
	 Op =:= '!=';
	 Op =:= '<';
	 Op =:= '>=';
	 Op =:= '=<';
	 Op =:= '<=' ->
    Op2 = case Op of
	    '=' -> '=:=';
	    '!=' -> '=/=';
	    '<=' -> '=<';
	    Op -> Op
	  end,
    abstract_opfilter(Key, Op2, Value, OnMatch, OnNomatch,
		      State);
abstract_filter_({any, Conds}, OnMatch, OnNomatch,
		 State) ->
    abstract_any(Conds, OnMatch, OnNomatch, State);
abstract_filter_({all, Conds}, OnMatch, OnNomatch,
		 State) ->
    abstract_all(Conds, OnMatch, OnNomatch, State).

-spec abstract_opfilter(atom(), atom(), term(),
			nextFun(), nextFun(), #state{}) -> [syntaxTree()].

abstract_opfilter(Key, Opname, Value, OnMatch,
		  OnNomatch, State) ->
    abstract_getkey(Key,
		    _OnMatch = fun (#state{} = State2) ->
				       [erl_syntax:case_expr(abstract_apply(erlang,
									    Opname,
									    [erl_syntax:variable(field_variable(Key)),
									     erl_syntax:abstract(Value)]),
							     [erl_syntax:clause([erl_syntax:atom(true)],
										none,
										OnMatch(State2)),
							      erl_syntax:clause([erl_syntax:atom(false)],
										none,
										OnNomatch(State2))])]
			       end,
		    _OnNomatch = fun (State2) -> OnNomatch(State2) end,
		    State).

-spec abstract_all([glc_ops:op()], nextFun(), nextFun(),
		   #state{}) -> [syntaxTree()].

abstract_all([H | T], OnMatch, OnNomatch, State) ->
    abstract_filter_(H,
		     _OnMatch = fun (State2) ->
					abstract_all(T, OnMatch, OnNomatch,
						     State2)
				end,
		     OnNomatch, State);
abstract_all([], OnMatch, _OnNomatch, State) ->
    OnMatch(State).

-spec abstract_any([glc_ops:op()], nextFun(), nextFun(),
		   #state{}) -> [syntaxTree()].

abstract_any([H | T], OnMatch, OnNomatch, State) ->
    abstract_filter_(H, OnMatch,
		     _OnNomatch = fun (State2) ->
					  abstract_any(T, OnMatch, OnNomatch,
						       State2)
				  end,
		     State);
abstract_any([], _OnMatch, OnNomatch, State) ->
    OnNomatch(State).

-spec abstract_with((gre:event()) -> term(), #module{},
		    #state{}) -> [syntaxTree()].

abstract_with([Fun0 | _] = Funs, Data, State)
    when is_function(Fun0, 1); is_function(Fun0, 2) ->
    abstract_getparam(Funs,
		      fun (#state{event = Event, paramvars = Params}) ->
			      lists:map(fun (Fun) ->
						{_, Fun2} = lists:keyfind(Fun,
									  1,
									  Params),
						abstract_with_({Fun, Fun2},
							       Event, Data)
					end,
					Funs)
		      end,
		      State);
abstract_with(Fun, Data, State)
    when is_function(Fun, 1); is_function(Fun, 2) ->
    abstract_getparam(Fun,
		      fun (#state{event = Event, paramvars = Params}) ->
			      {_, Fun2} = lists:keyfind(Fun, 1, Params),
			      [abstract_with_({Fun, Fun2}, Event, Data)]
		      end,
		      State).

abstract_within([{H, Fun, Data} | T], OnNomatch,
		State) ->
    OnMatch = fun (State2) ->
		      [abstract_count(output)] ++
			abstract_with(Fun, Data, State2) ++
			  abstract_within(T, OnNomatch, State2)
	      end,
    abstract_filter_(H, OnMatch,
		     _OnNomatch = fun (State2) ->
					  [abstract_count(filter)] ++
					    abstract_within(T, OnNomatch,
							    State2)
				  end,
		     State);
abstract_within([], OnNomatch, State) ->
    OnNomatch(State).

abstract_with_({Fun, Fun2}, Event,
	       #module{store = Store}) ->
    erl_syntax:application(none, Fun2,
			   case Fun of
			     _ when is_function(Fun, 1) -> [Event];
			     _ when is_function(Fun, 2) ->
				 [Event, erl_syntax:abstract(Store)]
			   end).

-spec abstract_getkey(atom(), nextFun(), nextFun(),
		      #state{}) -> [syntaxTree()].

abstract_getkey(Key, OnMatch, OnNomatch,
		#state{fields = Fields} = State) ->
    case lists:keyfind(Key, 1, Fields) of
      {Key, _Variable} -> OnMatch(State);
      false ->
	  abstract_getkey_(Key, OnMatch, OnNomatch, State)
    end.

-spec abstract_getkey_(atom(), nextFun(), nextFun(),
		       #state{}) -> [syntaxTree()].

abstract_getkey_(Key, OnMatch, OnNomatch,
		 #state{event = Event, fields = Fields} = State) ->
    [erl_syntax:case_expr(abstract_apply(gre, find,
					 [erl_syntax:atom(Key), Event]),
			  [erl_syntax:clause([erl_syntax:tuple([erl_syntax:atom(true),
								erl_syntax:variable(field_variable(Key))])],
					     none,
					     OnMatch(State#state{fields =
								     [{Key,
								       erl_syntax:variable(field_variable(Key))}
								      | Fields]})),
			   erl_syntax:clause([erl_syntax:atom(false)], none,
					     OnNomatch(State))])].

-spec abstract_getparam(term(), nextFun(),
			#state{}) -> [syntaxTree()].

abstract_getparam([_ | _] = Terms, OnBound,
		  #state{paramvars = _Params, fields = _Fields,
			 paramstab = _ParamsTable} =
		      State)
    when is_list(Terms) ->
    {Keys, Bound} = lists:foldl(fun (Term,
				     {Acc0,
				      #state{paramvars = Params,
					     paramstab = ParamsTable} =
					  State0}) ->
					case lists:keyfind(Term, 1, Params) of
					  {_, _Variable} -> {Acc0, State0};
					  false ->
					      Key = abstract_getparam_key(Term,
									  ParamsTable),
					      Lookup = abstract_apply(gr_param,
								      lookup_element,
								      [abstract_apply(table,
										      [erl_syntax:atom(params)]),
								       erl_syntax:abstract(Key)]),
					      Expr =
						  erl_syntax:match_expr(param_variable(Key),
									Lookup),
					      State1 = State0#state{paramvars =
									[{Term,
									  param_variable(Key)}
									 | Params]},
					      {[Expr | Acc0], State1}
					end
				end,
				{[], State}, Terms),
    Keys ++ OnBound(Bound);
abstract_getparam(Term, OnBound,
		  #state{paramvars = Params} = State) ->
    case lists:keyfind(Term, 1, Params) of
      {_, _Variable} -> OnBound(State);
      false -> abstract_getparam([Term], OnBound, State)
    end.

abstract_getparam_key(Term, ParamsTable) ->
    case gr_param:lookup(ParamsTable, Term) of
      [{_, Key2}] -> Key2;
      [] ->
	  Key2 = gr_param:info_size(ParamsTable),
	  gr_param:insert(ParamsTable, {Term, Key2}),
	  Key2
    end.

-spec field_variable(atom()) -> string().

field_variable(Key) ->
    "Field_" ++ field_variable_(atom_to_list(Key)).

-spec field_variable_(string()) -> string().

field_variable_([H | T]) when H >= $0, H =< $9 ->
    [H | field_variable_(T)];
field_variable_([H | T]) when H >= $A, H =< $Z ->
    [H | field_variable_(T)];
field_variable_([H | T]) when H >= $a, H =< $z ->
    [H | field_variable_(T)];
field_variable_([H | T]) ->
    "_" ++
      integer_to_list(H, 16) ++ "_" ++ field_variable_(T);
field_variable_([]) -> [].

-spec param_variable(integer()) -> syntaxTree().

param_variable(Key) ->
    erl_syntax:variable("Param_" ++ integer_to_list(Key)).

-spec abstract_count(atom()) -> syntaxTree().

abstract_count(Counter) -> abstract_count(Counter, 1).

abstract_count(Counter, Value) when is_integer(Value) ->
    abstract_apply(gr_counter, update_counter,
		   [abstract_apply(table, [erl_syntax:atom(counters)]),
		    erl_syntax:abstract(Counter),
		    erl_syntax:abstract({2, Value})]);
abstract_count(Counter, Value) ->
    abstract_apply(gr_counter, update_counter,
		   [abstract_apply(table, [erl_syntax:atom(counters)]),
		    erl_syntax:abstract(Counter),
		    erl_syntax:tuple([erl_syntax:abstract(2), Value])]).

-spec abstract_getcount(atom()) -> [syntaxTree()].

abstract_getcount(Counter) when is_atom(Counter) ->
    abstract_getcount(erl_syntax:abstract(Counter));
abstract_getcount(Counter) ->
    [abstract_apply(gr_counter, lookup_element,
		    [abstract_apply(table, [erl_syntax:atom(counters)]),
		     Counter])].

-spec abstract_resetcount(atom() |
			  [filter | input | output | job_input | job_run |
			   job_time | job_error]) -> [syntaxTree()].

abstract_resetcount(Counter) ->
    [abstract_apply(gr_counter, reset_counters,
		    [abstract_apply(table, [erl_syntax:atom(counters)]),
		     erl_syntax:abstract(Counter)])].

-spec compile_forms(term(), [term()]) -> {ok, atom(),
					  binary()}.

compile_forms(Forms, Opts) ->
    case compile:forms(Forms, Opts) of
      {ok, Module, Binary} -> {ok, Module, Binary};
      {ok, Module, Binary, _Warnings} -> {ok, Module, Binary};
      Error -> erlang:error({compile_forms, Error})
    end.

-spec load_binary(atom(), binary()) -> {ok, loaded,
					atom()}.

load_binary(Module, Binary) ->
    case code:load_binary(Module, "", Binary) of
      {module, Module} -> {ok, loaded, Module};
      {error, Reason} ->
	  exit({error_loading_module, Module, Reason})
    end.

-spec abstract_apply(atom(), atom(),
		     [syntaxTree()]) -> syntaxTree().

abstract_apply(Module, Function, Arguments) ->
    erl_syntax:application(erl_syntax:atom(Module),
			   erl_syntax:atom(Function), Arguments).

-spec abstract_apply(atom(),
		     [syntaxTree()]) -> syntaxTree().

abstract_apply(Function, Arguments) ->
    erl_syntax:application(erl_syntax:atom(Function),
			   Arguments).


