-file("data/format.erl", 1).

-file("src/mod/misc/format.erl", 1).

-module(format).

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
		  p_eqm, p_home]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice,
		  move_to]}]).

-export([val_to_gain/2, val_to_loss/2, gain_to_val/1,
	 gain_to_val/2, item_to_val/1, gain_text/2, gain_text/3,
	 num/1, sec/1, to_assets/1, to_items/2,
	 split_assets_items/1, gain_to_items_assets/1,
	 split_exp_and_other/1, gain_to_cli_drop/1,
	 item_split_by_overlap/1]).

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

-file("src/mod/misc/format.erl", 27).

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

-file("src/mod/misc/format.erl", 28).

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

-file("src/mod/misc/format.erl", 29).

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

-file("src/mod/misc/format.erl", 30).

-file("inc/game_assets.hrl", 1).

-file("src/mod/misc/format.erl", 31).

num(N) when N > 10000 ->
    N1 = N div 10000,
    N2 = N rem 10000 div 100,
    case N2 > 0 of
      true ->
	  util:fbin(lang:get(<<"~w.~wMười ngàn"/utf8>>),
		    [N1, N2]);
      _ -> util:fbin(lang:get(<<"~wMười ngàn"/utf8>>), [N1])
    end;
num(N) -> util:to_binary(N).

sec(Sec) when Sec >= 86400 ->
    util:fbin(lang:get(<<"~wNgày"/utf8>>), [Sec div 86400]);
sec(Sec) when Sec >= 3600 ->
    util:fbin(lang:get(<<"~wGiờ"/utf8>>), [Sec div 3600]);
sec(Sec) when Sec >= 60 ->
    util:fbin(lang:get(<<"~wđiểm"/utf8>>), [Sec div 60]);
sec(Sec) ->
    util:fbin(lang:get(<<"~wThứ hai"/utf8>>), [Sec]).

-spec val_to_gain(list(), atom() | #gain{}) -> GL ::
						   list().

val_to_gain(List, Flag) when is_atom(Flag) ->
    do_val_to_gain(List, #gain{flag = Flag}, []);
val_to_gain(List, Gain) ->
    do_val_to_gain(List, Gain, []).

do_val_to_gain([], _Gain, GL) -> GL;
do_val_to_gain([{9999, _, PartnerBid} | T], Gain, GL)
    when is_integer(PartnerBid) ->
    do_val_to_gain(T, Gain,
		   [Gain#gain{label = partner, val = {PartnerBid, 1}}
		    | GL]);
do_val_to_gain([{9999, _, {PartnerBid, PartnerLev}}
		| T],
	       Gain, GL) ->
    do_val_to_gain(T, Gain,
		   [Gain#gain{label = partner,
			      val = {PartnerBid, PartnerLev}}
		    | GL]);
do_val_to_gain([{_, Num} | T], Gain, GL)
    when Num =< 0 ->
    do_val_to_gain(T, Gain, GL);
do_val_to_gain([{_, _Bind, Num} | T], Gain, GL)
    when Num =< 0 ->
    do_val_to_gain(T, Gain, GL);
do_val_to_gain([{BaseId, Num} | T], Gain, GL) ->
    do_val_to_gain([{BaseId, 1, Num} | T], Gain, GL);
do_val_to_gain([{BaseId, _, Num} | T], Gain, GL)
    when is_atom(BaseId) ->
    do_val_to_gain(T, Gain,
		   [Gain#gain{label = BaseId, val = Num} | GL]);
do_val_to_gain([{BaseId, Bind, Num} | T], Gain, GL) ->
    case item_data:assets_code2atom(BaseId) of
      undefined ->
	  case item_data:get(BaseId) of
	    #item_base{} ->
		do_val_to_gain(T, Gain,
			       [Gain#gain{label = item_base_id,
					  val = [{BaseId, Bind, Num}]}
				| GL]);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidformat87, _, {__Levelformat87, __Tracesformat87}}
		      when __Levelformat87 band 8 /= 0 orelse
			     __Tracesformat87 /= [] ->
		      lager:do_log(error,
				   [{module, format},
				    {function, do_val_to_gain}, {line, 87},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[role_id:~w]物品[~w]不存在Flag:~w",
						 [role:get_dict_role_info(role_id),
						  {BaseId, Bind, Num},
						  Gain#gain.flag]),
				   none, 4096, 8, __Levelformat87,
				   __Tracesformat87, lager_event,
				   __Pidformat87);
		  _ -> ok
		end,
		do_val_to_gain(T, Gain, GL)
	  end;
      red_gold ->
	  do_val_to_gain(T, Gain,
			 [Gain#gain{label = gold, val = Num} | GL]);
      red_gold_or_gold ->
	  do_val_to_gain(T, Gain,
			 [Gain#gain{label = gold, val = Num} | GL]);
      silver_coin ->
	  do_val_to_gain(T, Gain,
			 [Gain#gain{label = coin, val = Num} | GL]);
      Label ->
	  do_val_to_gain(T, Gain,
			 [Gain#gain{label = Label, val = Num} | GL])
    end;
do_val_to_gain([{BaseId, Bind, Num, _Id} | T], Gain,
	       GL) ->
    do_val_to_gain([{BaseId, Bind, Num} | T], Gain, GL);
do_val_to_gain([Item | T], Gain, GL)
    when is_record(Item, item) ->
    do_val_to_gain(T, Gain,
		   [Gain#gain{label = items, val = [Item]} | GL]).

-spec val_to_loss(list(), atom() | #loss{}) -> GL ::
						   list().

val_to_loss(List, Flag) when is_atom(Flag) ->
    do_val_to_loss(List, #loss{flag = Flag}, []);
val_to_loss(List, Loss) ->
    do_val_to_loss(List, Loss, []).

do_val_to_loss([], _Loss, GL) -> GL;
do_val_to_loss([{_, Num} | T], Loss, GL)
    when Num =< 0 ->
    do_val_to_loss(T, Loss, GL);
do_val_to_loss([{_, _Bind, Num} | T], Loss, GL)
    when Num =< 0 ->
    do_val_to_loss(T, Loss, GL);
do_val_to_loss([{BaseId, Num} | T], Loss, GL)
    when is_atom(BaseId) ->
    do_val_to_loss(T, Loss,
		   [Loss#loss{label = BaseId, val = Num} | GL]);
do_val_to_loss([{Id, Num} | T],
	       Loss = #loss{flag = artifact_compound_item_id}, GL)
    when is_integer(Id) ->
    do_val_to_loss(T, Loss,
		   [Loss#loss{label = item_id, val = [{Id, Num}]} | GL]);
do_val_to_loss([{Id, Num} | T],
	       Loss = #loss{flag = item_expire}, GL)
    when is_integer(Id) ->
    do_val_to_loss(T, Loss,
		   [Loss#loss{label = item_id, val = [{Id, Num}]} | GL]);
do_val_to_loss([{Id, Num} | T],
	       Loss = #loss{flag = holiday_item}, GL)
    when is_integer(Id) ->
    do_val_to_loss(T, Loss,
		   [Loss#loss{label = holiday_item, val = [{Id, Num}]}
		    | GL]);
do_val_to_loss([{Id, Num} | T],
	       Loss = #loss{flag = holy_eqm_dress_id}, GL)
    when is_integer(Id) ->
    do_val_to_loss(T, Loss,
		   [Loss#loss{label = eqm_item_id, val = [{Id, Num}]}
		    | GL]);
do_val_to_loss([{Id, Num} | T],
	       Loss = #loss{flag = pet_item_base_id}, GL)
    when is_integer(Id) ->
    do_val_to_loss(T, Loss,
		   [Loss#loss{label = pet_item_base_id, val = [{Id, Num}]}
		    | GL]);
do_val_to_loss([{BaseId, Num} | T], Loss, GL)
    when is_integer(BaseId) ->
    case item_data:assets_code2atom(BaseId) of
      undefined ->
	  case item_data:get(BaseId) of
	    #item_base{gain_type = 2} ->
		do_val_to_loss(T, Loss,
			       [Loss#loss{label = item_base_id_from_eqm,
					  val = [{BaseId, Num}]}
				| GL]);
	    #item_base{gain_type = 6} ->
		do_val_to_loss(T, Loss,
			       [Loss#loss{label = item_base_id_from_home,
					  val = [{BaseId, Num}]}
				| GL]);
	    _ ->
		do_val_to_loss(T, Loss,
			       [Loss#loss{label = item_base_id,
					  val = [{BaseId, Num}]}
				| GL])
	  end;
      red_gold ->
	  do_val_to_loss(T, Loss,
			 [Loss#loss{label = gold, val = Num} | GL]);
      red_gold_or_gold ->
	  do_val_to_loss(T, Loss,
			 [Loss#loss{label = gold, val = Num} | GL]);
      silver_coin ->
	  do_val_to_loss(T, Loss,
			 [Loss#loss{label = coin, val = Num} | GL]);
      Label ->
	  do_val_to_loss(T, Loss,
			 [Loss#loss{label = Label, val = Num} | GL])
    end.

-spec gain_to_val(Gain :: #gain{}) -> Rtn :: {integer(),
					      integer()} |
					     [{integer(), integer()}].

-spec gain_to_val(List, Acc) -> Acc when List ::
					     [#gain{}],
					 Acc :: [{integer(), integer()}].

gain_to_val([], Acc) -> Acc;
gain_to_val([Gain | Rest], Acc) ->
    case gain_to_val(Gain) of
      New = {_, _} -> gain_to_val(Rest, [New | Acc]);
      New = [_ | _] -> gain_to_val(Rest, New ++ Acc);
      _ -> gain_to_val(Rest, Acc)
    end.

gain_to_val([]) -> [];
gain_to_val(GainList = [#gain{} | _]) ->
    gain_to_val(GainList, []);
gain_to_val(#gain{label = items}) -> false;
gain_to_val(#loss{}) -> false;
gain_to_val(#gain{label = Label, val = Val}) ->
    Code = item_data:assets_atom2code(Label),
    case Code > 0 of
      true -> {Code, Val};
      false -> item_to_val(Val, [])
    end;
gain_to_val(Unknow) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformat178, _,
       {__Levelformat178, __Tracesformat178}}
	  when __Levelformat178 band 8 /= 0 orelse
		 __Tracesformat178 /= [] ->
	  lager:do_log(error,
		       [{module, format}, {function, gain_to_val}, {line, 178},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误的奖励结构,无法解析[~w]", [Unknow]), none, 4096,
		       8, __Levelformat178, __Tracesformat178, lager_event,
		       __Pidformat178);
      _ -> ok
    end,
    false.

item_to_val(Items) -> item_to_val(Items, []).

item_to_val([H = {_BaseId, _Val} | Rest], Acc) ->
    item_to_val(Rest, [H | Acc]);
item_to_val([{BaseId, _Bind, Val} | Rest], Acc) ->
    item_to_val(Rest, [{BaseId, Val} | Acc]);
item_to_val([#item{base_id = BaseId, quantity = Val}
	     | Rest],
	    Acc) ->
    item_to_val(Rest, [{BaseId, Val} | Acc]);
item_to_val(#item{base_id = BaseId, quantity = Val},
	    Acc) ->
    [{BaseId, Val} | Acc];
item_to_val([_ | Rest], Acc) -> item_to_val(Rest, Acc);
item_to_val({BaseId, Val}, Acc) ->
    [{BaseId, Val} | Acc];
item_to_val({BaseId, _, Val}, Acc) ->
    [{BaseId, Val} | Acc];
item_to_val(_, Acc) -> Acc.

-spec gain_text(GL :: [GorL], Role) -> Text when GorL ::
						     #gain{} | #loss{},
						 Role :: #role{},
						 Text :: binary().

gain_text(L, Role) ->
    Opts = #gain_loss_opts{gain_tag =
			       lang:get(<<"Nhận được"/utf8>>),
			   loss_tag = lang:get(<<"Nhận được"/utf8>>)},
    gain_text(L, Opts, Role).

gain_text(#gain{val = 0}, _Opts, _Role) -> <<>>;
gain_text(#loss{val = 0}, _Opts, _Role) -> <<>>;
gain_text(#gain{val = []}, _Opts, _Role) -> <<>>;
gain_text(#loss{val = []}, _Opts, _Role) -> <<>>;
gain_text(#gain{label = item, val = Val}, Opts, Role) ->
    item_str(Val, Opts, Role);
gain_text(#loss{label = item, val = Val}, Opts, Role) ->
    item_str(Val, Opts, Role);
gain_text(#gain{label = items, val = Val}, Opts,
	  Role) ->
    item_str(Val, Opts, Role);
gain_text(#gain{label = items_to_bag, val = Val}, Opts,
	  Role) ->
    item_str(Val, Opts, Role);
gain_text(#gain{label = item_base_id, val = Val,
		flag = Flag},
	  Opts, Role) ->
    Items = to_items(Val, Flag),
    item_str(Items, Opts, Role);
gain_text(#loss{label = item_base_id, val = Val,
		flag = Flag},
	  Opts, Role) ->
    Items = to_items(Val, Flag),
    item_str(Items, Opts, Role);
gain_text(#gain{label = items_to_partner_bag, val = Val,
		flag = Flag},
	  Opts, Role) ->
    Items = to_items(Val, Flag),
    item_str(Items, Opts, Role);
gain_text(#gain{label = item_base_id_to_bag, val = Val,
		flag = Flag},
	  Opts, Role) ->
    Items = to_items(Val, Flag),
    item_str(Items, Opts, Role);
gain_text(#gain{label = item_base_id_to_eqm_bag,
		val = Val, flag = Flag},
	  Opts, Role) ->
    Items = to_items(Val, Flag),
    item_str(Items, Opts, Role);
gain_text(#gain{label = item_base_id_to_home_bag,
		val = Val, flag = Flag},
	  Opts, Role) ->
    Items = to_items(Val, Flag),
    item_str(Items, Opts, Role);
gain_text(#gain{label = item_base_id_to_pet_bag,
		val = Val, flag = Flag},
	  Opts, Role) ->
    Items = to_items(Val, Flag),
    item_str(Items, Opts, Role);
gain_text(#gain{label = use_item, val = Val,
		flag = Flag},
	  Opts, Role) ->
    Items = to_items(Val, Flag),
    item_str(Items, Opts, Role);
gain_text(#gain{label = holiday_item, val = Val,
		flag = Flag},
	  Opts, Role) ->
    Items = to_items(Val, Flag),
    item_str(Items, Opts, Role);
gain_text(#gain{label = Label, val = Val}, _Opts, _Role)
    when is_atom(Label) andalso is_integer(Val) ->
    util:fbin("~ts~ts",
	      [color:format({assets, Label}),
	       color:string(green, Val)]);
gain_text(#loss{label = Label, val = Val}, _Opts, _Role)
    when is_atom(Label) andalso is_integer(Val) ->
    util:fbin("~ts~ts",
	      [color:format({assets, Label}),
	       color:string(red, Val)]);
gain_text(L,
	  Opts = #gain_loss_opts{title = Title,
				 gain_tag = GainTag, loss_tag = LossTag,
				 order = Order, split_op_str = SplitOp},
	  Role)
    when is_list(L) ->
    case split_gl(L, [], []) of
      {[], []} -> <<>>;
      {GAcc, []} ->
	  GainText = gain_text(GAcc, Opts, Role, <<>>),
	  Tag = case GainTag of
		  <<>> -> lang:get(<<"Nhận được"/utf8>>);
		  _ -> GainTag
		end,
	  util:fbin("~ts~ts~ts", [Title, Tag, GainText]);
      {[], LAcc} ->
	  LossText = gain_text(LAcc, Opts, Role, <<>>),
	  Tag = case LossTag of
		  <<>> -> lang:get(<<"Nhận được"/utf8>>);
		  _ -> LossTag
		end,
	  util:fbin("~ts~ts~ts", [Title, Tag, LossText]);
      {GAcc, LAcc} ->
	  GainText = gain_text(GAcc, Opts, Role, <<>>),
	  LossText = gain_text(LAcc, Opts, Role, <<>>),
	  GTag = case GainTag of
		   <<>> -> lang:get(<<"Nhận được"/utf8>>);
		   _ -> GainTag
		 end,
	  LTag = case LossTag of
		   <<>> -> lang:get(<<"Nhận được"/utf8>>);
		   _ -> LossTag
		 end,
	  Args = case Order of
		   gain ->
		       [Title, GTag, GainText, SplitOp, LTag, LossText];
		   loss -> [Title, LTag, LossText, SplitOp, GTag, GainText]
		 end,
	  util:fbin("~ts~ts~ts~ts~ts~ts", Args)
    end;
gain_text(Unknow, _Opts, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformat283, _,
       {__Levelformat283, __Tracesformat283}}
	  when __Levelformat283 band 8 /= 0 orelse
		 __Tracesformat283 /= [] ->
	  lager:do_log(error,
		       [{module, format}, {function, gain_text}, {line, 283},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未知的损益格式[Unknow:~w]",
				     [Role#role.name, Unknow]),
		       none, 4096, 8, __Levelformat283, __Tracesformat283,
		       lager_event, __Pidformat283);
      _ -> ok
    end,
    <<>>.

gain_text([], _Opts, _Role, Acc) -> Acc;
gain_text([H | T],
	  Opts = #gain_loss_opts{split_str = SplitStr}, Role,
	  Acc) ->
    case gain_text(H, Opts, Role) of
      <<>> -> gain_text(T, Opts, Role, Acc);
      Bin when is_binary(Bin) ->
	  NewAcc = case Acc of
		     <<>> -> <<Bin/binary>>;
		     _ -> <<Acc/binary, SplitStr/binary, Bin/binary>>
		   end,
	  gain_text(T, Opts, Role, NewAcc);
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformat302, _,
	     {__Levelformat302, __Tracesformat302}}
		when __Levelformat302 band 128 /= 0 orelse
		       __Tracesformat302 /= [] ->
		lager:do_log(debug,
			     [{module, format}, {function, gain_text},
			      {line, 302}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知的损益格式[gl:~w][Err:~w]",
					   [H, _False]),
			     none, 4096, 128, __Levelformat302,
			     __Tracesformat302, lager_event, __Pidformat302);
	    _ -> ok
	  end,
	  gain_text(T, Opts, Role, Acc)
    end;
gain_text(Unknow, _Opts, Role, _Acc) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformat306, _,
       {__Levelformat306, __Tracesformat306}}
	  when __Levelformat306 band 8 /= 0 orelse
		 __Tracesformat306 /= [] ->
	  lager:do_log(error,
		       [{module, format}, {function, gain_text}, {line, 306},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未知的损益格式[Unknow:~w]",
				     [Role#role.name, Unknow]),
		       none, 4096, 8, __Levelformat306, __Tracesformat306,
		       lager_event, __Pidformat306);
      _ -> ok
    end,
    <<>>.

-spec gain_to_items_assets(list()) -> {list(), list()}.

gain_to_items_assets(GL) ->
    do_gain_to_items_assets(GL, [], []).

do_gain_to_items_assets([], Items, Assets) ->
    {Items, Assets};
do_gain_to_items_assets([#gain{label = Label, val = Val}
			 | T],
			Items, Assets)
    when is_integer(Val) ->
    case item_data:assets_atom2code(Label) of
      0 -> do_gain_to_items_assets(T, Items, Assets);
      Code ->
	  do_gain_to_items_assets(T, Items,
				  [{Code, Val} | Assets])
    end;
do_gain_to_items_assets([#gain{label = item_base_id,
			       val = Val}
			 | T],
			Items, Assets) ->
    do_gain_to_items_assets(T, Val ++ Items, Assets);
do_gain_to_items_assets([#gain{label = items, val = Val}
			 | T],
			Items, Assets) ->
    do_gain_to_items_assets(T, Val ++ Items, Assets);
do_gain_to_items_assets([#gain{label =
				   items_to_partner_bag,
			       val = Val}
			 | T],
			Items, Assets) ->
    do_gain_to_items_assets(T, Val ++ Items, Assets);
do_gain_to_items_assets([_ | T], Items, Assets) ->
    do_gain_to_items_assets(T, Items, Assets).

-spec
     gain_to_cli_drop(#gain_loss_opts{}) -> [{integer(),
					      integer(), integer(), integer(),
					      integer()}].

gain_to_cli_drop(#gain_loss_opts{return_gl = Gain}) ->
    do_gain_to_cli_drop(Gain, []);
gain_to_cli_drop(Gain) when is_list(Gain) ->
    do_gain_to_cli_drop(Gain, []).

do_gain_to_cli_drop([], Result) -> Result;
do_gain_to_cli_drop([#loss{} | T], Result) ->
    do_gain_to_cli_drop(T, Result);
do_gain_to_cli_drop([#gain{label = partner,
			   val = {PartnerBid, PartnerId, Lev}, move_to = MoveTo}
		     | T],
		    Result) ->
    do_gain_to_cli_drop(T,
			[{9999, Lev, PartnerBid, PartnerId, MoveTo} | Result]);
do_gain_to_cli_drop([#gain{label = Label, val = Val,
			   move_to = MoveTo}
		     | T],
		    Result)
    when is_integer(Val) ->
    case item_data:assets_atom2code(Label) of
      0 -> do_gain_to_cli_drop(T, Result);
      Code ->
	  do_gain_to_cli_drop(T,
			      [{Code, 1, Val, 0, MoveTo} | Result])
    end;
do_gain_to_cli_drop([#gain{val = Val, move_to = MoveTo}
		     | T],
		    Result)
    when is_list(Val) ->
    Map = fun (#item{id = Id, base_id = Bid, bind = Bind,
		     quantity = Num}) ->
		  {Bid, Bind, Num, Id, MoveTo};
	      ({Bid, Bind, Num}) ->
		  case item:attr(type, Bid) of
		    102 -> {Bid, Bind, Num, 0, MoveTo};
		    _ -> {Bid, Bind, Num, 0, MoveTo}
		  end
	  end,
    Add = lists:map(Map, Val),
    do_gain_to_cli_drop(T, Add ++ Result);
do_gain_to_cli_drop([#gain{label = use_item,
			   val = {Bid, Bind, Num}, move_to = MoveTo}
		     | T],
		    Result) ->
    case gift_data:get_week_reward(Bid) of
      [{NewBid, NewNum} | _] ->
	  do_gain_to_cli_drop(T,
			      [{NewBid, Bind, NewNum, 0, MoveTo} | Result]);
      _ ->
	  do_gain_to_cli_drop(T,
			      [{Bid, Bind, Num, 0, MoveTo} | Result])
    end;
do_gain_to_cli_drop([#gain{label = holiday_item,
			   val = {Bid, Bind, Num}, move_to = MoveTo}
		     | T],
		    Result) ->
    do_gain_to_cli_drop(T,
			[{Bid, Bind, Num, 0, MoveTo} | Result]);
do_gain_to_cli_drop([#gain{label = holiday_item,
			   val = {Bid, Num}, move_to = MoveTo}
		     | T],
		    Result) ->
    do_gain_to_cli_drop(T,
			[{Bid, 1, Num, 0, MoveTo} | Result]);
do_gain_to_cli_drop([#gain{label = Label, val = Val}
		     | T],
		    Result) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformat372, _,
       {__Levelformat372, __Tracesformat372}}
	  when __Levelformat372 band 8 /= 0 orelse
		 __Tracesformat372 /= [] ->
	  lager:do_log(error,
		       [{module, format}, {function, do_gain_to_cli_drop},
			{line, 372}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("gain to cli drop error ~w,~w",
				     [Label, Val]),
		       none, 4096, 8, __Levelformat372, __Tracesformat372,
		       lager_event, __Pidformat372);
      _ -> ok
    end,
    do_gain_to_cli_drop(T, Result).

split_gl([], GainAcc, LossAcc) ->
    {lists:reverse(GainAcc), lists:reverse(LossAcc)};
split_gl([L = #loss{} | Rest], GainAcc, LossAcc) ->
    split_gl(Rest, GainAcc, [L | LossAcc]);
split_gl([G = #gain{} | Rest], GainAcc, LossAcc) ->
    split_gl(Rest, [G | GainAcc], LossAcc);
split_gl([_ | Rest], GainAcc, LossAcc) ->
    split_gl(Rest, GainAcc, LossAcc).

item_str([], _Opts, _Role) -> <<>>;
item_str(Item = #item{}, _Opts, _Role) ->
    util:fbin("~ts", [color:format({item, Item})]);
item_str({bid, Bid, Num}, _Opts, _Role) ->
    util:fbin("~ts", [color:format({item, {Bid, Num}})]);
item_str({_ItemId, 0}, _Opts, _Role) -> <<>>;
item_str({ItemId, Num}, _Opts, #role{p_bag = PBag})
    when is_integer(ItemId) ->
    case package:find(by_id, ItemId, PBag) of
      [#item{base_id = Bid}] ->
	  util:fbin("~ts", [color:format({item, {Bid, Num}})]);
      _ -> <<>>
    end;
item_str(ItemId, _Opts, #role{p_bag = PBag})
    when is_integer(ItemId) ->
    case package:find(by_id, ItemId, PBag) of
      [#item{base_id = Bid}] ->
	  util:fbin("~ts", [color:format({item, Bid})]);
      _ -> <<>>
    end;
item_str(Items, Opts, Role) when is_list(Items) ->
    item_str(Items, Opts, Role, <<>>);
item_str(_Unkown, _Opts, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformat411, _,
       {__Levelformat411, __Tracesformat411}}
	  when __Levelformat411 band 8 /= 0 orelse
		 __Tracesformat411 /= [] ->
	  lager:do_log(error,
		       [{module, format}, {function, item_str}, {line, 411},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未知格式物品：~w",
				     [Role#role.name, _Unkown]),
		       none, 4096, 8, __Levelformat411, __Tracesformat411,
		       lager_event, __Pidformat411);
      _ -> ok
    end,
    <<>>.

item_str([], _Opts, _Role, Bin) -> Bin;
item_str([Item | T], Opts, Role, Bin) ->
    NewBin = case item_str(Item, Opts, Role) of
	       BinStr when <<>> =/= BinStr andalso is_binary(BinStr) ->
		   case Bin of
		     <<>> -> BinStr;
		     _ -> <<Bin/binary, ", ", BinStr/binary>>
		   end;
	       _ -> Bin
	     end,
    item_str(T, Opts, Role, NewBin).

-spec split_assets_items(list()) -> {list(), list()}.

split_assets_items(List) ->
    do_split_assets_items(List, [], []).

do_split_assets_items([], Assets, Items) ->
    {Assets, Items};
do_split_assets_items([{Bid, Num} | T], Assets, Items)
    when Bid < 1000 ->
    NewAssets = list_util:keyadd(Bid, Num, Assets),
    do_split_assets_items(T, NewAssets, Items);
do_split_assets_items([{Bid, _, Num} | T], Assets,
		      Items)
    when Bid < 1000 ->
    NewAssets = list_util:keyadd(Bid, Num, Assets),
    do_split_assets_items(T, NewAssets, Items);
do_split_assets_items([I | T], Assets, Items) ->
    do_split_assets_items(T, Assets, [I | Items]).

-spec split_exp_and_other(list()) -> {Exp :: integer(),
				      PartnerExp :: integer(),
				      [{integer(), integer(), integer()}]}.

split_exp_and_other(List) ->
    do_split_exp_and_other(List, {0, 0, []}).

do_split_exp_and_other([], Result) -> Result;
do_split_exp_and_other([{5, V} | T],
		       {Exp, PartnerExp, Items}) ->
    do_split_exp_and_other(T, {Exp + V, PartnerExp, Items});
do_split_exp_and_other([{6, V} | T],
		       {Exp, PartnerExp, Items}) ->
    do_split_exp_and_other(T, {Exp, PartnerExp + V, Items});
do_split_exp_and_other([{1, V} | T],
		       {Exp, PartnerExp, Items}) ->
    do_split_exp_and_other(T,
			   {Exp, PartnerExp, [{1, 1, V} | Items]});
do_split_exp_and_other([{3, V} | T],
		       {Exp, PartnerExp, Items}) ->
    do_split_exp_and_other(T,
			   {Exp, PartnerExp, [{3, 1, V} | Items]});
do_split_exp_and_other([H | T],
		       {Exp, PartnerExp, Items}) ->
    do_split_exp_and_other(T,
			   {Exp, PartnerExp, [H | Items]}).

-spec to_assets(list()) -> list().

to_assets(L) -> to_assets(L, []).

to_assets([], L) -> L;
to_assets([{Atom, Val} | T], L)
    when is_atom(Atom) andalso
	   is_integer(Val) andalso Val =/= 0 ->
    case item_data:assets_atom2code(Atom) of
      0 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformat467, _,
	     {__Levelformat467, __Tracesformat467}}
		when __Levelformat467 band 8 /= 0 orelse
		       __Tracesformat467 /= [] ->
		lager:do_log(error,
			     [{module, format}, {function, to_assets},
			      {line, 467}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("错误类型:atom:~w, val:~w", [Atom, Val]),
			     none, 4096, 8, __Levelformat467, __Tracesformat467,
			     lager_event, __Pidformat467);
	    _ -> ok
	  end,
	  to_assets(T, L);
      Code -> to_assets(T, [{Code, Val} | L])
    end;
to_assets([{Code, Val} | T], L)
    when is_integer(Code) andalso
	   is_integer(Val) andalso Val =/= 0 andalso Code < 1000 ->
    to_assets(T, [{Code, Val} | L]);
to_assets([_ | T], L) -> to_assets(T, L).

-spec to_items([tuple()], Flag :: atom()) -> [#item{}].

to_items(Items, Flag) -> to_items_(Items, Flag, []).

to_items_([], _Flag, L) -> L;
to_items_([I | Rest], Flag, L) ->
    AddItems = to_item(I, Flag),
    to_items_(Rest, Flag, AddItems ++ L);
to_items_(I, Flag, _L) -> to_item(I, Flag).

-spec to_item(tuple(), Flag :: atom()) -> [#item{}].

to_item({BaseId, Num}, Flag) ->
    to_item({BaseId, 1, Num, Flag}, Flag);
to_item({BaseId, Bind, Num}, Flag) ->
    to_item({BaseId, Bind, Num, Flag}, Flag);
to_item({BaseId, Bind, Num, SpecFlag}, Flag) ->
    case item:make(BaseId, Bind, Num, SpecFlag) of
      {ok, Items} -> Items;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformat502, _,
	     {__Levelformat502, __Tracesformat502}}
		when __Levelformat502 band 8 /= 0 orelse
		       __Tracesformat502 /= [] ->
		lager:do_log(error,
			     [{module, format}, {function, to_item},
			      {line, 502}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("非法物品数据：BaseId:~w, Num:~w, SpecFlag:~w, "
					   "Flag:~w",
					   [BaseId, Num, SpecFlag, Flag]),
			     none, 4096, 8, __Levelformat502, __Tracesformat502,
			     lager_event, __Pidformat502);
	    _ -> ok
	  end,
	  []
    end;
to_item(Item = #item{}, _Flag) -> [Item];
to_item(I, Flag) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformat508, _,
       {__Levelformat508, __Tracesformat508}}
	  when __Levelformat508 band 8 /= 0 orelse
		 __Tracesformat508 /= [] ->
	  lager:do_log(error,
		       [{module, format}, {function, to_item}, {line, 508},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("非法物品数据[Item:~w][flag:~w]", [I, Flag]),
		       none, 4096, 8, __Levelformat508, __Tracesformat508,
		       lager_event, __Pidformat508);
      _ -> ok
    end,
    [].

item_split_by_overlap(L) ->
    item_split_by_overlap_(L, []).

item_split_by_overlap_([], L) -> lists:reverse(L);
item_split_by_overlap_([{Bid, Num} | T], L)
    when is_integer(Bid) ->
    case item_data:assets_code2atom(Bid) of
      undefined ->
	  case item_data:get(Bid) of
	    #item_base{overlap = OverLap} when Num > OverLap ->
		item_split_by_overlap_([{Bid, Num - OverLap} | T],
				       [{Bid, OverLap} | L]);
	    _ -> item_split_by_overlap_(T, [{Bid, Num} | L])
	  end;
      _ -> item_split_by_overlap_(T, [{Bid, Num} | L])
    end;
item_split_by_overlap_([{Bid, Bind, Num} | T], L)
    when is_integer(Bid) ->
    case item_data:assets_code2atom(Bid) of
      undefined ->
	  case item_data:get(Bid) of
	    #item_base{overlap = OverLap} when Num > OverLap ->
		item_split_by_overlap_([{Bid, Bind, Num - OverLap} | T],
				       [{Bid, Bind, OverLap} | L]);
	    _ -> item_split_by_overlap_(T, [{Bid, Bind, Num} | L])
	  end;
      _ -> item_split_by_overlap_(T, [{Bid, Bind, Num} | L])
    end;
item_split_by_overlap_([G = #gain{label = item_base_id,
				  val = List}
			| T],
		       L) ->
    L1 = [G#gain{val = [I]}
	  || I <- item_split_by_overlap(List)],
    item_split_by_overlap_(T, L1 ++ L);
item_split_by_overlap_([I | T], L) ->
    item_split_by_overlap_(T, [I | L]).


