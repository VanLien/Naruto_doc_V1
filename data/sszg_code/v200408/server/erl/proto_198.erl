-file("src/proto/proto_198.erl", 1).

-module(proto_198).

-lager_records([{invite_code_bind,
		 [role_id, bind_id, account, name, sex, lev, vip, power,
		  face, avatar_bid, online, login_time, code, time,
		  reg_idfa, reg_ip, is_return, return_charge,
		  return_power, face_update_time, face_file]},
		{invite_code_role,
		 [role_id, code, time, num, list, return_num,
		  return_list]},
		{m_invite_code,
		 [ver, bind_code, bind_roleid, reward_list]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/invite_code.hrl", 1).

-record(m_invite_code,
	{ver = 1, bind_code = 0, bind_roleid = {0, <<>>},
	 reward_list = []}).

-record(invite_code_role,
	{role_id = {0, <<>>}, code = 0, time = 0, num = 0,
	 list = [], return_num = 0, return_list = []}).

-record(invite_code_bind,
	{role_id = {0, <<>>}, bind_id = {0, <<>>},
	 account = <<>>, name = <<>>, sex = 0, lev = 0, vip = 0,
	 power = 0, face = 0, avatar_bid = 0, online = 1,
	 login_time = 0, code = 0, time = 0, reg_idfa = <<>>,
	 reg_ip = <<>>, is_return = 0, return_charge = 0,
	 return_power = 0, face_update_time = 0,
	 face_file = <<>>}).

-file("src/proto/proto_198.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(19800, cli, {}) -> {ok, <<2:32, 19800:16>>};
pack(19800, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19800:16,
       D_a_t_a/binary>>};
pack(19801, cli, {V0_code}) ->
    D_a_t_a = <<V0_code:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19801:16,
       D_a_t_a/binary>>};
pack(19801, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19801:16,
       D_a_t_a/binary>>};
pack(19802, cli, {}) -> {ok, <<2:32, 19802:16>>};
pack(19802, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_vip:8, V1_sex:8, V1_online:8,
				   V1_power:32, V1_face_id:32, V1_avatar_bid:32,
				   V1_is_return:8, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #invite_code_bind{role_id =
							  {V1_rid, V1_srv_id},
						      name = V1_name,
						      lev = V1_lev,
						      vip = V1_vip,
						      sex = V1_sex,
						      online = V1_online,
						      power = V1_power,
						      face = V1_face_id,
						      avatar_bid =
							  V1_avatar_bid,
						      is_return = V1_is_return,
						      face_update_time =
							  V1_face_update_time,
						      face_file = V1_face_file}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19802:16,
       D_a_t_a/binary>>};
pack(19803, srv,
     {#invite_code_bind{role_id = {V0_rid, V0_srv_id},
			name = V0_name, lev = V0_lev, vip = V0_vip,
			sex = V0_sex, online = V0_online, power = V0_power,
			face = V0_face_id, avatar_bid = V0_avatar_bid,
			is_return = V0_is_return,
			face_update_time = V0_face_update_time,
			face_file = V0_face_file}}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:8,
		V0_vip:8, V0_sex:8, V0_online:8, V0_power:32,
		V0_face_id:32, V0_avatar_bid:32, V0_is_return:8,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19803:16,
       D_a_t_a/binary>>};
pack(19804, cli, {}) -> {ok, <<2:32, 19804:16>>};
pack(19804, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:8, V1_num:8, V1_had:8>>
				 || {V1_id, V1_num, V1_had}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19804:16,
       D_a_t_a/binary>>};
pack(19805, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19805:16,
       D_a_t_a/binary>>};
pack(19805, srv,
     {V0_code, V0_msg, V0_id, V0_num, V0_had}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8,
		V0_num:8, V0_had:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19805:16,
       D_a_t_a/binary>>};
pack(19806, cli, {}) -> {ok, <<2:32, 19806:16>>};
pack(19806, srv, {V0_status}) ->
    D_a_t_a = <<V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19806:16,
       D_a_t_a/binary>>};
pack(19807, cli, {}) -> {ok, <<2:32, 19807:16>>};
pack(19807, srv,
     {V0_code, V0_rid, V0_srv_id, V0_name, V0_lev, V0_vip,
      V0_online, V0_power, V0_face_id, V0_avatar_bid,
      V0_face_update_time, V0_face_file}) ->
    D_a_t_a = <<V0_code:32, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:8,
		V0_vip:8, V0_online:8, V0_power:32, V0_face_id:32,
		V0_avatar_bid:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19807:16,
       D_a_t_a/binary>>};
pack(19810, cli, {V0_code}) ->
    D_a_t_a = <<V0_code:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19810:16,
       D_a_t_a/binary>>};
pack(19810, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19810:16,
       D_a_t_a/binary>>};
pack(19811, cli, {}) -> {ok, <<2:32, 19811:16>>};
pack(19811, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:8, V1_num:8, V1_had:8>>
				 || {V1_id, V1_num, V1_had}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19811:16,
       D_a_t_a/binary>>};
pack(19812, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19812:16,
       D_a_t_a/binary>>};
pack(19812, srv,
     {V0_code, V0_msg, V0_id, V0_num, V0_had}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8,
		V0_num:8, V0_had:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19812:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(19800, srv, _B0) -> {ok, {}};
unpack(19800, cli, _B0) ->
    {V1_code, _B1} = protocol:uint32(_B0), {ok, {V1_code}};
unpack(19801, srv, _B0) ->
    {V1_code, _B1} = protocol:uint32(_B0), {ok, {V1_code}};
unpack(19801, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(19802, srv, _B0) -> {ok, {}};
unpack(19802, cli, _B0) ->
    {V1_list, _B16} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_rid, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_name, _B4} =
						 protocol:string(_B3),
					     {V2_lev, _B5} =
						 protocol:uint8(_B4),
					     {V2_vip, _B6} =
						 protocol:uint8(_B5),
					     {V2_sex, _B7} =
						 protocol:uint8(_B6),
					     {V2_online, _B8} =
						 protocol:uint8(_B7),
					     {V2_power, _B9} =
						 protocol:uint32(_B8),
					     {V2_face_id, _B10} =
						 protocol:uint32(_B9),
					     {V2_avatar_bid, _B11} =
						 protocol:uint32(_B10),
					     {V2_is_return, _B12} =
						 protocol:uint8(_B11),
					     {V2_face_update_time, _B13} =
						 protocol:uint32(_B12),
					     {V2_face_file, _B14} =
						 protocol:string(_B13),
					     {{V2_rid, V2_srv_id, V2_name,
					       V2_lev, V2_vip, V2_sex,
					       V2_online, V2_power, V2_face_id,
					       V2_avatar_bid, V2_is_return,
					       V2_face_update_time,
					       V2_face_file},
					      _B14}
				     end),
    {ok, {V1_list}};
unpack(19803, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_lev, _B4} = protocol:uint8(_B3),
    {V1_vip, _B5} = protocol:uint8(_B4),
    {V1_sex, _B6} = protocol:uint8(_B5),
    {V1_online, _B7} = protocol:uint8(_B6),
    {V1_power, _B8} = protocol:uint32(_B7),
    {V1_face_id, _B9} = protocol:uint32(_B8),
    {V1_avatar_bid, _B10} = protocol:uint32(_B9),
    {V1_is_return, _B11} = protocol:uint8(_B10),
    {V1_face_update_time, _B12} = protocol:uint32(_B11),
    {V1_face_file, _B13} = protocol:string(_B12),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_lev, V1_vip, V1_sex,
      V1_online, V1_power, V1_face_id, V1_avatar_bid,
      V1_is_return, V1_face_update_time, V1_face_file}};
unpack(19804, srv, _B0) -> {ok, {}};
unpack(19804, cli, _B0) ->
    {V1_list, _B6} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint8(_B1),
					    {V2_num, _B3} = protocol:uint8(_B2),
					    {V2_had, _B4} = protocol:uint8(_B3),
					    {{V2_id, V2_num, V2_had}, _B4}
				    end),
    {ok, {V1_list}};
unpack(19805, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(19805, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {V1_had, _B5} = protocol:uint8(_B4),
    {ok, {V1_code, V1_msg, V1_id, V1_num, V1_had}};
unpack(19806, srv, _B0) -> {ok, {}};
unpack(19806, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {ok, {V1_status}};
unpack(19807, srv, _B0) -> {ok, {}};
unpack(19807, cli, _B0) ->
    {V1_code, _B1} = protocol:uint32(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_vip, _B6} = protocol:uint8(_B5),
    {V1_online, _B7} = protocol:uint8(_B6),
    {V1_power, _B8} = protocol:uint32(_B7),
    {V1_face_id, _B9} = protocol:uint32(_B8),
    {V1_avatar_bid, _B10} = protocol:uint32(_B9),
    {V1_face_update_time, _B11} = protocol:uint32(_B10),
    {V1_face_file, _B12} = protocol:string(_B11),
    {ok,
     {V1_code, V1_rid, V1_srv_id, V1_name, V1_lev, V1_vip,
      V1_online, V1_power, V1_face_id, V1_avatar_bid,
      V1_face_update_time, V1_face_file}};
unpack(19810, srv, _B0) ->
    {V1_code, _B1} = protocol:uint32(_B0), {ok, {V1_code}};
unpack(19810, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(19811, srv, _B0) -> {ok, {}};
unpack(19811, cli, _B0) ->
    {V1_list, _B6} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint8(_B1),
					    {V2_num, _B3} = protocol:uint8(_B2),
					    {V2_had, _B4} = protocol:uint8(_B3),
					    {{V2_id, V2_num, V2_had}, _B4}
				    end),
    {ok, {V1_list}};
unpack(19812, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(19812, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {V1_had, _B5} = protocol:uint8(_B4),
    {ok, {V1_code, V1_msg, V1_id, V1_num, V1_had}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


