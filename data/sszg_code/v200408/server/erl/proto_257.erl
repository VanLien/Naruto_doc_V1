-file("src/proto/proto_257.erl", 1).

-module(proto_257).

-lager_records([{holiday_snatch_log,
		 [log_id, win_num, win_role_info, join_num, max_num,
		  time, award, award_name, ext]},
		{holiday_snatch_role_info,
		 [sid, num, open_srv_time, merge_srvs, ext]},
		{holiday_snatch_info,
		 [pos, round, id, num, num_list, win_num, state,
		  state_time, rand_list, win_role_info, ext]},
		{holiday_snatch, [zone_id, info, ext]},
		{m_holiday_snatch,
		 [ver, camp_id, buy_log, old_data, ext]}]).

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

-file("src/proto/proto_257.erl", 16).

-file("inc/holiday_snatch.hrl", 1).

-record(m_holiday_snatch,
	{ver = 1, camp_id = 0, buy_log = [], old_data = [],
	 ext = []}).

-record(holiday_snatch,
	{zone_id = 0, info = [], ext = []}).

-record(holiday_snatch_info,
	{pos = 0, round = 1, id = 0, num = 0, num_list = [],
	 win_num = 0, state = 0, state_time = 0, rand_list = [],
	 win_role_info = #{}, ext = []}).

-record(holiday_snatch_role_info,
	{sid = <<>>, num = 0, open_srv_time = 0,
	 merge_srvs = [], ext = []}).

-record(holiday_snatch_log,
	{log_id = {0, 0}, win_num = 0, win_role_info = #{},
	 join_num = 0, max_num = 0, time = 0, award = [],
	 award_name = <<>>, ext = []}).

-file("src/proto/proto_257.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25700, cli, {}) -> {ok, <<2:32, 25700:16>>};
pack(25700, srv,
     {V0_state, V0_state_time, V0_holiday_snatch_info,
      V0_logs}) ->
    D_a_t_a = <<V0_state:8, V0_state_time:32,
		(length(V0_holiday_snatch_info)):16,
		(list_to_binary([<<V1_pos:32, V1_id:32, V1_num:32,
				   V1_state:8, V1_state_time:32,
				   (length(V1_ext)):16,
				   (list_to_binary([<<V2_key:32, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext]))/binary>>
				 || #holiday_snatch_info{pos = V1_pos,
							 id = V1_id,
							 num = V1_num,
							 state = V1_state,
							 state_time =
							     V1_state_time,
							 ext = V1_ext}
					<- V0_holiday_snatch_info]))/binary,
		(length(V0_logs)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_win_name))/binary,
				   V1_join_num:32, V1_max_num:32, V1_time:32,
				   (protocol:pack(string,
						  V1_award_name))/binary,
				   (length(V1_awards)):16,
				   (list_to_binary([<<V2_id:32, V2_num:32>>
						    || {V2_id, V2_num}
							   <- V1_awards]))/binary>>
				 || {V1_win_name, V1_join_num, V1_max_num,
				     V1_time, V1_award_name, V1_awards}
					<- V0_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25700:16,
       D_a_t_a/binary>>};
pack(25701, cli, {V0_pos, V0_num}) ->
    D_a_t_a = <<V0_pos:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25701:16,
       D_a_t_a/binary>>};
pack(25701, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25701:16,
       D_a_t_a/binary>>};
pack(25702, cli, {V0_pos}) ->
    D_a_t_a = <<V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25702:16,
       D_a_t_a/binary>>};
pack(25702, srv,
     {V0_is_win, V0_win_num, {V0_rid, V0_srv_id},
      V0_win_name, V0_win_face, V0_win_lev, V0_id,
      V0_buy_nums}) ->
    D_a_t_a = <<V0_is_win:8, V0_win_num:32, V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_win_name))/binary,
		V0_win_face:32, V0_win_lev:32, V0_id:32,
		(length(V0_buy_nums)):16,
		(list_to_binary([<<V1_num:32>>
				 || V1_num <- V0_buy_nums]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25702:16,
       D_a_t_a/binary>>};
pack(25703, cli, {}) -> {ok, <<2:32, 25703:16>>};
pack(25703, srv, {V0_logs}) ->
    D_a_t_a = <<(length(V0_logs)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_win_name))/binary,
				   V1_join_num:32, V1_max_num:32, V1_time:32,
				   (protocol:pack(string,
						  V1_award_name))/binary,
				   (length(V1_awards)):16,
				   (list_to_binary([<<V2_id:32, V2_num:32>>
						    || {V2_id, V2_num}
							   <- V1_awards]))/binary>>
				 || {V1_win_name, V1_join_num, V1_max_num,
				     V1_time, V1_award_name, V1_awards}
					<- V0_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25703:16,
       D_a_t_a/binary>>};
pack(25704, cli, {}) -> {ok, <<2:32, 25704:16>>};
pack(25704, srv, {V0_logs}) ->
    D_a_t_a = <<(length(V0_logs)):16,
		(list_to_binary([<<V1_is_win:8, V1_win_num:32,
				   (length(V1_buy_nums)):16,
				   (list_to_binary([<<V2_num:32>>
						    || V2_num
							   <- V1_buy_nums]))/binary,
				   V1_time:32,
				   (protocol:pack(string,
						  V1_award_name))/binary,
				   (length(V1_awards)):16,
				   (list_to_binary([<<V2_id:32, V2_num:32>>
						    || {V2_id, V2_num}
							   <- V1_awards]))/binary>>
				 || {V1_is_win, V1_win_num, V1_buy_nums,
				     V1_time, V1_award_name, V1_awards}
					<- V0_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25704:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25700, srv, _B0) -> {ok, {}};
unpack(25700, cli, _B0) ->
    {V1_state, _B1} = protocol:uint8(_B0),
    {V1_state_time, _B2} = protocol:uint32(_B1),
    {V1_holiday_snatch_info, _B15} = protocol:array(_B2,
						    fun (_B3) ->
							    {V2_pos, _B4} =
								protocol:uint32(_B3),
							    {V2_id, _B5} =
								protocol:uint32(_B4),
							    {V2_num, _B6} =
								protocol:uint32(_B5),
							    {V2_state, _B7} =
								protocol:uint8(_B6),
							    {V2_state_time,
							     _B8} =
								protocol:uint32(_B7),
							    {V2_ext, _B13} =
								protocol:array(_B8,
									       fun
										 (_B9) ->
										     {V3_key,
										      _B10} =
											 protocol:uint32(_B9),
										     {V3_val,
										      _B11} =
											 protocol:uint32(_B10),
										     {{V3_key,
										       V3_val},
										      _B11}
									       end),
							    {{V2_pos, V2_id,
							      V2_num, V2_state,
							      V2_state_time,
							      V2_ext},
							     _B13}
						    end),
    {V1_logs, _B28} = protocol:array(_B15,
				     fun (_B16) ->
					     {V2_win_name, _B17} =
						 protocol:string(_B16),
					     {V2_join_num, _B18} =
						 protocol:uint32(_B17),
					     {V2_max_num, _B19} =
						 protocol:uint32(_B18),
					     {V2_time, _B20} =
						 protocol:uint32(_B19),
					     {V2_award_name, _B21} =
						 protocol:string(_B20),
					     {V2_awards, _B26} =
						 protocol:array(_B21,
								fun (_B22) ->
									{V3_id,
									 _B23} =
									    protocol:uint32(_B22),
									{V3_num,
									 _B24} =
									    protocol:uint32(_B23),
									{{V3_id,
									  V3_num},
									 _B24}
								end),
					     {{V2_win_name, V2_join_num,
					       V2_max_num, V2_time,
					       V2_award_name, V2_awards},
					      _B26}
				     end),
    {ok,
     {V1_state, V1_state_time, V1_holiday_snatch_info,
      V1_logs}};
unpack(25701, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_pos, V1_num}};
unpack(25701, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25702, srv, _B0) ->
    {V1_pos, _B1} = protocol:uint32(_B0), {ok, {V1_pos}};
unpack(25702, cli, _B0) ->
    {V1_is_win, _B1} = protocol:uint8(_B0),
    {V1_win_num, _B2} = protocol:uint32(_B1),
    {V1_rid, _B3} = protocol:uint32(_B2),
    {V1_srv_id, _B4} = protocol:string(_B3),
    {V1_win_name, _B5} = protocol:string(_B4),
    {V1_win_face, _B6} = protocol:uint32(_B5),
    {V1_win_lev, _B7} = protocol:uint32(_B6),
    {V1_id, _B8} = protocol:uint32(_B7),
    {V1_buy_nums, _B12} = protocol:array(_B8,
					 fun (_B9) ->
						 {V2_num, _B10} =
						     protocol:uint32(_B9),
						 {V2_num, _B10}
					 end),
    {ok,
     {V1_is_win, V1_win_num, V1_rid, V1_srv_id, V1_win_name,
      V1_win_face, V1_win_lev, V1_id, V1_buy_nums}};
unpack(25703, srv, _B0) -> {ok, {}};
unpack(25703, cli, _B0) ->
    {V1_logs, _B13} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_win_name, _B2} =
						 protocol:string(_B1),
					     {V2_join_num, _B3} =
						 protocol:uint32(_B2),
					     {V2_max_num, _B4} =
						 protocol:uint32(_B3),
					     {V2_time, _B5} =
						 protocol:uint32(_B4),
					     {V2_award_name, _B6} =
						 protocol:string(_B5),
					     {V2_awards, _B11} =
						 protocol:array(_B6,
								fun (_B7) ->
									{V3_id,
									 _B8} =
									    protocol:uint32(_B7),
									{V3_num,
									 _B9} =
									    protocol:uint32(_B8),
									{{V3_id,
									  V3_num},
									 _B9}
								end),
					     {{V2_win_name, V2_join_num,
					       V2_max_num, V2_time,
					       V2_award_name, V2_awards},
					      _B11}
				     end),
    {ok, {V1_logs}};
unpack(25704, srv, _B0) -> {ok, {}};
unpack(25704, cli, _B0) ->
    {V1_logs, _B16} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_is_win, _B2} =
						 protocol:uint8(_B1),
					     {V2_win_num, _B3} =
						 protocol:uint32(_B2),
					     {V2_buy_nums, _B7} =
						 protocol:array(_B3,
								fun (_B4) ->
									{V3_num,
									 _B5} =
									    protocol:uint32(_B4),
									{V3_num,
									 _B5}
								end),
					     {V2_time, _B8} =
						 protocol:uint32(_B7),
					     {V2_award_name, _B9} =
						 protocol:string(_B8),
					     {V2_awards, _B14} =
						 protocol:array(_B9,
								fun (_B10) ->
									{V3_id,
									 _B11} =
									    protocol:uint32(_B10),
									{V3_num,
									 _B12} =
									    protocol:uint32(_B11),
									{{V3_id,
									  V3_num},
									 _B12}
								end),
					     {{V2_is_win, V2_win_num,
					       V2_buy_nums, V2_time,
					       V2_award_name, V2_awards},
					      _B14}
				     end),
    {ok, {V1_logs}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


