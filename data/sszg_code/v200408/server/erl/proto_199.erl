-file("src/proto/proto_199.erl", 1).

-module(proto_199).

-lager_records([{replay_partner,
		 [id, pos, bid, lev, star, break_lev, power, hp, hp_max,
		  atk, def, speed, crit_rate, crit_ratio, hit_magic,
		  dodge_magic, hurt, behurt, curt, skills, eqms,
		  artifacts, ext]},
		{replay_stat, [id, like, share, play, collect]},
		{replay_info,
		 [id, combat_type, round, sec_type, a_rid, a_name, a_lev,
		  a_face, a_power, a_formation_type, a_camp_type,
		  a_hallow, a_rank, b_rid, b_name, b_lev, b_face, b_power,
		  b_formation_type, b_camp_type, b_hallow, b_rank,
		  a_plist, b_plist, ret, time, like, share, play, collect,
		  ext]},
		{replay,
		 [id, type, combat_type, sec_type, a_rid, a_cond_val,
		  a_power, a_lev, b_rid, b_cond_val, b_power, b_lev,
		  time]},
		{replay_role, [key, list]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/replay_hall.hrl", 1).

-record(replay_role, {key = {{0, <<>>}, 0}, list = []}).

-record(replay,
	{id = 0, type = 0, combat_type = 0, sec_type = 0,
	 a_rid = 0, a_cond_val = 0, a_power = 0, a_lev = 0,
	 b_rid = 0, b_cond_val = 0, b_power = 0, b_lev = 0,
	 time = 0}).

-record(replay_info,
	{id = 0, combat_type = 0, round = 0, sec_type = 0,
	 a_rid = {0, <<>>}, a_name = <<>>, a_lev = 0, a_face = 0,
	 a_power = 0, a_formation_type = 0, a_camp_type = 0,
	 a_hallow, a_rank = 0, b_rid = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_face = 0, b_power = 0,
	 b_formation_type = 0, b_camp_type = 0, b_hallow,
	 b_rank = 0, a_plist = [], b_plist = [], ret = 0,
	 time = 0, like = 0, share = 0, play = 0, collect = 0,
	 ext = []}).

-record(replay_stat,
	{id = 0, like = 0, share = 0, play = 0, collect = 0}).

-record(replay_partner,
	{id = 0, pos = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, hp = 0, hp_max = 0, atk = 0,
	 def = 0, speed = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, hurt = 0, behurt = 0,
	 curt = 0, skills = [], eqms = [], artifacts = [],
	 ext = []}).

-file("src/proto/proto_199.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(19901, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19901:16,
       D_a_t_a/binary>>};
pack(19901, srv, {V0_type, V0_replay_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_replay_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_name))/binary,
				   V1_flag:8/signed, V1_is_collect:8/signed,
				   V1_a_face_update_time:32,
				   (protocol:pack(string,
						  V1_a_face_file))/binary,
				   V1_b_face_update_time:32,
				   (protocol:pack(string,
						  V1_b_face_file))/binary,
				   V1_id:32, V1_combat_type:8, V1_round:8,
				   V1_sec_type:32, V1_a_rid:32,
				   (protocol:pack(string, V1_a_srv_id))/binary,
				   (protocol:pack(string, V1_a_name))/binary,
				   V1_a_lev:16, V1_a_face:32, V1_a_power:32,
				   V1_a_rank:8, V1_a_formation_type:8,
				   V1_a_camp_type:8, V1_b_rid:32,
				   (protocol:pack(string, V1_b_srv_id))/binary,
				   (protocol:pack(string, V1_b_name))/binary,
				   V1_b_lev:16, V1_b_face:32, V1_b_power:32,
				   V1_b_rank:8, V1_b_formation_type:8,
				   V1_b_camp_type:8, V1_ret:8, V1_like:32,
				   V1_share:32, V1_play:32, V1_time:32,
				   (length(V1_a_plist)):16,
				   (list_to_binary([<<V2_id:32, V2_pos:8,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32, V2_hp:32,
						      V2_hp_max:32, V2_dps:32,
						      V2_be_hurt:32, V2_cure:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #replay_partner{id =
									   V2_id,
								       pos =
									   V2_pos,
								       bid =
									   V2_bid,
								       lev =
									   V2_lev,
								       star =
									   V2_star,
								       break_lev
									   =
									   V2_break_lev,
								       power =
									   V2_power,
								       hp =
									   V2_hp,
								       hp_max =
									   V2_hp_max,
								       hurt =
									   V2_dps,
								       behurt =
									   V2_be_hurt,
								       curt =
									   V2_cure,
								       ext =
									   V2_ext}
							   <- V1_a_plist]))/binary,
				   (length(V1_b_plist)):16,
				   (list_to_binary([<<V2_id:32, V2_pos:8,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32, V2_hp:32,
						      V2_hp_max:32, V2_dps:32,
						      V2_be_hurt:32, V2_cure:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #replay_partner{id =
									   V2_id,
								       pos =
									   V2_pos,
								       bid =
									   V2_bid,
								       lev =
									   V2_lev,
								       star =
									   V2_star,
								       break_lev
									   =
									   V2_break_lev,
								       power =
									   V2_power,
								       hp =
									   V2_hp,
								       hp_max =
									   V2_hp_max,
								       hurt =
									   V2_dps,
								       behurt =
									   V2_be_hurt,
								       curt =
									   V2_cure,
								       ext =
									   V2_ext}
							   <- V1_b_plist]))/binary,
				   (length(V1_ext)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32,
						      (protocol:pack(string,
								     V2_str))/binary,
						      (length(V2_ext_list)):16,
						      (list_to_binary([<<V3_ext_list_key:32,
									 V3_ext_list_val:32>>
								       || {V3_ext_list_key,
									   V3_ext_list_val}
									      <- V2_ext_list]))/binary>>
						    || {V2_key, V2_val, V2_str,
							V2_ext_list}
							   <- V1_ext]))/binary>>
				 || {V1_name, V1_flag, V1_is_collect,
				     V1_a_face_update_time, V1_a_face_file,
				     V1_b_face_update_time, V1_b_face_file,
				     #replay_info{id = V1_id,
						  combat_type = V1_combat_type,
						  round = V1_round,
						  sec_type = V1_sec_type,
						  a_rid =
						      {V1_a_rid, V1_a_srv_id},
						  a_name = V1_a_name,
						  a_lev = V1_a_lev,
						  a_face = V1_a_face,
						  a_power = V1_a_power,
						  a_rank = V1_a_rank,
						  a_formation_type =
						      V1_a_formation_type,
						  a_camp_type = V1_a_camp_type,
						  b_rid =
						      {V1_b_rid, V1_b_srv_id},
						  b_name = V1_b_name,
						  b_lev = V1_b_lev,
						  b_face = V1_b_face,
						  b_power = V1_b_power,
						  b_rank = V1_b_rank,
						  b_formation_type =
						      V1_b_formation_type,
						  b_camp_type = V1_b_camp_type,
						  ret = V1_ret, like = V1_like,
						  share = V1_share,
						  play = V1_play,
						  time = V1_time,
						  a_plist = V1_a_plist,
						  b_plist = V1_b_plist,
						  ext = V1_ext}}
					<- V0_replay_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19901:16,
       D_a_t_a/binary>>};
pack(19902, cli,
     {V0_type, V0_cond_type, V0_start, V0_num}) ->
    D_a_t_a = <<V0_type:8, V0_cond_type:32, V0_start:32,
		V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19902:16,
       D_a_t_a/binary>>};
pack(19902, srv,
     {V0_type, V0_cond_type, V0_start, V0_num, V0_len,
      V0_replay_list}) ->
    D_a_t_a = <<V0_type:8, V0_cond_type:32, V0_start:32,
		V0_num:8, V0_len:32, (length(V0_replay_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_name))/binary,
				   V1_flag:8/signed, V1_is_collect:8/signed,
				   V1_a_face_update_time:32,
				   (protocol:pack(string,
						  V1_a_face_file))/binary,
				   V1_b_face_update_time:32,
				   (protocol:pack(string,
						  V1_b_face_file))/binary,
				   V1_id:32, V1_combat_type:8, V1_round:8,
				   V1_sec_type:32, V1_a_rid:32,
				   (protocol:pack(string, V1_a_srv_id))/binary,
				   (protocol:pack(string, V1_a_name))/binary,
				   V1_a_lev:16, V1_a_face:32, V1_a_power:32,
				   V1_a_rank:8, V1_a_formation_type:8,
				   V1_a_camp_type:8, V1_b_rid:32,
				   (protocol:pack(string, V1_b_srv_id))/binary,
				   (protocol:pack(string, V1_b_name))/binary,
				   V1_b_lev:16, V1_b_face:32, V1_b_power:32,
				   V1_b_rank:8, V1_b_formation_type:8,
				   V1_b_camp_type:8, V1_ret:8, V1_like:32,
				   V1_share:32, V1_play:32, V1_time:32,
				   (length(V1_a_plist)):16,
				   (list_to_binary([<<V2_id:32, V2_pos:8,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32, V2_hp:32,
						      V2_hp_max:32, V2_dps:32,
						      V2_be_hurt:32, V2_cure:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #replay_partner{id =
									   V2_id,
								       pos =
									   V2_pos,
								       bid =
									   V2_bid,
								       lev =
									   V2_lev,
								       star =
									   V2_star,
								       break_lev
									   =
									   V2_break_lev,
								       power =
									   V2_power,
								       hp =
									   V2_hp,
								       hp_max =
									   V2_hp_max,
								       hurt =
									   V2_dps,
								       behurt =
									   V2_be_hurt,
								       curt =
									   V2_cure,
								       ext =
									   V2_ext}
							   <- V1_a_plist]))/binary,
				   (length(V1_b_plist)):16,
				   (list_to_binary([<<V2_id:32, V2_pos:8,
						      V2_bid:32, V2_lev:16,
						      V2_star:8, V2_break_lev:8,
						      V2_power:32, V2_hp:32,
						      V2_hp_max:32, V2_dps:32,
						      V2_be_hurt:32, V2_cure:32,
						      (length(V2_ext)):16,
						      (list_to_binary([<<V3_key:32,
									 V3_val:32>>
								       || {V3_key,
									   V3_val}
									      <- V2_ext]))/binary>>
						    || #replay_partner{id =
									   V2_id,
								       pos =
									   V2_pos,
								       bid =
									   V2_bid,
								       lev =
									   V2_lev,
								       star =
									   V2_star,
								       break_lev
									   =
									   V2_break_lev,
								       power =
									   V2_power,
								       hp =
									   V2_hp,
								       hp_max =
									   V2_hp_max,
								       hurt =
									   V2_dps,
								       behurt =
									   V2_be_hurt,
								       curt =
									   V2_cure,
								       ext =
									   V2_ext}
							   <- V1_b_plist]))/binary,
				   (length(V1_ext)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32,
						      (protocol:pack(string,
								     V2_str))/binary,
						      (length(V2_ext_list)):16,
						      (list_to_binary([<<V3_ext_list_key:32,
									 V3_ext_list_val:32>>
								       || {V3_ext_list_key,
									   V3_ext_list_val}
									      <- V2_ext_list]))/binary>>
						    || {V2_key, V2_val, V2_str,
							V2_ext_list}
							   <- V1_ext]))/binary>>
				 || {V1_name, V1_flag, V1_is_collect,
				     V1_a_face_update_time, V1_a_face_file,
				     V1_b_face_update_time, V1_b_face_file,
				     #replay_info{id = V1_id,
						  combat_type = V1_combat_type,
						  round = V1_round,
						  sec_type = V1_sec_type,
						  a_rid =
						      {V1_a_rid, V1_a_srv_id},
						  a_name = V1_a_name,
						  a_lev = V1_a_lev,
						  a_face = V1_a_face,
						  a_power = V1_a_power,
						  a_rank = V1_a_rank,
						  a_formation_type =
						      V1_a_formation_type,
						  a_camp_type = V1_a_camp_type,
						  b_rid =
						      {V1_b_rid, V1_b_srv_id},
						  b_name = V1_b_name,
						  b_lev = V1_b_lev,
						  b_face = V1_b_face,
						  b_power = V1_b_power,
						  b_rank = V1_b_rank,
						  b_formation_type =
						      V1_b_formation_type,
						  b_camp_type = V1_b_camp_type,
						  ret = V1_ret, like = V1_like,
						  share = V1_share,
						  play = V1_play,
						  time = V1_time,
						  a_plist = V1_a_plist,
						  b_plist = V1_b_plist,
						  ext = V1_ext}}
					<- V0_replay_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19902:16,
       D_a_t_a/binary>>};
pack(19903, cli, {V0_id, V0_srv_id, V0_combat_type}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_combat_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19903:16,
       D_a_t_a/binary>>};
pack(19903, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19903:16,
       D_a_t_a/binary>>};
pack(19904, cli,
     {V0_id, V0_type, V0_srv_id, V0_combat_type}) ->
    D_a_t_a = <<V0_id:32, V0_type:8,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_combat_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19904:16,
       D_a_t_a/binary>>};
pack(19904, srv, {V0_code, V0_msg, V0_id, V0_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19904:16,
       D_a_t_a/binary>>};
pack(19905, cli,
     {V0_id, V0_channel, V0_srv_id, V0_combat_type}) ->
    D_a_t_a = <<V0_id:32, V0_channel:16,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_combat_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19905:16,
       D_a_t_a/binary>>};
pack(19905, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19905:16,
       D_a_t_a/binary>>};
pack(19906, cli, {}) -> {ok, <<2:32, 19906:16>>};
pack(19906, srv, {V0_like}) ->
    D_a_t_a = <<V0_like:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19906:16,
       D_a_t_a/binary>>};
pack(19907, cli,
     {V0_replay_id, V0_partner_id, V0_type, V0_srv_id,
      V0_combat_type}) ->
    D_a_t_a = <<V0_replay_id:32, V0_partner_id:32,
		V0_type:8, (protocol:pack(string, V0_srv_id))/binary,
		V0_combat_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19907:16,
       D_a_t_a/binary>>};
pack(19907, srv,
     {V0_replay_id, V0_partner_id, V0_type,
      #replay_partner{pos = V0_pos, bid = V0_bid,
		      lev = V0_lev, star = V0_star, break_lev = V0_break_lev,
		      power = V0_power, hp = V0_now_hp, hp_max = V0_hp,
		      atk = V0_atk, def = V0_def, speed = V0_speed,
		      crit_rate = V0_crit_rate, crit_ratio = V0_crit_ratio,
		      hit_magic = V0_hit_magic, dodge_magic = V0_dodge_magic,
		      hurt = V0_dps, behurt = V0_behurt, curt = V0_cure,
		      skills = V0_skills, eqms = V0_eqms,
		      artifacts = V0_artifacts, ext = V0_ext}}) ->
    D_a_t_a = <<V0_replay_id:32, V0_partner_id:32,
		V0_type:8, V0_pos:8, V0_bid:32, V0_lev:16, V0_star:8,
		V0_break_lev:8, V0_power:32, V0_now_hp:32, V0_hp:32,
		V0_atk:32, V0_def:32, V0_speed:32, V0_crit_rate:32,
		V0_crit_ratio:32, V0_hit_magic:32, V0_dodge_magic:32,
		V0_dps:32, V0_behurt:32, V0_cure:32,
		(length(V0_skills)):16,
		(list_to_binary([<<V1_pos:8, V1_skill_bid:32>>
				 || {V1_pos, V1_skill_bid}
					<- V0_skills]))/binary,
		(length(V0_eqms)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_type:32>>
				 || {V1_id, V1_base_id, V1_type}
					<- V0_eqms]))/binary,
		(length(V0_artifacts)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32,
				   V1_artifact_pos:8, V1_enchant:32,
				   (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary>>
				 || {V1_id, V1_base_id, V1_artifact_pos,
				     V1_enchant, V1_attr, V1_extra_attr,
				     V1_extra}
					<- V0_artifacts]))/binary,
		(length(V0_ext)):16,
		(list_to_binary([<<V1_key:32, V1_val:32>>
				 || {V1_key, V1_val} <- V0_ext]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19907:16,
       D_a_t_a/binary>>};
pack(19908, cli,
     {V0_hall_srv_id, V0_replay_id, V0_srv_id, V0_type,
      V0_channel}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_hall_srv_id))/binary,
		V0_replay_id:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_type:8,
		V0_channel:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19908:16,
       D_a_t_a/binary>>};
pack(19908, srv,
     {V0_type, V0_channel,
      {V0_name, V0_flag, V0_is_collect, V0_a_face_update_time,
       V0_a_face_file, V0_b_face_update_time, V0_b_face_file,
       #replay_info{id = V0_id, combat_type = V0_combat_type,
		    round = V0_round, sec_type = V0_sec_type,
		    a_rid = {V0_a_rid, V0_a_srv_id}, a_name = V0_a_name,
		    a_lev = V0_a_lev, a_face = V0_a_face,
		    a_power = V0_a_power, a_rank = V0_a_rank,
		    a_formation_type = V0_a_formation_type,
		    a_camp_type = V0_a_camp_type,
		    b_rid = {V0_b_rid, V0_b_srv_id}, b_name = V0_b_name,
		    b_lev = V0_b_lev, b_face = V0_b_face,
		    b_power = V0_b_power, b_rank = V0_b_rank,
		    b_formation_type = V0_b_formation_type,
		    b_camp_type = V0_b_camp_type, ret = V0_ret,
		    like = V0_like, share = V0_share, play = V0_play,
		    time = V0_time, a_plist = V0_a_plist,
		    b_plist = V0_b_plist, ext = V0_ext}}}) ->
    D_a_t_a = <<V0_type:8, V0_channel:16,
		(protocol:pack(string, V0_name))/binary,
		V0_flag:8/signed, V0_is_collect:8/signed,
		V0_a_face_update_time:32,
		(protocol:pack(string, V0_a_face_file))/binary,
		V0_b_face_update_time:32,
		(protocol:pack(string, V0_b_face_file))/binary,
		V0_id:32, V0_combat_type:8, V0_round:8, V0_sec_type:32,
		V0_a_rid:32,
		(protocol:pack(string, V0_a_srv_id))/binary,
		(protocol:pack(string, V0_a_name))/binary, V0_a_lev:16,
		V0_a_face:32, V0_a_power:32, V0_a_rank:8,
		V0_a_formation_type:8, V0_a_camp_type:8, V0_b_rid:32,
		(protocol:pack(string, V0_b_srv_id))/binary,
		(protocol:pack(string, V0_b_name))/binary, V0_b_lev:16,
		V0_b_face:32, V0_b_power:32, V0_b_rank:8,
		V0_b_formation_type:8, V0_b_camp_type:8, V0_ret:8,
		V0_like:32, V0_share:32, V0_play:32, V0_time:32,
		(length(V0_a_plist)):16,
		(list_to_binary([<<V1_id:32, V1_pos:8, V1_bid:32,
				   V1_lev:16, V1_star:8, V1_break_lev:8,
				   V1_power:32, V1_hp:32, V1_hp_max:32,
				   V1_dps:32, V1_be_hurt:32, V1_cure:32,
				   (length(V1_ext)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext]))/binary>>
				 || #replay_partner{id = V1_id, pos = V1_pos,
						    bid = V1_bid, lev = V1_lev,
						    star = V1_star,
						    break_lev = V1_break_lev,
						    power = V1_power,
						    hp = V1_hp,
						    hp_max = V1_hp_max,
						    hurt = V1_dps,
						    behurt = V1_be_hurt,
						    curt = V1_cure,
						    ext = V1_ext}
					<- V0_a_plist]))/binary,
		(length(V0_b_plist)):16,
		(list_to_binary([<<V1_id:32, V1_pos:8, V1_bid:32,
				   V1_lev:16, V1_star:8, V1_break_lev:8,
				   V1_power:32, V1_hp:32, V1_hp_max:32,
				   V1_dps:32, V1_be_hurt:32, V1_cure:32,
				   (length(V1_ext)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext]))/binary>>
				 || #replay_partner{id = V1_id, pos = V1_pos,
						    bid = V1_bid, lev = V1_lev,
						    star = V1_star,
						    break_lev = V1_break_lev,
						    power = V1_power,
						    hp = V1_hp,
						    hp_max = V1_hp_max,
						    hurt = V1_dps,
						    behurt = V1_be_hurt,
						    curt = V1_cure,
						    ext = V1_ext}
					<- V0_b_plist]))/binary,
		(length(V0_ext)):16,
		(list_to_binary([<<V1_key:32, V1_val:32,
				   (protocol:pack(string, V1_str))/binary,
				   (length(V1_ext_list)):16,
				   (list_to_binary([<<V2_ext_list_key:32,
						      V2_ext_list_val:32>>
						    || {V2_ext_list_key,
							V2_ext_list_val}
							   <- V1_ext_list]))/binary>>
				 || {V1_key, V1_val, V1_str, V1_ext_list}
					<- V0_ext]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 19908:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(19901, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(19901, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_replay_list, _B89} = protocol:array(_B1,
					    fun (_B2) ->
						    {V2_name, _B3} =
							protocol:string(_B2),
						    {V2_flag, _B4} =
							protocol:int8(_B3),
						    {V2_is_collect, _B5} =
							protocol:int8(_B4),
						    {V2_a_face_update_time,
						     _B6} =
							protocol:uint32(_B5),
						    {V2_a_face_file, _B7} =
							protocol:string(_B6),
						    {V2_b_face_update_time,
						     _B8} =
							protocol:uint32(_B7),
						    {V2_b_face_file, _B9} =
							protocol:string(_B8),
						    {V2_id, _B10} =
							protocol:uint32(_B9),
						    {V2_combat_type, _B11} =
							protocol:uint8(_B10),
						    {V2_round, _B12} =
							protocol:uint8(_B11),
						    {V2_sec_type, _B13} =
							protocol:uint32(_B12),
						    {V2_a_rid, _B14} =
							protocol:uint32(_B13),
						    {V2_a_srv_id, _B15} =
							protocol:string(_B14),
						    {V2_a_name, _B16} =
							protocol:string(_B15),
						    {V2_a_lev, _B17} =
							protocol:uint16(_B16),
						    {V2_a_face, _B18} =
							protocol:uint32(_B17),
						    {V2_a_power, _B19} =
							protocol:uint32(_B18),
						    {V2_a_rank, _B20} =
							protocol:uint8(_B19),
						    {V2_a_formation_type,
						     _B21} =
							protocol:uint8(_B20),
						    {V2_a_camp_type, _B22} =
							protocol:uint8(_B21),
						    {V2_b_rid, _B23} =
							protocol:uint32(_B22),
						    {V2_b_srv_id, _B24} =
							protocol:string(_B23),
						    {V2_b_name, _B25} =
							protocol:string(_B24),
						    {V2_b_lev, _B26} =
							protocol:uint16(_B25),
						    {V2_b_face, _B27} =
							protocol:uint32(_B26),
						    {V2_b_power, _B28} =
							protocol:uint32(_B27),
						    {V2_b_rank, _B29} =
							protocol:uint8(_B28),
						    {V2_b_formation_type,
						     _B30} =
							protocol:uint8(_B29),
						    {V2_b_camp_type, _B31} =
							protocol:uint8(_B30),
						    {V2_ret, _B32} =
							protocol:uint8(_B31),
						    {V2_like, _B33} =
							protocol:uint32(_B32),
						    {V2_share, _B34} =
							protocol:uint32(_B33),
						    {V2_play, _B35} =
							protocol:uint32(_B34),
						    {V2_time, _B36} =
							protocol:uint32(_B35),
						    {V2_a_plist, _B56} =
							protocol:array(_B36,
								       fun
									 (_B37) ->
									     {V3_id,
									      _B38} =
										 protocol:uint32(_B37),
									     {V3_pos,
									      _B39} =
										 protocol:uint8(_B38),
									     {V3_bid,
									      _B40} =
										 protocol:uint32(_B39),
									     {V3_lev,
									      _B41} =
										 protocol:uint16(_B40),
									     {V3_star,
									      _B42} =
										 protocol:uint8(_B41),
									     {V3_break_lev,
									      _B43} =
										 protocol:uint8(_B42),
									     {V3_power,
									      _B44} =
										 protocol:uint32(_B43),
									     {V3_hp,
									      _B45} =
										 protocol:uint32(_B44),
									     {V3_hp_max,
									      _B46} =
										 protocol:uint32(_B45),
									     {V3_dps,
									      _B47} =
										 protocol:uint32(_B46),
									     {V3_be_hurt,
									      _B48} =
										 protocol:uint32(_B47),
									     {V3_cure,
									      _B49} =
										 protocol:uint32(_B48),
									     {V3_ext,
									      _B54} =
										 protocol:array(_B49,
												fun
												  (_B50) ->
												      {V4_key,
												       _B51} =
													  protocol:uint32(_B50),
												      {V4_val,
												       _B52} =
													  protocol:uint32(_B51),
												      {{V4_key,
													V4_val},
												       _B52}
												end),
									     {{V3_id,
									       V3_pos,
									       V3_bid,
									       V3_lev,
									       V3_star,
									       V3_break_lev,
									       V3_power,
									       V3_hp,
									       V3_hp_max,
									       V3_dps,
									       V3_be_hurt,
									       V3_cure,
									       V3_ext},
									      _B54}
								       end),
						    {V2_b_plist, _B76} =
							protocol:array(_B56,
								       fun
									 (_B57) ->
									     {V3_id,
									      _B58} =
										 protocol:uint32(_B57),
									     {V3_pos,
									      _B59} =
										 protocol:uint8(_B58),
									     {V3_bid,
									      _B60} =
										 protocol:uint32(_B59),
									     {V3_lev,
									      _B61} =
										 protocol:uint16(_B60),
									     {V3_star,
									      _B62} =
										 protocol:uint8(_B61),
									     {V3_break_lev,
									      _B63} =
										 protocol:uint8(_B62),
									     {V3_power,
									      _B64} =
										 protocol:uint32(_B63),
									     {V3_hp,
									      _B65} =
										 protocol:uint32(_B64),
									     {V3_hp_max,
									      _B66} =
										 protocol:uint32(_B65),
									     {V3_dps,
									      _B67} =
										 protocol:uint32(_B66),
									     {V3_be_hurt,
									      _B68} =
										 protocol:uint32(_B67),
									     {V3_cure,
									      _B69} =
										 protocol:uint32(_B68),
									     {V3_ext,
									      _B74} =
										 protocol:array(_B69,
												fun
												  (_B70) ->
												      {V4_key,
												       _B71} =
													  protocol:uint32(_B70),
												      {V4_val,
												       _B72} =
													  protocol:uint32(_B71),
												      {{V4_key,
													V4_val},
												       _B72}
												end),
									     {{V3_id,
									       V3_pos,
									       V3_bid,
									       V3_lev,
									       V3_star,
									       V3_break_lev,
									       V3_power,
									       V3_hp,
									       V3_hp_max,
									       V3_dps,
									       V3_be_hurt,
									       V3_cure,
									       V3_ext},
									      _B74}
								       end),
						    {V2_ext, _B87} =
							protocol:array(_B76,
								       fun
									 (_B77) ->
									     {V3_key,
									      _B78} =
										 protocol:uint32(_B77),
									     {V3_val,
									      _B79} =
										 protocol:uint32(_B78),
									     {V3_str,
									      _B80} =
										 protocol:string(_B79),
									     {V3_ext_list,
									      _B85} =
										 protocol:array(_B80,
												fun
												  (_B81) ->
												      {V4_ext_list_key,
												       _B82} =
													  protocol:uint32(_B81),
												      {V4_ext_list_val,
												       _B83} =
													  protocol:uint32(_B82),
												      {{V4_ext_list_key,
													V4_ext_list_val},
												       _B83}
												end),
									     {{V3_key,
									       V3_val,
									       V3_str,
									       V3_ext_list},
									      _B85}
								       end),
						    {{V2_name, V2_flag,
						      V2_is_collect,
						      V2_a_face_update_time,
						      V2_a_face_file,
						      V2_b_face_update_time,
						      V2_b_face_file, V2_id,
						      V2_combat_type, V2_round,
						      V2_sec_type, V2_a_rid,
						      V2_a_srv_id, V2_a_name,
						      V2_a_lev, V2_a_face,
						      V2_a_power, V2_a_rank,
						      V2_a_formation_type,
						      V2_a_camp_type, V2_b_rid,
						      V2_b_srv_id, V2_b_name,
						      V2_b_lev, V2_b_face,
						      V2_b_power, V2_b_rank,
						      V2_b_formation_type,
						      V2_b_camp_type, V2_ret,
						      V2_like, V2_share,
						      V2_play, V2_time,
						      V2_a_plist, V2_b_plist,
						      V2_ext},
						     _B87}
					    end),
    {ok, {V1_type, V1_replay_list}};
unpack(19902, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_cond_type, _B2} = protocol:uint32(_B1),
    {V1_start, _B3} = protocol:uint32(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {ok, {V1_type, V1_cond_type, V1_start, V1_num}};
unpack(19902, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_cond_type, _B2} = protocol:uint32(_B1),
    {V1_start, _B3} = protocol:uint32(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {V1_len, _B5} = protocol:uint32(_B4),
    {V1_replay_list, _B93} = protocol:array(_B5,
					    fun (_B6) ->
						    {V2_name, _B7} =
							protocol:string(_B6),
						    {V2_flag, _B8} =
							protocol:int8(_B7),
						    {V2_is_collect, _B9} =
							protocol:int8(_B8),
						    {V2_a_face_update_time,
						     _B10} =
							protocol:uint32(_B9),
						    {V2_a_face_file, _B11} =
							protocol:string(_B10),
						    {V2_b_face_update_time,
						     _B12} =
							protocol:uint32(_B11),
						    {V2_b_face_file, _B13} =
							protocol:string(_B12),
						    {V2_id, _B14} =
							protocol:uint32(_B13),
						    {V2_combat_type, _B15} =
							protocol:uint8(_B14),
						    {V2_round, _B16} =
							protocol:uint8(_B15),
						    {V2_sec_type, _B17} =
							protocol:uint32(_B16),
						    {V2_a_rid, _B18} =
							protocol:uint32(_B17),
						    {V2_a_srv_id, _B19} =
							protocol:string(_B18),
						    {V2_a_name, _B20} =
							protocol:string(_B19),
						    {V2_a_lev, _B21} =
							protocol:uint16(_B20),
						    {V2_a_face, _B22} =
							protocol:uint32(_B21),
						    {V2_a_power, _B23} =
							protocol:uint32(_B22),
						    {V2_a_rank, _B24} =
							protocol:uint8(_B23),
						    {V2_a_formation_type,
						     _B25} =
							protocol:uint8(_B24),
						    {V2_a_camp_type, _B26} =
							protocol:uint8(_B25),
						    {V2_b_rid, _B27} =
							protocol:uint32(_B26),
						    {V2_b_srv_id, _B28} =
							protocol:string(_B27),
						    {V2_b_name, _B29} =
							protocol:string(_B28),
						    {V2_b_lev, _B30} =
							protocol:uint16(_B29),
						    {V2_b_face, _B31} =
							protocol:uint32(_B30),
						    {V2_b_power, _B32} =
							protocol:uint32(_B31),
						    {V2_b_rank, _B33} =
							protocol:uint8(_B32),
						    {V2_b_formation_type,
						     _B34} =
							protocol:uint8(_B33),
						    {V2_b_camp_type, _B35} =
							protocol:uint8(_B34),
						    {V2_ret, _B36} =
							protocol:uint8(_B35),
						    {V2_like, _B37} =
							protocol:uint32(_B36),
						    {V2_share, _B38} =
							protocol:uint32(_B37),
						    {V2_play, _B39} =
							protocol:uint32(_B38),
						    {V2_time, _B40} =
							protocol:uint32(_B39),
						    {V2_a_plist, _B60} =
							protocol:array(_B40,
								       fun
									 (_B41) ->
									     {V3_id,
									      _B42} =
										 protocol:uint32(_B41),
									     {V3_pos,
									      _B43} =
										 protocol:uint8(_B42),
									     {V3_bid,
									      _B44} =
										 protocol:uint32(_B43),
									     {V3_lev,
									      _B45} =
										 protocol:uint16(_B44),
									     {V3_star,
									      _B46} =
										 protocol:uint8(_B45),
									     {V3_break_lev,
									      _B47} =
										 protocol:uint8(_B46),
									     {V3_power,
									      _B48} =
										 protocol:uint32(_B47),
									     {V3_hp,
									      _B49} =
										 protocol:uint32(_B48),
									     {V3_hp_max,
									      _B50} =
										 protocol:uint32(_B49),
									     {V3_dps,
									      _B51} =
										 protocol:uint32(_B50),
									     {V3_be_hurt,
									      _B52} =
										 protocol:uint32(_B51),
									     {V3_cure,
									      _B53} =
										 protocol:uint32(_B52),
									     {V3_ext,
									      _B58} =
										 protocol:array(_B53,
												fun
												  (_B54) ->
												      {V4_key,
												       _B55} =
													  protocol:uint32(_B54),
												      {V4_val,
												       _B56} =
													  protocol:uint32(_B55),
												      {{V4_key,
													V4_val},
												       _B56}
												end),
									     {{V3_id,
									       V3_pos,
									       V3_bid,
									       V3_lev,
									       V3_star,
									       V3_break_lev,
									       V3_power,
									       V3_hp,
									       V3_hp_max,
									       V3_dps,
									       V3_be_hurt,
									       V3_cure,
									       V3_ext},
									      _B58}
								       end),
						    {V2_b_plist, _B80} =
							protocol:array(_B60,
								       fun
									 (_B61) ->
									     {V3_id,
									      _B62} =
										 protocol:uint32(_B61),
									     {V3_pos,
									      _B63} =
										 protocol:uint8(_B62),
									     {V3_bid,
									      _B64} =
										 protocol:uint32(_B63),
									     {V3_lev,
									      _B65} =
										 protocol:uint16(_B64),
									     {V3_star,
									      _B66} =
										 protocol:uint8(_B65),
									     {V3_break_lev,
									      _B67} =
										 protocol:uint8(_B66),
									     {V3_power,
									      _B68} =
										 protocol:uint32(_B67),
									     {V3_hp,
									      _B69} =
										 protocol:uint32(_B68),
									     {V3_hp_max,
									      _B70} =
										 protocol:uint32(_B69),
									     {V3_dps,
									      _B71} =
										 protocol:uint32(_B70),
									     {V3_be_hurt,
									      _B72} =
										 protocol:uint32(_B71),
									     {V3_cure,
									      _B73} =
										 protocol:uint32(_B72),
									     {V3_ext,
									      _B78} =
										 protocol:array(_B73,
												fun
												  (_B74) ->
												      {V4_key,
												       _B75} =
													  protocol:uint32(_B74),
												      {V4_val,
												       _B76} =
													  protocol:uint32(_B75),
												      {{V4_key,
													V4_val},
												       _B76}
												end),
									     {{V3_id,
									       V3_pos,
									       V3_bid,
									       V3_lev,
									       V3_star,
									       V3_break_lev,
									       V3_power,
									       V3_hp,
									       V3_hp_max,
									       V3_dps,
									       V3_be_hurt,
									       V3_cure,
									       V3_ext},
									      _B78}
								       end),
						    {V2_ext, _B91} =
							protocol:array(_B80,
								       fun
									 (_B81) ->
									     {V3_key,
									      _B82} =
										 protocol:uint32(_B81),
									     {V3_val,
									      _B83} =
										 protocol:uint32(_B82),
									     {V3_str,
									      _B84} =
										 protocol:string(_B83),
									     {V3_ext_list,
									      _B89} =
										 protocol:array(_B84,
												fun
												  (_B85) ->
												      {V4_ext_list_key,
												       _B86} =
													  protocol:uint32(_B85),
												      {V4_ext_list_val,
												       _B87} =
													  protocol:uint32(_B86),
												      {{V4_ext_list_key,
													V4_ext_list_val},
												       _B87}
												end),
									     {{V3_key,
									       V3_val,
									       V3_str,
									       V3_ext_list},
									      _B89}
								       end),
						    {{V2_name, V2_flag,
						      V2_is_collect,
						      V2_a_face_update_time,
						      V2_a_face_file,
						      V2_b_face_update_time,
						      V2_b_face_file, V2_id,
						      V2_combat_type, V2_round,
						      V2_sec_type, V2_a_rid,
						      V2_a_srv_id, V2_a_name,
						      V2_a_lev, V2_a_face,
						      V2_a_power, V2_a_rank,
						      V2_a_formation_type,
						      V2_a_camp_type, V2_b_rid,
						      V2_b_srv_id, V2_b_name,
						      V2_b_lev, V2_b_face,
						      V2_b_power, V2_b_rank,
						      V2_b_formation_type,
						      V2_b_camp_type, V2_ret,
						      V2_like, V2_share,
						      V2_play, V2_time,
						      V2_a_plist, V2_b_plist,
						      V2_ext},
						     _B91}
					    end),
    {ok,
     {V1_type, V1_cond_type, V1_start, V1_num, V1_len,
      V1_replay_list}};
unpack(19903, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_combat_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_srv_id, V1_combat_type}};
unpack(19903, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(19904, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_combat_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_type, V1_srv_id, V1_combat_type}};
unpack(19904, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_id, V1_type}};
unpack(19905, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_channel, _B2} = protocol:uint16(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_combat_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_id, V1_channel, V1_srv_id, V1_combat_type}};
unpack(19905, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(19906, srv, _B0) -> {ok, {}};
unpack(19906, cli, _B0) ->
    {V1_like, _B1} = protocol:uint8(_B0), {ok, {V1_like}};
unpack(19907, srv, _B0) ->
    {V1_replay_id, _B1} = protocol:uint32(_B0),
    {V1_partner_id, _B2} = protocol:uint32(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_srv_id, _B4} = protocol:string(_B3),
    {V1_combat_type, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_replay_id, V1_partner_id, V1_type, V1_srv_id,
      V1_combat_type}};
unpack(19907, cli, _B0) ->
    {V1_replay_id, _B1} = protocol:uint32(_B0),
    {V1_partner_id, _B2} = protocol:uint32(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_pos, _B4} = protocol:uint8(_B3),
    {V1_bid, _B5} = protocol:uint32(_B4),
    {V1_lev, _B6} = protocol:uint16(_B5),
    {V1_star, _B7} = protocol:uint8(_B6),
    {V1_break_lev, _B8} = protocol:uint8(_B7),
    {V1_power, _B9} = protocol:uint32(_B8),
    {V1_now_hp, _B10} = protocol:uint32(_B9),
    {V1_hp, _B11} = protocol:uint32(_B10),
    {V1_atk, _B12} = protocol:uint32(_B11),
    {V1_def, _B13} = protocol:uint32(_B12),
    {V1_speed, _B14} = protocol:uint32(_B13),
    {V1_crit_rate, _B15} = protocol:uint32(_B14),
    {V1_crit_ratio, _B16} = protocol:uint32(_B15),
    {V1_hit_magic, _B17} = protocol:uint32(_B16),
    {V1_dodge_magic, _B18} = protocol:uint32(_B17),
    {V1_dps, _B19} = protocol:uint32(_B18),
    {V1_behurt, _B20} = protocol:uint32(_B19),
    {V1_cure, _B21} = protocol:uint32(_B20),
    {V1_skills, _B26} = protocol:array(_B21,
				       fun (_B22) ->
					       {V2_pos, _B23} =
						   protocol:uint8(_B22),
					       {V2_skill_bid, _B24} =
						   protocol:uint32(_B23),
					       {{V2_pos, V2_skill_bid}, _B24}
				       end),
    {V1_eqms, _B32} = protocol:array(_B26,
				     fun (_B27) ->
					     {V2_id, _B28} =
						 protocol:uint32(_B27),
					     {V2_base_id, _B29} =
						 protocol:uint32(_B28),
					     {V2_type, _B30} =
						 protocol:uint32(_B29),
					     {{V2_id, V2_base_id, V2_type},
					      _B30}
				     end),
    {V1_artifacts, _B54} = protocol:array(_B32,
					  fun (_B33) ->
						  {V2_id, _B34} =
						      protocol:uint32(_B33),
						  {V2_base_id, _B35} =
						      protocol:uint32(_B34),
						  {V2_artifact_pos, _B36} =
						      protocol:uint8(_B35),
						  {V2_enchant, _B37} =
						      protocol:uint32(_B36),
						  {V2_attr, _B42} =
						      protocol:array(_B37,
								     fun
								       (_B38) ->
									   {V3_attr_id,
									    _B39} =
									       protocol:uint32(_B38),
									   {V3_attr_val,
									    _B40} =
									       protocol:uint32(_B39),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B40}
								     end),
						  {V2_extra_attr, _B47} =
						      protocol:array(_B42,
								     fun
								       (_B43) ->
									   {V3_attr_id,
									    _B44} =
									       protocol:uint32(_B43),
									   {V3_attr_val,
									    _B45} =
									       protocol:uint32(_B44),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B45}
								     end),
						  {V2_extra, _B52} =
						      protocol:array(_B47,
								     fun
								       (_B48) ->
									   {V3_extra_k,
									    _B49} =
									       protocol:uint32(_B48),
									   {V3_extra_v,
									    _B50} =
									       protocol:uint32(_B49),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B50}
								     end),
						  {{V2_id, V2_base_id,
						    V2_artifact_pos, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_extra},
						   _B52}
					  end),
    {V1_ext, _B59} = protocol:array(_B54,
				    fun (_B55) ->
					    {V2_key, _B56} =
						protocol:uint32(_B55),
					    {V2_val, _B57} =
						protocol:uint32(_B56),
					    {{V2_key, V2_val}, _B57}
				    end),
    {ok,
     {V1_replay_id, V1_partner_id, V1_type, V1_pos, V1_bid,
      V1_lev, V1_star, V1_break_lev, V1_power, V1_now_hp,
      V1_hp, V1_atk, V1_def, V1_speed, V1_crit_rate,
      V1_crit_ratio, V1_hit_magic, V1_dodge_magic, V1_dps,
      V1_behurt, V1_cure, V1_skills, V1_eqms, V1_artifacts,
      V1_ext}};
unpack(19908, srv, _B0) ->
    {V1_hall_srv_id, _B1} = protocol:string(_B0),
    {V1_replay_id, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {V1_channel, _B5} = protocol:uint16(_B4),
    {ok,
     {V1_hall_srv_id, V1_replay_id, V1_srv_id, V1_type,
      V1_channel}};
unpack(19908, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_channel, _B2} = protocol:uint16(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_flag, _B4} = protocol:int8(_B3),
    {V1_is_collect, _B5} = protocol:int8(_B4),
    {V1_a_face_update_time, _B6} = protocol:uint32(_B5),
    {V1_a_face_file, _B7} = protocol:string(_B6),
    {V1_b_face_update_time, _B8} = protocol:uint32(_B7),
    {V1_b_face_file, _B9} = protocol:string(_B8),
    {V1_replay_info, _B10} = protocol:rec(_B9),
    {ok,
     {V1_type, V1_channel, V1_name, V1_flag, V1_is_collect,
      V1_a_face_update_time, V1_a_face_file,
      V1_b_face_update_time, V1_b_face_file, V1_replay_info}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


