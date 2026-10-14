-file("src/proto/proto_276.erl", 1).

-module(proto_276).

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

-file("src/proto/proto_276.erl", 16).

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

-file("src/proto/proto_276.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(27600, cli, {}) -> {ok, <<2:32, 27600:16>>};
pack(27600, srv, {V0_ids, V0_flag}) ->
    D_a_t_a = <<(length(V0_ids)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_ids]))/binary,
		V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27600:16,
       D_a_t_a/binary>>};
pack(27601, cli,
     {V0_id, V0_formation_type, V0_pos_info}) ->
    D_a_t_a = <<V0_id:32, V0_formation_type:16,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || #formation_pos{pos = V1_pos, id = V1_id}
					<- V0_pos_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27601:16,
       D_a_t_a/binary>>};
pack(27601, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27601:16,
       D_a_t_a/binary>>};
pack(27602, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27602:16,
       D_a_t_a/binary>>};
pack(27602, srv,
     {V0_flag, V0_msg, V0_is_first, V0_is_formation}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_is_first:8,
		V0_is_formation:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27602:16,
       D_a_t_a/binary>>};
pack(27603, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27603:16,
       D_a_t_a/binary>>};
pack(27603, srv, {}) -> {ok, <<2:32, 27603:16>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(27600, srv, _B0) -> {ok, {}};
unpack(27600, cli, _B0) ->
    {V1_ids, _B4} = protocol:array(_B0,
				   fun (_B1) ->
					   {V2_id, _B2} = protocol:uint32(_B1),
					   {V2_id, _B2}
				   end),
    {V1_flag, _B5} = protocol:uint8(_B4),
    {ok, {V1_ids, V1_flag}};
unpack(27601, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_formation_type, _B2} = protocol:uint16(_B1),
    {V1_pos_info, _B7} = protocol:array(_B2,
					fun (_B3) ->
						{V2_pos, _B4} =
						    protocol:uint8(_B3),
						{V2_id, _B5} =
						    protocol:uint32(_B4),
						{{V2_pos, V2_id}, _B5}
					end),
    {ok, {V1_id, V1_formation_type, V1_pos_info}};
unpack(27601, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(27602, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(27602, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_is_first, _B3} = protocol:uint8(_B2),
    {V1_is_formation, _B4} = protocol:uint8(_B3),
    {ok, {V1_flag, V1_msg, V1_is_first, V1_is_formation}};
unpack(27603, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(27603, cli, _B0) -> {ok, {}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


