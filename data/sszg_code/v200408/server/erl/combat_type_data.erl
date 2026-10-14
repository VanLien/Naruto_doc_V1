-file("src/mod/data/combat_type_data.erl", 1).

-module(combat_type_data).

-lager_records([]).

-export([get_const/1, can_revive/1, get_combat_name/1,
	 get_max_partner_num/1, get_revive_count/1, can_add_hp/1,
	 max_time/1, get_init_formation/1,
	 get_max_action_count/1, is_pvp/1, action_time/1,
	 is_use_balance_mode/1, get_is_save_partner_log/1,
	 get_balance_attr/1, get_balance_msg/1,
	 need_enter_combat/1, is_skip/1, get_special_par/1,
	 per_speed/1, get_combat_speed/1]).

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

-file("src/mod/data/combat_type_data.erl", 29).

get_const(pk_agree_timeout) -> 180;
get_const(pk_req_timeout) -> 0;
get_const(_) -> undefined.

can_revive(1) -> false;
can_revive(2) -> false;
can_revive(3) -> false;
can_revive(4) -> false;
can_revive(5) -> false;
can_revive(6) -> false;
can_revive(7) -> false;
can_revive(8) -> false;
can_revive(9) -> false;
can_revive(10) -> false;
can_revive(11) -> false;
can_revive(12) -> false;
can_revive(13) -> false;
can_revive(14) -> false;
can_revive(15) -> false;
can_revive(16) -> false;
can_revive(17) -> false;
can_revive(18) -> false;
can_revive(19) -> false;
can_revive(20) -> false;
can_revive(21) -> false;
can_revive(22) -> false;
can_revive(23) -> false;
can_revive(24) -> false;
can_revive(25) -> false;
can_revive(26) -> false;
can_revive(27) -> false;
can_revive(28) -> false;
can_revive(29) -> false;
can_revive(30) -> false;
can_revive(31) -> false;
can_revive(32) -> false;
can_revive(33) -> false;
can_revive(34) -> false;
can_revive(35) -> false;
can_revive(36) -> false;
can_revive(37) -> false;
can_revive(38) -> false;
can_revive(39) -> false;
can_revive(40) -> false;
can_revive(41) -> false;
can_revive(42) -> false;
can_revive(43) -> false;
can_revive(101) -> false;
can_revive(102) -> false;
can_revive(103) -> false;
can_revive(104) -> false;
can_revive(105) -> false;
can_revive(_) -> true.

get_combat_name(1) -> lang:get(<<"测试战斗"/utf8>>);
get_combat_name(2) -> lang:get(<<"竞技场"/utf8>>);
get_combat_name(3) -> lang:get(<<"剧情副本"/utf8>>);
get_combat_name(4) -> <<"BOSS">>;
get_combat_name(5) -> lang:get(<<"世界BOSS"/utf8>>);
get_combat_name(6) -> lang:get(<<"神界冒险"/utf8>>);
get_combat_name(7) -> lang:get(<<"星命塔"/utf8>>);
get_combat_name(8) -> lang:get(<<"切磋"/utf8>>);
get_combat_name(9) -> lang:get(<<"公会副本"/utf8>>);
get_combat_name(10) -> lang:get(<<"冠军赛"/utf8>>);
get_combat_name(11) -> lang:get(<<"无尽试炼"/utf8>>);
get_combat_name(12) -> lang:get(<<"活动BOSS"/utf8>>);
get_combat_name(13) -> lang:get(<<"萌兽夺宝"/utf8>>);
get_combat_name(14) -> lang:get(<<"宝石副本"/utf8>>);
get_combat_name(15) -> lang:get(<<"众神战场"/utf8>>);
get_combat_name(16) -> lang:get(<<"公会战"/utf8>>);
get_combat_name(17) -> lang:get(<<"星河神殿"/utf8>>);
get_combat_name(18) -> lang:get(<<"跨服天梯"/utf8>>);
get_combat_name(19) -> lang:get(<<"金币副本"/utf8>>);
get_combat_name(20) -> lang:get(<<"英雄碎片副本"/utf8>>);
get_combat_name(21) -> lang:get(<<"英雄远征"/utf8>>);
get_combat_name(22) -> lang:get(<<"元宵活动BOSS"/utf8>>);
get_combat_name(23) -> lang:get(<<"精英段位赛_常规赛"/utf8>>);
get_combat_name(24) -> lang:get(<<"精英段位赛_王者赛"/utf8>>);
get_combat_name(25) -> lang:get(<<"元素神殿"/utf8>>);
get_combat_name(26) -> lang:get(<<"英雄试玩"/utf8>>);
get_combat_name(27) -> lang:get(<<"天界副本"/utf8>>);
get_combat_name(28) -> lang:get(<<"跨服竞技场"/utf8>>);
get_combat_name(29) -> lang:get(<<"试炼之境"/utf8>>);
get_combat_name(30) -> lang:get(<<"秘矿争夺"/utf8>>);
get_combat_name(31) -> lang:get(<<"周冠军赛"/utf8>>);
get_combat_name(32) -> lang:get(<<"开学季_关卡"/utf8>>);
get_combat_name(33) -> lang:get(<<"开学季_boss"/utf8>>);
get_combat_name(34) -> lang:get(<<"公会秘境"/utf8>>);
get_combat_name(35) -> lang:get(<<"组队竞技场"/utf8>>);
get_combat_name(36) -> lang:get(<<"新手训练营"/utf8>>);
get_combat_name(37) -> lang:get(<<"巅峰冠军赛"/utf8>>);
get_combat_name(38) -> lang:get(<<"旧位面战斗（弃用）"/utf8>>);
get_combat_name(39) -> lang:get(<<"新年活动战斗"/utf8>>);
get_combat_name(40) -> lang:get(<<"位面战斗"/utf8>>);
get_combat_name(41) -> lang:get(<<"活力大作战"/utf8>>);
get_combat_name(42) -> lang:get(<<"协力段位赛"/utf8>>);
get_combat_name(43) -> lang:get(<<"武神殿"/utf8>>);
get_combat_name(101) -> lang:get(<<"万圣节大富翁第1场景"/utf8>>);
get_combat_name(102) -> lang:get(<<"万圣节大富翁第2场景"/utf8>>);
get_combat_name(103) -> lang:get(<<"万圣节大富翁第3场景"/utf8>>);
get_combat_name(104) -> lang:get(<<"万圣节大富翁第4场景"/utf8>>);
get_combat_name(105) -> lang:get(<<"万圣节Boss战"/utf8>>);
get_combat_name(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcombat_type_data132, _,
       {__Levelcombat_type_data132,
	__Tracescombat_type_data132}}
	  when __Levelcombat_type_data132 band 8 /= 0 orelse
		 __Tracescombat_type_data132 /= [] ->
	  lager:do_log(error,
		       [{module, combat_type_data},
			{function, get_combat_name}, {line, 132},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_combat_name_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelcombat_type_data132,
		       __Tracescombat_type_data132, lager_event,
		       __Pidcombat_type_data132);
      _ -> ok
    end,
    undefined.

get_max_partner_num(1) -> 5;
get_max_partner_num(2) -> 5;
get_max_partner_num(3) -> 5;
get_max_partner_num(4) -> 5;
get_max_partner_num(5) -> 5;
get_max_partner_num(6) -> 5;
get_max_partner_num(7) -> 5;
get_max_partner_num(8) -> 5;
get_max_partner_num(9) -> 5;
get_max_partner_num(10) -> 5;
get_max_partner_num(11) -> 5;
get_max_partner_num(12) -> 5;
get_max_partner_num(13) -> 5;
get_max_partner_num(14) -> 5;
get_max_partner_num(15) -> 5;
get_max_partner_num(16) -> 5;
get_max_partner_num(17) -> 5;
get_max_partner_num(18) -> 5;
get_max_partner_num(19) -> 5;
get_max_partner_num(20) -> 5;
get_max_partner_num(21) -> 5;
get_max_partner_num(22) -> 5;
get_max_partner_num(23) -> 5;
get_max_partner_num(24) -> 5;
get_max_partner_num(25) -> 5;
get_max_partner_num(26) -> 5;
get_max_partner_num(27) -> 5;
get_max_partner_num(28) -> 5;
get_max_partner_num(29) -> 5;
get_max_partner_num(30) -> 5;
get_max_partner_num(31) -> 5;
get_max_partner_num(32) -> 5;
get_max_partner_num(33) -> 5;
get_max_partner_num(34) -> 5;
get_max_partner_num(35) -> 5;
get_max_partner_num(36) -> 5;
get_max_partner_num(37) -> 5;
get_max_partner_num(38) -> 5;
get_max_partner_num(39) -> 5;
get_max_partner_num(40) -> 5;
get_max_partner_num(41) -> 5;
get_max_partner_num(42) -> 5;
get_max_partner_num(43) -> 5;
get_max_partner_num(101) -> 5;
get_max_partner_num(102) -> 5;
get_max_partner_num(103) -> 5;
get_max_partner_num(104) -> 5;
get_max_partner_num(105) -> 5;
get_max_partner_num(_) -> 5.

get_revive_count(1) -> 0;
get_revive_count(2) -> 0;
get_revive_count(3) -> 0;
get_revive_count(4) -> 0;
get_revive_count(5) -> 0;
get_revive_count(6) -> 0;
get_revive_count(7) -> 0;
get_revive_count(8) -> 0;
get_revive_count(9) -> 0;
get_revive_count(10) -> 0;
get_revive_count(11) -> 0;
get_revive_count(12) -> 0;
get_revive_count(13) -> 0;
get_revive_count(14) -> 0;
get_revive_count(15) -> 0;
get_revive_count(16) -> 0;
get_revive_count(17) -> 0;
get_revive_count(18) -> 0;
get_revive_count(19) -> 0;
get_revive_count(20) -> 0;
get_revive_count(21) -> 0;
get_revive_count(22) -> 0;
get_revive_count(23) -> 0;
get_revive_count(24) -> 0;
get_revive_count(25) -> 0;
get_revive_count(26) -> 0;
get_revive_count(27) -> 0;
get_revive_count(28) -> 0;
get_revive_count(29) -> 0;
get_revive_count(30) -> 0;
get_revive_count(31) -> 0;
get_revive_count(32) -> 0;
get_revive_count(33) -> 0;
get_revive_count(34) -> 0;
get_revive_count(35) -> 0;
get_revive_count(36) -> 0;
get_revive_count(37) -> 0;
get_revive_count(38) -> 0;
get_revive_count(39) -> 0;
get_revive_count(40) -> 0;
get_revive_count(41) -> 0;
get_revive_count(42) -> 0;
get_revive_count(43) -> 0;
get_revive_count(101) -> 0;
get_revive_count(102) -> 0;
get_revive_count(103) -> 0;
get_revive_count(104) -> 0;
get_revive_count(105) -> 0;
get_revive_count(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcombat_type_data232, _,
       {__Levelcombat_type_data232,
	__Tracescombat_type_data232}}
	  when __Levelcombat_type_data232 band 8 /= 0 orelse
		 __Tracescombat_type_data232 /= [] ->
	  lager:do_log(error,
		       [{module, combat_type_data},
			{function, get_revive_count}, {line, 232},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_revive_count_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelcombat_type_data232,
		       __Tracescombat_type_data232, lager_event,
		       __Pidcombat_type_data232);
      _ -> ok
    end,
    undefined.

can_add_hp(1) -> true;
can_add_hp(2) -> false;
can_add_hp(3) -> true;
can_add_hp(4) -> true;
can_add_hp(5) -> true;
can_add_hp(6) -> true;
can_add_hp(7) -> true;
can_add_hp(8) -> true;
can_add_hp(9) -> true;
can_add_hp(10) -> true;
can_add_hp(11) -> false;
can_add_hp(12) -> true;
can_add_hp(13) -> true;
can_add_hp(14) -> true;
can_add_hp(15) -> true;
can_add_hp(16) -> true;
can_add_hp(17) -> true;
can_add_hp(18) -> true;
can_add_hp(19) -> true;
can_add_hp(20) -> true;
can_add_hp(21) -> true;
can_add_hp(22) -> true;
can_add_hp(23) -> true;
can_add_hp(24) -> true;
can_add_hp(25) -> true;
can_add_hp(26) -> true;
can_add_hp(27) -> true;
can_add_hp(28) -> true;
can_add_hp(29) -> true;
can_add_hp(30) -> true;
can_add_hp(31) -> true;
can_add_hp(32) -> true;
can_add_hp(33) -> true;
can_add_hp(34) -> true;
can_add_hp(35) -> true;
can_add_hp(36) -> true;
can_add_hp(37) -> true;
can_add_hp(38) -> true;
can_add_hp(39) -> true;
can_add_hp(40) -> true;
can_add_hp(41) -> true;
can_add_hp(42) -> true;
can_add_hp(43) -> true;
can_add_hp(101) -> true;
can_add_hp(102) -> true;
can_add_hp(103) -> true;
can_add_hp(104) -> true;
can_add_hp(105) -> true;
can_add_hp(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcombat_type_data282, _,
       {__Levelcombat_type_data282,
	__Tracescombat_type_data282}}
	  when __Levelcombat_type_data282 band 8 /= 0 orelse
		 __Tracescombat_type_data282 /= [] ->
	  lager:do_log(error,
		       [{module, combat_type_data}, {function, can_add_hp},
			{line, 282}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("can_add_hp_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelcombat_type_data282,
		       __Tracescombat_type_data282, lager_event,
		       __Pidcombat_type_data282);
      _ -> ok
    end,
    undefined.

max_time(2) -> 600;
max_time(_) -> 0.

get_init_formation(1) -> 1;
get_init_formation(2) -> 1;
get_init_formation(4) -> 1;
get_init_formation(5) -> 1;
get_init_formation(6) -> 1;
get_init_formation(7) -> 1;
get_init_formation(8) -> 1;
get_init_formation(9) -> 1;
get_init_formation(10) -> 1;
get_init_formation(11) -> 1;
get_init_formation(12) -> 1;
get_init_formation(13) -> 1;
get_init_formation(14) -> 1;
get_init_formation(15) -> 1;
get_init_formation(16) -> 1;
get_init_formation(17) -> 1;
get_init_formation(18) -> 1;
get_init_formation(19) -> 1;
get_init_formation(20) -> 1;
get_init_formation(21) -> 1;
get_init_formation(22) -> 1;
get_init_formation(23) -> 1;
get_init_formation(24) -> 1;
get_init_formation(25) -> 1;
get_init_formation(26) -> 1;
get_init_formation(27) -> 1;
get_init_formation(28) -> 1;
get_init_formation(29) -> 1;
get_init_formation(30) -> 1;
get_init_formation(31) -> 1;
get_init_formation(32) -> 1;
get_init_formation(33) -> 1;
get_init_formation(34) -> 1;
get_init_formation(35) -> 1;
get_init_formation(36) -> 1;
get_init_formation(37) -> 1;
get_init_formation(38) -> 1;
get_init_formation(39) -> 1;
get_init_formation(40) -> 1;
get_init_formation(41) -> 1;
get_init_formation(42) -> 1;
get_init_formation(43) -> 1;
get_init_formation(101) -> 1;
get_init_formation(102) -> 1;
get_init_formation(103) -> 1;
get_init_formation(104) -> 1;
get_init_formation(105) -> 1;
get_init_formation(_) -> 0.

get_max_action_count(1) -> 30;
get_max_action_count(2) -> 20;
get_max_action_count(3) -> 15;
get_max_action_count(4) -> 20;
get_max_action_count(5) -> 10;
get_max_action_count(6) -> 15;
get_max_action_count(7) -> 15;
get_max_action_count(8) -> 30;
get_max_action_count(9) -> 5;
get_max_action_count(10) -> 30;
get_max_action_count(11) -> 10;
get_max_action_count(12) -> 10;
get_max_action_count(13) -> 10;
get_max_action_count(14) -> 10;
get_max_action_count(15) -> 30;
get_max_action_count(16) -> 20;
get_max_action_count(17) -> 10;
get_max_action_count(18) -> 20;
get_max_action_count(19) -> 10;
get_max_action_count(20) -> 10;
get_max_action_count(21) -> 15;
get_max_action_count(22) -> 15;
get_max_action_count(23) -> 15;
get_max_action_count(24) -> 15;
get_max_action_count(25) -> 15;
get_max_action_count(26) -> 15;
get_max_action_count(27) -> 15;
get_max_action_count(28) -> 15;
get_max_action_count(29) -> 10;
get_max_action_count(30) -> 15;
get_max_action_count(31) -> 30;
get_max_action_count(32) -> 8;
get_max_action_count(33) -> 5;
get_max_action_count(34) -> 20;
get_max_action_count(35) -> 30;
get_max_action_count(36) -> 15;
get_max_action_count(37) -> 30;
get_max_action_count(38) -> 20;
get_max_action_count(39) -> 15;
get_max_action_count(40) -> 20;
get_max_action_count(41) -> 12;
get_max_action_count(42) -> 15;
get_max_action_count(43) -> 8;
get_max_action_count(101) -> 15;
get_max_action_count(102) -> 15;
get_max_action_count(103) -> 15;
get_max_action_count(104) -> 15;
get_max_action_count(105) -> 10;
get_max_action_count(_) -> 999.

is_pvp(15) -> 1;
is_pvp(16) -> 1;
is_pvp(23) -> 1;
is_pvp(24) -> 1;
is_pvp(31) -> 1;
is_pvp(37) -> 1;
is_pvp(_) -> 0.

action_time(_) -> 0.

is_use_balance_mode(2) -> 2;
is_use_balance_mode(8) -> 2;
is_use_balance_mode(10) -> 2;
is_use_balance_mode(16) -> 2;
is_use_balance_mode(18) -> 2;
is_use_balance_mode(23) -> 2;
is_use_balance_mode(24) -> 2;
is_use_balance_mode(28) -> 2;
is_use_balance_mode(30) -> 2;
is_use_balance_mode(31) -> 2;
is_use_balance_mode(35) -> 2;
is_use_balance_mode(37) -> 2;
is_use_balance_mode(38) -> 2;
is_use_balance_mode(40) -> 2;
is_use_balance_mode(42) -> 2;
is_use_balance_mode(101) -> 2;
is_use_balance_mode(102) -> 2;
is_use_balance_mode(103) -> 2;
is_use_balance_mode(104) -> 2;
is_use_balance_mode(_) -> 0.

get_is_save_partner_log(1) -> 0;
get_is_save_partner_log(2) -> 0;
get_is_save_partner_log(3) -> 0;
get_is_save_partner_log(4) -> 0;
get_is_save_partner_log(5) -> 0;
get_is_save_partner_log(6) -> 0;
get_is_save_partner_log(7) -> 0;
get_is_save_partner_log(8) -> 0;
get_is_save_partner_log(9) -> 0;
get_is_save_partner_log(10) -> 1;
get_is_save_partner_log(11) -> 0;
get_is_save_partner_log(12) -> 0;
get_is_save_partner_log(13) -> 0;
get_is_save_partner_log(14) -> 0;
get_is_save_partner_log(15) -> 0;
get_is_save_partner_log(16) -> 0;
get_is_save_partner_log(17) -> 0;
get_is_save_partner_log(18) -> 0;
get_is_save_partner_log(19) -> 0;
get_is_save_partner_log(20) -> 0;
get_is_save_partner_log(21) -> 0;
get_is_save_partner_log(22) -> 0;
get_is_save_partner_log(23) -> 1;
get_is_save_partner_log(24) -> 1;
get_is_save_partner_log(25) -> 1;
get_is_save_partner_log(26) -> 0;
get_is_save_partner_log(27) -> 1;
get_is_save_partner_log(28) -> 0;
get_is_save_partner_log(29) -> 0;
get_is_save_partner_log(30) -> 0;
get_is_save_partner_log(31) -> 0;
get_is_save_partner_log(32) -> 0;
get_is_save_partner_log(33) -> 0;
get_is_save_partner_log(34) -> 0;
get_is_save_partner_log(35) -> 0;
get_is_save_partner_log(36) -> 0;
get_is_save_partner_log(37) -> 0;
get_is_save_partner_log(38) -> 0;
get_is_save_partner_log(39) -> 0;
get_is_save_partner_log(40) -> 1;
get_is_save_partner_log(41) -> 0;
get_is_save_partner_log(42) -> 0;
get_is_save_partner_log(43) -> 0;
get_is_save_partner_log(101) -> 0;
get_is_save_partner_log(102) -> 0;
get_is_save_partner_log(103) -> 0;
get_is_save_partner_log(104) -> 0;
get_is_save_partner_log(105) -> 0;
get_is_save_partner_log(_) -> 0.

get_balance_attr({1, 11}) -> [{dam, 30}];
get_balance_attr({1, 12}) -> [{dam, 30}];
get_balance_attr({1, 13}) -> [{dam, 30}];
get_balance_attr({1, 14}) -> [{dam, 30}];
get_balance_attr({1, 15}) -> [{dam, 30}];
get_balance_attr({1, 16}) -> [{dam, 30}];
get_balance_attr({1, 17}) -> [{dam, 30}];
get_balance_attr({1, 18}) -> [{dam, 30}];
get_balance_attr({1, 19}) -> [{dam, 30}];
get_balance_attr({1, 20}) -> [{dam, 30}];
get_balance_attr({1, 21}) -> [{dam, 50}];
get_balance_attr({1, 22}) -> [{dam, 50}];
get_balance_attr({1, 23}) -> [{dam, 50}];
get_balance_attr({1, 24}) -> [{dam, 50}];
get_balance_attr({1, 25}) -> [{dam, 50}];
get_balance_attr({1, 26}) -> [{dam, 50}];
get_balance_attr({1, 27}) -> [{dam, 50}];
get_balance_attr({1, 28}) -> [{dam, 50}];
get_balance_attr({1, 29}) -> [{dam, 50}];
get_balance_attr({1, 30}) -> [{dam, 50}];
get_balance_attr({2, 11}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 12}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 13}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 14}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 15}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 16}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 17}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 18}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 19}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 20}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 21}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 22}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 23}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 24}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 25}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 26}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 27}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 28}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 29}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({2, 30}) ->
    [{res, -50}, {be_cure, -50}];
get_balance_attr({3, 1}) -> [{be_cure, -1000}];
get_balance_attr({3, 2}) ->
    [{be_cure, -1000}, {res, -100}];
get_balance_attr({3, 3}) ->
    [{be_cure, -2000}, {res, -200}];
get_balance_attr({3, 4}) ->
    [{be_cure, -1000}, {res, -1000}];
get_balance_attr({3, 5}) ->
    [{be_cure, -1000}, {res, -2000}];
get_balance_attr({3, 6}) ->
    [{be_cure, -1000}, {res, -2000}];
get_balance_attr({3, 7}) ->
    [{be_cure, -1000}, {res, -2000}];
get_balance_attr({3, 8}) ->
    [{be_cure, -1000}, {res, -2000}];
get_balance_attr(_) -> [].

get_balance_msg({1, 11}) ->
    lang:get(<<"天平模式开启，全体伤害+3%"/utf8>>);
get_balance_msg({1, 12}) ->
    lang:get(<<"天平模式开启，全体伤害+6%"/utf8>>);
get_balance_msg({1, 13}) ->
    lang:get(<<"天平模式开启，全体伤害+9%"/utf8>>);
get_balance_msg({1, 14}) ->
    lang:get(<<"天平模式开启，全体伤害+12%"/utf8>>);
get_balance_msg({1, 15}) ->
    lang:get(<<"天平模式开启，全体伤害+15%"/utf8>>);
get_balance_msg({1, 16}) ->
    lang:get(<<"天平模式开启，全体伤害+18%"/utf8>>);
get_balance_msg({1, 17}) ->
    lang:get(<<"天平模式开启，全体伤害+21%"/utf8>>);
get_balance_msg({1, 18}) ->
    lang:get(<<"天平模式开启，全体伤害+24%"/utf8>>);
get_balance_msg({1, 19}) ->
    lang:get(<<"天平模式开启，全体伤害+27%"/utf8>>);
get_balance_msg({1, 20}) ->
    lang:get(<<"天平模式开启，全体伤害+30%"/utf8>>);
get_balance_msg({1, 21}) ->
    lang:get(<<"天平模式开启，全体伤害+35%"/utf8>>);
get_balance_msg({1, 22}) ->
    lang:get(<<"天平模式开启，全体伤害+40%"/utf8>>);
get_balance_msg({1, 23}) ->
    lang:get(<<"天平模式开启，全体伤害+45%"/utf8>>);
get_balance_msg({1, 24}) ->
    lang:get(<<"天平模式开启，全体伤害+50%"/utf8>>);
get_balance_msg({1, 25}) ->
    lang:get(<<"天平模式开启，全体伤害+55%"/utf8>>);
get_balance_msg({1, 26}) ->
    lang:get(<<"天平模式开启，全体伤害+60%"/utf8>>);
get_balance_msg({1, 27}) ->
    lang:get(<<"天平模式开启，全体伤害+65%"/utf8>>);
get_balance_msg({1, 28}) ->
    lang:get(<<"天平模式开启，全体伤害+70%"/utf8>>);
get_balance_msg({1, 29}) ->
    lang:get(<<"天平模式开启，全体伤害+75%"/utf8>>);
get_balance_msg({1, 30}) ->
    lang:get(<<"天平模式开启，全体伤害+80%"/utf8>>);
get_balance_msg({2, 11}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-5%"/utf8>>);
get_balance_msg({2, 12}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-10%"/utf8>>);
get_balance_msg({2, 13}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-15%"/utf8>>);
get_balance_msg({2, 14}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-20%"/utf8>>);
get_balance_msg({2, 15}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-25%"/utf8>>);
get_balance_msg({2, 16}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-30%"/utf8>>);
get_balance_msg({2, 17}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-35%"/utf8>>);
get_balance_msg({2, 18}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-40%"/utf8>>);
get_balance_msg({2, 19}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-45%"/utf8>>);
get_balance_msg({2, 20}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-50%"/utf8>>);
get_balance_msg({2, 21}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-55%"/utf8>>);
get_balance_msg({2, 22}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-60%"/utf8>>);
get_balance_msg({2, 23}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-65%"/utf8>>);
get_balance_msg({2, 24}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-70%"/utf8>>);
get_balance_msg({2, 25}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-75%"/utf8>>);
get_balance_msg({2, 26}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-80%"/utf8>>);
get_balance_msg({2, 27}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-85%"/utf8>>);
get_balance_msg({2, 28}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-90%"/utf8>>);
get_balance_msg({2, 29}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-95%"/utf8>>);
get_balance_msg({2, 30}) ->
    lang:get(<<"天平模式开启，全体免伤和受疗-100%"/utf8>>);
get_balance_msg({3, 1}) ->
    lang:get(<<"全体被治疗效果-10%"/utf8>>);
get_balance_msg({3, 2}) ->
    lang:get(<<"全体被治疗效果-10%,伤害+10%"/utf8>>);
get_balance_msg({3, 3}) ->
    lang:get(<<"全体被治疗效果-20%,伤害+20%"/utf8>>);
get_balance_msg({3, 4}) ->
    lang:get(<<"全体被治疗效果-30%,伤害+30%"/utf8>>);
get_balance_msg({3, 5}) ->
    lang:get(<<"全体被治疗效果-40%,伤害+40%"/utf8>>);
get_balance_msg({3, 6}) ->
    lang:get(<<"全体被治疗效果-50%,伤害+60%"/utf8>>);
get_balance_msg({3, 7}) ->
    lang:get(<<"全体被治疗效果-60%,伤害+80%"/utf8>>);
get_balance_msg({3, 8}) ->
    lang:get(<<"全体被治疗效果-70%,伤害+100%"/utf8>>);
get_balance_msg(_) -> <<>>.

need_enter_combat(_) -> true.

is_skip(1) -> true;
is_skip(2) -> true;
is_skip(3) -> true;
is_skip(4) -> true;
is_skip(5) -> true;
is_skip(6) -> true;
is_skip(7) -> true;
is_skip(8) -> true;
is_skip(9) -> true;
is_skip(10) -> true;
is_skip(11) -> true;
is_skip(12) -> true;
is_skip(13) -> true;
is_skip(14) -> true;
is_skip(15) -> true;
is_skip(16) -> true;
is_skip(17) -> true;
is_skip(18) -> true;
is_skip(19) -> true;
is_skip(20) -> true;
is_skip(21) -> true;
is_skip(22) -> true;
is_skip(23) -> true;
is_skip(24) -> true;
is_skip(25) -> true;
is_skip(26) -> true;
is_skip(27) -> true;
is_skip(28) -> true;
is_skip(29) -> true;
is_skip(30) -> true;
is_skip(31) -> true;
is_skip(32) -> true;
is_skip(33) -> true;
is_skip(34) -> true;
is_skip(35) -> true;
is_skip(36) -> true;
is_skip(37) -> true;
is_skip(38) -> true;
is_skip(39) -> true;
is_skip(40) -> true;
is_skip(41) -> true;
is_skip(42) -> true;
is_skip(43) -> true;
is_skip(101) -> true;
is_skip(102) -> true;
is_skip(103) -> true;
is_skip(104) -> true;
is_skip(105) -> true;
is_skip(_) -> false.

get_special_par(25) ->
    [30008, 30001, 30025, 30004, 30020, 30007, 30010, 30014,
     30019, 30003, 30022, 30011, 20002, 20027, 20007, 20018,
     10002];
get_special_par(28) ->
    [30024, 30002, 30006, 30005, 30018, 20006, 10001, 20021,
     20019, 20003, 20023, 10003, 10004];
get_special_par(29) ->
    [30010, 30007, 30013, 30019, 30012, 30003, 30022, 20022,
     20027, 20020, 20017, 10010, 10002];
get_special_par(_) -> [].

per_speed(1) -> 0;
per_speed(2) -> 0;
per_speed(3) -> 0;
per_speed(4) -> 0;
per_speed(5) -> 0;
per_speed(6) -> 0;
per_speed(7) -> 0;
per_speed(8) -> 0;
per_speed(9) -> 0;
per_speed(10) -> 0;
per_speed(11) -> 0;
per_speed(12) -> 0;
per_speed(13) -> 0;
per_speed(15) -> 0;
per_speed(16) -> 0;
per_speed(17) -> 0;
per_speed(18) -> 0;
per_speed(19) -> 0;
per_speed(20) -> 0;
per_speed(21) -> 0;
per_speed(22) -> 0;
per_speed(23) -> 0;
per_speed(24) -> 0;
per_speed(25) -> 0;
per_speed(26) -> 0;
per_speed(27) -> 0;
per_speed(28) -> 0;
per_speed(29) -> 0;
per_speed(30) -> 0;
per_speed(31) -> 0;
per_speed(32) -> 0;
per_speed(33) -> 0;
per_speed(34) -> 0;
per_speed(35) -> 0;
per_speed(36) -> 0;
per_speed(37) -> 0;
per_speed(38) -> 0;
per_speed(39) -> 0;
per_speed(40) -> 0;
per_speed(41) -> 0;
per_speed(42) -> 0;
per_speed(43) -> 0;
per_speed(101) -> 0;
per_speed(102) -> 0;
per_speed(103) -> 0;
per_speed(104) -> 0;
per_speed(105) -> 0;
per_speed(_) -> 0.

get_combat_speed(1) -> {1, 0};
get_combat_speed(2) -> {1, 0};
get_combat_speed(3) -> {1, 0};
get_combat_speed(_Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcombat_type_data678, _,
       {__Levelcombat_type_data678,
	__Tracescombat_type_data678}}
	  when __Levelcombat_type_data678 band 8 /= 0 orelse
		 __Tracescombat_type_data678 /= [] ->
	  lager:do_log(error,
		       [{module, combat_type_data},
			{function, get_combat_speed}, {line, 678},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("get_combat_speed_data_not_exist===>~w",
				     [_Info]),
		       none, 4096, 8, __Levelcombat_type_data678,
		       __Tracescombat_type_data678, lager_event,
		       __Pidcombat_type_data678);
      _ -> ok
    end,
    undefined.


