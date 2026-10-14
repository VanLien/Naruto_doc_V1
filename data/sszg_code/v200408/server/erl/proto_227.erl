-file("src/proto/proto_227.erl", 1).

-module(proto_227).

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
		  hide]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

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

-file("src/proto/proto_227.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(22700, cli, {V0_is_cluster}) ->
    D_a_t_a = <<V0_is_cluster:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22700:16,
       D_a_t_a/binary>>};
pack(22700, srv, {V0_is_cluster, V0_rank_list}) ->
    D_a_t_a = <<V0_is_cluster:8, (length(V0_rank_list)):16,
		(list_to_binary([<<V1_id:8, V1_end_time:32>>
				 || {V1_id, V1_end_time}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22700:16,
       D_a_t_a/binary>>};
pack(22701, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22701:16,
       D_a_t_a/binary>>};
pack(22701, srv,
     {V0_id, V0_end_time, V0_rank, V0_rank_list}) ->
    D_a_t_a = <<V0_id:8, V0_end_time:32, V0_rank:8,
		(length(V0_rank_list)):16,
		(list_to_binary([<<V1_idx:8,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:8, V1_face_id:32, V1_avatar_id:32,
				   V1_rid:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_idx, V1_name, V1_lev, V1_face_id,
				     V1_avatar_id, V1_rid, V1_srv_id}
					<- V0_rank_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22701:16,
       D_a_t_a/binary>>};
pack(22702, cli, {}) -> {ok, <<2:32, 22702:16>>};
pack(22702, srv, {V0_feat_list}) ->
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
     <<(byte_size(D_a_t_a) + 2):32, 22702:16,
       D_a_t_a/binary>>};
pack(22703, cli, {}) -> {ok, <<2:32, 22703:16>>};
pack(22703, srv, {V0_feat_list}) ->
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
     <<(byte_size(D_a_t_a) + 2):32, 22703:16,
       D_a_t_a/binary>>};
pack(22704, cli, {V0_quest_id}) ->
    D_a_t_a = <<V0_quest_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22704:16,
       D_a_t_a/binary>>};
pack(22704, srv, {V0_result, V0_msg, V0_quest_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_quest_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22704:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(22700, srv, _B0) ->
    {V1_is_cluster, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_cluster}};
unpack(22700, cli, _B0) ->
    {V1_is_cluster, _B1} = protocol:uint8(_B0),
    {V1_rank_list, _B6} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_id, _B3} =
						     protocol:uint8(_B2),
						 {V2_end_time, _B4} =
						     protocol:uint32(_B3),
						 {{V2_id, V2_end_time}, _B4}
					 end),
    {ok, {V1_is_cluster, V1_rank_list}};
unpack(22701, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(22701, cli, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_rank, _B3} = protocol:uint8(_B2),
    {V1_rank_list, _B13} = protocol:array(_B3,
					  fun (_B4) ->
						  {V2_idx, _B5} =
						      protocol:uint8(_B4),
						  {V2_name, _B6} =
						      protocol:string(_B5),
						  {V2_lev, _B7} =
						      protocol:uint8(_B6),
						  {V2_face_id, _B8} =
						      protocol:uint32(_B7),
						  {V2_avatar_id, _B9} =
						      protocol:uint32(_B8),
						  {V2_rid, _B10} =
						      protocol:uint32(_B9),
						  {V2_srv_id, _B11} =
						      protocol:string(_B10),
						  {{V2_idx, V2_name, V2_lev,
						    V2_face_id, V2_avatar_id,
						    V2_rid, V2_srv_id},
						   _B11}
					  end),
    {ok, {V1_id, V1_end_time, V1_rank, V1_rank_list}};
unpack(22702, srv, _B0) -> {ok, {}};
unpack(22702, cli, _B0) ->
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
unpack(22703, srv, _B0) -> {ok, {}};
unpack(22703, cli, _B0) ->
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
unpack(22704, srv, _B0) ->
    {V1_quest_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_quest_id}};
unpack(22704, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_quest_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_quest_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


