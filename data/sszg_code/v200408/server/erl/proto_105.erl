-file("src/proto/proto_105.erl", 1).

-module(proto_105).

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
		  add_num, can_share, eqm_set, use_count]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

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

-file("src/proto/proto_105.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(10500, cli, {}) -> {ok, <<2:32, 10500:16>>};
pack(10500, srv,
     {V0_volume, V0_open_times, V0_item_list}) ->
    D_a_t_a = <<V0_volume:32, V0_open_times:8,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_bind:8,
				   V1_quantity:32, V1_pos:16, V1_expire_type:8,
				   V1_expire_time:32, (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   V1_enchant:32, (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   V1_score:32, V1_all_score:32,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  bind = V1_bind,
					  quantity = V1_quantity, pos = V1_pos,
					  expire_type = V1_expire_type,
					  expire_time = V1_expire_time,
					  main_attr = V1_main_attr,
					  enchant = V1_enchant, attr = V1_attr,
					  extra_attr = V1_extra_attr,
					  score = V1_score,
					  all_score = V1_all_score,
					  extra = V1_extra}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10500:16,
       D_a_t_a/binary>>};
pack(10501, cli, {}) -> {ok, <<2:32, 10501:16>>};
pack(10501, srv,
     {V0_volume, V0_open_times, V0_item_list}) ->
    D_a_t_a = <<V0_volume:32, V0_open_times:8,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_bind:8,
				   V1_quantity:32, V1_pos:16, V1_expire_type:8,
				   V1_expire_time:32, (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   V1_enchant:32, (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   V1_score:32, V1_all_score:32,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary,
				   (length(V1_gemstones)):16,
				   (list_to_binary([<<V2_lev:32>>
						    || V2_lev
							   <- V1_gemstones]))/binary,
				   (length(V1_holy_eqm_attr)):16,
				   (list_to_binary([<<V2_pos:8, V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_pos, V2_attr_id,
							V2_attr_val}
							   <- V1_holy_eqm_attr]))/binary>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  bind = V1_bind,
					  quantity = V1_quantity, pos = V1_pos,
					  expire_type = V1_expire_type,
					  expire_time = V1_expire_time,
					  main_attr = V1_main_attr,
					  enchant = V1_enchant, attr = V1_attr,
					  extra_attr = V1_extra_attr,
					  score = V1_score,
					  all_score = V1_all_score,
					  extra = V1_extra,
					  gemstones = V1_gemstones,
					  holy_eqm_attr = V1_holy_eqm_attr}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10501:16,
       D_a_t_a/binary>>};
pack(10502, cli, {}) -> {ok, <<2:32, 10502:16>>};
pack(10502, srv,
     {V0_volume, V0_open_times, V0_item_list}) ->
    D_a_t_a = <<V0_volume:32, V0_open_times:8,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_bind:8,
				   V1_quantity:32, V1_pos:16, V1_expire_type:8,
				   V1_expire_time:32, (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   V1_enchant:32, (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   V1_score:32, V1_all_score:32,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  bind = V1_bind,
					  quantity = V1_quantity, pos = V1_pos,
					  expire_type = V1_expire_type,
					  expire_time = V1_expire_time,
					  main_attr = V1_main_attr,
					  enchant = V1_enchant, attr = V1_attr,
					  extra_attr = V1_extra_attr,
					  score = V1_score,
					  all_score = V1_all_score,
					  extra = V1_extra}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10502:16,
       D_a_t_a/binary>>};
pack(10503, cli, {}) -> {ok, <<2:32, 10503:16>>};
pack(10503, srv,
     {V0_volume, V0_open_times, V0_item_list}) ->
    D_a_t_a = <<V0_volume:32, V0_open_times:8,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32, V1_bind:8,
				   V1_quantity:32, V1_pos:16, V1_expire_type:8,
				   V1_expire_time:32, (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   V1_enchant:32, (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   V1_score:32, V1_all_score:32,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary>>
				 || #item{id = V1_id, base_id = V1_base_id,
					  bind = V1_bind,
					  quantity = V1_quantity, pos = V1_pos,
					  expire_type = V1_expire_type,
					  expire_time = V1_expire_time,
					  main_attr = V1_main_attr,
					  enchant = V1_enchant, attr = V1_attr,
					  extra_attr = V1_extra_attr,
					  score = V1_score,
					  all_score = V1_all_score,
					  extra = V1_extra}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10503:16,
       D_a_t_a/binary>>};
pack(10510, srv, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16,
		(list_to_binary([<<V1_storage:8, V1_id:32,
				   V1_base_id:32, V1_bind:8, V1_quantity:32,
				   V1_pos:16, V1_expire_type:8,
				   V1_expire_time:32, (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   V1_enchant:32, (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   V1_score:32, V1_all_score:32,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary,
				   (length(V1_gemstones)):16,
				   (list_to_binary([<<V2_lev:32>>
						    || V2_lev
							   <- V1_gemstones]))/binary,
				   (length(V1_holy_eqm_attr)):16,
				   (list_to_binary([<<V2_pos:8, V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_pos, V2_attr_id,
							V2_attr_val}
							   <- V1_holy_eqm_attr]))/binary>>
				 || {V1_storage,
				     #item{id = V1_id, base_id = V1_base_id,
					   bind = V1_bind,
					   quantity = V1_quantity, pos = V1_pos,
					   expire_type = V1_expire_type,
					   expire_time = V1_expire_time,
					   main_attr = V1_main_attr,
					   enchant = V1_enchant, attr = V1_attr,
					   extra_attr = V1_extra_attr,
					   score = V1_score,
					   all_score = V1_all_score,
					   extra = V1_extra,
					   gemstones = V1_gemstones,
					   holy_eqm_attr = V1_holy_eqm_attr}}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10510:16,
       D_a_t_a/binary>>};
pack(10511, srv, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16,
		(list_to_binary([<<V1_storage:8, V1_id:32, V1_pos:16>>
				 || {V1_storage,
				     #item{id = V1_id, pos = V1_pos}}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10511:16,
       D_a_t_a/binary>>};
pack(10512, srv, {V0_item_list}) ->
    D_a_t_a = <<(length(V0_item_list)):16,
		(list_to_binary([<<V1_storage:8, V1_id:32,
				   V1_base_id:32, V1_bind:8, V1_quantity:32,
				   V1_pos:16, V1_expire_type:8,
				   V1_expire_time:32, (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_main_attr]))/binary,
				   V1_enchant:32, (length(V1_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_attr]))/binary,
				   (length(V1_extra_attr)):16,
				   (list_to_binary([<<V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_attr_id, V2_attr_val}
							   <- V1_extra_attr]))/binary,
				   V1_score:32, V1_all_score:32,
				   (length(V1_extra)):16,
				   (list_to_binary([<<V2_extra_k:32,
						      V2_extra_v:32>>
						    || {V2_extra_k, V2_extra_v}
							   <- V1_extra]))/binary,
				   (length(V1_gemstones)):16,
				   (list_to_binary([<<V2_lev:32>>
						    || V2_lev
							   <- V1_gemstones]))/binary,
				   (length(V1_holy_eqm_attr)):16,
				   (list_to_binary([<<V2_pos:8, V2_attr_id:32,
						      V2_attr_val:32>>
						    || {V2_pos, V2_attr_id,
							V2_attr_val}
							   <- V1_holy_eqm_attr]))/binary>>
				 || {V1_storage,
				     #item{id = V1_id, base_id = V1_base_id,
					   bind = V1_bind,
					   quantity = V1_quantity, pos = V1_pos,
					   expire_type = V1_expire_type,
					   expire_time = V1_expire_time,
					   main_attr = V1_main_attr,
					   enchant = V1_enchant, attr = V1_attr,
					   extra_attr = V1_extra_attr,
					   score = V1_score,
					   all_score = V1_all_score,
					   extra = V1_extra,
					   gemstones = V1_gemstones,
					   holy_eqm_attr = V1_holy_eqm_attr}}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10512:16,
       D_a_t_a/binary>>};
pack(10515, cli, {V0_id, V0_quantity, V0_args}) ->
    D_a_t_a = <<V0_id:32, V0_quantity:16,
		(length(V0_args)):16,
		(list_to_binary([<<V1_name:8, V1_value:32,
				   (protocol:pack(string, V1_str))/binary>>
				 || {V1_name, V1_value, V1_str}
					<- V0_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10515:16,
       D_a_t_a/binary>>};
pack(10515, srv, {V0_flag, V0_base_id, V0_msg}) ->
    D_a_t_a = <<V0_flag:8, V0_base_id:32,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10515:16,
       D_a_t_a/binary>>};
pack(10520, cli, {V0_id, V0_storage}) ->
    D_a_t_a = <<V0_id:32, V0_storage:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10520:16,
       D_a_t_a/binary>>};
pack(10520, srv,
     {V0_id, V0_storage, V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_id:32, V0_storage:8, V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10520:16,
       D_a_t_a/binary>>};
pack(10521, cli, {V0_storage, V0_args}) ->
    D_a_t_a = <<V0_storage:8, (length(V0_args)):16,
		(list_to_binary([<<V1_id:32, V1_bid:32, V1_num:32>>
				 || {V1_id, V1_bid, V1_num}
					<- V0_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10521:16,
       D_a_t_a/binary>>};
pack(10521, srv, {V0_items}) ->
    D_a_t_a = <<(length(V0_items)):16,
		(list_to_binary([<<V1_bid:32, V1_num:32>>
				 || {V1_bid, V1_num} <- V0_items]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10521:16,
       D_a_t_a/binary>>};
pack(10522, cli, {V0_storage, V0_args}) ->
    D_a_t_a = <<V0_storage:8, (length(V0_args)):16,
		(list_to_binary([<<V1_id:32, V1_bid:32, V1_num:16>>
				 || {V1_id, V1_bid, V1_num}
					<- V0_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10522:16,
       D_a_t_a/binary>>};
pack(10522, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10522:16,
       D_a_t_a/binary>>};
pack(10523, cli, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32, V0_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10523:16,
       D_a_t_a/binary>>};
pack(10523, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10523:16,
       D_a_t_a/binary>>};
pack(10524, cli, {V0_star_list}) ->
    D_a_t_a = <<(length(V0_star_list)):16,
		(list_to_binary([<<V1_star:8>>
				 || V1_star <- V0_star_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10524:16,
       D_a_t_a/binary>>};
pack(10524, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10524:16,
       D_a_t_a/binary>>};
pack(10525, cli, {}) -> {ok, <<2:32, 10525:16>>};
pack(10525, srv, {V0_star_list}) ->
    D_a_t_a = <<(length(V0_star_list)):16,
		(list_to_binary([<<V1_star:8>>
				 || V1_star <- V0_star_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10525:16,
       D_a_t_a/binary>>};
pack(10526, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10526:16,
       D_a_t_a/binary>>};
pack(10526, srv, {V0_type, V0_volume, V0_open_times}) ->
    D_a_t_a = <<V0_type:8, V0_volume:32, V0_open_times:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10526:16,
       D_a_t_a/binary>>};
pack(10528, cli, {}) -> {ok, <<2:32, 10528:16>>};
pack(10528, srv, {V0_time, V0_minu_exp}) ->
    D_a_t_a = <<V0_time:32, V0_minu_exp:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10528:16,
       D_a_t_a/binary>>};
pack(10530, srv, {}) -> {ok, <<2:32, 10530:16>>};
pack(10535, cli,
     {V0_type, V0_id, V0_partner_id, V0_code}) ->
    D_a_t_a = <<V0_type:8, V0_id:32, V0_partner_id:32,
		V0_code:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10535:16,
       D_a_t_a/binary>>};
pack(10535, srv,
     {V0_flag, V0_msg, V0_share_id, V0_base_id, V0_count,
      V0_code}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary, V0_share_id:32,
		V0_base_id:32, V0_count:32, V0_code:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10535:16,
       D_a_t_a/binary>>};
pack(10536, cli, {V0_id, V0_srv_id}) ->
    D_a_t_a = <<V0_id:32,
		(protocol:pack(string, V0_srv_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10536:16,
       D_a_t_a/binary>>};
pack(10536, srv,
     {#item{base_id = V0_base_id, quantity = V0_quantity,
	    pos = V0_pos, expire_type = V0_expire_type,
	    expire_time = V0_expire_time, main_attr = V0_main_attr,
	    enchant = V0_enchant, attr = V0_attr, score = V0_score,
	    all_score = V0_all_score, extra = V0_extra,
	    gemstones = V0_gemstones}}) ->
    D_a_t_a = <<V0_base_id:32, V0_quantity:32, V0_pos:16,
		V0_expire_type:8, V0_expire_time:32,
		(length(V0_main_attr)):16,
		(list_to_binary([<<V1_attr_id:32, V1_attr_val:32>>
				 || {V1_attr_id, V1_attr_val}
					<- V0_main_attr]))/binary,
		V0_enchant:32, (length(V0_attr)):16,
		(list_to_binary([<<V1_attr_id:32, V1_attr_val:32>>
				 || {V1_attr_id, V1_attr_val}
					<- V0_attr]))/binary,
		V0_score:32, V0_all_score:32, (length(V0_extra)):16,
		(list_to_binary([<<V1_extra_k:32, V1_extra_v:32>>
				 || {V1_extra_k, V1_extra_v}
					<- V0_extra]))/binary,
		(length(V0_gemstones)):16,
		(list_to_binary([<<V1_lev:32>>
				 || V1_lev <- V0_gemstones]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10536:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(10500, srv, _B0) -> {ok, {}};
unpack(10500, cli, _B0) ->
    {V1_volume, _B1} = protocol:uint32(_B0),
    {V1_open_times, _B2} = protocol:uint8(_B1),
    {V1_item_list, _B35} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_base_id, _B5} =
						      protocol:uint32(_B4),
						  {V2_bind, _B6} =
						      protocol:uint8(_B5),
						  {V2_quantity, _B7} =
						      protocol:uint32(_B6),
						  {V2_pos, _B8} =
						      protocol:uint16(_B7),
						  {V2_expire_type, _B9} =
						      protocol:uint8(_B8),
						  {V2_expire_time, _B10} =
						      protocol:uint32(_B9),
						  {V2_main_attr, _B15} =
						      protocol:array(_B10,
								     fun
								       (_B11) ->
									   {V3_attr_id,
									    _B12} =
									       protocol:uint32(_B11),
									   {V3_attr_val,
									    _B13} =
									       protocol:uint32(_B12),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B13}
								     end),
						  {V2_enchant, _B16} =
						      protocol:uint32(_B15),
						  {V2_attr, _B21} =
						      protocol:array(_B16,
								     fun
								       (_B17) ->
									   {V3_attr_id,
									    _B18} =
									       protocol:uint32(_B17),
									   {V3_attr_val,
									    _B19} =
									       protocol:uint32(_B18),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B19}
								     end),
						  {V2_extra_attr, _B26} =
						      protocol:array(_B21,
								     fun
								       (_B22) ->
									   {V3_attr_id,
									    _B23} =
									       protocol:uint32(_B22),
									   {V3_attr_val,
									    _B24} =
									       protocol:uint32(_B23),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B24}
								     end),
						  {V2_score, _B27} =
						      protocol:uint32(_B26),
						  {V2_all_score, _B28} =
						      protocol:uint32(_B27),
						  {V2_extra, _B33} =
						      protocol:array(_B28,
								     fun
								       (_B29) ->
									   {V3_extra_k,
									    _B30} =
									       protocol:uint32(_B29),
									   {V3_extra_v,
									    _B31} =
									       protocol:uint32(_B30),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B31}
								     end),
						  {{V2_id, V2_base_id, V2_bind,
						    V2_quantity, V2_pos,
						    V2_expire_type,
						    V2_expire_time,
						    V2_main_attr, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_score, V2_all_score,
						    V2_extra},
						   _B33}
					  end),
    {ok, {V1_volume, V1_open_times, V1_item_list}};
unpack(10501, srv, _B0) -> {ok, {}};
unpack(10501, cli, _B0) ->
    {V1_volume, _B1} = protocol:uint32(_B0),
    {V1_open_times, _B2} = protocol:uint8(_B1),
    {V1_item_list, _B45} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_base_id, _B5} =
						      protocol:uint32(_B4),
						  {V2_bind, _B6} =
						      protocol:uint8(_B5),
						  {V2_quantity, _B7} =
						      protocol:uint32(_B6),
						  {V2_pos, _B8} =
						      protocol:uint16(_B7),
						  {V2_expire_type, _B9} =
						      protocol:uint8(_B8),
						  {V2_expire_time, _B10} =
						      protocol:uint32(_B9),
						  {V2_main_attr, _B15} =
						      protocol:array(_B10,
								     fun
								       (_B11) ->
									   {V3_attr_id,
									    _B12} =
									       protocol:uint32(_B11),
									   {V3_attr_val,
									    _B13} =
									       protocol:uint32(_B12),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B13}
								     end),
						  {V2_enchant, _B16} =
						      protocol:uint32(_B15),
						  {V2_attr, _B21} =
						      protocol:array(_B16,
								     fun
								       (_B17) ->
									   {V3_attr_id,
									    _B18} =
									       protocol:uint32(_B17),
									   {V3_attr_val,
									    _B19} =
									       protocol:uint32(_B18),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B19}
								     end),
						  {V2_extra_attr, _B26} =
						      protocol:array(_B21,
								     fun
								       (_B22) ->
									   {V3_attr_id,
									    _B23} =
									       protocol:uint32(_B22),
									   {V3_attr_val,
									    _B24} =
									       protocol:uint32(_B23),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B24}
								     end),
						  {V2_score, _B27} =
						      protocol:uint32(_B26),
						  {V2_all_score, _B28} =
						      protocol:uint32(_B27),
						  {V2_extra, _B33} =
						      protocol:array(_B28,
								     fun
								       (_B29) ->
									   {V3_extra_k,
									    _B30} =
									       protocol:uint32(_B29),
									   {V3_extra_v,
									    _B31} =
									       protocol:uint32(_B30),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B31}
								     end),
						  {V2_gemstones, _B37} =
						      protocol:array(_B33,
								     fun
								       (_B34) ->
									   {V3_lev,
									    _B35} =
									       protocol:uint32(_B34),
									   {V3_lev,
									    _B35}
								     end),
						  {V2_holy_eqm_attr, _B43} =
						      protocol:array(_B37,
								     fun
								       (_B38) ->
									   {V3_pos,
									    _B39} =
									       protocol:uint8(_B38),
									   {V3_attr_id,
									    _B40} =
									       protocol:uint32(_B39),
									   {V3_attr_val,
									    _B41} =
									       protocol:uint32(_B40),
									   {{V3_pos,
									     V3_attr_id,
									     V3_attr_val},
									    _B41}
								     end),
						  {{V2_id, V2_base_id, V2_bind,
						    V2_quantity, V2_pos,
						    V2_expire_type,
						    V2_expire_time,
						    V2_main_attr, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_score, V2_all_score,
						    V2_extra, V2_gemstones,
						    V2_holy_eqm_attr},
						   _B43}
					  end),
    {ok, {V1_volume, V1_open_times, V1_item_list}};
unpack(10502, srv, _B0) -> {ok, {}};
unpack(10502, cli, _B0) ->
    {V1_volume, _B1} = protocol:uint32(_B0),
    {V1_open_times, _B2} = protocol:uint8(_B1),
    {V1_item_list, _B35} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_base_id, _B5} =
						      protocol:uint32(_B4),
						  {V2_bind, _B6} =
						      protocol:uint8(_B5),
						  {V2_quantity, _B7} =
						      protocol:uint32(_B6),
						  {V2_pos, _B8} =
						      protocol:uint16(_B7),
						  {V2_expire_type, _B9} =
						      protocol:uint8(_B8),
						  {V2_expire_time, _B10} =
						      protocol:uint32(_B9),
						  {V2_main_attr, _B15} =
						      protocol:array(_B10,
								     fun
								       (_B11) ->
									   {V3_attr_id,
									    _B12} =
									       protocol:uint32(_B11),
									   {V3_attr_val,
									    _B13} =
									       protocol:uint32(_B12),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B13}
								     end),
						  {V2_enchant, _B16} =
						      protocol:uint32(_B15),
						  {V2_attr, _B21} =
						      protocol:array(_B16,
								     fun
								       (_B17) ->
									   {V3_attr_id,
									    _B18} =
									       protocol:uint32(_B17),
									   {V3_attr_val,
									    _B19} =
									       protocol:uint32(_B18),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B19}
								     end),
						  {V2_extra_attr, _B26} =
						      protocol:array(_B21,
								     fun
								       (_B22) ->
									   {V3_attr_id,
									    _B23} =
									       protocol:uint32(_B22),
									   {V3_attr_val,
									    _B24} =
									       protocol:uint32(_B23),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B24}
								     end),
						  {V2_score, _B27} =
						      protocol:uint32(_B26),
						  {V2_all_score, _B28} =
						      protocol:uint32(_B27),
						  {V2_extra, _B33} =
						      protocol:array(_B28,
								     fun
								       (_B29) ->
									   {V3_extra_k,
									    _B30} =
									       protocol:uint32(_B29),
									   {V3_extra_v,
									    _B31} =
									       protocol:uint32(_B30),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B31}
								     end),
						  {{V2_id, V2_base_id, V2_bind,
						    V2_quantity, V2_pos,
						    V2_expire_type,
						    V2_expire_time,
						    V2_main_attr, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_score, V2_all_score,
						    V2_extra},
						   _B33}
					  end),
    {ok, {V1_volume, V1_open_times, V1_item_list}};
unpack(10503, srv, _B0) -> {ok, {}};
unpack(10503, cli, _B0) ->
    {V1_volume, _B1} = protocol:uint32(_B0),
    {V1_open_times, _B2} = protocol:uint8(_B1),
    {V1_item_list, _B35} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_base_id, _B5} =
						      protocol:uint32(_B4),
						  {V2_bind, _B6} =
						      protocol:uint8(_B5),
						  {V2_quantity, _B7} =
						      protocol:uint32(_B6),
						  {V2_pos, _B8} =
						      protocol:uint16(_B7),
						  {V2_expire_type, _B9} =
						      protocol:uint8(_B8),
						  {V2_expire_time, _B10} =
						      protocol:uint32(_B9),
						  {V2_main_attr, _B15} =
						      protocol:array(_B10,
								     fun
								       (_B11) ->
									   {V3_attr_id,
									    _B12} =
									       protocol:uint32(_B11),
									   {V3_attr_val,
									    _B13} =
									       protocol:uint32(_B12),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B13}
								     end),
						  {V2_enchant, _B16} =
						      protocol:uint32(_B15),
						  {V2_attr, _B21} =
						      protocol:array(_B16,
								     fun
								       (_B17) ->
									   {V3_attr_id,
									    _B18} =
									       protocol:uint32(_B17),
									   {V3_attr_val,
									    _B19} =
									       protocol:uint32(_B18),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B19}
								     end),
						  {V2_extra_attr, _B26} =
						      protocol:array(_B21,
								     fun
								       (_B22) ->
									   {V3_attr_id,
									    _B23} =
									       protocol:uint32(_B22),
									   {V3_attr_val,
									    _B24} =
									       protocol:uint32(_B23),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B24}
								     end),
						  {V2_score, _B27} =
						      protocol:uint32(_B26),
						  {V2_all_score, _B28} =
						      protocol:uint32(_B27),
						  {V2_extra, _B33} =
						      protocol:array(_B28,
								     fun
								       (_B29) ->
									   {V3_extra_k,
									    _B30} =
									       protocol:uint32(_B29),
									   {V3_extra_v,
									    _B31} =
									       protocol:uint32(_B30),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B31}
								     end),
						  {{V2_id, V2_base_id, V2_bind,
						    V2_quantity, V2_pos,
						    V2_expire_type,
						    V2_expire_time,
						    V2_main_attr, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_score, V2_all_score,
						    V2_extra},
						   _B33}
					  end),
    {ok, {V1_volume, V1_open_times, V1_item_list}};
unpack(10510, cli, _B0) ->
    {V1_item_list, _B44} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_storage, _B2} =
						      protocol:uint8(_B1),
						  {V2_id, _B3} =
						      protocol:uint32(_B2),
						  {V2_base_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_bind, _B5} =
						      protocol:uint8(_B4),
						  {V2_quantity, _B6} =
						      protocol:uint32(_B5),
						  {V2_pos, _B7} =
						      protocol:uint16(_B6),
						  {V2_expire_type, _B8} =
						      protocol:uint8(_B7),
						  {V2_expire_time, _B9} =
						      protocol:uint32(_B8),
						  {V2_main_attr, _B14} =
						      protocol:array(_B9,
								     fun
								       (_B10) ->
									   {V3_attr_id,
									    _B11} =
									       protocol:uint32(_B10),
									   {V3_attr_val,
									    _B12} =
									       protocol:uint32(_B11),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B12}
								     end),
						  {V2_enchant, _B15} =
						      protocol:uint32(_B14),
						  {V2_attr, _B20} =
						      protocol:array(_B15,
								     fun
								       (_B16) ->
									   {V3_attr_id,
									    _B17} =
									       protocol:uint32(_B16),
									   {V3_attr_val,
									    _B18} =
									       protocol:uint32(_B17),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B18}
								     end),
						  {V2_extra_attr, _B25} =
						      protocol:array(_B20,
								     fun
								       (_B21) ->
									   {V3_attr_id,
									    _B22} =
									       protocol:uint32(_B21),
									   {V3_attr_val,
									    _B23} =
									       protocol:uint32(_B22),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B23}
								     end),
						  {V2_score, _B26} =
						      protocol:uint32(_B25),
						  {V2_all_score, _B27} =
						      protocol:uint32(_B26),
						  {V2_extra, _B32} =
						      protocol:array(_B27,
								     fun
								       (_B28) ->
									   {V3_extra_k,
									    _B29} =
									       protocol:uint32(_B28),
									   {V3_extra_v,
									    _B30} =
									       protocol:uint32(_B29),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B30}
								     end),
						  {V2_gemstones, _B36} =
						      protocol:array(_B32,
								     fun
								       (_B33) ->
									   {V3_lev,
									    _B34} =
									       protocol:uint32(_B33),
									   {V3_lev,
									    _B34}
								     end),
						  {V2_holy_eqm_attr, _B42} =
						      protocol:array(_B36,
								     fun
								       (_B37) ->
									   {V3_pos,
									    _B38} =
									       protocol:uint8(_B37),
									   {V3_attr_id,
									    _B39} =
									       protocol:uint32(_B38),
									   {V3_attr_val,
									    _B40} =
									       protocol:uint32(_B39),
									   {{V3_pos,
									     V3_attr_id,
									     V3_attr_val},
									    _B40}
								     end),
						  {{V2_storage, V2_id,
						    V2_base_id, V2_bind,
						    V2_quantity, V2_pos,
						    V2_expire_type,
						    V2_expire_time,
						    V2_main_attr, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_score, V2_all_score,
						    V2_extra, V2_gemstones,
						    V2_holy_eqm_attr},
						   _B42}
					  end),
    {ok, {V1_item_list}};
unpack(10511, cli, _B0) ->
    {V1_item_list, _B6} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_storage, _B2} =
						     protocol:uint8(_B1),
						 {V2_id, _B3} =
						     protocol:uint32(_B2),
						 {V2_pos, _B4} =
						     protocol:uint16(_B3),
						 {{V2_storage, V2_id, V2_pos},
						  _B4}
					 end),
    {ok, {V1_item_list}};
unpack(10512, cli, _B0) ->
    {V1_item_list, _B44} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_storage, _B2} =
						      protocol:uint8(_B1),
						  {V2_id, _B3} =
						      protocol:uint32(_B2),
						  {V2_base_id, _B4} =
						      protocol:uint32(_B3),
						  {V2_bind, _B5} =
						      protocol:uint8(_B4),
						  {V2_quantity, _B6} =
						      protocol:uint32(_B5),
						  {V2_pos, _B7} =
						      protocol:uint16(_B6),
						  {V2_expire_type, _B8} =
						      protocol:uint8(_B7),
						  {V2_expire_time, _B9} =
						      protocol:uint32(_B8),
						  {V2_main_attr, _B14} =
						      protocol:array(_B9,
								     fun
								       (_B10) ->
									   {V3_attr_id,
									    _B11} =
									       protocol:uint32(_B10),
									   {V3_attr_val,
									    _B12} =
									       protocol:uint32(_B11),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B12}
								     end),
						  {V2_enchant, _B15} =
						      protocol:uint32(_B14),
						  {V2_attr, _B20} =
						      protocol:array(_B15,
								     fun
								       (_B16) ->
									   {V3_attr_id,
									    _B17} =
									       protocol:uint32(_B16),
									   {V3_attr_val,
									    _B18} =
									       protocol:uint32(_B17),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B18}
								     end),
						  {V2_extra_attr, _B25} =
						      protocol:array(_B20,
								     fun
								       (_B21) ->
									   {V3_attr_id,
									    _B22} =
									       protocol:uint32(_B21),
									   {V3_attr_val,
									    _B23} =
									       protocol:uint32(_B22),
									   {{V3_attr_id,
									     V3_attr_val},
									    _B23}
								     end),
						  {V2_score, _B26} =
						      protocol:uint32(_B25),
						  {V2_all_score, _B27} =
						      protocol:uint32(_B26),
						  {V2_extra, _B32} =
						      protocol:array(_B27,
								     fun
								       (_B28) ->
									   {V3_extra_k,
									    _B29} =
									       protocol:uint32(_B28),
									   {V3_extra_v,
									    _B30} =
									       protocol:uint32(_B29),
									   {{V3_extra_k,
									     V3_extra_v},
									    _B30}
								     end),
						  {V2_gemstones, _B36} =
						      protocol:array(_B32,
								     fun
								       (_B33) ->
									   {V3_lev,
									    _B34} =
									       protocol:uint32(_B33),
									   {V3_lev,
									    _B34}
								     end),
						  {V2_holy_eqm_attr, _B42} =
						      protocol:array(_B36,
								     fun
								       (_B37) ->
									   {V3_pos,
									    _B38} =
									       protocol:uint8(_B37),
									   {V3_attr_id,
									    _B39} =
									       protocol:uint32(_B38),
									   {V3_attr_val,
									    _B40} =
									       protocol:uint32(_B39),
									   {{V3_pos,
									     V3_attr_id,
									     V3_attr_val},
									    _B40}
								     end),
						  {{V2_storage, V2_id,
						    V2_base_id, V2_bind,
						    V2_quantity, V2_pos,
						    V2_expire_type,
						    V2_expire_time,
						    V2_main_attr, V2_enchant,
						    V2_attr, V2_extra_attr,
						    V2_score, V2_all_score,
						    V2_extra, V2_gemstones,
						    V2_holy_eqm_attr},
						   _B42}
					  end),
    {ok, {V1_item_list}};
unpack(10515, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_quantity, _B2} = protocol:uint16(_B1),
    {V1_args, _B8} = protocol:array(_B2,
				    fun (_B3) ->
					    {V2_name, _B4} =
						protocol:uint8(_B3),
					    {V2_value, _B5} =
						protocol:uint32(_B4),
					    {V2_str, _B6} =
						protocol:string(_B5),
					    {{V2_name, V2_value, V2_str}, _B6}
				    end),
    {ok, {V1_id, V1_quantity, V1_args}};
unpack(10515, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_base_id, _B2} = protocol:uint32(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {ok, {V1_flag, V1_base_id, V1_msg}};
unpack(10520, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_storage, _B2} = protocol:uint8(_B1),
    {ok, {V1_id, V1_storage}};
unpack(10520, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_storage, _B2} = protocol:uint8(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_msg, _B4} = protocol:string(_B3),
    {ok, {V1_id, V1_storage, V1_flag, V1_msg}};
unpack(10521, srv, _B0) ->
    {V1_storage, _B1} = protocol:uint8(_B0),
    {V1_args, _B7} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_id, _B3} = protocol:uint32(_B2),
					    {V2_bid, _B4} =
						protocol:uint32(_B3),
					    {V2_num, _B5} =
						protocol:uint32(_B4),
					    {{V2_id, V2_bid, V2_num}, _B5}
				    end),
    {ok, {V1_storage, V1_args}};
unpack(10521, cli, _B0) ->
    {V1_items, _B5} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_bid, _B2} =
						 protocol:uint32(_B1),
					     {V2_num, _B3} =
						 protocol:uint32(_B2),
					     {{V2_bid, V2_num}, _B3}
				     end),
    {ok, {V1_items}};
unpack(10522, srv, _B0) ->
    {V1_storage, _B1} = protocol:uint8(_B0),
    {V1_args, _B7} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_id, _B3} = protocol:uint32(_B2),
					    {V2_bid, _B4} =
						protocol:uint32(_B3),
					    {V2_num, _B5} =
						protocol:uint16(_B4),
					    {{V2_id, V2_bid, V2_num}, _B5}
				    end),
    {ok, {V1_storage, V1_args}};
unpack(10522, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(10523, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_num}};
unpack(10523, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(10524, srv, _B0) ->
    {V1_star_list, _B4} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_star, _B2} =
						     protocol:uint8(_B1),
						 {V2_star, _B2}
					 end),
    {ok, {V1_star_list}};
unpack(10524, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(10525, srv, _B0) -> {ok, {}};
unpack(10525, cli, _B0) ->
    {V1_star_list, _B4} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_star, _B2} =
						     protocol:uint8(_B1),
						 {V2_star, _B2}
					 end),
    {ok, {V1_star_list}};
unpack(10526, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(10526, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_volume, _B2} = protocol:uint32(_B1),
    {V1_open_times, _B3} = protocol:uint8(_B2),
    {ok, {V1_type, V1_volume, V1_open_times}};
unpack(10528, srv, _B0) -> {ok, {}};
unpack(10528, cli, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0),
    {V1_minu_exp, _B2} = protocol:uint32(_B1),
    {ok, {V1_time, V1_minu_exp}};
unpack(10530, cli, _B0) -> {ok, {}};
unpack(10535, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint32(_B1),
    {V1_partner_id, _B3} = protocol:uint32(_B2),
    {V1_code, _B4} = protocol:uint32(_B3),
    {ok, {V1_type, V1_id, V1_partner_id, V1_code}};
unpack(10535, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_share_id, _B3} = protocol:uint32(_B2),
    {V1_base_id, _B4} = protocol:uint32(_B3),
    {V1_count, _B5} = protocol:uint32(_B4),
    {V1_code, _B6} = protocol:uint32(_B5),
    {ok,
     {V1_flag, V1_msg, V1_share_id, V1_base_id, V1_count,
      V1_code}};
unpack(10536, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {ok, {V1_id, V1_srv_id}};
unpack(10536, cli, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_quantity, _B2} = protocol:uint32(_B1),
    {V1_pos, _B3} = protocol:uint16(_B2),
    {V1_expire_type, _B4} = protocol:uint8(_B3),
    {V1_expire_time, _B5} = protocol:uint32(_B4),
    {V1_main_attr, _B10} = protocol:array(_B5,
					  fun (_B6) ->
						  {V2_attr_id, _B7} =
						      protocol:uint32(_B6),
						  {V2_attr_val, _B8} =
						      protocol:uint32(_B7),
						  {{V2_attr_id, V2_attr_val},
						   _B8}
					  end),
    {V1_enchant, _B11} = protocol:uint32(_B10),
    {V1_attr, _B16} = protocol:array(_B11,
				     fun (_B12) ->
					     {V2_attr_id, _B13} =
						 protocol:uint32(_B12),
					     {V2_attr_val, _B14} =
						 protocol:uint32(_B13),
					     {{V2_attr_id, V2_attr_val}, _B14}
				     end),
    {V1_score, _B17} = protocol:uint32(_B16),
    {V1_all_score, _B18} = protocol:uint32(_B17),
    {V1_extra, _B23} = protocol:array(_B18,
				      fun (_B19) ->
					      {V2_extra_k, _B20} =
						  protocol:uint32(_B19),
					      {V2_extra_v, _B21} =
						  protocol:uint32(_B20),
					      {{V2_extra_k, V2_extra_v}, _B21}
				      end),
    {V1_gemstones, _B27} = protocol:array(_B23,
					  fun (_B24) ->
						  {V2_lev, _B25} =
						      protocol:uint32(_B24),
						  {V2_lev, _B25}
					  end),
    {ok,
     {V1_base_id, V1_quantity, V1_pos, V1_expire_type,
      V1_expire_time, V1_main_attr, V1_enchant, V1_attr,
      V1_score, V1_all_score, V1_extra, V1_gemstones}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


