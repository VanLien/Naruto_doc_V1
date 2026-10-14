-file("src/proto/proto_266.erl", 1).

-module(proto_266).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(26600, cli, {}) -> {ok, <<2:32, 26600:16>>};
pack(26600, srv, {V0_flag, V0_msg, V0_time, V0_sort}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_time:32,
		V0_sort:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26600:16,
       D_a_t_a/binary>>};
pack(26601, cli, {}) -> {ok, <<2:32, 26601:16>>};
pack(26601, srv,
     {V0_time, V0_last_time, V0_lottery_id, V0_sort_list}) ->
    D_a_t_a = <<V0_time:32, V0_last_time:32,
		V0_lottery_id:32, (length(V0_sort_list)):16,
		(list_to_binary([<<V1_sort:32>>
				 || V1_sort <- V0_sort_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26601:16,
       D_a_t_a/binary>>};
pack(26602, cli, {}) -> {ok, <<2:32, 26602:16>>};
pack(26602, srv, {V0_reward_list}) ->
    D_a_t_a = <<(length(V0_reward_list)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num}
					<- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 26602:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(26600, srv, _B0) -> {ok, {}};
unpack(26600, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_time, _B3} = protocol:uint32(_B2),
    {V1_sort, _B4} = protocol:uint32(_B3),
    {ok, {V1_flag, V1_msg, V1_time, V1_sort}};
unpack(26601, srv, _B0) -> {ok, {}};
unpack(26601, cli, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0),
    {V1_last_time, _B2} = protocol:uint32(_B1),
    {V1_lottery_id, _B3} = protocol:uint32(_B2),
    {V1_sort_list, _B7} = protocol:array(_B3,
					 fun (_B4) ->
						 {V2_sort, _B5} =
						     protocol:uint32(_B4),
						 {V2_sort, _B5}
					 end),
    {ok,
     {V1_time, V1_last_time, V1_lottery_id, V1_sort_list}};
unpack(26602, srv, _B0) -> {ok, {}};
unpack(26602, cli, _B0) ->
    {V1_reward_list, _B5} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_bid, _B2} =
						       protocol:uint32(_B1),
						   {V2_num, _B3} =
						       protocol:uint32(_B2),
						   {{V2_bid, V2_num}, _B3}
					   end),
    {ok, {V1_reward_list}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


