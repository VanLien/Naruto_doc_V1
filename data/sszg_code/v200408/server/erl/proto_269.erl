-file("src/proto/proto_269.erl", 1).

-module(proto_269).

-lager_records([{guild_marketplace,
		 [ver, id, next_booth_id, item_list, board_list]},
		{market_board,
		 [ver, type, name, operation, reward_list, unixtime]},
		{market_item,
		 [ver, id, base_id, num, attr, extra, holy_eqm_attr,
		  end_time, score]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/guild_marketplace.hrl", 1).

-record(market_item,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 base_id = 0  :: pos_integer(),
	 num = 0  :: pos_integer(), attr = []  :: list(),
	 extra = []  :: list(), holy_eqm_attr = []  :: list(),
	 end_time = []  :: list(), score = 0  :: pos_integer()}).

-record(market_board,
	{ver = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: bitstring(),
	 operation = 1  :: pos_integer(),
	 reward_list = []  :: list(),
	 unixtime = 0  :: pos_integer()}).

-record(guild_marketplace,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 next_booth_id = 1  :: pos_integer(),
	 item_list = []  :: list(), board_list = []  :: list()}).

-file("src/proto/proto_269.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(26900, cli, {}) -> {ok, <<2:32, 26900:16>>};
pack(26900, srv, {V0_item_list, V0_day_buy}) ->
    D_a_t_a = <<(length(V0_item_list)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_num:32,
				   (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary,
				   (length(V1_holy_eqm_attr)):16,
				   (list_to_binary([<<V2_pos:8, V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_pos, V2_attr_id,
							V2_attr_val}
							   <- V1_holy_eqm_attr]))/binary,
				   (length(V1_end_time)):16,
				   (list_to_binary([<<V2_end_num:32,
						      V2_end_unixtime:32>>
						    || {V2_end_num,
							V2_end_unixtime}
							   <- V1_end_time]))/binary,
				   V1_score:32>>
				 || #market_item{id = V1_id,
						 base_id = V1_base_id,
						 num = V1_num, attr = V1_attr,
						 extra = V1_extra,
						 holy_eqm_attr =
						     V1_holy_eqm_attr,
						 end_time = V1_end_time,
						 score = V1_score}
					<- V0_item_list]))/binary,
		(length(V0_day_buy)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_day_buy]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26900:16,
       D_a_t_a/binary>>};
pack(26901, cli, {V0_id, V0_quantity, V0_storage}) ->
    D_a_t_a = <<V0_id:32, V0_quantity:32, V0_storage:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26901:16,
       D_a_t_a/binary>>};
pack(26901, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26901:16,
       D_a_t_a/binary>>};
pack(26902, cli, {V0_id, V0_quantity}) ->
    D_a_t_a = <<V0_id:32, V0_quantity:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26902:16,
       D_a_t_a/binary>>};
pack(26902, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26902:16,
       D_a_t_a/binary>>};
pack(26903, cli, {}) -> {ok, <<2:32, 26903:16>>};
pack(26903, srv, {V0_board_list}) ->
    D_a_t_a = <<(length(V0_board_list)):16,
		(list_to_binary([<<V1_type:8,
				   (protocol:pack(string, V1_name))/binary,
				   V1_operation:8, (length(V1_reward_list)):16,
				   (list_to_binary([<<V2_base_id:32, V2_num:32>>
						    || {V2_base_id, V2_num}
							   <- V1_reward_list]))/binary,
				   V1_unixtime:32>>
				 || #market_board{type = V1_type,
						  name = V1_name,
						  operation = V1_operation,
						  reward_list = V1_reward_list,
						  unixtime = V1_unixtime}
					<- V0_board_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26903:16,
       D_a_t_a/binary>>};
pack(26904, cli, {}) -> {ok, <<2:32, 26904:16>>};
pack(26904, srv, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_num:32,
				   (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary,
				   (length(V1_holy_eqm_attr)):16,
				   (list_to_binary([<<V2_pos:8, V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_pos, V2_attr_id,
							V2_attr_val}
							   <- V1_holy_eqm_attr]))/binary,
				   (length(V1_end_time)):16,
				   (list_to_binary([<<V2_end_num:32,
						      V2_end_unixtime:32>>
						    || {V2_end_num,
							V2_end_unixtime}
							   <- V1_end_time]))/binary,
				   V1_score:32>>
				 || #market_item{id = V1_id,
						 base_id = V1_base_id,
						 num = V1_num, attr = V1_attr,
						 extra = V1_extra,
						 holy_eqm_attr =
						     V1_holy_eqm_attr,
						 end_time = V1_end_time,
						 score = V1_score}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26904:16,
       D_a_t_a/binary>>};
pack(26905, cli, {}) -> {ok, <<2:32, 26905:16>>};
pack(26905, srv, {V0_item_list, V0_day_buy}) ->
    D_a_t_a = <<(length(V0_item_list)):16,
		(list_to_binary([<<V1_id:32, V1_num:32,
				   (length(V1_end_time)):16,
				   (list_to_binary([<<V2_end_num:32,
						      V2_end_unixtime:32>>
						    || {V2_end_num,
							V2_end_unixtime}
							   <- V1_end_time]))/binary>>
				 || {V1_id, V1_num, V1_end_time}
					<- V0_item_list]))/binary,
		(length(V0_day_buy)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_day_buy]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26905:16,
       D_a_t_a/binary>>};
pack(26906, cli, {}) -> {ok, <<2:32, 26906:16>>};
pack(26906, srv, {V0_id_list, V0_day_buy}) ->
    D_a_t_a = <<(length(V0_id_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_id_list]))/binary,
		(length(V0_day_buy)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_day_buy]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26906:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(26900, srv, _B0) -> {ok, {}};
unpack(26900, cli, _B0) ->
    {V1_item_list, _B28} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_base_id, _B3} =
						      protocol:uint32(_B2),
						  {V2_num, _B4} =
						      protocol:uint32(_B3),
						  {V2_attr, _B9} =
						      protocol:array(_B4,
								     fun
								       (_B5) ->
									   {V3_attr_id,
									    _B6} =
									       protocol:uint32(_B5),
									   {V3_attr_val,
									    _B7} =
									       protocol:uint32(_B6),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B7}
								     end),
						  {V2_extra, _B14} =
						      protocol:array(_B9,
								     fun
								       (_B10) ->
									   {V3_extra_k,
									    _B11} =
									       protocol:uint32(_B10),
									   {V3_extra_v,
									    _B12} =
									       protocol:uint32(_B11),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B12}
								     end),
						  {V2_holy_eqm_attr, _B20} =
						      protocol:array(_B14,
								     fun
								       (_B15) ->
									   {V3_pos,
									    _B16} =
									       protocol:uint8(_B15),
									   {V3_attr_id,
									    _B17} =
									       protocol:uint32(_B16),
									   {V3_attr_val,
									    _B18} =
									       protocol:uint32(_B17),
									   {{V3_pos,
									     V3_attr_id,
									     V3_attr_val},
									    _B18}
								     end),
						  {V2_end_time, _B25} =
						      protocol:array(_B20,
								     fun
								       (_B21) ->
									   {V3_end_num,
									    _B22} =
									       protocol:uint32(_B21),
									   {V3_end_unixtime,
									    _B23} =
									       protocol:uint32(_B22),
									   {{V3_end_num,
									     V3_end_unixtime},
									    _B23}
								     end),
						  {V2_score, _B26} =
						      protocol:uint32(_B25),
						  {{V2_id, V2_base_id, V2_num,
						    V2_attr, V2_extra,
						    V2_holy_eqm_attr,
						    V2_end_time, V2_score},
						   _B26}
					  end),
    {V1_day_buy, _B33} = protocol:array(_B28,
					fun (_B29) ->
						{V2_base_id, _B30} =
						    protocol:uint32(_B29),
						{V2_num, _B31} =
						    protocol:uint32(_B30),
						{{V2_base_id, V2_num}, _B31}
					end),
    {ok, {V1_item_list, V1_day_buy}};
unpack(26901, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_quantity, _B2} = protocol:uint32(_B1),
    {V1_storage, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_quantity, V1_storage}};
unpack(26901, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26902, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_quantity, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_quantity}};
unpack(26902, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(26903, srv, _B0) -> {ok, {}};
unpack(26903, cli, _B0) ->
    {V1_board_list, _B12} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_type, _B2} =
						       protocol:uint8(_B1),
						   {V2_name, _B3} =
						       protocol:string(_B2),
						   {V2_operation, _B4} =
						       protocol:uint8(_B3),
						   {V2_reward_list, _B9} =
						       protocol:array(_B4,
								      fun
									(_B5) ->
									    {V3_base_id,
									     _B6} =
										protocol:uint32(_B5),
									    {V3_num,
									     _B7} =
										protocol:uint32(_B6),
									    {{V3_base_id,
									      V3_num},
									     _B7}
								      end),
						   {V2_unixtime, _B10} =
						       protocol:uint32(_B9),
						   {{V2_type, V2_name,
						     V2_operation,
						     V2_reward_list,
						     V2_unixtime},
						    _B10}
					   end),
    {ok, {V1_board_list}};
unpack(26904, srv, _B0) -> {ok, {}};
unpack(26904, cli, _B0) ->
    {V1_item_list, _B28} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_base_id, _B3} =
						      protocol:uint32(_B2),
						  {V2_num, _B4} =
						      protocol:uint32(_B3),
						  {V2_attr, _B9} =
						      protocol:array(_B4,
								     fun
								       (_B5) ->
									   {V3_attr_id,
									    _B6} =
									       protocol:uint32(_B5),
									   {V3_attr_val,
									    _B7} =
									       protocol:uint32(_B6),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B7}
								     end),
						  {V2_extra, _B14} =
						      protocol:array(_B9,
								     fun
								       (_B10) ->
									   {V3_extra_k,
									    _B11} =
									       protocol:uint32(_B10),
									   {V3_extra_v,
									    _B12} =
									       protocol:uint32(_B11),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B12}
								     end),
						  {V2_holy_eqm_attr, _B20} =
						      protocol:array(_B14,
								     fun
								       (_B15) ->
									   {V3_pos,
									    _B16} =
									       protocol:uint8(_B15),
									   {V3_attr_id,
									    _B17} =
									       protocol:uint32(_B16),
									   {V3_attr_val,
									    _B18} =
									       protocol:uint32(_B17),
									   {{V3_pos,
									     V3_attr_id,
									     V3_attr_val},
									    _B18}
								     end),
						  {V2_end_time, _B25} =
						      protocol:array(_B20,
								     fun
								       (_B21) ->
									   {V3_end_num,
									    _B22} =
									       protocol:uint32(_B21),
									   {V3_end_unixtime,
									    _B23} =
									       protocol:uint32(_B22),
									   {{V3_end_num,
									     V3_end_unixtime},
									    _B23}
								     end),
						  {V2_score, _B26} =
						      protocol:uint32(_B25),
						  {{V2_id, V2_base_id, V2_num,
						    V2_attr, V2_extra,
						    V2_holy_eqm_attr,
						    V2_end_time, V2_score},
						   _B26}
					  end),
    {ok, {V1_item_list}};
unpack(26905, srv, _B0) -> {ok, {}};
unpack(26905, cli, _B0) ->
    {V1_item_list, _B10} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_num, _B3} =
						      protocol:uint32(_B2),
						  {V2_end_time, _B8} =
						      protocol:array(_B3,
								     fun
								       (_B4) ->
									   {V3_end_num,
									    _B5} =
									       protocol:uint32(_B4),
									   {V3_end_unixtime,
									    _B6} =
									       protocol:uint32(_B5),
									   {{V3_end_num,
									     V3_end_unixtime},
									    _B6}
								     end),
						  {{V2_id, V2_num, V2_end_time},
						   _B8}
					  end),
    {V1_day_buy, _B15} = protocol:array(_B10,
					fun (_B11) ->
						{V2_base_id, _B12} =
						    protocol:uint32(_B11),
						{V2_num, _B13} =
						    protocol:uint32(_B12),
						{{V2_base_id, V2_num}, _B13}
					end),
    {ok, {V1_item_list, V1_day_buy}};
unpack(26906, srv, _B0) -> {ok, {}};
unpack(26906, cli, _B0) ->
    {V1_id_list, _B4} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_id, _B2} =
						   protocol:uint32(_B1),
					       {V2_id, _B2}
				       end),
    {V1_day_buy, _B9} = protocol:array(_B4,
				       fun (_B5) ->
					       {V2_base_id, _B6} =
						   protocol:uint32(_B5),
					       {V2_num, _B7} =
						   protocol:uint32(_B6),
					       {{V2_base_id, V2_num}, _B7}
				       end),
    {ok, {V1_id_list, V1_day_buy}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


