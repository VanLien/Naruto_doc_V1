-file("src/proto/proto_284.erl", 1).

-module(proto_284).

-lager_records([{holiday_lucky_dog_info,
		 [ver, camp_id, period, status, lucky_dog, ext]},
		{holiday_lucky_dog_quest,
		 [quest_id, val, num, lucky_type, finish, ext]},
		{m_holiday_lucky_dog, [ver, camp_id, info, ext]}]).

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

-file("src/proto/proto_284.erl", 16).

-file("inc/holiday_lucky_dog.hrl", 1).

-record(m_holiday_lucky_dog,
	{ver = 1, camp_id = 0, info = [], ext = []}).

-record(holiday_lucky_dog_quest,
	{quest_id = 0, val = 0, num = 0, lucky_type = 0,
	 finish = 0, ext = []}).

-record(holiday_lucky_dog_info,
	{ver = 1, camp_id = 0, period = 0, status = 0,
	 lucky_dog = [], ext = []}).

-file("src/proto/proto_284.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(28400, cli, {}) -> {ok, <<2:32, 28400:16>>};
pack(28400, srv,
     {V0_period, V0_start_time, V0_end_time, V0_info}) ->
    D_a_t_a = <<V0_period:8, V0_start_time:32,
		V0_end_time:32, (length(V0_info)):16,
		(list_to_binary([<<V1_period:8, V1_state:8,
				   (length(V1_quests)):16,
				   (list_to_binary([<<V2_quest_id:32, V2_val:32,
						      V2_finish:32, V2_num:32,
						      V2_lucky_type:8>>
						    || #holiday_lucky_dog_quest{quest_id
										    =
										    V2_quest_id,
										val
										    =
										    V2_val,
										finish
										    =
										    V2_finish,
										num
										    =
										    V2_num,
										lucky_type
										    =
										    V2_lucky_type}
							   <- V1_quests]))/binary>>
				 || {V1_period, V1_state, V1_quests}
					<- V0_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28400:16,
       D_a_t_a/binary>>};
pack(28401, cli, {V0_period}) ->
    D_a_t_a = <<V0_period:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28401:16,
       D_a_t_a/binary>>};
pack(28401, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28401:16,
       D_a_t_a/binary>>};
pack(28402, cli, {}) -> {ok, <<2:32, 28402:16>>};
pack(28402, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28402:16,
       D_a_t_a/binary>>};
pack(28403, cli, {}) -> {ok, <<2:32, 28403:16>>};
pack(28403, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28403:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(28400, srv, _B0) -> {ok, {}};
unpack(28400, cli, _B0) ->
    {V1_period, _B1} = protocol:uint8(_B0),
    {V1_start_time, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_info, _B16} = protocol:array(_B3,
				     fun (_B4) ->
					     {V2_period, _B5} =
						 protocol:uint8(_B4),
					     {V2_state, _B6} =
						 protocol:uint8(_B5),
					     {V2_quests, _B14} =
						 protocol:array(_B6,
								fun (_B7) ->
									{V3_quest_id,
									 _B8} =
									    protocol:uint32(_B7),
									{V3_val,
									 _B9} =
									    protocol:uint32(_B8),
									{V3_finish,
									 _B10} =
									    protocol:uint32(_B9),
									{V3_num,
									 _B11} =
									    protocol:uint32(_B10),
									{V3_lucky_type,
									 _B12} =
									    protocol:uint8(_B11),
									{{V3_quest_id,
									  V3_val,
									  V3_finish,
									  V3_num,
									  V3_lucky_type},
									 _B12}
								end),
					     {{V2_period, V2_state, V2_quests},
					      _B14}
				     end),
    {ok, {V1_period, V1_start_time, V1_end_time, V1_info}};
unpack(28401, srv, _B0) ->
    {V1_period, _B1} = protocol:uint8(_B0),
    {ok, {V1_period}};
unpack(28401, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(28402, srv, _B0) -> {ok, {}};
unpack(28402, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(28403, srv, _B0) -> {ok, {}};
unpack(28403, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


