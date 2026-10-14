-file("src/proto/proto_221.erl", 1).

-module(proto_221).

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

-file("src/proto/proto_221.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(22150, cli, {}) -> {ok, <<2:32, 22150:16>>};
pack(22150, srv,
     {V0_start_time, V0_end_time, V0_srv_list}) ->
    D_a_t_a = <<V0_start_time:32, V0_end_time:32,
		(length(V0_srv_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_srv_id))/binary,
				   (protocol:pack(string, V1_srv_name))/binary,
				   V1_world_lev:16, V1_open_time:32>>
				 || {V1_srv_id, V1_srv_name, V1_world_lev,
				     V1_open_time}
					<- V0_srv_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22150:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(22150, srv, _B0) -> {ok, {}};
unpack(22150, cli, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_srv_list, _B9} = protocol:array(_B2,
					fun (_B3) ->
						{V2_srv_id, _B4} =
						    protocol:string(_B3),
						{V2_srv_name, _B5} =
						    protocol:string(_B4),
						{V2_world_lev, _B6} =
						    protocol:uint16(_B5),
						{V2_open_time, _B7} =
						    protocol:uint32(_B6),
						{{V2_srv_id, V2_srv_name,
						  V2_world_lev, V2_open_time},
						 _B7}
					end),
    {ok, {V1_start_time, V1_end_time, V1_srv_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


