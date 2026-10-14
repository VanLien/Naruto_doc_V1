-file("src/proto/proto_234.erl", 1).

-module(proto_234).

-lager_records([{power_gift, [id, status]},
		{m_power_gift, [ver, gifts]}]).

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

-file("src/proto/proto_234.erl", 16).

-file("inc/power_gift.hrl", 1).

-record(m_power_gift, {ver = 1, gifts = []}).

-record(power_gift, {id = 0, status = 0}).

-file("src/proto/proto_234.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(23400, cli, {}) -> {ok, <<2:32, 23400:16>>};
pack(23400, srv, {V0_gifts}) ->
    D_a_t_a = <<(length(V0_gifts)):16,
		(list_to_binary([<<V1_id:8, V1_status:8>>
				 || #power_gift{id = V1_id, status = V1_status}
					<- V0_gifts]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23400:16,
       D_a_t_a/binary>>};
pack(23402, cli, {}) -> {ok, <<2:32, 23402:16>>};
pack(23402, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23402:16,
       D_a_t_a/binary>>};
pack(23403, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23403:16,
       D_a_t_a/binary>>};
pack(23403, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23403:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(23400, srv, _B0) -> {ok, {}};
unpack(23400, cli, _B0) ->
    {V1_gifts, _B5} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} = protocol:uint8(_B1),
					     {V2_status, _B3} =
						 protocol:uint8(_B2),
					     {{V2_id, V2_status}, _B3}
				     end),
    {ok, {V1_gifts}};
unpack(23402, srv, _B0) -> {ok, {}};
unpack(23402, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(23403, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(23403, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


