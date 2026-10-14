-file("src/proto/proto_215.erl", 1).

-module(proto_215).

-lager_records([{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]}]).

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

-file("src/proto/proto_215.erl", 16).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/proto/proto_215.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(21500, cli, {}) -> {ok, <<2:32, 21500:16>>};
pack(21500, srv, {V0_avatar_frame}) ->
    D_a_t_a = <<(length(V0_avatar_frame)):16,
		(list_to_binary([<<V1_base_id:32, V1_expire_time:32>>
				 || #avatar_frame{base_id = V1_base_id,
						  expire_time = V1_expire_time}
					<- V0_avatar_frame]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21500:16,
       D_a_t_a/binary>>};
pack(21501, cli, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21501:16,
       D_a_t_a/binary>>};
pack(21501, srv, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21501:16,
       D_a_t_a/binary>>};
pack(21502, cli, {}) -> {ok, <<2:32, 21502:16>>};
pack(21502, srv, {V0_avatar_frame}) ->
    D_a_t_a = <<(length(V0_avatar_frame)):16,
		(list_to_binary([<<V1_base_id:32, V1_expire_time:32>>
				 || #avatar_frame{base_id = V1_base_id,
						  expire_time = V1_expire_time}
					<- V0_avatar_frame]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21502:16,
       D_a_t_a/binary>>};
pack(21503, cli, {V0_base_id}) ->
    D_a_t_a = <<V0_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21503:16,
       D_a_t_a/binary>>};
pack(21503, srv, {V0_avatar_frame}) ->
    D_a_t_a = <<(length(V0_avatar_frame)):16,
		(list_to_binary([<<V1_base_id:32, V1_expire_time:32>>
				 || #avatar_frame{base_id = V1_base_id,
						  expire_time = V1_expire_time}
					<- V0_avatar_frame]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21503:16,
       D_a_t_a/binary>>};
pack(21504, cli, {}) -> {ok, <<2:32, 21504:16>>};
pack(21504, srv, {V0_attr}) ->
    D_a_t_a = <<(length(V0_attr)):16,
		(list_to_binary([<<V1_key:8, V1_val:32>>
				 || {V1_key, V1_val} <- V0_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 21504:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(21500, srv, _B0) -> {ok, {}};
unpack(21500, cli, _B0) ->
    {V1_avatar_frame, _B5} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_base_id, _B2} =
							protocol:uint32(_B1),
						    {V2_expire_time, _B3} =
							protocol:uint32(_B2),
						    {{V2_base_id,
						      V2_expire_time},
						     _B3}
					    end),
    {ok, {V1_avatar_frame}};
unpack(21501, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(21501, cli, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(21502, srv, _B0) -> {ok, {}};
unpack(21502, cli, _B0) ->
    {V1_avatar_frame, _B5} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_base_id, _B2} =
							protocol:uint32(_B1),
						    {V2_expire_time, _B3} =
							protocol:uint32(_B2),
						    {{V2_base_id,
						      V2_expire_time},
						     _B3}
					    end),
    {ok, {V1_avatar_frame}};
unpack(21503, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_base_id}};
unpack(21503, cli, _B0) ->
    {V1_avatar_frame, _B5} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_base_id, _B2} =
							protocol:uint32(_B1),
						    {V2_expire_time, _B3} =
							protocol:uint32(_B2),
						    {{V2_base_id,
						      V2_expire_time},
						     _B3}
					    end),
    {ok, {V1_avatar_frame}};
unpack(21504, srv, _B0) -> {ok, {}};
unpack(21504, cli, _B0) ->
    {V1_attr, _B5} = protocol:array(_B0,
				    fun (_B1) ->
					    {V2_key, _B2} = protocol:uint8(_B1),
					    {V2_val, _B3} =
						protocol:uint32(_B2),
					    {{V2_key, V2_val}, _B3}
				    end),
    {ok, {V1_attr}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


