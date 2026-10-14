-file("src/glc.erl", 1).

-module(glc).

-export([compile/2, compile/3, compile/4, handle/2,
	 get/2, delete/1, reset_counters/1, reset_counters/2,
	 start/0]).

-export([lt/2, lte/2, eq/2, neq/2, gt/2, gte/2, wc/1,
	 nf/1]).

-export([all/1, any/1, null/1, with/2, run/3]).

-export([info/1, input/1, output/1, job_input/1,
	 job_run/1, job_error/1, job_time/1, filter/1, union/1]).

-record(module,
	{query  :: term(), tables  :: [{atom(), atom()}],
	 qtree  :: term(), store  :: term()}).

-spec lt(atom(), term()) -> glc_ops:op().

lt(Key, Term) -> glc_ops:lt(Key, Term).

-spec lte(atom(), term()) -> glc_ops:op().

lte(Key, Term) -> glc_ops:lte(Key, Term).

-spec eq(atom(), term()) -> glc_ops:op().

eq(Key, Term) -> glc_ops:eq(Key, Term).

-spec neq(atom(), term()) -> glc_ops:op().

neq(Key, Term) -> glc_ops:neq(Key, Term).

-spec gt(atom(), term()) -> glc_ops:op().

gt(Key, Term) -> glc_ops:gt(Key, Term).

-spec gte(atom(), term()) -> glc_ops:op().

gte(Key, Term) -> glc_ops:gte(Key, Term).

-spec wc(atom()) -> glc_ops:op().

wc(Key) -> glc_ops:wc(Key).

-spec nf(atom()) -> glc_ops:op().

nf(Key) -> glc_ops:nf(Key).

-spec all([glc_ops:op()]) -> glc_ops:op().

all(Filters) -> glc_ops:all(Filters).

-spec any([glc_ops:op()]) -> glc_ops:op().

any(Filters) -> glc_ops:any(Filters).

-spec null(boolean()) -> glc_ops:op().

null(Result) -> glc_ops:null(Result).

-spec with(glc_ops:op(),
	   (gre:event()) -> term()) -> glc_ops:op().

with(Query, Action) -> glc_ops:with(Query, Action).

-spec union([glc_ops:op()]) -> glc_ops:op().

union(Queries) -> glc_ops:union(Queries).

-spec compile(atom(),
	      glc_ops:op() | [glc_ops:op()]) -> {ok, atom()}.

compile(Module, Query) ->
    compile(Module, Query, undefined, true).

-spec compile(atom(), glc_ops:op() | [glc_ops:op()],
	      boolean()) -> {ok, atom()}.

compile(Module, Query, Reset) when is_boolean(Reset) ->
    compile(Module, Query, undefined, Reset);
compile(Module, Query, undefined) ->
    compile(Module, Query, undefined, true);
compile(Module, Query, Store) when is_list(Store) ->
    compile(Module, Query, Store, true).

compile(Module, Query, Store, Reset) ->
    {ok, ModuleData} = module_data(Module, Query, Store),
    case glc_code:compile(Module, ModuleData) of
      {ok, Module} when Reset ->
	  reset_counters(Module), {ok, Module};
      {ok, Module} -> {ok, Module}
    end.

-spec handle(atom(),
	     [{atom(), term()}] | gre:event()) -> ok.

handle(Module, Event) when is_list(Event) ->
    Module:handle(gre:make(Event, [list]));
handle(Module, Event) -> Module:handle(Event).

get(Module, Key) -> Module:get(Key).

run(Module, Fun, Event) when is_list(Event) ->
    Module:runjob(Fun, gre:make(Event, [list]));
run(Module, Fun, Event) -> Module:runjob(Fun, Event).

info(Module) ->
    Counters = [input, filter, output, job_input, job_run,
		job_time, job_error],
    [{C, Module:info(C)} || C <- [query | Counters]].

-spec input(atom()) -> non_neg_integer().

input(Module) -> Module:info(input).

-spec output(atom()) -> non_neg_integer().

output(Module) -> Module:info(output).

-spec filter(atom()) -> non_neg_integer().

filter(Module) -> Module:info(filter).

-spec job_run(atom()) -> non_neg_integer().

job_run(Module) -> Module:info(job_run).

-spec job_error(atom()) -> non_neg_integer().

job_error(Module) -> Module:info(job_error).

-spec job_input(atom()) -> non_neg_integer().

job_input(Module) -> Module:info(job_input).

-spec job_time(atom()) -> non_neg_integer().

job_time(Module) -> Module:info(job_time).

-spec delete(atom()) -> ok.

delete(Module) ->
    Params = params_name(Module),
    Counts = counts_name(Module),
    ManageParams = manage_params_name(Module),
    ManageCounts = manage_counts_name(Module),
    _ = [begin
	   ok = supervisor:terminate_child(Sup, Name),
	   ok = supervisor:delete_child(Sup, Name)
	 end
	 || {Sup, Name}
		<- [{gr_manager_sup, ManageParams},
		    {gr_manager_sup, ManageCounts}, {gr_param_sup, Params},
		    {gr_counter_sup, Counts}]],
    code:soft_purge(Module),
    code:delete(Module),
    ok.

-spec reset_counters(atom()) -> ok.

reset_counters(Module) -> Module:reset_counters(all).

-spec reset_counters(atom(), atom()) -> ok.

reset_counters(Module, Counter) ->
    Module:reset_counters(Counter).

-spec module_data(atom(), term(), term()) -> {ok,
					      #module{}}.

module_data(Module, Query, Store) ->
    Tables = module_tables(Module),
    Query2 = glc_lib:reduce(Query),
    {ok,
     #module{query = Query, tables = Tables, qtree = Query2,
	     store = Store}}.

module_tables(Module) ->
    Params = params_name(Module),
    Counts = counts_name(Module),
    ManageParams = manage_params_name(Module),
    ManageCounts = manage_counts_name(Module),
    Counters = [{input, 0}, {filter, 0}, {output, 0},
		{job_input, 0}, {job_run, 0}, {job_time, 0},
		{job_error, 0}],
    _ = supervisor:start_child(gr_param_sup,
			       {Params, {gr_param, start_link, [Params]},
				transient, brutal_kill, worker, [Params]}),
    _ = supervisor:start_child(gr_counter_sup,
			       {Counts, {gr_counter, start_link, [Counts]},
				transient, brutal_kill, worker, [Counts]}),
    _ = supervisor:start_child(gr_manager_sup,
			       {ManageParams,
				{gr_manager, start_link,
				 [ManageParams, Params, []]},
				transient, brutal_kill, worker,
				[ManageParams]}),
    _ = supervisor:start_child(gr_manager_sup,
			       {ManageCounts,
				{gr_manager, start_link,
				 [ManageCounts, Counts, Counters]},
				transient, brutal_kill, worker,
				[ManageCounts]}),
    [{params, Params}, {counters, Counts}].

reg_name(Module, Name) ->
    list_to_atom("gr_" ++ atom_to_list(Module) ++ Name).

params_name(Module) -> reg_name(Module, "_params").

counts_name(Module) -> reg_name(Module, "_counters").

manage_params_name(Module) ->
    reg_name(Module, "_params_mgr").

manage_counts_name(Module) ->
    reg_name(Module, "_counters_mgr").

start() ->
    ok = application:start(syntax_tools),
    ok = application:start(compiler),
    ok = application:start(goldrush).


