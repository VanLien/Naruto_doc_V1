-file("data/vip.erl", 1).

-file("src/mod/vip/vip.erl", 1).

-module(vip).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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

-export([init/0, push/1, lev_reward/2, get_effect/2,
	 calc_lev/1, lev/1, login/1, charge/2, tired_charge/2,
	 push2/1, gm_set_vip/3]).

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

-file("src/mod/vip/vip.erl", 20).

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

-file("src/mod/vip/vip.erl", 21).

-file("inc/vip.hrl", 1).

-record(m_vip,
	{ver = 2, lev = 0, lev_reward = [], tired_charge = []}).

-record(vip_data,
	{lev = 0  :: non_neg_integer(),
	 gold = 0  :: non_neg_integer(), price = []  :: list(),
	 old_price = []  :: list(), items = []  :: list(),
	 ext_reward = []}).

-record(vip_effect_data,
	{name = <<>>  :: bitstring(),
	 val = 0  :: non_neg_integer()}).

-file("src/mod/vip/vip.erl", 22).

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

-file("src/mod/vip/vip.erl", 23).

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

-file("src/mod/vip/vip.erl", 24).

-file("inc/log.hrl", 1).

-file("src/mod/vip/vip.erl", 25).

-file("inc/var.hrl", 1).

-record(m_var,
	{ver = -1, last_reset_time = 0  :: non_neg_integer(),
	 last_reset_day = {0, 0, 0}  ::
	     {non_neg_integer(), non_neg_integer(),
	      non_neg_integer()},
	 last_reset_five = 0  :: non_neg_integer(),
	 last_reset_week = {0, 0}  ::
	     {non_neg_integer(), non_neg_integer()},
	 last_acc_time = 0  :: non_neg_integer(),
	 acc_time = 0  :: non_neg_integer(),
	 login_charge_count = 0  :: non_neg_integer(),
	 acc_charge_count = 0  :: non_neg_integer(),
	 login_charge_num = 0  :: non_neg_integer(),
	 day_login = 0  :: non_neg_integer(),
	 acc_login_count = 0  :: non_neg_integer(),
	 total_acc_time = 0  :: non_neg_integer(),
	 acc_days = 1  :: non_neg_integer(),
	 best_days = 1  :: non_neg_integer(),
	 now_days = 1  :: non_neg_integer(),
	 month_days = 1  :: non_neg_integer(),
	 day_vars = []  :: [tuple()],
	 five_vars = []  :: [tuple()],
	 week_vars = []  :: [tuple()],
	 month_vars = []  :: [tuple()],
	 timeout_vars = []  :: [tuple()],
	 acc_vars = []  :: [tuple()],
	 other_vars = []  :: [tuple()],
	 week_five_vars = []  :: [tuple()],
	 week_five_time = 0  :: non_neg_integer()}).

-record(role_var,
	{id = {0, "", 0}  :: tuple(), vars = []  :: [tuple()]}).

-file("src/mod/vip/vip.erl", 26).

gm_set_vip(Role = #role{m_vip = MVip, assets = Assets},
	   VipExp, VipLev) ->
    NewAssets = Assets#assets{vip_exp = VipExp},
    NewMVip = MVip#m_vip{lev = VipLev},
    {ok, Role#role{m_vip = NewMVip, assets = NewAssets}}.

-spec init() -> #m_vip{}.

init() ->
    List = charge_data:list2(),
    List2 = [{Id, 0} || Id <- List],
    #m_vip{tired_charge = List2}.

-spec login(#role{}) -> #m_vip{}.

login(Role = #role{lev = _Lev,
		   m_vip = MVip = #m_vip{tired_charge = TiredCharge},
		   assets = #assets{vip_exp = VipExp}}) ->
    List = charge_data:list2(),
    NewTiredCharge = do_ref(List, TiredCharge, VipExp, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidvip45, _, {__Levelvip45, __Tracesvip45}}
	  when __Levelvip45 band 128 /= 0 orelse
		 __Tracesvip45 /= [] ->
	  lager:do_log(debug,
		       [{module, vip}, {function, login}, {line, 45},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===旧数据:~w   新数据:~w  表数据:~w   ",
				     [TiredCharge, NewTiredCharge, List]),
		       none, 4096, 128, __Levelvip45, __Tracesvip45,
		       lager_event, __Pidvip45);
      _ -> ok
    end,
    NewVip = MVip#m_vip{tired_charge = NewTiredCharge},
    NRole = Role#role{m_vip = NewVip},
    {ok, NRole}.

do_ref([], _TiredCharge, _VipExp, L) -> L;
do_ref([Id | List], TiredCharge, VipExp, L) ->
    case lists:keyfind(Id, 1, TiredCharge) of
      {Id, Status} when Status =/= 0 ->
	  do_ref(List, TiredCharge, VipExp, [{Id, Status} | L]);
      _ ->
	  Limit = charge_data:get_limit_charge(Id),
	  Status2 = util:if_true(Limit > VipExp, 0, 1),
	  do_ref(List, TiredCharge, VipExp, [{Id, Status2} | L])
    end.

-spec push(#role{}) -> ok.

push(#role{m_vip = #m_vip{lev_reward = LevReward}}) ->
    sys_conn:pack_send(16710, {LevReward}), ok.

lev(#role{m_vip = #m_vip{lev = Lev}}) -> Lev.

-spec calc_lev(#role{}) -> #role{}.

calc_lev(Role = #role{m_vip =
			  MVip = #m_vip{lev = VipLev},
		      assets = #assets{vip_exp = VipExp}}) ->
    case vip_data:get({normal, VipLev + 1}) of
      #vip_data{gold = Gold, ext_reward = ExtReward}
	  when VipExp >= Gold ->
	  NRole = Role#role{m_vip = MVip#m_vip{lev = VipLev + 1}},
	  GL = format:val_to_gain(ExtReward, vip_ext_reward),
	  NewRole = case role_gain:do_notice(NRole, GL) of
		      {ok, NRole1} -> NRole1;
		      _ -> NRole
		    end,
	  charge_misc:push_day_gift_open(VipLev + 1),
	  log:log_gain(GL, Role, NewRole, <<"VIP额外奖励"/utf8>>,
		       util:fbin("VIP额外奖励lev:~w", [VipLev + 1])),
	  calc_lev(NewRole);
      _ -> Role
    end.

-spec lev_reward(#role{},
		 Lev :: pos_integer()) -> {false, bitstring()} |
					  {ok, #role{}}.

lev_reward(Role = #role{m_vip =
			    MVip = #m_vip{lev = VipLev, lev_reward = Reward}},
	   GetLev)
    when GetLev =< VipLev ->
    case vip_data:get({normal, GetLev}) of
      #vip_data{items = Items = [_ | _], price = Price} ->
	  case lists:member(GetLev, Reward) of
	    true -> {false, lang:get(<<"Đã mua gói này"/utf8>>)};
	    false ->
		GL0 = format:val_to_gain(Items, vip_lev_reward),
		GL1 = case Price of
			[{_, Num}] when Num =< 0 ->
			    #loss{label = gold, val = 0};
			_ -> format:val_to_loss(Price, vip_lev_reward)
		      end,
		GL = lists:flatten([GL1, GL0]),
		case role_gain:do_notice(Role, GL,
					 #gain_loss_opts{type = 2})
		    of
		  {false, #loss{msg = Msg}} ->
		      {false, lang:get(<<"Không đủ vàng"/utf8>>)};
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      NRole = Role1#role{m_vip =
					     MVip#m_vip{lev_reward =
							    [GetLev | Reward]}},
		      log:log_gain(GL, Role, NRole, <<"VIP等级奖励"/utf8>>,
				   util:fbin("领取等级奖励lev:~w", [GetLev])),
		      push(NRole),
		      {ok, NRole}
		end
	  end;
      _ ->
	  {false,
	   lang:get(<<"Dữ liệu phần thưởng VIP không tồn tại"/utf8>>)}
    end;
lev_reward(_Role, _Vip) ->
    {false, lang:get(<<"Cấp độ VIP không đủ"/utf8>>)}.

-spec get_effect(#role{} | pos_integer(),
		 atom()) -> any().

get_effect(#role{m_vip = #m_vip{lev = VipLev}},
	   Label) ->
    get_effect(VipLev, Label);
get_effect(VipLev, Label) ->
    case vip_data:get_effect({Label, VipLev}) of
      #vip_effect_data{val = Val} -> Val;
      _ -> 0
    end.

-spec push2(#role{}) -> ok.

push2(#role{m_vip = #m_vip{tired_charge = Reward},
	    assets = #assets{vip_exp = VipExp}}) ->
    sys_conn:pack_send(16712, {VipExp, Reward}), ok.

tired_charge(Role = #role{m_vip =
			      MVip = #m_vip{tired_charge = LevReward}},
	     Id) ->
    case lists:keyfind(Id, 1, LevReward) of
      {_Id, 1} ->
	  case charge_data:get_award(Id) of
	    undefined ->
		{false,
		 lang:get(<<"Lỗi tham số, phần thưởng không xác định id"/utf8>>),
		 LevReward};
	    Items ->
		GL = format:val_to_gain(Items, vip_lev_reward),
		case role_gain:do_notice(Role, GL,
					 #gain_loss_opts{type = 2})
		    of
		  {false, #gain{msg = Msg}} -> {false, Msg, LevReward};
		  {ok, Role1} ->
		      NewLevReward = lists:keystore(Id, 1, LevReward,
						    {Id, 2}),
		      NRole = Role1#role{m_vip =
					     MVip#m_vip{tired_charge =
							    NewLevReward}},
		      log:log_gain(GL, Role, NRole, <<"VIP等级奖励"/utf8>>,
				   util:fbin("领取累充奖励lev:~w", [Id])),
		      push2(NRole),
		      {ok, NRole, NewLevReward}
		end
	  end;
      {_Id, 2} ->
	  {false, lang:get(<<"Đã nhận"/utf8>>), LevReward};
      _ ->
	  {false,
	   lang:get(<<"Không đáp ứng các điều kiện để nhận"/utf8>>),
	   LevReward}
    end.

-spec charge(#role{}, #role{}) -> {ok, #role{}}.

charge(Role = #role{m_vip =
			MVip = #m_vip{tired_charge = TiredCharge},
		    assets = #assets{vip_exp = VipExp}},
       _Opt) ->
    List = charge_data:list2(),
    NewTiredCharge = do_ref(List, TiredCharge, VipExp, []),
    NewVip = MVip#m_vip{tired_charge = NewTiredCharge},
    NewRole = Role#role{m_vip = NewVip},
    push2(NewRole),
    {ok, NewRole}.


