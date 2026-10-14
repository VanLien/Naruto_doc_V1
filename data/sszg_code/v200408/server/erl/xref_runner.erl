-file("src/lib/xref_runner.erl", 1).

-module(xref_runner).

-lager_records([{xrefr_warn,
		 [filename, line, source, target, check]},
		{xrefr_conf, [extra_paths, xref_defaults, dirs]}]).

-author('tobbe@kreditor.se').

-author('daniel@lunas.se').

-author('elbrujohalcon@inaka.net').

-type check() :: undefined_function_calls |
		 undefined_functions | locals_not_used |
		 exports_not_used | deprecated_function_calls |
		 deprecated_functions.

-type xref_default() :: {builtins | recurse | verbose |
			 warnings,
			 boolean()}.

-file("inc/xrefr.hrl", 1).

-record(xrefr_conf,
	{extra_paths = [], xref_defaults = [],
	 dirs = [sys_env:get(code_path) ++ "/ebin"]}).

-record(xrefr_warn,
	{filename, line, source, target, check}).

-file("src/lib/xref_runner.erl", 23).

-type config() :: #xrefr_conf{}.

-type warning() :: #xrefr_warn{}.

-export_type([check/0, xref_default/0, config/0,
	      warning/0]).

-export([check/0, check/1, check/2, find_dirs/1]).

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

-file("src/lib/xref_runner.erl", 31).

-spec check() -> [warning()].

check() -> check("xref.config").

-spec check(file:name_all()) -> [warning()].

check(Path) ->
    {Checks, Config} = case file:consult(Path) of
			 {ok, [FullConfig]} ->
			     case proplists:get_value(xref, FullConfig) of
			       undefined -> {default_checks(), #xrefr_conf{}};
			       XrefConfig ->
				   {proplists:get_value(checks, XrefConfig,
							default_checks()),
				    proplists:get_value(config, XrefConfig,
							#xrefr_conf{})}
			     end;
			 {error, enoent} -> {default_checks(), #xrefr_conf{}}
		       end,
    lists:append([check(Check, Config) || Check <- Checks]).

-spec check(check(), config()) -> [warning()].

check(Check, Config) ->
    XrefDefaults = Config#xrefr_conf.xref_defaults,
    ConfigDirs = Config#xrefr_conf.dirs,
    Dirs = find_dirs(ConfigDirs),
    lists:foreach(fun code:add_path/1, Dirs),
    {ok, Xref} = xref:start([]),
    try ok = xref:set_library_path(Xref, code_path(Config)),
	xref:set_default(Xref, XrefDefaults),
	lists:foreach(fun (Dir) ->
			      {ok, _} = xref:add_directory(Xref, Dir)
		      end,
		      Dirs),
	{ok, Results} = xref:analyze(Xref, Check),
	FilteredResults = filter_xref_results(Check, Results),
	[result_to_warning(Check, Result)
	 || Result <- FilteredResults]
    after
      stopped = xref:stop(Xref)
    end.

default_checks() -> [undefined_functions].

ebin() ->
    case filelib:is_dir("ebin") of
      true -> filename:absname("ebin");
      false -> filename:absname(".")
    end.

code_path(Config) ->
    ConfigExtraPaths = Config#xrefr_conf.extra_paths,
    ExtraPaths = find_dirs(ConfigExtraPaths),
    [P || P <- code:get_path() ++ ExtraPaths].

-spec find_dirs([file:name()]) -> [file:filename()].

find_dirs(Dirs) ->
    ExtraPaths = lists:flatmap(fun filelib:wildcard/1,
			       Dirs),
    [Path || Path <- ExtraPaths, filelib:is_dir(Path)].

filter_xref_results(Check, Results) ->
    SourceModules = lists:usort([source_module(Result)
				 || Result <- Results]),
    Ignores = lists:flatmap(fun (Module) ->
				    get_ignorelist(Module, Check)
			    end,
			    SourceModules),
    [Result
     || Result <- Results,
	not lists:member(parse_xref_result(Result), Ignores)].

source_module({Mt, _Ft, _At}) -> Mt;
source_module({{Ms, _Fs, _As}, _Target}) -> Ms.

get_ignorelist(Mod, Check) ->
    Attributes = try Mod:module_info(attributes) catch
		   _Class:_Error -> []
		 end,
    IgnoreXref = [mfa(Mod, Value)
		  || {ignore_xref, Values} <- Attributes,
		     Value <- Values],
    BehaviourCallbacks = get_behaviour_callbacks(Check, Mod,
						 Attributes),
    IgnoreXref ++ BehaviourCallbacks.

get_behaviour_callbacks(exports_not_used, Mod,
			Attributes) ->
    Behaviours = [Value
		  || {behaviour, Values} <- Attributes, Value <- Values],
    [{Mod, {Mod, F, A}}
     || B <- Behaviours,
	{F, A} <- B:behaviour_info(callbacks)];
get_behaviour_callbacks(_Check, _Mod, _Attributes) ->
    [].

mfa(M, {F, A}) -> {M, {M, F, A}};
mfa(M, MFA) -> {M, MFA}.

parse_xref_result({{SM, _, _}, MFAt}) -> {SM, MFAt};
parse_xref_result({TM, _, _} = MFAt) -> {TM, MFAt}.

result_to_warning(Check, {MFASource, MFATarget}) ->
    {Filename, Line} = get_source(MFASource),
    #xrefr_warn{filename = Filename, line = Line,
		source = MFASource, target = MFATarget, check = Check};
result_to_warning(Check, MFA) ->
    {Filename, Line} = get_source(MFA),
    #xrefr_warn{filename = Filename, line = Line,
		source = MFA, check = Check}.

get_source({M, F, A}) ->
    case code:get_object_code(M) of
      error -> {"", 0};
      {M, Bin, _} -> find_function_source(M, F, A, Bin)
    end.

find_function_source(M, F, A, Bin) ->
    AbstractCode = beam_lib:chunks(Bin, [abstract_code]),
    {ok, {M, [{abstract_code, {raw_abstract_v1, Code}}]}} =
	AbstractCode,
    [{attribute, 1, file, {Source, _}} | _] = Code,
    Fn = [E
	  || E <- Code, element(1, E) == function,
	     element(3, E) == F, element(4, E) == A],
    case Fn of
      [{function, Line, F, _, _}] -> {Source, Line};
      [] -> {Source, 0}
    end.


