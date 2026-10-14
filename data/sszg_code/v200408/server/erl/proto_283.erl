-file("src/proto/proto_283.erl", 1).

-module(proto_283).

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

-file("src/proto/proto_283.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(28300, cli, {}) -> {ok, <<2:32, 28300:16>>};
pack(28300, srv,
     {V0_end_time, V0_start_time, V0_round, V0_draw_time,
      V0_optional_id, V0_gold_time, V0_next_round,
      V0_award_list, V0_original_gold_time}) ->
    D_a_t_a = <<V0_end_time:32, V0_start_time:32,
		V0_round:32, V0_draw_time:32, V0_optional_id:32,
		V0_gold_time:32, V0_next_round:8,
		(length(V0_award_list)):16,
		(list_to_binary([<<V1_id:32, V1_pos:32>>
				 || {V1_id, V1_pos} <- V0_award_list]))/binary,
		V0_original_gold_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28300:16,
       D_a_t_a/binary>>};
pack(28301, cli, {}) -> {ok, <<2:32, 28301:16>>};
pack(28301, srv, {V0_award_list}) ->
    D_a_t_a = <<(length(V0_award_list)):16,
		(list_to_binary([<<V1_type_id:32, V1_get_count:32>>
				 || {V1_type_id, V1_get_count}
					<- V0_award_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28301:16,
       D_a_t_a/binary>>};
pack(28302, cli, {V0_pos}) ->
    D_a_t_a = <<V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28302:16,
       D_a_t_a/binary>>};
pack(28302, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28302:16,
       D_a_t_a/binary>>};
pack(28303, cli, {}) -> {ok, <<2:32, 28303:16>>};
pack(28303, srv, {V0_code, V0_msg, V0_award_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_award_list)):16,
		(list_to_binary([<<V1_type_id:32, V1_get_count:32,
				   V1_count:32, V1_round:32>>
				 || {V1_type_id, V1_get_count, V1_count,
				     V1_round}
					<- V0_award_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28303:16,
       D_a_t_a/binary>>};
pack(28305, cli, {V0_type_id}) ->
    D_a_t_a = <<V0_type_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28305:16,
       D_a_t_a/binary>>};
pack(28305, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28305:16,
       D_a_t_a/binary>>};
pack(28306, cli, {}) -> {ok, <<2:32, 28306:16>>};
pack(28306, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28306:16,
       D_a_t_a/binary>>};
pack(28307, cli, {}) -> {ok, <<2:32, 28307:16>>};
pack(28307, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28307:16,
       D_a_t_a/binary>>};
pack(28308, cli, {}) -> {ok, <<2:32, 28308:16>>};
pack(28308, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28308:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(28300, srv, _B0) -> {ok, {}};
unpack(28300, cli, _B0) ->
    {V1_end_time, _B1} = protocol:uint32(_B0),
    {V1_start_time, _B2} = protocol:uint32(_B1),
    {V1_round, _B3} = protocol:uint32(_B2),
    {V1_draw_time, _B4} = protocol:uint32(_B3),
    {V1_optional_id, _B5} = protocol:uint32(_B4),
    {V1_gold_time, _B6} = protocol:uint32(_B5),
    {V1_next_round, _B7} = protocol:uint8(_B6),
    {V1_award_list, _B12} = protocol:array(_B7,
					   fun (_B8) ->
						   {V2_id, _B9} =
						       protocol:uint32(_B8),
						   {V2_pos, _B10} =
						       protocol:uint32(_B9),
						   {{V2_id, V2_pos}, _B10}
					   end),
    {V1_original_gold_time, _B13} = protocol:uint32(_B12),
    {ok,
     {V1_end_time, V1_start_time, V1_round, V1_draw_time,
      V1_optional_id, V1_gold_time, V1_next_round,
      V1_award_list, V1_original_gold_time}};
unpack(28301, srv, _B0) -> {ok, {}};
unpack(28301, cli, _B0) ->
    {V1_award_list, _B5} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_type_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_get_count, _B3} =
						      protocol:uint32(_B2),
						  {{V2_type_id, V2_get_count},
						   _B3}
					  end),
    {ok, {V1_award_list}};
unpack(28302, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0), {ok, {V1_pos}};
unpack(28302, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(28303, srv, _B0) -> {ok, {}};
unpack(28303, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_award_list, _B9} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_type_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_get_count, _B5} =
						      protocol:uint32(_B4),
						  {V2_count, _B6} =
						      protocol:uint32(_B5),
						  {V2_round, _B7} =
						      protocol:uint32(_B6),
						  {{V2_type_id, V2_get_count,
						    V2_count, V2_round},
						   _B7}
					  end),
    {ok, {V1_code, V1_msg, V1_award_list}};
unpack(28305, srv, _B0) ->
    {V1_type_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_type_id}};
unpack(28305, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(28306, srv, _B0) -> {ok, {}};
unpack(28306, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(28307, srv, _B0) -> {ok, {}};
unpack(28307, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(28308, srv, _B0) -> {ok, {}};
unpack(28308, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


