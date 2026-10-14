-file("src/proto/proto_235.erl", 1).

-module(proto_235).

-lager_records([{market_price,
		 [base_id, price, assets, source]},
		{market_silver_draw_item,
		 [cell_id, base_id, num, rest, price, pcnt, attrs]},
		{market_silver_item_data,
		 [base_id, type, step, classes, min_lev, max_lev,
		  is_system, is_quest_need, def_price, min_price,
		  max_price, gain_label, open_lev, pre_base_id, pre_pcnt,
		  group, group_id, update_time, chain_type, fix_price,
		  make_pcnt, rand_num]},
		{market_silver_refresh,
		 [id, item_base_id, num, item_attrs, price, cell_id,
		  seller_id, status]},
		{market_silver_price,
		 [ver, item_base_id, price, sellers, deal_price,
		  recover_num, day_recover, day_auto, ext]},
		{market_silver_shop_cell,
		 [ver, cell_id, item_base_id, num, item_attrs, price,
		  expiry, sold_num, status, system_price, percent,
		  sale_time]},
		{market_silver_shop,
		 [ver, rid, max_cell_id, free_ids, cells, name, pid,
		  last_logout]},
		{m_market_silver,
		 [ver, refresh_time, is_first_on_sale, refresh]},
		{market_gold_limit_data,
		 [id, min, max, num, is_show, type]},
		{market_gold_price,
		 [base_id, margin_type, init_price, buy_price, margin]},
		{market_gold_change_item, [base_id, got_list, catalg]},
		{market_gold_item,
		 [id, base_id, stock, init_stock, init_price, def_price,
		  cur_price, margin, margin_acc]},
		{market_gold_item_data,
		 [id, base_id, catalg, init_price, init_stock, open_lev,
		  max_price, min_price, limit_type, limit_num]},
		{m_market_gold, [ver, limit_data]}]).

-export([pack/3, unpack/3, pack_mate/1,
	 convert_data/2]).

-file("inc/market_gold.hrl", 1).

-record(m_market_gold, {ver = 1, limit_data = []}).

-record(market_gold_item_data,
	{id  :: pos_integer(), base_id  :: pos_integer(),
	 catalg  :: pos_integer(),
	 init_price  :: non_neg_integer(),
	 init_stock  :: non_neg_integer(),
	 open_lev  :: non_neg_integer(),
	 max_price  :: non_neg_integer(),
	 min_price  :: non_neg_integer(),
	 limit_type  :: pos_integer(),
	 limit_num  :: non_neg_integer()}).

-record(market_gold_item,
	{id  :: pos_integer(), base_id = 0  :: pos_integer(),
	 stock = 0  :: non_neg_integer(),
	 init_stock = 0  :: non_neg_integer(),
	 init_price = 0  :: non_neg_integer(),
	 def_price = 0  :: non_neg_integer(),
	 cur_price = 0  :: non_neg_integer(),
	 margin = 1000  :: non_neg_integer(),
	 margin_acc = 1000  :: non_neg_integer()}).

-record(market_gold_change_item,
	{base_id = 0  :: pos_integer(),
	 got_list = []  :: list(),
	 catalg = 0  :: pos_integer()}).

-record(market_gold_price,
	{base_id = 0, margin_type = 0, init_price = 0,
	 buy_price = 0, margin = 0}).

-record(market_gold_limit_data,
	{id = 0, min = 0, max = 0, num = 0, is_show = 0,
	 type = 0}).

-file("src/proto/proto_235.erl", 16).

-file("inc/market_silver.hrl", 1).

-record(m_market_silver,
	{ver = 1, refresh_time = 0, is_first_on_sale = 1,
	 refresh = []}).

-record(market_silver_shop,
	{ver = 1, rid, max_cell_id = 0, free_ids = [],
	 cells = [], name = "", pid, last_logout = 0}).

-record(market_silver_shop_cell,
	{ver = 1, cell_id = 0, item_base_id = 0, num = 0,
	 item_attrs = [], price = 0, expiry = 0, sold_num = 0,
	 status = 0, system_price = 0, percent = 100,
	 sale_time = 0}).

-record(market_silver_price,
	{ver = 1, item_base_id = 0, price = 0, sellers = [],
	 deal_price = [], recover_num = 0, day_recover = 0,
	 day_auto = 0, ext = []}).

-record(market_silver_refresh,
	{id = 0, item_base_id = 0, num = 0, item_attrs = [],
	 price = 0, cell_id = 0, seller_id, status = 0}).

-record(market_silver_item_data,
	{base_id = 0, type = 0, step = 0, classes = 0,
	 min_lev = 0, max_lev = 0, is_system = 1,
	 is_quest_need = 0, def_price = 0, min_price = 0,
	 max_price = 0, gain_label = coin, open_lev = 0,
	 pre_base_id = 0, pre_pcnt = 1000, group = 0,
	 group_id = 0, update_time, chain_type = 0,
	 fix_price = 0, make_pcnt = 1000, rand_num = {1, 1}}).

-record(market_silver_draw_item,
	{cell_id = 0, base_id = 0, num = 0, rest = 0, price = 0,
	 pcnt = 0, attrs = []}).

-file("src/proto/proto_235.erl", 17).

-file("inc/market.hrl", 1).

-record(market_price,
	{base_id = 0, price = 0, assets = 0, source = 0}).

-file("src/proto/proto_235.erl", 18).

-spec pack(srv | cli, non_neg_integer(),
	   tuple()) -> {ok, binary()} |
		       {error, {unknown_pack_command, non_neg_integer()}}.

pack(23500, cli, {V0_catalg}) ->
    D_a_t_a = <<V0_catalg:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23500:16,
       D_a_t_a/binary>>};
pack(23500, srv, {V0_catalg, V0_goods}) ->
    D_a_t_a = <<V0_catalg:32, (length(V0_goods)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32,
				   V1_cur_price:32, V1_margin:32>>
				 || #market_gold_item{id = V1_id,
						      base_id = V1_base_id,
						      cur_price = V1_cur_price,
						      margin = V1_margin}
					<- V0_goods]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23500:16,
       D_a_t_a/binary>>};
pack(23501, cli, {V0_base_id, V0_num}) ->
    D_a_t_a = <<V0_base_id:32, V0_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23501:16,
       D_a_t_a/binary>>};
pack(23501, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23501:16,
       D_a_t_a/binary>>};
pack(23502, cli, {V0_id, V0_num}) ->
    D_a_t_a = <<V0_id:32, V0_num:16>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23502:16,
       D_a_t_a/binary>>};
pack(23502, srv, {V0_flag}) ->
    D_a_t_a = <<V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23502:16,
       D_a_t_a/binary>>};
pack(23504, cli,
     {V0_package_type, V0_item_id, V0_num, V0_percent,
      V0_cell_id}) ->
    D_a_t_a = <<V0_package_type:8, V0_item_id:32, V0_num:8,
		V0_percent:32, V0_cell_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23504:16,
       D_a_t_a/binary>>};
pack(23504, srv, {}) -> {ok, <<2:32, 23504:16>>};
pack(23505, cli, {V0_type, V0_id, V0_num}) ->
    D_a_t_a = <<V0_type:8, V0_id:8, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23505:16,
       D_a_t_a/binary>>};
pack(23505, srv, {V0_type, V0_id, V0_status, V0_num}) ->
    D_a_t_a = <<V0_type:8, V0_id:8, V0_status:8, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23505:16,
       D_a_t_a/binary>>};
pack(23506, cli, {V0_cell_id}) ->
    D_a_t_a = <<V0_cell_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23506:16,
       D_a_t_a/binary>>};
pack(23506, srv, {V0_cell_id, V0_flag}) ->
    D_a_t_a = <<V0_cell_id:8, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23506:16,
       D_a_t_a/binary>>};
pack(23507, cli, {}) -> {ok, <<2:32, 23507:16>>};
pack(23507, srv,
     {#market_silver_shop{free_ids = V0_free_ids,
			  cells = V0_cells}}) ->
    D_a_t_a = <<(length(V0_free_ids)):16,
		(list_to_binary([<<V1_cell_id:8>>
				 || V1_cell_id <- V0_free_ids]))/binary,
		(length(V0_cells)):16,
		(list_to_binary([<<V1_cell_id:8, V1_item_base_id:32,
				   V1_num:8, V1_price:32, V1_expiry:32,
				   (length(V1_item_attrs)):16,
				   (list_to_binary([<<V2_attr:8, V2_value:32>>
						    || {V2_attr, V2_value}
							   <- V1_item_attrs]))/binary,
				   V1_status:8>>
				 || #market_silver_shop_cell{cell_id =
								 V1_cell_id,
							     item_base_id =
								 V1_item_base_id,
							     num = V1_num,
							     price = V1_price,
							     expiry = V1_expiry,
							     item_attrs =
								 V1_item_attrs,
							     status = V1_status}
					<- V0_cells]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23507:16,
       D_a_t_a/binary>>};
pack(23508, cli, {V0_item_base_id}) ->
    D_a_t_a = <<V0_item_base_id:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23508:16,
       D_a_t_a/binary>>};
pack(23508, srv, {V0_item_base_id, V0_price}) ->
    D_a_t_a = <<V0_item_base_id:32, V0_price:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23508:16,
       D_a_t_a/binary>>};
pack(23509, cli, {V0_refresh_type}) ->
    D_a_t_a = <<V0_refresh_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23509:16,
       D_a_t_a/binary>>};
pack(23509, srv, {V0_refresh_time, V0_data}) ->
    D_a_t_a = <<V0_refresh_time:32, (length(V0_data)):16,
		(list_to_binary([<<V1_type:8, (length(V1_goods)):16,
				   (list_to_binary([<<V2_id:8,
						      V2_item_base_id:32,
						      V2_num:8, V2_price:32,
						      V2_status:8,
						      (length(V2_item_attrs)):16,
						      (list_to_binary([<<V3_attr:8,
									 V3_value:32>>
								       || {V3_attr,
									   V3_value}
									      <- V2_item_attrs]))/binary>>
						    || #market_silver_refresh{id
										  =
										  V2_id,
									      item_base_id
										  =
										  V2_item_base_id,
									      num
										  =
										  V2_num,
									      price
										  =
										  V2_price,
									      status
										  =
										  V2_status,
									      item_attrs
										  =
										  V2_item_attrs}
							   <- V1_goods]))/binary>>
				 || {V1_type, V1_goods} <- V0_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23509:16,
       D_a_t_a/binary>>};
pack(23511, cli, {V0_cell_id}) ->
    D_a_t_a = <<V0_cell_id:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23511:16,
       D_a_t_a/binary>>};
pack(23511, srv, {V0_cell_id, V0_flag}) ->
    D_a_t_a = <<V0_cell_id:8, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23511:16,
       D_a_t_a/binary>>};
pack(23512, cli, {}) -> {ok, <<2:32, 23512:16>>};
pack(23512, srv, {V0_cell_id, V0_flag}) ->
    D_a_t_a = <<V0_cell_id:8, V0_flag:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23512:16,
       D_a_t_a/binary>>};
pack(23513, cli, {V0_cell_id, V0_percent, V0_num}) ->
    D_a_t_a = <<V0_cell_id:8, V0_percent:32, V0_num:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23513:16,
       D_a_t_a/binary>>};
pack(23513, srv, {}) -> {ok, <<2:32, 23513:16>>};
pack(23514, cli, {V0_type}) ->
    D_a_t_a = <<V0_type:8>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23514:16,
       D_a_t_a/binary>>};
pack(23514, srv, {}) -> {ok, <<2:32, 23514:16>>};
pack(23516, cli, {V0_base_ids}) ->
    D_a_t_a = <<(length(V0_base_ids)):16,
		(list_to_binary([<<V1_base_id:32>>
				 || V1_base_id <- V0_base_ids]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23516:16,
       D_a_t_a/binary>>};
pack(23516, srv, {V0_market_price}) ->
    D_a_t_a = <<(length(V0_market_price)):16,
		(list_to_binary([<<V1_source:8, V1_base_id:32,
				   V1_assets:32, V1_price:32>>
				 || #market_price{source = V1_source,
						  base_id = V1_base_id,
						  assets = V1_assets,
						  price = V1_price}
					<- V0_market_price]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23516:16,
       D_a_t_a/binary>>};
pack(23518, cli, {V0_catalg}) ->
    D_a_t_a = <<V0_catalg:32>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23518:16,
       D_a_t_a/binary>>};
pack(23518, srv, {V0_goods}) ->
    D_a_t_a = <<(length(V0_goods)):16,
		(list_to_binary([<<V1_id:32, V1_base_id:32,
				   V1_cur_price:32, V1_margin:32>>
				 || #market_gold_item{id = V1_id,
						      base_id = V1_base_id,
						      cur_price = V1_cur_price,
						      margin = V1_margin}
					<- V0_goods]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23518:16,
       D_a_t_a/binary>>};
pack(23519, cli, {}) -> {ok, <<2:32, 23519:16>>};
pack(23519, srv, {}) -> {ok, <<2:32, 23519:16>>};
pack(23520, cli, {}) -> {ok, <<2:32, 23520:16>>};
pack(23520, srv, {V0_limit_data}) ->
    D_a_t_a = <<(length(V0_limit_data)):16,
		(list_to_binary([<<V1_item_id:32, V1_count:32>>
				 || {V1_item_id, V1_count}
					<- V0_limit_data]))/binary>>,
    {ok,
     <<(byte_size(D_a_t_a) + 2):32, 23520:16,
       D_a_t_a/binary>>};
pack(Code, _Type, _Data) ->
    {error, {unknown_pack_command, Code}}.

-spec unpack(srv | cli, non_neg_integer(),
	     binary()) -> {ok, tuple()} |
			  {error, {unknown_unpack_command, non_neg_integer()}}.

unpack(23500, srv, _B0) ->
    {V1_catalg, _B1} = protocol:uint32(_B0),
    {ok, {V1_catalg}};
unpack(23500, cli, _B0) ->
    {V1_catalg, _B1} = protocol:uint32(_B0),
    {V1_goods, _B8} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_id, _B3} =
						 protocol:uint32(_B2),
					     {V2_base_id, _B4} =
						 protocol:uint32(_B3),
					     {V2_cur_price, _B5} =
						 protocol:uint32(_B4),
					     {V2_margin, _B6} =
						 protocol:uint32(_B5),
					     {{V2_id, V2_base_id, V2_cur_price,
					       V2_margin},
					      _B6}
				     end),
    {ok, {V1_catalg, V1_goods}};
unpack(23501, srv, _B0) ->
    {V1_base_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_base_id, V1_num}};
unpack(23501, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(23502, srv, _B0) ->
    {V1_id, _B1} = protocol:uint32(_B0),
    {V1_num, _B2} = protocol:uint16(_B1),
    {ok, {V1_id, V1_num}};
unpack(23502, cli, _B0) ->
    {V1_flag, _B1} = protocol:uint8(_B0), {ok, {V1_flag}};
unpack(23504, srv, _B0) ->
    {V1_package_type, _B1} = protocol:uint8(_B0),
    {V1_item_id, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {V1_percent, _B4} = protocol:uint32(_B3),
    {V1_cell_id, _B5} = protocol:uint8(_B4),
    {ok,
     {V1_package_type, V1_item_id, V1_num, V1_percent,
      V1_cell_id}};
unpack(23504, cli, _B0) -> {ok, {}};
unpack(23505, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint8(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_type, V1_id, V1_num}};
unpack(23505, cli, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0),
    {V1_id, _B2} = protocol:uint8(_B1),
    {V1_status, _B3} = protocol:uint8(_B2),
    {V1_num, _B4} = protocol:uint8(_B3),
    {ok, {V1_type, V1_id, V1_status, V1_num}};
unpack(23506, srv, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_cell_id}};
unpack(23506, cli, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_cell_id, V1_flag}};
unpack(23507, srv, _B0) -> {ok, {}};
unpack(23507, cli, _B0) ->
    {V1_free_ids, _B4} = protocol:array(_B0,
					fun (_B1) ->
						{V2_cell_id, _B2} =
						    protocol:uint8(_B1),
						{V2_cell_id, _B2}
					end),
    {V1_cells, _B18} = protocol:array(_B4,
				      fun (_B5) ->
					      {V2_cell_id, _B6} =
						  protocol:uint8(_B5),
					      {V2_item_base_id, _B7} =
						  protocol:uint32(_B6),
					      {V2_num, _B8} =
						  protocol:uint8(_B7),
					      {V2_price, _B9} =
						  protocol:uint32(_B8),
					      {V2_expiry, _B10} =
						  protocol:uint32(_B9),
					      {V2_item_attrs, _B15} =
						  protocol:array(_B10,
								 fun (_B11) ->
									 {V3_attr,
									  _B12} =
									     protocol:uint8(_B11),
									 {V3_value,
									  _B13} =
									     protocol:uint32(_B12),
									 {{V3_attr,
									   V3_value},
									  _B13}
								 end),
					      {V2_status, _B16} =
						  protocol:uint8(_B15),
					      {{V2_cell_id, V2_item_base_id,
						V2_num, V2_price, V2_expiry,
						V2_item_attrs, V2_status},
					       _B16}
				      end),
    {ok, {V1_free_ids, V1_cells}};
unpack(23508, srv, _B0) ->
    {V1_item_base_id, _B1} = protocol:uint32(_B0),
    {ok, {V1_item_base_id}};
unpack(23508, cli, _B0) ->
    {V1_item_base_id, _B1} = protocol:uint32(_B0),
    {V1_price, _B2} = protocol:uint32(_B1),
    {ok, {V1_item_base_id, V1_price}};
unpack(23509, srv, _B0) ->
    {V1_refresh_type, _B1} = protocol:uint8(_B0),
    {ok, {V1_refresh_type}};
unpack(23509, cli, _B0) ->
    {V1_refresh_time, _B1} = protocol:uint32(_B0),
    {V1_data, _B18} = protocol:array(_B1,
				     fun (_B2) ->
					     {V2_type, _B3} =
						 protocol:uint8(_B2),
					     {V2_goods, _B16} =
						 protocol:array(_B3,
								fun (_B4) ->
									{V3_id,
									 _B5} =
									    protocol:uint8(_B4),
									{V3_item_base_id,
									 _B6} =
									    protocol:uint32(_B5),
									{V3_num,
									 _B7} =
									    protocol:uint8(_B6),
									{V3_price,
									 _B8} =
									    protocol:uint32(_B7),
									{V3_status,
									 _B9} =
									    protocol:uint8(_B8),
									{V3_item_attrs,
									 _B14} =
									    protocol:array(_B9,
											   fun
											     (_B10) ->
												 {V4_attr,
												  _B11} =
												     protocol:uint8(_B10),
												 {V4_value,
												  _B12} =
												     protocol:uint32(_B11),
												 {{V4_attr,
												   V4_value},
												  _B12}
											   end),
									{{V3_id,
									  V3_item_base_id,
									  V3_num,
									  V3_price,
									  V3_status,
									  V3_item_attrs},
									 _B14}
								end),
					     {{V2_type, V2_goods}, _B16}
				     end),
    {ok, {V1_refresh_time, V1_data}};
unpack(23511, srv, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {ok, {V1_cell_id}};
unpack(23511, cli, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_cell_id, V1_flag}};
unpack(23512, srv, _B0) -> {ok, {}};
unpack(23512, cli, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {V1_flag, _B2} = protocol:uint8(_B1),
    {ok, {V1_cell_id, V1_flag}};
unpack(23513, srv, _B0) ->
    {V1_cell_id, _B1} = protocol:uint8(_B0),
    {V1_percent, _B2} = protocol:uint32(_B1),
    {V1_num, _B3} = protocol:uint8(_B2),
    {ok, {V1_cell_id, V1_percent, V1_num}};
unpack(23513, cli, _B0) -> {ok, {}};
unpack(23514, srv, _B0) ->
    {V1_type, _B1} = protocol:uint8(_B0), {ok, {V1_type}};
unpack(23514, cli, _B0) -> {ok, {}};
unpack(23516, srv, _B0) ->
    {V1_base_ids, _B4} = protocol:array(_B0,
					fun (_B1) ->
						{V2_base_id, _B2} =
						    protocol:uint32(_B1),
						{V2_base_id, _B2}
					end),
    {ok, {V1_base_ids}};
unpack(23516, cli, _B0) ->
    {V1_market_price, _B7} = protocol:array(_B0,
					    fun (_B1) ->
						    {V2_source, _B2} =
							protocol:uint8(_B1),
						    {V2_base_id, _B3} =
							protocol:uint32(_B2),
						    {V2_assets, _B4} =
							protocol:uint32(_B3),
						    {V2_price, _B5} =
							protocol:uint32(_B4),
						    {{V2_source, V2_base_id,
						      V2_assets, V2_price},
						     _B5}
					    end),
    {ok, {V1_market_price}};
unpack(23518, srv, _B0) ->
    {V1_catalg, _B1} = protocol:uint32(_B0),
    {ok, {V1_catalg}};
unpack(23518, cli, _B0) ->
    {V1_goods, _B7} = protocol:array(_B0,
				     fun (_B1) ->
					     {V2_id, _B2} =
						 protocol:uint32(_B1),
					     {V2_base_id, _B3} =
						 protocol:uint32(_B2),
					     {V2_cur_price, _B4} =
						 protocol:uint32(_B3),
					     {V2_margin, _B5} =
						 protocol:uint32(_B4),
					     {{V2_id, V2_base_id, V2_cur_price,
					       V2_margin},
					      _B5}
				     end),
    {ok, {V1_goods}};
unpack(23519, srv, _B0) -> {ok, {}};
unpack(23519, cli, _B0) -> {ok, {}};
unpack(23520, srv, _B0) -> {ok, {}};
unpack(23520, cli, _B0) ->
    {V1_limit_data, _B5} = protocol:array(_B0,
					  fun (_B1) ->
						  {V2_item_id, _B2} =
						      protocol:uint32(_B1),
						  {V2_count, _B3} =
						      protocol:uint32(_B2),
						  {{V2_item_id, V2_count}, _B3}
					  end),
    {ok, {V1_limit_data}};
unpack(Code, _Type, _Data) ->
    {error, {unknown_unpack_command, Code}}.

pack_mate(_Code) -> <<0>>.

convert_data(_Code, Data) -> Data.


