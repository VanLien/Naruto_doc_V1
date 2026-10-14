-file("src/proto/proto_134.erl", 1).

-module(proto_134).

-lager_records([{exchange_data_other,
		 [lv, type, pos, item_id, itemname, item_num, pro, price,
		  pay_type, limit_lev, limit_day]},
		{exchange_expire_gift,
		 [ver, eid, base_id, bind, num, timeout, reward_time]},
		{exchange_other,
		 [ver, type, pos, item_id, itemname, item_num, price,
		  pay_type, status]},
		{m_shop,
		 [ver, ref_time_list, items, expire_list, extra]},
		{exchange_data,
		 [type, type2, id, item_bid, day, item_name, item_num,
		  bind, pay_type, price, limit_vip, limit_day, limit_week,
		  limit_month, glev, lev, is_partner, goods_type,
		  limit_count, label, discount, limit_rank, buy_condit,
		  limit_soft, buy_stage, open_srv_timestamp,
		  arena_elite_lev]},
		{exchange_ref,
		 [type_type, lev, type, order, item_bid, item_name,
		  item_num, pro, price, pay_type, has_buy, item_type,
		  label, discount, limit_count, assets_range, pay_type2,
		  flag, item, id, limit_day, limit_week, limit_month,
		  item_desc]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/exchange.hrl", 1).

-record(exchange_ref,
	{type_type = 0, lev = {0, 0}, type = 0, order = 0,
	 item_bid = 0, item_name = <<>>, item_num = 0, pro = 0,
	 price = 0, pay_type = 0, has_buy = 0, item_type = 0,
	 label = 0, discount = 0, limit_count = 0,
	 assets_range = {-1, 0}, pay_type2 = {0, 0}, flag = 1,
	 item = [], id = 0, limit_day = 0, limit_week = 0,
	 limit_month = 0, item_desc = <<>>}).

-record(exchange_data,
	{type = 0, type2 = 0, id = 0, item_bid = 0, day = 0,
	 item_name = <<>>, item_num = 0, bind = 1, pay_type = 0,
	 price = 0, limit_vip = 0, limit_day = 0, limit_week = 0,
	 limit_month = 0, glev = 0, lev = 0, is_partner = 0,
	 goods_type = 0, limit_count = 0, label = 0,
	 discount = 0, limit_rank = 0, buy_condit = 0,
	 limit_soft = 0, buy_stage = 0, open_srv_timestamp = 0,
	 arena_elite_lev = 0}).

-record(m_shop,
	{ver = 3, ref_time_list = [], items = [],
	 expire_list = [], extra = []}).

-record(exchange_other,
	{ver = 1, type = 0, pos = 0, item_id, itemname,
	 item_num, price, pay_type, status = 0}).

-record(exchange_expire_gift,
	{ver = 1, eid = 0, base_id = 0, bind = 0, num = 0,
	 timeout = 0, reward_time = 0}).

-record(exchange_data_other,
	{lv = {1, 999}, type, pos, item_id, itemname, item_num,
	 pro, price, pay_type, limit_lev = 0, limit_day = 1}).

-file("src/proto/proto_134.erl", 16).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(13401, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13401:16,
       D_a_t_a/binary>>};
pack(13401, srv,
     {V0_code, V0_msg, V0_type, V0_is_half, V0_item_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:8,
		V0_is_half:8, (length(V0_item_list)):16,
		(list_to_binary([<<V1_item_id:32, (length(V1_ext)):16,
				   (list_to_binary([<<V2_key:8, V2_val:32>>
						    || {V2_key, V2_val}
							   <- V1_ext]))/binary>>
				 || {V1_item_id, V1_ext}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13401:16,
       D_a_t_a/binary>>};
pack(13402, cli, {V0_eid, V0_num}) ->
    D_a_t_a = <<V0_eid:32, V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13402:16,
       D_a_t_a/binary>>};
pack(13402, srv,
     {V0_code, V0_type, V0_eid, V0_is_half, V0_ext,
      V0_msg}) ->
    D_a_t_a = <<V0_code:8, V0_type:8, V0_eid:32,
		V0_is_half:8, (length(V0_ext)):16,
		(list_to_binary([<<V1_key:8, V1_val:32>>
				 || {V1_key, V1_val} <- V0_ext]))/binary,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13402:16,
       D_a_t_a/binary>>};
pack(13403, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13403:16,
       D_a_t_a/binary>>};
pack(13403, srv,
     {V0_type, V0_code, V0_msg, V0_count, V0_free_count,
      V0_num, V0_refresh_time, V0_item_list}) ->
    D_a_t_a = <<V0_type:32, V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32,
		V0_free_count:32, V0_num:32, V0_refresh_time:32,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_item_id:32, V1_item_num:32,
				   V1_order:32, V1_price:32, V1_type:8,
				   V1_pay_type:32, V1_has_buy:32,
				   V1_limit_count:32, V1_limit_day:32,
				   V1_limit_week:32, V1_limit_month:32,
				   V1_discount_type:32, V1_discount:32,
				   (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_type:8,
						      V2_val:32>>
						    || {V2_attr_type, V2_val}
							   <- V1_main_attr]))/binary,
				   V1_pay_type2:32, V1_price2:32, V1_score:32,
				   (protocol:pack(string,
						  V1_item_desc))/binary>>
				 || {V1_item_id, V1_item_num, V1_order,
				     V1_price, V1_type, V1_pay_type, V1_has_buy,
				     V1_limit_count, V1_limit_day,
				     V1_limit_week, V1_limit_month,
				     V1_discount_type, V1_discount,
				     V1_main_attr, V1_pay_type2, V1_price2,
				     V1_score, V1_item_desc}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13403:16,
       D_a_t_a/binary>>};
pack(13404, srv, {}) -> {ok, <<2:32, 13404:16>>};
pack(13405, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13405:16,
       D_a_t_a/binary>>};
pack(13405, srv,
     {V0_type, V0_code, V0_msg, V0_count, V0_free_count,
      V0_num, V0_refresh_time, V0_item_list}) ->
    D_a_t_a = <<V0_type:32, V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32,
		V0_free_count:32, V0_num:32, V0_refresh_time:32,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_item_id:32, V1_item_num:32,
				   V1_order:32, V1_price:32, V1_type:8,
				   V1_pay_type:32, V1_has_buy:32,
				   V1_limit_count:32, V1_limit_day:32,
				   V1_limit_week:32, V1_limit_month:32,
				   V1_discount_type:32, V1_discount:32,
				   (length(V1_main_attr)):16,
				   (list_to_binary([<<V2_attr_type:8,
						      V2_val:32>>
						    || {V2_attr_type, V2_val}
							   <- V1_main_attr]))/binary,
				   V1_pay_type2:32, V1_price2:32, V1_score:32,
				   (protocol:pack(string,
						  V1_item_desc))/binary>>
				 || {V1_item_id, V1_item_num, V1_order,
				     V1_price, V1_type, V1_pay_type, V1_has_buy,
				     V1_limit_count, V1_limit_day,
				     V1_limit_week, V1_limit_month,
				     V1_discount_type, V1_discount,
				     V1_main_attr, V1_pay_type2, V1_price2,
				     V1_score, V1_item_desc}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13405:16,
       D_a_t_a/binary>>};
pack(13407, cli,
     {V0_order, V0_type, V0_buy_type, V0_num}) ->
    D_a_t_a = <<V0_order:32, V0_type:32, V0_buy_type:32,
		V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13407:16,
       D_a_t_a/binary>>};
pack(13407, srv,
     {V0_code, V0_msg, V0_order, V0_num, V0_type}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_order:32,
		V0_num:32, V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13407:16,
       D_a_t_a/binary>>};
pack(13408, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13408:16,
       D_a_t_a/binary>>};
pack(13408, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13408:16,
       D_a_t_a/binary>>};
pack(13409, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13409:16,
       D_a_t_a/binary>>};
pack(13409, srv,
     {V0_code, V0_msg, V0_count, V0_item_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_pos:32, V1_item_id:32,
				   V1_item_num:32, V1_price:32, V1_status:32>>
				 || #exchange_other{pos = V1_pos,
						    item_id = V1_item_id,
						    item_num = V1_item_num,
						    price = V1_price,
						    status = V1_status}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13409:16,
       D_a_t_a/binary>>};
pack(13410, cli, {V0_type, V0_pos}) ->
    D_a_t_a = <<V0_type:8, V0_pos:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13410:16,
       D_a_t_a/binary>>};
pack(13410, srv, {V0_code, V0_msg, V0_item_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_pos:32, V1_item_id:32,
				   V1_item_num:32, V1_price:32, V1_status:32>>
				 || #exchange_other{pos = V1_pos,
						    item_id = V1_item_id,
						    item_num = V1_item_num,
						    price = V1_price,
						    status = V1_status}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13410:16,
       D_a_t_a/binary>>};
pack(13411, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13411:16,
       D_a_t_a/binary>>};
pack(13411, srv,
     {V0_code, V0_msg, V0_count, V0_item_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_count:32,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_pos:32, V1_item_id:32,
				   V1_item_num:32, V1_price:32, V1_status:32>>
				 || #exchange_other{pos = V1_pos,
						    item_id = V1_item_id,
						    item_num = V1_item_num,
						    price = V1_price,
						    status = V1_status}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13411:16,
       D_a_t_a/binary>>};
pack(13412, cli, {}) -> {ok, <<2:32, 13412:16>>};
pack(13412, srv,
     {V0_code, V0_msg, V0_type, V0_day, V0_item_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:32,
		V0_day:32, (length(V0_item_list)):16,
		(list_to_binary([<<V1_item_id:32, V1_status:32>>
				 || {V1_item_id, V1_status}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13412:16,
       D_a_t_a/binary>>};
pack(13413, cli, {V0_id}) ->
    D_a_t_a = <<V0_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13413:16,
       D_a_t_a/binary>>};
pack(13413, srv,
     {V0_code, V0_msg, V0_type, V0_day, V0_item_list}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_type:32,
		V0_day:32, (length(V0_item_list)):16,
		(list_to_binary([<<V1_item_id:32, V1_status:32>>
				 || {V1_item_id, V1_status}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13413:16,
       D_a_t_a/binary>>};
pack(13414, cli, {}) -> {ok, <<2:32, 13414:16>>};
pack(13414, srv, {V0_code}) ->
    D_a_t_a = <<V0_code:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13414:16,
       D_a_t_a/binary>>};
pack(13415, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13415:16,
       D_a_t_a/binary>>};
pack(13415, srv,
     {V0_type, V0_count, V0_max_count, V0_free_count,
      V0_max_free_count, V0_item_list}) ->
    D_a_t_a = <<V0_type:32, V0_count:16, V0_max_count:16,
		V0_free_count:8, V0_max_free_count:8,
		(length(V0_item_list)):16,
		(list_to_binary([<<V1_order:8, V1_item_id:32,
				   V1_item_num:32, V1_price:32, V1_type:8,
				   V1_pay_type:8, V1_buycount:32,
				   V1_discount_type:32, V1_discount:32>>
				 || {V1_order, V1_item_id, V1_item_num,
				     V1_price, V1_type, V1_pay_type,
				     V1_buycount, V1_discount_type, V1_discount}
					<- V0_item_list]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13415:16,
       D_a_t_a/binary>>};
pack(13416, cli, {V0_order, V0_type, V0_buy_type}) ->
    D_a_t_a = <<V0_order:32, V0_type:32, V0_buy_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13416:16,
       D_a_t_a/binary>>};
pack(13416, srv, {V0_code, V0_msg, V0_order}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary, V0_order:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13416:16,
       D_a_t_a/binary>>};
pack(13417, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13417:16,
       D_a_t_a/binary>>};
pack(13417, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13417:16,
       D_a_t_a/binary>>};
pack(13418, srv, {}) -> {ok, <<2:32, 13418:16>>};
pack(13419, cli, {V0_num}) ->
    D_a_t_a = <<V0_num:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13419:16,
       D_a_t_a/binary>>};
pack(13419, srv, {V0_code, V0_msg}) ->
    D_a_t_a = <<V0_code:8,
		(protocol:pack(string, V0_msg))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13419:16,
       D_a_t_a/binary>>};
pack(13420, cli, {}) -> {ok, <<2:32, 13420:16>>};
pack(13420, srv,
     {V0_type, V0_count, V0_free_count, V0_refresh_time}) ->
    D_a_t_a = <<V0_type:32, V0_count:32, V0_free_count:32,
		V0_refresh_time:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 13420:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(13401, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(13401, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint8(_B2),
    {V1_is_half, _B4} = protocol:uint8(_B3),
    {V1_item_list, _B13} = protocol:array(_B4,
					  fun (_B5) ->
						  {V2_item_id, _B6} =
						      protocol:uint32(_B5),
						  {V2_ext, _B11} =
						      protocol:array(_B6,
								     fun
								       (_B7) ->
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
						  {{V2_item_id, V2_ext}, _B11}
					  end),
    {ok,
     {V1_code, V1_msg, V1_type, V1_is_half, V1_item_list}};
unpack(13402, srv, _B0) ->
    {V1_eid, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint32(_B1),
    {ok, {V1_eid, V1_num}};
unpack(13402, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_type, _B2} = protocol:uint8(_B1),
    {V1_eid, _B3} = protocol:uint32(_B2),
    {V1_is_half, _B4} = protocol:uint8(_B3),
    {V1_ext, _B9} = protocol:array(_B4,
				   fun (_B5) ->
					   {V2_key, _B6} = protocol:uint8(_B5),
					   {V2_val, _B7} = protocol:uint32(_B6),
					   {{V2_key, V2_val}, _B7}
				   end),
    {V1_msg, _B10} = protocol:string(_B9),
    {ok,
     {V1_code, V1_type, V1_eid, V1_is_half, V1_ext, V1_msg}};
unpack(13403, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0), {ok, {V1_type}};
unpack(13403, cli, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_count, _B4} = protocol:uint32(_B3),
    {V1_free_count, _B5} = protocol:uint32(_B4),
    {V1_num, _B6} = protocol:uint32(_B5),
    {V1_refresh_time, _B7} = protocol:uint32(_B6),
    {V1_item_list, _B32} = protocol:array(_B7,
					  fun (_B8) ->
						  {V2_item_id, _B9} =
						      protocol:uint32(_B8),
						  {V2_item_num, _B10} =
						      protocol:uint32(_B9),
						  {V2_order, _B11} =
						      protocol:uint32(_B10),
						  {V2_price, _B12} =
						      protocol:uint32(_B11),
						  {V2_type, _B13} =
						      protocol:uint8(_B12),
						  {V2_pay_type, _B14} =
						      protocol:uint32(_B13),
						  {V2_has_buy, _B15} =
						      protocol:uint32(_B14),
						  {V2_limit_count, _B16} =
						      protocol:uint32(_B15),
						  {V2_limit_day, _B17} =
						      protocol:uint32(_B16),
						  {V2_limit_week, _B18} =
						      protocol:uint32(_B17),
						  {V2_limit_month, _B19} =
						      protocol:uint32(_B18),
						  {V2_discount_type, _B20} =
						      protocol:uint32(_B19),
						  {V2_discount, _B21} =
						      protocol:uint32(_B20),
						  {V2_main_attr, _B26} =
						      protocol:array(_B21,
								     fun
								       (_B22) ->
									   {V3_attr_type,
									    _B23} =
									       protocol:uint8(_B22),
									   {V3_val,
									    _B24} =
									       protocol:uint32(_B23),
									   {{V3_attr_type,
									     V3_val},
									    _B24}
								     end),
						  {V2_pay_type2, _B27} =
						      protocol:uint32(_B26),
						  {V2_price2, _B28} =
						      protocol:uint32(_B27),
						  {V2_score, _B29} =
						      protocol:uint32(_B28),
						  {V2_item_desc, _B30} =
						      protocol:string(_B29),
						  {{V2_item_id, V2_item_num,
						    V2_order, V2_price, V2_type,
						    V2_pay_type, V2_has_buy,
						    V2_limit_count,
						    V2_limit_day, V2_limit_week,
						    V2_limit_month,
						    V2_discount_type,
						    V2_discount, V2_main_attr,
						    V2_pay_type2, V2_price2,
						    V2_score, V2_item_desc},
						   _B30}
					  end),
    {ok,
     {V1_type, V1_code, V1_msg, V1_count, V1_free_count,
      V1_num, V1_refresh_time, V1_item_list}};
unpack(13404, cli, _B0) -> {ok, {}};
unpack(13405, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0), {ok, {V1_type}};
unpack(13405, cli, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_code, _B2} = protocol:uint8(_B1),
    {V1_msg, _B3} = protocol:string(_B2),
    {V1_count, _B4} = protocol:uint32(_B3),
    {V1_free_count, _B5} = protocol:uint32(_B4),
    {V1_num, _B6} = protocol:uint32(_B5),
    {V1_refresh_time, _B7} = protocol:uint32(_B6),
    {V1_item_list, _B32} = protocol:array(_B7,
					  fun (_B8) ->
						  {V2_item_id, _B9} =
						      protocol:uint32(_B8),
						  {V2_item_num, _B10} =
						      protocol:uint32(_B9),
						  {V2_order, _B11} =
						      protocol:uint32(_B10),
						  {V2_price, _B12} =
						      protocol:uint32(_B11),
						  {V2_type, _B13} =
						      protocol:uint8(_B12),
						  {V2_pay_type, _B14} =
						      protocol:uint32(_B13),
						  {V2_has_buy, _B15} =
						      protocol:uint32(_B14),
						  {V2_limit_count, _B16} =
						      protocol:uint32(_B15),
						  {V2_limit_day, _B17} =
						      protocol:uint32(_B16),
						  {V2_limit_week, _B18} =
						      protocol:uint32(_B17),
						  {V2_limit_month, _B19} =
						      protocol:uint32(_B18),
						  {V2_discount_type, _B20} =
						      protocol:uint32(_B19),
						  {V2_discount, _B21} =
						      protocol:uint32(_B20),
						  {V2_main_attr, _B26} =
						      protocol:array(_B21,
								     fun
								       (_B22) ->
									   {V3_attr_type,
									    _B23} =
									       protocol:uint8(_B22),
									   {V3_val,
									    _B24} =
									       protocol:uint32(_B23),
									   {{V3_attr_type,
									     V3_val},
									    _B24}
								     end),
						  {V2_pay_type2, _B27} =
						      protocol:uint32(_B26),
						  {V2_price2, _B28} =
						      protocol:uint32(_B27),
						  {V2_score, _B29} =
						      protocol:uint32(_B28),
						  {V2_item_desc, _B30} =
						      protocol:string(_B29),
						  {{V2_item_id, V2_item_num,
						    V2_order, V2_price, V2_type,
						    V2_pay_type, V2_has_buy,
						    V2_limit_count,
						    V2_limit_day, V2_limit_week,
						    V2_limit_month,
						    V2_discount_type,
						    V2_discount, V2_main_attr,
						    V2_pay_type2, V2_price2,
						    V2_score, V2_item_desc},
						   _B30}
					  end),
    {ok,
     {V1_type, V1_code, V1_msg, V1_count, V1_free_count,
      V1_num, V1_refresh_time, V1_item_list}};
unpack(13407, srv, _B0) ->
    {V1_order, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint32(_B1),
    {V1_buy_type, _B3} = protocol:uint32(_B2),
    {V1_num, _B4} = protocol:uint32(_B3),
    {ok, {V1_order, V1_type, V1_buy_type, V1_num}};
unpack(13407, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_order, _B3} = protocol:uint32(_B2),
    {V1_num, _B4} = protocol:uint32(_B3),
    {V1_type, _B5} = protocol:uint32(_B4),
    {ok, {V1_code, V1_msg, V1_order, V1_num, V1_type}};
unpack(13408, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(13408, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(13409, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(13409, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {V1_item_list, _B11} = protocol:array(_B3,
					  fun (_B4) ->
						  {V2_pos, _B5} =
						      protocol:uint32(_B4),
						  {V2_item_id, _B6} =
						      protocol:uint32(_B5),
						  {V2_item_num, _B7} =
						      protocol:uint32(_B6),
						  {V2_price, _B8} =
						      protocol:uint32(_B7),
						  {V2_status, _B9} =
						      protocol:uint32(_B8),
						  {{V2_pos, V2_item_id,
						    V2_item_num, V2_price,
						    V2_status},
						   _B9}
					  end),
    {ok, {V1_code, V1_msg, V1_count, V1_item_list}};
unpack(13410, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_pos, _B2} = protocol:uint32(_B1),
    {ok, {V1_type, V1_pos}};
unpack(13410, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_item_list, _B10} = protocol:array(_B2,
					  fun (_B3) ->
						  {V2_pos, _B4} =
						      protocol:uint32(_B3),
						  {V2_item_id, _B5} =
						      protocol:uint32(_B4),
						  {V2_item_num, _B6} =
						      protocol:uint32(_B5),
						  {V2_price, _B7} =
						      protocol:uint32(_B6),
						  {V2_status, _B8} =
						      protocol:uint32(_B7),
						  {{V2_pos, V2_item_id,
						    V2_item_num, V2_price,
						    V2_status},
						   _B8}
					  end),
    {ok, {V1_code, V1_msg, V1_item_list}};
unpack(13411, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(13411, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_count, _B3} = protocol:uint32(_B2),
    {V1_item_list, _B11} = protocol:array(_B3,
					  fun (_B4) ->
						  {V2_pos, _B5} =
						      protocol:uint32(_B4),
						  {V2_item_id, _B6} =
						      protocol:uint32(_B5),
						  {V2_item_num, _B7} =
						      protocol:uint32(_B6),
						  {V2_price, _B8} =
						      protocol:uint32(_B7),
						  {V2_status, _B9} =
						      protocol:uint32(_B8),
						  {{V2_pos, V2_item_id,
						    V2_item_num, V2_price,
						    V2_status},
						   _B9}
					  end),
    {ok, {V1_code, V1_msg, V1_count, V1_item_list}};
unpack(13412, srv, _B0) -> {ok, {}};
unpack(13412, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint32(_B2),
    {V1_day, _B4} = protocol:uint32(_B3),
    {V1_item_list, _B9} = protocol:array(_B4,
					 fun (_B5) ->
						 {V2_item_id, _B6} =
						     protocol:uint32(_B5),
						 {V2_status, _B7} =
						     protocol:uint32(_B6),
						 {{V2_item_id, V2_status}, _B7}
					 end),
    {ok, {V1_code, V1_msg, V1_type, V1_day, V1_item_list}};
unpack(13413, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0), {ok, {V1_id}};
unpack(13413, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_type, _B3} = protocol:uint32(_B2),
    {V1_day, _B4} = protocol:uint32(_B3),
    {V1_item_list, _B9} = protocol:array(_B4,
					 fun (_B5) ->
						 {V2_item_id, _B6} =
						     protocol:uint32(_B5),
						 {V2_status, _B7} =
						     protocol:uint32(_B6),
						 {{V2_item_id, V2_status}, _B7}
					 end),
    {ok, {V1_code, V1_msg, V1_type, V1_day, V1_item_list}};
unpack(13414, srv, _B0) -> {ok, {}};
unpack(13414, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0), {ok, {V1_code}};
unpack(13415, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0), {ok, {V1_type}};
unpack(13415, cli, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_count, _B2} = protocol:uint16(_B1),
    {V1_max_count, _B3} = protocol:uint16(_B2),
    {V1_free_count, _B4} = protocol:uint8(_B3),
    {V1_max_free_count, _B5} = protocol:uint8(_B4),
    {V1_item_list, _B17} = protocol:array(_B5,
					  fun (_B6) ->
						  {V2_order, _B7} =
						      protocol:uint8(_B6),
						  {V2_item_id, _B8} =
						      protocol:uint32(_B7),
						  {V2_item_num, _B9} =
						      protocol:uint32(_B8),
						  {V2_price, _B10} =
						      protocol:uint32(_B9),
						  {V2_type, _B11} =
						      protocol:uint8(_B10),
						  {V2_pay_type, _B12} =
						      protocol:uint8(_B11),
						  {V2_buycount, _B13} =
						      protocol:uint32(_B12),
						  {V2_discount_type, _B14} =
						      protocol:uint32(_B13),
						  {V2_discount, _B15} =
						      protocol:uint32(_B14),
						  {{V2_order, V2_item_id,
						    V2_item_num, V2_price,
						    V2_type, V2_pay_type,
						    V2_buycount,
						    V2_discount_type,
						    V2_discount},
						   _B15}
					  end),
    {ok,
     {V1_type, V1_count, V1_max_count, V1_free_count,
      V1_max_free_count, V1_item_list}};
unpack(13416, srv, _B0) ->
    {V1_order, _B1} = protocol:uint32(_B0),
    {V1_type, _B2} = protocol:uint32(_B1),
    {V1_buy_type, _B3} = protocol:uint32(_B2),
    {ok, {V1_order, V1_type, V1_buy_type}};
unpack(13416, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {V1_order, _B3} = protocol:uint32(_B2),
    {ok, {V1_code, V1_msg, V1_order}};
unpack(13417, srv, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0), {ok, {V1_type}};
unpack(13417, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13418, cli, _B0) -> {ok, {}};
unpack(13419, srv, _B0) ->
    {V1_num, _B1} = protocol:uint32(_B0), {ok, {V1_num}};
unpack(13419, cli, _B0) ->
    {V1_code, _B1} = protocol:uint8(_B0),
    {V1_msg, _B2} = protocol:string(_B1),
    {ok, {V1_code, V1_msg}};
unpack(13420, srv, _B0) -> {ok, {}};
unpack(13420, cli, _B0) ->
    {V1_type, _B1} = protocol:uint32(_B0),
    {V1_count, _B2} = protocol:uint32(_B1),
    {V1_free_count, _B3} = protocol:uint32(_B2),
    {V1_refresh_time, _B4} = protocol:uint32(_B3),
    {ok,
     {V1_type, V1_count, V1_free_count, V1_refresh_time}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


