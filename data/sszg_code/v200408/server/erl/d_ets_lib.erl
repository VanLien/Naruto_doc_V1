-file("src/lib/d_ets_lib.erl", 1).

-module(d_ets_lib).

-lager_records([]).

-export([new_dets/4, new_ets/3, new_d_ets/4,
	 load_dets_to_ets/2, load_dets_to_ets/3, lookup_ets/2,
	 lookup_element_ets/3, save/1, save_ets/2, save_dets/2,
	 save_d_ets/2, resave_ets/2, resave_dets/2,
	 clear_d_ets/1, clear_d_ets/2]).

-spec new_dets(Tab :: atom(), File :: string(),
	       KeyPos :: pos_integer(),
	       Type :: set | bag | duplicate_bag) -> atom().

new_dets(Tab, File, KeyPos, Type) ->
    dets:open_file(Tab,
		   [{file, File}, {keypos, KeyPos}, {type, Type}]).

-spec new_ets(Tab :: atom(), KeyPos :: pos_integer(),
	      Type :: set | ordered_set | bag |
		      duplicate_bag) -> atom().

new_ets(Tab, KeyPos, Type) ->
    ets:new(Tab,
	    [Type, named_table, public, {keypos, KeyPos}]).

-spec new_d_ets(Tab :: atom(), File :: string(),
		KeyPos :: pos_integer(),
		Type :: set | bag | duplicate_bag) -> atom().

new_d_ets(Tab, File, KeyPos, Type) ->
    new_dets(Tab, File, KeyPos, Type),
    new_ets(Tab, KeyPos, Type).

-spec load_dets_to_ets(Tab :: atom(),
		       VerFun :: function()) -> true | false.

load_dets_to_ets(Tab, VerFun) ->
    load_dets_to_ets(Tab, Tab, VerFun).

load_dets_to_ets(DetsTab, EtsTab, undefined) ->
    dets:to_ets(DetsTab, EtsTab);
load_dets_to_ets(DetsTab, EtsTab, InitData)
    when is_tuple(InitData) ->
    dets:traverse(DetsTab,
		  fun (D) ->
			  NewD = tuple_util:convert_data(D, InitData),
			  save_ets(EtsTab, NewD),
			  continue
		  end);
load_dets_to_ets(DetsTab, EtsTab, VerFun)
    when is_function(VerFun) ->
    put(delete_dets_objects__, []),
    dets:traverse(DetsTab,
		  fun (D) ->
			  case VerFun(D) of
			    {ok, NewD} -> save_ets(EtsTab, NewD);
			    remove ->
				put(delete_dets_objects__,
				    [D | get(delete_dets_objects__)]);
			    ok -> ok
			  end,
			  continue
		  end),
    [dets:delete_object(DetsTab, O)
     || O <- erase(delete_dets_objects__)].

-spec lookup_ets(Tab :: atom(), Key :: any()) -> list().

lookup_ets(Tab, Key) -> ets:lookup(Tab, Key).

-spec lookup_element_ets(Tab :: atom(), Key :: any(),
			 Pos :: pos_integer() | [pos_integer()]) -> {ok,
								     any()} |
								    false.

lookup_element_ets(Tab, Key, Pos) ->
    try case is_list(Pos) of
	  true ->
	      {ok, [ets:lookup_element(Tab, Key, P) || P <- Pos]};
	  _ -> {ok, ets:lookup_element(Tab, Key, Pos)}
	end
    catch
      _:_ -> false
    end.

-spec save(atom()) -> ok.

save(Tab) -> dets:insert(Tab, ets:tab2list(Tab)).

-spec save_ets(Tab :: atom(), tuple()) -> ok.

save_ets(Tab, Data) -> ets:insert(Tab, Data).

-spec save_dets(Tab :: atom(), tuple()) -> ok.

save_dets(Tab, Data) -> dets:insert(Tab, Data).

-spec save_d_ets(Tab :: atom(), tuple()) -> ok.

save_d_ets(Tab, Data) ->
    ets:insert(Tab, Data), dets:insert(Tab, Data).

-spec resave_ets(Tab :: atom(), tuple()) -> ok.

resave_ets(Tab, Data) ->
    ets:delete_all_objects(Tab), ets:insert(Tab, Data).

-spec resave_dets(Tab :: atom(), tuple()) -> ok.

resave_dets(Tab, Data) ->
    dets:delete_all_objects(Tab), dets:insert(Tab, Data).

-spec clear_d_ets(Tab :: atom()) -> ok.

clear_d_ets(Tab) ->
    ets:delete_all_objects(Tab),
    dets:delete_all_objects(Tab).

-spec clear_d_ets(Tab :: atom(), Key :: any()) -> ok.

clear_d_ets(Tab, Key) ->
    ets:delete(Tab, Key), dets:delete(Tab, Key).


