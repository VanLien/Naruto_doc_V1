-file("src/proto/proto_104.erl", 1).

-module(proto_104).

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

-file("src/proto/proto_104.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(10400, cli, {}) -> {ok, <<2:32, 10400:16>>};
pack(10400, srv, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_accept_time:32, (length(V1_progress)):16,
				   (list_to_binary([<<V2_id:16/signed,
						      V2_finish:8, V2_target:32,
						      V2_target_val:32,
						      V2_value:32,
						      (length(V2_ext_data)):16,
						      (list_to_binary([<<V3_key:8,
									 V3_value:32>>
								       || {V3_key,
									   V3_value}
									      <- V2_ext_data]))/binary>>
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
									   V2_value,
								       ext_data
									   =
									   V2_ext_data}
							   <- V1_progress]))/binary>>
				 || #quest{id = V1_id, finish = V1_finish,
					   accept_time = V1_accept_time,
					   progress = V1_progress}
					<- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10400:16,
       D_a_t_a/binary>>};
pack(10402, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10402:16,
       D_a_t_a/binary>>};
pack(10402, srv, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/signed,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10402:16,
       D_a_t_a/binary>>};
pack(10403, srv, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_accept_time:32, (length(V1_progress)):16,
				   (list_to_binary([<<V2_id:16/signed,
						      V2_finish:8, V2_target:32,
						      V2_target_val:32,
						      V2_value:32,
						      (length(V2_ext_data)):16,
						      (list_to_binary([<<V3_key:8,
									 V3_value:32>>
								       || {V3_key,
									   V3_value}
									      <- V2_ext_data]))/binary>>
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
									   V2_value,
								       ext_data
									   =
									   V2_ext_data}
							   <- V1_progress]))/binary>>
				 || #quest{id = V1_id, finish = V1_finish,
					   accept_time = V1_accept_time,
					   progress = V1_progress}
					<- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10403:16,
       D_a_t_a/binary>>};
pack(10404, srv, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10404:16,
       D_a_t_a/binary>>};
pack(10405, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10405:16,
       D_a_t_a/binary>>};
pack(10405, srv, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/signed,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10405:16,
       D_a_t_a/binary>>};
pack(10406, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10406:16,
       D_a_t_a/binary>>};
pack(10406, srv, {V0_flag, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_flag:8/signed,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10406:16,
       D_a_t_a/binary>>};
pack(10407, srv, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10407:16,
       D_a_t_a/binary>>};
pack(10408, srv, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10408:16,
       D_a_t_a/binary>>};
pack(10409, srv, {V0_quest_list}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_accept_time:32, (length(V1_progress)):16,
				   (list_to_binary([<<V2_id:16/signed,
						      V2_finish:8, V2_target:32,
						      V2_target_val:32,
						      V2_value:32,
						      (length(V2_ext_data)):16,
						      (list_to_binary([<<V3_key:8,
									 V3_value:32>>
								       || {V3_key,
									   V3_value}
									      <- V2_ext_data]))/binary>>
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
									   V2_value,
								       ext_data
									   =
									   V2_ext_data}
							   <- V1_progress]))/binary>>
				 || #quest{id = V1_id, finish = V1_finish,
					   accept_time = V1_accept_time,
					   progress = V1_progress}
					<- V0_quest_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10409:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(10400, srv, _B0) -> {ok, {}};
unpack(10400, cli, _B0) ->
    {V1_quest_list, _B19} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_finish, _B3} =
						       protocol:uint8(_B2),
						   {V2_accept_time, _B4} =
						       protocol:uint32(_B3),
						   {V2_progress, _B17} =
						       protocol:array(_B4,
								      fun
									(_B5) ->
									    {V3_id,
									     _B6} =
										protocol:int16(_B5),
									    {V3_finish,
									     _B7} =
										protocol:uint8(_B6),
									    {V3_target,
									     _B8} =
										protocol:uint32(_B7),
									    {V3_target_val,
									     _B9} =
										protocol:uint32(_B8),
									    {V3_value,
									     _B10} =
										protocol:uint32(_B9),
									    {V3_ext_data,
									     _B15} =
										protocol:array(_B10,
											       fun
												 (_B11) ->
												     {V4_key,
												      _B12} =
													 protocol:uint8(_B11),
												     {V4_value,
												      _B13} =
													 protocol:uint32(_B12),
												     {{V4_key,
												       V4_value},
												      _B13}
											       end),
									    {{V3_id,
									      V3_finish,
									      V3_target,
									      V3_target_val,
									      V3_value,
									      V3_ext_data},
									     _B15}
								      end),
						   {{V2_id, V2_finish,
						     V2_accept_time,
						     V2_progress},
						    _B17}
					   end),
    {ok, {V1_quest_list}};
unpack(10402, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(10402, cli, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(10403, cli, _B0) ->
    {V1_quest_list, _B19} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_finish, _B3} =
						       protocol:uint8(_B2),
						   {V2_accept_time, _B4} =
						       protocol:uint32(_B3),
						   {V2_progress, _B17} =
						       protocol:array(_B4,
								      fun
									(_B5) ->
									    {V3_id,
									     _B6} =
										protocol:int16(_B5),
									    {V3_finish,
									     _B7} =
										protocol:uint8(_B6),
									    {V3_target,
									     _B8} =
										protocol:uint32(_B7),
									    {V3_target_val,
									     _B9} =
										protocol:uint32(_B8),
									    {V3_value,
									     _B10} =
										protocol:uint32(_B9),
									    {V3_ext_data,
									     _B15} =
										protocol:array(_B10,
											       fun
												 (_B11) ->
												     {V4_key,
												      _B12} =
													 protocol:uint8(_B11),
												     {V4_value,
												      _B13} =
													 protocol:uint32(_B12),
												     {{V4_key,
												       V4_value},
												      _B13}
											       end),
									    {{V3_id,
									      V3_finish,
									      V3_target,
									      V3_target_val,
									      V3_value,
									      V3_ext_data},
									     _B15}
								      end),
						   {{V2_id, V2_finish,
						     V2_accept_time,
						     V2_progress},
						    _B17}
					   end),
    {ok, {V1_quest_list}};
unpack(10404, cli, _B0) ->
    {V1_quest_list, _B4} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_id, _B2}
					  end),
    {ok, {V1_quest_list}};
unpack(10405, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(10405, cli, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(10406, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(10406, cli, _B0) ->
    {V1_flag, _B1} = protocol:int8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_flag, V1_msg, V1_id}};
unpack(10407, cli, _B0) ->
    {V1_quest_list, _B4} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_id, _B2}
					  end),
    {ok, {V1_quest_list}};
unpack(10408, cli, _B0) ->
    {V1_quest_list, _B4} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_id, _B2}
					  end),
    {ok, {V1_quest_list}};
unpack(10409, cli, _B0) ->
    {V1_quest_list, _B19} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_finish, _B3} =
						       protocol:uint8(_B2),
						   {V2_accept_time, _B4} =
						       protocol:uint32(_B3),
						   {V2_progress, _B17} =
						       protocol:array(_B4,
								      fun
									(_B5) ->
									    {V3_id,
									     _B6} =
										protocol:int16(_B5),
									    {V3_finish,
									     _B7} =
										protocol:uint8(_B6),
									    {V3_target,
									     _B8} =
										protocol:uint32(_B7),
									    {V3_target_val,
									     _B9} =
										protocol:uint32(_B8),
									    {V3_value,
									     _B10} =
										protocol:uint32(_B9),
									    {V3_ext_data,
									     _B15} =
										protocol:array(_B10,
											       fun
												 (_B11) ->
												     {V4_key,
												      _B12} =
													 protocol:uint8(_B11),
												     {V4_value,
												      _B13} =
													 protocol:uint32(_B12),
												     {{V4_key,
												       V4_value},
												      _B13}
											       end),
									    {{V3_id,
									      V3_finish,
									      V3_target,
									      V3_target_val,
									      V3_value,
									      V3_ext_data},
									     _B15}
								      end),
						   {{V2_id, V2_finish,
						     V2_accept_time,
						     V2_progress},
						    _B17}
					   end),
    {ok, {V1_quest_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


