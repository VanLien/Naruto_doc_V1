-file("src/mod/holiday_war_order/holiday_war_order.erl",
      1).

-module(holiday_war_order).

-lager_records([{assets,
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
		{activity, [id, status, name, data, ext_args]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]},
		{war_order_data,
		 [goal_id, period, quest_type, day, min_day, max_day,
		  status, condition, lev, progress, award, target_type]},
		{m_war_order,
		 [ver, period, period_day, end_time, rmb_status,
		  exp_status, exp_num, quest_list, card, lev_reward]},
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

-export([gm_reset_wrong_period/1, close_ico/0,
	 close_ico/1, gm_reload/1, init/0, zero_flush/1, login/1,
	 fire/2, push_quest/1, push_lev_reward/1,
	 push_change_lev/2, push_gift/1, update_quest/3,
	 commit_quest/2, take_lev_reward/2, take_ext_reward/1,
	 buy_ext_exp/2, is_charge_war_order/2]).

-export([gm_login/1]).

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

-file("src/mod/holiday_war_order/holiday_war_order.erl",
      31).

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

-file("src/mod/holiday_war_order/holiday_war_order.erl",
      32).

-file("inc/war_order.hrl", 1).

-record(m_war_order,
	{ver = 1, period = 0, period_day = 0, end_time = 0,
	 rmb_status = 0, exp_status = 0, exp_num = 0,
	 quest_list = [], card = [], lev_reward = []}).

-record(war_order_data,
	{goal_id = 0  :: non_neg_integer(), period = 0,
	 quest_type = 0, day = 0  :: non_neg_integer(),
	 min_day = 0  :: non_neg_integer(),
	 max_day = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 award = [], target_type = 1  :: non_neg_integer()}).

-file("src/mod/holiday_war_order/holiday_war_order.erl",
      33).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/mod/holiday_war_order/holiday_war_order.erl",
      34).

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

-file("src/mod/holiday_war_order/holiday_war_order.erl",
      35).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_war_order/holiday_war_order.erl",
      36).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_war_order/holiday_war_order.erl",
      37).

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

-file("src/mod/holiday_war_order/holiday_war_order.erl",
      38).

gm_login(Role = #role{m_war_order =
			  #m_war_order{quest_list = QuestList}}) ->
    Role1 = #role{m_war_order =
		      MWarOrder = #m_war_order{quest_list = QuestList1}} =
		del_quest(QuestList, Role),
    QuestList2 = quest_revise:do_list(Role1,
				      holiday_war_order, QuestList1),
    {NewQuestList, NRole = #role{m_war_order = MWarOrder}} =
	quest:load_quest(QuestList2, [], holiday_war_order,
			 Role1),
    NRole1 = NRole#role{m_war_order =
			    MWarOrder#m_war_order{quest_list = NewQuestList}},
    {_, _, StartTime, _} = calc_day(NRole1),
    NRole2 = check_new_quest(NRole1, StartTime),
    {ok, NRole2}.

gm_reset_wrong_period(Role = #role{m_war_order =
				       MWarOrder = #m_war_order{period = Period,
								card = CardL},
				   holiday_assets = HolidayAssets}) ->
    case Period == 1 of
      true ->
	  NewCardL = util:if_true(CardL == [{101, 1}],
				  [{1101, 1}], CardL),
	  NewMWarOrder = MWarOrder#m_war_order{card = NewCardL,
					       lev_reward = [], exp_num = 0,
					       exp_status = 0},
	  NewHolidayAssets = lists:keydelete(80224, 1,
					     HolidayAssets),
	  NRole = Role#role{m_war_order = NewMWarOrder,
			    holiday_assets = NewHolidayAssets},
	  {ok, NRole};
      _ -> {ok, Role}
    end.

close_ico() ->
    role_group:apply(world,
		     {holiday_war_order, close_ico, []}).

close_ico(Role) ->
    set_activity_status(2, 0, []), {ok, Role}.

-spec gm_reload(#role{}) -> {ok, #role{}}.

gm_reload(Role = #role{m_war_order =
			   MWarOrder = #m_war_order{period = OldPeriod,
						    quest_list = QuestList}}) ->
    {Period, _PeriodDay, StartTime, EndTime} =
	calc_day(Role),
    if Period =:= 0 ->
	   NewQuestList = [Q#quest{end_time = 0}
			   || Q = #quest{} <- QuestList],
	   NRole = Role#role{m_war_order =
				 MWarOrder#m_war_order{quest_list =
							   NewQuestList}},
	   zero_flush(NRole);
       Period =:= OldPeriod ->
	   NewQuestList = do_gm_reload(QuestList, StartTime,
				       EndTime, []),
	   NRole = Role#role{m_war_order =
				 MWarOrder#m_war_order{quest_list =
							   NewQuestList}},
	   zero_flush(NRole);
       true -> {ok, Role}
    end.

do_gm_reload([], _, _, QuestList) -> QuestList;
do_gm_reload([Quest = #quest{id = Id} | T], StartTime,
	     EndTime, QuestList) ->
    case holiday_war_order_data:get_quest(Id) of
      #war_order_data{quest_type = QuestType, day = Day,
		      max_day = WeekMaxDay} ->
	  NewEndTimeT = if QuestType == 4 ->
			       StartTime + 86400 * Day - 1;
			   QuestType == 5 -> StartTime + 86400 * WeekMaxDay - 1;
			   true -> EndTime
			end,
	  NewEndTime = min(NewEndTimeT, EndTime),
	  NewQuest = Quest#quest{end_time = NewEndTime},
	  do_gm_reload(T, StartTime, EndTime,
		       [NewQuest | QuestList]);
      _ -> do_gm_reload(T, StartTime, EndTime, QuestList)
    end.

-spec init() -> #m_war_order{}.

init() -> #m_war_order{}.

zero_flush(Role = #role{m_war_order =
			    #m_war_order{period = OldPeriod,
					 quest_list = QuestList}}) ->
    {Period, PeriodDay, StartTime, EndTime} =
	calc_day(Role),
    OpenCond = holiday_war_order_data:open_cond(Period),
    Flag = case role_misc:check_open_cond(OpenCond, Role) of
	     true -> true;
	     _ -> false
	   end,
    if Period =:= 0 orelse Flag =/= true ->
	   case QuestList =/= [] of
	     true ->
		 {NRole, DelQuestList} = reissue_award(Role, 1),
		 NewRole = del_quest(DelQuestList, NRole),
		 set_activity_status(OldPeriod, 0, []),
		 push_gift(NewRole),
		 {ok, NewRole};
	     _ -> {ok, Role}
	   end;
       OldPeriod > Period -> {ok, Role};
       OldPeriod =/= Period ->
	   {NRole, DelQuestList} = reissue_award(Role, 1),
	   NRole1 = #role{m_war_order = MWarOrder} =
			del_quest(DelQuestList, NRole),
	   NRole2 = NRole1#role{m_war_order =
				    MWarOrder#m_war_order{period = Period,
							  period_day =
							      PeriodDay,
							  end_time = EndTime,
							  exp_status = 0}},
	   NewRole = check_new_quest(NRole2, StartTime),
	   set_activity_status(OldPeriod, 0, []),
	   set_activity_status(Period, 1, []),
	   push_gift(NewRole),
	   push_quest(NewRole),
	   {ok, NewRole};
       true ->
	   {Role1, DelQuestList} = reissue_award(Role, 0),
	   NRole = #role{m_war_order = MWarOrder} =
		       del_quest(DelQuestList, Role1),
	   NRole1 = NRole#role{m_war_order =
				   MWarOrder#m_war_order{period_day = PeriodDay,
							 end_time = EndTime,
							 exp_status = 0}},
	   NewRole = check_new_quest(NRole1, StartTime),
	   set_activity_status(Period, 1, []),
	   push_gift(NewRole),
	   {ok, NewRole}
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_war_order =
		       #m_war_order{period = OldPeriod,
				    period_day = OldPeriodDay,
				    quest_list = QuestList}}) ->
    {Period, PeriodDay, StartTime, EndTime} =
	calc_day(Role),
    OpenCond = holiday_war_order_data:open_cond(Period),
    Flag = case role_misc:check_open_cond(OpenCond, Role) of
	     true -> true;
	     _ -> false
	   end,
    if Period =:= 0 orelse Flag =/= true ->
	   case QuestList =/= [] of
	     true ->
		 {NewRole, _} = reissue_award(Role, 1), {ok, NewRole};
	     _ -> {ok, Role}
	   end;
       OldPeriod > Period -> {ok, Role};
       OldPeriod =/= Period ->
	   {NRole = #role{m_war_order = MWarOrder}, _} =
	       reissue_award(Role, 1),
	   NRole1 = NRole#role{m_war_order =
				   MWarOrder#m_war_order{period = Period,
							 period_day = PeriodDay,
							 end_time = EndTime}},
	   NewRole = check_new_quest(NRole1, StartTime),
	   set_activity_status(Period, 1, []),
	   {ok, NewRole};
       true ->
	   case OldPeriodDay =:= PeriodDay of
	     true ->
		 QuestList1 = quest_revise:do_list(Role,
						   holiday_war_order,
						   QuestList),
		 {NewQuestList, Role1 = #role{m_war_order = MWarOrder}} =
		     quest:load_quest(QuestList1, [], holiday_war_order,
				      Role),
		 NewRole = check_new_quest(Role1#role{m_war_order =
							  MWarOrder#m_war_order{quest_list
										    =
										    NewQuestList,
										end_time
										    =
										    EndTime}},
					   StartTime),
		 set_activity_status(Period, 1, []),
		 {ok, NewRole};
	     _ ->
		 {Role1 = #role{m_war_order =
				    #m_war_order{quest_list = QuestList1}},
		  _} =
		     reissue_award(Role, 0),
		 QuestList2 = quest_revise:do_list(Role1,
						   holiday_war_order,
						   QuestList1),
		 {NewQuestList, NRole = #role{m_war_order = MWarOrder}} =
		     quest:load_quest(QuestList2, [], holiday_war_order,
				      Role1),
		 NRole1 = NRole#role{m_war_order =
					 MWarOrder#m_war_order{period_day =
								   PeriodDay,
							       end_time =
								   EndTime,
							       quest_list =
								   NewQuestList}},
		 NewRole = check_new_quest(NRole1, StartTime),
		 set_activity_status(Period, 1, []),
		 {ok, NewRole}
	   end
    end.

-spec fire(#role{}, map()) -> {ok, #role{}}.

fire(Role = #role{name = Name,
		  m_war_order = MWarOrder = #m_war_order{card = CardL}},
     Opt = #{sn := Sn, package_id := PackageId,
	     money := Money}) ->
    {Period, _PeriodDay, _StartTime, _EndTime} =
	calc_day(Role),
    case holiday_war_order_data:charge({Period, PackageId})
	of
      CardId when is_integer(CardId) ->
	  case lists:keyfind(CardId, 1, CardL) of
	    false ->
		Reward = holiday_war_order_data:get_card_award({Period,
								CardId}),
		Gain = format:val_to_gain(Reward, holiday_war_order),
		case role_gain:do_notice(Role, Gain) of
		  {false, _} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_war_order212, _,
			 {__Levelholiday_war_order212,
			  __Tracesholiday_war_order212}}
			    when __Levelholiday_war_order212 band 8 /= 0 orelse
				   __Tracesholiday_war_order212 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_war_order},
					  {function, fire}, {line, 212},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w领取战令礼包~w失败",
						       [Role#role.name,
							CardId]),
					 none, 4096, 8,
					 __Levelholiday_war_order212,
					 __Tracesholiday_war_order212,
					 lager_event,
					 __Pidholiday_war_order212);
			_ -> ok
		      end,
		      {ok, Role};
		  {ok, Role1} ->
		      NewCardL = lists:keystore(CardId, 1, CardL,
						{CardId, 1}),
		      NewRole = Role1#role{m_war_order =
					       MWarOrder#m_war_order{card =
									 NewCardL,
								     rmb_status
									 = 1}},
		      log:log_gain(Gain, Role, NewRole, <<"运营活动_战令"/utf8>>,
				   util:fbin("战令进阶卡:~w", [CardId])),
		      notice:broadcast(rumor_left_top,
				       color:msg(lang:get(<<"恭喜~ts玩家激活~ts进阶奖励，冒险大陆再添一位冒险勇士！"/utf8>>),
						 [{role, Name},
						  holiday_war_order_data:period_name(Period)])),
		      push_gift(NewRole),
		      {ok, NewRole}
		end;
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"运营活动_战令"/utf8>>,
			       util:fbin("战令活动充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

-spec update_quest(#role{}, #quest{},
		   #quest_progress{}) -> #role{}.

update_quest(Role = #role{m_war_order =
			      MWarOrder = #m_war_order{quest_list = QuestList}},
	     Q = #quest{id = QuestId, progress = P},
	     Progress = #quest_progress{id = ProgressId}) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    P, Progress),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuestList = lists:keyreplace(QuestId, #quest.id,
					  QuestList, NewQuest),
	  NewRole = Role#role{m_war_order =
				  MWarOrder#m_war_order{quest_list =
							    NewQuestList}},
	  push_quest(NewRole, [NewQuest]),
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuestList = lists:keyreplace(QuestId, #quest.id,
					  QuestList, NewQuest),
	  push_quest(Role, [NewQuest]),
	  Role#role{m_war_order =
			MWarOrder#m_war_order{quest_list = NewQuestList}}
    end.

-spec push_quest(#role{}) -> ok.

push_quest(Role = #role{m_war_order =
			    #m_war_order{quest_list = QuestList,
					 period = Period,
					 period_day = PeriodDay,
					 end_time = EndTime,
					 rmb_status = RmbStatus,
					 exp_status = ExpStatus}}) ->
    CliList = [to_cli(I) || I = #quest{} <- QuestList],
    {Lev, Exp} = calc_lev(Role),
    sys_conn:pack_send(25300,
		       {Period, PeriodDay, EndTime, Lev, Exp, RmbStatus,
			ExpStatus, CliList}),
    ok.

-spec push_quest(#role{}, list()) -> ok.

push_quest(_Role, List) ->
    CliList = [to_cli(I) || I <- List],
    sys_conn:pack_send(25301, {CliList}),
    ok.

to_cli(#quest{id = Id, finish = Finish, type = Type,
	      end_time = EndTime,
	      progress =
		  [#quest_progress{target_val = TarVal, value = Val}]}) ->
    {Id, Type, Finish, TarVal, Val, EndTime};
to_cli(#quest{id = Id, type = Type, finish = Finish,
	      progress = []}) ->
    {Id, Type, Finish, 1, 1, 0}.

-spec push_change_lev(#role{}, pos_integer()) -> ok.

push_change_lev(Role = #role{m_war_order =
				 #m_war_order{period = Period}},
		ItemId) ->
    NeedItemId =
	holiday_war_order_data:get_exp_item(Period),
    case ItemId =:= NeedItemId of
      true ->
	  {Lev, Exp} = calc_lev(Role),
	  sys_conn:pack_send(25305, {Lev, Exp}),
	  ok;
      _ -> ok
    end.

-spec push_lev_reward(#role{}) -> ok.

push_lev_reward(Role = #role{m_war_order =
				 #m_war_order{lev_reward = LevReward}}) ->
    {Lev, _} = calc_lev(Role),
    sys_conn:pack_send(25303, {Lev, LevReward}),
    ok.

-spec push_gift(#role{}) -> ok.

push_gift(#role{m_war_order =
		    #m_war_order{rmb_status = RmbStatus,
				 exp_status = ExpStatus, card = CardL}}) ->
    sys_conn:pack_send(25306,
		       {RmbStatus, ExpStatus, CardL}),
    ok.

-spec take_lev_reward(#role{}, pos_integer()) -> {ok,
						  #role{}} |
						 {false, bitstring()}.

take_lev_reward(Role = #role{m_war_order =
				 MWarOrder = #m_war_order{lev_reward =
							      LevReward,
							  period = Period,
							  rmb_status =
							      RmbStatus}},
		0) ->
    {Lev, _} = calc_lev(Role),
    case holiday_war_order_data:lev_reward_list(Period) of
      LevRewardCfg = [_ | _] ->
	  CanGetLevReward = [LevCfg
			     || LevCfg <- LevRewardCfg, Lev >= LevCfg],
	  Fun = fun (LevT, {AllRewardT, LevRewardT}) ->
			RewardT = holiday_war_order_data:get_lev_reward({Period,
									 LevT}),
			RmbRewardT =
			    holiday_war_order_data:get_rmb_lev_reward({Period,
								       LevT}),
			case lists:keyfind(LevT, 1, LevRewardT) of
			  false ->
			      case RmbStatus == 1 of
				true ->
				    Reward1 = item_lib:merge(RewardT,
							     RmbRewardT),
				    NAllRewardT = item_lib:merge(Reward1,
								 AllRewardT),
				    NLevRewardT = lists:keystore(LevT, 1,
								 LevRewardT,
								 {LevT, 1, 1}),
				    {NAllRewardT, NLevRewardT};
				_ ->
				    case RewardT of
				      [_ | _] ->
					  NAllRewardT = item_lib:merge(RewardT,
								       AllRewardT),
					  NLevRewardT = lists:keystore(LevT, 1,
								       LevRewardT,
								       {LevT, 1,
									0}),
					  {NAllRewardT, NLevRewardT};
				      _ -> {AllRewardT, LevRewardT}
				    end
			      end;
			  {_, 1, 0} when RmbStatus == 1 ->
			      NAllRewardT = item_lib:merge(RmbRewardT,
							   AllRewardT),
			      NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
							   {LevT, 1, 1}),
			      {NAllRewardT, NLevRewardT};
			  _ -> {AllRewardT, LevRewardT}
			end
		end,
	  {AllReward, NewLevReward} = lists:foldl(Fun,
						  {[], LevReward},
						  CanGetLevReward),
	  case AllReward =:= [] of
	    true -> {false, lang:get(<<"没有可领取的奖励"/utf8>>)};
	    _ ->
		GL = format:val_to_gain(AllReward, holiday_war_order),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, NRole} ->
		      log:log_gain(GL, Role, NRole, <<"运营活动_战令"/utf8>>,
				   util:fbin("一键领取，等级~w，特权：~w，领取前~w",
					     [Lev, RmbStatus, LevReward])),
		      NewRole = NRole#role{m_war_order =
					       MWarOrder#m_war_order{lev_reward
									 =
									 NewLevReward}},
		      push_lev_reward(NewRole),
		      {ok, NewRole}
		end
	  end;
      _ -> {false, lang:get(<<"当前不在活动期间"/utf8>>)}
    end;
take_lev_reward(Role = #role{m_war_order =
				 MWarOrder = #m_war_order{lev_reward =
							      LevReward,
							  period = Period,
							  rmb_status =
							      RmbStatus}},
		Id) ->
    {Lev, _} = calc_lev(Role),
    case Id > Lev of
      true -> {false, lang:get(<<"未达到领取等级"/utf8>>)};
      _ ->
	  case holiday_war_order_data:get_lev_reward({Period, Id})
	      of
	    Reward = [_ | _] ->
		case lists:keyfind(Id, 1, LevReward) of
		  false when RmbStatus == 1 ->
		      RmbReward =
			  holiday_war_order_data:get_rmb_lev_reward({Period,
								     Id}),
		      GL = format:val_to_gain(Reward ++ RmbReward,
					      war_order_lev_reward),
		      case role_gain:do_notice(Role, GL) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, NRole} ->
			    NewLevReward = lists:keystore(Id, 1, LevReward,
							  {Id, 1, 1}),
			    NewRole = NRole#role{m_war_order =
						     MWarOrder#m_war_order{lev_reward
									       =
									       NewLevReward}},
			    log:log_gain(GL, Role, NewRole, <<"运营活动_战令"/utf8>>,
					 util:fbin("领取普通和付费等级奖励 ~w", [Id])),
			    push_lev_reward(NewRole),
			    {ok, NewRole}
		      end;
		  false ->
		      GL = format:val_to_gain(Reward, war_order_lev_reward),
		      case role_gain:do_notice(Role, GL) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, NRole} ->
			    NewLevReward = lists:keystore(Id, 1, LevReward,
							  {Id, 1, 0}),
			    NewRole = NRole#role{m_war_order =
						     MWarOrder#m_war_order{lev_reward
									       =
									       NewLevReward}},
			    log:log_gain(GL, Role, NewRole, <<"运营活动_战令"/utf8>>,
					 util:fbin("领取普通等级奖励 ~w", [Id])),
			    push_lev_reward(NewRole),
			    {ok, NewRole}
		      end;
		  {_, 1, 0} when RmbStatus == 1 ->
		      case holiday_war_order_data:get_rmb_lev_reward({Period,
								      Id})
			  of
			RmbReward = [_ | _] ->
			    GL = format:val_to_gain(RmbReward,
						    war_order_lev_reward),
			    case role_gain:do_notice(Role, GL) of
			      {false, #gain{msg = Msg}} -> {false, Msg};
			      {ok, NRole} ->
				  NewLevReward = lists:keystore(Id, 1,
								LevReward,
								{Id, 1, 1}),
				  NewRole = NRole#role{m_war_order =
							   MWarOrder#m_war_order{lev_reward
										     =
										     NewLevReward}},
				  log:log_gain(GL, Role, NewRole,
					       <<"运营活动_战令"/utf8>>,
					       util:fbin("领取付费等级奖励 ~w", [Id])),
				  push_lev_reward(NewRole),
				  {ok, NewRole}
			    end;
			_ -> {false, lang:get(<<"奖励不存在"/utf8>>)}
		      end;
		  {_, 1, 0} -> {false, lang:get(<<"未达到领取条件"/utf8>>)};
		  _ -> {false, lang:get(<<"奖励已领取"/utf8>>)}
		end;
	    _ ->
		case lists:keyfind(Id, 1, LevReward) of
		  false when RmbStatus == 1 ->
		      case holiday_war_order_data:get_rmb_lev_reward({Period,
								      Id})
			  of
			RmbReward = [_ | _] ->
			    GL = format:val_to_gain(RmbReward,
						    war_order_lev_reward),
			    case role_gain:do_notice(Role, GL) of
			      {false, #gain{msg = Msg}} -> {false, Msg};
			      {ok, NRole} ->
				  NewLevReward = lists:keystore(Id, 1,
								LevReward,
								{Id, 1, 1}),
				  NewRole = NRole#role{m_war_order =
							   MWarOrder#m_war_order{lev_reward
										     =
										     NewLevReward}},
				  log:log_gain(GL, Role, NewRole,
					       <<"运营活动_战令"/utf8>>,
					       util:fbin("领取付费等级奖励 ~w", [Id])),
				  push_lev_reward(NewRole),
				  {ok, NewRole}
			    end;
			_ -> {false, lang:get(<<"奖励不存在"/utf8>>)}
		      end;
		  {_, 1, 1} -> {false, lang:get(<<"奖励已领取"/utf8>>)};
		  _ -> {false, lang:get(<<"未达到领取条件"/utf8>>)}
		end
	  end
    end.

-spec take_ext_reward(#role{}) -> {ok, #role{}} |
				  {false, bitstring()}.

take_ext_reward(Role = #role{m_war_order =
				 MWarOrder = #m_war_order{rmb_status =
							      RmbStatus,
							  exp_num = ExpNum,
							  period = Period,
							  exp_status =
							      ExpStatus}}) ->
    case holiday_war_order_data:get_exp_item(Period) of
      ItemId when is_integer(ItemId) ->
	  DayExp = holiday_war_order_data:get_day_exp(Period),
	  if RmbStatus == 0 ->
		 {false, lang:get(<<"激活特权领取"/utf8>>)};
	     ExpStatus == 1 ->
		 {false, lang:get(<<"本日已领取该奖励"/utf8>>)};
	     RmbStatus == 1 andalso ExpStatus == 0 ->
		 GL = format:val_to_gain([{ItemId, DayExp}],
					 holiday_war_order),
		 case role_gain:do_notice(Role, GL) of
		   {false, #gain{msg = Msg}} -> {false, Msg};
		   {ok, Role1} ->
		       NRole = Role1#role{m_war_order =
					      MWarOrder#m_war_order{exp_status =
									1,
								    exp_num =
									ExpNum +
									  1}},
		       log:log_gain(GL, Role, NRole, <<"运营活动_战令"/utf8>>,
				    lang:get(<<"领取每日额外经验"/utf8>>)),
		       push_gift(NRole),
		       {ok, NRole}
		 end;
	     true -> {false, lang:get(<<"无法领取奖励"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"不可领取"/utf8>>)}
    end.

-spec buy_ext_exp(#role{}, pos_integer()) -> {ok,
					      #role{}} |
					     {false, bitstring()}.

buy_ext_exp(Role = #role{m_war_order =
			     #m_war_order{period = Period}},
	    BuyLev) ->
    {Lev, _} = calc_lev(Role),
    NewLev = BuyLev + Lev,
    case holiday_war_order_data:get_exp_item(Period) of
      ExpId when is_integer(ExpId) ->
	  case holiday_war_order_data:get_lev_exp({Period,
						   NewLev})
	      of
	    NeedExp when is_integer(NeedExp) ->
		BuyExp = BuyLev * 1000,
		ExpVal = holiday_war_order_data:get_exp_val(Period),
		NewExpVal = [{3,
			      util:round(BuyLev * 1000 * ExpVal / 10)}],
		case ExpVal =< 0 of
		  true -> {false, lang:get(<<"购买有误"/utf8>>)};
		  _ ->
		      Loss = format:val_to_loss(NewExpVal, holiday_war_order),
		      Gain = format:val_to_gain([{ExpId, BuyExp}],
						holiday_war_order),
		      GL = Gain ++ Loss,
		      case role_gain:do_notice(Role, GL) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{false, #loss{msg = Msg}} -> {false, Msg};
			{ok, NRole} ->
			    log:log_gain(GL, Role, NRole, <<"运营活动_战令"/utf8>>,
					 util:fbin("购买经验，当前~w级，购买~w级，经验~w",
						   [Lev, BuyLev, BuyExp])),
			    {ok, NRole}
		      end
		end;
	    _ -> {false, lang:get(<<"超出购买的等级限制"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"当前未开启战令活动"/utf8>>)}
    end.

-spec commit_quest(#role{},
		   Id :: pos_integer()) -> {false, binary()} |
					   {ok, #role{}}.

commit_quest(Role = #role{m_war_order =
			      MWarOrder = #m_war_order{quest_list = QuestList}},
	     Id) ->
    case holiday_war_order_data:get_reward(Id) of
      Items when is_list(Items) ->
	  case lists:keyfind(Id, #quest.id, QuestList) of
	    #quest{finish = 2} ->
		{false, lang:get(<<"任务已提交"/utf8>>)};
	    Q = #quest{finish = 1} ->
		GL = format:val_to_gain(Items, holiday_war_order_quest),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      NewQuest = Q#quest{finish = 2},
		      NewQuestList = lists:keyreplace(Id, #quest.id,
						      QuestList, NewQuest),
		      NRole = Role1#role{m_war_order =
					     MWarOrder#m_war_order{quest_list =
								       NewQuestList}},
		      push_quest(NRole, [NewQuest]),
		      log:log_gain(GL, Role, NRole, <<"运营活动_战令"/utf8>>,
				   util:fbin("id:~w", [Id])),
		      {ok, NRole}
		end;
	    #quest{} -> {false, lang:get(<<"任务未完成"/utf8>>)};
	    _ -> {false, lang:get(<<"任务不存在"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"配置数据不存在"/utf8>>)}
    end.

reissue_award(Role = #role{m_war_order =
			       #m_war_order{quest_list = []}},
	      _) ->
    {Role, []};
reissue_award(Role = #role{m_war_order =
			       MWarOrder = #m_war_order{period = Period,
							period_day = PeriodDay,
							quest_list =
							    QuestList}},
	      0) ->
    ExpItemId = holiday_war_order_data:get_exp_item(Period),
    Now = date:unixtime(),
    {RestQuestList, OverdueQL} = lists:partition(fun
						   (#quest{end_time =
							       EndTime}) ->
						       EndTime > Now
						 end,
						 QuestList),
    GrowFun = fun (#quest{id = QuestId, finish = 1},
		   {AccMailItem, AccExpItem}) ->
		      AwardList = holiday_war_order_data:get_reward(QuestId),
		      {ExpAward, MailAward} = lists:partition(fun ({ItemId,
								    _}) ->
								      ItemId =:=
									ExpItemId
							      end,
							      AwardList),
		      NewAccItem = item_lib:merge(MailAward, AccMailItem),
		      NewExpItem = item_lib:merge(ExpAward, AccExpItem),
		      {NewAccItem, NewExpItem};
		  (_, DataT) -> DataT
	      end,
    {MailItem, ExpItem} = lists:foldl(GrowFun, {[], []},
				      OverdueQL),
    NRole = case MailItem of
	      [_ | _] ->
		  {Assets, Items} = format:split_assets_items(MailItem),
		  PeriodName = holiday_war_order_data:period_name(Period),
		  {ok, RoleT} = mail:add(Role,
					 {util:fbin("~ts奖励补发", [PeriodName]),
					  util:fbin("亲爱的冒险者大人, 以下是您~ts活动中未领取的奖励，请查收",
						    [PeriodName]),
					  Assets, Items,
					  lang:get(<<"战令活动"/utf8>>),
					  86400 + date:unixtime()}),
		  RoleT;
	      _ -> Role
	    end,
    Gain = format:val_to_gain(ExpItem, holiday_war_order),
    NewRole = case role_gain:do(NRole, Gain) of
		{false, _} ->
		    case {whereis(lager_event), whereis(lager_event),
			  lager_config:get({lager_event, loglevel}, {0, []})}
			of
		      {undefined, undefined, _} ->
			  fun () -> {error, lager_not_running} end();
		      {undefined, _, _} ->
			  fun () -> {error, {sink_not_configured, lager_event}}
			  end();
		      {__Pidholiday_war_order556, _,
		       {__Levelholiday_war_order556,
			__Tracesholiday_war_order556}}
			  when __Levelholiday_war_order556 band 8 /= 0 orelse
				 __Tracesholiday_war_order556 /= [] ->
			  lager:do_log(error,
				       [{module, holiday_war_order},
					{function, reissue_award}, {line, 556},
					{pid, pid_to_list(self())},
					{node, node()}
					| lager:md()],
				       io_lib:format("【~w】无法领取战令补发奖励~w",
						     [Role#role.name, ExpItem]),
				       none, 4096, 8,
				       __Levelholiday_war_order556,
				       __Tracesholiday_war_order556,
				       lager_event, __Pidholiday_war_order556);
		      _ -> ok
		    end,
		    NRole;
		{ok, NRoleT} ->
		    log:log_gain(Gain, Role, NRoleT, <<"运营活动_战令"/utf8>>,
				 util:fbin("领取跨日补发奖励 ~w ~w",
					   [Period, PeriodDay])),
		    NRoleT
	      end,
    {NewRole#role{m_war_order =
		      MWarOrder#m_war_order{quest_list = RestQuestList,
					    exp_status = 0}},
     OverdueQL};
reissue_award(Role = #role{m_war_order =
			       MWarOrder = #m_war_order{period = Period,
							period_day = PeriodDay,
							quest_list = QuestList,
							lev_reward = LevReward,
							rmb_status =
							    RmbStatus}},
	      1) ->
    ExpItemId = holiday_war_order_data:get_exp_item(Period),
    GrowFun = fun (#quest{id = QuestId, finish = 1},
		   {AccMailItem, AccExpItem}) ->
		      AwardList = holiday_war_order_data:get_reward(QuestId),
		      {ExpAward, MailAward} = lists:partition(fun ({ItemId,
								    _}) ->
								      ItemId =:=
									ExpItemId
							      end,
							      AwardList),
		      NewAccItem = item_lib:merge(MailAward, AccMailItem),
		      NewExpItem = item_lib:merge(ExpAward, AccExpItem),
		      {NewAccItem, NewExpItem};
		  (_, DataT) -> DataT
	      end,
    {MailItem, ExpItem} = lists:foldl(GrowFun, {[], []},
				      QuestList),
    Gain = format:val_to_gain(ExpItem, holiday_war_order),
    NRole = case role_gain:do(Role, Gain) of
	      {false, _} ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_war_order578, _,
		     {__Levelholiday_war_order578,
		      __Tracesholiday_war_order578}}
			when __Levelholiday_war_order578 band 8 /= 0 orelse
			       __Tracesholiday_war_order578 /= [] ->
			lager:do_log(error,
				     [{module, holiday_war_order},
				      {function, reissue_award}, {line, 578},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("【~w】无法领取战令补发奖励~w",
						   [Role#role.name, ExpItem]),
				     none, 4096, 8, __Levelholiday_war_order578,
				     __Tracesholiday_war_order578, lager_event,
				     __Pidholiday_war_order578);
		    _ -> ok
		  end,
		  Role;
	      {ok, NRoleT} ->
		  log:log_gain(Gain, Role, NRoleT, <<"运营活动_战令"/utf8>>,
			       util:fbin("领取战令补发经验奖励 ~w ~w",
					 [Period, PeriodDay])),
		  NRoleT
	    end,
    {NewLev, _} = calc_lev(NRole),
    CanGetLevReward = [LevCfg
		       || LevCfg
			      <- holiday_war_order_data:lev_reward_list(Period),
			  NewLev >= LevCfg],
    Fun = fun (LevT, {AllRewardT, LevRewardT}) ->
		  RewardT = holiday_war_order_data:get_lev_reward({Period,
								   LevT}),
		  RmbRewardT =
		      holiday_war_order_data:get_rmb_lev_reward({Period,
								 LevT}),
		  case lists:keyfind(LevT, 1, LevRewardT) of
		    false ->
			case RmbStatus == 1 of
			  true ->
			      Reward1 = item_lib:merge(RewardT, RmbRewardT),
			      NAllRewardT = item_lib:merge(Reward1, AllRewardT),
			      NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
							   {LevT, 1, 1}),
			      {NAllRewardT, NLevRewardT};
			  _ ->
			      NAllRewardT = item_lib:merge(RewardT, AllRewardT),
			      NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
							   {LevT, 1, 0}),
			      {NAllRewardT, NLevRewardT}
			end;
		    {_, 1, 0} when RmbStatus == 1 ->
			NAllRewardT = item_lib:merge(RmbRewardT, AllRewardT),
			NLevRewardT = lists:keystore(LevT, 1, LevRewardT,
						     {LevT, 1, 1}),
			{NAllRewardT, NLevRewardT};
		    _ -> {AllRewardT, LevRewardT}
		  end
	  end,
    {AllReward, _} = lists:foldl(Fun, {[], LevReward},
				 CanGetLevReward),
    NewMailItem = item_lib:merge(AllReward, MailItem),
    NewRole0 = case NewMailItem of
		 [_ | _] ->
		     {Assets, Items} =
			 format:split_assets_items(NewMailItem),
		     PeriodName = holiday_war_order_data:period_name(Period),
		     {ok, RoleT} = mail:add(NRole,
					    {util:fbin("~ts奖励补发", [PeriodName]),
					     util:fbin("亲爱的冒险者大人, 以下是您~ts活动中未领取的奖励，请查收",
						       [PeriodName]),
					     Assets, Items,
					     lang:get(<<"战令活动"/utf8>>),
					     86400 + date:unixtime()}),
		     RoleT;
		 _ -> NRole
	       end,
    NewRole = del_holiday_assets(NewRole0, ExpItemId),
    {NewRole#role{m_war_order =
		      MWarOrder#m_war_order{quest_list = [], lev_reward = [],
					    rmb_status = 0, card = [],
					    exp_num = 0, exp_status = 0}},
     QuestList}.

del_holiday_assets(Role = #role{holiday_assets =
				    HolidayAssets},
		   ExpItemId) ->
    NewHolidayAssets = lists:keydelete(ExpItemId, 1,
				       HolidayAssets),
    Role#role{holiday_assets = NewHolidayAssets}.

-spec del_quest([#quest{}], #role{}) -> {[#quest{}],
					 #role{}}.

del_quest([], Role) -> Role;
del_quest([#quest{progress = Progress} | Other],
	  Role) ->
    Tids = [Tid
	    || #quest_progress{finish = 0, trigger = Tid}
		   <- Progress,
	       is_tuple(Tid)],
    NewRole = role_trigger:del(Tids, Role),
    del_quest(Other, NewRole).

check_new_quest(Role = #role{m_war_order =
				 #m_war_order{period = Period,
					      period_day = PeriodDay}},
		StartTime) ->
    WeekQuestList = [W
		     || W = #war_order_data{min_day = MinDay,
					    max_day = MaxDay}
			    <- holiday_war_order_data:week_quest_list(Period),
			PeriodDay >= MinDay, PeriodDay =< MaxDay],
    case holiday_war_order_data:day_quest_list({Period,
						PeriodDay})
	   ++
	   holiday_war_order_data:period_quest_list(Period) ++
	     WeekQuestList
	of
      QuestL = [_ | _] ->
	  do_check_new_quest(QuestL, StartTime, Role);
      _ -> Role
    end.

do_check_new_quest([], _, Role) -> Role;
do_check_new_quest([#war_order_data{quest_type =
					QuestType,
				    day = Day, max_day = WeekMaxDay,
				    goal_id = Id, progress = Progress}
		    | T],
		   StartTime,
		   Role = #role{m_war_order =
				    MWarOrder = #m_war_order{end_time = EndTime,
							     quest_list =
								 QuestList}}) ->
    OpenTime = sys_env:get(open_timestamp),
    case lists:keymember(Id, #quest.id, QuestList) of
      true -> do_check_new_quest(T, StartTime, Role);
      _ when Id == 44036 andalso OpenTime >= 1576166400 ->
	  do_check_new_quest(T, StartTime, Role);
      _ ->
	  Progress1 = quest_prog_init:do(Role, Progress, Id),
	  Finish = case [false
			 || #quest_progress{finish = 0} <- Progress1]
		       of
		     [] -> 1;
		     _ -> 0
		   end,
	  QuestEndTimeT = if QuestType == 4 ->
				 StartTime + 86400 * Day - 1;
			     QuestType == 5 ->
				 StartTime + 86400 * WeekMaxDay - 1;
			     true -> EndTime
			  end,
	  QuestEndTime = min(QuestEndTimeT, EndTime),
	  {NewProgress, Role1} = quest:load_progress(Progress1,
						     holiday_war_order, Id, [],
						     Role),
	  NewQuest = #quest{id = Id, finish = Finish,
			    progress = NewProgress, type = QuestType,
			    end_time = QuestEndTime},
	  NewQuestList = [NewQuest | QuestList],
	  NRole = Role1#role{m_war_order =
				 MWarOrder#m_war_order{quest_list =
							   NewQuestList}},
	  do_check_new_quest(T, StartTime, NRole)
    end.

calc_lev(#role{holiday_assets = HolidayAssets,
	       m_war_order = #m_war_order{period = Period}}) ->
    ItemId = holiday_war_order_data:get_exp_item(Period),
    case lists:keyfind(ItemId, 1, HolidayAssets) of
      {_, Exp} ->
	  Lev = case holiday_war_order_data:get_lev({Period, Exp})
		    of
		  LevT when is_integer(LevT) -> LevT;
		  _ -> 0
		end,
	  {Lev, Exp};
      _ ->
	  Lev = case holiday_war_order_data:get_lev({Period, 0})
		    of
		  LevT when is_integer(LevT) -> LevT;
		  _ -> 0
		end,
	  {Lev, 0}
    end.

set_activity_status(Period, Status, Args) ->
    case holiday_war_order_data:get_icon(Period) of
      Icon when is_integer(Icon) ->
	  activity_self:set_activity(Icon, Status, Args);
      _ -> skip
    end.

calc_day(Role) ->
    Now = date:unixtime(),
    OpenTime = holiday_war_order_data:period_list(),
    case is_open_time(OpenTime, Now, Role) of
      {true, Period, StartTime, EndTime} ->
	  PeriodDay = date:day_diff(StartTime, Now) + 1,
	  {Period, PeriodDay, StartTime, EndTime};
      _ -> {0, 0, 0, 0}
    end.

is_open_time([], _Now, _Role) -> false;
is_open_time([{Period, StartTime, EndTime} | Other],
	     Now, Role) ->
    Time1 = holiday_role:parse_time(StartTime, Role),
    Time2 = holiday_role:parse_time(EndTime, Role),
    case Now >= Time1 andalso Now =< Time2 of
      true -> {true, Period, Time1, Time2};
      _ -> is_open_time(Other, Now, Role)
    end.

-spec is_charge_war_order(#role{},
			  pos_integer()) -> boolean().

is_charge_war_order(Role = #role{m_war_order =
				     #m_war_order{period = Period,
						  card = CardL}},
		    ChargeId) ->
    case holiday_war_order_data:charge({Period, ChargeId})
	of
      CardId when is_integer(CardId) ->
	  case calc_day(Role) of
	    {Period, _, _, _} ->
		case lists:keyfind(CardId, 1, CardL) of
		  false -> true;
		  _ -> false
		end;
	    _ -> false
	  end;
      _ -> true
    end.


