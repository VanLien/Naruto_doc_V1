-file("src/proto/proto_236.erl", 1).

-module(proto_236).

-lager_records([]).

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

-file("src/proto/proto_236.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(23601, cli, {}) -> {ok, <<2:32, 23601:16>>};
pack(23601, srv,
     {V0_reward, V0_process, V0_double, V0_count}) ->
    D_a_t_a = <<V0_reward:8, V0_process:32, V0_double:8,
		V0_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23601:16,
       D_a_t_a/binary>>};
pack(23602, cli, {}) -> {ok, <<2:32, 23602:16>>};
pack(23602, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23602:16,
       D_a_t_a/binary>>};
pack(23603, cli, {}) -> {ok, <<2:32, 23603:16>>};
pack(23603, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23603:16,
       D_a_t_a/binary>>};
pack(23604, cli, {}) -> {ok, <<2:32, 23604:16>>};
pack(23604, srv, {V0_ext_reward}) ->
    D_a_t_a = <<(length(V0_ext_reward)):16,
		(list_to_binary([<<V1_type:8, V1_rate:32>>
				 || {V1_type, V1_rate}
					<- V0_ext_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23604:16,
       D_a_t_a/binary>>};
pack(23606, cli, {}) -> {ok, <<2:32, 23606:16>>};
pack(23606, srv,
     {V0_ref_time, V0_camp_type, V0_list}) ->
    D_a_t_a = <<V0_ref_time:32, V0_camp_type:8,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:8, V1_price:16, V1_gain:32,
				   V1_num:8, V1_max:8>>
				 || {V1_id, V1_price, V1_gain, V1_num, V1_max}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23606:16,
       D_a_t_a/binary>>};
pack(23607, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23607:16,
       D_a_t_a/binary>>};
pack(23607, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23607:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(23601, srv, _B0) -> {ok, {}};
unpack(23601, cli, _B0) ->
    {V1_reward, _B1} = protocol:uint8(_B0),
    {V1_process, _B2} = protocol:uint32(_B1),
    {V1_double, _B3} = protocol:uint8(_B2),
    {V1_count, _B4} = protocol:uint32(_B3),
    {ok, {V1_reward, V1_process, V1_double, V1_count}};
unpack(23602, srv, _B0) -> {ok, {}};
unpack(23602, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(23603, srv, _B0) -> {ok, {}};
unpack(23603, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(23604, srv, _B0) -> {ok, {}};
unpack(23604, cli, _B0) ->
    {V1_ext_reward, _B5} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_type, _B2} =
						      protocol:uint8(_B1),
						  {V2_rate, _B3} =
						      protocol:uint32(_B2),
						  {{V2_type, V2_rate}, _B3}
					  end),
    {ok, {V1_ext_reward}};
unpack(23606, srv, _B0) -> {ok, {}};
unpack(23606, cli, _B0) ->
    {V1_ref_time, _B1} = protocol:uint32(_B0),
    {V1_camp_type, _B2} = protocol:uint8(_B1),
    {V1_list, _B10} = protocol:array(_B2,
				     fun (_B3) ->
					     {V2_id, _B4} = protocol:uint8(_B3),
					     {V2_price, _B5} =
						 protocol:uint16(_B4),
					     {V2_gain, _B6} =
						 protocol:uint32(_B5),
					     {V2_num, _B7} =
						 protocol:uint8(_B6),
					     {V2_max, _B8} =
						 protocol:uint8(_B7),
					     {{V2_id, V2_price, V2_gain, V2_num,
					       V2_max},
					      _B8}
				     end),
    {ok, {V1_ref_time, V1_camp_type, V1_list}};
unpack(23607, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(23607, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


