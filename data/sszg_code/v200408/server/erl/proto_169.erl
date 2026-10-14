-file("src/proto/proto_169.erl", 1).

-module(proto_169).

-lager_records([]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(16900, cli, {}) -> {ok, <<2:32, 16900:16>>};
pack(16900, srv,
     {V0_lev, V0_exp, V0_day_exp, V0_week_exp}) ->
    D_a_t_a = <<V0_lev:8, V0_exp:32, V0_day_exp:32,
		V0_week_exp:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16900:16,
       D_a_t_a/binary>>};
pack(16901, cli, {}) -> {ok, <<2:32, 16901:16>>};
pack(16901, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_target_val:32, V1_value:32>>
				 || {V1_id, V1_finish, V1_target_val, V1_value}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16901:16,
       D_a_t_a/binary>>};
pack(16902, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_finish:8,
				   V1_target_val:32, V1_value:32>>
				 || {V1_id, V1_finish, V1_target_val, V1_value}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16902:16,
       D_a_t_a/binary>>};
pack(16903, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16903:16,
       D_a_t_a/binary>>};
pack(16903, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16903:16,
       D_a_t_a/binary>>};
pack(16904, cli, {}) -> {ok, <<2:32, 16904:16>>};
pack(16904, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 16904:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(16900, srv, _B0) -> {ok, {}};
unpack(16900, cli, _B0) ->
    {V1_lev, _B1} = protocol:uint8(_B0),
    {V1_exp, _B2} = protocol:uint32(_B1),
    {V1_day_exp, _B3} = protocol:uint32(_B2),
    {V1_week_exp, _B4} = protocol:uint32(_B3),
    {ok, {V1_lev, V1_exp, V1_day_exp, V1_week_exp}};
unpack(16901, srv, _B0) -> {ok, {}};
unpack(16901, cli, _B0) ->
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
unpack(16902, cli, _B0) ->
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
unpack(16903, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(16903, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(16904, srv, _B0) -> {ok, {}};
unpack(16904, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


