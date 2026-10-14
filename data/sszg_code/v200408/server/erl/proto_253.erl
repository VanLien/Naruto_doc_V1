-file("src/proto/proto_253.erl", 1).

-module(proto_253).

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

-file("src/proto/proto_253.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(25300, cli, {}) -> {ok, <<2:32, 25300:16>>};
pack(25300, srv,
     {V0_period, V0_cur_day, V0_end_time, V0_lev, V0_exp,
      V0_rmb_status, V0_exp_status, V0_list}) ->
    D_a_t_a = <<V0_period:8, V0_cur_day:32, V0_end_time:32,
		V0_lev:32, V0_exp:32, V0_rmb_status:8, V0_exp_status:8,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_type:8, V1_finish:8,
				   V1_target_val:32, V1_value:32,
				   V1_end_time:32>>
				 || {V1_id, V1_type, V1_finish, V1_target_val,
				     V1_value, V1_end_time}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25300:16,
       D_a_t_a/binary>>};
pack(25301, cli, {}) -> {ok, <<2:32, 25301:16>>};
pack(25301, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_type:8, V1_finish:8,
				   V1_target_val:32, V1_value:32,
				   V1_end_time:32>>
				 || {V1_id, V1_type, V1_finish, V1_target_val,
				     V1_value, V1_end_time}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25301:16,
       D_a_t_a/binary>>};
pack(25302, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25302:16,
       D_a_t_a/binary>>};
pack(25302, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25302:16,
       D_a_t_a/binary>>};
pack(25303, cli, {}) -> {ok, <<2:32, 25303:16>>};
pack(25303, srv, {V0_lev, V0_reward_list}) ->
    D_a_t_a = <<V0_lev:32, (length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:16, V1_status:8,
				   V1_rmb_status:8>>
				 || {V1_id, V1_status, V1_rmb_status}
					<- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25303:16,
       D_a_t_a/binary>>};
pack(25304, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25304:16,
       D_a_t_a/binary>>};
pack(25304, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25304:16,
       D_a_t_a/binary>>};
pack(25305, cli, {}) -> {ok, <<2:32, 25305:16>>};
pack(25305, srv, {V0_lev, V0_exp}) ->
    D_a_t_a = <<V0_lev:32, V0_exp:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25305:16,
       D_a_t_a/binary>>};
pack(25306, cli, {}) -> {ok, <<2:32, 25306:16>>};
pack(25306, srv,
     {V0_rmb_status, V0_exp_status, V0_list}) ->
    D_a_t_a = <<V0_rmb_status:8, V0_exp_status:8,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:8>>
				 || {V1_id, V1_status} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25306:16,
       D_a_t_a/binary>>};
pack(25307, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25307:16,
       D_a_t_a/binary>>};
pack(25307, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25307:16,
       D_a_t_a/binary>>};
pack(25308, cli, {}) -> {ok, <<2:32, 25308:16>>};
pack(25308, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25308:16,
       D_a_t_a/binary>>};
pack(25309, cli, {}) -> {ok, <<2:32, 25309:16>>};
pack(25309, srv, {V0_is_pop, V0_cur_day}) ->
    D_a_t_a = <<V0_is_pop:8, V0_cur_day:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 25309:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(25300, srv, _B0) -> {ok, {}};
unpack(25300, cli, _B0) ->
    {V1_period, _B1} = protocol:uint8(_B0),
    {V1_cur_day, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_lev, _B4} = protocol:uint32(_B3),
    {V1_exp, _B5} = protocol:uint32(_B4),
    {V1_rmb_status, _B6} = protocol:uint8(_B5),
    {V1_exp_status, _B7} = protocol:uint8(_B6),
    {V1_list, _B16} = protocol:array(_B7,
				     fun (_B8) ->
					     {V2_id, _B9} =
						 protocol:uint32(_B8),
					     {V2_type, _B10} =
						 protocol:uint8(_B9),
					     {V2_finish, _B11} =
						 protocol:uint8(_B10),
					     {V2_target_val, _B12} =
						 protocol:uint32(_B11),
					     {V2_value, _B13} =
						 protocol:uint32(_B12),
					     {V2_end_time, _B14} =
						 protocol:uint32(_B13),
					     {{V2_id, V2_type, V2_finish,
					       V2_target_val, V2_value,
					       V2_end_time},
					      _B14}
				     end),
    {ok,
     {V1_period, V1_cur_day, V1_end_time, V1_lev, V1_exp,
      V1_rmb_status, V1_exp_status, V1_list}};
unpack(25301, srv, _B0) -> {ok, {}};
unpack(25301, cli, _B0) ->
    {V1_list, _B9} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_id, _B2} = protocol:uint32(_B1),
					    {V2_type, _B3} =
						protocol:uint8(_B2),
					    {V2_finish, _B4} =
						protocol:uint8(_B3),
					    {V2_target_val, _B5} =
						protocol:uint32(_B4),
					    {V2_value, _B6} =
						protocol:uint32(_B5),
					    {V2_end_time, _B7} =
						protocol:uint32(_B6),
					    {{V2_id, V2_type, V2_finish,
					      V2_target_val, V2_value,
					      V2_end_time},
					     _B7}
				    end),
    {ok, {V1_list}};
unpack(25302, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(25302, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(25303, srv, _B0) -> {ok, {}};
unpack(25303, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_reward_list, _B7} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_id, _B3} =
						       protocol:uint16(_B2),
						   {V2_status, _B4} =
						       protocol:uint8(_B3),
						   {V2_rmb_status, _B5} =
						       protocol:uint8(_B4),
						   {{V2_id, V2_status,
						     V2_rmb_status},
						    _B5}
					   end),
    {ok, {V1_lev, V1_reward_list}};
unpack(25304, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(25304, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(25305, srv, _B0) -> {ok, {}};
unpack(25305, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_exp, _B2} = protocol:uint32(_B1),
    {ok, {V1_lev, V1_exp}};
unpack(25306, srv, _B0) -> {ok, {}};
unpack(25306, cli, _B0) ->
    {V1_rmb_status, _B1} = protocol:uint8(_B0),
    {V1_exp_status, _B2} = protocol:uint8(_B1),
    {V1_list, _B7} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {V2_status, _B5} =
						protocol:uint8(_B4),
					    {{V2_id, V2_status}, _B5}
				    end),
    {ok, {V1_rmb_status, V1_exp_status, V1_list}};
unpack(25307, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(25307, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(25308, srv, _B0) -> {ok, {}};
unpack(25308, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(25309, srv, _B0) -> {ok, {}};
unpack(25309, cli, _B0) ->
    {V1_is_pop, _B1} = protocol:uint8(_B0),
    {V1_cur_day, _B2} = protocol:uint32(_B1),
    {ok, {V1_is_pop, V1_cur_day}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


