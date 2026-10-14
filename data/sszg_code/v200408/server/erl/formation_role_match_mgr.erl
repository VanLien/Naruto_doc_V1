-file("src/mod/formation_role/formation_role_match_m"
      "gr.erl",
      1).

-module(formation_role_match_mgr).

-lager_records([{planes_load_partner,
		 [ver, pos, bid, lev, name, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{planes_evt_data,
		 [id, type, ext, reward_list, exchange_id, group_id]},
		{planes_tile,
		 [ver, label, evt_id, ext, defend_radio, is_hide,
		  is_walk, is_business, combat_power]},
		{planes_floor,
		 [ver, floor, difficulty, map_id, line, index, tile_list,
		  is_reward, is_can_reward, is_treasure, fight_ids]},
		{m_planes,
		 [ver, floor, floor_list, update_time, partners_hp_radio,
		  buffs, buffs_ext, session_ids, load_partners,
		  load_partners_next_id, dun_power, formation, is_pass,
		  reward_list, is_spar]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{formation_partner,
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
		{state, []}]).

-behaviour(gen_server).

-export([call_apply/2, apply/2]).

-export([info/2, cast/2, call/2, start_link/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_match_pro/0]).

-export([match/3, zone_id_to_match/3, get_role_info/1]).

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

-file("src/mod/formation_role/formation_role_match_m"
      "gr.erl",
      15).

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

-file("src/mod/formation_role/formation_role_match_m"
      "gr.erl",
      16).

-file("inc/planes.hrl", 1).

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

-file("inc/planes.hrl", 7).

-record(m_planes,
	{ver = 2  :: pos_integer(), floor = 0  :: pos_integer(),
	 floor_list = []  :: list(),
	 update_time = 0  :: pos_integer(),
	 partners_hp_radio = []  :: list(),
	 buffs = []  :: list(), buffs_ext = []  :: list(),
	 session_ids = []  :: list(),
	 load_partners = []  :: list(),
	 load_partners_next_id = 1  :: pos_integer(),
	 dun_power = 0  :: pos_integer(),
	 formation = {1, [], 0}  :: tuple(),
	 is_pass = 0  :: boolean(), reward_list = []  :: list(),
	 is_spar = 0  :: pos_integer()}).

-record(planes_floor,
	{ver = 1  :: pos_integer(), floor = 1  :: pos_integer(),
	 difficulty = 1  :: pos_integer(),
	 map_id  :: pos_integer(), line = 1  :: pos_integer(),
	 index = 0  :: pos_integer(), tile_list = []  :: list(),
	 is_reward = 0  :: boolean(),
	 is_can_reward = 0  :: boolean(),
	 is_treasure = 0  :: boolean(),
	 fight_ids = []  :: list()}).

-record(planes_tile,
	{ver = 1  :: pos_integer(), label = {1, 1}  :: tuple(),
	 evt_id = 0  :: pos_integer(), ext = []  :: list(),
	 defend_radio = []  :: list(), is_hide = 0  :: boolean(),
	 is_walk = 0  :: boolean(),
	 is_business = 0  :: boolean(),
	 combat_power = 0  :: pos_integer()}).

-record(planes_evt_data,
	{id = 0  :: pos_integer(), type = 0  :: pos_integer(),
	 ext = []  :: list(), reward_list = []  :: list(),
	 exchange_id = 0  :: pos_integer(),
	 group_id = 0  :: pos_integer()}).

-record(planes_load_partner,
	{ver = 1  :: pos_integer(), pos = 1  :: pos_integer(),
	 bid = 1  :: pos_integer(), lev = 1  :: pos_integer(),
	 name = <<>>  :: binary(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/formation_role/formation_role_match_m"
      "gr.erl",
      17).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/formation_role/formation_role_match_m"
      "gr.erl",
      18).

start_match_pro() -> do_start_match_pro(10).

do_start_match_pro(0) -> ok;
do_start_match_pro(N) ->
    start_link(N), do_start_match_pro(N - 1).

pro_name({Rid, _}) -> pro_name(Rid);
pro_name(1) -> formation_role_match_mgr_1;
pro_name(2) -> formation_role_match_mgr_2;
pro_name(3) -> formation_role_match_mgr_3;
pro_name(4) -> formation_role_match_mgr_4;
pro_name(5) -> formation_role_match_mgr_5;
pro_name(6) -> formation_role_match_mgr_6;
pro_name(7) -> formation_role_match_mgr_7;
pro_name(8) -> formation_role_match_mgr_8;
pro_name(9) -> formation_role_match_mgr_9;
pro_name(10) -> formation_role_match_mgr_10;
pro_name(N) when N > 10 -> pro_name(N rem 10 + 1);
pro_name(_) -> pro_name(1).

call_apply(Pro, {M, F, A}) ->
    call(Pro, {apply, M, F, A}).

apply(Pro, {M, F, A}) -> info(Pro, {apply, M, F, A}).

info(Pro, Info) -> pro_name(Pro) ! Info.

cast(Pro, Info) -> gen_server:cast(pro_name(Pro), Info).

call(Pro, Info) ->
    case catch gen_server:call(pro_name(Pro), Info, 10000)
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
	    {__Pidformation_role_match_mgr60, _,
	     {__Levelformation_role_match_mgr60,
	      __Tracesformation_role_match_mgr60}}
		when __Levelformation_role_match_mgr60 band 8 /= 0
		       orelse __Tracesformation_role_match_mgr60 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_match_mgr},
			      {function, call}, {line, 60},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [pro_name(Pro), Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelformation_role_match_mgr60,
			     __Tracesformation_role_match_mgr60, lager_event,
			     __Pidformation_role_match_mgr60);
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

start_link(N) ->
    gen_server:start_link({local, pro_name(N)},
			  formation_role_match_mgr, [N], []).

init([N]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformation_role_match_mgr66, _,
       {__Levelformation_role_match_mgr66,
	__Tracesformation_role_match_mgr66}}
	  when __Levelformation_role_match_mgr66 band 64 /= 0
		 orelse __Tracesformation_role_match_mgr66 /= [] ->
	  lager:do_log(info,
		       [{module, formation_role_match_mgr}, {function, init},
			{line, 66}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动[~w]...",
				     [formation_role_match_mgr, N]),
		       none, 4096, 64, __Levelformation_role_match_mgr66,
		       __Tracesformation_role_match_mgr66, lager_event,
		       __Pidformation_role_match_mgr66);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    put(idx, 0),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformation_role_match_mgr70, _,
       {__Levelformation_role_match_mgr70,
	__Tracesformation_role_match_mgr70}}
	  when __Levelformation_role_match_mgr70 band 64 /= 0
		 orelse __Tracesformation_role_match_mgr70 /= [] ->
	  lager:do_log(info,
		       [{module, formation_role_match_mgr}, {function, init},
			{line, 70}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [formation_role_match_mgr]),
		       none, 4096, 64, __Levelformation_role_match_mgr70,
		       __Tracesformation_role_match_mgr70, lager_event,
		       __Pidformation_role_match_mgr70);
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
	    {__Pidformation_role_match_mgr78, _,
	     {__Levelformation_role_match_mgr78,
	      __Tracesformation_role_match_mgr78}}
		when __Levelformation_role_match_mgr78 band 8 /= 0
		       orelse __Tracesformation_role_match_mgr78 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_match_mgr},
			      {function, handle_call}, {line, 78},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelformation_role_match_mgr78,
			     __Tracesformation_role_match_mgr78, lager_event,
			     __Pidformation_role_match_mgr78);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    formation_role_match_mgr, 79, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
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
	    {__Pidformation_role_match_mgr91, _,
	     {__Levelformation_role_match_mgr91,
	      __Tracesformation_role_match_mgr91}}
		when __Levelformation_role_match_mgr91 band 8 /= 0
		       orelse __Tracesformation_role_match_mgr91 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_match_mgr},
			      {function, handle_info}, {line, 91},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelformation_role_match_mgr91,
			     __Tracesformation_role_match_mgr91, lager_event,
			     __Pidformation_role_match_mgr91);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    formation_role_match_mgr, 92, _Reason}),
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
      {__Pidformation_role_match_mgr97, _,
       {__Levelformation_role_match_mgr97,
	__Tracesformation_role_match_mgr97}}
	  when __Levelformation_role_match_mgr97 band 64 /= 0
		 orelse __Tracesformation_role_match_mgr97 /= [] ->
	  lager:do_log(info,
		       [{module, formation_role_match_mgr},
			{function, terminate}, {line, 97},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelformation_role_match_mgr97,
		       __Tracesformation_role_match_mgr97, lager_event,
		       __Pidformation_role_match_mgr97);
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
	    {__Pidformation_role_match_mgr109, _,
	     {__Levelformation_role_match_mgr109,
	      __Tracesformation_role_match_mgr109}}
		when __Levelformation_role_match_mgr109 band 8 /= 0
		       orelse __Tracesformation_role_match_mgr109 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_match_mgr},
			      {function, do_handle_call}, {line, 109},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelformation_role_match_mgr109,
			     __Tracesformation_role_match_mgr109, lager_event,
			     __Pidformation_role_match_mgr109);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    formation_role_match_mgr, 110, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
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
	    {__Pidformation_role_match_mgr123, _,
	     {__Levelformation_role_match_mgr123,
	      __Tracesformation_role_match_mgr123}}
		when __Levelformation_role_match_mgr123 band 8 /= 0
		       orelse __Tracesformation_role_match_mgr123 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_match_mgr},
			      {function, do_handle_info}, {line, 123},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelformation_role_match_mgr123,
			     __Tracesformation_role_match_mgr123, lager_event,
			     __Pidformation_role_match_mgr123);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    formation_role_match_mgr, 124, _Reason}),
	  {noreply, State}
    end;
do_handle_info({match,
		Match = #{back_pid := BackPid, role_id := RoleId,
			  match_num := MatchNum, func := {M, F, A}}},
	       State) ->
    case big_world_lib:is_link() of
      true ->
	  Idx = put(idx, get(idx) + 1),
	  big_world_lib:cast(center, formation_role_match_mgr,
			     match, [self(), Idx, Match#{func := undefined}]),
	  put({idx, Idx},
	      {RoleId, BackPid, MatchNum, {M, F, A},
	       erlang:send_after(5000, self(),
				 {match_timeout_fail, Idx})});
      _ ->
	  case cluster_lib:is_link() of
	    true ->
		Idx = put(idx, get(idx) + 1),
		cluster_lib:cast(center, formation_role_match_mgr,
				 match,
				 [self(), Idx, Match#{func := undefined}]),
		put({idx, Idx},
		    {RoleId, BackPid, MatchNum, {M, F, A},
		     erlang:send_after(5000, self(),
				       {match_timeout_fail, Idx})});
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidformation_role_match_mgr142, _,
		   {__Levelformation_role_match_mgr142,
		    __Tracesformation_role_match_mgr142}}
		      when __Levelformation_role_match_mgr142 band 128 /= 0
			     orelse __Tracesformation_role_match_mgr142 /= [] ->
		      lager:do_log(debug,
				   [{module, formation_role_match_mgr},
				    {function, do_handle_info}, {line, 142},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("未连接中央服", []), none, 4096, 128,
				   __Levelformation_role_match_mgr142,
				   __Tracesformation_role_match_mgr142,
				   lager_event,
				   __Pidformation_role_match_mgr142);
		  _ -> ok
		end,
		callback(BackPid,
			 {M, F, [[false || _ <- lists:seq(1, MatchNum)] | A]})
	  end
    end,
    {noreply, State};
do_handle_info({match_timeout_fail, Idx}, State) ->
    case erase({idx, Idx}) of
      {RoleId, BackPid, MatchNum, {M, F, A}, _TimeRef} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformation_role_match_mgr152, _,
	     {__Levelformation_role_match_mgr152,
	      __Tracesformation_role_match_mgr152}}
		when __Levelformation_role_match_mgr152 band 8 /= 0
		       orelse __Tracesformation_role_match_mgr152 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_match_mgr},
			      {function, do_handle_info}, {line, 152},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("match_timeout_fail===>~w ~w",
					   [Idx, RoleId]),
			     none, 4096, 8, __Levelformation_role_match_mgr152,
			     __Tracesformation_role_match_mgr152, lager_event,
			     __Pidformation_role_match_mgr152);
	    _ -> ok
	  end,
	  callback(BackPid,
		   {M, F, [[false || _ <- lists:seq(1, MatchNum)] | A]});
      _ -> skip
    end,
    {noreply, State};
do_handle_info({match_ret, Idx, Ret}, State) ->
    case erase({idx, Idx}) of
      {_RoleId, BackPid, _MatchNum, {M, F, A}, TimeRef} ->
	  catch erlang:cancel_timer(TimeRef),
	  callback(BackPid, {M, F, [Ret | A]});
      _ -> skip
    end,
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

callback({mgr, MgrPid}, {Mod, Fun, Args}) ->
    apply(Mod, Fun, [MgrPid | Args]);
callback({role, RolePid}, MFA) ->
    role_lib:cast(by_pid, RolePid, MFA).

match(MatchPid, Idx, Match = #{powers := Powers}) ->
    MinZone = maps:get(min_zone, Match, 0),
    MaxZone = maps:get(max_zone, Match, 99999),
    TabNames = util:shuffle(zone_id_to_match(MinZone,
					     MaxZone, [])),
    MaxNum = util:rand(15, 50),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformation_role_match_mgr182, _,
       {__Levelformation_role_match_mgr182,
	__Tracesformation_role_match_mgr182}}
	  when __Levelformation_role_match_mgr182 band 128 /= 0
		 orelse __Tracesformation_role_match_mgr182 /= [] ->
	  lager:do_log(debug,
		       [{module, formation_role_match_mgr}, {function, match},
			{line, 182}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("match max_num=~w min_zone=~w max_zone=~w "
				     "powers=~w tabnames=~w",
				     [MaxNum, MinZone, MaxZone, Powers,
				      TabNames]),
		       none, 4096, 128, __Levelformation_role_match_mgr182,
		       __Tracesformation_role_match_mgr182, lager_event,
		       __Pidformation_role_match_mgr182);
      _ -> ok
    end,
    Ret = do_batch_match(Powers, TabNames, MaxNum, Match,
			 []),
    MatchPid ! {match_ret, Idx, Ret}.

do_batch_match([], _TabNames, _MaxNum, _Match, Ret) ->
    lists:reverse(Ret);
do_batch_match([Powers | T], TabNames, MaxNum,
	       Match = #{exclude_roleids := ExcludeRoleIds,
			 role_id := {Rid, SrvId}},
	       Ret) ->
    case do_match(Powers, TabNames, MaxNum, Match, []) of
      M = #formation_role{id =
			      MatchRoleId = {MatchRid, MatchSrvId},
			  power = Power} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformation_role_match_mgr191, _,
	     {__Levelformation_role_match_mgr191,
	      __Tracesformation_role_match_mgr191}}
		when __Levelformation_role_match_mgr191 band 128 /= 0
		       orelse __Tracesformation_role_match_mgr191 /= [] ->
		lager:do_log(debug,
			     [{module, formation_role_match_mgr},
			      {function, do_batch_match}, {line, 191},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("匹配成功:~w:~s powers=~w, lev=~w, zone:~w "
					   "match=(~w:~s ~w)",
					   [Rid, SrvId, Powers,
					    {maps:get(min_lev, Match, 0),
					     maps:get(max_lev, Match, 999)},
					    {maps:get(min_zone, Match),
					     maps:get(max_zone, Match)},
					    MatchRid, MatchSrvId, Power]),
			     none, 4096, 128,
			     __Levelformation_role_match_mgr191,
			     __Tracesformation_role_match_mgr191, lager_event,
			     __Pidformation_role_match_mgr191);
	    _ -> ok
	  end,
	  do_batch_match(T, TabNames, MaxNum,
			 Match#{exclude_roleids :=
				    [MatchRoleId | ExcludeRoleIds]},
			 [M | Ret]);
      _ ->
	  do_batch_match(T, TabNames, MaxNum, Match,
			 [false | Ret])
    end.

do_match([], _TabNames, _MaxNum,
	 _Match = #{role_id := {Rid, SrvId}}, []) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformation_role_match_mgr198, _,
       {__Levelformation_role_match_mgr198,
	__Tracesformation_role_match_mgr198}}
	  when __Levelformation_role_match_mgr198 band 64 /= 0
		 orelse __Tracesformation_role_match_mgr198 /= [] ->
	  lager:do_log(info,
		       [{module, formation_role_match_mgr},
			{function, do_match}, {line, 198},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("匹配失败:~w:~s powers=~w, zone:~w lev=~w",
				     [Rid, SrvId, maps:get(powers, _Match),
				      {maps:get(min_zone, _Match),
				       maps:get(max_zone, _Match)},
				      {maps:get(min_lev, _Match, 0),
				       maps:get(max_lev, _Match, 999)}]),
		       none, 4096, 64, __Levelformation_role_match_mgr198,
		       __Tracesformation_role_match_mgr198, lager_event,
		       __Pidformation_role_match_mgr198);
      _ -> ok
    end,
    false;
do_match([], _TabNames, _MaxNum, _Match, MatchList) ->
    get_role_info(util:rand_list(MatchList));
do_match([{MinPower, MaxPower} | T], TabNames, MaxNum,
	 Match, MatchList) ->
    RoleId = maps:get(role_id, Match),
    MinZone = maps:get(min_zone, Match, 0),
    MaxZone = maps:get(max_zone, Match, 99999),
    MinLev = maps:get(min_lev, Match, 0),
    MaxLev = maps:get(max_lev, Match, 999),
    DoFun = [{{formation_role_match, '$1', '$4', '$3', '_',
	       '$2'},
	      [{'andalso', {'>=', '$4', {const, MinLev}},
		{'andalso', {'=<', '$4', {const, MaxLev}},
		 {'andalso', {'=<', '$3', {const, MaxPower}},
		  {'andalso', {'>=', '$3', {const, MinPower}},
		   {'andalso', {'=<', '$2', {const, MaxZone}},
		    {'andalso', {'>=', '$2', {const, MinZone}},
		     {'=/=', '$1', {const, RoleId}}}}}}}}],
	      ['$1']}],
    NewMatchList = do_match_role(TabNames, DoFun, MaxNum,
				 Match, MatchList),
    case length(NewMatchList) >= MaxNum of
      true -> get_role_info(util:rand_list(NewMatchList));
      _ -> do_match(T, TabNames, MaxNum, Match, NewMatchList)
    end.

do_match_role([], _DoFun, _MaxNum, _Match, MatchList) ->
    MatchList;
do_match_role([TabName | T], DoFun, MaxNum, Match,
	      MatchList) ->
    case ets:select(TabName, DoFun, MaxNum + 10) of
      {L, _} ->
	  ExcludeRoleIds = maps:get(exclude_roleids, Match, []),
	  L1 = [Id
		|| Id <- L, not lists:member(Id, ExcludeRoleIds),
		   not lists:member(Id, MatchList)],
	  NewMatchList = L1 ++ MatchList,
	  case length(NewMatchList) >= MaxNum of
	    true -> NewMatchList;
	    _ ->
		do_match_role(T, DoFun, MaxNum, Match, NewMatchList)
	  end;
      _ -> do_match_role(T, DoFun, MaxNum, Match, MatchList)
    end.

get_role_info(RoleId) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformation_role_match_mgr245, _,
       {__Levelformation_role_match_mgr245,
	__Tracesformation_role_match_mgr245}}
	  when __Levelformation_role_match_mgr245 band 128 /= 0
		 orelse __Tracesformation_role_match_mgr245 /= [] ->
	  lager:do_log(debug,
		       [{module, formation_role_match_mgr},
			{function, get_role_info}, {line, 245},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("====~w", [RoleId]), none, 4096, 128,
		       __Levelformation_role_match_mgr245,
		       __Tracesformation_role_match_mgr245, lager_event,
		       __Pidformation_role_match_mgr245);
      _ -> ok
    end,
    case ets:lookup(c_formation_role_mgr:tab(RoleId),
		    RoleId)
	of
      [R] -> R;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformation_role_match_mgr250, _,
	     {__Levelformation_role_match_mgr250,
	      __Tracesformation_role_match_mgr250}}
		when __Levelformation_role_match_mgr250 band 8 /= 0
		       orelse __Tracesformation_role_match_mgr250 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_match_mgr},
			      {function, get_role_info}, {line, 250},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("匹配成功, 但获取角色信息失败了:~w", [RoleId]),
			     none, 4096, 8, __Levelformation_role_match_mgr250,
			     __Tracesformation_role_match_mgr250, lager_event,
			     __Pidformation_role_match_mgr250);
	    _ -> ok
	  end,
	  false
    end.

zone_id_to_match(MinZone, MaxZone, TabNames)
    when MaxZone >= MinZone ->
    TabName =
	c_formation_role_mgr:match_tab(c_formation_role_mgr:zone_id_to_match(MinZone)),
    case lists:member(TabName, TabNames) of
      true ->
	  zone_id_to_match(MinZone + 10, MaxZone, TabNames);
      _ ->
	  zone_id_to_match(MinZone + 10, MaxZone,
			   [TabName | TabNames])
    end;
zone_id_to_match(_MinZone, MaxZone, TabNames) ->
    TabName =
	c_formation_role_mgr:match_tab(c_formation_role_mgr:zone_id_to_match(MaxZone)),
    case lists:member(TabName, TabNames) of
      true -> TabNames;
      _ -> [TabName | TabNames]
    end.


