-file("src/proto/proto_285.erl", 1).

-module(proto_285).

-lager_records([]).

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

-file("src/proto/proto_285.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(28500, cli, {}) -> {ok, <<2:32, 28500:16>>};
pack(28500, srv,
     {V0_end_time, V0_lev, V0_score, V0_max_score,
      V0_my_score, V0_acc_score, V0_max_acc_score,
      V0_reward}) ->
    D_a_t_a = <<V0_end_time:32, V0_lev:32, V0_score:32,
		V0_max_score:32, V0_my_score:32, V0_acc_score:32,
		V0_max_acc_score:32, (length(V0_reward)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_reward]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28500:16,
       D_a_t_a/binary>>};
pack(28501, cli, {V0_reward_list}) ->
    D_a_t_a = <<(length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28501:16,
       D_a_t_a/binary>>};
pack(28501, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28501:16,
       D_a_t_a/binary>>};
pack(28502, cli, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28502:16,
       D_a_t_a/binary>>};
pack(28502, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28502:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(28500, srv, _B0) -> {ok, {}};
unpack(28500, cli, _B0) ->
    {V1_end_time, _B1} = protocol:uint32(_B0),
    {V1_lev, _B2} = protocol:uint32(_B1),
    {V1_score, _B3} = protocol:uint32(_B2),
    {V1_max_score, _B4} = protocol:uint32(_B3),
    {V1_my_score, _B5} = protocol:uint32(_B4),
    {V1_acc_score, _B6} = protocol:uint32(_B5),
    {V1_max_acc_score, _B7} = protocol:uint32(_B6),
    {V1_reward, _B11} = protocol:array(_B7,
				       fun (_B8) ->
					       {V2_id, _B9} =
						   protocol:uint32(_B8),
					       {V2_id, _B9}
				       end),
    {ok,
     {V1_end_time, V1_lev, V1_score, V1_max_score,
      V1_my_score, V1_acc_score, V1_max_acc_score,
      V1_reward}};
unpack(28501, srv, _B0) ->
    {V1_reward_list, _B4} = protocol:array(_B0,
					   fun (_B1) ->
						   {V2_id, _B2} =
						       protocol:uint32(_B1),
						   {V2_id, _B2}
					   end),
    {ok, {V1_reward_list}};
unpack(28501, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(28502, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_num}};
unpack(28502, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


