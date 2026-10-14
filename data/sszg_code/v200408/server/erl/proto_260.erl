-file("src/proto/proto_260.erl", 1).

-module(proto_260).

-lager_records([{home_unit_data,
		 [bid, name, type, dir, set_id, soft, tile_list_1,
		  tile_list_2, effect_count]},
		{home_role_rank, [id, rank]},
		{home_rank_rc,
		 [id, name, lev, face, avatar_bid, time, cache_time,
		  worship_num, visit_num, soft, score, rank,
		  face_update_time, face_file]},
		{home_unit_set, [set_id, reward, collect]},
		{home_rand_visit,
		 [id, name, lev, sex, face, power, last_login, soft,
		  face_update_time, face_file]},
		{home_log,
		 [id, name, face, lev, is_friend, type, time, int_args,
		  str_args, face_update_time, face_file]},
		{home_visitor, [id, name, look_id, time, is_leave]},
		{home_unit, [ver, bid, index, dir]},
		{home_ext, [id, visitors, log]},
		{home_floor,
		 [floor, wall_bid, land_bid, soft, home_unit]},
		{home,
		 [ver, id, name, look_id, bid, wall_bid, land_bid, soft,
		  home_unit, floor_list, log, open_floor, main_floor]},
		{m_home,
		 [ver, num, buy_num, list, day_visitors, soft, max_soft,
		  look_id, look_list, last_visitors, worship,
		  worship_list, rand_list, last_rand_time, set_list,
		  last_hook_time, acc_hook_time, acc_hook_items,
		  open_floor, floor_list, main_floor, max_sum_soft]}]).

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

-file("src/proto/proto_260.erl", 16).

-file("inc/home.hrl", 1).

-record(m_home,
	{ver = 3, num = 0, buy_num = 0, list = [],
	 day_visitors = [], soft = 0, max_soft = 0, look_id = 0,
	 look_list = [], last_visitors = {0, <<>>}, worship = 0,
	 worship_list = [], rand_list = [], last_rand_time = 0,
	 set_list = [], last_hook_time = 0, acc_hook_time = 0,
	 acc_hook_items = [], open_floor = [], floor_list = [],
	 main_floor = 0, max_sum_soft = 0}).

-record(home,
	{ver = 2, id = {0, <<>>}, name = <<>>, look_id = 0,
	 bid = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = [], floor_list = [], log = [],
	 open_floor = [1], main_floor = 1}).

-record(home_floor,
	{floor = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = []}).

-record(home_ext,
	{id = {0, <<>>}, visitors = [], log = []}).

-record(home_unit,
	{ver = 1, bid = 0  :: non_neg_integer(),
	 index = 0  :: non_neg_integer(), dir = 1  :: 1..2}).

-record(home_visitor,
	{id = {0, <<>>}, name = <<>>, look_id = 0, time = 0,
	 is_leave = 0}).

-record(home_log,
	{id = {0, <<>>}, name = <<>>, face = 0, lev = 0,
	 is_friend = 0, type = 0, time = 0, int_args = [],
	 str_args = [], face_update_time = 0, face_file = <<>>}).

-record(home_rand_visit,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, power = 0, last_login = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(home_unit_set,
	{set_id = 0, reward = [], collect = []}).

-record(home_rank_rc,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, cache_time = 0,
	 worship_num = 0, visit_num = 0, soft = 0, score = 0,
	 rank = 0, face_update_time = 0, face_file = <<>>}).

-record(home_role_rank, {id = {0, <<>>}, rank = 0}).

-record(home_unit_data,
	{bid = 0, name = <<>>, type = 0, dir = 1, set_id = 0,
	 soft = 0, tile_list_1 = [], tile_list_2 = [],
	 effect_count = 1}).

-file("src/proto/proto_260.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(26001, cli, {V0_floor}) ->
    D_a_t_a = <<V0_floor:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26001:16,
       D_a_t_a/binary>>};
pack(26001, srv,
     {V0_name, V0_look_id, V0_worship, V0_rest_worship,
      V0_soft, V0_wall_bid, V0_land_bid, V0_list, V0_visitors,
      V0_acc_hook_time, V0_floor, V0_main_floor,
      V0_max_soft_floor, V0_max_all_soft, V0_other_bid,
      V0_max_floor_soft}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary,
		V0_look_id:32, V0_worship:32, V0_rest_worship:16,
		V0_soft:32, V0_wall_bid:32, V0_land_bid:32,
		(length(V0_list)):16,
		(list_to_binary([<<V1_bid:32, V1_index:32, V1_dir:8>>
				 || #home_unit{bid = V1_bid, index = V1_index,
					       dir = V1_dir}
					<- V0_list]))/binary,
		(length(V0_visitors)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_look_id:32>>
				 || {V1_rid, V1_srv_id, V1_name, V1_look_id}
					<- V0_visitors]))/binary,
		V0_acc_hook_time:32, V0_floor:8, V0_main_floor:8,
		V0_max_soft_floor:8, V0_max_all_soft:32,
		(length(V0_other_bid)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_other_bid]))/binary,
		V0_max_floor_soft:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26001:16,
       D_a_t_a/binary>>};
pack(26002, cli,
     {V0_wall_bid, V0_land_bid, V0_list, V0_floor}) ->
    D_a_t_a = <<V0_wall_bid:32, V0_land_bid:32,
		(length(V0_list)):16,
		(list_to_binary([<<V1_bid:32, V1_index:32, V1_dir:8>>
				 || {V1_bid, V1_index, V1_dir}
					<- V0_list]))/binary,
		V0_floor:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26002:16,
       D_a_t_a/binary>>};
pack(26002, srv,
     {V0_code, V0_msg, V0_soft, V0_wall_bid, V0_land_bid,
      V0_list, V0_floor, V0_max_soft_floor, V0_max_all_soft,
      V0_other_bid, V0_max_floor_soft}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_soft:32,
		V0_wall_bid:32, V0_land_bid:32, (length(V0_list)):16,
		(list_to_binary([<<V1_bid:32, V1_index:32, V1_dir:8>>
				 || {V1_bid, V1_index, V1_dir}
					<- V0_list]))/binary,
		V0_floor:8, V0_max_soft_floor:8, V0_max_all_soft:32,
		(length(V0_other_bid)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_other_bid]))/binary,
		V0_max_floor_soft:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26002:16,
       D_a_t_a/binary>>};
pack(26003, cli, {V0_rid, V0_srv_id, V0_floor}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_floor:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26003:16,
       D_a_t_a/binary>>};
pack(26003, srv,
     {V0_code, V0_msg, V0_rid, V0_srv_id, V0_name,
      V0_look_id, V0_worship, V0_worship_status, V0_soft,
      V0_wall_bid, V0_land_bid, V0_list, V0_visitors,
      V0_tar_name, V0_floor}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary, V0_look_id:32,
		V0_worship:32, V0_worship_status:8, V0_soft:32,
		V0_wall_bid:32, V0_land_bid:32, (length(V0_list)):16,
		(list_to_binary([<<V1_bid:32, V1_index:32, V1_dir:8>>
				 || #home_unit{bid = V1_bid, index = V1_index,
					       dir = V1_dir}
					<- V0_list]))/binary,
		(length(V0_visitors)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_look_id:32>>
				 || {V1_rid, V1_srv_id, V1_name, V1_look_id}
					<- V0_visitors]))/binary,
		(protocol:pack(string, V0_tar_name))/binary,
		V0_floor:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26003:16,
       D_a_t_a/binary>>};
pack(26004, cli, {}) -> {ok, <<2:32, 26004:16>>};
pack(26004, srv,
     {V0_use_id, V0_max_soft, V0_list, V0_is_finish}) ->
    D_a_t_a = <<V0_use_id:32, V0_max_soft:32,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_list]))/binary,
		V0_is_finish:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26004:16,
       D_a_t_a/binary>>};
pack(26005, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26005:16,
       D_a_t_a/binary>>};
pack(26005, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26005:16,
       D_a_t_a/binary>>};
pack(26006, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26006:16,
       D_a_t_a/binary>>};
pack(26006, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26006:16,
       D_a_t_a/binary>>};
pack(26007, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26007:16,
       D_a_t_a/binary>>};
pack(26007, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26007:16,
       D_a_t_a/binary>>};
pack(26008, srv,
     {V0_rid, V0_srv_id, V0_name, V0_look_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_name))/binary,
		V0_look_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26008:16,
       D_a_t_a/binary>>};
pack(26009, cli, {}) -> {ok, <<2:32, 26009:16>>};
pack(26009, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_sex:8, V1_face:32, V1_power:32,
				   V1_last_login:32, V1_soft:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #home_rand_visit{id = {V1_rid, V1_srv_id},
						     name = V1_name,
						     lev = V1_lev, sex = V1_sex,
						     face = V1_face,
						     power = V1_power,
						     last_login = V1_last_login,
						     soft = V1_soft,
						     face_update_time =
							 V1_face_update_time,
						     face_file = V1_face_file}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26009:16,
       D_a_t_a/binary>>};
pack(26010, cli, {}) -> {ok, <<2:32, 26010:16>>};
pack(26010, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_face:32, V1_lev:16,
				   (protocol:pack(string, V1_name))/binary,
				   V1_is_friend:8, V1_type:8, V1_time:32,
				   (length(V1_int_args)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_int_args]))/binary,
				   (length(V1_str_args)):16,
				   (list_to_binary([<<V2_key:32,
						      (protocol:pack(string,
								     V2_val))/binary>>
						    || {V2_key, V2_val}
							   <- V1_str_args]))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #home_log{id = {V1_rid, V1_srv_id},
					      face = V1_face, lev = V1_lev,
					      name = V1_name,
					      is_friend = V1_is_friend,
					      type = V1_type, time = V1_time,
					      int_args = V1_int_args,
					      str_args = V1_str_args,
					      face_update_time =
						  V1_face_update_time,
					      face_file = V1_face_file}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26010:16,
       D_a_t_a/binary>>};
pack(26011, cli, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26011:16,
       D_a_t_a/binary>>};
pack(26011, srv, {V0_code, V0_msg, V0_name}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26011:16,
       D_a_t_a/binary>>};
pack(26012, srv, {V0_worship}) ->
    D_a_t_a = <<V0_worship:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26012:16,
       D_a_t_a/binary>>};
pack(26013, cli, {}) -> {ok, <<2:32, 26013:16>>};
pack(26013, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_set_id:32, (length(V1_reward)):16,
				   (list_to_binary([<<V2_id:32>>
						    || V2_id
							   <- V1_reward]))/binary,
				   (length(V1_collect)):16,
				   (list_to_binary([<<V2_bid:32>>
						    || V2_bid
							   <- V1_collect]))/binary>>
				 || #home_unit_set{set_id = V1_set_id,
						   reward = V1_reward,
						   collect = V1_collect}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26013:16,
       D_a_t_a/binary>>};
pack(26014, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26014:16,
       D_a_t_a/binary>>};
pack(26014, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26014:16,
       D_a_t_a/binary>>};
pack(26015, srv,
     {V0_rest_worship, V0_acc_hook_time, V0_max_soft}) ->
    D_a_t_a = <<V0_rest_worship:16, V0_acc_hook_time:32,
		V0_max_soft:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26015:16,
       D_a_t_a/binary>>};
pack(26016, cli, {}) -> {ok, <<2:32, 26016:16>>};
pack(26016, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26016:16,
       D_a_t_a/binary>>};
pack(26017, cli, {}) -> {ok, <<2:32, 26017:16>>};
pack(26017, srv, {V0_is_first}) ->
    D_a_t_a = <<V0_is_first:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26017:16,
       D_a_t_a/binary>>};
pack(26018, cli, {}) -> {ok, <<2:32, 26018:16>>};
pack(26018, srv, {V0_code, V0_hook_code}) ->
    D_a_t_a = <<V0_code:8, V0_hook_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26018:16,
       D_a_t_a/binary>>};
pack(26019, cli, {}) -> {ok, <<2:32, 26019:16>>};
pack(26019, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_rid, V1_srv_id} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26019:16,
       D_a_t_a/binary>>};
pack(26020, cli, {}) -> {ok, <<2:32, 26020:16>>};
pack(26020, srv,
     {V0_my_rank, V0_my_score, V0_rank_list}) ->
    D_a_t_a = <<V0_my_rank:16, V0_my_score:32,
		(length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_rank:16,
				   V1_avatar_bid:32, V1_score:32,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #home_rank_rc{id = {V1_rid, V1_srv_id},
						  name = V1_name, lev = V1_lev,
						  face = V1_face,
						  rank = V1_rank,
						  avatar_bid = V1_avatar_bid,
						  score = V1_score,
						  face_update_time =
						      V1_face_update_time,
						  face_file = V1_face_file}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26020:16,
       D_a_t_a/binary>>};
pack(26021, cli, {V0_main_floor}) ->
    D_a_t_a = <<V0_main_floor:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26021:16,
       D_a_t_a/binary>>};
pack(26021, srv,
     {V0_code, V0_msg, V0_main_floor, V0_max_soft_floor}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_main_floor:8,
		V0_max_soft_floor:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26021:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(26001, srv, _B0) ->
    {V1_floor, _B1} = protocol:uint8(_B0), {ok, {V1_floor}};
unpack(26001, cli, _B0) ->
    {V1_name, _B1} = protocol:string(_B0),
    {V1_look_id, _B2} = protocol:uint32(_B1),
    {V1_worship, _B3} = protocol:uint32(_B2),
    {V1_rest_worship, _B4} = protocol:uint16(_B3),
    {V1_soft, _B5} = protocol:uint32(_B4),
    {V1_wall_bid, _B6} = protocol:uint32(_B5),
    {V1_land_bid, _B7} = protocol:uint32(_B6),
    {V1_list, _B13} = protocol:array(_B7,
				     fun (_B8) ->
					     {V2_bid, _B9} =
						 protocol:uint32(_B8),
					     {V2_index, _B10} =
						 protocol:uint32(_B9),
					     {V2_dir, _B11} =
						 protocol:uint8(_B10),
					     {{V2_bid, V2_index, V2_dir}, _B11}
				     end),
    {V1_visitors, _B20} = protocol:array(_B13,
					 fun (_B14) ->
						 {V2_rid, _B15} =
						     protocol:uint32(_B14),
						 {V2_srv_id, _B16} =
						     protocol:string(_B15),
						 {V2_name, _B17} =
						     protocol:string(_B16),
						 {V2_look_id, _B18} =
						     protocol:uint32(_B17),
						 {{V2_rid, V2_srv_id, V2_name,
						   V2_look_id},
						  _B18}
					 end),
    {V1_acc_hook_time, _B21} = protocol:uint32(_B20),
    {V1_floor, _B22} = protocol:uint8(_B21),
    {V1_main_floor, _B23} = protocol:uint8(_B22),
    {V1_max_soft_floor, _B24} = protocol:uint8(_B23),
    {V1_max_all_soft, _B25} = protocol:uint32(_B24),
    {V1_other_bid, _B30} = protocol:array(_B25,
					  fun (_B26) ->
						  {V2_bid, _B27} =
						      protocol:uint32(_B26),
						  {V2_num, _B28} =
						      protocol:uint32(_B27),
						  {{V2_bid, V2_num}, _B28}
					  end),
    {V1_max_floor_soft, _B31} = protocol:uint32(_B30),
    {ok,
     {V1_name, V1_look_id, V1_worship, V1_rest_worship,
      V1_soft, V1_wall_bid, V1_land_bid, V1_list, V1_visitors,
      V1_acc_hook_time, V1_floor, V1_main_floor,
      V1_max_soft_floor, V1_max_all_soft, V1_other_bid,
      V1_max_floor_soft}};
unpack(26002, srv, _B0) ->
    {V1_wall_bid, _B1} = protocol:uint32(_B0),
    {V1_land_bid, _B2} = protocol:uint32(_B1),
    {V1_list, _B8} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_bid, _B4} =
						protocol:uint32(_B3),
					    {V2_index, _B5} =
						protocol:uint32(_B4),
					    {V2_dir, _B6} = protocol:uint8(_B5),
					    {{V2_bid, V2_index, V2_dir}, _B6}
				    end),
    {V1_floor, _B9} = protocol:uint8(_B8),
    {ok, {V1_wall_bid, V1_land_bid, V1_list, V1_floor}};
unpack(26002, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_soft, _B3} = protocol:uint32(_B2),
    {V1_wall_bid, _B4} = protocol:uint32(_B3),
    {V1_land_bid, _B5} = protocol:uint32(_B4),
    {V1_list, _B11} = protocol:array(_B5,
				     fun (_B6) ->
					     {V2_bid, _B7} =
						 protocol:uint32(_B6),
					     {V2_index, _B8} =
						 protocol:uint32(_B7),
					     {V2_dir, _B9} =
						 protocol:uint8(_B8),
					     {{V2_bid, V2_index, V2_dir}, _B9}
				     end),
    {V1_floor, _B12} = protocol:uint8(_B11),
    {V1_max_soft_floor, _B13} = protocol:uint8(_B12),
    {V1_max_all_soft, _B14} = protocol:uint32(_B13),
    {V1_other_bid, _B19} = protocol:array(_B14,
					  fun (_B15) ->
						  {V2_bid, _B16} =
						      protocol:uint32(_B15),
						  {V2_num, _B17} =
						      protocol:uint32(_B16),
						  {{V2_bid, V2_num}, _B17}
					  end),
    {V1_max_floor_soft, _B20} = protocol:uint32(_B19),
    {ok,
     {V1_code, V1_msg, V1_soft, V1_wall_bid, V1_land_bid,
      V1_list, V1_floor, V1_max_soft_floor, V1_max_all_soft,
      V1_other_bid, V1_max_floor_soft}};
unpack(26003, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_floor, _B3} = protocol:uint8(_B2),
    {ok, {V1_rid, V1_srv_id, V1_floor}};
unpack(26003, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_srv_id, _B4} = protocol:string(_B3),
    {V1_name, _B5} = protocol:string(_B4),
    {V1_look_id, _B6} = protocol:uint32(_B5),
    {V1_worship, _B7} = protocol:uint32(_B6),
    {V1_worship_status, _B8} = protocol:uint8(_B7),
    {V1_soft, _B9} = protocol:uint32(_B8),
    {V1_wall_bid, _B10} = protocol:uint32(_B9),
    {V1_land_bid, _B11} = protocol:uint32(_B10),
    {V1_list, _B17} = protocol:array(_B11,
				     fun (_B12) ->
					     {V2_bid, _B13} =
						 protocol:uint32(_B12),
					     {V2_index, _B14} =
						 protocol:uint32(_B13),
					     {V2_dir, _B15} =
						 protocol:uint8(_B14),
					     {{V2_bid, V2_index, V2_dir}, _B15}
				     end),
    {V1_visitors, _B24} = protocol:array(_B17,
					 fun (_B18) ->
						 {V2_rid, _B19} =
						     protocol:uint32(_B18),
						 {V2_srv_id, _B20} =
						     protocol:string(_B19),
						 {V2_name, _B21} =
						     protocol:string(_B20),
						 {V2_look_id, _B22} =
						     protocol:uint32(_B21),
						 {{V2_rid, V2_srv_id, V2_name,
						   V2_look_id},
						  _B22}
					 end),
    {V1_tar_name, _B25} = protocol:string(_B24),
    {V1_floor, _B26} = protocol:uint8(_B25),
    {ok,
     {V1_code, V1_msg, V1_rid, V1_srv_id, V1_name,
      V1_look_id, V1_worship, V1_worship_status, V1_soft,
      V1_wall_bid, V1_land_bid, V1_list, V1_visitors,
      V1_tar_name, V1_floor}};
unpack(26004, srv, _B0) -> {ok, {}};
unpack(26004, cli, _B0) ->
    {V1_use_id, _B1} = protocol:uint32(_B0),
    {V1_max_soft, _B2} = protocol:uint32(_B1),
    {V1_list, _B6} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {V2_id, _B4}
				    end),
    {V1_is_finish, _B7} = protocol:uint8(_B6),
    {ok, {V1_use_id, V1_max_soft, V1_list, V1_is_finish}};
unpack(26005, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(26005, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(26006, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(26006, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(26007, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(26007, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(26008, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_look_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_rid, V1_srv_id, V1_name, V1_look_id}};
unpack(26009, srv, _B0) -> {ok, {}};
unpack(26009, cli, _B0) ->
    {V1_list, _B14} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_rid, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_name, _B4} =
						 protocol:string(_B3),
					     {V2_lev, _B5} =
						 protocol:uint16(_B4),
					     {V2_sex, _B6} =
						 protocol:uint8(_B5),
					     {V2_face, _B7} =
						 protocol:uint32(_B6),
					     {V2_power, _B8} =
						 protocol:uint32(_B7),
					     {V2_last_login, _B9} =
						 protocol:uint32(_B8),
					     {V2_soft, _B10} =
						 protocol:uint32(_B9),
					     {V2_face_update_time, _B11} =
						 protocol:uint32(_B10),
					     {V2_face_file, _B12} =
						 protocol:string(_B11),
					     {{V2_rid, V2_srv_id, V2_name,
					       V2_lev, V2_sex, V2_face,
					       V2_power, V2_last_login, V2_soft,
					       V2_face_update_time,
					       V2_face_file},
					      _B12}
				     end),
    {ok, {V1_list}};
unpack(26010, srv, _B0) -> {ok, {}};
unpack(26010, cli, _B0) ->
    {V1_list, _B23} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_rid, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_face, _B4} =
						 protocol:uint32(_B3),
					     {V2_lev, _B5} =
						 protocol:uint16(_B4),
					     {V2_name, _B6} =
						 protocol:string(_B5),
					     {V2_is_friend, _B7} =
						 protocol:uint8(_B6),
					     {V2_type, _B8} =
						 protocol:uint8(_B7),
					     {V2_time, _B9} =
						 protocol:uint32(_B8),
					     {V2_int_args, _B14} =
						 protocol:array(_B9,
								fun (_B10) ->
									{V3_key,
									 _B11} =
									    protocol:uint32(_B10),
									{V3_val,
									 _B12} =
									    protocol:uint32(_B11),
									{{V3_key,
									  V3_val},
									 _B12}
								end),
					     {V2_str_args, _B19} =
						 protocol:array(_B14,
								fun (_B15) ->
									{V3_key,
									 _B16} =
									    protocol:uint32(_B15),
									{V3_val,
									 _B17} =
									    protocol:string(_B16),
									{{V3_key,
									  V3_val},
									 _B17}
								end),
					     {V2_face_update_time, _B20} =
						 protocol:uint32(_B19),
					     {V2_face_file, _B21} =
						 protocol:string(_B20),
					     {{V2_rid, V2_srv_id, V2_face,
					       V2_lev, V2_name, V2_is_friend,
					       V2_type, V2_time, V2_int_args,
					       V2_str_args, V2_face_update_time,
					       V2_face_file},
					      _B21}
				     end),
    {ok, {V1_list}};
unpack(26011, srv, _B0) ->
    {V1_name, _B1} = protocol:string(_B0), {ok, {V1_name}};
unpack(26011, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {ok, {V1_code, V1_msg, V1_name}};
unpack(26012, cli, _B0) ->
    {V1_worship, _B1} = protocol:uint32(_B0),
    {ok, {V1_worship}};
unpack(26013, srv, _B0) -> {ok, {}};
unpack(26013, cli, _B0) ->
    {V1_list, _B12} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_set_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_reward, _B6} =
						 protocol:array(_B2,
								fun (_B3) ->
									{V3_id,
									 _B4} =
									    protocol:uint32(_B3),
									{V3_id,
									 _B4}
								end),
					     {V2_collect, _B10} =
						 protocol:array(_B6,
								fun (_B7) ->
									{V3_bid,
									 _B8} =
									    protocol:uint32(_B7),
									{V3_bid,
									 _B8}
								end),
					     {{V2_set_id, V2_reward,
					       V2_collect},
					      _B10}
				     end),
    {ok, {V1_list}};
unpack(26014, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(26014, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(26015, cli, _B0) ->
    {V1_rest_worship, _B1} = protocol:uint16(_B0),
    {V1_acc_hook_time, _B2} = protocol:uint32(_B1),
    {V1_max_soft, _B3} = protocol:uint32(_B2),
    {ok, {V1_rest_worship, V1_acc_hook_time, V1_max_soft}};
unpack(26016, srv, _B0) -> {ok, {}};
unpack(26016, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(26017, srv, _B0) -> {ok, {}};
unpack(26017, cli, _B0) ->
    {V1_is_first, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_first}};
unpack(26018, srv, _B0) -> {ok, {}};
unpack(26018, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_hook_code, _B2} = protocol:uint8(_B1),
    {ok, {V1_code, V1_hook_code}};
unpack(26019, srv, _B0) -> {ok, {}};
unpack(26019, cli, _B0) ->
    {V1_list, _B5} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_rid, _B2} =
						protocol:uint32(_B1),
					    {V2_srv_id, _B3} =
						protocol:string(_B2),
					    {{V2_rid, V2_srv_id}, _B3}
				    end),
    {ok, {V1_list}};
unpack(26020, srv, _B0) -> {ok, {}};
unpack(26020, cli, _B0) ->
    {V1_my_rank, _B1} = protocol:uint16(_B0),
    {V1_my_score, _B2} = protocol:uint32(_B1),
    {V1_rank_list, _B15} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_rid, _B4} =
						      protocol:uint32(_B3),
						  {V2_srv_id, _B5} =
						      protocol:string(_B4),
						  {V2_name, _B6} =
						      protocol:string(_B5),
						  {V2_lev, _B7} =
						      protocol:uint16(_B6),
						  {V2_face, _B8} =
						      protocol:uint32(_B7),
						  {V2_rank, _B9} =
						      protocol:uint16(_B8),
						  {V2_avatar_bid, _B10} =
						      protocol:uint32(_B9),
						  {V2_score, _B11} =
						      protocol:uint32(_B10),
						  {V2_face_update_time, _B12} =
						      protocol:uint32(_B11),
						  {V2_face_file, _B13} =
						      protocol:string(_B12),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_lev, V2_face, V2_rank,
						    V2_avatar_bid, V2_score,
						    V2_face_update_time,
						    V2_face_file},
						   _B13}
					  end),
    {ok, {V1_my_rank, V1_my_score, V1_rank_list}};
unpack(26021, srv, _B0) ->
    {V1_main_floor, _B1} = protocol:uint8(_B0),
    {ok, {V1_main_floor}};
unpack(26021, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_main_floor, _B3} = protocol:uint8(_B2),
    {V1_max_soft_floor, _B4} = protocol:uint8(_B3),
    {ok,
     {V1_code, V1_msg, V1_main_floor, V1_max_soft_floor}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


