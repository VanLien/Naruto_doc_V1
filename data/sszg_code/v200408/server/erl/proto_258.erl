-file("src/proto/proto_258.erl", 1).

-module(proto_258).

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
		{room_rank_info,
		 [id, name, lev, face, avatar_bid, time, fans_num, rank,
		  look_id, face_update_time, face_file]},
		{room_fans_num, [id, fans]}, {room_fans, [myid, fid]},
		{room_bbs_message_below, [id, role_id, name, bbs_id]},
		{room_bbs_message,
		 [id, bbs_id, bbs_type, reply_name, reply_bbs_id,
		  reply_id, msg, time, tar_id, face_id, avatar_id, lev,
		  sex, name, face_update_time, face_file]},
		{room_honor_badges, [id, time]},
		{room_grow, [id, order, time, arge, ext]},
		{m_room_grow, [ver, finish, doing, info, next_id, ext]},
		{m_room_feat, [ver, flag, finish, doing, overdue, ext]},
		{m_room,
		 [ver, city_id, fanse_list, honor_badges, honor_point,
		  use_badges, room_bbs_set, room_bbs_num]}]).

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

-file("src/proto/proto_258.erl", 16).

-file("inc/role_room.hrl", 1).

-record(m_room,
	{ver = 3, city_id = 0, fanse_list = [],
	 honor_badges = [], honor_point = 0, use_badges = [],
	 room_bbs_set = 1, room_bbs_num = 0}).

-record(m_room_feat,
	{ver = 1, flag = 0,
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()], ext = []}).

-record(m_room_grow,
	{ver = 1, finish = []  :: [pos_integer()],
	 doing = []  :: [tuple()], info = [], next_id = 1,
	 ext = []}).

-record(room_grow,
	{id = 0, order = 0, time = 0, arge = [], ext = []}).

-record(room_honor_badges, {id = 0, time = 0}).

-record(room_bbs_message,
	{id = {0, <<>>}, bbs_id = 0, bbs_type = 0,
	 reply_name = <<>>, reply_bbs_id = 0,
	 reply_id = {0, <<>>}, msg = <<>>, time = 0,
	 tar_id = {0, <<>>}, face_id = 0, avatar_id = 0, lev = 0,
	 sex = 0, name = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(room_bbs_message_below,
	{id = {0, <<>>}, role_id = {0, <<>>}, name = <<>>,
	 bbs_id = 0}).

-record(room_fans, {myid = {0, <<>>}, fid = {0, <<>>}}).

-record(room_fans_num, {id = {0, <<>>}, fans = 0}).

-record(room_rank_info,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, fans_num = 0, rank = 0,
	 look_id = 0, face_update_time = 0, face_file = <<>>}).

-file("src/proto/proto_258.erl", 17).

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

-file("src/proto/proto_258.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25800, cli, {V0_city_id}) ->
    D_a_t_a = <<V0_city_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25800:16,
       D_a_t_a/binary>>};
pack(25800, srv, {V0_code, V0_msg, V0_city_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_city_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25800:16,
       D_a_t_a/binary>>};
pack(25801, cli, {{V0_rid, V0_srv_id}}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25801:16,
       D_a_t_a/binary>>};
pack(25801, srv, {V0_code, V0_msg, V0_flag}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25801:16,
       D_a_t_a/binary>>};
pack(25802, cli, {}) -> {ok, <<2:32, 25802:16>>};
pack(25802, srv, {V0_rank, V0_rank_list}) ->
    D_a_t_a = <<V0_rank:16, (length(V0_rank_list)):16,
		(list_to_binary([<<V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:16, V1_face:32, V1_rank:16,
				   V1_avatar_bid:32, V1_fans_num:32,
				   V1_look_id:32, V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #room_rank_info{id = {V1_rid, V1_srv_id},
						    name = V1_name,
						    lev = V1_lev,
						    face = V1_face,
						    rank = V1_rank,
						    avatar_bid = V1_avatar_bid,
						    fans_num = V1_fans_num,
						    look_id = V1_look_id,
						    face_update_time =
							V1_face_update_time,
						    face_file = V1_face_file}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25802:16,
       D_a_t_a/binary>>};
pack(25805, cli, {V0_pos, V0_id}) ->
    D_a_t_a = <<V0_pos:8, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25805:16,
       D_a_t_a/binary>>};
pack(25805, srv, {V0_code, V0_msg, V0_pos, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_pos:8,
		V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25805:16,
       D_a_t_a/binary>>};
pack(25806, cli, {{V0_rid, V0_srv_id}}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25806:16,
       D_a_t_a/binary>>};
pack(25806, srv,
     {V0_point, V0_honor_badges, V0_use_badges}) ->
    D_a_t_a = <<V0_point:32, (length(V0_honor_badges)):16,
		(list_to_binary([<<V1_id:32, V1_time:32>>
				 || #room_honor_badges{id = V1_id,
						       time = V1_time}
					<- V0_honor_badges]))/binary,
		(length(V0_use_badges)):16,
		(list_to_binary([<<V1_pos:8, V1_id:32>>
				 || {V1_pos, V1_id}
					<- V0_use_badges]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25806:16,
       D_a_t_a/binary>>};
pack(25807, cli, {}) -> {ok, <<2:32, 25807:16>>};
pack(25807, srv, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25807:16,
       D_a_t_a/binary>>};
pack(25810, cli, {}) -> {ok, <<2:32, 25810:16>>};
pack(25810, srv, {V0_feat_list, V0_finish_list}) ->
    D_a_t_a = <<(length(V0_feat_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_end_time:32, V1_finish_time:32,
				   (length(V1_progress)):16,
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
				 || #quest{id = V1_id, finish = V1_finish,
					   end_time = V1_end_time,
					   finish_time = V1_finish_time,
					   progress = V1_progress}
					<- V0_feat_list]))/binary,
		(length(V0_finish_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish_time:32>>
				 || {V1_id, V1_finish_time}
					<- V0_finish_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25810:16,
       D_a_t_a/binary>>};
pack(25811, cli, {}) -> {ok, <<2:32, 25811:16>>};
pack(25811, srv, {V0_feat_list}) ->
    D_a_t_a = <<(length(V0_feat_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_end_time:32, V1_finish_time:32,
				   (length(V1_progress)):16,
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
				 || #quest{id = V1_id, finish = V1_finish,
					   end_time = V1_end_time,
					   finish_time = V1_finish_time,
					   progress = V1_progress}
					<- V0_feat_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25811:16,
       D_a_t_a/binary>>};
pack(25812, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25812:16,
       D_a_t_a/binary>>};
pack(25812, srv,
     {V0_code, V0_msg, V0_id, V0_finish_time}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32,
		V0_finish_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25812:16,
       D_a_t_a/binary>>};
pack(25813, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25813:16,
       D_a_t_a/binary>>};
pack(25813, srv, {}) -> {ok, <<2:32, 25813:16>>};
pack(25814, cli, {}) -> {ok, <<2:32, 25814:16>>};
pack(25814, srv, {V0_result}) ->
    D_a_t_a = <<V0_result:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25814:16,
       D_a_t_a/binary>>};
pack(25815, cli, {V0_id, V0_channel}) ->
    D_a_t_a = <<V0_id:32, V0_channel:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25815:16,
       D_a_t_a/binary>>};
pack(25815, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25815:16,
       D_a_t_a/binary>>};
pack(25816, cli, {V0_share_id, V0_srv_id}) ->
    D_a_t_a = <<V0_share_id:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25816:16,
       D_a_t_a/binary>>};
pack(25816, srv,
     {V0_id, V0_finish_time, V0_share_id}) ->
    D_a_t_a = <<V0_id:32, V0_finish_time:32,
		V0_share_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25816:16,
       D_a_t_a/binary>>};
pack(25817, cli, {V0_id, V0_channel}) ->
    D_a_t_a = <<V0_id:32, V0_channel:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25817:16,
       D_a_t_a/binary>>};
pack(25817, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25817:16,
       D_a_t_a/binary>>};
pack(25818, cli, {V0_share_id, V0_srv_id}) ->
    D_a_t_a = <<V0_share_id:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25818:16,
       D_a_t_a/binary>>};
pack(25818, srv,
     {V0_id, V0_finish_time, V0_share_id}) ->
    D_a_t_a = <<V0_id:32, V0_finish_time:32,
		V0_share_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25818:16,
       D_a_t_a/binary>>};
pack(25819, cli, {V0_channel}) ->
    D_a_t_a = <<V0_channel:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25819:16,
       D_a_t_a/binary>>};
pack(25819, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25819:16,
       D_a_t_a/binary>>};
pack(25820, cli, {V0_share_id, V0_srv_id}) ->
    D_a_t_a = <<V0_share_id:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25820:16,
       D_a_t_a/binary>>};
pack(25820, srv, {V0_point, V0_num, V0_share_id}) ->
    D_a_t_a = <<V0_point:32, V0_num:32, V0_share_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25820:16,
       D_a_t_a/binary>>};
pack(25830, cli, {V0_start, V0_num}) ->
    D_a_t_a = <<V0_start:16, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25830:16,
       D_a_t_a/binary>>};
pack(25830, srv,
     {V0_start, V0_num, V0_max_num, V0_progress}) ->
    D_a_t_a = <<V0_start:16, V0_num:8, V0_max_num:32,
		(length(V0_progress)):16,
		(list_to_binary([<<V1_id:32, V1_order:32, V1_time:32,
				   (length(V1_arge)):16,
				   (list_to_binary([<<V2_pos:8,
						      (protocol:pack(string,
								     V2_val))/binary>>
						    || {V2_pos, V2_val}
							   <- V1_arge]))/binary>>
				 || #room_grow{id = V1_id, order = V1_order,
					       time = V1_time, arge = V1_arge}
					<- V0_progress]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25830:16,
       D_a_t_a/binary>>};
pack(25831, cli, {V0_channel}) ->
    D_a_t_a = <<V0_channel:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25831:16,
       D_a_t_a/binary>>};
pack(25831, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25831:16,
       D_a_t_a/binary>>};
pack(25832, cli,
     {V0_rid, V0_srv_id, V0_start, V0_num}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_start:16,
		V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25832:16,
       D_a_t_a/binary>>};
pack(25832, srv,
     {V0_rid, V0_srv_id, V0_start, V0_num, V0_max_num,
      V0_room_grow_info}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_start:16,
		V0_num:8, V0_max_num:16, (length(V0_room_grow_info)):16,
		(list_to_binary([<<V1_id:32, V1_order:32, V1_time:32,
				   (length(V1_arge)):16,
				   (list_to_binary([<<V2_pos:8,
						      (protocol:pack(string,
								     V2_val))/binary>>
						    || {V2_pos, V2_val}
							   <- V1_arge]))/binary>>
				 || #room_grow{id = V1_id, order = V1_order,
					       time = V1_time, arge = V1_arge}
					<- V0_room_grow_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25832:16,
       D_a_t_a/binary>>};
pack(25833, cli, {}) -> {ok, <<2:32, 25833:16>>};
pack(25833, srv, {V0_id, V0_name}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25833:16,
       D_a_t_a/binary>>};
pack(25835, cli, {V0_rid, V0_srv_id, V0_msg}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25835:16,
       D_a_t_a/binary>>};
pack(25835, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25835:16,
       D_a_t_a/binary>>};
pack(25836, cli,
     {V0_rid, V0_srv_id, V0_bbs_id, V0_msg}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_bbs_id:32,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25836:16,
       D_a_t_a/binary>>};
pack(25836, srv, {V0_result, V0_msg}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25836:16,
       D_a_t_a/binary>>};
pack(25837, cli,
     {V0_rid, V0_srv_id, V0_start, V0_num}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_start:16,
		V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25837:16,
       D_a_t_a/binary>>};
pack(25837, srv,
     {V0_result, V0_msg, V0_rid, V0_srv_id, V0_start, V0_num,
      V0_max_num, V0_room_bbs_info}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_start:16,
		V0_num:8, V0_max_num:32, (length(V0_room_bbs_info)):16,
		(list_to_binary([<<V1_bbs_id:32, V1_bbs_type:32,
				   (protocol:pack(string,
						  V1_reply_name))/binary,
				   (protocol:pack(string, V1_msg))/binary,
				   V1_time:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_face_id:32, V1_avatar_id:32, V1_lev:16,
				   V1_sex:8,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #room_bbs_message{bbs_id = V1_bbs_id,
						      bbs_type = V1_bbs_type,
						      reply_name =
							  V1_reply_name,
						      msg = V1_msg,
						      time = V1_time,
						      tar_id =
							  {V1_rid, V1_srv_id},
						      face_id = V1_face_id,
						      avatar_id = V1_avatar_id,
						      lev = V1_lev,
						      sex = V1_sex,
						      name = V1_name,
						      face_update_time =
							  V1_face_update_time,
						      face_file = V1_face_file}
					<- V0_room_bbs_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25837:16,
       D_a_t_a/binary>>};
pack(25838, cli, {V0_bbs_id}) ->
    D_a_t_a = <<V0_bbs_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25838:16,
       D_a_t_a/binary>>};
pack(25838, srv, {V0_result, V0_msg, V0_bbs_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_bbs_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25838:16,
       D_a_t_a/binary>>};
pack(25839, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25839:16,
       D_a_t_a/binary>>};
pack(25839, srv, {V0_result, V0_msg, V0_type}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25839:16,
       D_a_t_a/binary>>};
pack(25840, cli, {{V0_rid, V0_srv_id}, V0_bbs_id}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		V0_bbs_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25840:16,
       D_a_t_a/binary>>};
pack(25840, srv, {}) -> {ok, <<2:32, 25840:16>>};
pack(25841, cli, {}) -> {ok, <<2:32, 25841:16>>};
pack(25841, srv,
     {V0_max_num, {V0_rid, V0_srv_id}, V0_room_bbs_info}) ->
    D_a_t_a = <<V0_max_num:32, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(length(V0_room_bbs_info)):16,
		(list_to_binary([<<V1_bbs_id:32, V1_bbs_type:32,
				   (protocol:pack(string,
						  V1_reply_name))/binary,
				   (protocol:pack(string, V1_msg))/binary,
				   V1_time:32, V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_face_id:32, V1_avatar_id:32, V1_lev:16,
				   V1_sex:8,
				   (protocol:pack(string, V1_name))/binary,
				   V1_face_update_time:32,
				   (protocol:pack(string,
						  V1_face_file))/binary>>
				 || #room_bbs_message{bbs_id = V1_bbs_id,
						      bbs_type = V1_bbs_type,
						      reply_name =
							  V1_reply_name,
						      msg = V1_msg,
						      time = V1_time,
						      tar_id =
							  {V1_rid, V1_srv_id},
						      face_id = V1_face_id,
						      avatar_id = V1_avatar_id,
						      lev = V1_lev,
						      sex = V1_sex,
						      name = V1_name,
						      face_update_time =
							  V1_face_update_time,
						      face_file = V1_face_file}
					<- V0_room_bbs_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25841:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25800, srv, _B0) ->
    {V1_city_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_city_id}};
unpack(25800, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_city_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_city_id}};
unpack(25801, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(25801, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_flag}};
unpack(25802, srv, _B0) -> {ok, {}};
unpack(25802, cli, _B0) ->
    {V1_rank, _B1} = protocol:uint16(_B0),
    {V1_rank_list, _B15} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_rid, _B3} =
						      protocol:uint32(_B2),
						  {V2_srv_id, _B4} =
						      protocol:string(_B3),
						  {V2_name, _B5} =
						      protocol:string(_B4),
						  {V2_lev, _B6} =
						      protocol:uint16(_B5),
						  {V2_face, _B7} =
						      protocol:uint32(_B6),
						  {V2_rank, _B8} =
						      protocol:uint16(_B7),
						  {V2_avatar_bid, _B9} =
						      protocol:uint32(_B8),
						  {V2_fans_num, _B10} =
						      protocol:uint32(_B9),
						  {V2_look_id, _B11} =
						      protocol:uint32(_B10),
						  {V2_face_update_time, _B12} =
						      protocol:uint32(_B11),
						  {V2_face_file, _B13} =
						      protocol:string(_B12),
						  {{V2_rid, V2_srv_id, V2_name,
						    V2_lev, V2_face, V2_rank,
						    V2_avatar_bid, V2_fans_num,
						    V2_look_id,
						    V2_face_update_time,
						    V2_face_file},
						   _B13}
					  end),
    {ok, {V1_rank, V1_rank_list}};
unpack(25805, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_pos, V1_id}};
unpack(25805, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_pos, _B3} = protocol:uint8(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_code, V1_msg, V1_pos, V1_id}};
unpack(25806, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_rid, V1_srv_id}};
unpack(25806, cli, _B0) ->
    {V1_point, _B1} = protocol:uint32(_B0),
    {V1_honor_badges, _B6} = protocol:array(_B1,
					    fun (_B2) ->
						    {V2_id, _B3} =
							protocol:uint32(_B2),
						    {V2_time, _B4} =
							protocol:uint32(_B3),
						    {{V2_id, V2_time}, _B4}
					    end),
    {V1_use_badges, _B11} = protocol:array(_B6,
					   fun (_B7) ->
						   {V2_pos, _B8} =
						       protocol:uint8(_B7),
						   {V2_id, _B9} =
						       protocol:uint32(_B8),
						   {{V2_pos, V2_id}, _B9}
					   end),
    {ok, {V1_point, V1_honor_badges, V1_use_badges}};
unpack(25807, srv, _B0) -> {ok, {}};
unpack(25807, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(25810, srv, _B0) -> {ok, {}};
unpack(25810, cli, _B0) ->
    {V1_feat_list, _B15} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_finish, _B3} =
						      protocol:uint8(_B2),
						  {V2_end_time, _B4} =
						      protocol:uint32(_B3),
						  {V2_finish_time, _B5} =
						      protocol:uint32(_B4),
						  {V2_progress, _B13} =
						      protocol:array(_B5,
								     fun
								       (_B6) ->
									   {V3_id,
									    _B7} =
									       protocol:uint16(_B6),
									   {V3_finish,
									    _B8} =
									       protocol:uint8(_B7),
									   {V3_target,
									    _B9} =
									       protocol:uint32(_B8),
									   {V3_target_val,
									    _B10} =
									       protocol:uint32(_B9),
									   {V3_value,
									    _B11} =
									       protocol:uint32(_B10),
									   {{V3_id,
									     V3_finish,
									     V3_target,
									     V3_target_val,
									     V3_value},
									    _B11}
								     end),
						  {{V2_id, V2_finish,
						    V2_end_time, V2_finish_time,
						    V2_progress},
						   _B13}
					  end),
    {V1_finish_list, _B20} = protocol:array(_B15,
					    fun (_B16) ->
						    {V2_id, _B17} =
							protocol:uint32(_B16),
						    {V2_finish_time, _B18} =
							protocol:uint32(_B17),
						    {{V2_id, V2_finish_time},
						     _B18}
					    end),
    {ok, {V1_feat_list, V1_finish_list}};
unpack(25811, srv, _B0) -> {ok, {}};
unpack(25811, cli, _B0) ->
    {V1_feat_list, _B15} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_finish, _B3} =
						      protocol:uint8(_B2),
						  {V2_end_time, _B4} =
						      protocol:uint32(_B3),
						  {V2_finish_time, _B5} =
						      protocol:uint32(_B4),
						  {V2_progress, _B13} =
						      protocol:array(_B5,
								     fun
								       (_B6) ->
									   {V3_id,
									    _B7} =
									       protocol:uint16(_B6),
									   {V3_finish,
									    _B8} =
									       protocol:uint8(_B7),
									   {V3_target,
									    _B9} =
									       protocol:uint32(_B8),
									   {V3_target_val,
									    _B10} =
									       protocol:uint32(_B9),
									   {V3_value,
									    _B11} =
									       protocol:uint32(_B10),
									   {{V3_id,
									     V3_finish,
									     V3_target,
									     V3_target_val,
									     V3_value},
									    _B11}
								     end),
						  {{V2_id, V2_finish,
						    V2_end_time, V2_finish_time,
						    V2_progress},
						   _B13}
					  end),
    {ok, {V1_feat_list}};
unpack(25812, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(25812, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_finish_time, _B4} = protocol:uint32(_B3),
    {ok, {V1_code, V1_msg, V1_id, V1_finish_time}};
unpack(25813, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(25813, cli, _B0) -> {ok, {}};
unpack(25814, srv, _B0) -> {ok, {}};
unpack(25814, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {ok, {V1_result}};
unpack(25815, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_channel, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_channel}};
unpack(25815, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(25816, srv, _B0) ->
    {V1_share_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_share_id, V1_srv_id}};
unpack(25816, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_finish_time, _B2} = protocol:uint32(_B1),
    {V1_share_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_finish_time, V1_share_id}};
unpack(25817, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_channel, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_channel}};
unpack(25817, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(25818, srv, _B0) ->
    {V1_share_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_share_id, V1_srv_id}};
unpack(25818, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_finish_time, _B2} = protocol:uint32(_B1),
    {V1_share_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_finish_time, V1_share_id}};
unpack(25819, srv, _B0) ->
    {V1_channel, _B1} = protocol:uint16(_B0),
    {ok, {V1_channel}};
unpack(25819, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(25820, srv, _B0) ->
    {V1_share_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_share_id, V1_srv_id}};
unpack(25820, cli, _B0) ->
    {V1_point, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {V1_share_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_point, V1_num, V1_share_id}};
unpack(25830, srv, _B0) ->
    {V1_start, _B1} = protocol:uint16(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {ok, {V1_start, V1_num}};
unpack(25830, cli, _B0) ->
    {V1_start, _B1} = protocol:uint16(_B0),
    {V1_num, _B2} = protocol:uint8(_B1),
    {V1_max_num, _B3} = protocol:uint32(_B2),
    {V1_progress, _B14} = protocol:array(_B3,
					 fun (_B4) ->
						 {V2_id, _B5} =
						     protocol:uint32(_B4),
						 {V2_order, _B6} =
						     protocol:uint32(_B5),
						 {V2_time, _B7} =
						     protocol:uint32(_B6),
						 {V2_arge, _B12} =
						     protocol:array(_B7,
								    fun (_B8) ->
									    {V3_pos,
									     _B9} =
										protocol:uint8(_B8),
									    {V3_val,
									     _B10} =
										protocol:string(_B9),
									    {{V3_pos,
									      V3_val},
									     _B10}
								    end),
						 {{V2_id, V2_order, V2_time,
						   V2_arge},
						  _B12}
					 end),
    {ok, {V1_start, V1_num, V1_max_num, V1_progress}};
unpack(25831, srv, _B0) ->
    {V1_channel, _B1} = protocol:uint16(_B0),
    {ok, {V1_channel}};
unpack(25831, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(25832, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_start, _B3} = protocol:uint16(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_srv_id, V1_start, V1_num}};
unpack(25832, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_start, _B3} = protocol:uint16(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {V1_max_num, _B5} = protocol:uint16(_B4),
    {V1_room_grow_info, _B16} = protocol:array(_B5,
					       fun (_B6) ->
						       {V2_id, _B7} =
							   protocol:uint32(_B6),
						       {V2_order, _B8} =
							   protocol:uint32(_B7),
						       {V2_time, _B9} =
							   protocol:uint32(_B8),
						       {V2_arge, _B14} =
							   protocol:array(_B9,
									  fun
									    (_B10) ->
										{V3_pos,
										 _B11} =
										    protocol:uint8(_B10),
										{V3_val,
										 _B12} =
										    protocol:string(_B11),
										{{V3_pos,
										  V3_val},
										 _B12}
									  end),
						       {{V2_id, V2_order,
							 V2_time, V2_arge},
							_B14}
					       end),
    {ok,
     {V1_rid, V1_srv_id, V1_start, V1_num, V1_max_num,
      V1_room_grow_info}};
unpack(25833, srv, _B0) -> {ok, {}};
unpack(25833, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_name}};
unpack(25835, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_rid, V1_srv_id, V1_msg}};
unpack(25835, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(25836, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_bbs_id, _B3} = protocol:uint32(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_rid, V1_srv_id, V1_bbs_id, V1_msg}};
unpack(25836, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_result, V1_msg}};
unpack(25837, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_start, _B3} = protocol:uint16(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {ok, {V1_rid, V1_srv_id, V1_start, V1_num}};
unpack(25837, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_srv_id, _B4} = protocol:string(_B3),
    {V1_start, _B5} = protocol:uint16(_B4),
    {V1_num, _B6} = protocol:uint8(_B5),
    {V1_max_num, _B7} = protocol:uint32(_B6),
    {V1_room_bbs_info, _B24} = protocol:array(_B7,
					      fun (_B8) ->
						      {V2_bbs_id, _B9} =
							  protocol:uint32(_B8),
						      {V2_bbs_type, _B10} =
							  protocol:uint32(_B9),
						      {V2_reply_name, _B11} =
							  protocol:string(_B10),
						      {V2_msg, _B12} =
							  protocol:string(_B11),
						      {V2_time, _B13} =
							  protocol:uint32(_B12),
						      {V2_rid, _B14} =
							  protocol:uint32(_B13),
						      {V2_srv_id, _B15} =
							  protocol:string(_B14),
						      {V2_face_id, _B16} =
							  protocol:uint32(_B15),
						      {V2_avatar_id, _B17} =
							  protocol:uint32(_B16),
						      {V2_lev, _B18} =
							  protocol:uint16(_B17),
						      {V2_sex, _B19} =
							  protocol:uint8(_B18),
						      {V2_name, _B20} =
							  protocol:string(_B19),
						      {V2_face_update_time,
						       _B21} =
							  protocol:uint32(_B20),
						      {V2_face_file, _B22} =
							  protocol:string(_B21),
						      {{V2_bbs_id, V2_bbs_type,
							V2_reply_name, V2_msg,
							V2_time, V2_rid,
							V2_srv_id, V2_face_id,
							V2_avatar_id, V2_lev,
							V2_sex, V2_name,
							V2_face_update_time,
							V2_face_file},
						       _B22}
					      end),
    {ok,
     {V1_result, V1_msg, V1_rid, V1_srv_id, V1_start, V1_num,
      V1_max_num, V1_room_bbs_info}};
unpack(25838, srv, _B0) ->
    {V1_bbs_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_bbs_id}};
unpack(25838, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_bbs_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_bbs_id}};
unpack(25839, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(25839, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {ok, {V1_result, V1_msg, V1_type}};
unpack(25840, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_bbs_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_rid, V1_srv_id, V1_bbs_id}};
unpack(25840, cli, _B0) -> {ok, {}};
unpack(25841, srv, _B0) -> {ok, {}};
unpack(25841, cli, _B0) ->
    {V1_max_num, _B1} = protocol:uint32(_B0),
    {V1_rid, _B2} = protocol:uint32(_B1),
    {V1_srv_id, _B3} = protocol:string(_B2),
    {V1_room_bbs_info, _B20} = protocol:array(_B3,
					      fun (_B4) ->
						      {V2_bbs_id, _B5} =
							  protocol:uint32(_B4),
						      {V2_bbs_type, _B6} =
							  protocol:uint32(_B5),
						      {V2_reply_name, _B7} =
							  protocol:string(_B6),
						      {V2_msg, _B8} =
							  protocol:string(_B7),
						      {V2_time, _B9} =
							  protocol:uint32(_B8),
						      {V2_rid, _B10} =
							  protocol:uint32(_B9),
						      {V2_srv_id, _B11} =
							  protocol:string(_B10),
						      {V2_face_id, _B12} =
							  protocol:uint32(_B11),
						      {V2_avatar_id, _B13} =
							  protocol:uint32(_B12),
						      {V2_lev, _B14} =
							  protocol:uint16(_B13),
						      {V2_sex, _B15} =
							  protocol:uint8(_B14),
						      {V2_name, _B16} =
							  protocol:string(_B15),
						      {V2_face_update_time,
						       _B17} =
							  protocol:uint32(_B16),
						      {V2_face_file, _B18} =
							  protocol:string(_B17),
						      {{V2_bbs_id, V2_bbs_type,
							V2_reply_name, V2_msg,
							V2_time, V2_rid,
							V2_srv_id, V2_face_id,
							V2_avatar_id, V2_lev,
							V2_sex, V2_name,
							V2_face_update_time,
							V2_face_file},
						       _B18}
					      end),
    {ok, {V1_max_num, V1_rid, V1_srv_id, V1_room_bbs_info}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


