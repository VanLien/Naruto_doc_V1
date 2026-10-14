-file("src/proto/proto_240.erl", 1).

-module(proto_240).

-lager_records([{escort_pos_info,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp]},
		{escort_plunder_log,
		 [id, quality, rid, name, guild_name, face, lev, sex,
		  power, avatar_id, ret, atk_ret, items, time, atk_count,
		  help_count, help_time, formation_type, formation_lev,
		  pos_info, combat_role, replay_id, ext]},
		{escort_plunder_role, [id, atk_logs, def_logs]},
		{escort,
		 [id, name, gid, quality, end_time, plunder_lists,
		  combat_lists, gname, power]},
		{m_escort, [ver, status, quality, end_time, five_data]},
		{formation_attr_data,
		 [type, lev, expend, attr_1, attr_2, attr_3, attr_4,
		  attr_5, attr_6, attr_7, attr_8, attr_9, power]},
		{formation_data,
		 [type, pos, need_lev, name, need_items, restrain_s,
		  restrain_w]},
		{formation_info_p, [id, name, power, pos_info]},
		{pk_formation_info,
		 [id, name, formation, ffor_target, power, is_ready,
		  guild_name, lev, face_id, pid]},
		{formation_fight_info, [pos, fight_pos, id]},
		{formation_base_p,
		 [id, lev, exp, pos_info, formation_list, power,
		  hallows_id, all_lineups]},
		{formation_pos, [pos, id]},
		{formation_lineup,
		 [id, name, power, pos_info, max_power, type,
		  hallows_id]},
		{formation_sys, [id, type, pos_info, hallows_id]},
		{m_formation,
		 [ver, list, use_lineup, all_lineups, sys_formations]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/formation.hrl", 1).

-record(m_formation,
	{ver = 1, list = [], use_lineup = 1, all_lineups = [],
	 sys_formations = []}).

-record(formation_sys,
	{id = 1, type = 1, pos_info = [], hallows_id = 0}).

-record(formation_lineup,
	{id = 1, name = <<>>, power = 0, pos_info = [],
	 max_power = 0, type = 1, hallows_id = 0}).

-record(formation_pos, {pos, id = 0}).

-record(formation_base_p,
	{id, lev, exp, pos_info, formation_list, power,
	 hallows_id = 0, all_lineups}).

-record(formation_fight_info, {pos, fight_pos, id = 0}).

-record(pk_formation_info,
	{id, name, formation, ffor_target, power,
	 is_ready = false, guild_name = <<>>, lev = 0, face_id,
	 pid = none}).

-record(formation_info_p,
	{id = 0, name = <<>>, power = 0, pos_info = []}).

-record(formation_data,
	{type, pos, need_lev, name, need_items = [],
	 restrain_s = [], restrain_w = []}).

-record(formation_attr_data,
	{type, lev, expend = [], attr_1 = [], attr_2 = [],
	 attr_3 = [], attr_4 = [], attr_5 = [], attr_6 = [],
	 attr_7 = [], attr_8 = [], attr_9 = [], power}).

-file("src/proto/proto_240.erl", 16).

-file("inc/escort.hrl", 1).

-record(m_escort,
	{ver = 1  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 quality = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 five_data = []  :: list()}).

-record(escort,
	{id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: non_neg_integer(),
	 gid = {0, <<>>}  :: tuple(),
	 quality = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 plunder_lists = []  :: non_neg_integer(),
	 combat_lists = []  :: non_neg_integer(),
	 gname = <<>>  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(escort_plunder_role,
	{id = {0, <<>>}, atk_logs = [], def_logs = []}).

-record(escort_plunder_log,
	{id = 0, quality = 0, rid = {0, <<>>}, name = <<>>,
	 guild_name = <<>>, face = 0, lev = 0, sex = 0,
	 power = 0, avatar_id = 0, ret = 0, atk_ret = 0,
	 items = [], time = 0, atk_count = 0, help_count = 0,
	 help_time = 0, formation_type = 0, formation_lev = 0,
	 pos_info = [], combat_role = [], replay_id = 0,
	 ext = []}).

-record(escort_pos_info,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0}).

-file("src/proto/proto_240.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24000, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24000:16,
       D_a_t_a/binary>>};
pack(24000, srv, {V0_plunders}) ->
    D_a_t_a = <<(length(V0_plunders)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_quality:8, V1_end_time:32,
				   (length(V1_plunder_lists)):16,
				   (list_to_binary([<<V2_rid:32,
						      (protocol:pack(string,
								     V2_srv_id))/binary>>
						    || {V2_rid, V2_srv_id}
							   <- V1_plunder_lists]))/binary>>
				 || #escort{id = {V1_rid, V1_srv_id},
					    gid = {V1_gid, V1_gsrv_id},
					    name = V1_name, gname = V1_gname,
					    quality = V1_quality,
					    end_time = V1_end_time,
					    plunder_lists = V1_plunder_lists}
					<- V0_plunders]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24000:16,
       D_a_t_a/binary>>};
pack(24001, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24001:16,
       D_a_t_a/binary>>};
pack(24001, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24001:16,
       D_a_t_a/binary>>};
pack(24002, cli, {}) -> {ok, <<2:32, 24002:16>>};
pack(24002, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24002:16,
       D_a_t_a/binary>>};
pack(24003, cli, {}) -> {ok, <<2:32, 24003:16>>};
pack(24003, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24003:16,
       D_a_t_a/binary>>};
pack(24004, cli, {}) -> {ok, <<2:32, 24004:16>>};
pack(24004, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24004:16,
       D_a_t_a/binary>>};
pack(24005, cli, {}) -> {ok, <<2:32, 24005:16>>};
pack(24005, srv, {{V0_rid, V0_srv_id}, V0_plunders}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(length(V0_plunders)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_quality:8, V1_end_time:32>>
				 || #escort{id = {V1_rid, V1_srv_id},
					    gid = {V1_gid, V1_gsrv_id},
					    name = V1_name, gname = V1_gname,
					    quality = V1_quality,
					    end_time = V1_end_time}
					<- V0_plunders]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24005:16,
       D_a_t_a/binary>>};
pack(24006, cli, {}) -> {ok, <<2:32, 24006:16>>};
pack(24006, srv,
     {V0_status, V0_quality, V0_end_time, V0_plunder_count,
      V0_datas}) ->
    D_a_t_a = <<V0_status:8, V0_quality:8, V0_end_time:32,
		V0_plunder_count:32, (length(V0_datas)):16,
		(list_to_binary([<<V1_id:8, V1_val:8>>
				 || {V1_id, V1_val} <- V0_datas]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24006:16,
       D_a_t_a/binary>>};
pack(24010, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24010:16,
       D_a_t_a/binary>>};
pack(24010, srv,
     {V0_quality, {V0_rid, V0_srv_id}, {V0_gid, V0_gsrv_id},
      V0_name, V0_lev, V0_face, V0_power, V0_guild_name,
      V0_formation_type, V0_formation_lev, V0_p_list}) ->
    D_a_t_a = <<V0_quality:8, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_gid:32,
		(protocol:pack(string, V0_gsrv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:8,
		V0_face:32, V0_power:32,
		(protocol:pack(string, V0_guild_name))/binary,
		V0_formation_type:8, V0_formation_lev:8,
		(length(V0_p_list)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:16,
				   V1_quality:8, V1_star:8, V1_break_lev:8>>
				 || {V1_pos, V1_bid, V1_lev, V1_quality,
				     V1_star, V1_break_lev}
					<- V0_p_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24010:16,
       D_a_t_a/binary>>};
pack(24011, cli, {V0_rid, V0_srv_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24011:16,
       D_a_t_a/binary>>};
pack(24011, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24011:16,
       D_a_t_a/binary>>};
pack(24012, cli, {}) -> {ok, <<2:32, 24012:16>>};
pack(24012, srv, {V0_result, V0_item_rewards}) ->
    D_a_t_a = <<V0_result:8, (length(V0_item_rewards)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num}
					<- V0_item_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24012:16,
       D_a_t_a/binary>>};
pack(24013, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24013:16,
       D_a_t_a/binary>>};
pack(24013, srv, {V0_type, V0_logs}) ->
    D_a_t_a = <<V0_type:8, (length(V0_logs)):16,
		(list_to_binary([<<V1_id:32, V1_quality:8, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string,
						  V1_guild_name))/binary,
				   V1_lev:8, V1_sex:8, V1_face:32, V1_power:32,
				   V1_avatar_id:32, V1_ret:8, V1_atk_ret:8,
				   V1_atk_count:8, V1_time:32, V1_help_count:32,
				   V1_help_time:32, (length(V1_items)):16,
				   (list_to_binary([<<V2_bid:32, V2_num:32>>
						    || {V2_bid, V2_num}
							   <- V1_items]))/binary,
				   V1_replay_id:32>>
				 || #escort_plunder_log{id = V1_id,
							quality = V1_quality,
							rid =
							    {V1_rid, V1_srv_id},
							name = V1_name,
							guild_name =
							    V1_guild_name,
							lev = V1_lev,
							sex = V1_sex,
							face = V1_face,
							power = V1_power,
							avatar_id =
							    V1_avatar_id,
							ret = V1_ret,
							atk_ret = V1_atk_ret,
							atk_count =
							    V1_atk_count,
							time = V1_time,
							help_count =
							    V1_help_count,
							help_time =
							    V1_help_time,
							items = V1_items,
							replay_id =
							    V1_replay_id}
					<- V0_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24013:16,
       D_a_t_a/binary>>};
pack(24014, cli, {V0_rid, V0_srv_id, V0_id, V0_type}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_id:32,
		V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24014:16,
       D_a_t_a/binary>>};
pack(24014, srv,
     {V0_quality, V0_id, V0_type, {V0_rid, V0_srv_id},
      V0_name, V0_lev, V0_face, V0_avatar_id, V0_power,
      V0_guild_name, V0_formation_type, V0_formation_lev,
      V0_p_list}) ->
    D_a_t_a = <<V0_quality:8, V0_id:32, V0_type:8,
		V0_rid:32, (protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_lev:8,
		V0_face:32, V0_avatar_id:32, V0_power:32,
		(protocol:pack(string, V0_guild_name))/binary,
		V0_formation_type:8, V0_formation_lev:8,
		(length(V0_p_list)):16,
		(list_to_binary([<<V1_pos:8, V1_bid:32, V1_lev:8,
				   V1_quality:8, V1_star:8, V1_break_lev:8>>
				 || {V1_pos, V1_bid, V1_lev, V1_quality,
				     V1_star, V1_break_lev}
					<- V0_p_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24014:16,
       D_a_t_a/binary>>};
pack(24015, cli, {V0_rid, V0_srv_id, V0_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24015:16,
       D_a_t_a/binary>>};
pack(24015, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24015:16,
       D_a_t_a/binary>>};
pack(24017, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24017:16,
       D_a_t_a/binary>>};
pack(24017, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24017:16,
       D_a_t_a/binary>>};
pack(24018, cli, {}) -> {ok, <<2:32, 24018:16>>};
pack(24018, srv,
     {#escort_plunder_log{id = V0_id, quality = V0_quality,
			  rid = {V0_rid, V0_srv_id}, name = V0_name,
			  guild_name = V0_guild_name, lev = V0_lev,
			  sex = V0_sex, face = V0_face, power = V0_power,
			  avatar_id = V0_avatar_id, ret = V0_ret,
			  atk_ret = V0_atk_ret, atk_count = V0_atk_count,
			  time = V0_time, help_count = V0_help_count,
			  help_time = V0_help_time, items = V0_items,
			  replay_id = V0_replay_id}}) ->
    D_a_t_a = <<V0_id:32, V0_quality:8, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary,
		(protocol:pack(string, V0_guild_name))/binary, V0_lev:8,
		V0_sex:8, V0_face:32, V0_power:32, V0_avatar_id:32,
		V0_ret:8, V0_atk_ret:8, V0_atk_count:8, V0_time:32,
		V0_help_count:32, V0_help_time:32,
		(length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_items]))/binary,
		V0_replay_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24018:16,
       D_a_t_a/binary>>};
pack(24019, cli, {}) -> {ok, <<2:32, 24019:16>>};
pack(24019, srv, {V0_plunders}) ->
    D_a_t_a = <<(length(V0_plunders)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_gid:32,
				   (protocol:pack(string, V1_gsrv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   (protocol:pack(string, V1_gname))/binary,
				   V1_quality:8, V1_end_time:32>>
				 || #escort{id = {V1_rid, V1_srv_id},
					    gid = {V1_gid, V1_gsrv_id},
					    name = V1_name, gname = V1_gname,
					    quality = V1_quality,
					    end_time = V1_end_time}
					<- V0_plunders]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24019:16,
       D_a_t_a/binary>>};
pack(24020, cli, {}) -> {ok, <<2:32, 24020:16>>};
pack(24020, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24020:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24000, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(24000, cli, _B0) ->
    {V1_plunders, _B16} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_rid, _B2} =
						     protocol:uint32(_B1),
						 {V2_srv_id, _B3} =
						     protocol:string(_B2),
						 {V2_gid, _B4} =
						     protocol:uint32(_B3),
						 {V2_gsrv_id, _B5} =
						     protocol:string(_B4),
						 {V2_name, _B6} =
						     protocol:string(_B5),
						 {V2_gname, _B7} =
						     protocol:string(_B6),
						 {V2_quality, _B8} =
						     protocol:uint8(_B7),
						 {V2_end_time, _B9} =
						     protocol:uint32(_B8),
						 {V2_plunder_lists, _B14} =
						     protocol:array(_B9,
								    fun
								      (_B10) ->
									  {V3_rid,
									   _B11} =
									      protocol:uint32(_B10),
									  {V3_srv_id,
									   _B12} =
									      protocol:string(_B11),
									  {{V3_rid,
									    V3_srv_id},
									   _B12}
								    end),
						 {{V2_rid, V2_srv_id, V2_gid,
						   V2_gsrv_id, V2_name,
						   V2_gname, V2_quality,
						   V2_end_time,
						   V2_plunder_lists},
						  _B14}
					 end),
    {ok, {V1_plunders}};
unpack(24001, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(24001, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(24002, srv, _B0) -> {ok, {}};
unpack(24002, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(24003, srv, _B0) -> {ok, {}};
unpack(24003, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(24004, srv, _B0) -> {ok, {}};
unpack(24004, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(24005, srv, _B0) -> {ok, {}};
unpack(24005, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_plunders, _B13} = protocol:array(_B2,
					 fun (_B3) ->
						 {V2_rid, _B4} =
						     protocol:uint32(_B3),
						 {V2_srv_id, _B5} =
						     protocol:string(_B4),
						 {V2_gid, _B6} =
						     protocol:uint32(_B5),
						 {V2_gsrv_id, _B7} =
						     protocol:string(_B6),
						 {V2_name, _B8} =
						     protocol:string(_B7),
						 {V2_gname, _B9} =
						     protocol:string(_B8),
						 {V2_quality, _B10} =
						     protocol:uint8(_B9),
						 {V2_end_time, _B11} =
						     protocol:uint32(_B10),
						 {{V2_rid, V2_srv_id, V2_gid,
						   V2_gsrv_id, V2_name,
						   V2_gname, V2_quality,
						   V2_end_time},
						  _B11}
					 end),
    {ok, {V1_rid, V1_srv_id, V1_plunders}};
unpack(24006, srv, _B0) -> {ok, {}};
unpack(24006, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_quality, _B2} = protocol:uint8(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_plunder_count, _B4} = protocol:uint32(_B3),
    {V1_datas, _B9} = protocol:array(_B4,
				     fun (_B5) ->
					     {V2_id, _B6} = protocol:uint8(_B5),
					     {V2_val, _B7} =
						 protocol:uint8(_B6),
					     {{V2_id, V2_val}, _B7}
				     end),
    {ok,
     {V1_status, V1_quality, V1_end_time, V1_plunder_count,
      V1_datas}};
unpack(24010, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(24010, cli, _B0) ->
    {V1_quality, _B1} = protocol:uint8(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_gid, _B4} = protocol:uint32(_B3),
    {V1_gsrv_id, _B5} = protocol:string(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_face, _B8} = protocol:uint32(_B7),
    {V1_power, _B9} = protocol:uint32(_B8),
    {V1_guild_name, _B10} = protocol:string(_B9),
    {V1_formation_type, _B11} = protocol:uint8(_B10),
    {V1_formation_lev, _B12} = protocol:uint8(_B11),
    {V1_p_list, _B21} = protocol:array(_B12,
				       fun (_B13) ->
					       {V2_pos, _B14} =
						   protocol:uint8(_B13),
					       {V2_bid, _B15} =
						   protocol:uint32(_B14),
					       {V2_lev, _B16} =
						   protocol:uint16(_B15),
					       {V2_quality, _B17} =
						   protocol:uint8(_B16),
					       {V2_star, _B18} =
						   protocol:uint8(_B17),
					       {V2_break_lev, _B19} =
						   protocol:uint8(_B18),
					       {{V2_pos, V2_bid, V2_lev,
						 V2_quality, V2_star,
						 V2_break_lev},
						_B19}
				       end),
    {ok,
     {V1_quality, V1_rid, V1_srv_id, V1_gid, V1_gsrv_id,
      V1_name, V1_lev, V1_face, V1_power, V1_guild_name,
      V1_formation_type, V1_formation_lev, V1_p_list}};
unpack(24011, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(24011, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(24012, srv, _B0) -> {ok, {}};
unpack(24012, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_item_rewards, _B6} = protocol:array(_B1,
					    fun (_B2) ->
						    {V2_bid, _B3} =
							protocol:uint32(_B2),
						    {V2_num, _B4} =
							protocol:uint32(_B3),
						    {{V2_bid, V2_num}, _B4}
					    end),
    {ok, {V1_result, V1_item_rewards}};
unpack(24013, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(24013, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_logs, _B27} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_id, _B3} =
						 protocol:uint32(_B2),
					     {V2_quality, _B4} =
						 protocol:uint8(_B3),
					     {V2_rid, _B5} =
						 protocol:uint32(_B4),
					     {V2_srv_id, _B6} =
						 protocol:string(_B5),
					     {V2_name, _B7} =
						 protocol:string(_B6),
					     {V2_guild_name, _B8} =
						 protocol:string(_B7),
					     {V2_lev, _B9} =
						 protocol:uint8(_B8),
					     {V2_sex, _B10} =
						 protocol:uint8(_B9),
					     {V2_face, _B11} =
						 protocol:uint32(_B10),
					     {V2_power, _B12} =
						 protocol:uint32(_B11),
					     {V2_avatar_id, _B13} =
						 protocol:uint32(_B12),
					     {V2_ret, _B14} =
						 protocol:uint8(_B13),
					     {V2_atk_ret, _B15} =
						 protocol:uint8(_B14),
					     {V2_atk_count, _B16} =
						 protocol:uint8(_B15),
					     {V2_time, _B17} =
						 protocol:uint32(_B16),
					     {V2_help_count, _B18} =
						 protocol:uint32(_B17),
					     {V2_help_time, _B19} =
						 protocol:uint32(_B18),
					     {V2_items, _B24} =
						 protocol:array(_B19,
								fun (_B20) ->
									{V3_bid,
									 _B21} =
									    protocol:uint32(_B20),
									{V3_num,
									 _B22} =
									    protocol:uint32(_B21),
									{{V3_bid,
									  V3_num},
									 _B22}
								end),
					     {V2_replay_id, _B25} =
						 protocol:uint32(_B24),
					     {{V2_id, V2_quality, V2_rid,
					       V2_srv_id, V2_name,
					       V2_guild_name, V2_lev, V2_sex,
					       V2_face, V2_power, V2_avatar_id,
					       V2_ret, V2_atk_ret, V2_atk_count,
					       V2_time, V2_help_count,
					       V2_help_time, V2_items,
					       V2_replay_id},
					      _B25}
				     end),
    {ok, {V1_type, V1_logs}};
unpack(24014, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_type, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_srv_id, V1_id, V1_type}};
unpack(24014, cli, _B0) ->
    {V1_quality, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_rid, _B4} = protocol:uint32(_B3),
    {V1_srv_id, _B5} = protocol:string(_B4),
    {V1_name, _B6} = protocol:string(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_face, _B8} = protocol:uint32(_B7),
    {V1_avatar_id, _B9} = protocol:uint32(_B8),
    {V1_power, _B10} = protocol:uint32(_B9),
    {V1_guild_name, _B11} = protocol:string(_B10),
    {V1_formation_type, _B12} = protocol:uint8(_B11),
    {V1_formation_lev, _B13} = protocol:uint8(_B12),
    {V1_p_list, _B22} = protocol:array(_B13,
				       fun (_B14) ->
					       {V2_pos, _B15} =
						   protocol:uint8(_B14),
					       {V2_bid, _B16} =
						   protocol:uint32(_B15),
					       {V2_lev, _B17} =
						   protocol:uint8(_B16),
					       {V2_quality, _B18} =
						   protocol:uint8(_B17),
					       {V2_star, _B19} =
						   protocol:uint8(_B18),
					       {V2_break_lev, _B20} =
						   protocol:uint8(_B19),
					       {{V2_pos, V2_bid, V2_lev,
						 V2_quality, V2_star,
						 V2_break_lev},
						_B20}
				       end),
    {ok,
     {V1_quality, V1_id, V1_type, V1_rid, V1_srv_id, V1_name,
      V1_lev, V1_face, V1_avatar_id, V1_power, V1_guild_name,
      V1_formation_type, V1_formation_lev, V1_p_list}};
unpack(24015, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_srv_id, V1_id}};
unpack(24015, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(24017, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24017, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24018, srv, _B0) -> {ok, {}};
unpack(24018, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_quality, _B2} = protocol:uint8(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_srv_id, _B4} = protocol:string(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_guild_name, _B6} = protocol:string(_B5),
    {V1_lev, _B7} = protocol:uint8(_B6),
    {V1_sex, _B8} = protocol:uint8(_B7),
    {V1_face, _B9} = protocol:uint32(_B8),
    {V1_power, _B10} = protocol:uint32(_B9),
    {V1_avatar_id, _B11} = protocol:uint32(_B10),
    {V1_ret, _B12} = protocol:uint8(_B11),
    {V1_atk_ret, _B13} = protocol:uint8(_B12),
    {V1_atk_count, _B14} = protocol:uint8(_B13),
    {V1_time, _B15} = protocol:uint32(_B14),
    {V1_help_count, _B16} = protocol:uint32(_B15),
    {V1_help_time, _B17} = protocol:uint32(_B16),
    {V1_items, _B22} = protocol:array(_B17,
				      fun (_B18) ->
					      {V2_bid, _B19} =
						  protocol:uint32(_B18),
					      {V2_num, _B20} =
						  protocol:uint32(_B19),
					      {{V2_bid, V2_num}, _B20}
				      end),
    {V1_replay_id, _B23} = protocol:uint32(_B22),
    {ok,
     {V1_id, V1_quality, V1_rid, V1_srv_id, V1_name,
      V1_guild_name, V1_lev, V1_sex, V1_face, V1_power,
      V1_avatar_id, V1_ret, V1_atk_ret, V1_atk_count, V1_time,
      V1_help_count, V1_help_time, V1_items, V1_replay_id}};
unpack(24019, srv, _B0) -> {ok, {}};
unpack(24019, cli, _B0) ->
    {V1_plunders, _B11} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_rid, _B2} =
						     protocol:uint32(_B1),
						 {V2_srv_id, _B3} =
						     protocol:string(_B2),
						 {V2_gid, _B4} =
						     protocol:uint32(_B3),
						 {V2_gsrv_id, _B5} =
						     protocol:string(_B4),
						 {V2_name, _B6} =
						     protocol:string(_B5),
						 {V2_gname, _B7} =
						     protocol:string(_B6),
						 {V2_quality, _B8} =
						     protocol:uint8(_B7),
						 {V2_end_time, _B9} =
						     protocol:uint32(_B8),
						 {{V2_rid, V2_srv_id, V2_gid,
						   V2_gsrv_id, V2_name,
						   V2_gname, V2_quality,
						   V2_end_time},
						  _B9}
					 end),
    {ok, {V1_plunders}};
unpack(24020, srv, _B0) -> {ok, {}};
unpack(24020, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


