-file("src/mod/hallows/hallows_look.erl", 1).

-module(hallows_look).

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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{hallows_look_data,
		 [id, name, attr, is_item, time, loss]},
		{hallows_looks, [ver, id, endtime, eqm_hallows]},
		{hallows_quest_data, [id, hid, items, progress]},
		{hallows_data,
		 [id, step, name, attr, loss, max_lucky, clear_limit,
		  clear_time, reward, notice, open_desc, skill_order]},
		{hallows_skill, [ver, pos, lev, skill_bid, attr]},
		{hallows,
		 [ver, id, step, lucky, lucky_endtime, power, base_attr,
		  add_attr, eqm, skill, seal, reward, rebirth_loss,
		  is_notice, look_id, refine_lev]},
		{m_hallows,
		 [ver, hallows_list, all_lv, attr_list, quest_list,
		  look_list, look_quest_list]},
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

-export([gm/2, login_online/1, login/1, get_look/2,
	 push_base/1, push_quest/1, push_quest/2, update_quest/3,
	 commit_quest/2, level_up/2, open_check/1, unlock/2,
	 dress/4, apply_look_timeout/2, calc_look_attr/1,
	 get_look_id/1, arena_elite_activate/1,
	 arena_cluster_champion_activate/1,
	 arena_peak_champion_activate/1]).

-export([gm_arena_elite_activate/0]).

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

-file("src/mod/hallows/hallows_look.erl", 32).

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

-file("src/mod/hallows/hallows_look.erl", 33).

-file("inc/hallows.hrl", 1).

-record(m_hallows,
	{ver = 3, hallows_list = [], all_lv = 0, attr_list = [],
	 quest_list = [], look_list = [], look_quest_list = []}).

-record(hallows,
	{ver = 4, id = 0, step = 0, lucky = 0,
	 lucky_endtime = 0, power = 0, base_attr = [],
	 add_attr = [], eqm = [], skill = [], seal = 0,
	 reward = [], rebirth_loss = [], is_notice = 0,
	 look_id = 0, refine_lev = 0}).

-record(hallows_skill,
	{ver = 1, pos = 0, lev = 0, skill_bid = 0, attr = []}).

-record(hallows_data,
	{id = 0, step = 0, name = <<>>, attr = [], loss = [],
	 max_lucky = 0, clear_limit = 0, clear_time = 0,
	 reward = [], notice = <<>>, open_desc = <<>>,
	 skill_order = []}).

-record(hallows_quest_data,
	{id = 0, hid = 0, items = [], progress = []}).

-record(hallows_looks,
	{ver = 1, id = 0, endtime = 0, eqm_hallows = 0}).

-record(hallows_look_data,
	{id = 0, name = <<>>, attr = [], is_item = 0, time = 0,
	 loss = []}).

-file("src/mod/hallows/hallows_look.erl", 34).

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

-file("src/mod/hallows/hallows_look.erl", 35).

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

-file("src/mod/hallows/hallows_look.erl", 36).

-file("inc/log.hrl", 1).

-file("src/mod/hallows/hallows_look.erl", 37).

-file("inc/timer.hrl", 1).

-record(timer,
	{id  :: term(), timeout = 1000  :: pos_integer(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 a = []  :: [term()], times = 1  :: integer(),
	 next_tick = 0  :: non_neg_integer(),
	 set_time = 1  :: pos_integer()}).

-record(rtimer,
	{ref  :: undefined | reference(),
	 key = 0  :: non_neg_integer(),
	 timers = []  :: [#timer{}]}).

-record(s_timer,
	{ref  :: undefined | reference(),
	 timers = []  :: [#timer{}]}).

-file("src/mod/hallows/hallows_look.erl", 38).

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

-file("src/mod/hallows/hallows_look.erl", 39).

gm_arena_elite_activate() ->
    role_group:apply(world,
		     {hallows_look, arena_elite_activate, []}).

gm(Role, {open, Id}) -> activate(Role, Id).

-spec login_online(#role{}) -> {ok, #role{}}.

login_online(Role = #role{m_hallows =
			      MHallows = #m_hallows{look_list = LookList,
						    look_quest_list =
							QuestList}}) ->
    NewQuestList = quest_revise:do_list(Role,
					hallows_look_quest, QuestList),
    NRole = set_look_timer(LookList,
			   Role#role{m_hallows =
					 MHallows#m_hallows{look_quest_list =
								NewQuestList}}),
    NRole1 = check_new_quest(NRole),
    NRole2 = compensate(NRole1, QuestList),
    NewRole = login_check_activate(NRole2),
    push_quest(NewRole),
    {ok, NewRole}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_hallows =
		       #m_hallows{look_list = LookList,
				  look_quest_list = QuestList}}) ->
    QuestList1 = quest_revise:do_list(Role,
				      hallows_look_quest, QuestList),
    {NewQuestList, Role1 = #role{m_hallows = MHallows}} =
	quest:load_quest(QuestList1, [], hallows_look_quest,
			 Role),
    NRole = set_look_timer(LookList,
			   Role1#role{m_hallows =
					  MHallows#m_hallows{look_quest_list =
								 NewQuestList}}),
    {ok, NRole1} = arena_elite_activate(NRole),
    NRole2 = check_new_quest(NRole1),
    NRole3 = compensate(NRole2, QuestList),
    NRole4 = login_check_activate(NRole3),
    {ok, NewRole} = arena_cluster_champion_activate(NRole4),
    {ok, NewRole2} = arena_peak_champion_activate(NewRole),
    {ok, NewRole2}.

-spec push_quest(#role{}) -> ok.

push_quest(Role = #role{m_hallows =
			    #m_hallows{look_quest_list = QuestList}}) ->
    CliList = [to_cli(I)
	       || I = #quest{id = Id} <- QuestList,
		  check_quest_to_cli(Role, Id)],
    sys_conn:pack_send(24128, {CliList}),
    ok.

-spec push_quest(#role{}, list()) -> ok.

push_quest(_Role, List) ->
    CliList = [to_cli(I) || I <- List],
    sys_conn:pack_send(24129, {CliList}),
    ok.

to_cli(#quest{id = Id, finish = Finish,
	      progress =
		  [#quest_progress{target_val = TarVal, value = Val}]}) ->
    {Id, Finish, TarVal, Val};
to_cli(#quest{id = Id, finish = Finish,
	      progress = []}) ->
    {Id, Finish, 1, 1}.

check_quest_to_cli(Role, Id) ->
    #hallows_quest_data{hid = HId} =
	hallows_data:get_look_quest(Id),
    get_look(Role, HId) == false.

-spec get_look(#role{},
	       pos_integer()) -> #hallows_looks{} | false.

get_look(#role{m_hallows =
		   #m_hallows{look_list = List}},
	 LookId) ->
    case lists:keyfind(LookId, #hallows_looks.id, List) of
      HallowsLook = #hallows_looks{} -> HallowsLook;
      false -> false
    end.

-spec push_base(#role{}) -> ok.

push_base(#role{m_hallows =
		    #m_hallows{look_list = LookList}}) ->
    sys_conn:pack_send(24125, {LookList}), ok.

-spec push_base(#role{}, pos_integer()) -> ok.

push_base(Role, LookId) ->
    HallowsLook = get_look(Role, LookId),
    sys_conn:pack_send(24126, {HallowsLook}),
    ok.

-spec arena_elite_activate(#role{}) -> {ok, #role{}}.

arena_elite_activate(Role) ->
    case arena_elite_lib:get_rank_info(Role) of
      {0, 0, _, _} -> {ok, Role};
      {MyRank, AwardLev, EndTime2, EndTime} ->
	  Role1 = arena_elite_activate(Role, AwardLev, EndTime2),
	  Role2 = avatar:arena_elite_activate(Role1, AwardLev,
					      EndTime2),
	  NRole = honor:arena_elite_activate(Role2, MyRank,
					     EndTime),
	  {ok, NRole};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhallows_look129, _,
	     {__Levelhallows_look129, __Traceshallows_look129}}
		when __Levelhallows_look129 band 8 /= 0 orelse
		       __Traceshallows_look129 /= [] ->
		lager:do_log(error,
			     [{module, hallows_look},
			      {function, arena_elite_activate}, {line, 129},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts调用获取精英赛激活超时", [Role#role.name]),
			     none, 4096, 8, __Levelhallows_look129,
			     __Traceshallows_look129, lager_event,
			     __Pidhallows_look129);
	    _ -> ok
	  end,
	  {ok, Role}
    end.

-spec arena_elite_activate(#role{}, pos_integer(),
			   pos_integer()) -> #role{}.

arena_elite_activate(Role = #role{m_hallows =
				      MHallows = #m_hallows{look_list = List}},
		     Lev, EndTime) ->
    case arena_elite_data:get_hallows_look(Lev) of
      LookId when is_integer(LookId) andalso LookId =/= 0 ->
	  case hallows_data:get_look(LookId) of
	    #hallows_look_data{} ->
		case get_look(Role, LookId) of
		  false ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidhallows_look142, _,
			 {__Levelhallows_look142, __Traceshallows_look142}}
			    when __Levelhallows_look142 band 64 /= 0 orelse
				   __Traceshallows_look142 /= [] ->
			    lager:do_log(info,
					 [{module, hallows_look},
					  {function, arena_elite_activate},
					  {line, 142},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】激活了【Id:~w】【段位:~w】【时间:~w】幻化",
						       [Role#role.name, LookId,
							Lev, EndTime]),
					 none, 4096, 64, __Levelhallows_look142,
					 __Traceshallows_look142, lager_event,
					 __Pidhallows_look142);
			_ -> ok
		      end,
		      NewHallowsLook = #hallows_looks{id = LookId,
						      endtime = EndTime},
		      NewList = lists:keystore(LookId, #hallows_looks.id,
					       List, NewHallowsLook),
		      NRoleT = Role#role{m_hallows =
					     MHallows#m_hallows{look_list =
								    NewList}},
		      NRole = hallows:calc_all_hallows_attr(NRoleT),
		      NewRole = set_look_timer(NewList, NRole),
		      push_base(NewRole, LookId),
		      case is_push(Role) of
			true -> sys_conn:pack_send(24127, {NewHallowsLook});
			_ -> skip
		      end,
		      NewRole;
		  #hallows_looks{endtime = 0} -> Role;
		  #hallows_looks{endtime = EndTime} -> Role;
		  HallowsLook = #hallows_looks{endtime = OldEndTime} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidhallows_look159, _,
			 {__Levelhallows_look159, __Traceshallows_look159}}
			    when __Levelhallows_look159 band 64 /= 0 orelse
				   __Traceshallows_look159 /= [] ->
			    lager:do_log(info,
					 [{module, hallows_look},
					  {function, arena_elite_activate},
					  {line, 159},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】【段位:~w】获得了不同时间版本的神器幻化【Id:~w】【老时间:~w】【新时间"
						       ":~w】",
						       [Role#role.name, Lev,
							LookId, OldEndTime,
							EndTime]),
					 none, 4096, 64, __Levelhallows_look159,
					 __Traceshallows_look159, lager_event,
					 __Pidhallows_look159);
			_ -> ok
		      end,
		      NewEndTime = util:if_true(OldEndTime =:= 0 orelse
						  OldEndTime >= EndTime,
						OldEndTime, EndTime),
		      NewHallowsLook = HallowsLook#hallows_looks{endtime =
								     NewEndTime},
		      NewList = lists:keyreplace(LookId, #hallows_looks.id,
						 List, NewHallowsLook),
		      NRoleT = Role#role{m_hallows =
					     MHallows#m_hallows{look_list =
								    NewList}},
		      NRole = hallows:calc_all_hallows_attr(NRoleT),
		      NewRole = set_look_timer(NewList, NRole),
		      push_base(NewRole, LookId),
		      case is_push(Role) of
			true -> sys_conn:pack_send(24127, {NewHallowsLook});
			_ -> skip
		      end,
		      NewRole
		end;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidhallows_look174, _,
		   {__Levelhallows_look174, __Traceshallows_look174}}
		      when __Levelhallows_look174 band 8 /= 0 orelse
			     __Traceshallows_look174 /= [] ->
		      lager:do_log(error,
				   [{module, hallows_look},
				    {function, arena_elite_activate},
				    {line, 174}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("【~ts】尝试解锁不存在的精英幻化皮肤【~w】段位【~w】",
						 [Role#role.name, LookId, Lev]),
				   none, 4096, 8, __Levelhallows_look174,
				   __Traceshallows_look174, lager_event,
				   __Pidhallows_look174);
		  _ -> ok
		end,
		Role
	  end;
      _ -> Role
    end.

-spec arena_cluster_champion_activate(#role{}) -> {ok,
						   #role{}}.

arena_cluster_champion_activate(Role = #role{id =
						 RoleId}) ->
    List = sys_env:get(arena_cluster_champion_hallows_look,
		       []),
    Now = date:unixtime(),
    case lists:keyfind(RoleId, 1, List) of
      {RoleId, Rank, EndTime} when EndTime > Now ->
	  NRole = arena_cluster_champion_activate(Role, Rank,
						  EndTime),
	  {ok, NRole};
      _ -> {ok, Role}
    end.

-spec arena_cluster_champion_activate(#role{},
				      pos_integer(), pos_integer()) -> #role{}.

arena_cluster_champion_activate(Role = #role{m_hallows =
						 MHallows = #m_hallows{look_list
									   =
									   List}},
				Rank, EndTime) ->
    case Rank > 0 andalso
	   Rank =<
	     arena_cluster_champion_data:get_const(hallowskin_reward_rank)
	of
      true ->
	  LookId = 1,
	  case hallows_data:get_look(LookId) of
	    #hallows_look_data{} ->
		case get_look(Role, LookId) of
		  false ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidhallows_look204, _,
			 {__Levelhallows_look204, __Traceshallows_look204}}
			    when __Levelhallows_look204 band 64 /= 0 orelse
				   __Traceshallows_look204 /= [] ->
			    lager:do_log(info,
					 [{module, hallows_look},
					  {function,
					   arena_cluster_champion_activate},
					  {line, 204},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】激活了【Id:~w】【排名:~w】【时间:~w】幻化",
						       [Role#role.name, LookId,
							Rank, EndTime]),
					 none, 4096, 64, __Levelhallows_look204,
					 __Traceshallows_look204, lager_event,
					 __Pidhallows_look204);
			_ -> ok
		      end,
		      NewHallowsLook = #hallows_looks{id = LookId,
						      endtime = EndTime},
		      NewList = lists:keystore(LookId, #hallows_looks.id,
					       List, NewHallowsLook),
		      NRoleT = Role#role{m_hallows =
					     MHallows#m_hallows{look_list =
								    NewList}},
		      NRole = hallows:calc_all_hallows_attr(NRoleT),
		      NewRole = set_look_timer(NewList, NRole),
		      push_base(NewRole, LookId),
		      case is_push(Role) of
			true -> sys_conn:pack_send(24127, {NewHallowsLook});
			_ -> skip
		      end,
		      NewRole;
		  #hallows_looks{endtime = 0} -> Role;
		  #hallows_looks{endtime = EndTime} -> Role;
		  HallowsLook = #hallows_looks{endtime = OldEndTime} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidhallows_look221, _,
			 {__Levelhallows_look221, __Traceshallows_look221}}
			    when __Levelhallows_look221 band 64 /= 0 orelse
				   __Traceshallows_look221 /= [] ->
			    lager:do_log(info,
					 [{module, hallows_look},
					  {function,
					   arena_cluster_champion_activate},
					  {line, 221},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】【排名:~w】获得了不同时间版本的神器幻化【Id:~w】【老时间:~w】【新时间"
						       ":~w】",
						       [Role#role.name, Rank,
							LookId, OldEndTime,
							EndTime]),
					 none, 4096, 64, __Levelhallows_look221,
					 __Traceshallows_look221, lager_event,
					 __Pidhallows_look221);
			_ -> ok
		      end,
		      NewEndTime = util:if_true(OldEndTime =:= 0 orelse
						  OldEndTime >= EndTime,
						OldEndTime, EndTime),
		      NewHallowsLook = HallowsLook#hallows_looks{endtime =
								     NewEndTime},
		      NewList = lists:keyreplace(LookId, #hallows_looks.id,
						 List, NewHallowsLook),
		      NRoleT = Role#role{m_hallows =
					     MHallows#m_hallows{look_list =
								    NewList}},
		      NRole = hallows:calc_all_hallows_attr(NRoleT),
		      NewRole = set_look_timer(NewList, NRole),
		      push_base(NewRole, LookId),
		      case is_push(Role) of
			true -> sys_conn:pack_send(24127, {NewHallowsLook});
			_ -> skip
		      end,
		      NewRole
		end;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidhallows_look236, _,
		   {__Levelhallows_look236, __Traceshallows_look236}}
		      when __Levelhallows_look236 band 8 /= 0 orelse
			     __Traceshallows_look236 /= [] ->
		      lager:do_log(error,
				   [{module, hallows_look},
				    {function, arena_cluster_champion_activate},
				    {line, 236}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("【~ts】尝试解锁不存在的跨服冠军赛幻化皮肤【~w】排名【~w】",
						 [Role#role.name, LookId,
						  Rank]),
				   none, 4096, 8, __Levelhallows_look236,
				   __Traceshallows_look236, lager_event,
				   __Pidhallows_look236);
		  _ -> ok
		end,
		Role
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhallows_look240, _,
	     {__Levelhallows_look240, __Traceshallows_look240}}
		when __Levelhallows_look240 band 8 /= 0 orelse
		       __Traceshallows_look240 /= [] ->
		lager:do_log(error,
			     [{module, hallows_look},
			      {function, arena_cluster_champion_activate},
			      {line, 240}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("【~ts】尝试解锁跨服冠军赛幻化皮肤排名【~w】却不足",
					   [Role#role.name, Rank]),
			     none, 4096, 8, __Levelhallows_look240,
			     __Traceshallows_look240, lager_event,
			     __Pidhallows_look240);
	    _ -> ok
	  end,
	  Role
    end.

-spec arena_peak_champion_activate(#role{}) -> {ok,
						#role{}}.

arena_peak_champion_activate(Role = #role{id =
					      RoleId}) ->
    List = sys_env:get(arena_peak_champion_hallows_look,
		       []),
    Now = date:unixtime(),
    case lists:keyfind(RoleId, 1, List) of
      {RoleId, Rank, EndTime} when EndTime > Now ->
	  NRole = arena_peak_champion_activate(Role, Rank,
					       EndTime),
	  {ok, NRole};
      _ -> {ok, Role}
    end.

-spec arena_peak_champion_activate(#role{},
				   pos_integer(), pos_integer()) -> #role{}.

arena_peak_champion_activate(Role = #role{m_hallows =
					      MHallows = #m_hallows{look_list =
									List}},
			     Rank, EndTime) ->
    case Rank > 0 andalso
	   Rank =<
	     arena_peak_champion_data:get_constant(hallowskin_reward_rank)
	of
      true ->
	  LookId = 4,
	  case hallows_data:get_look(LookId) of
	    #hallows_look_data{} ->
		case get_look(Role, LookId) of
		  false ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidhallows_look267, _,
			 {__Levelhallows_look267, __Traceshallows_look267}}
			    when __Levelhallows_look267 band 64 /= 0 orelse
				   __Traceshallows_look267 /= [] ->
			    lager:do_log(info,
					 [{module, hallows_look},
					  {function,
					   arena_peak_champion_activate},
					  {line, 267},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】激活了【Id:~w】【排名:~w】【时间:~w】幻化",
						       [Role#role.name, LookId,
							Rank, EndTime]),
					 none, 4096, 64, __Levelhallows_look267,
					 __Traceshallows_look267, lager_event,
					 __Pidhallows_look267);
			_ -> ok
		      end,
		      NewHallowsLook = #hallows_looks{id = LookId,
						      endtime = EndTime},
		      NewList = lists:keystore(LookId, #hallows_looks.id,
					       List, NewHallowsLook),
		      NRoleT = Role#role{m_hallows =
					     MHallows#m_hallows{look_list =
								    NewList}},
		      NRole = hallows:calc_all_hallows_attr(NRoleT),
		      NewRole = set_look_timer(NewList, NRole),
		      push_base(NewRole, LookId),
		      case is_push(Role) of
			true -> sys_conn:pack_send(24127, {NewHallowsLook});
			_ -> skip
		      end,
		      NewRole;
		  #hallows_looks{endtime = 0} -> Role;
		  #hallows_looks{endtime = EndTime} -> Role;
		  HallowsLook = #hallows_looks{endtime = OldEndTime} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidhallows_look284, _,
			 {__Levelhallows_look284, __Traceshallows_look284}}
			    when __Levelhallows_look284 band 64 /= 0 orelse
				   __Traceshallows_look284 /= [] ->
			    lager:do_log(info,
					 [{module, hallows_look},
					  {function,
					   arena_peak_champion_activate},
					  {line, 284},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】【排名:~w】获得了不同时间版本的神器幻化【Id:~w】【老时间:~w】【新时间"
						       ":~w】",
						       [Role#role.name, Rank,
							LookId, OldEndTime,
							EndTime]),
					 none, 4096, 64, __Levelhallows_look284,
					 __Traceshallows_look284, lager_event,
					 __Pidhallows_look284);
			_ -> ok
		      end,
		      NewEndTime = util:if_true(OldEndTime =:= 0 orelse
						  OldEndTime >= EndTime,
						OldEndTime, EndTime),
		      NewHallowsLook = HallowsLook#hallows_looks{endtime =
								     NewEndTime},
		      NewList = lists:keyreplace(LookId, #hallows_looks.id,
						 List, NewHallowsLook),
		      NRoleT = Role#role{m_hallows =
					     MHallows#m_hallows{look_list =
								    NewList}},
		      NRole = hallows:calc_all_hallows_attr(NRoleT),
		      NewRole = set_look_timer(NewList, NRole),
		      push_base(NewRole, LookId),
		      case is_push(Role) of
			true -> sys_conn:pack_send(24127, {NewHallowsLook});
			_ -> skip
		      end,
		      NewRole
		end;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidhallows_look299, _,
		   {__Levelhallows_look299, __Traceshallows_look299}}
		      when __Levelhallows_look299 band 8 /= 0 orelse
			     __Traceshallows_look299 /= [] ->
		      lager:do_log(error,
				   [{module, hallows_look},
				    {function, arena_peak_champion_activate},
				    {line, 299}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("【~ts】尝试解锁不存在的巅峰冠军赛幻化皮肤【~w】排名【~w】",
						 [Role#role.name, LookId,
						  Rank]),
				   none, 4096, 8, __Levelhallows_look299,
				   __Traceshallows_look299, lager_event,
				   __Pidhallows_look299);
		  _ -> ok
		end,
		Role
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhallows_look303, _,
	     {__Levelhallows_look303, __Traceshallows_look303}}
		when __Levelhallows_look303 band 8 /= 0 orelse
		       __Traceshallows_look303 /= [] ->
		lager:do_log(error,
			     [{module, hallows_look},
			      {function, arena_peak_champion_activate},
			      {line, 303}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("【~ts】尝试解锁巅峰冠军赛幻化皮肤排名【~w】却不足",
					   [Role#role.name, Rank]),
			     none, 4096, 8, __Levelhallows_look303,
			     __Traceshallows_look303, lager_event,
			     __Pidhallows_look303);
	    _ -> ok
	  end,
	  Role
    end.

activate(Role = #role{m_hallows =
			  MHallows = #m_hallows{look_list = List}},
	 LookId) ->
    Now = date:unixtime(),
    case hallows_data:get_look(LookId) of
      #hallows_look_data{time = Time} ->
	  EndTime = util:if_true(Time =:= 0, 0, Now + Time),
	  case get_look(Role, LookId) of
	    false ->
		NewHallowsLook = #hallows_looks{id = LookId,
						endtime = EndTime},
		NewList = lists:keystore(LookId, #hallows_looks.id,
					 List, NewHallowsLook),
		NRoleT = Role#role{m_hallows =
				       MHallows#m_hallows{look_list = NewList}},
		NRole = hallows:calc_all_hallows_attr(NRoleT),
		NewRole = set_look_timer(NewList, NRole),
		push_base(NewRole, LookId),
		case is_push(Role) of
		  true -> sys_conn:pack_send(24127, {NewHallowsLook});
		  _ -> skip
		end,
		{ok, NewRole};
	    HallowsLook = #hallows_looks{endtime = OldEndTime} ->
		NewEndTime = util:if_true(OldEndTime =:= 0 orelse
					    OldEndTime >= EndTime,
					  OldEndTime, EndTime),
		NewHallowsLook = HallowsLook#hallows_looks{endtime =
							       NewEndTime},
		NewList = lists:keyreplace(LookId, #hallows_looks.id,
					   List, NewHallowsLook),
		NRoleT = Role#role{m_hallows =
				       MHallows#m_hallows{look_list = NewList}},
		NRole = hallows:calc_all_hallows_attr(NRoleT),
		NewRole = set_look_timer(NewList, NRole),
		push_base(NewRole, LookId),
		case is_push(Role) of
		  true -> sys_conn:pack_send(24127, {NewHallowsLook});
		  _ -> skip
		end,
		{ok, NewRole}
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhallows_look341, _,
	     {__Levelhallows_look341, __Traceshallows_look341}}
		when __Levelhallows_look341 band 8 /= 0 orelse
		       __Traceshallows_look341 /= [] ->
		lager:do_log(error,
			     [{module, hallows_look}, {function, activate},
			      {line, 341}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("【~ts】尝试激活不存在的幻化神器【~w】",
					   [Role#role.name, LookId]),
			     none, 4096, 8, __Levelhallows_look341,
			     __Traceshallows_look341, lager_event,
			     __Pidhallows_look341);
	    _ -> ok
	  end,
	  {ok, Role}
    end.

-spec set_look_timer(#hallows_looks{} | list(),
		     #role{}) -> #role{}.

set_look_timer([Look | T], Role) ->
    set_look_timer(T, set_look_timer(Look, Role));
set_look_timer(#hallows_looks{id = Id,
			      endtime = EndTime},
	       Role)
    when EndTime =/= 0 ->
    Now = date:unixtime(),
    role_timer:set(#timer{id = {clear_look_timer, Id},
			  m = hallows_look, f = apply_look_timeout, a = [Id],
			  timeout = max(5, EndTime - Now + 5) * 1000},
		   Role);
set_look_timer(_Look, Role) -> Role.

-spec apply_look_timeout(#role{}, pos_integer()) -> {ok,
						     #role{}} |
						    ok.

apply_look_timeout(Role = #role{m_hallows =
				    MHallows = #m_hallows{look_list =
							      LookList}},
		   LookId) ->
    Now = date:unixtime(),
    case lists:keyfind(LookId, #hallows_looks.id, LookList)
	of
      #hallows_looks{endtime = 0} -> ok;
      #hallows_looks{endtime = EndTime,
		     eqm_hallows = HallowsId}
	  when Now >= EndTime ->
	  NewLookList = lists:keydelete(LookId, #hallows_looks.id,
					LookList),
	  NRole = Role#role{m_hallows =
				MHallows#m_hallows{look_list = NewLookList}},
	  NRoleT = hallows:calc_all_hallows_attr(NRole),
	  NewRole = replace_hallows(NRoleT, HallowsId, 0),
	  sys_conn:pack_send(24133, {LookId}),
	  {ok, NewRole};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhallows_look370, _,
	     {__Levelhallows_look370, __Traceshallows_look370}}
		when __Levelhallows_look370 band 8 /= 0 orelse
		       __Traceshallows_look370 /= [] ->
		lager:do_log(error,
			     [{module, hallows_look},
			      {function, apply_look_timeout}, {line, 370},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts的神器幻化~w不存在，却执行过期操作",
					   [Role#role.name, LookId]),
			     none, 4096, 8, __Levelhallows_look370,
			     __Traceshallows_look370, lager_event,
			     __Pidhallows_look370);
	    _ -> ok
	  end,
	  ok
    end.

-spec update_quest(#role{}, #quest{},
		   #quest_progress{}) -> #role{}.

update_quest(Role = #role{m_hallows =
			      MHallows = #m_hallows{look_quest_list =
							QuestList}},
	     Q = #quest{id = QuestId, progress = P},
	     Progress = #quest_progress{id = ProgressId}) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    P, Progress),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuestList = lists:keyreplace(QuestId, #quest.id,
					  QuestList, NewQuest),
	  NewRole = Role#role{m_hallows =
				  MHallows#m_hallows{look_quest_list =
							 NewQuestList}},
	  push_quest(NewRole, [NewQuest]),
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuestList = lists:keyreplace(QuestId, #quest.id,
					  QuestList, NewQuest),
	  push_quest(Role, [NewQuest]),
	  Role#role{m_hallows =
			MHallows#m_hallows{look_quest_list = NewQuestList}}
    end.

check_new_quest(Role = #role{lev = RLev,
			     m_hallows = #m_hallows{hallows_list = List}}) ->
    case length(List) >= 5 andalso
	   RLev >= hallows_data:get_const(illusion_open)
	of
      true ->
	  do_check_new_quest(hallows_data:look_list_quest(),
			     Role);
      _ -> Role
    end.

do_check_new_quest([], Role) -> Role;
do_check_new_quest([Id | T],
		   Role = #role{m_hallows =
				    MHallows = #m_hallows{look_quest_list =
							      QuestList,
							  look_list =
							      LookList}}) ->
    #hallows_quest_data{hid = HId, progress = Progress} =
	hallows_data:get_look_quest(Id),
    case lists:keymember(HId, #hallows_looks.id, LookList)
	of
      true -> do_check_new_quest(T, Role);
      false ->
	  case lists:keymember(Id, #quest.id, QuestList) of
	    true -> do_check_new_quest(T, Role);
	    _ ->
		Progress1 = quest_prog_init:do(Role, Progress, Id),
		Finish = case [false
			       || #quest_progress{finish = 0} <- Progress1]
			     of
			   [] -> 1;
			   _ -> 0
			 end,
		{NewProgress, Role1} = quest:load_progress(Progress1,
							   hallows_look_quest,
							   Id, [], Role),
		NewQuest = #quest{id = Id, finish = Finish,
				  progress = NewProgress},
		NewQuestList = [NewQuest | QuestList],
		NRole = Role1#role{m_hallows =
				       MHallows#m_hallows{look_quest_list =
							      NewQuestList}},
		do_check_new_quest(T, NRole)
	  end
    end.

-spec level_up(#role{}, #role{}) -> {ok, #role{}}.

level_up(_,
	 Role = #role{m_hallows =
			  #m_hallows{look_quest_list = [], look_list = []}}) ->
    {ok, open_check(Role)};
level_up(_, Role) -> {ok, Role}.

-spec open_check(#role{}) -> #role{}.

open_check(Role) ->
    NRole = check_new_quest(Role), push_quest(NRole), NRole.

-spec commit_quest(#role{},
		   Id :: pos_integer()) -> {false, binary()} |
					   {ok, #role{}}.

commit_quest(Role = #role{m_hallows =
			      MHallows = #m_hallows{look_quest_list =
							QuestList}},
	     Id) ->
    case hallows_data:get_look_quest(Id) of
      #hallows_quest_data{items = Items, hid = HId} ->
	  case lists:keyfind(Id, #quest.id, QuestList) of
	    #quest{finish = 2} ->
		{false, lang:get(<<"任务已提交"/utf8>>)};
	    Q = #quest{finish = 1} ->
		GL = format:val_to_gain(Items, hallows_quest),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      NewQuest = Q#quest{finish = 2},
		      NewQuestList = lists:keyreplace(Id, #quest.id,
						      QuestList, NewQuest),
		      Role2 = Role1#role{m_hallows =
					     MHallows#m_hallows{look_quest_list
								    =
								    NewQuestList}},
		      push_quest(Role2, [NewQuest]),
		      NRole = check_activate(Role2, HId),
		      log:log_gain(GL, Role, NRole, <<"神器幻化任务"/utf8>>,
				   util:fbin("id:~w", [Id])),
		      {ok, NRole}
		end;
	    #quest{} -> {false, lang:get(<<"任务未完成"/utf8>>)};
	    _ -> {false, lang:get(<<"任务不存在"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"奖励已通过邮件发放，请重新登录"/utf8>>)}
    end.

check_activate(Role = #role{m_hallows =
				#m_hallows{look_quest_list = QuestList}},
	       HId) ->
    Fun = fun (QId) ->
		  case lists:keyfind(QId, #quest.id, QuestList) of
		    #quest{finish = 2} -> true;
		    _ -> false
		  end
	  end,
    case lists:all(Fun, hallows_data:look_type_quest(HId))
	of
      true ->
	  case activate(Role, HId) of
	    {ok, NRole} -> NRole;
	    _ -> Role
	  end;
      _ -> Role
    end.

-spec unlock(#role{}, pos_integer()) -> {ok, #role{}} |
					{false, binary()}.

unlock(Role, LookId) ->
    case hallows_data:get_look(LookId) of
      #hallows_look_data{is_item = 1, loss = LossCfg} ->
	  Loss = format:val_to_loss(LossCfg, hallows_look_unlock),
	  case role_gain:do(Role, Loss) of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		{ok, NRole} = activate(Role1, LookId),
		log:log_gain(Loss, Role, NRole, <<"解锁神器幻化"/utf8>>,
			     util:fbin("id:~w", [LookId])),
		{ok, NRole}
	  end;
      _ -> {false, lang:get(<<"无法使用该方法解锁"/utf8>>)}
    end.

-spec dress(#role{}, pos_integer(), pos_integer(),
	    pos_integer()) -> {false, binary()} | {ok, #role{}}.

dress(Role, LookId, HallowsId, 1) ->
    case get_look(Role, LookId) of
      false -> {false, lang:get(<<"该幻化不存在"/utf8>>)};
      #hallows_looks{eqm_hallows = OldHallowsId} ->
	  case hallows:get_hallows(Role, HallowsId) of
	    false -> {false, lang:get(<<"圣器不存在"/utf8>>)};
	    #hallows{look_id = OldLookId} ->
		Role1 = replace_look(Role, OldLookId, 0),
		Role2 = replace_hallows(Role1, OldHallowsId, 0),
		Role3 = replace_look(Role2, LookId, HallowsId),
		NRole = replace_hallows(Role3, HallowsId, LookId),
		{ok, NRole}
	  end
    end;
dress(Role, LookId, _, 2) ->
    case get_look(Role, LookId) of
      false -> {false, lang:get(<<"该幻化不存在"/utf8>>)};
      #hallows_looks{eqm_hallows = OldHallowsId} ->
	  Role1 = replace_look(Role, LookId, 0),
	  NRole = replace_hallows(Role1, OldHallowsId, 0),
	  {ok, NRole}
    end;
dress(_, _, _, _) ->
    {fales, lang:get(<<"没有这种操作哟"/utf8>>)}.

replace_look(Role, 0, _) -> Role;
replace_look(Role = #role{m_hallows =
			      MHallows = #m_hallows{look_list = LookList}},
	     LookId, NewHallowsId) ->
    case get_look(Role, LookId) of
      Look = #hallows_looks{} ->
	  NewLook = Look#hallows_looks{eqm_hallows =
					   NewHallowsId},
	  NewLookList = lists:keyreplace(LookId,
					 #hallows_looks.id, LookList, NewLook),
	  NRole = Role#role{m_hallows =
				MHallows#m_hallows{look_list = NewLookList}},
	  push_base(NRole, LookId),
	  NRole;
      _ -> Role
    end.

replace_hallows(Role, 0, _) -> Role;
replace_hallows(Role = #role{m_hallows =
				 MHallows = #m_hallows{hallows_list =
							   HallowsList}},
		HallowsId, LookId) ->
    case hallows:get_hallows(Role, HallowsId) of
      Hallows = #hallows{} ->
	  NewHallows = Hallows#hallows{look_id = LookId},
	  NewHallowsList = lists:keyreplace(HallowsId,
					    #hallows.id, HallowsList,
					    NewHallows),
	  NRole = Role#role{m_hallows =
				MHallows#m_hallows{hallows_list =
						       NewHallowsList}},
	  hallows:push_base(NRole, HallowsId),
	  NRole;
      _ -> Role
    end.

-spec calc_look_attr(#role{} | list()) -> list().

calc_look_attr(#role{m_hallows =
			 #m_hallows{look_list = LookList}}) ->
    calc_look_attr(LookList, []);
calc_look_attr(LookIdList) when is_list(LookIdList) ->
    calc_look_attr(LookIdList, []).

calc_look_attr([], Attr) -> Attr;
calc_look_attr([#hallows_looks{id = Id} | Other],
	       Attr) ->
    LooksAttr = hallows_data:get_look_attr(Id),
    NewAttr = item_lib:merge(LooksAttr, Attr),
    calc_look_attr(Other, NewAttr);
calc_look_attr([Id | Other], Attr)
    when is_integer(Id) ->
    LooksAttr = hallows_data:get_look_attr(Id),
    NewAttr = item_lib:merge(LooksAttr, Attr),
    calc_look_attr(Other, NewAttr).

-spec get_look_id(#role{}) -> list().

get_look_id(#role{m_hallows =
		      #m_hallows{look_list = List}}) ->
    [Id || #hallows_looks{id = Id} <- List];
get_look_id(#role_robot{m_hallows =
			    #m_hallows{look_list = List}}) ->
    [Id || #hallows_looks{id = Id} <- List].

is_push(#role{lev = RLev,
	      m_hallows = #m_hallows{hallows_list = List}}) ->
    length(List) >= 5 andalso
      RLev >= hallows_data:get_const(illusion_open).

login_check_activate(Role) ->
    HId = 2,
    case get_look(Role, HId) of
      #hallows_looks{} -> Role;
      _ -> NRole = check_activate(Role, HId), NRole
    end.

compensate(Role = #role{m_hallows =
			    #m_hallows{look_quest_list = QuestList}},
	   OldQuestList) ->
    FinishNum = length([QId
			|| #quest{id = QId, finish = 1} <- OldQuestList,
			   not lists:keymember(QId, #quest.id, QuestList)]),
    case FinishNum =/= 0 of
      true ->
	  {ok, RoleT} = mail:add(Role,
				 {lang:get(<<"神器任务奖励发放"/utf8>>),
				  lang:get(<<"亲爱的冒险者，由于本次神器任务调整，您有部分奖励未领取，特通过邮件发放，请查收！"/utf8>>),
				  [{3, min(100, 50 * FinishNum)}], [],
				  lang:get(<<"神器幻化任务补进度"/utf8>>),
				  86400 + date:unixtime()}),
	  RoleT;
      _ -> Role
    end.


