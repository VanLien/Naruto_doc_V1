-file("src/proto/proto_261.erl", 1).

-module(proto_261).

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

-file("src/proto/proto_261.erl", 16).

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

-file("src/proto/proto_261.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(26100, cli, {}) -> {ok, <<2:32, 26100:16>>};
pack(26100, srv,
     {V0_pet_id, V0_name, V0_state, V0_vigor, V0_vigor_time,
      V0_set_item, V0_rename_count, V0_day_talk,
      V0_day_feed}) ->
    D_a_t_a = <<V0_pet_id:32,
		(protocol:pack(string, V0_name))/binary, V0_state:8,
		V0_vigor:32, V0_vigor_time:32, (length(V0_set_item)):16,
		(list_to_binary([<<V1_key:8, V1_id:32>>
				 || {V1_key, V1_id} <- V0_set_item]))/binary,
		V0_rename_count:32, V0_day_talk:8, V0_day_feed:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26100:16,
       D_a_t_a/binary>>};
pack(26101, cli, {}) -> {ok, <<2:32, 26101:16>>};
pack(26101, srv, {V0_vigor, V0_vigor_time}) ->
    D_a_t_a = <<V0_vigor:32, V0_vigor_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26101:16,
       D_a_t_a/binary>>};
pack(26102, cli, {V0_name}) ->
    D_a_t_a = <<(protocol:pack(string, V0_name))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26102:16,
       D_a_t_a/binary>>};
pack(26102, srv,
     {V0_code, V0_msg, V0_name, V0_rename_count}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(protocol:pack(string, V0_name))/binary,
		V0_rename_count:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26102:16,
       D_a_t_a/binary>>};
pack(26103, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26103:16,
       D_a_t_a/binary>>};
pack(26103, srv,
     {V0_code, V0_msg, V0_id, V0_flag, V0_day_talk,
      V0_day_feed, V0_vigor}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32,
		V0_flag:8, V0_day_talk:8, V0_day_feed:8, V0_vigor:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26103:16,
       D_a_t_a/binary>>};
pack(26104, cli, {}) -> {ok, <<2:32, 26104:16>>};
pack(26104, srv,
     {V0_code, V0_msg, V0_vigor, V0_day_talk,
      V0_day_feed}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_vigor:32,
		V0_day_talk:8, V0_day_feed:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26104:16,
       D_a_t_a/binary>>};
pack(26105, cli, {}) -> {ok, <<2:32, 26105:16>>};
pack(26105, srv, {V0_evt_list}) ->
    D_a_t_a = <<(length(V0_evt_list)):16,
		(list_to_binary([<<V1_evt_id:32, V1_time:32,
				   V1_evt_sid:32, (length(V1_award)):16,
				   (list_to_binary([<<V2_id:32, V2_num:32>>
						    || {V2_id, V2_num}
							   <- V1_award]))/binary>>
				 || {V1_evt_id, V1_time, V1_evt_sid, V1_award}
					<- V0_evt_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26105:16,
       D_a_t_a/binary>>};
pack(26106, cli, {V0_evt_id}) ->
    D_a_t_a = <<V0_evt_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26106:16,
       D_a_t_a/binary>>};
pack(26106, srv,
     {V0_code, V0_msg, V0_flag, V0_award, V0_evt_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_flag:8,
		(length(V0_award)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num} <- V0_award]))/binary,
		V0_evt_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26106:16,
       D_a_t_a/binary>>};
pack(26107, cli, {V0_set_item}) ->
    D_a_t_a = <<(length(V0_set_item)):16,
		(list_to_binary([<<V1_key:8, V1_id:32>>
				 || {V1_key, V1_id} <- V0_set_item]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26107:16,
       D_a_t_a/binary>>};
pack(26107, srv, {V0_code, V0_msg, V0_set_item}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_set_item)):16,
		(list_to_binary([<<V1_key:8, V1_id:32>>
				 || {V1_key, V1_id} <- V0_set_item]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26107:16,
       D_a_t_a/binary>>};
pack(26108, cli, {}) -> {ok, <<2:32, 26108:16>>};
pack(26108, srv, {V0_evt_list}) ->
    D_a_t_a = <<(length(V0_evt_list)):16,
		(list_to_binary([<<V1_evt_id:32, V1_time:32,
				   V1_evt_sid:32, (length(V1_award)):16,
				   (list_to_binary([<<V2_id:32, V2_num:32>>
						    || {V2_id, V2_num}
							   <- V1_award]))/binary>>
				 || {V1_evt_id, V1_time, V1_evt_sid, V1_award}
					<- V0_evt_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26108:16,
       D_a_t_a/binary>>};
pack(26109, cli, {}) -> {ok, <<2:32, 26109:16>>};
pack(26109, srv,
     {V0_start_time, V0_evt_list, V0_city_id}) ->
    D_a_t_a = <<V0_start_time:32, (length(V0_evt_list)):16,
		(list_to_binary([<<V1_evt_id:32, V1_time:32,
				   V1_evt_sid:32, (length(V1_award)):16,
				   (list_to_binary([<<V2_id:32, V2_num:32>>
						    || {V2_id, V2_num}
							   <- V1_award]))/binary>>
				 || {V1_evt_id, V1_time, V1_evt_sid, V1_award}
					<- V0_evt_list]))/binary,
		V0_city_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26109:16,
       D_a_t_a/binary>>};
pack(26110, cli, {}) -> {ok, <<2:32, 26110:16>>};
pack(26110, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26110:16,
       D_a_t_a/binary>>};
pack(26111, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26111:16,
       D_a_t_a/binary>>};
pack(26111, srv, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32>>
				 || {V1_id, V1_base_id} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26111:16,
       D_a_t_a/binary>>};
pack(26112, cli, {}) -> {ok, <<2:32, 26112:16>>};
pack(26112, srv, {V0_type, V0_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32>>
				 || {V1_id, V1_base_id} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26112:16,
       D_a_t_a/binary>>};
pack(26113, cli, {V0_type, V0_id}) ->
    D_a_t_a = <<V0_type:8, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26113:16,
       D_a_t_a/binary>>};
pack(26113, srv, {V0_code, V0_msg, V0_type, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8,
		V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26113:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(26100, srv, _B0) -> {ok, {}};
unpack(26100, cli, _B0) ->
    {V1_pet_id, _B1} = protocol:uint32(_B0),
    {V1_name, _B2} = protocol:string(_B1),
    {V1_state, _B3} = protocol:uint8(_B2),
    {V1_vigor, _B4} = protocol:uint32(_B3),
    {V1_vigor_time, _B5} = protocol:uint32(_B4),
    {V1_set_item, _B10} = protocol:array(_B5,
					 fun (_B6) ->
						 {V2_key, _B7} =
						     protocol:uint8(_B6),
						 {V2_id, _B8} =
						     protocol:uint32(_B7),
						 {{V2_key, V2_id}, _B8}
					 end),
    {V1_rename_count, _B11} = protocol:uint32(_B10),
    {V1_day_talk, _B12} = protocol:uint8(_B11),
    {V1_day_feed, _B13} = protocol:uint8(_B12),
    {ok,
     {V1_pet_id, V1_name, V1_state, V1_vigor, V1_vigor_time,
      V1_set_item, V1_rename_count, V1_day_talk,
      V1_day_feed}};
unpack(26101, srv, _B0) -> {ok, {}};
unpack(26101, cli, _B0) ->
    {V1_vigor, _B1} = protocol:uint32(_B0),
    {V1_vigor_time, _B2} = protocol:uint32(_B1),
    {ok, {V1_vigor, V1_vigor_time}};
unpack(26102, srv, _B0) ->
    {V1_name, _B1} = protocol:string(_B0), {ok, {V1_name}};
unpack(26102, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_name, _B3} = protocol:string(_B2),
    {V1_rename_count, _B4} = protocol:uint32(_B3),
    {ok, {V1_code, V1_msg, V1_name, V1_rename_count}};
unpack(26103, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(26103, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {V1_day_talk, _B5} = protocol:uint8(_B4),
    {V1_day_feed, _B6} = protocol:uint8(_B5),
    {V1_vigor, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_code, V1_msg, V1_id, V1_flag, V1_day_talk,
      V1_day_feed, V1_vigor}};
unpack(26104, srv, _B0) -> {ok, {}};
unpack(26104, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_vigor, _B3} = protocol:uint32(_B2),
    {V1_day_talk, _B4} = protocol:uint8(_B3),
    {V1_day_feed, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_code, V1_msg, V1_vigor, V1_day_talk, V1_day_feed}};
unpack(26105, srv, _B0) -> {ok, {}};
unpack(26105, cli, _B0) ->
    {V1_evt_list, _B11} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_evt_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_time, _B3} =
						     protocol:uint32(_B2),
						 {V2_evt_sid, _B4} =
						     protocol:uint32(_B3),
						 {V2_award, _B9} =
						     protocol:array(_B4,
								    fun (_B5) ->
									    {V3_id,
									     _B6} =
										protocol:uint32(_B5),
									    {V3_num,
									     _B7} =
										protocol:uint32(_B6),
									    {{V3_id,
									      V3_num},
									     _B7}
								    end),
						 {{V2_evt_id, V2_time,
						   V2_evt_sid, V2_award},
						  _B9}
					 end),
    {ok, {V1_evt_list}};
unpack(26106, srv, _B0) ->
    {V1_evt_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_evt_id}};
unpack(26106, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_award, _B8} = protocol:array(_B3,
				     fun (_B4) ->
					     {V2_id, _B5} =
						 protocol:uint32(_B4),
					     {V2_num, _B6} =
						 protocol:uint32(_B5),
					     {{V2_id, V2_num}, _B6}
				     end),
    {V1_evt_id, _B9} = protocol:uint32(_B8),
    {ok, {V1_code, V1_msg, V1_flag, V1_award, V1_evt_id}};
unpack(26107, srv, _B0) ->
    {V1_set_item, _B5} = protocol:array(_B0,
					fun (_B1) ->
						{V2_key, _B2} =
						    protocol:uint8(_B1),
						{V2_id, _B3} =
						    protocol:uint32(_B2),
						{{V2_key, V2_id}, _B3}
					end),
    {ok, {V1_set_item}};
unpack(26107, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_set_item, _B7} = protocol:array(_B2,
					fun (_B3) ->
						{V2_key, _B4} =
						    protocol:uint8(_B3),
						{V2_id, _B5} =
						    protocol:uint32(_B4),
						{{V2_key, V2_id}, _B5}
					end),
    {ok, {V1_code, V1_msg, V1_set_item}};
unpack(26108, srv, _B0) -> {ok, {}};
unpack(26108, cli, _B0) ->
    {V1_evt_list, _B11} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_evt_id, _B2} =
						     protocol:uint32(_B1),
						 {V2_time, _B3} =
						     protocol:uint32(_B2),
						 {V2_evt_sid, _B4} =
						     protocol:uint32(_B3),
						 {V2_award, _B9} =
						     protocol:array(_B4,
								    fun (_B5) ->
									    {V3_id,
									     _B6} =
										protocol:uint32(_B5),
									    {V3_num,
									     _B7} =
										protocol:uint32(_B6),
									    {{V3_id,
									      V3_num},
									     _B7}
								    end),
						 {{V2_evt_id, V2_time,
						   V2_evt_sid, V2_award},
						  _B9}
					 end),
    {ok, {V1_evt_list}};
unpack(26109, srv, _B0) -> {ok, {}};
unpack(26109, cli, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_evt_list, _B12} = protocol:array(_B1,
					 fun (_B2) ->
						 {V2_evt_id, _B3} =
						     protocol:uint32(_B2),
						 {V2_time, _B4} =
						     protocol:uint32(_B3),
						 {V2_evt_sid, _B5} =
						     protocol:uint32(_B4),
						 {V2_award, _B10} =
						     protocol:array(_B5,
								    fun (_B6) ->
									    {V3_id,
									     _B7} =
										protocol:uint32(_B6),
									    {V3_num,
									     _B8} =
										protocol:uint32(_B7),
									    {{V3_id,
									      V3_num},
									     _B8}
								    end),
						 {{V2_evt_id, V2_time,
						   V2_evt_sid, V2_award},
						  _B10}
					 end),
    {V1_city_id, _B13} = protocol:uint32(_B12),
    {ok, {V1_start_time, V1_evt_list, V1_city_id}};
unpack(26110, srv, _B0) -> {ok, {}};
unpack(26110, cli, _B0) ->
    {V1_list, _B4} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint32(_B1),
					    {V2_id, _B2}
				    end),
    {ok, {V1_list}};
unpack(26111, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(26111, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B6} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_id, _B3} = protocol:uint32(_B2),
					    {V2_base_id, _B4} =
						protocol:uint32(_B3),
					    {{V2_id, V2_base_id}, _B4}
				    end),
    {ok, {V1_type, V1_list}};
unpack(26112, srv, _B0) -> {ok, {}};
unpack(26112, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_list, _B6} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_id, _B3} = protocol:uint32(_B2),
					    {V2_base_id, _B4} =
						protocol:uint32(_B3),
					    {{V2_id, V2_base_id}, _B4}
				    end),
    {ok, {V1_type, V1_list}};
unpack(26113, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_id}};
unpack(26113, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_code, V1_msg, V1_type, V1_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


