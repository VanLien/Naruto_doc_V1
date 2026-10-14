-file("src/proto/proto_238.erl", 1).

-module(proto_238).

-lager_records([{shipping_order,
		 [ver, order_id, order_bid, status, end_time,
		  assign_ids]},
		{m_shipping,
		 [ver, free_times, coin_times, day_times, all_times,
		  next_order_id, free_list, do_list, apear_list,
		  rand_counts]}]).

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

-file("src/proto/proto_238.erl", 16).

-file("inc/shipping.hrl", 1).

-record(m_shipping,
	{ver = 3, free_times = 0, coin_times = 0, day_times = 0,
	 all_times = 0, next_order_id = 1, free_list = [],
	 do_list = [], apear_list = [], rand_counts = []}).

-record(shipping_order,
	{ver = 1, order_id, order_bid = 0, status = 1,
	 end_time = 0, assign_ids = []}).

-file("src/proto/proto_238.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(23800, cli, {}) -> {ok, <<2:32, 23800:16>>};
pack(23800, srv,
     {V0_order_list, V0_free_times, V0_coin_times}) ->
    D_a_t_a = <<(length(V0_order_list)):16,
		(list_to_binary([<<V1_order_id:32, V1_order_bid:32,
				   V1_status:8, V1_end_time:32,
				   (length(V1_assign_ids)):16,
				   (list_to_binary([<<V2_partner_id:32>>
						    || V2_partner_id
							   <- V1_assign_ids]))/binary>>
				 || #shipping_order{order_id = V1_order_id,
						    order_bid = V1_order_bid,
						    status = V1_status,
						    end_time = V1_end_time,
						    assign_ids = V1_assign_ids}
					<- V0_order_list]))/binary,
		V0_free_times:8, V0_coin_times:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23800:16,
       D_a_t_a/binary>>};
pack(23801, cli, {}) -> {ok, <<2:32, 23801:16>>};
pack(23801, srv,
     {#shipping_order{order_id = V0_order_id,
		      order_bid = V0_order_bid, status = V0_status,
		      end_time = V0_end_time, assign_ids = V0_assign_ids}}) ->
    D_a_t_a = <<V0_order_id:32, V0_order_bid:32,
		V0_status:8, V0_end_time:32, (length(V0_assign_ids)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_assign_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23801:16,
       D_a_t_a/binary>>};
pack(23802, cli, {V0_order_id, V0_assign_ids}) ->
    D_a_t_a = <<V0_order_id:32, (length(V0_assign_ids)):16,
		(list_to_binary([<<V1_partner_id:32>>
				 || V1_partner_id <- V0_assign_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23802:16,
       D_a_t_a/binary>>};
pack(23802, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23802:16,
       D_a_t_a/binary>>};
pack(23803, cli, {V0_order_id, V0_type}) ->
    D_a_t_a = <<V0_order_id:32, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23803:16,
       D_a_t_a/binary>>};
pack(23803, srv, {V0_flag, V0_msg, V0_order_id}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_order_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23803:16,
       D_a_t_a/binary>>};
pack(23804, cli, {}) -> {ok, <<2:32, 23804:16>>};
pack(23804, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23804:16,
       D_a_t_a/binary>>};
pack(23805, cli, {}) -> {ok, <<2:32, 23805:16>>};
pack(23805, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23805:16,
       D_a_t_a/binary>>};
pack(23806, cli, {}) -> {ok, <<2:32, 23806:16>>};
pack(23806, srv, {V0_flag, V0_msg, V0_order_list}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_order_list)):16,
		(list_to_binary([<<V1_order_id:32>>
				 || V1_order_id <- V0_order_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23806:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(23800, srv, _B0) -> {ok, {}};
unpack(23800, cli, _B0) ->
    {V1_order_list, _B11} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_order_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_order_bid, _B3} =
						       protocol:uint32(_B2),
						   {V2_status, _B4} =
						       protocol:uint8(_B3),
						   {V2_end_time, _B5} =
						       protocol:uint32(_B4),
						   {V2_assign_ids, _B9} =
						       protocol:array(_B5,
								      fun
									(_B6) ->
									    {V3_partner_id,
									     _B7} =
										protocol:uint32(_B6),
									    {V3_partner_id,
									     _B7}
								      end),
						   {{V2_order_id, V2_order_bid,
						     V2_status, V2_end_time,
						     V2_assign_ids},
						    _B9}
					   end),
    {V1_free_times, _B12} = protocol:uint8(_B11),
    {V1_coin_times, _B13} = protocol:uint32(_B12),
    {ok, {V1_order_list, V1_free_times, V1_coin_times}};
unpack(23801, srv, _B0) -> {ok, {}};
unpack(23801, cli, _B0) ->
    {V1_order_id, _B1} = protocol:uint32(_B0),
    {V1_order_bid, _B2} = protocol:uint32(_B1),
    {V1_status, _B3} = protocol:uint8(_B2),
    {V1_end_time, _B4} = protocol:uint32(_B3),
    {V1_assign_ids, _B8} = protocol:array(_B4,
					  fun (_B5) ->
						  {V2_partner_id, _B6} =
						      protocol:uint32(_B5),
						  {V2_partner_id, _B6}
					  end),
    {ok,
     {V1_order_id, V1_order_bid, V1_status, V1_end_time,
      V1_assign_ids}};
unpack(23802, srv, _B0) ->
    {V1_order_id, _B1} = protocol:uint32(_B0),
    {V1_assign_ids, _B5} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_partner_id, _B3} =
						      protocol:uint32(_B2),
						  {V2_partner_id, _B3}
					  end),
    {ok, {V1_order_id, V1_assign_ids}};
unpack(23802, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23803, srv, _B0) ->
    {V1_order_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_order_id, V1_type}};
unpack(23803, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_order_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_order_id}};
unpack(23804, srv, _B0) -> {ok, {}};
unpack(23804, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23805, srv, _B0) -> {ok, {}};
unpack(23805, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(23806, srv, _B0) -> {ok, {}};
unpack(23806, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_order_list, _B6} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_order_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_order_id, _B4}
					  end),
    {ok, {V1_flag, V1_msg, V1_order_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


