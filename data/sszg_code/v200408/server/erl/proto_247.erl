-file("src/proto/proto_247.erl", 1).

-module(proto_247).

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

-file("src/proto/proto_247.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24700, cli, {}) -> {ok, <<2:32, 24700:16>>};
pack(24700, srv, {V0_ids}) ->
    D_a_t_a = <<(length(V0_ids)):16,
		(list_to_binary([<<V1_id:32, V1_status:8, V1_show:8>>
				 || {V1_id, V1_status, V1_show}
					<- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24700:16,
       D_a_t_a/binary>>};
pack(24701, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24701:16,
       D_a_t_a/binary>>};
pack(24701, srv,
     {V0_id, V0_current_day, V0_group_id, V0_endtime,
      V0_status}) ->
    D_a_t_a = <<V0_id:32, V0_current_day:16, V0_group_id:16,
		V0_endtime:32, V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24701:16,
       D_a_t_a/binary>>};
pack(24702, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24702:16,
       D_a_t_a/binary>>};
pack(24702, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24702:16,
       D_a_t_a/binary>>};
pack(24703, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24703:16,
       D_a_t_a/binary>>};
pack(24703, srv, {V0_ids}) ->
    D_a_t_a = <<(length(V0_ids)):16,
		(list_to_binary([<<V1_id:32, V1_status:8>>
				 || {V1_id, V1_status} <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24703:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24700, srv, _B0) -> {ok, {}};
unpack(24700, cli, _B0) ->
    {V1_ids, _B6} = protocol:array(_B0,
				   fun (_B1) ->
					   {V2_id, _B2} = protocol:uint32(_B1),
					   {V2_status, _B3} =
					       protocol:uint8(_B2),
					   {V2_show, _B4} = protocol:uint8(_B3),
					   {{V2_id, V2_status, V2_show}, _B4}
				   end),
    {ok, {V1_ids}};
unpack(24701, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24701, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_current_day, _B2} = protocol:uint16(_B1),
    {V1_group_id, _B3} = protocol:uint16(_B2),
    {V1_endtime, _B4} = protocol:uint32(_B3),
    {V1_status, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_id, V1_current_day, V1_group_id, V1_endtime,
      V1_status}};
unpack(24702, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24702, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24703, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(24703, cli, _B0) ->
    {V1_ids, _B5} = protocol:array(_B0,
				   fun (_B1) ->
					   {V2_id, _B2} = protocol:uint32(_B1),
					   {V2_status, _B3} =
					       protocol:uint8(_B2),
					   {{V2_id, V2_status}, _B3}
				   end),
    {ok, {V1_ids}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


