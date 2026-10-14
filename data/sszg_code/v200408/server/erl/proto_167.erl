-file("src/proto/proto_167.erl", 1).

-module(proto_167).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(16700, cli, {}) -> {ok, <<2:32, 16700:16>>};
pack(16700, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32,
				   (protocol:pack(string, V1_name))/binary,
				   V1_need_rmb:32, V1_get_gold:32,
				   V1_add_gold:32, V1_is_first:8, V1_pic:8>>
				 || {V1_id, V1_name, V1_need_rmb, V1_get_gold,
				     V1_add_gold, V1_is_first, V1_pic}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16700:16,
       D_a_t_a/binary>>};
pack(16705, cli, {}) -> {ok, <<2:32, 16705:16>>};
pack(16705, srv,
     {V0_card1_is_reward, V0_card1_end_time, V0_card1_days,
      V0_card1_acc, V0_card2_is_reward, V0_card2_end_time,
      V0_card2_days, V0_card2_acc}) ->
    D_a_t_a = <<V0_card1_is_reward:8, V0_card1_end_time:32,
		V0_card1_days:16, V0_card1_acc:16, V0_card2_is_reward:8,
		V0_card2_end_time:32, V0_card2_days:16,
		V0_card2_acc:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16705:16,
       D_a_t_a/binary>>};
pack(16706, cli, {V0_card_type}) ->
    D_a_t_a = <<V0_card_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16706:16,
       D_a_t_a/binary>>};
pack(16706, srv, {V0_code, V0_msg, V0_card_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_card_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16706:16,
       D_a_t_a/binary>>};
pack(16707, cli, {}) -> {ok, <<2:32, 16707:16>>};
pack(16707, srv, {V0_status}) ->
    D_a_t_a = <<V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16707:16,
       D_a_t_a/binary>>};
pack(16708, cli, {}) -> {ok, <<2:32, 16708:16>>};
pack(16708, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16708:16,
       D_a_t_a/binary>>};
pack(16710, cli, {}) -> {ok, <<2:32, 16710:16>>};
pack(16710, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_lev:8>>
				 || V1_lev <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16710:16,
       D_a_t_a/binary>>};
pack(16711, cli, {V0_lev}) ->
    D_a_t_a = <<V0_lev:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16711:16,
       D_a_t_a/binary>>};
pack(16711, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16711:16,
       D_a_t_a/binary>>};
pack(16712, cli, {}) -> {ok, <<2:32, 16712:16>>};
pack(16712, srv, {V0_charge_sum, V0_list}) ->
    D_a_t_a = <<V0_charge_sum:32, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:8>>
				 || {V1_id, V1_status} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16712:16,
       D_a_t_a/binary>>};
pack(16713, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16713:16,
       D_a_t_a/binary>>};
pack(16713, srv, {V0_code, V0_msg, V0_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:8>>
				 || {V1_id, V1_status} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16713:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(16700, srv, _B0) -> {ok, {}};
unpack(16700, cli, _B0) ->
    {V1_list, _B10} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_name, _B3} =
						 protocol:string(_B2),
					     {V2_need_rmb, _B4} =
						 protocol:uint32(_B3),
					     {V2_get_gold, _B5} =
						 protocol:uint32(_B4),
					     {V2_add_gold, _B6} =
						 protocol:uint32(_B5),
					     {V2_is_first, _B7} =
						 protocol:uint8(_B6),
					     {V2_pic, _B8} =
						 protocol:uint8(_B7),
					     {{V2_id, V2_name, V2_need_rmb,
					       V2_get_gold, V2_add_gold,
					       V2_is_first, V2_pic},
					      _B8}
				     end),
    {ok, {V1_list}};
unpack(16705, srv, _B0) -> {ok, {}};
unpack(16705, cli, _B0) ->
    {V1_card1_is_reward, _B1} = protocol:uint8(_B0),
    {V1_card1_end_time, _B2} = protocol:uint32(_B1),
    {V1_card1_days, _B3} = protocol:uint16(_B2),
    {V1_card1_acc, _B4} = protocol:uint16(_B3),
    {V1_card2_is_reward, _B5} = protocol:uint8(_B4),
    {V1_card2_end_time, _B6} = protocol:uint32(_B5),
    {V1_card2_days, _B7} = protocol:uint16(_B6),
    {V1_card2_acc, _B8} = protocol:uint16(_B7),
    {ok,
     {V1_card1_is_reward, V1_card1_end_time, V1_card1_days,
      V1_card1_acc, V1_card2_is_reward, V1_card2_end_time,
      V1_card2_days, V1_card2_acc}};
unpack(16706, srv, _B0) ->
    {V1_card_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_card_type}};
unpack(16706, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_card_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_card_type}};
unpack(16707, srv, _B0) -> {ok, {}};
unpack(16707, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {ok, {V1_status}};
unpack(16708, srv, _B0) -> {ok, {}};
unpack(16708, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16710, srv, _B0) -> {ok, {}};
unpack(16710, cli, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_lev, _B2} = protocol:uint8(_B1),
					    {V2_lev, _B2}
				    end),
    {ok, {V1_list}};
unpack(16711, srv, _B0) ->
    {V1_lev, _B1} = protocol:uint8(_B0), {ok, {V1_lev}};
unpack(16711, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16712, srv, _B0) -> {ok, {}};
unpack(16712, cli, _B0) ->
    {V1_charge_sum, _B1} = protocol:uint32(_B0),
    {V1_list, _B6} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_id, _B3} = protocol:uint32(_B2),
					    {V2_status, _B4} =
						protocol:uint8(_B3),
					    {{V2_id, V2_status}, _B4}
				    end),
    {ok, {V1_charge_sum, V1_list}};
unpack(16713, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(16713, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_list, _B7} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {V2_status, _B5} =
						protocol:uint8(_B4),
					    {{V2_id, V2_status}, _B5}
				    end),
    {ok, {V1_code, V1_msg, V1_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


