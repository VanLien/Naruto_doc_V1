-file("data/c_formation_role_mgr.erl", 1).

-file("src/mod/formation_role/c_formation_role_mgr.erl",
      1).

-module(c_formation_role_mgr).

-lager_records([{formation_partner,
		 [ver, id, pos, bid, lev, star, break_lev, power,
		  use_skin, break_skills, set_skills, skills, dower_skill,
		  all_attr, base_attr, eqm, artifacts, holy_eqm, ext]},
		{formation_role_match,
		 [id, lev, power, max_power, zone_id]},
		{formation_role,
		 [ver, id, name, lev, sex, power, max_power, face_id,
		  face_file, avatar_bid, look_id, reg_time, zone_id, time,
		  formation_type, formation_lev, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id,
		  hallows_all_look_ids, hallows_lucky, hallows_seal,
		  hallows_refine, sprite_lev, sprite_break_lev, sprites,
		  partners, ext]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{state, []}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([tab/1, match_tab/1, zone_id_to_match/1]).

-export([print_num/1]).

-record(state, {}).

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

-file("src/mod/formation_role/c_formation_role_mgr.erl",
      15).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("src/mod/formation_role/c_formation_role_mgr.erl",
      16).

-file("inc/formation_role.hrl", 1).

-record(formation_role,
	{ver = 1, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 power = 0, max_power = 0, face_id = 0, face_file = <<>>,
	 avatar_bid = 0, look_id = 0, reg_time = 0, zone_id = 0,
	 time = 0, formation_type = 0, formation_lev = 0,
	 hallows_id = 0, hallows_lev = 0, hallows_skill_lev = 0,
	 hallows_look_id = 0, hallows_all_look_ids = [],
	 hallows_lucky = 0, hallows_seal = 0, hallows_refine = 0,
	 sprite_lev = 0, sprite_break_lev = 0, sprites = [],
	 partners = [], ext = []}).

-record(formation_role_match,
	{id = {0, <<>>}, lev = 0, power = 0, max_power = 0,
	 zone_id = 0}).

-record(formation_partner,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 pos = 0  :: pos_integer(), bid = 1  :: pos_integer(),
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 dower_skill = []  :: list(), all_attr, base_attr,
	 eqm = []  :: list(), artifacts = []  :: list(),
	 holy_eqm = []  :: list(), ext = []  :: list()}).

-file("src/mod/formation_role/c_formation_role_mgr.erl",
      17).

print_num(tab) ->
    [io:format("~ts",
	       [io_lib:format("~w => ~w~n",
			      [tab(Id), ets:info(tab(Id), size)])])
     || Id <- lists:seq(1, 50)],
    ok;
print_num(tab2) ->
    [io:format("~ts",
	       [io_lib:format("~w => ~w~n",
			      [tab(Id), dets:info(tab(Id), size)])])
     || Id <- lists:seq(1, 50)],
    ok;
print_num(match_tab) ->
    [io:format("~ts",
	       [io_lib:format("~w => ~w~n",
			      [match_tab(Id), ets:info(match_tab(Id), size)])])
     || Id <- lists:seq(1, 30)],
    ok.

zone_id_to_match(ZoneId) -> ZoneId div 10 + 1.

tab({Rid, _}) -> tab(Rid);
tab(1) -> c_formation_role_1;
tab(2) -> c_formation_role_2;
tab(3) -> c_formation_role_3;
tab(4) -> c_formation_role_4;
tab(5) -> c_formation_role_5;
tab(6) -> c_formation_role_6;
tab(7) -> c_formation_role_7;
tab(8) -> c_formation_role_8;
tab(9) -> c_formation_role_9;
tab(10) -> c_formation_role_10;
tab(11) -> c_formation_role_11;
tab(12) -> c_formation_role_12;
tab(13) -> c_formation_role_13;
tab(14) -> c_formation_role_14;
tab(15) -> c_formation_role_15;
tab(16) -> c_formation_role_16;
tab(17) -> c_formation_role_17;
tab(18) -> c_formation_role_18;
tab(19) -> c_formation_role_19;
tab(20) -> c_formation_role_20;
tab(21) -> c_formation_role_21;
tab(22) -> c_formation_role_22;
tab(23) -> c_formation_role_23;
tab(24) -> c_formation_role_24;
tab(25) -> c_formation_role_25;
tab(26) -> c_formation_role_26;
tab(27) -> c_formation_role_27;
tab(28) -> c_formation_role_28;
tab(29) -> c_formation_role_29;
tab(30) -> c_formation_role_30;
tab(31) -> c_formation_role_31;
tab(32) -> c_formation_role_32;
tab(33) -> c_formation_role_33;
tab(34) -> c_formation_role_34;
tab(35) -> c_formation_role_35;
tab(36) -> c_formation_role_36;
tab(37) -> c_formation_role_37;
tab(38) -> c_formation_role_38;
tab(39) -> c_formation_role_39;
tab(40) -> c_formation_role_40;
tab(41) -> c_formation_role_41;
tab(42) -> c_formation_role_42;
tab(43) -> c_formation_role_43;
tab(44) -> c_formation_role_44;
tab(45) -> c_formation_role_45;
tab(46) -> c_formation_role_46;
tab(47) -> c_formation_role_47;
tab(48) -> c_formation_role_48;
tab(49) -> c_formation_role_49;
tab(50) -> c_formation_role_50;
tab(N) when N > 50 -> tab(N rem 50 + 1).

match_tab(Tab) when is_atom(Tab) -> Tab;
match_tab(1) -> c_formation_role_match_1;
match_tab(2) -> c_formation_role_match_2;
match_tab(3) -> c_formation_role_match_3;
match_tab(4) -> c_formation_role_match_4;
match_tab(5) -> c_formation_role_match_5;
match_tab(6) -> c_formation_role_match_6;
match_tab(7) -> c_formation_role_match_7;
match_tab(8) -> c_formation_role_match_8;
match_tab(9) -> c_formation_role_match_9;
match_tab(10) -> c_formation_role_match_10;
match_tab(11) -> c_formation_role_match_11;
match_tab(12) -> c_formation_role_match_12;
match_tab(13) -> c_formation_role_match_13;
match_tab(14) -> c_formation_role_match_14;
match_tab(15) -> c_formation_role_match_15;
match_tab(16) -> c_formation_role_match_16;
match_tab(17) -> c_formation_role_match_17;
match_tab(18) -> c_formation_role_match_18;
match_tab(19) -> c_formation_role_match_19;
match_tab(20) -> c_formation_role_match_20;
match_tab(21) -> c_formation_role_match_21;
match_tab(22) -> c_formation_role_match_22;
match_tab(23) -> c_formation_role_match_23;
match_tab(24) -> c_formation_role_match_24;
match_tab(25) -> c_formation_role_match_25;
match_tab(26) -> c_formation_role_match_26;
match_tab(27) -> c_formation_role_match_27;
match_tab(28) -> c_formation_role_match_28;
match_tab(29) -> c_formation_role_match_29;
match_tab(30) -> c_formation_role_match_30;
match_tab(N) when N > 30 -> match_tab(N rem 30 + 1).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> c_formation_role_mgr ! Info.

cast(Info) ->
    gen_server:cast(c_formation_role_mgr, Info).

call(Info) ->
    case catch gen_server:call(c_formation_role_mgr, Info,
			       10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_formation_role_mgr138, _,
	     {__Levelc_formation_role_mgr138,
	      __Tracesc_formation_role_mgr138}}
		when __Levelc_formation_role_mgr138 band 8 /= 0 orelse
		       __Tracesc_formation_role_mgr138 /= [] ->
		lager:do_log(error,
			     [{module, c_formation_role_mgr}, {function, call},
			      {line, 138}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_formation_role_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_formation_role_mgr138,
			     __Tracesc_formation_role_mgr138, lager_event,
			     __Pidc_formation_role_mgr138);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, c_formation_role_mgr},
			  c_formation_role_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_formation_role_mgr144, _,
       {__Levelc_formation_role_mgr144,
	__Tracesc_formation_role_mgr144}}
	  when __Levelc_formation_role_mgr144 band 64 /= 0 orelse
		 __Tracesc_formation_role_mgr144 /= [] ->
	  lager:do_log(info,
		       [{module, c_formation_role_mgr}, {function, init},
			{line, 144}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [c_formation_role_mgr]),
		       none, 4096, 64, __Levelc_formation_role_mgr144,
		       __Tracesc_formation_role_mgr144, lager_event,
		       __Pidc_formation_role_mgr144);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    open_match_ets(30),
    open_data_ets(50),
    ets:new(formation_role_update,
	    [set, named_table, public, {keypos, 1}]),
    util:set_ms_timer(save_timer, 30000, save),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_formation_role_mgr151, _,
       {__Levelc_formation_role_mgr151,
	__Tracesc_formation_role_mgr151}}
	  when __Levelc_formation_role_mgr151 band 64 /= 0 orelse
		 __Tracesc_formation_role_mgr151 /= [] ->
	  lager:do_log(info,
		       [{module, c_formation_role_mgr}, {function, init},
			{line, 151}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [c_formation_role_mgr]),
		       none, 4096, 64, __Levelc_formation_role_mgr151,
		       __Tracesc_formation_role_mgr151, lager_event,
		       __Pidc_formation_role_mgr151);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_formation_role_mgr159, _,
	     {__Levelc_formation_role_mgr159,
	      __Tracesc_formation_role_mgr159}}
		when __Levelc_formation_role_mgr159 band 8 /= 0 orelse
		       __Tracesc_formation_role_mgr159 /= [] ->
		lager:do_log(error,
			     [{module, c_formation_role_mgr},
			      {function, handle_call}, {line, 159},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelc_formation_role_mgr159,
			     __Tracesc_formation_role_mgr159, lager_event,
			     __Pidc_formation_role_mgr159);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    c_formation_role_mgr, 160, _Reason}),
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_formation_role_mgr172, _,
	     {__Levelc_formation_role_mgr172,
	      __Tracesc_formation_role_mgr172}}
		when __Levelc_formation_role_mgr172 band 8 /= 0 orelse
		       __Tracesc_formation_role_mgr172 /= [] ->
		lager:do_log(error,
			     [{module, c_formation_role_mgr},
			      {function, handle_info}, {line, 172},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelc_formation_role_mgr172,
			     __Tracesc_formation_role_mgr172, lager_event,
			     __Pidc_formation_role_mgr172);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    c_formation_role_mgr, 173, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_formation_role_mgr178, _,
       {__Levelc_formation_role_mgr178,
	__Tracesc_formation_role_mgr178}}
	  when __Levelc_formation_role_mgr178 band 64 /= 0 orelse
		 __Tracesc_formation_role_mgr178 /= [] ->
	  lager:do_log(info,
		       [{module, c_formation_role_mgr}, {function, terminate},
			{line, 178}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始完成", none, 4096, 64, __Levelc_formation_role_mgr178,
		       __Tracesc_formation_role_mgr178, lager_event,
		       __Pidc_formation_role_mgr178);
      _ -> ok
    end,
    save_formation_role(50),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_formation_role_mgr180, _,
       {__Levelc_formation_role_mgr180,
	__Tracesc_formation_role_mgr180}}
	  when __Levelc_formation_role_mgr180 band 64 /= 0 orelse
		 __Tracesc_formation_role_mgr180 /= [] ->
	  lager:do_log(info,
		       [{module, c_formation_role_mgr}, {function, terminate},
			{line, 180}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_formation_role_mgr180,
		       __Tracesc_formation_role_mgr180, lager_event,
		       __Pidc_formation_role_mgr180);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_formation_role_mgr192, _,
	     {__Levelc_formation_role_mgr192,
	      __Tracesc_formation_role_mgr192}}
		when __Levelc_formation_role_mgr192 band 8 /= 0 orelse
		       __Tracesc_formation_role_mgr192 /= [] ->
		lager:do_log(error,
			     [{module, c_formation_role_mgr},
			      {function, do_handle_call}, {line, 192},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_formation_role_mgr192,
			     __Tracesc_formation_role_mgr192, lager_event,
			     __Pidc_formation_role_mgr192);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    c_formation_role_mgr, 193, _Reason}),
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_formation_role_mgr206, _,
	     {__Levelc_formation_role_mgr206,
	      __Tracesc_formation_role_mgr206}}
		when __Levelc_formation_role_mgr206 band 8 /= 0 orelse
		       __Tracesc_formation_role_mgr206 /= [] ->
		lager:do_log(error,
			     [{module, c_formation_role_mgr},
			      {function, do_handle_info}, {line, 206},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_formation_role_mgr206,
			     __Tracesc_formation_role_mgr206, lager_event,
			     __Pidc_formation_role_mgr206);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    c_formation_role_mgr, 207, _Reason}),
	  {noreply, State}
    end;
do_handle_info({sync,
		R = #formation_role{id = Id, zone_id = ZoneId}},
	       State) ->
    ets:insert(tab(Id), R),
    ets:insert(formation_role_update, {Id}),
    ets:insert(match_tab(zone_id_to_match(ZoneId)),
	       to_match_data(R)),
    {noreply, State};
do_handle_info(save, State) ->
    case time() of
      {0, _, _} -> util:set_ms_timer(save_timer, 30000, save);
      {Hour, _, _} ->
	  case ets:first(formation_role_update) of
	    {Rid, SrvId} ->
		save_formation_role({Rid, SrvId}),
		ets:delete(formation_role_update, {Rid, SrvId});
	    _ -> skip
	  end,
	  case Hour > 1 andalso Hour < 9 orelse Hour > 21 of
	    true -> util:set_ms_timer(save_timer, 100, save);
	    _ -> util:set_ms_timer(save_timer, 1000, save)
	  end
    end,
    {noreply, State};
do_handle_info(clear, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_formation_role_mgr241, _,
       {__Levelc_formation_role_mgr241,
	__Tracesc_formation_role_mgr241}}
	  when __Levelc_formation_role_mgr241 band 64 /= 0 orelse
		 __Tracesc_formation_role_mgr241 /= [] ->
	  lager:do_log(info,
		       [{module, c_formation_role_mgr},
			{function, do_handle_info}, {line, 241},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "清空所有数据", none, 4096, 64,
		       __Levelc_formation_role_mgr241,
		       __Tracesc_formation_role_mgr241, lager_event,
		       __Pidc_formation_role_mgr241);
      _ -> ok
    end,
    ets:delete_all_objects(formation_role_update),
    [ets:delete_all_objects(match_tab(I))
     || I <- lists:seq(1, 30)],
    [d_ets_lib:clear_d_ets(tab(I))
     || I <- lists:seq(1, 50)],
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

open_match_ets(0) -> ok;
open_match_ets(N) ->
    TabName = match_tab(N),
    ets:new(TabName,
	    [set, named_table, public,
	     {keypos, #formation_role_match.id}]),
    open_match_ets(N - 1).

open_data_ets(0) -> ok;
open_data_ets(N) ->
    TabName = tab(N),
    d_ets_lib:new_d_ets(TabName,
			io_lib:format("./dets/c_formation_role_~w.dets", [N]),
			#formation_role.id, set),
    d_ets_lib:load_dets_to_ets(TabName,
			       fun (D = #formation_role{zone_id = ZoneId}) ->
				       ets:insert(match_tab(zone_id_to_match(ZoneId)),
						  to_match_data(D)),
				       {ok, D}
			       end),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_formation_role_mgr266, _,
       {__Levelc_formation_role_mgr266,
	__Tracesc_formation_role_mgr266}}
	  when __Levelc_formation_role_mgr266 band 64 /= 0 orelse
		 __Tracesc_formation_role_mgr266 /= [] ->
	  lager:do_log(info,
		       [{module, c_formation_role_mgr},
			{function, open_data_ets}, {line, 266},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("数据加载:~w === ~w",
				     [tab(N), ets:info(tab(N), size)]),
		       none, 4096, 64, __Levelc_formation_role_mgr266,
		       __Tracesc_formation_role_mgr266, lager_event,
		       __Pidc_formation_role_mgr266);
      _ -> ok
    end,
    open_data_ets(N - 1).

save_formation_role({Rid, SrvId}) ->
    case ets:lookup(tab(Rid), {Rid, SrvId}) of
      [D] -> dets:insert(tab(Rid), D);
      _ -> skip
    end;
save_formation_role(0) -> ok;
save_formation_role(N) ->
    L = [R
	 || R = #formation_role{id = Id} <- ets:tab2list(tab(N)),
	    ets:member(formation_role_update, Id)],
    dets:insert(tab(N), L),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_formation_role_mgr280, _,
       {__Levelc_formation_role_mgr280,
	__Tracesc_formation_role_mgr280}}
	  when __Levelc_formation_role_mgr280 band 64 /= 0 orelse
		 __Tracesc_formation_role_mgr280 /= [] ->
	  lager:do_log(info,
		       [{module, c_formation_role_mgr},
			{function, save_formation_role}, {line, 280},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("数据保存:~w === ~w", [tab(N), length(L)]),
		       none, 4096, 64, __Levelc_formation_role_mgr280,
		       __Tracesc_formation_role_mgr280, lager_event,
		       __Pidc_formation_role_mgr280);
      _ -> ok
    end,
    save_formation_role(N - 1).

to_match_data(#formation_role{id = Id, lev = Lev,
			      power = Power, max_power = MaxPower,
			      zone_id = ZoneId}) ->
    #formation_role_match{id = Id, lev = Lev, power = Power,
			  max_power = MaxPower, zone_id = ZoneId}.


