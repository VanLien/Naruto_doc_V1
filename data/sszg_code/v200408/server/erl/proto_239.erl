-file("src/proto/proto_239.erl", 1).

-module(proto_239).

-lager_records([{endless_robot_data,
		 [id, bid, rname, group_id, unit_id, lev, star, quality,
		  power]},
		{endless_employ,
		 [id, rid, rname, bid, plev, star, quality, break_lev,
		  power, num, ext]},
		{endless_data,
		 [type, id, name, lev, unit_ids, is_reset, formation]},
		{new_endless,
		 [ver, type, max_id, ext_reward, day_begin, day_pass,
		  ext]},
		{m_endless,
		 [ver, r_id, max_id, ext_reward, day_begin, day_pass,
		  day_reward, employ, appoint, type, select_type,
		  new_endless_list, ext, flag]}]).

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

-file("src/proto/proto_239.erl", 16).

-file("inc/endless.hrl", 1).

-record(m_endless,
	{ver = 2  :: pos_integer(), r_id = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(),
	 day_reward = []  :: list(), employ = []  :: list(),
	 appoint = []  :: list(), type = 0  :: pos_integer(),
	 select_type = 0  :: pos_integer(),
	 new_endless_list = []  :: list(), ext = []  :: list(),
	 flag = 0  :: pos_integer()}).

-record(new_endless,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(), ext = []  :: list()}).

-record(endless_data,
	{type = 0, id = 0, name = <<>>, lev = 0, unit_ids = [],
	 is_reset = 0, formation = undefined}).

-record(endless_employ,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, rname = <<>>,
	 bid = 0, plev = 0, star = 0, quality = 0, break_lev = 0,
	 power = 0, num = 0, ext = []}).

-record(endless_robot_data,
	{id = 0, bid = 0, rname = <<>>, group_id = 0,
	 unit_id = 0, lev = 0, star = 0, quality = 0,
	 power = 0}).

-file("src/proto/proto_239.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(23900, cli, {}) -> {ok, <<2:32, 23900:16>>};
pack(23900, srv,
     {V0_type, V0_select_type, V0_next_type, V0_next_time,
      V0_max_round, V0_current_round, V0_day_pass_round,
      V0_my_idx, V0_rank_list, V0_new_max_round,
      V0_new_current_round, V0_new_day_pass_round,
      V0_new_my_idx, V0_new_rank_list, V0_is_employ, V0_list,
      V0_is_appoint, V0_is_reward}) ->
    D_a_t_a = <<V0_type:8, V0_select_type:8, V0_next_type:8,
		V0_next_time:32, V0_max_round:16, V0_current_round:16,
		V0_day_pass_round:16, V0_my_idx:16,
		(length(V0_rank_list)):16,
		(list_to_binary([<<V1_idx:8,
				   (protocol:pack(string, V1_name))/binary,
				   V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_val:32>>
				 || {V1_idx, V1_name, V1_rid, V1_srv_id, V1_val}
					<- V0_rank_list]))/binary,
		V0_new_max_round:16, V0_new_current_round:16,
		V0_new_day_pass_round:16, V0_new_my_idx:16,
		(length(V0_new_rank_list)):16,
		(list_to_binary([<<V1_idx:8,
				   (protocol:pack(string, V1_name))/binary,
				   V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_val:32>>
				 || {V1_idx, V1_name, V1_rid, V1_srv_id, V1_val}
					<- V0_new_rank_list]))/binary,
		V0_is_employ:8, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_bid:32, V1_lev:16,
				   V1_star:8, V1_quality:8, V1_power:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_id, V1_bid, V1_lev, V1_star, V1_quality,
				     V1_power, V1_ext_data}
					<- V0_list]))/binary,
		V0_is_appoint:8, V0_is_reward:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23900:16,
       D_a_t_a/binary>>};
pack(23901, cli,
     {V0_type, V0_formation_type, V0_pos_info,
      V0_hallows_id}) ->
    D_a_t_a = <<V0_type:8, V0_formation_type:16,
		(length(V0_pos_info)):16,
		(list_to_binary([<<V1_pos:8, V1_owner_id:32,
				   (protocol:pack(string,
						  V1_owner_srv_id))/binary,
				   V1_id:32>>
				 || {V1_pos, V1_owner_id, V1_owner_srv_id,
				     V1_id}
					<- V0_pos_info]))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23901:16,
       D_a_t_a/binary>>};
pack(23901, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23901:16,
       D_a_t_a/binary>>};
pack(23902, cli, {}) -> {ok, <<2:32, 23902:16>>};
pack(23902, srv,
     {V0_round, V0_max_round, V0_buff_list, V0_rest_round,
      V0_max_reward_round, V0_reward_flag, V0_acc_reward,
      V0_id, V0_status, V0_type}) ->
    D_a_t_a = <<V0_round:16, V0_max_round:16,
		(length(V0_buff_list)):16,
		(list_to_binary([<<V1_id:32, V1_group_id:16,
				   V1_count:16>>
				 || {V1_id, V1_group_id, V1_count}
					<- V0_buff_list]))/binary,
		V0_rest_round:16, V0_max_reward_round:16,
		V0_reward_flag:8, (length(V0_acc_reward)):16,
		(list_to_binary([<<V1_base_id:32, V1_num:32>>
				 || {V1_base_id, V1_num}
					<- V0_acc_reward]))/binary,
		V0_id:32, V0_status:8, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23902:16,
       D_a_t_a/binary>>};
pack(23903, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23903:16,
       D_a_t_a/binary>>};
pack(23903, srv,
     {V0_id, V0_status, V0_max_id, V0_rewarded, V0_type}) ->
    D_a_t_a = <<V0_id:32, V0_status:8, V0_max_id:32,
		(length(V0_rewarded)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_rewarded]))/binary,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23903:16,
       D_a_t_a/binary>>};
pack(23904, cli, {V0_id, V0_type}) ->
    D_a_t_a = <<V0_id:32, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23904:16,
       D_a_t_a/binary>>};
pack(23904, srv, {V0_code, V0_msg, V0_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23904:16,
       D_a_t_a/binary>>};
pack(23905, cli, {}) -> {ok, <<2:32, 23905:16>>};
pack(23905, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_bid:32, V1_lev:16,
				   V1_star:8, V1_quality:8, V1_power:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_id, V1_bid, V1_lev, V1_star, V1_quality,
				     V1_power, V1_ext_data}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23905:16,
       D_a_t_a/binary>>};
pack(23906, cli, {}) -> {ok, <<2:32, 23906:16>>};
pack(23906, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_id:32, V1_bid:32, V1_lev:16, V1_star:8,
				   V1_quality:8, V1_power:32,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_rid, V1_srv_id, V1_name, V1_id, V1_bid,
				     V1_lev, V1_star, V1_quality, V1_power,
				     V1_ext_data}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23906:16,
       D_a_t_a/binary>>};
pack(23907, cli, {}) -> {ok, <<2:32, 23907:16>>};
pack(23907, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_id:32, V1_bid:32, V1_lev:16, V1_star:8,
				   V1_quality:8, V1_power:32, V1_is_return:8,
				   (length(V1_ext_data)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext_data]))/binary>>
				 || {V1_rid, V1_srv_id, V1_name, V1_id, V1_bid,
				     V1_lev, V1_star, V1_quality, V1_power,
				     V1_is_return, V1_ext_data}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23907:16,
       D_a_t_a/binary>>};
pack(23908, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23908:16,
       D_a_t_a/binary>>};
pack(23908, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23908:16,
       D_a_t_a/binary>>};
pack(23909, cli, {V0_rid, V0_srv_id, V0_id, V0_flag}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_id:32,
		V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23909:16,
       D_a_t_a/binary>>};
pack(23909, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23909:16,
       D_a_t_a/binary>>};
pack(23910, cli, {}) -> {ok, <<2:32, 23910:16>>};
pack(23910, srv,
     {V0_is_select, V0_list, V0_partner, V0_formation_type,
      V0_formation_lev, V0_round}) ->
    D_a_t_a = <<V0_is_select:8, (length(V0_list)):16,
		(list_to_binary([<<V1_group_id:8, V1_buff_id:16>>
				 || {V1_group_id, V1_buff_id}
					<- V0_list]))/binary,
		(length(V0_partner)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_pos:8, V1_id:32, V1_bid:32, V1_lev:16,
				   V1_star:8, V1_quality:8, V1_hp_per:8,
				   V1_use_skin:32, V1_resonate_lev:32>>
				 || {V1_rid, V1_srv_id, V1_pos, V1_id, V1_bid,
				     V1_lev, V1_star, V1_quality, V1_hp_per,
				     V1_use_skin, V1_resonate_lev}
					<- V0_partner]))/binary,
		V0_formation_type:8, V0_formation_lev:8, V0_round:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23910:16,
       D_a_t_a/binary>>};
pack(23911, cli, {V0_buff_id}) ->
    D_a_t_a = <<V0_buff_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23911:16,
       D_a_t_a/binary>>};
pack(23911, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23911:16,
       D_a_t_a/binary>>};
pack(23912, cli, {}) -> {ok, <<2:32, 23912:16>>};
pack(23912, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23912:16,
       D_a_t_a/binary>>};
pack(23913, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23913:16,
       D_a_t_a/binary>>};
pack(23913, srv, {V0_my_idx, V0_rank_list}) ->
    D_a_t_a = <<V0_my_idx:16, (length(V0_rank_list)):16,
		(list_to_binary([<<V1_idx:8,
				   (protocol:pack(string, V1_name))/binary,
				   V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_val:32>>
				 || {V1_idx, V1_name, V1_rid, V1_srv_id, V1_val}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23913:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(23900, srv, _B0) -> {ok, {}};
unpack(23900, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_select_type, _B2} = protocol:uint8(_B1),
    {V1_next_type, _B3} = protocol:uint8(_B2),
    {V1_next_time, _B4} = protocol:uint32(_B3),
    {V1_max_round, _B5} = protocol:uint16(_B4),
    {V1_current_round, _B6} = protocol:uint16(_B5),
    {V1_day_pass_round, _B7} = protocol:uint16(_B6),
    {V1_my_idx, _B8} = protocol:uint16(_B7),
    {V1_rank_list, _B16} = protocol:array(_B8,
					  fun (_B9) ->
						  {V2_idx, _B10} =
						      protocol:uint8(_B9),
						  {V2_name, _B11} =
						      protocol:string(_B10),
						  {V2_rid, _B12} =
						      protocol:uint32(_B11),
						  {V2_srv_id, _B13} =
						      protocol:string(_B12),
						  {V2_val, _B14} =
						      protocol:uint32(_B13),
						  {{V2_idx, V2_name, V2_rid,
						    V2_srv_id, V2_val},
						   _B14}
					  end),
    {V1_new_max_round, _B17} = protocol:uint16(_B16),
    {V1_new_current_round, _B18} = protocol:uint16(_B17),
    {V1_new_day_pass_round, _B19} = protocol:uint16(_B18),
    {V1_new_my_idx, _B20} = protocol:uint16(_B19),
    {V1_new_rank_list, _B28} = protocol:array(_B20,
					      fun (_B21) ->
						      {V2_idx, _B22} =
							  protocol:uint8(_B21),
						      {V2_name, _B23} =
							  protocol:string(_B22),
						      {V2_rid, _B24} =
							  protocol:uint32(_B23),
						      {V2_srv_id, _B25} =
							  protocol:string(_B24),
						      {V2_val, _B26} =
							  protocol:uint32(_B25),
						      {{V2_idx, V2_name, V2_rid,
							V2_srv_id, V2_val},
						       _B26}
					      end),
    {V1_is_employ, _B29} = protocol:uint8(_B28),
    {V1_list, _B43} = protocol:array(_B29,
				     fun (_B30) ->
					     {V2_id, _B31} =
						 protocol:uint32(_B30),
					     {V2_bid, _B32} =
						 protocol:uint32(_B31),
					     {V2_lev, _B33} =
						 protocol:uint16(_B32),
					     {V2_star, _B34} =
						 protocol:uint8(_B33),
					     {V2_quality, _B35} =
						 protocol:uint8(_B34),
					     {V2_power, _B36} =
						 protocol:uint32(_B35),
					     {V2_ext_data, _B41} =
						 protocol:array(_B36,
								fun (_B37) ->
									{V3_key,
									 _B38} =
									    protocol:uint32(_B37),
									{V3_val,
									 _B39} =
									    protocol:uint32(_B38),
									{{V3_key,
									  V3_val},
									 _B39}
								end),
					     {{V2_id, V2_bid, V2_lev, V2_star,
					       V2_quality, V2_power,
					       V2_ext_data},
					      _B41}
				     end),
    {V1_is_appoint, _B44} = protocol:uint8(_B43),
    {V1_is_reward, _B45} = protocol:uint8(_B44),
    {ok,
     {V1_type, V1_select_type, V1_next_type, V1_next_time,
      V1_max_round, V1_current_round, V1_day_pass_round,
      V1_my_idx, V1_rank_list, V1_new_max_round,
      V1_new_current_round, V1_new_day_pass_round,
      V1_new_my_idx, V1_new_rank_list, V1_is_employ, V1_list,
      V1_is_appoint, V1_is_reward}};
unpack(23901, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_formation_type, _B2} = protocol:uint16(_B1),
    {V1_pos_info, _B9} = protocol:array(_B2,
					fun (_B3) ->
						{V2_pos, _B4} =
						    protocol:uint8(_B3),
						{V2_owner_id, _B5} =
						    protocol:uint32(_B4),
						{V2_owner_srv_id, _B6} =
						    protocol:string(_B5),
						{V2_id, _B7} =
						    protocol:uint32(_B6),
						{{V2_pos, V2_owner_id,
						  V2_owner_srv_id, V2_id},
						 _B7}
					end),
    {V1_hallows_id, _B10} = protocol:uint32(_B9),
    {ok,
     {V1_type, V1_formation_type, V1_pos_info,
      V1_hallows_id}};
unpack(23901, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(23902, srv, _B0) -> {ok, {}};
unpack(23902, cli, _B0) ->
    {V1_round, _B1} = protocol:uint16(_B0),
    {V1_max_round, _B2} = protocol:uint16(_B1),
    {V1_buff_list, _B8} = protocol:array(_B2,
					 fun (_B3) ->
						 {V2_id, _B4} =
						     protocol:uint32(_B3),
						 {V2_group_id, _B5} =
						     protocol:uint16(_B4),
						 {V2_count, _B6} =
						     protocol:uint16(_B5),
						 {{V2_id, V2_group_id,
						   V2_count},
						  _B6}
					 end),
    {V1_rest_round, _B9} = protocol:uint16(_B8),
    {V1_max_reward_round, _B10} = protocol:uint16(_B9),
    {V1_reward_flag, _B11} = protocol:uint8(_B10),
    {V1_acc_reward, _B16} = protocol:array(_B11,
					   fun (_B12) ->
						   {V2_base_id, _B13} =
						       protocol:uint32(_B12),
						   {V2_num, _B14} =
						       protocol:uint32(_B13),
						   {{V2_base_id, V2_num}, _B14}
					   end),
    {V1_id, _B17} = protocol:uint32(_B16),
    {V1_status, _B18} = protocol:uint8(_B17),
    {V1_type, _B19} = protocol:uint8(_B18),
    {ok,
     {V1_round, V1_max_round, V1_buff_list, V1_rest_round,
      V1_max_reward_round, V1_reward_flag, V1_acc_reward,
      V1_id, V1_status, V1_type}};
unpack(23903, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(23903, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {V1_max_id, _B3} = protocol:uint32(_B2),
    {V1_rewarded, _B7} = protocol:array(_B3,
					fun (_B4) ->
						{V2_id, _B5} =
						    protocol:uint16(_B4),
						{V2_id, _B5}
					end),
    {V1_type, _B8} = protocol:uint8(_B7),
    {ok,
     {V1_id, V1_status, V1_max_id, V1_rewarded, V1_type}};
unpack(23904, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_type}};
unpack(23904, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_type}};
unpack(23905, srv, _B0) -> {ok, {}};
unpack(23905, cli, _B0) ->
    {V1_list, _B14} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_bid, _B3} =
						 protocol:uint32(_B2),
					     {V2_lev, _B4} =
						 protocol:uint16(_B3),
					     {V2_star, _B5} =
						 protocol:uint8(_B4),
					     {V2_quality, _B6} =
						 protocol:uint8(_B5),
					     {V2_power, _B7} =
						 protocol:uint32(_B6),
					     {V2_ext_data, _B12} =
						 protocol:array(_B7,
								fun (_B8) ->
									{V3_key,
									 _B9} =
									    protocol:uint32(_B8),
									{V3_val,
									 _B10} =
									    protocol:uint32(_B9),
									{{V3_key,
									  V3_val},
									 _B10}
								end),
					     {{V2_id, V2_bid, V2_lev, V2_star,
					       V2_quality, V2_power,
					       V2_ext_data},
					      _B12}
				     end),
    {ok, {V1_list}};
unpack(23906, srv, _B0) -> {ok, {}};
unpack(23906, cli, _B0) ->
    {V1_list, _B17} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_rid, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_name, _B4} =
						 protocol:string(_B3),
					     {V2_id, _B5} =
						 protocol:uint32(_B4),
					     {V2_bid, _B6} =
						 protocol:uint32(_B5),
					     {V2_lev, _B7} =
						 protocol:uint16(_B6),
					     {V2_star, _B8} =
						 protocol:uint8(_B7),
					     {V2_quality, _B9} =
						 protocol:uint8(_B8),
					     {V2_power, _B10} =
						 protocol:uint32(_B9),
					     {V2_ext_data, _B15} =
						 protocol:array(_B10,
								fun (_B11) ->
									{V3_key,
									 _B12} =
									    protocol:uint32(_B11),
									{V3_val,
									 _B13} =
									    protocol:uint32(_B12),
									{{V3_key,
									  V3_val},
									 _B13}
								end),
					     {{V2_rid, V2_srv_id, V2_name,
					       V2_id, V2_bid, V2_lev, V2_star,
					       V2_quality, V2_power,
					       V2_ext_data},
					      _B15}
				     end),
    {ok, {V1_list}};
unpack(23907, srv, _B0) -> {ok, {}};
unpack(23907, cli, _B0) ->
    {V1_list, _B18} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_rid, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_name, _B4} =
						 protocol:string(_B3),
					     {V2_id, _B5} =
						 protocol:uint32(_B4),
					     {V2_bid, _B6} =
						 protocol:uint32(_B5),
					     {V2_lev, _B7} =
						 protocol:uint16(_B6),
					     {V2_star, _B8} =
						 protocol:uint8(_B7),
					     {V2_quality, _B9} =
						 protocol:uint8(_B8),
					     {V2_power, _B10} =
						 protocol:uint32(_B9),
					     {V2_is_return, _B11} =
						 protocol:uint8(_B10),
					     {V2_ext_data, _B16} =
						 protocol:array(_B11,
								fun (_B12) ->
									{V3_key,
									 _B13} =
									    protocol:uint32(_B12),
									{V3_val,
									 _B14} =
									    protocol:uint32(_B13),
									{{V3_key,
									  V3_val},
									 _B14}
								end),
					     {{V2_rid, V2_srv_id, V2_name,
					       V2_id, V2_bid, V2_lev, V2_star,
					       V2_quality, V2_power,
					       V2_is_return, V2_ext_data},
					      _B16}
				     end),
    {ok, {V1_list}};
unpack(23908, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(23908, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(23909, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_srv_id, V1_id, V1_flag}};
unpack(23909, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(23910, srv, _B0) -> {ok, {}};
unpack(23910, cli, _B0) ->
    {V1_is_select, _B1} = protocol:uint8(_B0),
    {V1_list, _B6} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_group_id, _B3} =
						protocol:uint8(_B2),
					    {V2_buff_id, _B4} =
						protocol:uint16(_B3),
					    {{V2_group_id, V2_buff_id}, _B4}
				    end),
    {V1_partner, _B20} = protocol:array(_B6,
					fun (_B7) ->
						{V2_rid, _B8} =
						    protocol:uint32(_B7),
						{V2_srv_id, _B9} =
						    protocol:string(_B8),
						{V2_pos, _B10} =
						    protocol:uint8(_B9),
						{V2_id, _B11} =
						    protocol:uint32(_B10),
						{V2_bid, _B12} =
						    protocol:uint32(_B11),
						{V2_lev, _B13} =
						    protocol:uint16(_B12),
						{V2_star, _B14} =
						    protocol:uint8(_B13),
						{V2_quality, _B15} =
						    protocol:uint8(_B14),
						{V2_hp_per, _B16} =
						    protocol:uint8(_B15),
						{V2_use_skin, _B17} =
						    protocol:uint32(_B16),
						{V2_resonate_lev, _B18} =
						    protocol:uint32(_B17),
						{{V2_rid, V2_srv_id, V2_pos,
						  V2_id, V2_bid, V2_lev,
						  V2_star, V2_quality,
						  V2_hp_per, V2_use_skin,
						  V2_resonate_lev},
						 _B18}
					end),
    {V1_formation_type, _B21} = protocol:uint8(_B20),
    {V1_formation_lev, _B22} = protocol:uint8(_B21),
    {V1_round, _B23} = protocol:uint16(_B22),
    {ok,
     {V1_is_select, V1_list, V1_partner, V1_formation_type,
      V1_formation_lev, V1_round}};
unpack(23911, srv, _B0) ->
    {V1_buff_id, _B1} = protocol:uint16(_B0),
    {ok, {V1_buff_id}};
unpack(23911, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(23912, srv, _B0) -> {ok, {}};
unpack(23912, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(23913, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(23913, cli, _B0) ->
    {V1_my_idx, _B1} = protocol:uint16(_B0),
    {V1_rank_list, _B9} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_idx, _B3} =
						     protocol:uint8(_B2),
						 {V2_name, _B4} =
						     protocol:string(_B3),
						 {V2_rid, _B5} =
						     protocol:uint32(_B4),
						 {V2_srv_id, _B6} =
						     protocol:string(_B5),
						 {V2_val, _B7} =
						     protocol:uint32(_B6),
						 {{V2_idx, V2_name, V2_rid,
						   V2_srv_id, V2_val},
						  _B7}
					 end),
    {ok, {V1_my_idx, V1_rank_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


