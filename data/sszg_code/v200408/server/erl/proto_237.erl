-file("src/proto/proto_237.erl", 1).

-module(proto_237).

-lager_records([{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]}]).

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

-file("src/proto/proto_237.erl", 16).

-file("inc/guild_skill.hrl", 1).

-record(m_guild_skill,
	{ver = 2  :: pos_integer(), groups = []  :: list(),
	 break_groups = []  :: list()}).

-record(guild_skill_group,
	{ver = 1, career = 0, group_id = 0, skill_ids = [],
	 group_ids = []}).

-record(guild_skill_break_group,
	{ver = 1  :: pos_integer(),
	 career = 0  :: pos_integer(),
	 attr_formation = []  :: list(),
	 skill_formation = {0, 0}  :: tuple(),
	 ext = []  :: list()}).

-file("src/proto/proto_237.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(23700, cli, {V0_career}) ->
    D_a_t_a = <<V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23700:16,
       D_a_t_a/binary>>};
pack(23700, srv,
     {#guild_skill_group{career = V0_career,
			 group_id = V0_group_id, skill_ids = V0_skill_ids,
			 group_ids = V0_group_ids}}) ->
    D_a_t_a = <<V0_career:8, V0_group_id:32,
		(length(V0_skill_ids)):16,
		(list_to_binary([<<V1_skill_id:32>>
				 || V1_skill_id <- V0_skill_ids]))/binary,
		(length(V0_group_ids)):16,
		(list_to_binary([<<V1_group_id:32>>
				 || V1_group_id <- V0_group_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23700:16,
       D_a_t_a/binary>>};
pack(23701, cli, {V0_skill_id}) ->
    D_a_t_a = <<V0_skill_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23701:16,
       D_a_t_a/binary>>};
pack(23701, srv,
     {V0_code, V0_msg, V0_career, V0_skill_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_career:8,
		V0_skill_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23701:16,
       D_a_t_a/binary>>};
pack(23702, cli, {}) -> {ok, <<2:32, 23702:16>>};
pack(23702, srv, {V0_career, V0_group_id}) ->
    D_a_t_a = <<V0_career:8, V0_group_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23702:16,
       D_a_t_a/binary>>};
pack(23703, cli, {}) -> {ok, <<2:32, 23703:16>>};
pack(23703, srv, {V0_outline}) ->
    D_a_t_a = <<(length(V0_outline)):16,
		(list_to_binary([<<V1_career:8, V1_skill_id:32>>
				 || {V1_career, V1_skill_id}
					<- V0_outline]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23703:16,
       D_a_t_a/binary>>};
pack(23704, cli, {V0_career}) ->
    D_a_t_a = <<V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23704:16,
       D_a_t_a/binary>>};
pack(23704, srv, {V0_is_first, V0_gold, V0_list}) ->
    D_a_t_a = <<V0_is_first:8, V0_gold:32,
		(length(V0_list)):16,
		(list_to_binary([<<V1_id:32, V1_num:32>>
				 || {V1_id, V1_num} <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23704:16,
       D_a_t_a/binary>>};
pack(23705, cli, {V0_career}) ->
    D_a_t_a = <<V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23705:16,
       D_a_t_a/binary>>};
pack(23705, srv, {V0_code, V0_msg, V0_career}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23705:16,
       D_a_t_a/binary>>};
pack(23706, cli, {V0_career}) ->
    D_a_t_a = <<V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23706:16,
       D_a_t_a/binary>>};
pack(23706, srv, {V0_flag, V0_msg, V0_career}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23706:16,
       D_a_t_a/binary>>};
pack(23707, cli, {V0_career, V0_id}) ->
    D_a_t_a = <<V0_career:8, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23707:16,
       D_a_t_a/binary>>};
pack(23707, srv, {V0_flag, V0_msg, V0_career}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23707:16,
       D_a_t_a/binary>>};
pack(23708, cli, {V0_career}) ->
    D_a_t_a = <<V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23708:16,
       D_a_t_a/binary>>};
pack(23708, srv, {V0_flag, V0_msg, V0_career}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23708:16,
       D_a_t_a/binary>>};
pack(23709, cli, {V0_career}) ->
    D_a_t_a = <<V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23709:16,
       D_a_t_a/binary>>};
pack(23709, srv, {V0_flag, V0_msg, V0_career}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23709:16,
       D_a_t_a/binary>>};
pack(23710, cli, {V0_career}) ->
    D_a_t_a = <<V0_career:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23710:16,
       D_a_t_a/binary>>};
pack(23710, srv,
     {V0_attr_formation, {V0_skill_id, V0_skill_lev},
      V0_career, V0_is_first}) ->
    D_a_t_a = <<(length(V0_attr_formation)):16,
		(list_to_binary([<<V1_id:32, V1_lev:32>>
				 || {V1_id, V1_lev}
					<- V0_attr_formation]))/binary,
		V0_skill_id:32, V0_skill_lev:32, V0_career:8,
		V0_is_first:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23710:16,
       D_a_t_a/binary>>};
pack(23711, cli, {}) -> {ok, <<2:32, 23711:16>>};
pack(23711, srv,
     {V0_guild_skill_break_group, V0_is_first}) ->
    D_a_t_a = <<(length(V0_guild_skill_break_group)):16,
		(list_to_binary([<<V1_career:8,
				   (length(V1_attr_formation)):16,
				   (list_to_binary([<<V2_id:32, V2_lev:32>>
						    || {V2_id, V2_lev}
							   <- V1_attr_formation]))/binary,
				   V1_skill_id:32, V1_skill_lev:32>>
				 || #guild_skill_break_group{career = V1_career,
							     attr_formation =
								 V1_attr_formation,
							     skill_formation =
								 {V1_skill_id,
								  V1_skill_lev}}
					<- V0_guild_skill_break_group]))/binary,
		V0_is_first:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23711:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(23700, srv, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {ok, {V1_career}};
unpack(23700, cli, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {V1_group_id, _B2} = protocol:uint32(_B1),
    {V1_skill_ids, _B6} = protocol:array(_B2,
					 fun (_B3) ->
						 {V2_skill_id, _B4} =
						     protocol:uint32(_B3),
						 {V2_skill_id, _B4}
					 end),
    {V1_group_ids, _B10} = protocol:array(_B6,
					  fun (_B7) ->
						  {V2_group_id, _B8} =
						      protocol:uint32(_B7),
						  {V2_group_id, _B8}
					  end),
    {ok,
     {V1_career, V1_group_id, V1_skill_ids, V1_group_ids}};
unpack(23701, srv, _B0) ->
    {V1_skill_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_skill_id}};
unpack(23701, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_career, _B3} = protocol:uint8(_B2),
    {V1_skill_id, _B4} = protocol:uint32(_B3),
    {ok, {V1_code, V1_msg, V1_career, V1_skill_id}};
unpack(23702, srv, _B0) -> {ok, {}};
unpack(23702, cli, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {V1_group_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_career, V1_group_id}};
unpack(23703, srv, _B0) -> {ok, {}};
unpack(23703, cli, _B0) ->
    {V1_outline, _B5} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_career, _B2} =
						   protocol:uint8(_B1),
					       {V2_skill_id, _B3} =
						   protocol:uint32(_B2),
					       {{V2_career, V2_skill_id}, _B3}
				       end),
    {ok, {V1_outline}};
unpack(23704, srv, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {ok, {V1_career}};
unpack(23704, cli, _B0) ->
    {V1_is_first, _B1} = protocol:uint8(_B0),
    {V1_gold, _B2} = protocol:uint32(_B1),
    {V1_list, _B7} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_id, _B4} = protocol:uint32(_B3),
					    {V2_num, _B5} =
						protocol:uint32(_B4),
					    {{V2_id, V2_num}, _B5}
				    end),
    {ok, {V1_is_first, V1_gold, V1_list}};
unpack(23705, srv, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {ok, {V1_career}};
unpack(23705, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_career, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_career}};
unpack(23706, srv, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {ok, {V1_career}};
unpack(23706, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_career, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_career}};
unpack(23707, srv, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {ok, {V1_career, V1_id}};
unpack(23707, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_career, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_career}};
unpack(23708, srv, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {ok, {V1_career}};
unpack(23708, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_career, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_career}};
unpack(23709, srv, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {ok, {V1_career}};
unpack(23709, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_career, _B3} = protocol:uint8(_B2),
    {ok, {V1_flag, V1_msg, V1_career}};
unpack(23710, srv, _B0) ->
    {V1_career, _B1} = protocol:uint8(_B0),
    {ok, {V1_career}};
unpack(23710, cli, _B0) ->
    {V1_attr_formation, _B5} = protocol:array(_B0,
					      fun (_B1) ->
						      {V2_id, _B2} =
							  protocol:uint32(_B1),
						      {V2_lev, _B3} =
							  protocol:uint32(_B2),
						      {{V2_id, V2_lev}, _B3}
					      end),
    {V1_skill_id, _B6} = protocol:uint32(_B5),
    {V1_skill_lev, _B7} = protocol:uint32(_B6),
    {V1_career, _B8} = protocol:uint8(_B7),
    {V1_is_first, _B9} = protocol:uint8(_B8),
    {ok,
     {V1_attr_formation, V1_skill_id, V1_skill_lev,
      V1_career, V1_is_first}};
unpack(23711, srv, _B0) -> {ok, {}};
unpack(23711, cli, _B0) ->
    {V1_guild_skill_break_group, _B11} = protocol:array(_B0,
							fun (_B1) ->
								{V2_career,
								 _B2} =
								    protocol:uint8(_B1),
								{V2_attr_formation,
								 _B7} =
								    protocol:array(_B2,
										   fun
										     (_B3) ->
											 {V3_id,
											  _B4} =
											     protocol:uint32(_B3),
											 {V3_lev,
											  _B5} =
											     protocol:uint32(_B4),
											 {{V3_id,
											   V3_lev},
											  _B5}
										   end),
								{V2_skill_id,
								 _B8} =
								    protocol:uint32(_B7),
								{V2_skill_lev,
								 _B9} =
								    protocol:uint32(_B8),
								{{V2_career,
								  V2_attr_formation,
								  V2_skill_id,
								  V2_skill_lev},
								 _B9}
							end),
    {V1_is_first, _B12} = protocol:uint8(_B11),
    {ok, {V1_guild_skill_break_group, V1_is_first}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


