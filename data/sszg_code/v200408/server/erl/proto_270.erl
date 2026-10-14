-file("src/proto/proto_270.erl", 1).

-module(proto_270).

-lager_records([{self_add_info,
		 [id, time, score, status, total_time, interval]},
		{get_red_packet_info,
		 [r_id, red_id, name, lev, face_id, avatar_bid, time,
		  item]},
		{petard_red_packet,
		 [id, rid, name, face_id, avatar_bid, num, max_num,
		  is_max, mems, must_not, start_time, end_time, msg_id]},
		{m_holiday_petard,
		 [ver, camp_id, end_time, get_red_count, send_red_count,
		  send_notice, must_not_small, must_not_big,
		  petard_reward, red_packet_info, get_red_info]},
		{quest_stats, [type, stats, desc]},
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

-file("src/proto/proto_270.erl", 16).

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

-file("src/proto/proto_270.erl", 17).

-file("inc/holiday_petard.hrl", 1).

-record(m_holiday_petard,
	{ver = 2, camp_id = 0, end_time = 0, get_red_count = 0,
	 send_red_count = 0, send_notice = 0,
	 must_not_small = [], must_not_big = [],
	 petard_reward = [], red_packet_info = [],
	 get_red_info = []}).

-record(petard_red_packet,
	{id = 0, rid = {0, <<>>}, name = <<>>, face_id = 0,
	 avatar_bid = 0, num = 0, max_num = 0, is_max = 0,
	 mems = [], must_not = [], start_time = 0, end_time = 0,
	 msg_id = 0}).

-record(get_red_packet_info,
	{r_id = {0, <<>>}, red_id = 0, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, time = 0, item = []}).

-record(self_add_info,
	{id = 0, time = 0, score = 0, status = 0,
	 total_time = 0, interval = 0}).

-file("src/proto/proto_270.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(27000, cli, {}) -> {ok, <<2:32, 27000:16>>};
pack(27000, srv,
     {V0_end_time, V0_score, V0_lev_score,
      V0_score_award}) ->
    D_a_t_a = <<V0_end_time:32, V0_score:32,
		V0_lev_score:32, (length(V0_score_award)):16,
		(list_to_binary([<<V1_id:16, V1_status:8>>
				 || {V1_id, V1_status}
					<- V0_score_award]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27000:16,
       D_a_t_a/binary>>};
pack(27001, cli, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27001:16,
       D_a_t_a/binary>>};
pack(27001, srv, {V0_id, V0_code, V0_msg, V0_flag}) ->
    D_a_t_a = <<V0_id:32, V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_flag:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27001:16,
       D_a_t_a/binary>>};
pack(27002, cli, {}) -> {ok, <<2:32, 27002:16>>};
pack(27002, srv,
     {V0_red_packet_list, V0_get_num, V0_max_num}) ->
    D_a_t_a = <<(length(V0_red_packet_list)):16,
		(list_to_binary([<<V1_red_packet_id:32, V1_msg_id:16,
				   (protocol:pack(string, V1_name))/binary,
				   V1_status:8>>
				 || {V1_red_packet_id, V1_msg_id, V1_name,
				     V1_status}
					<- V0_red_packet_list]))/binary,
		V0_get_num:16, V0_max_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27002:16,
       D_a_t_a/binary>>};
pack(27003, cli, {V0_red_packet_id}) ->
    D_a_t_a = <<V0_red_packet_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27003:16,
       D_a_t_a/binary>>};
pack(27003, srv,
     {V0_code, V0_msg, V0_get_red_packet_list,
      V0_red_packet_id, V0_get_num, V0_max_num, V0_end_time,
      V0_send_name, V0_send_face_id, V0_send_avatar_bid}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_get_red_packet_list)):16,
		(list_to_binary([<<V1_r_rid:32,
				   (protocol:pack(string, V1_r_srvid))/binary,
				   V1_red_id:32,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:32, V1_face_id:32, V1_avatar_bid:32,
				   V1_time:32, (length(V1_item)):16,
				   (list_to_binary([<<V2_item_id:16, V2_num:32>>
						    || {V2_item_id, V2_num}
							   <- V1_item]))/binary>>
				 || #get_red_packet_info{r_id =
							     {V1_r_rid,
							      V1_r_srvid},
							 red_id = V1_red_id,
							 name = V1_name,
							 lev = V1_lev,
							 face_id = V1_face_id,
							 avatar_bid =
							     V1_avatar_bid,
							 time = V1_time,
							 item = V1_item}
					<- V0_get_red_packet_list]))/binary,
		V0_red_packet_id:32, V0_get_num:16, V0_max_num:16,
		V0_end_time:32,
		(protocol:pack(string, V0_send_name))/binary,
		V0_send_face_id:32, V0_send_avatar_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27003:16,
       D_a_t_a/binary>>};
pack(27004, cli, {}) -> {ok, <<2:32, 27004:16>>};
pack(27004, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27004:16,
       D_a_t_a/binary>>};
pack(27005, cli, {}) -> {ok, <<2:32, 27005:16>>};
pack(27005, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27005:16,
       D_a_t_a/binary>>};
pack(27006, cli, {}) -> {ok, <<2:32, 27006:16>>};
pack(27006, srv, {V0_get_red_packet_list}) ->
    D_a_t_a = <<(length(V0_get_red_packet_list)):16,
		(list_to_binary([<<V1_r_rid:32,
				   (protocol:pack(string, V1_r_srvid))/binary,
				   V1_red_id:32,
				   (protocol:pack(string, V1_name))/binary,
				   V1_lev:32, V1_face_id:32, V1_avatar_bid:32,
				   V1_time:32, (length(V1_item)):16,
				   (list_to_binary([<<V2_item_id:16, V2_num:32>>
						    || {V2_item_id, V2_num}
							   <- V1_item]))/binary>>
				 || #get_red_packet_info{r_id =
							     {V1_r_rid,
							      V1_r_srvid},
							 red_id = V1_red_id,
							 name = V1_name,
							 lev = V1_lev,
							 face_id = V1_face_id,
							 avatar_bid =
							     V1_avatar_bid,
							 time = V1_time,
							 item = V1_item}
					<- V0_get_red_packet_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27006:16,
       D_a_t_a/binary>>};
pack(27007, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27007:16,
       D_a_t_a/binary>>};
pack(27007, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27007:16,
       D_a_t_a/binary>>};
pack(27008, cli, {}) -> {ok, <<2:32, 27008:16>>};
pack(27008, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27008:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(27000, srv, _B0) -> {ok, {}};
unpack(27000, cli, _B0) ->
    {V1_end_time, _B1} = protocol:uint32(_B0),
    {V1_score, _B2} = protocol:uint32(_B1),
    {V1_lev_score, _B3} = protocol:uint32(_B2),
    {V1_score_award, _B8} = protocol:array(_B3,
					   fun (_B4) ->
						   {V2_id, _B5} =
						       protocol:uint16(_B4),
						   {V2_status, _B6} =
						       protocol:uint8(_B5),
						   {{V2_id, V2_status}, _B6}
					   end),
    {ok,
     {V1_end_time, V1_score, V1_lev_score, V1_score_award}};
unpack(27001, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_num}};
unpack(27001, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_flag, _B4} = protocol:uint32(_B3),
    {ok, {V1_id, V1_code, V1_msg, V1_flag}};
unpack(27002, srv, _B0) -> {ok, {}};
unpack(27002, cli, _B0) ->
    {V1_red_packet_list, _B7} = protocol:array(_B0,
					       fun (_B1) ->
						       {V2_red_packet_id, _B2} =
							   protocol:uint32(_B1),
						       {V2_msg_id, _B3} =
							   protocol:uint16(_B2),
						       {V2_name, _B4} =
							   protocol:string(_B3),
						       {V2_status, _B5} =
							   protocol:uint8(_B4),
						       {{V2_red_packet_id,
							 V2_msg_id, V2_name,
							 V2_status},
							_B5}
					       end),
    {V1_get_num, _B8} = protocol:uint16(_B7),
    {V1_max_num, _B9} = protocol:uint16(_B8),
    {ok, {V1_red_packet_list, V1_get_num, V1_max_num}};
unpack(27003, srv, _B0) ->
    {V1_red_packet_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_red_packet_id}};
unpack(27003, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_get_red_packet_list, _B18} = protocol:array(_B2,
						    fun (_B3) ->
							    {V2_r_rid, _B4} =
								protocol:uint32(_B3),
							    {V2_r_srvid, _B5} =
								protocol:string(_B4),
							    {V2_red_id, _B6} =
								protocol:uint32(_B5),
							    {V2_name, _B7} =
								protocol:string(_B6),
							    {V2_lev, _B8} =
								protocol:uint32(_B7),
							    {V2_face_id, _B9} =
								protocol:uint32(_B8),
							    {V2_avatar_bid,
							     _B10} =
								protocol:uint32(_B9),
							    {V2_time, _B11} =
								protocol:uint32(_B10),
							    {V2_item, _B16} =
								protocol:array(_B11,
									       fun
										 (_B12) ->
										     {V3_item_id,
										      _B13} =
											 protocol:uint16(_B12),
										     {V3_num,
										      _B14} =
											 protocol:uint32(_B13),
										     {{V3_item_id,
										       V3_num},
										      _B14}
									       end),
							    {{V2_r_rid,
							      V2_r_srvid,
							      V2_red_id,
							      V2_name, V2_lev,
							      V2_face_id,
							      V2_avatar_bid,
							      V2_time, V2_item},
							     _B16}
						    end),
    {V1_red_packet_id, _B19} = protocol:uint32(_B18),
    {V1_get_num, _B20} = protocol:uint16(_B19),
    {V1_max_num, _B21} = protocol:uint16(_B20),
    {V1_end_time, _B22} = protocol:uint32(_B21),
    {V1_send_name, _B23} = protocol:string(_B22),
    {V1_send_face_id, _B24} = protocol:uint32(_B23),
    {V1_send_avatar_bid, _B25} = protocol:uint32(_B24),
    {ok,
     {V1_code, V1_msg, V1_get_red_packet_list,
      V1_red_packet_id, V1_get_num, V1_max_num, V1_end_time,
      V1_send_name, V1_send_face_id, V1_send_avatar_bid}};
unpack(27004, srv, _B0) -> {ok, {}};
unpack(27004, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(27005, srv, _B0) -> {ok, {}};
unpack(27005, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(27006, srv, _B0) -> {ok, {}};
unpack(27006, cli, _B0) ->
    {V1_get_red_packet_list, _B16} = protocol:array(_B0,
						    fun (_B1) ->
							    {V2_r_rid, _B2} =
								protocol:uint32(_B1),
							    {V2_r_srvid, _B3} =
								protocol:string(_B2),
							    {V2_red_id, _B4} =
								protocol:uint32(_B3),
							    {V2_name, _B5} =
								protocol:string(_B4),
							    {V2_lev, _B6} =
								protocol:uint32(_B5),
							    {V2_face_id, _B7} =
								protocol:uint32(_B6),
							    {V2_avatar_bid,
							     _B8} =
								protocol:uint32(_B7),
							    {V2_time, _B9} =
								protocol:uint32(_B8),
							    {V2_item, _B14} =
								protocol:array(_B9,
									       fun
										 (_B10) ->
										     {V3_item_id,
										      _B11} =
											 protocol:uint16(_B10),
										     {V3_num,
										      _B12} =
											 protocol:uint32(_B11),
										     {{V3_item_id,
										       V3_num},
										      _B12}
									       end),
							    {{V2_r_rid,
							      V2_r_srvid,
							      V2_red_id,
							      V2_name, V2_lev,
							      V2_face_id,
							      V2_avatar_bid,
							      V2_time, V2_item},
							     _B14}
						    end),
    {ok, {V1_get_red_packet_list}};
unpack(27007, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(27007, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint16(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(27008, srv, _B0) -> {ok, {}};
unpack(27008, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


