-file("src/proto/proto_248.erl", 1).

-module(proto_248).

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

-file("src/proto/proto_248.erl", 16).

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

-file("src/proto/proto_248.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24801, cli, {}) -> {ok, <<2:32, 24801:16>>};
pack(24801, srv, {V0_all_num, V0_award_list}) ->
    D_a_t_a = <<V0_all_num:32, (length(V0_award_list)):16,
		(list_to_binary([<<V1_id:8, V1_flag:8>>
				 || {V1_id, V1_flag}
					<- V0_award_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24801:16,
       D_a_t_a/binary>>};
pack(24802, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24802:16,
       D_a_t_a/binary>>};
pack(24802, srv,
     {V0_flag, V0_msg, V0_count, V0_rand_list}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32,
		(length(V0_rand_list)):16,
		(list_to_binary([<<V1_rand_id:32, V1_status:8>>
				 || {V1_rand_id, V1_status}
					<- V0_rand_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24802:16,
       D_a_t_a/binary>>};
pack(24803, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24803:16,
       D_a_t_a/binary>>};
pack(24803, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24803:16,
       D_a_t_a/binary>>};
pack(24804, cli, {}) -> {ok, <<2:32, 24804:16>>};
pack(24804, srv,
     {V0_lev, V0_exp, V0_camp_id, V0_group_id, V0_combat_num,
      V0_start_time, V0_end_time, V0_show_list,
      V0_make_list}) ->
    D_a_t_a = <<V0_lev:32, V0_exp:32, V0_camp_id:32,
		V0_group_id:32, V0_combat_num:16, V0_start_time:32,
		V0_end_time:32, (length(V0_show_list)):16,
		(list_to_binary([<<V1_show_id:8, V1_num:32>>
				 || {V1_show_id, V1_num}
					<- V0_show_list]))/binary,
		(length(V0_make_list)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num} <- V0_make_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24804:16,
       D_a_t_a/binary>>};
pack(24805, cli, {}) -> {ok, <<2:32, 24805:16>>};
pack(24805, srv, {V0_lev, V0_reward_list}) ->
    D_a_t_a = <<V0_lev:32, (length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:16>>
				 || V1_id <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24805:16,
       D_a_t_a/binary>>};
pack(24806, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24806:16,
       D_a_t_a/binary>>};
pack(24806, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24806:16,
       D_a_t_a/binary>>};
pack(24807, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24807:16,
       D_a_t_a/binary>>};
pack(24807, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24807:16,
       D_a_t_a/binary>>};
pack(24808, cli, {}) -> {ok, <<2:32, 24808:16>>};
pack(24808, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24808:16,
       D_a_t_a/binary>>};
pack(24809, cli, {}) -> {ok, <<2:32, 24809:16>>};
pack(24809, srv, {V0_flag, V0_msg, V0_combat_num}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_combat_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24809:16,
       D_a_t_a/binary>>};
pack(24810, cli, {}) -> {ok, <<2:32, 24810:16>>};
pack(24810, srv, {V0_quest_list, V0_camp_id}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
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
					<- V0_quest_list]))/binary,
		V0_camp_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24810:16,
       D_a_t_a/binary>>};
pack(24811, cli, {}) -> {ok, <<2:32, 24811:16>>};
pack(24811, srv,
     {#quest{id = V0_id, finish = V0_finish,
	     end_time = V0_end_time, finish_time = V0_finish_time,
	     progress = V0_progress}}) ->
    D_a_t_a = <<V0_id:32, V0_finish:8, V0_end_time:32,
		V0_finish_time:32, (length(V0_progress)):16,
		(list_to_binary([<<V1_id:16, V1_finish:8, V1_target:32,
				   V1_target_val:32, V1_value:32>>
				 || #quest_progress{id = V1_id,
						    finish = V1_finish,
						    target = V1_target,
						    target_val = V1_target_val,
						    value = V1_value}
					<- V0_progress]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24811:16,
       D_a_t_a/binary>>};
pack(24812, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24812:16,
       D_a_t_a/binary>>};
pack(24812, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24812:16,
       D_a_t_a/binary>>};
pack(24813, cli, {}) -> {ok, <<2:32, 24813:16>>};
pack(24813, srv, {V0_quest_list, V0_camp_id}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
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
					<- V0_quest_list]))/binary,
		V0_camp_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24813:16,
       D_a_t_a/binary>>};
pack(24814, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24814:16,
       D_a_t_a/binary>>};
pack(24814, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24814:16,
       D_a_t_a/binary>>};
pack(24815, cli, {}) -> {ok, <<2:32, 24815:16>>};
pack(24815, srv, {V0_quest_list, V0_camp_id}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
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
					<- V0_quest_list]))/binary,
		V0_camp_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24815:16,
       D_a_t_a/binary>>};
pack(24816, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24816:16,
       D_a_t_a/binary>>};
pack(24816, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24816:16,
       D_a_t_a/binary>>};
pack(24817, cli, {}) -> {ok, <<2:32, 24817:16>>};
pack(24817, srv, {V0_quest_list, V0_camp_id}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
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
					<- V0_quest_list]))/binary,
		V0_camp_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24817:16,
       D_a_t_a/binary>>};
pack(24818, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24818:16,
       D_a_t_a/binary>>};
pack(24818, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24818:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24801, srv, _B0) -> {ok, {}};
unpack(24801, cli, _B0) ->
    {V1_all_num, _B1} = protocol:uint32(_B0),
    {V1_award_list, _B6} = protocol:array(_B1,
					  fun (_B2) ->
						  {V2_id, _B3} =
						      protocol:uint8(_B2),
						  {V2_flag, _B4} =
						      protocol:uint8(_B3),
						  {{V2_id, V2_flag}, _B4}
					  end),
    {ok, {V1_all_num, V1_award_list}};
unpack(24802, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(24802, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {V1_rand_list, _B8} = protocol:array(_B3,
					 fun (_B4) ->
						 {V2_rand_id, _B5} =
						     protocol:uint32(_B4),
						 {V2_status, _B6} =
						     protocol:uint8(_B5),
						 {{V2_rand_id, V2_status}, _B6}
					 end),
    {ok, {V1_flag, V1_msg, V1_count, V1_rand_list}};
unpack(24803, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(24803, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(24804, srv, _B0) -> {ok, {}};
unpack(24804, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_exp, _B2} = protocol:uint32(_B1),
    {V1_camp_id, _B3} = protocol:uint32(_B2),
    {V1_group_id, _B4} = protocol:uint32(_B3),
    {V1_combat_num, _B5} = protocol:uint16(_B4),
    {V1_start_time, _B6} = protocol:uint32(_B5),
    {V1_end_time, _B7} = protocol:uint32(_B6),
    {V1_show_list, _B12} = protocol:array(_B7,
					  fun (_B8) ->
						  {V2_show_id, _B9} =
						      protocol:uint8(_B8),
						  {V2_num, _B10} =
						      protocol:uint32(_B9),
						  {{V2_show_id, V2_num}, _B10}
					  end),
    {V1_make_list, _B17} = protocol:array(_B12,
					  fun (_B13) ->
						  {V2_id, _B14} =
						      protocol:uint32(_B13),
						  {V2_num, _B15} =
						      protocol:uint32(_B14),
						  {{V2_id, V2_num}, _B15}
					  end),
    {ok,
     {V1_lev, V1_exp, V1_camp_id, V1_group_id, V1_combat_num,
      V1_start_time, V1_end_time, V1_show_list,
      V1_make_list}};
unpack(24805, srv, _B0) -> {ok, {}};
unpack(24805, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_reward_list, _B5} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_id, _B3} =
						       protocol:uint16(_B2),
						   {V2_id, _B3}
					   end),
    {ok, {V1_lev, V1_reward_list}};
unpack(24806, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24806, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(24807, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(24807, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(24808, srv, _B0) -> {ok, {}};
unpack(24808, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(24809, srv, _B0) -> {ok, {}};
unpack(24809, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_combat_num, _B3} = protocol:uint16(_B2),
    {ok, {V1_flag, V1_msg, V1_combat_num}};
unpack(24810, srv, _B0) -> {ok, {}};
unpack(24810, cli, _B0) ->
    {V1_quest_list, _B15} = protocol:array(_B0,
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
						     V2_end_time,
						     V2_finish_time,
						     V2_progress},
						    _B13}
					   end),
    {V1_camp_id, _B16} = protocol:uint32(_B15),
    {ok, {V1_quest_list, V1_camp_id}};
unpack(24811, srv, _B0) -> {ok, {}};
unpack(24811, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_finish, _B2} = protocol:uint8(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_finish_time, _B4} = protocol:uint32(_B3),
    {V1_progress, _B12} = protocol:array(_B4,
					 fun (_B5) ->
						 {V2_id, _B6} =
						     protocol:uint16(_B5),
						 {V2_finish, _B7} =
						     protocol:uint8(_B6),
						 {V2_target, _B8} =
						     protocol:uint32(_B7),
						 {V2_target_val, _B9} =
						     protocol:uint32(_B8),
						 {V2_value, _B10} =
						     protocol:uint32(_B9),
						 {{V2_id, V2_finish, V2_target,
						   V2_target_val, V2_value},
						  _B10}
					 end),
    {ok,
     {V1_id, V1_finish, V1_end_time, V1_finish_time,
      V1_progress}};
unpack(24812, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24812, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(24813, srv, _B0) -> {ok, {}};
unpack(24813, cli, _B0) ->
    {V1_quest_list, _B15} = protocol:array(_B0,
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
						     V2_end_time,
						     V2_finish_time,
						     V2_progress},
						    _B13}
					   end),
    {V1_camp_id, _B16} = protocol:uint32(_B15),
    {ok, {V1_quest_list, V1_camp_id}};
unpack(24814, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24814, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(24815, srv, _B0) -> {ok, {}};
unpack(24815, cli, _B0) ->
    {V1_quest_list, _B15} = protocol:array(_B0,
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
						     V2_end_time,
						     V2_finish_time,
						     V2_progress},
						    _B13}
					   end),
    {V1_camp_id, _B16} = protocol:uint32(_B15),
    {ok, {V1_quest_list, V1_camp_id}};
unpack(24816, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24816, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(24817, srv, _B0) -> {ok, {}};
unpack(24817, cli, _B0) ->
    {V1_quest_list, _B15} = protocol:array(_B0,
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
						     V2_end_time,
						     V2_finish_time,
						     V2_progress},
						    _B13}
					   end),
    {V1_camp_id, _B16} = protocol:uint32(_B15),
    {ok, {V1_quest_list, V1_camp_id}};
unpack(24818, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24818, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


