-file("src/lager_transform.erl", 1).

-module(lager_transform).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_transform.erl", 27).

-export([parse_transform/2]).

parse_transform(AST, Options) ->
    TruncSize = proplists:get_value(lager_truncation_size,
				    Options, 4096),
    Enable = proplists:get_value(lager_print_records_flag,
				 Options, true),
    Sinks = [lager] ++
	      proplists:get_value(lager_extra_sinks, Options, []),
    put(print_records_flag, Enable),
    put(truncation_size, TruncSize),
    put(sinks, Sinks),
    erlang:put(records, []),
    guess_application(proplists:get_value(outdir, Options),
		      hd(AST)),
    NewAST = walk_ast([], AST),
    NewAST.

walk_ast(Acc, []) ->
    case get(print_records_flag) of
      true -> insert_record_attribute(Acc);
      false -> lists:reverse(Acc)
    end;
walk_ast(Acc,
	 [{attribute, _, module, {Module, _PmodArgs}} = H
	  | T]) ->
    put(module, Module), walk_ast([H | Acc], T);
walk_ast(Acc,
	 [{attribute, _, module, Module} = H | T]) ->
    put(module, Module), walk_ast([H | Acc], T);
walk_ast(Acc,
	 [{function, Line, Name, Arity, Clauses} | T]) ->
    put(function, Name),
    walk_ast([{function, Line, Name, Arity,
	       walk_clauses([], Clauses)}
	      | Acc],
	     T);
walk_ast(Acc,
	 [{attribute, _, record, {Name, Fields}} = H | T]) ->
    FieldNames = lists:map(fun record_field_name/1, Fields),
    stash_record({Name, FieldNames}),
    walk_ast([H | Acc], T);
walk_ast(Acc, [H | T]) -> walk_ast([H | Acc], T).

record_field_name({record_field, _,
		   {atom, _, FieldName}}) ->
    FieldName;
record_field_name({record_field, _,
		   {atom, _, FieldName}, _Default}) ->
    FieldName;
record_field_name({typed_record_field, Field, _Type}) ->
    record_field_name(Field).

walk_clauses(Acc, []) -> lists:reverse(Acc);
walk_clauses(Acc,
	     [{clause, Line, Arguments, Guards, Body} | T]) ->
    walk_clauses([{clause, Line, Arguments, Guards,
		   walk_body([], Body)}
		  | Acc],
		 T).

walk_body(Acc, []) -> lists:reverse(Acc);
walk_body(Acc, [H | T]) ->
    walk_body([transform_statement(H, get(sinks)) | Acc],
	      T).

transform_statement({call, Line,
		     {remote, _Line1, {atom, _Line2, Module},
		      {atom, _Line3, Function}},
		     Arguments0} =
			Stmt,
		    Sinks) ->
    case lists:member(Module, Sinks) of
      true ->
	  case lists:member(Function,
			    [debug, info, notice, warning, error, critical,
			     alert, emergency, none])
	      of
	    true ->
		SinkName = lager_util:make_internal_sink_name(Module),
		do_transform(Line, SinkName, Function, Arguments0);
	    false ->
		case lists:keyfind(Function, 1,
				   [{debug_unsafe, debug}, {info_unsafe, info},
				    {notice_unsafe, notice},
				    {warning_unsafe, warning},
				    {error_unsafe, error},
				    {critical_unsafe, critical},
				    {alert_unsafe, alert},
				    {emergency_unsafe, emergency}])
		    of
		  {Function, Severity} ->
		      SinkName = lager_util:make_internal_sink_name(Module),
		      do_transform(Line, SinkName, Severity, Arguments0,
				   unsafe);
		  false -> Stmt
		end
	  end;
      false ->
	  list_to_tuple(transform_statement(tuple_to_list(Stmt),
					    Sinks))
    end;
transform_statement(Stmt, Sinks) when is_tuple(Stmt) ->
    list_to_tuple(transform_statement(tuple_to_list(Stmt),
				      Sinks));
transform_statement(Stmt, Sinks) when is_list(Stmt) ->
    [transform_statement(S, Sinks) || S <- Stmt];
transform_statement(Stmt, _Sinks) -> Stmt.

do_transform(Line, SinkName, Severity, Arguments0) ->
    do_transform(Line, SinkName, Severity, Arguments0,
		 safe).

do_transform(Line, SinkName, Severity, Arguments0,
	     Safety) ->
    SeverityAsInt = lager_util:level_to_num(Severity),
    DefaultAttrs0 = {cons, Line,
		     {tuple, Line,
		      [{atom, Line, module}, {atom, Line, get(module)}]},
		     {cons, Line,
		      {tuple, Line,
		       [{atom, Line, function}, {atom, Line, get(function)}]},
		      {cons, Line,
		       {tuple, Line,
			[{atom, Line, line}, {integer, Line, Line}]},
		       {cons, Line,
			{tuple, Line,
			 [{atom, Line, pid},
			  {call, Line, {atom, Line, pid_to_list},
			   [{call, Line, {atom, Line, self}, []}]}]},
			{cons, Line,
			 {tuple, Line,
			  [{atom, Line, node},
			   {call, Line, {atom, Line, node}, []}]},
			 {call, Line,
			  {remote, Line, {atom, Line, lager}, {atom, Line, md}},
			  []}}}}}},
    DefaultAttrs = case erlang:get(application) of
		     undefined -> DefaultAttrs0;
		     App ->
			 concat_lists({cons, Line,
				       {tuple, Line,
					[{atom, Line, application},
					 {atom, Line, App}]},
				       {nil, Line}},
				      DefaultAttrs0)
		   end,
    {Meta, Message, Arguments} = handle_args(DefaultAttrs,
					     Line, Arguments0),
    LevelVar = make_varname("__Level", Line),
    TracesVar = make_varname("__Traces", Line),
    PidVar = make_varname("__Pid", Line),
    LogFun = case Safety of
	       safe -> do_log;
	       unsafe -> do_log_unsafe
	     end,
    {'case', Line,
     {tuple, Line,
      [{call, Line, {atom, Line, whereis},
	[{atom, Line, SinkName}]},
       {call, Line, {atom, Line, whereis},
	[{atom, Line, lager_event}]},
       {call, Line,
	{remote, Line, {atom, Line, lager_config},
	 {atom, Line, get}},
	[{tuple, Line,
	  [{atom, Line, SinkName}, {atom, Line, loglevel}]},
	 {tuple, Line, [{integer, Line, 0}, {nil, Line}]}]}]},
     [{clause, Line,
       [{tuple, Line,
	 [{atom, Line, undefined}, {atom, Line, undefined},
	  {var, Line, '_'}]}],
       [],
       [{call, Line,
	 {'fun', Line,
	  {clauses,
	   [{clause, Line, [], [],
	     [{tuple, Line,
	       [{atom, Line, error},
		{atom, Line, lager_not_running}]}]}]}},
	 []}]},
      {clause, Line,
       [{tuple, Line,
	 [{atom, Line, undefined}, {var, Line, '_'},
	  {var, Line, '_'}]}],
       [],
       [{call, Line,
	 {'fun', Line,
	  {clauses,
	   [{clause, Line, [], [],
	     [{tuple, Line,
	       [{atom, Line, error},
		{tuple, Line,
		 [{atom, Line, sink_not_configured},
		  {atom, Line, SinkName}]}]}]}]}},
	 []}]},
      {clause, Line,
       [{tuple, Line,
	 [{var, Line, PidVar}, {var, Line, '_'},
	  {tuple, Line,
	   [{var, Line, LevelVar}, {var, Line, TracesVar}]}]}],
       [[{op, Line, 'orelse',
	  {op, Line, '/=',
	   {op, Line, 'band', {var, Line, LevelVar},
	    {integer, Line, SeverityAsInt}},
	   {integer, Line, 0}},
	  {op, Line, '/=', {var, Line, TracesVar},
	   {nil, Line}}}]],
       [{call, Line,
	 {remote, Line, {atom, Line, lager},
	  {atom, Line, LogFun}},
	 [{atom, Line, Severity}, Meta, Message, Arguments,
	  {integer, Line, get(truncation_size)},
	  {integer, Line, SeverityAsInt}, {var, Line, LevelVar},
	  {var, Line, TracesVar}, {atom, Line, SinkName},
	  {var, Line, PidVar}]}]},
      {clause, Line, [{var, Line, '_'}], [],
       [{atom, Line, ok}]}]}.

handle_args(DefaultAttrs, Line,
	    [{cons, LineNum, {tuple, _, _}, _} = Attrs]) ->
    {concat_lists(DefaultAttrs, Attrs),
     {string, LineNum, ""}, {atom, Line, none}};
handle_args(DefaultAttrs, Line, [Format]) ->
    {DefaultAttrs, Format, {atom, Line, none}};
handle_args(DefaultAttrs, Line, [Arg1, Arg2]) ->
    case {element(1, Arg1), Arg1} of
      {_, {cons, _, {tuple, _, _}, _}} ->
	  {concat_lists(Arg1, DefaultAttrs), Arg2,
	   {atom, Line, none}};
      {Type, _}
	  when Type == var;
	       Type == lc;
	       Type == call;
	       Type == record_field ->
	  case Arg2 of
	    {string, _, _} ->
		{concat_lists(Arg1, DefaultAttrs), Arg2,
		 {atom, Line, none}};
	    _ -> {DefaultAttrs, Arg1, Arg2}
	  end;
      _ -> {DefaultAttrs, Arg1, Arg2}
    end;
handle_args(DefaultAttrs, _Line,
	    [Attrs, Format, Args]) ->
    {concat_lists(Attrs, DefaultAttrs), Format, Args}.

make_varname(Prefix, Line) ->
    list_to_atom(Prefix ++
		   atom_to_list(get(module)) ++ integer_to_list(Line)).

concat_lists({var, Line, _Name} = Var, B) ->
    {call, Line,
     {remote, Line, {atom, Line, lists},
      {atom, Line, flatten}},
     [{cons, Line, Var, B}]};
concat_lists({lc, Line, _Body, _Generator} = LC, B) ->
    {call, Line,
     {remote, Line, {atom, Line, lists},
      {atom, Line, flatten}},
     [{cons, Line, LC, B}]};
concat_lists({call, Line, _Function, _Args} = Call,
	     B) ->
    {call, Line,
     {remote, Line, {atom, Line, lists},
      {atom, Line, flatten}},
     [{cons, Line, Call, B}]};
concat_lists({record_field, Line, _Var, _Record,
	      _Field} =
		 Rec,
	     B) ->
    {call, Line,
     {remote, Line, {atom, Line, lists},
      {atom, Line, flatten}},
     [{cons, Line, Rec, B}]};
concat_lists({nil, _Line}, B) -> B;
concat_lists({cons, Line, Element, Tail}, B) ->
    {cons, Line, Element, concat_lists(Tail, B)}.

stash_record(Record) ->
    Records = case erlang:get(records) of
		undefined -> [];
		R -> R
	      end,
    erlang:put(records, [Record | Records]).

insert_record_attribute(AST) ->
    lists:foldl(fun ({attribute, Line, module, _} = E,
		     Acc) ->
			[E,
			 {attribute, Line, lager_records, erlang:get(records)}
			 | Acc];
		    (E, Acc) -> [E | Acc]
		end,
		[], AST).

guess_application(Dirname, Attr)
    when Dirname /= undefined ->
    case find_app_file(Dirname) of
      no_idea -> guess_application(undefined, Attr);
      _ -> ok
    end;
guess_application(undefined,
		  {attribute, _, file, {Filename, _}}) ->
    Dir = filename:dirname(Filename), find_app_file(Dir);
guess_application(_, _) -> ok.

find_app_file(Dir) ->
    case filelib:wildcard(Dir ++ "/*.{app,app.src}") of
      [] -> no_idea;
      [File] ->
	  case file:consult(File) of
	    {ok, [{application, Appname, _Attributes} | _]} ->
		erlang:put(application, Appname);
	    _ -> no_idea
	  end;
      _ -> no_idea
    end.


