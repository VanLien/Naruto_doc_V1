-file("src/proto/proto_241.erl", 1).

-module(proto_241).

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
		{item_make_args, [base_id, bind, quantity, step, flag]},
		{item,
		 [ver, id, base_id, bind, look_id, type, quality, craft,
		  step, quantity, pos, expire_type, expire_time, enchant,
		  fail_enchant, attr, main_attr, extra_attr, score,
		  all_score, extra, data, price, set_id, career,
		  gemstones, star_lev, break_count, holy_eqm_attr]},
		{item_base,
		 [id, name, type, quality, overlap, use_type, gain_type,
		  expire_type, expire_time, condition, effect, attr,
		  value, lev, career, sex, ext, attr_type, eqm_jie,
		  add_num, can_share, eqm_set, use_count]},
		{hallows_look_data,
		 [id, name, attr, is_item, time, loss]},
		{hallows_looks, [ver, id, endtime, eqm_hallows]},
		{hallows_quest_data, [id, hid, items, progress]},
		{hallows_data,
		 [id, step, name, attr, loss, max_lucky, clear_limit,
		  clear_time, reward, notice, open_desc, skill_order]},
		{hallows_skill, [ver, pos, lev, skill_bid, attr]},
		{hallows,
		 [ver, id, step, lucky, lucky_endtime, power, base_attr,
		  add_attr, eqm, skill, seal, reward, rebirth_loss,
		  is_notice, look_id, refine_lev]},
		{m_hallows,
		 [ver, hallows_list, all_lv, attr_list, quest_list,
		  look_list, look_quest_list]}]).

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

-file("src/proto/proto_241.erl", 16).

-file("inc/hallows.hrl", 1).

-record(m_hallows,
	{ver = 3, hallows_list = [], all_lv = 0, attr_list = [],
	 quest_list = [], look_list = [], look_quest_list = []}).

-record(hallows,
	{ver = 4, id = 0, step = 0, lucky = 0,
	 lucky_endtime = 0, power = 0, base_attr = [],
	 add_attr = [], eqm = [], skill = [], seal = 0,
	 reward = [], rebirth_loss = [], is_notice = 0,
	 look_id = 0, refine_lev = 0}).

-record(hallows_skill,
	{ver = 1, pos = 0, lev = 0, skill_bid = 0, attr = []}).

-record(hallows_data,
	{id = 0, step = 0, name = <<>>, attr = [], loss = [],
	 max_lucky = 0, clear_limit = 0, clear_time = 0,
	 reward = [], notice = <<>>, open_desc = <<>>,
	 skill_order = []}).

-record(hallows_quest_data,
	{id = 0, hid = 0, items = [], progress = []}).

-record(hallows_looks,
	{ver = 1, id = 0, endtime = 0, eqm_hallows = 0}).

-record(hallows_look_data,
	{id = 0, name = <<>>, attr = [], is_item = 0, time = 0,
	 loss = []}).

-file("src/proto/proto_241.erl", 17).

-file("inc/item.hrl", 1).

-record(item_base,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 type = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 overlap = 1  :: pos_integer(), use_type = 0  :: 0..4,
	 gain_type = 0  :: non_neg_integer(),
	 expire_type = 0  :: non_neg_integer(),
	 expire_time = 0  ::
	     non_neg_integer() |
	     {{pos_integer(), pos_integer(), pos_integer()},
	      {non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}},
	 condition = []  :: [tuple()], effect = []  :: [tuple()],
	 attr = []  :: [tuple()], value = []  :: [tuple()],
	 lev = 0, career = 0, sex = 2, ext = [],
	 attr_type = 1  :: pos_integer(), eqm_jie = 0,
	 add_num = 0, can_share = 0, eqm_set = 0,
	 use_count = 0}).

-record(item,
	{ver = 3  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(), bind = 1  :: 0 | 1,
	 look_id = 0, type = 0  :: non_neg_integer(),
	 quality = 0  :: 0..4, craft = 0  :: 0..5,
	 step = 0  :: pos_integer(), quantity = 1  :: 0..250,
	 pos = 0  :: non_neg_integer(), expire_type = 0  :: 0..4,
	 expire_time = 0  :: non_neg_integer(),
	 enchant = 0  :: integer(),
	 fail_enchant = 0  :: non_neg_integer(),
	 attr = []  :: [tuple()], main_attr = [],
	 extra_attr = [], score = 0, all_score = 0,
	 extra = []  :: [tuple()], data = []  :: [any()],
	 price = 0, set_id = 0  :: pos_integer(),
	 career = 0  :: pos_integer(), gemstones = []  :: list(),
	 star_lev = 0  :: pos_integer(),
	 break_count = 0  :: pos_integer(), holy_eqm_attr = []}).

-record(item_make_args,
	{base_id = 0, bind = 0, quantity = 0, step = 0,
	 flag = default_iflag}).

-file("src/proto/proto_241.erl", 18).

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

-file("src/proto/proto_241.erl", 19).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24100, cli, {}) -> {ok, <<2:32, 24100:16>>};
pack(24100, srv, {V0_hallows}) ->
    D_a_t_a = <<(length(V0_hallows)):16,
		(list_to_binary([<<V1_id:32, V1_step:32, V1_lucky:32,
				   V1_lucky_endtime:32, V1_seal:32,
				   (length(V1_add_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_add_attr]))/binary,
				   (length(V1_skill)):16,
				   (list_to_binary([<<V2_lev:32,
						      V2_skill_bid:32>>
						    || #hallows_skill{lev =
									  V2_lev,
								      skill_bid
									  =
									  V2_skill_bid}
							   <- V1_skill]))/binary,
				   V1_look_id:32, V1_refine_lev:32>>
				 || #hallows{id = V1_id, step = V1_step,
					     lucky = V1_lucky,
					     lucky_endtime = V1_lucky_endtime,
					     seal = V1_seal,
					     add_attr = V1_add_attr,
					     skill = V1_skill,
					     look_id = V1_look_id,
					     refine_lev = V1_refine_lev}
					<- V0_hallows]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24100:16,
       D_a_t_a/binary>>};
pack(24101, cli, {V0_id, V0_is_auto}) ->
    D_a_t_a = <<V0_id:32, V0_is_auto:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24101:16,
       D_a_t_a/binary>>};
pack(24101, srv, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24101:16,
       D_a_t_a/binary>>};
pack(24103, cli, {V0_hallows_id}) ->
    D_a_t_a = <<V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24103:16,
       D_a_t_a/binary>>};
pack(24103, srv, {V0_result, V0_msg, V0_hallows_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24103:16,
       D_a_t_a/binary>>};
pack(24104, cli, {V0_hallows_id, V0_num}) ->
    D_a_t_a = <<V0_hallows_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24104:16,
       D_a_t_a/binary>>};
pack(24104, srv, {V0_result, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_result:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24104:16,
       D_a_t_a/binary>>};
pack(24107, cli, {}) -> {ok, <<2:32, 24107:16>>};
pack(24107, srv,
     {#hallows{id = V0_id, step = V0_step, lucky = V0_lucky,
	       lucky_endtime = V0_lucky_endtime, seal = V0_seal,
	       add_attr = V0_add_attr, skill = V0_skill,
	       look_id = V0_look_id, refine_lev = V0_refine_lev}}) ->
    D_a_t_a = <<V0_id:32, V0_step:32, V0_lucky:32,
		V0_lucky_endtime:32, V0_seal:32,
		(length(V0_add_attr)):16,
		(list_to_binary([<<V1_attr_id:32, V1_attr_val:32>>
				 || {V1_attr_id, V1_attr_val}
					<- V0_add_attr]))/binary,
		(length(V0_skill)):16,
		(list_to_binary([<<V1_lev:32, V1_skill_bid:32>>
				 || #hallows_skill{lev = V1_lev,
						   skill_bid = V1_skill_bid}
					<- V0_skill]))/binary,
		V0_look_id:32, V0_refine_lev:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24107:16,
       D_a_t_a/binary>>};
pack(24108, cli, {}) -> {ok, <<2:32, 24108:16>>};
pack(24108, srv,
     {#hallows{id = V0_id, step = V0_step, lucky = V0_lucky,
	       lucky_endtime = V0_lucky_endtime, seal = V0_seal,
	       add_attr = V0_add_attr, skill = V0_skill,
	       look_id = V0_look_id, refine_lev = V0_refine_lev}}) ->
    D_a_t_a = <<V0_id:32, V0_step:32, V0_lucky:32,
		V0_lucky_endtime:32, V0_seal:32,
		(length(V0_add_attr)):16,
		(list_to_binary([<<V1_attr_id:32, V1_attr_val:32>>
				 || {V1_attr_id, V1_attr_val}
					<- V0_add_attr]))/binary,
		(length(V0_skill)):16,
		(list_to_binary([<<V1_lev:32, V1_skill_bid:32>>
				 || #hallows_skill{lev = V1_lev,
						   skill_bid = V1_skill_bid}
					<- V0_skill]))/binary,
		V0_look_id:32, V0_refine_lev:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24108:16,
       D_a_t_a/binary>>};
pack(24120, cli, {}) -> {ok, <<2:32, 24120:16>>};
pack(24120, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_target_val:32, V1_value:32>>
				 || {V1_id, V1_finish, V1_target_val, V1_value}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24120:16,
       D_a_t_a/binary>>};
pack(24121, cli, {}) -> {ok, <<2:32, 24121:16>>};
pack(24121, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_target_val:32, V1_value:32>>
				 || {V1_id, V1_finish, V1_target_val, V1_value}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24121:16,
       D_a_t_a/binary>>};
pack(24122, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24122:16,
       D_a_t_a/binary>>};
pack(24122, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24122:16,
       D_a_t_a/binary>>};
pack(24123, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24123:16,
       D_a_t_a/binary>>};
pack(24123, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24123:16,
       D_a_t_a/binary>>};
pack(24124, cli, {}) -> {ok, <<2:32, 24124:16>>};
pack(24124, srv, {V0_is_first}) ->
    D_a_t_a = <<V0_is_first:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24124:16,
       D_a_t_a/binary>>};
pack(24125, cli, {}) -> {ok, <<2:32, 24125:16>>};
pack(24125, srv, {V0_hallows_looks}) ->
    D_a_t_a = <<(length(V0_hallows_looks)):16,
		(list_to_binary([<<V1_id:32, V1_endtime:32,
				   V1_eqm_hallows:32>>
				 || #hallows_looks{id = V1_id,
						   endtime = V1_endtime,
						   eqm_hallows = V1_eqm_hallows}
					<- V0_hallows_looks]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24125:16,
       D_a_t_a/binary>>};
pack(24126, cli, {}) -> {ok, <<2:32, 24126:16>>};
pack(24126, srv,
     {#hallows_looks{id = V0_id, endtime = V0_endtime,
		     eqm_hallows = V0_eqm_hallows}}) ->
    D_a_t_a = <<V0_id:32, V0_endtime:32,
		V0_eqm_hallows:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24126:16,
       D_a_t_a/binary>>};
pack(24127, cli, {}) -> {ok, <<2:32, 24127:16>>};
pack(24127, srv,
     {#hallows_looks{id = V0_id, endtime = V0_endtime,
		     eqm_hallows = V0_eqm_hallows}}) ->
    D_a_t_a = <<V0_id:32, V0_endtime:32,
		V0_eqm_hallows:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24127:16,
       D_a_t_a/binary>>};
pack(24128, cli, {}) -> {ok, <<2:32, 24128:16>>};
pack(24128, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_target_val:32, V1_value:32>>
				 || {V1_id, V1_finish, V1_target_val, V1_value}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24128:16,
       D_a_t_a/binary>>};
pack(24129, cli, {}) -> {ok, <<2:32, 24129:16>>};
pack(24129, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_target_val:32, V1_value:32>>
				 || {V1_id, V1_finish, V1_target_val, V1_value}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24129:16,
       D_a_t_a/binary>>};
pack(24130, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24130:16,
       D_a_t_a/binary>>};
pack(24130, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24130:16,
       D_a_t_a/binary>>};
pack(24131, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24131:16,
       D_a_t_a/binary>>};
pack(24131, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24131:16,
       D_a_t_a/binary>>};
pack(24132, cli, {V0_id, V0_hallows_id, V0_flag}) ->
    D_a_t_a = <<V0_id:32, V0_hallows_id:32, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24132:16,
       D_a_t_a/binary>>};
pack(24132, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24132:16,
       D_a_t_a/binary>>};
pack(24133, cli, {}) -> {ok, <<2:32, 24133:16>>};
pack(24133, srv, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24133:16,
       D_a_t_a/binary>>};
pack(24135, cli, {V0_hallows_id}) ->
    D_a_t_a = <<V0_hallows_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24135:16,
       D_a_t_a/binary>>};
pack(24135, srv,
     {V0_code, V0_msg, V0_hallows_id, V0_refine_lev}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_hallows_id:32, V0_refine_lev:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24135:16,
       D_a_t_a/binary>>};
pack(24136, cli, {{V0_r_rid, V0_r_srvid}, V0_type}) ->
    D_a_t_a = <<V0_r_rid:32,
		(protocol:pack(string, V0_r_srvid))/binary,
		V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24136:16,
       D_a_t_a/binary>>};
pack(24136, srv, {V0_hallows}) ->
    D_a_t_a = <<(length(V0_hallows)):16,
		(list_to_binary([<<V1_id:32, V1_step:32,
				   (length(V1_add_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_add_attr]))/binary,
				   (length(V1_skill)):16,
				   (list_to_binary([<<V2_lev:32,
						      V2_skill_bid:32>>
						    || #hallows_skill{lev =
									  V2_lev,
								      skill_bid
									  =
									  V2_skill_bid}
							   <- V1_skill]))/binary,
				   V1_look_id:32, V1_refine_lev:32>>
				 || #hallows{id = V1_id, step = V1_step,
					     add_attr = V1_add_attr,
					     skill = V1_skill,
					     look_id = V1_look_id,
					     refine_lev = V1_refine_lev}
					<- V0_hallows]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24136:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24100, srv, _B0) -> {ok, {}};
unpack(24100, cli, _B0) ->
    {V1_hallows, _B20} = protocol:array(_B0,
					fun (_B1) ->
						{V2_id, _B2} =
						    protocol:uint32(_B1),
						{V2_step, _B3} =
						    protocol:uint32(_B2),
						{V2_lucky, _B4} =
						    protocol:uint32(_B3),
						{V2_lucky_endtime, _B5} =
						    protocol:uint32(_B4),
						{V2_seal, _B6} =
						    protocol:uint32(_B5),
						{V2_add_attr, _B11} =
						    protocol:array(_B6,
								   fun (_B7) ->
									   {V3_attr_id,
									    _B8} =
									       protocol:uint32(_B7),
									   {V3_attr_val,
									    _B9} =
									       protocol:uint32(_B8),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B9}
								   end),
						{V2_skill, _B16} =
						    protocol:array(_B11,
								   fun (_B12) ->
									   {V3_lev,
									    _B13} =
									       protocol:uint32(_B12),
									   {V3_skill_bid,
									    _B14} =
									       protocol:uint32(_B13),
									   {{V3_lev,
									     V3_skill_bid},
									    _B14}
								   end),
						{V2_look_id, _B17} =
						    protocol:uint32(_B16),
						{V2_refine_lev, _B18} =
						    protocol:uint32(_B17),
						{{V2_id, V2_step, V2_lucky,
						  V2_lucky_endtime, V2_seal,
						  V2_add_attr, V2_skill,
						  V2_look_id, V2_refine_lev},
						 _B18}
					end),
    {ok, {V1_hallows}};
unpack(24101, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_is_auto, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_is_auto}};
unpack(24101, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(24103, srv, _B0) ->
    {V1_hallows_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_hallows_id}};
unpack(24103, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_hallows_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_hallows_id}};
unpack(24104, srv, _B0) ->
    {V1_hallows_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_hallows_id, V1_num}};
unpack(24104, cli, _B0) ->
    {V1_result, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_result, V1_msg, V1_id}};
unpack(24107, srv, _B0) -> {ok, {}};
unpack(24107, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_step, _B2} = protocol:uint32(_B1),
    {V1_lucky, _B3} = protocol:uint32(_B2),
    {V1_lucky_endtime, _B4} = protocol:uint32(_B3),
    {V1_seal, _B5} = protocol:uint32(_B4),
    {V1_add_attr, _B10} = protocol:array(_B5,
					 fun (_B6) ->
						 {V2_attr_id, _B7} =
						     protocol:uint32(_B6),
						 {V2_attr_val, _B8} =
						     protocol:uint32(_B7),
						 {{V2_attr_id, V2_attr_val},
						  _B8}
					 end),
    {V1_skill, _B15} = protocol:array(_B10,
				      fun (_B11) ->
					      {V2_lev, _B12} =
						  protocol:uint32(_B11),
					      {V2_skill_bid, _B13} =
						  protocol:uint32(_B12),
					      {{V2_lev, V2_skill_bid}, _B13}
				      end),
    {V1_look_id, _B16} = protocol:uint32(_B15),
    {V1_refine_lev, _B17} = protocol:uint32(_B16),
    {ok,
     {V1_id, V1_step, V1_lucky, V1_lucky_endtime, V1_seal,
      V1_add_attr, V1_skill, V1_look_id, V1_refine_lev}};
unpack(24108, srv, _B0) -> {ok, {}};
unpack(24108, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_step, _B2} = protocol:uint32(_B1),
    {V1_lucky, _B3} = protocol:uint32(_B2),
    {V1_lucky_endtime, _B4} = protocol:uint32(_B3),
    {V1_seal, _B5} = protocol:uint32(_B4),
    {V1_add_attr, _B10} = protocol:array(_B5,
					 fun (_B6) ->
						 {V2_attr_id, _B7} =
						     protocol:uint32(_B6),
						 {V2_attr_val, _B8} =
						     protocol:uint32(_B7),
						 {{V2_attr_id, V2_attr_val},
						  _B8}
					 end),
    {V1_skill, _B15} = protocol:array(_B10,
				      fun (_B11) ->
					      {V2_lev, _B12} =
						  protocol:uint32(_B11),
					      {V2_skill_bid, _B13} =
						  protocol:uint32(_B12),
					      {{V2_lev, V2_skill_bid}, _B13}
				      end),
    {V1_look_id, _B16} = protocol:uint32(_B15),
    {V1_refine_lev, _B17} = protocol:uint32(_B16),
    {ok,
     {V1_id, V1_step, V1_lucky, V1_lucky_endtime, V1_seal,
      V1_add_attr, V1_skill, V1_look_id, V1_refine_lev}};
unpack(24120, srv, _B0) -> {ok, {}};
unpack(24120, cli, _B0) ->
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
unpack(24121, srv, _B0) -> {ok, {}};
unpack(24121, cli, _B0) ->
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
unpack(24122, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24122, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24123, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24123, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24124, srv, _B0) -> {ok, {}};
unpack(24124, cli, _B0) ->
    {V1_is_first, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_first}};
unpack(24125, srv, _B0) -> {ok, {}};
unpack(24125, cli, _B0) ->
    {V1_hallows_looks, _B6} = protocol:array(_B0,
					     fun (_B1) ->
						     {V2_id, _B2} =
							 protocol:uint32(_B1),
						     {V2_endtime, _B3} =
							 protocol:uint32(_B2),
						     {V2_eqm_hallows, _B4} =
							 protocol:uint32(_B3),
						     {{V2_id, V2_endtime,
						       V2_eqm_hallows},
						      _B4}
					     end),
    {ok, {V1_hallows_looks}};
unpack(24126, srv, _B0) -> {ok, {}};
unpack(24126, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_endtime, _B2} = protocol:uint32(_B1),
    {V1_eqm_hallows, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_endtime, V1_eqm_hallows}};
unpack(24127, srv, _B0) -> {ok, {}};
unpack(24127, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_endtime, _B2} = protocol:uint32(_B1),
    {V1_eqm_hallows, _B3} = protocol:uint32(_B2),
    {ok, {V1_id, V1_endtime, V1_eqm_hallows}};
unpack(24128, srv, _B0) -> {ok, {}};
unpack(24128, cli, _B0) ->
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
unpack(24129, srv, _B0) -> {ok, {}};
unpack(24129, cli, _B0) ->
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
unpack(24130, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24130, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24131, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24131, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24132, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_hallows_id, _B2} = protocol:uint32(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {ok, {V1_id, V1_hallows_id, V1_flag}};
unpack(24132, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24133, srv, _B0) -> {ok, {}};
unpack(24133, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(24135, srv, _B0) ->
    {V1_hallows_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_hallows_id}};
unpack(24135, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_hallows_id, _B3} = protocol:uint32(_B2),
    {V1_refine_lev, _B4} = protocol:uint32(_B3),
    {ok, {V1_code, V1_msg, V1_hallows_id, V1_refine_lev}};
unpack(24136, srv, _B0) ->
    {V1_r_rid, _B1} = protocol:uint32(_B0),
    {V1_r_srvid, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint32(_B2),
    {ok, {V1_r_rid, V1_r_srvid, V1_type}};
unpack(24136, cli, _B0) ->
    {V1_hallows, _B17} = protocol:array(_B0,
					fun (_B1) ->
						{V2_id, _B2} =
						    protocol:uint32(_B1),
						{V2_step, _B3} =
						    protocol:uint32(_B2),
						{V2_add_attr, _B8} =
						    protocol:array(_B3,
								   fun (_B4) ->
									   {V3_attr_id,
									    _B5} =
									       protocol:uint32(_B4),
									   {V3_attr_val,
									    _B6} =
									       protocol:uint32(_B5),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B6}
								   end),
						{V2_skill, _B13} =
						    protocol:array(_B8,
								   fun (_B9) ->
									   {V3_lev,
									    _B10} =
									       protocol:uint32(_B9),
									   {V3_skill_bid,
									    _B11} =
									       protocol:uint32(_B10),
									   {{V3_lev,
									     V3_skill_bid},
									    _B11}
								   end),
						{V2_look_id, _B14} =
						    protocol:uint32(_B13),
						{V2_refine_lev, _B15} =
						    protocol:uint32(_B14),
						{{V2_id, V2_step, V2_add_attr,
						  V2_skill, V2_look_id,
						  V2_refine_lev},
						 _B15}
					end),
    {ok, {V1_hallows}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


