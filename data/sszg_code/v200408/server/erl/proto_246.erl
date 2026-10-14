-file("src/proto/proto_246.erl", 1).

-module(proto_246).

-lager_records([{questionnaire,
		 [id, title, sort, topic_type, specific_type, must,
		  option, jump, topic, option_list]},
		{questionnaire_total,
		 [id, title, memo, guide, welcome, start_time, end_time,
		  mail_title, mail_content, rewards, min_lev, max_lev,
		  recharge_min, recharge_max]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/questionnaire.hrl", 1).

-record(questionnaire_total,
	{id = 0, title = <<>>, memo = <<>>, guide = 0,
	 welcome = 0, start_time = 0, end_time = 0,
	 mail_title = <<>>, mail_content = <<>>, rewards = [],
	 min_lev = 0, max_lev = 0, recharge_min = 0,
	 recharge_max = 0}).

-record(questionnaire,
	{id = 0, title = <<>>, sort = 0, topic_type = 0,
	 specific_type = 0, must = 0, option = <<>>, jump = 0,
	 topic = 0, option_list = <<>>}).

-file("src/proto/proto_246.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(24600, cli, {}) -> {ok, <<2:32, 24600:16>>};
pack(24600, srv,
     {V0_status, V0_start_time, V0_end_time, V0_flag}) ->
    D_a_t_a = <<V0_status:8, V0_start_time:32,
		V0_end_time:32, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24600:16,
       D_a_t_a/binary>>};
pack(24601, cli, {}) -> {ok, <<2:32, 24601:16>>};
pack(24601, srv,
     {#questionnaire_total{id = V0_id, title = V0_title,
			   memo = V0_memo, rewards = V0_rewards}}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_title))/binary,
		(protocol:pack(string, V0_memo))/binary,
		(length(V0_rewards)):16,
		(list_to_binary([<<V1_bid:32, V1_bind:8, V1_num:32>>
				 || {V1_bid, V1_bind, V1_num}
					<- V0_rewards]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24601:16,
       D_a_t_a/binary>>};
pack(24602, cli, {}) -> {ok, <<2:32, 24602:16>>};
pack(24602, srv, {V0_questionnaire_list}) ->
    D_a_t_a = <<(length(V0_questionnaire_list)):16,
		(list_to_binary([<<V1_id:32,
				   (protocol:pack(string, V1_title))/binary,
				   V1_sort:16, V1_topic_type:8,
				   V1_specific_type:8, V1_must:8, V1_jump:8,
				   V1_topic:32,
				   (protocol:pack(string, V1_option))/binary,
				   (protocol:pack(string,
						  V1_option_list))/binary>>
				 || #questionnaire{id = V1_id, title = V1_title,
						   sort = V1_sort,
						   topic_type = V1_topic_type,
						   specific_type =
						       V1_specific_type,
						   must = V1_must,
						   jump = V1_jump,
						   topic = V1_topic,
						   option = V1_option,
						   option_list = V1_option_list}
					<- V0_questionnaire_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24602:16,
       D_a_t_a/binary>>};
pack(24603, cli, {V0_ret_list}) ->
    D_a_t_a = <<(length(V0_ret_list)):16,
		(list_to_binary([<<V1_id:32, V1_topic_type:8,
				   (protocol:pack(string, V1_ret))/binary>>
				 || {V1_id, V1_topic_type, V1_ret}
					<- V0_ret_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24603:16,
       D_a_t_a/binary>>};
pack(24603, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24603:16,
       D_a_t_a/binary>>};
pack(24604, cli, {}) -> {ok, <<2:32, 24604:16>>};
pack(24604, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 24604:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(24600, srv, _B0) -> {ok, {}};
unpack(24600, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_start_time, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_flag, _B4} = protocol:uint8(_B3),
    {ok, {V1_status, V1_start_time, V1_end_time, V1_flag}};
unpack(24601, srv, _B0) -> {ok, {}};
unpack(24601, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_title, _B2} = protocol:string(_B1),
    {V1_memo, _B3} = protocol:string(_B2),
    {V1_rewards, _B9} = protocol:array(_B3,
				       fun (_B4) ->
					       {V2_bid, _B5} =
						   protocol:uint32(_B4),
					       {V2_bind, _B6} =
						   protocol:uint8(_B5),
					       {V2_num, _B7} =
						   protocol:uint32(_B6),
					       {{V2_bid, V2_bind, V2_num}, _B7}
				       end),
    {ok, {V1_id, V1_title, V1_memo, V1_rewards}};
unpack(24602, srv, _B0) -> {ok, {}};
unpack(24602, cli, _B0) ->
    {V1_questionnaire_list, _B13} = protocol:array(_B0,
						   fun (_B1) ->
							   {V2_id, _B2} =
							       protocol:uint32(_B1),
							   {V2_title, _B3} =
							       protocol:string(_B2),
							   {V2_sort, _B4} =
							       protocol:uint16(_B3),
							   {V2_topic_type,
							    _B5} =
							       protocol:uint8(_B4),
							   {V2_specific_type,
							    _B6} =
							       protocol:uint8(_B5),
							   {V2_must, _B7} =
							       protocol:uint8(_B6),
							   {V2_jump, _B8} =
							       protocol:uint8(_B7),
							   {V2_topic, _B9} =
							       protocol:uint32(_B8),
							   {V2_option, _B10} =
							       protocol:string(_B9),
							   {V2_option_list,
							    _B11} =
							       protocol:string(_B10),
							   {{V2_id, V2_title,
							     V2_sort,
							     V2_topic_type,
							     V2_specific_type,
							     V2_must, V2_jump,
							     V2_topic,
							     V2_option,
							     V2_option_list},
							    _B11}
						   end),
    {ok, {V1_questionnaire_list}};
unpack(24603, srv, _B0) ->
    {V1_ret_list, _B6} = protocol:array(_B0,
					fun (_B1) ->
						{V2_id, _B2} =
						    protocol:uint32(_B1),
						{V2_topic_type, _B3} =
						    protocol:uint8(_B2),
						{V2_ret, _B4} =
						    protocol:string(_B3),
						{{V2_id, V2_topic_type, V2_ret},
						 _B4}
					end),
    {ok, {V1_ret_list}};
unpack(24603, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(24604, srv, _B0) -> {ok, {}};
unpack(24604, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


