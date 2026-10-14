-file("src/proto/proto_222.erl", 1).

-module(proto_222).

-lager_records([{halidom,
		 [ver, id, lev, exp, lev_num, step, all_attr]},
		{m_halidom, [ver, list]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/halidom.hrl", 1).

-record(m_halidom, {ver = 1, list = []}).

-record(halidom,
	{ver = 1, id = 0, lev = 1, exp = 0, lev_num = 0,
	 step = 0, all_attr = []}).

-file("src/proto/proto_222.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(22200, cli, {}) -> {ok, <<2:32, 22200:16>>};
pack(22200, srv, {V0_list}) ->
    D_a_t_a = <<(length(V0_list)):16,
		(list_to_binary([<<V1_id:8, V1_lev:8, V1_exp:32,
				   V1_step:8, (length(V1_all_attr)):16,
				   (list_to_binary([<<V2_name:8, V2_val:32>>
						    || {V2_name, V2_val}
							   <- V1_all_attr]))/binary>>
				 || {V1_id, V1_lev, V1_exp, V1_step,
				     V1_all_attr}
					<- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22200:16,
       D_a_t_a/binary>>};
pack(22201, srv,
     {V0_id, V0_lev, V0_exp, V0_step, V0_all_attr}) ->
    D_a_t_a = <<V0_id:8, V0_lev:8, V0_exp:32, V0_step:8,
		(length(V0_all_attr)):16,
		(list_to_binary([<<V1_name:8, V1_val:32>>
				 || {V1_name, V1_val}
					<- V0_all_attr]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22201:16,
       D_a_t_a/binary>>};
pack(22202, cli, {V0_id, V0_list}) ->
    D_a_t_a = <<V0_id:8, (length(V0_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22202:16,
       D_a_t_a/binary>>};
pack(22202, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22202:16,
       D_a_t_a/binary>>};
pack(22203, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22203:16,
       D_a_t_a/binary>>};
pack(22203, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22203:16,
       D_a_t_a/binary>>};
pack(22204, cli, {V0_id, V0_list1, V0_list2}) ->
    D_a_t_a = <<V0_id:8, (length(V0_list1)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_list1]))/binary,
		(length(V0_list2)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_list2]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22204:16,
       D_a_t_a/binary>>};
pack(22204, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22204:16,
       D_a_t_a/binary>>};
pack(22205, srv, {V0_id}) ->
    D_a_t_a = <<V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 22205:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(22200, srv, _B0) -> {ok, {}};
unpack(22200, cli, _B0) ->
    {V1_list, _B12} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} = protocol:uint8(_B1),
					     {V2_lev, _B3} =
						 protocol:uint8(_B2),
					     {V2_exp, _B4} =
						 protocol:uint32(_B3),
					     {V2_step, _B5} =
						 protocol:uint8(_B4),
					     {V2_all_attr, _B10} =
						 protocol:array(_B5,
								fun (_B6) ->
									{V3_name,
									 _B7} =
									    protocol:uint8(_B6),
									{V3_val,
									 _B8} =
									    protocol:uint32(_B7),
									{{V3_name,
									  V3_val},
									 _B8}
								end),
					     {{V2_id, V2_lev, V2_exp, V2_step,
					       V2_all_attr},
					      _B10}
				     end),
    {ok, {V1_list}};
unpack(22201, cli, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_lev, _B2} = protocol:uint8(_B1),
    {V1_exp, _B3} = protocol:uint32(_B2),
    {V1_step, _B4} = protocol:uint8(_B3),
    {V1_all_attr, _B9} = protocol:array(_B4,
					fun (_B5) ->
						{V2_name, _B6} =
						    protocol:uint8(_B5),
						{V2_val, _B7} =
						    protocol:uint32(_B6),
						{{V2_name, V2_val}, _B7}
					end),
    {ok, {V1_id, V1_lev, V1_exp, V1_step, V1_all_attr}};
unpack(22202, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_list, _B5} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_id, _B3} = protocol:uint32(_B2),
					    {V2_id, _B3}
				    end),
    {ok, {V1_id, V1_list}};
unpack(22202, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(22203, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(22203, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(22204, srv, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0),
    {V1_list1, _B5} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_id, _B3} =
						 protocol:uint32(_B2),
					     {V2_id, _B3}
				     end),
    {V1_list2, _B9} = protocol:array(_B5,
				     fun (_B6) ->
					     {V2_id, _B7} =
						 protocol:uint32(_B6),
					     {V2_id, _B7}
				     end),
    {ok, {V1_id, V1_list1, V1_list2}};
unpack(22204, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint8(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(22205, cli, _B0) ->
    {V1_id, _B1} = protocol:uint8(_B0), {ok, {V1_id}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


