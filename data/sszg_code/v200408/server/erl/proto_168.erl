-file("src/proto/proto_168.erl", 1).

-module(proto_168).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(16800, cli, {V0_idx, V0_val, V0_str}) ->
    D_a_t_a = <<V0_idx:32, V0_val:32,
		(protocol:pack(string, V0_str))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16800:16,
       D_a_t_a/binary>>};
pack(16800, srv,
     {V0_type, V0_arg_uint32, V0_arg_str, V0_idx}) ->
    D_a_t_a = <<V0_type:8, (length(V0_arg_uint32)):16,
		(list_to_binary([<<V1_key:8, V1_value:32>>
				 || {V1_key, V1_value}
					<- V0_arg_uint32]))/binary,
		(length(V0_arg_str)):16,
		(list_to_binary([<<V1_key:8,
				   (protocol:pack(string, V1_value))/binary>>
				 || {V1_key, V1_value} <- V0_arg_str]))/binary,
		V0_idx:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16800:16,
       D_a_t_a/binary>>};
pack(16801, cli, {}) -> {ok, <<2:32, 16801:16>>};
pack(16801, srv, {V0_buff_list}) ->
    D_a_t_a = <<(length(V0_buff_list)):16,
		(list_to_binary([<<V1_bid:32, V1_remain_seconds:32>>
				 || {V1_bid, V1_remain_seconds}
					<- V0_buff_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16801:16,
       D_a_t_a/binary>>};
pack(16802, cli, {}) -> {ok, <<2:32, 16802:16>>};
pack(16802, srv, {V0_bid}) ->
    D_a_t_a = <<V0_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16802:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(16800, srv, _B0) ->
    {V1_idx, _B1} = protocol:uint32(_B0),
    {V1_val, _B2} = protocol:uint32(_B1),
    {V1_str, _B3} = protocol:string(_B2),
    {ok, {V1_idx, V1_val, V1_str}};
unpack(16800, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_arg_uint32, _B6} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_key, _B3} =
						      protocol:uint8(_B2),
						  {V2_value, _B4} =
						      protocol:uint32(_B3),
						  {{V2_key, V2_value}, _B4}
					  end),
    {V1_arg_str, _B11} = protocol:array(_B6,
					fun (_B7) ->
						{V2_key, _B8} =
						    protocol:uint8(_B7),
						{V2_value, _B9} =
						    protocol:string(_B8),
						{{V2_key, V2_value}, _B9}
					end),
    {V1_idx, _B12} = protocol:uint32(_B11),
    {ok, {V1_type, V1_arg_uint32, V1_arg_str, V1_idx}};
unpack(16801, srv, _B0) -> {ok, {}};
unpack(16801, cli, _B0) ->
    {V1_buff_list, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_bid, _B2} =
						     protocol:uint32(_B1),
						 {V2_remain_seconds, _B3} =
						     protocol:uint32(_B2),
						 {{V2_bid, V2_remain_seconds},
						  _B3}
					 end),
    {ok, {V1_buff_list}};
unpack(16802, srv, _B0) -> {ok, {}};
unpack(16802, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0), {ok, {V1_bid}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


