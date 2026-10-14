-file("src/proto/proto_289.erl", 1).

-module(proto_289).

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

-file("src/proto/proto_289.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(28900, cli, {}) -> {ok, <<2:32, 28900:16>>};
pack(28900, srv, {V0_gift_list}) ->
    D_a_t_a = <<(length(V0_gift_list)):16,
		(list_to_binary([<<V1_gift_id:32, V1_charge_id:32,
				   V1_limit_count:8, V1_costly_num:32,
				   (length(V1_award)):16,
				   (list_to_binary([<<V2_id:32, V2_num:32>>
						    || {V2_id, V2_num}
							   <- V1_award]))/binary,
				   V1_over_time:32, V1_buy_count:8,
				   (protocol:pack(string, V1_desc))/binary>>
				 || {V1_gift_id, V1_charge_id, V1_limit_count,
				     V1_costly_num, V1_award, V1_over_time,
				     V1_buy_count, V1_desc}
					<- V0_gift_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28900:16,
       D_a_t_a/binary>>};
pack(28901, cli, {}) -> {ok, <<2:32, 28901:16>>};
pack(28901, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28901:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(28900, srv, _B0) -> {ok, {}};
unpack(28900, cli, _B0) ->
    {V1_gift_list, _B15} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_gift_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_charge_id, _B3} =
						      protocol:uint32(_B2),
						  {V2_limit_count, _B4} =
						      protocol:uint8(_B3),
						  {V2_costly_num, _B5} =
						      protocol:uint32(_B4),
						  {V2_award, _B10} =
						      protocol:array(_B5,
								     fun
								       (_B6) ->
									   {V3_id,
									    _B7} =
									       protocol:uint32(_B6),
									   {V3_num,
									    _B8} =
									       protocol:uint32(_B7),
									   {{V3_id,
									     V3_num},
									    _B8}
								     end),
						  {V2_over_time, _B11} =
						      protocol:uint32(_B10),
						  {V2_buy_count, _B12} =
						      protocol:uint8(_B11),
						  {V2_desc, _B13} =
						      protocol:string(_B12),
						  {{V2_gift_id, V2_charge_id,
						    V2_limit_count,
						    V2_costly_num, V2_award,
						    V2_over_time, V2_buy_count,
						    V2_desc},
						   _B13}
					  end),
    {ok, {V1_gift_list}};
unpack(28901, srv, _B0) -> {ok, {}};
unpack(28901, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


