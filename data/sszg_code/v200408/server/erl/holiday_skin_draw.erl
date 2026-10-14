-file("src/mod/holiday_skin_draw/holiday_skin_draw.erl",
      1).

-module(holiday_skin_draw).

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
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]},
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

-export([lottery/1, get_information/1, zero_flush/1]).

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

-file("src/mod/holiday_skin_draw/holiday_skin_draw.erl",
      13).

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

-file("src/mod/holiday_skin_draw/holiday_skin_draw.erl",
      14).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/mod/holiday_skin_draw/holiday_skin_draw.erl",
      15).

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

-file("src/mod/holiday_skin_draw/holiday_skin_draw.erl",
      16).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/holiday_skin_draw/holiday_skin_draw.erl",
      17).

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

-file("src/mod/holiday_skin_draw/holiday_skin_draw.erl",
      18).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_skin_draw/holiday_skin_draw.erl",
      19).

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{p_bag = PBag}) ->
    NewRole = case holiday_lib:get_open_holiday(Role,
						[993036])
		  of
		#holiday{} -> Role;
		_ ->
		    Id = holiday_skin_draw_data:get_const(item),
		    {_, HasNum} = package:count(by_base_id, Id, PBag),
		    case HasNum > 0 of
		      true ->
			  Loss = format:val_to_loss([{Id, HasNum}],
						    holiday_skin_draw),
			  case role_gain:do(Role, Loss) of
			    {ok, LossRole} ->
				log:log_gain(Loss, Role, LossRole,
					     <<"不放回皮肤抽奖"/utf8>>,
					     <<"活动结束回收消耗"/utf8>>),
				{ChangeId, Num} =
				    holiday_skin_draw_data:get_const(change_gold),
				Items = [{ChangeId, Num * HasNum}],
				{ok, MailRole} = mail:add(LossRole,
							  {lang:get(<<"皮肤活动道具返还"/utf8>>),
							   lang:get(<<"亲爱的冒险者大人：\n这是您在暗影暴君皮肤抽奖活动中尚未使用的道具，现活动已结束，道具1："
								      "1返还10万金币，请查收。"/utf8>>),
							   Items, [],
							   <<"不放回皮肤抽奖"/utf8>>}),
				MailRole;
			    _ -> Role
			  end;
		      _ -> Role
		    end
	      end,
    {ok, NewRole}.

-spec lottery(#role{}) -> {ok, #role{}} |
			  {false, string()}.

lottery(Role) ->
    do_lottery([check_cond, loss, get_lottery], Role, #{}).

-spec get_information(#role{}) -> {pos_integer(),
				   pos_integer(), pos_integer()}.

get_information(Role) ->
    Data = case holiday_lib:get_holiday_value(Role, 993036)
	       of
	     {Time, ItemList} ->
		 case holiday_lib:get_open_holiday(Role, [993036]) of
		   #holiday{end_time = EndTime} ->
		       Now = date:unixtime(),
		       LastTime = max(0, EndTime - Now),
		       case holiday_skin_draw_data:get_loss(Time) of
			 {Lottery, _, _} ->
			     NewItemList = case ItemList of
					     [] when Time < 2 ->
						 holiday_skin_draw_data:get_all();
					     _ -> ItemList
					   end,
			     SortList = [Sort
					 || {_, _, _, _, _, _, Sort}
						<- NewItemList],
			     {Time, LastTime, Lottery, SortList};
			 _ ->
			     case holiday_skin_draw_data:get_loss(max(1,
								      Time - 1))
				 of
			       {Lottery, _, _} -> {Time, LastTime, Lottery, []};
			       _ -> {Time, LastTime, 1001, []}
			     end
		       end;
		   _ -> {0, 0, 0, []}
		 end;
	     _ -> {0, 0, 0, []}
	   end,
    Data.

do_lottery([], Role, #{sort := Sort, time := Time}) ->
    {ok, Role, Sort, Time};
do_lottery([One | Rest], Role, Args) ->
    case do_lottery(One, Role, Args) of
      ok -> do_lottery(Rest, Role, Args);
      {ok, NewRole} -> do_lottery(Rest, NewRole, Args);
      {ok, NewRole, NewArgs} ->
	  do_lottery(Rest, NewRole, NewArgs);
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"抽奖失败"/utf8>>)}
    end;
do_lottery(check_cond, Role, Args) ->
    case holiday_lib:get_open_holiday(Role, [993036]) of
      Holiday = #holiday{} ->
	  {ok, Role, Args#{holiday => Holiday}};
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end;
do_lottery(loss, Role = #role{p_bag = PBag}, Args) ->
    case holiday_lib:get_holiday_value(Role, 993036) of
      {Time, ItemList} ->
	  case holiday_skin_draw_data:get_loss(Time) of
	    {Lottery, Id, Num} ->
		{_, HasNum} = package:count(by_base_id, Id, PBag),
		Loss = case HasNum >= Num of
			 true ->
			     format:val_to_loss([{Id, Num}], holiday_skin_draw);
			 _ ->
			     DiffCount = max(0, Num - HasNum),
			     {ReplaceId, ReplaceNum} =
				 holiday_skin_draw_data:get_const(change_diamo),
			     format:val_to_loss([{Id, HasNum},
						 {ReplaceId,
						  ReplaceNum * DiffCount}],
						holiday_skin_draw)
		       end,
		case role_gain:do(Role, Loss) of
		  {ok, NewRole} ->
		      log:log_gain(Loss, Role, NewRole, <<"不放回皮肤抽奖"/utf8>>,
				   <<"抽奖消耗"/utf8>>),
		      {ok, NewRole,
		       Args#{item_list => ItemList, lottery => Lottery,
			     time => Time}};
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  _ -> {false, lang:get(<<"资产扣除失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"抽奖次数已满"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end;
do_lottery(get_lottery, Role,
	   Args = #{item_list := ItemList, lottery := Lottery,
		    time := Time, holiday := Holiday}) ->
    case ItemList of
      [] when Time < 2 ->
	  AllItemList = holiday_skin_draw_data:get_all(),
	  do_get_lottery(AllItemList, Lottery, Time, Holiday,
			 Role, Args);
      [] -> {false, lang:get(<<"奖品已抽完"/utf8>>)};
      _ ->
	  do_get_lottery(ItemList, Lottery, Time, Holiday, Role,
			 Args)
    end;
do_lottery(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_get_lottery(ItemList, Lottery, Time,
	       Holiday = #holiday{camp_id = CampId}, Role, Args) ->
    ItemList1 = [Item
		 || Item = {ILottery, _, _, _, _, MustTime, _}
			<- ItemList,
		    ILottery =:= Lottery, Time =:= MustTime],
    case ItemList1 of
      [] ->
	  ItemList2 = [Item
		       || Item = {ILottery1, _, _, _, NeverTime, _, _}
			      <- ItemList,
			  ILottery1 =:= Lottery, Time > NeverTime],
	  case util:rand_list(ItemList2, 4) of
	    Reward = {_, ItemId, Num, _, _, _, Sort} ->
		Gain = format:val_to_gain([{ItemId, Num}],
					  holiday_skin_draw),
		case role_gain:do(Role, Gain) of
		  {ok, NewRole} ->
		      put(skin_draw, [{ItemId, Num}]),
		      log:log_gain(Gain, Role, NewRole, <<"不放回皮肤抽奖"/utf8>>,
				   <<"获得奖品"/utf8>>),
		      NewItemList = ItemList -- [Reward],
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewTime = Time + 1,
		      NewRole1 = holiday_lib:set_tv_val(CampId, NewRole,
							{NewTime, NewItemList},
							ExpireSec),
		      {ok, NewRole1, Args#{sort => Sort, time => NewTime}};
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  _ -> {false, lang:get(<<"奖品无法获得"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"奖品已经抽完拉"/utf8>>)}
	  end;
      _ ->
	  case util:rand_list(ItemList1, 4) of
	    Reward = {_, ItemId, Num, _, _, _, Sort} ->
		Gain = format:val_to_gain([{ItemId, Num}],
					  holiday_skin_draw),
		case role_gain:do(Role, Gain) of
		  {ok, NewRole} ->
		      put(skin_draw, [{ItemId, Num}]),
		      log:log_gain(Gain, Role, NewRole, <<"不放回皮肤抽奖"/utf8>>,
				   <<"获得奖品"/utf8>>),
		      NewItemList = ItemList -- [Reward],
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewTime = Time + 1,
		      NewRole1 = holiday_lib:set_tv_val(CampId, NewRole,
							{NewTime, NewItemList},
							ExpireSec),
		      {ok, NewRole1, Args#{sort => Sort, time => NewTime}};
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  _ -> {false, lang:get(<<"奖品无法获得"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"奖品已经抽完拉"/utf8>>)}
	  end
    end.


