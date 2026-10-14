-file("src/proto/proto_141.erl", 1).

-module(proto_141).

-lager_records([{m_energy, [ver, next_time, netx_type]},
		{checkin_data, [month, day, gain_reward, rewards]},
		{m_checkin, [ver, last_time, day, status]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/checkin.hrl", 1).

-record(m_checkin,
	{ver = 1, last_time = 0, day = 0, status = 0}).

-record(checkin_data,
	{month = 0, day = 0, gain_reward = 1, rewards = []}).

-record(m_energy,
	{ver = 1, next_time = 0, netx_type = 0}).

-file("src/proto/proto_141.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(14100, cli, {}) -> {ok, <<2:32, 14100:16>>};
pack(14100, srv, {V0_day, V0_status}) ->
    D_a_t_a = <<V0_day:8, V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 14100:16,
       D_a_t_a/binary>>};
pack(14101, cli, {}) -> {ok, <<2:32, 14101:16>>};
pack(14101, srv,
     {V0_code, V0_msg, V0_day, V0_status}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_day:8,
		V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 14101:16,
       D_a_t_a/binary>>};
pack(14102, cli, {}) -> {ok, <<2:32, 14102:16>>};
pack(14102, srv, {V0_attr_list}) ->
    D_a_t_a = <<(length(V0_attr_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:8>>
				 || {V1_id, V1_status}
					<- V0_attr_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 14102:16,
       D_a_t_a/binary>>};
pack(14103, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 14103:16,
       D_a_t_a/binary>>};
pack(14103, srv, {V0_code, V0_msg, V0_id, V0_status}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32,
		V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 14103:16,
       D_a_t_a/binary>>};
pack(14104, srv, {}) -> {ok, <<2:32, 14104:16>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(14100, srv, _B0) -> {ok, {}};
unpack(14100, cli, _B0) ->
    {V1_day, _B1} = protocol:uint8(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {ok, {V1_day, V1_status}};
unpack(14101, srv, _B0) -> {ok, {}};
unpack(14101, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_day, _B3} = protocol:uint8(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_day, V1_status}};
unpack(14102, srv, _B0) -> {ok, {}};
unpack(14102, cli, _B0) ->
    {V1_attr_list, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_status, _B3} =
						     protocol:uint8(_B2),
						 {{V2_id, V2_status}, _B3}
					 end),
    {ok, {V1_attr_list}};
unpack(14103, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(14103, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_status, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_id, V1_status}};
unpack(14104, cli, _B0) -> {ok, {}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


