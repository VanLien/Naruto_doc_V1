-file("src/proto/proto_211.erl", 1).

-module(proto_211).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(21100, cli, {}) -> {ok, <<2:32, 21100:16>>};
pack(21100, srv, {V0_status_list, V0_type}) ->
    D_a_t_a = <<(length(V0_status_list)):16,
		(list_to_binary([<<V1_day:8, V1_status:8>>
				 || {V1_day, V1_status}
					<- V0_status_list]))/binary,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21100:16,
       D_a_t_a/binary>>};
pack(21101, cli, {V0_day}) ->
    D_a_t_a = <<V0_day:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21101:16,
       D_a_t_a/binary>>};
pack(21101, srv, {V0_code, V0_msg, V0_day}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_day:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21101:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(21100, srv, _B0) -> {ok, {}};
unpack(21100, cli, _B0) ->
    {V1_status_list, _B5} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_day, _B2} =
						       protocol:uint8(_B1),
						   {V2_status, _B3} =
						       protocol:uint8(_B2),
						   {{V2_day, V2_status}, _B3}
					   end),
    {V1_type, _B6} = protocol:uint8(_B5),
    {ok, {V1_status_list, V1_type}};
unpack(21101, srv, _B0) ->
    {V1_day, _B1} = protocol:uint8(_B0), {ok, {V1_day}};
unpack(21101, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_day, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_day}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


