-file("src/proto/proto_259.erl", 1).

-module(proto_259).

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

-file("src/proto/proto_259.erl", 16).

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

-file("src/proto/proto_259.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25900, cli, {}) -> {ok, <<2:32, 25900:16>>};
pack(25900, srv,
     {V0_period, V0_open_day, V0_is_open}) ->
    D_a_t_a = <<V0_period:8, V0_open_day:8, V0_is_open:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25900:16,
       D_a_t_a/binary>>};
pack(25901, cli, {}) -> {ok, <<2:32, 25901:16>>};
pack(25901, srv, {V0_endtime, V0_is_buy}) ->
    D_a_t_a = <<V0_endtime:32, V0_is_buy:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25901:16,
       D_a_t_a/binary>>};
pack(25910, cli, {}) -> {ok, <<2:32, 25910:16>>};
pack(25910, srv,
     {V0_quest_list, V0_endtime, V0_period}) ->
    D_a_t_a = <<(length(V0_quest_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_target_val:32, V1_value:32>>
				 || {V1_id, V1_finish, V1_target_val, V1_value}
					<- V0_quest_list]))/binary,
		V0_endtime:32, V0_period:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25910:16,
       D_a_t_a/binary>>};
pack(25911, cli, {}) -> {ok, <<2:32, 25911:16>>};
pack(25911, srv,
     {V0_id, V0_finish, V0_target_val, V0_value}) ->
    D_a_t_a = <<V0_id:32, V0_finish:8, V0_target_val:32,
		V0_value:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25911:16,
       D_a_t_a/binary>>};
pack(25912, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25912:16,
       D_a_t_a/binary>>};
pack(25912, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25912:16,
       D_a_t_a/binary>>};
pack(25913, cli, {}) -> {ok, <<2:32, 25913:16>>};
pack(25913, srv, {V0_endtime, V0_buy_info}) ->
    D_a_t_a = <<V0_endtime:32, (length(V0_buy_info)):16,
		(list_to_binary([<<V1_id:8, V1_day_num:32,
				   V1_all_num:32>>
				 || {V1_id, V1_day_num, V1_all_num}
					<- V0_buy_info]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25913:16,
       D_a_t_a/binary>>};
pack(25914, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25914:16,
       D_a_t_a/binary>>};
pack(25914, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25914:16,
       D_a_t_a/binary>>};
pack(25915, cli, {}) -> {ok, <<2:32, 25915:16>>};
pack(25915, srv, {V0_status_list}) ->
    D_a_t_a = <<(length(V0_status_list)):16,
		(list_to_binary([<<V1_day:8, V1_status:8>>
				 || {V1_day, V1_status}
					<- V0_status_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25915:16,
       D_a_t_a/binary>>};
pack(25916, cli, {V0_day}) ->
    D_a_t_a = <<V0_day:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25916:16,
       D_a_t_a/binary>>};
pack(25916, srv, {V0_code, V0_msg, V0_day}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_day:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25916:16,
       D_a_t_a/binary>>};
pack(25917, cli, {}) -> {ok, <<2:32, 25917:16>>};
pack(25917, srv, {V0_endtime, V0_discount_buy_count}) ->
    D_a_t_a = <<V0_endtime:32,
		(length(V0_discount_buy_count)):16,
		(list_to_binary([<<V1_package_id:32, V1_buy_count:32,
				   V1_limit_count:32>>
				 || {V1_package_id, V1_buy_count,
				     V1_limit_count}
					<- V0_discount_buy_count]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25917:16,
       D_a_t_a/binary>>};
pack(25918, cli, {V0_package_id}) ->
    D_a_t_a = <<V0_package_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25918:16,
       D_a_t_a/binary>>};
pack(25918, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25918:16,
       D_a_t_a/binary>>};
pack(25919, cli, {V0_bid}) ->
    D_a_t_a = <<V0_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25919:16,
       D_a_t_a/binary>>};
pack(25919, srv, {V0_bid, V0_code}) ->
    D_a_t_a = <<V0_bid:32, V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25919:16,
       D_a_t_a/binary>>};
pack(25920, cli, {}) -> {ok, <<2:32, 25920:16>>};
pack(25920, srv, {V0_endtime}) ->
    D_a_t_a = <<V0_endtime:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25920:16,
       D_a_t_a/binary>>};
pack(25921, cli, {}) -> {ok, <<2:32, 25921:16>>};
pack(25921, srv, {V0_endtime}) ->
    D_a_t_a = <<V0_endtime:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25921:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25900, srv, _B0) -> {ok, {}};
unpack(25900, cli, _B0) ->
    {V1_period, _B1} = protocol:uint8(_B0),
    {V1_open_day, _B2} = protocol:uint8(_B1),
    {V1_is_open, _B3} = protocol:uint8(_B2),
    {ok, {V1_period, V1_open_day, V1_is_open}};
unpack(25901, srv, _B0) -> {ok, {}};
unpack(25901, cli, _B0) ->
    {V1_endtime, _B1} = protocol:uint32(_B0),
    {V1_is_buy, _B2} = protocol:uint8(_B1),
    {ok, {V1_endtime, V1_is_buy}};
unpack(25910, srv, _B0) -> {ok, {}};
unpack(25910, cli, _B0) ->
    {V1_quest_list, _B7} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_finish, _B3} =
						      protocol:uint8(_B2),
						  {V2_target_val, _B4} =
						      protocol:uint32(_B3),
						  {V2_value, _B5} =
						      protocol:uint32(_B4),
						  {{V2_id, V2_finish,
						    V2_target_val, V2_value},
						   _B5}
					  end),
    {V1_endtime, _B8} = protocol:uint32(_B7),
    {V1_period, _B9} = protocol:uint32(_B8),
    {ok, {V1_quest_list, V1_endtime, V1_period}};
unpack(25911, srv, _B0) -> {ok, {}};
unpack(25911, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_finish, _B2} = protocol:uint8(_B1),
    {V1_target_val, _B3} = protocol:uint32(_B2),
    {V1_value, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_finish, V1_target_val, V1_value}};
unpack(25912, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(25912, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(25913, srv, _B0) -> {ok, {}};
unpack(25913, cli, _B0) ->
    {V1_endtime, _B1} = protocol:uint32(_B0),
    {V1_buy_info, _B7} = protocol:array(_B1,
					fun (_B2) ->
						{V2_id, _B3} =
						    protocol:uint8(_B2),
						{V2_day_num, _B4} =
						    protocol:uint32(_B3),
						{V2_all_num, _B5} =
						    protocol:uint32(_B4),
						{{V2_id, V2_day_num,
						  V2_all_num},
						 _B5}
					end),
    {ok, {V1_endtime, V1_buy_info}};
unpack(25914, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(25914, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(25915, srv, _B0) -> {ok, {}};
unpack(25915, cli, _B0) ->
    {V1_status_list, _B5} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_day, _B2} =
						       protocol:uint8(_B1),
						   {V2_status, _B3} =
						       protocol:uint8(_B2),
						   {{V2_day, V2_status}, _B3}
					   end),
    {ok, {V1_status_list}};
unpack(25916, srv, _B0) ->
    {V1_day, _B1} = protocol:uint8(_B0), {ok, {V1_day}};
unpack(25916, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_day, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_day}};
unpack(25917, srv, _B0) -> {ok, {}};
unpack(25917, cli, _B0) ->
    {V1_endtime, _B1} = protocol:uint32(_B0),
    {V1_discount_buy_count, _B7} = protocol:array(_B1,
						  fun (_B2) ->
							  {V2_package_id, _B3} =
							      protocol:uint32(_B2),
							  {V2_buy_count, _B4} =
							      protocol:uint32(_B3),
							  {V2_limit_count,
							   _B5} =
							      protocol:uint32(_B4),
							  {{V2_package_id,
							    V2_buy_count,
							    V2_limit_count},
							   _B5}
						  end),
    {ok, {V1_endtime, V1_discount_buy_count}};
unpack(25918, srv, _B0) ->
    {V1_package_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_package_id}};
unpack(25918, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25919, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0), {ok, {V1_bid}};
unpack(25919, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_code, _B2} = protocol:uint8(_B1),
    {ok, {V1_bid, V1_code}};
unpack(25920, srv, _B0) -> {ok, {}};
unpack(25920, cli, _B0) ->
    {V1_endtime, _B1} = protocol:uint32(_B0),
    {ok, {V1_endtime}};
unpack(25921, srv, _B0) -> {ok, {}};
unpack(25921, cli, _B0) ->
    {V1_endtime, _B1} = protocol:uint32(_B0),
    {ok, {V1_endtime}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


