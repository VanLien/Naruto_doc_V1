-file("src/proto/proto_112.erl", 1).

-module(proto_112).

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

-file("src/proto/proto_112.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(11200, cli, {}) -> {ok, <<2:32, 11200:16>>};
pack(11200, srv,
     {#formation_base_p{id = V0_id, pos_info = V0_pos_info,
			formation_list = V0_formation_list,
			hallows_id = V0_hallows_id}}) ->
    D_a_t_a = <<V0_id:8, (length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:8>>
				 || #formation_pos{pos = V1_pos, id = V1_id}
					<- V0_pos_info]))/binary,
		(length(V0_formation_list)):16,
		(list_to_binary([<<V1_id:8>>
				 || V1_id <- V0_formation_list]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11200:16,
       D_a_t_a/binary>>};
pack(11201, cli, {V0_id, V0_pos_info, V0_hallows_id}) ->
    D_a_t_a = <<V0_id:8, (length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:8>>
				 || {V1_pos, V1_id} <- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11201:16,
       D_a_t_a/binary>>};
pack(11201, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11201:16,
       D_a_t_a/binary>>};
pack(11211, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11211:16,
       D_a_t_a/binary>>};
pack(11211, srv,
     {V0_type, V0_formation_type, V0_pos_info,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_type:8, V0_formation_type:8,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || #formation_pos{pos = V1_pos, id = V1_id}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11211:16,
       D_a_t_a/binary>>};
pack(11212, cli,
     {V0_type, V0_formation_type, V0_pos_info,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_type:8, V0_formation_type:8,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || {V1_pos, V1_id} <- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11212:16,
       D_a_t_a/binary>>};
pack(11212, srv, {V0_code, V0_msg, V0_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11212:16,
       D_a_t_a/binary>>};
pack(11213, cli, {V0_type_list}) ->
    D_a_t_a = <<(length(V0_type_list)):16,
		(list_to_binary([<<V1_type:8>>
				 || V1_type <- V0_type_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11213:16,
       D_a_t_a/binary>>};
pack(11213, srv, {V0_info}) ->
    D_a_t_a = <<(length(V0_info)):16,
		(list_to_binary([<<V1_type:8, V1_formation_type:8,
				   (length(V1_pos_info)):16,
				   (list_to_binary([<<V2_pos:8, V2_id:32>>
						    || #formation_pos{pos =
									  V2_pos,
								      id =
									  V2_id}
							   <- V1_pos_info]))/binary,
				   V1_hallows_id:32>>
				 || {V1_type, V1_formation_type, V1_pos_info,
				     V1_hallows_id}
					<- V0_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11213:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(11200, srv, _B0) -> {ok, {}};
unpack(11200, cli, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_pos_info, _B6} = protocol:array(_B1,
					fun (_B2) ->
						{V2_pos, _B3} =
						    protocol:uint8(_B2),
						{V2_id, _B4} =
						    protocol:uint8(_B3),
						{{V2_pos, V2_id}, _B4}
					end),
    {V1_formation_list, _B10} = protocol:array(_B6,
					       fun (_B7) ->
						       {V2_id, _B8} =
							   protocol:uint8(_B7),
						       {V2_id, _B8}
					       end),
    {V1_hallows_id, _B11} = protocol:uint32(_B10),
    {ok,
     {V1_id, V1_pos_info, V1_formation_list, V1_hallows_id}};
unpack(11201, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_pos_info, _B6} = protocol:array(_B1,
					fun (_B2) ->
						{V2_pos, _B3} =
						    protocol:uint8(_B2),
						{V2_id, _B4} =
						    protocol:uint8(_B3),
						{{V2_pos, V2_id}, _B4}
					end),
    {V1_hallows_id, _B7} = protocol:uint32(_B6),
    {ok, {V1_id, V1_pos_info, V1_hallows_id}};
unpack(11201, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(11211, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(11211, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_formation_type, _B2} = protocol:uint8(_B1),
    {V1_pos_info, _B7} = protocol:array(_B2,
					fun (_B3) ->
						{V2_pos, _B4} =
						    protocol:uint8(_B3),
						{V2_id, _B5} =
						    protocol:uint32(_B4),
						{{V2_pos, V2_id}, _B5}
					end),
    {V1_hallows_id, _B8} = protocol:uint32(_B7),
    {ok,
     {V1_type, V1_formation_type, V1_pos_info,
      V1_hallows_id}};
unpack(11212, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_formation_type, _B2} = protocol:uint8(_B1),
    {V1_pos_info, _B7} = protocol:array(_B2,
					fun (_B3) ->
						{V2_pos, _B4} =
						    protocol:uint8(_B3),
						{V2_id, _B5} =
						    protocol:uint32(_B4),
						{{V2_pos, V2_id}, _B5}
					end),
    {V1_hallows_id, _B8} = protocol:uint32(_B7),
    {ok,
     {V1_type, V1_formation_type, V1_pos_info,
      V1_hallows_id}};
unpack(11212, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_type}};
unpack(11213, srv, _B0) ->
    {V1_type_list, _B4} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_type, _B2} =
						     protocol:uint8(_B1),
						 {V2_type, _B2}
					 end),
    {ok, {V1_type_list}};
unpack(11213, cli, _B0) ->
    {V1_info, _B11} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_type, _B2} =
						 protocol:uint8(_B1),
					     {V2_formation_type, _B3} =
						 protocol:uint8(_B2),
					     {V2_pos_info, _B8} =
						 protocol:array(_B3,
								fun (_B4) ->
									{V3_pos,
									 _B5} =
									    protocol:uint8(_B4),
									{V3_id,
									 _B6} =
									    protocol:uint32(_B5),
									{{V3_pos,
									  V3_id},
									 _B6}
								end),
					     {V2_hallows_id, _B9} =
						 protocol:uint32(_B8),
					     {{V2_type, V2_formation_type,
					       V2_pos_info, V2_hallows_id},
					      _B9}
				     end),
    {ok, {V1_info}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


