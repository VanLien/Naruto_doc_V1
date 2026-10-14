-file("src/proto/proto_232.erl", 1).

-module(proto_232).

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

-file("src/proto/proto_232.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(23200, cli, {}) -> {ok, <<2:32, 23200:16>>};
pack(23200, srv,
     {V0_recruit_list, V0_is_share, V0_is_day_share,
      V0_must_five_num}) ->
    D_a_t_a = <<(length(V0_recruit_list)):16,
		(list_to_binary([<<V1_group_id:16,
				   (length(V1_draw_list)):16,
				   (list_to_binary([<<V2_times:8,
						      (length(V2_kv_list)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32,
									 (protocol:pack(string,
											V3_str_val))/binary>>
								       || {V3_key,
									   V3_val,
									   V3_str_val}
									      <- V2_kv_list]))/binary>>
						    || {V2_times, V2_kv_list}
							   <- V1_draw_list]))/binary>>
				 || {V1_group_id, V1_draw_list}
					<- V0_recruit_list]))/binary,
		V0_is_share:8, V0_is_day_share:8, V0_must_five_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23200:16,
       D_a_t_a/binary>>};
pack(23201, cli,
     {V0_group_id, V0_times, V0_recruit_type}) ->
    D_a_t_a = <<V0_group_id:16, V0_times:8,
		V0_recruit_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23201:16,
       D_a_t_a/binary>>};
pack(23201, srv,
     {V0_group_id, V0_times, V0_flag, V0_rewards,
      V0_partner_bids, V0_partner_chips, V0_must_five_num}) ->
    D_a_t_a = <<V0_group_id:16, V0_times:8, V0_flag:32,
		(length(V0_rewards)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_rewards]))/binary,
		(length(V0_partner_bids)):16,
		(list_to_binary([<<V1_partner_bid:32, V1_init_star:8>>
				 || {V1_partner_bid, V1_init_star}
					<- V0_partner_bids]))/binary,
		(length(V0_partner_chips)):16,
		(list_to_binary([<<V1_partner_bid:32, V1_chip_bid:32,
				   V1_chip_num:32>>
				 || {V1_partner_bid, V1_chip_bid, V1_chip_num}
					<- V0_partner_chips]))/binary,
		V0_must_five_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23201:16,
       D_a_t_a/binary>>};
pack(23202, cli, {}) -> {ok, <<2:32, 23202:16>>};
pack(23202, srv,
     {V0_group_id, V0_free_cd_end, V0_free_times}) ->
    D_a_t_a = <<V0_group_id:16, V0_free_cd_end:32,
		V0_free_times:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23202:16,
       D_a_t_a/binary>>};
pack(23203, cli, {}) -> {ok, <<2:32, 23203:16>>};
pack(23203, srv,
     {V0_code, V0_msg, V0_is_share, V0_is_day_share}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_is_share:8,
		V0_is_day_share:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23203:16,
       D_a_t_a/binary>>};
pack(23204, cli, {}) -> {ok, <<2:32, 23204:16>>};
pack(23204, srv, {V0_recruit_group}) ->
    D_a_t_a = <<(length(V0_recruit_group)):16,
		(list_to_binary([<<V1_group_id:16,
				   (length(V1_draw_list)):16,
				   (list_to_binary([<<V2_times:8,
						      (length(V2_kv_list)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32,
									 (protocol:pack(string,
											V3_str_val))/binary>>
								       || {V3_key,
									   V3_val,
									   V3_str_val}
									      <- V2_kv_list]))/binary>>
						    || {V2_times, V2_kv_list}
							   <- V1_draw_list]))/binary>>
				 || {V1_group_id, V1_draw_list}
					<- V0_recruit_group]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23204:16,
       D_a_t_a/binary>>};
pack(23210, cli, {}) -> {ok, <<2:32, 23210:16>>};
pack(23210, srv, {V0_fals, V0_end_time, V0_rewards}) ->
    D_a_t_a = <<V0_fals:8, V0_end_time:32,
		(length(V0_rewards)):16,
		(list_to_binary([<<V1_id:32, V1_num:32, V1_status:8>>
				 || {V1_id, V1_num, V1_status}
					<- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23210:16,
       D_a_t_a/binary>>};
pack(23211, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23211:16,
       D_a_t_a/binary>>};
pack(23211, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23211:16,
       D_a_t_a/binary>>};
pack(23212, cli, {}) -> {ok, <<2:32, 23212:16>>};
pack(23212, srv, {}) -> {ok, <<2:32, 23212:16>>};
pack(23213, cli, {V0_group_id}) ->
    D_a_t_a = <<V0_group_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23213:16,
       D_a_t_a/binary>>};
pack(23213, srv, {V0_group_id, V0_rewards}) ->
    D_a_t_a = <<V0_group_id:16, (length(V0_rewards)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23213:16,
       D_a_t_a/binary>>};
pack(23214, cli, {}) -> {ok, <<2:32, 23214:16>>};
pack(23214, srv,
     {V0_partner_id, V0_new_partner_bid, V0_partner_ids}) ->
    D_a_t_a = <<V0_partner_id:32, V0_new_partner_bid:32,
		(length(V0_partner_ids)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_partner_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23214:16,
       D_a_t_a/binary>>};
pack(23215, cli, {V0_partner_id, V0_action}) ->
    D_a_t_a = <<V0_partner_id:32, V0_action:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23215:16,
       D_a_t_a/binary>>};
pack(23215, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23215:16,
       D_a_t_a/binary>>};
pack(23216, cli, {}) -> {ok, <<2:32, 23216:16>>};
pack(23216, srv,
     {V0_camp_id, V0_free_time, V0_times, V0_start_time,
      V0_end_time, V0_item_id, V0_item_num, V0_must_count,
      V0_reward_list}) ->
    D_a_t_a = <<V0_camp_id:32, V0_free_time:32, V0_times:32,
		V0_start_time:32, V0_end_time:32, V0_item_id:32,
		V0_item_num:32, V0_must_count:16,
		(length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23216:16,
       D_a_t_a/binary>>};
pack(23217, cli, {V0_times, V0_recruit_type}) ->
    D_a_t_a = <<V0_times:8, V0_recruit_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23217:16,
       D_a_t_a/binary>>};
pack(23217, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23217:16,
       D_a_t_a/binary>>};
pack(23218, cli, {}) -> {ok, <<2:32, 23218:16>>};
pack(23218, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23218:16,
       D_a_t_a/binary>>};
pack(23219, cli, {V0_bid}) ->
    D_a_t_a = <<V0_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23219:16,
       D_a_t_a/binary>>};
pack(23219, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23219:16,
       D_a_t_a/binary>>};
pack(23220, cli, {}) -> {ok, <<2:32, 23220:16>>};
pack(23220, srv,
     {V0_camp_id, V0_free_time, V0_times, V0_start_time,
      V0_end_time, V0_item_id, V0_item_num, V0_must_count,
      V0_reward_list}) ->
    D_a_t_a = <<V0_camp_id:32, V0_free_time:32, V0_times:32,
		V0_start_time:32, V0_end_time:32, V0_item_id:32,
		V0_item_num:32, V0_must_count:16,
		(length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23220:16,
       D_a_t_a/binary>>};
pack(23221, cli, {V0_times, V0_recruit_type}) ->
    D_a_t_a = <<V0_times:8, V0_recruit_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23221:16,
       D_a_t_a/binary>>};
pack(23221, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23221:16,
       D_a_t_a/binary>>};
pack(23222, cli, {}) -> {ok, <<2:32, 23222:16>>};
pack(23222, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23222:16,
       D_a_t_a/binary>>};
pack(23230, cli, {}) -> {ok, <<2:32, 23230:16>>};
pack(23230, srv,
     {V0_camp_id, V0_free_time, V0_times, V0_start_time,
      V0_end_time, V0_item_id, V0_item_num, V0_must_count,
      V0_reward_list, V0_lucky_bid}) ->
    D_a_t_a = <<V0_camp_id:32, V0_free_time:32, V0_times:32,
		V0_start_time:32, V0_end_time:32, V0_item_id:32,
		V0_item_num:32, V0_must_count:16,
		(length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_reward_list]))/binary,
		V0_lucky_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23230:16,
       D_a_t_a/binary>>};
pack(23231, cli, {V0_times, V0_recruit_type}) ->
    D_a_t_a = <<V0_times:8, V0_recruit_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23231:16,
       D_a_t_a/binary>>};
pack(23231, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23231:16,
       D_a_t_a/binary>>};
pack(23232, cli, {V0_award_id, V0_self_award_id}) ->
    D_a_t_a = <<V0_award_id:32, V0_self_award_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23232:16,
       D_a_t_a/binary>>};
pack(23232, srv,
     {V0_flag, V0_msg, V0_award_id, V0_self_award_id}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_award_id:32,
		V0_self_award_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23232:16,
       D_a_t_a/binary>>};
pack(23233, cli, {V0_lucky_bid}) ->
    D_a_t_a = <<V0_lucky_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23233:16,
       D_a_t_a/binary>>};
pack(23233, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23233:16,
       D_a_t_a/binary>>};
pack(23234, cli, {}) -> {ok, <<2:32, 23234:16>>};
pack(23234, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23234:16,
       D_a_t_a/binary>>};
pack(23235, cli, {}) -> {ok, <<2:32, 23235:16>>};
pack(23235, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23235:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(23200, srv, _B0) -> {ok, {}};
unpack(23200, cli, _B0) ->
    {V1_recruit_list, _B14} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_group_id, _B2} =
							 protocol:uint16(_B1),
						     {V2_draw_list, _B12} =
							 protocol:array(_B2,
									fun
									  (_B3) ->
									      {V3_times,
									       _B4} =
										  protocol:uint8(_B3),
									      {V3_kv_list,
									       _B10} =
										  protocol:array(_B4,
												 fun
												   (_B5) ->
												       {V4_key,
													_B6} =
													   protocol:uint32(_B5),
												       {V4_val,
													_B7} =
													   protocol:uint32(_B6),
												       {V4_str_val,
													_B8} =
													   protocol:string(_B7),
												       {{V4_key,
													 V4_val,
													 V4_str_val},
													_B8}
												 end),
									      {{V3_times,
										V3_kv_list},
									       _B10}
									end),
						     {{V2_group_id,
						       V2_draw_list},
						      _B12}
					     end),
    {V1_is_share, _B15} = protocol:uint8(_B14),
    {V1_is_day_share, _B16} = protocol:uint8(_B15),
    {V1_must_five_num, _B17} = protocol:uint16(_B16),
    {ok,
     {V1_recruit_list, V1_is_share, V1_is_day_share,
      V1_must_five_num}};
unpack(23201, srv, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {V1_recruit_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_group_id, V1_times, V1_recruit_type}};
unpack(23201, cli, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_times, _B2} = protocol:uint8(_B1),
    {V1_flag, _B3} = protocol:uint32(_B2),
    {V1_rewards, _B8} = protocol:array(_B3,
				       fun (_B4) ->
					       {V2_base_id, _B5} =
						   protocol:uint32(_B4),
					       {V2_num, _B6} =
						   protocol:uint32(_B5),
					       {{V2_base_id, V2_num}, _B6}
				       end),
    {V1_partner_bids, _B13} = protocol:array(_B8,
					     fun (_B9) ->
						     {V2_partner_bid, _B10} =
							 protocol:uint32(_B9),
						     {V2_init_star, _B11} =
							 protocol:uint8(_B10),
						     {{V2_partner_bid,
						       V2_init_star},
						      _B11}
					     end),
    {V1_partner_chips, _B19} = protocol:array(_B13,
					      fun (_B14) ->
						      {V2_partner_bid, _B15} =
							  protocol:uint32(_B14),
						      {V2_chip_bid, _B16} =
							  protocol:uint32(_B15),
						      {V2_chip_num, _B17} =
							  protocol:uint32(_B16),
						      {{V2_partner_bid,
							V2_chip_bid,
							V2_chip_num},
						       _B17}
					      end),
    {V1_must_five_num, _B20} = protocol:uint16(_B19),
    {ok,
     {V1_group_id, V1_times, V1_flag, V1_rewards,
      V1_partner_bids, V1_partner_chips, V1_must_five_num}};
unpack(23202, srv, _B0) -> {ok, {}};
unpack(23202, cli, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_free_cd_end, _B2} = protocol:uint32(_B1),
    {V1_free_times, _B3} = protocol:uint8(_B2),
    {ok, {V1_group_id, V1_free_cd_end, V1_free_times}};
unpack(23203, srv, _B0) -> {ok, {}};
unpack(23203, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_is_share, _B3} = protocol:uint8(_B2),
    {V1_is_day_share, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_is_share, V1_is_day_share}};
unpack(23204, srv, _B0) -> {ok, {}};
unpack(23204, cli, _B0) ->
    {V1_recruit_group, _B14} = protocol:array(_B0,
					      fun (_B1) ->
						      {V2_group_id, _B2} =
							  protocol:uint16(_B1),
						      {V2_draw_list, _B12} =
							  protocol:array(_B2,
									 fun
									   (_B3) ->
									       {V3_times,
										_B4} =
										   protocol:uint8(_B3),
									       {V3_kv_list,
										_B10} =
										   protocol:array(_B4,
												  fun
												    (_B5) ->
													{V4_key,
													 _B6} =
													    protocol:uint32(_B5),
													{V4_val,
													 _B7} =
													    protocol:uint32(_B6),
													{V4_str_val,
													 _B8} =
													    protocol:string(_B7),
													{{V4_key,
													  V4_val,
													  V4_str_val},
													 _B8}
												  end),
									       {{V3_times,
										 V3_kv_list},
										_B10}
									 end),
						      {{V2_group_id,
							V2_draw_list},
						       _B12}
					      end),
    {ok, {V1_recruit_group}};
unpack(23210, srv, _B0) -> {ok, {}};
unpack(23210, cli, _B0) ->
    {V1_fals, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_rewards, _B8} = protocol:array(_B2,
				       fun (_B3) ->
					       {V2_id, _B4} =
						   protocol:uint32(_B3),
					       {V2_num, _B5} =
						   protocol:uint32(_B4),
					       {V2_status, _B6} =
						   protocol:uint8(_B5),
					       {{V2_id, V2_num, V2_status}, _B6}
				       end),
    {ok, {V1_fals, V1_end_time, V1_rewards}};
unpack(23211, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(23211, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(23212, srv, _B0) -> {ok, {}};
unpack(23212, cli, _B0) -> {ok, {}};
unpack(23213, srv, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_group_id}};
unpack(23213, cli, _B0) ->
    {V1_group_id, _B1} = protocol:uint16(_B0),
    {V1_rewards, _B6} = protocol:array(_B1,
				       fun (_B2) ->
					       {V2_base_id, _B3} =
						   protocol:uint32(_B2),
					       {V2_num, _B4} =
						   protocol:uint32(_B3),
					       {{V2_base_id, V2_num}, _B4}
				       end),
    {ok, {V1_group_id, V1_rewards}};
unpack(23214, srv, _B0) -> {ok, {}};
unpack(23214, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_new_partner_bid, _B2} = protocol:uint32(_B1),
    {V1_partner_ids, _B6} = protocol:array(_B2,
					   fun (_B3) ->
						   {V2_id, _B4} =
						       protocol:uint32(_B3),
						   {V2_id, _B4}
					   end),
    {ok,
     {V1_partner_id, V1_new_partner_bid, V1_partner_ids}};
unpack(23215, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_action, _B2} = protocol:uint8(_B1),
    {ok, {V1_partner_id, V1_action}};
unpack(23215, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(23216, srv, _B0) -> {ok, {}};
unpack(23216, cli, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_free_time, _B2} = protocol:uint32(_B1),
    {V1_times, _B3} = protocol:uint32(_B2),
    {V1_start_time, _B4} = protocol:uint32(_B3),
    {V1_end_time, _B5} = protocol:uint32(_B4),
    {V1_item_id, _B6} = protocol:uint32(_B5),
    {V1_item_num, _B7} = protocol:uint32(_B6),
    {V1_must_count, _B8} = protocol:uint16(_B7),
    {V1_reward_list, _B12} = protocol:array(_B8,
					    fun (_B9) ->
						    {V2_id, _B10} =
							protocol:uint16(_B9),
						    {V2_id, _B10}
					    end),
    {ok,
     {V1_camp_id, V1_free_time, V1_times, V1_start_time,
      V1_end_time, V1_item_id, V1_item_num, V1_must_count,
      V1_reward_list}};
unpack(23217, srv, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_recruit_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_times, V1_recruit_type}};
unpack(23217, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23218, srv, _B0) -> {ok, {}};
unpack(23218, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23219, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0), {ok, {V1_bid}};
unpack(23219, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23220, srv, _B0) -> {ok, {}};
unpack(23220, cli, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_free_time, _B2} = protocol:uint32(_B1),
    {V1_times, _B3} = protocol:uint32(_B2),
    {V1_start_time, _B4} = protocol:uint32(_B3),
    {V1_end_time, _B5} = protocol:uint32(_B4),
    {V1_item_id, _B6} = protocol:uint32(_B5),
    {V1_item_num, _B7} = protocol:uint32(_B6),
    {V1_must_count, _B8} = protocol:uint16(_B7),
    {V1_reward_list, _B12} = protocol:array(_B8,
					    fun (_B9) ->
						    {V2_id, _B10} =
							protocol:uint16(_B9),
						    {V2_id, _B10}
					    end),
    {ok,
     {V1_camp_id, V1_free_time, V1_times, V1_start_time,
      V1_end_time, V1_item_id, V1_item_num, V1_must_count,
      V1_reward_list}};
unpack(23221, srv, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_recruit_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_times, V1_recruit_type}};
unpack(23221, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23222, srv, _B0) -> {ok, {}};
unpack(23222, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23230, srv, _B0) -> {ok, {}};
unpack(23230, cli, _B0) ->
    {V1_camp_id, _B1} = protocol:uint32(_B0),
    {V1_free_time, _B2} = protocol:uint32(_B1),
    {V1_times, _B3} = protocol:uint32(_B2),
    {V1_start_time, _B4} = protocol:uint32(_B3),
    {V1_end_time, _B5} = protocol:uint32(_B4),
    {V1_item_id, _B6} = protocol:uint32(_B5),
    {V1_item_num, _B7} = protocol:uint32(_B6),
    {V1_must_count, _B8} = protocol:uint16(_B7),
    {V1_reward_list, _B12} = protocol:array(_B8,
					    fun (_B9) ->
						    {V2_id, _B10} =
							protocol:uint16(_B9),
						    {V2_id, _B10}
					    end),
    {V1_lucky_bid, _B13} = protocol:uint32(_B12),
    {ok,
     {V1_camp_id, V1_free_time, V1_times, V1_start_time,
      V1_end_time, V1_item_id, V1_item_num, V1_must_count,
      V1_reward_list, V1_lucky_bid}};
unpack(23231, srv, _B0) ->
    {V1_times, _B1} = protocol:uint8(_B0),
    {V1_recruit_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_times, V1_recruit_type}};
unpack(23231, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23232, srv, _B0) ->
    {V1_award_id, _B1} = protocol:uint32(_B0),
    {V1_self_award_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_award_id, V1_self_award_id}};
unpack(23232, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_award_id, _B3} = protocol:uint32(_B2),
    {V1_self_award_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_award_id, V1_self_award_id}};
unpack(23233, srv, _B0) ->
    {V1_lucky_bid, _B1} = protocol:uint32(_B0),
    {ok, {V1_lucky_bid}};
unpack(23233, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23234, srv, _B0) -> {ok, {}};
unpack(23234, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(23235, srv, _B0) -> {ok, {}};
unpack(23235, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


