-file("src/proto/proto_205.erl", 1).

-module(proto_205).

-lager_records([{world_boss_data,
		 [id, name, lev, ref_time, ref_item_num, base_items,
		  show_lev]},
		{boss_data,
		 [id, name, lev, base_items, drop_ids, month_boss_tag,
		  show_lev, first_items, hook_lose]},
		{world_boss_role,
		 [id, name, sex, face, lev, hurt, power, time]},
		{world_boss,
		 [id, hp, hp_max, rnum, start_time, ref_time, role_list,
		  kill_log]},
		{boss, [id, win, status]},
		{m_boss,
		 [ver, boss_list, world_num_time, world_can_num,
		  world_had_num, world_buy_num, world_remind,
		  extra_boss]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/boss.hrl", 1).

-record(m_boss,
	{ver = 2, boss_list = [], world_num_time = 0,
	 world_can_num = 0, world_had_num = 0, world_buy_num = 0,
	 world_remind = [], extra_boss = []}).

-record(boss, {id = 0, win = 0, status = 0}).

-record(world_boss,
	{id = 0, hp = 0, hp_max = 0, rnum = 0, start_time = 0,
	 ref_time = 0, role_list = [], kill_log = []}).

-record(world_boss_role,
	{id = {0, <<>>}, name = <<>>, sex = 0, face = 0,
	 lev = 0, hurt = 0, power = 0, time = 0}).

-record(boss_data,
	{id = 0, name = <<>>, lev = 0, base_items = [],
	 drop_ids = [], month_boss_tag = 0, show_lev = 0,
	 first_items = [], hook_lose = []}).

-record(world_boss_data,
	{id = 0, name = <<>>, lev = 0, ref_time = 0,
	 ref_item_num = 0, base_items = [], show_lev = 0}).

-file("src/proto/proto_205.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(20500, cli, {}) -> {ok, <<2:32, 20500:16>>};
pack(20500, srv, {V0_boss_list, V0_ext_list}) ->
    D_a_t_a = <<(length(V0_boss_list)):16,
		(list_to_binary([<<V1_boss_id:32, V1_status:8,
				   V1_first:8>>
				 || {V1_boss_id, V1_status, V1_first}
					<- V0_boss_list]))/binary,
		(length(V0_ext_list)):16,
		(list_to_binary([<<V1_ext_id:8, V1_status:8>>
				 || {V1_ext_id, V1_status}
					<- V0_ext_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20500:16,
       D_a_t_a/binary>>};
pack(20501, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20501:16,
       D_a_t_a/binary>>};
pack(20501, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20501:16,
       D_a_t_a/binary>>};
pack(20502, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20502:16,
       D_a_t_a/binary>>};
pack(20502, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20502:16,
       D_a_t_a/binary>>};
pack(20530, cli, {}) -> {ok, <<2:32, 20530:16>>};
pack(20530, srv,
     {V0_can_combat_num, V0_buy_combat_num, V0_num_time}) ->
    D_a_t_a = <<V0_can_combat_num:8, V0_buy_combat_num:8,
		V0_num_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20530:16,
       D_a_t_a/binary>>};
pack(20531, cli, {}) -> {ok, <<2:32, 20531:16>>};
pack(20531, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20531:16,
       D_a_t_a/binary>>};
pack(20532, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20532:16,
       D_a_t_a/binary>>};
pack(20532, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20532:16,
       D_a_t_a/binary>>};
pack(20533, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20533:16,
       D_a_t_a/binary>>};
pack(20533, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20533:16,
       D_a_t_a/binary>>};
pack(20535, cli, {}) -> {ok, <<2:32, 20535:16>>};
pack(20535, srv, {V0_boss_list}) ->
    D_a_t_a = <<(length(V0_boss_list)):16,
		(list_to_binary([<<V1_boss_id:32, V1_rnum:16, V1_hp:32,
				   V1_hp_max:32, V1_ref_time:32>>
				 || {V1_boss_id, V1_rnum, V1_hp, V1_hp_max,
				     V1_ref_time}
					<- V0_boss_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20535:16,
       D_a_t_a/binary>>};
pack(20536, srv,
     {V0_boss_id, V0_rnum, V0_hp, V0_hp_max, V0_ref_time}) ->
    D_a_t_a = <<V0_boss_id:32, V0_rnum:16, V0_hp:32,
		V0_hp_max:32, V0_ref_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20536:16,
       D_a_t_a/binary>>};
pack(20537, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20537:16,
       D_a_t_a/binary>>};
pack(20537, srv, {V0_boss_id, V0_role_list}) ->
    D_a_t_a = <<V0_boss_id:32, (length(V0_role_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_hurt:32>>
				 || #world_boss_role{id = {V1_rid, V1_srv_id},
						     name = V1_name,
						     hurt = V1_hurt}
					<- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20537:16,
       D_a_t_a/binary>>};
pack(20538, cli, {V0_boss_id}) ->
    D_a_t_a = <<V0_boss_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20538:16,
       D_a_t_a/binary>>};
pack(20538, srv, {V0_boss_id, V0_role_list}) ->
    D_a_t_a = <<V0_boss_id:32, (length(V0_role_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_power:32, V1_time:32>>
				 || #world_boss_role{id = {V1_rid, V1_srv_id},
						     name = V1_name,
						     power = V1_power,
						     time = V1_time}
					<- V0_role_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20538:16,
       D_a_t_a/binary>>};
pack(20539, srv,
     {V0_boss_id, V0_hurt, V0_item_rewards}) ->
    D_a_t_a = <<V0_boss_id:32, V0_hurt:32,
		(length(V0_item_rewards)):16,
		(list_to_binary([<<V1_bid:32, V1_is_bind:8, V1_num:32,
				   V1_id:32>>
				 || {V1_bid, V1_is_bind, V1_num, V1_id}
					<- V0_item_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20539:16,
       D_a_t_a/binary>>};
pack(20540, cli, {}) -> {ok, <<2:32, 20540:16>>};
pack(20540, srv, {V0_boss_list}) ->
    D_a_t_a = <<(length(V0_boss_list)):16,
		(list_to_binary([<<V1_boss_id:32>>
				 || V1_boss_id <- V0_boss_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20540:16,
       D_a_t_a/binary>>};
pack(20541, cli, {V0_boss_list}) ->
    D_a_t_a = <<(length(V0_boss_list)):16,
		(list_to_binary([<<V1_boss_id:32>>
				 || V1_boss_id <- V0_boss_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20541:16,
       D_a_t_a/binary>>};
pack(20541, srv, {}) -> {ok, <<2:32, 20541:16>>};
pack(20542, cli, {}) -> {ok, <<2:32, 20542:16>>};
pack(20542, srv,
     {V0_result, V0_first_award, V0_award}) ->
    D_a_t_a = <<V0_result:8, (length(V0_first_award)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num}
					<- V0_first_award]))/binary,
		(length(V0_award)):16,
		(list_to_binary([<<V1_item_id:32, V1_num:32>>
				 || {V1_item_id, V1_num}
					<- V0_award]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 20542:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(20500, srv, _B0) -> {ok, {}};
unpack(20500, cli, _B0) ->
    {V1_boss_list, _B6} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_boss_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_status, _B3} =
						     protocol:uint8(_B2),
						 {V2_first, _B4} =
						     protocol:uint8(_B3),
						 {{V2_boss_id, V2_status,
						   V2_first},
						  _B4}
					 end),
    {V1_ext_list, _B11} = protocol:array(_B6,
					 fun (_B7) ->
						 {V2_ext_id, _B8} =
						     protocol:uint8(_B7),
						 {V2_status, _B9} =
						     protocol:uint8(_B8),
						 {{V2_ext_id, V2_status}, _B9}
					 end),
    {ok, {V1_boss_list, V1_ext_list}};
unpack(20501, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(20501, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20502, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(20502, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20530, srv, _B0) -> {ok, {}};
unpack(20530, cli, _B0) ->
    {V1_can_combat_num, _B1} = protocol:uint8(_B0),
    {V1_buy_combat_num, _B2} = protocol:uint8(_B1),
    {V1_num_time, _B3} = protocol:uint32(_B2),
    {ok,
     {V1_can_combat_num, V1_buy_combat_num, V1_num_time}};
unpack(20531, srv, _B0) -> {ok, {}};
unpack(20531, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20532, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(20532, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20533, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(20533, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(20535, srv, _B0) -> {ok, {}};
unpack(20535, cli, _B0) ->
    {V1_boss_list, _B8} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_boss_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_rnum, _B3} =
						     protocol:uint16(_B2),
						 {V2_hp, _B4} =
						     protocol:uint32(_B3),
						 {V2_hp_max, _B5} =
						     protocol:uint32(_B4),
						 {V2_ref_time, _B6} =
						     protocol:uint32(_B5),
						 {{V2_boss_id, V2_rnum, V2_hp,
						   V2_hp_max, V2_ref_time},
						  _B6}
					 end),
    {ok, {V1_boss_list}};
unpack(20536, cli, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {V1_rnum, _B2} = protocol:uint16(_B1),
    {V1_hp, _B3} = protocol:uint32(_B2),
    {V1_hp_max, _B4} = protocol:uint32(_B3),
    {V1_ref_time, _B5} = protocol:uint32(_B4),
    {ok,
     {V1_boss_id, V1_rnum, V1_hp, V1_hp_max, V1_ref_time}};
unpack(20537, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(20537, cli, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {V1_role_list, _B8} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_rid, _B3} =
						     protocol:uint32(_B2),
						 {V2_srv_id, _B4} =
						     protocol:string(_B3),
						 {V2_name, _B5} =
						     protocol:string(_B4),
						 {V2_hurt, _B6} =
						     protocol:uint32(_B5),
						 {{V2_rid, V2_srv_id, V2_name,
						   V2_hurt},
						  _B6}
					 end),
    {ok, {V1_boss_id, V1_role_list}};
unpack(20538, srv, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_boss_id}};
unpack(20538, cli, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {V1_role_list, _B9} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_rid, _B3} =
						     protocol:uint32(_B2),
						 {V2_srv_id, _B4} =
						     protocol:string(_B3),
						 {V2_name, _B5} =
						     protocol:string(_B4),
						 {V2_power, _B6} =
						     protocol:uint32(_B5),
						 {V2_time, _B7} =
						     protocol:uint32(_B6),
						 {{V2_rid, V2_srv_id, V2_name,
						   V2_power, V2_time},
						  _B7}
					 end),
    {ok, {V1_boss_id, V1_role_list}};
unpack(20539, cli, _B0) ->
    {V1_boss_id, _B1} = protocol:uint32(_B0),
    {V1_hurt, _B2} = protocol:uint32(_B1),
    {V1_item_rewards, _B9} = protocol:array(_B2,
					    fun (_B3) ->
						    {V2_bid, _B4} =
							protocol:uint32(_B3),
						    {V2_is_bind, _B5} =
							protocol:uint8(_B4),
						    {V2_num, _B6} =
							protocol:uint32(_B5),
						    {V2_id, _B7} =
							protocol:uint32(_B6),
						    {{V2_bid, V2_is_bind,
						      V2_num, V2_id},
						     _B7}
					    end),
    {ok, {V1_boss_id, V1_hurt, V1_item_rewards}};
unpack(20540, srv, _B0) -> {ok, {}};
unpack(20540, cli, _B0) ->
    {V1_boss_list, _B4} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_boss_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_boss_id, _B2}
					 end),
    {ok, {V1_boss_list}};
unpack(20541, srv, _B0) ->
    {V1_boss_list, _B4} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_boss_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_boss_id, _B2}
					 end),
    {ok, {V1_boss_list}};
unpack(20541, cli, _B0) -> {ok, {}};
unpack(20542, srv, _B0) -> {ok, {}};
unpack(20542, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_first_award, _B6} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_item_id, _B3} =
						       protocol:uint32(_B2),
						   {V2_num, _B4} =
						       protocol:uint32(_B3),
						   {{V2_item_id, V2_num}, _B4}
					   end),
    {V1_award, _B11} = protocol:array(_B6,
				      fun (_B7) ->
					      {V2_item_id, _B8} =
						  protocol:uint32(_B7),
					      {V2_num, _B9} =
						  protocol:uint32(_B8),
					      {{V2_item_id, V2_num}, _B9}
				      end),
    {ok, {V1_result, V1_first_award, V1_award}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


