-file("src/proto/proto_212.erl", 1).

-module(proto_212).

-lager_records([{m_star_gift, [ver, next_id, gifts]},
		{m_lev_gift, [ver, gifts]}]).

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

-file("src/proto/proto_212.erl", 16).

-file("inc/lev_gift.hrl", 1).

-record(m_lev_gift, {ver = 1, gifts = []}).

-record(m_star_gift,
	{ver = 1, next_id = 1, gifts = []}).

-file("src/proto/proto_212.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(21200, cli, {}) -> {ok, <<2:32, 21200:16>>};
pack(21200, srv, {V0_gifts}) ->
    D_a_t_a = <<(length(V0_gifts)):16,
		(list_to_binary([<<V1_id:8, V1_status:8, V1_num:32>>
				 || {V1_id, V1_status, V1_num}
					<- V0_gifts]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21200:16,
       D_a_t_a/binary>>};
pack(21201, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21201:16,
       D_a_t_a/binary>>};
pack(21201, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21201:16,
       D_a_t_a/binary>>};
pack(21210, cli, {}) -> {ok, <<2:32, 21210:16>>};
pack(21210, srv, {V0_gifts}) ->
    D_a_t_a = <<(length(V0_gifts)):16,
		(list_to_binary([<<V1_id:32, V1_num:16, V1_end_time:32>>
				 || {V1_id, V1_num, V1_end_time}
					<- V0_gifts]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21210:16,
       D_a_t_a/binary>>};
pack(21211, cli, {}) -> {ok, <<2:32, 21211:16>>};
pack(21211, srv, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21211:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(21200, srv, _B0) -> {ok, {}};
unpack(21200, cli, _B0) ->
    {V1_gifts, _B6} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} = protocol:uint8(_B1),
					     {V2_status, _B3} =
						 protocol:uint8(_B2),
					     {V2_num, _B4} =
						 protocol:uint32(_B3),
					     {{V2_id, V2_status, V2_num}, _B4}
				     end),
    {ok, {V1_gifts}};
unpack(21201, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(21201, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(21210, srv, _B0) -> {ok, {}};
unpack(21210, cli, _B0) ->
    {V1_gifts, _B6} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_num, _B3} =
						 protocol:uint16(_B2),
					     {V2_end_time, _B4} =
						 protocol:uint32(_B3),
					     {{V2_id, V2_num, V2_end_time}, _B4}
				     end),
    {ok, {V1_gifts}};
unpack(21211, srv, _B0) -> {ok, {}};
unpack(21211, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


