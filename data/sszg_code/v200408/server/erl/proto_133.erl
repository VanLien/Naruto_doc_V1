-file("src/proto/proto_133.erl", 1).

-module(proto_133).

-lager_records([{role_online,
		 [id, pid, conn_pid, name, account, status, lev, sex,
		  realm, platform, channel, career, power, face_id,
		  face_file, face_update_time, socket, max_dun_id,
		  province_name, city_name]},
		{friend_req,
		 [id, name, sex, career, face_id, lev, power, time,
		  avatar_bid, face_update_time, face_file]},
		{role_friend,
		 [id, name, gname, gid, sex, career, face_id, lev, power,
		  login_time, login_out_time, is_online, main_partner_id,
		  partner_bid, partner_lev, partner_star, is_home,
		  avatar_bid, vip_lev, dun_id, soft, face_update_time,
		  face_file]},
		{friend, [myid, fid, intimacy, is_draw, ctime]},
		{friend_tmp,
		 [fid, intimacy, ctime, name, gname, gid, sex, career,
		  face_id, avatar_bid, lev, vip_lev, power, login_time,
		  login_out_time, is_online, is_cross, main_partner_id,
		  partner_bid, partner_lev, partner_star, is_awake,
		  is_used, is_present, is_draw, dun_id, is_fanse, is_home,
		  soft, face_update_time, face_file]},
		{m_friend, [ver, is_open, list]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/friend.hrl", 1).

-record(m_friend, {ver = 1, is_open = 0, list = []}).

-record(friend_tmp,
	{fid = {0, <<>>}, intimacy = 0, ctime = 0, name = <<>>,
	 gname = <<>>, gid = {0, <<>>}, sex = 0, career = 0,
	 face_id = 0, avatar_bid = 0, lev = 0, vip_lev = 0,
	 power = 0, login_time = 0, login_out_time = 0,
	 is_online = 0, is_cross = 0, main_partner_id = 0,
	 partner_bid = 0, partner_lev = 0, partner_star = 0,
	 is_awake = 0, is_used = 0, is_present = 0, is_draw = 0,
	 dun_id = 1, is_fanse = 0, is_home = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(friend,
	{myid = 0, fid = {0, <<>>}, intimacy = 0, is_draw = 0,
	 ctime = 0}).

-record(role_friend,
	{id = {0, <<>>}, name = <<>>, gname = <<>>,
	 gid = {0, <<>>}, sex = 0, career = 0, face_id = 0,
	 lev = 0, power = 0, login_time = 0, login_out_time = 0,
	 is_online = 0, main_partner_id = 0, partner_bid = 0,
	 partner_lev = 0, partner_star = 0, is_home = 0,
	 avatar_bid = 0, vip_lev = 0, dun_id = 1, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(friend_req,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 face_id = 0, lev = 0, power = 0, time = 0,
	 avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-file("src/proto/proto_133.erl", 16).

-file("inc/role_online.hrl", 1).

-record(role_online,
	{id = {0, 0}, pid, conn_pid, name, account, status, lev,
	 sex, realm, platform, channel, career, power, face_id,
	 face_file = <<>>, face_update_time = 0, socket,
	 max_dun_id, province_name, city_name}).

-file("src/proto/proto_133.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(13300, cli, {}) -> {ok, <<2:32, 13300:16>>};
pack(13300, srv,
     {V0_present_count, V0_draw_count, V0_draw_all,
      V0_friend_list}) ->
    D_a_t_a = <<V0_present_count:16, V0_draw_count:16,
		V0_draw_all:16, (length(V0_friend_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_sex:8, V1_career:8,
				   V1_face_id:32, V1_power:32, V1_intimacy:32,
				   V1_login_time:32, V1_login_out_time:32,
				   V1_is_online:8, V1_is_cross:8, V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_main_partner_id:32, V1_partner_bid:32,
				   V1_partner_lev:16, V1_partner_star:8,
				   V1_is_awake:8, V1_is_used:8, V1_is_present:8,
				   V1_is_draw:8, V1_avatar_bid:32, V1_dun_id:32,
				   V1_is_home:8, V1_soft:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #friend_tmp{fid = {V1_rid, V1_srv_id},
						name = V1_name, lev = V1_lev,
						sex = V1_sex,
						career = V1_career,
						face_id = V1_face_id,
						power = V1_power,
						intimacy = V1_intimacy,
						login_time = V1_login_time,
						login_out_time =
						    V1_login_out_time,
						is_online = V1_is_online,
						is_cross = V1_is_cross,
						gid = {V1_gid, V1_gsrv_id},
						gname = V1_gname,
						main_partner_id =
						    V1_main_partner_id,
						partner_bid = V1_partner_bid,
						partner_lev = V1_partner_lev,
						partner_star = V1_partner_star,
						is_awake = V1_is_awake,
						is_used = V1_is_used,
						is_present = V1_is_present,
						is_draw = V1_is_draw,
						avatar_bid = V1_avatar_bid,
						dun_id = V1_dun_id,
						is_home = V1_is_home,
						soft = V1_soft,
						face_update_time =
						    V1_face_update_time,
						face_file = V1_face_file}
					<- V0_friend_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13300:16,
       D_a_t_a/binary>>};
pack(13301, srv,
     {{V0_rid, V0_srv_id}, V0_login_time, V0_is_online,
      V0_login_out_time}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_login_time:32, V0_is_online:8,
		V0_login_out_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13301:16,
       D_a_t_a/binary>>};
pack(13302, srv,
     #friend_tmp{fid = {V0_rid, V0_srv_id}, name = V0_name,
		 lev = V0_lev, sex = V0_sex, career = V0_career,
		 face_id = V0_face_id, power = V0_power,
		 intimacy = V0_intimacy, login_time = V0_login_time,
		 login_out_time = V0_login_out_time,
		 is_online = V0_is_online, is_cross = V0_is_cross,
		 gid = {V0_gid, V0_gsrv_id}, gname = V0_gname,
		 main_partner_id = V0_main_partner_id,
		 partner_bid = V0_partner_bid,
		 partner_lev = V0_partner_lev,
		 partner_star = V0_partner_star, is_awake = V0_is_awake,
		 is_used = V0_is_used, is_present = V0_is_present,
		 is_draw = V0_is_draw, avatar_bid = V0_avatar_bid,
		 dun_id = V0_dun_id, is_home = V0_is_home,
		 soft = V0_soft, face_update_time = V0_face_update_time,
		 face_file = V0_face_file}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:8,
		V0_sex:8, V0_career:8, V0_face_id:32, V0_power:32,
		V0_intimacy:32, V0_login_time:32, V0_login_out_time:32,
		V0_is_online:8, V0_is_cross:8, V0_gid:32,
		(protocol:pack(string, V0_gsrv_id))/binary,
		(protocol:pack(string, V0_gname))/binary,
		V0_main_partner_id:32, V0_partner_bid:32,
		V0_partner_lev:16, V0_partner_star:8, V0_is_awake:8,
		V0_is_used:8, V0_is_present:8, V0_is_draw:8,
		V0_avatar_bid:32, V0_dun_id:32, V0_is_home:8,
		V0_soft:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13302:16,
       D_a_t_a/binary>>};
pack(13303, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13303:16,
       D_a_t_a/binary>>};
pack(13303, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13303:16,
       D_a_t_a/binary>>};
pack(13304, srv,
     #friend_req{id = {V0_rid, V0_srv_id}, name = V0_name,
		 sex = V0_sex, career = V0_career, lev = V0_lev,
		 avatar_bid = V0_avatar_bid}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_sex:8,
		V0_career:8, V0_lev:8, V0_avatar_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13304:16,
       D_a_t_a/binary>>};
pack(13305, cli, {V0_rid, V0_srv_id, V0_agreed}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_agreed:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13305:16,
       D_a_t_a/binary>>};
pack(13305, srv,
     {V0_rid, V0_srv_id, V0_code, V0_msg}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13305:16,
       D_a_t_a/binary>>};
pack(13306, cli, {V0_role_ids}) ->
    D_a_t_a = <<(length(V0_role_ids)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_rid, V1_srv_id}
					<- V0_role_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13306:16,
       D_a_t_a/binary>>};
pack(13306, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13306:16,
       D_a_t_a/binary>>};
pack(13307, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13307:16,
       D_a_t_a/binary>>};
pack(13307, srv,
     {V0_code, V0_msg, V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13307:16,
       D_a_t_a/binary>>};
pack(13308, srv, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13308:16,
       D_a_t_a/binary>>};
pack(13309, cli, {V0_role_ids}) ->
    D_a_t_a = <<(length(V0_role_ids)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_rid, V1_srv_id}
					<- V0_role_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13309:16,
       D_a_t_a/binary>>};
pack(13309, srv, {V0_role_ids}) ->
    D_a_t_a = <<(length(V0_role_ids)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_rid, V1_srv_id}
					<- V0_role_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13309:16,
       D_a_t_a/binary>>};
pack(13310, srv,
     #friend_tmp{fid = {V0_rid, V0_srv_id}, name = V0_name,
		 lev = V0_lev, sex = V0_sex, career = V0_career,
		 face_id = V0_face_id, power = V0_power,
		 intimacy = V0_intimacy, login_time = V0_login_time,
		 login_out_time = V0_login_out_time,
		 is_online = V0_is_online, is_cross = V0_is_cross,
		 gid = {V0_gid, V0_gsrv_id}, gname = V0_gname,
		 main_partner_id = V0_main_partner_id,
		 partner_bid = V0_partner_bid,
		 partner_lev = V0_partner_lev,
		 partner_star = V0_partner_star, is_awake = V0_is_awake,
		 is_used = V0_is_used, is_present = V0_is_present,
		 is_draw = V0_is_draw, avatar_bid = V0_avatar_bid,
		 dun_id = V0_dun_id, is_home = V0_is_home,
		 soft = V0_soft, face_update_time = V0_face_update_time,
		 face_file = V0_face_file}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:8,
		V0_sex:8, V0_career:8, V0_face_id:32, V0_power:32,
		V0_intimacy:32, V0_login_time:32, V0_login_out_time:32,
		V0_is_online:8, V0_is_cross:8, V0_gid:32,
		(protocol:pack(string, V0_gsrv_id))/binary,
		(protocol:pack(string, V0_gname))/binary,
		V0_main_partner_id:32, V0_partner_bid:32,
		V0_partner_lev:16, V0_partner_star:8, V0_is_awake:8,
		V0_is_used:8, V0_is_present:8, V0_is_draw:8,
		V0_avatar_bid:32, V0_dun_id:32, V0_is_home:8,
		V0_soft:32, V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13310:16,
       D_a_t_a/binary>>};
pack(13311, cli, {}) -> {ok, <<2:32, 13311:16>>};
pack(13311, srv, {V0_friend_req_list}) ->
    D_a_t_a = <<(length(V0_friend_req_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_sex:8, V1_career:8, V1_lev:8,
				   V1_face_id:32, V1_power:32, V1_avatar_bid:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #friend_req{id = {V1_rid, V1_srv_id},
						name = V1_name, sex = V1_sex,
						career = V1_career,
						lev = V1_lev,
						face_id = V1_face_id,
						power = V1_power,
						avatar_bid = V1_avatar_bid,
						face_update_time =
						    V1_face_update_time,
						face_file = V1_face_file}
					<- V0_friend_req_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13311:16,
       D_a_t_a/binary>>};
pack(13312, cli, {}) -> {ok, <<2:32, 13312:16>>};
pack(13312, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13312:16,
       D_a_t_a/binary>>};
pack(13314, cli, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13314:16,
       D_a_t_a/binary>>};
pack(13314, srv, {V0_role_list}) ->
    D_a_t_a = <<(length(V0_role_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_sex:8, V1_career:8, V1_lev:8, V1_power:32,
				   V1_face_id:32, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #role_online{id = {V1_rid, V1_srv_id},
						 name = V1_name, sex = V1_sex,
						 career = V1_career,
						 lev = V1_lev, power = V1_power,
						 face_id = V1_face_id,
						 face_update_time =
						     V1_face_update_time,
						 face_file = V1_face_file}
					<- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13314:16,
       D_a_t_a/binary>>};
pack(13315, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13315:16,
       D_a_t_a/binary>>};
pack(13315, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13315:16,
       D_a_t_a/binary>>};
pack(13316, cli, {V0_rid, V0_srv_id, V0_code}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13316:16,
       D_a_t_a/binary>>};
pack(13316, srv,
     {V0_rid, V0_srv_id, V0_present_count, V0_draw_count,
      V0_code, V0_msg, V0_type, V0_is_present, V0_is_draw}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_present_count:16, V0_draw_count:16, V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8,
		V0_is_present:8, V0_is_draw:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13316:16,
       D_a_t_a/binary>>};
pack(13317, cli, {V0_code, V0_list}) ->
    D_a_t_a = <<V0_code:8, (length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_rid, V1_srv_id} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13317:16,
       D_a_t_a/binary>>};
pack(13317, srv, {V0_code, V0_msg, V0_type, V0_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8,
		(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_is_present:8, V1_is_draw:8>>
				 || {V1_rid, V1_srv_id, V1_is_present,
				     V1_is_draw}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13317:16,
       D_a_t_a/binary>>};
pack(13320, cli, {}) -> {ok, <<2:32, 13320:16>>};
pack(13320, srv, {V0_recommend_list}) ->
    D_a_t_a = <<(length(V0_recommend_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_sex:8, V1_career:8, V1_lev:8,
				   V1_face_id:32, V1_power:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #role_online{id = {V1_rid, V1_srv_id},
						 name = V1_name, sex = V1_sex,
						 career = V1_career,
						 lev = V1_lev,
						 face_id = V1_face_id,
						 power = V1_power,
						 face_update_time =
						     V1_face_update_time,
						 face_file = V1_face_file}
					<- V0_recommend_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13320:16,
       D_a_t_a/binary>>};
pack(13330, cli, {}) -> {ok, <<2:32, 13330:16>>};
pack(13330, srv, {V0_black_list}) ->
    D_a_t_a = <<(length(V0_black_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_sex:8, V1_career:8,
				   V1_face_id:32, V1_power:32,
				   V1_login_out_time:32, V1_is_online:8,
				   V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #role_friend{id = {V1_rid, V1_srv_id},
						 name = V1_name, lev = V1_lev,
						 sex = V1_sex,
						 career = V1_career,
						 face_id = V1_face_id,
						 power = V1_power,
						 login_out_time =
						     V1_login_out_time,
						 is_online = V1_is_online,
						 gid = {V1_gid, V1_gsrv_id},
						 gname = V1_gname,
						 face_update_time =
						     V1_face_update_time,
						 face_file = V1_face_file}
					<- V0_black_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13330:16,
       D_a_t_a/binary>>};
pack(13331, srv, {V0_type, V0_black_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_black_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_sex:8, V1_career:8,
				   V1_face_id:32, V1_power:32, V1_login_time:32,
				   V1_is_online:8, V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #role_friend{id = {V1_rid, V1_srv_id},
						 name = V1_name, lev = V1_lev,
						 sex = V1_sex,
						 career = V1_career,
						 face_id = V1_face_id,
						 power = V1_power,
						 login_time = V1_login_time,
						 is_online = V1_is_online,
						 gid = {V1_gid, V1_gsrv_id},
						 gname = V1_gname,
						 face_update_time =
						     V1_face_update_time,
						 face_file = V1_face_file}
					<- V0_black_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13331:16,
       D_a_t_a/binary>>};
pack(13332, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13332:16,
       D_a_t_a/binary>>};
pack(13332, srv,
     {V0_code, V0_msg, V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13332:16,
       D_a_t_a/binary>>};
pack(13333, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13333:16,
       D_a_t_a/binary>>};
pack(13333, srv,
     {V0_code, V0_msg, V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13333:16,
       D_a_t_a/binary>>};
pack(13334, cli, {V0_role_ids}) ->
    D_a_t_a = <<(length(V0_role_ids)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_rid, V1_srv_id}
					<- V0_role_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13334:16,
       D_a_t_a/binary>>};
pack(13334, srv, {V0_role_ids}) ->
    D_a_t_a = <<(length(V0_role_ids)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_rid, V1_srv_id}
					<- V0_role_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13334:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(13300, srv, _B0) -> {ok, {}};
unpack(13300, cli, _B0) ->
    {V1_present_count, _B1} = protocol:uint16(_B0),
    {V1_draw_count, _B2} = protocol:uint16(_B1),
    {V1_draw_all, _B3} = protocol:uint16(_B2),
    {V1_friend_list, _B36} = protocol:array(_B3,
					    fun (_B4) ->
						    {V2_rid, _B5} =
							protocol:uint32(_B4),
						    {V2_srv_id, _B6} =
							protocol:string(_B5),
						    {V2_name, _B7} =
							protocol:string(_B6),
						    {V2_lev, _B8} =
							protocol:uint8(_B7),
						    {V2_sex, _B9} =
							protocol:uint8(_B8),
						    {V2_career, _B10} =
							protocol:uint8(_B9),
						    {V2_face_id, _B11} =
							protocol:uint32(_B10),
						    {V2_power, _B12} =
							protocol:uint32(_B11),
						    {V2_intimacy, _B13} =
							protocol:uint32(_B12),
						    {V2_login_time, _B14} =
							protocol:uint32(_B13),
						    {V2_login_out_time, _B15} =
							protocol:uint32(_B14),
						    {V2_is_online, _B16} =
							protocol:uint8(_B15),
						    {V2_is_cross, _B17} =
							protocol:uint8(_B16),
						    {V2_gid, _B18} =
							protocol:uint32(_B17),
						    {V2_gsrv_id, _B19} =
							protocol:string(_B18),
						    {V2_gname, _B20} =
							protocol:string(_B19),
						    {V2_main_partner_id, _B21} =
							protocol:uint32(_B20),
						    {V2_partner_bid, _B22} =
							protocol:uint32(_B21),
						    {V2_partner_lev, _B23} =
							protocol:uint16(_B22),
						    {V2_partner_star, _B24} =
							protocol:uint8(_B23),
						    {V2_is_awake, _B25} =
							protocol:uint8(_B24),
						    {V2_is_used, _B26} =
							protocol:uint8(_B25),
						    {V2_is_present, _B27} =
							protocol:uint8(_B26),
						    {V2_is_draw, _B28} =
							protocol:uint8(_B27),
						    {V2_avatar_bid, _B29} =
							protocol:uint32(_B28),
						    {V2_dun_id, _B30} =
							protocol:uint32(_B29),
						    {V2_is_home, _B31} =
							protocol:uint8(_B30),
						    {V2_soft, _B32} =
							protocol:uint32(_B31),
						    {V2_face_update_time,
						     _B33} =
							protocol:uint32(_B32),
						    {V2_face_file, _B34} =
							protocol:string(_B33),
						    {{V2_rid, V2_srv_id,
						      V2_name, V2_lev, V2_sex,
						      V2_career, V2_face_id,
						      V2_power, V2_intimacy,
						      V2_login_time,
						      V2_login_out_time,
						      V2_is_online, V2_is_cross,
						      V2_gid, V2_gsrv_id,
						      V2_gname,
						      V2_main_partner_id,
						      V2_partner_bid,
						      V2_partner_lev,
						      V2_partner_star,
						      V2_is_awake, V2_is_used,
						      V2_is_present, V2_is_draw,
						      V2_avatar_bid, V2_dun_id,
						      V2_is_home, V2_soft,
						      V2_face_update_time,
						      V2_face_file},
						     _B34}
					    end),
    {ok,
     {V1_present_count, V1_draw_count, V1_draw_all,
      V1_friend_list}};
unpack(13301, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_login_time, _B3} = protocol:uint32(_B2),
    {V1_is_online, _B4} = protocol:uint8(_B3),
    {V1_login_out_time, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_rid, V1_srv_id, V1_login_time, V1_is_online,
      V1_login_out_time}};
unpack(13302, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_lev, _B4} = protocol:uint8(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_career, _B6} = protocol:uint8(_B5),
    {V1_face_id, _B7} = protocol:uint32(_B6),
    {V1_power, _B8} = protocol:uint32(_B7),
    {V1_intimacy, _B9} = protocol:uint32(_B8),
    {V1_login_time, _B10} = protocol:uint32(_B9),
    {V1_login_out_time, _B11} = protocol:uint32(_B10),
    {V1_is_online, _B12} = protocol:uint8(_B11),
    {V1_is_cross, _B13} = protocol:uint8(_B12),
    {V1_gid, _B14} = protocol:uint32(_B13),
    {V1_gsrv_id, _B15} = protocol:string(_B14),
    {V1_gname, _B16} = protocol:string(_B15),
    {V1_main_partner_id, _B17} = protocol:uint32(_B16),
    {V1_partner_bid, _B18} = protocol:uint32(_B17),
    {V1_partner_lev, _B19} = protocol:uint16(_B18),
    {V1_partner_star, _B20} = protocol:uint8(_B19),
    {V1_is_awake, _B21} = protocol:uint8(_B20),
    {V1_is_used, _B22} = protocol:uint8(_B21),
    {V1_is_present, _B23} = protocol:uint8(_B22),
    {V1_is_draw, _B24} = protocol:uint8(_B23),
    {V1_avatar_bid, _B25} = protocol:uint32(_B24),
    {V1_dun_id, _B26} = protocol:uint32(_B25),
    {V1_is_home, _B27} = protocol:uint8(_B26),
    {V1_soft, _B28} = protocol:uint32(_B27),
    {V1_face_update_time, _B29} = protocol:uint32(_B28),
    {V1_face_file, _B30} = protocol:string(_B29),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_lev, V1_sex, V1_career,
      V1_face_id, V1_power, V1_intimacy, V1_login_time,
      V1_login_out_time, V1_is_online, V1_is_cross, V1_gid,
      V1_gsrv_id, V1_gname, V1_main_partner_id,
      V1_partner_bid, V1_partner_lev, V1_partner_star,
      V1_is_awake, V1_is_used, V1_is_present, V1_is_draw,
      V1_avatar_bid, V1_dun_id, V1_is_home, V1_soft,
      V1_face_update_time, V1_face_file}};
unpack(13303, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(13303, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13304, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_sex, _B4} = protocol:uint8(_B3),
    {V1_career, _B5} = protocol:uint8(_B4),
    {V1_lev, _B6} = protocol:uint8(_B5),
    {V1_avatar_bid, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_sex, V1_career, V1_lev,
      V1_avatar_bid}};
unpack(13305, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_agreed, _B3} = protocol:uint8(_B2),
    {ok, {V1_rid, V1_srv_id, V1_agreed}};
unpack(13305, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_code, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_rid, V1_srv_id, V1_code, V1_msg}};
unpack(13306, srv, _B0) ->
    {V1_role_ids, _B5} = protocol:array(_B0,
					fun (_B1) ->
						{V2_rid, _B2} =
						    protocol:uint32(_B1),
						{V2_srv_id, _B3} =
						    protocol:string(_B2),
						{{V2_rid, V2_srv_id}, _B3}
					end),
    {ok, {V1_role_ids}};
unpack(13306, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13307, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(13307, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_srv_id, _B4} = protocol:string(_B3),
    {ok, {V1_code, V1_msg, V1_rid, V1_srv_id}};
unpack(13308, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(13309, srv, _B0) ->
    {V1_role_ids, _B5} = protocol:array(_B0,
					fun (_B1) ->
						{V2_rid, _B2} =
						    protocol:uint32(_B1),
						{V2_srv_id, _B3} =
						    protocol:string(_B2),
						{{V2_rid, V2_srv_id}, _B3}
					end),
    {ok, {V1_role_ids}};
unpack(13309, cli, _B0) ->
    {V1_role_ids, _B5} = protocol:array(_B0,
					fun (_B1) ->
						{V2_rid, _B2} =
						    protocol:uint32(_B1),
						{V2_srv_id, _B3} =
						    protocol:string(_B2),
						{{V2_rid, V2_srv_id}, _B3}
					end),
    {ok, {V1_role_ids}};
unpack(13310, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_lev, _B4} = protocol:uint8(_B3),
    {V1_sex, _B5} = protocol:uint8(_B4),
    {V1_career, _B6} = protocol:uint8(_B5),
    {V1_face_id, _B7} = protocol:uint32(_B6),
    {V1_power, _B8} = protocol:uint32(_B7),
    {V1_intimacy, _B9} = protocol:uint32(_B8),
    {V1_login_time, _B10} = protocol:uint32(_B9),
    {V1_login_out_time, _B11} = protocol:uint32(_B10),
    {V1_is_online, _B12} = protocol:uint8(_B11),
    {V1_is_cross, _B13} = protocol:uint8(_B12),
    {V1_gid, _B14} = protocol:uint32(_B13),
    {V1_gsrv_id, _B15} = protocol:string(_B14),
    {V1_gname, _B16} = protocol:string(_B15),
    {V1_main_partner_id, _B17} = protocol:uint32(_B16),
    {V1_partner_bid, _B18} = protocol:uint32(_B17),
    {V1_partner_lev, _B19} = protocol:uint16(_B18),
    {V1_partner_star, _B20} = protocol:uint8(_B19),
    {V1_is_awake, _B21} = protocol:uint8(_B20),
    {V1_is_used, _B22} = protocol:uint8(_B21),
    {V1_is_present, _B23} = protocol:uint8(_B22),
    {V1_is_draw, _B24} = protocol:uint8(_B23),
    {V1_avatar_bid, _B25} = protocol:uint32(_B24),
    {V1_dun_id, _B26} = protocol:uint32(_B25),
    {V1_is_home, _B27} = protocol:uint8(_B26),
    {V1_soft, _B28} = protocol:uint32(_B27),
    {V1_face_update_time, _B29} = protocol:uint32(_B28),
    {V1_face_file, _B30} = protocol:string(_B29),
    {ok,
     {V1_rid, V1_srv_id, V1_name, V1_lev, V1_sex, V1_career,
      V1_face_id, V1_power, V1_intimacy, V1_login_time,
      V1_login_out_time, V1_is_online, V1_is_cross, V1_gid,
      V1_gsrv_id, V1_gname, V1_main_partner_id,
      V1_partner_bid, V1_partner_lev, V1_partner_star,
      V1_is_awake, V1_is_used, V1_is_present, V1_is_draw,
      V1_avatar_bid, V1_dun_id, V1_is_home, V1_soft,
      V1_face_update_time, V1_face_file}};
unpack(13311, srv, _B0) -> {ok, {}};
unpack(13311, cli, _B0) ->
    {V1_friend_req_list, _B14} = protocol:array(_B0,
						fun (_B1) ->
							{V2_rid, _B2} =
							    protocol:uint32(_B1),
							{V2_srv_id, _B3} =
							    protocol:string(_B2),
							{V2_name, _B4} =
							    protocol:string(_B3),
							{V2_sex, _B5} =
							    protocol:uint8(_B4),
							{V2_career, _B6} =
							    protocol:uint8(_B5),
							{V2_lev, _B7} =
							    protocol:uint8(_B6),
							{V2_face_id, _B8} =
							    protocol:uint32(_B7),
							{V2_power, _B9} =
							    protocol:uint32(_B8),
							{V2_avatar_bid, _B10} =
							    protocol:uint32(_B9),
							{V2_face_update_time,
							 _B11} =
							    protocol:uint32(_B10),
							{V2_face_file, _B12} =
							    protocol:string(_B11),
							{{V2_rid, V2_srv_id,
							  V2_name, V2_sex,
							  V2_career, V2_lev,
							  V2_face_id, V2_power,
							  V2_avatar_bid,
							  V2_face_update_time,
							  V2_face_file},
							 _B12}
						end),
    {ok, {V1_friend_req_list}};
unpack(13312, srv, _B0) -> {ok, {}};
unpack(13312, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13314, srv, _B0) ->
    {V1_name, _B1} = protocol:string(_B0), {ok, {V1_name}};
unpack(13314, cli, _B0) ->
    {V1_role_list, _B13} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_rid, _B2} =
						      protocol:uint32(_B1),
						  {V2_srv_id, _B3} =
						      protocol:string(_B2),
						  {V2_name, _B4} =
						      protocol:string(_B3),
						  {V2_sex, _B5} =
						      protocol:uint8(_B4),
						  {V2_career, _B6} =
						      protocol:uint8(_B5),
						  {V2_lev, _B7} =
						      protocol:uint8(_B6),
						  {V2_power, _B8} =
						      protocol:uint32(_B7),
						  {V2_face_id, _B9} =
						      protocol:uint32(_B8),
						  {V2_face_update_time, _B10} =
						      protocol:uint32(_B9),
						  {V2_face_file, _B11} =
						      protocol:string(_B10),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_sex, V2_career, V2_lev,
						    V2_power, V2_face_id,
						    V2_face_update_time,
						    V2_face_file},
						   _B11}
					  end),
    {ok, {V1_role_list}};
unpack(13315, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(13315, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(13316, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_code, _B3} = protocol:uint8(_B2),
    {ok, {V1_rid, V1_srv_id, V1_code}};
unpack(13316, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_present_count, _B3} = protocol:uint16(_B2),
    {V1_draw_count, _B4} = protocol:uint16(_B3),
    {V1_code, _B5} = protocol:uint8(_B4),
    {V1_msg, _B6} = protocol:string(_B5),
    {V1_type, _B7} = protocol:uint8(_B6),
    {V1_is_present, _B8} = protocol:uint8(_B7),
    {V1_is_draw, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_rid, V1_srv_id, V1_present_count, V1_draw_count,
      V1_code, V1_msg, V1_type, V1_is_present, V1_is_draw}};
unpack(13317, srv, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_list, _B6} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_rid, _B3} =
						protocol:uint32(_B2),
					    {V2_srv_id, _B4} =
						protocol:string(_B3),
					    {{V2_rid, V2_srv_id}, _B4}
				    end),
    {ok, {V1_code, V1_list}};
unpack(13317, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_list, _B10} = protocol:array(_B3,
				     fun (_B4) ->
					     {V2_rid, _B5} =
						 protocol:uint32(_B4),
					     {V2_srv_id, _B6} =
						 protocol:string(_B5),
					     {V2_is_present, _B7} =
						 protocol:uint8(_B6),
					     {V2_is_draw, _B8} =
						 protocol:uint8(_B7),
					     {{V2_rid, V2_srv_id, V2_is_present,
					       V2_is_draw},
					      _B8}
				     end),
    {ok, {V1_code, V1_msg, V1_type, V1_list}};
unpack(13320, srv, _B0) -> {ok, {}};
unpack(13320, cli, _B0) ->
    {V1_recommend_list, _B13} = protocol:array(_B0,
					       fun (_B1) ->
						       {V2_rid, _B2} =
							   protocol:uint32(_B1),
						       {V2_srv_id, _B3} =
							   protocol:string(_B2),
						       {V2_name, _B4} =
							   protocol:string(_B3),
						       {V2_sex, _B5} =
							   protocol:uint8(_B4),
						       {V2_career, _B6} =
							   protocol:uint8(_B5),
						       {V2_lev, _B7} =
							   protocol:uint8(_B6),
						       {V2_face_id, _B8} =
							   protocol:uint32(_B7),
						       {V2_power, _B9} =
							   protocol:uint32(_B8),
						       {V2_face_update_time,
							_B10} =
							   protocol:uint32(_B9),
						       {V2_face_file, _B11} =
							   protocol:string(_B10),
						       {{V2_rid, V2_srv_id,
							 V2_name, V2_sex,
							 V2_career, V2_lev,
							 V2_face_id, V2_power,
							 V2_face_update_time,
							 V2_face_file},
							_B11}
					       end),
    {ok, {V1_recommend_list}};
unpack(13330, srv, _B0) -> {ok, {}};
unpack(13330, cli, _B0) ->
    {V1_black_list, _B18} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_rid, _B2} =
						       protocol:uint32(_B1),
						   {V2_srv_id, _B3} =
						       protocol:string(_B2),
						   {V2_name, _B4} =
						       protocol:string(_B3),
						   {V2_lev, _B5} =
						       protocol:uint8(_B4),
						   {V2_sex, _B6} =
						       protocol:uint8(_B5),
						   {V2_career, _B7} =
						       protocol:uint8(_B6),
						   {V2_face_id, _B8} =
						       protocol:uint32(_B7),
						   {V2_power, _B9} =
						       protocol:uint32(_B8),
						   {V2_login_out_time, _B10} =
						       protocol:uint32(_B9),
						   {V2_is_online, _B11} =
						       protocol:uint8(_B10),
						   {V2_gid, _B12} =
						       protocol:uint32(_B11),
						   {V2_gsrv_id, _B13} =
						       protocol:string(_B12),
						   {V2_gname, _B14} =
						       protocol:string(_B13),
						   {V2_face_update_time, _B15} =
						       protocol:uint32(_B14),
						   {V2_face_file, _B16} =
						       protocol:string(_B15),
						   {{V2_rid, V2_srv_id, V2_name,
						     V2_lev, V2_sex, V2_career,
						     V2_face_id, V2_power,
						     V2_login_out_time,
						     V2_is_online, V2_gid,
						     V2_gsrv_id, V2_gname,
						     V2_face_update_time,
						     V2_face_file},
						    _B16}
					   end),
    {ok, {V1_black_list}};
unpack(13331, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_black_list, _B19} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_rid, _B3} =
						       protocol:uint32(_B2),
						   {V2_srv_id, _B4} =
						       protocol:string(_B3),
						   {V2_name, _B5} =
						       protocol:string(_B4),
						   {V2_lev, _B6} =
						       protocol:uint8(_B5),
						   {V2_sex, _B7} =
						       protocol:uint8(_B6),
						   {V2_career, _B8} =
						       protocol:uint8(_B7),
						   {V2_face_id, _B9} =
						       protocol:uint32(_B8),
						   {V2_power, _B10} =
						       protocol:uint32(_B9),
						   {V2_login_time, _B11} =
						       protocol:uint32(_B10),
						   {V2_is_online, _B12} =
						       protocol:uint8(_B11),
						   {V2_gid, _B13} =
						       protocol:uint32(_B12),
						   {V2_gsrv_id, _B14} =
						       protocol:string(_B13),
						   {V2_gname, _B15} =
						       protocol:string(_B14),
						   {V2_face_update_time, _B16} =
						       protocol:uint32(_B15),
						   {V2_face_file, _B17} =
						       protocol:string(_B16),
						   {{V2_rid, V2_srv_id, V2_name,
						     V2_lev, V2_sex, V2_career,
						     V2_face_id, V2_power,
						     V2_login_time,
						     V2_is_online, V2_gid,
						     V2_gsrv_id, V2_gname,
						     V2_face_update_time,
						     V2_face_file},
						    _B17}
					   end),
    {ok, {V1_type, V1_black_list}};
unpack(13332, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(13332, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_srv_id, _B4} = protocol:string(_B3),
    {ok, {V1_code, V1_msg, V1_rid, V1_srv_id}};
unpack(13333, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(13333, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_srv_id, _B4} = protocol:string(_B3),
    {ok, {V1_code, V1_msg, V1_rid, V1_srv_id}};
unpack(13334, srv, _B0) ->
    {V1_role_ids, _B5} = protocol:array(_B0,
					fun (_B1) ->
						{V2_rid, _B2} =
						    protocol:uint32(_B1),
						{V2_srv_id, _B3} =
						    protocol:string(_B2),
						{{V2_rid, V2_srv_id}, _B3}
					end),
    {ok, {V1_role_ids}};
unpack(13334, cli, _B0) ->
    {V1_role_ids, _B5} = protocol:array(_B0,
					fun (_B1) ->
						{V2_rid, _B2} =
						    protocol:uint32(_B1),
						{V2_srv_id, _B3} =
						    protocol:string(_B2),
						{{V2_rid, V2_srv_id}, _B3}
					end),
    {ok, {V1_role_ids}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


