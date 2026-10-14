-file("src/proto/proto_287.erl", 1).

-module(proto_287).

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

-file("src/proto/proto_287.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(28700, cli, {}) -> {ok, <<2:32, 28700:16>>};
pack(28700, srv,
     {V0_period, V0_cur_day, V0_end_time, V0_lev, V0_exp,
      V0_period_lev, V0_day_lev, V0_week_lev, V0_rmb_status,
      V0_list}) ->
    D_a_t_a = <<V0_period:8, V0_cur_day:32, V0_end_time:32,
		V0_lev:32, V0_exp:32, V0_period_lev:32, V0_day_lev:32,
		V0_week_lev:32, V0_rmb_status:8, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_type:8, V1_finish:8,
				   V1_target_val:32, V1_value:32,
				   V1_end_time:32>>
				 || {V1_id, V1_type, V1_finish, V1_target_val,
				     V1_value, V1_end_time}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28700:16,
       D_a_t_a/binary>>};
pack(28701, cli, {}) -> {ok, <<2:32, 28701:16>>};
pack(28701, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_type:8, V1_finish:8,
				   V1_target_val:32, V1_value:32,
				   V1_end_time:32>>
				 || {V1_id, V1_type, V1_finish, V1_target_val,
				     V1_value, V1_end_time}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28701:16,
       D_a_t_a/binary>>};
pack(28702, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28702:16,
       D_a_t_a/binary>>};
pack(28702, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28702:16,
       D_a_t_a/binary>>};
pack(28703, cli, {}) -> {ok, <<2:32, 28703:16>>};
pack(28703, srv, {V0_lev, V0_reward_list}) ->
    D_a_t_a = <<V0_lev:32, (length(V0_reward_list)):16,
		(list_to_binary([<<V1_id:16, V1_status:8,
				   V1_rmb_status:8>>
				 || {V1_id, V1_status, V1_rmb_status}
					<- V0_reward_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28703:16,
       D_a_t_a/binary>>};
pack(28704, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28704:16,
       D_a_t_a/binary>>};
pack(28704, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28704:16,
       D_a_t_a/binary>>};
pack(28705, cli, {}) -> {ok, <<2:32, 28705:16>>};
pack(28705, srv, {V0_lev, V0_exp}) ->
    D_a_t_a = <<V0_lev:32, V0_exp:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28705:16,
       D_a_t_a/binary>>};
pack(28706, cli, {}) -> {ok, <<2:32, 28706:16>>};
pack(28706, srv, {V0_rmb_status, V0_list}) ->
    D_a_t_a = <<V0_rmb_status:8, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_status:8>>
				 || {V1_id, V1_status} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28706:16,
       D_a_t_a/binary>>};
pack(28707, cli, {}) -> {ok, <<2:32, 28707:16>>};
pack(28707, srv, {V0_is_pop, V0_cur_day}) ->
    D_a_t_a = <<V0_is_pop:8, V0_cur_day:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28707:16,
       D_a_t_a/binary>>};
pack(28708, cli, {}) -> {ok, <<2:32, 28708:16>>};
pack(28708, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 28708:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(28700, srv, _B0) -> {ok, {}};
unpack(28700, cli, _B0) ->
    {V1_period, _B1} = protocol:uint8(_B0),
    {V1_cur_day, _B2} = protocol:uint32(_B1),
    {V1_end_time, _B3} = protocol:uint32(_B2),
    {V1_lev, _B4} = protocol:uint32(_B3),
    {V1_exp, _B5} = protocol:uint32(_B4),
    {V1_period_lev, _B6} = protocol:uint32(_B5),
    {V1_day_lev, _B7} = protocol:uint32(_B6),
    {V1_week_lev, _B8} = protocol:uint32(_B7),
    {V1_rmb_status, _B9} = protocol:uint8(_B8),
    {V1_list, _B18} = protocol:array(_B9,
				     fun (_B10) ->
					     {V2_id, _B11} =
						 protocol:uint32(_B10),
					     {V2_type, _B12} =
						 protocol:uint8(_B11),
					     {V2_finish, _B13} =
						 protocol:uint8(_B12),
					     {V2_target_val, _B14} =
						 protocol:uint32(_B13),
					     {V2_value, _B15} =
						 protocol:uint32(_B14),
					     {V2_end_time, _B16} =
						 protocol:uint32(_B15),
					     {{V2_id, V2_type, V2_finish,
					       V2_target_val, V2_value,
					       V2_end_time},
					      _B16}
				     end),
    {ok,
     {V1_period, V1_cur_day, V1_end_time, V1_lev, V1_exp,
      V1_period_lev, V1_day_lev, V1_week_lev, V1_rmb_status,
      V1_list}};
unpack(28701, srv, _B0) -> {ok, {}};
unpack(28701, cli, _B0) ->
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
unpack(28702, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(28702, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(28703, srv, _B0) -> {ok, {}};
unpack(28703, cli, _B0) ->
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
unpack(28704, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(28704, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(28705, srv, _B0) -> {ok, {}};
unpack(28705, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint32(_B0),
    {V1_exp, _B2} = protocol:uint32(_B1),
    {ok, {V1_lev, V1_exp}};
unpack(28706, srv, _B0) -> {ok, {}};
unpack(28706, cli, _B0) ->
    {V1_rmb_status, _B1} = protocol:uint8(_B0),
    {V1_list, _B6} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_id, _B3} = protocol:uint32(_B2),
					    {V2_status, _B4} =
						protocol:uint8(_B3),
					    {{V2_id, V2_status}, _B4}
				    end),
    {ok, {V1_rmb_status, V1_list}};
unpack(28707, srv, _B0) -> {ok, {}};
unpack(28707, cli, _B0) ->
    {V1_is_pop, _B1} = protocol:uint8(_B0),
    {V1_cur_day, _B2} = protocol:uint32(_B1),
    {ok, {V1_is_pop, V1_cur_day}};
unpack(28708, srv, _B0) -> {ok, {}};
unpack(28708, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


