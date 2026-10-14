-file("data/element_temple_ver.erl", 1).

-file("src/mod/element_temple/element_temple_ver.erl",
      1).

-module(element_temple_ver).

-lager_records([{m_element_temple,
		 [ver, combat_num, buy_num, refresh_num_time, end_time,
		  combat_list, privilege_free_num, privilege_buy_num]}]).

-export([do/1]).

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

-file("src/mod/element_temple/element_temple_ver.erl",
      11).

-file("inc/element_temple.hrl", 1).

-record(m_element_temple,
	{ver = 2, combat_num = 0, buy_num = 0,
	 refresh_num_time = 0, end_time = 0, combat_list = [],
	 privilege_free_num = 0, privilege_buy_num = 0}).

-file("src/mod/element_temple/element_temple_ver.erl",
      12).

do({m_element_temple, Ver = 1, CombatNum, BuyNum,
    RefreshNumTime, EndTime, CombatList}) ->
    MElementTemple = {m_element_temple, Ver + 1, CombatNum,
		      BuyNum, RefreshNumTime, EndTime, CombatList, 0, 0},
    do(MElementTemple);
do(MElementTemple = #m_element_temple{ver = 2}) ->
    {ok, MElementTemple};
do(MElementTemple) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidelement_temple_ver19, _,
       {__Levelelement_temple_ver19,
	__Traceselement_temple_ver19}}
	  when __Levelelement_temple_ver19 band 8 /= 0 orelse
		 __Traceselement_temple_ver19 /= [] ->
	  lager:do_log(error,
		       [{module, element_temple_ver}, {function, do},
			{line, 19}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [MElementTemple]), none,
		       4096, 8, __Levelelement_temple_ver19,
		       __Traceselement_temple_ver19, lager_event,
		       __Pidelement_temple_ver19);
      _ -> ok
    end,
    {false,
     lang:get(<<"Chuyển đổi dữ liệu Thần Điện Nguyên "
		"Tố thất bại"/utf8>>)}.


