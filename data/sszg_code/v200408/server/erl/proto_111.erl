-file("src/proto/proto_111.erl", 1).

-module(proto_111).

-lager_records([{drama_quest_unit,
		 [label, id, base_id, type, pos, dir, act_type,
		  is_rand_pos]},
		{drama_play,
		 [id, act_type, label, base_id, map_bid, x, y, type, val,
		  name, desc]},
		{drama_obj,
		 [id, name, base_id, type, minor_type, map_bid, x, y,
		  dir, act_type, looks, status, quest_id, quest_prog_id,
		  sex, career]},
		{drama_data,
		 [bid, name, lev, is_open, is_skip, num, event, act_cond,
		  act, condition, offline]},
		{drama, [id, act_idx, num]},
		{m_drama,
		 [ver, finished, play_list, do_list, combat_list,
		  obj_list, guide_list, finish_guide]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/drama.hrl", 1).

-record(m_drama,
	{ver = 1, finished = []  :: [pos_integer()],
	 play_list = []  :: [pos_integer()],
	 do_list = []  :: [tuple()],
	 combat_list = []  :: [tuple()], obj_list = [],
	 guide_list = []  :: [pos_integer()],
	 finish_guide = []  :: list()}).

-record(drama, {id = 0, act_idx = 0, num = 0}).

-record(drama_data,
	{bid = 0, name = <<>>, lev = 0, is_open = 0,
	 is_skip = 0, num = 1, event, act_cond = [], act = [],
	 condition = [], offline = 1}).

-record(drama_obj,
	{id = 0, name = <<>>  :: binary(),
	 base_id = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), minor_type = 0,
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 dir = 0  :: non_neg_integer(),
	 act_type = ""  :: bitstring(), looks = []  :: [tuple()],
	 status = 0  :: non_neg_integer(),
	 quest_id = 0  :: non_neg_integer(),
	 quest_prog_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer()}).

-record(drama_play,
	{id = 0  :: non_neg_integer(),
	 act_type = 0  :: non_neg_integer(),
	 label = act  :: atom(),
	 base_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 val = 0  :: non_neg_integer(), name = <<>>  :: binary(),
	 desc = <<>>  :: binary()}).

-record(drama_quest_unit,
	{label, id = 0, base_id = 0, type = 0, pos, dir,
	 act_type, is_rand_pos = 0  :: 0 | 1}).

-file("src/proto/proto_111.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(11100, cli, {V0_drama_bid, V0_step_id}) ->
    D_a_t_a = <<V0_drama_bid:32, V0_step_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11100:16,
       D_a_t_a/binary>>};
pack(11100, srv, {}) -> {ok, <<2:32, 11100:16>>};
pack(11101, srv, {V0_drama_bid}) ->
    D_a_t_a = <<V0_drama_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11101:16,
       D_a_t_a/binary>>};
pack(11102, cli, {V0_drama_bid}) ->
    D_a_t_a = <<V0_drama_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11102:16,
       D_a_t_a/binary>>};
pack(11102, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11102:16,
       D_a_t_a/binary>>};
pack(11110, srv, {V0_id, V0_act_list}) ->
    D_a_t_a = <<V0_id:8, (length(V0_act_list)):16,
		(list_to_binary([<<V1_id:16, V1_act_type:8,
				   V1_base_id:32, V1_map_bid:32, V1_x:16,
				   V1_y:16, V1_val:32,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_desc))/binary>>
				 || #drama_play{id = V1_id,
						act_type = V1_act_type,
						base_id = V1_base_id,
						map_bid = V1_map_bid, x = V1_x,
						y = V1_y, val = V1_val,
						name = V1_name, desc = V1_desc}
					<- V0_act_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11110:16,
       D_a_t_a/binary>>};
pack(11111, cli, {V0_type, V0_bid}) ->
    D_a_t_a = <<V0_type:16, V0_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11111:16,
       D_a_t_a/binary>>};
pack(11111, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11111:16,
       D_a_t_a/binary>>};
pack(11120, srv, {V0_id, V0_n}) ->
    D_a_t_a = <<V0_id:32, V0_n:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11120:16,
       D_a_t_a/binary>>};
pack(11121, cli, {V0_id, V0_n}) ->
    D_a_t_a = <<V0_id:32, V0_n:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11121:16,
       D_a_t_a/binary>>};
pack(11121, srv, {V0_id, V0_n}) ->
    D_a_t_a = <<V0_id:32, V0_n:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11121:16,
       D_a_t_a/binary>>};
pack(11122, cli, {V0_id, V0_is_skip}) ->
    D_a_t_a = <<V0_id:32, V0_is_skip:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 11122:16,
       D_a_t_a/binary>>};
pack(11122, srv, {}) -> {ok, <<2:32, 11122:16>>};
pack(11123, srv, {}) -> {ok, <<2:32, 11123:16>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(11100, srv, _B0) ->
    {V1_drama_bid, _B1} = protocol:uint32(_B0),
    {V1_step_id, _B2} = protocol:uint8(_B1),
    {ok, {V1_drama_bid, V1_step_id}};
unpack(11100, cli, _B0) -> {ok, {}};
unpack(11101, cli, _B0) ->
    {V1_drama_bid, _B1} = protocol:uint32(_B0),
    {ok, {V1_drama_bid}};
unpack(11102, srv, _B0) ->
    {V1_drama_bid, _B1} = protocol:uint32(_B0),
    {ok, {V1_drama_bid}};
unpack(11102, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(11110, cli, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_act_list, _B13} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_id, _B3} =
						     protocol:uint16(_B2),
						 {V2_act_type, _B4} =
						     protocol:uint8(_B3),
						 {V2_base_id, _B5} =
						     protocol:uint32(_B4),
						 {V2_map_bid, _B6} =
						     protocol:uint32(_B5),
						 {V2_x, _B7} =
						     protocol:uint16(_B6),
						 {V2_y, _B8} =
						     protocol:uint16(_B7),
						 {V2_val, _B9} =
						     protocol:uint32(_B8),
						 {V2_name, _B10} =
						     protocol:string(_B9),
						 {V2_desc, _B11} =
						     protocol:string(_B10),
						 {{V2_id, V2_act_type,
						   V2_base_id, V2_map_bid, V2_x,
						   V2_y, V2_val, V2_name,
						   V2_desc},
						  _B11}
					 end),
    {ok, {V1_id, V1_act_list}};
unpack(11111, srv, _B0) ->
    {V1_type, _B1} = protocol:uint16(_B0),
    {V1_bid, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_bid}};
unpack(11111, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(11120, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_n, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_n}};
unpack(11121, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_n, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_n}};
unpack(11121, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_n, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_n}};
unpack(11122, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_is_skip, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_is_skip}};
unpack(11122, cli, _B0) -> {ok, {}};
unpack(11123, cli, _B0) -> {ok, {}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


