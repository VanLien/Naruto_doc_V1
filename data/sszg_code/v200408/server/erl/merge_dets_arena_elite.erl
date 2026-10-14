-file("src/merge/merge_dets_arena_elite.erl", 1).

-module(merge_dets_arena_elite).

-lager_records([{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-export([do_init/1, do_convert/2, do_end/1]).

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

-file("src/merge/merge_dets_arena_elite.erl", 12).

-file("inc/merge.hrl", 1).

-record(merge_table,
	{name = <<>>, table = <<>>, dao, server, next_key = 0,
	 process = merge_main_proc, state, new_srv_id,
	 old_srv_id, columns = undefined,
	 delete_expire = undefined}).

-record(merge_server,
	{platform = "", zone_id = 1, data_source, schema,
	 target_schema, realm = 0, index = 0, size = 0}).

-record(merge_role_name,
	{key = "", role_id = {0, <<>>}, name = <<>>, lev = 0,
	 exp = 0, power = 0, data_source}).

-file("src/merge/merge_dets_arena_elite.erl", 13).

do_init(Table = #merge_table{server =
				 #merge_server{index = Size, size = Size}}) ->
    SrvList = merge_util:all_server(),
    List = [util:to_list(util:fbin(<<"~s_~w">>,
				   [Platform, ZoneId]))
	    || #merge_server{platform = Platform, zone_id = ZoneId}
		   <- SrvList],
    merge(List),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge(L) ->
    dets:open_file(arena_elite_other,
		   [{file, "../dets/arena_elite_other.dets"}, {type, set},
		    {keypos, 1}]),
    dets:delete_all_objects(arena_elite_other),
    ets:new(arena_elite_other,
	    [named_table, public, set, {keypos, 1}]),
    merge_other(L),
    dets:close(arena_elite_other),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} =
	util:string_to_term("arena_elite_other_" ++
			      PlatformZone),
    dets:open_file(DetsFlag,
		   [{file,
		     "../dets/" ++
		       PlatformZone ++ "/arena_elite_other.dets"},
		    {type, set}]),
    case dets:first(DetsFlag) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_dets_arena_elite46, _,
	     {__Levelmerge_dets_arena_elite46,
	      __Tracesmerge_dets_arena_elite46}}
		when __Levelmerge_dets_arena_elite46 band 64 /= 0 orelse
		       __Tracesmerge_dets_arena_elite46 /= [] ->
		lager:do_log(info,
			     [{module, merge_dets_arena_elite},
			      {function, merge_other}, {line, 46},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~s 目录下没有需要合并的环境变量数据",
					   [PlatformZone]),
			     none, 4096, 64, __Levelmerge_dets_arena_elite46,
			     __Tracesmerge_dets_arena_elite46, lager_event,
			     __Pidmerge_dets_arena_elite46);
	    _ -> ok
	  end;
      _ ->
	  dets:traverse(DetsFlag,
			fun (Data) ->
				handle_compare(Data, PlatformZone), continue
			end),
	  ok
    end,
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(Data = {Key = arena_elite_max_zone_info,
		       List1},
	       _PlatformZone) ->
    case ets:lookup(arena_elite_other, Key) of
      [{Key, List2}] ->
	  List = util:if_true(length(List1) > length(List2),
			      List1, List2),
	  ets:insert(arena_elite_other, {Key, List}),
	  dets:insert(arena_elite_other, {Key, List});
      [] ->
	  ets:insert(arena_elite_other, Data),
	  dets:insert(arena_elite_other, Data)
    end;
handle_compare(Data = {Key = hallows_award, AddRanks,
		       Time1},
	       _PlatformZone) ->
    case ets:lookup(arena_elite_other, Key) of
      [{Key, Ranks, Time2}] ->
	  ets:insert(arena_elite_other,
		     {Key, AddRanks ++ Ranks, max(Time2, Time1)}),
	  dets:insert(arena_elite_other,
		      {Key, AddRanks ++ Ranks, max(Time2, Time1)});
      [] ->
	  ets:insert(arena_elite_other, Data),
	  dets:insert(arena_elite_other, Data)
    end;
handle_compare(_, _) -> ok.


