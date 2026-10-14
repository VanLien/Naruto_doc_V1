-file("src/proto/proto_274.erl", 1).

-module(proto_274).

-lager_records([{m_monopoly_maps,
		 [ver, camp_id, id, stage_list]},
		{stage,
		 [ver, id, map_id, pos, develop, events, status,
		  flag_num, buffs, combat_id]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/monopoly_maps.hrl", 1).

-record(stage,
	{ver = 2  :: pos_integer(), id = 0  :: pos_integer(),
	 map_id = 0  :: pos_integer(), pos = 1  :: pos_integer(),
	 develop = 0  :: pos_integer(), events = []  :: list(),
	 status = 1  :: pos_integer(),
	 flag_num = 0  :: pos_integer(),
	 buffs = []  :: pos_integer(),
	 combat_id = {0, 0, <<>>}  :: tuple()}).

-record(m_monopoly_maps,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), id = 0  :: pos_integer(),
	 stage_list = []  :: list()}).

-file("src/proto/proto_274.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(27400, cli, {}) -> {ok, <<2:32, 27400:16>>};
pack(27400, srv, {V0_flag, V0_end_time, V0_stage}) ->
    D_a_t_a = <<V0_flag:8, V0_end_time:32,
		(length(V0_stage)):16,
		(list_to_binary([<<V1_id:32, V1_lock:32, V1_develop:32,
				   V1_guild_develop:32>>
				 || {V1_id, V1_lock, V1_develop,
				     V1_guild_develop}
					<- V0_stage]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27400:16,
       D_a_t_a/binary>>};
pack(27401, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27401:16,
       D_a_t_a/binary>>};
pack(27401, srv,
     {V0_flag, V0_msg,
      #stage{id = V0_id, map_id = V0_map_id, pos = V0_pos,
	     develop = V0_develop, events = V0_events},
      V0_now_type, V0_guild_develop, V0_look_id}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8,
		V0_map_id:32, V0_pos:32, V0_develop:32,
		(length(V0_events)):16,
		(list_to_binary([<<V1_pos:32, V1_type:32>>
				 || {V1_pos, V1_type} <- V0_events]))/binary,
		V0_now_type:8, V0_guild_develop:32, V0_look_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27401:16,
       D_a_t_a/binary>>};
pack(27403, cli, {V0_type, V0_num}) ->
    D_a_t_a = <<V0_type:8, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27403:16,
       D_a_t_a/binary>>};
pack(27403, srv,
     {V0_flag, V0_msg, V0_num, V0_pos, V0_develop,
      V0_now_type, V0_id, V0_guild_develop}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_num:32,
		V0_pos:32, V0_develop:32, V0_now_type:8, V0_id:32,
		V0_guild_develop:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27403:16,
       D_a_t_a/binary>>};
pack(27404, cli, {V0_args}) ->
    D_a_t_a = <<(length(V0_args)):16,
		(list_to_binary([<<V1_type:8, V1_arg1:32, V1_arg2:32>>
				 || {V1_type, V1_arg1, V1_arg2}
					<- V0_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27404:16,
       D_a_t_a/binary>>};
pack(27404, srv,
     {V0_flag, V0_msg, V0_pos, V0_type, V0_id}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_pos:32,
		V0_type:32, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27404:16,
       D_a_t_a/binary>>};
pack(27405, cli, {}) -> {ok, <<2:32, 27405:16>>};
pack(27405, srv,
     {V0_id, V0_choice, V0_system_choice, V0_ret}) ->
    D_a_t_a = <<V0_id:32, V0_choice:8, V0_system_choice:8,
		V0_ret:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27405:16,
       D_a_t_a/binary>>};
pack(27406, cli, {}) -> {ok, <<2:32, 27406:16>>};
pack(27406, srv, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27406:16,
       D_a_t_a/binary>>};
pack(27407, cli, {V0_type, V0_choice}) ->
    D_a_t_a = <<V0_type:8, V0_choice:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27407:16,
       D_a_t_a/binary>>};
pack(27407, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27407:16,
       D_a_t_a/binary>>};
pack(27408, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27408:16,
       D_a_t_a/binary>>};
pack(27408, srv, {V0_id, V0_buffs}) ->
    D_a_t_a = <<V0_id:32, (length(V0_buffs)):16,
		(list_to_binary([<<V1_type:8, V1_num:32>>
				 || {V1_type, V1_num} <- V0_buffs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27408:16,
       D_a_t_a/binary>>};
pack(27409, cli, {}) -> {ok, <<2:32, 27409:16>>};
pack(27409, srv, {V0_id, V0_buffs, V0_reward}) ->
    D_a_t_a = <<V0_id:32, (length(V0_buffs)):16,
		(list_to_binary([<<V1_type:8>>
				 || V1_type <- V0_buffs]))/binary,
		(length(V0_reward)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27409:16,
       D_a_t_a/binary>>};
pack(27410, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27410:16,
       D_a_t_a/binary>>};
pack(27410, srv,
     {V0_id, V0_rid, V0_srv_id, V0_name, V0_face, V0_lev,
      V0_power, V0_guards}) ->
    D_a_t_a = <<V0_id:32, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_face:32,
		V0_lev:8, V0_power:32, (length(V0_guards)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_star:8, (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_pos, V1_bid, V1_lev, V1_star,
				     V1_ext_data}
					<- V0_guards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27410:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(27400, srv, _B0) -> {ok, {}};
unpack(27400, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_stage, _B9} = protocol:array(_B2,
				     fun (_B3) ->
					     {V2_id, _B4} =
						 protocol:uint32(_B3),
					     {V2_lock, _B5} =
						 protocol:uint32(_B4),
					     {V2_develop, _B6} =
						 protocol:uint32(_B5),
					     {V2_guild_develop, _B7} =
						 protocol:uint32(_B6),
					     {{V2_id, V2_lock, V2_develop,
					       V2_guild_develop},
					      _B7}
				     end),
    {ok, {V1_flag, V1_end_time, V1_stage}};
unpack(27401, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(27401, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_map_id, _B4} = protocol:uint32(_B3),
    {V1_pos, _B5} = protocol:uint32(_B4),
    {V1_develop, _B6} = protocol:uint32(_B5),
    {V1_events, _B11} = protocol:array(_B6,
				       fun (_B7) ->
					       {V2_pos, _B8} =
						   protocol:uint32(_B7),
					       {V2_type, _B9} =
						   protocol:uint32(_B8),
					       {{V2_pos, V2_type}, _B9}
				       end),
    {V1_now_type, _B12} = protocol:uint8(_B11),
    {V1_guild_develop, _B13} = protocol:uint32(_B12),
    {V1_look_id, _B14} = protocol:uint32(_B13),
    {ok,
     {V1_flag, V1_msg, V1_id, V1_map_id, V1_pos, V1_develop,
      V1_events, V1_now_type, V1_guild_develop, V1_look_id}};
unpack(27403, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_num}};
unpack(27403, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {V1_pos, _B4} = protocol:uint32(_B3),
    {V1_develop, _B5} = protocol:uint32(_B4),
    {V1_now_type, _B6} = protocol:uint8(_B5),
    {V1_id, _B7} = protocol:uint32(_B6),
    {V1_guild_develop, _B8} = protocol:uint32(_B7),
    {ok,
     {V1_flag, V1_msg, V1_num, V1_pos, V1_develop,
      V1_now_type, V1_id, V1_guild_develop}};
unpack(27404, srv, _B0) ->
    {V1_args, _B6} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_type, _B2} =
						protocol:uint8(_B1),
					    {V2_arg1, _B3} =
						protocol:uint32(_B2),
					    {V2_arg2, _B4} =
						protocol:uint32(_B3),
					    {{V2_type, V2_arg1, V2_arg2}, _B4}
				    end),
    {ok, {V1_args}};
unpack(27404, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pos, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint32(_B3),
    {V1_id, _B5} = protocol:uint32(_B4),
    {ok, {V1_flag, V1_msg, V1_pos, V1_type, V1_id}};
unpack(27405, srv, _B0) -> {ok, {}};
unpack(27405, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_choice, _B2} = protocol:uint8(_B1),
    {V1_system_choice, _B3} = protocol:uint8(_B2),
    {V1_ret, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_choice, V1_system_choice, V1_ret}};
unpack(27406, srv, _B0) -> {ok, {}};
unpack(27406, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(27407, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_choice, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_choice}};
unpack(27407, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(27408, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(27408, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_buffs, _B6} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_type, _B3} =
						 protocol:uint8(_B2),
					     {V2_num, _B4} =
						 protocol:uint32(_B3),
					     {{V2_type, V2_num}, _B4}
				     end),
    {ok, {V1_id, V1_buffs}};
unpack(27409, srv, _B0) -> {ok, {}};
unpack(27409, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_buffs, _B5} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_type, _B3} =
						 protocol:uint8(_B2),
					     {V2_type, _B3}
				     end),
    {V1_reward, _B10} = protocol:array(_B5,
				       fun (_B6) ->
					       {V2_base_id, _B7} =
						   protocol:uint32(_B6),
					       {V2_num, _B8} =
						   protocol:uint32(_B7),
					       {{V2_base_id, V2_num}, _B8}
				       end),
    {ok, {V1_id, V1_buffs, V1_reward}};
unpack(27410, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(27410, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_face, _B5} = protocol:uint32(_B4),
    {V1_lev, _B6} = protocol:uint8(_B5),
    {V1_power, _B7} = protocol:uint32(_B6),
    {V1_guards, _B19} = protocol:array(_B7,
				       fun (_B8) ->
					       {V2_pos, _B9} =
						   protocol:uint8(_B8),
					       {V2_bid, _B10} =
						   protocol:uint32(_B9),
					       {V2_lev, _B11} =
						   protocol:uint16(_B10),
					       {V2_star, _B12} =
						   protocol:uint8(_B11),
					       {V2_ext_data, _B17} =
						   protocol:array(_B12,
								  fun (_B13) ->
									  {V3_key,
									   _B14} =
									      protocol:uint32(_B13),
									  {V3_val,
									   _B15} =
									      protocol:uint32(_B14),
									  {{V3_key,
									    V3_val},
									   _B15}
								  end),
					       {{V2_pos, V2_bid, V2_lev,
						 V2_star, V2_ext_data},
						_B17}
				       end),
    {ok,
     {V1_id, V1_rid, V1_srv_id, V1_name, V1_face, V1_lev,
      V1_power, V1_guards}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


