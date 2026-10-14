-file("src/proto/proto_264.erl", 1).

-module(proto_264).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(26400, cli, {}) -> {ok, <<2:32, 26400:16>>};
pack(26400, srv,
     {V0_lev, V0_list, V0_attr, V0_max_partner_lev}) ->
    D_a_t_a = <<V0_lev:32, (length(V0_list)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || {V1_pos, V1_id} <- V0_list]))/binary,
		(length(V0_attr)):16,
		(list_to_binary([<<V1_attr_id:32, V1_attr_val:32>>
				 || {V1_attr_id, V1_attr_val}
					<- V0_attr]))/binary,
		V0_max_partner_lev:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26400:16,
       D_a_t_a/binary>>};
pack(26401, cli, {V0_pos, V0_id, V0_type}) ->
    D_a_t_a = <<V0_pos:8, V0_id:32, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26401:16,
       D_a_t_a/binary>>};
pack(26401, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26401:16,
       D_a_t_a/binary>>};
pack(26402, cli, {}) -> {ok, <<2:32, 26402:16>>};
pack(26402, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26402:16,
       D_a_t_a/binary>>};
pack(26410, cli, {}) -> {ok, <<2:32, 26410:16>>};
pack(26410, srv,
     {V0_all_num, V0_do_num, V0_get_num, V0_do_end_time,
      V0_is_point}) ->
    D_a_t_a = <<V0_all_num:32, V0_do_num:32, V0_get_num:32,
		V0_do_end_time:32, V0_is_point:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26410:16,
       D_a_t_a/binary>>};
pack(26411, cli, {V0_all_num}) ->
    D_a_t_a = <<V0_all_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26411:16,
       D_a_t_a/binary>>};
pack(26411, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26411:16,
       D_a_t_a/binary>>};
pack(26412, cli, {}) -> {ok, <<2:32, 26412:16>>};
pack(26412, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26412:16,
       D_a_t_a/binary>>};
pack(26413, cli, {}) -> {ok, <<2:32, 26413:16>>};
pack(26413, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26413:16,
       D_a_t_a/binary>>};
pack(26414, cli, {}) -> {ok, <<2:32, 26414:16>>};
pack(26414, srv, {}) -> {ok, <<2:32, 26414:16>>};
pack(26420, cli, {}) -> {ok, <<2:32, 26420:16>>};
pack(26420, srv, {V0_star, V0_num}) ->
    D_a_t_a = <<V0_star:8, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26420:16,
       D_a_t_a/binary>>};
pack(26421, cli, {V0_partner_id, V0_skills}) ->
    D_a_t_a = <<V0_partner_id:32, (length(V0_skills)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_id:32>>
				 || {V1_pos, V1_skill_id}
					<- V0_skills]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26421:16,
       D_a_t_a/binary>>};
pack(26421, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26421:16,
       D_a_t_a/binary>>};
pack(26422, cli, {}) -> {ok, <<2:32, 26422:16>>};
pack(26422, srv, {V0_skills}) ->
    D_a_t_a = <<(length(V0_skills)):16,
		(list_to_binary([<<V1_skill_id:32>>
				 || V1_skill_id <- V0_skills]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26422:16,
       D_a_t_a/binary>>};
pack(26423, cli, {V0_partner_id, V0_skills}) ->
    D_a_t_a = <<V0_partner_id:32, (length(V0_skills)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_id:32>>
				 || {V1_pos, V1_skill_id}
					<- V0_skills]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26423:16,
       D_a_t_a/binary>>};
pack(26423, srv, {V0_partner_id, V0_power}) ->
    D_a_t_a = <<V0_partner_id:32, V0_power:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26423:16,
       D_a_t_a/binary>>};
pack(26424, srv, {V0_partner_id}) ->
    D_a_t_a = <<V0_partner_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26424:16,
       D_a_t_a/binary>>};
pack(26425, cli, {}) -> {ok, <<2:32, 26425:16>>};
pack(26425, srv,
     {V0_lev, V0_con_list, V0_res_list, V0_gold_count,
      V0_item_count, V0_max_cystal_lev, V0_is_break}) ->
    D_a_t_a = <<V0_lev:32, (length(V0_con_list)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || {V1_pos, V1_id} <- V0_con_list]))/binary,
		(length(V0_res_list)):16,
		(list_to_binary([<<V1_pos:32, V1_id:32,
				   V1_cool_time:32>>
				 || {V1_pos, V1_id, V1_cool_time}
					<- V0_res_list]))/binary,
		V0_gold_count:32, V0_item_count:32,
		V0_max_cystal_lev:32, V0_is_break:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26425:16,
       D_a_t_a/binary>>};
pack(26426, cli, {V0_partner_id, V0_pos}) ->
    D_a_t_a = <<V0_partner_id:32, V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26426:16,
       D_a_t_a/binary>>};
pack(26426, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26426:16,
       D_a_t_a/binary>>};
pack(26427, cli, {V0_partner_id, V0_pos}) ->
    D_a_t_a = <<V0_partner_id:32, V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26427:16,
       D_a_t_a/binary>>};
pack(26427, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26427:16,
       D_a_t_a/binary>>};
pack(26428, cli, {V0_pos}) ->
    D_a_t_a = <<V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26428:16,
       D_a_t_a/binary>>};
pack(26428, srv, {V0_result, V0_msg, V0_pos}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26428:16,
       D_a_t_a/binary>>};
pack(26429, cli, {V0_pos, V0_type}) ->
    D_a_t_a = <<V0_pos:32, V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26429:16,
       D_a_t_a/binary>>};
pack(26429, srv, {V0_result, V0_msg, V0_pos}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26429:16,
       D_a_t_a/binary>>};
pack(26430, cli, {}) -> {ok, <<2:32, 26430:16>>};
pack(26430, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26430:16,
       D_a_t_a/binary>>};
pack(26431, cli, {}) -> {ok, <<2:32, 26431:16>>};
pack(26431, srv, {V0_result, V0_msg, V0_power}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_power:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26431:16,
       D_a_t_a/binary>>};
pack(26432, cli, {}) -> {ok, <<2:32, 26432:16>>};
pack(26432, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26432:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(26400, srv, _B0) -> {ok, {}};
unpack(26400, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_list, _B6} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_pos, _B3} = protocol:uint8(_B2),
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {{V2_pos, V2_id}, _B4}
				    end),
    {V1_attr, _B11} = protocol:array(_B6,
				     fun (_B7) ->
					     {V2_attr_id, _B8} =
						 protocol:uint32(_B7),
					     {V2_attr_val, _B9} =
						 protocol:uint32(_B8),
					     {{V2_attr_id, V2_attr_val}, _B9}
				     end),
    {V1_max_partner_lev, _B12} = protocol:uint32(_B11),
    {ok, {V1_lev, V1_list, V1_attr, V1_max_partner_lev}};
unpack(26401, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_pos, V1_id, V1_type}};
unpack(26401, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26402, srv, _B0) -> {ok, {}};
unpack(26402, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26410, srv, _B0) -> {ok, {}};
unpack(26410, cli, _B0) ->
    {V1_all_num, _B1} = protocol:uint32(_B0),
    {V1_do_num, _B2} = protocol:uint32(_B1),
    {V1_get_num, _B3} = protocol:uint32(_B2),
    {V1_do_end_time, _B4} = protocol:uint32(_B3),
    {V1_is_point, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_all_num, V1_do_num, V1_get_num, V1_do_end_time,
      V1_is_point}};
unpack(26411, srv, _B0) ->
    {V1_all_num, _B1} = protocol:uint32(_B0),
    {ok, {V1_all_num}};
unpack(26411, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26412, srv, _B0) -> {ok, {}};
unpack(26412, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26413, srv, _B0) -> {ok, {}};
unpack(26413, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26414, srv, _B0) -> {ok, {}};
unpack(26414, cli, _B0) -> {ok, {}};
unpack(26420, srv, _B0) -> {ok, {}};
unpack(26420, cli, _B0) ->
    {V1_star, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_star, V1_num}};
unpack(26421, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_skills, _B6} = protocol:array(_B1,
				      fun (_B2) ->
					      {V2_pos, _B3} =
						  protocol:uint8(_B2),
					      {V2_skill_id, _B4} =
						  protocol:uint32(_B3),
					      {{V2_pos, V2_skill_id}, _B4}
				      end),
    {ok, {V1_partner_id, V1_skills}};
unpack(26421, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26422, srv, _B0) -> {ok, {}};
unpack(26422, cli, _B0) ->
    {V1_skills, _B4} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_skill_id, _B2} =
						  protocol:uint32(_B1),
					      {V2_skill_id, _B2}
				      end),
    {ok, {V1_skills}};
unpack(26423, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_skills, _B6} = protocol:array(_B1,
				      fun (_B2) ->
					      {V2_pos, _B3} =
						  protocol:uint8(_B2),
					      {V2_skill_id, _B4} =
						  protocol:uint32(_B3),
					      {{V2_pos, V2_skill_id}, _B4}
				      end),
    {ok, {V1_partner_id, V1_skills}};
unpack(26423, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_power, _B2} = protocol:uint32(_B1),
    {ok, {V1_partner_id, V1_power}};
unpack(26424, cli, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_partner_id}};
unpack(26425, srv, _B0) -> {ok, {}};
unpack(26425, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_con_list, _B6} = protocol:array(_B1,
					fun (_B2) ->
						{V2_pos, _B3} =
						    protocol:uint8(_B2),
						{V2_id, _B4} =
						    protocol:uint32(_B3),
						{{V2_pos, V2_id}, _B4}
					end),
    {V1_res_list, _B12} = protocol:array(_B6,
					 fun (_B7) ->
						 {V2_pos, _B8} =
						     protocol:uint32(_B7),
						 {V2_id, _B9} =
						     protocol:uint32(_B8),
						 {V2_cool_time, _B10} =
						     protocol:uint32(_B9),
						 {{V2_pos, V2_id, V2_cool_time},
						  _B10}
					 end),
    {V1_gold_count, _B13} = protocol:uint32(_B12),
    {V1_item_count, _B14} = protocol:uint32(_B13),
    {V1_max_cystal_lev, _B15} = protocol:uint32(_B14),
    {V1_is_break, _B16} = protocol:uint8(_B15),
    {ok,
     {V1_lev, V1_con_list, V1_res_list, V1_gold_count,
      V1_item_count, V1_max_cystal_lev, V1_is_break}};
unpack(26426, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_pos, _B2} = protocol:uint32(_B1),
    {ok, {V1_partner_id, V1_pos}};
unpack(26426, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26427, srv, _B0) ->
    {V1_partner_id, _B1} = protocol:uint32(_B0),
    {V1_pos, _B2} = protocol:uint32(_B1),
    {ok, {V1_partner_id, V1_pos}};
unpack(26427, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26428, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0), {ok, {V1_pos}};
unpack(26428, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pos, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_pos}};
unpack(26429, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint32(_B1),
    {ok, {V1_pos, V1_type}};
unpack(26429, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pos, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_pos}};
unpack(26430, srv, _B0) -> {ok, {}};
unpack(26430, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(26431, srv, _B0) -> {ok, {}};
unpack(26431, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_power, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_power}};
unpack(26432, srv, _B0) -> {ok, {}};
unpack(26432, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


