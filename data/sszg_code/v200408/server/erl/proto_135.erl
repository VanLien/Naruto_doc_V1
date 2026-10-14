-file("src/proto/proto_135.erl", 1).

-module(proto_135).

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
		{guild_log, [key, list]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

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

-file("src/proto/proto_135.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(13500, cli,
     {V0_name, V0_sign, V0_apply_type, V0_apply_lev,
      V0_apply_power}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
		(protocol:pack(string, V0_sign))/binary,
		V0_apply_type:8, V0_apply_lev:8, V0_apply_power:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13500:16,
       D_a_t_a/binary>>};
pack(13500, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13500:16,
       D_a_t_a/binary>>};
pack(13501, cli, {V0_page, V0_flag, V0_num, V0_name}) ->
    D_a_t_a = <<V0_page:16, V0_flag:8, V0_num:16,
		(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13501:16,
       D_a_t_a/binary>>};
pack(13501, srv,
     {V0_page, V0_flag, V0_num, V0_page_total, V0_all_count,
      V0_name, V0_guilds}) ->
    D_a_t_a = <<V0_page:16, V0_flag:8, V0_num:16,
		V0_page_total:16, V0_all_count:16,
		(protocol:pack(string, V0_name))/binary,
		(length(V0_guilds)):16,
		(list_to_binary([<<V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_members_num:8, V1_members_max:8,
				   (protocol:pack(string,
						  V1_leader_name))/binary,
				   V1_apply_type:8, V1_apply_lev:8,
				   V1_apply_power:32, V1_is_apply:8>>
				 || {#guild_rank{id = {V1_gid, V1_gsrv_id},
						 name = V1_name, lev = V1_lev,
						 members_num = V1_members_num,
						 members_max = V1_members_max,
						 leader_name = V1_leader_name,
						 apply_type = V1_apply_type,
						 apply_lev = V1_apply_lev,
						 apply_power = V1_apply_power},
				     V1_is_apply}
					<- V0_guilds]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13501:16,
       D_a_t_a/binary>>};
pack(13503, cli, {V0_gid, V0_gsrv_id, V0_type}) ->
    D_a_t_a = <<V0_gid:32,
		(protocol:pack(string, V0_gsrv_id))/binary, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13503:16,
       D_a_t_a/binary>>};
pack(13503, srv,
     {V0_code, V0_msg, V0_gid, V0_gsrv_id, V0_is_apply}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_gid:32,
		(protocol:pack(string, V0_gsrv_id))/binary,
		V0_is_apply:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13503:16,
       D_a_t_a/binary>>};
pack(13505, cli, {V0_type, V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_type:8, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13505:16,
       D_a_t_a/binary>>};
pack(13505, srv,
     {V0_type, V0_rid, V0_srv_id, V0_code, V0_msg}) ->
    D_a_t_a = <<V0_type:8, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13505:16,
       D_a_t_a/binary>>};
pack(13507, cli, {V0_page, V0_num}) ->
    D_a_t_a = <<V0_page:8, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13507:16,
       D_a_t_a/binary>>};
pack(13507, srv,
     {V0_page, V0_page_total, V0_num, V0_guids}) ->
    D_a_t_a = <<V0_page:8, V0_page_total:8, V0_num:8,
		(length(V0_guids)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_face:32, V1_power:32,
				   V1_vip_lev:8, V1_is_online:8,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {{V1_rid, V1_srv_id}, V1_name, V1_lev,
				     V1_face, V1_power, V1_vip_lev,
				     V1_is_online, V1_face_update_time,
				     V1_face_file}
					<- V0_guids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13507:16,
       D_a_t_a/binary>>};
pack(13513, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13513:16,
       D_a_t_a/binary>>};
pack(13513, srv,
     {V0_rid, V0_srv_id, V0_code, V0_msg}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13513:16,
       D_a_t_a/binary>>};
pack(13514, cli, {}) -> {ok, <<2:32, 13514:16>>};
pack(13514, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13514:16,
       D_a_t_a/binary>>};
pack(13516, cli, {}) -> {ok, <<2:32, 13516:16>>};
pack(13516, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13516:16,
       D_a_t_a/binary>>};
pack(13518, cli, {}) -> {ok, <<2:32, 13518:16>>};
pack(13518, srv,
     {#guild{id = {V0_gid, V0_gsrv_id}, name = V0_name,
	     lev = V0_lev, members_num = V0_members_num,
	     members_max = V0_members_max,
	     leader_name = V0_leader_name,
	     leader_id = {V0_rid, V0_srv_id}, sign = V0_sign,
	     exp = V0_exp, day_exp = V0_day_exp,
	     apply_type = V0_apply_type, apply_lev = V0_apply_lev,
	     recruit_num = V0_recruit_num, vitality = V0_vitality,
	     apply_power = V0_apply_power},
      V0_rank_idx}) ->
    D_a_t_a = <<V0_gid:32,
		(protocol:pack(string, V0_gsrv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:8,
		V0_members_num:8, V0_members_max:8,
		(protocol:pack(string, V0_leader_name))/binary,
		V0_rid:32, (protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_sign))/binary, V0_exp:32,
		V0_day_exp:32, V0_apply_type:8, V0_apply_lev:8,
		V0_recruit_num:8, V0_vitality:32, V0_apply_power:32,
		V0_rank_idx:16/signed>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13518:16,
       D_a_t_a/binary>>};
pack(13519, cli, {}) -> {ok, <<2:32, 13519:16>>};
pack(13519, srv, {V0_members}) ->
    D_a_t_a = <<(length(V0_members)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_face:32, V1_post:8, V1_online:8,
				   V1_vip_lev:8, V1_power:32, V1_join_time:32,
				   V1_login_time:32, V1_donate:32,
				   V1_day_donate:32, V1_avatar_bid:32, V1_sex:8,
				   V1_active_lev:8, V1_day_dun_time:8,
				   V1_day_war_time:8, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #guild_member{id = {V1_rid, V1_srv_id},
						  name = V1_name, lev = V1_lev,
						  face = V1_face,
						  post = V1_post,
						  online = V1_online,
						  vip_lev = V1_vip_lev,
						  power = V1_power,
						  join_time = V1_join_time,
						  login_time = V1_login_time,
						  donate = V1_donate,
						  day_donate = V1_day_donate,
						  avatar_bid = V1_avatar_bid,
						  sex = V1_sex,
						  active_lev = V1_active_lev,
						  day_dun_time =
						      V1_day_dun_time,
						  day_war_time =
						      V1_day_war_time,
						  face_update_time =
						      V1_face_update_time,
						  face_file = V1_face_file}
					<- V0_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13519:16,
       D_a_t_a/binary>>};
pack(13520, cli, {V0_rid, V0_srv_id, V0_position}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_position:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13520:16,
       D_a_t_a/binary>>};
pack(13520, srv,
     {V0_rid, V0_srv_id, V0_position, V0_code, V0_msg}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_position:8, V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13520:16,
       D_a_t_a/binary>>};
pack(13521, cli, {V0_sign}) ->
    D_a_t_a = <<(protocol:pack(string, V0_sign))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13521:16,
       D_a_t_a/binary>>};
pack(13521, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13521:16,
       D_a_t_a/binary>>};
pack(13522, cli,
     {V0_apply_type, V0_apply_lev, V0_apply_power}) ->
    D_a_t_a = <<V0_apply_type:8, V0_apply_lev:8,
		V0_apply_power:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13522:16,
       D_a_t_a/binary>>};
pack(13522, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13522:16,
       D_a_t_a/binary>>};
pack(13523, cli, {}) -> {ok, <<2:32, 13523:16>>};
pack(13523, srv,
     {V0_donate_list, V0_boxes, V0_donate_exp,
      V0_day_send_num, V0_day_recv_num}) ->
    D_a_t_a = <<(length(V0_donate_list)):16,
		(list_to_binary([<<V1_type:8, V1_num:8>>
				 || {V1_type, V1_num}
					<- V0_donate_list]))/binary,
		(length(V0_boxes)):16,
		(list_to_binary([<<V1_box_id:8>>
				 || V1_box_id <- V0_boxes]))/binary,
		V0_donate_exp:32, V0_day_send_num:8,
		V0_day_recv_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13523:16,
       D_a_t_a/binary>>};
pack(13524, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13524:16,
       D_a_t_a/binary>>};
pack(13524, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13524:16,
       D_a_t_a/binary>>};
pack(13534, cli, {}) -> {ok, <<2:32, 13534:16>>};
pack(13534, srv, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_type:8,
				   (protocol:pack(string, V1_name))/binary,
				   V1_post:32, V1_num:8, V1_max_num:8,
				   V1_max_val:32, V1_time:32, V1_flag:8,
				   V1_msg_id:8>>
				 || {V1_id, V1_type, V1_name, V1_post, V1_num,
				     V1_max_num, V1_max_val, V1_time, V1_flag,
				     V1_msg_id}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13534:16,
       D_a_t_a/binary>>};
pack(13535, cli,
     {V0_type, V0_num, V0_msg_id, V0_loss_type}) ->
    D_a_t_a = <<V0_type:8, V0_num:16, V0_msg_id:8,
		V0_loss_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13535:16,
       D_a_t_a/binary>>};
pack(13535, srv, {V0_code, V0_msg, V0_day_send_num}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_day_send_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13535:16,
       D_a_t_a/binary>>};
pack(13536, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13536:16,
       D_a_t_a/binary>>};
pack(13536, srv,
     {V0_code, V0_msg, V0_id, V0_type, V0_val,
      V0_day_recv_num}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32,
		V0_type:8, V0_val:32, V0_day_recv_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13536:16,
       D_a_t_a/binary>>};
pack(13540, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13540:16,
       D_a_t_a/binary>>};
pack(13540, srv,
     {V0_id, V0_type, V0_name, V0_face_id,
      V0_face_update_time, V0_face_file, V0_avatar_bid,
      V0_post, V0_val, V0_list}) ->
    D_a_t_a = <<V0_id:32, V0_type:8,
		(protocol:pack(string, V0_name))/binary, V0_face_id:32,
		V0_face_update_time:32,
		(protocol:pack(string, V0_face_file))/binary,
		V0_avatar_bid:32, V0_post:32, V0_val:32,
		(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_avatar_bid:32, V1_post:32,
				   V1_val:32, V1_time:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {{V1_rid, V1_srv_id}, V1_name, V1_face_id,
				     V1_avatar_bid, V1_post, V1_val, V1_time,
				     V1_face_update_time, V1_face_file}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13540:16,
       D_a_t_a/binary>>};
pack(13541, cli, {}) -> {ok, <<2:32, 13541:16>>};
pack(13541, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13541:16,
       D_a_t_a/binary>>};
pack(13542, srv, {V0_type, V0_members}) ->
    D_a_t_a = <<V0_type:8, (length(V0_members)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_face:32, V1_post:8, V1_online:8,
				   V1_vip_lev:8, V1_power:32, V1_join_time:32,
				   V1_login_time:32, V1_donate:32,
				   V1_day_donate:32, V1_avatar_bid:32, V1_sex:8,
				   V1_active_lev:8, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #guild_member{id = {V1_rid, V1_srv_id},
						  name = V1_name, lev = V1_lev,
						  face = V1_face,
						  post = V1_post,
						  online = V1_online,
						  vip_lev = V1_vip_lev,
						  power = V1_power,
						  join_time = V1_join_time,
						  login_time = V1_login_time,
						  donate = V1_donate,
						  day_donate = V1_day_donate,
						  avatar_bid = V1_avatar_bid,
						  sex = V1_sex,
						  active_lev = V1_active_lev,
						  face_update_time =
						      V1_face_update_time,
						  face_file = V1_face_file}
					<- V0_members]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13542:16,
       D_a_t_a/binary>>};
pack(13545, cli, {}) -> {ok, <<2:32, 13545:16>>};
pack(13545, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_id:32, V1_avatar_bid:32, V1_price:32,
				   V1_num:32, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || {{V1_rid, V1_srv_id}, V1_name, V1_face_id,
				     V1_avatar_bid, V1_price, V1_num,
				     V1_face_update_time, V1_face_file}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13545:16,
       D_a_t_a/binary>>};
pack(13546, cli, {}) -> {ok, <<2:32, 13546:16>>};
pack(13546, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13546:16,
       D_a_t_a/binary>>};
pack(13558, cli, {}) -> {ok, <<2:32, 13558:16>>};
pack(13558, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13558:16,
       D_a_t_a/binary>>};
pack(13565, cli, {}) -> {ok, <<2:32, 13565:16>>};
pack(13565, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13565:16,
       D_a_t_a/binary>>};
pack(13568, cli, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13568:16,
       D_a_t_a/binary>>};
pack(13568, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13568:16,
       D_a_t_a/binary>>};
pack(13573, cli, {}) -> {ok, <<2:32, 13573:16>>};
pack(13573, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13573:16,
       D_a_t_a/binary>>};
pack(13574, cli, {V0_box_id}) ->
    D_a_t_a = <<V0_box_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13574:16,
       D_a_t_a/binary>>};
pack(13574, srv, {V0_code, V0_msg, V0_box_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_box_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13574:16,
       D_a_t_a/binary>>};
pack(13575, cli, {}) -> {ok, <<2:32, 13575:16>>};
pack(13575, srv, {V0_donate_exp}) ->
    D_a_t_a = <<V0_donate_exp:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13575:16,
       D_a_t_a/binary>>};
pack(13576, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13576:16,
       D_a_t_a/binary>>};
pack(13576, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13576:16,
       D_a_t_a/binary>>};
pack(13577, cli, {}) -> {ok, <<2:32, 13577:16>>};
pack(13577, srv, {V0_guild_log_info_list}) ->
    D_a_t_a = <<(length(V0_guild_log_info_list)):16,
		(list_to_binary([<<V1_id:8, V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   V1_type:8, V1_time:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_role_name))/binary,
				   (protocol:pack(string, V1_msg))/binary>>
				 || #guild_log_info{id = V1_id,
						    guild_id =
							{V1_gid, V1_gsrv_id},
						    type = V1_type,
						    time = V1_time,
						    role_id =
							{V1_rid, V1_srv_id},
						    role_name = V1_role_name,
						    msg = V1_msg}
					<- V0_guild_log_info_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13577:16,
       D_a_t_a/binary>>};
pack(13578, cli, {}) -> {ok, <<2:32, 13578:16>>};
pack(13578, srv, {V0_guild_log_info_list}) ->
    D_a_t_a = <<(length(V0_guild_log_info_list)):16,
		(list_to_binary([<<V1_id:8, V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   V1_type:8, V1_time:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_role_name))/binary,
				   (protocol:pack(string, V1_msg))/binary>>
				 || #guild_log_info{id = V1_id,
						    guild_id =
							{V1_gid, V1_gsrv_id},
						    type = V1_type,
						    time = V1_time,
						    role_id =
							{V1_rid, V1_srv_id},
						    role_name = V1_role_name,
						    msg = V1_msg}
					<- V0_guild_log_info_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13578:16,
       D_a_t_a/binary>>};
pack(13579, cli, {V0_type, V0_id_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_id_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {{V1_rid, V1_srv_id}}
					<- V0_id_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13579:16,
       D_a_t_a/binary>>};
pack(13579, srv, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13579:16,
       D_a_t_a/binary>>};
pack(13580, cli, {V0_content}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_content))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13580:16,
       D_a_t_a/binary>>};
pack(13580, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13580:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(13500, srv, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_sign, _B2} = protocol:string(_B1),
    {V1_apply_type, _B3} = protocol:uint8(_B2),
    {V1_apply_lev, _B4} = protocol:uint8(_B3),
    {V1_apply_power, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_name, V1_sign, V1_apply_type, V1_apply_lev,
      V1_apply_power}};
unpack(13500, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13501, srv, _B0) ->
    {V1_page, _B1} = protocol:uint16(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint16(_B2),
    {V1_name, _B4} = protocol:string(_B3),
    {ok, {V1_page, V1_flag, V1_num, V1_name}};
unpack(13501, cli, _B0) ->
    {V1_page, _B1} = protocol:uint16(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint16(_B2),
    {V1_page_total, _B4} = protocol:uint16(_B3),
    {V1_all_count, _B5} = protocol:uint16(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_guilds, _B20} = protocol:array(_B6,
				       fun (_B7) ->
					       {V2_gid, _B8} =
						   protocol:uint32(_B7),
					       {V2_gsrv_id, _B9} =
						   protocol:string(_B8),
					       {V2_name, _B10} =
						   protocol:string(_B9),
					       {V2_lev, _B11} =
						   protocol:uint8(_B10),
					       {V2_members_num, _B12} =
						   protocol:uint8(_B11),
					       {V2_members_max, _B13} =
						   protocol:uint8(_B12),
					       {V2_leader_name, _B14} =
						   protocol:string(_B13),
					       {V2_apply_type, _B15} =
						   protocol:uint8(_B14),
					       {V2_apply_lev, _B16} =
						   protocol:uint8(_B15),
					       {V2_apply_power, _B17} =
						   protocol:uint32(_B16),
					       {V2_is_apply, _B18} =
						   protocol:uint8(_B17),
					       {{V2_gid, V2_gsrv_id, V2_name,
						 V2_lev, V2_members_num,
						 V2_members_max, V2_leader_name,
						 V2_apply_type, V2_apply_lev,
						 V2_apply_power, V2_is_apply},
						_B18}
				       end),
    {ok,
     {V1_page, V1_flag, V1_num, V1_page_total, V1_all_count,
      V1_name, V1_guilds}};
unpack(13503, srv, _B0) ->
    {V1_gid, _B1} = protocol:uint32(_B0),
    {V1_gsrv_id, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_gid, V1_gsrv_id, V1_type}};
unpack(13503, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_gid, _B3} = protocol:uint32(_B2),
    {V1_gsrv_id, _B4} = protocol:string(_B3),
    {V1_is_apply, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_code, V1_msg, V1_gid, V1_gsrv_id, V1_is_apply}};
unpack(13505, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {ok, {V1_type, V1_rid, V1_srv_id}};
unpack(13505, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_code, _B4} = protocol:uint8(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok, {V1_type, V1_rid, V1_srv_id, V1_code, V1_msg}};
unpack(13507, srv, _B0) ->
    {V1_page, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_page, V1_num}};
unpack(13507, cli, _B0) ->
    {V1_page, _B1} = protocol:uint8(_B0),
    {V1_page_total, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {V1_guids, _B16} = protocol:array(_B3,
				      fun (_B4) ->
					      {V2_rid, _B5} =
						  protocol:uint32(_B4),
					      {V2_srv_id, _B6} =
						  protocol:string(_B5),
					      {V2_name, _B7} =
						  protocol:string(_B6),
					      {V2_lev, _B8} =
						  protocol:uint8(_B7),
					      {V2_face, _B9} =
						  protocol:uint32(_B8),
					      {V2_power, _B10} =
						  protocol:uint32(_B9),
					      {V2_vip_lev, _B11} =
						  protocol:uint8(_B10),
					      {V2_is_online, _B12} =
						  protocol:uint8(_B11),
					      {V2_face_update_time, _B13} =
						  protocol:uint32(_B12),
					      {V2_face_file, _B14} =
						  protocol:string(_B13),
					      {{V2_rid, V2_srv_id, V2_name,
						V2_lev, V2_face, V2_power,
						V2_vip_lev, V2_is_online,
						V2_face_update_time,
						V2_face_file},
					       _B14}
				      end),
    {ok, {V1_page, V1_page_total, V1_num, V1_guids}};
unpack(13513, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(13513, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_code, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_rid, V1_srv_id, V1_code, V1_msg}};
unpack(13514, srv, _B0) -> {ok, {}};
unpack(13514, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13516, srv, _B0) -> {ok, {}};
unpack(13516, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13518, srv, _B0) -> {ok, {}};
unpack(13518, cli, _B0) ->
    {V1_gid, _B1} = protocol:uint32(_B0),
    {V1_gsrv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_lev, _B4} = protocol:uint8(_B3),
    {V1_members_num, _B5} = protocol:uint8(_B4),
    {V1_members_max, _B6} = protocol:uint8(_B5),
    {V1_leader_name, _B7} = protocol:string(_B6),
    {V1_rid, _B8} = protocol:uint32(_B7),
    {V1_srv_id, _B9} = protocol:string(_B8),
    {V1_sign, _B10} = protocol:string(_B9),
    {V1_exp, _B11} = protocol:uint32(_B10),
    {V1_day_exp, _B12} = protocol:uint32(_B11),
    {V1_apply_type, _B13} = protocol:uint8(_B12),
    {V1_apply_lev, _B14} = protocol:uint8(_B13),
    {V1_recruit_num, _B15} = protocol:uint8(_B14),
    {V1_vitality, _B16} = protocol:uint32(_B15),
    {V1_apply_power, _B17} = protocol:uint32(_B16),
    {V1_rank_idx, _B18} = protocol:int16(_B17),
    {ok,
     {V1_gid, V1_gsrv_id, V1_name, V1_lev, V1_members_num,
      V1_members_max, V1_leader_name, V1_rid, V1_srv_id,
      V1_sign, V1_exp, V1_day_exp, V1_apply_type,
      V1_apply_lev, V1_recruit_num, V1_vitality,
      V1_apply_power, V1_rank_idx}};
unpack(13519, srv, _B0) -> {ok, {}};
unpack(13519, cli, _B0) ->
    {V1_members, _B23} = protocol:array(_B0,
					fun (_B1) ->
						{V2_rid, _B2} =
						    protocol:uint32(_B1),
						{V2_srv_id, _B3} =
						    protocol:string(_B2),
						{V2_name, _B4} =
						    protocol:string(_B3),
						{V2_lev, _B5} =
						    protocol:uint8(_B4),
						{V2_face, _B6} =
						    protocol:uint32(_B5),
						{V2_post, _B7} =
						    protocol:uint8(_B6),
						{V2_online, _B8} =
						    protocol:uint8(_B7),
						{V2_vip_lev, _B9} =
						    protocol:uint8(_B8),
						{V2_power, _B10} =
						    protocol:uint32(_B9),
						{V2_join_time, _B11} =
						    protocol:uint32(_B10),
						{V2_login_time, _B12} =
						    protocol:uint32(_B11),
						{V2_donate, _B13} =
						    protocol:uint32(_B12),
						{V2_day_donate, _B14} =
						    protocol:uint32(_B13),
						{V2_avatar_bid, _B15} =
						    protocol:uint32(_B14),
						{V2_sex, _B16} =
						    protocol:uint8(_B15),
						{V2_active_lev, _B17} =
						    protocol:uint8(_B16),
						{V2_day_dun_time, _B18} =
						    protocol:uint8(_B17),
						{V2_day_war_time, _B19} =
						    protocol:uint8(_B18),
						{V2_face_update_time, _B20} =
						    protocol:uint32(_B19),
						{V2_face_file, _B21} =
						    protocol:string(_B20),
						{{V2_rid, V2_srv_id, V2_name,
						  V2_lev, V2_face, V2_post,
						  V2_online, V2_vip_lev,
						  V2_power, V2_join_time,
						  V2_login_time, V2_donate,
						  V2_day_donate, V2_avatar_bid,
						  V2_sex, V2_active_lev,
						  V2_day_dun_time,
						  V2_day_war_time,
						  V2_face_update_time,
						  V2_face_file},
						 _B21}
					end),
    {ok, {V1_members}};
unpack(13520, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_position, _B3} = protocol:uint8(_B2),
    {ok, {V1_rid, V1_srv_id, V1_position}};
unpack(13520, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_position, _B3} = protocol:uint8(_B2),
    {V1_code, _B4} = protocol:uint8(_B3),
    {V1_msg, _B5} = protocol:string(_B4),
    {ok, {V1_rid, V1_srv_id, V1_position, V1_code, V1_msg}};
unpack(13521, srv, _B0) ->
    {V1_sign, _B1} = protocol:string(_B0), {ok, {V1_sign}};
unpack(13521, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13522, srv, _B0) ->
    {V1_apply_type, _B1} = protocol:uint8(_B0),
    {V1_apply_lev, _B2} = protocol:uint8(_B1),
    {V1_apply_power, _B3} = protocol:uint32(_B2),
    {ok, {V1_apply_type, V1_apply_lev, V1_apply_power}};
unpack(13522, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13523, srv, _B0) -> {ok, {}};
unpack(13523, cli, _B0) ->
    {V1_donate_list, _B5} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_type, _B2} =
						       protocol:uint8(_B1),
						   {V2_num, _B3} =
						       protocol:uint8(_B2),
						   {{V2_type, V2_num}, _B3}
					   end),
    {V1_boxes, _B9} = protocol:array(_B5,
				     fun (_B6) ->
					     {V2_box_id, _B7} =
						 protocol:uint8(_B6),
					     {V2_box_id, _B7}
				     end),
    {V1_donate_exp, _B10} = protocol:uint32(_B9),
    {V1_day_send_num, _B11} = protocol:uint8(_B10),
    {V1_day_recv_num, _B12} = protocol:uint8(_B11),
    {ok,
     {V1_donate_list, V1_boxes, V1_donate_exp,
      V1_day_send_num, V1_day_recv_num}};
unpack(13524, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(13524, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13534, srv, _B0) -> {ok, {}};
unpack(13534, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B14} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_id, _B3} =
						 protocol:uint32(_B2),
					     {V2_type, _B4} =
						 protocol:uint8(_B3),
					     {V2_name, _B5} =
						 protocol:string(_B4),
					     {V2_post, _B6} =
						 protocol:uint32(_B5),
					     {V2_num, _B7} =
						 protocol:uint8(_B6),
					     {V2_max_num, _B8} =
						 protocol:uint8(_B7),
					     {V2_max_val, _B9} =
						 protocol:uint32(_B8),
					     {V2_time, _B10} =
						 protocol:uint32(_B9),
					     {V2_flag, _B11} =
						 protocol:uint8(_B10),
					     {V2_msg_id, _B12} =
						 protocol:uint8(_B11),
					     {{V2_id, V2_type, V2_name, V2_post,
					       V2_num, V2_max_num, V2_max_val,
					       V2_time, V2_flag, V2_msg_id},
					      _B12}
				     end),
    {ok, {V1_type, V1_list}};
unpack(13535, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {V1_msg_id, _B3} = protocol:uint8(_B2),
    {V1_loss_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_type, V1_num, V1_msg_id, V1_loss_type}};
unpack(13535, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_day_send_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_day_send_num}};
unpack(13536, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(13536, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {V1_val, _B5} = protocol:uint32(_B4),
    {V1_day_recv_num, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_code, V1_msg, V1_id, V1_type, V1_val,
      V1_day_recv_num}};
unpack(13540, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(13540, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_face_id, _B4} = protocol:uint32(_B3),
    {V1_face_update_time, _B5} = protocol:uint32(_B4),
    {V1_face_file, _B6} = protocol:string(_B5),
    {V1_avatar_bid, _B7} = protocol:uint32(_B6),
    {V1_post, _B8} = protocol:uint32(_B7),
    {V1_val, _B9} = protocol:uint32(_B8),
    {V1_list, _B22} = protocol:array(_B9,
				     fun (_B10) ->
					     {V2_rid, _B11} =
						 protocol:uint32(_B10),
					     {V2_srv_id, _B12} =
						 protocol:string(_B11),
					     {V2_name, _B13} =
						 protocol:string(_B12),
					     {V2_face_id, _B14} =
						 protocol:uint32(_B13),
					     {V2_avatar_bid, _B15} =
						 protocol:uint32(_B14),
					     {V2_post, _B16} =
						 protocol:uint32(_B15),
					     {V2_val, _B17} =
						 protocol:uint32(_B16),
					     {V2_time, _B18} =
						 protocol:uint32(_B17),
					     {V2_face_update_time, _B19} =
						 protocol:uint32(_B18),
					     {V2_face_file, _B20} =
						 protocol:string(_B19),
					     {{V2_rid, V2_srv_id, V2_name,
					       V2_face_id, V2_avatar_bid,
					       V2_post, V2_val, V2_time,
					       V2_face_update_time,
					       V2_face_file},
					      _B20}
				     end),
    {ok,
     {V1_id, V1_type, V1_name, V1_face_id,
      V1_face_update_time, V1_face_file, V1_avatar_bid,
      V1_post, V1_val, V1_list}};
unpack(13541, srv, _B0) -> {ok, {}};
unpack(13541, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13542, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_members, _B22} = protocol:array(_B1,
					fun (_B2) ->
						{V2_rid, _B3} =
						    protocol:uint32(_B2),
						{V2_srv_id, _B4} =
						    protocol:string(_B3),
						{V2_name, _B5} =
						    protocol:string(_B4),
						{V2_lev, _B6} =
						    protocol:uint8(_B5),
						{V2_face, _B7} =
						    protocol:uint32(_B6),
						{V2_post, _B8} =
						    protocol:uint8(_B7),
						{V2_online, _B9} =
						    protocol:uint8(_B8),
						{V2_vip_lev, _B10} =
						    protocol:uint8(_B9),
						{V2_power, _B11} =
						    protocol:uint32(_B10),
						{V2_join_time, _B12} =
						    protocol:uint32(_B11),
						{V2_login_time, _B13} =
						    protocol:uint32(_B12),
						{V2_donate, _B14} =
						    protocol:uint32(_B13),
						{V2_day_donate, _B15} =
						    protocol:uint32(_B14),
						{V2_avatar_bid, _B16} =
						    protocol:uint32(_B15),
						{V2_sex, _B17} =
						    protocol:uint8(_B16),
						{V2_active_lev, _B18} =
						    protocol:uint8(_B17),
						{V2_face_update_time, _B19} =
						    protocol:uint32(_B18),
						{V2_face_file, _B20} =
						    protocol:string(_B19),
						{{V2_rid, V2_srv_id, V2_name,
						  V2_lev, V2_face, V2_post,
						  V2_online, V2_vip_lev,
						  V2_power, V2_join_time,
						  V2_login_time, V2_donate,
						  V2_day_donate, V2_avatar_bid,
						  V2_sex, V2_active_lev,
						  V2_face_update_time,
						  V2_face_file},
						 _B20}
					end),
    {ok, {V1_type, V1_members}};
unpack(13545, srv, _B0) -> {ok, {}};
unpack(13545, cli, _B0) ->
    {V1_list, _B12} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_rid, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_name, _B4} =
						 protocol:string(_B3),
					     {V2_face_id, _B5} =
						 protocol:uint32(_B4),
					     {V2_avatar_bid, _B6} =
						 protocol:uint32(_B5),
					     {V2_price, _B7} =
						 protocol:uint32(_B6),
					     {V2_num, _B8} =
						 protocol:uint32(_B7),
					     {V2_face_update_time, _B9} =
						 protocol:uint32(_B8),
					     {V2_face_file, _B10} =
						 protocol:string(_B9),
					     {{V2_rid, V2_srv_id, V2_name,
					       V2_face_id, V2_avatar_bid,
					       V2_price, V2_num,
					       V2_face_update_time,
					       V2_face_file},
					      _B10}
				     end),
    {ok, {V1_list}};
unpack(13546, srv, _B0) -> {ok, {}};
unpack(13546, cli, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint32(_B1),
					    {V2_num, _B3} =
						protocol:uint32(_B2),
					    {{V2_id, V2_num}, _B3}
				    end),
    {ok, {V1_list}};
unpack(13558, srv, _B0) -> {ok, {}};
unpack(13558, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13565, srv, _B0) -> {ok, {}};
unpack(13565, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13568, srv, _B0) ->
    {V1_name, _B1} = protocol:string(_B0), {ok, {V1_name}};
unpack(13568, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13573, srv, _B0) -> {ok, {}};
unpack(13573, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(13574, srv, _B0) ->
    {V1_box_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_box_id}};
unpack(13574, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_box_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_box_id}};
unpack(13575, srv, _B0) -> {ok, {}};
unpack(13575, cli, _B0) ->
    {V1_donate_exp, _B1} = protocol:uint32(_B0),
    {ok, {V1_donate_exp}};
unpack(13576, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(13576, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13577, srv, _B0) -> {ok, {}};
unpack(13577, cli, _B0) ->
    {V1_guild_log_info_list, _B12} = protocol:array(_B0,
						    fun (_B1) ->
							    {V2_id, _B2} =
								protocol:uint8(_B1),
							    {V2_gid, _B3} =
								protocol:uint32(_B2),
							    {V2_gsrv_id, _B4} =
								protocol:string(_B3),
							    {V2_type, _B5} =
								protocol:uint8(_B4),
							    {V2_time, _B6} =
								protocol:uint32(_B5),
							    {V2_rid, _B7} =
								protocol:uint32(_B6),
							    {V2_srv_id, _B8} =
								protocol:string(_B7),
							    {V2_role_name,
							     _B9} =
								protocol:string(_B8),
							    {V2_msg, _B10} =
								protocol:string(_B9),
							    {{V2_id, V2_gid,
							      V2_gsrv_id,
							      V2_type, V2_time,
							      V2_rid, V2_srv_id,
							      V2_role_name,
							      V2_msg},
							     _B10}
						    end),
    {ok, {V1_guild_log_info_list}};
unpack(13578, srv, _B0) -> {ok, {}};
unpack(13578, cli, _B0) ->
    {V1_guild_log_info_list, _B12} = protocol:array(_B0,
						    fun (_B1) ->
							    {V2_id, _B2} =
								protocol:uint8(_B1),
							    {V2_gid, _B3} =
								protocol:uint32(_B2),
							    {V2_gsrv_id, _B4} =
								protocol:string(_B3),
							    {V2_type, _B5} =
								protocol:uint8(_B4),
							    {V2_time, _B6} =
								protocol:uint32(_B5),
							    {V2_rid, _B7} =
								protocol:uint32(_B6),
							    {V2_srv_id, _B8} =
								protocol:string(_B7),
							    {V2_role_name,
							     _B9} =
								protocol:string(_B8),
							    {V2_msg, _B10} =
								protocol:string(_B9),
							    {{V2_id, V2_gid,
							      V2_gsrv_id,
							      V2_type, V2_time,
							      V2_rid, V2_srv_id,
							      V2_role_name,
							      V2_msg},
							     _B10}
						    end),
    {ok, {V1_guild_log_info_list}};
unpack(13579, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id_list, _B6} = protocol:array(_B1,
				       fun (_B2) ->
					       {V2_rid, _B3} =
						   protocol:uint32(_B2),
					       {V2_srv_id, _B4} =
						   protocol:string(_B3),
					       {{V2_rid, V2_srv_id}, _B4}
				       end),
    {ok, {V1_type, V1_id_list}};
unpack(13579, cli, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0), {ok, {V1_msg}};
unpack(13580, srv, _B0) ->
    {V1_content, _B1} = protocol:string(_B0),
    {ok, {V1_content}};
unpack(13580, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


