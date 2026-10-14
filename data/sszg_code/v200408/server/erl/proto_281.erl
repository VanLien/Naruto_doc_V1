-file("src/proto/proto_281.erl", 1).

-module(proto_281).

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

-file("src/proto/proto_281.erl", 16).

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

-file("src/proto/proto_281.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(28100, cli, {}) -> {ok, <<2:32, 28100:16>>};
pack(28100, srv,
     {V0_start_time, V0_end_time, V0_rsidue_gold}) ->
    D_a_t_a = <<V0_start_time:32, V0_end_time:32,
		V0_rsidue_gold:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28100:16,
       D_a_t_a/binary>>};
pack(28101, cli, {}) -> {ok, <<2:32, 28101:16>>};
pack(28101, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28101:16,
       D_a_t_a/binary>>};
pack(28102, cli, {}) -> {ok, <<2:32, 28102:16>>};
pack(28102, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28102:16,
       D_a_t_a/binary>>};
pack(28103, cli, {}) -> {ok, <<2:32, 28103:16>>};
pack(28103, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28103:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(28100, srv, _B0) -> {ok, {}};
unpack(28100, cli, _B0) ->
    {V1_start_time, _B1} = protocol:uint32(_B0),
    {V1_end_time, _B2} = protocol:uint32(_B1),
    {V1_rsidue_gold, _B3} = protocol:uint32(_B2),
    {ok, {V1_start_time, V1_end_time, V1_rsidue_gold}};
unpack(28101, srv, _B0) -> {ok, {}};
unpack(28101, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(28102, srv, _B0) -> {ok, {}};
unpack(28102, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(28103, srv, _B0) -> {ok, {}};
unpack(28103, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


