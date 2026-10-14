-file("src/mod/market/market_ver.erl", 1).

-module(market_ver).

-lager_records([{market_gold_limit_data,
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
		{m_market_gold, [ver, limit_data]},
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
		 [ver, refresh_time, is_first_on_sale, refresh]}]).

-export([silver_shop_ver/1, silver_price_ver/1]).

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

-file("src/mod/market/market_ver.erl", 18).

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

-file("src/mod/market/market_ver.erl", 19).

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

-file("src/mod/market/market_ver.erl", 20).

silver_shop_ver(Shop = #market_silver_shop{ver = 1,
					   cells = Cells}) ->
    case shop_cell_ver(Cells, []) of
      {ok, NewCells} ->
	  {ok, Shop#market_silver_shop{cells = NewCells}};
      _Err -> {false, "商店数据版本转换错误"}
    end.

shop_cell_ver([], Cells) -> {ok, Cells};
shop_cell_ver([Cell | Rest], Cells) ->
    NewCell = do_shop_cell_ver(Cell),
    shop_cell_ver(Rest, [NewCell | Cells]).

do_shop_cell_ver(Cell = #market_silver_shop_cell{ver =
						     1}) ->
    Cell.

silver_price_ver(Price = #market_silver_price{ver =
						  1}) ->
    {ok, Price};
silver_price_ver(_False) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_ver49, _,
       {__Levelmarket_ver49, __Tracesmarket_ver49}}
	  when __Levelmarket_ver49 band 128 /= 0 orelse
		 __Tracesmarket_ver49 /= [] ->
	  lager:do_log(debug,
		       [{module, market_ver}, {function, silver_price_ver},
			{line, 49}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w", [_False]), none, 4096, 128,
		       __Levelmarket_ver49, __Tracesmarket_ver49, lager_event,
		       __Pidmarket_ver49);
      _ -> ok
    end,
    {false, "铜钱仙市商品价格版本转换错误"}.


