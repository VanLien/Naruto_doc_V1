-file("src/proto/proto_203.erl", 1).

-module(proto_203).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(20300, cli, {}) -> {ok, <<2:32, 20300:16>>};
pack(20300, srv, {V0_activity_box}) ->
    D_a_t_a = <<(length(V0_activity_box)):16,
		(list_to_binary([<<V1_activity:16>>
				 || V1_activity <- V0_activity_box]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20300:16,
       D_a_t_a/binary>>};
pack(20301, cli, {V0_activity}) ->
    D_a_t_a = <<V0_activity:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20301:16,
       D_a_t_a/binary>>};
pack(20301, srv, {V0_code, V0_msg, V0_activity}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_activity:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20301:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(20300, srv, _B0) -> {ok, {}};
unpack(20300, cli, _B0) ->
    {V1_activity_box, _B4} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_activity, _B2} =
							protocol:uint16(_B1),
						    {V2_activity, _B2}
					    end),
    {ok, {V1_activity_box}};
unpack(20301, srv, _B0) ->
    {V1_activity, _B1} = protocol:uint16(_B0),
    {ok, {V1_activity}};
unpack(20301, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_activity, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_activity}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


