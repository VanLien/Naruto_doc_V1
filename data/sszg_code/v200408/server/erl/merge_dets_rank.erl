-file("src/merge/merge_dets_rank.erl", 1).

-module(merge_dets_rank).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{merge_role_name,
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

-file("src/merge/merge_dets_rank.erl", 18).

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

-file("src/merge/merge_dets_rank.erl", 19).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/merge/merge_dets_rank.erl", 20).

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
    dets:open_file(sys_rank,
		   [{file, "../dets/sys_rank.dets"}, {type, set},
		    {keypos, #rank.type}]),
    dets:delete_all_objects(sys_rank),
    ets:new(sys_rank,
	    [named_table, public, set, {keypos, #rank.type}]),
    fetch_data(L),
    [resort_rank(RankType) || RankType <- rank_types()],
    dets:from_ets(sys_rank, sys_rank),
    dets:close(sys_rank),
    ok.

fetch_data([]) -> ok;
fetch_data([PlatformZone | T]) ->
    {ok, DetsFlag} = util:string_to_term("sys_rank" ++
					   PlatformZone),
    dets:open_file(DetsFlag,
		   [{file, "../dets/" ++ PlatformZone ++ "/sys_rank.dets"},
		    {type, set}, {keypos, #rank.type}]),
    [fetch_data_to_ets(DetsFlag, RankType)
     || RankType <- rank_types()],
    dets:close(DetsFlag),
    fetch_data(T).

fetch_data_to_ets(DetsFlag, RankType) ->
    case dets:lookup(DetsFlag, RankType) of
      [] -> ok;
      [R = #rank{list = List}] ->
	  case ets:lookup(sys_rank, RankType) of
	    [] -> ets:insert(sys_rank, R);
	    [#rank{list = List1}] ->
		ets:insert(sys_rank, R#rank{list = List1 ++ List})
	  end
    end.

resort_rank(RankType) ->
    case ets:lookup(sys_rank, RankType) of
      [] -> ok;
      [#rank{list = []}] -> ok;
      [R = #rank{list = List}] ->
	  #rank_cfg{keys = Keys} = rank_zone:cfg(RankType),
	  Sort = fun (A, B) ->
			 gen_sort_element(Keys, A) >= gen_sort_element(Keys, B)
		 end,
	  ListSorted = lists:sort(Sort, List),
	  {L1, _L2} = list_util:split(100, ListSorted),
	  LastVal = element(lists:last(Keys), lists:last(L1)),
	  NewR = R#rank{list = L1, len = length(L1),
			last_val = LastVal, ctime = date:unixtime()},
	  ets:insert(sys_rank, NewR)
    end.

gen_sort_element(Keys, Element) ->
    F = fun ({asc, Pos}) -> -element(Pos, Element);
	    (Pos) -> element(Pos, Element)
	end,
    list_to_tuple(lists:map(F, lists:reverse(Keys))).

rank_types() -> [2, 3, 6, 40, 42].


