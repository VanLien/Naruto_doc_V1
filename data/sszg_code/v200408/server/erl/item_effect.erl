-file("data/item_effect.erl", 1).

-file("src/mod/item/item_effect.erl", 1).

-module(item_effect).

-lager_records([{triple_rebate_data,
		 [id, charge_sum, reward_times, mail_title,
		  mail_content]},
		{charge_data,
		 [id, name, val, gold, first_add, add, vip_exp, pic,
		  is_show, is_iosverify, type, items]},
		{m_charge,
		 [ver, charge_list, first_gift, triple_rebate_list,
		  merge_count, merge_charge_list, day_gift, week_refresh,
		  week_gift, month_refresh, month_gift, day_first_gift,
		  first_gift_ver, choose_first_gift_status,
		  reset_charge_list, warehouse_charge_list]},
		{assets,
		 [ver, exp, coin, silver_coin, gold, red_gold, gold_acc,
		  vip_exp, energy, energy_max, energy_time, activity,
		  guild, arena_cent, hero_soul, feat_point, triple_rebate,
		  friend_point, boss_point, star_hun, star_point,
		  arena_guesscent, sky_coin, hero_exp, recruit_hero,
		  recruithigh_hero, expedition_medal, elite_coin,
		  holy_eqm_coin, skin_debris, cluster_coin, home_coin,
		  hallow_refine, cluster_guess_cent, feather_exchange,
		  brave_symbol, peak_guess_cent, hero_soul_coin,
		  acc_recruit_hero, predict_point]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([do/5, msg/3]).

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

-file("src/mod/item/item_effect.erl", 15).

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

-file("src/mod/item/item_effect.erl", 16).

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

-file("src/mod/item/item_effect.erl", 17).

-file("inc/gain.hrl", 1).

-record(gain,
	{label  :: atom(), val  :: term(),
	 msg = <<>>  :: bitstring(), flag  :: atom(),
	 reason  :: atom(), ext = 0  :: term(),
	 notice = 0  :: 0..1,
	 move_to = 0  :: non_neg_integer()}).

-record(loss,
	{label  :: atom(), val  :: term(),
	 own_val = 0  :: term(), msg = <<>>  :: bitstring(),
	 flag  :: atom(), reason  :: atom(),
	 ext = 0  :: term()}).

-record(gain_loss_opts,
	{title = <<>>, return_gl = [], is_continue = false,
	 order = loss  :: gain | loss,
	 gain_tag = <<>>  :: binary(),
	 loss_tag = <<>>  :: binary(),
	 split_str = <<"，"/utf8>>  :: binary(),
	 split_op_str = <<"，"/utf8>>  :: binary(),
	 type = 2  :: non_neg_integer(),
	 is_auto_buy = 0  :: 0..1,
	 need_notify_fail_item = false  :: true | false,
	 log_name = <<"市场"/utf8>>  :: true | false}).

-file("src/mod/item/item_effect.erl", 18).

-file("inc/assets.hrl", 1).

-file("inc/game_assets.hrl", 1).

-file("inc/assets.hrl", 12).

-record(assets,
	{ver = -1, exp = 0, coin = 0, silver_coin = 0, gold = 0,
	 red_gold = 0, gold_acc = 0, vip_exp = 0, energy = 0,
	 energy_max = 0, energy_time = 0, activity = 0,
	 guild = 0, arena_cent = 0, hero_soul = 0,
	 feat_point = 0, triple_rebate = 0, friend_point = 0,
	 boss_point = 0, star_hun = 0, star_point = 0,
	 arena_guesscent = 0, sky_coin = 0, hero_exp = 0,
	 recruit_hero = 0, recruithigh_hero = 0,
	 expedition_medal = 0, elite_coin = 0, holy_eqm_coin = 0,
	 skin_debris = 0, cluster_coin = 0, home_coin = 0,
	 hallow_refine = 0, cluster_guess_cent = 0,
	 feather_exchange = 0, brave_symbol = 0,
	 peak_guess_cent = 0, hero_soul_coin = 0,
	 acc_recruit_hero = 0, predict_point = 0}).

-file("src/mod/item/item_effect.erl", 19).

-file("inc/charge.hrl", 1).

-record(m_charge,
	{ver = 9, charge_list = [], first_gift = [],
	 triple_rebate_list = [], merge_count = 0,
	 merge_charge_list = [], day_gift = [], week_refresh = 0,
	 week_gift = [], month_refresh = 0, month_gift = [],
	 day_first_gift = {0, 0}, first_gift_ver = 0,
	 choose_first_gift_status = 0, reset_charge_list = [],
	 warehouse_charge_list = []}).

-record(charge_data,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(), val = 0  :: float(),
	 gold = 0  :: non_neg_integer(),
	 first_add = 0  :: non_neg_integer(),
	 add = 0  :: non_neg_integer(),
	 vip_exp = 0  :: non_neg_integer(),
	 pic = 0  :: non_neg_integer(), is_show = 0  :: 0..1,
	 is_iosverify = 1  :: 0..1,
	 type = 0  :: non_neg_integer(), items = []  :: list()}).

-record(triple_rebate_data,
	{id = 0  :: non_neg_integer(),
	 charge_sum = 0  :: bitstring(),
	 reward_times = 0  :: non_neg_integer(),
	 mail_title = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring()}).

-file("src/mod/item/item_effect.erl", 20).

msg(_ItemBase, _Msg, _Role) -> ok.

-spec do(list(), #item_base{}, #role{},
	 Num :: integer(), Args :: tuple()) -> {ok, #role{}} |
					       {false, bitstring()}.

do(_, _ItemBase, Role, Num, _Args) when Num =< 0 ->
    {ok, Role};
do([], _ItemBase, Role, _Num, _Args) -> {ok, Role};
do([H | T], ItemBase, Role, Num, Args) ->
    case do(H, ItemBase, Role, Num, Args) of
      {ok, Nr} -> do(T, ItemBase, Nr, Num, Args);
      {false, Reason} -> {false, Reason}
    end;
do({2, Value}, ItemBase, Role, Num, _Args) ->
    case role_gain:do_notice(Role,
			     [#gain{label = coin, val = Value * Num}])
	of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect41, _,
	     {__Levelitem_effect41, __Tracesitem_effect41}}
		when __Levelitem_effect41 band 128 /= 0 orelse
		       __Tracesitem_effect41 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do}, {line, 41},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~s]使用[~s]失败:~w",
					   [Role#role.name,
					    ItemBase#item_base.name, Err]),
			     none, 4096, 128, __Levelitem_effect41,
			     __Tracesitem_effect41, lager_event,
			     __Piditem_effect41);
	    _ -> ok
	  end,
	  Msg = error_msg(Role, ItemBase, Err),
	  {false, Msg}
    end;
do({1, Value}, ItemBase, Role, Num, _Args) ->
    case role_gain:do_notice(Role,
			     [#gain{label = gold, val = Value * Num}])
	of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect54, _,
	     {__Levelitem_effect54, __Tracesitem_effect54}}
		when __Levelitem_effect54 band 128 /= 0 orelse
		       __Tracesitem_effect54 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do}, {line, 54},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~s]使用[~s]失败:~w",
					   [Role#role.name,
					    ItemBase#item_base.name, Err]),
			     none, 4096, 128, __Levelitem_effect54,
			     __Tracesitem_effect54, lager_event,
			     __Piditem_effect54);
	    _ -> ok
	  end,
	  Msg = error_msg(Role, ItemBase, Err),
	  {false, Msg}
    end;
do({9, Value}, ItemBase, Role, Num, _Args) ->
    case role_gain:do_notice(Role,
			     [#gain{label = energy, val = Value * Num}])
	of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect67, _,
	     {__Levelitem_effect67, __Tracesitem_effect67}}
		when __Levelitem_effect67 band 128 /= 0 orelse
		       __Tracesitem_effect67 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do}, {line, 67},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~s]使用[~s]失败:~w",
					   [Role#role.name,
					    ItemBase#item_base.name, Err]),
			     none, 4096, 128, __Levelitem_effect67,
			     __Tracesitem_effect67, lager_event,
			     __Piditem_effect67);
	    _ -> ok
	  end,
	  Msg = error_msg(Role, ItemBase, Err),
	  {false, Msg}
    end;
do({4, Value}, ItemBase, Role, Num, _Args) ->
    case role_gain:do_notice(Role,
			     [#gain{label = partner_exp_all,
				    val = Value * Num}])
	of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect80, _,
	     {__Levelitem_effect80, __Tracesitem_effect80}}
		when __Levelitem_effect80 band 128 /= 0 orelse
		       __Tracesitem_effect80 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do}, {line, 80},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~s]使用[~s]失败:~w",
					   [Role#role.name,
					    ItemBase#item_base.name, Err]),
			     none, 4096, 128, __Levelitem_effect80,
			     __Tracesitem_effect80, lager_event,
			     __Piditem_effect80);
	    _ -> ok
	  end,
	  Msg = error_msg(Role, ItemBase, Err),
	  {false, Msg}
    end;
do({7, PartnerBid}, _ItemBase, Role, Num, Args) ->
    Fun = fun (Bid, {ok, TempR}) ->
		  case partner:add_partners(TempR, Bid,
					    list_util:keyfind(source, Args,
							      null))
		      of
		    NewR = #role{} -> {ok, NewR};
		    {false, Msg} ->
			case {whereis(lager_event), whereis(lager_event),
			      lager_config:get({lager_event, loglevel},
					       {0, []})}
			    of
			  {undefined, undefined, _} ->
			      fun () -> {error, lager_not_running} end();
			  {undefined, _, _} ->
			      fun () ->
				      {error,
				       {sink_not_configured, lager_event}}
			      end();
			  {__Piditem_effect91, _,
			   {__Levelitem_effect91, __Tracesitem_effect91}}
			      when __Levelitem_effect91 band 8 /= 0 orelse
				     __Tracesitem_effect91 /= [] ->
			      lager:do_log(error,
					   [{module, item_effect},
					    {function, do}, {line, 91},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("使用道具加伙伴ERR ~w, ~w, Msg ~w",
							 [Role#role.id,
							  PartnerBid, Msg]),
					   none, 4096, 8, __Levelitem_effect91,
					   __Tracesitem_effect91, lager_event,
					   __Piditem_effect91);
			  _ -> ok
			end,
			{false, Msg}
		  end;
	      (_Bid, Other) -> Other
	  end,
    case lists:foldl(Fun, {ok, Role},
		     lists:duplicate(Num, PartnerBid))
	of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg}
    end;
do({34, {BaseId, TimeOut, Award}}, _ItemBase, Role,
   _Num, _Args) ->
    case partner_skin:add_skin(Role, BaseId, TimeOut, Award)
	of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg}
    end;
do({43, _}, _ItemBase, Role, _Num, _Args) ->
    case planes:reply(Role) of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg}
    end;
do({41, _}, _ItemBase, Role, Num, _Args) ->
    case holiday_return_new_red_packet:send_red_packet(Role,
						       Num)
	of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg}
    end;
do({42, Id}, ItemBase, Role, _Num, _Args) ->
    case home:item_activate_look(Role, Id) of
      {ok, NewRole} ->
	  notice:alert(util:fbin(lang:get(<<"Đã kích hoạt~ts"/utf8>>),
				 [color:format({red,
						ItemBase#item_base.name})])),
	  {ok, NewRole};
      {false, Msg} -> {false, Msg}
    end;
do({35, BaseId}, _ItemBase, Role, _Num, _Args) ->
    case role_room_honor:add_honor(Role, BaseId) of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg}
    end;
do({6, BuffId}, _ItemBase, Role, _Num, _Args) ->
    role_buff:add_buff(Role, BuffId);
do({11, Id}, _ItemBase, Role, Num, _Args) ->
    #charge_data{gold = Gold0, vip_exp = VipExp0} =
	charge_data:get(Id),
    Gold = Gold0 * Num,
    VipExp = VipExp0 * Num,
    case role_gain:do_notice(Role,
			     [#gain{label = gold_acc, val = Gold},
			      #gain{label = gold, val = Gold},
			      #gain{label = vip_exp, val = VipExp}])
	of
      {ok, Role1} ->
	  {ok,
	   charge:fire(Role1,
		       #{gold => Gold, package_id => Id, flag => use_item,
			 currency_type => rmb, money => 0, sn => <<>>,
			 data_mod => charge_data})};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect160, _,
	     {__Levelitem_effect160, __Tracesitem_effect160}}
		when __Levelitem_effect160 band 8 /= 0 orelse
		       __Tracesitem_effect160 /= [] ->
		lager:do_log(error,
			     [{module, item_effect}, {function, do},
			      {line, 160}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色Id:~w, 名字:~w, 损益操作失败",
					   [Role#role.id, Role#role.name]),
			     none, 4096, 8, __Levelitem_effect160,
			     __Tracesitem_effect160, lager_event,
			     __Piditem_effect160);
	    _ -> ok
	  end,
	  {false, lang:get(<<"Nạp tiền không thành công"/utf8>>)}
    end;
do({14, Exp}, _ItemBase, Role, Num, _Args) ->
    case role_gain:do_notice(Role,
			     [#gain{label = vip_exp, val = Exp * Num}])
	of
      {ok, Role1} ->
	  role_lib:push_base_info(Role1),
	  notice:alert(util:format_ex(lang:get(<<"Chúc mừng~sTrải nghiệm VIP"/utf8>>),
				      [color:format({green, Exp * Num})])),
	  {ok, Role1};
      _ -> {ok, Role}
    end;
do({12, {BaseId, 1}}, ItemBase, Role, _Num, _Args) ->
    case avatar:add(Role, BaseId) of
      {ok, NewRole} ->
	  notice:alert(NewRole,
		       lang:get(<<"Đã kích hoạt thành công khung avatar"/utf8>>)),
	  case avatar:use(NewRole, BaseId) of
	    {ok, NewRole1} -> {ok, NewRole1};
	    _ ->
		notice:alert(NewRole,
			     lang:get(<<"Khung avatar đã được tự động gia hạn"/utf8>>)),
		{ok, NewRole}
	  end;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect188, _,
	     {__Levelitem_effect188, __Tracesitem_effect188}}
		when __Levelitem_effect188 band 128 /= 0 orelse
		       __Tracesitem_effect188 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do},
			      {line, 188}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]使用[~ts]失败:~w",
					   [Role#role.name,
					    ItemBase#item_base.name, Err]),
			     none, 4096, 128, __Levelitem_effect188,
			     __Tracesitem_effect188, lager_event,
			     __Piditem_effect188);
	    _ -> ok
	  end,
	  Msg = error_msg(Role, ItemBase, Err),
	  {false, Msg}
    end;
do({12, BaseId}, ItemBase, Role, _Num, _Args) ->
    case avatar:add(Role, BaseId) of
      {ok, NewRole} ->
	  notice:alert(NewRole,
		       lang:get(<<"Đã kích hoạt thành công khung avatar"/utf8>>)),
	  {ok, NewRole};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect200, _,
	     {__Levelitem_effect200, __Tracesitem_effect200}}
		when __Levelitem_effect200 band 128 /= 0 orelse
		       __Tracesitem_effect200 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do},
			      {line, 200}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]使用[~ts]失败:~w",
					   [Role#role.name,
					    ItemBase#item_base.name, Err]),
			     none, 4096, 128, __Levelitem_effect200,
			     __Tracesitem_effect200, lager_event,
			     __Piditem_effect200);
	    _ -> ok
	  end,
	  Msg = error_msg(Role, ItemBase, Err),
	  {false, Msg}
    end;
do({13, BaseId}, ItemBase, Role, _Num, _Args) ->
    case say_frame:add(Role, BaseId) of
      {ok, NewRole} ->
	  notice:alert(NewRole,
		       lang:get(<<"Đã kích hoạt hộp trò chuyện thành công"/utf8>>)),
	  {ok, NewRole};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect212, _,
	     {__Levelitem_effect212, __Tracesitem_effect212}}
		when __Levelitem_effect212 band 128 /= 0 orelse
		       __Tracesitem_effect212 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do},
			      {line, 212}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]使用[~ts]失败:~w",
					   [Role#role.name,
					    ItemBase#item_base.name, Err]),
			     none, 4096, 128, __Levelitem_effect212,
			     __Tracesitem_effect212, lager_event,
			     __Piditem_effect212);
	    _ -> ok
	  end,
	  Msg = error_msg(Role, ItemBase, Err),
	  {false, Msg}
    end;
do({25, BaseId}, ItemBase, Role, _Num, _Args) ->
    case honor:add(Role, BaseId) of
      {ok, NewRole} ->
	  notice:alert(NewRole,
		       lang:get(<<"Đã kích hoạt tiêu đề thành công"/utf8>>)),
	  {ok, NewRole};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect224, _,
	     {__Levelitem_effect224, __Tracesitem_effect224}}
		when __Levelitem_effect224 band 128 /= 0 orelse
		       __Tracesitem_effect224 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do},
			      {line, 224}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]使用[~ts]失败:~w",
					   [Role#role.name,
					    ItemBase#item_base.name, Err]),
			     none, 4096, 128, __Levelitem_effect224,
			     __Tracesitem_effect224, lager_event,
			     __Piditem_effect224);
	    _ -> ok
	  end,
	  Msg = error_msg(Role, ItemBase, Err),
	  {false, Msg}
    end;
do({18, Val}, _ItemBase, Role, Num, _Args) ->
    case role_gain:do_notice(Role,
			     [#gain{label = w_move, val = Val * Num}])
	of
      {ok, Role1} -> {ok, Role1};
      _ -> {ok, Role}
    end;
do({10, Value}, ItemBase, Role, Num, _Args) ->
    case role_gain:do_notice(Role,
			     [#gain{label = hero_soul, val = Value * Num}])
	of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect246, _,
	     {__Levelitem_effect246, __Tracesitem_effect246}}
		when __Levelitem_effect246 band 128 /= 0 orelse
		       __Tracesitem_effect246 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do},
			      {line, 246}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~s]使用[~s]失败:~w",
					   [Role#role.name,
					    ItemBase#item_base.name, Err]),
			     none, 4096, 128, __Levelitem_effect246,
			     __Tracesitem_effect246, lager_event,
			     __Piditem_effect246);
	    _ -> ok
	  end,
	  Msg = error_msg(Role, ItemBase, Err),
	  {false, Msg}
    end;
do({23, Data}, _ItemBase, Role, 1, _Args) ->
    guild_mem_red_packet:item_send(Role, Data);
do({27, {PartnerBid, InitStar, InitLev}}, _ItemBase,
   Role, Num, Args) ->
    Fun = fun (Bid, {ok, TempR}) ->
		  case partner:add_partners(TempR, Bid,
					    list_util:keyfind(source, Args,
							      null),
					    InitLev, InitStar)
		      of
		    NewR = #role{} -> {ok, NewR};
		    {false, Msg} ->
			case {whereis(lager_event), whereis(lager_event),
			      lager_config:get({lager_event, loglevel},
					       {0, []})}
			    of
			  {undefined, undefined, _} ->
			      fun () -> {error, lager_not_running} end();
			  {undefined, _, _} ->
			      fun () ->
				      {error,
				       {sink_not_configured, lager_event}}
			      end();
			  {__Piditem_effect261, _,
			   {__Levelitem_effect261, __Tracesitem_effect261}}
			      when __Levelitem_effect261 band 8 /= 0 orelse
				     __Tracesitem_effect261 /= [] ->
			      lager:do_log(error,
					   [{module, item_effect},
					    {function, do}, {line, 261},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("使用道具加伙伴ERR ~w, ~w级, ~w, Msg ~w",
							 [Role#role.id, InitLev,
							  PartnerBid, Msg]),
					   none, 4096, 8, __Levelitem_effect261,
					   __Tracesitem_effect261, lager_event,
					   __Piditem_effect261);
			  _ -> ok
			end,
			{false, Msg}
		  end;
	      (_Bid, Other) -> Other
	  end,
    case lists:foldl(Fun, {ok, Role},
		     lists:duplicate(Num, PartnerBid))
	of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg}
    end;
do({30, {ArtifactId, Star}}, ItemBase, Role, Num,
   _Args) ->
    case partner_artifact:add_star_artifact(Role, Star,
					    {ArtifactId, Num})
	of
      {ok, NewRole} ->
	  notice:alert(NewRole,
		       lang:get(<<"Đã nhận được hiện vật thành công"/utf8>>)),
	  {ok, NewRole};
      {false, Msg1} ->
	  Msg2 =
	      util:fbin(lang:get(<<"Sử dụng~tsthất bại,"/utf8>>),
			[color:format({item, ItemBase})]),
	  Msg = <<Msg2/binary, Msg1/binary>>,
	  {false, Msg}
    end;
do({31, Id}, ItemBase, Role, _Num, _Args) ->
    case privilege:activate(Role, Id) of
      {ok, NewRole} -> {ok, NewRole};
      {false, Msg1} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piditem_effect301, _,
	     {__Levelitem_effect301, __Tracesitem_effect301}}
		when __Levelitem_effect301 band 128 /= 0 orelse
		       __Tracesitem_effect301 /= [] ->
		lager:do_log(debug,
			     [{module, item_effect}, {function, do},
			      {line, 301}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]使用[~ts]失败",
					   [Role#role.name,
					    ItemBase#item_base.name]),
			     none, 4096, 128, __Levelitem_effect301,
			     __Tracesitem_effect301, lager_event,
			     __Piditem_effect301);
	    _ -> ok
	  end,
	  Msg2 =
	      util:fbin(lang:get(<<"Sử dụng~tsthất bại,"/utf8>>),
			[color:format({item, ItemBase})]),
	  Msg = <<Msg2/binary, Msg1/binary>>,
	  {false, Msg}
    end;
do({32, Id}, _ItemBase, Role, _Num, _Args) ->
    NewRole = role_face:add_face(Role, Id), {ok, NewRole};
do({33, Id}, _ItemBase, Role, _Num, _Args) ->
    NewRole = week_card:activate(Role, Id), {ok, NewRole};
do({39, Id}, _ItemBase, Role, _Num, _Args) ->
    NewRole = home_pet_lib:add_photos(Role, Id),
    {ok, NewRole};
do({40, Id}, _ItemBase, Role, _Num, _Args) ->
    NewRole = home_pet_lib:add_diarys(Role, Id),
    {ok, NewRole};
do(Eff, ItemBase, Role, _Num, _Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piditem_effect328, _,
       {__Levelitem_effect328, __Tracesitem_effect328}}
	  when __Levelitem_effect328 band 8 /= 0 orelse
		 __Tracesitem_effect328 /= [] ->
	  lager:do_log(error,
		       [{module, item_effect}, {function, do}, {line, 328},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~s]错误的物品[item_base:~w]使用效果:~w",
				     [Role#role.name, ItemBase, Eff]),
		       none, 4096, 8, __Levelitem_effect328,
		       __Tracesitem_effect328, lager_event,
		       __Piditem_effect328);
      _ -> ok
    end,
    {false,
     lang:get(<<"Không sử dụng được vật phẩm"/utf8>>)}.

error_msg(_Role, ItemBase = #item_base{}, _Err) ->
    util:fbin(lang:get(<<"Sử dụng~tsthất bại"/utf8>>),
	      [color:format({item, ItemBase})]).


