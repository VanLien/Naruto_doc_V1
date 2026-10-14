-file("src/proto/proto_255.erl", 1).

-module(proto_255).

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

-file("src/proto/proto_255.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25500, cli, {}) -> {ok, <<2:32, 25500:16>>};
pack(25500, srv,
     {V0_period, V0_day_time, V0_week_time, V0_month_time,
      V0_list}) ->
    D_a_t_a = <<V0_period:8, V0_day_time:32,
		V0_week_time:32, V0_month_time:32, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_price:32,
				   V1_charge_id:32, V1_limit_type:8,
				   V1_buy_num:32, V1_limit_num:32,
				   V1_original_price:32, V1_res_name:32,
				   V1_rank:32, V1_icon:32,
				   (length(V1_award_list)):16,
				   (list_to_binary([<<V2_item_id:32,
						      V2_item_num:32>>
						    || {V2_item_id, V2_item_num}
							   <- V1_award_list]))/binary>>
				 || {V1_id, V1_price, V1_charge_id,
				     V1_limit_type, V1_buy_num, V1_limit_num,
				     V1_original_price, V1_res_name, V1_rank,
				     V1_icon, V1_award_list}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25500:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25500, srv, _B0) -> {ok, {}};
unpack(25500, cli, _B0) ->
    {V1_period, _B1} = protocol:uint8(_B0),
    {V1_day_time, _B2} = protocol:uint32(_B1),
    {V1_week_time, _B3} = protocol:uint32(_B2),
    {V1_month_time, _B4} = protocol:uint32(_B3),
    {V1_list, _B22} = protocol:array(_B4,
				     fun (_B5) ->
					     {V2_id, _B6} =
						 protocol:uint32(_B5),
					     {V2_price, _B7} =
						 protocol:uint32(_B6),
					     {V2_charge_id, _B8} =
						 protocol:uint32(_B7),
					     {V2_limit_type, _B9} =
						 protocol:uint8(_B8),
					     {V2_buy_num, _B10} =
						 protocol:uint32(_B9),
					     {V2_limit_num, _B11} =
						 protocol:uint32(_B10),
					     {V2_original_price, _B12} =
						 protocol:uint32(_B11),
					     {V2_res_name, _B13} =
						 protocol:uint32(_B12),
					     {V2_rank, _B14} =
						 protocol:uint32(_B13),
					     {V2_icon, _B15} =
						 protocol:uint32(_B14),
					     {V2_award_list, _B20} =
						 protocol:array(_B15,
								fun (_B16) ->
									{V3_item_id,
									 _B17} =
									    protocol:uint32(_B16),
									{V3_item_num,
									 _B18} =
									    protocol:uint32(_B17),
									{{V3_item_id,
									  V3_item_num},
									 _B18}
								end),
					     {{V2_id, V2_price, V2_charge_id,
					       V2_limit_type, V2_buy_num,
					       V2_limit_num, V2_original_price,
					       V2_res_name, V2_rank, V2_icon,
					       V2_award_list},
					      _B20}
				     end),
    {ok,
     {V1_period, V1_day_time, V1_week_time, V1_month_time,
      V1_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


