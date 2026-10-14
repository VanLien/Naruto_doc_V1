-file("src/proto/proto_233.erl", 1).

-module(proto_233).

-lager_records([{honor_info, [key, list, end_time]},
		{honor_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr, add_exp, dynamic]},
		{honor, [ver, base_id, expire_time]},
		{m_honor, [ver, used, list]}]).

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

-file("src/proto/proto_233.erl", 16).

-file("inc/honor.hrl", 1).

-record(m_honor, {ver = 1, used = 0, list = []}).

-record(honor, {ver = 1, base_id = 0, expire_time = 0}).

-record(honor_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = [], add_exp = 0, dynamic = 0}).

-record(honor_info,
	{key  :: atom(), list = []  :: list(),
	 end_time = 0  :: non_neg_integer()}).

-file("src/proto/proto_233.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(23300, cli, {}) -> {ok, <<2:32, 23300:16>>};
pack(23300, srv, {V0_base_id, V0_honor}) ->
    D_a_t_a = <<V0_base_id:32, (length(V0_honor)):16,
		(list_to_binary([<<V1_base_id:32, V1_expire_time:32>>
				 || #honor{base_id = V1_base_id,
					   expire_time = V1_expire_time}
					<- V0_honor]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23300:16,
       D_a_t_a/binary>>};
pack(23301, cli, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23301:16,
       D_a_t_a/binary>>};
pack(23301, srv, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23301:16,
       D_a_t_a/binary>>};
pack(23302, cli, {}) -> {ok, <<2:32, 23302:16>>};
pack(23302, srv, {V0_honor}) ->
    D_a_t_a = <<(length(V0_honor)):16,
		(list_to_binary([<<V1_base_id:32, V1_expire_time:32>>
				 || #honor{base_id = V1_base_id,
					   expire_time = V1_expire_time}
					<- V0_honor]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23302:16,
       D_a_t_a/binary>>};
pack(23303, cli, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23303:16,
       D_a_t_a/binary>>};
pack(23303, srv, {V0_honor}) ->
    D_a_t_a = <<(length(V0_honor)):16,
		(list_to_binary([<<V1_base_id:32, V1_expire_time:32>>
				 || #honor{base_id = V1_base_id,
					   expire_time = V1_expire_time}
					<- V0_honor]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23303:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(23300, srv, _B0) -> {ok, {}};
unpack(23300, cli, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_honor, _B6} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_base_id, _B3} =
						 protocol:uint32(_B2),
					     {V2_expire_time, _B4} =
						 protocol:uint32(_B3),
					     {{V2_base_id, V2_expire_time}, _B4}
				     end),
    {ok, {V1_base_id, V1_honor}};
unpack(23301, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(23301, cli, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(23302, srv, _B0) -> {ok, {}};
unpack(23302, cli, _B0) ->
    {V1_honor, _B5} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_base_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_expire_time, _B3} =
						 protocol:uint32(_B2),
					     {{V2_base_id, V2_expire_time}, _B3}
				     end),
    {ok, {V1_honor}};
unpack(23303, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(23303, cli, _B0) ->
    {V1_honor, _B5} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_base_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_expire_time, _B3} =
						 protocol:uint32(_B2),
					     {{V2_base_id, V2_expire_time}, _B3}
				     end),
    {ok, {V1_honor}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


