-file("src/proto/proto_136.erl", 1).

-module(proto_136).

-lager_records([{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]},
		{grow_data,
		 [ver, day, goal_id, status, condition, lev, progress,
		  target_type]},
		{m_day_goals,
		 [ver, end_time, num, welfare_list, grow_list,
		  price_list, finish_list, period, charge, old_data,
		  period_day, new_grow_list, lev_reward, old_data2]},
		{g_mem_red_packet,
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

-file("src/proto/proto_136.erl", 16).

-file("inc/day_goals.hrl", 1).

-record(m_day_goals,
	{ver = 3, end_time = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 welfare_list = []  :: list(), grow_list = []  :: list(),
	 price_list = []  :: list(), finish_list = []  :: list(),
	 period = 1  :: list(), charge = 0  :: list(),
	 old_data = [], period_day = 0, new_grow_list = [],
	 lev_reward = [], old_data2 = []}).

-record(grow_data,
	{ver = 2, day = 0  :: non_neg_integer(),
	 goal_id = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 target_type = 1  :: non_neg_integer()}).

-file("src/proto/proto_136.erl", 17).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/proto/proto_136.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(13601, cli, {}) -> {ok, <<2:32, 13601:16>>};
pack(13601, srv,
     {V0_flag, V0_msg, V0_period, V0_charge, V0_cur_day,
      V0_num, V0_end_time, V0_welfare_list, V0_grow_list,
      V0_price_list, V0_finish_list}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_period:8,
		V0_charge:32, V0_cur_day:32, V0_num:32, V0_end_time:32,
		(length(V0_welfare_list)):16,
		(list_to_binary([<<V1_day:32, V1_goal_id:32,
				   V1_status:8, V1_target_val:32, V1_value:32>>
				 || {V1_day, V1_goal_id, V1_status,
				     V1_target_val, V1_value}
					<- V0_welfare_list]))/binary,
		(length(V0_grow_list)):16,
		(list_to_binary([<<V1_day:32, V1_goal_id:32,
				   V1_condition:32, V1_lev:32, V1_status:8,
				   V1_target_type:8, (length(V1_progress)):16,
				   (list_to_binary([<<V2_id:16, V2_finish:8,
						      V2_target:32,
						      V2_target_val:32,
						      V2_value:32>>
						    || #quest_progress{id =
									   V2_id,
								       finish =
									   V2_finish,
								       target =
									   V2_target,
								       target_val
									   =
									   V2_target_val,
								       value =
									   V2_value}
							   <- V1_progress]))/binary>>
				 || #grow_data{day = V1_day,
					       goal_id = V1_goal_id,
					       condition = V1_condition,
					       lev = V1_lev, status = V1_status,
					       target_type = V1_target_type,
					       progress = V1_progress}
					<- V0_grow_list]))/binary,
		(length(V0_price_list)):16,
		(list_to_binary([<<V1_day:32, V1_status:8>>
				 || {V1_day, V1_status}
					<- V0_price_list]))/binary,
		(length(V0_finish_list)):16,
		(list_to_binary([<<V1_goal_id:32, V1_status:8>>
				 || {V1_goal_id, V1_status}
					<- V0_finish_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13601:16,
       D_a_t_a/binary>>};
pack(13602, cli,
     {V0_type, V0_day_type, V0_id, V0_item}) ->
    D_a_t_a = <<V0_type:8, V0_day_type:32, V0_id:32,
		V0_item:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13602:16,
       D_a_t_a/binary>>};
pack(13602, srv,
     {V0_flag, V0_msg, V0_type, V0_day_type, V0_id, V0_item,
      V0_status, V0_num}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8,
		V0_day_type:32, V0_id:32, V0_item:32, V0_status:8,
		V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13602:16,
       D_a_t_a/binary>>};
pack(13603, cli, {}) -> {ok, <<2:32, 13603:16>>};
pack(13603, srv, {V0_grow_list}) ->
    D_a_t_a = <<(length(V0_grow_list)):16,
		(list_to_binary([<<V1_day:32, V1_goal_id:32,
				   V1_condition:32, V1_lev:32, V1_status:8,
				   V1_target_type:8, (length(V1_progress)):16,
				   (list_to_binary([<<V2_id:16, V2_finish:8,
						      V2_target:32,
						      V2_target_val:32,
						      V2_value:32>>
						    || #quest_progress{id =
									   V2_id,
								       finish =
									   V2_finish,
								       target =
									   V2_target,
								       target_val
									   =
									   V2_target_val,
								       value =
									   V2_value}
							   <- V1_progress]))/binary>>
				 || #grow_data{day = V1_day,
					       goal_id = V1_goal_id,
					       condition = V1_condition,
					       lev = V1_lev, status = V1_status,
					       target_type = V1_target_type,
					       progress = V1_progress}
					<- V0_grow_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13603:16,
       D_a_t_a/binary>>};
pack(13604, cli, {}) -> {ok, <<2:32, 13604:16>>};
pack(13604, srv,
     {V0_period, V0_cur_day, V0_end_time, V0_lev, V0_exp,
      V0_list}) ->
    D_a_t_a = <<V0_period:8, V0_cur_day:32, V0_end_time:32,
		V0_lev:32, V0_exp:32, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_target_val:32, V1_value:32>>
				 || {V1_id, V1_finish, V1_target_val, V1_value}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13604:16,
       D_a_t_a/binary>>};
pack(13605, cli, {}) -> {ok, <<2:32, 13605:16>>};
pack(13605, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_target_val:32, V1_value:32>>
				 || {V1_id, V1_finish, V1_target_val, V1_value}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13605:16,
       D_a_t_a/binary>>};
pack(13606, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13606:16,
       D_a_t_a/binary>>};
pack(13606, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13606:16,
       D_a_t_a/binary>>};
pack(13607, cli, {}) -> {ok, <<2:32, 13607:16>>};
pack(13607, srv, {V0_lev, V0_reward_list}) ->
    D_a_t_a = <<V0_lev:32, (length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13607:16,
       D_a_t_a/binary>>};
pack(13608, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13608:16,
       D_a_t_a/binary>>};
pack(13608, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13608:16,
       D_a_t_a/binary>>};
pack(13609, cli, {}) -> {ok, <<2:32, 13609:16>>};
pack(13609, srv, {V0_lev, V0_exp}) ->
    D_a_t_a = <<V0_lev:32, V0_exp:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13609:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(13601, srv, _B0) -> {ok, {}};
unpack(13601, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_period, _B3} = protocol:uint8(_B2),
    {V1_charge, _B4} = protocol:uint32(_B3),
    {V1_cur_day, _B5} = protocol:uint32(_B4),
    {V1_num, _B6} = protocol:uint32(_B5),
    {V1_end_time, _B7} = protocol:uint32(_B6),
    {V1_welfare_list, _B15} = protocol:array(_B7,
					     fun (_B8) ->
						     {V2_day, _B9} =
							 protocol:uint32(_B8),
						     {V2_goal_id, _B10} =
							 protocol:uint32(_B9),
						     {V2_status, _B11} =
							 protocol:uint8(_B10),
						     {V2_target_val, _B12} =
							 protocol:uint32(_B11),
						     {V2_value, _B13} =
							 protocol:uint32(_B12),
						     {{V2_day, V2_goal_id,
						       V2_status, V2_target_val,
						       V2_value},
						      _B13}
					     end),
    {V1_grow_list, _B32} = protocol:array(_B15,
					  fun (_B16) ->
						  {V2_day, _B17} =
						      protocol:uint32(_B16),
						  {V2_goal_id, _B18} =
						      protocol:uint32(_B17),
						  {V2_condition, _B19} =
						      protocol:uint32(_B18),
						  {V2_lev, _B20} =
						      protocol:uint32(_B19),
						  {V2_status, _B21} =
						      protocol:uint8(_B20),
						  {V2_target_type, _B22} =
						      protocol:uint8(_B21),
						  {V2_progress, _B30} =
						      protocol:array(_B22,
								     fun
								       (_B23) ->
									   {V3_id,
									    _B24} =
									       protocol:uint16(_B23),
									   {V3_finish,
									    _B25} =
									       protocol:uint8(_B24),
									   {V3_target,
									    _B26} =
									       protocol:uint32(_B25),
									   {V3_target_val,
									    _B27} =
									       protocol:uint32(_B26),
									   {V3_value,
									    _B28} =
									       protocol:uint32(_B27),
									   {{V3_id,
									     V3_finish,
									     V3_target,
									     V3_target_val,
									     V3_value},
									    _B28}
								     end),
						  {{V2_day, V2_goal_id,
						    V2_condition, V2_lev,
						    V2_status, V2_target_type,
						    V2_progress},
						   _B30}
					  end),
    {V1_price_list, _B37} = protocol:array(_B32,
					   fun (_B33) ->
						   {V2_day, _B34} =
						       protocol:uint32(_B33),
						   {V2_status, _B35} =
						       protocol:uint8(_B34),
						   {{V2_day, V2_status}, _B35}
					   end),
    {V1_finish_list, _B42} = protocol:array(_B37,
					    fun (_B38) ->
						    {V2_goal_id, _B39} =
							protocol:uint32(_B38),
						    {V2_status, _B40} =
							protocol:uint8(_B39),
						    {{V2_goal_id, V2_status},
						     _B40}
					    end),
    {ok,
     {V1_flag, V1_msg, V1_period, V1_charge, V1_cur_day,
      V1_num, V1_end_time, V1_welfare_list, V1_grow_list,
      V1_price_list, V1_finish_list}};
unpack(13602, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_day_type, _B2} = protocol:uint32(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_item, _B4} = protocol:uint32(_B3),
    {ok, {V1_type, V1_day_type, V1_id, V1_item}};
unpack(13602, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_day_type, _B4} = protocol:uint32(_B3),
    {V1_id, _B5} = protocol:uint32(_B4),
    {V1_item, _B6} = protocol:uint32(_B5),
    {V1_status, _B7} = protocol:uint8(_B6),
    {V1_num, _B8} = protocol:uint32(_B7),
    {ok,
     {V1_flag, V1_msg, V1_type, V1_day_type, V1_id, V1_item,
      V1_status, V1_num}};
unpack(13603, srv, _B0) -> {ok, {}};
unpack(13603, cli, _B0) ->
    {V1_grow_list, _B17} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_day, _B2} =
						      protocol:uint32(_B1),
						  {V2_goal_id, _B3} =
						      protocol:uint32(_B2),
						  {V2_condition, _B4} =
						      protocol:uint32(_B3),
						  {V2_lev, _B5} =
						      protocol:uint32(_B4),
						  {V2_status, _B6} =
						      protocol:uint8(_B5),
						  {V2_target_type, _B7} =
						      protocol:uint8(_B6),
						  {V2_progress, _B15} =
						      protocol:array(_B7,
								     fun
								       (_B8) ->
									   {V3_id,
									    _B9} =
									       protocol:uint16(_B8),
									   {V3_finish,
									    _B10} =
									       protocol:uint8(_B9),
									   {V3_target,
									    _B11} =
									       protocol:uint32(_B10),
									   {V3_target_val,
									    _B12} =
									       protocol:uint32(_B11),
									   {V3_value,
									    _B13} =
									       protocol:uint32(_B12),
									   {{V3_id,
									     V3_finish,
									     V3_target,
									     V3_target_val,
									     V3_value},
									    _B13}
								     end),
						  {{V2_day, V2_goal_id,
						    V2_condition, V2_lev,
						    V2_status, V2_target_type,
						    V2_progress},
						   _B15}
					  end),
    {ok, {V1_grow_list}};
unpack(13604, srv, _B0) -> {ok, {}};
unpack(13604, cli, _B0) ->
    {V1_period, _B1} = protocol:uint8(_B0),
    {V1_cur_day, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_lev, _B4} = protocol:uint32(_B3),
    {V1_exp, _B5} = protocol:uint32(_B4),
    {V1_list, _B12} = protocol:array(_B5,
				     fun (_B6) ->
					     {V2_id, _B7} =
						 protocol:uint32(_B6),
					     {V2_finish, _B8} =
						 protocol:uint8(_B7),
					     {V2_target_val, _B9} =
						 protocol:uint32(_B8),
					     {V2_value, _B10} =
						 protocol:uint32(_B9),
					     {{V2_id, V2_finish, V2_target_val,
					       V2_value},
					      _B10}
				     end),
    {ok,
     {V1_period, V1_cur_day, V1_end_time, V1_lev, V1_exp,
      V1_list}};
unpack(13605, srv, _B0) -> {ok, {}};
unpack(13605, cli, _B0) ->
    {V1_list, _B7} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint32(_B1),
					    {V2_finish, _B3} =
						protocol:uint8(_B2),
					    {V2_target_val, _B4} =
						protocol:uint32(_B3),
					    {V2_value, _B5} =
						protocol:uint32(_B4),
					    {{V2_id, V2_finish, V2_target_val,
					      V2_value},
					     _B5}
				    end),
    {ok, {V1_list}};
unpack(13606, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(13606, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13607, srv, _B0) -> {ok, {}};
unpack(13607, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_reward_list, _B5} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_id, _B3} =
						       protocol:uint16(_B2),
						   {V2_id, _B3}
					   end),
    {ok, {V1_lev, V1_reward_list}};
unpack(13608, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(13608, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(13609, srv, _B0) -> {ok, {}};
unpack(13609, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_exp, _B2} = protocol:uint32(_B1),
    {ok, {V1_lev, V1_exp}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


