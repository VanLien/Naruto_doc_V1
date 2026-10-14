-file("src/proto/proto_251.erl", 1).

-module(proto_251).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25100, cli, {}) -> {ok, <<2:32, 25100:16>>};
pack(25100, srv, {V0_state, V0_quests, V0_end_time}) ->
    D_a_t_a = <<V0_state:8, (length(V0_quests)):16,
		(list_to_binary([<<V1_id:32, V1_val:32, V1_status:8>>
				 || {V1_id, V1_val, V1_status}
					<- V0_quests]))/binary,
		V0_end_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25100:16,
       D_a_t_a/binary>>};
pack(25101, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25101:16,
       D_a_t_a/binary>>};
pack(25101, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25101:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25100, srv, _B0) -> {ok, {}};
unpack(25100, cli, _B0) ->
    {V1_state, _B1} = protocol:uint8(_B0),
    {V1_quests, _B7} = protocol:array(_B1,
				      fun (_B2) ->
					      {V2_id, _B3} =
						  protocol:uint32(_B2),
					      {V2_val, _B4} =
						  protocol:uint32(_B3),
					      {V2_status, _B5} =
						  protocol:uint8(_B4),
					      {{V2_id, V2_val, V2_status}, _B5}
				      end),
    {V1_end_time, _B8} = protocol:uint32(_B7),
    {ok, {V1_state, V1_quests, V1_end_time}};
unpack(25101, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(25101, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


