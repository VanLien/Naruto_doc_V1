-file("src/proto/proto_127.erl", 1).

-module(proto_127).

-lager_records([{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg,
		  remark]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/proto/proto_127.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(12700, cli, {}) -> {ok, <<2:32, 12700:16>>};
pack(12700, srv, {V0_say_frame_bid, V0_say_frame}) ->
    D_a_t_a = <<V0_say_frame_bid:32,
		(length(V0_say_frame)):16,
		(list_to_binary([<<V1_base_id:32, V1_expire_time:32>>
				 || #say_frame{base_id = V1_base_id,
					       expire_time = V1_expire_time}
					<- V0_say_frame]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12700:16,
       D_a_t_a/binary>>};
pack(12701, cli, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12701:16,
       D_a_t_a/binary>>};
pack(12701, srv, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12701:16,
       D_a_t_a/binary>>};
pack(12702, cli, {}) -> {ok, <<2:32, 12702:16>>};
pack(12702, srv, {V0_say_frame}) ->
    D_a_t_a = <<(length(V0_say_frame)):16,
		(list_to_binary([<<V1_base_id:32, V1_expire_time:32>>
				 || #say_frame{base_id = V1_base_id,
					       expire_time = V1_expire_time}
					<- V0_say_frame]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12702:16,
       D_a_t_a/binary>>};
pack(12703, cli, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12703:16,
       D_a_t_a/binary>>};
pack(12703, srv, {V0_say_frame}) ->
    D_a_t_a = <<(length(V0_say_frame)):16,
		(list_to_binary([<<V1_base_id:32, V1_expire_time:32>>
				 || #say_frame{base_id = V1_base_id,
					       expire_time = V1_expire_time}
					<- V0_say_frame]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12703:16,
       D_a_t_a/binary>>};
pack(12704, cli, {}) -> {ok, <<2:32, 12704:16>>};
pack(12704, srv, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12704:16,
       D_a_t_a/binary>>};
pack(12720, cli,
     {V0_to_rid, V0_to_srv_id, V0_len, V0_msg}) ->
    D_a_t_a = <<V0_to_rid:32,
		(protocol:pack(string, V0_to_srv_id))/binary, V0_len:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12720:16,
       D_a_t_a/binary>>};
pack(12720, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12720:16,
       D_a_t_a/binary>>};
pack(12721, srv,
     {V0_flag, V0_rid, V0_srv_id, V0_name, V0_lev, V0_career,
      V0_face_id, V0_len, V0_msg, V0_sex, V0_vip_lev,
      V0_capacity, V0_head_bid, V0_bubble_bid, V0_tick,
      V0_face_update_time, V0_face_file}) ->
    D_a_t_a = <<V0_flag:8, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:8,
		V0_career:16, V0_face_id:32, V0_len:8,
		(protocol:pack(string, V0_msg))/binary, V0_sex:8,
		V0_vip_lev:8, V0_capacity:8, V0_head_bid:32,
		V0_bubble_bid:32, V0_tick:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12721:16,
       D_a_t_a/binary>>};
pack(12722, srv, {V0_offline_list}) ->
    D_a_t_a = <<(length(V0_offline_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_career:16, V1_face_id:32,
				   V1_sex:8, V1_vip_lev:8, V1_capacity:8,
				   V1_head_bid:32, V1_chat_bubble:32,
				   (length(V1_msg_list)):16,
				   (list_to_binary([<<V2_len:8,
						      (protocol:pack(string,
								     V2_msg))/binary,
						      V2_tick:32>>
						    || #say_msg{len = V2_len,
								msg = V2_msg,
								tick = V2_tick}
							   <- V1_msg_list]))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #say_send{id = {V1_rid, V1_srv_id},
					      name = V1_name, lev = V1_lev,
					      career = V1_career,
					      face_id = V1_face_id,
					      sex = V1_sex,
					      vip_lev = V1_vip_lev,
					      capacity = V1_capacity,
					      head_bid = V1_head_bid,
					      chat_bubble = V1_chat_bubble,
					      msg_list = V1_msg_list,
					      face_update_time =
						  V1_face_update_time,
					      face_file = V1_face_file}
					<- V0_offline_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12722:16,
       D_a_t_a/binary>>};
pack(12723, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12723:16,
       D_a_t_a/binary>>};
pack(12723, srv, {}) -> {ok, <<2:32, 12723:16>>};
pack(12725, cli,
     {V0_voice, V0_voice_len, V0_time, V0_type}) ->
    D_a_t_a = <<(protocol:pack(byte, V0_voice))/binary,
		V0_voice_len:16, V0_time:8, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12725:16,
       D_a_t_a/binary>>};
pack(12725, srv,
     {V0_flag, V0_srv_id, V0_voice_id, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_voice_id:32,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12725:16,
       D_a_t_a/binary>>};
pack(12726, cli, {V0_srv_id, V0_voice_id}) ->
    D_a_t_a = <<(protocol:pack(string, V0_srv_id))/binary,
		V0_voice_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12726:16,
       D_a_t_a/binary>>};
pack(12726, srv,
     {V0_srv_id, V0_voice_id, V0_time, V0_voice, V0_type}) ->
    D_a_t_a = <<(protocol:pack(string, V0_srv_id))/binary,
		V0_voice_id:32, V0_time:8,
		(protocol:pack(byte, V0_voice))/binary, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12726:16,
       D_a_t_a/binary>>};
pack(12729, cli, {}) -> {ok, <<2:32, 12729:16>>};
pack(12729, srv, {}) -> {ok, <<2:32, 12729:16>>};
pack(12730, cli, {V0_type, V0_is_push}) ->
    D_a_t_a = <<V0_type:32, V0_is_push:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12730:16,
       D_a_t_a/binary>>};
pack(12730, srv, {}) -> {ok, <<2:32, 12730:16>>};
pack(12731, cli, {}) -> {ok, <<2:32, 12731:16>>};
pack(12731, srv, {}) -> {ok, <<2:32, 12731:16>>};
pack(12732, cli, {V0_type, V0_msg}) ->
    D_a_t_a = <<V0_type:32,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12732:16,
       D_a_t_a/binary>>};
pack(12732, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12732:16,
       D_a_t_a/binary>>};
pack(12733, srv, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:32, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_msg))/binary,
				   V1_time:32>>
				 || #say_subtitle_msg{id = V1_id,
						      role_id =
							  {V1_rid, V1_srv_id},
						      name = V1_name,
						      msg = V1_msg,
						      time = V1_time}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12733:16,
       D_a_t_a/binary>>};
pack(12741, srv, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12741:16,
       D_a_t_a/binary>>};
pack(12742, srv, {V0_asset_list, V0_source}) ->
    D_a_t_a = <<(length(V0_asset_list)):16,
		(list_to_binary([<<V1_bid:32, V1_is_bind:8, V1_num:32,
				   V1_id:32, V1_move_to:8>>
				 || {V1_bid, V1_is_bind, V1_num, V1_id,
				     V1_move_to}
					<- V0_asset_list]))/binary,
		V0_source:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12742:16,
       D_a_t_a/binary>>};
pack(12743, srv, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12743:16,
       D_a_t_a/binary>>};
pack(12744, srv, {V0_type, V0_msg}) ->
    D_a_t_a = <<V0_type:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12744:16,
       D_a_t_a/binary>>};
pack(12745, srv, {V0_bid, V0_need_num, V0_num}) ->
    D_a_t_a = <<V0_bid:32, V0_need_num:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12745:16,
       D_a_t_a/binary>>};
pack(12761, srv,
     {V0_role_list, V0_channel, V0_len, V0_msg, V0_tick}) ->
    D_a_t_a = <<(length(V0_role_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_lev:8, V1_sex:8,
				   V1_career:16, V1_vip_lev:8, V1_is_show_vip:8,
				   (protocol:pack(string, V1_province))/binary,
				   (protocol:pack(string, V1_city))/binary,
				   V1_capacity:8, V1_head_bid:32,
				   V1_bubble_bid:32, (length(V1_ext_list)):16,
				   (list_to_binary([<<V2_type:8, V2_val:32>>
						    || {V2_type, V2_val}
							   <- V1_ext_list]))/binary,
				   V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   (protocol:pack(string, V1_g_name))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {V1_rid, V1_srv_id, V1_name, V1_face_id,
				     V1_lev, V1_sex, V1_career, V1_vip_lev,
				     V1_is_show_vip, V1_province, V1_city,
				     V1_capacity, V1_head_bid, V1_bubble_bid,
				     V1_ext_list, {V1_gid, V1_gsrv_id},
				     V1_g_name, V1_face_update_time,
				     V1_face_file}
					<- V0_role_list]))/binary,
		V0_channel:16, V0_len:8,
		(protocol:pack(string, V0_msg))/binary, V0_tick:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12761:16,
       D_a_t_a/binary>>};
pack(12762, cli,
     {V0_channel, V0_len, V0_msg, V0_sign}) ->
    D_a_t_a = <<V0_channel:16, V0_len:8,
		(protocol:pack(string, V0_msg))/binary,
		(protocol:pack(string, V0_sign))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12762:16,
       D_a_t_a/binary>>};
pack(12762, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12762:16,
       D_a_t_a/binary>>};
pack(12763, srv, {V0_channel, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_channel:16,
		(protocol:pack(string, V0_id))/binary,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12763:16,
       D_a_t_a/binary>>};
pack(12764, cli, {V0_channel, V0_id, V0_msg}) ->
    D_a_t_a = <<V0_channel:16,
		(protocol:pack(string, V0_id))/binary,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12764:16,
       D_a_t_a/binary>>};
pack(12764, srv, {}) -> {ok, <<2:32, 12764:16>>};
pack(12766, cli, {V0_channel}) ->
    D_a_t_a = <<V0_channel:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12766:16,
       D_a_t_a/binary>>};
pack(12766, srv, {V0_channel, V0_msg_list}) ->
    D_a_t_a = <<V0_channel:16, (length(V0_msg_list)):16,
		(list_to_binary([<<(length(V1_role_list)):16,
				   (list_to_binary([<<V2_rid:32,
						      (protocol:pack(string,
								     V2_srv_id))/binary,
						      (protocol:pack(string,
								     V2_name))/binary,
						      V2_face_id:32, V2_lev:8,
						      V2_sex:8, V2_career:16,
						      V2_vip_lev:8,
						      V2_is_show_vip:8,
						      (protocol:pack(string,
								     V2_province))/binary,
						      (protocol:pack(string,
								     V2_city))/binary,
						      V2_capacity:8,
						      V2_head_bid:32,
						      V2_chat_bubble:32,
						      (length(V2_ext_list)):16,
						      (list_to_binary([<<V3_type:8,
									 V3_val:32>>
								       || {V3_type,
									   V3_val}
									      <- V2_ext_list]))/binary,
						      V2_gid:32,
						      (protocol:pack(string,
								     V2_gsrv_id))/binary,
						      (protocol:pack(string,
								     V2_g_name))/binary,
						      V2_face_update_time:32,
						      (protocol:pack(string,
								     V2_face_file))/binary>>
						    || {V2_rid, V2_srv_id,
							V2_name, V2_face_id,
							V2_lev, V2_sex,
							V2_career, V2_vip_lev,
							V2_is_show_vip,
							V2_province, V2_city,
							V2_capacity,
							V2_head_bid,
							V2_chat_bubble,
							V2_ext_list,
							{V2_gid, V2_gsrv_id},
							V2_g_name,
							V2_face_update_time,
							V2_face_file}
							   <- V1_role_list]))/binary,
				   V1_channel:16, V1_len:8,
				   (protocol:pack(string, V1_msg))/binary,
				   V1_tick:32>>
				 || {V1_role_list, V1_channel, V1_len, V1_msg,
				     V1_tick}
					<- V0_msg_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12766:16,
       D_a_t_a/binary>>};
pack(12767, cli, {}) -> {ok, <<2:32, 12767:16>>};
pack(12767, srv,
     {V0_rid, V0_srv_id, V0_name, V0_channel, V0_msg}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_channel:16,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12767:16,
       D_a_t_a/binary>>};
pack(12768, cli,
     {V0_rid, V0_srv_id, V0_channel, V0_msg}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_channel:16, (protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12768:16,
       D_a_t_a/binary>>};
pack(12768, srv, {}) -> {ok, <<2:32, 12768:16>>};
pack(12770, cli,
     {V0_rid, V0_srv_id, V0_type, V0_msg, V0_history}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_type:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_history)):16,
		(list_to_binary([<<V1_id:8>>
				 || V1_id <- V0_history]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12770:16,
       D_a_t_a/binary>>};
pack(12770, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12770:16,
       D_a_t_a/binary>>};
pack(12771, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12771:16,
       D_a_t_a/binary>>};
pack(12771, srv, {V0_rid, V0_srv_id, V0_history}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(length(V0_history)):16,
		(list_to_binary([<<V1_id:8, V1_channel:16,
				   (protocol:pack(string, V1_msg))/binary>>
				 || {V1_id, V1_channel, V1_msg}
					<- V0_history]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12771:16,
       D_a_t_a/binary>>};
pack(12772, cli, {}) -> {ok, <<2:32, 12772:16>>};
pack(12772, srv, {V0_msg, V0_end_time}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary,
		V0_end_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12772:16,
       D_a_t_a/binary>>};
pack(12799, srv, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12799:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(12700, srv, _B0) -> {ok, {}};
unpack(12700, cli, _B0) ->
    {V1_say_frame_bid, _B1} = protocol:uint32(_B0),
    {V1_say_frame, _B6} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_base_id, _B3} =
						     protocol:uint32(_B2),
						 {V2_expire_time, _B4} =
						     protocol:uint32(_B3),
						 {{V2_base_id, V2_expire_time},
						  _B4}
					 end),
    {ok, {V1_say_frame_bid, V1_say_frame}};
unpack(12701, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(12701, cli, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(12702, srv, _B0) -> {ok, {}};
unpack(12702, cli, _B0) ->
    {V1_say_frame, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_base_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_expire_time, _B3} =
						     protocol:uint32(_B2),
						 {{V2_base_id, V2_expire_time},
						  _B3}
					 end),
    {ok, {V1_say_frame}};
unpack(12703, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(12703, cli, _B0) ->
    {V1_say_frame, _B5} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_base_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_expire_time, _B3} =
						     protocol:uint32(_B2),
						 {{V2_base_id, V2_expire_time},
						  _B3}
					 end),
    {ok, {V1_say_frame}};
unpack(12704, srv, _B0) -> {ok, {}};
unpack(12704, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(12720, srv, _B0) ->
    {V1_to_rid, _B1} = protocol:uint32(_B0),
    {V1_to_srv_id, _B2} = protocol:string(_B1),
    {V1_len, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_to_rid, V1_to_srv_id, V1_len, V1_msg}};
unpack(12720, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(12721, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {V1_lev, _B5} = protocol:uint8(_B4),
    {V1_career, _B6} = protocol:uint16(_B5),
    {V1_face_id, _B7} = protocol:uint32(_B6),
    {V1_len, _B8} = protocol:uint8(_B7),
    {V1_msg, _B9} = protocol:string(_B8),
    {V1_sex, _B10} = protocol:uint8(_B9),
    {V1_vip_lev, _B11} = protocol:uint8(_B10),
    {V1_capacity, _B12} = protocol:uint8(_B11),
    {V1_head_bid, _B13} = protocol:uint32(_B12),
    {V1_bubble_bid, _B14} = protocol:uint32(_B13),
    {V1_tick, _B15} = protocol:uint32(_B14),
    {V1_face_update_time, _B16} = protocol:uint32(_B15),
    {V1_face_file, _B17} = protocol:string(_B16),
    {ok,
     {V1_flag, V1_rid, V1_srv_id, V1_name, V1_lev, V1_career,
      V1_face_id, V1_len, V1_msg, V1_sex, V1_vip_lev,
      V1_capacity, V1_head_bid, V1_bubble_bid, V1_tick,
      V1_face_update_time, V1_face_file}};
unpack(12722, cli, _B0) ->
    {V1_offline_list, _B22} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_rid, _B2} =
							 protocol:uint32(_B1),
						     {V2_srv_id, _B3} =
							 protocol:string(_B2),
						     {V2_name, _B4} =
							 protocol:string(_B3),
						     {V2_lev, _B5} =
							 protocol:uint8(_B4),
						     {V2_career, _B6} =
							 protocol:uint16(_B5),
						     {V2_face_id, _B7} =
							 protocol:uint32(_B6),
						     {V2_sex, _B8} =
							 protocol:uint8(_B7),
						     {V2_vip_lev, _B9} =
							 protocol:uint8(_B8),
						     {V2_capacity, _B10} =
							 protocol:uint8(_B9),
						     {V2_head_bid, _B11} =
							 protocol:uint32(_B10),
						     {V2_chat_bubble, _B12} =
							 protocol:uint32(_B11),
						     {V2_msg_list, _B18} =
							 protocol:array(_B12,
									fun
									  (_B13) ->
									      {V3_len,
									       _B14} =
										  protocol:uint8(_B13),
									      {V3_msg,
									       _B15} =
										  protocol:string(_B14),
									      {V3_tick,
									       _B16} =
										  protocol:uint32(_B15),
									      {{V3_len,
										V3_msg,
										V3_tick},
									       _B16}
									end),
						     {V2_face_update_time,
						      _B19} =
							 protocol:uint32(_B18),
						     {V2_face_file, _B20} =
							 protocol:string(_B19),
						     {{V2_rid, V2_srv_id,
						       V2_name, V2_lev,
						       V2_career, V2_face_id,
						       V2_sex, V2_vip_lev,
						       V2_capacity, V2_head_bid,
						       V2_chat_bubble,
						       V2_msg_list,
						       V2_face_update_time,
						       V2_face_file},
						      _B20}
					     end),
    {ok, {V1_offline_list}};
unpack(12723, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(12723, cli, _B0) -> {ok, {}};
unpack(12725, srv, _B0) ->
    {V1_voice, _B1} = protocol:byte(_B0),
    {V1_voice_len, _B2} = protocol:uint16(_B1),
    {V1_time, _B3} = protocol:uint8(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_voice, V1_voice_len, V1_time, V1_type}};
unpack(12725, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_voice_id, _B3} = protocol:uint32(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_flag, V1_srv_id, V1_voice_id, V1_msg}};
unpack(12726, srv, _B0) ->
    {V1_srv_id, _B1} = protocol:string(_B0),
    {V1_voice_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_srv_id, V1_voice_id}};
unpack(12726, cli, _B0) ->
    {V1_srv_id, _B1} = protocol:string(_B0),
    {V1_voice_id, _B2} = protocol:uint32(_B1),
    {V1_time, _B3} = protocol:uint8(_B2),
    {V1_voice, _B4} = protocol:byte(_B3),
    {V1_type, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_srv_id, V1_voice_id, V1_time, V1_voice, V1_type}};
unpack(12729, srv, _B0) -> {ok, {}};
unpack(12729, cli, _B0) -> {ok, {}};
unpack(12730, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_is_push, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_is_push}};
unpack(12730, cli, _B0) -> {ok, {}};
unpack(12731, srv, _B0) -> {ok, {}};
unpack(12731, cli, _B0) -> {ok, {}};
unpack(12732, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_type, V1_msg}};
unpack(12732, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(12733, cli, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_list, _B10} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_id, _B3} =
						 protocol:uint32(_B2),
					     {V2_rid, _B4} =
						 protocol:uint32(_B3),
					     {V2_srv_id, _B5} =
						 protocol:string(_B4),
					     {V2_name, _B6} =
						 protocol:string(_B5),
					     {V2_msg, _B7} =
						 protocol:string(_B6),
					     {V2_time, _B8} =
						 protocol:uint32(_B7),
					     {{V2_id, V2_rid, V2_srv_id,
					       V2_name, V2_msg, V2_time},
					      _B8}
				     end),
    {ok, {V1_type, V1_list}};
unpack(12741, cli, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0), {ok, {V1_msg}};
unpack(12742, cli, _B0) ->
    {V1_asset_list, _B8} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_bid, _B2} =
						      protocol:uint32(_B1),
						  {V2_is_bind, _B3} =
						      protocol:uint8(_B2),
						  {V2_num, _B4} =
						      protocol:uint32(_B3),
						  {V2_id, _B5} =
						      protocol:uint32(_B4),
						  {V2_move_to, _B6} =
						      protocol:uint8(_B5),
						  {{V2_bid, V2_is_bind, V2_num,
						    V2_id, V2_move_to},
						   _B6}
					  end),
    {V1_source, _B9} = protocol:uint32(_B8),
    {ok, {V1_asset_list, V1_source}};
unpack(12743, cli, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0), {ok, {V1_msg}};
unpack(12744, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_type, V1_msg}};
unpack(12745, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_need_num, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint32(_B2),
    {ok, {V1_bid, V1_need_num, V1_num}};
unpack(12761, cli, _B0) ->
    {V1_role_list, _B27} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_rid, _B2} =
						      protocol:uint32(_B1),
						  {V2_srv_id, _B3} =
						      protocol:string(_B2),
						  {V2_name, _B4} =
						      protocol:string(_B3),
						  {V2_face_id, _B5} =
						      protocol:uint32(_B4),
						  {V2_lev, _B6} =
						      protocol:uint8(_B5),
						  {V2_sex, _B7} =
						      protocol:uint8(_B6),
						  {V2_career, _B8} =
						      protocol:uint16(_B7),
						  {V2_vip_lev, _B9} =
						      protocol:uint8(_B8),
						  {V2_is_show_vip, _B10} =
						      protocol:uint8(_B9),
						  {V2_province, _B11} =
						      protocol:string(_B10),
						  {V2_city, _B12} =
						      protocol:string(_B11),
						  {V2_capacity, _B13} =
						      protocol:uint8(_B12),
						  {V2_head_bid, _B14} =
						      protocol:uint32(_B13),
						  {V2_bubble_bid, _B15} =
						      protocol:uint32(_B14),
						  {V2_ext_list, _B20} =
						      protocol:array(_B15,
								     fun
								       (_B16) ->
									   {V3_type,
									    _B17} =
									       protocol:uint8(_B16),
									   {V3_val,
									    _B18} =
									       protocol:uint32(_B17),
									   {{V3_type,
									     V3_val},
									    _B18}
								     end),
						  {V2_gid, _B21} =
						      protocol:uint32(_B20),
						  {V2_gsrv_id, _B22} =
						      protocol:string(_B21),
						  {V2_g_name, _B23} =
						      protocol:string(_B22),
						  {V2_face_update_time, _B24} =
						      protocol:uint32(_B23),
						  {V2_face_file, _B25} =
						      protocol:string(_B24),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_face_id, V2_lev, V2_sex,
						    V2_career, V2_vip_lev,
						    V2_is_show_vip, V2_province,
						    V2_city, V2_capacity,
						    V2_head_bid, V2_bubble_bid,
						    V2_ext_list, V2_gid,
						    V2_gsrv_id, V2_g_name,
						    V2_face_update_time,
						    V2_face_file},
						   _B25}
					  end),
    {V1_channel, _B28} = protocol:uint16(_B27),
    {V1_len, _B29} = protocol:uint8(_B28),
    {V1_msg, _B30} = protocol:string(_B29),
    {V1_tick, _B31} = protocol:uint32(_B30),
    {ok,
     {V1_role_list, V1_channel, V1_len, V1_msg, V1_tick}};
unpack(12762, srv, _B0) ->
    {V1_channel, _B1} = protocol:uint16(_B0),
    {V1_len, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_sign, _B4} = protocol:string(_B3),
    {ok, {V1_channel, V1_len, V1_msg, V1_sign}};
unpack(12762, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(12763, cli, _B0) ->
    {V1_channel, _B1} = protocol:uint16(_B0),
    {V1_id, _B2} = protocol:string(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_channel, V1_id, V1_msg}};
unpack(12764, srv, _B0) ->
    {V1_channel, _B1} = protocol:uint16(_B0),
    {V1_id, _B2} = protocol:string(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_channel, V1_id, V1_msg}};
unpack(12764, cli, _B0) -> {ok, {}};
unpack(12766, srv, _B0) ->
    {V1_channel, _B1} = protocol:uint16(_B0),
    {ok, {V1_channel}};
unpack(12766, cli, _B0) ->
    {V1_channel, _B1} = protocol:uint16(_B0),
    {V1_msg_list, _B35} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_role_list, _B29} =
						     protocol:array(_B2,
								    fun (_B3) ->
									    {V3_rid,
									     _B4} =
										protocol:uint32(_B3),
									    {V3_srv_id,
									     _B5} =
										protocol:string(_B4),
									    {V3_name,
									     _B6} =
										protocol:string(_B5),
									    {V3_face_id,
									     _B7} =
										protocol:uint32(_B6),
									    {V3_lev,
									     _B8} =
										protocol:uint8(_B7),
									    {V3_sex,
									     _B9} =
										protocol:uint8(_B8),
									    {V3_career,
									     _B10} =
										protocol:uint16(_B9),
									    {V3_vip_lev,
									     _B11} =
										protocol:uint8(_B10),
									    {V3_is_show_vip,
									     _B12} =
										protocol:uint8(_B11),
									    {V3_province,
									     _B13} =
										protocol:string(_B12),
									    {V3_city,
									     _B14} =
										protocol:string(_B13),
									    {V3_capacity,
									     _B15} =
										protocol:uint8(_B14),
									    {V3_head_bid,
									     _B16} =
										protocol:uint32(_B15),
									    {V3_chat_bubble,
									     _B17} =
										protocol:uint32(_B16),
									    {V3_ext_list,
									     _B22} =
										protocol:array(_B17,
											       fun
												 (_B18) ->
												     {V4_type,
												      _B19} =
													 protocol:uint8(_B18),
												     {V4_val,
												      _B20} =
													 protocol:uint32(_B19),
												     {{V4_type,
												       V4_val},
												      _B20}
											       end),
									    {V3_gid,
									     _B23} =
										protocol:uint32(_B22),
									    {V3_gsrv_id,
									     _B24} =
										protocol:string(_B23),
									    {V3_g_name,
									     _B25} =
										protocol:string(_B24),
									    {V3_face_update_time,
									     _B26} =
										protocol:uint32(_B25),
									    {V3_face_file,
									     _B27} =
										protocol:string(_B26),
									    {{V3_rid,
									      V3_srv_id,
									      V3_name,
									      V3_face_id,
									      V3_lev,
									      V3_sex,
									      V3_career,
									      V3_vip_lev,
									      V3_is_show_vip,
									      V3_province,
									      V3_city,
									      V3_capacity,
									      V3_head_bid,
									      V3_chat_bubble,
									      V3_ext_list,
									      V3_gid,
									      V3_gsrv_id,
									      V3_g_name,
									      V3_face_update_time,
									      V3_face_file},
									     _B27}
								    end),
						 {V2_channel, _B30} =
						     protocol:uint16(_B29),
						 {V2_len, _B31} =
						     protocol:uint8(_B30),
						 {V2_msg, _B32} =
						     protocol:string(_B31),
						 {V2_tick, _B33} =
						     protocol:uint32(_B32),
						 {{V2_role_list, V2_channel,
						   V2_len, V2_msg, V2_tick},
						  _B33}
					 end),
    {ok, {V1_channel, V1_msg_list}};
unpack(12767, srv, _B0) -> {ok, {}};
unpack(12767, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_channel, _B4} = protocol:uint16(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok, {V1_rid, V1_srv_id, V1_name, V1_channel, V1_msg}};
unpack(12768, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_channel, _B3} = protocol:uint16(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_rid, V1_srv_id, V1_channel, V1_msg}};
unpack(12768, cli, _B0) -> {ok, {}};
unpack(12770, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {V1_history, _B8} = protocol:array(_B4,
				       fun (_B5) ->
					       {V2_id, _B6} =
						   protocol:uint8(_B5),
					       {V2_id, _B6}
				       end),
    {ok, {V1_rid, V1_srv_id, V1_type, V1_msg, V1_history}};
unpack(12770, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(12771, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(12771, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_history, _B8} = protocol:array(_B2,
				       fun (_B3) ->
					       {V2_id, _B4} =
						   protocol:uint8(_B3),
					       {V2_channel, _B5} =
						   protocol:uint16(_B4),
					       {V2_msg, _B6} =
						   protocol:string(_B5),
					       {{V2_id, V2_channel, V2_msg},
						_B6}
				       end),
    {ok, {V1_rid, V1_srv_id, V1_history}};
unpack(12772, srv, _B0) -> {ok, {}};
unpack(12772, cli, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_msg, V1_end_time}};
unpack(12799, cli, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0), {ok, {V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


