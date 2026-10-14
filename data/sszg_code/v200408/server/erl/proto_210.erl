-file("src/proto/proto_210.erl", 1).

-module(proto_210).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(21000, cli, {}) -> {ok, <<2:32, 21000:16>>};
pack(21000, srv, {V0_end_time, V0_first_gift}) ->
    D_a_t_a = <<V0_end_time:32, (length(V0_first_gift)):16,
		(list_to_binary([<<V1_id:8, V1_status:8>>
				 || {V1_id, V1_status}
					<- V0_first_gift]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21000:16,
       D_a_t_a/binary>>};
pack(21001, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21001:16,
       D_a_t_a/binary>>};
pack(21001, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21001:16,
       D_a_t_a/binary>>};
pack(21002, cli, {}) -> {ok, <<2:32, 21002:16>>};
pack(21002, srv, {V0_count}) ->
    D_a_t_a = <<V0_count:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21002:16,
       D_a_t_a/binary>>};
pack(21003, cli, {}) -> {ok, <<2:32, 21003:16>>};
pack(21003, srv, {}) -> {ok, <<2:32, 21003:16>>};
pack(21004, cli, {}) -> {ok, <<2:32, 21004:16>>};
pack(21004, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21004:16,
       D_a_t_a/binary>>};
pack(21005, cli, {}) -> {ok, <<2:32, 21005:16>>};
pack(21005, srv, {V0_count, V0_gold, V0_next_gold}) ->
    D_a_t_a = <<V0_count:16, V0_gold:32, V0_next_gold:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21005:16,
       D_a_t_a/binary>>};
pack(21006, cli, {}) -> {ok, <<2:32, 21006:16>>};
pack(21006, srv, {V0_first_gift}) ->
    D_a_t_a = <<(length(V0_first_gift)):16,
		(list_to_binary([<<V1_id:8, V1_count:16>>
				 || {V1_id, V1_count}
					<- V0_first_gift]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21006:16,
       D_a_t_a/binary>>};
pack(21007, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21007:16,
       D_a_t_a/binary>>};
pack(21007, srv,
     {V0_type, V0_ref_time, V0_reg_day, V0_first_gift}) ->
    D_a_t_a = <<V0_type:8, V0_ref_time:32, V0_reg_day:32,
		(length(V0_first_gift)):16,
		(list_to_binary([<<V1_id:32, V1_count:16>>
				 || {V1_id, V1_count}
					<- V0_first_gift]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21007:16,
       D_a_t_a/binary>>};
pack(21008, cli, {}) -> {ok, <<2:32, 21008:16>>};
pack(21008, srv, {V0_status}) ->
    D_a_t_a = <<V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21008:16,
       D_a_t_a/binary>>};
pack(21009, cli, {}) -> {ok, <<2:32, 21009:16>>};
pack(21009, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21009:16,
       D_a_t_a/binary>>};
pack(21010, cli, {}) -> {ok, <<2:32, 21010:16>>};
pack(21010, srv, {V0_status, V0_num}) ->
    D_a_t_a = <<V0_status:8, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21010:16,
       D_a_t_a/binary>>};
pack(21011, cli, {}) -> {ok, <<2:32, 21011:16>>};
pack(21011, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21011:16,
       D_a_t_a/binary>>};
pack(21012, cli, {}) -> {ok, <<2:32, 21012:16>>};
pack(21012, srv,
     {V0_choosen_status, V0_has_choosen_id,
      V0_first_gift}) ->
    D_a_t_a = <<V0_choosen_status:8, V0_has_choosen_id:8,
		(length(V0_first_gift)):16,
		(list_to_binary([<<V1_id:8, V1_status:8>>
				 || {V1_id, V1_status}
					<- V0_first_gift]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21012:16,
       D_a_t_a/binary>>};
pack(21013, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21013:16,
       D_a_t_a/binary>>};
pack(21013, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21013:16,
       D_a_t_a/binary>>};
pack(21014, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21014:16,
       D_a_t_a/binary>>};
pack(21014, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21014:16,
       D_a_t_a/binary>>};
pack(21015, cli, {}) -> {ok, <<2:32, 21015:16>>};
pack(21015, srv, {V0_open_id}) ->
    D_a_t_a = <<(length(V0_open_id)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_open_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21015:16,
       D_a_t_a/binary>>};
pack(21016, cli, {V0_charge_id}) ->
    D_a_t_a = <<V0_charge_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21016:16,
       D_a_t_a/binary>>};
pack(21016, srv, {V0_charge_id, V0_status}) ->
    D_a_t_a = <<V0_charge_id:32, V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21016:16,
       D_a_t_a/binary>>};
pack(21020, cli, {}) -> {ok, <<2:32, 21020:16>>};
pack(21020, srv, {V0_status}) ->
    D_a_t_a = <<V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21020:16,
       D_a_t_a/binary>>};
pack(21021, cli, {}) -> {ok, <<2:32, 21021:16>>};
pack(21021, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21021:16,
       D_a_t_a/binary>>};
pack(21022, cli, {}) -> {ok, <<2:32, 21022:16>>};
pack(21022, srv, {V0_open_id}) ->
    D_a_t_a = <<(length(V0_open_id)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_open_id]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21022:16,
       D_a_t_a/binary>>};
pack(21023, cli, {V0_package_id}) ->
    D_a_t_a = <<V0_package_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21023:16,
       D_a_t_a/binary>>};
pack(21023, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21023:16,
       D_a_t_a/binary>>};
pack(21024, cli, {}) -> {ok, <<2:32, 21024:16>>};
pack(21024, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21024:16,
       D_a_t_a/binary>>};
pack(21030, cli, {}) -> {ok, <<2:32, 21030:16>>};
pack(21030, srv, {V0_end_time, V0_first_gift}) ->
    D_a_t_a = <<V0_end_time:32, (length(V0_first_gift)):16,
		(list_to_binary([<<V1_id:8, V1_status:8>>
				 || {V1_id, V1_status}
					<- V0_first_gift]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21030:16,
       D_a_t_a/binary>>};
pack(21031, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21031:16,
       D_a_t_a/binary>>};
pack(21031, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21031:16,
       D_a_t_a/binary>>};
pack(21032, cli, {}) -> {ok, <<2:32, 21032:16>>};
pack(21032, srv, {V0_end_time, V0_first_gift}) ->
    D_a_t_a = <<V0_end_time:32, (length(V0_first_gift)):16,
		(list_to_binary([<<V1_id:8, V1_status:8>>
				 || {V1_id, V1_status}
					<- V0_first_gift]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21032:16,
       D_a_t_a/binary>>};
pack(21033, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21033:16,
       D_a_t_a/binary>>};
pack(21033, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21033:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(21000, srv, _B0) -> {ok, {}};
unpack(21000, cli, _B0) ->
    {V1_end_time, _B1} = protocol:uint32(_B0),
    {V1_first_gift, _B6} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_id, _B3} =
						      protocol:uint8(_B2),
						  {V2_status, _B4} =
						      protocol:uint8(_B3),
						  {{V2_id, V2_status}, _B4}
					  end),
    {ok, {V1_end_time, V1_first_gift}};
unpack(21001, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(21001, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21002, srv, _B0) -> {ok, {}};
unpack(21002, cli, _B0) ->
    {V1_count, _B1} = protocol:uint16(_B0),
    {ok, {V1_count}};
unpack(21003, srv, _B0) -> {ok, {}};
unpack(21003, cli, _B0) -> {ok, {}};
unpack(21004, srv, _B0) -> {ok, {}};
unpack(21004, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21005, srv, _B0) -> {ok, {}};
unpack(21005, cli, _B0) ->
    {V1_count, _B1} = protocol:uint16(_B0),
    {V1_gold, _B2} = protocol:uint32(_B1),
    {V1_next_gold, _B3} = protocol:uint32(_B2),
    {ok, {V1_count, V1_gold, V1_next_gold}};
unpack(21006, srv, _B0) -> {ok, {}};
unpack(21006, cli, _B0) ->
    {V1_first_gift, _B5} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint8(_B1),
						  {V2_count, _B3} =
						      protocol:uint16(_B2),
						  {{V2_id, V2_count}, _B3}
					  end),
    {ok, {V1_first_gift}};
unpack(21007, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(21007, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_ref_time, _B2} = protocol:uint32(_B1),
    {V1_reg_day, _B3} = protocol:uint32(_B2),
    {V1_first_gift, _B8} = protocol:array(_B3,
					  fun (_B4) ->
						  {V2_id, _B5} =
						      protocol:uint32(_B4),
						  {V2_count, _B6} =
						      protocol:uint16(_B5),
						  {{V2_id, V2_count}, _B6}
					  end),
    {ok, {V1_type, V1_ref_time, V1_reg_day, V1_first_gift}};
unpack(21008, srv, _B0) -> {ok, {}};
unpack(21008, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {ok, {V1_status}};
unpack(21009, srv, _B0) -> {ok, {}};
unpack(21009, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21010, srv, _B0) -> {ok, {}};
unpack(21010, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_status, V1_num}};
unpack(21011, srv, _B0) -> {ok, {}};
unpack(21011, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21012, srv, _B0) -> {ok, {}};
unpack(21012, cli, _B0) ->
    {V1_choosen_status, _B1} = protocol:uint8(_B0),
    {V1_has_choosen_id, _B2} = protocol:uint8(_B1),
    {V1_first_gift, _B7} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_id, _B4} =
						      protocol:uint8(_B3),
						  {V2_status, _B5} =
						      protocol:uint8(_B4),
						  {{V2_id, V2_status}, _B5}
					  end),
    {ok,
     {V1_choosen_status, V1_has_choosen_id, V1_first_gift}};
unpack(21013, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(21013, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21014, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(21014, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21015, srv, _B0) -> {ok, {}};
unpack(21015, cli, _B0) ->
    {V1_open_id, _B4} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_id, _B2} =
						   protocol:uint16(_B1),
					       {V2_id, _B2}
				       end),
    {ok, {V1_open_id}};
unpack(21016, srv, _B0) ->
    {V1_charge_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_charge_id}};
unpack(21016, cli, _B0) ->
    {V1_charge_id, _B1} = protocol:uint32(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {ok, {V1_charge_id, V1_status}};
unpack(21020, srv, _B0) -> {ok, {}};
unpack(21020, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {ok, {V1_status}};
unpack(21021, srv, _B0) -> {ok, {}};
unpack(21021, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(21022, srv, _B0) -> {ok, {}};
unpack(21022, cli, _B0) ->
    {V1_open_id, _B4} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_id, _B2} =
						   protocol:uint16(_B1),
					       {V2_id, _B2}
				       end),
    {ok, {V1_open_id}};
unpack(21023, srv, _B0) ->
    {V1_package_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_package_id}};
unpack(21023, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21024, srv, _B0) -> {ok, {}};
unpack(21024, cli, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint16(_B1),
					    {V2_id, _B2}
				    end),
    {ok, {V1_list}};
unpack(21030, srv, _B0) -> {ok, {}};
unpack(21030, cli, _B0) ->
    {V1_end_time, _B1} = protocol:uint32(_B0),
    {V1_first_gift, _B6} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_id, _B3} =
						      protocol:uint8(_B2),
						  {V2_status, _B4} =
						      protocol:uint8(_B3),
						  {{V2_id, V2_status}, _B4}
					  end),
    {ok, {V1_end_time, V1_first_gift}};
unpack(21031, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(21031, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21032, srv, _B0) -> {ok, {}};
unpack(21032, cli, _B0) ->
    {V1_end_time, _B1} = protocol:uint32(_B0),
    {V1_first_gift, _B6} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_id, _B3} =
						      protocol:uint8(_B2),
						  {V2_status, _B4} =
						      protocol:uint8(_B3),
						  {{V2_id, V2_status}, _B4}
					  end),
    {ok, {V1_end_time, V1_first_gift}};
unpack(21033, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(21033, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


