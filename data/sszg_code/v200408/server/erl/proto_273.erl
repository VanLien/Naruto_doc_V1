-file("src/proto/proto_273.erl", 1).

-module(proto_273).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(27300, cli, {}) -> {ok, <<2:32, 27300:16>>};
pack(27300, srv,
     {V0_end_time, V0_lev, V0_score, V0_max_score,
      V0_reward}) ->
    D_a_t_a = <<V0_end_time:32, V0_lev:32, V0_score:32,
		V0_max_score:32, (length(V0_reward)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27300:16,
       D_a_t_a/binary>>};
pack(27301, cli, {V0_reward_list}) ->
    D_a_t_a = <<(length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27301:16,
       D_a_t_a/binary>>};
pack(27301, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 27301:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(27300, srv, _B0) -> {ok, {}};
unpack(27300, cli, _B0) ->
    {V1_end_time, _B1} = protocol:uint32(_B0),
    {V1_lev, _B2} = protocol:uint32(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_max_score, _B4} = protocol:uint32(_B3),
    {V1_reward, _B8} = protocol:array(_B4,
				      fun (_B5) ->
					      {V2_id, _B6} =
						  protocol:uint32(_B5),
					      {V2_id, _B6}
				      end),
    {ok,
     {V1_end_time, V1_lev, V1_score, V1_max_score,
      V1_reward}};
unpack(27301, srv, _B0) ->
    {V1_reward_list, _B4} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_id, _B2}
					   end),
    {ok, {V1_reward_list}};
unpack(27301, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


