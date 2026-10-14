-file("src/proto/proto_271.erl", 1).

-module(proto_271).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(27100, cli, {}) -> {ok, <<2:32, 27100:16>>};
pack(27100, srv, {V0_id, V0_page}) ->
    D_a_t_a = <<V0_id:32, V0_page:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27100:16,
       D_a_t_a/binary>>};
pack(27101, cli, {}) -> {ok, <<2:32, 27101:16>>};
pack(27101, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27101:16,
       D_a_t_a/binary>>};
pack(27102, cli, {}) -> {ok, <<2:32, 27102:16>>};
pack(27102, srv, {V0_id_list}) ->
    D_a_t_a = <<(length(V0_id_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_id_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27102:16,
       D_a_t_a/binary>>};
pack(27103, cli, {V0_id, V0_page}) ->
    D_a_t_a = <<V0_id:32, V0_page:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27103:16,
       D_a_t_a/binary>>};
pack(27103, srv, {}) -> {ok, <<2:32, 27103:16>>};
pack(27104, cli, {V0_choice}) ->
    D_a_t_a = <<V0_choice:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27104:16,
       D_a_t_a/binary>>};
pack(27104, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27104:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(27100, srv, _B0) -> {ok, {}};
unpack(27100, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_page, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_page}};
unpack(27101, srv, _B0) -> {ok, {}};
unpack(27101, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(27102, srv, _B0) -> {ok, {}};
unpack(27102, cli, _B0) ->
    {V1_id_list, _B4} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_id, _B2} =
						   protocol:uint32(_B1),
					       {V2_id, _B2}
				       end),
    {ok, {V1_id_list}};
unpack(27103, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_page, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_page}};
unpack(27103, cli, _B0) -> {ok, {}};
unpack(27104, srv, _B0) ->
    {V1_choice, _B1} = protocol:uint8(_B0),
    {ok, {V1_choice}};
unpack(27104, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


