-file("src/proto/proto_214.erl", 1).

-module(proto_214).

-lager_records([{zs_war_guard_data,
		 [id, camp, bid, pos_x, pos_y, max_hp, diff_hp,
		  role_attr, camp_attr, time, cd]},
		{zs_war_skill_data,
		 [id, camp, name, cd, free, loss, effect]},
		{zs_war_guard,
		 [id, camp, bid, pos_x, pos_y, status, hp, max_hp]},
		{zs_war_zone, [group, zone, num, pid]},
		{zs_war_role,
		 [id, pid, name, zone_pid, zone_id, gid, gname, group,
		  camp, lev, sex, face, avatar_id, lookid, power,
		  max_power, arena_rank, pos_x, pos_y, score, num, win,
		  win_acc, win_best, lose, lose_acc, draw, status, effect,
		  move_num, move_cd_time, combat_cd_time, combat_role_id,
		  start_time, formation_type, pos_info, partner_hp, in_ui,
		  skill_list, skill_effect, is_robot, robot_id, items,
		  cnum_list, win_list]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/zs_war.hrl", 1).

-record(zs_war_role,
	{id = {0, <<>>}  :: {non_neg_integer(), bitstring()},
	 pid = 0  :: 0 | pid(), name = <<>>  :: bitstring(),
	 zone_pid = 0  :: 0 | pid(),
	 zone_id = 0  :: non_neg_integer(),
	 gid = {0, <<>>}  :: {non_neg_integer(), bitstring()},
	 gname = <<>>  :: bitstring(),
	 group = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), sex = 0  :: 0..2,
	 face = 0  :: non_neg_integer(),
	 avatar_id = 0  :: non_neg_integer(),
	 lookid = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 max_power = 0  :: non_neg_integer(),
	 arena_rank = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 score = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 win = 0  :: non_neg_integer(),
	 win_acc = 0  :: non_neg_integer(),
	 win_best = 0  :: non_neg_integer(),
	 lose = 0  :: non_neg_integer(),
	 lose_acc = 0  :: non_neg_integer(),
	 draw = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 effect = 0  :: non_neg_integer(),
	 move_num = 0  :: non_neg_integer(),
	 move_cd_time = 0  :: non_neg_integer(),
	 combat_cd_time = 0  :: non_neg_integer(),
	 combat_role_id = {0, <<>>}  :: tuple(),
	 start_time = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 pos_info = []  :: list(), partner_hp = []  :: list(),
	 in_ui = 0  :: 0..1, skill_list = []  :: list(),
	 skill_effect = []  :: list(), is_robot = 0  :: 0..1,
	 robot_id = 0  :: non_neg_integer(),
	 items = []  :: list(), cnum_list = []  :: list(),
	 win_list = []  :: list()}).

-record(zs_war_zone,
	{group = 0  :: non_neg_integer(),
	 zone = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(), pid = 0  :: pid()}).

-record(zs_war_guard,
	{id = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 max_hp = 0  :: non_neg_integer()}).

-record(zs_war_skill_data,
	{id = 0  :: non_neg_integer(), camp = 1  :: 1..2,
	 name = <<>>  :: bitstring(),
	 cd = 0  :: non_neg_integer(),
	 free = 0  :: non_neg_integer(), loss = []  :: list(),
	 effect = []  :: list()}).

-record(zs_war_guard_data,
	{id = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 max_hp = 0  :: non_neg_integer(),
	 diff_hp = 0  :: non_neg_integer(),
	 role_attr = []  :: list(), camp_attr = []  :: list(),
	 time = 0  :: non_neg_integer(),
	 cd = 0  :: non_neg_integer()}).

-file("src/proto/proto_214.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(21401, cli, {}) -> {ok, <<2:32, 21401:16>>};
pack(21401, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21401:16,
       D_a_t_a/binary>>};
pack(21403, cli, {}) -> {ok, <<2:32, 21403:16>>};
pack(21403, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21403:16,
       D_a_t_a/binary>>};
pack(21409, srv, {V0_time}) ->
    D_a_t_a = <<V0_time:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21409:16,
       D_a_t_a/binary>>};
pack(21410, cli, {}) -> {ok, <<2:32, 21410:16>>};
pack(21410, srv, {V0_type, V0_role_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_role_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_camp:8, V1_lev:8, V1_status:8,
				   V1_effect:8, V1_score:16, V1_win_acc:16,
				   V1_win_best:8, V1_pos_x:8, V1_pos_y:8,
				   (length(V1_skill_effect)):16,
				   (list_to_binary([<<V2_id:8>>
						    || V2_id
							   <- V1_skill_effect]))/binary>>
				 || #zs_war_role{id = {V1_rid, V1_srv_id},
						 name = V1_name, camp = V1_camp,
						 lev = V1_lev,
						 status = V1_status,
						 effect = V1_effect,
						 score = V1_score,
						 win_acc = V1_win_acc,
						 win_best = V1_win_best,
						 pos_x = V1_pos_x,
						 pos_y = V1_pos_y,
						 skill_effect = V1_skill_effect}
					<- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21410:16,
       D_a_t_a/binary>>};
pack(21411, srv, {V0_role_move_list}) ->
    D_a_t_a = <<(length(V0_role_move_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_pos_x:8, V1_pos_y:8>>
				 || #zs_war_role{id = {V1_rid, V1_srv_id},
						 pos_x = V1_pos_x,
						 pos_y = V1_pos_y}
					<- V0_role_move_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21411:16,
       D_a_t_a/binary>>};
pack(21412, srv,
     {V0_score_a, V0_score_b, V0_group, V0_zone}) ->
    D_a_t_a = <<V0_score_a:32, V0_score_b:32, V0_group:8,
		V0_zone:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21412:16,
       D_a_t_a/binary>>};
pack(21413, srv, {V0_type, V0_guard_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_guard_list)):16,
		(list_to_binary([<<V1_id:8, V1_camp:8, V1_bid:32,
				   V1_pos_x:8, V1_pos_y:8, V1_status:8,
				   V1_hp:32, V1_max_hp:32>>
				 || #zs_war_guard{id = V1_id, camp = V1_camp,
						  bid = V1_bid,
						  pos_x = V1_pos_x,
						  pos_y = V1_pos_y,
						  status = V1_status,
						  hp = V1_hp,
						  max_hp = V1_max_hp}
					<- V0_guard_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21413:16,
       D_a_t_a/binary>>};
pack(21415, srv, {V0_ret, V0_role_list}) ->
    D_a_t_a = <<V0_ret:8, (length(V0_role_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_camp:8, V1_lev:8, V1_score:16,
				   V1_win_acc:16, V1_win_best:8>>
				 || #zs_war_role{id = {V1_rid, V1_srv_id},
						 name = V1_name, camp = V1_camp,
						 lev = V1_lev, score = V1_score,
						 win_acc = V1_win_acc,
						 win_best = V1_win_best}
					<- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21415:16,
       D_a_t_a/binary>>};
pack(21416, srv,
     {V0_type, V0_camp1, V0_face1, V0_srv_id1, V0_name1,
      V0_face2, V0_srv_id2, V0_name2}) ->
    D_a_t_a = <<V0_type:8, V0_camp1:8, V0_face1:32,
		(protocol:pack(string, V0_srv_id1))/binary,
		(protocol:pack(string, V0_name1))/binary, V0_face2:32,
		(protocol:pack(string, V0_srv_id2))/binary,
		(protocol:pack(string, V0_name2))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21416:16,
       D_a_t_a/binary>>};
pack(21420, srv, {V0_skill_list}) ->
    D_a_t_a = <<(length(V0_skill_list)):16,
		(list_to_binary([<<V1_id:8, V1_cdtime:32, V1_num:8>>
				 || {V1_id, V1_cdtime, V1_num}
					<- V0_skill_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21420:16,
       D_a_t_a/binary>>};
pack(21421, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21421:16,
       D_a_t_a/binary>>};
pack(21421, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21421:16,
       D_a_t_a/binary>>};
pack(21425, cli, {}) -> {ok, <<2:32, 21425:16>>};
pack(21425, srv, {V0_group, V0_cnum, V0_win}) ->
    D_a_t_a = <<V0_group:8, V0_cnum:8, V0_win:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21425:16,
       D_a_t_a/binary>>};
pack(21426, srv, {V0_cnum_list, V0_win_list}) ->
    D_a_t_a = <<(length(V0_cnum_list)):16,
		(list_to_binary([<<V1_num:8>>
				 || V1_num <- V0_cnum_list]))/binary,
		(length(V0_win_list)):16,
		(list_to_binary([<<V1_num:8>>
				 || V1_num <- V0_win_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21426:16,
       D_a_t_a/binary>>};
pack(21427, cli, {V0_type, V0_num}) ->
    D_a_t_a = <<V0_type:8, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21427:16,
       D_a_t_a/binary>>};
pack(21427, srv, {V0_code, V0_msg, V0_type, V0_num}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8,
		V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21427:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(21401, srv, _B0) -> {ok, {}};
unpack(21401, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21403, srv, _B0) -> {ok, {}};
unpack(21403, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(21409, cli, _B0) ->
    {V1_time, _B1} = protocol:uint8(_B0), {ok, {V1_time}};
unpack(21410, srv, _B0) -> {ok, {}};
unpack(21410, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_role_list, _B20} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_rid, _B3} =
						      protocol:uint32(_B2),
						  {V2_srv_id, _B4} =
						      protocol:string(_B3),
						  {V2_name, _B5} =
						      protocol:string(_B4),
						  {V2_camp, _B6} =
						      protocol:uint8(_B5),
						  {V2_lev, _B7} =
						      protocol:uint8(_B6),
						  {V2_status, _B8} =
						      protocol:uint8(_B7),
						  {V2_effect, _B9} =
						      protocol:uint8(_B8),
						  {V2_score, _B10} =
						      protocol:uint16(_B9),
						  {V2_win_acc, _B11} =
						      protocol:uint16(_B10),
						  {V2_win_best, _B12} =
						      protocol:uint8(_B11),
						  {V2_pos_x, _B13} =
						      protocol:uint8(_B12),
						  {V2_pos_y, _B14} =
						      protocol:uint8(_B13),
						  {V2_skill_effect, _B18} =
						      protocol:array(_B14,
								     fun
								       (_B15) ->
									   {V3_id,
									    _B16} =
									       protocol:uint8(_B15),
									   {V3_id,
									    _B16}
								     end),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_camp, V2_lev, V2_status,
						    V2_effect, V2_score,
						    V2_win_acc, V2_win_best,
						    V2_pos_x, V2_pos_y,
						    V2_skill_effect},
						   _B18}
					  end),
    {ok, {V1_type, V1_role_list}};
unpack(21411, cli, _B0) ->
    {V1_role_move_list, _B7} = protocol:array(_B0,
					      fun (_B1) ->
						      {V2_rid, _B2} =
							  protocol:uint32(_B1),
						      {V2_srv_id, _B3} =
							  protocol:string(_B2),
						      {V2_pos_x, _B4} =
							  protocol:uint8(_B3),
						      {V2_pos_y, _B5} =
							  protocol:uint8(_B4),
						      {{V2_rid, V2_srv_id,
							V2_pos_x, V2_pos_y},
						       _B5}
					      end),
    {ok, {V1_role_move_list}};
unpack(21412, cli, _B0) ->
    {V1_score_a, _B1} = protocol:uint32(_B0),
    {V1_score_b, _B2} = protocol:uint32(_B1),
    {V1_group, _B3} = protocol:uint8(_B2),
    {V1_zone, _B4} = protocol:uint8(_B3),
    {ok, {V1_score_a, V1_score_b, V1_group, V1_zone}};
unpack(21413, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_guard_list, _B12} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_id, _B3} =
						       protocol:uint8(_B2),
						   {V2_camp, _B4} =
						       protocol:uint8(_B3),
						   {V2_bid, _B5} =
						       protocol:uint32(_B4),
						   {V2_pos_x, _B6} =
						       protocol:uint8(_B5),
						   {V2_pos_y, _B7} =
						       protocol:uint8(_B6),
						   {V2_status, _B8} =
						       protocol:uint8(_B7),
						   {V2_hp, _B9} =
						       protocol:uint32(_B8),
						   {V2_max_hp, _B10} =
						       protocol:uint32(_B9),
						   {{V2_id, V2_camp, V2_bid,
						     V2_pos_x, V2_pos_y,
						     V2_status, V2_hp,
						     V2_max_hp},
						    _B10}
					   end),
    {ok, {V1_type, V1_guard_list}};
unpack(21415, cli, _B0) ->
    {V1_ret, _B1} = protocol:uint8(_B0),
    {V1_role_list, _B12} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_rid, _B3} =
						      protocol:uint32(_B2),
						  {V2_srv_id, _B4} =
						      protocol:string(_B3),
						  {V2_name, _B5} =
						      protocol:string(_B4),
						  {V2_camp, _B6} =
						      protocol:uint8(_B5),
						  {V2_lev, _B7} =
						      protocol:uint8(_B6),
						  {V2_score, _B8} =
						      protocol:uint16(_B7),
						  {V2_win_acc, _B9} =
						      protocol:uint16(_B8),
						  {V2_win_best, _B10} =
						      protocol:uint8(_B9),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_camp, V2_lev, V2_score,
						    V2_win_acc, V2_win_best},
						   _B10}
					  end),
    {ok, {V1_ret, V1_role_list}};
unpack(21416, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_camp1, _B2} = protocol:uint8(_B1),
    {V1_face1, _B3} = protocol:uint32(_B2),
    {V1_srv_id1, _B4} = protocol:string(_B3),
    {V1_name1, _B5} = protocol:string(_B4),
    {V1_face2, _B6} = protocol:uint32(_B5),
    {V1_srv_id2, _B7} = protocol:string(_B6),
    {V1_name2, _B8} = protocol:string(_B7),
    {ok,
     {V1_type, V1_camp1, V1_face1, V1_srv_id1, V1_name1,
      V1_face2, V1_srv_id2, V1_name2}};
unpack(21420, cli, _B0) ->
    {V1_skill_list, _B6} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint8(_B1),
						  {V2_cdtime, _B3} =
						      protocol:uint32(_B2),
						  {V2_num, _B4} =
						      protocol:uint8(_B3),
						  {{V2_id, V2_cdtime, V2_num},
						   _B4}
					  end),
    {ok, {V1_skill_list}};
unpack(21421, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(21421, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(21425, srv, _B0) -> {ok, {}};
unpack(21425, cli, _B0) ->
    {V1_group, _B1} = protocol:uint8(_B0),
    {V1_cnum, _B2} = protocol:uint8(_B1),
    {V1_win, _B3} = protocol:uint8(_B2),
    {ok, {V1_group, V1_cnum, V1_win}};
unpack(21426, cli, _B0) ->
    {V1_cnum_list, _B4} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_num, _B2} =
						     protocol:uint8(_B1),
						 {V2_num, _B2}
					 end),
    {V1_win_list, _B8} = protocol:array(_B4,
					fun (_B5) ->
						{V2_num, _B6} =
						    protocol:uint8(_B5),
						{V2_num, _B6}
					end),
    {ok, {V1_cnum_list, V1_win_list}};
unpack(21427, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_type, V1_num}};
unpack(21427, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {ok, {V1_code, V1_msg, V1_type, V1_num}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


