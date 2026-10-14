-file("src/proto/proto_129.erl", 1).

-module(proto_129).

-lager_records([{g_mem_red_packet,
		 [id, rid, name, face_id, avatar_bid, post, type, num,
		  max_num, val, max_val, list, mems, start_time, end_time,
		  msg_id, face_update_time, face_file]},
		{guild_data, [lev, exp, num, maintain]},
		{guild_position, [id, name, limit]},
		{g_merge,
		 [gid, gname, gid2, gname2, role_id, rname, end_time,
		  gold]},
		{guild_rank,
		 [id, name, lev, exp, leader_name, leader_id,
		  leader_face, leader_lev, members_num, members_max,
		  apply_lev, apply_type, create_time, power, index,
		  leader_avatar_bid, leader_look_id,
		  leader_face_update_time, leader_face_file,
		  apply_power]},
		{guild_apply,
		 [gid, id, pid, name, face, lev, power, post, vip_lev,
		  online, apply_time, face_update_time, face_file]},
		{guild_member,
		 [ver, id, pid, name, face, lev, sex, power, post,
		  vip_lev, online, join_time, login_time, donate,
		  day_donate, avatar_bid, red_packet_num,
		  red_packet_price, red_packet_time, red_packet_recv_num,
		  red_packet_recv_time, active_lev, day_donate_type,
		  day_donate_time, day_dun_time, day_war_time, look_id,
		  face_update_time, face_file]},
		{guild_war_box,
		 [order, rid, sid, name, item_id, item_num]},
		{guild_cache, []},
		{guild,
		 [ver, id, name, lev, exp, day_exp, pid, leader_name,
		  leader_id, members, members_num, members_max, next_id,
		  sign, apply_lev, apply_type, recruit_num, cache, sync,
		  create_time, power, rename_time, lock_time, donate_exp,
		  red_packet, guild_war_box_end_time, guild_war_relust,
		  guild_war_box, guild_war_sign, day_var,
		  vice_leader_mail, normal_mail, vitality, apply_power]},
		{guild_bag,
		 [ver, id, pid, name, post, lev, join_time, quit_time,
		  send_time, send_num, recv_num, true_quit_time,
		  quit_post]},
		{guild_log_info,
		 [id, guild_id, type, time, role_id, role_name, msg]},
		{guild_log, [key, list]},
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/proto/proto_129.erl", 16).

-file("inc/guild.hrl", 1).

-record(guild_log, {key = {0, <<>>}, list = []}).

-record(guild_log_info,
	{id = 0, guild_id = {0, <<>>}, type = 0, time = 0,
	 role_id = {0, <<>>}, role_name = 0, msg = <<>>}).

-record(guild_bag,
	{ver = 2, id = {0, <<>>}, pid, name = <<>>, post = 0,
	 lev = 0, join_time = 0, quit_time = 0, send_time = 0,
	 send_num = 0, recv_num = 0, true_quit_time = 0,
	 quit_post = 0}).

-record(guild,
	{ver = 7, id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 day_exp = 0, pid = 0, leader_name = <<>>,
	 leader_id = {0, <<>>}, members = [], members_num = 1,
	 members_max = 50, next_id = 1, sign = <<>>,
	 apply_lev = guild_data:get_const(guild_min_lev),
	 apply_type = 1, recruit_num = 0, cache, sync = 0,
	 create_time = 0, power = 0, rename_time = 0,
	 lock_time = 0, donate_exp = 0, red_packet = [],
	 guild_war_box_end_time = 0, guild_war_relust = 0,
	 guild_war_box = [], guild_war_sign = [], day_var = [],
	 vice_leader_mail = 0, normal_mail = 0, vitality = 0,
	 apply_power = 0}).

-record(guild_cache, {}).

-record(guild_war_box,
	{order = 0, rid = 0, sid = <<>>, name = <<>>,
	 item_id = 0, item_num = 0}).

-record(guild_member,
	{ver = 6, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, sex = 1, power = 0, post = 0,
	 vip_lev = 0, online = 1, join_time = 0, login_time = 0,
	 donate = 0, day_donate = 0, avatar_bid = 0,
	 red_packet_num = 0, red_packet_price = 0,
	 red_packet_time = 0, red_packet_recv_num = 0,
	 red_packet_recv_time = 0, active_lev = 0,
	 day_donate_type = 0, day_donate_time = 0,
	 day_dun_time = 0, day_war_time = 0, look_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(guild_apply,
	{gid = {0, <<>>}, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, power = 0, post = 0, vip_lev = 0,
	 online = 1, apply_time = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(guild_rank,
	{id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 leader_name = <<>>, leader_id = {0, <<>>},
	 leader_face = 0, leader_lev = 0, members_num = 1,
	 members_max = 50, apply_lev = 0, apply_type = 1,
	 create_time = 0, power = 0, index = 0,
	 leader_avatar_bid = 0, leader_look_id = 0,
	 leader_face_update_time = 0, leader_face_file = <<>>,
	 apply_power = 0}).

-record(g_merge,
	{gid = {0, <<>>}, gname = <<>>, gid2 = {0, <<>>},
	 gname2 = <<>>, role_id = {0, <<>>}, rname = <<>>,
	 end_time = 0, gold = 0}).

-record(guild_position,
	{id = 0, name = <<>>, limit = []}).

-record(guild_data,
	{lev = 0, exp = 0, num = 0, maintain = 0}).

-record(g_mem_red_packet,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, name = <<>>,
	 face_id = 0, avatar_bid = 0, post = <<>>, type = 0,
	 num = 0, max_num = 0, val = 0, max_val = 0, list = [],
	 mems = [], start_time = 0, end_time = 0, msg_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/proto/proto_129.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(12900, cli,
     {V0_type, V0_start, V0_num, V0_is_cluster}) ->
    D_a_t_a = <<V0_type:16, V0_start:8, V0_num:8,
		V0_is_cluster:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12900:16,
       D_a_t_a/binary>>};
pack(12900, srv,
     {V0_is_cluster, V0_type, V0_start, V0_num, V0_len,
      V0_time, V0_my_idx, V0_lev, V0_face_id, V0_avatar_bid,
      V0_name, V0_my_val1, V0_my_val2, V0_my_val3,
      V0_rank_list, V0_face_update_time, V0_face_file}) ->
    D_a_t_a = <<V0_is_cluster:8, V0_type:16, V0_start:8,
		V0_num:8, V0_len:8, V0_time:32, V0_my_idx:16, V0_lev:8,
		V0_face_id:16, V0_avatar_bid:16,
		(protocol:pack(string, V0_name))/binary, V0_my_val1:32,
		V0_my_val2:32, V0_my_val3:32, (length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string,
						  V1_guild_name))/binary,
				   V1_lev:8, V1_face_id:32, V1_avatar_bid:32,
				   V1_val1:32, V1_val2:32, V1_val3:32, V1_idx:8,
				   (protocol:pack(string, V1_desc))/binary,
				   V1_look_id:32, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #rank_rc{rid = V1_rid, srv_id = V1_srv_id,
					     name = V1_name,
					     guild_name = V1_guild_name,
					     lev = V1_lev, face_id = V1_face_id,
					     avatar_bid = V1_avatar_bid,
					     val1 = V1_val1, val2 = V1_val2,
					     val3 = V1_val3, idx = V1_idx,
					     desc = V1_desc,
					     look_id = V1_look_id,
					     face_update_time =
						 V1_face_update_time,
					     face_file = V1_face_file}
					<- V0_rank_list]))/binary,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12900:16,
       D_a_t_a/binary>>};
pack(12901, cli, {V0_type, V0_is_cluster}) ->
    D_a_t_a = <<V0_type:16, V0_is_cluster:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12901:16,
       D_a_t_a/binary>>};
pack(12901, srv, {V0_is_cluster, V0_type, V0_time}) ->
    D_a_t_a = <<V0_is_cluster:8, V0_type:16, V0_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12901:16,
       D_a_t_a/binary>>};
pack(12902, cli, {V0_is_cluster}) ->
    D_a_t_a = <<V0_is_cluster:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12902:16,
       D_a_t_a/binary>>};
pack(12902, srv, {V0_is_cluster, V0_rank_list}) ->
    D_a_t_a = <<V0_is_cluster:8, (length(V0_rank_list)):16,
		(list_to_binary([<<V1_type:16,
				   (protocol:pack(string, V1_name))/binary,
				   V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string,
						  V1_guild_name))/binary,
				   V1_face_id:32, V1_avatar_bid:32, V1_val1:32,
				   V1_val2:32, V1_val3:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {V1_type,
				     {V1_name, V1_rid, V1_srv_id, V1_guild_name,
				      V1_face_id, V1_avatar_bid, V1_val1,
				      V1_val2, V1_val3, V1_face_update_time,
				      V1_face_file}}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12902:16,
       D_a_t_a/binary>>};
pack(12903, cli, {V0_start, V0_num, V0_is_cluster}) ->
    D_a_t_a = <<V0_start:8, V0_num:8, V0_is_cluster:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12903:16,
       D_a_t_a/binary>>};
pack(12903, srv,
     {V0_start, V0_num, V0_len, V0_time, V0_my_idx, V0_gname,
      V0_leader_name, V0_glev, V0_power, V0_rank_list}) ->
    D_a_t_a = <<V0_start:8, V0_num:8, V0_len:8, V0_time:32,
		V0_my_idx:16, (protocol:pack(string, V0_gname))/binary,
		(protocol:pack(string, V0_leader_name))/binary,
		V0_glev:8, V0_power:32, (length(V0_rank_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_name))/binary,
				   V1_lev:8, V1_members_num:8, V1_members_max:8,
				   (protocol:pack(string,
						  V1_leader_name))/binary,
				   V1_power:32, V1_idx:8, V1_leader_rid:32,
				   (protocol:pack(string,
						  V1_leader_srvid))/binary,
				   V1_leader_face:32, V1_leader_lev:8,
				   V1_leader_avatar_bid:32,
				   V1_leader_look_id:32,
				   V1_leader_face_update_time:32,
				   (protocol:pack(string,
						  V1_leader_face_file))/binary>>
				 || #guild_rank{name = V1_name, lev = V1_lev,
						members_num = V1_members_num,
						members_max = V1_members_max,
						leader_name = V1_leader_name,
						power = V1_power,
						index = V1_idx,
						leader_id =
						    {V1_leader_rid,
						     V1_leader_srvid},
						leader_face = V1_leader_face,
						leader_lev = V1_leader_lev,
						leader_avatar_bid =
						    V1_leader_avatar_bid,
						leader_look_id =
						    V1_leader_look_id,
						leader_face_update_time =
						    V1_leader_face_update_time,
						leader_face_file =
						    V1_leader_face_file}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12903:16,
       D_a_t_a/binary>>};
pack(12904, cli, {V0_start, V0_num}) ->
    D_a_t_a = <<V0_start:8, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12904:16,
       D_a_t_a/binary>>};
pack(12904, srv,
     {V0_start, V0_num, V0_len, V0_time, V0_my_idx, V0_lev,
      V0_face_id, V0_avatar_bid, V0_name, V0_pid, V0_pbid,
      V0_plev, V0_pquality, V0_pstar, V0_power,
      V0_face_update_time, V0_face_file, V0_rank_list}) ->
    D_a_t_a = <<V0_start:8, V0_num:8, V0_len:8, V0_time:32,
		V0_my_idx:16, V0_lev:8, V0_face_id:16, V0_avatar_bid:32,
		(protocol:pack(string, V0_name))/binary, V0_pid:16,
		V0_pbid:16, V0_plev:8, V0_pquality:8, V0_pstar:8,
		V0_power:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary,
		(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_face_id:32, V1_avatar_bid:32,
				   V1_power:32, V1_idx:8, V1_pid:16, V1_pbid:16,
				   V1_plev:8, V1_pquality:8, V1_pstar:8,
				   V1_look_id:32>>
				 || {V1_rid, V1_srv_id, V1_name, V1_lev,
				     V1_face_id, V1_avatar_bid, V1_power,
				     V1_idx, V1_pid, V1_pbid, V1_plev,
				     V1_pquality, V1_pstar, V1_look_id}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 12904:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(12900, srv, _B0) ->
    {V1_type, _B1} = protocol:uint16(_B0),
    {V1_start, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {V1_is_cluster, _B4} = protocol:uint8(_B3),
    {ok, {V1_type, V1_start, V1_num, V1_is_cluster}};
unpack(12900, cli, _B0) ->
    {V1_is_cluster, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint16(_B1),
    {V1_start, _B3} = protocol:uint8(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {V1_len, _B5} = protocol:uint8(_B4),
    {V1_time, _B6} = protocol:uint32(_B5),
    {V1_my_idx, _B7} = protocol:uint16(_B6),
    {V1_lev, _B8} = protocol:uint8(_B7),
    {V1_face_id, _B9} = protocol:uint16(_B8),
    {V1_avatar_bid, _B10} = protocol:uint16(_B9),
    {V1_name, _B11} = protocol:string(_B10),
    {V1_my_val1, _B12} = protocol:uint32(_B11),
    {V1_my_val2, _B13} = protocol:uint32(_B12),
    {V1_my_val3, _B14} = protocol:uint32(_B13),
    {V1_rank_list, _B32} = protocol:array(_B14,
					  fun (_B15) ->
						  {V2_rid, _B16} =
						      protocol:uint32(_B15),
						  {V2_srv_id, _B17} =
						      protocol:string(_B16),
						  {V2_name, _B18} =
						      protocol:string(_B17),
						  {V2_guild_name, _B19} =
						      protocol:string(_B18),
						  {V2_lev, _B20} =
						      protocol:uint8(_B19),
						  {V2_face_id, _B21} =
						      protocol:uint32(_B20),
						  {V2_avatar_bid, _B22} =
						      protocol:uint32(_B21),
						  {V2_val1, _B23} =
						      protocol:uint32(_B22),
						  {V2_val2, _B24} =
						      protocol:uint32(_B23),
						  {V2_val3, _B25} =
						      protocol:uint32(_B24),
						  {V2_idx, _B26} =
						      protocol:uint8(_B25),
						  {V2_desc, _B27} =
						      protocol:string(_B26),
						  {V2_look_id, _B28} =
						      protocol:uint32(_B27),
						  {V2_face_update_time, _B29} =
						      protocol:uint32(_B28),
						  {V2_face_file, _B30} =
						      protocol:string(_B29),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_guild_name, V2_lev,
						    V2_face_id, V2_avatar_bid,
						    V2_val1, V2_val2, V2_val3,
						    V2_idx, V2_desc, V2_look_id,
						    V2_face_update_time,
						    V2_face_file},
						   _B30}
					  end),
    {V1_face_update_time, _B33} = protocol:uint32(_B32),
    {V1_face_file, _B34} = protocol:string(_B33),
    {ok,
     {V1_is_cluster, V1_type, V1_start, V1_num, V1_len,
      V1_time, V1_my_idx, V1_lev, V1_face_id, V1_avatar_bid,
      V1_name, V1_my_val1, V1_my_val2, V1_my_val3,
      V1_rank_list, V1_face_update_time, V1_face_file}};
unpack(12901, srv, _B0) ->
    {V1_type, _B1} = protocol:uint16(_B0),
    {V1_is_cluster, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_is_cluster}};
unpack(12901, cli, _B0) ->
    {V1_is_cluster, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint16(_B1),
    {V1_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_is_cluster, V1_type, V1_time}};
unpack(12902, srv, _B0) ->
    {V1_is_cluster, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_cluster}};
unpack(12902, cli, _B0) ->
    {V1_is_cluster, _B1} = protocol:uint8(_B0),
    {V1_rank_list, _B16} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_type, _B3} =
						      protocol:uint16(_B2),
						  {V2_name, _B4} =
						      protocol:string(_B3),
						  {V2_rid, _B5} =
						      protocol:uint32(_B4),
						  {V2_srv_id, _B6} =
						      protocol:string(_B5),
						  {V2_guild_name, _B7} =
						      protocol:string(_B6),
						  {V2_face_id, _B8} =
						      protocol:uint32(_B7),
						  {V2_avatar_bid, _B9} =
						      protocol:uint32(_B8),
						  {V2_val1, _B10} =
						      protocol:uint32(_B9),
						  {V2_val2, _B11} =
						      protocol:uint32(_B10),
						  {V2_val3, _B12} =
						      protocol:uint32(_B11),
						  {V2_face_update_time, _B13} =
						      protocol:uint32(_B12),
						  {V2_face_file, _B14} =
						      protocol:string(_B13),
						  {{V2_type, V2_name, V2_rid,
						    V2_srv_id, V2_guild_name,
						    V2_face_id, V2_avatar_bid,
						    V2_val1, V2_val2, V2_val3,
						    V2_face_update_time,
						    V2_face_file},
						   _B14}
					  end),
    {ok, {V1_is_cluster, V1_rank_list}};
unpack(12903, srv, _B0) ->
    {V1_start, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {V1_is_cluster, _B3} = protocol:uint8(_B2),
    {ok, {V1_start, V1_num, V1_is_cluster}};
unpack(12903, cli, _B0) ->
    {V1_start, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {V1_len, _B3} = protocol:uint8(_B2),
    {V1_time, _B4} = protocol:uint32(_B3),
    {V1_my_idx, _B5} = protocol:uint16(_B4),
    {V1_gname, _B6} = protocol:string(_B5),
    {V1_leader_name, _B7} = protocol:string(_B6),
    {V1_glev, _B8} = protocol:uint8(_B7),
    {V1_power, _B9} = protocol:uint32(_B8),
    {V1_rank_list, _B27} = protocol:array(_B9,
					  fun (_B10) ->
						  {V2_name, _B11} =
						      protocol:string(_B10),
						  {V2_lev, _B12} =
						      protocol:uint8(_B11),
						  {V2_members_num, _B13} =
						      protocol:uint8(_B12),
						  {V2_members_max, _B14} =
						      protocol:uint8(_B13),
						  {V2_leader_name, _B15} =
						      protocol:string(_B14),
						  {V2_power, _B16} =
						      protocol:uint32(_B15),
						  {V2_idx, _B17} =
						      protocol:uint8(_B16),
						  {V2_leader_rid, _B18} =
						      protocol:uint32(_B17),
						  {V2_leader_srvid, _B19} =
						      protocol:string(_B18),
						  {V2_leader_face, _B20} =
						      protocol:uint32(_B19),
						  {V2_leader_lev, _B21} =
						      protocol:uint8(_B20),
						  {V2_leader_avatar_bid, _B22} =
						      protocol:uint32(_B21),
						  {V2_leader_look_id, _B23} =
						      protocol:uint32(_B22),
						  {V2_leader_face_update_time,
						   _B24} =
						      protocol:uint32(_B23),
						  {V2_leader_face_file, _B25} =
						      protocol:string(_B24),
						  {{V2_name, V2_lev,
						    V2_members_num,
						    V2_members_max,
						    V2_leader_name, V2_power,
						    V2_idx, V2_leader_rid,
						    V2_leader_srvid,
						    V2_leader_face,
						    V2_leader_lev,
						    V2_leader_avatar_bid,
						    V2_leader_look_id,
						    V2_leader_face_update_time,
						    V2_leader_face_file},
						   _B25}
					  end),
    {ok,
     {V1_start, V1_num, V1_len, V1_time, V1_my_idx, V1_gname,
      V1_leader_name, V1_glev, V1_power, V1_rank_list}};
unpack(12904, srv, _B0) ->
    {V1_start, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_start, V1_num}};
unpack(12904, cli, _B0) ->
    {V1_start, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {V1_len, _B3} = protocol:uint8(_B2),
    {V1_time, _B4} = protocol:uint32(_B3),
    {V1_my_idx, _B5} = protocol:uint16(_B4),
    {V1_lev, _B6} = protocol:uint8(_B5),
    {V1_face_id, _B7} = protocol:uint16(_B6),
    {V1_avatar_bid, _B8} = protocol:uint32(_B7),
    {V1_name, _B9} = protocol:string(_B8),
    {V1_pid, _B10} = protocol:uint16(_B9),
    {V1_pbid, _B11} = protocol:uint16(_B10),
    {V1_plev, _B12} = protocol:uint8(_B11),
    {V1_pquality, _B13} = protocol:uint8(_B12),
    {V1_pstar, _B14} = protocol:uint8(_B13),
    {V1_power, _B15} = protocol:uint32(_B14),
    {V1_face_update_time, _B16} = protocol:uint32(_B15),
    {V1_face_file, _B17} = protocol:string(_B16),
    {V1_rank_list, _B34} = protocol:array(_B17,
					  fun (_B18) ->
						  {V2_rid, _B19} =
						      protocol:uint32(_B18),
						  {V2_srv_id, _B20} =
						      protocol:string(_B19),
						  {V2_name, _B21} =
						      protocol:string(_B20),
						  {V2_lev, _B22} =
						      protocol:uint8(_B21),
						  {V2_face_id, _B23} =
						      protocol:uint32(_B22),
						  {V2_avatar_bid, _B24} =
						      protocol:uint32(_B23),
						  {V2_power, _B25} =
						      protocol:uint32(_B24),
						  {V2_idx, _B26} =
						      protocol:uint8(_B25),
						  {V2_pid, _B27} =
						      protocol:uint16(_B26),
						  {V2_pbid, _B28} =
						      protocol:uint16(_B27),
						  {V2_plev, _B29} =
						      protocol:uint8(_B28),
						  {V2_pquality, _B30} =
						      protocol:uint8(_B29),
						  {V2_pstar, _B31} =
						      protocol:uint8(_B30),
						  {V2_look_id, _B32} =
						      protocol:uint32(_B31),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_lev, V2_face_id,
						    V2_avatar_bid, V2_power,
						    V2_idx, V2_pid, V2_pbid,
						    V2_plev, V2_pquality,
						    V2_pstar, V2_look_id},
						   _B32}
					  end),
    {ok,
     {V1_start, V1_num, V1_len, V1_time, V1_my_idx, V1_lev,
      V1_face_id, V1_avatar_bid, V1_name, V1_pid, V1_pbid,
      V1_plev, V1_pquality, V1_pstar, V1_power,
      V1_face_update_time, V1_face_file, V1_rank_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


