-file("src/proto/proto_245.erl", 1).

-module(proto_245).

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

-file("src/proto/proto_245.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24500, cli, {}) -> {ok, <<2:32, 24500:16>>};
pack(24500, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:8, V1_status:8,
				   V1_expire_time:32>>
				 || {V1_id, V1_status, V1_expire_time}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24500:16,
       D_a_t_a/binary>>};
pack(24501, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24501:16,
       D_a_t_a/binary>>};
pack(24501, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24501:16,
       D_a_t_a/binary>>};
pack(24502, cli, {}) -> {ok, <<2:32, 24502:16>>};
pack(24502, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:8,
				   V1_expire_time:32>>
				 || {V1_id, V1_status, V1_expire_time}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24502:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24500, srv, _B0) -> {ok, {}};
unpack(24500, cli, _B0) ->
    {V1_list, _B6} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint8(_B1),
					    {V2_status, _B3} =
						protocol:uint8(_B2),
					    {V2_expire_time, _B4} =
						protocol:uint32(_B3),
					    {{V2_id, V2_status, V2_expire_time},
					     _B4}
				    end),
    {ok, {V1_list}};
unpack(24501, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24501, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24502, srv, _B0) -> {ok, {}};
unpack(24502, cli, _B0) ->
    {V1_list, _B6} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint32(_B1),
					    {V2_status, _B3} =
						protocol:uint8(_B2),
					    {V2_expire_time, _B4} =
						protocol:uint32(_B3),
					    {{V2_id, V2_status, V2_expire_time},
					     _B4}
				    end),
    {ok, {V1_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


