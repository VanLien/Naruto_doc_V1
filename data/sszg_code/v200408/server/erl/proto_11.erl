-file("src/proto/proto_11.erl", 1).

-module(proto_11).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(1110, cli, {V0_args}) ->
    D_a_t_a = <<(length(V0_args)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_key))/binary,
				   (protocol:pack(string, V1_val))/binary>>
				 || {V1_key, V1_val} <- V0_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 1110:16,
       D_a_t_a/binary>>};
pack(1110, srv,
     {V0_code, V0_msg, V0_roles, V0_least_career}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_roles)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_sex:8, V1_career:16,
				   V1_face_id:32, V1_is_online:8>>
				 || [V1_rid, V1_srv_id, V1_name, V1_lev, V1_sex,
				     V1_career, V1_face_id, V1_is_online]
					<- V0_roles]))/binary,
		V0_least_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 1110:16,
       D_a_t_a/binary>>};
pack(1190, cli, {}) -> {ok, <<2:32, 1190:16>>};
pack(1190, srv, {}) -> {ok, <<2:32, 1190:16>>};
pack(1196, srv, {V0_time}) ->
    D_a_t_a = <<V0_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 1196:16,
       D_a_t_a/binary>>};
pack(1197, cli, {V0_sign, V0_idx, V0_code, V0_time}) ->
    D_a_t_a = <<(protocol:pack(string, V0_sign))/binary,
		V0_idx:32, V0_code:16, V0_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 1197:16,
       D_a_t_a/binary>>};
pack(1197, srv, {}) -> {ok, <<2:32, 1197:16>>};
pack(1198, cli, {V0_time}) ->
    D_a_t_a = <<V0_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 1198:16,
       D_a_t_a/binary>>};
pack(1198, srv, {V0_time}) ->
    D_a_t_a = <<V0_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 1198:16,
       D_a_t_a/binary>>};
pack(1199, cli, {}) -> {ok, <<2:32, 1199:16>>};
pack(1199, srv, {V0_time}) ->
    D_a_t_a = <<V0_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 1199:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(1110, srv, _B0) ->
    {V1_args, _B5} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_key, _B2} =
						protocol:string(_B1),
					    {V2_val, _B3} =
						protocol:string(_B2),
					    {{V2_key, V2_val}, _B3}
				    end),
    {ok, {V1_args}};
unpack(1110, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_roles, _B13} = protocol:array(_B2,
				      fun (_B3) ->
					      {V2_rid, _B4} =
						  protocol:uint32(_B3),
					      {V2_srv_id, _B5} =
						  protocol:string(_B4),
					      {V2_name, _B6} =
						  protocol:string(_B5),
					      {V2_lev, _B7} =
						  protocol:uint16(_B6),
					      {V2_sex, _B8} =
						  protocol:uint8(_B7),
					      {V2_career, _B9} =
						  protocol:uint16(_B8),
					      {V2_face_id, _B10} =
						  protocol:uint32(_B9),
					      {V2_is_online, _B11} =
						  protocol:uint8(_B10),
					      {{V2_rid, V2_srv_id, V2_name,
						V2_lev, V2_sex, V2_career,
						V2_face_id, V2_is_online},
					       _B11}
				      end),
    {V1_least_career, _B14} = protocol:uint8(_B13),
    {ok, {V1_code, V1_msg, V1_roles, V1_least_career}};
unpack(1190, srv, _B0) -> {ok, {}};
unpack(1190, cli, _B0) -> {ok, {}};
unpack(1196, cli, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0), {ok, {V1_time}};
unpack(1197, srv, _B0) ->
    {V1_sign, _B1} = protocol:string(_B0),
    {V1_idx, _B2} = protocol:uint32(_B1),
    {V1_code, _B3} = protocol:uint16(_B2),
    {V1_time, _B4} = protocol:uint32(_B3),
    {ok, {V1_sign, V1_idx, V1_code, V1_time}};
unpack(1197, cli, _B0) -> {ok, {}};
unpack(1198, srv, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0), {ok, {V1_time}};
unpack(1198, cli, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0), {ok, {V1_time}};
unpack(1199, srv, _B0) -> {ok, {}};
unpack(1199, cli, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0), {ok, {V1_time}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


