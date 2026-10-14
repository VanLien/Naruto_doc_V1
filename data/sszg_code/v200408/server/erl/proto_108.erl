-file("src/proto/proto_108.erl", 1).

-module(proto_108).

-lager_records([{item_make_args,
		 [base_id, bind, quantity, step, flag]},
		{item,
		 [ver, id, base_id, bind, look_id, type, quality, craft,
		  step, quantity, pos, expire_type, expire_time, enchant,
		  fail_enchant, attr, main_attr, extra_attr, score,
		  all_score, extra, data, price, set_id, career,
		  gemstones, star_lev, break_count, holy_eqm_attr]},
		{item_base,
		 [id, name, type, quality, overlap, use_type, gain_type,
		  expire_type, expire_time, condition, effect, attr,
		  value, lev, career, sex, ext, attr_type, eqm_jie,
		  add_num, can_share, eqm_set, use_count]},
		{role_feedback_info,
		 [role_id, id, state, status2, start_time, end_msg_time,
		  finish_time, score_time, title, content,
		  questions_lists, answer_lists, score]},
		{feedback,
		 [sess, rid, feedback_id, status, score, send_time,
		  time_out]},
		{gmail,
		 [id, type, mail_type, subject, content, assets, items,
		  start_time, end_time, conds, source, can_del]},
		{mail,
		 [sess, to, to_name, from, from_name, type, group_id,
		  status, subject, content, assets, items, source, rev_ts,
		  read_time, send_time, time_out, can_del]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/mail.hrl", 1).

-record(mail,
	{sess  :: {pos_integer(), bitstring()},
	 to  :: {pos_integer(), bitstring()},
	 to_name = <<>>  :: bitstring(),
	 from  :: {non_neg_integer(), bitstring()},
	 from_name = <<>>  :: bitstring(), type = 1  :: 0..1,
	 group_id = 0  :: non_neg_integer(), status = 0  :: 0..1,
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 source = <<>>  :: pos_integer(),
	 rev_ts = 0  :: pos_integer(),
	 read_time = 0  :: pos_integer(),
	 send_time = 0  :: pos_integer(),
	 time_out = 0  :: pos_integer(), can_del = 1  :: 0..1}).

-record(gmail,
	{id = 0, type = 0  :: non_neg_integer(),
	 mail_type = 1  :: non_neg_integer(),
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 conds = []  :: list(), source = <<>>  :: pos_integer(),
	 can_del = 1  :: 0..1}).

-record(feedback,
	{sess, rid, feedback_id = 0, status = 0, score = 0,
	 send_time = 0, time_out = 0}).

-record(role_feedback_info,
	{role_id, id = 0, state = 0, status2 = 0,
	 start_time = 0, end_msg_time = 0, finish_time = 0,
	 score_time = 0, title = <<>>, content = <<>>,
	 questions_lists = [], answer_lists = [], score = 0}).

-file("src/proto/proto_108.erl", 16).

-file("inc/item.hrl", 1).

-record(item_base,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 type = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 overlap = 1  :: pos_integer(), use_type = 0  :: 0..4,
	 gain_type = 0  :: non_neg_integer(),
	 expire_type = 0  :: non_neg_integer(),
	 expire_time = 0  ::
	     non_neg_integer() |
	     {{pos_integer(), pos_integer(), pos_integer()},
	      {non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}},
	 condition = []  :: [tuple()], effect = []  :: [tuple()],
	 attr = []  :: [tuple()], value = []  :: [tuple()],
	 lev = 0, career = 0, sex = 2, ext = [],
	 attr_type = 1  :: pos_integer(), eqm_jie = 0,
	 add_num = 0, can_share = 0, eqm_set = 0,
	 use_count = 0}).

-record(item,
	{ver = 3  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(), bind = 1  :: 0 | 1,
	 look_id = 0, type = 0  :: non_neg_integer(),
	 quality = 0  :: 0..4, craft = 0  :: 0..5,
	 step = 0  :: pos_integer(), quantity = 1  :: 0..250,
	 pos = 0  :: non_neg_integer(), expire_type = 0  :: 0..4,
	 expire_time = 0  :: non_neg_integer(),
	 enchant = 0  :: integer(),
	 fail_enchant = 0  :: non_neg_integer(),
	 attr = []  :: [tuple()], main_attr = [],
	 extra_attr = [], score = 0, all_score = 0,
	 extra = []  :: [tuple()], data = []  :: [any()],
	 price = 0, set_id = 0  :: pos_integer(),
	 career = 0  :: pos_integer(), gemstones = []  :: list(),
	 star_lev = 0  :: pos_integer(),
	 break_count = 0  :: pos_integer(), holy_eqm_attr = []}).

-record(item_make_args,
	{base_id = 0, bind = 0, quantity = 0, step = 0,
	 flag = default_iflag}).

-file("src/proto/proto_108.erl", 17).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(10800, cli, {}) -> {ok, <<2:32, 10800:16>>};
pack(10800, srv, {V0_mail}) ->
    D_a_t_a = <<(length(V0_mail)):16,
		(list_to_binary([<<V1_id:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_type:8,
				   (protocol:pack(string, V1_from_name))/binary,
				   (protocol:pack(string, V1_subject))/binary,
				   V1_send_time:32, V1_read_time:32,
				   V1_time_out:32, V1_status:8, V1_has_items:8>>
				 || {#mail{sess = {V1_id, V1_srv_id},
					   type = V1_type,
					   from_name = V1_from_name,
					   subject = V1_subject,
					   send_time = V1_send_time,
					   read_time = V1_read_time,
					   time_out = V1_time_out,
					   status = V1_status},
				     V1_has_items}
					<- V0_mail]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10800:16,
       D_a_t_a/binary>>};
pack(10801, cli, {V0_id, V0_srv_id}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10801:16,
       D_a_t_a/binary>>};
pack(10801, srv, {V0_id, V0_srv_id, V0_code, V0_msg}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10801:16,
       D_a_t_a/binary>>};
pack(10802, cli, {}) -> {ok, <<2:32, 10802:16>>};
pack(10802, srv, {V0_ids, V0_msg}) ->
    D_a_t_a = <<(length(V0_ids)):16,
		(list_to_binary([<<V1_id:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_read_time:32>>
				 || {V1_id, V1_srv_id, V1_read_time}
					<- V0_ids]))/binary,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10802:16,
       D_a_t_a/binary>>};
pack(10803, srv, {V0_mail}) ->
    D_a_t_a = <<(length(V0_mail)):16,
		(list_to_binary([<<V1_id:32,
				   (protocol:pack(string, V1_srv_id))/binary,
				   V1_type:8,
				   (protocol:pack(string, V1_from_name))/binary,
				   (protocol:pack(string, V1_subject))/binary,
				   V1_send_time:32, V1_read_time:32,
				   V1_time_out:32, V1_status:8, V1_has_items:8>>
				 || {#mail{sess = {V1_id, V1_srv_id},
					   type = V1_type,
					   from_name = V1_from_name,
					   subject = V1_subject,
					   send_time = V1_send_time,
					   read_time = V1_read_time,
					   time_out = V1_time_out,
					   status = V1_status},
				     V1_has_items}
					<- V0_mail]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10803:16,
       D_a_t_a/binary>>};
pack(10804, cli, {V0_ids}) ->
    D_a_t_a = <<(length(V0_ids)):16,
		(list_to_binary([<<V1_id:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_id, V1_srv_id} <- V0_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10804:16,
       D_a_t_a/binary>>};
pack(10804, srv, {V0_ids, V0_msg}) ->
    D_a_t_a = <<(length(V0_ids)):16,
		(list_to_binary([<<V1_id:32,
				   (protocol:pack(string, V1_srv_id))/binary>>
				 || {V1_id, V1_srv_id} <- V0_ids]))/binary,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10804:16,
       D_a_t_a/binary>>};
pack(10805, cli, {V0_id, V0_srv_id}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10805:16,
       D_a_t_a/binary>>};
pack(10805, srv,
     {V0_id, V0_srv_id, V0_code, V0_msg, V0_read_time,
      V0_is_delete}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_read_time:32,
		V0_is_delete:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10805:16,
       D_a_t_a/binary>>};
pack(10806, cli, {V0_id, V0_srv_id}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10806:16,
       D_a_t_a/binary>>};
pack(10806, srv,
     {#mail{sess = {V0_id, V0_srv_id}, type = V0_type,
	    from_name = V0_from_name, subject = V0_subject,
	    content = V0_content, assets = V0_assets,
	    items = V0_items, send_time = V0_send_time,
	    read_time = V0_read_time, time_out = V0_time_out,
	    status = V0_status}}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_type:8,
		(protocol:pack(string, V0_from_name))/binary,
		(protocol:pack(string, V0_subject))/binary,
		(protocol:pack(string, V0_content))/binary,
		(length(V0_assets)):16,
		(list_to_binary([<<V1_label:8, V1_val:32>>
				 || {V1_label, V1_val} <- V0_assets]))/binary,
		(length(V0_items)):16,
		(list_to_binary([<<V1_base_id:32, V1_quantity:32>>
				 || #item{base_id = V1_base_id,
					  quantity = V1_quantity}
					<- V0_items]))/binary,
		V0_send_time:32, V0_read_time:32, V0_time_out:32,
		V0_status:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10806:16,
       D_a_t_a/binary>>};
pack(10810, cli,
     {V0_issue_type, V0_title, V0_content, V0_phone,
      V0_email, V0_phone_info, V0_id}) ->
    D_a_t_a = <<V0_issue_type:8,
		(protocol:pack(string, V0_title))/binary,
		(protocol:pack(string, V0_content))/binary,
		(protocol:pack(string, V0_phone))/binary,
		(protocol:pack(string, V0_email))/binary,
		(protocol:pack(string, V0_phone_info))/binary,
		V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10810:16,
       D_a_t_a/binary>>};
pack(10810, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10810:16,
       D_a_t_a/binary>>};
pack(10811, cli, {V0_id, V0_score}) ->
    D_a_t_a = <<V0_id:32, V0_score:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10811:16,
       D_a_t_a/binary>>};
pack(10811, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10811:16,
       D_a_t_a/binary>>};
pack(10813, cli, {}) -> {ok, <<2:32, 10813:16>>};
pack(10813, srv, {V0_feedback_logs}) ->
    D_a_t_a = <<(length(V0_feedback_logs)):16,
		(list_to_binary([<<V1_id:32,
				   (protocol:pack(string, V1_title))/binary,
				   (protocol:pack(string, V1_content))/binary,
				   V1_state:8, V1_status2:8, V1_end_msg_time:32,
				   V1_start_time:32, V1_finish_time:32,
				   V1_score_time:32>>
				 || #role_feedback_info{id = V1_id,
							title = V1_title,
							content = V1_content,
							state = V1_state,
							status2 = V1_status2,
							end_msg_time =
							    V1_end_msg_time,
							start_time =
							    V1_start_time,
							finish_time =
							    V1_finish_time,
							score_time =
							    V1_score_time}
					<- V0_feedback_logs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10813:16,
       D_a_t_a/binary>>};
pack(10814, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10814:16,
       D_a_t_a/binary>>};
pack(10814, srv,
     {#role_feedback_info{id = V0_id, title = V0_title,
			  content = V0_content, state = V0_state,
			  status2 = V0_status2, end_msg_time = V0_end_msg_time,
			  start_time = V0_start_time,
			  finish_time = V0_finish_time,
			  score_time = V0_score_time,
			  questions_lists = V0_questions_lists,
			  answer_lists = V0_answer_lists}}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_title))/binary,
		(protocol:pack(string, V0_content))/binary, V0_state:8,
		V0_status2:8, V0_end_msg_time:32, V0_start_time:32,
		V0_finish_time:32, V0_score_time:32,
		(length(V0_questions_lists)):16,
		(list_to_binary([<<V1_questions_timer:32,
				   (protocol:pack(string,
						  V1_questions_content))/binary>>
				 || {V1_questions_timer, V1_questions_content}
					<- V0_questions_lists]))/binary,
		(length(V0_answer_lists)):16,
		(list_to_binary([<<V1_answer_timer:32,
				   (protocol:pack(string,
						  V1_answer_content))/binary>>
				 || {V1_answer_timer, V1_answer_content}
					<- V0_answer_lists]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10814:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(10800, srv, _B0) -> {ok, {}};
unpack(10800, cli, _B0) ->
    {V1_mail, _B13} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_type, _B4} =
						 protocol:uint8(_B3),
					     {V2_from_name, _B5} =
						 protocol:string(_B4),
					     {V2_subject, _B6} =
						 protocol:string(_B5),
					     {V2_send_time, _B7} =
						 protocol:uint32(_B6),
					     {V2_read_time, _B8} =
						 protocol:uint32(_B7),
					     {V2_time_out, _B9} =
						 protocol:uint32(_B8),
					     {V2_status, _B10} =
						 protocol:uint8(_B9),
					     {V2_has_items, _B11} =
						 protocol:uint8(_B10),
					     {{V2_id, V2_srv_id, V2_type,
					       V2_from_name, V2_subject,
					       V2_send_time, V2_read_time,
					       V2_time_out, V2_status,
					       V2_has_items},
					      _B11}
				     end),
    {ok, {V1_mail}};
unpack(10801, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_srv_id}};
unpack(10801, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_code, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_srv_id, V1_code, V1_msg}};
unpack(10802, srv, _B0) -> {ok, {}};
unpack(10802, cli, _B0) ->
    {V1_ids, _B6} = protocol:array(_B0,
				   fun (_B1) ->
					   {V2_id, _B2} = protocol:uint32(_B1),
					   {V2_srv_id, _B3} =
					       protocol:string(_B2),
					   {V2_read_time, _B4} =
					       protocol:uint32(_B3),
					   {{V2_id, V2_srv_id, V2_read_time},
					    _B4}
				   end),
    {V1_msg, _B7} = protocol:string(_B6),
    {ok, {V1_ids, V1_msg}};
unpack(10803, cli, _B0) ->
    {V1_mail, _B13} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_srv_id, _B3} =
						 protocol:string(_B2),
					     {V2_type, _B4} =
						 protocol:uint8(_B3),
					     {V2_from_name, _B5} =
						 protocol:string(_B4),
					     {V2_subject, _B6} =
						 protocol:string(_B5),
					     {V2_send_time, _B7} =
						 protocol:uint32(_B6),
					     {V2_read_time, _B8} =
						 protocol:uint32(_B7),
					     {V2_time_out, _B9} =
						 protocol:uint32(_B8),
					     {V2_status, _B10} =
						 protocol:uint8(_B9),
					     {V2_has_items, _B11} =
						 protocol:uint8(_B10),
					     {{V2_id, V2_srv_id, V2_type,
					       V2_from_name, V2_subject,
					       V2_send_time, V2_read_time,
					       V2_time_out, V2_status,
					       V2_has_items},
					      _B11}
				     end),
    {ok, {V1_mail}};
unpack(10804, srv, _B0) ->
    {V1_ids, _B5} = protocol:array(_B0,
				   fun (_B1) ->
					   {V2_id, _B2} = protocol:uint32(_B1),
					   {V2_srv_id, _B3} =
					       protocol:string(_B2),
					   {{V2_id, V2_srv_id}, _B3}
				   end),
    {ok, {V1_ids}};
unpack(10804, cli, _B0) ->
    {V1_ids, _B5} = protocol:array(_B0,
				   fun (_B1) ->
					   {V2_id, _B2} = protocol:uint32(_B1),
					   {V2_srv_id, _B3} =
					       protocol:string(_B2),
					   {{V2_id, V2_srv_id}, _B3}
				   end),
    {V1_msg, _B6} = protocol:string(_B5),
    {ok, {V1_ids, V1_msg}};
unpack(10805, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_srv_id}};
unpack(10805, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_code, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {V1_read_time, _B5} = protocol:uint32(_B4),
    {V1_is_delete, _B6} = protocol:uint8(_B5),
    {ok,
     {V1_id, V1_srv_id, V1_code, V1_msg, V1_read_time,
      V1_is_delete}};
unpack(10806, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_srv_id}};
unpack(10806, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_from_name, _B4} = protocol:string(_B3),
    {V1_subject, _B5} = protocol:string(_B4),
    {V1_content, _B6} = protocol:string(_B5),
    {V1_assets, _B11} = protocol:array(_B6,
				       fun (_B7) ->
					       {V2_label, _B8} =
						   protocol:uint8(_B7),
					       {V2_val, _B9} =
						   protocol:uint32(_B8),
					       {{V2_label, V2_val}, _B9}
				       end),
    {V1_items, _B16} = protocol:array(_B11,
				      fun (_B12) ->
					      {V2_base_id, _B13} =
						  protocol:uint32(_B12),
					      {V2_quantity, _B14} =
						  protocol:uint32(_B13),
					      {{V2_base_id, V2_quantity}, _B14}
				      end),
    {V1_send_time, _B17} = protocol:uint32(_B16),
    {V1_read_time, _B18} = protocol:uint32(_B17),
    {V1_time_out, _B19} = protocol:uint32(_B18),
    {V1_status, _B20} = protocol:uint8(_B19),
    {ok,
     {V1_id, V1_srv_id, V1_type, V1_from_name, V1_subject,
      V1_content, V1_assets, V1_items, V1_send_time,
      V1_read_time, V1_time_out, V1_status}};
unpack(10810, srv, _B0) ->
    {V1_issue_type, _B1} = protocol:uint8(_B0),
    {V1_title, _B2} = protocol:string(_B1),
    {V1_content, _B3} = protocol:string(_B2),
    {V1_phone, _B4} = protocol:string(_B3),
    {V1_email, _B5} = protocol:string(_B4),
    {V1_phone_info, _B6} = protocol:string(_B5),
    {V1_id, _B7} = protocol:uint32(_B6),
    {ok,
     {V1_issue_type, V1_title, V1_content, V1_phone,
      V1_email, V1_phone_info, V1_id}};
unpack(10810, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(10811, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_score, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_score}};
unpack(10811, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(10813, srv, _B0) -> {ok, {}};
unpack(10813, cli, _B0) ->
    {V1_feedback_logs, _B12} = protocol:array(_B0,
					      fun (_B1) ->
						      {V2_id, _B2} =
							  protocol:uint32(_B1),
						      {V2_title, _B3} =
							  protocol:string(_B2),
						      {V2_content, _B4} =
							  protocol:string(_B3),
						      {V2_state, _B5} =
							  protocol:uint8(_B4),
						      {V2_status2, _B6} =
							  protocol:uint8(_B5),
						      {V2_end_msg_time, _B7} =
							  protocol:uint32(_B6),
						      {V2_start_time, _B8} =
							  protocol:uint32(_B7),
						      {V2_finish_time, _B9} =
							  protocol:uint32(_B8),
						      {V2_score_time, _B10} =
							  protocol:uint32(_B9),
						      {{V2_id, V2_title,
							V2_content, V2_state,
							V2_status2,
							V2_end_msg_time,
							V2_start_time,
							V2_finish_time,
							V2_score_time},
						       _B10}
					      end),
    {ok, {V1_feedback_logs}};
unpack(10814, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(10814, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_title, _B2} = protocol:string(_B1),
    {V1_content, _B3} = protocol:string(_B2),
    {V1_state, _B4} = protocol:uint8(_B3),
    {V1_status2, _B5} = protocol:uint8(_B4),
    {V1_end_msg_time, _B6} = protocol:uint32(_B5),
    {V1_start_time, _B7} = protocol:uint32(_B6),
    {V1_finish_time, _B8} = protocol:uint32(_B7),
    {V1_score_time, _B9} = protocol:uint32(_B8),
    {V1_questions_lists, _B14} = protocol:array(_B9,
						fun (_B10) ->
							{V2_questions_timer,
							 _B11} =
							    protocol:uint32(_B10),
							{V2_questions_content,
							 _B12} =
							    protocol:string(_B11),
							{{V2_questions_timer,
							  V2_questions_content},
							 _B12}
						end),
    {V1_answer_lists, _B19} = protocol:array(_B14,
					     fun (_B15) ->
						     {V2_answer_timer, _B16} =
							 protocol:uint32(_B15),
						     {V2_answer_content, _B17} =
							 protocol:string(_B16),
						     {{V2_answer_timer,
						       V2_answer_content},
						      _B17}
					     end),
    {ok,
     {V1_id, V1_title, V1_content, V1_state, V1_status2,
      V1_end_msg_time, V1_start_time, V1_finish_time,
      V1_score_time, V1_questions_lists, V1_answer_lists}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


