-file("src/proto/proto_109.erl", 1).

-module(proto_109).

-lager_records([{notice_board,
		 [id, type, title, summary, content, sort, lev, items,
		  start_time, end_time, channel]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{item_make_args, [base_id, bind, quantity, step, flag]},
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

-file("src/proto/proto_109.erl", 16).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("src/proto/proto_109.erl", 17).

-file("inc/notice.hrl", 1).

-record(notice_board,
	{id = 0, type = 1, title = <<>>, summary = <<>>,
	 content = <<>>, sort = 0, lev = 0, items = [],
	 start_time = 0, end_time = 0, channel = []}).

-file("src/proto/proto_109.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(10900, cli,
     {V0_rid, V0_srv_id, V0_hour, V0_interdict}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_hour:32,
		(protocol:pack(string, V0_interdict))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10900:16,
       D_a_t_a/binary>>};
pack(10900, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10900:16,
       D_a_t_a/binary>>};
pack(10901, cli,
     {V0_rid, V0_srv_id, V0_hour, V0_banned}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary, V0_hour:32,
		(protocol:pack(string, V0_banned))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10901:16,
       D_a_t_a/binary>>};
pack(10901, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10901:16,
       D_a_t_a/binary>>};
pack(10902, cli, {V0_rid, V0_srv_id, V0_stop_role}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(protocol:pack(string, V0_stop_role))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10902:16,
       D_a_t_a/binary>>};
pack(10902, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10902:16,
       D_a_t_a/binary>>};
pack(10905, cli, {}) -> {ok, <<2:32, 10905:16>>};
pack(10905, srv, {V0_world_lev}) ->
    D_a_t_a = <<V0_world_lev:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10905:16,
       D_a_t_a/binary>>};
pack(10906, cli, {}) -> {ok, <<2:32, 10906:16>>};
pack(10906, srv, {V0_open_day}) ->
    D_a_t_a = <<V0_open_day:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10906:16,
       D_a_t_a/binary>>};
pack(10907, cli, {}) -> {ok, <<2:32, 10907:16>>};
pack(10907, srv, {V0_sys_ban}) ->
    D_a_t_a = <<V0_sys_ban:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10907:16,
       D_a_t_a/binary>>};
pack(10911, srv, {V0_rid, V0_srv_id, V0_buffs}) ->
    D_a_t_a = <<V0_rid:32,
		(protocol:pack(string, V0_srv_id))/binary,
		(length(V0_buffs)):16,
		(list_to_binary([<<V1_bid:32, V1_duration:32,
				   V1_count:8, (length(V1_effect)):16,
				   (list_to_binary([<<V2_key:8, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_effect]))/binary>>
				 || {V1_bid, V1_duration, V1_count, V1_effect}
					<- V0_buffs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10911:16,
       D_a_t_a/binary>>};
pack(10912, srv, {V0_bid, V0_effect}) ->
    D_a_t_a = <<V0_bid:32, (length(V0_effect)):16,
		(list_to_binary([<<V1_key:8, V1_val:32>>
				 || {V1_key, V1_val} <- V0_effect]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10912:16,
       D_a_t_a/binary>>};
pack(10913, srv, {V0_buffs}) ->
    D_a_t_a = <<(length(V0_buffs)):16,
		(list_to_binary([<<V1_change_type:8, V1_bid:32,
				   V1_duration:32, V1_count:8,
				   (length(V1_effect)):16,
				   (list_to_binary([<<V2_key:8,
						      V2_val:32/signed>>
						    || {V2_key, V2_val}
							   <- V1_effect]))/binary>>
				 || {V1_change_type, V1_bid, V1_duration,
				     V1_count, V1_effect}
					<- V0_buffs]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10913:16,
       D_a_t_a/binary>>};
pack(10922, cli, {}) -> {ok, <<2:32, 10922:16>>};
pack(10922, srv, {V0_act_list}) ->
    D_a_t_a = <<(length(V0_act_list)):16,
		(list_to_binary([<<V1_id:16, V1_status:8,
				   (length(V1_int_args)):16,
				   (list_to_binary([<<V2_val:32>>
						    || V2_val
							   <- V1_int_args]))/binary,
				   (length(V1_ext_args)):16,
				   (list_to_binary([<<V2_type:8, V2_val:32,
						      (protocol:pack(string,
								     V2_str))/binary>>
						    || {V2_type, V2_val, V2_str}
							   <- V1_ext_args]))/binary>>
				 || {V1_id, V1_status, V1_int_args, V1_ext_args}
					<- V0_act_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10922:16,
       D_a_t_a/binary>>};
pack(10923, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10923:16,
       D_a_t_a/binary>>};
pack(10923, srv,
     {V0_id, V0_status, V0_int_args, V0_ext_args}) ->
    D_a_t_a = <<V0_id:16, V0_status:8,
		(length(V0_int_args)):16,
		(list_to_binary([<<V1_val:32>>
				 || V1_val <- V0_int_args]))/binary,
		(length(V0_ext_args)):16,
		(list_to_binary([<<V1_type:8, V1_val:32,
				   (protocol:pack(string, V1_str))/binary>>
				 || {V1_type, V1_val, V1_str}
					<- V0_ext_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10923:16,
       D_a_t_a/binary>>};
pack(10924, cli, {}) -> {ok, <<2:32, 10924:16>>};
pack(10924, srv, {V0_act_list}) ->
    D_a_t_a = <<(length(V0_act_list)):16,
		(list_to_binary([<<V1_id:16, V1_status:8,
				   (length(V1_int_args)):16,
				   (list_to_binary([<<V2_val:32>>
						    || V2_val
							   <- V1_int_args]))/binary,
				   (length(V1_ext_args)):16,
				   (list_to_binary([<<V2_type:8, V2_val:32,
						      (protocol:pack(string,
								     V2_str))/binary>>
						    || {V2_type, V2_val, V2_str}
							   <- V1_ext_args]))/binary>>
				 || {V1_id, V1_status, V1_int_args, V1_ext_args}
					<- V0_act_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10924:16,
       D_a_t_a/binary>>};
pack(10925, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10925:16,
       D_a_t_a/binary>>};
pack(10925, srv,
     {V0_id, V0_status, V0_int_args, V0_ext_args}) ->
    D_a_t_a = <<V0_id:16, V0_status:8,
		(length(V0_int_args)):16,
		(list_to_binary([<<V1_val:32>>
				 || V1_val <- V0_int_args]))/binary,
		(length(V0_ext_args)):16,
		(list_to_binary([<<V1_type:8, V1_val:32,
				   (protocol:pack(string, V1_str))/binary>>
				 || {V1_type, V1_val, V1_str}
					<- V0_ext_args]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10925:16,
       D_a_t_a/binary>>};
pack(10926, cli, {}) -> {ok, <<2:32, 10926:16>>};
pack(10926, srv, {V0_time, V0_list}) ->
    D_a_t_a = <<V0_time:32, (length(V0_list)):16,
		(list_to_binary([<<V1_time:32>>
				 || V1_time <- V0_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10926:16,
       D_a_t_a/binary>>};
pack(10927, cli, {V0_time}) ->
    D_a_t_a = <<V0_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10927:16,
       D_a_t_a/binary>>};
pack(10927, srv, {V0_code, V0_msg, V0_time}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10927:16,
       D_a_t_a/binary>>};
pack(10928, cli, {}) -> {ok, <<2:32, 10928:16>>};
pack(10928, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10928:16,
       D_a_t_a/binary>>};
pack(10929, cli, {}) -> {ok, <<2:32, 10929:16>>};
pack(10929, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10929:16,
       D_a_t_a/binary>>};
pack(10930, cli, {}) -> {ok, <<2:32, 10930:16>>};
pack(10930, srv, {V0_code, V0_open_timestamp}) ->
    D_a_t_a = <<V0_code:8, V0_open_timestamp:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10930:16,
       D_a_t_a/binary>>};
pack(10931, cli, {}) -> {ok, <<2:32, 10931:16>>};
pack(10931, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10931:16,
       D_a_t_a/binary>>};
pack(10945, cli, {V0_card_id}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_card_id))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10945:16,
       D_a_t_a/binary>>};
pack(10945, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10945:16,
       D_a_t_a/binary>>};
pack(10946, cli, {}) -> {ok, <<2:32, 10946:16>>};
pack(10946, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10946:16,
       D_a_t_a/binary>>};
pack(10947, cli, {V0_charge_id, V0_notify_url}) ->
    D_a_t_a = <<V0_charge_id:32,
		(protocol:pack(string, V0_notify_url))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10947:16,
       D_a_t_a/binary>>};
pack(10947, srv, {V0_code, V0_url}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_url))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10947:16,
       D_a_t_a/binary>>};
pack(10950, cli, {}) -> {ok, <<2:32, 10950:16>>};
pack(10950, srv, {V0_type, V0_board_list}) ->
    D_a_t_a = <<V0_type:8, (length(V0_board_list)):16,
		(list_to_binary([<<V1_id:32, V1_type:8,
				   (protocol:pack(string, V1_title))/binary,
				   (protocol:pack(string, V1_summary))/binary,
				   (protocol:pack(string, V1_content))/binary,
				   V1_start_time:32, V1_end_time:32, V1_flag:8>>
				 || {#notice_board{id = V1_id, type = V1_type,
						   title = V1_title,
						   summary = V1_summary,
						   content = V1_content,
						   start_time = V1_start_time,
						   end_time = V1_end_time},
				     V1_flag}
					<- V0_board_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10950:16,
       D_a_t_a/binary>>};
pack(10951, srv, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10951:16,
       D_a_t_a/binary>>};
pack(10952, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10952:16,
       D_a_t_a/binary>>};
pack(10952, srv, {V0_code, V0_msg, V0_id}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10952:16,
       D_a_t_a/binary>>};
pack(10955, cli, {}) -> {ok, <<2:32, 10955:16>>};
pack(10955, srv, {V0_key, V0_val}) ->
    D_a_t_a = <<V0_key:16, V0_val:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10955:16,
       D_a_t_a/binary>>};
pack(10956, cli, {V0_key, V0_val}) ->
    D_a_t_a = <<V0_key:16, V0_val:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10956:16,
       D_a_t_a/binary>>};
pack(10956, srv, {}) -> {ok, <<2:32, 10956:16>>};
pack(10957, cli, {}) -> {ok, <<2:32, 10957:16>>};
pack(10957, srv, {}) -> {ok, <<2:32, 10957:16>>};
pack(10958, cli, {V0_combat_msg}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_combat_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10958:16,
       D_a_t_a/binary>>};
pack(10958, srv, {}) -> {ok, <<2:32, 10958:16>>};
pack(10960, cli, {}) -> {ok, <<2:32, 10960:16>>};
pack(10960, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10960:16,
       D_a_t_a/binary>>};
pack(10961, cli, {}) -> {ok, <<2:32, 10961:16>>};
pack(10961, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10961:16,
       D_a_t_a/binary>>};
pack(10971, cli, {V0_bid}) ->
    D_a_t_a = <<V0_bid:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10971:16,
       D_a_t_a/binary>>};
pack(10971, srv, {V0_code, V0_msg, V0_token}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(protocol:pack(string, V0_token))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10971:16,
       D_a_t_a/binary>>};
pack(10985, cli, {}) -> {ok, <<2:32, 10985:16>>};
pack(10985, srv, {V0_id_list}) ->
    D_a_t_a = <<(length(V0_id_list)):16,
		(list_to_binary([<<V1_id:32>>
				 || V1_id <- V0_id_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10985:16,
       D_a_t_a/binary>>};
pack(10986, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10986:16,
       D_a_t_a/binary>>};
pack(10986, srv, {}) -> {ok, <<2:32, 10986:16>>};
pack(10987, cli, {}) -> {ok, <<2:32, 10987:16>>};
pack(10987, srv, {V0_is_point}) ->
    D_a_t_a = <<V0_is_point:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10987:16,
       D_a_t_a/binary>>};
pack(10988, cli, {}) -> {ok, <<2:32, 10988:16>>};
pack(10988, srv, {}) -> {ok, <<2:32, 10988:16>>};
pack(10989, cli, {}) -> {ok, <<2:32, 10989:16>>};
pack(10989, srv, {V0_id, V0_start_unixtime}) ->
    D_a_t_a = <<V0_id:32, V0_start_unixtime:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10989:16,
       D_a_t_a/binary>>};
pack(10990, cli, {V0_code, V0_cmd}) ->
    D_a_t_a = <<V0_code:32, V0_cmd:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10990:16,
       D_a_t_a/binary>>};
pack(10990, srv, {V0_flag, V0_cmd, V0_img}) ->
    D_a_t_a = <<V0_flag:8, V0_cmd:32,
		(protocol:pack(byte, V0_img))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10990:16,
       D_a_t_a/binary>>};
pack(10991, cli, {}) -> {ok, <<2:32, 10991:16>>};
pack(10991, srv,
     {V0_status, V0_is_vote, V0_flag, V0_last_time}) ->
    D_a_t_a = <<V0_status:8, V0_is_vote:8, V0_flag:8,
		V0_last_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10991:16,
       D_a_t_a/binary>>};
pack(10992, cli, {}) -> {ok, <<2:32, 10992:16>>};
pack(10992, srv,
     {V0_flag, V0_msg, V0_agreepoints, V0_disagreepoints,
      V0_id}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary,
		V0_agreepoints:32, V0_disagreepoints:32, V0_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10992:16,
       D_a_t_a/binary>>};
pack(10993, cli, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10993:16,
       D_a_t_a/binary>>};
pack(10993, srv, {V0_flag, V0_msg}) ->
    D_a_t_a = <<V0_flag:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10993:16,
       D_a_t_a/binary>>};
pack(10994, srv, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10994:16,
       D_a_t_a/binary>>};
pack(10995, srv, {V0_main_srv_id, V0_srv_list}) ->
    D_a_t_a = <<(protocol:pack(string,
			       V0_main_srv_id))/binary,
		(length(V0_srv_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_srv_id))/binary>>
				 || V1_srv_id <- V0_srv_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10995:16,
       D_a_t_a/binary>>};
pack(10996, srv, {V0_cli_ver_list}) ->
    D_a_t_a = <<(length(V0_cli_ver_list)):16,
		(list_to_binary([<<(protocol:pack(string,
						  V1_cdn_patch))/binary,
				   V1_cli_ver:16>>
				 || {V1_cdn_patch, V1_cli_ver}
					<- V0_cli_ver_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10996:16,
       D_a_t_a/binary>>};
pack(10997, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10997:16,
       D_a_t_a/binary>>};
pack(10999, cli, {V0_msg}) ->
    D_a_t_a = <<(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 10999:16,
       D_a_t_a/binary>>};
pack(10999, srv, {}) -> {ok, <<2:32, 10999:16>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(10900, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_hour, _B3} = protocol:uint32(_B2),
    {V1_interdict, _B4} = protocol:string(_B3),
    {ok, {V1_rid, V1_srv_id, V1_hour, V1_interdict}};
unpack(10900, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(10901, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_hour, _B3} = protocol:uint32(_B2),
    {V1_banned, _B4} = protocol:string(_B3),
    {ok, {V1_rid, V1_srv_id, V1_hour, V1_banned}};
unpack(10901, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(10902, srv, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_stop_role, _B3} = protocol:string(_B2),
    {ok, {V1_rid, V1_srv_id, V1_stop_role}};
unpack(10902, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(10905, srv, _B0) -> {ok, {}};
unpack(10905, cli, _B0) ->
    {V1_world_lev, _B1} = protocol:uint8(_B0),
    {ok, {V1_world_lev}};
unpack(10906, srv, _B0) -> {ok, {}};
unpack(10906, cli, _B0) ->
    {V1_open_day, _B1} = protocol:uint32(_B0),
    {ok, {V1_open_day}};
unpack(10907, srv, _B0) -> {ok, {}};
unpack(10907, cli, _B0) ->
    {V1_sys_ban, _B1} = protocol:uint8(_B0),
    {ok, {V1_sys_ban}};
unpack(10911, cli, _B0) ->
    {V1_rid, _B1} = protocol:uint32(_B0),
    {V1_srv_id, _B2} = protocol:string(_B1),
    {V1_buffs, _B13} = protocol:array(_B2,
				      fun (_B3) ->
					      {V2_bid, _B4} =
						  protocol:uint32(_B3),
					      {V2_duration, _B5} =
						  protocol:uint32(_B4),
					      {V2_count, _B6} =
						  protocol:uint8(_B5),
					      {V2_effect, _B11} =
						  protocol:array(_B6,
								 fun (_B7) ->
									 {V3_key,
									  _B8} =
									     protocol:uint8(_B7),
									 {V3_val,
									  _B9} =
									     protocol:uint32(_B8),
									 {{V3_key,
									   V3_val},
									  _B9}
								 end),
					      {{V2_bid, V2_duration, V2_count,
						V2_effect},
					       _B11}
				      end),
    {ok, {V1_rid, V1_srv_id, V1_buffs}};
unpack(10912, cli, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0),
    {V1_effect, _B6} = protocol:array(_B1,
				      fun (_B2) ->
					      {V2_key, _B3} =
						  protocol:uint8(_B2),
					      {V2_val, _B4} =
						  protocol:uint32(_B3),
					      {{V2_key, V2_val}, _B4}
				      end),
    {ok, {V1_bid, V1_effect}};
unpack(10913, cli, _B0) ->
    {V1_buffs, _B12} = protocol:array(_B0,
				      fun (_B1) ->
					      {V2_change_type, _B2} =
						  protocol:uint8(_B1),
					      {V2_bid, _B3} =
						  protocol:uint32(_B2),
					      {V2_duration, _B4} =
						  protocol:uint32(_B3),
					      {V2_count, _B5} =
						  protocol:uint8(_B4),
					      {V2_effect, _B10} =
						  protocol:array(_B5,
								 fun (_B6) ->
									 {V3_key,
									  _B7} =
									     protocol:uint8(_B6),
									 {V3_val,
									  _B8} =
									     protocol:int32(_B7),
									 {{V3_key,
									   V3_val},
									  _B8}
								 end),
					      {{V2_change_type, V2_bid,
						V2_duration, V2_count,
						V2_effect},
					       _B10}
				      end),
    {ok, {V1_buffs}};
unpack(10922, srv, _B0) -> {ok, {}};
unpack(10922, cli, _B0) ->
    {V1_act_list, _B15} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_id, _B2} =
						     protocol:uint16(_B1),
						 {V2_status, _B3} =
						     protocol:uint8(_B2),
						 {V2_int_args, _B7} =
						     protocol:array(_B3,
								    fun (_B4) ->
									    {V3_val,
									     _B5} =
										protocol:uint32(_B4),
									    {V3_val,
									     _B5}
								    end),
						 {V2_ext_args, _B13} =
						     protocol:array(_B7,
								    fun (_B8) ->
									    {V3_type,
									     _B9} =
										protocol:uint8(_B8),
									    {V3_val,
									     _B10} =
										protocol:uint32(_B9),
									    {V3_str,
									     _B11} =
										protocol:string(_B10),
									    {{V3_type,
									      V3_val,
									      V3_str},
									     _B11}
								    end),
						 {{V2_id, V2_status,
						   V2_int_args, V2_ext_args},
						  _B13}
					 end),
    {ok, {V1_act_list}};
unpack(10923, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(10923, cli, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {V1_int_args, _B6} = protocol:array(_B2,
					fun (_B3) ->
						{V2_val, _B4} =
						    protocol:uint32(_B3),
						{V2_val, _B4}
					end),
    {V1_ext_args, _B12} = protocol:array(_B6,
					 fun (_B7) ->
						 {V2_type, _B8} =
						     protocol:uint8(_B7),
						 {V2_val, _B9} =
						     protocol:uint32(_B8),
						 {V2_str, _B10} =
						     protocol:string(_B9),
						 {{V2_type, V2_val, V2_str},
						  _B10}
					 end),
    {ok, {V1_id, V1_status, V1_int_args, V1_ext_args}};
unpack(10924, srv, _B0) -> {ok, {}};
unpack(10924, cli, _B0) ->
    {V1_act_list, _B15} = protocol:array(_B0,
					 fun (_B1) ->
						 {V2_id, _B2} =
						     protocol:uint16(_B1),
						 {V2_status, _B3} =
						     protocol:uint8(_B2),
						 {V2_int_args, _B7} =
						     protocol:array(_B3,
								    fun (_B4) ->
									    {V3_val,
									     _B5} =
										protocol:uint32(_B4),
									    {V3_val,
									     _B5}
								    end),
						 {V2_ext_args, _B13} =
						     protocol:array(_B7,
								    fun (_B8) ->
									    {V3_type,
									     _B9} =
										protocol:uint8(_B8),
									    {V3_val,
									     _B10} =
										protocol:uint32(_B9),
									    {V3_str,
									     _B11} =
										protocol:string(_B10),
									    {{V3_type,
									      V3_val,
									      V3_str},
									     _B11}
								    end),
						 {{V2_id, V2_status,
						   V2_int_args, V2_ext_args},
						  _B13}
					 end),
    {ok, {V1_act_list}};
unpack(10925, srv, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0), {ok, {V1_id}};
unpack(10925, cli, _B0) ->
    {V1_id, _B1} = protocol:uint16(_B0),
    {V1_status, _B2} = protocol:uint8(_B1),
    {V1_int_args, _B6} = protocol:array(_B2,
					fun (_B3) ->
						{V2_val, _B4} =
						    protocol:uint32(_B3),
						{V2_val, _B4}
					end),
    {V1_ext_args, _B12} = protocol:array(_B6,
					 fun (_B7) ->
						 {V2_type, _B8} =
						     protocol:uint8(_B7),
						 {V2_val, _B9} =
						     protocol:uint32(_B8),
						 {V2_str, _B10} =
						     protocol:string(_B9),
						 {{V2_type, V2_val, V2_str},
						  _B10}
					 end),
    {ok, {V1_id, V1_status, V1_int_args, V1_ext_args}};
unpack(10926, srv, _B0) -> {ok, {}};
unpack(10926, cli, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0),
    {V1_list, _B5} = protocol:array(_B1,
				    fun (_B2) ->
					    {V2_time, _B3} =
						protocol:uint32(_B2),
					    {V2_time, _B3}
				    end),
    {ok, {V1_time, V1_list}};
unpack(10927, srv, _B0) ->
    {V1_time, _B1} = protocol:uint32(_B0), {ok, {V1_time}};
unpack(10927, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_time, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_time}};
unpack(10928, srv, _B0) -> {ok, {}};
unpack(10928, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(10929, srv, _B0) -> {ok, {}};
unpack(10929, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(10930, srv, _B0) -> {ok, {}};
unpack(10930, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_open_timestamp, _B2} = protocol:uint32(_B1),
    {ok, {V1_code, V1_open_timestamp}};
unpack(10931, srv, _B0) -> {ok, {}};
unpack(10931, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(10945, srv, _B0) ->
    {V1_card_id, _B1} = protocol:string(_B0),
    {ok, {V1_card_id}};
unpack(10945, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(10946, srv, _B0) -> {ok, {}};
unpack(10946, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(10947, srv, _B0) ->
    {V1_charge_id, _B1} = protocol:uint32(_B0),
    {V1_notify_url, _B2} = protocol:string(_B1),
    {ok, {V1_charge_id, V1_notify_url}};
unpack(10947, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_url, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_url}};
unpack(10950, srv, _B0) -> {ok, {}};
unpack(10950, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_board_list, _B12} = protocol:array(_B1,
					   fun (_B2) ->
						   {V2_id, _B3} =
						       protocol:uint32(_B2),
						   {V2_type, _B4} =
						       protocol:uint8(_B3),
						   {V2_title, _B5} =
						       protocol:string(_B4),
						   {V2_summary, _B6} =
						       protocol:string(_B5),
						   {V2_content, _B7} =
						       protocol:string(_B6),
						   {V2_start_time, _B8} =
						       protocol:uint32(_B7),
						   {V2_end_time, _B9} =
						       protocol:uint32(_B8),
						   {V2_flag, _B10} =
						       protocol:uint8(_B9),
						   {{V2_id, V2_type, V2_title,
						     V2_summary, V2_content,
						     V2_start_time, V2_end_time,
						     V2_flag},
						    _B10}
					   end),
    {ok, {V1_type, V1_board_list}};
unpack(10951, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(10952, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(10952, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_id, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_id}};
unpack(10955, srv, _B0) -> {ok, {}};
unpack(10955, cli, _B0) ->
    {V1_key, _B1} = protocol:uint16(_B0),
    {V1_val, _B2} = protocol:uint32(_B1),
    {ok, {V1_key, V1_val}};
unpack(10956, srv, _B0) ->
    {V1_key, _B1} = protocol:uint16(_B0),
    {V1_val, _B2} = protocol:uint32(_B1),
    {ok, {V1_key, V1_val}};
unpack(10956, cli, _B0) -> {ok, {}};
unpack(10957, srv, _B0) -> {ok, {}};
unpack(10957, cli, _B0) -> {ok, {}};
unpack(10958, srv, _B0) ->
    {V1_combat_msg, _B1} = protocol:string(_B0),
    {ok, {V1_combat_msg}};
unpack(10958, cli, _B0) -> {ok, {}};
unpack(10960, srv, _B0) -> {ok, {}};
unpack(10960, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(10961, srv, _B0) -> {ok, {}};
unpack(10961, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(10971, srv, _B0) ->
    {V1_bid, _B1} = protocol:uint32(_B0), {ok, {V1_bid}};
unpack(10971, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_token, _B3} = protocol:string(_B2),
    {ok, {V1_code, V1_msg, V1_token}};
unpack(10985, srv, _B0) -> {ok, {}};
unpack(10985, cli, _B0) ->
    {V1_id_list, _B4} = protocol:array(_B0,
				       fun (_B1) ->
					       {V2_id, _B2} =
						   protocol:uint32(_B1),
					       {V2_id, _B2}
				       end),
    {ok, {V1_id_list}};
unpack(10986, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(10986, cli, _B0) -> {ok, {}};
unpack(10987, srv, _B0) -> {ok, {}};
unpack(10987, cli, _B0) ->
    {V1_is_point, _B1} = protocol:uint8(_B0),
    {ok, {V1_is_point}};
unpack(10988, srv, _B0) -> {ok, {}};
unpack(10988, cli, _B0) -> {ok, {}};
unpack(10989, srv, _B0) -> {ok, {}};
unpack(10989, cli, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_start_unixtime, _B2} = protocol:uint32(_B1),
    {ok, {V1_id, V1_start_unixtime}};
unpack(10990, srv, _B0) ->
    {V1_code, _B1} = protocol:uint32(_B0),
    {V1_cmd, _B2} = protocol:uint32(_B1),
    {ok, {V1_code, V1_cmd}};
unpack(10990, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_cmd, _B2} = protocol:uint32(_B1),
    {V1_img, _B3} = protocol:byte(_B2),
    {ok, {V1_flag, V1_cmd, V1_img}};
unpack(10991, srv, _B0) -> {ok, {}};
unpack(10991, cli, _B0) ->
    {V1_status, _B1} = protocol:uint8(_B0),
    {V1_is_vote, _B2} = protocol:uint8(_B1),
    {V1_flag, _B3} = protocol:uint8(_B2),
    {V1_last_time, _B4} = protocol:uint32(_B3),
    {ok, {V1_status, V1_is_vote, V1_flag, V1_last_time}};
unpack(10992, srv, _B0) -> {ok, {}};
unpack(10992, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_agreepoints, _B3} = protocol:uint32(_B2),
    {V1_disagreepoints, _B4} = protocol:uint32(_B3),
    {V1_id, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_flag, V1_msg, V1_agreepoints, V1_disagreepoints,
      V1_id}};
unpack(10993, srv, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(10993, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_flag, V1_msg}};
unpack(10994, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(10995, cli, _B0) ->
    {V1_main_srv_id, _B1} = protocol:string(_B0),
    {V1_srv_list, _B5} = protocol:array(_B1,
					fun (_B2) ->
						{V2_srv_id, _B3} =
						    protocol:string(_B2),
						{V2_srv_id, _B3}
					end),
    {ok, {V1_main_srv_id, V1_srv_list}};
unpack(10996, cli, _B0) ->
    {V1_cli_ver_list, _B5} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_cdn_patch, _B2} =
							protocol:string(_B1),
						    {V2_cli_ver, _B3} =
							protocol:uint16(_B2),
						    {{V2_cdn_patch, V2_cli_ver},
						     _B3}
					    end),
    {ok, {V1_cli_ver_list}};
unpack(10997, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(10999, srv, _B0) ->
    {V1_msg, _B1} = protocol:string(_B0), {ok, {V1_msg}};
unpack(10999, cli, _B0) -> {ok, {}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


