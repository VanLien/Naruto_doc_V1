-file("src/proto/proto_250.erl", 1).

-module(proto_250).

-lager_records([{formation_attr_data,
		 [type, lev, expend, attr_1, attr_2, attr_3, attr_4,
		  attr_5, attr_6, attr_7, attr_8, attr_9, power]},
		{formation_data,
		 [type, pos, need_lev, name, need_items, restrain_s,
		  restrain_w]},
		{formation_info_p, [id, name, power, pos_info]},
		{pk_formation_info,
		 [id, name, formation, ffor_target, power, is_ready,
		  guild_name, lev, face_id, pid]},
		{formation_fight_info, [pos, fight_pos, id]},
		{formation_base_p,
		 [id, lev, exp, pos_info, formation_list, power,
		  hallows_id, all_lineups]},
		{formation_pos, [pos, id]},
		{formation_lineup,
		 [id, name, power, pos_info, max_power, type,
		  hallows_id]},
		{formation_sys, [id, type, pos_info, hallows_id]},
		{m_formation,
		 [ver, list, use_lineup, all_lineups, sys_formations]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

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

-file("src/proto/proto_250.erl", 16).

-file("inc/formation.hrl", 1).

-record(m_formation,
	{ver = 1, list = [], use_lineup = 1, all_lineups = [],
	 sys_formations = []}).

-record(formation_sys,
	{id = 1, type = 1, pos_info = [], hallows_id = 0}).

-record(formation_lineup,
	{id = 1, name = <<>>, power = 0, pos_info = [],
	 max_power = 0, type = 1, hallows_id = 0}).

-record(formation_pos, {pos, id = 0}).

-record(formation_base_p,
	{id, lev, exp, pos_info, formation_list, power,
	 hallows_id = 0, all_lineups}).

-record(formation_fight_info, {pos, fight_pos, id = 0}).

-record(pk_formation_info,
	{id, name, formation, ffor_target, power,
	 is_ready = false, guild_name = <<>>, lev = 0, face_id,
	 pid = none}).

-record(formation_info_p,
	{id = 0, name = <<>>, power = 0, pos_info = []}).

-record(formation_data,
	{type, pos, need_lev, name, need_items = [],
	 restrain_s = [], restrain_w = []}).

-record(formation_attr_data,
	{type, lev, expend = [], attr_1 = [], attr_2 = [],
	 attr_3 = [], attr_4 = [], attr_5 = [], attr_6 = [],
	 attr_7 = [], attr_8 = [], attr_9 = [], power}).

-file("src/proto/proto_250.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25000, cli, {}) -> {ok, <<2:32, 25000:16>>};
pack(25000, srv,
     {V0_day, V0_num, V0_buy_num, V0_refresh_time,
      V0_pr_buy_num, V0_list}) ->
    D_a_t_a = <<V0_day:8, V0_num:8, V0_buy_num:8,
		V0_refresh_time:32, V0_pr_buy_num:32,
		(length(V0_list)):16,
		(list_to_binary([<<V1_type:8, V1_group:16,
				   V1_boss_id:32, V1_endtime:32>>
				 || {V1_type, V1_group, V1_boss_id, V1_endtime}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25000:16,
       D_a_t_a/binary>>};
pack(25001, cli,
     {V0_type, V0_boss_id, V0_formation_type, V0_pos_info,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_type:8, V0_boss_id:32,
		V0_formation_type:16, (length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || #formation_pos{pos = V1_pos, id = V1_id}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25001:16,
       D_a_t_a/binary>>};
pack(25001, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25001:16,
       D_a_t_a/binary>>};
pack(25002, cli, {V0_type, V0_boss_id}) ->
    D_a_t_a = <<V0_type:8, V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25002:16,
       D_a_t_a/binary>>};
pack(25002, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25002:16,
       D_a_t_a/binary>>};
pack(25003, cli, {}) -> {ok, <<2:32, 25003:16>>};
pack(25003, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25003:16,
       D_a_t_a/binary>>};
pack(25004, cli, {}) -> {ok, <<2:32, 25004:16>>};
pack(25004, srv,
     {V0_num, V0_buy_num, V0_pr_buy_num, V0_refresh_time}) ->
    D_a_t_a = <<V0_num:8, V0_buy_num:8, V0_pr_buy_num:32,
		V0_refresh_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25004:16,
       D_a_t_a/binary>>};
pack(25005, cli, {}) -> {ok, <<2:32, 25005:16>>};
pack(25005, srv, {V0_type, V0_group, V0_boss_id}) ->
    D_a_t_a = <<V0_type:8, V0_group:16, V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25005:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25000, srv, _B0) -> {ok, {}};
unpack(25000, cli, _B0) ->
    {V1_day, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {V1_buy_num, _B3} = protocol:uint8(_B2),
    {V1_refresh_time, _B4} = protocol:uint32(_B3),
    {V1_pr_buy_num, _B5} = protocol:uint32(_B4),
    {V1_list, _B12} = protocol:array(_B5,
				     fun (_B6) ->
					     {V2_type, _B7} =
						 protocol:uint8(_B6),
					     {V2_group, _B8} =
						 protocol:uint16(_B7),
					     {V2_boss_id, _B9} =
						 protocol:uint32(_B8),
					     {V2_endtime, _B10} =
						 protocol:uint32(_B9),
					     {{V2_type, V2_group, V2_boss_id,
					       V2_endtime},
					      _B10}
				     end),
    {ok,
     {V1_day, V1_num, V1_buy_num, V1_refresh_time,
      V1_pr_buy_num, V1_list}};
unpack(25001, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_boss_id, _B2} = protocol:uint32(_B1),
    {V1_formation_type, _B3} = protocol:uint16(_B2),
    {V1_pos_info, _B8} = protocol:array(_B3,
					fun (_B4) ->
						{V2_pos, _B5} =
						    protocol:uint8(_B4),
						{V2_id, _B6} =
						    protocol:uint32(_B5),
						{{V2_pos, V2_id}, _B6}
					end),
    {V1_hallows_id, _B9} = protocol:uint32(_B8),
    {ok,
     {V1_type, V1_boss_id, V1_formation_type, V1_pos_info,
      V1_hallows_id}};
unpack(25001, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25002, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_boss_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_boss_id}};
unpack(25002, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25003, srv, _B0) -> {ok, {}};
unpack(25003, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25004, srv, _B0) -> {ok, {}};
unpack(25004, cli, _B0) ->
    {V1_num, _B1} = protocol:uint8(_B0),
    {V1_buy_num, _B2} = protocol:uint8(_B1),
    {V1_pr_buy_num, _B3} = protocol:uint32(_B2),
    {V1_refresh_time, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_num, V1_buy_num, V1_pr_buy_num, V1_refresh_time}};
unpack(25005, srv, _B0) -> {ok, {}};
unpack(25005, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_group, _B2} = protocol:uint16(_B1),
    {V1_boss_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_type, V1_group, V1_boss_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


