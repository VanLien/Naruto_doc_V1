-file("src/mod/market/market_tests.erl", 1).

-module(market_tests).

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
		 [ver, refresh_time, is_first_on_sale, refresh]},
		{market_price, [base_id, price, assets, source]},
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
		  add_num, can_share, eqm_set, use_count]},
		{map_role,
		 [pid, rid, srv_id, name, conn_pid, map, grid_pid, speed,
		  x, y, dir, gx, gy, status, event, label, lev, sex,
		  career, face, fc, avatar, looks]},
		{role_robot,
		 [id, account, platform, zone_id, channel, name, gid,
		  gname, lev, power, sex, career, face_id, face_file,
		  face_update_time, avatar_bid, avatar_frames, say_frames,
		  vip_lev, pos_info, partners, m_formation, sign, city,
		  max_dun_id, m_star, auto_pk, m_hallows, max_star_tower,
		  elite_lev, is_show_vip, arena_elite_defens, m_halidom,
		  m_guild_skill, arena_elite_manifesto,
		  arena_cluster_formation, city_id, honor, honor_badges,
		  honor_point, use_badges, fanse_list, grow_info,
		  room_bbs_set, backdrop_id, is_open_home, soft,
		  max_power, m_resonate_lev, m_sprite_tree,
		  m_arena_peak_champion, look_id, holiday_nian_face]},
		{role,
		 [ver, id, need_sync, loop_counter, type, pid, link,
		  reg_ip, reg_time, trigger, status, s_event, s_event_pid,
		  combat_pid, combat_replay_pid, combat_type_list,
		  ui_combat_type, play_speed, is_in_backstage, is_auto,
		  is_gain, is_ready, is_online, device_type, getui_cid,
		  channel, reg_channel, idfa, reg_idfa, device_id,
		  reg_device_id, os_name, reg_os_name, app_name,
		  reg_app_name, package_name, reg_package_name,
		  package_ver, reg_package_ver, os_ver, carrier_name,
		  net_type, resolution, platform, zone_id, account, name,
		  s_name, career, lev, uplev_time, sex, face_id,
		  face_list, hp, mspd, power, max_power, max_power_time,
		  arena_power, arena_max_power, arena_max_power_time,
		  banned_time, interdict_time, capacity, identity,
		  data_lock, timer, item_next_id, signature, city, assets,
		  pos, game_set, s_looks, login, misc, guild_bag,
		  surface_bag, partner_bag, m_look, m_charge, m_vip,
		  m_var, m_quest, m_drama, m_friend, m_mail, m_formation,
		  m_arena, m_feat, m_checkin, m_exchange, m_buff,
		  m_avatar, m_say, m_dungeon, m_boss, m_recruit, m_honor,
		  m_adventure, m_lev_gift, m_power_gift, m_star,
		  m_star_tower, m_market_silver, m_wish, m_login_days,
		  m_month_card, m_guild_dun, m_star_divination,
		  m_guild_skill, m_media_card_type, m_endless, m_dial,
		  m_days_ranks, m_escort, m_dun_stone, m_hallows,
		  m_day_goals, m_guild_quest, m_recruit_award,
		  m_sky_ladder, m_convert, m_shipping, m_expedition,
		  m_star_gift, holiday_assets, m_privilege, m_month_fund,
		  m_lanterm_festival, m_lanterm_adventure, m_invite_code,
		  misc_ext, m_arena_elite, arena_elite_power,
		  arena_elite_power_time, m_element_temple, m_halidom,
		  m_holiday_dial, arena_elite_max_star, m_break_egg,
		  m_welfare, m_dun_heaven, m_holiday_boss, m_war_order,
		  m_holiday_holy, m_week_card, m_holy_eqm_set,
		  m_arena_cluster, m_holiday_snatch, m_holiday_accumulate,
		  m_room, m_room_feat, m_holiday_boss_new,
		  m_holiday_return_feat, m_holiday_return_sign,
		  m_holiday_return, m_room_grow, m_lanterm_adventure1,
		  m_lanterm_adventure2, m_lanterm_adventure3, m_home,
		  m_home_pet, pet_bag, backdrop_id, backdrop_list,
		  m_holiday_predict, m_holiday_personal_gift, m_resonate,
		  m_resonate_extract, m_sprite_hatch, m_sprite_tree,
		  m_holiday_term_begins, m_holiday_petard, m_encounter,
		  m_holiday_merge_goal, m_arena_team, m_monopoly_maps,
		  m_training_camp, m_weekly, m_arena_peak_champion,
		  m_arena_elite_war_order, m_holiday_fire_gift,
		  m_holiday_personal_fire_gift, m_secret_dun,
		  m_holiday_return_new, m_holiday_charge_rebate,
		  m_holiday_charge_reset, m_holiday_optional_lottery,
		  m_holiday_lucky_dog, m_holiday_nian,
		  m_holiday_time_award, m_holiday_valentines, m_planes,
		  m_planes_war_order, m_new_war_order, m_face,
		  m_subscriber, m_holiday_dime, m_holiday_valentine_boss,
		  m_personal_push, m_holiday_new_week_card,
		  m_holiday_arena_team, m_holiday_practise_tower, p_bag,
		  p_eqm, p_home]}]).

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

-file("src/mod/market/market_tests.erl", 13).

-file("inc/role.hrl", 1).

-record(role,
	{ver = 78, id = {0, <<>>}, need_sync = 0,
	 loop_counter = 0, type = robot, pid, link, reg_ip,
	 reg_time = 0,
	 trigger = {1, []}  :: {pos_integer(), [tuple()]},
	 status = 0, s_event = 0, s_event_pid, combat_pid = 0,
	 combat_replay_pid = 0, combat_type_list = [],
	 ui_combat_type = 0, play_speed = 1,
	 is_in_backstage = false, is_auto = 0, is_gain = 0,
	 is_ready, is_online = 0, device_type = <<>>,
	 getui_cid = <<>>, channel = <<>>, reg_channel = <<>>,
	 idfa = <<>>, reg_idfa = <<>>, device_id = <<>>,
	 reg_device_id = <<>>, os_name = <<>>,
	 reg_os_name = <<>>, app_name = <<>>,
	 reg_app_name = <<>>, package_name = <<>>,
	 reg_package_name = <<>>, package_ver = <<>>,
	 reg_package_ver = <<>>, os_ver = <<>>,
	 carrier_name = <<>>, net_type = <<>>, resolution = <<>>,
	 platform = <<>>, zone_id = 0  :: non_neg_integer(),
	 account = <<>>, name = <<>>, s_name = 0, career = 0,
	 lev = 1, uplev_time = 0, sex = 0, face_id = 0,
	 face_list = [], hp = 0, mspd = 25, power = 0,
	 max_power = 0, max_power_time = 0, arena_power = 0,
	 arena_max_power = 0, arena_max_power_time = 0,
	 banned_time = 0, interdict_time = 0, capacity = 0,
	 identity = <<>>, data_lock = 0, timer, item_next_id = 1,
	 signature = <<>>, city = 0, assets, pos, game_set,
	 s_looks = []  ::
	     [{non_neg_integer(), non_neg_integer(),
	       non_neg_integer(), bitstring()}],
	 login, misc, guild_bag, surface_bag, partner_bag,
	 m_look, m_charge, m_vip, m_var, m_quest, m_drama,
	 m_friend, m_mail = [], m_formation, m_arena, m_feat,
	 m_checkin, m_exchange, m_buff, m_avatar, m_say,
	 m_dungeon, m_boss, m_recruit, m_honor, m_adventure,
	 m_lev_gift, m_power_gift, m_star, m_star_tower,
	 m_market_silver, m_wish, m_login_days, m_month_card,
	 m_guild_dun, m_star_divination, m_guild_skill,
	 m_media_card_type = [], m_endless, m_dial, m_days_ranks,
	 m_escort, m_dun_stone, m_hallows, m_day_goals,
	 m_guild_quest, m_recruit_award, m_sky_ladder, m_convert,
	 m_shipping, m_expedition, m_star_gift,
	 holiday_assets = [], m_privilege, m_month_fund,
	 m_lanterm_festival, m_lanterm_adventure, m_invite_code,
	 misc_ext, m_arena_elite, arena_elite_power = 0,
	 arena_elite_power_time = 0, m_element_temple, m_halidom,
	 m_holiday_dial, arena_elite_max_star = 0, m_break_egg,
	 m_welfare, m_dun_heaven, m_holiday_boss, m_war_order,
	 m_holiday_holy, m_week_card, m_holy_eqm_set,
	 m_arena_cluster, m_holiday_snatch, m_holiday_accumulate,
	 m_room, m_room_feat, m_holiday_boss_new,
	 m_holiday_return_feat, m_holiday_return_sign,
	 m_holiday_return, m_room_grow, m_lanterm_adventure1,
	 m_lanterm_adventure2, m_lanterm_adventure3, m_home,
	 m_home_pet, pet_bag, backdrop_id = 0,
	 backdrop_list = [], m_holiday_predict,
	 m_holiday_personal_gift, m_resonate, m_resonate_extract,
	 m_sprite_hatch, m_sprite_tree, m_holiday_term_begins,
	 m_holiday_petard, m_encounter, m_holiday_merge_goal,
	 m_arena_team, m_monopoly_maps, m_training_camp,
	 m_weekly, m_arena_peak_champion,
	 m_arena_elite_war_order, m_holiday_fire_gift,
	 m_holiday_personal_fire_gift, m_secret_dun,
	 m_holiday_return_new, m_holiday_charge_rebate,
	 m_holiday_charge_reset, m_holiday_optional_lottery,
	 m_holiday_lucky_dog, m_holiday_nian,
	 m_holiday_time_award, m_holiday_valentines, m_planes,
	 m_planes_war_order, m_new_war_order, m_face,
	 m_subscriber, m_holiday_dime, m_holiday_valentine_boss,
	 m_personal_push, m_holiday_new_week_card,
	 m_holiday_arena_team, m_holiday_practise_tower, p_bag,
	 p_eqm, p_home}).

-record(role_robot,
	{id = {0, <<>>}, account = <<>>, platform = <<>>,
	 zone_id = 0, channel = <<>>, name = <<>>,
	 gid = {0, <<>>}, gname = <<>>, lev = 0, power = 0,
	 sex = 0, career = 0, face_id = 0, face_file = <<>>,
	 face_update_time = 0, avatar_bid = 0,
	 avatar_frames = [], say_frames = [], vip_lev = 0,
	 pos_info = [], partners = [], m_formation = [],
	 sign = <<>>, city = 0, max_dun_id = 0, m_star,
	 auto_pk = 0, m_hallows, max_star_tower = 0,
	 elite_lev = 0, is_show_vip = 0, arena_elite_defens = [],
	 m_halidom, m_guild_skill, arena_elite_manifesto = [],
	 arena_cluster_formation = [], city_id = 0, honor = 0,
	 honor_badges = [], honor_point = 0, use_badges = [],
	 fanse_list = [], grow_info = [], room_bbs_set = 1,
	 backdrop_id = 0, is_open_home = 0, soft = 0,
	 max_power = 0, m_resonate_lev = 0, m_sprite_tree,
	 m_arena_peak_champion, look_id = 0,
	 holiday_nian_face = []}).

-record(map_role,
	{pid  :: undefined | pid(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 conn_pid  :: undefined | pid(),
	 map = 0  :: non_neg_integer(), grid_pid  :: pid(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 dir = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 event = 0  :: non_neg_integer(), label = 0  :: 0..2,
	 lev = 1  :: pos_integer(), sex = 0  :: 0..2,
	 career = 0  :: non_neg_integer(),
	 face = 1  :: pos_integer(),
	 fc = 0  :: non_neg_integer(),
	 avatar = 0  :: non_neg_integer(),
	 looks = []  :: list()}).

-file("src/mod/market/market_tests.erl", 14).

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

-file("src/mod/market/market_tests.erl", 15).

-file("inc/market.hrl", 1).

-record(market_price,
	{base_id = 0, price = 0, assets = 0, source = 0}).

-file("src/mod/market/market_tests.erl", 16).

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

-file("src/mod/market/market_tests.erl", 17).

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

-file("src/mod/market/market_tests.erl", 18).

-export([gm_check_recover/0, gm_recover/0,
	 gm_silver_print_price/0, gm_silver_reset/0]).

-export([gm_gold_lookup/1, gm_gold_lookup_items/3,
	 gm_gold_refresh/0, gm_gold_set/5]).

gm_check_recover() ->
    F = fun (#market_silver_price{recover_num = Num,
				  item_base_id = ItemBaseId},
	     Acc)
		when Num > 0 ->
		ItemName = item:attr(name, ItemBaseId),
		Msg = util:flist("base_id:~w, name:~ts, 回购数量:~w~n",
				 [ItemBaseId, ItemName, Num]),
		[Msg | Acc];
	    (_, Acc) -> Acc
	end,
    Rtn = ets:foldl(F, [], market_silver_price_tab),
    case Rtn of
      [_ | _] -> string:join(Rtn, ",");
      _ -> util:flist("没有需要回购道具")
    end.

gm_recover() ->
    case case catch gen_server:call(market_silver,
				    server_recover, 10000)
	     of
	   {'EXIT', _Call_Err} ->
	       case {whereis(lager_event), whereis(lager_event),
		     lager_config:get({lager_event, loglevel}, {0, []})}
		   of
		 {undefined, undefined, _} ->
		     fun () -> {error, lager_not_running} end();
		 {undefined, _, _} ->
		     fun () -> {error, {sink_not_configured, lager_event}}
		     end();
		 {__Pidmarket_tests60, _,
		  {__Levelmarket_tests60, __Tracesmarket_tests60}}
		     when __Levelmarket_tests60 band 8 /= 0 orelse
			    __Tracesmarket_tests60 /= [] ->
		     lager:do_log(error,
				  [{module, market_tests},
				   {function, gm_recover}, {line, 60},
				   {pid, pid_to_list(self())}, {node, node()}
				   | lager:md()],
				  io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
						[market_silver, server_recover,
						 10000,
						 erlang:get_stacktrace()]),
				  none, 4096, 8, __Levelmarket_tests60,
				  __Tracesmarket_tests60, lager_event,
				  __Pidmarket_tests60);
		 _ -> ok
	       end,
	       case _Call_Err of
		 {timeout, _} -> {error, timeout};
		 {noproc, _} -> {error, noproc};
		 {normal, _} -> {error, exit};
		 _ -> {error, _Call_Err}
	       end;
	   _Call_Return -> _Call_Return
	 end
	of
      {ok, ShopList} ->
	  F = fun (#market_silver_shop{name = Name,
				       cells = Cells},
		   Acc) ->
		      Msg = util:flist("name:~ts, 摊位信息:~w~n", [Name, Cells]),
		      [Msg | Acc];
		  (_, Acc) -> Acc
	      end,
	  Rtn = lists:foldl(F, [], ShopList),
	  case Rtn of
	    [_ | _] -> string:join(Rtn, ",");
	    _ -> util:flist("没有可以回购的物品")
	  end;
      _ -> util:flist("没有可以回购的物品")
    end.

gm_silver_print_price() ->
    F = fun (#market_silver_price{item_base_id = ItemBaseId,
				  price = Price, deal_price = DealPrice},
	     Acc) ->
		ItemName = item:attr(name, ItemBaseId),
		Msg =
		    util:flist("base_id:~w, name:~ts, 当前价格:~w, 当日成交价格列表:~w~n",
			       [ItemBaseId, ItemName, Price, DealPrice]),
		[Msg | Acc];
	    (_, Acc) -> Acc
	end,
    Rtn = ets:foldl(F, [], market_silver_price_tab),
    string:join(Rtn, ",").

gm_silver_reset() ->
    market_silver ! reset, util:flist("重置铜钱仙市完成").

gm_gold_lookup(BaseId) ->
    case catch ets:lookup(market_gold_item_tab, BaseId) of
      [#market_gold_item{stock = Stock,
			 init_stock = InitStock, init_price = InitPirce,
			 margin = Margin}] ->
	  case item_data:get(BaseId) of
	    #item_base{name = Name} ->
		util:flist("查询银币仙市数据[BaseId:~w][name:~ts][当前库存:~w][当日起始库存"
			   ":~w][当日起始价格:~w][幅度:~w]",
			   [BaseId, Name, Stock, InitStock, InitPirce, Margin]);
	    _False ->
		util:flist("查询银币仙市数据错误，不存在物品[BaseId:~w]", [BaseId])
	  end;
      _ -> util:flist("查询银币仙市数据错误[BaseId:~w]", [BaseId])
    end.

gm_gold_lookup_items(Catalg1, Catalg2, Role) ->
    CurWorldLev = 0,
    Catalg = {Catalg1, Catalg2},
    case market_gold_data:get_catalg_world_lev(Catalg) of
      CatalgWorldLev when CurWorldLev >= CatalgWorldLev ->
	  Ids = market_gold_data:get_catalg_items(Catalg),
	  NewIds = [Id
		    || {Id, ItemWorldLev} <- Ids,
		       ItemWorldLev =< CurWorldLev],
	  Items = market_gold:get_items(NewIds, []),
	  BaseIds = [Id
		     || #market_gold_item{base_id = Id} <- Items],
	  util:flist("查询仙市类别[Catalg1:~w][Catalg2:~w]~n列表:~w",
		     [Catalg1, Catalg2, BaseIds]);
      _WorldLev ->
	  util:flist("查询仙市类别数据错误[Catalg1:~w][Catalg2:~w]",
		     [Catalg1, Catalg2])
    end.

gm_gold_refresh() ->
    case case catch gen_server:call(market_gold, reset,
				    10000)
	     of
	   {'EXIT', _Call_Err} ->
	       case {whereis(lager_event), whereis(lager_event),
		     lager_config:get({lager_event, loglevel}, {0, []})}
		   of
		 {undefined, undefined, _} ->
		     fun () -> {error, lager_not_running} end();
		 {undefined, _, _} ->
		     fun () -> {error, {sink_not_configured, lager_event}}
		     end();
		 {__Pidmarket_tests128, _,
		  {__Levelmarket_tests128, __Tracesmarket_tests128}}
		     when __Levelmarket_tests128 band 8 /= 0 orelse
			    __Tracesmarket_tests128 /= [] ->
		     lager:do_log(error,
				  [{module, market_tests},
				   {function, gm_gold_refresh}, {line, 128},
				   {pid, pid_to_list(self())}, {node, node()}
				   | lager:md()],
				  io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
						[market_gold, reset, 10000,
						 erlang:get_stacktrace()]),
				  none, 4096, 8, __Levelmarket_tests128,
				  __Tracesmarket_tests128, lager_event,
				  __Pidmarket_tests128);
		 _ -> ok
	       end,
	       case _Call_Err of
		 {timeout, _} -> {error, timeout};
		 {noproc, _} -> {error, noproc};
		 {normal, _} -> {error, exit};
		 _ -> {error, _Call_Err}
	       end;
	   _Call_Return -> _Call_Return
	 end
	of
      {ok, List} ->
	  F = fun (#market_gold_item{base_id = BaseId,
				     stock = Stock, init_stock = InitStock,
				     init_price = InitPirce, margin = Margin},
		   Acc) ->
		      Name = item:attr(name, BaseId),
		      Args = [BaseId, Name, Stock, InitStock, InitPirce,
			      Margin],
		      Msg =
			  util:flist("[BaseId:~w][name:~ts][当前库存:~w][当日起始库存:~w][当日起"
				     "始价格:~w][幅度:~w]~n",
				     Args),
		      [Msg | Acc];
		  (_, Acc) -> Acc
	      end,
	  Rtn = lists:foldl(F, [], List),
	  case Rtn of
	    [_ | _] -> string:join(Rtn, ",");
	    _ -> util:flist("没有要更新的物品")
	  end;
      _ -> util:flist("刷新失败")
    end.

gm_gold_set(BaseId, CurPrice, InitPrice, Stock, Role) ->
    case catch ets:lookup(market_gold_item_tab, BaseId) of
      [Item = #market_gold_item{}] ->
	  Item1 = case CurPrice >= 0 of
		    true -> Item#market_gold_item{cur_price = CurPrice};
		    false -> Item
		  end,
	  Item2 = case InitPrice >= 0 of
		    true -> Item1#market_gold_item{init_price = InitPrice};
		    false -> Item1
		  end,
	  Item3 = case Stock >= 0 of
		    true -> Item2#market_gold_item{stock = Stock};
		    false -> Item2
		  end,
	  NewItem = Item3,
	  catch ets:insert(market_gold_item_tab, NewItem),
	  catch dets:insert(market_gold_item_tab, NewItem),
	  role:link_send(Role, 23518, {[NewItem]}),
	  util:flist("设置金市[id:~w]数据成功", [BaseId]);
      _ -> util:flist("设置金市数据失败，未知的道具[id:~w]", [BaseId])
    end.


